#!/usr/bin/env python3
"""Dependency-tree-driven packaging pass: deptree-resolver-260418am

Target: BLOCKED packages (resolve or definitively FAIL).

Steps:
1) Extract all BLOCKED packages from todo_general_packages.org
2) Build dependency tree using AUR cache
3) Compute blocked_dep_count (deps also blocked), reverse_dep_count, total_dep_count
4) Priority sort and select first 100
5) Write tree artifacts and selection
"""

import json
import re
import sys
from datetime import datetime, timezone
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
AUR_CACHE = ROOT / "data" / "aur-cache" / "packages-meta-ext-v1.json"
TODO_FILE = ROOT / "todo_general_packages.org"
PASS_ID = "deptree-resolver-260418am"


def extract_blocked_packages(todo_path):
    """Extract all BLOCKED packages (heading status) with their numbers."""
    packages = []
    with open(todo_path, "r") as f:
        for line in f:
            m = re.match(r"^\*\*\s+BLOCKED\s+(\d+)\.\s+(\S+)", line)
            if m:
                packages.append({
                    "name": m.group(2),
                    "number": int(m.group(1)),
                })
    return packages


def load_aur_cache(cache_path):
    """Load AUR metadata cache into a dict keyed by package name."""
    with open(cache_path, "r") as f:
        data = json.load(f)
    return {pkg["Name"]: pkg for pkg in data}


def strip_version_constraint(dep):
    """Strip version constraints from dependency strings like 'foo>=1.0'."""
    return re.split(r"[><=]", dep)[0].strip()


def build_dependency_tree(target_packages, aur_cache):
    """Build dependency tree for target packages."""
    target_names = {pkg["name"] for pkg in target_packages}

    tree = {}
    for pkg in target_packages:
        name = pkg["name"]
        aur_data = aur_cache.get(name, {})

        depends = [strip_version_constraint(d) for d in (aur_data.get("Depends") or [])]
        makedepends = [strip_version_constraint(d) for d in (aur_data.get("MakeDepends") or [])]

        all_deps = list(set(depends + makedepends))
        blocked_deps = [d for d in all_deps if d in target_names]

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
    """Sort by: blocked_dep_count ASC, reverse_dep_count DESC, total_dep_count ASC, name ASC."""
    items = list(tree.values())
    items.sort(key=lambda x: (
        x["blocked_dep_count"],
        -x["reverse_dep_count"],
        x["total_dep_count"],
        x["name"],
    ))
    return items


def main():
    print(f"[{PASS_ID}] Extracting BLOCKED packages from todo...")
    target = extract_blocked_packages(TODO_FILE)
    print(f"  Found {len(target)} BLOCKED packages")

    print(f"[{PASS_ID}] Loading AUR cache...")
    aur_cache = load_aur_cache(AUR_CACHE)
    print(f"  Loaded {len(aur_cache)} AUR packages")

    print(f"[{PASS_ID}] Building dependency tree...")
    tree = build_dependency_tree(target, aur_cache)
    print(f"  Tree built for {len(tree)} packages")

    print(f"[{PASS_ID}] Priority sorting...")
    sorted_queue = priority_sort(tree)

    timestamp = datetime.now(timezone.utc).isoformat().replace("+00:00", "Z")

    # Select first 100 (or all if fewer)
    selected = sorted_queue[:100]

    # Write tree artifact (JSON)
    tree_json = {
        "timestamp": timestamp,
        "pass_id": PASS_ID,
        "total_blocked": len(target),
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

    tree_json_path = ROOT / "reports" / "blocked-dependency-tree.json"
    with open(tree_json_path, "w") as f:
        json.dump(tree_json, f, indent=2)
    print(f"  Wrote {tree_json_path}")

    # Write tree artifact (Markdown)
    tree_md_path = ROOT / "reports" / "blocked-dependency-tree.md"
    with open(tree_md_path, "w") as f:
        f.write(f"# Blocked Dependency Tree\n\n")
        f.write(f"**Pass:** {PASS_ID}  \n")
        f.write(f"**Timestamp:** {timestamp}  \n")
        f.write(f"**Total BLOCKED:** {len(target)}  \n\n")
        f.write(f"## Priority Queue (top 20)\n\n")
        f.write(f"| Rank | Package | # | Blocked Deps | Reverse Deps | Total Deps |\n")
        f.write(f"|------|---------|---|-------------|-------------|------------|\n")
        for i, item in enumerate(sorted_queue[:20]):
            f.write(f"| {i+1} | {item['name']} | {item['number']} | "
                    f"{item['blocked_dep_count']} | {item['reverse_dep_count']} | "
                    f"{item['total_dep_count']} |\n")
        f.write(f"\n## Full Queue\n\n")
        for i, item in enumerate(sorted_queue):
            f.write(f"{i+1}. **{item['name']}** (#{item['number']}) — "
                    f"blocked_deps={item['blocked_dep_count']}, "
                    f"reverse_deps={item['reverse_dep_count']}, "
                    f"total_deps={item['total_dep_count']}\n")
            if item['blocked_deps']:
                f.write(f"   - Blocked deps: {', '.join(item['blocked_deps'])}\n")
            if item['reverse_deps']:
                f.write(f"   - Reverse deps: {', '.join(item['reverse_deps'])}\n")
    print(f"  Wrote {tree_md_path}")

    # Write selection
    selection = {
        "pass_id": PASS_ID,
        "timestamp": timestamp,
        "total_blocked": len(target),
        "selected_count": len(selected),
        "packages": [
            {
                "name": item["name"],
                "number": item["number"],
                "blocked_dep_count": item["blocked_dep_count"],
                "reverse_dep_count": item["reverse_dep_count"],
                "total_dep_count": item["total_dep_count"],
            }
            for item in selected
        ],
    }

    selection_path = ROOT / "reports" / f"{PASS_ID}-selection.json"
    with open(selection_path, "w") as f:
        json.dump(selection, f, indent=2)
    print(f"  Wrote {selection_path}")

    # Print top 20
    print(f"\n[{PASS_ID}] Top 20 priority queue:")
    for i, item in enumerate(sorted_queue[:20]):
        print(f"  {i+1:3d}. {item['name']:40s} blocked={item['blocked_dep_count']} "
              f"rev={item['reverse_dep_count']} total={item['total_dep_count']}")

    print(f"\n[{PASS_ID}] Selected {len(selected)} packages for resolution")
    return selected


if __name__ == "__main__":
    main()
