#!/usr/bin/env python3
"""Update bookkeeping files for recipe-resolver-260413ab.

Deterministic full-file transforms:
1. Add #:use-module to general-compat.scm
2. Add recipe exports to packages.scm
3. Update todo_general_packages.org statuses
"""

import json
import re
import shutil
import tempfile
from pathlib import Path

REPO_ROOT = Path(__file__).resolve().parent.parent
SUMMARY_JSON = REPO_ROOT / "reports" / "recipe-resolver-260413ab-summary.json"
GENERAL_COMPAT = REPO_ROOT / "guix" / "gaurix" / "packages" / "general-compat.scm"
PACKAGES_SCM = REPO_ROOT / "guix" / "gaurix" / "packages.scm"
TODO_FILE = REPO_ROOT / "todo_general_packages.org"

RUN_ID = "recipe-resolver-260413ab"


def load_summary():
    with open(SUMMARY_JSON) as f:
        return json.load(f)


def update_general_compat(summary):
    """Add #:use-module for the new recipe module to general-compat.scm."""
    content = GENERAL_COMPAT.read_text()

    new_module = f'  #:use-module (gaurix packages {RUN_ID})'

    # Check if already present
    if new_module in content:
        print(f"  general-compat.scm already has {RUN_ID} module")
        return

    # Find the last #:use-module line for gaurix packages before the #:export
    # Insert just before #:export
    export_match = re.search(r'\n(\s*#:export\s*\()', content)
    if export_match:
        insert_pos = export_match.start()
        content = content[:insert_pos] + f'\n{new_module}' + content[insert_pos:]
    else:
        # Fallback: find the last #:use-module line
        last_use = content.rfind('#:use-module')
        if last_use >= 0:
            eol = content.index('\n', last_use)
            content = content[:eol+1] + new_module + '\n' + content[eol+1:]

    # Now add recipe names to the #:export section
    recipe_names = summary['recipe_names']
    if recipe_names:
        # Find the #:export section and add names before the closing paren
        # Pattern: find the comment marker and add after it
        export_section = re.search(r'#:export\s*\(', content)
        if export_section:
            # Find a good place to insert - after last existing export entry
            # Add a comment marker and the new names
            marker = f'            ;; {RUN_ID}'
            if marker not in content:
                # Find the closing )) of the export section
                # We need to find the right position - look for the end of
                # the current export list
                # Strategy: find the last non-empty entry before the closing parens
                # of the module definition

                # Find position just before the final )) that closes the define-module
                # Actually, let's find the #:export ( section and insert before the closing )
                # The pattern is:
                #   #:export (
                #     name1
                #     name2
                #     ))
                # We want to insert before the last ))

                # Find all lines between #:export and the first line with just ))
                lines = content.split('\n')
                export_start = None
                export_end = None
                for i, line in enumerate(lines):
                    if '#:export' in line:
                        export_start = i
                    if export_start is not None and i > export_start:
                        stripped = line.strip()
                        if stripped == '))' or stripped == ')':
                            export_end = i
                            break

                if export_end is not None:
                    # Insert new entries before the closing ))
                    new_lines = [f'            ;; {RUN_ID}']
                    for rn in recipe_names:
                        new_lines.append(f'            {rn}')
                    lines = lines[:export_end] + new_lines + lines[export_end:]
                    content = '\n'.join(lines)

    # Write via temp file for atomicity
    with tempfile.NamedTemporaryFile(mode='w', dir=GENERAL_COMPAT.parent,
                                      delete=False, suffix='.scm.tmp') as tf:
        tf.write(content)
        tmp_path = Path(tf.name)
    shutil.move(str(tmp_path), str(GENERAL_COMPAT))
    print(f"  Updated {GENERAL_COMPAT}")


def update_packages_scm(summary):
    """Add recipe exports to packages.scm."""
    content = PACKAGES_SCM.read_text()

    recipe_names = summary['recipe_names']
    if not recipe_names:
        print(f"  No recipes to add to packages.scm")
        return

    marker = f';; {RUN_ID}'
    if marker in content:
        print(f"  packages.scm already has {RUN_ID} marker")
        return

    # Find a good insertion point - after the last batch marker or near the end
    # The file structure is:
    # (define-module (gaurix packages)
    #   ;; batch-marker
    #   name1
    #   name2
    #   ...
    # Look for the last line that has content before we hit something else

    lines = content.split('\n')

    # Find the last line that looks like a package name or batch marker
    # The file ends with package names, so insert at the end of the name list
    insert_idx = len(lines)
    for i in range(len(lines)-1, -1, -1):
        stripped = lines[i].strip()
        if stripped and not stripped.startswith(';;') and stripped != ')' and stripped != '))':
            insert_idx = i + 1
            break
        elif stripped.startswith(';;') and 'recipe-resolver' in stripped:
            insert_idx = i + 1
            break

    new_lines = [f'            ;; {RUN_ID}']
    for rn in recipe_names:
        new_lines.append(f'            {rn}')

    lines = lines[:insert_idx] + new_lines + lines[insert_idx:]
    content = '\n'.join(lines)

    with tempfile.NamedTemporaryFile(mode='w', dir=PACKAGES_SCM.parent,
                                      delete=False, suffix='.scm.tmp') as tf:
        tf.write(content)
        tmp_path = Path(tf.name)
    shutil.move(str(tmp_path), str(PACKAGES_SCM))
    print(f"  Updated {PACKAGES_SCM}")


def update_todo_file(summary):
    """Update todo_general_packages.org statuses for processed entries."""
    content = TODO_FILE.read_text()
    lines = content.split('\n')

    packages = summary['packages']
    # Build a lookup by number
    pkg_by_number = {p['number']: p for p in packages}

    changes = 0
    i = 0
    while i < len(lines):
        line = lines[i]
        m = re.match(r'^(\*\* )TODO (\d+)\.\s+(.+)', line)
        if m:
            number = int(m.group(2))
            if number in pkg_by_number:
                pkg = pkg_by_number[number]
                if pkg['status'] == 'done':
                    # Change TODO to DONE
                    lines[i] = line.replace('** TODO ', '** DONE ', 1)
                    # Add status line after the entry
                    # Find the next ** or end of section to insert status
                    j = i + 1
                    while j < len(lines) and not lines[j].startswith('** '):
                        j += 1
                    status_line = f'   - Status: DONE: Recipe added in {RUN_ID}.scm ({RUN_ID})'
                    lines.insert(j, status_line)
                    changes += 1
                elif pkg['status'] == 'blocked':
                    reason = pkg.get('reason_code', 'NEEDS_RECIPE_DESIGN')
                    lines[i] = line.replace('** TODO ', '** BLOCKED ', 1)
                    j = i + 1
                    while j < len(lines) and not lines[j].startswith('** '):
                        j += 1
                    status_line = f'   - Status: BLOCKED: {reason} ({RUN_ID})'
                    lines.insert(j, status_line)
                    changes += 1
        i += 1

    content = '\n'.join(lines)
    with tempfile.NamedTemporaryFile(mode='w', dir=TODO_FILE.parent,
                                      delete=False, suffix='.org.tmp') as tf:
        tf.write(content)
        tmp_path = Path(tf.name)
    shutil.move(str(tmp_path), str(TODO_FILE))
    print(f"  Updated {TODO_FILE} ({changes} entries modified)")


def main():
    summary = load_summary()
    print(f"Run ID: {summary['run_id']}")
    print(f"Recipes: {summary['recipes_created']}, Blocked: {summary['blocked_count']}")

    print("\nUpdating general-compat.scm...")
    update_general_compat(summary)

    print("\nUpdating packages.scm...")
    update_packages_scm(summary)

    print("\nUpdating todo_general_packages.org...")
    update_todo_file(summary)

    print("\nDone!")


if __name__ == '__main__':
    main()
