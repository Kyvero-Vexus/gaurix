#!/usr/bin/env python3
"""Add deptree-resolver-260418p to general-compat.scm and packages.scm (deterministic full-file transforms)."""

import shutil
import re

COMPAT_FILE = "guix/gaurix/packages/general-compat.scm"
PACKAGES_FILE = "guix/gaurix/packages.scm"
PASS_ID = "deptree-resolver-260418p"
NEW_MODULE = f"  #:use-module (gaurix packages {PASS_ID})"
ANCHOR_MODULE = "  #:use-module (gaurix packages deptree-resolver-260417as)"


def update_compat():
    with open(COMPAT_FILE, 'r') as f:
        content = f.read()

    if PASS_ID in content:
        print(f"{PASS_ID} already in {COMPAT_FILE}, skipping")
        return

    if ANCHOR_MODULE in content:
        content = content.replace(
            ANCHOR_MODULE,
            ANCHOR_MODULE + "\n" + NEW_MODULE
        )
    else:
        # Fallback: insert before (gnu packages freedesktop)
        content = content.replace(
            "  #:use-module (gnu packages freedesktop)",
            NEW_MODULE + "\n  #:use-module (gnu packages freedesktop)"
        )

    tmp = COMPAT_FILE + ".tmp"
    with open(tmp, 'w') as f:
        f.write(content)
    shutil.move(tmp, COMPAT_FILE)
    print(f"Added {PASS_ID} to {COMPAT_FILE}")


def update_packages():
    with open(PACKAGES_FILE, 'r') as f:
        content = f.read()

    if PASS_ID in content:
        print(f"{PASS_ID} already in {PACKAGES_FILE}, skipping")
        return

    # Add a comment about this pass after the last deptree-resolver comment
    # Find the last occurrence of ";; deptree-resolver-" or ";; recipe-resolver-"
    lines = content.split('\n')
    insert_idx = None
    for i, line in enumerate(lines):
        if line.strip().startswith(';; deptree-resolver-') or line.strip().startswith(';; recipe-resolver-'):
            insert_idx = i

    if insert_idx is not None:
        lines.insert(insert_idx + 1, f";; {PASS_ID}")
    else:
        # Fallback: add near the top after the module definition
        for i, line in enumerate(lines):
            if line.strip() == '':
                insert_idx = i
                lines.insert(i + 1, f";; {PASS_ID}")
                break

    content = '\n'.join(lines)

    tmp = PACKAGES_FILE + ".tmp"
    with open(tmp, 'w') as f:
        f.write(content)
    shutil.move(tmp, PACKAGES_FILE)
    print(f"Added {PASS_ID} comment to {PACKAGES_FILE}")


if __name__ == '__main__':
    update_compat()
    update_packages()
