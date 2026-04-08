#!/usr/bin/env python3
"""
Deterministic update of todo_general_packages.org for recipe-resolver-260408w.
Updates NEEDS_RECIPE_DESIGN statuses for 30 packages.
"""
import shutil

TODO_FILE = "todo_general_packages.org"

# (last_status_line_num, new_status_text)
# Line numbers are 1-indexed; we insert AFTER that line.
updates = []

# Group 1: New recipes (25 packages resolved)
new_recipes = [
    (37298, "ttf-unifont", "font-unifont v17.0.03, GNU Unifont OTF from unifoundry.com"),
    (32257, "candy-icons-git", "candy-icons v0-0.7a29005, git icon theme from GitHub"),
    (32338, "sweet-folders-icons-git", "sweet-folders-icons v0-0.b2192ff, git icon theme from GitHub"),
    (26450, "dracula-icons-git", "dracula-icons v1.0.0-0.de2a8ed, git icon theme from GitHub"),
    (36710, "graphite-gtk-theme-git", "graphite-gtk-theme v2024-07-15, flat design GTK theme from GitHub"),
    (26495, "neowofetch-git", "neowofetch v2.0.5, system info shell script from hyfetch"),
    (26520, "sshcommand", "sshcommand v0.20.1, SSH thin client wrapper from GitHub"),
    (26929, "hosts-update", "hosts-update v1.38, hosts blocklist updater from GitHub"),
    (36566, "rclonefzf", "rclonefzf v1.0.19, interactive FZF frontend for rclone"),
    (37797, "fontpreview", "fontpreview v1.0.6, minimal font previewer shell script"),
    (27182, "bash-git-prompt", "bash-git-prompt v2.7.1, informative git prompt for bash"),
    (36542, "lore-cli-bin", "lore-cli-bin v0.1.13, pre-built Rust binary from GitHub"),
    (36548, "vex-tui-bin", "vex-tui-bin v2.0.2, pre-built Go binary from GitHub"),
    (36530, "ghk-bin", "ghk-bin v1.0.3, pre-built Go binary from GitHub"),
    (36506, "qo-bin", "qo-bin v0.4.0, pre-built Go binary from GitHub"),
    (36608, "kftui-bin", "kftui-bin v0.27.28, pre-built Rust binary from GitHub"),
    (53008, "simplex-chat-bin", "simplex-chat-bin v6.4.11, pre-built Haskell binary from GitHub"),
    (36572, "greenlight-bin", "greenlight-bin v2.4.1, Electron AppImage from GitHub"),
    (38550, "python-inplace", "python-inplace v1.0.1, Python library from PyPI"),
    (38922, "python-types-waitress", "python-types-waitress v3.0.1.20250801, typing stubs from PyPI"),
    (36590, "neovim-remote", "neovim-remote v2.5.1, Python tool from PyPI"),
    (36344, "dirsearch", "dirsearch v0.4.3, Python web scanner from PyPI"),
    (38328, "python-indexed-gzip", "python-indexed-gzip v1.10.3, Python+C library from PyPI"),
    (27042, "mpris-scrobbler", "mpris-scrobbler v0.5.7, C/meson source from sr.ht"),
    (5146, "apngasm", "apngasm v3.1.10, C++/cmake source from GitHub"),
]

for line_num, pkg, desc in new_recipes:
    status = (
        f"    - Status: DONE: NEEDS_RECIPE_DESIGN resolved — "
        f"recipe in recipe-resolver-260408w.scm ({desc})"
    )
    updates.append((line_num, status))

# Group 2: Re-evaluated -> BLOCKED (5 packages)
blocked_reevals = [
    (26605, "breeze-contrast-cursor-theme", "NO_STABLE_URL; opendesktop.org DNS unreachable, no mirror found"),
    (26577, "fortune-mod-hitchhiker", "MISSING_DEP; fortune-mod not packaged in Guix"),
    (26563, "fortune-mod-calvin", "MISSING_DEP; fortune-mod not packaged in Guix"),
    (26591, "fortune-mod-discworld", "MISSING_DEP; fortune-mod not packaged in Guix"),
    (36554, "data-peek-bin", "PROPRIETARY_NO_STABLE_URL; commercial product, no public download URL"),
]

for line_num, pkg, reason in blocked_reevals:
    status = (
        f"    - Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in "
        f"recipe-resolver-260408w; {reason}. See blocked-notes."
    )
    updates.append((line_num, status))

# Group 3: Graphite GTK theme variants resolved as compat aliases (24 extra)
graphite_variants = [
    (36620, "graphite-gtk-theme-wallpaper-git"),
    (36626, "graphite-gtk-theme-rimless-normal-git"),
    (36632, "graphite-gtk-theme-rimless-normal-compact-git"),
    (36638, "graphite-gtk-theme-rimless-git"),
    (36644, "graphite-gtk-theme-rimless-compact-git"),
    (36650, "graphite-gtk-theme-normal-git"),
    (36656, "graphite-gtk-theme-normal-compact-git"),
    (36662, "graphite-gtk-theme-nord-rimless-normal-git"),
    (36668, "graphite-gtk-theme-nord-rimless-normal-compact-git"),
    (36674, "graphite-gtk-theme-nord-rimless-git"),
    (36680, "graphite-gtk-theme-nord-rimless-compact-git"),
    (36686, "graphite-gtk-theme-nord-normal-git"),
    (36692, "graphite-gtk-theme-nord-normal-compact-git"),
    (36698, "graphite-gtk-theme-nord-git"),
    (36704, "graphite-gtk-theme-nord-compact-git"),
    (36716, "graphite-gtk-theme-compact-git"),
    (36722, "graphite-gtk-theme-black-rimless-normal-git"),
    (36728, "graphite-gtk-theme-black-rimless-normal-compact-git"),
    (36734, "graphite-gtk-theme-black-rimless-git"),
    (36740, "graphite-gtk-theme-black-rimless-compact-git"),
    (36746, "graphite-gtk-theme-black-normal-git"),
    (36752, "graphite-gtk-theme-black-normal-compact-git"),
    (36758, "graphite-gtk-theme-black-git"),
    (36764, "graphite-gtk-theme-black-compact-git"),
]

for line_num, variant in graphite_variants:
    status = (
        f"    - Status: DONE: NEEDS_RECIPE_DESIGN resolved — "
        f"compat alias {variant} -> graphite-gtk-theme in recipe-resolver-260408w.scm "
        f"(all Graphite variants use single upstream package)"
    )
    updates.append((line_num, status))

# Also resolve fontpreview-git as alias to fontpreview
updates.append((40152, (
    "    - Status: DONE: NEEDS_RECIPE_DESIGN resolved — "
    "compat alias fontpreview-git -> fontpreview in recipe-resolver-260408w.scm"
)))

# Sort by line number descending to insert from bottom to top
updates.sort(key=lambda x: x[0], reverse=True)

# Read the file
with open(TODO_FILE, 'r') as f:
    lines = f.readlines()

# Insert new status lines after the specified line numbers
for line_num, status_line in updates:
    idx = line_num  # Insert after the line (0-indexed: line_num is 1-indexed)
    lines.insert(idx, status_line + "\n")

# Write to temp file then atomic move
tmp = TODO_FILE + ".tmp"
with open(tmp, 'w') as f:
    f.writelines(lines)
shutil.move(tmp, TODO_FILE)

print(f"Updated {len(updates)} status lines in {TODO_FILE}")
print(f"  - {len(new_recipes)} new recipe resolutions")
print(f"  - {len(blocked_reevals)} blocked re-evaluations")
print(f"  - {len(graphite_variants)} graphite variant compat aliases")
print(f"  - 1 fontpreview-git compat alias")
