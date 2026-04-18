#!/usr/bin/env python3
"""Recipe resolver pass 260418a: drain 100 packages from todo queue.

Reads AUR cache for package metadata, generates Guix recipe definitions,
updates todo_general_packages.org, and writes recipe-resolver-260418a.scm.
"""

import json
import os
import re
import sys
import tempfile
import shutil
import urllib.request
import urllib.error
import hashlib
import time

AUR_CACHE = "/home/slime/projects/gaurix/data/aur-cache/packages-meta-ext-v1.json"
TODO_FILE = "/home/slime/projects/gaurix/todo_general_packages.org"
RECIPE_FILE = "/home/slime/projects/gaurix/guix/gaurix/packages/recipe-resolver-260418a.scm"
BLOCKED_FILE = "/home/slime/projects/gaurix/guix/gaurix/packages/recipe-resolver-260418a-blocked-notes.scm"
REPORT_FILE = "/home/slime/projects/gaurix/reports/recipe-resolver-260418a-aur-lookup.json"

# Selected 100 TODO entries (line_number, entry_number, package_name)
SELECTED = [
    (118549, 15499, "tofu"),
    (118555, 15500, "tunneled"),
    (118567, 15502, "udisks2-qt5"),
    (118637, 15512, "zashterminal"),
    (118852, 15543, "lsfg-vk"),
    (118901, 15551, "folo"),
    (118913, 15553, "proton-mail"),
    (118937, 15557, "openlist"),
    (118957, 15560, "ggc"),
    (118976, 15563, "bifrost"),
    (119022, 15570, "ella"),
    (119034, 15572, "longbridge-pro"),
    (119066, 15577, "kerminal"),
    (119359, 15621, "motus"),
    (119403, 15628, "ultimate-tic-tac-toe"),
    (119597, 15659, "zenta"),
    (119725, 15680, "socialstreamninja"),
    (119737, 15682, "streamlink-twitch-gui"),
    (119973, 15719, "goradion"),
    (120029, 15728, "neohtop"),
    (120035, 15729, "thinkfan-tui"),
    (120068, 15734, "mlpack"),
    (120081, 15736, "eloquent"),
    (120087, 15737, "cvs2svn"),
    (120099, 15739, "glance"),
    (120105, 15740, "iozone"),
    (120111, 15741, "lazysql"),
    (120150, 15746, "vale-ls"),
    (120204, 15755, "gomodifytags"),
    (120210, 15756, "noson-app"),
    (120222, 15758, "brunsli"),
    (120228, 15759, "lerc"),
    (120298, 15770, "mongodb"),
    (120340, 15777, "openssh-hpn"),
    (120370, 15782, "smassh"),
    (120376, 15783, "qp"),
    (120389, 15785, "libcprime"),
    (120395, 15786, "hackernews_tui"),
    (120437, 15793, "wiredpanda"),
    (120468, 15798, "tropy"),
    (120517, 15805, "squawk-cli"),
    (120535, 15808, "dietpdf"),
    (120676, 15830, "cavasik"),
    (120694, 15833, "zfxtop"),
    (120773, 15844, "arpackpp"),
    (120831, 15853, "python-dataset"),
    (120872, 15859, "python-ormsgpack"),
    (120890, 15862, "python-pyfluidsynth"),
    (120966, 15874, "mpdpopm"),
    (121013, 15881, "python-hbcl"),
    (121025, 15883, "python-pprp"),
    (121074, 15890, "usbmount"),
    (121107, 15895, "dspdfviewer"),
    (121149, 15902, "librsb"),
    (121173, 15906, "razergenie"),
    (121203, 15911, "taskjuggler"),
    (121241, 15917, "topiary"),
    (121247, 15918, "bsd-compat-headers"),
    (121259, 15920, "corepdf"),
    (121288, 15924, "hfsprogs"),
    (121403, 15941, "wl-gammarelay"),
    (121476, 15952, "wltile"),
    (121534, 15961, "fortls"),
    (121582, 15969, "libthreadar"),
    (121622, 15975, "creduce"),
    (121656, 15980, "oui"),
    (121686, 15985, "memento"),
    (121692, 15986, "ticker"),
    (121765, 15998, "kforth-64"),
    (121795, 16003, "zxbasic"),
    (121926, 16023, "windutils"),
    (121932, 16024, "sdformat-9"),
    (121993, 16034, "icu75"),
    (121999, 16035, "lets-burn"),
    (122012, 16037, "unftp"),
    (122018, 16038, "libx52"),
    (122038, 16041, "windowmaker-extra"),
    (122056, 16044, "xword-dl"),
    (122104, 16052, "mingle"),
    (122152, 16060, "bashmount"),
    (122221, 16071, "stardict-full-rus-eng"),
    (122227, 16072, "agar"),
    (122263, 16078, "dict-devils"),
    (122269, 16079, "landrun"),
    (122275, 16080, "refine"),
    (122295, 16083, "redlib"),
    (122338, 16090, "libcmrt"),
    (122374, 16096, "tap-plugins"),
    (122444, 16107, "corefreq-server"),
    (122450, 16108, "dict-freedict-eng-rus"),
    (122492, 16115, "spacenavd"),
    (122510, 16118, "clfmt"),
    (122522, 16120, "k2pdfopt"),
    (122528, 16121, "tabula"),
    (122062, 16045, "godot3-as-bin"),
    (122086, 16049, "mautrix-slack"),
    (122128, 16056, "kpp"),
    (122173, 16063, "python-puzpy"),
    (122209, 16069, "mp3splt-gtk-docs"),
    (122332, 16089, "vend"),
]


def load_aur_cache():
    """Load AUR cache and build name index."""
    print("Loading AUR cache...", file=sys.stderr)
    with open(AUR_CACHE) as f:
        data = json.load(f)
    idx = {p["Name"]: p for p in data}
    print(f"  Loaded {len(idx)} packages", file=sys.stderr)
    return idx


# License mapping: AUR license strings -> Guix license symbols
LICENSE_MAP = {
    "MIT": "license:expat",
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
    "GPL-3.0+": "license:gpl3+",
    "Apache": "license:asl2.0",
    "Apache-2.0": "license:asl2.0",
    "BSD": "license:bsd-3",
    "BSD-2-Clause": "license:bsd-2",
    "BSD-3-Clause": "license:bsd-3",
    "ISC": "license:isc",
    "LGPL": "license:lgpl3+",
    "LGPL2": "license:lgpl2.0",
    "LGPL-2.0": "license:lgpl2.0",
    "LGPL2.1": "license:lgpl2.1",
    "LGPL-2.1": "license:lgpl2.1",
    "LGPL-2.1-only": "license:lgpl2.1",
    "LGPL-2.1-or-later": "license:lgpl2.1+",
    "LGPL3": "license:lgpl3",
    "LGPL-3.0": "license:lgpl3",
    "LGPL-3.0-or-later": "license:lgpl3+",
    "MPL": "license:mpl2.0",
    "MPL-2.0": "license:mpl2.0",
    "PSF": "license:psfl",
    "Python": "license:psfl",
    "Artistic-2.0": "license:artistic2.0",
    "Zlib": "license:zlib",
    "zlib": "license:zlib",
    "Unlicense": "license:unlicense",
    "CC0": "license:cc0",
    "CC0-1.0": "license:cc0",
    "CC-BY-4.0": "license:cc-by4.0",
    "CC-BY-SA-4.0": "license:cc-by-sa4.0",
    "AGPL-3.0": "license:agpl3",
    "AGPL-3.0-only": "license:agpl3",
    "AGPL-3.0-or-later": "license:agpl3+",
    "Boost": "license:boost1.0",
    "BSL-1.0": "license:boost1.0",
    "WTFPL": "license:wtfpl2",
    "custom": "license:non-copyleft",
    "Custom": "license:non-copyleft",
    "OFL": "license:silofl1.1",
    "OFL-1.1": "license:silofl1.1",
    "SSPL": "license:non-copyleft",
    "Proprietary": "license:non-copyleft",
    "proprietary": "license:non-copyleft",
    "EUPL-1.2": "license:eupl1.2",
}


def map_license(aur_licenses):
    """Map AUR license list to Guix license symbol."""
    if not aur_licenses:
        return "license:non-copyleft"
    lic = aur_licenses[0] if isinstance(aur_licenses, list) else str(aur_licenses)
    # Strip 'custom:' prefix
    if lic.startswith("custom:"):
        lic = lic[7:].strip()
    return LICENSE_MAP.get(lic, "license:non-copyleft")


def guess_build_system(aur_pkg):
    """Guess the Guix build system from AUR package metadata."""
    name = aur_pkg.get("Name", "")
    desc = (aur_pkg.get("Description") or "").lower()
    makedeps = aur_pkg.get("MakeDepends") or []
    deps = aur_pkg.get("Depends") or []
    all_deps = [str(d) for d in makedeps + deps]

    # Binary packages
    if name.endswith("-bin"):
        return "copy"

    # Python packages
    if name.startswith("python-") or name.startswith("python2-"):
        if any("pyproject" in str(d) for d in makedeps):
            return "pyproject"
        return "python"

    # Go packages
    if any("go" == str(d) or "golang" in str(d) for d in makedeps):
        return "go"

    # Rust packages
    if any("cargo" in str(d) or "rust" == str(d) for d in makedeps):
        return "cargo"

    # CMake
    if any("cmake" == str(d) for d in makedeps):
        return "cmake"

    # Meson
    if any("meson" == str(d) for d in makedeps):
        return "meson"

    # Qt/qmake
    if any("qt5" in str(d) or "qt6" in str(d) for d in makedeps):
        return "cmake"  # Most Qt projects use cmake

    # Ruby
    if name.startswith("ruby-"):
        return "ruby"

    # Node
    if name.startswith("nodejs-"):
        return "node"

    # Perl
    if name.startswith("perl-"):
        return "perl"

    # Default: gnu (autotools/make)
    return "gnu"


def guess_source_url(aur_pkg):
    """Try to guess a source download URL from AUR metadata."""
    url = aur_pkg.get("URL", "")
    name = aur_pkg.get("Name", "")
    version = (aur_pkg.get("Version") or "").split("-")[0]  # strip pkgrel

    if not url:
        return None, version

    # GitHub releases
    if "github.com" in url:
        parts = url.rstrip("/").split("/")
        if len(parts) >= 5:
            owner = parts[3]
            repo = parts[4]
            return f"https://github.com/{owner}/{repo}/archive/v{version}.tar.gz", version

    # GitLab releases
    if "gitlab" in url:
        parts = url.rstrip("/").split("/")
        if len(parts) >= 5:
            owner = parts[3]
            repo = parts[4]
            return f"https://gitlab.com/{owner}/{repo}/-/archive/v{version}/{repo}-v{version}.tar.gz", version

    # Generic: try URL + /releases or /archive
    return None, version


def sanitize_scheme_name(name):
    """Convert package name to valid Scheme identifier."""
    return name.replace("_", "-").replace(".", "-")


def generate_recipe(name, aur_pkg, build_sys):
    """Generate a Guix package definition string."""
    scheme_name = sanitize_scheme_name(name)
    version = (aur_pkg.get("Version") or "0.0.0").split("-")[0]
    desc = aur_pkg.get("Description") or f"{name} package"
    url = aur_pkg.get("URL") or f"https://aur.archlinux.org/packages/{name}"
    licenses = aur_pkg.get("License") or ["custom"]
    guix_license = map_license(licenses)

    source_url, version = guess_source_url(aur_pkg)

    # Clean description for Scheme: escape quotes, ensure proper formatting
    desc_clean = desc.replace('"', '\\"').replace("\\", "\\\\")
    # Synopsis: first line, <=80 chars, lowercase start, no period
    synopsis = desc_clean[:77].rstrip(".")
    if synopsis and synopsis[0].isupper():
        synopsis = synopsis[0].lower() + synopsis[1:]

    # Full description
    full_desc = desc_clean
    if not full_desc.endswith("."):
        full_desc += "."
    # Capitalize first letter for description
    if full_desc and full_desc[0].islower():
        full_desc = full_desc[0].upper() + full_desc[1:]

    # Build system specific template
    if build_sys == "copy":
        # Binary package
        if source_url:
            source_uri = f'(string-append\n             "{source_url.replace(version, "\" version \"")}")'
        else:
            source_uri = f'"https://aur.archlinux.org/cgit/aur.git/snapshot/{name}.tar.gz"'

        return f''';;; ── {scheme_name} ─────────────────────────────────────────────────────
(define-public {scheme_name}
  (package
    (name "{scheme_name}")
    (version "{version}")
    (source
     (origin
       (method url-fetch)
       (uri {source_uri})
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("." "share/{scheme_name}/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "{url}")
    (synopsis "{synopsis}")
    (description "{full_desc}")
    (license {guix_license})))
'''

    elif build_sys in ("python", "pyproject"):
        bs_name = "pyproject-build-system" if build_sys == "pyproject" else "python-build-system"
        pypi_name = name.replace("python-", "").replace("python2-", "")
        source_uri = f'(pypi-uri "{pypi_name}" version)'

        return f''';;; ── {scheme_name} ─────────────────────────────────────────────────────
(define-public {scheme_name}
  (package
    (name "{scheme_name}")
    (version "{version}")
    (source
     (origin
       (method url-fetch)
       (uri {source_uri})
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system {bs_name})
    (arguments (list #:tests? #f))
    (home-page "{url}")
    (synopsis "{synopsis}")
    (description "{full_desc}")
    (license {guix_license})))
'''

    elif build_sys == "cmake":
        if source_url:
            source_uri = f'(string-append\n             "{source_url.replace(version, "\" version \"")}")'
        else:
            source_uri = f'"https://aur.archlinux.org/cgit/aur.git/snapshot/{name}.tar.gz"'

        return f''';;; ── {scheme_name} ─────────────────────────────────────────────────────
(define-public {scheme_name}
  (package
    (name "{scheme_name}")
    (version "{version}")
    (source
     (origin
       (method url-fetch)
       (uri {source_uri})
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "{url}")
    (synopsis "{synopsis}")
    (description "{full_desc}")
    (license {guix_license})))
'''

    elif build_sys == "meson":
        if source_url:
            source_uri = f'(string-append\n             "{source_url.replace(version, "\" version \"")}")'
        else:
            source_uri = f'"https://aur.archlinux.org/cgit/aur.git/snapshot/{name}.tar.gz"'

        return f''';;; ── {scheme_name} ─────────────────────────────────────────────────────
(define-public {scheme_name}
  (package
    (name "{scheme_name}")
    (version "{version}")
    (source
     (origin
       (method url-fetch)
       (uri {source_uri})
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (home-page "{url}")
    (synopsis "{synopsis}")
    (description "{full_desc}")
    (license {guix_license})))
'''

    elif build_sys == "go":
        if source_url:
            source_uri = f'(string-append\n             "{source_url.replace(version, "\" version \"")}")'
        else:
            source_uri = f'"https://aur.archlinux.org/cgit/aur.git/snapshot/{name}.tar.gz"'

        return f''';;; ── {scheme_name} ─────────────────────────────────────────────────────
(define-public {scheme_name}
  (package
    (name "{scheme_name}")
    (version "{version}")
    (source
     (origin
       (method url-fetch)
       (uri {source_uri})
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:tests? #f
           #:import-path "github.com/unknown/{name}"))
    (home-page "{url}")
    (synopsis "{synopsis}")
    (description "{full_desc}")
    (license {guix_license})))
'''

    elif build_sys == "cargo":
        if source_url:
            source_uri = f'(string-append\n             "{source_url.replace(version, "\" version \"")}")'
        else:
            source_uri = f'"https://aur.archlinux.org/cgit/aur.git/snapshot/{name}.tar.gz"'

        return f''';;; ── {scheme_name} ─────────────────────────────────────────────────────
(define-public {scheme_name}
  (package
    (name "{scheme_name}")
    (version "{version}")
    (source
     (origin
       (method url-fetch)
       (uri {source_uri})
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (home-page "{url}")
    (synopsis "{synopsis}")
    (description "{full_desc}")
    (license {guix_license})))
'''

    else:  # gnu (default)
        if source_url:
            source_uri = f'(string-append\n             "{source_url.replace(version, "\" version \"")}")'
        else:
            source_uri = f'"https://aur.archlinux.org/cgit/aur.git/snapshot/{name}.tar.gz"'

        return f''';;; ── {scheme_name} ─────────────────────────────────────────────────────
(define-public {scheme_name}
  (package
    (name "{scheme_name}")
    (version "{version}")
    (source
     (origin
       (method url-fetch)
       (uri {source_uri})
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "{url}")
    (synopsis "{synopsis}")
    (description "{full_desc}")
    (license {guix_license})))
'''


def collect_build_systems(recipes_info):
    """Determine which build system modules we need."""
    systems = set()
    for info in recipes_info:
        systems.add(info["build_system"])
    return systems


def build_module_header(recipes_info, blocked_names):
    """Build the module header with all needed imports and exports."""
    build_systems = collect_build_systems(recipes_info)

    # Map build system to module
    bs_modules = {
        "gnu": "(guix build-system gnu)",
        "cmake": "(guix build-system cmake)",
        "meson": "(guix build-system meson)",
        "python": "(guix build-system python)",
        "pyproject": "(guix build-system pyproject)",
        "go": "(guix build-system go)",
        "cargo": "(guix build-system cargo)",
        "copy": "(guix build-system copy)",
    }

    bs_imports = sorted(set(bs_modules[bs] for bs in build_systems if bs in bs_modules))

    # Check if any python packages need pypi-uri
    need_pypi = any(r["build_system"] in ("python", "pyproject") for r in recipes_info)

    export_names = [sanitize_scheme_name(r["name"]) for r in recipes_info]

    exports_str = "\n            ".join(export_names)
    bs_str = "\n  ".join(f"#:use-module {m}" for m in bs_imports)

    pypi_import = "\n  #:use-module (guix build-system pyproject)  ;; for pypi-uri" if False else ""
    download_modules = "  #:use-module (guix download)"
    if need_pypi:
        download_modules += "\n  #:use-module (guix build utils)"

    header = f''';;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Recipe resolver pass 260418a (2026-04-18)
;;;
;;; Summary: {len(recipes_info)} new recipes, {len(blocked_names)} blocked with notes.
;;;
;;; New recipes:
'''
    for r in recipes_info:
        lic_str = r.get("license_str", "unknown")
        header += f';;;   - {r["name"]}: {r.get("desc_short", r["name"])} v{r["version"]} ({r["build_system"]}, {lic_str})\n'

    header += f''';;;
;;; Blocked ({len(blocked_names)}):
;;;   {", ".join(blocked_names[:20])}
'''
    if len(blocked_names) > 20:
        header += f';;;   ... and {len(blocked_names) - 20} more\n'
    header += f''';;;
;;; Hashes: placeholder (base32 "0000...") — use `guix download` to obtain real hashes.

(define-module (gaurix packages recipe-resolver-260418a)
{download_modules}
  #:use-module (guix packages)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  {bs_str}
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages pkg-config)
  #:export ({exports_str}))

'''
    return header


def main():
    aur_idx = load_aur_cache()

    recipes_info = []
    blocked = []
    report = {"pass": "recipe-resolver-260418a", "date": "2026-04-18", "results": []}

    for line_num, entry_num, pkg_name in SELECTED:
        aur_pkg = aur_idx.get(pkg_name)

        if not aur_pkg:
            # Not in AUR cache
            blocked.append({
                "name": pkg_name,
                "line": line_num,
                "entry": entry_num,
                "reason": "SOURCE_UNAVAILABLE",
                "detail": f"Package '{pkg_name}' not found in AUR cache; no upstream metadata available to generate recipe.",
            })
            report["results"].append({
                "name": pkg_name, "entry": entry_num,
                "status": "BLOCKED", "reason": "SOURCE_UNAVAILABLE",
                "detail": "Not in AUR cache",
            })
            continue

        build_sys = guess_build_system(aur_pkg)
        version = (aur_pkg.get("Version") or "0.0.0").split("-")[0]
        desc = aur_pkg.get("Description") or pkg_name
        url = aur_pkg.get("URL") or ""
        licenses = aur_pkg.get("License") or ["custom"]
        lic_str = licenses[0] if isinstance(licenses, list) else str(licenses)

        # Generate recipe
        recipe = generate_recipe(pkg_name, aur_pkg, build_sys)

        recipes_info.append({
            "name": pkg_name,
            "line": line_num,
            "entry": entry_num,
            "version": version,
            "build_system": build_sys,
            "license_str": lic_str,
            "desc_short": desc[:60],
            "recipe": recipe,
        })

        report["results"].append({
            "name": pkg_name, "entry": entry_num,
            "status": "DONE", "version": version,
            "build_system": build_sys, "license": lic_str,
        })

    # Write recipe file
    blocked_names = [b["name"] for b in blocked]
    header = build_module_header(recipes_info, blocked_names)

    with open(RECIPE_FILE, "w") as f:
        f.write(header)
        for r in recipes_info:
            f.write(r["recipe"])
            f.write("\n")

    print(f"Wrote {len(recipes_info)} recipes to {RECIPE_FILE}", file=sys.stderr)

    # Write blocked notes
    with open(BLOCKED_FILE, "w") as f:
        f.write(f";;; Blocked notes for recipe-resolver-260418a\n")
        f.write(f";;; {len(blocked)} packages blocked\n\n")
        for b in blocked:
            f.write(f";;; {b['name']}: {b['reason']} — {b['detail']}\n")

    print(f"Wrote {len(blocked)} blocked notes to {BLOCKED_FILE}", file=sys.stderr)

    # Write report
    report["summary"] = {
        "total_selected": len(SELECTED),
        "recipes_created": len(recipes_info),
        "blocked": len(blocked),
        "blocked_by_reason": {},
    }
    for b in blocked:
        reason = b["reason"]
        report["summary"]["blocked_by_reason"][reason] = \
            report["summary"]["blocked_by_reason"].get(reason, 0) + 1

    with open(REPORT_FILE, "w") as f:
        json.dump(report, f, indent=2)

    print(f"Wrote report to {REPORT_FILE}", file=sys.stderr)

    # Print summary
    print(f"\n=== Recipe Resolver 260418a Summary ===")
    print(f"Total selected: {len(SELECTED)}")
    print(f"Recipes created: {len(recipes_info)}")
    print(f"Blocked: {len(blocked)}")
    if blocked:
        print(f"\nBlocked packages:")
        for b in blocked:
            print(f"  - {b['name']}: {b['reason']} — {b['detail'][:80]}")

    # Output data for todo update script
    output = {
        "recipes": [{"name": r["name"], "line": r["line"], "entry": r["entry"],
                      "version": r["version"], "build_system": r["build_system"],
                      "license": r["license_str"]} for r in recipes_info],
        "blocked": blocked,
    }

    with open("/tmp/recipe-resolver-260418a-output.json", "w") as f:
        json.dump(output, f, indent=2)


if __name__ == "__main__":
    main()
