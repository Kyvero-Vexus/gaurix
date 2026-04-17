#!/usr/bin/env python3
"""Worker for deptree-resolver-260417ao: updates todo_general_packages.org.

Updates status for 2 resolved and 24 blocked packages.
"""

import re
import shutil
import tempfile
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
TODO_FILE = ROOT / "todo_general_packages.org"
PASS_ID = "deptree-resolver-260417ao"

# Resolved packages: change BLOCKED -> DONE
RESOLVED = {
    "opera-gx-bin": "DONE: recipe in deptree-resolver-260417ao.scm (opera-gx-bin, v130.0.5847.58, copy-build-system, nonfree) (deptree-resolver-260417ao)",
    "raidrivecli": "DONE: recipe in deptree-resolver-260417ao.scm (raidrivecli, v2025.12.0, copy-build-system, nonfree) (deptree-resolver-260417ao)",
}

# Blocked packages: update status with fresh evaluation
BLOCKED_UPDATES = {
    "ttf-ms-office365": "BLOCKED: PROPRIETARY_LICENSE: Microsoft Office fonts prohibit redistribution.  Tried: (1) license prohibits redistribution; (2) no direct download without MS Office license; (3) cannot legally include in channel (deptree-resolver-260417ao)",
    "fonts-apple": "BLOCKED: PROPRIETARY_LICENSE: Apple restricted font license forbids redistribution.  Re-confirmed in 260417ao pass (deptree-resolver-260417ao)",
    "otf-apple-pingfang": "BLOCKED: PROPRIETARY_LICENSE: Apple PingFang restricted license.  Re-confirmed in 260417ao pass (deptree-resolver-260417ao)",
    "otf-apple-pingfang-relaxed": "BLOCKED: PROPRIETARY_LICENSE: Apple PingFang variant restricted license.  Re-confirmed in 260417ao pass (deptree-resolver-260417ao)",
    "otf-apple-pingfang-ui": "BLOCKED: PROPRIETARY_LICENSE: Apple PingFang UI variant restricted license.  Re-confirmed in 260417ao pass (deptree-resolver-260417ao)",
    "code-server-marketplace": "BLOCKED: MISSING_DEPENDENCY: Requires code-server not in Guix; $EXTENSIONS_GALLERY env var provides equivalent.  Re-confirmed in 260417ao pass (deptree-resolver-260417ao)",
    "libfprint-2-tod1-broadcom": "BLOCKED: PROPRIETARY_LICENSE: Proprietary Broadcom binary blob; depends on libfprint-tod not in Guix.  Re-confirmed in 260417ao pass (deptree-resolver-260417ao)",
    "ntsync-dkms": "BLOCKED: DKMS_UNSUPPORTED: Already upstream in Linux >= 6.14; DKMS not supported in Guix.  Re-confirmed in 260417ao pass (deptree-resolver-260417ao)",
    "odoo18-nightly": "BLOCKED: MASSIVE_SCALE: 500+ Python deps; nightly versioning breaks reproducibility.  Re-confirmed in 260417ao pass (deptree-resolver-260417ao)",
    "arch-shell": "BLOCKED: ARCH_SPECIFIC: Depends on devtools (Arch-only); Guix has own container/profile mechanisms.  Re-confirmed in 260417ao pass (deptree-resolver-260417ao)",
    "dude-bin": "BLOCKED: ARCH_SPECIFIC: Depends on libalpm/pacman; guix gc provides native equivalent.  Re-confirmed in 260417ao pass (deptree-resolver-260417ao)",
    "mt76-dkms-git": "BLOCKED: DKMS_UNSUPPORTED: mt76 already upstream in Linux kernel; DKMS not supported in Guix.  Re-confirmed in 260417ao pass (deptree-resolver-260417ao)",
    "parus": "BLOCKED: ARCH_SPECIFIC: TUI for paru (Arch AUR helper); no utility outside Arch.  Re-confirmed in 260417ao pass (deptree-resolver-260417ao)",
    "pacwall-git": "BLOCKED: ARCH_SPECIFIC: Queries pacman database exclusively; guix graph provides native alternative.  Re-confirmed in 260417ao pass (deptree-resolver-260417ao)",
    "starsector": "BLOCKED: PROPRIETARY_LICENSE: Commercial game requiring paid license; no free download.  Re-confirmed in 260417ao pass (deptree-resolver-260417ao)",
    "asp": "BLOCKED: ARCH_SPECIFIC + DEPRECATED: Arch Build System tool; no cross-distro utility.  Re-confirmed in 260417ao pass (deptree-resolver-260417ao)",
    "deemix-gui-appimage": "BLOCKED: LEGAL_ISSUES: Archived after legal action; no stable source URL.  Re-confirmed in 260417ao pass (deptree-resolver-260417ao)",
    "gdrcopy": "BLOCKED: COMPLEX_DEPS: NVIDIA GPU Direct RDMA requiring proprietary kernel modules.  Re-confirmed in 260417ao pass (deptree-resolver-260417ao)",
    "brother-mfc-j5720dw": "BLOCKED: PROPRIETARY_LICENSE + ARCH_SPECIFIC: i386 binary blobs; requires lib32-glibc not in Guix.  Re-confirmed in 260417ao pass (deptree-resolver-260417ao)",
    "devkitty-git": "BLOCKED: NO_LINUX_BINARY: Only macOS releases (all 90+ releases); requires Electron 41 not in Guix.  Re-confirmed in 260417ao pass (deptree-resolver-260417ao)",
    "xilinx-ise": "BLOCKED: PROPRIETARY_LICENSE: Registration-walled 6GB+ installer; depends on legacy Qt4+gcc49.  Re-confirmed in 260417ao pass (deptree-resolver-260417ao)",
    "python-torchaudio-rocm": "BLOCKED: COMPLEX_DEPS: ROCm ecosystem (100+ packages) not in Guix.  Re-confirmed in 260417ao pass (deptree-resolver-260417ao)",
    "godot-double-mono": "BLOCKED: DOTNET_UNSUPPORTED: No prebuilt double+mono binary exists; requires dotnet-sdk-8.0 not in Guix.  Re-confirmed in 260417ao pass (deptree-resolver-260417ao)",
    "aiot-ide": "BLOCKED: PROPRIETARY_LICENSE: Xiaomi proprietary IoT IDE; requires Chinese account; no direct download.  Re-confirmed in 260417ao pass (deptree-resolver-260417ao)",
}


def update_todo_file():
    with open(TODO_FILE, "r") as f:
        lines = f.readlines()

    output = []
    i = 0
    resolved_count = 0
    blocked_count = 0

    while i < len(lines):
        line = lines[i]

        # Check for BLOCKED entries we need to update
        m = re.match(r"^(\*\*\s+)BLOCKED(\s+\d+\.\s+)(\S+)(.*)", line)
        if m:
            prefix = m.group(1)
            num_part = m.group(2)
            pkg_name = m.group(3)
            rest = m.group(4)

            if pkg_name in RESOLVED:
                # Change BLOCKED to DONE
                output.append(f"{prefix}DONE{num_part}{pkg_name}{rest}\n")
                i += 1
                # Add new status line after heading
                output.append(f"   - Status: {RESOLVED[pkg_name]}\n")
                # Copy remaining lines of this entry
                while i < len(lines):
                    if lines[i].startswith("** "):
                        break
                    output.append(lines[i])
                    i += 1
                resolved_count += 1
                continue

            elif pkg_name in BLOCKED_UPDATES:
                # Keep BLOCKED, add updated status
                output.append(line)
                i += 1
                output.append(f"   - Status: {BLOCKED_UPDATES[pkg_name]}\n")
                while i < len(lines):
                    if lines[i].startswith("** "):
                        break
                    output.append(lines[i])
                    i += 1
                blocked_count += 1
                continue

        output.append(line)
        i += 1

    # Atomic write
    fd, tmp_path = tempfile.mkstemp(dir=ROOT, suffix=".org")
    with open(fd, "w") as f:
        f.writelines(output)
    shutil.move(tmp_path, TODO_FILE)

    print(f"[{PASS_ID}] Updated todo: {resolved_count} resolved, {blocked_count} blocked updated")


if __name__ == "__main__":
    update_todo_file()
