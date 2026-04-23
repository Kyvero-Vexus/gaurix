#!/usr/bin/env python3
"""
Update general-compat.scm to include deptree-resolver-260423c module.
Deterministic full-file transform: read -> compute -> write temp -> atomic move.
"""

import os
import re
import tempfile
from pathlib import Path

REPO_ROOT = Path(__file__).resolve().parent.parent
COMPAT_FILE = REPO_ROOT / "guix" / "gaurix" / "packages" / "general-compat.scm"
RECIPE_FILE = REPO_ROOT / "guix" / "gaurix" / "packages" / "deptree-resolver-260423c.scm"

MODULE_NAME = "deptree-resolver-260423c"


def get_exports_from_recipe():
    """Extract export names from the recipe file."""
    content = RECIPE_FILE.read_text()
    # Find #:export block
    export_match = re.search(r'#:export\s*\((.*?)\)\)', content, re.DOTALL)
    if not export_match:
        return []
    export_block = export_match.group(1)
    # Extract symbol names
    exports = re.findall(r'(\S+)', export_block)
    return exports


def update_compat():
    """Add module import and re-exports to general-compat.scm."""
    exports = get_exports_from_recipe()
    print(f"Found {len(exports)} exports in {MODULE_NAME}")

    content = COMPAT_FILE.read_text()
    lines = content.split('\n')

    # Find last #:use-module line for insertion
    last_use_module_idx = -1
    for i, line in enumerate(lines):
        if '#:use-module' in line:
            last_use_module_idx = i

    if last_use_module_idx == -1:
        print("ERROR: Could not find #:use-module lines")
        return False

    # Check if already added
    if f'(gaurix packages {MODULE_NAME})' in content:
        print(f"Module {MODULE_NAME} already present in general-compat.scm")
        return True

    # Insert use-module line after last one
    new_use_module = f"  #:use-module (gaurix packages {MODULE_NAME})"
    lines.insert(last_use_module_idx + 1, new_use_module)
    print(f"Inserted #:use-module at line {last_use_module_idx + 2}")

    # Add re-exports at the end
    # Find the last line with content
    while lines and lines[-1].strip() == '':
        lines.pop()

    lines.append("")
    lines.append(f";;; Re-exports from {MODULE_NAME}")
    for export in exports:
        lines.append(f"(re-export {export})")
    lines.append("")

    # Write atomically
    new_content = '\n'.join(lines)
    with tempfile.NamedTemporaryFile(mode='w', dir=COMPAT_FILE.parent,
                                      prefix='.compat_tmp_', suffix='.scm',
                                      delete=False) as tmp:
        tmp.write(new_content)
        tmp_path = tmp.name

    os.replace(tmp_path, COMPAT_FILE)
    print(f"Atomically replaced {COMPAT_FILE}")
    print(f"Added {len(exports)} re-exports")

    return True


if __name__ == "__main__":
    update_compat()
