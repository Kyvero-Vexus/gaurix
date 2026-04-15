#!/usr/bin/env python3
"""Update general-compat.scm and packages.scm for deptree-resolver-260415t.

Deterministic full-file transform: read, compute, write temp, atomic move.
"""

import json
import os
import re
import tempfile
import shutil
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
PASS_ID = "deptree-resolver-260415t"
COMPAT_FILE = ROOT / "guix" / "gaurix" / "packages" / "general-compat.scm"
PACKAGES_FILE = ROOT / "guix" / "gaurix" / "packages.scm"
SUMMARY_FILE = ROOT / "reports" / f"{PASS_ID}-summary.json"


def atomic_write(path, content):
    """Write content to path atomically via tempfile + move."""
    fd, tmp_path = tempfile.mkstemp(dir=str(path.parent), suffix=".tmp")
    try:
        with os.fdopen(fd, "w") as f:
            f.write(content)
        shutil.move(tmp_path, str(path))
    except:
        os.unlink(tmp_path)
        raise


def update_general_compat():
    """Add #:use-module and compat aliases for the new pass."""
    with open(SUMMARY_FILE) as f:
        summary = json.load(f)

    recipe_names = [r["guix_name"] for r in summary["recipes"]]

    with open(COMPAT_FILE, "r") as f:
        content = f.read()

    lines = content.split("\n")

    # Step 1: Add #:use-module line after the last existing #:use-module
    new_use_module = f"  #:use-module (gaurix packages {PASS_ID})"

    # Check if already present
    if new_use_module in content:
        print(f"  #:use-module already present in general-compat.scm")
    else:
        # Find the last #:use-module line index
        last_use_module_idx = 0
        for i, line in enumerate(lines):
            if "#:use-module" in line:
                last_use_module_idx = i

        # Insert after the last #:use-module line
        lines.insert(last_use_module_idx + 1, new_use_module)
        print(f"  Added #:use-module at line {last_use_module_idx + 2}")

    # Step 2: Add compat aliases at end of file
    # Check if already present
    compat_marker = f";; {PASS_ID} compat aliases"
    if compat_marker in content:
        print(f"  Compat aliases already present")
    else:
        compat_lines = [
            "",
            f";; {PASS_ID} compat aliases",
        ]
        for name in recipe_names:
            compat_lines.append(
                f"(define-public {name}/compat {name})"
            )
        lines.extend(compat_lines)
        print(f"  Added {len(recipe_names)} compat aliases")

    new_content = "\n".join(lines)
    atomic_write(COMPAT_FILE, new_content)
    print(f"  Wrote {COMPAT_FILE}")


def update_packages_scm():
    """Add pass comment and re-exported names to packages.scm."""
    with open(SUMMARY_FILE) as f:
        summary = json.load(f)

    recipe_names = [r["guix_name"] for r in summary["recipes"]]

    with open(PACKAGES_FILE, "r") as f:
        content = f.read()

    # Check if already present
    if PASS_ID in content:
        print(f"  {PASS_ID} already present in packages.scm")
        return

    lines = content.split("\n")

    # Find the define-module closing paren line that contains the export list
    # We need to add our names to the #:export list
    # The pattern: find the last line with a name in the export list,
    # or find the comment about the pass

    # Find the line with the last closing paren of the define-module
    # Look for the pattern: a line with just "))" or similar after exports

    # Strategy: Find the position right before the closing of the define-module,
    # which should be a line with just whitespace + ")" or names followed by ")"
    # and insert our comment + names there.

    # Actually, looking at the file, the define-module has:
    #   #:export (
    #             ;; comments
    #             name1
    #             name2
    #             ...
    #             ))  or similar

    # Let's find where the export section ends (look for the first line that
    # starts with "(" after the define-module export block)

    # Simpler: find the line that closes the define-module (has the matching parens)
    # and insert before it

    # Find the end of the define-module form - look for a line that is just closing parens
    in_define_module = False
    paren_depth = 0
    insert_idx = None

    for i, line in enumerate(lines):
        if "(define-module" in line:
            in_define_module = True
            paren_depth = line.count("(") - line.count(")")
            continue
        if in_define_module:
            paren_depth += line.count("(") - line.count(")")
            if paren_depth <= 0:
                insert_idx = i
                break

    if insert_idx is None:
        # Fallback: just find the closing of the export section
        # Look for a line that is something like "            name)" at the end
        for i, line in enumerate(lines):
            stripped = line.strip()
            if stripped.endswith("))") and "#:export" not in line and i > 10:
                # This might be the end of the module definition
                # But we need to be more precise
                pass

        # Alternative: look for the first (define-public after the module
        for i, line in enumerate(lines):
            if line.startswith("(define-public") or line.startswith("(define "):
                insert_idx = i
                break

    if insert_idx is not None:
        # Insert comment + names before the insert point but inside the export
        # Actually we need to add to the export list.
        # Let me find the line just before insert_idx that closes the define-module
        # and add our names there.

        # The current approach: add our package names to the end of the
        # #:export list. Find the line that has the closing )) of the define-module.
        # Insert our names just before that line.

        # Look backward from insert_idx for the )) line
        for j in range(insert_idx, max(insert_idx - 5, 0), -1):
            if lines[j].strip().endswith("))"):
                # Insert before this line
                new_lines_to_add = [
                    f"            ;; {PASS_ID}",
                ]
                for name in recipe_names:
                    new_lines_to_add.append(f"            {name}")

                # Remove the trailing )) from the previous line and add it after our names
                # Actually, the )) is on its own line or at the end of a name
                # Let's just add our names before the )) line
                for nl in reversed(new_lines_to_add):
                    lines.insert(j, nl)
                print(f"  Added {len(recipe_names)} exports at line {j}")
                break
        else:
            # Fallback: add before the first define-public
            for nl in [f"            ;; {PASS_ID}"] + [f"            {n}" for n in recipe_names]:
                lines.insert(insert_idx, nl)
            print(f"  Added {len(recipe_names)} exports (fallback) at line {insert_idx}")

    new_content = "\n".join(lines)
    atomic_write(PACKAGES_FILE, new_content)
    print(f"  Wrote {PACKAGES_FILE}")


def main():
    print(f"[{PASS_ID}] Updating general-compat.scm...")
    update_general_compat()

    print(f"[{PASS_ID}] Updating packages.scm...")
    update_packages_scm()

    print(f"[{PASS_ID}] Done.")


if __name__ == "__main__":
    main()
