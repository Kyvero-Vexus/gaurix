#!/usr/bin/env python3
"""Programmatically add deptree-resolver-260413i to packages.scm."""
import tempfile, os, shutil

PACKAGES_FILE = "/home/slime/projects/gaurix/guix/gaurix/packages.scm"
RUN_ID = "deptree-resolver-260413i"

with open(PACKAGES_FILE, 'r') as f:
    content = f.read()

if RUN_ID in content:
    print(f"{RUN_ID} already present, skipping")
else:
    insert_marker = "  #:use-module (gaurix packages recipe-resolver-260413r-blocked-notes)\n)"
    new_modules = (
        f"  #:use-module (gaurix packages {RUN_ID})\n"
        f"  #:use-module (gaurix packages {RUN_ID}-blocked-notes)\n)"
    )
    if insert_marker in content:
        content = content.replace(insert_marker, insert_marker[:-1] + "\n" +
            f"  #:use-module (gaurix packages {RUN_ID})\n"
            f"  #:use-module (gaurix packages {RUN_ID}-blocked-notes)\n)")
    else:
        # Try to find closing paren of define-module
        # Find last #:use-module line and insert before the closing )
        lines = content.split('\n')
        new_lines = []
        inserted = False
        for idx in range(len(lines)-1, -1, -1):
            if not inserted and lines[idx].strip() == ')' and idx > 0 and '#:use-module' in lines[idx-1]:
                lines.insert(idx, f"  #:use-module (gaurix packages {RUN_ID})")
                lines.insert(idx+1, f"  #:use-module (gaurix packages {RUN_ID}-blocked-notes)")
                inserted = True
                break
        if inserted:
            content = '\n'.join(lines)
        else:
            print("ERROR: Could not find insertion point")
            exit(1)
    
    fd, tmp = tempfile.mkstemp(dir=os.path.dirname(PACKAGES_FILE))
    with os.fdopen(fd, 'w') as f:
        f.write(content)
    shutil.move(tmp, PACKAGES_FILE)
    print(f"Added {RUN_ID} modules to {PACKAGES_FILE}")
