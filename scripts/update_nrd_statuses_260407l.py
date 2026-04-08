#!/usr/bin/env python3
"""
Deterministic update of todo_general_packages.org for recipe-resolver-260407l pass.
Updates BLOCKED headers to DONE and adds DONE status lines for resolved packages.
"""
import re
import shutil

ORG_FILE = "todo_general_packages.org"

# Mapping: todo-entry-name → (guix-pkg-name, version, description)
RESOLVED = {
    "pipette-desktop-bin": ("pipette-desktop-bin", "0.3.13", "Pipette Desktop AppImage, GPL-3.0"),
    "elyprismlauncher-bin": ("elyprismlauncher-bin", "10.0.5", "ElyPrismLauncher portable binary, GPL-3.0"),
    "lianpkg-gui-bin": ("lianpkg-gui-bin", "2.0.2", "LianPkg GUI binary, GPL-3.0"),
    "gb-studio-bin": ("gb-studio-bin", "4.2.2", "GB Studio .deb binary, MIT"),
    "velo-bin": ("velo-bin", "0.4.21", "Velo .deb email client, Apache-2.0"),
    "webtunnel-client-bin": ("webtunnel-client-bin", "0.0.3", "WebTunnel client binary, MIT"),
    "hytale-downloader-bin": ("hytale-downloader-bin", "1.0.0", "Hytale Downloader zip binary, custom"),
    "sonarr-bin": ("sonarr-bin", "4.0.17.2952", "Sonarr .NET bundle, GPL-3.0"),
    "ffstudio-bin": ("ffstudio-bin", "0.2.7", "FFStudio .deb binary, GPL-3.0"),
    "undertalemodtool-bin": ("undertalemodtool-bin", "0.8.4.1", "UTMT CLI .NET binary, GPL-3.0"),
    "thorium-browser-avx2-bin": ("thorium-browser-avx2-bin", "138.0.7204.303", "Thorium Browser .deb AVX2, BSD-3"),
    "tonelib-gfx-bin": ("tonelib-gfx-bin", "4.9.0", "ToneLib GFX .deb binary, proprietary"),
    "mateengine": ("mateengine-bin", "3.2.0", "MateEngine Unity binary, custom"),
    "msdf-atlas-gen": ("msdf-atlas-gen", "1.4", "MSDF atlas gen CMake source, MIT"),
    "gnuclad": ("gnuclad", "0.2.4.p1", "gnuclad autotools source, GPL-3.0"),
    "bsd-leave": ("bsd-leave", "1.12", "BSD leave C source, BSD-3"),
    "pidgin-libnotify": ("pidgin-libnotify", "0.14", "Pidgin libnotify plugin, GPL-2.0+"),
    "binauralplayer": ("binauralplayer", "1.4.0", "BinauralPlayer CMake Qt6, GPL-3.0"),
    "python-rofi-git": ("python-rofi", "1.0.1", "Python rofi module, MIT"),
    "dotctl": ("dotctl", "0.1.0", "dotctl Python dotfiles tool, MIT"),
    "sxhkhm-git": ("sxhkhm", "0.4.4", "sxhkhm keybinding helper, BSD-2"),
    "myapps": ("myapps", "0.3.1", "MyApps GTK4 app manager, GPL-3.0+"),
    "toad-ai": ("toad-ai", "0.6.14", "Toad AI terminal interface, AGPL-3.0"),
    "ttf-chocolate-classical-sans": ("font-chocolate-classical-sans", "1.001", "Chocolate Classical Sans font, OFL-1.1"),
    "nordic-darker-standard-buttons-theme-git": ("nordic-darker-standard-buttons-theme", "git", "Nordic GTK dark theme, GPL-3.0"),
    "catppuccin-qt5ct-git": ("catppuccin-qt5ct", "git", "Catppuccin qt5ct color scheme, MIT"),
    "fairy-stockfish": ("fairy-stockfish", "14.0.1", "Fairy-Stockfish chess variant engine, GPL-3.0"),
    "shiru.lv2-git": ("shiru-lv2", "git", "Shiru LV2 chiptune plugins, WTFPL"),
    "tanin-git": ("tanin", "0.1.0", "Tanin TUI noise generator, MIT"),
    "swaycons": ("swaycons", "0.3.1", "Swaycons Sway icon setter, MIT"),
}

MODULE = "recipe-resolver-260407l"


def main():
    with open(ORG_FILE, "r") as f:
        lines = f.readlines()

    new_lines = []
    current_pkg = None
    changes = 0
    done_added = set()

    for i, line in enumerate(lines):
        # Detect headers: "** BLOCKED N. pkg-name" or "** DONE N. pkg-name"
        header_match = re.match(r'^(\*\* )(BLOCKED|DONE)( \d+\. )(.+)$', line)
        if header_match:
            prefix = header_match.group(1)
            status = header_match.group(2)
            num_part = header_match.group(3)
            pkg_name = header_match.group(4).strip()

            if pkg_name in RESOLVED:
                current_pkg = pkg_name
                # Ensure header is DONE
                if status == "BLOCKED":
                    line = f"{prefix}DONE{num_part}{pkg_name}\n"
                new_lines.append(line)
                continue
            else:
                current_pkg = None

        # Fix TODO Status lines for matched packages
        if current_pkg and "TODO Status: BLOCKED" in line:
            line = line.replace("TODO Status: BLOCKED", "TODO Status: DONE")

        # Add DONE status line after last status/difficulty line in a matched entry
        if current_pkg and current_pkg not in done_added:
            is_last_field = False
            if line.strip().startswith("- TODO Status:"):
                is_last_field = True
            elif line.strip().startswith("- Difficulty:"):
                if i + 1 < len(lines) and "TODO Status:" not in lines[i + 1]:
                    is_last_field = True

            if is_last_field:
                pkg_name_guix, version, desc = RESOLVED[current_pkg]
                done_line = (
                    f"   - Status: DONE: recipe in {MODULE}.scm "
                    f"({pkg_name_guix} v{version}, {desc})\n"
                )
                new_lines.append(line)
                new_lines.append(done_line)
                done_added.add(current_pkg)
                changes += 1
                continue

        new_lines.append(line)

    # Write atomically
    tmp_file = ORG_FILE + ".tmp"
    with open(tmp_file, "w") as f:
        f.writelines(new_lines)
    shutil.move(tmp_file, ORG_FILE)

    print(f"Updated {changes} entries with DONE status.")
    print(f"Resolved packages: {', '.join(sorted(done_added))}")
    unresolved = set(RESOLVED.keys()) - done_added
    if unresolved:
        print(f"NOT found in org file: {', '.join(sorted(unresolved))}")


if __name__ == "__main__":
    main()
