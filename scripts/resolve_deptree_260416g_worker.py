#!/usr/bin/env python3
"""Worker for deptree-resolver-260416g: updates todo, packages.scm, general-compat.scm.

Resolved packages (6 unique, covering 10 entries):
  sonic-x11-session (#492, #11535)
  sonic-desktop-interface (#2076)
  sonicde-meta (#11450)
  pyside2 (#2396, #11599)
  pyside2-tools (#2397, #11600)
  python-shiboken2 (#2398, #11602)

Remaining BLOCKED (3 unique, 3 entries):
  sh-elf-newlib (#7617) - CROSS_COMPILE_UNSUPPORTED
  sh-elf-gcc (#7648) - CROSS_COMPILE_UNSUPPORTED
  raidrivecli (#14202) - MISSING_SOURCE + PROPRIETARY
"""

import json
import re
import shutil
import tempfile
from datetime import datetime, timezone
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
TODO_FILE = ROOT / "todo_general_packages.org"
PACKAGES_SCM = ROOT / "guix" / "gaurix" / "packages.scm"
COMPAT_SCM = ROOT / "guix" / "gaurix" / "packages" / "general-compat.scm"
PASS_ID = "deptree-resolver-260416g"

# Packages resolved with recipes
RESOLVED = {
    492: ("sonic-x11-session", "cmake recipe from sonic-workspace repo (AUR repo empty, using metadata URL)"),
    2076: ("sonic-desktop-interface", "cmake recipe from GitHub source v6.6.4.1"),
    11450: ("sonicde-meta", "trivial meta package recipe"),
    2396: ("pyside2", "cmake recipe from Qt for Python source v5.15.16"),
    2397: ("pyside2-tools", "cmake recipe from Qt for Python source v5.15.16"),
    2398: ("python-shiboken2", "cmake recipe from Qt for Python source v5.15.16"),
    11535: ("sonic-x11-session", "cmake recipe from sonic-workspace repo (AUR repo empty, using metadata URL)"),
    11599: ("pyside2", "cmake recipe from Qt for Python source v5.15.16"),
    11600: ("pyside2-tools", "cmake recipe from Qt for Python source v5.15.16"),
    11602: ("python-shiboken2", "cmake recipe from Qt for Python source v5.15.16"),
}

# Packages remaining blocked with updated notes
STILL_BLOCKED = {
    7617: ("sh-elf-newlib", "CROSS_COMPILE_UNSUPPORTED: SuperH embedded newlib; circular bootstrap with sh-elf-gcc; niche embedded target; recommend Guix native cross-compilation"),
    7648: ("sh-elf-gcc", "CROSS_COMPILE_UNSUPPORTED: GCC cross-compiler for SuperH; circular bootstrap with sh-elf-newlib; niche embedded target; recommend Guix native cross-compilation"),
    14202: ("raidrivecli", "MISSING_SOURCE + PROPRIETARY: not in AUR cache, proprietary CLI, not freely redistributable"),
}

# Guix symbol names for exports
EXPORT_SYMBOLS = [
    "sonic-x11-session",
    "sonic-desktop-interface",
    "sonicde-meta",
    "shiboken2",
    "python-shiboken2",
    "pyside2",
    "pyside2-tools",
]


def update_todo():
    """Update todo_general_packages.org entries."""
    print(f"[{PASS_ID}] Updating todo_general_packages.org...")

    with open(TODO_FILE, "r") as f:
        lines = f.readlines()

    output = []
    i = 0
    resolved_count = 0
    blocked_updated = 0

    while i < len(lines):
        line = lines[i]

        # Check for BLOCKED header
        m = re.match(r"^(\*\*\s+)BLOCKED(\s+)(\d+)\.\s+(\S+)(.*)", line)
        if m:
            prefix = m.group(1)
            space = m.group(2)
            number = int(m.group(3))
            name = m.group(4)
            rest = m.group(5)

            if number in RESOLVED:
                pkg_name, detail = RESOLVED[number]
                # Change header to DONE
                new_header = f"{prefix}DONE{space}{number}. {name} [RESOLVED: {PASS_ID}]{rest}\n"
                output.append(new_header)
                # Add status line
                output.append(f"   - Status: DONE: recipe in {PASS_ID}.scm ({pkg_name}, RECIPE: {detail})\n")
                resolved_count += 1
                i += 1
                continue

            elif number in STILL_BLOCKED:
                pkg_name, detail = STILL_BLOCKED[number]
                # Keep BLOCKED header, add updated note
                output.append(line)
                output.append(f"   - Status: BLOCKED: {detail} ({PASS_ID})\n")
                blocked_updated += 1
                i += 1
                continue

        output.append(line)
        i += 1

    # Atomic write
    with tempfile.NamedTemporaryFile(mode="w", dir=TODO_FILE.parent,
                                     suffix=".tmp", delete=False) as tmp:
        tmp.writelines(output)
        tmp_path = Path(tmp.name)
    shutil.move(str(tmp_path), str(TODO_FILE))

    print(f"  Resolved {resolved_count} entries, updated {blocked_updated} blocked entries")


def update_packages_scm():
    """Add new package symbols to packages.scm using deterministic transform."""
    print(f"[{PASS_ID}] Updating packages.scm...")

    with open(PACKAGES_SCM, "r") as f:
        content = f.read()

    # Find existing exports and add new ones
    existing_symbols = set(re.findall(r'\b([\w-]+)\b', content))
    new_symbols = [s for s in EXPORT_SYMBOLS if s not in existing_symbols]

    if not new_symbols:
        print("  No new symbols to add to packages.scm")
        return

    # Find the last line before the closing paren of the module definition
    lines = content.split("\n")

    # Find insertion point: after the last package name line
    insert_idx = None
    for idx, line in enumerate(lines):
        stripped = line.strip()
        if stripped and not stripped.startswith(";") and not stripped.startswith("("):
            # Looks like a package name
            insert_idx = idx

    if insert_idx is None:
        insert_idx = len(lines) - 1

    # Add new symbols
    comment = f"  ;; {PASS_ID} exports"
    new_lines = [comment] + [f"  {s}" for s in new_symbols]
    lines = lines[:insert_idx + 1] + new_lines + lines[insert_idx + 1:]

    with tempfile.NamedTemporaryFile(mode="w", dir=PACKAGES_SCM.parent,
                                     suffix=".tmp", delete=False) as tmp:
        tmp.write("\n".join(lines))
        tmp_path = Path(tmp.name)
    shutil.move(str(tmp_path), str(PACKAGES_SCM))

    print(f"  Added {len(new_symbols)} symbols: {', '.join(new_symbols)}")


def update_general_compat():
    """Add module import and re-exports to general-compat.scm."""
    print(f"[{PASS_ID}] Updating general-compat.scm...")

    with open(COMPAT_SCM, "r") as f:
        content = f.read()

    # Check if already added
    if PASS_ID in content:
        print(f"  {PASS_ID} already present in general-compat.scm")
        return

    lines = content.split("\n")
    new_lines = []

    # Find where to insert the #:use-module line
    # Insert after the last #:use-module line in the module declaration
    last_use_module_idx = None
    for idx, line in enumerate(lines):
        if "#:use-module" in line:
            last_use_module_idx = idx

    if last_use_module_idx is None:
        print("  ERROR: Could not find #:use-module in general-compat.scm")
        return

    # Insert the new module import
    module_line = f"  #:use-module (gaurix packages {PASS_ID})"
    for idx, line in enumerate(lines):
        new_lines.append(line)
        if idx == last_use_module_idx:
            new_lines.append(module_line)

    # Add re-exports at the end
    re_exports = [f"(re-export {s})" for s in EXPORT_SYMBOLS]
    # Remove trailing empty lines then add re-exports
    while new_lines and new_lines[-1].strip() == "":
        new_lines.pop()
    new_lines.extend(re_exports)
    new_lines.append("")  # trailing newline

    with tempfile.NamedTemporaryFile(mode="w", dir=COMPAT_SCM.parent,
                                     suffix=".tmp", delete=False) as tmp:
        tmp.write("\n".join(new_lines))
        tmp_path = Path(tmp.name)
    shutil.move(str(tmp_path), str(COMPAT_SCM))

    print(f"  Added module import and {len(re_exports)} re-exports")


def write_summary():
    """Write summary report."""
    timestamp = datetime.now(timezone.utc).isoformat().replace("+00:00", "Z")
    summary = {
        "pass_id": PASS_ID,
        "timestamp": timestamp,
        "total_blocked_before": 13,
        "total_blocked_unique": 9,
        "resolved": [
            {"number": num, "name": name, "detail": detail}
            for num, (name, detail) in sorted(RESOLVED.items())
        ],
        "still_blocked": [
            {"number": num, "name": name, "reason": reason}
            for num, (name, reason) in sorted(STILL_BLOCKED.items())
        ],
        "resolved_count": len(set(name for name, _ in RESOLVED.values())),
        "still_blocked_count": len(STILL_BLOCKED),
        "new_packages": EXPORT_SYMBOLS,
    }

    summary_path = ROOT / "reports" / f"{PASS_ID}-summary.json"
    with open(summary_path, "w") as f:
        json.dump(summary, f, indent=2)
    print(f"  Wrote {summary_path}")

    return summary


def main():
    print(f"\n{'=' * 60}")
    print(f"  {PASS_ID} Worker")
    print(f"{'=' * 60}\n")

    update_todo()
    update_packages_scm()
    update_general_compat()
    summary = write_summary()

    print(f"\n{'=' * 60}")
    print(f"  Summary")
    print(f"{'=' * 60}")
    print(f"  Resolved: {summary['resolved_count']} unique packages ({len(RESOLVED)} entries)")
    print(f"  Still blocked: {summary['still_blocked_count']} packages")
    print(f"  New Guix packages: {', '.join(EXPORT_SYMBOLS)}")
    print(f"{'=' * 60}\n")


if __name__ == "__main__":
    main()
