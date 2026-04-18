#!/usr/bin/env python3
"""Update todo_general_packages.org for deptree-resolver-260418ab pass.

Reads the summary to determine which packages were resolved, failed, or still blocked,
then updates the org file heading statuses and adds status lines.

IMPORTANT: Matches by BOTH package name AND entry number to avoid updating
duplicate entries with the same name but different numbers.

For resolved packages: heading stays DONE, removes [BLOCKED: ...] tag, adds resolver status
For failed packages: heading changes to FAILED, adds failure reason
For still-blocked packages: heading stays as-is, adds re-evaluation note
"""

import json
import re
import tempfile
import shutil
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
TODO_FILE = ROOT / "todo_general_packages.org"
SUMMARY = ROOT / "reports" / "deptree-resolver-260418ab-summary.json"
PASS_ID = "deptree-resolver-260418ab"


def main():
    with open(SUMMARY) as f:
        summary = json.load(f)

    # Build lookup dicts keyed by (name, number)
    resolved_set = {(p["name"], p["number"]) for p in summary["resolved_packages"]}
    failed_lookup = {(p["name"], p["number"]): p["reason"] for p in summary["failed_packages"]}
    blocked_lookup = {(p["name"], p["number"]): p["reason"] for p in summary["still_blocked_packages"]}

    all_keys = resolved_set | set(failed_lookup.keys()) | set(blocked_lookup.keys())

    print(f"[{PASS_ID}] Updating {len(all_keys)} entries in todo_general_packages.org")
    print(f"  Resolved: {len(resolved_set)}, Failed: {len(failed_lookup)}, Blocked: {len(blocked_lookup)}")

    lines = []
    with open(TODO_FILE, "r") as f:
        lines = f.readlines()

    new_lines = []
    i = 0
    updated = 0

    while i < len(lines):
        line = lines[i]
        m = re.match(r"^(\*\*\s+)(\w+)(\s+)(\d+)(\.\s+)(\S+)(.*)", line)

        if m:
            prefix = m.group(1)
            old_status = m.group(2)
            space = m.group(3)
            number = int(m.group(4))
            dot_space = m.group(5)
            name = m.group(6)
            rest = m.group(7)

            key = (name, number)

            if key in all_keys:
                # Remove [BLOCKED: ...] from rest
                rest_cleaned = re.sub(r"\s*\[BLOCKED:[^\]]*\]", "", rest)

                if key in resolved_set:
                    tag_part = f"  :{PASS_ID}:recipe-generated:"
                    new_heading = f"{prefix}DONE{space}{number}{dot_space}{name}{rest_cleaned}{tag_part}\n"
                    new_lines.append(new_heading)
                    i += 1
                    while i < len(lines) and not lines[i].startswith("** "):
                        new_lines.append(lines[i])
                        i += 1
                    new_lines.append(f"   - Status: DONE: Recipe generated in {PASS_ID}.scm ({PASS_ID})\n")
                    updated += 1
                    continue

                elif key in failed_lookup:
                    reason = failed_lookup[key]
                    reason_code = reason.split(":")[0].strip()
                    tag_part = f"  :{PASS_ID}:"
                    new_heading = f"{prefix}FAILED{space}{number}{dot_space}{name} [FAILED: {reason_code}]{tag_part}\n"
                    new_lines.append(new_heading)
                    i += 1
                    while i < len(lines) and not lines[i].startswith("** "):
                        new_lines.append(lines[i])
                        i += 1
                    new_lines.append(f"   - Status: FAILED: {reason} ({PASS_ID})\n")
                    updated += 1
                    continue

                elif key in blocked_lookup:
                    reason = blocked_lookup[key]
                    new_lines.append(line)
                    i += 1
                    while i < len(lines) and not lines[i].startswith("** "):
                        new_lines.append(lines[i])
                        i += 1
                    new_lines.append(f"   - Status: BLOCKED: {reason} ({PASS_ID})\n")
                    updated += 1
                    continue

        new_lines.append(line)
        i += 1

    print(f"  Updated {updated} entries")

    # Atomic write
    tmp = tempfile.NamedTemporaryFile(mode='w', dir=ROOT, suffix='.org', delete=False)
    tmp.writelines(new_lines)
    tmp.close()
    shutil.move(tmp.name, TODO_FILE)
    print(f"  Wrote {TODO_FILE}")


if __name__ == "__main__":
    main()
