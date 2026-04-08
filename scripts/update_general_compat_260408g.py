#!/usr/bin/env python3
"""Update general-compat.scm to include deptree-resolver-260408g module."""

import os
import shutil
import tempfile
from pathlib import Path

RUN_ID = "deptree-resolver-260408g"
ROOT = Path(__file__).resolve().parent.parent
COMPAT_SCM = ROOT / "guix" / "gaurix" / "packages" / "general-compat.scm"

def main():
    content = COMPAT_SCM.read_text()

    if f"(gaurix packages {RUN_ID})" in content:
        print(f"general-compat.scm: {RUN_ID} already present, skipping")
        return

    lines = content.split("\n")

    import_idx = -1
    for i, line in enumerate(lines):
        if "gaurix packages deptree-resolver-260408" in line:
            import_idx = i

    if import_idx < 0:
        print("ERROR: could not find deptree-resolver-260408 import")
        return

    lines.insert(import_idx + 1, f"  #:use-module (gaurix packages {RUN_ID})")
    content = "\n".join(lines)

    fd, tmp = tempfile.mkstemp(dir=str(ROOT), suffix=".scm.tmp")
    with os.fdopen(fd, "w") as f:
        f.write(content)
    shutil.move(tmp, str(COMPAT_SCM))
    print(f"general-compat.scm updated with {RUN_ID} import")


if __name__ == "__main__":
    main()
