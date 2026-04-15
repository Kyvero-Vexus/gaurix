#!/usr/bin/env python3
"""
Update general-compat.scm to add recipe-resolver-260415e module import and re-exports.
"""

import re
import os
import tempfile
import shutil

FILE = "/home/slime/projects/gaurix/guix/gaurix/packages/general-compat.scm"

NEW_MODULE = "  #:use-module (gaurix packages recipe-resolver-260415e)"

NEW_EXPORTS = [
    "hardinfo2",
    "ssh-studio",
    "hyprqt6engine",
    "haskell-unix-compat",
    "crengine-ng",
    "crqt-ng",
    "git-series",
    "wlr-which-key-bin",
    "manaverse-sdl2",
    "karp",
]

with open(FILE, "r") as f:
    lines = f.readlines()

# --- Step 1: Add #:use-module line after the last recipe-resolver-260415* import ---
last_recipe_resolver_idx = None
for i, line in enumerate(lines):
    if re.search(r'#:use-module \(gaurix packages recipe-resolver-260415', line):
        last_recipe_resolver_idx = i

if last_recipe_resolver_idx is None:
    raise RuntimeError("Could not find any #:use-module (gaurix packages recipe-resolver-260415...) line")

print(f"Found last recipe-resolver-260415* import at line {last_recipe_resolver_idx + 1}: {lines[last_recipe_resolver_idx].rstrip()}")

# Insert after that line
lines.insert(last_recipe_resolver_idx + 1, NEW_MODULE + "\n")
print(f"Inserted new module import after line {last_recipe_resolver_idx + 1}")

# --- Step 2: Find the closing )) of the #:export section and add new exports before it ---
# After insertion, line numbers shifted by 1. Re-scan.
export_close_idx = None
for i, line in enumerate(lines):
    if line.strip() == "))":
        # Check that this is inside the #:export block (should be after #:export and before ;;; --- lines)
        # The first )) after the #:export ( line is our target
        # We know from reading the file that the )) at line ~2618 (now 2619) closes the export list
        export_close_idx = i
        break

if export_close_idx is None:
    raise RuntimeError("Could not find closing )) of the #:export section")

print(f"Found export list closing ')) ' at line {export_close_idx + 1}")

# Build the new export lines
new_export_lines = []
new_export_lines.append("            ;; recipe-resolver-260415e recipes\n")
for pkg in NEW_EXPORTS:
    new_export_lines.append(f"            {pkg}\n")

# Insert before the ))
for j, el in enumerate(new_export_lines):
    lines.insert(export_close_idx + j, el)

print(f"Inserted {len(new_export_lines)} export lines before the closing ))")

# --- Step 3: Write to temp file and atomically move ---
dir_name = os.path.dirname(FILE)
fd, tmp_path = tempfile.mkstemp(dir=dir_name, suffix=".scm.tmp")
try:
    with os.fdopen(fd, "w") as tmp_f:
        tmp_f.writelines(lines)
    # Preserve original file permissions
    shutil.copymode(FILE, tmp_path)
    os.rename(tmp_path, FILE)
    print(f"Successfully wrote updated file to {FILE}")
except:
    os.unlink(tmp_path)
    raise

# --- Verify ---
with open(FILE, "r") as f:
    content = f.read()

assert "#:use-module (gaurix packages recipe-resolver-260415e)" in content, "Module import not found in output!"
for pkg in NEW_EXPORTS:
    assert pkg in content, f"Export {pkg} not found in output!"

print("Verification passed: all imports and exports present.")
print(f"New file has {content.count(chr(10))} lines.")
