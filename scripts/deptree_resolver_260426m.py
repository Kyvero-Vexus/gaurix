#!/usr/bin/env python3
"""Dependency-tree-driven BLOCKED package resolver pass deptree-resolver-260426m.

Builds dependency tree for all BLOCKED packages in todo_general_packages.org,
prioritizes by dependency order, and selects the top 100 for resolution.
"""

import json
import re
import sys
from datetime import datetime, timezone
from pathlib import Path

PASS_ID = "deptree-resolver-260426m"
ORG_FILE = Path("todo_general_packages.org")
AUR_CACHE = Path("data/aur-cache/packages-meta-ext-v1.json")
TREE_JSON = Path("reports/blocked-dependency-tree.json")
TREE_MD = Path("reports/blocked-dependency-tree.md")
SELECTION_JSON = Path(f"reports/{PASS_ID}-selection.json")

def parse_blocked_packages(org_path):
    """Extract all BLOCKED packages from org file."""
    blocked = []
    pattern = re.compile(r'^\*\* DONE\s+(\d+)\.\s+(\S+)\s+\[BLOCKED:\s*(.*?)\]')
    with open(org_path, 'r', encoding='utf-8') as f:
        for line in f:
            m = pattern.match(line)
            if m:
                number = int(m.group(1))
                name = m.group(2)
                reason = m.group(3).strip().rstrip(']')
                blocked.append({
                    'number': number,
                    'name': name,
                    'reason': reason,
                })
    return blocked

def load_aur_cache(cache_path):
    """Load AUR metadata into a name-indexed dict."""
    with open(cache_path, 'r') as f:
        packages = json.load(f)
    by_name = {}
    for pkg in packages:
        by_name[pkg['Name']] = pkg
    return by_name

def strip_version_constraint(dep_str):
    """Strip version constraint from dependency string: 'foo>=1.0' -> 'foo'"""
    for sep in ['>=', '<=', '=', '>', '<', ':']:
        idx = dep_str.find(sep)
        if idx > 0:
            return dep_str[:idx]
    return dep_str

def get_all_deps(aur_pkg):
    """Get all dependency names from an AUR package entry."""
    deps = set()
    for field in ['Depends', 'MakeDepends']:
        vals = aur_pkg.get(field)
        if vals:
            for d in vals:
                deps.add(strip_version_constraint(d))
    return deps

def build_dependency_tree(blocked_list, aur_cache):
    """Build dependency tree for blocked packages."""
    blocked_names = {p['name'] for p in blocked_list}
    blocked_by_name = {p['name']: p for p in blocked_list}

    # Build provides mapping: provided_name -> package_name
    provides_map = {}
    for pkg_name, pkg_data in aur_cache.items():
        provides = pkg_data.get('Provides')
        if provides:
            for p in provides:
                pname = strip_version_constraint(p)
                provides_map[pname] = pkg_name

    tree = []
    for pkg in blocked_list:
        name = pkg['name']
        aur_pkg = aur_cache.get(name)
        in_aur = aur_pkg is not None

        all_deps = set()
        blocked_deps = []
        if aur_pkg:
            all_deps = get_all_deps(aur_pkg)
            # Check which deps are also blocked
            for dep in sorted(all_deps):
                # Direct match
                if dep in blocked_names:
                    blocked_deps.append(dep)
                # Check provides
                elif dep in provides_map and provides_map[dep] in blocked_names:
                    blocked_deps.append(provides_map[dep])

        tree.append({
            'name': name,
            'number': pkg['number'],
            'reason': pkg['reason'],
            'in_aur_cache': in_aur,
            'all_deps': sorted(all_deps),
            'blocked_deps': sorted(set(blocked_deps)),
            'blocked_dep_count': len(set(blocked_deps)),
            'total_dep_count': len(all_deps),
        })

    # Compute reverse deps
    reverse_deps = {p['name']: [] for p in tree}
    for pkg in tree:
        for bd in pkg['blocked_deps']:
            if bd in reverse_deps:
                reverse_deps[bd].append(pkg['name'])

    for pkg in tree:
        pkg['reverse_deps'] = sorted(reverse_deps.get(pkg['name'], []))
        pkg['reverse_dep_count'] = len(pkg['reverse_deps'])

    return tree

def priority_sort(tree):
    """Sort by: blocked_dep_count ASC, reverse_dep_count DESC, total_dep_count ASC, name ASC."""
    return sorted(tree, key=lambda p: (
        p['blocked_dep_count'],
        -p['reverse_dep_count'],
        p['total_dep_count'],
        p['name'],
    ))

def generate_tree_json(tree, timestamp):
    """Generate blocked-dependency-tree.json."""
    sorted_tree = priority_sort(tree)
    total_blocked = len(tree)
    in_aur_count = sum(1 for p in tree if p['in_aur_cache'])
    zero_blocked = sum(1 for p in tree if p['blocked_dep_count'] == 0)

    queue = []
    for rank, pkg in enumerate(sorted_tree, 1):
        aur_version = "N/A"
        aur_description = "N/A"
        # We don't have aur_cache in scope here, but we can add it
        queue.append({
            'rank': rank,
            'name': pkg['name'],
            'number': pkg['number'],
            'reason': pkg['reason'],
            'in_aur_cache': pkg['in_aur_cache'],
            'blocked_dep_count': pkg['blocked_dep_count'],
            'reverse_dep_count': pkg['reverse_dep_count'],
            'total_dep_count': pkg['total_dep_count'],
            'blocked_deps': pkg['blocked_deps'],
            'reverse_deps': pkg['reverse_deps'],
        })

    return {
        'timestamp': timestamp,
        'pass_id': PASS_ID,
        'total_blocked': total_blocked,
        'in_aur_cache': in_aur_count,
        'zero_blocked_deps': zero_blocked,
        'queue': queue,
    }

def generate_tree_md(tree_data):
    """Generate blocked-dependency-tree.md."""
    lines = []
    lines.append("# Blocked Dependency Tree\n")
    lines.append(f"**Generated:** {tree_data['timestamp']}  ")
    lines.append(f"**Pass ID:** {tree_data['pass_id']}  \n")

    lines.append("## Summary\n")
    lines.append("| Metric | Value |")
    lines.append("|---|---|")
    lines.append(f"| Total BLOCKED | {tree_data['total_blocked']} |")
    lines.append(f"| In AUR cache | {tree_data['in_aur_cache']} |")
    lines.append(f"| Zero blocked deps | {tree_data['zero_blocked_deps']} |\n")

    # Reason distribution
    reasons = {}
    for p in tree_data['queue']:
        # Extract top-level reason category
        reason = p['reason'].split(':')[0].split('—')[0].strip()
        if not reason:
            reason = "UNKNOWN"
        reasons[reason] = reasons.get(reason, 0) + 1

    lines.append("## Blocking Reason Distribution\n")
    lines.append("| Reason | Count |")
    lines.append("|---|---|")
    for reason, count in sorted(reasons.items(), key=lambda x: -x[1]):
        lines.append(f"| {reason} | {count} |")
    lines.append("")

    # Priority queue
    lines.append("## Priority Queue (Top 200)\n")
    lines.append("| Rank | Package | # | Blocked Deps | Reverse Deps | Total Deps | Reason |")
    lines.append("|---|---|---|---|---|---|---|")
    for p in tree_data['queue'][:200]:
        reason_short = p['reason'][:40]
        lines.append(f"| {p['rank']} | {p['name']} | {p['number']} | {p['blocked_dep_count']} | {p['reverse_dep_count']} | {p['total_dep_count']} | {reason_short} |")
    lines.append("")

    return "\n".join(lines)

def generate_selection_json(tree_data, timestamp):
    """Generate selection JSON for top 100."""
    selected = []
    for p in tree_data['queue'][:100]:
        selected.append({
            'rank': p['rank'],
            'name': p['name'],
            'number': p['number'],
            'reason': p['reason'],
            'in_aur_cache': p['in_aur_cache'],
            'blocked_dep_count': p['blocked_dep_count'],
            'reverse_dep_count': p['reverse_dep_count'],
            'total_dep_count': p['total_dep_count'],
            'blocked_deps': p['blocked_deps'],
            'reverse_deps': p['reverse_deps'],
        })
    return {
        'timestamp': timestamp,
        'run': PASS_ID,
        'selected': selected,
    }

def main():
    timestamp = datetime.now(timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ")

    print(f"[{PASS_ID}] Parsing BLOCKED packages from org file...")
    blocked = parse_blocked_packages(ORG_FILE)
    print(f"  Found {len(blocked)} BLOCKED packages")

    print(f"[{PASS_ID}] Loading AUR cache...")
    aur_cache = load_aur_cache(AUR_CACHE)
    print(f"  Loaded {len(aur_cache)} AUR packages")

    print(f"[{PASS_ID}] Building dependency tree...")
    tree = build_dependency_tree(blocked, aur_cache)

    print(f"[{PASS_ID}] Generating tree JSON...")
    tree_data = generate_tree_json(tree, timestamp)
    with open(TREE_JSON, 'w') as f:
        json.dump(tree_data, f, indent=2)
    print(f"  Wrote {TREE_JSON}")

    print(f"[{PASS_ID}] Generating tree MD...")
    md_content = generate_tree_md(tree_data)
    with open(TREE_MD, 'w') as f:
        f.write(md_content)
    print(f"  Wrote {TREE_MD}")

    print(f"[{PASS_ID}] Generating selection JSON (top 100)...")
    selection = generate_selection_json(tree_data, timestamp)
    with open(SELECTION_JSON, 'w') as f:
        json.dump(selection, f, indent=2)
    print(f"  Wrote {SELECTION_JSON}")

    # Print top 20
    print(f"\n{'='*80}")
    print(f"Top 20 Priority Queue:")
    print(f"{'='*80}")
    for p in tree_data['queue'][:20]:
        print(f"  {p['rank']:3d}. {p['name']:<40s} blocked_deps={p['blocked_dep_count']} rev_deps={p['reverse_dep_count']} total={p['total_dep_count']} reason={p['reason'][:50]}")

    print(f"\nSelected 100 packages for resolution.")
    print(f"Total BLOCKED: {tree_data['total_blocked']}")

    # Output the 100 package names for easy consumption
    print("\n--- SELECTED 100 PACKAGE NAMES ---")
    for p in tree_data['queue'][:100]:
        print(p['name'])

if __name__ == '__main__':
    main()
