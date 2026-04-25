#!/usr/bin/env python3
"""
Bookkeeping for deptree-resolver-260425h.

Updates todo_general_packages.org with resolution results:
- 6 packages -> DONE (new recipes)
- 2 packages -> DONE (ALREADY_RESOLVED duplicate entries)
- 92 packages -> remain BLOCKED (with updated reason codes)

Also updates:
- guix/gaurix/packages.scm (add pass comment and exports)
- guix/gaurix/packages/general-compat.scm (add module import)
"""

import re
import sys
import shutil
import tempfile
from pathlib import Path

PASS_ID = "deptree-resolver-260425h"
ORG_FILE = Path("todo_general_packages.org")
PACKAGES_SCM = Path("guix/gaurix/packages.scm")
COMPAT_SCM = Path("guix/gaurix/packages/general-compat.scm")

# Packages resolved with new recipes (DONE)
RESOLVED_RECIPES = {
    "neovim-lspconfig-opt-git": "DONE: Recipe in deptree-resolver-260425h.scm (neovim-lspconfig v2.0.0, copy-build-system Lua plugin, Apache-2.0)",
    "qt5-mqtt": "DONE: Recipe in deptree-resolver-260425h.scm (qt5-mqtt v5.15.2, Qt5 qmake module, GPL-3.0)",
    "hq": "DONE: Recipe in deptree-resolver-260425h.scm (hq v3.2, meson C++ HTML processor, MIT)",
    "php83-mcrypt": "DONE: Recipe in deptree-resolver-260425h.scm (php-mcrypt v1.0.7, PECL extension, PHP-3.01)",
    "sbctl-git": "DONE: Recipe in deptree-resolver-260425h.scm (sbctl v0.18, Go secure boot manager, MIT)",
    "snowflake-pt-server": "DONE: Recipe in deptree-resolver-260425h.scm (snowflake-pt-server v2.11.0, Go Tor pluggable transport, BSD-3)",
}

# Already resolved packages (duplicate BLOCKED entries)
ALREADY_RESOLVED = {
    "mingw-w64-sqlite": "DONE: ALREADY_RESOLVED: recipe exists in deptree-resolver-260414v.scm (duplicate BLOCKED entry cleaned up) (deptree-resolver-260425h)",
    "python2-wxpython3": "DONE: ALREADY_RESOLVED: recipe exists in deptree-resolver-260415b.scm (duplicate BLOCKED entry cleaned up) (deptree-resolver-260425h)",
}

# Updated BLOCKED reason codes for remaining packages
BLOCKED_UPDATES = {
    "gradience": "BLOCKED: DEP_RESOLUTION_FAILED: needs python-svglib+reportlab chain, project archived Jul 2024 (deptree-resolver-260425h)",
    "sudo-selinux": "BLOCKED: SELINUX_SPECIFIC: requires SELinux infrastructure not in Guix (deptree-resolver-260425h)",
    "base-selinux": "BLOCKED: SELINUX_SPECIFIC: requires SELinux infrastructure not in Guix (deptree-resolver-260425h)",
    "wayfire-git": "BLOCKED: DEP_RESOLUTION_FAILED: requires wlroots 0.20 (not in Guix); stable wayfire already in gaurix (deptree-resolver-260425h)",
    "virtualbox-svn": "BLOCKED: DEP_RESOLUTION_FAILED: 50+ deps, kernel modules, extreme complexity; nonguix has virtualbox-bin (deptree-resolver-260425h)",
    "sipgate-app-clinq": "BLOCKED: PROPRIETARY_BINARY: proprietary Electron app, no source code (deptree-resolver-260425h)",
    "squareline-studio": "BLOCKED: SOURCE_UNAVAILABLE: proprietary commercial binary, no source (deptree-resolver-260425h)",
    "aquacomputer_d5next-hwmon-dkms": "BLOCKED: DKMS_KERNEL_MODULE: HWMON DKMS module incompatible with Guix (deptree-resolver-260425h)",
    "bakkesmod-steam": "BLOCKED: PLATFORM_UNSUPPORTED: Windows-only mod tool (deptree-resolver-260425h)",
    "edgeimpulse-cli": "BLOCKED: DEP_RESOLUTION_FAILED: npm package, node-build-system limitations (deptree-resolver-260425h)",
    "librewolf-extension-ublock-origin-bin": "BLOCKED: BROWSER_EXTENSION: browser extension, not system package (deptree-resolver-260425h)",
    "librewolf-tridactyl-native-bin": "BLOCKED: BROWSER_EXTENSION: browser extension, not system package (deptree-resolver-260425h)",
    "luniistore": "BLOCKED: SOURCE_UNAVAILABLE: proprietary Java app, download 403 (deptree-resolver-260425h)",
    "mkinitcpio-systemd-root-password": "BLOCKED: DISTRO_SPECIFIC: mkinitcpio hook for Arch Linux (deptree-resolver-260425h)",
    "repacman": "BLOCKED: DISTRO_SPECIFIC: pacman report tool (deptree-resolver-260425h)",
    "simplicity-commander": "BLOCKED: SOURCE_UNAVAILABLE: proprietary binary, download URL dead (deptree-resolver-260425h)",
    "amneziawg-dkms-git": "BLOCKED: DKMS_KERNEL_MODULE: AmneziaWG DKMS module (deptree-resolver-260425h)",
    "amneziawg-linux": "BLOCKED: DKMS_KERNEL_MODULE: AmneziaWG kernel module (deptree-resolver-260425h)",
    "amneziawg-linux-hardened": "BLOCKED: DKMS_KERNEL_MODULE: AmneziaWG for hardened kernel (deptree-resolver-260425h)",
    "android-platform-19": "BLOCKED: ANDROID_SDK_PLATFORM: proprietary Google Android SDK (deptree-resolver-260425h)",
    "android-platform-21": "BLOCKED: ANDROID_SDK_PLATFORM: proprietary Google Android SDK (deptree-resolver-260425h)",
    "archwiki-offline": "BLOCKED: DISTRO_SPECIFIC: Arch Wiki offline reader (deptree-resolver-260425h)",
    "aws-amplify-cli": "BLOCKED: DEP_RESOLUTION_FAILED: massive npm dependency tree (deptree-resolver-260425h)",
    "aws-cdk": "BLOCKED: DEP_RESOLUTION_FAILED: massive npm dependency tree (deptree-resolver-260425h)",
    "brother-mfc-l2400dw": "BLOCKED: PROPRIETARY_BINARY: proprietary binary-only printer driver (deptree-resolver-260425h)",
    "decrypto-pro-git": "BLOCKED: DEP_RESOLUTION_FAILED: needs openssl-gost-engine (niche Russian crypto) (deptree-resolver-260425h)",
    "emmet-language-server": "BLOCKED: DEP_RESOLUTION_FAILED: npm package, node-build-system limitations (deptree-resolver-260425h)",
    "faustus-dkms-git": "BLOCKED: DKMS_KERNEL_MODULE: ASUS fan control DKMS (deptree-resolver-260425h)",
    "findbrokenpkgs": "BLOCKED: DISTRO_SPECIFIC: find broken packages (pacman) (deptree-resolver-260425h)",
    "ideapad-laptop-tb-dkms": "BLOCKED: DKMS_KERNEL_MODULE: Ideapad tablet DKMS (deptree-resolver-260425h)",
    "ideapad-laptop-tb2024g6plus-dkms": "BLOCKED: DKMS_KERNEL_MODULE: Ideapad 2024 DKMS (deptree-resolver-260425h)",
    "knossu": "BLOCKED: PROPRIETARY_BINARY: no source, no license, binary from 2015 (deptree-resolver-260425h)",
    "lib32-opencl-nvidia-390xx": "BLOCKED: MULTILIB_UNSUPPORTED: 32-bit multilib not supported (deptree-resolver-260425h)",
    "libch343ser-git": "BLOCKED: KERNEL_MODULE: serial driver kernel module (deptree-resolver-260425h)",
    "libfprint-2-tod1-broadcom-cv3plus": "BLOCKED: PROPRIETARY_BINARY: non-redistributable proprietary binary (deptree-resolver-260425h)",
    "mingw-w64-cblas": "BLOCKED: MINGW_CROSS_COMPILATION: Windows cross-compilation target (deptree-resolver-260425h)",
    "mingw-w64-lapack": "BLOCKED: MINGW_CROSS_COMPILATION: Windows cross-compilation target (deptree-resolver-260425h)",
    "mingw-w64-soundtouch": "BLOCKED: MINGW_CROSS_COMPILATION: Windows cross-compilation target (deptree-resolver-260425h)",
    "nftables-geoip-db": "BLOCKED: BUILD_NETWORK_REQUIRED: monthly GeoIP data, non-reproducible (deptree-resolver-260425h)",
    "nodejs-cspell": "BLOCKED: DEP_RESOLUTION_FAILED: npm monorepo, node-build-system limitations (deptree-resolver-260425h)",
    "osmtogeojson": "BLOCKED: DEP_RESOLUTION_FAILED: npm package, node-build-system limitations (deptree-resolver-260425h)",
    "pfring-dkms": "BLOCKED: DKMS_KERNEL_MODULE: PF_RING network DKMS (deptree-resolver-260425h)",
    "python-home-assistant-frontend": "BLOCKED: DEP_RESOLUTION_FAILED: 115MB pre-built JS, cannot build from source (deptree-resolver-260425h)",
    "r8126-dkms": "BLOCKED: DKMS_KERNEL_MODULE: Realtek r8126 DKMS (deptree-resolver-260425h)",
    "receitanet": "BLOCKED: SOURCE_UNAVAILABLE: proprietary Brazilian government software (deptree-resolver-260425h)",
    "sbctl-initcpio-post-hook": "BLOCKED: DISTRO_SPECIFIC: sbctl mkinitcpio hook (deptree-resolver-260425h)",
    "system-age": "BLOCKED: DISTRO_SPECIFIC: reads pacman install date (deptree-resolver-260425h)",
    "ttf-consolas-ligaturized": "BLOCKED: LICENSE_REVIEW_NEEDED: derivative of proprietary Microsoft Consolas font (deptree-resolver-260425h)",
    "vscodium-marketplace": "BLOCKED: DISTRO_SPECIFIC: Arch pacman hook, no VSCodium in Guix (deptree-resolver-260425h)",
    "wyc": "BLOCKED: SOURCE_UNAVAILABLE: proprietary Chinese tunneling binary (deptree-resolver-260425h)",
    "beammp-launcher-git": "BLOCKED: DEP_RESOLUTION_FAILED: vcpkg build model incompatible with Guix (deptree-resolver-260425h)",
    "java-language-server": "BLOCKED: DEP_RESOLUTION_FAILED: Maven build downloads deps at build time (deptree-resolver-260425h)",
    "libarchive-static": "BLOCKED: COMPLEX_BUILD: static musl build of 7+ deps, niche use case (deptree-resolver-260425h)",
    "lightdm-webkit-theme-aether": "BLOCKED: DEP_RESOLUTION_FAILED: archived upstream, missing lightdm-webkit2-greeter (deptree-resolver-260425h)",
    "linux-keep-modules": "BLOCKED: DISTRO_SPECIFIC: pacman hook for kernel modules (deptree-resolver-260425h)",
    "nfuspire-git": "BLOCKED: DEP_RESOLUTION_FAILED: immature project (1 commit), needs libnspire (deptree-resolver-260425h)",
    "nginx-mainline-mod-njs": "BLOCKED: DEP_RESOLUTION_FAILED: no nginx dynamic module build infra in Guix (deptree-resolver-260425h)",
    "nodejs-nestjs-cli": "BLOCKED: DEP_RESOLUTION_FAILED: npm package, node-build-system limitations (deptree-resolver-260425h)",
    "nvidia-bl-dkms": "BLOCKED: DKMS_KERNEL_MODULE: NVIDIA backlight DKMS (deptree-resolver-260425h)",
    "pacpak-git": "BLOCKED: DISTRO_SPECIFIC: pacman + flatpak wrapper (deptree-resolver-260425h)",
    "phonon-qt4-vlc": "BLOCKED: DEP_RESOLUTION_FAILED: Qt4 is dead/EOL since 2015 (deptree-resolver-260425h)",
    "quartz-utils-git": "BLOCKED: DEP_RESOLUTION_FAILED: Crystal language not in Guix (deptree-resolver-260425h)",
    "rdt-client": "BLOCKED: DEP_RESOLUTION_FAILED: needs .NET 10, Guix only has dotnet 8 (deptree-resolver-260425h)",
    "sommelier-git": "BLOCKED: DEP_RESOLUTION_FAILED: ChromeOS platform2 monorepo component (deptree-resolver-260425h)",
    "texmacs-pure": "BLOCKED: DEP_RESOLUTION_FAILED: Pure language defunct, needs LLVM 3.5 (deptree-resolver-260425h)",
    "tilp-xdg": "BLOCKED: DEP_RESOLUTION_FAILED: needs XDG patches on tilp2, patches not easily extractable (deptree-resolver-260425h)",
    "chromium-extension-arch-search": "BLOCKED: DISTRO_SPECIFIC: Arch search browser extension (deptree-resolver-260425h)",
    "clash-for-windows-chinese": "BLOCKED: ABANDONED_UPSTREAM: project abandoned, GitHub repo deleted (deptree-resolver-260425h)",
    "eclipse-pydev": "BLOCKED: DEP_RESOLUTION_FAILED: Eclipse IDE not in Guix (deptree-resolver-260425h)",
    "euroscope-bin": "BLOCKED: SOURCE_UNAVAILABLE: Windows-only proprietary via Wine (deptree-resolver-260425h)",
    "gbm": "BLOCKED: DEP_RESOLUTION_FAILED: VB.NET/Mono, VB.NET compiler not supported (deptree-resolver-260425h)",
    "gephi-git": "BLOCKED: DEP_RESOLUTION_FAILED: Maven build + NetBeans Platform (deptree-resolver-260425h)",
    "lobe-chat": "BLOCKED: DEP_RESOLUTION_FAILED: Next.js/pnpm monorepo, massive npm deps (deptree-resolver-260425h)",
    "plugin-autenticacao-gov-pt": "BLOCKED: SOURCE_UNAVAILABLE: binary .deb, no source repo found (deptree-resolver-260425h)",
    "qtspim-iconfix": "BLOCKED: BUILD_FAILED: SVN-only source, outdated, low priority (deptree-resolver-260425h)",
    "rtl88x2ce-dkms-git": "BLOCKED: DKMS_KERNEL_MODULE: Realtek WiFi DKMS (deptree-resolver-260425h)",
    "urbanterror": "BLOCKED: SOURCE_UNAVAILABLE: proprietary game data, download broken (deptree-resolver-260425h)",
    "ut2004-gog": "BLOCKED: NON_DISTRIBUTABLE: commercial game, cannot redistribute (deptree-resolver-260425h)",
    "zfs-linux-hardened-headers": "BLOCKED: KERNEL_SPECIFIC: kernel-version-specific ZFS headers (deptree-resolver-260425h)",
    "zfs-linux-rt-headers": "BLOCKED: KERNEL_SPECIFIC: kernel-version-specific ZFS headers (deptree-resolver-260425h)",
    "bililive-recorder": "BLOCKED: DEP_RESOLUTION_FAILED: .NET 6 + npm dual build (deptree-resolver-260425h)",
    "futu-ftnn-wine": "BLOCKED: PROPRIETARY_BINARY: proprietary Windows binary via Wine (deptree-resolver-260425h)",
    "inkdrop": "BLOCKED: SOURCE_UNAVAILABLE: proprietary commercial Electron app (deptree-resolver-260425h)",
    "kamilsss655-uv-k5-firmware-custom-git": "BLOCKED: CROSS_COMPILATION: needs ARM cross-compilation toolchain (deptree-resolver-260425h)",
    "mailnaggertray-git": "BLOCKED: DEP_RESOLUTION_FAILED: depends on mailnagger (not in Guix) (deptree-resolver-260425h)",
    "musique": "BLOCKED: COMPLEX_DEPS: 8 git submodules from flaviotordini, complex but theoretically feasible (deptree-resolver-260425h)",
    "nvidia-open-tinygrad-dkms-git": "BLOCKED: DKMS_KERNEL_MODULE: empty AUR repo, NVIDIA needs proprietary firmware (deptree-resolver-260425h)",
    "pamac-cli": "BLOCKED: DISTRO_SPECIFIC: Package Manager for ALPM (pacman) (deptree-resolver-260425h)",
    "pulumi-git": "BLOCKED: DEP_RESOLUTION_FAILED: large multi-language project (Go+Node+Python) (deptree-resolver-260425h)",
    "python-gradio-pdf": "BLOCKED: DEP_RESOLUTION_FAILED: needs python-gradio (massive dep tree) (deptree-resolver-260425h)",
    "python-jaxlib-bin": "BLOCKED: SOURCE_UNAVAILABLE: binary wheel, source build requires Bazel (extreme difficulty) (deptree-resolver-260425h)",
    "python-pypi2pkgbuild": "BLOCKED: DISTRO_SPECIFIC: PyPI to PKGBUILD converter (deptree-resolver-260425h)",
}


def update_org_file(org_path, pass_id, resolved_recipes, already_resolved, blocked_updates):
    """Update todo_general_packages.org with resolution results."""
    with open(org_path, 'r') as f:
        lines = f.readlines()

    pattern = re.compile(r'^(\*\* )(BLOCKED|DONE)\s+(\d+)\.\s+(\S+)')
    changes = 0

    i = 0
    while i < len(lines):
        m = pattern.match(lines[i])
        if m:
            prefix, status, number, name = m.group(1), m.group(2), m.group(3), m.group(4)
            if status == 'BLOCKED':
                if name in resolved_recipes:
                    lines[i] = f"{prefix}DONE {number}. {name}\n"
                    j = i + 1
                    while j < len(lines) and not lines[j].startswith("** "):
                        j += 1
                    status_line = f"   - Status: {resolved_recipes[name]}\n"
                    lines.insert(j, status_line)
                    changes += 1
                elif name in already_resolved:
                    lines[i] = f"{prefix}DONE {number}. {name}\n"
                    j = i + 1
                    while j < len(lines) and not lines[j].startswith("** "):
                        j += 1
                    status_line = f"   - Status: {already_resolved[name]}\n"
                    lines.insert(j, status_line)
                    changes += 1
                elif name in blocked_updates:
                    # Update the tag to include this pass
                    if f":{pass_id}:" not in lines[i]:
                        lines[i] = lines[i].rstrip() + f":{pass_id}:\n"
        i += 1

    with tempfile.NamedTemporaryFile(mode='w', dir=org_path.parent,
                                     suffix='.tmp', delete=False) as tmp:
        tmp.writelines(lines)
        tmp_path = tmp.name
    shutil.move(tmp_path, str(org_path))
    return changes


def update_packages_scm(scm_path, pass_id):
    """Update guix/gaurix/packages.scm with pass comment and exports."""
    with open(scm_path, 'r') as f:
        content = f.read()

    lines = content.split('\n')

    # Add pass comment after the module definition line
    pass_comment = (
        f"            ;; {pass_id}: 100 BLOCKED evaluated "
        f"(6 recipes, 2 ALREADY_RESOLVED, 92 remain BLOCKED)"
    )

    # Insert before the first existing deptree/recipe comment
    insert_idx = None
    for idx, line in enumerate(lines):
        if line.strip().startswith(';; deptree-resolver-260425g:') or \
           line.strip().startswith(';; recipe-resolver-260425h:'):
            insert_idx = idx
            break

    if insert_idx is not None:
        lines.insert(insert_idx, pass_comment)

    # Add new package names to export list (before closing paren)
    new_exports = [
        "            neovim-lspconfig",
        "            qt5-mqtt",
        "            hq",
        "            php-mcrypt",
        "            sbctl",
        "            snowflake-pt-server",
    ]

    # Find the closing )) at end of file
    last_paren_idx = None
    for idx in range(len(lines) - 1, -1, -1):
        if lines[idx].strip() == '))':
            last_paren_idx = idx
            break

    if last_paren_idx:
        for j, exp in enumerate(new_exports):
            lines.insert(last_paren_idx + j, exp)

    with tempfile.NamedTemporaryFile(mode='w', dir=scm_path.parent,
                                     suffix='.tmp', delete=False) as tmp:
        tmp.write('\n'.join(lines))
        tmp_path = tmp.name
    shutil.move(tmp_path, str(scm_path))


def update_compat_scm(scm_path, pass_id):
    """Add module import for the new pass to general-compat.scm."""
    with open(scm_path, 'r') as f:
        content = f.read()

    new_import = f"  #:use-module (gaurix packages {pass_id})"

    lines = content.split('\n')

    # Insert at the top of the use-module list (after first line)
    insert_idx = 1  # after define-module line
    lines.insert(insert_idx, new_import)

    with tempfile.NamedTemporaryFile(mode='w', dir=scm_path.parent,
                                     suffix='.tmp', delete=False) as tmp:
        tmp.write('\n'.join(lines))
        tmp_path = tmp.name
    shutil.move(tmp_path, str(scm_path))


def main():
    print(f"=== Bookkeeping: {PASS_ID} ===")

    print("\nStep 1: Updating todo_general_packages.org...")
    changes = update_org_file(ORG_FILE, PASS_ID, RESOLVED_RECIPES, ALREADY_RESOLVED, BLOCKED_UPDATES)
    print(f"  Updated {changes} entries (BLOCKED -> DONE)")

    print("\nStep 2: Updating packages.scm...")
    update_packages_scm(PACKAGES_SCM, PASS_ID)
    print("  Done")

    print("\nStep 3: Updating general-compat.scm...")
    update_compat_scm(COMPAT_SCM, PASS_ID)
    print("  Done")

    print(f"\nBookkeeping complete for {PASS_ID}")
    print(f"  New recipes: {len(RESOLVED_RECIPES)}")
    print(f"  Already resolved: {len(ALREADY_RESOLVED)}")
    print(f"  Remain BLOCKED: {len(BLOCKED_UPDATES)}")
    print(f"  Total org changes: {changes}")


if __name__ == '__main__':
    main()
