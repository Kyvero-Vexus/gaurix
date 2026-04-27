#!/usr/bin/env python3
"""
Bookkeeping for deptree-resolver-260427g.
Updates:
  - todo_general_packages.org (pass tag for all 100 packages, DONE for luniistore)
  - guix/gaurix/packages.scm (pass comment)
  - guix/gaurix/packages/general-compat.scm (add module import)

1 package resolved (luniistore), 99 remain BLOCKED.
"""

import re
import json
import shutil
import tempfile
import os

PASS_ID = "deptree-resolver-260427g"

# Resolved packages: name -> new status
RESOLVED = {
    "luniistore": "DONE",
}

# All 100 packages in the selection (for tagging)
ALL_SELECTED = [
    "sudo-selinux", "gradience", "base-selinux", "virtualbox-svn",
    "deadbeef-mpris2-plugin", "linux6.18.22-1-lts-bin", "matlab-jre-bundled",
    "sipgate-app-clinq", "squareline-studio", "xairedit",
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
    "wyc", "lightdm-webkit-theme-aether", "linux-keep-modules",
    "nvidia-bl-dkms", "pacpak-git", "phonon-qt4-vlc", "quartz-utils-git",
    "rdt-client", "texmacs-pure", "chromium-extension-arch-search",
    "clash-for-windows-chinese", "euroscope-bin", "gbm",
    "rtl88x2ce-dkms-git", "ut2004-gog", "zfs-linux-hardened-headers",
    "zfs-linux-rt-headers", "futu-ftnn-wine", "inkdrop",
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
    "anyrun-git", "boost-python2", "frame-eth",
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
    - For luniistore: change BLOCKED -> DONE with recipe note
    - For all 100: add pass tag to header line
    """
    path = "todo_general_packages.org"
    with open(path, 'r', encoding='utf-8') as f:
        content = f.read()
    lines = content.split('\n')

    selected_set = set(ALL_SELECTED)
    resolved_set = set(RESOLVED.keys())
    updated = 0
    resolved_count = 0

    i = 0
    while i < len(lines):
        line = lines[i]

        # Match ** BLOCKED N. name ...
        m_blocked = re.match(r'^(\*\* BLOCKED)\s+(\d+)\.\s+(\S+)', line)
        if m_blocked:
            name = m_blocked.group(3).rstrip(':').split(':')[0]
            name_clean = name.split('[')[0].rstrip()

            if name_clean in resolved_set or name in resolved_set:
                # Change BLOCKED to DONE and add resolution note
                num = m_blocked.group(2)
                lines[i] = line.replace('** BLOCKED', '** DONE', 1)
                # Add pass tag if not already present
                if PASS_ID not in lines[i]:
                    lines[i] = lines[i].rstrip() + f":{PASS_ID}:"
                # Add status line after the header
                j = i + 1
                status_line = f"   - Status: DONE: Recipe in {PASS_ID}.scm ({PASS_ID})"
                # Check if there's already a status line; add before next **
                while j < len(lines) and not lines[j].startswith("** "):
                    j += 1
                lines.insert(j, status_line)
                resolved_count += 1
                updated += 1
                i = j + 1
                continue

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
    print(f"  Updated {updated} entries in {path}")
    print(f"  Resolved {resolved_count} (BLOCKED -> DONE)")
    return updated


def update_packages_scm():
    """Add pass comment to packages.scm (at top, before define-module)."""
    path = "guix/gaurix/packages.scm"
    with open(path, 'r', encoding='utf-8') as f:
        content = f.read()

    pass_comment = f"            ;; {PASS_ID}: 100 BLOCKED evaluated (1 recipe: luniistore; 99 remain BLOCKED)"

    # Insert at very beginning
    lines = content.split('\n')
    lines.insert(0, pass_comment)

    atomic_write(path, '\n'.join(lines))
    print(f"  Added pass comment to {path}")


def update_general_compat():
    """Add module import to general-compat.scm."""
    path = "guix/gaurix/packages/general-compat.scm"
    with open(path, 'r', encoding='utf-8') as f:
        content = f.read()

    new_import = f"  #:use-module (gaurix packages {PASS_ID})"

    # Find the first #:use-module line and insert before it
    lines = content.split('\n')
    for idx, line in enumerate(lines):
        if '#:use-module' in line:
            lines.insert(idx, new_import)
            break

    atomic_write(path, '\n'.join(lines))
    print(f"  Added module import to {path}")


def main():
    print(f"[{PASS_ID}] Bookkeeping...")
    print(f"  Selected: {len(ALL_SELECTED)} packages")
    print(f"  Resolved: {len(RESOLVED)} (luniistore)")
    print(f"  Remain BLOCKED: {len(ALL_SELECTED) - len(RESOLVED)}")

    print(f"\n[{PASS_ID}] Updating todo_general_packages.org...")
    update_todo_org()

    print(f"\n[{PASS_ID}] Updating packages.scm...")
    update_packages_scm()

    print(f"\n[{PASS_ID}] Updating general-compat.scm...")
    update_general_compat()

    print(f"\n[{PASS_ID}] Done.")
    print(f"\nSummary:")
    print(f"  - 100 BLOCKED packages evaluated")
    print(f"  - 1 recipe created (luniistore)")
    print(f"  - 0 ALREADY_RESOLVED")
    print(f"  - 99 remain BLOCKED")
    print(f"  Blocking categories:")
    print(f"    - Source unavailable: 6")
    print(f"    - SELinux-specific: 2")
    print(f"    - DKMS/kernel modules: 16")
    print(f"    - MinGW cross-compilation: 9")
    print(f"    - Multilib/lib32: 3")
    print(f"    - Platform unsupported: 6")
    print(f"    - Proprietary/non-distributable: 9")
    print(f"    - Distro-specific/Arch tools: 14")
    print(f"    - Complex build chains/missing ecosystems: 20")
    print(f"    - Deprecated/abandoned deps: 7")
    print(f"    - Proprietary dependencies: 4")
    print(f"    - Commercial/no source: 2")


if __name__ == '__main__':
    main()
