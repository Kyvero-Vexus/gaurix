#!/usr/bin/env python3
"""
Update todo_general_packages.org for recipe-resolver-260417af batch.
Changes TODO entries to DONE (for successes) or BLOCKED (for failures).
"""

import json
import os
import re
import shutil
import tempfile

BASE = "/home/slime/projects/gaurix"
RESULTS_FILE = os.path.join(BASE, "reports", "recipe-resolver-260417af-results.json")
TODO_FILE = os.path.join(BASE, "todo_general_packages.org")

with open(RESULTS_FILE) as f:
    results = json.load(f)

# Build lookup by entry number
updates = {}
for r in results['success']:
    updates[r['entry_num']] = {
        'status': 'DONE',
        'aur_name': r['aur_name'],
        'detail': f"DONE: recipe in recipe-resolver-260417af.scm ({r['aur_name']} v{r['version']}, pyproject-build-system, {r['license'].replace('license:', '')})"
    }
for r in results['failed']:
    updates[r['entry_num']] = {
        'status': 'BLOCKED',
        'aur_name': r['aur_name'],
        'detail': f"BLOCKED: {r['reason']}: {r['detail']} (recipe-resolver-260417af)"
    }

print(f"Loading {TODO_FILE}...")
with open(TODO_FILE, 'r') as f:
    lines = f.readlines()

print(f"File has {len(lines)} lines. Applying {len(updates)} updates...")

changes = 0
i = 0
while i < len(lines):
    line = lines[i]
    # Match TODO header lines like: ** TODO 15287. python-hurry-filesize
    m = re.match(r'^(\*\* )TODO( \d+\. .+)$', line)
    if m:
        # Extract entry number
        num_match = re.search(r'(\d+)\.', m.group(2))
        if num_match:
            entry_num = int(num_match.group(1))
            if entry_num in updates:
                upd = updates[entry_num]
                new_status = upd['status']
                # Replace TODO with DONE or BLOCKED in the header
                lines[i] = f"{m.group(1)}{new_status}{m.group(2)}\n"
                # Add status line after the header
                # Find the next non-empty line or the next ** header
                insert_idx = i + 1
                # Insert status detail
                status_line = f"   - Status: {upd['detail']}\n"
                lines.insert(insert_idx, status_line)
                changes += 1
                i += 1  # skip the inserted line
    i += 1

print(f"Applied {changes} updates.")

# Write to temp file then atomic move
fd, tmp_path = tempfile.mkstemp(dir=os.path.dirname(TODO_FILE), suffix='.org.tmp')
with os.fdopen(fd, 'w') as f:
    f.writelines(lines)
shutil.move(tmp_path, TODO_FILE)
print(f"Saved {TODO_FILE}")
