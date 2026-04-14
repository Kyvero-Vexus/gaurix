#!/usr/bin/env python3
"""Update todo_general_packages.org with deptree-resolver-260414q results.

For resolved packages: append DONE status, update TODO Status to DONE.
For blocked packages: append BLOCKED status with reason code.

Deterministic full-file transform: read all, update in memory, write temp, atomic move.
"""

import json
import os
import re
import shutil
import tempfile
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
TODO_FILE = ROOT / "todo_general_packages.org"
SUMMARY = ROOT / "reports" / "deptree-resolver-260414q-summary.json"
PASS_ID = "deptree-resolver-260414q"


def load_summary():
    with open(SUMMARY) as f:
        return json.load(f)


def main():
    summary = load_summary()

    # Build lookup: entry_number -> action
    resolved = {}
    for r in summary["recipes"]:
        resolved[r["number"]] = {
            "guix_name": r["guix_name"],
            "version": r["version"],
            "build_system": r["build_system"],
            "aur_name": r["aur_name"],
        }

    blocked = {}
    for b in summary["blocked"]:
        blocked[b["number"]] = {
            "category": b["category"],
            "reason": b["reason"],
            "aur_name": b["aur_name"],
        }

    all_numbers = set(resolved.keys()) | set(blocked.keys())

    # Read entire file
    with open(TODO_FILE) as f:
        lines = f.readlines()

    # Process line by line
    output_lines = []
    current_number = None
    current_name = None
    i = 0
    updated_resolved = 0
    updated_blocked = 0

    while i < len(lines):
        line = lines[i]

        # Match entry headers
        m = re.match(r"^(\*\*\s+)(\S+)(\s+)(\d+)\.\s+(\S+)(.*)", line)
        if m:
            prefix = m.group(1)
            old_status = m.group(2)
            space = m.group(3)
            entry_num = int(m.group(4))
            pkg_name = m.group(5)
            rest = m.group(6)
            current_number = entry_num
            current_name = pkg_name

            if entry_num in resolved:
                # Update header to DONE
                r = resolved[entry_num]
                new_header = f"{prefix}DONE{space}{entry_num}. {pkg_name}{rest}\n"
                output_lines.append(new_header)
                i += 1

                # Copy existing lines until next entry or end
                # Find and update/add status lines
                todo_status_updated = False
                done_status_added = False

                while i < len(lines):
                    next_line = lines[i]
                    # Check if we hit next entry
                    if re.match(r"^\*\*\s+", next_line):
                        break

                    # Update existing TODO Status line
                    if re.match(r"\s+-\s+TODO Status:", next_line) and not todo_status_updated:
                        output_lines.append(next_line)  # Keep existing
                        # Add new TODO Status and DONE status after
                        output_lines.append(f"   - TODO Status: DONE\n")
                        output_lines.append(f"\n")
                        output_lines.append(f"   - Status: DONE: Recipe added in {PASS_ID}.scm ({r['guix_name']} v{r['version']}, {r['build_system']}-build-system) ({PASS_ID})\n")
                        todo_status_updated = True
                        done_status_added = True
                        i += 1
                        continue

                    output_lines.append(next_line)
                    i += 1

                # If no TODO Status line was found, add one at the end of entry
                if not todo_status_updated:
                    output_lines.append(f"   - TODO Status: DONE\n")
                    output_lines.append(f"   - Status: DONE: Recipe added in {PASS_ID}.scm ({r['guix_name']} v{r['version']}, {r['build_system']}-build-system) ({PASS_ID})\n")
                    output_lines.append(f"\n")

                updated_resolved += 1
                continue

            elif entry_num in blocked:
                # Keep header as-is (still BLOCKED)
                b = blocked[entry_num]
                output_lines.append(line)
                i += 1

                # Copy existing lines until next entry
                last_status_idx = len(output_lines)
                while i < len(lines):
                    next_line = lines[i]
                    if re.match(r"^\*\*\s+", next_line):
                        break
                    output_lines.append(next_line)
                    i += 1

                # Append new blocked status
                output_lines.append(f"   - Status: BLOCKED: {b['category']}: {b['reason']} ({PASS_ID})\n")
                output_lines.append(f"\n")
                updated_blocked += 1
                continue

        output_lines.append(line)
        i += 1

    # Write atomically
    fd, tmp_path = tempfile.mkstemp(dir=TODO_FILE.parent, suffix=".org.tmp")
    try:
        with os.fdopen(fd, "w") as f:
            f.writelines(output_lines)
        shutil.move(tmp_path, TODO_FILE)
        print(f"Updated {TODO_FILE}")
        print(f"  Resolved (DONE): {updated_resolved}")
        print(f"  Blocked (updated): {updated_blocked}")
        print(f"  Total entries processed: {updated_resolved + updated_blocked}")
    except Exception:
        os.unlink(tmp_path)
        raise


if __name__ == "__main__":
    main()
