#!/usr/bin/env python3
"""
Update todo_general_packages.org with status changes for 30 packages
processed in recipe-resolver-260415e.

Reads the file line-by-line, applies all changes, writes to a temp file,
and atomically moves it back.
"""

import os
import re
import tempfile
import shutil

TODO_FILE = "/home/slime/projects/gaurix/todo_general_packages.org"

# Each entry: (pkg_number, pkg_name_fragment, approx_line, new_status_text)
UPDATES = [
    # 12 RESOLVED packages
    (1059, "hardinfo2-git", 8121,
     "   - Status: DONE: NEEDS_RECIPE_DESIGN resolved — recipe in recipe-resolver-260415e.scm (hardinfo2 v2.2.16, system info/benchmark tool, cmake-build-system, GPL-2.0+)"),
    (13857, "ssh-studio", 103866,
     "   - Status: DONE: NEEDS_RECIPE_DESIGN resolved — recipe in recipe-resolver-260415e.scm (ssh-studio v1.3.1, SSH connection manager GTK4, meson-build-system, GPL-3.0+)"),
    (11830, "hyprqt6engine", 87840,
     "   - Status: DONE: NEEDS_RECIPE_DESIGN resolved — recipe in recipe-resolver-260415e.scm (hyprqt6engine v0.1.0, Qt6 theme plugin for Hyprland, cmake-build-system, BSD-3)"),
    (13871, "haskell-unix", 103965,
     "   - Status: DONE: NEEDS_RECIPE_DESIGN resolved — recipe in recipe-resolver-260415e.scm (ghc-unix-compat v2.8.5.1, POSIX compat layer, haskell-build-system, BSD-3)"),
    (10787, "crqt-ng", 79942,
     "   - Status: DONE: NEEDS_RECIPE_DESIGN resolved — recipe in recipe-resolver-260415e.scm (crqt-ng v1.0.15 + crengine-ng v0.9.11 dep, Qt6 e-book reader, cmake-build-system, GPL-2.0+)"),
    (13895, "git-series-git", 104136,
     "   - Status: DONE: NEEDS_RECIPE_DESIGN resolved — recipe in recipe-resolver-260415e.scm (git-series v0.9.1, patch series tracker, gnu-build-system, MIT)"),
    (8384, "wlr-which-key", 64579,
     "   - Status: DONE: NEEDS_RECIPE_DESIGN resolved — binary recipe in recipe-resolver-260415e.scm (wlr-which-key-bin v1.3.0, wlroots keymap manager, copy-build-system, GPL-3.0)"),
    (13877, "manaverse-sdl2-git", 104009,
     "   - Status: DONE: NEEDS_RECIPE_DESIGN resolved — recipe in recipe-resolver-260415e.scm (manaverse-sdl2 v2.1.3.17, MMORPG client SDL2, cmake-build-system, GPL-2.0+)"),
    (13878, "manaverse-git", 104016,
     "   - Status: DONE: NEEDS_RECIPE_DESIGN resolved — covered by manaverse-sdl2 recipe in recipe-resolver-260415e.scm (SDL2 variant preferred over deprecated SDL1)"),
    (7521, "karp-git", 58344,
     "   - Status: DONE: NEEDS_RECIPE_DESIGN resolved — recipe in recipe-resolver-260415e.scm (karp v0.2.0, KDE PDF editor, cmake-build-system, GPL-2.0+)"),
    (13171, "calculix-ccx", 98405,
     "   - Status: DONE: NEEDS_RECIPE_DESIGN resolved — already in recipe-resolver-260414ab.scm (calculix-ccx v2.23 + spooles dep, FEA solver, gnu-build-system, GPL-2.0+) (recipe-resolver-260415e)"),
    (1080, "obexftp", 8297,
     "   - Status: DONE: NEEDS_RECIPE_DESIGN resolved — already in recipe-resolver-260414ab.scm; no new recipe needed (recipe-resolver-260415e)"),

    # 18 EXHAUSTED packages
    (11788, "pamac-aur", 87530,
     "   - Status: BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — ARCH_SPECIFIC: Manjaro/Arch package manager; depends on libalpm/pacman; A1: pacman not in Guix; A2: reimplementation impractical; A3: zero Guix utility (recipe-resolver-260415e)"),
    (13863, "untmp", 103908,
     "   - Status: BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — DISTRO_SPECIFIC: tmplinux container tool; depends on arch-install-scripts + systemd-nspawn; A1: Arch tools not in Guix; A2: systemd-nspawn not available; A3: Guix has native containers (recipe-resolver-260415e)"),
    (13864, "tmpsuse", 103915,
     "   - Status: BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — DISTRO_SPECIFIC: tmplinux container tool; depends on zypper + systemd-nspawn; A1: zypper not in Guix; A2: systemd-nspawn not available; A3: Guix has native containers (recipe-resolver-260415e)"),
    (13865, "tmpstali", 103922,
     "   - Status: BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — DISTRO_SPECIFIC: tmplinux container tool; depends on systemd-nspawn; A1: systemd-nspawn not available; A2: complete rewrite needed; A3: Guix has native containers (recipe-resolver-260415e)"),
    (13867, "tmpgentoo", 103937,
     "   - Status: BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — DISTRO_SPECIFIC: tmplinux container tool; depends on systemd-nspawn; A1: systemd-nspawn not available; A2: complete rewrite needed; A3: Guix has native containers (recipe-resolver-260415e)"),
    (13889, "deepin-wine10-stable", 104093,
     "   - Status: BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — PROPRIETARY_BINARY: Deepin Wine 10 fork; A1: source not public with patches; A2: proprietary license; A3: upstream Wine already in Guix (recipe-resolver-260415e)"),
    (11823, "linuxqq-nt-bwrap", 87793,
     "   - Status: BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — PROPRIETARY: Tencent QQ messenger; proprietary binary + custom license; A1: no source available; A2: license prohibits redistribution; A3: no open QQ client exists (recipe-resolver-260415e)"),
    (11725, "wechat-universal-bwrap", 87063,
     "   - Status: BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — PROPRIETARY: Tencent WeChat; proprietary binary + custom license; A1: no source available; A2: license prohibits redistribution; A3: Matrix bridge as alternative (recipe-resolver-260415e)"),
    (13896, "astral-bin", 104143,
     "   - Status: BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — NON_FREE_LICENSE: CC-BY-NC-ND 4.0 license; A1: non-commercial restriction; A2: no-derivatives restriction; A3: use WireGuard as open VPN alternative (recipe-resolver-260415e)"),
    (13884, "danxi", 104058,
     "   - Status: BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — FLUTTER_UNSUPPORTED: Dart/Flutter app; Guix lacks Flutter SDK; A1: Flutter SDK massive toolchain; A2: no Linux binary releases; A3: niche campus app (recipe-resolver-260415e)"),
    (13851, "deemix-gui", 103824,
     "   - Status: BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — ELECTRON_APP: Electron music downloader; A1: npm/webpack build infeasible in Guix; A2: Electron binary 1GB+; A3: use yt-dlp CLI alternative (recipe-resolver-260415e)"),
    (10658, "rancher-desktop", 78964,
     "   - Status: BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — ELECTRON_COMPLEX: Electron+Go Kubernetes tool; A1: npm+Go hybrid build; A2: bundles K3s/containerd/QEMU; A3: use kubectl/helm/k3s separately (recipe-resolver-260415e)"),
    (13929, "firefox-nightly-i18n-pt-br", 104381,
     "   - Status: BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — NIGHTLY_UNSTABLE: Firefox Nightly lang pack; A1: version changes daily; A2: depends on firefox-nightly not in Guix; A3: Guix IceCat has own i18n (recipe-resolver-260415e)"),
    (13920, "lib32-libxml2-legacy", 104316,
     "   - Status: BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — MULTILIB_UNSUPPORTED: 32-bit legacy libxml2; A1: Guix has no lib32 convention; A2: libxml2 already in Guix; A3: orphaned in AUR (recipe-resolver-260415e)"),
    (10708, "editcp", 79337,
     "   - Status: BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — GO_QT_COMPLEX: Go+Qt5 ham radio tool; A1: therecipe/qt needs full Qt5+CGo; A2: qt5-webengine massive; A3: unmaintained since 2022 (recipe-resolver-260415e)"),
    (8388, "ags-hyprpanel-git", 64611,
     "   - Status: BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — HYPRLAND_ECOSYSTEM: Hyprland panel; A1: AGS+libastal (10+ libs) not in Guix; A2: npm/TypeScript build; A3: no stable releases (recipe-resolver-260415e)"),
    (7528, "mealie", 58393,
     "   - Status: BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — NPM_COMPLEX: Python+Nuxt.js recipe manager; A1: frontend needs npm build; A2: Docker-only distribution; A3: no standalone binary (recipe-resolver-260415e)"),
    (11711, "sonic-desktop-interface", 86965,
     "   - Status: BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — KDE_FORK_COMPLEX: KDE Plasma fork; A1: conflicts with plasma-desktop; A2: 60+ deps + custom forks; A3: new project (Dec 2025), sustainability uncertain (recipe-resolver-260415e)"),
]


def main():
    # Build a lookup: pkg_number -> list of (approx_line, new_status)
    # We use a list because a number could theoretically appear multiple times
    # in our update list (it won't here, but be safe).
    updates_by_num = {}
    for pkg_num, pkg_name, approx_line, new_status in UPDATES:
        updates_by_num.setdefault(pkg_num, []).append(
            (approx_line, pkg_name, new_status)
        )

    # Regex to match header lines like: ** BLOCKED 1059. hardinfo2-git
    header_re = re.compile(r'^\*\*\s+\S+\s+(\d+)\.\s+(.+)$')
    # Regex to match Status lines
    status_re = re.compile(r'^\s+-\s+(Status|TODO Status):')
    # Regex to match a new section header
    new_section_re = re.compile(r'^\*\*\s+')

    # First pass: read the file and find all candidate header lines for each pkg_num
    # Store: pkg_num -> list of (line_number_0based, line_text)
    candidate_headers = {}
    print(f"Reading {TODO_FILE}...")
    with open(TODO_FILE, 'r') as f:
        for line_idx, line in enumerate(f):
            m = header_re.match(line.rstrip('\n'))
            if m:
                num = int(m.group(1))
                if num in updates_by_num:
                    candidate_headers.setdefault(num, []).append(line_idx)

    # For each update, pick the header line closest to approx_line
    # Result: set of 0-based line indices that are target headers
    # and mapping from that line index to the new status to insert
    insert_after_header = {}  # header_line_idx -> new_status_text
    for pkg_num, entries in updates_by_num.items():
        for approx_line, pkg_name, new_status in entries:
            approx_idx = approx_line - 1  # convert to 0-based
            candidates = candidate_headers.get(pkg_num, [])
            if not candidates:
                print(f"  WARNING: No header found for #{pkg_num} ({pkg_name})")
                continue
            # Pick closest
            best = min(candidates, key=lambda idx: abs(idx - approx_idx))
            insert_after_header[best] = (pkg_num, pkg_name, new_status)
            print(f"  Found #{pkg_num} ({pkg_name}) at line {best + 1} (approx {approx_line})")

    if not insert_after_header:
        print("No updates to apply!")
        return

    # Second pass: read file, find the last Status line in each target section,
    # and insert the new status after it.
    # We process line by line for memory efficiency.
    print(f"\nApplying {len(insert_after_header)} updates...")

    # We need to track state: are we inside a target section?
    # If so, track the last Status line index.
    in_target_section = False
    current_target_header_idx = None
    last_status_line_idx = None

    # We'll do this in two sub-passes:
    # Sub-pass 1: For each target header, find the line index of the last Status line
    insert_points = {}  # header_line_idx -> last_status_line_idx

    with open(TODO_FILE, 'r') as f:
        for line_idx, line in enumerate(f):
            stripped = line.rstrip('\n')

            if in_target_section:
                # Check if we've hit a new section
                if new_section_re.match(stripped) and line_idx != current_target_header_idx:
                    # End of target section
                    if last_status_line_idx is not None:
                        insert_points[current_target_header_idx] = last_status_line_idx
                    else:
                        print(f"  WARNING: No Status line found for header at line {current_target_header_idx + 1}")
                    in_target_section = False
                    # Check if this new header is also a target
                    if line_idx in insert_after_header:
                        in_target_section = True
                        current_target_header_idx = line_idx
                        last_status_line_idx = None
                else:
                    # Check for Status line
                    if status_re.match(stripped):
                        last_status_line_idx = line_idx

            # Check if this line is a target header (and we're not already tracking it)
            if not in_target_section and line_idx in insert_after_header:
                in_target_section = True
                current_target_header_idx = line_idx
                last_status_line_idx = None

    # Handle the last section if file ends while in a target
    if in_target_section and last_status_line_idx is not None:
        insert_points[current_target_header_idx] = last_status_line_idx

    # Now build a mapping: line_idx_after_which_to_insert -> new_status_text
    insertions = {}  # last_status_line_idx -> new_status_text
    for header_idx, last_status_idx in insert_points.items():
        pkg_num, pkg_name, new_status = insert_after_header[header_idx]
        insertions[last_status_idx] = new_status
        print(f"  #{pkg_num} ({pkg_name}): inserting after line {last_status_idx + 1}")

    # Check for any headers we didn't find insert points for
    for header_idx in insert_after_header:
        if header_idx not in insert_points:
            pkg_num, pkg_name, _ = insert_after_header[header_idx]
            print(f"  WARNING: Could not find insertion point for #{pkg_num} ({pkg_name}) at header line {header_idx + 1}")

    # Final pass: write output with insertions
    dir_name = os.path.dirname(TODO_FILE)
    fd, tmp_path = tempfile.mkstemp(dir=dir_name, suffix='.org.tmp')
    try:
        with os.fdopen(fd, 'w') as out_f:
            with open(TODO_FILE, 'r') as in_f:
                for line_idx, line in enumerate(in_f):
                    out_f.write(line)
                    if line_idx in insertions:
                        out_f.write(insertions[line_idx] + '\n')

        # Preserve permissions
        st = os.stat(TODO_FILE)
        os.chmod(tmp_path, st.st_mode)

        # Atomic move
        shutil.move(tmp_path, TODO_FILE)
        print(f"\nDone! Atomically updated {TODO_FILE}")
        print(f"Total insertions: {len(insertions)}")
    except:
        # Clean up temp file on error
        if os.path.exists(tmp_path):
            os.unlink(tmp_path)
        raise


if __name__ == '__main__':
    main()
