#!/usr/bin/env python3
"""Build dependency tree for BLOCKED packages and select top 100 by priority.

Reads:
  - todo_general_packages.org (to find BLOCKED packages)
  - data/aur-cache/packages-meta-ext-v1.json (AUR metadata with deps)

Writes:
  - reports/blocked-dependency-tree.json
  - reports/blocked-dependency-tree.md
  - reports/blocked-priority-selected-100.json
"""

import json
import re
import sys
from datetime import datetime, timezone
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
ORG_FILE = ROOT / "todo_general_packages.org"
AUR_CACHE = ROOT / "data" / "aur-cache" / "packages-meta-ext-v1.json"
TREE_JSON = ROOT / "reports" / "blocked-dependency-tree.json"
TREE_MD = ROOT / "reports" / "blocked-dependency-tree.md"
SELECTED_JSON = ROOT / "reports" / "blocked-priority-selected-100.json"
SELECTED_TXT = ROOT / "reports" / "blocked-priority-selected-100.txt"


def extract_blocked_packages(org_path):
    """Extract all BLOCKED package names and their entry numbers from org file."""
    blocked = {}
    current_num = None
    current_name = None
    current_status = None

    with open(org_path, "r") as f:
        for line in f:
            m = re.match(r'^\*\*\s+(BLOCKED)\s+(\d+)\.\s+(\S+)', line)
            if m:
                current_status = m.group(1)
                current_num = int(m.group(2))
                current_name = m.group(3)
                blocked[current_name] = current_num

    return blocked


def load_aur_metadata(aur_path):
    """Load AUR package metadata. Returns dict keyed by package name."""
    print(f"Loading AUR cache from {aur_path}...")
    with open(aur_path, "r") as f:
        data = json.load(f)

    pkg_map = {}
    for pkg in data:
        name = pkg.get("Name", "")
        if name:
            pkg_map[name] = pkg

    print(f"  Loaded {len(pkg_map)} AUR packages")
    return pkg_map


def normalize_dep(dep_str):
    """Strip version constraints from a dependency string.
    E.g. 'python>=3.10' -> 'python', 'gcc: provides' -> 'gcc'
    """
    dep = dep_str.strip()
    # Remove : descriptions
    dep = dep.split(":")[0].strip()
    # Remove version constraints
    for sep in [">=", "<=", "=", ">", "<"]:
        dep = dep.split(sep)[0].strip()
    return dep


def build_dependency_tree(blocked_pkgs, aur_meta):
    """Build dependency tree for blocked packages.

    Returns dict of package -> {
        blocked_dep_count, reverse_dep_count, total_dep_count,
        blocked_deps, all_deps, number, in_aur
    }
    """
    blocked_set = set(blocked_pkgs.keys())
    tree = {}

    # First pass: compute all_deps and blocked_deps for each blocked package
    for pkg_name, entry_num in blocked_pkgs.items():
        meta = aur_meta.get(pkg_name, {})
        in_aur = pkg_name in aur_meta

        # Gather all dependency fields
        all_deps_raw = []
        for field in ["Depends", "MakeDepends", "OptDepends", "CheckDepends"]:
            deps = meta.get(field, []) or []
            all_deps_raw.extend(deps)

        all_deps = set()
        for d in all_deps_raw:
            nd = normalize_dep(d)
            if nd:
                all_deps.add(nd)

        blocked_deps = sorted(all_deps & blocked_set)

        tree[pkg_name] = {
            "number": entry_num,
            "in_aur": in_aur,
            "all_deps": sorted(all_deps),
            "blocked_deps": blocked_deps,
            "blocked_dep_count": len(blocked_deps),
            "total_dep_count": len(all_deps),
            "reverse_dep_count": 0,  # computed in second pass
        }

    # Second pass: compute reverse_dep_count
    for pkg_name, info in tree.items():
        for dep in info["blocked_deps"]:
            if dep in tree:
                tree[dep]["reverse_dep_count"] += 1

    return tree


def priority_sort(tree):
    """Sort packages by priority:
    1. blocked_dep_count ascending
    2. reverse_dep_count descending
    3. total_dep_count ascending
    4. package name ascending
    """
    return sorted(
        tree.keys(),
        key=lambda p: (
            tree[p]["blocked_dep_count"],
            -tree[p]["reverse_dep_count"],
            tree[p]["total_dep_count"],
            p,
        ),
    )


def write_tree_json(tree, sorted_pkgs, out_path):
    """Write blocked-dependency-tree.json."""
    timestamp = datetime.now(timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ")

    queue = []
    for rank, pkg in enumerate(sorted_pkgs, 1):
        info = tree[pkg]
        queue.append({
            "rank": rank,
            "package": pkg,
            "number": info["number"],
            "blocked_dep_count": info["blocked_dep_count"],
            "reverse_dep_count": info["reverse_dep_count"],
            "total_dep_count": info["total_dep_count"],
            "blocked_deps": info["blocked_deps"],
            "in_aur": info["in_aur"],
        })

    report = {
        "timestamp": timestamp,
        "total_blocked": len(tree),
        "queue": queue,
    }

    with open(out_path, "w") as f:
        json.dump(report, f, indent=2)

    print(f"  Wrote {out_path} ({len(queue)} packages)")
    return timestamp


def write_tree_md(tree, sorted_pkgs, timestamp, out_path):
    """Write blocked-dependency-tree.md."""
    lines = [
        "# Blocked Package Dependency Tree",
        "",
        f"**Generated:** {timestamp}",
        f"**Total blocked:** {len(tree)}",
        "",
        "## Priority Queue (Top 50)",
        "",
        "| Rank | Package | # | Blocked Deps | Reverse Deps | Total Deps |",
        "|------|---------|---|-------------|-------------|------------|",
    ]

    for rank, pkg in enumerate(sorted_pkgs[:50], 1):
        info = tree[pkg]
        lines.append(
            f"| {rank} | {pkg} | {info['number']} "
            f"| {info['blocked_dep_count']} | {info['reverse_dep_count']} "
            f"| {info['total_dep_count']} |"
        )

    with open(out_path, "w") as f:
        f.write("\n".join(lines) + "\n")

    print(f"  Wrote {out_path}")


def write_selected(tree, sorted_pkgs, count, json_path, txt_path):
    """Write the selected N packages."""
    selected = sorted_pkgs[:count]

    # JSON
    entries = []
    for rank, pkg in enumerate(selected, 1):
        info = tree[pkg]
        entries.append({
            "rank": rank,
            "package": pkg,
            "number": info["number"],
            "blocked_dep_count": info["blocked_dep_count"],
            "reverse_dep_count": info["reverse_dep_count"],
            "total_dep_count": info["total_dep_count"],
            "blocked_deps": info["blocked_deps"],
            "in_aur": info["in_aur"],
        })

    with open(json_path, "w") as f:
        json.dump({"count": len(selected), "packages": entries}, f, indent=2)

    # TXT
    with open(txt_path, "w") as f:
        for pkg in selected:
            f.write(pkg + "\n")

    print(f"  Wrote {json_path} and {txt_path} ({len(selected)} packages)")
    return selected


def main():
    print("=== Building Blocked Dependency Tree ===")

    # Step 1: Extract BLOCKED packages
    blocked_pkgs = extract_blocked_packages(ORG_FILE)
    print(f"Found {len(blocked_pkgs)} BLOCKED packages in org file")

    # Step 2: Load AUR metadata
    aur_meta = load_aur_metadata(AUR_CACHE)

    # Step 3: Build dependency tree
    print("Building dependency tree...")
    tree = build_dependency_tree(blocked_pkgs, aur_meta)
    print(f"  Tree has {len(tree)} nodes")

    # Step 4: Priority sort
    sorted_pkgs = priority_sort(tree)

    # Step 5: Write reports
    print("Writing reports...")
    timestamp = write_tree_json(tree, sorted_pkgs, TREE_JSON)
    write_tree_md(tree, sorted_pkgs, timestamp, TREE_MD)

    # Step 6: Select top 100
    selected = write_selected(tree, sorted_pkgs, 100, SELECTED_JSON, SELECTED_TXT)

    # Print top 20
    print("\n=== Top 20 Priority Queue ===")
    print(f"{'Rank':>4}  {'Package':<45} {'BD':>3} {'RD':>3} {'TD':>4}")
    for rank, pkg in enumerate(sorted_pkgs[:20], 1):
        info = tree[pkg]
        print(
            f"{rank:>4}  {pkg:<45} "
            f"{info['blocked_dep_count']:>3} "
            f"{info['reverse_dep_count']:>3} "
            f"{info['total_dep_count']:>4}"
        )

    print(f"\n=== Selected 100 Packages ===")
    for i, pkg in enumerate(selected):
        info = tree[pkg]
        print(f"  {i+1:>3}. {pkg} (BD={info['blocked_dep_count']}, RD={info['reverse_dep_count']}, TD={info['total_dep_count']})")

    return 0


if __name__ == "__main__":
    sys.exit(main())
