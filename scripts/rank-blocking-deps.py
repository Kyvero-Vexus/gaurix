#!/usr/bin/env python3
"""Rank dependencies by how many BLOCKED packages they (transitively) block.

Algorithm:
  1. Parse all BLOCKED package names from todo_general_packages.org.
  2. For each blocked package, look up its direct deps from the AUR metadata cache.
  3. Build a dependency graph among blocked packages (dep → set of blocked packages
     that directly or transitively depend on it).
  4. For every dep (whether itself blocked or just an external lib), compute a
     "blocking score" = number of distinct BLOCKED packages in its transitive
     dependent set.
  5. Emit a ranked list: highest score first.

Dep resolution order (first match wins):
  1. data/aur-cache/pkgbuilds/<pkg>/.SRCINFO  (most accurate)
  2. data/aur-cache/packages-meta-ext-v1.json  (fast, offline)
  3. AUR RPC live fetch (only if --fetch passed)

Output: text (default), json (--json), org (--org)

Usage:
    scripts/rank-blocking-deps.py
    scripts/rank-blocking-deps.py --top 30
    scripts/rank-blocking-deps.py --json --out reports/blocking-deps.json
    scripts/rank-blocking-deps.py --org  --out reports/blocking-deps.org
    scripts/rank-blocking-deps.py --fetch          # live AUR RPC for misses
    scripts/rank-blocking-deps.py --include-optional  # count optdepends too
"""

from __future__ import annotations

import argparse
import json
import re
import sys
import urllib.parse
import urllib.request
from collections import defaultdict
from pathlib import Path
from typing import Optional

# ── paths ──────────────────────────────────────────────────────────────────────
REPO_ROOT   = Path(__file__).resolve().parent.parent
TODO_FILE   = REPO_ROOT / "todo_general_packages.org"
CACHE_FILE  = REPO_ROOT / "data/aur-cache/packages-meta-ext-v1.json"
PKGBUILD_DIR = REPO_ROOT / "data/aur-cache/pkgbuilds"

HEADING_RE = re.compile(r"^\*\*\s+BLOCKED\s+\d+\.\s+(.+?)\s*$")

# strip version constraints: "foo>=1.2" → "foo"
DEP_NAME_RE = re.compile(r"^([a-zA-Z0-9@._+\-]+)")


# ── helpers ────────────────────────────────────────────────────────────────────

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


def load_cache(path: Path) -> dict[str, dict]:
    data = json.loads(path.read_bytes())
    return {e["Name"].lower(): e for e in data}


def parse_srcinfo(path: Path) -> dict[str, list[str]]:
    result: dict[str, list[str]] = defaultdict(list)
    for line in path.read_text(encoding="utf-8").splitlines():
        line = line.strip()
        if "=" not in line:
            continue
        key, _, val = line.partition("=")
        key = key.strip().lower()
        val = val.strip()
        if key in ("depends", "makedepends", "checkdepends", "optdepends"):
            result[key].append(val)
    return dict(result)


def fetch_aur_rpc(name: str) -> Optional[dict]:
    url = f"https://aur.archlinux.org/rpc/v5/info?arg[]={urllib.parse.quote(name)}"
    try:
        with urllib.request.urlopen(url, timeout=10) as resp:
            data = json.loads(resp.read())
        results = data.get("results", [])
        if results:
            return results[0]
    except Exception as exc:
        print(f"  [warn] AUR RPC failed for {name}: {exc}", file=sys.stderr)
    return None


def get_direct_deps(name: str, cache: dict[str, dict],
                    do_fetch: bool, include_optional: bool) -> list[str]:
    """Return direct dep names (version-stripped) for a package."""
    key = name.lower()
    srcinfo_path = PKGBUILD_DIR / name / ".SRCINFO"

    if srcinfo_path.exists():
        si = parse_srcinfo(srcinfo_path)
        deps = si.get("depends", []) + si.get("makedepends", []) + si.get("checkdepends", [])
        if include_optional:
            deps += si.get("optdepends", [])
    elif key in cache:
        rec = cache[key]
        deps = (rec.get("Depends") or []) + (rec.get("MakeDepends") or []) + (rec.get("CheckDepends") or [])
        if include_optional:
            deps += rec.get("OptDepends") or []
    elif do_fetch:
        live = fetch_aur_rpc(name)
        if live:
            deps = (live.get("Depends") or []) + (live.get("MakeDepends") or []) + (live.get("CheckDepends") or [])
            if include_optional:
                deps += live.get("OptDepends") or []
        else:
            deps = []
    else:
        deps = []

    return [strip_version(d) for d in deps if d]


# ── graph & scoring ────────────────────────────────────────────────────────────

def build_graph(blocked: list[str], cache: dict[str, dict],
                do_fetch: bool, include_optional: bool
                ) -> dict[str, set[str]]:
    """Return {dep_name: set_of_direct_dependent_blocked_pkgs}."""
    blocked_set = {p.lower() for p in blocked}

    # pkg → direct deps
    pkg_deps: dict[str, list[str]] = {}
    for pkg in blocked:
        pkg_deps[pkg.lower()] = get_direct_deps(pkg, cache, do_fetch, include_optional)

    # dep → set of blocked packages that directly depend on it
    direct_dep_to_blocked: dict[str, set[str]] = defaultdict(set)
    for pkg, deps in pkg_deps.items():
        for dep in deps:
            direct_dep_to_blocked[dep.lower()].add(pkg)

    return dict(direct_dep_to_blocked), pkg_deps, blocked_set


def transitive_blocked_count(dep: str,
                              pkg_deps: dict[str, list[str]],
                              blocked_set: set[str],
                              _cache: dict[str, set[str]] = {}) -> set[str]:
    """
    Return the set of BLOCKED packages that transitively depend on `dep`.

    We walk the reverse graph: start from every blocked package that directly
    depends on dep, then union in everything that transitively depends on THOSE
    packages (since if A needs B and B needs dep, then dep blocks A too).
    """
    if dep in _cache:
        return _cache[dep]

    # DFS on forward deps to find which blocked pkgs transitively need `dep`
    visited: set[str] = set()

    def _blocked_dependents(pkg: str, seen: set[str]) -> set[str]:
        """Return blocked pkgs in `pkg`'s transitive dep tree that include dep."""
        result: set[str] = set()
        for d in pkg_deps.get(pkg, []):
            dl = d.lower()
            if dl == dep:
                result.add(pkg)
            if dl in blocked_set and dl not in seen:
                seen.add(dl)
                result |= _blocked_dependents(dl, seen)
        return result

    result: set[str] = set()
    for blocked_pkg in blocked_set:
        if blocked_pkg in visited:
            continue
        found = _blocked_dependents(blocked_pkg, set())
        if found:
            result.add(blocked_pkg)
        result |= found

    # Also: any blocked package that directly lists this dep
    for blocked_pkg, deps in pkg_deps.items():
        if dep in [d.lower() for d in deps]:
            result.add(blocked_pkg)

    _cache[dep] = result
    return result


def score_deps(direct_dep_to_blocked: dict[str, set[str]],
               pkg_deps: dict[str, list[str]],
               blocked_set: set[str]) -> list[dict]:
    """
    For every dep that appears in at least one blocked package's dep list,
    compute the transitive blocking score.
    """
    all_deps = set(direct_dep_to_blocked.keys())
    results = []

    for dep in all_deps:
        trans = transitive_blocked_count(dep, pkg_deps, blocked_set, {})
        direct = direct_dep_to_blocked.get(dep, set())
        results.append({
            "dep": dep,
            "score": len(trans),
            "direct_count": len(direct),
            "direct_blockers": sorted(direct),
            "transitive_blockers": sorted(trans),
        })

    results.sort(key=lambda x: (-x["score"], -x["direct_count"], x["dep"]))
    return results


# ── formatters ─────────────────────────────────────────────────────────────────

def format_text(results: list[dict], top: int) -> str:
    rows = results[:top] if top else results
    lines = [
        f"Dependency blocking rank — top {len(rows)} of {len(results)} deps",
        f"(score = # of BLOCKED packages transitively blocked by this dep)",
        "=" * 70,
        f"{'Rank':<5}  {'Score':<6}  {'Direct':<7}  Dependency",
        "-" * 70,
    ]
    for i, r in enumerate(rows, 1):
        lines.append(f"{i:<5}  {r['score']:<6}  {r['direct_count']:<7}  {r['dep']}")
        if r["transitive_blockers"]:
            lines.append(f"       blocks: {', '.join(r['transitive_blockers'][:8])}"
                         + (f" … +{len(r['transitive_blockers'])-8} more" if len(r['transitive_blockers']) > 8 else ""))
    return "\n".join(lines)


def format_json(results: list[dict], top: int) -> str:
    return json.dumps(results[:top] if top else results, indent=2)


def format_org(results: list[dict], top: int) -> str:
    rows = results[:top] if top else results
    lines = [
        "* Dependency blocking rank",
        "",
        f"/{len(results)} unique deps across all BLOCKED packages/",
        "",
        "| Rank | Score | Direct | Dependency | Sample blocked packages |",
        "|------|-------|--------|------------|------------------------|",
    ]
    for i, r in enumerate(rows, 1):
        sample = ", ".join(r["transitive_blockers"][:5])
        if len(r["transitive_blockers"]) > 5:
            sample += f" (+{len(r['transitive_blockers'])-5})"
        lines.append(f"| {i} | {r['score']} | {r['direct_count']} | {r['dep']} | {sample} |")
    return "\n".join(lines)


# ── main ───────────────────────────────────────────────────────────────────────

def main() -> int:
    ap = argparse.ArgumentParser(
        description="Rank deps by how many BLOCKED Gaurix packages they transitively block"
    )
    ap.add_argument("--todo",    default=str(TODO_FILE))
    ap.add_argument("--cache",   default=str(CACHE_FILE))
    ap.add_argument("--fetch",   action="store_true", help="fetch cache misses from AUR RPC")
    ap.add_argument("--include-optional", action="store_true",
                    help="include optdepends in the graph")
    ap.add_argument("--top",     type=int, default=50, help="show top N results (0 = all)")
    ap.add_argument("--json",    dest="fmt_json",  action="store_true")
    ap.add_argument("--org",     dest="fmt_org",   action="store_true")
    ap.add_argument("--out",     help="write output to file")
    args = ap.parse_args()

    cache_path = Path(args.cache)
    if not cache_path.exists():
        print(f"[warn] cache not found: {cache_path}", file=sys.stderr)
        cache = {}
    else:
        print("[info] loading AUR cache…", file=sys.stderr)
        cache = load_cache(cache_path)

    todo_path = Path(args.todo)
    if not todo_path.exists():
        print(f"error: todo file not found: {todo_path}", file=sys.stderr)
        return 2

    blocked = parse_blocked(todo_path)
    print(f"[info] {len(blocked)} BLOCKED packages found", file=sys.stderr)

    print("[info] resolving deps…", file=sys.stderr)
    direct_dep_to_blocked, pkg_deps, blocked_set = build_graph(
        blocked, cache, args.fetch, args.include_optional
    )
    print(f"[info] {len(direct_dep_to_blocked)} unique deps found", file=sys.stderr)

    print("[info] computing transitive scores…", file=sys.stderr)
    results = score_deps(direct_dep_to_blocked, pkg_deps, blocked_set)

    top = args.top

    if args.fmt_json:
        output = format_json(results, top)
    elif args.fmt_org:
        output = format_org(results, top)
    else:
        output = format_text(results, top)

    if args.out:
        Path(args.out).write_text(output, encoding="utf-8")
        print(f"[info] written to {args.out}", file=sys.stderr)
    else:
        print(output)

    return 0


if __name__ == "__main__":
    raise SystemExit(main())
