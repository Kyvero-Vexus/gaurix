#!/usr/bin/env python3
"""
Deterministic update of todo_general_packages.org for recipe-resolver-260407j pass.
Appends DONE status lines to NEEDS_RECIPE_DESIGN entries for resolved packages.
"""
import re
import sys
import shutil

ORG_FILE = "todo_general_packages.org"

# Mapping: package-name → (version, description for status line)
RESOLVED = {
    "brave-bin": ("1.88.138", "Brave Browser binary, Chromium-based, MPL-2.0"),
    "zen-browser-bin": ("1.19.6b", "Zen Browser binary, Firefox-based, MPL-2.0"),
    "ventoy-bin": ("1.1.11", "Ventoy bootable USB tool, GPL-3.0"),
    "vscodium-bin": ("1.112.01907", "VSCodium binary, MIT"),
    "heroic-games-launcher-bin": ("2.20.1", "Heroic game launcher for Epic/Amazon/GOG, GPL-3.0"),
    "freetube-bin": ("0.24.0-beta", "FreeTube privacy YouTube player, AGPL-3.0"),
    "zotero-bin": ("8.0.4", "Zotero reference manager, AGPL-3.0"),
    "onlyoffice-bin": ("9.3.1", "ONLYOFFICE Desktop Editors AppImage, AGPL-3.0"),
    "vesktop-bin": ("1.6.5", "Vesktop Discord+Vencord client, GPL-3.0"),
    "opencode-bin": ("0.0.55", "OpenCode AI terminal coding agent, MIT"),
    "arduino-ide-bin": ("2.3.8", "Arduino IDE 2.x binary, AGPL-3.0"),
    "anytype-bin": ("0.54.26", "Anytype knowledge management .deb, custom license"),
    "floorp-bin": ("12.12.0", "Floorp customizable Firefox-based browser, MPL-2.0"),
    "jetbrains-toolbox": ("3.4.1.78303", "JetBrains Toolbox App, proprietary free-to-use"),
    "spicetify-cli": ("2.43.1", "Spicetify CLI for Spotify customization, LGPL-2.1"),
    "helium-browser-bin": ("0.10.8.1", "Helium privacy browser, GPL-3.0"),
    "koboldcpp-bin": ("1.111.2", "KoboldCpp LLM inference (no CUDA), AGPL-3.0"),
    "jitsi-meet-desktop-bin": ("2026.4.0", "Jitsi Meet Desktop AppImage, Apache-2.0"),
    "trezor-suite-bin": ("26.3.3", "Trezor Suite hardware wallet AppImage, T-RSL"),
    "ldtk-bin": ("1.5.3", "LDtk level designer toolkit, MIT"),
    "mullvad-browser-bin": ("15.0.9", "Mullvad Browser privacy browser, MPL-2.0"),
    "rustdesk-bin": ("1.4.6", "RustDesk remote desktop .deb, AGPL-3.0"),
    "proton-pass-cli-bin": ("1.9.0", "Proton Pass CLI binary, proprietary"),
    "zoom": ("7.0.2.34412", "Zoom video conferencing, proprietary"),
    "slack-desktop": ("4.47.69", "Slack desktop client .deb, proprietary"),
    "mullvad-vpn-bin": ("2026.1", "Mullvad VPN desktop .deb, GPL-3.0"),
    "cursor-bin": ("3.0.13", "Cursor AI editor AppImage, proprietary"),
    "proton-pass-bin": ("1.36.0", "Proton Pass desktop .deb, proprietary"),
    "betterbird-bin": ("140.9.0esr-bb20", "Betterbird Thunderbird fork, MPL-2.0"),
    "google-chrome": ("137.0.7151.40", "Google Chrome .deb, proprietary"),
}

MODULE = "recipe-resolver-260407j"

def main():
    with open(ORG_FILE, "r") as f:
        lines = f.readlines()

    # For each NEEDS_RECIPE_DESIGN line matching a resolved package,
    # append a DONE status line after it.
    new_lines = []
    changes = 0
    resolved_set = set()

    for i, line in enumerate(lines):
        new_lines.append(line)

        # Check if this line has NEEDS_RECIPE_DESIGN for one of our packages
        if "NEEDS_RECIPE_DESIGN" in line and "DONE" not in line:
            for pkg_name, (version, desc) in RESOLVED.items():
                # Match package name in the line (with word boundaries)
                if pkg_name in line and pkg_name not in resolved_set:
                    done_line = (
                        f"   - Status: DONE: recipe in {MODULE}.scm "
                        f"({pkg_name} v{version}, {desc})\n"
                    )
                    new_lines.append(done_line)
                    resolved_set.add(pkg_name)
                    changes += 1
                    break

    # Also update the header TODO Status for entries that have multiple statuses
    # Find headers like "** BLOCKED NNNN. <pkg-name>" and flip to DONE
    final_lines = []
    for i, line in enumerate(new_lines):
        # Check for BLOCKED header lines that match our resolved packages
        header_match = re.match(r'^(\*\* )BLOCKED( \d+\. )(.+)$', line)
        if header_match:
            pkg_in_header = header_match.group(3).strip()
            if pkg_in_header in RESOLVED:
                line = f"{header_match.group(1)}DONE{header_match.group(2)}{pkg_in_header}\n"

        # Also check TODO Status lines
        if "TODO Status: BLOCKED" in line:
            # Check if previous lines (up to 10) have our DONE status
            lookback = new_lines[max(0, i-10):i]
            for lb in lookback:
                if f"recipe in {MODULE}" in lb:
                    line = line.replace("TODO Status: BLOCKED", "TODO Status: DONE")
                    break

        final_lines.append(line)

    # Write atomically
    tmp_file = ORG_FILE + ".tmp"
    with open(tmp_file, "w") as f:
        f.writelines(final_lines)
    shutil.move(tmp_file, ORG_FILE)

    print(f"Updated {changes} NEEDS_RECIPE_DESIGN entries with DONE status.")
    print(f"Resolved packages: {', '.join(sorted(resolved_set))}")
    unresolved = set(RESOLVED.keys()) - resolved_set
    if unresolved:
        print(f"NOT found in org file: {', '.join(sorted(unresolved))}")


if __name__ == "__main__":
    main()
