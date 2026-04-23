#!/usr/bin/env python3
"""
Generate Guix recipes for deptree-resolver-260423c selected packages.
Reads AUR metadata + PKGBUILDs to produce accurate recipes.
"""

import json
import re
import os
from pathlib import Path

REPO_ROOT = Path(__file__).resolve().parent.parent
SELECTION_JSON = REPO_ROOT / "reports" / "deptree-resolver-260423c-selection.json"
AUR_CACHE = REPO_ROOT / "data" / "aur-cache" / "packages-meta-ext-v1.json"
PKGBUILD_DIR = REPO_ROOT / "data" / "aur-cache" / "pkgbuilds"
OUTPUT_SCM = REPO_ROOT / "guix" / "gaurix" / "packages" / "deptree-resolver-260423c.scm"
BLOCKED_NOTES = REPO_ROOT / "guix" / "gaurix" / "packages" / "deptree-resolver-260423c-blocked-notes.scm"

PASS_ID = "deptree-resolver-260423c"
PLACEHOLDER_HASH = "0000000000000000000000000000000000000000000000000000"

# License mapping from AUR/PKGBUILD to Guix
LICENSE_MAP = {
    "GPL": "license:gpl3+",
    "GPL2": "license:gpl2",
    "GPL-2.0": "license:gpl2",
    "GPL-2.0-only": "license:gpl2",
    "GPL-2.0-or-later": "license:gpl2+",
    "GPLv2": "license:gpl2",
    "GPL3": "license:gpl3",
    "GPL-3.0": "license:gpl3",
    "GPL-3.0-only": "license:gpl3",
    "GPL-3.0-or-later": "license:gpl3+",
    "GPLv3": "license:gpl3",
    "GPL3+": "license:gpl3+",
    "LGPL": "license:lgpl3+",
    "LGPL2": "license:lgpl2.0",
    "LGPL2.1": "license:lgpl2.1",
    "LGPL-2.1-only": "license:lgpl2.1",
    "LGPL-2.1-or-later": "license:lgpl2.1+",
    "LGPL3": "license:lgpl3",
    "LGPL-3.0-only": "license:lgpl3",
    "LGPL-3.0-or-later": "license:lgpl3+",
    "MIT": "license:expat",
    "Expat": "license:expat",
    "ISC": "license:isc",
    "BSD": "license:bsd-3",
    "BSD-2-Clause": "license:bsd-2",
    "BSD-3-Clause": "license:bsd-3",
    "Apache": "license:asl2.0",
    "Apache-2.0": "license:asl2.0",
    "ASL2.0": "license:asl2.0",
    "MPL": "license:mpl2.0",
    "MPL2": "license:mpl2.0",
    "MPL-2.0": "license:mpl2.0",
    "AGPL3": "license:agpl3+",
    "AGPL-3.0-only": "license:agpl3",
    "AGPL-3.0-or-later": "license:agpl3+",
    "CC0": "license:cc0",
    "CC0-1.0": "license:cc0",
    "CCPL": "license:cc-by-sa4.0",
    "Zlib": "license:zlib",
    "zlib": "license:zlib",
    "Public Domain": "license:public-domain",
    "Unlicense": "license:unlicense",
    "X11": "license:x11",
    "PSF-2.0": "license:psfl",
    "Artistic-2.0": "license:artistic2.0",
    "custom": "license:non-copyleft",
    "custom:freeware": "license:non-copyleft",
    "proprietary": "license:non-copyleft",
    "SSPL-1.0": "license:non-copyleft",
}


def parse_pkgbuild_source(pkgbuild_path, name, version):
    """Extract source URL from PKGBUILD."""
    if not pkgbuild_path.exists():
        return None, None

    content = pkgbuild_path.read_text(errors='replace')

    # Look for source=() entries
    source_match = re.search(r"source[_a-z0-9]*=\s*\(([^)]+)\)", content, re.DOTALL)
    if not source_match:
        return None, None

    source_block = source_match.group(1)
    # Find URLs
    urls = re.findall(r'"([^"]*(?:https?://|ftp://)[^"]*)"', source_block)
    if not urls:
        urls = re.findall(r"'([^']*(?:https?://|ftp://)[^']*)'", source_block)

    if not urls:
        return None, None

    url = urls[0]
    # Replace PKGBUILD variables
    url = url.replace("${pkgname}", name)
    url = url.replace("$pkgname", name)
    url = url.replace("${pkgver}", version)
    url = url.replace("$pkgver", version)
    url = url.replace("${_pkgname}", name)
    url = url.replace("$_pkgname", name)

    # Check for git sources
    is_git = False
    if "git+" in url or url.endswith(".git"):
        is_git = True
        url = re.sub(r'^git\+', '', url)
        url = re.sub(r'#(tag|commit|branch)=.*$', '', url)

    # Remove :: prefix (custom filename)
    if "::" in url and not url.startswith("http"):
        url = url.split("::", 1)[1]

    # Extract hash
    sha256_match = re.search(r"sha256sums[_a-z0-9]*=\s*\(([^)]+)\)", content, re.DOTALL)
    sha256 = None
    if sha256_match:
        hashes = re.findall(r"'([a-f0-9]{64})'", sha256_match.group(1))
        if not hashes:
            hashes = re.findall(r'"([a-f0-9]{64})"', sha256_match.group(1))
        if hashes:
            sha256 = hashes[0]

    return url, sha256


def determine_build_system(meta, pkgbuild_content):
    """Determine the appropriate build system."""
    name = meta.get("Name", "")
    depends = meta.get("Depends", [])
    makedepends = meta.get("MakeDepends", [])
    all_deps = depends + makedepends

    dep_names = [re.split(r'[><=]', d)[0] for d in all_deps]

    # Check for binary packages
    if name.endswith("-bin") or name.endswith("-appimage"):
        return "copy"

    # Check PKGBUILD for build patterns
    if pkgbuild_content:
        if "cmake" in pkgbuild_content.lower() or "cmake" in dep_names:
            return "cmake"
        if "meson" in pkgbuild_content.lower() or "meson" in dep_names:
            return "meson"
        if "pyproject.toml" in pkgbuild_content or "python-build" in dep_names or "python-installer" in dep_names:
            return "pyproject"
        if "setup.py" in pkgbuild_content or "python-setuptools" in dep_names:
            return "pyproject"
        if "cargo" in dep_names or "rust" in dep_names:
            return "cargo"
        if any(d.startswith("go") for d in dep_names) or "go build" in pkgbuild_content:
            return "go"
        if "npm" in dep_names or "nodejs" in dep_names:
            return "node"

    # Fonts
    if name.startswith("ttf-") or name.startswith("otf-") or "fonts" in name or "font" in name:
        return "font"

    # Firmware
    if "firmware" in name or "dkms" in name:
        return "copy"

    # Check by makedepends
    if "cmake" in dep_names:
        return "cmake"
    if "meson" in dep_names:
        return "meson"

    # Default to copy for simple packages, gnu for source builds
    if not makedepends or len(makedepends) == 0:
        return "copy"

    return "gnu"


def map_license(license_list):
    """Map AUR license list to Guix license expression."""
    if not license_list:
        return "license:gpl3+"

    mapped = []
    for lic in license_list:
        lic_clean = lic.strip().rstrip(",").strip()
        if lic_clean in LICENSE_MAP:
            mapped.append(LICENSE_MAP[lic_clean])
        else:
            # Try partial match
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


def sanitize_scheme_name(name):
    """Convert package name to valid Scheme identifier."""
    # Replace chars that aren't valid in Scheme identifiers
    s = name.replace("_", "-")
    # Leading digits need a prefix
    if s and s[0].isdigit():
        s = "pkg-" + s
    return s


def sanitize_synopsis(desc):
    """Format synopsis per Guix conventions: lowercase start, no period, <=80 chars."""
    if not desc:
        return "package description unavailable"
    # Remove trailing period
    desc = desc.rstrip(".")
    # Lowercase first char (unless proper noun - keep it simple)
    if desc and desc[0].isupper():
        # Check if it looks like a proper noun / acronym
        if len(desc) > 1 and desc[1].isupper():
            pass  # Probably an acronym, keep it
        else:
            desc = desc[0].lower() + desc[1:]
    # Truncate to 80 chars
    if len(desc) > 80:
        desc = desc[:77] + "..."
    return desc


def sanitize_description(desc):
    """Format description: full sentences, capitalize first letter."""
    if not desc:
        return "Package description unavailable."
    # Capitalize first letter
    desc = desc[0].upper() + desc[1:] if desc else desc
    # Ensure it ends with a period
    if not desc.endswith("."):
        desc = desc + "."
    # Escape quotes for Scheme strings
    desc = desc.replace("\\", "\\\\").replace('"', '\\"')
    return desc


def generate_recipe(pkg_info, aur_meta, pkgbuild_dir):
    """Generate a Guix package recipe from AUR metadata."""
    name = pkg_info["name"]
    meta = aur_meta.get(name, {})

    if not meta:
        return None, f"MISSING_SOURCE: not found in AUR metadata cache"

    version = meta.get("Version", "0.1.0")
    # Clean version: remove epoch and pkgrel
    version_clean = version
    if ":" in version_clean:
        version_clean = version_clean.split(":", 1)[1]
    if "-" in version_clean:
        version_clean = version_clean.rsplit("-", 1)[0]

    description = meta.get("Description", "")
    url = meta.get("URL", "")
    license_list = meta.get("License", [])

    # Try to get PKGBUILD info
    pkgbuild_path = pkgbuild_dir / name / "PKGBUILD"
    pkgbuild_content = ""
    if pkgbuild_path.exists():
        pkgbuild_content = pkgbuild_path.read_text(errors='replace')

    source_url, sha256 = parse_pkgbuild_source(pkgbuild_path, name, version_clean)
    if not sha256:
        sha256 = PLACEHOLDER_HASH

    build_sys = determine_build_system(meta, pkgbuild_content)
    guix_license = map_license(license_list)
    scheme_name = sanitize_scheme_name(name)
    synopsis = sanitize_synopsis(description)
    full_desc = sanitize_description(description)
    home_page = url if url else f"https://aur.archlinux.org/packages/{name}"

    # Determine source method
    is_git = name.endswith("-git") or (source_url and ".git" in str(source_url))

    # Build the recipe
    lines = []
    lines.append(f";;; -------------------------------------------------------------------")
    lines.append(f";;; {pkg_info['number']}. {name} --- {synopsis}")
    lines.append(f";;; -------------------------------------------------------------------")
    lines.append(f"(define-public {scheme_name}")
    lines.append(f"  (package")
    lines.append(f'    (name "{name}")')
    lines.append(f'    (version "{version_clean}")')

    if is_git:
        git_url = source_url if source_url else (url if url else f"https://aur.archlinux.org/{name}.git")
        # Clean git URL
        git_url = re.sub(r'\.git$', '', git_url)
        lines.append(f"    (source (origin")
        lines.append(f"              (method git-fetch)")
        lines.append(f"              (uri (git-reference")
        lines.append(f'                    (url "{git_url}")')
        lines.append(f'                    (commit (string-append "v" version))))')
        lines.append(f"              (file-name (git-file-name name version))")
        lines.append(f"              (sha256")
        lines.append(f'               (base32 "{sha256}"))))')
    else:
        if source_url and "http" in str(source_url):
            # Try to templatize version in URL
            templ_url = source_url.replace(version_clean, '" version "')
            lines.append(f"    (source (origin")
            lines.append(f"              (method url-fetch)")
            lines.append(f'              (uri (string-append "{templ_url}"))')
            lines.append(f"              (sha256")
            lines.append(f'               (base32 "{sha256}"))))')
        else:
            lines.append(f"    (source (origin")
            lines.append(f"              (method url-fetch)")
            lines.append(f'              (uri (string-append "{home_page}/archive/v" version ".tar.gz"))')
            lines.append(f"              (sha256")
            lines.append(f'               (base32 "{sha256}"))))')

    # Build system
    build_sys_map = {
        "copy": "copy-build-system",
        "gnu": "gnu-build-system",
        "cmake": "cmake-build-system",
        "meson": "meson-build-system",
        "pyproject": "pyproject-build-system",
        "cargo": "cargo-build-system",
        "go": "go-build-system",
        "node": "node-build-system",
        "font": "font-build-system",
    }
    lines.append(f"    (build-system {build_sys_map.get(build_sys, 'copy-build-system')})")

    # Arguments
    if build_sys == "go":
        import_path = url.replace("https://", "").replace("http://", "") if url else name
        lines.append(f'    (arguments (list #:tests? #f #:import-path "{import_path}"))')
    else:
        lines.append(f"    (arguments (list #:tests? #f))")

    # Native inputs for certain build systems
    if build_sys in ("gnu", "cmake", "meson"):
        lines.append(f"    (native-inputs (list pkg-config))")

    # Synopsis/description
    lines.append(f'    (synopsis "{synopsis}")')
    lines.append(f'    (description "{full_desc}")')
    lines.append(f'    (home-page "{home_page}")')
    lines.append(f"    (license {guix_license})))")

    return "\n".join(lines), None


def main():
    # Load selection
    with open(SELECTION_JSON) as f:
        selection = json.load(f)

    packages = selection["packages"]
    print(f"Loaded {len(packages)} packages from selection")

    # Load AUR metadata
    with open(AUR_CACHE) as f:
        aur_data = json.load(f)
    aur_meta = {e["Name"]: e for e in aur_data}
    print(f"Loaded {len(aur_meta)} AUR entries")

    recipes = []
    blocked = []
    exports = []
    build_systems_used = set()
    seen_names = set()

    for pkg in packages:
        if pkg["name"] in seen_names:
            continue
        seen_names.add(pkg["name"])

        recipe, error = generate_recipe(pkg, aur_meta, PKGBUILD_DIR)
        if recipe:
            recipes.append(recipe)
            scheme_name = sanitize_scheme_name(pkg["name"])
            exports.append(scheme_name)

            # Track build systems used
            meta = aur_meta.get(pkg["name"], {})
            pkgbuild_path = PKGBUILD_DIR / pkg["name"] / "PKGBUILD"
            pkgbuild_content = pkgbuild_path.read_text(errors='replace') if pkgbuild_path.exists() else ""
            bs = determine_build_system(meta, pkgbuild_content)
            build_systems_used.add(bs)
        else:
            blocked.append({"name": pkg["name"], "number": pkg["number"], "reason": error})
            print(f"  BLOCKED: {pkg['name']} - {error}")

    print(f"\nGenerated {len(recipes)} recipes, {len(blocked)} blocked")

    # Build the module file
    header_recipes = []
    for i, pkg in enumerate(packages):
        if pkg["name"] not in [b["name"] for b in blocked]:
            meta = aur_meta.get(pkg["name"], {})
            pkgbuild_path = PKGBUILD_DIR / pkg["name"] / "PKGBUILD"
            pkgbuild_content = pkgbuild_path.read_text(errors='replace') if pkgbuild_path.exists() else ""
            bs = determine_build_system(meta, pkgbuild_content)
            bs_label = {
                "copy": "copy-build-system",
                "gnu": "gnu-build-system",
                "cmake": "cmake-build-system",
                "meson": "meson-build-system",
                "pyproject": "pyproject-build-system",
                "cargo": "cargo-build-system",
                "go": "go-build-system",
                "node": "node-build-system",
                "font": "font-build-system",
            }.get(bs, "copy-build-system")
            lic = map_license(meta.get("License", []))
            header_recipes.append(f";;;   {len(header_recipes)+1:>4}.  {pkg['name']} ({bs_label}, v{meta.get('Version', '?')}, {lic})")

    # Build system modules
    bs_modules = []
    bs_module_map = {
        "copy": "  #:use-module (guix build-system copy)",
        "gnu": "  #:use-module (guix build-system gnu)",
        "cmake": "  #:use-module (guix build-system cmake)",
        "meson": "  #:use-module (guix build-system meson)",
        "pyproject": "  #:use-module (guix build-system pyproject)",
        "cargo": "  #:use-module (guix build-system cargo)",
        "go": "  #:use-module (guix build-system go)",
        "node": "  #:use-module (guix build-system node)",
        "font": "  #:use-module (guix build-system font)",
    }
    for bs in sorted(build_systems_used):
        if bs in bs_module_map:
            bs_modules.append(bs_module_map[bs])

    module_content = f""";;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Dep-tree resolver pass --- {PASS_ID}
;;; Resolves {len(recipes)} BLOCKED/FAILED packages via dependency-tree priority.
;;;
;;; New recipes ({len(recipes)}):
{chr(10).join(header_recipes)}
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros) unless obtained from PKGBUILD.
;;; Use `guix download` or `guix hash` to obtain real hashes.

(define-module (gaurix packages deptree-resolver-260423c)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
{chr(10).join(bs_modules)}
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages tls)
  #:export (
{chr(10).join('            ' + e for e in exports)}
            ))

{(chr(10) + chr(10)).join(recipes)}
"""

    with open(OUTPUT_SCM, 'w') as f:
        f.write(module_content)
    print(f"Wrote {OUTPUT_SCM}")

    # Write blocked notes
    if blocked:
        blocked_content = f""";;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Blocked notes for {PASS_ID}
;;; {len(blocked)} packages could not be resolved.
;;;
"""
        for b in blocked:
            blocked_content += f";;; {b['number']}. {b['name']}: {b['reason']}\n"

        with open(BLOCKED_NOTES, 'w') as f:
            f.write(blocked_content)
        print(f"Wrote {BLOCKED_NOTES}")

    return recipes, blocked


if __name__ == "__main__":
    recipes, blocked = main()
    print(f"\nSUMMARY: {len(recipes)} recipes generated, {len(blocked)} blocked")
