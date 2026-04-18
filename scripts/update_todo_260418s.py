#!/usr/bin/env python3
"""Update todo_general_packages.org for deptree-resolver-260418s pass.
Changes heading status from TODO to DONE, adds status lines for resolved packages."""

import json
import re
import shutil

TODO_FILE = "todo_general_packages.org"
PASS_TAG = "deptree-resolver-260418s"
SUMMARY_FILE = "reports/deptree-resolver-260418s-summary.json"


def main():
    with open(SUMMARY_FILE) as f:
        summary = json.load(f)

    resolved = {(p["number"], p["name"]): p for p in summary["resolved_packages"]}
    blocked = {(p["number"], p["name"]): p for p in summary.get("blocked_packages", [])}

    with open(TODO_FILE, 'r') as f:
        lines = f.readlines()

    updated_count = 0

    for i, line in enumerate(lines):
        m = re.match(r'^(\*\* )TODO (\d+)\. (\S+)(.*)', line)
        if not m:
            continue

        prefix, num_str, pkg_name, rest = m.groups()
        num = int(num_str)
        key = (num, pkg_name)

        if key in resolved:
            p = resolved[key]
            # Change heading from TODO to DONE
            lines[i] = f"{prefix}DONE {num_str}. {pkg_name}{rest}\n"

            # Find insertion point (after last body line of this entry)
            j = i + 1
            insert_after = i
            while j < len(lines) and not lines[j].startswith('** '):
                stripped = lines[j].strip()
                if stripped.startswith('- ') or stripped.startswith('Status:'):
                    insert_after = j
                elif stripped == '':
                    break
                else:
                    insert_after = j
                j += 1

            status_line = (
                f"   - Status: DONE: recipe in {PASS_TAG}.scm "
                f"({pkg_name} v{p['version']}, {p['build_system']}-build-system) ({PASS_TAG})\n"
            )
            todo_status_line = f"   - TODO Status: DONE\n"

            lines.insert(insert_after + 1, todo_status_line)
            lines.insert(insert_after + 1, status_line)
            updated_count += 1

        elif key in blocked:
            b = blocked[key]
            lines[i] = f"{prefix}BLOCKED {num_str}. {pkg_name}{rest}\n"

            j = i + 1
            insert_after = i
            while j < len(lines) and not lines[j].startswith('** '):
                stripped = lines[j].strip()
                if stripped.startswith('- ') or stripped.startswith('Status:'):
                    insert_after = j
                elif stripped == '':
                    break
                else:
                    insert_after = j
                j += 1

            status_line = (
                f"   - Status: BLOCKED: {b['reason']} ({PASS_TAG})\n"
            )
            todo_status_line = f"   - TODO Status: BLOCKED\n"

            lines.insert(insert_after + 1, todo_status_line)
            lines.insert(insert_after + 1, status_line)
            updated_count += 1

    # Write atomically
    tmp_file = TODO_FILE + ".tmp"
    with open(tmp_file, 'w') as f:
        f.writelines(lines)
    shutil.move(tmp_file, TODO_FILE)

    print(f"Updated {updated_count} entries in {TODO_FILE}")


if __name__ == '__main__':
    main()
