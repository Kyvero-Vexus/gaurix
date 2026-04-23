#!/usr/bin/env python3
"""
Update packages.scm to include deptree-resolver-260423c exports.
Deterministic full-file transform.
"""

import os
import re
import tempfile
from pathlib import Path

REPO_ROOT = Path(__file__).resolve().parent.parent
PACKAGES_FILE = REPO_ROOT / "guix" / "gaurix" / "packages.scm"
RECIPE_FILE = REPO_ROOT / "guix" / "gaurix" / "packages" / "deptree-resolver-260423c.scm"

MODULE_NAME = "deptree-resolver-260423c"
PASS_ID = "deptree-resolver-260423c"


def get_exports_from_recipe():
    """Extract export names from the recipe file."""
    content = RECIPE_FILE.read_text()
    export_match = re.search(r'#:export\s*\((.*?)\)\)', content, re.DOTALL)
    if not export_match:
        return []
    export_block = export_match.group(1)
    return re.findall(r'(\S+)', export_block)


def update_packages_scm():
    """Add comment and exports to packages.scm."""
    exports = get_exports_from_recipe()
    print(f"Found {len(exports)} exports")

    content = PACKAGES_FILE.read_text()

    if MODULE_NAME in content:
        print(f"{MODULE_NAME} already in packages.scm")
        return True

    # Find the closing )) of the define-module
    # The file ends with exports followed by ))
    # Insert our comment + exports before the final ))
    if content.rstrip().endswith('))'):
        # Remove the final ))
        content_base = content.rstrip()
        content_base = content_base[:-2]

        # Add our entries
        comment = f"            ;; {PASS_ID} (100 BLOCKED resolved via dep-tree priority)"
        export_lines = '\n'.join(f'               {e}' for e in exports)

        new_content = f"{content_base}\n{comment}\n{export_lines}\n               ))\n"

        with tempfile.NamedTemporaryFile(mode='w', dir=PACKAGES_FILE.parent,
                                          prefix='.pkg_tmp_', suffix='.scm',
                                          delete=False) as tmp:
            tmp.write(new_content)
            tmp_path = tmp.name

        os.replace(tmp_path, PACKAGES_FILE)
        print(f"Atomically replaced {PACKAGES_FILE}")
        print(f"Added {len(exports)} exports")
        return True

    print("ERROR: Could not find closing )) in packages.scm")
    return False


if __name__ == "__main__":
    update_packages_scm()
