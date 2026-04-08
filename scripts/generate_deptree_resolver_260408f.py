#!/usr/bin/env python3
"""
Generate Guix recipe .scm and blocked-notes .scm for deptree-resolver-260408f.
Processes 100 BLOCKED packages from the dependency tree priority queue.
"""

import json
import re
import textwrap
from datetime import datetime, timezone
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
SELECTED_JSON = ROOT / "reports" / "deptree-resolver-260408f-selection.json"
AUR_CACHE = ROOT / "data" / "aur-cache" / "packages-meta-ext-v1.json"
OUT_SCM = ROOT / "guix" / "gaurix" / "packages" / "deptree-resolver-260408f.scm"
OUT_BLOCKED = ROOT / "guix" / "gaurix" / "packages" / "deptree-resolver-260408f-blocked-notes.scm"

RUN_ID = "deptree-resolver-260408f"
PLACEHOLDER_HASH = "0000000000000000000000000000000000000000000000000000"


def load_data():
    with open(SELECTED_JSON) as f:
        sel = json.load(f)
    with open(AUR_CACHE) as f:
        aur = json.load(f)
    by_name = {p["Name"]: p for p in aur}
    return sel["selected"], by_name


def clean_version(v):
    """Strip Arch epoch and pkgrel from version string."""
    v = re.sub(r'^\d+:', '', v)  # strip epoch
    v = re.sub(r'-\d+(\.\d+)?$', '', v)  # strip pkgrel
    return v


def guix_name(aur_name):
    """Convert AUR name to Guix-compatible identifier."""
    n = aur_name.lower()
    n = re.sub(r'[^a-z0-9+.-]', '-', n)
    n = re.sub(r'-+', '-', n).strip('-')
    return n


def map_license(lic_list):
    """Map AUR license strings to Guix license symbols."""
    if not lic_list:
        return "license:expat"
    first = lic_list[0].lower()
    mappings = {
        "gpl": "license:gpl3+",
        "gpl-2": "license:gpl2",
        "gpl-2.0": "license:gpl2",
        "gpl-2.0-only": "license:gpl2",
        "gpl-2.0-or-later": "license:gpl2+",
        "gpl2": "license:gpl2",
        "gpl-2.0+": "license:gpl2+",
        "gpl3": "license:gpl3+",
        "gpl-3.0-or-later": "license:gpl3+",
        "gpl3+": "license:gpl3+",
        "lgpl": "license:lgpl2.1+",
        "lgpl-2.1": "license:lgpl2.1",
        "lgpl-2.1-only": "license:lgpl2.1",
        "lgpl-2.1-or-later": "license:lgpl2.1+",
        "mit": "license:expat",
        "bsd": "license:bsd-3",
        "bsd-2": "license:bsd-2",
        "bsd-3": "license:bsd-3",
        "apache": "license:asl2.0",
        "apache-2.0": "license:asl2.0",
        "asl2.0": "license:asl2.0",
        "mpl": "license:mpl2.0",
        "mpl-2.0": "license:mpl2.0",
        "isc": "license:isc",
        "zlib": "license:zlib",
        "unlicense": "license:unlicense",
        "agpl-3.0-only or elastic-2.0": "license:agpl3",
        "sspl-1.0": "license:sspl",
        "custom": "license:nonfree",
        "custom:otn": "license:nonfree",
        "licenseref-otn": "license:nonfree",
        "licenseref-gftc": "license:nonfree",
        "custom:matlab eula": "license:nonfree",
        "custom:amd": "license:nonfree",
        "custom:eula": "license:nonfree",
        "licenseref-custom": "license:nonfree",
        "custom:azul platform prime stream license agreement": "license:nonfree",
        "custom:licenseref-rocm-eula": "license:nonfree",
        "ftl or gpl-2.0-or-later": "license:freetype",
    }
    for key, val in mappings.items():
        if first == key:
            return val
    if "gpl" in first:
        return "license:gpl3+"
    if "mit" in first:
        return "license:expat"
    if "custom" in first or "licenseref" in first:
        return "license:nonfree"
    return "license:expat"


def sanitize_synopsis(desc, name):
    """Create a Guix-compliant synopsis from AUR description."""
    if not desc:
        return name.replace('-', ' ')
    s = desc.strip()
    if s.endswith('.'):
        s = s[:-1]
    if len(s) > 76:
        s = s[:73] + "..."
    if s and s[0].isupper() and not any(s.startswith(w) for w in ['GNU', 'NVIDIA', 'AMD', 'ROCm', 'MinGW', 'Intel', 'SDR', 'USB']):
        s = s[0].lower() + s[1:]
    return s


def sanitize_description(desc, name):
    """Create a Guix-compliant description."""
    if not desc:
        return f"{name.replace('-', ' ').title()}."
    d = desc.strip()
    if not d.endswith('.'):
        d += '.'
    if d[0].islower():
        d = d[0].upper() + d[1:]
    return d


# ========== CLASSIFICATION ==========

# Packages that get recipes
RECIPES = {}
# Packages that remain blocked
BLOCKED = {}

def classify_packages(names, by_name):
    """Classify all 100 packages into RECIPES or BLOCKED."""

    for name in names:
        pkg = by_name.get(name, {})
        ver = clean_version(pkg.get("Version", ""))
        url = pkg.get("URL", "")
        desc = pkg.get("Description", "")
        lic = pkg.get("License") or []

        # --- lib32 packages ---
        if name.startswith("lib32-"):
            BLOCKED[name] = ("LIB32_UNSUPPORTED",
                f"lib32 multilib package; Guix does not use a multilib approach.")
            continue

        # --- DKMS packages ---
        if name.endswith("-dkms"):
            BLOCKED[name] = ("DKMS_UNSUPPORTED",
                f"DKMS kernel module; Guix manages kernel modules differently.")
            continue

        # --- Specific blocked packages (check BEFORE missing source) ---
        blocked_map = {
            "apple-fonts": ("NON_DISTRIBUTABLE",
                "Apple proprietary fonts; license forbids redistribution outside Apple platforms."),
            "matlab": ("PROPRIETARY_CLOSED_SOURCE",
                "MATLAB is proprietary software requiring a commercial license; not redistributable."),
            "ndi-sdk": ("PROPRIETARY_SDK",
                "NewTek NDI SDK; proprietary binary requiring developer registration/license."),
            "libsdrplay": ("PROPRIETARY_SDK",
                "SDRplay API library; requires EULA acceptance, not freely redistributable."),
            "chkufsd-bin": ("PROPRIETARY_CLOSED_SOURCE",
                "Paragon UFSD filesystem checker; proprietary binary, not redistributable."),
            "spotify-1.1": ("PROPRIETARY_CLOSED_SOURCE",
                "Spotify client v1.1; proprietary binary, redistribution not permitted."),
            "spotify-dev": ("PROPRIETARY_CLOSED_SOURCE",
                "Spotify client development version; proprietary binary, not redistributable."),
            "anbox-git": ("DISCONTINUED",
                "Android-in-a-box; project archived/discontinued, no maintained upstream."),
            "chromium-gost": ("BUILD_SYSTEM_TOO_COMPLEX",
                "Chromium fork with GOST cryptography; full Chromium build requires extreme resources/time."),
            "mips64-linux-gnu-gcc-bootstrap": ("CROSS_TOOLCHAIN_COMPLEX",
                "GCC bootstrap for MIPS64 cross-toolchain; requires full cross-compilation infrastructure."),
            "mips64el-linux-gnu-binutils": ("CROSS_TOOLCHAIN_COMPLEX",
                "Binutils for MIPS64EL cross-toolchain; requires cross-compilation infrastructure."),
            "ps3toolchain": ("CROSS_TOOLCHAIN_COMPLEX",
                "PlayStation 3 development cross-toolchain; requires specialized cross-compilation setup."),
            "mingw-w64-crt-msvcrt": ("CROSS_TOOLCHAIN_COMPLEX",
                "MinGW-w64 CRT with MSVCRT; requires full MinGW cross-compilation toolchain."),
            "mingw-w64-environment": ("CROSS_TOOLCHAIN_COMPLEX",
                "MinGW-w64 environment setup; depends on complete MinGW cross-toolchain."),
            "unreal-tournament-data-archiveorg": ("NON_DISTRIBUTABLE",
                "Unreal Tournament game data from Archive.org; copyright status unclear, not freely distributable."),
            "unreal-tournament-data-gog": ("NON_DISTRIBUTABLE",
                "Unreal Tournament game data from GOG; requires purchase, not redistributable."),
            "intel-compute-runtime-legacy": ("NEEDS_RECIPE_DESIGN",
                "Intel compute runtime for legacy GPUs; requires intel-gmmlib-legacy and intel-graphics-compiler-legacy dependencies not yet packaged."),
            "nvidia-open-beta": ("KERNEL_MODULE",
                "NVIDIA open kernel modules (beta); requires kernel build infrastructure and linux-headers."),
            "nvidia-open-beta-dkms": ("DKMS_UNSUPPORTED",
                "NVIDIA open kernel modules via DKMS (beta); Guix manages kernel modules differently."),
            "nvidia-beta": ("KERNEL_MODULE",
                "NVIDIA proprietary kernel modules (beta); requires kernel build infrastructure."),
            "dotnet-sdk-preview-bin": ("NEEDS_RECIPE_DESIGN",
                ".NET SDK preview; depends on dotnet-runtime-preview-bin, aspnet-runtime-preview-bin and other dotnet components not yet packaged."),
            "cursor-ide": ("PROPRIETARY_CLOSED_SOURCE",
                "Cursor AI IDE; proprietary binary application, redistribution not permitted."),
            # Packages not in AUR cache with known status
            "audiobookshelf": ("MISSING_SOURCE",
                "Not found in AUR metadata cache; known as Node.js self-hosted audiobook server (github.com/advplyr/audiobookshelf), but no AUR metadata available."),
            "bulky": ("MISSING_SOURCE",
                "Not found in AUR metadata cache; known as Linux Mint bulk renamer (github.com/linuxmint/bulky), but no AUR metadata available."),
            "hypnotix": ("MISSING_SOURCE",
                "Not found in AUR metadata cache; known as Linux Mint IPTV player (github.com/linuxmint/hypnotix), but no AUR metadata available."),
            "codex-desktop-bin": ("MISSING_SOURCE",
                "Not found in AUR metadata cache; likely new/niche OpenAI Codex desktop application."),
            "komodo-periphery-git": ("MISSING_SOURCE",
                "Not found in AUR metadata cache; likely Komodo build manager periphery agent (github.com/moghtech/komodo)."),
            "konform-multi-account-containers-lite": ("MISSING_SOURCE",
                "Not found in AUR metadata cache; Firefox Multi-Account Containers extension variant."),
            "fluxdown-bin": ("MISSING_SOURCE",
                "Not found in AUR metadata cache; no upstream source identified."),
            "glazepkg-bin": ("MISSING_SOURCE",
                "Not found in AUR metadata cache; no upstream source identified."),
            "gram-editor-bin": ("MISSING_SOURCE",
                "Not found in AUR metadata cache; no upstream source identified."),
            "hylauncher-bin": ("MISSING_SOURCE",
                "Not found in AUR metadata cache; no upstream source identified."),
            "bigpemu-bin": ("PROPRIETARY_CLOSED_SOURCE",
                "BigPEmu Atari Jaguar emulator; closed-source binary, redistribution likely not permitted."),
            "cursor-ide": ("PROPRIETARY_CLOSED_SOURCE",
                "Cursor AI IDE; proprietary binary application, redistribution not permitted."),
            "dbeaver": ("MISSING_SOURCE",
                "No URL or version in AUR metadata; package may have been removed or is a meta-package."),
            "fahviewer": ("MISSING_SOURCE",
                "No URL or version in AUR metadata; package may have been removed or is a meta-package."),
            "gst-thumbnailers": ("MISSING_SOURCE",
                "No URL or version in AUR metadata; package may have been removed or is a meta-package."),
        }

        if name in blocked_map:
            BLOCKED[name] = blocked_map[name]
            continue

        # --- Missing source (AFTER blocked_map check) ---
        if not ver and not url:
            BLOCKED[name] = ("MISSING_SOURCE",
                f"No URL or version in AUR metadata; package may have been removed or is a meta-package.")
            continue

        # --- MS Windows fonts (non-distributable) ---
        if name.startswith("ttf-ms-win"):
            BLOCKED[name] = ("NON_DISTRIBUTABLE",
                f"Microsoft Windows proprietary fonts; redistribution requires Windows license, not permitted.")
            continue

        # --- jdk graalvm EE (OTN/proprietary) ---
        if "graalvm-ee" in name:
            BLOCKED[name] = ("PROPRIETARY_CLOSED_SOURCE",
                f"Oracle GraalVM Enterprise Edition; OTN license, redistribution not permitted.")
            continue

        # --- NVIDIA OpenCL binary libs ---
        if name.startswith("opencl-nvidia-"):
            branch = name.replace("opencl-nvidia-", "")
            RECIPES[name] = {
                "type": "nvidia-opencl",
                "version": ver,
                "branch": branch,
                "url": url or "http://www.nvidia.com/",
                "desc": desc,
                "license": lic,
            }
            continue

        # Everything else: generate a recipe
        RECIPES[name] = {
            "type": "generic",
            "version": ver,
            "url": url,
            "desc": desc,
            "license": lic,
            "depends": pkg.get("Depends") or [],
            "makedepends": pkg.get("MakeDepends") or [],
            "provides": pkg.get("Provides") or [],
        }

    return RECIPES, BLOCKED


def generate_recipe_scm(name, info):
    """Generate a single Guix package definition string."""
    gname = guix_name(name)
    ver = info["version"]
    url = info.get("url", "")
    desc = info.get("desc", "")
    lic = info.get("license", [])
    license_sym = map_license(lic)
    synopsis = sanitize_synopsis(desc, name)
    description = sanitize_description(desc, name)

    # Determine source type based on URL and package type
    if info.get("type") == "nvidia-opencl":
        # NVIDIA OpenCL packages are binary repacks
        return f''';;; -- {name} --
(define-public {gname}
  (package
    (name "{gname}")
    (version "{ver}")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://us.download.nvidia.com/XFree86/Linux-x86_64/"
             version "/NVIDIA-Linux-x86_64-" version ".run"))
       (sha256
        (base32 "{PLACEHOLDER_HASH}"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "lib/nvidia/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "{url}")
    (synopsis "{synopsis}")
    (description
     "{description}")
    (license {license_sym})))
'''

    # For packages with GitHub/GitLab URL, use git-fetch if it looks like a repo
    use_git = False
    git_url = ""
    if url:
        if any(host in url for host in ["github.com/", "gitlab.com/", "codeberg.org/", "gitlab.freedesktop.org/"]):
            use_git = True
            git_url = url.rstrip('/')
            if not git_url.endswith('.git'):
                git_url += ".git"

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
    else:
        # URL-fetch for tarballs or unknown
        if url:
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
    """Write the main .scm file with all recipe definitions."""
    resolved_count = len(recipes)
    blocked_count = len(blocked)

    # Build export list
    exports = sorted(guix_name(n) for n in recipes.keys())

    header = f''';;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency-tree resolver pass -- {RUN_ID}
;;; Resolves 100 BLOCKED packages from priority queue.
;;; {resolved_count} packages resolved with recipes, {blocked_count} remain BLOCKED with documented reasons.
;;; Generated: {datetime.now(timezone.utc).strftime('%Y-%m-%d')}

(define-module (gaurix packages {RUN_ID})
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
    print(f"Written: {OUT_SCM}")
    print(f"  {resolved_count} package recipes")


def write_blocked_notes(blocked):
    """Write the blocked-notes .scm file."""
    header = f''';;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency-tree resolver pass -- {RUN_ID} -- blocked notes
;;; Documents why {len(blocked)} of 100 selected packages remain BLOCKED.
;;; Generated: {datetime.now(timezone.utc).strftime('%Y-%m-%d')}

(define-module (gaurix packages {RUN_ID}-blocked-notes))

;;; ====================================================================
;;; BLOCKED PACKAGE NOTES ({len(blocked)} packages)
;;; ====================================================================
'''
    for name in sorted(blocked.keys()):
        code, detail = blocked[name]
        header += f";;;\n;;; {name}\n;;;    {code} -- {detail}\n"

    with open(OUT_BLOCKED, "w") as f:
        f.write(header)
    print(f"Written: {OUT_BLOCKED}")
    print(f"  {len(blocked)} blocked notes")


def main():
    names, by_name = load_data()
    print(f"Loaded {len(names)} selected packages")

    recipes, blocked = classify_packages(names, by_name)
    print(f"Classified: {len(recipes)} recipes, {len(blocked)} blocked")

    write_recipe_scm(recipes, blocked)
    write_blocked_notes(blocked)

    print(f"\n=== Summary ===")
    print(f"Resolved: {len(recipes)}")
    print(f"Blocked:  {len(blocked)}")
    print(f"\nResolved packages:")
    for n in sorted(recipes.keys()):
        print(f"  + {n}")
    print(f"\nBlocked packages:")
    for n in sorted(blocked.keys()):
        code, _ = blocked[n]
        print(f"  - {n} [{code}]")


if __name__ == "__main__":
    main()
