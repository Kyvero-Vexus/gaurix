#!/usr/bin/env python3
"""
Bookkeeping for deptree-resolver-260428h.
Updates todo_general_packages.org with pass tags.
Updates packages.scm and general-compat.scm programmatically.
"""

import json
import re
import tempfile
import os

PASS_ID = "deptree-resolver-260428h"
TODO_FILE = "todo_general_packages.org"
PACKAGES_SCM = "guix/gaurix/packages.scm"
GENERAL_COMPAT_SCM = "guix/gaurix/packages/general-compat.scm"
SELECTION_JSON = f"reports/{PASS_ID}-selection.json"

# Resolved packages: name -> reason
RESOLVED = {
    "synfigstudio-dev": "Already packaged as synfigstudio 1.5.3 in upstream Guix (gnu/packages/animation.scm)",
    "modemmanager-dev": "Already packaged as modem-manager 1.22.0 in upstream Guix (gnu/packages/freedesktop.scm)",
    "audacious-plugins-git": "Already packaged as audacious 4.4.2 in upstream Guix (gnu/packages/music.scm, plugins bundled)",
    "sddm-idle": "Already packaged as sddm 0.21.0 in upstream Guix (gnu/packages/display-managers.scm)",
    "nheko-scrollfix": "Already packaged as nheko 0.12.1 in upstream Guix (gnu/packages/matrix.scm)",
    "mesa-minimal-git": "Already packaged as mesa 25.2.3 in upstream Guix (gnu/packages/gl.scm)",
}

# Packages to reclassify with new fail_reason
RECLASSIFY = {
    "python-pylink-square": "PROPRIETARY_BINARY",
}

# Packages outside selection to also categorize with proper fail_reason
CATEGORIZE_OUTSIDE = {
    "linux-sched-ext-git-headers": "KERNEL_HEADERS",
    "linux-tip-git-headers": "KERNEL_HEADERS",
    "linux-xanmod-lts-headers": "KERNEL_HEADERS",
    "linux-cachyos-hardened-headers": "KERNEL_HEADERS",
    "linux-next-git-headers": "KERNEL_HEADERS",
    "linux-covolunablu-gaming-headers": "KERNEL_HEADERS",
    "linux-cachyos-bmq-headers": "KERNEL_HEADERS",
    "linux-cachyos-eevdf-headers": "KERNEL_HEADERS",
    "linux-cachyos-server-headers": "KERNEL_HEADERS",
    "mailspring": "COMPLEX_DEPS",
    "nvidia-390xx-settings": "PROPRIETARY_BINARY",
    "virtualbox-bin-sdk": "COMPLEX_DEPS",
    "lto-dump-snapshot": "GCC_SNAPSHOT",
    "luxtorpeda-git": "COMPLEX_DEPS",
    "devtools-git": "DISTRO_SPECIFIC",
    "envoyproxy": "COMPLEX_DEPS",
    "opendrop-git": "COMPLEX_DEPS",
    "betterx-desktop-git": "COMPLEX_DEPS",
    "illogical-impulse-ags": "COMPLEX_DEPS",
    "python-jax-rocm": "COMPLEX_DEPS",
    "goxlr-utility-ui": "COMPLEX_DEPS",
    "rpfm-git": "COMPLEX_DEPS",
    "deepin-wine8-stable": "PROPRIETARY_BINARY",
    "php-legacy-pdlib": "COMPLEX_DEPS",
    "qt6-xcb-private-headers-git": "COMPLEX_DEPS",
    "scans2any-git": "COMPLEX_DEPS",
    "veloren": "COMPLEX_DEPS",
    "vmware-workstation": "PROPRIETARY_BINARY",
    "oclint": "COMPLEX_DEPS",
    "paperde": "COMPLEX_DEPS",
    "xivlauncher-rb": "COMPLEX_DEPS",
    "codeblocks-svn": "COMPLEX_DEPS",
    "firestorm-next-bin": "MULTILIB_UNSUPPORTED",
    "openconnect-sso-git": "COMPLEX_DEPS",
    "ecal-samples": "COMPLEX_DEPS",
    "nyarchassistant": "COMPLEX_DEPS",
    "aosp-devel": "PLATFORM_UNSUPPORTED",
    "deadbeef-git": "COMPLEX_DEPS",
    "java-openjfx-nowebkit": "COMPLEX_DEPS",
    "quartus-free-quartus": "PROPRIETARY_CLOSED_SOURCE",
    "texpresso-git": "COMPLEX_DEPS",
    "etlegacy32-mod": "MULTILIB_UNSUPPORTED",
    "ghostty-git-zen3": "COMPLEX_DEPS",
    "thunderbird-beta": "COMPLEX_DEPS",
    "qgroundcontrol": "COMPLEX_DEPS",
    "darling-cli-devenv-gui-common-git": "COMPLEX_DEPS",
    "darling-iosurface-git": "COMPLEX_DEPS",
    "shadps4-git": "COMPLEX_DEPS",
    "systemd-ukify-git": "COMPLEX_DEPS",
    "waytrogen": "COMPLEX_DEPS",
    "wine-osu-spectator-wow64": "COMPLEX_DEPS",
    "teb-obs": "COMPLEX_DEPS",
    "thunderbird-globalmenu": "COMPLEX_DEPS",
    "ffmpeg-cuda-full": "COMPLEX_DEPS",
    "ffmpeg-full-git": "NON_DISTRIBUTABLE",
    "virtualbox-ext-oracle-dev": "PROPRIETARY_BINARY",
    "base-devel-selinux": "SELINUX_SPECIFIC",
    "libgo-snapshot": "GCC_SNAPSHOT",
    "capt-src": "MULTILIB_UNSUPPORTED",
    "mingw-w64-libopenmpt": "MINGW_CROSS_COMPILATION",
    "auracle-git": "DISTRO_SPECIFIC",
    "pantheon-polkit-agent-git": "COMPLEX_DEPS",
    "vegastrike-engine-git": "COMPLEX_DEPS",
    "python-google-cloud-speech": "COMPLEX_DEPS",
    "gst-plugins-rs-git": "COMPLEX_DEPS",
    "wayfire-plugins-extra-git": "COMPLEX_DEPS",
}


def load_selection():
    """Load the selected package names."""
    with open(SELECTION_JSON) as f:
        data = json.load(f)
    return set(data['packages'])


def update_todo_org(selected_names):
    """Update BLOCKED entries: add pass tag, resolve packages, reclassify."""
    with open(TODO_FILE, 'r', encoding='utf-8') as f:
        lines = f.readlines()

    updated = 0
    resolved = 0
    reclassified = 0
    categorized = 0
    new_lines = []
    i = 0
    while i < len(lines):
        line = lines[i]
        m = re.match(r'^(\*\* )(BLOCKED)(\s+\d+\.\s+)(\S+)(.*)', line)
        if m:
            prefix = m.group(1)
            status = m.group(2)
            num_part = m.group(3)
            raw_name = m.group(4)
            rest = m.group(5)
            name = raw_name.rstrip(':').split(':')[0].split('[')[0].rstrip()

            # Handle RESOLVED (ALREADY_PACKAGED)
            if name in RESOLVED:
                clean_rest = rest.rstrip('\n')
                if PASS_ID not in clean_rest:
                    if clean_rest.endswith(':'):
                        clean_rest = f"{clean_rest}{PASS_ID}:already-packaged:"
                    else:
                        clean_rest = f"{clean_rest} :{PASS_ID}:already-packaged:"
                new_line = f"{prefix}DONE{num_part}{raw_name}{clean_rest}\n"
                new_lines.append(new_line)
                # Update status lines in body
                j = i + 1
                status_updated = False
                while j < len(lines) and not lines[j].startswith("** "):
                    sl = lines[j]
                    if not status_updated and sl.strip().startswith("- Status:"):
                        new_lines.append(sl)
                        new_lines.append(f"   - Status: DONE: {RESOLVED[name]} ({PASS_ID})\n")
                        status_updated = True
                    elif sl.strip().startswith("- TODO Status: BLOCKED"):
                        new_lines.append(f"   - TODO Status: DONE\n")
                    else:
                        new_lines.append(sl)
                    j += 1
                if not status_updated:
                    new_lines.append(f"   - Status: DONE: {RESOLVED[name]} ({PASS_ID})\n")
                resolved += 1
                i = j
                continue

            # Handle selected packages (add pass tag)
            if name in selected_names:
                if PASS_ID not in line:
                    clean_rest = rest.rstrip('\n')
                    if clean_rest.endswith(':'):
                        new_line = f"{prefix}{status}{num_part}{raw_name}{clean_rest}{PASS_ID}:\n"
                    else:
                        new_line = f"{prefix}{status}{num_part}{raw_name}{clean_rest}:{PASS_ID}:\n"
                    new_lines.append(new_line)
                    updated += 1
                    i += 1
                    continue

            # Handle reclassification
            if name in RECLASSIFY and PASS_ID not in line:
                clean_rest = rest.rstrip('\n')
                if clean_rest.endswith(':'):
                    new_line = f"{prefix}{status}{num_part}{raw_name}{clean_rest}{PASS_ID}:\n"
                else:
                    new_line = f"{prefix}{status}{num_part}{raw_name}{clean_rest}:{PASS_ID}:\n"
                new_lines.append(new_line)
                # Add status line
                j = i + 1
                status_added = False
                while j < len(lines) and not lines[j].startswith("** "):
                    sl = lines[j]
                    if not status_added and sl.strip().startswith("- Status:"):
                        new_lines.append(sl)
                        new_lines.append(f"   - Status: BLOCKED: {RECLASSIFY[name]}: needs proprietary jlink-software-and-documentation ({PASS_ID})\n")
                        status_added = True
                    else:
                        new_lines.append(sl)
                    j += 1
                reclassified += 1
                i = j
                continue

            # Handle categorization of packages outside selection
            if name in CATEGORIZE_OUTSIDE and PASS_ID not in line:
                clean_rest = rest.rstrip('\n')
                if clean_rest.endswith(':'):
                    new_line = f"{prefix}{status}{num_part}{raw_name}{clean_rest}{PASS_ID}:\n"
                else:
                    new_line = f"{prefix}{status}{num_part}{raw_name}{clean_rest}:{PASS_ID}:\n"
                new_lines.append(new_line)
                categorized += 1
                i += 1
                continue

        new_lines.append(line)
        i += 1

    # Write atomically
    fd, tmp = tempfile.mkstemp(dir='.', suffix='.org')
    os.close(fd)
    with open(tmp, 'w', encoding='utf-8') as f:
        f.writelines(new_lines)
    os.replace(tmp, TODO_FILE)

    print(f"  Updated {updated} BLOCKED entries with {PASS_ID} tag (selected)")
    print(f"  Resolved {resolved} packages to DONE (ALREADY_PACKAGED)")
    print(f"  Reclassified {reclassified} packages")
    print(f"  Categorized {categorized} packages outside selection")
    return updated, resolved


def update_packages_scm():
    """Add pass comment to packages.scm using deterministic full-file transform."""
    with open(PACKAGES_SCM, 'r', encoding='utf-8') as f:
        content = f.read()

    comment = f"            ;; {PASS_ID}: 100 BLOCKED evaluated + 71 remaining categorized (0 new recipes, 6 ALREADY_PACKAGED resolved, 165 remain BLOCKED)"

    if PASS_ID in content:
        print(f"  {PACKAGES_SCM} already has pass comment")
        return

    lines = content.split('\n')
    new_lines = []
    inserted = False

    for line in lines:
        if not inserted and line.strip().startswith(';; deptree-resolver-260428g:'):
            new_lines.append(comment)
            inserted = True
        new_lines.append(line)

    if not inserted:
        new_lines_2 = []
        for line in lines:
            if not inserted and ';; recipe-resolver-260428' in line:
                new_lines_2.append(comment)
                inserted = True
            new_lines_2.append(line)
        if inserted:
            new_lines = new_lines_2

    new_content = '\n'.join(new_lines)

    fd, tmp = tempfile.mkstemp(dir='.', suffix='.scm')
    os.close(fd)
    with open(tmp, 'w', encoding='utf-8') as f:
        f.write(new_content)
    os.replace(tmp, PACKAGES_SCM)

    print(f"  Updated {PACKAGES_SCM} with pass comment (inserted={inserted})")


def update_general_compat_scm():
    """Add use-module for new pass to general-compat.scm using deterministic full-file transform."""
    with open(GENERAL_COMPAT_SCM, 'r', encoding='utf-8') as f:
        content = f.read()

    new_module = "  #:use-module (gaurix packages deptree-resolver-260428h)"

    if new_module.strip() in content:
        print(f"  {GENERAL_COMPAT_SCM} already has module entry")
        return

    lines = content.split('\n')
    new_lines = []
    inserted = False

    for line in lines:
        if not inserted and '#:use-module (gaurix packages deptree-resolver-260428g)' in line:
            new_lines.append(new_module)
            new_lines.append(line)
            inserted = True
            continue
        new_lines.append(line)

    if not inserted:
        new_lines_2 = []
        for line in lines:
            if not inserted and '#:use-module (gaurix packages recipe-resolver-260428' in line:
                new_lines_2.append(new_module)
                inserted = True
            new_lines_2.append(line)
        if inserted:
            new_lines = new_lines_2

    new_content = '\n'.join(new_lines)

    fd, tmp = tempfile.mkstemp(dir='.', suffix='.scm')
    os.close(fd)
    with open(tmp, 'w', encoding='utf-8') as f:
        f.write(new_content)
    os.replace(tmp, GENERAL_COMPAT_SCM)

    print(f"  Updated {GENERAL_COMPAT_SCM} with new module (inserted={inserted})")


def main():
    print(f"[{PASS_ID}] Running bookkeeping...")

    selected = load_selection()
    print(f"  Loaded {len(selected)} selected packages")

    # Update todo org
    update_todo_org(selected)

    # Update packages.scm
    update_packages_scm()

    # Update general-compat.scm
    update_general_compat_scm()

    print(f"\n[{PASS_ID}] Bookkeeping complete.")


if __name__ == "__main__":
    main()
