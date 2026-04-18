#!/usr/bin/env python3
"""Add recipe-resolver-260418v to general-compat.scm.

Deterministic full-file transform: read, compute, write temp, atomic move.
"""

import os
import tempfile
import shutil

COMPAT_FILE = "/home/slime/projects/gaurix/guix/gaurix/packages/general-compat.scm"
NEW_MODULE = "  #:use-module (gaurix packages recipe-resolver-260418v)"

def main():
    with open(COMPAT_FILE, "r") as f:
        lines = f.readlines()

    # Find insertion point: after the last recipe-resolver-2604* use-module
    insert_idx = None
    for i, line in enumerate(lines):
        if "#:use-module (gaurix packages recipe-resolver-260418u)" in line:
            insert_idx = i + 1
            break

    if insert_idx is None:
        # Fallback: insert after the last recipe-resolver line
        for i, line in enumerate(lines):
            if "#:use-module (gaurix packages recipe-resolver-" in line:
                insert_idx = i + 1

    if insert_idx is None:
        print("ERROR: Could not find insertion point in general-compat.scm")
        return

    # Check if already present
    for line in lines:
        if "recipe-resolver-260418v" in line:
            print("Already present in general-compat.scm, skipping")
            return

    lines.insert(insert_idx, NEW_MODULE + "\n")

    # Atomic write
    fd, tmp_path = tempfile.mkstemp(
        dir=os.path.dirname(COMPAT_FILE), suffix=".tmp"
    )
    try:
        with os.fdopen(fd, "w") as f:
            f.writelines(lines)
        shutil.move(tmp_path, COMPAT_FILE)
    except Exception:
        os.unlink(tmp_path)
        raise

    print(f"Added recipe-resolver-260418v to {COMPAT_FILE}")


if __name__ == "__main__":
    main()
