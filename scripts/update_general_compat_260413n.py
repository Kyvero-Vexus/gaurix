#!/usr/bin/env python3
"""Deterministic full-file transform for general-compat.scm and packages.scm.
Adds deptree-resolver-260413n module and exported symbols.
Run ID: deptree-resolver-260413n
"""

import re
import sys
import shutil
import tempfile
from pathlib import Path

REPO_ROOT = Path(__file__).resolve().parent.parent
COMPAT_SCM = REPO_ROOT / "guix" / "gaurix" / "packages" / "general-compat.scm"
PACKAGES_SCM = REPO_ROOT / "guix" / "gaurix" / "packages.scm"

NEW_MODULE = "deptree-resolver-260413n"
NEW_EXPORTS = [
    "elephant-providerlist",
    "elephant-runner",
    "elephant-symbols",
    "elephant-todo",
    "elephant-websearch",
    "elephant-calc",
    "elephant-files",
    "google-breakpad",
    "helixnotes-appimage-bin",
    "hmcl-bin",
    "hpsahba-git",
    "hytale-updater",
    "i2p-bin",
    "nvidia-utils-beta",
    "ccusage",
    "claude-agent-acp",
    "critique",
    "hyprflow",
    "ibus-autostart-kimpanel",
    "famitracker",
    "oopz",
    "yabridgectl-wine10-git",
    "homepage-git",
    "hurrycurry-client",
    "hyprland-plugin-easymotion",
]


def update_general_compat():
    """Add #:use-module for new resolver to general-compat.scm."""
    with open(COMPAT_SCM, 'r') as f:
        content = f.read()

    module_line = f"  #:use-module (gaurix packages {NEW_MODULE})"

    if module_line in content:
        print(f"Module {NEW_MODULE} already in general-compat.scm", file=sys.stderr)
        return

    # Find the last gaurix packages use-module line and add after it
    lines = content.split('\n')
    new_lines = []
    inserted = False

    for i, line in enumerate(lines):
        new_lines.append(line)
        # Insert after the last gaurix packages use-module line
        # but before the (guix packages) line
        if not inserted and line.strip().startswith('#:use-module (guix packages)'):
            new_lines.insert(-1, module_line)
            inserted = True

    if not inserted:
        # Fallback: find last gaurix packages line
        for i in range(len(new_lines) - 1, -1, -1):
            if 'gaurix packages' in new_lines[i] and '#:use-module' in new_lines[i]:
                new_lines.insert(i + 1, module_line)
                inserted = True
                break

    if not inserted:
        print("ERROR: Could not find insertion point in general-compat.scm", file=sys.stderr)
        sys.exit(1)

    content = '\n'.join(new_lines)

    # Atomic write
    with tempfile.NamedTemporaryFile(mode='w', dir=COMPAT_SCM.parent,
                                      suffix='.tmp', delete=False) as tmp:
        tmp.write(content)
        tmp_path = Path(tmp.name)
    shutil.move(str(tmp_path), str(COMPAT_SCM))
    print(f"Updated {COMPAT_SCM}", file=sys.stderr)


def update_packages_scm():
    """Add re-exports for new packages to packages.scm."""
    with open(PACKAGES_SCM, 'r') as f:
        content = f.read()

    # Check if already present
    if NEW_MODULE in content:
        print(f"Module {NEW_MODULE} already in packages.scm", file=sys.stderr)
        return

    # Find the end of the file (last line with content)
    lines = content.rstrip('\n').split('\n')

    # Add a comment and re-exports block
    block = [
        f"            ;; {NEW_MODULE}",
    ]
    for sym in NEW_EXPORTS:
        block.append(f"            {sym}")

    # Find the right place - after the last block of exports
    # Look for the last line that has an export symbol
    insert_idx = len(lines)
    for i in range(len(lines) - 1, -1, -1):
        stripped = lines[i].strip()
        if stripped and not stripped.startswith(';;') and not stripped.startswith(')'):
            # Found a symbol line
            insert_idx = i + 1
            break

    for j, bl in enumerate(block):
        lines.insert(insert_idx + j, bl)

    content = '\n'.join(lines) + '\n'

    # Atomic write
    with tempfile.NamedTemporaryFile(mode='w', dir=PACKAGES_SCM.parent,
                                      suffix='.tmp', delete=False) as tmp:
        tmp.write(content)
        tmp_path = Path(tmp.name)
    shutil.move(str(tmp_path), str(PACKAGES_SCM))
    print(f"Updated {PACKAGES_SCM}", file=sys.stderr)


if __name__ == '__main__':
    update_general_compat()
    update_packages_scm()
