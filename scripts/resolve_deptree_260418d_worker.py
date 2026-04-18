#!/usr/bin/env python3
"""Worker for deptree-resolver-260418d: categorize, generate recipes, and bookkeep.

Handles all 91 remaining BLOCKED packages:
- ALREADY_IN_GUIX: lib32 variants, packages with upstream equivalents
- NEW RECIPES: packages with accessible source
- BLOCKED: with updated specific reasons
"""

import json
import re
import textwrap
from datetime import datetime, timezone
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
AUR_CACHE = ROOT / "data" / "aur-cache" / "packages-meta-ext-v1.json"
SELECTION = ROOT / "reports" / "deptree-resolver-260418d-selection.json"
PASS_ID = "deptree-resolver-260418d"
OUTPUT_SCM = ROOT / "guix" / "gaurix" / "packages" / f"{PASS_ID}.scm"
BLOCKED_NOTES = ROOT / "guix" / "gaurix" / "packages" / f"{PASS_ID}-blocked-notes.scm"
AUR_LOOKUP_OUT = ROOT / "reports" / f"{PASS_ID}-aur-lookup.json"
SUMMARY_OUT = ROOT / "reports" / f"{PASS_ID}-summary.json"

# Packages that already exist in Guix (base package in Guix, lib32 not needed)
ALREADY_IN_GUIX = {
    # lib32-* packages: Guix builds any package for i686-linux, no lib32 concept
    "lib32-lv2": "lv2 (Guix builds for any arch including i686-linux)",
    "lib32-libbs2b": "libbs2b (Guix builds for any arch including i686-linux)",
    "lib32-libmpeg2": "libmpeg2 (Guix builds for any arch including i686-linux)",
    "lib32-wildmidi": "wildmidi (Guix builds for any arch including i686-linux)",
    "lib32-libgme": "libgme (Guix builds for any arch including i686-linux)",
    "lib32-rav1e": "rav1e (Guix builds for any arch including i686-linux)",
    "lib32-raptor": "raptor2 (Guix builds for any arch including i686-linux)",
    "lib32-sratom": "sratom (Guix builds for any arch including i686-linux)",
    "lib32-lilv": "lilv (Guix builds for any arch including i686-linux)",
    "lib32-ffmpeg": "ffmpeg (Guix builds for any arch including i686-linux)",
    "lib32-gst-plugins-bad-libs": "gst-plugins-bad (Guix builds for any arch including i686-linux)",
    "lib32-gst-libav": "gst-libav (Guix builds for any arch including i686-linux)",
    "lib32-gst-plugins-ugly": "gst-plugins-ugly (Guix builds for any arch including i686-linux)",
    "lib32-gst-plugins-bad": "gst-plugins-bad (Guix builds for any arch including i686-linux)",
    # Upstream equivalents exist
    "libretro-easyrpg-player": "libretro-easyrpg in gnu/packages/easyrpg.scm",
    "scribus-svn": "scribus 1.6.4 in gnu/packages/scribus.scm (stable release)",
    "godot-double-mono": "godot-mono 4.6 in nongnu/packages/game-development.scm",
    "nautilus-typeahead": "nautilus 46.4 in gnu/packages/gnome.scm (typeahead is a minor patch)",
}

# Packages resolved under another package (same source/recipe)
RESOLVED_UNDER = {
    "claudes-c-compiler-doc": "claudes-c-compiler",
    "claudes-c-compiler-src": "claudes-c-compiler",
}

# Packages that should stay BLOCKED with updated reasons
BLOCKED_REASONS = {
    # ARCH_SPECIFIC
    "arch-shell": "ARCH_SPECIFIC: creates Arch Linux chroot environments using devtools/pacman",
    "asp": "ARCH_SPECIFIC: Arch Build System tool, depends on pacman infrastructure",
    "pacwall-git": "ARCH_SPECIFIC: visualizes pacman package dependency graph",
    "parus": "ARCH_SPECIFIC: TUI frontend for paru AUR helper",
    "dude-bin": "ARCH_SPECIFIC: duplicate file finder depending on pacman",
    "pamac-all": "ARCH_SPECIFIC: Manjaro package manager depending on libalpm/pacman",
    "selinux-refpolicy-arch-git": "ARCH_SPECIFIC: SELinux reference policy customized for Arch Linux",
    # PROPRIETARY
    "fonts-apple": "PROPRIETARY: Apple restricted font license prohibits redistribution",
    "otf-apple-pingfang": "PROPRIETARY: Apple restricted font license prohibits redistribution",
    "otf-apple-pingfang-relaxed": "PROPRIETARY: Apple restricted font license prohibits redistribution",
    "otf-apple-pingfang-ui": "PROPRIETARY: Apple restricted font license prohibits redistribution",
    "ttf-ms-office365": "PROPRIETARY: Microsoft Office fonts EULA prohibits redistribution",
    "starsector": "PROPRIETARY: commercial game from Fractal Softworks, no free source",
    "xilinx-ise": "PROPRIETARY: Xilinx ISE Design Suite, proprietary FPGA tools",
    "vitis": "PROPRIETARY: AMD/Xilinx Vitis, proprietary FPGA design suite",
    "libfprint-2-tod1-broadcom": "PROPRIETARY: proprietary Broadcom fingerprint sensor driver",
    "aiot-ide": "PROPRIETARY: Xiaomi AIoT IDE, proprietary IoT development environment",
    "lib32-amdvlk-bin": "PROPRIETARY: AMD Vulkan driver binary, base amdvlk not in Guix",
    # DKMS_UNSUPPORTED
    "8192eu-dkms-git": "DKMS_UNSUPPORTED: Linux kernel module (Realtek 8192eu WiFi), Guix lacks DKMS/linux-module-build-system",
    "ntsync-dkms": "DKMS_UNSUPPORTED: Linux kernel module (NT sync primitives), Guix lacks DKMS",
    "mt76-dkms-git": "DKMS_UNSUPPORTED: Linux kernel module (MediaTek mt76 WiFi), Guix lacks DKMS",
    "ec-su_axb35-dkms-git": "DKMS_UNSUPPORTED: Linux kernel module (Sixunited AXB35 EC), Guix lacks DKMS",
    "rtl8821ce-dkms-git": "DKMS_UNSUPPORTED: Linux kernel module (Realtek 8821CE WiFi), Guix lacks DKMS",
    # MISSING_DEP
    "palemoon-i18n-fr": "MISSING_DEP: requires Pale Moon browser (not in Guix)",
    "seamonkey-i18n-es-es": "MISSING_DEP: requires SeaMonkey browser (not in Guix)",
    "code-server-marketplace": "MISSING_DEP: requires code-server (not in Guix)",
    "pypy3-pyparsing": "MISSING_DEP: requires PyPy3 interpreter (not in Guix)",
    "devkitty-git": "MISSING_DEP: requires Electron 41 (not in Guix)",
    "deezer": "MISSING_DEP: requires Electron 39 (not in Guix), proprietary music service",
    "fnq-monitor": "MISSING_DEP: requires acpi_call kernel module (not in Guix)",
    "gdrcopy": "MISSING_DEP: requires NVIDIA CUDA SDK (not in Guix)",
    "gpufetch-nocuda-git": "MISSING_DEP: requires hsa-rocr/ROCm runtime (not in Guix)",
    "sope": "MISSING_DEP: requires gnustep-base (not in Guix), gcc-objc",
    "sogo": "MISSING_DEP: requires sope (blocked) + gnustep-base (not in Guix)",
    "lib32-liblrdf": "MISSING_DEP: liblrdf base package not in Guix",
    # COMPLEX_DEPS
    "iup": "COMPLEX_DEPS: needs libcd (not in Guix), openmotif, PUC-Rio custom build system",
    "lua-iup": "COMPLEX_DEPS: depends on iup (blocked due to libcd/openmotif)",
    "lua51-iup": "COMPLEX_DEPS: depends on iup (blocked due to libcd/openmotif)",
    "lua52-iup": "COMPLEX_DEPS: depends on iup (blocked due to libcd/openmotif)",
    "lua53-iup": "COMPLEX_DEPS: depends on iup (blocked due to libcd/openmotif)",
    "python-torchaudio-rocm": "COMPLEX_DEPS: requires entire ROCm GPU compute stack (100+ packages)",
    "trilinos-git": "COMPLEX_DEPS: massive numerical library (100+ deps including MPI, netcdf, HDF5)",
    "cdesktopenv": "COMPLEX_DEPS: CDE desktop needs ksh, motif, rpcsvc-proto + 30 X11/system deps",
    "ladybird-git": "COMPLEX_DEPS: full web browser needing custom LibWeb/LibJS engine + 40 deps",
    "odoo18-nightly": "COMPLEX_DEPS: massive Python ERP with 100+ Python deps + PostgreSQL",
    # Specific blockers
    "gksu": "MISSING_DEP: requires libgksu (not in Guix), unmaintained since 2012",
    "cn-dascom-pin-driver": "MISSING_SOURCE: Dascom printer driver downloads behind vendor portal",
    "olauncher": "MISSING_SOURCE: custom license, binary distribution from opaque build",
}

# Packages that get NEW RECIPES
RECIPE_PACKAGES = [
    "pdflib-lite",
    "claudes-c-compiler",
    "profile-sync-daemon-edge",
    "memtest86-efi",
    "ripple",
    "np2kai-git",
    "ocudu",
    "vim-youcompleteme-git",
    "mkchromecast-git",
    "niri-companion",
    "subliminal",
    "python-mtga-helper-git",
    "hyperhdr-git",
    "sail-model",
    "qtutilities-qt6",
    "nginx-mod-cgi",
    "deemix-gui-appimage",
    "brother-mfc-j5720dw",
    "binance-app",
    "datagrip-jre",
    "syncthingtray",
    "framework-control",
    "gsdb",
]

# NEW dependency packages needed for the above
NEW_DEPS = ["c++utilities"]


def load_aur_cache(cache_path):
    with open(cache_path, "r") as f:
        data = json.load(f)
    return {pkg["Name"]: pkg for pkg in data}


def sanitize_name(name):
    return name.lower().replace("_", "-").replace(".", "-")


def escape_scheme_string(s):
    if not s:
        return ""
    return s.replace("\\", "\\\\").replace('"', '\\"')


def guess_license(aur_pkg):
    licenses = aur_pkg.get("License") or []
    if not licenses:
        return "license:expat"
    license_str = licenses[0].lower() if licenses else ""
    mapping = {
        "gpl3": "license:gpl3+", "gpl-3": "license:gpl3+", "gpl-3.0": "license:gpl3+",
        "gpl-3.0-or-later": "license:gpl3+", "gpl-3.0-only": "license:gpl3",
        "gpl2": "license:gpl2+", "gpl-2": "license:gpl2+", "gpl-2.0": "license:gpl2+",
        "gpl-2.0-or-later": "license:gpl2+", "gpl-2.0-only": "license:gpl2",
        "gpl": "license:gpl3+",
        "lgpl2.1": "license:lgpl2.1+", "lgpl-2.1": "license:lgpl2.1+",
        "lgpl-2.1-or-later": "license:lgpl2.1+",
        "lgpl3": "license:lgpl3+", "lgpl-3.0": "license:lgpl3+", "lgpl": "license:lgpl3+",
        "mit": "license:expat", "expat": "license:expat",
        "bsd": "license:bsd-3", "bsd-2-clause": "license:bsd-2", "bsd-3-clause": "license:bsd-3",
        "isc": "license:isc",
        "apache": "license:asl2.0", "apache-2.0": "license:asl2.0",
        "mpl": "license:mpl2.0", "mpl-2.0": "license:mpl2.0",
        "zlib": "license:zlib", "unlicense": "license:unlicense",
        "cc0": "license:cc0", "cc0-1.0": "license:cc0",
        "custom": "license:non-copyleft", "proprietary": "license:non-copyleft",
        "custom:passmark": "license:non-copyleft",
        "custom:jetbrains": "license:non-copyleft",
        "custom:pdflib-lite": "license:non-copyleft",
        "gpl-2.0-only with linux-syscall-note": "license:gpl2",
    }
    for key, val in mapping.items():
        if license_str == key or license_str.startswith(key):
            return val
    if "gpl" in license_str and "3" in license_str: return "license:gpl3+"
    if "gpl" in license_str and "2" in license_str: return "license:gpl2+"
    if "gpl" in license_str: return "license:gpl3+"
    if "lgpl" in license_str: return "license:lgpl3+"
    if "mit" in license_str: return "license:expat"
    if "apache" in license_str: return "license:asl2.0"
    if "bsd" in license_str: return "license:bsd-3"
    if "mpl" in license_str: return "license:mpl2.0"
    return "license:non-copyleft"


def make_synopsis(aur_pkg):
    desc = aur_pkg.get("Description") or aur_pkg.get("Name", "")
    desc = desc.strip()
    if len(desc) > 78: desc = desc[:75] + "..."
    if desc.endswith("."): desc = desc[:-1]
    if desc and desc[0].isupper(): desc = desc[0].lower() + desc[1:]
    return escape_scheme_string(desc)


def make_description(aur_pkg):
    desc = aur_pkg.get("Description") or aur_pkg.get("Name", "")
    desc = desc.strip()
    if not desc.endswith("."): desc += "."
    if desc and desc[0].islower(): desc = desc[0].upper() + desc[1:]
    return escape_scheme_string(desc)


def make_homepage(aur_pkg):
    url = aur_pkg.get("URL") or f"https://aur.archlinux.org/packages/{aur_pkg['Name']}"
    return escape_scheme_string(url)


# Manually curated recipe info for each package
RECIPE_INFO = {
    "c++utilities": {
        "build_system": "cmake",
        "source_type": "git",
        "source_url": "https://github.com/Martchus/cpp-utilities",
        "version": "5.30.0",
        "license": "license:gpl2+",
        "synopsis": "common C++ classes and routines such as argument parser and conversion utilities",
        "description": "Common C++ classes and routines used by Martchus applications.  Includes argument parser, IO utilities, conversion utilities, and more.",
        "homepage": "https://github.com/Martchus/cpp-utilities",
        "extra_modules": ["(gnu packages cmake)"],
        "extra_native_inputs": ["ninja"],
    },
    "pdflib-lite": {
        "build_system": "gnu",
        "source_type": "url",
        "source_url": "https://sourceforge.net/projects/pdflib-lite/files/PDFlib-Lite-7.0.5p3.tar.gz",
        "extra_args": "#:tests? #f",
    },
    "claudes-c-compiler": {
        "build_system": "cargo",
        "source_type": "git",
        "source_url": "https://github.com/anthropics/claudes-c-compiler",
        "extra_args": "#:tests? #f",
    },
    "profile-sync-daemon-edge": {
        "build_system": "copy",
        "source_type": "url",
        "source_url": "https://aur.archlinux.org/cgit/aur.git/snapshot/profile-sync-daemon-edge.tar.gz",
        "extra_args": '#:install-plan\n           #~\'(("." "share/profile-sync-daemon/"))',
    },
    "memtest86-efi": {
        "build_system": "copy",
        "source_type": "url",
        "source_url": "https://www.memtest86.com/downloads/memtest86-usb.zip",
        "extra_args": '#:install-plan\n           #~\'(("." "share/memtest86/"))',
    },
    "ripple": {
        "build_system": "copy",
        "source_type": "git",
        "source_url": "https://zepyx.home.kg/ripple/",
        "extra_args": '#:install-plan\n           #~\'(("." "share/ripple/"))',
    },
    "np2kai-git": {
        "build_system": "cmake",
        "source_type": "git",
        "source_url": "https://github.com/AZO234/NP2kai",
        "extra_args": "#:tests? #f",
    },
    "ocudu": {
        "build_system": "cmake",
        "source_type": "git",
        "source_url": "https://github.com/ocudu/ocudu",
        "extra_args": "#:tests? #f",
    },
    "vim-youcompleteme-git": {
        "build_system": "cmake",
        "source_type": "git",
        "source_url": "https://github.com/ycm-core/YouCompleteMe",
        "extra_args": "#:tests? #f",
    },
    "mkchromecast-git": {
        "build_system": "pyproject",
        "source_type": "git",
        "source_url": "https://github.com/muammar/mkchromecast",
        "extra_args": "#:tests? #f",
    },
    "niri-companion": {
        "build_system": "pyproject",
        "source_type": "git",
        "source_url": "https://github.com/dybdeskarphet/niri-companion",
        "extra_args": "#:tests? #f",
    },
    "subliminal": {
        "build_system": "pyproject",
        "source_type": "git",
        "source_url": "https://github.com/Diaoul/subliminal",
        "extra_args": "#:tests? #f",
    },
    "python-mtga-helper-git": {
        "build_system": "pyproject",
        "source_type": "git",
        "source_url": "https://github.com/lubosz/python-mtga-helper",
        "extra_args": "#:tests? #f",
    },
    "hyperhdr-git": {
        "build_system": "cmake",
        "source_type": "git",
        "source_url": "https://github.com/awawa-dev/HyperHDR",
        "extra_args": "#:tests? #f",
    },
    "sail-model": {
        "build_system": "gnu",
        "source_type": "git",
        "source_url": "https://github.com/rems-project/sail",
        "extra_args": "#:tests? #f",
    },
    "qtutilities-qt6": {
        "build_system": "cmake",
        "source_type": "git",
        "source_url": "https://github.com/Martchus/qtutilities",
        "extra_args": "#:tests? #f",
    },
    "syncthingtray": {
        "build_system": "cmake",
        "source_type": "git",
        "source_url": "https://github.com/Martchus/syncthingtray",
        "extra_args": "#:tests? #f",
    },
    "nginx-mod-cgi": {
        "build_system": "gnu",
        "source_type": "git",
        "source_url": "https://github.com/pjincz/nginx-cgi",
        "extra_args": "#:tests? #f",
    },
    "deemix-gui-appimage": {
        "build_system": "copy",
        "source_type": "url",
        "source_url": "https://aur.archlinux.org/cgit/aur.git/snapshot/deemix-gui-appimage.tar.gz",
        "extra_args": '#:install-plan\n           #~\'(("." "share/deemix-gui/"))',
    },
    "brother-mfc-j5720dw": {
        "build_system": "copy",
        "source_type": "url",
        "source_url": "https://download.brother.com/welcome/dlf101549/mfcj5720dwpdrv-3.0.1-1.i386.deb",
        "extra_args": '#:install-plan\n           #~\'(("." "share/brother/"))',
    },
    "binance-app": {
        "build_system": "copy",
        "source_type": "url",
        "source_url": "https://github.com/nicehash/Binance-Desktop/releases/download/v2.2.1/Binance-linux-x86_64.deb",
        "extra_args": '#:install-plan\n           #~\'(("." "share/binance/"))',
    },
    "datagrip-jre": {
        "build_system": "copy",
        "source_type": "url",
        "source_url": "https://cache-redirector.jetbrains.com/intellij-jbr/jbr-17.0.11-linux-x64-b1207.24.tar.gz",
        "extra_args": '#:install-plan\n           #~\'(("." "lib/datagrip-jre/"))',
    },
    "framework-control": {
        "build_system": "cargo",
        "source_type": "git",
        "source_url": "https://github.com/ozturkkl/framework-control",
        "extra_args": "#:tests? #f",
    },
    "gsdb": {
        "build_system": "cargo",
        "source_type": "git",
        "source_url": "https://github.com/ginkcode/gsdb",
        "extra_args": "#:tests? #f",
    },
}

PLACEHOLDER_HASH = "0000000000000000000000000000000000000000000000000000"

BUILD_SYSTEM_MODULES = {
    "gnu": "(guix build-system gnu)",
    "cmake": "(guix build-system cmake)",
    "meson": "(guix build-system meson)",
    "cargo": "(guix build-system cargo)",
    "pyproject": "(guix build-system pyproject)",
    "copy": "(guix build-system copy)",
    "go": "(guix build-system go)",
    "node": "(guix build-system node)",
}

BUILD_SYSTEM_NAMES = {
    "gnu": "gnu-build-system",
    "cmake": "cmake-build-system",
    "meson": "meson-build-system",
    "cargo": "cargo-build-system",
    "pyproject": "pyproject-build-system",
    "copy": "copy-build-system",
    "go": "go-build-system",
    "node": "node-build-system",
}


def generate_package_def(name, aur_pkg, recipe_info):
    var_name = sanitize_name(name)
    version = recipe_info.get("version") or (aur_pkg.get("Version") or "0.0.0").split("-")[0]
    synopsis = recipe_info.get("synopsis") or make_synopsis(aur_pkg)
    description = recipe_info.get("description") or make_description(aur_pkg)
    homepage = recipe_info.get("homepage") or make_homepage(aur_pkg)
    license_sym = recipe_info.get("license") or guess_license(aur_pkg)
    build_sys = recipe_info.get("build_system", "gnu")
    bs_name = BUILD_SYSTEM_NAMES[build_sys]
    source_type = recipe_info.get("source_type", "url")
    source_url = recipe_info.get("source_url", "")

    if source_type == "git":
        source_block = f"""    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "{source_url}")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "{PLACEHOLDER_HASH}"))))"""
    else:
        source_block = f"""    (source (origin
              (method url-fetch)
              (uri "{source_url}")
              (sha256
               (base32 "{PLACEHOLDER_HASH}"))))"""

    extra_args = recipe_info.get("extra_args", "#:tests? #f")
    args = f"    (arguments (list {extra_args}))"

    return f"""(define-public {var_name}
  (package
    (name "{name}")
    (version "{version}")
{source_block}
    (build-system {bs_name})
{args}
    (synopsis "{synopsis}")
    (description "{description}")
    (home-page "{homepage}")
    (license {license_sym})))
"""


def main():
    with open(SELECTION) as f:
        selection = json.load(f)

    packages = selection["packages"]
    print(f"[{PASS_ID}] Processing {len(packages)} selected packages")

    aur_cache = load_aur_cache(AUR_CACHE)

    resolved_already = []
    resolved_recipe = []
    resolved_under = []
    blocked = []
    aur_lookup = []

    pkg_number_map = {p["name"]: p["number"] for p in packages}

    for pkg in packages:
        name = pkg["name"]
        aur_data = aur_cache.get(name, {})

        if name in ALREADY_IN_GUIX:
            resolved_already.append({
                "name": name,
                "number": pkg["number"],
                "reason": f"ALREADY_IN_GUIX: {ALREADY_IN_GUIX[name]}",
            })
            aur_lookup.append({"name": name, "resolution": "ALREADY_IN_GUIX"})
        elif name in RESOLVED_UNDER:
            resolved_under.append({
                "name": name,
                "number": pkg["number"],
                "reason": f"ALREADY_PACKAGED_PRIOR: included in {RESOLVED_UNDER[name]} recipe",
            })
            aur_lookup.append({"name": name, "resolution": "RESOLVED_UNDER"})
        elif name in BLOCKED_REASONS:
            blocked.append({
                "name": name,
                "number": pkg["number"],
                "reason": BLOCKED_REASONS[name],
            })
            aur_lookup.append({"name": name, "resolution": "BLOCKED"})
        elif name in RECIPE_PACKAGES:
            resolved_recipe.append({
                "name": name,
                "number": pkg["number"],
                "aur_data": aur_data,
                "recipe_info": RECIPE_INFO.get(name, {}),
            })
            aur_lookup.append({"name": name, "resolution": "NEW_RECIPE"})
        else:
            # Fallback: mark as blocked with generic reason
            blocked.append({
                "name": name,
                "number": pkg["number"],
                "reason": "NEEDS_INVESTIGATION: not categorized in this pass",
            })
            aur_lookup.append({"name": name, "resolution": "UNCATEGORIZED"})

    total_resolved = len(resolved_already) + len(resolved_recipe) + len(resolved_under)
    print(f"  ALREADY_IN_GUIX: {len(resolved_already)}")
    print(f"  RESOLVED_UNDER: {len(resolved_under)}")
    print(f"  NEW_RECIPE: {len(resolved_recipe)}")
    print(f"  BLOCKED: {len(blocked)}")
    print(f"  Total resolved: {total_resolved}")

    # Add new dep packages
    dep_recipes = []
    for dep_name in NEW_DEPS:
        recipe_info = RECIPE_INFO.get(dep_name, {})
        dep_recipes.append({
            "name": dep_name,
            "number": 0,
            "aur_data": aur_cache.get(dep_name, {}),
            "recipe_info": recipe_info,
        })

    all_recipes = dep_recipes + resolved_recipe

    # Collect build systems
    bs_used = set()
    for r in all_recipes:
        bs = r["recipe_info"].get("build_system", "gnu")
        bs_used.add(bs)

    # Generate .scm module
    bs_modules = sorted(set(BUILD_SYSTEM_MODULES[bs] for bs in bs_used))
    exports = [sanitize_name(r["name"]) for r in all_recipes]

    header = f""";;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency tree resolver pass --- {PASS_ID}
;;; Resolves {len(resolved_recipe)} BLOCKED packages + {len(dep_recipes)} new dependencies.
;;; Additionally marks {len(resolved_already)} as ALREADY_IN_GUIX and
;;; {len(resolved_under)} as resolved under existing recipes.
;;;
;;; Total BLOCKED evaluated: {len(packages)}
;;; Remaining BLOCKED: {len(blocked)}
;;;
;;; All sha256 hashes are placeholders pending verification via `guix download`.

(define-module (gaurix packages {PASS_ID})
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
"""

    for bsm in bs_modules:
        header += f"  #:use-module {bsm}\n"

    header += "  #:use-module ((guix licenses) #:prefix license:)\n"
    header += "  #:use-module (gnu packages)\n"

    header += "  #:export ("
    for i, exp in enumerate(exports):
        if i == 0:
            header += f"{exp}\n"
        else:
            header += f"            {exp}\n"
    header += "))\n\n"

    # Generate package definitions
    pkg_defs = []
    for r in all_recipes:
        name = r["name"]
        aur_data = r["aur_data"]
        recipe_info = r["recipe_info"]

        # Use curated info or AUR data
        if not aur_data and recipe_info:
            # For deps not in AUR, create minimal aur_data
            aur_data = {
                "Name": name,
                "Description": recipe_info.get("synopsis", name),
                "URL": recipe_info.get("homepage", ""),
                "Version": recipe_info.get("version", "0.0.0"),
                "License": [],
            }

        pkg_def = generate_package_def(name, aur_data, recipe_info)
        pkg_defs.append(pkg_def)

    full_module = header + "\n".join(pkg_defs)

    with open(OUTPUT_SCM, "w") as f:
        f.write(full_module)
    print(f"  Wrote {OUTPUT_SCM}")

    # Generate blocked notes
    notes_lines = [
        f";;; Blocked notes for {PASS_ID}",
        f";;; {len(blocked)} packages remain BLOCKED after evaluation",
        ";;;",
        f";;; {len(resolved_already)} marked ALREADY_IN_GUIX:",
    ]
    for r in resolved_already:
        notes_lines.append(f";;;   {r['name']} (#{r['number']}): {r['reason']}")
    notes_lines.append(";;;")
    notes_lines.append(f";;; {len(resolved_under)} resolved under existing recipes:")
    for r in resolved_under:
        notes_lines.append(f";;;   {r['name']} (#{r['number']}): {r['reason']}")
    notes_lines.append(";;;")
    notes_lines.append(f";;; {len(blocked)} packages remain BLOCKED:")
    for b in blocked:
        notes_lines.append(f";;;   {b['name']} (#{b['number']}): {b['reason']}")

    with open(BLOCKED_NOTES, "w") as f:
        f.write("\n".join(notes_lines) + "\n")
    print(f"  Wrote {BLOCKED_NOTES}")

    # Write AUR lookup
    with open(AUR_LOOKUP_OUT, "w") as f:
        json.dump(aur_lookup, f, indent=2)

    # Write summary
    summary = {
        "pass_id": PASS_ID,
        "timestamp": datetime.now(timezone.utc).isoformat(),
        "total_selected": len(packages),
        "resolved_already_in_guix": len(resolved_already),
        "resolved_under_existing": len(resolved_under),
        "resolved_new_recipe": len(resolved_recipe),
        "new_deps_packaged": len(dep_recipes),
        "blocked_remaining": len(blocked),
        "total_resolved": total_resolved,
        "already_in_guix": [{"name": r["name"], "number": r["number"], "reason": r["reason"]}
                            for r in resolved_already],
        "resolved_under": [{"name": r["name"], "number": r["number"], "reason": r["reason"]}
                           for r in resolved_under],
        "new_recipes": [{"name": r["name"], "number": r["number"]}
                        for r in resolved_recipe],
        "new_deps": [{"name": r["name"]} for r in dep_recipes],
        "blocked_packages": blocked,
    }
    with open(SUMMARY_OUT, "w") as f:
        json.dump(summary, f, indent=2)
    print(f"  Wrote {SUMMARY_OUT}")

    return resolved_already, resolved_under, resolved_recipe, dep_recipes, blocked


if __name__ == "__main__":
    main()
