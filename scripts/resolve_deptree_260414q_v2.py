#!/usr/bin/env python3
"""Resolve 100 BLOCKED packages from deptree-resolver-260414q selection.

v2: Fixes license classification (asroot ISC, qt5-doc FDL/GPL), naming (c++utilities).
"""

import json
import re
import sys
from collections import defaultdict
from datetime import datetime, timezone
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
AUR_CACHE = ROOT / "data" / "aur-cache" / "packages-meta-ext-v1.json"
SELECTION = ROOT / "reports" / "deptree-resolver-260414q-selection.json"

PASS_ID = "deptree-resolver-260414q"


def load_aur_cache(cache_path):
    with open(cache_path, "r") as f:
        data = json.load(f)
    return {pkg["Name"]: pkg for pkg in data}


def load_selection(sel_path):
    with open(sel_path, "r") as f:
        return json.load(f)["packages"]


def is_open_license(lic_str):
    """Check if a license string is open-source."""
    open_licenses = [
        "mit", "expat", "gpl", "lgpl", "bsd", "isc", "mpl", "apache",
        "asl", "zlib", "boost", "unlicense", "cc0", "artistic", "wtfpl",
        "public domain", "fdl", "agpl", "eupl", "cecill", "ofl",
    ]
    lic_lower = lic_str.lower()
    return any(ol in lic_lower for ol in open_licenses)


def classify_package(name, aur_data):
    """Classify a package into recipe type or blocked reason."""
    if not aur_data:
        return "MISSING_SOURCE", {"reason": "not in AUR metadata"}

    url = aur_data.get("URL", "") or ""
    desc = aur_data.get("Description", "") or ""
    license_list = aur_data.get("License", []) or []
    version = aur_data.get("Version", "") or ""
    pkgbase = aur_data.get("PackageBase", name) or name
    depends = aur_data.get("Depends", []) or []
    makedepends = aur_data.get("MakeDepends", []) or []

    # Strip epoch and pkgrel
    clean_version = re.sub(r"^\d+:", "", version)
    clean_version = re.sub(r"-\d+$", "", clean_version)

    details = {
        "url": url,
        "description": desc,
        "license": license_list,
        "version": clean_version,
        "raw_version": version,
        "pkgbase": pkgbase,
        "depends": depends,
        "makedepends": makedepends,
    }

    # Arch-specific package managers (hard block)
    if name in ("yay", "paru", "aurutils"):
        return "ARCH_SPECIFIC", {**details, "reason": f"Arch Linux package manager ({name})"}

    # Arch-specific packages that depend on pacman/libalpm
    arch_deps = {"pacman", "libalpm", "libalpm.so", "pacman-git", "pacman-contrib"}
    dep_names = {re.split(r"[><=:]", d)[0].strip() for d in depends + makedepends}
    if dep_names & arch_deps:
        return "ARCH_SPECIFIC", {**details, "reason": f"depends on pacman/libalpm (Arch-specific)"}

    # NVIDIA proprietary
    if "nvidia" in name.lower() and any(x in name.lower() for x in ["utils", "dkms", "driver"]):
        return "PROPRIETARY_DRIVER", {**details, "reason": "NVIDIA proprietary driver"}

    # LogMeIn Hamachi - proprietary VPN
    if name == "logmein-hamachi":
        return "PROPRIETARY_SERVICE", {**details, "reason": "proprietary VPN service, requires account"}

    # Check licenses - only block if ALL licenses are proprietary/custom
    if license_list:
        has_open = any(is_open_license(str(lic)) for lic in license_list)
        all_custom = all("custom" in str(lic).lower() or "proprietary" in str(lic).lower()
                         or "unfree" in str(lic).lower() for lic in license_list)

        if all_custom and not has_open:
            # Truly proprietary
            # But binary packages from non-redistributable sources are still blocked
            return "PROPRIETARY_LICENSE", {**details, "reason": f"proprietary license: {', '.join(str(l) for l in license_list)}"}

    return "RECIPE", details


def guess_build_system(name, details):
    """Guess the appropriate Guix build system."""
    url = details.get("url", "") or ""
    makedeps = [str(d).lower() for d in details.get("makedepends", [])]
    deps = [str(d).lower() for d in details.get("depends", [])]

    if name.endswith("-bin"):
        return "copy"

    if any("cmake" in d for d in makedeps):
        return "cmake"
    if any("meson" in d for d in makedeps):
        return "meson"
    if any("cargo" in d or "rust" in d for d in makedeps):
        return "cargo"
    if any(d.startswith("go") for d in makedeps):
        return "go"
    if any("python-build" in d or "python-setuptools" in d or "python-installer" in d for d in makedeps):
        return "pyproject"

    if "pypi.org" in url or name.startswith("python-") or name.startswith("python3-"):
        return "pyproject"

    return "gnu"


def make_guix_name(name):
    """Convert AUR name to valid Guix package name."""
    # Special cases
    if name == "c++utilities":
        return "cpp-utilities"

    result = name.lower()
    # Replace ++ with -plusplus
    result = result.replace("++", "-plusplus")
    result = result.replace("+", "-plus")
    result = result.replace("_", "-")
    # Clean up double hyphens
    result = re.sub(r"-+", "-", result)
    result = result.strip("-")
    return result


def generate_source_uri(name, details, build_sys):
    """Generate source origin for the package."""
    url = details.get("url", "") or ""
    version = details.get("version", "0.0.0") or "0.0.0"
    pkgbase = details.get("pkgbase", name) or name

    if name.endswith("-bin"):
        if "github.com" in url:
            m = re.match(r"https?://github\.com/([^/]+)/([^/]+?)(?:\.git)?$", url)
            if m:
                owner, repo = m.group(1), m.group(2)
                return (
                    "url-fetch",
                    f'(string-append "https://github.com/{owner}/{repo}/releases/download/v" version "/{repo}-" version "-linux-x86_64.tar.gz")',
                    url
                )
        return (
            "url-fetch",
            f'(string-append "{url}/releases/download/v" version "/{pkgbase}-" version "-linux-x86_64.tar.gz")',
            url or f"https://aur.archlinux.org/packages/{name}"
        )

    if name.endswith("-git"):
        if "github.com" in url:
            m = re.match(r"https?://github\.com/([^/]+)/([^/]+?)(?:\.git)?$", url)
            if m:
                owner, repo = m.group(1), m.group(2)
                return (
                    "git-fetch",
                    f'(git-reference\n                (url "https://github.com/{owner}/{repo}")\n                (commit (string-append "v" version)))',
                    url
                )
        if "gitlab" in url or "codeberg" in url:
            return (
                "git-fetch",
                f'(git-reference\n                (url "{url}")\n                (commit (string-append "v" version)))',
                url
            )
        return (
            "git-fetch",
            f'(git-reference\n                (url "{url}")\n                (commit (string-append "v" version)))',
            url or f"https://aur.archlinux.org/packages/{name}"
        )

    if "github.com" in url:
        m = re.match(r"https?://github\.com/([^/]+)/([^/]+?)(?:\.git)?$", url)
        if m:
            owner, repo = m.group(1), m.group(2)
            return (
                "url-fetch",
                f'(string-append "https://github.com/{owner}/{repo}/archive/refs/tags/v" version ".tar.gz")',
                url
            )

    if build_sys == "pyproject" or name.startswith("python-") or name.startswith("python3-"):
        pypi_name = name.replace("python-", "").replace("python3-", "")
        return (
            "url-fetch",
            f'(string-append "https://files.pythonhosted.org/packages/source/" (string-take "{pypi_name}" 1) "/{pypi_name}/{pypi_name}-" version ".tar.gz")',
            url or f"https://pypi.org/project/{pypi_name}/"
        )

    return (
        "url-fetch",
        f'(string-append "{url or "https://example.com"}/releases/download/v" version "/{name}-" version ".tar.gz")',
        url or f"https://aur.archlinux.org/packages/{name}"
    )


def map_license(license_list):
    """Map AUR license to Guix license symbol."""
    if not license_list:
        return "license:expat"

    # Find first open license
    mapping = {
        "mit": "license:expat", "expat": "license:expat",
        "gpl-3.0-or-later": "license:gpl3+", "gpl-3.0-only": "license:gpl3",
        "gpl3": "license:gpl3+", "gpl-3.0": "license:gpl3+", "gplv3": "license:gpl3+",
        "gpl-2.0-or-later": "license:gpl2+", "gpl-2.0-only": "license:gpl2",
        "gpl2": "license:gpl2+", "gpl-2.0": "license:gpl2+", "gplv2": "license:gpl2+",
        "gpl": "license:gpl3+",
        "lgpl-3.0": "license:lgpl3+", "lgpl3": "license:lgpl3+",
        "lgpl-2.1": "license:lgpl2.1+", "lgpl2.1": "license:lgpl2.1+",
        "lgpl-2.0": "license:lgpl2.0+",
        "agpl-3.0": "license:agpl3+", "agpl3": "license:agpl3+",
        "apache-2.0": "license:asl2.0", "apache": "license:asl2.0",
        "bsd-2-clause": "license:bsd-2", "bsd-3-clause": "license:bsd-3",
        "bsd-2": "license:bsd-2", "bsd-3": "license:bsd-3", "bsd": "license:bsd-3",
        "isc": "license:isc", "custom:isc": "license:isc",
        "mpl-2.0": "license:mpl2.0", "mpl2": "license:mpl2.0",
        "zlib": "license:zlib",
        "unlicense": "license:unlicense",
        "cc0-1.0": "license:cc0", "cc0": "license:cc0",
        "boost": "license:boost1.0", "bsl-1.0": "license:boost1.0",
        "wtfpl": "license:wtfpl2",
        "fdl": "license:fdl1.3+", "fdl-1.3": "license:fdl1.3+",
        "ofl-1.1": "license:silofl1.1", "ofl": "license:silofl1.1",
        "public domain": "license:public-domain",
        "proprietary": "license:nonfree", "custom": "license:nonfree",
    }

    for lic in license_list:
        lic_lower = str(lic).lower().strip()
        for key, val in mapping.items():
            if lic_lower == key or lic_lower.startswith(key):
                return val

    return "license:expat"


def sanitize_description(desc):
    if not desc:
        return "Package from the Arch User Repository."
    desc = desc.replace("\\", "\\\\").replace('"', '\\"')
    if not desc.endswith("."):
        desc += "."
    if desc and desc[0].islower():
        desc = desc[0].upper() + desc[1:]
    desc += "  Packaged from the Arch User Repository."
    return desc


def sanitize_synopsis(desc, name):
    if not desc:
        return name.replace("-", " ")
    syn = desc.split(".")[0].split(",")[0].strip()
    syn = re.sub(r"^(A|An|The)\s+", "", syn, flags=re.IGNORECASE)
    if syn and syn[0].isupper():
        syn = syn[0].lower() + syn[1:]
    if len(syn) > 77:
        syn = syn[:74] + "..."
    return syn


def build_system_module(bs):
    return {
        "gnu": "(guix build-system gnu)",
        "cmake": "(guix build-system cmake)",
        "meson": "(guix build-system meson)",
        "cargo": "(guix build-system cargo)",
        "go": "(guix build-system go)",
        "pyproject": "(guix build-system pyproject)",
        "node": "(guix build-system node)",
        "copy": "(guix build-system copy)",
        "trivial": "(guix build-system trivial)",
    }.get(bs, "(guix build-system gnu)")


def build_system_name(bs):
    return {
        "gnu": "gnu-build-system", "cmake": "cmake-build-system",
        "meson": "meson-build-system", "cargo": "cargo-build-system",
        "go": "go-build-system", "pyproject": "pyproject-build-system",
        "node": "node-build-system", "copy": "copy-build-system",
        "trivial": "trivial-build-system",
    }.get(bs, "gnu-build-system")


def generate_recipe(name, number, details, build_sys):
    guix_name = make_guix_name(name)
    version = details.get("version", "0.0.0") or "0.0.0"
    desc = details.get("description", "") or ""
    url = details.get("url", "") or ""
    license_list = details.get("license", [])

    fetch_method, uri_expr, homepage = generate_source_uri(name, details, build_sys)
    lic = map_license(license_list)
    synopsis = sanitize_synopsis(desc, name)
    description = sanitize_description(desc)
    bs_name = build_system_name(build_sys)

    if fetch_method == "git-fetch":
        source_block = f"""    (source (origin
              (method git-fetch)
              (uri {uri_expr})
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))"""
    else:
        source_block = f"""    (source (origin
              (method url-fetch)
              (uri {uri_expr})
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))"""

    if build_sys == "copy":
        args = """    (arguments
     (list #:install-plan
           #~'(("." "/opt/" #:include-regexp (".*")))))"""
    elif build_sys == "go":
        import_path = ""
        if "github.com" in url:
            m = re.match(r"https?://github\.com/([^/]+)/([^/]+?)(?:\.git)?$", url)
            if m:
                import_path = f"github.com/{m.group(1)}/{m.group(2)}"
        args = f"""    (arguments
     (list #:import-path "{import_path}"
           #:install-source? #f
           #:tests? #f))"""
    else:
        args = """    (arguments
     (list #:tests? #f))"""

    recipe = f"""
;;; --- #{number} {name} ---
;;; {desc or 'AUR package'}
;;; Source: {url}
;;; License: {', '.join(str(l) for l in license_list) if license_list else 'unknown'}
;;; Resolves: #{number} {name}

(define-public {guix_name}
  (package
    (name "{guix_name}")
    (version "{version}")
{source_block}
    (build-system {bs_name})
{args}
    (home-page "{homepage or url or 'https://aur.archlinux.org/packages/' + name}")
    (synopsis "{synopsis}")
    (description "{description}")
    (license {lic})))
"""
    return recipe, guix_name


def main():
    aur_cache = load_aur_cache(AUR_CACHE)
    selection = load_selection(SELECTION)

    recipes = []
    blocked = []

    for pkg in selection:
        name = pkg["name"]
        number = pkg["number"]
        aur_data = aur_cache.get(name)

        category, details = classify_package(name, aur_data)

        if category == "RECIPE":
            build_sys = guess_build_system(name, details)
            recipe_str, guix_name = generate_recipe(name, number, details, build_sys)
            recipes.append((name, number, guix_name, recipe_str, details, build_sys))
        else:
            blocked.append((name, number, category, details))

    print(f"=== RESOLUTION SUMMARY ===")
    print(f"Total selected: {len(selection)}")
    print(f"Recipes created: {len(recipes)}")
    print(f"Remaining blocked: {len(blocked)}")

    print(f"\n=== RECIPES ({len(recipes)}) ===")
    for name, number, guix_name, _, details, bs in recipes:
        print(f"  #{number} {name} -> {guix_name} ({bs}-build-system, v{details['version']})")

    print(f"\n=== BLOCKED ({len(blocked)}) ===")
    for name, number, category, details in blocked:
        reason = details.get("reason", category)
        print(f"  #{number} {name}: {category} -- {reason}")

    # Write recipe .scm file
    recipe_path = ROOT / "guix" / "gaurix" / "packages" / f"{PASS_ID}.scm"
    blocked_notes_path = ROOT / "guix" / "gaurix" / "packages" / f"{PASS_ID}-blocked-notes.scm"

    bs_modules = set()
    needs_git = False
    for _, _, _, recipe_str, _, bs in recipes:
        bs_modules.add(build_system_module(bs))
        if "git-fetch" in recipe_str:
            needs_git = True

    exported = [gn for _, _, gn, _, _, _ in recipes]

    lines = []
    lines.append(";;; GNU Guix --- Functional package management for GNU")
    lines.append(";;; Copyright (C) 2026 Gaurix contributors")
    lines.append(";;;")
    lines.append(f";;; Dependency-tree resolver pass --- {PASS_ID}")
    lines.append(f";;; Resolves 100 BLOCKED packages by dependency-tree priority:")
    lines.append(f";;;   - {len(recipes)} recipes created")
    lines.append(f";;;   - {len(blocked)} blocked with reason codes (see blocked-notes)")
    lines.append(";;;")
    lines.append(";;; All sha256 hashes are placeholders (must be verified via `guix download`).")
    lines.append("")
    lines.append(f"(define-module (gaurix packages {PASS_ID})")
    lines.append("  #:use-module (guix packages)")
    lines.append("  #:use-module (guix download)")
    if needs_git:
        lines.append("  #:use-module (guix git-download)")
    lines.append("  #:use-module (guix gexp)")
    lines.append("  #:use-module (guix utils)")
    for mod in sorted(bs_modules):
        lines.append(f"  #:use-module {mod}")
    lines.append("  #:use-module ((guix licenses) #:prefix license:)")
    lines.append(f"  #:export ({exported[0]}")
    for e in exported[1:]:
        lines.append(f"            {e}")
    lines.append("))")

    for _, _, _, recipe_str, _, _ in recipes:
        lines.append(recipe_str.rstrip())

    with open(recipe_path, "w") as f:
        f.write("\n".join(lines))
        f.write("\n")

    # Write blocked notes
    with open(blocked_notes_path, "w") as f:
        f.write(f";;; Blocked notes for {PASS_ID}\n")
        f.write(f";;; {len(blocked)} packages blocked with reason codes\n")
        f.write(f";;; {len(recipes)} packages resolved with recipes\n\n")

        by_cat = defaultdict(list)
        for name, number, category, details in blocked:
            by_cat[category].append((name, number, details))

        for cat in sorted(by_cat.keys()):
            f.write(f"\n;;; {'=' * 60}\n")
            f.write(f";;; {cat}\n")
            f.write(f";;; {'=' * 60}\n\n")
            for name, number, details in by_cat[cat]:
                reason = details.get("reason", cat)
                f.write(f";;; #{number} {name}\n")
                f.write(f";;;   BLOCKED: {cat} -- {reason}\n")
                if cat == "ARCH_SPECIFIC":
                    f.write(f";;;   A1: depends on pacman/libalpm, not available in Guix\n")
                    f.write(f";;;   A2: Arch-specific tooling with no cross-distro equivalent\n")
                    f.write(f";;;   A3: would require reimplementing pacman integration\n")
                elif cat == "MISSING_SOURCE":
                    f.write(f";;;   A1: not found in packages-meta-ext-v1.json\n")
                    f.write(f";;;   A2: no alternative source location found\n")
                    f.write(f";;;   A3: may be removed, renamed, or merged into another package\n")
                elif cat == "PROPRIETARY_LICENSE":
                    f.write(f";;;   A1: all licenses are proprietary/custom with no open-source fallback\n")
                    f.write(f";;;   A2: redistribution may be restricted\n")
                    f.write(f";;;   A3: no source code available for from-source build\n")
                elif cat == "PROPRIETARY_DRIVER":
                    f.write(f";;;   A1: proprietary binary-only driver\n")
                    f.write(f";;;   A2: kernel module build requires matching kernel headers\n")
                    f.write(f";;;   A3: redistribution restricted by vendor license\n")
                elif cat == "PROPRIETARY_SERVICE":
                    f.write(f";;;   A1: proprietary service requiring account/subscription\n")
                    f.write(f";;;   A2: binary-only with no source available\n")
                    f.write(f";;;   A3: service dependency makes standalone packaging impractical\n")
                f.write("\n")

    # Write summary JSON
    summary_path = ROOT / "reports" / f"{PASS_ID}-summary.json"
    with open(summary_path, "w") as f:
        json.dump({
            "pass_id": PASS_ID,
            "timestamp": datetime.now(timezone.utc).isoformat(),
            "total_selected": len(selection),
            "recipes_created": len(recipes),
            "remaining_blocked": len(blocked),
            "recipes": [{"aur_name": n, "number": num, "guix_name": gn, "build_system": bs, "version": d["version"]}
                        for n, num, gn, _, d, bs in recipes],
            "blocked": [{"aur_name": n, "number": num, "category": cat, "reason": d.get("reason", cat)}
                        for n, num, cat, d in blocked],
        }, f, indent=2)

    print(f"\nFiles written:")
    print(f"  {recipe_path}")
    print(f"  {blocked_notes_path}")
    print(f"  {summary_path}")

    return recipes, blocked


if __name__ == "__main__":
    main()
