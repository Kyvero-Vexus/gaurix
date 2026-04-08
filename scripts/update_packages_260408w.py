#!/usr/bin/env python3
"""
Deterministic update of packages.scm for recipe-resolver-260408w.
Adds module imports for recipe-resolver-260408w and blocked-notes.
"""
import shutil

PACKAGES_FILE = "guix/gaurix/packages.scm"

with open(PACKAGES_FILE, 'r') as f:
    content = f.read()

new_imports = [
    "  #:use-module (gaurix packages recipe-resolver-260408w)",
    "  #:use-module (gaurix packages recipe-resolver-260408w-blocked-notes)",
]

additions = []
for imp in new_imports:
    mod_name = imp.strip().split('(')[1].rstrip(')')
    if mod_name in content:
        print(f"  Module '{mod_name}' already imported, skipping")
    else:
        additions.append(imp)

if additions:
    # Find the closing ) of the define-module form
    # Insert before the last line ")"
    # Find the last ) that closes the module
    last_paren = content.rfind(')')
    insert_text = '\n'.join(additions) + '\n'
    content = content[:last_paren] + insert_text + content[last_paren:]

# Write atomically
tmp = PACKAGES_FILE + ".tmp"
with open(tmp, 'w') as f:
    f.write(content)
shutil.move(tmp, PACKAGES_FILE)

print(f"Updated {PACKAGES_FILE}")
print(f"  Added {len(additions)} new module imports")
