#!/usr/bin/env python3
"""
Bookkeeping for deptree-resolver-260426f.

Updates todo_general_packages.org with resolution results:
- 2 packages -> DONE (new recipes: arti, vegastrike + vegastrike-engine)
- 98 packages -> remain BLOCKED (with confirmed/updated reason codes)

Also updates:
- guix/gaurix/packages.scm (add pass comment and exports)
- guix/gaurix/packages/general-compat.scm (add module import)
"""

import re
import shutil
import tempfile
from pathlib import Path

PASS_ID = "deptree-resolver-260426f"
ORG_FILE = Path("todo_general_packages.org")
PACKAGES_SCM = Path("guix/gaurix/packages.scm")
COMPAT_SCM = Path("guix/gaurix/packages/general-compat.scm")

# Packages resolved with new recipes (DONE)
RESOLVED_RECIPES = {
    "arti-git": f"DONE: Recipe in {PASS_ID}.scm (arti v2.2.0, cargo-build-system, Rust Tor implementation, MIT/Apache-2.0)",
    "vegastrike-git": f"DONE: Recipe in {PASS_ID}.scm (vegastrike v0.9.1 + vegastrike-engine v0.9.1, cmake/copy-build-system, space sim, GPL-2.0+)",
}

# Updated BLOCKED reason codes for remaining 98 packages
BLOCKED_UPDATES = {
    "gradience": f"BLOCKED: AUR_REPO_DELETED: project archived Jul 2024, removed from AUR ({PASS_ID})",
    "sudo-selinux": f"BLOCKED: SELINUX_SPECIFIC: requires SELinux infrastructure ({PASS_ID})",
    "base-selinux": f"BLOCKED: SELINUX_SPECIFIC: requires SELinux infrastructure ({PASS_ID})",
    "virtualbox-svn": f"BLOCKED: BUILD_SYSTEM_TOO_COMPLEX: 53+ deps, kernel modules, proprietary ({PASS_ID})",
    "deadbeef-mpris2-plugin": f"BLOCKED: SOURCE_UNAVAILABLE: functionality merged into DeaDBeeF 1.10.2+ ({PASS_ID})",
    "linux6.18.22-1-lts-bin": f"BLOCKED: SOURCE_UNAVAILABLE: not in AUR cache, removed or renamed ({PASS_ID})",
    "matlab-jre-bundled": f"BLOCKED: SOURCE_UNAVAILABLE: proprietary MATLAB component ({PASS_ID})",
    "sipgate-app-clinq": f"BLOCKED: SOURCE_UNAVAILABLE: proprietary Electron app, not in AUR cache ({PASS_ID})",
    "squareline-studio": f"BLOCKED: PROPRIETARY_BINARY: commercial binary, custom license ({PASS_ID})",
    "aquacomputer_d5next-hwmon-dkms": f"BLOCKED: DKMS_KERNEL_MODULE: HWMON DKMS module ({PASS_ID})",
    "bakkesmod-steam": f"BLOCKED: PLATFORM_UNSUPPORTED: Windows-only game mod tool ({PASS_ID})",
    "edgeimpulse-cli": f"BLOCKED: DEP_RESOLUTION_FAILED: npm + 29 native deps (sharp, serialport) ({PASS_ID})",
    "librewolf-extension-ublock-origin-bin": f"BLOCKED: BROWSER_EXTENSION: browser extension .xpi ({PASS_ID})",
    "luniistore": f"BLOCKED: SOURCE_UNAVAILABLE: proprietary Java app, download 403 ({PASS_ID})",
    "mkinitcpio-systemd-root-password": f"BLOCKED: DISTRO_SPECIFIC: Arch mkinitcpio hook ({PASS_ID})",
    "repacman": f"BLOCKED: DISTRO_SPECIFIC: pacman report tool ({PASS_ID})",
    "simplicity-commander": f"BLOCKED: SOURCE_UNAVAILABLE: proprietary binary, download URL dead ({PASS_ID})",
    "amneziawg-dkms-git": f"BLOCKED: DKMS_KERNEL_MODULE: AmneziaWG DKMS ({PASS_ID})",
    "amneziawg-linux": f"BLOCKED: DKMS_KERNEL_MODULE: AmneziaWG kernel module ({PASS_ID})",
    "amneziawg-linux-hardened": f"BLOCKED: DKMS_KERNEL_MODULE: AmneziaWG for hardened kernel ({PASS_ID})",
    "android-platform-19": f"BLOCKED: PLATFORM_UNSUPPORTED: proprietary Google Android SDK ({PASS_ID})",
    "android-platform-21": f"BLOCKED: PLATFORM_UNSUPPORTED: proprietary Google Android SDK ({PASS_ID})",
    "archwiki-offline": f"BLOCKED: DISTRO_SPECIFIC: Arch Wiki offline reader ({PASS_ID})",
    "aws-amplify-cli": f"BLOCKED: DEP_RESOLUTION_FAILED: massive npm dependency tree ({PASS_ID})",
    "aws-cdk": f"BLOCKED: DEP_RESOLUTION_FAILED: massive npm dependency tree ({PASS_ID})",
    "brother-mfc-l2400dw": f"BLOCKED: PROPRIETARY_BINARY: binary-only i386 printer driver ({PASS_ID})",
    "emmet-language-server": f"BLOCKED: DEP_RESOLUTION_FAILED: npm, 6 direct + many transitive deps ({PASS_ID})",
    "faustus-dkms-git": f"BLOCKED: DKMS_KERNEL_MODULE: ASUS fan control DKMS ({PASS_ID})",
    "findbrokenpkgs": f"BLOCKED: DISTRO_SPECIFIC: pacman broken-package finder ({PASS_ID})",
    "ideapad-laptop-tb-dkms": f"BLOCKED: DKMS_KERNEL_MODULE: Ideapad tablet DKMS ({PASS_ID})",
    "ideapad-laptop-tb2024g6plus-dkms": f"BLOCKED: DKMS_KERNEL_MODULE: Ideapad 2024 DKMS ({PASS_ID})",
    "knossu": f"BLOCKED: SOURCE_UNAVAILABLE: binary-only from 2015, obsolete deps ({PASS_ID})",
    "lib32-opencl-nvidia-390xx": f"BLOCKED: MULTILIB_UNSUPPORTED: 32-bit multilib not supported ({PASS_ID})",
    "libch343ser-git": f"BLOCKED: KERNEL_MODULE: kernel module, AUR repo empty ({PASS_ID})",
    "libfprint-2-tod1-broadcom-cv3plus": f"BLOCKED: PROPRIETARY_BINARY: non-redistributable ({PASS_ID})",
    "mingw-w64-cblas": f"BLOCKED: MINGW_CROSS_COMPILATION: Windows cross-compilation target ({PASS_ID})",
    "mingw-w64-lapack": f"BLOCKED: MINGW_CROSS_COMPILATION: Windows cross-compilation target ({PASS_ID})",
    "mingw-w64-soundtouch": f"BLOCKED: MINGW_CROSS_COMPILATION: Windows cross-compilation target ({PASS_ID})",
    "nodejs-cspell": f"BLOCKED: DEP_RESOLUTION_FAILED: npm monorepo, 200+ transitive deps ({PASS_ID})",
    "osmtogeojson": f"BLOCKED: DEP_RESOLUTION_FAILED: npm, 10 direct deps + transitive tree ({PASS_ID})",
    "pfring-dkms": f"BLOCKED: DKMS_KERNEL_MODULE: PF_RING network DKMS ({PASS_ID})",
    "python-home-assistant-frontend": f"BLOCKED: DEP_RESOLUTION_FAILED: 115MB pre-built JS frontend ({PASS_ID})",
    "r8126-dkms": f"BLOCKED: DKMS_KERNEL_MODULE: Realtek r8126 DKMS ({PASS_ID})",
    "receitanet": f"BLOCKED: SOURCE_UNAVAILABLE: proprietary Brazilian government software ({PASS_ID})",
    "sbctl-initcpio-post-hook": f"BLOCKED: DISTRO_SPECIFIC: sbctl mkinitcpio hook ({PASS_ID})",
    "system-age": f"BLOCKED: DISTRO_SPECIFIC: reads pacman install date ({PASS_ID})",
    "ttf-consolas-ligaturized": f"BLOCKED: NON_DISTRIBUTABLE: derivative of proprietary Microsoft font ({PASS_ID})",
    "vscodium-marketplace": f"BLOCKED: TOOLING_FAILURE: patches vscodium product.json, licensing concern ({PASS_ID})",
    "wyc": f"BLOCKED: SOURCE_UNAVAILABLE: proprietary Chinese tunneling binary ({PASS_ID})",
    "java-language-server": f"BLOCKED: DEP_RESOLUTION_FAILED: Maven downloads 100+ deps at build time ({PASS_ID})",
    "libarchive-static": f"BLOCKED: TOOLING_FAILURE: static musl build, musl toolchain not mature in Guix ({PASS_ID})",
    "lightdm-webkit-theme-aether": f"BLOCKED: ABANDONED_UPSTREAM: needs lightdm-webkit2-greeter, project archived ({PASS_ID})",
    "linux-keep-modules": f"BLOCKED: DISTRO_SPECIFIC: pacman hook for kernel modules ({PASS_ID})",
    "nfuspire-git": f"BLOCKED: DEP_RESOLUTION_FAILED: needs libnspire (not in Guix), dormant ({PASS_ID})",
    "nodejs-nestjs-cli": f"BLOCKED: DEP_RESOLUTION_FAILED: npm, deep node dependency tree ({PASS_ID})",
    "nvidia-bl-dkms": f"BLOCKED: DKMS_KERNEL_MODULE: NVIDIA backlight DKMS ({PASS_ID})",
    "pacpak-git": f"BLOCKED: DISTRO_SPECIFIC: pacman + flatpak wrapper ({PASS_ID})",
    "phonon-qt4-vlc": f"BLOCKED: DEP_RESOLUTION_FAILED: Qt4 dead/EOL since 2015 ({PASS_ID})",
    "quartz-utils-git": f"BLOCKED: DEP_RESOLUTION_FAILED: Crystal language not in Guix ({PASS_ID})",
    "rdt-client": f"BLOCKED: DEP_RESOLUTION_FAILED: needs .NET 9/10, Guix only has dotnet 8 ({PASS_ID})",
    "texmacs-pure": f"BLOCKED: DEP_RESOLUTION_FAILED: Pure language defunct, needs LLVM 3.5 ({PASS_ID})",
    "chromium-extension-arch-search": f"BLOCKED: DISTRO_SPECIFIC: Arch search browser extension ({PASS_ID})",
    "clash-for-windows-chinese": f"BLOCKED: ABANDONED_UPSTREAM: GitHub repo deleted ({PASS_ID})",
    "eclipse-pydev": f"BLOCKED: DEP_RESOLUTION_FAILED: Eclipse IDE not in Guix ({PASS_ID})",
    "euroscope-bin": f"BLOCKED: PLATFORM_UNSUPPORTED: Windows-only proprietary via Wine ({PASS_ID})",
    "gbm": f"BLOCKED: DEP_RESOLUTION_FAILED: VB.NET/Mono, mono-basic compiler not in Guix ({PASS_ID})",
    "gephi-git": f"BLOCKED: DEP_RESOLUTION_FAILED: Maven + NetBeans Platform double blocker ({PASS_ID})",
    "plugin-autenticacao-gov-pt": f"BLOCKED: SOURCE_UNAVAILABLE: binary .deb, no source repo ({PASS_ID})",
    "rtl88x2ce-dkms-git": f"BLOCKED: DKMS_KERNEL_MODULE: Realtek WiFi DKMS ({PASS_ID})",
    "urbanterror": f"BLOCKED: SOURCE_UNAVAILABLE: proprietary game data, download broken ({PASS_ID})",
    "ut2004-gog": f"BLOCKED: NON_DISTRIBUTABLE: commercial game ({PASS_ID})",
    "zfs-linux-hardened-headers": f"BLOCKED: KERNEL_SPECIFIC: kernel-version-specific ZFS headers ({PASS_ID})",
    "zfs-linux-rt-headers": f"BLOCKED: KERNEL_SPECIFIC: kernel-version-specific ZFS headers ({PASS_ID})",
    "futu-ftnn-wine": f"BLOCKED: PROPRIETARY_BINARY: proprietary Windows binary via Wine ({PASS_ID})",
    "inkdrop": f"BLOCKED: SOURCE_UNAVAILABLE: proprietary commercial Electron app ({PASS_ID})",
    "kamilsss655-uv-k5-firmware-custom-git": f"BLOCKED: CROSS_COMPILATION: needs ARM cross-compilation toolchain ({PASS_ID})",
    "mailnaggertray-git": f"BLOCKED: DEP_RESOLUTION_FAILED: missing mailnagger dep, 11 commits ({PASS_ID})",
    "nvidia-open-tinygrad-dkms-git": f"BLOCKED: DKMS_KERNEL_MODULE: empty AUR repo ({PASS_ID})",
    "pamac-cli": f"BLOCKED: DISTRO_SPECIFIC: ALPM/pacman package manager frontend ({PASS_ID})",
    "pulumi-git": f"BLOCKED: DEP_RESOLUTION_FAILED: large multi-language Go+Node+Python ({PASS_ID})",
    "python-gradio-pdf": f"BLOCKED: DEP_RESOLUTION_FAILED: needs python-gradio (massive dep tree) ({PASS_ID})",
    "python-jaxlib-bin": f"BLOCKED: SOURCE_UNAVAILABLE: binary wheel, source needs Bazel ({PASS_ID})",
    "python-pypi2pkgbuild": f"BLOCKED: DISTRO_SPECIFIC: PyPI to PKGBUILD converter ({PASS_ID})",
    "soapysdrplay3-luarvique-git": f"BLOCKED: PROPRIETARY_DEP: depends on SDRPlay API (proprietary) ({PASS_ID})",
    "unrealtournament4": f"BLOCKED: NON_DISTRIBUTABLE: proprietary Epic Games ({PASS_ID})",
    "zfs-linux-git-headers": f"BLOCKED: KERNEL_SPECIFIC: kernel-version-specific ZFS headers ({PASS_ID})",
    "asp": f"BLOCKED: DISTRO_SPECIFIC: Arch build source management tool ({PASS_ID})",
    "aurutils": f"BLOCKED: DISTRO_SPECIFIC: AUR helper tools ({PASS_ID})",
    "awk-language-server": f"BLOCKED: DEP_RESOLUTION_FAILED: npm/TypeScript, needs yarn ({PASS_ID})",
    "factorio-space-age-experimental": f"BLOCKED: NON_DISTRIBUTABLE: proprietary commercial game ({PASS_ID})",
    "fileoptimizer-bin": f"BLOCKED: PLATFORM_UNSUPPORTED: Wine-based Windows app ({PASS_ID})",
    "lib32-libglade": f"BLOCKED: MULTILIB_UNSUPPORTED: 32-bit multilib not supported ({PASS_ID})",
    "mingw-w64-boost": f"BLOCKED: MINGW_CROSS_COMPILATION: Windows cross-compilation target ({PASS_ID})",
    "mingw-w64-cppwinrt": f"BLOCKED: MINGW_CROSS_COMPILATION: Windows cross-compilation target ({PASS_ID})",
    "mingw-w64-pcre2": f"BLOCKED: MINGW_CROSS_COMPILATION: Windows cross-compilation target ({PASS_ID})",
    "mingw-w64-spirv-tools": f"BLOCKED: MINGW_CROSS_COMPILATION: Windows cross-compilation target ({PASS_ID})",
    "vivaldi-autoinject-custom-js-ui": f"BLOCKED: TOOLING_FAILURE: depends on vivaldi (proprietary) ({PASS_ID})",
    "dxvk-async-git": f"BLOCKED: MINGW_CROSS_COMPILATION: needs mingw-w64-gcc for Windows DLLs ({PASS_ID})",
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
            prefix, status, number, name_raw = m.group(1), m.group(2), m.group(3), m.group(4)
            name = re.split(r'[\s:\[\(]', name_raw)[0].rstrip(':')
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

    pass_comment = (
        f"            ;; {pass_id}: 100 BLOCKED evaluated "
        f"(3 recipes: arti, vegastrike-engine, vegastrike; 97 remain BLOCKED)"
    )

    # Insert before the first existing deptree/recipe comment
    insert_idx = None
    for idx, line in enumerate(lines):
        if line.strip().startswith(';; deptree-resolver-260426') or \
           line.strip().startswith(';; recipe-resolver-260426') or \
           line.strip().startswith(';; deptree-resolver-260425') or \
           line.strip().startswith(';; recipe-resolver-260425'):
            insert_idx = idx
            break

    if insert_idx is not None:
        lines.insert(insert_idx, pass_comment)

    # Add new package names to export list (before closing paren)
    new_exports = [
        "            arti",
        "            vegastrike-engine",
        "            vegastrike",
    ]

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
    insert_idx = 1
    lines.insert(insert_idx, new_import)

    with tempfile.NamedTemporaryFile(mode='w', dir=scm_path.parent,
                                     suffix='.tmp', delete=False) as tmp:
        tmp.write('\n'.join(lines))
        tmp_path = tmp.name
    shutil.move(tmp_path, str(scm_path))


def main():
    print(f"[{PASS_ID}] Starting bookkeeping...")

    print(f"  Updating {ORG_FILE}...")
    changes = update_org_file(
        ORG_FILE, PASS_ID,
        RESOLVED_RECIPES,
        BLOCKED_UPDATES
    )
    print(f"    {changes} entries changed to DONE")

    print(f"  Updating {PACKAGES_SCM}...")
    update_packages_scm(PACKAGES_SCM, PASS_ID)
    print(f"    Pass comment and exports added")

    print(f"  Updating {COMPAT_SCM}...")
    update_compat_scm(COMPAT_SCM, PASS_ID)
    print(f"    Module import added")

    print(f"\n[{PASS_ID}] Bookkeeping complete!")
    print(f"  New recipes: 3 (arti, vegastrike-engine, vegastrike)")
    print(f"  AUR packages resolved: arti-git, vegastrike-git")
    print(f"  Remain BLOCKED: {len(BLOCKED_UPDATES)} packages")


if __name__ == "__main__":
    main()
