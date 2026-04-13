#!/usr/bin/env python3
"""
Update general-compat.scm to add deptree-resolver-260413k module import and compat aliases.
Uses deterministic programmatic full-file transform (read, compute, write temp, atomic move).
"""

import os
import re
import shutil
import tempfile

BASE = "/home/slime/projects/gaurix"
COMPAT_FILE = os.path.join(BASE, "guix/gaurix/packages/general-compat.scm")
RUN_ID = "deptree-resolver-260413k"

# Read the entire file
with open(COMPAT_FILE, 'r') as f:
    content = f.read()

# Step 1: Add module import if not already present
module_import = f"  #:use-module (gaurix packages {RUN_ID})"
if module_import not in content:
    lines = content.split('\n')
    insert_idx = None
    for i, line in enumerate(lines):
        if '#:use-module (gaurix packages' in line and not line.strip().startswith(';;'):
            insert_idx = i

    if insert_idx is not None:
        lines.insert(insert_idx + 1, module_import)
        content = '\n'.join(lines)
        print(f"  Added module import at line {insert_idx + 2}")
    else:
        print("  WARNING: Could not find insertion point for module import")

# Step 2: Add compat aliases at end of file
# Recipe packages that need compat aliases (bin -> non-bin aliases)
compat_aliases = [
    ("fastfind", "fastfind-bin"),
    ("fist", "fist-bin"),
]

alias_block = f"\n; --- {RUN_ID} compat aliases ---\n"
for alias, parent in compat_aliases:
    alias_block += f'(define-public {alias} (package (inherit {parent}) (name "{alias}")))\n'

if f"; --- {RUN_ID} compat aliases ---" not in content:
    if not content.endswith('\n'):
        content += '\n'
    content += alias_block
    print(f"  Added {len(compat_aliases)} compat aliases")
else:
    print("  Compat aliases already present")

# Write atomically
fd, tmp_path = tempfile.mkstemp(dir=os.path.dirname(COMPAT_FILE), suffix=".scm.tmp")
try:
    with os.fdopen(fd, 'w') as tmp:
        tmp.write(content)
    shutil.move(tmp_path, COMPAT_FILE)
except:
    os.unlink(tmp_path)
    raise
print(f"  Wrote {COMPAT_FILE}")
