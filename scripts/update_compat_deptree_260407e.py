#!/usr/bin/env python3
"""Update general-compat.scm to add deptree-resolver-260407e module and compat aliases."""

import re
import sys
import tempfile
import shutil

COMPAT_FILE = "guix/gaurix/packages/general-compat.scm"
NEW_MODULE = "(gaurix packages deptree-resolver-260407e)"

def main():
    with open(COMPAT_FILE, "r") as f:
        content = f.read()

    lines = content.split("\n")

    # Check if module already added
    if NEW_MODULE in content:
        print(f"Module {NEW_MODULE} already in general-compat.scm, skipping")
        return

    # Find the last #:use-module line
    last_use_module_idx = -1
    for i, line in enumerate(lines):
        if "#:use-module" in line:
            last_use_module_idx = i

    if last_use_module_idx == -1:
        print("ERROR: Could not find #:use-module lines", file=sys.stderr)
        sys.exit(1)

    # Insert new use-module
    lines.insert(last_use_module_idx + 1, f"  #:use-module {NEW_MODULE}")
    print(f"Added #:use-module for {NEW_MODULE}")

    # Write atomically
    result = "\n".join(lines)
    with tempfile.NamedTemporaryFile(mode='w', dir='.', suffix='.tmp', delete=False) as tmp:
        tmp.write(result)
        tmp_name = tmp.name
    shutil.move(tmp_name, COMPAT_FILE)
    print(f"Updated {COMPAT_FILE}")


if __name__ == "__main__":
    main()
