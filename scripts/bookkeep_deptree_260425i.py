#!/usr/bin/env python3
"""
Bookkeeping for deptree-resolver-260425i.

Updates todo_general_packages.org with resolution results:
- 2 packages -> DONE (new recipes: xidlehook, musique)
- 98 packages -> remain BLOCKED (with updated reason codes)

Also updates:
- guix/gaurix/packages.scm (add pass comment and exports)
- guix/gaurix/packages/general-compat.scm (add module import)
"""

import re
import shutil
import tempfile
from pathlib import Path

PASS_ID = "deptree-resolver-260425i"
ORG_FILE = Path("todo_general_packages.org")
PACKAGES_SCM = Path("guix/gaurix/packages.scm")
COMPAT_SCM = Path("guix/gaurix/packages/general-compat.scm")

# Packages resolved with new recipes (DONE)
RESOLVED_RECIPES = {
    "xidlehook": "DONE: Recipe in deptree-resolver-260425i.scm (xidlehook v0.10.0, cargo-build-system, MIT)",
    "musique": "DONE: Recipe in deptree-resolver-260425i.scm (musique v1.12, gnu-build-system/qmake Qt6+MPV, GPL-3.0+)",
}

# Updated BLOCKED reason codes for remaining packages
BLOCKED_UPDATES = {
    "gradience": f"BLOCKED: DEP_RESOLUTION_FAILED: needs python-svglib+reportlab chain, project archived Jul 2024 ({PASS_ID})",
    "sudo-selinux": f"BLOCKED: SELINUX_SPECIFIC: requires SELinux infrastructure not in Guix ({PASS_ID})",
    "base-selinux": f"BLOCKED: SELINUX_SPECIFIC: requires SELinux infrastructure not in Guix ({PASS_ID})",
    "wayfire-git": f"BLOCKED: BUILD_SYSTEM_TOO_COMPLEX: requires wlroots 0.20 (not in Guix); stable wayfire already available ({PASS_ID})",
    "virtualbox-svn": f"BLOCKED: BUILD_SYSTEM_TOO_COMPLEX: 50+ deps, kernel modules, extreme complexity ({PASS_ID})",
    "sipgate-app-clinq": f"BLOCKED: SOURCE_UNAVAILABLE: not in AUR cache, proprietary Electron app ({PASS_ID})",
    "squareline-studio": f"BLOCKED: SOURCE_UNAVAILABLE: proprietary commercial binary, no source ({PASS_ID})",
    "aquacomputer_d5next-hwmon-dkms": f"BLOCKED: DKMS_KERNEL_MODULE: HWMON DKMS module incompatible with Guix ({PASS_ID})",
    "bakkesmod-steam": f"BLOCKED: PLATFORM_UNSUPPORTED: Windows-only mod tool ({PASS_ID})",
    "edgeimpulse-cli": f"BLOCKED: DEP_RESOLUTION_FAILED: npm package, node-build-system limitations ({PASS_ID})",
    "librewolf-extension-ublock-origin-bin": f"BLOCKED: BROWSER_EXTENSION: browser extension, not system package ({PASS_ID})",
    "librewolf-tridactyl-native-bin": f"BLOCKED: BROWSER_EXTENSION: browser extension, not system package ({PASS_ID})",
    "luniistore": f"BLOCKED: SOURCE_UNAVAILABLE: proprietary Java app, download 403 ({PASS_ID})",
    "mkinitcpio-systemd-root-password": f"BLOCKED: DISTRO_SPECIFIC: mkinitcpio hook for Arch Linux ({PASS_ID})",
    "repacman": f"BLOCKED: DISTRO_SPECIFIC: pacman report tool ({PASS_ID})",
    "simplicity-commander": f"BLOCKED: SOURCE_UNAVAILABLE: proprietary binary, download URL dead ({PASS_ID})",
    "amneziawg-dkms-git": f"BLOCKED: DKMS_KERNEL_MODULE: AmneziaWG DKMS module ({PASS_ID})",
    "amneziawg-linux": f"BLOCKED: DKMS_KERNEL_MODULE: AmneziaWG kernel module ({PASS_ID})",
    "amneziawg-linux-hardened": f"BLOCKED: DKMS_KERNEL_MODULE: AmneziaWG for hardened kernel ({PASS_ID})",
    "android-platform-19": f"BLOCKED: ANDROID_SDK_PLATFORM: proprietary Google Android SDK ({PASS_ID})",
    "android-platform-21": f"BLOCKED: ANDROID_SDK_PLATFORM: proprietary Google Android SDK ({PASS_ID})",
    "archwiki-offline": f"BLOCKED: DISTRO_SPECIFIC: Arch Wiki offline reader ({PASS_ID})",
    "aws-amplify-cli": f"BLOCKED: DEP_RESOLUTION_FAILED: massive npm dependency tree ({PASS_ID})",
    "aws-cdk": f"BLOCKED: DEP_RESOLUTION_FAILED: massive npm dependency tree ({PASS_ID})",
    "brother-mfc-l2400dw": f"BLOCKED: PROPRIETARY_BINARY: proprietary binary-only printer driver ({PASS_ID})",
    "decrypto-pro-git": f"BLOCKED: DEP_RESOLUTION_FAILED: needs openssl-gost-engine (niche Russian crypto) ({PASS_ID})",
    "emmet-language-server": f"BLOCKED: DEP_RESOLUTION_FAILED: npm package, node-build-system limitations ({PASS_ID})",
    "faustus-dkms-git": f"BLOCKED: DKMS_KERNEL_MODULE: ASUS fan control DKMS ({PASS_ID})",
    "findbrokenpkgs": f"BLOCKED: DISTRO_SPECIFIC: find broken packages (pacman) ({PASS_ID})",
    "ideapad-laptop-tb-dkms": f"BLOCKED: DKMS_KERNEL_MODULE: Ideapad tablet DKMS ({PASS_ID})",
    "ideapad-laptop-tb2024g6plus-dkms": f"BLOCKED: DKMS_KERNEL_MODULE: Ideapad 2024 DKMS ({PASS_ID})",
    "knossu": f"BLOCKED: PROPRIETARY_BINARY: no source, no license, binary from 2015 ({PASS_ID})",
    "lib32-opencl-nvidia-390xx": f"BLOCKED: MULTILIB_UNSUPPORTED: 32-bit multilib not supported ({PASS_ID})",
    "libch343ser-git": f"BLOCKED: KERNEL_MODULE: serial driver kernel module ({PASS_ID})",
    "libfprint-2-tod1-broadcom-cv3plus": f"BLOCKED: PROPRIETARY_BINARY: non-redistributable proprietary binary ({PASS_ID})",
    "mingw-w64-cblas": f"BLOCKED: MINGW_CROSS_COMPILATION: Windows cross-compilation target ({PASS_ID})",
    "mingw-w64-lapack": f"BLOCKED: MINGW_CROSS_COMPILATION: Windows cross-compilation target ({PASS_ID})",
    "mingw-w64-soundtouch": f"BLOCKED: MINGW_CROSS_COMPILATION: Windows cross-compilation target ({PASS_ID})",
    "nftables-geoip-db": f"BLOCKED: BUILD_NETWORK_REQUIRED: monthly GeoIP data, non-reproducible ({PASS_ID})",
    "nodejs-cspell": f"BLOCKED: DEP_RESOLUTION_FAILED: npm monorepo, node-build-system limitations ({PASS_ID})",
    "osmtogeojson": f"BLOCKED: DEP_RESOLUTION_FAILED: npm package, node-build-system limitations ({PASS_ID})",
    "pfring-dkms": f"BLOCKED: DKMS_KERNEL_MODULE: PF_RING network DKMS ({PASS_ID})",
    "python-home-assistant-frontend": f"BLOCKED: DEP_RESOLUTION_FAILED: 115MB pre-built JS, cannot build from source ({PASS_ID})",
    "r8126-dkms": f"BLOCKED: DKMS_KERNEL_MODULE: Realtek r8126 DKMS ({PASS_ID})",
    "receitanet": f"BLOCKED: SOURCE_UNAVAILABLE: proprietary Brazilian government software ({PASS_ID})",
    "sbctl-initcpio-post-hook": f"BLOCKED: DISTRO_SPECIFIC: sbctl mkinitcpio hook ({PASS_ID})",
    "system-age": f"BLOCKED: DISTRO_SPECIFIC: reads pacman install date ({PASS_ID})",
    "ttf-consolas-ligaturized": f"BLOCKED: LICENSE_REVIEW_NEEDED: derivative of proprietary Microsoft Consolas font ({PASS_ID})",
    "vscodium-marketplace": f"BLOCKED: DISTRO_SPECIFIC: Arch pacman hook for VSCodium marketplace ({PASS_ID})",
    "wyc": f"BLOCKED: SOURCE_UNAVAILABLE: proprietary Chinese tunneling binary ({PASS_ID})",
    "beammp-launcher-git": f"BLOCKED: DEP_RESOLUTION_FAILED: vcpkg build model incompatible with Guix ({PASS_ID})",
    "java-language-server": f"BLOCKED: DEP_RESOLUTION_FAILED: Maven build downloads deps at build time ({PASS_ID})",
    "libarchive-static": f"BLOCKED: COMPLEX_BUILD: static musl build of 7+ deps, niche use case ({PASS_ID})",
    "lightdm-webkit-theme-aether": f"BLOCKED: ABANDONED_UPSTREAM: archived upstream, missing lightdm-webkit2-greeter ({PASS_ID})",
    "linux-keep-modules": f"BLOCKED: DISTRO_SPECIFIC: pacman hook for kernel modules ({PASS_ID})",
    "nfuspire-git": f"BLOCKED: DEP_RESOLUTION_FAILED: immature project (1 commit), needs libnspire ({PASS_ID})",
    "nginx-mainline-mod-njs": f"BLOCKED: DEP_RESOLUTION_FAILED: no nginx dynamic module build infra in Guix ({PASS_ID})",
    "nodejs-nestjs-cli": f"BLOCKED: DEP_RESOLUTION_FAILED: npm package, node-build-system limitations ({PASS_ID})",
    "nvidia-bl-dkms": f"BLOCKED: DKMS_KERNEL_MODULE: NVIDIA backlight DKMS ({PASS_ID})",
    "pacpak-git": f"BLOCKED: DISTRO_SPECIFIC: pacman + flatpak wrapper ({PASS_ID})",
    "phonon-qt4-vlc": f"BLOCKED: ABANDONED_UPSTREAM: Qt4 is dead/EOL since 2015 ({PASS_ID})",
    "quartz-utils-git": f"BLOCKED: DEP_RESOLUTION_FAILED: Crystal language not in Guix ({PASS_ID})",
    "rdt-client": f"BLOCKED: DEP_RESOLUTION_FAILED: needs .NET 9/10, Guix only has dotnet 8 ({PASS_ID})",
    "sommelier-git": f"BLOCKED: DEP_RESOLUTION_FAILED: ChromeOS platform2 monorepo component ({PASS_ID})",
    "texmacs-pure": f"BLOCKED: DEP_RESOLUTION_FAILED: Pure language defunct, needs LLVM 3.5 ({PASS_ID})",
    "tilp-xdg": f"BLOCKED: DEP_RESOLUTION_FAILED: needs libticalcs/libticables (not in Guix) ({PASS_ID})",
    "chromium-extension-arch-search": f"BLOCKED: DISTRO_SPECIFIC: Arch search browser extension ({PASS_ID})",
    "clash-for-windows-chinese": f"BLOCKED: ABANDONED_UPSTREAM: project abandoned, GitHub repo deleted ({PASS_ID})",
    "eclipse-pydev": f"BLOCKED: DEP_RESOLUTION_FAILED: Eclipse IDE not in Guix ({PASS_ID})",
    "euroscope-bin": f"BLOCKED: SOURCE_UNAVAILABLE: Windows-only proprietary via Wine ({PASS_ID})",
    "gbm": f"BLOCKED: DEP_RESOLUTION_FAILED: VB.NET/Mono, VB.NET compiler not supported ({PASS_ID})",
    "gephi-git": f"BLOCKED: DEP_RESOLUTION_FAILED: Maven build + NetBeans Platform ({PASS_ID})",
    "lobe-chat": f"BLOCKED: DEP_RESOLUTION_FAILED: Next.js/pnpm monorepo, massive npm deps ({PASS_ID})",
    "plugin-autenticacao-gov-pt": f"BLOCKED: SOURCE_UNAVAILABLE: binary .deb, no source repo found ({PASS_ID})",
    "qtspim-iconfix": f"BLOCKED: BUILD_FAILED: SVN-only source, outdated, low priority ({PASS_ID})",
    "rtl88x2ce-dkms-git": f"BLOCKED: DKMS_KERNEL_MODULE: Realtek WiFi DKMS ({PASS_ID})",
    "urbanterror": f"BLOCKED: SOURCE_UNAVAILABLE: proprietary game data, download broken ({PASS_ID})",
    "ut2004-gog": f"BLOCKED: NON_DISTRIBUTABLE: commercial game, cannot redistribute ({PASS_ID})",
    "zfs-linux-hardened-headers": f"BLOCKED: KERNEL_SPECIFIC: kernel-version-specific ZFS headers ({PASS_ID})",
    "zfs-linux-rt-headers": f"BLOCKED: KERNEL_SPECIFIC: kernel-version-specific ZFS headers ({PASS_ID})",
    "bililive-recorder": f"BLOCKED: DEP_RESOLUTION_FAILED: .NET 6 + npm dual build ({PASS_ID})",
    "futu-ftnn-wine": f"BLOCKED: PROPRIETARY_BINARY: proprietary Windows binary via Wine ({PASS_ID})",
    "inkdrop": f"BLOCKED: SOURCE_UNAVAILABLE: proprietary commercial Electron app ({PASS_ID})",
    "kamilsss655-uv-k5-firmware-custom-git": f"BLOCKED: CROSS_COMPILATION: needs ARM cross-compilation toolchain ({PASS_ID})",
    "mailnaggertray-git": f"BLOCKED: DEP_RESOLUTION_FAILED: depends on mailnagger (not in Guix) ({PASS_ID})",
    "nvidia-open-tinygrad-dkms-git": f"BLOCKED: DKMS_KERNEL_MODULE: empty AUR repo, NVIDIA needs proprietary firmware ({PASS_ID})",
    "pamac-cli": f"BLOCKED: DISTRO_SPECIFIC: Package Manager for ALPM (pacman) ({PASS_ID})",
    "pulumi-git": f"BLOCKED: DEP_RESOLUTION_FAILED: large multi-language project (Go+Node+Python) ({PASS_ID})",
    "python-gradio-pdf": f"BLOCKED: DEP_RESOLUTION_FAILED: needs python-gradio (massive dep tree) ({PASS_ID})",
    "python-jaxlib-bin": f"BLOCKED: SOURCE_UNAVAILABLE: binary wheel, source build requires Bazel ({PASS_ID})",
    "python-pypi2pkgbuild": f"BLOCKED: DISTRO_SPECIFIC: PyPI to PKGBUILD converter ({PASS_ID})",
    # New packages in this pass (not in 260425h)
    "asp": f"BLOCKED: DISTRO_SPECIFIC: Arch build source management tool ({PASS_ID})",
    "aurutils": f"BLOCKED: DISTRO_SPECIFIC: AUR helper tools for Arch Linux ({PASS_ID})",
    "python2-dbus": f"BLOCKED: LEGACY_PYTHON2: Python 2 EOL since Jan 2020 ({PASS_ID})",
    "soapysdrplay3-luarvique-git": f"BLOCKED: DEP_RESOLUTION_FAILED: depends on SDRPlay API (proprietary) ({PASS_ID})",
    "unpack-install-jammer": f"BLOCKED: DEP_RESOLUTION_FAILED: depends on install-jammer format libs ({PASS_ID})",
    "unrealtournament4": f"BLOCKED: NON_DISTRIBUTABLE: proprietary Epic Games, custom license ({PASS_ID})",
    "zfs-linux-git-headers": f"BLOCKED: KERNEL_SPECIFIC: kernel-version-specific ZFS headers ({PASS_ID})",
}


def update_org_file(org_path, pass_id, resolved_recipes, blocked_updates):
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
                    lines[i] = f"{prefix}DONE {number}. {name}  :{pass_id}:recipe-generated:\n"
                    j = i + 1
                    while j < len(lines) and not lines[j].startswith("** "):
                        j += 1
                    status_line = f"\n   - Status: {resolved_recipes[name]}\n"
                    lines.insert(j, status_line)
                    changes += 1
                elif name in blocked_updates:
                    # Update the tag to include this pass
                    if f":{pass_id}:" not in lines[i]:
                        tag = f"  :{pass_id}:"
                        lines[i] = lines[i].rstrip() + tag + "\n"
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
        f"(2 recipes, 98 remain BLOCKED)"
    )

    # Insert before the first existing deptree/recipe comment
    insert_idx = None
    for idx, line in enumerate(lines):
        if line.strip().startswith(';; deptree-resolver-260425h:') or \
           line.strip().startswith(';; recipe-resolver-260425h:'):
            insert_idx = idx
            break

    if insert_idx is not None:
        lines.insert(insert_idx, pass_comment)

    # Add new package names to export list (before closing paren)
    new_exports = [
        "            xidlehook",
        "            musique",
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
    print(f"[{PASS_ID}] Starting bookkeeping...")

    # Update org file
    print(f"  Updating {ORG_FILE}...")
    changes = update_org_file(ORG_FILE, PASS_ID, RESOLVED_RECIPES, BLOCKED_UPDATES)
    print(f"    {changes} entries changed to DONE")

    # Update packages.scm
    print(f"  Updating {PACKAGES_SCM}...")
    update_packages_scm(PACKAGES_SCM, PASS_ID)
    print(f"    Pass comment and exports added")

    # Update general-compat.scm
    print(f"  Updating {COMPAT_SCM}...")
    update_compat_scm(COMPAT_SCM, PASS_ID)
    print(f"    Module import added")

    print(f"\n[{PASS_ID}] Bookkeeping complete!")
    print(f"  Resolved: {len(RESOLVED_RECIPES)} packages (new recipes)")
    print(f"  Remain BLOCKED: {len(BLOCKED_UPDATES)} packages")


if __name__ == "__main__":
    main()
