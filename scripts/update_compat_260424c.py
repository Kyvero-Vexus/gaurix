#!/usr/bin/env python3
"""
Update general-compat.scm and packages.scm for deptree-resolver-260424c.
Deterministic programmatic full-file transform.
"""

import os
import re
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
COMPAT_FILE = ROOT / "guix" / "gaurix" / "packages" / "general-compat.scm"
PACKAGES_FILE = ROOT / "guix" / "gaurix" / "packages.scm"
SCM_FILE = ROOT / "guix" / "gaurix" / "packages" / "deptree-resolver-260424c.scm"

PASS_ID = "deptree-resolver-260424c"
MODULE_LINE = f"  #:use-module (gaurix packages {PASS_ID})"

# Extract export names from the .scm file
recipe_names = []
with open(SCM_FILE) as f:
    for line in f:
        m = re.match(r'\(define-public\s+(\S+)', line)
        if m:
            recipe_names.append(m.group(1))

print(f"Found {len(recipe_names)} recipes in {PASS_ID}")

# === Update general-compat.scm ===
print(f"\nUpdating {COMPAT_FILE}...")
content = COMPAT_FILE.read_text()

# 1. Add #:use-module line after the last deptree-resolver-260424b line
if MODULE_LINE not in content:
    # Find where to insert (after deptree-resolver-260424b)
    insert_after = "  #:use-module (gaurix packages deptree-resolver-260424b)"
    if insert_after in content:
        content = content.replace(
            insert_after,
            insert_after + "\n" + MODULE_LINE
        )
    else:
        # Fallback: insert before #:export
        content = content.replace(
            "  #:export (",
            MODULE_LINE + "\n  #:export ("
        )

# 2. Add exports - find the last export block before the closing ))
# Add a new section at the end of exports
export_block = f"\n;;; {PASS_ID}\n"
for name in recipe_names:
    export_block += f"            {name}\n"

# Insert before the final closing ))  of #:export
# Find the position of the last )) in the define-module block
# We look for the pattern:  )) at the end of the exports section
lines = content.split("\n")
new_lines = []
inserted_exports = False
found_export_end = False

# Check if exports already added
if f";;; {PASS_ID}" in content:
    print(f"  Exports for {PASS_ID} already present, skipping")
    inserted_exports = True

if not inserted_exports:
    for i, line in enumerate(lines):
        # Find the closing )) of the #:export section
        # It's typically a line like "            ))"
        if not inserted_exports and line.strip() == "))" and i > 0:
            # Check if we're in the define-module block (look back for export names)
            in_export = False
            for j in range(max(0, i-20), i):
                if "#:export" in lines[j] or ";;;" in lines[j]:
                    in_export = True
                    break
                if re.match(r'^\s+\S+\s*$', lines[j]) and not lines[j].strip().startswith("("):
                    in_export = True
                    break
            if in_export:
                new_lines.append(export_block.rstrip())
                new_lines.append(line)
                inserted_exports = True
                continue
        new_lines.append(line)

    if inserted_exports:
        content = "\n".join(new_lines)

# 3. Add compat aliases section at the end of the file
compat_section = f"\n;;; {PASS_ID}\n"
compat_section += f";;; {len(recipe_names)} packages resolved via dep-tree priority\n"
compat_section += f";;; All recipes in (gaurix packages {PASS_ID})\n"

if f";;; {PASS_ID}" not in content.split("  #:export")[0]:
    # Module import was added, now add the compat section at end
    pass

if f";;; {PASS_ID}\n;;; {len(recipe_names)} packages" not in content:
    content = content.rstrip() + "\n" + compat_section + "\n"

# Write atomically
tmp = COMPAT_FILE.with_suffix('.tmp')
tmp.write_text(content)
os.replace(str(tmp), str(COMPAT_FILE))
print(f"  Updated general-compat.scm")

# === Update packages.scm ===
print(f"\nUpdating {PACKAGES_FILE}...")
pkg_content = PACKAGES_FILE.read_text()

# Add comment about this pass
pass_comment = f";;; {PASS_ID}: {len(recipe_names)} BLOCKED resolved, dep-tree priority"

if pass_comment not in pkg_content:
    # Find the last ;;; deptree-resolver or recipe-resolver comment
    lines = pkg_content.split("\n")
    insert_idx = None
    for i, line in enumerate(lines):
        if line.startswith(";;; deptree-resolver-260424b") or line.startswith(";;; recipe-resolver-260424"):
            insert_idx = i

    if insert_idx is not None:
        lines.insert(insert_idx + 1, pass_comment)
    else:
        # Fallback: add after (define-module line
        for i, line in enumerate(lines):
            if "(define-module" in line:
                insert_idx = i + 1
                break
        if insert_idx:
            lines.insert(insert_idx, pass_comment)

    pkg_content = "\n".join(lines)

# Add exports for new recipes
for name in recipe_names:
    if name not in pkg_content:
        # Find the last export line and add after it
        lines = pkg_content.split("\n")
        last_export_idx = None
        for i, line in enumerate(lines):
            stripped = line.strip()
            if stripped and not stripped.startswith(";") and not stripped.startswith("(") and not stripped.startswith("#") and not stripped.startswith(")"):
                # Likely an export name
                last_export_idx = i

        if last_export_idx:
            lines.insert(last_export_idx + 1, f"            {name}")
            pkg_content = "\n".join(lines)

# Write atomically
tmp = PACKAGES_FILE.with_suffix('.tmp')
tmp.write_text(pkg_content)
os.replace(str(tmp), str(PACKAGES_FILE))
print(f"  Updated packages.scm")
print(f"\nDone. {len(recipe_names)} exports added.")
