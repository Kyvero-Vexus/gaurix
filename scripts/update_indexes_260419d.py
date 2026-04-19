#!/usr/bin/env python3
"""
Update packages.scm and general-compat.scm for deptree-resolver-260419d.
Uses deterministic full-file read-transform-write with atomic moves.
"""

import json
import os
import re

PASS_ID = "deptree-resolver-260419d"
SELECTION_FILE = f"reports/{PASS_ID}-selection.json"
PACKAGES_FILE = "guix/gaurix/packages.scm"
COMPAT_FILE = "guix/gaurix/packages/general-compat.scm"


def main():
    with open(SELECTION_FILE) as f:
        selection = json.load(f)

    resolved_names = selection["resolved_names"]
    print(f"Adding {len(resolved_names)} packages from {PASS_ID}")

    # === Update packages.scm ===
    print(f"\nUpdating {PACKAGES_FILE}...")
    with open(PACKAGES_FILE) as f:
        content = f.read()

    lines = content.split('\n')

    # Add pass comment after last resolver comment
    pass_comment = f"            ;; {PASS_ID}: {len(resolved_names)} TODO resolved"
    insert_idx = None
    for i, line in enumerate(lines):
        if line.strip().startswith(';;') and 'resolver' in line.lower():
            insert_idx = i

    if insert_idx is not None:
        lines.insert(insert_idx + 1, pass_comment)

    # Add re-export lines after the last re-export
    last_reexport_idx = None
    for i, line in enumerate(lines):
        if line.startswith('(re-export '):
            last_reexport_idx = i

    if last_reexport_idx is not None:
        new_reexports = [f"(re-export {name})" for name in resolved_names]
        for j, re_line in enumerate(new_reexports):
            lines.insert(last_reexport_idx + 1 + j, re_line)

    # Add names to the export list (bare symbol names)
    last_bare_export_idx = None
    for i, line in enumerate(lines):
        stripped = line.strip()
        if stripped and not stripped.startswith(';;') and not stripped.startswith('#:') and not stripped.startswith('(') and not stripped.startswith(')'):
            last_bare_export_idx = i
        if stripped.startswith('#:use-module') or stripped.startswith('(re-export'):
            break

    if last_bare_export_idx is not None:
        new_exports = [f"            {name}" for name in resolved_names]
        for j, exp_line in enumerate(new_exports):
            lines.insert(last_bare_export_idx + 1 + j, exp_line)

    new_content = '\n'.join(lines)
    tmp = PACKAGES_FILE + ".tmp"
    with open(tmp, 'w') as f:
        f.write(new_content)
    os.replace(tmp, PACKAGES_FILE)
    print(f"  Updated {PACKAGES_FILE} ({len(resolved_names)} exports + re-exports added)")

    # === Update general-compat.scm ===
    print(f"\nUpdating {COMPAT_FILE}...")
    with open(COMPAT_FILE) as f:
        content = f.read()

    lines = content.split('\n')

    # 1. Add #:use-module directive for the new pass
    last_use_module_idx = None
    for i, line in enumerate(lines):
        if '#:use-module' in line and ('resolver' in line or 'gaurix packages' in line):
            last_use_module_idx = i

    use_module_line = f"  #:use-module (gaurix packages {PASS_ID})"
    if last_use_module_idx is not None:
        lines.insert(last_use_module_idx + 1, use_module_line)
        offset = 1
    else:
        offset = 0

    # 2. Add pass comment
    last_pass_comment_idx = None
    for i, line in enumerate(lines):
        if line.startswith(';;; --- ') and 'resolver' in line:
            last_pass_comment_idx = i

    pass_doc = f";;; --- {PASS_ID}: {len(resolved_names)} TODO packages resolved ---"
    if last_pass_comment_idx is not None:
        lines.insert(last_pass_comment_idx + 1 + offset, pass_doc)
        offset += 1

    # 3. Add (re-export name) lines at end
    last_reexport_idx = None
    for i, line in enumerate(lines):
        if line.startswith('(re-export '):
            last_reexport_idx = i

    if last_reexport_idx is not None:
        new_reexports = [f"(re-export {name})" for name in resolved_names]
        for j, re_line in enumerate(new_reexports):
            lines.insert(last_reexport_idx + 1 + j, re_line)

    # 4. Add names to #:export list
    last_export_idx = None
    in_export = False
    for i, line in enumerate(lines):
        if '#:export' in line:
            in_export = True
        if in_export:
            stripped = line.strip()
            if stripped and not stripped.startswith(';;'):
                last_export_idx = i
            if stripped == '))' or (stripped.endswith('))') and in_export and i > 0):
                break

    if last_export_idx is not None:
        new_export_names = [f"            {name}" for name in resolved_names]
        for j, exp_line in enumerate(new_export_names):
            lines.insert(last_export_idx + 1 + j, exp_line)

    new_content = '\n'.join(lines)
    tmp = COMPAT_FILE + ".tmp"
    with open(tmp, 'w') as f:
        f.write(new_content)
    os.replace(tmp, COMPAT_FILE)
    print(f"  Updated {COMPAT_FILE}")

    print("\nDone!")


if __name__ == "__main__":
    main()
