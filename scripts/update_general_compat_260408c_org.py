#!/usr/bin/env python3
"""Update todo_general_packages.org for recipe-resolver-260408f pass.

Appends status updates to 30 NEEDS_RECIPE_DESIGN packages.
Uses deterministic full-file transform: read -> compute -> write temp -> atomic move.
"""

import os
import tempfile
import shutil

SRC = "todo_general_packages.org"

# Each entry: (line_number_of_NEEDS_RECIPE_DESIGN_status, status_update_text)
# Line numbers are from the NEEDS_RECIPE_DESIGN grep output
UPDATES = [
    # Group A: Compat aliases to Guix packages (new aliases in general-compat.scm)
    (89031, "xlibre-input-wacom",
     "   - Status: DONE: compat alias in general-compat.scm -> xf86-input-wacom (recipe-resolver-260408f pass)\n"
     "   - TODO Status: DONE\n"),
    (89037, "xlibre-video-fbdev",
     "   - Status: DONE: compat alias in general-compat.scm -> xf86-video-fbdev (recipe-resolver-260408f pass)\n"
     "   - TODO Status: DONE\n"),
    (102209, "ffmpeg-amd-full",
     "   - Status: DONE: compat alias in general-compat.scm -> ffmpeg (recipe-resolver-260408f pass)\n"
     "   - TODO Status: DONE\n"),

    # Group B: Compat aliases to existing gaurix -bin packages
    (67965, "slack-desktop",
     "   - Status: DONE: compat alias in general-compat.scm -> slack-desktop-bin; recipe in recipe-resolver-260407j.scm (recipe-resolver-260408f pass)\n"
     "   - TODO Status: DONE\n"),
    (68209, "oh-my-posh",
     "   - Status: DONE: compat alias in general-compat.scm -> oh-my-posh-bin; recipe in recipe-resolver-260407e.scm (recipe-resolver-260408f pass)\n"
     "   - TODO Status: DONE\n"),
    (95165, "spicetify-cli",
     "   - Status: DONE: compat alias in general-compat.scm -> spicetify-cli-bin; recipe in recipe-resolver-260407e.scm (recipe-resolver-260408f pass)\n"
     "   - TODO Status: DONE\n"),
    (67877, "rustdesk",
     "   - Status: DONE: compat alias in general-compat.scm -> rustdesk-bin; recipe in recipe-resolver-260407j.scm (recipe-resolver-260408f pass)\n"
     "   - TODO Status: DONE\n"),
    (103982, "qbittorrent-cli",
     "   - Status: DONE: compat alias in general-compat.scm -> qbittorrent-cli-bin; recipe in recipe-resolver-260407e.scm (recipe-resolver-260408f pass)\n"
     "   - TODO Status: DONE\n"),
    (96389, "hyprls",
     "   - Status: DONE: compat alias in general-compat.scm -> hyprls-bin; recipe in recipe-resolver-260407e.scm (recipe-resolver-260408f pass)\n"
     "   - TODO Status: DONE\n"),
    (73948, "ffdec",
     "   - Status: DONE: compat alias in general-compat.scm -> ffdec-bin; recipe in recipe-resolver-260407e.scm (recipe-resolver-260408f pass)\n"
     "   - TODO Status: DONE\n"),

    # Group C: New binary packages in recipe-resolver-260408f.scm
    (69575, "logseq-desktop",
     "   - Status: DONE: recipe in recipe-resolver-260408f.scm (logseq-desktop-bin v0.10.15, AppImage, AGPL-3.0) + compat alias logseq-desktop in general-compat.scm\n"
     "   - TODO Status: DONE\n"),
    (67976, "rider",
     "   - Status: DONE: recipe in recipe-resolver-260408f.scm (rider-bin v2026.1, JetBrains tar.gz binary, proprietary) + compat alias rider in general-compat.scm\n"
     "   - TODO Status: DONE\n"),
    (67919, "xnviewmp",
     "   - Status: DONE: recipe in recipe-resolver-260408f.scm (xnviewmp-bin v1.10.5, tgz binary, freeware) + compat alias xnviewmp in general-compat.scm\n"
     "   - TODO Status: DONE\n"),
    (73552, "tutanota-desktop",
     "   - Status: DONE: recipe in recipe-resolver-260408f.scm (tutanota-desktop-bin v340.260326.1, AppImage, GPL-3.0) + compat alias tutanota-desktop in general-compat.scm\n"
     "   - TODO Status: DONE\n"),
    (71284, "shutter-encoder",
     "   - Status: DONE: recipe in recipe-resolver-260408f.scm (shutter-encoder-bin v20.0, AppImage, GPL-3.0) + compat alias shutter-encoder in general-compat.scm\n"
     "   - TODO Status: DONE\n"),
    (67945, "freefilesync",
     "   - Status: DONE: recipe in recipe-resolver-260408f.scm (freefilesync-bin v14.9, tar.gz binary, GPL-3.0) + compat alias freefilesync in general-compat.scm\n"
     "   - TODO Status: DONE\n"),
    (89063, "appimagelauncher",
     "   - Status: DONE: recipe in recipe-resolver-260408f.scm (appimagelauncher-bin v2.2.0, .deb binary, MIT) + compat alias appimagelauncher in general-compat.scm\n"
     "   - TODO Status: DONE\n"),

    # Group D: Already-resolved packages (definitions exist in general-compat.scm)
    (70885, "libvpx1.3",
     "   - Status: DONE: already resolved as compat alias in general-compat.scm -> libvpx (confirmed in recipe-resolver-260408f pass)\n"
     "   - TODO Status: DONE\n"),
    (70892, "lib32-libvpx1.3",
     "   - Status: DONE: already resolved as compat alias in general-compat.scm -> libvpx (confirmed in recipe-resolver-260408f pass)\n"
     "   - TODO Status: DONE\n"),
    (70911, "glew1.10",
     "   - Status: DONE: already resolved as compat alias in general-compat.scm -> glew (confirmed in recipe-resolver-260408f pass)\n"
     "   - TODO Status: DONE\n"),
    (70904, "lib32-glew1.10",
     "   - Status: DONE: already resolved as compat alias in general-compat.scm -> glew (confirmed in recipe-resolver-260408f pass)\n"
     "   - TODO Status: DONE\n"),
    (74310, "wolfssl-all",
     "   - Status: DONE: already resolved as compat alias in general-compat.scm -> wolfssl (confirmed in recipe-resolver-260408f pass)\n"
     "   - TODO Status: DONE\n"),
    (73780, "llama.cpp-cuda",
     "   - Status: DONE: already resolved as compat alias in general-compat.scm -> llama-cpp-cuda (confirmed in recipe-resolver-260408f pass)\n"
     "   - TODO Status: DONE\n"),
    (19197, "libjxl-noglycin-doc",
     "   - Status: DONE: already resolved as compat alias in general-compat.scm -> libjxl (confirmed in recipe-resolver-260408f pass)\n"
     "   - TODO Status: DONE\n"),

    # Group E: Properly blocked with exhausted approaches
    (94664, "octopi",
     "   - Status: BLOCKED: ARCH_SPECIFIC_EXHAUSTED | pacman/AUR package manager GUI; A1: no Guix equivalent exists; A2: requires pacman + makepkg infrastructure; A3: cannot operate standalone without Arch packaging system | recipe-resolver-260408f pass\n"
     "   - TODO Status: BLOCKED\n"),
    (70819, "aurutils",
     "   - Status: BLOCKED: ARCH_SPECIFIC_EXHAUSTED | AUR helper utilities; A1: requires pacman + makepkg; A2: bash scripts tightly coupled to AUR/pacman; A3: no Guix analogue possible | recipe-resolver-260408f pass\n"
     "   - TODO Status: BLOCKED\n"),
    (69408, "nordvpn-gui",
     "   - Status: BLOCKED: PROPRIETARY_NO_PUBLIC_BINARY | A1: no public download URL (requires NordVPN account); A2: binary depends on nordvpn daemon not in Guix; A3: proprietary closed-source GUI with custom IPC | recipe-resolver-260408f pass\n"
     "   - TODO Status: BLOCKED\n"),
    (70587, "sourcegit",
     "   - Status: BLOCKED: DOTNET_ECOSYSTEM_EXHAUSTED | A1: requires dotnet-sdk 8.0+ (not in Guix); A2: AvaloniaUI framework needs .NET runtime; A3: no standalone Linux binary published | recipe-resolver-260408f pass\n"
     "   - TODO Status: BLOCKED\n"),
    (75635, "feishu",
     "   - Status: BLOCKED: PROPRIETARY_REGION_SPECIFIC | A1: proprietary Lark/Feishu app, no OSS source; A2: download requires region-specific CDN access; A3: binary depends on proprietary runtime libraries | recipe-resolver-260408f pass\n"
     "   - TODO Status: BLOCKED\n"),
    (68386, "mangowm",
     "   - Status: BLOCKED: MISSING_WLROOTS_019_EXHAUSTED | A1: requires wlroots 0.19 (Guix has 0.17); A2: complex Wayland compositor with custom protocols; A3: no prebuilt binary available | recipe-resolver-260408f pass\n"
     "   - TODO Status: BLOCKED\n"),
]


def main():
    with open(SRC, "r") as f:
        lines = f.readlines()

    # Process updates in reverse order so line numbers stay valid
    sorted_updates = sorted(UPDATES, key=lambda x: x[0], reverse=True)

    for line_num, pkg_name, status_text in sorted_updates:
        # Convert 1-indexed line number to 0-indexed
        idx = line_num - 1
        if idx < len(lines):
            # Insert status update AFTER the NEEDS_RECIPE_DESIGN line
            lines.insert(idx + 1, status_text)
            print(f"Updated {pkg_name} at line {line_num}")
        else:
            print(f"WARNING: line {line_num} out of range for {pkg_name}")

    # Write to temp file and atomic move
    fd, tmp_path = tempfile.mkstemp(
        dir=os.path.dirname(SRC) or ".", suffix=".org.tmp"
    )
    try:
        with os.fdopen(fd, "w") as f:
            f.writelines(lines)
        shutil.move(tmp_path, SRC)
        print(f"Atomically updated {SRC}")
    except Exception:
        os.unlink(tmp_path)
        raise

if __name__ == "__main__":
    main()
