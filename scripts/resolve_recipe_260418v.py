#!/usr/bin/env python3
"""Update todo_general_packages.org for recipe-resolver-260418v.

Marks 4 packages as DONE (resolved with recipes) and 26 as BLOCKED
(NEEDS_RECIPE_DESIGN_EXHAUSTED).
"""

import os
import re
import tempfile
import shutil

TODO_FILE = "/home/slime/projects/gaurix/todo_general_packages.org"
BATCH_ID = "recipe-resolver-260418v"

# (package_name_in_file, version, build_system, license)
RESOLVED = [
    ("woodland", "v2.1.0", "gnu-build-system", "GPL-2.0+"),
    ("minutor-git", "v2.21.0", "gnu-build-system/qmake", "BSD-2"),
    ("certomancer", "v0.14.0", "pyproject-build-system", "MIT"),
    ("mii_emu-git", "v1.97", "gnu-build-system", "MIT"),
]

# (package_name_in_file, exhaust_reason, short_description)
EXHAUSTED = [
    ("gamescope-session-git", "DEP_BLOCKED", "gamescope not in Guix; session scripts non-functional"),
    ("falcond", "ZIG_UNSUPPORTED", "Zig compiler not available in Guix"),
    ("kx-aspe-git", "RUST_CARGO_DEPS", "Rust CLI; ~40 transitive crate deps"),
    ("contextpilot-git", "RUST_CARGO_DEPS", "Rust CLI; ~50 transitive crate deps"),
    ("codanna", "RUST_CARGO_DEPS", "Rust tool; ~30 transitive crate deps"),
    ("streampager", "RUST_CARGO_DEPS", "Rust pager; ~40 transitive crate deps"),
    ("mbtiles", "RUST_CARGO_DEPS", "Rust + npm dual build; ~60 crate deps"),
    ("sqlite-dist", "RUST_CARGO_DEPS", "Rust alpha software; ~30 crate deps"),
    ("sequoia-octopus-librnp", "RUST_CARGO_DEPS", "Rust PGP lib; ~80 crate deps"),
    ("halloy-git", "RUST_CARGO_DEPS", "Rust IRC client; Iced GUI ~100 crate deps"),
    ("airshipper", "RUST_CARGO_DEPS", "Rust game launcher; ~80 crate deps"),
    ("twitter-media-downloader-git", "LICENSE_UNCLEAR", "no LICENSE file in repo; Go module deps"),
    ("nvm-fish", "ECOSYSTEM_MISMATCH", "nvm conflicts with Guix profile model"),
    ("remmina-plugin-teamviewer", "PROPRIETARY_DEP", "requires proprietary TeamViewer at runtime"),
    ("golden-cheetah-git", "EXTREME_DEPS", "12+ Qt6 modules including WebEngine"),
    ("hmcl-dev", "GRADLE_COMPLEX", "Gradle builds download deps at build time"),
    ("omniorbpy", "DEP_MISSING", "omniorb CORBA broker not in Guix"),
    ("ibus-lotus", "GO_MODULE_DEPS", "Go + CGO/GTK3; module deps need packaging"),
    ("terraform-local", "PYTHON_DEPS_MISSING", "needs python-localstack-client, python-hcl2"),
    ("galaxy-flasher", "RUNTIME_DEPS_MISSING", "needs odin4-cli, thor-flash-utility"),
    ("git-gl", "IMPRACTICAL_FORK", "GitLab Git fork; Guix already has git"),
    ("hypr-dock", "GO_MODULE_DEPS", "Go + GTK3 CGO; module deps need packaging"),
    ("diskm8", "GO_MODULE_DEPS", "Go tool; module deps need individual packaging"),
    ("gprofng-gui", "JAVA_BUILD_COMPLEX", "autotools + Java/Ant; classpath mgmt complex"),
    ("musique111-qt5", "GIT_SUBMODULES", "Qt5 app with 8 git submodules"),
    ("python-pjproject", "BUILD_INTEGRATION", "bindings built in pjproject tree; version mismatch"),
]


def main():
    with open(TODO_FILE, "r") as f:
        lines = f.readlines()

    header_re = re.compile(r'^(\*\* )(FAILED|TODO|BLOCKED)( \d+\.\s+)(.+?)(\s+\[.*\])?(\s+:.*:)?\s*$')

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
        new_line = re.sub(r'^(\*\* )(FAILED|TODO|BLOCKED)', f'\\1{new_keyword}', line)
        # Add tag if DONE
        if new_keyword == "DONE" and f":{BATCH_ID}:" not in new_line:
            # Add tags before newline
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
