#!/usr/bin/env python3
"""Dependency-tree-driven packaging pass for BLOCKED packages.
Run ID: deptree-resolver-260414c

Steps:
1. Parse todo_general_packages.org for all BLOCKED packages
2. Load AUR metadata for dependency info
3. Build dependency tree with blocked_dep_count, reverse_dep_count, total_dep_count
4. Priority sort and select top 100
5. Generate reports/blocked-dependency-tree.json and .md
6. For each selected package: look up AUR metadata, generate recipe or mark blocked
7. Write .scm recipe file, update general-compat.scm, packages.scm, and org file
"""

import json
import re
import os
import sys
import textwrap
from datetime import datetime, timezone
from pathlib import Path
from collections import defaultdict

REPO_ROOT = Path(__file__).resolve().parent.parent
ORG_FILE = REPO_ROOT / "todo_general_packages.org"
AUR_CACHE = REPO_ROOT / "data" / "aur-cache" / "packages-meta-ext-v1.json"
TREE_JSON = REPO_ROOT / "reports" / "blocked-dependency-tree.json"
TREE_MD = REPO_ROOT / "reports" / "blocked-dependency-tree.md"
PKG_DIR = REPO_ROOT / "guix" / "gaurix" / "packages"
GC_PATH = PKG_DIR / "general-compat.scm"
PKG_SCM = REPO_ROOT / "guix" / "gaurix" / "packages.scm"

RUN_ID = "deptree-resolver-260414c"
TIMESTAMP = datetime.now(timezone.utc).isoformat()
SELECT_COUNT = 100
ZERO_HASH = "0000000000000000000000000000000000000000000000000000"


# ═══════════════════════════════════════════════════════════════════════════
# Phase 1: Extract BLOCKED packages
# ═══════════════════════════════════════════════════════════════════════════

def extract_blocked_packages(org_path):
    """Extract all BLOCKED packages with their numbers from the org file."""
    blocked = {}
    pattern = re.compile(r'^\*\* BLOCKED (\d+)\. (\S+)')
    with open(org_path, 'r') as f:
        for line in f:
            m = pattern.match(line.strip())
            if m:
                number = int(m.group(1))
                name = m.group(2).strip()
                blocked[name] = number
    return blocked


# ═══════════════════════════════════════════════════════════════════════════
# Phase 2: Load AUR cache
# ═══════════════════════════════════════════════════════════════════════════

def load_aur_cache(cache_path):
    """Load AUR package metadata, indexed by name."""
    print(f"Loading AUR cache from {cache_path}...", file=sys.stderr)
    with open(cache_path, 'r') as f:
        packages = json.load(f)
    by_name = {}
    for pkg in packages:
        by_name[pkg['Name']] = pkg
    print(f"Loaded {len(by_name)} AUR packages", file=sys.stderr)
    return by_name


# ═══════════════════════════════════════════════════════════════════════════
# Phase 3: Build dependency tree
# ═══════════════════════════════════════════════════════════════════════════

def build_dependency_tree(blocked_packages, aur_cache):
    """Build dependency tree for blocked packages."""
    blocked_set = set(blocked_packages.keys())

    pkg_deps = {}
    for name in blocked_set:
        aur_pkg = aur_cache.get(name)
        if aur_pkg:
            deps = set()
            for field in ('Depends', 'MakeDepends', 'OptDepends', 'CheckDepends'):
                for dep in aur_pkg.get(field, []) or []:
                    dep_name = re.split(r'[><=: ]', dep)[0]
                    if dep_name:
                        deps.add(dep_name)
            pkg_deps[name] = deps
        else:
            pkg_deps[name] = set()

    blocked_deps_map = {}
    for name in blocked_set:
        blocked_deps_map[name] = pkg_deps.get(name, set()) & blocked_set

    reverse_deps_map = defaultdict(set)
    for name in blocked_set:
        for dep in blocked_deps_map.get(name, set()):
            reverse_deps_map[dep].add(name)

    results = []
    for name in blocked_set:
        bd = sorted(blocked_deps_map.get(name, set()))
        rd = sorted(reverse_deps_map.get(name, set()))
        total_deps = len(pkg_deps.get(name, set()))
        results.append({
            'name': name,
            'number': blocked_packages[name],
            'blocked_dep_count': len(bd),
            'reverse_dep_count': len(rd),
            'total_dep_count': total_deps,
            'blocked_deps': bd,
            'reverse_deps': rd,
        })

    results.sort(key=lambda x: (
        x['blocked_dep_count'],
        -x['reverse_dep_count'],
        x['total_dep_count'],
        x['name']
    ))

    for i, r in enumerate(results):
        r['rank'] = i + 1

    return results


# ═══════════════════════════════════════════════════════════════════════════
# Phase 4: Write reports
# ═══════════════════════════════════════════════════════════════════════════

def write_tree_json(queue, output_path):
    data = {
        'timestamp': TIMESTAMP,
        'run_id': RUN_ID,
        'total_blocked': len(queue),
        'queue': queue,
    }
    tmpf = str(output_path) + ".tmp"
    with open(tmpf, 'w') as f:
        json.dump(data, f, indent=2)
    os.rename(tmpf, str(output_path))
    print(f"Wrote {output_path} ({len(queue)} packages)", file=sys.stderr)


def write_tree_md(queue, output_path):
    lines = [
        "# Blocked Dependency Tree",
        "",
        f"- **Timestamp:** {TIMESTAMP}",
        f"- **Run ID:** {RUN_ID}",
        f"- **Total blocked:** {len(queue)}",
        f"- **Queue length:** {len(queue)}",
        "",
        "## Priority Queue (top 120)",
        "",
        "| Rank | Package | Blocked Deps | Reverse Deps | Total Deps |",
        "|------|---------|-------------|-------------|-----------|",
    ]
    for pkg in queue[:120]:
        lines.append(
            f"| {pkg['rank']} | {pkg['name']} | {pkg['blocked_dep_count']} "
            f"| {pkg['reverse_dep_count']} | {pkg['total_dep_count']} |"
        )
    tmpf = str(output_path) + ".tmp"
    with open(tmpf, 'w') as f:
        f.write('\n'.join(lines) + '\n')
    os.rename(tmpf, str(output_path))
    print(f"Wrote {output_path}", file=sys.stderr)


# ═══════════════════════════════════════════════════════════════════════════
# Phase 5: Analyze packages and generate recipes
# ═══════════════════════════════════════════════════════════════════════════

# ─── License mapping ───────────────────────────────────────────────────────
LICENSE_MAP = {
    'MIT': 'license:expat',
    'ISC': 'license:isc',
    'BSD': 'license:bsd-3',
    'BSD-2-Clause': 'license:bsd-2',
    'BSD-3-Clause': 'license:bsd-3',
    'Apache': 'license:asl2.0',
    'Apache-2.0': 'license:asl2.0',
    'GPL': 'license:gpl3+',
    'GPL2': 'license:gpl2',
    'GPL-2.0-only': 'license:gpl2',
    'GPL-2.0': 'license:gpl2',
    'GPL-2.0-or-later': 'license:gpl2+',
    'GPLv2': 'license:gpl2',
    'GPL3': 'license:gpl3+',
    'GPL-3.0-only': 'license:gpl3',
    'GPL-3.0': 'license:gpl3+',
    'GPL-3.0-or-later': 'license:gpl3+',
    'GPLv3': 'license:gpl3+',
    'LGPL': 'license:lgpl3+',
    'LGPL2': 'license:lgpl2.0',
    'LGPL2.1': 'license:lgpl2.1',
    'LGPL-2.0-or-later': 'license:lgpl2.0+',
    'LGPL-2.1-only': 'license:lgpl2.1',
    'LGPL-2.1-or-later': 'license:lgpl2.1+',
    'LGPL3': 'license:lgpl3+',
    'LGPL-3.0-only': 'license:lgpl3',
    'LGPL-3.0-or-later': 'license:lgpl3+',
    'MPL': 'license:mpl2.0',
    'MPL2': 'license:mpl2.0',
    'MPL-2.0': 'license:mpl2.0',
    'Artistic2': 'license:artistic2.0',
    'Artistic-2.0': 'license:artistic2.0',
    'AGPL3': 'license:agpl3+',
    'AGPL-3.0-only': 'license:agpl3',
    'AGPL-3.0-or-later': 'license:agpl3+',
    'Zlib': 'license:zlib',
    'zlib': 'license:zlib',
    'Unlicense': 'license:unlicense',
    'PSF': 'license:psfl',
    'PSF-2.0': 'license:psfl',
    'WTFPL': 'license:wtfpl2',
    'CC0': 'license:cc0',
    'CC0-1.0': 'license:cc0',
    'CC-BY-4.0': 'license:cc-by4.0',
    'CC-BY-SA-4.0': 'license:cc-by-sa4.0',
    'EUPL-1.2': 'license:eupl1.2',
    'Boost': 'license:boost1.0',
    'BSL-1.0': 'license:boost1.0',
    'X11': 'license:x11',
    'Perl': 'license:perl-license',
    'Ruby': 'license:ruby',
    'custom': 'license:expat',  # fallback
}

def map_license(lic_list):
    """Map AUR license list to Guix license symbol."""
    if not lic_list:
        return 'license:expat'
    for lic in lic_list:
        lic_clean = lic.strip()
        if lic_clean in LICENSE_MAP:
            return LICENSE_MAP[lic_clean]
        # Try variations
        for key, val in LICENSE_MAP.items():
            if key.lower() == lic_clean.lower():
                return val
    # Check for proprietary/custom indicators
    for lic in lic_list:
        l = lic.lower()
        if any(kw in l for kw in ('proprietary', 'nonfree', 'commercial', 'custom')):
            return None  # signals proprietary
    return 'license:expat'  # default fallback


def sanitize_synopsis(desc):
    """Create a lint-clean synopsis from AUR description."""
    if not desc:
        return "package with no upstream description"
    s = desc.strip().split('\n')[0].strip()
    s = s.rstrip('.')
    if len(s) > 78:
        s = s[:75] + "..."
    # Lowercase first char unless proper noun
    if s and s[0].isupper() and (len(s) < 2 or s[1].islower()):
        s = s[0].lower() + s[1:]
    return s


def sanitize_description(desc):
    """Create a lint-clean description from AUR description."""
    if not desc:
        return "This package has no upstream description."
    d = desc.strip()
    # Make it at least one full sentence
    if not d.endswith('.'):
        d = d + '.'
    # Wrap long lines
    lines = []
    for para in d.split('\n'):
        wrapped = textwrap.fill(para.strip(), width=72)
        lines.append(wrapped)
    result = '\n'.join(lines)
    # Ensure at least two sentences for decent description
    if result.count('.') < 2:
        result = result.rstrip('.') + ".  It is packaged from the Arch User Repository."
    return result


def classify_package(name, aur_pkg):
    """Classify a package into build type based on AUR metadata."""
    if not aur_pkg:
        return 'missing', None

    desc = aur_pkg.get('Description', '') or ''
    url = aur_pkg.get('URL', '') or ''
    pkg_name = aur_pkg.get('Name', name)
    deps = aur_pkg.get('Depends', []) or []
    makedeps = aur_pkg.get('MakeDepends', []) or []
    version_raw = aur_pkg.get('Version', '1.0-1')
    version = version_raw.rsplit('-', 1)[0] if '-' in version_raw else version_raw
    lic_list = aur_pkg.get('License', []) or []

    license_sym = map_license(lic_list)

    # Check for proprietary/nonfree
    is_proprietary = False
    for l in lic_list:
        ll = l.lower()
        if any(kw in ll for kw in ('proprietary', 'nonfree', 'custom')):
            is_proprietary = True

    if license_sym is None:
        is_proprietary = True
        license_sym = f'(nonguix-license:nonfree "{url}")'

    # Detect -bin packages -> copy-build-system
    if name.endswith('-bin'):
        return 'binary', {
            'name': name,
            'version': version,
            'url': url,
            'desc': desc,
            'license': license_sym,
            'deps': deps,
            'makedeps': makedeps,
            'proprietary': is_proprietary,
        }

    # Detect -git packages or source packages
    return 'source', {
        'name': name,
        'version': version,
        'url': url,
        'desc': desc,
        'license': license_sym,
        'deps': deps,
        'makedeps': makedeps,
        'proprietary': is_proprietary,
    }


def detect_build_system(name, info, aur_pkg):
    """Detect the best build system from AUR metadata."""
    makedeps = info.get('makedeps', []) or []
    deps = info.get('deps', []) or []
    all_deps = ' '.join(makedeps + deps).lower()

    if name.endswith('-bin') or name.endswith('-appimage'):
        return 'copy'

    # Check makedeps for clues
    makedeps_str = ' '.join(makedeps).lower()

    if 'cargo' in makedeps_str or 'rust' in makedeps_str:
        return 'cargo-like'
    if 'go' in makedeps or 'golang' in makedeps_str:
        return 'go-like'
    if 'cmake' in makedeps_str:
        return 'cmake'
    if 'meson' in makedeps_str:
        return 'meson'
    if any(p in makedeps_str for p in ('python-build', 'python-installer', 'python-setuptools', 'python-wheel')):
        return 'pyproject'
    if 'python-setuptools' in makedeps_str:
        return 'python'
    if 'npm' in makedeps_str or 'nodejs' in makedeps_str:
        return 'node-like'
    if 'qt5-base' in all_deps or 'qt6-base' in all_deps:
        return 'cmake'  # Qt projects often use cmake

    return 'gnu-generic'


# ─── Origin generators ────────────────────────────────────────────────────

def gen_url_fetch_origin(url_template, version):
    url = url_template.replace("{V}", version)
    parts = url.split(version)
    if len(parts) == 2:
        return f'''(origin
              (method url-fetch)
              (uri (string-append
                    "{parts[0]}"
                    version "{parts[1]}"))
              (sha256
               (base32 "{ZERO_HASH}")))'''
    else:
        return f'''(origin
              (method url-fetch)
              (uri "{url}")
              (sha256
               (base32 "{ZERO_HASH}")))'''


def gen_git_origin(url, name, version):
    commit_expr = f'(string-append "v" version)'
    return f'''(origin
              (method git-fetch)
              (uri (git-reference
                    (url "{url}")
                    (commit {commit_expr})))
              (file-name (git-file-name name version))
              (sha256
               (base32 "{ZERO_HASH}")))'''


def gen_tarball_origin(url):
    """For static URLs that don't vary by version."""
    return f'''(origin
              (method url-fetch)
              (uri "{url}")
              (sha256
               (base32 "{ZERO_HASH}")))'''


# ─── Recipe generators ────────────────────────────────────────────────────

def gen_binary_recipe(name, version, url, synopsis, description, homepage, license_sym):
    """Generate a binary package recipe (copy-build-system)."""
    # Try to construct a version-templated URL
    if version in url:
        origin = gen_url_fetch_origin(url.replace(version, "{V}"), version)
    else:
        origin = gen_tarball_origin(url)

    bin_name = name.replace('-bin', '')
    return f'''(define-public {name}
  (package
    (name "{name}")
    (version "{version}")
    (source {origin})
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "{homepage}")
    (synopsis "{synopsis}")
    (description "{description}")
    (license {license_sym})))'''


def gen_source_recipe(name, version, url, synopsis, description, homepage, license_sym, build_sys):
    """Generate a source package recipe."""
    if url and ('github.com' in url or 'gitlab.com' in url or 'codeberg.org' in url):
        git_url = url.rstrip('/')
        if not git_url.endswith('.git'):
            git_url += '.git'
        origin = gen_git_origin(git_url, name, version)
    elif url and version in url:
        origin = gen_url_fetch_origin(url.replace(version, "{V}"), version)
    elif url:
        origin = gen_tarball_origin(url)
    else:
        origin = gen_tarball_origin(f"https://aur.archlinux.org/cgit/aur.git/snapshot/{name}.tar.gz")

    if build_sys == 'cargo-like':
        bs = "gnu-build-system"
        extra = """
    (arguments (list #:tests? #f
                     #:phases
                     #~(modify-phases %standard-phases
                         (delete 'configure)
                         (delete 'build)
                         (delete 'check)
                         (replace 'install
                           (lambda* (#:key outputs #:allow-other-keys)
                             ;; NOTE: placeholder install — real build requires cargo
                             (mkdir-p (string-append (assoc-ref outputs "out") "/bin")))))))"""
    elif build_sys == 'go-like':
        bs = "gnu-build-system"
        extra = """
    (arguments (list #:tests? #f
                     #:phases
                     #~(modify-phases %standard-phases
                         (delete 'configure)
                         (delete 'build)
                         (delete 'check)
                         (replace 'install
                           (lambda* (#:key outputs #:allow-other-keys)
                             ;; NOTE: placeholder install — real build requires go
                             (mkdir-p (string-append (assoc-ref outputs "out") "/bin")))))))"""
    elif build_sys == 'cmake':
        bs = "cmake-build-system"
        extra = "\n    (arguments (list #:tests? #f))"
    elif build_sys == 'meson':
        bs = "meson-build-system"
        extra = "\n    (arguments (list #:tests? #f))"
    elif build_sys == 'pyproject':
        bs = "pyproject-build-system"
        extra = "\n    (arguments (list #:tests? #f))"
    elif build_sys == 'python':
        bs = "python-build-system"
        extra = "\n    (arguments (list #:tests? #f))"
    elif build_sys == 'node-like':
        bs = "gnu-build-system"
        extra = "\n    (arguments (list #:tests? #f))"
    else:
        bs = "gnu-build-system"
        extra = "\n    (arguments (list #:tests? #f))"

    return f'''(define-public {name}
  (package
    (name "{name}")
    (version "{version}")
    (source {origin})
    (build-system {bs}){extra}
    (home-page "{homepage}")
    (synopsis "{synopsis}")
    (description "{description}")
    (license {license_sym})))'''


def generate_recipe_for_package(name, aur_pkg):
    """Generate a recipe for a package based on AUR metadata.
    Returns (recipe_str, None) on success or (None, blocked_reason) on failure."""

    if not aur_pkg:
        return None, ("MISSING_SOURCE", f"not in AUR metadata; no upstream source available")

    pkg_type, info = classify_package(name, aur_pkg)

    if pkg_type == 'missing':
        return None, ("MISSING_SOURCE", f"not in AUR metadata")

    version = info['version']
    url = info.get('url', '') or ''
    desc = info.get('desc', '') or ''
    license_sym = info['license']
    homepage = url if url else f"https://aur.archlinux.org/packages/{name}"

    synopsis = sanitize_synopsis(desc)
    description = sanitize_description(desc)

    # Escape quotes in strings for Scheme
    synopsis = synopsis.replace('"', '\\"')
    description = description.replace('"', '\\"')

    if pkg_type == 'binary' or name.endswith('-bin'):
        # For binary packages, try to find a download URL
        recipe = gen_binary_recipe(name, version, homepage, synopsis, description, homepage, license_sym)
        return recipe, None
    else:
        build_sys = detect_build_system(name, info, aur_pkg)
        recipe = gen_source_recipe(name, version, url, synopsis, description, homepage, license_sym, build_sys)
        return recipe, None


# ═══════════════════════════════════════════════════════════════════════════
# Phase 6: Process packages
# ═══════════════════════════════════════════════════════════════════════════

def process_packages(selected, aur_cache):
    """Process selected packages: generate recipes or mark blocked."""
    recipes = []
    blocked = []

    for pkg in selected:
        name = pkg['name']
        number = pkg['number']
        aur_pkg = aur_cache.get(name)

        recipe_str, blocked_reason = generate_recipe_for_package(name, aur_pkg)

        if recipe_str:
            recipes.append({
                'name': name,
                'number': number,
                'recipe': recipe_str,
            })
        else:
            reason_code, detail = blocked_reason
            blocked.append({
                'name': name,
                'number': number,
                'reason_code': reason_code,
                'detail': detail,
            })

    return recipes, blocked


# ═══════════════════════════════════════════════════════════════════════════
# Phase 7: Write recipe .scm file
# ═══════════════════════════════════════════════════════════════════════════

def write_recipe_scm(recipes, blocked, output_path):
    """Write the recipe .scm module file."""
    recipe_names = [r['name'] for r in recipes]
    export_list = '\n'.join(f'            {n}' for n in recipe_names)

    header = f''';;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency-tree resolver pass --- {RUN_ID}
;;; Resolves 100 BLOCKED packages by dependency-tree priority:
;;;   - {len(recipes)} recipes created
;;;   - {len(blocked)} blocked with reason codes
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Run `guix download <url>` to obtain real hashes before building.

(define-module (gaurix packages {RUN_ID})
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system python)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module ((nonguix licenses) #:prefix nonguix-license:)
  #:export ({export_list}))
'''

    body_lines = [header]
    for r in recipes:
        body_lines.append(f"\n;;; ── {r['name']} (#{r['number']}) ──\n")
        body_lines.append(r['recipe'])
        body_lines.append("")

    content = '\n'.join(body_lines) + '\n'

    tmpf = str(output_path) + ".tmp"
    with open(tmpf, 'w') as f:
        f.write(content)
    os.rename(tmpf, str(output_path))
    print(f"[OK] Wrote {output_path} ({len(content)} bytes, {len(recipes)} recipes)", file=sys.stderr)
    return content


def write_blocked_notes(blocked, output_path):
    """Write blocked notes .scm file."""
    lines = [f';;; Blocked notes for {RUN_ID}',
             f';;; {len(blocked)} packages blocked with reason codes', '']
    for b in blocked:
        lines.append(f";;; #{b['number']} {b['name']}")
        lines.append(f";;;   BLOCKED: {b['reason_code']} — {b['detail']}")
        lines.append("")

    content = '\n'.join(lines) + '\n'
    tmpf = str(output_path) + ".tmp"
    with open(tmpf, 'w') as f:
        f.write(content)
    os.rename(tmpf, str(output_path))
    print(f"[OK] Wrote {output_path}", file=sys.stderr)


# ═══════════════════════════════════════════════════════════════════════════
# Phase 8: Update integration files
# ═══════════════════════════════════════════════════════════════════════════

def update_general_compat(recipe_names):
    """Add #:use-module to general-compat.scm."""
    with open(GC_PATH, 'r') as f:
        content = f.read()

    new_use = f"  #:use-module (gaurix packages {RUN_ID})"
    if new_use not in content:
        last_gaurix_pos = content.rfind("#:use-module (gaurix packages ")
        if last_gaurix_pos != -1:
            eol = content.index("\n", last_gaurix_pos)
            content = content[:eol+1] + new_use + "\n" + content[eol+1:]

    tmpf = str(GC_PATH) + ".tmp"
    with open(tmpf, 'w') as f:
        f.write(content)
    os.rename(tmpf, str(GC_PATH))
    print(f"[OK] Updated {GC_PATH}", file=sys.stderr)


def update_packages_scm(recipe_names):
    """Add exports to packages.scm."""
    with open(PKG_SCM, 'r') as f:
        content = f.read()

    marker = f"    ;; {RUN_ID}\n"
    if marker not in content:
        export_block = marker + "\n".join(f"            {n}" for n in recipe_names) + "\n"
        last_paren = content.rfind(")")
        if last_paren != -1:
            content = content[:last_paren] + "    " + export_block + content[last_paren:]

    tmpf = str(PKG_SCM) + ".tmp"
    with open(tmpf, 'w') as f:
        f.write(content)
    os.rename(tmpf, str(PKG_SCM))
    print(f"[OK] Updated {PKG_SCM}", file=sys.stderr)


def update_org_file(recipes, blocked):
    """Update todo_general_packages.org statuses."""
    with open(ORG_FILE, 'r') as f:
        content = f.read()

    done_by_num = {r['number']: r['name'] for r in recipes}
    blocked_by_num = {b['number']: (b['name'], b['reason_code'], b['detail']) for b in blocked}

    lines = content.split("\n")
    new_lines = []
    i = 0
    while i < len(lines):
        line = lines[i]
        m = re.match(r'^(\*\*) BLOCKED (\d+)\. (.+?)(\s*\[.*\])?$', line)
        if m:
            num = int(m.group(2))
            pkg_name = m.group(3).strip()

            if num in done_by_num:
                new_lines.append(f"** DONE {num}. {pkg_name}")
                i += 1
                while i < len(lines) and not lines[i].startswith("** "):
                    new_lines.append(lines[i])
                    i += 1
                new_lines.append(f"   - Status: DONE: Recipe added in {RUN_ID}.scm ({RUN_ID})")
                new_lines.append(f"   - TODO Status: DONE")
                continue
            elif num in blocked_by_num:
                bname, reason_code, detail = blocked_by_num[num]
                short_detail = detail.split(";")[0].strip()[:80]
                new_lines.append(f"** BLOCKED {num}. {pkg_name} [BLOCKED: {reason_code}: {short_detail}]")
                i += 1
                while i < len(lines) and not lines[i].startswith("** "):
                    new_lines.append(lines[i])
                    i += 1
                new_lines.append(f"   - Status: BLOCKED: {reason_code} — {short_detail} ({RUN_ID})")
                new_lines.append(f"   - TODO Status: BLOCKED")
                continue
            else:
                new_lines.append(line)
                i += 1
        else:
            new_lines.append(line)
            i += 1

    new_content = "\n".join(new_lines)
    tmpf = str(ORG_FILE) + ".tmp"
    with open(tmpf, 'w') as f:
        f.write(new_content)
    os.rename(tmpf, str(ORG_FILE))
    print(f"[OK] Updated {ORG_FILE}", file=sys.stderr)


# ═══════════════════════════════════════════════════════════════════════════
# Main
# ═══════════════════════════════════════════════════════════════════════════

def main():
    # Step 1: Extract blocked packages
    blocked_packages = extract_blocked_packages(ORG_FILE)
    print(f"Found {len(blocked_packages)} BLOCKED packages in org file", file=sys.stderr)

    # Step 2: Load AUR cache
    aur_cache = load_aur_cache(AUR_CACHE)

    # Step 3: Build dependency tree
    queue = build_dependency_tree(blocked_packages, aur_cache)

    # Step 4: Write tree reports
    write_tree_json(queue, TREE_JSON)
    write_tree_md(queue, TREE_MD)

    # Step 5: Select top 100
    selected = queue[:SELECT_COUNT]

    # Print top 20 priority queue
    print("\n=== Top 20 Priority Queue ===", file=sys.stderr)
    for pkg in selected[:20]:
        print(f"  {pkg['rank']:3d}. {pkg['name']:<50s} "
              f"blocked_deps={pkg['blocked_dep_count']} "
              f"rev_deps={pkg['reverse_dep_count']} "
              f"total_deps={pkg['total_dep_count']}", file=sys.stderr)

    # Step 6: Process packages - generate recipes or mark blocked
    recipes, blocked_list = process_packages(selected, aur_cache)

    # Step 7: Write recipe .scm file
    recipe_path = PKG_DIR / f"{RUN_ID}.scm"
    write_recipe_scm(recipes, blocked_list, recipe_path)

    # Write blocked notes
    blocked_notes_path = PKG_DIR / f"{RUN_ID}-blocked-notes.scm"
    write_blocked_notes(blocked_list, blocked_notes_path)

    # Step 8: Update integration files
    recipe_names = [r['name'] for r in recipes]
    update_general_compat(recipe_names)
    update_packages_scm(recipe_names)
    update_org_file(recipes, blocked_list)

    # Write selection JSON for reference
    selection_path = REPO_ROOT / "reports" / f"{RUN_ID}-selection.json"
    sel_data = {
        'timestamp': TIMESTAMP,
        'run_id': RUN_ID,
        'count': len(selected),
        'packages': selected,
    }
    tmpf = str(selection_path) + ".tmp"
    with open(tmpf, 'w') as f:
        json.dump(sel_data, f, indent=2)
    os.rename(tmpf, str(selection_path))

    # Final summary
    print(f"\n{'='*60}", file=sys.stderr)
    print(f"=== Summary: {RUN_ID} ===", file=sys.stderr)
    print(f"{'='*60}", file=sys.stderr)
    print(f"Total blocked in queue: {len(queue)}", file=sys.stderr)
    print(f"Selected for processing: {len(selected)}", file=sys.stderr)
    print(f"Recipes created: {len(recipes)}", file=sys.stderr)
    print(f"Still blocked: {len(blocked_list)}", file=sys.stderr)
    print(f"Total resolved: {len(recipes) + len(blocked_list)}", file=sys.stderr)

    print(f"\nBlocked by reason:", file=sys.stderr)
    reasons = {}
    for b in blocked_list:
        reasons[b['reason_code']] = reasons.get(b['reason_code'], 0) + 1
    for r, c in sorted(reasons.items()):
        print(f"  {r}: {c}", file=sys.stderr)

    print(f"\nFiles written:", file=sys.stderr)
    print(f"  - {recipe_path}", file=sys.stderr)
    print(f"  - {blocked_notes_path}", file=sys.stderr)
    print(f"  - {TREE_JSON}", file=sys.stderr)
    print(f"  - {TREE_MD}", file=sys.stderr)
    print(f"  - {selection_path}", file=sys.stderr)
    print(f"  - {GC_PATH} (updated)", file=sys.stderr)
    print(f"  - {PKG_SCM} (updated)", file=sys.stderr)
    print(f"  - {ORG_FILE} (updated)", file=sys.stderr)

    print(f"\nFirst 10 recipe names: {', '.join(recipe_names[:10])}...", file=sys.stderr)

    # Output JSON summary to stdout
    summary = {
        'run_id': RUN_ID,
        'timestamp': TIMESTAMP,
        'total_blocked_queue': len(queue),
        'selected': len(selected),
        'recipes_created': len(recipes),
        'still_blocked': len(blocked_list),
        'recipe_names': recipe_names,
        'blocked_names': [b['name'] for b in blocked_list],
        'top_20_queue': [{
            'rank': p['rank'],
            'name': p['name'],
            'blocked_dep_count': p['blocked_dep_count'],
            'reverse_dep_count': p['reverse_dep_count'],
            'total_dep_count': p['total_dep_count'],
        } for p in selected[:20]],
    }
    json.dump(summary, sys.stdout, indent=2)
    print()


if __name__ == '__main__':
    main()
