#!/usr/bin/env python3
"""
Dependency-tree-driven BLOCKED package resolver for Gaurix.
Pass ID: deptree-resolver-260424c

Extracts packages with TODO Status: BLOCKED from todo_general_packages.org,
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
SELECTION_JSON = REPO_ROOT / "reports" / "deptree-resolver-260424c-selection.json"

PASS_ID = "deptree-resolver-260424c"


def extract_blocked_packages(todo_path):
    """Extract package names and numbers where last TODO Status is BLOCKED."""
    packages = []
    seen_names = set()
    header_re = re.compile(r'^\*\* (?:DONE|TODO|FAILED|BLOCKED|SKIPPED|NEEDS_RECIPE_DESIGN)\s+(\d+)\.\s+(\S+)')

    current = None
    with open(todo_path, 'r') as f:
        for line in f:
            m = header_re.match(line)
            if m:
                if current:
                    if current['todo_statuses'] and current['todo_statuses'][-1] == 'BLOCKED':
                        if current['name'] not in seen_names:
                            packages.append({"number": current['number'], "name": current['name']})
                            seen_names.add(current['name'])
                current = {
                    'number': int(m.group(1)),
                    'name': m.group(2),
                    'todo_statuses': []
                }
            elif current and 'TODO Status:' in line:
                m2 = re.search(r'TODO Status:\s*(\S+)', line)
                if m2:
                    current['todo_statuses'].append(m2.group(1))

    if current and current['todo_statuses'] and current['todo_statuses'][-1] == 'BLOCKED':
        if current['name'] not in seen_names:
            packages.append({"number": current['number'], "name": current['name']})

    return packages


def load_aur_metadata(cache_path):
    """Load AUR metadata into a name->entry dict."""
    with open(cache_path, 'r') as f:
        data = json.load(f)
    by_name = {}
    provides_map = {}
    for entry in data:
        by_name[entry["Name"]] = entry
        for prov in entry.get("Provides", []):
            prov_name = re.split(r'[><=]', prov)[0]
            provides_map[prov_name] = entry["Name"]
    return by_name, provides_map


def strip_version(dep_str):
    """Strip version constraints from dep string."""
    return re.split(r'[><=]', dep_str)[0]


def build_dependency_tree(blocked_pkgs, aur_meta, provides_map):
    """Build dependency tree for blocked packages."""
    blocked_names = {p["name"] for p in blocked_pkgs}
    blocked_by_name = {p["name"]: p for p in blocked_pkgs}

    dep_graph = {}
    for pkg in blocked_pkgs:
        name = pkg["name"]
        meta = aur_meta.get(name)
        if not meta:
            dep_graph[name] = set()
            continue

        all_deps = set()
        for dep_str in meta.get("Depends", []):
            all_deps.add(strip_version(dep_str))
        for dep_str in meta.get("MakeDepends", []):
            all_deps.add(strip_version(dep_str))

        dep_graph[name] = all_deps

    # Compute reverse deps within the blocked set
    reverse_deps = {name: set() for name in blocked_names}

    for name in blocked_names:
        deps = dep_graph.get(name, set())
        for d in deps:
            resolved = d
            if d not in blocked_names and d in provides_map and provides_map[d] in blocked_names:
                resolved = provides_map[d]
            if resolved in blocked_names and resolved != name:
                reverse_deps[resolved].add(name)

    results = []
    for pkg in blocked_pkgs:
        name = pkg["name"]
        deps = dep_graph.get(name, set())

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

    # Priority sort
    results.sort(key=lambda x: (
        x["blocked_dep_count"],
        -x["reverse_dep_count"],
        x["total_dep_count"],
        x["name"],
    ))

    for i, r in enumerate(results):
        r["rank"] = i + 1

    return results


def write_tree_json(queue, timestamp):
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
                "in_aur": q["in_aur"],
            }
            for q in queue
        ]
    }
    with open(TREE_JSON, 'w') as f:
        json.dump(data, f, indent=2)
    print(f"Wrote {TREE_JSON}")


def write_tree_md(queue, timestamp):
    in_aur = sum(1 for q in queue if q["in_aur"])
    not_in_aur = len(queue) - in_aur
    zero_blocked = sum(1 for q in queue if q["blocked_dep_count"] == 0)

    lines = [
        "# Blocked Package Dependency Tree",
        "",
        f"**Generated:** {timestamp}",
        f"**Pass:** {PASS_ID}",
        "",
        "## Summary",
        "",
        f"- Total BLOCKED: {len(queue)}",
        f"- In AUR cache: {in_aur}",
        f"- Not in AUR cache: {not_in_aur}",
        f"- Zero blocked deps: {zero_blocked}",
        "",
        "## Priority Queue",
        "",
        "| Rank | # | Package | Blocked Deps | Reverse Deps | Total Deps | In AUR |",
        "|------|---|---------|-------------|-------------|------------|--------|",
    ]

    for q in queue[:200]:
        lines.append(
            f"| {q['rank']} | {q['number']} | {q['name']} | "
            f"{q['blocked_dep_count']} | {q['reverse_dep_count']} | "
            f"{q['total_dep_count']} | {'Y' if q['in_aur'] else 'N'} |"
        )

    if len(queue) > 200:
        lines.append(f"\n*... and {len(queue) - 200} more packages in full queue.*")

    with open(TREE_MD, 'w') as f:
        f.write("\n".join(lines) + "\n")
    print(f"Wrote {TREE_MD}")


def write_selection(selected, timestamp):
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

    print("\n[1] Extracting BLOCKED packages (by last TODO Status)...")
    blocked = extract_blocked_packages(TODO_FILE)
    print(f"  Found {len(blocked)} BLOCKED packages")

    print("\n[2] Loading AUR metadata...")
    aur_meta, provides_map = load_aur_metadata(AUR_CACHE)
    print(f"  Loaded {len(aur_meta)} AUR packages, {len(provides_map)} provides mappings")

    in_aur = sum(1 for p in blocked if p["name"] in aur_meta)
    print(f"  {in_aur}/{len(blocked)} blocked packages found in AUR cache")

    print("\n[3] Building dependency tree...")
    queue = build_dependency_tree(blocked, aur_meta, provides_map)

    print("\n[4] Writing tree artifacts...")
    write_tree_json(queue, timestamp)
    write_tree_md(queue, timestamp)

    # Select top 100 (only those in AUR)
    selectable = [q for q in queue if q["in_aur"]]
    selected = selectable[:100]

    print(f"\n[5] Selected {len(selected)} packages for resolution (from {len(selectable)} in AUR)")
    write_selection(selected, timestamp)

    # Print top 20 summary
    print("\n=== Top 20 Priority Queue ===")
    print(f"{'Rank':>4} {'#':>6} {'Package':<40} {'BlkD':>4} {'RevD':>4} {'TotD':>4} {'AUR':>3}")
    print("-" * 80)
    for q in queue[:20]:
        print(f"{q['rank']:>4} {q['number']:>6} {q['name']:<40} {q['blocked_dep_count']:>4} "
              f"{q['reverse_dep_count']:>4} {q['total_dep_count']:>4} "
              f"{'Y' if q['in_aur'] else 'N':>3}")

    # Print selected packages list
    print(f"\n=== Selected {len(selected)} Packages ===")
    for s in selected:
        print(f"  {s['rank']:>4}. {s['name']} (#{s['number']}, v{s['version']}, deps={s['total_dep_count']})")


if __name__ == "__main__":
    main()
