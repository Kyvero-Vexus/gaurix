#!/usr/bin/env python3
"""
Bookkeeping for deptree-resolver-260427n.
Updates todo_general_packages.org with pass tags.
Updates packages.scm and general-compat.scm programmatically.
"""

import json
import re
import tempfile
import os

PASS_ID = "deptree-resolver-260427n"
TODO_FILE = "todo_general_packages.org"
PACKAGES_SCM = "guix/gaurix/packages.scm"
GENERAL_COMPAT_SCM = "guix/gaurix/packages/general-compat.scm"
SELECTION_JSON = f"reports/{PASS_ID}-selection.json"


def load_selection():
    """Load the selected package names."""
    with open(SELECTION_JSON) as f:
        data = json.load(f)
    return set(data['packages'])


def update_todo_org(selected_names):
    """Add pass tag to BLOCKED entries for selected packages."""
    with open(TODO_FILE, 'r', encoding='utf-8') as f:
        lines = f.readlines()

    updated = 0
    new_lines = []
    i = 0
    while i < len(lines):
        line = lines[i]
        m = re.match(r'^(\*\* BLOCKED\s+\d+\.\s+)(\S+)(.*)', line)
        if m:
            prefix = m.group(1)
            raw_name = m.group(2)
            rest = m.group(3)
            name = raw_name.rstrip(':').split(':')[0].split('[')[0].rstrip()

            if name in selected_names:
                # Add pass tag if not already present
                if PASS_ID not in line:
                    # Append tag before any trailing whitespace/newline
                    clean_rest = rest.rstrip('\n')
                    if clean_rest.endswith(':'):
                        new_line = f"{prefix}{raw_name}{clean_rest}{PASS_ID}:\n"
                    else:
                        new_line = f"{prefix}{raw_name}{clean_rest}:{PASS_ID}:\n"
                    new_lines.append(new_line)
                    updated += 1
                    i += 1
                    continue

        new_lines.append(line)
        i += 1

    # Write atomically
    fd, tmp = tempfile.mkstemp(dir='.', suffix='.org')
    os.close(fd)
    with open(tmp, 'w', encoding='utf-8') as f:
        f.writelines(new_lines)
    os.replace(tmp, TODO_FILE)

    print(f"  Updated {updated} BLOCKED entries with {PASS_ID} tag")
    return updated


def update_packages_scm():
    """Add pass comment to packages.scm."""
    with open(PACKAGES_SCM, 'r', encoding='utf-8') as f:
        content = f.read()

    comment = f"            ;; {PASS_ID}: 100 BLOCKED evaluated (0 recipes, 100 remain BLOCKED)"

    # Insert after the first line that starts with '            ;; deptree-resolver-260427' or similar
    # Find the first comment line after define-module
    lines = content.split('\n')
    new_lines = []
    inserted = False

    for line in lines:
        if not inserted and line.strip().startswith(';; recipe-resolver-260427m:'):
            new_lines.append(comment)
            inserted = True
        new_lines.append(line)

    if not inserted:
        # Fallback: insert before define-module
        new_lines_2 = []
        for line in new_lines:
            if line.strip().startswith(';; deptree-resolver-260427') and not inserted:
                new_lines_2.append(comment)
                inserted = True
            new_lines_2.append(line)
        new_lines = new_lines_2

    new_content = '\n'.join(new_lines)

    fd, tmp = tempfile.mkstemp(dir='.', suffix='.scm')
    os.close(fd)
    with open(tmp, 'w', encoding='utf-8') as f:
        f.write(new_content)
    os.replace(tmp, PACKAGES_SCM)

    print(f"  Updated {PACKAGES_SCM} with pass comment")


def update_general_compat_scm():
    """Add use-module for new pass to general-compat.scm."""
    with open(GENERAL_COMPAT_SCM, 'r', encoding='utf-8') as f:
        content = f.read()

    new_module = "  #:use-module (gaurix packages deptree-resolver-260427n)"

    # Insert after the first existing use-module line
    lines = content.split('\n')
    new_lines = []
    inserted = False

    for line in lines:
        if not inserted and '#:use-module (gaurix packages recipe-resolver-260427m)' in line:
            new_lines.append(line)
            new_lines.append(new_module)
            inserted = True
            continue
        elif not inserted and '#:use-module (gaurix packages deptree-resolver-260427l)' in line:
            new_lines.append(new_module)
            new_lines.append(line)
            inserted = True
            continue
        new_lines.append(line)

    if not inserted:
        # Fallback: insert at the beginning of use-module block
        new_lines_2 = []
        for line in lines:
            if not inserted and '#:use-module (gaurix packages' in line:
                new_lines_2.append(new_module)
                inserted = True
            new_lines_2.append(line)
        new_lines = new_lines_2

    new_content = '\n'.join(new_lines)

    fd, tmp = tempfile.mkstemp(dir='.', suffix='.scm')
    os.close(fd)
    with open(tmp, 'w', encoding='utf-8') as f:
        f.write(new_content)
    os.replace(tmp, GENERAL_COMPAT_SCM)

    print(f"  Updated {GENERAL_COMPAT_SCM} with new module")


def main():
    print(f"[{PASS_ID}] Running bookkeeping...")

    selected = load_selection()
    print(f"  Loaded {len(selected)} selected packages")

    print("  Updating todo org file...")
    update_todo_org(selected)

    print("  Updating packages.scm...")
    update_packages_scm()

    print("  Updating general-compat.scm...")
    update_general_compat_scm()

    print(f"\n[{PASS_ID}] Bookkeeping complete.")


if __name__ == '__main__':
    main()
