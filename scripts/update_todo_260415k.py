#!/usr/bin/env python3
"""Update todo_general_packages.org for deptree-resolver-260415k pass.

Marks 100 TODO entries as DONE with status notes.
Uses atomic temp-file-then-move approach.
"""

import json
import re
import shutil
import tempfile
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
TODO_FILE = ROOT / "todo_general_packages.org"
REPORT_FILE = Path("/tmp/resolver_260415k_report.json")
PASS_ID = "deptree-resolver-260415k"


def load_report():
    with open(REPORT_FILE) as f:
        return json.load(f)


def guix_name(name):
    return name.lower().replace("_", "-").replace(".", "-")


def update_todo(found_packages, not_found_packages):
    """Update TODO entries to DONE or BLOCKED in the org file."""
    # Build lookup sets
    found_numbers = {p["number"] for p in found_packages}
    not_found_numbers = {p["number"] for p in not_found_packages}
    all_numbers = found_numbers | not_found_numbers

    # Build name lookup for status messages
    found_map = {p["number"]: p for p in found_packages}
    not_found_map = {p["number"]: p for p in not_found_packages}

    content = TODO_FILE.read_text()
    lines = content.split("\n")
    new_lines = []
    modified = 0

    i = 0
    while i < len(lines):
        line = lines[i]

        # Check for TODO entry header
        m = re.match(r"^(\*\*\s+)TODO(\s+)(\d+)\.\s+(\S+)", line)
        if m:
            num = int(m.group(3))
            name = m.group(4)

            if num in found_numbers:
                pkg = found_map[num]
                gname = guix_name(name)
                # Change TODO to DONE
                new_line = line.replace("** TODO ", "** DONE ", 1)
                new_lines.append(new_line)

                # Add status note - scan ahead to find where to insert
                i += 1
                # Copy existing sub-lines
                while i < len(lines) and not lines[i].startswith("** "):
                    new_lines.append(lines[i])
                    i += 1

                # Insert status note before next entry
                status_line = f"   - Status: DONE: recipe in {PASS_ID}.scm ({gname}, RECIPE: Guix recipe created)"
                todo_status_line = f"   - TODO Status: DONE"
                # Insert before the blank line or next entry
                new_lines.append(status_line)
                new_lines.append(todo_status_line)
                modified += 1
                continue

            elif num in not_found_numbers:
                pkg = not_found_map[num]
                # Change TODO to BLOCKED
                new_line = line.replace("** TODO ", "** BLOCKED ", 1)
                new_lines.append(new_line)

                i += 1
                while i < len(lines) and not lines[i].startswith("** "):
                    new_lines.append(lines[i])
                    i += 1

                status_line = f"   - Status: BLOCKED: MISSING_SOURCE: not in AUR metadata ({PASS_ID})"
                todo_status_line = f"   - TODO Status: BLOCKED"
                new_lines.append(status_line)
                new_lines.append(todo_status_line)
                modified += 1
                continue

        new_lines.append(line)
        i += 1

    new_content = "\n".join(new_lines)

    # Atomic write
    fd, tmp = tempfile.mkstemp(dir=TODO_FILE.parent, suffix=".org.tmp")
    try:
        with open(fd, "w") as f:
            f.write(new_content)
        shutil.move(tmp, TODO_FILE)
        print(f"Updated {modified} entries in todo_general_packages.org")
    except Exception:
        Path(tmp).unlink(missing_ok=True)
        raise

    return modified


def main():
    report = load_report()
    found = report["found"]
    not_found = report["not_found"]

    print(f"Updating todo file for {PASS_ID}...")
    print(f"  {len(found)} DONE, {len(not_found)} BLOCKED")

    modified = update_todo(found, not_found)
    print(f"Total entries modified: {modified}")


if __name__ == "__main__":
    main()
