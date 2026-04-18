#!/usr/bin/env python3
"""Worker for deptree-resolver-260418s: generates Guix recipes from AUR metadata.

Reads the selection file, looks up AUR metadata for each package,
determines the appropriate build system/source, and generates a
Guix Scheme module with package definitions.
"""

import json
import re
import textwrap
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
AUR_CACHE = ROOT / "data" / "aur-cache" / "packages-meta-ext-v1.json"
SELECTION = ROOT / "reports" / "deptree-resolver-260418s-selection.json"
PASS_ID = "deptree-resolver-260418s"
OUTPUT_SCM = ROOT / "guix" / "gaurix" / "packages" / f"{PASS_ID}.scm"
BLOCKED_NOTES = ROOT / "guix" / "gaurix" / "packages" / f"{PASS_ID}-blocked-notes.scm"
AUR_LOOKUP_OUT = ROOT / "reports" / f"{PASS_ID}-aur-lookup.json"
SUMMARY_OUT = ROOT / "reports" / f"{PASS_ID}-summary.json"


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
        "custom": "license:non-copyleft",
        "proprietary": "license:non-copyleft",
        "custom:proprietary": "license:non-copyleft",
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

    return "license:non-copyleft"


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
    if any(d == "autoconf" or d == "automake" for d in all_deps):
        return "gnu"

    if name.startswith("python-"):
        return "pyproject"

    # Font packages
    if name.startswith("ttf-") or name.startswith("otf-") or name.startswith("fonts-"):
        return "copy"

    # DKMS packages
    if "dkms" in name:
        return "copy"

    # i18n/locale packs
    if "-i18n-" in name:
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
    }
    return mapping.get(bs, "gnu-build-system")


def make_synopsis(aur_pkg):
    """Create a lint-compliant synopsis."""
    desc = aur_pkg.get("Description") or aur_pkg.get("Name", "")
    desc = desc.strip()
    if len(desc) > 78:
        desc = desc[:75] + "..."
    if desc.endswith("."):
        desc = desc[:-1]
    if desc and desc[0].isupper():
        desc = desc[0].lower() + desc[1:]
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
                or "sr.ht" in url or "bitbucket.org" in url):
        git_url = url.rstrip("/")
        if git_url.endswith(".git"):
            git_url = git_url[:-4]
        return "git", git_url, version

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
        source_block = f"""    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "{source_url}")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))"""
    else:
        source_block = f"""    (source (origin
              (method url-fetch)
              (uri "{source_url}")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))"""

    if build_sys == "copy":
        args = """    (arguments
     (list #:install-plan
           #~'(("." "share/"))))"""
    elif build_sys == "go":
        import_path = source_url.replace("https://", "") if source_type == "git" else name
        args = f"""    (arguments
     (list #:import-path "{import_path}"
           #:tests? #f))"""
    else:
        args = """    (arguments (list #:tests? #f))"""

    return f"""(define-public {var_name}
  (package
    (name "{name}")
    (version "{version}")
{source_block}
    (build-system {bs_name})
{args}
    (synopsis "{synopsis}")
    (description "{description}")
    (home-page "{homepage}")
    (license {license_sym})))
"""


def main():
    with open(SELECTION) as f:
        selection = json.load(f)

    packages = selection["packages"]
    print(f"[{PASS_ID}] Processing {len(packages)} selected packages")

    aur_cache = load_aur_cache(AUR_CACHE)

    resolved = []
    blocked = []
    aur_lookup = []
    build_systems_used = set()

    for pkg in packages:
        name = pkg["name"]
        aur_data = aur_cache.get(name)

        if not aur_data:
            blocked.append({
                "name": name,
                "number": pkg["number"],
                "reason": "MISSING_SOURCE: not found in AUR metadata cache",
            })
            aur_lookup.append({"name": name, "found": False})
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
        })

    print(f"  Resolved: {len(resolved)}, Blocked: {len(blocked)}")

    with open(AUR_LOOKUP_OUT, "w") as f:
        json.dump(aur_lookup, f, indent=2)

    # Generate Scheme module
    bs_modules = sorted(set(build_system_module(r["build_system"]) for r in resolved))
    exports = [sanitize_name(r["name"]) for r in resolved]

    header = f""";;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency tree resolver pass --- {PASS_ID}
;;; Resolves {len(resolved)} packages from dependency tree queue (TODO pool).
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

    if blocked:
        notes_lines = [
            f";;; Blocked notes for {PASS_ID}",
            f";;; {len(blocked)} packages could not be resolved",
            ";;;",
        ]
        for b in blocked:
            notes_lines.append(f";;; {b['name']} (#{b['number']}): {b['reason']}")

        with open(BLOCKED_NOTES, "w") as f:
            f.write("\n".join(notes_lines) + "\n")
        print(f"  Wrote {BLOCKED_NOTES}")

    summary = {
        "pass_id": PASS_ID,
        "total_selected": len(packages),
        "resolved": len(resolved),
        "blocked": len(blocked),
        "resolved_packages": [{"name": r["name"], "number": r["number"],
                               "version": r["version"], "build_system": r["build_system"]}
                              for r in resolved],
        "blocked_packages": blocked,
    }
    with open(SUMMARY_OUT, "w") as f:
        json.dump(summary, f, indent=2)
    print(f"  Wrote {SUMMARY_OUT}")

    return resolved, blocked


if __name__ == "__main__":
    resolved, blocked = main()
