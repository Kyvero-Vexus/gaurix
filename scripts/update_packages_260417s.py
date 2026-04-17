#!/usr/bin/env python3
"""Deterministic programmatic transform for general-compat.scm and packages.scm.
Adds recipe-resolver-260417s module import and re-exports."""

import os
import sys
import tempfile
import shutil

REPO = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
GENERAL_COMPAT = os.path.join(REPO, "guix", "gaurix", "packages", "general-compat.scm")
PACKAGES_SCM = os.path.join(REPO, "guix", "gaurix", "packages.scm")

NEW_MODULE = "recipe-resolver-260417s"
NEW_EXPORTS = [
    "stack-bin",
    "kapp",
    "ymp-bin",
    "ttypr-bin",
    "keifu-bin",
    "dredge-bin",
    "canvas-downloader-bin",
    "repeater-bin",
    "rip-go-bin",
    "dynocsv",
    "mpwall",
    "ov",
    "asciinema-agg",
    "seanime",
    "subsurface-appimage",
    "git-mr",
    "arkenfox-user-js",
    "byedpi",
    "bsdiff",
    "yash",
    "activate-linux",
    "pyupgrade",
    "python-pythondialog",
    "python-sysv-ipc",
    "ttf-b612",
    "mint-y-icons",
    "mint-x-icons",
    "prometheus-apcupsd-exporter",
    "smooth",
    "corrscope",
]


def update_general_compat():
    """Add #:use-module and (re-export ...) entries to general-compat.scm."""
    with open(GENERAL_COMPAT, "r") as f:
        content = f.read()
    lines = content.split("\n")

    # 1. Add #:use-module line after the last recipe-resolver import
    import_line = f"  #:use-module (gaurix packages {NEW_MODULE})"
    # Find insertion point: after the last recipe-resolver or deptree-resolver import
    last_resolver_idx = -1
    for i, line in enumerate(lines):
        if "#:use-module (gaurix packages recipe-resolver-260417r)" in line:
            last_resolver_idx = i
            break
    if last_resolver_idx == -1:
        # Fallback: find last recipe-resolver line
        for i, line in enumerate(lines):
            if "#:use-module (gaurix packages recipe-resolver-" in line:
                last_resolver_idx = i
    if last_resolver_idx == -1:
        print("ERROR: Could not find recipe-resolver import in general-compat.scm")
        sys.exit(1)

    # Check if already present
    if f"(gaurix packages {NEW_MODULE})" in content:
        print(f"  Module {NEW_MODULE} already imported in general-compat.scm")
    else:
        lines.insert(last_resolver_idx + 1, import_line)
        print(f"  Inserted #:use-module for {NEW_MODULE} at line {last_resolver_idx + 2}")

    # 2. Add (re-export ...) lines at the end of the file
    # Find the last re-export line
    last_reexport_idx = -1
    for i in range(len(lines) - 1, -1, -1):
        if lines[i].strip().startswith("(re-export "):
            last_reexport_idx = i
            break

    if last_reexport_idx == -1:
        print("ERROR: Could not find (re-export ...) in general-compat.scm")
        sys.exit(1)

    # Check which exports already exist
    existing_exports = set()
    for line in lines:
        stripped = line.strip()
        if stripped.startswith("(re-export "):
            name = stripped.replace("(re-export ", "").replace(")", "").strip()
            existing_exports.add(name)

    # Build new re-export lines
    new_reexport_lines = []
    new_reexport_lines.append(f"; {NEW_MODULE}")
    for name in NEW_EXPORTS:
        if name not in existing_exports:
            new_reexport_lines.append(f"(re-export {name})")
        else:
            print(f"  Skipping already-exported: {name}")

    # Insert after last re-export
    for i, line in enumerate(new_reexport_lines):
        lines.insert(last_reexport_idx + 1 + i, line)

    # Write atomically
    content = "\n".join(lines)
    fd, tmp_path = tempfile.mkstemp(dir=os.path.dirname(GENERAL_COMPAT))
    try:
        with os.fdopen(fd, "w") as f:
            f.write(content)
        shutil.move(tmp_path, GENERAL_COMPAT)
        print(f"  Updated general-compat.scm ({len(new_reexport_lines) - 1} re-exports added)")
    except:
        os.unlink(tmp_path)
        raise


def update_packages_scm():
    """Add package identifiers to packages.scm exports."""
    with open(PACKAGES_SCM, "r") as f:
        content = f.read()
    lines = content.split("\n")

    # Find the last non-empty content line (before trailing whitespace)
    last_content_idx = len(lines) - 1
    while last_content_idx > 0 and lines[last_content_idx].strip() == "":
        last_content_idx -= 1

    # Check which exports already exist
    existing_names = set()
    for line in lines:
        stripped = line.strip()
        if stripped and not stripped.startswith(";") and not stripped.startswith("("):
            existing_names.add(stripped)

    # Add new exports
    new_lines = [f"; {NEW_MODULE}"]
    added = 0
    for name in NEW_EXPORTS:
        if name not in existing_names:
            new_lines.append(f"            {name}")
            added += 1
        else:
            print(f"  Skipping already in packages.scm: {name}")

    # Find position: before the closing paren of the export list, or at end
    # Insert after last content line
    for line in new_lines:
        last_content_idx += 1
        lines.insert(last_content_idx, line)

    # Write atomically
    content = "\n".join(lines)
    fd, tmp_path = tempfile.mkstemp(dir=os.path.dirname(PACKAGES_SCM))
    try:
        with os.fdopen(fd, "w") as f:
            f.write(content)
        shutil.move(tmp_path, PACKAGES_SCM)
        print(f"  Updated packages.scm ({added} exports added)")
    except:
        os.unlink(tmp_path)
        raise


if __name__ == "__main__":
    print("Updating general-compat.scm...")
    update_general_compat()
    print()
    print("Updating packages.scm...")
    update_packages_scm()
    print()
    print("Done.")
