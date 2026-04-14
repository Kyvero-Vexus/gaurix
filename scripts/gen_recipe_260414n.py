#!/usr/bin/env python3
"""Update todo_general_packages.org for recipe-resolver-260414n pass.

Adds status lines for 30 resolved packages (6 recipes + 24 EXHAUSTED).
Uses deterministic read-compute-write-temp-atomic-move pattern.
"""

import os
import sys
import tempfile
import shutil

TODO_FILE = "todo_general_packages.org"
RESOLVER_ID = "recipe-resolver-260414n"

# Packages with recipes (6)
RECIPES = {
    36510: ("prospect-mail", "DONE: NEEDS_RECIPE_DESIGN resolved — recipe in recipe-resolver-260414n.scm (prospect-mail-bin v1.2.1, Electron Outlook client AppImage, MIT)"),
    37508: ("pokeget", "DONE: NEEDS_RECIPE_DESIGN resolved — recipe in recipe-resolver-260414n.scm (pokeget-bin v1.6.7, terminal Pokemon sprite displayer binary, MIT)"),
    9650: ("xdelta3-cross-gui-bin", "DONE: NEEDS_RECIPE_DESIGN resolved — recipe in recipe-resolver-260414n.scm (xdelta3-cross-gui-bin v1.7.2, xDelta3 GUI AppImage, Apache-2.0)"),
    9951: ("blockbench-bin", "DONE: NEEDS_RECIPE_DESIGN resolved — recipe in recipe-resolver-260414n.scm (blockbench-bin v5.0.7, 3D model editor Electron binary, GPL-3.0)"),
    10330: ("green-tunnel-bin", "DONE: NEEDS_RECIPE_DESIGN resolved — recipe in recipe-resolver-260414n.scm (green-tunnel-bin v2.0.2, anti-censorship Electron binary, MIT)"),
    35813: ("djv", "DONE: NEEDS_RECIPE_DESIGN resolved — recipe in recipe-resolver-260414n.scm (djv v3.3.4, VFX media review software cmake source, BSD-3)"),
}

# Packages marked EXHAUSTED (24)
EXHAUSTED = {
    32978: ("invoiceninja", "BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — COMPLEX_DEPS: PHP/Laravel web app requiring LAMP stack; A1: 50+ PHP deps not in Guix; A2: container-only; A3: no binary release (recipe-resolver-260414n)"),
    32913: ("nicol", "BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — MISSING_GUIX_DEPS: Qt6 WebEngine browser; qtwebengine not in Guix Qt6; A1: qtwebengine missing; A2: qt5 API incompatible; A3: no alternative renderer (recipe-resolver-260414n)"),
    32880: ("obs-advanced-scene-switcher", "BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — COMPLEX_DEPS: OBS Studio plugin needing OBS SDK + Qt6 + libobs; A1: OBS SDK not in Guix; A2: binary ABI-coupled; A3: flatpak OBS includes it (recipe-resolver-260414n)"),
    32627: ("guiman", "BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — ARCH_SPECIFIC: Tauri Arch Linux package manager; depends on pacman/libalpm; A1: pacman useless on Guix; A2: Tauri needs Rust+Node+webkit2gtk; A3: Arch-only (recipe-resolver-260414n)"),
    32659: ("ledfx", "BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — COMPLEX_DEPS: Python LED controller with 30+ deps (aubio, pyaudio, sacn); A1: too many missing Python deps; A2: no binary; A3: pip violates isolation (recipe-resolver-260414n)"),
    32822: ("affine", "BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — COMPLEX_DEPS: Electron/Node.js block editor; yarn/turbo monorepo; A1: 500+ npm deps; A2: no AppImage; A3: Docker only (recipe-resolver-260414n)"),
    32846: ("kwin-effects-better-blur-dx-git", "BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — MISSING_GUIX_DEPS: KDE KWin effect plugin; needs kwin-dev/KDecoration2/KF6; A1: kwin-dev not in Guix; A2: ABI-coupled; A3: distribution-integrated (recipe-resolver-260414n)"),
    32948: ("rtw89-dkms-git", "BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — DKMS_UNSUPPORTED: Realtek WiFi kernel module; Guix uses declarative kernel config; A1: needs matching headers; A2: mainline includes rtw89 since 5.16; A3: enable in kernel config (recipe-resolver-260414n)"),
    30152: ("brow6el-git", "BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — COMPLEX_DEPS: CEF-based text browser; CEF is 300MB+ not in Guix; A1: massive dep; A2: alt renderer breaks core; A3: w3m/lynx/browsh in Guix (recipe-resolver-260414n)"),
    30170: ("nanocoder", "BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — NODE_ECOSYSTEM: npm code editor; A1: many transitive npm deps; A2: no standalone binary; A3: VS Code/Codium available in Guix (recipe-resolver-260414n)"),
    30208: ("vapoursynth-preview", "BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — COMPLEX_DEPS: Python VapourSynth GUI; needs VapourSynth (not in Guix) + PyQt5; A1: vapoursynth missing; A2: complex C++/Cython build; A3: no binary (recipe-resolver-260414n)"),
    30231: ("helion", "BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — DOTNET_UNSUPPORTED: C# Doom engine needing .NET 8+; A1: dotnet-sdk not in Guix; A2: no Linux binary; A3: GZDoom already in Guix (recipe-resolver-260414n)"),
    33155: ("keypunch-git", "BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — COMPLEX_DEPS: GNOME typing app; Rust/Meson/blueprint-compiler hybrid; A1: blueprint-compiler missing; A2: not standalone Rust; A3: Flatpak recommended (recipe-resolver-260414n)"),
    33165: ("apparmor.d-git", "BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — ARCH_SPECIFIC: AppArmor profiles for systemd distros; references /usr and systemd services; A1: non-functional on Guix; A2: different init system; A3: Guix own security model (recipe-resolver-260414n)"),
    33220: ("wivrn-full-git", "BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — COMPLEX_DEPS: wireless OpenXR VR runtime; Monado/OpenXR/Vulkan/20+ deps; A1: Monado not in Guix; A2: no binary; A3: SteamVR recommended (recipe-resolver-260414n)"),
    33287: ("syca", "BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — ARCH_SPECIFIC: Arch base-devel alternative; depends on pacman/makepkg; A1: pacman useless; A2: Arch-specific; A3: Guix has native build tools (recipe-resolver-260414n)"),
    33320: ("purple-gowhatsapp-git", "BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — COMPLEX_DEPS: Go WhatsApp libpurple plugin; 50+ Go modules + libpurple headers; A1: many Go deps; A2: ABI-coupled plugin; A3: mautrix-whatsapp bridge (recipe-resolver-260414n)"),
    35938: ("go-hass-agent", "BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — COMPLEX_DEPS: Go Home Assistant agent; 80+ Go modules + DBus/systemd/PulseAudio; A1: too many Go deps; A2: needs runtime services; A3: Flatpak available (recipe-resolver-260414n)"),
    36487: ("yufi", "BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — COMPLEX_DEPS: Rust+GTK4/Meson WiFi manager; needs cargo subproject + GTK4/libadwaita; A1: cargo integration; A2: not standalone Rust; A3: nm-applet in Guix (recipe-resolver-260414n)"),
    30436: ("open-webui-no-venv", "BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — COMPLEX_DEPS: Python LLM web UI + npm SvelteKit frontend; 100+ deps; A1: too many deps; A2: no binary; A3: Docker recommended by upstream (recipe-resolver-260414n)"),
    30267: ("ynote-desktop-bin", "BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — ELECTRON_EOL: Chinese cloud notes needing electron22 (EOL, not in Guix); proprietary service; A1: electron22 unavailable; A2: newer Electron breaks; A3: alternatives exist (recipe-resolver-260414n)"),
    31737: ("note-gen", "BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — COMPLEX_DEPS: Tauri note app needing Rust+Node.js dual build; A1: Tauri unsupported in Guix; A2: no Linux binary; A3: many alternative note apps (recipe-resolver-260414n)"),
    32137: ("gameoftrees", "BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — MISSING_GUIX_DEPS: OpenBSD VCS needing libretls (LibreSSL TLS); A1: openssl API incompatible; A2: libretls complex build; A3: Git already in Guix (recipe-resolver-260414n)"),
    32074: ("ipfs-desktop", "BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — COMPLEX_DEPS: Electron IPFS client needing npm/electron-builder; A1: full Node.js ecosystem; A2: no AppImage from upstream; A3: kubo CLI handles core IPFS (recipe-resolver-260414n)"),
}


def main():
    if not os.path.exists(TODO_FILE):
        print(f"Error: {TODO_FILE} not found", file=sys.stderr)
        sys.exit(1)

    with open(TODO_FILE, "r") as f:
        lines = f.readlines()

    updates = {}
    # Merge both dictionaries
    for approx_line, (pkg_name, status_text) in {**RECIPES, **EXHAUSTED}.items():
        updates[approx_line] = (pkg_name, status_text)

    # For each update, find the right insertion point
    insertions = []  # list of (line_index, text_to_insert)

    for approx_line, (pkg_name, status_text) in updates.items():
        # Search around the approximate line for the package heading
        search_start = max(0, approx_line - 10)
        search_end = min(len(lines), approx_line + 10)

        found_heading = None
        for i in range(search_start, search_end):
            line = lines[i]
            if pkg_name in line and ("** BLOCKED" in line or "** DONE" in line):
                found_heading = i
                break

        if found_heading is None:
            # Wider search
            search_start = max(0, approx_line - 30)
            search_end = min(len(lines), approx_line + 30)
            for i in range(search_start, search_end):
                line = lines[i]
                if pkg_name in line and ("** BLOCKED" in line or "** DONE" in line):
                    found_heading = i
                    break

        if found_heading is None:
            print(f"WARNING: Could not find heading for {pkg_name} near line {approx_line}", file=sys.stderr)
            continue

        # Find the end of this entry (next heading or next blank line before heading)
        insert_at = found_heading + 1
        while insert_at < len(lines):
            if lines[insert_at].startswith("** "):
                break
            insert_at += 1

        # Insert before the next heading (or at end), after the last content line
        # Back up to find the last non-blank line of this entry
        actual_insert = insert_at
        while actual_insert > found_heading + 1 and lines[actual_insert - 1].strip() == "":
            actual_insert -= 1

        is_recipe = approx_line in RECIPES
        if is_recipe:
            new_line = f"   - Status: {status_text}\n"
            new_todo = f"   - TODO Status: DONE\n"
            insertions.append((actual_insert, new_line + new_todo))
        else:
            new_line = f"   - Status: {status_text}\n"
            insertions.append((actual_insert, new_line))

    # Sort insertions by line number in reverse order to avoid offset issues
    insertions.sort(key=lambda x: x[0], reverse=True)

    for line_idx, text in insertions:
        lines.insert(line_idx, text)

    # Also update headings for recipe packages: change ** BLOCKED to ** DONE
    # We need to re-find them after insertions
    for approx_line, (pkg_name, _) in RECIPES.items():
        for i, line in enumerate(lines):
            if pkg_name in line and "** BLOCKED" in line:
                lines[i] = line.replace("** BLOCKED", "** DONE", 1)
                break

    # Write atomically
    fd, tmp_path = tempfile.mkstemp(dir=".", suffix=".org.tmp")
    try:
        with os.fdopen(fd, "w") as f:
            f.writelines(lines)
        shutil.move(tmp_path, TODO_FILE)
        print(f"Updated {TODO_FILE} with {len(insertions)} status entries")
    except Exception:
        os.unlink(tmp_path)
        raise


if __name__ == "__main__":
    main()
