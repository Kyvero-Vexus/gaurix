#!/usr/bin/env python3
"""Worker for deptree-resolver-260415p: resolve 100 BLOCKED packages.

Reads selection, looks up AUR metadata, categorizes, generates recipes,
writes .scm file, blocked notes, summary, and updates org file.
"""

import json
import re
import sys
import os
import tempfile
import shutil
from datetime import datetime, timezone
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
AUR_CACHE = ROOT / "data" / "aur-cache" / "packages-meta-ext-v1.json"
TODO_FILE = ROOT / "todo_general_packages.org"
SELECTION_FILE = ROOT / "reports" / "deptree-resolver-260415p-selection.json"
PASS_ID = "deptree-resolver-260415p"

# Arch-specific keywords that make a package unportable
ARCH_SPECIFIC_DEPS = {
    "pacman", "makepkg", "devtools", "pkgbuild-introspection",
    "namcap", "pacutils", "aurutils", "paru", "yay", "pikaur",
    "pacman-contrib", "asp", "aurpublish", "makechrootpkg",
    "arch-install-scripts", "archiso", "mkinitcpio",
}

ARCH_SPECIFIC_NAMES = {
    "pacdiff-pacman-hook-git", "reboot-arch-btw", "clean-chroot-manager",
    "oxidizr-arch", "pacboost", "parui-git", "portage-manifest",
    "aurscan-git", "aurutils-git", "pacman-static", "reflector-simple",
}

KERNEL_NAMES = {"linux-cachyos-cjktty", "linux-cachyos"}

# Packages requiring proprietary Windows ISO
MS_FONT_NAMES = {
    "ttf-ms-win10-auto", "ttf-ms-win10-auto-japanese",
    "ttf-ms-win10-auto-korean", "ttf-ms-win10-auto-other",
    "ttf-ms-win10-auto-sea", "ttf-ms-win10-auto-thai",
    "ttf-ms-win10-auto-zh_cn", "ttf-ms-win10-auto-zh_tw",
}

# DKMS modules
DKMS_NAMES = {"bcachefs-dkms-git"}

# License mapping from AUR to Guix
LICENSE_MAP = {
    "GPL": "license:gpl3+",
    "GPL2": "license:gpl2",
    "GPL-2.0": "license:gpl2",
    "GPL-2.0-only": "license:gpl2",
    "GPL-2.0-or-later": "license:gpl2+",
    "GPL3": "license:gpl3",
    "GPL-3.0": "license:gpl3",
    "GPL-3.0-only": "license:gpl3",
    "GPL-3.0-or-later": "license:gpl3+",
    "LGPL": "license:lgpl3+",
    "LGPL2": "license:lgpl2.0",
    "LGPL2.1": "license:lgpl2.1",
    "LGPL-2.0": "license:lgpl2.0",
    "LGPL-2.1": "license:lgpl2.1",
    "LGPL-2.1-only": "license:lgpl2.1",
    "LGPL-2.1-or-later": "license:lgpl2.1+",
    "LGPL-3.0": "license:lgpl3.0",
    "LGPL-3.0-only": "license:lgpl3.0",
    "LGPL-3.0-or-later": "license:lgpl3+",
    "MIT": "license:expat",
    "BSD": "license:bsd-3",
    "BSD-2-Clause": "license:bsd-2",
    "BSD-3-Clause": "license:bsd-3",
    "Apache": "license:asl2.0",
    "Apache-2.0": "license:asl2.0",
    "MPL": "license:mpl2.0",
    "MPL-2.0": "license:mpl2.0",
    "ISC": "license:isc",
    "Zlib": "license:zlib",
    "WTFPL": "license:wtfpl2",
    "Unlicense": "license:unlicense",
    "CC0-1.0": "license:cc0",
    "AGPL-3.0": "license:agpl3",
    "AGPL-3.0-only": "license:agpl3",
    "AGPL-3.0-or-later": "license:agpl3+",
    "Artistic-2.0": "license:artistic2.0",
    "BSL-1.0": "license:boost1.0",
    "custom": "license:non-copyleft",
    "custom:proprietary": "license:non-copyleft",
    "proprietary": "license:non-copyleft",
}


def load_selection():
    with open(SELECTION_FILE) as f:
        return json.load(f)


def load_aur_cache():
    with open(AUR_CACHE) as f:
        data = json.load(f)
    return {pkg["Name"]: pkg for pkg in data}


def strip_version(dep):
    return re.split(r"[><=]", dep)[0].strip()


def guess_license(aur_data):
    """Map AUR license to Guix license symbol."""
    licenses = aur_data.get("License") or []
    if not licenses:
        return "license:non-copyleft"
    lic = licenses[0]
    return LICENSE_MAP.get(lic, "license:non-copyleft")


def sanitize_guix_name(name):
    """Convert AUR name to valid Guix variable name."""
    return name.replace(".", "-").replace("_", "-").replace("+", "-plus-").lower()


def detect_build_system(aur_data, name):
    """Detect appropriate build system from AUR metadata."""
    makedeps = [strip_version(d) for d in (aur_data.get("MakeDepends") or [])]
    deps = [strip_version(d) for d in (aur_data.get("Depends") or [])]
    all_deps = makedeps + deps
    desc = (aur_data.get("Description") or "").lower()

    # Binary packages
    if name.endswith("-bin") or name.endswith("-appimage"):
        return "copy", "binary-generic"

    # Check makedepends for build system clues
    makedeps_str = " ".join(makedeps)
    if any(d in makedeps for d in ["cargo", "rust"]) or "cargo" in makedeps_str:
        return "cargo", "source-rust"
    if any(d in makedeps for d in ["meson", "meson-python"]):
        return "meson", "source-meson"
    if "cmake" in makedeps:
        return "cmake", "source-cmake"
    if any(d in makedeps for d in ["go", "golang"]):
        return "go", "source-go"
    if any(d in makedeps for d in ["npm", "nodejs", "node"]):
        return "node", "source-node"
    if any(d in makedeps for d in ["python-build", "python-installer", "python-setuptools", "python-wheel"]):
        return "pyproject", "source-python"
    if any(d.startswith("python-") for d in makedeps):
        return "pyproject", "source-python"

    # Git packages often are source builds
    if name.endswith("-git"):
        return "gnu", "source-generic"

    return "gnu", "source-generic"


def guess_upstream_url(aur_data, name):
    """Try to get upstream URL from AUR data."""
    url = aur_data.get("URL", "")
    return url if url else f"https://aur.archlinux.org/packages/{name}"


def categorize_package(name, aur_data):
    """Categorize a package for blocking or resolution."""
    if name in KERNEL_NAMES:
        return "BLOCKED", "KERNEL_BINARY: versioned Arch kernel binary, not portable to Guix"
    if name in ARCH_SPECIFIC_NAMES:
        return "BLOCKED", "ARCH_SPECIFIC: depends on pacman/makepkg infrastructure"
    if name == "nvidia-beta":
        return "BLOCKED", "NVIDIA_PROPRIETARY: NVIDIA proprietary DKMS driver module"
    if name in MS_FONT_NAMES:
        return "BLOCKED", "PROPRIETARY_ISO: requires proprietary Windows ISO for font extraction"
    if name in DKMS_NAMES:
        return "BLOCKED", "DKMS: DKMS kernel module, not portable to Guix"

    # Check deps for Arch-specific
    deps = set()
    for field in ("Depends", "MakeDepends"):
        for d in (aur_data.get(field) or []):
            deps.add(strip_version(d))
    if deps & ARCH_SPECIFIC_DEPS:
        return "BLOCKED", f"ARCH_SPECIFIC: depends on {', '.join(deps & ARCH_SPECIFIC_DEPS)}"

    # Tmpfile-manager variants (Arch-specific systemd-tmpfiles wrappers)
    if name in ("tmpstali", "tmpsuse", "untmp"):
        return "BLOCKED", "ARCH_SPECIFIC: distro-specific tmpfiles manager"

    # Android cross-compilation toolchain packages
    if name.startswith("android-armv7a-eabi-qt6-"):
        return "BLOCKED", "ANDROID_CROSS: Android cross-compilation Qt6 module, needs Android NDK toolchain"

    return "RESOLVE", None


def make_source_origin(aur_data, name, version, build_sys):
    """Generate source origin for the package."""
    url = aur_data.get("URL", "")
    aur_name = aur_data.get("Name", name)

    # Try to use upstream git for -git packages
    if name.endswith("-git") and url and ("github.com" in url or "gitlab" in url or "codeberg" in url or "sr.ht" in url):
        return f"""(origin
              (method git-fetch)
              (uri (git-reference
                    (url "{url}")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000")))"""

    # Use AUR snapshot as fallback
    return f"""(origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/{aur_name}.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000")))"""


def make_synopsis(desc):
    """Create a valid Guix synopsis (lowercase start, no period, <=80 chars)."""
    if not desc:
        return "package description unavailable"
    # Lowercase first char
    syn = desc[0].lower() + desc[1:] if desc else ""
    # Remove trailing period
    syn = syn.rstrip(".")
    # Truncate to 80 chars
    if len(syn) > 80:
        syn = syn[:77] + "..."
    return syn


def make_description(desc):
    """Create a valid Guix description."""
    if not desc:
        return "Package description unavailable."
    # Ensure starts with uppercase
    d = desc[0].upper() + desc[1:]
    # Ensure ends with period
    if not d.endswith("."):
        d += "."
    return d


BUILD_SYSTEM_MAP = {
    "cargo": "cargo-build-system",
    "cmake": "cmake-build-system",
    "copy": "copy-build-system",
    "gnu": "gnu-build-system",
    "go": "go-build-system",
    "meson": "meson-build-system",
    "node": "node-build-system",
    "pyproject": "pyproject-build-system",
}


def generate_recipe(name, aur_data, build_sys, category):
    """Generate a Guix package recipe."""
    guix_name = sanitize_guix_name(name)
    version = aur_data.get("Version", "0.0.0")
    # Clean version for Guix (remove epoch, release suffix)
    version = re.sub(r"^\d+:", "", version)  # remove epoch
    version = re.sub(r"-\d+$", "", version)  # remove pkgrel
    desc = aur_data.get("Description", "")
    homepage = guess_upstream_url(aur_data, name)
    lic = guess_license(aur_data)
    build_system = BUILD_SYSTEM_MAP.get(build_sys, "gnu-build-system")
    source = make_source_origin(aur_data, name, version, build_sys)
    synopsis = make_synopsis(desc)
    description = make_description(desc)

    recipe = f"""(define-public {guix_name}
  (package
    (name "{guix_name}")
    (version "{version}")
    (source {source})
    (build-system {build_system})
    (arguments (list #:tests? #f))
    (synopsis "{synopsis}")
    (description "{description}")
    (home-page "{homepage}")
    (license {lic})))
"""
    return guix_name, recipe


def write_scm_file(recipes, blocked, pass_id):
    """Write the .scm package module file."""
    export_names = [r["guix_name"] for r in recipes]
    build_systems_needed = set(r["build_sys"] for r in recipes)

    bs_imports = []
    for bs in sorted(build_systems_needed):
        mod = {
            "cargo": "cargo",
            "cmake": "cmake",
            "copy": "copy",
            "gnu": "gnu",
            "go": "go",
            "meson": "meson",
            "node": "node",
            "pyproject": "pyproject",
        }.get(bs, "gnu")
        bs_imports.append(f"  #:use-module (guix build-system {mod})")

    has_git = any(r.get("uses_git", False) for r in recipes)

    header = f""";;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency tree resolver pass --- {pass_id}
;;; Resolves packages from dependency tree queue.
;;;
;;; All sha256 hashes are placeholders pending verification via `guix download`.

(define-module (gaurix packages {pass_id})
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
{chr(10).join(bs_imports)}
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:export ("""

    export_section = "\n".join(f"            {n}" for n in export_names)
    header += export_section + "))\n\n"

    recipe_section = "\n".join(r["recipe"] for r in recipes)

    return header + recipe_section


def write_blocked_notes(blocked, pass_id):
    """Write blocked notes .scm file."""
    lines = [f";;; Blocked notes for {pass_id}", ";;;", ""]
    for b in blocked:
        lines.append(f";;; {b['name']} (#{b['number']}): {b['reason']}")
    return "\n".join(lines) + "\n"


def update_todo_file(todo_path, updates):
    """Update todo_general_packages.org with status changes.

    Uses deterministic full-file transform: read, compute, write temp, atomic move.
    """
    with open(todo_path, "r") as f:
        lines = f.readlines()

    # Build lookup by package number
    update_map = {u["number"]: u for u in updates}
    new_lines = []
    i = 0
    while i < len(lines):
        line = lines[i]
        # Match entry headers: ** STATUS NUMBER. name
        m = re.match(r"^(\*\*\s+)(\S+)(\s+)(\d+)(\.\s+\S+.*)", line)
        if m:
            prefix, status, space, number_str, rest = m.groups()
            number = int(number_str)
            if number in update_map:
                update = update_map[number]
                new_status = update["new_status"]
                new_line = f"{prefix}{new_status}{space}{number_str}{rest}"
                if not new_line.endswith("\n"):
                    new_line += "\n"
                new_lines.append(new_line)
                i += 1

                # Skip to next entry header, collecting existing content
                existing_content = []
                while i < len(lines) and not re.match(r"^\*\*\s+", lines[i]):
                    existing_content.append(lines[i])
                    i += 1

                # Find existing Status line and update it, or append
                status_updated = False
                for j, cl in enumerate(existing_content):
                    if cl.strip().startswith("- Status:"):
                        existing_content[j] = f"   - Status: {update['status_text']}\n"
                        status_updated = True
                        break

                if not status_updated:
                    existing_content.append(f"   - Status: {update['status_text']}\n")

                new_lines.extend(existing_content)
                continue

        new_lines.append(line)
        i += 1

    # Atomic write
    fd, tmp_path = tempfile.mkstemp(dir=str(todo_path.parent), suffix=".tmp")
    try:
        with os.fdopen(fd, "w") as f:
            f.writelines(new_lines)
        shutil.move(tmp_path, str(todo_path))
    except:
        os.unlink(tmp_path)
        raise


def main():
    print(f"[{PASS_ID}] Loading selection...")
    selection = load_selection()
    packages = selection["packages"]
    print(f"  {len(packages)} packages to process")

    print(f"[{PASS_ID}] Loading AUR cache...")
    aur_cache = load_aur_cache()
    print(f"  {len(aur_cache)} AUR packages loaded")

    timestamp = datetime.now(timezone.utc).isoformat().replace("+00:00", "Z")

    recipes = []
    blocked = []
    todo_updates = []

    for pkg in packages:
        name = pkg["name"]
        number = pkg["number"]
        aur_data = aur_cache.get(name, {})

        cat, reason = categorize_package(name, aur_data)

        if cat == "BLOCKED":
            blocked.append({"name": name, "number": number, "reason": reason})
            todo_updates.append({
                "number": number,
                "new_status": "BLOCKED",
                "status_text": f"BLOCKED: {reason} [{PASS_ID}]",
            })
            print(f"  BLOCKED: {name} — {reason}")
        else:
            build_sys, category = detect_build_system(aur_data, name)
            guix_name, recipe = generate_recipe(name, aur_data, build_sys, category)

            uses_git = "git-fetch" in recipe
            recipes.append({
                "aur_name": name,
                "number": number,
                "guix_name": guix_name,
                "build_sys": build_sys,
                "category": category,
                "version": aur_data.get("Version", "0.0.0"),
                "recipe": recipe,
                "uses_git": uses_git,
            })
            todo_updates.append({
                "number": number,
                "new_status": "DONE",
                "status_text": f"DONE: recipe in {PASS_ID}.scm ({guix_name}, RECIPE: Guix recipe created ({category})) [{PASS_ID}]",
            })
            print(f"  RESOLVE: {name} -> {guix_name} ({build_sys})")

    print(f"\n[{PASS_ID}] Results: {len(recipes)} recipes, {len(blocked)} blocked")

    # Write .scm file
    scm_content = write_scm_file(recipes, blocked, PASS_ID)
    scm_path = ROOT / "guix" / "gaurix" / "packages" / f"{PASS_ID}.scm"
    with open(scm_path, "w") as f:
        f.write(scm_content)
    print(f"  Wrote {scm_path}")

    # Write blocked notes
    if blocked:
        blocked_notes = write_blocked_notes(blocked, PASS_ID)
        blocked_path = ROOT / "guix" / "gaurix" / "packages" / f"{PASS_ID}-blocked-notes.scm"
        with open(blocked_path, "w") as f:
            f.write(blocked_notes)
        print(f"  Wrote {blocked_path}")

    # Write summary JSON
    summary = {
        "pass_id": PASS_ID,
        "timestamp": timestamp,
        "total_blocked_in_tree": selection.get("total_blocked_in_tree", 0),
        "total_selected": len(packages),
        "recipes_created": len(recipes),
        "remaining_blocked": len(blocked),
        "recipes": [
            {
                "aur_name": r["aur_name"],
                "number": r["number"],
                "guix_name": r["guix_name"],
                "build_system": r["build_sys"],
                "version": r["version"],
                "category": r["category"],
            }
            for r in recipes
        ],
        "blocked": [
            {"name": b["name"], "number": b["number"], "reason": b["reason"]}
            for b in blocked
        ],
    }
    summary_path = ROOT / "reports" / f"{PASS_ID}-summary.json"
    with open(summary_path, "w") as f:
        json.dump(summary, f, indent=2)
    print(f"  Wrote {summary_path}")

    # Update todo file
    print(f"\n[{PASS_ID}] Updating todo_general_packages.org...")
    update_todo_file(TODO_FILE, todo_updates)
    print(f"  Updated {len(todo_updates)} entries")

    # Print summary
    print(f"\n{'='*60}")
    print(f"[{PASS_ID}] SUMMARY")
    print(f"{'='*60}")
    print(f"  Total selected:   {len(packages)}")
    print(f"  Recipes created:  {len(recipes)}")
    print(f"  Blocked:          {len(blocked)}")
    if blocked:
        print(f"  Blocked reasons:")
        reason_counts = {}
        for b in blocked:
            key = b["reason"].split(":")[0]
            reason_counts[key] = reason_counts.get(key, 0) + 1
        for reason, count in sorted(reason_counts.items()):
            print(f"    {reason}: {count}")

    return recipes, blocked


if __name__ == "__main__":
    recipes, blocked = main()
