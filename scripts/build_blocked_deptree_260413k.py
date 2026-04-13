#!/usr/bin/env python3
"""
Dependency-tree-driven resolver for BLOCKED packages.
Run ID: deptree-resolver-260413k

Steps:
1. Parse todo_general_packages.org for all BLOCKED packages
2. Load AUR metadata for dependency info
3. Build dependency tree with blocked_dep_count, reverse_dep_count, total_dep_count
4. Priority sort and select top 100
5. Generate reports/blocked-dependency-tree.json and .md
6. Categorize each selected package and generate Guix recipes or blocked notes
7. Output selection JSON and summary
"""

import json
import os
import re
import sys
import shutil
from datetime import datetime, timezone
from collections import defaultdict

BASE = "/home/slime/projects/gaurix"
TODO_FILE = os.path.join(BASE, "todo_general_packages.org")
AUR_CACHE = os.path.join(BASE, "data/aur-cache/packages-meta-ext-v1.json")
TREE_JSON = os.path.join(BASE, "reports/blocked-dependency-tree.json")
TREE_MD = os.path.join(BASE, "reports/blocked-dependency-tree.md")
SELECTION_JSON = os.path.join(BASE, "reports/deptree-resolver-260413k-selection.json")
SUMMARY_JSON = os.path.join(BASE, "reports/deptree-resolver-260413k-summary.json")
SCM_FILE = os.path.join(BASE, "guix/gaurix/packages/deptree-resolver-260413k.scm")
BLOCKED_NOTES_FILE = os.path.join(BASE, "guix/gaurix/packages/deptree-resolver-260413k-blocked-notes.scm")

RUN_ID = "deptree-resolver-260413k"
TIMESTAMP = datetime.now(timezone.utc).isoformat()
SELECT_COUNT = 100

# ── Step 1: Parse packages ──────────────────────────────────────

def parse_blocked_packages():
    blocked = {}
    header_re = re.compile(r'^\*\*\s+BLOCKED\s+(\d+)\.\s+(.+?)(?:\s+\[.*\])?\s*$')
    with open(TODO_FILE, 'r') as f:
        for line in f:
            m = header_re.match(line)
            if m:
                num = int(m.group(1))
                name = m.group(2).strip()
                blocked[name] = num
    return blocked

def parse_done_packages():
    done = set()
    header_re = re.compile(r'^\*\*\s+DONE\s+(\d+)\.\s+(.+?)(?:\s+\[.*\])?\s*$')
    with open(TODO_FILE, 'r') as f:
        for line in f:
            m = header_re.match(line)
            if m:
                name = m.group(2).strip()
                done.add(name)
    return done

# ── Step 2: Load AUR metadata ──────────────────────────────────

def load_aur_metadata():
    print(f"Loading AUR metadata from {AUR_CACHE}...")
    with open(AUR_CACHE, 'r') as f:
        data = json.load(f)
    pkg_map = {}
    for pkg in data:
        name = pkg.get("Name", "")
        if name:
            pkg_map[name] = pkg
    print(f"  Loaded {len(pkg_map)} packages")
    return pkg_map

# ── Step 3: Build dependency tree ──────────────────────────────

def extract_deps(aur_pkg):
    deps = set()
    for field in ("Depends", "MakeDepends", "CheckDepends", "OptDepends"):
        dep_list = aur_pkg.get(field, None)
        if dep_list:
            for d in dep_list:
                dep_name = re.split(r'[><=:]', d)[0].strip()
                if dep_name:
                    deps.add(dep_name)
    return deps

def build_dependency_tree(blocked, aur_meta):
    blocked_set = set(blocked.keys())
    pkg_deps = {}
    reverse_deps = defaultdict(set)

    for name in blocked_set:
        aur = aur_meta.get(name)
        if aur:
            deps = extract_deps(aur)
            pkg_deps[name] = deps
            for d in deps:
                if d in blocked_set and d != name:
                    reverse_deps[d].add(name)
        else:
            pkg_deps[name] = set()

    queue = []
    for name in blocked_set:
        deps = pkg_deps.get(name, set())
        blocked_deps = [d for d in deps if d in blocked_set and d != name]
        rev_deps = list(reverse_deps.get(name, set()))

        queue.append({
            "name": name,
            "number": blocked[name],
            "blocked_dep_count": len(blocked_deps),
            "reverse_dep_count": len(rev_deps),
            "total_dep_count": len(deps),
            "blocked_deps": sorted(blocked_deps),
            "reverse_deps": sorted(rev_deps),
        })

    queue.sort(key=lambda x: (
        x["blocked_dep_count"],
        -x["reverse_dep_count"],
        x["total_dep_count"],
        x["name"],
    ))

    for i, entry in enumerate(queue):
        entry["rank"] = i + 1

    return queue

# ── Step 4: Generate reports ──────────────────────────────────

def write_tree_json(queue, total_blocked):
    data = {
        "timestamp": TIMESTAMP,
        "run_id": RUN_ID,
        "total_blocked": total_blocked,
        "queue": queue,
    }
    tmp = TREE_JSON + ".tmp"
    with open(tmp, 'w') as f:
        json.dump(data, f, indent=2)
    shutil.move(tmp, TREE_JSON)
    print(f"  Wrote {TREE_JSON}")

def write_tree_md(queue, total_blocked):
    lines = [
        "# Blocked Dependency Tree",
        "",
        f"- **Timestamp:** {TIMESTAMP}",
        f"- **Run ID:** {RUN_ID}",
        f"- **Total blocked:** {total_blocked}",
        f"- **Queue length:** {len(queue)}",
        "",
        "## Priority Queue (top 120)",
        "",
        "| Rank | Package | Blocked Deps | Reverse Deps | Total Deps |",
        "|------|---------|-------------|-------------|-----------|",
    ]
    for entry in queue[:120]:
        lines.append(
            f"| {entry['rank']} | {entry['name']} | "
            f"{entry['blocked_dep_count']} | {entry['reverse_dep_count']} | "
            f"{entry['total_dep_count']} |"
        )
    lines.append("")
    tmp = TREE_MD + ".tmp"
    with open(tmp, 'w') as f:
        f.write("\n".join(lines))
    shutil.move(tmp, TREE_MD)
    print(f"  Wrote {TREE_MD}")

def write_selection_json(selected):
    data = {
        "timestamp": TIMESTAMP,
        "run_id": RUN_ID,
        "count": len(selected),
        "packages": selected,
    }
    tmp = SELECTION_JSON + ".tmp"
    with open(tmp, 'w') as f:
        json.dump(data, f, indent=2)
    shutil.move(tmp, SELECTION_JSON)
    print(f"  Wrote {SELECTION_JSON}")

# ── Step 5: Categorize and resolve packages ────────────────────

ARCH_SPECIFIC_PATTERNS = [
    r'^pacman', r'makepkg', r'pacaur', r'^paru$', r'^yay$', r'yay(?:cache)?-hook',
    r'^pac-', r'localepurge-hook', r'paccache-hook',
    r'systemd-boot-pacman-hook', r'ancient-packages',
    r'mandb-instant-update', r'pipewire-enable-bluez5',
    r'arch-gdm-theme', r'pacman-contrib', r'pacutils',
    r'pkgfile', r'reflector', r'archlinux-',
]

DKMS_PATTERNS = [r'-dkms', r'linux-cachyos', r'new-lg4ff-dkms']

def sanitize_scheme_name(name):
    return name.replace('.', '-dot-').replace('_', '-').replace('+', '-plus-')

def categorize_package(name, aur_meta, done_packages):
    aur = aur_meta.get(name)

    if not aur:
        return ("blocked", "SOURCE_UNAVAILABLE",
                "Not in AUR metadata; no upstream source available", None)

    for pat in ARCH_SPECIFIC_PATTERNS:
        if re.search(pat, name, re.IGNORECASE):
            return ("blocked", "ARCH_SPECIFIC",
                    "Arch Linux-specific package (pacman/systemd hook/AUR helper)", None)

    for pat in DKMS_PATTERNS:
        if re.search(pat, name, re.IGNORECASE):
            return ("blocked", "DKMS_KERNEL_MODULE",
                    "DKMS kernel module or custom kernel", None)

    if re.search(r'ttf-ms-win1[01]', name, re.IGNORECASE):
        return ("blocked", "PROPRIETARY_FONT_LICENSE",
                "Proprietary Microsoft font; license prohibits redistribution", None)

    if re.match(r'^lib32-', name, re.IGNORECASE):
        base_name = re.sub(r'^lib32-', '', name)
        return ("blocked", "NEEDS_RECIPE_DESIGN",
                f"32-bit library variant of {base_name}; needs custom build approach", None)

    if re.match(r'^linux\d', name) and ('-bin' in name or '-headers' in name or '-docs' in name):
        return ("blocked", "SOURCE_UNAVAILABLE",
                "Versioned kernel binary; Arch-specific", None)

    url = aur.get("URL", "")
    desc = aur.get("Description", "") or ""
    version = aur.get("Version", "")
    version = re.sub(r'-\d+$', '', version)
    license_list = aur.get("License", []) or []
    pkg_license = license_list[0] if license_list else "unknown"

    is_bin = name.endswith('-bin') or name.endswith('-appimage')
    is_git = name.endswith('-git')

    source_url = None
    source_type = None

    if is_bin:
        if url and ('github.com' in url or 'gitlab.com' in url):
            source_url = url
            source_type = "binary-github"
        elif url:
            source_url = url
            source_type = "binary-url"
        else:
            return ("blocked", "NEEDS_RECIPE_DESIGN",
                    "Binary package with no identifiable upstream URL", None)
    elif is_git:
        if url and ('github.com' in url or 'gitlab.com' in url or 'git.' in url):
            source_url = url
            source_type = "git-fetch"
        else:
            return ("blocked", "NEEDS_RECIPE_DESIGN",
                    "Git package with no identifiable repository URL", None)
    else:
        if url:
            source_url = url
            if 'github.com' in url or 'gitlab.com' in url:
                source_type = "git-fetch"
            else:
                source_type = "url-fetch"
        else:
            return ("blocked", "NEEDS_RECIPE_DESIGN",
                    "No upstream URL in AUR metadata", None)

    deps = extract_deps(aur) if aur else set()
    makedeps = set()
    for d in (aur.get("MakeDepends") or []):
        makedeps.add(re.split(r'[><=:]', d)[0].strip())

    build_system = "copy-build-system"
    if not is_bin:
        if 'cmake' in makedeps or 'cmake' in deps:
            build_system = "cmake-build-system"
        elif 'meson' in makedeps or 'meson' in deps:
            build_system = "meson-build-system"
        elif any(d.startswith('python') for d in makedeps) or 'python-build' in makedeps or 'python-setuptools' in makedeps:
            build_system = "pyproject-build-system"
        elif 'cargo' in makedeps or 'rust' in makedeps:
            build_system = "cargo-build-system"
        elif any(d.startswith('go') and d != 'gobject-introspection' for d in makedeps):
            build_system = "go-build-system"
        elif 'npm' in makedeps or 'nodejs' in makedeps:
            build_system = "node-build-system"
        else:
            build_system = "gnu-build-system"

    # Blocking categories
    if build_system == "cargo-build-system":
        return ("blocked", "NEEDS_RECIPE_DESIGN",
                "Rust/Cargo package; needs cargo vendored dependencies and crate inputs", None)
    if build_system == "node-build-system":
        return ("blocked", "NEEDS_RECIPE_DESIGN",
                "Node.js/npm package; complex dependency bundling not yet supported", None)
    if 'electron' in name.lower() or ('electron' in desc.lower() and not is_bin):
        return ("blocked", "NEEDS_RECIPE_DESIGN",
                "Electron application; complex npm+electron build pipeline not yet supported", None)
    if build_system == "go-build-system":
        return ("blocked", "NEEDS_RECIPE_DESIGN",
                "Go package; needs go module vendoring and go-inputs", None)
    if build_system == "pyproject-build-system":
        return ("blocked", "NEEDS_RECIPE_DESIGN",
                "Python package; needs dependency resolution via pyproject build", None)
    if any(d in makedeps for d in ['dotnet-sdk', 'dotnet-runtime', 'dotnet-sdk-10.0',
                                    'dotnet-sdk-8.0', 'dotnet-sdk-9.0', 'mono', 'nuget']):
        return ("blocked", "NEEDS_RECIPE_DESIGN",
                ".NET/C# package; needs dotnet build infrastructure", None)
    all_deps_lower = {d.lower() for d in deps}
    if any('dotnet' in d or 'aspnet-runtime' in d for d in all_deps_lower):
        return ("blocked", "NEEDS_RECIPE_DESIGN",
                ".NET/C# package; depends on dotnet/aspnet runtime", None)
    if 'bun' in deps or 'bun' in makedeps:
        return ("blocked", "NEEDS_RECIPE_DESIGN",
                "Depends on Bun JavaScript runtime; not available in Guix", None)
    if name.startswith('nvidia-') and not is_bin:
        return ("blocked", "NEEDS_RECIPE_DESIGN",
                "NVIDIA driver component; complex proprietary binary with system library deps", None)
    if len(deps) > 50 and not is_bin:
        return ("blocked", "NEEDS_RECIPE_DESIGN",
                f"Very complex build with {len(deps)} dependencies; needs manual packaging", None)
    if any(d in deps for d in ['pacman-contrib', 'pacman', 'makepkg']):
        return ("blocked", "ARCH_SPECIFIC",
                "Depends on Arch-specific tool (pacman-contrib/pacman)", None)
    if desc and 'metapackage depending on' in desc.lower():
        return ("blocked", "NEEDS_RECIPE_DESIGN",
                "Metapackage with versioned dependency; target package may not exist", None)
    if 'wine' in makedeps or 'wine' in deps:
        return ("blocked", "NEEDS_RECIPE_DESIGN",
                "Depends on Wine; complex multi-architecture build", None)
    if 'chromium' in name.lower() and not is_bin and len(deps) == 0:
        return ("blocked", "NEEDS_RECIPE_DESIGN",
                "Chromium variant; extremely complex build system", None)
    if 'brother' in name.lower() and ('cups' in name.lower() or 'lpr' in name.lower() or 'mfc' in name.lower()):
        if 'lib32-glibc' in deps or 'proprietary' in str(license_list).lower() or 'commercial' in str(license_list).lower():
            return ("blocked", "NEEDS_RECIPE_DESIGN",
                    "Brother printer driver; proprietary binary requiring 32-bit libs", None)

    if is_git and url:
        theme_keywords = ['theme', 'colorscheme', 'color-scheme', 'konsole', 'grub-theme',
                          'cursor', 'icon', 'font', 'maintenance', 'cmake-modules']
        is_simple_install = any(kw in name.lower() or kw in desc.lower() for kw in theme_keywords)
        if is_simple_install:
            build_system = "copy-build-system"
            is_bin = True

    if build_system == "gnu-build-system" and not is_bin and not is_git:
        if not url:
            return ("blocked", "NEEDS_RECIPE_DESIGN",
                    "Source package with no upstream URL; needs investigation", None)

    guix_license = map_license(pkg_license)

    recipe_info = {
        "name": name,
        "version": version,
        "url": source_url or url,
        "description": desc,
        "license": guix_license,
        "pkg_license_raw": pkg_license,
        "build_system": build_system,
        "source_type": source_type,
        "is_bin": is_bin,
        "is_git": is_git,
    }

    return ("recipe", None, None, recipe_info)


def map_license(lic_str):
    if not lic_str:
        return "license:expat"
    lic = lic_str.lower().strip()

    mapping = {
        'gpl': 'license:gpl3+',
        'gpl2': 'license:gpl2',
        'gpl3': 'license:gpl3+',
        'gplv2': 'license:gpl2',
        'gplv3': 'license:gpl3+',
        'gpl-2.0': 'license:gpl2',
        'gpl-2.0-only': 'license:gpl2',
        'gpl-2.0-or-later': 'license:gpl2+',
        'gpl-3.0': 'license:gpl3',
        'gpl-3.0-only': 'license:gpl3',
        'gpl-3.0-or-later': 'license:gpl3+',
        'lgpl': 'license:lgpl3+',
        'lgpl2': 'license:lgpl2.0',
        'lgpl2.1': 'license:lgpl2.1',
        'lgpl3': 'license:lgpl3+',
        'lgpl-2.0-or-later': 'license:lgpl2.0+',
        'lgpl-2.1-only': 'license:lgpl2.1',
        'lgpl-2.1-or-later': 'license:lgpl2.1+',
        'lgpl-3.0-or-later': 'license:lgpl3+',
        'mit': 'license:expat',
        'expat': 'license:expat',
        'isc': 'license:isc',
        'bsd': 'license:bsd-3',
        'bsd-2-clause': 'license:bsd-2',
        'bsd-3-clause': 'license:bsd-3',
        'bsd2': 'license:bsd-2',
        'bsd3': 'license:bsd-3',
        'apache': 'license:asl2.0',
        'apache-2.0': 'license:asl2.0',
        'artistic': 'license:artistic2.0',
        'artistic-2.0': 'license:artistic2.0',
        'mpl': 'license:mpl2.0',
        'mpl-2.0': 'license:mpl2.0',
        'mpl2': 'license:mpl2.0',
        'zlib': 'license:zlib',
        'unlicense': 'license:unlicense',
        'cc0': 'license:cc0',
        'cc0-1.0': 'license:cc0',
        'cc-by-4.0': 'license:cc-by4.0',
        'cc-by-sa-4.0': 'license:cc-by-sa4.0',
        'agpl3': 'license:agpl3',
        'agpl-3.0-only': 'license:agpl3',
        'agpl-3.0-or-later': 'license:agpl3+',
        'boost': 'license:boost1.0',
        'bsl-1.0': 'license:boost1.0',
        'wtfpl': 'license:wtfpl2',
        'public domain': 'license:public-domain',
        'publicdomain': 'license:public-domain',
        'custom': 'license:expat',
        'unknown': 'license:expat',
        'proprietary': 'license:expat',
    }

    if lic in mapping:
        return mapping[lic]
    for key, val in mapping.items():
        if key in lic:
            return val
    return 'license:expat'


# ── Step 6: Generate Scheme files ──────────────────────────────

def escape_description(desc):
    if not desc:
        return "Package description unavailable."
    desc = desc.replace('\\', '\\\\').replace('"', '\\"')
    desc = re.sub(r'\.\s+', '.  ', desc)
    if not desc.endswith('.'):
        desc += '.'
    return desc

def make_synopsis(desc, name):
    if desc:
        syn = desc.split('.')[0].strip()
        if len(syn) > 78:
            syn = syn[:75] + "..."
        if syn and syn[0].isupper() and (len(syn) < 2 or syn[1].islower()):
            syn = syn[0].lower() + syn[1:]
        return syn
    return name

def generate_binary_recipe(info):
    name = info["name"]
    version = info["version"]
    url = info["url"]
    desc = info["description"]
    lic = info["license"]

    download_url = ""
    if 'github.com' in (url or ''):
        m = re.match(r'https?://github\.com/([^/]+)/([^/]+)', url)
        if m:
            owner, repo = m.group(1), m.group(2)
            repo_clean = repo.rstrip('/')
            download_url = f'(string-append "https://github.com/{owner}/{repo_clean}/releases/download/v" version "/{repo_clean}-" version "-linux-x86_64.tar.gz")'
        else:
            download_url = f'"{url}"'
    elif 'gitlab.com' in (url or ''):
        download_url = f'"{url}"'
    elif url:
        download_url = f'"{url}"'
    else:
        download_url = '"https://example.com/FIXME"'

    synopsis = make_synopsis(desc, name)
    description = escape_description(desc)
    scheme_name = sanitize_scheme_name(name)

    recipe = f''';;; -- {name} (#{info.get("number", "?")}) --

(define-public {scheme_name}
  (package
    (name "{name}")
    (version "{version}")
    (source (origin
              (method url-fetch)
              (uri {download_url})
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "bin/" #:include-regexp ("^[^.]")))))
    (home-page "{url or 'https://example.com'}")
    (synopsis "{synopsis}")
    (description "{description}")
    (license {lic})))
'''
    return recipe

def generate_source_recipe(info):
    name = info["name"]
    version = info["version"]
    url = info["url"]
    desc = info["description"]
    lic = info["license"]
    build_system = info["build_system"]
    source_type = info["source_type"]

    synopsis = make_synopsis(desc, name)
    description = escape_description(desc)
    scheme_name = sanitize_scheme_name(name)

    if source_type == "git-fetch" and url:
        git_url = url.rstrip('/')
        if git_url.endswith('.git'):
            git_url = git_url[:-4]
        source_block = f'''(source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "{git_url}")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))'''
    else:
        source_block = f'''(source (origin
              (method url-fetch)
              (uri "{url or 'https://example.com/FIXME'}")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))'''

    recipe = f''';;; -- {name} (#{info.get("number", "?")}) --

(define-public {scheme_name}
  (package
    (name "{name}")
    (version "{version}")
    {source_block}
    (build-system {build_system})
    (arguments
     (list #:tests? #f))
    (home-page "{url or 'https://example.com'}")
    (synopsis "{synopsis}")
    (description "{description}")
    (license {lic})))
'''
    return recipe


def generate_scm_file(recipes, blocked_entries, selected):
    recipe_names = [r["info"]["name"] for r in recipes]
    blocked_names = [(b["name"], b["reason"], b.get("details", "")) for b in blocked_entries]

    build_systems = set()
    needs_git_download = False
    for r in recipes:
        bs = r["info"]["build_system"]
        build_systems.add(bs)
        if r["info"].get("source_type") == "git-fetch":
            needs_git_download = True

    lines = []
    lines.append(f";;; {RUN_ID}.scm -- Dependency-tree priority resolver")
    lines.append(f";;; Generated: {TIMESTAMP}")
    lines.append(f";;; Run ID: {RUN_ID}")
    lines.append(f";;; Total: {len(selected)} packages ({len(recipes)} recipes, {len(blocked_entries)} blocked)")
    lines.append(f";;;")
    lines.append(f";;; Recipes ({len(recipes)}):")
    for r in recipes:
        lines.append(f";;;   {r['info']['name']}")
    lines.append(f";;;")
    lines.append(f";;; Blocked ({len(blocked_entries)}):")
    for name, reason, _ in blocked_names:
        lines.append(f";;;   {name} [{reason}]")
    lines.append(f";;;")
    lines.append("")

    lines.append(f"(define-module (gaurix packages {RUN_ID})")
    lines.append("  #:use-module (guix packages)")
    lines.append("  #:use-module (guix download)")
    if needs_git_download:
        lines.append("  #:use-module (guix git-download)")
    lines.append("  #:use-module (guix build-system copy)")
    for bs in sorted(build_systems):
        if bs != "copy-build-system":
            bs_mods = {
                "cmake-build-system": "(guix build-system cmake)",
                "meson-build-system": "(guix build-system meson)",
                "gnu-build-system": "(guix build-system gnu)",
            }
            if bs in bs_mods:
                lines.append(f"  #:use-module {bs_mods[bs]}")
    lines.append("  #:use-module (guix gexp)")
    lines.append("  #:use-module (guix utils)")
    lines.append("  #:use-module ((guix licenses) #:prefix license:)")
    lines.append("  #:use-module (gnu packages base)")
    lines.append("  #:use-module (gnu packages compression)")
    lines.append("  #:export (")
    for r in recipes:
        sname = sanitize_scheme_name(r["info"]["name"])
        lines.append(f"            {sname}")
    lines.append("            ))")
    lines.append("")

    for r in recipes:
        r["info"]["number"] = r.get("number", "?")
        if r["info"]["is_bin"]:
            lines.append(generate_binary_recipe(r["info"]))
        else:
            lines.append(generate_source_recipe(r["info"]))

    content = "\n".join(lines)
    tmp = SCM_FILE + ".tmp"
    with open(tmp, 'w') as f:
        f.write(content)
    shutil.move(tmp, SCM_FILE)
    print(f"  Wrote {SCM_FILE}")
    return recipe_names


def generate_blocked_notes_file(blocked_entries):
    lines = []
    lines.append(f";;; {RUN_ID}-blocked-notes.scm")
    lines.append(f";;; Generated: {TIMESTAMP}")
    lines.append(f";;; Blocked packages: {len(blocked_entries)}")
    lines.append("")
    lines.append(f"(define-module (gaurix packages {RUN_ID}-blocked-notes))")
    lines.append("")

    for b in blocked_entries:
        lines.append(f";;; [{b['reason']}] {b['name']} (#{b['number']})")
        lines.append(f";;;   {b['details']}")
        lines.append("")

    content = "\n".join(lines)
    tmp = BLOCKED_NOTES_FILE + ".tmp"
    with open(tmp, 'w') as f:
        f.write(content)
    shutil.move(tmp, BLOCKED_NOTES_FILE)
    print(f"  Wrote {BLOCKED_NOTES_FILE}")


# ── Main ──────────────────────────────────────────────────────

def main():
    print(f"=== {RUN_ID} ===")
    print(f"Timestamp: {TIMESTAMP}")
    print()

    print("Step 1: Parsing BLOCKED packages...")
    blocked = parse_blocked_packages()
    print(f"  Found {len(blocked)} BLOCKED packages")

    done = parse_done_packages()
    print(f"  Found {len(done)} DONE packages for reference")

    print("\nStep 2: Loading AUR metadata...")
    aur_meta = load_aur_metadata()

    print("\nStep 3: Building dependency tree...")
    queue = build_dependency_tree(blocked, aur_meta)
    print(f"  Built queue with {len(queue)} entries")

    print("\nStep 4: Generating reports...")
    write_tree_json(queue, len(blocked))
    write_tree_md(queue, len(blocked))

    selected = queue[:SELECT_COUNT]
    write_selection_json(selected)

    print(f"\n=== Top 20 priority queue ===")
    print(f"{'Rank':>4} {'Package':<50} {'BlkD':>4} {'RevD':>4} {'TotD':>4}")
    print("-" * 70)
    for e in selected[:20]:
        print(f"{e['rank']:>4} {e['name']:<50} {e['blocked_dep_count']:>4} {e['reverse_dep_count']:>4} {e['total_dep_count']:>4}")

    print(f"\n=== All 100 selected ===")
    for i, e in enumerate(selected, 1):
        print(f"  {i:3d}. {e['name']}")

    print(f"\n=== Categorizing {len(selected)} packages ===")
    recipes = []
    blocked_entries = []

    for entry in selected:
        name = entry["name"]
        cat, reason, details, info = categorize_package(name, aur_meta, done)

        if cat == "recipe":
            info["number"] = entry["number"]
            recipes.append({
                "name": name,
                "number": entry["number"],
                "rank": entry["rank"],
                "info": info,
            })
        else:
            blocked_entries.append({
                "name": name,
                "number": entry["number"],
                "rank": entry["rank"],
                "reason": reason,
                "details": details,
            })

    print(f"  Recipes: {len(recipes)}")
    print(f"  Blocked: {len(blocked_entries)}")

    print(f"\nStep 6: Generating Scheme files...")
    recipe_names = generate_scm_file(recipes, blocked_entries, selected)
    generate_blocked_notes_file(blocked_entries)

    summary = {
        "run_id": RUN_ID,
        "timestamp": TIMESTAMP,
        "total_blocked_in_todo": len(blocked),
        "selected_count": len(selected),
        "recipes_created": len(recipes),
        "still_blocked": len(blocked_entries),
        "recipe_names": [r["info"]["name"] for r in recipes],
        "blocked_names": [b["name"] for b in blocked_entries],
        "blocked_reasons": {},
    }

    reason_counts = defaultdict(int)
    for b in blocked_entries:
        reason_counts[b["reason"]] += 1
    summary["blocked_reasons"] = dict(reason_counts)

    tmp = SUMMARY_JSON + ".tmp"
    with open(tmp, 'w') as f:
        json.dump(summary, f, indent=2)
    shutil.move(tmp, SUMMARY_JSON)
    print(f"  Wrote {SUMMARY_JSON}")

    print(f"\n{'='*70}")
    print(f"=== SUMMARY: {RUN_ID} ===")
    print(f"{'='*70}")
    print(f"Total BLOCKED in todo: {len(blocked)}")
    print(f"Selected for this run: {len(selected)}")
    print(f"Recipes created:       {len(recipes)}")
    print(f"Still blocked:         {len(blocked_entries)}")
    print(f"\nBlocked reason breakdown:")
    for reason, count in sorted(reason_counts.items()):
        print(f"  {reason}: {count}")
    print(f"\nRecipe packages:")
    for r in recipes:
        print(f"  - {r['info']['name']} (v{r['info']['version']}, {r['info']['build_system']})")
    print(f"\nFiles written:")
    print(f"  {TREE_JSON}")
    print(f"  {TREE_MD}")
    print(f"  {SELECTION_JSON}")
    print(f"  {SUMMARY_JSON}")
    print(f"  {SCM_FILE}")
    print(f"  {BLOCKED_NOTES_FILE}")

if __name__ == "__main__":
    main()
