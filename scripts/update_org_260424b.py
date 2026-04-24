#!/usr/bin/env python3
"""
Update todo_general_packages.org for deptree-resolver-260424b pass.
Adds status lines for resolved and blocked packages.
"""

import json
import re
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
TODO_FILE = ROOT / "todo_general_packages.org"
SELECTION_JSON = ROOT / "reports" / "deptree-resolver-260424b-selection.json"
SCM_FILE = ROOT / "guix" / "gaurix" / "packages" / "deptree-resolver-260424b.scm"
BLOCKED_NOTES = ROOT / "guix" / "gaurix" / "packages" / "deptree-resolver-260424b-blocked-notes.scm"

PASS_ID = "deptree-resolver-260424b"

# Load selection
sel = json.load(open(SELECTION_JSON))
selected_pkgs = {p["name"]: p for p in sel["packages"]}

# Parse the .scm to find which packages got recipes vs blocked
recipe_names = set()
with open(SCM_FILE) as f:
    for line in f:
        m = re.match(r'\(define-public\s+(\S+)', line)
        if m:
            # Convert guix name back to package name
            guix_name = m.group(1)
            recipe_names.add(guix_name)

# Parse blocked notes for reasons
blocked_reasons = {}
with open(BLOCKED_NOTES) as f:
    for line in f:
        m = re.match(r';;;\s+(\S+)\s+\(#\d+\):\s+(.*)', line)
        if m:
            blocked_reasons[m.group(1)] = m.group(2).strip()

# Map package names to guix names
def to_guix_name(name):
    return name.replace(".", "-dot-").replace("+", "-plus-").replace("_", "-")

# Determine status for each selected package
pkg_status = {}
for name, pkg in selected_pkgs.items():
    guix_name = to_guix_name(name)
    if guix_name in recipe_names:
        version = pkg.get("version", "")
        version = re.sub(r'^\d+:', '', version)
        version = re.sub(r'-\d+$', '', version)
        desc = pkg.get("description", "")[:60]
        pkg_status[name] = {
            "action": "DONE",
            "line": f"   - Status: DONE: Recipe in {PASS_ID}.scm ({PASS_ID})",
            "todo_line": f"   - TODO Status: DONE",
        }
    elif name in blocked_reasons:
        reason = blocked_reasons[name]
        pkg_status[name] = {
            "action": "BLOCKED",
            "line": f"   - Status: BLOCKED: {reason} ({PASS_ID})",
            "todo_line": f"   - TODO Status: BLOCKED",
        }
    else:
        pkg_status[name] = {
            "action": "BLOCKED",
            "line": f"   - Status: BLOCKED: unresolved ({PASS_ID})",
            "todo_line": f"   - TODO Status: BLOCKED",
        }

# Now update the org file
lines = []
with open(TODO_FILE, 'r') as f:
    lines = f.readlines()

output = []
i = 0
updated_count = 0
header_re = re.compile(r'^(\*\* (?:DONE|TODO|FAILED|BLOCKED|SKIPPED|NEEDS_RECIPE_DESIGN)\s+(\d+)\.\s+(\S+))')

while i < len(lines):
    line = lines[i]
    m = header_re.match(line)
    if m:
        pkg_name = m.group(3)
        if pkg_name in pkg_status:
            status = pkg_status[pkg_name]
            # Find the end of this entry (next header or EOF)
            entry_lines = [line]
            j = i + 1
            while j < len(lines) and not header_re.match(lines[j]):
                entry_lines.append(lines[j])
                j += 1

            # Update header if resolving
            if status["action"] == "DONE":
                # Change header from BLOCKED/FAILED to DONE
                old_header = entry_lines[0]
                new_header = re.sub(r'^(\*\* )(?:BLOCKED|FAILED|SKIPPED|TODO|NEEDS_RECIPE_DESIGN)', r'\1DONE', old_header)
                # Add tag
                new_header = new_header.rstrip()
                if f":{PASS_ID}:" not in new_header:
                    new_header = new_header.rstrip() + f"  :{PASS_ID}:recipe-generated:\n"
                else:
                    new_header = new_header + "\n"
                entry_lines[0] = new_header

            # Append status lines before the end
            entry_lines.append(status["line"] + "\n")
            entry_lines.append(status["todo_line"] + "\n")

            output.extend(entry_lines)
            updated_count += 1
            i = j
            continue
        else:
            output.append(line)
            i += 1
    else:
        output.append(line)
        i += 1

# Write atomically
import tempfile, os
tmp = TODO_FILE.with_suffix('.tmp')
with open(tmp, 'w') as f:
    f.writelines(output)
os.replace(str(tmp), str(TODO_FILE))

print(f"Updated {updated_count} entries in {TODO_FILE}")
done_count = sum(1 for s in pkg_status.values() if s["action"] == "DONE")
blocked_count = sum(1 for s in pkg_status.values() if s["action"] == "BLOCKED")
print(f"  DONE: {done_count}")
print(f"  BLOCKED: {blocked_count}")
