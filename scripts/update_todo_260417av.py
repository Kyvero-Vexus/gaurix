#!/usr/bin/env python3
"""Update todo_general_packages.org for deptree-resolver-260417av pass.

Updates resolved packages from BLOCKED to DONE and refreshes BLOCKED reason tags.
"""

import json
import re
import tempfile
import shutil
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
TODO_FILE = ROOT / "todo_general_packages.org"
SUMMARY = ROOT / "reports" / "deptree-resolver-260417av-summary.json"
PASS_ID = "deptree-resolver-260417av"


def main():
    with open(SUMMARY) as f:
        summary = json.load(f)

    resolved = {r["name"] for r in summary["resolved_packages"]}
    blocked_map = {b["name"]: b["reason"] for b in summary["blocked_packages"]}

    with open(TODO_FILE, "r") as f:
        lines = f.readlines()

    updated = 0
    new_lines = []
    i = 0
    while i < len(lines):
        line = lines[i]
        m = re.match(r'^(\*\*\s+)BLOCKED(\s+\d+\.\s+)(\S+)(.*)', line)
        if m:
            prefix = m.group(1)
            num_dot = m.group(2)
            pkg_name = m.group(3)
            rest = m.group(4)

            if pkg_name in resolved:
                recipe_info = None
                for r in summary["resolved_packages"]:
                    if r["name"] == pkg_name:
                        recipe_info = r
                        break
                guix_name = pkg_name.lower().replace("_", "-").replace(".", "-")
                new_line = f"{prefix}DONE{num_dot}{pkg_name}\n"
                new_lines.append(new_line)
                updated += 1

                # Look ahead for existing status lines and skip them
                i += 1
                while i < len(lines) and not lines[i].startswith("** "):
                    new_lines.append(lines[i])
                    i += 1

                # Add status line before next heading
                status_line = f"   - Status: DONE: recipe in {PASS_ID}.scm ({guix_name} v{recipe_info['version']}, {recipe_info['method']})\n"
                # Insert before the last non-heading line
                insert_pos = len(new_lines)
                new_lines.insert(insert_pos, status_line)
                continue

            elif pkg_name in blocked_map:
                reason = blocked_map[pkg_name]
                # Extract reason code
                reason_code = reason.split(":")[0] if ":" in reason else "BLOCKED"
                # Keep BLOCKED but update tag
                tag_str = f"  :{PASS_ID}:{reason_code}:"
                # Truncate reason for tag
                short_reason = reason.split(";")[0] if ";" in reason else reason
                if len(short_reason) > 80:
                    short_reason = short_reason[:77] + "..."
                new_line = f"{prefix}BLOCKED{num_dot}{pkg_name}{tag_str} {short_reason}\n"
                new_lines.append(new_line)
                i += 1
                continue

        new_lines.append(line)
        i += 1

    # Write atomically
    with tempfile.NamedTemporaryFile(mode='w', dir=TODO_FILE.parent,
                                     suffix='.tmp', delete=False) as tmp:
        tmp.writelines(new_lines)
        tmp_path = Path(tmp.name)

    shutil.move(str(tmp_path), str(TODO_FILE))
    print(f"[{PASS_ID}] Updated {updated} packages from BLOCKED to DONE")
    print(f"[{PASS_ID}] Updated {len(blocked_map)} BLOCKED reason tags")


if __name__ == "__main__":
    main()
