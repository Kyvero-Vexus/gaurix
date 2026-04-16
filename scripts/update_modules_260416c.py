#!/usr/bin/env python3
"""Deterministic full-file transform: update packages.scm and general-compat.scm
for deptree-resolver-260416c.

Reads current files, computes new content, writes to temp, atomic moves.
"""

import json
import os
import re
import shutil
import tempfile
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
PASS_ID = "deptree-resolver-260416c"
SUMMARY = ROOT / "reports" / f"{PASS_ID}-summary.json"
PACKAGES_SCM = ROOT / "guix" / "gaurix" / "packages.scm"
COMPAT_SCM = ROOT / "guix" / "gaurix" / "packages" / "general-compat.scm"


def sanitize_name(name):
    return name.lower().replace("_", "-").replace(".", "-")


def load_summary():
    with open(SUMMARY) as f:
        return json.load(f)


def update_packages_scm(resolved_packages):
    """Add new package symbols to packages.scm export list."""
    content = PACKAGES_SCM.read_text()

    # Find the closing '))' and insert before it
    new_symbols = [sanitize_name(p["name"]) for p in resolved_packages]

    # Build insertion block
    comment = f"            ;; {PASS_ID} ({len(resolved_packages)} packages processed, {len(resolved_packages)} recipes)"
    lines = [comment]
    for sym in new_symbols:
        lines.append(f"            {sym}")

    insert_block = "\n".join(lines) + "\n"

    # Insert before the final '))'
    # Find last '))\n' which closes the define-module
    idx = content.rfind("))")
    if idx == -1:
        raise ValueError("Could not find closing ')) in packages.scm")

    new_content = content[:idx] + insert_block + content[idx:]

    # Atomic write
    fd, tmp_path = tempfile.mkstemp(dir=PACKAGES_SCM.parent, suffix=".scm.tmp")
    try:
        with os.fdopen(fd, "w") as f:
            f.write(new_content)
        shutil.move(tmp_path, PACKAGES_SCM)
    except:
        os.unlink(tmp_path)
        raise

    print(f"  Updated {PACKAGES_SCM} (+{len(new_symbols)} symbols)")


def update_general_compat_scm(resolved_packages):
    """Add use-module and compat aliases for new pass."""
    content = COMPAT_SCM.read_text()
    var_names = [sanitize_name(p["name"]) for p in resolved_packages]

    # 1) Add #:use-module line after last existing #:use-module
    use_module_line = f"  #:use-module (gaurix packages {PASS_ID})"

    # Find the position just after the last #:use-module line in the header
    # The header ends at the first line that doesn't start with whitespace or #:use-module
    lines = content.split("\n")
    last_use_module_idx = -1
    for i, line in enumerate(lines):
        if line.strip().startswith("#:use-module"):
            last_use_module_idx = i

    if last_use_module_idx == -1:
        raise ValueError("Could not find #:use-module in general-compat.scm")

    lines.insert(last_use_module_idx + 1, use_module_line)

    # 2) Append compat aliases at end of file
    compat_lines = [f"\n;; {PASS_ID}"]
    for var in var_names:
        compat_lines.append(f"(define-public {var}/compat {var})")

    lines.extend(compat_lines)

    new_content = "\n".join(lines) + "\n"

    # Atomic write
    fd, tmp_path = tempfile.mkstemp(dir=COMPAT_SCM.parent, suffix=".scm.tmp")
    try:
        with os.fdopen(fd, "w") as f:
            f.write(new_content)
        shutil.move(tmp_path, COMPAT_SCM)
    except:
        os.unlink(tmp_path)
        raise

    print(f"  Updated {COMPAT_SCM} (+{len(var_names)} compat aliases)")


def main():
    summary = load_summary()
    resolved = summary["resolved_packages"]

    print(f"[{PASS_ID}] Updating module indexes for {len(resolved)} resolved packages")

    update_packages_scm(resolved)
    update_general_compat_scm(resolved)

    print(f"[{PASS_ID}] Module updates complete")


if __name__ == "__main__":
    main()
