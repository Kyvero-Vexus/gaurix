#!/usr/bin/env python3
"""
Deterministic update of todo_general_packages.org for recipe-resolver-260407k pass.
Updates BLOCKED headers to DONE and adds DONE status lines for resolved packages.
"""
import re
import shutil

ORG_FILE = "todo_general_packages.org"

# Mapping: todo-entry-name → (guix-pkg-name, version, description)
RESOLVED = {
    "teams-for-linux-bin": ("teams-for-linux-bin", "2.7.13", "Teams for Linux AppImage, GPL-3.0"),
    "obsidian": ("obsidian-bin", "1.12.7", "Obsidian AppImage, proprietary"),
    "1password-beta": ("1password-bin", "8.12.8", "1Password .deb binary, proprietary"),
    "rambox-bin": ("rambox-bin", "2.6.2", "Rambox .deb binary, proprietary"),
    "ferdium-bin": ("ferdium-bin", "7.1.1", "Ferdium AppImage, Apache-2.0"),
    "insomnia-bin": ("insomnia-bin", "12.5.0", "Insomnia .deb binary, Apache-2.0"),
    "datagrip": ("datagrip-bin", "2026.1.1", "DataGrip tar.gz binary, proprietary"),
    "pycharm-professional": ("pycharm-professional-bin", "2026.1", "PyCharm Professional tar.gz, proprietary"),
    "webstorm": ("webstorm-bin", "2026.1", "WebStorm tar.gz binary, proprietary"),
    "goland": ("goland-bin", "2026.1", "GoLand tar.gz binary, proprietary"),
    "mongodb-compass": ("mongodb-compass-bin", "1.49.4", "MongoDB Compass .deb binary, SSPL"),
    "beekeeper-studio-bin": ("beekeeper-studio-bin", "5.6.5", "Beekeeper Studio AppImage, GPL-3.0"),
    "parsec-bin": ("parsec-bin", "150_97c", "Parsec .deb binary, proprietary"),
    "sunshine-bin": ("sunshine-bin", "2025.924.154138", "Sunshine AppImage, GPL-3.0"),
    "protonmail-bridge": ("protonmail-bridge-bin", "3.23.1", "ProtonMail Bridge .deb, GPL-3.0"),
    "vivaldi": ("vivaldi-bin", "7.9.3970.47", "Vivaldi .deb binary, proprietary"),
    "waterfox-bin": ("waterfox-bin", "6.6.10", "Waterfox tar.bz2 binary, MPL-2.0"),
    "youtube-music-bin": ("youtube-music-bin", "3.11.0", "YouTube Music AppImage, MIT"),
    "jellyfin-media-player": ("jellyfin-media-player-bin", "1.12.0", "Jellyfin Media Player .deb, GPL-2.0"),
    "drawio-desktop-bin": ("drawio-desktop-bin", "29.6.6", "draw.io Desktop AppImage, Apache-2.0"),
    "figma-linux-bin": ("figma-linux-bin", "0.11.5", "Figma Linux AppImage, GPL-2.0"),
    "wps-office": ("wps-office-bin", "11.1.0.11723", "WPS Office .deb binary, proprietary"),
    "marktext-bin": ("marktext-bin", "0.17.1", "Mark Text AppImage, MIT"),
    "joplin-appimage": ("joplin-appimage", "3.5.13", "Joplin AppImage, MIT"),
    "simplenote-electron-bin": ("simplenote-electron-bin", "2.24.0", "Simplenote AppImage, GPL-2.0"),
    "signal-desktop-bin": ("signal-desktop-bin", "8.5.0", "Signal Desktop .deb, AGPL-3.0"),
    "element-desktop": ("element-desktop-bin", "1.12.13", "Element Desktop .deb, AGPL-3.0"),
    "session-desktop": ("session-desktop-bin", "1.17.17", "Session Desktop AppImage, GPL-3.0"),
    "feishin": ("feishin-bin", "1.11.0", "Feishin AppImage, GPL-3.0"),
    "caprine": ("caprine-bin", "2.60.1", "Caprine AppImage, MIT"),
}

MODULE = "recipe-resolver-260407k"


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
            # Check if next line is a new header or blank section
            is_last_field = False
            if line.strip().startswith("- TODO Status:"):
                is_last_field = True
            elif line.strip().startswith("- Difficulty:"):
                # Check if next line is not "- TODO Status:"
                if i + 1 < len(lines) and "TODO Status:" not in lines[i + 1]:
                    is_last_field = True

            if is_last_field:
                pkg_name, version, desc = RESOLVED[current_pkg]
                done_line = (
                    f"   - Status: DONE: recipe in {MODULE}.scm "
                    f"({pkg_name} v{version}, {desc})\n"
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
