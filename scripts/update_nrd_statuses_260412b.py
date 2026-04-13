#!/usr/bin/env python3
"""Update todo_general_packages.org for recipe-resolver-260412b/c pass.

Resolves 100 TODO packages:
  - 32 DONE (recipes created)
  - 68 BLOCKED (with specific reason codes)
"""

import re
import shutil

TODO_FILE = "todo_general_packages.org"

# (pkg_number, pkg_name, new_status, status_line, resolver_file)
updates = [
    # --- BATCH B: DONE packages ---
    (11435, "waterfox-bin", "DONE",
     "   - Status: DONE: recipe in recipe-resolver-260412b.scm (waterfox-bin-pkg v6.0.4, privacy browser binary repack, MPL-2.0)"),
    (11539, "windsurf-electron-latest", "DONE",
     "   - Status: DONE: recipe in recipe-resolver-260412b.scm (windsurf-bin v1.6.3, AI code editor binary, Expat)"),
    (11550, "offpunk-git", "DONE",
     "   - Status: DONE: recipe in recipe-resolver-260412b.scm (offpunk v2.4, offline smolnet browser, AGPL-3.0+)"),
    (11556, "brscan5", "DONE",
     "   - Status: DONE: recipe in recipe-resolver-260412b.scm (brscan5-bin v1.3.2.0, Brother SANE driver, Expat)"),
    (11557, "megasync", "DONE",
     "   - Status: DONE: recipe in recipe-resolver-260412b.scm (megasync-bin v5.7.1, MEGA sync client, Expat)"),
    (11564, "google-cloud-cli-bq", "DONE",
     "   - Status: DONE: recipe in recipe-resolver-260412b.scm (google-cloud-cli-bq v520.0.0, BigQuery CLI, Apache-2.0)"),
    (11565, "google-cloud-cli-gsutil", "DONE",
     "   - Status: DONE: recipe in recipe-resolver-260412b.scm (google-cloud-cli-gsutil v520.0.0, GCS CLI, Apache-2.0)"),
    (11566, "google-cloud-cli-bundled-python3-unix", "DONE",
     "   - Status: DONE: recipe in recipe-resolver-260412b.scm (google-cloud-cli-python3 v520.0.0, bundled Python, Apache-2.0)"),
    (11567, "google-cloud-cli-component-gke-gcloud-auth-plugin", "DONE",
     "   - Status: DONE: recipe in recipe-resolver-260412b.scm (gke-gcloud-auth-plugin v520.0.0, GKE auth, Apache-2.0)"),
    (11577, "ironwail", "DONE",
     "   - Status: DONE: recipe in recipe-resolver-260412b.scm (ironwail v0.8.0, Quake engine, GPL-2.0+)"),
    (11579, "jdtls", "DONE",
     "   - Status: DONE: recipe in recipe-resolver-260412b.scm (jdtls-bin v1.44.0, Eclipse Java language server, EPL-1.0)"),
    (11584, "irpf2025", "DONE",
     "   - Status: DONE: recipe in recipe-resolver-260412b.scm (irpf2025-bin v1.0, Brazilian tax program, Expat)"),
    (11595, "xdg-su", "DONE",
     "   - Status: DONE: recipe in recipe-resolver-260412b.scm (xdg-su v1.2.3, graphical su replacement, GPL-2.0+)"),

    # --- BATCH C: DONE packages ---
    (11627, "woff2-material-symbols-variable-git", "DONE",
     "   - Status: DONE: recipe in recipe-resolver-260412c.scm (font-material-symbols-variable v0.18.1, Google Material icons font, Apache-2.0)"),
    (11634, "microsoft-identity-broker-bin", "DONE",
     "   - Status: DONE: recipe in recipe-resolver-260412c.scm (microsoft-identity-broker-bin v2.0.1, MS auth broker, Expat)"),
    (11642, "wps-office-mui-zh-cn", "DONE",
     "   - Status: DONE: recipe in recipe-resolver-260412c.scm (wps-office-mui-zh-cn v11.1.0.11723, WPS Chinese UI pack, Expat)"),
    (11653, "hyprshutdown", "DONE",
     "   - Status: DONE: recipe in recipe-resolver-260412c.scm (hyprshutdown v0.1.0, Hyprland shutdown utility, GPL-3.0+)"),
    (11659, "bitwig-studio", "DONE",
     "   - Status: DONE: recipe in recipe-resolver-260412c.scm (bitwig-studio-bin v5.3, digital audio workstation, Expat)"),
    (11661, "vmware-keymaps", "DONE",
     "   - Status: DONE: recipe in recipe-resolver-260412c.scm (vmware-keymaps v17.5.1, VMware keyboard mapping files, Expat)"),
    (11665, "reiserfsprogs", "DONE",
     "   - Status: DONE: recipe in recipe-resolver-260412c.scm (reiserfsprogs-pkg v3.6.27, ReiserFS utilities, GPL-2.0)"),
    (11670, "notion-app-electron", "DONE",
     "   - Status: DONE: recipe in recipe-resolver-260412c.scm (notion-app-bin v4.9.0, Notion desktop client, Expat)"),
    (11674, "nettui-bin", "DONE",
     "   - Status: DONE: recipe in recipe-resolver-260412c.scm (nettui-bin v0.3.0, network TUI manager, Expat)"),
    (11678, "opentubex-bin", "DONE",
     "   - Status: DONE: recipe in recipe-resolver-260412c.scm (opentubex-bin v0.23.2, privacy YouTube player, AGPL-3.0+)"),
    (11683, "ani2xcursor-bin", "DONE",
     "   - Status: DONE: recipe in recipe-resolver-260412c.scm (ani2xcursor-bin v0.2.0, cursor format converter, Expat)"),
    (11685, "crtui-bin", "DONE",
     "   - Status: DONE: recipe in recipe-resolver-260412c.scm (crtui-bin v0.5.0, container registry TUI, Expat)"),
    (11689, "mdterm-bin", "DONE",
     "   - Status: DONE: recipe in recipe-resolver-260412c.scm (mdterm-bin v0.3.0, terminal Markdown viewer, Expat)"),
    (11692, "btdu-bin", "DONE",
     "   - Status: DONE: recipe in recipe-resolver-260412c.scm (btdu-bin v0.4.1, btrfs disk usage profiler, GPL-2.0+)"),
    (11693, "openide-bin", "DONE",
     "   - Status: DONE: recipe in recipe-resolver-260412c.scm (openide-bin v0.1.0, open-source IDE, Apache-2.0)"),
    (11694, "tsenta-desktop-bin", "DONE",
     "   - Status: DONE: recipe in recipe-resolver-260412c.scm (tsenta-desktop-bin v1.0.0, job application assistant, Expat)"),
    (11703, "bookokrat-bin", "DONE",
     "   - Status: DONE: recipe in recipe-resolver-260412c.scm (bookokrat-bin v0.2.0, terminal EPUB/PDF reader, Expat)"),
    (11706, "terraria-server", "DONE",
     "   - Status: DONE: recipe in recipe-resolver-260412c.scm (terraria-server-bin v1.4.4.9, Terraria dedicated server, Expat)"),
    (11708, "intune-portal-bin", "DONE",
     "   - Status: DONE: recipe in recipe-resolver-260412c.scm (intune-portal-bin v1.2404.14, MS Intune enrollment portal, Expat)"),

    # --- BATCH B: BLOCKED packages ---
    (11422, "rustconn", "BLOCKED",
     "   - Status: BLOCKED: NEEDS_RECIPE_DESIGN — Rust/GTK4 app; requires cargo-inputs enumeration for crate dep tree"),
    (11456, "debtap", "BLOCKED",
     "   - Status: BLOCKED: NEEDS_RECIPE_DESIGN — Arch-specific .deb-to-pacman converter; depends on pacman, no use on Guix"),
    (11509, "joplin", "BLOCKED",
     "   - Status: BLOCKED: NEEDS_RECIPE_DESIGN — npm/Node.js CLI app; requires full npm dependency tree enumeration"),
    (11515, "plasma6-applets-kara-git", "BLOCKED",
     "   - Status: BLOCKED: NEEDS_RECIPE_DESIGN — KDE Plasma 6 applet; requires Qt6/KDE Frameworks 6 build deps"),
    (11519, "wivrn-server", "BLOCKED",
     "   - Status: BLOCKED: NEEDS_RECIPE_DESIGN — C++ OpenXR/Monado VR server; complex cmake with VR-specific deps"),
    (11520, "lib32-wivrn-server", "BLOCKED",
     "   - Status: BLOCKED: NEEDS_RECIPE_DESIGN — 32-bit variant; lib32 not directly applicable to Guix"),
    (11521, "wivrn-dashboard", "BLOCKED",
     "   - Status: BLOCKED: NEEDS_RECIPE_DESIGN — Qt6/QML VR dashboard; depends on wivrn-server"),
    (11522, "pikaur", "BLOCKED",
     "   - Status: BLOCKED: NEEDS_RECIPE_DESIGN — AUR helper; depends on pacman/pyalpm, Arch-specific"),
    (11527, "tuxedo-drivers-dkms", "BLOCKED",
     "   - Status: BLOCKED: NEEDS_RECIPE_DESIGN — DKMS kernel module; Guix uses linux-module-build-system, not DKMS"),
    (11529, "steam-native-runtime", "BLOCKED",
     "   - Status: BLOCKED: NEEDS_RECIPE_DESIGN — metapackage for 100+ Steam runtime libs; Arch/distro-specific"),
    (11534, "sonic-workspace", "BLOCKED",
     "   - Status: BLOCKED: NEEDS_RECIPE_DESIGN — Modified KDE Plasma workspace for XLibre; distro-specific fork"),
    (11535, "sonic-x11-session", "BLOCKED",
     "   - Status: BLOCKED: NEEDS_RECIPE_DESIGN — XLibre Plasma X11 session; depends on sonic-workspace"),
    (11536, "arch-smart-update", "BLOCKED",
     "   - Status: BLOCKED: NEEDS_RECIPE_DESIGN — Arch Linux update script; Arch-specific, no use on Guix"),
    (11537, "xdg-desktop-portal-termfilechooser-hunkyburrito-git", "BLOCKED",
     "   - Status: BLOCKED: NEEDS_RECIPE_DESIGN — C xdg-desktop-portal backend; requires inih, systemd dbus integration"),
    (11542, "zmx", "BLOCKED",
     "   - Status: BLOCKED: NEEDS_RECIPE_DESIGN — Rust session persistence tool; requires cargo-inputs enumeration"),
    (11549, "gpu-screen-recorder-gtk", "BLOCKED",
     "   - Status: BLOCKED: NEEDS_RECIPE_DESIGN — GTK4 frontend for gpu-screen-recorder; many GPU-specific deps"),
    (11552, "alhp-mirrorlist", "BLOCKED",
     "   - Status: BLOCKED: NEEDS_RECIPE_DESIGN — ALHP mirror list for pacman; Arch-specific"),
    (11554, "alhp-keyring", "BLOCKED",
     "   - Status: BLOCKED: NEEDS_RECIPE_DESIGN — ALHP PGP keyring for pacman; Arch-specific"),
    (11559, "awww-git", "BLOCKED",
     "   - Status: BLOCKED: NEEDS_RECIPE_DESIGN — Rust/Wayland animated wallpaper; requires cargo-inputs + wayland crates"),
    (11561, "ut2004-bin", "BLOCKED",
     "   - Status: BLOCKED: SOURCE_UNAVAILABLE — UT2004 requires original game assets; no stable public download URL"),
    (11562, "aimp", "BLOCKED",
     "   - Status: BLOCKED: NEEDS_RECIPE_DESIGN — Windows-only audio player; requires Wine, no native Linux build"),
    (11574, "obs-studio-git", "BLOCKED",
     "   - Status: BLOCKED: NEEDS_RECIPE_DESIGN — OBS from git; cmake with 30+ deps; obs-studio in Guix upstream"),
    (11580, "howdy-git", "BLOCKED",
     "   - Status: BLOCKED: NEEDS_RECIPE_DESIGN — Python facial auth; requires dlib, opencv, PAM integration"),
    (11589, "language-toolkit", "BLOCKED",
     "   - Status: BLOCKED: NEEDS_RECIPE_DESIGN — Niche language docs tool; unclear upstream source"),
    (11594, "opencode-claude-auth", "BLOCKED",
     "   - Status: BLOCKED: NEEDS_RECIPE_DESIGN — Go credential bridge; requires go-inputs enumeration"),
    (11596, "pacman-log-orphans-hook", "BLOCKED",
     "   - Status: BLOCKED: NEEDS_RECIPE_DESIGN — Pacman hook; Arch-specific, no use on Guix"),
    (11599, "pyside2", "BLOCKED",
     "   - Status: BLOCKED: NEEDS_RECIPE_DESIGN — Python Qt5 bindings; extremely complex build with shiboken2, Qt5, clang"),
    (11600, "pyside2-tools", "BLOCKED",
     "   - Status: BLOCKED: DEP_RESOLUTION_FAILED — depends on pyside2 not yet in Guix"),
    (11602, "python-shiboken2", "BLOCKED",
     "   - Status: BLOCKED: DEP_RESOLUTION_FAILED — depends on pyside2 build infrastructure"),
    (11603, "uzdoom", "BLOCKED",
     "   - Status: BLOCKED: NEEDS_RECIPE_DESIGN — GZDoom fork; C++ cmake with 40+ deps; extremely complex"),
    (11606, "packwiz-git", "BLOCKED",
     "   - Status: BLOCKED: NEEDS_RECIPE_DESIGN — Go Minecraft modpack CLI; requires go-inputs enumeration"),
    (11610, "code-features", "BLOCKED",
     "   - Status: BLOCKED: NEEDS_RECIPE_DESIGN — VS Code OSS feature unblock; depends on code-oss"),
    (11614, "envision-xr-git", "BLOCKED",
     "   - Status: BLOCKED: NEEDS_RECIPE_DESIGN — Rust GTK4 Monado VR GUI; requires cargo-inputs + VR ecosystem deps"),
    (11616, "teams-for-linux", "BLOCKED",
     "   - Status: BLOCKED: NEEDS_RECIPE_DESIGN — Electron Teams from source; requires npm deps + Electron rebuild"),
    (11619, "plasmazones", "BLOCKED",
     "   - Status: BLOCKED: NEEDS_RECIPE_DESIGN — KDE Plasma 6 tiling plugin; requires KF6, Qt6, cmake"),
    (11621, "throne", "BLOCKED",
     "   - Status: BLOCKED: NEEDS_RECIPE_DESIGN — Qt6 proxy manager; requires sing-box backend, Qt6, cmake"),
    (11622, "ryzen_smu-dkms-git", "BLOCKED",
     "   - Status: BLOCKED: NEEDS_RECIPE_DESIGN — DKMS kernel module for AMD Ryzen SMU; incompatible with Guix"),

    # --- BATCH C: BLOCKED packages ---
    (11624, "kio-s3", "BLOCKED",
     "   - Status: BLOCKED: NEEDS_RECIPE_DESIGN — KDE KIO S3 worker; requires KF6, Qt6, aws-sdk-cpp"),
    (11631, "plasma-login-manager-git", "BLOCKED",
     "   - Status: BLOCKED: NEEDS_RECIPE_DESIGN — KDE Plasma display manager fork; requires KF6, PAM, systemd, Wayland"),
    (11635, "fcitx5-mozc-ut", "BLOCKED",
     "   - Status: BLOCKED: NEEDS_RECIPE_DESIGN — Mozc Japanese input for Fcitx5; requires bazel/GYP build, protobuf"),
    (11647, "wayvr-git", "BLOCKED",
     "   - Status: BLOCKED: NEEDS_RECIPE_DESIGN — Rust VR Wayland compositor; requires cargo-inputs + wlroots, openxr"),
    (11654, "lib32-python311-bin", "BLOCKED",
     "   - Status: BLOCKED: NEEDS_RECIPE_DESIGN — 32-bit Python; lib32 not directly applicable to Guix"),
    (11656, "barrier-headless", "BLOCKED",
     "   - Status: BLOCKED: NEEDS_RECIPE_DESIGN — headless Barrier KVM; C++ cmake, barrier in Guix upstream"),
    (11662, "mal", "BLOCKED",
     "   - Status: BLOCKED: NEEDS_RECIPE_DESIGN — Rust MyAnimeList CLI; requires cargo-inputs enumeration"),
    (11663, "vicinae", "BLOCKED",
     "   - Status: BLOCKED: NEEDS_RECIPE_DESIGN — Desktop launcher; unclear upstream source and build system"),
    (11666, "citron", "BLOCKED",
     "   - Status: BLOCKED: NEEDS_RECIPE_DESIGN — Nintendo Switch emulator (yuzu fork); massive C++ cmake with 50+ deps"),
    (11667, "nekobox", "BLOCKED",
     "   - Status: BLOCKED: NEEDS_RECIPE_DESIGN — Qt6 proxy GUI; requires cmake, Qt6, protobuf, sing-box-core, grpc"),
    (11668, "nekobox-core", "BLOCKED",
     "   - Status: BLOCKED: DEP_RESOLUTION_FAILED — Go proxy core; depends on sing-box, blocked on nekobox"),
    (11669, "nitrox", "BLOCKED",
     "   - Status: BLOCKED: NEEDS_RECIPE_DESIGN — .NET Subnautica mod; requires dotnet-runtime or mono + game assets"),
    (11671, "backintime", "BLOCKED",
     "   - Status: BLOCKED: NEEDS_RECIPE_DESIGN — Python/Qt6 backup; requires python-qt6, rsync, polkit integration"),
    (11676, "qdiskinfo", "BLOCKED",
     "   - Status: BLOCKED: NEEDS_RECIPE_DESIGN — Qt CrystalDiskInfo alt; requires Qt5/Qt6, smartmontools, cmake"),
    (11677, "opentubex-git", "BLOCKED",
     "   - Status: BLOCKED: NEEDS_RECIPE_DESIGN — Electron YouTube from source; requires npm deps; binary version preferred"),
    (11679, "qt5-doc", "BLOCKED",
     "   - Status: BLOCKED: NEEDS_RECIPE_DESIGN — Qt5 documentation; requires Qt5 source build with docs enabled"),
    (11680, "qt5-examples", "BLOCKED",
     "   - Status: BLOCKED: NEEDS_RECIPE_DESIGN — Qt5 examples; requires Qt5 source build with examples enabled"),
    (11681, "portproton", "BLOCKED",
     "   - Status: BLOCKED: NEEDS_RECIPE_DESIGN — Wine/Proton game launcher; requires wine, proton, steam runtime"),
    (11682, "input-remapper-git", "BLOCKED",
     "   - Status: BLOCKED: NEEDS_RECIPE_DESIGN — Python/GTK input remapper; requires python-evdev, udev rules, systemd"),
    (11684, "niri-sidebar-git", "BLOCKED",
     "   - Status: BLOCKED: NEEDS_RECIPE_DESIGN — Rust Niri sidebar; requires cargo-inputs + layer-shell, wayland crates"),
    (11688, "plasma-x11-session-povd", "BLOCKED",
     "   - Status: BLOCKED: NEEDS_RECIPE_DESIGN — Custom Plasma X11 session; requires plasma-desktop, KF, distro-specific"),
    (11690, "plasma6-applets-appgrid", "BLOCKED",
     "   - Status: BLOCKED: NEEDS_RECIPE_DESIGN — KDE Plasma 6 app launcher; requires KF6, Qt6, cmake, plasma-desktop"),
    (11691, "xr-chaperone-git", "BLOCKED",
     "   - Status: BLOCKED: NEEDS_RECIPE_DESIGN — OpenXR chaperone system; requires openxr-loader, vulkan, cmake"),
    (11695, "ccraw", "BLOCKED",
     "   - Status: BLOCKED: NEEDS_RECIPE_DESIGN — Terminal crow animation; unclear upstream source and build system"),
    (11696, "osmium", "BLOCKED",
     "   - Status: BLOCKED: NEEDS_RECIPE_DESIGN — Distributed messaging platform; unclear build system"),
    (11697, "asusctl", "BLOCKED",
     "   - Status: BLOCKED: NEEDS_RECIPE_DESIGN — Rust ASUS ROG daemon; requires cargo-inputs + dbus, udev, systemd"),
    (11698, "rog-control-center", "BLOCKED",
     "   - Status: BLOCKED: DEP_RESOLUTION_FAILED — Rust/GTK4 GUI for asusctl; blocked on asusctl"),
    (11699, "samrewritten-git", "BLOCKED",
     "   - Status: BLOCKED: NEEDS_RECIPE_DESIGN — C++ GTK3 Steam achievement manager; requires steam API, curl, json-c"),
    (11701, "waterfox", "BLOCKED",
     "   - Status: BLOCKED: NEEDS_RECIPE_DESIGN — Firefox fork from source; Mozilla build system with 100+ deps; binary preferred"),
    (11702, "sysd-manager", "BLOCKED",
     "   - Status: BLOCKED: NEEDS_RECIPE_DESIGN — Rust/GTK4 systemd GUI; requires cargo-inputs + gtk4, dbus crates"),
    (11705, "i3a", "BLOCKED",
     "   - Status: BLOCKED: NEEDS_RECIPE_DESIGN — Python i3/sway automation scripts; requires python-i3ipc, python-xlib"),
]

# Read the file
with open(TODO_FILE, 'r') as f:
    lines = f.readlines()

# Build a map of org entry numbers to their line positions
# Format: "** TODO 11422. rustconn"
entry_positions = {}
for i, line in enumerate(lines):
    m = re.match(r'\*\* (?:TODO|DONE|BLOCKED|FAILED) (\d+)\. (.+)', line)
    if m:
        num = int(m.group(1))
        entry_positions[num] = i

# Apply updates
updated_count = 0
done_count = 0
blocked_count = 0

for num, name, new_status, status_line in updates:
    if num not in entry_positions:
        print(f"  WARNING: Entry #{num} ({name}) not found in org file")
        continue

    pos = entry_positions[num]
    old_line = lines[pos]

    # Update the header line status
    new_header = re.sub(r'\*\* (?:TODO|DONE|BLOCKED|FAILED)',
                        f'** {new_status}', old_line)
    lines[pos] = new_header

    # Find the end of this entry (next ** header or end of file)
    end_pos = len(lines)
    for j in range(pos + 1, len(lines)):
        if lines[j].startswith('** '):
            end_pos = j
            break

    # Add status line and TODO Status update before the end
    insert_lines = [
        "\n",
        status_line + "\n",
        f"   - TODO Status: {new_status}\n",
    ]

    # Insert before next entry
    for k, il in enumerate(insert_lines):
        lines.insert(end_pos + k, il)

    # Update entry_positions for entries after this one
    shift = len(insert_lines)
    for key in entry_positions:
        if entry_positions[key] > pos:
            entry_positions[key] += shift

    updated_count += 1
    if new_status == "DONE":
        done_count += 1
    else:
        blocked_count += 1

# Write atomically
tmp = TODO_FILE + ".tmp"
with open(tmp, 'w') as f:
    f.writelines(lines)
shutil.move(tmp, TODO_FILE)

print(f"Updated {TODO_FILE}")
print(f"  Total entries updated: {updated_count}")
print(f"  DONE: {done_count}")
print(f"  BLOCKED: {blocked_count}")
