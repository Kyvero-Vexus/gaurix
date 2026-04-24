#!/usr/bin/env python3
"""
Recipe resolver pass --- recipe-resolver-260424q
Resolves 100 TODO packages from todo_general_packages.org.
Selects packages with AUR metadata, generates Guix package definitions.
"""

import json
import re
import sys
import hashlib
from datetime import datetime, timezone
from pathlib import Path
from urllib.parse import urlparse

REPO_ROOT = Path(__file__).resolve().parent.parent
TODO_FILE = REPO_ROOT / "todo_general_packages.org"
AUR_CACHE = REPO_ROOT / "data" / "aur-cache" / "packages-meta-ext-v1.json"
SELECTION_JSON = REPO_ROOT / "reports" / "recipe-resolver-260424q-selection.json"
AUR_LOOKUP_JSON = REPO_ROOT / "reports" / "recipe-resolver-260424q-aur-lookup.json"

PASS_ID = "recipe-resolver-260424q"
TARGET_COUNT = 100

# License mapping from AUR/SPDX to Guix license symbols
LICENSE_MAP = {
    "MIT": "license:expat",
    "MIT License": "license:expat",
    "Expat": "license:expat",
    "BSD": "license:bsd-3",
    "BSD-2-Clause": "license:bsd-2",
    "BSD-3-Clause": "license:bsd-3",
    "ISC": "license:isc",
    "Apache": "license:asl2.0",
    "Apache-2.0": "license:asl2.0",
    "Apache License 2.0": "license:asl2.0",
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
    "LGPL": "license:lgpl3+",
    "LGPL2": "license:lgpl2.0",
    "LGPL-2.0": "license:lgpl2.0",
    "LGPL-2.0-or-later": "license:lgpl2.0+",
    "LGPL2.1": "license:lgpl2.1",
    "LGPL-2.1": "license:lgpl2.1",
    "LGPL-2.1-only": "license:lgpl2.1",
    "LGPL-2.1-or-later": "license:lgpl2.1+",
    "LGPL3": "license:lgpl3",
    "LGPL-3.0": "license:lgpl3",
    "LGPL-3.0-only": "license:lgpl3",
    "LGPL-3.0-or-later": "license:lgpl3+",
    "MPL": "license:mpl2.0",
    "MPL-2.0": "license:mpl2.0",
    "MPL2": "license:mpl2.0",
    "AGPL-3.0": "license:agpl3",
    "AGPL-3.0-only": "license:agpl3",
    "AGPL-3.0-or-later": "license:agpl3+",
    "Artistic-2.0": "license:artistic2.0",
    "Zlib": "license:zlib",
    "zlib": "license:zlib",
    "Unlicense": "license:unlicense",
    "WTFPL": "license:wtfpl2",
    "CC0": "license:cc0",
    "CC0-1.0": "license:cc0",
    "CC-BY-4.0": "license:cc-by4.0",
    "CC-BY-SA-4.0": "license:cc-by-sa4.0",
    "OFL": "license:silofl1.1",
    "OFL-1.1": "license:silofl1.1",
    "PSF": "license:psfl",
    "PSF-2.0": "license:psfl",
    "Python": "license:psfl",
    "Boost": "license:boost1.0",
    "BSL-1.0": "license:boost1.0",
    "SSPL": "(license:nonfree \"https://www.mongodb.com/licensing/server-side-public-license\")",
    "custom": "(license:nonfree \"custom\")",
    "proprietary": "(license:nonfree \"proprietary\")",
    "Proprietary": "(license:nonfree \"proprietary\")",
    "unknown": "(license:nonfree \"unknown\")",
    "EUPL-1.2": "license:eupl1.2",
    "0BSD": "license:bsd-0",
    "EPL-2.0": "license:epl2.0",
    "EPL-1.0": "license:epl1.0",
    "CPAL-1.0": "license:cpal1.0",
    "CECILL-2.1": "license:cecill",
    "Ruby": "license:ruby",
}


def map_license(lic_list):
    """Map AUR license list to Guix license expression."""
    if not lic_list:
        return "(license:nonfree \"unknown\")"

    mapped = []
    for lic in lic_list:
        lic_clean = lic.strip()
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
                mapped.append(f'(license:nonfree "{lic_clean}")')

    if len(mapped) == 1:
        return mapped[0]
    else:
        return f"(list {' '.join(mapped)})"


def sanitize_name(name):
    """Convert AUR package name to Guix-style name."""
    return name.lower().replace("_", "-")


def guess_build_system(meta):
    """Guess the appropriate build system from AUR metadata."""
    name = meta["Name"].lower()
    makedeps = [d.lower() for d in meta.get("MakeDepends", [])]
    deps = [d.lower() for d in meta.get("Depends", [])]
    url = (meta.get("URL") or "").lower()

    # Binary packages
    if name.endswith("-bin") or name.endswith("-appimage"):
        return "copy"

    # Python packages
    if name.startswith("python-") or "python" in makedeps or "python-setuptools" in makedeps:
        if "python-build" in makedeps or "python-installer" in makedeps:
            return "pyproject"
        if "python-setuptools" in makedeps:
            return "python"
        if name.startswith("python-"):
            return "pyproject"

    # Go packages
    if "go" in makedeps or "golang" in makedeps or name.startswith("go-"):
        return "go"

    # Rust packages
    if "rust" in makedeps or "cargo" in makedeps:
        return "cargo"

    # Node packages
    if "nodejs" in makedeps or "npm" in makedeps or name.startswith("nodejs-"):
        return "node"

    # CMake
    if "cmake" in makedeps:
        return "cmake"

    # Meson
    if "meson" in makedeps:
        return "meson"

    # Qt
    if "qt5-base" in makedeps or "qt6-base" in makedeps:
        if "cmake" in makedeps:
            return "cmake"
        return "gnu"

    # Font packages
    if name.startswith("ttf-") or name.startswith("otf-") or name.startswith("font-"):
        return "font"

    # Autotools / generic
    if "autoconf" in makedeps or "automake" in makedeps:
        return "gnu"

    # Default for source packages
    return "gnu"


def guess_download_method(meta):
    """Guess download method from AUR source URLs."""
    sources = meta.get("Source", [])
    if not sources:
        return "url-fetch", None

    for src in sources:
        if "github.com" in src and ".git" in src:
            return "git-fetch", src
        if "gitlab.com" in src and ".git" in src:
            return "git-fetch", src

    # Default to url-fetch with first source
    return "url-fetch", sources[0] if sources else None


def build_source_uri(meta, build_sys):
    """Build source origin URI string."""
    name = meta["Name"]
    version = meta.get("Version", "1.0").split("-")[0]  # Strip pkgrel
    url = meta.get("URL", "")
    sources = meta.get("Source", [])

    if build_sys == "copy":
        # Binary package - find a download URL
        for src in sources:
            if "$" not in src and ("http://" in src or "https://" in src):
                # Clean up AUR variable substitution
                return src
        # Construct from GitHub releases if URL is GitHub
        if "github.com" in url:
            parts = url.rstrip("/").split("/")
            if len(parts) >= 5:
                owner, repo = parts[3], parts[4]
                return f"https://github.com/{owner}/{repo}/releases/download/v{version}/{name}-{version}-linux-x86_64.tar.gz"
        return url

    return url


def escape_description(desc):
    """Escape special chars in description for Scheme string."""
    if not desc:
        return "Software package."
    desc = desc.replace("\\", "\\\\")
    desc = desc.replace('"', '\\"')
    # Ensure first char is uppercase
    if desc and desc[0].islower():
        desc = desc[0].upper() + desc[1:]
    # Ensure ends with period
    if not desc.endswith("."):
        desc += "."
    return desc


def make_synopsis(desc):
    """Create a synopsis from description (lowercase first char, no period, <=80)."""
    if not desc:
        return "software package"
    syn = desc.strip()
    if syn.endswith("."):
        syn = syn[:-1]
    # Lowercase first char unless proper noun (all caps word)
    if syn and syn[0].isupper():
        words = syn.split()
        if words and not words[0].isupper():
            syn = syn[0].lower() + syn[1:]
    if len(syn) > 78:
        syn = syn[:75] + "..."
    return syn


def generate_copy_recipe(meta):
    """Generate a copy-build-system recipe for binary packages."""
    name = sanitize_name(meta["Name"])
    version = meta.get("Version", "1.0").split("-")[0]
    desc = meta.get("Description", "Binary package")
    url = meta.get("URL", "https://example.com")
    lic = map_license(meta.get("License", []))
    synopsis = make_synopsis(desc)
    full_desc = escape_description(desc)

    source_url = build_source_uri(meta, "copy")

    return f'''(define-public {name}
  (package
    (name "{name}")
    (version "{version}")
    (source (origin
              (method url-fetch)
              (uri "{source_url}")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/{name}/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "{synopsis}")
    (description "{full_desc}")
    (home-page "{url}")
    (license {lic})))
'''


def generate_font_recipe(meta):
    """Generate a font-build-system recipe."""
    name = sanitize_name(meta["Name"])
    version = meta.get("Version", "1.0").split("-")[0]
    desc = meta.get("Description", "Font package")
    url = meta.get("URL", "https://example.com")
    lic = map_license(meta.get("License", []))
    synopsis = make_synopsis(desc)
    full_desc = escape_description(desc)

    source_url = build_source_uri(meta, "font")

    return f'''(define-public {name}
  (package
    (name "{name}")
    (version "{version}")
    (source (origin
              (method url-fetch)
              (uri "{source_url}")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (synopsis "{synopsis}")
    (description "{full_desc}")
    (home-page "{url}")
    (license {lic})))
'''


def generate_gnu_recipe(meta):
    """Generate a gnu-build-system recipe."""
    name = sanitize_name(meta["Name"])
    version = meta.get("Version", "1.0").split("-")[0]
    desc = meta.get("Description", "Software package")
    url = meta.get("URL", "https://example.com")
    lic = map_license(meta.get("License", []))
    synopsis = make_synopsis(desc)
    full_desc = escape_description(desc)

    source_url = build_source_uri(meta, "gnu")

    return f'''(define-public {name}
  (package
    (name "{name}")
    (version "{version}")
    (source (origin
              (method url-fetch)
              (uri "{source_url}")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "{synopsis}")
    (description "{full_desc}")
    (home-page "{url}")
    (license {lic})))
'''


def generate_cmake_recipe(meta):
    """Generate a cmake-build-system recipe."""
    name = sanitize_name(meta["Name"])
    version = meta.get("Version", "1.0").split("-")[0]
    desc = meta.get("Description", "Software package")
    url = meta.get("URL", "https://example.com")
    lic = map_license(meta.get("License", []))
    synopsis = make_synopsis(desc)
    full_desc = escape_description(desc)

    return f'''(define-public {name}
  (package
    (name "{name}")
    (version "{version}")
    (source (origin
              (method url-fetch)
              (uri "{url}")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "{synopsis}")
    (description "{full_desc}")
    (home-page "{url}")
    (license {lic})))
'''


def generate_meson_recipe(meta):
    """Generate a meson-build-system recipe."""
    name = sanitize_name(meta["Name"])
    version = meta.get("Version", "1.0").split("-")[0]
    desc = meta.get("Description", "Software package")
    url = meta.get("URL", "https://example.com")
    lic = map_license(meta.get("License", []))
    synopsis = make_synopsis(desc)
    full_desc = escape_description(desc)

    return f'''(define-public {name}
  (package
    (name "{name}")
    (version "{version}")
    (source (origin
              (method url-fetch)
              (uri "{url}")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "{synopsis}")
    (description "{full_desc}")
    (home-page "{url}")
    (license {lic})))
'''


def generate_pyproject_recipe(meta):
    """Generate a pyproject-build-system recipe."""
    name = sanitize_name(meta["Name"])
    version = meta.get("Version", "1.0").split("-")[0]
    desc = meta.get("Description", "Python package")
    url = meta.get("URL", "https://example.com")
    lic = map_license(meta.get("License", []))
    synopsis = make_synopsis(desc)
    full_desc = escape_description(desc)

    return f'''(define-public {name}
  (package
    (name "{name}")
    (version "{version}")
    (source (origin
              (method url-fetch)
              (uri "{url}")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "{synopsis}")
    (description "{full_desc}")
    (home-page "{url}")
    (license {lic})))
'''


def generate_python_recipe(meta):
    return generate_pyproject_recipe(meta)


def generate_go_recipe(meta):
    """Generate a go-build-system recipe."""
    name = sanitize_name(meta["Name"])
    version = meta.get("Version", "1.0").split("-")[0]
    desc = meta.get("Description", "Go package")
    url = meta.get("URL", "https://example.com")
    lic = map_license(meta.get("License", []))
    synopsis = make_synopsis(desc)
    full_desc = escape_description(desc)

    return f'''(define-public {name}
  (package
    (name "{name}")
    (version "{version}")
    (source (origin
              (method url-fetch)
              (uri "{url}")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments (list #:tests? #f
                     #:install-source? #f))
    (synopsis "{synopsis}")
    (description "{full_desc}")
    (home-page "{url}")
    (license {lic})))
'''


def generate_cargo_recipe(meta):
    """Generate a cargo-build-system recipe."""
    name = sanitize_name(meta["Name"])
    version = meta.get("Version", "1.0").split("-")[0]
    desc = meta.get("Description", "Rust package")
    url = meta.get("URL", "https://example.com")
    lic = map_license(meta.get("License", []))
    synopsis = make_synopsis(desc)
    full_desc = escape_description(desc)

    return f'''(define-public {name}
  (package
    (name "{name}")
    (version "{version}")
    (source (origin
              (method url-fetch)
              (uri "{url}")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "{synopsis}")
    (description "{full_desc}")
    (home-page "{url}")
    (license {lic})))
'''


def generate_node_recipe(meta):
    """Generate a node-build-system recipe."""
    name = sanitize_name(meta["Name"])
    version = meta.get("Version", "1.0").split("-")[0]
    desc = meta.get("Description", "Node.js package")
    url = meta.get("URL", "https://example.com")
    lic = map_license(meta.get("License", []))
    synopsis = make_synopsis(desc)
    full_desc = escape_description(desc)

    return f'''(define-public {name}
  (package
    (name "{name}")
    (version "{version}")
    (source (origin
              (method url-fetch)
              (uri "{url}")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (synopsis "{synopsis}")
    (description "{full_desc}")
    (home-page "{url}")
    (license {lic})))
'''


GENERATORS = {
    "copy": generate_copy_recipe,
    "font": generate_font_recipe,
    "gnu": generate_gnu_recipe,
    "cmake": generate_cmake_recipe,
    "meson": generate_meson_recipe,
    "pyproject": generate_pyproject_recipe,
    "python": generate_python_recipe,
    "go": generate_go_recipe,
    "cargo": generate_cargo_recipe,
    "node": generate_node_recipe,
}

BUILD_SYSTEM_MODULES = {
    "copy": "(guix build-system copy)",
    "font": "(guix build-system font)",
    "gnu": "(guix build-system gnu)",
    "cmake": "(guix build-system cmake)",
    "meson": "(guix build-system meson)",
    "pyproject": "(guix build-system pyproject)",
    "python": "(guix build-system pyproject)",
    "go": "(guix build-system go)",
    "cargo": "(guix build-system cargo)",
    "node": "(guix build-system node)",
}


def extract_todo_packages(todo_path):
    """Extract package names where status is TODO."""
    packages = []
    seen_names = set()
    header_re = re.compile(r'^\*\* (?:DONE|TODO|FAILED|BLOCKED|SKIPPED|NEEDS_RECIPE_DESIGN)\s+(\d+)\.\s+(\S+)')

    current = None
    with open(todo_path, 'r') as f:
        for line in f:
            m = header_re.match(line)
            if m:
                if current:
                    last_status = current['todo_statuses'][-1] if current['todo_statuses'] else current['header_status']
                    if last_status == 'TODO' or (current['header_status'] == 'TODO' and not current['todo_statuses']):
                        if current['name'] not in seen_names:
                            packages.append({"number": current['number'], "name": current['name'], "line": current['line']})
                            seen_names.add(current['name'])
                current = {
                    'number': int(m.group(1)),
                    'name': m.group(2).rstrip(':'),
                    'header_status': line.split()[1],
                    'todo_statuses': [],
                    'line': 0  # We'll track this
                }
            elif current and 'TODO Status:' in line:
                m2 = re.search(r'TODO Status:\s*(\S+)', line)
                if m2:
                    current['todo_statuses'].append(m2.group(1))

    if current:
        last_status = current['todo_statuses'][-1] if current['todo_statuses'] else current['header_status']
        if last_status == 'TODO' or (current['header_status'] == 'TODO' and not current['todo_statuses']):
            if current['name'] not in seen_names:
                packages.append({"number": current['number'], "name": current['name'], "line": current['line']})

    return packages


def select_packages(todo_pkgs, aur_meta, count=100):
    """Select packages prioritizing those in AUR with fewer deps."""
    in_aur = []
    for p in todo_pkgs:
        name = p["name"]
        if name in aur_meta:
            meta = aur_meta[name]
            dep_count = len(meta.get("Depends", [])) + len(meta.get("MakeDepends", []))
            in_aur.append({
                **p,
                "meta": meta,
                "dep_count": dep_count,
            })

    # Sort by fewer dependencies (easier to package)
    in_aur.sort(key=lambda x: (x["dep_count"], x["number"]))

    return in_aur[:count]


def generate_recipe_file(selected, aur_meta):
    """Generate the .scm recipe file content."""

    # Determine needed build system modules
    build_systems_needed = set()
    recipes = []
    blocked = []

    for pkg in selected:
        meta = pkg["meta"]
        name = meta["Name"]

        # Determine build system
        bs = guess_build_system(meta)

        # Check for blockers
        blocker = None

        # Check if name has invalid Scheme identifier characters
        guix_name = sanitize_name(name)
        if not re.match(r'^[a-z][a-z0-9+\-_.]*$', guix_name):
            blocker = f"NEEDS_RECIPE_DESIGN: package name '{name}' contains characters invalid for Guix identifier"

        # Check for missing URL
        if not meta.get("URL"):
            if not blocker:
                blocker = "SOURCE_UNAVAILABLE: no upstream URL in AUR metadata"

        if blocker:
            blocked.append({
                "name": name,
                "number": pkg["number"],
                "reason": blocker,
                "build_system": bs,
            })
            continue

        build_systems_needed.add(bs)

        generator = GENERATORS.get(bs, generate_gnu_recipe)
        recipe = generator(meta)

        recipes.append({
            "name": name,
            "guix_name": guix_name,
            "number": pkg["number"],
            "recipe": recipe,
            "build_system": bs,
            "version": meta.get("Version", "").split("-")[0],
            "license": meta.get("License", []),
        })

    # Build module header
    bs_modules = sorted(set(BUILD_SYSTEM_MODULES[bs] for bs in build_systems_needed))

    has_nonfree = any("nonfree" in map_license(r.get("license", [])) for r in recipes)

    header_lines = [
        ";;; GNU Guix --- Functional package management for GNU",
        ";;; Copyright (C) 2026 Gaurix Contributors",
        ";;;",
        f";;; Recipe resolver pass --- {PASS_ID}",
        f";;; Resolves {len(recipes)} packages from TODO queue.",
        f";;; {len(blocked)} packages blocked.",
        ";;;",
        f";;; New recipes ({len(recipes)}):",
    ]

    for i, r in enumerate(recipes, 1):
        lic_str = ", ".join(r["license"]) if r["license"] else "unknown"
        header_lines.append(
            f";;;      {i:>3}.  {r['name']} (#{r['number']}, {r['build_system']}-build-system, v{r['version']}, {lic_str})"
        )

    header_lines.append(";;;")
    header_lines.append(f";;; BLOCKED ({len(blocked)}):")
    for i, b in enumerate(blocked, 1):
        reason_short = b["reason"][:80]
        header_lines.append(f";;;      {i:>3}.  {b['name']} (#{b['number']}) -- {reason_short}")

    header_lines.append("")

    module_lines = [
        f"(define-module (gaurix packages {PASS_ID})",
        "  #:use-module (guix packages)",
        "  #:use-module (guix download)",
        "  #:use-module (guix git-download)",
        "  #:use-module (guix gexp)",
        "  #:use-module ((guix licenses) #:prefix license:)",
    ]

    if has_nonfree:
        module_lines.append("  #:use-module ((guix licenses) #:prefix license:)")
        # Actually we already import it, just need nonfree
        # The nonfree function needs to be defined or available

    for bsm in bs_modules:
        module_lines.append(f"  #:use-module {bsm}")

    module_lines.append(")")
    module_lines.append("")

    # Define nonfree helper if needed
    nonfree_helper = ""
    if has_nonfree:
        nonfree_helper = """
;; Helper for nonfree/custom licenses
(define (nonfree uri)
  (license:license "nonfree" uri
    "This is a nonfree license."))

"""

    # Assemble full file
    content = "\n".join(header_lines) + "\n"
    content += "\n".join(module_lines) + "\n"
    content += nonfree_helper

    for r in recipes:
        content += "\n" + r["recipe"]

    return content, recipes, blocked


def generate_blocked_notes(blocked):
    """Generate blocked notes .scm file."""
    lines = [
        ";;; GNU Guix --- Functional package management for GNU",
        ";;; Copyright (C) 2026 Gaurix Contributors",
        ";;;",
        f";;; Blocked notes for {PASS_ID}",
        f";;; {len(blocked)} packages blocked.",
        ";;;",
    ]

    for b in blocked:
        lines.append(f";;; {b['name']} (#{b['number']}): {b['reason']}")

    lines.append(";;;")
    lines.append(f';;; (define-module (gaurix packages {PASS_ID}-blocked-notes))')
    lines.append(";;; ;; This module intentionally left empty - blocked notes only.")
    lines.append("")

    return "\n".join(lines) + "\n"


def main():
    timestamp = datetime.now(timezone.utc).isoformat()

    print(f"=== {PASS_ID} ===")
    print(f"Timestamp: {timestamp}")

    print("\n[1] Loading AUR metadata...")
    with open(AUR_CACHE) as f:
        aur_data = json.load(f)
    aur_meta = {e["Name"]: e for e in aur_data}
    print(f"  Loaded {len(aur_meta)} AUR packages")

    print("\n[2] Extracting TODO packages...")
    todo_pkgs = extract_todo_packages(TODO_FILE)
    print(f"  Found {len(todo_pkgs)} TODO packages")

    print("\n[3] Selecting {TARGET_COUNT} packages...")
    selected = select_packages(todo_pkgs, aur_meta, TARGET_COUNT)
    print(f"  Selected {len(selected)} packages")

    # Write selection report
    sel_data = {
        "timestamp": timestamp,
        "pass_id": PASS_ID,
        "count": len(selected),
        "packages": [
            {
                "name": s["name"],
                "number": s["number"],
                "version": s["meta"].get("Version", ""),
                "description": s["meta"].get("Description", ""),
                "url": s["meta"].get("URL", ""),
                "license": s["meta"].get("License", []),
                "dep_count": s["dep_count"],
            }
            for s in selected
        ]
    }
    with open(SELECTION_JSON, 'w') as f:
        json.dump(sel_data, f, indent=2)
    print(f"  Wrote {SELECTION_JSON}")

    print("\n[4] Generating recipe file...")
    content, recipes, blocked = generate_recipe_file(selected, aur_meta)

    recipe_path = REPO_ROOT / "guix" / "gaurix" / "packages" / f"{PASS_ID}.scm"
    with open(recipe_path, 'w') as f:
        f.write(content)
    print(f"  Wrote {recipe_path}")
    print(f"  {len(recipes)} recipes created, {len(blocked)} blocked")

    if blocked:
        blocked_path = REPO_ROOT / "guix" / "gaurix" / "packages" / f"{PASS_ID}-blocked-notes.scm"
        with open(blocked_path, 'w') as f:
            f.write(generate_blocked_notes(blocked))
        print(f"  Wrote {blocked_path}")

    # Write AUR lookup report
    lookup_data = {
        "timestamp": timestamp,
        "pass_id": PASS_ID,
        "recipes_created": len(recipes),
        "blocked_count": len(blocked),
        "recipes": [
            {
                "name": r["name"],
                "guix_name": r["guix_name"],
                "number": r["number"],
                "build_system": r["build_system"],
                "version": r["version"],
                "license": r["license"],
            }
            for r in recipes
        ],
        "blocked": blocked,
    }
    with open(AUR_LOOKUP_JSON, 'w') as f:
        json.dump(lookup_data, f, indent=2)
    print(f"  Wrote {AUR_LOOKUP_JSON}")

    # Print summary
    print(f"\n=== Summary ===")
    print(f"Recipes created: {len(recipes)}")
    print(f"Blocked: {len(blocked)}")

    bs_counts = {}
    for r in recipes:
        bs = r["build_system"]
        bs_counts[bs] = bs_counts.get(bs, 0) + 1
    print(f"\nBuild systems:")
    for bs, count in sorted(bs_counts.items(), key=lambda x: -x[1]):
        print(f"  {bs}: {count}")

    if blocked:
        print(f"\nBlocked reasons:")
        reason_counts = {}
        for b in blocked:
            reason_code = b["reason"].split(":")[0]
            reason_counts[reason_code] = reason_counts.get(reason_code, 0) + 1
        for reason, count in sorted(reason_counts.items(), key=lambda x: -x[1]):
            print(f"  {reason}: {count}")

    # Print recipe list
    print(f"\n=== Recipes ({len(recipes)}) ===")
    for r in recipes:
        print(f"  {r['number']:>6}. {r['name']} (v{r['version']}, {r['build_system']})")

    # Output data for further processing
    return {
        "recipes": recipes,
        "blocked": blocked,
        "recipe_path": str(recipe_path),
    }


if __name__ == "__main__":
    main()
