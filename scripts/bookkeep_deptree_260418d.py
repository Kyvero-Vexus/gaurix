#!/usr/bin/env python3
"""Bookkeeping for deptree-resolver-260418d.

Updates:
1. todo_general_packages.org - status changes for resolved/updated packages
2. guix/gaurix/packages/general-compat.scm - new module + re-exports
3. guix/gaurix/packages.scm - new module + re-exports
"""

import json
import re
import shutil
import tempfile
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
TODO_FILE = ROOT / "todo_general_packages.org"
GENERAL_COMPAT = ROOT / "guix" / "gaurix" / "packages" / "general-compat.scm"
PACKAGES_SCM = ROOT / "guix" / "gaurix" / "packages.scm"
SUMMARY_FILE = ROOT / "reports" / "deptree-resolver-260418d-summary.json"
PASS_ID = "deptree-resolver-260418d"


def load_summary():
    with open(SUMMARY_FILE) as f:
        return json.load(f)


def update_todo(summary):
    """Update todo_general_packages.org with status changes."""
    # Build lookup for all changes
    done_already = {r["number"]: r for r in summary["already_in_guix"]}
    done_under = {r["number"]: r for r in summary["resolved_under"]}
    done_recipe = {r["number"]: r for r in summary["new_recipes"]}
    blocked_update = {r["number"]: r for r in summary["blocked_packages"]}

    with open(TODO_FILE, "r") as f:
        lines = f.readlines()

    new_lines = []
    i = 0
    changes = 0

    while i < len(lines):
        line = lines[i]

        # Match BLOCKED header
        m = re.match(r"^(\*\*\s+)BLOCKED(\s+(\d+)\.\s+(\S+))(.*)", line)
        if m:
            prefix = m.group(1)
            suffix = m.group(2)
            number = int(m.group(3))
            name = m.group(4)
            rest = m.group(5)

            if number in done_already:
                info = done_already[number]
                # Change to DONE
                new_lines.append(f"{prefix}DONE{suffix}\n")
                i += 1
                # Copy existing content until we find end of entry or TODO Status
                while i < len(lines):
                    current = lines[i]
                    if current.startswith("** "):
                        # Hit next entry - insert status before it
                        new_lines.append(f"- Status: DONE: {info['reason']} ({PASS_ID})\n")
                        break
                    elif current.strip().startswith("- TODO Status:"):
                        new_lines.append(f"   - TODO Status: DONE\n")
                        i += 1
                    else:
                        new_lines.append(current)
                        i += 1
                else:
                    new_lines.append(f"- Status: DONE: {info['reason']} ({PASS_ID})\n")
                changes += 1
                continue

            elif number in done_under:
                info = done_under[number]
                new_lines.append(f"{prefix}DONE{suffix}\n")
                i += 1
                while i < len(lines):
                    current = lines[i]
                    if current.startswith("** "):
                        new_lines.append(f"- Status: DONE: {info['reason']} ({PASS_ID})\n")
                        break
                    elif current.strip().startswith("- TODO Status:"):
                        new_lines.append(f"   - TODO Status: DONE\n")
                        i += 1
                    else:
                        new_lines.append(current)
                        i += 1
                else:
                    new_lines.append(f"- Status: DONE: {info['reason']} ({PASS_ID})\n")
                changes += 1
                continue

            elif number in done_recipe:
                info = done_recipe[number]
                new_lines.append(f"{prefix}DONE{suffix}\n")
                i += 1
                while i < len(lines):
                    current = lines[i]
                    if current.startswith("** "):
                        new_lines.append(f"- Status: DONE: recipe in {PASS_ID}.scm ({PASS_ID})\n")
                        break
                    elif current.strip().startswith("- TODO Status:"):
                        new_lines.append(f"   - TODO Status: DONE\n")
                        i += 1
                    else:
                        new_lines.append(current)
                        i += 1
                else:
                    new_lines.append(f"- Status: DONE: recipe in {PASS_ID}.scm ({PASS_ID})\n")
                changes += 1
                continue

            elif number in blocked_update:
                info = blocked_update[number]
                # Update header with new reason tag
                reason_code = info["reason"].split(":")[0].strip()
                new_lines.append(f"{prefix}BLOCKED{suffix.split(':')[0].rstrip()}  :{PASS_ID}:{reason_code}: {info['reason']}\n")
                i += 1
                # Find end of entry and add status line
                while i < len(lines):
                    current = lines[i]
                    if current.startswith("** "):
                        new_lines.append(f"- Status: BLOCKED: {info['reason']} ({PASS_ID})\n")
                        break
                    else:
                        new_lines.append(current)
                        i += 1
                else:
                    new_lines.append(f"- Status: BLOCKED: {info['reason']} ({PASS_ID})\n")
                changes += 1
                continue

        new_lines.append(line)
        i += 1

    # Atomic write
    fd, tmp = tempfile.mkstemp(dir=ROOT, suffix=".org")
    with open(tmp, "w") as f:
        f.writelines(new_lines)
    shutil.move(tmp, TODO_FILE)
    print(f"  Updated {TODO_FILE}: {changes} entries changed")


def update_general_compat(summary):
    """Add new module import and re-exports to general-compat.scm."""
    with open(GENERAL_COMPAT, "r") as f:
        content = f.read()

    lines = content.split("\n")

    # Find the module declaration and add new use-module
    new_use_module = f"  #:use-module (gaurix packages {PASS_ID})"

    # Find last #:use-module line
    last_use_idx = -1
    for i, line in enumerate(lines):
        if "#:use-module" in line:
            last_use_idx = i

    if last_use_idx >= 0:
        lines.insert(last_use_idx + 1, new_use_module)
    else:
        print("  WARNING: could not find #:use-module in general-compat.scm")
        return

    # Get export names from the .scm file
    export_names = []
    for r in summary["new_recipes"]:
        var_name = r["name"].lower().replace("_", "-").replace(".", "-")
        export_names.append(var_name)
    # Also add dep packages
    for d in summary["new_deps"]:
        var_name = d["name"].lower().replace("_", "-").replace(".", "-")
        export_names.append(var_name)

    # Add re-exports at end of file
    lines.append(f";;; {PASS_ID}")
    for name in sorted(export_names):
        lines.append(f"(re-export {name})")

    new_content = "\n".join(lines)

    fd, tmp = tempfile.mkstemp(dir=ROOT, suffix=".scm")
    with open(tmp, "w") as f:
        f.write(new_content)
    shutil.move(tmp, GENERAL_COMPAT)
    print(f"  Updated {GENERAL_COMPAT}: added {len(export_names)} re-exports")


def update_packages_scm(summary):
    """Add new module and re-exports to packages.scm."""
    with open(PACKAGES_SCM, "r") as f:
        content = f.read()

    # Get export names
    export_names = []
    for r in summary["new_recipes"]:
        var_name = r["name"].lower().replace("_", "-").replace(".", "-")
        export_names.append(var_name)
    for d in summary["new_deps"]:
        var_name = d["name"].lower().replace("_", "-").replace(".", "-")
        export_names.append(var_name)

    export_names_sorted = sorted(export_names)

    # Build the new define-module block
    block = f"\n;;; {PASS_ID}: {len(summary['new_recipes'])} BLOCKED resolved ({len(summary['already_in_guix'])} ALREADY_IN_GUIX, {len(summary['new_recipes'])} new recipes, {len(summary['new_deps'])} deps)\n"
    block += f"(define-module (gaurix packages)\n"
    block += f"  #:use-module (gaurix packages {PASS_ID})\n"
    block += f"  #:re-export (\n"
    for name in export_names_sorted:
        block += f"    {name}\n"
    block += f"  )\n"
    block += f")\n"

    content += block

    fd, tmp = tempfile.mkstemp(dir=ROOT, suffix=".scm")
    with open(tmp, "w") as f:
        f.write(content)
    shutil.move(tmp, PACKAGES_SCM)
    print(f"  Updated {PACKAGES_SCM}: added {len(export_names)} re-exports")


def main():
    print(f"[{PASS_ID}] Running bookkeeping updates...")

    summary = load_summary()

    print(f"  Resolved: {summary['total_resolved']} ({summary['resolved_already_in_guix']} ALREADY_IN_GUIX, "
          f"{summary['resolved_under_existing']} under existing, {summary['resolved_new_recipe']} new recipes)")
    print(f"  Blocked remaining: {summary['blocked_remaining']}")

    print(f"\n  Updating todo_general_packages.org...")
    update_todo(summary)

    print(f"\n  Updating general-compat.scm...")
    update_general_compat(summary)

    print(f"\n  Updating packages.scm...")
    update_packages_scm(summary)

    print(f"\n[{PASS_ID}] Bookkeeping complete.")


if __name__ == "__main__":
    main()
