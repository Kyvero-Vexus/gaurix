#!/usr/bin/env python3
"""Update general-compat.scm for deptree-resolver-260418ak.

Deterministic programmatic full-file transform: read, compute, write temp, atomic move.
"""

import shutil
import tempfile
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
COMPAT_FILE = ROOT / "guix" / "gaurix" / "packages" / "general-compat.scm"
PASS_ID = "deptree-resolver-260418ak"

IMPORT_LINE = f"  #:use-module (gaurix packages {PASS_ID})\n"
REEXPORT_NAMES = [
    "hyprland-workspaces-tui",
    "deadlock-api-ingest-git",
    "fiqhack-git",
    "container2wasm-git",
]

print(f"[{PASS_ID}] Updating general-compat.scm")

with open(COMPAT_FILE, "r") as f:
    content = f.read()
    lines = content.split("\n")

# Check if already present
if PASS_ID in content:
    print(f"  {PASS_ID} already present in general-compat.scm, skipping")
else:
    # 1. Add #:use-module line after the last deptree-resolver-260418 import
    new_lines = []
    inserted_import = False
    for i, line in enumerate(lines):
        new_lines.append(line)
        # Insert after last 260418ai line
        if not inserted_import and "deptree-resolver-260418ai)" in line:
            # Check if the next line is also a deptree-resolver-260418 line
            if i + 1 < len(lines) and "deptree-resolver-260418" in lines[i + 1]:
                continue  # wait for last one
            new_lines.append(IMPORT_LINE.rstrip())
            inserted_import = True

    if not inserted_import:
        # Fallback: insert after any last deptree-resolver-260418 line
        final_lines = []
        last_dt_idx = -1
        for i, line in enumerate(new_lines):
            if "deptree-resolver-260418" in line and "#:use-module" in line:
                last_dt_idx = i
        if last_dt_idx >= 0:
            new_lines.insert(last_dt_idx + 1, IMPORT_LINE.rstrip())
            inserted_import = True

    if inserted_import:
        print(f"  Added #:use-module import for {PASS_ID}")
    else:
        print(f"  WARNING: could not find insertion point for import")

    # 2. Add re-export block at end of file (before final closing)
    reexport_block = [
        f"",
        f";;; Re-exports from {PASS_ID}",
    ]
    for name in REEXPORT_NAMES:
        reexport_block.append(f";;; {name} — exported from {PASS_ID}")

    # Append before the end
    new_lines.extend(reexport_block)

    # Write atomically
    output = "\n".join(new_lines)
    with tempfile.NamedTemporaryFile(
        mode="w", dir=str(COMPAT_FILE.parent), suffix=".tmp", delete=False
    ) as tmp:
        tmp.write(output)
        tmp_path = tmp.name

    shutil.move(tmp_path, str(COMPAT_FILE))
    print(f"  Wrote {COMPAT_FILE}")

# Now update packages.scm
PACKAGES_FILE = ROOT / "guix" / "gaurix" / "packages.scm"
print(f"[{PASS_ID}] Updating packages.scm")

with open(PACKAGES_FILE, "r") as f:
    pkg_content = f.read()

if PASS_ID in pkg_content:
    print(f"  {PASS_ID} already present in packages.scm, skipping")
else:
    # Add comment about this pass near the top
    comment = f"            ;; {PASS_ID} (14 BLOCKED resolved: 4 recipes, 10 FAILED, BLOCKED pool fully drained)"

    # Find a good insertion point - after the last deptree-resolver comment
    pkg_lines = pkg_content.split("\n")
    insert_idx = -1
    for i, line in enumerate(pkg_lines):
        if "deptree-resolver-260418" in line:
            insert_idx = i

    if insert_idx >= 0:
        pkg_lines.insert(insert_idx + 1, comment)
        print(f"  Added comment for {PASS_ID}")
    else:
        # Fallback: add after first comment block
        for i, line in enumerate(pkg_lines):
            if line.strip().startswith(";;") and "resolver" in line:
                insert_idx = i
        if insert_idx >= 0:
            pkg_lines.insert(insert_idx + 1, comment)

    # Add the 4 resolved package exports
    # Find where exports are listed (after comments, in the export list)
    export_names = REEXPORT_NAMES

    # Find last export in list
    last_export_idx = -1
    for i, line in enumerate(pkg_lines):
        stripped = line.strip()
        if stripped and not stripped.startswith(";;") and not stripped.startswith("(") and not stripped.startswith("#"):
            # This might be an export name
            if any(c.isalpha() for c in stripped) and not stripped.startswith("*"):
                last_export_idx = i

    if last_export_idx >= 0:
        for name in export_names:
            pkg_lines.insert(last_export_idx + 1, f"            {name}")
            last_export_idx += 1
        print(f"  Added {len(export_names)} exports")

    output = "\n".join(pkg_lines)
    with tempfile.NamedTemporaryFile(
        mode="w", dir=str(PACKAGES_FILE.parent), suffix=".tmp", delete=False
    ) as tmp:
        tmp.write(output)
        tmp_path = tmp.name

    shutil.move(tmp_path, str(PACKAGES_FILE))
    print(f"  Wrote {PACKAGES_FILE}")
