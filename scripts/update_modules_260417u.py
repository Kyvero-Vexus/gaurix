#!/usr/bin/env python3
"""Deterministic full-file transform to register recipe-resolver-260417u in
general-compat.scm and packages.scm.

Reads each file, computes updated content, writes to a temp file, then does
an atomic rename.
"""

import json
import os
import re
import shutil
import tempfile

BATCH_ID = "recipe-resolver-260417u"
MODULE_REF = f"(gaurix packages {BATCH_ID})"

GENERAL_COMPAT = "guix/gaurix/packages/general-compat.scm"
PACKAGES_SCM = "guix/gaurix/packages.scm"

def load_summary():
    with open(f"reports/{BATCH_ID}-summary.json") as f:
        return json.load(f)

def update_general_compat(summary):
    """Add #:use-module line for the new batch to general-compat.scm."""
    with open(GENERAL_COMPAT, "r") as f:
        content = f.read()

    use_line = f"  #:use-module ({MODULE_REF.strip('()')})"

    # Check if already present
    if BATCH_ID in content:
        print(f"  general-compat.scm: {BATCH_ID} already registered, skipping")
        return

    # Find the last #:use-module (gaurix packages recipe-resolver-...) line
    # and insert after it
    lines = content.split('\n')
    insert_idx = None
    for i, line in enumerate(lines):
        if '#:use-module (gaurix packages recipe-resolver-' in line:
            insert_idx = i

    if insert_idx is None:
        # Find last #:use-module line
        for i, line in enumerate(lines):
            if '#:use-module' in line:
                insert_idx = i

    if insert_idx is not None:
        lines.insert(insert_idx + 1, use_line)
    else:
        print("ERROR: could not find insertion point in general-compat.scm")
        return

    new_content = '\n'.join(lines)

    # Atomic write
    fd, tmp_path = tempfile.mkstemp(dir=os.path.dirname(GENERAL_COMPAT), suffix='.scm.tmp')
    try:
        with os.fdopen(fd, 'w') as f:
            f.write(new_content)
        shutil.move(tmp_path, GENERAL_COMPAT)
        print(f"  general-compat.scm: added {BATCH_ID}")
    except Exception as e:
        os.unlink(tmp_path)
        raise e


def update_packages_scm(summary):
    """Add module reference and export symbols to packages.scm."""
    with open(PACKAGES_SCM, "r") as f:
        content = f.read()

    if BATCH_ID in content:
        print(f"  packages.scm: {BATCH_ID} already registered, skipping")
        return

    lines = content.split('\n')

    # Find the comment block area and add a comment + exports
    # The pattern is: after the last comment line mentioning a resolver, add ours
    # Then add export symbols after the last export symbol

    # 1. Add comment
    comment_line = f"            ;; {BATCH_ID} (100 TODO resolved: {summary['recipes_generated']} recipes, {summary['blocked']} blocked)"

    # Find insertion point for the comment - after the last ;; recipe/deptree resolver comment
    comment_idx = None
    for i, line in enumerate(lines):
        if line.strip().startswith(';;') and ('recipe-resolver-' in line or 'deptree-resolver-' in line):
            comment_idx = i

    if comment_idx is not None:
        lines.insert(comment_idx + 1, comment_line)
    else:
        # Insert before first export symbol
        for i, line in enumerate(lines):
            stripped = line.strip()
            if stripped and not stripped.startswith(';;') and not stripped.startswith('(') and not stripped.startswith('#'):
                comment_idx = i
                lines.insert(i, comment_line)
                break

    # 2. Add export names at the end of the export list
    # Find the last non-empty, non-comment line before the module closing paren
    # The exports are just bare symbols like "            package-name"
    recipe_names = summary.get("recipe_names", [])
    if recipe_names:
        # Find the last export symbol line
        last_export_idx = None
        for i, line in enumerate(lines):
            stripped = line.strip()
            # Export lines are indented symbols, not starting with ;; or ( or #:
            if stripped and not stripped.startswith(';;') and not stripped.startswith('(') and not stripped.startswith('#') and not stripped.startswith(')'):
                last_export_idx = i

        if last_export_idx is not None:
            export_lines = [f"            {name}" for name in recipe_names]
            for j, eline in enumerate(export_lines):
                lines.insert(last_export_idx + 1 + j, eline)

    new_content = '\n'.join(lines)

    # Atomic write
    fd, tmp_path = tempfile.mkstemp(dir=os.path.dirname(PACKAGES_SCM), suffix='.scm.tmp')
    try:
        with os.fdopen(fd, 'w') as f:
            f.write(new_content)
        shutil.move(tmp_path, PACKAGES_SCM)
        print(f"  packages.scm: added {BATCH_ID} with {len(recipe_names)} exports")
    except Exception as e:
        os.unlink(tmp_path)
        raise e


def main():
    summary = load_summary()
    print("Updating module registrations...")
    update_general_compat(summary)
    update_packages_scm(summary)
    print("Done.")


if __name__ == "__main__":
    main()
