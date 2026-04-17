#!/usr/bin/env python3
"""Fix packages.scm for deptree-resolver-260416e.

The re-exports were incorrectly placed outside define-module.
Correct approach: add symbols to the define-module export list,
and remove the misplaced re-export section.
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
        content = f.read()

    # Remove the misplaced re-export section at the end
    content = re.sub(
        r"\n;; deptree-resolver-260416e\n(?:\(re-export [^\)]+\)\n)+",
        "",
        content,
    )

    # Add symbols to the define-module export list before the closing ))
    new_symbols = f"\n            ;; {PASS_ID}\n"
    for var in var_names:
        new_symbols += f"            {var}\n"

    # Find the closing )) of the define-module form and insert before it
    content = content.replace(
        "\n))\n",
        f"{new_symbols}))\n",
        1,  # only first occurrence
    )

    # Atomic write
    fd, tmp_path = tempfile.mkstemp(dir=str(PACKAGES_FILE.parent), suffix=".scm.tmp")
    try:
        with os.fdopen(fd, "w") as f:
            f.write(content)
        shutil.move(tmp_path, PACKAGES_FILE)
    except Exception:
        os.unlink(tmp_path)
        raise

    print(f"  Fixed packages.scm: {len(var_names)} symbols added to define-module export list")


if __name__ == "__main__":
    main()
