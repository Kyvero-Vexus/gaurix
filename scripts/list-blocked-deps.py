#!/usr/bin/env python3
"""List AUR dependencies for each BLOCKED entry in todo_general_packages.org.

Sources deps from:
1. Local AUR metadata cache (data/aur-cache/packages-meta-ext-v1.json) — fast, offline.
2. Cached PKGBUILD .SRCINFO (data/aur-cache/pkgbuilds/<pkg>/.SRCINFO) if present.
3. Optionally fetches live from AUR RPC if --fetch is passed and cache misses.

Output formats: text (default), json (--json), org (--org).

Usage:
    scripts/list-blocked-deps.py                 # text report to stdout
    scripts/list-blocked-deps.py --json          # JSON to stdout
    scripts/list-blocked-deps.py --org           # Org table to stdout
    scripts/list-blocked-deps.py --fetch         # fetch missing packages from AUR live
    scripts/list-blocked-deps.py --out FILE      # write output to file
    scripts/list-blocked-deps.py --pkg firefox   # single package lookup
    scripts/list-blocked-deps.py --limit 50      # cap at first N blocked packages
"""

from __future__ import annotations

import argparse
import json
import re
import sys
import urllib.request
from pathlib import Path
from typing import Optional

REPO_ROOT = Path(__file__).resolve().parent.parent
TODO_FILE = REPO_ROOT / "todo_general_packages.org"
CACHE_FILE = REPO_ROOT / "data/aur-cache/packages-meta-ext-v1.json"
PKGBUILD_DIR = REPO_ROOT / "data/aur-cache/pkgbuilds"

HEADING_RE = re.compile(r"^\*\*\s+BLOCKED\s+\d+\.\s+(.+?)\s*$")

DEP_FIELDS = {
    "Depends": "depends",
    "MakeDepends": "makedepends",
    "OptDepends": "optdepends",
    "CheckDepends": "checkdepends",
}

SRCINFO_DEP_MAP = {
    "depends": "depends",
    "makedepends": "makedepends",
    "optdepends": "optdepends",
    "checkdepends": "checkdepends",
}


# ── parsers ────────────────────────────────────────────────────────────────────

def parse_blocked(path: Path) -> list[str]:
    pkgs = []
    for line in path.read_text(encoding="utf-8").splitlines():
        m = HEADING_RE.match(line)
        if m:
            pkgs.append(m.group(1).strip())
    return pkgs


def load_cache(path: Path) -> dict[str, dict]:
    """Return {name_lower: record} from the AUR metadata cache."""
    data = json.loads(path.read_bytes())
    return {e["Name"].lower(): e for e in data}


def parse_srcinfo(path: Path) -> dict[str, list[str]]:
    """Parse .SRCINFO and return dep lists."""
    result: dict[str, list[str]] = {v: [] for v in SRCINFO_DEP_MAP.values()}
    for line in path.read_text(encoding="utf-8").splitlines():
        line = line.strip()
        if "=" not in line:
            continue
        key, _, val = line.partition("=")
        key = key.strip().lower()
        val = val.strip()
        if key in SRCINFO_DEP_MAP:
            result[SRCINFO_DEP_MAP[key]].append(val)
    return result


def fetch_aur_rpc(name: str) -> Optional[dict]:
    url = f"https://aur.archlinux.org/rpc/v5/info?arg[]={urllib.parse.quote(name)}"
    import urllib.parse
    try:
        with urllib.request.urlopen(url, timeout=10) as resp:
            data = json.loads(resp.read())
        results = data.get("results", [])
        if results:
            return results[0]
    except Exception as exc:
        print(f"  [warn] AUR RPC fetch failed for {name}: {exc}", file=sys.stderr)
    return None


# ── dep resolution ─────────────────────────────────────────────────────────────

def get_deps(name: str, cache: dict[str, dict], do_fetch: bool) -> dict:
    """Return dep info dict for a package name."""
    key = name.lower()
    record: Optional[dict] = cache.get(key)

    # try .SRCINFO on disk (more complete than metadata cache)
    srcinfo_path = PKGBUILD_DIR / name / ".SRCINFO"
    if srcinfo_path.exists():
        si = parse_srcinfo(srcinfo_path)
        return {
            "source": "srcinfo",
            "version": record.get("Version") if record else None,
            **si,
        }

    if record:
        return {
            "source": "cache",
            "version": record.get("Version"),
            "depends": record.get("Depends", []),
            "makedepends": record.get("MakeDepends", []),
            "optdepends": record.get("OptDepends", []),
            "checkdepends": record.get("CheckDepends", []),
        }

    if do_fetch:
        live = fetch_aur_rpc(name)
        if live:
            return {
                "source": "rpc",
                "version": live.get("Version"),
                "depends": live.get("Depends", []),
                "makedepends": live.get("MakeDepends", []),
                "optdepends": live.get("OptDepends", []),
                "checkdepends": live.get("CheckDepends", []),
            }

    return {
        "source": "not_found",
        "version": None,
        "depends": [],
        "makedepends": [],
        "optdepends": [],
        "checkdepends": [],
    }


# ── formatters ─────────────────────────────────────────────────────────────────

def _dep_str(deps: list[str]) -> str:
    return ", ".join(deps) if deps else "—"


def format_text(results: list[dict]) -> str:
    lines = [f"Blocked package deps report — {len(results)} packages\n{'='*60}"]
    for r in results:
        d = r["deps"]
        lines.append(f"\n{r['name']}  [{d['version'] or '?'}]  (source: {d['source']})")
        lines.append(f"  depends:      {_dep_str(d['depends'])}")
        lines.append(f"  makedepends:  {_dep_str(d['makedepends'])}")
        if d["optdepends"]:
            lines.append(f"  optdepends:   {_dep_str(d['optdepends'])}")
        if d["checkdepends"]:
            lines.append(f"  checkdepends: {_dep_str(d['checkdepends'])}")
    return "\n".join(lines)


def format_json(results: list[dict]) -> str:
    return json.dumps(results, indent=2)


def format_org(results: list[dict]) -> str:
    lines = ["* Blocked package dependency report",
             "",
             f"/{len(results)} BLOCKED entries/",
             "",
             "| Package | Version | Depends | MakeDepends | OptDepends |",
             "|---------|---------|---------|-------------|------------|"]
    for r in results:
        d = r["deps"]
        lines.append(
            f"| {r['name']} | {d['version'] or '?'} "
            f"| {_dep_str(d['depends'])} "
            f"| {_dep_str(d['makedepends'])} "
            f"| {_dep_str(d['optdepends'])} |"
        )
    return "\n".join(lines)


# ── main ───────────────────────────────────────────────────────────────────────

def main() -> int:
    ap = argparse.ArgumentParser(description="List deps for BLOCKED Gaurix todo entries")
    ap.add_argument("--todo", default=str(TODO_FILE), help="path to todo org file")
    ap.add_argument("--cache", default=str(CACHE_FILE), help="path to AUR metadata cache JSON")
    ap.add_argument("--fetch", action="store_true", help="fetch missing packages from AUR RPC")
    ap.add_argument("--json", dest="fmt_json", action="store_true", help="JSON output")
    ap.add_argument("--org", dest="fmt_org", action="store_true", help="Org table output")
    ap.add_argument("--out", help="write output to this file instead of stdout")
    ap.add_argument("--pkg", help="look up a single package by name (bypasses todo parsing)")
    ap.add_argument("--limit", type=int, default=0, help="max number of blocked packages to process (0 = all)")
    args = ap.parse_args()

    cache = {}
    cache_path = Path(args.cache)
    if cache_path.exists():
        cache = load_cache(cache_path)
    else:
        print(f"[warn] AUR cache not found at {cache_path}", file=sys.stderr)

    if args.pkg:
        blocked = [args.pkg]
    else:
        todo_path = Path(args.todo)
        if not todo_path.exists():
            print(f"error: todo file not found: {todo_path}", file=sys.stderr)
            return 2
        blocked = parse_blocked(todo_path)

    if args.limit and args.limit > 0:
        blocked = blocked[:args.limit]

    print(f"[info] processing {len(blocked)} blocked packages…", file=sys.stderr)

    results = []
    for name in blocked:
        deps = get_deps(name, cache, args.fetch)
        results.append({"name": name, "deps": deps})

    if args.fmt_json:
        output = format_json(results)
    elif args.fmt_org:
        output = format_org(results)
    else:
        output = format_text(results)

    if args.out:
        Path(args.out).write_text(output, encoding="utf-8")
        print(f"[info] written to {args.out}", file=sys.stderr)
    else:
        print(output)

    return 0


if __name__ == "__main__":
    raise SystemExit(main())
