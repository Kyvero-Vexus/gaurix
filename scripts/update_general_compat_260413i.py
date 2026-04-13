#!/usr/bin/env python3
"""Programmatically add recipe-resolver-260413i to general-compat.scm."""

import tempfile
import os
import shutil

COMPAT_FILE = "guix/gaurix/packages/general-compat.scm"

with open(COMPAT_FILE, 'r') as f:
    content = f.read()

if "recipe-resolver-260413i" in content:
    print("Already present, skipping")
else:
    # Add module import after the last recipe-resolver import
    marker = "  #:use-module (gaurix packages recipe-resolver-260413h)\n"
    new_import = "  #:use-module (gaurix packages recipe-resolver-260413i)\n"
    if marker in content:
        content = content.replace(marker, marker + new_import)
        fd, tmp = tempfile.mkstemp(dir=os.path.dirname(COMPAT_FILE))
        with os.fdopen(fd, 'w') as f:
            f.write(content)
        shutil.move(tmp, COMPAT_FILE)
        print(f"Added module import to {COMPAT_FILE}")
    else:
        print(f"ERROR: Could not find marker in {COMPAT_FILE}")
