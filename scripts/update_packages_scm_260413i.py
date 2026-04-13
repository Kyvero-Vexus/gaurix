#!/usr/bin/env python3
"""Programmatically add recipe-resolver-260413i to packages.scm."""

import tempfile
import os
import shutil

PACKAGES_FILE = "guix/gaurix/packages.scm"

NEW_MODULES = [
    "  #:use-module (gaurix packages recipe-resolver-260413i)\n",
    "  #:use-module (gaurix packages recipe-resolver-260413i-blocked-notes)\n",
]

with open(PACKAGES_FILE, 'r') as f:
    content = f.read()

# Check if already present
if "recipe-resolver-260413i" in content:
    print("Already present, skipping")
else:
    # Insert before the closing paren
    insert_marker = "  #:use-module (gaurix packages recipe-resolver-260413h-blocked-notes)\n"
    if insert_marker in content:
        content = content.replace(
            insert_marker,
            insert_marker + "".join(NEW_MODULES)
        )
        # Atomic write
        fd, tmp = tempfile.mkstemp(dir=os.path.dirname(PACKAGES_FILE))
        with os.fdopen(fd, 'w') as f:
            f.write(content)
        shutil.move(tmp, PACKAGES_FILE)
        print(f"Added {len(NEW_MODULES)} modules to {PACKAGES_FILE}")
    else:
        print(f"ERROR: Could not find insertion marker in {PACKAGES_FILE}")
