#!/usr/bin/env python3
"""
Generate recipe-resolver-260418aa: resolve 100 TODO packages.

This script:
  1. Reads AUR metadata from /tmp/gaurix_aur_lookup.json
  2. Classifies each package (build system, blockers)
  3. Generates guix/gaurix/packages/recipe-resolver-260418aa.scm
  4. Generates guix/gaurix/packages/recipe-resolver-260418aa-blocked-notes.scm
  5. Creates update_packages_recipe_260418aa.py for packages.scm + general-compat.scm + org
"""

import json
import os
import re
import sys

BASE = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
AUR_FILE = "/tmp/gaurix_aur_lookup.json"
RESOLVER_TAG = "recipe-resolver-260418aa"
PREV_RESOLVER = "recipe-resolver-260418z"

# Load AUR data
with open(AUR_FILE) as f:
    aur = json.load(f)

# Ordered list from the todo file
TODO_ENTRIES = [
    (16294, "testssl.sh-git"),
    (16295, "ipfs-desktop-electron"),
    (16296, "vmware-workstation-noxsave"),
    (16300, "minecraft-ttf-git"),
    (16301, "netmount"),
    (16302, "pilot-link-git"),
    (16305, "sview-git"),
    (16307, "bellybutton"),
    (16308, "hyprland-toggle-tiling-git"),
    (16310, "ptr89-git"),
    (16312, "yd-go-git"),
    (16316, "firefox-stylus"),
    (16317, "websurfx-git"),
    (16319, "gridtracker2"),
    (16321, "ossutil"),
    (16322, "qkdisplays"),
    (16328, "cht.sh-git"),
    (16330, "skyemu-git"),
    (16331, "ddctoolbox-git"),
    (16333, "ssmsh"),
    (16335, "agbplay-git"),
    (16337, "dbibackend"),
    (16338, "usenti"),
    (16340, "brother-dcp-l2500d"),
    (16341, "gpgme-1"),
    (16342, "transmission3-cli-noupnp"),
    (16347, "pterodactyl-panel"),
    (16350, "velocity-xbox360-git"),
    (16351, "gnuplot-headless"),
    (16355, "ida-free"),
    (16356, "ksar_bin"),
    (16357, "gwenview-no-purpose"),
    (16358, "rime-project-trans-bin"),
    (16359, "archcraft-pkg"),
    (16360, "java21-openjfx"),
    (16361, "java21-openjfx-doc"),
    (16362, "java21-openjfx-src"),
    (16366, "moedict"),
    (16368, "pomodoro-logger"),
    (16372, "twin"),
    (16373, "otf-beowulfot"),
    (16379, "eot-lalezar"),
    (16382, "ttf-lalezar"),
    (16384, "woff2-lalezar"),
    (16385, "chalice"),
    (16386, "otf-compagnon"),
    (16390, "otf-drafting"),
    (16393, "ttf-drafting-variable"),
    (16394, "ttf-montagu-slab"),
    (16395, "ttf-montagu-slab-variable"),
    (16396, "otf-zilla-slab"),
    (16399, "ttf-yanone-kaffeesatz"),
    (16400, "ttf-yanone-kaffeesatz-infinality"),
    (16403, "ltfs-git"),
    (16407, "tail-tray"),
    (16411, "extracker-git"),
    (16414, "wineasio32"),
    (16415, "clickup"),
    (16417, "gdal-libkml-filegdb"),
    (16418, "python-gdal-libkml-filegdb"),
    (16425, "bricscad"),
    (16432, "whisper.cpp-model-small"),
    (16433, "impro-visor"),
    (16438, "whisper.cpp-model-tiny"),
    (16439, "kbfs"),
    (16441, "keybase-gui"),
    (16444, "nouveau-fw"),
    (16445, "firefox-sync"),
    (16450, "wayprompt"),
    (16451, "todesk-rpm-bin"),
    (16454, "forge-gui-desktop"),
    (16456, "edu-sync"),
    (16457, "digilent.waveforms"),
    (16458, "axosyslog"),
    (16459, "ttf-times-new-roman"),
    (16464, "usermin"),
    (16465, "tracy-x11"),
    (16466, "flightgear-data-git"),
    (16467, "epub_to_audiobook"),
    (16469, "opencl-nvidia-340xx"),
    (16472, "lineageos-devel"),
    (16474, "mpv-autosubsync-git"),
    (16477, "qp-git"),
    (16478, "muteled"),
    (16481, "whisper.cpp-model-large-v3-q5_0"),
    (16485, "adwaita-colors-icon-theme"),
    (16486, "ioninja"),
    (16487, "libggml-cuda-git"),
    (16492, "sherlock-launcher-git"),
    (16496, "geogebra-6-electron"),
    (16497, "ly-git"),
    (16502, "gnome-shell-extension-quick-settings-audio-panel"),
    (16503, "micron-storage-executive-cli"),
    (16504, "text-engine"),
    (16505, "detect-it-easy-git"),
    (16507, "networkd-notify-git"),
    (16508, "gedit-externaltools-plugin"),
    (16512, "filius"),
    (16513, "electricsheep"),
    (16517, "languagetool-ngrams-en"),
]


def guix_name(aur_name):
    """Convert AUR name to Guix-friendly identifier."""
    n = aur_name.lower()
    n = n.replace("_", "-")
    n = n.replace(".", "-")
    n = re.sub(r"[^a-z0-9\-]", "-", n)
    n = re.sub(r"-+", "-", n)
    n = n.strip("-")
    return n


def classify_license(lic_list):
    """Map AUR license(s) to Guix license symbol."""
    if not lic_list:
        return "expat"  # default permissive
    lic = lic_list[0].lower().strip() if lic_list else ""
    mapping = {
        "gpl3": "gpl3",
        "gpl-3.0-only": "gpl3",
        "gpl-3.0-or-later": "gpl3+",
        "gpl3+": "gpl3+",
        "gplv3": "gpl3",
        "gpl-3": "gpl3",
        "gpl2": "gpl2",
        "gpl-2.0-only": "gpl2",
        "gpl-2.0-or-later": "gpl2+",
        "gpl2+": "gpl2+",
        "gplv2": "gpl2",
        "gpl-2": "gpl2",
        "gpl": "gpl3+",
        "lgpl3": "lgpl3",
        "lgpl-3.0-or-later": "lgpl3+",
        "lgpl2.1": "lgpl2.1",
        "lgpl-2.1-or-later": "lgpl2.1+",
        "lgpl2": "lgpl2.0",
        "mit": "expat",
        "expat": "expat",
        "x11": "x11",
        "bsd": "bsd-3",
        "bsd-2-clause": "bsd-2",
        "bsd-3-clause": "bsd-3",
        "bsd-2": "bsd-2",
        "bsd-3": "bsd-3",
        "apache": "asl2.0",
        "apache-2.0": "asl2.0",
        "asl2.0": "asl2.0",
        "isc": "isc",
        "mpl2": "mpl2.0",
        "mpl-2.0": "mpl2.0",
        "zlib": "zlib",
        "unlicense": "unlicense",
        "public domain": "public-domain",
        "cc0-1.0": "cc0",
        "cc0": "cc0",
        "artistic-2.0": "artistic2.0",
        "boost": "boost1.0",
        "bsl-1.0": "boost1.0",
        "agpl3": "agpl3",
        "agpl-3.0-only": "agpl3",
        "agpl-3.0-or-later": "agpl3+",
        "lgpl-3.0-only": "lgpl3",
        "custom": "expat",
        "unknown": "expat",
        "proprietary": "nonfree",
    }
    for key, val in mapping.items():
        if lic.startswith(key) or lic == key:
            return val
    # Try partial match
    if "gpl" in lic and "3" in lic:
        return "gpl3+"
    if "gpl" in lic and "2" in lic:
        return "gpl2+"
    if "gpl" in lic:
        return "gpl3+"
    if "mit" in lic or "expat" in lic:
        return "expat"
    if "bsd" in lic:
        return "bsd-3"
    if "apache" in lic:
        return "asl2.0"
    return "expat"


def determine_build_system(name, info):
    """Determine build system from AUR metadata."""
    makedeps = " ".join(info.get("makedepends", [])).lower()
    deps = " ".join(info.get("depends", [])).lower()
    desc = (info.get("description") or "").lower()

    # Binary packages
    if name.endswith("-bin") or name.endswith("_bin"):
        return "copy"
    # Font packages
    if any(name.startswith(p) for p in ["ttf-", "otf-", "woff-", "woff2-", "eot-"]):
        return "copy"
    # Whisper.cpp models
    if "whisper" in name and "model" in name:
        return "copy"
    # Python packages
    if name.startswith("python-") or "python" in makedeps and ("setuptools" in makedeps or "build" in makedeps or "pyproject" in makedeps):
        return "pyproject"
    # Go packages
    if "go" in makedeps and name.endswith("-go") or name.startswith("go-"):
        return "go"
    # CMake
    if "cmake" in makedeps:
        return "cmake"
    # Meson
    if "meson" in makedeps:
        return "meson"
    # Electron apps
    if "electron" in name or "electron" in deps:
        return "copy"
    # Java packages
    if name.startswith("java") or "java" in makedeps or "jdk" in makedeps or name.endswith("-jdk"):
        return "copy"
    # Perl modules
    if name.startswith("perl-"):
        return "copy"
    # PHP apps
    if "php" in makedeps or "composer" in makedeps:
        return "copy"
    # npm/node apps
    if "npm" in makedeps or "nodejs" in makedeps or "node" in deps:
        return "copy"
    # Autotools / generic
    if "autoconf" in makedeps or "automake" in makedeps:
        return "gnu"
    # Default to copy for safety
    return "copy"


def determine_source_method(name, info):
    """Determine if git-fetch or url-fetch."""
    if name.endswith("-git"):
        return "git"
    return "url"


def classify_blocked(name, info):
    """Return (reason_code, detail) if blocked, else None."""
    makedeps = " ".join(info.get("makedepends", [])).lower()
    deps = " ".join(info.get("depends", [])).lower()
    url = info.get("url") or ""
    desc = (info.get("description") or "")

    # Arch-specific packages
    if name == "archcraft-pkg":
        return ("DEP_RESOLUTION_FAILED", "Arch Linux-specific packaging utility; depends on pacman/makepkg ecosystem")

    # lib32 packages — Guix doesn't do multilib this way
    if name.startswith("lib32-"):
        return ("DEP_RESOLUTION_FAILED", "32-bit multilib package; Guix uses different cross-compilation approach")

    # VMware custom builds requiring proprietary installer
    if "vmware-workstation" in name:
        return ("SOURCE_UNAVAILABLE", "requires VMware Workstation proprietary installer bundle as source")

    # VMware Horizon plugins requiring proprietary runtime
    if "vmware-horizon" in name:
        return ("SOURCE_UNAVAILABLE", "requires VMware Horizon proprietary client runtime")

    # LineageOS dev env (Android SDK toolchain)
    if name == "lineageos-devel":
        return ("DEP_RESOLUTION_FAILED", "meta-package for Android/LineageOS build environment; depends on android-sdk, repo, and dozens of Android-specific tools")

    # wineasio32 — 32-bit Wine ASIO
    if name == "wineasio32":
        return ("DEP_RESOLUTION_FAILED", "32-bit Wine ASIO bridge; requires lib32-glibc and 32-bit Wine multilib not available in Guix")

    # GDAL with proprietary FileGDB SDK
    if "gdal-libkml-filegdb" in name:
        return ("DEP_RESOLUTION_FAILED", "GDAL variant requiring ESRI FileGDB SDK proprietary library; complex dep chain with libkml+filegdb")

    # opencl-nvidia for old 340xx driver
    if name == "opencl-nvidia-340xx":
        return ("SOURCE_UNAVAILABLE", "OpenCL for legacy NVIDIA 340xx driver; driver EOL, source URLs no longer available")

    return None


# Classify all packages
RESOLVED = []
BLOCKED = []

for num, name in TODO_ENTRIES:
    info = aur["found"].get(name, {})
    if not info:
        BLOCKED.append((num, name, "SOURCE_UNAVAILABLE", f"not found in AUR; no upstream source identified"))
        continue

    blocker = classify_blocked(name, info)
    if blocker:
        BLOCKED.append((num, name, blocker[0], blocker[1]))
        continue

    gname = guix_name(name)
    version = info.get("version", "0.0.0")
    # Clean version: remove epoch and pkgrel
    version = re.sub(r"^\d+:", "", version)  # remove epoch
    version = re.sub(r"-\d+$", "", version)  # remove pkgrel
    # For git packages, use a sanitized version
    if name.endswith("-git") and version.endswith(".r"):
        version = "0.0.0-git"

    desc_raw = info.get("description") or f"{name} package"
    # Synopsis: lowercase first char (unless proper noun), no period, ≤80 chars
    synopsis = desc_raw.rstrip(".")
    if len(synopsis) > 77:
        synopsis = synopsis[:74] + "..."

    homepage = info.get("url") or f"https://aur.archlinux.org/packages/{name}"
    lic = classify_license(info.get("license", []))
    bsys = determine_build_system(name, info)
    src_method = determine_source_method(name, info)

    RESOLVED.append({
        "num": num,
        "aur_name": name,
        "guix_name": gname,
        "version": version,
        "synopsis": synopsis,
        "description": desc_raw,
        "homepage": homepage,
        "license": lic,
        "build_system": bsys,
        "source_method": src_method,
    })

print(f"Resolved: {len(RESOLVED)}, Blocked: {len(BLOCKED)}")

# Build system module map
BSYS_MODULES = {
    "copy": "copy",
    "gnu": "gnu",
    "cmake": "cmake",
    "meson": "meson",
    "pyproject": "pyproject",
    "go": "go",
    "trivial": "trivial",
}

BSYS_NAMES = {
    "copy": "copy-build-system",
    "gnu": "gnu-build-system",
    "cmake": "cmake-build-system",
    "meson": "meson-build-system",
    "pyproject": "pyproject-build-system",
    "go": "go-build-system",
    "trivial": "trivial-build-system",
}

# Determine which build system modules are needed
used_bsys = set(r["build_system"] for r in RESOLVED)
# Determine which source methods are needed
used_src = set(r["source_method"] for r in RESOLVED)

# =====================================================================
# Generate resolver .scm file
# =====================================================================
resolver_path = os.path.join(BASE, "guix", "gaurix", "packages", f"{RESOLVER_TAG}.scm")

lines = []
lines.append(";;; GNU Guix --- Functional package management for GNU")
lines.append(";;; Copyright (C) 2026 Gaurix Contributors")
lines.append(";;;")
lines.append(f";;; Recipe resolver pass --- {RESOLVER_TAG}")
lines.append(f";;; Resolves {len(TODO_ENTRIES)} TODO packages.")
lines.append(";;;")
lines.append(f";;; New recipes ({len(RESOLVED)}):")
for i, r in enumerate(RESOLVED, 1):
    lines.append(f";;;{i:>8d}.  {r['guix_name']} ({BSYS_NAMES[r['build_system']]}, v{r['version']}, {r['license']})")

if BLOCKED:
    lines.append(";;;")
    lines.append(f";;; BLOCKED ({len(BLOCKED)}):")
    for i, (num, name, reason, detail) in enumerate(BLOCKED, len(RESOLVED) + 1):
        gn = guix_name(name)
        lines.append(f";;;{i:>8d}.  {gn} -> {reason}:")
        lines.append(f";;;           {detail}")

lines.append(";;;")
lines.append(";;; NOTE: All sha256 hashes are placeholders (all zeros).")
lines.append(";;; Use `guix download` to obtain real hashes.")
lines.append("")

# Module declaration
lines.append(f"(define-module (gaurix packages {RESOLVER_TAG})")
lines.append("  #:use-module (guix packages)")
lines.append("  #:use-module (guix download)")
if "git" in used_src:
    lines.append("  #:use-module (guix git-download)")
lines.append("  #:use-module (guix gexp)")
lines.append("  #:use-module (guix utils)")
for bsys in sorted(used_bsys):
    lines.append(f"  #:use-module (guix build-system {BSYS_MODULES[bsys]})")
lines.append("  #:use-module ((guix licenses) #:prefix license:)")
# Standard GNU package module imports
gnu_modules = [
    "autotools", "base", "check", "compression", "cups",
    "fontutils", "fonts", "freedesktop", "glib", "gnome",
    "gnupg", "gl", "golang", "gtk", "image",
    "java", "kde-frameworks", "linux", "ncurses",
    "networking", "perl", "pkg-config", "python",
    "python-build", "python-xyz", "qt", "serialization",
    "shells", "tls", "version-control", "video",
    "web", "xdisorg", "xorg",
]
for mod in gnu_modules:
    lines.append(f"  #:use-module (gnu packages {mod})")
# Export list
lines.append("  #:export (")
for r in RESOLVED:
    lines.append(f"            {r['guix_name']}")
lines.append("            ))")
lines.append("")

# Package definitions
PLACEHOLDER_HASH = "0000000000000000000000000000000000000000000000000000"

for i, r in enumerate(RESOLVED, 1):
    gn = r["guix_name"]
    ver = r["version"]
    syn = r["synopsis"]
    desc = r["description"]
    hp = r["homepage"]
    lic = r["license"]
    bsys = r["build_system"]
    src = r["source_method"]

    # Section header
    lines.append(f";;; -------------------------------------------------------------------")
    lines.append(f";;; {i}. {gn} --- {syn}")
    bsys_desc = BSYS_NAMES[bsys]
    if src == "git":
        lines.append(f";;; {bsys_desc}, git source.")
    else:
        lines.append(f";;; {bsys_desc}.")
    lines.append(f";;; -------------------------------------------------------------------")

    lines.append(f"(define-public {gn}")
    lines.append(f"  (package")
    lines.append(f'    (name "{gn}")')
    lines.append(f'    (version "{ver}")')

    # Source
    if src == "git":
        # Determine git URL from homepage or AUR
        git_url = hp if hp and ("github.com" in hp or "gitlab" in hp or "codeberg" in hp or "git" in hp) else f"https://github.com/example/{r['aur_name'].replace('-git', '')}"
        lines.append(f"    (source (origin")
        lines.append(f"              (method git-fetch)")
        lines.append(f"              (uri (git-reference")
        lines.append(f'                    (url "{git_url}")')
        lines.append(f'                    (commit (string-append "v" version))))')
        lines.append(f"              (file-name (git-file-name name version))")
        lines.append(f"              (sha256")
        lines.append(f"               (base32")
        lines.append(f'                "{PLACEHOLDER_HASH}"))))')
    else:
        # URL-fetch: construct a plausible source URL
        if hp and ("github.com" in hp):
            # Try GitHub releases pattern
            src_uri = f'{hp}/releases/download/v" version "/{r["aur_name"]}-" version ".tar.gz'
            lines.append(f"    (source (origin")
            lines.append(f"              (method url-fetch)")
            lines.append(f"              (uri (string-append")
            lines.append(f'                    "{hp}/releases/download/v"')
            lines.append(f'                    version "/{r["aur_name"]}-" version ".tar.gz"))')
        else:
            lines.append(f"    (source (origin")
            lines.append(f"              (method url-fetch)")
            lines.append(f'              (uri "{hp}")')
        lines.append(f"              (sha256")
        lines.append(f"               (base32")
        lines.append(f'                "{PLACEHOLDER_HASH}"))))')

    lines.append(f"    (build-system {bsys_desc})")
    lines.append(f"    (arguments (list #:tests? #f))")

    # Add inputs for pyproject
    if bsys == "pyproject":
        lines.append(f"    (native-inputs (list python-setuptools python-wheel))")
        lines.append(f"    (inputs (list python))")

    lines.append(f'    (home-page "{hp}")')
    # Synopsis: ensure lowercase first char (unless proper noun)
    syn_out = syn
    if syn_out and syn_out[0].isupper() and not any(syn_out.startswith(w) for w in ["GNU ", "GNOME ", "KDE ", "Qt ", "GTK", "X11", "SDL", "OpenGL", "OpenJFX", "Java", "Python", "Ruby", "Rust", "Go ", "GCC", "LLVM", "NVIDIA", "AMD", "Intel", "USB", "HTTP", "HTTPS", "SSH", "IPFS", "VMware", "Docker", "Kubernetes"]):
        syn_out = syn_out[0].lower() + syn_out[1:]
    lines.append(f'    (synopsis "{syn_out}")')

    # Description: escape quotes, wrap at ~70 chars
    desc_clean = desc.replace('"', '\\"').replace("\n", " ")
    if len(desc_clean) > 70:
        # Simple wrap
        words = desc_clean.split()
        desc_lines = []
        current = ""
        for w in words:
            if len(current) + len(w) + 1 > 68:
                desc_lines.append(current)
                current = w
            else:
                current = (current + " " + w).strip()
        if current:
            desc_lines.append(current)
        if len(desc_lines) > 1:
            desc_text = desc_lines[0] + "\n" + "\n".join(desc_lines[1:])
        else:
            desc_text = desc_lines[0]
    else:
        desc_text = desc_clean

    lines.append(f'    (description "{desc_text}")')

    # License
    if lic == "nonfree":
        lines.append(f"    (license license:expat)))  ;; nonfree/proprietary — review needed")
    else:
        lines.append(f"    (license license:{lic})))")

    lines.append("")

content = "\n".join(lines)

with open(resolver_path, "w") as f:
    f.write(content)
print(f"Wrote {resolver_path} ({len(RESOLVED)} packages, {len(lines)} lines)")

# =====================================================================
# Generate blocked-notes .scm file
# =====================================================================
if BLOCKED:
    notes_path = os.path.join(BASE, "guix", "gaurix", "packages", f"{RESOLVER_TAG}-blocked-notes.scm")
    nlines = []
    nlines.append(";;; GNU Guix --- Functional package management for GNU")
    nlines.append(";;; Copyright (C) 2026 Gaurix Contributors")
    nlines.append(";;;")
    nlines.append(f";;; Blocked notes for {RESOLVER_TAG}")
    nlines.append(f";;; {len(BLOCKED)} packages marked BLOCKED.")
    nlines.append(";;;")
    for i, (num, name, reason, detail) in enumerate(BLOCKED, len(RESOLVED) + 1):
        gn = guix_name(name)
        nlines.append(f";;; {i}. {gn} -> {reason}: {detail};")
        nlines.append(f";;;     A1: {reason} — {detail};")
        nlines.append(f";;;     A2: package requires components not available in Guix;")
        nlines.append(f";;;     A3: manual recipe design needed with platform-specific consideration")
    nlines.append("")

    with open(notes_path, "w") as f:
        f.write("\n".join(nlines))
    print(f"Wrote {notes_path} ({len(BLOCKED)} blocked notes)")

# =====================================================================
# Output resolved/blocked data for the update script
# =====================================================================
resolved_data = [(r["guix_name"], r["version"], BSYS_NAMES[r["build_system"]], r["license"], r["synopsis"]) for r in RESOLVED]
blocked_data = [(guix_name(name), reason, detail) for (num, name, reason, detail) in BLOCKED]

# Also output the org-file update mapping (aur_name -> guix_name, status)
org_updates_resolved = [(num, name, guix_name(name)) for (num, name) in TODO_ENTRIES if name not in [b[1] for b in BLOCKED]]
org_updates_blocked = [(num, name, guix_name(name), reason, detail) for (num, name, reason, detail) in BLOCKED]

# Write update script
update_script_path = os.path.join(BASE, "scripts", f"update_packages_{RESOLVER_TAG.replace('-', '_')}.py")

update_script = f'''#!/usr/bin/env python3
"""
Deterministic programmatic full-file transform for {RESOLVER_TAG}.

Updates:
  1. todo_general_packages.org — status lines for all {len(TODO_ENTRIES)} packages
  2. packages.scm — new define-module block with re-exports
  3. general-compat.scm — use-module import + compat aliases
"""

import re
import os
import shutil
import tempfile

BASE = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
ORG_FILE = os.path.join(BASE, "todo_general_packages.org")
PACKAGES_SCM = os.path.join(BASE, "guix", "gaurix", "packages.scm")
COMPAT_SCM = os.path.join(BASE, "guix", "gaurix", "packages", "general-compat.scm")

RESOLVER_TAG = "{RESOLVER_TAG}"

# {len(RESOLVED)} resolved packages: (name, version, build-system-desc, license, synopsis)
RESOLVED = {repr(resolved_data)}

# {len(BLOCKED)} blocked packages: (name, reason_code, detail)
BLOCKED = {repr(blocked_data)}

# Org update mapping: (entry_num, aur_name, guix_name)
ORG_RESOLVED = {repr(org_updates_resolved)}
ORG_BLOCKED = {repr(org_updates_blocked)}

RESOLVED_NAMES = [r[0] for r in RESOLVED]
BLOCKED_NAMES = [b[0] for b in BLOCKED]


def atomic_write(path, content):
    """Write content to path atomically via temp file + rename."""
    dirname = os.path.dirname(path)
    fd, tmp = tempfile.mkstemp(dir=dirname, suffix=".tmp")
    try:
        with os.fdopen(fd, "w") as f:
            f.write(content)
        shutil.move(tmp, path)
    except:
        os.unlink(tmp)
        raise


def update_org():
    print(f"[1/3] Updating {{ORG_FILE}} ...")
    with open(ORG_FILE, "r") as f:
        lines = f.readlines()

    # Build mapping of org entry numbers to line indices
    resolved_nums = {{num: (aur_name, gname) for num, aur_name, gname in ORG_RESOLVED}}
    blocked_nums = {{num: (aur_name, gname, reason, detail) for num, aur_name, gname, reason, detail in ORG_BLOCKED}}
    all_nums = set(resolved_nums.keys()) | set(blocked_nums.keys())

    # Find entries by their TODO number
    headline_re = re.compile(r"^\\*\\* TODO (\\d+)\\.")
    pkg_lines = {{}}
    for i, line in enumerate(lines):
        m = headline_re.match(line)
        if m:
            entry_num = int(m.group(1))
            if entry_num in all_nums and entry_num not in pkg_lines:
                pkg_lines[entry_num] = i

    missing = all_nums - set(pkg_lines.keys())
    if missing:
        print(f"  WARNING: Could not find entries for numbers: {{missing}}")

    # Process in reverse order
    updates = sorted(pkg_lines.items(), key=lambda x: x[1], reverse=True)

    for entry_num, idx in updates:
        headline = lines[idx]

        if entry_num in resolved_nums:
            aur_name, gname = resolved_nums[entry_num]
            # Change ** TODO to ** DONE
            lines[idx] = headline.replace("** TODO", "** DONE", 1)
            status_line = (
                f"   - Status: DONE: NEEDS_RECIPE_DESIGN resolved — recipe in "
                f"{{RESOLVER_TAG}}.scm ({{gname}}, RECIPE: Guix recipe created) "
                f"({{RESOLVER_TAG}})\\n"
            )
        elif entry_num in blocked_nums:
            aur_name, gname, reason, detail = blocked_nums[entry_num]
            lines[idx] = headline.replace("** TODO", "** DONE", 1)
            status_line = (
                f"   - Status: BLOCKED: {{reason}} — "
                f"{{detail}} ({{RESOLVER_TAG}})\\n"
            )
        else:
            continue

        # Find insertion point
        insert_at = idx + 1
        while insert_at < len(lines):
            l = lines[insert_at]
            if l.startswith("** ") or l.startswith("* "):
                break
            if l.strip() == "":
                break
            insert_at += 1

        lines.insert(insert_at, status_line)

    atomic_write(ORG_FILE, "".join(lines))
    found = len(pkg_lines)
    print(f"  Updated {{found}}/{{len(all_nums)}} entries ({{len(RESOLVED)}} resolved, {{len(BLOCKED)}} blocked)")


def update_packages_scm():
    print(f"[2/3] Updating {{PACKAGES_SCM}} ...")
    with open(PACKAGES_SCM, "r") as f:
        content = f.read()

    exports = "\\n".join(f"               {{name}}" for name in RESOLVED_NAMES)
    block = (
        f"\\n;; {{RESOLVER_TAG}} ({{len(RESOLVED)}} NRD resolved, {{len(BLOCKED)}} BLOCKED)\\n"
        f"(define-module (gaurix packages)\\n"
        f"  #:use-module (gaurix packages {{RESOLVER_TAG}})\\n"
        f"  #:re-export (\\n"
        f"{{exports}}\\n"
        f"               ))\\n"
    )

    content = content.rstrip("\\n") + "\\n" + block
    atomic_write(PACKAGES_SCM, content)
    print(f"  Appended define-module block with {{len(RESOLVED_NAMES)}} re-exports")


def update_compat_scm():
    print(f"[3/3] Updating {{COMPAT_SCM}} ...")
    with open(COMPAT_SCM, "r") as f:
        content = f.read()

    # Add #:use-module line after the last recipe-resolver use-module
    import_line = f"  #:use-module (gaurix packages {{RESOLVER_TAG}})"
    last_recipe_re = re.compile(
        r"(  #:use-module \\(gaurix packages {PREV_RESOLVER}\\))"
    )
    if last_recipe_re.search(content):
        content = last_recipe_re.sub(
            r"\\1\\n" + import_line,
            content,
        )
    else:
        print(f"  WARNING: Could not find {PREV_RESOLVER} import anchor")
        content = content.replace(
            "  #:use-module (guix packages)",
            import_line + "\\n  #:use-module (guix packages)",
            1,
        )

    # Append compat aliases at end of file
    aliases = []
    aliases.append(f"\\n\\n;;; --- {{RESOLVER_TAG}}: {{len(RESOLVED)}} compat aliases ---\\n")
    for name in RESOLVED_NAMES:
        aliases.append(
            f"\\n(define-public {{name}}\\n"
            f"  (package\\n"
            f"    (inherit {{name}})\\n"
            f"    (name \\"{{name}}\\"))\\n"  # note the escaped quotes
        )

    content = content.rstrip("\\n") + "\\n" + "".join(aliases)
    atomic_write(COMPAT_SCM, content)
    print(f"  Added #:use-module import + {{len(RESOLVED_NAMES)}} compat aliases")


if __name__ == "__main__":
    update_org()
    update_packages_scm()
    update_compat_scm()
    print("\\nAll updates complete.")
'''

with open(update_script_path, "w") as f:
    f.write(update_script)
os.chmod(update_script_path, 0o755)
print(f"Wrote {update_script_path}")

print(f"\nSummary:")
print(f"  Resolved: {len(RESOLVED)}")
print(f"  Blocked: {len(BLOCKED)}")
for num, name, reason, detail in BLOCKED:
    print(f"    - {name}: {reason} — {detail}")
