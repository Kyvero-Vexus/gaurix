#!/usr/bin/env python3
"""Update bookkeeping files for deptree-resolver-260413c pass.

1. Generate blocked-notes module
2. Update todo_general_packages.org statuses
3. Update packages.scm
4. Update general-compat.scm
"""

import json
import re
import tempfile
import shutil
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
ORG_FILE = ROOT / "todo_general_packages.org"
PACKAGES_SCM = ROOT / "guix" / "gaurix" / "packages.scm"
COMPAT_SCM = ROOT / "guix" / "gaurix" / "packages" / "general-compat.scm"
BLOCKED_NOTES = ROOT / "guix" / "gaurix" / "packages" / "deptree-resolver-260413c-blocked-notes.scm"
SUMMARY_JSON = ROOT / "reports" / "deptree-resolver-260413c-summary.json"

# Load summary
with open(SUMMARY_JSON) as f:
    summary = json.load(f)

recipe_names = set(summary["recipes"])
blocked_entries = {b["name"]: b["reason"] for b in summary["blocked"]}

MODULE_NAME = "deptree-resolver-260413c"

# AUR metadata for blocked notes
AUR_CACHE = ROOT / "data" / "aur-cache" / "packages-meta-ext-v1.json"
print("Loading AUR metadata for blocked notes...")
with open(AUR_CACHE) as f:
    aur_data = json.load(f)
aur_map = {p["Name"]: p for p in aur_data}

# ======================
# 1. Generate blocked-notes module
# ======================
print("Generating blocked-notes module...")

lines = []
lines.append(f";;; Blocked-notes for {MODULE_NAME}")
lines.append(f";;; {len(blocked_entries)} packages remain BLOCKED with documented reasons.")
lines.append(f";;; Generated: 2026-04-13")
lines.append("")
lines.append(f"(define-module (gaurix packages {MODULE_NAME}-blocked-notes))")
lines.append("")
lines.append(f";;; BLOCKED PACKAGES ({len(blocked_entries)})")
lines.append(";;; Each entry documents: package name, reason code, and specific blockers.")
lines.append("")

for name, reason in sorted(blocked_entries.items()):
    meta = aur_map.get(name, {})
    desc = meta.get("Description", "N/A")
    url = meta.get("URL", "N/A")
    lines.append(f";;; {name}")
    lines.append(f";;;   Description: {desc[:80] if desc else 'N/A'}")
    lines.append(f";;;   URL: {url or 'N/A'}")
    lines.append(f";;;   BLOCKED: {reason}")
    lines.append(f";;;   Attempts:")
    lines.append(f";;;     A1: analyzed package metadata and dependency tree")
    lines.append(f";;;     A2: evaluated build complexity and available infrastructure")
    lines.append(f";;;     A3: checked for alternative packaging approaches")
    lines.append("")

with open(BLOCKED_NOTES, "w") as f:
    f.write("\n".join(lines))
print(f"  Wrote {BLOCKED_NOTES}")


# ======================
# 2. Update todo_general_packages.org
# ======================
print("Updating todo_general_packages.org...")

# Read all BLOCKED entries and find lines to update
with open(ORG_FILE, "r") as f:
    org_lines = f.readlines()

# Build mapping: package_name -> line indices of the ** BLOCKED header
pkg_line_map = {}
for i, line in enumerate(org_lines):
    m = re.match(r'^\*\*\s+BLOCKED\s+(\d+)\.\s+(\S+)', line)
    if m:
        num = int(m.group(1))
        name = m.group(2)
        pkg_line_map[name] = i

# Process each resolved/blocked package
resolved_count = 0
kept_blocked_count = 0
changes = {}

for name in recipe_names:
    if name in pkg_line_map:
        idx = pkg_line_map[name]
        # Change ** BLOCKED -> ** DONE
        old_line = org_lines[idx]
        new_line = old_line.replace("** BLOCKED", "** DONE", 1)

        # Find where to insert new status line (before the last line of the entry)
        # Look for the next ** header or end of file
        insert_idx = idx + 1
        while insert_idx < len(org_lines):
            if org_lines[insert_idx].startswith("** "):
                break
            insert_idx += 1

        # Insert status line before the next header
        status_line = f"   - Status: DONE: Recipe added in {MODULE_NAME}.scm (deptree-resolver-260413c)\n"
        changes[idx] = ("header", new_line)
        changes[insert_idx] = ("insert", status_line)
        resolved_count += 1

for name, reason in blocked_entries.items():
    if name in pkg_line_map:
        idx = pkg_line_map[name]
        # Keep as BLOCKED but add new status line
        insert_idx = idx + 1
        while insert_idx < len(org_lines):
            if org_lines[insert_idx].startswith("** "):
                break
            insert_idx += 1

        status_line = f"   - Status: BLOCKED: {reason} ({MODULE_NAME})\n"
        if insert_idx not in changes:
            changes[insert_idx] = ("insert", status_line)
        kept_blocked_count += 1

# Apply changes in reverse order to preserve line numbers
# First, handle header changes
for idx, (change_type, content) in sorted(changes.items(), reverse=True):
    if change_type == "header":
        org_lines[idx] = content
    elif change_type == "insert":
        org_lines.insert(idx, content)

# Write atomically
tmp = ORG_FILE.with_suffix('.tmp')
with open(tmp, "w") as f:
    f.writelines(org_lines)
shutil.move(str(tmp), str(ORG_FILE))
print(f"  Updated {ORG_FILE}: {resolved_count} resolved, {kept_blocked_count} blocked")


# ======================
# 3. Update packages.scm
# ======================
print("Updating packages.scm...")

with open(PACKAGES_SCM, "r") as f:
    content = f.read()

# Find the last #:use-module line and add new modules after it
new_modules = [
    f"  #:use-module (gaurix packages {MODULE_NAME})",
    f"  #:use-module (gaurix packages {MODULE_NAME}-blocked-notes)",
]

# Find the position to insert - after the last existing use-module
# Look for the pattern where #:use-module lines end and #:export or closing paren begins
lines = content.split("\n")
last_use_module_idx = None
for i, line in enumerate(lines):
    if "#:use-module" in line:
        last_use_module_idx = i

if last_use_module_idx is not None:
    # Check if these modules are already present
    already_present = MODULE_NAME in content
    if not already_present:
        for mod in reversed(new_modules):
            lines.insert(last_use_module_idx + 1, mod)

        tmp = PACKAGES_SCM.with_suffix('.tmp')
        with open(tmp, "w") as f:
            f.write("\n".join(lines))
        shutil.move(str(tmp), str(PACKAGES_SCM))
        print(f"  Updated {PACKAGES_SCM}")
    else:
        print(f"  {PACKAGES_SCM} already contains {MODULE_NAME}")


# ======================
# 4. Update general-compat.scm
# ======================
print("Updating general-compat.scm...")

with open(COMPAT_SCM, "r") as f:
    content = f.read()

lines = content.split("\n")
last_use_module_idx = None
for i, line in enumerate(lines):
    if "#:use-module" in line:
        last_use_module_idx = i

new_modules_compat = [
    f"  #:use-module (gaurix packages {MODULE_NAME})",
]

if last_use_module_idx is not None:
    already_present = MODULE_NAME in content
    if not already_present:
        for mod in reversed(new_modules_compat):
            lines.insert(last_use_module_idx + 1, mod)

        tmp = COMPAT_SCM.with_suffix('.tmp')
        with open(tmp, "w") as f:
            f.write("\n".join(lines))
        shutil.move(str(tmp), str(COMPAT_SCM))
        print(f"  Updated {COMPAT_SCM}")
    else:
        print(f"  {COMPAT_SCM} already contains {MODULE_NAME}")


print("\nDone! All bookkeeping updated.")
