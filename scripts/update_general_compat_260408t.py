#!/usr/bin/env python3
"""
Deterministic update of general-compat.scm for recipe-resolver-260408t.
Adds compat aliases from recipe-resolver-260408t.
"""
import re
import shutil

COMPAT_FILE = "guix/gaurix/packages/general-compat.scm"

# Read the file
with open(COMPAT_FILE, 'r') as f:
    content = f.read()

# Check if recipe-resolver-260408t is already imported
if 'recipe-resolver-260408t' in content:
    print("recipe-resolver-260408t already imported in general-compat.scm, skipping.")
else:
    # Add the module import - find the last recipe-resolver import and add after it
    last_import = None
    for m in re.finditer(r'  #:use-module \(gaurix packages recipe-resolver-[^\)]+\)', content):
        last_import = m

    if last_import:
        insert_pos = last_import.end()
        import_line = "\n  #:use-module (gaurix packages recipe-resolver-260408t)"
        content = content[:insert_pos] + import_line + content[insert_pos:]
        print(f"Added recipe-resolver-260408t import after position {insert_pos}")
    else:
        print("ERROR: Could not find recipe-resolver import to insert after")
        exit(1)

# Add new aliases to the export list if not already present
new_exports = [
    "localsend", "juliaup", "mindustry", "lidarr", "zl-equalizer",
    "wallchemy", "atlauncher", "kopia", "kopia-ui", "playit",
    "arduino-ctags", "notesnook-bin", "jellyfin-desktop-bin",
    "libsmb2", "playit-agent-bin",
]

# Find the end of the #:export list
export_end = content.rfind('))')
if export_end == -1:
    print("ERROR: Could not find end of export list")
    exit(1)

# Find the actual closing of the #:export block
# Search backwards from EOF for the module closing ))
# The export list is before the first define-public
first_define = content.find('(define-public')
if first_define == -1:
    print("ERROR: Could not find first define-public")
    exit(1)

# Find the )) before first define
export_close = content.rfind('))', 0, first_define)

for name in new_exports:
    if f'            {name}\n' in content[:first_define]:
        print(f"  Export '{name}' already exists, skipping")
    else:
        # Insert before the export close
        content = content[:export_close] + f'            {name}\n' + content[export_close:]
        export_close += len(f'            {name}\n')
        first_define += len(f'            {name}\n')
        print(f"  Added export '{name}'")

# Add alias definitions before the end of the file if not present
# Find a good insertion point - just before the last line
alias_block = """
;;;
;;; ── recipe-resolver-260408t compat aliases ─────────────────────
;;;
"""

new_aliases = {
    "localsend": ("localsend-bin", "recipe-resolver-260408t"),
    "juliaup": ("juliaup-bin", "recipe-resolver-260408t"),
    "mindustry": ("mindustry-bin", "recipe-resolver-260408t"),
    "lidarr": ("lidarr-bin", "recipe-resolver-260408t"),
    "zl-equalizer": ("zl-equalizer-bin", "recipe-resolver-260408t"),
    "wallchemy": ("wallchemy-bin", "recipe-resolver-260408t"),
    "atlauncher": ("atlauncher-bin", "recipe-resolver-260408t"),
    "kopia": ("kopia-bin", "recipe-resolver-260408t"),
    "kopia-ui": ("kopia-ui-bin", "recipe-resolver-260408t"),
    "playit": ("playit-bin", "recipe-resolver-260408t"),
}

# Check which aliases need to be added
aliases_to_add = []
for alias_name, (target, source_mod) in new_aliases.items():
    # Check if this specific alias already exists in the file
    pattern = rf'define-public {re.escape(alias_name)}\b'
    if re.search(pattern, content):
        print(f"  Alias '{alias_name}' already defined, skipping")
    else:
        aliases_to_add.append((alias_name, target, source_mod))

if aliases_to_add:
    # Build the alias block
    block = alias_block
    for alias_name, target, source_mod in aliases_to_add:
        block += f"""(define-public {alias_name}
  (package
    (inherit {target})
    (name "{alias_name}")))

"""
    # Also add non-alias new packages as re-exports
    for pkg in ["arduino-ctags", "notesnook-bin", "jellyfin-desktop-bin", "libsmb2", "playit-agent-bin"]:
        pattern = rf'define-public {re.escape(pkg)}\b'
        if not re.search(pattern, content):
            # These are already defined in recipe-resolver-260408t, just re-export
            block += f";; {pkg}: defined in recipe-resolver-260408t\n"

    content += block

# Write atomically
tmp = COMPAT_FILE + ".tmp"
with open(tmp, 'w') as f:
    f.write(content)
shutil.move(tmp, COMPAT_FILE)

print(f"\nUpdated {COMPAT_FILE}")
print(f"  Added {len(aliases_to_add)} new compat aliases")
