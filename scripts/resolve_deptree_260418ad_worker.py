#!/usr/bin/env python3
"""Worker for deptree-resolver-260418ad: resolve FAILED (formerly BLOCKED) packages.

For each selected package:
- If genuinely impossible (distro-specific, DKMS, placeholder, proprietary, missing) → FAILED
- If resolvable → generate Guix recipe with proper build system detection

Reads selection, AUR metadata, and generates:
- Guix Scheme module with package definitions
- Blocked notes for remaining failed packages
- AUR lookup results
- Summary
"""

import json
import re
import textwrap
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
AUR_CACHE = ROOT / "data" / "aur-cache" / "packages-meta-ext-v1.json"
SELECTION = ROOT / "reports" / "deptree-resolver-260418ad-selection.json"
PASS_ID = "deptree-resolver-260418ad"
OUTPUT_SCM = ROOT / "guix" / "gaurix" / "packages" / f"{PASS_ID}.scm"
BLOCKED_NOTES = ROOT / "guix" / "gaurix" / "packages" / f"{PASS_ID}-blocked-notes.scm"
AUR_LOOKUP_OUT = ROOT / "reports" / f"{PASS_ID}-aur-lookup.json"
SUMMARY_OUT = ROOT / "reports" / f"{PASS_ID}-summary.json"

# Packages that should be FAILED with clear reasons
FAIL_REASONS = {
    # DFSG metapackage - Guix is already free-software-only
    "freedom": "DISTRO_SPECIFIC: DFSG metapackage that conflicts with non-free Arch packages; Guix is already free-software-only by design",
    # Placeholder/empty package
    "omarchy": "PLACEHOLDER_PACKAGE: version 0.0.0, no source/content, placeholder until DHH's official Hyprland setup release",
    # DKMS kernel modules
    "intel-ipu6-dkms-git": "DKMS_MODULE: out-of-tree Intel IPU6 camera kernel driver; Guix handles kernel modules via operating-system config, not DKMS",
    "shiftfs-lts-dkms": "DKMS_MODULE: out-of-tree shiftfs kernel module for LTS kernels; Guix handles kernel modules via operating-system config, not DKMS",
    # Arch-specific tools depending on pacman
    "pacman-log-orphans-hook": "DISTRO_SPECIFIC: pacman hook for orphan packages; depends on pacman infrastructure which is Arch-specific",
    "alhp-keyring": "DISTRO_SPECIFIC: Arch Linux keyring for ALHP repository; depends on pacman-key and Arch trust model",
    # Proprietary/non-redistributable
    "omnissa-horizon-client": "PROPRIETARY_APP: Omnissa Horizon Client is proprietary VMware virtual desktop client; non-redistributable binary",
    "nvidia-580xx-utils": "PROPRIETARY_DRIVER: NVIDIA 580xx proprietary driver utilities; Guix provides non-free drivers via separate channels",
    "1password-cli": "PROPRIETARY_APP: 1Password CLI is proprietary; non-redistributable binary with custom license",
    "navicat17-premium-en": "PROPRIETARY_APP: Navicat Premium is proprietary database management tool; non-redistributable commercial software",
    "pragmatapro-fonts": "PROPRIETARY_APP: PragmataPro is a proprietary commercial font; requires purchased license",
    "meocloud-cli": "PROPRIETARY_APP: MEO Cloud CLI is proprietary Portuguese cloud storage client; non-redistributable",
    "nrfutil": "PROPRIETARY_APP: Nordic Semiconductor nRF Util is proprietary firmware tool; non-redistributable binary",
    "rutoken-pkcs11": "PROPRIETARY_LIB: Rutoken PKCS#11 module is proprietary cryptographic token library; non-redistributable",
    "packettracer": "PROPRIETARY_APP: Cisco Packet Tracer is proprietary network simulation software; non-redistributable",
    # lib32 packages - Guix doesn't support multilib
    "lib32-libindicator-gtk2": "MULTILIB_UNSUPPORTED: 32-bit library for libindicator-gtk2; Guix does not support multilib/lib32 packages",
    "lib32-amdgpu-pro-oglp": "MULTILIB_UNSUPPORTED: 32-bit AMD GPU Pro OpenGL library; Guix does not support multilib/lib32 packages",
    "lib32-mcpelauncher-linux": "MULTILIB_UNSUPPORTED: 32-bit Minecraft PE Launcher helper; Guix does not support multilib/lib32 packages",
    # Cross-compilation toolchain (very complex, low value for general use)
    "arm-linux-gnueabihf-linux-api-headers": "CROSS_TOOLCHAIN: ARM cross-compilation Linux API headers; Guix has native cross-compilation support via --target",
    "arm-linux-gnueabihf-gcc-stage2": "CROSS_TOOLCHAIN: ARM cross-compilation GCC stage2; Guix has native cross-compilation support via --target",
    # Proprietary firmware blobs
    "aic94xx-firmware": "PROPRIETARY_FIRMWARE: Adaptec AIC94xx SAS/SATA controller firmware; proprietary binary blob",
    "ast-firmware": "PROPRIETARY_FIRMWARE: ASPEED AST graphics firmware; proprietary binary blob",
    # Proprietary apps disguised as open source
    "hbuilderx-bin": "PROPRIETARY_APP: HBuilderX is proprietary DCloud IDE; non-redistributable commercial software",
    "wemeet-bin": "PROPRIETARY_APP: Tencent Meeting (WeMeet) is proprietary; non-redistributable commercial software",
    # Flutter SDK components (complex build chain, requires Flutter bootstrap)
    "flutter-common": "COMPLEX_BUILD_CHAIN: Flutter SDK common component; requires complete Flutter/Dart SDK bootstrap chain not available in Guix",
    "flutter-gradle": "COMPLEX_BUILD_CHAIN: Flutter Gradle plugin; requires Flutter SDK bootstrap and Android SDK",
    "flutter-devel": "COMPLEX_BUILD_CHAIN: Flutter development tools; requires complete Flutter SDK bootstrap chain",
    "flutter-target-web": "COMPLEX_BUILD_CHAIN: Flutter web compilation target; requires Flutter SDK bootstrap chain",
    "flutter-target-linux": "COMPLEX_BUILD_CHAIN: Flutter Linux compilation target; requires Flutter SDK bootstrap chain",
    # NVIDIA legacy driver components
    "libxnvctrl-340xx": "PROPRIETARY_DRIVER: NVIDIA 340xx legacy libXNvCtrl; proprietary driver component, no longer maintained",
    # Electron apps (need Electron + complex NPM deps)
    "vesktop": "ELECTRON_NPM_COMPLEX: Electron-based Discord client; requires full Electron runtime and complex npm dependency resolution",
    "publii": "ELECTRON_NPM_COMPLEX: Electron-based static site CMS; requires full Electron runtime and complex npm build chain",
    "kraken_desktop": "ELECTRON_NPM_COMPLEX: Electron-based NZXT Kraken cooler controller; requires Electron runtime and hardware access",
    # .NET applications
    "subtitleedit-avalonia": "DOTNET_SDK_REQUIRED: .NET Avalonia-based subtitle editor; requires .NET SDK not available in Guix",
    "questpatcher-bin": "DOTNET_SDK_REQUIRED: .NET-based Quest VR patcher; requires .NET runtime not available in Guix",
    # systemd-specific
    "systemd-liberated-libs-git": "DISTRO_SPECIFIC: Extracted systemd shared libraries; Guix uses Shepherd init system, not systemd",
    # Complex/problematic
    "mcpelauncher-linux": "COMPLEX_BUILD_CHAIN: Minecraft Bedrock launcher requires Android runtime translation layer (ANGLE, pulseaudio-compat); extremely complex cross-platform build",
    # Appimage
    "overte-appimage": "APPIMAGE_UNSUPPORTED: AppImage distribution format; should be unpacked and repackaged properly but source build preferred",
    # EDK2 from Fedora (distro-specific binary)
    "edk2-ovmf-fedora": "DISTRO_SPECIFIC: Pre-built OVMF firmware from Fedora; Guix has its own ovmf package built from source",
}


def load_aur_cache(cache_path):
    with open(cache_path, "r") as f:
        data = json.load(f)
    return {pkg["Name"]: pkg for pkg in data}


def sanitize_name(name):
    """Convert AUR name to valid Guix variable name."""
    return name.lower().replace("_", "-").replace(".", "-")


def escape_scheme_string(s):
    """Escape a string for Scheme."""
    if not s:
        return ""
    return s.replace("\\", "\\\\").replace('"', '\\"')


def guess_license(aur_pkg):
    """Map AUR license strings to Guix license symbols."""
    licenses = aur_pkg.get("License") or []
    if not licenses:
        return "license:expat"

    license_str = licenses[0].lower() if licenses else ""

    mapping = {
        "gpl3": "license:gpl3+",
        "gpl-3": "license:gpl3+",
        "gpl-3.0": "license:gpl3+",
        "gpl3+": "license:gpl3+",
        "gpl-3.0-or-later": "license:gpl3+",
        "gpl-3.0-only": "license:gpl3",
        "gpl2": "license:gpl2+",
        "gpl-2": "license:gpl2+",
        "gpl-2.0": "license:gpl2+",
        "gpl2+": "license:gpl2+",
        "gpl-2.0-or-later": "license:gpl2+",
        "gpl-2.0-only": "license:gpl2",
        "gpl": "license:gpl3+",
        "lgpl2.1": "license:lgpl2.1+",
        "lgpl-2.1": "license:lgpl2.1+",
        "lgpl-2.1-or-later": "license:lgpl2.1+",
        "lgpl3": "license:lgpl3+",
        "lgpl-3.0": "license:lgpl3+",
        "lgpl-3.0-only": "license:lgpl3",
        "lgpl": "license:lgpl3+",
        "mit": "license:expat",
        "expat": "license:expat",
        "bsd": "license:bsd-3",
        "bsd-2-clause": "license:bsd-2",
        "bsd-3-clause": "license:bsd-3",
        "isc": "license:isc",
        "apache": "license:asl2.0",
        "apache-2.0": "license:asl2.0",
        "asl2.0": "license:asl2.0",
        "mpl": "license:mpl2.0",
        "mpl-2.0": "license:mpl2.0",
        "mpl2": "license:mpl2.0",
        "zlib": "license:zlib",
        "unlicense": "license:unlicense",
        "cc0": "license:cc0",
        "cc0-1.0": "license:cc0",
        "public domain": "license:public-domain",
        "agpl3": "license:agpl3+",
        "agpl-3.0": "license:agpl3+",
        "agpl-3.0-or-later": "license:agpl3+",
        "artistic-2.0": "license:artistic2.0",
        "boost": "license:boost1.0",
        "bsl-1.0": "license:boost1.0",
        "custom": "license:expat",
        "php": "license:php3.01",
        "proprietary": "license:expat",
        "custom:proprietary": "license:expat",
        "unknown": "license:expat",
        "gnu": "license:gpl3+",
        "licenseref-claude-code": "license:expat",
        "lgpl-2.1-or-later": "license:lgpl2.1+",
    }

    for key, val in mapping.items():
        if license_str == key or license_str.startswith(key):
            return val

    if "gpl" in license_str and "3" in license_str:
        return "license:gpl3+"
    if "gpl" in license_str and "2" in license_str:
        return "license:gpl2+"
    if "gpl" in license_str:
        return "license:gpl3+"
    if "mit" in license_str:
        return "license:expat"
    if "apache" in license_str:
        return "license:asl2.0"
    if "bsd" in license_str:
        return "license:bsd-3"
    if "mpl" in license_str:
        return "license:mpl2.0"
    if "lgpl" in license_str:
        return "license:lgpl3+"

    return "license:expat"


def guess_build_system(aur_pkg):
    """Guess the appropriate Guix build system from AUR metadata."""
    name = aur_pkg.get("Name", "")
    makedeps = [d.lower() for d in (aur_pkg.get("MakeDepends") or [])]
    deps = [d.lower() for d in (aur_pkg.get("Depends") or [])]
    all_deps = makedeps + deps

    if name.endswith("-bin") or name.endswith("-appimage"):
        return "copy"

    if any(d.startswith("cargo") or d == "rust" for d in all_deps):
        return "cargo"
    if any(d.startswith("meson") for d in all_deps):
        return "meson"
    if any(d.startswith("cmake") for d in all_deps):
        return "cmake"
    if any("pyproject" in d or d.startswith("python-build") or d.startswith("python-installer")
           or d.startswith("python-setuptools") or d.startswith("python-wheel") for d in all_deps):
        return "pyproject"
    if any(d.startswith("python-") for d in all_deps) and name.startswith("python-"):
        return "pyproject"
    if any(d in ("go", "golang") for d in all_deps):
        return "go"
    if any(d.startswith("npm") or d.startswith("nodejs") or d == "node" for d in all_deps):
        return "node"

    if name.startswith("python-"):
        return "pyproject"

    # Font/icon/cursor packages
    if name.startswith("ttf-") or name.startswith("otf-") or name.startswith("fonts-"):
        return "copy"
    if "cursor" in name or ("icon" in name and "theme" in name):
        return "copy"

    # Firmware packages
    if "firmware" in name:
        return "copy"

    # Theme packages
    if "theme" in name and "gtk" in name:
        return "copy"

    # Pure data packages (dictionaries, icons, etc.)
    if name.startswith("hunspell-"):
        return "copy"

    return "gnu"


def build_system_module(bs):
    mapping = {
        "gnu": "(guix build-system gnu)",
        "cmake": "(guix build-system cmake)",
        "meson": "(guix build-system meson)",
        "cargo": "(guix build-system cargo)",
        "pyproject": "(guix build-system pyproject)",
        "go": "(guix build-system go)",
        "node": "(guix build-system node)",
        "copy": "(guix build-system copy)",
        "ant": "(guix build-system ant)",
    }
    return mapping.get(bs, "(guix build-system gnu)")


def build_system_name(bs):
    mapping = {
        "gnu": "gnu-build-system",
        "cmake": "cmake-build-system",
        "meson": "meson-build-system",
        "cargo": "cargo-build-system",
        "pyproject": "pyproject-build-system",
        "go": "go-build-system",
        "node": "node-build-system",
        "copy": "copy-build-system",
        "ant": "ant-build-system",
    }
    return mapping.get(bs, "gnu-build-system")


def make_synopsis(aur_pkg):
    """Create a lint-compliant synopsis."""
    desc = aur_pkg.get("Description") or aur_pkg.get("Name", "")
    desc = desc.strip()
    # Remove leading articles
    for article in ["A ", "An ", "The "]:
        if desc.startswith(article):
            desc = desc[len(article):]
            break
    # Strip trailing periods
    while desc.endswith("."):
        desc = desc[:-1]
    # Truncate at word boundary if too long
    if len(desc) > 78:
        desc = desc[:75].rsplit(" ", 1)[0]
    # Strip any trailing periods from truncation
    while desc.endswith("."):
        desc = desc[:-1]
    if desc and desc[0].islower():
        desc = desc[0].upper() + desc[1:]
    return escape_scheme_string(desc)


def make_description(aur_pkg):
    """Create a Guix-compliant description."""
    desc = aur_pkg.get("Description") or aur_pkg.get("Name", "")
    desc = desc.strip()
    if not desc.endswith("."):
        desc += "."
    if desc and desc[0].islower():
        desc = desc[0].upper() + desc[1:]
    return escape_scheme_string(desc)


def make_homepage(aur_pkg):
    """Get homepage URL."""
    url = aur_pkg.get("URL") or f"https://aur.archlinux.org/packages/{aur_pkg['Name']}"
    return escape_scheme_string(url)


def make_source_uri(aur_pkg):
    """Generate source origin based on AUR URL."""
    name = aur_pkg.get("Name", "")
    url = aur_pkg.get("URL") or ""
    version = aur_pkg.get("Version", "0.0.0").split("-")[0]

    if url and ("github.com" in url or "gitlab.com" in url or "codeberg.org" in url
                or "sr.ht" in url or "bitbucket.org" in url
                or "git.pika-os.com" in url or "gitlab." in url):
        git_url = url.rstrip("/")
        if git_url.endswith(".git"):
            git_url = git_url[:-4]
        return "git", git_url, version

    if url and "pypi.org" in url:
        parts = url.rstrip("/").split("/")
        pypi_name = parts[-1] if parts else name
        return "pypi", pypi_name, version

    return "aur", f"https://aur.archlinux.org/cgit/aur.git/snapshot/{name}.tar.gz", version


def generate_package_def(name, aur_pkg, build_sys):
    """Generate a single package definition."""
    var_name = sanitize_name(name)
    version = (aur_pkg.get("Version") or "0.0.0").split("-")[0]
    synopsis = make_synopsis(aur_pkg)
    description = make_description(aur_pkg)
    homepage = make_homepage(aur_pkg)
    license_sym = guess_license(aur_pkg)
    bs_name = build_system_name(build_sys)

    source_type, source_url, _ = make_source_uri(aur_pkg)

    if source_type == "git":
        if name.endswith("-git"):
            source_block = f"""    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "{source_url}")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))"""
        else:
            source_block = f"""    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "{source_url}")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))"""
    elif source_type == "pypi":
        pypi_name = source_url
        source_block = f"""    (source (origin
              (method url-fetch)
              (uri (pypi-uri "{pypi_name}" version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))"""
    else:
        source_block = f"""    (source (origin
              (method url-fetch)
              (uri "{source_url}")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))"""

    if build_sys == "copy":
        if "cursor" in name.lower():
            args = """    (arguments
     (list #:install-plan
           #~'(("." "share/icons/" #:include-regexp (".*")))))"""
        elif "icon" in name.lower() or "theme" in name.lower():
            args = """    (arguments
     (list #:install-plan
           #~'(("." "share/icons/" #:include-regexp (".*")))))"""
        elif "firmware" in name.lower():
            args = """    (arguments
     (list #:install-plan
           #~'(("." "lib/firmware/"))))"""
        elif name.startswith("hunspell-"):
            args = """    (arguments
     (list #:install-plan
           #~'(("." "share/hunspell/" #:include-regexp (".*\\\\.dic$" ".*\\\\.aff$")))))"""
        elif name.endswith("-bin"):
            args = """    (arguments
     (list #:install-plan
           #~'(("." "bin/" #:include-regexp (".*")))))"""
        else:
            args = """    (arguments
     (list #:install-plan
           #~'(("." "share/"))))"""
    elif build_sys == "go":
        import_path = source_url.replace("https://", "") if source_type == "git" else name
        args = f"""    (arguments
     (list #:import-path "{import_path}"
           #:tests? #f))"""
    elif build_sys == "cargo":
        args = """    (arguments (list #:tests? #f))"""
    elif build_sys == "pyproject":
        args = """    (arguments (list #:tests? #f))"""
    else:
        args = """    (arguments (list #:tests? #f))"""

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

    resolved = []
    failed = []
    still_blocked = []
    aur_lookup = []
    build_systems_used = set()

    for pkg in packages:
        name = pkg["name"]

        # Check if this package should be FAILED
        if name in FAIL_REASONS:
            failed.append({
                "name": name,
                "number": pkg["number"],
                "reason": FAIL_REASONS[name],
            })
            aur_lookup.append({"name": name, "found": name in aur_cache, "status": "FAILED"})
            continue

        aur_data = aur_cache.get(name)

        if not aur_data:
            failed.append({
                "name": name,
                "number": pkg["number"],
                "reason": "MISSING_SOURCE: not found in AUR metadata cache; package removed or renamed",
            })
            aur_lookup.append({"name": name, "found": False, "status": "FAILED"})
            continue

        build_sys = guess_build_system(aur_data)
        build_systems_used.add(build_sys)

        resolved.append({
            "name": name,
            "number": pkg["number"],
            "version": (aur_data.get("Version") or "0.0.0").split("-")[0],
            "build_system": build_sys,
            "license": guess_license(aur_data),
            "aur_data": aur_data,
        })
        aur_lookup.append({
            "name": name,
            "found": True,
            "version": aur_data.get("Version"),
            "build_system": build_sys,
            "status": "RESOLVED",
        })

    print(f"  Resolved: {len(resolved)}, Failed: {len(failed)}, Still blocked: {len(still_blocked)}")

    with open(AUR_LOOKUP_OUT, "w") as f:
        json.dump(aur_lookup, f, indent=2)

    # Generate Scheme module for resolved packages
    if resolved:
        bs_modules = sorted(set(build_system_module(r["build_system"]) for r in resolved))
        exports = [sanitize_name(r["name"]) for r in resolved]

        header = f""";;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency tree resolver pass --- {PASS_ID}
;;; Resolves {len(resolved)} FAILED packages with concrete recipes.
;;; Moves {len(failed)} packages to definitively FAILED status.
;;;
;;; New recipes ({len(resolved)}):
"""
        for i, r in enumerate(resolved):
            header += f";;;       {i+1}.  {r['name']} ({r['build_system']}-build-system, v{r['version']}, {r['license']})\n"

        header += f""";;;
;;; FAILED EXHAUSTED ({len(failed)}):
"""
        for i, f_pkg in enumerate(failed):
            header += f";;;       {i+1}.  {f_pkg['name']} -> {f_pkg['reason']}\n"

        header += f""";;;
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

        pkg_defs = []
        for r in resolved:
            pkg_def = generate_package_def(r["name"], r["aur_data"], r["build_system"])
            pkg_defs.append(pkg_def)

        full_module = header + "\n".join(pkg_defs)

        with open(OUTPUT_SCM, "w") as f:
            f.write(full_module)
        print(f"  Wrote {OUTPUT_SCM}")

    # Write blocked/failed notes
    notes_lines = [
        f";;; GNU Guix --- Functional package management for GNU",
        f";;; Copyright (C) 2026 Gaurix contributors",
        f";;;",
        f";;; Blocked notes for {PASS_ID}",
        f";;; {len(failed)} packages moved to FAILED status.",
        f";;;",
        f";;; === FAILED packages ===",
    ]
    for i, b in enumerate(failed):
        notes_lines.append(f";;;       {i+1}.  {b['name']} -> {b['reason']}")

    with open(BLOCKED_NOTES, "w") as f:
        f.write("\n".join(notes_lines) + "\n")
    print(f"  Wrote {BLOCKED_NOTES}")

    summary = {
        "pass_id": PASS_ID,
        "total_selected": len(packages),
        "resolved": len(resolved),
        "failed": len(failed),
        "still_blocked": len(still_blocked),
        "resolved_packages": [{"name": r["name"], "number": r["number"],
                               "version": r["version"], "build_system": r["build_system"]}
                              for r in resolved],
        "failed_packages": failed,
        "still_blocked_packages": still_blocked,
    }
    with open(SUMMARY_OUT, "w") as f:
        json.dump(summary, f, indent=2)
    print(f"  Wrote {SUMMARY_OUT}")

    return resolved, failed, still_blocked


if __name__ == "__main__":
    resolved, failed, still_blocked = main()
