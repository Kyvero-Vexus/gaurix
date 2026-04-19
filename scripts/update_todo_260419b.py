#!/usr/bin/env python3
"""Deterministic update script for deptree-resolver-260419b.

Reads the summary, then:
1. Updates todo_general_packages.org (TODO -> DONE / FAILED)
2. Updates packages.scm (add exports + pass comment)
3. Updates general-compat.scm (add #:use-module + re-exports)

All file transforms use: read -> compute -> write temp -> atomic move.
"""

import json
import os
import re
import shutil
import tempfile
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
PASS_ID = "deptree-resolver-260419b"
SUMMARY = ROOT / "reports" / f"{PASS_ID}-summary.json"
TODO_FILE = ROOT / "todo_general_packages.org"
PACKAGES_SCM = ROOT / "guix" / "gaurix" / "packages.scm"
GENERAL_COMPAT = ROOT / "guix" / "gaurix" / "packages" / "general-compat.scm"


def sanitize_name(name):
    return name.lower().replace("_", "-").replace(".", "-")


def update_todo_file(resolved, failed, still_todo):
    """Update todo_general_packages.org statuses."""
    # Build lookup: number -> new_status, reason
    updates = {}
    for pkg in resolved:
        updates[pkg["number"]] = ("DONE", f"resolved in {PASS_ID} ({pkg['build_system']})")
    for pkg in failed:
        updates[pkg["number"]] = ("FAILED", pkg["reason"])
    # still_todo stays as TODO

    with open(TODO_FILE, "r") as f:
        lines = f.readlines()

    updated_count = 0
    new_lines = []
    for line in lines:
        m = re.match(r"^(\*\*\s+)TODO(\s+)(\d+)(\.\s+\S+.*)", line)
        if m:
            num = int(m.group(3))
            if num in updates:
                new_status, reason = updates[num]
                new_line = f"{m.group(1)}{new_status}{m.group(2)}{m.group(3)}{m.group(4)}\n"
                new_lines.append(new_line)
                updated_count += 1
                continue
        new_lines.append(line)

    # Atomic write
    fd, tmp_path = tempfile.mkstemp(dir=TODO_FILE.parent, suffix=".tmp")
    try:
        with os.fdopen(fd, "w") as f:
            f.writelines(new_lines)
        shutil.move(tmp_path, TODO_FILE)
    except:
        os.unlink(tmp_path)
        raise

    print(f"  Updated {updated_count} entries in todo_general_packages.org")
    return updated_count


def update_packages_scm(resolved):
    """Add exports for resolved packages to packages.scm."""
    with open(PACKAGES_SCM, "r") as f:
        content = f.read()

    # Find the closing )) of the export list
    # Add new exports before it
    new_exports = [sanitize_name(pkg["name"]) for pkg in resolved]

    # Add pass comment and new exports before the closing ))
    export_block = f"\n               ;; {PASS_ID}: {len(resolved)} TODO packages resolved\n"
    for exp in new_exports:
        export_block += f"               {exp}\n"

    # Find the last )) closing the define-module
    content = content.replace(
        "               sftpman-python\n               ))",
        f"               sftpman-python\n{export_block}               ))"
    )

    # Add re-exports at the end for the new module
    re_export_block = f"\n;; {PASS_ID} ({len(resolved)} TODO packages resolved)\n"
    for exp in new_exports:
        re_export_block += f"(re-export {exp})\n"

    content += re_export_block

    # Atomic write
    fd, tmp_path = tempfile.mkstemp(dir=PACKAGES_SCM.parent, suffix=".tmp")
    try:
        with os.fdopen(fd, "w") as f:
            f.write(content)
        shutil.move(tmp_path, PACKAGES_SCM)
    except:
        os.unlink(tmp_path)
        raise

    print(f"  Updated packages.scm with {len(new_exports)} new exports")


def update_general_compat(resolved):
    """Add #:use-module and re-exports for new pass to general-compat.scm."""
    with open(GENERAL_COMPAT, "r") as f:
        content = f.read()

    new_exports = [sanitize_name(pkg["name"]) for pkg in resolved]

    # Add use-module line — find the last #:use-module line and add after it
    # Find where the #:use-module lines end (look for the first line that's not a use-module after the define-module)
    lines = content.split("\n")
    insert_idx = None
    for i, line in enumerate(lines):
        if line.strip().startswith("#:use-module"):
            insert_idx = i

    if insert_idx is not None:
        lines.insert(insert_idx + 1, f"  #:use-module (gaurix packages {PASS_ID})")

    # Add re-exports at the end
    lines.append(f"\n;;; --- {PASS_ID}: {len(resolved)} TODO packages resolved ---")
    for exp in new_exports:
        lines.append(f"(re-export {exp})")

    new_content = "\n".join(lines)

    # Atomic write
    fd, tmp_path = tempfile.mkstemp(dir=GENERAL_COMPAT.parent, suffix=".tmp")
    try:
        with os.fdopen(fd, "w") as f:
            f.write(new_content)
        shutil.move(tmp_path, GENERAL_COMPAT)
    except:
        os.unlink(tmp_path)
        raise

    print(f"  Updated general-compat.scm with {len(new_exports)} re-exports")


def main():
    with open(SUMMARY) as f:
        summary = json.load(f)

    resolved = summary["resolved_packages"]
    failed = summary["failed_packages"]
    still_todo = summary.get("still_todo_packages", [])

    print(f"[{PASS_ID}] Updating bookkeeping files...")
    print(f"  Resolved: {len(resolved)}, Failed: {len(failed)}, Still TODO: {len(still_todo)}")

    print("\n1. Updating todo_general_packages.org...")
    update_todo_file(resolved, failed, still_todo)

    print("\n2. Updating packages.scm...")
    update_packages_scm(resolved)

    print("\n3. Updating general-compat.scm...")
    update_general_compat(resolved)

    print(f"\n[{PASS_ID}] All bookkeeping complete.")


if __name__ == "__main__":
    main()
