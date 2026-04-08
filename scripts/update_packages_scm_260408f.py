#!/usr/bin/env python3
"""
Programmatically add deptree-resolver-260408f module imports to packages.scm
and general-compat.scm using deterministic read-compute-write-atomic-move.
"""

import re
import shutil
import tempfile
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
PACKAGES_SCM = ROOT / "guix" / "gaurix" / "packages.scm"
GENERAL_COMPAT = ROOT / "guix" / "gaurix" / "packages" / "general-compat.scm"

RUN_ID = "deptree-resolver-260408f"

# Exports from the new module
EXPORTS = [
    "ancestris", "archarchive", "archlinux-artwork", "butter-launcher-bin",
    "crql-anina", "crql-locd", "electerm-live-bin", "empty", "en-se",
    "evcolors", "firefox-beta-bin-all-localizations",
    "freetype2-qdoled-aw3225qf", "freetype2-qdoled-gen3", "grep-compat",
    "heidisql-qt6-bin", "jdk17-zulu-prime-bin", "libelectron-electron-meta",
    "libinput-no-gestures", "librewolf-extension-keepassxc-browser",
    "llama.cpp-opencl", "mongodb-bin", "nvidia-535xx-utils", "opencl-amd",
    "opencl-nvidia-390xx", "opencl-nvidia-470xx", "opencl-nvidia-535xx",
    "opencl-nvidia-550xx", "opencl-nvidia-580xx", "opencl-nvidia-beta",
    "rocm-gfx110x-bin", "rocm-nightly-gfx110x-bin", "rocm-nightly-gfx1151-bin",
    "scrutiny-web-frontend", "vectorchord-bin", "vscodium-electron-bin",
]

def update_packages_scm():
    """Add #:use-module and exports to packages.scm."""
    content = PACKAGES_SCM.read_text()

    # Check if already added
    if f"(gaurix packages {RUN_ID})" in content:
        print(f"packages.scm: {RUN_ID} already present, skipping")
        return

    # 1. Add #:use-module lines after the last deptree-resolver-260408e import
    use_module_lines = (
        f"  #:use-module (gaurix packages {RUN_ID})\n"
        f"  #:use-module (gaurix packages {RUN_ID}-blocked-notes)\n"
    )

    # Find the last deptree-resolver-260408e line
    marker = "#:use-module (gaurix packages deptree-resolver-260408e)"
    idx = content.rfind(marker)
    if idx >= 0:
        # Find end of that line
        eol = content.index("\n", idx) + 1
        content = content[:eol] + use_module_lines + content[eol:]
    else:
        # Fallback: add before the closing paren of the export list
        # Find first #:export
        exp_idx = content.find("#:export")
        if exp_idx > 0:
            content = content[:exp_idx] + use_module_lines + content[exp_idx:]

    # 2. Add export symbols before closing paren
    export_comment = f"            ;; {RUN_ID}\n"
    export_lines = "\n".join(f"            {e}" for e in sorted(EXPORTS))
    export_block = export_comment + export_lines + "\n"

    # Find the closing ) at the very end of the file
    last_paren = content.rstrip().rfind(")")
    if last_paren >= 0:
        content = content[:last_paren] + export_block + content[last_paren:]

    # Atomic write
    fd, tmp = tempfile.mkstemp(dir=ROOT, suffix=".scm.tmp")
    with open(fd, "w") as f:
        f.write(content)
    shutil.move(tmp, PACKAGES_SCM)
    print(f"Updated packages.scm with {RUN_ID} imports and {len(EXPORTS)} exports")


def update_general_compat():
    """Add #:use-module for the new module to general-compat.scm."""
    content = GENERAL_COMPAT.read_text()

    # Check if already added
    if f"(gaurix packages {RUN_ID})" in content:
        print(f"general-compat.scm: {RUN_ID} already present, skipping")
        return

    # Find last deptree-resolver import
    use_lines = (
        f"  #:use-module (gaurix packages {RUN_ID})\n"
    )

    marker = "#:use-module (gaurix packages deptree-resolver-260408"
    last_idx = -1
    search_from = 0
    while True:
        idx = content.find(marker, search_from)
        if idx < 0:
            break
        last_idx = idx
        search_from = idx + 1

    if last_idx >= 0:
        eol = content.index("\n", last_idx) + 1
        content = content[:eol] + use_lines + content[eol:]
    else:
        # Fallback: add near top after last #:use-module
        lines = content.split("\n")
        insert_at = 0
        for i, line in enumerate(lines):
            if "#:use-module" in line:
                insert_at = i + 1
        lines.insert(insert_at, f"  #:use-module (gaurix packages {RUN_ID})")
        content = "\n".join(lines)

    # Atomic write
    fd, tmp = tempfile.mkstemp(dir=ROOT / "guix" / "gaurix" / "packages", suffix=".scm.tmp")
    with open(fd, "w") as f:
        f.write(content)
    shutil.move(tmp, GENERAL_COMPAT)
    print(f"Updated general-compat.scm with {RUN_ID} import")


if __name__ == "__main__":
    update_packages_scm()
    update_general_compat()
