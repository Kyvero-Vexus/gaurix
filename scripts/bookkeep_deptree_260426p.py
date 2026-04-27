#!/usr/bin/env python3
"""
Bookkeeping for deptree-resolver-260426p.
Updates:
  - todo_general_packages.org (status for ALREADY_RESOLVED + tag for all 100)
  - guix/gaurix/packages.scm (add module + comment)
  - guix/gaurix/packages/general-compat.scm (add #:use-module + re-exports)
"""

import re
import json
import shutil
import tempfile
import os

PASS_ID = "deptree-resolver-260426p"

# Packages resolved as ALREADY_RESOLVED (their org entries get DONE status)
ALREADY_RESOLVED = {
    "diffnav-bin": "deptree-resolver-260408b",
    "etcd": "deptree-resolver-260408d",
    "flclashx-bin": "deptree-resolver-260426m",
    "gowatch": "deptree-resolver-260426m",
    "harbor-wave": "deptree-resolver-260415p",
    "limine-booster": "deptree-resolver-260415p",
    "mod_maxminddb": "deptree-resolver-260426m",
    "quantumlauncher-bin": "deptree-resolver-260426m",
    "webos-dev-manager-bin": "deptree-resolver-260426m",
    "disk_usage": "deptree-resolver-260415p",
    "buf-git": "deptree-resolver-260426m",
}

# All 100 packages in the selection (for tagging)
ALL_SELECTED = [
    "sudo-selinux", "devtools-git", "gradience", "pamac-cli", "aurutils",
    "auracle-git", "gjs-nohammer", "python-urllib3-future-git", "base-selinux",
    "nautilus-typeahead", "virtualbox-svn", "teb-obs", "audiobookshelf", "bulky",
    "dbeaver", "deadbeef-mpris2-plugin", "diffnav-bin", "fluxdown-bin",
    "gram-editor-bin", "hypnotix", "linux6.18.22-1-lts-bin", "matlab-jre-bundled",
    "pardf", "sipgate-app-clinq", "squareline-studio", "apple-fonts",
    "aquacomputer_d5next-hwmon-dkms", "bakkesmod-steam", "luniistore",
    "mkinitcpio-systemd-root-password", "netpad-vnext-bin", "r8125-dkms",
    "repacman", "simplicity-commander", "skillshare", "amneziawg-dkms-git",
    "amneziawg-linux", "amneziawg-linux-hardened", "android-platform-19",
    "android-platform-21", "archwiki-offline", "bcachefs-kernel-dkms-git",
    "brother-mfc-l2400dw", "etcd", "faustus-dkms-git", "findbrokenpkgs",
    "flclashx-bin", "gowatch", "harbor-wave", "ideapad-laptop-tb-dkms",
    "ideapad-laptop-tb2024g6plus-dkms", "jdk17-graalvm-ee-bin", "knossu",
    "lib32-opencl-nvidia-390xx", "lib32-openssl-1.1", "libch343ser-git",
    "libfprint-2-tod1-broadcom-cv3plus", "limine-booster", "mdbook-epub",
    "mingw-w64-cblas", "mingw-w64-lapack", "mingw-w64-soundtouch",
    "mingw-w64-zlib-ng", "mkinitcpio-archlogo", "mkinitcpio-systemd-extras",
    "mod_maxminddb", "nbfc", "ndi-sdk", "ntfsplus-dkms-git", "pfring-dkms",
    "podserv-b-git", "portage", "python-home-assistant-frontend",
    "quantumlauncher-bin", "r8126-dkms", "r8152-dkms", "ryzen_smu-dkms-git",
    "sbctl-initcpio-post-hook", "spinwheel-pipewire", "system-age",
    "system76-acpi-dkms", "system76-io-dkms", "ttf-consolas-ligaturized",
    "vscodium-marketplace", "webos-dev-manager-bin", "wyc", "xpad-dkms-git",
    "yaac", "zenpower3-dkms", "zenpower3-dkms-git", "zenpower5-dkms-git",
    "aic8800-dkms", "ajantv2-dkms", "ampcode", "architect-git",
    "artificial-rage-git", "autofirma", "buf-git", "dela", "disk_usage",
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
    - For ALREADY_RESOLVED: change BLOCKED/DONE[BLOCKED] to DONE with resolution note
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
                # Add tag before the newline
                line = line.rstrip('\n') + f"  {tag}\n"
                lines[i] = line

            # For ALREADY_RESOLVED packages, update status
            if pkg_name in ALREADY_RESOLVED:
                source = ALREADY_RESOLVED[pkg_name]
                if m_blocked:
                    # Change ** BLOCKED to ** DONE and add resolution note
                    old_prefix = m_blocked.group(1)
                    lines[i] = line.replace(old_prefix, "** DONE", 1)
                    # Add status line after the heading
                    status_line = f"   - Status: DONE: ALREADY_RESOLVED: recipe confirmed in {source} ({PASS_ID})\n"
                    lines.insert(i + 1, status_line)
                    updated += 1
                    i += 1  # skip the inserted line
                elif m_done_blocked:
                    # Already DONE format, add resolution note
                    status_line = f"   - Status: DONE: ALREADY_RESOLVED: recipe confirmed in {source} ({PASS_ID})\n"
                    # Find the right place to insert (after the heading)
                    j = i + 1
                    while j < len(lines) and not lines[j].startswith("** "):
                        j += 1
                    lines.insert(j, status_line)
                    updated += 1
        i += 1

    atomic_write(path, ''.join(lines))
    print(f"  Updated {updated} ALREADY_RESOLVED entries, tagged all 100 selected")


def update_packages_scm():
    """Add module reference comment to packages.scm header."""
    path = "guix/gaurix/packages.scm"
    with open(path, 'r', encoding='utf-8') as f:
        content = f.read()

    comment = f"            ;; {PASS_ID}: 100 BLOCKED evaluated (0 recipes, 11 ALREADY_RESOLVED, 89 remain BLOCKED)\n"

    # Insert after the first line that starts with ;;; or first comment block
    # Find the line ";;; Package namespace convenience module"
    marker = ";;; Package namespace convenience module"
    if marker in content:
        content = content.replace(marker, comment + marker, 1)
    else:
        # Fallback: insert before (define-module line
        content = content.replace("(define-module (gaurix packages)",
                                  comment + "(define-module (gaurix packages)", 1)

    atomic_write(path, content)
    print(f"  Added pass comment to packages.scm")


def update_general_compat():
    """Add #:use-module for the new pass to general-compat.scm.
    No new re-exports since 0 new recipes."""
    path = "guix/gaurix/packages/general-compat.scm"
    with open(path, 'r', encoding='utf-8') as f:
        content = f.read()

    # Add #:use-module after the first existing #:use-module line
    new_module = f"  #:use-module (gaurix packages {PASS_ID})\n"

    # Find the first #:use-module line and insert before it
    lines = content.split('\n')
    new_lines = []
    inserted = False
    for line in lines:
        if not inserted and line.strip().startswith('#:use-module'):
            new_lines.append(new_module.rstrip('\n'))
            inserted = True
        new_lines.append(line)

    if not inserted:
        print("  WARNING: could not find #:use-module in general-compat.scm")
        return

    atomic_write(path, '\n'.join(new_lines))
    print(f"  Added #:use-module for {PASS_ID} to general-compat.scm")


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
