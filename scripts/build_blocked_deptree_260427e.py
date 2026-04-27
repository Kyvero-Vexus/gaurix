#!/usr/bin/env python3
"""
Build dependency tree for BLOCKED packages in todo_general_packages.org.
Uses AUR cache (packages-meta-ext-v1.json) for dependency data.
Pass: deptree-resolver-260427e
"""

import json
import re
import sys
from datetime import datetime, timezone
from collections import defaultdict

PASS_ID = "deptree-resolver-260427e"
TODO_FILE = "todo_general_packages.org"
AUR_CACHE = "data/aur-cache/packages-meta-ext-v1.json"
TREE_JSON = "reports/blocked-dependency-tree.json"
TREE_MD = "reports/blocked-dependency-tree.md"
SELECTION_JSON = f"reports/{PASS_ID}-selection.json"


def extract_blocked_packages(todo_file):
    """Extract all BLOCKED package names and their full body from org file."""
    blocked = {}
    with open(todo_file, 'r', encoding='utf-8') as f:
        lines = f.readlines()

    i = 0
    while i < len(lines):
        line = lines[i]
        # Format: ** BLOCKED N. name ...
        m1 = re.match(r'^\*\* BLOCKED\s+(\d+)\.\s+(\S+)', line)
        if m1:
            num = int(m1.group(1))
            name = m1.group(2).rstrip(':').split(':')[0]
            # Collect full body for reason
            body_lines = [line.rstrip()]
            j = i + 1
            while j < len(lines) and not lines[j].startswith("** "):
                body_lines.append(lines[j].rstrip())
                j += 1
            reason = " ".join(body_lines[:6])  # first few lines as reason
            # Extract fail_reason tag if present
            fail_reason = ""
            for bl in body_lines:
                fr_m = re.search(r'\[FAILED:\s*(.*?)\]', bl)
                if fr_m:
                    fail_reason = fr_m.group(1).strip()
                    break
                # Check for specific reason codes
                for code in ['PROPRIETARY_BINARY', 'PLATFORM_UNSUPPORTED', 'NON_DISTRIBUTABLE',
                             'MINGW_CROSS_COMPILATION', 'SELINUX_SPECIFIC', 'ARCH_SPECIFIC',
                             'KERNEL_MODULE', 'WINDOWS_ONLY', 'MACOS_ONLY']:
                    if code in bl:
                        fail_reason = code
                        break
                if fail_reason:
                    break
            blocked[name] = {
                "number": num,
                "reason": reason,
                "fail_reason": fail_reason,
            }
            i = j
            continue
        i += 1

    return blocked


def load_aur_cache(cache_file):
    """Load AUR metadata cache into a name->metadata dict."""
    with open(cache_file, 'r') as f:
        data = json.load(f)
    return {pkg['Name']: pkg for pkg in data}


def strip_version_constraint(dep_str):
    """Strip version constraint from dependency string."""
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


def build_dependency_tree(blocked_pkgs, aur_cache):
    """Build dependency tree for blocked packages."""
    blocked_names = set(blocked_pkgs.keys())

    # Build provides mapping
    provides_map = {}
    for pkg_name, pkg_data in aur_cache.items():
        provides = pkg_data.get('Provides')
        if provides:
            for p in provides:
                pname = strip_version_constraint(p)
                provides_map[pname] = pkg_name

    tree = []
    for name, info in blocked_pkgs.items():
        aur_pkg = aur_cache.get(name)
        in_aur = aur_pkg is not None

        all_deps = set()
        blocked_deps = []
        if aur_pkg:
            all_deps = get_all_deps(aur_pkg)
            for dep in sorted(all_deps):
                if dep in blocked_names:
                    blocked_deps.append(dep)
                elif dep in provides_map and provides_map[dep] in blocked_names:
                    blocked_deps.append(provides_map[dep])

        tree.append({
            'name': name,
            'number': info['number'],
            'reason': info['reason'],
            'fail_reason': info['fail_reason'],
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
        queue.append({
            'rank': rank,
            'name': pkg['name'],
            'number': pkg['number'],
            'fail_reason': pkg['fail_reason'],
            'in_aur_cache': pkg['in_aur_cache'],
            'blocked_dep_count': pkg['blocked_dep_count'],
            'reverse_dep_count': pkg['reverse_dep_count'],
            'total_dep_count': pkg['total_dep_count'],
            'blocked_deps': pkg['blocked_deps'],
            'reverse_deps': pkg['reverse_deps'],
            'reason': pkg['reason'],
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
    lines.append(f"# Blocked Dependency Tree — {tree_data['pass_id']}")
    lines.append("")
    lines.append(f"Generated: {tree_data['timestamp']}")
    lines.append("")
    lines.append("## Summary")
    lines.append(f"- Total BLOCKED: {tree_data['total_blocked']}")
    lines.append(f"- In AUR cache: {tree_data['in_aur_cache']}")
    lines.append(f"- Zero blocked deps: {tree_data['zero_blocked_deps']}")
    lines.append("")
    lines.append(f"## Priority Queue (all {tree_data['total_blocked']} packages)")
    lines.append("")
    lines.append("| Rank | Package | # | BDep | RDep | TDep | In AUR | Fail Reason |")
    lines.append("|------|---------|---|------|------|------|--------|-------------|")
    for p in tree_data['queue']:
        aur = "Y" if p['in_aur_cache'] else "N"
        fr = p['fail_reason'] if p['fail_reason'] else "-"
        lines.append(f"| {p['rank']} | {p['name']} | {p['number']} | {p['blocked_dep_count']} | {p['reverse_dep_count']} | {p['total_dep_count']} | {aur} | {fr} |")
    lines.append("")

    return "\n".join(lines)


def generate_selection_json(tree_data, timestamp):
    """Generate selection JSON for top 100."""
    selected = []
    for p in tree_data['queue'][:100]:
        selected.append({
            'name': p['name'],
            'number': p['number'],
            'fail_reason': p['fail_reason'],
            'in_aur_cache': p['in_aur_cache'],
            'blocked_dep_count': p['blocked_dep_count'],
            'reverse_dep_count': p['reverse_dep_count'],
            'total_dep_count': p['total_dep_count'],
            'blocked_deps': p['blocked_deps'],
            'reverse_deps': p['reverse_deps'],
            'reason': p['reason'],
        })
    return {
        'pass_id': PASS_ID,
        'timestamp': timestamp,
        'selected': selected,
    }


def main():
    timestamp = datetime.now(timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ")

    print(f"[{PASS_ID}] Parsing BLOCKED packages from org file...")
    blocked = extract_blocked_packages(TODO_FILE)
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
        print(f"  {p['rank']:3d}. {p['name']:<45s} bdep={p['blocked_dep_count']} rdep={p['reverse_dep_count']} tdep={p['total_dep_count']} fail={p['fail_reason'] or '-'}")

    print(f"\nSelected {min(100, len(tree_data['queue']))} packages for resolution.")
    print(f"Total BLOCKED: {tree_data['total_blocked']}")

    # Output the 100 package names
    print("\n--- SELECTED PACKAGE NAMES ---")
    for p in tree_data['queue'][:100]:
        print(p['name'])


if __name__ == '__main__':
    main()
