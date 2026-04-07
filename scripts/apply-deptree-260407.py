#!/usr/bin/env python3
"""
Apply deptree-260407 resolution results:
1. Update general-compat.scm with new compat aliases + imports + exports
2. Update packages.scm with new module import
3. Update todo_general_packages.org with status changes
"""

import re
import sys
import shutil
import tempfile
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
ORG_FILE = ROOT / "todo_general_packages.org"
COMPAT_FILE = ROOT / "guix" / "gaurix" / "packages" / "general-compat.scm"
PACKAGES_FILE = ROOT / "guix" / "gaurix" / "packages.scm"

RUN_TAG = "deptree-260407"

# ---- Resolution plan ----

# Packages getting new recipes (in deptree-260407.scm)
RECIPE_PACKAGES = [
    "ttf-vt323", "ttf-xenia", "deno-stable-bin", "rosec-bin",
    "auto-auto-complete", "fortune-mod-off", "httpdirfs",
]

# Packages getting compat aliases (added to general-compat.scm)
COMPAT_ALIASES = {
    "otf-unifont": ("font-gnu-unifont", "gnu packages fonts"),
    "noto-fonts-lite": ("font-google-noto", "gnu packages fonts"),
    "firefox-esr-bin": ("firefox-esr", "nongnu packages mozilla"),
    "7zip-zstd-bin": ("7zip", "gnu packages compression"),
    "noto-fonts-emoji-blob": ("font-google-noto-emoji", "gnu packages fonts"),
    "libsodium-1.0.18": ("libsodium", "gnu packages crypto"),
}

# Packages already resolved (compat alias exists in general-compat.scm already)
PRIOR_PACKAGES = ["openssl-1.1"]

# All 4 FAILED entries that were in the selected 100 but aren't BLOCKED
FAILED_ENTRIES = ["jdk21-temurin", "jre-jetbrains", "libinput-no-gestures", "texlive-installer"]

# Re-blocked packages with reason codes
REBLOCKED = {
    "jdk-temurin": "BINARY_VENDOR_JDK: Adoptium binary JDK; Guix has openjdk@25 from source",
    "jre8-temurin": "BINARY_VENDOR_JDK: Adoptium binary JRE 8; Guix has openjdk@9+",
    "jre11-temurin": "BINARY_VENDOR_JDK: Adoptium binary JRE 11; Guix has openjdk@11",
    "jre17-temurin": "BINARY_VENDOR_JDK: Adoptium binary JRE 17; Guix has openjdk@17",
    "jre21-temurin": "BINARY_VENDOR_JDK: Adoptium binary JRE 21; Guix has openjdk@21",
    "jre25-temurin": "BINARY_VENDOR_JDK: Adoptium binary JRE 25; Guix has openjdk@25",
    "liberica-jdk-full-bin": "BINARY_VENDOR_JDK: BellSoft Liberica JDK (custom license)",
    "zulu-21-bin": "BINARY_VENDOR_JDK: Azul Zulu JDK 21 (custom license)",
    "amazon-corretto-17": "BINARY_VENDOR_JDK: Amazon Corretto 17 (binary dist); Guix has openjdk@17",
    "amazon-corretto-8": "BINARY_VENDOR_JDK: Amazon Corretto 8 (binary dist for Java 8)",
    "jdk25-graalvm-ce-bin": "BINARY_VENDOR_JDK: GraalVM CE 25 binary (custom license)",
    "jdk8-graalvm-ee-bin": "PROPRIETARY_BINARY: GraalVM EE 8 (OTN license)",
    "jdk17-zulu-prime-bin": "PROPRIETARY_BINARY: Azul Zulu Prime 17 (proprietary stream license)",
    "jdk17-graalvm-ee-bin": "PROPRIETARY_BINARY: GraalVM EE 17 (OTN license)",
    "jdk21-graalvm-ee-bin": "PROPRIETARY_BINARY: GraalVM EE 21 (GFTC license)",
    "jdk11-graalvm-bin": "BINARY_VENDOR_JDK: GraalVM CE 11 (custom, EOL since 2023)",
    "jdk19-graalvm-bin": "BINARY_VENDOR_JDK: GraalVM CE 19 (custom, EOL)",
    "jdk21-graalvm-bin": "BINARY_VENDOR_JDK: GraalVM CE 21 (custom license)",
    "jdk8-graalvm-bin": "BINARY_VENDOR_JDK: GraalVM CE 8 (custom, EOL)",
    "zulu-jre11-fx": "BINARY_VENDOR_JDK: Zulu JRE 11 with JavaFX (custom license)",
    "zulu-jre17-fx": "BINARY_VENDOR_JDK: Zulu JRE 17 with JavaFX (custom license)",
    "zulu-jre21-fx": "BINARY_VENDOR_JDK: Zulu JRE 21 with JavaFX (custom license)",
    "zulu-jre25-fx": "BINARY_VENDOR_JDK: Zulu JRE 25 with JavaFX (custom license)",
    "zulu-jre8-fx": "BINARY_VENDOR_JDK: Zulu JRE 8 with JavaFX (custom license)",
    "npm-corepack": "META_PACKAGE: corepack shim for npm; Guix node includes corepack",
    "pnpm-corepack": "META_PACKAGE: corepack shim for pnpm; Guix node includes corepack",
    "yarn-corepack": "META_PACKAGE: corepack shim for yarn; Guix node includes corepack",
    "freetype2-qdoled-aw3225qf": "PATCHED_VARIANT: QD-OLED AW3225QF subpixel patches for freetype",
    "freetype2-qdoled-gen3": "PATCHED_VARIANT: QD-OLED Gen3 subpixel patches for freetype",
    "freetype2-macos": "PATCHED_VARIANT: macOS-style rendering patches for freetype",
    "nvidia-535xx-utils": "PROPRIETARY_DRIVER: NVIDIA 535 branch proprietary binary blob",
    "nvidia-550xx-utils": "PROPRIETARY_DRIVER: NVIDIA 550 branch proprietary binary blob",
    "nvidia-390xx-utils": "PROPRIETARY_DRIVER: NVIDIA legacy 390 proprietary binary blob",
    "nvidia-470xx-utils": "PROPRIETARY_DRIVER: NVIDIA legacy 470 proprietary binary blob",
    "lib32-nvidia-utils-beta": "PROPRIETARY_DRIVER: NVIDIA 32-bit beta proprietary binary",
    "lib32-nvidia-vulkan-utils": "PROPRIETARY_DRIVER: NVIDIA 32-bit Vulkan dev proprietary binary",
    "ttf-ms-win11": "PROPRIETARY_NONFREE: Microsoft Windows 11 fonts (cannot redistribute)",
    "ttf-ms-win10": "PROPRIETARY_NONFREE: Microsoft Windows 10 fonts (cannot redistribute)",
    "ttf-ms-win10-japanese": "PROPRIETARY_NONFREE: Microsoft Win10 Japanese fonts",
    "ttf-ms-win10-korean": "PROPRIETARY_NONFREE: Microsoft Win10 Korean fonts",
    "ttf-ms-win10-other": "PROPRIETARY_NONFREE: Microsoft Win10 other fonts",
    "ttf-ms-win10-sea": "PROPRIETARY_NONFREE: Microsoft Win10 Southeast Asian fonts",
    "ttf-ms-win10-thai": "PROPRIETARY_NONFREE: Microsoft Win10 Thai fonts",
    "ttf-ms-win10-zh_cn": "PROPRIETARY_NONFREE: Microsoft Win10 Simplified Chinese fonts",
    "ttf-ms-win10-zh_tw": "PROPRIETARY_NONFREE: Microsoft Win10 Traditional Chinese fonts",
    "ttf-ms-win11-japanese": "PROPRIETARY_NONFREE: Microsoft Win11 Japanese fonts",
    "ttf-ms-win11-korean": "PROPRIETARY_NONFREE: Microsoft Win11 Korean fonts",
    "ttf-ms-win11-other": "PROPRIETARY_NONFREE: Microsoft Win11 other fonts",
    "ttf-ms-win11-sea": "PROPRIETARY_NONFREE: Microsoft Win11 Southeast Asian fonts",
    "ttf-ms-win11-thai": "PROPRIETARY_NONFREE: Microsoft Win11 Thai fonts",
    "ttf-ms-win11-zh_cn": "PROPRIETARY_NONFREE: Microsoft Win11 Simplified Chinese fonts",
    "ttf-ms-win11-zh_tw": "PROPRIETARY_NONFREE: Microsoft Win11 Traditional Chinese fonts",
    "ttf-apple-emoji": "PROPRIETARY_NONFREE: Apple Color Emoji (extracted from macOS, cannot redistribute)",
    "ttf-joypixels": "PROPRIETARY_NONFREE: JoyPixels emoji (custom commercial license)",
    "ttf-paratype": "SOURCE_UNAVAILABLE: OFL font but no stable versioned download URL",
    "ttf-pt-astra-sans": "SOURCE_UNAVAILABLE: PT Astra Sans OFL font, no stable archive URL",
    "ttf-pt-astra-serif": "SOURCE_UNAVAILABLE: PT Astra Serif OFL font, no stable archive URL",
    "ttf-pt-mono": "SOURCE_UNAVAILABLE: PT Mono OFL font, no stable archive URL",
    "ttf-pt-root_ui": "SOURCE_UNAVAILABLE: PT Root UI OFL font, no stable archive URL",
    "ttf-pt-sans": "SOURCE_UNAVAILABLE: PT Sans OFL font, no stable archive URL",
    "ttf-pt-serif": "SOURCE_UNAVAILABLE: PT Serif OFL font, no stable archive URL",
    "ttf-shanggu": "SOURCE_FORMAT: CJK OFL font distributed as .7z archives only",
    "libinput-epp": "PATCHED_VARIANT: libinput with Windows EPP acceleration curve patches",
    "rocm-gfx110x-bin": "PROPRIETARY_BINARY: AMD ROCm SDK for RDNA3 (custom AMD license)",
    "rocm-gfx120x-bin": "PROPRIETARY_BINARY: AMD ROCm SDK for RDNA4 (custom AMD license)",
    "rocm-nightly-gfx110x-bin": "PROPRIETARY_BINARY: AMD ROCm nightly for RDNA3 (custom license)",
    "rocm-nightly-gfx1151-bin": "PROPRIETARY_BINARY: AMD ROCm nightly gfx1151 (custom license)",
    "opencl-amd": "PROPRIETARY_BINARY: AMD OpenCL runtime repackaged from Ubuntu (custom license)",
    "fftw-amd": "SPECIALIZED_VARIANT: AMD-optimized FFTW; Guix has generic fftw@3.3.10",
    "postgresql17-docs": "VERSION_MISMATCH: PostgreSQL 17 docs; Guix has postgresql@16 only",
    "aspnet-runtime-bin": "BINARY_RUNTIME_CHAIN: depends on dotnet-runtime-bin (complex binary chain)",
    "aspnet-runtime-7.0-bin": "EOL_BINARY: ASP.NET 7.0 runtime (EOL), depends on dotnet-runtime-7.0-bin",
    "qt5-doc": "COMPLEX_BUILD: Qt5 docs require full qdoc toolchain (~2GB output)",
    "jaq-git": "CARGO_VENDORING: Rust jq clone; needs full cargo dependency vendoring",
    "7zip-natspec": "MISSING_DEP: 7zip with libnatspec (not in Guix)",
    "domake": "MISSING_DEP: Docker make, depends on dosh (not in Guix)",
    "gopass-secret-service": "MISSING_DEP: D-Bus provider using gopass (not in Guix)",
    "system76-power": "CARGO_VENDORING: Rust project with 50+ crate deps needing vendoring",
    "archlinux-java-run": "ARCH_SPECIFIC: Arch Linux Java launcher using java-runtime-common",
    "electron22-bin": "EOL_BINARY: Electron 22 (EOL since 2023-10); Guix has electron@36",
    "firefox-beta-bin": "BETA_BINARY: Firefox beta binary; rapidly changing, impractical to track",
    "firefox-beta-bin-all-localizations": "BETA_BINARY: Firefox beta all locales; rapidly changing",
}

# Full list of selected 100
SELECTED_100 = [
    "npm-corepack", "jdk21-temurin", "jdk-temurin", "freetype2-qdoled-aw3225qf",
    "freetype2-qdoled-gen3", "freetype2-macos", "jre-jetbrains",
    "liberica-jdk-full-bin", "zulu-21-bin", "amazon-corretto-17",
    "amazon-corretto-8", "jdk25-graalvm-ce-bin", "jdk8-graalvm-ee-bin",
    "jdk17-zulu-prime-bin", "jdk17-graalvm-ee-bin", "jdk21-graalvm-ee-bin",
    "jdk11-graalvm-bin", "jdk19-graalvm-bin", "jdk21-graalvm-bin",
    "jdk8-graalvm-bin", "zulu-jre11-fx", "zulu-jre17-fx", "zulu-jre21-fx",
    "zulu-jre25-fx", "zulu-jre8-fx", "jre25-temurin", "jre11-temurin",
    "jre17-temurin", "jre21-temurin", "jre8-temurin", "jaq-git",
    "7zip-zstd-bin", "7zip-natspec", "pnpm-corepack", "yarn-corepack",
    "noto-fonts-lite", "nvidia-535xx-utils", "nvidia-550xx-utils",
    "ttf-ms-win11", "nvidia-390xx-utils", "nvidia-470xx-utils",
    "ttf-ms-win10", "ttf-ms-win10-japanese", "ttf-ms-win10-korean",
    "ttf-ms-win10-other", "ttf-ms-win10-sea", "ttf-ms-win10-thai",
    "ttf-ms-win10-zh_cn", "ttf-ms-win10-zh_tw", "ttf-ms-win11-japanese",
    "ttf-ms-win11-korean", "ttf-ms-win11-other", "ttf-ms-win11-sea",
    "ttf-ms-win11-thai", "ttf-ms-win11-zh_cn", "ttf-ms-win11-zh_tw",
    "ttf-paratype", "ttf-pt-astra-sans", "ttf-pt-astra-serif",
    "ttf-pt-mono", "ttf-pt-root_ui", "ttf-pt-sans", "ttf-pt-serif",
    "ttf-shanggu", "ttf-xenia", "ttf-vt323", "libinput-epp",
    "libinput-no-gestures", "httpdirfs", "openssl-1.1",
    "rocm-gfx110x-bin", "rocm-gfx120x-bin", "fftw-amd",
    "rocm-nightly-gfx110x-bin", "rocm-nightly-gfx1151-bin",
    "postgresql17-docs", "aspnet-runtime-bin", "texlive-installer",
    "fortune-mod-off", "opencl-amd", "deno-stable-bin",
    "noto-fonts-emoji-blob", "gopass-secret-service", "rosec-bin",
    "libsodium-1.0.18", "qt5-doc", "aspnet-runtime-7.0-bin",
    "domake", "system76-power", "auto-auto-complete", "archlinux-java-run",
    "firefox-esr-bin", "firefox-beta-bin", "lib32-nvidia-utils-beta",
    "firefox-beta-bin-all-localizations", "electron22-bin",
    "lib32-nvidia-vulkan-utils", "otf-unifont", "ttf-apple-emoji",
    "ttf-joypixels",
]


def update_org_file():
    """Update todo_general_packages.org with resolution results."""
    with open(ORG_FILE, "r") as f:
        lines = f.readlines()

    pattern = re.compile(r"^(\*\* )BLOCKED( \d+\. )(.+)$")
    status_pattern = re.compile(r"^   - Status: (.*)$")

    i = 0
    changes = 0
    while i < len(lines):
        m = pattern.match(lines[i])
        if m:
            prefix = m.group(1)
            num_dot = m.group(2)
            pkg_name = m.group(3).strip()

            if pkg_name in RECIPE_PACKAGES:
                # Mark as DONE
                lines[i] = f"{prefix}DONE{num_dot}{pkg_name}\n"
                # Update status line
                for j in range(i + 1, min(i + 6, len(lines))):
                    sm = status_pattern.match(lines[j])
                    if sm:
                        lines[j] = f"   - Status: DONE: Recipe in {RUN_TAG}.scm ({RUN_TAG} dep-tree pass)\n"
                        break
                changes += 1

            elif pkg_name in COMPAT_ALIASES:
                target, _mod = COMPAT_ALIASES[pkg_name]
                lines[i] = f"{prefix}DONE{num_dot}{pkg_name}\n"
                for j in range(i + 1, min(i + 6, len(lines))):
                    sm = status_pattern.match(lines[j])
                    if sm:
                        lines[j] = f"   - Status: DONE: Compat alias -> {target} in general-compat.scm ({RUN_TAG} dep-tree pass)\n"
                        break
                changes += 1

            elif pkg_name in PRIOR_PACKAGES:
                lines[i] = f"{prefix}DONE{num_dot}{pkg_name}\n"
                for j in range(i + 1, min(i + 6, len(lines))):
                    sm = status_pattern.match(lines[j])
                    if sm:
                        lines[j] = f"   - Status: DONE: Prior compat alias in general-compat.scm ({RUN_TAG} dep-tree pass)\n"
                        break
                changes += 1

            elif pkg_name in REBLOCKED:
                reason = REBLOCKED[pkg_name]
                for j in range(i + 1, min(i + 6, len(lines))):
                    sm = status_pattern.match(lines[j])
                    if sm:
                        lines[j] = f"   - Status: BLOCKED: {reason} ({RUN_TAG} dep-tree pass)\n"
                        break
                changes += 1

        i += 1

    # Write atomically
    tmp = tempfile.NamedTemporaryFile(mode="w", dir=ORG_FILE.parent,
                                       suffix=".tmp", delete=False)
    tmp.writelines(lines)
    tmp.close()
    shutil.move(tmp.name, ORG_FILE)
    print(f"Updated {changes} entries in {ORG_FILE.name}")
    return changes


def update_general_compat():
    """Add compat aliases to general-compat.scm deterministically."""
    with open(COMPAT_FILE, "r") as f:
        content = f.read()

    lines = content.split("\n")

    # 1. Add missing #:use-module imports
    modules_needed = set()
    for pkg_name, (target, module) in COMPAT_ALIASES.items():
        mod_line = f"  #:use-module ({module})"
        if mod_line not in content and f"({module})" not in content:
            modules_needed.add(module)

    if modules_needed:
        # Find the last #:use-module line before #:export
        last_use_idx = 0
        for i, line in enumerate(lines):
            if "#:use-module" in line:
                last_use_idx = i
            if "#:export" in line:
                break

        for mod in sorted(modules_needed):
            lines.insert(last_use_idx + 1, f"  #:use-module ({mod})")
            last_use_idx += 1

    # 2. Add exports
    # Find the closing paren of #:export
    export_end_idx = None
    for i, line in enumerate(lines):
        if line.strip() == "))":
            # Check if previous lines are export entries
            if i > 0 and lines[i-1].strip().startswith((")", ";;")):
                export_end_idx = i
                break
            elif any("#:export" in lines[j] for j in range(max(0, i-50), i)):
                export_end_idx = i
                break

    # More robust: find the line with just "))" after the export block
    for i, line in enumerate(lines):
        stripped = line.strip()
        if stripped == "))" and i > 10:
            # Check that we're in the export section
            is_export = False
            for j in range(max(0, i-100), i):
                if "#:export" in lines[j]:
                    is_export = True
                    break
            if is_export:
                export_end_idx = i
                break

    if export_end_idx:
        # Add new export entries before the closing ))
        new_exports = []
        new_exports.append(f"            ;; {RUN_TAG} compat aliases")
        for pkg_name in sorted(COMPAT_ALIASES.keys()):
            # Check not already exported
            if pkg_name not in content:
                new_exports.append(f"            {pkg_name}")

        if new_exports:
            for idx, line in enumerate(new_exports):
                lines.insert(export_end_idx + idx, line)

    # 3. Add compat alias definitions at end of file
    new_defs = [f"\n;; {RUN_TAG} compat aliases (dep-tree BLOCKED pass)\n"]
    for pkg_name in sorted(COMPAT_ALIASES.keys()):
        target, module = COMPAT_ALIASES[pkg_name]
        if f"(define-public {pkg_name}" not in content:
            new_defs.append(f"(define-public {pkg_name}")
            new_defs.append(f"  (package")
            new_defs.append(f"    (inherit {target})")
            new_defs.append(f'    (name "{pkg_name}")))')
            new_defs.append("")

    if len(new_defs) > 1:
        lines.extend(new_defs)

    # Write atomically
    new_content = "\n".join(lines)
    tmp = tempfile.NamedTemporaryFile(mode="w", dir=COMPAT_FILE.parent,
                                       suffix=".tmp", delete=False)
    tmp.write(new_content)
    tmp.close()
    shutil.move(tmp.name, COMPAT_FILE)
    print(f"Updated {COMPAT_FILE.name} with {len(COMPAT_ALIASES)} compat aliases")


def update_packages_scm():
    """Add new module import to packages.scm."""
    with open(PACKAGES_FILE, "r") as f:
        content = f.read()

    # Check if already imported
    if "deptree-260407" in content:
        print("packages.scm already has deptree-260407 import")
        return

    # Find the last #:use-module line for gaurix packages
    lines = content.split("\n")
    last_gaurix_import = 0
    for i, line in enumerate(lines):
        if "#:use-module (gaurix packages" in line:
            last_gaurix_import = i

    if last_gaurix_import > 0:
        lines.insert(last_gaurix_import + 1,
                     "  #:use-module (gaurix packages deptree-260407)")
        lines.insert(last_gaurix_import + 2,
                     "  #:use-module (gaurix packages deptree-260407-blocked-notes)")

    new_content = "\n".join(lines)
    tmp = tempfile.NamedTemporaryFile(mode="w", dir=PACKAGES_FILE.parent,
                                       suffix=".tmp", delete=False)
    tmp.write(new_content)
    tmp.close()
    shutil.move(tmp.name, PACKAGES_FILE)
    print(f"Updated {PACKAGES_FILE.name} with new module imports")


def main():
    # Verify all 100 are accounted for
    all_resolved = set(RECIPE_PACKAGES) | set(COMPAT_ALIASES.keys()) | set(PRIOR_PACKAGES) | set(REBLOCKED.keys()) | set(FAILED_ENTRIES)
    missing = set(SELECTED_100) - all_resolved
    if missing:
        print(f"ERROR: {len(missing)} packages not accounted for: {missing}")
        return 1

    extra = all_resolved - set(SELECTED_100)
    if extra:
        print(f"WARNING: {len(extra)} extra packages not in selected 100: {extra}")

    print(f"Resolution summary:")
    print(f"  Recipes: {len(RECIPE_PACKAGES)}")
    print(f"  Compat aliases: {len(COMPAT_ALIASES)}")
    print(f"  Prior resolved: {len(PRIOR_PACKAGES)}")
    print(f"  Re-blocked: {len(REBLOCKED)}")
    print(f"  Already FAILED (skipped): {len(FAILED_ENTRIES)}")
    print(f"  Total: {len(all_resolved)}")
    print()

    update_org_file()
    update_general_compat()
    update_packages_scm()

    print("\nDone! Review changes before committing.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
