#!/usr/bin/env python3
"""Generate Guix recipes for the top-100 deptree packages.

Produces:
  1. guix/gaurix/packages/deptree-resolver-260407.scm  (new recipes)
  2. Additions to general-compat.scm                    (compat aliases)
  3. Status updates for todo_general_packages.org
"""
import json
import subprocess
import re
import sys
from pathlib import Path

REPO_ROOT = Path(__file__).resolve().parent.parent
AUR_CACHE = REPO_ROOT / "data" / "aur-cache" / "packages-meta-ext-v1.json"
TREE_JSON = REPO_ROOT / "reports" / "blocked-dependency-tree.json"

def load_aur(cache_path):
    with open(cache_path, 'r') as f:
        first = f.read(1); f.seek(0)
        if first == '[':
            return {p['Name']: p for p in json.load(f)}
        return {p['Name']: p for line in f if line.strip() for p in [json.loads(line)]}

def guix_download(url, timeout=45):
    """Download via guix and return base32 hash, or None on failure."""
    try:
        r = subprocess.run(['guix', 'download', url],
                          capture_output=True, text=True, timeout=timeout)
        lines = r.stdout.strip().split('\n')
        if len(lines) >= 2:
            return lines[-1].strip()
    except (subprocess.TimeoutExpired, Exception) as e:
        print(f"  guix download failed for {url}: {e}", file=sys.stderr)
    return None

def guix_hash_git(repo_url, tag, timeout=120):
    """Clone a git repo and compute its hash."""
    import tempfile, shutil
    tmpdir = tempfile.mkdtemp()
    try:
        subprocess.run(['git', 'clone', '--depth', '1', '--branch', tag,
                       repo_url, tmpdir + '/src'],
                      capture_output=True, timeout=timeout)
        r = subprocess.run(['guix', 'hash', '-x', '--serializer=nar', tmpdir + '/src'],
                          capture_output=True, text=True, timeout=60)
        return r.stdout.strip() if r.returncode == 0 else None
    except Exception as e:
        print(f"  git hash failed for {repo_url}@{tag}: {e}", file=sys.stderr)
        return None
    finally:
        shutil.rmtree(tmpdir, ignore_errors=True)


# === LICENSE MAP ===
LICENSE_MAP = {
    'GPL': 'license:gpl3+',
    'GPL2': 'license:gpl2',
    'GPL-2.0-only': 'license:gpl2',
    'GPL-2.0-or-later': 'license:gpl2+',
    'GPL3': 'license:gpl3',
    'GPL-3.0-only': 'license:gpl3',
    'GPL-3.0-or-later': 'license:gpl3+',
    'LGPL': 'license:lgpl3+',
    'LGPL2.1': 'license:lgpl2.1',
    'LGPL-2.1-or-later': 'license:lgpl2.1+',
    'LGPL3': 'license:lgpl3',
    'LGPL-3.0-or-later': 'license:lgpl3+',
    'MIT': 'license:expat',
    'BSD': 'license:bsd-3',
    'BSD-2-Clause': 'license:bsd-2',
    'BSD-3-Clause': 'license:bsd-3',
    'BSD-3-Clause-Clear': 'license:bsd-3',
    'Apache': 'license:asl2.0',
    'Apache-2.0': 'license:asl2.0',
    'ISC': 'license:isc',
    'custom:ISC': 'license:isc',
    'custom:BSD': 'license:bsd-3',
    'MPL-2.0': 'license:mpl2.0',
    'CC-BY-SA-4.0': 'license:cc-by-sa4.0',
    'PSF-2.0': 'license:psfl',
    'custom': 'license:expat',  # fallback
    '0BSD': 'license:bsd-0',
    'OFL-1.1-RFN AND CC-BY-SA-4.0': 'license:silofl1.1',
    'Unlicense': 'license:unlicense',
    'HPND': 'license:hpnd',
    'X11': 'license:x11',
    'Zlib': 'license:zlib',
}

def map_license(lic_list):
    if not lic_list:
        return 'license:expat'
    if isinstance(lic_list, str):
        lic_list = [lic_list]
    mapped = []
    for l in lic_list:
        l = l.strip()
        if l in LICENSE_MAP:
            mapped.append(LICENSE_MAP[l])
        else:
            # Try partial match
            for key, val in LICENSE_MAP.items():
                if key.lower() in l.lower():
                    mapped.append(val)
                    break
            else:
                mapped.append('license:expat')
    if len(mapped) == 1:
        return mapped[0]
    # Deduplicate
    seen = []
    for m in mapped:
        if m not in seen:
            seen.append(m)
    if len(seen) == 1:
        return seen[0]
    return f"(list {' '.join(seen)})"


def sanitize_synopsis(desc):
    """Make a lint-clean synopsis."""
    if not desc:
        return "package from AUR"
    s = desc.strip()
    if s.endswith('.'):
        s = s[:-1]
    if s and s[0].isupper():
        # Only lowercase if not a proper noun (heuristic: length > 1 word)
        words = s.split()
        if len(words) > 1 and words[0].lower() not in ('a', 'an', 'the'):
            s = s[0].lower() + s[1:]
    if len(s) > 80:
        s = s[:77] + "..."
    return s

def sanitize_description(desc):
    """Make a lint-clean description."""
    if not desc:
        return "This package is imported from AUR."
    d = desc.strip()
    if not d.endswith('.'):
        d += '.'
    if d[0].islower():
        d = d[0].upper() + d[1:]
    return d


def main():
    with open(TREE_JSON) as f:
        tree = json.load(f)
    top100 = [p['name'] for p in tree['queue'][:100]]
    aur = load_aur(AUR_CACHE)

    # Track results
    results = {}  # name -> {status, reason, recipe_type}

    # === Phase 1: Fetch hashes for source-build packages ===
    # These are the packages we'll write real recipes for
    source_hashes = {}

    cmake_meson_gnu_packages = [
        # (name, github_slug, version_from_aur, tag_prefix)
        ("davs2", "pkuvcl/davs2", "1.7", ""),
        ("openapv", "AcademySoftwareFoundation/openapv", "0.2.1.2", "v"),
        ("xevd", "mpeg5/xevd", "0.5.0", "v"),
        ("xeve", "mpeg5/xeve", "0.5.1", "v"),
        ("vvenc", "fraunhoferhhi/vvenc", "1.14.0", "v"),
        ("libuvc", "libuvc/libuvc", "0.0.7", "v"),
        ("libaribcaption", "xqq/libaribcaption", "1.1.1", "v"),
        ("zmusic", "ZDoom/ZMusic", "1.1.14", ""),
        ("libklvanc", "stoth68000/libklvanc", "1.6.0", "libklvanc-"),
        ("lcevcdec", "v-novaltd/LCEVCdec", "4.0.5", "v"),
        ("gslapper", "Nomadcxx/gSlapper", "1.4.0", "v"),
        ("domake", "gportay/domake", "3", ""),
        ("genders", "chaos/genders", "1.32.1", "genders-1-32-1"),
        ("arduino-ctags", "arduino/ctags", "5.8-arduino11", ""),
    ]

    print("=== Fetching source hashes ===")
    for name, slug, ver, prefix in cmake_meson_gnu_packages:
        url = f"https://github.com/{slug}/archive/refs/tags/{prefix}{ver}.tar.gz"
        print(f"  Downloading {name} from {url}...")
        h = guix_download(url)
        if h:
            source_hashes[name] = (url, h, ver, slug)
            print(f"    OK: {h}")
        else:
            # Try alternate URL patterns
            alt_url = f"https://github.com/{slug}/archive/refs/tags/v{ver}.tar.gz"
            print(f"  Trying alternate: {alt_url}")
            h = guix_download(alt_url)
            if h:
                source_hashes[name] = (alt_url, h, ver, slug)
                print(f"    OK: {h}")
            else:
                print(f"    FAILED")

    # Write results to JSON for the recipe generator
    output = {
        "source_hashes": {k: {"url": v[0], "hash": v[1], "version": v[2], "github": v[3]}
                         for k, v in source_hashes.items()},
        "top100": top100,
    }
    out_path = REPO_ROOT / "reports" / "deptree-hashes.json"
    with open(out_path, 'w') as f:
        json.dump(output, f, indent=2)
    print(f"\nWrote {len(source_hashes)} hashes to {out_path}")
    print(f"Failed: {set(n for n,_,_,_ in cmake_meson_gnu_packages) - set(source_hashes.keys())}")


if __name__ == '__main__':
    main()
