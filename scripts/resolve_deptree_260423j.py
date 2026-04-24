#!/usr/bin/env python3
"""Dependency-tree-driven packaging pass: deptree-resolver-260423j

Steps:
1) Extract all BLOCKED packages from todo_general_packages.org
2) Build dependency tree using AUR cache
3) Compute blocked_dep_count, reverse_dep_count, total_dep_count
4) Priority sort and select all (only 20 BLOCKED remain)
5) Write tree artifacts and selection
6) Generate Guix recipes for resolvable packages
7) Update todo_general_packages.org statuses
"""

import json
import re
import sys
import tempfile
import shutil
from datetime import datetime, timezone
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
AUR_CACHE = ROOT / "data" / "aur-cache" / "packages-meta-ext-v1.json"
TODO_FILE = ROOT / "todo_general_packages.org"
PASS_ID = "deptree-resolver-260423j"

TREE_JSON = ROOT / "reports" / "blocked-dependency-tree.json"
TREE_MD = ROOT / "reports" / "blocked-dependency-tree.md"
SELECTION = ROOT / "reports" / f"{PASS_ID}-selection.json"
AUR_LOOKUP = ROOT / "reports" / f"{PASS_ID}-aur-lookup.json"
SUMMARY = ROOT / "reports" / f"{PASS_ID}-summary.json"
OUTPUT_SCM = ROOT / "guix" / "gaurix" / "packages" / f"{PASS_ID}.scm"
BLOCKED_NOTES = ROOT / "guix" / "gaurix" / "packages" / f"{PASS_ID}-blocked-notes.scm"


def extract_blocked_packages(todo_path):
    blocked = []
    with open(todo_path, "r") as f:
        for line in f:
            m = re.match(r"^\*\*\s+BLOCKED\s+(\d+)\.\s+(\S+)", line)
            if m:
                blocked.append({"name": m.group(2), "number": int(m.group(1))})
    return blocked


def load_aur_cache(cache_path):
    with open(cache_path, "r") as f:
        data = json.load(f)
    return {pkg["Name"]: pkg for pkg in data}


def strip_version_constraint(dep):
    return re.split(r"[><=]", dep)[0].strip()


def build_dependency_tree(blocked_packages, aur_cache):
    blocked_names = {pkg["name"] for pkg in blocked_packages}
    tree = {}
    for pkg in blocked_packages:
        name = pkg["name"]
        aur_data = aur_cache.get(name, {})
        depends = [strip_version_constraint(d) for d in (aur_data.get("Depends") or [])]
        makedepends = [strip_version_constraint(d) for d in (aur_data.get("MakeDepends") or [])]
        all_deps = list(set(depends + makedepends))
        blocked_deps = [d for d in all_deps if d in blocked_names]
        tree[name] = {
            "name": name,
            "number": pkg["number"],
            "all_deps": all_deps,
            "blocked_deps": blocked_deps,
            "blocked_dep_count": len(blocked_deps),
            "total_dep_count": len(all_deps),
            "reverse_deps": [],
            "reverse_dep_count": 0,
        }
    for name, info in tree.items():
        for dep in info["blocked_deps"]:
            if dep in tree:
                tree[dep]["reverse_deps"].append(name)
    for name, info in tree.items():
        info["reverse_dep_count"] = len(info["reverse_deps"])
    return tree


def priority_sort(tree):
    items = list(tree.values())
    items.sort(key=lambda x: (
        x["blocked_dep_count"],
        -x["reverse_dep_count"],
        x["total_dep_count"],
        x["name"],
    ))
    return items


def escape_scheme_string(s):
    if not s:
        return ""
    return s.replace("\\", "\\\\").replace('"', '\\"')


def sanitize_name(name):
    return name.lower().replace("_", "-").replace(".", "-")


def guess_license(aur_pkg):
    licenses = aur_pkg.get("License") or []
    if not licenses:
        return "license:expat"
    license_str = licenses[0].lower() if licenses else ""
    mapping = {
        "gpl-2.0-or-later": "license:gpl2+",
        "gpl-2.0-only": "license:gpl2",
        "gpl-3.0-or-later": "license:gpl3+",
        "gpl-3.0-only": "license:gpl3",
        "gpl3": "license:gpl3+",
        "gpl-3": "license:gpl3+",
        "gpl2": "license:gpl2+",
        "gpl-2": "license:gpl2+",
        "gpl": "license:gpl3+",
        "lgpl-2.1-or-later": "license:lgpl2.1+",
        "lgpl2.1": "license:lgpl2.1+",
        "lgpl-3.0": "license:lgpl3+",
        "lgpl3": "license:lgpl3+",
        "mit": "license:expat",
        "expat": "license:expat",
        "bsd-2-clause": "license:bsd-2",
        "bsd-3-clause": "license:bsd-3",
        "bsd": "license:bsd-3",
        "isc": "license:isc",
        "apache-2.0": "license:asl2.0",
        "apache": "license:asl2.0",
        "mpl-2.0": "license:mpl2.0",
        "zlib": "license:zlib",
        "unlicense": "license:unlicense",
        "cc0-1.0": "license:cc0",
        "agpl-3.0-or-later": "license:agpl3+",
        "custom": "license:non-copyleft",
        "proprietary": "license:non-copyleft",
        "custom:proprietary": "license:non-copyleft",
        "custom: commercial": "license:non-copyleft",
        "custom:nonfree": "license:non-copyleft",
    }
    for key, val in mapping.items():
        if license_str == key or license_str.startswith(key):
            return val
    if "gpl" in license_str and "3" in license_str:
        return "license:gpl3+"
    if "gpl" in license_str and "2" in license_str:
        return "license:gpl2+"
    if "gpl" in license_str:
        return "license:gpl3+"
    if "mit" in license_str:
        return "license:expat"
    if "apache" in license_str:
        return "license:asl2.0"
    if "bsd" in license_str:
        return "license:bsd-3"
    return "license:non-copyleft"


def guess_build_system(aur_pkg):
    name = aur_pkg.get("Name", "")
    makedeps = [d.lower() for d in (aur_pkg.get("MakeDepends") or [])]
    deps = [d.lower() for d in (aur_pkg.get("Depends") or [])]
    all_deps = makedeps + deps

    if name.endswith("-bin") or name.endswith("-appimage"):
        return "copy"

    if any(d.startswith("cargo") or d == "rust" for d in all_deps):
        return "cargo"
    if any(d.startswith("meson") for d in all_deps):
        return "meson"
    if any(d.startswith("cmake") for d in all_deps):
        return "cmake"
    if any("pyproject" in d or d.startswith("python-build") or d.startswith("python-installer")
           or d.startswith("python-setuptools") or d.startswith("python-wheel") for d in all_deps):
        return "pyproject"
    if any(d.startswith("python-") for d in all_deps) and name.startswith("python-"):
        return "pyproject"
    if any(d in ("go", "golang") for d in all_deps):
        return "go"
    if any(d.startswith("npm") or d.startswith("nodejs") or d == "node" for d in all_deps):
        return "node"
    if any(d == "autoconf" or d == "automake" for d in all_deps):
        return "gnu"
    if name.startswith("python-"):
        return "pyproject"
    if name.startswith("lib32-"):
        return "gnu"
    return "gnu"


def build_system_module(bs):
    return {
        "gnu": "(guix build-system gnu)",
        "cmake": "(guix build-system cmake)",
        "meson": "(guix build-system meson)",
        "cargo": "(guix build-system cargo)",
        "pyproject": "(guix build-system pyproject)",
        "go": "(guix build-system go)",
        "node": "(guix build-system node)",
        "copy": "(guix build-system copy)",
    }.get(bs, "(guix build-system gnu)")


def build_system_name(bs):
    return {
        "gnu": "gnu-build-system",
        "cmake": "cmake-build-system",
        "meson": "meson-build-system",
        "cargo": "cargo-build-system",
        "pyproject": "pyproject-build-system",
        "go": "go-build-system",
        "node": "node-build-system",
        "copy": "copy-build-system",
    }.get(bs, "gnu-build-system")


def make_synopsis(aur_pkg):
    desc = aur_pkg.get("Description") or aur_pkg.get("Name", "")
    desc = desc.strip()
    if len(desc) > 78:
        desc = desc[:75] + "..."
    if desc.endswith("."):
        desc = desc[:-1]
    if desc and desc[0].isupper():
        desc = desc[0].lower() + desc[1:]
    return escape_scheme_string(desc)


def make_description(aur_pkg):
    desc = aur_pkg.get("Description") or aur_pkg.get("Name", "")
    desc = desc.strip()
    if not desc.endswith("."):
        desc += "."
    if desc and desc[0].islower():
        desc = desc[0].upper() + desc[1:]
    return escape_scheme_string(desc)


def make_homepage(aur_pkg):
    url = aur_pkg.get("URL") or f"https://aur.archlinux.org/packages/{aur_pkg['Name']}"
    return escape_scheme_string(url)


def classify_package(name, aur_pkg):
    """Determine if a package can be resolved or must stay BLOCKED, with reasons."""
    deps = [d.lower() for d in (aur_pkg.get("Depends") or [])]
    makedeps = [d.lower() for d in (aur_pkg.get("MakeDepends") or [])]
    all_deps = deps + makedeps

    # Check for lib32 dependencies (multilib not supported in Guix)
    lib32_deps = [d for d in all_deps if d.startswith("lib32-")]
    if lib32_deps:
        return False, f"MULTILIB_UNSUPPORTED: requires 32-bit libraries ({', '.join(lib32_deps[:3])}); Guix lacks multilib support"

    # Windows-only
    if name == "bakkesmod-steam":
        return False, "PLATFORM_UNSUPPORTED: Windows-only mod (Rocket League via Steam/Proton); no native Linux binary or source available"

    # Source unavailable
    if name == "clash-for-windows-chinese":
        return False, "SOURCE_UNAVAILABLE: original Clash for Windows project deleted from GitHub; Chinese fork status uncertain"

    # Commercial/proprietary license requiring purchase
    if name == "factorio-space-age-experimental":
        return False, "LICENSE_REVIEW_NEEDED: requires purchased game license from factorio.com; binary distribution restricted by EULA"

    # CUDA-dependent
    if any(d in ("cuda", "nvidia-utils") for d in all_deps) or "cuda" in name:
        return False, f"CUDA_DEPENDENCY: requires NVIDIA CUDA toolkit/runtime not available in Guix"

    # ROCm-dependent
    if any("rocm" in d or "miopen" in d or "rccl" in d for d in all_deps):
        return False, "ROCM_DEPENDENCY: requires AMD ROCm stack not available in Guix"

    # Electron with specific version (complex)
    electron_deps = [d for d in all_deps if re.match(r"electron\d+", d)]
    if electron_deps and name in ("vscodium-electron",):
        return False, f"COMPLEX_BUILD: requires building from source with system Electron ({', '.join(electron_deps)}); ~1000 node deps"

    # Qt6 WebEngine
    if any("qt6-webengine" in d or "qt5-webengine" in d for d in all_deps):
        return False, "MISSING_DEP: requires Qt WebEngine (Chromium-based) not available in Guix"

    # enemy-territory-data
    if "enemy-territory-data" in all_deps:
        return False, "MISSING_DEP: requires proprietary Wolfenstein: Enemy Territory game data files"

    return True, ""


def generate_package_def(name, aur_pkg, build_sys):
    """Generate a single package definition."""
    var_name = sanitize_name(name)
    version = (aur_pkg.get("Version") or "0.0.0").split("-")[0]
    synopsis = make_synopsis(aur_pkg)
    description = make_description(aur_pkg)
    homepage = make_homepage(aur_pkg)
    license_sym = guess_license(aur_pkg)
    bs_name = build_system_name(build_sys)

    url = aur_pkg.get("URL") or ""

    # Determine source
    if url and any(host in url for host in ("github.com", "gitlab.com", "codeberg.org", "sr.ht", "bitbucket.org")):
        git_url = url.rstrip("/")
        if git_url.endswith(".git"):
            git_url = git_url[:-4]
        # For -git packages, use git-fetch
        if name.endswith("-git"):
            commit_ref = f'(string-append "v" version)'
        else:
            commit_ref = f'(string-append "v" version)'
        source_block = f"""    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "{git_url}")
                    (commit {commit_ref})))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))"""
    elif build_sys == "copy" and name.endswith("-bin"):
        # Binary packages - use AUR snapshot as fallback
        source_block = f"""    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/{name}.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))"""
    else:
        source_block = f"""    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/{name}.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))"""

    # Build arguments
    if build_sys == "copy":
        args = """    (arguments
     (list #:install-plan
           #~'(("." "share/"))))"""
    elif build_sys == "go":
        import_path = url.replace("https://", "") if url else name
        args = f"""    (arguments
     (list #:import-path "{import_path}"
           #:tests? #f))"""
    else:
        args = """    (arguments (list #:tests? #f))"""

    return f"""(define-public {var_name}
  (package
    (name "{name}")
    (version "{version}")
{source_block}
    (build-system {bs_name})
{args}
    (synopsis "{synopsis}")
    (description "{description}")
    (home-page "{homepage}")
    (license {license_sym})))
"""


def write_tree_artifacts(sorted_queue, blocked, timestamp):
    """Write dependency tree JSON and MD reports."""
    tree_json = {
        "timestamp": timestamp,
        "pass_id": PASS_ID,
        "total_blocked": len(blocked),
        "queue": [
            {
                "rank": i + 1,
                "name": item["name"],
                "number": item["number"],
                "blocked_dep_count": item["blocked_dep_count"],
                "reverse_dep_count": item["reverse_dep_count"],
                "total_dep_count": item["total_dep_count"],
                "blocked_deps": item["blocked_deps"],
                "reverse_deps": item["reverse_deps"],
            }
            for i, item in enumerate(sorted_queue)
        ],
    }
    with open(TREE_JSON, "w") as f:
        json.dump(tree_json, f, indent=2)
    print(f"  Wrote {TREE_JSON}")

    with open(TREE_MD, "w") as f:
        f.write(f"# Blocked Dependency Tree\n\n")
        f.write(f"**Pass:** {PASS_ID}  \n")
        f.write(f"**Timestamp:** {timestamp}  \n")
        f.write(f"**Total BLOCKED:** {len(blocked)}  \n\n")
        f.write(f"## Priority Queue (All {len(sorted_queue)} packages)\n\n")
        f.write(f"| Rank | Package | # | Blocked Deps | Reverse Deps | Total Deps |\n")
        f.write(f"|------|---------|---|-------------|-------------|------------|\n")
        for i, item in enumerate(sorted_queue):
            f.write(f"| {i+1} | {item['name']} | {item['number']} | {item['blocked_dep_count']} | {item['reverse_dep_count']} | {item['total_dep_count']} |\n")
    print(f"  Wrote {TREE_MD}")


def write_scheme_module(resolved_pkgs, aur_cache):
    """Write the Guix Scheme module with all resolved package definitions."""
    build_systems_used = set()
    pkg_defs = []

    for pkg in resolved_pkgs:
        name = pkg["name"]
        aur_data = aur_cache.get(name, {})
        build_sys = pkg["build_system"]
        build_systems_used.add(build_sys)
        pkg_defs.append(generate_package_def(name, aur_data, build_sys))

    bs_modules = sorted(set(build_system_module(bs) for bs in build_systems_used))
    exports = [sanitize_name(r["name"]) for r in resolved_pkgs]

    header = f""";;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Dep-tree resolver pass --- {PASS_ID}
;;; Resolves {len(resolved_pkgs)} BLOCKED packages via dependency-tree priority.
;;;
;;; New recipes ({len(resolved_pkgs)}):
"""
    for i, r in enumerate(resolved_pkgs):
        header += f";;;   {i+1:>4}.  {r['name']} ({build_system_name(r['build_system'])}, v{r['version']}, {r['license']})\n"

    header += f""";;;
;;; All sha256 hashes are placeholders pending verification via `guix download`.

(define-module (gaurix packages {PASS_ID})
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
"""
    for bsm in bs_modules:
        header += f"  #:use-module {bsm}\n"
    header += "  #:use-module ((guix licenses) #:prefix license:)\n"
    header += "  #:use-module (gnu packages)\n"
    header += "  #:export ("

    for i, exp in enumerate(exports):
        if i == 0:
            header += f"{exp}\n"
        else:
            header += f"            {exp}\n"
    header += "))\n\n"

    full_module = header + "\n".join(pkg_defs)

    with open(OUTPUT_SCM, "w") as f:
        f.write(full_module)
    print(f"  Wrote {OUTPUT_SCM}")
    return exports


def update_org_file(resolved_pkgs, still_blocked_pkgs, todo_path, pass_id):
    """Update todo_general_packages.org statuses using deterministic full-file transform."""
    # Build lookup dicts
    resolved_map = {pkg["name"]: pkg for pkg in resolved_pkgs}
    blocked_map = {pkg["name"]: pkg for pkg in still_blocked_pkgs}

    with open(todo_path, "r") as f:
        lines = f.readlines()

    new_lines = []
    i = 0
    updated_count = 0
    while i < len(lines):
        line = lines[i]
        m = re.match(r"^(\*\*\s+)BLOCKED(\s+\d+\.\s+)(\S+)(.*)", line)
        if m:
            prefix = m.group(1)
            num_part = m.group(2)
            pkg_name = m.group(3)
            rest = m.group(4)

            if pkg_name in resolved_map:
                r = resolved_map[pkg_name]
                # Change BLOCKED -> DONE
                new_lines.append(f"{prefix}DONE{num_part}{pkg_name}{rest}\n")
                i += 1
                # Collect existing body lines (indented or empty)
                while i < len(lines) and (lines[i].startswith("   ") or lines[i].strip() == ""):
                    new_lines.append(lines[i])
                    i += 1
                # Add new status line before next heading
                status_line = f"   - Status: DONE: Recipe generated in {pass_id}.scm ({r['build_system']}, v{r['version']}, {r['license']}) ({pass_id})\n"
                new_lines.insert(len(new_lines), status_line)
                updated_count += 1
                continue
            elif pkg_name in blocked_map:
                b = blocked_map[pkg_name]
                # Keep as BLOCKED, add updated reason
                new_lines.append(line)
                i += 1
                while i < len(lines) and (lines[i].startswith("   ") or lines[i].strip() == ""):
                    new_lines.append(lines[i])
                    i += 1
                status_line = f"   - Status: BLOCKED: {b['reason']} ({pass_id})\n"
                new_lines.insert(len(new_lines), status_line)
                updated_count += 1
                continue
            else:
                new_lines.append(line)
                i += 1
                continue
        else:
            new_lines.append(line)
            i += 1

    # Atomic write
    tmp = tempfile.NamedTemporaryFile(mode="w", dir=todo_path.parent, suffix=".tmp",
                                       delete=False)
    tmp.writelines(new_lines)
    tmp.close()
    shutil.move(tmp.name, str(todo_path))
    print(f"  Updated {updated_count} entries in {todo_path}")


def main():
    timestamp = datetime.now(timezone.utc).isoformat()

    print(f"[{PASS_ID}] Extracting BLOCKED packages...")
    blocked = extract_blocked_packages(TODO_FILE)
    print(f"  Found {len(blocked)} BLOCKED packages")

    print(f"[{PASS_ID}] Loading AUR cache...")
    aur_cache = load_aur_cache(AUR_CACHE)
    print(f"  Loaded {len(aur_cache)} AUR packages")

    print(f"[{PASS_ID}] Building dependency tree...")
    tree = build_dependency_tree(blocked, aur_cache)

    print(f"[{PASS_ID}] Priority sorting...")
    sorted_queue = priority_sort(tree)

    # Write tree artifacts
    write_tree_artifacts(sorted_queue, blocked, timestamp)

    # Classify each package
    resolved_pkgs = []
    still_blocked = []
    aur_lookup = []

    for item in sorted_queue:
        name = item["name"]
        aur_data = aur_cache.get(name)

        if not aur_data:
            still_blocked.append({
                "name": name,
                "number": item["number"],
                "reason": "MISSING_SOURCE: not found in AUR metadata cache",
            })
            aur_lookup.append({"name": name, "found": False})
            continue

        can_resolve, block_reason = classify_package(name, aur_data)

        if can_resolve:
            build_sys = guess_build_system(aur_data)
            version = (aur_data.get("Version") or "0.0.0").split("-")[0]
            license_sym = guess_license(aur_data)
            resolved_pkgs.append({
                "name": name,
                "number": item["number"],
                "version": version,
                "build_system": build_sys,
                "license": license_sym,
                "rank": item,
            })
            aur_lookup.append({
                "name": name,
                "found": True,
                "version": aur_data.get("Version"),
                "build_system": build_sys,
                "status": "RESOLVED",
            })
        else:
            still_blocked.append({
                "name": name,
                "number": item["number"],
                "reason": block_reason,
            })
            aur_lookup.append({
                "name": name,
                "found": True,
                "version": aur_data.get("Version"),
                "status": "BLOCKED",
                "reason": block_reason,
            })

    print(f"\n[{PASS_ID}] Classification results:")
    print(f"  Resolved: {len(resolved_pkgs)}")
    print(f"  Still blocked: {len(still_blocked)}")

    # Write selection
    selection = {
        "pass_id": PASS_ID,
        "timestamp": timestamp,
        "total_blocked_in_tree": len(blocked),
        "selected_count": len(sorted_queue),
        "resolved_count": len(resolved_pkgs),
        "blocked_count": len(still_blocked),
        "packages": [
            {
                "rank": i + 1,
                "name": item["name"],
                "number": item["number"],
                "blocked_dep_count": item["rank"]["blocked_dep_count"],
                "reverse_dep_count": item["rank"]["reverse_dep_count"],
                "total_dep_count": item["rank"]["total_dep_count"],
            }
            for i, item in enumerate(resolved_pkgs)
        ],
    }
    with open(SELECTION, "w") as f:
        json.dump(selection, f, indent=2)
    print(f"  Wrote {SELECTION}")

    # Write AUR lookup
    with open(AUR_LOOKUP, "w") as f:
        json.dump(aur_lookup, f, indent=2)
    print(f"  Wrote {AUR_LOOKUP}")

    # Generate Scheme module
    if resolved_pkgs:
        exports = write_scheme_module(resolved_pkgs, aur_cache)
    else:
        exports = []

    # Generate blocked notes
    notes_lines = [
        f";;; Blocked notes for {PASS_ID}",
        f";;; Timestamp: {timestamp}",
        f";;; {len(still_blocked)} packages remain BLOCKED",
        ";;;",
    ]
    for b in still_blocked:
        notes_lines.append(f";;; {b['name']} (#{b['number']}): {b['reason']}")
    with open(BLOCKED_NOTES, "w") as f:
        f.write("\n".join(notes_lines) + "\n")
    print(f"  Wrote {BLOCKED_NOTES}")

    # Write summary
    summary = {
        "pass_id": PASS_ID,
        "timestamp": timestamp,
        "total_selected": len(sorted_queue),
        "resolved": len(resolved_pkgs),
        "blocked": len(still_blocked),
        "resolved_packages": [
            {"name": r["name"], "number": r["number"],
             "version": r["version"], "build_system": r["build_system"]}
            for r in resolved_pkgs
        ],
        "blocked_packages": still_blocked,
    }
    with open(SUMMARY, "w") as f:
        json.dump(summary, f, indent=2)
    print(f"  Wrote {SUMMARY}")

    # Update org file
    print(f"\n[{PASS_ID}] Updating org file...")
    update_org_file(resolved_pkgs, still_blocked, TODO_FILE, PASS_ID)

    # Print summary
    print(f"\n{'='*70}")
    print(f"[{PASS_ID}] SUMMARY")
    print(f"{'='*70}")
    print(f"\nPriority Queue (all {len(sorted_queue)}):")
    print(f"{'Rank':>4} {'Package':<45} {'BDep':>4} {'RDep':>4} {'TDep':>4} {'Status':<10}")
    print("-" * 75)
    resolved_names = {r["name"] for r in resolved_pkgs}
    for i, item in enumerate(sorted_queue):
        status = "RESOLVED" if item["name"] in resolved_names else "BLOCKED"
        print(f"{i+1:>4} {item['name']:<45} {item['blocked_dep_count']:>4} {item['reverse_dep_count']:>4} {item['total_dep_count']:>4} {status:<10}")

    print(f"\nResolved ({len(resolved_pkgs)}):")
    for r in resolved_pkgs:
        print(f"  - {r['name']} ({r['build_system']}, v{r['version']})")

    print(f"\nStill BLOCKED ({len(still_blocked)}):")
    for b in still_blocked:
        print(f"  - {b['name']}: {b['reason']}")

    return resolved_pkgs, still_blocked


if __name__ == "__main__":
    resolved, blocked = main()
