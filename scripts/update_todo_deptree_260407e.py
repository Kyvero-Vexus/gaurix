#!/usr/bin/env python3
"""Deterministic update of todo_general_packages.org for deptree-resolver-260407e pass."""

import json
import re
import sys
import tempfile
import shutil

TODO_FILE = "todo_general_packages.org"
SELECTED_JSON = "reports/deptree-resolver-260407e-selection.json"

# Packages that got recipes (DONE)
RESOLVED_PACKAGES = {
    "qt5-webkit", "cosmic-icons-git", "flite1", "libajantv2",
    "owlry-plugin-calculator", "owlry-plugin-system", "owlry-plugin-bookmarks",
    "owlry-plugin-filesearch", "owlry-plugin-pomodoro", "owlry-plugin-scripts",
    "owlry-plugin-websearch", "owlry-plugin-media", "owlry-plugin-ssh",
    "owlry-plugin-systemd", "owlry-plugin-weather", "owlry-plugin-clipboard",
    "owlry-plugin-emoji", "dotnet-runtime-preview-bin", "python-materialyoucolor",
    "aspnet-targeting-pack-preview-bin", "ttf-gabarito-git", "c-client",
    "stl-thumb", "themix-import-images-git", "eww", "cosmic-randr-git",
    "cosmic-idle-git", "cosmic-screenshot-git", "cosmic-app-library-git",
    "cosmic-panel-git", "cosmic-workspaces-git", "cosmic-launcher-git",
    "cosmic-notifications-git", "cosmic-comp-git", "cosmic-settings-daemon-git",
    "qtforkawesome-qt6", "clight", "upscayl-ncnn", "cairo-dock-core-wayland-git",
    "stardust-xr-non-spatial-input", "stardust-xr-server", "xrizer-git",
    "maliit-framework", "libadwaita-yaru-git", "aylurs-gtk-shell-git",
    "themix-plugin-base16-git", "themix-theme-oomox-git", "obsidianctl",
    "mupen64plus-git", "protonmail-bridge-free-core", "backintime-cli-git",
    "portable", "angle", "qt5-quick3d", "nvidia-390xx-utils", "nvidia-470xx-utils",
    "nvidia-580xx-utils", "opera-gx-stable", "matlab-mpm", "vscodium",
    "arduino-builder",
}

# Packages that stay BLOCKED with reasons
BLOCKED_REASONS = {
    "yay": "ARCH_SPECIFIC_TOOL: Pacman wrapper / AUR helper; not applicable to Guix",
    "paru": "ARCH_SPECIFIC_TOOL: AUR helper requiring pacman/libalpm",
    "paru-git": "ARCH_SPECIFIC_TOOL: git version of paru AUR helper",
    "aurutils": "ARCH_SPECIFIC_TOOL: AUR helper tools requiring pacutils/pacman",
    "package-query": "ARCH_SPECIFIC_TOOL: ALPM/AUR query tool requiring libalpm",
    "yaycache": "ARCH_SPECIFIC_TOOL: yay cache cleaner requiring pacman-contrib",
    "archlinux-java-run": "ARCH_SPECIFIC_TOOL: Arch-specific Java launcher with hardcoded paths",
    "libpamac-full": "ARCH_SPECIFIC_TOOL: Manjaro package manager requiring libalpm",
    "libpamac-aur": "ARCH_SPECIFIC_TOOL: Manjaro/AUR package manager library",
    "linux-cachyos": "KERNEL_OUT_OF_SCOPE: CachyOS kernel; Guix manages kernels natively",
    "linux-cachyos-lts": "KERNEL_OUT_OF_SCOPE: CachyOS LTS kernel variant",
    "tensorrt": "PROPRIETARY_CUDA: requires CUDA/cuDNN proprietary stack",
    "opencl-amd": "PROPRIETARY_BINARY: repackaged AMD ROCm proprietary binaries",
    "ggml-sycl-f16-git": "PROPRIETARY_DEPENDENCY: requires intel-oneapi-basekit (proprietary)",
    "llama.cpp-hip": "PROPRIETARY_ROCM: requires AMD ROCm/HIP proprietary stack",
    "ps3toolchain": "CROSS_COMPILATION_META: PS3 homebrew toolchain meta-package",
    "plasma-workspace-povd": "BUILD_COMPLEXITY: patched KDE Plasma with 105+ deps",
    "bms-shell": "MISSING_GUIX_DEPS: requires quickshell, dgop (unpackaged)",
    "intel-npu-driver": "PROPRIETARY_DEPENDENCY: requires level-zero (Intel proprietary)",
    "intel-graphics-compiler-legacy": "BUILD_COMPLEXITY: massive LLVM-fork build",
    "android-sdk": "PROPRIETARY_BINARY: Google proprietary SDK",
    "lib32-libvmaf": "LIB32_NOT_SUPPORTED: Guix has no lib32/multilib support",
    "lib32-bluez-libs": "LIB32_NOT_SUPPORTED: Guix has no lib32/multilib support",
    "lib32-nvidia-utils-beta": "LIB32_PROPRIETARY: lib32 + proprietary NVIDIA",
    "mips64-linux-gnu-gcc-bootstrap": "CROSS_COMPILATION_TARGET: Guix uses (cross-base) for cross",
    "snapx": "BUILD_COMPLEXITY: requires .NET SDK build infrastructure",
    "alice-vision": "BUILD_COMPLEXITY: 16+ unpackaged large dependencies",
    "sdrpp-headers-git": "MISSING_GUIX_DEPS: depends on sdrpp-git (unpackaged)",
    "samsung-unified-driver-printer": "PROPRIETARY_BINARY: Samsung proprietary driver",
    "samsung-unified-driver-scanner": "PROPRIETARY_BINARY: Samsung proprietary scanner driver",
    "iscan": "MISSING_GUIX_DEPS: requires deprecated libstdc++5",
    "python-frida": "PROPRIETARY_COMPONENT: requires proprietary frida-core binary",
    "python-twisterl": "MISSING_GUIX_DEPS: requires PyTorch (not in Guix)",
    "python-insightface": "MISSING_GUIX_DEPS: requires albumentations, onnx (complex ML stack)",
    "python-rapidocr": "MISSING_GUIX_DEPS: requires python-opencv (not in Guix)",
    "element-web-git": "BUILD_COMPLEXITY: requires npm/yarn/Electron build system",
    "gst-thumbnailers": "NOT_IN_AUR_CACHE: package removed/renamed from AUR",
    "libastal-meta": "MISSING_GUIX_DEPS: depends on 17 unpackaged libastal-* services",
    "libastal-git": "MISSING_GUIX_DEPS: depends on libastal-io (not in Guix)",
}


def main():
    with open(SELECTED_JSON) as f:
        selected = json.load(f)

    # Build lookup by package name -> number
    selected_by_name = {s["name"]: s["number"] for s in selected}

    with open(TODO_FILE, "r") as f:
        lines = f.readlines()

    output = []
    i = 0
    updated_count = 0
    done_count = 0
    blocked_count = 0

    while i < len(lines):
        line = lines[i]
        m = re.match(r'^(\*\* )(BLOCKED)( \d+\. )(.+)\n?$', line)

        if m:
            prefix = m.group(1)
            _status = m.group(2)
            num_part = m.group(3)
            pkg_name = m.group(4).strip()

            if pkg_name in RESOLVED_PACKAGES:
                # Change to DONE
                output.append(f"{prefix}DONE{num_part}{pkg_name}\n")
                # Read existing lines until next ** heading
                i += 1
                while i < len(lines) and not lines[i].startswith("** "):
                    output.append(lines[i])
                    i += 1
                # Add new status line before the next heading
                output.insert(len(output), f"   - Status: DONE: Recipe added in deptree-resolver-260407e.scm; dep-tree priority pass 2026-04-07.\n")
                output.insert(len(output), f"   - TODO Status: DONE\n")
                updated_count += 1
                done_count += 1
                continue

            elif pkg_name in BLOCKED_REASONS:
                # Keep as BLOCKED but add reason
                output.append(line)
                i += 1
                while i < len(lines) and not lines[i].startswith("** "):
                    output.append(lines[i])
                    i += 1
                reason = BLOCKED_REASONS[pkg_name]
                output.insert(len(output), f"   - Status: BLOCKED: {reason} (deptree-resolver-260407e, 2026-04-07)\n")
                output.insert(len(output), f"   - TODO Status: BLOCKED\n")
                updated_count += 1
                blocked_count += 1
                continue

        output.append(line)
        i += 1

    # Write atomically
    with tempfile.NamedTemporaryFile(mode='w', dir='.', suffix='.tmp', delete=False) as tmp:
        tmp.writelines(output)
        tmp_name = tmp.name
    shutil.move(tmp_name, TODO_FILE)

    print(f"Updated {TODO_FILE}: {updated_count} packages processed")
    print(f"  DONE: {done_count}")
    print(f"  BLOCKED (with reasons): {blocked_count}")


if __name__ == "__main__":
    main()
