#!/usr/bin/env python3
"""Bookkeeping for deptree-resolver-260418ai.

Updates todo_general_packages.org:
- Resolved packages: TODO -> DONE with recipe-generated tag
- Failed packages: TODO -> FAILED with reason
- Still blocked packages: keep TODO, add BLOCKED status note
"""

import json
import re
import shutil
import tempfile
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
TODO_FILE = ROOT / "todo_general_packages.org"
SUMMARY_FILE = ROOT / "reports" / "deptree-resolver-260418ai-summary.json"
PASS_ID = "deptree-resolver-260418ai"


def load_summary():
    with open(SUMMARY_FILE) as f:
        return json.load(f)


def update_todo(summary):
    """Update todo_general_packages.org with status changes."""
    # Build lookup by package number
    resolved_nums = {r["number"]: r for r in summary["resolved_packages"]}
    failed_nums = {f["number"]: f for f in summary["failed_packages"]}
    blocked_nums = {b["number"]: b for b in summary["still_blocked_packages"]}

    all_nums = set(resolved_nums) | set(failed_nums) | set(blocked_nums)

    with open(TODO_FILE, "r") as f:
        lines = f.readlines()

    new_lines = []
    i = 0
    changes = 0

    while i < len(lines):
        line = lines[i]

        # Match TODO header
        m = re.match(r"^(\*\*\s+)TODO(\s+(\d+)\.\s+(\S+))(.*)", line)
        if m:
            prefix = m.group(1)
            suffix = m.group(2)
            number = int(m.group(3))
            name = m.group(4)
            rest = m.group(5)

            if number not in all_nums:
                new_lines.append(line)
                i += 1
                continue

            if number in resolved_nums:
                info = resolved_nums[number]
                # Change to DONE with tag
                new_lines.append(f"{prefix}DONE{suffix}  :{PASS_ID}:recipe-generated:\n")
                i += 1
                # Copy body, update TODO Status if found
                inserted_status = False
                while i < len(lines):
                    current = lines[i]
                    if current.startswith("** "):
                        if not inserted_status:
                            new_lines.append(f"   - Status: DONE: recipe in {PASS_ID}.scm ({PASS_ID})\n")
                        break
                    elif current.strip().startswith("- TODO Status:"):
                        new_lines.append(f"   - TODO Status: DONE\n")
                        new_lines.append(f"   - Status: DONE: recipe in {PASS_ID}.scm ({PASS_ID})\n")
                        inserted_status = True
                        i += 1
                    else:
                        new_lines.append(current)
                        i += 1
                else:
                    if not inserted_status:
                        new_lines.append(f"   - Status: DONE: recipe in {PASS_ID}.scm ({PASS_ID})\n")
                changes += 1
                continue

            elif number in failed_nums:
                info = failed_nums[number]
                reason = info["reason"]
                new_lines.append(f"{prefix}FAILED{suffix}\n")
                i += 1
                inserted_status = False
                while i < len(lines):
                    current = lines[i]
                    if current.startswith("** "):
                        if not inserted_status:
                            new_lines.append(f"   - Status: FAILED: {reason} ({PASS_ID})\n")
                        break
                    elif current.strip().startswith("- TODO Status:"):
                        new_lines.append(f"   - TODO Status: FAILED\n")
                        new_lines.append(f"   - Status: FAILED: {reason} ({PASS_ID})\n")
                        inserted_status = True
                        i += 1
                    else:
                        new_lines.append(current)
                        i += 1
                else:
                    if not inserted_status:
                        new_lines.append(f"   - Status: FAILED: {reason} ({PASS_ID})\n")
                changes += 1
                continue

            elif number in blocked_nums:
                info = blocked_nums[number]
                reason = info["reason"]
                # Keep as TODO but add BLOCKED status note
                new_lines.append(line)
                i += 1
                inserted_status = False
                while i < len(lines):
                    current = lines[i]
                    if current.startswith("** "):
                        if not inserted_status:
                            new_lines.append(f"   - Status: BLOCKED: {reason} ({PASS_ID})\n")
                        break
                    elif current.strip().startswith("- TODO Status:"):
                        new_lines.append(f"   - TODO Status: BLOCKED\n")
                        new_lines.append(f"   - Status: BLOCKED: {reason} ({PASS_ID})\n")
                        inserted_status = True
                        i += 1
                    else:
                        new_lines.append(current)
                        i += 1
                else:
                    if not inserted_status:
                        new_lines.append(f"   - Status: BLOCKED: {reason} ({PASS_ID})\n")
                changes += 1
                continue

        new_lines.append(line)
        i += 1

    # Atomic write
    fd, tmp = tempfile.mkstemp(dir=ROOT, suffix=".org")
    with open(tmp, "w") as f:
        f.writelines(new_lines)
    shutil.move(tmp, TODO_FILE)
    print(f"  Updated {TODO_FILE}: {changes} entries changed")


def main():
    print(f"[{PASS_ID}] Running bookkeeping updates...")

    summary = load_summary()

    print(f"  Resolved: {summary['resolved']}")
    print(f"  Failed: {summary['failed']}")
    print(f"  Still blocked: {summary['still_blocked']}")

    print(f"\n  Updating todo_general_packages.org...")
    update_todo(summary)

    print(f"\n[{PASS_ID}] Bookkeeping complete.")


if __name__ == "__main__":
    main()
