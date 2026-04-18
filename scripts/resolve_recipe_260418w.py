#!/usr/bin/env python3
"""Update todo_general_packages.org for recipe-resolver-260418w.

Marks 19 packages as DONE (resolved with recipes) and 11 as BLOCKED
(NEEDS_RECIPE_DESIGN_EXHAUSTED).
"""

import os
import re
import tempfile
import shutil

TODO_FILE = "/home/slime/projects/gaurix/todo_general_packages.org"
BATCH_ID = "recipe-resolver-260418w"

# (package_name_in_file, version, build_system, license)
RESOLVED = [
    ("python-dashtable", "v1.4.5", "pyproject-build-system", "MIT"),
    ("python-certbot-pkcs12", "v0.3.1", "pyproject-build-system", "Apache-2.0"),
    ("python-spitch", "v1.49.0", "pyproject-build-system", "Apache-2.0"),
    ("python-invocation-tree", "v0.0.35", "pyproject-build-system", "BSD-2"),
    ("python-dukpy", "v0.5.1", "python-build-system", "MIT"),
    ("python-pyexcel-ezodf", "v0.3.4", "pyproject-build-system", "MIT"),
    ("wallman", "v1.5.2.8", "pyproject-build-system", "MIT"),
    ("ttf-piazzolla", "v2.005", "font-build-system", "OFL-1.1"),
    ("stardict-full-eng-rus", "v2.4.2", "copy-build-system", "GPL-2.0"),
    ("xdg-sound", "v1.0", "gnu-build-system", "GPL-2.0+"),
    ("alttab", "v1.7.1", "gnu-build-system", "GPL-3.0+"),
    ("gekkfetch-git", "v0.1", "gnu-build-system", "GPL-3.0+"),
    ("jellyfetch-git", "v0.1", "gnu-build-system", "MIT"),
    ("tombl-bin", "v0.2.3", "copy-build-system", "GPL-3.0+"),
    ("klog-time-tracker-bin", "v7.1", "copy-build-system", "MIT"),
    ("opkssh-bin", "v0.13.0", "copy-build-system", "Apache-2.0"),
    ("puma-dev-bin", "v0.18.3", "copy-build-system", "BSD-3"),
    ("rqlite-bin", "v9.4.5", "copy-build-system", "MIT"),
    ("wdisplays-persistent", "v1.1.1", "meson-build-system", "GPL-3.0+"),
]

# (package_name_in_file, exhaust_reason, short_description)
EXHAUSTED = [
    ("python-opcua-asyncio", "DEEP_DEPENDENCY_TREE",
     "OPC-UA library; 15+ missing Python deps not in Guix"),
    ("python-system_hotkey", "DEP_MISSING",
     "needs python-xcffib and python-xpybutil; X11-only; last updated 2021"),
    ("hyprcap", "DEP_MISSING",
     "needs hyprland ecosystem (grim, slurp, wf-recorder); hyprland not in Guix"),
    ("dict-ozhegov", "DEP_MISSING",
     "needs dictfmt (dictd) not in Guix; build script is Python 2"),
    ("niripwmenu", "DEP_MISSING",
     "needs python-confz, gtk4-layer-shell, Niri compositor; none in Guix"),
    ("brightness-controller-git", "ORPHANED_ABANDONED",
     "AUR orphaned; PyQt5 complex SIP build; upstream last commit 2023"),
    ("box", "GO_MODULE_DEPS",
     "Go CLI on Codeberg; no binary releases; module deps need packaging"),
    ("backlight-sync-git", "RUST_CARGO_DEPS",
     "Rust project; no tagged releases; ~15 crate deps including inotify, clap"),
    ("xcursor-openzone", "DEP_MISSING",
     "needs icon-slicer to build cursors from SVG; icon-slicer not in Guix"),
    ("krillinai-bin", "RAPIDLY_CHANGING",
     "renamed to KlicStudio; Go binary with AI service deps; releases may vanish"),
    ("profile-sync-daemon-git", "SYSTEMD_DEPENDENT",
     "shell scripts hardcoded for systemd; Guix uses Shepherd"),
]


def main():
    with open(TODO_FILE, "r") as f:
        lines = f.readlines()

    header_re = re.compile(
        r'^(\*\* )(FAILED|TODO|BLOCKED)( \d+\.\s+)(.+?)(\s+\[.*\])?(\s+:.*:)?\s*$'
    )

    updated_count = 0
    not_found = []

    # Process RESOLVED packages
    for pkg_name, version, build_system, license_str in RESOLVED:
        status_line = (
            f"   - Status: DONE: NEEDS_RECIPE_DESIGN resolved — "
            f"recipe in {BATCH_ID}.scm "
            f"({pkg_name} {version}, {build_system}, {license_str}) "
            f"({BATCH_ID})\n"
        )
        found = _update_entry(lines, header_re, pkg_name, "DONE", status_line)
        if found:
            updated_count += 1
        else:
            not_found.append(pkg_name)

    # Process EXHAUSTED packages
    for pkg_name, reason, description in EXHAUSTED:
        status_line = (
            f"   - Status: BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED: "
            f"{reason}: {description} ({BATCH_ID})\n"
        )
        found = _update_entry(lines, header_re, pkg_name, "BLOCKED", status_line)
        if found:
            updated_count += 1
        else:
            not_found.append(pkg_name)

    if not_found:
        print(f"WARNING: not found in todo file: {not_found}")

    # Atomic write
    fd, tmp_path = tempfile.mkstemp(
        dir=os.path.dirname(TODO_FILE), suffix=".tmp"
    )
    try:
        with os.fdopen(fd, "w") as f:
            f.writelines(lines)
        shutil.move(tmp_path, TODO_FILE)
    except Exception:
        os.unlink(tmp_path)
        raise

    print(f"Updated {updated_count} entries in {TODO_FILE}")
    if not_found:
        print(f"Not found: {not_found}")


def _update_entry(lines, header_re, pkg_name, new_keyword, status_line):
    """Find and update a package entry. Returns True if found."""
    indices = []
    for i, line in enumerate(lines):
        m = header_re.match(line.rstrip('\n'))
        if m:
            header_pkg = m.group(4).strip()
            # Remove trailing bracket content and tags for matching
            header_pkg = re.sub(r'\s+\[.*$', '', header_pkg)
            header_pkg = re.sub(r'\s+:.*$', '', header_pkg)
            if header_pkg == pkg_name:
                indices.append(i)

    if not indices:
        return False

    # Process from bottom to top so insertions don't shift later indices
    for idx in reversed(indices):
        # 1. Change header keyword to new_keyword
        line = lines[idx]
        new_line = re.sub(
            r'^(\*\* )(FAILED|TODO|BLOCKED)', f'\\1{new_keyword}', line
        )
        # Add tag if DONE
        if new_keyword == "DONE" and f":{BATCH_ID}:" not in new_line:
            tag = f"  :{BATCH_ID}:recipe-generated:"
            new_line = new_line.rstrip() + tag + "\n"
        lines[idx] = new_line

        # 2. Find end of entry and insert status line
        j = idx + 1
        while j < len(lines):
            if lines[j].startswith('** '):
                break
            j += 1
        # Walk backwards to skip blank lines
        insert_at = j
        while insert_at > idx + 1 and lines[insert_at - 1].strip() == '':
            insert_at -= 1
        lines.insert(insert_at, status_line)

    return True


if __name__ == "__main__":
    main()
