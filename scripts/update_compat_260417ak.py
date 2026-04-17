#!/usr/bin/env python3
"""Add deptree-resolver-260417ak to general-compat.scm.

Deterministic: read → compute → write temp → atomic move.
"""

import shutil
import tempfile
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
COMPAT_FILE = ROOT / "guix" / "gaurix" / "packages" / "general-compat.scm"
NEW_MODULE = "  #:use-module (gaurix packages deptree-resolver-260417ak)"
AFTER_MODULE = "  #:use-module (gaurix packages deptree-resolver-260417ah)"


def update_compat():
    with open(COMPAT_FILE, 'r') as f:
        lines = f.readlines()

    output = []
    inserted = False

    for line in lines:
        output.append(line)
        if not inserted and AFTER_MODULE in line:
            output.append(NEW_MODULE + '\n')
            inserted = True

    if not inserted:
        # Fallback: insert after the last deptree-resolver line
        output2 = []
        last_deptree_idx = -1
        for i, line in enumerate(output):
            if 'deptree-resolver-' in line and '#:use-module' in line:
                last_deptree_idx = i
        if last_deptree_idx >= 0:
            output2 = output[:last_deptree_idx + 1]
            output2.append(NEW_MODULE + '\n')
            output2.extend(output[last_deptree_idx + 1:])
            output = output2
            inserted = True

    if not inserted:
        print("ERROR: Could not find insertion point!")
        return False

    # Write atomically
    fd, tmp_path = tempfile.mkstemp(
        dir=str(COMPAT_FILE.parent), prefix='.compat_update_', suffix='.scm')
    try:
        with open(fd, 'w') as f:
            f.writelines(output)
        shutil.move(tmp_path, str(COMPAT_FILE))
    except:
        import os
        os.unlink(tmp_path)
        raise

    print(f"Updated {COMPAT_FILE.name}: inserted {NEW_MODULE.strip()}")
    return True


if __name__ == '__main__':
    update_compat()
