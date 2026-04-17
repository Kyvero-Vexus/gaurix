#!/usr/bin/env python3
"""Fix packages.scm for deptree-resolver-260416e (v2).

Remove the misplaced block from the middle and insert symbols
before the final )) of the last define-module form.
"""

import json
import os
import re
import shutil
import tempfile
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
PASS_ID = "deptree-resolver-260416e"
SUMMARY = ROOT / "reports" / f"{PASS_ID}-summary.json"
PACKAGES_FILE = ROOT / "guix" / "gaurix" / "packages.scm"


def sanitize_name(name):
    return name.lower().replace("_", "-").replace(".", "-")


def main():
    with open(SUMMARY) as f:
        summary = json.load(f)

    resolved = summary["resolved_packages"]
    var_names = [sanitize_name(p["name"]) for p in resolved]

    with open(PACKAGES_FILE, "r") as f:
        lines = f.readlines()

    # Step 1: Remove the misplaced block
    # Find start: line containing ";; deptree-resolver-260416e"
    # Find end: the first line after the block that doesn't match the pattern
    new_lines = []
    i = 0
    while i < len(lines):
        line = lines[i]
        if f";; {PASS_ID}" in line:
            # Skip this line and all following lines that are symbols for this pass
            i += 1
            while i < len(lines):
                stripped = lines[i].strip()
                if stripped and not stripped.startswith(";;") and stripped != "))" and not stripped.startswith("("):
                    # This is a symbol name - skip it
                    i += 1
                else:
                    break
            continue
        new_lines.append(line)
        i += 1

    # Step 2: Find the last )) and insert before it
    # Find last index of "))\n"
    last_close_idx = None
    for idx in range(len(new_lines) - 1, -1, -1):
        if new_lines[idx].strip() == "))":
            last_close_idx = idx
            break

    if last_close_idx is None:
        print("ERROR: Could not find closing )) in packages.scm")
        return

    # Build the new symbol block
    symbol_lines = [f"            ;; {PASS_ID}\n"]
    for var in var_names:
        symbol_lines.append(f"            {var}\n")

    # Insert before the last ))
    new_lines = new_lines[:last_close_idx] + symbol_lines + new_lines[last_close_idx:]

    # Atomic write
    fd, tmp_path = tempfile.mkstemp(dir=str(PACKAGES_FILE.parent), suffix=".scm.tmp")
    try:
        with os.fdopen(fd, "w") as f:
            f.writelines(new_lines)
        shutil.move(tmp_path, PACKAGES_FILE)
    except Exception:
        os.unlink(tmp_path)
        raise

    print(f"  Fixed packages.scm: {len(var_names)} symbols moved to last define-module form")


if __name__ == "__main__":
    main()
