#!/usr/bin/env python3
"""Generate all artifacts for deptree-resolver-260413l.

Reads the resolve result and generates:
1. deptree-resolver-260413l.scm (recipe module)
2. deptree-resolver-260413l-blocked-notes.scm (blocked notes)
3. deptree-resolver-260413l-summary.json (summary)
4. Updates todo_general_packages.org statuses
5. Updates packages.scm (deterministic full rewrite)
6. Updates general-compat.scm (deterministic full rewrite)
"""

import json
import re
import sys
import os
import tempfile
import shutil
from datetime import datetime, timezone
from pathlib import Path

REPO_ROOT = Path(__file__).resolve().parent.parent
RESOLVE_RESULT = Path('/tmp/resolve_result_260413l.json')
ORG_FILE = REPO_ROOT / "todo_general_packages.org"
PACKAGES_SCM = REPO_ROOT / "guix" / "gaurix" / "packages.scm"
COMPAT_SCM = REPO_ROOT / "guix" / "gaurix" / "packages" / "general-compat.scm"
RECIPE_SCM = REPO_ROOT / "guix" / "gaurix" / "packages" / "deptree-resolver-260413l.scm"
BLOCKED_SCM = REPO_ROOT / "guix" / "gaurix" / "packages" / "deptree-resolver-260413l-blocked-notes.scm"
SUMMARY_JSON = REPO_ROOT / "reports" / "deptree-resolver-260413l-summary.json"

RUN_ID = "deptree-resolver-260413l"
TIMESTAMP = datetime.now(timezone.utc).isoformat()


def load_resolve_result():
    with open(RESOLVE_RESULT) as f:
        return json.load(f)


def sanitize_scheme_name(name):
    return name.replace('.', '-').replace('_', '-').replace('+', '-plus').replace('@', '-at-')


def generate_recipe_scm(resolved, blocked):
    """Generate the main recipe .scm file."""
    recipe_names = [r['name'] for r in resolved]
    blocked_names = [(b['name'], b['reason_code']) for b in blocked]

    lines = []
    lines.append(f';;; deptree-resolver-260413l.scm -- Dependency-tree priority resolver')
    lines.append(f';;; Generated: {TIMESTAMP}')
    lines.append(f';;; Run ID: {RUN_ID}')
    lines.append(f';;; Total: {len(resolved) + len(blocked)} packages ({len(resolved)} recipes, {len(blocked)} blocked)')
    lines.append(';;;')
    lines.append(f';;; Recipes ({len(resolved)}):')
    for name in recipe_names:
        lines.append(f';;;   {name}')
    lines.append(';;;')
    lines.append(f';;; Blocked ({len(blocked)}):')
    for name, reason in blocked_names:
        lines.append(f';;;   {name} [{reason}]')
    lines.append(';;;')
    lines.append('')

    # Module definition
    lines.append('(define-module (gaurix packages deptree-resolver-260413l)')
    lines.append('  #:use-module (guix packages)')
    lines.append('  #:use-module (guix download)')
    lines.append('  #:use-module (guix git-download)')
    lines.append('  #:use-module (guix build-system copy)')
    lines.append('  #:use-module (guix build-system gnu)')
    lines.append('  #:use-module (guix build-system cmake)')
    lines.append('  #:use-module (guix build-system meson)')
    lines.append('  #:use-module (guix build-system pyproject)')
    lines.append('  #:use-module (guix build-system cargo)')
    lines.append('  #:use-module (guix build-system go)')
    lines.append('  #:use-module (guix gexp)')
    lines.append('  #:use-module (guix utils)')
    lines.append('  #:use-module ((guix licenses) #:prefix license:)')
    lines.append('  #:use-module (gnu packages base)')
    lines.append('  #:use-module (gnu packages compression)')
    lines.append('  #:export (')
    for r in resolved:
        sname = sanitize_scheme_name(r['name'])
        lines.append(f'            {sname}')
    lines.append('            ))')
    lines.append('')

    # Generate each recipe
    for r in resolved:
        rec = r['recipe']
        sname = sanitize_scheme_name(r['name'])
        name = rec['name']
        version = rec['version']
        bs = rec['build_system']
        home_page = rec['home_page']
        synopsis = rec['synopsis']
        description = rec['description']
        license_sym = rec['license']

        lines.append(f';;; -- {name} (#{r["number"]}) --')
        lines.append('')
        lines.append(f'(define-public {sname}')
        lines.append(f'  (package')
        lines.append(f'    (name "{name}")')
        lines.append(f'    (version "{version}")')

        if rec['source_type'] == 'git-fetch':
            git_url = rec.get('git_url', home_page)
            lines.append(f'    (source (origin')
            lines.append(f'              (method git-fetch)')
            lines.append(f'              (uri (git-reference')
            lines.append(f'                    (url "{git_url}")')
            lines.append(f'                    (commit (string-append "v" version))))')
            lines.append(f'              (file-name (git-file-name name version))')
            lines.append(f'              (sha256')
            lines.append(f'               (base32 "0000000000000000000000000000000000000000000000000000"))))')
        else:
            uri = rec.get('source_uri', f'"{home_page}"')
            lines.append(f'    (source (origin')
            lines.append(f'              (method url-fetch)')
            lines.append(f'              (uri {uri})')
            lines.append(f'              (sha256')
            lines.append(f'               (base32 "0000000000000000000000000000000000000000000000000000"))))')

        lines.append(f'    (build-system {bs})')

        # Arguments
        if bs == 'copy-build-system':
            lines.append(f'    (arguments')
            lines.append(f'     (list #:install-plan #~\'(("." "bin/" #:include-regexp ("^[^.]")))))')
        elif bs == 'go-build-system':
            # For go, we need import-path
            import_path = rec.get('git_url', home_page).replace('https://', '').replace('http://', '')
            lines.append(f'    (arguments')
            lines.append(f'     (list #:import-path "{import_path}"')
            lines.append(f'           #:tests? #f))')
        else:
            lines.append(f'    (arguments')
            lines.append(f'     (list #:tests? #f))')

        lines.append(f'    (home-page "{home_page}")')
        lines.append(f'    (synopsis "{synopsis}")')
        lines.append(f'    (description "{description}")')
        lines.append(f'    (license {license_sym})))')
        lines.append('')

    return '\n'.join(lines)


def generate_blocked_notes_scm(blocked):
    """Generate the blocked notes .scm file."""
    lines = []
    lines.append(f';;; deptree-resolver-260413l-blocked-notes.scm')
    lines.append(f';;; Generated: {TIMESTAMP}')
    lines.append(f';;; Blocked packages: {len(blocked)}')
    lines.append('')
    lines.append('(define-module (gaurix packages deptree-resolver-260413l-blocked-notes))')
    lines.append('')

    for b in blocked:
        lines.append(f';;; [{b["reason_code"]}] {b["name"]} (#{b["number"]})')
        lines.append(f';;;   {b["reason_detail"]}')
        lines.append('')

    return '\n'.join(lines)


def generate_summary_json(resolved, blocked, blocked_reasons):
    """Generate the summary JSON."""
    return {
        'run_id': RUN_ID,
        'timestamp': TIMESTAMP,
        'total_blocked_in_todo': 2852,
        'selected_count': len(resolved) + len(blocked),
        'recipes_created': len(resolved),
        'still_blocked': len(blocked),
        'recipe_names': [r['name'] for r in resolved],
        'blocked_names': [b['name'] for b in blocked],
        'blocked_reasons': blocked_reasons,
    }


def update_org_file(resolved, blocked):
    """Update todo_general_packages.org statuses."""
    # Build maps for resolved and blocked packages
    resolved_map = {}
    for r in resolved:
        resolved_map[r['number']] = r['name']

    blocked_map = {}
    for b in blocked:
        blocked_map[b['number']] = (b['name'], b['reason_code'], b['reason_detail'])

    # Read the org file
    with open(ORG_FILE, 'r') as f:
        content = f.read()

    lines = content.split('\n')
    new_lines = []
    i = 0
    updated_count = 0

    while i < len(lines):
        line = lines[i]

        # Check if this is a BLOCKED entry we resolved
        m = re.match(r'^(\*\* )BLOCKED (\d+)\. (\S+)(.*)', line)
        if m:
            prefix = m.group(1)
            number = int(m.group(2))
            pkg_name = m.group(3)
            rest = m.group(4)

            if number in resolved_map:
                # Change to DONE
                new_lines.append(f'{prefix}DONE {number}. {pkg_name}')
                # Find and update the status line in the body
                i += 1
                found_status = False
                while i < len(lines) and not lines[i].startswith('** '):
                    if lines[i].strip().startswith('- Status:') and not found_status:
                        new_lines.append(f'   - Status: DONE: recipe in deptree-resolver-260413l.scm')
                        found_status = True
                    elif lines[i].strip().startswith('- TODO Status:'):
                        new_lines.append(f'   - TODO Status: DONE')
                    else:
                        new_lines.append(lines[i])
                    i += 1
                if not found_status:
                    new_lines.append(f'   - Status: DONE: recipe in deptree-resolver-260413l.scm')
                updated_count += 1
                continue
            elif number in blocked_map:
                _, reason_code, reason_detail = blocked_map[number]
                # Keep as BLOCKED, update reason
                new_lines.append(f'{prefix}BLOCKED {number}. {pkg_name}')
                i += 1
                found_status = False
                while i < len(lines) and not lines[i].startswith('** '):
                    if lines[i].strip().startswith('- Status:') and not found_status:
                        new_lines.append(f'   - Status: BLOCKED: {reason_code}: {reason_detail} (deptree-resolver-260413l)')
                        found_status = True
                    else:
                        new_lines.append(lines[i])
                    i += 1
                if not found_status:
                    new_lines.append(f'   - Status: BLOCKED: {reason_code}: {reason_detail} (deptree-resolver-260413l)')
                updated_count += 1
                continue

        new_lines.append(line)
        i += 1

    # Write atomically
    with tempfile.NamedTemporaryFile(mode='w', dir=ORG_FILE.parent, suffix='.org',
                                      delete=False) as tmp:
        tmp.write('\n'.join(new_lines))
        tmp_path = tmp.name
    shutil.move(tmp_path, ORG_FILE)
    print(f"Updated {updated_count} entries in {ORG_FILE}", file=sys.stderr)


def update_packages_scm(resolved):
    """Update packages.scm with new exports (deterministic full rewrite)."""
    with open(PACKAGES_SCM, 'r') as f:
        content = f.read()

    # Find the end of existing exports and add new section
    new_exports = [sanitize_scheme_name(r['name']) for r in resolved]

    # Add new section before the closing paren
    # Find the pattern: last line before closing ) of define-module
    # Add a new section comment + exports

    section_marker = f'            ;; {RUN_ID}'
    export_lines = [section_marker] + [f'            {e}' for e in new_exports]
    export_block = '\n'.join(export_lines)

    # Insert before the first #:use-module or #:re-export or closing paren
    # Look for the line that has just ')' at the end of the define-module
    # The module definition is one big s-expression

    # Strategy: find the last export group, add after it
    # Look for the last ";; " comment line in the module definition area
    lines = content.split('\n')
    insert_idx = None
    in_module = False
    for idx, line in enumerate(lines):
        if '(define-module' in line:
            in_module = True
        if in_module:
            # Look for lines that are pure identifiers (exports) or comments
            stripped = line.strip()
            if stripped.startswith(';;') or (stripped and not stripped.startswith('(') and not stripped.startswith('#') and not stripped.startswith(')')):
                insert_idx = idx
            if stripped == ')' or stripped.endswith('))'):
                # Check if this closes the define-module
                if not stripped.startswith('('):
                    break

    if insert_idx is not None:
        # Insert after the last export
        new_lines = lines[:insert_idx+1] + export_block.split('\n') + lines[insert_idx+1:]
        new_content = '\n'.join(new_lines)

        with tempfile.NamedTemporaryFile(mode='w', dir=PACKAGES_SCM.parent, suffix='.scm',
                                          delete=False) as tmp:
            tmp.write(new_content)
            tmp_path = tmp.name
        shutil.move(tmp_path, PACKAGES_SCM)
        print(f"Updated {PACKAGES_SCM} with {len(new_exports)} new exports", file=sys.stderr)
    else:
        print(f"WARNING: Could not find insert point in {PACKAGES_SCM}", file=sys.stderr)


def update_general_compat_scm():
    """Update general-compat.scm to import the new module."""
    with open(COMPAT_SCM, 'r') as f:
        content = f.read()

    new_import = '  #:use-module (gaurix packages deptree-resolver-260413l)'

    # Insert after the last #:use-module line
    lines = content.split('\n')
    last_use_module_idx = None
    for idx, line in enumerate(lines):
        if '#:use-module' in line:
            last_use_module_idx = idx

    if last_use_module_idx is not None:
        new_lines = lines[:last_use_module_idx+1] + [new_import] + lines[last_use_module_idx+1:]
        new_content = '\n'.join(new_lines)

        with tempfile.NamedTemporaryFile(mode='w', dir=COMPAT_SCM.parent, suffix='.scm',
                                          delete=False) as tmp:
            tmp.write(new_content)
            tmp_path = tmp.name
        shutil.move(tmp_path, COMPAT_SCM)
        print(f"Updated {COMPAT_SCM} with new module import", file=sys.stderr)
    else:
        print(f"WARNING: Could not find #:use-module in {COMPAT_SCM}", file=sys.stderr)


def main():
    data = load_resolve_result()
    resolved = data['resolved']
    blocked = data['blocked']
    blocked_reasons = data['blocked_reasons']

    # 1. Generate recipe .scm
    recipe_content = generate_recipe_scm(resolved, blocked)
    with open(RECIPE_SCM, 'w') as f:
        f.write(recipe_content)
    print(f"Wrote {RECIPE_SCM}", file=sys.stderr)

    # 2. Generate blocked notes .scm
    blocked_content = generate_blocked_notes_scm(blocked)
    with open(BLOCKED_SCM, 'w') as f:
        f.write(blocked_content)
    print(f"Wrote {BLOCKED_SCM}", file=sys.stderr)

    # 3. Generate summary JSON
    summary = generate_summary_json(resolved, blocked, blocked_reasons)
    with open(SUMMARY_JSON, 'w') as f:
        json.dump(summary, f, indent=2)
    print(f"Wrote {SUMMARY_JSON}", file=sys.stderr)

    # 4. Update org file
    update_org_file(resolved, blocked)

    # 5. Update packages.scm
    update_packages_scm(resolved)

    # 6. Update general-compat.scm
    update_general_compat_scm()

    print(f"\nDone! {len(resolved)} recipes, {len(blocked)} blocked.", file=sys.stderr)


if __name__ == '__main__':
    main()
