#!/usr/bin/env python3
"""Update general-compat.scm with deptree-resolver-260414q module and compat aliases.

Deterministic full-file transform: read, compute, write temp, atomic move.
"""

import json
import os
import re
import shutil
import tempfile
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
COMPAT_FILE = ROOT / "guix" / "gaurix" / "packages" / "general-compat.scm"
SUMMARY = ROOT / "reports" / "deptree-resolver-260414q-summary.json"
PASS_ID = "deptree-resolver-260414q"


def load_summary():
    with open(SUMMARY) as f:
        return json.load(f)


def main():
    summary = load_summary()
    recipes = summary["recipes"]

    # Read current file
    with open(COMPAT_FILE) as f:
        content = f.read()

    # 1. Add #:use-module for the new resolver
    module_line = f"  #:use-module (gaurix packages {PASS_ID})"

    # Check if already present
    if module_line in content:
        print(f"Module {PASS_ID} already in general-compat.scm")
    else:
        # Insert after the last deptree-resolver-260414 module line
        # Find the last deptree-resolver line
        last_deptree_pattern = r"(  #:use-module \(gaurix packages deptree-resolver-260414[a-z]+\))"
        matches = list(re.finditer(last_deptree_pattern, content))
        if matches:
            last_match = matches[-1]
            insert_pos = last_match.end()
            content = content[:insert_pos] + "\n" + module_line + content[insert_pos:]
            print(f"Added module import for {PASS_ID}")
        else:
            # Fallback: insert before #:use-module (guix packages)
            guix_pkg_line = "  #:use-module (guix packages)"
            insert_pos = content.index(guix_pkg_line)
            content = content[:insert_pos] + module_line + "\n" + content[insert_pos:]
            print(f"Added module import for {PASS_ID} (fallback position)")

    # 2. Add compat aliases at end of file
    # Generate compat aliases for -git and -bin packages
    aliases = []
    for recipe in recipes:
        aur_name = recipe["aur_name"]
        guix_name = recipe["guix_name"]

        if aur_name.endswith("-git"):
            # Create alias without -git suffix
            base_name = aur_name[:-4]  # Remove -git
            # Make sure guix_name ends with -git too
            if guix_name.endswith("-git"):
                alias_name = guix_name[:-4]
                aliases.append((alias_name, guix_name))
        elif aur_name.endswith("-bin"):
            # Create alias without -bin suffix
            base_name = aur_name[:-4]  # Remove -bin
            if guix_name.endswith("-bin"):
                alias_name = guix_name[:-4]
                aliases.append((alias_name, guix_name))

    if aliases:
        # Add compat aliases section
        alias_section = f"\n;; --- {PASS_ID} compat aliases ---\n"
        for alias_name, parent_name in aliases:
            # Check if alias already exists
            if f'(define-public {alias_name} ' in content:
                print(f"  Alias {alias_name} already exists, skipping")
                continue
            alias_section += f'(define-public {alias_name} (package (inherit {parent_name}) (name "{alias_name}")))\n'

        # Append to end of file
        content = content.rstrip() + "\n" + alias_section

        print(f"Added {len(aliases)} compat aliases")

    # 3. Write atomically: temp file then rename
    fd, tmp_path = tempfile.mkstemp(dir=COMPAT_FILE.parent, suffix=".scm.tmp")
    try:
        with os.fdopen(fd, "w") as f:
            f.write(content)
        shutil.move(tmp_path, COMPAT_FILE)
        print(f"Updated {COMPAT_FILE}")
    except Exception:
        os.unlink(tmp_path)
        raise


if __name__ == "__main__":
    main()
