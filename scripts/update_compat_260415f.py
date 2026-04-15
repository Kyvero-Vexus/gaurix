#!/usr/bin/env python3
"""Programmatic update of general-compat.scm and packages.scm for deptree-resolver-260415f."""

import re
import shutil
import tempfile
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
COMPAT_FILE = ROOT / "guix" / "gaurix" / "packages" / "general-compat.scm"
PACKAGES_FILE = ROOT / "guix" / "gaurix" / "packages.scm"

PASS_ID = "deptree-resolver-260415f"

# New exports from deptree-resolver-260415f.scm
NEW_EXPORTS = [
    "gnu-apl",
    "opentyrian",
    "releng-tool",
    "luaunbound",
    "lxappearance-obconf-gtk3",
    "pass-audit",
    "python-requirements-language-server",
    "ajantv2-tools",
    "pins",
    "onset",
    "oniri",
    "proxybridge",
    "onthespot-bin",
    "libreoffice-extension-writingtool-bin",
    "linux-firmware-bnx2x",
    "linux-firmware-marvell",
    "linux-firmware-mellanox",
    "linux-firmware-nfp",
    "linux-firmware-qcom",
]


def update_general_compat():
    """Add use-module and re-exports to general-compat.scm."""
    content = COMPAT_FILE.read_text()

    # 1. Add #:use-module for our new module (before the closing of use-modules)
    # Find the last #:use-module line in the imports section (before #:export)
    use_module_line = "  #:use-module (gaurix packages deptree-resolver-260415f)\n"

    # Insert before the #:export line
    if "deptree-resolver-260415f" not in content:
        content = content.replace(
            "  #:export (",
            use_module_line + "  #:export (",
            1
        )

    # 2. Add re-exports before the closing ))
    export_block = f"            ;; {PASS_ID} recipes\n"
    for name in NEW_EXPORTS:
        export_block += f"            {name}\n"

    if PASS_ID not in content:
        content = content.replace(
            "))\n\n;;; ---",
            export_block + "))\n\n;;; ---",
            1
        )

    # 3. Write atomically
    tmp = tempfile.NamedTemporaryFile(mode='w', dir=COMPAT_FILE.parent,
                                      suffix='.tmp', delete=False)
    tmp.write(content)
    tmp.close()
    shutil.move(tmp.name, COMPAT_FILE)
    print(f"Updated {COMPAT_FILE}")


def update_packages():
    """Add re-exports to packages.scm."""
    content = PACKAGES_FILE.read_text()

    if PASS_ID in content:
        print(f"packages.scm already has {PASS_ID} entries, skipping")
        return

    # Find the last line before closing parenthesis or EOF
    # The file has a specific format - add at the end of the export list
    # Find the last non-empty line that's an export
    lines = content.rstrip().split('\n')

    # Add new entries before any closing paren
    new_entries = f"            ;; {PASS_ID}\n"
    for name in NEW_EXPORTS:
        new_entries += f"            {name}\n"

    # Append to the list (the file is a define-module with exports)
    content = content.rstrip() + "\n" + new_entries + "\n"

    tmp = tempfile.NamedTemporaryFile(mode='w', dir=PACKAGES_FILE.parent,
                                      suffix='.tmp', delete=False)
    tmp.write(content)
    tmp.close()
    shutil.move(tmp.name, PACKAGES_FILE)
    print(f"Updated {PACKAGES_FILE}")


if __name__ == "__main__":
    update_general_compat()
    update_packages()
