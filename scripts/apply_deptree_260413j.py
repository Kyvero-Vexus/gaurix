#!/usr/bin/env python3
"""
Apply deptree-resolver-260413j results to todo_general_packages.org.
Updates status for all 100 selected packages:
- Recipe packages → DONE
- Blocked packages → BLOCKED with updated reason
"""

import json
import os
import re
import shutil
import tempfile

BASE = "/home/slime/projects/gaurix"
TODO_FILE = os.path.join(BASE, "todo_general_packages.org")
SELECTION_JSON = os.path.join(BASE, "reports/deptree-resolver-260413j-selection.json")
SUMMARY_JSON = os.path.join(BASE, "reports/deptree-resolver-260413j-summary.json")
SCM_FILE = os.path.join(BASE, "guix/gaurix/packages/deptree-resolver-260413j.scm")
BLOCKED_NOTES = os.path.join(BASE, "guix/gaurix/packages/deptree-resolver-260413j-blocked-notes.scm")

RUN_ID = "deptree-resolver-260413j"

with open(SUMMARY_JSON) as f:
    summary = json.load(f)

recipe_names = set(summary["recipe_names"])

# Build blocked map from the notes file
blocked_map = {}
with open(BLOCKED_NOTES) as f:
    content = f.read()
for m in re.finditer(r';;; \[(\w+)\] (.+?) \(#(\d+)\)\n;;;   (.+)', content):
    reason, name, num, details = m.groups()
    blocked_map[name] = (reason, details)

print(f"Recipe names ({len(recipe_names)}): {sorted(recipe_names)}")
print(f"Blocked names ({len(blocked_map)}): {len(blocked_map)}")

# Read entire todo file
with open(TODO_FILE, 'r') as f:
    lines = f.readlines()

# Process
updated_done = 0
updated_blocked = 0
i = 0
while i < len(lines):
    line = lines[i]
    header_re = re.compile(r'^(\*\*\s+)BLOCKED(\s+\d+\.\s+)(.+?)(\s+\[.*\])?\s*$')
    m = header_re.match(line)
    if m:
        prefix = m.group(1)
        num_part = m.group(2)
        name = m.group(3).strip()
        tags = m.group(4) or ""

        if name in recipe_names:
            # Change to DONE
            lines[i] = f"{prefix}DONE{num_part}{name}{tags}\n"
            # Find the status line and update it
            j = i + 1
            found_status = False
            while j < len(lines) and not lines[j].startswith('** '):
                if lines[j].strip().startswith('- Status:'):
                    lines[j] = f"   - Status: DONE: recipe in {RUN_ID}.scm ({name}, copy/source build, placeholder hash)\n"
                    found_status = True
                    break
                elif lines[j].strip().startswith('- TODO Status:'):
                    lines[j] = f"   - TODO Status: DONE\n"
                j += 1
            if not found_status:
                # Insert status after header
                lines.insert(i + 1, f"   - Status: DONE: recipe in {RUN_ID}.scm ({name}, copy/source build, placeholder hash)\n")
            updated_done += 1

        elif name in blocked_map:
            reason, details = blocked_map[name]
            # Keep as BLOCKED but update status
            j = i + 1
            found_status = False
            while j < len(lines) and not lines[j].startswith('** '):
                if lines[j].strip().startswith('- Status:'):
                    lines[j] = f"   - Status: BLOCKED [{reason}]: {details} ({RUN_ID})\n"
                    found_status = True
                    break
                j += 1
            if not found_status:
                lines.insert(i + 1, f"   - Status: BLOCKED [{reason}]: {details} ({RUN_ID})\n")
            updated_blocked += 1

    i += 1

# Write atomically
tmp = TODO_FILE + ".tmp"
with open(tmp, 'w') as f:
    f.writelines(lines)
shutil.move(tmp, TODO_FILE)

print(f"\nUpdated {updated_done} packages to DONE")
print(f"Updated {updated_blocked} packages with BLOCKED reasons")
print(f"Total updated: {updated_done + updated_blocked}")
