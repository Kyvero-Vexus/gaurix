#!/usr/bin/env python3
"""Build dependency tree for BLOCKED packages and select top 100 by priority.
Run ID: deptree-resolver-260414b

Steps:
1. Parse todo_general_packages.org for all BLOCKED packages
2. Load AUR metadata for dependency info
3. Build dependency tree with blocked_dep_count, reverse_dep_count, total_dep_count
4. Priority sort and select top 100
5. Generate reports/blocked-dependency-tree.json and .md
6. Output selection JSON and summary
"""

import json
import re
import sys
from datetime import datetime, timezone
from pathlib import Path
from collections import defaultdict

REPO_ROOT = Path(__file__).resolve().parent.parent
ORG_FILE = REPO_ROOT / "todo_general_packages.org"
AUR_CACHE = REPO_ROOT / "data" / "aur-cache" / "packages-meta-ext-v1.json"
TREE_JSON = REPO_ROOT / "reports" / "blocked-dependency-tree.json"
TREE_MD = REPO_ROOT / "reports" / "blocked-dependency-tree.md"
SELECTION_JSON = REPO_ROOT / "reports" / "deptree-resolver-260414b-selection.json"

RUN_ID = "deptree-resolver-260414b"
TIMESTAMP = datetime.now(timezone.utc).isoformat()
SELECT_COUNT = 100


def extract_blocked_packages(org_path):
    """Extract all BLOCKED packages with their numbers from the org file."""
    blocked = {}
    pattern = re.compile(r'^\*\* BLOCKED (\d+)\. (\S+)')
    with open(org_path, 'r') as f:
        for line in f:
            m = pattern.match(line.strip())
            if m:
                number = int(m.group(1))
                name = m.group(2).strip()
                blocked[name] = number
    return blocked


def load_aur_cache(cache_path):
    """Load AUR package metadata, indexed by name."""
    print(f"Loading AUR cache from {cache_path}...", file=sys.stderr)
    with open(cache_path, 'r') as f:
        packages = json.load(f)
    by_name = {}
    for pkg in packages:
        by_name[pkg['Name']] = pkg
    print(f"Loaded {len(by_name)} AUR packages", file=sys.stderr)
    return by_name


def build_dependency_tree(blocked_packages, aur_cache):
    """Build dependency tree for blocked packages."""
    blocked_set = set(blocked_packages.keys())

    pkg_deps = {}
    for name in blocked_set:
        aur_pkg = aur_cache.get(name)
        if aur_pkg:
            deps = set()
            for field in ('Depends', 'MakeDepends', 'OptDepends', 'CheckDepends'):
                for dep in aur_pkg.get(field, []) or []:
                    dep_name = re.split(r'[><=: ]', dep)[0]
                    if dep_name:
                        deps.add(dep_name)
            pkg_deps[name] = deps
        else:
            pkg_deps[name] = set()

    blocked_deps_map = {}
    for name in blocked_set:
        blocked_deps_map[name] = pkg_deps.get(name, set()) & blocked_set

    reverse_deps_map = defaultdict(set)
    for name in blocked_set:
        for dep in blocked_deps_map.get(name, set()):
            reverse_deps_map[dep].add(name)

    results = []
    for name in blocked_set:
        bd = sorted(blocked_deps_map.get(name, set()))
        rd = sorted(reverse_deps_map.get(name, set()))
        total_deps = len(pkg_deps.get(name, set()))
        results.append({
            'name': name,
            'number': blocked_packages[name],
            'blocked_dep_count': len(bd),
            'reverse_dep_count': len(rd),
            'total_dep_count': total_deps,
            'blocked_deps': bd,
            'reverse_deps': rd,
        })

    results.sort(key=lambda x: (
        x['blocked_dep_count'],
        -x['reverse_dep_count'],
        x['total_dep_count'],
        x['name']
    ))

    for i, r in enumerate(results):
        r['rank'] = i + 1

    return results


def write_tree_json(queue, output_path):
    data = {
        'timestamp': TIMESTAMP,
        'run_id': RUN_ID,
        'total_blocked': len(queue),
        'queue': queue,
    }
    with open(output_path, 'w') as f:
        json.dump(data, f, indent=2)
    print(f"Wrote {output_path} ({len(queue)} packages)", file=sys.stderr)


def write_tree_md(queue, output_path):
    lines = [
        "# Blocked Dependency Tree",
        "",
        f"- **Timestamp:** {TIMESTAMP}",
        f"- **Run ID:** {RUN_ID}",
        f"- **Total blocked:** {len(queue)}",
        f"- **Queue length:** {len(queue)}",
        "",
        "## Priority Queue (top 120)",
        "",
        "| Rank | Package | Blocked Deps | Reverse Deps | Total Deps |",
        "|------|---------|-------------|-------------|-----------|",
    ]
    for pkg in queue[:120]:
        lines.append(
            f"| {pkg['rank']} | {pkg['name']} | {pkg['blocked_dep_count']} "
            f"| {pkg['reverse_dep_count']} | {pkg['total_dep_count']} |"
        )

    with open(output_path, 'w') as f:
        f.write('\n'.join(lines) + '\n')
    print(f"Wrote {output_path}", file=sys.stderr)


def write_selection_json(selected, output_path):
    data = {
        'timestamp': TIMESTAMP,
        'run_id': RUN_ID,
        'count': len(selected),
        'packages': selected,
    }
    with open(output_path, 'w') as f:
        json.dump(data, f, indent=2)
    print(f"Wrote {output_path} ({len(selected)} packages)", file=sys.stderr)


def main():
    blocked = extract_blocked_packages(ORG_FILE)
    print(f"Found {len(blocked)} BLOCKED packages in org file", file=sys.stderr)

    aur_cache = load_aur_cache(AUR_CACHE)

    queue = build_dependency_tree(blocked, aur_cache)

    write_tree_json(queue, TREE_JSON)
    write_tree_md(queue, TREE_MD)

    selected = queue[:SELECT_COUNT]
    write_selection_json(selected, SELECTION_JSON)

    print("\n=== Top 20 Priority Queue ===", file=sys.stderr)
    for pkg in selected[:20]:
        print(f"  {pkg['rank']:3d}. {pkg['name']:<50s} "
              f"blocked_deps={pkg['blocked_dep_count']} "
              f"rev_deps={pkg['reverse_dep_count']} "
              f"total_deps={pkg['total_dep_count']}", file=sys.stderr)

    json.dump([{
        'name': p['name'],
        'number': p['number'],
        'blocked_dep_count': p['blocked_dep_count'],
        'reverse_dep_count': p['reverse_dep_count'],
        'total_dep_count': p['total_dep_count'],
        'blocked_deps': p['blocked_deps'],
        'reverse_deps': p['reverse_deps'],
        'rank': p['rank'],
    } for p in selected], sys.stdout, indent=2)
    print()


if __name__ == '__main__':
    main()
