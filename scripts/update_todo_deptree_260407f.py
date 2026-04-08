#!/usr/bin/env python3
"""Update todo_general_packages.org statuses for deptree-resolver-260407f pass."""

import re
import sys
import tempfile
import shutil
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
ORG_FILE = ROOT / "todo_general_packages.org"

# Packages resolved with recipes (DONE)
DONE_PACKAGES = {
    "bat-asus-battery-bin": "DONE: Recipe in deptree-resolver-260407f.scm. copy-build-system, Go binary from GitHub v1.2.",
    "batdoc-bin": "DONE: Recipe in deptree-resolver-260407f.scm. copy-build-system, zstd-compressed binary from GitHub v1.3.1.",
    "bcmr-bin": "DONE: Recipe in deptree-resolver-260407f.scm. copy-build-system, Rust binary from GitHub v0.5.4.",
    "bento-bin": "DONE: Recipe in deptree-resolver-260407f.scm. copy-build-system, Go binary from GitHub v1.16.2.",
    "bin-cpuflags-x86-bin": "DONE: Recipe in deptree-resolver-260407f.scm. copy-build-system, Rust binary from GitHub v1.0.8.",
    "bine-bin": "DONE: Recipe in deptree-resolver-260407f.scm. copy-build-system, Go binary from GitHub v0.10.1.",
    "blocky-bin": "DONE: Recipe in deptree-resolver-260407f.scm. copy-build-system, Go DNS proxy from GitHub v0.29.0.",
    "bookokrat-bin": "DONE: Recipe in deptree-resolver-260407f.scm. copy-build-system, Rust binary from GitHub v0.3.9.",
    "btdu-bin": "DONE: Recipe in deptree-resolver-260407f.scm. copy-build-system, static binary from GitHub v0.7.2.",
    "batctl-tui-bin": "DONE: Recipe in deptree-resolver-260407f.scm. copy-build-system, binary from GitHub v2026.3.13.",
    "binco-bin": "DONE: Recipe in deptree-resolver-260407f.scm. copy-build-system, D binary from GitHub v0.3.0.",
    "backblaze-b2-bin": "DONE: Recipe in deptree-resolver-260407f.scm. copy-build-system, Python binary from GitHub v4.6.0.",
    "liberica-jdk-full-bin": "DONE: Recipe in deptree-resolver-260407f.scm. copy-build-system, BellSoft JDK v26+37.",
    "jdk17-temurin": "DONE: Recipe in deptree-resolver-260407f.scm. copy-build-system, Adoptium JDK 17.0.18.",
    "amazon-corretto-8": "DONE: Recipe in deptree-resolver-260407f.scm (as amazon-corretto-8-bin). copy-build-system, AWS JDK 8.482.08.1.",
    "bfind": "DONE: Recipe in deptree-resolver-260407f.scm (as bfind-pkg). gnu-build-system, C source from Codeberg v3.0.2.",
    "bus": "DONE: Recipe in deptree-resolver-260407f.scm (as bus-pkg). gnu-build-system, C source from Codeberg v3.1.11.",
}

# Packages that stay BLOCKED with updated reason codes
BLOCKED_PACKAGES = {
    "ttf-ms-win10-auto": "BLOCKED: PROPRIETARY_SOURCE_REQUIRED — MS Windows 10 fonts require Windows ISO extraction. Not redistributable.",
    "ttf-ms-win10-japanese": "BLOCKED: PROPRIETARY_SOURCE_REQUIRED — MS Windows 10 Japanese fonts require Windows ISO.",
    "ttf-ms-win10-korean": "BLOCKED: PROPRIETARY_SOURCE_REQUIRED — MS Windows 10 Korean fonts require Windows ISO.",
    "ttf-ms-win10-other": "BLOCKED: PROPRIETARY_SOURCE_REQUIRED — MS Windows 10 other fonts require Windows ISO.",
    "ttf-ms-win10-sea": "BLOCKED: PROPRIETARY_SOURCE_REQUIRED — MS Windows 10 SEA fonts require Windows ISO.",
    "ttf-ms-win10-thai": "BLOCKED: PROPRIETARY_SOURCE_REQUIRED — MS Windows 10 Thai fonts require Windows ISO.",
    "ttf-ms-win10-zh_cn": "BLOCKED: PROPRIETARY_SOURCE_REQUIRED — MS Windows 10 Chinese (Simplified) fonts require Windows ISO.",
    "ttf-ms-win10-zh_tw": "BLOCKED: PROPRIETARY_SOURCE_REQUIRED — MS Windows 10 Chinese (Traditional) fonts require Windows ISO.",
    "ttf-ms-win11-japanese": "BLOCKED: PROPRIETARY_SOURCE_REQUIRED — MS Windows 11 Japanese fonts require Windows ISO.",
    "ttf-ms-win11-korean": "BLOCKED: PROPRIETARY_SOURCE_REQUIRED — MS Windows 11 Korean fonts require Windows ISO.",
    "ttf-ms-win11-other": "BLOCKED: PROPRIETARY_SOURCE_REQUIRED — MS Windows 11 other fonts require Windows ISO.",
    "ttf-ms-win11-sea": "BLOCKED: PROPRIETARY_SOURCE_REQUIRED — MS Windows 11 SEA fonts require Windows ISO.",
    "ttf-ms-win11-thai": "BLOCKED: PROPRIETARY_SOURCE_REQUIRED — MS Windows 11 Thai fonts require Windows ISO.",
    "ttf-ms-win11-zh_cn": "BLOCKED: PROPRIETARY_SOURCE_REQUIRED — MS Windows 11 Chinese (Simplified) fonts require Windows ISO.",
    "ttf-ms-win11-zh_tw": "BLOCKED: PROPRIETARY_SOURCE_REQUIRED — MS Windows 11 Chinese (Traditional) fonts require Windows ISO.",
    "apple-fonts": "BLOCKED: PROPRIETARY_SOURCE_REQUIRED — Apple platform fonts require Apple developer access. Custom license.",
    "nerd-fonts-apple": "BLOCKED: PROPRIETARY_SOURCE_REQUIRED — Nerd-patched Apple fonts. Derived from proprietary Apple fonts.",
    "nvidia-535xx-utils": "BLOCKED: PROPRIETARY_DRIVER_FRAMEWORK — NVIDIA 535 branch driver utils. Best handled by nonguix.",
    "opencl-nvidia-390xx": "BLOCKED: PROPRIETARY_DRIVER_FRAMEWORK — NVIDIA 390xx OpenCL. Proprietary driver extraction.",
    "opencl-nvidia-470xx": "BLOCKED: PROPRIETARY_DRIVER_FRAMEWORK — NVIDIA 470xx OpenCL. Proprietary driver extraction.",
    "opencl-nvidia-535xx": "BLOCKED: PROPRIETARY_DRIVER_FRAMEWORK — NVIDIA 535xx OpenCL. Proprietary driver extraction.",
    "opencl-nvidia-550xx": "BLOCKED: PROPRIETARY_DRIVER_FRAMEWORK — NVIDIA 550xx OpenCL. Proprietary driver extraction.",
    "opencl-nvidia-beta": "BLOCKED: PROPRIETARY_DRIVER_FRAMEWORK — NVIDIA beta OpenCL. Proprietary driver extraction.",
    "nvidia-390xx-dkms": "BLOCKED: PROPRIETARY_DRIVER_FRAMEWORK — NVIDIA 390xx DKMS. DKMS incompatible with Guix.",
    "nvidia-470xx-dkms": "BLOCKED: PROPRIETARY_DRIVER_FRAMEWORK — NVIDIA 470xx DKMS. DKMS incompatible with Guix.",
    "nvidia-beta-dkms": "BLOCKED: PROPRIETARY_DRIVER_FRAMEWORK — NVIDIA beta DKMS. DKMS incompatible with Guix.",
    "nvidia-open-beta": "BLOCKED: PROPRIETARY_DRIVER_FRAMEWORK — NVIDIA open kernel (beta). Coupled to NVIDIA driver stack.",
    "nvidia-open-beta-dkms": "BLOCKED: PROPRIETARY_DRIVER_FRAMEWORK — NVIDIA open DKMS (beta). DKMS incompatible with Guix.",
    "nvidia-beta": "BLOCKED: PROPRIETARY_DRIVER_FRAMEWORK — NVIDIA kernel module (beta). Proprietary driver.",
    "rocm-gfx110x-bin": "BLOCKED: HARDWARE_SPECIFIC_BINARY — ROCm RDNA3 binary (~2GB). Custom AMD license.",
    "rocm-nightly-gfx110x-bin": "BLOCKED: HARDWARE_SPECIFIC_BINARY — ROCm nightly RDNA3. Unstable nightly URLs.",
    "rocm-nightly-gfx1151-bin": "BLOCKED: HARDWARE_SPECIFIC_BINARY — ROCm nightly gfx1151. Unstable nightly URLs.",
    "jdk8-graalvm-ee-bin": "BLOCKED: PROPRIETARY_LICENSE — GraalVM EE JDK 8. OTN license requires Oracle account.",
    "jdk17-zulu-prime-bin": "BLOCKED: PROPRIETARY_LICENSE — Azul Platform Prime JDK 17. Proprietary Azul license.",
    "jdk17-graalvm-ee-bin": "BLOCKED: PROPRIETARY_LICENSE — GraalVM EE JDK 17. OTN license.",
    "jdk21-graalvm-ee-bin": "BLOCKED: PROPRIETARY_LICENSE — GraalVM EE JDK 21. GFTC license.",
    "arch-remaster": "BLOCKED: ARCH_SPECIFIC — Arch Linux ISO remastering tool. Requires pacman infrastructure.",
    "arch-updater": "BLOCKED: ARCH_SPECIFIC — Arch Linux system updater. Wraps pacman.",
    "archarchive": "BLOCKED: ARCH_SPECIFIC — Arch Linux rollback tool. Uses pacman and ALA.",
    "archlinux-artwork": "BLOCKED: ARCH_SPECIFIC_BRANDING — Arch Linux logos/icons. Trademark-restricted.",
    "gst-thumbnailers": "BLOCKED: NOT_IN_AUR — Not found in AUR cache. May be removed or renamed.",
    "anbox-git": "BLOCKED: NOT_IN_AUR — Android-in-a-box. Project discontinued, succeeded by Waydroid.",
    "audiobookshelf": "BLOCKED: NOT_IN_AUR — Audiobook server. Not in AUR cache.",
    "bulky": "BLOCKED: NOT_IN_AUR — Linux Mint bulk renamer. Not in AUR cache.",
    "betterbird-fr-bin": "BLOCKED: NOT_IN_AUR — Betterbird French binary. Not in AUR cache.",
    "bigpemu-bin": "BLOCKED: NOT_IN_AUR — BigPEmu Jaguar emulator. Not in AUR cache, proprietary.",
    "boomer-git": "BLOCKED: MISSING_BUILD_TOOLS — Nim screen zoomer. Guix has no Nim compiler.",
    "ndi-sdk": "BLOCKED: PROPRIETARY_LICENSE — NewTek NDI SDK. Registration-gated, proprietary.",
    "spotify-1.1": "BLOCKED: PROPRIETARY_LICENSE — Spotify legacy client v1.1. Proprietary EULA.",
    "spotify-dev": "BLOCKED: PROPRIETARY_LICENSE — Spotify dev channel. Proprietary EULA.",
    "unreal-tournament-data-archiveorg": "BLOCKED: PROPRIETARY_SOURCE_REQUIRED — UT99 game data from Archive.org ISO.",
    "unreal-tournament-data-gog": "BLOCKED: PROPRIETARY_SOURCE_REQUIRED — UT99 game data from GOG. Requires GOG account.",
    "mongodb-bin": "BLOCKED: RESTRICTIVE_LICENSE — MongoDB server. SSPL-1.0 not OSI-approved.",
    "vscodium-electron-bin": "BLOCKED: BLOCKED_DEPENDENCY — Needs electron39 not available in Guix.",
    "freetype2-qdoled-aw3225qf": "BLOCKED: HARDWARE_SPECIFIC_PATCH — freetype2 with Dell AW3225QF QD-OLED patches from AUR.",
    "freetype2-qdoled-gen3": "BLOCKED: HARDWARE_SPECIFIC_PATCH — freetype2 with QD-OLED Gen3 patches from AUR.",
    "mechrevo-drivers-dkms": "BLOCKED: DKMS_DRIVER — MECHREVO laptop DKMS driver. DKMS incompatible with Guix.",
    "mingw-w64-crt-msvcrt": "BLOCKED: CROSS_COMPILATION_TOOLCHAIN — MinGW-w64 CRT. Guix has own cross-compilation.",
    "ps3toolchain": "BLOCKED: MISSING_DEPENDENCIES — PS3 homebrew meta-package. All 5 deps missing.",
    "mips64-linux-gnu-gcc-bootstrap": "BLOCKED: CROSS_COMPILATION_TOOLCHAIN — MIPS64 GCC bootstrap. Guix has native cross-compilation.",
    "iscan": "BLOCKED: PROPRIETARY_COMPONENTS — EPSON scanner. Mixed GPL + proprietary AVASYSPL license.",
    "llama.cpp-opencl": "BLOCKED: BLOCKED_DEPENDENCY — llama.cpp OpenCL backend. Requires vendor-specific OpenCL ICD.",
    "firefox-beta-bin-all-localizations": "BLOCKED: COMPLEX_PACKAGING — Perl download helper for Firefox Beta. Better to package Firefox directly.",
    "lib32-libdovi": "BLOCKED: 32BIT_LIBRARY — 32-bit Dolby Vision lib. Needs 32-bit Rust toolchain.",
    "lib32-libbluray": "BLOCKED: 32BIT_LIBRARY — 32-bit libbluray. Extensive 32-bit dep chain.",
    "vectorchord-bin": "BLOCKED: DATABASE_EXTENSION — PostgreSQL extension. Version-locked to PostgreSQL major.",
    "beatmapexporter-bin": "BLOCKED: DOTNET_RUNTIME — .NET application. Limited .NET support in Guix.",
    "butter-launcher-bin": "BLOCKED: ELECTRON_APP — Electron game launcher. Complex Electron packaging.",
    "blindpaste": "BLOCKED: NO_LINUX_BINARY — TUI note app. No GitHub repo or binary found.",
}

def update_org_file():
    """Update todo_general_packages.org with new statuses."""
    lines = []
    with open(ORG_FILE, "r") as f:
        lines = f.readlines()

    updated = 0
    output_lines = []
    i = 0
    while i < len(lines):
        line = lines[i]
        # Match package header line: ** STATUS NUM. PACKAGE_NAME
        m = re.match(r'^(\*\* )(\w+)( \d+\. )(.+)$', line)
        if m:
            prefix = m.group(1)
            old_status = m.group(2)
            num_part = m.group(3)
            pkg_name = m.group(4).strip()

            # Check if this package is in our update lists
            if pkg_name in DONE_PACKAGES and old_status == "BLOCKED":
                # Change to DONE
                output_lines.append(f"{prefix}DONE{num_part}{pkg_name}\n")
                # Update the Status line in the body
                i += 1
                while i < len(lines) and not lines[i].startswith("** "):
                    body_line = lines[i]
                    if body_line.strip().startswith("- Status:"):
                        output_lines.append(f"   - Status: {DONE_PACKAGES[pkg_name]}\n")
                    elif body_line.strip().startswith("- TODO Status:"):
                        output_lines.append(f"   - TODO Status: DONE\n")
                    else:
                        output_lines.append(body_line)
                    i += 1
                updated += 1
                continue

            elif pkg_name in BLOCKED_PACKAGES and old_status in ("BLOCKED", "TODO"):
                # Update status line but keep BLOCKED
                new_status = "BLOCKED"
                output_lines.append(f"{prefix}{new_status}{num_part}{pkg_name}\n")
                # Update the Status line
                i += 1
                while i < len(lines) and not lines[i].startswith("** "):
                    body_line = lines[i]
                    if body_line.strip().startswith("- Status:"):
                        output_lines.append(f"   - Status: {BLOCKED_PACKAGES[pkg_name]}\n")
                    elif body_line.strip().startswith("- TODO Status:"):
                        output_lines.append(f"   - TODO Status: BLOCKED\n")
                    else:
                        output_lines.append(body_line)
                    i += 1
                updated += 1
                continue

        output_lines.append(line)
        i += 1

    # Write atomically
    tmp = tempfile.NamedTemporaryFile(mode='w', dir=ORG_FILE.parent,
                                      suffix='.tmp', delete=False)
    tmp.writelines(output_lines)
    tmp.close()
    shutil.move(tmp.name, ORG_FILE)

    print(f"Updated {updated} packages in {ORG_FILE}")
    print(f"  DONE: {len(DONE_PACKAGES)} packages")
    print(f"  BLOCKED (updated): {len(BLOCKED_PACKAGES)} packages")
    return updated

if __name__ == "__main__":
    update_org_file()
