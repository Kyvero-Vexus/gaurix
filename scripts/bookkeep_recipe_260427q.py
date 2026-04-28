#!/usr/bin/env python3
"""
Update todo_general_packages.org statuses for recipe-resolver-260427q entries.
Uses line-number-based approach for robustness on large files.
"""
import json
import re
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
TODO_FILE = ROOT / "todo_general_packages.org"
REPORT = ROOT / "reports" / "recipe-resolver-260427q-summary.json"
RESOLVER_ID = "recipe-resolver-260427q"

def main():
    with open(REPORT) as f:
        summary = json.load(f)

    # Build set of entry numbers to update
    entries = {e['num']: e for e in summary['entries']}
    print(f"Updating {len(entries)} entries in {TODO_FILE}")

    # Read the whole file
    with open(TODO_FILE, 'r', errors='replace') as f:
        lines = f.readlines()

    updated = 0
    i = 0
    while i < len(lines):
        line = lines[i]
        # Match TODO header lines: ** TODO <num>. <name>
        m = re.match(r'^(\*\* )TODO (\d+)\. (.+?)(?:\s+:.+:)?\s*$', line)
        if m and int(m.group(2)) in entries:
            num = int(m.group(2))
            name = m.group(3).strip()
            entry = entries[num]

            # Change TODO to DONE and add tag
            new_header = f"** DONE {num}. {name}  :{RESOLVER_ID}:recipe-generated:\n"
            lines[i] = new_header

            # Add status line after the header
            status_line = f"   - Status: DONE: Recipe generated in {RESOLVER_ID}.scm ({RESOLVER_ID})\n"

            # Find next line that's not part of this entry's properties
            # Insert after the header
            lines.insert(i + 1, status_line)
            updated += 1
            i += 2  # Skip past header and inserted line
        else:
            i += 1

    # Write back
    with open(TODO_FILE, 'w', errors='replace') as f:
        f.writelines(lines)

    print(f"Updated {updated} entries to DONE")

if __name__ == '__main__':
    main()
