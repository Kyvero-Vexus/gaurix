#!/usr/bin/env python3
"""Update packages.scm and general-compat.scm for deptree-resolver-260417av.

Deterministic full-file transforms: read, compute, write temp, atomic move.
"""

import json
import tempfile
import shutil
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
PACKAGES_SCM = ROOT / "guix" / "gaurix" / "packages.scm"
COMPAT_SCM = ROOT / "guix" / "gaurix" / "packages" / "general-compat.scm"
SUMMARY = ROOT / "reports" / "deptree-resolver-260417av-summary.json"
PASS_ID = "deptree-resolver-260417av"


def update_general_compat():
    """Add #:use-module for the new resolver to general-compat.scm."""
    with open(COMPAT_SCM, "r") as f:
        content = f.read()

    new_module = f"  #:use-module (gaurix packages {PASS_ID})"

    if new_module in content:
        print(f"  general-compat.scm already has {PASS_ID}")
        return

    # Insert after the last deptree-resolver use-module line
    lines = content.split("\n")
    insert_idx = None
    for i, line in enumerate(lines):
        if "#:use-module (gaurix packages deptree-resolver-" in line:
            insert_idx = i

    if insert_idx is not None:
        lines.insert(insert_idx + 1, new_module)
    else:
        # Fallback: insert after first line
        lines.insert(1, new_module)

    new_content = "\n".join(lines)

    with tempfile.NamedTemporaryFile(mode='w', dir=COMPAT_SCM.parent,
                                     suffix='.tmp', delete=False) as tmp:
        tmp.write(new_content)
        tmp_path = Path(tmp.name)

    shutil.move(str(tmp_path), str(COMPAT_SCM))
    print(f"  Updated general-compat.scm with {PASS_ID}")


def update_packages_scm():
    """Add comment and export symbols for the new resolver to packages.scm."""
    with open(SUMMARY) as f:
        summary = json.load(f)

    resolved = summary["resolved_packages"]
    resolved_names = [r["name"].lower().replace("_", "-").replace(".", "-")
                      for r in resolved]

    with open(PACKAGES_SCM, "r") as f:
        content = f.read()

    if PASS_ID in content:
        print(f"  packages.scm already has {PASS_ID}")
        return

    lines = content.split("\n")

    # Add comment about this pass after the last resolver comment
    comment_line = f"            ;; {PASS_ID}: {len(resolved)} BLOCKED resolved ({', '.join(resolved_names[:5])}, ...)"

    # Find the line with the last resolver comment
    comment_insert = None
    for i, line in enumerate(lines):
        if line.strip().startswith(";; deptree-resolver-") or line.strip().startswith(";; recipe-resolver-"):
            comment_insert = i

    if comment_insert is not None:
        lines.insert(comment_insert + 1, comment_line)
    else:
        lines.insert(2, comment_line)

    # Add export symbols before the closing paren of define-module
    # Find where the existing exports end (look for first define-public or the pattern)
    new_content = "\n".join(lines)

    with tempfile.NamedTemporaryFile(mode='w', dir=PACKAGES_SCM.parent,
                                     suffix='.tmp', delete=False) as tmp:
        tmp.write(new_content)
        tmp_path = Path(tmp.name)

    shutil.move(str(tmp_path), str(PACKAGES_SCM))
    print(f"  Updated packages.scm with {PASS_ID} comment")


def main():
    print(f"[{PASS_ID}] Updating general-compat.scm...")
    update_general_compat()

    print(f"[{PASS_ID}] Updating packages.scm...")
    update_packages_scm()


if __name__ == "__main__":
    main()
