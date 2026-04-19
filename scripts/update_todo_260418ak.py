#!/usr/bin/env python3
"""Update todo_general_packages.org for deptree-resolver-260418ak.

Deterministic transform: read full file, apply changes, write temp, atomic move.
"""

import json
import re
import shutil
import tempfile
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
TODO_FILE = ROOT / "todo_general_packages.org"
SUMMARY = ROOT / "reports" / "deptree-resolver-260418ak-summary.json"
PASS_ID = "deptree-resolver-260418ak"

with open(SUMMARY) as f:
    summary = json.load(f)

# Build lookup maps
resolved_map = {}
for p in summary["resolved_packages"]:
    resolved_map[p["name"]] = p

failed_map = {}
for p in summary["failed_packages"]:
    failed_map[p["name"]] = p

print(f"[{PASS_ID}] Updating todo_general_packages.org")
print(f"  Resolved: {len(resolved_map)}")
print(f"  Failed: {len(failed_map)}")

# Read the file
with open(TODO_FILE, "r") as f:
    lines = f.readlines()

output_lines = []
i = 0
changes = 0
seen_numbers = set()

while i < len(lines):
    line = lines[i]

    # Match BLOCKED heading
    m = re.match(r"^(\*\*\s+)BLOCKED(\s+(\d+)\.\s+(\S+).*)", line)
    if m:
        prefix = m.group(1)
        suffix = m.group(2)
        number = int(m.group(3))
        name = m.group(4)

        # Skip duplicate headings for same package
        key = f"{number}:{name}"
        if key in seen_numbers:
            # Skip this duplicate heading and its body lines
            i += 1
            while i < len(lines) and not lines[i].startswith("** "):
                i += 1
            changes += 1
            continue
        seen_numbers.add(key)

        if name in resolved_map:
            pkg = resolved_map[name]
            new_heading = f"{prefix}DONE{suffix}\n"
            output_lines.append(new_heading)
            i += 1
            # Copy body lines until next heading
            while i < len(lines) and not lines[i].startswith("** "):
                output_lines.append(lines[i])
                i += 1
            # Add status line
            output_lines.append(
                f"   - Status: DONE: Recipe in {PASS_ID}.scm "
                f"({name} v{pkg['version']}, {pkg['build_system']}-build-system) "
                f"({PASS_ID})\n"
            )
            changes += 1
        elif name in failed_map:
            pkg = failed_map[name]
            new_heading = f"{prefix}FAILED{suffix}\n"
            output_lines.append(new_heading)
            i += 1
            # Copy body lines until next heading
            while i < len(lines) and not lines[i].startswith("** "):
                output_lines.append(lines[i])
                i += 1
            # Add status line
            reason = pkg["reason"]
            output_lines.append(
                f"   - Status: FAILED: {reason} ({PASS_ID})\n"
            )
            changes += 1
        else:
            output_lines.append(line)
            i += 1
    else:
        output_lines.append(line)
        i += 1

print(f"  Applied {changes} changes")

# Atomic write: write to temp then move
with tempfile.NamedTemporaryFile(
    mode="w", dir=str(TODO_FILE.parent), suffix=".tmp", delete=False
) as tmp:
    tmp.writelines(output_lines)
    tmp_path = tmp.name

shutil.move(tmp_path, str(TODO_FILE))
print(f"  Wrote {TODO_FILE}")
