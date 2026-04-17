#!/usr/bin/env python3
"""Deterministic update script for deptree-resolver-260416e.

Updates:
1) todo_general_packages.org — change BLOCKED → DONE for resolved packages
2) general-compat.scm — add new module import + re-export section
3) packages.scm — add re-exports for new packages

All file transforms are deterministic: read, compute, write temp, atomic move.
"""

import json
import os
import re
import shutil
import tempfile
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
PASS_ID = "deptree-resolver-260416e"
SUMMARY = ROOT / "reports" / f"{PASS_ID}-summary.json"
TODO_FILE = ROOT / "todo_general_packages.org"
COMPAT_FILE = ROOT / "guix" / "gaurix" / "packages" / "general-compat.scm"
PACKAGES_FILE = ROOT / "guix" / "gaurix" / "packages.scm"


def load_summary():
    with open(SUMMARY) as f:
        return json.load(f)


def update_todo(summary):
    """Update todo_general_packages.org: BLOCKED → DONE for resolved, update blocked reasons."""
    resolved_names = {p["name"] for p in summary["resolved_packages"]}
    blocked_map = {p["name"]: p["reason"] for p in summary["blocked_packages"]}

    with open(TODO_FILE, "r") as f:
        lines = f.readlines()

    new_lines = []
    for line in lines:
        # Match BLOCKED entries: ** BLOCKED 123. package-name ...
        m = re.match(r"^(\*\*\s+)BLOCKED(\s+\d+\.\s+)(\S+)(.*)", line)
        if m:
            prefix, num_dot, pkg_name, rest = m.groups()
            if pkg_name in resolved_names:
                # Change BLOCKED to DONE and update the bracket info
                # Preserve original bracket content but mark as resolved
                new_rest = re.sub(
                    r"\[BLOCKED:.*?\]",
                    f"[RESOLVED: {PASS_ID}]",
                    rest
                )
                if "[RESOLVED:" not in new_rest and "[BLOCKED:" not in new_rest:
                    new_rest = f" [RESOLVED: {PASS_ID}]" + new_rest
                new_lines.append(f"{prefix}DONE{num_dot}{pkg_name}{new_rest}")
                continue
            elif pkg_name in blocked_map:
                # Update blocked reason
                reason = blocked_map[pkg_name]
                new_rest = re.sub(
                    r"\[BLOCKED:.*?\]",
                    f"[BLOCKED: {reason}]",
                    rest
                )
                new_lines.append(f"{prefix}BLOCKED{num_dot}{pkg_name}{new_rest}")
                continue
        new_lines.append(line)

    # Atomic write
    fd, tmp_path = tempfile.mkstemp(dir=ROOT, suffix=".org.tmp")
    try:
        with os.fdopen(fd, "w") as f:
            f.writelines(new_lines)
        shutil.move(tmp_path, TODO_FILE)
    except Exception:
        os.unlink(tmp_path)
        raise

    resolved_count = len(resolved_names)
    print(f"  Updated {resolved_count} entries BLOCKED → DONE in todo")
    return resolved_count


def sanitize_name(name):
    return name.lower().replace("_", "-").replace(".", "-")


def update_general_compat(summary):
    """Add new module import and re-export section to general-compat.scm."""
    with open(COMPAT_FILE, "r") as f:
        content = f.read()

    module_line = f"  #:use-module (gaurix packages {PASS_ID})"

    # Check if already added
    if PASS_ID in content:
        print(f"  general-compat.scm already contains {PASS_ID}, skipping module import")
    else:
        # Insert after the last deptree-resolver module import
        # Find the last deptree-resolver-260416d line
        insert_pattern = r"(  #:use-module \(gaurix packages deptree-resolver-260416d\))"
        if re.search(insert_pattern, content):
            content = re.sub(
                insert_pattern,
                f"\\1\n{module_line}",
                content,
            )
        else:
            # Fallback: insert before the first (guix packages) line
            content = content.replace(
                "  #:use-module (guix packages)",
                f"{module_line}\n  #:use-module (guix packages)",
                1,
            )
        print(f"  Added module import for {PASS_ID}")

    # Add re-export section at the end of file
    resolved = summary["resolved_packages"]
    var_names = [sanitize_name(p["name"]) for p in resolved]

    reexport_section = f"\n;; {PASS_ID}\n"
    for var in var_names:
        reexport_section += f"(re-export {var})\n"

    content += reexport_section

    # Atomic write
    fd, tmp_path = tempfile.mkstemp(dir=str(COMPAT_FILE.parent), suffix=".scm.tmp")
    try:
        with os.fdopen(fd, "w") as f:
            f.write(content)
        shutil.move(tmp_path, COMPAT_FILE)
    except Exception:
        os.unlink(tmp_path)
        raise

    print(f"  Added {len(var_names)} re-exports to general-compat.scm")


def update_packages_scm(summary):
    """Add re-exports to packages.scm."""
    with open(PACKAGES_FILE, "r") as f:
        content = f.read()

    resolved = summary["resolved_packages"]
    var_names = [sanitize_name(p["name"]) for p in resolved]

    # Check if already has this pass
    if PASS_ID in content:
        print(f"  packages.scm already contains {PASS_ID}, skipping")
        return

    # Add module import if not present
    module_import = f"  #:use-module (gaurix packages {PASS_ID})"
    if module_import not in content:
        # Insert after the last deptree-resolver import
        insert_pattern = r"(  #:use-module \(gaurix packages deptree-resolver-260416d\))"
        if re.search(insert_pattern, content):
            content = re.sub(
                insert_pattern,
                f"\\1\n{module_import}",
                content,
            )
        else:
            # Fallback: insert before first (guix packages) line
            content = content.replace(
                "  #:use-module (guix packages)",
                f"{module_import}\n  #:use-module (guix packages)",
                1,
            )

    # Add re-exports at end
    reexport_section = f"\n;; {PASS_ID}\n"
    for var in var_names:
        reexport_section += f"(re-export {var})\n"

    content += reexport_section

    # Atomic write
    fd, tmp_path = tempfile.mkstemp(dir=str(PACKAGES_FILE.parent), suffix=".scm.tmp")
    try:
        with os.fdopen(fd, "w") as f:
            f.write(content)
        shutil.move(tmp_path, PACKAGES_FILE)
    except Exception:
        os.unlink(tmp_path)
        raise

    print(f"  Added {len(var_names)} re-exports to packages.scm")


def main():
    summary = load_summary()
    print(f"[{PASS_ID}] Updating files...")
    print(f"  Resolved: {summary['resolved']}, Blocked: {summary['blocked']}")

    update_todo(summary)
    update_general_compat(summary)
    update_packages_scm(summary)

    print(f"\n[{PASS_ID}] All updates complete.")


if __name__ == "__main__":
    main()
