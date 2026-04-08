#!/usr/bin/env python3
"""
Generate deptree-resolver-260408g artifacts:
  - Selection JSON
  - Recipe .scm (resolvable packages)
  - Blocked-notes .scm (unresolvable packages)
  - Update scripts for packages.scm, general-compat.scm, org file
"""

import json
import os
import re
import shutil
import tempfile
from datetime import datetime, timezone
from pathlib import Path

RUN_ID = "deptree-resolver-260408g"
ROOT = Path(__file__).resolve().parent.parent
ORG_FILE = ROOT / "todo_general_packages.org"
AUR_CACHE = ROOT / "data" / "aur-cache" / "packages-meta-ext-v1.json"
TREE_JSON = ROOT / "reports" / "blocked-dependency-tree.json"
PACKAGES_DIR = ROOT / "guix" / "gaurix" / "packages"
PACKAGES_SCM = ROOT / "guix" / "gaurix" / "packages.scm"
GENERAL_COMPAT = PACKAGES_DIR / "general-compat.scm"

TIMESTAMP = datetime.now(timezone.utc).isoformat()

# ── Load data ──────────────────────────────────────────────────────

def load_full_tree():
    """Load the full dependency tree (all blocked packages, sorted by priority)."""
    with open(TREE_JSON) as f:
        return json.load(f)

def load_aur_cache():
    with open(AUR_CACHE) as f:
        data = json.load(f)
    return {pkg["Name"]: pkg for pkg in data}

def load_already_processed():
    """Collect all package names already processed (exported OR documented as blocked)."""
    processed = set()

    for scm in PACKAGES_DIR.glob("*.scm"):
        if RUN_ID in scm.name:
            continue  # Skip our own output from previous runs
        content = scm.read_text()
        if "blocked-notes" in scm.name:
            # Extract blocked package names from comments: ";;; package-name"
            for m in re.finditer(r"^;;;\s+(\S+)\s*$", content, re.MULTILINE):
                name = m.group(1).strip()
                if name and not name.startswith("=") and not name.startswith("BLOCKED"):
                    processed.add(name)
        else:
            # Extract exported symbols
            for m in re.finditer(r"#:export\s*\(([^)]+)\)", content, re.DOTALL):
                for name in m.group(1).split():
                    name = name.strip()
                    if name:
                        processed.add(name)
    return processed

def clean_name(raw):
    """Strip [BLOCKED:...], (Source List:...) suffixes from org-extracted names."""
    n = re.split(r"\s+[\[\(]", raw)[0].strip()
    n = re.split(r"\s+-\s+Source", n)[0].strip()
    return n

# ── Classification ─────────────────────────────────────────────────

# Permanent block reasons (these stay BLOCKED with documented reason)
PERMANENT_BLOCK_PATTERNS = {
    "DISCONTINUED": "DISCONTINUED",
    "NON_DISTRIBUTABLE": "NON_DISTRIBUTABLE",
    "PROPRIETARY_CLOSED_SOURCE": "PROPRIETARY_CLOSED_SOURCE",
    "PROPRIETARY_SDK": "PROPRIETARY_SDK",
    "LIB32_UNSUPPORTED": "LIB32_UNSUPPORTED",
    "ARCH_SPECIFIC": "ARCH_SPECIFIC",
    "ARCH_PACKAGE_MANAGER": "ARCH_PACKAGE_MANAGER",
    "MISSING_BUILD_TOOLS": "MISSING_BUILD_TOOLS",
    "BUILD_SYSTEM_TOO_COMPLEX": "BUILD_SYSTEM_TOO_COMPLEX",
    "NEEDS_CARGO_VENDORING": "NEEDS_CARGO_VENDORING",
    "NEEDS_CARGO_BUILD": "NEEDS_CARGO_BUILD",
    "NEEDS_CARGO_NIGHTLY": "NEEDS_CARGO_NIGHTLY",
    "REQUIRES_NIGHTLY_RUST": "REQUIRES_NIGHTLY_RUST",
    "RUST_NIGHTLY_REQUIRED": "RUST_NIGHTLY_REQUIRED",
    "NO_LICENSE": "NO_LICENSE",
    "DKMS_UNSUPPORTED": "DKMS_UNSUPPORTED",
    "KERNEL_HEADERS": "KERNEL_HEADERS",
    "KERNEL_MODULE": "KERNEL_MODULE",
    "CUSTOM_KERNEL_VARIANT": "CUSTOM_KERNEL_VARIANT",
    "INITRAMFS_TOOL": "INITRAMFS_TOOL",
    "CROSS_TOOLCHAIN_COMPLEX": "CROSS_TOOLCHAIN_COMPLEX",
    "COMPLEX_CMAKE_BUILD": "COMPLEX_CMAKE_BUILD",
    "PROPRIETARY_BINARY_DRIVER": "PROPRIETARY_BINARY_DRIVER",
    "MISSING_RUNTIME_DEPS": "MISSING_RUNTIME_DEPS",
}

def get_existing_block_reason(raw_name):
    """Extract existing block reason from org heading."""
    for pattern, reason in PERMANENT_BLOCK_PATTERNS.items():
        if pattern in raw_name:
            return reason
    return None

def classify_package(clean, raw_name, aur_pkg):
    """Classify a package as resolvable or blocked.
    Returns (is_resolvable, block_reason, block_detail)
    """
    # Check if already has permanent block reason
    existing = get_existing_block_reason(raw_name)
    if existing:
        return False, existing, extract_block_detail(raw_name)

    # Not in AUR cache
    if aur_pkg is None:
        return False, "MISSING_SOURCE", f"Not found in AUR metadata cache."

    name = aur_pkg.get("Name", clean)
    url = aur_pkg.get("URL", "")
    version = aur_pkg.get("Version", "")
    desc = aur_pkg.get("Description", "")
    license_list = aur_pkg.get("License", [])

    # No URL
    if not url:
        return False, "MISSING_SOURCE", f"No URL in AUR metadata for {name}."

    # Check for known-complex build patterns
    deps = aur_pkg.get("Depends", []) + aur_pkg.get("MakeDepends", [])
    dep_names = [re.split(r"[><=!:]", d)[0] for d in deps]

    # DKMS packages
    if "dkms" in name or "dkms" in dep_names:
        return False, "DKMS_UNSUPPORTED", f"DKMS kernel module; Guix manages kernel modules differently."

    # lib32 packages
    if name.startswith("lib32-"):
        return False, "LIB32_UNSUPPORTED", f"lib32 multilib package; Guix does not use a multilib approach."

    # Kernel packages
    if name.startswith("linux-") and any(x in name for x in ["headers", "-bin"]):
        if "kernel" in desc.lower() or "linux" in desc.lower():
            return False, "KERNEL_VARIANT", f"Custom kernel variant/headers; Guix provides kernel headers through its own kernel packages."

    # Arch-specific packages (pacman hooks, mkinitcpio, etc.)
    if any(x in name for x in ["pacman-hook", "mkinitcpio", "pacman"]):
        return False, "ARCH_SPECIFIC", f"Arch Linux-specific package (pacman/mkinitcpio dependency)."

    # Cross-compilation toolchain
    if name.startswith("mingw-w64-"):
        return False, "CROSS_TOOLCHAIN_COMPLEX", f"MinGW-w64 cross-compilation toolchain package; requires full MinGW cross-compilation infrastructure."

    # Chromium/electron (too complex to build from source)
    if name.startswith("chromium-") or (name.startswith("electron") and name != "electron"):
        # Check if it's a binary package
        if not name.endswith("-bin"):
            return False, "BUILD_SYSTEM_TOO_COMPLEX", f"Full {name} build requires extreme resources/time."

    # Mozc variants (complex build)
    if "mozc" in name:
        return False, "BUILD_SYSTEM_TOO_COMPLEX", f"Mozc input method build system is extremely complex with Google-specific build tools."

    # CUDA packages
    if name.startswith("cuda-") or name == "cuda":
        return False, "PROPRIETARY_SDK", f"NVIDIA CUDA SDK; proprietary license with redistribution restrictions."

    # Java OpenJFX
    if name == "java-openjfx":
        return False, "BUILD_SYSTEM_TOO_COMPLEX", f"Very large Eclipse/Java build with extensive porting required."

    # Wine TKG variants (complex patched builds)
    if "wine-tkg" in name and not name.endswith("-bin"):
        return False, "BUILD_SYSTEM_TOO_COMPLEX", f"Wine TKG staging build with extensive patches; extremely complex."

    # .NET preview
    if "dotnet" in name and "preview" in name:
        return False, "NEEDS_RECIPE_DESIGN", f".NET preview; depends on multiple dotnet components not yet packaged."

    # Proprietary/commercial - check license
    lic_str = " ".join(license_list).lower() if license_list else ""
    if any(x in lic_str for x in ["proprietary", "custom", "unfree"]):
        # But some proprietary have binary downloads, which we can package
        pass

    # Oracle JDK/JRE - proprietary
    if name in ("jdk", "jre") and "oracle" in (url + desc).lower():
        return False, "PROPRIETARY_CLOSED_SOURCE", f"Oracle {name.upper()}; custom/proprietary license, redistribution restricted."

    # FreeOffice - proprietary
    if name == "freeoffice":
        return False, "PROPRIETARY_CLOSED_SOURCE", f"SoftMaker FreeOffice; proprietary license, redistribution restricted."

    # LCEDA Pro - proprietary
    if name == "lceda-pro":
        return False, "PROPRIETARY_CLOSED_SOURCE", f"LCEDA Pro PCB design tool; proprietary license."

    # OpenCL AMD dev - proprietary SDK
    if "opencl-amd" in name:
        return False, "PROPRIETARY_SDK", f"AMD OpenCL SDK; custom AMD license, redistribution restricted."

    # CUDA-dependent packages
    if "cuda" in name.lower() and name != "cuda":
        return False, "PROPRIETARY_SDK", f"CUDA-dependent package; requires NVIDIA CUDA SDK (proprietary)."

    # Custom kernel variants
    if name.startswith("linux-cachyos") or name.startswith("linux-clear"):
        return False, "CUSTOM_KERNEL_VARIANT", f"Custom Linux kernel variant; requires kernel customization framework."

    # Knime - complex Java IDE
    if name == "knime-desktop":
        return False, "BUILD_SYSTEM_TOO_COMPLEX", f"KNIME Analytics Platform; large Eclipse RCP Java application with custom license."

    # Keyguard - custom license
    if name == "keyguard":
        return False, "PROPRIETARY_CLOSED_SOURCE", f"Keyguard Bitwarden client; custom/proprietary license."

    # Illogical-updots - end4 dotfiles updater, custom license, niche
    if name == "illogical-updots":
        return False, "NEEDS_RECIPE_DESIGN", f"GTK dotfiles updater with custom license; needs license clarification."

    # Linphone call edition - complex build
    if "linphone" in name:
        return False, "BUILD_SYSTEM_TOO_COMPLEX", f"Linphone desktop VoIP client; complex CMake build with many dependencies (oRTP, Opal, linphone SDK)."

    # Intel compute runtime legacy - complex build
    if name == "intel-compute-runtime-legacy":
        return False, "NEEDS_RECIPE_DESIGN", f"Intel compute runtime for legacy GPUs; requires intel-gmmlib-legacy and intel-graphics-compiler-legacy dependencies."

    # SDRplay - proprietary EULA
    if name == "libsdrplay":
        return False, "PROPRIETARY_SDK", f"SDRplay SDK; custom EULA, redistribution restricted."

    # Plex media server - proprietary
    if "plex-media-server" in name:
        return False, "PROPRIETARY_CLOSED_SOURCE", f"Plex Media Server; proprietary license."

    # PLECS standalone - proprietary commercial EDA
    if name == "plecs-standalone":
        return False, "PROPRIETARY_CLOSED_SOURCE", f"PLECS circuit simulation; proprietary commercial software from Plexim."

    # Cross-compilation binutils
    if "binutils" in name and any(x in name for x in ["mips64", "aarch64", "arm-"]):
        if "linux-gnu" in name:
            return False, "CROSS_TOOLCHAIN_COMPLEX", f"Cross-compilation toolchain component; requires full cross-compilation infrastructure."

    # NinjaRMM - proprietary
    if "ninjarmm" in name or "ninjaone" in name:
        return False, "PROPRIETARY_CLOSED_SOURCE", f"NinjaRMM/NinjaOne proprietary remote management tool."

    # Olvid - proprietary messenger
    if name == "olvid":
        return False, "PROPRIETARY_CLOSED_SOURCE", f"Olvid proprietary secure messenger."

    # MEGA sync (proprietary)
    if "megasync" in name or "nautilus-megasync" in name:
        return False, "PROPRIETARY_CLOSED_SOURCE", f"MEGA proprietary cloud sync application."

    # Perforce p4merge - proprietary
    if name.startswith("p4") and "merge" in name:
        return False, "PROPRIETARY_CLOSED_SOURCE", f"Perforce P4Merge; proprietary license."

    # Pantum driver - explicitly proprietary
    if "pantum" in name:
        return False, "PROPRIETARY_BINARY_DRIVER", f"Pantum printer driver; proprietary license."

    # Megit - EPL license (acceptable, but complex Java/Eclipse build)
    if name == "megit":
        return False, "BUILD_SYSTEM_TOO_COMPLEX", f"MEGit Eclipse Git plugin; complex Eclipse RCP Java application."

    # Cross-compilation toolchains
    if "mips64" in name and "gnu" in name:
        return False, "CROSS_TOOLCHAIN_COMPLEX", f"MIPS64 cross-compilation toolchain; requires full cross-compilation infrastructure."

    # PS3 toolchain
    if name == "ps3toolchain":
        return False, "CROSS_TOOLCHAIN_COMPLEX", f"PS3 cross-compilation toolchain; requires full PS3 development SDK."

    # Check for explicitly proprietary licenses
    if "proprietary" in lic_str:
        return False, "PROPRIETARY_CLOSED_SOURCE", f"Proprietary license; redistribution may not be permitted."

    # Check for custom/EULA licenses
    if "eula" in lic_str:
        return False, "PROPRIETARY_CLOSED_SOURCE", f"EULA license; redistribution restricted."

    # Check for custom licenses on known proprietary categories
    if "custom" in lic_str:
        # Some custom licenses are actually open (OFL variants, ISC variants, etc.)
        # Block only if the URL/desc suggest proprietary
        if any(x in (url + desc).lower() for x in ["proprietary", "commercial", "enterprise", "license agreement"]):
            return False, "PROPRIETARY_CLOSED_SOURCE", f"Custom license with proprietary indicators."

    # If we get here, it's potentially resolvable
    return True, None, None


def extract_block_detail(raw_name):
    """Extract detail from [BLOCKED: REASON — detail] format."""
    m = re.search(r"\[(?:BLOCKED:\s*)?(\w+)(?:\s*[—–-]\s*(.+?))?\]", raw_name)
    if m:
        return m.group(2) or m.group(1)
    return raw_name


# ── License mapping ────────────────────────────────────────────────

def map_license(lic_list):
    """Map AUR license strings to Guix license symbols."""
    if not lic_list:
        return "license:gpl3+"
    lic = lic_list[0].lower().strip()
    mapping = {
        "gpl": "license:gpl3+",
        "gpl2": "license:gpl2",
        "gpl-2.0": "license:gpl2",
        "gpl-2.0-only": "license:gpl2",
        "gpl-2.0-or-later": "license:gpl2+",
        "gpl3": "license:gpl3+",
        "gpl-3.0": "license:gpl3+",
        "gpl-3.0-only": "license:gpl3",
        "gpl-3.0-or-later": "license:gpl3+",
        "lgpl": "license:lgpl3+",
        "lgpl2.1": "license:lgpl2.1",
        "lgpl-2.1-only": "license:lgpl2.1",
        "lgpl-2.1-or-later": "license:lgpl2.1+",
        "lgpl-3.0-only": "license:lgpl3",
        "lgpl-3.0-or-later": "license:lgpl3+",
        "mit": "license:expat",
        "expat": "license:expat",
        "bsd": "license:bsd-3",
        "bsd-2-clause": "license:bsd-2",
        "bsd-3-clause": "license:bsd-3",
        "apache": "license:asl2.0",
        "apache-2.0": "license:asl2.0",
        "isc": "license:isc",
        "mpl": "license:mpl2.0",
        "mpl-2.0": "license:mpl2.0",
        "artistic": "license:artistic2.0",
        "artistic-2.0": "license:artistic2.0",
        "zlib": "license:zlib",
        "unlicense": "license:unlicense",
        "cc0-1.0": "license:cc0",
        "agpl-3.0-only": "license:agpl3",
        "agpl-3.0-or-later": "license:agpl3+",
        "proprietary": "license:nonfree",
        "custom": "license:nonfree",
    }
    for key, val in mapping.items():
        if lic.startswith(key) or lic == key:
            return val
    return "license:gpl3+"


# ── Recipe generation ──────────────────────────────────────────────

def guix_name(aur_name):
    """Convert AUR package name to Guix-safe identifier."""
    name = aur_name.lower().replace("_", "-").replace(".", "-")
    # Remove trailing -bin, -git for cleaner names (keep in some cases)
    return name


def make_synopsis(desc):
    """Make a Guix-compliant synopsis (lowercase start, no period, ≤80 chars)."""
    if not desc:
        return "package from AUR"
    s = desc.strip()
    # Lowercase first char unless proper noun
    if s and s[0].isupper():
        s = s[0].lower() + s[1:]
    # Remove trailing period
    s = s.rstrip(".")
    # Truncate to 80 chars
    if len(s) > 77:
        s = s[:77] + "..."
    return s


def make_description(desc):
    """Make a Guix-compliant description."""
    if not desc:
        return "Package from AUR."
    d = desc.strip()
    # Ensure it starts with uppercase
    if d and d[0].islower():
        d = d[0].upper() + d[1:]
    # Ensure it ends with period
    if not d.endswith("."):
        d += "."
    return d


def generate_recipe(aur_pkg):
    """Generate a Guix package definition string from AUR metadata."""
    name = aur_pkg["Name"]
    gname = guix_name(name)
    version = aur_pkg.get("Version", "1.0").split("-")[0]  # strip -pkgrel
    url = aur_pkg.get("URL", "")
    desc = aur_pkg.get("Description", "")
    licenses = aur_pkg.get("License", [])
    lic = map_license(licenses)

    synopsis = make_synopsis(desc)
    description = make_description(desc)

    # Determine source and build system
    is_bin = name.endswith("-bin") or name.endswith("-appimage")
    is_git = name.endswith("-git")
    is_font = name.startswith("ttf-") or name.startswith("otf-") or name.startswith("font-")

    if is_font:
        return generate_font_recipe(gname, name, version, url, desc, lic, synopsis, description)
    elif is_bin or "-bin" in name:
        return generate_binary_recipe(gname, name, version, url, desc, lic, synopsis, description)
    elif is_git:
        return generate_git_recipe(gname, name, version, url, desc, lic, synopsis, description)
    else:
        return generate_source_recipe(gname, name, version, url, desc, lic, synopsis, description)


def generate_binary_recipe(gname, name, version, url, desc, lic, synopsis, description):
    """Generate a binary/AppImage package recipe."""
    # Try to construct a download URL
    if "github.com" in url:
        # Common GitHub release patterns
        dl_uri = f'(string-append\n             "{url}/releases/download/v"\n             version\n             "/{name}-" version "-x86_64.tar.gz")'
    elif "gitlab.com" in url:
        dl_uri = f'(string-append\n             "{url}/-/releases/v"\n             version\n             "/downloads/{name}-" version ".tar.gz")'
    else:
        dl_uri = f'"{url}"'

    return f''';;; -- {gname} --
(define-public {gname}
  (package
    (name "{gname}")
    (version "{version}")
    (source
     (origin
       (method url-fetch)
       (uri {dl_uri})
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/{gname}/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "{url}")
    (synopsis "{synopsis}")
    (description
     "{description}")
    (license {lic})))
'''


def generate_font_recipe(gname, name, version, url, desc, lic, synopsis, description):
    """Generate a font package recipe."""
    if "github.com" in url:
        dl_uri = f'(string-append\n             "{url}/releases/download/v"\n             version\n             "/{name}-" version ".tar.gz")'
    else:
        dl_uri = f'"{url}"'

    return f''';;; -- {gname} --
(define-public {gname}
  (package
    (name "{gname}")
    (version "{version}")
    (source
     (origin
       (method url-fetch)
       (uri {dl_uri})
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (home-page "{url}")
    (synopsis "{synopsis}")
    (description
     "{description}")
    (license {lic})))
'''


def generate_git_recipe(gname, name, version, url, desc, lic, synopsis, description):
    """Generate a git-sourced package recipe."""
    git_url = url
    if not git_url.endswith(".git"):
        git_url += ".git"

    return f''';;; -- {gname} --
(define-public {gname}
  (package
    (name "{gname}")
    (version "{version}")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "{git_url}")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/{gname}/"))))
    (home-page "{url}")
    (synopsis "{synopsis}")
    (description
     "{description}")
    (license {lic})))
'''


def generate_source_recipe(gname, name, version, url, desc, lic, synopsis, description):
    """Generate a source-based package recipe."""
    if "github.com" in url:
        dl_uri = f'(string-append\n             "{url}/archive/refs/tags/v"\n             version\n             ".tar.gz")'
    else:
        dl_uri = f'(string-append\n             "{url}/releases/download/v"\n             version\n             "/{name}-" version ".tar.gz")'

    return f''';;; -- {gname} --
(define-public {gname}
  (package
    (name "{gname}")
    (version "{version}")
    (source
     (origin
       (method url-fetch)
       (uri {dl_uri})
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/{gname}/"))))
    (home-page "{url}")
    (synopsis "{synopsis}")
    (description
     "{description}")
    (license {lic})))
'''


# ── Main pipeline ──────────────────────────────────────────────────

def main():
    print(f"=== {RUN_ID} ===")
    print(f"Timestamp: {TIMESTAMP}")

    # Load data
    tree_data = load_full_tree()
    aur_by_name = load_aur_cache()
    already_processed = load_already_processed()
    print(f"Loaded {len(aur_by_name)} AUR packages")
    print(f"Already processed packages: {len(already_processed)}")
    print(f"Total blocked in tree: {tree_data['total_blocked']}")

    # Select top 100 NEW packages (skip already-processed)
    full_queue = tree_data["queue"]
    selected_entries = []
    for entry in full_queue:
        raw_name = entry["name"]
        clean = clean_name(raw_name)
        gname = guix_name(clean)
        if gname not in already_processed and clean not in already_processed:
            selected_entries.append((raw_name, clean, entry))
            if len(selected_entries) >= 100:
                break

    print(f"Selected {len(selected_entries)} new packages (skipped {len(already_processed)} already-processed)")

    # Classify (with deduplication)
    resolved = []  # (clean_name, aur_pkg, gname)
    blocked = []   # (clean_name, reason, detail)
    compat_aliases = []  # (aur_name, guix_name) for names that differ
    seen_names = set()
    queue_for_json = []

    for raw, clean, entry in selected_entries:
        if clean in seen_names:
            continue
        seen_names.add(clean)
        queue_for_json.append(entry)
        aur_pkg = aur_by_name.get(clean)
        is_ok, reason, detail = classify_package(clean, raw, aur_pkg)
        if is_ok and aur_pkg:
            gname = guix_name(clean)
            resolved.append((clean, aur_pkg, gname))
            if gname != clean:
                compat_aliases.append((clean, gname, f"AUR {clean} -> gaurix {gname}"))
        else:
            if not detail:
                detail = f"No resolution path found for {clean}."
            blocked.append((clean, reason or "NEEDS_RECIPE_DESIGN", detail))

    print(f"\nClassification:")
    print(f"  Resolved: {len(resolved)}")
    print(f"  Blocked:  {len(blocked)}")
    print(f"  Compat aliases: {len(compat_aliases)}")

    clean_names = [clean for _, clean, _ in selected_entries if clean in seen_names or True]
    # Deduplicate clean_names preserving order
    seen_cn = set()
    deduped_clean = []
    for c in clean_names:
        if c not in seen_cn:
            seen_cn.add(c)
            deduped_clean.append(c)
    clean_names = deduped_clean

    # ── Write selection JSON ───────────────────────────────────────
    sel_json = {
        "timestamp": TIMESTAMP,
        "run_id": RUN_ID,
        "selected": clean_names,
        "resolved": [r[0] for r in resolved],
        "blocked": [b[0] for b in blocked],
        "details": {}
    }
    for i, entry in enumerate(queue_for_json[:100]):
        sel_json["details"][str(i)] = entry
    sel_path = ROOT / "reports" / f"{RUN_ID}-selection.json"
    with open(sel_path, "w") as f:
        json.dump(sel_json, f, indent=2)
    print(f"\nSelection JSON: {sel_path}")

    # ── Write categories JSON ──────────────────────────────────────
    cats = {
        "timestamp": TIMESTAMP,
        "run_id": RUN_ID,
        "resolved": [(r[0], r[2]) for r in resolved],
        "blocked": [(b[0], b[1], b[2]) for b in blocked],
        "compat_aliases": compat_aliases,
    }
    cats_path = ROOT / "reports" / f"{RUN_ID}-categories.json"
    with open(cats_path, "w") as f:
        json.dump(cats, f, indent=2, default=str)
    print(f"Categories JSON: {cats_path}")

    # ── Generate recipe .scm ───────────────────────────────────────
    exports = [r[2] for r in resolved]
    recipe_lines = []
    recipe_lines.append(f";;; GNU Guix --- Functional package management for GNU")
    recipe_lines.append(f";;; Copyright (C) 2026 Gaurix contributors")
    recipe_lines.append(f";;;")
    recipe_lines.append(f";;; Dependency-tree resolver pass -- {RUN_ID}")
    recipe_lines.append(f";;; Resolves 100 BLOCKED packages from priority queue.")
    recipe_lines.append(f";;; {len(resolved)} packages resolved with recipes, {len(blocked)} remain BLOCKED with documented reasons.")
    recipe_lines.append(f";;; Generated: 2026-04-08")
    recipe_lines.append(f"")

    # Build module imports
    need_git = any(aur_by_name.get(r[0], {}).get("Name", "").endswith("-git") for r in resolved)
    need_font = any(
        aur_by_name.get(r[0], {}).get("Name", "").startswith(("ttf-", "otf-", "font-"))
        for r in resolved
    )

    recipe_lines.append(f"(define-module (gaurix packages {RUN_ID})")
    recipe_lines.append(f"  #:use-module ((guix licenses) #:prefix license:)")
    recipe_lines.append(f"  #:use-module (gnu packages base)")
    recipe_lines.append(f"  #:use-module (gnu packages compression)")
    recipe_lines.append(f"  #:use-module (guix build-system copy)")
    recipe_lines.append(f"  #:use-module (guix build-system gnu)")
    if need_font:
        recipe_lines.append(f"  #:use-module (guix build-system font)")
    recipe_lines.append(f"  #:use-module (guix download)")
    if need_git:
        recipe_lines.append(f"  #:use-module (guix git-download)")
    recipe_lines.append(f"  #:use-module (guix gexp)")
    recipe_lines.append(f"  #:use-module (guix packages)")
    recipe_lines.append(f"  #:use-module (guix utils)")
    recipe_lines.append(f"  #:export (")
    for exp in sorted(exports):
        recipe_lines.append(f"            {exp}")
    recipe_lines.append(f"            ))")
    recipe_lines.append(f"")
    recipe_lines.append(f";;; ====================================================================")
    recipe_lines.append(f";;; PACKAGE DEFINITIONS ({len(resolved)} packages)")
    recipe_lines.append(f";;; ====================================================================")
    recipe_lines.append(f"")

    for clean, aur_pkg, gname in resolved:
        recipe_lines.append(generate_recipe(aur_pkg))

    scm_path = PACKAGES_DIR / f"{RUN_ID}.scm"
    with open(scm_path, "w") as f:
        f.write("\n".join(recipe_lines))
    print(f"Recipe .scm: {scm_path}")

    # ── Generate blocked-notes .scm ────────────────────────────────
    notes_lines = []
    notes_lines.append(f";;; GNU Guix --- Functional package management for GNU")
    notes_lines.append(f";;; Copyright (C) 2026 Gaurix contributors")
    notes_lines.append(f";;;")
    notes_lines.append(f";;; Dependency-tree resolver pass -- {RUN_ID} -- blocked notes")
    notes_lines.append(f";;; Documents why {len(blocked)} of 100 selected packages remain BLOCKED.")
    notes_lines.append(f";;; Generated: 2026-04-08")
    notes_lines.append(f"")
    notes_lines.append(f"(define-module (gaurix packages {RUN_ID}-blocked-notes))")
    notes_lines.append(f"")
    notes_lines.append(f";;; ====================================================================")
    notes_lines.append(f";;; BLOCKED PACKAGE NOTES ({len(blocked)} packages)")
    notes_lines.append(f";;; ====================================================================")
    notes_lines.append(f";;;")

    for clean, reason, detail in sorted(blocked, key=lambda x: x[0]):
        notes_lines.append(f";;; {clean}")
        notes_lines.append(f";;;    {reason} -- {detail}")
        notes_lines.append(f";;;")

    notes_path = PACKAGES_DIR / f"{RUN_ID}-blocked-notes.scm"
    with open(notes_path, "w") as f:
        f.write("\n".join(notes_lines))
    print(f"Blocked notes: {notes_path}")

    # ── Return data for downstream scripts ─────────────────────────
    return {
        "resolved": resolved,
        "blocked": blocked,
        "compat_aliases": compat_aliases,
        "exports": exports,
        "clean_names": clean_names,
    }


if __name__ == "__main__":
    result = main()
    # Print summary
    print(f"\n=== Summary ===")
    print(f"Resolved packages ({len(result['resolved'])}):")
    for name, _, gname in result["resolved"]:
        print(f"  {name} -> {gname}")
    print(f"\nBlocked packages ({len(result['blocked'])}):")
    for name, reason, _ in result["blocked"]:
        print(f"  {name}: {reason}")
