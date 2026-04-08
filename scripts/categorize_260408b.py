#!/usr/bin/env python3
"""
Categorize 100 AUR packages from deptree-resolver-260408b selection
for Guix packaging suitability.

Categories:
  RESOLVABLE_BINARY      - Pre-built binary with download URL
  RESOLVABLE_SOURCE      - Can be built from source
  NON_DISTRIBUTABLE      - Requires proprietary OS/license to obtain
  PROPRIETARY_LICENSE    - Non-FOSS license
  ARCH_SPECIFIC          - Arch Linux-specific tools
  KERNEL_MODULE          - DKMS/kernel module
  LIB32                  - 32-bit library wrapper
  CROSS_COMPILER         - Cross-compilation toolchain
  MISSING_BUILD_TOOLS    - Build tools not in Guix
  BUILD_SYSTEM_TOO_COMPLEX - Extensive patching needed
  MISSING_SOURCE         - No source or binary downloads
  ALREADY_BLOCKED_260408A  - Same reason as previous run
"""

import json
import sys
from pathlib import Path

BASE = Path("/home/slime/projects/gaurix")

# Load selection
with open(BASE / "reports/deptree-resolver-260408b-selection.json") as f:
    selection = json.load(f)

package_names = selection["selected"]
print(f"Loaded {len(package_names)} packages from selection")

# Load AUR cache and index by name
with open(BASE / "data/aur-cache/packages-meta-ext-v1.json") as f:
    aur_data = json.load(f)

aur_index = {}
for entry in aur_data:
    aur_index[entry["Name"]] = entry
del aur_data  # free memory

print(f"AUR cache indexed: {len(aur_index)} packages")

# ── Previous run (260408a) blocked notes ──
# Parse out which packages were blocked and why from the Scheme file.
# We already know the mapping from reading the file:
prev_blocked = {
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
    "apple-fonts": "NON_DISTRIBUTABLE",
    "jdk8-graalvm-ee-bin": "PROPRIETARY_LICENSE",
    "jdk17-zulu-prime-bin": "PROPRIETARY_LICENSE",
    "jdk17-graalvm-ee-bin": "PROPRIETARY_LICENSE",
    "jdk21-graalvm-ee-bin": "PROPRIETARY_LICENSE",
    "matlab": "PROPRIETARY_LICENSE",
    "ndi-sdk": "PROPRIETARY_LICENSE",
    "samsung-unified-driver-printer": "PROPRIETARY_LICENSE",
    "iscan": "PROPRIETARY_LICENSE",
    "mongodb-bin": "PROPRIETARY_LICENSE",
    "samsung-unified-driver-scanner": "PROPRIETARY_LICENSE",
    "spotify-1.1": "PROPRIETARY_LICENSE",
    "spotify-dev": "PROPRIETARY_LICENSE",
    "bigpemu-bin": "PROPRIETARY_LICENSE",
    "chkufsd-bin": "PROPRIETARY_LICENSE",
    "codeql": "PROPRIETARY_LICENSE",
    "coder-bin": "PROPRIETARY_LICENSE",
    "crql-anina": "PROPRIETARY_LICENSE",
    "crql-locd": "PROPRIETARY_LICENSE",
    "nvidia-535xx-utils": "PROPRIETARY_LICENSE",  # was PROPRIETARY_DRIVER
    "rocm-gfx110x-bin": "PROPRIETARY_LICENSE",  # was PROPRIETARY_DRIVER
    "rocm-nightly-gfx110x-bin": "PROPRIETARY_LICENSE",
    "rocm-nightly-gfx1151-bin": "PROPRIETARY_LICENSE",
    "opencl-amd": "PROPRIETARY_LICENSE",
    "lib32-nvidia-utils-beta": "PROPRIETARY_LICENSE",  # also LIB32
    "opencl-nvidia-390xx": "PROPRIETARY_LICENSE",
    "opencl-nvidia-470xx": "PROPRIETARY_LICENSE",
    "opencl-nvidia-580xx": "PROPRIETARY_LICENSE",
    "opencl-nvidia-beta": "PROPRIETARY_LICENSE",
    "opencl-nvidia-535xx": "PROPRIETARY_LICENSE",
    "opencl-nvidia-550xx": "PROPRIETARY_LICENSE",
    "nvidia-390xx-dkms": "KERNEL_MODULE",  # was PROPRIETARY_DRIVER
    "nvidia-470xx-dkms": "KERNEL_MODULE",
    "nvidia-580xx-dkms": "KERNEL_MODULE",
    "nvidia-beta-dkms": "KERNEL_MODULE",
    "nvidia-open-beta": "PROPRIETARY_LICENSE",
    "nvidia-open-beta-dkms": "KERNEL_MODULE",
    "nvidia-beta": "PROPRIETARY_LICENSE",
    "lib32-libdovi": "LIB32",
    "lib32-libvmaf": "LIB32",
    "lib32-libbluray": "LIB32",
    "lib32-bluez-libs": "LIB32",
    "archlinux-java-run": "ARCH_SPECIFIC",
    "archarchive": "ARCH_SPECIFIC",
    "archlinux-artwork": "ARCH_SPECIFIC",
    "freetype2-qdoled-aw3225qf": "BUILD_SYSTEM_TOO_COMPLEX",
    "freetype2-qdoled-gen3": "BUILD_SYSTEM_TOO_COMPLEX",
    "libinput-no-gestures": "BUILD_SYSTEM_TOO_COMPLEX",
    "mingw-w64-crt-msvcrt": "CROSS_COMPILER",  # was BUILD_SYSTEM_TOO_COMPLEX
    "firefox-beta-bin-all-localizations": "BUILD_SYSTEM_TOO_COMPLEX",
    "vscodium-electron-bin": "BUILD_SYSTEM_TOO_COMPLEX",
    "kdesignerplugin": "BUILD_SYSTEM_TOO_COMPLEX",
    "kemoticons": "BUILD_SYSTEM_TOO_COMPLEX",
    "ps3toolchain": "CROSS_COMPILER",
    "mips64-linux-gnu-gcc-bootstrap": "CROSS_COMPILER",
    "chromium-gost": "BUILD_SYSTEM_TOO_COMPLEX",
    "mechrevo-drivers-dkms": "KERNEL_MODULE",
    "llama.cpp-opencl": "MISSING_BUILD_TOOLS",
    "unreal-tournament-data-archiveorg": "PROPRIETARY_LICENSE",
    "unreal-tournament-data-gog": "PROPRIETARY_LICENSE",
    "aspnet-runtime-preview-bin": "BUILD_SYSTEM_TOO_COMPLEX",
    "vectorchord-bin": "BUILD_SYSTEM_TOO_COMPLEX",
    "heidisql-qt6-bin": "BUILD_SYSTEM_TOO_COMPLEX",
    "gst-thumbnailers": "MISSING_SOURCE",
    "anbox-git": "MISSING_SOURCE",
    "ancestris": "MISSING_SOURCE",
    "audiobookshelf": "MISSING_SOURCE",
    "bulky": "MISSING_SOURCE",
    "butter-launcher-bin": "MISSING_SOURCE",
    "codex-desktop-bin": "MISSING_SOURCE",
    "lib32-xvidcore": "LIB32",
}

# Previous run reasons (for ALREADY_BLOCKED annotation)
prev_reason_text = {
    "ttf-ms-win10-auto": "MS Windows 10 fonts, requires Windows ISO, EULA prohibits redistribution",
    "ttf-ms-win10-japanese": "MS Windows 10 Japanese fonts, not redistributable",
    "ttf-ms-win10-korean": "MS Windows 10 Korean fonts, not redistributable",
    "ttf-ms-win10-other": "MS Windows 10 Other fonts, not redistributable",
    "ttf-ms-win10-sea": "MS Windows 10 Southeast Asian fonts, not redistributable",
    "ttf-ms-win10-thai": "MS Windows 10 Thai fonts, not redistributable",
    "ttf-ms-win10-zh_cn": "MS Windows 10 Simplified Chinese fonts, not redistributable",
    "ttf-ms-win10-zh_tw": "MS Windows 10 Traditional Chinese fonts, not redistributable",
    "ttf-ms-win11-japanese": "MS Windows 11 Japanese fonts, not redistributable",
    "ttf-ms-win11-korean": "MS Windows 11 Korean fonts, not redistributable",
    "ttf-ms-win11-other": "MS Windows 11 Other fonts, not redistributable",
    "ttf-ms-win11-sea": "MS Windows 11 Southeast Asian fonts, not redistributable",
    "ttf-ms-win11-thai": "MS Windows 11 Thai fonts, not redistributable",
    "ttf-ms-win11-zh_cn": "MS Windows 11 Simplified Chinese fonts, not redistributable",
    "ttf-ms-win11-zh_tw": "MS Windows 11 Traditional Chinese fonts, not redistributable",
    "apple-fonts": "Apple San Francisco/New York fonts, proprietary license",
    "jdk8-graalvm-ee-bin": "GraalVM Enterprise JDK 8, Oracle OTN license",
    "jdk17-zulu-prime-bin": "Azul Platform Prime JDK 17, proprietary subscription license",
    "jdk17-graalvm-ee-bin": "GraalVM Enterprise JDK 17, Oracle OTN license",
    "jdk21-graalvm-ee-bin": "GraalVM Enterprise JDK 21, GFTC license",
    "matlab": "MathWorks MATLAB, proprietary EULA, requires license",
    "ndi-sdk": "NewTek NDI SDK, proprietary license",
    "samsung-unified-driver-printer": "Samsung printer driver, proprietary Samsung license",
    "iscan": "EPSON Image Scan, proprietary AVASYSPL license",
    "mongodb-bin": "MongoDB Community Server, SSPL-1.0 (not OSI-approved)",
    "samsung-unified-driver-scanner": "Samsung scanner driver, proprietary Samsung license",
    "spotify-1.1": "Spotify legacy v1.1, proprietary streaming service",
    "spotify-dev": "Spotify development branch, proprietary",
    "bigpemu-bin": "BigPEmu Jaguar emulator, proprietary license",
    "chkufsd-bin": "Paragon UFSD filesystem utility, proprietary binary",
    "codeql": "GitHub CodeQL, proprietary redistribution terms",
    "coder-bin": "Coder remote dev platform, proprietary license",
    "crql-anina": "CRQL spectral resonance VST3/CLAP plugin, proprietary",
    "crql-locd": "CRQL phase-locked distortion VST3/CLAP plugin, proprietary",
    "nvidia-535xx-utils": "NVIDIA 535.xx driver utils, proprietary NVIDIA license",
    "rocm-gfx110x-bin": "AMD ROCm SDK for RDNA3, proprietary AMD binary",
    "rocm-nightly-gfx110x-bin": "AMD ROCm Nightly gfx110x, proprietary ROCm-EULA",
    "rocm-nightly-gfx1151-bin": "AMD ROCm Nightly gfx1151, proprietary ROCm-EULA",
    "opencl-amd": "AMD ROCm OpenCL, repackaged proprietary AMD binaries",
    "lib32-nvidia-utils-beta": "NVIDIA 32-bit beta utils, proprietary + no multilib in Guix",
    "opencl-nvidia-390xx": "NVIDIA 390.xx OpenCL, proprietary NVIDIA license",
    "opencl-nvidia-470xx": "NVIDIA 470.xx OpenCL, proprietary NVIDIA license",
    "opencl-nvidia-580xx": "NVIDIA 580.xx OpenCL, proprietary NVIDIA license",
    "opencl-nvidia-beta": "NVIDIA beta OpenCL, proprietary NVIDIA license",
    "opencl-nvidia-535xx": "NVIDIA 535.xx OpenCL, proprietary NVIDIA license",
    "opencl-nvidia-550xx": "NVIDIA 550.xx OpenCL, proprietary NVIDIA license",
    "nvidia-390xx-dkms": "NVIDIA 390.xx DKMS kernel module, proprietary",
    "nvidia-470xx-dkms": "NVIDIA 470.xx DKMS kernel module, proprietary",
    "nvidia-580xx-dkms": "NVIDIA 580.xx DKMS kernel module, proprietary",
    "nvidia-beta-dkms": "NVIDIA beta DKMS kernel module, proprietary",
    "nvidia-open-beta": "NVIDIA open kernel modules (beta), depends on proprietary runtime",
    "nvidia-open-beta-dkms": "NVIDIA open DKMS (beta), depends on proprietary runtime",
    "nvidia-beta": "NVIDIA beta kernel module, proprietary license",
    "lib32-libdovi": "Dolby Vision 32-bit lib, no multilib in Guix",
    "lib32-libvmaf": "Netflix VMAF 32-bit lib, no multilib in Guix",
    "lib32-libbluray": "Blu-Ray 32-bit lib, no multilib in Guix",
    "lib32-bluez-libs": "BlueZ 32-bit libs, no multilib in Guix",
    "lib32-xvidcore": "Xvid 32-bit lib, no multilib in Guix",
    "archlinux-java-run": "Arch Linux Java launcher, hardcoded Arch paths",
    "archarchive": "Arch Linux Archive rollback, requires pacman",
    "archlinux-artwork": "Arch Linux artwork/logos, trademark license",
    "freetype2-qdoled-aw3225qf": "Custom freetype2 for Dell AW3225QF QD-OLED, monitor-specific patches",
    "freetype2-qdoled-gen3": "Custom freetype2 for QD-OLED Gen3, monitor-specific patches",
    "libinput-no-gestures": "Patched libinput without gestures, needs rebuild with patches",
    "mingw-w64-crt-msvcrt": "MinGW-w64 CRT, cross-compilation toolchain",
    "firefox-beta-bin-all-localizations": "Firefox beta all localizations, complex Perl-based install",
    "vscodium-electron-bin": "VSCodium with system Electron, requires electron39 (not in Guix)",
    "kdesignerplugin": "KDE5 widget plugin, requires full KDE5 Frameworks stack",
    "kemoticons": "KDE5 emoticon framework, requires KDE5 stack",
    "ps3toolchain": "PS3 homebrew cross-compiler, 6+ PS3-specific packages",
    "mips64-linux-gnu-gcc-bootstrap": "MIPS64 cross-compiler bootstrap, Guix handles cross differently",
    "chromium-gost": "Full Chromium build with GOST patches, infeasible build",
    "mechrevo-drivers-dkms": "MECHREVO laptop DKMS kernel modules",
    "llama.cpp-opencl": "llama.cpp OpenCL backend, deprecated in favor of Vulkan",
    "unreal-tournament-data-archiveorg": "UT99 GOTY data, proprietary game data license",
    "unreal-tournament-data-gog": "UT99 GOTY data from GOG, requires GOG account",
    "aspnet-runtime-preview-bin": "ASP.NET Core preview, depends on blocked dotnet-runtime-preview-bin",
    "vectorchord-bin": "PostgreSQL vector search, requires PostgreSQL 18 + pgvector",
    "heidisql-qt6-bin": "HeidiSQL Qt6, requires qt6pas/libperconaserverclient/freetds",
    "gst-thumbnailers": "GStreamer thumbnailer, not found in AUR cache",
    "anbox-git": "Anbox, project discontinued, not in AUR cache",
    "ancestris": "Ancestris genealogy, not in AUR cache / no metadata",
    "audiobookshelf": "Audiobook server, not in AUR cache",
    "bulky": "Linux Mint bulk renamer, not in AUR cache",
    "butter-launcher-bin": "Butter Launcher (Electron), not in AUR cache",
    "codex-desktop-bin": "OpenAI Codex Desktop, not in AUR cache",
}


def categorize_package(name, aur_entry):
    """Categorize a single package based on AUR metadata and heuristics."""

    # ── Check if previously blocked with same reason ──
    if name in prev_blocked:
        cat = prev_blocked[name]
        reason = prev_reason_text.get(name, f"Previously blocked as {cat}")
        return "ALREADY_BLOCKED_260408A", f"[was {cat}] {reason}"

    # If not in AUR cache at all — manual overrides for known packages
    if aur_entry is None:
        manual_missing = {
            "cursor-ide": ("PROPRIETARY_LICENSE",
                "Cursor AI IDE (Anysphere). Listed in AUR as 'cursor'/'cursor-bin' "
                "with LicenseRef-Cursor_EULA. Proprietary EULA, not FOSS."),
            "dbeaver": ("RESOLVABLE_SOURCE",
                "DBeaver Community Edition. Listed in AUR as 'dbeaver-ce-bin'/'dbeaver-git'. "
                "Apache-2.0 license. Java/Maven build from GitHub."),
            "diffnav-bin": ("RESOLVABLE_BINARY",
                "diffnav Git diff TUI navigator. Not in AUR cache but upstream at "
                "https://github.com/dlvhdr/diffnav with MIT license. Pre-built Go binary."),
            "gst-thumbnailers": ("MISSING_SOURCE",
                "GStreamer thumbnailer. Not found in AUR cache."),
            "anbox-git": ("MISSING_SOURCE",
                "Anbox (Android in a Box). Project discontinued, GitHub repo archived."),
            "audiobookshelf": ("MISSING_SOURCE",
                "Audiobook streaming server. Not found in AUR cache. Node.js app."),
            "bulky": ("MISSING_SOURCE",
                "Linux Mint bulk file renamer. Not found in AUR cache."),
            "butter-launcher-bin": ("MISSING_SOURCE",
                "Butter Launcher (Electron-based). Not in AUR cache."),
            "codex-desktop-bin": ("MISSING_SOURCE",
                "OpenAI Codex Desktop. Not found in AUR cache. Likely Electron + proprietary."),
        }
        if name in manual_missing:
            return manual_missing[name]
        return "MISSING_SOURCE", f"Not found in AUR cache; package may be removed or renamed"

    license_list = aur_entry.get("License", []) or []
    license_lower = [l.lower() for l in license_list]
    url = aur_entry.get("URL", "") or ""
    desc = aur_entry.get("Description", "") or ""
    depends = aur_entry.get("Depends", []) or []
    makedepends = aur_entry.get("MakeDepends", []) or []
    provides = aur_entry.get("Provides", []) or []
    version = aur_entry.get("Version", "") or ""

    # ── Name-based heuristics ──

    # ttf-ms-win* -> NON_DISTRIBUTABLE
    if name.startswith("ttf-ms-win"):
        return "NON_DISTRIBUTABLE", "Microsoft Windows fonts, requires Windows license"

    # apple-fonts -> NON_DISTRIBUTABLE
    if name == "apple-fonts":
        return "NON_DISTRIBUTABLE", "Apple fonts, proprietary Apple license"

    # lib32- -> LIB32
    if name.startswith("lib32-"):
        return "LIB32", f"32-bit compatibility library ({name}), Guix does not support multilib"

    # *-dkms -> KERNEL_MODULE
    if name.endswith("-dkms"):
        return "KERNEL_MODULE", f"DKMS kernel module ({name})"

    # nvidia + dkms in name
    if "nvidia" in name and "dkms" in name:
        return "KERNEL_MODULE", f"NVIDIA DKMS kernel module"

    # archlinux / arch- -> ARCH_SPECIFIC
    if "archlinux" in name or name.startswith("arch-"):
        return "ARCH_SPECIFIC", f"Arch Linux-specific tool"

    # ── License-based heuristics ──
    proprietary_terms = [
        "custom", "proprietary", "unfree", "nonfree", "non-free",
        "eula", "sspl", "busl", "elastic", "otn",
        "commercial", "shareware"
    ]

    for lic in license_lower:
        for term in proprietary_terms:
            if term in lic:
                return "PROPRIETARY_LICENSE", f"License '{', '.join(license_list)}' contains proprietary term '{term}'"

    # ── URL/content-based heuristics ──

    # NVIDIA proprietary drivers (by name pattern)
    if name.startswith("nvidia-") or name.startswith("opencl-nvidia"):
        return "PROPRIETARY_LICENSE", "NVIDIA proprietary driver/utility"

    # ROCm proprietary binaries
    if "rocm" in name and "bin" in name:
        return "PROPRIETARY_LICENSE", "AMD ROCm proprietary binary distribution"

    # Samsung drivers
    if "samsung" in name and "driver" in name:
        return "PROPRIETARY_LICENSE", "Samsung proprietary driver"

    # Cross-compilers
    cross_patterns = ["mingw-w64", "mips64-linux-gnu", "ps3toolchain",
                      "arm-none-eabi", "aarch64-linux-gnu"]
    for pat in cross_patterns:
        if pat in name:
            return "CROSS_COMPILER", f"Cross-compilation toolchain ({pat})"

    # Matlab, Spotify, etc. well-known proprietary
    known_proprietary = {
        "matlab": "MathWorks MATLAB, proprietary EULA",
        "spotify-1.1": "Spotify, proprietary streaming service",
        "spotify-dev": "Spotify dev, proprietary streaming service",
        "ndi-sdk": "NewTek NDI SDK, proprietary",
        "iscan": "EPSON Image Scan, proprietary AVASYSPL license",
    }
    if name in known_proprietary:
        return "PROPRIETARY_LICENSE", known_proprietary[name]

    # MongoDB SSPL
    if name == "mongodb-bin":
        return "PROPRIETARY_LICENSE", "MongoDB SSPL-1.0, not OSI-approved"

    # ── Binary packages (name ends with -bin) ──
    if name.endswith("-bin"):
        # Check if URL points to a known binary host
        binary_hosts = ["github.com", "gitlab.com", "releases", "download"]
        if any(h in url.lower() for h in binary_hosts):
            return "RESOLVABLE_BINARY", f"Pre-built binary from {url}"
        # Still a binary package but unknown source
        if url:
            return "RESOLVABLE_BINARY", f"Pre-built binary package, upstream: {url}"
        return "MISSING_SOURCE", "Binary package but no upstream URL found"

    # ── Source packages with clear upstream ──
    source_build_systems = ["github.com", "gitlab.com", "sourceforge.net",
                            "codeberg.org", "sr.ht", "bitbucket.org",
                            "kde.org", "gnome.org", "freedesktop.org"]

    if any(host in url.lower() for host in source_build_systems):
        # Check build complexity
        complex_deps = ["electron", "chromium", "webkit2gtk", "rust", "cargo",
                        "npm", "yarn", "node", "flutter", "dart"]
        has_complex = [d for d in makedepends if any(c in d.lower() for c in complex_deps)]

        if has_complex:
            return "BUILD_SYSTEM_TOO_COMPLEX", f"Source at {url} but complex build deps: {', '.join(has_complex[:3])}"

        # Simple standard build
        if makedepends:
            build_tools = [d for d in makedepends]
            return "RESOLVABLE_SOURCE", f"Source at {url}, build deps: {', '.join(build_tools[:5])}"
        else:
            return "RESOLVABLE_SOURCE", f"Source at {url}, minimal/no explicit build deps"

    # ── Specific well-known packages ──
    if name == "cursor-ide":
        return "PROPRIETARY_LICENSE", "Cursor AI IDE, proprietary license (Anysphere)"

    if name == "dbeaver":
        return "RESOLVABLE_SOURCE", "DBeaver community database tool, Apache-2.0, Java/Maven build from GitHub"

    # ── Packages with upstream URL but not a known forge ──
    if url:
        # Check license for FOSS indicators
        foss_licenses = ["gpl", "mit", "bsd", "apache", "lgpl", "mpl", "isc",
                         "artistic", "zlib", "unlicense", "cc0", "wtfpl", "0bsd"]
        is_foss = any(any(fl in lic for fl in foss_licenses) for lic in license_lower)

        if is_foss:
            if makedepends:
                return "RESOLVABLE_SOURCE", f"FOSS ({', '.join(license_list)}), source at {url}"
            else:
                return "RESOLVABLE_SOURCE", f"FOSS ({', '.join(license_list)}), upstream: {url}"
        else:
            # Unknown license + not a known forge
            if license_list:
                return "PROPRIETARY_LICENSE", f"Unknown/non-FOSS license: {', '.join(license_list)}, URL: {url}"
            return "MISSING_SOURCE", f"No license info, upstream: {url}"

    # ── Fallback ──
    if not url and not license_list:
        return "MISSING_SOURCE", "No upstream URL or license information"

    return "BUILD_SYSTEM_TOO_COMPLEX", f"Could not determine build strategy; URL={url}, License={license_list}"


# ── Main categorization loop ──
results = []
category_counts = {}

for name in package_names:
    aur_entry = aur_index.get(name)

    category, reason = categorize_package(name, aur_entry)

    # Build result entry
    entry = {
        "name": name,
        "category": category,
        "reason": reason,
    }

    if aur_entry:
        entry["version"] = aur_entry.get("Version", "")
        entry["url"] = aur_entry.get("URL", "")
        entry["license"] = aur_entry.get("License", [])
        entry["description"] = aur_entry.get("Description", "")
        entry["depends"] = aur_entry.get("Depends", [])
        entry["makedepends"] = aur_entry.get("MakeDepends", [])
        entry["provides"] = aur_entry.get("Provides", [])
    else:
        entry["version"] = ""
        entry["url"] = ""
        entry["license"] = []
        entry["description"] = ""
        entry["depends"] = []
        entry["makedepends"] = []
        entry["provides"] = []

    results.append(entry)
    category_counts[category] = category_counts.get(category, 0) + 1

# ── Write output ──
output = {"packages": results}
out_path = BASE / "reports/deptree-resolver-260408b-categories.json"
with open(out_path, "w") as f:
    json.dump(output, f, indent=2)

print(f"\nWrote {len(results)} categorizations to {out_path}")
print(f"\n{'='*60}")
print(f"CATEGORY SUMMARY")
print(f"{'='*60}")
for cat, count in sorted(category_counts.items(), key=lambda x: -x[1]):
    print(f"  {cat:30s}  {count:3d}")
print(f"  {'TOTAL':30s}  {sum(category_counts.values()):3d}")

print(f"\n{'='*60}")
print(f"DETAILED RESULTS")
print(f"{'='*60}")
for r in results:
    print(f"\n  {r['name']}")
    print(f"    Category:    {r['category']}")
    print(f"    Reason:      {r['reason']}")
    if r['version']:
        print(f"    Version:     {r['version']}")
    if r['license']:
        print(f"    License:     {r['license']}")
    if r['url']:
        print(f"    URL:         {r['url']}")
    if r['description']:
        print(f"    Description: {r['description']}")
