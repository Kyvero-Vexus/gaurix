#!/usr/bin/env python3
"""
deptree-resolver-260425c: Update todo_general_packages.org
and general-compat.scm for the 260425c deptree resolver pass.

Processes 100 BLOCKED packages from dependency-tree priority queue.
"""
import shutil
import tempfile
import os
import re

PASS_ID = "deptree-resolver-260425c"
BASE = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
TODO_FILE = os.path.join(BASE, "todo_general_packages.org")
COMPAT_FILE = os.path.join(BASE, "guix", "gaurix", "packages", "general-compat.scm")
PACKAGES_FILE = os.path.join(BASE, "guix", "gaurix", "packages.scm")

# --- Status updates for each entry ---
# (org_number, name, status_type, status_text)
# status_type: "done_recipe" | "done_already_in_guix" | "blocked"

TODO_UPDATES = [
    # === DONE: new recipes created ===
    (18408, "ddpolymerase", "done_recipe",
     "DONE: recipe in deptree-resolver-260425c.scm (ddpolymerase-bin v0.2.0, copy-build-system, GPL-3.0+)"),
    (18392, "wl-binclock", "done_recipe",
     "DONE: recipe in deptree-resolver-260425c.scm (wl-binclock-bin v2.0.0, copy-build-system, MIT)"),
    (18456, "hypraway", "done_recipe",
     "DONE: recipe in deptree-resolver-260425c.scm (hypraway-bin v1.2.0, copy-build-system, MIT)"),
    (18468, "python-materialyoucolor-git", "done_already_resolved",
     "DONE: ALREADY_RESOLVED: recipe exists in cron-c79f127f-r22-w00.scm (python-materialyoucolor v3.0.2) (deptree-resolver-260425c)"),
    (18589, "openexr-viewer", "done_recipe",
     "DONE: recipe in deptree-resolver-260425c.scm (openexr-viewer v0.6.1, cmake-build-system, BSD-3)"),
    (18415, "firetools-git", "done_recipe",
     "DONE: recipe in deptree-resolver-260425c.scm (firetools v0.9.72, gnu-build-system, GPL-2.0+)"),
    (18428, "ruby-ruby-vips", "done_recipe",
     "DONE: recipe in deptree-resolver-260425c.scm (ruby-ruby-vips v2.2.3, ruby-build-system, MIT)"),

    # === DONE: already in Guix ===
    (18687, "libcurl-gnutls-git", "done_already_in_guix",
     "DONE: ALREADY_IN_GUIX: Guix curl already uses GnuTLS by default; no separate -gnutls variant needed (deptree-resolver-260425c)"),

    # === BLOCKED: TOOLING_FAILURE ===
    (18513, "sudo-selinux", "blocked",
     "BLOCKED: TOOLING_FAILURE: SELinux variant of sudo; Guix does not use SELinux (deptree-resolver-260425c)"),
    (18537, "base-selinux", "blocked",
     "BLOCKED: TOOLING_FAILURE: Arch SELinux meta-package; not applicable to Guix (deptree-resolver-260425c)"),
    (18703, "neovim-lspconfig-opt-git", "blocked",
     "BLOCKED: TOOLING_FAILURE: Neovim LSP config as system package; manage via plugin manager (deptree-resolver-260425c)"),
    (18606, "aquacomputer_d5next-hwmon-dkms", "blocked",
     "BLOCKED: TOOLING_FAILURE: DKMS hwmon kernel module; Guix kernel model incompatible (deptree-resolver-260425c)"),
    (18423, "locale-mul_zz", "blocked",
     "BLOCKED: TOOLING_FAILURE: Custom multilingual locale; requires glibc locale infrastructure changes (deptree-resolver-260425c)"),
    (18642, "amneziawg-dkms-git", "blocked",
     "BLOCKED: TOOLING_FAILURE: AmneziaWG DKMS kernel module; DKMS incompatible with Guix (deptree-resolver-260425c)"),
    (18568, "archwiki-offline", "blocked",
     "BLOCKED: TOOLING_FAILURE: Arch-specific wiki viewer; relies on pacman paths (deptree-resolver-260425c)"),
    (18695, "vscodium-marketplace", "blocked",
     "BLOCKED: TOOLING_FAILURE: VSCodium marketplace patch; configure at user level (deptree-resolver-260425c)"),
    (18398, "php83-mcrypt", "blocked",
     "BLOCKED: TOOLING_FAILURE: PHP 8.3-specific PECL extension; Guix PHP version mismatch (deptree-resolver-260425c)"),
    (18617, "nvidia-open-tinygrad-dkms-git", "blocked",
     "BLOCKED: TOOLING_FAILURE: NVIDIA DKMS kernel modules; DKMS incompatible with Guix (deptree-resolver-260425c)"),

    # === BLOCKED: DKMS_KERNEL_MODULE ===
    (18452, "amneziawg-linux", "blocked",
     "BLOCKED: DKMS_KERNEL_MODULE: AmneziaWG kernel module; requires kernel integration (deptree-resolver-260425c)"),
    (18382, "amneziawg-linux-hardened", "blocked",
     "BLOCKED: DKMS_KERNEL_MODULE: AmneziaWG hardened kernel module; requires kernel integration (deptree-resolver-260425c)"),
    (18399, "pfring-dkms", "blocked",
     "BLOCKED: DKMS_KERNEL_MODULE: PF_RING packet capture; requires kernel integration (deptree-resolver-260425c)"),
    (18487, "r8126-dkms", "blocked",
     "BLOCKED: DKMS_KERNEL_MODULE: Realtek r8126 NIC driver; requires kernel integration (deptree-resolver-260425c)"),
    (17755, "nvidia-bl-dkms", "blocked",
     "BLOCKED: DKMS_KERNEL_MODULE: NVIDIA backlight DKMS module; requires kernel integration (deptree-resolver-260425c)"),
    (18362, "rtl88x2ce-dkms-git", "blocked",
     "BLOCKED: DKMS_KERNEL_MODULE: Realtek WiFi DKMS module; requires kernel integration (deptree-resolver-260425c)"),

    # === BLOCKED: KERNEL_MODULE ===
    (17880, "libch343ser-git", "blocked",
     "BLOCKED: KERNEL_MODULE: USB serial driver; requires kernel source integration (deptree-resolver-260425c)"),

    # === BLOCKED: KERNEL_SPECIFIC ===
    (17921, "zfs-linux-hardened-headers", "blocked",
     "BLOCKED: KERNEL_SPECIFIC: ZFS headers for hardened kernel; no matching kernel in Guix (deptree-resolver-260425c)"),
    (17920, "zfs-linux-rt-headers", "blocked",
     "BLOCKED: KERNEL_SPECIFIC: ZFS headers for RT kernel; no matching kernel in Guix (deptree-resolver-260425c)"),

    # === BLOCKED: PLATFORM_UNSUPPORTED ===
    (17468, "bakkesmod-steam", "blocked",
     "BLOCKED: PLATFORM_UNSUPPORTED: Windows-only Rocket League mod (deptree-resolver-260425c)"),

    # === BLOCKED: MINGW_CROSS_COMPILATION ===
    (34115, "mingw-w64-cblas", "blocked",
     "BLOCKED: MINGW_CROSS_COMPILATION: Windows cross-compilation target (deptree-resolver-260425c)"),
    (34113, "mingw-w64-lapack", "blocked",
     "BLOCKED: MINGW_CROSS_COMPILATION: Windows cross-compilation target (deptree-resolver-260425c)"),
    (18330, "mingw-w64-soundtouch", "blocked",
     "BLOCKED: MINGW_CROSS_COMPILATION: Windows cross-compilation target (deptree-resolver-260425c)"),
    (25121, "mingw-w64-sqlite", "blocked",
     "BLOCKED: MINGW_CROSS_COMPILATION: Windows cross-compilation target (deptree-resolver-260425c)"),

    # === BLOCKED: MULTILIB_UNSUPPORTED ===
    (17502, "lib32-opencl-nvidia-390xx", "blocked",
     "BLOCKED: MULTILIB_UNSUPPORTED: 32-bit NVIDIA OpenCL; Guix has no multilib (deptree-resolver-260425c)"),

    # === BLOCKED: DISTRO_SPECIFIC ===
    (18371, "mkinitcpio-systemd-root-password", "blocked",
     "BLOCKED: DISTRO_SPECIFIC: Arch mkinitcpio hook; not applicable to Guix (deptree-resolver-260425c)"),
    (18453, "system-age", "blocked",
     "BLOCKED: DISTRO_SPECIFIC: Arch-specific system age checker (deptree-resolver-260425c)"),
    (18490, "linux-keep-modules", "blocked",
     "BLOCKED: DISTRO_SPECIFIC: Arch-specific kernel module retention tool (deptree-resolver-260425c)"),
    (17862, "pacpak-git", "blocked",
     "BLOCKED: DISTRO_SPECIFIC: Pacman/Flatpak wrapper; relies on pacman (deptree-resolver-260425c)"),
    (17897, "chromium-extension-arch-search", "blocked",
     "BLOCKED: DISTRO_SPECIFIC: Arch-specific browser extension (deptree-resolver-260425c)"),
    (17940, "pamac-cli", "blocked",
     "BLOCKED: DISTRO_SPECIFIC: Manjaro package manager CLI; relies on libalpm/pacman (deptree-resolver-260425c)"),

    # === BLOCKED: SOURCE_UNAVAILABLE ===
    (17812, "squareline-studio", "blocked",
     "BLOCKED: SOURCE_UNAVAILABLE: No stable download URL; session-gated (deptree-resolver-260425c)"),
    (18478, "luniistore", "blocked",
     "BLOCKED: SOURCE_UNAVAILABLE: No stable download URL; proprietary (deptree-resolver-260425c)"),
    (18419, "simplicity-commander", "blocked",
     "BLOCKED: SOURCE_UNAVAILABLE: Silicon Labs proprietary; no stable URI (deptree-resolver-260425c)"),
    (18413, "receitanet", "blocked",
     "BLOCKED: SOURCE_UNAVAILABLE: Brazilian tax tool; download URL unstable (deptree-resolver-260425c)"),
    (17945, "euroscope-bin", "blocked",
     "BLOCKED: SOURCE_UNAVAILABLE: ATC simulator; no direct download (deptree-resolver-260425c)"),
    (18557, "plugin-autenticacao-gov-pt", "blocked",
     "BLOCKED: SOURCE_UNAVAILABLE: Portuguese gov auth plugin; session-gated download (deptree-resolver-260425c)"),
    (17819, "inkdrop", "blocked",
     "BLOCKED: SOURCE_UNAVAILABLE: Proprietary note-taking app; requires license key (deptree-resolver-260425c)"),

    # === BLOCKED: BROWSER_EXTENSION ===
    (18355, "librewolf-extension-ublock-origin-bin", "blocked",
     "BLOCKED: BROWSER_EXTENSION: Install through browser extension mechanism (deptree-resolver-260425c)"),
    (18285, "librewolf-tridactyl-native-bin", "blocked",
     "BLOCKED: BROWSER_EXTENSION: Install through browser extension mechanism (deptree-resolver-260425c)"),

    # === BLOCKED: ANDROID_SDK_PLATFORM ===
    (28671, "android-platform-19", "blocked",
     "BLOCKED: ANDROID_SDK_PLATFORM: Proprietary Google SDK platform files (deptree-resolver-260425c)"),
    (23109, "android-platform-21", "blocked",
     "BLOCKED: ANDROID_SDK_PLATFORM: Proprietary Google SDK platform files (deptree-resolver-260425c)"),

    # === BLOCKED: LICENSE_REVIEW_NEEDED ===
    (17797, "brother-mfc-l2400dw", "blocked",
     "BLOCKED: LICENSE_REVIEW_NEEDED: Proprietary Brother printer driver; restrictive redistribution (deptree-resolver-260425c)"),
    (20499, "ttf-consolas-ligaturized", "blocked",
     "BLOCKED: LICENSE_REVIEW_NEEDED: Microsoft Consolas derivative; non-free base font (deptree-resolver-260425c)"),

    # === BLOCKED: ABANDONED_UPSTREAM ===
    (17433, "clash-for-windows-chinese", "blocked",
     "BLOCKED: ABANDONED_UPSTREAM: Project shut down; repository archived (deptree-resolver-260425c)"),

    # === BLOCKED: NON_DISTRIBUTABLE ===
    (18333, "ut2004-gog", "blocked",
     "BLOCKED: NON_DISTRIBUTABLE: Commercial game requiring purchase (deptree-resolver-260425c)"),

    # === BLOCKED: LEGACY_PYTHON2 ===
    (25153, "python2-wxpython3", "blocked",
     "BLOCKED: LEGACY_PYTHON2: Python 2 EOL; use wxPython 4 for Python 3 (deptree-resolver-260425c)"),

    # === BLOCKED: PROPRIETARY_BINARY ===
    (17912, "libfprint-2-tod1-broadcom-cv3plus", "blocked",
     "BLOCKED: PROPRIETARY_BINARY: Broadcom proprietary fingerprint driver (deptree-resolver-260425c)"),

    # === BLOCKED: BUILD_REQUIRES_DOCKER ===
    (18301, "hyperledger-fabric", "blocked",
     "BLOCKED: BUILD_REQUIRES_DOCKER: Build requires Docker; not available in Guix sandbox (deptree-resolver-260425c)"),

    # === BLOCKED: BUILD_NETWORK_REQUIRED ===
    (18264, "nftables-geoip-db", "blocked",
     "BLOCKED: BUILD_NETWORK_REQUIRED: Downloads GeoIP DB at build time; no network in Guix builds (deptree-resolver-260425c)"),

    # === BLOCKED: BUILD_FAILED ===
    (18421, "qtspim-iconfix", "blocked",
     "BLOCKED: BUILD_FAILED: Qt5 MIPS sim; deprecated Qt4 APIs; needs upstream porting (deptree-resolver-260425c)"),

    # === BLOCKED: CROSS_COMPILATION ===
    (17909, "kamilsss655-uv-k5-firmware-custom-git", "blocked",
     "BLOCKED: CROSS_COMPILATION: ARM firmware; requires arm-none-eabi-gcc toolchain (deptree-resolver-260425c)"),

    # === BLOCKED: NEEDS_RECIPE_DESIGN ===
    (18449, "sipgate-app-clinq", "blocked",
     "BLOCKED: NEEDS_RECIPE_DESIGN: Not in AUR cache; no metadata available (deptree-resolver-260425c)"),
    (18461, "knossu", "blocked",
     "BLOCKED: NEEDS_RECIPE_DESIGN: 2015 binary-only game; no source code; unknown license (deptree-resolver-260425c)"),
    (18151, "futu-ftnn-wine", "blocked",
     "BLOCKED: NEEDS_RECIPE_DESIGN: Wine wrapper for proprietary financial app; unknown license (deptree-resolver-260425c)"),

    # === BLOCKED: DEP_RESOLUTION_FAILED ===
    (18644, "gradience", "blocked",
     "BLOCKED: DEP_RESOLUTION_FAILED: GTK4 + Blueprint compiler deps not in Guix (deptree-resolver-260425c)"),
    (18359, "wayfire-git", "blocked",
     "BLOCKED: DEP_RESOLUTION_FAILED: Wayland compositor; wf-config + 33 deps missing (deptree-resolver-260425c)"),
    (18574, "edgeimpulse-cli", "blocked",
     "BLOCKED: DEP_RESOLUTION_FAILED: Node.js CLI; massive npm dependency tree (deptree-resolver-260425c)"),
    (18599, "gdx-liftoff", "blocked",
     "BLOCKED: DEP_RESOLUTION_FAILED: Java/Gradle with LibGDX stack (deptree-resolver-260425c)"),
    (18700, "server-box-bin", "blocked",
     "BLOCKED: DEP_RESOLUTION_FAILED: Flutter framework not in Guix (deptree-resolver-260425c)"),
    (18269, "aws-amplify-cli", "blocked",
     "BLOCKED: DEP_RESOLUTION_FAILED: Massive Node.js/npm dependency tree (deptree-resolver-260425c)"),
    (18298, "aws-cdk", "blocked",
     "BLOCKED: DEP_RESOLUTION_FAILED: Massive Node.js/npm dependency tree (deptree-resolver-260425c)"),
    (18291, "decrypto-pro-git", "blocked",
     "BLOCKED: DEP_RESOLUTION_FAILED: Requires openssl-gost-engine (Russian crypto) (deptree-resolver-260425c)"),
    (18215, "nodejs-cspell", "blocked",
     "BLOCKED: DEP_RESOLUTION_FAILED: Node.js spell checker; npm deps (deptree-resolver-260425c)"),
    (18417, "osmtogeojson", "blocked",
     "BLOCKED: DEP_RESOLUTION_FAILED: Node.js GeoJSON converter; npm deps (deptree-resolver-260425c)"),
    (18556, "python-home-assistant-frontend", "blocked",
     "BLOCKED: DEP_RESOLUTION_FAILED: 500+ npm build dependencies (deptree-resolver-260425c)"),
    (18509, "rm-improved", "blocked",
     "BLOCKED: DEP_RESOLUTION_FAILED: Rust CLI; no prebuilt binary; 50+ crate deps (deptree-resolver-260425c)"),
    (18578, "shig-git", "blocked",
     "BLOCKED: DEP_RESOLUTION_FAILED: Go SSH tool; 30+ Go module deps (deptree-resolver-260425c)"),
    (18346, "beammp-launcher-git", "blocked",
     "BLOCKED: DEP_RESOLUTION_FAILED: C++ game mod; uses vcpkg (deptree-resolver-260425c)"),
    (18639, "dagger-git", "blocked",
     "BLOCKED: DEP_RESOLUTION_FAILED: Go CI/CD tool; 50+ Go module deps (deptree-resolver-260425c)"),
    (18620, "electrum-personal-server-git", "blocked",
     "BLOCKED: DEP_RESOLUTION_FAILED: Python Bitcoin; needs python-bitcointx (deptree-resolver-260425c)"),
    (18379, "java-language-server", "blocked",
     "BLOCKED: DEP_RESOLUTION_FAILED: Java/Maven with deep deps (deptree-resolver-260425c)"),
    (19028, "lightdm-webkit-theme-aether", "blocked",
     "BLOCKED: DEP_RESOLUTION_FAILED: Needs lightdm-webkit2-greeter not in Guix (deptree-resolver-260425c)"),
    (18401, "nfuspire-git", "blocked",
     "BLOCKED: DEP_RESOLUTION_FAILED: Needs libnspire not in Guix (deptree-resolver-260425c)"),
    (18380, "nginx-mainline-mod-njs", "blocked",
     "BLOCKED: DEP_RESOLUTION_FAILED: Nginx module; needs nginx source build (deptree-resolver-260425c)"),
    (18430, "quartz-utils-git", "blocked",
     "BLOCKED: DEP_RESOLUTION_FAILED: Crystal language; shards deps (deptree-resolver-260425c)"),
    (18561, "rdt-client", "blocked",
     "BLOCKED: DEP_RESOLUTION_FAILED: .NET/C# application (deptree-resolver-260425c)"),
    (18638, "sbctl-git", "blocked",
     "BLOCKED: DEP_RESOLUTION_FAILED: Go Secure Boot tool; 30+ Go deps (deptree-resolver-260425c)"),
    (18649, "snowflake-pt-server", "blocked",
     "BLOCKED: DEP_RESOLUTION_FAILED: Go Tor transport; 50+ Go deps (deptree-resolver-260425c)"),
    (18396, "sommelier-git", "blocked",
     "BLOCKED: DEP_RESOLUTION_FAILED: ChromiumOS monorepo component; deep deps (deptree-resolver-260425c)"),
    (17873, "texmacs-pure", "blocked",
     "BLOCKED: DEP_RESOLUTION_FAILED: Needs Pure language + LLVM 3.5 (abandoned) (deptree-resolver-260425c)"),
    (18666, "tilp-xdg", "blocked",
     "BLOCKED: DEP_RESOLUTION_FAILED: Needs libticalcs2/libticables2 not in Guix (deptree-resolver-260425c)"),
    (18410, "atuin-lily-git", "blocked",
     "BLOCKED: DEP_RESOLUTION_FAILED: Rust shell history; 100+ crate deps (deptree-resolver-260425c)"),
    (17948, "eclipse-pydev", "blocked",
     "BLOCKED: DEP_RESOLUTION_FAILED: Eclipse IDE plugin; Java deep deps (deptree-resolver-260425c)"),
    (18523, "gearhead2", "blocked",
     "BLOCKED: DEP_RESOLUTION_FAILED: Free Pascal game; FPC compiler not in Guix (deptree-resolver-260425c)"),
    (18353, "nvidiactl-git", "blocked",
     "BLOCKED: DEP_RESOLUTION_FAILED: Go tool; hard dep on NVIDIA proprietary driver (deptree-resolver-260425c)"),
    (18167, "openfortivpn-webview-electron", "blocked",
     "BLOCKED: DEP_RESOLUTION_FAILED: Electron app; massive deps (deptree-resolver-260425c)"),
    (18256, "truckersmp-cli", "blocked",
     "BLOCKED: DEP_RESOLUTION_FAILED: Python + mingw-w64-gcc for game modding (deptree-resolver-260425c)"),
    (18286, "hq", "blocked",
     "BLOCKED: DEP_RESOLUTION_FAILED: Meson build; needs libmodest not in Guix (deptree-resolver-260425c)"),
    (18381, "musique", "blocked",
     "BLOCKED: DEP_RESOLUTION_FAILED: Qt6 music player; source URL returns 404 (deptree-resolver-260425c)"),
    (18640, "nemo-engrampa", "blocked",
     "BLOCKED: DEP_RESOLUTION_FAILED: Needs Cinnamon/Nemo extension API (deptree-resolver-260425c)"),
    (18592, "mailnaggertray-git", "blocked",
     "BLOCKED: DEP_RESOLUTION_FAILED: Needs mailnagger not in Guix (deptree-resolver-260425c)"),
]

# Exported symbols from deptree-resolver-260425c.scm
EXPORTS = [
    "ddpolymerase-bin",
    "wl-binclock-bin",
    "hypraway-bin",
    "openexr-viewer",
    "firetools",
    "ruby-ruby-vips",
]


def update_todo_file():
    """Update todo_general_packages.org with status changes."""
    print(f"Reading {TODO_FILE}...")
    with open(TODO_FILE, 'r') as f:
        lines = f.readlines()

    # Build lookup: org_number -> (name, status_type, status_text)
    updates = {}
    for org_num, name, stype, stext in TODO_UPDATES:
        updates[org_num] = (name, stype, stext)

    # Find and update each entry
    modified = 0
    i = 0
    while i < len(lines):
        line = lines[i]
        if line.startswith('** BLOCKED '):
            m = re.match(r'\*\* BLOCKED (\d+)\.\s+(\S+)', line)
            if m:
                org_num = int(m.group(1))
                if org_num in updates:
                    name, stype, stext = updates[org_num]
                    if stype in ("done_recipe", "done_already_in_guix", "done_already_resolved"):
                        new_status = "DONE"
                    else:
                        new_status = "BLOCKED"

                    # Replace "** BLOCKED" with new status
                    lines[i] = line.replace('** BLOCKED ', f'** {new_status} ', 1)

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
                    tag = f"  :{PASS_ID}:"
                    if stype == "done_recipe":
                        tag += "recipe-generated:"
                    elif stype == "done_already_in_guix":
                        tag += "already-in-guix:"

                    # Add tag to heading if not present
                    if tag.strip(':').split(':')[0] not in lines[i]:
                        heading_end = lines[i].rstrip('\n')
                        if not heading_end.endswith(':'):
                            heading_end += ' '
                        lines[i] = heading_end + f' :{PASS_ID}:\n'

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

    # Check if already added
    if PASS_ID in content:
        print(f"  {PASS_ID} already in compat file, skipping.")
        return

    use_module_line = f"  #:use-module (gaurix packages {PASS_ID})"

    lines = content.split('\n')
    last_use_module_idx = -1
    for idx, line in enumerate(lines):
        if '#:use-module' in line:
            last_use_module_idx = idx

    if last_use_module_idx == -1:
        print("ERROR: Could not find #:use-module in compat file")
        return

    lines.insert(last_use_module_idx + 1, use_module_line)

    re_export_lines = []
    for sym in EXPORTS:
        re_export_lines.append(f'(re-export {sym})')

    content = '\n'.join(lines)
    content = content.rstrip() + '\n'
    content += '\n'.join(re_export_lines) + '\n'

    fd, tmp = tempfile.mkstemp(dir=os.path.dirname(COMPAT_FILE), suffix='.tmp')
    try:
        with os.fdopen(fd, 'w') as f:
            f.write(content)
        shutil.move(tmp, COMPAT_FILE)
        print(f"Wrote {COMPAT_FILE}")
    except Exception:
        os.unlink(tmp)
        raise


def update_packages_file():
    """Add comment to packages.scm for the new pass."""
    print(f"Reading {PACKAGES_FILE}...")
    with open(PACKAGES_FILE, 'r') as f:
        content = f.read()

    if PASS_ID in content:
        print(f"  {PASS_ID} already in packages file, skipping.")
        return

    comment = f"            ;; {PASS_ID}: 100 BLOCKED evaluated (6 recipes, 1 ALREADY_RESOLVED, 1 ALREADY_IN_GUIX, 92 remain BLOCKED)"
    lines = content.split('\n')

    # Insert after the define-module line
    for idx, line in enumerate(lines):
        if 'define-module' in line:
            lines.insert(idx + 1, comment)
            break

    content = '\n'.join(lines)

    fd, tmp = tempfile.mkstemp(dir=os.path.dirname(PACKAGES_FILE), suffix='.tmp')
    try:
        with os.fdopen(fd, 'w') as f:
            f.write(content)
        shutil.move(tmp, PACKAGES_FILE)
        print(f"Wrote {PACKAGES_FILE}")
    except Exception:
        os.unlink(tmp)
        raise


def main():
    print(f"=== {PASS_ID} Update Script ===\n")

    print("Step 1: Updating todo_general_packages.org...")
    update_todo_file()
    print()

    print("Step 2: Updating general-compat.scm...")
    update_compat_file()
    print()

    print("Step 3: Updating packages.scm...")
    update_packages_file()
    print()

    print("=== Done ===")
    print(f"Updated: {len([u for u in TODO_UPDATES if u[2] in ('done_recipe', 'done_already_in_guix')])} resolved")
    print(f"Blocked: {len([u for u in TODO_UPDATES if u[2] == 'blocked'])} remain BLOCKED")


if __name__ == '__main__':
    main()
