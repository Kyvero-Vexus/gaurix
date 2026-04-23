#!/usr/bin/env python3
"""recipe-resolver-260423d: Mark 39 remaining NEEDS_RECIPE_DESIGN packages as EXHAUSTED.

All 39 packages evaluated and found infeasible for Guix packaging.
"""

import json
import os
import shutil
import tempfile

PASS_ID = "recipe-resolver-260423d"
ORG_FILE = "todo_general_packages.org"
PACKAGES_SCM = "guix/gaurix/packages.scm"

# All 39 packages with their line numbers, package numbers, and exhaustion details
PACKAGES = [
    # (pkg_name, pkg_num, org_line, reason_code, detail)
    ("flutter-target-android", 5761, 46991,
     "FLUTTER_ECOSYSTEM_COMPLEX",
     "Android compilation target; depends on Flutter SDK chain + pre-built Android engine binaries + Android SDK/NDK; A1: Dart SDK not in Guix (self-hosting bootstrap); A2: engine requires Google depot_tools/gn build system; A3: Android NDK cross-compilation not available"),
    ("flutter-intellij-patch", 5762, 46998,
     "FLUTTER_ECOSYSTEM_COMPLEX",
     "IDE symlinks for IntelliJ Flutter plugin; depends on Flutter SDK chain + proprietary IntelliJ IDE; A1: Flutter SDK not packageable; A2: IntelliJ is proprietary; A3: no standalone utility"),
    ("flutter-artifacts-sky-engine-google-bin", 5766, 47032,
     "FLUTTER_ECOSYSTEM_COMPLEX",
     "Dart platform interface (dart:ui) from Google CI; A1: only useful within Flutter SDK chain; A2: extracted by Flutter CI pipeline, not independently buildable; A3: Dart SDK not in Guix"),
    ("flutter-artifacts-material-fonts-google-bin", 5767, 47039,
     "FLUTTER_ECOSYSTEM_COMPLEX",
     "Material icon fonts from Google Storage; A1: only useful within Flutter SDK chain; A2: standalone font packaging pointless without Flutter; A3: Flutter SDK infeasible"),
    ("flutter-artifacts-gradle-google-bin", 5768, 47046,
     "FLUTTER_ECOSYSTEM_COMPLEX",
     "Gradle wrapper for Flutter Android builds; A1: Gradle pulls from Maven Central at build time, conflicts with Guix offline model; A2: depends on Flutter SDK chain; A3: Android SDK required"),
    ("flutter-artifacts-engine-web-google-bin", 5769, 47053,
     "PROPRIETARY_BUILD_PIPELINE",
     "Pre-compiled JS/WASM engine from Google CI via Emscripten; A1: source build requires depot_tools + Chromium-derived engine tree; A2: Emscripten toolchain not in Guix; A3: no distro builds Flutter engine from source"),
    ("flutter-artifacts-engine-linux-google-bin", 5770, 47060,
     "PROPRIETARY_BUILD_PIPELINE",
     "Pre-compiled libflutter_linux_gtk.so from Google CI; A1: engine is Chromium/Skia-derived C++ needing Google gn build system; A2: depot_tools not in Guix; A3: gen_snapshot (Dart AOT compiler) built from Dart VM source"),
    ("flutter-artifacts-engine-common-google-bin", 5771, 47067,
     "FLUTTER_ECOSYSTEM_COMPLEX",
     "Patched Dart SDK .dill files from Google CI; A1: pre-compiled intermediate language files, not buildable outside CI; A2: depends on Dart SDK not in Guix; A3: tightly coupled to specific engine revision"),
    ("flutter-artifacts-engine-android-google-bin", 5772, 47074,
     "ANDROID_SDK_REQUIRED",
     "Pre-compiled Android libflutter.so for arm/arm64/x86/x64; A1: requires Android NDK cross-compilation; A2: Google CI pipeline produces these; A3: no distro builds Flutter Android engine from source"),
    ("flutter-artifacts-dart-google-bin", 5773, 47081,
     "DART_SDK_BOOTSTRAP_COMPLEX",
     "Complete Dart SDK binary; A1: Dart uses self-hosting bootstrap (Dart builds Dart); A2: requires Google depot_tools + gn/ninja; A3: only Arch packages Dart from source via extra/dart"),
    ("flutter", 5774, 47088,
     "FLUTTER_ECOSYSTEM_COMPLEX",
     "Flutter SDK meta-package; A1: circular bootstrap — needs Dart to build Flutter tools, needs Flutter to get Dart; A2: engine requires Chromium-derived build infrastructure; A3: all 20 Flutter ecosystem packages depend on this chain"),
    ("mcpelauncher-ui", 5777, 47111,
     "QT6_WEBENGINE_COMPLEX",
     "Qt6/WebEngine UI for Minecraft PE launcher; A1: qt6-webengine (embedded Chromium) not available in Guix; A2: depends on mcpelauncher chain that reverse-engineers proprietary game binary loading; A3: Google Play API integration for APK downloads"),
    ("winecx", 5794, 47253,
     "MULTILIB_UNSUPPORTED",
     "CodeWeavers CrossOver Wine fork; A1: requires dual 32/64-bit build with extensive lib32-* deps; A2: Guix has no multilib infrastructure; A3: source from commercial CodeWeavers tarball, mixed licensing"),
    ("nvidia-340xx-settings", 5795, 47260,
     "PROPRIETARY",
     "NVIDIA settings GUI for legacy 340xx drivers; A1: GPL-2.0 source but exclusively for proprietary nvidia-340xx driver (EOL); A2: requires nvidia-340xx-utils proprietary kernel module; A3: no free driver counterpart for this legacy hardware"),
    ("mathematica", 5804, 47336,
     "PROPRIETARY",
     "Wolfram Mathematica commercial software; A1: requires paid license; A2: source requires login/purchase to download; A3: license forbids redistribution; 20+ GB proprietary installer"),
    ("xivlauncher", 5810, 47385,
     "DOTNET_UNSUPPORTED",
     "FFXIV custom launcher (C#/.NET 10+); A1: requires .NET SDK 10+ not in Guix; A2: NuGet dependency resolution incompatible with Guix reproducible builds; A3: self-contained dotnet publish with NuGet packages"),
    ("intel-ipu6-camera-bin", 5822, 47487,
     "PROPRIETARY_BINARY",
     "Intel IPU6 camera firmware/library binaries; A1: GitHub repo contains only pre-compiled proprietary .so/.a blobs, no source; A2: requires intel-ipu6-dkms-git kernel module; A3: closed-source, custom proprietary license"),
    ("vscodium-insiders-git", 5942, 48354,
     "ELECTRON_COMPLEX",
     "VSCode Insiders from source; A1: build requires nvm + specific Node.js + yarn + gulp + Electron; A2: thousands of npm dependencies needing vendoring; A3: Guix cannot build Electron apps from source; existing vscodium in Guix uses pre-built binary"),
    ("vscodium-all-marketplace", 5943, 48361,
     "ARCH_SPECIFIC",
     "Pacman/libalpm hook to patch VSCodium marketplace URL; A1: hook file and Python script tied to Arch package management infrastructure; A2: concept could be done differently in Guix but this package is Arch-only tooling; A3: no upstream repo, AUR-only files"),
    ("steamvr-openhmd-git", 5952, 48436,
     "PROPRIETARY",
     "SteamVR driver plugin for OpenHMD headsets; A1: BSL-1.0 source but exclusively loads into proprietary SteamVR runtime; A2: zero utility without SteamVR (proprietary Valve software); A3: SteamVR cannot be packaged in Guix"),
    ("snd-hda-macbookpro-dkms-git", 5964, 48531,
     "DKMS_KERNEL_MODULE",
     "HDA audio kernel module for MacBook Pro; A1: DKMS kernel module, Guix has no DKMS infrastructure; A2: patches internal kernel HDA codec structures, requires specific kernel headers; A3: would need custom linux-module-build-system integration, niche hardware"),
    ("lib32-freearc-bin", 5982, 48682,
     "MULTILIB_UNSUPPORTED",
     "Pre-compiled 32-bit (i386) FreeArc binary; A1: only i386 binaries available, no x86_64; A2: requires lib32-ncurses5, lib32-gmp, lib32-gtk2 — Guix has no multilib; A3: source (Haskell) unmaintained since 2014"),
    ("immuarch-verity-git", 5989, 48737,
     "ARCH_SPECIFIC",
     "ImmuArch verity checker for immutable Arch Linux; A1: relies on mkinitcpio (Arch-specific initramfs); A2: tied to pacman, btrfs subvolume layout specific to Arch; A3: Guix System has its own immutability model (the store)"),
    ("immuarch-utils-git", 5990, 48744,
     "ARCH_SPECIFIC",
     "ImmuArch utility scripts; A1: provides initcpio install hooks (sd-immuarch) — Arch-specific; A2: systemd services for switch-root in Arch boot layout; A3: completely irrelevant to Guix System declarative configuration"),
    ("rutoken-plugin", 6001, 48836,
     "PROPRIETARY_BINARY",
     "Browser plugin for Rutoken USB crypto tokens; A1: closed-source, extracted from RPM downloaded from Rutoken servers; A2: no source code available; A3: depends on rutoken-connect (also proprietary)"),
    ("snap-pac-grub", 6005, 48866,
     "ARCH_SPECIFIC",
     "Pacman hook for btrfs snapshots + GRUB entries; A1: libalpm hook — tied to Arch pacman infrastructure; A2: depends on snap-pac (another pacman hook); A3: zero applicability outside Arch/pacman ecosystem"),
    ("tosu-overlay", 6006, 48873,
     "QT6_WEBENGINE_COMPLEX",
     "Qt6/WebEngine overlay for osu! game stats; A1: requires qt6-webengine (embedded Chromium) not in Guix; A2: depends on tosu (TypeScript/Node.js memory reader for osu!); A3: osu! itself requires .NET (lazer) or is proprietary (stable)"),
    ("wemeet-wayland-screenshare-git", 6009, 48896,
     "PROPRIETARY_RUNTIME_DEP",
     "LD_PRELOAD hook for Tencent Meeting Wayland screenshare; A1: open-source MIT C++ library but exclusively for proprietary wemeet-bin; A2: zero utility without proprietary Tencent Meeting client; A3: workaround for proprietary app's shortcomings"),
    ("pacserve", 8090, 64936,
     "ARCH_SPECIFIC",
     "Package server for sharing pacman packages on LAN; A1: Python tool that wraps pacman/libalpm for package serving; A2: only serves/consumes Arch pacman packages; A3: depends on pacman infrastructure, useless on Guix"),
    ("flutter-engine-common-google-bin", 8148, 65361,
     "FLUTTER_ECOSYSTEM_COMPLEX",
     "Duplicate of flutter-artifacts-engine-common-google-bin (alternative provider from flutter-artifacts-google-bin pkgbase); A1: same patched Dart .dill files; A2: same Google CI dependency; A3: Flutter SDK chain infeasible"),
    ("flutter-engine-linux-google-bin", 8149, 65367,
     "PROPRIETARY_BUILD_PIPELINE",
     "Duplicate of flutter-artifacts-engine-linux-google-bin (alternative provider); A1: same pre-compiled engine .so; A2: same Google CI build requirement; A3: no distro builds Flutter engine from source"),
    ("flutter-engine-web-google-bin", 8150, 65373,
     "PROPRIETARY_BUILD_PIPELINE",
     "Duplicate of flutter-artifacts-engine-web-google-bin (alternative provider); A1: same JS/WASM engine artifacts; A2: same Emscripten CI requirement; A3: depot_tools not in Guix"),
    ("flutter-engine-android-google-bin", 8151, 65379,
     "ANDROID_SDK_REQUIRED",
     "Duplicate of flutter-artifacts-engine-android-google-bin (alternative provider); A1: same Android libflutter.so binaries; A2: same NDK cross-compilation requirement; A3: Android SDK not in Guix"),
    ("flutter-sky-engine-google-bin", 8152, 65385,
     "FLUTTER_ECOSYSTEM_COMPLEX",
     "Duplicate of flutter-artifacts-sky-engine-google-bin (alternative provider); A1: same Dart platform interface; A2: same Flutter SDK chain dependency; A3: Dart not in Guix"),
    ("flutter-material-fonts-google-bin", 8153, 65391,
     "FLUTTER_ECOSYSTEM_COMPLEX",
     "Duplicate of flutter-artifacts-material-fonts-google-bin (alternative provider); A1: material icon fonts only useful in Flutter; A2: standalone packaging pointless; A3: Flutter SDK infeasible"),
    ("flutter-gradle-google-bin", 8154, 65397,
     "FLUTTER_ECOSYSTEM_COMPLEX",
     "Duplicate of flutter-artifacts-gradle-google-bin (alternative provider); A1: Gradle wrapper for Flutter; A2: Maven Central downloads conflict with Guix; A3: Flutter SDK chain infeasible"),
    ("flutter-dart-google-bin", 8155, 65403,
     "DART_SDK_BOOTSTRAP_COMPLEX",
     "Duplicate of flutter-artifacts-dart-google-bin (alternative provider); A1: same Dart SDK binary; A2: same self-hosting bootstrap problem; A3: depot_tools/gn not in Guix"),
    ("jetbrains-toolbox", 11362, 87521,
     "PROPRIETARY_SELF_UPDATING",
     "JetBrains Toolbox proprietary IDE manager; A1: auto-updater writes to install dir conflicting with Guix store immutability; A2: requires JBR bundled JVM; A3: no offline mode; entirely proprietary binary"),
    ("arduino-ide-bin", 11383, 87689,
     "ELECTRON_COMPLEX",
     "Arduino IDE v2 Electron/Theia app; A1: 200+ bundled node_modules with native addons; A2: building from source requires massive Node.js/TypeScript/yarn pipeline; A3: serial port access needs udev rules + wrapping for sandbox/display/dbus"),
]

def update_org_file():
    """Add NEEDS_RECIPE_DESIGN_EXHAUSTED status lines to the org file."""
    with open(ORG_FILE, "r") as f:
        lines = f.readlines()

    # Build a map of line numbers to new status lines
    # We insert the new status line right after the existing status line
    updates = {}
    for pkg_name, pkg_num, org_line, reason_code, detail in PACKAGES:
        # org_line is 1-indexed, the status line number
        # We want to insert AFTER this line
        new_status = (
            f"   - Status: BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED: "
            f"{reason_code}: {detail} ({PASS_ID})\n"
        )
        updates[org_line] = new_status  # org_line is the status line (1-indexed)

    # Build new file content by inserting after each target line
    new_lines = []
    for i, line in enumerate(lines):
        line_num = i + 1  # 1-indexed
        new_lines.append(line)
        if line_num in updates:
            new_lines.append(updates[line_num])

    # Atomic write
    fd, tmp_path = tempfile.mkstemp(dir=".", suffix=".org.tmp")
    try:
        with os.fdopen(fd, "w") as f:
            f.writelines(new_lines)
        shutil.move(tmp_path, ORG_FILE)
    except:
        os.unlink(tmp_path)
        raise

    print(f"Updated {ORG_FILE}: inserted {len(updates)} EXHAUSTED status lines")


def update_packages_scm():
    """Add a comment about this pass to packages.scm."""
    with open(PACKAGES_SCM, "r") as f:
        content = f.read()

    # Find the last recipe-resolver comment and insert after it
    # Pattern: lines starting with "            ;; recipe-resolver-"
    lines = content.split("\n")
    last_comment_idx = None
    for i, line in enumerate(lines):
        if line.strip().startswith(";; recipe-resolver-") or line.strip().startswith(";; deptree-resolver-"):
            last_comment_idx = i

    if last_comment_idx is not None:
        new_comment = "            ;; recipe-resolver-260423d (39 NRD evaluated: 0 recipes, 39 EXHAUSTED — Flutter ecosystem, proprietary, Arch-specific, unsupported runtimes)"
        lines.insert(last_comment_idx + 1, new_comment)

    new_content = "\n".join(lines)

    fd, tmp_path = tempfile.mkstemp(dir=".", suffix=".scm.tmp")
    try:
        with os.fdopen(fd, "w") as f:
            f.write(new_content)
        shutil.move(tmp_path, PACKAGES_SCM)
    except:
        os.unlink(tmp_path)
        raise

    print(f"Updated {PACKAGES_SCM}: added pass comment")


def write_summary_report():
    """Write a JSON summary report."""
    summary = {
        "pass_id": PASS_ID,
        "total_evaluated": len(PACKAGES),
        "recipes_created": 0,
        "exhausted": len(PACKAGES),
        "exhausted_by_reason": {},
        "packages": []
    }

    for pkg_name, pkg_num, org_line, reason_code, detail in PACKAGES:
        summary["exhausted_by_reason"][reason_code] = \
            summary["exhausted_by_reason"].get(reason_code, 0) + 1
        summary["packages"].append({
            "name": pkg_name,
            "pkg_num": pkg_num,
            "org_line": org_line,
            "status": "EXHAUSTED",
            "reason": reason_code,
            "detail": detail
        })

    report_path = f"reports/{PASS_ID}-summary.json"
    with open(report_path, "w") as f:
        json.dump(summary, f, indent=2)
    print(f"Wrote {report_path}")


if __name__ == "__main__":
    update_org_file()
    update_packages_scm()
    write_summary_report()
    print(f"\n{PASS_ID} complete: 39 packages evaluated, 0 recipes, 39 EXHAUSTED")
