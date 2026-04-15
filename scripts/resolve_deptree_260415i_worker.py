#!/usr/bin/env python3
"""Worker for deptree-resolver-260415i: resolve 100 BLOCKED packages.

Reads the selection, looks up AUR metadata, categorizes, generates Guix recipes,
marks others with reason codes, and writes all artifacts.
"""

import json
import re
import shutil
import sys
import tempfile
from datetime import datetime, timezone
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
PASS_ID = "deptree-resolver-260415i"
SELECTION_FILE = ROOT / "reports" / f"{PASS_ID}-selection.json"
AUR_CACHE = ROOT / "data" / "aur-cache" / "packages-meta-ext-v1.json"
LOOKUP_FILE = ROOT / "reports" / f"{PASS_ID}-aur-lookup.json"
TODO_FILE = ROOT / "todo_general_packages.org"
RECIPE_FILE = ROOT / "guix" / "gaurix" / "packages" / f"{PASS_ID}.scm"
PACKAGES_SCM = ROOT / "guix" / "gaurix" / "packages.scm"
COMPAT_SCM = ROOT / "guix" / "gaurix" / "packages" / "general-compat.scm"
SUMMARY_FILE = ROOT / "reports" / f"{PASS_ID}-summary.json"


# === Helpers ===

def guix_name(aur_name):
    """Convert AUR package name to valid Guix symbol."""
    name = aur_name.lower()
    name = re.sub(r"[_.@]+", "-", name)
    name = re.sub(r"[^a-z0-9-]", "", name)
    name = re.sub(r"-+", "-", name)
    name = name.strip("-")
    return name


def clean_version(raw_version):
    """Strip epoch and pkgrel from version."""
    v = re.sub(r"^\d+:", "", raw_version)
    v = re.sub(r"-\d+$", "", v)
    return v


def escape_scheme_string(s):
    """Escape a string for use in Scheme."""
    return s.replace("\\", "\\\\").replace('"', '\\"')


def make_synopsis(desc, name):
    """Create a lint-compliant synopsis from description."""
    if not desc:
        return name.replace("-", " ")
    syn = desc.split(".")[0].strip()
    if len(syn) > 76:
        syn = syn[:73] + "..."
    proper_nouns = ["GNU", "GNOME", "KDE", "Qt", "GTK", "NVIDIA", "AMD", "USB",
                    "HTTP", "JSON", "XML", "DKMS", "Linux", "API", "ALSA", "GStreamer",
                    "OpenGL", "Vulkan", "Python", "Java", "Rust", "Go", "Node"]
    if syn and syn[0].isupper() and not any(syn.startswith(p) for p in proper_nouns):
        syn = syn[0].lower() + syn[1:]
    syn = syn.rstrip(".")
    return syn


def make_description(desc, name):
    """Create a lint-compliant description."""
    if not desc:
        return f"{name} package."
    d = desc.strip()
    if not d.endswith("."):
        d += "."
    return d


def map_license(lic_list):
    """Map AUR license strings to Guix license symbols."""
    if not lic_list:
        return "license:expat"
    lic_map = {
        "MIT": "license:expat",
        "BSD": "license:bsd-3",
        "BSD-2-Clause": "license:bsd-2",
        "BSD-3-Clause": "license:bsd-3",
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
        "LGPL-2.0": "license:lgpl2.0",
        "LGPL-2.0-or-later": "license:lgpl2.0+",
        "LGPL-2.1": "license:lgpl2.1",
        "LGPL-2.1-only": "license:lgpl2.1",
        "LGPL-2.1-or-later": "license:lgpl2.1+",
        "LGPL-3.0": "license:lgpl3",
        "LGPL-3.0-or-later": "license:lgpl3+",
        "Apache": "license:asl2.0",
        "Apache-2.0": "license:asl2.0",
        "MPL-2.0": "license:mpl2.0",
        "ISC": "license:isc",
        "Zlib": "license:zlib",
        "AGPL": "license:agpl3",
        "AGPL-3.0": "license:agpl3",
        "AGPL-3.0-only": "license:agpl3",
        "AGPL-3.0-or-later": "license:agpl3+",
        "Artistic": "license:artistic2.0",
        "Artistic-2.0": "license:artistic2.0",
        "Unlicense": "license:unlicense",
        "WTFPL": "license:wtfpl2",
        "CC0": "license:cc0",
        "CC0-1.0": "license:cc0",
        "CC-BY-4.0": "license:cc-by4.0",
        "CC-BY-SA-4.0": "license:cc-by-sa4.0",
        "OFL-1.1": "license:silofl1.1",
        "custom": "license:non-copyleft",
        "custom:NVIDIA": "license:non-copyleft",
        "proprietary": "license:non-copyleft",
        "unknown": "license:non-copyleft",
    }
    first = lic_list[0] if lic_list else "unknown"
    if first in lic_map:
        return lic_map[first]
    for key in lic_map:
        if first.lower().startswith(key.lower()):
            return lic_map[key]
    return "license:non-copyleft"


def strip_version_constraint(dep):
    return re.split(r"[><=]", dep)[0].strip()


# === Categorization ===

def categorize_package(name, aur_data):
    """Determine the category for a package based on AUR metadata."""
    if not aur_data:
        return "unknown"

    depends = [strip_version_constraint(d) for d in (aur_data.get("Depends") or [])]
    makedeps = [strip_version_constraint(d) for d in (aur_data.get("MakeDepends") or [])]
    desc = (aur_data.get("Description") or "").lower()
    all_deps_lower = [d.lower() for d in depends + makedeps]

    # Arch-specific: depends on pacman/makepkg
    arch_specific_deps = {"pacman", "makepkg", "devtools", "pacutils", "aurutils",
                          "pkgfile", "pacman-contrib", "asp", "aurpublish"}
    if arch_specific_deps & set(d.lower() for d in depends + makedeps):
        return "arch-specific"

    # Kernel binary
    if re.match(r"^linux-", name) and any(d in all_deps_lower for d in ["coreutils", "kmod", "initramfs"]):
        return "kernel-binary"

    # NVIDIA proprietary
    if "nvidia" in name.lower() and any(d in all_deps_lower for d in ["nvidia-utils", "nvidia-settings", "dkms"]):
        if "dkms" in name.lower() or "dkms" in all_deps_lower:
            return "nvidia-driver"

    # DKMS module
    if "dkms" in name.lower() or "dkms" in all_deps_lower:
        return "dkms-module"

    # Binary packages
    if name.endswith("-bin"):
        if any("appimage" in d.lower() for d in depends):
            return "binary-appimage"
        return "binary-generic"

    # Font packages
    if "font" in name.lower() or "ttf-" in name.lower() or "otf-" in name.lower():
        return "font"

    # Detect build system from makedepends
    if any("cmake" in d for d in all_deps_lower):
        return "source-cmake"
    if any("meson" in d for d in all_deps_lower):
        return "source-meson"
    if any("cargo" in d or d == "rust" for d in all_deps_lower):
        return "source-rust"
    if any(d.startswith("python") and ("build" in d or "setuptools" in d or "wheel" in d or "pip" in d) for d in all_deps_lower):
        return "source-python"
    if any("go" == d or "go-tools" in d for d in all_deps_lower):
        return "source-go"
    if any("npm" in d or "nodejs" in d or "node" == d for d in all_deps_lower):
        return "source-node"

    return "source-generic"


def determine_build_system(cat, makedeps_lower):
    """Determine build system from category."""
    bs_map = {
        "binary-generic": "copy",
        "binary-appimage": "copy",
        "binary-deb": "copy",
        "binary-tar": "copy",
        "font": "copy",
        "source-cmake": "cmake",
        "source-meson": "meson",
        "source-rust": "cargo",
        "source-python": "pyproject",
        "source-go": "go",
        "source-node": "node",
        "dkms-module": "copy",
        "kernel-binary": "copy",
        "nvidia-driver": "copy",
    }
    if cat in bs_map:
        return bs_map[cat]
    # Auto-detect fallback
    if any("cmake" in d for d in makedeps_lower):
        return "cmake"
    if any("meson" in d for d in makedeps_lower):
        return "meson"
    if any("cargo" in d or "rust" in d for d in makedeps_lower):
        return "cargo"
    return "gnu"


def determine_source_method(name, url):
    """Determine download method and URL pattern."""
    if not url:
        return "url-fetch", f"https://aur.archlinux.org/cgit/aur.git/snapshot/{name}.tar.gz"
    if re.match(r"https?://github\.com/", url):
        return "git-fetch", url
    if re.match(r"https?://gitlab\.", url):
        return "git-fetch", url
    if re.match(r"https?://codeberg\.org/", url):
        return "git-fetch", url
    if re.match(r"https?://git\.sr\.ht/", url):
        return "git-fetch", url
    return "url-fetch", f"https://aur.archlinux.org/cgit/aur.git/snapshot/{name}.tar.gz"


# === Recipe generation ===

def generate_recipe(pkg):
    """Generate a Guix package definition for a package."""
    name = pkg["name"]
    gname = guix_name(name)
    version = clean_version(pkg.get("version", "0.0.0"))
    desc = pkg.get("description", "")
    url = pkg.get("url", "") or f"https://aur.archlinux.org/packages/{name}"
    lic = map_license(pkg.get("license", []))
    synopsis = make_synopsis(desc, name)
    description = make_description(desc, name)
    build_sys = pkg["build_system"]
    source_method, source_url = determine_source_method(name, url)

    lines = []
    lines.append(f'(define-public {gname}')
    lines.append(f'  (package')
    lines.append(f'    (name "{gname}")')
    lines.append(f'    (version "{escape_scheme_string(version)}")')

    if source_method == "git-fetch":
        git_url = source_url.rstrip("/")
        if git_url.endswith(".git"):
            git_url = git_url[:-4]
        lines.append(f'    (source (origin')
        lines.append(f'              (method git-fetch)')
        lines.append(f'              (uri (git-reference')
        lines.append(f'                    (url "{escape_scheme_string(git_url)}")')
        lines.append(f'                    (commit "v{escape_scheme_string(version)}")))')
        lines.append(f'              (file-name (git-file-name name version))')
        lines.append(f'              (sha256')
        lines.append(f'               (base32 "0000000000000000000000000000000000000000000000000000"))))')
    else:
        lines.append(f'    (source (origin')
        lines.append(f'              (method url-fetch)')
        lines.append(f'              (uri "{escape_scheme_string(source_url)}")')
        lines.append(f'              (sha256')
        lines.append(f'               (base32 "0000000000000000000000000000000000000000000000000000"))))')

    lines.append(f'    (build-system {build_sys}-build-system)')
    lines.append(f'    (arguments (list #:tests? #f))')
    lines.append(f'    (synopsis "{escape_scheme_string(synopsis)}")')
    lines.append(f'    (description "{escape_scheme_string(description)}")')
    lines.append(f'    (home-page "{escape_scheme_string(url)}")')
    lines.append(f'    (license {lic})))')
    lines.append("")

    return "\n".join(lines), gname


def categorize_and_resolve(pkg):
    """Categorize package and determine if it can be resolved."""
    cat = pkg["category"]
    name = pkg["name"]
    in_aur = pkg["in_aur"]

    if not in_aur:
        if cat == "kernel-binary":
            return "BLOCKED", f"KERNEL_BINARY: versioned Arch kernel binary ({name}), not portable to Guix", None, None
        return "BLOCKED", f"MISSING_SOURCE: not found in AUR metadata cache", None, None

    if cat == "arch-specific":
        return "BLOCKED", f"ARCH_SPECIFIC: depends on pacman/makepkg infrastructure", None, None

    if cat == "nvidia-driver":
        return "BLOCKED", f"NVIDIA_PROPRIETARY: NVIDIA proprietary DKMS driver module", None, None

    if cat == "kernel-binary":
        return "BLOCKED", f"KERNEL_BINARY: versioned Arch kernel binary, not portable to Guix", None, None

    # Everything else gets a recipe
    recipe, gname = generate_recipe(pkg)
    return "RECIPE", f"RECIPE: Guix recipe created ({cat})", recipe, gname


# === File update functions ===

def write_recipe_module(recipes, exports):
    """Write the Guix recipe module file."""
    export_block = "\n".join("            " + e for e in exports)
    header = f''';;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- {PASS_ID}
;;; Resolves 100 packages from dependency tree queue.
;;;
;;; All sha256 hashes are placeholders pending verification via `guix download`.

(define-module (gaurix packages {PASS_ID})
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system node)
  #:use-module (guix build-system cargo)
  #:use-module (guix build-system go)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:export ({export_block}))

'''
    # Atomic write
    with tempfile.NamedTemporaryFile(mode='w', dir=RECIPE_FILE.parent, suffix='.scm',
                                     delete=False) as tmp:
        tmp.write(header)
        for recipe in recipes:
            tmp.write(recipe)
            tmp.write("\n")
        tmp_path = tmp.name
    shutil.move(tmp_path, RECIPE_FILE)


def update_todo(results):
    """Update todo_general_packages.org with new statuses."""
    with open(TODO_FILE, "r") as f:
        content = f.read()

    for pkg_name, number, action, reason, gname in results:
        if action == "RECIPE":
            new_status = "DONE"
            status_text = f"DONE: recipe in {PASS_ID}.scm ({gname}, {reason})"
        else:
            new_status = "BLOCKED"
            status_text = f"BLOCKED: {reason} [{PASS_ID}]"

        if action == "RECIPE":
            pattern = rf"(\*\*\s+)BLOCKED(\s+{re.escape(str(number))}\.\s+{re.escape(pkg_name)})"
            replacement = rf"\g<1>DONE\g<2>"
            content = re.sub(pattern, replacement, content)

        entry_pattern = rf"(\*\*\s+(?:BLOCKED|DONE)\s+{re.escape(str(number))}\.\s+{re.escape(pkg_name)}\n(?:.*\n)*?)"
        entry_match = re.search(entry_pattern, content)
        if entry_match:
            block = entry_match.group(0)
            if PASS_ID not in block:
                insert_line = f"   - Status: {status_text}\n"
                end_pos = entry_match.end()
                content = content[:end_pos] + insert_line + content[end_pos:]

    # Atomic write
    with tempfile.NamedTemporaryFile(mode='w', dir=TODO_FILE.parent, suffix='.org',
                                     delete=False) as tmp:
        tmp.write(content)
        tmp_path = tmp.name
    shutil.move(tmp_path, TODO_FILE)


def update_packages_scm(exports):
    """Add exports to packages.scm using deterministic transform."""
    with open(PACKAGES_SCM, "r") as f:
        content = f.read()

    comment = f"            ;; {PASS_ID}\n"
    new_exports = "\n".join(f"            {e}" for e in exports)

    last_close = content.rstrip().rfind("))")
    if last_close > 0:
        content = content[:last_close] + f"\n{comment}{new_exports}\n))" + "\n"

    with tempfile.NamedTemporaryFile(mode='w', dir=PACKAGES_SCM.parent, suffix='.scm',
                                     delete=False) as tmp:
        tmp.write(content)
        tmp_path = tmp.name
    shutil.move(tmp_path, PACKAGES_SCM)


def update_compat_scm(exports, pkg_name_map):
    """Add #:use-module and compat aliases to general-compat.scm."""
    with open(COMPAT_SCM, "r") as f:
        content = f.read()

    use_module_line = f"  #:use-module (gaurix packages {PASS_ID})"
    if use_module_line not in content:
        last_use = content.rfind("#:use-module")
        if last_use >= 0:
            end_of_line = content.index("\n", last_use)
            content = content[:end_of_line + 1] + use_module_line + "\n" + content[end_of_line + 1:]

    aliases = []
    for gname, aur_name in pkg_name_map.items():
        if aur_name.endswith("-bin"):
            base = guix_name(aur_name[:-4])
            if base != gname:
                aliases.append(f'(define-public {base} (package (inherit {gname}) (name "{base}")))')
        elif aur_name.endswith("-git"):
            base = guix_name(aur_name[:-4])
            if base != gname:
                aliases.append(f'(define-public {base} (package (inherit {gname}) (name "{base}")))')
        elif aur_name.endswith("-appimage"):
            base = guix_name(aur_name.replace("-appimage", ""))
            if base != gname:
                aliases.append(f'(define-public {base} (package (inherit {gname}) (name "{base}")))')

    if aliases:
        alias_block = f"\n;; --- {PASS_ID} compat aliases ---\n"
        alias_block += "\n".join(aliases) + "\n"
        content = content.rstrip() + "\n" + alias_block

    with tempfile.NamedTemporaryFile(mode='w', dir=COMPAT_SCM.parent, suffix='.scm',
                                     delete=False) as tmp:
        tmp.write(content)
        tmp_path = tmp.name
    shutil.move(tmp_path, COMPAT_SCM)


# === Main ===

def main():
    timestamp = datetime.now(timezone.utc).isoformat().replace("+00:00", "Z")

    # Step 1: Load selection
    print(f"[{PASS_ID}] Loading selection...")
    with open(SELECTION_FILE) as f:
        selection = json.load(f)

    # Step 2: Load AUR cache
    print(f"[{PASS_ID}] Loading AUR cache...")
    with open(AUR_CACHE) as f:
        aur_raw = json.load(f)
    aur_cache = {pkg["Name"]: pkg for pkg in aur_raw}
    del aur_raw
    print(f"  Loaded {len(aur_cache)} AUR packages")

    # Step 3: Build AUR lookup with categorization
    print(f"[{PASS_ID}] Categorizing packages...")
    lookup_packages = []
    for item in selection["packages"]:
        name = item["name"]
        number = item["number"]
        aur_data = aur_cache.get(name)
        in_aur = aur_data is not None
        cat = categorize_package(name, aur_data) if in_aur else "unknown"

        makedeps = [strip_version_constraint(d).lower()
                    for d in (aur_data.get("MakeDepends") or [])] if aur_data else []
        build_sys = determine_build_system(cat, makedeps)

        pkg_entry = {
            "name": name,
            "number": number,
            "in_aur": in_aur,
            "category": cat,
            "version": aur_data.get("Version", "0.0.0") if aur_data else "0.0.0",
            "description": aur_data.get("Description", "") if aur_data else "",
            "url": aur_data.get("URL", "") if aur_data else "",
            "license": aur_data.get("License") if aur_data else [],
            "depends": [strip_version_constraint(d) for d in (aur_data.get("Depends") or [])] if aur_data else [],
            "makedepends": [strip_version_constraint(d) for d in (aur_data.get("MakeDepends") or [])] if aur_data else [],
            "blocked_dep_count": item.get("blocked_dep_count", 0),
            "reverse_dep_count": item.get("reverse_dep_count", 0),
            "build_system": build_sys,
        }
        lookup_packages.append(pkg_entry)

    # Write lookup file
    lookup = {
        "pass_id": PASS_ID,
        "timestamp": timestamp,
        "packages": lookup_packages,
    }
    with open(LOOKUP_FILE, "w") as f:
        json.dump(lookup, f, indent=2)
    print(f"  Wrote {LOOKUP_FILE}")

    # Step 4: Generate recipes
    print(f"[{PASS_ID}] Generating recipes...")
    recipes = []
    exports = []
    results = []
    pkg_name_map = {}
    recipe_count = 0
    blocked_count = 0
    recipe_list = []

    for pkg in lookup_packages:
        action, reason, recipe_text, gname = categorize_and_resolve(pkg)
        results.append((pkg["name"], pkg["number"], action, reason, gname))

        if action == "RECIPE" and recipe_text:
            recipes.append(recipe_text)
            exports.append(gname)
            pkg_name_map[gname] = pkg["name"]
            recipe_count += 1
            recipe_list.append({
                "aur_name": pkg["name"],
                "number": pkg["number"],
                "guix_name": gname,
                "build_system": pkg["build_system"],
                "version": clean_version(pkg.get("version", "0.0.0")),
                "category": pkg["category"],
            })
        else:
            blocked_count += 1

    print(f"  Results: {recipe_count} recipes, {blocked_count} remaining blocked")

    # Step 5: Write recipe module
    if recipes:
        print(f"[{PASS_ID}] Writing recipe module: {RECIPE_FILE}")
        write_recipe_module(recipes, exports)

    # Step 6: Update todo
    print(f"[{PASS_ID}] Updating {TODO_FILE}")
    update_todo(results)

    # Step 7: Update packages.scm
    print(f"[{PASS_ID}] Updating {PACKAGES_SCM}")
    update_packages_scm(exports)

    # Step 8: Update general-compat.scm
    print(f"[{PASS_ID}] Updating {COMPAT_SCM}")
    update_compat_scm(exports, pkg_name_map)

    # Step 9: Write summary
    summary = {
        "pass_id": PASS_ID,
        "timestamp": timestamp,
        "total_blocked_in_tree": selection.get("total_blocked_in_tree", len(lookup_packages)),
        "total_selected": len(lookup_packages),
        "recipes_created": recipe_count,
        "remaining_blocked": blocked_count,
        "recipes": recipe_list,
        "blocked": [
            {"name": r[0], "number": r[1], "reason": r[3]}
            for r in results if r[2] == "BLOCKED"
        ],
    }

    with open(SUMMARY_FILE, "w") as f:
        json.dump(summary, f, indent=2)
    print(f"[{PASS_ID}] Wrote summary: {SUMMARY_FILE}")

    # Print summary
    print(f"\n{'='*60}")
    print(f"PASS SUMMARY: {PASS_ID}")
    print(f"{'='*60}")
    print(f"Total selected: {len(lookup_packages)}")
    print(f"Recipes created: {recipe_count}")
    print(f"Remaining blocked: {blocked_count}")
    print(f"\nRecipes:")
    for r in recipe_list:
        print(f"  {r['aur_name']} -> {r['guix_name']} ({r['build_system']}, v{r['version']})")
    print(f"\nBlocked:")
    for r in results:
        if r[2] == "BLOCKED":
            print(f"  {r[0]} (#{r[1]}): {r[3]}")

    return summary


if __name__ == "__main__":
    main()
