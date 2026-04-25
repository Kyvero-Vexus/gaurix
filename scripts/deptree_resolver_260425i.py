#!/usr/bin/env python3
"""
Dependency-tree resolver pass: deptree-resolver-260425i

Builds a dependency tree for all BLOCKED packages in todo_general_packages.org,
computes priority scores, selects top 100, and generates tree artifacts.
"""

import json
import re
import os
import sys
from datetime import datetime, timezone
from collections import defaultdict

PASS_ID = "deptree-resolver-260425i"
TODO_FILE = "todo_general_packages.org"
AUR_CACHE = "data/aur-cache/packages-meta-ext-v1.json"
TREE_JSON = "reports/blocked-dependency-tree.json"
TREE_MD = "reports/blocked-dependency-tree.md"
SELECTION_JSON = f"reports/{PASS_ID}-selection.json"

def extract_blocked_packages(todo_file):
    """Extract all BLOCKED package names with their line numbers and blocking reasons."""
    blocked = {}
    with open(todo_file, 'r') as f:
        lines = f.readlines()

    i = 0
    while i < len(lines):
        line = lines[i]
        m = re.match(r'^\*\* BLOCKED (\d+)\. (\S+)', line)
        if m:
            num = int(m.group(1))
            name = m.group(2)
            # Extract blocking reason from the header line
            reason_match = re.search(r'\[FAILED: ([^\]]+)\]', line)
            reason = reason_match.group(1) if reason_match else "UNKNOWN"
            blocked[name] = {
                "number": num,
                "line_number": i + 1,
                "reason": reason,
                "header_line": line.rstrip()
            }
        i += 1

    return blocked

def load_aur_cache(cache_file):
    """Load AUR metadata cache into a name->metadata dict."""
    with open(cache_file, 'r') as f:
        data = json.load(f)
    return {pkg['Name']: pkg for pkg in data}

def normalize_dep(dep_str):
    """Strip version constraints from dependency strings."""
    # "foo>=1.0" -> "foo", "foo=1.0" -> "foo", "foo: description" -> "foo"
    dep = re.split(r'[>=<:()]', dep_str)[0].strip()
    return dep

def build_dependency_tree(blocked_pkgs, aur_cache):
    """
    Build dependency tree for blocked packages.
    Returns dict with per-package stats.
    """
    blocked_names = set(blocked_pkgs.keys())

    # For each blocked package, find its dependencies from AUR cache
    pkg_deps = {}  # pkg -> set of all deps (normalized names)
    pkg_blocked_deps = {}  # pkg -> set of deps that are also blocked

    for name in blocked_names:
        aur_info = aur_cache.get(name, {})
        all_deps = set()

        for dep_field in ['Depends', 'MakeDepends']:
            dep_list = aur_info.get(dep_field) or []
            for d in dep_list:
                norm = normalize_dep(d)
                if norm:
                    all_deps.add(norm)

        pkg_deps[name] = all_deps
        pkg_blocked_deps[name] = all_deps & blocked_names

    # Compute reverse dependency counts (how many blocked packages depend on this one)
    reverse_deps = defaultdict(set)
    for name in blocked_names:
        for dep in pkg_blocked_deps.get(name, set()):
            reverse_deps[dep].add(name)

    # Build result
    tree = {}
    for name in blocked_names:
        in_aur = name in aur_cache
        blocked_dep_count = len(pkg_blocked_deps.get(name, set()))
        reverse_dep_count = len(reverse_deps.get(name, set()))
        total_dep_count = len(pkg_deps.get(name, set()))

        tree[name] = {
            "name": name,
            "number": blocked_pkgs[name]["number"],
            "line_number": blocked_pkgs[name]["line_number"],
            "reason": blocked_pkgs[name]["reason"],
            "in_aur_cache": in_aur,
            "blocked_dep_count": blocked_dep_count,
            "reverse_dep_count": reverse_dep_count,
            "total_dep_count": total_dep_count,
            "blocked_deps": sorted(pkg_blocked_deps.get(name, set())),
            "reverse_deps": sorted(reverse_deps.get(name, set())),
            "aur_version": aur_cache.get(name, {}).get("Version", "N/A"),
            "aur_description": aur_cache.get(name, {}).get("Description", "N/A"),
        }

    return tree

def priority_sort(tree):
    """
    Sort by:
    1. blocked_dep_count ascending (fewest blocked deps first)
    2. reverse_dep_count descending (most dependents first)
    3. total_dep_count ascending (simplest first)
    4. name ascending (alphabetical tiebreak)
    """
    return sorted(
        tree.values(),
        key=lambda x: (
            x["blocked_dep_count"],
            -x["reverse_dep_count"],
            x["total_dep_count"],
            x["name"]
        )
    )

def generate_tree_json(tree, sorted_queue, timestamp):
    """Generate blocked-dependency-tree.json"""
    output = {
        "timestamp": timestamp,
        "pass_id": PASS_ID,
        "total_blocked": len(tree),
        "in_aur_cache": sum(1 for v in tree.values() if v["in_aur_cache"]),
        "zero_blocked_deps": sum(1 for v in tree.values() if v["blocked_dep_count"] == 0),
        "queue": [
            {
                "rank": i + 1,
                "name": pkg["name"],
                "number": pkg["number"],
                "reason": pkg["reason"],
                "in_aur_cache": pkg["in_aur_cache"],
                "blocked_dep_count": pkg["blocked_dep_count"],
                "reverse_dep_count": pkg["reverse_dep_count"],
                "total_dep_count": pkg["total_dep_count"],
                "blocked_deps": pkg["blocked_deps"],
                "reverse_deps": pkg["reverse_deps"],
                "aur_version": pkg["aur_version"],
                "aur_description": pkg["aur_description"],
            }
            for i, pkg in enumerate(sorted_queue)
        ]
    }
    with open(TREE_JSON, 'w') as f:
        json.dump(output, f, indent=2)
    return output

def generate_tree_md(tree, sorted_queue, timestamp):
    """Generate blocked-dependency-tree.md"""
    lines = [
        f"# Blocked Dependency Tree — {PASS_ID}",
        f"",
        f"Generated: {timestamp}",
        f"",
        f"## Summary",
        f"",
        f"| Metric | Count |",
        f"|--------|-------|",
        f"| Total blocked | {len(tree)} |",
        f"| In AUR cache | {sum(1 for v in tree.values() if v['in_aur_cache'])} |",
        f"| Zero blocked deps | {sum(1 for v in tree.values() if v['blocked_dep_count'] == 0)} |",
        f"",
        f"## Blocking Reason Distribution",
        f"",
    ]

    # Reason distribution
    reason_counts = defaultdict(int)
    for v in tree.values():
        reason_counts[v["reason"]] += 1
    for reason, count in sorted(reason_counts.items(), key=lambda x: -x[1]):
        lines.append(f"- **{reason}**: {count}")

    lines.extend([
        f"",
        f"## Priority Queue (top 200)",
        f"",
        f"| Rank | Package | Blocked Deps | Reverse Deps | Total Deps | Reason |",
        f"|------|---------|-------------|-------------- |------------|--------|",
    ])

    for i, pkg in enumerate(sorted_queue[:200]):
        lines.append(
            f"| {i+1} | {pkg['name']} | {pkg['blocked_dep_count']} | "
            f"{pkg['reverse_dep_count']} | {pkg['total_dep_count']} | {pkg['reason']} |"
        )

    lines.extend([
        f"",
        f"## Selected for This Pass (top 100)",
        f"",
    ])

    for i, pkg in enumerate(sorted_queue[:100]):
        lines.append(f"{i+1}. **{pkg['name']}** (blocked_deps={pkg['blocked_dep_count']}, "
                     f"reverse_deps={pkg['reverse_dep_count']}, total_deps={pkg['total_dep_count']}) "
                     f"— {pkg['reason']}")

    with open(TREE_MD, 'w') as f:
        f.write('\n'.join(lines) + '\n')

def generate_selection_json(sorted_queue, timestamp):
    """Generate selection JSON for this pass."""
    selected = sorted_queue[:100]
    output = {
        "timestamp": timestamp,
        "pass_id": PASS_ID,
        "selected_count": len(selected),
        "packages": [
            {
                "rank": i + 1,
                "name": pkg["name"],
                "number": pkg["number"],
                "reason": pkg["reason"],
                "blocked_dep_count": pkg["blocked_dep_count"],
                "reverse_dep_count": pkg["reverse_dep_count"],
                "total_dep_count": pkg["total_dep_count"],
                "aur_version": pkg["aur_version"],
                "aur_description": pkg["aur_description"],
            }
            for i, pkg in enumerate(selected)
        ]
    }
    with open(SELECTION_JSON, 'w') as f:
        json.dump(output, f, indent=2)
    return output

def main():
    timestamp = datetime.now(timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ")

    print(f"[{PASS_ID}] Extracting BLOCKED packages...")
    blocked = extract_blocked_packages(TODO_FILE)
    print(f"  Found {len(blocked)} BLOCKED packages")

    print(f"[{PASS_ID}] Loading AUR cache...")
    aur_cache = load_aur_cache(AUR_CACHE)
    print(f"  Loaded {len(aur_cache)} AUR packages")

    print(f"[{PASS_ID}] Building dependency tree...")
    tree = build_dependency_tree(blocked, aur_cache)

    print(f"[{PASS_ID}] Sorting by priority...")
    sorted_queue = priority_sort(tree)

    print(f"\n[{PASS_ID}] Stats:")
    in_aur = sum(1 for v in tree.values() if v['in_aur_cache'])
    zero_blocked = sum(1 for v in tree.values() if v['blocked_dep_count'] == 0)
    print(f"  Total blocked: {len(tree)}")
    print(f"  In AUR cache: {in_aur}")
    print(f"  Zero blocked deps: {zero_blocked}")

    print(f"\n[{PASS_ID}] Top 20 priority queue:")
    for i, pkg in enumerate(sorted_queue[:20]):
        print(f"  {i+1:3d}. {pkg['name']:<45s} blocked_deps={pkg['blocked_dep_count']} "
              f"rev_deps={pkg['reverse_dep_count']} total={pkg['total_dep_count']} "
              f"reason={pkg['reason']}")

    print(f"\n[{PASS_ID}] Generating tree artifacts...")
    generate_tree_json(tree, sorted_queue, timestamp)
    print(f"  -> {TREE_JSON}")
    generate_tree_md(tree, sorted_queue, timestamp)
    print(f"  -> {TREE_MD}")
    selection = generate_selection_json(sorted_queue, timestamp)
    print(f"  -> {SELECTION_JSON}")

    print(f"\n[{PASS_ID}] Selected 100 packages:")
    for i, pkg in enumerate(selection["packages"]):
        print(f"  {i+1:3d}. {pkg['name']}")

    return selection

if __name__ == "__main__":
    main()
