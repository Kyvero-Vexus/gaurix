#!/usr/bin/env python3
"""
Dependency-tree-driven BLOCKED package resolver for Gaurix.

1. Extracts all BLOCKED packages from todo_general_packages.org
2. Builds dependency tree using AUR cache
3. Ranks by: blocked_dep_count ASC, reverse_dep_count DESC,
            total_dep_count ASC, name ASC
4. Selects top 100
5. Outputs tree artifacts
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
SELECTED_TXT = ROOT / "reports" / "blocked-priority-selected-100.txt"


def extract_blocked_packages(org_path):
    """Extract all BLOCKED package names from the org file."""
    blocked = {}
    pattern = re.compile(r"^\*\* BLOCKED (\d+)\. (.+)$")
    with open(org_path, "r") as f:
        for line in f:
            m = pattern.match(line)
            if m:
                num = int(m.group(1))
                name = m.group(2).strip()
                blocked[name] = num
    return blocked


def load_aur_cache(cache_path):
    """Load AUR metadata, return dict keyed by package name."""
    with open(cache_path, "r") as f:
        data = json.load(f)
    by_name = {}
    for pkg in data:
        by_name[pkg["Name"]] = pkg
    return by_name


def strip_version_constraint(dep_str):
    """Remove version constraints from dependency string.
    e.g. 'python>=3.10' -> 'python'
    """
    return re.split(r"[><=!:]", dep_str)[0].strip()


def build_dependency_tree(blocked_names, aur_by_name):
    """Build dependency tree for blocked packages.

    For each blocked package, compute:
    - blocked_dep_count: number of direct deps that are also blocked
    - reverse_dep_count: how many blocked packages depend on this one
    - total_dep_count: total number of deps (all, not just blocked)
    - blocked_deps: list of blocked dep names
    """
    blocked_set = set(blocked_names)

    # Also build a "provides" map: what package names are provided by AUR pkgs
    provides_map = {}
    for name, pkg in aur_by_name.items():
        for prov in pkg.get("Provides", []):
            prov_name = strip_version_constraint(prov)
            provides_map.setdefault(prov_name, set()).add(name)

    # For each blocked package, find its dependencies
    pkg_deps = {}  # name -> set of dep names
    for name in blocked_set:
        pkg = aur_by_name.get(name, {})
        deps = set()
        for dep_str in pkg.get("Depends", []):
            dep_name = strip_version_constraint(dep_str)
            deps.add(dep_name)
        for dep_str in pkg.get("MakeDepends", []):
            dep_name = strip_version_constraint(dep_str)
            deps.add(dep_name)
        pkg_deps[name] = deps

    # Compute blocked_dep_count and blocked_deps
    pkg_blocked_deps = {}
    for name in blocked_set:
        blocked_deps = set()
        for dep in pkg_deps.get(name, set()):
            if dep in blocked_set:
                blocked_deps.add(dep)
            else:
                # Check if any provider of this dep is blocked
                for provider in provides_map.get(dep, set()):
                    if provider in blocked_set:
                        blocked_deps.add(provider)
        pkg_blocked_deps[name] = blocked_deps

    # Compute reverse_dep_count
    reverse_deps = {name: set() for name in blocked_set}
    for name in blocked_set:
        for dep in pkg_deps.get(name, set()):
            if dep in blocked_set:
                reverse_deps[dep].add(name)
            else:
                for provider in provides_map.get(dep, set()):
                    if provider in blocked_set:
                        reverse_deps[provider].add(name)

    # Build queue entries
    queue = []
    for name in blocked_set:
        blocked_deps = pkg_blocked_deps[name]
        total_deps = len(pkg_deps.get(name, set()))
        queue.append({
            "name": name,
            "blocked_dep_count": len(blocked_deps),
            "reverse_dep_count": len(reverse_deps[name]),
            "total_dep_count": total_deps,
            "blocked_deps": sorted(blocked_deps),
        })

    # Sort: blocked_dep_count ASC, reverse_dep_count DESC,
    #        total_dep_count ASC, name ASC
    queue.sort(key=lambda x: (
        x["blocked_dep_count"],
        -x["reverse_dep_count"],
        x["total_dep_count"],
        x["name"],
    ))

    # Assign ranks
    for i, entry in enumerate(queue):
        entry["rank"] = i + 1

    return queue


def write_tree_json(queue, output_path):
    """Write the full dependency tree as JSON."""
    timestamp = datetime.now(timezone.utc).isoformat()
    data = {
        "timestamp": timestamp,
        "run": "auto-deptree-resolver",
        "total_blocked": len(queue),
        "queue": queue,
    }
    with open(output_path, "w") as f:
        json.dump(data, f, indent=2)
    return timestamp


def write_tree_md(queue, timestamp, output_path, top_n=120):
    """Write markdown summary of the dependency tree."""
    lines = [
        "# Blocked Dependency Tree",
        "",
        f"**Timestamp:** {timestamp}",
        f"**Run:** auto-deptree-resolver",
        f"**Total blocked:** {len(queue)}",
        "",
        f"## Priority Queue (top {top_n})",
        "",
        "| Rank | Package | Blocked Deps | Reverse Deps | Total Deps | Blocked Dep Names |",
        "|------|---------|-------------|-------------|------------|-------------------|",
    ]
    for entry in queue[:top_n]:
        blocked_dep_names = ", ".join(entry["blocked_deps"][:5])
        if len(entry["blocked_deps"]) > 5:
            blocked_dep_names += f" (+{len(entry['blocked_deps'])-5} more)"
        lines.append(
            f"| {entry['rank']} | {entry['name']} | "
            f"{entry['blocked_dep_count']} | {entry['reverse_dep_count']} | "
            f"{entry['total_dep_count']} | {blocked_dep_names} |"
        )
    lines.append("")
    with open(output_path, "w") as f:
        f.write("\n".join(lines))


def write_selected(queue, output_path, count=100):
    """Write the selected package list."""
    lines = []
    for entry in queue[:count]:
        lines.append(f"{entry['rank']}. {entry['name']}")
    with open(output_path, "w") as f:
        f.write("\n".join(lines) + "\n")


def main():
    print("Extracting BLOCKED packages from org file...")
    blocked = extract_blocked_packages(ORG_FILE)
    print(f"  Found {len(blocked)} BLOCKED packages")

    print("Loading AUR cache...")
    aur_by_name = load_aur_cache(AUR_CACHE)
    print(f"  Loaded {len(aur_by_name)} AUR packages")

    print("Building dependency tree...")
    queue = build_dependency_tree(blocked.keys(), aur_by_name)

    print("Writing tree artifacts...")
    timestamp = write_tree_json(queue, TREE_JSON)
    write_tree_md(queue, timestamp, TREE_MD)
    write_selected(queue, SELECTED_TXT)

    print(f"\nTree artifacts written:")
    print(f"  {TREE_JSON}")
    print(f"  {TREE_MD}")
    print(f"  {SELECTED_TXT}")

    print(f"\nTop 20 priority queue:")
    for entry in queue[:20]:
        print(f"  {entry['rank']:3d}. {entry['name']:<40s} "
              f"blocked_deps={entry['blocked_dep_count']} "
              f"reverse_deps={entry['reverse_dep_count']} "
              f"total_deps={entry['total_dep_count']}")

    print(f"\nSelected 100 packages:")
    for entry in queue[:100]:
        print(f"  {entry['rank']:3d}. {entry['name']}")

    # Output JSON for downstream processing
    selected = [e["name"] for e in queue[:100]]
    with open(ROOT / "reports" / "deptree-selected-100.json", "w") as f:
        json.dump({"timestamp": timestamp, "selected": selected, "queue": queue[:100]}, f, indent=2)

    return 0


if __name__ == "__main__":
    sys.exit(main())
