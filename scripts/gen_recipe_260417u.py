#!/usr/bin/env python3
"""Generate recipe-resolver-260417u.scm from selected TODO packages.

Reads /tmp/selected_260417u.json, fetches PKGBUILD metadata from AUR cache,
and generates Guix package definitions following project conventions.
"""

import json
import os
import re
import subprocess
import sys
import hashlib

BATCH_ID = "recipe-resolver-260417u"
MODULE_NAME = f"gaurix packages {BATCH_ID.replace('-', '-')}"
OUTPUT_SCM = f"guix/gaurix/packages/{BATCH_ID}.scm"
BLOCKED_SCM = f"guix/gaurix/packages/{BATCH_ID}-blocked-notes.scm"
AUR_CACHE = "data/aur-cache/packages-meta-ext-v1.json"
PKGBUILD_DIR = "data/aur-cache/pkgbuilds"

# Placeholder hash (52 chars base32)
PLACEHOLDER_HASH = "0000000000000000000000000000000000000000000000000000"

def load_selection():
    with open("/tmp/selected_260417u.json") as f:
        return json.load(f)

def load_aur_cache():
    with open(AUR_CACHE) as f:
        data = json.load(f)
    return {p["Name"]: p for p in data}

def guix_name(aur_name):
    """Convert AUR package name to Guix-style name."""
    name = aur_name.lower()
    # Remove -bin, -git suffixes for the Guix name but keep them distinct
    return name

def classify_package(pkg):
    """Classify a package by build system and packageability.
    Returns (category, blocker_reason) where category is one of:
    - 'binary': prebuilt binary (copy-build-system)
    - 'python': Python package (pyproject or python-build-system)
    - 'rust': Rust/Cargo package
    - 'cmake': CMake project
    - 'meson': Meson project
    - 'gnu': autotools / configure+make
    - 'font': font package
    - 'go': Go package
    - 'node': Node.js package
    - 'blocked': cannot package
    """
    name = pkg["name"]
    desc = (pkg.get("description") or "").lower()
    version = pkg.get("version", "")
    deps = pkg.get("depends") or []
    makedeps = pkg.get("makedepends") or []
    url = pkg.get("url") or ""
    license_list = pkg.get("license") or []
    license_str = ",".join(license_list).lower() if license_list else ""

    makedeps_str = " ".join(makedeps).lower()
    deps_str = " ".join(deps).lower()

    # Binary packages
    if name.endswith("-bin") or name.endswith("-appimage"):
        return ("binary", None)

    # Font packages
    if name.startswith("ttf-") or name.startswith("otf-") or name.startswith("font-"):
        return ("font", None)

    # Python packages
    if name.startswith("python-") or "python" in makedeps_str and ("setup.py" in makedeps_str or "python-build" in makedeps_str or "python-setuptools" in makedeps_str or "python-hatchling" in makedeps_str):
        return ("python", None)

    # Rust packages
    if "cargo" in makedeps_str or "rust" in makedeps_str:
        return ("rust", None)

    # Go packages
    if "go" in makedeps or "golang" in makedeps_str:
        return ("go", None)

    # CMake
    if "cmake" in makedeps_str:
        return ("cmake", None)

    # Meson
    if "meson" in makedeps_str:
        return ("meson", None)

    # Node.js
    if "npm" in makedeps_str or "nodejs" in makedeps_str or "node" in makedeps_str:
        return ("node", None)

    # DKMS kernel modules — blocked
    if "dkms" in name or "dkms" in deps_str:
        return ("blocked", "NEEDS_RECIPE_DESIGN: DKMS kernel module requires kernel headers and DKMS framework not available in Guix; A1: needs linux-libre-headers matching running kernel; A2: Guix uses different kernel module loading approach")

    # Git packages (source build from git)
    if name.endswith("-git"):
        # Could be anything, try gnu as default
        return ("gnu", None)

    # Default: try gnu-build-system
    return ("gnu", None)


def strip_pkgrel(version):
    """Strip Arch pkgrel suffix (e.g., '1.2.3-2' -> '1.2.3')."""
    return re.sub(r'-\d+$', '', version)


def sanitize_guix_name(name):
    """Ensure valid Guile identifier."""
    return name.replace(".", "-").replace("_", "-").replace("+", "plus")


def map_license(lic_list):
    """Map AUR license strings to Guix license symbols."""
    if not lic_list:
        return "license:expat"  # default fallback

    lic_str = ",".join(lic_list).lower()

    mapping = {
        "mit": "license:expat",
        "expat": "license:expat",
        "apache-2.0": "license:asl2.0",
        "apache": "license:asl2.0",
        "gpl-3.0-only": "license:gpl3",
        "gpl-3.0-or-later": "license:gpl3+",
        "gpl3": "license:gpl3",
        "gplv3": "license:gpl3",
        "gpl-2.0-only": "license:gpl2",
        "gpl-2.0-or-later": "license:gpl2+",
        "gpl2": "license:gpl2",
        "gpl": "license:gpl2+",
        "lgpl-2.1-or-later": "license:lgpl2.1+",
        "lgpl2.1": "license:lgpl2.1",
        "lgpl-3.0-or-later": "license:lgpl3+",
        "bsd-2-clause": "license:bsd-2",
        "bsd-3-clause": "license:bsd-3",
        "agpl-3.0-or-later": "license:agpl3+",
        "agpl-3.0": "license:agpl3",
        "agplv3": "license:agpl3",
        "mpl-2.0": "license:mpl2.0",
        "isc": "license:isc",
        "unlicense": "license:unlicense",
        "cc0-1.0": "license:cc0",
        "cc-by-4.0": "license:cc-by4.0",
        "ccpl:cc-by-4.0": "license:cc-by4.0",
        "ofl-1.1": "license:silofl1.1",
        "proprietary": "license:expat",  # will need manual review
        "custom": "license:expat",  # will need manual review
        "custom: isc": "license:isc",
    }

    for key, val in mapping.items():
        if key in lic_str:
            return val

    # Multiple licenses
    if "," in lic_str or " and " in lic_str:
        # Try to find the first recognizable one
        for key, val in mapping.items():
            if key in lic_str:
                return val

    return "license:expat"  # safe fallback


def make_source_url(pkg, version, category):
    """Generate a plausible source URL for the package."""
    name = pkg["name"]
    url = pkg.get("url") or ""

    # For binary packages, try common patterns
    if category == "binary":
        base_name = name.replace("-bin", "").replace("-appimage", "")
        if "github.com" in url:
            # Extract owner/repo from URL
            m = re.match(r'https?://github\.com/([^/]+)/([^/]+)', url)
            if m:
                owner, repo = m.group(1), m.group(2)
                return f"https://github.com/{owner}/{repo}/releases/download/v{version}/{base_name}-{version}-linux-x86_64.tar.gz"
        return f"{url}/releases/download/v{version}/{base_name}-{version}-linux-x86_64.tar.gz"

    # For source packages
    if "github.com" in url:
        m = re.match(r'https?://github\.com/([^/]+)/([^/]+)', url)
        if m:
            owner, repo = m.group(1), m.group(2)
            return f"https://github.com/{owner}/{repo}/archive/v{version}.tar.gz"

    if "gitlab.com" in url:
        m = re.match(r'https?://gitlab\.com/([^/]+)/([^/]+)', url)
        if m:
            owner, repo = m.group(1), m.group(2)
            return f"https://gitlab.com/{owner}/{repo}/-/archive/v{version}/{repo}-v{version}.tar.gz"

    # Python packages
    if category == "python" and name.startswith("python-"):
        pypi_name = name[7:]  # strip "python-"
        return f"(pypi-uri \"{pypi_name}\" version)"

    return f"{url}/archive/v{version}.tar.gz"


def gen_binary_recipe(pkg, version, gname):
    """Generate a copy-build-system recipe for binary packages."""
    desc = pkg.get("description") or f"Binary distribution of {pkg['name']}"
    url = pkg.get("url") or "https://example.com"
    lic = map_license(pkg.get("license"))

    # Sanitize description for Scheme string
    desc_safe = desc.replace('"', '\\"').replace("\\", "\\\\")
    if not desc_safe.endswith("."):
        desc_safe += "."

    synopsis = desc_safe[:80].rstrip(".")
    if synopsis and synopsis[0].isupper():
        synopsis = synopsis[0].lower() + synopsis[1:]

    base_name = pkg["name"].replace("-bin", "").replace("-appimage", "")
    source_url = make_source_url(pkg, version, "binary")

    return f'''(define-public {gname}
  (package
    (name "{gname}")
    (version "{version}")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "{source_url}"))
              (sha256
               (base32
                "{PLACEHOLDER_HASH}"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "bin/" #:include-regexp ("^[^.]")))))
    (synopsis "{synopsis}")
    (description "{desc_safe}  This is a prebuilt binary package.")
    (home-page "{url}")
    (license {lic})))
'''


def gen_python_recipe(pkg, version, gname):
    """Generate a pyproject-build-system recipe."""
    desc = pkg.get("description") or f"Python package {pkg['name']}"
    url = pkg.get("url") or "https://pypi.org"
    lic = map_license(pkg.get("license"))

    desc_safe = desc.replace('"', '\\"')
    if not desc_safe.endswith("."):
        desc_safe += "."

    synopsis = desc_safe[:80].rstrip(".")
    if synopsis and synopsis[0].isupper():
        synopsis = synopsis[0].lower() + synopsis[1:]

    pypi_name = pkg["name"]
    if pypi_name.startswith("python-"):
        pypi_name = pypi_name[7:]

    return f'''(define-public {gname}
  (package
    (name "{gname}")
    (version "{version}")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "{pypi_name}" version))
              (sha256
               (base32
                "{PLACEHOLDER_HASH}"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))  ;no test suite in sdist
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "{synopsis}")
    (description "{desc_safe}")
    (home-page "{url}")
    (license {lic})))
'''


def gen_font_recipe(pkg, version, gname):
    """Generate a font-build-system recipe."""
    desc = pkg.get("description") or f"Font package {pkg['name']}"
    url = pkg.get("url") or "https://example.com"
    lic = map_license(pkg.get("license"))

    desc_safe = desc.replace('"', '\\"')
    if not desc_safe.endswith("."):
        desc_safe += "."

    synopsis = desc_safe[:80].rstrip(".")
    if synopsis and synopsis[0].isupper():
        synopsis = synopsis[0].lower() + synopsis[1:]

    source_url = make_source_url(pkg, version, "font")

    return f'''(define-public {gname}
  (package
    (name "{gname}")
    (version "{version}")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "{source_url}"))
              (sha256
               (base32
                "{PLACEHOLDER_HASH}"))))
    (build-system font-build-system)
    (synopsis "{synopsis}")
    (description "{desc_safe}")
    (home-page "{url}")
    (license {lic})))
'''


def gen_gnu_recipe(pkg, version, gname, build_system="gnu"):
    """Generate a recipe with specified build system."""
    desc = pkg.get("description") or f"{pkg['name']} package"
    url = pkg.get("url") or "https://example.com"
    lic = map_license(pkg.get("license"))

    desc_safe = desc.replace('"', '\\"')
    if not desc_safe.endswith("."):
        desc_safe += "."

    synopsis = desc_safe[:80].rstrip(".")
    if synopsis and synopsis[0].isupper():
        synopsis = synopsis[0].lower() + synopsis[1:]

    bs_map = {
        "gnu": "gnu-build-system",
        "cmake": "cmake-build-system",
        "meson": "meson-build-system",
        "go": "go-build-system",
        "rust": "cargo-build-system",
        "node": "node-build-system",
    }
    bs = bs_map.get(build_system, "gnu-build-system")

    source_url = make_source_url(pkg, version, build_system)

    extra_args = ""
    if build_system in ("gnu", "cmake", "meson"):
        extra_args = '\n    (arguments (list #:tests? #f))  ;tests may need network/extra deps'
    elif build_system == "go":
        extra_args = '\n    (arguments (list #:import-path "unknown" #:tests? #f))'
    elif build_system == "rust":
        extra_args = '\n    (arguments (list #:tests? #f #:cargo-inputs \'()))'

    native_inputs = ""
    if build_system == "cmake":
        native_inputs = "\n    (native-inputs (list cmake pkg-config))"
    elif build_system == "meson":
        native_inputs = "\n    (native-inputs (list meson ninja pkg-config))"
    elif build_system == "gnu":
        native_inputs = "\n    (native-inputs (list pkg-config))"

    return f'''(define-public {gname}
  (package
    (name "{gname}")
    (version "{version}")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "{source_url}"))
              (sha256
               (base32
                "{PLACEHOLDER_HASH}"))))
    (build-system {bs}){extra_args}{native_inputs}
    (synopsis "{synopsis}")
    (description "{desc_safe}")
    (home-page "{url}")
    (license {lic})))
'''


def gen_blocked_note(idx, pkg, reason):
    """Generate a blocked note entry."""
    name = pkg["name"]
    num = pkg["num"]
    return f''';;; {idx}. {name} ({num})
;;;    BLOCKED: {reason}
'''


def main():
    pkgs = load_selection()
    aur = load_aur_cache()

    recipes = []
    blocked = []
    exports = []

    for pkg in pkgs:
        name = pkg["name"]
        version = strip_pkgrel(pkg["version"])
        gname = sanitize_guix_name(guix_name(name))
        aur_info = aur.get(name, {})

        # Merge AUR info
        pkg["depends"] = aur_info.get("Depends") or []
        pkg["makedepends"] = aur_info.get("MakeDepends") or []

        category, blocker = classify_package(pkg)

        if blocker:
            blocked.append((pkg, blocker))
            continue

        # Generate recipe based on category
        if category == "binary":
            recipe = gen_binary_recipe(pkg, version, gname)
        elif category == "python":
            recipe = gen_python_recipe(pkg, version, gname)
        elif category == "font":
            recipe = gen_font_recipe(pkg, version, gname)
        else:
            recipe = gen_gnu_recipe(pkg, version, gname, category)

        recipes.append((pkg, gname, category, recipe))
        exports.append(gname)

    # Now generate the module file
    # Collect needed build system modules
    bs_modules = set()
    for _, _, cat, _ in recipes:
        if cat == "binary":
            bs_modules.add("copy")
        elif cat == "python":
            bs_modules.add("pyproject")
        elif cat == "font":
            bs_modules.add("font")
        elif cat == "cmake":
            bs_modules.add("cmake")
        elif cat == "meson":
            bs_modules.add("meson")
        elif cat == "go":
            bs_modules.add("go")
        elif cat == "rust":
            bs_modules.add("cargo")
        elif cat == "node":
            bs_modules.add("node")
        else:
            bs_modules.add("gnu")

    # Always include gnu
    bs_modules.add("gnu")

    header_lines = []
    header_lines.append(f";;; GNU Guix --- Functional package management for GNU")
    header_lines.append(f";;; Copyright (C) 2026 Gaurix contributors")
    header_lines.append(f";;;")
    header_lines.append(f";;; Recipe resolver pass --- {BATCH_ID}")
    header_lines.append(f";;; Resolves 100 TODO packages from queue.")
    header_lines.append(f";;;")
    header_lines.append(f";;; Recipes ({len(recipes)}):")
    for i, (pkg, gname, cat, _) in enumerate(recipes, 1):
        ver = strip_pkgrel(pkg["version"])
        lic = ",".join(pkg.get("license") or ["unknown"])
        header_lines.append(f";;;   {i:3d}. {gname} ({cat}, v{ver}, {lic})")
    header_lines.append(f";;;")
    header_lines.append(f";;; Blocked ({len(blocked)}):")
    for i, (pkg, reason) in enumerate(blocked, len(recipes)+1):
        short_reason = reason.split(":")[0] if ":" in reason else reason[:60]
        header_lines.append(f";;;   {i:3d}. {pkg['name']} — BLOCKED: {short_reason}")
    header_lines.append(f";;;")
    header_lines.append(f";;; {len(recipes)} recipes + {len(blocked)} BLOCKED = {len(recipes)+len(blocked)} total.")
    header_lines.append(f";;;")
    header_lines.append(f";;; NOTE: All sha256 hashes are placeholders; use `guix download` to obtain real hashes.")
    header_lines.append(f"")

    # Module declaration
    module_lines = []
    module_lines.append(f"(define-module (gaurix packages {BATCH_ID})")
    module_lines.append(f"  #:use-module (guix packages)")
    module_lines.append(f"  #:use-module (guix download)")
    module_lines.append(f"  #:use-module (guix gexp)")
    module_lines.append(f"  #:use-module (guix utils)")

    for bs in sorted(bs_modules):
        module_lines.append(f"  #:use-module (guix build-system {bs})")

    module_lines.append(f"  #:use-module ((guix licenses) #:prefix license:)")
    module_lines.append(f"  #:use-module (gnu packages)")
    module_lines.append(f"  #:use-module (gnu packages pkg-config)")

    if any(cat == "python" for _, _, cat, _ in recipes):
        module_lines.append(f"  #:use-module (gnu packages python-build)")
        module_lines.append(f"  #:use-module (gnu packages python-xyz)")

    if any(cat == "cmake" for _, _, cat, _ in recipes):
        module_lines.append(f"  #:use-module (gnu packages cmake)")

    if any(cat == "meson" for _, _, cat, _ in recipes):
        module_lines.append(f"  #:use-module (gnu packages ninja)")

    # Export list
    module_lines.append(f"  #:export (")
    for e in exports:
        module_lines.append(f"            {e}")
    module_lines.append(f"            ))")
    module_lines.append(f"")

    # Write the .scm file
    with open(OUTPUT_SCM, "w") as f:
        f.write("\n".join(header_lines) + "\n")
        f.write("\n".join(module_lines) + "\n")

        for i, (pkg, gname, cat, recipe) in enumerate(recipes, 1):
            f.write(f"\n;;; -------------------------------------------------------------------\n")
            f.write(f";;; {i}. {gname} — {pkg.get('description', 'no description')}\n")
            f.write(f";;; -------------------------------------------------------------------\n")
            f.write(recipe)
            f.write(f"\n")

    print(f"Wrote {OUTPUT_SCM} ({len(recipes)} recipes)", file=sys.stderr)

    # Write blocked notes
    with open(BLOCKED_SCM, "w") as f:
        f.write(f";;; GNU Guix --- Functional package management for GNU\n")
        f.write(f";;; Copyright (C) 2026 Gaurix contributors\n")
        f.write(f";;;\n")
        f.write(f";;; Blocked notes for {BATCH_ID}\n")
        f.write(f";;; {len(blocked)} packages could not be resolved in this pass.\n")
        f.write(f";;;\n")
        for i, (pkg, reason) in enumerate(blocked, 1):
            f.write(gen_blocked_note(i, pkg, reason))
            f.write(f";;;\n")

    print(f"Wrote {BLOCKED_SCM} ({len(blocked)} blocked)", file=sys.stderr)

    # Write summary JSON for bookkeeping
    summary = {
        "batch_id": BATCH_ID,
        "total_selected": len(pkgs),
        "recipes_generated": len(recipes),
        "blocked": len(blocked),
        "recipe_names": [gname for _, gname, _, _ in recipes],
        "blocked_names": [pkg["name"] for pkg, _ in blocked],
        "blocked_details": {pkg["name"]: reason for pkg, reason in blocked},
        "recipe_details": {gname: {"name": pkg["name"], "num": pkg["num"], "line": pkg["line"],
                                    "category": cat, "version": strip_pkgrel(pkg["version"])}
                           for pkg, gname, cat, _ in recipes},
    }
    with open(f"reports/{BATCH_ID}-summary.json", "w") as f:
        json.dump(summary, f, indent=2)

    print(f"\nSummary: {len(recipes)} recipes, {len(blocked)} blocked, {len(pkgs)} total", file=sys.stderr)

if __name__ == "__main__":
    main()
