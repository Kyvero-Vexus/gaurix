#!/usr/bin/env python3
"""General queue drain pass: deptree-resolver-260415k

Selects 100 TODO packages from todo_general_packages.org,
looks them up in AUR cache, generates Guix package definitions.
"""

import json
import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
AUR_CACHE = ROOT / "data" / "aur-cache" / "packages-meta-ext-v1.json"
TODO_FILE = ROOT / "todo_general_packages.org"
PASS_ID = "deptree-resolver-260415k"
OUTPUT_SCM = ROOT / "guix" / "gaurix" / "packages" / f"{PASS_ID}.scm"
BATCH_SIZE = 100


def extract_todo_packages(todo_path, limit=BATCH_SIZE):
    """Extract TODO packages from org file. Returns list of dicts."""
    todos = []
    with open(todo_path, "r") as f:
        for line in f:
            m = re.match(r"^\*\*\s+TODO\s+(\d+)\.\s+(\S+)", line)
            if m:
                todos.append({
                    "number": int(m.group(1)),
                    "name": m.group(2),
                    "line_pattern": line.rstrip(),
                })
                if len(todos) >= limit:
                    break
    return todos


def load_aur_cache(cache_path):
    """Load AUR metadata cache."""
    print(f"Loading AUR cache from {cache_path}...", file=sys.stderr)
    with open(cache_path, "r") as f:
        data = json.load(f)
    cache = {pkg["Name"]: pkg for pkg in data}
    print(f"Loaded {len(cache)} packages from AUR cache.", file=sys.stderr)
    return cache


def guix_name(name):
    """Convert AUR name to valid Guix package name."""
    return name.lower().replace("_", "-").replace(".", "-")


LICENSE_MAP = {
    "GPL": "license:gpl3+",
    "GPL2": "license:gpl2",
    "GPL3": "license:gpl3+",
    "GPL-2.0": "license:gpl2",
    "GPL-2.0-only": "license:gpl2",
    "GPL-2.0-or-later": "license:gpl2+",
    "GPL-3.0": "license:gpl3",
    "GPL-3.0-only": "license:gpl3",
    "GPL-3.0-or-later": "license:gpl3+",
    "LGPL": "license:lgpl3+",
    "LGPL2.1": "license:lgpl2.1",
    "LGPL3": "license:lgpl3+",
    "LGPL-2.1": "license:lgpl2.1",
    "LGPL-2.1-only": "license:lgpl2.1",
    "LGPL-2.1-or-later": "license:lgpl2.1+",
    "LGPL-3.0": "license:lgpl3",
    "LGPL-3.0-only": "license:lgpl3",
    "LGPL-3.0-or-later": "license:lgpl3+",
    "MIT": "license:expat",
    "BSD": "license:bsd-3",
    "BSD-2-Clause": "license:bsd-2",
    "BSD-3-Clause": "license:bsd-3",
    "ISC": "license:isc",
    "Apache": "license:asl2.0",
    "Apache-2.0": "license:asl2.0",
    "MPL": "license:mpl2.0",
    "MPL2": "license:mpl2.0",
    "MPL-2.0": "license:mpl2.0",
    "AGPL3": "license:agpl3",
    "AGPL-3.0": "license:agpl3",
    "AGPL-3.0-only": "license:agpl3",
    "AGPL-3.0-or-later": "license:agpl3+",
    "Zlib": "license:zlib",
    "Artistic2.0": "license:artistic2.0",
    "PSF": "license:psfl",
    "CPAL-1.0": "license:cpal1.0",
    "CC0-1.0": "license:cc0",
    "Unlicense": "license:unlicense",
    "WTFPL": "license:wtfpl2",
    "custom": "license:non-copyleft",
    "custom:proprietary": "license:non-copyleft",
    "proprietary": "license:non-copyleft",
    "SSPL": "license:non-copyleft",
    "Boost": "license:boost1.0",
    "BSL-1.0": "license:boost1.0",
}


def map_license(aur_licenses):
    """Map AUR license list to Guix license symbol."""
    if not aur_licenses:
        return "license:non-copyleft"
    for lic in aur_licenses:
        lic_str = lic.strip()
        if lic_str in LICENSE_MAP:
            return LICENSE_MAP[lic_str]
    # Fallback
    return "license:non-copyleft"


BUILD_SYSTEM_MAP = {
    "python": ("pyproject-build-system", "(guix build-system pyproject)"),
    "python-setuptools": ("python-build-system", "(guix build-system python)"),
    "cmake": ("cmake-build-system", "(guix build-system cmake)"),
    "meson": ("meson-build-system", "(guix build-system meson)"),
    "cargo": ("cargo-build-system", "(guix build-system cargo)"),
    "go": ("go-build-system", "(guix build-system go)"),
    "node": ("node-build-system", "(guix build-system node)"),
}


def detect_build_system(aur_data):
    """Detect appropriate build system from AUR metadata."""
    makedeps = [d.lower() for d in (aur_data.get("MakeDepends") or [])]
    deps_str = " ".join(makedeps)
    name = aur_data.get("Name", "").lower()

    # Binary packages
    if name.endswith("-bin") or name.endswith("-appimage"):
        return "copy-build-system", "(guix build-system copy)"

    # Check makedepends for hints
    if any("cmake" in d for d in makedeps):
        return "cmake-build-system", "(guix build-system cmake)"
    if any("meson" in d for d in makedeps):
        return "meson-build-system", "(guix build-system meson)"
    if any("cargo" in d or "rust" in d for d in makedeps):
        return "cargo-build-system", "(guix build-system cargo)"
    if any("go" == d or "go-" in d for d in makedeps):
        return "go-build-system", "(guix build-system go)"
    if any("python" in d and ("build" in d or "setuptools" in d or "wheel" in d or "flit" in d or "hatch" in d) for d in makedeps):
        return "pyproject-build-system", "(guix build-system pyproject)"
    if any("npm" in d or "nodejs" in d or "node-" in d for d in makedeps):
        return "node-build-system", "(guix build-system node)"

    # Default
    return "gnu-build-system", "(guix build-system gnu)"


def detect_source_method(aur_data):
    """Detect appropriate source fetch method from AUR data."""
    sources = aur_data.get("URL", "") or ""
    name = aur_data.get("Name", "")

    # For git packages, use git-fetch
    if name.endswith("-git"):
        url = aur_data.get("URL", "")
        if url and ("github.com" in url or "gitlab.com" in url or "git" in url):
            return "git-fetch", url
    return "url-fetch", None


def make_synopsis(desc):
    """Create a Guix-compliant synopsis from AUR description."""
    if not desc:
        return "no description available"
    syn = desc.strip()
    # Truncate to 80 chars
    if len(syn) > 80:
        syn = syn[:77] + "..."
    # Remove trailing period
    if syn.endswith("."):
        syn = syn[:-1]
    # Lowercase first char (unless proper noun / acronym)
    if syn and syn[0].isupper() and (len(syn) < 2 or syn[1].islower()):
        syn = syn[0].lower() + syn[1:]
    return syn


def make_description(desc):
    """Create Guix-compliant description."""
    if not desc:
        return "No description available."
    d = desc.strip()
    if not d.endswith("."):
        d += "."
    # Capitalize first letter
    if d and d[0].islower():
        d = d[0].upper() + d[1:]
    return d


def generate_package_def(aur_data):
    """Generate a Guix package definition from AUR metadata."""
    name = guix_name(aur_data["Name"])
    version = aur_data.get("Version", "1.0").split("-")[0]  # strip pkgrel
    url = aur_data.get("URL") or f"https://aur.archlinux.org/packages/{aur_data['Name']}"
    desc = aur_data.get("Description", "")
    licenses = aur_data.get("License") or []
    lic = map_license(licenses)

    build_sys, build_mod = detect_build_system(aur_data)
    synopsis = make_synopsis(desc)
    description = make_description(desc)

    # Determine source
    source_method, git_url = detect_source_method(aur_data)

    if source_method == "git-fetch" and git_url:
        source_block = f'''    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "{git_url}")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))'''
    else:
        aur_snapshot_url = f"https://aur.archlinux.org/cgit/aur.git/snapshot/{aur_data['Name']}.tar.gz"
        source_block = f'''    (source (origin
              (method url-fetch)
              (uri "{aur_snapshot_url}")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))'''

    return f'''(define-public {name}
  (package
    (name "{name}")
    (version "{version}")
{source_block}
    (build-system {build_sys})
    (arguments (list #:tests? #f))
    (synopsis "{synopsis}")
    (description "{description}")
    (home-page "{url}")
    (license {lic})))
'''


def collect_build_systems(packages_data):
    """Collect all unique build system modules needed."""
    systems = set()
    for pkg in packages_data:
        if pkg.get("aur_data"):
            _, mod = detect_build_system(pkg["aur_data"])
            systems.add(mod)
    # Always include these basics
    systems.add("(guix build-system gnu)")
    systems.add("(guix build-system copy)")
    return sorted(systems)


def needs_git_download(packages_data):
    """Check if any package needs git-download."""
    for pkg in packages_data:
        if pkg.get("aur_data"):
            method, _ = detect_source_method(pkg["aur_data"])
            if method == "git-fetch":
                return True
    return False


def write_scm_file(output_path, packages_data, pass_id):
    """Write the .scm package module file."""
    # Collect needed build systems
    build_systems = collect_build_systems(packages_data)
    use_git = needs_git_download(packages_data)

    # Collect export names
    export_names = []
    for pkg in packages_data:
        if pkg.get("aur_data"):
            export_names.append(guix_name(pkg["aur_data"]["Name"]))

    lines = []
    lines.append(";;; GNU Guix --- Functional package management for GNU")
    lines.append(";;; Copyright (C) 2026 Gaurix contributors")
    lines.append(";;;")
    lines.append(f";;; General queue drain pass --- {pass_id}")
    lines.append(f";;; Resolves {len(export_names)} packages from general queue.")
    lines.append(";;;")
    lines.append(";;; All sha256 hashes are placeholders pending verification via `guix download`.")
    lines.append("")
    lines.append(f"(define-module (gaurix packages {pass_id})")
    lines.append("  #:use-module (guix packages)")
    lines.append("  #:use-module (guix download)")
    if use_git:
        lines.append("  #:use-module (guix git-download)")
    lines.append("  #:use-module (guix gexp)")
    lines.append("  #:use-module (guix utils)")
    for bs in build_systems:
        lines.append(f"  #:use-module {bs}")
    lines.append("  #:use-module ((guix licenses) #:prefix license:)")
    lines.append("  #:use-module (gnu packages)")

    # Export list
    lines.append(f"  #:export (")
    for ename in sorted(export_names):
        lines.append(f"            {ename}")
    lines.append("            ))")
    lines.append("")

    # Package definitions
    for pkg in packages_data:
        if pkg.get("aur_data"):
            lines.append(generate_package_def(pkg["aur_data"]))

    with open(output_path, "w") as f:
        f.write("\n".join(lines))

    return export_names


def generate_compat_aliases(export_names):
    """Generate compat alias definitions for -git and -bin suffixed packages."""
    aliases = []
    for name in sorted(export_names):
        if name.endswith("-git"):
            base = name[:-4]
            aliases.append(f'(define-public {base} (package (inherit {name}) (name "{base}")))')
        elif name.endswith("-bin"):
            base = name[:-4]
            aliases.append(f'(define-public {base} (package (inherit {name}) (name "{base}")))')
    return aliases


def main():
    # 1. Extract TODO packages
    print("Extracting TODO packages...", file=sys.stderr)
    todos = extract_todo_packages(TODO_FILE, BATCH_SIZE)
    print(f"Found {len(todos)} TODO packages.", file=sys.stderr)

    if not todos:
        print("No TODO packages found!", file=sys.stderr)
        sys.exit(1)

    # 2. Load AUR cache
    aur_cache = load_aur_cache(AUR_CACHE)

    # 3. Look up each package
    found = []
    not_found = []
    for pkg in todos:
        aur_data = aur_cache.get(pkg["name"])
        if aur_data:
            pkg["aur_data"] = aur_data
            pkg["status"] = "found"
            found.append(pkg)
        else:
            pkg["aur_data"] = None
            pkg["status"] = "not_found"
            not_found.append(pkg)

    print(f"Found in AUR: {len(found)}, Not found: {len(not_found)}", file=sys.stderr)

    # 4. Write .scm file
    if found:
        export_names = write_scm_file(OUTPUT_SCM, found, PASS_ID)
        print(f"Wrote {len(export_names)} package definitions to {OUTPUT_SCM}", file=sys.stderr)
    else:
        export_names = []

    # 5. Generate compat aliases
    aliases = generate_compat_aliases(export_names)

    # 6. Output JSON report for downstream processing
    report = {
        "pass_id": PASS_ID,
        "total_selected": len(todos),
        "found_in_aur": len(found),
        "not_found_in_aur": len(not_found),
        "packages_written": len(export_names),
        "scm_file": str(OUTPUT_SCM),
        "found": [{"number": p["number"], "name": p["name"], "guix_name": guix_name(p["aur_data"]["Name"])} for p in found],
        "not_found": [{"number": p["number"], "name": p["name"]} for p in not_found],
        "compat_aliases": aliases,
        "export_names": sorted(export_names),
    }
    json.dump(report, sys.stdout, indent=2)
    print("", file=sys.stderr)
    print("Done.", file=sys.stderr)


if __name__ == "__main__":
    main()
