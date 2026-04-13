#!/usr/bin/env python3
"""
Dependency-tree-driven resolver for BLOCKED packages.
Run ID: deptree-resolver-260413g

Steps:
1. Parse todo_general_packages.org for all BLOCKED packages
2. Load AUR metadata for dependency info
3. Build dependency tree with blocked_dep_count, reverse_dep_count, total_dep_count
4. Priority sort and select top 100
5. Generate reports/blocked-dependency-tree.json and .md
6. Generate Scheme module with recipes/blocked notes
7. Output selection JSON
"""

import json
import os
import re
import sys
import tempfile
import shutil
from datetime import datetime, timezone
from collections import defaultdict

BASE = "/home/slime/projects/gaurix"
TODO_FILE = os.path.join(BASE, "todo_general_packages.org")
AUR_CACHE = os.path.join(BASE, "data/aur-cache/packages-meta-ext-v1.json")
TREE_JSON = os.path.join(BASE, "reports/blocked-dependency-tree.json")
TREE_MD = os.path.join(BASE, "reports/blocked-dependency-tree.md")
SELECTION_JSON = os.path.join(BASE, "reports/deptree-resolver-260413g-selection.json")
SUMMARY_JSON = os.path.join(BASE, "reports/deptree-resolver-260413g-summary.json")
SCM_FILE = os.path.join(BASE, "guix/gaurix/packages/deptree-resolver-260413g.scm")
BLOCKED_NOTES_FILE = os.path.join(BASE, "guix/gaurix/packages/deptree-resolver-260413g-blocked-notes.scm")

RUN_ID = "deptree-resolver-260413g"
TIMESTAMP = datetime.now(timezone.utc).isoformat()
SELECT_COUNT = 100

# ── Step 1: Parse BLOCKED packages from todo_general_packages.org ──────

def parse_blocked_packages():
    """Extract all BLOCKED entries with their number and name."""
    blocked = {}
    header_re = re.compile(r'^\*\*\s+BLOCKED\s+(\d+)\.\s+(.+?)(?:\s+\[.*\])?\s*$')
    with open(TODO_FILE, 'r') as f:
        for line in f:
            m = header_re.match(line)
            if m:
                num = int(m.group(1))
                name = m.group(2).strip()
                blocked[name] = num
    return blocked

# ── Step 2: Load AUR metadata ─────────────────────────────────────────

def load_aur_metadata():
    """Load AUR package metadata, return dict keyed by package name."""
    print(f"Loading AUR metadata from {AUR_CACHE}...")
    with open(AUR_CACHE, 'r') as f:
        data = json.load(f)
    pkg_map = {}
    for pkg in data:
        name = pkg.get("Name", "")
        if name:
            pkg_map[name] = pkg
    print(f"  Loaded {len(pkg_map)} packages")
    return pkg_map

# ── Step 3: Build dependency tree ──────────────────────────────────────

def extract_deps(aur_pkg):
    """Extract all dependency names from an AUR package entry."""
    deps = set()
    for field in ("Depends", "MakeDepends", "CheckDepends", "OptDepends"):
        dep_list = aur_pkg.get(field, None)
        if dep_list:
            for d in dep_list:
                # Strip version constraints: "foo>=1.0" -> "foo"
                dep_name = re.split(r'[><=:]', d)[0].strip()
                if dep_name:
                    deps.add(dep_name)
    return deps

def build_dependency_tree(blocked, aur_meta):
    """Build dependency tree for blocked packages."""
    blocked_set = set(blocked.keys())

    # For each blocked package, compute:
    # - blocked_dep_count: how many of its direct deps are also BLOCKED
    # - reverse_dep_count: how many blocked packages depend on it
    # - total_dep_count: total number of deps (regardless of blocked status)

    pkg_deps = {}  # pkg -> set of all dep names
    reverse_deps = defaultdict(set)  # pkg -> set of blocked pkgs that depend on it

    for name in blocked_set:
        aur = aur_meta.get(name)
        if aur:
            deps = extract_deps(aur)
            pkg_deps[name] = deps
            # Count reverse deps (only among blocked packages)
            for d in deps:
                if d in blocked_set:
                    reverse_deps[d].add(name)
        else:
            pkg_deps[name] = set()

    # Build queue entries
    queue = []
    for name in blocked_set:
        deps = pkg_deps.get(name, set())
        blocked_deps = [d for d in deps if d in blocked_set]
        rev_deps = list(reverse_deps.get(name, set()))

        queue.append({
            "name": name,
            "number": blocked[name],
            "blocked_dep_count": len(blocked_deps),
            "reverse_dep_count": len(rev_deps),
            "total_dep_count": len(deps),
            "blocked_deps": sorted(blocked_deps),
            "reverse_deps": sorted(rev_deps),
        })

    # Priority sort:
    # 1. blocked_dep_count ASC (fewest blocked deps first)
    # 2. reverse_dep_count DESC (most reverse deps first)
    # 3. total_dep_count ASC (fewest total deps first)
    # 4. name ASC (alphabetical)
    queue.sort(key=lambda x: (
        x["blocked_dep_count"],
        -x["reverse_dep_count"],
        x["total_dep_count"],
        x["name"],
    ))

    # Assign ranks
    for i, entry in enumerate(queue):
        entry["rank"] = i + 1

    return queue

# ── Step 4: Generate reports ───────────────────────────────────────────

def write_tree_json(queue, total_blocked):
    """Write blocked-dependency-tree.json."""
    data = {
        "timestamp": TIMESTAMP,
        "run_id": RUN_ID,
        "total_blocked": total_blocked,
        "queue": queue,
    }
    with open(TREE_JSON, 'w') as f:
        json.dump(data, f, indent=2)
    print(f"  Wrote {TREE_JSON}")

def write_tree_md(queue, total_blocked):
    """Write blocked-dependency-tree.md."""
    lines = [
        "# Blocked Dependency Tree",
        "",
        f"- **Timestamp:** {TIMESTAMP}",
        f"- **Run ID:** {RUN_ID}",
        f"- **Total blocked:** {total_blocked}",
        f"- **Queue length:** {len(queue)}",
        "",
        "## Priority Queue (top 120)",
        "",
        "| Rank | Package | Blocked Deps | Reverse Deps | Total Deps |",
        "|------|---------|-------------|-------------|-----------|",
    ]
    for entry in queue[:120]:
        lines.append(
            f"| {entry['rank']} | {entry['name']} | "
            f"{entry['blocked_dep_count']} | {entry['reverse_dep_count']} | "
            f"{entry['total_dep_count']} |"
        )
    lines.append("")
    with open(TREE_MD, 'w') as f:
        f.write("\n".join(lines))
    print(f"  Wrote {TREE_MD}")

def write_selection_json(selected):
    """Write selection JSON."""
    data = {
        "timestamp": TIMESTAMP,
        "run_id": RUN_ID,
        "count": len(selected),
        "packages": selected,
    }
    with open(SELECTION_JSON, 'w') as f:
        json.dump(data, f, indent=2)
    print(f"  Wrote {SELECTION_JSON}")

# ── Main ───────────────────────────────────────────────────────────────

def main():
    print(f"=== {RUN_ID} ===")
    print(f"Timestamp: {TIMESTAMP}")
    print()

    # Step 1: Parse BLOCKED packages
    print("Step 1: Parsing BLOCKED packages...")
    blocked = parse_blocked_packages()
    print(f"  Found {len(blocked)} BLOCKED packages")

    # Step 2: Load AUR metadata
    print("Step 2: Loading AUR metadata...")
    aur_meta = load_aur_metadata()

    # Step 3: Build dependency tree
    print("Step 3: Building dependency tree...")
    queue = build_dependency_tree(blocked, aur_meta)
    print(f"  Built queue with {len(queue)} entries")

    # Step 4: Generate reports
    print("Step 4: Generating reports...")
    write_tree_json(queue, len(blocked))
    write_tree_md(queue, len(blocked))

    # Step 5: Select top 100
    selected = queue[:SELECT_COUNT]
    write_selection_json(selected)

    print()
    print(f"=== Top 20 priority queue ===")
    print(f"{'Rank':>4} {'Package':<50} {'BlkD':>4} {'RevD':>4} {'TotD':>4}")
    print("-" * 70)
    for e in selected[:20]:
        print(f"{e['rank']:>4} {e['name']:<50} {e['blocked_dep_count']:>4} {e['reverse_dep_count']:>4} {e['total_dep_count']:>4}")

    print()
    print(f"=== Selected {len(selected)} packages ===")
    for e in selected:
        print(f"  {e['rank']:>3}. {e['name']} (#{e['number']})")

    # Output JSON to stdout for downstream consumption
    print()
    print("JSON_OUTPUT_START")
    json.dump({
        "run_id": RUN_ID,
        "timestamp": TIMESTAMP,
        "total_blocked": len(blocked),
        "selected_count": len(selected),
        "selected": selected,
    }, sys.stdout, indent=2)
    print()
    print("JSON_OUTPUT_END")

if __name__ == "__main__":
    main()
