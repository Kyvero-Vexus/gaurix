#!/usr/bin/env python3
"""Deterministic programmatic update of packages.scm and general-compat.scm.

Adds deptree-resolver-260414r package exports to packages.scm.
"""

import json
import shutil
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
PACKAGES_SCM = ROOT / "guix" / "gaurix" / "packages.scm"
SUMMARY = ROOT / "reports" / "deptree-resolver-260414r-summary.json"
PASS_ID = "deptree-resolver-260414r"


def main():
    with open(SUMMARY) as f:
        data = json.load(f)

    names = sorted(r['guix_name'] for r in data['recipes'])
    print(f"Adding {len(names)} package exports to packages.scm")

    # Read existing file
    with open(PACKAGES_SCM, 'r') as f:
        content = f.read()

    # Find the closing "))""
    # Insert new exports just before the final "))"
    if content.rstrip().endswith('))'):
        # Remove final "))", add new exports, re-add "))"
        content_stripped = content.rstrip()
        content_body = content_stripped[:-2]

        new_block = f"\n               ;; {PASS_ID}\n"
        for name in names:
            new_block += f"               {name}\n"

        new_content = content_body + new_block + "))\n"

        # Write to temp, atomic move
        tmp = PACKAGES_SCM.with_suffix('.scm.tmp')
        with open(tmp, 'w') as f:
            f.write(new_content)
        shutil.move(str(tmp), str(PACKAGES_SCM))
        print(f"  Updated: {PACKAGES_SCM}")
    else:
        print(f"ERROR: Unexpected file format in {PACKAGES_SCM}")
        return 1

    return 0


if __name__ == "__main__":
    exit(main())
