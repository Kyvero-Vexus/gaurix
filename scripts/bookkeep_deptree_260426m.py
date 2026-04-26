#!/usr/bin/env python3
"""Bookkeeping for deptree-resolver-260426m.

Updates:
1. todo_general_packages.org — status updates for resolved packages
2. guix/gaurix/packages.scm — pass comment
3. guix/gaurix/packages/general-compat.scm — module import
"""

import json
import re
import sys
import shutil
import tempfile
from pathlib import Path

PASS_ID = "deptree-resolver-260426m"
ORG_FILE = Path("todo_general_packages.org")
PACKAGES_SCM = Path("guix/gaurix/packages.scm")
COMPAT_SCM = Path("guix/gaurix/packages/general-compat.scm")
SUMMARY_JSON = Path(f"reports/{PASS_ID}-summary.json")
CATEGORIES_JSON = Path(f"reports/{PASS_ID}-categories.json")


def load_summary():
    with open(SUMMARY_JSON) as f:
        return json.load(f)


def load_categories():
    with open(CATEGORIES_JSON) as f:
        return json.load(f)


def update_org_file(summary, categories):
    """Update org file with status for resolved packages."""
    cat_by_name = {p['name']: p for p in categories['packages']}
    recipes = set(summary.get('recipes', []))

    lines = ORG_FILE.read_text(encoding='utf-8').splitlines(keepends=True)
    updated = 0

    for i, line in enumerate(lines):
        m = re.match(r'^(\*\* DONE\s+\d+\.\s+)(\S+)(\s+\[BLOCKED:.*)', line)
        if not m:
            continue
        pkg_name = m.group(2)
        if pkg_name not in cat_by_name:
            continue

        cat = cat_by_name[pkg_name]
        if cat['category'] == 'RECIPE_WRITTEN':
            # Add status line after the heading
            status_line = f"   - Status: DONE — recipe generated ({PASS_ID})\n"
            # Check if there's already content after this line
            if i + 1 < len(lines) and lines[i + 1].startswith('   - '):
                lines.insert(i + 1, status_line)
            else:
                lines.insert(i + 1, status_line)
            updated += 1
        else:
            # Update BLOCKED status with current pass evaluation
            reason_short = cat['reason'][:80]
            status_line = f"   - Status: BLOCKED — re-evaluated {PASS_ID}: {cat['category']}: {reason_short}\n"
            if i + 1 < len(lines) and lines[i + 1].startswith('   - '):
                lines.insert(i + 1, status_line)
            else:
                lines.insert(i + 1, status_line)
            updated += 1

    # Atomic write
    tmp = tempfile.NamedTemporaryFile(mode='w', suffix='.org', dir=ORG_FILE.parent, delete=False, encoding='utf-8')
    tmp.writelines(lines)
    tmp.close()
    shutil.move(tmp.name, ORG_FILE)
    print(f"  Updated {updated} entries in {ORG_FILE}")


def update_packages_scm(summary):
    """Add pass comment to packages.scm."""
    content = PACKAGES_SCM.read_text(encoding='utf-8')

    recipes = summary.get('recipes', [])
    recipe_count = len(recipes)
    blocked_count = summary.get('blocked', 0)
    total = summary.get('total_evaluated', 0)

    if recipe_count > 0:
        recipe_names = ', '.join(recipes[:10])
        if recipe_count > 10:
            recipe_names += f', +{recipe_count - 10} more'
        comment = f"            ;; {PASS_ID}: {total} BLOCKED evaluated ({recipe_count} recipes: {recipe_names}; {blocked_count} remain BLOCKED)"
    else:
        comment = f"            ;; {PASS_ID}: {total} BLOCKED evaluated (0 recipes, {blocked_count} remain BLOCKED)"

    # Insert after the first line (module header comment)
    lines = content.split('\n')
    # Find the right place — after the first comment line
    insert_idx = 1  # after first line
    lines.insert(insert_idx, comment)

    tmp = tempfile.NamedTemporaryFile(mode='w', suffix='.scm', dir=PACKAGES_SCM.parent, delete=False, encoding='utf-8')
    tmp.write('\n'.join(lines))
    tmp.close()
    shutil.move(tmp.name, PACKAGES_SCM)
    print(f"  Added pass comment to {PACKAGES_SCM}")


def update_compat_scm():
    """Add module import to general-compat.scm."""
    content = COMPAT_SCM.read_text(encoding='utf-8')

    new_import = f"  #:use-module (gaurix packages {PASS_ID})"

    if new_import in content:
        print(f"  Import already present in {COMPAT_SCM}")
        return

    # Insert after the first #:use-module line
    lines = content.split('\n')
    insert_idx = 1  # after the define-module line
    lines.insert(insert_idx, new_import)

    tmp = tempfile.NamedTemporaryFile(mode='w', suffix='.scm', dir=COMPAT_SCM.parent, delete=False, encoding='utf-8')
    tmp.write('\n'.join(lines))
    tmp.close()
    shutil.move(tmp.name, COMPAT_SCM)
    print(f"  Added import to {COMPAT_SCM}")


def main():
    print(f"[{PASS_ID}] Loading summary...")
    summary = load_summary()
    categories = load_categories()

    print(f"[{PASS_ID}] Updating org file...")
    update_org_file(summary, categories)

    print(f"[{PASS_ID}] Updating packages.scm...")
    update_packages_scm(summary)

    print(f"[{PASS_ID}] Updating general-compat.scm...")
    update_compat_scm()

    print(f"\n[{PASS_ID}] Bookkeeping complete.")
    print(f"  Recipes: {summary.get('recipes_generated', 0)}")
    print(f"  Blocked: {summary.get('blocked', 0)}")


if __name__ == '__main__':
    main()
