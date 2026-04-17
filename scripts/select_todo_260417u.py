#!/usr/bin/env python3
"""Select 100 TODO packages from todo_general_packages.org and look up AUR metadata."""

import json
import re
import sys

TODO_FILE = "todo_general_packages.org"
AUR_CACHE = "data/aur-cache/packages-meta-ext-v1.json"

def parse_todo_entries(path):
    """Extract all TODO entries with their line numbers and package numbers."""
    entries = []
    with open(path, "r") as f:
        for i, line in enumerate(f, 1):
            m = re.match(r'^\*\* TODO (\d+)\. (.+)$', line)
            if m:
                entries.append({
                    "line": i,
                    "num": int(m.group(1)),
                    "name": m.group(2).strip(),
                })
    return entries

def load_aur_cache(path):
    """Load AUR metadata cache into a dict keyed by package name."""
    print(f"Loading AUR cache from {path}...", file=sys.stderr)
    with open(path, "r") as f:
        data = json.load(f)
    cache = {}
    for pkg in data:
        cache[pkg.get("Name", "")] = pkg
    print(f"Loaded {len(cache)} AUR packages.", file=sys.stderr)
    return cache

def main():
    entries = parse_todo_entries(TODO_FILE)
    print(f"Total TODO entries: {len(entries)}", file=sys.stderr)

    aur = load_aur_cache(AUR_CACHE)

    # Select first 100 TODO entries
    selected = entries[:100]

    # Look up each in AUR
    results = []
    for entry in selected:
        name = entry["name"]
        aur_info = aur.get(name)
        results.append({
            "line": entry["line"],
            "num": entry["num"],
            "name": name,
            "in_aur": aur_info is not None,
            "version": aur_info.get("Version", "") if aur_info else "",
            "description": aur_info.get("Description", "") if aur_info else "",
            "url": aur_info.get("URL", "") if aur_info else "",
            "license": aur_info.get("License", []) if aur_info else [],
            "depends": aur_info.get("Depends", []) if aur_info else [],
            "makedepends": aur_info.get("MakeDepends", []) if aur_info else [],
        })

    # Output as JSON
    json.dump(results, sys.stdout, indent=2)
    print(file=sys.stderr)

    in_aur = sum(1 for r in results if r["in_aur"])
    not_in_aur = sum(1 for r in results if not r["in_aur"])
    print(f"Selected: {len(results)}, In AUR: {in_aur}, Not in AUR: {not_in_aur}", file=sys.stderr)

if __name__ == "__main__":
    main()
