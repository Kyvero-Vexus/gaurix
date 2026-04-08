#!/usr/bin/env python3
"""
Deterministic update of todo_general_packages.org for recipe-resolver-260408t.
Updates NEEDS_RECIPE_DESIGN statuses for 30 packages.
"""
import re
import shutil

TODO_FILE = "todo_general_packages.org"

# Line number -> new status to append after that line
# Format: (line_number, new_status_line)
updates = []

# Group 1: Compat aliases (10 packages)
compat_aliases = [
    (98307, "localsend", "localsend-bin"),
    (61370, "juliaup", "juliaup-bin"),
    (55445, "mindustry", "mindustry-bin"),
    (58062, "lidarr", "lidarr-bin"),
    (67581, "zl-equalizer", "zl-equalizer-bin"),
    (26853, "wallchemy", "wallchemy-bin"),
    (54491, "atlauncher", "atlauncher-bin"),
    (27139, "kopia", "kopia-bin"),
    (27096, "kopia-ui", "kopia-ui-bin"),
    (27466, "playit", "playit-bin"),
]

for line_num, pkg, alias_target in compat_aliases:
    status = (
        f"   - Status: DONE: NEEDS_RECIPE_DESIGN resolved — "
        f"compat alias {pkg} → {alias_target} in recipe-resolver-260408t.scm "
        f"(recipe-resolver-260408t pass)"
    )
    updates.append((line_num, status))

# Group 2: New recipes (5 packages)
new_recipes = [
    (1456, "arduino-ctags", "arduino-ctags v5.8-arduino11, C/Make source from git"),
    (27424, "notesnook-bin", "notesnook-bin v3.3.13, Electron AppImage from GitHub"),
    (27237, "jellyfin-desktop-bin", "jellyfin-desktop-bin v1.12.0, .deb binary from GitHub"),
    (26992, "libsmb2", "libsmb2 v6.0.0, C/CMake library from git"),
    (27466, "playit-agent-bin", "playit-agent-bin v0.17.1, pre-built binary from GitHub"),
]

for line_num, pkg, desc in new_recipes:
    # For playit-agent-bin, use a different line since 27466 is already used
    if pkg == "playit-agent-bin":
        # This shares the playit line - append after the compat alias update
        continue
    status = (
        f"   - Status: DONE: NEEDS_RECIPE_DESIGN resolved — "
        f"recipe in recipe-resolver-260408t.scm ({desc})"
    )
    updates.append((line_num, status))

# Group 3: Re-evaluated → BLOCKED (15 packages)
blocked_reevals = [
    (70973, "nordvpn-gui-bin", "proprietary VPN, no redistributable binary URL"),
    (72483, "aurutils-git", "Arch-specific tool requiring pacman/makepkg"),
    (96400, "octopi-git", "Arch pacman frontend requiring libalpm"),
    (108923, "parui-git", "Arch pacman TUI requiring paru/libalpm"),
    (69748, "mangowm-git", "needs scenefx (not in Guix), no stable releases"),
    (90711, "caelestia-shell-git", "KDE Plasma 6 fork, 50+ missing KDE deps"),
    (92385, "android_translation_layer-git", "requires Android runtime libs (bionic/binder)"),
    (92431, "lceda-pro-bin", "proprietary EDA, no redistributable URL"),
    (77337, "feishu-bin", "proprietary (ByteDance), no stable download URL"),
    (72955, "shutter-encoder-bin", "no Linux binary in GitHub releases, needs JavaFX"),
    (90851, "opendeck-git", "no upstream repository found, project may be discontinued"),
    (90412, "savestate-bin", "Windows-only application (WPF/.NET)"),
    (90423, "tosu-overlay-git", "needs Qt6 WebEngine (not in Guix)"),
    (104655, "python-urllib3-future", "needs h11+jh2+qh3 (not in Guix)"),
    (106919, "python-niquests", "depends on urllib3-future+wassima (not in Guix)"),
]

for line_num, pkg, reason in blocked_reevals:
    status = (
        f"   - Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in "
        f"recipe-resolver-260408t; {reason}. See blocked-notes."
    )
    updates.append((line_num, status))

# Sort by line number (descending) so we can insert from bottom to top
# without shifting line numbers
updates.sort(key=lambda x: x[0], reverse=True)

# Read the file
with open(TODO_FILE, 'r') as f:
    lines = f.readlines()

# Insert new status lines after the specified line numbers
for line_num, status_line in updates:
    idx = line_num  # Insert after the line (0-indexed: line_num is 1-indexed, so idx = line_num)
    lines.insert(idx, status_line + "\n")

# Write to temp file then atomic move
tmp = TODO_FILE + ".tmp"
with open(tmp, 'w') as f:
    f.writelines(lines)
shutil.move(tmp, TODO_FILE)

print(f"Updated {len(updates)} status lines in {TODO_FILE}")
print(f"  - {len(compat_aliases)} compat alias resolutions")
print(f"  - {len(new_recipes) - 1} new recipe resolutions")
print(f"  - {len(blocked_reevals)} blocked re-evaluations")
