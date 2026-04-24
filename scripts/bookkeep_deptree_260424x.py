#!/usr/bin/env python3
"""
Bookkeeping script for deptree-resolver-260424x.

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

PASS_ID = "deptree-resolver-260424x"

# Packages resolved with recipes
RESOLVED_RECIPES = {
    "modrinth-app-appimage": "DONE: Recipe in deptree-resolver-260424x.scm (modrinth-app-appimage v0.13.4, copy-build-system, GPL-3.0)",
    "wpa-cute": "DONE: Recipe in deptree-resolver-260424x.scm (wpa-cute v0.8.6, qt-build-system, BSD-3-Clause)",
    "chomp": "DONE: Recipe in deptree-resolver-260424x.scm (chomp v1.2, cmake-build-system, MIT)",
    "folio": "DONE: Recipe in deptree-resolver-260424x.scm (folio v25.02, meson-build-system, GPL-3.0)",
    "kwin-effects-sliding-notifications-git": "DONE: Recipe in deptree-resolver-260424x.scm (kwin-effects-sliding-notifications v0.0.1, cmake-build-system, MIT)",
}

# Packages already in Guix
ALREADY_IN_GUIX = {
    "toxcore-c": "DONE: ALREADY_IN_GUIX: Available as 'c-toxcore' v0.2.19 in (gnu packages messaging) (deptree-resolver-260424x)",
}

# Packages with AUR repos deleted
AUR_DELETED = {
    "systemd-ukify-git": "BLOCKED: AUR_REPO_DELETED: AUR git repository is empty/deleted as of 2026-04-24 (deptree-resolver-260424x)",
    "smuxi-server": "BLOCKED: AUR_REPO_DELETED: AUR git repository is empty/deleted as of 2026-04-24 (deptree-resolver-260424x)",
}

# Packages with updated blocking reasons
UPDATED_BLOCKED = {
    "smtube": "BLOCKED: SOURCE_UNAVAILABLE: SourceForge download returns 503; qtwebkit dependency not available in Guix (deptree-resolver-260424x)",
    "libga68-snapshot": "BLOCKED: GCC_SNAPSHOT_RUNTIME: GCC pre-release Algol68 runtime; Guix provides stable GCC runtime via gcc-toolchain (deptree-resolver-260424x)",
    "libgfortran-snapshot": "BLOCKED: GCC_SNAPSHOT_RUNTIME: GCC pre-release Fortran runtime; Guix provides stable GCC runtime via gcc-toolchain (deptree-resolver-260424x)",
    "libgnat-snapshot": "BLOCKED: GCC_SNAPSHOT_RUNTIME: GCC pre-release Ada runtime; Guix provides stable GCC runtime via gcc-toolchain (deptree-resolver-260424x)",
    "libgo-snapshot": "BLOCKED: GCC_SNAPSHOT_RUNTIME: GCC pre-release Go runtime; Guix provides stable GCC runtime via gcc-toolchain (deptree-resolver-260424x)",
    "soapysdrplay3-luarvique-git": "BLOCKED: PROPRIETARY_DEP: Depends on proprietary libsdrplay (deptree-resolver-260424x)",
    "python-pylink-square": "BLOCKED: PROPRIETARY_DEP: Depends on proprietary SEGGER J-Link SDK (deptree-resolver-260424x)",
    "udiskie-systemd-git": "BLOCKED: SYSTEMD_ONLY: Installs only a systemd user service file; not a package, would be a Shepherd service in Guix (deptree-resolver-260424x)",
}

# Exported symbols from new recipe module
EXPORTS = ["modrinth-app-appimage", "wpa-cute", "chomp", "folio", "kwin-effects-sliding-notifications"]

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
    for name, status in ALREADY_IN_GUIX.items():
        all_changes[name] = ("DONE", status)
    for name, status in AUR_DELETED.items():
        all_changes[name] = ("BLOCKED", status)
    for name, status in UPDATED_BLOCKED.items():
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
                if new_todo_status == "DONE" and f":{PASS_ID}:" not in lines[i]:
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
        lines = f.readlines()

    total_evaluated = 104
    recipes = len(RESOLVED_RECIPES)
    already_in_guix = len(ALREADY_IN_GUIX)
    aur_deleted = len(AUR_DELETED)
    updated = len(UPDATED_BLOCKED)
    remain = total_evaluated - recipes - already_in_guix
    comment = f"            ;; {PASS_ID}: {total_evaluated} BLOCKED evaluated ({recipes} recipes, {already_in_guix} ALREADY_IN_GUIX, {aur_deleted} AUR_REPO_DELETED, {remain - aur_deleted} remain BLOCKED)\n"

    # Check if already present
    content = ''.join(lines)
    if PASS_ID in content:
        print(f"  {PASS_ID} already in {PACKAGES_SCM}, skipping")
        return

    # Find the (define-module (gaurix packages) line and insert after it
    for i, line in enumerate(lines):
        if line.strip() == '(define-module (gaurix packages)':
            lines.insert(i + 1, comment)
            break

    tmp = tempfile.NamedTemporaryFile(mode='w', dir=PACKAGES_SCM.parent,
                                      prefix='.tmp_pkg_', suffix='.scm',
                                      delete=False)
    tmp.writelines(lines)
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

    # Find the position to insert: after the last deptree-resolver-260424w
    last_use_module_pos = content.rfind("#:use-module (gaurix packages deptree-resolver-260424w)")
    if last_use_module_pos == -1:
        last_use_module_pos = content.rfind("#:use-module (gaurix packages deptree-resolver-")

    if last_use_module_pos != -1:
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
