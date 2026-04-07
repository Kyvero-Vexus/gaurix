#!/usr/bin/env python3
"""Build dependency tree for BLOCKED packages and select top 100 by priority.

For each BLOCKED package, computes:
  - blocked_dep_count: direct deps that are also BLOCKED
  - reverse_dep_count: how many BLOCKED packages depend on this package
  - total_dep_count:   total number of direct dependencies

Priority sort:
  1. blocked_dep_count ascending
  2. reverse_dep_count descending
  3. total_dep_count ascending
  4. package name ascending

Outputs:
  - reports/blocked-dependency-tree.json
  - reports/blocked-dependency-tree.md
"""

from __future__ import annotations

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
OUT_JSON = REPO_ROOT / "reports/blocked-dependency-tree.json"
OUT_MD = REPO_ROOT / "reports/blocked-dependency-tree.md"

HEADING_RE = re.compile(r"^\*\*\s+BLOCKED\s+\d+\.\s+(.+?)\s*$")
DEP_NAME_RE = re.compile(r"^([a-zA-Z0-9@._+\-]+)")


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


def parse_done(path: Path) -> set[str]:
    """Parse DONE packages (already resolved)."""
    done = set()
    done_re = re.compile(r"^\*\*\s+DONE\s+\d+\.\s+(.+?)\s*$")
    for line in path.read_text(encoding="utf-8").splitlines():
        m = done_re.match(line)
        if m:
            done.add(m.group(1).strip().lower())
    return done


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
        val = val.strip()
        if key in ("depends", "makedepends", "checkdepends"):
            deps.append(val)
    return deps


def get_deps(name: str, cache: dict[str, dict]) -> list[str]:
    key = name.lower()
    srcinfo = PKGBUILD_DIR / name / ".SRCINFO"
    if srcinfo.exists():
        raw = parse_srcinfo(srcinfo)
    elif key in cache:
        rec = cache[key]
        raw = (rec.get("Depends") or []) + (rec.get("MakeDepends") or []) + (rec.get("CheckDepends") or [])
    else:
        raw = []
    return [strip_version(d) for d in raw if d]


def main() -> int:
    print("[info] loading AUR cache...", file=sys.stderr)
    cache = load_cache(CACHE_FILE)

    print("[info] parsing BLOCKED packages...", file=sys.stderr)
    blocked_list = parse_blocked(TODO_FILE)
    blocked_set = {p.lower() for p in blocked_list}
    done_set = parse_done(TODO_FILE)

    # Deduplicate (keep first occurrence)
    seen = set()
    deduped = []
    for pkg in blocked_list:
        pl = pkg.lower()
        if pl not in seen:
            seen.add(pl)
            deduped.append(pkg)
    blocked_list = deduped
    blocked_set = {p.lower() for p in blocked_list}

    print(f"[info] {len(blocked_list)} BLOCKED (deduped), {len(done_set)} DONE", file=sys.stderr)

    # Build dep graph
    pkg_deps: dict[str, list[str]] = {}
    for pkg in blocked_list:
        pkg_deps[pkg.lower()] = get_deps(pkg, cache)

    # Compute metrics
    # reverse_dep_count: how many BLOCKED packages list this package as a dep
    reverse_deps: dict[str, set[str]] = defaultdict(set)
    for pkg, deps in pkg_deps.items():
        for dep in deps:
            dl = dep.lower()
            if dl in blocked_set:
                reverse_deps[dl].add(pkg)

    queue = []
    for pkg in blocked_list:
        pl = pkg.lower()
        deps = pkg_deps.get(pl, [])
        total_dep_count = len(deps)
        blocked_dep_count = sum(1 for d in deps if d.lower() in blocked_set)
        rev_dep_count = len(reverse_deps.get(pl, set()))

        queue.append({
            "name": pkg,
            "blocked_dep_count": blocked_dep_count,
            "reverse_dep_count": rev_dep_count,
            "total_dep_count": total_dep_count,
        })

    # Sort by priority
    queue.sort(key=lambda x: (
        x["blocked_dep_count"],
        -x["reverse_dep_count"],
        x["total_dep_count"],
        x["name"],
    ))

    # Assign ranks
    for i, item in enumerate(queue):
        item["rank"] = i + 1

    timestamp = datetime.now(timezone.utc).isoformat()
    run_id = f"deptree-resolver-{datetime.now(timezone.utc).strftime('%Y%m%d-%H%M')}"

    # Write JSON
    tree_data = {
        "timestamp": timestamp,
        "run_id": run_id,
        "total_blocked": len(blocked_list),
        "queue": queue,
    }
    OUT_JSON.write_text(json.dumps(tree_data, indent=2), encoding="utf-8")
    print(f"[info] wrote {OUT_JSON}", file=sys.stderr)

    # Write Markdown
    selected = queue[:100]
    md_lines = [
        "# Blocked Dependency Tree",
        "",
        f"**Timestamp:** {timestamp}",
        f"**Run:** {run_id}",
        f"**Total BLOCKED:** {len(blocked_list)}",
        "",
        "## Top 20 Priority Queue",
        "",
        "| Rank | Package | Blocked Deps | Reverse Deps | Total Deps |",
        "|------|---------|-------------|-------------|------------|",
    ]
    for item in queue[:20]:
        md_lines.append(
            f"| {item['rank']} | {item['name']} | {item['blocked_dep_count']}"
            f" | {item['reverse_dep_count']} | {item['total_dep_count']} |"
        )

    md_lines.extend(["", "## Selected 100", ""])
    for item in selected:
        md_lines.append(
            f"{item['rank']}. {item['name']} (blocked_deps={item['blocked_dep_count']},"
            f" rev_deps={item['reverse_dep_count']}, total={item['total_dep_count']})"
        )

    OUT_MD.write_text("\n".join(md_lines) + "\n", encoding="utf-8")
    print(f"[info] wrote {OUT_MD}", file=sys.stderr)

    # Print selected 100 names for use by caller
    for item in selected:
        print(item["name"])

    return 0


if __name__ == "__main__":
    raise SystemExit(main())
