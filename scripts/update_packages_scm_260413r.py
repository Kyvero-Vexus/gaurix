#!/usr/bin/env python3
"""Programmatically add recipe-resolver-260413r to packages.scm."""

import tempfile
import os
import shutil

PACKAGES_FILE = "guix/gaurix/packages.scm"

NEW_MODULES = [
    "  #:use-module (gaurix packages recipe-resolver-260413q)\n",
    "  #:use-module (gaurix packages recipe-resolver-260413r)\n",
    "  #:use-module (gaurix packages recipe-resolver-260413r-blocked-notes)\n",
]

with open(PACKAGES_FILE, 'r') as f:
    content = f.read()

# Check if already present
if "recipe-resolver-260413r" in content:
    print("recipe-resolver-260413r already present, skipping")
else:
    # Insert after the last recipe-resolver entry
    insert_marker = "  #:use-module (gaurix packages recipe-resolver-260413p-blocked-notes)\n"
    if insert_marker in content:
        # Also add 260413q if missing (it exists as file but not in packages.scm)
        modules_to_add = []
        if "recipe-resolver-260413q" not in content:
            modules_to_add.append(NEW_MODULES[0])
        modules_to_add.append(NEW_MODULES[1])
        modules_to_add.append(NEW_MODULES[2])

        content = content.replace(
            insert_marker,
            insert_marker + "".join(modules_to_add)
        )
        # Atomic write
        fd, tmp = tempfile.mkstemp(dir=os.path.dirname(PACKAGES_FILE))
        with os.fdopen(fd, 'w') as f:
            f.write(content)
        shutil.move(tmp, PACKAGES_FILE)
        print(f"Added {len(modules_to_add)} modules to {PACKAGES_FILE}")
    else:
        print(f"ERROR: Could not find insertion marker in {PACKAGES_FILE}")
