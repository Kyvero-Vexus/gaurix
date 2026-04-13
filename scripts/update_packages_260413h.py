#!/usr/bin/env python3
"""
Update general-compat.scm for deptree-resolver-260413h.
Adds:
1. #:use-module for the new resolver module
2. Compat aliases for recipe packages (stripping -bin, -git suffixes)
"""

import os
import re
import shutil

BASE = "/home/slime/projects/gaurix"
COMPAT_FILE = os.path.join(BASE, "guix/gaurix/packages/general-compat.scm")

RUN_ID = "deptree-resolver-260413h"
MODULE_LINE = f"  #:use-module (gaurix packages {RUN_ID})"

# Recipe packages that need compat aliases
recipes = [
    "hyperfluent-grub-theme-arch",
    "nautilus-megasync",
    "ninjarmm-ncplayer",
    "kernel-install-for-dracut",
    "bcompare-cinnamon",
    "bcompare-kde4",
    "bcompare-kde6",
    "bcompare-mate",
    "bcompare-nautilus",
    "bcompare-thunar",
    "brogue-ce",
    "btrfsmaintenance-git",
    "caido-desktop",
    "cask",
    "catppuccin-konsole-colorscheme-frappe-git",
    "catppuccin-konsole-colorscheme-latte-git",
    "catppuccin-konsole-colorscheme-macchiato-git",
    "catppuccin-konsole-colorscheme-mocha-git",
    "cecil-bin",
    "certradar-cli-bin",
    "climp-bin",
    "cmake-modules-webos-git",
]

def make_aliases(name):
    """Generate compat alias pairs: (alias_name, source_name)."""
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

# Read current file
with open(COMPAT_FILE, 'r') as f:
    content = f.read()

# Check if module already added
if RUN_ID in content:
    print(f"Module {RUN_ID} already in {COMPAT_FILE}, skipping module import")
else:
    # Insert #:use-module before the #:export line
    export_idx = content.index("  #:export (")
    content = content[:export_idx] + MODULE_LINE + "\n" + content[export_idx:]
    print(f"  Added #:use-module for {RUN_ID}")

# Generate alias lines
alias_lines = []
alias_lines.append(f"\n; --- {RUN_ID} compat aliases ---")
for name in recipes:
    for alias, source in make_aliases(name):
        alias_lines.append(
            f'(define-public {alias} (package (inherit {source}) (name "{alias}")))'
        )

alias_block = "\n".join(alias_lines) + "\n"

# Append to end of file
if RUN_ID not in content.split("#:export")[1] if "#:export" in content else True:
    content = content.rstrip() + "\n" + alias_block

# Atomic write
tmp = COMPAT_FILE + ".tmp"
with open(tmp, 'w') as f:
    f.write(content)
shutil.move(tmp, COMPAT_FILE)
print(f"Updated {COMPAT_FILE}")
print(f"  Added {len([a for n in recipes for a in make_aliases(n)])} compat aliases")
