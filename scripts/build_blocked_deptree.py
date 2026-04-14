#!/usr/bin/env python3
"""Build dependency tree for BLOCKED packages using AUR cache metadata.

Outputs:
  - reports/blocked-dependency-tree.json
  - reports/blocked-dependency-tree.md
  - reports/blocked-priority-selected-100.json
  - reports/blocked-priority-selected-100.txt
"""

import json
import re
import sys
from datetime import datetime, timezone
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
ORG_FILE = ROOT / "todo_general_packages.org"
AUR_CACHE = ROOT / "data" / "aur-cache" / "packages-meta-ext-v1.json"
REPORT_DIR = ROOT / "reports"


def extract_blocked_packages(org_path):
    """Extract (number, name, reason) for all BLOCKED entries."""
    blocked = []
    with open(org_path, "r") as f:
        for line in f:
            m = re.match(r"^\*\* BLOCKED (\d+)\. (\S+)(.*)", line)
            if m:
                num = int(m.group(1))
                name = m.group(2)
                rest = m.group(3).strip()
                blocked.append({"number": num, "name": name, "reason": rest})
    return blocked


def load_aur_index(cache_path):
    """Load AUR cache and build name -> package dict."""
    print(f"Loading AUR cache ({cache_path.stat().st_size // 1024 // 1024} MB)...")
    with open(cache_path, "r") as f:
        data = json.load(f)
    index = {}
    for pkg in data:
        index[pkg["Name"]] = pkg
    print(f"  Loaded {len(index)} packages from AUR cache.")
    return index


def build_dependency_tree(blocked_list, aur_index):
    """For each blocked package, compute dependency metrics."""
    blocked_names = {p["name"] for p in blocked_list}

    # Build dependency graph
    # deps_of[pkg] = set of direct dependencies (from AUR Depends field)
    deps_of = {}
    for pkg in blocked_list:
        name = pkg["name"]
        aur_pkg = aur_index.get(name)
        if aur_pkg and "Depends" in aur_pkg and aur_pkg["Depends"]:
            # Strip version constraints from dep names
            raw_deps = aur_pkg["Depends"]
            clean_deps = set()
            for d in raw_deps:
                # Remove version constraints like >=1.0, =1.0, etc.
                dep_name = re.split(r"[><=]", d)[0].strip()
                clean_deps.add(dep_name)
            deps_of[name] = clean_deps
        else:
            deps_of[name] = set()

    # For each blocked package, compute:
    # blocked_dep_count: how many of its direct deps are also BLOCKED
    # reverse_dep_count: how many BLOCKED packages depend on it
    # total_dep_count: total direct dependency count

    reverse_deps = {p["name"]: set() for p in blocked_list}

    results = []
    for pkg in blocked_list:
        name = pkg["name"]
        all_deps = deps_of.get(name, set())
        blocked_deps = all_deps & blocked_names

        # Build reverse dependency map
        for dep in blocked_deps:
            if dep in reverse_deps:
                reverse_deps[dep].add(name)

        results.append({
            "number": pkg["number"],
            "name": name,
            "reason": pkg["reason"],
            "blocked_dep_count": len(blocked_deps),
            "blocked_deps": sorted(blocked_deps),
            "total_dep_count": len(all_deps),
            "all_deps": sorted(all_deps),
        })

    # Add reverse_dep_count
    for r in results:
        r["reverse_dep_count"] = len(reverse_deps.get(r["name"], set()))
        r["reverse_deps"] = sorted(reverse_deps.get(r["name"], set()))

    return results


def priority_sort(tree_data):
    """Sort by: blocked_dep_count ASC, reverse_dep_count DESC,
    total_dep_count ASC, name ASC."""
    return sorted(
        tree_data,
        key=lambda p: (
            p["blocked_dep_count"],
            -p["reverse_dep_count"],
            p["total_dep_count"],
            p["name"],
        ),
    )


def main():
    timestamp = datetime.now(timezone.utc).isoformat()

    # Step 1: Extract BLOCKED packages
    blocked = extract_blocked_packages(ORG_FILE)
    print(f"Found {len(blocked)} BLOCKED packages.")

    # Step 2: Load AUR cache
    aur_index = load_aur_index(AUR_CACHE)

    # Step 3: Build dependency tree
    tree = build_dependency_tree(blocked, aur_index)

    # Step 4: Priority sort
    sorted_tree = priority_sort(tree)

    # Step 5: Select top 100
    selected = sorted_tree[:100]

    # Step 6: Write reports
    REPORT_DIR.mkdir(exist_ok=True)

    # Full tree JSON
    tree_report = {
        "timestamp": timestamp,
        "total_blocked": len(blocked),
        "queue": [
            {
                "rank": i + 1,
                "number": p["number"],
                "name": p["name"],
                "blocked_dep_count": p["blocked_dep_count"],
                "reverse_dep_count": p["reverse_dep_count"],
                "total_dep_count": p["total_dep_count"],
                "blocked_deps": p["blocked_deps"],
                "reverse_deps": p["reverse_deps"],
            }
            for i, p in enumerate(sorted_tree)
        ],
    }
    with open(REPORT_DIR / "blocked-dependency-tree.json", "w") as f:
        json.dump(tree_report, f, indent=2)
    print(f"Wrote {REPORT_DIR / 'blocked-dependency-tree.json'}")

    # Full tree MD
    md_lines = [
        f"# Blocked Dependency Tree",
        f"",
        f"Generated: {timestamp}",
        f"Total BLOCKED: {len(blocked)}",
        f"",
        f"## Priority Queue (top 50)",
        f"",
        f"| Rank | # | Package | Blocked Deps | Reverse Deps | Total Deps |",
        f"|------|---|---------|-------------|-------------|-----------|",
    ]
    for i, p in enumerate(sorted_tree[:50]):
        md_lines.append(
            f"| {i+1} | {p['number']} | {p['name']} | "
            f"{p['blocked_dep_count']} | {p['reverse_dep_count']} | "
            f"{p['total_dep_count']} |"
        )
    md_lines.append("")
    md_lines.append("## Selected 100 for this run")
    md_lines.append("")
    md_lines.append("| Rank | # | Package | Blocked Deps | Reverse Deps | Total Deps |")
    md_lines.append("|------|---|---------|-------------|-------------|-----------|")
    for i, p in enumerate(selected):
        md_lines.append(
            f"| {i+1} | {p['number']} | {p['name']} | "
            f"{p['blocked_dep_count']} | {p['reverse_dep_count']} | "
            f"{p['total_dep_count']} |"
        )
    md_lines.append("")

    with open(REPORT_DIR / "blocked-dependency-tree.md", "w") as f:
        f.write("\n".join(md_lines) + "\n")
    print(f"Wrote {REPORT_DIR / 'blocked-dependency-tree.md'}")

    # Selected 100 JSON
    selected_report = {
        "timestamp": timestamp,
        "count": len(selected),
        "packages": [
            {
                "rank": i + 1,
                "number": p["number"],
                "name": p["name"],
                "blocked_dep_count": p["blocked_dep_count"],
                "reverse_dep_count": p["reverse_dep_count"],
                "total_dep_count": p["total_dep_count"],
                "reason": p["reason"],
            }
            for i, p in enumerate(selected)
        ],
    }
    with open(REPORT_DIR / "blocked-priority-selected-100.json", "w") as f:
        json.dump(selected_report, f, indent=2)
    print(f"Wrote {REPORT_DIR / 'blocked-priority-selected-100.json'}")

    # Selected 100 TXT
    with open(REPORT_DIR / "blocked-priority-selected-100.txt", "w") as f:
        for i, p in enumerate(selected):
            f.write(f"{i+1}. {p['name']} (#{p['number']}) "
                    f"blocked_deps={p['blocked_dep_count']} "
                    f"rev_deps={p['reverse_dep_count']} "
                    f"total_deps={p['total_dep_count']}\n")
    print(f"Wrote {REPORT_DIR / 'blocked-priority-selected-100.txt'}")

    # Print top 20 for summary
    print(f"\n=== TOP 20 PRIORITY QUEUE ===")
    print(f"{'Rank':>4} {'#':>6} {'Package':<40} {'BlkDep':>6} {'RevDep':>6} {'TotDep':>6}")
    for i, p in enumerate(sorted_tree[:20]):
        print(f"{i+1:>4} {p['number']:>6} {p['name']:<40} "
              f"{p['blocked_dep_count']:>6} {p['reverse_dep_count']:>6} "
              f"{p['total_dep_count']:>6}")

    # Print all 100 selected
    print(f"\n=== SELECTED 100 PACKAGES ===")
    for i, p in enumerate(selected):
        print(f"{i+1:>3}. {p['name']} (#{p['number']})")

    return selected


if __name__ == "__main__":
    selected = main()
