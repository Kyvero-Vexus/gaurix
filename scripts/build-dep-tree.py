#!/usr/bin/env python3
"""Build blocked-package dependency tree and select top-N by priority.

Algorithm:
  1. Parse all BLOCKED package names from todo_general_packages.org.
  2. Load AUR metadata cache for dependency info.
  3. For each blocked package, resolve its direct dependencies.
  4. Compute:
     - blocked_dep_count: how many direct deps are also BLOCKED
     - reverse_dep_count: how many BLOCKED packages depend on this one
     - total_dep_count: total direct deps (blocked or not)
  5. Sort by (blocked_dep_count ASC, reverse_dep_count DESC,
             total_dep_count ASC, name ASC).
  6. Select first N packages.
  7. Write reports/blocked-dependency-tree.json and .md.

Usage:
    python3 scripts/build-dep-tree.py [--select N] [--run-id RUN_ID]
"""

from __future__ import annotations

import argparse
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
REPORT_JSON = REPO_ROOT / "reports/blocked-dependency-tree.json"
REPORT_MD = REPO_ROOT / "reports/blocked-dependency-tree.md"
SELECTED_TXT = REPO_ROOT / "reports/blocked-priority-selected-100.txt"

HEADING_RE = re.compile(r"^\*\*\s+BLOCKED\s+\d+\.\s+(.+?)\s*$")
DEP_NAME_RE = re.compile(r"^([a-zA-Z0-9@._+\-]+)")


def strip_version(dep: str) -> str:
    m = DEP_NAME_RE.match(dep)
    return m.group(1).lower() if m else dep.lower()


def parse_blocked(path: Path) -> list[str]:
    pkgs = []
    seen = set()
    for line in path.read_text(encoding="utf-8").splitlines():
        m = HEADING_RE.match(line)
        if m:
            name = m.group(1).strip()
            key = name.lower()
            if key not in seen:
                seen.add(key)
                pkgs.append(name)
    return pkgs


def load_cache(path: Path) -> dict[str, dict]:
    data = json.loads(path.read_bytes())
    return {e["Name"].lower(): e for e in data}


def parse_srcinfo(path: Path) -> list[str]:
    deps = []
    for line in path.read_text(encoding="utf-8").splitlines():
        line = line.strip()
        if "=" not in line:
            continue
        key, _, val = line.partition("=")
        key = key.strip().lower()
        if key in ("depends", "makedepends", "checkdepends"):
            deps.append(val.strip())
    return deps


def get_deps(name: str, cache: dict[str, dict]) -> list[str]:
    key = name.lower()
    srcinfo = PKGBUILD_DIR / name / ".SRCINFO"
    if srcinfo.exists():
        raw = parse_srcinfo(srcinfo)
    elif key in cache:
        rec = cache[key]
        raw = (rec.get("Depends") or []) + (rec.get("MakeDepends") or []) + \
              (rec.get("CheckDepends") or [])
    else:
        raw = []
    return [strip_version(d) for d in raw if d]


def build_tree(blocked: list[str], cache: dict[str, dict],
               ) -> list[dict]:
    blocked_set = {p.lower() for p in blocked}

    # pkg → direct deps (all, not just blocked)
    pkg_deps: dict[str, list[str]] = {}
    for pkg in blocked:
        pkg_deps[pkg.lower()] = get_deps(pkg, cache)

    # reverse map: dep → set of blocked pkgs that depend on it
    reverse_map: dict[str, set[str]] = defaultdict(set)
    for pkg, deps in pkg_deps.items():
        for dep in deps:
            reverse_map[dep].add(pkg)

    # build queue entries
    queue = []
    for pkg in blocked:
        key = pkg.lower()
        deps = pkg_deps.get(key, [])
        blocked_deps = [d for d in deps if d in blocked_set]
        rev_count = len(reverse_map.get(key, set()))
        queue.append({
            "name": pkg,
            "blocked_dep_count": len(blocked_deps),
            "reverse_dep_count": rev_count,
            "total_dep_count": len(deps),
            "blocked_deps": sorted(set(blocked_deps)),
        })

    # sort: blocked_dep_count ASC, reverse_dep_count DESC,
    #        total_dep_count ASC, name ASC
    queue.sort(key=lambda x: (
        x["blocked_dep_count"],
        -x["reverse_dep_count"],
        x["total_dep_count"],
        x["name"].lower(),
    ))

    # assign ranks
    for i, entry in enumerate(queue, 1):
        entry["rank"] = i

    return queue


def write_json(queue: list[dict], run_id: str, total: int):
    ts = datetime.now(timezone.utc).isoformat()
    obj = {
        "timestamp": ts,
        "run": run_id,
        "total_blocked": total,
        "queue": queue,
    }
    REPORT_JSON.write_text(json.dumps(obj, indent=2), encoding="utf-8")
    print(f"[info] wrote {REPORT_JSON} ({len(queue)} entries)", file=sys.stderr)


def write_md(queue: list[dict], run_id: str, total: int, top_n: int = 120):
    ts = datetime.now(timezone.utc).isoformat()
    lines = [
        "# Blocked Dependency Tree",
        "",
        f"**Timestamp:** {ts}",
        f"**Run:** {run_id}",
        f"**Total blocked:** {total}",
        "",
        f"## Priority Queue (top {min(top_n, len(queue))})",
        "",
        "| Rank | Package | Blocked Deps | Reverse Deps | Total Deps | Blocked Dep Names |",
        "|------|---------|-------------|-------------|------------|-------------------|",
    ]
    for entry in queue[:top_n]:
        deps_str = ", ".join(entry["blocked_deps"][:5])
        if len(entry["blocked_deps"]) > 5:
            deps_str += f" (+{len(entry['blocked_deps'])-5})"
        lines.append(
            f"| {entry['rank']} | {entry['name']} "
            f"| {entry['blocked_dep_count']} | {entry['reverse_dep_count']} "
            f"| {entry['total_dep_count']} | {deps_str} |"
        )
    REPORT_MD.write_text("\n".join(lines) + "\n", encoding="utf-8")
    print(f"[info] wrote {REPORT_MD}", file=sys.stderr)


def write_selected(queue: list[dict], n: int):
    selected = queue[:n]
    lines = [f"{e['rank']}. {e['name']}" for e in selected]
    SELECTED_TXT.write_text("\n".join(lines) + "\n", encoding="utf-8")
    print(f"[info] wrote {SELECTED_TXT} ({len(selected)} packages)", file=sys.stderr)
    return selected


def main() -> int:
    ap = argparse.ArgumentParser(description="Build blocked dep tree and select top-N")
    ap.add_argument("--select", type=int, default=100)
    ap.add_argument("--run-id", default="cron-c79f127f-r22-w03-nrd3")
    args = ap.parse_args()

    print("[info] loading AUR cache…", file=sys.stderr)
    cache = load_cache(CACHE_FILE)
    print(f"[info] {len(cache)} packages in cache", file=sys.stderr)

    blocked = parse_blocked(TODO_FILE)
    print(f"[info] {len(blocked)} BLOCKED packages found", file=sys.stderr)

    print("[info] building dependency tree…", file=sys.stderr)
    queue = build_tree(blocked, cache)

    write_json(queue, args.run_id, len(blocked))
    write_md(queue, args.run_id, len(blocked))
    selected = write_selected(queue, args.select)

    # Print top 20 to stdout
    print(f"\n=== Top 20 from priority queue (of {len(blocked)} blocked) ===")
    print(f"{'Rank':<5} {'Package':<40} {'BlkDep':<7} {'RevDep':<7} {'TotDep':<7}")
    print("-" * 70)
    for e in queue[:20]:
        print(f"{e['rank']:<5} {e['name']:<40} {e['blocked_dep_count']:<7} "
              f"{e['reverse_dep_count']:<7} {e['total_dep_count']:<7}")

    print(f"\n=== Selected {len(selected)} packages ===")
    for e in selected:
        print(f"  {e['rank']}. {e['name']}")

    return 0


if __name__ == "__main__":
    raise SystemExit(main())
