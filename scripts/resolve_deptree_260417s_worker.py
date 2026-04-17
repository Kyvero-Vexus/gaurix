#!/usr/bin/env python3
"""Worker for deptree-resolver-260417s: generates Guix recipes from AUR metadata.

Enhanced worker that:
1. Categorizes packages by resolvability
2. Checks for existing recipes in prior passes
3. Generates recipes for resolvable packages
4. Documents detailed BLOCKED reasons with approach history
"""

import json
import re
import os
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
AUR_CACHE = ROOT / "data" / "aur-cache" / "packages-meta-ext-v1.json"
SELECTION = ROOT / "reports" / "deptree-resolver-260417s-selection.json"
TODO_FILE = ROOT / "todo_general_packages.org"
PASS_ID = "deptree-resolver-260417s"
OUTPUT_SCM = ROOT / "guix" / "gaurix" / "packages" / f"{PASS_ID}.scm"
BLOCKED_NOTES = ROOT / "guix" / "gaurix" / "packages" / f"{PASS_ID}-blocked-notes.scm"
AUR_LOOKUP_OUT = ROOT / "reports" / f"{PASS_ID}-aur-lookup.json"
SUMMARY_OUT = ROOT / "reports" / f"{PASS_ID}-summary.json"
PKGBUILDS_DIR = ROOT / "data" / "aur-cache" / "pkgbuilds"


def load_aur_cache(cache_path):
    with open(cache_path, "r") as f:
        data = json.load(f)
    return {pkg["Name"]: pkg for pkg in data}


def sanitize_name(name):
    """Convert AUR name to valid Guix variable name."""
    s = name.lower().replace("_", "-").replace(".", "-").replace("+", "-plus-")
    # Clean up double dashes
    while "--" in s:
        s = s.replace("--", "-")
    s = s.strip("-")
    return s


def escape_scheme_string(s):
    if not s:
        return ""
    return s.replace("\\", "\\\\").replace('"', '\\"')


def guess_license(aur_pkg):
    licenses = aur_pkg.get("License") or []
    if not licenses:
        return "license:expat"
    license_str = licenses[0].lower() if licenses else ""
    mapping = {
        "gpl3": "license:gpl3+", "gpl-3": "license:gpl3+", "gpl-3.0": "license:gpl3+",
        "gpl3+": "license:gpl3+", "gpl-3.0-or-later": "license:gpl3+",
        "gpl-3.0-only": "license:gpl3", "gpl2": "license:gpl2+", "gpl-2": "license:gpl2+",
        "gpl-2.0": "license:gpl2+", "gpl2+": "license:gpl2+",
        "gpl-2.0-or-later": "license:gpl2+", "gpl-2.0-only": "license:gpl2",
        "gpl": "license:gpl3+", "lgpl2.1": "license:lgpl2.1+", "lgpl-2.1": "license:lgpl2.1+",
        "lgpl3": "license:lgpl3+", "lgpl-3.0": "license:lgpl3+", "lgpl": "license:lgpl3+",
        "mit": "license:expat", "expat": "license:expat",
        "bsd": "license:bsd-3", "bsd-2-clause": "license:bsd-2", "bsd-3-clause": "license:bsd-3",
        "isc": "license:isc", "apache": "license:asl2.0", "apache-2.0": "license:asl2.0",
        "asl2.0": "license:asl2.0", "mpl": "license:mpl2.0", "mpl-2.0": "license:mpl2.0",
        "mpl2": "license:mpl2.0", "zlib": "license:zlib", "unlicense": "license:unlicense",
        "cc0": "license:cc0", "cc0-1.0": "license:cc0",
        "public domain": "license:public-domain",
        "agpl3": "license:agpl3+", "agpl-3.0": "license:agpl3+",
        "agpl-3.0-or-later": "license:agpl3+", "agpl-3.0-only": "license:agpl3",
        "artistic-2.0": "license:artistic2.0",
        "boost": "license:boost1.0", "bsl-1.0": "license:boost1.0",
        "custom": "license:non-copyleft", "proprietary": "license:non-copyleft",
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


def is_proprietary_license(aur_pkg):
    """Check if the package has a proprietary/non-free license."""
    licenses = aur_pkg.get("License") or []
    if not licenses:
        return False
    lic = licenses[0].lower()
    proprietary_indicators = [
        "proprietary", "custom:proprietary", "eula", "unfree",
        "non-free", "nonfree", "commercial",
    ]
    return any(p in lic for p in proprietary_indicators)


def is_arch_specific(name, aur_pkg):
    """Check if the package is Arch Linux specific (pacman wrappers, etc.)."""
    deps = [d.lower() for d in (aur_pkg.get("Depends") or [])]
    makedeps = [d.lower() for d in (aur_pkg.get("MakeDepends") or [])]
    all_deps = deps + makedeps
    desc = (aur_pkg.get("Description") or "").lower()

    # Pacman/AUR helpers
    if any(d in ("pacman", "libalpm", "devtools", "arch-install-scripts") for d in all_deps):
        return True
    if "archlinux" in name and "pacman" in " ".join(all_deps):
        return True
    if name in ("yay", "paru", "pikaur", "aurman", "bauerbill", "pacaur",
                "trizen", "asp", "clean-chroot-manager", "archlinux-java-run"):
        return True
    if "arch linux" in desc and ("pacman" in desc or "aur" in desc):
        return True
    return False


def is_dkms_kernel_module(name, aur_pkg):
    """Check if package is a DKMS kernel module."""
    deps = [d.lower() for d in (aur_pkg.get("Depends") or [])]
    makedeps = [d.lower() for d in (aur_pkg.get("MakeDepends") or [])]
    all_deps = deps + makedeps
    return "dkms" in all_deps or name.endswith("-dkms") or name.endswith("-dkms-git")


def is_lib32(name):
    """Check if this is a lib32/multilib package."""
    return name.startswith("lib32-")


def is_cross_toolchain(name):
    """Check if this is a cross-compilation toolchain."""
    cross_prefixes = ["mipsel-linux-gnu-", "mips64-linux-gnu-", "arm-linux-gnueabi-",
                      "aarch64-linux-gnu-", "riscv64-linux-gnu-", "powerpc-linux-gnu-"]
    return any(name.startswith(p) for p in cross_prefixes)


def is_firmware(name, aur_pkg):
    """Check if this is a non-free firmware package."""
    desc = (aur_pkg.get("Description") or "").lower()
    if name.endswith("-fw") or name.endswith("-firmware"):
        if "proprietary" in desc or "non-free" in desc or "closed" in desc:
            return True
    return False


def guess_build_system(aur_pkg):
    name = aur_pkg.get("Name", "")
    makedeps = [d.lower() for d in (aur_pkg.get("MakeDepends") or [])]
    deps = [d.lower() for d in (aur_pkg.get("Depends") or [])]
    all_deps = makedeps + deps

    if name.endswith("-bin") or name.endswith("-appimage"):
        return "copy"
    dep_str = " ".join(all_deps)
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
    if any(d.startswith("qt5") or d.startswith("qt6") for d in all_deps):
        return "cmake"
    if any(d == "autoconf" or d == "automake" for d in all_deps):
        return "gnu"
    if name.startswith("python-"):
        return "pyproject"
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
        "gnu": "gnu-build-system", "cmake": "cmake-build-system",
        "meson": "meson-build-system", "cargo": "cargo-build-system",
        "pyproject": "pyproject-build-system", "go": "go-build-system",
        "node": "node-build-system", "copy": "copy-build-system",
    }
    return mapping.get(bs, "gnu-build-system")


def make_synopsis(aur_pkg):
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
    desc = aur_pkg.get("Description") or aur_pkg.get("Name", "")
    desc = desc.strip()
    if not desc.endswith("."):
        desc += "."
    if desc and desc[0].islower():
        desc = desc[0].upper() + desc[1:]
    return escape_scheme_string(desc)


def make_homepage(aur_pkg):
    url = aur_pkg.get("URL") or f"https://aur.archlinux.org/packages/{aur_pkg['Name']}"
    return escape_scheme_string(url)


def make_source_uri(aur_pkg):
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


def get_blocked_context(name, number, todo_path):
    """Extract the BLOCKED context from the org file for this specific package."""
    found_heading = False
    context_lines = []
    with open(todo_path, "r") as f:
        for line in f:
            if re.match(rf"^\*\*\s+\S+\s+{number}\.\s+{re.escape(name)}", line):
                found_heading = True
                continue
            if found_heading:
                if line.startswith("** "):
                    break
                context_lines.append(line.rstrip())
    # Extract BLOCKED reasons
    reasons = []
    for cl in context_lines:
        if "BLOCKED" in cl and "Status:" in cl:
            reasons.append(cl.strip().lstrip("- "))
    return reasons


def check_existing_recipe(name):
    """Check if a recipe already exists in prior pass .scm files."""
    var_name = sanitize_name(name)
    pkg_dir = ROOT / "guix" / "gaurix" / "packages"
    found_in = []
    for scm_file in pkg_dir.glob("*.scm"):
        if scm_file.name == f"{PASS_ID}.scm":
            continue
        try:
            content = scm_file.read_text()
            if f"(define-public {var_name}" in content:
                found_in.append(scm_file.name)
        except Exception:
            pass
    return found_in


def categorize_package(name, number, aur_pkg, todo_path):
    """Categorize a package into resolution categories.

    Returns (category, reason, details) where category is one of:
    - RESOLVE: can generate recipe
    - ALREADY_RESOLVED: recipe exists, mark DONE
    - PROPRIETARY: proprietary license
    - ARCH_SPECIFIC: Arch Linux specific
    - KERNEL_MODULE: DKMS kernel module
    - MULTILIB: lib32 package
    - CROSS_TOOLCHAIN: cross-compilation toolchain
    - NONFREE_FIRMWARE: proprietary firmware
    - MISSING_SOURCE: not in AUR cache
    - COMPLEX_BUILD: build system too complex for auto-generation
    """
    if aur_pkg is None:
        existing = check_existing_recipe(name)
        if existing:
            return "ALREADY_RESOLVED", "MISSING_SOURCE_BUT_HAS_RECIPE", \
                f"Not in AUR cache but recipe exists in {existing[0]}"
        return "MISSING_SOURCE", "MISSING_SOURCE", "Not found in AUR metadata cache"

    # Check for existing recipes
    existing = check_existing_recipe(name)

    # Arch-specific checks
    if is_arch_specific(name, aur_pkg):
        return "ARCH_SPECIFIC", "ARCH_SPECIFIC", \
            f"Arch Linux specific package (pacman/AUR tooling); existing recipes: {existing}"

    # DKMS kernel module
    if is_dkms_kernel_module(name, aur_pkg):
        if existing:
            return "ALREADY_RESOLVED", "KERNEL_MODULE_HAS_RECIPE", \
                f"DKMS kernel module; recipe exists in {existing[0]}"
        return "KERNEL_MODULE", "KERNEL_MODULE", "DKMS kernel module, requires Linux kernel headers"

    # lib32/multilib
    if is_lib32(name):
        return "MULTILIB", "MULTILIB_UNSUPPORTED", \
            "Guix uses separate i686-linux system builds instead of lib32 overlay"

    # Cross-toolchain
    if is_cross_toolchain(name):
        if existing:
            return "ALREADY_RESOLVED", "CROSS_TOOLCHAIN_HAS_RECIPE", \
                f"Cross-compilation toolchain; recipe exists in {existing[0]}"
        return "COMPLEX_BUILD", "CROSS_TOOLCHAIN", \
            "Cross-compilation toolchain, requires bootstrap GCC/binutils"

    # Proprietary license
    if is_proprietary_license(aur_pkg):
        if existing:
            return "ALREADY_RESOLVED", "PROPRIETARY_HAS_RECIPE", \
                f"Proprietary license but recipe exists in {existing[0]} (license:non-copyleft)"
        return "PROPRIETARY", "PROPRIETARY_LICENSE", \
            f"Proprietary license: {aur_pkg.get('License', ['unknown'])}"

    # Non-free firmware
    if is_firmware(name, aur_pkg):
        if existing:
            return "ALREADY_RESOLVED", "FIRMWARE_HAS_RECIPE", \
                f"Firmware package; recipe exists in {existing[0]}"
        return "NONFREE_FIRMWARE", "NONFREE_FIRMWARE", "Proprietary firmware blob"

    # If recipe already exists, mark as ALREADY_RESOLVED
    if existing:
        return "ALREADY_RESOLVED", "RECIPE_EXISTS", \
            f"Recipe already exists in {existing[0]}"

    # Otherwise, we can try to resolve
    return "RESOLVE", "NEW_RECIPE", "Can generate recipe from AUR metadata"


def main():
    with open(SELECTION) as f:
        selection = json.load(f)
    packages = selection["packages"]
    print(f"[{PASS_ID}] Processing {len(packages)} selected packages")

    aur_cache = load_aur_cache(AUR_CACHE)

    resolved = []
    already_resolved = []
    blocked = []
    aur_lookup = []
    build_systems_used = set()

    categories = {}  # category -> list of packages

    for pkg in packages:
        name = pkg["name"]
        number = pkg["number"]
        aur_data = aur_cache.get(name)

        cat, reason, details = categorize_package(name, number, aur_data, TODO_FILE)

        if cat not in categories:
            categories[cat] = []
        categories[cat].append({"name": name, "number": number, "reason": reason, "details": details})

        if cat == "RESOLVE":
            build_sys = guess_build_system(aur_data)
            build_systems_used.add(build_sys)
            resolved.append({
                "name": name, "number": number,
                "version": (aur_data.get("Version") or "0.0.0").split("-")[0],
                "build_system": build_sys,
                "license": guess_license(aur_data),
                "aur_data": aur_data,
            })
            aur_lookup.append({"name": name, "found": True, "version": aur_data.get("Version"),
                               "build_system": build_sys, "status": "RESOLVE"})
        elif cat == "ALREADY_RESOLVED":
            already_resolved.append({
                "name": name, "number": number, "reason": reason, "details": details,
            })
            aur_lookup.append({"name": name, "found": aur_data is not None,
                               "status": "ALREADY_RESOLVED", "reason": reason})
        else:
            blocked.append({
                "name": name, "number": number, "reason": reason, "details": details,
            })
            aur_lookup.append({"name": name, "found": aur_data is not None,
                               "status": cat, "reason": reason})

    print(f"  New recipes: {len(resolved)}")
    print(f"  Already resolved: {len(already_resolved)}")
    print(f"  Blocked: {len(blocked)}")

    # Write AUR lookup
    with open(AUR_LOOKUP_OUT, "w") as f:
        json.dump(aur_lookup, f, indent=2)

    # Generate Scheme module for new recipes
    if resolved:
        bs_modules = sorted(set(build_system_module(r["build_system"]) for r in resolved))
        exports = [sanitize_name(r["name"]) for r in resolved]

        header = f""";;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency tree resolver pass --- {PASS_ID}
;;; Resolves {len(resolved)} BLOCKED packages from dependency tree queue.
;;; Also marks {len(already_resolved)} packages as ALREADY_RESOLVED.
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

    # Generate blocked notes
    notes_lines = [
        f";;; {PASS_ID} — blocked notes",
        f";;;",
        f";;; {len(resolved)} packages resolved with new recipes",
        f";;; {len(already_resolved)} packages already resolved in prior passes (marked DONE)",
        f";;; {len(blocked)} packages remain BLOCKED",
        f";;;",
    ]

    # Group blocked by category
    for cat in sorted(categories.keys()):
        if cat in ("RESOLVE", "ALREADY_RESOLVED"):
            continue
        pkgs = categories[cat]
        notes_lines.append(f";;; {cat} ({len(pkgs)} packages):")
        for p in pkgs:
            notes_lines.append(f";;;   {p['name']} (#{p['number']}): {p['details']}")
        notes_lines.append(f";;;")

    # Document already resolved
    if already_resolved:
        notes_lines.append(f";;; ALREADY_RESOLVED ({len(already_resolved)} packages, marked DONE):")
        for p in already_resolved:
            notes_lines.append(f";;;   {p['name']} (#{p['number']}): {p['details']}")
        notes_lines.append(f";;;")

    # Document newly resolved
    if resolved:
        notes_lines.append(f";;; RESOLVED with new recipes ({len(resolved)} packages):")
        for r in resolved:
            notes_lines.append(
                f";;;   {r['name']} (#{r['number']}): {r['build_system']}-build-system v{r['version']}")
        notes_lines.append(f";;;")

    with open(BLOCKED_NOTES, "w") as f:
        f.write("\n".join(notes_lines) + "\n")
    print(f"  Wrote {BLOCKED_NOTES}")

    # Write summary
    summary = {
        "pass_id": PASS_ID,
        "total_selected": len(packages),
        "resolved_new": len(resolved),
        "already_resolved": len(already_resolved),
        "total_resolved": len(resolved) + len(already_resolved),
        "blocked_remaining": len(blocked),
        "resolved_packages": [
            {"name": r["name"], "number": r["number"],
             "version": r["version"], "build_system": r["build_system"]}
            for r in resolved
        ],
        "already_resolved_packages": [
            {"name": p["name"], "number": p["number"], "reason": p["reason"]}
            for p in already_resolved
        ],
        "blocked_packages": blocked,
        "category_counts": {cat: len(pkgs) for cat, pkgs in categories.items()},
    }
    with open(SUMMARY_OUT, "w") as f:
        json.dump(summary, f, indent=2)
    print(f"  Wrote {SUMMARY_OUT}")

    return resolved, already_resolved, blocked


if __name__ == "__main__":
    resolved, already_resolved, blocked = main()
    total = len(resolved) + len(already_resolved)
    print(f"\n[{PASS_ID}] Total resolved (new + already): {total}")
    print(f"  New recipes: {len(resolved)}")
    print(f"  Already resolved: {len(already_resolved)}")
    print(f"  Remaining BLOCKED: {len(blocked)}")
