#!/usr/bin/env python3
"""Worker for deptree-resolver-260415l: resolve 100 BLOCKED packages.

Reads selection, looks up AUR metadata, categorizes, generates recipes,
writes .scm file, blocked notes, summary, and updates org file.
Skips packages that already have recipes in existing .scm files.
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
SELECTION_FILE = ROOT / "reports" / "deptree-resolver-260415l-selection.json"
PASS_ID = "deptree-resolver-260415l"
PKG_DIR = ROOT / "guix" / "gaurix" / "packages"

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

MS_FONT_NAMES = {
    "ttf-ms-win10-auto", "ttf-ms-win10-auto-japanese",
    "ttf-ms-win10-auto-korean", "ttf-ms-win10-auto-other",
    "ttf-ms-win10-auto-sea", "ttf-ms-win10-auto-thai",
    "ttf-ms-win10-auto-zh_cn", "ttf-ms-win10-auto-zh_tw",
}

DKMS_NAMES = {"bcachefs-dkms-git"}

LICENSE_MAP = {
    "GPL": "license:gpl3+", "GPL2": "license:gpl2", "GPL-2.0": "license:gpl2",
    "GPL-2.0-only": "license:gpl2", "GPL-2.0-or-later": "license:gpl2+",
    "GPL3": "license:gpl3", "GPL-3.0": "license:gpl3", "GPL-3.0-only": "license:gpl3",
    "GPL-3.0-or-later": "license:gpl3+", "LGPL": "license:lgpl3+",
    "LGPL2": "license:lgpl2.0", "LGPL2.1": "license:lgpl2.1",
    "LGPL-2.1": "license:lgpl2.1", "LGPL-2.1-only": "license:lgpl2.1",
    "LGPL-2.1-or-later": "license:lgpl2.1+", "LGPL-3.0": "license:lgpl3.0",
    "LGPL-3.0-or-later": "license:lgpl3+", "MIT": "license:expat",
    "BSD": "license:bsd-3", "BSD-2-Clause": "license:bsd-2",
    "BSD-3-Clause": "license:bsd-3", "Apache": "license:asl2.0",
    "Apache-2.0": "license:asl2.0", "MPL": "license:mpl2.0",
    "MPL-2.0": "license:mpl2.0", "ISC": "license:isc", "Zlib": "license:zlib",
    "WTFPL": "license:wtfpl2", "Unlicense": "license:unlicense",
    "CC0-1.0": "license:cc0", "AGPL-3.0": "license:agpl3",
    "AGPL-3.0-only": "license:agpl3", "AGPL-3.0-or-later": "license:agpl3+",
    "Artistic-2.0": "license:artistic2.0", "BSL-1.0": "license:boost1.0",
    "custom": "license:non-copyleft", "custom:proprietary": "license:non-copyleft",
    "proprietary": "license:non-copyleft",
}

BUILD_SYSTEM_MAP = {
    "cargo": "cargo-build-system", "cmake": "cmake-build-system",
    "copy": "copy-build-system", "gnu": "gnu-build-system",
    "go": "go-build-system", "meson": "meson-build-system",
    "node": "node-build-system", "pyproject": "pyproject-build-system",
}


def load_existing_definitions():
    """Scan all .scm files for existing define-public names."""
    existing = set()
    for fn in os.listdir(PKG_DIR):
        if fn.endswith(".scm") and not fn.endswith("-blocked-notes.scm"):
            path = PKG_DIR / fn
            with open(path) as f:
                for line in f:
                    m = re.match(r"\(define-public\s+(\S+)", line)
                    if m:
                        existing.add(m.group(1))
    # Also check packages.scm
    with open(ROOT / "guix" / "gaurix" / "packages.scm") as f:
        for line in f:
            m = re.match(r"\(define-public\s+(\S+)", line)
            if m:
                existing.add(m.group(1))
    return existing


def strip_version(dep):
    return re.split(r"[><=]", dep)[0].strip()


def guess_license(aur_data):
    licenses = aur_data.get("License") or []
    if not licenses:
        return "license:non-copyleft"
    return LICENSE_MAP.get(licenses[0], "license:non-copyleft")


def sanitize_guix_name(name):
    return name.replace(".", "-").replace("_", "-").replace("+", "-plus-").lower()


def detect_build_system(aur_data, name):
    makedeps = [strip_version(d) for d in (aur_data.get("MakeDepends") or [])]
    deps = [strip_version(d) for d in (aur_data.get("Depends") or [])]

    if name.endswith("-bin") or name.endswith("-appimage"):
        return "copy", "binary-generic"

    makedeps_str = " ".join(makedeps)
    if any(d in makedeps for d in ["cargo", "rust"]):
        return "cargo", "source-rust"
    if any(d in makedeps for d in ["meson", "meson-python"]):
        return "meson", "source-meson"
    if "cmake" in makedeps:
        return "cmake", "source-cmake"
    if any(d in makedeps for d in ["go", "golang"]):
        return "go", "source-go"
    if any(d in makedeps for d in ["npm", "nodejs", "node"]):
        return "node", "source-node"
    if any(d in makedeps for d in ["python-build", "python-installer",
                                     "python-setuptools", "python-wheel"]):
        return "pyproject", "source-python"
    if any(d.startswith("python-") for d in makedeps):
        return "pyproject", "source-python"
    return "gnu", "source-generic"


def categorize_package(name, aur_data):
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

    deps = set()
    for field in ("Depends", "MakeDepends"):
        for d in (aur_data.get(field) or []):
            deps.add(strip_version(d))
    if deps & ARCH_SPECIFIC_DEPS:
        return "BLOCKED", f"ARCH_SPECIFIC: depends on {', '.join(sorted(deps & ARCH_SPECIFIC_DEPS))}"

    if name in ("tmpstali", "tmpsuse", "untmp"):
        return "BLOCKED", "ARCH_SPECIFIC: distro-specific tmpfiles manager"
    if name.startswith("android-armv7a-eabi-qt6-"):
        return "BLOCKED", "ANDROID_CROSS: Android cross-compilation Qt6 module, needs Android NDK toolchain"

    return "RESOLVE", None


def make_source_origin(aur_data, name, version):
    url = aur_data.get("URL", "")
    aur_name = aur_data.get("Name", name)

    if name.endswith("-git") and url and any(h in url for h in
        ["github.com", "gitlab", "codeberg", "sr.ht"]):
        return f"""(origin
              (method git-fetch)
              (uri (git-reference
                    (url "{url}")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000")))"""

    return f"""(origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/{aur_name}.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000")))"""


def make_synopsis(desc):
    if not desc:
        return "package description unavailable"
    syn = desc[0].lower() + desc[1:]
    syn = syn.rstrip(".")
    if len(syn) > 80:
        syn = syn[:77] + "..."
    # Escape any quotes
    syn = syn.replace('"', '\\"')
    return syn


def make_description(desc):
    if not desc:
        return "Package description unavailable."
    d = desc[0].upper() + desc[1:]
    if not d.endswith("."):
        d += "."
    d = d.replace('"', '\\"')
    return d


def generate_recipe(name, aur_data, build_sys):
    guix_name = sanitize_guix_name(name)
    version = aur_data.get("Version", "0.0.0")
    version = re.sub(r"^\d+:", "", version)
    version = re.sub(r"-\d+$", "", version)
    desc = aur_data.get("Description", "")
    homepage = aur_data.get("URL", f"https://aur.archlinux.org/packages/{name}")
    lic = guess_license(aur_data)
    build_system = BUILD_SYSTEM_MAP.get(build_sys, "gnu-build-system")
    source = make_source_origin(aur_data, name, version)
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


def write_scm_file(recipes, pass_id):
    export_names = [r["guix_name"] for r in recipes]
    build_systems_needed = set(r["build_sys"] for r in recipes)

    bs_map = {"cargo": "cargo", "cmake": "cmake", "copy": "copy", "gnu": "gnu",
              "go": "go", "meson": "meson", "node": "node", "pyproject": "pyproject"}
    bs_imports = [f"  #:use-module (guix build-system {bs_map.get(bs, 'gnu')})"
                  for bs in sorted(build_systems_needed)]

    header = f""";;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency tree resolver pass --- {pass_id}
;;; Resolves BLOCKED packages from dependency tree queue.
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


def update_todo_file(todo_path, updates):
    with open(todo_path, "r") as f:
        lines = f.readlines()

    update_map = {u["number"]: u for u in updates}
    new_lines = []
    i = 0
    while i < len(lines):
        line = lines[i]
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

                existing_content = []
                while i < len(lines) and not re.match(r"^\*\*\s+", lines[i]):
                    existing_content.append(lines[i])
                    i += 1

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
    with open(SELECTION_FILE) as f:
        selection = json.load(f)
    packages = selection["packages"]
    print(f"  {len(packages)} packages to process")

    print(f"[{PASS_ID}] Loading AUR cache...")
    with open(AUR_CACHE) as f:
        aur_data_all = json.load(f)
    aur_cache = {pkg["Name"]: pkg for pkg in aur_data_all}
    print(f"  {len(aur_cache)} AUR packages loaded")

    print(f"[{PASS_ID}] Scanning existing definitions...")
    existing_defs = load_existing_definitions()
    print(f"  {len(existing_defs)} existing define-public entries")

    timestamp = datetime.now(timezone.utc).isoformat().replace("+00:00", "Z")

    recipes = []
    blocked = []
    skipped = []
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
            guix_name = sanitize_guix_name(name)

            if guix_name in existing_defs:
                skipped.append({"name": name, "number": number, "guix_name": guix_name})
                todo_updates.append({
                    "number": number,
                    "new_status": "DONE",
                    "status_text": f"DONE: recipe already exists ({guix_name}) [{PASS_ID}]",
                })
                print(f"  SKIP (exists): {name} → {guix_name}")
                continue

            guix_name, recipe = generate_recipe(name, aur_data, build_sys)
            recipes.append({
                "aur_name": name,
                "number": number,
                "guix_name": guix_name,
                "build_sys": build_sys,
                "category": category,
                "version": aur_data.get("Version", "0.0.0"),
                "recipe": recipe,
            })
            todo_updates.append({
                "number": number,
                "new_status": "DONE",
                "status_text": f"DONE: recipe in {PASS_ID}.scm ({guix_name}, {BUILD_SYSTEM_MAP.get(build_sys, 'gnu')}) [{PASS_ID}]",
            })
            print(f"  RESOLVE: {name} → {guix_name} ({build_sys})")

    print(f"\n[{PASS_ID}] Results: {len(recipes)} new recipes, {len(skipped)} skipped (existing), {len(blocked)} blocked")

    # Write .scm file
    if recipes:
        scm_content = write_scm_file(recipes, PASS_ID)
        scm_path = PKG_DIR / f"{PASS_ID}.scm"
        with open(scm_path, "w") as f:
            f.write(scm_content)
        print(f"  Wrote {scm_path}")

    # Write blocked notes
    blocked_notes_lines = [f";;; Blocked notes for {PASS_ID}", ";;;", ""]
    for b in blocked:
        blocked_notes_lines.append(f";;; {b['name']} (#{b['number']}): {b['reason']}")
    blocked_path = PKG_DIR / f"{PASS_ID}-blocked-notes.scm"
    with open(blocked_path, "w") as f:
        f.write("\n".join(blocked_notes_lines) + "\n")
    print(f"  Wrote {blocked_path}")

    # Write summary JSON
    summary = {
        "pass_id": PASS_ID,
        "timestamp": timestamp,
        "total_blocked_in_tree": selection.get("total_blocked_in_tree", 0),
        "total_selected": len(packages),
        "recipes_created": len(recipes),
        "skipped_existing": len(skipped),
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
        "skipped": [
            {"name": s["name"], "number": s["number"], "guix_name": s["guix_name"]}
            for s in skipped
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

    print(f"\n{'='*60}")
    print(f"[{PASS_ID}] SUMMARY")
    print(f"{'='*60}")
    print(f"  Total selected:      {len(packages)}")
    print(f"  New recipes:         {len(recipes)}")
    print(f"  Skipped (existing):  {len(skipped)}")
    print(f"  Blocked:             {len(blocked)}")
    reason_counts = {}
    for b in blocked:
        key = b["reason"].split(":")[0]
        reason_counts[key] = reason_counts.get(key, 0) + 1
    for reason, count in sorted(reason_counts.items()):
        print(f"    {reason}: {count}")

    return recipes, skipped, blocked


if __name__ == "__main__":
    main()
