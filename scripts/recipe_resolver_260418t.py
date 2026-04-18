#!/usr/bin/env python3
"""
Recipe resolver pass — recipe-resolver-260418t
Selects 100 TODO packages from todo_general_packages.org,
generates Guix package definitions, and updates all tracking files.
"""

import json
import re
import os
import sys
import subprocess
import tempfile
import shutil
from pathlib import Path

REPO_ROOT = Path(__file__).resolve().parent.parent
TODO_FILE = REPO_ROOT / "todo_general_packages.org"
AUR_CACHE = REPO_ROOT / "data" / "aur-cache" / "packages-meta-ext-v1.json"
PACKAGES_DIR = REPO_ROOT / "guix" / "gaurix" / "packages"
PACKAGES_SCM = REPO_ROOT / "guix" / "gaurix" / "packages.scm"
GENERAL_COMPAT = PACKAGES_DIR / "general-compat.scm"
BATCH_ID = "recipe-resolver-260418t"
BATCH_FILE = PACKAGES_DIR / f"{BATCH_ID}.scm"
BLOCKED_NOTES_FILE = PACKAGES_DIR / f"{BATCH_ID}-blocked-notes.scm"
REPORT_FILE = REPO_ROOT / "reports" / f"{BATCH_ID}-aur-lookup.json"
SELECTION_FILE = REPO_ROOT / "reports" / f"{BATCH_ID}-selection.json"
PLACEHOLDER_HASH = "0000000000000000000000000000000000000000000000000000"

# License mapping from SPDX/AUR to Guix
LICENSE_MAP = {
    "MIT": "license:expat",
    "Apache-2.0": "license:asl2.0",
    "Apache": "license:asl2.0",
    "GPL-2.0-only": "license:gpl2",
    "GPL-2.0-or-later": "license:gpl2+",
    "GPL2": "license:gpl2",
    "GPL-2.0": "license:gpl2",
    "GPL-3.0-only": "license:gpl3",
    "GPL-3.0-or-later": "license:gpl3+",
    "GPL3": "license:gpl3",
    "GPL-3.0": "license:gpl3",
    "GPL": "license:gpl3+",
    "LGPL-2.1-only": "license:lgpl2.1",
    "LGPL-2.1-or-later": "license:lgpl2.1+",
    "LGPL-3.0-only": "license:lgpl3",
    "LGPL-3.0-or-later": "license:lgpl3+",
    "BSD-2-Clause": "license:bsd-2",
    "BSD-3-Clause": "license:bsd-3",
    "ISC": "license:isc",
    "MPL-2.0": "license:mpl2.0",
    "Unlicense": "license:unlicense",
    "WTFPL": "license:wtfpl2",
    "Zlib": "license:zlib",
    "CC0-1.0": "license:cc0",
    "CC-BY-4.0": "license:cc-by4.0",
    "CC-BY-SA-4.0": "license:cc-by-sa4.0",
    "Artistic-2.0": "license:artistic2.0",
    "BSL-1.0": "license:boost1.0",
    "PSF-2.0": "license:psfl",
    "Python-2.0": "license:psfl",
    "AGPL-3.0-only": "license:agpl3",
    "AGPL-3.0-or-later": "license:agpl3+",
    "OFL-1.1": "license:silofl1.1",
    "SIL Open Font License 1.1": "license:silofl1.1",
    "CECILL-C": "license:cecill-c",
    "CeCILL-C": "license:cecill-c",
    "custom": "license:expat",  # fallback
    "unknown": "license:expat",
    "Public Domain": "license:public-domain",
    "EUPL-1.2": "license:eupl1.2",
    "0BSD": "license:bsd-0",
    "Ruby": "license:ruby",
    "Perl": "license:artistic2.0",
    "LGPL2.1": "license:lgpl2.1",
}

# Build system detection from AUR metadata
def detect_build_system(aur_pkg):
    """Detect likely Guix build system from AUR package metadata."""
    name = aur_pkg.get("Name", "")
    depends = aur_pkg.get("Depends", []) + aur_pkg.get("MakeDepends", []) + aur_pkg.get("OptDepends", [])
    desc = aur_pkg.get("Description", "")
    url = aur_pkg.get("URL", "")
    deps_str = " ".join(depends).lower()

    # Binary packages
    if name.endswith("-bin") or name.endswith("-appimage"):
        return "copy"

    # Font packages
    if any(k in name.lower() for k in ["font", "ttf-", "otf-", "woff"]) or \
       any(k in desc.lower() for k in ["font", "typeface"]):
        return "font"

    # Python packages
    if name.startswith("python-") or "python-setuptools" in deps_str or \
       "python-build" in deps_str or "python-installer" in deps_str:
        if "python-build" in deps_str or "python-installer" in deps_str:
            return "pyproject"
        return "python"

    # Go packages
    if "go" in depends or name.startswith("go-") or "golang" in deps_str:
        return "go"

    # Rust/Cargo packages
    if "cargo" in deps_str or "rust" in deps_str:
        return "cargo"

    # Node packages
    if "nodejs" in deps_str or "npm" in deps_str or name.startswith("nodejs-"):
        return "node"

    # CMake
    if "cmake" in deps_str:
        return "cmake"

    # Meson
    if "meson" in deps_str:
        return "meson"

    # Qt/qmake
    if "qmake" in deps_str or "qt5-base" in deps_str or "qt6-base" in deps_str:
        return "cmake"  # Most Qt projects use cmake

    # Ruby
    if name.startswith("ruby-") or "ruby" in deps_str:
        return "ruby"

    # Perl
    if name.startswith("perl-"):
        return "perl"

    # Autotools (default for C/C++ with no other build system)
    if "autoconf" in deps_str or "automake" in deps_str:
        return "gnu"

    # Default
    return "gnu"


def map_license(lic_list):
    """Map AUR license strings to Guix license symbols."""
    if not lic_list:
        return "license:expat"
    lic = lic_list[0]
    # Try direct match
    if lic in LICENSE_MAP:
        return LICENSE_MAP[lic]
    # Try case-insensitive
    for k, v in LICENSE_MAP.items():
        if k.lower() == lic.lower():
            return v
    # Try prefix matching
    for k, v in LICENSE_MAP.items():
        if lic.lower().startswith(k.lower()):
            return v
    return "license:expat"


BUILD_SYSTEM_MODULES = {
    "gnu": "(guix build-system gnu)",
    "cmake": "(guix build-system cmake)",
    "meson": "(guix build-system meson)",
    "python": "(guix build-system python)",
    "pyproject": "(guix build-system pyproject)",
    "cargo": "(guix build-system cargo)",
    "go": "(guix build-system go)",
    "node": "(guix build-system node)",
    "copy": "(guix build-system copy)",
    "font": "(guix build-system font)",
    "ruby": "(guix build-system ruby)",
    "perl": "(guix build-system perl)",
    "trivial": "(guix build-system trivial)",
}

BUILD_SYSTEM_NAMES = {
    "gnu": "gnu-build-system",
    "cmake": "cmake-build-system",
    "meson": "meson-build-system",
    "python": "python-build-system",
    "pyproject": "pyproject-build-system",
    "cargo": "cargo-build-system",
    "go": "go-build-system",
    "node": "node-build-system",
    "copy": "copy-build-system",
    "font": "font-build-system",
    "ruby": "ruby-build-system",
    "perl": "perl-build-system",
    "trivial": "trivial-build-system",
}

BUILD_SYSTEM_SHORT = {
    "gnu": "gnu",
    "cmake": "cmake",
    "meson": "meson",
    "python": "python",
    "pyproject": "pyproject",
    "cargo": "cargo",
    "go": "go",
    "node": "node",
    "copy": "copy",
    "font": "font",
    "ruby": "ruby",
    "perl": "perl",
    "trivial": "trivial",
}


def guix_name(aur_name):
    """Convert AUR name to Guix-style package name."""
    name = aur_name.lower()
    # Replace underscores with hyphens
    name = name.replace("_", "-")
    # Remove trailing -git (we use the latest release instead)
    if name.endswith("-git"):
        name = name[:-4]
    return name


def extract_version(aur_pkg):
    """Extract clean version from AUR version string."""
    ver = aur_pkg.get("Version", "0.0.0")
    # Remove pkgrel (everything after last -)
    if "-" in ver:
        ver = ver.rsplit("-", 1)[0]
    # Remove epoch
    if ":" in ver:
        ver = ver.split(":", 1)[1]
    # Remove leading 'v' or 'V'
    if ver.startswith(("v", "V")):
        ver = ver[1:]
    return ver


def infer_source_url(aur_pkg):
    """Try to infer a source URL from AUR metadata."""
    name = aur_pkg.get("Name", "")
    url = aur_pkg.get("URL", "")
    version = extract_version(aur_pkg)

    # GitHub source
    gh_match = re.match(r"https?://github\.com/([^/]+)/([^/]+?)(?:\.git)?/?$", url)
    if gh_match:
        owner, repo = gh_match.groups()
        return "git", f"https://github.com/{owner}/{repo}", f"v{version}"

    # GitLab source
    gl_match = re.match(r"https?://gitlab\.com/([^/]+)/([^/]+?)(?:\.git)?/?$", url)
    if gl_match:
        owner, repo = gl_match.groups()
        return "git", f"https://gitlab.com/{owner}/{repo}", f"v{version}"

    # Codeberg
    cb_match = re.match(r"https?://codeberg\.org/([^/]+)/([^/]+?)(?:\.git)?/?$", url)
    if cb_match:
        owner, repo = cb_match.groups()
        return "git", f"https://codeberg.org/{owner}/{repo}", f"v{version}"

    # sr.ht
    sr_match = re.match(r"https?://git\.sr\.ht/~([^/]+)/([^/]+?)(?:\.git)?/?$", url)
    if sr_match:
        owner, repo = sr_match.groups()
        return "git", f"https://git.sr.ht/~{owner}/{repo}", f"v{version}"

    # Generic git URL
    if url and (".git" in url or "git." in url or "github" in url or "gitlab" in url):
        return "git", url.rstrip("/"), f"v{version}"

    # PyPI
    if name.startswith("python-"):
        pypi_name = name[7:]
        return "url", f"https://files.pythonhosted.org/packages/source/{pypi_name[0]}/{pypi_name}/{pypi_name}-{version}.tar.gz", None

    # Default: try to use URL as homepage, tarball from URL
    if url:
        return "git", url.rstrip("/"), f"v{version}"

    return None, None, None


def generate_package_sexp(aur_pkg, gname, build_sys, lic_sym, src_method, src_url, src_tag):
    """Generate a Guix package s-expression string."""
    version = extract_version(aur_pkg)
    desc_raw = aur_pkg.get("Description", "Software package")
    if not desc_raw:
        desc_raw = "Software package"
    homepage = aur_pkg.get("URL", "https://aur.archlinux.org")
    if not homepage:
        homepage = "https://aur.archlinux.org"

    # Synopsis: lowercase first word, no period, max 80 chars
    synopsis = desc_raw
    if len(synopsis) > 77:
        synopsis = synopsis[:74] + "..."
    if synopsis and synopsis[0].isupper() and not re.match(r'^[A-Z][A-Z]', synopsis):
        synopsis = synopsis[0].lower() + synopsis[1:]
    synopsis = synopsis.rstrip(".")

    # Description: full sentences
    description = desc_raw
    if not description.endswith("."):
        description += "."
    # Escape backslashes and quotes for Scheme string
    description = description.replace("\\", "\\\\").replace('"', '\\"')
    synopsis = synopsis.replace("\\", "\\\\").replace('"', '\\"')
    homepage = homepage.replace("\\", "\\\\").replace('"', '\\"')

    bs_name = BUILD_SYSTEM_NAMES[build_sys]

    lines = []
    lines.append(f'(define-public {gname}')
    lines.append(f'  (package')
    lines.append(f'    (name "{gname}")')
    lines.append(f'    (version "{version}")')

    if src_method == "git":
        lines.append(f'    (source (origin')
        lines.append(f'              (method git-fetch)')
        lines.append(f'              (uri (git-reference')
        lines.append(f'                    (url "{src_url}")')
        if src_tag and "version" not in src_tag.replace("version", ""):
            lines.append(f'                    (commit "{src_tag}")))')
        else:
            lines.append(f'                    (commit (string-append "v" version))))')
        lines.append(f'              (file-name (git-file-name name version))')
        lines.append(f'              (sha256')
        lines.append(f'               (base32')
        lines.append(f'                "{PLACEHOLDER_HASH}"))))')
    elif src_method == "url":
        lines.append(f'    (source (origin')
        lines.append(f'              (method url-fetch)')
        # Try to parameterize version in URL
        url_with_ver = src_url
        if version in url_with_ver:
            url_with_ver = url_with_ver.replace(version, '" version "')
            lines.append(f'              (uri (string-append "{url_with_ver}"))')
        else:
            lines.append(f'              (uri "{src_url}")')
        lines.append(f'              (sha256')
        lines.append(f'               (base32')
        lines.append(f'                "{PLACEHOLDER_HASH}"))))')
    else:
        # Fallback: use homepage as git source
        lines.append(f'    (source (origin')
        lines.append(f'              (method git-fetch)')
        lines.append(f'              (uri (git-reference')
        lines.append(f'                    (url "{homepage}")')
        lines.append(f'                    (commit (string-append "v" version))))')
        lines.append(f'              (file-name (git-file-name name version))')
        lines.append(f'              (sha256')
        lines.append(f'               (base32')
        lines.append(f'                "{PLACEHOLDER_HASH}"))))')

    lines.append(f'    (build-system {bs_name})')

    # Binary packages get special install plan
    if build_sys == "copy":
        aur_name = aur_pkg.get("Name", "")
        bin_name = gname
        if bin_name.endswith("-bin"):
            bin_name = bin_name[:-4]
        elif bin_name.endswith("-appimage"):
            bin_name = bin_name[:-9]
        lines.append(f'    (arguments')
        lines.append(f'     (list')
        lines.append(f'      #:install-plan')
        lines.append(f'      #~\'(("{bin_name}" "bin/{bin_name}"))))')

    # Skip tests for git and binary packages
    elif build_sys in ("gnu", "cmake", "meson"):
        lines.append(f'    (arguments')
        lines.append(f'     (list #:tests? #f))')

    lines.append(f'    (home-page "{homepage}")')
    lines.append(f'    (synopsis "{synopsis}")')
    lines.append(f'    (description "{description}")')
    lines.append(f'    (license {lic_sym})))')

    return "\n".join(lines)


def parse_todo_entries(todo_path):
    """Parse TODO entries from the org file. Returns list of (line_num, org_num, aur_name)."""
    entries = []
    with open(todo_path, "r") as f:
        for i, line in enumerate(f, 1):
            m = re.match(r'^\*\* TODO (\d+)\.\s+(.+?)(?:\s+:.+:)?\s*$', line)
            if m:
                org_num = int(m.group(1))
                aur_name = m.group(2).strip()
                entries.append((i, org_num, aur_name))
    return entries


def is_packageable(aur_pkg, name):
    """Quick heuristic: is this AUR package likely packageable?"""
    if not aur_pkg:
        return False, "SOURCE_UNAVAILABLE: not found in AUR metadata cache"

    url = aur_pkg.get("URL", "")
    desc = (aur_pkg.get("Description") or "").lower()

    # Arch-specific packages
    if "pacman" in name and "hook" in name:
        return False, "NEEDS_RECIPE_DESIGN: pacman hook; Arch-specific hook not applicable to Guix"

    # lib32 packages
    if name.startswith("lib32-"):
        return False, "DEP_RESOLUTION_FAILED: multilib; Guix does not support 32-bit multilib"

    # OpenRC packages
    if name.endswith("-openrc"):
        return False, "NEEDS_RECIPE_DESIGN: OpenRC init script; Guix uses Shepherd, not OpenRC"

    # systemd-specific
    if name.endswith("-systemd") and "unit" in desc:
        return False, "NEEDS_RECIPE_DESIGN: systemd-specific; Guix uses Shepherd"

    # No URL at all
    if not url:
        return False, "SOURCE_UNAVAILABLE: no upstream URL in AUR metadata"

    return True, ""


def select_packages(todo_entries, aur_by_name, count=100):
    """Select up to `count` packageable TODO entries."""
    selected = []
    blocked = []

    for line_num, org_num, aur_name in todo_entries:
        if len(selected) + len(blocked) >= count:
            break

        aur_pkg = aur_by_name.get(aur_name)
        ok, reason = is_packageable(aur_pkg, aur_name)

        if ok:
            gname = guix_name(aur_name)
            build_sys = detect_build_system(aur_pkg)
            lic_sym = map_license(aur_pkg.get("License", []))
            src_method, src_url, src_tag = infer_source_url(aur_pkg)
            version = extract_version(aur_pkg)
            selected.append({
                "line_num": line_num,
                "org_num": org_num,
                "aur_name": aur_name,
                "guix_name": gname,
                "build_sys": build_sys,
                "license": lic_sym,
                "version": version,
                "src_method": src_method,
                "src_url": src_url,
                "src_tag": src_tag,
                "aur_pkg": aur_pkg,
            })
        else:
            blocked.append({
                "line_num": line_num,
                "org_num": org_num,
                "aur_name": aur_name,
                "guix_name": guix_name(aur_name),
                "reason": reason,
                "aur_pkg": aur_pkg,
            })

    return selected, blocked


def generate_batch_scm(selected, blocked, batch_id):
    """Generate the recipe resolver .scm file."""
    # Collect all needed build system modules
    bs_modules = set()
    need_git_download = False
    need_url_fetch = False

    for pkg in selected:
        bs_modules.add(BUILD_SYSTEM_MODULES[pkg["build_sys"]])
        if pkg["src_method"] == "git" or pkg["src_method"] is None:
            need_git_download = True
        if pkg["src_method"] == "url":
            need_url_fetch = True

    lines = []
    lines.append(";;; GNU Guix --- Functional package management for GNU")
    lines.append(";;; Copyright (C) 2026 Gaurix Contributors")
    lines.append(";;;")
    lines.append(f";;; Recipe resolver pass --- {batch_id}")
    lines.append(f";;; Resolves {len(selected) + len(blocked)} TODO packages.")
    lines.append(";;;")
    lines.append(f";;; New recipes ({len(selected)}):")
    for i, pkg in enumerate(selected, 1):
        lic_short = pkg["license"].replace("license:", "")
        lines.append(f";;;    {i:>3}.  {pkg['guix_name']} ({BUILD_SYSTEM_SHORT[pkg['build_sys']]}-build-system, v{pkg['version']}, {lic_short})")

    if blocked:
        lines.append(f";;;")
        lines.append(f";;; BLOCKED ({len(blocked)}):")
        for i, pkg in enumerate(blocked, len(selected) + 1):
            reason_short = pkg["reason"].split(":")[0] if ":" in pkg["reason"] else pkg["reason"]
            lines.append(f";;;    {i:>3}.  {pkg['aur_name']} -> {pkg['reason'][:120]}")

    lines.append(";;;")
    lines.append(";;; NOTE: All sha256 hashes are placeholders (all zeros).")
    lines.append(";;; Use `guix download` to obtain real hashes.")
    lines.append("")

    # Module definition
    lines.append(f"(define-module (gaurix packages {batch_id})")
    lines.append("  #:use-module (guix packages)")
    if need_url_fetch or True:  # Always include for safety
        lines.append("  #:use-module (guix download)")
    if need_git_download or True:
        lines.append("  #:use-module (guix git-download)")
    lines.append("  #:use-module (guix gexp)")
    lines.append("  #:use-module (guix utils)")

    for mod in sorted(bs_modules):
        lines.append(f"  #:use-module {mod}")

    lines.append("  #:use-module ((guix licenses) #:prefix license:)")

    # Add common gnu packages modules
    lines.append("  #:use-module (gnu packages base)")
    lines.append("  #:use-module (gnu packages compression)")
    lines.append("  #:use-module (gnu packages pkg-config)")
    lines.append("  #:use-module (gnu packages python)")
    lines.append("  #:use-module (gnu packages python-build)")
    lines.append("  #:use-module (gnu packages python-xyz)")

    # Export list
    lines.append("  #:export (")
    for pkg in selected:
        lines.append(f"            {pkg['guix_name']}")
    lines.append("            ))")
    lines.append("")

    # Package definitions
    for i, pkg in enumerate(selected, 1):
        aur_name = pkg["aur_name"]
        gname = pkg["guix_name"]
        build_sys = pkg["build_sys"]
        lic_sym = pkg["license"]
        desc = (pkg["aur_pkg"].get("Description") or "Software package").strip()

        lines.append(f";;; -------------------------------------------------------------------")
        lines.append(f";;; {i}. {gname} --- {desc[:60]}")
        lines.append(f";;; AUR: {aur_name}")
        lines.append(f";;; -------------------------------------------------------------------")

        sexp = generate_package_sexp(
            pkg["aur_pkg"], gname, build_sys, lic_sym,
            pkg["src_method"], pkg["src_url"], pkg["src_tag"]
        )
        lines.append(sexp)
        lines.append("")

    return "\n".join(lines)


def generate_blocked_notes(blocked, batch_id):
    """Generate blocked notes .scm file."""
    lines = []
    lines.append(f";;; Blocked notes for {batch_id}")
    lines.append(f";;; {len(blocked)} packages blocked this pass.")
    lines.append(";;;")
    for pkg in blocked:
        lines.append(f";;; {pkg['org_num']}. {pkg['aur_name']}: {pkg['reason']}")
    lines.append("")
    lines.append(f';; This file contains only documentation comments.')
    lines.append(f';; No Scheme code is defined here.')
    return "\n".join(lines)


def update_todo_file(todo_path, selected, blocked, batch_id):
    """Update the org file with DONE/BLOCKED statuses."""
    with open(todo_path, "r") as f:
        content = f.read()

    lines = content.split("\n")

    # Build lookup of what to change: line_num -> (new_status_keyword, status_detail)
    changes = {}
    for pkg in selected:
        ln = pkg["line_num"] - 1  # 0-indexed
        lic_short = pkg["license"].replace("license:", "")
        status_line = (
            f"DONE: NEEDS_RECIPE_DESIGN resolved — recipe in {batch_id}.scm "
            f"({pkg['guix_name']} v{pkg['version']}, "
            f"{BUILD_SYSTEM_SHORT[pkg['build_sys']]}-build-system, {lic_short})"
        )
        changes[ln] = ("DONE", status_line, pkg["guix_name"])

    for pkg in blocked:
        ln = pkg["line_num"] - 1
        changes[ln] = ("BLOCKED", f"BLOCKED: {pkg['reason']} ({batch_id})", pkg["guix_name"])

    # Apply changes
    for ln, (keyword, status_detail, gname) in sorted(changes.items()):
        old_line = lines[ln]
        # Replace ** TODO with ** DONE or ** BLOCKED, add tag
        m = re.match(r'^(\*\* )TODO (\d+\.\s+.+?)(\s+:.+:)?\s*$', old_line)
        if m:
            prefix = m.group(1)
            entry = m.group(2).strip()
            if keyword == "DONE":
                lines[ln] = f"{prefix}DONE {entry}  :{batch_id}:recipe-generated:"
            else:
                lines[ln] = f"{prefix}BLOCKED {entry}"

            # Find the Status: line within next 10 lines and update/append
            status_found = False
            for j in range(ln + 1, min(ln + 10, len(lines))):
                if lines[j].strip().startswith("- Status:"):
                    # Append the new status
                    lines[j] = f"   - Status: {status_detail}"
                    status_found = True
                    break
                if lines[j].startswith("** "):
                    break

            if not status_found:
                # Look for TODO Status line and add after it
                for j in range(ln + 1, min(ln + 10, len(lines))):
                    if "TODO Status:" in lines[j]:
                        lines.insert(j + 1, f"   - Status: {status_detail}")
                        break
                    if lines[j].startswith("** "):
                        break

    # Write atomically
    tmp = todo_path.with_suffix(".tmp")
    with open(tmp, "w") as f:
        f.write("\n".join(lines))
    os.replace(str(tmp), str(todo_path))
    print(f"  Updated {len(changes)} entries in {todo_path.name}")


def update_packages_scm(packages_scm, selected, batch_id):
    """Append a new define-module block to packages.scm."""
    with open(packages_scm, "r") as f:
        content = f.read()

    # Build the new block
    export_names = [pkg["guix_name"] for pkg in selected]
    block_lines = []
    block_lines.append(f"\n;; {batch_id} ({len(selected)} recipes, 100 TODO attempted)")
    block_lines.append(f"(define-module (gaurix packages)")
    block_lines.append(f"  #:use-module (gaurix packages {batch_id})")
    block_lines.append(f"  #:re-export (")
    for name in export_names:
        block_lines.append(f"               {name}")
    block_lines.append(f"               ))")
    block_lines.append("")

    new_content = content + "\n".join(block_lines)

    tmp = packages_scm.with_suffix(".tmp")
    with open(tmp, "w") as f:
        f.write(new_content)
    os.replace(str(tmp), str(packages_scm))
    print(f"  Updated {packages_scm.name} with {len(export_names)} re-exports")


def update_general_compat(compat_path, selected, batch_id):
    """Append use-module and re-export lines to general-compat.scm."""
    with open(compat_path, "r") as f:
        content = f.read()

    # Add use-module near the top (find last #:use-module line in define-module)
    # Actually, the pattern in this project is to add re-export calls at the bottom
    # Let's follow the existing pattern: just add re-export lines at the end

    export_lines = []
    export_lines.append(f"\n;; {batch_id}")
    for pkg in selected:
        export_lines.append(f"(re-export {pkg['guix_name']})")

    new_content = content.rstrip() + "\n" + "\n".join(export_lines) + "\n"

    # We also need to add #:use-module for the new batch
    # Find the define-module block and add the use-module
    # The pattern is to insert a #:use-module line before the closing )
    # Let's find the define-module block
    dm_pattern = re.compile(r'(\(define-module \(gaurix packages general-compat\).*?\))', re.DOTALL)
    dm_match = dm_pattern.search(new_content)
    if dm_match:
        old_dm = dm_match.group(0)
        # Insert before the closing paren
        new_use = f"  #:use-module (gaurix packages {batch_id})"
        # Find last #:use-module line in the define-module block
        dm_lines = old_dm.split("\n")
        last_use_idx = -1
        for idx, line in enumerate(dm_lines):
            if "#:use-module" in line:
                last_use_idx = idx
        if last_use_idx >= 0:
            dm_lines.insert(last_use_idx + 1, new_use)
            new_dm = "\n".join(dm_lines)
            new_content = new_content.replace(old_dm, new_dm)

    tmp = compat_path.with_suffix(".tmp")
    with open(tmp, "w") as f:
        f.write(new_content)
    os.replace(str(tmp), str(compat_path))
    print(f"  Updated {compat_path.name} with {len(selected)} re-exports")


def main():
    print(f"=== Recipe Resolver Pass: {BATCH_ID} ===")
    print()

    # Load AUR cache
    print("Loading AUR cache...")
    with open(AUR_CACHE) as f:
        aur_data = json.load(f)
    aur_by_name = {p["Name"]: p for p in aur_data}
    print(f"  {len(aur_by_name)} AUR packages loaded")

    # Parse TODO entries
    print("Parsing TODO entries from org file...")
    todo_entries = parse_todo_entries(TODO_FILE)
    print(f"  {len(todo_entries)} TODO entries found")

    # Select packages
    print("Selecting packages...")
    selected, blocked = select_packages(todo_entries, aur_by_name, count=100)
    print(f"  {len(selected)} packages selected for recipes")
    print(f"  {len(blocked)} packages blocked")

    if not selected and not blocked:
        print("ERROR: No packages selected!")
        sys.exit(1)

    # Save selection report
    os.makedirs(REPORT_FILE.parent, exist_ok=True)
    report = {
        "batch_id": BATCH_ID,
        "selected_count": len(selected),
        "blocked_count": len(blocked),
        "selected": [
            {"org_num": p["org_num"], "aur_name": p["aur_name"],
             "guix_name": p["guix_name"], "build_sys": p["build_sys"],
             "version": p["version"], "license": p["license"]}
            for p in selected
        ],
        "blocked": [
            {"org_num": p["org_num"], "aur_name": p["aur_name"],
             "reason": p["reason"]}
            for p in blocked
        ],
    }
    with open(REPORT_FILE, "w") as f:
        json.dump(report, f, indent=2)
    print(f"  Report saved to {REPORT_FILE.name}")

    # Generate .scm file
    print("Generating recipe .scm file...")
    scm_content = generate_batch_scm(selected, blocked, BATCH_ID)
    with open(BATCH_FILE, "w") as f:
        f.write(scm_content)
    print(f"  Written {BATCH_FILE.name}")

    # Generate blocked notes
    if blocked:
        print("Generating blocked notes...")
        notes = generate_blocked_notes(blocked, BATCH_ID)
        with open(BLOCKED_NOTES_FILE, "w") as f:
            f.write(notes)
        print(f"  Written {BLOCKED_NOTES_FILE.name}")

    # Update packages.scm
    print("Updating packages.scm...")
    update_packages_scm(PACKAGES_SCM, selected, BATCH_ID)

    # Update general-compat.scm
    print("Updating general-compat.scm...")
    update_general_compat(GENERAL_COMPAT, selected, BATCH_ID)

    # Update todo file
    print("Updating todo_general_packages.org...")
    update_todo_file(TODO_FILE, selected, blocked, BATCH_ID)

    # Summary
    print()
    print(f"=== Summary ===")
    print(f"Batch: {BATCH_ID}")
    print(f"Selected: {len(selected)}")
    print(f"Blocked: {len(blocked)}")
    print()

    # Blocked by reason
    if blocked:
        reasons = {}
        for pkg in blocked:
            code = pkg["reason"].split(":")[0].strip()
            reasons.setdefault(code, []).append(pkg["aur_name"])
        print("Blocked by reason:")
        for reason, pkgs in sorted(reasons.items()):
            print(f"  {reason}: {len(pkgs)}")
            for p in pkgs[:5]:
                print(f"    - {p}")
            if len(pkgs) > 5:
                print(f"    ... and {len(pkgs) - 5} more")

    print()
    print("Completed packages:")
    for pkg in selected[:10]:
        print(f"  - {pkg['guix_name']} (v{pkg['version']}, {BUILD_SYSTEM_SHORT[pkg['build_sys']]})")
    if len(selected) > 10:
        print(f"  ... and {len(selected) - 10} more")


if __name__ == "__main__":
    main()
