#!/usr/bin/env python3
"""
Build dependency tree for BLOCKED packages and select top 100.
Run ID: deptree-resolver-260408f
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
SELECTED_JSON = ROOT / "reports" / "deptree-resolver-260408f-selection.json"

RUN_ID = "deptree-resolver-260408f"


def extract_blocked_packages(org_path):
    blocked = {}
    pattern = re.compile(r"^\*\* BLOCKED (\d+)\. (.+?)(\s*\[.*\])?$")
    with open(org_path, "r") as f:
        for line in f:
            m = pattern.match(line)
            if m:
                num = int(m.group(1))
                name = m.group(2).strip()
                name = re.sub(r'\s+- Source List:.*$', '', name).strip()
                name = re.sub(r'\s+\[.*\]$', '', name).strip()
                blocked[name] = num
    return blocked


def load_aur_cache(cache_path):
    with open(cache_path, "r") as f:
        data = json.load(f)
    by_name = {}
    for pkg in data:
        by_name[pkg["Name"]] = pkg
    provides_map = {}
    for pkg in data:
        for prov in pkg.get("Provides") or []:
            prov_name = re.split(r"[><=!:]", prov)[0].strip()
            provides_map.setdefault(prov_name, set()).add(pkg["Name"])
    return by_name, provides_map


def strip_version(dep_str):
    return re.split(r"[><=!:]", dep_str)[0].strip()


def build_dependency_tree(blocked_pkgs, aur_by_name, provides_map):
    blocked_set = set(blocked_pkgs.keys())

    pkg_deps = {}
    for name in blocked_set:
        pkg = aur_by_name.get(name, {})
        deps = set()
        for dep_str in pkg.get("Depends") or []:
            deps.add(strip_version(dep_str))
        for dep_str in pkg.get("MakeDepends") or []:
            deps.add(strip_version(dep_str))
        pkg_deps[name] = deps

    pkg_blocked_deps = {}
    for name in blocked_set:
        blocked_deps = set()
        for dep in pkg_deps.get(name, set()):
            if dep in blocked_set:
                blocked_deps.add(dep)
            else:
                for provider in provides_map.get(dep, set()):
                    if provider in blocked_set:
                        blocked_deps.add(provider)
        pkg_blocked_deps[name] = blocked_deps

    reverse_deps = {name: set() for name in blocked_set}
    for name in blocked_set:
        for dep in pkg_deps.get(name, set()):
            if dep in blocked_set:
                reverse_deps[dep].add(name)
            else:
                for provider in provides_map.get(dep, set()):
                    if provider in blocked_set:
                        reverse_deps[provider].add(name)

    queue = []
    for name in blocked_set:
        queue.append({
            "name": name,
            "number": blocked_pkgs[name],
            "blocked_dep_count": len(pkg_blocked_deps[name]),
            "reverse_dep_count": len(reverse_deps[name]),
            "total_dep_count": len(pkg_deps.get(name, set())),
            "blocked_deps": sorted(pkg_blocked_deps[name]),
        })

    queue.sort(key=lambda x: (
        x["blocked_dep_count"],
        -x["reverse_dep_count"],
        x["total_dep_count"],
        x["name"],
    ))

    for i, entry in enumerate(queue):
        entry["rank"] = i + 1

    return queue


def write_tree_json(queue, timestamp):
    data = {
        "timestamp": timestamp,
        "run_id": RUN_ID,
        "total_blocked": len(queue),
        "queue": queue,
    }
    with open(TREE_JSON, "w") as f:
        json.dump(data, f, indent=2)


def write_tree_md(queue, timestamp, top_n=120):
    lines = [
        "# Blocked Dependency Tree",
        "",
        f"**Timestamp:** {timestamp}",
        f"**Run:** {RUN_ID}",
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
    with open(TREE_MD, "w") as f:
        f.write("\n".join(lines))


def write_selected(queue):
    selected = queue[:100]
    data = {
        "timestamp": datetime.now(timezone.utc).isoformat(),
        "run_id": RUN_ID,
        "selected": [e["name"] for e in selected],
        "details": selected,
    }
    with open(SELECTED_JSON, "w") as f:
        json.dump(data, f, indent=2)
    return selected


def main():
    print("Extracting BLOCKED packages...")
    blocked = extract_blocked_packages(ORG_FILE)
    print(f"  Found {len(blocked)} BLOCKED packages")

    print("Loading AUR cache...")
    aur_by_name, provides_map = load_aur_cache(AUR_CACHE)
    print(f"  Loaded {len(aur_by_name)} AUR packages")

    print("Building dependency tree...")
    queue = build_dependency_tree(blocked, aur_by_name, provides_map)

    timestamp = datetime.now(timezone.utc).isoformat()
    print("Writing tree artifacts...")
    write_tree_json(queue, timestamp)
    print(f"  Written: {TREE_JSON}")
    write_tree_md(queue, timestamp)
    print(f"  Written: {TREE_MD}")

    print("Selecting top 100...")
    selected = write_selected(queue)
    print(f"  Written: {SELECTED_JSON}")

    print(f"\n=== Top 20 Priority Queue ===")
    print(f"{'Pos':>4} {'#':>6} {'Package':<45} {'BDep':>5} {'RDep':>5} {'TDep':>5}")
    for s in selected[:20]:
        print(f"{s['rank']:>4} {s['number']:>6} {s['name']:<45} {s['blocked_dep_count']:>5} {s['reverse_dep_count']:>5} {s['total_dep_count']:>5}")

    print(f"\n=== All 100 Selected ===")
    for s in selected:
        print(f"  {s['rank']:>3}. {s['name']}")

    # Also output as JSON for downstream consumption
    json.dump([e["name"] for e in selected], sys.stdout)
    print()


if __name__ == "__main__":
    main()
