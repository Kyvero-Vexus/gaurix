#!/usr/bin/env python3
"""Select the first 120 TODO entries from todo_general_packages.org and enrich with AUR metadata.

Outputs a JSON array to reports/select-todo-260419e.json with package info
for downstream processing (pick 100 from the 120).
"""

import json
import re
import sys
import os

ORG_FILE = "/home/slime/projects/gaurix/todo_general_packages.org"
AUR_META = "/home/slime/projects/gaurix/data/aur-cache/packages-meta-ext-v1.json"
OUTPUT = "/home/slime/projects/gaurix/reports/select-todo-260419e.json"

LIMIT = 120


def parse_todo_entries(filepath: str, limit: int) -> list:
    """Parse the first `limit` TODO entries from the org file."""
    entries = []
    with open(filepath, "r", errors="replace") as f:
        for line_num, line in enumerate(f, 1):
            # Match: ** TODO 16971. cobalt-lang
            m = re.match(
                r"^\*\*\s+TODO\s+(\d+)\.\s+(.+?)(?:\s+:.*:)?\s*$", line
            )
            if m:
                num = int(m.group(1))
                name = m.group(2).strip()
                # Strip any trailing tags or brackets from name
                name = re.sub(r"\s+\[.*$", "", name)
                name = re.sub(r"\s+:.*$", "", name)
                entries.append({
                    "number": num,
                    "name": name,
                    "line_number": line_num,
                })
                if len(entries) >= limit:
                    break
    return entries


def load_aur_index(filepath: str) -> dict:
    """Load AUR metadata and index by package name."""
    print(f"Loading AUR metadata from {filepath} ...", file=sys.stderr)
    with open(filepath, "r") as f:
        data = json.load(f)
    index = {}
    for pkg in data:
        index[pkg["Name"]] = pkg
    print(f"Loaded {len(index)} AUR packages.", file=sys.stderr)
    return index


def enrich_entries(entries: list, aur_index: dict) -> list:
    """Add AUR metadata to each entry."""
    results = []
    found = 0
    for entry in entries:
        name = entry["name"]
        pkg = aur_index.get(name)
        if pkg:
            found += 1
            results.append({
                "number": entry["number"],
                "name": name,
                "aur_name": pkg.get("Name", name),
                "version": pkg.get("Version", "unknown"),
                "license": pkg.get("License", ["unknown"]),
                "url": pkg.get("URL", ""),
                "description": pkg.get("Description", ""),
                "depends": pkg.get("Depends") or [],
                "makedepends": pkg.get("MakeDepends") or [],
                "line_number": entry["line_number"],
            })
        else:
            results.append({
                "number": entry["number"],
                "name": name,
                "aur_name": name,
                "version": "unknown",
                "license": "unknown",
                "url": "",
                "description": "",
                "depends": [],
                "makedepends": [],
                "line_number": entry["line_number"],
            })
    print(f"AUR matches: {found}/{len(entries)}", file=sys.stderr)
    return results


def main():
    # 1. Parse TODO entries
    entries = parse_todo_entries(ORG_FILE, LIMIT)
    print(f"Found {len(entries)} TODO entries (limit {LIMIT}).", file=sys.stderr)

    if not entries:
        print("ERROR: No TODO entries found.", file=sys.stderr)
        sys.exit(1)

    # 2. Load AUR metadata
    aur_index = load_aur_index(AUR_META)

    # 3. Enrich with AUR data
    results = enrich_entries(entries, aur_index)

    # 4. Write output
    os.makedirs(os.path.dirname(OUTPUT), exist_ok=True)
    with open(OUTPUT, "w") as f:
        json.dump(results, f, indent=2)
    print(f"Wrote {len(results)} entries to {OUTPUT}", file=sys.stderr)


if __name__ == "__main__":
    main()
