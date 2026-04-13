#!/usr/bin/env python3
"""Update packages.scm: replace recipe-resolver-260413m export names with actual exports."""

import re, shutil, tempfile, os

PKG_FILE = "/home/slime/projects/gaurix/guix/gaurix/packages.scm"

# Actual recipe exports from recipe-resolver-260413m
NEW_EXPORTS = [
    "tetro-tui-bin", "jabref", "cmake-language-server", "spotatui",
    "xfce-winxp-tc-git", "libwintc-git", "sing-box-bin", "term39",
    "qui-bin", "shader-slang", "vdhcoapp-bin",
    "plasma6-applets-thermal-monitor", "dwproton-bin", "spent-bin",
    "spent", "vintagestory", "claude-cowork-service", "anyrun",
    "pam-usb", "goose-desktop-bin", "pear-desktop-bin",
    "czkawka-gui-bin", "min-browser-bin", "r2modman",
    "cinny-desktop-bin", "cairo-clock", "wl-screenrec",
    "vivaldi-snapshot", "comaps", "zenmonitor3-git",
    "twintaillauncher-git", "unigine-heaven", "quarto-cli-bin",
    "modrinth-app-bin", "modiva-launcher-bin", "upd72020x-fw",
    "libcheese", "futhark-bin", "tooi-git", "crystal-dock-bin",
    "still", "breitbandmessung-bin", "chatterino2-git",
    "universal-android-debloater-bin", "luckybackup", "radarr",
    "shgit-bin", "ashell-git", "libation", "azahar-appimage-wayland",
    "ancient-packages", "overdue", "yed",
    "minimon-applet-for-cosmic", "ashell", "teams-for-linux-bin",
    "forkgram-bin", "tidal-hifi",
    "libreoffice-extension-languagetool", "pacseek-bin",
    "ironbar-git", "ckan-bin", "sniptext", "rstudio-desktop-bin",
    "httpdirfs-git", "tatuin", "marp-cli", "xenia-edge-bin",
    "qt5-heic-image-plugin", "qt6-heic-image-plugin", "dasel",
    "linux-wifi-hotspot", "xrizer-git", "xrizer-common-git",
    "pyenv-virtualenv", "vlc-bittorrent", "powerline-go-bin",
    "adwaita-qt5-git",
]

def main():
    with open(PKG_FILE, "r") as f:
        lines = f.readlines()

    # Find the marker line ";; recipe-resolver-260413m"
    marker_idx = None
    for i, line in enumerate(lines):
        if ";; recipe-resolver-260413m" in line:
            marker_idx = i
            break

    if marker_idx is None:
        print("ERROR: marker ';; recipe-resolver-260413m' not found in packages.scm")
        return

    # Find the end of the old export block: scan forward from marker until we hit
    # a line that is either a comment starting another section, or a #:use-module line
    end_idx = marker_idx + 1
    while end_idx < len(lines):
        stripped = lines[end_idx].strip()
        if stripped.startswith("#:use-module") or stripped.startswith(";;") or stripped.startswith(")"):
            break
        end_idx += 1

    # Build new export lines
    new_export_lines = [f"            ;; recipe-resolver-260413m\n"]
    for name in NEW_EXPORTS:
        new_export_lines.append(f"            {name}\n")

    # Replace
    new_lines = lines[:marker_idx] + new_export_lines + lines[end_idx:]

    # Write atomically via temp file
    fd, tmp_path = tempfile.mkstemp(dir=os.path.dirname(PKG_FILE))
    try:
        with os.fdopen(fd, "w") as tmp:
            tmp.writelines(new_lines)
        shutil.move(tmp_path, PKG_FILE)
        print(f"Updated {PKG_FILE}: replaced {end_idx - marker_idx} old export lines with {len(new_export_lines)} new lines")
    except:
        os.unlink(tmp_path)
        raise

if __name__ == "__main__":
    main()
