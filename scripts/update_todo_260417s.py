#!/usr/bin/env python3
"""Update todo_general_packages.org for deptree-resolver-260417s pass.

Reads the summary and updates:
- ALREADY_RESOLVED packages: append DONE status line, set last TODO Status to DONE
- NEW RECIPE packages: append DONE status line, set last TODO Status to DONE
- BLOCKED packages: append updated BLOCKED reason, keep TODO Status as BLOCKED
"""

import json
import os
import re
import tempfile
import shutil
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
TODO_FILE = ROOT / "todo_general_packages.org"
SUMMARY = ROOT / "reports" / "deptree-resolver-260417s-summary.json"
PASS_ID = "deptree-resolver-260417s"


def main():
    with open(SUMMARY) as f:
        summary = json.load(f)

    # Build lookup: package number -> action
    actions = {}

    for r in summary["resolved_packages"]:
        actions[r["number"]] = {
            "action": "DONE",
            "status_line": f"   - Status: DONE: Recipe added in {PASS_ID}.scm ({r['name']} v{r['version']}, {r['build_system']}-build-system) ({PASS_ID})",
            "todo_status": "DONE",
        }

    for r in summary["already_resolved_packages"]:
        actions[r["number"]] = {
            "action": "DONE",
            "status_line": f"   - Status: DONE: ALREADY_RESOLVED: {r['reason']} ({PASS_ID})",
            "todo_status": "DONE",
        }

    for b in summary["blocked_packages"]:
        actions[b["number"]] = {
            "action": "BLOCKED",
            "status_line": f"   - Status: BLOCKED: {b['reason']}: {b['details']} ({PASS_ID})",
            "todo_status": "BLOCKED",
        }

    print(f"[{PASS_ID}] Updating {len(actions)} package entries in todo_general_packages.org")
    print(f"  DONE: {sum(1 for a in actions.values() if a['action'] == 'DONE')}")
    print(f"  BLOCKED: {sum(1 for a in actions.values() if a['action'] == 'BLOCKED')}")

    # Read the entire file
    with open(TODO_FILE, "r") as f:
        lines = f.readlines()

    output_lines = []
    current_number = None
    pending_action = None
    updated_count = 0

    for i, line in enumerate(lines):
        # Check for org heading
        heading_m = re.match(r"^(\*\*\s+)(\S+)(\s+(\d+)\.\s+.*)$", line)
        if heading_m:
            # Before processing new heading, flush pending action from previous entry
            if pending_action:
                # Insert status lines before trailing blank lines
                insert_pos = len(output_lines)
                while insert_pos > 0 and output_lines[insert_pos - 1].strip() == "":
                    insert_pos -= 1
                status_lines = [
                    pending_action["status_line"] + "\n",
                    f"   - TODO Status: {pending_action['todo_status']}\n",
                ]
                output_lines[insert_pos:insert_pos] = status_lines
                updated_count += 1
                pending_action = None

            current_number = int(heading_m.group(4))
            action = actions.get(current_number)

            if action:
                if action["action"] == "DONE":
                    # Change heading status to DONE
                    line = heading_m.group(1) + "DONE" + heading_m.group(3) + "\n"
                pending_action = action

            output_lines.append(line)
            continue

        output_lines.append(line)

    # Flush last entry's pending action
    if pending_action:
        insert_pos = len(output_lines)
        while insert_pos > 0 and output_lines[insert_pos - 1].strip() == "":
            insert_pos -= 1
        status_lines = [
            pending_action["status_line"] + "\n",
            f"   - TODO Status: {pending_action['todo_status']}\n",
        ]
        output_lines[insert_pos:insert_pos] = status_lines
        updated_count += 1

    # Write atomically
    tmp_fd, tmp_path = tempfile.mkstemp(dir=ROOT, suffix=".org.tmp")
    try:
        with open(tmp_path, "w") as f:
            f.writelines(output_lines)
        shutil.move(tmp_path, TODO_FILE)
    except Exception:
        os.unlink(tmp_path)
        raise

    print(f"  Updated {updated_count} entries")


if __name__ == "__main__":
    main()
