#!/usr/bin/env python3
"""Update todo_general_packages.org for deptree-resolver-260417aj pass.

Deterministic full-file transform: read, compute, write temp, atomic move.
"""

import json
import re
import shutil
import tempfile
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
TODO_FILE = ROOT / "todo_general_packages.org"
SUMMARY = ROOT / "reports" / "deptree-resolver-260417aj-summary.json"
PASS_ID = "deptree-resolver-260417aj"

# Load summary
with open(SUMMARY) as f:
    summary = json.load(f)

resolved_names = {r["name"] for r in summary["resolved_packages"]}
resolved_map = {r["name"]: r for r in summary["resolved_packages"]}
blocked_map = {b["name"]: b["reason"] for b in summary["blocked_packages"]}

# Read the full org file
with open(TODO_FILE, "r") as f:
    lines = f.readlines()

output = []
i = 0
updated_resolved = 0
updated_blocked = 0

while i < len(lines):
    line = lines[i]

    # Match BLOCKED heading
    m = re.match(r'^(\*\*\s+)BLOCKED(\s+\d+\.\s+)(\S+)(.*)', line)
    if m:
        prefix = m.group(1)
        num_part = m.group(2)
        name = m.group(3)
        rest = m.group(4)

        if name in resolved_names:
            # Change BLOCKED to DONE
            output.append(f"{prefix}DONE{num_part}{name}{rest}\n")
            # Collect body lines until next heading
            i += 1
            while i < len(lines) and not lines[i].startswith("** "):
                output.append(lines[i])
                i += 1
            # Add resolution status
            pkg_info = resolved_map[name]
            output.append(f"   - Status: DONE: recipe in {PASS_ID}.scm ({name} v{pkg_info['version']}, {pkg_info['method']})\n")
            output.append(f"   - TODO Status: DONE\n")
            output.append(f"\n")
            updated_resolved += 1
            continue

        elif name in blocked_map:
            # Keep BLOCKED heading but strip old inline reason
            # Only update with new reason line, keep heading as-is
            output.append(line)
            # Collect body lines
            i += 1
            while i < len(lines) and not lines[i].startswith("** "):
                output.append(lines[i])
                i += 1
            # Add updated blocked status
            reason = blocked_map[name]
            output.append(f"   - Status: BLOCKED: {reason} ({PASS_ID})\n")
            output.append(f"\n")
            updated_blocked += 1
            continue

    output.append(line)
    i += 1

# Write atomically via temp file
tmp = tempfile.NamedTemporaryFile(mode="w", dir=TODO_FILE.parent,
                                  prefix=".todo-", suffix=".org",
                                  delete=False)
try:
    tmp.writelines(output)
    tmp.close()
    shutil.move(tmp.name, TODO_FILE)
except Exception:
    Path(tmp.name).unlink(missing_ok=True)
    raise

print(f"[{PASS_ID}] Updated todo_general_packages.org:")
print(f"  Resolved: {updated_resolved} packages changed BLOCKED -> DONE")
print(f"  Blocked: {updated_blocked} packages updated with new status")
