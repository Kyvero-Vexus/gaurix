#!/usr/bin/env python3
"""Update packages.scm and general-compat.scm for deptree-resolver-260415k pass.

Uses atomic temp-file-then-move approach per repo conventions.
"""

import json
import re
import shutil
import tempfile
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
PACKAGES_SCM = ROOT / "guix" / "gaurix" / "packages.scm"
GENERAL_COMPAT = ROOT / "guix" / "gaurix" / "packages" / "general-compat.scm"
REPORT_FILE = Path("/tmp/resolver_260415k_report.json")
PASS_ID = "deptree-resolver-260415k"


def load_report():
    with open(REPORT_FILE) as f:
        return json.load(f)


def update_packages_scm(export_names):
    """Add new module exports to packages.scm."""
    content = PACKAGES_SCM.read_text()

    # Find the last closing )) and insert before it
    # Add a comment marker and the new exports
    new_exports = "\n".join(f"            {name}" for name in sorted(export_names))
    marker = f"            ;; {PASS_ID}\n{new_exports}\n"

    # Check if already added
    if PASS_ID in content:
        print(f"packages.scm already contains {PASS_ID}, skipping.")
        return

    # Find the final )) and insert before it
    # The file ends with something like:
    #             ytm-player
    # ))
    last_paren = content.rfind("))")
    if last_paren == -1:
        raise RuntimeError("Cannot find closing ')) in packages.scm")

    new_content = content[:last_paren] + marker + content[last_paren:]

    # Atomic write
    fd, tmp = tempfile.mkstemp(dir=PACKAGES_SCM.parent, suffix=".scm.tmp")
    try:
        with open(fd, "w") as f:
            f.write(new_content)
        shutil.move(tmp, PACKAGES_SCM)
        print(f"Updated packages.scm with {len(export_names)} exports.")
    except Exception:
        Path(tmp).unlink(missing_ok=True)
        raise


def update_general_compat(export_names, compat_aliases):
    """Add use-module and compat aliases to general-compat.scm."""
    content = GENERAL_COMPAT.read_text()

    if PASS_ID in content:
        print(f"general-compat.scm already contains {PASS_ID}, skipping.")
        return

    # 1. Add #:use-module line
    # Find the last #:use-module line and add after it
    use_module_line = f"  #:use-module (gaurix packages {PASS_ID})"

    # Find all #:use-module lines
    lines = content.split("\n")
    last_use_module_idx = -1
    for i, line in enumerate(lines):
        if "#:use-module" in line:
            last_use_module_idx = i

    if last_use_module_idx == -1:
        raise RuntimeError("Cannot find #:use-module in general-compat.scm")

    # Insert after the last #:use-module line
    lines.insert(last_use_module_idx + 1, use_module_line)

    # 2. Add compat aliases at the end
    if compat_aliases:
        alias_block = f"\n;; {PASS_ID} compat aliases\n" + "\n".join(compat_aliases)
        lines.append(alias_block)

    new_content = "\n".join(lines)

    # Atomic write
    fd, tmp = tempfile.mkstemp(dir=GENERAL_COMPAT.parent, suffix=".scm.tmp")
    try:
        with open(fd, "w") as f:
            f.write(new_content)
        shutil.move(tmp, GENERAL_COMPAT)
        print(f"Updated general-compat.scm with module + {len(compat_aliases)} aliases.")
    except Exception:
        Path(tmp).unlink(missing_ok=True)
        raise


def main():
    report = load_report()
    export_names = report["export_names"]
    compat_aliases = report["compat_aliases"]

    print(f"Updating registry files for {PASS_ID}...")
    print(f"  {len(export_names)} exports, {len(compat_aliases)} compat aliases")

    update_packages_scm(export_names)
    update_general_compat(export_names, compat_aliases)

    print("Registry update complete.")


if __name__ == "__main__":
    main()
