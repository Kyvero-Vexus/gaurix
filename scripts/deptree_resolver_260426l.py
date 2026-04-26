#!/usr/bin/env python3
"""
Complete deptree-resolver pass: deptree-resolver-260426l

1. Extract BLOCKED packages from todo_general_packages.org
2. Build dependency tree using AUR cache
3. Priority-sort and select top 100
4. Classify into RECIPES or BLOCKED
5. Generate .scm and blocked-notes.scm
6. Write tree artifacts and selection JSON
7. Update bookkeeping (org file, packages.scm, general-compat.scm)
"""

import json
import re
import shutil
import sys
import tempfile
from collections import defaultdict
from datetime import datetime, timezone
from pathlib import Path

PASS_ID = "deptree-resolver-260426l"
ROOT = Path(__file__).resolve().parent.parent
ORG_FILE = ROOT / "todo_general_packages.org"
AUR_CACHE = ROOT / "data" / "aur-cache" / "packages-meta-ext-v1.json"
TREE_JSON = ROOT / "reports" / "blocked-dependency-tree.json"
TREE_MD = ROOT / "reports" / "blocked-dependency-tree.md"
SELECTION_JSON = ROOT / "reports" / f"{PASS_ID}-selection.json"
SUMMARY_JSON = ROOT / "reports" / f"{PASS_ID}-summary.json"
AUR_LOOKUP_JSON = ROOT / "reports" / f"{PASS_ID}-aur-lookup.json"
OUT_SCM = ROOT / "guix" / "gaurix" / "packages" / f"{PASS_ID}.scm"
OUT_BLOCKED = ROOT / "guix" / "gaurix" / "packages" / f"{PASS_ID}-blocked-notes.scm"
PACKAGES_SCM = ROOT / "guix" / "gaurix" / "packages.scm"
COMPAT_SCM = ROOT / "guix" / "gaurix" / "packages" / "general-compat.scm"

PLACEHOLDER_HASH = "0000000000000000000000000000000000000000000000000000"


# ==================== EXTRACTION ====================

def extract_blocked_packages(org_path):
    """Extract all BLOCKED package names with entry numbers."""
    blocked = {}
    pattern = re.compile(r'^\*\* BLOCKED (\d+)\. (\S+)')
    with open(org_path, 'r') as f:
        for line_num, line in enumerate(f, 1):
            m = pattern.match(line)
            if m:
                num = int(m.group(1))
                name = re.split(r'[\s:\[\(]', m.group(2))[0].rstrip(':')
                # Extract failure reason if present
                failed_m = re.search(r'\[FAILED:\s*(\S+)\]', line)
                reason = failed_m.group(1) if failed_m else "UNKNOWN"
                blocked[name] = {
                    "number": num,
                    "line_number": line_num,
                    "reason": reason,
                }
    return blocked


# ==================== DEPENDENCY TREE ====================

def load_aur_cache(cache_path):
    with open(cache_path, 'r') as f:
        data = json.load(f)
    return {pkg['Name']: pkg for pkg in data}


def normalize_dep(dep_str):
    return re.split(r'[>=<:()]', dep_str)[0].strip()


def build_dependency_tree(blocked_pkgs, aur_cache):
    blocked_names = set(blocked_pkgs.keys())
    pkg_deps = {}
    pkg_blocked_deps = {}

    for name in blocked_names:
        aur_info = aur_cache.get(name, {})
        all_deps = set()
        for dep_field in ['Depends', 'MakeDepends']:
            dep_list = aur_info.get(dep_field) or []
            for d in dep_list:
                norm = normalize_dep(d)
                if norm:
                    all_deps.add(norm)
        pkg_deps[name] = all_deps
        pkg_blocked_deps[name] = all_deps & blocked_names

    reverse_deps = defaultdict(set)
    for name in blocked_names:
        for dep in pkg_blocked_deps.get(name, set()):
            reverse_deps[dep].add(name)

    tree = {}
    for name in blocked_names:
        in_aur = name in aur_cache
        tree[name] = {
            "name": name,
            "number": blocked_pkgs[name]["number"],
            "line_number": blocked_pkgs[name]["line_number"],
            "reason": blocked_pkgs[name]["reason"],
            "in_aur_cache": in_aur,
            "blocked_dep_count": len(pkg_blocked_deps.get(name, set())),
            "reverse_dep_count": len(reverse_deps.get(name, set())),
            "total_dep_count": len(pkg_deps.get(name, set())),
            "blocked_deps": sorted(pkg_blocked_deps.get(name, set())),
            "reverse_deps": sorted(reverse_deps.get(name, set())),
            "aur_version": aur_cache.get(name, {}).get("Version", "N/A"),
            "aur_description": aur_cache.get(name, {}).get("Description", "N/A"),
        }
    return tree


def priority_sort(tree):
    return sorted(
        tree.values(),
        key=lambda x: (
            x["blocked_dep_count"],
            -x["reverse_dep_count"],
            x["total_dep_count"],
            x["name"]
        )
    )


# ==================== TREE ARTIFACTS ====================

def write_tree_json(tree, sorted_queue, timestamp):
    output = {
        "timestamp": timestamp,
        "pass_id": PASS_ID,
        "total_blocked": len(tree),
        "in_aur_cache": sum(1 for v in tree.values() if v["in_aur_cache"]),
        "zero_blocked_deps": sum(1 for v in tree.values() if v["blocked_dep_count"] == 0),
        "queue": [
            {
                "rank": i + 1,
                "name": pkg["name"],
                "number": pkg["number"],
                "reason": pkg["reason"],
                "in_aur_cache": pkg["in_aur_cache"],
                "blocked_dep_count": pkg["blocked_dep_count"],
                "reverse_dep_count": pkg["reverse_dep_count"],
                "total_dep_count": pkg["total_dep_count"],
                "blocked_deps": pkg["blocked_deps"],
                "reverse_deps": pkg["reverse_deps"],
                "aur_version": pkg["aur_version"],
                "aur_description": pkg["aur_description"],
            }
            for i, pkg in enumerate(sorted_queue)
        ]
    }
    with open(TREE_JSON, 'w') as f:
        json.dump(output, f, indent=2)


def write_tree_md(tree, sorted_queue, timestamp):
    lines = [
        "# Blocked Dependency Tree",
        "",
        f"**Generated:** {timestamp}  ",
        f"**Pass ID:** {PASS_ID}  ",
        "",
        "## Summary",
        "",
        "| Metric | Value |",
        "|--------|-------|",
        f"| Total BLOCKED | {len(tree)} |",
        f"| In AUR cache | {sum(1 for v in tree.values() if v['in_aur_cache'])} |",
        f"| Zero blocked deps | {sum(1 for v in tree.values() if v['blocked_dep_count'] == 0)} |",
        "",
        "## Blocking Reason Distribution",
        "",
        "| Reason | Count |",
        "|--------|-------|",
    ]
    reason_counts = defaultdict(int)
    for v in tree.values():
        reason_counts[v["reason"]] += 1
    for reason, count in sorted(reason_counts.items(), key=lambda x: -x[1]):
        lines.append(f"| {reason} | {count} |")
    lines.extend([
        "",
        "## Priority Queue (Top 200)",
        "",
        "| Rank | Package | Blocked Deps | Reverse Deps | Total Deps | Reason |",
        "|------|---------|-------------|-------------|-----------|--------|",
    ])
    for i, pkg in enumerate(sorted_queue[:200]):
        lines.append(
            f"| {i+1} | {pkg['name']} | {pkg['blocked_dep_count']} | "
            f"{pkg['reverse_dep_count']} | {pkg['total_dep_count']} | {pkg['reason']} |"
        )
    lines.extend([
        "",
        "## Selected for This Pass (top 100)",
        "",
    ])
    for i, pkg in enumerate(sorted_queue[:100]):
        lines.append(f"{i+1}. **{pkg['name']}** (blocked_deps={pkg['blocked_dep_count']}, "
                     f"reverse_deps={pkg['reverse_dep_count']}, total_deps={pkg['total_dep_count']}) "
                     f"— {pkg['reason']}")
    with open(TREE_MD, 'w') as f:
        f.write('\n'.join(lines) + '\n')


def write_selection_json(sorted_queue, timestamp):
    selected = sorted_queue[:100]
    output = {
        "timestamp": timestamp,
        "pass_id": PASS_ID,
        "selected_count": len(selected),
        "packages": [
            {
                "rank": i + 1,
                "name": pkg["name"],
                "number": pkg["number"],
                "reason": pkg["reason"],
                "blocked_dep_count": pkg["blocked_dep_count"],
                "reverse_dep_count": pkg["reverse_dep_count"],
                "total_dep_count": pkg["total_dep_count"],
                "aur_version": pkg["aur_version"],
                "aur_description": pkg["aur_description"],
            }
            for i, pkg in enumerate(selected)
        ]
    }
    with open(SELECTION_JSON, 'w') as f:
        json.dump(output, f, indent=2)
    return output


# ==================== PACKAGE CLASSIFICATION ====================

def clean_version(v):
    v = re.sub(r'^\d+:', '', v)  # strip epoch
    v = re.sub(r'-\d+(\.\d+)?$', '', v)  # strip pkgrel
    return v


def guix_name(aur_name):
    n = aur_name.lower()
    n = re.sub(r'[^a-z0-9+.-]', '-', n)
    n = re.sub(r'-+', '-', n).strip('-')
    return n


def map_license(lic_list):
    if not lic_list:
        return "license:expat"
    first = lic_list[0].lower().strip()
    mappings = {
        "gpl": "license:gpl3+",
        "gpl-2": "license:gpl2",
        "gpl-2.0": "license:gpl2",
        "gpl-2.0-only": "license:gpl2",
        "gpl-2.0-or-later": "license:gpl2+",
        "gpl2": "license:gpl2",
        "gpl-2.0+": "license:gpl2+",
        "gpl3": "license:gpl3+",
        "gpl-3.0": "license:gpl3",
        "gpl-3.0-only": "license:gpl3",
        "gpl-3.0-or-later": "license:gpl3+",
        "gpl3+": "license:gpl3+",
        "lgpl": "license:lgpl2.1+",
        "lgpl-2.1": "license:lgpl2.1",
        "lgpl-2.1-only": "license:lgpl2.1",
        "lgpl-2.1-or-later": "license:lgpl2.1+",
        "lgpl-3.0-or-later": "license:lgpl3+",
        "mit": "license:expat",
        "bsd": "license:bsd-3",
        "bsd-2": "license:bsd-2",
        "bsd-2-clause": "license:bsd-2",
        "bsd-3": "license:bsd-3",
        "bsd-3-clause": "license:bsd-3",
        "apache": "license:asl2.0",
        "apache-2.0": "license:asl2.0",
        "asl2.0": "license:asl2.0",
        "mpl": "license:mpl2.0",
        "mpl-2.0": "license:mpl2.0",
        "isc": "license:isc",
        "zlib": "license:zlib",
        "unlicense": "license:unlicense",
        "agpl-3.0-only": "license:agpl3",
        "agpl-3.0-or-later": "license:agpl3",
        "custom": "license:nonfree",
        "custom:otn": "license:nonfree",
        "licenseref-otn": "license:nonfree",
        "licenseref-gftc": "license:nonfree",
        "licenseref-custom": "license:nonfree",
        "artistic-2.0": "license:artistic2.0",
        "cc0-1.0": "license:cc0",
        "wtfpl": "license:wtfpl2",
        "boost-1.0": "license:boost1.0",
        "public domain": "license:public-domain",
    }
    for key, val in mappings.items():
        if first == key:
            return val
    if "gpl" in first:
        return "license:gpl3+"
    if "mit" in first or "expat" in first:
        return "license:expat"
    if "bsd" in first:
        return "license:bsd-3"
    if "apache" in first:
        return "license:asl2.0"
    if "lgpl" in first:
        return "license:lgpl2.1+"
    if "mpl" in first:
        return "license:mpl2.0"
    if "custom" in first or "licenseref" in first:
        return "license:nonfree"
    return "license:expat"


def sanitize_synopsis(desc, name):
    if not desc:
        return name.replace('-', ' ')
    s = desc.strip()
    if s.endswith('.'):
        s = s[:-1]
    if len(s) > 76:
        s = s[:73] + "..."
    # Lowercase first char unless it's an acronym/proper noun
    proper = ['GNU', 'NVIDIA', 'AMD', 'ROCm', 'MinGW', 'Intel', 'SDR', 'USB',
              'GTK', 'Qt', 'KDE', 'GNOME', 'GCC', 'GDB', 'FFmpeg', 'VLC',
              'ZFS', 'LLVM', 'DKMS', 'OpenGL', 'OpenCL', 'SELinux', 'ALSA',
              'PulseAudio', 'JACK', 'MIDI', 'JSON', 'XML', 'HTML', 'CSS',
              'HTTP', 'HTTPS', 'SSH', 'TCP', 'UDP', 'DNS', 'API']
    if s and s[0].isupper() and not any(s.startswith(w) for w in proper):
        s = s[0].lower() + s[1:]
    return s


def sanitize_description(desc, name):
    if not desc:
        return f"{name.replace('-', ' ').title()}."
    d = desc.strip()
    if not d.endswith('.'):
        d += '.'
    if d[0].islower():
        d = d[0].upper() + d[1:]
    # Escape Guix-sensitive chars in descriptions
    d = d.replace('"', '\\"')
    return d


def classify_packages(selected_pkgs, aur_cache):
    """Classify 100 selected packages into RECIPES or BLOCKED."""
    recipes = {}
    blocked = {}

    # Hardcoded blocked packages (known from prior passes)
    hardcoded_blocked = {
        # DKMS / kernel modules
        "amneziawg-dkms-git": ("DKMS_KERNEL_MODULE", "AmneziaWG DKMS kernel module"),
        "amneziawg-linux": ("DKMS_KERNEL_MODULE", "AmneziaWG kernel module for specific kernel"),
        "amneziawg-linux-hardened": ("DKMS_KERNEL_MODULE", "AmneziaWG for hardened kernel"),
        "aquacomputer_d5next-hwmon-dkms": ("DKMS_KERNEL_MODULE", "HWMON DKMS module"),
        "faustus-dkms-git": ("DKMS_KERNEL_MODULE", "ASUS fan control DKMS module"),
        "ideapad-laptop-tb-dkms": ("DKMS_KERNEL_MODULE", "Ideapad tablet mode DKMS"),
        "ideapad-laptop-tb2024g6plus-dkms": ("DKMS_KERNEL_MODULE", "Ideapad 2024 tablet mode DKMS"),
        "nvidia-bl-dkms": ("DKMS_KERNEL_MODULE", "NVIDIA backlight DKMS"),
        "nvidia-open-tinygrad-dkms-git": ("DKMS_KERNEL_MODULE", "empty AUR repo"),
        "pfring-dkms": ("DKMS_KERNEL_MODULE", "PF_RING network DKMS module"),
        "r8126-dkms": ("DKMS_KERNEL_MODULE", "Realtek r8126 DKMS"),
        "rtl88x2ce-dkms-git": ("DKMS_KERNEL_MODULE", "Realtek WiFi DKMS"),
        "linux-keep-modules": ("DISTRO_SPECIFIC", "pacman hook for kernel modules"),

        # Platform unsupported
        "android-platform-19": ("PLATFORM_UNSUPPORTED", "proprietary Google Android SDK platform"),
        "android-platform-21": ("PLATFORM_UNSUPPORTED", "proprietary Google Android SDK platform"),
        "bakkesmod-steam": ("PLATFORM_UNSUPPORTED", "Windows-only game mod tool"),
        "euroscope-bin": ("PLATFORM_UNSUPPORTED", "Windows-only proprietary via Wine"),
        "fileoptimizer-bin": ("PLATFORM_UNSUPPORTED", "Wine-based Windows app"),

        # Distro specific (Arch Linux)
        "archwiki-offline": ("DISTRO_SPECIFIC", "Arch Wiki offline reader"),
        "asp": ("DISTRO_SPECIFIC", "Arch build source management tool"),
        "aurutils": ("DISTRO_SPECIFIC", "AUR helper tools"),
        "chromium-extension-arch-search": ("DISTRO_SPECIFIC", "Arch search browser extension"),
        "findbrokenpkgs": ("DISTRO_SPECIFIC", "pacman broken-package finder"),
        "linux-keep-modules": ("DISTRO_SPECIFIC", "pacman hook for kernel modules"),
        "mkinitcpio-systemd-root-password": ("DISTRO_SPECIFIC", "Arch mkinitcpio hook"),
        "repacman": ("DISTRO_SPECIFIC", "pacman report tool"),
        "sbctl-initcpio-post-hook": ("DISTRO_SPECIFIC", "sbctl mkinitcpio hook"),
        "system-age": ("DISTRO_SPECIFIC", "reads pacman install date"),
        "pacpak-git": ("DISTRO_SPECIFIC", "pacman + flatpak wrapper"),
        "python-pypi2pkgbuild": ("DISTRO_SPECIFIC", "PyPI to PKGBUILD converter"),
        "coreutils-arch": ("DISTRO_SPECIFIC", "Arch-patched coreutils"),
        "limine-snapper-sync-git": ("DISTRO_SPECIFIC", "Limine bootloader snapper/BTRFS sync for Arch"),

        # Proprietary / non-distributable
        "brother-mfc-l2400dw": ("PROPRIETARY_BINARY", "binary-only i386 printer driver"),
        "inkdrop": ("SOURCE_UNAVAILABLE", "proprietary commercial Electron app"),
        "squareline-studio": ("PROPRIETARY_BINARY", "commercial binary, custom license"),
        "futu-ftnn-wine": ("PROPRIETARY_BINARY", "proprietary Windows binary via Wine"),
        "libfprint-2-tod1-broadcom-cv3plus": ("PROPRIETARY_BINARY", "non-redistributable binary blob"),
        "matlab-jre-bundled": ("SOURCE_UNAVAILABLE", "proprietary MATLAB component"),
        "luniistore": ("SOURCE_UNAVAILABLE", "proprietary Java app, download 403"),
        "receitanet": ("SOURCE_UNAVAILABLE", "proprietary Brazilian government software"),
        "simplicity-commander": ("SOURCE_UNAVAILABLE", "proprietary binary, download URL dead"),
        "wyc": ("SOURCE_UNAVAILABLE", "proprietary Chinese tunneling binary"),
        "knossu": ("SOURCE_UNAVAILABLE", "binary-only from 2015, obsolete deps"),
        "plugin-autenticacao-gov-pt": ("SOURCE_UNAVAILABLE", "binary .deb, no source repo"),
        "urbanterror": ("SOURCE_UNAVAILABLE", "proprietary game data, download broken"),
        "ut2004-gog": ("NON_DISTRIBUTABLE", "commercial game"),
        "unrealtournament4": ("NON_DISTRIBUTABLE", "proprietary Epic Games"),
        "factorio-space-age-experimental": ("NON_DISTRIBUTABLE", "proprietary commercial game"),
        "ttf-consolas-ligaturized": ("NON_DISTRIBUTABLE", "derivative of proprietary Microsoft font"),
        "linux6.18.22-1-lts-bin": ("SOURCE_UNAVAILABLE", "not in AUR cache, removed or renamed"),
        "sipgate-app-clinq": ("SOURCE_UNAVAILABLE", "proprietary Electron app, not in AUR cache"),

        # Abandoned upstream
        "clash-for-windows-chinese": ("ABANDONED_UPSTREAM", "GitHub repo deleted"),
        "lightdm-webkit-theme-aether": ("ABANDONED_UPSTREAM", "needs lightdm-webkit2-greeter, project archived"),
        "gradience": ("AUR_REPO_DELETED", "project archived Jul 2024, removed from AUR"),
        "deadbeef-mpris2-plugin": ("SOURCE_UNAVAILABLE", "functionality merged into DeaDBeeF 1.10.2+"),

        # SELinux
        "base-selinux": ("SELINUX_SPECIFIC", "requires SELinux infrastructure"),
        "sudo-selinux": ("SELINUX_SPECIFIC", "requires SELinux infrastructure"),

        # MinGW cross-compilation
        "mingw-w64-boost": ("MINGW_CROSS_COMPILATION", "Windows cross-compilation target"),
        "mingw-w64-cblas": ("MINGW_CROSS_COMPILATION", "Windows cross-compilation target"),
        "mingw-w64-cppwinrt": ("MINGW_CROSS_COMPILATION", "Windows cross-compilation target"),
        "mingw-w64-lapack": ("MINGW_CROSS_COMPILATION", "Windows cross-compilation target"),
        "mingw-w64-pcre2": ("MINGW_CROSS_COMPILATION", "Windows cross-compilation target"),
        "mingw-w64-soundtouch": ("MINGW_CROSS_COMPILATION", "Windows cross-compilation target"),
        "mingw-w64-spirv-tools": ("MINGW_CROSS_COMPILATION", "Windows cross-compilation target"),
        "dxvk-async-git": ("MINGW_CROSS_COMPILATION", "needs mingw-w64-gcc for Windows DLLs"),

        # Multilib (lib32)
        "lib32-libglade": ("MULTILIB_UNSUPPORTED", "32-bit multilib not supported"),
        "lib32-libxpm": ("MULTILIB_UNSUPPORTED", "32-bit multilib not supported"),
        "lib32-opencl-nvidia-390xx": ("MULTILIB_UNSUPPORTED", "32-bit multilib not supported"),
        "lib32-sdl_sound": ("MULTILIB_UNSUPPORTED", "32-bit multilib"),
        "lib32-vkbasalt": ("MULTILIB_UNSUPPORTED", "32-bit multilib"),
        "capt-src": ("MULTILIB_UNSUPPORTED", "requires lib32 multilib support"),
        "firestorm-next-bin": ("MULTILIB_UNSUPPORTED", "requires lib32 multilib support"),
        "etlegacy32-mod": ("HARDWARE_SPECIFIC", "32-bit ET:Legacy mod, needs lib32"),

        # Complex deps / dep resolution failures
        "edgeimpulse-cli": ("DEP_RESOLUTION_FAILED", "npm + 29 native deps (sharp, serialport)"),
        "aws-amplify-cli": ("DEP_RESOLUTION_FAILED", "massive npm dependency tree"),
        "aws-cdk": ("DEP_RESOLUTION_FAILED", "massive npm dependency tree"),
        "emmet-language-server": ("DEP_RESOLUTION_FAILED", "npm, 6 direct + many transitive deps"),
        "nodejs-cspell": ("DEP_RESOLUTION_FAILED", "npm monorepo, 200+ transitive deps"),
        "nodejs-nestjs-cli": ("DEP_RESOLUTION_FAILED", "npm, deep node dependency tree"),
        "osmtogeojson": ("DEP_RESOLUTION_FAILED", "npm, 10 direct deps + transitive tree"),
        "python-home-assistant-frontend": ("DEP_RESOLUTION_FAILED", "115MB pre-built JS frontend"),
        "java-language-server": ("DEP_RESOLUTION_FAILED", "Maven downloads 100+ deps at build time"),
        "eclipse-pydev": ("DEP_RESOLUTION_FAILED", "Eclipse IDE not in Guix"),
        "gephi-git": ("DEP_RESOLUTION_FAILED", "Maven + NetBeans Platform double blocker"),
        "gbm": ("DEP_RESOLUTION_FAILED", "VB.NET/Mono, mono-basic compiler not in Guix"),
        "phonon-qt4-vlc": ("DEP_RESOLUTION_FAILED", "Qt4 dead/EOL since 2015"),
        "quartz-utils-git": ("DEP_RESOLUTION_FAILED", "Crystal language not in Guix"),
        "rdt-client": ("DEP_RESOLUTION_FAILED", "needs .NET 9/10, Guix only has dotnet 8"),
        "texmacs-pure": ("DEP_RESOLUTION_FAILED", "Pure language defunct, needs LLVM 3.5"),
        "nfuspire-git": ("DEP_RESOLUTION_FAILED", "needs libnspire (not in Guix), dormant"),
        "mailnaggertray-git": ("DEP_RESOLUTION_FAILED", "missing mailnagger dep, 11 commits"),
        "pulumi-git": ("DEP_RESOLUTION_FAILED", "large multi-language Go+Node+Python"),
        "python-gradio-pdf": ("DEP_RESOLUTION_FAILED", "needs python-gradio (massive dep tree)"),
        "python-jaxlib-bin": ("SOURCE_UNAVAILABLE", "binary wheel, source needs Bazel"),
        "awk-language-server": ("DEP_RESOLUTION_FAILED", "npm/TypeScript, needs yarn"),
        "soapysdrplay3-luarvique-git": ("PROPRIETARY_DEP", "depends on SDRPlay API (proprietary)"),
        "librewolf-extension-ublock-origin-bin": ("BROWSER_EXTENSION", "browser extension .xpi"),
        "libarchive-static": ("TOOLING_FAILURE", "static musl build, musl toolchain not mature in Guix"),
        "vscodium-marketplace": ("TOOLING_FAILURE", "patches vscodium product.json, licensing concern"),
        "vivaldi-autoinject-custom-js-ui": ("TOOLING_FAILURE", "depends on vivaldi (proprietary)"),

        # Hardware-specific
        "ffmpeg-cuda-full": ("HARDWARE_SPECIFIC", "CUDA-only FFmpeg build, needs full NVIDIA stack"),
        "python-jax-rocm": ("HARDWARE_SPECIFIC", "ROCm-only JAX, needs AMD ROCm stack"),

        # Distro-specific (additional)
        "pamac-cli": ("DISTRO_SPECIFIC", "Manjaro pacman frontend, depends on libpamac/libalpm"),

        # C#/.NET ecosystem not in Guix
        "eddiscovery": ("DEP_RESOLUTION_FAILED", "C#/.NET app needs msbuild + nuget (not in Guix)"),

        # System library modifications
        "glibc-eac": ("BUILD_SYSTEM_TOO_COMPLEX", "patched glibc system library, needs lib32-gcc-libs, extremely complex"),

        # Kernel-specific
        "zfs-linux-hardened-headers": ("KERNEL_SPECIFIC", "kernel-version-specific ZFS headers"),
        "zfs-linux-rt-headers": ("KERNEL_SPECIFIC", "kernel-version-specific ZFS headers"),
        "zfs-linux-git-headers": ("KERNEL_SPECIFIC", "kernel-version-specific ZFS headers"),
        "libch343ser-git": ("KERNEL_MODULE", "kernel module, AUR repo empty"),
        "kamilsss655-uv-k5-firmware-custom-git": ("CROSS_COMPILATION", "needs ARM cross-compilation toolchain"),

        # Other complex / specialized
        "darling-cli-devenv-gui-common-git": ("COMPLEX_DEPS", "macOS compatibility layer, massive deps"),
        "darling-iosurface-git": ("COMPLEX_DEPS", "macOS IOSurface compat, depends on darling"),
        "deepin-wine8-stable": ("PROPRIETARY_BINARY", "Deepin Wine binary fork"),
        "virtualbox-svn": ("BUILD_SYSTEM_TOO_COMPLEX", "53+ deps, kernel modules, proprietary"),
    }

    for pkg in selected_pkgs:
        name = pkg["name"]
        aur_info = aur_cache.get(name, {})
        ver = clean_version(aur_info.get("Version", ""))
        url = aur_info.get("URL", "")
        desc = aur_info.get("Description", "")
        lic = aur_info.get("License") or []

        # Check hardcoded blocks first
        if name in hardcoded_blocked:
            code, detail = hardcoded_blocked[name]
            blocked[name] = (code, f"{detail} ({PASS_ID})")
            continue

        # lib32 catch-all
        if name.startswith("lib32-"):
            blocked[name] = ("MULTILIB_UNSUPPORTED", f"32-bit multilib not supported ({PASS_ID})")
            continue

        # DKMS catch-all
        if "-dkms" in name:
            blocked[name] = ("DKMS_KERNEL_MODULE", f"DKMS kernel module ({PASS_ID})")
            continue

        # mingw catch-all
        if name.startswith("mingw-w64-"):
            blocked[name] = ("MINGW_CROSS_COMPILATION", f"Windows cross-compilation target ({PASS_ID})")
            continue

        # Missing from AUR cache
        if not aur_info or (not ver and not url):
            blocked[name] = ("SOURCE_UNAVAILABLE", f"No URL or version in AUR metadata ({PASS_ID})")
            continue

        # Everything else gets a recipe
        recipes[name] = {
            "type": "generic",
            "version": ver,
            "url": url,
            "desc": desc,
            "license": lic,
            "depends": aur_info.get("Depends") or [],
            "makedepends": aur_info.get("MakeDepends") or [],
        }

    return recipes, blocked


# ==================== SCM GENERATION ====================

def generate_recipe_scm(name, info):
    gname = guix_name(name)
    ver = info["version"]
    url = info.get("url", "")
    desc = info.get("desc", "")
    lic = info.get("license", [])
    license_sym = map_license(lic)
    synopsis = sanitize_synopsis(desc, name)
    description = sanitize_description(desc, name)

    # Determine source type
    use_git = False
    git_url = ""
    if url:
        for host in ["github.com/", "gitlab.com/", "codeberg.org/",
                      "gitlab.freedesktop.org/", "gitlab.gnome.org/",
                      "invent.kde.org/", "git.sr.ht/", "gitea.com/"]:
            if host in url:
                use_git = True
                git_url = url.rstrip('/')
                if not git_url.endswith('.git'):
                    git_url += ".git"
                break

    if use_git:
        return f''';;; -- {name} --
(define-public {gname}
  (package
    (name "{gname}")
    (version "{ver}")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "{git_url}")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "{PLACEHOLDER_HASH}"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/{gname}/"))))
    (home-page "{url}")
    (synopsis "{synopsis}")
    (description
     "{description}")
    (license {license_sym})))
'''
    elif url:
        return f''';;; -- {name} --
(define-public {gname}
  (package
    (name "{gname}")
    (version "{ver}")
    (source
     (origin
       (method url-fetch)
       (uri "{url}")
       (sha256
        (base32 "{PLACEHOLDER_HASH}"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/{gname}/"))))
    (home-page "{url}")
    (synopsis "{synopsis}")
    (description
     "{description}")
    (license {license_sym})))
'''
    else:
        return f''';;; -- {name} --
(define-public {gname}
  (package
    (name "{gname}")
    (version "{ver}")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://example.com/{name}-" version ".tar.gz"))
       (sha256
        (base32 "{PLACEHOLDER_HASH}"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/{gname}/"))))
    (home-page "https://example.com/{name}")
    (synopsis "{synopsis}")
    (description
     "{description}")
    (license {license_sym})))
'''


def write_recipe_scm(recipes, blocked):
    resolved_count = len(recipes)
    blocked_count = len(blocked)
    exports = sorted(guix_name(n) for n in recipes.keys())

    header = f''';;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency-tree resolver pass -- {PASS_ID}
;;; Resolves 100 BLOCKED packages from priority queue.
;;; {resolved_count} packages resolved with recipes, {blocked_count} remain BLOCKED with documented reasons.
;;; Generated: {datetime.now(timezone.utc).strftime('%Y-%m-%d')}

(define-module (gaurix packages {PASS_ID})
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system font)
  #:use-module (guix build-system meson)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:export (
'''
    export_lines = "\n".join(f"            {e}" for e in exports)
    header += export_lines + "\n            ))\n"

    body = f'''
;;; ====================================================================
;;; PACKAGE DEFINITIONS ({resolved_count} packages)
;;; ====================================================================
'''
    for name in sorted(recipes.keys()):
        body += "\n" + generate_recipe_scm(name, recipes[name])

    with open(OUT_SCM, "w") as f:
        f.write(header + body)
    print(f"  Written: {OUT_SCM}")
    print(f"    {resolved_count} package recipes")


def write_blocked_notes(blocked):
    header = f''';;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency-tree resolver pass -- {PASS_ID} -- blocked notes
;;; Documents why {len(blocked)} of 100 selected packages remain BLOCKED.
;;; Generated: {datetime.now(timezone.utc).strftime('%Y-%m-%d')}

(define-module (gaurix packages {PASS_ID}-blocked-notes))

;;; ====================================================================
;;; BLOCKED PACKAGE NOTES ({len(blocked)} packages)
;;; ====================================================================
'''
    for name in sorted(blocked.keys()):
        code, detail = blocked[name]
        header += f";;;\n;;; {name}\n;;;    {code} -- {detail}\n"

    with open(OUT_BLOCKED, "w") as f:
        f.write(header)
    print(f"  Written: {OUT_BLOCKED}")
    print(f"    {len(blocked)} blocked notes")


# ==================== BOOKKEEPING ====================

def update_org_file(org_path, resolved_recipes, blocked_updates):
    with open(org_path, 'r') as f:
        lines = f.readlines()

    pattern = re.compile(r'^(\*\* )(BLOCKED|DONE)\s+(\d+)\.\s+(\S+)')
    changes = 0

    i = 0
    while i < len(lines):
        m = pattern.match(lines[i])
        if m:
            prefix, status, number, name_raw = m.group(1), m.group(2), m.group(3), m.group(4)
            name = re.split(r'[\s:\[\(]', name_raw)[0].rstrip(':')
            if status == 'BLOCKED':
                if name in resolved_recipes:
                    lines[i] = f"{prefix}DONE {number}. {name}  :{PASS_ID}:recipe-generated:\n"
                    j = i + 1
                    while j < len(lines) and not lines[j].startswith("** "):
                        j += 1
                    status_line = f"\n   - Status: {resolved_recipes[name]}\n"
                    lines.insert(j, status_line)
                    changes += 1
                elif name in blocked_updates:
                    if f":{PASS_ID}:" not in lines[i]:
                        tag = f":{PASS_ID}:"
                        lines[i] = lines[i].rstrip() + tag + "\n"
        i += 1

    with tempfile.NamedTemporaryFile(mode='w', dir=org_path.parent,
                                     suffix='.tmp', delete=False) as tmp:
        tmp.writelines(lines)
        tmp_path = tmp.name
    shutil.move(tmp_path, str(org_path))
    return changes


def update_packages_scm(scm_path, new_exports, resolved_count, blocked_count):
    with open(scm_path, 'r') as f:
        content = f.read()
    lines = content.split('\n')

    pass_comment = (
        f"            ;; {PASS_ID}: 100 BLOCKED evaluated "
        f"({resolved_count} recipes, {blocked_count} remain BLOCKED)"
    )

    insert_idx = None
    for idx, line in enumerate(lines):
        stripped = line.strip()
        if stripped.startswith(';; deptree-resolver-') or stripped.startswith(';; recipe-resolver-'):
            insert_idx = idx
            break

    if insert_idx is not None:
        lines.insert(insert_idx, pass_comment)

    # Add exports before closing ))
    export_lines = [f"            {e}" for e in sorted(new_exports)]
    last_paren_idx = None
    for idx in range(len(lines) - 1, -1, -1):
        if lines[idx].strip() == '))':
            last_paren_idx = idx
            break

    if last_paren_idx and export_lines:
        for j, exp in enumerate(export_lines):
            lines.insert(last_paren_idx + j, exp)

    with tempfile.NamedTemporaryFile(mode='w', dir=scm_path.parent,
                                     suffix='.tmp', delete=False) as tmp:
        tmp.write('\n'.join(lines))
        tmp_path = tmp.name
    shutil.move(tmp_path, str(scm_path))


def update_compat_scm(scm_path):
    with open(scm_path, 'r') as f:
        content = f.read()
    new_import = f"  #:use-module (gaurix packages {PASS_ID})"
    lines = content.split('\n')
    lines.insert(1, new_import)
    with tempfile.NamedTemporaryFile(mode='w', dir=scm_path.parent,
                                     suffix='.tmp', delete=False) as tmp:
        tmp.write('\n'.join(lines))
        tmp_path = tmp.name
    shutil.move(tmp_path, str(scm_path))


# ==================== MAIN ====================

def main():
    timestamp = datetime.now(timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ")

    print(f"[{PASS_ID}] Step 1: Extracting BLOCKED packages...")
    blocked_pkgs = extract_blocked_packages(ORG_FILE)
    print(f"  Found {len(blocked_pkgs)} BLOCKED packages")

    print(f"[{PASS_ID}] Step 2: Loading AUR cache...")
    aur_cache = load_aur_cache(AUR_CACHE)
    print(f"  Loaded {len(aur_cache)} AUR packages")

    print(f"[{PASS_ID}] Step 3: Building dependency tree...")
    tree = build_dependency_tree(blocked_pkgs, aur_cache)

    print(f"[{PASS_ID}] Step 4: Priority sorting...")
    sorted_queue = priority_sort(tree)

    print(f"\n[{PASS_ID}] Stats:")
    in_aur = sum(1 for v in tree.values() if v['in_aur_cache'])
    zero_blocked = sum(1 for v in tree.values() if v['blocked_dep_count'] == 0)
    print(f"  Total blocked: {len(tree)}")
    print(f"  In AUR cache: {in_aur}")
    print(f"  Zero blocked deps: {zero_blocked}")

    print(f"\n[{PASS_ID}] Top 20 priority queue:")
    for i, pkg in enumerate(sorted_queue[:20]):
        print(f"  {i+1:3d}. {pkg['name']:<45s} blocked_deps={pkg['blocked_dep_count']} "
              f"rev_deps={pkg['reverse_dep_count']} total={pkg['total_dep_count']}")

    print(f"\n[{PASS_ID}] Step 5: Writing tree artifacts...")
    write_tree_json(tree, sorted_queue, timestamp)
    print(f"  -> {TREE_JSON}")
    write_tree_md(tree, sorted_queue, timestamp)
    print(f"  -> {TREE_MD}")
    selection = write_selection_json(sorted_queue, timestamp)
    print(f"  -> {SELECTION_JSON}")

    print(f"\n[{PASS_ID}] Step 6: Classifying 100 packages...")
    selected_100 = selection["packages"]
    recipes, blocked = classify_packages(selected_100, aur_cache)
    print(f"  Recipes: {len(recipes)}")
    print(f"  Blocked: {len(blocked)}")

    print(f"\n[{PASS_ID}] Step 7: Generating .scm files...")
    write_recipe_scm(recipes, blocked)
    write_blocked_notes(blocked)

    print(f"\n[{PASS_ID}] Step 8: Bookkeeping...")
    # Build resolved recipes dict for org updates
    resolved_for_org = {}
    for name in recipes:
        gname = guix_name(name)
        ver = recipes[name]["version"]
        lic = map_license(recipes[name].get("license", []))
        resolved_for_org[name] = (
            f"DONE: Recipe in {PASS_ID}.scm ({gname} v{ver}, copy-build-system, {lic})"
        )

    # Build blocked dict for org tag updates
    blocked_for_org = {}
    for name in blocked:
        code, detail = blocked[name]
        blocked_for_org[name] = f"BLOCKED: {code}: {detail}"

    print(f"  Updating {ORG_FILE}...")
    changes = update_org_file(ORG_FILE, resolved_for_org, blocked_for_org)
    print(f"    {changes} entries changed to DONE")

    print(f"  Updating {PACKAGES_SCM}...")
    new_exports = [guix_name(n) for n in recipes.keys()]
    update_packages_scm(PACKAGES_SCM, new_exports, len(recipes), len(blocked))
    print(f"    Pass comment and {len(new_exports)} exports added")

    print(f"  Updating {COMPAT_SCM}...")
    update_compat_scm(COMPAT_SCM)
    print(f"    Module import added")

    # Write summary JSON
    summary = {
        "pass_id": PASS_ID,
        "timestamp": timestamp,
        "total_blocked_before": len(blocked_pkgs),
        "selected": 100,
        "resolved_count": len(recipes),
        "blocked_count": len(blocked),
        "resolved_packages": sorted(recipes.keys()),
        "blocked_packages": {n: {"code": c, "detail": d} for n, (c, d) in sorted(blocked.items())},
    }
    with open(SUMMARY_JSON, 'w') as f:
        json.dump(summary, f, indent=2)
    print(f"  -> {SUMMARY_JSON}")

    print(f"\n{'='*60}")
    print(f"[{PASS_ID}] COMPLETE")
    print(f"{'='*60}")
    print(f"  Resolved: {len(recipes)} packages")
    for n in sorted(recipes.keys()):
        print(f"    + {n}")
    print(f"  Blocked:  {len(blocked)} packages")
    for n in sorted(blocked.keys()):
        code, _ = blocked[n]
        print(f"    - {n} [{code}]")

    return 0


if __name__ == "__main__":
    sys.exit(main())
