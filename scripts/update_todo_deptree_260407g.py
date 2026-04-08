#!/usr/bin/env python3
"""Update todo_general_packages.org statuses for deptree-resolver-260407g pass.

Deterministic full-file transform: read → compute → write temp → atomic move.
"""

import re
import tempfile
import shutil
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
ORG_FILE = ROOT / "todo_general_packages.org"

# Packages resolved with recipes (BLOCKED → DONE)
DONE_PACKAGES = {
    8858: ("caligula-bin", "DONE: Recipe in deptree-resolver-260407g.scm. copy-build-system, Rust binary from GitHub v0.4.7."),
    7772: ("capa-bin", "DONE: Recipe in deptree-resolver-260407g.scm. copy-build-system, zip binary from GitHub v9.4.0."),
    2103: ("carapace-bin", "DONE: Recipe in deptree-resolver-260407g.scm. copy-build-system, tarball from GitHub v1.6.4."),
    4145: ("catbox-bin", "DONE: Recipe in deptree-resolver-260407g.scm. copy-build-system, binary from GitHub v0.9.2."),
    1428: ("catwalk-bin", "DONE: Recipe in deptree-resolver-260407g.scm. copy-build-system, tarball from GitHub v0.34.4."),
    1426: ("chibi-cli-bin", "DONE: Recipe in deptree-resolver-260407g.scm. copy-build-system, binary from GitHub v1.2.1."),
    7385: ("chmod-cli-bin", "DONE: Recipe in deptree-resolver-260407g.scm. copy-build-system, tarball from GitHub v0.2.0."),
    5511: ("bililive-recorder-bin", "DONE: Recipe in deptree-resolver-260407g.scm. copy-build-system, .NET CLI zip from GitHub v2.17.3."),
    10729: ("fonts-droid-fallback", "DONE: Recipe in deptree-resolver-260407g.scm. copy-build-system, DroidSansFallback font from Debian .deb."),
    10730: ("fonts-noto-hinted", "DONE: Recipe in deptree-resolver-260407g.scm. copy-build-system, Google Noto hinted fonts from Debian .deb."),
    7045: ("catppuccin-cursors-frappe", "DONE: Recipe in deptree-resolver-260407g.scm. copy-build-system, cursor theme zip v2.0.0 (mauve accent)."),
    2411: ("catppuccin-cursors-macchiato", "DONE: Recipe in deptree-resolver-260407g.scm. copy-build-system, cursor theme zip v2.0.0 (mauve accent)."),
    214: ("catppuccin-cursors-mocha", "DONE: Recipe in deptree-resolver-260407g.scm. copy-build-system, cursor theme zip v2.0.0 (mauve accent)."),
    2320: ("catppuccin-gtk-theme-macchiato", "DONE: Recipe in deptree-resolver-260407g.scm. copy-build-system, GTK theme zip v1.0.3 (mauve accent)."),
    2104: ("catppuccin-gtk-theme-mocha", "DONE: Recipe in deptree-resolver-260407g.scm. copy-build-system, GTK theme zip v1.0.3 (mauve accent)."),
    8542: ("cdirip", "DONE: Recipe in deptree-resolver-260407g.scm. gnu-build-system, C source from GitHub v0.6.4."),
    3064: ("c47-bin", "DONE: Recipe in deptree-resolver-260407g.scm. copy-build-system, calculator emulator binary from GitLab."),
}

# Packages that stay BLOCKED with updated reason codes
BLOCKED_PACKAGES = {
    21311: ("yay", "BLOCKED: ARCH_SPECIFIC — AUR helper wrapping pacman + git. Requires libalpm and AUR ecosystem."),
    12875: ("archlinux-java-run", "BLOCKED: ARCH_SPECIFIC — Arch Java runtime selector using pacman hooks."),
    9975: ("matlab", "BLOCKED: PROPRIETARY_LICENSE — MathWorks MATLAB. Commercial license, not redistributable."),
    2890: ("plasma-workspace-povd", "BLOCKED: COMPLEX_BUILD — KDE Plasma workspace fork. 105 deps, requires full KDE Plasma stack."),
    11312: ("paru", "BLOCKED: ARCH_SPECIFIC — AUR helper (Rust). Requires libalpm/pacman."),
    6310: ("bms-shell", "BLOCKED: NO_SOURCE_CODE — GitHub repo has only 67MB binary tarball, no source. Claims GPL-3.0 but violates source distribution."),
    9886: ("intel-npu-driver", "BLOCKED: COMPLEX_BUILD — Intel NPU driver. Requires level-zero, intel-compute-runtime, kernel module."),
    6543: ("gst-thumbnailers", "BLOCKED: NOT_IN_AUR — Not found in AUR cache. May be removed or renamed."),
    10129: ("aspnet-runtime-preview-bin", "BLOCKED: BLOCKED_DEPENDENCY — Depends on dotnet-runtime-preview-bin (not packaged). Unstable preview API."),
    9803: ("sdrpp-headers-git", "BLOCKED: COMPLEX_BUILD — SDR++ headers-only dev package. Requires building SDR++ from git with complex DSP deps."),
    3667: ("ggml-sycl-f16-git", "BLOCKED: MISSING_BUILD_TOOLS — GGML Intel SYCL backend. Requires Intel DPC++ compiler and oneAPI toolkit."),
    650: ("samsung-unified-driver-printer", "BLOCKED: PROPRIETARY_LICENSE — Samsung printer driver. Custom Samsung license."),
    6633: ("yaycache", "BLOCKED: ARCH_SPECIFIC — yay cache manager. Depends on yay (arch-specific)."),
    640: ("iscan", "BLOCKED: PROPRIETARY_COMPONENTS — EPSON scanner. Mixed GPL + proprietary AVASYSPL license."),
    10483: ("package-query", "BLOCKED: ARCH_SPECIFIC — libalpm query tool. Requires Arch package DB."),
    21765: ("paru-git", "BLOCKED: ARCH_SPECIFIC — paru dev version. Requires libalpm/pacman."),
    649: ("samsung-unified-driver-scanner", "BLOCKED: PROPRIETARY_LICENSE — Samsung scanner driver. Custom Samsung license."),
    7324: ("kdesignerplugin", "BLOCKED: COMPLEX_BUILD — KDE Frameworks 5 designer plugin. Requires full KF5 stack, superseded by KF6."),
    2366: ("lib32-libvmaf", "BLOCKED: 32BIT_LIBRARY — 32-bit Netflix VMAF. Needs 32-bit toolchain."),
    424: ("opencl-amd", "BLOCKED: PROPRIETARY_DRIVER — AMD OpenCL runtime from AMDGPU-PRO. Proprietary license."),
    11354: ("aurutils", "BLOCKED: ARCH_SPECIFIC — AUR build automation. Requires pacman+makepkg."),
    10777: ("icu74", "BLOCKED: COMPLEX_BUILD — Specific ICU 74. Parallel ICU versions require careful ABI management."),
    5333: ("kemoticons", "BLOCKED: COMPLEX_BUILD — KDE Frameworks 5 emoticons. Requires full KF5 stack, superseded by KF6."),
    5015: ("ps3toolchain", "BLOCKED: MISSING_DEPENDENCIES — PS3 homebrew meta-package. All 5 component deps missing."),
    9082: ("cosmic-bg-git", "BLOCKED: COMPLEX_BUILD — COSMIC desktop bg manager. Requires libcosmic/iced-sctk not in Guix."),
    9861: ("intel-graphics-compiler-legacy", "BLOCKED: COMPLEX_BUILD — Intel GPU compiler (legacy). Requires LLVM fork and Intel-specific patches."),
    2408: ("lib32-nvidia-utils-beta", "BLOCKED: PROPRIETARY_DRIVER — NVIDIA 32-bit utils (beta). Proprietary."),
    7662: ("python-frida", "BLOCKED: PROPRIETARY_LICENSE — Frida instrumentation. Custom license with commercial restrictions."),
    9085: ("cosmic-files-git", "BLOCKED: COMPLEX_BUILD — COSMIC file manager. Same COSMIC toolkit deps as cosmic-bg-git."),
    2431: ("lib32-bluez-libs", "BLOCKED: 32BIT_LIBRARY — 32-bit BlueZ. Needs 32-bit toolchain."),
    9045: ("mips64-linux-gnu-gcc-bootstrap", "BLOCKED: CROSS_COMPILATION_TOOLCHAIN — MIPS64 GCC. Guix has native cross-compilation."),
    4905: ("python-twisterl", "BLOCKED: MISSING_DEPENDENCIES — Quantum computing lib. Requires qiskit ecosystem not in Guix."),
    13270: ("android-sdk", "BLOCKED: PROPRIETARY_LICENSE — Google Android SDK. Proprietary EULA."),
    12879: ("element-web-git", "BLOCKED: COMPLEX_BUILD — Matrix Element web client. Hundreds of npm deps, complex web bundling."),
    11809: ("llama.cpp-hip", "BLOCKED: BLOCKED_DEPENDENCY — llama.cpp AMD ROCm backend. Requires ROCm/HIP toolkit."),
    9081: ("cosmic-applets-git", "BLOCKED: COMPLEX_BUILD — COSMIC desktop applets. Same COSMIC toolkit deps."),
    9073: ("cosmic-osd-git", "BLOCKED: COMPLEX_BUILD — COSMIC OSD. Same COSMIC toolkit deps."),
    690: ("libastal-git", "BLOCKED: COMPLEX_BUILD — Astal widget library. Requires Vala, custom build with many sub-libraries."),
    9092: ("kde-material-you-colors", "BLOCKED: MISSING_DEPENDENCIES — KDE Material You colors. Needs python-materialyoucolor (not in Guix)."),
    6643: ("libpamac-full", "BLOCKED: ARCH_SPECIFIC — Manjaro package manager. Requires libalpm/pacman."),
    7034: ("snapx", "BLOCKED: COMPLEX_BUILD — Snap package helper. Requires snapd ecosystem, incompatible with Guix."),
    1755: ("linux-cachyos-lts", "BLOCKED: CUSTOM_KERNEL — CachyOS LTS kernel with custom scheduler patches."),
    6825: ("python-rapidocr", "BLOCKED: MISSING_DEPENDENCIES — RapidOCR. Requires onnxruntime (not in Guix)."),
    670: ("libastal-meta", "BLOCKED: COMPLEX_BUILD — libastal meta-package. Depends on libastal-git (blocked)."),
    1070: ("linux-cachyos", "BLOCKED: CUSTOM_KERNEL — CachyOS kernel with custom scheduler patches."),
    10770: ("linux-cachyos-rc", "BLOCKED: CUSTOM_KERNEL — CachyOS RC kernel with custom scheduler patches."),
    5040: ("python-insightface", "BLOCKED: MISSING_DEPENDENCIES — InsightFace deep learning. Requires onnxruntime, mxnet, CUDA."),
    7025: ("tensorrt", "BLOCKED: PROPRIETARY_LICENSE — NVIDIA TensorRT. Proprietary NVIDIA license."),
    9078: ("cosmic-settings-git", "BLOCKED: COMPLEX_BUILD — COSMIC settings app. Same COSMIC toolkit deps."),
    8040: ("goldendict", "BLOCKED: SUPERSEDED — GoldenDict (abandoned). Already in Guix as goldendict-ng (maintained fork)."),
    5099: ("libpamac-aur", "BLOCKED: ARCH_SPECIFIC — Manjaro package manager with AUR. Requires libalpm/pacman."),
    4528: ("alice-vision", "BLOCKED: COMPLEX_BUILD — 3D reconstruction framework. Extensive deps (OpenMVG, Alembic, CUDA, Ceres)."),
    7020: ("dragengine", "BLOCKED: COMPLEX_BUILD — Drag[en]gine game engine. Custom SCons build, extensive deps."),
    2773: ("input-leap-headless-git", "BLOCKED: PROPRIETARY_LICENSE — Input Leap KVM. Custom license per AUR."),
    1282: ("wechat-bin", "BLOCKED: PROPRIETARY_LICENSE — Tencent WeChat. Proprietary EULA."),
    4216: ("hypryou", "BLOCKED: COMPLEX_BUILD — Hyprland theme tool. Requires Hyprland ecosystem not fully in Guix."),
    6639: ("amdonly-gaming-vulkan-mesa-layers-git", "BLOCKED: PATCHED_FORK — Custom-patched Mesa Vulkan layers for AMD gaming."),
    8323: ("pipelex", "BLOCKED: COMPLEX_BUILD — Pipeline execution framework. Multiple missing Python deps."),
    6538: ("libnm-iwd", "BLOCKED: PATCHED_FORK — NetworkManager rebuilt with iwd backend. Custom-patched build."),
    6640: ("amdonly-gaming-opencl-rusticl-mesa-git", "BLOCKED: PATCHED_FORK — Custom Mesa OpenCL Rusticl for AMD."),
    6638: ("amdonly-gaming-vulkan-radeon-git", "BLOCKED: PATCHED_FORK — Custom Mesa Vulkan RADV for AMD."),
    6641: ("amdonly-gaming-mesa-git", "BLOCKED: PATCHED_FORK — Custom Mesa for AMD gaming."),
    939: ("qt6-base-hifps", "BLOCKED: PATCHED_FORK — Qt6 with high-FPS patches. Complex Qt6 build with custom patches."),
    6567: ("qemu-headless-git", "BLOCKED: COMPLEX_BUILD — QEMU headless from git. Guix already has QEMU; git build adds complexity."),
    58: ("anbox-git", "BLOCKED: NOT_IN_AUR — Anbox discontinued, succeeded by Waydroid."),
    10723: ("ancestris", "BLOCKED: COMPLEX_BUILD — Java genealogy app. NetBeans Platform build, SVN source only."),
    5473: ("arch-remaster", "BLOCKED: ARCH_SPECIFIC — Arch ISO remastering. Requires pacman infrastructure."),
    6124: ("arch-updater", "BLOCKED: ARCH_SPECIFIC — Arch system updater wrapping pacman."),
    6346: ("archarchive", "BLOCKED: ARCH_SPECIFIC — Arch rollback tool using ALA + pacman."),
    12590: ("archlinux-artwork", "BLOCKED: ARCH_SPECIFIC_BRANDING — Arch logos/artwork. Trademark restricted."),
    3880: ("audiobookshelf", "BLOCKED: NOT_IN_AUR — Audiobook server. Not in AUR cache."),
    6048: ("betterbird-fr-bin", "BLOCKED: NOT_IN_AUR — Betterbird French binary. Not in AUR cache."),
    6068: ("bigpemu-bin", "BLOCKED: NOT_IN_AUR — BigPEmu Jaguar emulator. Not in AUR cache, likely proprietary."),
    6514: ("blindpaste", "BLOCKED: SOURCE_UNAVAILABLE — Self-hosted git server returns 403. Cannot inspect or build source."),
    3095: ("boomer-git", "BLOCKED: MISSING_BUILD_TOOLS — Nim screen zoomer. Guix has no Nim compiler. No binary releases."),
    5151: ("bulky", "BLOCKED: NOT_IN_AUR — Linux Mint bulk renamer. Not in AUR cache."),
    4900: ("butter-launcher-bin", "BLOCKED: NO_LICENSE — Electron game launcher. No license file in repo."),
    1568: ("cagent-bin", "BLOCKED: UPSTREAM_CHANGED — docker/cagent redirected to docker/docker-agent (different tool). Original discontinued."),
    6106: ("carbonyl-bin", "BLOCKED: NOT_IN_AUR — Chromium-based terminal browser. Not in AUR cache."),
    6104: ("check-broken-packages-pacman-hook-git", "BLOCKED: ARCH_SPECIFIC — Pacman hook. Not in AUR cache."),
    1089: ("chess-merida", "BLOCKED: PROPRIETARY_LICENSE — Chess Merida font. Custom/proprietary license."),
    348: ("chkrootkit", "BLOCKED: FTP_ONLY_SOURCE — Source only via FTP with unversioned URL. Not reproducible. No HTTPS mirror. 3 approaches tried."),
    1732: ("chkufsd-bin", "BLOCKED: PROPRIETARY_LICENSE — Paragon UFSD check utility. Proprietary."),
}


def main():
    lines = ORG_FILE.read_text().splitlines(keepends=True)
    updated = 0

    # Build lookup: number → (new_status, new_reason)
    changes = {}
    for num, (name, reason) in DONE_PACKAGES.items():
        changes[num] = ("DONE", reason)
    for num, (name, reason) in BLOCKED_PACKAGES.items():
        changes[num] = ("BLOCKED", reason)

    new_lines = []
    i = 0
    while i < len(lines):
        line = lines[i]
        m = re.match(r'^(\*\* )(?:BLOCKED|DONE|FAILED|NEEDS_RECIPE_DESIGN)( \d+\. .+)', line)
        if m:
            prefix = m.group(1)
            rest = m.group(2)
            num_m = re.match(r' (\d+)\.', rest)
            if num_m:
                num = int(num_m.group(1))
                if num in changes:
                    new_status, new_reason = changes[num]
                    # Rewrite header line
                    new_lines.append(f"{prefix}{new_status}{rest}\n")
                    i += 1
                    # Find and update the Status line
                    found_status = False
                    while i < len(lines) and not lines[i].startswith("** "):
                        if lines[i].strip().startswith("- Status:") and not found_status:
                            new_lines.append(f"   - Status: {new_reason}\n")
                            found_status = True
                            i += 1
                        elif lines[i].strip().startswith("- TODO Status:"):
                            new_lines.append(f"   - TODO Status: {new_status}\n")
                            i += 1
                        else:
                            new_lines.append(lines[i])
                            i += 1
                    updated += 1
                    continue

        new_lines.append(line)
        i += 1

    # Write atomically
    with tempfile.NamedTemporaryFile(
        mode="w", dir=ORG_FILE.parent, suffix=".tmp", delete=False
    ) as tmp:
        tmp.writelines(new_lines)
        tmp_path = Path(tmp.name)

    shutil.move(str(tmp_path), str(ORG_FILE))
    print(f"Updated {updated} entries in {ORG_FILE.name}")
    print(f"  DONE: {len(DONE_PACKAGES)}")
    print(f"  BLOCKED (updated reasons): {len(BLOCKED_PACKAGES)}")


if __name__ == "__main__":
    main()
