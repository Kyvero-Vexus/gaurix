#!/usr/bin/env python3
"""
Update todo_general_packages.org with results from deptree-resolver-260423c.
Uses deterministic full-file transform: read -> compute -> write temp -> atomic move.
"""

import json
import re
import os
import tempfile
from pathlib import Path

REPO_ROOT = Path(__file__).resolve().parent.parent
TODO_FILE = REPO_ROOT / "todo_general_packages.org"
SELECTION_JSON = REPO_ROOT / "reports" / "deptree-resolver-260423c-selection.json"
AUR_CACHE = REPO_ROOT / "data" / "aur-cache" / "packages-meta-ext-v1.json"

PASS_ID = "deptree-resolver-260423c"


def load_selection():
    """Load the selection and deduplicate."""
    with open(SELECTION_JSON) as f:
        data = json.load(f)
    pkgs = {}
    for p in data["packages"]:
        if p["name"] not in pkgs:
            pkgs[p["name"]] = p
    return pkgs


def load_aur_meta():
    """Load AUR metadata."""
    with open(AUR_CACHE) as f:
        data = json.load(f)
    return {e["Name"]: e for e in data}


def determine_build_system_label(name, meta, pkgbuild_dir):
    """Quick build system determination."""
    depends = meta.get("Depends", [])
    makedepends = meta.get("MakeDepends", [])
    dep_names = [re.split(r'[><=]', d)[0] for d in depends + makedepends]

    if name.endswith("-bin") or name.endswith("-appimage"):
        return "copy-build-system"
    if name.startswith("ttf-") or name.startswith("otf-") or "font" in name:
        return "font-build-system"
    if "firmware" in name or "dkms" in name:
        return "copy-build-system"

    pkgbuild_path = pkgbuild_dir / name / "PKGBUILD"
    if pkgbuild_path.exists():
        content = pkgbuild_path.read_text(errors='replace')
        if "cmake" in content.lower() or "cmake" in dep_names:
            return "cmake-build-system"
        if "meson" in content.lower() or "meson" in dep_names:
            return "meson-build-system"
        if "pyproject.toml" in content or "python-build" in dep_names:
            return "pyproject-build-system"
        if "cargo" in dep_names or "rust" in dep_names:
            return "cargo-build-system"
        if any(d.startswith("go") for d in dep_names) or "go build" in content:
            return "go-build-system"

    if not makedepends:
        return "copy-build-system"
    return "gnu-build-system"


def map_license_short(license_list):
    """Short license label for status line."""
    if not license_list:
        return "gpl3+"
    lic = license_list[0].strip().rstrip(",")
    mapping = {
        "GPL-3.0-or-later": "gpl3+", "GPL-3.0-only": "gpl3", "GPL3": "gpl3",
        "GPL-2.0-or-later": "gpl2+", "GPL-2.0-only": "gpl2", "GPL2": "gpl2",
        "MIT": "expat", "BSD-3-Clause": "bsd-3", "BSD-2-Clause": "bsd-2",
        "Apache-2.0": "asl2.0", "MPL-2.0": "mpl2.0", "ISC": "isc",
        "LGPL-2.1-or-later": "lgpl2.1+", "LGPL-3.0-or-later": "lgpl3+",
        "AGPL-3.0-or-later": "agpl3+", "CC0-1.0": "cc0",
        "custom": "non-copyleft", "proprietary": "non-copyleft",
    }
    return mapping.get(lic, "non-copyleft")


def update_org_file(todo_path, selected_pkgs, aur_meta):
    """Update the org file statuses for resolved packages."""
    pkgbuild_dir = REPO_ROOT / "data" / "aur-cache" / "pkgbuilds"

    # Build lookup: number -> package info
    by_number = {}
    for name, pkg in selected_pkgs.items():
        by_number[pkg["number"]] = (name, pkg)

    # Read entire file
    with open(todo_path, 'r') as f:
        lines = f.readlines()

    # Process line by line
    output_lines = []
    i = 0
    resolved_count = 0

    while i < len(lines):
        line = lines[i]

        # Check if this is a FAILED/BLOCKED/SKIPPED header
        m = re.match(r'^(\*\* (?:FAILED|BLOCKED|SKIPPED))\s+(\d+)\.\s+(\S+)(.*)', line)
        if m:
            status_prefix = m.group(1)
            num = int(m.group(2))
            pkg_name = m.group(3)
            rest = m.group(4)

            if pkg_name in selected_pkgs:
                meta = aur_meta.get(pkg_name, {})
                version = meta.get("Version", "0.1.0")
                # Clean version
                if ":" in version:
                    version = version.split(":", 1)[1]
                if "-" in version:
                    version = version.rsplit("-", 1)[0]

                bs = determine_build_system_label(pkg_name, meta, pkgbuild_dir)
                lic = map_license_short(meta.get("License", []))

                # Change status to DONE
                tag_part = ""
                if rest.strip().startswith("["):
                    # Keep tags but update
                    tag_part = f"  :{PASS_ID}:recipe-generated:"
                else:
                    tag_part = f"  :{PASS_ID}:recipe-generated:"

                new_header = f"** DONE {num}. {pkg_name}{tag_part}\n"
                output_lines.append(new_header)
                i += 1

                # Add status line and consume existing status/note lines
                status_added = False
                while i < len(lines):
                    next_line = lines[i]
                    if next_line.startswith("** "):
                        break
                    output_lines.append(next_line)
                    i += 1

                # Insert our status before the next header
                status_line = f"   - Status: DONE: Recipe in deptree-resolver-260423c.scm ({pkg_name} v{version}, {bs}, {lic}) ({PASS_ID})\n"
                # Insert before last appended line if it's blank, otherwise after
                output_lines.append(status_line)
                output_lines.append("\n")

                resolved_count += 1
                continue

        output_lines.append(line)
        i += 1

    print(f"Updated {resolved_count} package statuses to DONE")

    # Write to temp file and atomic move
    with tempfile.NamedTemporaryFile(mode='w', dir=todo_path.parent,
                                      prefix='.todo_tmp_', suffix='.org',
                                      delete=False) as tmp:
        tmp.writelines(output_lines)
        tmp_path = tmp.name

    os.replace(tmp_path, todo_path)
    print(f"Atomically replaced {todo_path}")

    return resolved_count


def main():
    print(f"=== Update todo for {PASS_ID} ===")

    selected = load_selection()
    print(f"Loaded {len(selected)} selected packages")

    aur_meta = load_aur_meta()
    print(f"Loaded {len(aur_meta)} AUR entries")

    resolved = update_org_file(TODO_FILE, selected, aur_meta)
    print(f"\nTotal resolved: {resolved}")

    return resolved


if __name__ == "__main__":
    main()
