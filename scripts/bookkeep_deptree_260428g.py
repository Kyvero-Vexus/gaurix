#!/usr/bin/env python3
"""
Bookkeeping for deptree-resolver-260428g.
Updates todo_general_packages.org with pass tags.
Updates packages.scm and general-compat.scm programmatically.
"""

import json
import re
import tempfile
import os

PASS_ID = "deptree-resolver-260428g"
TODO_FILE = "todo_general_packages.org"
PACKAGES_SCM = "guix/gaurix/packages.scm"
GENERAL_COMPAT_SCM = "guix/gaurix/packages/general-compat.scm"
SELECTION_JSON = f"reports/{PASS_ID}-selection.json"

# Resolved packages: name -> reason
RESOLVED = {
    "libfive-studio-git": "Already packaged as libfive in upstream Guix (gnu/packages/engineering.scm, includes Studio GUI)",
}

# Packages to reclassify (none this pass — all were already categorized in 260428f)
RECLASSIFY = {}


def load_selection():
    """Load the selected package names."""
    with open(SELECTION_JSON) as f:
        data = json.load(f)
    return set(data['packages'])


def update_todo_org(selected_names):
    """Update BLOCKED entries: add pass tag, resolve packages."""
    with open(TODO_FILE, 'r', encoding='utf-8') as f:
        lines = f.readlines()

    updated = 0
    resolved = 0
    new_lines = []
    i = 0
    while i < len(lines):
        line = lines[i]
        m = re.match(r'^(\*\* )(BLOCKED)(\s+\d+\.\s+)(\S+)(.*)', line)
        if m:
            prefix = m.group(1)
            status = m.group(2)
            num_part = m.group(3)
            raw_name = m.group(4)
            rest = m.group(5)
            name = raw_name.rstrip(':').split(':')[0].split('[')[0].rstrip()

            if name in selected_names:
                if name in RESOLVED:
                    # Change status to DONE
                    clean_rest = rest.rstrip('\n')
                    if PASS_ID not in clean_rest:
                        if clean_rest.endswith(':'):
                            clean_rest = f"{clean_rest}{PASS_ID}:already-packaged:"
                        else:
                            clean_rest = f"{clean_rest} :{PASS_ID}:already-packaged:"
                    new_line = f"{prefix}DONE{num_part}{raw_name}{clean_rest}\n"
                    new_lines.append(new_line)
                    # Update status lines in body
                    j = i + 1
                    status_updated = False
                    while j < len(lines) and not lines[j].startswith("** "):
                        sl = lines[j]
                        if not status_updated and sl.strip().startswith("- Status:"):
                            new_lines.append(sl)
                            new_lines.append(f"   - Status: DONE: {RESOLVED[name]} ({PASS_ID})\n")
                            status_updated = True
                        elif sl.strip().startswith("- TODO Status: BLOCKED"):
                            new_lines.append(f"   - TODO Status: DONE\n")
                        else:
                            new_lines.append(sl)
                        j += 1
                    if not status_updated:
                        new_lines.append(f"   - Status: DONE: {RESOLVED[name]} ({PASS_ID})\n")
                    resolved += 1
                    i = j
                    continue
                else:
                    # Add pass tag if not already present
                    if PASS_ID not in line:
                        clean_rest = rest.rstrip('\n')
                        if clean_rest.endswith(':'):
                            new_line = f"{prefix}{status}{num_part}{raw_name}{clean_rest}{PASS_ID}:\n"
                        else:
                            new_line = f"{prefix}{status}{num_part}{raw_name}{clean_rest}:{PASS_ID}:\n"
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
    print(f"  Resolved {resolved} packages to DONE")
    return updated, resolved


def update_packages_scm():
    """Add pass comment to packages.scm using deterministic full-file transform."""
    with open(PACKAGES_SCM, 'r', encoding='utf-8') as f:
        content = f.read()

    comment = f"            ;; {PASS_ID}: 100 BLOCKED evaluated (0 new recipes, 1 ALREADY_PACKAGED: libfive-studio-git, 99 remain BLOCKED)"

    # Check if already present
    if PASS_ID in content:
        print(f"  {PACKAGES_SCM} already has pass comment")
        return

    lines = content.split('\n')
    new_lines = []
    inserted = False

    for line in lines:
        if not inserted and line.strip().startswith(';; deptree-resolver-260428f:'):
            new_lines.append(comment)
            inserted = True
        new_lines.append(line)

    if not inserted:
        # Fallback: insert before first recipe-resolver-260428 comment
        new_lines_2 = []
        for line in lines:
            if not inserted and ';; recipe-resolver-260428' in line:
                new_lines_2.append(comment)
                inserted = True
            new_lines_2.append(line)
        if inserted:
            new_lines = new_lines_2

    new_content = '\n'.join(new_lines)

    fd, tmp = tempfile.mkstemp(dir='.', suffix='.scm')
    os.close(fd)
    with open(tmp, 'w', encoding='utf-8') as f:
        f.write(new_content)
    os.replace(tmp, PACKAGES_SCM)

    print(f"  Updated {PACKAGES_SCM} with pass comment (inserted={inserted})")


def update_general_compat_scm():
    """Add use-module for new pass to general-compat.scm using deterministic full-file transform."""
    with open(GENERAL_COMPAT_SCM, 'r', encoding='utf-8') as f:
        content = f.read()

    new_module = "  #:use-module (gaurix packages deptree-resolver-260428g)"

    # Check if already present
    if new_module.strip() in content:
        print(f"  {GENERAL_COMPAT_SCM} already has module entry")
        return

    lines = content.split('\n')
    new_lines = []
    inserted = False

    for line in lines:
        if not inserted and '#:use-module (gaurix packages deptree-resolver-260428f)' in line:
            new_lines.append(new_module)
            new_lines.append(line)
            inserted = True
            continue
        new_lines.append(line)

    if not inserted:
        # Fallback: insert before recipe-resolver-260428e
        new_lines_2 = []
        for line in lines:
            if not inserted and '#:use-module (gaurix packages recipe-resolver-260428e)' in line:
                new_lines_2.append(new_module)
                inserted = True
            new_lines_2.append(line)
        if inserted:
            new_lines = new_lines_2

    new_content = '\n'.join(new_lines)

    fd, tmp = tempfile.mkstemp(dir='.', suffix='.scm')
    os.close(fd)
    with open(tmp, 'w', encoding='utf-8') as f:
        f.write(new_content)
    os.replace(tmp, GENERAL_COMPAT_SCM)

    print(f"  Updated {GENERAL_COMPAT_SCM} with new module (inserted={inserted})")


def main():
    print(f"[{PASS_ID}] Running bookkeeping...")

    selected = load_selection()
    print(f"  Loaded {len(selected)} selected packages")

    # Update todo org
    update_todo_org(selected)

    # Update packages.scm
    update_packages_scm()

    # Update general-compat.scm
    update_general_compat_scm()

    print(f"\n[{PASS_ID}] Bookkeeping complete.")


if __name__ == "__main__":
    main()
