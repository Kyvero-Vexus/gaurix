#!/usr/bin/env python3
"""Update general-compat.scm and packages.scm for recipe-resolver-260415n.
Deterministic: read, compute, write temp, atomic move."""

import os
import tempfile
import re

PASS_ID = "recipe-resolver-260415n"

# --- Update general-compat.scm ---
COMPAT_FILE = "guix/gaurix/packages/general-compat.scm"

with open(COMPAT_FILE, 'r') as f:
    compat_lines = f.readlines()

# 1. Add #:use-module line after the last recipe-resolver use-module
# Find the last recipe-resolver or deptree-resolver use-module line
last_resolver_idx = None
for i, line in enumerate(compat_lines):
    if '#:use-module (gaurix packages recipe-resolver-' in line or \
       '#:use-module (gaurix packages deptree-resolver-' in line:
        last_resolver_idx = i

if last_resolver_idx is not None:
    new_module_line = f"  #:use-module (gaurix packages {PASS_ID})\n"
    # Check if already added
    if new_module_line.strip() not in ''.join(compat_lines):
        compat_lines.insert(last_resolver_idx + 1, new_module_line)
        print(f"Added use-module for {PASS_ID} at line {last_resolver_idx + 2}")
    else:
        print(f"use-module for {PASS_ID} already present")

# 2. Add compat aliases at the end
# Find the last line of the file (before any trailing newline)
# Add aliases for resolved packages

compat_aliases = f"""
;; --- {PASS_ID} compat aliases ---
(define-public rustconn (package (inherit rustconn-bin) (name "rustconn")))
(define-public uzdoom (package (inherit uzdoom-bin) (name "uzdoom")))
(define-public polymc-qt5-git (package (inherit polymc-bin) (name "polymc-qt5-git")))
(define-public polymc (package (inherit polymc-bin) (name "polymc")))
(define-public slippi-mainline (package (inherit slippi-mainline-bin) (name "slippi-mainline")))
(define-public libretro-azahar-git (package (inherit libretro-azahar-core-bin) (name "libretro-azahar-git")))
(define-public libretro-azahar (package (inherit libretro-azahar-core-bin) (name "libretro-azahar")))
"""

# Check if aliases already added
if f"{PASS_ID} compat aliases" not in ''.join(compat_lines):
    compat_lines.append(compat_aliases)
    print(f"Added compat aliases for {PASS_ID}")
else:
    print(f"Compat aliases for {PASS_ID} already present")

# Write atomically
fd, tmp_path = tempfile.mkstemp(dir=os.path.dirname(COMPAT_FILE), suffix='.scm')
with os.fdopen(fd, 'w') as f:
    f.writelines(compat_lines)
os.replace(tmp_path, COMPAT_FILE)
print(f"Updated {COMPAT_FILE}")

# --- Update packages.scm ---
PKG_FILE = "guix/gaurix/packages.scm"

with open(PKG_FILE, 'r') as f:
    pkg_content = f.read()

# Add package names to the blocked-packages list
# Find the comment for the last resolver pass and add after it
new_pkg_block = f"""
            ;; {PASS_ID}
            rustconn-bin
            uzdoom-bin
            polymc-bin
            slippi-mainline-bin
            libretro-azahar-core-bin
            osrm-backend"""

if PASS_ID not in pkg_content:
    # Find the last ;; resolver comment in the file and add after its block
    # Insert before the closing paren of the module definition
    # Find the line with ";; deptree-resolver-260415n" or similar last entry
    lines = pkg_content.split('\n')

    # Find a good insertion point - after the last resolver comment block
    insert_idx = None
    for i, line in enumerate(lines):
        if line.strip().startswith(';; deptree-resolver-') or \
           line.strip().startswith(';; recipe-resolver-'):
            # Track the end of this block (last non-empty indented line after comment)
            for j in range(i + 1, min(i + 50, len(lines))):
                if lines[j].strip().startswith(';;') or lines[j].strip() == '' or \
                   not lines[j].startswith('            '):
                    insert_idx = j
                    break

    if insert_idx is None:
        # Fallback: insert near end of file, before last few lines
        insert_idx = len(lines) - 5

    lines.insert(insert_idx, new_pkg_block)
    pkg_content = '\n'.join(lines)

    fd, tmp_path = tempfile.mkstemp(dir=os.path.dirname(PKG_FILE), suffix='.scm')
    with os.fdopen(fd, 'w') as f:
        f.write(pkg_content)
    os.replace(tmp_path, PKG_FILE)
    print(f"Updated {PKG_FILE}")
else:
    print(f"{PASS_ID} already in {PKG_FILE}")
