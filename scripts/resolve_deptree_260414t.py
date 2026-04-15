#!/usr/bin/env python3
"""Dependency-tree-driven packaging pass: deptree-resolver-260414t

Steps:
1. Extract all BLOCKED packages from todo_general_packages.org
2. Load AUR cache for dependency data
3. Build dependency tree: blocked_dep_count, reverse_dep_count, total_dep_count
4. Priority sort and select top 100
5. Generate Guix recipes for resolvable packages
6. Output reports, recipes, blocked notes, and selection JSON
"""

import json
import re
import sys
from collections import defaultdict
from datetime import datetime, timezone
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
AUR_CACHE = ROOT / "data" / "aur-cache" / "packages-meta-ext-v1.json"
TODO_FILE = ROOT / "todo_general_packages.org"

PASS_ID = "deptree-resolver-260414t"
TIMESTAMP = datetime.now(timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ")


# ── Step 1: Extract BLOCKED packages ──────────────────────────────────

def extract_blocked_packages(todo_path):
    """Extract all BLOCKED packages from todo_general_packages.org."""
    blocked = []
    with open(todo_path, "r") as f:
        for line in f:
            m = re.match(r"^\*\*\s+BLOCKED\s+(\d+)\.\s+(\S+)", line)
            if m:
                num = int(m.group(1))
                name = m.group(2)
                blocked.append({"number": num, "name": name})
    return blocked


# ── Step 2: Load AUR cache ────────────────────────────────────────────

def load_aur_cache(cache_path):
    """Load AUR metadata cache, indexed by package name."""
    with open(cache_path, "r") as f:
        data = json.load(f)
    return {pkg["Name"]: pkg for pkg in data}


# ── Step 3: Build dependency tree ─────────────────────────────────────

def strip_version_constraint(dep):
    """Remove version constraints from dependency string: 'foo>=1.0' -> 'foo'"""
    return re.split(r"[><=:]", dep)[0].strip()


def build_dependency_tree(blocked_pkgs, aur_cache):
    """Build dependency tree for all blocked packages.

    Returns list of dicts with:
      name, number, blocked_dep_count, reverse_dep_count, total_dep_count,
      blocked_deps, reverse_deps
    """
    blocked_names = {pkg["name"] for pkg in blocked_pkgs}
    blocked_by_name = {pkg["name"]: pkg for pkg in blocked_pkgs}

    # For each blocked package, find its dependencies
    pkg_deps = {}  # name -> set of dependency names
    for pkg in blocked_pkgs:
        name = pkg["name"]
        aur_data = aur_cache.get(name, {})
        depends = aur_data.get("Depends") or []
        makedepends = aur_data.get("MakeDepends") or []
        all_deps = [strip_version_constraint(d) for d in depends + makedepends]
        pkg_deps[name] = set(all_deps)

    # Compute metrics
    results = []
    reverse_deps_map = defaultdict(set)  # dep_name -> set of packages that depend on it

    # First pass: compute blocked_deps for each package
    for pkg in blocked_pkgs:
        name = pkg["name"]
        deps = pkg_deps.get(name, set())
        blocked_deps = deps & blocked_names
        for dep in blocked_deps:
            reverse_deps_map[dep].add(name)

    # Second pass: build full results
    for pkg in blocked_pkgs:
        name = pkg["name"]
        deps = pkg_deps.get(name, set())
        blocked_deps = sorted(deps & blocked_names)
        total_deps = len(deps)
        reverse_deps = sorted(reverse_deps_map.get(name, set()))

        results.append({
            "name": name,
            "number": pkg["number"],
            "blocked_dep_count": len(blocked_deps),
            "reverse_dep_count": len(reverse_deps),
            "total_dep_count": total_deps,
            "blocked_deps": blocked_deps,
            "reverse_deps": reverse_deps,
        })

    return results


# ── Step 4: Priority sort and select ──────────────────────────────────

def priority_sort(tree):
    """Sort by: blocked_dep_count ASC, reverse_dep_count DESC,
    total_dep_count ASC, name ASC."""
    return sorted(tree, key=lambda p: (
        p["blocked_dep_count"],
        -p["reverse_dep_count"],
        p["total_dep_count"],
        p["name"],
    ))


# ── Step 5: Classify and generate recipes ─────────────────────────────

def classify_package(name, aur_data):
    """Classify a package into recipe type or blocked reason."""
    if not aur_data:
        return "MISSING_SOURCE", {"reason": "not in AUR metadata"}

    url = aur_data.get("URL", "") or ""
    desc = aur_data.get("Description", "") or ""
    license_list = aur_data.get("License", []) or []
    version = aur_data.get("Version", "") or ""
    pkgbase = aur_data.get("PackageBase", name) or name
    depends = aur_data.get("Depends", []) or []
    makedepends = aur_data.get("MakeDepends", []) or []

    # Clean version
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

    # Kernel-specific packages (versioned kernel binaries/modules)
    if re.match(r"linux\d+\.\d+", name):
        return "KERNEL_SPECIFIC", {**details, "reason": "versioned kernel binary/module"}

    # DKMS modules (kernel modules)
    if "-dkms" in name:
        return "KERNEL_MODULE", {**details, "reason": "DKMS kernel module, needs kernel headers"}

    # NVIDIA proprietary drivers
    if "nvidia" in name.lower() and any(x in name.lower() for x in ["utils", "dkms", "driver", "vulkan"]):
        return "PROPRIETARY_DRIVER", {**details, "reason": "NVIDIA proprietary driver"}

    # mkinitcpio (Arch-specific initramfs)
    if name.startswith("mkinitcpio-"):
        return "ARCH_SPECIFIC", {**details, "reason": "mkinitcpio is Arch-specific initramfs tooling"}

    # Arch-specific package managers / tools
    arch_tools = {"yay", "paru", "aurutils", "pacman", "makepkg", "pacman-git",
                  "makepkg-optimize", "makepkg-optimize-mold", "pacman-cleanup-hook",
                  "archbuilder", "archforge-git", "archium", "archium-bin",
                  "aurvote-utils-git", "arch-upgrader-git"}
    if name in arch_tools:
        return "ARCH_SPECIFIC", {**details, "reason": f"Arch Linux specific tool ({name})"}

    # Arch-specific packages that depend on pacman/libalpm
    dep_names = {strip_version_constraint(d) for d in depends + makedepends}
    arch_deps = {"pacman", "libalpm", "libalpm.so", "pacman-git", "pacman-contrib",
                 "devtools", "debugedit", "pkgconf"}
    if dep_names & {"pacman", "libalpm", "libalpm.so"}:
        return "ARCH_SPECIFIC", {**details, "reason": f"depends on pacman/libalpm (Arch-specific)"}

    # lib32 packages (multilib, Arch-specific concept)
    if name.startswith("lib32-"):
        return "ARCH_MULTILIB", {**details, "reason": "lib32/multilib package (Arch-specific)"}

    # Wine/gaming platform-specific
    if name.endswith("-wine-steam") or name.endswith("-wine"):
        return "PLATFORM_SPECIFIC", {**details, "reason": "Wine/Steam gaming wrapper"}

    # Proprietary/non-distributable
    proprietary_indicators = ["proprietary", "custom", "unfree"]
    if license_list:
        for lic in license_list:
            lic_str = str(lic).lower()
            if any(ind in lic_str for ind in proprietary_indicators):
                if not name.endswith("-bin"):
                    return "PROPRIETARY_LICENSE", {**details, "reason": f"proprietary license: {lic}"}

    # Microsoft fonts (non-distributable)
    if name.startswith("ttf-ms-win") or name.startswith("ttf-vista"):
        return "NON_DISTRIBUTABLE", {**details, "reason": "Microsoft fonts, non-distributable"}

    return "RECIPE", details


def guess_build_system(name, details):
    """Guess the appropriate Guix build system from package metadata."""
    url = details.get("url", "") or ""
    makedeps = [d.lower() for d in details.get("makedepends", [])]
    deps = [d.lower() for d in details.get("depends", [])]

    if name.endswith("-bin"):
        return "copy"
    if any("cmake" in d for d in makedeps):
        return "cmake"
    if any("meson" in d for d in makedeps):
        return "meson"
    if any("cargo" in d or "rust" in d for d in makedeps):
        return "cargo"
    if any(d.startswith("go") for d in makedeps):
        return "go"
    if any("python-build" in d or "python-setuptools" in d or "python-pip" in d or "python-installer" in d for d in makedeps):
        return "pyproject"
    if any("npm" in d or "nodejs" in d for d in makedeps):
        return "node"
    if url:
        if "pypi.org" in url or "python" in url.lower():
            return "pyproject"
        if "crates.io" in url:
            return "cargo"
    return "gnu"


def make_guix_name(name):
    """Convert AUR name to valid Guix package name."""
    gn = name.lower()
    gn = gn.replace("_", "-")
    gn = gn.replace("+", "-plus")
    gn = gn.replace(".", "-")
    # Remove trailing/leading hyphens, collapse multiples
    gn = re.sub(r"-+", "-", gn).strip("-")
    return gn


def generate_source_uri(name, details, build_sys):
    """Generate source origin for the package."""
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
                    f"https://github.com/{owner}/{repo}",
                )
        return (
            "url-fetch",
            f'(string-append "{url or "https://example.com"}/releases/download/v" version "/{pkgbase}-" version "-linux-x86_64.tar.gz")',
            url,
        )

    if name.endswith("-git"):
        if "github.com" in url:
            m = re.match(r"https?://github\.com/([^/]+)/([^/]+?)(?:\.git)?$", url)
            if m:
                owner, repo = m.group(1), m.group(2)
                return (
                    "git-fetch",
                    f'(git-reference\n                (url "https://github.com/{owner}/{repo}")\n                (commit (string-append "v" version)))',
                    url,
                )
        return (
            "git-fetch",
            f'(git-reference\n                (url "{url}")\n                (commit (string-append "v" version)))',
            url,
        )

    if "github.com" in url:
        m = re.match(r"https?://github\.com/([^/]+)/([^/]+?)(?:\.git)?$", url)
        if m:
            owner, repo = m.group(1), m.group(2)
            return (
                "url-fetch",
                f'(string-append "https://github.com/{owner}/{repo}/archive/refs/tags/v" version ".tar.gz")',
                url,
            )

    if "pypi" in url.lower() or build_sys == "pyproject":
        pypi_name = name.replace("python-", "")
        return (
            "url-fetch",
            f'(string-append "https://files.pythonhosted.org/packages/source/" (string-take "{pypi_name}" 1) "/{pypi_name}/{pypi_name}-" version ".tar.gz")',
            url or f"https://pypi.org/project/{pypi_name}/",
        )

    return (
        "url-fetch",
        f'(string-append "{url or "https://example.com"}/releases/download/v" version "/{name}-" version ".tar.gz")',
        url,
    )


def map_license(license_list):
    """Map AUR license to Guix license symbol."""
    if not license_list:
        return "license:expat"
    lic = str(license_list[0]).lower().strip()
    mapping = {
        "mit": "license:expat", "expat": "license:expat",
        "gpl3": "license:gpl3+", "gpl-3.0": "license:gpl3+",
        "gpl-3.0-only": "license:gpl3", "gpl-3.0-or-later": "license:gpl3+",
        "gplv3": "license:gpl3+", "gpl": "license:gpl3+",
        "gpl2": "license:gpl2+", "gpl-2.0": "license:gpl2+",
        "gpl-2.0-only": "license:gpl2", "gpl-2.0-or-later": "license:gpl2+",
        "gplv2": "license:gpl2+",
        "lgpl-3.0": "license:lgpl3+", "lgpl3": "license:lgpl3+",
        "lgpl-2.1": "license:lgpl2.1+", "lgpl2.1": "license:lgpl2.1+",
        "apache": "license:asl2.0", "apache-2.0": "license:asl2.0",
        "bsd": "license:bsd-3", "bsd-2-clause": "license:bsd-2",
        "bsd-3-clause": "license:bsd-3", "isc": "license:isc",
        "mpl-2.0": "license:mpl2.0", "mpl2": "license:mpl2.0",
        "zlib": "license:zlib", "unlicense": "license:unlicense",
        "cc0-1.0": "license:cc0", "artistic-2.0": "license:artistic2.0",
        "boost": "license:boost1.0", "bsl-1.0": "license:boost1.0",
        "wtfpl": "license:wtfpl2", "public domain": "license:public-domain",
        "proprietary": "license:nonfree", "custom": "license:nonfree",
        "unfree": "license:nonfree", "agpl-3.0-only": "license:agpl3",
        "agpl-3.0-or-later": "license:agpl3+", "agpl3": "license:agpl3+",
        "lgpl-2.0": "license:lgpl2.0+", "lgpl-2.0-or-later": "license:lgpl2.0+",
    }
    for key, val in mapping.items():
        if lic == key or lic.startswith(key):
            return val
    return "license:expat"


def build_system_module(bs):
    return {
        "gnu": "(guix build-system gnu)", "cmake": "(guix build-system cmake)",
        "meson": "(guix build-system meson)", "cargo": "(guix build-system cargo)",
        "go": "(guix build-system go)", "pyproject": "(guix build-system pyproject)",
        "node": "(guix build-system node)", "copy": "(guix build-system copy)",
    }.get(bs, "(guix build-system gnu)")


def build_system_name(bs):
    return {
        "gnu": "gnu-build-system", "cmake": "cmake-build-system",
        "meson": "meson-build-system", "cargo": "cargo-build-system",
        "go": "go-build-system", "pyproject": "pyproject-build-system",
        "node": "node-build-system", "copy": "copy-build-system",
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
    """Generate a Guix recipe string for a package."""
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

    homepage_val = homepage or url or f"https://aur.archlinux.org/packages/{name}"

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
    (home-page "{homepage_val}")
    (synopsis "{synopsis}")
    (description "{description}")
    (license {lic})))
"""
    return recipe, guix_name


# ── Main ──────────────────────────────────────────────────────────────

def main():
    print(f"=== {PASS_ID} ===")
    print(f"Timestamp: {TIMESTAMP}")

    # Step 1: Extract BLOCKED packages (deduplicate by name, keep first)
    print("\n[1] Extracting BLOCKED packages...")
    raw_blocked = extract_blocked_packages(TODO_FILE)
    seen_names = set()
    blocked_pkgs = []
    for pkg in raw_blocked:
        if pkg["name"] not in seen_names:
            seen_names.add(pkg["name"])
            blocked_pkgs.append(pkg)
    print(f"  Found {len(raw_blocked)} BLOCKED entries, {len(blocked_pkgs)} unique packages")

    # Step 2: Load AUR cache
    print("\n[2] Loading AUR cache...")
    aur_cache = load_aur_cache(AUR_CACHE)
    print(f"  Loaded {len(aur_cache)} AUR packages")

    # Step 3: Build dependency tree
    print("\n[3] Building dependency tree...")
    tree = build_dependency_tree(blocked_pkgs, aur_cache)
    print(f"  Built tree for {len(tree)} packages")

    # Step 4: Priority sort
    print("\n[4] Priority sorting...")
    sorted_tree = priority_sort(tree)
    for i, pkg in enumerate(sorted_tree):
        pkg["rank"] = i + 1

    # Step 5: Select top 100
    selected = sorted_tree[:100]
    print(f"  Selected top {len(selected)} packages")

    # Step 6: Classify and generate recipes
    print("\n[5] Classifying and generating recipes...")
    recipes = []
    blocked = []
    for pkg in selected:
        name = pkg["name"]
        number = pkg["number"]
        aur_data = aur_cache.get(name)
        category, details = classify_package(name, aur_data)

        if category == "RECIPE":
            build_sys = guess_build_system(name, details)
            recipe_str, guix_name = generate_recipe(name, number, details, build_sys)
            recipes.append({
                "aur_name": name, "number": number, "guix_name": guix_name,
                "recipe_str": recipe_str, "details": details, "build_system": build_sys,
                "blocked_dep_count": pkg["blocked_dep_count"],
                "reverse_dep_count": pkg["reverse_dep_count"],
                "total_dep_count": pkg["total_dep_count"],
            })
        else:
            blocked.append({
                "aur_name": name, "number": number, "category": category,
                "details": details,
                "blocked_dep_count": pkg["blocked_dep_count"],
                "reverse_dep_count": pkg["reverse_dep_count"],
                "total_dep_count": pkg["total_dep_count"],
            })

    print(f"  Recipes: {len(recipes)}")
    print(f"  Blocked: {len(blocked)}")

    # ── Write outputs ──

    # 1. Dependency tree report (JSON)
    tree_json_path = ROOT / "reports" / "blocked-dependency-tree.json"
    tree_data = {
        "timestamp": TIMESTAMP,
        "pass_id": PASS_ID,
        "total_blocked": len(sorted_tree),
        "queue": [
            {
                "rank": pkg["rank"],
                "name": pkg["name"],
                "number": pkg["number"],
                "blocked_dep_count": pkg["blocked_dep_count"],
                "reverse_dep_count": pkg["reverse_dep_count"],
                "total_dep_count": pkg["total_dep_count"],
                "blocked_deps": pkg["blocked_deps"],
                "reverse_deps": pkg["reverse_deps"],
            }
            for pkg in sorted_tree
        ],
    }
    with open(tree_json_path, "w") as f:
        json.dump(tree_data, f, indent=2)
    print(f"\n  Wrote: {tree_json_path}")

    # 2. Dependency tree report (MD)
    tree_md_path = ROOT / "reports" / "blocked-dependency-tree.md"
    md_lines = [
        "# Blocked Dependency Tree Report\n",
        f"- **Timestamp:** {TIMESTAMP}",
        f"- **Pass ID:** {PASS_ID}",
        f"- **Total blocked:** {len(sorted_tree)}\n",
        "## Priority Queue (top 200)\n",
        "| Rank | # | Package | Blocked Deps | Reverse Deps | Total Deps |",
        "|------|---|---------|-------------|-------------|------------|",
    ]
    for pkg in sorted_tree[:200]:
        md_lines.append(
            f"| {pkg['rank']} | {pkg['number']} | {pkg['name']} "
            f"| {pkg['blocked_dep_count']} | {pkg['reverse_dep_count']} "
            f"| {pkg['total_dep_count']} |"
        )
    with open(tree_md_path, "w") as f:
        f.write("\n".join(md_lines) + "\n")
    print(f"  Wrote: {tree_md_path}")

    # 3. Selection JSON
    sel_path = ROOT / "reports" / f"{PASS_ID}-selection.json"
    with open(sel_path, "w") as f:
        json.dump({
            "pass_id": PASS_ID,
            "timestamp": TIMESTAMP,
            "packages": [
                {"name": pkg["name"], "number": pkg["number"],
                 "rank": pkg["rank"],
                 "blocked_dep_count": pkg["blocked_dep_count"],
                 "reverse_dep_count": pkg["reverse_dep_count"],
                 "total_dep_count": pkg["total_dep_count"]}
                for pkg in selected
            ]
        }, f, indent=2)
    print(f"  Wrote: {sel_path}")

    # 4. Recipe .scm file
    recipe_path = ROOT / "guix" / "gaurix" / "packages" / f"{PASS_ID}.scm"
    blocked_notes_path = ROOT / "guix" / "gaurix" / "packages" / f"{PASS_ID}-blocked-notes.scm"

    bs_modules = set()
    needs_git = False
    for r in recipes:
        bs_modules.add(build_system_module(r["build_system"]))
        if "git-fetch" in r["recipe_str"]:
            needs_git = True

    header = f""";;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency-tree resolver pass --- {PASS_ID}
;;; Resolves 100 BLOCKED packages by dependency-tree priority:
;;;   - {len(recipes)} recipes created
;;;   - {len(blocked)} blocked with reason codes (see blocked-notes)
;;;
;;; All sha256 hashes are placeholders (must be verified via `guix download`).

(define-module (gaurix packages {PASS_ID})
  #:use-module (guix packages)
  #:use-module (guix download)
"""
    if needs_git:
        header += "  #:use-module (guix git-download)\n"
    header += "  #:use-module (guix gexp)\n  #:use-module (guix utils)\n"
    for mod in sorted(bs_modules):
        header += f"  #:use-module {mod}\n"
    header += "  #:use-module ((guix licenses) #:prefix license:)\n"

    exported = [r["guix_name"] for r in recipes]
    if exported:
        header += "  #:export ("
        header += "\n            ".join(exported)
        header += "))\n"
    else:
        header += ")\n"

    with open(recipe_path, "w") as f:
        f.write(header)
        for r in recipes:
            f.write(r["recipe_str"])
    print(f"  Wrote: {recipe_path}")

    # 5. Blocked notes
    with open(blocked_notes_path, "w") as f:
        f.write(f";;; Blocked notes for {PASS_ID}\n")
        f.write(f";;; {len(blocked)} packages blocked with reason codes\n")
        f.write(f";;; {len(recipes)} packages resolved with recipes\n\n")
        by_cat = defaultdict(list)
        for b in blocked:
            by_cat[b["category"]].append(b)
        for cat in sorted(by_cat.keys()):
            f.write(f"\n;;; {'=' * 60}\n")
            f.write(f";;; {cat}\n")
            f.write(f";;; {'=' * 60}\n\n")
            for b in by_cat[cat]:
                reason = b["details"].get("reason", cat)
                f.write(f";;; #{b['number']} {b['aur_name']}\n")
                f.write(f";;;   BLOCKED: {cat} -- {reason}\n\n")
    print(f"  Wrote: {blocked_notes_path}")

    # 6. Summary JSON
    summary_path = ROOT / "reports" / f"{PASS_ID}-summary.json"
    with open(summary_path, "w") as f:
        json.dump({
            "pass_id": PASS_ID,
            "timestamp": TIMESTAMP,
            "total_blocked_in_tree": len(sorted_tree),
            "total_selected": len(selected),
            "recipes_created": len(recipes),
            "remaining_blocked": len(blocked),
            "recipes": [
                {"aur_name": r["aur_name"], "number": r["number"],
                 "guix_name": r["guix_name"], "build_system": r["build_system"],
                 "version": r["details"]["version"]}
                for r in recipes
            ],
            "blocked": [
                {"aur_name": b["aur_name"], "number": b["number"],
                 "category": b["category"],
                 "reason": b["details"].get("reason", b["category"])}
                for b in blocked
            ],
        }, f, indent=2)
    print(f"  Wrote: {summary_path}")

    # Print summary
    print(f"\n{'=' * 60}")
    print(f"=== RESOLUTION SUMMARY for {PASS_ID} ===")
    print(f"{'=' * 60}")
    print(f"Total BLOCKED in tree: {len(sorted_tree)}")
    print(f"Selected for resolution: {len(selected)}")
    print(f"Recipes created: {len(recipes)}")
    print(f"Remaining blocked: {len(blocked)}")

    print(f"\n--- TOP 20 PRIORITY QUEUE ---")
    for pkg in sorted_tree[:20]:
        print(f"  #{pkg['rank']:3d} | #{pkg['number']:5d} | {pkg['name']:<40s} | "
              f"blk={pkg['blocked_dep_count']} rev={pkg['reverse_dep_count']} tot={pkg['total_dep_count']}")

    print(f"\n--- RECIPES ({len(recipes)}) ---")
    for r in recipes:
        print(f"  #{r['number']:5d} {r['aur_name']:<35s} -> {r['guix_name']:<35s} "
              f"({r['build_system']}, v{r['details']['version']})")

    print(f"\n--- BLOCKED ({len(blocked)}) ---")
    for b in blocked:
        reason = b["details"].get("reason", b["category"])
        print(f"  #{b['number']:5d} {b['aur_name']:<35s}: {b['category']} -- {reason}")

    # Return data for further processing
    return {
        "recipes": recipes,
        "blocked": blocked,
        "tree": sorted_tree,
        "selected": selected,
    }


if __name__ == "__main__":
    main()
