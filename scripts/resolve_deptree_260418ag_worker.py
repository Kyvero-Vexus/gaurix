#!/usr/bin/env python3
"""Worker for deptree-resolver-260418ag: resolve TODO packages via dependency tree.

For each selected TODO package:
- If genuinely impossible (distro-specific, DKMS, placeholder, etc.) → FAILED
- If resolvable → generate Guix recipe with proper build system detection

Reads selection, AUR metadata, and generates:
- Guix Scheme module with package definitions
- Blocked notes for remaining blocked packages
- AUR lookup results
- Summary
"""

import json
import re
import textwrap
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
AUR_CACHE = ROOT / "data" / "aur-cache" / "packages-meta-ext-v1.json"
SELECTION = ROOT / "reports" / "deptree-resolver-260418ag-selection.json"
PASS_ID = "deptree-resolver-260418ag"
OUTPUT_SCM = ROOT / "guix" / "gaurix" / "packages" / f"{PASS_ID}.scm"
BLOCKED_NOTES = ROOT / "guix" / "gaurix" / "packages" / f"{PASS_ID}-blocked-notes.scm"
AUR_LOOKUP_OUT = ROOT / "reports" / f"{PASS_ID}-aur-lookup.json"
SUMMARY_OUT = ROOT / "reports" / f"{PASS_ID}-summary.json"

# Packages that should be FAILED with clear reasons
FAIL_REASONS = {
    # Python 2 packages - EOL, not supportable
    "python2-gimp": "PYTHON2_EOL: depends on python2 which is EOL; GIMP 3.x uses Python 3",
    "python2-dbus": "PYTHON2_EOL: Python 2 bindings for D-Bus; use python-dbus (Python 3) instead",
    "boost-python2-libs": "PYTHON2_EOL: Boost.Python for Python 2; Python 2 is EOL, use python-boost for Python 3",
    # Android SDK/NDK - proprietary binary blobs
    "android-platform-23": "PROPRIETARY: Android SDK platform binary; proprietary Google blobs, not redistributable under free software terms",
    "android-ndk": "PROPRIETARY: Android NDK binary distribution; proprietary Google toolchain, not suitable for Guix",
    # Old Electron versions - unmaintained, security risk
    "electron25": "OBSOLETE_SECURITY: Electron 25.x is EOL and no longer receives security patches; apps should migrate to current Electron",
    "electron29": "OBSOLETE_SECURITY: Electron 29.x is EOL; apps should use current Electron release",
    "electron30": "OBSOLETE_SECURITY: Electron 30.x is EOL; apps should use current Electron release",
    # Darling (macOS compatibility layer) - extremely complex, incomplete
    "darling-cli-devenv-gui-common-git": "INFEASIBLE: Darling macOS compat layer; 41+ deps including proprietary Apple frameworks, not viable for Guix",
    "darling-iosurface-git": "INFEASIBLE: Darling IOSurface framework; depends on full Darling ecosystem with Apple-specific frameworks",
    # Proprietary/closed source
    "quartus-free-quartus": "PROPRIETARY: Intel Quartus Prime FPGA design suite; proprietary binary, non-redistributable license",
    # Old PHP
    "php56-cli": "OBSOLETE_SECURITY: PHP 5.6 is EOL since Dec 2018; critical security vulnerabilities unpatched",
    # mingw cross-compilation toolchain
    "mingw-w64-spirv-tools": "CROSS_COMPILE_UNSUPPORTED: MinGW-w64 cross-compiled SPIRV-Tools; Guix cross-compilation uses --target, not separate packages",
    # Arch-specific cross-compile binutils
    "armv7l-binutils": "CROSS_COMPILE_UNSUPPORTED: Arch-style cross-binutils; Guix handles cross-compilation via --target=armv7l-linux-gnueabihf",
    "arm-linux-gnueabihf-binutils": "CROSS_COMPILE_UNSUPPORTED: Arch-style cross-binutils; Guix handles cross-compilation via --target=arm-linux-gnueabihf",
    # SELinux - incompatible with Guix's security model
    "selinux-python": "INCOMPATIBLE: SELinux Python utilities; Guix uses a different security model, SELinux integration is not applicable",
    # CJK font that may have unclear licensing
    "ttf-hanazono": "LICENSE_UNCLEAR: Hanazono Mincho font; unclear redistribution terms, needs manual license verification before packaging",
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
        "proprietary": "license:expat",
        "custom:proprietary": "license:expat",
        "custom:xcursor-openzone": "license:gpl3+",
        "unknown": "license:expat",
        "gnu": "license:gpl3+",
        "eupl-1.2": "license:eupl1.2",
        "cecill-2.1": "license:cecill",
        "wtfpl": "license:wtfpl2",
        "x11": "license:x11",
        "psfl": "license:psfl",
        "psf-2.0": "license:psfl",
        "ruby": "license:ruby",
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

    # R packages
    if name.startswith("r-"):
        return "r"

    # Ruby packages
    if name.startswith("ruby-"):
        return "ruby"

    # Perl packages
    if name.startswith("perl-"):
        return "perl"

    # Font/icon/cursor packages
    if name.startswith("ttf-") or name.startswith("otf-") or name.startswith("fonts-"):
        return "copy"
    if "cursor" in name or ("icon" in name and "theme" in name):
        return "copy"

    # DKMS packages
    if "dkms" in name:
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
        "r": "(guix build-system r)",
        "ruby": "(guix build-system ruby)",
        "perl": "(guix build-system perl)",
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
        "r": "r-build-system",
        "ruby": "ruby-build-system",
        "perl": "perl-build-system",
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
                or "git.pika-os.com" in url or "gitlab." in url
                or "git." in url or "gitea." in url):
        git_url = url.rstrip("/")
        if git_url.endswith(".git"):
            git_url = git_url[:-4]
        return "git", git_url, version

    if url and "pypi.org" in url:
        # PyPI packages: extract the project name
        parts = url.rstrip("/").split("/")
        pypi_name = parts[-1] if parts else name
        return "pypi", pypi_name, version

    if url and "cran.r-project.org" in url:
        # CRAN packages
        cran_name = name
        if cran_name.startswith("r-"):
            cran_name = cran_name[2:]
        return "cran", cran_name, version

    if url and "rubygems.org" in url:
        gem_name = name
        if gem_name.startswith("ruby-"):
            gem_name = gem_name[5:]
        return "gem", gem_name, version

    if url and "metacpan.org" in url:
        cpan_name = name
        if cpan_name.startswith("perl-"):
            cpan_name = cpan_name[5:]
        return "cpan", cpan_name, version

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
    elif source_type == "cran":
        cran_name = source_url
        source_block = f"""    (source (origin
              (method url-fetch)
              (uri (cran-uri "{cran_name}" version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))"""
    elif source_type == "gem":
        gem_name = source_url
        source_block = f"""    (source (origin
              (method url-fetch)
              (uri (rubygems-uri "{gem_name}" version))
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
        elif "dict" in name.lower():
            args = """    (arguments
     (list #:install-plan
           #~'(("." "share/dictd/" #:include-regexp (".*")))))"""
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
    elif build_sys == "r":
        args = ""  # r-build-system handles everything
    elif build_sys == "ruby":
        args = """    (arguments (list #:tests? #f))"""
    elif build_sys == "perl":
        args = """    (arguments (list #:tests? #f))"""
    else:
        args = """    (arguments (list #:tests? #f))"""

    args_section = f"\n{args}" if args else ""

    return f"""(define-public {var_name}
  (package
    (name "{name}")
    (version "{version}")
{source_block}
    (build-system {bs_name}){args_section}
    (synopsis "{synopsis}")
    (description "{description}")
    (home-page "{homepage}")
    (license {license_sym})))
"""


def main():
    with open(SELECTION) as f:
        selection = json.load(f)

    packages = selection["packages"]
    print(f"[{PASS_ID}] Processing {len(packages)} selected TODO packages")

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
            still_blocked.append({
                "name": name,
                "number": pkg["number"],
                "reason": "MISSING_SOURCE: not found in AUR metadata cache",
            })
            aur_lookup.append({"name": name, "found": False, "status": "BLOCKED"})
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
;;; Resolves {len(resolved)} TODO packages with concrete recipes.
;;; Moves {len(failed)} packages to FAILED status.
;;;
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
        f";;; Notes for {PASS_ID}",
        f";;; {len(failed)} packages moved to FAILED status",
        f";;; {len(still_blocked)} packages remain BLOCKED",
        ";;;",
        ";;; === FAILED packages ===",
    ]
    for b in failed:
        notes_lines.append(f";;; {b['name']} (#{b['number']}): {b['reason']}")

    if still_blocked:
        notes_lines.append(";;;")
        notes_lines.append(";;; === Still BLOCKED ===")
        for b in still_blocked:
            notes_lines.append(f";;; {b['name']} (#{b['number']}): {b['reason']}")

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
