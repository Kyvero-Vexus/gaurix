#!/usr/bin/env python3
"""Update todo_general_packages.org for recipe-resolver-260417u results.

Reads the summary JSON, then does a deterministic full-file transform of the
todo file: for each package processed, change '** TODO N.' to '** DONE N.'
(or '** BLOCKED N.' for blocked packages) and append a status line.
"""

import json
import os
import re
import shutil
import tempfile

BATCH_ID = "recipe-resolver-260417u"
TODO_FILE = "todo_general_packages.org"

def load_summary():
    with open(f"reports/{BATCH_ID}-summary.json") as f:
        return json.load(f)

def main():
    summary = load_summary()

    # Build lookup by entry number
    done_nums = {}
    for gname, details in summary["recipe_details"].items():
        num = details["num"]
        cat = details["category"]
        ver = details["version"]
        done_nums[num] = {
            "gname": gname,
            "category": cat,
            "version": ver,
            "status": "DONE",
        }

    blocked_nums = {}
    for bname, reason in summary["blocked_details"].items():
        # Find the num for this blocked package
        for pkg_data in json.load(open("/tmp/selected_260417u.json")):
            if pkg_data["name"] == bname:
                blocked_nums[pkg_data["num"]] = {
                    "name": bname,
                    "reason": reason,
                    "status": "BLOCKED",
                }
                break

    with open(TODO_FILE, "r") as f:
        lines = f.readlines()

    new_lines = []
    i = 0
    while i < len(lines):
        line = lines[i]

        # Match TODO entry headers
        m = re.match(r'^(\*\* )TODO (\d+)\. (.+)$', line)
        if m:
            prefix = m.group(1)
            num = int(m.group(2))
            pkg_name = m.group(3).strip()

            if num in done_nums:
                info = done_nums[num]
                # Replace TODO with DONE
                new_lines.append(f"{prefix}DONE {num}. {pkg_name}\n")
                i += 1
                # Copy existing content lines until next header
                while i < len(lines) and not lines[i].startswith("** "):
                    new_lines.append(lines[i])
                    i += 1
                # Append status line before the next header
                status_line = f"   - Status: DONE: recipe in {BATCH_ID}.scm ({info['gname']} v{info['version']}, {info['category']})\n"
                new_lines.append(status_line)
                continue

            elif num in blocked_nums:
                info = blocked_nums[num]
                # Replace TODO with BLOCKED
                new_lines.append(f"{prefix}BLOCKED {num}. {pkg_name}\n")
                i += 1
                # Copy existing content
                while i < len(lines) and not lines[i].startswith("** "):
                    new_lines.append(lines[i])
                    i += 1
                # Append blocker status
                reason_short = info["reason"][:200]
                status_line = f"   - Status: BLOCKED: {reason_short} ({BATCH_ID})\n"
                new_lines.append(status_line)
                continue

        new_lines.append(line)
        i += 1

    # Atomic write
    fd, tmp_path = tempfile.mkstemp(dir=os.path.dirname(TODO_FILE) or '.', suffix='.org.tmp')
    try:
        with os.fdopen(fd, 'w') as f:
            f.writelines(new_lines)
        shutil.move(tmp_path, TODO_FILE)
        print(f"Updated {TODO_FILE}: {len(done_nums)} DONE, {len(blocked_nums)} BLOCKED")
    except Exception as e:
        os.unlink(tmp_path)
        raise e


if __name__ == "__main__":
    main()
