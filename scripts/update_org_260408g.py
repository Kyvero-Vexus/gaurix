#!/usr/bin/env python3
"""Update todo_general_packages.org statuses for deptree-resolver-260408g."""

import json
import os
import re
import shutil
import tempfile
from pathlib import Path

RUN_ID = "deptree-resolver-260408g"
ROOT = Path(__file__).resolve().parent.parent
ORG_FILE = ROOT / "todo_general_packages.org"

def main():
    # Load selection data
    with open(ROOT / "reports" / f"{RUN_ID}-selection.json") as f:
        sel = json.load(f)

    resolved = set(sel["resolved"])
    blocked = set(sel["blocked"])

    # Load categories for block reasons
    with open(ROOT / "reports" / f"{RUN_ID}-categories.json") as f:
        cats = json.load(f)

    block_reasons = {}
    for name, reason, detail in cats["blocked"]:
        block_reasons[name] = (reason, detail)

    # Read org file
    with open(ORG_FILE, "r") as f:
        lines = f.readlines()

    # Find BLOCKED headings and update them
    updates = []  # (line_idx, pkg_name, new_status)
    heading_pattern = re.compile(r"^(\*\* BLOCKED (\d+)\. (.+))$")

    for i, line in enumerate(lines):
        m = heading_pattern.match(line.rstrip())
        if not m:
            continue

        raw_name = m.group(3).strip()
        # Clean the name
        clean = re.split(r"\s+[\[\(]", raw_name)[0].strip()
        clean = re.split(r"\s+-\s+Source", clean)[0].strip()

        if clean in resolved:
            updates.append((i, clean, "DONE", f"DONE: recipe in {RUN_ID}.scm ({RUN_ID} dep-tree pass)"))
        elif clean in blocked:
            reason, detail = block_reasons.get(clean, ("BLOCKED", ""))
            updates.append((i, clean, "BLOCKED", f"BLOCKED: Re-evaluated in {RUN_ID} pass; {reason} -- {detail}"))

    print(f"Found {len(updates)} packages to update ({len([u for u in updates if u[2] == 'DONE'])} DONE, {len([u for u in updates if u[2] == 'BLOCKED'])} BLOCKED)")

    # Apply updates in reverse order to maintain line indices
    for line_idx, pkg_name, new_todo, status_text in reversed(updates):
        old_line = lines[line_idx]

        if new_todo == "DONE":
            # Change ** BLOCKED to ** DONE
            new_line = old_line.replace("** BLOCKED", "** DONE", 1)
            lines[line_idx] = new_line

        # Find the right place to insert new status line
        # Look for existing "   - TODO Status:" or "   - Status:" lines
        insert_idx = line_idx + 1
        while insert_idx < len(lines):
            next_line = lines[insert_idx]
            if next_line.startswith("** ") or next_line.startswith("* "):
                break
            if "TODO Status:" in next_line:
                insert_idx = insert_idx + 1
                break
            insert_idx += 1

        # Insert status update
        status_line = f"   - Status: {status_text}\n"
        if new_todo == "DONE":
            status_line += f"   - TODO Status: DONE\n"
        lines.insert(insert_idx, status_line)

    # Atomic write
    fd, tmp = tempfile.mkstemp(dir=str(ROOT), suffix=".org.tmp")
    with os.fdopen(fd, "w") as f:
        f.writelines(lines)
    shutil.move(tmp, str(ORG_FILE))
    print(f"Org file updated: {len(updates)} packages")


if __name__ == "__main__":
    main()
