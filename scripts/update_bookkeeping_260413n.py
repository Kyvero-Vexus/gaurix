#!/usr/bin/env python3
"""Update bookkeeping for deptree-resolver-260413n.
Updates todo_general_packages.org statuses for 100 processed packages.
"""

import re
import sys
from pathlib import Path

REPO_ROOT = Path(__file__).resolve().parent.parent
ORG_FILE = REPO_ROOT / "todo_general_packages.org"
RUN_ID = "deptree-resolver-260413n"

# 25 resolved packages (recipes created)
RESOLVED = {
    "elephant-providerlist": "recipe in deptree-resolver-260413n.scm (go, v2.21.0, elephant providerlist provider, GPL)",
    "elephant-runner": "recipe in deptree-resolver-260413n.scm (go, v2.21.0, elephant runner provider, GPL)",
    "elephant-symbols": "recipe in deptree-resolver-260413n.scm (go, v2.21.0, elephant symbols provider, GPL)",
    "elephant-todo": "recipe in deptree-resolver-260413n.scm (go, v2.21.0, elephant todo provider, GPL)",
    "elephant-websearch": "recipe in deptree-resolver-260413n.scm (go, v2.21.0, elephant websearch provider, GPL)",
    "elephant-calc": "recipe in deptree-resolver-260413n.scm (go, v2.21.0, elephant calc provider, GPL)",
    "elephant-files": "recipe in deptree-resolver-260413n.scm (go, v2.21.0, elephant files provider, GPL)",
    "google-breakpad": "recipe in deptree-resolver-260413n.scm (cmake, v2024.02.16, crash reporting, BSD)",
    "helixnotes-appimage-bin": "recipe in deptree-resolver-260413n.scm (copy, v1.2.8, AppImage, AGPL-3.0)",
    "hmcl-bin": "recipe in deptree-resolver-260413n.scm (copy, v3.12.4, Java Minecraft launcher, GPL-3.0)",
    "hpsahba-git": "recipe in deptree-resolver-260413n.scm (gnu, v0.1, HP controller tool, GPL-2.0)",
    "hytale-updater": "recipe in deptree-resolver-260413n.scm (go, v1.0.0, game launcher, MIT)",
    "i2p-bin": "recipe in deptree-resolver-260413n.scm (copy, v2.11.0, anonymous network binary, GPL-2.0)",
    "nvidia-utils-beta": "recipe in deptree-resolver-260413n.scm (copy, v595.58.03, NVIDIA beta drivers, proprietary)",
    "ccusage": "recipe in deptree-resolver-260413n.scm (copy, v18.0.10, Claude Code token usage CLI, MIT)",
    "claude-agent-acp": "recipe in deptree-resolver-260413n.scm (copy, v0.23.1, Claude Agent ACP, Apache-2.0)",
    "critique": "recipe in deptree-resolver-260413n.scm (copy, v0.1.139, terminal git diff viewer, MIT)",
    "hyprflow": "recipe in deptree-resolver-260413n.scm (copy, v0.2.1, Hyprland session tool, MIT)",
    "ibus-autostart-kimpanel": "recipe in deptree-resolver-260413n.scm (copy, v1.2, iBus autostart config, public-domain)",
    "famitracker": "recipe in deptree-resolver-260413n.scm (copy, v0.4.6, NES music tracker, GPL)",
    "oopz": "recipe in deptree-resolver-260413n.scm (copy, v1.0.0, voice platform client, proprietary)",
    "yabridgectl-wine10-git": "recipe in deptree-resolver-260413n.scm (copy, v0.5.0, yabridge utility, GPL-3.0)",
    "homepage-git": "recipe in deptree-resolver-260413n.scm (copy, v0.9.6, homepage dashboard, GPL-3.0)",
    "hurrycurry-client": "recipe in deptree-resolver-260413n.scm (copy, v3.0.1, cooking game client, AGPL-3.0)",
    "hyprland-plugin-easymotion": "recipe in deptree-resolver-260413n.scm (cmake, v0.52.1, Hyprland easymotion plugin, BSD)",
}

# 75 blocked packages with reason codes
BLOCKED_REASONS = {
    "sonic-win": "INFEASIBLE_BUILD: patched KDE kwin fork, requires full KDE build infrastructure",
    "lib32-xrizer": "LIB32_UNSUPPORTED: 32-bit builds not supported",
    "plasma-workspace-povd": "INFEASIBLE_BUILD: patched KDE workspace, full KDE build infra + custom patches",
    "lib32-l-smash": "LIB32_UNSUPPORTED: 32-bit builds not supported",
    "new-lg4ff-dkms-git": "DKMS_KERNEL_MODULE: requires DKMS kernel infrastructure",
    "lib32-libudev0-shim": "LIB32_UNSUPPORTED: 32-bit builds not supported",
    "hid-fanatecff-dkms": "DKMS_KERNEL_MODULE: requires DKMS kernel infrastructure",
    "linux-cachyos-lts": "CUSTOM_KERNEL: CachyOS kernel variant, out of scope",
    "linux-cachyos": "CUSTOM_KERNEL: CachyOS kernel variant, out of scope",
    "linux-cachyos-rc": "CUSTOM_KERNEL: CachyOS kernel variant, out of scope",
    "qt6-base-hifps": "INFEASIBLE_BUILD: patched Qt6 base, requires full Qt build infra",
    "anbox-git": "SOURCE_UNAVAILABLE: not in AUR metadata",
    "chromium-gost": "INFEASIBLE_BUILD: full Chromium build with GOST crypto patches",
    "gram-editor-git": "SOURCE_UNAVAILABLE: not in AUR metadata",
    "linux6.19.8.arch1-1-bin": "SOURCE_UNAVAILABLE: not in AUR metadata",
    "linux6.19.8.arch1-1-docs-bin": "SOURCE_UNAVAILABLE: not in AUR metadata",
    "linux6.19.8.arch1-1-headers-bin": "SOURCE_UNAVAILABLE: not in AUR metadata",
    "linux6.19.9.arch1-1-bin": "SOURCE_UNAVAILABLE: not in AUR metadata",
    "linux6.19.9.arch1-1-docs-bin": "SOURCE_UNAVAILABLE: not in AUR metadata",
    "linux6.19.9.arch1-1-headers-bin": "SOURCE_UNAVAILABLE: not in AUR metadata",
    "linux6.19.9.zen1-1-zen-bin": "SOURCE_UNAVAILABLE: not in AUR metadata",
    "linux6.19.9.zen1-1-zen-docs-bin": "SOURCE_UNAVAILABLE: not in AUR metadata",
    "linux6.19.9.zen1-1-zen-headers-bin": "SOURCE_UNAVAILABLE: not in AUR metadata",
    "llama.cpp-aio": "SOURCE_UNAVAILABLE: not in AUR metadata",
    "nvidia-vulkan-dkms": "SOURCE_UNAVAILABLE: not in AUR metadata",
    "openai-codex-autoup-bin": "SOURCE_UNAVAILABLE: not in AUR metadata",
    "opensc-p11-kit-module": "SOURCE_UNAVAILABLE: not in AUR metadata",
    "pac-pacman-aliases": "ARCH_SPECIFIC: pacman shell aliases",
    "pacman-log-orphans-hook": "ARCH_SPECIFIC: pacman hook",
    "pipewire-enable-bluez5": "ARCH_SPECIFIC: pacman hook for pipewire",
    "projtlauncher": "SOURCE_UNAVAILABLE: not in AUR metadata",
    "python-uharfbuzz": "SOURCE_UNAVAILABLE: not in AUR metadata",
    "shimmy-bin": "SOURCE_UNAVAILABLE: not in AUR metadata",
    "shorinclip-git": "SOURCE_UNAVAILABLE: not in AUR metadata",
    "subs2srs-git": "SOURCE_UNAVAILABLE: not in AUR metadata",
    "ttf-ms-win10-japanese": "PROPRIETARY_FONT_LICENSE: MS Windows fonts, redistribution prohibited",
    "ttf-ms-win10-korean": "PROPRIETARY_FONT_LICENSE: MS Windows fonts",
    "ttf-ms-win10-other": "PROPRIETARY_FONT_LICENSE: MS Windows fonts",
    "ttf-ms-win10-sea": "PROPRIETARY_FONT_LICENSE: MS Windows fonts",
    "ttf-ms-win10-thai": "PROPRIETARY_FONT_LICENSE: MS Windows fonts",
    "ttf-ms-win10-zh_cn": "PROPRIETARY_FONT_LICENSE: MS Windows fonts",
    "ttf-ms-win10-zh_tw": "PROPRIETARY_FONT_LICENSE: MS Windows fonts",
    "ttf-ms-win11-japanese": "PROPRIETARY_FONT_LICENSE: MS Windows fonts",
    "ttf-ms-win11-korean": "PROPRIETARY_FONT_LICENSE: MS Windows fonts",
    "ttf-ms-win11-other": "PROPRIETARY_FONT_LICENSE: MS Windows fonts",
    "ttf-ms-win11-sea": "PROPRIETARY_FONT_LICENSE: MS Windows fonts",
    "ttf-ms-win11-thai": "PROPRIETARY_FONT_LICENSE: MS Windows fonts",
    "ttf-ms-win11-zh_cn": "PROPRIETARY_FONT_LICENSE: MS Windows fonts",
    "ttf-ms-win11-zh_tw": "PROPRIETARY_FONT_LICENSE: MS Windows fonts",
    "vdhcoapp": "SOURCE_UNAVAILABLE: not in AUR metadata",
    "vivaldi-ffmpeg-codecs": "SOURCE_UNAVAILABLE: not in AUR metadata",
    "whatsapp-for-linux": "SOURCE_UNAVAILABLE: not in AUR metadata",
    "zettlr": "SOURCE_UNAVAILABLE: not in AUR metadata",
    "ancient-packages": "ARCH_SPECIFIC: depends on package-query (pacman tool)",
    "binder_linux-dkms": "DKMS_KERNEL_MODULE: Android binder kernel module",
    "lib32-libtxc_dxtn": "LIB32_UNSUPPORTED: 32-bit builds not supported",
    "lib32-zix": "LIB32_UNSUPPORTED: 32-bit builds not supported",
    "linux-zen-versioned-docs-bin": "LINUX_METAPACKAGE: depends on versioned kernel pkg not in AUR",
    "linux-zen-versioned-headers-bin": "LINUX_METAPACKAGE: depends on versioned kernel pkg not in AUR",
    "localepurge-hook": "ARCH_SPECIFIC: pacman hook",
    "mandb-instant-update": "ARCH_SPECIFIC: pacman hook",
    "mkinitcpio-sd-numlock": "ARCH_SPECIFIC: mkinitcpio hook",
    "paccache-hook": "ARCH_SPECIFIC: pacman hook",
    "systemd-boot-pacman-hook": "ARCH_SPECIFIC: pacman hook",
    "yaycache-hook": "ARCH_SPECIFIC: yay/pacman hook",
    "youtube-music-desktop": "DEP_UNAVAILABLE: depends on qtws-base, not packaged",
    "amneziawg-dkms": "DKMS_KERNEL_MODULE: AmneziaWG VPN kernel module",
    "arch-gdm-theme-list": "ARCH_SPECIFIC: Arch Linux-specific GDM theme",
    "checkupdates-notify": "ARCH_SPECIFIC: depends on pacman-contrib",
    "csharpier": "DOTNET_UNSUPPORTED: requires .NET SDK 10.0",
    "cython2": "DEPRECATED: Python 2 is EOL since 2020",
    "deezer-enhanced": "ELECTRON_APP: depends on electron37 not in Guix",
    "discord-chat-exporter-plus-cli": "DOTNET_UNSUPPORTED: requires .NET runtime 10.0",
    "etckeeper-packages": "ARCH_SPECIFIC: depends on pacman",
    "i2c-nct6793-dkms-git": "DKMS_KERNEL_MODULE: i2c kernel module",
}


def update_org_file():
    with open(ORG_FILE, 'r') as f:
        lines = f.readlines()

    new_lines = []
    i = 0
    resolved_count = 0
    blocked_count = 0

    while i < len(lines):
        line = lines[i]

        # Match BLOCKED package headers
        m = re.match(r'^(\*\* BLOCKED )(\d+)\. (\S+)(.*)', line)
        if m:
            prefix = m.group(1)
            number = m.group(2)
            name = m.group(3)
            rest = m.group(4)

            if name in RESOLVED:
                # Change to DONE
                new_lines.append(f"** DONE {number}. {name}{rest}\n")
                # Collect existing body lines
                i += 1
                while i < len(lines) and not lines[i].startswith('** '):
                    new_lines.append(lines[i])
                    i += 1
                # Add resolution status
                new_lines.append(f"   - Status: DONE: {RESOLVED[name]} ({RUN_ID})\n")
                new_lines.append(f"   - TODO Status: DONE\n")
                resolved_count += 1
                continue

            elif name in BLOCKED_REASONS:
                # Keep BLOCKED but update reason
                reason = BLOCKED_REASONS[name]
                new_lines.append(f"** BLOCKED {number}. {name} [BLOCKED: {reason}]\n")
                i += 1
                while i < len(lines) and not lines[i].startswith('** '):
                    new_lines.append(lines[i])
                    i += 1
                new_lines.append(f"\n   BLOCKED: {reason} ({RUN_ID})\n")
                blocked_count += 1
                continue

        new_lines.append(line)
        i += 1

    with open(ORG_FILE, 'w') as f:
        f.writelines(new_lines)

    print(f"Updated {resolved_count} packages to DONE", file=sys.stderr)
    print(f"Updated {blocked_count} BLOCKED packages with reasons", file=sys.stderr)
    print(f"Total processed: {resolved_count + blocked_count}", file=sys.stderr)


if __name__ == '__main__':
    update_org_file()
