#!/usr/bin/env python3
"""
Dependency tree resolver — deptree-resolver-260417y

Builds a dependency tree for all BLOCKED packages, priority-sorts them,
selects the top batch, checks for existing recipes, and outputs selection data.
"""

import json
import os
import re
import sys
from datetime import datetime, timezone

PASS_ID = "deptree-resolver-260417y"
TODO_PATH = "todo_general_packages.org"
AUR_CACHE_PATH = "data/aur-cache/packages-meta-ext-v1.json"
PACKAGES_DIR = "guix/gaurix/packages"
REPORT_DIR = "reports"
MAX_SELECT = 100  # Will select all if fewer than 100


def extract_blocked_packages(todo_path):
    """Extract all BLOCKED packages from the todo file."""
    blocked = []
    with open(todo_path, "r") as f:
        for line in f:
            m = re.match(r"^\*\* BLOCKED (\d+)\. (\S+)", line)
            if m:
                blocked.append({"number": int(m.group(1)), "name": m.group(2).strip()})
    return blocked


def load_aur_cache(cache_path):
    """Load AUR metadata cache and index by package name."""
    with open(cache_path, "r") as f:
        data = json.load(f)
    return {entry["Name"]: entry for entry in data}


def strip_version_constraint(dep):
    """Strip version constraints from dependency strings."""
    return re.split(r"[><=:]", dep)[0].strip()


def scan_existing_recipes(packages_dir):
    """Scan all .scm files for existing define-public package definitions."""
    existing = {}  # package-name -> list of files containing it
    for fname in os.listdir(packages_dir):
        if not fname.endswith(".scm"):
            continue
        fpath = os.path.join(packages_dir, fname)
        try:
            with open(fpath, "r") as f:
                content = f.read()
        except Exception:
            continue
        # Find define-public forms
        for m in re.finditer(r'\(define-public\s+(\S+)', content):
            pkg_name = m.group(1)
            if pkg_name not in existing:
                existing[pkg_name] = []
            existing[pkg_name].append(fname)
        # Also find (name "...") patterns to catch AUR-style names
        for m in re.finditer(r'\(name\s+"([^"]+)"\)', content):
            pkg_name = m.group(1)
            if pkg_name not in existing:
                existing[pkg_name] = []
            if fname not in existing[pkg_name]:
                existing[pkg_name].append(fname)
    return existing


def build_dependency_tree(blocked_packages, aur_cache):
    """Build dependency tree with metrics for each blocked package."""
    blocked_names = {p["name"] for p in blocked_packages}
    blocked_by_name = {p["name"]: p for p in blocked_packages}

    tree = []
    for pkg in blocked_packages:
        name = pkg["name"]
        aur_entry = aur_cache.get(name, {})

        # Get all dependencies
        depends = [strip_version_constraint(d) for d in (aur_entry.get("Depends") or [])]
        makedepends = [strip_version_constraint(d) for d in (aur_entry.get("MakeDepends") or [])]
        all_deps = list(set(depends + makedepends))

        # Compute blocked dependencies
        blocked_deps = [d for d in all_deps if d in blocked_names]

        tree.append({
            "name": name,
            "number": pkg["number"],
            "blocked_dep_count": len(blocked_deps),
            "total_dep_count": len(all_deps),
            "blocked_deps": sorted(blocked_deps),
            "all_deps": sorted(all_deps),
            "in_aur": name in aur_cache,
            "aur_entry": {
                "Version": aur_entry.get("Version", ""),
                "Description": aur_entry.get("Description", ""),
                "URL": aur_entry.get("URL", ""),
                "License": aur_entry.get("License", []),
                "NumVotes": aur_entry.get("NumVotes", 0),
                "Popularity": aur_entry.get("Popularity", 0),
                "Maintainer": aur_entry.get("Maintainer", ""),
                "OutOfDate": aur_entry.get("OutOfDate"),
            } if name in aur_cache else None,
        })

    # Compute reverse dependencies
    reverse_deps = {pkg["name"]: [] for pkg in blocked_packages}
    for entry in tree:
        for dep in entry["blocked_deps"]:
            if dep in reverse_deps:
                reverse_deps[dep].append(entry["name"])

    for entry in tree:
        entry["reverse_dep_count"] = len(reverse_deps.get(entry["name"], []))
        entry["reverse_deps"] = sorted(reverse_deps.get(entry["name"], []))

    return tree


def priority_sort(tree):
    """Sort by: blocked_dep_count ASC, reverse_dep_count DESC, total_dep_count ASC, name ASC."""
    return sorted(tree, key=lambda x: (
        x["blocked_dep_count"],
        -x["reverse_dep_count"],
        x["total_dep_count"],
        x["name"],
    ))


def main():
    print(f"=== {PASS_ID} ===")

    # Step 1: Extract BLOCKED packages
    blocked = extract_blocked_packages(TODO_PATH)
    print(f"Total BLOCKED packages: {len(blocked)}")

    # Step 2: Load AUR cache
    aur_cache = load_aur_cache(AUR_CACHE_PATH)
    print(f"AUR cache entries: {len(aur_cache)}")

    # Step 3: Scan existing recipes
    existing = scan_existing_recipes(PACKAGES_DIR)
    print(f"Existing recipe names: {len(existing)}")

    # Step 4: Build dependency tree
    tree = build_dependency_tree(blocked, aur_cache)
    print(f"Tree entries: {len(tree)}")

    # Step 5: Priority sort
    sorted_tree = priority_sort(tree)

    # Step 6: Select (up to MAX_SELECT)
    selected = sorted_tree[:MAX_SELECT]
    print(f"Selected: {len(selected)}")

    # Step 7: Check existing recipes for each selected package
    for entry in selected:
        name = entry["name"]
        # Check various name forms
        guix_name = name  # Direct match
        guix_name_alt = name.replace(".", "-")  # dots to hyphens
        matches = existing.get(guix_name, []) or existing.get(guix_name_alt, [])
        entry["existing_recipes"] = matches
        entry["already_resolved"] = len(matches) > 0

    already_resolved = [e for e in selected if e["already_resolved"]]
    needs_recipe = [e for e in selected if not e["already_resolved"]]
    print(f"Already resolved (recipe exists): {already_resolved}")
    print(f"Needs new recipe: {len(needs_recipe)}")

    # Step 8: Rank and output
    for i, entry in enumerate(selected):
        entry["rank"] = i + 1

    # Add timestamp
    timestamp = datetime.now(timezone.utc).isoformat()

    # Write tree report
    os.makedirs(REPORT_DIR, exist_ok=True)

    tree_report = {
        "timestamp": timestamp,
        "pass_id": PASS_ID,
        "total_blocked": len(blocked),
        "queue": [{
            "rank": e["rank"],
            "name": e["name"],
            "number": e["number"],
            "blocked_dep_count": e["blocked_dep_count"],
            "reverse_dep_count": e["reverse_dep_count"],
            "total_dep_count": e["total_dep_count"],
            "blocked_deps": e["blocked_deps"],
            "reverse_deps": e["reverse_deps"],
            "in_aur": e["in_aur"],
            "already_resolved": e["already_resolved"],
            "existing_recipes": e["existing_recipes"],
        } for e in selected]
    }

    tree_path = os.path.join(REPORT_DIR, "blocked-dependency-tree.json")
    with open(tree_path, "w") as f:
        json.dump(tree_report, f, indent=2)
    print(f"Wrote: {tree_path}")

    # Write selection report
    selection = {
        "timestamp": timestamp,
        "pass_id": PASS_ID,
        "total_blocked": len(blocked),
        "selected_count": len(selected),
        "already_resolved_count": len(already_resolved),
        "needs_recipe_count": len(needs_recipe),
        "selected": [{
            "rank": e["rank"],
            "name": e["name"],
            "number": e["number"],
            "blocked_dep_count": e["blocked_dep_count"],
            "reverse_dep_count": e["reverse_dep_count"],
            "total_dep_count": e["total_dep_count"],
            "in_aur": e["in_aur"],
            "already_resolved": e["already_resolved"],
            "existing_recipes": e["existing_recipes"],
            "aur_entry": e.get("aur_entry"),
        } for e in selected]
    }

    sel_path = os.path.join(REPORT_DIR, f"{PASS_ID}-selection.json")
    with open(sel_path, "w") as f:
        json.dump(selection, f, indent=2)
    print(f"Wrote: {sel_path}")

    # Write markdown tree report
    md_path = os.path.join(REPORT_DIR, "blocked-dependency-tree.md")
    with open(md_path, "w") as f:
        f.write(f"# Blocked Dependency Tree — {PASS_ID}\n\n")
        f.write(f"Generated: {timestamp}\n\n")
        f.write(f"Total BLOCKED: {len(blocked)}\n\n")
        f.write(f"## Priority Queue (all {len(selected)} packages)\n\n")
        f.write("| Rank | Package | # | Blocked Deps | Reverse Deps | Total Deps | In AUR | Status |\n")
        f.write("|------|---------|---|-------------|-------------|-----------|--------|--------|\n")
        for e in selected:
            status = "ALREADY_RESOLVED" if e["already_resolved"] else "NEEDS_RECIPE"
            f.write(f"| {e['rank']} | {e['name']} | {e['number']} | "
                    f"{e['blocked_dep_count']} | {e['reverse_dep_count']} | "
                    f"{e['total_dep_count']} | {'Y' if e['in_aur'] else 'N'} | {status} |\n")
    print(f"Wrote: {md_path}")

    # Print summary for console
    print(f"\n=== TOP 20 PRIORITY QUEUE ===")
    for e in selected[:20]:
        status = "RESOLVED" if e["already_resolved"] else "NEW"
        print(f"  {e['rank']:3d}. {e['name']:<40s} blocked={e['blocked_dep_count']} "
              f"rev={e['reverse_dep_count']} total={e['total_dep_count']} "
              f"aur={'Y' if e['in_aur'] else 'N'} [{status}]")

    print(f"\n=== NEEDS RECIPE ({len(needs_recipe)}) ===")
    for e in needs_recipe:
        aur = e.get("aur_entry") or {}
        print(f"  {e['rank']:3d}. {e['name']:<40s} v={aur.get('Version','?'):<15s} "
              f"url={aur.get('URL','N/A')}")

    return selection


if __name__ == "__main__":
    selection = main()
