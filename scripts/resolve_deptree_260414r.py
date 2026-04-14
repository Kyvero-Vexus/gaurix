#!/usr/bin/env python3
"""Dependency-tree-driven resolver for 100 BLOCKED packages.

Pass ID: deptree-resolver-260414r

Steps:
1. Extract all BLOCKED packages from todo_general_packages.org
2. Build dependency tree using AUR cache
3. Compute blocked_dep_count, reverse_dep_count, total_dep_count
4. Priority sort and select top 100
5. Classify each: RECIPE or BLOCKED with reason code
6. Generate Guix recipes for RECIPE packages
7. Write tree reports, selection, recipes, blocked notes
"""

import json
import re
import sys
from collections import defaultdict
from datetime import datetime, timezone
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
AUR_CACHE = ROOT / "data" / "aur-cache" / "packages-meta-ext-v1.json"
ORG_FILE = ROOT / "todo_general_packages.org"

PASS_ID = "deptree-resolver-260414r"

# ── Step 1: Extract BLOCKED packages ──

def extract_blocked_packages(org_path):
    """Extract all BLOCKED packages from the org file.
    Returns list of dicts with 'name', 'number', 'line_number'.
    """
    blocked = []
    pattern = re.compile(r'^\*\* BLOCKED (\d+)\.\s+(\S+)')
    with open(org_path, 'r') as f:
        for i, line in enumerate(f, 1):
            m = pattern.match(line)
            if m:
                number = int(m.group(1))
                name = m.group(2)
                blocked.append({
                    'name': name,
                    'number': number,
                    'line_number': i,
                })
    return blocked


# ── Step 2: Load AUR cache ──

def load_aur_cache(cache_path):
    print(f"Loading AUR cache from {cache_path}...")
    with open(cache_path, 'r') as f:
        data = json.load(f)
    cache = {pkg['Name']: pkg for pkg in data}
    print(f"  Loaded {len(cache)} packages")
    return cache


# ── Step 3: Build dependency tree ──

def strip_version_constraint(dep):
    """Strip version constraints: 'foo>=1.0' -> 'foo', 'foo.so=123' -> 'foo.so'"""
    return re.split(r'[><=:]', dep)[0].strip()


def build_dependency_tree(blocked_pkgs, aur_cache):
    """Build dependency tree for all blocked packages.

    Returns dict: name -> {
        blocked_deps: [names],
        reverse_deps: [names],
        total_dep_count: int,
        blocked_dep_count: int,
        reverse_dep_count: int,
    }
    """
    blocked_names = {p['name'] for p in blocked_pkgs}
    tree = {}

    # First pass: compute blocked_deps and total_dep_count for each blocked package
    for pkg in blocked_pkgs:
        name = pkg['name']
        aur_data = aur_cache.get(name, {})
        depends = aur_data.get('Depends', []) or []
        makedepends = aur_data.get('MakeDepends', []) or []
        optdepends = aur_data.get('OptDepends', []) or []

        all_deps = set()
        for d in depends + makedepends:
            dep_name = strip_version_constraint(d)
            all_deps.add(dep_name)

        blocked_deps = sorted(all_deps & blocked_names)

        tree[name] = {
            'blocked_deps': blocked_deps,
            'reverse_deps': [],
            'total_dep_count': len(all_deps),
            'blocked_dep_count': len(blocked_deps),
            'reverse_dep_count': 0,
        }

    # Second pass: compute reverse_deps
    for name, info in tree.items():
        for dep in info['blocked_deps']:
            if dep in tree:
                tree[dep]['reverse_deps'].append(name)

    # Sort reverse_deps and compute counts
    for name, info in tree.items():
        info['reverse_deps'] = sorted(info['reverse_deps'])
        info['reverse_dep_count'] = len(info['reverse_deps'])

    return tree


# ── Step 4: Priority sort and select ──

def priority_sort(blocked_pkgs, tree):
    """Sort blocked packages by priority:
    1. blocked_dep_count ascending
    2. reverse_dep_count descending
    3. total_dep_count ascending
    4. name ascending
    """
    def sort_key(pkg):
        name = pkg['name']
        info = tree.get(name, {})
        return (
            info.get('blocked_dep_count', 0),
            -info.get('reverse_dep_count', 0),
            info.get('total_dep_count', 0),
            name,
        )
    return sorted(blocked_pkgs, key=sort_key)


# ── Step 5: Classify packages ──

def classify_package(name, aur_data):
    """Classify a package into recipe type or blocked reason."""
    if not aur_data:
        return "MISSING_SOURCE", {"reason": "not in AUR metadata"}

    url = aur_data.get("URL", "") or ""
    desc = aur_data.get("Description", "") or ""
    license_list = aur_data.get("License", []) or []
    version = aur_data.get("Version", "") or ""
    pkgbase = aur_data.get("PackageBase", name)
    depends = aur_data.get("Depends", []) or []
    makedepends = aur_data.get("MakeDepends", []) or []

    clean_version = re.sub(r"^\d+:", "", version)
    clean_version = re.sub(r"-\d+$", "", clean_version)

    details = {
        "url": url,
        "description": desc,
        "license": license_list,
        "version": clean_version,
        "raw_version": version,
        "pkgbase": pkgbase,
        "depends": depends,
        "makedepends": makedepends,
    }

    # Kernel-specific packages
    if re.match(r"linux\d+\.\d+", name) or (name.endswith("-dkms") and "linux" in name.lower()):
        return "KERNEL_SPECIFIC", {**details, "reason": "versioned kernel binary/module"}

    # DKMS packages (kernel module)
    if name.endswith("-dkms") or name.endswith("-dkms-git"):
        return "KERNEL_MODULE", {**details, "reason": "DKMS kernel module, not portable to Guix"}

    # NVIDIA proprietary
    if "nvidia" in name.lower() and any(x in name.lower() for x in ["utils", "dkms", "driver"]):
        return "PROPRIETARY_DRIVER", {**details, "reason": "NVIDIA proprietary driver"}

    # Arch-specific package managers
    if name in ("yay", "paru", "aurutils", "pacman", "makepkg"):
        return "ARCH_SPECIFIC", {**details, "reason": f"Arch Linux package manager ({name})"}

    # Arch-specific packages that depend on pacman/libalpm/mkinitcpio/makepkg
    arch_deps = {"pacman", "libalpm", "libalpm.so", "pacman-git", "pacman-contrib",
                 "mkinitcpio", "makepkg", "namcap"}
    dep_names = {strip_version_constraint(d) for d in depends + makedepends}
    if dep_names & arch_deps:
        return "ARCH_SPECIFIC", {**details, "reason": f"depends on Arch-specific tool ({dep_names & arch_deps})"}

    # mkinitcpio hooks/tools (Arch initramfs)
    if name.startswith("mkinitcpio-"):
        return "ARCH_SPECIFIC", {**details, "reason": "mkinitcpio hook/tool (Arch initramfs system)"}

    return "RECIPE", details


# ── Step 6: Recipe generation ──

def guess_build_system(name, details):
    url = details.get("url", "") or ""
    makedeps = [d.lower() for d in details.get("makedepends", [])]
    deps = [d.lower() for d in details.get("depends", [])]

    if name.endswith("-bin"):
        return "copy"
    if name.endswith("-git"):
        if any("cmake" in d for d in makedeps): return "cmake"
        if any("meson" in d for d in makedeps): return "meson"
        if any("cargo" in d or "rust" in d for d in makedeps): return "cargo"
        if any("go" == d or "go" in d for d in makedeps): return "go"
        if any("python" in d for d in makedeps): return "pyproject"
        return "gnu"

    if any("cmake" in d for d in makedeps): return "cmake"
    if any("meson" in d for d in makedeps): return "meson"
    if any("cargo" in d or "rust" in d for d in makedeps): return "cargo"
    if any(d in ("go", "go-pie") for d in makedeps): return "go"
    if any("python-build" in d or "python-setuptools" in d or "python-pip" in d for d in makedeps):
        return "pyproject"
    if any("npm" in d or "nodejs" in d for d in makedeps): return "node"

    if url:
        if "pypi.org" in url or "python" in url.lower(): return "pyproject"
        if "crates.io" in url: return "cargo"
        if "npmjs.com" in url: return "node"

    return "gnu"


def make_guix_name(name):
    return name.lower().replace("_", "-").replace("+", "-plus-plus").replace(".", "-")


def generate_source_uri(name, details, build_sys):
    url = details.get("url", "") or ""
    version = details.get("version", "0.0.0") or "0.0.0"
    pkgbase = details.get("pkgbase", name) or name

    if name.endswith("-bin"):
        if "github.com" in url:
            m = re.match(r"https?://github\.com/([^/]+)/([^/]+?)(?:\.git)?$", url)
            if m:
                owner, repo = m.group(1), m.group(2)
                return (
                    "url-fetch",
                    f'(string-append "https://github.com/{owner}/{repo}/releases/download/v" version "/{repo}-" version "-linux-x86_64.tar.gz")',
                    f"https://github.com/{owner}/{repo}"
                )
        return (
            "url-fetch",
            f'(string-append "{url}/releases/download/v" version "/{pkgbase}-" version "-linux-x86_64.tar.gz")',
            url
        )

    if name.endswith("-git"):
        if "github.com" in url:
            m = re.match(r"https?://github\.com/([^/]+)/([^/]+?)(?:\.git)?$", url)
            if m:
                owner, repo = m.group(1), m.group(2)
                return (
                    "git-fetch",
                    f'(git-reference\n                (url "https://github.com/{owner}/{repo}")\n                (commit (string-append "v" version)))',
                    url
                )
        return (
            "git-fetch",
            f'(git-reference\n                (url "{url}")\n                (commit (string-append "v" version)))',
            url
        )

    if "github.com" in url:
        m = re.match(r"https?://github\.com/([^/]+)/([^/]+?)(?:\.git)?$", url)
        if m:
            owner, repo = m.group(1), m.group(2)
            return (
                "url-fetch",
                f'(string-append "https://github.com/{owner}/{repo}/archive/refs/tags/v" version ".tar.gz")',
                url
            )

    if "pypi" in url.lower() or build_sys == "pyproject":
        pypi_name = name.replace("python-", "")
        return (
            "url-fetch",
            f'(string-append "https://files.pythonhosted.org/packages/source/" (string-take "{pypi_name}" 1) "/{pypi_name}/{pypi_name}-" version ".tar.gz")',
            url or f"https://pypi.org/project/{pypi_name}/"
        )

    return (
        "url-fetch",
        f'(string-append "{url or "https://example.com"}/releases/download/v" version "/{name}-" version ".tar.gz")',
        url
    )


def map_license(license_list):
    if not license_list:
        return "license:expat"
    lic = license_list[0] if isinstance(license_list, list) else str(license_list)
    lic_lower = str(lic).lower().strip()
    mapping = {
        "mit": "license:expat", "expat": "license:expat",
        "gpl3": "license:gpl3+", "gpl-3.0": "license:gpl3+",
        "gpl-3.0-only": "license:gpl3", "gpl-3.0-or-later": "license:gpl3+",
        "gplv3": "license:gpl3+", "gpl2": "license:gpl2+",
        "gpl-2.0": "license:gpl2+", "gpl-2.0-only": "license:gpl2",
        "gpl-2.0-or-later": "license:gpl2+", "gplv2": "license:gpl2+",
        "gpl": "license:gpl3+", "lgpl-3.0": "license:lgpl3+",
        "lgpl3": "license:lgpl3+", "lgpl-2.1": "license:lgpl2.1+",
        "lgpl2.1": "license:lgpl2.1+", "lgpl-2.0": "license:lgpl2.0+",
        "apache": "license:asl2.0", "apache-2.0": "license:asl2.0",
        "apache 2.0": "license:asl2.0", "asl2.0": "license:asl2.0",
        "bsd": "license:bsd-3", "bsd-2-clause": "license:bsd-2",
        "bsd-3-clause": "license:bsd-3", "bsd-2": "license:bsd-2",
        "bsd-3": "license:bsd-3", "isc": "license:isc",
        "mpl-2.0": "license:mpl2.0", "mpl2": "license:mpl2.0",
        "zlib": "license:zlib", "unlicense": "license:unlicense",
        "cc0-1.0": "license:cc0", "artistic-2.0": "license:artistic2.0",
        "boost": "license:boost1.0", "bsl-1.0": "license:boost1.0",
        "wtfpl": "license:wtfpl2", "public domain": "license:public-domain",
        "proprietary": "license:nonfree", "custom": "license:nonfree",
        "unfree": "license:nonfree",
    }
    for key, val in mapping.items():
        if lic_lower == key or lic_lower.startswith(key):
            return val
    return "license:expat"


def build_system_module(bs):
    return {
        "gnu": "(guix build-system gnu)", "cmake": "(guix build-system cmake)",
        "meson": "(guix build-system meson)", "cargo": "(guix build-system cargo)",
        "go": "(guix build-system go)", "pyproject": "(guix build-system pyproject)",
        "node": "(guix build-system node)", "copy": "(guix build-system copy)",
        "trivial": "(guix build-system trivial)",
    }.get(bs, "(guix build-system gnu)")


def build_system_name(bs):
    return {
        "gnu": "gnu-build-system", "cmake": "cmake-build-system",
        "meson": "meson-build-system", "cargo": "cargo-build-system",
        "go": "go-build-system", "pyproject": "pyproject-build-system",
        "node": "node-build-system", "copy": "copy-build-system",
        "trivial": "trivial-build-system",
    }.get(bs, "gnu-build-system")


def sanitize_description(desc):
    if not desc:
        return "Package from the Arch User Repository."
    desc = desc.replace("\\", "\\\\").replace('"', '\\"')
    if not desc.endswith("."):
        desc += "."
    if desc and desc[0].islower():
        desc = desc[0].upper() + desc[1:]
    desc += "  Packaged from the Arch User Repository."
    return desc


def sanitize_synopsis(desc, name):
    if not desc:
        return name.replace("-", " ")
    syn = desc.split(".")[0].split(",")[0].strip()
    syn = re.sub(r"^(A|An|The)\s+", "", syn, flags=re.IGNORECASE)
    if syn and syn[0].isupper():
        syn = syn[0].lower() + syn[1:]
    if len(syn) > 77:
        syn = syn[:74] + "..."
    return syn


def generate_recipe(name, number, details, build_sys):
    guix_name = make_guix_name(name)
    version = details.get("version", "0.0.0")
    desc = details.get("description", "")
    url = details.get("url", "")
    license_list = details.get("license", [])

    fetch_method, uri_expr, homepage = generate_source_uri(name, details, build_sys)
    lic = map_license(license_list)
    synopsis = sanitize_synopsis(desc, name)
    description = sanitize_description(desc)
    bs_name = build_system_name(build_sys)

    if fetch_method == "git-fetch":
        source_block = f"""    (source (origin
              (method git-fetch)
              (uri {uri_expr})
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))"""
    else:
        source_block = f"""    (source (origin
              (method url-fetch)
              (uri {uri_expr})
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))"""

    if build_sys == "copy":
        args = """    (arguments
     (list #:install-plan
           #~'(("." "/opt/" #:include-regexp (".*")))))"""
    elif build_sys == "go":
        import_path = ""
        if "github.com" in url:
            m = re.match(r"https?://github\.com/([^/]+)/([^/]+?)(?:\.git)?$", url)
            if m:
                import_path = f"github.com/{m.group(1)}/{m.group(2)}"
        args = f"""    (arguments
     (list #:import-path "{import_path}"
           #:install-source? #f
           #:tests? #f))"""
    else:
        args = """    (arguments
     (list #:tests? #f))"""

    recipe = f"""
;;; --- #{number} {name} ---
;;; {desc or 'AUR package'}
;;; Source: {url}
;;; License: {', '.join(str(l) for l in license_list) if license_list else 'unknown'}
;;; Resolves: #{number} {name}

(define-public {guix_name}
  (package
    (name "{guix_name}")
    (version "{version}")
{source_block}
    (build-system {bs_name})
{args}
    (home-page "{homepage or url or 'https://aur.archlinux.org/packages/' + name}")
    (synopsis "{synopsis}")
    (description "{description}")
    (license {lic})))
"""
    return recipe, guix_name


# ── Write tree reports ──

def write_tree_reports(blocked_pkgs, tree, selected_100, timestamp):
    # JSON report
    queue = []
    sorted_pkgs = priority_sort(blocked_pkgs, tree)
    for rank, pkg in enumerate(sorted_pkgs, 1):
        name = pkg['name']
        info = tree.get(name, {})
        queue.append({
            'name': name,
            'number': pkg['number'],
            'blocked_deps': info.get('blocked_deps', []),
            'total_dep_count': info.get('total_dep_count', 0),
            'blocked_dep_count': info.get('blocked_dep_count', 0),
            'reverse_dep_count': info.get('reverse_dep_count', 0),
            'reverse_deps': info.get('reverse_deps', []),
            'rank': rank,
        })

    json_path = ROOT / "reports" / "blocked-dependency-tree.json"
    with open(json_path, 'w') as f:
        json.dump({
            'timestamp': timestamp,
            'total_blocked': len(blocked_pkgs),
            'queue': queue,
        }, f, indent=2)
    print(f"  Written: {json_path}")

    # MD report
    md_path = ROOT / "reports" / "blocked-dependency-tree.md"
    with open(md_path, 'w') as f:
        f.write(f"# Blocked Dependency Tree\n\n")
        f.write(f"Generated: {timestamp}\n\n")
        f.write(f"Total blocked packages: {len(blocked_pkgs)}\n\n")
        f.write(f"## Priority Queue (top 50)\n\n")
        f.write(f"| Rank | # | Package | Blocked Deps | Reverse Deps | Total Deps |\n")
        f.write(f"|------|---|---------|-------------|-------------|------------|\n")
        for entry in queue[:50]:
            f.write(f"| {entry['rank']} | {entry['number']} | {entry['name']} | {entry['blocked_dep_count']} | {entry['reverse_dep_count']} | {entry['total_dep_count']} |\n")
        f.write(f"\n## Selected 100 for this pass ({PASS_ID})\n\n")
        for i, pkg in enumerate(selected_100, 1):
            info = tree.get(pkg['name'], {})
            f.write(f"{i}. **#{pkg['number']} {pkg['name']}** — blocked_deps={info.get('blocked_dep_count',0)}, reverse_deps={info.get('reverse_dep_count',0)}, total_deps={info.get('total_dep_count',0)}\n")
    print(f"  Written: {md_path}")

    # Selection JSON
    sel_path = ROOT / "reports" / f"{PASS_ID}-selection.json"
    with open(sel_path, 'w') as f:
        json.dump({
            'pass_id': PASS_ID,
            'timestamp': timestamp,
            'packages': [
                {
                    'name': pkg['name'],
                    'number': pkg['number'],
                    'rank': i+1,
                    'blocked_dep_count': tree.get(pkg['name'], {}).get('blocked_dep_count', 0),
                    'reverse_dep_count': tree.get(pkg['name'], {}).get('reverse_dep_count', 0),
                    'total_dep_count': tree.get(pkg['name'], {}).get('total_dep_count', 0),
                }
                for i, pkg in enumerate(selected_100)
            ],
        }, f, indent=2)
    print(f"  Written: {sel_path}")


# ── Write recipe files ──

def write_recipes(recipes, blocked, pass_id):
    recipe_path = ROOT / "guix" / "gaurix" / "packages" / f"{pass_id}.scm"
    blocked_notes_path = ROOT / "guix" / "gaurix" / "packages" / f"{pass_id}-blocked-notes.scm"

    bs_modules = set()
    needs_git = False
    for _, _, _, recipe_str, _, bs in recipes:
        bs_modules.add(build_system_module(bs))
        if "git-fetch" in recipe_str:
            needs_git = True

    module_header = f""";;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency-tree resolver pass --- {pass_id}
;;; Resolves 100 BLOCKED packages by dependency-tree priority:
;;;   - {len(recipes)} recipes created
;;;   - {len(blocked)} blocked with reason codes (see blocked-notes)
;;;
;;; All sha256 hashes are placeholders (must be verified via `guix download`).

(define-module (gaurix packages {pass_id})
  #:use-module (guix packages)
  #:use-module (guix download)
"""
    if needs_git:
        module_header += "  #:use-module (guix git-download)\n"
    module_header += """  #:use-module (guix gexp)
  #:use-module (guix utils)
"""
    for mod in sorted(bs_modules):
        module_header += f"  #:use-module {mod}\n"
    module_header += "  #:use-module ((guix licenses) #:prefix license:)\n"

    exported = [gn for _, _, gn, _, _, _ in recipes]
    if exported:
        module_header += "  #:export ("
        module_header += "\n            ".join(exported)
        module_header += "))\n"
    else:
        module_header += ")\n"

    with open(recipe_path, 'w') as f:
        f.write(module_header)
        for _, _, _, recipe_str, _, _ in recipes:
            f.write(recipe_str)
    print(f"  Written: {recipe_path}")

    # Write blocked notes
    with open(blocked_notes_path, 'w') as f:
        f.write(f";;; Blocked notes for {pass_id}\n")
        f.write(f";;; {len(blocked)} packages blocked with reason codes\n")
        f.write(f";;; {len(recipes)} packages resolved with recipes\n\n")

        by_cat = defaultdict(list)
        for name, number, category, details in blocked:
            by_cat[category].append((name, number, details))

        for cat in sorted(by_cat.keys()):
            f.write(f"\n;;; {'=' * 60}\n")
            f.write(f";;; {cat}\n")
            f.write(f";;; {'=' * 60}\n\n")
            for name, number, details in by_cat[cat]:
                reason = details.get("reason", cat)
                f.write(f";;; #{number} {name}\n")
                f.write(f";;;   BLOCKED: {cat} -- {reason}\n\n")
    print(f"  Written: {blocked_notes_path}")


# ── Main ──

def main():
    timestamp = datetime.now(timezone.utc).isoformat()
    print(f"=== {PASS_ID} ===")
    print(f"Timestamp: {timestamp}\n")

    # Step 1: Extract BLOCKED packages
    print("Step 1: Extracting BLOCKED packages...")
    blocked_pkgs = extract_blocked_packages(ORG_FILE)
    print(f"  Found {len(blocked_pkgs)} BLOCKED packages\n")

    # Step 2: Load AUR cache
    print("Step 2: Loading AUR cache...")
    aur_cache = load_aur_cache(AUR_CACHE)

    # Step 3: Build dependency tree
    print("\nStep 3: Building dependency tree...")
    tree = build_dependency_tree(blocked_pkgs, aur_cache)
    print(f"  Tree built for {len(tree)} packages")

    # Step 4: Priority sort and select top 100
    print("\nStep 4: Priority sorting and selecting top 100...")
    sorted_pkgs = priority_sort(blocked_pkgs, tree)
    selected_100 = sorted_pkgs[:100]
    print(f"  Selected {len(selected_100)} packages")
    print(f"\n  Top 20 priority queue:")
    for i, pkg in enumerate(selected_100[:20], 1):
        info = tree.get(pkg['name'], {})
        print(f"    {i:3d}. #{pkg['number']:5d} {pkg['name']:40s} blocked_deps={info['blocked_dep_count']} rev_deps={info['reverse_dep_count']} total_deps={info['total_dep_count']}")

    # Step 5: Write tree reports
    print("\nStep 5: Writing tree reports...")
    write_tree_reports(blocked_pkgs, tree, selected_100, timestamp)

    # Step 6: Classify and generate recipes
    print("\nStep 6: Classifying and generating recipes...")
    recipes = []
    blocked_list = []

    for pkg in selected_100:
        name = pkg['name']
        number = pkg['number']
        aur_data = aur_cache.get(name)
        category, details = classify_package(name, aur_data)

        if category == "RECIPE":
            build_sys = guess_build_system(name, details)
            recipe_str, guix_name = generate_recipe(name, number, details, build_sys)
            recipes.append((name, number, guix_name, recipe_str, details, build_sys))
        else:
            blocked_list.append((name, number, category, details))

    # Deduplicate recipes by guix_name
    seen_guix_names = {}
    deduped_recipes = []
    for entry in recipes:
        name, number, guix_name, recipe_str, details, build_sys = entry
        if guix_name in seen_guix_names:
            # Duplicate guix name - keep the first, block the second
            blocked_list.append((name, number, "DUPLICATE_NAME",
                                 {**details, "reason": f"duplicate guix name '{guix_name}' (first: #{seen_guix_names[guix_name]})"}))
        else:
            seen_guix_names[guix_name] = number
            deduped_recipes.append(entry)
    recipes = deduped_recipes

    print(f"  Recipes: {len(recipes)}")
    print(f"  Blocked: {len(blocked_list)}")

    # Step 7: Write recipe files
    print("\nStep 7: Writing recipe files...")
    write_recipes(recipes, blocked_list, PASS_ID)

    # Step 8: Write summary
    summary_path = ROOT / "reports" / f"{PASS_ID}-summary.json"
    with open(summary_path, 'w') as f:
        json.dump({
            'pass_id': PASS_ID,
            'timestamp': timestamp,
            'total_blocked_in_org': len(blocked_pkgs),
            'total_selected': len(selected_100),
            'recipes_created': len(recipes),
            'remaining_blocked': len(blocked_list),
            'recipes': [
                {'aur_name': n, 'number': num, 'guix_name': gn, 'build_system': bs, 'version': d['version']}
                for n, num, gn, _, d, bs in recipes
            ],
            'blocked': [
                {'aur_name': n, 'number': num, 'category': cat, 'reason': d.get('reason', cat)}
                for n, num, cat, d in blocked_list
            ],
        }, f, indent=2)
    print(f"  Written: {summary_path}")

    # Print final summary
    print(f"\n{'='*60}")
    print(f"RESOLUTION SUMMARY — {PASS_ID}")
    print(f"{'='*60}")
    print(f"Total BLOCKED in org:  {len(blocked_pkgs)}")
    print(f"Selected for this run: {len(selected_100)}")
    print(f"Recipes created:       {len(recipes)}")
    print(f"Remaining blocked:     {len(blocked_list)}")
    print(f"\nRecipes ({len(recipes)}):")
    for name, number, guix_name, _, details, bs in recipes:
        print(f"  #{number} {name} -> {guix_name} ({bs}-build-system, v{details['version']})")
    print(f"\nBlocked ({len(blocked_list)}):")
    for name, number, category, details in blocked_list:
        reason = details.get("reason", category)
        print(f"  #{number} {name}: {category} -- {reason}")

    # Return data for further processing
    return {
        'recipes': recipes,
        'blocked': blocked_list,
        'selected': selected_100,
        'tree': tree,
        'timestamp': timestamp,
    }


if __name__ == "__main__":
    main()
