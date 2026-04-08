#!/usr/bin/env python3
"""Programmatic update of packages.scm for recipe-resolver-260408g pass.

Adds #:use-module for recipe-resolver-260408g.
Uses deterministic full-file transform: read -> compute -> write temp -> atomic move.
"""

import os
import tempfile
import shutil

SRC = "guix/gaurix/packages.scm"


def main():
    with open(SRC, "r") as f:
        lines = f.readlines()

    content = "".join(lines)

    if "recipe-resolver-260408g" in content:
        print("recipe-resolver-260408g already in packages.scm, skipping")
        return

    # Find the last recipe-resolver-260408f import and add after it
    idx = None
    for i, line in enumerate(lines):
        if "recipe-resolver-260408f)" in line:
            idx = i

    if idx is not None:
        import_line = "  #:use-module (gaurix packages recipe-resolver-260408g)\n"
        lines.insert(idx + 1, import_line)
        print(f"Inserted module import at line {idx + 2}")

    # Write to temp file and atomic move
    fd, tmp_path = tempfile.mkstemp(
        dir=os.path.dirname(SRC), suffix=".scm.tmp"
    )
    try:
        with os.fdopen(fd, "w") as f:
            f.writelines(lines)
        shutil.move(tmp_path, SRC)
        print(f"Atomically updated {SRC}")
    except Exception:
        os.unlink(tmp_path)
        raise


if __name__ == "__main__":
    main()
