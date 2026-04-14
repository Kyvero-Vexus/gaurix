#!/usr/bin/env python3
"""
Deterministic updater for general-compat.scm — adds recipe-resolver-260414k module.
"""
import tempfile
import shutil
import os

COMPAT_FILE = "guix/gaurix/packages/general-compat.scm"

# New module import line to add
NEW_IMPORT = "  #:use-module (gaurix packages recipe-resolver-260414k)"

# New export symbols from recipe-resolver-260414k
NEW_EXPORTS = [
    "mihomo-alpha-bin",
    "local-ai-bin",
    "livebook-bin",
    "video2x-bin",
    "pandora-launcher-bin",
    "alcom-bin",
    "polymc-bin",
]

def update_compat():
    with open(COMPAT_FILE, 'r') as f:
        content = f.read()

    # 1. Add import after the last recipe-resolver-260414 import
    lines = content.split('\n')
    insert_import_after = None
    for i, line in enumerate(lines):
        if 'recipe-resolver-260414' in line and '#:use-module' in line:
            insert_import_after = i

    if insert_import_after is not None:
        lines.insert(insert_import_after + 1, NEW_IMPORT)
        print(f"Inserted import at line {insert_import_after + 2}")
    else:
        print("ERROR: Could not find insertion point for import")
        return

    content = '\n'.join(lines)

    # 2. Write atomically
    fd, tmp_path = tempfile.mkstemp(dir=os.path.dirname(COMPAT_FILE), suffix='.scm.tmp')
    try:
        with os.fdopen(fd, 'w') as f:
            f.write(content)
        shutil.move(tmp_path, COMPAT_FILE)
    except:
        os.unlink(tmp_path)
        raise

    print(f"Updated {COMPAT_FILE}")

if __name__ == '__main__':
    update_compat()
