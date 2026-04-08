#!/usr/bin/env python3
"""
Deterministic update of packages.scm for recipe-resolver-260408t.
Adds module import and package exports.
"""
import re
import shutil

PACKAGES_FILE = "guix/gaurix/packages.scm"

with open(PACKAGES_FILE, 'r') as f:
    content = f.read()

# 1. Add module import if not already present
if 'recipe-resolver-260408t)' in content:
    print("Module import already present, skipping.")
else:
    # Find the last recipe-resolver import
    last_import = None
    for m in re.finditer(r'  #:use-module \(gaurix packages recipe-resolver-[^\)]+\)', content):
        last_import = m

    if last_import:
        insert_pos = last_import.end()
        import_line = "\n  #:use-module (gaurix packages recipe-resolver-260408t)"
        content = content[:insert_pos] + import_line + content[insert_pos:]
        print(f"Added recipe-resolver-260408t module import")
    else:
        print("ERROR: Could not find recipe-resolver import to insert after")
        exit(1)

# Also add blocked-notes import
if 'recipe-resolver-260408t-blocked-notes)' in content:
    print("Blocked-notes import already present, skipping.")
else:
    last_bn = None
    for m in re.finditer(r'  #:use-module \(gaurix packages recipe-resolver-[^\)]*-blocked-notes\)', content):
        last_bn = m
    if last_bn:
        insert_pos = last_bn.end()
        import_line = "\n  #:use-module (gaurix packages recipe-resolver-260408t-blocked-notes)"
        content = content[:insert_pos] + import_line + content[insert_pos:]
        print("Added blocked-notes module import")

# 2. Add package exports
new_exports = [
    "localsend", "juliaup", "mindustry", "lidarr", "zl-equalizer",
    "wallchemy", "atlauncher", "kopia", "kopia-ui", "playit",
    "arduino-ctags", "notesnook-bin", "jellyfin-desktop-bin",
    "libsmb2", "playit-agent-bin",
]

# Find the end of the #:export list (before the closing ))
# Look for the pattern of the last export entry
export_section_end = content.find('))\n\n')
if export_section_end == -1:
    export_section_end = content.find('))')

added = 0
for name in new_exports:
    # Check if already exported
    if f'            {name}\n' in content[:export_section_end + 100]:
        pass
    else:
        content = content[:export_section_end] + f'            {name}\n' + content[export_section_end:]
        export_section_end += len(f'            {name}\n')
        added += 1

# Write atomically
tmp = PACKAGES_FILE + ".tmp"
with open(tmp, 'w') as f:
    f.write(content)
shutil.move(tmp, PACKAGES_FILE)

print(f"Updated {PACKAGES_FILE}: added {added} exports")
