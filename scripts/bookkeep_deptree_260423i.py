#!/usr/bin/env python3
"""
Bookkeeping for deptree-resolver-260423i:
1. Update todo_general_packages.org statuses for resolved packages
2. Update general-compat.scm (add use-module + re-exports)
3. Update packages.scm (add pass comment)
"""

import json
import re
import shutil
import tempfile
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
ORG_FILE = ROOT / "todo_general_packages.org"
GENERAL_COMPAT = ROOT / "guix" / "gaurix" / "packages" / "general-compat.scm"
PACKAGES_SCM = ROOT / "guix" / "gaurix" / "packages.scm"
SELECTION = ROOT / "reports" / "deptree-resolver-260423i-selection.json"

PASS_ID = "deptree-resolver-260423i"


def update_org_file():
    """Update todo_general_packages.org statuses for resolved packages."""
    with open(SELECTION) as f:
        selection = json.load(f)

    resolved_names = {p["name"] for p in selection["selected"]}
    resolved_numbers = {p["name"]: p["number"] for p in selection["selected"]}

    with open(ORG_FILE, "r") as f:
        lines = f.readlines()

    output_lines = []
    current_name = None
    current_number = None
    i = 0
    changes = 0

    while i < len(lines):
        line = lines[i]

        # Match entry header
        m = re.match(r'^(\*\*\s+)\S+(\s+(\d+)\.\s+(\S+))', line)
        if m:
            prefix = m.group(1)
            rest = m.group(2)
            current_number = int(m.group(3))
            current_name = m.group(4).rstrip(':').split(':')[0]

            if current_name in resolved_names:
                # Change header status to DONE
                line = f"{prefix}DONE{rest}\n"
            output_lines.append(line)
            i += 1
            continue

        # Check for TODO Status line in a resolved entry
        if current_name in resolved_names and line.strip().startswith("- TODO Status:"):
            status = line.strip().split("- TODO Status:")[1].strip()
            if status == "BLOCKED":
                # Replace with DONE
                indent = line[:len(line) - len(line.lstrip())]
                output_lines.append(f"{indent}- TODO Status: DONE\n")
                # Add status line
                output_lines.append(f"{indent}- Status: DONE: Recipe in {PASS_ID}.scm ({PASS_ID})\n")
                changes += 1
                i += 1
                continue

        output_lines.append(line)
        i += 1

    # Write atomically
    with tempfile.NamedTemporaryFile(mode="w", dir=ORG_FILE.parent,
                                      delete=False, suffix=".tmp") as tmp:
        tmp.writelines(output_lines)
        tmp_path = Path(tmp.name)
    shutil.move(str(tmp_path), str(ORG_FILE))
    print(f"Updated {ORG_FILE}: {changes} entries changed to DONE")
    return changes


def update_general_compat():
    """Add use-module and re-export lines for this pass."""
    with open(SELECTION) as f:
        selection = json.load(f)

    export_names = []
    for p in selection["selected"]:
        export_names.append(p["name"])

    with open(GENERAL_COMPAT, "r") as f:
        content = f.read()

    # Find the last #:use-module line for a deptree-resolver and add after it
    # Pattern: find the last use-module line before the closing paren of define-module
    lines = content.split("\n")

    # Find where to insert use-module
    last_use_module_idx = None
    for i, line in enumerate(lines):
        if "#:use-module" in line and ("deptree-resolver" in line or "recipe-resolver" in line):
            last_use_module_idx = i

    if last_use_module_idx is None:
        # Fallback: find last #:use-module line
        for i, line in enumerate(lines):
            if "#:use-module" in line:
                last_use_module_idx = i

    # Insert new use-module line
    new_use_module = f"  #:use-module (gaurix packages {PASS_ID})"
    lines.insert(last_use_module_idx + 1, new_use_module)

    # Find the end of the file and add re-exports before the final empty line
    # Re-exports go at the end
    re_export_block = [f"\n;;; {PASS_ID} re-exports"]
    for name in export_names:
        re_export_block.append(f"(re-export {name})")

    # Add re-exports at end
    # Remove trailing empty lines, add re-exports, add final newline
    while lines and lines[-1].strip() == "":
        lines.pop()
    lines.extend(re_export_block)
    lines.append("")

    new_content = "\n".join(lines)

    # Write atomically
    with tempfile.NamedTemporaryFile(mode="w", dir=GENERAL_COMPAT.parent,
                                      delete=False, suffix=".tmp") as tmp:
        tmp.write(new_content)
        tmp_path = Path(tmp.name)
    shutil.move(str(tmp_path), str(GENERAL_COMPAT))
    print(f"Updated {GENERAL_COMPAT}: added use-module + {len(export_names)} re-exports")


def update_packages_scm():
    """Add pass comment to packages.scm."""
    with open(PACKAGES_SCM, "r") as f:
        content = f.read()

    # Find the comment block area (after the define-module line, in the comment area)
    # Add a new comment line for this pass
    pass_comment = f"            ;; {PASS_ID} (100 BLOCKED resolved via dep-tree priority)"

    # Insert after the last resolver comment line
    lines = content.split("\n")
    last_comment_idx = None
    for i, line in enumerate(lines):
        stripped = line.strip()
        if stripped.startswith(";;") and ("resolver" in stripped or "NRD" in stripped or "BLOCKED" in stripped):
            last_comment_idx = i

    if last_comment_idx is not None:
        lines.insert(last_comment_idx + 1, pass_comment)
    else:
        # Insert after define-module line
        for i, line in enumerate(lines):
            if "define-module" in line:
                lines.insert(i + 1, pass_comment)
                break

    new_content = "\n".join(lines)

    with tempfile.NamedTemporaryFile(mode="w", dir=PACKAGES_SCM.parent,
                                      delete=False, suffix=".tmp") as tmp:
        tmp.write(new_content)
        tmp_path = Path(tmp.name)
    shutil.move(str(tmp_path), str(PACKAGES_SCM))
    print(f"Updated {PACKAGES_SCM}: added pass comment")


def main():
    print(f"=== Bookkeeping for {PASS_ID} ===\n")
    changes = update_org_file()
    update_general_compat()
    update_packages_scm()
    print(f"\nDone. {changes} packages marked DONE in org file.")


if __name__ == "__main__":
    main()
