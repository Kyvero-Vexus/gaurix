#!/usr/bin/env python3
"""Build dependency tree for all BLOCKED packages and select top 100.

Outputs:
  - reports/blocked-dependency-tree.json
  - reports/blocked-dependency-tree.md
  - reports/cron-c79f127f-r22-w03-selection.json (top 100)
"""
import json
import re
import sys
from collections import defaultdict
from datetime import datetime, timezone
from pathlib import Path

REPO_ROOT = Path(__file__).resolve().parent.parent
TODO_FILE = REPO_ROOT / "todo_general_packages.org"
CACHE_FILE = REPO_ROOT / "data/aur-cache/packages-meta-ext-v1.json"
PKGBUILD_DIR = REPO_ROOT / "data/aur-cache/pkgbuilds"

HEADING_RE = re.compile(r"^\*\*\s+BLOCKED\s+\d+\.\s+(.+?)\s*$")
DEP_NAME_RE = re.compile(r"^([a-zA-Z0-9@._+\-]+)")

RUN_ID = "cron-c79f127f-r22-w03"


def strip_version(dep: str) -> str:
    m = DEP_NAME_RE.match(dep)
    return m.group(1) if m else dep


def parse_blocked(path: Path) -> list[str]:
    pkgs = []
    for line in path.read_text(encoding="utf-8").splitlines():
        m = HEADING_RE.match(line)
        if m:
            pkgs.append(m.group(1).strip())
    return pkgs


def load_cache(path: Path) -> dict:
    data = json.loads(path.read_bytes())
    return {e["Name"].lower(): e for e in data}


def get_direct_deps(name: str, cache: dict) -> list[str]:
    key = name.lower()
    srcinfo_path = PKGBUILD_DIR / name / ".SRCINFO"

    if srcinfo_path.exists():
        deps = []
        for line in srcinfo_path.read_text(encoding="utf-8").splitlines():
            line = line.strip()
            if "=" not in line:
                continue
            k, _, v = line.partition("=")
            k = k.strip().lower()
            if k in ("depends", "makedepends", "checkdepends"):
                deps.append(v.strip())
        return [strip_version(d) for d in deps if d]

    if key in cache:
        rec = cache[key]
        deps = (rec.get("Depends") or []) + (rec.get("MakeDepends") or []) + (rec.get("CheckDepends") or [])
        return [strip_version(d) for d in deps if d]

    return []


def build_tree(blocked: list[str], cache: dict):
    blocked_set = {p.lower() for p in blocked}
    blocked_orig = {p.lower(): p for p in blocked}

    # Get deps for each blocked package
    pkg_deps = {}
    for pkg in blocked:
        pkg_deps[pkg.lower()] = get_direct_deps(pkg, cache)

    # For each blocked package, compute:
    # - blocked_dep_count: how many of its deps are also BLOCKED
    # - reverse_dep_count: how many BLOCKED packages depend on it
    # - total_dep_count: total number of deps

    blocked_dep_counts = {}
    total_dep_counts = {}
    reverse_deps = defaultdict(set)

    for pkg_lower, deps in pkg_deps.items():
        dep_names_lower = [d.lower() for d in deps]
        blocked_dep_count = sum(1 for d in dep_names_lower if d in blocked_set)
        blocked_dep_counts[pkg_lower] = blocked_dep_count
        total_dep_counts[pkg_lower] = len(deps)

        # Track reverse deps (only among blocked packages)
        for d in dep_names_lower:
            if d in blocked_set:
                reverse_deps[d].add(pkg_lower)

    # Build queue
    queue = []
    for pkg_lower in blocked_set:
        orig_name = blocked_orig.get(pkg_lower, pkg_lower)
        queue.append({
            "name": orig_name,
            "blocked_dep_count": blocked_dep_counts.get(pkg_lower, 0),
            "reverse_dep_count": len(reverse_deps.get(pkg_lower, set())),
            "total_dep_count": total_dep_counts.get(pkg_lower, 0),
        })

    # Sort by priority
    queue.sort(key=lambda x: (
        x["blocked_dep_count"],
        -x["reverse_dep_count"],
        x["total_dep_count"],
        x["name"].lower(),
    ))

    # Assign ranks
    for i, entry in enumerate(queue, 1):
        entry["rank"] = i

    return queue


def main():
    print("[info] Loading AUR cache...", file=sys.stderr)
    cache = load_cache(CACHE_FILE)
    print(f"[info] Loaded {len(cache)} AUR packages", file=sys.stderr)

    print("[info] Parsing BLOCKED packages...", file=sys.stderr)
    blocked = parse_blocked(TODO_FILE)
    print(f"[info] Found {len(blocked)} BLOCKED packages", file=sys.stderr)

    print("[info] Building dependency tree...", file=sys.stderr)
    queue = build_tree(blocked, cache)

    timestamp = datetime.now(timezone.utc).isoformat()

    # Write JSON
    tree_json = {
        "timestamp": timestamp,
        "run_id": RUN_ID,
        "total_blocked": len(blocked),
        "queue": queue,
    }
    json_path = REPO_ROOT / "reports" / "blocked-dependency-tree.json"
    json_path.write_text(json.dumps(tree_json, indent=2), encoding="utf-8")
    print(f"[info] Wrote {json_path}", file=sys.stderr)

    # Write MD
    md_lines = [
        "# Blocked Dependency Tree",
        "",
        f"**Timestamp:** {timestamp}",
        f"**Run:** {RUN_ID}",
        f"**Total BLOCKED:** {len(blocked)}",
        "",
        "## Top 20 Priority Queue",
        "",
        "| Rank | Package | Blocked Deps | Reverse Deps | Total Deps |",
        "|------|---------|-------------|-------------|------------|",
    ]
    for entry in queue[:20]:
        md_lines.append(
            f"| {entry['rank']} | {entry['name']} | {entry['blocked_dep_count']} "
            f"| {entry['reverse_dep_count']} | {entry['total_dep_count']} |"
        )

    # Selected 100
    selected = queue[:100]
    md_lines.extend(["", "## Selected 100", ""])
    for i, entry in enumerate(selected, 1):
        md_lines.append(
            f"{i}. {entry['name']} (blocked_deps={entry['blocked_dep_count']}, "
            f"rev_deps={entry['reverse_dep_count']}, total={entry['total_dep_count']})"
        )

    md_path = REPO_ROOT / "reports" / "blocked-dependency-tree.md"
    md_path.write_text("\n".join(md_lines) + "\n", encoding="utf-8")
    print(f"[info] Wrote {md_path}", file=sys.stderr)

    # Write selection JSON
    sel_json = {
        "timestamp": timestamp,
        "run_id": RUN_ID,
        "selected": [
            {
                "name": e["name"],
                "blocked_dep_count": e["blocked_dep_count"],
                "reverse_dep_count": e["reverse_dep_count"],
                "total_dep_count": e["total_dep_count"],
            }
            for e in selected
        ],
    }

    # Print selected package names for downstream use
    print("SELECTED_PACKAGES_START", file=sys.stdout)
    for e in selected:
        print(e["name"], file=sys.stdout)
    print("SELECTED_PACKAGES_END", file=sys.stdout)

    # Print top 20 summary
    print("\n=== TOP 20 PRIORITY ===", file=sys.stderr)
    for e in queue[:20]:
        print(f"  {e['rank']:>3}. {e['name']:<40} blocked_deps={e['blocked_dep_count']} rev_deps={e['reverse_dep_count']} total={e['total_dep_count']}", file=sys.stderr)

    return 0


if __name__ == "__main__":
    raise SystemExit(main())
