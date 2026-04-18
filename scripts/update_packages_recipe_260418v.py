#!/usr/bin/env python3
"""Add recipe-resolver-260418v exports to packages.scm.

Deterministic full-file transform: read, compute, write temp, atomic move.
"""

import os
import tempfile
import shutil

PACKAGES_FILE = "/home/slime/projects/gaurix/guix/gaurix/packages.scm"
BATCH_ID = "recipe-resolver-260418v"
NEW_PACKAGES = ["woodland", "minutor", "python-certomancer", "mii-emu"]

def main():
    with open(PACKAGES_FILE, "r") as f:
        content = f.read()

    # Append new define-module block at the end
    block = f"""
;; {BATCH_ID} (4 NRD resolved, 26 EXHAUSTED)
(define-module (gaurix packages)
  #:use-module (gaurix packages {BATCH_ID})
  #:re-export (
"""
    for pkg in NEW_PACKAGES:
        block += f"               {pkg}\n"
    block += "               ))\n"

    content += block

    # Atomic write
    fd, tmp_path = tempfile.mkstemp(
        dir=os.path.dirname(PACKAGES_FILE), suffix=".tmp"
    )
    try:
        with os.fdopen(fd, "w") as f:
            f.write(content)
        shutil.move(tmp_path, PACKAGES_FILE)
    except Exception:
        os.unlink(tmp_path)
        raise

    print(f"Added {len(NEW_PACKAGES)} exports to {PACKAGES_FILE}")


if __name__ == "__main__":
    main()
