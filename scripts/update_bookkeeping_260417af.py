#!/usr/bin/env python3
"""
Programmatically update general-compat.scm and packages.scm
for recipe-resolver-260417af batch.
Uses atomic temp-file + move pattern as required.
"""

import json
import os
import shutil
import tempfile

BASE = "/home/slime/projects/gaurix"
RESULTS_FILE = os.path.join(BASE, "reports", "recipe-resolver-260417af-results.json")
COMPAT_FILE = os.path.join(BASE, "guix/gaurix/packages/general-compat.scm")
PACKAGES_FILE = os.path.join(BASE, "guix/gaurix/packages.scm")
RESOLVER_NAME = "recipe-resolver-260417af"

with open(RESULTS_FILE) as f:
    results = json.load(f)

success_names = [r['aur_name'] for r in results['success']]

# ============================================================
# 1. Update general-compat.scm
# ============================================================
print("Updating general-compat.scm...")

with open(COMPAT_FILE, 'r') as f:
    content = f.read()

lines = content.split('\n')

# Find insertion point for #:use-module - after the last recipe-resolver line in the header
# We need to add: #:use-module (gaurix packages recipe-resolver-260417af)
# Find the last #:use-module line that references a recipe-resolver or deptree-resolver
last_use_module_idx = -1
for i, line in enumerate(lines):
    if '#:use-module (gaurix packages recipe-resolver-' in line or \
       '#:use-module (gaurix packages deptree-resolver-' in line:
        last_use_module_idx = i

if last_use_module_idx == -1:
    print("ERROR: Could not find insertion point for #:use-module in general-compat.scm")
    exit(1)

# Insert the new use-module after the last one
new_use_module = f"  #:use-module (gaurix packages {RESOLVER_NAME})"
lines.insert(last_use_module_idx + 1, new_use_module)

# Now find the end of the file to add re-exports
# The file ends with re-export lines. Find the last re-export line.
last_reexport_idx = -1
for i, line in enumerate(lines):
    if '(re-export ' in line:
        last_reexport_idx = i

if last_reexport_idx == -1:
    print("ERROR: Could not find re-export section in general-compat.scm")
    exit(1)

# Build re-export block
reexport_lines = [f"\n; {RESOLVER_NAME}"]
for name in success_names:
    reexport_lines.append(f"(re-export {name})")

# Insert after the last re-export
for j, rline in enumerate(reexport_lines):
    lines.insert(last_reexport_idx + 1 + j, rline)

# Write to temp file then atomic move
new_content = '\n'.join(lines)
fd, tmp_path = tempfile.mkstemp(dir=os.path.dirname(COMPAT_FILE), suffix='.scm.tmp')
with os.fdopen(fd, 'w') as f:
    f.write(new_content)
shutil.move(tmp_path, COMPAT_FILE)
print(f"  Done. Added {len(success_names)} re-exports + 1 use-module.")

# ============================================================
# 2. Update packages.scm
# ============================================================
print("Updating packages.scm...")

with open(PACKAGES_FILE, 'r') as f:
    content = f.read()

# Append a new define-module section at the end
# Following the existing pattern
new_section = f"""
;; {RESOLVER_NAME} (93 Python recipes, 7 BLOCKED)
(define-module (gaurix packages)
  #:use-module (gaurix packages {RESOLVER_NAME})
  #:re-export ({success_names[0]}
"""
for name in success_names[1:]:
    new_section += f"               {name}\n"
new_section += "               ))\n"

new_content = content.rstrip('\n') + '\n' + new_section

fd, tmp_path = tempfile.mkstemp(dir=os.path.dirname(PACKAGES_FILE), suffix='.scm.tmp')
with os.fdopen(fd, 'w') as f:
    f.write(new_content)
shutil.move(tmp_path, PACKAGES_FILE)
print(f"  Done. Added define-module section with {len(success_names)} re-exports.")

print("\nAll bookkeeping files updated successfully.")
