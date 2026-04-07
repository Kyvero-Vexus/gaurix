#!/usr/bin/env python3
"""Deterministic programmatic update of packages.scm for deptree-resolver-260407e."""

import re
import sys
import tempfile
import shutil

PACKAGES_FILE = "guix/gaurix/packages.scm"
NEW_MODULE = "(gaurix packages deptree-resolver-260407e)"
NEW_BLOCKED_MODULE = "(gaurix packages deptree-resolver-260407e-blocked-notes)"

# Exports from the new module (guile-safe names)
NEW_EXPORTS = [
    "qt5-webkit-dtre",
    "cosmic-icons-git",
    "flite1",
    "libajantv2",
    "owlry-plugin-calculator",
    "owlry-plugin-system",
    "owlry-plugin-bookmarks",
    "owlry-plugin-filesearch",
    "owlry-plugin-pomodoro",
    "owlry-plugin-scripts",
    "owlry-plugin-websearch",
    "owlry-plugin-media",
    "owlry-plugin-ssh",
    "owlry-plugin-systemd",
    "owlry-plugin-weather",
    "owlry-plugin-clipboard",
    "owlry-plugin-emoji",
    "dotnet-runtime-preview-bin",
    "python-materialyoucolor-dtre",
    "aspnet-targeting-pack-preview-bin",
    "ttf-gabarito-git",
    "c-client",
    "stl-thumb",
    "themix-import-images-git",
    "eww",
    "cosmic-randr-git",
    "cosmic-idle-git",
    "cosmic-screenshot-git",
    "cosmic-app-library-git",
    "cosmic-panel-git",
    "cosmic-workspaces-git",
    "cosmic-launcher-git",
    "cosmic-notifications-git",
    "cosmic-comp-git",
    "cosmic-settings-daemon-git",
    "qtforkawesome-qt6",
    "clight-pkg",
    "upscayl-ncnn",
    "cairo-dock-core-wayland-git",
    "stardust-xr-non-spatial-input",
    "stardust-xr-server",
    "xrizer-git",
    "maliit-framework",
    "libadwaita-yaru-git",
    "aylurs-gtk-shell-git",
    "themix-plugin-base16-git",
    "themix-theme-oomox-git",
    "obsidianctl",
    "mupen64plus-git",
    "protonmail-bridge-free-core",
    "backintime-cli-git",
    "portable-sandbox",
    "angle-chromium",
    "qt5-quick3d",
    "nvidia-390xx-utils-pkg",
    "nvidia-470xx-utils-pkg",
    "nvidia-580xx-utils-pkg",
    "opera-gx-stable",
    "matlab-mpm",
    "vscodium-compat",
    "arduino-builder",
]

def main():
    with open(PACKAGES_FILE, "r") as f:
        content = f.read()

    lines = content.split("\n")

    # Find the last #:use-module line to insert our new modules after
    last_use_module_idx = -1
    for i, line in enumerate(lines):
        if "#:use-module" in line:
            last_use_module_idx = i

    if last_use_module_idx == -1:
        print("ERROR: Could not find #:use-module lines in packages.scm", file=sys.stderr)
        sys.exit(1)

    # Check if module already added
    if NEW_MODULE in content:
        print(f"Module {NEW_MODULE} already in packages.scm, skipping module insertion")
    else:
        # Insert after the last use-module
        new_lines = [
            f"  #:use-module {NEW_MODULE}",
            f"  #:use-module {NEW_BLOCKED_MODULE}",
        ]
        for line in reversed(new_lines):
            lines.insert(last_use_module_idx + 1, line)
        print(f"Added #:use-module for {NEW_MODULE}")

    # Find the closing )) of the re-export list to add new exports before it
    # The file ends with a pattern like:
    #             some-package-name
    # ))
    # )
    # Find the last "))" that closes the re-export list
    content_after = "\n".join(lines)

    # Find the position of the final export names before the closing "))  )"
    # We need to add exports before the closing
    # Look for the pattern: last export name followed by ))
    last_close_idx = -1
    for i in range(len(lines) - 1, -1, -1):
        if lines[i].strip() == "))":
            last_close_idx = i
            break

    if last_close_idx == -1:
        # Try finding "))\n)"
        for i in range(len(lines) - 1, -1, -1):
            if "))" in lines[i].strip():
                last_close_idx = i
                break

    if last_close_idx == -1:
        print("ERROR: Could not find closing ')) of re-export list", file=sys.stderr)
        sys.exit(1)

    # Check if exports already added
    if NEW_EXPORTS[0] in content:
        print("Exports already present in packages.scm, skipping")
    else:
        # Insert exports before the closing ))
        export_lines = [f"            {name}" for name in NEW_EXPORTS]
        for line in reversed(export_lines):
            lines.insert(last_close_idx, line)
        print(f"Added {len(NEW_EXPORTS)} exports")

    # Write atomically
    result = "\n".join(lines)
    with tempfile.NamedTemporaryFile(mode='w', dir='.', suffix='.tmp', delete=False) as tmp:
        tmp.write(result)
        tmp_name = tmp.name
    shutil.move(tmp_name, PACKAGES_FILE)
    print(f"Updated {PACKAGES_FILE}")

if __name__ == "__main__":
    main()
