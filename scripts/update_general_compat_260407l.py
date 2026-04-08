#!/usr/bin/env python3
"""
Deterministic update of general-compat.scm for recipe-resolver-260407l.
Adds #:use-module and #:export entries.
"""
import shutil

COMPAT_FILE = "guix/gaurix/packages/general-compat.scm"

NEW_MODULE = "  #:use-module (gaurix packages recipe-resolver-260407l)"
ANCHOR_MODULE = "  #:use-module (gaurix packages recipe-resolver-260407k)"

NEW_EXPORTS = [
    "            ;; recipe-resolver-260407l re-exports",
    "            pipette-desktop-bin",
    "            elyprismlauncher-bin",
    "            lianpkg-gui-bin",
    "            gb-studio-bin",
    "            velo-bin",
    "            webtunnel-client-bin",
    "            hytale-downloader-bin",
    "            sonarr-bin",
    "            ffstudio-bin",
    "            undertalemodtool-bin",
    "            thorium-browser-avx2-bin",
    "            tonelib-gfx-bin",
    "            mateengine-bin",
    "            msdf-atlas-gen",
    "            gnuclad",
    "            bsd-leave",
    "            pidgin-libnotify",
    "            binauralplayer",
    "            python-rofi",
    "            dotctl",
    "            sxhkhm",
    "            myapps",
    "            toad-ai",
    "            font-chocolate-classical-sans",
    "            nordic-darker-standard-buttons-theme",
    "            catppuccin-qt5ct",
    "            fairy-stockfish",
    "            shiru-lv2",
    "            tanin",
    "            swaycons",
]

def main():
    with open(COMPAT_FILE, "r") as f:
        lines = f.readlines()

    new_lines = []
    module_added = False
    exports_added = False

    for i, line in enumerate(lines):
        new_lines.append(line)

        # Add use-module after the anchor
        if not module_added and line.strip() == ANCHOR_MODULE.strip():
            new_lines.append(NEW_MODULE + "\n")
            module_added = True

        # Add exports just before the first (define
        if not exports_added and line.strip().startswith("(define"):
            # Remove the line we just added
            new_lines.pop()
            # Add export entries
            for exp in NEW_EXPORTS:
                new_lines.append(exp + "\n")
            new_lines.append(line)
            exports_added = True

    if not module_added:
        print("WARNING: Could not find anchor module line to add use-module")
    if not exports_added:
        print("WARNING: Could not find position to add exports")

    # Write atomically
    tmp_file = COMPAT_FILE + ".tmp"
    with open(tmp_file, "w") as f:
        f.writelines(new_lines)
    shutil.move(tmp_file, COMPAT_FILE)

    print(f"Module import added: {module_added}")
    print(f"Exports added: {exports_added}")


if __name__ == "__main__":
    main()
