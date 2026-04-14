#!/usr/bin/env python3
"""Resolve 30 NEEDS_RECIPE_DESIGN packages in todo_general_packages.org.

Batch: recipe-resolver-260414e
"""

import os
import sys
import tempfile
import re

TODO_FILE = "/home/slime/projects/gaurix/todo_general_packages.org"

# (package_number, aur_name, guix_name, version, description, build_system, license)
PACKAGES = [
    (7007, "uemacs-git", "uemacs", "v4.0.15", "MicroEMACS editor", "gnu-build-system", "public-domain"),
    (7612, "vvdec", "vvdec", "v3.1.0", "VVC video decoder", "cmake-build-system", "BSD-3"),
    (7776, "opencollada", "opencollada", "v1.6.68", "COLLADA parser", "cmake-build-system", "GPL-2.0+"),
    (7706, "spacecadetpinball-git", "spacecadetpinball", "v2.0.1", "3D Pinball game", "cmake-build-system", "MIT"),
    (10208, "intel-ipsec-mb", "intel-ipsec-mb", "v2.0", "IPsec crypto library", "cmake-build-system", "BSD-3"),
    (7431, "ebsl", "ebsl", "v2.8.0", "config file format", "cmake-build-system", "MIT"),
    (7433, "finalmouse-cli", "finalmouse-cli", "v1.0.0", "mouse polling rate CLI", "cmake-build-system", "MIT"),
    (7251, "headsetstatus", "headsetstatus", "v1.2.2", "headset battery tray app", "cmake-build-system", "MIT"),
    (11007, "qt-heif-image-plugin", "qt-heif-image-plugin", "v0.3.4", "Qt5 HEIF plugin", "cmake-build-system", "LGPL-3.0+"),
    (7679, "kplotting5", "kplotting5", "v5.116.0", "KDE plotting framework", "cmake-build-system", "LGPL-2.1+"),
    (7428, "fortty", "fortty", "v0.1.6", "Fortran terminal emulator", "cmake-build-system", "MIT"),
    (7268, "calf-no-gui", "calf-no-gui", "v0.90.8", "LV2 audio plugins", "gnu-build-system", "GPL-2.0+"),
    (11117, "kpeoplevcard", "kpeoplevcard", "v0.1", "KDE VCard bridge", "cmake-build-system", "LGPL-2.1+"),
    (7653, "hyprsysteminfo", "hyprsysteminfo", "v0.1.3", "Hyprland system info", "cmake-build-system", "BSD-3"),
    (11152, "wl_shimeji-git", "wl-shimeji", "v0.0.2", "Wayland desktop pet", "meson-build-system", "GPL-2.0"),
    (11035, "libretro-handy-git", "libretro-handy", "v0.0", "Atari Lynx core", "gnu-build-system", "GPL-2.0+"),
    (4078, "scangearmp2-sane-git", "scangearmp2-sane", "v4.60", "Canon SANE backend", "cmake-build-system", "GPL-2.0+"),
    (10063, "tomoyo-tools", "tomoyo-tools", "v2.6.1", "TOMOYO security tools", "gnu-build-system", "GPL-2.0"),
    (7210, "python-pyrogram", "python-pyrogram", "v2.0.106", "Telegram API framework", "pyproject-build-system", "LGPL-3.0+"),
    (7642, "qcomix", "qcomix", "v1.0b7", "Qt comic viewer", "cmake-build-system", "GPL-3.0+"),
    (11546, "gearlever", "gearlever", "v4.4.8", "AppImage manager", "meson-build-system", "GPL-3.0+"),
    (7638, "icon-git", "icon-lang", "v9.5.22e", "Icon programming language", "gnu-build-system", "public-domain"),
    (7721, "java21-openjfx-bin", "java21-openjfx-bin", "v21.0.10", "JavaFX binary SDK", "copy-build-system", "GPL-2.0"),
    (11003, "polymc-qt5-bin", "polymc-qt5-bin", "v7.0", "Minecraft launcher binary", "copy-build-system", "GPL-3.0+"),
    (7522, "runelite", "runelite-bin", "v2.7.5", "OSRS client JAR", "copy-build-system", "BSD-2"),
    (7680, "hmcl", "hmcl-bin", "v3.12.4", "Minecraft launcher JAR", "copy-build-system", "GPL-3.0+"),
    (4051, "slime-git", "emacs-slime-git", "v2.24", "SLIME for Emacs", "emacs-build-system", "GPL-2.0+"),
    (7544, "minisystool", "minisystool", "v1.0", "GTK system info", "gnu-build-system", "GPL-3.0+"),
    (10986, "gcdemu", "gcdemu", "v3.3.0", "GNOME CD emulation applet", "cmake-build-system", "GPL-2.0"),
    (10054, "openal-hrtf", "openal-hrtf", "v1.24.3", "HRTF audio data", "copy-build-system", "CC0"),
]

BATCH_TAG = "recipe-resolver-260414e"


def make_status_line(guix_name, version, description, license_str):
    return (
        f"   - Status: DONE: NEEDS_RECIPE_DESIGN resolved — "
        f"recipe in {BATCH_TAG}.scm "
        f"({guix_name} {version}, {description}, {license_str}) "
        f"({BATCH_TAG})"
    )


def main():
    print(f"Reading {TODO_FILE} ...")
    with open(TODO_FILE, "r") as f:
        lines = f.readlines()

    total_lines = len(lines)
    print(f"Read {total_lines} lines.")

    # Build an index: for each package number, find its heading line
    results = {}

    for pkg_num, aur_name, guix_name, version, desc, build_sys, lic in PACKAGES:
        # Pattern for the heading: ** BLOCKED <number>. <aur_name>
        heading_pattern = re.compile(
            rf"^\*\* BLOCKED {pkg_num}\. {re.escape(aur_name)}\s*(\[.*\])?\s*$"
        )

        found_heading = False
        heading_idx = None

        for i, line in enumerate(lines):
            if heading_pattern.match(line):
                found_heading = True
                heading_idx = i
                break

        if not found_heading:
            results[pkg_num] = f"FAILED: heading not found for ** BLOCKED {pkg_num}. {aur_name}"
            continue

        # Change heading from BLOCKED to DONE
        lines[heading_idx] = lines[heading_idx].replace("** BLOCKED ", "** DONE ", 1)

        # Find the TODO Status: BLOCKED line within this entry (before next ** heading)
        todo_status_idx = None
        for j in range(heading_idx + 1, total_lines):
            stripped = lines[j].strip()
            if stripped.startswith("** "):
                # Next entry, stop
                break
            if stripped == "- TODO Status: BLOCKED":
                todo_status_idx = j
                break

        if todo_status_idx is None:
            results[pkg_num] = f"FAILED: TODO Status: BLOCKED not found for #{pkg_num} {aur_name}"
            # Revert heading change
            lines[heading_idx] = lines[heading_idx].replace("** DONE ", "** BLOCKED ", 1)
            continue

        # Change TODO Status: BLOCKED to TODO Status: DONE
        lines[todo_status_idx] = lines[todo_status_idx].replace(
            "TODO Status: BLOCKED", "TODO Status: DONE", 1
        )

        # Insert the status line just before the TODO Status line
        status_line = make_status_line(guix_name, version, desc, lic) + "\n"
        lines.insert(todo_status_idx, status_line)
        total_lines += 1  # We inserted a line

        results[pkg_num] = f"OK: #{pkg_num} {aur_name} -> DONE (heading line {heading_idx + 1})"

    # Write atomically
    print(f"\nWriting {len(lines)} lines to temp file ...")
    dir_name = os.path.dirname(TODO_FILE)
    fd, tmp_path = tempfile.mkstemp(dir=dir_name, suffix=".org.tmp")
    try:
        with os.fdopen(fd, "w") as f:
            f.writelines(lines)
        os.replace(tmp_path, TODO_FILE)
        print(f"Atomic replace complete.")
    except Exception as e:
        os.unlink(tmp_path)
        print(f"ERROR writing file: {e}")
        sys.exit(1)

    # Report
    print("\n=== Results ===")
    ok_count = 0
    fail_count = 0
    for pkg_num, aur_name, *_ in PACKAGES:
        status = results.get(pkg_num, "UNKNOWN")
        if status.startswith("OK"):
            ok_count += 1
        else:
            fail_count += 1
        print(f"  {status}")

    print(f"\nTotal: {ok_count} OK, {fail_count} FAILED out of {len(PACKAGES)}")
    return 0 if fail_count == 0 else 1


if __name__ == "__main__":
    sys.exit(main())
