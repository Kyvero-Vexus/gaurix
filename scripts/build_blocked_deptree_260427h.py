#!/usr/bin/env python3
"""
Build dependency tree for BLOCKED packages in todo_general_packages.org.
Uses AUR cache (packages-meta-ext-v1.json) for dependency data.
Pass: deptree-resolver-260427h
"""

import json
import re
import sys
from datetime import datetime, timezone
from collections import defaultdict

PASS_ID = "deptree-resolver-260427h"
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
        m1 = re.match(r'^\*\* BLOCKED\s+(\d+)\.\s+(\S+)', line)
        if m1:
            num = int(m1.group(1))
            name = m1.group(2).rstrip(':').split(':')[0]
            name = name.split('[')[0].rstrip()
            body_lines = [line.rstrip()]
            j = i + 1
            while j < len(lines) and not lines[j].startswith("** "):
                body_lines.append(lines[j].rstrip())
                j += 1
            reason = " ".join(body_lines[:6])
            fail_reason = ""
            for bl in body_lines:
                fr_m = re.search(r'\[FAILED:\s*(.*?)\]', bl)
                if fr_m:
                    fail_reason = fr_m.group(1).strip()
                    break
                for code in ['PROPRIETARY_BINARY', 'PLATFORM_UNSUPPORTED', 'NON_DISTRIBUTABLE',
                             'MINGW_CROSS_COMPILATION', 'SELINUX_SPECIFIC', 'ARCH_SPECIFIC',
                             'KERNEL_MODULE', 'DKMS_KERNEL_MODULE', 'WINDOWS_ONLY', 'MACOS_ONLY',
                             'MULTILIB_UNSUPPORTED', 'DISTRO_SPECIFIC', 'ABANDONED_UPSTREAM',
                             'LEGACY_PYTHON2', 'HARDWARE_SPECIFIC', 'COMPLEX_DEPS',
                             'PROPRIETARY_PLATFORM']:
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
    """Build dep tree for blocked packages using AUR cache."""
    blocked_names = set(blocked_pkgs.keys())

    # For each blocked package, compute deps
    pkg_deps = {}
    for name in blocked_names:
        if name in aur_cache:
            pkg_deps[name] = get_all_deps(aur_cache[name])
        else:
            pkg_deps[name] = set()

    # Compute blocked_dep_count and reverse_dep_count
    reverse_deps = defaultdict(set)
    blocked_dep_counts = {}

    for name in blocked_names:
        deps = pkg_deps.get(name, set())
        blocked_deps = deps & blocked_names
        blocked_dep_counts[name] = blocked_deps
        for dep in blocked_deps:
            reverse_deps[dep].add(name)

    # Build queue entries
    queue = []
    for name in blocked_names:
        all_deps = pkg_deps.get(name, set())
        blocked_deps = blocked_dep_counts.get(name, set())
        rev_deps = reverse_deps.get(name, set())
        in_aur = name in aur_cache

        queue.append({
            "name": name,
            "number": blocked_pkgs[name]["number"],
            "fail_reason": blocked_pkgs[name].get("fail_reason", ""),
            "in_aur_cache": in_aur,
            "blocked_dep_count": len(blocked_deps),
            "reverse_dep_count": len(rev_deps),
            "total_dep_count": len(all_deps),
            "blocked_deps": sorted(blocked_deps),
            "reverse_deps": sorted(rev_deps),
            "reason": blocked_pkgs[name]["reason"],
        })

    # Sort: blocked_dep_count ASC, reverse_dep_count DESC, total_dep_count ASC, name ASC
    queue.sort(key=lambda x: (
        x["blocked_dep_count"],
        -x["reverse_dep_count"],
        x["total_dep_count"],
        x["name"]
    ))

    # Assign ranks
    for i, entry in enumerate(queue):
        entry["rank"] = i + 1

    return queue


def write_tree_json(queue, timestamp, pass_id):
    """Write tree JSON report."""
    in_aur = sum(1 for q in queue if q["in_aur_cache"])
    zero_blocked = sum(1 for q in queue if q["blocked_dep_count"] == 0)

    report = {
        "timestamp": timestamp,
        "pass_id": pass_id,
        "total_blocked": len(queue),
        "in_aur_cache": in_aur,
        "zero_blocked_deps": zero_blocked,
        "queue": queue,
    }

    with open(TREE_JSON, 'w') as f:
        json.dump(report, f, indent=2)

    return report


def write_tree_md(queue, timestamp, pass_id):
    """Write tree markdown report."""
    in_aur = sum(1 for q in queue if q["in_aur_cache"])
    zero_blocked = sum(1 for q in queue if q["blocked_dep_count"] == 0)

    lines = [
        f"# Blocked Dependency Tree — {pass_id}",
        "",
        f"Generated: {timestamp}",
        "",
        "## Summary",
        f"- Total BLOCKED: {len(queue)}",
        f"- In AUR cache: {in_aur}",
        f"- Zero blocked deps: {zero_blocked}",
        "",
        f"## Priority Queue (all {len(queue)} packages)",
        "",
        "| Rank | Package | # | BDep | RDep | TDep | In AUR | Fail Reason |",
        "|------|---------|---|------|------|------|--------|-------------|",
    ]

    for q in queue:
        aur_flag = "Y" if q["in_aur_cache"] else "N"
        fr = q["fail_reason"] if q["fail_reason"] else "-"
        lines.append(
            f"| {q['rank']} | {q['name']} | {q['number']} | "
            f"{q['blocked_dep_count']} | {q['reverse_dep_count']} | "
            f"{q['total_dep_count']} | {aur_flag} | {fr} |"
        )

    lines.append("")

    with open(TREE_MD, 'w') as f:
        f.write('\n'.join(lines))


def write_selection_json(queue, pass_id, count=100):
    """Write selection JSON with top N packages."""
    selected = queue[:count]

    report = {
        "pass_id": pass_id,
        "timestamp": datetime.now(timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ"),
        "selected_count": len(selected),
        "packages": [q["name"] for q in selected],
        "details": selected,
    }

    with open(SELECTION_JSON, 'w') as f:
        json.dump(report, f, indent=2)

    return selected


def main():
    timestamp = datetime.now(timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ")

    print(f"[{PASS_ID}] Building blocked dependency tree...")

    print("  Loading BLOCKED packages from org file...")
    blocked = extract_blocked_packages(TODO_FILE)
    print(f"  Found {len(blocked)} BLOCKED packages")

    print("  Loading AUR cache...")
    aur_cache = load_aur_cache(AUR_CACHE)
    print(f"  Loaded {len(aur_cache)} AUR packages")

    print("  Building dependency tree...")
    queue = build_dependency_tree(blocked, aur_cache)

    print("  Writing tree JSON...")
    write_tree_json(queue, timestamp, PASS_ID)

    print("  Writing tree MD...")
    write_tree_md(queue, timestamp, PASS_ID)

    print("  Writing selection JSON...")
    selected = write_selection_json(queue, PASS_ID)

    print(f"\n[{PASS_ID}] Done.")
    print(f"  Total BLOCKED: {len(queue)}")
    print(f"  Selected top 100:")
    for s in selected[:20]:
        print(f"    {s['rank']:3d}. {s['name']} (BDep={s['blocked_dep_count']}, RDep={s['reverse_dep_count']}, TDep={s['total_dep_count']}, fail={s['fail_reason'] or '-'})")
    if len(selected) > 20:
        print(f"    ... and {len(selected) - 20} more")


if __name__ == '__main__':
    main()
