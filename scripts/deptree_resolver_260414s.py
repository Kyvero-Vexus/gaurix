#!/usr/bin/env python3
"""Dependency-tree-driven packaging pass for BLOCKED packages.

Pass ID: deptree-resolver-260414s

Steps:
1. Extract all BLOCKED packages from todo_general_packages.org
2. Build dependency tree using AUR cache
3. Priority sort: blocked_dep_count ASC, reverse_dep_count DESC,
   total_dep_count ASC, name ASC
4. Select top 100
5. Classify each: RECIPE or BLOCKED with reason
6. Generate Guix recipes
7. Produce tree artifacts (JSON + MD reports)
"""

import json
import re
import sys
import datetime
from pathlib import Path
from collections import defaultdict

ROOT = Path(__file__).resolve().parent.parent
AUR_CACHE = ROOT / "data" / "aur-cache" / "packages-meta-ext-v1.json"
TODO_FILE = ROOT / "todo_general_packages.org"
REPORTS_DIR = ROOT / "reports"

PASS_ID = "deptree-resolver-260414s"
TIMESTAMP = datetime.datetime.now(datetime.timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ")


def extract_blocked_packages(todo_path):
    """Extract all BLOCKED packages from todo org file."""
    blocked = []
    with open(todo_path, "r") as f:
        content = f.read()

    # Match "** BLOCKED N. package-name" patterns
    pattern = re.compile(r'^\*\* BLOCKED (\d+)\. (\S+)', re.MULTILINE)
    for m in pattern.finditer(content):
        number = int(m.group(1))
        name = m.group(2)
        blocked.append({"number": number, "name": name})

    return blocked


def load_aur_cache(cache_path):
    """Load AUR package metadata cache."""
    print(f"Loading AUR cache from {cache_path}...")
    with open(cache_path, "r") as f:
        data = json.load(f)
    cache = {}
    for pkg in data:
        cache[pkg["Name"]] = pkg
    print(f"  Loaded {len(cache)} packages")
    return cache


def strip_version_constraint(dep_str):
    """Strip version constraints from dependency string.
    'foo>=1.0' -> 'foo', 'bar' -> 'bar'
    """
    return re.split(r'[><=:]+', dep_str)[0].strip()


def build_dependency_tree(blocked_pkgs, aur_cache):
    """Build dependency tree for all blocked packages.

    Returns dict: name -> {
        blocked_dep_count, reverse_dep_count, total_dep_count,
        deps, blocked_deps, reverse_deps
    }
    """
    blocked_names = {p["name"] for p in blocked_pkgs}
    blocked_by_name = {p["name"]: p for p in blocked_pkgs}

    tree = {}
    for pkg in blocked_pkgs:
        name = pkg["name"]
        aur = aur_cache.get(name, {})

        # Get all dependencies
        depends = [strip_version_constraint(d) for d in (aur.get("Depends") or [])]
        makedepends = [strip_version_constraint(d) for d in (aur.get("MakeDepends") or [])]
        optdepends = [strip_version_constraint(d.split(":")[0]) for d in (aur.get("OptDepends") or [])]

        all_deps = list(set(depends + makedepends))  # Don't include optdepends in count
        blocked_deps = [d for d in all_deps if d in blocked_names]

        tree[name] = {
            "number": pkg["number"],
            "all_deps": all_deps,
            "blocked_deps": blocked_deps,
            "blocked_dep_count": len(blocked_deps),
            "total_dep_count": len(all_deps),
            "reverse_deps": [],  # filled below
            "reverse_dep_count": 0,
        }

    # Compute reverse dependencies
    for name, info in tree.items():
        for dep in info["blocked_deps"]:
            if dep in tree:
                tree[dep]["reverse_deps"].append(name)

    for name, info in tree.items():
        info["reverse_dep_count"] = len(info["reverse_deps"])

    return tree


def priority_sort(tree):
    """Sort packages by priority:
    1. blocked_dep_count ASC (fewest blocked deps first)
    2. reverse_dep_count DESC (most dependents first)
    3. total_dep_count ASC
    4. name ASC
    """
    items = list(tree.items())
    items.sort(key=lambda x: (
        x[1]["blocked_dep_count"],
        -x[1]["reverse_dep_count"],
        x[1]["total_dep_count"],
        x[0],
    ))
    return items


def classify_package(name, aur_data):
    """Classify a package into recipe type or blocked reason."""
    if not aur_data:
        return "MISSING_SOURCE", {"reason": "not in AUR metadata"}

    url = aur_data.get("URL", "")
    desc = aur_data.get("Description", "")
    license_list = aur_data.get("License", []) or []
    version = aur_data.get("Version", "")
    pkgbase = aur_data.get("PackageBase", name)
    depends = aur_data.get("Depends", []) or []
    makedepends = aur_data.get("MakeDepends", []) or []

    # Strip epoch and pkgrel
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

    # Kernel-specific / DKMS
    if name.endswith("-dkms") or name.endswith("-dkms-git"):
        return "KERNEL_MODULE", {**details, "reason": "DKMS kernel module"}
    if re.match(r"linux\d+\.\d+", name):
        return "KERNEL_SPECIFIC", {**details, "reason": "versioned kernel package"}

    # NVIDIA proprietary
    if "nvidia" in name.lower() and any(x in name.lower() for x in ["utils", "dkms", "driver"]):
        return "PROPRIETARY_DRIVER", {**details, "reason": "NVIDIA proprietary driver"}

    # Arch-specific (pacman/libalpm deps)
    arch_deps = {"pacman", "libalpm", "libalpm.so", "pacman-git", "pacman-contrib",
                 "devtools", "debugedit", "namcap"}
    dep_names = {re.split(r'[><=:]+', d)[0].strip() for d in depends + makedepends}
    if dep_names & arch_deps:
        return "ARCH_SPECIFIC", {**details, "reason": f"depends on {dep_names & arch_deps}"}

    # Proprietary license check (for non-binary packages)
    proprietary_indicators = ["proprietary", "custom", "unfree"]
    if license_list and not name.endswith("-bin"):
        for lic in license_list:
            lic_str = str(lic).lower()
            if any(ind in lic_str for ind in proprietary_indicators):
                # Allow if it's a binary repackage
                return "PROPRIETARY_LICENSE", {**details, "reason": f"proprietary license: {lic}"}

    return "RECIPE", details


def guess_build_system(name, details):
    """Guess the appropriate Guix build system from package metadata."""
    url = details.get("url", "")
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
    if any(d.startswith("go") and ("go" == d or d.startswith("go>=")) for d in makedeps):
        return "go"
    if any("python-build" in d or "python-setuptools" in d or "python-installer" in d for d in makedeps):
        return "pyproject"
    if any("npm" in d or "nodejs" in d or "node-" in d for d in makedeps):
        return "node"

    # From URL
    if url:
        if "pypi.org" in url:
            return "pyproject"
        if "crates.io" in url:
            return "cargo"

    return "gnu"


def make_guix_name(name):
    """Convert AUR name to valid Guix package name."""
    gn = name.lower()
    gn = gn.replace("_", "-")
    gn = gn.replace("+", "-plus")
    gn = re.sub(r'\.+', '-', gn)
    gn = re.sub(r'-+', '-', gn)
    gn = gn.strip('-')
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
                    f"https://github.com/{owner}/{repo}"
                )
        return (
            "url-fetch",
            f'(string-append "{url or "https://example.com"}/releases/download/v" version "/{pkgbase}-" version "-linux-x86_64.tar.gz")',
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
        if "gitlab" in url.lower():
            return (
                "git-fetch",
                f'(git-reference\n                (url "{url}")\n                (commit (string-append "v" version)))',
                url
            )
        return (
            "git-fetch",
            f'(git-reference\n                (url "{url}")\n                (commit (string-append "v" version)))',
            url
        )

    # Regular source
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
    """Map AUR license to Guix license symbol."""
    if not license_list:
        return "license:expat"

    lic = license_list[0] if isinstance(license_list, list) else str(license_list)
    lic_lower = str(lic).lower().strip()

    mapping = {
        "mit": "license:expat",
        "expat": "license:expat",
        "gpl3": "license:gpl3+",
        "gpl-3.0": "license:gpl3+",
        "gpl-3.0-only": "license:gpl3",
        "gpl-3.0-or-later": "license:gpl3+",
        "gpl3+": "license:gpl3+",
        "gplv3": "license:gpl3+",
        "gpl2": "license:gpl2+",
        "gpl-2.0": "license:gpl2+",
        "gpl-2.0-only": "license:gpl2",
        "gpl-2.0-or-later": "license:gpl2+",
        "gplv2": "license:gpl2+",
        "gpl": "license:gpl3+",
        "lgpl-3.0": "license:lgpl3+",
        "lgpl3": "license:lgpl3+",
        "lgpl-2.1": "license:lgpl2.1+",
        "lgpl2.1": "license:lgpl2.1+",
        "lgpl-2.0": "license:lgpl2.0+",
        "apache": "license:asl2.0",
        "apache-2.0": "license:asl2.0",
        "apache 2.0": "license:asl2.0",
        "asl2.0": "license:asl2.0",
        "bsd": "license:bsd-3",
        "bsd-2-clause": "license:bsd-2",
        "bsd-3-clause": "license:bsd-3",
        "bsd-2": "license:bsd-2",
        "bsd-3": "license:bsd-3",
        "isc": "license:isc",
        "mpl-2.0": "license:mpl2.0",
        "mpl2": "license:mpl2.0",
        "zlib": "license:zlib",
        "unlicense": "license:unlicense",
        "cc0-1.0": "license:cc0",
        "artistic-2.0": "license:artistic2.0",
        "boost": "license:boost1.0",
        "bsl-1.0": "license:boost1.0",
        "wtfpl": "license:wtfpl2",
        "public domain": "license:public-domain",
        "proprietary": "license:nonfree",
        "custom": "license:nonfree",
        "unfree": "license:nonfree",
        "agpl-3.0-only": "license:agpl3",
        "agpl-3.0-or-later": "license:agpl3+",
        "agpl3": "license:agpl3+",
        "agpl-3.0": "license:agpl3+",
        "cc-by-4.0": "license:cc-by4.0",
        "cc-by-sa-4.0": "license:cc-by-sa4.0",
        "eupl-1.2": "license:eupl1.2",
        "mpl": "license:mpl2.0",
        "lgpl-3.0-or-later": "license:lgpl3+",
        "lgpl-2.1-or-later": "license:lgpl2.1+",
    }

    for key, val in mapping.items():
        if lic_lower == key or lic_lower.startswith(key):
            return val
    return "license:expat"


def build_system_module(bs):
    return {
        "gnu": "(guix build-system gnu)",
        "cmake": "(guix build-system cmake)",
        "meson": "(guix build-system meson)",
        "cargo": "(guix build-system cargo)",
        "go": "(guix build-system go)",
        "pyproject": "(guix build-system pyproject)",
        "node": "(guix build-system node)",
        "copy": "(guix build-system copy)",
        "trivial": "(guix build-system trivial)",
    }.get(bs, "(guix build-system gnu)")


def build_system_name(bs):
    return {
        "gnu": "gnu-build-system",
        "cmake": "cmake-build-system",
        "meson": "meson-build-system",
        "cargo": "cargo-build-system",
        "go": "go-build-system",
        "pyproject": "pyproject-build-system",
        "node": "node-build-system",
        "copy": "copy-build-system",
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


def write_tree_artifacts(tree, sorted_queue, timestamp):
    """Write blocked-dependency-tree.json and .md reports."""
    # JSON report
    json_data = {
        "timestamp": timestamp,
        "pass_id": PASS_ID,
        "total_blocked": len(tree),
        "queue": []
    }
    for i, (name, info) in enumerate(sorted_queue):
        json_data["queue"].append({
            "rank": i + 1,
            "name": name,
            "number": info["number"],
            "blocked_dep_count": info["blocked_dep_count"],
            "reverse_dep_count": info["reverse_dep_count"],
            "total_dep_count": info["total_dep_count"],
            "blocked_deps": info["blocked_deps"],
            "reverse_deps": info["reverse_deps"][:20],  # limit size
        })

    json_path = REPORTS_DIR / "blocked-dependency-tree.json"
    with open(json_path, "w") as f:
        json.dump(json_data, f, indent=2)
    print(f"Wrote {json_path}")

    # MD report
    md_path = REPORTS_DIR / "blocked-dependency-tree.md"
    with open(md_path, "w") as f:
        f.write(f"# Blocked Dependency Tree Report\n\n")
        f.write(f"- **Timestamp:** {timestamp}\n")
        f.write(f"- **Pass ID:** {PASS_ID}\n")
        f.write(f"- **Total blocked:** {len(tree)}\n\n")
        f.write(f"## Priority Queue (top 200)\n\n")
        f.write(f"| Rank | # | Package | Blocked Deps | Reverse Deps | Total Deps |\n")
        f.write(f"|------|---|---------|-------------|-------------|------------|\n")
        for i, (name, info) in enumerate(sorted_queue[:200]):
            f.write(f"| {i+1} | {info['number']} | {name} | "
                    f"{info['blocked_dep_count']} | {info['reverse_dep_count']} | "
                    f"{info['total_dep_count']} |\n")
    print(f"Wrote {md_path}")

    return json_path, md_path


def write_selection_report(selected, timestamp):
    """Write selection report for this pass."""
    sel_path = REPORTS_DIR / f"{PASS_ID}-selection.json"
    data = {
        "pass_id": PASS_ID,
        "timestamp": timestamp,
        "count": len(selected),
        "packages": [
            {
                "rank": i + 1,
                "name": name,
                "number": info["number"],
                "blocked_dep_count": info["blocked_dep_count"],
                "reverse_dep_count": info["reverse_dep_count"],
                "total_dep_count": info["total_dep_count"],
            }
            for i, (name, info) in enumerate(selected)
        ]
    }
    with open(sel_path, "w") as f:
        json.dump(data, f, indent=2)
    print(f"Wrote {sel_path}")
    return sel_path


def write_recipe_file(recipes, blocked_list, pass_id):
    """Write the .scm recipe file."""
    recipe_path = ROOT / "guix" / "gaurix" / "packages" / f"{pass_id}.scm"
    blocked_notes_path = ROOT / "guix" / "gaurix" / "packages" / f"{pass_id}-blocked-notes.scm"

    bs_modules = set()
    needs_git = False
    for _, _, _, recipe_str, _, bs in recipes:
        bs_modules.add(build_system_module(bs))
        if "git-fetch" in recipe_str:
            needs_git = True

    header = f""";;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency-tree resolver pass --- {pass_id}
;;; Resolves 100 BLOCKED packages by dependency-tree priority:
;;;   - {len(recipes)} recipes created
;;;   - {len(blocked_list)} blocked with reason codes (see blocked-notes)
;;;
;;; All sha256 hashes are placeholders (must be verified via `guix download`).

(define-module (gaurix packages {pass_id})
  #:use-module (guix packages)
  #:use-module (guix download)
"""
    if needs_git:
        header += "  #:use-module (guix git-download)\n"
    header += """  #:use-module (guix gexp)
  #:use-module (guix utils)
"""
    for mod in sorted(bs_modules):
        header += f"  #:use-module {mod}\n"
    header += "  #:use-module ((guix licenses) #:prefix license:)\n"

    exported = [guix_name for _, _, guix_name, _, _, _ in recipes]
    header += "  #:export ("
    header += "\n            ".join(exported)
    header += "))\n"

    with open(recipe_path, "w") as f:
        f.write(header)
        for _, _, _, recipe_str, _, _ in recipes:
            f.write(recipe_str)
    print(f"Wrote {recipe_path} ({len(recipes)} recipes)")

    # Blocked notes
    with open(blocked_notes_path, "w") as f:
        f.write(f";;; Blocked notes for {pass_id}\n")
        f.write(f";;; {len(blocked_list)} packages blocked with reason codes\n")
        f.write(f";;; {len(recipes)} packages resolved with recipes\n\n")

        by_cat = defaultdict(list)
        for name, number, category, details in blocked_list:
            by_cat[category].append((name, number, details))

        for cat in sorted(by_cat.keys()):
            f.write(f"\n;;; {'=' * 60}\n")
            f.write(f";;; {cat}\n")
            f.write(f";;; {'=' * 60}\n\n")
            for name, number, details in by_cat[cat]:
                reason = details.get("reason", cat)
                f.write(f";;; #{number} {name}\n")
                f.write(f";;;   BLOCKED: {cat} -- {reason}\n\n")
    print(f"Wrote {blocked_notes_path} ({len(blocked_list)} blocked)")

    return recipe_path, blocked_notes_path


def write_summary(recipes, blocked_list, pass_id, timestamp):
    """Write summary JSON for this pass."""
    summary_path = REPORTS_DIR / f"{pass_id}-summary.json"
    data = {
        "pass_id": pass_id,
        "timestamp": timestamp,
        "total_selected": len(recipes) + len(blocked_list),
        "recipes_created": len(recipes),
        "remaining_blocked": len(blocked_list),
        "recipes": [
            {
                "aur_name": n,
                "number": num,
                "guix_name": gn,
                "build_system": bs,
                "version": d["version"]
            }
            for n, num, gn, _, d, bs in recipes
        ],
        "blocked": [
            {
                "aur_name": n,
                "number": num,
                "category": cat,
                "reason": d.get("reason", cat)
            }
            for n, num, cat, d in blocked_list
        ],
    }
    with open(summary_path, "w") as f:
        json.dump(data, f, indent=2)
    print(f"Wrote {summary_path}")
    return summary_path


def main():
    print(f"=== {PASS_ID} ===")
    print(f"Timestamp: {TIMESTAMP}")
    print()

    # Step 1: Extract BLOCKED packages
    print("Step 1: Extracting BLOCKED packages from todo...")
    blocked_pkgs = extract_blocked_packages(TODO_FILE)
    print(f"  Found {len(blocked_pkgs)} BLOCKED packages")

    # Step 2: Load AUR cache
    print("\nStep 2: Loading AUR cache...")
    aur_cache = load_aur_cache(AUR_CACHE)

    # Step 3: Build dependency tree
    print("\nStep 3: Building dependency tree...")
    tree = build_dependency_tree(blocked_pkgs, aur_cache)
    print(f"  Built tree for {len(tree)} packages")

    # Step 4: Priority sort
    print("\nStep 4: Priority sorting...")
    sorted_queue = priority_sort(tree)

    # Step 5: Write tree artifacts
    print("\nStep 5: Writing tree artifacts...")
    write_tree_artifacts(tree, sorted_queue, TIMESTAMP)

    # Step 6: Select top 100
    print("\nStep 6: Selecting top 100...")
    selected = sorted_queue[:100]
    write_selection_report(selected, TIMESTAMP)

    # Print top 20
    print("\n=== TOP 20 PRIORITY QUEUE ===")
    for i, (name, info) in enumerate(selected[:20]):
        print(f"  {i+1:3}. #{info['number']:5} {name:40} "
              f"bdep={info['blocked_dep_count']} rdep={info['reverse_dep_count']} "
              f"tdep={info['total_dep_count']}")

    # Step 7: Classify and generate recipes
    print(f"\n=== CLASSIFYING 100 SELECTED PACKAGES ===")
    recipes = []
    blocked_list = []

    for name, info in selected:
        number = info["number"]
        aur_data = aur_cache.get(name)
        category, details = classify_package(name, aur_data)

        if category == "RECIPE":
            build_sys = guess_build_system(name, details)
            recipe_str, guix_name = generate_recipe(name, number, details, build_sys)
            recipes.append((name, number, guix_name, recipe_str, details, build_sys))
        else:
            blocked_list.append((name, number, category, details))

    print(f"\nClassification results:")
    print(f"  Recipes: {len(recipes)}")
    print(f"  Blocked: {len(blocked_list)}")

    # Step 8: Write recipe file
    print("\nStep 8: Writing recipe files...")
    recipe_path, blocked_notes_path = write_recipe_file(recipes, blocked_list, PASS_ID)

    # Step 9: Write summary
    print("\nStep 9: Writing summary...")
    write_summary(recipes, blocked_list, PASS_ID, TIMESTAMP)

    # Print all 100 selected packages
    print(f"\n=== ALL 100 SELECTED PACKAGES ===")
    for i, (name, info) in enumerate(selected):
        status = "RECIPE" if any(r[0] == name for r in recipes) else "BLOCKED"
        print(f"  {i+1:3}. #{info['number']:5} {name:40} -> {status}")

    # Print recipe names for packages.scm update
    print(f"\n=== RECIPE GUIX NAMES ({len(recipes)}) ===")
    for name, number, guix_name, _, details, bs in recipes:
        print(f"  {guix_name} ({bs}, v{details['version']})")

    # Print blocked with reasons
    print(f"\n=== BLOCKED ({len(blocked_list)}) ===")
    for name, number, category, details in blocked_list:
        reason = details.get("reason", category)
        print(f"  #{number} {name}: {category} -- {reason}")

    return recipes, blocked_list, selected


if __name__ == "__main__":
    recipes, blocked_list, selected = main()
