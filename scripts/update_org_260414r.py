#!/usr/bin/env python3
"""Update todo_general_packages.org for deptree-resolver-260414r results.

For resolved packages (recipes): BLOCKED -> DONE with recipe reference
For blocked packages: update BLOCKED status with specific reason code
"""

import json
import re
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
ORG_FILE = ROOT / "todo_general_packages.org"
SUMMARY = ROOT / "reports" / "deptree-resolver-260414r-summary.json"

PASS_ID = "deptree-resolver-260414r"


def load_summary():
    with open(SUMMARY) as f:
        return json.load(f)


def build_update_map(summary):
    """Build a map of package_number -> update info."""
    updates = {}

    for r in summary['recipes']:
        num = r['number']
        updates[num] = {
            'new_status': 'DONE',
            'status_line': f'   - Status: DONE: recipe in {PASS_ID}.scm ({r["guix_name"]} v{r["version"]}, {r["build_system"]}-build-system)',
        }

    for b in summary['blocked']:
        num = b['number']
        reason = b.get('reason', b['category'])
        updates[num] = {
            'new_status': 'BLOCKED',
            'status_line': f'   - Status: BLOCKED: {b["category"]} — {reason} ({PASS_ID})',
        }

    return updates


def update_org_file(org_path, updates):
    """Read org file, apply updates, write back."""
    with open(org_path, 'r') as f:
        lines = f.readlines()

    new_lines = []
    i = 0
    updated_count = 0
    pattern = re.compile(r'^(\*\* )(BLOCKED|DONE|FAILED|NEEDS_RECIPE_DESIGN|TODO)( \d+\.\s+\S+)(.*)')

    while i < len(lines):
        line = lines[i]
        m = pattern.match(line)

        if m:
            status = m.group(2)
            # Extract number
            num_match = re.search(r'(\d+)\.', m.group(3))
            if num_match:
                num = int(num_match.group(1))
                if num in updates:
                    upd = updates[num]
                    new_status = upd['new_status']

                    if status == 'BLOCKED':
                        # Rewrite the header line
                        name_part = m.group(3).strip()
                        # Remove old bracket annotation from header if present
                        name_only = re.sub(r'\s*\[.*\]$', '', name_part)

                        if new_status == 'DONE':
                            new_header = f"** DONE {name_only}\n"
                        else:
                            # Keep BLOCKED but update bracket annotation
                            cat = [b['category'] for b in load_summary()['blocked'] if b['number'] == num]
                            reason_short = cat[0] if cat else 'BLOCKED'
                            new_header = f"** BLOCKED {name_only} [BLOCKED: {reason_short}]\n"

                        new_lines.append(new_header)
                        i += 1

                        # Scan existing body lines (indented lines following the header)
                        body_lines = []
                        has_status = False
                        has_todo_status = False
                        while i < len(lines) and (lines[i].startswith('   ') or lines[i].strip() == ''):
                            stripped = lines[i].strip()
                            if stripped.startswith('- TODO Status:'):
                                has_todo_status = True
                                if new_status == 'DONE':
                                    body_lines.append(f'   - TODO Status: DONE\n')
                                else:
                                    body_lines.append(lines[i])
                            elif stripped.startswith('- Status:') and not has_status:
                                has_status = True
                                body_lines.append(upd['status_line'] + '\n')
                            else:
                                body_lines.append(lines[i])
                            i += 1

                        # Add status line if not present
                        if not has_status:
                            # Insert after first body line
                            if body_lines:
                                body_lines.insert(1, upd['status_line'] + '\n')
                            else:
                                body_lines.append(upd['status_line'] + '\n')

                        if not has_todo_status and new_status == 'DONE':
                            body_lines.append(f'   - TODO Status: DONE\n')

                        new_lines.extend(body_lines)
                        updated_count += 1
                        continue

        new_lines.append(line)
        i += 1

    # Write back
    tmp_path = org_path.with_suffix('.org.tmp')
    with open(tmp_path, 'w') as f:
        f.writelines(new_lines)

    # Atomic move
    import shutil
    shutil.move(str(tmp_path), str(org_path))

    return updated_count


def main():
    summary = load_summary()
    updates = build_update_map(summary)
    print(f"Updates to apply: {len(updates)}")
    print(f"  DONE: {sum(1 for u in updates.values() if u['new_status'] == 'DONE')}")
    print(f"  BLOCKED (updated): {sum(1 for u in updates.values() if u['new_status'] == 'BLOCKED')}")

    count = update_org_file(ORG_FILE, updates)
    print(f"\nUpdated {count} entries in {ORG_FILE}")


if __name__ == "__main__":
    main()
