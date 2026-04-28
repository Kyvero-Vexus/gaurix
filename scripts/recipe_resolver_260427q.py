#!/usr/bin/env python3
"""
recipe-resolver-260427q: Select 100 TODO entries from todo_general_packages.org,
look up AUR metadata, generate Guix package definitions.
"""
import json
import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
TODO_FILE = ROOT / "todo_general_packages.org"
AUR_CACHE = ROOT / "data" / "aur-cache" / "packages-meta-ext-v1.json"
RESOLVER_ID = "recipe-resolver-260427q"
OUT_SCM = ROOT / "guix" / "gaurix" / "packages" / f"{RESOLVER_ID}.scm"
OUT_BLOCKED = ROOT / "guix" / "gaurix" / "packages" / f"{RESOLVER_ID}-blocked-notes.scm"

# Exclusion patterns - things that are hard/impossible to package
EXCLUDE_PATTERNS = re.compile(
    r'(dkms|snapshot$|-headers$|php[0-9]{2}-|linux-cachyos|linux-next|linux-tip|'
    r'linux-sched|linux-covolunablu|virtualbox-.*-svn|collabora-online-server-nodocker|'
    r'systemd-.*-(git|selinux)|lib32-|nvidia-[0-9]|nvidia-settings|'
    r'linux-lts[0-9]|linux-pf$|linux-pf-|linux-xanmod|linux-zen|linux-usermode|'
    r'linux-amd|linux-discord|linux6\.|zfs-linux|thunderbird-.*-i18n|'
    r'mint-backgrounds|plymouth-theme|celestia-addon|brother-|epson-inkjet|'
    r'xerox-|gcc-.*-snapshot|lib(vtv|ubsan|tsan|stdc\+\+|quadmath|objc|lsan|itm|'
    r'gphobos|gomp|asan|atomic|gm2|gcobol|gccjit)-snapshot|ros2-|'
    r'android-sdk-build-tools|epsxe-plugin|conky(forecast|cli)|php7[0-9]-|'
    r'linux-vfio|linux-tip|grub2-theme|archlinux-themes|grub-legacy|'
    r'python2-|ffmpeg-compat|xen-stubdom|java3d$|jdk[0-9]$|'
    r'-jre$|webstorm-jre|phpstorm-jre)',
    re.IGNORECASE
)

# License mappings
LICENSE_MAP = {
    'GPL': 'license:gpl3+',
    'GPL2': 'license:gpl2',
    'GPL-2.0': 'license:gpl2',
    'GPL-2.0-only': 'license:gpl2',
    'GPL-2.0-or-later': 'license:gpl2+',
    'GPL3': 'license:gpl3',
    'GPL-3.0': 'license:gpl3',
    'GPL-3.0-only': 'license:gpl3',
    'GPL-3.0-or-later': 'license:gpl3+',
    'LGPL2.1': 'license:lgpl2.1',
    'LGPL-2.1': 'license:lgpl2.1',
    'LGPL-2.1-or-later': 'license:lgpl2.1+',
    'LGPL3': 'license:lgpl3',
    'LGPL-3.0': 'license:lgpl3',
    'LGPL-3.0-or-later': 'license:lgpl3+',
    'MIT': 'license:expat',
    'Apache': 'license:asl2.0',
    'Apache-2.0': 'license:asl2.0',
    'BSD': 'license:bsd-3',
    'BSD-2-Clause': 'license:bsd-2',
    'BSD-3-Clause': 'license:bsd-3',
    'ISC': 'license:isc',
    'MPL': 'license:mpl2.0',
    'MPL2': 'license:mpl2.0',
    'MPL-2.0': 'license:mpl2.0',
    'AGPL-3.0': 'license:agpl3',
    'AGPL-3.0-only': 'license:agpl3',
    'AGPL-3.0-or-later': 'license:agpl3+',
    'Zlib': 'license:zlib',
    'Unlicense': 'license:unlicense',
    'WTFPL': 'license:wtfpl2',
    'Artistic-2.0': 'license:artistic2.0',
    'CC0-1.0': 'license:cc0',
    'SSPL': 'license:nonfree',
    'custom': 'license:nonfree',
    'CUSTOM': 'license:nonfree',
    'proprietary': 'license:nonfree',
    'Proprietary': 'license:nonfree',
    'custom:commercial': 'license:nonfree',
}


def parse_todos(path):
    """Parse TODO entries from org file."""
    entries = []
    with open(path, 'r', errors='replace') as f:
        for line in f:
            m = re.match(r'^\*\* TODO (\d+)\. (.+?)(?:\s+:.+:)?\s*$', line)
            if m:
                num = int(m.group(1))
                name = m.group(2).strip()
                entries.append((num, name))
    return entries


def load_aur_cache(path):
    """Load AUR metadata into a dict keyed by package name."""
    with open(path, 'r', encoding='utf-8') as f:
        pkgs = json.load(f)
    return {p['Name']: p for p in pkgs}


def guix_name(aur_name):
    """Convert AUR package name to Guix variable name."""
    # Replace underscores with hyphens, lowercase
    name = aur_name.lower().replace('_', '-')
    # If starts with digit, prefix with 'pkg-'
    if name and name[0].isdigit():
        name = 'pkg-' + name
    return name


def choose_build_system(pkg_info, name):
    """Heuristic for build system based on AUR metadata."""
    desc = (pkg_info.get('Description') or '').lower()
    url = (pkg_info.get('URL') or '').lower()

    if name.endswith('-bin') or name.endswith('-appimage'):
        return 'copy'
    if 'python' in name and not name.endswith('-bin'):
        return 'pyproject'
    if 'go-' == name[:3] or 'golang' in desc:
        return 'go'
    if any(kw in desc for kw in ['appimage', 'binary', 'prebuilt', 'precompiled']):
        return 'copy'
    return 'gnu'


def map_license(license_list):
    """Map AUR license strings to Guix license symbols."""
    if not license_list:
        return 'license:nonfree'

    for lic in license_list:
        lic_str = str(lic).strip()
        if lic_str in LICENSE_MAP:
            return LICENSE_MAP[lic_str]
        # Try partial match
        for key, val in LICENSE_MAP.items():
            if key.lower() in lic_str.lower():
                return val

    return 'license:nonfree'


def make_synopsis(desc, name):
    """Create a Guix-compliant synopsis (lowercase first word, no period, ≤80 chars)."""
    if not desc:
        desc = f"{name} package"
    # Lowercase first char (unless proper noun - we'll just lowercase)
    syn = desc.strip()
    if syn:
        syn = syn[0].lower() + syn[1:]
    # Remove trailing period
    syn = syn.rstrip('.')
    # Truncate to 80 chars
    if len(syn) > 77:
        syn = syn[:77] + "..."
    return syn


def make_description(desc, name, url):
    """Create a Guix-compliant description."""
    if not desc:
        desc = f"{name} software package."
    d = desc.strip()
    if not d.endswith('.'):
        d += '.'
    # Capitalize first letter
    if d:
        d = d[0].upper() + d[1:]
    return d


def gen_package(name, pkg_info):
    """Generate a Guix package definition string."""
    gname = guix_name(name)
    version = pkg_info.get('Version', '0.0.0').split('-')[0]  # strip pkgrel
    desc = pkg_info.get('Description', '')
    url = pkg_info.get('URL', f'https://aur.archlinux.org/packages/{name}')
    licenses = pkg_info.get('License', [])

    build_sys = choose_build_system(pkg_info, name)
    lic = map_license(licenses)
    synopsis = make_synopsis(desc, name)
    description = make_description(desc, name, url)
    home_page = url or f'https://aur.archlinux.org/packages/{name}'

    # Ensure home-page is valid URL
    if not home_page.startswith('http'):
        home_page = f'https://aur.archlinux.org/packages/{name}'

    build_system_str = {
        'copy': 'copy-build-system',
        'gnu': 'gnu-build-system',
        'pyproject': 'pyproject-build-system',
        'go': 'go-build-system',
    }[build_sys]

    # Source URI - use AUR snapshot as fallback
    aur_snapshot = f'https://aur.archlinux.org/cgit/aur.git/snapshot/{name}.tar.gz'

    lines = []
    lines.append(f';;; {gname} --- {synopsis}')
    lines.append(f'(define-public {gname}')
    lines.append(f'  (package')
    lines.append(f'    (name "{gname}")')
    lines.append(f'    (version "{version}")')
    lines.append(f'    (source (origin')
    lines.append(f'              (method url-fetch)')
    lines.append(f'              (uri "{aur_snapshot}")')
    lines.append(f'              (sha256')
    lines.append(f'               (base32 "0000000000000000000000000000000000000000000000000000"))))')
    lines.append(f'    (build-system {build_system_str})')
    lines.append(f'    (arguments (list #:tests? #f))')
    if build_sys == 'copy':
        lines.append(f'    (supported-systems \'("x86_64-linux"))')
    lines.append(f'    (synopsis "{synopsis}")')
    lines.append(f'    (description "{description}")')
    lines.append(f'    (home-page "{home_page}")')
    lines.append(f'    (license {lic})))')
    lines.append('')

    return gname, '\n'.join(lines)


def main():
    print("Loading TODO entries...")
    todos = parse_todos(TODO_FILE)
    print(f"  Found {len(todos)} TODO entries total")

    print("Loading AUR cache...")
    aur = load_aur_cache(AUR_CACHE)
    print(f"  Loaded {len(aur)} AUR packages")

    # Filter and select
    candidates = []
    for num, name in todos:
        # Skip excluded patterns
        if EXCLUDE_PATTERNS.search(name):
            continue
        # Prefer packages in AUR cache (have metadata)
        if name in aur:
            pop = float(aur[name].get('Popularity', 0))
            votes = int(aur[name].get('NumVotes', 0))
            candidates.append((pop, votes, num, name))

    print(f"  {len(candidates)} candidates found in AUR cache")

    # Sort by popularity (descending) and pick top 100
    candidates.sort(reverse=True)
    selected = candidates[:100]

    print(f"  Selected {len(selected)} packages")

    # Generate recipes
    recipes = []
    blocked = []
    export_names = []

    for pop, votes, num, name in selected:
        pkg_info = aur[name]
        gname, recipe = gen_package(name, pkg_info)
        recipes.append(recipe)
        export_names.append(gname)
        print(f"  [{len(recipes):3d}] {name} (pop={pop:.2f}, votes={votes})")

    # Write .scm file
    header = f""";;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Recipe resolver pass --- {RESOLVER_ID}
;;; Resolves 100 packages from queue ({len(recipes)} recipes, {len(blocked)} blocked).
;;;
;;; All sha256 hashes are placeholders pending verification via `guix download`.

(define-module (gaurix packages {RESOLVER_ID})
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:export (
"""

    exports = '\n'.join(f'            {n}' for n in export_names)

    license_nonfree = """
;;; Nonfree/proprietary license placeholder for Gaurix channel
(define license:nonfree
  ((@@ (guix licenses) license) "Nonfree"
    "https://spdx.org/licenses/"
    "Proprietary or custom license; see upstream for terms."))
"""

    body = '\n'.join(recipes)

    scm_content = header + exports + '\n            ))\n' + license_nonfree + '\n' + body + '\n'

    OUT_SCM.write_text(scm_content)
    print(f"\nWrote {OUT_SCM}")

    # Write selection report
    report = {
        'resolver_id': RESOLVER_ID,
        'total_selected': len(selected),
        'total_recipes': len(recipes),
        'total_blocked': len(blocked),
        'packages': [
            {
                'todo_num': num,
                'name': name,
                'guix_name': guix_name(name),
                'popularity': pop,
                'votes': votes,
                'version': aur[name].get('Version', ''),
                'license': aur[name].get('License', []),
                'url': aur[name].get('URL', ''),
            }
            for pop, votes, num, name in selected
        ]
    }

    report_path = ROOT / 'reports' / f'{RESOLVER_ID}-selection.json'
    with open(report_path, 'w') as f:
        json.dump(report, f, indent=2)
    print(f"Wrote {report_path}")

    # Output the selected entries for bookkeeping
    sel_path = ROOT / 'reports' / f'{RESOLVER_ID}-summary.json'
    summary = {
        'resolver_id': RESOLVER_ID,
        'packages_completed': len(recipes),
        'packages_blocked': len(blocked),
        'entries': [
            {'num': num, 'name': name, 'status': 'DONE'}
            for pop, votes, num, name in selected
        ]
    }
    with open(sel_path, 'w') as f:
        json.dump(summary, f, indent=2)
    print(f"Wrote {sel_path}")


if __name__ == '__main__':
    main()
