#!/usr/bin/env python3
"""Build dependency tree for BLOCKED packages and select top 100 by priority.

Pass identifier: deptree-resolver-260414q

Priority sort:
  1. blocked_dep_count ascending
  2. reverse_dep_count descending
  3. total_dep_count ascending
  4. package name ascending
"""

import json
import re
import sys
from datetime import datetime, timezone
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
TODO_FILE = ROOT / "todo_general_packages.org"
AUR_CACHE = ROOT / "data" / "aur-cache" / "packages-meta-ext-v1.json"
TREE_JSON = ROOT / "reports" / "blocked-dependency-tree.json"
TREE_MD = ROOT / "reports" / "blocked-dependency-tree.md"
SELECTION_JSON = ROOT / "reports" / "deptree-resolver-260414q-selection.json"


def extract_blocked_packages(todo_path):
    """Extract all currently BLOCKED packages from the org file.

    Returns dict: {package_name: entry_number}

    A package is BLOCKED if the LAST 'TODO Status:' line says BLOCKED
    and there's no subsequent 'Status: DONE' line overriding it.
    """
    blocked = {}
    current_number = None
    current_name = None
    current_todo_status = None
    has_done_override = False

    with open(todo_path, "r") as f:
        for line in f:
            # Match entry headers like: ** BLOCKED 17. tableplus [...]
            # or ** DONE 15. dbeaver [BLOCKED: ...]
            m = re.match(r"^\*\*\s+\S+\s+(\d+)\.\s+(\S+)", line)
            if m:
                # Save previous entry if it was blocked
                if current_name and current_todo_status == "BLOCKED" and not has_done_override:
                    blocked[current_name] = current_number
                current_number = int(m.group(1))
                current_name = m.group(2)
                current_todo_status = None
                has_done_override = False
                continue

            # Match TODO Status lines
            m2 = re.match(r"\s+-\s+TODO Status:\s+(\S+)", line)
            if m2:
                current_todo_status = m2.group(1)
                continue

            # Check for DONE override after BLOCKED TODO Status
            m3 = re.match(r"\s+-\s+Status:\s+DONE:", line)
            if m3 and current_todo_status == "BLOCKED":
                has_done_override = True

        # Don't forget last entry
        if current_name and current_todo_status == "BLOCKED" and not has_done_override:
            blocked[current_name] = current_number

    return blocked


def load_aur_cache(cache_path):
    """Load AUR metadata. Returns dict: {package_name: package_data}"""
    with open(cache_path, "r") as f:
        data = json.load(f)
    return {pkg["Name"]: pkg for pkg in data}


def build_dependency_tree(blocked_packages, aur_cache):
    """Build dependency tree for blocked packages.

    For each blocked package, compute:
    - blocked_dep_count: how many of its direct deps are also blocked
    - reverse_dep_count: how many blocked packages depend on it
    - total_dep_count: total number of direct deps
    """
    blocked_names = set(blocked_packages.keys())

    # For each blocked package, get its dependencies from AUR cache
    pkg_deps = {}  # name -> set of dep names
    for name in blocked_names:
        aur_data = aur_cache.get(name, {})
        deps = set()
        for dep_field in ["Depends", "MakeDepends"]:
            for dep in aur_data.get(dep_field, []) or []:
                # Strip version constraints like >=1.0
                dep_name = re.split(r"[><=:]", dep)[0].strip()
                if dep_name:
                    deps.add(dep_name)
        pkg_deps[name] = deps

    # Compute metrics
    reverse_deps = {name: set() for name in blocked_names}

    results = []
    for name in blocked_names:
        deps = pkg_deps.get(name, set())
        blocked_deps = deps & blocked_names
        total_deps = len(deps)
        blocked_dep_count = len(blocked_deps)

        # Track reverse dependencies
        for dep in blocked_deps:
            reverse_deps[dep].add(name)

        results.append({
            "name": name,
            "number": blocked_packages[name],
            "blocked_deps": sorted(blocked_deps),
            "total_dep_count": total_deps,
            "blocked_dep_count": blocked_dep_count,
        })

    # Add reverse_dep_count
    for entry in results:
        entry["reverse_dep_count"] = len(reverse_deps[entry["name"]])
        entry["reverse_deps"] = sorted(reverse_deps[entry["name"]])

    # Sort by priority
    results.sort(key=lambda x: (
        x["blocked_dep_count"],
        -x["reverse_dep_count"],
        x["total_dep_count"],
        x["name"]
    ))

    # Add rank
    for i, entry in enumerate(results):
        entry["rank"] = i + 1

    return results


def write_tree_json(queue, output_path):
    timestamp = datetime.now(timezone.utc).isoformat()
    data = {
        "timestamp": timestamp,
        "total_blocked": len(queue),
        "queue": queue
    }
    with open(output_path, "w") as f:
        json.dump(data, f, indent=2)
    return timestamp


def write_tree_md(queue, timestamp, output_path):
    with open(output_path, "w") as f:
        f.write(f"# Blocked Dependency Tree\n\n")
        f.write(f"Generated: {timestamp}\n\n")
        f.write(f"Total blocked packages: {len(queue)}\n\n")
        f.write("## Top 50 Priority Queue\n\n")
        f.write("| Rank | # | Package | Blocked Deps | Reverse Deps | Total Deps |\n")
        f.write("|------|---|---------|--------------|--------------|------------|\n")
        for entry in queue[:50]:
            f.write(f"| {entry['rank']} | {entry['number']} | {entry['name']} | "
                    f"{entry['blocked_dep_count']} | {entry['reverse_dep_count']} | "
                    f"{entry['total_dep_count']} |\n")


def write_selection_json(selected, output_path):
    with open(output_path, "w") as f:
        json.dump({
            "pass_id": "deptree-resolver-260414q",
            "timestamp": datetime.now(timezone.utc).isoformat(),
            "count": len(selected),
            "packages": selected
        }, f, indent=2)


def main():
    print("Extracting BLOCKED packages from todo_general_packages.org...")
    blocked = extract_blocked_packages(TODO_FILE)
    print(f"  Found {len(blocked)} BLOCKED packages")

    print("Loading AUR cache...")
    aur_cache = load_aur_cache(AUR_CACHE)
    print(f"  Loaded {len(aur_cache)} AUR packages")

    print("Building dependency tree...")
    queue = build_dependency_tree(blocked, aur_cache)
    print(f"  Built tree for {len(queue)} packages")

    print("Writing tree artifacts...")
    timestamp = write_tree_json(queue, TREE_JSON)
    write_tree_md(queue, timestamp, TREE_MD)
    print(f"  Written: {TREE_JSON}")
    print(f"  Written: {TREE_MD}")

    # Select top 100
    selected = queue[:100]
    write_selection_json(selected, SELECTION_JSON)
    print(f"  Written: {SELECTION_JSON}")

    # Print top 20 for summary
    print("\n=== TOP 20 PRIORITY QUEUE ===")
    print(f"{'Rank':>4} {'#':>6} {'Package':<40} {'BlkDep':>6} {'RevDep':>6} {'TotDep':>6}")
    print("-" * 76)
    for entry in selected[:20]:
        print(f"{entry['rank']:>4} {entry['number']:>6} {entry['name']:<40} "
              f"{entry['blocked_dep_count']:>6} {entry['reverse_dep_count']:>6} "
              f"{entry['total_dep_count']:>6}")

    print(f"\n=== SELECTED 100 PACKAGES ===")
    for entry in selected:
        print(f"  {entry['rank']:>3}. #{entry['number']} {entry['name']}")

    return selected


if __name__ == "__main__":
    main()
