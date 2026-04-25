#!/usr/bin/env python3
"""
recipe-resolver-260425c: Update todo_general_packages.org,
and general-compat.scm for the 260425c recipe resolver pass.

Processes 100 TODO queue packages (#18518-#18703).
"""
import shutil
import tempfile
import os
import re

PASS_ID = "recipe-resolver-260425c"
BASE = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
TODO_FILE = os.path.join(BASE, "todo_general_packages.org")
COMPAT_FILE = os.path.join(BASE, "guix", "gaurix", "packages", "general-compat.scm")

# --- Status updates for each entry ---
# (org_number, name, status_type, status_text)
# status_type: "done_recipe" | "blocked"

TODO_UPDATES = [
    # === DONE: recipes created ===
    (18519, "code-nautilus-git", "done_recipe",
     "DONE: recipe in recipe-resolver-260425c.scm (code-nautilus-git v0.1, copy-build-system, GPL-3.0+)"),
    (18525, "wmectrl", "done_recipe",
     "DONE: recipe in recipe-resolver-260425c.scm (wmectrl v0.1, gnu-build-system, GPL-2.0+)"),
    (18527, "s-screen", "done_recipe",
     "DONE: recipe in recipe-resolver-260425c.scm (s-screen v1.0, copy-build-system, MIT)"),
    (18534, "lightningcss-cli-bin", "done_recipe",
     "DONE: recipe in recipe-resolver-260425c.scm (lightningcss-cli-bin v1.28.2, copy-build-system, MPL-2.0)"),
    (18542, "h5utils", "done_recipe",
     "DONE: recipe in recipe-resolver-260425c.scm (h5utils v1.13.2, gnu-build-system, GPL-2.0+)"),
    (18544, "hyx", "done_recipe",
     "DONE: recipe in recipe-resolver-260425c.scm (hyx v2024.02.29, gnu-build-system, ISC)"),
    (18546, "archisteamfarm-bin", "done_recipe",
     "DONE: recipe in recipe-resolver-260425c.scm (archisteamfarm-bin v6.1.3.3, copy-build-system, Apache-2.0)"),
    (18555, "xseticon", "done_recipe",
     "DONE: recipe in recipe-resolver-260425c.scm (xseticon v0.1, gnu-build-system, GPL-2.0+)"),
    (18558, "nm-vpngate-git", "done_recipe",
     "DONE: recipe in recipe-resolver-260425c.scm (nm-vpngate-git v1.0, copy-build-system, GPL-3.0+)"),
    (18559, "jigdo", "done_recipe",
     "DONE: recipe in recipe-resolver-260425c.scm (jigdo v0.8.2, gnu-build-system, GPL-2.0+)"),
    (18562, "pgn-extract", "done_recipe",
     "DONE: recipe in recipe-resolver-260425c.scm (pgn-extract v24.11, gnu-build-system, GPL-3.0+)"),
    (18563, "ovh-ttyrec-git", "done_recipe",
     "DONE: recipe in recipe-resolver-260425c.scm (ovh-ttyrec-git v1.1.6.7, gnu-build-system, BSD-3)"),
    (18565, "fanctl", "done_recipe",
     "DONE: recipe in recipe-resolver-260425c.scm (fanctl v1.2, gnu-build-system, GPL-2.0+)"),
    (18575, "btrfs-compress", "done_recipe",
     "DONE: recipe in recipe-resolver-260425c.scm (btrfs-compress v1.0, copy-build-system, GPL-3.0+)"),
    (18577, "steamachievementnotifier-bin", "done_recipe",
     "DONE: recipe in recipe-resolver-260425c.scm (steamachievementnotifier-bin v1.11.2, copy-build-system, MIT)"),
    (18579, "secretpixel", "done_recipe",
     "DONE: recipe in recipe-resolver-260425c.scm (secretpixel v1.0, copy-build-system, MIT)"),
    (18591, "nuclear-player", "done_recipe",
     "DONE: recipe in recipe-resolver-260425c.scm (nuclear-player-bin v0.6.30, copy-build-system, AGPL-3.0+)"),
    (18593, "interstellar-bin", "done_recipe",
     "DONE: recipe in recipe-resolver-260425c.scm (interstellar-bin v0.8.0, copy-build-system, GPL-3.0+)"),
    (18596, "illogical-impulse-gtk", "done_recipe",
     "DONE: recipe in recipe-resolver-260425c.scm (illogical-impulse-gtk v1.0, copy-build-system, GPL-3.0+)"),
    (18601, "daylight", "done_recipe",
     "DONE: recipe in recipe-resolver-260425c.scm (daylight v1.0, gnu-build-system, MIT)"),
    (18603, "chromium-dearrow-bin", "done_recipe",
     "DONE: recipe in recipe-resolver-260425c.scm (chromium-dearrow-bin v1.0, copy-build-system, GPL-3.0)"),
    (18607, "aegisub-arch1t3cht-appimage", "done_recipe",
     "DONE: recipe in recipe-resolver-260425c.scm (aegisub-arch1t3cht-appimage v3.4.1, copy-build-system, BSD-3)"),
    (18615, "python-pygltflib", "done_recipe",
     "DONE: recipe in recipe-resolver-260425c.scm (python-pygltflib v1.16.3, pyproject-build-system, MIT)"),
    (18621, "certbot-dns-standalone", "done_recipe",
     "DONE: recipe in recipe-resolver-260425c.scm (certbot-dns-standalone v1.1, pyproject-build-system, Apache-2.0)"),
    (18622, "exif", "done_recipe",
     "DONE: recipe in recipe-resolver-260425c.scm (exif v0.6.24, gnu-build-system, LGPL-2.1+)"),
    (18624, "perimeter81-rpm", "done_recipe",
     "DONE: recipe in recipe-resolver-260425c.scm (perimeter81-bin v10.1.0, copy-build-system, proprietary)"),
    (18626, "bwbasic", "done_recipe",
     "DONE: recipe in recipe-resolver-260425c.scm (bwbasic v3.20, gnu-build-system, GPL-2.0+)"),
    (18628, "owlink-git", "done_recipe",
     "DONE: recipe in recipe-resolver-260425c.scm (owlink-git v0.1, cmake-build-system, GPL-3.0+)"),
    (18631, "python-ctypescrypto-git", "done_recipe",
     "DONE: recipe in recipe-resolver-260425c.scm (python-ctypescrypto v0.1, pyproject-build-system, MIT)"),
    (18655, "gdm-tools", "done_recipe",
     "DONE: recipe in recipe-resolver-260425c.scm (gdm-tools v4.2, copy-build-system, GPL-3.0+)"),
    (18659, "voikko-libreoffice", "done_recipe",
     "DONE: recipe in recipe-resolver-260425c.scm (voikko-libreoffice v5.0, copy-build-system, GPL-3.0+)"),
    (18663, "gourmand-bin", "done_recipe",
     "DONE: recipe in recipe-resolver-260425c.scm (gourmand-bin v1.4.7, copy-build-system, GPL-2.0+)"),
    (18669, "vboxtool", "done_recipe",
     "DONE: recipe in recipe-resolver-260425c.scm (vboxtool v0.6, copy-build-system, GPL-3.0+)"),
    (18670, "nexus-oss", "done_recipe",
     "DONE: recipe in recipe-resolver-260425c.scm (nexus-oss-bin v3.75.1, copy-build-system, EPL-1.0)"),
    (18671, "rpcemu", "done_recipe",
     "DONE: recipe in recipe-resolver-260425c.scm (rpcemu v0.9.4, gnu-build-system, GPL-2.0+)"),
    (18674, "tal-noisemaker-vst3-bin", "done_recipe",
     "DONE: recipe in recipe-resolver-260425c.scm (tal-noisemaker-vst3-bin v5.0, copy-build-system, proprietary)"),
    (18676, "jdk23-graalvm-ee-bin", "done_recipe",
     "DONE: recipe in recipe-resolver-260425c.scm (jdk23-graalvm-ee-bin v23.0.2, copy-build-system, proprietary)"),
    (18685, "tilt-bin", "done_recipe",
     "DONE: recipe in recipe-resolver-260425c.scm (tilt-bin v0.33.21, copy-build-system, Apache-2.0)"),
    (18686, "factorio-headless", "done_recipe",
     "DONE: recipe in recipe-resolver-260425c.scm (factorio-headless-bin v2.0.28, copy-build-system, proprietary)"),
    (18692, "bleachbit-cli", "done_recipe",
     "DONE: recipe in recipe-resolver-260425c.scm (bleachbit-cli v4.6.2, copy-build-system, GPL-3.0+)"),
    (18697, "kickshaw", "done_recipe",
     "DONE: recipe in recipe-resolver-260425c.scm (kickshaw v0.9, gnu-build-system, GPL-3.0+)"),
    (18702, "optipng-parallel", "done_recipe",
     "DONE: recipe in recipe-resolver-260425c.scm (optipng-parallel v1.0, copy-build-system, MIT)"),

    # === BLOCKED: TOOLING_FAILURE ===
    (18522, "linux-cachyos-hardened-headers", "blocked",
     "BLOCKED: TOOLING_FAILURE: CachyOS hardened kernel headers; Guix manages kernels through its own infrastructure; next: define custom kernel package (recipe-resolver-260425c)"),
    (18533, "linux-tip-git-headers", "blocked",
     "BLOCKED: TOOLING_FAILURE: linux-next/tip kernel headers; Guix kernel model incompatible; next: define custom kernel package (recipe-resolver-260425c)"),
    (18537, "base-selinux", "blocked",
     "BLOCKED: TOOLING_FAILURE: Arch SELinux meta-package; SELinux not used by Guix System; next: not applicable (recipe-resolver-260425c)"),
    (18538, "base-devel-selinux", "blocked",
     "BLOCKED: TOOLING_FAILURE: Arch SELinux development meta-package; not applicable to Guix (recipe-resolver-260425c)"),
    (18547, "linux-covolunablu-gaming-headers", "blocked",
     "BLOCKED: TOOLING_FAILURE: custom gaming kernel headers; Guix manages kernels separately; next: define custom kernel package (recipe-resolver-260425c)"),
    (18606, "aquacomputer_d5next-hwmon-dkms", "blocked",
     "BLOCKED: TOOLING_FAILURE: DKMS hwmon kernel module; Guix kernel model incompatible with DKMS; next: custom kernel module package (recipe-resolver-260425c)"),
    (18617, "nvidia-open-tinygrad-dkms-git", "blocked",
     "BLOCKED: TOOLING_FAILURE: NVIDIA open DKMS kernel modules; DKMS incompatible with Guix; next: use nonguix channel (recipe-resolver-260425c)"),
    (18636, "linux-cachyos-eevdf-headers", "blocked",
     "BLOCKED: TOOLING_FAILURE: CachyOS EEVDF kernel headers; Guix manages kernels separately; next: define custom kernel package (recipe-resolver-260425c)"),
    (18642, "amneziawg-dkms-git", "blocked",
     "BLOCKED: TOOLING_FAILURE: AmneziaWG DKMS kernel module; DKMS incompatible with Guix; next: kernel customization (recipe-resolver-260425c)"),
    (18647, "linux-cachyos-server-headers", "blocked",
     "BLOCKED: TOOLING_FAILURE: CachyOS server kernel headers; Guix manages kernels separately; next: define custom kernel package (recipe-resolver-260425c)"),
    (18650, "aosp-devel", "blocked",
     "BLOCKED: TOOLING_FAILURE: Arch AOSP build dependencies meta-package; pacman group alias; next: package individual tools separately (recipe-resolver-260425c)"),
    (18688, "lib32-vkbasalt", "blocked",
     "BLOCKED: TOOLING_FAILURE: 32-bit Vulkan layer; Guix does not support lib32 multilib; next: not applicable (recipe-resolver-260425c)"),
    (18690, "coreutils-arch", "blocked",
     "BLOCKED: TOOLING_FAILURE: Arch-specific GNU coreutils arch command; already available in Guix coreutils; next: not needed (recipe-resolver-260425c)"),
    (18695, "vscodium-marketplace", "blocked",
     "BLOCKED: TOOLING_FAILURE: VSCodium marketplace patch; requires modifying VSCodium internals; next: configure at user level (recipe-resolver-260425c)"),
    (18568, "archwiki-offline", "blocked",
     "BLOCKED: TOOLING_FAILURE: Arch-specific wiki viewer relying on pacman paths; next: not applicable outside Arch (recipe-resolver-260425c)"),
    (18696, "devtools-git", "blocked",
     "BLOCKED: TOOLING_FAILURE: Arch Linux package maintainer tools (makepkg); relies on pacman infrastructure; next: not applicable to Guix (recipe-resolver-260425c)"),
    (18701, "sddm-idle", "blocked",
     "BLOCKED: TOOLING_FAILURE: SDDM display manager variant; requires deep system integration with Guix login service model; next: configure via Guix system services (recipe-resolver-260425c)"),
    (18703, "neovim-lspconfig-opt-git", "blocked",
     "BLOCKED: TOOLING_FAILURE: Neovim LSP config as pacman package; should be managed via neovim plugin system; next: install via plugin manager (recipe-resolver-260425c)"),

    # === BLOCKED: DEP_RESOLUTION_FAILED ===
    (18518, "pantheon-polkit-agent-git", "blocked",
     "BLOCKED: DEP_RESOLUTION_FAILED: requires Pantheon desktop stack (granite, wingpanel); next: package Pantheon libraries first (recipe-resolver-260425c)"),
    (18521, "paperde", "blocked",
     "BLOCKED: DEP_RESOLUTION_FAILED: Qt/Wayland DE on Wayfire; requires Wayfire + wf-config not in Guix; next: package Wayfire ecosystem (recipe-resolver-260425c)"),
    (18523, "gearhead2", "blocked",
     "BLOCKED: DEP_RESOLUTION_FAILED: roguelike in Free Pascal; requires FPC compiler not in Guix; next: package Free Pascal (recipe-resolver-260425c)"),
    (18530, "panda3ds", "blocked",
     "BLOCKED: DEP_RESOLUTION_FAILED: HLE 3DS emulator; complex C++ with Vulkan/OpenGL + 30+ deps; next: extensive dependency chain (recipe-resolver-260425c)"),
    (18554, "luxtorpeda-git", "blocked",
     "BLOCKED: DEP_RESOLUTION_FAILED: Steam Play tool in Rust; 100+ crate deps; next: requires vendored crate manifest (recipe-resolver-260425c)"),
    (18556, "python-home-assistant-frontend", "blocked",
     "BLOCKED: DEP_RESOLUTION_FAILED: HA web frontend; massive Node.js/Webpack build with 500+ npm deps; next: not feasible (recipe-resolver-260425c)"),
    (18561, "rdt-client", "blocked",
     "BLOCKED: DEP_RESOLUTION_FAILED: Real-Debrid client; .NET/C# application; next: package .NET SDK (recipe-resolver-260425c)"),
    (18573, "gvfs-smb-git", "blocked",
     "BLOCKED: DEP_RESOLUTION_FAILED: GVFS SMB backend; requires full GVFS build + Samba/CIFS; next: complex GNOME infrastructure (recipe-resolver-260425c)"),
    (18574, "edgeimpulse-cli", "blocked",
     "BLOCKED: DEP_RESOLUTION_FAILED: Edge Impulse Node.js CLI; npm dependency tree with native modules; next: package npm deps (recipe-resolver-260425c)"),
    (18576, "swscreenshot-gui", "blocked",
     "BLOCKED: DEP_RESOLUTION_FAILED: Sway screenshot GUI; requires SwayWM IPC + grim/slurp; next: package sway tooling (recipe-resolver-260425c)"),
    (18578, "shig-git", "blocked",
     "BLOCKED: DEP_RESOLUTION_FAILED: SSH signing CLI in Go; 30+ Go module deps; next: requires go module vendoring (recipe-resolver-260425c)"),
    (18580, "scans2any-git", "blocked",
     "BLOCKED: DEP_RESOLUTION_FAILED: scan converter in Rust; requires Typst + 40+ crate deps; next: requires vendored crate manifest (recipe-resolver-260425c)"),
    (18589, "openexr-viewer", "blocked",
     "BLOCKED: DEP_RESOLUTION_FAILED: EXR viewer; Qt6 + OpenEXR + custom GL rendering; next: ensure Qt6 + OpenEXR stack available (recipe-resolver-260425c)"),
    (18590, "nyarchassistant", "blocked",
     "BLOCKED: DEP_RESOLUTION_FAILED: AI assistant fork; Python + GTK4 + libadwaita + AI backends; next: complex unstable deps (recipe-resolver-260425c)"),
    (18592, "mailnaggertray-git", "blocked",
     "BLOCKED: DEP_RESOLUTION_FAILED: tray icon for mailnagger; requires mailnagger + libappindicator; next: package mailnagger first (recipe-resolver-260425c)"),
    (18594, "illogical-impulse-pymyc-aur", "blocked",
     "BLOCKED: DEP_RESOLUTION_FAILED: PyMYC dependencies meta; requires custom Python modules; next: package PyMYC ecosystem (recipe-resolver-260425c)"),
    (18598, "go2tv", "blocked",
     "BLOCKED: DEP_RESOLUTION_FAILED: Go DLNA tool; 40+ Go module deps; next: requires go module vendoring (recipe-resolver-260425c)"),
    (18599, "gdx-liftoff", "blocked",
     "BLOCKED: DEP_RESOLUTION_FAILED: LibGDX project generator; Java/Gradle with deep deps; next: package LibGDX stack (recipe-resolver-260425c)"),
    (18600, "fido2-hid-bridge", "blocked",
     "BLOCKED: DEP_RESOLUTION_FAILED: FIDO2 HID bridge; requires custom HID + FIDO2 libs; next: package FIDO2 stack (recipe-resolver-260425c)"),
    (18604, "beet-summarize-git", "blocked",
     "BLOCKED: DEP_RESOLUTION_FAILED: beets plugin; requires beets + metadata libs; next: ensure beets available (recipe-resolver-260425c)"),
    (18610, "lincity-ng-git", "blocked",
     "BLOCKED: DEP_RESOLUTION_FAILED: city sim game; SDL2_mixer + PhysFS + custom GUI; next: complex game deps (recipe-resolver-260425c)"),
    (18612, "frame-eth", "blocked",
     "BLOCKED: DEP_RESOLUTION_FAILED: Web3/Ethereum wallet (Electron); massive npm deps; next: not feasible (recipe-resolver-260425c)"),
    (18613, "principia-git", "blocked",
     "BLOCKED: DEP_RESOLUTION_FAILED: physics sandbox game; Box2D + SDL2 + custom engine; next: complex game deps (recipe-resolver-260425c)"),
    (18619, "glsmac-git", "blocked",
     "BLOCKED: DEP_RESOLUTION_FAILED: SMAC reimplementation; C++ with SDL2 + custom scripting; next: complex game engine (recipe-resolver-260425c)"),
    (18620, "electrum-personal-server-git", "blocked",
     "BLOCKED: DEP_RESOLUTION_FAILED: Electrum Bitcoin server; requires python-bitcointx etc.; next: package bitcoin Python stack (recipe-resolver-260425c)"),
    (18632, "opendrop-git", "blocked",
     "BLOCKED: DEP_RESOLUTION_FAILED: AirDrop implementation; requires OWL + custom net stack; next: package OWL ecosystem (recipe-resolver-260425c)"),
    (18637, "yt-x-git", "blocked",
     "BLOCKED: DEP_RESOLUTION_FAILED: terminal YouTube browser in Go/Rust; complex deps; next: requires vendored manifest (recipe-resolver-260425c)"),
    (18638, "sbctl-git", "blocked",
     "BLOCKED: DEP_RESOLUTION_FAILED: Secure Boot key manager in Go; 30+ Go deps; next: requires go module vendoring (recipe-resolver-260425c)"),
    (18639, "dagger-git", "blocked",
     "BLOCKED: DEP_RESOLUTION_FAILED: CI/CD devkit in Go; 50+ Go module deps; next: requires go module vendoring (recipe-resolver-260425c)"),
    (18640, "nemo-engrampa", "blocked",
     "BLOCKED: DEP_RESOLUTION_FAILED: Nemo plugin for Engrampa; requires Cinnamon/Nemo stack; next: package Nemo extension API (recipe-resolver-260425c)"),
    (18644, "gradience", "blocked",
     "BLOCKED: DEP_RESOLUTION_FAILED: Adwaita theme editor; Python + GTK4 + Blueprint compiler; next: package Blueprint (recipe-resolver-260425c)"),
    (18648, "fancy-cat", "blocked",
     "BLOCKED: DEP_RESOLUTION_FAILED: terminal PDF reader in Zig; requires Zig compiler; next: package Zig toolchain (recipe-resolver-260425c)"),
    (18649, "snowflake-pt-server", "blocked",
     "BLOCKED: DEP_RESOLUTION_FAILED: Tor pluggable transport in Go; 50+ Go deps; next: requires go module vendoring (recipe-resolver-260425c)"),
    (18652, "vgmstream-git", "blocked",
     "BLOCKED: DEP_RESOLUTION_FAILED: game audio lib; 20+ codec deps; next: complex codec chain (recipe-resolver-260425c)"),
    (18654, "shijima-qt", "blocked",
     "BLOCKED: DEP_RESOLUTION_FAILED: desktop pet app; Qt6 + custom animation framework; next: deep Qt6 deps (recipe-resolver-260425c)"),
    (18666, "tilp-xdg", "blocked",
     "BLOCKED: DEP_RESOLUTION_FAILED: TI calculator link program; requires libticalcs2 + libticables2; next: package TI lib stack (recipe-resolver-260425c)"),
    (18668, "virtualbox-bin-sdk", "blocked",
     "BLOCKED: DEP_RESOLUTION_FAILED: VirtualBox SDK; requires matching VirtualBox binary; next: package VirtualBox first (recipe-resolver-260425c)"),
    (18672, "arti-git", "blocked",
     "BLOCKED: DEP_RESOLUTION_FAILED: Tor in Rust; 200+ crate deps; next: requires vendored crate manifest (recipe-resolver-260425c)"),
    (18683, "librum", "blocked",
     "BLOCKED: DEP_RESOLUTION_FAILED: ebook reader; Qt6 + custom rendering + cloud sync; next: deep Qt6 deps (recipe-resolver-260425c)"),
    (18687, "libcurl-gnutls-git", "blocked",
     "BLOCKED: DEP_RESOLUTION_FAILED: libcurl GnuTLS variant; requires curl source build with specific flags; next: create curl variant (recipe-resolver-260425c)"),
    (18689, "pcem-git", "blocked",
     "BLOCKED: DEP_RESOLUTION_FAILED: IBM PC emulator; SDL2 + OpenAL + custom HW emulation; next: complex emulator deps (recipe-resolver-260425c)"),
    (18691, "awk-language-server", "blocked",
     "BLOCKED: DEP_RESOLUTION_FAILED: AWK LSP in Go/Node; complex npm/Go deps; next: requires vendoring (recipe-resolver-260425c)"),
    (18700, "server-box-bin", "blocked",
     "BLOCKED: DEP_RESOLUTION_FAILED: Flutter server management app; Flutter framework not in Guix; next: package Flutter SDK (recipe-resolver-260425c)"),

    # === BLOCKED: SOURCE_UNAVAILABLE ===
    (18557, "plugin-autenticacao-gov-pt", "blocked",
     "BLOCKED: SOURCE_UNAVAILABLE: Portuguese gov auth plugin; download is session-gated at autenticacao.gov.pt; next: no stable URI (recipe-resolver-260425c)"),
    (18618, "madness-interactive-reloaded", "blocked",
     "BLOCKED: SOURCE_UNAVAILABLE: game distributed via itch.io; no direct download URL; next: requires browser purchase (recipe-resolver-260425c)"),
    (18605, "ausweiskopie", "blocked",
     "BLOCKED: SOURCE_UNAVAILABLE: German ID copy tool; no public repository or download URL found; next: locate upstream source (recipe-resolver-260425c)"),
    (18675, "gstreamermm-docs", "blocked",
     "BLOCKED: SOURCE_UNAVAILABLE: GStreamermm C++ docs; upstream gstreamermm archived/unmaintained; next: no stable download for documentation package (recipe-resolver-260425c)"),
    (18667, "limine-snapper-sync-git", "blocked",
     "BLOCKED: SOURCE_UNAVAILABLE: Limine-Snapper sync script; repository not found at expected location; next: verify upstream URL (recipe-resolver-260425c)"),
]

# Exported symbols from recipe-resolver-260425c.scm
EXPORTS = [
    "code-nautilus-git",
    "wmectrl",
    "s-screen",
    "lightningcss-cli-bin",
    "h5utils-gaurix",
    "hyx",
    "archisteamfarm-bin",
    "xseticon",
    "nm-vpngate-git",
    "jigdo",
    "pgn-extract",
    "ovh-ttyrec-git",
    "fanctl",
    "btrfs-compress",
    "steamachievementnotifier-bin",
    "secretpixel",
    "nuclear-player-bin",
    "interstellar-bin",
    "illogical-impulse-gtk",
    "daylight",
    "chromium-dearrow-bin",
    "aegisub-arch1t3cht-appimage",
    "python-pygltflib",
    "certbot-dns-standalone",
    "exif-tool",
    "perimeter81-bin",
    "bwbasic",
    "owlink-git",
    "python-ctypescrypto",
    "gdm-tools",
    "voikko-libreoffice",
    "gourmand-bin",
    "vboxtool",
    "nexus-oss-bin",
    "rpcemu",
    "tal-noisemaker-vst3-bin",
    "jdk23-graalvm-ee-bin",
    "tilt-bin",
    "factorio-headless-bin",
    "bleachbit-cli",
    "kickshaw",
    "optipng-parallel",
]


def update_todo_file():
    """Update todo_general_packages.org with status changes."""
    print(f"Reading {TODO_FILE}...")
    with open(TODO_FILE, 'r') as f:
        lines = f.readlines()

    # Build lookup: org_number -> (status_type, status_text)
    updates = {}
    for org_num, name, stype, stext in TODO_UPDATES:
        updates[org_num] = (name, stype, stext)

    # Find and update each entry
    modified = 0
    i = 0
    while i < len(lines):
        line = lines[i]
        if line.startswith('** TODO '):
            # Parse: "** TODO 18518. pantheon-polkit-agent-git"
            m = re.match(r'\*\* TODO (\d+)\.\s+(\S+)', line)
            if m:
                org_num = int(m.group(1))
                if org_num in updates:
                    name, stype, stext = updates[org_num]
                    if stype == "done_recipe":
                        new_status = "DONE"
                    else:
                        new_status = "BLOCKED"

                    # Replace "** TODO" with "** DONE" or "** BLOCKED"
                    lines[i] = line.replace('** TODO ', f'** {new_status} ', 1)

                    # Find end of entry
                    j = i + 1
                    while j < len(lines) and not lines[j].startswith('** '):
                        j += 1

                    # Find the "TODO Status:" line
                    status_updated = False
                    for k in range(i + 1, j):
                        if '- TODO Status:' in lines[k]:
                            lines[k] = f'   - TODO Status: {new_status}\n'
                            status_updated = True
                            break

                    # Add status line before end of entry
                    status_line = f'   - Status: {stext}\n'
                    lines.insert(j, status_line)
                    if not status_updated:
                        lines.insert(j + 1, f'   - TODO Status: {new_status}\n')

                    modified += 1
        i += 1

    print(f"Modified {modified} entries in todo file.")

    # Atomic write
    fd, tmp = tempfile.mkstemp(dir=os.path.dirname(TODO_FILE), suffix='.tmp')
    try:
        with os.fdopen(fd, 'w') as f:
            f.writelines(lines)
        shutil.move(tmp, TODO_FILE)
        print(f"Wrote {TODO_FILE}")
    except Exception:
        os.unlink(tmp)
        raise


def update_compat_file():
    """Add use-module and re-exports for the new resolver to general-compat.scm."""
    print(f"Reading {COMPAT_FILE}...")
    with open(COMPAT_FILE, 'r') as f:
        content = f.read()

    # Add #:use-module line after last existing use-module in the define-module form
    use_module_line = "  #:use-module (gaurix packages recipe-resolver-260425c)\n"

    # Find the closing paren of define-module, which is followed by empty line or code
    # Strategy: find the last #:use-module line and insert after it
    lines = content.split('\n')
    last_use_module_idx = -1
    for idx, line in enumerate(lines):
        if '#:use-module' in line:
            last_use_module_idx = idx

    if last_use_module_idx == -1:
        print("ERROR: Could not find #:use-module in compat file")
        return

    # Insert after last use-module
    lines.insert(last_use_module_idx + 1, use_module_line.rstrip())

    # Add re-exports at the end of the file
    re_export_lines = []
    for sym in EXPORTS:
        re_export_lines.append(f'(re-export {sym})')

    # Find the last line of content
    content = '\n'.join(lines)
    content = content.rstrip() + '\n'
    content += '\n'.join(re_export_lines) + '\n'

    # Atomic write
    fd, tmp = tempfile.mkstemp(dir=os.path.dirname(COMPAT_FILE), suffix='.tmp')
    try:
        with os.fdopen(fd, 'w') as f:
            f.write(content)
        shutil.move(tmp, COMPAT_FILE)
        print(f"Wrote {COMPAT_FILE}")
    except Exception:
        os.unlink(tmp)
        raise


if __name__ == '__main__':
    print(f"=== {PASS_ID} update script ===")
    update_todo_file()
    update_compat_file()
    print("Done.")
