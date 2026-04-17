#!/usr/bin/env python3
"""Build dependency tree for BLOCKED packages in todo_general_packages.org.

Pass ID: deptree-resolver-260417ak

Reads BLOCKED entries from todo, cross-references with AUR cache,
computes dependency metrics, and outputs priority-sorted queue.
"""

import json
import re
import sys
from datetime import datetime, timezone
from pathlib import Path

PASS_ID = "deptree-resolver-260417ak"
ROOT = Path(__file__).resolve().parent.parent
TODO_FILE = ROOT / "todo_general_packages.org"
AUR_CACHE = ROOT / "data" / "aur-cache" / "packages-meta-ext-v1.json"
OUT_JSON = ROOT / "reports" / "blocked-dependency-tree.json"
OUT_MD = ROOT / "reports" / "blocked-dependency-tree.md"
OUT_SELECTION = ROOT / "reports" / f"{PASS_ID}-selection.json"


def extract_blocked_packages(todo_path):
    """Extract BLOCKED package names and numbers from org file."""
    blocked = []
    pattern = re.compile(r'^\*\* BLOCKED (\d+)\.\s+(\S+)')
    with open(todo_path, 'r') as f:
        for line in f:
            m = pattern.match(line)
            if m:
                blocked.append({
                    'number': int(m.group(1)),
                    'name': m.group(2),
                })
    return blocked


def load_aur_cache(cache_path):
    """Load AUR package metadata, indexed by package name."""
    print(f"Loading AUR cache from {cache_path}...")
    with open(cache_path, 'r') as f:
        packages = json.load(f)
    index = {}
    for pkg in packages:
        index[pkg.get('Name', '')] = pkg
    print(f"Loaded {len(index)} AUR packages")
    return index


def compute_dependency_tree(blocked_pkgs, aur_index):
    """Compute dependency metrics for each blocked package."""
    blocked_names = {p['name'] for p in blocked_pkgs}

    results = []
    for pkg in blocked_pkgs:
        name = pkg['name']
        number = pkg['number']

        aur_pkg = aur_index.get(name, {})
        depends = aur_pkg.get('Depends', []) or []
        makedepends = aur_pkg.get('MakeDepends', []) or []
        optdepends = aur_pkg.get('OptDepends', []) or []

        # Strip version constraints from dep names
        def strip_ver(dep):
            return re.split(r'[>=<]', dep)[0].strip()

        all_deps = set()
        for d in depends + makedepends:
            all_deps.add(strip_ver(d))

        # Count how many deps are also blocked
        blocked_deps = sorted(all_deps & blocked_names)
        blocked_dep_count = len(blocked_deps)
        total_dep_count = len(all_deps)

        results.append({
            'name': name,
            'number': number,
            'blocked_dep_count': blocked_dep_count,
            'reverse_dep_count': 0,  # computed below
            'total_dep_count': total_dep_count,
            'blocked_deps': blocked_deps,
            'reverse_deps': [],
            'all_deps': sorted(all_deps),
        })

    # Compute reverse deps (how many blocked packages depend on each)
    name_to_idx = {r['name']: i for i, r in enumerate(results)}
    for r in results:
        for dep_name in r['blocked_deps']:
            if dep_name in name_to_idx:
                idx = name_to_idx[dep_name]
                results[idx]['reverse_deps'].append(r['name'])
                results[idx]['reverse_dep_count'] += 1

    # Sort by priority: blocked_dep_count asc, reverse_dep_count desc,
    # total_dep_count asc, name asc
    results.sort(key=lambda r: (
        r['blocked_dep_count'],
        -r['reverse_dep_count'],
        r['total_dep_count'],
        r['name'],
    ))

    # Assign ranks
    for i, r in enumerate(results):
        r['rank'] = i + 1

    return results


def write_json_report(results, pass_id, out_path):
    """Write JSON dependency tree report."""
    # Remove internal 'all_deps' field from output
    queue = []
    for r in results:
        entry = dict(r)
        entry.pop('all_deps', None)
        queue.append(entry)

    report = {
        'timestamp': datetime.now(timezone.utc).isoformat(),
        'pass_id': pass_id,
        'total_blocked': len(results),
        'queue': queue,
    }
    with open(out_path, 'w') as f:
        json.dump(report, f, indent=2)
    print(f"Wrote {out_path}")


def write_md_report(results, pass_id, out_path):
    """Write Markdown dependency tree report."""
    ts = datetime.now(timezone.utc).strftime('%Y-%m-%dT%H:%M:%SZ')
    lines = [
        f"# Blocked Dependency Tree",
        f"",
        f"**Pass:** {pass_id}  ",
        f"**Timestamp:** {ts}  ",
        f"**Total BLOCKED:** {len(results)}  ",
        f"",
        f"| Rank | Package | # | Blocked Deps | Reverse Deps | Total Deps |",
        f"|------|---------|---|-------------|-------------|------------|",
    ]
    for r in results:
        lines.append(
            f"| {r['rank']} | {r['name']} | {r['number']} "
            f"| {r['blocked_dep_count']} | {r['reverse_dep_count']} "
            f"| {r['total_dep_count']} |"
        )
    lines.append("")
    with open(out_path, 'w') as f:
        f.write('\n'.join(lines))
    print(f"Wrote {out_path}")


def write_selection(results, pass_id, out_path, limit=100):
    """Write selection JSON for resolver."""
    selected = results[:limit]
    sel = {
        'pass_id': pass_id,
        'total_available': len(results),
        'selected': len(selected),
        'packages': [
            {'rank': r['rank'], 'name': r['name'], 'number': r['number'],
             'blocked_dep_count': r['blocked_dep_count'],
             'reverse_dep_count': r['reverse_dep_count'],
             'total_dep_count': r['total_dep_count']}
            for r in selected
        ],
    }
    with open(out_path, 'w') as f:
        json.dump(sel, f, indent=2)
    print(f"Wrote {out_path}")


def main():
    blocked = extract_blocked_packages(TODO_FILE)
    print(f"Found {len(blocked)} BLOCKED packages in todo")

    aur_index = load_aur_cache(AUR_CACHE)

    results = compute_dependency_tree(blocked, aur_index)

    write_json_report(results, PASS_ID, OUT_JSON)
    write_md_report(results, PASS_ID, OUT_MD)
    write_selection(results, PASS_ID, OUT_SELECTION)

    # Print top 20 for console
    print(f"\nTop 20 priority queue:")
    print(f"{'Rank':>4} {'Package':<40} {'#':>6} {'BDep':>4} {'RDep':>4} {'TDep':>4}")
    print("-" * 70)
    for r in results[:20]:
        print(f"{r['rank']:>4} {r['name']:<40} {r['number']:>6} "
              f"{r['blocked_dep_count']:>4} {r['reverse_dep_count']:>4} "
              f"{r['total_dep_count']:>4}")


if __name__ == '__main__':
    main()
