#!/usr/bin/env python3
"""
Update packages.scm and general-compat.scm for deptree-resolver-260419c.
Uses deterministic full-file read-transform-write with atomic moves.
"""

import json
import os
import re

PASS_ID = "deptree-resolver-260419c"
SELECTION_FILE = f"reports/{PASS_ID}-selection.json"
PACKAGES_FILE = "guix/gaurix/packages.scm"
COMPAT_FILE = "guix/gaurix/packages/general-compat.scm"

def main():
    # Load selection
    with open(SELECTION_FILE) as f:
        selection = json.load(f)

    resolved_names = selection["resolved_names"]
    print(f"Adding {len(resolved_names)} packages from {PASS_ID}")

    # === Update packages.scm ===
    print(f"\nUpdating {PACKAGES_FILE}...")
    with open(PACKAGES_FILE) as f:
        content = f.read()

    # Find the last comment line about resolver passes (before export list starts)
    # Add a new comment for this pass
    pass_comment = f"            ;; {PASS_ID}: {len(resolved_names)} TODO resolved"

    # Insert after the last resolver comment
    # Find the pattern: last line starting with "            ;;" before the first export name
    lines = content.split('\n')
    insert_idx = None
    for i, line in enumerate(lines):
        if line.strip().startswith(';;') and 'resolver' in line.lower():
            insert_idx = i

    if insert_idx is not None:
        lines.insert(insert_idx + 1, pass_comment)

    # Add re-export lines at the end of file, before the last closing paren or at end
    # Find last re-export line
    last_reexport_idx = None
    for i, line in enumerate(lines):
        if line.startswith('(re-export '):
            last_reexport_idx = i

    if last_reexport_idx is not None:
        # Insert new re-exports after the last one
        new_reexports = [f"(re-export {name})" for name in resolved_names]
        for j, re_line in enumerate(new_reexports):
            lines.insert(last_reexport_idx + 1 + j, re_line)

    # Also add names to the export list in the define-module
    # Find the first non-comment, non-module line with a bare symbol (export name)
    # The module exports are bare names like "            auto-cpufreq"
    # Find last bare export name before the first #:use-module or (re-export
    last_bare_export_idx = None
    for i, line in enumerate(lines):
        stripped = line.strip()
        if stripped and not stripped.startswith(';;') and not stripped.startswith('#:') and not stripped.startswith('(') and not stripped.startswith(')'):
            # This is likely a bare exported name
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
    # Find the last #:use-module line for a resolver
    last_use_module_idx = None
    for i, line in enumerate(lines):
        if '#:use-module' in line and ('resolver' in line or 'gaurix packages' in line):
            last_use_module_idx = i

    use_module_line = f"  #:use-module (gaurix packages {PASS_ID})"
    if last_use_module_idx is not None:
        lines.insert(last_use_module_idx + 1, use_module_line)
        # Adjust indices for subsequent insertions
        offset = 1
    else:
        offset = 0

    # 2. Add a comment documenting this pass
    # Find existing pass comments (;;; --- resolver lines)
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
    # Find the last line inside the #:export block
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
                # End of module definition
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
