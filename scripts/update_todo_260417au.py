#!/usr/bin/env python3
"""Update todo_general_packages.org for deptree-resolver-260417au.

Changes status of resolved packages from BLOCKED to DONE.
Updates status lines for blocked packages with new reason documentation.
"""

import re
import json
import tempfile
import shutil
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
TODO_FILE = ROOT / "todo_general_packages.org"
PASS_ID = "deptree-resolver-260417au"
SUMMARY = ROOT / "reports" / f"{PASS_ID}-summary.json"

# Packages resolved in this pass (AUR name -> recipe file)
RESOLVED = {
    "arch-silence-grub-theme-git": "deptree-resolver-260417au.scm",
    "spicetify-themes-git": "deptree-resolver-260417au.scm",
    "asf": "deptree-resolver-260417au.scm",
    "floorp": "deptree-resolver-260417au.scm",
    "selectdefaultapplication-git": "deptree-resolver-260417au.scm",
    "puddletag": "deptree-resolver-260417au.scm",
    "chiaki": "deptree-resolver-260417au.scm",
    "wasistlos": "deptree-resolver-260417au.scm",
    "vscodium-bin-marketplace": "deptree-resolver-260417au.scm",
    "ipfs-desktop": "deptree-resolver-260417au.scm",
    "apparmor.d-git": "deptree-resolver-260417au.scm",
}

# Updated blocking reasons
BLOCKED_UPDATES = {
    "godot-double-mono": "DOTNET_UNSUPPORTED: .NET SDK 8.0 not in Guix",
    "python-torchaudio-rocm": "COMPLEX_DEPS: ROCm ecosystem (100+ pkgs) not in Guix",
    "pacwall-git": "ARCH_SPECIFIC: queries pacman database exclusively",
    "asp": "ARCH_SPECIFIC: Arch Build System tool, no cross-distro utility",
    "xilinx-ise": "PROPRIETARY_LICENSE: registration-walled proprietary installer",
    "odoo18-nightly": "MASSIVE_SCALE: 500+ Python deps, nightly versioning",
    "dude-bin": "ARCH_SPECIFIC: links against libalpm (pacman library)",
    "arch-shell": "ARCH_SPECIFIC: depends on mkarchroot/devtools",
    "deemix-gui-appimage": "LEGAL_ISSUES: project archived after legal action",
    "mt76-dkms-git": "DKMS_UNSUPPORTED: driver already upstream in kernel",
    "fonts-apple": "PROPRIETARY_LICENSE: Apple font license forbids redistribution",
    "libfprint-2-tod1-broadcom": "PROPRIETARY_LICENSE: proprietary binary blob",
    "brother-mfc-j5720dw": "PROPRIETARY_LICENSE: proprietary i386 binary blobs",
    "ntsync-dkms": "DKMS_UNSUPPORTED: upstream in kernel >= 6.14",
    "code-server-marketplace": "COMPLEX_DEPS: requires code-server (not in Guix)",
    "devkitty-git": "COMPLEX_DEPS: macOS-only releases, needs Electron 41",
    "aiot-ide": "PROPRIETARY_LICENSE: Xiaomi proprietary with no source",
    "gdrcopy": "COMPLEX_DEPS: NVIDIA GPU Direct RDMA, proprietary kernel modules",
    "starsector": "PROPRIETARY_LICENSE: commercial game, paid license required",
    "parus": "ARCH_SPECIFIC: TUI for paru (Arch AUR helper)",
    "otf-apple-pingfang": "PROPRIETARY_LICENSE: Apple restricted font license",
    "otf-apple-pingfang-relaxed": "PROPRIETARY_LICENSE: Apple restricted font license",
    "otf-apple-pingfang-ui": "PROPRIETARY_LICENSE: Apple restricted font license",
    "lib32-amdvlk-bin": "ARCH_SPECIFIC: 32-bit multilib not in Guix",
    "ttf-ms-office365": "PROPRIETARY_LICENSE: MS Office fonts, no redistribution",
    "datagrip-jre": "PROPRIETARY_LICENSE: JetBrains proprietary bundled JRE",
    "deezer": "COMPLEX_DEPS: Windows .exe repackaging + electron39",
    "rtl8821ce-dkms-git": "DKMS_UNSUPPORTED: out-of-tree kernel module",
    "winscp": "WINDOWS_ONLY: requires Wine runtime",
    "ladybird-git": "COMPLEX_DEPS: vcpkg + experimental alpha browser",
    "cdesktopenv": "COMPLEX_DEPS: Motif + ksh + opensp not in Guix",
    "pamac-all": "ARCH_SPECIFIC: requires libalpm/pacman ecosystem",
    "nautilus-typeahead": "COMPLEX_DEPS: requires rebuilding entire Nautilus",
    "scribus-svn": "COMPLEX_DEPS: dev version, prefer upstream stable scribus",
    "syncthingtray": "COMPLEX_DEPS: needs 3 C++ libs packaged first",
    "qtutilities-qt6": "COMPLEX_DEPS: needs cpp-utilities packaged first",
    "subliminal": "COMPLEX_DEPS: 6+ Python deps missing",
    "mkchromecast-git": "COMPLEX_DEPS: needs python-pychromecast",
    "vim-youcompleteme-git": "COMPLEX_DEPS: cmake + clang + git submodules",
    "gksu": "COMPLEX_DEPS + OBSOLETE: needs libgksu, superseded by polkit",
}


def main():
    with open(TODO_FILE, "r") as f:
        lines = f.readlines()

    output_lines = []
    i = 0
    resolved_count = 0
    blocked_updated = 0

    while i < len(lines):
        line = lines[i]
        m = re.match(r"^(\*\*\s+)BLOCKED(\s+\d+\.\s+)(\S+)(.*)", line)
        if m:
            prefix = m.group(1)
            number_part = m.group(2)
            pkg_name = m.group(3)
            rest = m.group(4)

            if pkg_name in RESOLVED:
                # Change BLOCKED -> DONE
                new_heading = f"{prefix}DONE{number_part}{pkg_name}{rest}\n"
                output_lines.append(new_heading)
                resolved_count += 1

                # Scan for existing status lines and add new one
                i += 1
                found_status = False
                while i < len(lines) and not lines[i].startswith("** "):
                    output_lines.append(lines[i])
                    if lines[i].strip().startswith("- Status:") and not found_status:
                        # Add new status line after existing one
                        output_lines.append(f"- Status: [{PASS_ID}] DONE -- recipe in {RESOLVED[pkg_name]}\n")
                        found_status = True
                    if lines[i].strip().startswith("- TODO Status:"):
                        # Update TODO Status from BLOCKED to DONE
                        output_lines[-1] = "- TODO Status: DONE\n"
                    i += 1
                if not found_status:
                    output_lines.append(f"- Status: [{PASS_ID}] DONE -- recipe in {RESOLVED[pkg_name]}\n")
                continue

            elif pkg_name in BLOCKED_UPDATES:
                # Keep BLOCKED but update reason in heading
                reason = BLOCKED_UPDATES[pkg_name]
                new_heading = f"{prefix}BLOCKED{number_part}{pkg_name}  :{PASS_ID}:{reason}\n"
                output_lines.append(new_heading)
                blocked_updated += 1

                # Add status line
                i += 1
                found_status = False
                while i < len(lines) and not lines[i].startswith("** "):
                    output_lines.append(lines[i])
                    if lines[i].strip().startswith("- Status:") and not found_status:
                        output_lines.append(f"- Status: [{PASS_ID}] BLOCKED -- {reason}\n")
                        found_status = True
                    i += 1
                if not found_status:
                    output_lines.append(f"- Status: [{PASS_ID}] BLOCKED -- {reason}\n")
                continue
            else:
                output_lines.append(line)
        else:
            output_lines.append(line)
        i += 1

    # Atomic write
    tmp = tempfile.NamedTemporaryFile(mode="w", dir=ROOT, suffix=".org",
                                      delete=False)
    try:
        tmp.writelines(output_lines)
        tmp.close()
        shutil.move(tmp.name, TODO_FILE)
    except:
        import os
        os.unlink(tmp.name)
        raise

    print(f"[{PASS_ID}] Updated todo_general_packages.org:")
    print(f"  Resolved (BLOCKED -> DONE): {resolved_count}")
    print(f"  Blocked (reason updated): {blocked_updated}")
    print(f"  Total lines: {len(output_lines)}")


if __name__ == "__main__":
    main()
