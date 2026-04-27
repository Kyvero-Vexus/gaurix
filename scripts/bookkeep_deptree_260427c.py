#!/usr/bin/env python3
"""
Bookkeeping for deptree-resolver-260427c.
Updates:
  - todo_general_packages.org (status for ALREADY_RESOLVED + new recipes + tag for all 100)
  - guix/gaurix/packages.scm (add module + comment)
  - guix/gaurix/packages/general-compat.scm (add #:use-module + re-exports)
"""

import re
import json
import shutil
import tempfile
import os

PASS_ID = "deptree-resolver-260427c"

# Packages resolved as ALREADY_RESOLVED (their org entries get DONE status)
ALREADY_RESOLVED = {
    "logstash": "recipe-resolver-260426k",
}

# Packages with new recipes created (resolve nfuspire-git via nfuspire + libnspire dep)
NEW_RECIPES = {
    "nfuspire-git": "nfuspire",  # AUR name -> Guix package name
}

# New symbols exported from the module
NEW_EXPORTS = ["libnspire", "nfuspire"]

# All 100 packages in the selection (for tagging)
ALL_SELECTED = [
    "sudo-selinux", "gradience", "base-selinux", "gjs-nohammer",
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
    "vscodium-marketplace", "wyc", "kamilsss655-uv-k5-firmware-custom-git",
    "lightdm-webkit-theme-aether", "linux-keep-modules", "nfuspire-git",
    "nvidia-bl-dkms", "pacpak-git", "phonon-qt4-vlc", "quartz-utils-git",
    "rdt-client", "texmacs-pure", "chromium-extension-arch-search",
    "clash-for-windows-chinese", "euroscope-bin", "gbm",
    "rtl88x2ce-dkms-git", "ut2004-gog", "zfs-linux-hardened-headers",
    "zfs-linux-rt-headers", "futu-ftnn-wine", "inkdrop",
    "mailnaggertray-git", "nvidia-open-tinygrad-dkms-git", "pamac-cli",
    "python-gradio-pdf", "python-pypi2pkgbuild",
    "soapysdrplay3-luarvique-git", "unrealtournament4",
    "zfs-linux-git-headers", "asp", "aurutils",
    "factorio-space-age-experimental", "fileoptimizer-bin",
    "lib32-libglade", "logstash", "mingw-w64-boost",
    "mingw-w64-cppwinrt", "mingw-w64-pcre2", "mingw-w64-spirv-tools",
    "dxvk-async-git", "eddiscovery", "glibc-eac", "lib32-libxpm",
    "linux-gpib", "mingw-w64-postgresql", "mkinitcpio-clevis-hook",
    "pianoteq-stage", "plank-reloaded-docklet-picky-git",
    "python2-gimp", "wayprompt-git", "wldash", "anytxt-bin",
    "coreutils-arch", "emerald", "lib32-sdl_sound", "mingw-w64-lame",
    "pikaur-static", "pikaur-static-git", "vmd",
]


def atomic_write(path, content):
    """Write content to path atomically via temp file + rename."""
    dirn = os.path.dirname(path)
    with tempfile.NamedTemporaryFile(mode='w', dir=dirn, delete=False,
                                      suffix='.tmp', encoding='utf-8') as f:
        f.write(content)
        tmppath = f.name
    shutil.move(tmppath, path)


def update_todo_org():
    """Update todo_general_packages.org:
    - For ALREADY_RESOLVED: change BLOCKED to DONE with resolution note
    - For NEW_RECIPES: change BLOCKED to DONE with recipe note
    - For all 100: add pass tag
    """
    path = "todo_general_packages.org"
    with open(path, 'r', encoding='utf-8') as f:
        lines = f.readlines()

    selected_set = set(ALL_SELECTED)
    updated = 0

    i = 0
    while i < len(lines):
        line = lines[i]

        # Match ** BLOCKED N. name or ** DONE N. name [BLOCKED:...]
        m_blocked = re.match(r'^(\*\* BLOCKED)\s+(\d+)\.\s+(\S+)', line)
        m_done_blocked = re.match(r'^(\*\* DONE)\s+(\d+)\.\s+(\S+)\s+\[BLOCKED:', line)

        pkg_name = None
        if m_blocked:
            pkg_name = m_blocked.group(3).rstrip(':').split(':')[0]
        elif m_done_blocked:
            pkg_name = m_done_blocked.group(3).rstrip(':').split(':')[0]

        if pkg_name and pkg_name in selected_set:
            # Add pass tag if not already present
            tag = f":{PASS_ID}:"
            if tag not in line:
                line = line.rstrip('\n') + f"  {tag}\n"
                lines[i] = line

            # For ALREADY_RESOLVED packages, update status
            if pkg_name in ALREADY_RESOLVED:
                source = ALREADY_RESOLVED[pkg_name]
                if m_blocked:
                    old_prefix = m_blocked.group(1)
                    lines[i] = line.replace(old_prefix, "** DONE", 1)
                    status_line = f"   - Status: DONE: ALREADY_RESOLVED: recipe confirmed in {source} ({PASS_ID})\n"
                    lines.insert(i + 1, status_line)
                    updated += 1
                    i += 1
                elif m_done_blocked:
                    status_line = f"   - Status: DONE: ALREADY_RESOLVED: recipe confirmed in {source} ({PASS_ID})\n"
                    j = i + 1
                    while j < len(lines) and not lines[j].startswith("** "):
                        j += 1
                    lines.insert(j, status_line)
                    updated += 1

            # For NEW_RECIPES packages, update status
            elif pkg_name in NEW_RECIPES:
                guix_name = NEW_RECIPES[pkg_name]
                if m_blocked:
                    old_prefix = m_blocked.group(1)
                    lines[i] = line.replace(old_prefix, "** DONE", 1)
                    status_line = f"   - Status: DONE: recipe in {PASS_ID}.scm ({guix_name}; libnspire dep also packaged) ({PASS_ID})\n"
                    lines.insert(i + 1, status_line)
                    updated += 1
                    i += 1
                elif m_done_blocked:
                    status_line = f"   - Status: DONE: recipe in {PASS_ID}.scm ({guix_name}; libnspire dep also packaged) ({PASS_ID})\n"
                    j = i + 1
                    while j < len(lines) and not lines[j].startswith("** "):
                        j += 1
                    lines.insert(j, status_line)
                    updated += 1

        i += 1

    atomic_write(path, ''.join(lines))
    print(f"  Updated {updated} entries (ALREADY_RESOLVED + NEW_RECIPES), tagged all 100 selected")


def update_packages_scm():
    """Add module reference comment to packages.scm header."""
    path = "guix/gaurix/packages.scm"
    with open(path, 'r', encoding='utf-8') as f:
        content = f.read()

    comment = f"            ;; {PASS_ID}: 100 BLOCKED evaluated (2 recipes: libnspire, nfuspire; 1 ALREADY_RESOLVED: logstash; 97 remain BLOCKED)\n"

    marker = ";;; Package namespace convenience module"
    if marker in content:
        content = content.replace(marker, comment + marker, 1)
    else:
        content = content.replace("(define-module (gaurix packages)",
                                  comment + "(define-module (gaurix packages)", 1)

    atomic_write(path, content)
    print(f"  Added pass comment to packages.scm")


def update_general_compat():
    """Add #:use-module for the new pass to general-compat.scm and re-export new symbols."""
    path = "guix/gaurix/packages/general-compat.scm"
    with open(path, 'r', encoding='utf-8') as f:
        content = f.read()

    # Add #:use-module after the first existing #:use-module line
    new_module = f"  #:use-module (gaurix packages {PASS_ID})"

    lines = content.split('\n')
    new_lines = []
    inserted_module = False
    for line in lines:
        if not inserted_module and line.strip().startswith('#:use-module'):
            new_lines.append(new_module)
            inserted_module = True
        new_lines.append(line)

    if not inserted_module:
        print("  WARNING: could not find #:use-module in general-compat.scm")
        return

    # Add re-export lines at the end (before the final empty line)
    re_exports = [f"(re-export {sym})" for sym in NEW_EXPORTS]
    # Find the last non-empty line
    content_str = '\n'.join(new_lines)
    re_export_block = '\n'.join([f"\n;;; {PASS_ID}"] + re_exports) + '\n'
    content_str = content_str.rstrip('\n') + re_export_block

    atomic_write(path, content_str)
    print(f"  Added #:use-module for {PASS_ID} and {len(NEW_EXPORTS)} re-exports to general-compat.scm")


def main():
    print(f"[{PASS_ID}] Updating todo_general_packages.org...")
    update_todo_org()

    print(f"[{PASS_ID}] Updating guix/gaurix/packages.scm...")
    update_packages_scm()

    print(f"[{PASS_ID}] Updating guix/gaurix/packages/general-compat.scm...")
    update_general_compat()

    print(f"[{PASS_ID}] Bookkeeping complete.")


if __name__ == '__main__':
    main()
