#!/usr/bin/env python3
"""
Bookkeeping for deptree-resolver-260428o.
- Updates todo_general_packages.org:
  - gbm (#19044): BLOCKED → DONE
  - Adds :deptree-resolver-260428o: tag to all 100 evaluated packages
- Updates guix/gaurix/packages/general-compat.scm: adds new module import
"""

import re
import json
import tempfile
import shutil

PASS_ID = "deptree-resolver-260428o"
TODO_FILE = "todo_general_packages.org"
COMPAT_FILE = "guix/gaurix/packages/general-compat.scm"
SELECTION_JSON = f"reports/{PASS_ID}-selection.json"

# Load selection
with open(SELECTION_JSON) as f:
    selection = json.load(f)

selected_names = set(selection["packages"])

# Packages resolved to DONE this pass
resolved = {"gbm"}


def update_todo():
    """Update todo_general_packages.org."""
    with open(TODO_FILE, 'r', encoding='utf-8') as f:
        lines = f.readlines()

    new_lines = []
    i = 0
    updated_done = 0
    updated_tags = 0

    while i < len(lines):
        line = lines[i]

        # Match BLOCKED header for any of our selected packages
        m = re.match(r'^(\*\* )BLOCKED(\s+\d+\.\s+)(\S+)', line)
        if m:
            prefix = m.group(1)
            middle = m.group(2)
            raw_name = m.group(3)
            # Clean package name
            name = raw_name.rstrip(':').split(':')[0].split('[')[0].rstrip()

            if name in selected_names:
                # Add tag if not already present
                tag = f":{PASS_ID}:"
                if tag not in line:
                    stripped = line.rstrip('\n')
                    if not stripped.endswith(':'):
                        stripped += ':'
                    stripped += f"{PASS_ID}:"
                    line = stripped + '\n'
                    updated_tags += 1

                # If this is a resolved package, change BLOCKED → DONE
                if name in resolved:
                    line = line.replace('** BLOCKED', '** DONE', 1)
                    updated_done += 1

                new_lines.append(line)
                i += 1

                # For resolved packages, add status line after header
                if name in resolved:
                    body_lines = []
                    while i < len(lines) and not lines[i].startswith("** "):
                        body_lines.append(lines[i])
                        i += 1
                    if name == 'gbm':
                        new_lines.append(
                            f"   - Status: DONE: Recipe in {PASS_ID}.scm "
                            f"(gbm v1.4.3 + mono-basic v4.8, Game Backup Monitor, "
                            f"copy-build-system with 7z extraction, all deps in Guix) "
                            f"({PASS_ID})\n"
                        )
                    new_lines.extend(body_lines)
                continue

        new_lines.append(line)
        i += 1

    # Write atomically
    with tempfile.NamedTemporaryFile(mode='w', dir='.', suffix='.org',
                                      delete=False, encoding='utf-8') as tmp:
        tmp.writelines(new_lines)
        tmp_name = tmp.name
    shutil.move(tmp_name, TODO_FILE)

    print(f"  Updated {TODO_FILE}:")
    print(f"    BLOCKED→DONE: {updated_done}")
    print(f"    Tags added: {updated_tags}")


def update_compat():
    """Update general-compat.scm to add the new module."""
    with open(COMPAT_FILE, 'r', encoding='utf-8') as f:
        content = f.read()

    new_module = f"  #:use-module (gaurix packages {PASS_ID})"

    if new_module in content:
        print(f"  {COMPAT_FILE}: module already present")
        return

    # Insert after the first #:use-module line
    lines = content.split('\n')
    new_lines = []
    inserted = False
    for line in lines:
        new_lines.append(line)
        if not inserted and line.strip().startswith('#:use-module'):
            new_lines.append(new_module)
            inserted = True

    new_content = '\n'.join(new_lines)

    with tempfile.NamedTemporaryFile(mode='w', dir='.', suffix='.scm',
                                      delete=False, encoding='utf-8') as tmp:
        tmp.write(new_content)
        tmp_name = tmp.name
    shutil.move(tmp_name, COMPAT_FILE)

    print(f"  Updated {COMPAT_FILE}: added {PASS_ID} module")


def main():
    print(f"[{PASS_ID}] Bookkeeping...")
    update_todo()
    update_compat()
    print(f"  Done.")


if __name__ == "__main__":
    main()
