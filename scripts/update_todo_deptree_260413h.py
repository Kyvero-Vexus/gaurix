#!/usr/bin/env python3
"""
Update todo_general_packages.org for deptree-resolver-260413h.
- 22 recipe packages: BLOCKED → DONE, add status line
- 78 blocked packages: keep BLOCKED, add status line with reason code
"""

import json
import os
import re
import shutil

BASE = "/home/slime/projects/gaurix"
TODO_FILE = os.path.join(BASE, "todo_general_packages.org")
SUMMARY_JSON = os.path.join(BASE, "reports/deptree-resolver-260413h-summary.json")
SELECTION_JSON = os.path.join(BASE, "reports/deptree-resolver-260413h-selection.json")
BLOCKED_NOTES = os.path.join(BASE, "guix/gaurix/packages/deptree-resolver-260413h-blocked-notes.scm")

RUN_ID = "deptree-resolver-260413h"

# Load data
with open(SUMMARY_JSON, 'r') as f:
    summary = json.load(f)
recipe_names = set(summary["recipe_names"])

with open(SELECTION_JSON, 'r') as f:
    selection = json.load(f)

# Build lookup: name -> (number, action)
pkg_action = {}
for pkg in selection["packages"]:
    name = pkg["name"]
    if name in recipe_names:
        pkg_action[name] = "done"
    else:
        pkg_action[name] = "blocked"

# Load blocked reasons
blocked_reasons = {}
with open(BLOCKED_NOTES, 'r') as f:
    for line in f:
        m = re.match(r'^;;;\s+\[(\S+)\]\s+(\S+)\s+\(#\d+\)', line)
        if m:
            blocked_reasons[m.group(2)] = m.group(1)

# Process org file
with open(TODO_FILE, 'r') as f:
    lines = f.readlines()

header_re = re.compile(r'^(\*\*\s+)BLOCKED(\s+\d+\.\s+)(.+?)(\s+\[.*\])?\s*$')

output = []
i = 0
done_count = 0
blocked_count = 0

while i < len(lines):
    line = lines[i]
    m = header_re.match(line)

    if m:
        prefix = m.group(1)      # "** "
        num_part = m.group(2)    # " 123. "
        name = m.group(3).strip()
        bracket = m.group(4) or ""

        if name in pkg_action:
            action = pkg_action[name]

            if action == "done":
                # Change BLOCKED → DONE
                output.append(f"{prefix}DONE{num_part}{name}{bracket}\n")
                done_count += 1
                i += 1
                # Copy all body lines until next header
                while i < len(lines) and not lines[i].startswith('** '):
                    output.append(lines[i])
                    i += 1
                # Append new status line at end of this entry
                output.append(f"   - Status: DONE: Recipe created in {RUN_ID}; placeholder hash; needs `guix download` for real hash\n")
                continue

            elif action == "blocked":
                # Keep header as-is
                output.append(line)
                blocked_count += 1
                reason = blocked_reasons.get(name, "NEEDS_RECIPE_DESIGN")
                i += 1
                # Copy all body lines until next header
                while i < len(lines) and not lines[i].startswith('** '):
                    output.append(lines[i])
                    i += 1
                # Append status line
                output.append(f"   - Status: BLOCKED: {reason} ({RUN_ID})\n")
                continue
        else:
            output.append(line)
    else:
        output.append(line)

    i += 1

# Atomic write
tmp = TODO_FILE + ".tmp"
with open(tmp, 'w') as f:
    f.writelines(output)
shutil.move(tmp, TODO_FILE)

print(f"Updated {TODO_FILE}")
print(f"  BLOCKED → DONE: {done_count} packages")
print(f"  BLOCKED (updated): {blocked_count} packages")
print(f"  Total processed: {done_count + blocked_count}")
