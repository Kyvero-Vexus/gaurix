#!/usr/bin/env python3
"""Build dependency tree for BLOCKED packages and select top 100 by priority."""

import json
import re
import sys
from collections import defaultdict
from datetime import datetime, timezone

TODO_FILE = "todo_general_packages.org"
AUR_CACHE = "data/aur-cache/packages-meta-ext-v1.json"
REPORT_JSON = "reports/blocked-dependency-tree.json"
REPORT_MD = "reports/blocked-dependency-tree.md"
SELECTED_JSON = "reports/deptree-resolver-260407e-selection.json"

def extract_blocked_packages(todo_file):
    """Extract all BLOCKED package names and their line numbers from the todo file."""
    blocked = {}
    with open(todo_file, "r") as f:
        for line in f:
            m = re.match(r'^\*\* BLOCKED (\d+)\. (.+)', line)
            if m:
                num = int(m.group(1))
                name = m.group(2).strip()
                blocked[name] = num
    return blocked

def load_aur_cache(cache_file):
    """Load AUR metadata cache and build lookup by package name."""
    with open(cache_file, "r") as f:
        data = json.load(f)
    by_name = {}
    for pkg in data:
        by_name[pkg["Name"]] = pkg
    # Also index by Provides
    provides_map = {}
    for pkg in data:
        if "Provides" in pkg and pkg["Provides"]:
            for prov in pkg["Provides"]:
                # Strip version constraints like "foo=1.2.3"
                base = re.split(r'[>=<]', prov)[0]
                if base not in provides_map:
                    provides_map[base] = []
                provides_map[base].append(pkg["Name"])
    return by_name, provides_map

def strip_version(dep):
    """Strip version constraints from dependency string."""
    return re.split(r'[>=<]', dep)[0].strip()

def build_dependency_tree(blocked_pkgs, aur_by_name, provides_map):
    """Build dependency tree for all blocked packages."""
    blocked_set = set(blocked_pkgs.keys())
    tree = {}

    for pkg_name in blocked_pkgs:
        aur_info = aur_by_name.get(pkg_name)
        in_aur = aur_info is not None

        all_deps = []
        if aur_info:
            for dep_field in ["Depends", "MakeDepends"]:
                if dep_field in aur_info and aur_info[dep_field]:
                    all_deps.extend(aur_info[dep_field])

        # Strip version constraints
        dep_names = [strip_version(d) for d in all_deps]

        # Count blocked deps (direct deps that are also blocked)
        blocked_deps = [d for d in dep_names if d in blocked_set]

        tree[pkg_name] = {
            "number": blocked_pkgs[pkg_name],
            "in_aur": in_aur,
            "all_deps": dep_names,
            "blocked_deps": blocked_deps,
            "blocked_dep_count": len(blocked_deps),
            "total_dep_count": len(dep_names),
            "reverse_dep_count": 0,  # Computed below
        }

    # Compute reverse_dep_count: how many blocked packages depend on this one
    for pkg_name, info in tree.items():
        for dep in info["blocked_deps"]:
            if dep in tree:
                tree[dep]["reverse_dep_count"] += 1

    return tree

def priority_sort(tree):
    """Sort packages by priority:
    1. blocked_dep_count ascending (fewer blocked deps = easier to resolve)
    2. reverse_dep_count descending (more reverse deps = unblocks more)
    3. total_dep_count ascending (simpler packages first)
    4. package name ascending (deterministic)
    """
    items = list(tree.items())
    items.sort(key=lambda x: (
        x[1]["blocked_dep_count"],
        -x[1]["reverse_dep_count"],
        x[1]["total_dep_count"],
        x[0]
    ))
    return items

def generate_reports(tree, sorted_items, timestamp):
    """Generate JSON and Markdown reports."""
    # Stats
    total = len(tree)
    in_aur = sum(1 for v in tree.values() if v["in_aur"])
    not_in_aur = total - in_aur
    zero_blocked = sum(1 for v in tree.values() if v["blocked_dep_count"] == 0)
    max_blocked = max((v["blocked_dep_count"] for v in tree.values()), default=0)
    max_reverse = max((v["reverse_dep_count"] for v in tree.values()), default=0)

    # JSON report
    json_report = {
        "timestamp": timestamp,
        "summary": {
            "total_blocked": total,
            "in_aur": in_aur,
            "not_in_aur": not_in_aur,
            "zero_blocked_deps": zero_blocked,
            "max_blocked_deps": max_blocked,
            "max_reverse_deps": max_reverse,
        },
        "queue": [
            {
                "position": i + 1,
                "number": info["number"],
                "name": name,
                "blocked_dep_count": info["blocked_dep_count"],
                "reverse_dep_count": info["reverse_dep_count"],
                "total_dep_count": info["total_dep_count"],
                "in_aur": info["in_aur"],
                "blocked_deps": info["blocked_deps"],
            }
            for i, (name, info) in enumerate(sorted_items)
        ]
    }

    with open(REPORT_JSON, "w") as f:
        json.dump(json_report, f, indent=2)

    # Markdown report
    lines = [
        "# Blocked Package Dependency Tree",
        "",
        f"**Generated:** {timestamp}",
        "",
        "## Summary",
        "",
        f"- Total BLOCKED: {total}",
        f"- In AUR cache: {in_aur}",
        f"- Not in AUR cache: {not_in_aur}",
        f"- Zero blocked deps: {zero_blocked}",
        f"- Max blocked deps: {max_blocked}",
        f"- Max reverse deps: {max_reverse}",
        "",
        "## Top 100 Priority Queue",
        "",
        "| Pos | # | Package | Blocked Deps | Reverse Deps | Total Deps | In AUR |",
        "|-----|---|---------|-------------|-------------|------------|--------|",
    ]

    for i, (name, info) in enumerate(sorted_items[:100]):
        lines.append(
            f"| {i+1} | {info['number']} | {name} | "
            f"{info['blocked_dep_count']} | {info['reverse_dep_count']} | "
            f"{info['total_dep_count']} | {'Y' if info['in_aur'] else 'N'} |"
        )

    with open(REPORT_MD, "w") as f:
        f.write("\n".join(lines) + "\n")

    return json_report

def select_top_100(sorted_items):
    """Select top 100 packages from sorted list."""
    selected = []
    for i, (name, info) in enumerate(sorted_items[:100]):
        selected.append({
            "position": i + 1,
            "number": info["number"],
            "name": name,
            "blocked_dep_count": info["blocked_dep_count"],
            "reverse_dep_count": info["reverse_dep_count"],
            "total_dep_count": info["total_dep_count"],
            "in_aur": info["in_aur"],
            "blocked_deps": info["blocked_deps"],
        })

    with open(SELECTED_JSON, "w") as f:
        json.dump(selected, f, indent=2)

    return selected

def main():
    print("Extracting BLOCKED packages...")
    blocked = extract_blocked_packages(TODO_FILE)
    print(f"  Found {len(blocked)} BLOCKED packages")

    print("Loading AUR cache...")
    aur_by_name, provides_map = load_aur_cache(AUR_CACHE)
    print(f"  Loaded {len(aur_by_name)} AUR packages")

    print("Building dependency tree...")
    tree = build_dependency_tree(blocked, aur_by_name, provides_map)

    print("Sorting by priority...")
    sorted_items = priority_sort(tree)

    timestamp = datetime.now(timezone.utc).isoformat()
    print("Generating reports...")
    report = generate_reports(tree, sorted_items, timestamp)
    print(f"  Written: {REPORT_JSON}")
    print(f"  Written: {REPORT_MD}")

    print("Selecting top 100...")
    selected = select_top_100(sorted_items)
    print(f"  Written: {SELECTED_JSON}")

    # Print top 20 to stdout
    print("\n=== Top 20 Priority Queue ===")
    print(f"{'Pos':>4} {'#':>6} {'Package':<45} {'BDep':>5} {'RDep':>5} {'TDep':>5}")
    for s in selected[:20]:
        print(f"{s['position']:>4} {s['number']:>6} {s['name']:<45} {s['blocked_dep_count']:>5} {s['reverse_dep_count']:>5} {s['total_dep_count']:>5}")

    # Print all 100 names
    print("\n=== All 100 Selected Packages ===")
    for s in selected:
        print(f"  {s['position']:>3}. {s['name']}")

    return selected

if __name__ == "__main__":
    main()
