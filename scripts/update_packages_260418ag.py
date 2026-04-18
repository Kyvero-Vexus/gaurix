#!/usr/bin/env python3
"""Update todo_general_packages.org, general-compat.scm, and packages.scm
for deptree-resolver-260418ag.

Deterministic full-file transforms: read, compute, write temp, atomic move.
"""

import json
import re
import os
import tempfile
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
TODO_FILE = ROOT / "todo_general_packages.org"
COMPAT_FILE = ROOT / "guix" / "gaurix" / "packages" / "general-compat.scm"
PACKAGES_FILE = ROOT / "guix" / "gaurix" / "packages.scm"
SUMMARY = ROOT / "reports" / "deptree-resolver-260418ag-summary.json"
PASS_ID = "deptree-resolver-260418ag"


def load_summary():
    with open(SUMMARY) as f:
        return json.load(f)


def update_todo(summary):
    """Update todo_general_packages.org: DONE for resolved, FAILED for failed."""
    resolved_map = {p["name"]: p for p in summary["resolved_packages"]}
    failed_map = {p["name"]: p for p in summary["failed_packages"]}

    with open(TODO_FILE, "r") as f:
        lines = f.readlines()

    output = []
    i = 0
    while i < len(lines):
        line = lines[i]
        # Match TODO heading
        m = re.match(r"^(\*\*\s+)TODO(\s+\d+\.\s+)(\S+)(.*)", line)
        if m:
            prefix, num_part, pkg_name, rest = m.groups()
            if pkg_name in resolved_map:
                # Change to DONE with tag
                tag = f"  :{PASS_ID}:recipe-generated:"
                output.append(f"{prefix}DONE{num_part}{pkg_name}{tag}\n")
                # Add/update status in body
                i += 1
                found_status = False
                while i < len(lines) and not lines[i].startswith("** "):
                    body_line = lines[i]
                    if body_line.strip().startswith("- TODO Status:"):
                        output.append(f"   - TODO Status: DONE\n")
                        found_status = True
                    elif body_line.strip().startswith("- Status:") and not found_status:
                        output.append(body_line)
                        output.append(f"   - Status: DONE: Recipe generated in {PASS_ID}.scm ({PASS_ID})\n")
                    else:
                        output.append(body_line)
                    i += 1
                continue
            elif pkg_name in failed_map:
                reason = failed_map[pkg_name]["reason"]
                tag = f"  :{PASS_ID}:failed:"
                output.append(f"{prefix}FAILED{num_part}{pkg_name}{tag}\n")
                i += 1
                found_status = False
                while i < len(lines) and not lines[i].startswith("** "):
                    body_line = lines[i]
                    if body_line.strip().startswith("- TODO Status:"):
                        output.append(f"   - TODO Status: FAILED\n")
                        found_status = True
                    elif body_line.strip().startswith("- Status:") and not found_status:
                        output.append(body_line)
                        output.append(f"   - Status: FAILED: {reason} ({PASS_ID})\n")
                    else:
                        output.append(body_line)
                    i += 1
                continue

        output.append(line)
        i += 1

    # Atomic write
    fd, tmp_path = tempfile.mkstemp(dir=str(ROOT), suffix=".org.tmp")
    try:
        with os.fdopen(fd, "w") as f:
            f.writelines(output)
        os.replace(tmp_path, str(TODO_FILE))
    except:
        os.unlink(tmp_path)
        raise

    resolved_count = len(resolved_map)
    failed_count = len(failed_map)
    print(f"  Updated {resolved_count} TODO→DONE, {failed_count} TODO→FAILED in todo_general_packages.org")


def update_general_compat():
    """Add #:use-module for the new pass to general-compat.scm."""
    with open(COMPAT_FILE, "r") as f:
        content = f.read()

    new_module = f"  #:use-module (gaurix packages {PASS_ID})"

    if new_module in content:
        print(f"  general-compat.scm already has {PASS_ID} module")
        return

    # Find the last #:use-module line and insert after it
    lines = content.split("\n")
    output = []
    last_use_module_idx = -1

    for i, line in enumerate(lines):
        if line.strip().startswith("#:use-module"):
            last_use_module_idx = i

    for i, line in enumerate(lines):
        output.append(line)
        if i == last_use_module_idx:
            output.append(new_module)

    new_content = "\n".join(output)

    fd, tmp_path = tempfile.mkstemp(dir=str(ROOT / "guix" / "gaurix" / "packages"), suffix=".scm.tmp")
    try:
        with os.fdopen(fd, "w") as f:
            f.write(new_content)
        os.replace(tmp_path, str(COMPAT_FILE))
    except:
        os.unlink(tmp_path)
        raise

    print(f"  Added {PASS_ID} module to general-compat.scm")


def update_packages_scm(summary):
    """Add exported symbols from the new pass to packages.scm."""
    with open(PACKAGES_FILE, "r") as f:
        content = f.read()

    resolved = summary["resolved_packages"]
    if not resolved:
        return

    # Sanitize names same as worker
    def sanitize_name(name):
        return name.lower().replace("_", "-").replace(".", "-")

    exports = [sanitize_name(p["name"]) for p in resolved]

    # Check if already added
    if PASS_ID in content:
        print(f"  packages.scm already has {PASS_ID} exports")
        return

    lines = content.split("\n")
    output = []

    # Find the closing "))" of the export list and insert before it
    found_export_end = False
    for i, line in enumerate(lines):
        # Look for the last line before the closing of exports
        if line.strip() == "))" and not found_export_end:
            # Add comment and exports before the closing
            output.append(f"            ;; {PASS_ID}: {len(exports)} resolved")
            for exp in exports:
                output.append(f"            {exp}")
            found_export_end = True
        output.append(line)

    if not found_export_end:
        # Fallback: append exports as comments at end
        output.append(f"\n;; {PASS_ID}: {len(exports)} resolved")
        for exp in exports:
            output.append(f";; {exp}")

    new_content = "\n".join(output)

    fd, tmp_path = tempfile.mkstemp(dir=str(ROOT / "guix" / "gaurix"), suffix=".scm.tmp")
    try:
        with os.fdopen(fd, "w") as f:
            f.write(new_content)
        os.replace(tmp_path, str(PACKAGES_FILE))
    except:
        os.unlink(tmp_path)
        raise

    print(f"  Added {len(exports)} exports to packages.scm ({PASS_ID})")


def main():
    print(f"[{PASS_ID}] Loading summary...")
    summary = load_summary()
    print(f"  {summary['resolved']} resolved, {summary['failed']} failed")

    print(f"[{PASS_ID}] Updating todo_general_packages.org...")
    update_todo(summary)

    print(f"[{PASS_ID}] Updating general-compat.scm...")
    update_general_compat()

    print(f"[{PASS_ID}] Updating packages.scm...")
    update_packages_scm(summary)

    print(f"\n[{PASS_ID}] All updates complete.")


if __name__ == "__main__":
    main()
