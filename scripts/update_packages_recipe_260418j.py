#!/usr/bin/env python3
"""
Programmatically update general-compat.scm and packages.scm to import
recipe-resolver-260418j module.

Uses deterministic full-file transforms: read, compute, write temp, atomic move.
"""
import re
import shutil
import tempfile
from pathlib import Path

PASS_ID = "recipe-resolver-260418j"
MODULE_LINE = f"  #:use-module (gaurix packages {PASS_ID})"
COMPAT_FILE = "guix/gaurix/packages/general-compat.scm"
PACKAGES_FILE = "guix/gaurix/packages.scm"
COMMENT_LINE = f"            ;; {PASS_ID}: 30 NRD resolved"


def update_general_compat():
    """Add #:use-module for recipe-resolver-260418j to general-compat.scm."""
    with open(COMPAT_FILE, "r") as f:
        content = f.read()

    # Check if already present
    if PASS_ID in content:
        print(f"  [general-compat.scm] Already contains {PASS_ID}, skipping")
        return

    # Find the last #:use-module line before the closing paren of define-module
    lines = content.split('\n')
    insert_idx = None
    for i, line in enumerate(lines):
        if '#:use-module' in line:
            insert_idx = i

    if insert_idx is None:
        print(f"  [general-compat.scm] ERROR: could not find #:use-module lines")
        return

    # Insert after the last #:use-module line
    lines.insert(insert_idx + 1, MODULE_LINE)

    new_content = '\n'.join(lines)

    # Write atomically
    with tempfile.NamedTemporaryFile(
        mode="w", dir="guix/gaurix/packages", prefix=".compat_",
        suffix=".scm", delete=False
    ) as tmp:
        tmp.write(new_content)
        tmp_path = tmp.name
    shutil.move(tmp_path, COMPAT_FILE)
    print(f"  [general-compat.scm] Added {MODULE_LINE.strip()}")


def update_packages():
    """Add comment for recipe-resolver-260418j to packages.scm."""
    with open(PACKAGES_FILE, "r") as f:
        content = f.read()

    # Check if already present
    if PASS_ID in content:
        print(f"  [packages.scm] Already contains {PASS_ID}, skipping")
        return

    # Find the line with recipe-resolver-260418i or the last comment before exports
    lines = content.split('\n')
    insert_idx = None
    for i, line in enumerate(lines):
        if 'recipe-resolver-260418' in line or 'deptree-resolver-260418' in line:
            insert_idx = i

    if insert_idx is None:
        # Find last comment line before first export
        for i, line in enumerate(lines):
            if line.strip().startswith(';;') and 'resolver' in line:
                insert_idx = i

    if insert_idx is None:
        print(f"  [packages.scm] ERROR: could not find insertion point")
        return

    # Insert after found line
    lines.insert(insert_idx + 1, COMMENT_LINE)

    new_content = '\n'.join(lines)

    # Write atomically
    with tempfile.NamedTemporaryFile(
        mode="w", dir="guix/gaurix/packages", prefix=".packages_",
        suffix=".scm", delete=False
    ) as tmp:
        tmp.write(new_content)
        tmp_path = tmp.name
    shutil.move(tmp_path, PACKAGES_FILE)
    print(f"  [packages.scm] Added {COMMENT_LINE.strip()}")


def main():
    print(f"[{PASS_ID}] Updating general-compat.scm and packages.scm...")
    update_general_compat()
    update_packages()
    print(f"[{PASS_ID}] Done.")


if __name__ == "__main__":
    main()
