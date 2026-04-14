#!/usr/bin/env python3
"""Update todo_general_packages.org statuses for deptree-resolver-260414s.

For recipes: add status line under existing entry
For blocked: add status line with reason code
Preserves numbering and format.
"""

import json
import re
import os
import shutil
import tempfile
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
PASS_ID = "deptree-resolver-260414s"
TODO_FILE = ROOT / "todo_general_packages.org"
SUMMARY = ROOT / "reports" / f"{PASS_ID}-summary.json"


def load_summary():
    with open(SUMMARY) as f:
        return json.load(f)


def build_status_map(summary):
    """Build number -> status_line map."""
    status_map = {}
    for r in summary["recipes"]:
        num = r["number"]
        gn = r["guix_name"]
        bs = r["build_system"]
        ver = r["version"]
        aur = r["aur_name"]
        status_map[num] = (
            "DONE",
            f"DONE: Recipe in {PASS_ID}.scm. {bs}-build-system, v{ver}, guix-name={gn} ({PASS_ID})"
        )

    for b in summary["blocked"]:
        num = b["number"]
        cat = b["category"]
        reason = b["reason"]
        aur = b["aur_name"]
        status_map[num] = (
            "BLOCKED",
            f"BLOCKED: {cat} — {reason} ({PASS_ID})"
        )

    return status_map


def update_todo(status_map):
    """Update todo file: change headers and add status lines."""
    content = TODO_FILE.read_text()
    lines = content.split('\n')
    new_lines = []
    i = 0
    updated = 0

    while i < len(lines):
        line = lines[i]

        # Match "** BLOCKED N. package-name" or "** DONE N. package-name" etc.
        m = re.match(r'^(\*\* )BLOCKED (\d+)\. (.+)$', line)
        if m:
            prefix = m.group(1)
            num = int(m.group(2))
            rest = m.group(3)

            if num in status_map:
                new_status, status_line = status_map[num]

                if new_status == "DONE":
                    # Change header from BLOCKED to DONE
                    new_lines.append(f"{prefix}DONE {num}. {rest}")
                else:
                    # Keep BLOCKED header
                    new_lines.append(line)

                # Scan forward to find where to insert status line
                i += 1
                # Copy existing content lines until next heading or empty significant boundary
                inserted = False
                while i < len(lines):
                    next_line = lines[i]
                    # Insert before TODO Status line if found
                    if next_line.strip().startswith('- TODO Status:'):
                        if not inserted:
                            new_lines.append(f"   {status_line}")
                            inserted = True
                        if new_status == "DONE":
                            new_lines.append(f"   - TODO Status: DONE")
                        else:
                            new_lines.append(f"   - TODO Status: BLOCKED")
                        i += 1
                        updated += 1
                        break
                    elif next_line.startswith('** '):
                        # Next entry - insert before it if we haven't
                        if not inserted:
                            new_lines.append(f"   {status_line}")
                            inserted = True
                        # Don't consume this line
                        break
                    else:
                        new_lines.append(next_line)
                        i += 1
                else:
                    if not inserted:
                        new_lines.append(f"   {status_line}")
                        updated += 1
                continue
            else:
                new_lines.append(line)
                i += 1
                continue
        else:
            new_lines.append(line)
            i += 1

    new_content = '\n'.join(new_lines)

    # Atomic write
    fd, tmp = tempfile.mkstemp(dir=TODO_FILE.parent, suffix=".org")
    try:
        os.write(fd, new_content.encode())
        os.close(fd)
        shutil.move(tmp, TODO_FILE)
        print(f"Updated {TODO_FILE} ({updated} entries modified)")
    except Exception:
        os.close(fd)
        os.unlink(tmp)
        raise


def main():
    summary = load_summary()
    status_map = build_status_map(summary)
    print(f"Pass: {PASS_ID}")
    print(f"Entries to update: {len(status_map)} (DONE: {sum(1 for s, _ in status_map.values() if s == 'DONE')}, BLOCKED: {sum(1 for s, _ in status_map.values() if s == 'BLOCKED')})")

    update_todo(status_map)
    print("Done.")


if __name__ == "__main__":
    main()
