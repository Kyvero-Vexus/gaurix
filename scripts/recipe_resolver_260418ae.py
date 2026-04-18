#!/usr/bin/env python3
"""
recipe-resolver-260418ae: Resolve 100 TODO packages from todo_general_packages.org.

Steps:
1. Parse org file for TODO entries
2. Look up AUR metadata
3. Select 100 realistic candidates
4. Generate Guix package definitions
5. Write batch .scm file + blocked notes
6. Update org file statuses
7. Update packages.scm and general-compat.scm
8. Write summary report
"""

import json
import os
import re
import sys
import tempfile
import shutil
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
ORG_FILE = ROOT / "todo_general_packages.org"
AUR_CACHE = ROOT / "data" / "aur-cache" / "packages-meta-ext-v1.json"
PACKAGES_SCM = ROOT / "guix" / "gaurix" / "packages.scm"
GENERAL_COMPAT = ROOT / "guix" / "gaurix" / "packages" / "general-compat.scm"
PASS_ID = "recipe-resolver-260418ae"
SCM_FILE = ROOT / "guix" / "gaurix" / "packages" / f"{PASS_ID}.scm"
BLOCKED_NOTES = ROOT / "guix" / "gaurix" / "packages" / f"{PASS_ID}-blocked-notes.scm"
SUMMARY_FILE = ROOT / "reports" / f"{PASS_ID}-summary.json"
AUR_LOOKUP_FILE = ROOT / "reports" / f"{PASS_ID}-aur-lookup.json"
SELECTION_FILE = ROOT / "reports" / f"{PASS_ID}-selection.json"

PLACEHOLDER_HASH = "0000000000000000000000000000000000000000000000000000"

# ── License mapping ──────────────────────────────────────────────────────
LICENSE_MAP = {
    "MIT": "license:expat",
    "Expat": "license:expat",
    "ISC": "license:isc",
    "BSD": "license:bsd-3",
    "BSD-2-Clause": "license:bsd-2",
    "BSD-3-Clause": "license:bsd-3",
    "BSD-2": "license:bsd-2",
    "Zlib": "license:zlib",
    "zlib": "license:zlib",
    "Apache": "license:asl2.0",
    "Apache-2.0": "license:asl2.0",
    "ASL2.0": "license:asl2.0",
    "GPL": "license:gpl3+",
    "GPL2": "license:gpl2",
    "GPL-2.0": "license:gpl2",
    "GPL-2.0-only": "license:gpl2",
    "GPLv2": "license:gpl2",
    "GPL-2.0-or-later": "license:gpl2+",
    "GPL2+": "license:gpl2+",
    "GPLv2+": "license:gpl2+",
    "GPL3": "license:gpl3",
    "GPL-3.0": "license:gpl3",
    "GPL-3.0-only": "license:gpl3",
    "GPLv3": "license:gpl3",
    "GPL-3.0-or-later": "license:gpl3+",
    "GPL3+": "license:gpl3+",
    "GPLv3+": "license:gpl3+",
    "LGPL": "license:lgpl3+",
    "LGPL2.1": "license:lgpl2.1",
    "LGPL-2.1": "license:lgpl2.1",
    "LGPL-2.1-only": "license:lgpl2.1",
    "LGPL-2.1-or-later": "license:lgpl2.1+",
    "LGPL2.1+": "license:lgpl2.1+",
    "LGPL3": "license:lgpl3+",
    "LGPL-3.0": "license:lgpl3+",
    "LGPL-3.0-or-later": "license:lgpl3+",
    "AGPL": "license:agpl3+",
    "AGPL3": "license:agpl3+",
    "AGPL-3.0": "license:agpl3+",
    "AGPL-3.0-only": "license:agpl3",
    "AGPL-3.0-or-later": "license:agpl3+",
    "MPL": "license:mpl2.0",
    "MPL2": "license:mpl2.0",
    "MPL-2.0": "license:mpl2.0",
    "CC0": "license:cc0",
    "CC0-1.0": "license:cc0",
    "Unlicense": "license:unlicense",
    "WTFPL": "license:wtfpl2",
    "public-domain": "license:public-domain",
    "Public Domain": "license:public-domain",
    "Artistic-2.0": "license:artistic2.0",
    "Artistic2.0": "license:artistic2.0",
    "EUPL-1.2": "license:eupl1.2",
    "X11": "license:x11",
    "custom": "license:non-copyleft",
    "custom:PROPRIETARY": "license:non-copyleft",
    "PROPRIETARY": "license:non-copyleft",
    "Boost": "license:boost1.0",
    "BSL-1.0": "license:boost1.0",
}

# ── Build system detection heuristics ────────────────────────────────────

# AUR deps that hint at build system
GO_DEPS = {"go", "go-pie"}
RUST_DEPS = {"rust", "cargo"}
PYTHON_DEPS = {"python", "python-setuptools", "python-build", "python-installer",
               "python-wheel", "python-pip", "python-pipx", "python-poetry",
               "python-hatchling", "python-flit", "python-flit-core",
               "python-setuptools-scm", "python-poetry-core"}
CMAKE_DEPS = {"cmake"}
MESON_DEPS = {"meson", "meson-python"}
NODE_DEPS = {"nodejs", "npm", "yarn", "node-gyp"}
QT_DEPS = {"qt5-base", "qt6-base", "qt5-tools", "qt6-tools"}
JAVA_DEPS = {"java-runtime", "java-environment", "jdk-openjdk", "jre-openjdk",
             "jdk17-openjdk", "jdk21-openjdk"}
DOTNET_DEPS = {"dotnet-runtime", "dotnet-sdk", "aspnet-runtime", "dotnet-runtime-6.0",
               "dotnet-sdk-6.0", "dotnet-runtime-8.0", "dotnet-sdk-8.0"}
ELECTRON_DEPS = {"electron", "electron25", "electron26", "electron27", "electron28",
                 "electron29", "electron30", "electron31", "electron32", "electron33"}
ZIG_DEPS = {"zig"}
BUN_DEPS = {"bun", "bun-bin"}
FLUTTER_DEPS = {"flutter", "flutter-bin", "dart"}

# Packages that are too complex / unsupported build systems
UNSUPPORTED_REASONS = {
    "ELECTRON_COMPLEX": ELECTRON_DEPS,
    "DOTNET_UNSUPPORTED": DOTNET_DEPS,
    "ZIG_NOT_IN_GUIX": ZIG_DEPS,
    "BUN_NOT_IN_GUIX": BUN_DEPS,
    "FLUTTER_UNSUPPORTED": FLUTTER_DEPS,
}

# Packages that map to known Guix GNU packages
AUR_TO_GUIX_INPUTS = {
    "openssl": "openssl",
    "zlib": "zlib",
    "curl": "curl",
    "libcurl": "curl",
    "git": "git",
    "pkg-config": "pkg-config",
    "glib2": "glib",
    "gtk3": "gtk+",
    "gtk4": "gtk",
    "libx11": "libx11",
    "libxcb": "libxcb",
    "wayland": "wayland",
    "dbus": "dbus",
    "systemd-libs": "elogind",
    "libffi": "libffi",
    "sqlite": "sqlite",
    "libxml2": "libxml2",
    "libyaml": "libyaml",
    "pcre": "pcre",
    "pcre2": "pcre2",
    "ncurses": "ncurses",
    "readline": "readline",
    "json-glib": "json-glib",
    "libsoup3": "libsoup",
    "libadwaita": "libadwaita",
    "vte3": "vte",
    "vte-common": "vte",
    "pango": "pango",
    "cairo": "cairo",
    "gdk-pixbuf2": "gdk-pixbuf",
    "libpng": "libpng",
    "libjpeg-turbo": "libjpeg-turbo",
    "freetype2": "freetype",
    "fontconfig": "fontconfig",
    "harfbuzz": "harfbuzz",
    "sdl2": "sdl2",
    "sdl2_mixer": "sdl2-mixer",
    "sdl2_image": "sdl2-image",
    "sdl2_ttf": "sdl2-ttf",
    "sdl2_net": "sdl2-net",
    "alsa-lib": "alsa-lib",
    "pulseaudio": "pulseaudio",
    "pipewire": "pipewire",
    "libsndfile": "libsndfile",
    "ffmpeg": "ffmpeg",
    "gstreamer": "gstreamer",
    "libnotify": "libnotify",
    "libsecret": "libsecret",
    "polkit": "polkit",
    "libusb": "libusb",
    "eudev": "eudev",
    "libcap": "libcap",
    "acl": "acl",
    "lz4": "lz4",
    "zstd": "zstd",
    "xz": "xz",
    "bzip2": "bzip2",
    "gzip": "gzip",
    "libevent": "libevent",
    "boost": "boost",
    "protobuf": "protobuf",
    "grpc": "grpc",
    "libgit2": "libgit2",
    "lua": "lua",
    "perl": "perl",
    "ruby": "ruby",
    "python": "python",
    "tcl": "tcl",
    "expect": "expect",
    "swig": "swig",
    "cmake": "cmake",
    "meson": "meson",
    "gettext": "gettext-minimal",
    "intltool": "intltool",
    "vala": "vala",
    "gobject-introspection": "gobject-introspection",
    "libsodium": "libsodium",
    "gnutls": "gnutls",
    "libtool": "libtool",
    "autoconf": "autoconf",
    "automake": "automake",
    "flex": "flex",
    "bison": "bison",
    "nasm": "nasm",
    "yasm": "yasm",
    "fuse3": "fuse",
    "fuse2": "fuse-2",
    "libarchive": "libarchive",
    "leptonica": "leptonica",
    "tesseract": "tesseract-ocr",
    "imagemagick": "imagemagick",
    "ghostscript": "ghostscript",
    "poppler": "poppler",
    "libwebp": "libwebp",
    "openjpeg2": "openjpeg",
    "libtiff": "libtiff",
    "wxwidgets": "wxwidgets",
    "iproute2": "iproute2",
    "iptables": "iptables",
    "net-tools": "net-tools",
    "openssh": "openssh",
    "rsync": "rsync",
    "wget": "wget",
    "nginx": "nginx",
    "mariadb-libs": "mariadb",
    "postgresql-libs": "postgresql",
    "hiredis": "hiredis",
    "libldap": "openldap",
    "pam": "linux-pam",
    "libxcrypt": "libxcrypt",
    "glibc": "glibc",
    "libglvnd": "mesa",
    "fltk": "fltk",
    "wxgtk3": "wxwidgets",
}


def load_aur_cache():
    """Load AUR metadata cache, return name->entry dict."""
    with open(AUR_CACHE) as f:
        data = json.load(f)
    return {p["Name"]: p for p in data}


def parse_todo_entries(org_path):
    """Parse TODO entries from org file, return list of (line_no, number, name, block)."""
    entries = []
    with open(org_path) as f:
        lines = f.readlines()

    i = 0
    while i < len(lines):
        m = re.match(r'^\*\* TODO (\d+)\.\s+(\S+)', lines[i])
        if m:
            line_no = i + 1  # 1-indexed
            number = int(m.group(1))
            name = m.group(2)
            # Collect the block (until next heading or end)
            block_start = i
            i += 1
            while i < len(lines) and not lines[i].startswith("** "):
                i += 1
            block_end = i
            block = lines[block_start:block_end]
            entries.append({
                "line_no": line_no,
                "number": number,
                "name": name,
                "block": block,
                "block_start": block_start,
                "block_end": block_end,
            })
        else:
            i += 1
    return entries


def load_existing_exports():
    """Load already-exported package symbols."""
    exports = set()
    for path in [PACKAGES_SCM, GENERAL_COMPAT]:
        with open(path) as f:
            content = f.read()
        for m in re.finditer(r're-export\s*\(([^)]+)\)', content):
            for sym in m.group(1).split():
                exports.add(sym.strip())
        for m in re.finditer(r'\(re-export\s+([^\s)]+)', content):
            exports.add(m.group(1).strip())
    # Also check all .scm files for define-public
    pkg_dir = ROOT / "guix" / "gaurix" / "packages"
    for scm in pkg_dir.glob("*.scm"):
        with open(scm) as f:
            for line in f:
                m = re.match(r'\(define-public\s+(\S+)', line)
                if m:
                    exports.add(m.group(1))
    return exports


def guix_name(aur_name):
    """Convert AUR package name to Guix symbol name."""
    return aur_name.lower().replace("_", "-").replace(".", "-")


def clean_version(version_str):
    """Clean AUR version string (remove epoch and pkgrel)."""
    # Remove epoch (e.g., "2:1.3.9A-1" -> "1.3.9A-1")
    if ":" in version_str:
        version_str = version_str.split(":", 1)[1]
    # Remove pkgrel (e.g., "1.3.9A-1" -> "1.3.9A")
    if "-" in version_str:
        version_str = version_str.rsplit("-", 1)[0]
    return version_str


def map_license(aur_licenses):
    """Map AUR license list to Guix license expression."""
    if not aur_licenses:
        return "license:non-copyleft"
    mapped = []
    for lic in aur_licenses:
        lic_clean = lic.strip()
        if lic_clean in LICENSE_MAP:
            mapped.append(LICENSE_MAP[lic_clean])
        else:
            # Try partial matches
            found = False
            for key, val in LICENSE_MAP.items():
                if key.lower() == lic_clean.lower():
                    mapped.append(val)
                    found = True
                    break
            if not found:
                mapped.append("license:non-copyleft")
    # Deduplicate
    mapped = list(dict.fromkeys(mapped))
    if len(mapped) == 1:
        return mapped[0]
    return f"(list {' '.join(mapped)})"


def detect_build_system(aur_entry):
    """Detect appropriate Guix build system from AUR metadata."""
    deps = set()
    for d in aur_entry.get("Depends", []):
        deps.add(d.split(">=")[0].split(">")[0].split("<")[0].split("=")[0].strip())
    makedeps = set()
    for d in aur_entry.get("MakeDepends", []):
        makedeps.add(d.split(">=")[0].split(">")[0].split("<")[0].split("=")[0].strip())
    all_deps = deps | makedeps

    name = aur_entry["Name"]
    url = aur_entry.get("URL", "")

    # Check for unsupported build systems
    for reason, dep_set in UNSUPPORTED_REASONS.items():
        if all_deps & dep_set:
            return None, reason

    # Binary package detection
    if name.endswith("-bin") or name.endswith("-appimage"):
        return "copy", None

    # Go detection
    if all_deps & GO_DEPS or "go" in makedeps:
        return "go", None

    # Rust detection
    if all_deps & RUST_DEPS or "cargo" in makedeps:
        return "cargo", None

    # Python detection
    if (all_deps & PYTHON_DEPS or name.startswith("python-") or
            any(d.startswith("python-") for d in all_deps)):
        return "pyproject", None

    # CMake detection
    if all_deps & CMAKE_DEPS:
        return "cmake", None

    # Meson detection
    if all_deps & MESON_DEPS:
        return "meson", None

    # Node.js detection
    if all_deps & NODE_DEPS or name.startswith("nodejs-"):
        return "node", None

    # Java detection - complex
    if all_deps & JAVA_DEPS:
        return None, "JAVA_COMPLEX"

    # Qt detection -> cmake usually
    if all_deps & QT_DEPS:
        return "cmake", None

    # Font packages
    if name.startswith("ttf-") or name.startswith("otf-") or name.endswith("-fonts"):
        return "font", None

    # Default to gnu
    return "gnu", None


def guess_source_url(aur_entry):
    """Guess the source download URL from AUR metadata."""
    url = aur_entry.get("URL") or ""
    name = aur_entry["Name"]
    version = clean_version(aur_entry.get("Version") or "0")

    # Strip -bin, -git suffixes for source detection
    base_name = name
    is_bin = name.endswith("-bin")
    is_git = name.endswith("-git")

    if is_bin:
        base_name = name[:-4]
    elif is_git:
        base_name = name[:-4]

    # GitHub releases for binary packages
    if "github.com" in url:
        parts = url.rstrip("/").split("/")
        if len(parts) >= 5:
            owner = parts[3]
            repo = parts[4]
            if is_bin:
                return ("url-fetch",
                        f'(string-append "https://github.com/{owner}/{repo}/releases/download/v" version "/{base_name}-" version "-linux-x86_64.tar.gz")',
                        f"https://github.com/{owner}/{repo}")
            else:
                return ("git-fetch",
                        f"https://github.com/{owner}/{repo}",
                        f"https://github.com/{owner}/{repo}")

    # GitLab
    if "gitlab" in url:
        if is_git:
            return ("git-fetch", url, url)
        return ("url-fetch",
                f'(string-append "{url}/-/archive/v" version "/{base_name}-" version ".tar.gz")',
                url)

    # For other URLs, try tarball from URL
    if url:
        if is_bin:
            return ("url-fetch", f'"{url}"', url)
        if is_git:
            return ("git-fetch", url, url)
        return ("url-fetch",
                f'(string-append "{url}/archive/v" version ".tar.gz")',
                url)

    return None, None, None


def map_deps_to_guix(aur_deps):
    """Map AUR dependency names to Guix package names."""
    inputs = []
    native_inputs = []
    unmapped = []
    for dep_raw in aur_deps:
        dep = dep_raw.split(">=")[0].split(">")[0].split("<")[0].split("=")[0].strip()
        if dep in AUR_TO_GUIX_INPUTS:
            guix_dep = AUR_TO_GUIX_INPUTS[dep]
            # Build-time tools go to native-inputs
            if guix_dep in ("pkg-config", "cmake", "meson", "autoconf", "automake",
                            "libtool", "gettext-minimal", "intltool", "flex", "bison",
                            "nasm", "yasm", "swig", "gobject-introspection", "vala"):
                native_inputs.append(guix_dep)
            else:
                inputs.append(guix_dep)
        elif dep in ("gcc", "gcc-libs", "bash", "coreutils", "make", "sed", "grep",
                     "gawk", "diffutils", "findutils", "file", "which", "patch",
                     "tar", "gzip"):
            pass  # Implicit in gnu-build-system
        elif dep.startswith("lib32-"):
            pass  # Skip lib32 packages
        elif dep in ("sh", "filesystem", "linux-api-headers"):
            pass  # Skip system packages
        else:
            unmapped.append(dep)
    return list(dict.fromkeys(inputs)), list(dict.fromkeys(native_inputs)), unmapped


def generate_package_def(pkg_info):
    """Generate a Guix package definition string."""
    name = pkg_info["guix_name"]
    version = pkg_info["version"]
    build_sys = pkg_info["build_system"]
    license_expr = pkg_info["license"]
    synopsis = pkg_info["synopsis"]
    description = pkg_info["description"]
    home_page = pkg_info["home_page"]
    source_method = pkg_info["source_method"]
    source_uri = pkg_info["source_uri"]
    inputs = pkg_info.get("inputs", [])
    native_inputs = pkg_info.get("native_inputs", [])

    lines = []
    lines.append(f"(define-public {name}")
    lines.append(f"  (package")
    lines.append(f'    (name "{name}")')
    lines.append(f'    (version "{version}")')

    # Source
    if source_method == "git-fetch":
        lines.append(f"    (source (origin")
        lines.append(f"              (method git-fetch)")
        lines.append(f"              (uri (git-reference")
        lines.append(f'                    (url "{source_uri}")')
        lines.append(f'                    (commit (string-append "v" version))))')
        lines.append(f"              (file-name (git-file-name name version))")
        lines.append(f"              (sha256")
        lines.append(f'               (base32 "{PLACEHOLDER_HASH}"))))')
    elif source_method == "url-fetch":
        lines.append(f"    (source (origin")
        lines.append(f"              (method url-fetch)")
        lines.append(f"              (uri {source_uri})")
        lines.append(f"              (sha256")
        lines.append(f'               (base32 "{PLACEHOLDER_HASH}"))))')
    else:
        lines.append(f"    (source #f)")

    # Build system
    bs_map = {
        "gnu": "gnu-build-system",
        "cmake": "cmake-build-system",
        "meson": "meson-build-system",
        "pyproject": "pyproject-build-system",
        "python": "python-build-system",
        "cargo": "cargo-build-system",
        "go": "go-build-system",
        "copy": "copy-build-system",
        "node": "node-build-system",
        "font": "font-build-system",
        "trivial": "trivial-build-system",
    }
    bs_name = bs_map.get(build_sys, "gnu-build-system")
    lines.append(f"    (build-system {bs_name})")

    # Arguments
    if build_sys == "copy":
        lines.append(f"    (arguments")
        lines.append(f"     (list")
        lines.append(f"      #:install-plan")
        lines.append(f'      #~\'(("{name}" "bin/{name}"))))')
    elif build_sys == "go":
        lines.append(f"    (arguments")
        lines.append(f"     (list")
        lines.append(f'      #:import-path "{pkg_info.get("go_import_path", home_page.replace("https://", ""))}"')
        lines.append(f"      #:tests? #f))")
    elif build_sys == "font":
        pass  # font-build-system handles it
    else:
        lines.append(f"    (arguments (list #:tests? #f))")

    # Native inputs
    if build_sys == "pyproject":
        ni = ["python-setuptools", "python-wheel"]
        for x in native_inputs:
            if x not in ni:
                ni.append(x)
        native_inputs = ni

    if native_inputs:
        ni_str = " ".join(native_inputs)
        lines.append(f"    (native-inputs (list {ni_str}))")

    # Inputs
    if inputs:
        inp_str = " ".join(inputs)
        lines.append(f"    (inputs (list {inp_str}))")

    # Metadata
    lines.append(f'    (synopsis "{synopsis}")')
    # Escape description for Scheme
    desc_escaped = description.replace("\\", "\\\\").replace('"', '\\"')
    lines.append(f'    (description "{desc_escaped}")')
    lines.append(f'    (home-page "{home_page}")')
    lines.append(f"    (license {license_expr})))")

    return "\n".join(lines)


def generate_module_file(resolved_pkgs, blocked_pkgs):
    """Generate the complete .scm module file."""
    # Collect needed build systems
    build_systems = set()
    needs_git_download = False
    needs_url_fetch = False
    needed_gnu_modules = set()

    for pkg in resolved_pkgs:
        build_systems.add(pkg["build_system"])
        if pkg["source_method"] == "git-fetch":
            needs_git_download = True
        if pkg["source_method"] == "url-fetch":
            needs_url_fetch = True
        for inp in pkg.get("inputs", []) + pkg.get("native_inputs", []):
            # Map input names to GNU modules
            mod = input_to_module(inp)
            if mod:
                needed_gnu_modules.add(mod)

    lines = []
    lines.append(";;; GNU Guix --- Functional package management for GNU")
    lines.append(";;; Copyright (C) 2026 Gaurix Contributors")
    lines.append(";;;")
    lines.append(f";;; Recipe resolver pass --- {PASS_ID}")
    lines.append(f";;; Resolves 100 TODO packages.")
    lines.append(";;;")
    lines.append(f";;; New recipes ({len(resolved_pkgs)}):")
    for i, pkg in enumerate(resolved_pkgs, 1):
        lines.append(f";;;      {i:>3}.  {pkg['aur_name']} ({bs_display(pkg['build_system'])}, v{pkg['version']}, {pkg['license_short']})")

    if blocked_pkgs:
        lines.append(";;;")
        lines.append(f";;; BLOCKED EXHAUSTED ({len(blocked_pkgs)}):")
        for i, pkg in enumerate(blocked_pkgs, len(resolved_pkgs) + 1):
            lines.append(f";;;      {i:>3}.  {pkg['aur_name']} -> {pkg['block_reason']}: {pkg['block_detail']}")

    lines.append(";;;")
    lines.append(";;; NOTE: All sha256 hashes are placeholders (all zeros).")
    lines.append(";;; Use `guix download` to obtain real hashes.")
    lines.append("")

    # Module definition
    lines.append(f"(define-module (gaurix packages {PASS_ID})")
    lines.append("  #:use-module (guix packages)")
    if needs_url_fetch:
        lines.append("  #:use-module (guix download)")
    if needs_git_download:
        lines.append("  #:use-module (guix git-download)")
    lines.append("  #:use-module (guix gexp)")
    lines.append("  #:use-module (guix utils)")

    # Build system modules
    bs_module_map = {
        "gnu": "(guix build-system gnu)",
        "cmake": "(guix build-system cmake)",
        "meson": "(guix build-system meson)",
        "pyproject": "(guix build-system pyproject)",
        "python": "(guix build-system python)",
        "cargo": "(guix build-system cargo)",
        "go": "(guix build-system go)",
        "copy": "(guix build-system copy)",
        "node": "(guix build-system node)",
        "font": "(guix build-system font)",
        "trivial": "(guix build-system trivial)",
    }
    for bs in sorted(build_systems):
        if bs in bs_module_map:
            lines.append(f"  #:use-module {bs_module_map[bs]}")

    lines.append("  #:use-module ((guix licenses) #:prefix license:)")

    # GNU package modules
    for mod in sorted(needed_gnu_modules):
        lines.append(f"  #:use-module (gnu packages {mod})")

    # Exports
    lines.append("  #:export (")
    for pkg in resolved_pkgs:
        lines.append(f"            {pkg['guix_name']}")
    lines.append("            ))")
    lines.append("")

    # Package definitions
    for i, pkg in enumerate(resolved_pkgs):
        lines.append(f";;; -------------------------------------------------------------------")
        lines.append(f";;; {i+1}. {pkg['aur_name']} --- {pkg['synopsis']}")
        lines.append(f";;; -------------------------------------------------------------------")
        lines.append(generate_package_def(pkg))
        lines.append("")

    return "\n".join(lines)


def generate_blocked_notes(blocked_pkgs):
    """Generate blocked notes .scm file."""
    lines = []
    lines.append(f";;; {PASS_ID} --- Blocked/exhausted package notes")
    lines.append(";;;")
    for pkg in blocked_pkgs:
        lines.append(f";;; {pkg['aur_name']}: {pkg['block_reason']} --- {pkg['block_detail']}")
    lines.append("")
    return "\n".join(lines)


def bs_display(bs):
    """Display name for a build system."""
    return {
        "gnu": "gnu-build-system",
        "cmake": "cmake-build-system",
        "meson": "meson-build-system",
        "pyproject": "pyproject-build-system",
        "python": "python-build-system",
        "cargo": "cargo-build-system",
        "go": "go-build-system",
        "copy": "copy-build-system",
        "node": "node-build-system",
        "font": "font-build-system",
        "trivial": "trivial-build-system",
    }.get(bs, f"{bs}-build-system")


def input_to_module(inp_name):
    """Map a Guix input name to its GNU packages module."""
    module_map = {
        "openssl": "tls",
        "gnutls": "tls",
        "zlib": "compression",
        "lz4": "compression",
        "zstd": "compression",
        "xz": "compression",
        "bzip2": "compression",
        "gzip": "compression",
        "libarchive": "compression",
        "curl": "curl",
        "git": "version-control",
        "libgit2": "version-control",
        "pkg-config": "pkg-config",
        "glib": "glib",
        "json-glib": "gnome",
        "gtk+": "gtk",
        "gtk": "gtk",
        "libadwaita": "gnome",
        "vte": "gnome",
        "libnotify": "gnome",
        "libsecret": "gnome",
        "gobject-introspection": "glib",
        "libx11": "xorg",
        "libxcb": "xorg",
        "wayland": "freedesktop",
        "dbus": "glib",
        "elogind": "linux",
        "libffi": "libffi",
        "sqlite": "databases",
        "mariadb": "databases",
        "postgresql": "databases",
        "hiredis": "databases",
        "libxml2": "xml",
        "libyaml": "serialization",
        "pcre": "pcre",
        "pcre2": "pcre",
        "ncurses": "ncurses",
        "readline": "readline",
        "libsoup": "gnome",
        "pango": "gtk",
        "cairo": "gtk",
        "gdk-pixbuf": "gtk",
        "libpng": "image",
        "libjpeg-turbo": "image",
        "libwebp": "image",
        "openjpeg": "image",
        "libtiff": "image",
        "imagemagick": "imagemagick",
        "freetype": "fontutils",
        "fontconfig": "fontutils",
        "harfbuzz": "gtk",
        "sdl2": "sdl",
        "sdl2-mixer": "sdl",
        "sdl2-image": "sdl",
        "sdl2-ttf": "sdl",
        "sdl2-net": "sdl",
        "alsa-lib": "linux",
        "pulseaudio": "pulseaudio",
        "pipewire": "linux",
        "libsndfile": "audio",
        "ffmpeg": "video",
        "gstreamer": "gstreamer",
        "polkit": "polkit",
        "libusb": "libusb",
        "eudev": "linux",
        "libcap": "linux",
        "acl": "acl",
        "libevent": "libevent",
        "boost": "boost",
        "protobuf": "protobuf",
        "grpc": "protobuf",
        "lua": "lua",
        "perl": "perl",
        "ruby": "ruby",
        "python": "python",
        "python-setuptools": "python-build",
        "python-wheel": "python-build",
        "python-setuptools-scm": "python-build",
        "python-poetry-core": "python-build",
        "python-flit-core": "python-build",
        "python-hatchling": "python-build",
        "tcl": "tcl",
        "expect": "tcl",
        "swig": "swig",
        "cmake": "cmake",
        "meson": "build-tools",
        "gettext-minimal": "gettext",
        "intltool": "gettext",
        "vala": "vala",
        "libtool": "autotools",
        "autoconf": "autotools",
        "automake": "autotools",
        "flex": "flex",
        "bison": "bison",
        "nasm": "assembly",
        "yasm": "assembly",
        "fuse": "linux",
        "fuse-2": "linux",
        "leptonica": "image-processing",
        "tesseract-ocr": "ocr",
        "ghostscript": "ghostscript",
        "poppler": "pdf",
        "wxwidgets": "wxwidgets",
        "iproute2": "linux",
        "iptables": "linux",
        "net-tools": "networking",
        "openssh": "ssh",
        "rsync": "rsync",
        "wget": "wget",
        "nginx": "web",
        "openldap": "openldap",
        "linux-pam": "linux",
        "libxcrypt": "linux",
        "glibc": "base",
        "mesa": "gl",
        "fltk": "fltk",
        "libsodium": "gnupg",
    }
    return module_map.get(inp_name)


def sanitize_synopsis(desc, name):
    """Create a clean synopsis from AUR description."""
    if not desc:
        desc = f"{name} package"
    # Truncate to 80 chars, ensure lowercase start (unless proper noun)
    desc = desc.strip()
    # Remove trailing period
    if desc.endswith("."):
        desc = desc[:-1]
    # Lowercase first char unless it's an acronym or proper noun
    if desc and desc[0].isupper():
        # Check if it's likely a proper noun/acronym
        words = desc.split()
        if words and len(words[0]) <= 1:
            desc = desc[0].lower() + desc[1:]
        elif words and not words[0].isupper():
            desc = desc[0].lower() + desc[1:]
    # Truncate
    if len(desc) > 76:
        desc = desc[:73] + "..."
    # Escape quotes
    desc = desc.replace('"', '\\"')
    return desc


def sanitize_description(desc, name):
    """Create a proper multi-sentence description."""
    if not desc:
        return f"{name.capitalize()} is a software package."
    desc = desc.strip()
    if not desc.endswith("."):
        desc += "."
    # Ensure first letter is capitalized
    if desc and desc[0].islower():
        desc = desc[0].upper() + desc[1:]
    # Escape quotes
    desc = desc.replace('"', '\\"')
    return desc


def update_org_file(org_path, results):
    """Update the org file with DONE/BLOCKED statuses."""
    with open(org_path) as f:
        lines = f.readlines()

    for result in results:
        entry = result["entry"]
        status = result["status"]
        detail = result["detail"]
        block_start = entry["block_start"]

        # Update the heading line
        old_heading = lines[block_start]
        name = entry["name"]
        number = entry["number"]

        if status == "DONE":
            new_heading = f"** DONE {number}. {name}  :{PASS_ID}:recipe-generated:\n"
        else:
            new_heading = f"** DONE {number}. {name} [BLOCKED: {detail}]  :{PASS_ID}:\n"

        lines[block_start] = new_heading

        # Add status line before the end of the block
        insert_idx = entry["block_end"] - 1
        # Find last non-empty line in block
        while insert_idx > block_start and lines[insert_idx].strip() == "":
            insert_idx -= 1
        insert_idx += 1

        status_line = f"   - Status: {status}: {detail} ({PASS_ID})\n"
        todo_status_line = f"   - TODO Status: {status}\n"

        lines.insert(insert_idx, status_line)
        lines.insert(insert_idx + 1, todo_status_line)

        # Adjust subsequent entries' indices (they shifted by 2)
        for other in results:
            if other["entry"]["block_start"] > block_start:
                other["entry"]["block_start"] += 2
                other["entry"]["block_end"] += 2

    # Write atomically
    tmp_fd, tmp_path = tempfile.mkstemp(dir=os.path.dirname(org_path), suffix=".org.tmp")
    try:
        with os.fdopen(tmp_fd, "w") as f:
            f.writelines(lines)
        shutil.move(tmp_path, org_path)
    except Exception:
        os.unlink(tmp_path)
        raise

    print(f"[{PASS_ID}] Updated {org_path}: {len(results)} entries")


def update_packages_scm(exports):
    """Append re-export section to packages.scm."""
    content = PACKAGES_SCM.read_text()

    new_section = f"""
;; {PASS_ID} ({len(exports)} TODO resolved)
(define-module (gaurix packages)
  #:use-module (gaurix packages {PASS_ID})
  #:re-export (
"""
    for exp in exports:
        new_section += f"               {exp}\n"
    new_section += "               ))\n"
    content += new_section

    tmp_fd, tmp_path = tempfile.mkstemp(dir=str(PACKAGES_SCM.parent), suffix=".scm.tmp")
    try:
        with os.fdopen(tmp_fd, "w") as f:
            f.write(content)
        shutil.move(tmp_path, str(PACKAGES_SCM))
    except Exception:
        os.unlink(tmp_path)
        raise

    print(f"[{PASS_ID}] Updated packages.scm: added {len(exports)} re-exports")


def update_general_compat(exports):
    """Add module import and re-exports to general-compat.scm."""
    with open(GENERAL_COMPAT) as f:
        lines = f.readlines()

    # Find last #:use-module line to insert after
    last_use_idx = -1
    for i in range(len(lines) - 1, -1, -1):
        if "#:use-module" in lines[i]:
            last_use_idx = i
            break

    if last_use_idx >= 0:
        lines.insert(last_use_idx + 1,
                      f"  #:use-module (gaurix packages {PASS_ID})\n")

    # Ensure trailing newline
    if lines and not lines[-1].endswith("\n"):
        lines[-1] += "\n"

    # Append re-exports
    lines.append(f"\n;;; {PASS_ID}\n")
    for exp in exports:
        lines.append(f"(re-export {exp})\n")

    tmp_fd, tmp_path = tempfile.mkstemp(dir=str(GENERAL_COMPAT.parent), suffix=".scm.tmp")
    try:
        with os.fdopen(tmp_fd, "w") as f:
            f.writelines(lines)
        shutil.move(tmp_path, str(GENERAL_COMPAT))
    except Exception:
        os.unlink(tmp_path)
        raise

    print(f"[{PASS_ID}] Updated general-compat.scm: added use-module + {len(exports)} re-exports")


def main():
    print(f"=== {PASS_ID} ===")

    # Step 1: Load data
    print("Loading AUR cache...")
    aur_index = load_aur_cache()
    print(f"  AUR cache: {len(aur_index)} packages")

    print("Loading existing exports...")
    existing_exports = load_existing_exports()
    print(f"  Existing exports: {len(existing_exports)} symbols")

    print("Parsing TODO entries...")
    todo_entries = parse_todo_entries(ORG_FILE)
    print(f"  TODO entries: {len(todo_entries)}")

    # Step 2: Select candidates
    # Filter: must be in AUR, not already exported, not a lib32- package
    candidates = []
    for entry in todo_entries:
        name = entry["name"]
        gname = guix_name(name)

        # Skip if already exported
        if gname in existing_exports:
            continue
        # Skip lib32 packages (Guix doesn't need them)
        if name.startswith("lib32-"):
            continue
        # Skip linux kernel/headers packages
        if name.startswith("linux-") and ("headers" in name or "docs" in name):
            continue

        # Look up in AUR
        aur = aur_index.get(name)
        if not aur:
            continue

        # Detect build system
        build_sys, block_reason = detect_build_system(aur)

        entry["aur"] = aur
        entry["build_system"] = build_sys
        entry["block_reason"] = block_reason
        candidates.append(entry)

    print(f"  Viable candidates: {len(candidates)}")

    # Prioritize: prefer packages with fewer deps, higher AUR votes
    def sort_key(e):
        aur = e["aur"]
        deps = len(aur.get("Depends", []))
        votes = aur.get("NumVotes", 0)
        # Prefer: packageable (no block), fewer deps, more votes
        blocked = 0 if e["build_system"] else 1
        return (blocked, deps, -votes)

    candidates.sort(key=sort_key)

    # Select top 100
    selected = candidates[:100]
    print(f"  Selected: {len(selected)}")

    # Step 3: Process each package
    resolved_pkgs = []
    blocked_pkgs = []
    results = []

    for entry in selected:
        name = entry["name"]
        aur = entry["aur"]
        build_sys = entry["build_system"]
        block_reason = entry["block_reason"]
        gname = guix_name(name)
        version = clean_version(aur.get("Version", "0.0.0"))
        desc = aur.get("Description", "")

        if build_sys is None:
            # Blocked
            blocked_pkgs.append({
                "aur_name": name,
                "guix_name": gname,
                "block_reason": block_reason,
                "block_detail": desc[:100] if desc else "unsupported build system",
            })
            results.append({
                "entry": entry,
                "status": "BLOCKED",
                "detail": f"{block_reason}: {desc[:80]}",
            })
            continue

        # Get source URL
        source_method, source_uri, home_page = guess_source_url(aur)
        if not home_page:
            home_page = aur.get("URL", f"https://aur.archlinux.org/packages/{name}")
        if not source_uri:
            source_method = "url-fetch"
            source_uri = f'"https://aur.archlinux.org/packages/{name}"'

        # Map dependencies
        inputs, native_inputs, unmapped = map_deps_to_guix(aur.get("Depends", []))

        # License
        license_expr = map_license(aur.get("License", []))
        license_short = aur.get("License", ["unknown"])[0] if aur.get("License") else "unknown"

        # Synopsis & description
        synopsis = sanitize_synopsis(desc, name)
        description = sanitize_description(desc, name)

        # Go import path
        go_import_path = ""
        if build_sys == "go" and "github.com" in home_page:
            go_import_path = home_page.replace("https://", "").replace("http://", "").rstrip("/")

        pkg_info = {
            "aur_name": name,
            "guix_name": gname,
            "version": version,
            "build_system": build_sys,
            "license": license_expr,
            "license_short": license_short,
            "synopsis": synopsis,
            "description": description,
            "home_page": home_page,
            "source_method": source_method,
            "source_uri": source_uri,
            "inputs": inputs,
            "native_inputs": native_inputs,
            "unmapped_deps": unmapped,
            "go_import_path": go_import_path,
        }

        resolved_pkgs.append(pkg_info)
        results.append({
            "entry": entry,
            "status": "DONE",
            "detail": f"recipe in {PASS_ID}.scm ({gname} v{version}, {bs_display(build_sys)})",
        })

    print(f"\n  Resolved: {len(resolved_pkgs)}")
    print(f"  Blocked:  {len(blocked_pkgs)}")

    # Step 4: Generate .scm file
    print(f"\nGenerating {SCM_FILE}...")
    scm_content = generate_module_file(resolved_pkgs, blocked_pkgs)
    with open(SCM_FILE, "w") as f:
        f.write(scm_content)
    print(f"  Written: {len(scm_content)} bytes")

    # Step 5: Generate blocked notes
    if blocked_pkgs:
        print(f"Generating {BLOCKED_NOTES}...")
        notes = generate_blocked_notes(blocked_pkgs)
        with open(BLOCKED_NOTES, "w") as f:
            f.write(notes)

    # Step 6: Update org file
    print(f"\nUpdating {ORG_FILE}...")
    update_org_file(ORG_FILE, results)

    # Step 7: Update packages.scm
    print(f"\nUpdating {PACKAGES_SCM}...")
    export_names = [p["guix_name"] for p in resolved_pkgs]
    update_packages_scm(export_names)

    # Step 8: Update general-compat.scm
    print(f"\nUpdating {GENERAL_COMPAT}...")
    update_general_compat(export_names)

    # Step 9: Write summary report
    summary = {
        "pass_id": PASS_ID,
        "total_selected": len(selected),
        "resolved": len(resolved_pkgs),
        "blocked": len(blocked_pkgs),
        "resolved_packages": [
            {"name": p["guix_name"], "aur_name": p["aur_name"],
             "version": p["version"], "build_system": p["build_system"],
             "license": p["license_short"]}
            for p in resolved_pkgs
        ],
        "blocked_packages": [
            {"name": p["aur_name"], "reason": p["block_reason"],
             "detail": p["block_detail"]}
            for p in blocked_pkgs
        ],
        "failed": len(blocked_pkgs),
    }

    os.makedirs(SUMMARY_FILE.parent, exist_ok=True)
    with open(SUMMARY_FILE, "w") as f:
        json.dump(summary, f, indent=2)

    # AUR lookup report
    aur_lookup = {
        "pass_id": PASS_ID,
        "lookups": [
            {"name": e["name"], "found": e["name"] in aur_index,
             "version": aur_index.get(e["name"], {}).get("Version", ""),
             "url": aur_index.get(e["name"], {}).get("URL", "")}
            for e in selected
        ]
    }
    with open(AUR_LOOKUP_FILE, "w") as f:
        json.dump(aur_lookup, f, indent=2)

    # Selection report
    selection = {
        "pass_id": PASS_ID,
        "selected": [e["name"] for e in selected],
    }
    with open(SELECTION_FILE, "w") as f:
        json.dump(selection, f, indent=2)

    # Print summary
    print(f"\n{'='*60}")
    print(f"  {PASS_ID} SUMMARY")
    print(f"{'='*60}")
    print(f"  Selected:  {len(selected)}")
    print(f"  Resolved:  {len(resolved_pkgs)}")
    print(f"  Blocked:   {len(blocked_pkgs)}")
    print(f"{'='*60}")

    if blocked_pkgs:
        # Group by reason
        by_reason = {}
        for bp in blocked_pkgs:
            r = bp["block_reason"]
            by_reason.setdefault(r, []).append(bp["aur_name"])
        print("\n  Blockers by reason:")
        for reason, names in sorted(by_reason.items()):
            print(f"    {reason}: {len(names)}")
            for n in names[:5]:
                print(f"      - {n}")
            if len(names) > 5:
                print(f"      ... and {len(names)-5} more")

    print(f"\n  Exports added: {len(export_names)}")
    print(f"  Files written:")
    print(f"    - {SCM_FILE}")
    if blocked_pkgs:
        print(f"    - {BLOCKED_NOTES}")
    print(f"    - {SUMMARY_FILE}")
    print(f"    - {AUR_LOOKUP_FILE}")
    print(f"    - {SELECTION_FILE}")
    print(f"    - {PACKAGES_SCM} (updated)")
    print(f"    - {GENERAL_COMPAT} (updated)")
    print(f"    - {ORG_FILE} (updated)")


if __name__ == "__main__":
    main()
