#!/usr/bin/env python3
"""Fix todo_general_packages.org for recipe-resolver-260418t batch.
Robust approach: process the file in a single pass, matching entry headers."""

import json
import re
import os
from pathlib import Path

REPO_ROOT = Path(__file__).resolve().parent.parent
TODO_FILE = REPO_ROOT / "todo_general_packages.org"
REPORT_FILE = REPO_ROOT / "reports" / "recipe-resolver-260418t-aur-lookup.json"
BATCH_ID = "recipe-resolver-260418t"

BUILD_SYSTEM_SHORT = {
    "gnu": "gnu", "cmake": "cmake", "meson": "meson",
    "python": "python", "pyproject": "pyproject", "cargo": "cargo",
    "go": "go", "node": "node", "copy": "copy", "font": "font",
    "ruby": "ruby", "perl": "perl", "trivial": "trivial",
}

def main():
    # Load report
    with open(REPORT_FILE) as f:
        report = json.load(f)

    # Build lookup: org_num -> update info
    updates = {}
    for pkg in report["selected"]:
        lic_short = pkg["license"].replace("license:", "")
        status = (
            f"DONE: NEEDS_RECIPE_DESIGN resolved — recipe in {BATCH_ID}.scm "
            f"({pkg['guix_name']} v{pkg['version']}, "
            f"{BUILD_SYSTEM_SHORT[pkg['build_sys']]}-build-system, {lic_short})"
        )
        updates[pkg["org_num"]] = {
            "keyword": "DONE",
            "status": status,
            "aur_name": pkg["aur_name"],
            "tags": f":{BATCH_ID}:recipe-generated:",
        }

    for pkg in report["blocked"]:
        updates[pkg["org_num"]] = {
            "keyword": "BLOCKED",
            "status": f"BLOCKED: {pkg['reason']} ({BATCH_ID})",
            "aur_name": pkg["aur_name"],
            "tags": "",
        }

    print(f"Processing {len(updates)} entries...")

    with open(TODO_FILE, "r") as f:
        lines = f.readlines()

    # Process line by line
    i = 0
    updated_count = 0
    output_lines = []

    while i < len(lines):
        line = lines[i]

        # Check if this is a TODO/DONE/BLOCKED header we need to update
        m = re.match(r'^(\*\* )(TODO|DONE|BLOCKED) (\d+)\.\s+(.+?)(\s+:.+:)?\s*$', line)
        if m:
            prefix = m.group(1)
            current_keyword = m.group(2)
            org_num = int(m.group(3))
            entry_text = m.group(4).strip()

            if org_num in updates:
                upd = updates[org_num]
                new_keyword = upd["keyword"]
                tags = upd["tags"]
                status_text = upd["status"]

                # Write updated header
                if tags:
                    output_lines.append(f"{prefix}{new_keyword} {org_num}. {entry_text}  {tags}\n")
                else:
                    output_lines.append(f"{prefix}{new_keyword} {org_num}. {entry_text}\n")
                i += 1

                # Now process the body lines until next entry header
                status_written = False
                while i < len(lines) and not lines[i].startswith("** "):
                    body_line = lines[i]

                    # Replace existing Status line
                    if body_line.strip().startswith("- Status:") and not body_line.strip().startswith("- Status: DONE:") and not "recipe-resolver-260418t" in body_line:
                        output_lines.append(f"   - Status: {status_text}\n")
                        status_written = True
                    elif body_line.strip().startswith("- TODO Status:"):
                        # Update TODO Status too
                        output_lines.append(f"   - TODO Status: {new_keyword}\n")
                        if not status_written:
                            output_lines.append(f"   - Status: {status_text}\n")
                            status_written = True
                    else:
                        output_lines.append(body_line)
                    i += 1

                updated_count += 1
                continue

        output_lines.append(line)
        i += 1

    # Write atomically
    tmp = TODO_FILE.with_suffix(".tmp")
    with open(tmp, "w") as f:
        f.writelines(output_lines)
    os.replace(str(tmp), str(TODO_FILE))

    print(f"Updated {updated_count} entries in {TODO_FILE.name}")

    # Verify
    with open(TODO_FILE) as f:
        content = f.read()
    count = content.count(BATCH_ID)
    print(f"Verification: {count} occurrences of '{BATCH_ID}' in org file")


if __name__ == "__main__":
    main()
