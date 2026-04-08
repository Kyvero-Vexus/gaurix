#!/usr/bin/env python3
"""
Programmatically update todo_general_packages.org for deptree-resolver-260408f.
- Resolved packages: BLOCKED -> DONE
- Still-blocked packages: update reason code in bracket
Uses deterministic read-compute-write-atomic-move pattern.
"""

import json
import re
import shutil
import tempfile
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
ORG_FILE = ROOT / "todo_general_packages.org"
SELECTED_JSON = ROOT / "reports" / "deptree-resolver-260408f-selection.json"
RUN_ID = "deptree-resolver-260408f"

# Load selection
with open(SELECTED_JSON) as f:
    selection = json.load(f)
selected_names = set(selection["selected"])

# Resolved packages (recipes generated)
RESOLVED = {
    "ancestris", "archarchive", "archlinux-artwork", "butter-launcher-bin",
    "crql-anina", "crql-locd", "electerm-live-bin", "empty", "en_se",
    "evcolors", "firefox-beta-bin-all-localizations",
    "freetype2-qdoled-aw3225qf", "freetype2-qdoled-gen3", "grep-compat",
    "heidisql-qt6-bin", "jdk17-zulu-prime-bin", "libelectron-electron-meta",
    "libinput-no-gestures", "librewolf-extension-keepassxc-browser",
    "llama.cpp-opencl", "mongodb-bin", "nvidia-535xx-utils", "opencl-amd",
    "opencl-nvidia-390xx", "opencl-nvidia-470xx", "opencl-nvidia-535xx",
    "opencl-nvidia-550xx", "opencl-nvidia-580xx", "opencl-nvidia-beta",
    "rocm-gfx110x-bin", "rocm-nightly-gfx110x-bin", "rocm-nightly-gfx1151-bin",
    "scrutiny-web-frontend", "vectorchord-bin", "vscodium-electron-bin",
}

# Blocked packages with reason codes
BLOCKED = {
    "anbox-git": "DISCONTINUED",
    "apple-fonts": "NON_DISTRIBUTABLE",
    "audiobookshelf": "MISSING_SOURCE",
    "bigpemu-bin": "PROPRIETARY_CLOSED_SOURCE",
    "bulky": "MISSING_SOURCE",
    "chkufsd-bin": "PROPRIETARY_CLOSED_SOURCE",
    "chromium-gost": "BUILD_SYSTEM_TOO_COMPLEX",
    "codex-desktop-bin": "MISSING_SOURCE",
    "cursor-ide": "PROPRIETARY_CLOSED_SOURCE",
    "dbeaver": "MISSING_SOURCE",
    "dotnet-sdk-preview-bin": "NEEDS_RECIPE_DESIGN",
    "fahviewer": "MISSING_SOURCE",
    "fluxdown-bin": "MISSING_SOURCE",
    "glazepkg-bin": "MISSING_SOURCE",
    "gram-editor-bin": "MISSING_SOURCE",
    "gst-thumbnailers": "MISSING_SOURCE",
    "hylauncher-bin": "MISSING_SOURCE",
    "hypnotix": "MISSING_SOURCE",
    "intel-compute-runtime-legacy": "NEEDS_RECIPE_DESIGN",
    "jdk17-graalvm-ee-bin": "PROPRIETARY_CLOSED_SOURCE",
    "jdk21-graalvm-ee-bin": "PROPRIETARY_CLOSED_SOURCE",
    "jdk8-graalvm-ee-bin": "PROPRIETARY_CLOSED_SOURCE",
    "komodo-periphery-git": "MISSING_SOURCE",
    "konform-multi-account-containers-lite": "MISSING_SOURCE",
    "lib32-bluez-libs": "LIB32_UNSUPPORTED",
    "lib32-libbluray": "LIB32_UNSUPPORTED",
    "lib32-libdovi": "LIB32_UNSUPPORTED",
    "lib32-libvmaf": "LIB32_UNSUPPORTED",
    "lib32-nvidia-utils-beta": "LIB32_UNSUPPORTED",
    "lib32-xvidcore": "LIB32_UNSUPPORTED",
    "libsdrplay": "PROPRIETARY_SDK",
    "matlab": "PROPRIETARY_CLOSED_SOURCE",
    "mechrevo-drivers-dkms": "DKMS_UNSUPPORTED",
    "mingw-w64-crt-msvcrt": "CROSS_TOOLCHAIN_COMPLEX",
    "mingw-w64-environment": "CROSS_TOOLCHAIN_COMPLEX",
    "mips64-linux-gnu-gcc-bootstrap": "CROSS_TOOLCHAIN_COMPLEX",
    "mips64el-linux-gnu-binutils": "CROSS_TOOLCHAIN_COMPLEX",
    "ndi-sdk": "PROPRIETARY_SDK",
    "nvidia-390xx-dkms": "DKMS_UNSUPPORTED",
    "nvidia-470xx-dkms": "DKMS_UNSUPPORTED",
    "nvidia-580xx-dkms": "DKMS_UNSUPPORTED",
    "nvidia-beta": "KERNEL_MODULE",
    "nvidia-beta-dkms": "DKMS_UNSUPPORTED",
    "nvidia-open-beta": "KERNEL_MODULE",
    "nvidia-open-beta-dkms": "DKMS_UNSUPPORTED",
    "ps3toolchain": "CROSS_TOOLCHAIN_COMPLEX",
    "spotify-1.1": "PROPRIETARY_CLOSED_SOURCE",
    "spotify-dev": "PROPRIETARY_CLOSED_SOURCE",
    "ttf-ms-win10-auto": "NON_DISTRIBUTABLE",
    "ttf-ms-win10-japanese": "NON_DISTRIBUTABLE",
    "ttf-ms-win10-korean": "NON_DISTRIBUTABLE",
    "ttf-ms-win10-other": "NON_DISTRIBUTABLE",
    "ttf-ms-win10-sea": "NON_DISTRIBUTABLE",
    "ttf-ms-win10-thai": "NON_DISTRIBUTABLE",
    "ttf-ms-win10-zh_cn": "NON_DISTRIBUTABLE",
    "ttf-ms-win10-zh_tw": "NON_DISTRIBUTABLE",
    "ttf-ms-win11-japanese": "NON_DISTRIBUTABLE",
    "ttf-ms-win11-korean": "NON_DISTRIBUTABLE",
    "ttf-ms-win11-other": "NON_DISTRIBUTABLE",
    "ttf-ms-win11-sea": "NON_DISTRIBUTABLE",
    "ttf-ms-win11-thai": "NON_DISTRIBUTABLE",
    "ttf-ms-win11-zh_cn": "NON_DISTRIBUTABLE",
    "ttf-ms-win11-zh_tw": "NON_DISTRIBUTABLE",
    "unreal-tournament-data-archiveorg": "NON_DISTRIBUTABLE",
    "unreal-tournament-data-gog": "NON_DISTRIBUTABLE",
}

# Pattern to match BLOCKED entries
blocked_pattern = re.compile(r'^(\*\* BLOCKED )(\d+)\. (.+?)(\s*\[.*\])?$')

updated_resolved = 0
updated_blocked = 0
lines_out = []

with open(ORG_FILE, "r") as f:
    lines = f.readlines()

i = 0
while i < len(lines):
    line = lines[i]
    m = blocked_pattern.match(line)
    if m:
        num = m.group(2)
        pkg_name = m.group(3).strip()
        pkg_name = re.sub(r'\s+- Source List:.*$', '', pkg_name).strip()
        pkg_name = re.sub(r'\s+\[.*\]$', '', pkg_name).strip()

        if pkg_name in RESOLVED:
            # Change BLOCKED to DONE
            new_line = f"** DONE {num}. {pkg_name}\n"
            lines_out.append(new_line)
            # Consume existing sub-lines (indented or blank lines under this heading)
            i += 1
            while i < len(lines) and (lines[i].startswith("   ") or lines[i].strip() == ""):
                lines_out.append(lines[i])
                i += 1
            # Add status line
            lines_out.append(f"   - Status: DONE: recipe in {RUN_ID}.scm (dependency-tree pass)\n")
            lines_out.append(f"   - TODO Status: DONE\n")
            updated_resolved += 1
            continue

        elif pkg_name in BLOCKED:
            reason = BLOCKED[pkg_name]
            new_line = f"** BLOCKED {num}. {pkg_name} [BLOCKED: {reason}]\n"
            lines_out.append(new_line)
            i += 1
            updated_blocked += 1
            continue

    lines_out.append(line)
    i += 1

# Atomic write
fd, tmp_path = tempfile.mkstemp(dir=ROOT, suffix=".org.tmp")
with open(fd, "w") as f:
    f.writelines(lines_out)
shutil.move(tmp_path, ORG_FILE)

print(f"Updated {updated_resolved} packages from BLOCKED -> DONE")
print(f"Updated {updated_blocked} packages with reason codes")
print(f"Total changes: {updated_resolved + updated_blocked}")
