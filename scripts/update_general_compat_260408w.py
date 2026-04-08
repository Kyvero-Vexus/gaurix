#!/usr/bin/env python3
"""
Deterministic update of general-compat.scm for recipe-resolver-260408w.
Adds module import and compat aliases for graphite-gtk-theme variants + fontpreview-git.
"""
import re
import shutil

COMPAT_FILE = "guix/gaurix/packages/general-compat.scm"

with open(COMPAT_FILE, 'r') as f:
    content = f.read()

if 'recipe-resolver-260408w' in content:
    print("recipe-resolver-260408w already imported in general-compat.scm, skipping.")
else:
    # Add the module import after the last recipe-resolver import
    last_import = None
    for m in re.finditer(r'  #:use-module \(gaurix packages recipe-resolver-[^\)]+\)', content):
        last_import = m

    if last_import:
        insert_pos = last_import.end()
        import_line = "\n  #:use-module (gaurix packages recipe-resolver-260408w)"
        content = content[:insert_pos] + import_line + content[insert_pos:]
        print(f"Added recipe-resolver-260408w import after position {insert_pos}")
    else:
        print("ERROR: Could not find recipe-resolver import to insert after")
        exit(1)

# Add new exports to the export list
first_define = content.find('(define-public')
if first_define == -1:
    print("ERROR: Could not find first define-public")
    exit(1)

export_close = content.rfind('))', 0, first_define)

# Graphite variants + fontpreview-git that need compat aliases
graphite_variants = [
    "graphite-gtk-theme-wallpaper-git",
    "graphite-gtk-theme-rimless-normal-git",
    "graphite-gtk-theme-rimless-normal-compact-git",
    "graphite-gtk-theme-rimless-git",
    "graphite-gtk-theme-rimless-compact-git",
    "graphite-gtk-theme-normal-git",
    "graphite-gtk-theme-normal-compact-git",
    "graphite-gtk-theme-nord-rimless-normal-git",
    "graphite-gtk-theme-nord-rimless-normal-compact-git",
    "graphite-gtk-theme-nord-rimless-git",
    "graphite-gtk-theme-nord-rimless-compact-git",
    "graphite-gtk-theme-nord-normal-git",
    "graphite-gtk-theme-nord-normal-compact-git",
    "graphite-gtk-theme-nord-git",
    "graphite-gtk-theme-nord-compact-git",
    "graphite-gtk-theme-git",
    "graphite-gtk-theme-compact-git",
    "graphite-gtk-theme-black-rimless-normal-git",
    "graphite-gtk-theme-black-rimless-normal-compact-git",
    "graphite-gtk-theme-black-rimless-git",
    "graphite-gtk-theme-black-rimless-compact-git",
    "graphite-gtk-theme-black-normal-git",
    "graphite-gtk-theme-black-normal-compact-git",
    "graphite-gtk-theme-black-git",
    "graphite-gtk-theme-black-compact-git",
    "fontpreview-git",
]

new_exports = graphite_variants

for name in new_exports:
    if f'            {name}\n' in content[:first_define]:
        print(f"  Export '{name}' already exists, skipping")
    else:
        content = content[:export_close] + f'            {name}\n' + content[export_close:]
        export_close += len(f'            {name}\n')
        first_define += len(f'            {name}\n')
        print(f"  Added export '{name}'")

# Add alias definitions at end of file
alias_block = """
;;;
;;; -- recipe-resolver-260408w compat aliases --------------------------
;;;

"""

aliases_to_add = []

# Graphite variants all alias to graphite-gtk-theme
for variant in graphite_variants:
    if variant == "fontpreview-git":
        continue
    pattern = rf'define-public {re.escape(variant)}\b'
    if re.search(pattern, content):
        print(f"  Alias '{variant}' already defined, skipping")
    else:
        aliases_to_add.append((variant, "graphite-gtk-theme"))

# fontpreview-git aliases to fontpreview
pattern = r'define-public fontpreview-git\b'
if re.search(pattern, content):
    print("  Alias 'fontpreview-git' already defined, skipping")
else:
    aliases_to_add.append(("fontpreview-git", "fontpreview"))

if aliases_to_add:
    block = alias_block
    for alias_name, target in aliases_to_add:
        block += f"""(define-public {alias_name}
  (package
    (inherit {target})
    (name "{alias_name}")))

"""
    content += block

# Write atomically
tmp = COMPAT_FILE + ".tmp"
with open(tmp, 'w') as f:
    f.write(content)
shutil.move(tmp, COMPAT_FILE)

print(f"\nUpdated {COMPAT_FILE}")
print(f"  Added {len(aliases_to_add)} new compat aliases")
