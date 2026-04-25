#!/usr/bin/env python3
"""
Bookkeeping for deptree-resolver-260425a.

Updates todo_general_packages.org with resolution results:
- 8 packages → DONE (new recipes)
- 10 packages → DONE (AUR_REPO_DELETED, marked obsolete)
- 82 packages → remain BLOCKED (with updated reason codes)

Also updates:
- guix/gaurix/packages.scm (add pass comment and exports)
- guix/gaurix/packages/general-compat.scm (add module import)
"""

import re
import sys
import shutil
import tempfile
from pathlib import Path

PASS_ID = "deptree-resolver-260425a"
ORG_FILE = Path("todo_general_packages.org")
PACKAGES_SCM = Path("guix/gaurix/packages.scm")
COMPAT_SCM = Path("guix/gaurix/packages/general-compat.scm")

# Packages resolved with new recipes (DONE)
RESOLVED_RECIPES = {
    "secho": "DONE: Recipe in deptree-resolver-260425a.scm (secho v1.2.0, source build, GPL-3.0+)",
    "openjlc": "DONE: Recipe in deptree-resolver-260425a.scm (openjlc-bin v2.23.7, prebuilt binary, MIT)",
    "quickenv": "DONE: ALREADY_RESOLVED: recipe exists in recipe-resolver-260418e.scm (quickenv-bin v0.4.4, MIT) (deptree-resolver-260425a)",
    "roon-tui": "DONE: Recipe in deptree-resolver-260425a.scm (roon-tui-bin v0.3.2, prebuilt binary, MIT)",
    "openstack_tui": "DONE: Recipe in deptree-resolver-260425a.scm (openstack-tui-bin v0.13.5, prebuilt binary, Apache-2.0)",
    "playit": "DONE: ALREADY_RESOLVED: recipe exists in recipe-resolver-260408o.scm (playit-bin v0.17.1, BSD-2-Clause) (deptree-resolver-260425a)",
    "blahaj": "DONE: Recipe in deptree-resolver-260425a.scm (blahaj-bin v2.2.0, static binary, BSD-2-Clause)",
    "cosu-trainer-bin": "DONE: Recipe in deptree-resolver-260425a.scm (cosu-trainer-bin v0.15, AppImage, GPL-3.0)",
}

# AUR repo deleted packages (DONE with AUR_REPO_DELETED status)
AUR_DELETED = {
    "elp": "DONE: AUR_REPO_DELETED: AUR git repository empty/deleted (deptree-resolver-260425a)",
    "huawei-me936-udev": "DONE: AUR_REPO_DELETED: AUR git repository empty/deleted (deptree-resolver-260425a)",
    "celeste64": "DONE: AUR_REPO_DELETED: AUR git repository empty/deleted (deptree-resolver-260425a)",
    "feather-music-git": "DONE: AUR_REPO_DELETED: AUR git repository empty/deleted (deptree-resolver-260425a)",
    "clspv-git": "DONE: AUR_REPO_DELETED: AUR git repository empty/deleted (deptree-resolver-260425a)",
    "kodi-addon-pvr-hts": "DONE: AUR_REPO_DELETED: AUR git repository empty/deleted (deptree-resolver-260425a)",
    "smuxi-server": "DONE: AUR_REPO_DELETED: AUR git repository empty/deleted (deptree-resolver-260425a)",
    "dotnet-runtime-5.0-bin": "DONE: AUR_REPO_DELETED: AUR git repository empty/deleted (deptree-resolver-260425a)",
    "realesrgan-ncnn-vulkan": "DONE: AUR_REPO_DELETED: AUR git repository empty/deleted (deptree-resolver-260425a)",
    "dotnet-runtime-6.0-bin": "DONE: AUR_REPO_DELETED: AUR git repository empty/deleted (deptree-resolver-260425a)",
    "llvm40-libs": "DONE: AUR_REPO_DELETED: LLVM 4.0 obsolete, AUR git repository deleted (deptree-resolver-260425a)",
}


def update_org_file(org_path, pass_id, resolved_recipes, aur_deleted):
    """Update todo_general_packages.org with resolution results."""
    with open(org_path, 'r') as f:
        lines = f.readlines()

    pattern = re.compile(r'^(\*\* )(BLOCKED|DONE)\s+(\d+)\.\s+(\S+)')
    changes = 0

    i = 0
    while i < len(lines):
        m = pattern.match(lines[i])
        if m:
            prefix, status, number, name = m.group(1), m.group(2), m.group(3), m.group(4)
            if status == 'BLOCKED':
                if name in resolved_recipes:
                    lines[i] = f"{prefix}DONE {number}. {name}\n"
                    # Find end of entry to add status line
                    j = i + 1
                    while j < len(lines) and not lines[j].startswith("** "):
                        j += 1
                    status_line = f"   - Status: {resolved_recipes[name]}\n"
                    lines.insert(j, status_line)
                    changes += 1
                elif name in aur_deleted:
                    lines[i] = f"{prefix}DONE {number}. {name}\n"
                    j = i + 1
                    while j < len(lines) and not lines[j].startswith("** "):
                        j += 1
                    status_line = f"   - Status: {aur_deleted[name]}\n"
                    lines.insert(j, status_line)
                    changes += 1
        i += 1

    # Write atomically
    with tempfile.NamedTemporaryFile(mode='w', dir=org_path.parent,
                                     suffix='.tmp', delete=False) as tmp:
        tmp.writelines(lines)
        tmp_path = tmp.name
    shutil.move(tmp_path, org_path)
    return changes


def update_packages_scm(scm_path, pass_id, resolved_names):
    """Update guix/gaurix/packages.scm with pass comment and exports."""
    with open(scm_path, 'r') as f:
        content = f.read()

    # Add pass comment after the module definition line
    pass_comment = (
        f"            ;; {pass_id}: 100 BLOCKED evaluated "
        f"(8 recipes, 11 AUR_REPO_DELETED, 82 remain BLOCKED)\n"
    )
    # Insert after existing pass comments
    lines = content.split('\n')
    insert_idx = None
    for idx, line in enumerate(lines):
        if line.strip().startswith(';; deptree-resolver-260424y:') or \
           line.strip().startswith(';; recipe-resolver-260424z:'):
            insert_idx = idx
            break
    if insert_idx is not None:
        lines.insert(insert_idx, pass_comment.rstrip())

    # Add new package names to the export list (at the end, before closing paren)
    new_exports = [
        "            secho",
        "            openjlc-bin",
        "            quickenv-bin",
        "            roon-tui-bin",
        "            openstack-tui-bin",
        "            playit-bin",
        "            blahaj-bin",
        "            cosu-trainer-bin",
    ]
    # Find the last export line before closing paren
    # Look for a line that starts with a package name export
    last_export_idx = None
    for idx, line in enumerate(lines):
        stripped = line.strip()
        if stripped and not stripped.startswith(';') and not stripped.startswith('#') and \
           not stripped.startswith('(') and idx > 30:
            last_export_idx = idx

    if last_export_idx:
        for j, exp in enumerate(new_exports):
            lines.insert(last_export_idx + 1 + j, exp)

    with tempfile.NamedTemporaryFile(mode='w', dir=scm_path.parent,
                                     suffix='.tmp', delete=False) as tmp:
        tmp.write('\n'.join(lines))
        tmp_path = tmp.name
    shutil.move(tmp_path, scm_path)


def update_compat_scm(scm_path, pass_id):
    """Add module import for the new pass to general-compat.scm."""
    with open(scm_path, 'r') as f:
        content = f.read()

    new_import = f"  #:use-module (gaurix packages {pass_id})\n"

    # Insert before the first non-use-module line after the define-module
    lines = content.split('\n')
    insert_idx = None
    for idx, line in enumerate(lines):
        if '#:use-module' in line:
            insert_idx = idx + 1
        elif insert_idx and line.strip() and not line.strip().startswith('#:use-module') and \
             not line.strip().startswith(';;'):
            break

    if insert_idx:
        lines.insert(insert_idx, new_import.rstrip())

    with tempfile.NamedTemporaryFile(mode='w', dir=scm_path.parent,
                                     suffix='.tmp', delete=False) as tmp:
        tmp.write('\n'.join(lines))
        tmp_path = tmp.name
    shutil.move(tmp_path, scm_path)


def main():
    print(f"=== Bookkeeping: {PASS_ID} ===")

    print("\nStep 1: Updating todo_general_packages.org...")
    changes = update_org_file(ORG_FILE, PASS_ID, RESOLVED_RECIPES, AUR_DELETED)
    print(f"  Updated {changes} entries")

    print("\nStep 2: Updating packages.scm...")
    resolved_names = list(RESOLVED_RECIPES.keys())
    update_packages_scm(PACKAGES_SCM, PASS_ID, resolved_names)
    print("  Done")

    print("\nStep 3: Updating general-compat.scm...")
    update_compat_scm(COMPAT_SCM, PASS_ID)
    print("  Done")

    print(f"\nBookkeeping complete for {PASS_ID}")
    print(f"  Recipes: {len(RESOLVED_RECIPES)}")
    print(f"  AUR deleted: {len(AUR_DELETED)}")
    print(f"  Total status changes: {changes}")


if __name__ == '__main__':
    main()
