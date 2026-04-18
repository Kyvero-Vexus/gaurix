#!/usr/bin/env python3
"""Update todo_general_packages.org for deptree-resolver-260418ad.

Deterministic full-file transform: read, compute, write temp, atomic move.

For RESOLVED packages: FAILED → DONE with :deptree-resolver-260418ad:recipe-generated: tag
For FAILED packages: FAILED → FAILED with [FAILED: REASON_CODE] tag
"""

import json
import re
import tempfile
import shutil
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
TODO_FILE = ROOT / "todo_general_packages.org"
SUMMARY = ROOT / "reports" / "deptree-resolver-260418ad-summary.json"
PASS_ID = "deptree-resolver-260418ad"

with open(SUMMARY) as f:
    summary = json.load(f)

resolved_names = {p["name"] for p in summary["resolved_packages"]}
failed_map = {p["name"]: p["reason"] for p in summary["failed_packages"]}

# Build lookup: number -> action
resolved_numbers = {p["number"]: p["name"] for p in summary["resolved_packages"]}
failed_numbers = {p["number"]: p for p in summary["failed_packages"]}

with open(TODO_FILE, "r") as f:
    lines = f.readlines()

updated_resolved = 0
updated_failed = 0
new_lines = []
i = 0
while i < len(lines):
    line = lines[i]

    # Check if this is a FAILED heading we need to update
    m = re.match(r"^(\*\*\s+)FAILED(\s+)(\d+)\.\s+(\S+)(.*)\n?$", line)
    if m:
        prefix = m.group(1)
        spacing = m.group(2)
        number = int(m.group(3))
        name = m.group(4)
        rest = m.group(5)

        if name in resolved_names:
            # Change FAILED → DONE with tags
            new_line = f"{prefix}DONE{spacing}{number}. {name}  :{PASS_ID}:recipe-generated:\n"
            new_lines.append(new_line)

            # Read body until next heading
            i += 1
            body_lines = []
            while i < len(lines) and not lines[i].startswith("** "):
                body_lines.append(lines[i])
                i += 1

            # Append existing body
            new_lines.extend(body_lines)

            # Add status line before next heading
            new_lines.append(f"\n   - Status: DONE: Recipe generated in {PASS_ID}.scm ({PASS_ID})\n")
            updated_resolved += 1
            continue

        elif name in failed_map:
            reason = failed_map[name]
            reason_code = reason.split(":")[0].strip()
            # Change heading to include [FAILED: REASON_CODE] tag
            new_line = f"{prefix}FAILED{spacing}{number}. {name} [FAILED: {reason_code}]  :{PASS_ID}:\n"
            new_lines.append(new_line)

            # Read body until next heading
            i += 1
            body_lines = []
            while i < len(lines) and not lines[i].startswith("** "):
                body_lines.append(lines[i])
                i += 1

            # Append existing body
            new_lines.extend(body_lines)

            # Add status line
            new_lines.append(f"\n   - Status: FAILED: {reason} ({PASS_ID})\n")
            updated_failed += 1
            continue

    new_lines.append(line)
    i += 1

print(f"[{PASS_ID}] Updated {updated_resolved} FAILED→DONE, {updated_failed} FAILED→FAILED[reason]")

# Write with atomic move
tmp = tempfile.NamedTemporaryFile(mode="w", dir=TODO_FILE.parent, suffix=".org", delete=False)
try:
    tmp.writelines(new_lines)
    tmp.flush()
    shutil.move(tmp.name, TODO_FILE)
except Exception:
    Path(tmp.name).unlink(missing_ok=True)
    raise

print(f"[{PASS_ID}] Wrote {TODO_FILE}")
