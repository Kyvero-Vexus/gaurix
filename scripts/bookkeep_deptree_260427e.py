#!/usr/bin/env python3
"""
Bookkeeping for deptree-resolver-260427e.
Updates:
  - todo_general_packages.org (pass tag for all 100 packages)
  - guix/gaurix/packages.scm (pass comment)

All 100 packages remain BLOCKED. No new recipes.
"""

import re
import json
import shutil
import tempfile
import os

PASS_ID = "deptree-resolver-260427e"

# No packages resolved
ALREADY_RESOLVED = {}
NEW_RECIPES = {}
NEW_EXPORTS = []

# All 100 packages in the selection (for tagging)
ALL_SELECTED = [
    "sudo-selinux", "gradience", "gjs-nohammer", "base-selinux",
    "virtualbox-svn", "deadbeef-mpris2-plugin", "linux6.18.22-1-lts-bin",
    "matlab-jre-bundled", "sipgate-app-clinq", "squareline-studio",
    "aquacomputer_d5next-hwmon-dkms", "bakkesmod-steam", "luniistore",
    "mkinitcpio-systemd-root-password", "repacman", "simplicity-commander",
    "amneziawg-dkms-git", "amneziawg-linux", "amneziawg-linux-hardened",
    "android-platform-19", "android-platform-21", "archwiki-offline",
    "brother-mfc-l2400dw", "faustus-dkms-git", "findbrokenpkgs",
    "ideapad-laptop-tb-dkms", "ideapad-laptop-tb2024g6plus-dkms",
    "knossu", "lib32-opencl-nvidia-390xx", "libch343ser-git",
    "libfprint-2-tod1-broadcom-cv3plus", "mingw-w64-cblas",
    "mingw-w64-lapack", "mingw-w64-soundtouch", "pfring-dkms",
    "python-home-assistant-frontend", "r8126-dkms",
    "sbctl-initcpio-post-hook", "system-age", "ttf-consolas-ligaturized",
    "vscodium-marketplace", "wyc", "lightdm-webkit-theme-aether",
    "linux-keep-modules", "nvidia-bl-dkms", "pacpak-git",
    "phonon-qt4-vlc", "quartz-utils-git", "rdt-client", "texmacs-pure",
    "chromium-extension-arch-search", "clash-for-windows-chinese",
    "euroscope-bin", "gbm", "rtl88x2ce-dkms-git", "ut2004-gog",
    "zfs-linux-hardened-headers", "zfs-linux-rt-headers",
    "futu-ftnn-wine", "inkdrop",
    "kamilsss655-uv-k5-firmware-custom-git", "mailnaggertray-git",
    "nvidia-open-tinygrad-dkms-git", "pamac-cli", "python-gradio-pdf",
    "python-pypi2pkgbuild", "soapysdrplay3-luarvique-git",
    "unrealtournament4", "zfs-linux-git-headers", "asp", "aurutils",
    "factorio-space-age-experimental", "fileoptimizer-bin",
    "lib32-libglade", "mingw-w64-boost", "mingw-w64-cppwinrt",
    "mingw-w64-pcre2", "mingw-w64-spirv-tools", "dxvk-async-git",
    "eddiscovery", "glibc-eac", "lib32-libxpm", "linux-gpib",
    "mingw-w64-postgresql", "mkinitcpio-clevis-hook", "pianoteq-stage",
    "plank-reloaded-docklet-picky-git", "python2-gimp",
    "wayprompt-git", "wldash", "anytxt-bin", "emerald",
    "lib32-sdl_sound", "mingw-w64-lame", "pikaur-static",
    "pikaur-static-git", "vmd", "webcord-vencord-git", "xeme-hg",
    "anyrun-git",
]


def atomic_write(path, content):
    """Write content to path atomically via temp file + rename."""
    dirn = os.path.dirname(path) or '.'
    with tempfile.NamedTemporaryFile(mode='w', dir=dirn, delete=False,
                                      suffix='.tmp', encoding='utf-8') as f:
        f.write(content)
        tmppath = f.name
    shutil.move(tmppath, path)


def update_todo_org():
    """Update todo_general_packages.org:
    - For all 100: add pass tag to header line
    """
    path = "todo_general_packages.org"
    with open(path, 'r', encoding='utf-8') as f:
        content = f.read()
    lines = content.split('\n')

    selected_set = set(ALL_SELECTED)
    updated = 0

    i = 0
    while i < len(lines):
        line = lines[i]

        # Match ** BLOCKED N. name ...
        m_blocked = re.match(r'^(\*\* BLOCKED)\s+(\d+)\.\s+(\S+)', line)
        if m_blocked:
            name = m_blocked.group(3).rstrip(':').split(':')[0]
            # Also handle names with tags after them
            name_clean = name.split('[')[0].rstrip()
            if name_clean in selected_set or name in selected_set:
                # Add pass tag if not already present
                if PASS_ID not in line:
                    lines[i] = line.rstrip() + f":{PASS_ID}:"
                    updated += 1
            i += 1
            continue

        i += 1

    result = '\n'.join(lines)
    atomic_write(path, result)
    print(f"  Updated {updated} entries in {path} with pass tag")
    return updated


def update_packages_scm():
    """Add pass comment to packages.scm."""
    path = "guix/gaurix/packages.scm"
    with open(path, 'r', encoding='utf-8') as f:
        content = f.read()

    pass_comment = f"            ;; {PASS_ID}: 100 BLOCKED evaluated (0 recipes, 100 remain BLOCKED)"

    # Insert at top of file (before first line)
    lines = content.split('\n')
    lines.insert(0, pass_comment)

    atomic_write(path, '\n'.join(lines))
    print(f"  Added pass comment to {path}")


def main():
    print(f"[{PASS_ID}] Bookkeeping...")
    print(f"  Selected: {len(ALL_SELECTED)} packages")
    print(f"  Resolved: 0")
    print(f"  Remain BLOCKED: {len(ALL_SELECTED)}")

    print(f"\n[{PASS_ID}] Updating todo_general_packages.org...")
    update_todo_org()

    print(f"\n[{PASS_ID}] Updating packages.scm...")
    update_packages_scm()

    print(f"\n[{PASS_ID}] Done.")
    print(f"\nSummary:")
    print(f"  - 100 BLOCKED packages evaluated")
    print(f"  - 0 recipes created")
    print(f"  - 0 ALREADY_RESOLVED")
    print(f"  - 100 remain BLOCKED")
    print(f"  Blocking reasons:")
    print(f"    - SELinux-specific: 2")
    print(f"    - Kernel modules/DKMS: 13")
    print(f"    - Platform-unsupported: 8")
    print(f"    - Proprietary/non-distributable: 13")
    print(f"    - MinGW cross-compilation: 9")
    print(f"    - Arch-specific tooling: 16")
    print(f"    - Source unavailable/abandoned: 3")
    print(f"    - ZFS (not in Guix): 3")
    print(f"    - Complex build chains (50+ deps): 16")
    print(f"    - Unresolvable dependency chains: 12")
    print(f"    - Deprecated/obsolete: 2")
    print(f"    - Other (proprietary deps): 3")


if __name__ == '__main__':
    main()
