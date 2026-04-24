#!/usr/bin/env python3
"""
Bookkeeping script for deptree-resolver-260424w.

Updates:
1. todo_general_packages.org - status updates for resolved packages
2. guix/gaurix/packages.scm - add pass comment
3. guix/gaurix/packages/general-compat.scm - add module import and re-exports
"""

import re
import sys
import tempfile
import shutil
from pathlib import Path

PASS_ID = "deptree-resolver-260424w"

# Packages resolved with recipes
RESOLVED_RECIPES = {
    "dropbox": "DONE: Recipe in deptree-resolver-260424w.scm (dropbox v248.4.3576, copy-build-system, proprietary binary)",
    "electron23-bin": "DONE: Recipe in deptree-resolver-260424w.scm (electron23-bin v23.3.13, copy-build-system, MIT)",
    "realvnc-rvnc-connect": "DONE: Recipe in deptree-resolver-260424w.scm (realvnc-rvnc-connect v8.2.2, copy-build-system, proprietary binary)",
    "n8n": "DONE: Recipe in deptree-resolver-260424w.scm (n8n v2.17.7, node-build-system, custom license)",
    "heroku-cli": "DONE: Recipe in deptree-resolver-260424w.scm (heroku-cli v11.2.0, node-build-system, ISC)",
}

# Packages with AUR repos deleted - status update only (remain BLOCKED)
AUR_DELETED = {
    "dotnet-runtime-5.0-bin": "BLOCKED: AUR_REPO_DELETED: AUR git repository is empty/deleted as of 2026-04-24 (deptree-resolver-260424w)",
    "dotnet-runtime-6.0-bin": "BLOCKED: AUR_REPO_DELETED: AUR git repository is empty/deleted as of 2026-04-24 (deptree-resolver-260424w)",
    "llvm40-libs": "BLOCKED: AUR_REPO_DELETED: AUR git repository is empty/deleted as of 2026-04-24 (deptree-resolver-260424w)",
}

# Exported symbols from new recipe module
EXPORTS = ["dropbox", "electron23-bin", "realvnc-rvnc-connect", "n8n", "heroku-cli"]

ORG_FILE = Path("todo_general_packages.org")
PACKAGES_SCM = Path("guix/gaurix/packages.scm")
COMPAT_SCM = Path("guix/gaurix/packages/general-compat.scm")


def update_org_file():
    """Update todo_general_packages.org with status changes."""
    with open(ORG_FILE, 'r') as f:
        lines = f.readlines()

    # Build lookup of package name -> (status change, new_status_line)
    all_changes = {}
    for name, status in RESOLVED_RECIPES.items():
        all_changes[name] = ("DONE", status)
    for name, status in AUR_DELETED.items():
        all_changes[name] = ("BLOCKED", status)

    pattern = re.compile(r'^(\*\* )(BLOCKED|DONE)\s+(\d+)\.\s+(\S+)')
    modified = 0

    i = 0
    while i < len(lines):
        m = pattern.match(lines[i])
        if m:
            prefix, old_status, number, name = m.group(1), m.group(2), m.group(3), m.group(4)
            if name in all_changes:
                new_todo_status, new_status_line = all_changes[name]
                # Update the header line
                tags = ""
                if f":{PASS_ID}:" not in lines[i]:
                    tags = f"  :{PASS_ID}:recipe-generated:"
                # Rewrite header
                lines[i] = f"{prefix}{new_todo_status} {number}. {name}{tags}\n"
                # Find end of this entry and add new status line
                j = i + 1
                while j < len(lines) and j < i + 30:
                    if lines[j].startswith("** "):
                        break
                    j += 1
                # Insert new status line before next entry
                insert_line = f"   - Status: {new_status_line}\n"
                lines.insert(j, insert_line)
                modified += 1
        i += 1

    # Write atomically
    tmp = tempfile.NamedTemporaryFile(mode='w', dir=ORG_FILE.parent,
                                      prefix='.tmp_org_', suffix='.org',
                                      delete=False)
    tmp.writelines(lines)
    tmp.flush()
    tmp.close()
    shutil.move(tmp.name, ORG_FILE)
    print(f"  Updated {modified} entries in {ORG_FILE}")


def update_packages_scm():
    """Add pass comment to packages.scm."""
    with open(PACKAGES_SCM, 'r') as f:
        content = f.read()

    comment = f"            ;; {PASS_ID}: 81 BLOCKED evaluated (5 recipes, 3 AUR_REPO_DELETED, 73 remain BLOCKED)\n"

    # Insert after the (define-module line
    insertion_point = "(define-module (gaurix packages)\n"
    if PASS_ID in content:
        print(f"  {PASS_ID} already in {PACKAGES_SCM}, skipping")
        return

    content = content.replace(insertion_point, insertion_point + comment)

    tmp = tempfile.NamedTemporaryFile(mode='w', dir=PACKAGES_SCM.parent,
                                      prefix='.tmp_pkg_', suffix='.scm',
                                      delete=False)
    tmp.write(content)
    tmp.flush()
    tmp.close()
    shutil.move(tmp.name, PACKAGES_SCM)
    print(f"  Updated {PACKAGES_SCM}")


def update_general_compat():
    """Add module import and re-exports to general-compat.scm."""
    with open(COMPAT_SCM, 'r') as f:
        content = f.read()

    if PASS_ID in content:
        print(f"  {PASS_ID} already in {COMPAT_SCM}, skipping")
        return

    # Add #:use-module line after the last existing deptree-resolver use-module
    import_line = f"  #:use-module (gaurix packages {PASS_ID})\n"

    # Find the position to insert: after the last #:use-module for deptree-resolver-260424v
    last_use_module_pos = content.rfind("#:use-module (gaurix packages deptree-resolver-260424v)")
    if last_use_module_pos == -1:
        # Fallback: find any deptree use-module
        last_use_module_pos = content.rfind("#:use-module (gaurix packages deptree-resolver-")

    if last_use_module_pos != -1:
        # Find end of that line
        end_of_line = content.index('\n', last_use_module_pos) + 1
        content = content[:end_of_line] + import_line + content[end_of_line:]
    else:
        print(f"  WARNING: Could not find insertion point for use-module in {COMPAT_SCM}")
        return

    # Add re-exports before the end of file
    re_export_block = f"\n; {PASS_ID} recipes\n"
    for export in EXPORTS:
        re_export_block += f"(re-export {export})\n"

    content += re_export_block

    tmp = tempfile.NamedTemporaryFile(mode='w', dir=COMPAT_SCM.parent,
                                      prefix='.tmp_compat_', suffix='.scm',
                                      delete=False)
    tmp.write(content)
    tmp.flush()
    tmp.close()
    shutil.move(tmp.name, COMPAT_SCM)
    print(f"  Updated {COMPAT_SCM}")


def main():
    print(f"=== Bookkeeping: {PASS_ID} ===")
    print()

    print("Step 1: Updating todo_general_packages.org...")
    update_org_file()

    print("Step 2: Updating guix/gaurix/packages.scm...")
    update_packages_scm()

    print("Step 3: Updating guix/gaurix/packages/general-compat.scm...")
    update_general_compat()

    print()
    print("Done.")


if __name__ == '__main__':
    main()
