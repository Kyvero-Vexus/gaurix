#!/usr/bin/env python3
"""
Update todo_general_packages.org for deptree-resolver-260425f pass.

Changes:
- 3 packages: BLOCKED -> DONE (nvidiactl-git, ntpd-rs-git, truckersmp-cli)
- 97 packages: Update BLOCKED reason with detailed notes
"""

import json
import re
import shutil
import tempfile
from pathlib import Path

PASS_ID = "deptree-resolver-260425f"
ORG_FILE = Path("todo_general_packages.org")
SELECTION_JSON = Path(f"reports/{PASS_ID}-selection.json")

# Packages resolved to DONE
RESOLVED = {
    "nvidiactl-git": "DONE: Recipe in deptree-resolver-260425f.scm (nvidiactl-bin v0.2.0, prebuilt binary from Codeberg, MIT)",
    "ntpd-rs-git": "DONE: Recipe in deptree-resolver-260425f.scm (ntpd-rs-bin v1.7.2, extracted from .deb, Apache-2.0/MIT)",
    "truckersmp-cli": "DONE: Recipe in deptree-resolver-260425f.scm (truckersmp-cli v0.10.2.1, Python package, MIT)",
}

# Blocked reason updates (package_name -> new reason detail)
BLOCKED_UPDATES = {
    "gradience": "DEP_RESOLUTION_FAILED: Not in AUR cache, no upstream URL",
    "sudo-selinux": "SELINUX_SPECIFIC: SELinux-enabled sudo, Guix does not use SELinux",
    "base-selinux": "SELINUX_SPECIFIC: SELinux base package set, Guix does not use SELinux",
    "wayfire-git": "DEP_RESOLUTION_FAILED: Complex dep chain (wlroots, wf-config, wf-touch), 4+ new deps needed",
    "virtualbox-svn": "DEP_RESOLUTION_FAILED: 50+ deps, kernel modules, Qt GUI, SDK - not feasible",
    "neovim-lspconfig-opt-git": "TOOLING_FAILURE: Not in AUR cache, Neovim plugin not packageable as system pkg",
    "sipgate-app-clinq": "NEEDS_RECIPE_DESIGN: Not in AUR cache, no source/version info",
    "squareline-studio": "SOURCE_UNAVAILABLE: Proprietary, requires login to download",
    "aquacomputer_d5next-hwmon-dkms": "DKMS_KERNEL_MODULE: Kernel module for Aquacomputer hardware",
    "bakkesmod-steam": "PLATFORM_UNSUPPORTED: Windows-only Rocket League mod",
    "edgeimpulse-cli": "DEP_RESOLUTION_FAILED: npm with deep dependency tree, Guix node-build-system inadequate",
    "librewolf-extension-ublock-origin-bin": "BROWSER_EXTENSION: Browser .xpi extension, install via browser",
    "librewolf-tridactyl-native-bin": "BROWSER_EXTENSION: Browser native messaging host, browser-specific",
    "locale-mul_zz": "TOOLING_FAILURE: Custom locale data, Arch-specific locale generation",
    "luniistore": "SOURCE_UNAVAILABLE: Proprietary, source not publicly available",
    "mkinitcpio-systemd-root-password": "DISTRO_SPECIFIC: mkinitcpio hook, Arch-specific",
    "playerctld-systemd-unit": "TOOLING_FAILURE: systemd unit, Guix uses Shepherd",
    "repacman": "DISTRO_SPECIFIC: Tool for creating pacman packages, Arch-specific",
    "simplicity-commander": "SOURCE_UNAVAILABLE: Proprietary Silicon Labs tool, requires account",
    "amneziawg-dkms-git": "DKMS_KERNEL_MODULE: AmneziaWG kernel module via DKMS",
    "amneziawg-linux": "DKMS_KERNEL_MODULE: AmneziaWG kernel module",
    "amneziawg-linux-hardened": "DKMS_KERNEL_MODULE: AmneziaWG kernel module for hardened kernel",
    "android-platform-19": "ANDROID_SDK_PLATFORM: Proprietary Google Android SDK platform",
    "android-platform-21": "ANDROID_SDK_PLATFORM: Proprietary Google Android SDK platform",
    "archwiki-offline": "DISTRO_SPECIFIC: Arch Wiki offline viewer, no releases/tags",
    "aws-amplify-cli": "DEP_RESOLUTION_FAILED: npm with massive dependency tree",
    "aws-cdk": "DEP_RESOLUTION_FAILED: npm with massive dependency tree",
    "brother-mfc-l2400dw": "LICENSE_REVIEW_NEEDED: Brother commercial printer driver, non-free",
    "decrypto-pro-git": "DEP_RESOLUTION_FAILED: No tags/releases, needs CryptoPro SDK (proprietary)",
    "emmet-language-server": "DEP_RESOLUTION_FAILED: npm package with complex dependency tree",
    "faustus-dkms-git": "DKMS_KERNEL_MODULE: ASUS TUF Gaming DKMS kernel driver",
    "findbrokenpkgs": "DISTRO_SPECIFIC: Arch-specific broken package identifier",
    "ideapad-laptop-tb-dkms": "DKMS_KERNEL_MODULE: Lenovo ThinkBook DKMS kernel module",
    "ideapad-laptop-tb2024g6plus-dkms": "DKMS_KERNEL_MODULE: Lenovo ThinkBook 2024 DKMS kernel module",
    "knossu": "NEEDS_RECIPE_DESIGN: Very old (2015), custom license, source unclear",
    "lib32-opencl-nvidia-390xx": "MULTILIB_UNSUPPORTED: 32-bit NVIDIA OpenCL, Guix no multilib",
    "libch343ser-git": "KERNEL_MODULE: WCH USB serial kernel module",
    "libfprint-2-tod1-broadcom-cv3plus": "PROPRIETARY_BINARY: Dell ControlVault3 fingerprint driver, non-redistributable",
    "mingw-w64-cblas": "MINGW_CROSS_COMPILATION: MinGW-w64 cross-compilation target",
    "mingw-w64-lapack": "MINGW_CROSS_COMPILATION: MinGW-w64 cross-compilation target",
    "mingw-w64-soundtouch": "MINGW_CROSS_COMPILATION: MinGW-w64 cross-compilation target",
    "nftables-geoip-db": "BUILD_NETWORK_REQUIRED: Build downloads GeoIP DB, Guix builds sandboxed",
    "nodejs-cspell": "DEP_RESOLUTION_FAILED: npm with complex dependency tree",
    "osmtogeojson": "DEP_RESOLUTION_FAILED: npm package, Node.js dependency tree",
    "pfring-dkms": "DKMS_KERNEL_MODULE: PF_RING kernel module",
    "python-home-assistant-frontend": "DEP_RESOLUTION_FAILED: Massive JS/Node.js project, hundreds of deps",
    "qt5-mqtt": "DEP_RESOLUTION_FAILED: Qt5 module requiring private headers",
    "r8126-dkms": "DKMS_KERNEL_MODULE: Realtek RTL8126 kernel module",
    "receitanet": "SOURCE_UNAVAILABLE: Brazilian government software, not publicly available",
    "sbctl-initcpio-post-hook": "DISTRO_SPECIFIC: mkinitcpio hook for sbctl, Arch-specific",
    "system-age": "DISTRO_SPECIFIC: Reads pacman database, Arch-specific",
    "ttf-consolas-ligaturized": "LICENSE_REVIEW_NEEDED: Based on Microsoft Consolas (proprietary font)",
    "vscodium-marketplace": "TOOLING_FAILURE: Patches VSCodium internals, not standalone package",
    "wyc": "SOURCE_UNAVAILABLE: Chinese commercial software, source not available",
    "beammp-launcher-git": "DEP_RESOLUTION_FAILED: C++ with vcpkg, only Windows prebuilt binaries",
    "java-language-server": "DEP_RESOLUTION_FAILED: Maven with extensive Java dependency tree",
    "libarchive-static": "TOOLING_FAILURE: Static build of libarchive, Guix has libarchive already",
    "lightdm-webkit-theme-aether": "DEP_RESOLUTION_FAILED: Needs webpack/Node.js build, dist/ incomplete",
    "linux-keep-modules": "DISTRO_SPECIFIC: Arch-specific kernel module preservation",
    "nfuspire-git": "DEP_RESOLUTION_FAILED: No tags/releases, depends on libnspire (not in Guix)",
    "nginx-mainline-mod-njs": "DEP_RESOLUTION_FAILED: Requires nginx source tree, complex module build",
    "nodejs-nestjs-cli": "DEP_RESOLUTION_FAILED: npm package with complex dependency tree",
    "nvidia-bl-dkms": "DKMS_KERNEL_MODULE: NVIDIA backlight kernel module",
    "pacpak-git": "DISTRO_SPECIFIC: Pacman wrapper for flatpak, Arch-specific",
    "phonon-qt4-vlc": "DEP_RESOLUTION_FAILED: Qt4 deprecated and removed from Guix",
    "quartz-utils-git": "DEP_RESOLUTION_FAILED: Crystal language not in Guix, separate binary downloads",
    "rdt-client": "DEP_RESOLUTION_FAILED: .NET/ASP.NET app, experimental in Guix",
    "sbctl-git": "DEP_RESOLUTION_FAILED: Go source v0.18, 15+ Go module deps needed",
    "snowflake-pt-server": "DEP_RESOLUTION_FAILED: Go source, no vendored deps",
    "sommelier-git": "DEP_RESOLUTION_FAILED: ChromiumOS platform2 codebase, huge deps",
    "texmacs-pure": "DEP_RESOLUTION_FAILED: Depends on Pure language (not in Guix)",
    "tilp-xdg": "DEP_RESOLUTION_FAILED: Needs libticables/libticalcs/libticonv/libtifiles",
    "chromium-extension-arch-search": "DISTRO_SPECIFIC: Chromium extension for Arch Linux search",
    "clash-for-windows-chinese": "ABANDONED_UPSTREAM: Original project abandoned, repo archived",
    "eclipse-pydev": "DEP_RESOLUTION_FAILED: Eclipse plugin, requires Eclipse build infrastructure",
    "euroscope-bin": "SOURCE_UNAVAILABLE: Windows-only proprietary VATSIM application",
    "gearhead2": "DEP_RESOLUTION_FAILED: Requires Free Pascal compiler, not well-supported in Guix",
    "gephi-git": "DEP_RESOLUTION_FAILED: Java/Maven/Ant with complex build",
    "lobe-chat": "DEP_RESOLUTION_FAILED: Electron app, complex repacking",
    "mingw-w64-sqlite": "MINGW_CROSS_COMPILATION: MinGW-w64 cross-compilation target",
    "php83-mcrypt": "TOOLING_FAILURE: PHP 8.3 extension, requires PHP extension build infra",
    "plugin-autenticacao-gov-pt": "SOURCE_UNAVAILABLE: Portuguese government auth plugin",
    "python2-wxpython3": "LEGACY_PYTHON2: Requires Python 2 (EOL), removed from Guix",
    "qtspim-iconfix": "BUILD_FAILED: Qt5 MIPS simulator, SVN source, obsolete build patterns",
    "rtl88x2ce-dkms-git": "DKMS_KERNEL_MODULE: Realtek WiFi kernel module",
    "urbanterror": "SOURCE_UNAVAILABLE: Game data/binaries no longer available",
    "ut2004-gog": "NON_DISTRIBUTABLE: Commercial game requiring GOG purchase",
    "zfs-linux-hardened-headers": "KERNEL_SPECIFIC: Kernel-version-specific ZFS headers",
    "zfs-linux-rt-headers": "KERNEL_SPECIFIC: Kernel-version-specific ZFS headers",
    "bililive-recorder": "DEP_RESOLUTION_FAILED: .NET application, requires .NET SDK",
    "futu-ftnn-wine": "NEEDS_RECIPE_DESIGN: Requires Wine + proprietary Windows binary",
    "hq": "DEP_RESOLUTION_FAILED: Go project, no prebuilt binaries, Go module deps",
    "inkdrop": "SOURCE_UNAVAILABLE: Proprietary, requires paid license and account",
    "kamilsss655-uv-k5-firmware-custom-git": "CROSS_COMPILATION: Requires arm-none-eabi cross toolchain",
    "mailnaggertray-git": "DEP_RESOLUTION_FAILED: No releases/tags, Python/Qt, no versioned source",
    "musique": "DEP_RESOLUTION_FAILED: Git-only source, no tagged releases",
    "nemo-engrampa": "DEP_RESOLUTION_FAILED: Depends on nemo/engrampa (Cinnamon), not in Guix",
}


def update_org_file():
    with open(ORG_FILE, 'r') as f:
        lines = f.readlines()

    pattern = re.compile(r'^(\*\* )(BLOCKED)(\s+\d+\.\s+)(\S+)')
    i = 0
    changes = 0
    while i < len(lines):
        m = pattern.match(lines[i])
        if m:
            prefix, status, num_part, pkg_name = m.group(1), m.group(2), m.group(3), m.group(4)
            rest = lines[i][m.end():]

            if pkg_name in RESOLVED:
                # Change BLOCKED -> DONE and add status line
                lines[i] = f"{prefix}DONE{num_part}{pkg_name}{rest}"
                # Find where to insert the new status
                j = i + 1
                while j < len(lines) and not lines[j].startswith("** "):
                    j += 1
                status_line = f"   - Status: {RESOLVED[pkg_name]} ({PASS_ID})\n"
                lines.insert(j, status_line)
                changes += 1
                print(f"  DONE: {pkg_name}")
            elif pkg_name in BLOCKED_UPDATES:
                # Update the blocking reason
                j = i + 1
                while j < len(lines) and not lines[j].startswith("** "):
                    j += 1
                status_line = f"   - Status: BLOCKED: {BLOCKED_UPDATES[pkg_name]} ({PASS_ID})\n"
                lines.insert(j, status_line)
                rest_stripped = rest.rstrip()
                if not rest_stripped.endswith(f":{PASS_ID}:"):
                    tag = f"  :{PASS_ID}:"
                    if rest_stripped:
                        lines[i] = f"{prefix}{status}{num_part}{pkg_name}{rest_stripped}{tag}\n"
                    else:
                        lines[i] = f"{prefix}{status}{num_part}{pkg_name}{tag}\n"
                changes += 1
        i += 1

    # Write atomically
    with tempfile.NamedTemporaryFile(mode='w', dir='.', delete=False, suffix='.org') as tf:
        tf.writelines(lines)
        tmp_path = tf.name
    shutil.move(tmp_path, str(ORG_FILE))
    print(f"\nUpdated {changes} entries in {ORG_FILE}")


if __name__ == '__main__':
    update_org_file()
