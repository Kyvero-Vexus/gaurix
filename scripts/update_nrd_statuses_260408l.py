#!/usr/bin/env python3
"""Update todo_general_packages.org for recipe-resolver-260408l pass.

Resolves 30 NEEDS_RECIPE_DESIGN packages:
- 10 new recipes (DONE)
- 20 re-evaluated with specific blocking reasons (BLOCKED)
"""

import re
import sys
import shutil
import tempfile
import os

TODO_FILE = "todo_general_packages.org"

# Package updates: (pkg_number, pkg_name, new_status_line, new_todo_status)
# For DONE packages (new recipes):
DONE_UPDATES = [
    (4453, "wafw00f",
     "   - Status: DONE: Recipe created in recipe-resolver-260408l.scm; pyproject-build-system Python WAF detection, v2.4.2 wafw00f."),
    (4843, "yamlfix",
     "   - Status: DONE: Recipe created in recipe-resolver-260408l.scm; pyproject-build-system Python YAML fixer, v1.19.1 yamlfix."),
    (4849, "pamix",
     "   - Status: DONE: Recipe created in recipe-resolver-260408l.scm; cmake-build-system C PulseAudio TUI mixer, v2.0 pamix."),
    (5009, "wb32-dfu-updater_cli-git",
     "   - Status: DONE: Recipe created in recipe-resolver-260408l.scm; cmake-build-system C USB DFU programmer, v1.0.0 wb32-dfu-updater."),
    (4238, "holyc-lang-git",
     "   - Status: DONE: Recipe created in recipe-resolver-260408l.scm; cmake-build-system C HolyC compiler, v0.0.10 holyc-lang."),
    (4485, "sdbus-cpp-basu-git",
     "   - Status: DONE: Recipe created in recipe-resolver-260408l.scm; cmake-build-system C++ D-Bus library, v2.2.1 sdbus-cpp."),
    (4823, "alacritty-use-theme-with-gnome-darkmode",
     "   - Status: DONE: Recipe created in recipe-resolver-260408l.scm; copy-build-system shell script, v1.0.0 alacritty GNOME darkmode theme switcher."),
    (4452, "sayonara-player",
     "   - Status: DONE: Recipe created in recipe-resolver-260408l.scm; cmake-build-system C++ Qt music player, v1.11.0-stable1 sayonara-player."),
    (4881, "mrboom",
     "   - Status: DONE: Recipe created in recipe-resolver-260408l.scm; gnu-build-system C Bomberman clone, v5.5 mrboom."),
    (5010, "pixelterm-c",
     "   - Status: DONE: Recipe created in recipe-resolver-260408l.scm; gnu-build-system C terminal image viewer, v1.7.20 pixelterm-c."),
]

# For BLOCKED packages (re-evaluated with specific blocking reasons):
BLOCKED_UPDATES = [
    (3765, "gtkhash-thunar",
     "   - Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260408l; gtkhash already in Guix (v0.9.8); -thunar variant needs inherit+modify from upstream. See blocked-notes."),
    (4337, "logiops-git",
     "   - Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260408l; C++20 cmake with ipcgull submodule dependency not in Guix. See blocked-notes."),
    (4929, "wleave",
     "   - Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260408l; Rust/Cargo with GTK4-rs crate dependency tree. See blocked-notes."),
    (4461, "libpurple-lurch-git",
     "   - Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260408l; requires libaxc (github.com/gkdr/axc) not in Guix. See blocked-notes."),
    (4268, "gittyup",
     "   - Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260408l; 8+ git submodules (libgit2, openssl, hunspell, etc.), complex unbundling. See blocked-notes."),
    (4200, "tacentview-git",
     "   - Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260408l; cmake FetchContent downloads tacent library at build time, needs unbundling. See blocked-notes."),
    (4202, "xviewer-plugins",
     "   - Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260408l; requires xviewer (Linux Mint) not in Guix. See blocked-notes."),
    (4260, "fulcrum",
     "   - Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260408l; uses qmake build system (not cmake), uncommon in Guix. See blocked-notes."),
    (4426, "adwaita-dark-darose",
     "   - Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260408l; AUR-only, no upstream repo; builds from gresource extraction of GTK3 themes. See blocked-notes."),
    (4842, "zgen-git",
     "   - Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260408l; abandoned project, maintainer recommends zgenom successor. See blocked-notes."),
    (4908, "virtnbdbackup",
     "   - Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260408l; requires python-libnbd and nbdkit not in Guix. See blocked-notes."),
    (5003, "pmb887x-emu-git",
     "   - Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260408l; embeds custom QEMU fork via ExternalProject_Add. See blocked-notes."),
    (5007, "pineapple-midi-player",
     "   - Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260408l; cmake FetchContent downloads PortAudio; Guix portaudio package very old. See blocked-notes."),
    (4980, "bitwarden-systemd",
     "   - Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260408l; systemd service files incompatible with Guix (uses Shepherd). See blocked-notes."),
    (4974, "memoria-ui",
     "   - Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260408l; UI needs memoria-daemon (Rust/Cargo with large dep tree). See blocked-notes."),
    (4975, "mistserver",
     "   - Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260408l; requires librist not in Guix. See blocked-notes."),
    (4930, "heidisql-qt6-git",
     "   - Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260408l; actually Pascal/Lazarus (not Qt6), Windows-oriented build. See blocked-notes."),
    (6109, "windows-10-cursor",
     "   - Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260408l; no LICENSE file in repo, cursor designs likely Microsoft-derived. See blocked-notes."),
    (4562, "katifetch",
     "   - Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260408l; no proper version tags, hobbyist project with no release discipline. See blocked-notes."),
    (4919, "libcryptui",
     "   - Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260408l; archived GNOME project from 2014, unmaintained. See blocked-notes."),
]

def update_todo_file():
    with open(TODO_FILE, 'r') as f:
        lines = f.readlines()

    all_updates = [(num, name, status, "DONE") for num, name, status in DONE_UPDATES] + \
                  [(num, name, status, "BLOCKED") for num, name, status in BLOCKED_UPDATES]

    changes_made = 0

    for pkg_num, pkg_name, new_status, new_todo_status in all_updates:
        # Find the heading line for this package
        heading_pattern = re.compile(rf'^\*\* (BLOCKED|DONE) {pkg_num}\. {re.escape(pkg_name)}\b')
        found = False

        for i, line in enumerate(lines):
            if heading_pattern.match(line.rstrip()):
                found = True
                # Update heading to new status
                old_heading = lines[i].rstrip()
                new_heading = re.sub(r'^\*\* (BLOCKED|DONE)', f'** {new_todo_status}', old_heading)
                lines[i] = new_heading + '\n'

                # Find and update TODO Status line
                for j in range(i+1, min(i+15, len(lines))):
                    if lines[j].strip().startswith('- TODO Status:'):
                        lines[j] = f'   - TODO Status: {new_todo_status}\n'
                        break
                    if lines[j].startswith('** '):
                        break

                # Insert new status line after the last Status line
                insert_pos = i + 1
                for j in range(i+1, min(i+15, len(lines))):
                    if lines[j].strip().startswith('- Status:'):
                        insert_pos = j + 1
                    if lines[j].startswith('** ') or lines[j].strip().startswith('- TODO Status:'):
                        break

                lines.insert(insert_pos, new_status + '\n')
                changes_made += 1
                print(f"  Updated #{pkg_num} {pkg_name} -> {new_todo_status}")
                break

        if not found:
            print(f"  WARNING: Could not find heading for #{pkg_num} {pkg_name}", file=sys.stderr)

    # Write atomically
    fd, tmp_path = tempfile.mkstemp(dir=os.path.dirname(TODO_FILE))
    try:
        with os.fdopen(fd, 'w') as f:
            f.writelines(lines)
        shutil.move(tmp_path, TODO_FILE)
    except:
        os.unlink(tmp_path)
        raise

    print(f"\nTotal changes: {changes_made}/30")
    return changes_made

if __name__ == '__main__':
    update_todo_file()
