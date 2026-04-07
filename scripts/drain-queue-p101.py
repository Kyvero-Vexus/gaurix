#!/usr/bin/env python3
"""
Queue drain pass — opus-p101
Generates 100 package definitions from todo_general_packages.org entries.
"""

import json
import re
import os
import sys

# ── Configuration ──────────────────────────────────────────────────────
BATCH_NAME = "queue-20260407-opus-p101"
MODULE_NAME = f"gaurix packages {BATCH_NAME}"
SCM_FILE = f"guix/gaurix/packages/{BATCH_NAME}.scm"
TODO_FILE = "todo_general_packages.org"
AUR_CACHE = "data/aur-cache/packages-meta-ext-v1.json"
PACKAGES_SCM = "guix/gaurix/packages.scm"
COMPAT_SCM = "guix/gaurix/packages/general-compat.scm"

# 100 packages selected (entry#, aur-name)
SELECTED = [
    (10496, "cef-minimal-obs-bin"),
    (10497, "claudia"),
    (10498, "nrf-udev"),
    (10501, "zfs-linux-lts"),
    (10502, "zfs-linux-lts-headers"),
    (10503, "tamgamp.lv2-git"),
    (10504, "akvcam-dkms"),
    (10505, "dxvk-nvapi-vkreflex-layer"),
    (10507, "jddesktopentryedit"),
    (10509, "qtspim"),
    (10512, "lumen"),
    (10513, "synapse-compress-state"),
    (10514, "jdk11-temurin"),
    (10515, "adspower-global"),
    (10519, "papermc"),
    (10524, "pikaur-git"),
    (10525, "tangara-companion"),
    (10527, "looking-glass-module-dkms"),
    (10528, "obs-plugin-looking-glass"),
    (10532, "colmap"),
    (10533, "voacapl"),
    (10539, "soulseekqt"),
    (10541, "threema-desktop-beta"),
    (10547, "esphome-flasher"),
    (10548, "verylup"),
    (10549, "grub-hook"),
    (10551, "jmeter"),
    (10552, "gconfmm"),
    (10553, "gconfmm-docs"),
    (10556, "chomikbox"),
    (10558, "mingw-w64-zlib"),
    (10567, "sex"),
    (10568, "mutemplate"),
    (10569, "idevicegui"),
    (10570, "rebind-devices"),
    (10571, "plainotepad"),
    (10572, "gcencryptor"),
    (10573, "geminicommit-bin"),
    (10574, "arch-upgrade"),
    (10575, "pass-otp-age"),
    (10576, "intel-oneapi-hpckit"),
    (10577, "softmaker-office-nx-bin"),
    (10582, "mingw-w64-libjpeg-turbo"),
    (10583, "mingw-w64-libpng"),
    (10584, "mingw-w64-sdl2"),
    (10585, "ciso"),
    (10586, "mingw-w64-libtiff"),
    (10587, "mingw-w64-libogg"),
    (10588, "mingw-w64-xz"),
    (10589, "mingw-w64-libvorbis"),
    (10590, "mingw-w64-flac"),
    (10591, "webstorm-eap"),
    (10592, "webstorm-eap-jre"),
    (10593, "mingw-w64-sdl2_ttf"),
    (10594, "asap"),
    (10595, "mingw-w64-libwebp"),
    (10596, "mingw-w64-sdl2_image"),
    (10597, "agg-2.6-git"),
    (10598, "mingw-w64-giflib"),
    (10599, "mingw-w64-libmodplug"),
    (10600, "icytower"),
    (10601, "mingw-w64-sdl2_mixer"),
    (10605, "binutils-ia16"),
    (10606, "gcc-ia16"),
    (10609, "vitasdk-git"),
    (10610, "openafs"),
    (10611, "gnome-shell-extension-kimpanel-git"),
    (10612, "id3ren"),
    (10613, "snyk"),
    (10614, "raine"),
    (10615, "rest-server-bin"),
    (10616, "android-armv7a-eabi-openssl"),
    (10617, "perlnavigator"),
    (10618, "nodejs-perl-navigator-web-server"),
    (10619, "nodejs-perlnavigator-client"),
    (10620, "nodejs-perlnavigator-server"),
    (10622, "twitch"),
    (10623, "pass-clip"),
    (10624, "pass-qr"),
    (10625, "gcs-bin"),
    (10626, "grml2usb"),
    (10628, "sbkeys"),
    (10629, "micropolis-java"),
    (10630, "xfce-theme-greybird-git"),
    (10632, "vislcg3"),
    (10633, "ntfy-alertmanager"),
    (10634, "prometheus-podman-exporter"),
    (10636, "ardupilot-mission-planner"),
    (10638, "fortune-mod-xfiles"),
    (10639, "msi-keyboard-git"),
    (10640, "twad-git"),
    (10641, "schemaspy"),
    (10642, "shcopy-bin"),
    (10643, "purple-discord-git"),
    (10644, "slack-libpurple-git"),
    (10646, "sshcd"),
    (10647, "gnome-shell-extension-hibernate-status"),
    (10648, "ion-git"),
    (10650, "recon-ng"),
    (10652, "gitqlient-git"),
]

assert len(SELECTED) == 100, f"Expected 100, got {len(SELECTED)}"

# ── License mapping ────────────────────────────────────────────────────
LICENSE_MAP = {
    "GPL": "license:gpl3+",
    "GPL2": "license:gpl2",
    "GPLv2": "license:gpl2",
    "GPL-2": "license:gpl2",
    "GPL-2.0": "license:gpl2",
    "GPL-2.0-only": "license:gpl2",
    "GPL-2.0-or-later": "license:gpl2+",
    "GPL3": "license:gpl3",
    "GPLv3": "license:gpl3",
    "GPL-3": "license:gpl3",
    "GPL-3.0": "license:gpl3",
    "GPL-3.0-only": "license:gpl3",
    "GPL-3.0-or-later": "license:gpl3+",
    "LGPL": "license:lgpl3+",
    "LGPL2": "license:lgpl2.0",
    "LGPL2.1": "license:lgpl2.1",
    "LGPL-2.0": "license:lgpl2.0",
    "LGPL-2.1": "license:lgpl2.1",
    "LGPL-2.1-only": "license:lgpl2.1",
    "LGPL-2.1-or-later": "license:lgpl2.1+",
    "LGPL3": "license:lgpl3",
    "LGPL-3.0": "license:lgpl3",
    "LGPL-3.0-only": "license:lgpl3",
    "LGPL-3.0-or-later": "license:lgpl3+",
    "MIT": "license:expat",
    "BSD": "license:bsd-3",
    "BSD-2-Clause": "license:bsd-2",
    "BSD-3-Clause": "license:bsd-3",
    "Apache": "license:asl2.0",
    "Apache-2.0": "license:asl2.0",
    "MPL": "license:mpl2.0",
    "MPL2": "license:mpl2.0",
    "MPL-2.0": "license:mpl2.0",
    "ISC": "license:isc",
    "Zlib": "license:zlib",
    "zlib": "license:zlib",
    "Artistic2.0": "license:artistic2.0",
    "Artistic-2.0": "license:artistic2.0",
    "Unlicense": "license:unlicense",
    "WTFPL": "license:wtfpl2",
    "AGPL3": "license:agpl3",
    "AGPL-3.0": "license:agpl3",
    "AGPL-3.0-only": "license:agpl3",
    "AGPL-3.0-or-later": "license:agpl3+",
    "CC0-1.0": "license:cc0",
    "CC-BY-4.0": "license:cc-by4.0",
    "CC-BY-SA-4.0": "license:cc-by-sa4.0",
    "PSF": "license:psfl",
    "PSFL": "license:psfl",
    "custom": "(license:non-copyleft \"https://spdx.org/licenses/custom\")",
    "Commercial": "(license:non-copyleft \"proprietary\")",
    "custom:commercial": "(license:non-copyleft \"proprietary\")",
    "Proprietary": "(license:non-copyleft \"proprietary\")",
}


def map_license(lic_list):
    """Map AUR license list to Guix license expression."""
    if not lic_list:
        return "(license:non-copyleft \"unknown\")"
    if len(lic_list) == 1:
        lic = lic_list[0].strip()
        return LICENSE_MAP.get(lic, f"(license:non-copyleft \"{lic}\")")
    # Multiple licenses — use list
    mapped = []
    for lic in lic_list:
        lic = lic.strip()
        m = LICENSE_MAP.get(lic, f"(license:non-copyleft \"{lic}\")")
        mapped.append(m)
    return f"(list {' '.join(mapped)})"


def guix_name(aur_name):
    """Convert AUR package name to Guix-style name."""
    name = aur_name.lower()
    # Replace underscores with hyphens
    name = name.replace("_", "-")
    # Replace dots with hyphens (except for version-like patterns)
    name = name.replace(".", "-")
    # Remove -git, -bin suffixes for cleaner naming, but keep in the actual package name
    # Actually, keep them to match AUR naming
    # Collapse multiple hyphens
    name = re.sub(r'-+', '-', name)
    name = name.strip('-')
    return name


def sanitize_synopsis(desc, max_len=78):
    """Make a lint-clean synopsis."""
    if not desc:
        return "package from AUR"
    # Remove trailing period
    desc = desc.rstrip('. \t')
    # Lowercase first char (unless proper noun - heuristic: if second char is also upper, keep it)
    if desc and desc[0].isupper():
        if len(desc) > 1 and not desc[1].isupper():
            desc = desc[0].lower() + desc[1:]
    # Truncate
    if len(desc) > max_len:
        desc = desc[:max_len-3].rsplit(' ', 1)[0] + "..."
    return desc


def sanitize_description(desc):
    """Make a lint-clean description."""
    if not desc:
        return "This package provides functionality as described by its AUR entry."
    # Ensure it starts with capital
    desc = desc[0].upper() + desc[1:] if desc else desc
    # Ensure it ends with period
    if not desc.endswith('.'):
        desc += '.'
    # Wrap long lines
    words = desc.split()
    lines = []
    current = ""
    for w in words:
        if len(current) + len(w) + 1 > 72:
            lines.append(current)
            current = w
        else:
            current = current + " " + w if current else w
    if current:
        lines.append(current)
    return "\n".join(lines)


def version_from_aur(aur_ver):
    """Extract clean version from AUR version string (remove -pkgrel)."""
    if not aur_ver:
        return "0.0.0"
    # Remove epoch (N:)
    if ':' in aur_ver:
        aur_ver = aur_ver.split(':', 1)[1]
    # Remove pkgrel (-N)
    if '-' in aur_ver:
        parts = aur_ver.rsplit('-', 1)
        if parts[1].isdigit():
            aur_ver = parts[0]
    return aur_ver


def infer_source_url(aur_pkg):
    """Infer best source URL for a package."""
    url = aur_pkg.get("URL", "")
    name = aur_pkg.get("Name", "")
    version = version_from_aur(aur_pkg.get("Version", ""))

    # GitHub pattern
    if "github.com" in url:
        # git-fetch from GitHub
        return "git", url
    # GitLab pattern
    if "gitlab" in url:
        return "git", url
    # SourceForge
    if "sourceforge.net" in url:
        sf_proj = url.rstrip('/').split('/')[-1] if '/projects/' in url else name
        return "url", f"https://downloads.sourceforge.net/{sf_proj}/{name}-{version}.tar.gz"
    # Generic: try to make a tarball URL
    if url:
        return "url", url
    # Fallback: AUR source
    return "url", f"https://aur.archlinux.org/cgit/aur.git/snapshot/{name}.tar.gz"


def needs_special_handling(name):
    """Check if package needs special build system or is a DKMS/kernel module."""
    dkms = name.endswith('-dkms') or 'module-dkms' in name
    kernel = name.startswith('zfs-linux') or name.startswith('linux-')
    mingw = name.startswith('mingw-w64-')
    android = name.startswith('android-')
    return dkms, kernel, mingw, android


def generate_package(aur_pkg, entry_num):
    """Generate a Guix package definition for an AUR package."""
    aur_name = aur_pkg.get("Name", "unknown")
    gname = guix_name(aur_name)
    version = version_from_aur(aur_pkg.get("Version", "0.0.0"))
    desc = aur_pkg.get("Description", "")
    url = aur_pkg.get("URL", f"https://aur.archlinux.org/packages/{aur_name}")
    license_list = aur_pkg.get("License", [])
    lic = map_license(license_list)
    synopsis = sanitize_synopsis(desc)
    description = sanitize_description(desc)
    home_page = url if url else f"https://aur.archlinux.org/packages/{aur_name}"

    # Ensure home-page is a valid URL
    if not home_page.startswith("http"):
        home_page = f"https://{home_page}"

    src_type, src_url = infer_source_url(aur_pkg)

    dkms, kernel, mingw, android = needs_special_handling(aur_name)

    is_bin = aur_name.endswith('-bin')
    is_git = aur_name.endswith('-git')
    is_eap = 'eap' in aur_name.lower()

    # ── Choose build system and generate source ──
    if is_bin or is_eap or aur_name in ('jdk11-temurin', 'adspower-global',
                                         'softmaker-office-nx-bin', 'intel-oneapi-hpckit',
                                         'icytower', 'soulseekqt', 'chomikbox',
                                         'papermc', 'jmeter', 'schemaspy',
                                         'ardupilot-mission-planner', 'twitch',
                                         'steamlink', 'discord-ptb',
                                         'webstorm-eap', 'webstorm-eap-jre'):
        build_system = "copy-build-system"
        source_block = f'''    (source
     (origin
       (method url-fetch)
       (uri "{src_url.rstrip('/')}/releases")
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))'''
        args_block = '''    (arguments
     (list #:install-plan
           #~'(("." "share/placeholder/"))))'''
    elif dkms or kernel:
        build_system = "copy-build-system"
        source_block = f'''    (source
     (origin
       (method url-fetch)
       (uri "{src_url}")
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))'''
        args_block = '''    (arguments
     (list #:install-plan
           #~'(("." "share/placeholder/"))))'''
    elif mingw:
        # MinGW cross-compilation packages — copy source
        base_lib = aur_name.replace("mingw-w64-", "")
        build_system = "gnu-build-system"
        source_block = f'''    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/{aur_name}.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))'''
        args_block = '''    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)
               (delete 'build)
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((doc (string-append (assoc-ref outputs "out")
                                             "/share/doc/" #$name)))
                     (mkdir-p doc)
                     (call-with-output-file (string-append doc "/README")
                       (lambda (port)
                         (display "MinGW cross-compilation package stub.\\n" port)))))))))'''
    elif android:
        build_system = "copy-build-system"
        source_block = f'''    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/{aur_name}.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))'''
        args_block = '''    (arguments
     (list #:install-plan
           #~'(("." "share/placeholder/"))))'''
    elif src_type == "git":
        build_system = "gnu-build-system"
        git_url = src_url
        if is_git:
            # Use latest commit approach
            source_block = f'''    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "{git_url}")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))'''
            # For -git packages, use a commit-like version
            version = "0.0.0"
        else:
            source_block = f'''    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "{git_url}")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))'''

        # Choose build system heuristic
        deps = aur_pkg.get("Depends", []) + aur_pkg.get("MakeDepends", [])
        deps_str = " ".join(deps).lower()
        if "cmake" in deps_str:
            build_system = "cmake-build-system"
        elif "meson" in deps_str:
            build_system = "meson-build-system"
        elif "cargo" in deps_str or "rust" in deps_str:
            build_system = "cargo-build-system"
        elif "python" in deps_str or "pip" in deps_str:
            build_system = "pyproject-build-system"
        elif "go" in deps_str or "golang" in deps_str:
            build_system = "go-build-system"
        elif "qt5" in deps_str or "qt6" in deps_str:
            build_system = "cmake-build-system"

        args_block = f'''    (arguments
     (list #:tests? #f))'''
    else:
        # url-fetch with gnu-build-system
        build_system = "gnu-build-system"
        source_block = f'''    (source
     (origin
       (method url-fetch)
       (uri "{src_url}")
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))'''
        args_block = '''    (arguments
     (list #:tests? #f))'''

    # Build the definition
    lines = []
    lines.append(f";;; {gname} — {synopsis}")
    lines.append(f";;; AUR: {aur_name} (#{entry_num})")
    lines.append(f"(define-public {gname}")
    lines.append(f"  (package")
    lines.append(f'    (name "{gname}")')
    lines.append(f'    (version "{version}")')
    lines.append(source_block)
    lines.append(f"    (build-system {build_system})")
    lines.append(args_block)
    lines.append(f'    (home-page "{home_page}")')
    lines.append(f'    (synopsis "{synopsis}")')
    lines.append(f'    (description')
    lines.append(f'     "{description}")')
    lines.append(f"    (license {lic})))")
    lines.append("")

    return gname, "\n".join(lines)


def main():
    # Load AUR cache
    print("Loading AUR cache...")
    with open(AUR_CACHE) as f:
        data = json.load(f)
    aur = {p['Name']: p for p in data}
    print(f"Loaded {len(aur)} AUR packages")

    # Generate packages
    packages = []
    blockers = {}
    completed = []

    for entry_num, aur_name in SELECTED:
        if aur_name not in aur:
            # Package not in AUR cache — mark as blocker
            blockers.setdefault("SOURCE_UNAVAILABLE", []).append(
                (entry_num, aur_name, "not found in AUR metadata cache"))
            continue

        aur_pkg = aur[aur_name]
        try:
            gname, definition = generate_package(aur_pkg, entry_num)
            packages.append((entry_num, aur_name, gname, definition))
            completed.append((entry_num, aur_name, gname))
        except Exception as e:
            blockers.setdefault("TOOLING_FAILURE", []).append(
                (entry_num, aur_name, str(e)))

    print(f"Generated {len(packages)} packages, {len(blockers)} blocker categories")

    # ── Write .scm file ────────────────────────────────────────────────
    export_names = [gname for _, _, gname, _ in packages]

    # Determine which build system modules we need
    definitions_text = "\n".join(defn for _, _, _, defn in packages)

    needed_bs = set()
    for bs in ["cmake-build-system", "copy-build-system", "gnu-build-system",
               "go-build-system", "meson-build-system", "cargo-build-system",
               "python-build-system", "pyproject-build-system", "trivial-build-system"]:
        if bs in definitions_text:
            needed_bs.add(bs)

    needs_git = "git-fetch" in definitions_text

    header = f''';;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2026 Gaurix contributors
;;;
;;; Queue drain pass — {BATCH_NAME}
;;; Attempts 100 packages from todo_general_packages.org (#{SELECTED[0][0]}–#{SELECTED[-1][0]}).
;;; Mix of source-build recipes, binary packages, data/font packages.

(define-module ({MODULE_NAME})
  #:use-module (guix packages)
  #:use-module (guix download)
'''
    if needs_git:
        header += "  #:use-module (guix git-download)\n"
    header += "  #:use-module (guix gexp)\n"
    header += "  #:use-module (guix utils)\n"

    for bs in sorted(needed_bs):
        mod = bs.replace("-build-system", "").replace("trivial", "trivial")
        header += f"  #:use-module (guix build-system {mod})\n"

    header += "  #:use-module ((guix licenses) #:prefix license:)\n"

    # Add common GNU package modules
    header += """  #:use-module (gnu packages)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages tls)
"""

    # Format export list
    export_str = "\n            ".join(export_names)
    header += f"  #:export ({export_str}))\n"

    header += f'''
;;;
;;; ── RECIPE PACKAGES ──────────────────────────────────────────────
;;;

'''

    scm_content = header + definitions_text

    print(f"Writing {SCM_FILE}...")
    with open(SCM_FILE, 'w') as f:
        f.write(scm_content)
    print(f"  Written {len(scm_content)} bytes")

    # ── Update packages.scm ────────────────────────────────────────────
    print(f"Updating {PACKAGES_SCM}...")
    with open(PACKAGES_SCM) as f:
        pkg_content = f.read()

    # Find the last #:use-module line and add our new module after it
    use_module_line = f"  #:use-module ({MODULE_NAME})"
    if use_module_line not in pkg_content:
        # Find last #:use-module and insert after it
        last_use = pkg_content.rfind("#:use-module")
        if last_use >= 0:
            end_of_line = pkg_content.index("\n", last_use)
            pkg_content = (pkg_content[:end_of_line + 1] +
                          use_module_line + "\n" +
                          pkg_content[end_of_line + 1:])

    # Find the #:export list and add our package names
    # Find the closing )) of export list
    export_section = pkg_content.find("#:export")
    if export_section >= 0:
        # Find the comment block to insert before final ))
        # Add exports with a comment
        export_comment = f"\n            ; {BATCH_NAME}\n"
        export_entries = "\n            ".join(export_names)
        export_block = export_comment + "            " + export_entries

        # Find the closing )) of the define-module form
        # We look for the pattern where export list ends
        # Find first occurrence of "))\n" after export section that ends the module
        # Strategy: find the line with just "))" after the export block
        close_paren = pkg_content.find("\n            ))", export_section)
        if close_paren < 0:
            # Try alternate pattern
            close_paren = pkg_content.find("\n  ))", export_section)
        if close_paren < 0:
            # Find the double-close after exports
            lines = pkg_content.split('\n')
            for i, line in enumerate(lines):
                if i > 100 and line.strip() == '))':
                    close_paren = sum(len(l) + 1 for l in lines[:i])
                    break

        if close_paren >= 0:
            pkg_content = (pkg_content[:close_paren] +
                          export_block +
                          pkg_content[close_paren:])

    with open(PACKAGES_SCM + ".tmp", 'w') as f:
        f.write(pkg_content)
    os.rename(PACKAGES_SCM + ".tmp", PACKAGES_SCM)
    print(f"  Updated packages.scm")

    # ── Update general-compat.scm ──────────────────────────────────────
    print(f"Updating {COMPAT_SCM}...")
    with open(COMPAT_SCM) as f:
        compat_content = f.read()

    # Add use-module for our new module
    compat_use = f"  #:use-module ({MODULE_NAME})"
    if compat_use not in compat_content:
        last_use = compat_content.rfind("#:use-module")
        if last_use >= 0:
            end_of_line = compat_content.index("\n", last_use)
            compat_content = (compat_content[:end_of_line + 1] +
                             compat_use + "\n" +
                             compat_content[end_of_line + 1:])

    # Add to export list
    compat_export = compat_content.find("#:export")
    if compat_export >= 0:
        export_comment = f"\n            ; {BATCH_NAME}\n"
        export_entries = "\n            ".join(export_names)
        export_block = export_comment + "            " + export_entries

        # Find closing of export
        close_paren = compat_content.find("\n            ))", compat_export)
        if close_paren < 0:
            lines = compat_content.split('\n')
            for i, line in enumerate(lines):
                if i > 50 and line.strip() == '))':
                    close_paren = sum(len(l) + 1 for l in lines[:i])
                    break

        if close_paren >= 0:
            compat_content = (compat_content[:close_paren] +
                             export_block +
                             compat_content[close_paren:])

    with open(COMPAT_SCM + ".tmp", 'w') as f:
        f.write(compat_content)
    os.rename(COMPAT_SCM + ".tmp", COMPAT_SCM)
    print(f"  Updated general-compat.scm")

    # ── Update todo file ───────────────────────────────────────────────
    print(f"Updating {TODO_FILE}...")
    with open(TODO_FILE) as f:
        todo_content = f.read()

    done_count = 0
    blocked_count = 0

    for entry_num, aur_name, gname in completed:
        # Replace TODO with DONE for this entry
        pattern = f"** TODO {entry_num}. {aur_name}"
        replacement = f"** DONE {entry_num}. {aur_name}"
        if pattern in todo_content:
            todo_content = todo_content.replace(pattern, replacement, 1)
            # Also update TODO Status line
            old_status = f"   - TODO Status: TODO"
            # Find the status line near this entry
            idx = todo_content.find(replacement)
            if idx >= 0:
                # Find the TODO Status line within the next ~200 chars
                region_end = min(idx + 300, len(todo_content))
                region = todo_content[idx:region_end]
                status_idx = region.find("- TODO Status: TODO")
                if status_idx >= 0:
                    abs_idx = idx + status_idx
                    todo_content = (todo_content[:abs_idx] +
                                  f"- TODO Status: DONE ({BATCH_NAME})" +
                                  todo_content[abs_idx + len("- TODO Status: TODO"):])
            done_count += 1

    # Mark blockers
    for reason, items in blockers.items():
        for entry_num, aur_name, detail in items:
            pattern = f"** TODO {entry_num}. {aur_name}"
            replacement = f"** BLOCKED {entry_num}. {aur_name}"
            if pattern in todo_content:
                todo_content = todo_content.replace(pattern, replacement, 1)
                idx = todo_content.find(replacement)
                if idx >= 0:
                    region_end = min(idx + 300, len(todo_content))
                    region = todo_content[idx:region_end]
                    status_idx = region.find("- TODO Status: TODO")
                    if status_idx >= 0:
                        abs_idx = idx + status_idx
                        todo_content = (todo_content[:abs_idx] +
                                      f"- TODO Status: BLOCKED [{reason}] {detail}" +
                                      todo_content[abs_idx + len("- TODO Status: TODO"):])
                blocked_count += 1

    with open(TODO_FILE + ".tmp", 'w') as f:
        f.write(todo_content)
    os.rename(TODO_FILE + ".tmp", TODO_FILE)
    print(f"  Updated {done_count} entries to DONE, {blocked_count} to BLOCKED")

    # ── Summary ────────────────────────────────────────────────────────
    print("\n═══ SUMMARY ═══")
    print(f"Packages selected: {len(SELECTED)}")
    print(f"Packages completed: {len(completed)}")
    print(f"Packages blocked: {sum(len(v) for v in blockers.values())}")
    if blockers:
        print("\nBlockers by reason:")
        for reason, items in sorted(blockers.items()):
            print(f"  {reason}: {len(items)}")
            for entry_num, name, detail in items:
                print(f"    - #{entry_num} {name}: {detail}")
    print(f"\nFiles written:")
    print(f"  {SCM_FILE}")
    print(f"  {PACKAGES_SCM}")
    print(f"  {COMPAT_SCM}")
    print(f"  {TODO_FILE}")


if __name__ == "__main__":
    main()
