#!/usr/bin/env python3
"""Update general-compat.scm for deptree-resolver-260413i."""
import os, re, shutil

BASE = "/home/slime/projects/gaurix"
COMPAT_FILE = os.path.join(BASE, "guix/gaurix/packages/general-compat.scm")
RUN_ID = "deptree-resolver-260413i"
MODULE_LINE = f"  #:use-module (gaurix packages {RUN_ID})"

# Recipe packages that need compat aliases
recipes = [
    "czkawka-cli-bin",
    "darya-bin",
    "deadbranch-bin",
    "devbox-bin",
    "dosbox-pure-unleashed-bin",
    "dotnet-host-bin",
    "ds",
    "dusage-bin",
    "eden-bin",
    "eden-preview-bin",
]

def make_aliases(name):
    aliases = []
    if name.endswith("-bin"):
        base = name[:-4]
        aliases.append((base, name))
    elif name.endswith("-git"):
        base = name[:-4]
        aliases.append((base, name))
    elif name.endswith("-appimage"):
        base = name[:-9]
        aliases.append((base, name))
    return aliases

with open(COMPAT_FILE, 'r') as f:
    content = f.read()

if RUN_ID in content:
    print(f"Module {RUN_ID} already in {COMPAT_FILE}, skipping module import")
else:
    # Find the #:export line
    export_match = re.search(r'(\s+#:export\s+\()', content)
    if export_match:
        idx = export_match.start()
        content = content[:idx] + MODULE_LINE + "\n" + content[idx:]
        print(f"  Added #:use-module for {RUN_ID}")
    else:
        print("ERROR: Could not find #:export line")

# Generate alias lines
alias_lines = []
alias_lines.append(f"\n; --- {RUN_ID} compat aliases ---")
for name in recipes:
    sname = name.replace('.', '-dot-').replace('_', '-').replace('+', '-plus-')
    for alias, source in make_aliases(name):
        alias_scheme = alias.replace('.', '-dot-').replace('_', '-').replace('+', '-plus-')
        source_scheme = source.replace('.', '-dot-').replace('_', '-').replace('+', '-plus-')
        alias_lines.append(
            f'(define-public {alias_scheme} (package (inherit {source_scheme}) (name "{alias}")))'
        )

alias_block = "\n".join(alias_lines) + "\n"

if RUN_ID + " compat aliases" not in content:
    content = content.rstrip() + "\n" + alias_block

tmp = COMPAT_FILE + ".tmp"
with open(tmp, 'w') as f:
    f.write(content)
shutil.move(tmp, COMPAT_FILE)

alias_count = sum(len(make_aliases(n)) for n in recipes)
print(f"Updated {COMPAT_FILE}")
print(f"  Added {alias_count} compat aliases")
