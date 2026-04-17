#!/usr/bin/env python3
"""Update todo_general_packages.org statuses for recipe-resolver-260416j.

Deterministic programmatic update: read, compute, write temp, atomic move.
"""

import os
import re
import shutil
import tempfile

REPO = "/home/slime/projects/gaurix"
TODO_FILE = os.path.join(REPO, "todo_general_packages.org")
RESOLVER = "recipe-resolver-260416j"

# Mapping: (pkg_name_in_todo, line_number_of_header, recipe_description)
PACKAGES = [
    ("ent", 68067, "ent v1.0, Fourmilab entropy test, gnu-build-system, CC-BY-SA-4.0"),
    ("dadaengine", 67971, "dadaengine v1.03, text generator, gnu-build-system, BSD-3"),
    ("slibtool", 110177, "slibtool v0.7.4, libtool replacement, gnu-build-system, MIT"),
    ("rgxg", 110271, "rgxg v0.1.2, regex generator, gnu-build-system, zlib"),
    ("awesfx", 61394, "awesfx v0.5.2, ALSA SoundFont utils, gnu-build-system, GPL-2.0"),
    ("heapusage", 68031, "heapusage v2.33, heap profiler, cmake-build-system, BSD-3"),
    ("stackusage", 68037, "stackusage v1.20, stack profiler, cmake-build-system, BSD-3"),
    ("ntfs2btrfs", 67293, "ntfs2btrfs v20250616, NTFS to btrfs, cmake-build-system, GPL-2.0"),
    ("libmaddy", 66861, "libmaddy v1.6.0, C++ markdown parser, cmake-build-system, MIT"),
    ("libbsc", 65939, "libbsc v3.3.12, block-sorting compressor, cmake-build-system, Apache-2.0"),
    ("tagutil", 63252, "tagutil v3.1, audio tag editor, cmake-build-system, BSD-2"),
    ("ltris2", 61212, "ltris2 v2.0.4, Tetris clone SDL2, gnu-build-system, GPL-3.0+"),
    ("simsimd", 65918, "simsimd v6.5.16, SIMD distance functions, cmake-build-system, Apache-2.0"),
    ("docformatter", 67905, "docformatter v1.7.7, Python docstring formatter, pyproject-build-system, MIT"),
    ("cfv", 67496, "cfv v3.2.0, checksum verifier, pyproject-build-system, GPL-2.0+"),
    ("bmaptool", 63288, "bmaptool v3.9.0, block map copy tool, pyproject-build-system, GPL-2.0"),
    ("pyglossary", 62922, "pyglossary v5.3.0, dictionary converter, pyproject-build-system, GPL-3.0"),
    ("python-shandy-sqlfmt", 63337, "python-shandy-sqlfmt v0.29.0, SQL formatter, pyproject-build-system, Apache-2.0"),
    ("perl-compress-raw-lzma", 66847, "perl-compress-raw-lzma v2.221, Perl LZMA interface, perl-build-system, Artistic/GPL"),
    ("git-store-meta", 63462, "git-store-meta v2.3.7, git metadata tool, copy-build-system, MIT"),
    ("duply", 67155, "duply v2.5.6, duplicity frontend, copy-build-system, GPL-2.0"),
    ("mint-l-theme", 66839, "mint-l-theme v2.0.6, Linux Mint GTK theme, copy-build-system, GPL-3.0+"),
    ("sound-theme-simple", 61300, "sound-theme-simple v1.0, freedesktop sound theme, copy-build-system, CC-BY-SA-4.0"),
    ("pipes-rs-bin", 61290, "pipes-rs-bin v1.6.4, Rust pipes screensaver binary, copy-build-system, BlueOak-1.0"),
    ("prboom-plus", 67148, "prboom-plus v2.6.66, Doom source port, cmake-build-system, GPL-2.0+"),
    ("gearboy", 110184, "gearboy v3.8.2, Game Boy emulator, gnu-build-system, GPL-3.0"),
    ("somafm_tui", 63391, "somafm-tui v0.6.12, SomaFM radio TUI, pyproject-build-system, MIT"),
    ("gmusicbrowser", 110403, "gmusicbrowser v1.1.16, Perl jukebox, gnu-build-system, GPL-3.0"),
    ("python-textual-textarea", 63343, "python-textual-textarea v0.17.2, Textual textarea widget, pyproject-build-system, MIT"),
    ("breeze-enhanced", 63331, "breeze-enhanced v6.4, KDE Breeze decoration, cmake-build-system, GPL-3.0"),
]


def update_todo():
    with open(TODO_FILE, "r") as f:
        lines = f.readlines()

    # Sort packages by line number in DESCENDING order to avoid index shifts
    sorted_packages = sorted(PACKAGES, key=lambda x: x[1], reverse=True)

    for pkg_name, header_line, desc in sorted_packages:
        idx = header_line - 1  # Convert to 0-based index
        if idx >= len(lines):
            print(f"WARNING: {pkg_name} line {header_line} out of range")
            continue

        # Verify the header line contains the package name
        # Use flexible matching: the name might have dots/numbers around it
        if pkg_name not in lines[idx]:
            # Try searching nearby lines
            found = False
            for offset in range(-5, 6):
                check_idx = idx + offset
                if 0 <= check_idx < len(lines) and pkg_name in lines[check_idx] and lines[check_idx].startswith("**"):
                    idx = check_idx
                    found = True
                    break
            if not found:
                print(f"WARNING: {pkg_name} not found near line {header_line}")
                continue

        # Update header status from FAILED/TODO/BLOCKED to DONE
        header = lines[idx]
        header = re.sub(r"^\*\* (FAILED|TODO|BLOCKED)", "** DONE", header)
        lines[idx] = header

        # Find the TODO Status line and update it
        for j in range(idx + 1, min(idx + 8, len(lines))):
            if lines[j].strip().startswith("- TODO Status:"):
                lines[j] = "   - TODO Status: DONE\n"
                break

        # Add new status line after existing status lines
        insert_idx = idx + 1
        for j in range(idx + 1, min(idx + 10, len(lines))):
            if lines[j].startswith("**"):
                break
            insert_idx = j + 1

        new_status = (
            f"   - Status: DONE: NEEDS_RECIPE_DESIGN resolved — "
            f"recipe in {RESOLVER}.scm ({desc}) ({RESOLVER})\n"
        )
        lines.insert(insert_idx, new_status)

    # Write atomically
    dirname = os.path.dirname(TODO_FILE)
    fd, tmp = tempfile.mkstemp(dir=dirname, suffix=".tmp")
    try:
        with os.fdopen(fd, "w") as f:
            f.writelines(lines)
        shutil.move(tmp, TODO_FILE)
    except Exception:
        os.unlink(tmp)
        raise

    print(f"Updated {len(PACKAGES)} packages in {TODO_FILE}")


if __name__ == "__main__":
    update_todo()
