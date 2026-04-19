#!/usr/bin/env python3
"""Bookkeeping update for deptree-resolver-260419e.

Updates:
1) todo_general_packages.org - change 8 BLOCKED -> DONE, update 1 BLOCKED reason
2) packages.scm - add deptree-resolver-260419e exports
3) general-compat.scm - add #:use-module for new module
"""

import re
import shutil
import tempfile
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
TODO_FILE = ROOT / "todo_general_packages.org"
PACKAGES_SCM = ROOT / "guix" / "gaurix" / "packages.scm"
GENERAL_COMPAT = ROOT / "guix" / "gaurix" / "packages" / "general-compat.scm"
PASS_ID = "deptree-resolver-260419e"

# 8 resolved packages -> DONE
RESOLVED = {
    16956: ("noto-fonts-cjk-glyph-conf", "DONE: Recipe in deptree-resolver-260419e.scm (noto-fonts-cjk-glyph-conf v1.0, fontconfig config, copy-build-system)"),
    16957: ("noto-fonts-cjk-locale-conf", "DONE: Recipe in deptree-resolver-260419e.scm (noto-fonts-cjk-locale-conf v1.0, fontconfig config, copy-build-system)"),
    16978: ("ibc", "DONE: Recipe in deptree-resolver-260419e.scm (ibc v3.22.0, IB Controller, copy-build-system, license:gpl3)"),
    16980: ("universal-gcode-sender", "DONE: Recipe in deptree-resolver-260419e.scm (universal-gcode-sender v2.1.17, prebuilt JAR, copy-build-system, license:gpl3)"),
    16983: ("apple-mac-plymouth-git", "DONE: Recipe in deptree-resolver-260419e.scm (apple-mac-plymouth-git, Plymouth theme, copy-build-system, license:gpl3)"),
    17010: ("youdao-dict", "DONE: Recipe in deptree-resolver-260419e.scm (youdao-dict v6.0.0, prebuilt .deb binary, copy-build-system, proprietary)"),
    17052: ("icu70", "DONE: Recipe in deptree-resolver-260419e.scm (icu70 v70.1, ICU compat version, gnu-build-system, license:x11)"),
    17094: ("oracle-instantclient-sqlplus", "DONE: Recipe in deptree-resolver-260419e.scm (oracle-instantclient-sqlplus v23.7.0.25.01 + oracle-instantclient-basic dep, copy-build-system, OTN license)"),
}

# 1 still blocked
STILL_BLOCKED = {
    17007: ("simple-live-app", "BLOCKED: FLUTTER_SDK_REQUIRED: Flutter/Dart SDK not in Guix; no prebuilt binaries published upstream; CI artifacts not downloadable (deptree-resolver-260419e, 3 approaches exhausted)"),
}


def update_todo():
    """Update todo_general_packages.org: change BLOCKED -> DONE for resolved, update BLOCKED reason."""
    lines = TODO_FILE.read_text().splitlines(keepends=True)
    new_lines = []

    for line in lines:
        modified = False

        # Check resolved packages
        for num, (name, status_msg) in RESOLVED.items():
            pattern = rf"^\*\*\s+BLOCKED\s+{num}\.\s+{re.escape(name)}"
            if re.match(pattern, line):
                # Replace BLOCKED with DONE, add pass tag
                new_heading = re.sub(
                    rf"^\*\*\s+BLOCKED\s+({num}\.\s+{re.escape(name)})",
                    rf"** DONE \1 :{PASS_ID}:",
                    line.rstrip()
                )
                new_lines.append(new_heading + "\n")
                new_lines.append(f"   - Status: {status_msg} ({PASS_ID})\n")
                modified = True
                break

        if not modified:
            # Check still-blocked packages
            for num, (name, status_msg) in STILL_BLOCKED.items():
                pattern = rf"^\*\*\s+BLOCKED\s+{num}\.\s+{re.escape(name)}"
                if re.match(pattern, line):
                    new_heading = re.sub(
                        rf"^\*\*\s+BLOCKED\s+({num}\.\s+{re.escape(name)})",
                        rf"** BLOCKED \1 :{PASS_ID}:",
                        line.rstrip()
                    )
                    new_lines.append(new_heading + "\n")
                    new_lines.append(f"   - Status: {status_msg}\n")
                    modified = True
                    break

        if not modified:
            new_lines.append(line)

    # Atomic write
    fd, tmp = tempfile.mkstemp(dir=TODO_FILE.parent, suffix=".org")
    with open(fd, "w") as f:
        f.writelines(new_lines)
    shutil.move(tmp, TODO_FILE)
    print(f"  Updated {TODO_FILE}")


def update_packages_scm():
    """Add exports and comment to packages.scm."""
    content = PACKAGES_SCM.read_text()

    # Add pass comment after last pass comment
    new_comment = f"            ;; {PASS_ID} (8 BLOCKED resolved: 9 recipes incl. oracle-instantclient-basic dep; 1 BLOCKED remains)"

    # Find the last pass comment line to insert after
    lines = content.split("\n")
    insert_idx = None
    for i, line in enumerate(lines):
        if line.strip().startswith(";; deptree-resolver-") or line.strip().startswith(";; recipe-resolver-"):
            insert_idx = i

    if insert_idx is not None:
        lines.insert(insert_idx + 1, new_comment)

    # Add new exports - find the last export and add after it
    # Find the closing paren of exports list - look for pattern where exports end
    # The exports are individual names on separate lines before the closing )
    # Find where the exports end (before the closing paren of define-module)
    export_names = [
        "oracle-instantclient-basic",
        "oracle-instantclient-sqlplus",
        "apple-mac-plymouth-git",
        "noto-fonts-cjk-glyph-conf",
        "noto-fonts-cjk-locale-conf",
        "universal-gcode-sender",
        "icu70",
        "ibc",
        "youdao-dict",
    ]

    # Find last export line (a line with just a symbol name and possibly whitespace)
    last_export_idx = None
    for i, line in enumerate(lines):
        stripped = line.strip()
        if stripped and not stripped.startswith(";") and not stripped.startswith("(") and not stripped.startswith("#"):
            # Could be an export name
            if re.match(r"^[\w-]+\)?$", stripped):
                # Check if it's in the exports section (before the module body)
                if i < len(lines) - 1:
                    last_export_idx = i

    if last_export_idx is not None:
        # Check if the line ends with ) - that's the closing of define-module
        last_line = lines[last_export_idx].rstrip()
        if last_line.endswith(")"):
            # Remove the closing paren, add new exports, then close
            lines[last_export_idx] = last_line[:-1]
            insert_pos = last_export_idx + 1
            for ename in export_names:
                lines.insert(insert_pos, f"            {ename}")
                insert_pos += 1
            lines.insert(insert_pos, ")")

    new_content = "\n".join(lines)

    # Atomic write
    fd, tmp = tempfile.mkstemp(dir=PACKAGES_SCM.parent, suffix=".scm")
    with open(fd, "w") as f:
        f.write(new_content)
    shutil.move(tmp, PACKAGES_SCM)
    print(f"  Updated {PACKAGES_SCM}")


def update_general_compat():
    """Add #:use-module for new module to general-compat.scm."""
    content = GENERAL_COMPAT.read_text()

    new_use_module = f"  #:use-module (gaurix packages {PASS_ID})"

    # Find the last #:use-module line to insert after
    lines = content.split("\n")
    last_use_module_idx = None
    for i, line in enumerate(lines):
        if "#:use-module" in line:
            last_use_module_idx = i

    if last_use_module_idx is not None:
        lines.insert(last_use_module_idx + 1, new_use_module)

    new_content = "\n".join(lines)

    # Atomic write
    fd, tmp = tempfile.mkstemp(dir=GENERAL_COMPAT.parent, suffix=".scm")
    with open(fd, "w") as f:
        f.write(new_content)
    shutil.move(tmp, GENERAL_COMPAT)
    print(f"  Updated {GENERAL_COMPAT}")


def main():
    print(f"[{PASS_ID}] Updating bookkeeping...")
    update_todo()
    update_packages_scm()
    update_general_compat()
    print(f"[{PASS_ID}] Bookkeeping complete.")


if __name__ == "__main__":
    main()
