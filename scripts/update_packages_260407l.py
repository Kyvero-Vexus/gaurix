#!/usr/bin/env python3
"""
Deterministic update of packages.scm for recipe-resolver-260407l.
Adds #:use-module and #:export entries.
"""
import shutil

PACKAGES_FILE = "guix/gaurix/packages.scm"

NEW_MODULE = "  #:use-module (gaurix packages recipe-resolver-260407l)"
ANCHOR_MODULE = "  #:use-module (gaurix packages recipe-resolver-260407k)"

NEW_EXPORTS = [
    "            ;; recipe-resolver-260407l",
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
    with open(PACKAGES_FILE, "r") as f:
        lines = f.readlines()

    new_lines = []
    module_added = False

    for i, line in enumerate(lines):
        new_lines.append(line)

        # Add use-module after the anchor
        if not module_added and line.strip() == ANCHOR_MODULE.strip():
            new_lines.append(NEW_MODULE + "\n")
            module_added = True

    # Find the last closing paren and insert exports before it
    # The file ends with ")\n" — find the last line with just ")"
    result_lines = new_lines[:]

    # Find position of closing ")" to insert exports before it
    last_paren_idx = None
    for idx in range(len(result_lines) - 1, -1, -1):
        if result_lines[idx].strip() == ")":
            last_paren_idx = idx
            break

    if last_paren_idx is not None:
        for j, exp in enumerate(NEW_EXPORTS):
            result_lines.insert(last_paren_idx + j, exp + "\n")

    if not module_added:
        print("WARNING: Could not find anchor module line")

    # Write atomically
    tmp_file = PACKAGES_FILE + ".tmp"
    with open(tmp_file, "w") as f:
        f.writelines(result_lines)
    shutil.move(tmp_file, PACKAGES_FILE)

    print(f"Module added: {module_added}")
    print(f"Exports added at line: {last_paren_idx}")


if __name__ == "__main__":
    main()
