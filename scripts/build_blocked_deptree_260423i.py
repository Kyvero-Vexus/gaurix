#!/usr/bin/env python3
"""
Build dependency tree for BLOCKED packages in todo_general_packages.org.
Uses AUR cache (packages-meta-ext-v1.json) for dependency data.
Pass: deptree-resolver-260423i
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
SELECTION_JSON = ROOT / "reports" / "deptree-resolver-260423i-selection.json"

PASS_ID = "deptree-resolver-260423i"
TIMESTAMP = datetime.now(timezone.utc).isoformat()


def extract_blocked_packages(org_path):
    """Extract all BLOCKED packages with their entry numbers from the org file."""
    blocked = {}
    current_number = None
    current_name = None
    in_entry = False

    with open(org_path, "r") as f:
        for line in f:
            # Match entry headers like "** DONE 123. package-name"
            m = re.match(r'^\*\*\s+\S+\s+(\d+)\.\s+(\S+)', line)
            if m:
                current_number = int(m.group(1))
                current_name = m.group(2).rstrip(':').split(':')[0]
                in_entry = True
                continue

            if in_entry and line.strip().startswith("- TODO Status:"):
                status = line.strip().split("- TODO Status:")[1].strip()
                if status == "BLOCKED":
                    blocked[current_name] = current_number

    return blocked


def load_aur_cache(cache_path):
    """Load AUR package metadata indexed by package name."""
    print(f"Loading AUR cache from {cache_path}...")
    with open(cache_path, "r") as f:
        packages = json.load(f)
    aur_index = {}
    for pkg in packages:
        name = pkg.get("Name", "")
        if name:
            aur_index[name] = pkg
    print(f"Loaded {len(aur_index)} AUR packages")
    return aur_index


def build_dependency_tree(blocked_packages, aur_index):
    """Build dependency tree for blocked packages using AUR metadata."""
    blocked_set = set(blocked_packages.keys())

    tree = []
    for pkg_name in sorted(blocked_set):
        pkg_num = blocked_packages[pkg_name]
        aur_pkg = aur_index.get(pkg_name)

        if aur_pkg:
            # Get all dependency fields
            depends = aur_pkg.get("Depends", []) or []
            makedepends = aur_pkg.get("MakeDepends", []) or []
            optdepends = aur_pkg.get("OptDepends", []) or []

            # Normalize dep names (strip version constraints)
            all_deps = set()
            for dep in depends + makedepends:
                dep_name = re.split(r'[>=<]', dep)[0].strip()
                if dep_name:
                    all_deps.add(dep_name)

            # Count blocked deps (deps that are also in our blocked set)
            blocked_deps = sorted(all_deps & blocked_set)
            blocked_dep_count = len(blocked_deps)
            total_dep_count = len(all_deps)
            in_aur = True
        else:
            blocked_deps = []
            blocked_dep_count = 0
            total_dep_count = 0
            in_aur = False

        tree.append({
            "name": pkg_name,
            "number": pkg_num,
            "blocked_dep_count": blocked_dep_count,
            "total_dep_count": total_dep_count,
            "blocked_deps": blocked_deps,
            "in_aur": in_aur,
        })

    # Compute reverse deps
    reverse_deps_map = {}
    for entry in tree:
        for dep in entry["blocked_deps"]:
            reverse_deps_map.setdefault(dep, []).append(entry["name"])

    for entry in tree:
        entry["reverse_deps"] = sorted(reverse_deps_map.get(entry["name"], []))
        entry["reverse_dep_count"] = len(entry["reverse_deps"])

    # Priority sort:
    # 1. blocked_dep_count ASC
    # 2. reverse_dep_count DESC
    # 3. total_dep_count ASC
    # 4. name ASC
    tree.sort(key=lambda e: (
        e["blocked_dep_count"],
        -e["reverse_dep_count"],
        e["total_dep_count"],
        e["name"],
    ))

    # Assign ranks
    for i, entry in enumerate(tree):
        entry["rank"] = i + 1

    return tree


def write_tree_json(tree, path):
    """Write dependency tree as JSON."""
    data = {
        "timestamp": TIMESTAMP,
        "pass_id": PASS_ID,
        "total_blocked": len(tree),
        "queue": tree,
    }
    with open(path, "w") as f:
        json.dump(data, f, indent=2)
    print(f"Wrote {path}")


def write_tree_md(tree, path):
    """Write dependency tree as Markdown."""
    lines = [
        "# Blocked Dependency Tree",
        "",
        f"**Pass:** {PASS_ID}  ",
        f"**Timestamp:** {TIMESTAMP}  ",
        f"**Total BLOCKED:** {len(tree)}  ",
        "",
        f"## Priority Queue (All {len(tree)})",
        "",
        "| Rank | Package | # | Blocked Deps | Reverse Deps | Total Deps | In AUR |",
        "|------|---------|---|-------------|-------------|------------|--------|",
    ]
    for e in tree:
        in_aur = "Y" if e["in_aur"] else "N"
        lines.append(
            f"| {e['rank']} | {e['name']} | {e['number']} | "
            f"{e['blocked_dep_count']} | {e['reverse_dep_count']} | "
            f"{e['total_dep_count']} | {in_aur} |"
        )
    lines.append("")

    with open(path, "w") as f:
        f.write("\n".join(lines))
    print(f"Wrote {path}")


def write_selection(tree, path, count=100):
    """Write the selected packages for this pass."""
    selected = tree[:count]
    data = {
        "pass_id": PASS_ID,
        "timestamp": TIMESTAMP,
        "total_blocked": len(tree),
        "selected_count": len(selected),
        "selected": [
            {
                "rank": e["rank"],
                "name": e["name"],
                "number": e["number"],
                "blocked_dep_count": e["blocked_dep_count"],
                "reverse_dep_count": e["reverse_dep_count"],
                "total_dep_count": e["total_dep_count"],
                "in_aur": e["in_aur"],
            }
            for e in selected
        ],
    }
    with open(path, "w") as f:
        json.dump(data, f, indent=2)
    print(f"Wrote {path} ({len(selected)} packages)")
    return selected


def main():
    print(f"=== Dependency Tree Builder: {PASS_ID} ===")
    print(f"Timestamp: {TIMESTAMP}")

    # Step 1: Extract BLOCKED packages
    blocked = extract_blocked_packages(ORG_FILE)
    print(f"Found {len(blocked)} BLOCKED packages in org file")

    # Step 2: Load AUR cache
    aur_index = load_aur_cache(AUR_CACHE)

    # Step 3: Build dependency tree
    tree = build_dependency_tree(blocked, aur_index)
    print(f"Built dependency tree with {len(tree)} entries")

    # Step 4: Write artifacts
    write_tree_json(tree, TREE_JSON)
    write_tree_md(tree, TREE_MD)

    # Step 5: Select top 100
    selected = write_selection(tree, SELECTION_JSON, count=100)

    # Print top 20 for summary
    print(f"\n=== Top 20 Priority Queue ===")
    print(f"{'Rank':>4} {'Package':<45} {'#':>6} {'BDep':>4} {'RDep':>4} {'TDep':>5} {'AUR':>3}")
    for e in tree[:20]:
        in_aur = "Y" if e["in_aur"] else "N"
        print(f"{e['rank']:>4} {e['name']:<45} {e['number']:>6} "
              f"{e['blocked_dep_count']:>4} {e['reverse_dep_count']:>4} "
              f"{e['total_dep_count']:>5} {in_aur:>3}")

    print(f"\n=== Selected 100 Packages ===")
    for e in selected:
        print(f"  {e['rank']:>3}. {e['name']} (#{e['number']})")

    return selected


if __name__ == "__main__":
    selected = main()
