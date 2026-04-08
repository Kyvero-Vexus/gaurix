#!/usr/bin/env python3
"""
Update todo_general_packages.org statuses for deptree-resolver-260408b.
Marks 12 resolved packages as DONE and updates blocked reason codes.
"""

import re
import sys
import tempfile
import shutil

ORG_FILE = "todo_general_packages.org"

# Packages resolved with recipes — change BLOCKED -> DONE
RESOLVED = {
    "cull-bin": "DONE [deptree-resolver-260408b] copy-build-system binary from GitHub",
    "daylight-bin": "DONE [deptree-resolver-260408b] copy-build-system binary from GitHub",
    "diz-bin": "DONE [deptree-resolver-260408b] copy-build-system binary from GitHub",
    "dnscontrol-bin": "DONE [deptree-resolver-260408b] copy-build-system binary from GitHub",
    "docker-credential-secretservice-bin": "DONE [deptree-resolver-260408b] copy-build-system binary from GitHub",
    "diffnav-bin": "DONE [deptree-resolver-260408b] copy-build-system binary from GitHub",
    "culmus": "DONE [deptree-resolver-260408b] font-build-system from SourceForge",
    "dinfo": "DONE [deptree-resolver-260408b] copy-build-system .NET self-contained binary",
    "discli": "DONE [deptree-resolver-260408b] copy-build-system Go binary from GitHub",
    "discord-rpc-extension-bin": "DONE [deptree-resolver-260408b] copy-build-system Electron app from GitHub",
    "dmenu-emoji": "DONE [deptree-resolver-260408b] copy-build-system shell script from git",
    "cura-resources-materials": "DONE [deptree-resolver-260408b] copy-build-system material data from git",
}

# Packages remaining blocked — update reason codes
BLOCKED_UPDATES = {
    "freetype2-qdoled-aw3225qf": "BUILD_SYSTEM_TOO_COMPLEX — Patched FreeType2 for OLED subpixel rendering; requires core library fork",
    "freetype2-qdoled-gen3": "BUILD_SYSTEM_TOO_COMPLEX — Patched FreeType2 for OLED subpixel rendering; requires core library fork",
    "jdk8-graalvm-ee-bin": "PROPRIETARY_LICENSE — Oracle GraalVM EE JDK 8; OTN license forbids redistribution",
    "jdk17-zulu-prime-bin": "PROPRIETARY_LICENSE — Azul Platform Prime JDK 17; requires Azul subscription",
    "jdk17-graalvm-ee-bin": "PROPRIETARY_LICENSE — Oracle GraalVM EE JDK 17; OTN license",
    "jdk21-graalvm-ee-bin": "PROPRIETARY_LICENSE — Oracle GraalVM EE JDK 21; GFTC license",
    "nvidia-535xx-utils": "PROPRIETARY_DRIVER — NVIDIA 535.xx utilities; proprietary license",
    "ttf-ms-win10-auto": "NON_DISTRIBUTABLE — MS Windows 10 fonts; EULA forbids redistribution",
    "ttf-ms-win10-japanese": "NON_DISTRIBUTABLE — MS Windows 10 Japanese fonts",
    "ttf-ms-win10-korean": "NON_DISTRIBUTABLE — MS Windows 10 Korean fonts",
    "ttf-ms-win10-other": "NON_DISTRIBUTABLE — MS Windows 10 other fonts",
    "ttf-ms-win10-sea": "NON_DISTRIBUTABLE — MS Windows 10 Southeast Asian fonts",
    "ttf-ms-win10-thai": "NON_DISTRIBUTABLE — MS Windows 10 Thai fonts",
    "ttf-ms-win10-zh_cn": "NON_DISTRIBUTABLE — MS Windows 10 Simplified Chinese fonts",
    "ttf-ms-win10-zh_tw": "NON_DISTRIBUTABLE — MS Windows 10 Traditional Chinese fonts",
    "ttf-ms-win11-japanese": "NON_DISTRIBUTABLE — MS Windows 11 Japanese fonts",
    "ttf-ms-win11-korean": "NON_DISTRIBUTABLE — MS Windows 11 Korean fonts",
    "ttf-ms-win11-other": "NON_DISTRIBUTABLE — MS Windows 11 other fonts",
    "ttf-ms-win11-sea": "NON_DISTRIBUTABLE — MS Windows 11 Southeast Asian fonts",
    "ttf-ms-win11-thai": "NON_DISTRIBUTABLE — MS Windows 11 Thai fonts",
    "ttf-ms-win11-zh_cn": "NON_DISTRIBUTABLE — MS Windows 11 Simplified Chinese fonts",
    "ttf-ms-win11-zh_tw": "NON_DISTRIBUTABLE — MS Windows 11 Traditional Chinese fonts",
    "apple-fonts": "NON_DISTRIBUTABLE — Apple proprietary fonts; license forbids redistribution",
    "libinput-no-gestures": "BUILD_SYSTEM_TOO_COMPLEX — Patched libinput; core system library replacement",
    "rocm-gfx110x-bin": "BUILD_SYSTEM_TOO_COMPLEX — AMD ROCm binary; massive compute stack with 50+ libraries",
    "rocm-nightly-gfx110x-bin": "BUILD_SYSTEM_TOO_COMPLEX — AMD ROCm nightly; same as rocm-gfx110x-bin",
    "rocm-nightly-gfx1151-bin": "BUILD_SYSTEM_TOO_COMPLEX — AMD ROCm nightly; same as rocm-gfx110x-bin",
    "opencl-amd": "BUILD_SYSTEM_TOO_COMPLEX — AMD OpenCL runtime; requires AMDGPU-PRO extraction",
    "aspnet-runtime-preview-bin": "MISSING_SOURCE — ASP.NET preview; unstable URLs removed after GA",
    "mingw-w64-crt-msvcrt": "CROSS_COMPILER — MinGW-w64 CRT; requires full Windows cross toolchain bootstrap",
    "lib32-nvidia-utils-beta": "LIB32 — 32-bit NVIDIA beta utils; Guix has no multilib support",
    "firefox-beta-bin-all-localizations": "BUILD_SYSTEM_TOO_COMPLEX — Firefox Beta + 90 locales; too many sub-packages",
    "archlinux-java-run": "ARCH_SPECIFIC — Arch Linux Java wrapper using archlinux-java helper",
    "matlab": "PROPRIETARY_LICENSE — MathWorks MATLAB; requires commercial license",
    "opencl-nvidia-390xx": "PROPRIETARY_DRIVER — NVIDIA OpenCL 390.xx; proprietary license",
    "opencl-nvidia-470xx": "PROPRIETARY_DRIVER — NVIDIA OpenCL 470.xx; proprietary license",
    "opencl-nvidia-580xx": "PROPRIETARY_DRIVER — NVIDIA OpenCL 580.xx; proprietary license",
    "opencl-nvidia-beta": "PROPRIETARY_DRIVER — NVIDIA OpenCL beta; proprietary license",
    "opencl-nvidia-535xx": "PROPRIETARY_DRIVER — NVIDIA OpenCL 535.xx; proprietary license",
    "opencl-nvidia-550xx": "PROPRIETARY_DRIVER — NVIDIA OpenCL 550.xx; proprietary license",
    "lib32-libbluray": "LIB32 — 32-bit libbluray; Guix has no multilib support",
    "vscodium-electron-bin": "BUILD_SYSTEM_TOO_COMPLEX — VSCodium with system Electron; complex path rewriting",
    "gst-thumbnailers": "MISSING_SOURCE — Not in AUR cache; no upstream project found",
    "mechrevo-drivers-dkms": "KERNEL_MODULE — DKMS driver; requires kernel source tree",
    "unreal-tournament-data-archiveorg": "MISSING_SOURCE — Game data; redistributability unclear",
    "ndi-sdk": "PROPRIETARY_LICENSE — NewTek NDI SDK; proprietary license",
    "unreal-tournament-data-gog": "MISSING_SOURCE — GOG game data; requires purchase",
    "vectorchord-bin": "BUILD_SYSTEM_TOO_COMPLEX — PostgreSQL extension; requires pgrx Rust toolchain",
    "nvidia-390xx-dkms": "KERNEL_MODULE — NVIDIA 390.xx DKMS; proprietary + requires kernel source",
    "nvidia-470xx-dkms": "KERNEL_MODULE — NVIDIA 470.xx DKMS; proprietary + requires kernel source",
    "nvidia-580xx-dkms": "KERNEL_MODULE — NVIDIA 580.xx DKMS; proprietary + requires kernel source",
    "nvidia-beta-dkms": "KERNEL_MODULE — NVIDIA beta DKMS; proprietary + requires kernel source",
    "samsung-unified-driver-printer": "PROPRIETARY_LICENSE — Samsung printer driver; custom Samsung license",
    "iscan": "PROPRIETARY_LICENSE — EPSON Image Scan; proprietary core binary",
    "lib32-xvidcore": "LIB32 — 32-bit Xvid codec; Guix has no multilib support",
    "mongodb-bin": "NON_FOSS_LICENSE — MongoDB Community; SSPL-1.0 not OSI-approved",
    "nvidia-open-beta": "KERNEL_MODULE — NVIDIA open beta module; requires kernel headers + DKMS",
    "nvidia-open-beta-dkms": "KERNEL_MODULE — NVIDIA open beta DKMS; requires kernel source",
    "samsung-unified-driver-scanner": "PROPRIETARY_LICENSE — Samsung scanner driver; proprietary binary",
    "kdesignerplugin": "BUILD_SYSTEM_TOO_COMPLEX — Deprecated KDE5 Qt Designer plugin framework",
    "lib32-libdovi": "LIB32 — 32-bit Dolby Vision library; Guix has no multilib support",
    "lib32-libvmaf": "LIB32 — 32-bit VMAF library; Guix has no multilib support",
    "nvidia-beta": "PROPRIETARY_DRIVER — NVIDIA beta driver; proprietary license",
    "heidisql-qt6-bin": "BUILD_SYSTEM_TOO_COMPLEX — HeidiSQL Qt6; no stable Linux binary",
    "kemoticons": "BUILD_SYSTEM_TOO_COMPLEX — Deprecated KDE5 emoticon framework",
    "llama.cpp-opencl": "MISSING_BUILD_TOOLS — Requires OpenCL 2.0+ SDK not available in Guix",
    "ps3toolchain": "CROSS_COMPILER — PS3 Cell/PPU toolchain; requires binutils+gcc+newlib cross-build",
    "lib32-bluez-libs": "LIB32 — 32-bit BlueZ libraries; Guix has no multilib support",
    "mips64-linux-gnu-gcc-bootstrap": "CROSS_COMPILER — MIPS64 GCC bootstrap; full cross-compilation toolchain",
    "spotify-1.1": "PROPRIETARY_LICENSE — Spotify v1.1.x; proprietary EULA",
    "spotify-dev": "PROPRIETARY_LICENSE — Spotify dev client; proprietary EULA",
    "anbox-git": "MISSING_SOURCE — Android-in-a-box; project discontinued and archived",
    "ancestris": "BUILD_SYSTEM_TOO_COMPLEX — Java genealogy app; requires NetBeans Platform build",
    "archarchive": "ARCH_SPECIFIC — Arch Linux Archive manager; Arch-only tool",
    "archlinux-artwork": "ARCH_SPECIFIC — Arch Linux branding artwork",
    "audiobookshelf": "MISSING_SOURCE — Not in AUR cache; complex Node.js server app",
    "bigpemu-bin": "PROPRIETARY_LICENSE — Atari Jaguar emulator; proprietary freeware",
    "bulky": "MISSING_SOURCE — Linux Mint bulk renamer; not in AUR cache",
    "butter-launcher-bin": "MISSING_SOURCE — Not in AUR cache; no upstream found",
    "chkufsd-bin": "PROPRIETARY_LICENSE — Paragon NTFS utility; proprietary license",
    "chromium-gost": "BUILD_SYSTEM_TOO_COMPLEX — Chromium + GOST crypto patches; full Chromium build",
    "codeql": "PROPRIETARY_LICENSE — GitHub CodeQL; custom license restricts redistribution",
    "coder-bin": "BUILD_SYSTEM_TOO_COMPLEX — Coder platform; complex multi-binary distribution; deferred",
    "codex-desktop-bin": "MISSING_SOURCE — OpenAI Codex desktop; requires authentication to download",
    "crql-anina": "MISSING_SOURCE — Not in AUR cache; no upstream found",
    "crql-locd": "MISSING_SOURCE — Not in AUR cache; no upstream found",
    "cursor-ide": "PROPRIETARY_LICENSE — Cursor AI IDE; LicenseRef-Cursor_EULA; not redistributable",
    "dbeaver": "BUILD_SYSTEM_TOO_COMPLEX — DBeaver database tool; large Eclipse/Java RCP application",
}


def update_org_file():
    with open(ORG_FILE, "r") as f:
        lines = f.readlines()

    updated = 0
    result = []
    header_pattern = re.compile(r'^(\*\* )(BLOCKED|DONE|FAILED|TODO)( \d+\. )(.+?)(\s*\[.*\])?\s*$')

    i = 0
    while i < len(lines):
        line = lines[i]
        m = header_pattern.match(line)
        if m:
            prefix = m.group(1)   # "** "
            status = m.group(2)   # "BLOCKED"
            numpart = m.group(3)  # " 1234. "
            name_raw = m.group(4).strip()
            # Strip metadata suffixes
            name = re.sub(r'\s+- Source List:.*$', '', name_raw).strip()
            name = re.sub(r'\s+\[.*\]$', '', name).strip()

            if name in RESOLVED and status == "BLOCKED":
                new_status = "DONE"
                result.append(f"{prefix}{new_status}{numpart}{name}\n")
                # Skip any existing status sub-lines
                i += 1
                while i < len(lines) and lines[i].startswith("   - Status:"):
                    i += 1
                # Add new status line
                result.append(f"   - Status: {RESOLVED[name]}\n")
                updated += 1
                continue
            elif name in BLOCKED_UPDATES and status == "BLOCKED":
                # Keep BLOCKED but update reason if not already present
                tag = f"[BLOCKED: {BLOCKED_UPDATES[name]}]"
                # Only update the header tag if different
                result.append(f"{prefix}BLOCKED{numpart}{name} {tag}\n")
                i += 1
                # Skip existing status lines
                while i < len(lines) and lines[i].startswith("   - Status:"):
                    i += 1
                # Add updated status
                result.append(f"   - Status: BLOCKED: {BLOCKED_UPDATES[name]}\n")
                updated += 1
                continue

        result.append(line)
        i += 1

    # Atomic write
    tmp = tempfile.NamedTemporaryFile(mode='w', dir='.', suffix='.org',
                                      delete=False)
    tmp.writelines(result)
    tmp.close()
    shutil.move(tmp.name, ORG_FILE)

    print(f"Updated {updated} entries in {ORG_FILE}")
    return updated


if __name__ == "__main__":
    n = update_org_file()
    print(f"Total updates: {n}")
    # Verify
    done_count = 0
    with open(ORG_FILE) as f:
        for line in f:
            if "deptree-resolver-260408b" in line:
                done_count += 1
    print(f"Lines mentioning deptree-resolver-260408b: {done_count}")
