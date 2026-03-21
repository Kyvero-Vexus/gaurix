#!/usr/bin/env python3
"""Deduplicate todo_general_packages.org candidate entries by package name.

Defaults:
- keep "best" entry per package (status priority + newest tie-break)
- rewrite file in-place only when --in-place is passed
- renumber candidate headings sequentially

Heading format expected:
  ** STATUS N. package-name
"""

from __future__ import annotations

import argparse
import re
import sys
from dataclasses import dataclass
from pathlib import Path
from typing import List, Tuple

HEADING_RE = re.compile(r"^(\*\*\s+)([A-Z_]+)(\s+)(\d+)(\.\s+)(.+?)\s*$")
CANDIDATES_HEADER_RE = re.compile(r"^\*\s+Candidate packages\s*$", re.IGNORECASE)
ENTRY_START_RE = re.compile(r"^\*\*\s+")

STATUS_SCORE = {
    "DONE": 4,
    "TODO": 3,
    "FAILED": 2,
    "BLOCKED": 1,
}


@dataclass
class Entry:
    start: int
    end: int
    heading: str
    status: str
    number: int
    package: str
    lines: List[str]


def parse_entries(lines: List[str]) -> Tuple[int, List[Entry]]:
    section_start = None
    for i, line in enumerate(lines):
        if CANDIDATES_HEADER_RE.match(line.rstrip("\n")):
            section_start = i
            break
    if section_start is None:
        raise ValueError("Could not find '* Candidate packages' section")

    entries: List[Entry] = []
    i = section_start + 1
    while i < len(lines):
        line = lines[i]
        if line.startswith("* ") and not line.startswith("** "):
            break
        if ENTRY_START_RE.match(line):
            m = HEADING_RE.match(line.rstrip("\n"))
            if not m:
                i += 1
                continue
            start = i
            i += 1
            while i < len(lines) and not ENTRY_START_RE.match(lines[i]) and not (
                lines[i].startswith("* ") and not lines[i].startswith("** ")
            ):
                i += 1
            end = i
            entries.append(
                Entry(
                    start=start,
                    end=end,
                    heading=line,
                    status=m.group(2),
                    number=int(m.group(4)),
                    package=m.group(6).strip(),
                    lines=lines[start:end],
                )
            )
            continue
        i += 1

    return section_start, entries


def choose_entry(existing: Entry, candidate: Entry, keep: str) -> Entry:
    if keep == "first":
        return existing
    if keep == "last":
        return candidate

    # keep == best
    a = STATUS_SCORE.get(existing.status, 0)
    b = STATUS_SCORE.get(candidate.status, 0)
    if b > a:
        return candidate
    if a > b:
        return existing
    # tie-break: keep newer (larger original number)
    if candidate.number >= existing.number:
        return candidate
    return existing


def renumber_heading(line: str, new_number: int) -> str:
    m = HEADING_RE.match(line.rstrip("\n"))
    if not m:
        return line
    new_line = f"{m.group(1)}{m.group(2)}{m.group(3)}{new_number}{m.group(5)}{m.group(6)}\n"
    return new_line


def dedupe(lines: List[str], keep: str) -> Tuple[List[str], int, int]:
    section_start, entries = parse_entries(lines)
    if not entries:
        return lines[:], 0, 0

    chosen: dict[str, Entry] = {}
    for e in entries:
        key = e.package.lower()
        if key not in chosen:
            chosen[key] = e
        else:
            chosen[key] = choose_entry(chosen[key], e, keep)

    kept_entries = sorted(chosen.values(), key=lambda e: e.start)

    # Build replacement block and renumber headings
    replacement: List[str] = []
    for idx, e in enumerate(kept_entries, start=1):
        block = e.lines[:]
        block[0] = renumber_heading(block[0], idx)
        replacement.extend(block)

    first = entries[0].start
    last = entries[-1].end
    out = lines[:first] + replacement + lines[last:]
    removed = len(entries) - len(kept_entries)
    return out, len(entries), removed


def main() -> int:
    ap = argparse.ArgumentParser(description="Deduplicate Gaurix org todo candidate entries")
    ap.add_argument("path", nargs="?", default="todo_general_packages.org")
    ap.add_argument("--keep", choices=["best", "first", "last"], default="best")
    ap.add_argument("--in-place", action="store_true", help="rewrite file in-place")
    args = ap.parse_args()

    path = Path(args.path)
    if not path.exists():
        print(f"error: file not found: {path}", file=sys.stderr)
        return 2

    original = path.read_text(encoding="utf-8").splitlines(keepends=True)
    updated, total, removed = dedupe(original, args.keep)

    print(f"entries: {total}")
    print(f"duplicates_removed: {removed}")
    print(f"mode: keep={args.keep}")

    if args.in_place:
        if updated != original:
            path.write_text("".join(updated), encoding="utf-8")
            print(f"rewritten: {path}")
        else:
            print("no changes")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
