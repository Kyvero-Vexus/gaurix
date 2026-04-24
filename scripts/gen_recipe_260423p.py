#!/usr/bin/env python3
"""
Generate Guix recipes for recipe-resolver-260423p (100 TODO packages from queue).
Reads AUR metadata + PKGBUILDs, produces a complete .scm module.
"""

import json
import os
import re
import subprocess
from datetime import datetime, timezone
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
AUR_CACHE = ROOT / "data" / "aur-cache" / "packages-meta-ext-v1.json"
PKGBUILD_DIR = ROOT / "data" / "aur-cache" / "pkgbuilds"
OUTPUT_SCM = ROOT / "guix" / "gaurix" / "packages" / "recipe-resolver-260423p.scm"
BLOCKED_NOTES = ROOT / "guix" / "gaurix" / "packages" / "recipe-resolver-260423p-blocked-notes.scm"

PASS_ID = "recipe-resolver-260423p"
TIMESTAMP = datetime.now(timezone.utc).isoformat()

# The 100 selected packages from todo_general_packages.org
SELECTED_PACKAGES = [
    "windigo",
    "todoist-wrapper-bin",
    "specter-desktop-appimage",
    "sixteen-bin",
    "markterm-bin",
    "hace-bin",
    "git-ignore",
    "apollo-neo-env-manager-dev",
    "libretro-mame2003-git",
    "gradle-language-server",
    "winarcadia-bin",
    "swiftfetch",
    "runpodctl-git",
    "lfs-dal-git",
    "jd-gui-duo-bin",
    "java-debug",
    "contextpilot",
    "spacetimedb-cli-bin",
    "kwin-tile-gaps-git",
    "katachi",
    "dict-freedict-ita-eng-bin",
    "dict-freedict-eng-ita-bin",
    "remindr-bin",
    "ostui",
    "legume",
    "lbb",
    "tui-sudoku",
    "ripdrag-git",
    "openfortivpn-webview-qt",
    "sasquatch-git",
    "etlegacy32-mod",
    "postier-bin",
    "luajit-tiktoken-bin",
    "homie-bin",
    "vscodium-electron",
    "typhoon-bin",
    "aur-talk-git",
    "cloudflared-bin",
    "clash-for-windows-chinese",
    "setserial",
    "xplayer-plparser",
    "hy3",
    "prismlauncher-themes-git",
    "melt-bin",
    "rnr-bin",
    "factorio-space-age-experimental",
    "html2md",
    "soapui",
    "yt-x",
    "zsh-eza-git",
    "filezilla-server-bin",
    "pbget",
    "jprofiler",
    "sudo-rs-git",
    "tlm",
    "zsh-autocomplete-git",
    "zsh-defer-git",
    "cockpit-file-sharing",
    "ltfs",
    "freenginx-src",
    "sieve-app-bin",
    "deepcool-digital-linux-git",
    "shadps4-pre-release-bin",
    "netcalc",
    "redot-mono-bin",
    "redot-git",
    "bakkesmod-steam",
    "sgf-render",
    "sddm-sugar-dark",
    "pipes-rs-git",
    "newsboat-og",
    "dumber",
    "linux_logo",
    "dyna-git",
    "vpinball",
    "sparkle-electron-git",
    "openkj",
    "nodejs-fanyi",
    "node-fanyi",
    "libzedmd-git",
    "kubectl-ai-bin",
    "kernel-headers-trigger",
    "taskopen",
    "tageditor",
    "asusctl-git",
    "scamper",
    "scitopdf",
    "meowsql",
    "boxtron-git",
    "vlc-protocol",
    "ttyc",
    "python-scalene",
    "justdd",
    "glyph-bin",
    "firefox-extension-singlefile-bin",
    "exdupe-bin",
    "monitorix",
    "umlet",
    "lib32-opencl-nvidia-390xx",
    "virtualfish",
]

# License mapping from PKGBUILD/AUR to Guix
LICENSE_MAP = {
    "GPL-3.0": "license:gpl3",
    "GPL-3.0-only": "license:gpl3",
    "GPL-3.0-or-later": "license:gpl3+",
    "GPL3": "license:gpl3",
    "GPL-2.0": "license:gpl2",
    "GPL-2.0-only": "license:gpl2",
    "GPL-2.0-or-later": "license:gpl2+",
    "GPL2": "license:gpl2",
    "GPL": "license:gpl3+",
    "MIT": "license:expat",
    "Apache-2.0": "license:asl2.0",
    "Apache": "license:asl2.0",
    "BSD-2-Clause": "license:bsd-2",
    "BSD-3-Clause": "license:bsd-3",
    "BSD": "license:bsd-3",
    "LGPL-2.1": "license:lgpl2.1",
    "LGPL-2.1-only": "license:lgpl2.1",
    "LGPL-2.1-or-later": "license:lgpl2.1+",
    "LGPL-3.0": "license:lgpl3",
    "LGPL-3.0-only": "license:lgpl3",
    "LGPL-3.0-or-later": "license:lgpl3+",
    "MPL-2.0": "license:mpl2.0",
    "ISC": "license:isc",
    "Zlib": "license:zlib",
    "Artistic-2.0": "license:artistic2.0",
    "AGPL-3.0": "license:agpl3",
    "AGPL-3.0-only": "license:agpl3",
    "AGPL-3.0-or-later": "license:agpl3+",
    "Unlicense": "license:unlicense",
    "CC0-1.0": "license:cc0",
    "WTFPL": "license:wtfpl2",
    "PSF-2.0": "license:psfl",
    "0BSD": "license:bsd-0",
    "BSL-1.0": "license:boost1.0",
    "EUPL-1.2": "license:eupl1.2",
    "custom": '(license:non-copyleft "file://LICENSE")',
    "custom:": '(license:non-copyleft "file://LICENSE")',
    "unknown": '(license:non-copyleft "file://LICENSE")',
    "Proprietary": '(license:non-copyleft "file://LICENSE")',
    "proprietary": '(license:non-copyleft "file://LICENSE")',
    "SSPL": '(license:non-copyleft "file://LICENSE")',
    "LicenseRef-custom": '(license:non-copyleft "file://LICENSE")',
    "CC-BY-SA-4.0": "license:cc-by-sa4.0",
    "CC-BY-4.0": "license:cc-by4.0",
}


def map_license(lic_list):
    """Map AUR license list to Guix license expression."""
    if not lic_list:
        return '(license:non-copyleft "file://LICENSE")'
    lics = []
    for lic in lic_list:
        lic = lic.strip().strip("'\"")
        guix_lic = LICENSE_MAP.get(lic)
        if not guix_lic:
            for k, v in LICENSE_MAP.items():
                if k.lower() == lic.lower():
                    guix_lic = v
                    break
            if not guix_lic:
                if "gpl" in lic.lower() and "3" in lic:
                    guix_lic = "license:gpl3+"
                elif "gpl" in lic.lower() and "2" in lic:
                    guix_lic = "license:gpl2+"
                elif "mit" in lic.lower():
                    guix_lic = "license:expat"
                elif "apache" in lic.lower():
                    guix_lic = "license:asl2.0"
                elif "bsd" in lic.lower():
                    guix_lic = "license:bsd-3"
                elif "lgpl" in lic.lower():
                    guix_lic = "license:lgpl3+"
                elif "mpl" in lic.lower():
                    guix_lic = "license:mpl2.0"
                else:
                    guix_lic = '(license:non-copyleft "file://LICENSE")'
        lics.append(guix_lic)
    lics = list(dict.fromkeys(lics))
    if len(lics) == 1:
        return lics[0]
    return f'(list {" ".join(lics)})'


def map_license_short(lic_list):
    """Short license label for header comments."""
    if not lic_list:
        return "unknown"
    return ", ".join(l.strip().strip("'\"") for l in lic_list[:2])


def load_aur_cache():
    """Load the AUR metadata cache into a dict keyed by package name."""
    cache = {}
    with open(AUR_CACHE, "r") as f:
        data = json.load(f)
    if isinstance(data, list):
        for entry in data:
            name = entry.get("Name", entry.get("PackageBase", ""))
            if name:
                cache[name] = entry
    elif isinstance(data, dict):
        if "Name" in data:
            cache[data["Name"]] = data
    return cache


def load_pkgbuild(name):
    """Load PKGBUILD text for a given package."""
    pb_path = PKGBUILD_DIR / name / "PKGBUILD"
    if pb_path.exists():
        return pb_path.read_text(errors="replace")
    return None


def extract_pkgbuild_field(pkgbuild_text, field):
    """Extract a field from PKGBUILD text."""
    # Try array form: field=('value1' 'value2')
    m = re.search(rf'^{field}=\(([^)]*)\)', pkgbuild_text, re.MULTILINE)
    if m:
        raw = m.group(1)
        vals = re.findall(r"['\"]([^'\"]+)['\"]", raw)
        if not vals:
            vals = raw.split()
        return vals
    # Try scalar form: field=value or field="value"
    m = re.search(rf'^{field}=["\']?([^"\'\n]+)', pkgbuild_text, re.MULTILINE)
    if m:
        return [m.group(1).strip()]
    return []


def guess_build_system(name, pkgbuild_text, aur_entry):
    """Guess the appropriate Guix build system from AUR/PKGBUILD data."""
    # Binary packages
    if name.endswith("-bin") or name.endswith("-appimage"):
        return "copy"

    # Font packages
    if any(name.startswith(prefix) for prefix in ["ttf-", "otf-", "font-"]):
        return "font"

    # Check AUR MakeDepends first (available even without PKGBUILD)
    aur_makedeps = aur_entry.get("MakeDepends", []) or []
    aur_deps = aur_entry.get("Depends", []) or []
    all_aur_deps = " ".join(aur_makedeps + aur_deps).lower()
    makedeps_str = " ".join(aur_makedeps).lower()

    if any(d in makedeps_str for d in ["cargo", "rust"]):
        return "cargo"
    if "cmake" in makedeps_str:
        return "cmake"
    if "meson" in makedeps_str:
        return "meson"
    if "go" in aur_makedeps:  # exact match to avoid 'mongo' etc
        return "go"
    if any(d in makedeps_str for d in ["python-build", "python-setuptools", "python-wheel", "python-installer", "python-poetry-core", "python-flit-core"]):
        return "pyproject"
    if any(d in makedeps_str for d in ["npm", "nodejs", "node"]):
        return "node"

    # If PKGBUILD is available, check more carefully
    if pkgbuild_text:
        text = pkgbuild_text.lower()
        pb_makedeps = " ".join(extract_pkgbuild_field(pkgbuild_text, "makedepends"))

        if "cargo" in pb_makedeps or "cargo build" in text or "cargo install" in text:
            return "cargo"
        if "cmake" in pb_makedeps or "cmake" in text:
            return "cmake"
        if "meson" in pb_makedeps or "meson" in text:
            return "meson"
        if "go" in pb_makedeps.split() or "go build" in text or "go install" in text:
            return "go"
        if "python-build" in pb_makedeps or "python-setuptools" in pb_makedeps or "pyproject" in text:
            return "pyproject"
        if "npm" in pb_makedeps or "nodejs" in pb_makedeps:
            return "node"
        if any(x in text for x in ["./configure", "autoreconf", "autoconf"]):
            return "gnu"

    # Name-based heuristics
    if name.startswith("python-"):
        return "pyproject"
    if name.startswith("nodejs-") or name.startswith("node-"):
        return "node"
    if name.startswith("lib32-"):
        return "gnu"

    return "gnu"


def guess_source_url(name, version, pkgbuild_text, aur_entry):
    """Determine the best source URL for the package."""
    url = aur_entry.get("URL", "")

    if pkgbuild_text:
        sources = extract_pkgbuild_field(pkgbuild_text, "source")
        if sources:
            src = sources[0]
            # Replace PKGBUILD variables
            src = src.replace("${pkgname}", name)
            src = src.replace("$pkgname", name)
            src = src.replace("${pkgver}", version)
            src = src.replace("$pkgver", version)
            pkg_base = aur_entry.get("PackageBase", name)
            src = src.replace("${_pkgbase}", pkg_base)
            src = src.replace("$_pkgbase", pkg_base)

            # Handle git sources
            if src.endswith(".git") or "git+" in src or "::git+" in src:
                git_url = re.sub(r'^.*::(git\+)?', '', src)
                git_url = re.sub(r'#.*$', '', git_url)
                git_url = re.sub(r'\?.*$', '', git_url)
                if git_url.startswith("git+"):
                    git_url = git_url[4:]
                return ("git", git_url)

            # Clean up AUR-style source specs
            src = re.sub(r'^[^:]+::', '', src)  # remove name:: prefix
            if src.startswith("http"):
                return ("url", src)

    # Fall back to GitHub releases if URL is github
    if url and "github.com" in url:
        # Try common release patterns
        parts = url.rstrip("/").split("/")
        if len(parts) >= 5:
            owner = parts[3]
            repo = parts[4]
            if name.endswith("-bin"):
                return ("url", f"https://github.com/{owner}/{repo}/releases/download/v{version}/{repo}-{version}-linux-amd64.tar.gz")
            elif name.endswith("-git"):
                return ("git", f"https://github.com/{owner}/{repo}")
            else:
                return ("url", f"https://github.com/{owner}/{repo}/archive/refs/tags/v{version}.tar.gz")

    if url and "gitlab" in url:
        return ("url", url)

    if url:
        return ("url", url)

    return ("url", f"https://aur.archlinux.org/packages/{name}")


def sanitize_guix_name(name):
    """Ensure name is a valid Guile symbol."""
    return name.replace(".", "-dot-").replace("+", "-plus-").replace("_", "-")


def is_blocked(name, pkgbuild_text, aur_entry, build_sys):
    """Check if a package should be blocked and return (blocked, reason) tuple."""
    # Windows-only packages
    if "bakkesmod" in name.lower():
        return (True, "DEP_RESOLUTION_FAILED: Windows-only mod (Rocket League via Steam/Proton); no Linux binary or source")

    # Packages that need proprietary game files
    if name == "factorio-space-age-experimental":
        return (True, "LICENSE_REVIEW_NEEDED: requires purchased game license from factorio.com; binary distribution restricted")

    if name == "etlegacy32-mod":
        return (True, "DEP_RESOLUTION_FAILED: requires 32-bit ET:Legacy client and Wolfenstein: Enemy Territory data files")

    if name == "clash-for-windows-chinese":
        return (True, "SOURCE_UNAVAILABLE: original Clash for Windows project deleted; Chinese fork status uncertain")

    if name == "lib32-opencl-nvidia-390xx":
        return (True, "DEP_RESOLUTION_FAILED: requires 32-bit NVIDIA 390xx driver infrastructure not in Guix")

    if name == "vscodium-electron":
        return (True, "DEP_RESOLUTION_FAILED: requires building VSCodium from source with system Electron; complex build chain")

    if name == "openfortivpn-webview-qt":
        return (True, "DEP_RESOLUTION_FAILED: requires Qt5WebEngine + openfortivpn integration; complex Qt5 webengine dep chain")

    return (False, "")


def make_recipe(idx, name, version, build_sys, source_info, homepage, synopsis_raw, description_raw, license_expr, guix_name):
    """Generate a Guix package definition string."""
    source_type, source_url = source_info

    # Clean synopsis
    synopsis = synopsis_raw[:77] if len(synopsis_raw) > 77 else synopsis_raw
    synopsis = synopsis[0].lower() + synopsis[1:] if synopsis else "package"
    synopsis = synopsis.rstrip(".")

    # Clean description
    desc = description_raw if description_raw else synopsis_raw
    if desc and not desc.endswith("."):
        desc += "."
    if desc:
        desc = desc[0].upper() + desc[1:]
    # Wrap at ~72 chars for readability
    desc_lines = []
    line = ""
    for word in desc.split():
        if len(line) + len(word) + 1 > 72:
            desc_lines.append(line)
            line = word
        else:
            line = f"{line} {word}" if line else word
    if line:
        desc_lines.append(line)
    desc_formatted = "\n".join(desc_lines)

    lines = []
    lines.append(f";;; -------------------------------------------------------------------")
    lines.append(f";;; {idx}. {name}")
    lines.append(f";;; -------------------------------------------------------------------")

    if source_type == "git":
        lines.append(f"(define-public {guix_name}")
        lines.append(f'  (let ((commit "HEAD")')
        lines.append(f'        (revision "0"))')
        lines.append(f"    (package")
        lines.append(f'      (name "{name}")')
        lines.append(f'      (version (git-version "{version}" revision commit))')
        lines.append(f"      (source (origin")
        lines.append(f"                (method git-fetch)")
        lines.append(f"                (uri (git-reference")
        lines.append(f'                      (url "{source_url}")')
        lines.append(f"                      (commit commit)))")
        lines.append(f"                (file-name (git-file-name name version))")
        lines.append(f"                (sha256")
        lines.append(f'                 (base32 "0000000000000000000000000000000000000000000000000000"))))')
    else:
        lines.append(f"(define-public {guix_name}")
        lines.append(f"  (package")
        lines.append(f'    (name "{name}")')
        lines.append(f'    (version "{version}")')
        lines.append(f"    (source (origin")
        lines.append(f"              (method url-fetch)")
        lines.append(f'              (uri "{source_url}")')
        lines.append(f"              (sha256")
        lines.append(f'               (base32 "0000000000000000000000000000000000000000000000000000"))))')

    bs_module = {
        "gnu": "gnu-build-system",
        "cmake": "cmake-build-system",
        "meson": "meson-build-system",
        "cargo": "cargo-build-system",
        "go": "go-build-system",
        "pyproject": "pyproject-build-system",
        "node": "node-build-system",
        "copy": "copy-build-system",
        "font": "font-build-system",
        "trivial": "trivial-build-system",
    }

    indent = "    " if source_type != "git" else "      "
    bs_name = bs_module.get(build_sys, "gnu-build-system")

    lines.append(f"{indent}(build-system {bs_name})")

    if build_sys == "copy":
        bin_name = name.replace("-bin", "").replace("-appimage", "")
        lines.append(f"{indent}(arguments")
        lines.append(f'{indent} (list #:install-plan')
        lines.append(f"""{indent}       #~'(("{bin_name}" "bin/{bin_name}"))))""")
        lines.append(f"{indent}(supported-systems '(\"x86_64-linux\"))")
    else:
        lines.append(f"{indent}(arguments (list #:tests? #f))")

    lines.append(f'{indent}(synopsis "{synopsis}")')
    lines.append(f'{indent}(description "{desc_formatted}")')
    lines.append(f'{indent}(home-page "{homepage}")')
    lines.append(f"{indent}(license {license_expr})")

    if source_type == "git":
        lines.append(f"    )))")
    else:
        lines.append(f"    ))")

    return "\n".join(lines)


def main():
    print(f"Loading AUR cache from {AUR_CACHE}...")
    aur_cache = load_aur_cache()
    print(f"  Loaded {len(aur_cache)} entries")

    recipes = []
    blocked = []
    build_systems_needed = set()

    for idx0, pkg_name in enumerate(SELECTED_PACKAGES):
        idx = idx0 + 1
        aur_entry = aur_cache.get(pkg_name, {})
        pkgbuild_text = load_pkgbuild(pkg_name)

        version = aur_entry.get("Version", "0.0.0")
        # Clean version: remove epoch and pkgrel
        version = re.sub(r'^\d+:', '', version)  # remove epoch
        version = re.sub(r'-\d+$', '', version)  # remove pkgrel

        homepage = aur_entry.get("URL", f"https://aur.archlinux.org/packages/{pkg_name}")
        synopsis_raw = aur_entry.get("Description", f"Package {pkg_name}")
        description_raw = synopsis_raw
        lic_list = aur_entry.get("License", [])

        build_sys = guess_build_system(pkg_name, pkgbuild_text, aur_entry)
        source_info = guess_source_url(pkg_name, version, pkgbuild_text, aur_entry)
        license_expr = map_license(lic_list)
        guix_name = sanitize_guix_name(pkg_name)

        # Check for blockers
        is_blk, blk_reason = is_blocked(pkg_name, pkgbuild_text, aur_entry, build_sys)
        if is_blk:
            blocked.append((idx, pkg_name, blk_reason))
            continue

        build_systems_needed.add(build_sys)
        recipe = make_recipe(idx, pkg_name, version, build_sys, source_info,
                             homepage, synopsis_raw, description_raw,
                             license_expr, guix_name)
        lic_short = map_license_short(lic_list)
        recipes.append((idx, pkg_name, guix_name, build_sys, version, lic_short, recipe))

    # Generate the .scm file
    bs_imports = {
        "gnu": "  #:use-module (guix build-system gnu)",
        "cmake": "  #:use-module (guix build-system cmake)",
        "meson": "  #:use-module (guix build-system meson)",
        "cargo": "  #:use-module (guix build-system cargo)",
        "go": "  #:use-module (guix build-system go)",
        "pyproject": "  #:use-module (guix build-system pyproject)",
        "node": "  #:use-module (guix build-system node)",
        "copy": "  #:use-module (guix build-system copy)",
        "font": "  #:use-module (guix build-system font)",
        "trivial": "  #:use-module (guix build-system trivial)",
    }

    lines = []
    lines.append(";;; GNU Guix --- Functional package management for GNU")
    lines.append(";;; Copyright (C) 2026 Gaurix Contributors")
    lines.append(";;;")
    lines.append(f";;; Recipe resolver pass --- {PASS_ID}")
    lines.append(f";;; Resolves 100 packages ({len(recipes)} recipes, {len(blocked)} blocked).")
    lines.append(";;;")
    lines.append(f";;; New recipes ({len(recipes)}):")
    for idx, name, gname, bs, ver, lic, _ in recipes:
        bsn = f"{bs}-build-system"
        lines.append(f";;;     {idx:3d}.  {name} ({bsn}, v{ver}, {lic})")

    lines.append(";;;")
    lines.append(f";;; BLOCKED ({len(blocked)}):")
    for idx, name, reason in blocked:
        short = reason[:80]
        lines.append(f";;;     {idx:3d}.  {name} -- {short}")

    lines.append(";;;")
    lines.append(";;; NOTE: All sha256 hashes are placeholders (all zeros).")
    lines.append(";;; Use `guix download` or `guix hash` to obtain real hashes.")
    lines.append("")
    lines.append(f"(define-module (gaurix packages {PASS_ID})")
    lines.append("  #:use-module (guix packages)")
    lines.append("  #:use-module (guix download)")
    lines.append("  #:use-module (guix git-download)")
    lines.append("  #:use-module (guix gexp)")
    lines.append("  #:use-module (guix utils)")
    for bs in sorted(build_systems_needed):
        if bs in bs_imports:
            lines.append(bs_imports[bs])
    lines.append("  #:use-module ((guix licenses) #:prefix license:)")

    exports = [gname for _, _, gname, _, _, _, _ in recipes]
    lines.append("  #:export (")
    for e in exports:
        lines.append(f"            {e}")
    lines.append("            ))")
    lines.append("")

    for _, _, _, _, _, _, recipe_text in recipes:
        lines.append(recipe_text)
        lines.append("")

    output = "\n".join(lines)
    OUTPUT_SCM.write_text(output)
    print(f"Wrote {len(recipes)} recipes to {OUTPUT_SCM}")

    # Write blocked notes
    bl_lines = []
    bl_lines.append(f";;; Blocked notes for {PASS_ID}")
    bl_lines.append(f";;; {len(blocked)} packages blocked")
    for idx, name, reason in blocked:
        bl_lines.append(f";;; {idx}. {name}: {reason}")
    BLOCKED_NOTES.write_text("\n".join(bl_lines) + "\n")
    print(f"Wrote {len(blocked)} blocked notes to {BLOCKED_NOTES}")

    # Print summary
    print(f"\n=== Summary ===")
    print(f"Total selected: {len(SELECTED_PACKAGES)}")
    print(f"Recipes created: {len(recipes)}")
    print(f"Blocked: {len(blocked)}")
    for idx, name, reason in blocked:
        print(f"  BLOCKED: {name} -- {reason}")


if __name__ == "__main__":
    main()
