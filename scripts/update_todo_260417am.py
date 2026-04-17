#!/usr/bin/env python3
"""Update todo_general_packages.org for recipe-resolver-260417am pass.

Deterministic: read → compute → write temp → atomic move.
"""

import os
import re
import tempfile

TODO_FILE = "todo_general_packages.org"
RESOLVER_ID = "recipe-resolver-260417am"

# Resolved packages: (pkg_number, pkg_name, guix_name, details)
RESOLVED = [
    (8624, "moor-bin", "moor-bin",
     "copy-build-system, v2.12.1, BSD-2; pre-built Go binary pager"),
    (8605, "steamguard-cli-bin", "steamguard-cli-bin",
     "copy-build-system, v0.17.1, GPL-3.0+; pre-built Rust binary for Steam 2FA"),
    (8603, "vopono-bin", "vopono-bin",
     "copy-build-system, v0.10.15, GPL-3.0+; pre-built Rust binary VPN namespace manager"),
    (8310, "youtubedr-bin", "youtubedr-bin",
     "copy-build-system, v2.10.6, MIT; pre-built Go binary YouTube downloader"),
    (8273, "pingme-bin", "pingme-bin",
     "copy-build-system, v0.2.7, MIT; pre-built Go binary multi-platform notifier"),
    (8270, "overmind-bin", "overmind-bin",
     "copy-build-system, v2.5.1, MIT; pre-built Go binary Procfile process manager"),
    (8264, "sqly-bin", "sqly-bin",
     "copy-build-system, v0.15.0, Apache-2.0; pre-built Go binary SQL-on-CSV/JSON"),
    (8554, "reddix-bin", "reddix-bin",
     "copy-build-system, v0.2.9, MIT; pre-built Rust binary terminal Reddit client"),
    (7343, "gowall-bin", "gowall-bin",
     "copy-build-system, v0.2.4, MIT; pre-built Go binary wallpaper color converter"),
    (7366, "tuicr-bin", "tuicr-bin",
     "copy-build-system, v0.10.0, MIT; pre-built Rust binary TUI code review tool"),
    (8260, "rres-bin", "rres-bin",
     "copy-build-system, v0.1.5, GPL-3.0; pre-built Rust binary xrandr replacement"),
    (8300, "folderhost-bin", "folderhost-bin",
     "copy-build-system, v26.4.0, GPL-3.0; pre-built Go binary private cloud file server"),
    (7548, "tetrigo-bin", "tetrigo-bin",
     "copy-build-system, v0.2.0, GPL-3.0; pre-built Go binary terminal Tetris"),
    (8279, "tenere-bin", "tenere-bin",
     "copy-build-system, v0.11.3, GPL-3.0; pre-built Rust binary TUI for LLMs"),
    (8528, "taskell-bin", "taskell-bin",
     "copy-build-system, v1.11.4, BSD-3; pre-built Haskell binary Kanban board"),
    (8586, "gzdoom-bin", "gzdoom-bin",
     "copy-build-system, v4.14.2, GPL-3.0; extracted from .deb, Doom engine port"),
    (8045, "vkd3d-proton-bin", "vkd3d-proton-bin",
     "copy-build-system, v3.0b, LGPL-2.1; Direct3D 12 to Vulkan DLLs for Wine/Proton"),
    (8567, "crossdirstat-bin", "crossdirstat-bin",
     "copy-build-system, v2.6.0, MIT; pre-built Electron file statistics viewer"),
    (7429, "ttf-ioskeley-mono-unhinted", "font-ioskeley-mono-unhinted",
     "font-build-system, v2.0.0-beta.1, OFL-1.1; Iosevka config mimicking Berkeley Mono"),
    (6137, "chhsich-nerd-font", "font-chhsich-nerd",
     "font-build-system, v1.0.0, OFL-1.1; CJK Nerd Font with ComicShannsMono + Maple Mono"),
    (5434, "python-pysmart", "python-pysmart",
     "pyproject-build-system, v1.4.2, LGPL-2.1+; Python wrapper for smartctl"),
    (4848, "upliftpowerplay", "python-upp",
     "pyproject-build-system, v0.2.4, GPL-3.0; AMD GPU PowerPlay table editor"),
    (4839, "perl-data-password-zxcvbn", "perl-data-password-zxcvbn",
     "perl-build-system, v1.1.3, Artistic/GPL; Dropbox password strength estimator"),
    (8541, "alpine-make-rootfs", "alpine-make-rootfs",
     "gnu-build-system, v0.8.1, MIT; Alpine Linux rootfs builder for containers"),
    (8282, "epub-thumbnailer-git", "epub-thumbnailer",
     "copy-build-system, git-de4b5bf, GPL-3.0; EPUB thumbnail generator for file managers"),
    (15176, "zenstates-git", "zenstates",
     "copy-build-system, git-0bc27f4, MIT; AMD Ryzen P-States editor Python script"),
    (8550, "rust-docs", "rust-docs",
     "copy-build-system, v1.84.1, Apache-2.0/MIT; offline Rust language documentation"),
]

# Blocked packages: (pkg_number, pkg_name, reason)
BLOCKED = [
    (8778, "iacs",
     "BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — PROPRIETARY: requires IBM account to download; "
     "no redistribution allowed; A1: manual download with IBMid; A2: no public mirror; "
     "A3: proprietary Java app with native launcher"),
    (8012, "marimo",
     "BLOCKED: NEEDS_RECIPE_DESIGN — MASSIVE_DEPS: 19+ runtime deps many not in Guix "
     "(python-loro, python-narwhals, python-msgspec); A1: PyPI sdist needs deep dep packaging; "
     "A2: GitHub source needs Node.js/pnpm frontend build; A3: dependency tree too deep for single pass"),
    (8559, "dpt-rp1-py-git",
     "BLOCKED: NEEDS_RECIPE_DESIGN — MISSING_DEPS: depends on python-httpsig, python-fusepy, "
     "python-pbkdf2 not in Guix; A1: PyPI tarball needs 3+ new deps; A2: git source same; "
     "A3: deps could be packaged but scope exceeds single pass"),
    (8332, "rbonsai",
     "BLOCKED: NEEDS_RECIPE_DESIGN — CARGO_VENDORING: Rust/Cargo project needs vendored deps list; "
     "cargo-build-system requires Cargo.lock import; A1: cargo-build-system needs vendored crates; "
     "A2: from-source build requires full Rust toolchain; A3: no pre-built binary available"),
    (8593, "popsicle",
     "BLOCKED: NEEDS_RECIPE_DESIGN — CARGO_VENDORING + EXTERNAL_GIT: Rust workspace with external "
     "git deps (dbus-udisks2, iso9660-rs from pop-os repos); GTK3 frontend; "
     "A1: cargo-build-system with vendored deps + GTK; A2: git submodules not reproducible; "
     "A3: complex build requiring multiple pop-os dep packages"),
]


def update_todo():
    with open(TODO_FILE, "r") as f:
        lines = f.readlines()

    # Build index of package heading lines: "** ... N. pkg-name"
    heading_pattern = re.compile(r"^\*\*\s+\S+\s+(\d+)\.\s+(\S+)")

    # Map pkg_number -> list of line indices where that package's heading is
    pkg_headings = {}
    for i, line in enumerate(lines):
        m = heading_pattern.match(line)
        if m:
            num = int(m.group(1))
            if num not in pkg_headings:
                pkg_headings[num] = []
            pkg_headings[num].append(i)

    # For each resolved package, find its heading and add status line after it
    changes = []  # (line_index, text_to_insert)

    for pkg_num, pkg_name, guix_name, details in RESOLVED:
        if pkg_num in pkg_headings:
            # Use the last heading for this package number
            heading_idx = pkg_headings[pkg_num][-1]
            # Find the right place to insert - after existing status lines
            insert_idx = heading_idx + 1
            while insert_idx < len(lines) and (
                lines[insert_idx].startswith("   ") or lines[insert_idx].strip() == ""
            ):
                insert_idx += 1
            # Insert before the next heading
            status_line = (
                f"   - Status: DONE: NEEDS_RECIPE_DESIGN resolved — "
                f"recipe in {RESOLVER_ID}.scm ({details}) ({RESOLVER_ID}, 2026-04-17)\n"
            )
            changes.append((insert_idx, status_line))

    for pkg_num, pkg_name, reason in BLOCKED:
        if pkg_num in pkg_headings:
            heading_idx = pkg_headings[pkg_num][-1]
            insert_idx = heading_idx + 1
            while insert_idx < len(lines) and (
                lines[insert_idx].startswith("   ") or lines[insert_idx].strip() == ""
            ):
                insert_idx += 1
            status_line = f"   - Status: {reason} ({RESOLVER_ID}, 2026-04-17)\n"
            changes.append((insert_idx, status_line))

    # Sort by line index descending so insertions don't shift indices
    changes.sort(key=lambda x: x[0], reverse=True)

    for idx, text in changes:
        lines.insert(idx, text)

    # Atomic write
    fd, tmp = tempfile.mkstemp(dir=".", suffix=".tmp")
    try:
        with os.fdopen(fd, "w") as f:
            f.writelines(lines)
        os.replace(tmp, TODO_FILE)
    except:
        os.unlink(tmp)
        raise

    print(f"Updated {TODO_FILE}: {len(RESOLVED)} resolved, {len(BLOCKED)} blocked")
    print(f"Total changes: {len(changes)} status lines inserted")


if __name__ == "__main__":
    update_todo()
