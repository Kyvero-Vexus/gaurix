#!/usr/bin/env python3
"""
Dependency-tree-driven BLOCKED package resolver for Gaurix.
Pass ID: deptree-resolver-260423c

Extracts FAILED/BLOCKED/SKIPPED packages from todo_general_packages.org,
builds dependency tree from AUR metadata, computes priority queue,
selects top 100 packages for resolution.
"""

import json
import re
import sys
from datetime import datetime, timezone
from pathlib import Path

REPO_ROOT = Path(__file__).resolve().parent.parent
TODO_FILE = REPO_ROOT / "todo_general_packages.org"
AUR_CACHE = REPO_ROOT / "data" / "aur-cache" / "packages-meta-ext-v1.json"
TREE_JSON = REPO_ROOT / "reports" / "blocked-dependency-tree.json"
TREE_MD = REPO_ROOT / "reports" / "blocked-dependency-tree.md"
SELECTION_JSON = REPO_ROOT / "reports" / "deptree-resolver-260423c-selection.json"

PASS_ID = "deptree-resolver-260423c"


def extract_blocked_packages(todo_path):
    """Extract package names and numbers from FAILED/BLOCKED/SKIPPED entries."""
    packages = []
    seen_names = set()
    pattern = re.compile(r'^\*\* (?:FAILED|BLOCKED|SKIPPED)\s+(\d+)\.\s+(\S+)')
    with open(todo_path, 'r') as f:
        for line in f:
            m = pattern.match(line)
            if m:
                num = int(m.group(1))
                name = m.group(2)
                if name not in seen_names:
                    packages.append({"number": num, "name": name})
                    seen_names.add(name)
    return packages


def load_aur_metadata(cache_path):
    """Load AUR metadata into a name->entry dict."""
    with open(cache_path, 'r') as f:
        data = json.load(f)
    by_name = {}
    provides_map = {}  # maps provided name -> package name
    for entry in data:
        by_name[entry["Name"]] = entry
        for prov in entry.get("Provides", []):
            # Strip version constraint: "foo=1.2" -> "foo"
            prov_name = re.split(r'[><=]', prov)[0]
            provides_map[prov_name] = entry["Name"]
    return by_name, provides_map


def strip_version(dep_str):
    """Strip version constraints from dep string: 'foo>=1.2' -> 'foo'"""
    return re.split(r'[><=]', dep_str)[0]


def build_dependency_tree(blocked_pkgs, aur_meta, provides_map):
    """Build dependency tree for blocked packages.

    For each blocked package, find its dependencies from AUR metadata.
    Compute:
    - blocked_dep_count: number of direct deps that are also in the blocked set
    - reverse_dep_count: how many blocked packages depend on this package
    - total_dep_count: total number of dependencies
    """
    blocked_names = {p["name"] for p in blocked_pkgs}
    blocked_by_name = {p["name"]: p for p in blocked_pkgs}

    # Build dep graph
    dep_graph = {}  # pkg_name -> set of dep names
    for pkg in blocked_pkgs:
        name = pkg["name"]
        meta = aur_meta.get(name)
        if not meta:
            dep_graph[name] = set()
            continue

        all_deps = set()
        for dep_str in meta.get("Depends", []):
            dep_name = strip_version(dep_str)
            all_deps.add(dep_name)
        for dep_str in meta.get("MakeDepends", []):
            dep_name = strip_version(dep_str)
            all_deps.add(dep_name)

        dep_graph[name] = all_deps

    # Compute metrics
    results = []
    reverse_deps = {name: set() for name in blocked_names}

    for name in blocked_names:
        deps = dep_graph.get(name, set())
        # Resolve provides
        resolved_deps = set()
        for d in deps:
            if d in blocked_names:
                resolved_deps.add(d)
            elif d in provides_map and provides_map[d] in blocked_names:
                resolved_deps.add(provides_map[d])

        for bd in resolved_deps:
            reverse_deps[bd].add(name)

    for pkg in blocked_pkgs:
        name = pkg["name"]
        deps = dep_graph.get(name, set())

        # blocked deps = deps that are also in blocked set
        blocked_deps = set()
        for d in deps:
            if d in blocked_names:
                blocked_deps.add(d)
            elif d in provides_map and provides_map[d] in blocked_names:
                blocked_deps.add(provides_map[d])

        total_dep_count = len(deps)
        blocked_dep_count = len(blocked_deps)
        reverse_dep_count = len(reverse_deps.get(name, set()))

        meta = aur_meta.get(name, {})

        results.append({
            "name": name,
            "number": pkg["number"],
            "blocked_dep_count": blocked_dep_count,
            "reverse_dep_count": reverse_dep_count,
            "total_dep_count": total_dep_count,
            "blocked_deps": sorted(blocked_deps),
            "reverse_deps": sorted(reverse_deps.get(name, set())),
            "in_aur": name in aur_meta,
            "version": meta.get("Version", ""),
            "description": meta.get("Description", ""),
            "url": meta.get("URL", ""),
            "license": meta.get("License", []),
            "depends": sorted(deps) if deps else [],
        })

    # Sort by priority
    results.sort(key=lambda x: (
        x["blocked_dep_count"],      # ascending - fewer blocked deps first
        -x["reverse_dep_count"],     # descending - more reverse deps first
        x["total_dep_count"],        # ascending - fewer total deps first
        x["name"],                   # ascending - alphabetical
    ))

    # Assign ranks
    for i, r in enumerate(results):
        r["rank"] = i + 1

    return results


def write_tree_json(queue, timestamp):
    """Write blocked-dependency-tree.json"""
    data = {
        "timestamp": timestamp,
        "pass_id": PASS_ID,
        "total_blocked": len(queue),
        "queue": [
            {
                "rank": q["rank"],
                "name": q["name"],
                "number": q["number"],
                "blocked_dep_count": q["blocked_dep_count"],
                "reverse_dep_count": q["reverse_dep_count"],
                "total_dep_count": q["total_dep_count"],
                "blocked_deps": q["blocked_deps"],
                "reverse_deps": q["reverse_deps"],
            }
            for q in queue
        ]
    }
    with open(TREE_JSON, 'w') as f:
        json.dump(data, f, indent=2)
    print(f"Wrote {TREE_JSON}")


def write_tree_md(queue, timestamp):
    """Write blocked-dependency-tree.md"""
    lines = [
        "# Blocked Dependency Tree",
        "",
        f"**Pass:** {PASS_ID}  ",
        f"**Timestamp:** {timestamp}  ",
        f"**Total BLOCKED/FAILED/SKIPPED:** {len(queue)}  ",
        "",
        "## Priority Queue (Top 100)",
        "",
        "| Rank | Package | # | Blocked Deps | Reverse Deps | Total Deps | In AUR |",
        "|------|---------|---|-------------|-------------|------------|--------|",
    ]

    for q in queue[:100]:
        lines.append(
            f"| {q['rank']} | {q['name']} | {q['number']} | "
            f"{q['blocked_dep_count']} | {q['reverse_dep_count']} | "
            f"{q['total_dep_count']} | {'Y' if q['in_aur'] else 'N'} |"
        )

    if len(queue) > 100:
        lines.append(f"\n*... and {len(queue) - 100} more packages in full queue.*")

    with open(TREE_MD, 'w') as f:
        f.write("\n".join(lines) + "\n")
    print(f"Wrote {TREE_MD}")


def write_selection(selected, timestamp):
    """Write selection JSON for this pass."""
    data = {
        "timestamp": timestamp,
        "pass_id": PASS_ID,
        "count": len(selected),
        "packages": [
            {
                "rank": s["rank"],
                "name": s["name"],
                "number": s["number"],
                "blocked_dep_count": s["blocked_dep_count"],
                "reverse_dep_count": s["reverse_dep_count"],
                "total_dep_count": s["total_dep_count"],
                "in_aur": s["in_aur"],
                "version": s["version"],
                "description": s["description"],
                "url": s["url"],
                "license": s["license"],
                "depends": s["depends"],
            }
            for s in selected
        ]
    }
    with open(SELECTION_JSON, 'w') as f:
        json.dump(data, f, indent=2)
    print(f"Wrote {SELECTION_JSON}")


def main():
    timestamp = datetime.now(timezone.utc).isoformat()

    print(f"=== {PASS_ID} ===")
    print(f"Timestamp: {timestamp}")

    # Step 1: Extract blocked packages
    print("\n[1] Extracting FAILED/BLOCKED/SKIPPED packages...")
    blocked = extract_blocked_packages(TODO_FILE)
    print(f"  Found {len(blocked)} packages")

    # Step 2: Load AUR metadata
    print("\n[2] Loading AUR metadata...")
    aur_meta, provides_map = load_aur_metadata(AUR_CACHE)
    print(f"  Loaded {len(aur_meta)} AUR packages, {len(provides_map)} provides mappings")

    # Count how many blocked are in AUR
    in_aur = sum(1 for p in blocked if p["name"] in aur_meta)
    print(f"  {in_aur}/{len(blocked)} blocked packages found in AUR cache")

    # Step 3: Build dependency tree
    print("\n[3] Building dependency tree...")
    queue = build_dependency_tree(blocked, aur_meta, provides_map)

    # Step 4: Write tree artifacts
    print("\n[4] Writing tree artifacts...")
    write_tree_json(queue, timestamp)
    write_tree_md(queue, timestamp)

    # Step 5: Select top 100 (only those in AUR)
    # Filter to packages that are in AUR (can actually be resolved)
    selectable = [q for q in queue if q["in_aur"]]
    selected = selectable[:100]

    print(f"\n[5] Selected {len(selected)} packages for resolution (from {len(selectable)} in AUR)")
    write_selection(selected, timestamp)

    # Print top 20 summary
    print("\n=== Top 20 Priority Queue ===")
    print(f"{'Rank':>4} {'Package':<40} {'BlkD':>4} {'RevD':>4} {'TotD':>4} {'AUR':>3}")
    print("-" * 75)
    for q in queue[:20]:
        print(f"{q['rank']:>4} {q['name']:<40} {q['blocked_dep_count']:>4} "
              f"{q['reverse_dep_count']:>4} {q['total_dep_count']:>4} "
              f"{'Y' if q['in_aur'] else 'N':>3}")

    # Print selected packages list
    print(f"\n=== Selected {len(selected)} Packages ===")
    for s in selected:
        print(f"  {s['rank']:>4}. {s['name']} (v{s['version']}, deps={s['total_dep_count']})")

    return selected


if __name__ == "__main__":
    selected = main()
    # Output count for scripting
    print(f"\nSELECTED_COUNT={len(selected)}")
