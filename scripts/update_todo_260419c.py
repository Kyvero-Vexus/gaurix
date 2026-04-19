#!/usr/bin/env python3
"""
Update todo_general_packages.org for deptree-resolver-260419c pass.
Marks resolved packages as DONE and blocked packages as BLOCKED.
"""

import json
import re
import sys

PASS_ID = "deptree-resolver-260419c"
TODO_FILE = "todo_general_packages.org"
REPORT_FILE = f"reports/{PASS_ID}-aur-lookup.json"

def main():
    # Load report
    with open(REPORT_FILE) as f:
        report = json.load(f)

    # Build lookup by entry number
    updates = {}
    for entry in report:
        num = entry["num"]
        if entry["status"] == "RESOLVED":
            updates[num] = f"DONE"
        else:
            reason = entry.get("reason", "NEEDS_RECIPE_DESIGN")
            detail = entry.get("detail", "no details")
            updates[num] = f"BLOCKED"
            # We'll store the blocker info to append
            updates[f"{num}_blocker"] = f"[BLOCKED: {reason}: {detail}]"

    print(f"Updating {len([k for k in updates if not str(k).endswith('_blocker')])} entries in {TODO_FILE}")

    # Read the file
    with open(TODO_FILE) as f:
        lines = f.readlines()

    # Process lines
    updated_count = 0
    new_lines = []
    for line in lines:
        m = re.match(r'^(\*\*\s+)(TODO|DONE|BLOCKED)(\s+)(\d+)(\.\s+\S+.*)', line)
        if m:
            prefix = m.group(1)
            old_status = m.group(2)
            spacing = m.group(3)
            num = int(m.group(4))
            rest = m.group(5)

            if num in updates and old_status == "TODO":
                new_status = updates[num]
                # Remove any existing tag and add our pass tag
                rest_clean = re.sub(r'\s+:[\w-]+:[\w-]*:', '', rest)
                if new_status == "DONE":
                    tag = f" :{PASS_ID}:recipe-generated:"
                    new_line = f"{prefix}{new_status}{spacing}{num}{rest_clean}{tag}\n"
                else:
                    blocker_key = f"{num}_blocker"
                    blocker = updates.get(blocker_key, "")
                    tag = f" :{PASS_ID}:"
                    new_line = f"{prefix}{new_status}{spacing}{num}{rest_clean}{tag} {blocker}\n"
                new_lines.append(new_line)
                updated_count += 1
                continue
        new_lines.append(line)

    # Write atomically via temp file
    tmp_file = TODO_FILE + ".tmp"
    with open(tmp_file, 'w') as f:
        f.writelines(new_lines)

    import os
    os.replace(tmp_file, TODO_FILE)
    print(f"Updated {updated_count} entries")

if __name__ == "__main__":
    main()
