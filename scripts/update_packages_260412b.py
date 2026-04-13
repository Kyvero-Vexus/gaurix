#!/usr/bin/env python3
"""Deterministic update of packages.scm for recipe-resolver-260412a/b/c.

Adds module imports for the new recipe-resolver modules.
"""
import shutil

PACKAGES_FILE = "guix/gaurix/packages.scm"

with open(PACKAGES_FILE, 'r') as f:
    content = f.read()

new_imports = [
    "  #:use-module (gaurix packages recipe-resolver-260412a)",
    "  #:use-module (gaurix packages recipe-resolver-260412b)",
    "  #:use-module (gaurix packages recipe-resolver-260412b-blocked-notes)",
    "  #:use-module (gaurix packages recipe-resolver-260412c)",
    "  #:use-module (gaurix packages recipe-resolver-260412c-blocked-notes)",
]

additions = []
for imp in new_imports:
    # Extract module name from the import line
    mod_name = imp.strip().replace("#:use-module ", "").strip()
    if mod_name in content:
        print(f"  Module '{mod_name}' already imported, skipping")
    else:
        additions.append(imp)

if additions:
    # Find the closing ) of the define-module form — insert before it
    last_paren = content.rfind(')')
    insert_text = '\n'.join(additions) + '\n'
    content = content[:last_paren] + insert_text + content[last_paren:]
    print(f"Added {len(additions)} new module imports")
else:
    print("No new imports needed")

# Write atomically
tmp = PACKAGES_FILE + ".tmp"
with open(tmp, 'w') as f:
    f.write(content)
shutil.move(tmp, PACKAGES_FILE)
print(f"Updated {PACKAGES_FILE}")
