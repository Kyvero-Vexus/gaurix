#!/usr/bin/env python3
"""
Build dependency tree for BLOCKED packages and select top 100 by priority.

Priority sort:
  1. blocked_dep_count ascending
  2. reverse_dep_count descending
  3. total_dep_count ascending
  4. package name ascending

Output:
  - reports/blocked-dependency-tree.json
  - reports/blocked-dependency-tree.md
  - reports/deptree-resolver-260413e-selection.json
"""

import json
import re
import sys
from datetime import datetime, timezone

TODO_FILE = "todo_general_packages.org"
AUR_CACHE = "data/aur-cache/packages-meta-ext-v1.json"
TREE_JSON = "reports/blocked-dependency-tree.json"
TREE_MD = "reports/blocked-dependency-tree.md"
SELECTION_JSON = "reports/deptree-resolver-260413e-selection.json"

def extract_blocked_packages(todo_file):
    """Extract all BLOCKED packages with their numbers from org file."""
    blocked = {}
    pattern = re.compile(r'^\*\* BLOCKED (\d+)\. (.+?)(?:\s+\[.*\])?\s*$')
    with open(todo_file, 'r') as f:
        for line in f:
            m = pattern.match(line)
            if m:
                num = int(m.group(1))
                name = m.group(2).strip()
                blocked[name] = num
    return blocked

def load_aur_cache(aur_file):
    """Load AUR cache and build lookup by package name."""
    with open(aur_file, 'r') as f:
        data = json.load(f)
    lookup = {}
    for pkg in data:
        lookup[pkg['Name']] = pkg
    return lookup

def build_dependency_tree(blocked_pkgs, aur_lookup):
    """Build dependency tree metrics for blocked packages."""
    blocked_set = set(blocked_pkgs.keys())

    # Build reverse dependency map (within blocked set)
    reverse_deps = {name: set() for name in blocked_set}
    dep_info = {}

    for name in blocked_set:
        aur_pkg = aur_lookup.get(name)
        if aur_pkg:
            all_deps = []
            for dep_field in ['Depends', 'MakeDepends', 'OptDepends', 'CheckDepends']:
                deps = aur_pkg.get(dep_field, []) or []
                for d in deps:
                    # Strip version constraints: "foo>=1.0" -> "foo"
                    dep_name = re.split(r'[>=<:]', d)[0].strip()
                    if dep_name:
                        all_deps.append(dep_name)

            total_deps = list(set(all_deps))
            blocked_deps = [d for d in total_deps if d in blocked_set]

            # Record reverse dependencies
            for d in blocked_deps:
                if d != name:  # don't count self
                    reverse_deps[d].add(name)

            dep_info[name] = {
                'total_dep_count': len(total_deps),
                'blocked_deps': blocked_deps,
                'blocked_dep_count': len(blocked_deps),
                'all_deps': total_deps
            }
        else:
            dep_info[name] = {
                'total_dep_count': 0,
                'blocked_deps': [],
                'blocked_dep_count': 0,
                'all_deps': []
            }

    # Build final queue entries
    queue = []
    for name in blocked_set:
        info = dep_info[name]
        entry = {
            'name': name,
            'number': blocked_pkgs[name],
            'blocked_dep_count': info['blocked_dep_count'],
            'reverse_dep_count': len(reverse_deps.get(name, set())),
            'total_dep_count': info['total_dep_count'],
            'blocked_deps': sorted(info['blocked_deps']),
            'reverse_deps': sorted(reverse_deps.get(name, set()))
        }
        queue.append(entry)

    # Priority sort
    queue.sort(key=lambda x: (
        x['blocked_dep_count'],
        -x['reverse_dep_count'],
        x['total_dep_count'],
        x['name']
    ))

    return queue

def write_tree_json(queue, output_file):
    """Write dependency tree JSON."""
    timestamp = datetime.now(timezone.utc).strftime('%Y-%m-%dT%H:%M:%SZ')
    data = {
        'timestamp': timestamp,
        'total_blocked': len(queue),
        'queue': queue
    }
    with open(output_file, 'w') as f:
        json.dump(data, f, indent=2)
    return timestamp

def write_tree_md(queue, timestamp, output_file):
    """Write dependency tree Markdown report."""
    lines = [
        '# Blocked Package Dependency Tree\n',
        f'**Generated:** {timestamp}',
        f'**Total blocked:** {len(queue)}\n',
        '## Priority Queue (Top 50)\n',
        '| Rank | Package | # | Blocked Deps | Reverse Deps | Total Deps |',
        '|------|---------|---|-------------|-------------|------------|',
    ]
    for i, entry in enumerate(queue[:50], 1):
        lines.append(
            f"| {i} | {entry['name']} | {entry['number']} | "
            f"{entry['blocked_dep_count']} | {entry['reverse_dep_count']} | "
            f"{entry['total_dep_count']} |"
        )
    lines.append('')
    with open(output_file, 'w') as f:
        f.write('\n'.join(lines) + '\n')

def write_selection(queue, count, output_file):
    """Write selected packages JSON."""
    selected = queue[:count]
    with open(output_file, 'w') as f:
        json.dump({
            'count': len(selected),
            'packages': selected
        }, f, indent=2)
    return selected

def main():
    print("Extracting BLOCKED packages from todo...")
    blocked_pkgs = extract_blocked_packages(TODO_FILE)
    print(f"  Found {len(blocked_pkgs)} BLOCKED packages")

    print("Loading AUR cache...")
    aur_lookup = load_aur_cache(AUR_CACHE)
    print(f"  Loaded {len(aur_lookup)} AUR packages")

    print("Building dependency tree...")
    queue = build_dependency_tree(blocked_pkgs, aur_lookup)

    print("Writing tree JSON...")
    timestamp = write_tree_json(queue, TREE_JSON)

    print("Writing tree Markdown...")
    write_tree_md(queue, timestamp, TREE_MD)

    print("Selecting top 100...")
    selected = write_selection(queue, 100, SELECTION_JSON)

    print(f"\nDone! Selected {len(selected)} packages.")
    print(f"\nTop 20 priority queue:")
    for i, entry in enumerate(selected[:20], 1):
        print(f"  {i:3d}. {entry['name']:<40s} bd={entry['blocked_dep_count']} rd={entry['reverse_dep_count']} td={entry['total_dep_count']}")

    print(f"\nAll 100 selected:")
    for i, entry in enumerate(selected, 1):
        print(f"  {i:3d}. {entry['name']}")

if __name__ == '__main__':
    main()
