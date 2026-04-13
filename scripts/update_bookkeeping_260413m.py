#!/usr/bin/env python3
"""Update bookkeeping files for deptree-resolver-260413m.

Updates:
1. todo_general_packages.org - BLOCKED->DONE for resolved, update reasons for still-blocked
2. guix/gaurix/packages.scm - add new module and re-exports
3. guix/gaurix/packages/general-compat.scm - add new module import

Uses deterministic programmatic full-file transforms (read, compute, write temp, atomic move).
"""

import json
import os
import re
import sys
import tempfile
from pathlib import Path

REPO_ROOT = Path(__file__).resolve().parent.parent
ORG_FILE = REPO_ROOT / "todo_general_packages.org"
PACKAGES_SCM = REPO_ROOT / "guix" / "gaurix" / "packages.scm"
GENERAL_COMPAT = REPO_ROOT / "guix" / "gaurix" / "packages" / "general-compat.scm"
SUMMARY_JSON = REPO_ROOT / "reports" / "deptree-resolver-260413m-summary.json"

RUN_ID = "deptree-resolver-260413m"


def load_summary():
    with open(SUMMARY_JSON) as f:
        return json.load(f)


def update_org_file(summary):
    """Update org file: mark resolved DONE, update blocked reasons."""
    resolved_set = set(summary['recipe_names'])
    blocked_map = {}
    # Reload blocked info from the blocked notes
    bn_file = REPO_ROOT / "guix" / "gaurix" / "packages" / "deptree-resolver-260413m-blocked-notes.scm"
    if bn_file.exists():
        with open(bn_file) as f:
            for line in f:
                m = re.match(r'^;;; (\S+) \(#\d+\): (\S+) -- (.+)', line.strip())
                if m:
                    blocked_map[m.group(1)] = (m.group(2), m.group(3))

    with open(ORG_FILE, 'r') as f:
        lines = f.readlines()

    new_lines = []
    i = 0
    changed_count = 0
    while i < len(lines):
        line = lines[i]
        # Match BLOCKED entries
        m = re.match(r'^(\*\* )BLOCKED (\d+)\. (\S+)\s*$', line)
        if m:
            prefix = m.group(1)
            number = m.group(2)
            name = m.group(3).strip()

            if name in resolved_set:
                # Change BLOCKED -> DONE
                new_lines.append(f"{prefix}DONE {number}. {name}\n")
                changed_count += 1
                i += 1
                # Copy existing content lines until next heading
                while i < len(lines) and not lines[i].startswith('** '):
                    new_lines.append(lines[i])
                    i += 1
                # Add status line
                new_lines.insert(len(new_lines), f"   - Status: DONE: recipe in {RUN_ID}.scm ({name}, deptree-resolver pass)\n")
                continue
            elif name in blocked_map:
                # Keep BLOCKED but update reason
                reason_code, reason_detail = blocked_map[name]
                new_lines.append(line)
                i += 1
                # Copy content lines, check for existing reason
                found_status = False
                while i < len(lines) and not lines[i].startswith('** '):
                    if lines[i].strip().startswith('- Status:') and not found_status:
                        new_lines.append(f"   - Status: BLOCKED: {reason_code} -- {reason_detail} ({RUN_ID})\n")
                        found_status = True
                    else:
                        new_lines.append(lines[i])
                    i += 1
                if not found_status:
                    new_lines.append(f"   - Status: BLOCKED: {reason_code} -- {reason_detail} ({RUN_ID})\n")
                continue

        new_lines.append(line)
        i += 1

    # Atomic write
    fd, tmp_path = tempfile.mkstemp(dir=ORG_FILE.parent, suffix='.org.tmp')
    with os.fdopen(fd, 'w') as f:
        f.writelines(new_lines)
    os.replace(tmp_path, ORG_FILE)
    print(f"Updated {ORG_FILE}: {changed_count} packages BLOCKED->DONE", file=sys.stderr)


def update_packages_scm(summary):
    """Add new module and re-exports to packages.scm."""
    resolved_names = summary['recipe_names']

    with open(PACKAGES_SCM, 'r') as f:
        content = f.read()

    # Check if module already added
    if 'deptree-resolver-260413m' in content:
        print(f"packages.scm already has deptree-resolver-260413m, skipping", file=sys.stderr)
        return

    # Add re-export names before the #:use-module section
    # Find the last re-export line before #:use-module
    lines = content.split('\n')
    new_lines = []

    # Strategy: find the last export line (before #:use-module lines) and insert after it
    # The pattern: exports are listed first, then #:use-module lines, then closing )
    # We need to add both exports and the #:use-module line

    # Find the position of the last re-export (before #:use-module section)
    last_export_idx = -1
    first_use_module_idx = -1
    closing_paren_idx = -1

    for i, line in enumerate(lines):
        stripped = line.strip()
        if stripped.startswith('#:use-module') and first_use_module_idx == -1:
            first_use_module_idx = i
        if first_use_module_idx == -1 and stripped and not stripped.startswith('(') and not stripped.startswith(';') and not stripped.startswith('#:'):
            # This is likely an export name
            last_export_idx = i

    # Find last #:use-module line
    last_use_module_idx = -1
    for i, line in enumerate(lines):
        if line.strip().startswith('#:use-module'):
            last_use_module_idx = i

    # Find closing paren of define-module
    for i, line in enumerate(lines):
        if line.strip() == ')' and i > last_use_module_idx:
            closing_paren_idx = i
            break

    if last_export_idx == -1 or first_use_module_idx == -1:
        print("ERROR: Could not find insertion points in packages.scm", file=sys.stderr)
        return

    # Build the new content
    # Insert exports before the first #:use-module
    export_block = f"            ;; deptree-resolver-260413m\n"
    for name in resolved_names:
        sn = name.replace('.', '-').replace('_', '-').replace('+', '-plus').replace('@', '-at-')
        export_block += f"            {sn}\n"

    # Insert #:use-module lines before closing paren
    module_lines = (
        f"  #:use-module (gaurix packages deptree-resolver-260413m)\n"
        f"  #:use-module (gaurix packages deptree-resolver-260413m-blocked-notes)\n"
    )

    result_lines = []
    for i, line in enumerate(lines):
        if i == first_use_module_idx:
            # Insert exports right before first #:use-module
            result_lines.append(export_block)
        result_lines.append(line)
        if i == last_use_module_idx:
            # Insert new module imports after last #:use-module
            result_lines.append(module_lines.rstrip('\n'))

    new_content = '\n'.join(result_lines)

    fd, tmp_path = tempfile.mkstemp(dir=PACKAGES_SCM.parent, suffix='.scm.tmp')
    with os.fdopen(fd, 'w') as f:
        f.write(new_content)
    os.replace(tmp_path, PACKAGES_SCM)
    print(f"Updated {PACKAGES_SCM}", file=sys.stderr)


def update_general_compat(summary):
    """Add new module import to general-compat.scm."""
    with open(GENERAL_COMPAT, 'r') as f:
        content = f.read()

    if 'deptree-resolver-260413m' in content:
        print(f"general-compat.scm already has deptree-resolver-260413m, skipping", file=sys.stderr)
        return

    # Find the last #:use-module line for gaurix packages and add after it
    lines = content.split('\n')
    last_gaurix_use_idx = -1
    for i, line in enumerate(lines):
        if '#:use-module (gaurix packages' in line:
            last_gaurix_use_idx = i

    if last_gaurix_use_idx == -1:
        # Find any #:use-module line
        for i, line in enumerate(lines):
            if '#:use-module' in line:
                last_gaurix_use_idx = i

    if last_gaurix_use_idx == -1:
        print("ERROR: Could not find insertion point in general-compat.scm", file=sys.stderr)
        return

    new_line = "  #:use-module (gaurix packages deptree-resolver-260413m)"
    lines.insert(last_gaurix_use_idx + 1, new_line)

    new_content = '\n'.join(lines)

    fd, tmp_path = tempfile.mkstemp(dir=GENERAL_COMPAT.parent, suffix='.scm.tmp')
    with os.fdopen(fd, 'w') as f:
        f.write(new_content)
    os.replace(tmp_path, GENERAL_COMPAT)
    print(f"Updated {GENERAL_COMPAT}", file=sys.stderr)


def main():
    summary = load_summary()
    print(f"Run: {summary['run_id']}", file=sys.stderr)
    print(f"Resolved: {summary['recipes_created']}", file=sys.stderr)
    print(f"Blocked: {summary['still_blocked']}", file=sys.stderr)

    update_org_file(summary)
    update_packages_scm(summary)
    update_general_compat(summary)

    print("\nBookkeeping update complete.", file=sys.stderr)


if __name__ == '__main__':
    main()
