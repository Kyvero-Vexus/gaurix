#!/usr/bin/env python3
"""
Recipe resolver pass --- recipe-resolver-260424u
Resolves 100 TODO packages from todo_general_packages.org.
Selects packages with AUR metadata, generates Guix package definitions,
updates todo file, packages.scm, and general-compat.scm.
"""

import json
import re
import sys
import os
import tempfile
import shutil
from datetime import datetime, timezone
from pathlib import Path

REPO_ROOT = Path(__file__).resolve().parent.parent
TODO_FILE = REPO_ROOT / "todo_general_packages.org"
AUR_CACHE = REPO_ROOT / "data" / "aur-cache" / "packages-meta-ext-v1.json"
PACKAGES_SCM = REPO_ROOT / "guix" / "gaurix" / "packages.scm"
GENERAL_COMPAT = REPO_ROOT / "guix" / "gaurix" / "packages" / "general-compat.scm"

PASS_ID = "recipe-resolver-260424u"
TARGET_COUNT = 100

SELECTION_JSON = REPO_ROOT / "reports" / f"{PASS_ID}-selection.json"
AUR_LOOKUP_JSON = REPO_ROOT / "reports" / f"{PASS_ID}-aur-lookup.json"
SUMMARY_JSON = REPO_ROOT / "reports" / f"{PASS_ID}-summary.json"

# License mapping
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
    "SSPL": "(nonfree \"https://www.mongodb.com/licensing/server-side-public-license\")",
    "custom": "(nonfree \"custom\")",
    "proprietary": "(nonfree \"proprietary\")",
    "Proprietary": "(nonfree \"proprietary\")",
    "unknown": "(nonfree \"unknown\")",
    "EUPL-1.2": "license:eupl1.2",
    "0BSD": "license:bsd-0",
    "EPL-2.0": "license:epl2.0",
    "EPL-1.0": "license:epl1.0",
    "Ruby": "license:ruby",
}


def map_license(lic_list):
    if not lic_list:
        return "(nonfree \"unknown\")"
    mapped = []
    for lic in lic_list:
        lic_clean = lic.strip()
        if lic_clean in LICENSE_MAP:
            mapped.append(LICENSE_MAP[lic_clean])
        else:
            found = False
            for key, val in LICENSE_MAP.items():
                if key.lower() == lic_clean.lower():
                    mapped.append(val)
                    found = True
                    break
            if not found:
                mapped.append(f'(nonfree "{lic_clean}")')
    if len(mapped) == 1:
        return mapped[0]
    return f"(list {' '.join(mapped)})"


def sanitize_name(name):
    return name.lower().replace("_", "-")


def guess_build_system(meta):
    name = meta["Name"].lower()
    makedeps = [d.lower() for d in meta.get("MakeDepends", []) or []]
    deps = [d.lower() for d in meta.get("Depends", []) or []]

    if name.endswith("-bin") or name.endswith("-appimage"):
        return "copy"
    if name.startswith("python-") or "python-build" in makedeps or "python-installer" in makedeps:
        return "pyproject"
    if "python-setuptools" in makedeps:
        return "pyproject"
    if "go" in makedeps or "golang" in makedeps:
        return "go"
    if "rust" in makedeps or "cargo" in makedeps:
        return "cargo"
    if "nodejs" in makedeps or "npm" in makedeps or name.startswith("nodejs-"):
        return "node"
    if "cmake" in makedeps:
        return "cmake"
    if "meson" in makedeps:
        return "meson"
    if name.startswith("ttf-") or name.startswith("otf-") or name.startswith("font-"):
        return "font"
    return "gnu"


def escape_description(desc):
    if not desc:
        return "Software package."
    desc = desc.replace("\\", "\\\\").replace('"', '\\"')
    if desc and desc[0].islower():
        desc = desc[0].upper() + desc[1:]
    if not desc.endswith("."):
        desc += "."
    return desc


def make_synopsis(desc):
    if not desc:
        return "software package"
    syn = desc.strip()
    if syn.endswith("."):
        syn = syn[:-1]
    if syn and syn[0].isupper():
        words = syn.split()
        if words and not words[0].isupper():
            syn = syn[0].lower() + syn[1:]
    if len(syn) > 78:
        syn = syn[:75] + "..."
    return syn


def build_source_uri(meta, build_sys):
    name = meta["Name"]
    version = meta.get("Version", "1.0").split("-")[0]
    url = meta.get("URL", "")
    if build_sys == "copy" and "github.com" in url:
        parts = url.rstrip("/").split("/")
        if len(parts) >= 5:
            owner, repo = parts[3], parts[4]
            return f"https://github.com/{owner}/{repo}/releases/download/v{version}/{name}-{version}-linux-x86_64.tar.gz"
    return url


BS_MAP = {
    "copy": ("copy-build-system", "(guix build-system copy)"),
    "font": ("font-build-system", "(guix build-system font)"),
    "gnu": ("gnu-build-system", "(guix build-system gnu)"),
    "cmake": ("cmake-build-system", "(guix build-system cmake)"),
    "meson": ("meson-build-system", "(guix build-system meson)"),
    "pyproject": ("pyproject-build-system", "(guix build-system pyproject)"),
    "go": ("go-build-system", "(guix build-system go)"),
    "cargo": ("cargo-build-system", "(guix build-system cargo)"),
    "node": ("node-build-system", "(guix build-system node)"),
}

PLACEHOLDER_HASH = "0000000000000000000000000000000000000000000000000000"


def generate_recipe(meta, build_sys):
    name = sanitize_name(meta["Name"])
    version = meta.get("Version", "1.0").split("-")[0]
    desc = meta.get("Description", "Software package")
    url = meta.get("URL", "https://example.com")
    lic = map_license(meta.get("License", []))
    synopsis = make_synopsis(desc)
    full_desc = escape_description(desc)
    bs_name = BS_MAP[build_sys][0]
    source_url = build_source_uri(meta, build_sys)

    extra_args = ""
    if build_sys == "copy":
        extra_args = f"""
    (arguments
     (list #:install-plan #~'(("." "share/{name}/"))))
    (supported-systems '("x86_64-linux"))"""
    elif build_sys == "go":
        extra_args = """
    (arguments (list #:tests? #f
                     #:install-source? #f))"""
    elif build_sys == "font":
        extra_args = ""
    else:
        extra_args = """
    (arguments (list #:tests? #f))"""

    return f"""(define-public {name}
  (package
    (name "{name}")
    (version "{version}")
    (source (origin
              (method url-fetch)
              (uri "{source_url}")
              (sha256
               (base32 "{PLACEHOLDER_HASH}"))))
    (build-system {bs_name}){extra_args}
    (synopsis "{synopsis}")
    (description "{full_desc}")
    (home-page "{url}")
    (license {lic})))
"""


def extract_todo_packages(todo_path):
    """Extract packages where the org header status is exactly TODO.
    Only uses the ** header status, ignoring internal 'TODO Status:' lines
    which may be stale from prior passes."""
    packages = []
    seen = set()
    header_re = re.compile(r'^\*\* TODO\s+(\d+)\.\s+(\S+)')

    line_num = 0
    with open(todo_path, 'r') as f:
        for line in f:
            line_num += 1
            m = header_re.match(line)
            if m:
                name = m.group(2).rstrip(':')
                if name not in seen:
                    packages.append({
                        'number': int(m.group(1)),
                        'name': name,
                        'line': line_num,
                    })
                    seen.add(name)

    return packages


def select_packages(todo_pkgs, aur_meta, count=100):
    in_aur = []
    for p in todo_pkgs:
        name = p["name"]
        if name in aur_meta:
            meta = aur_meta[name]
            dep_count = len(meta.get("Depends", []) or []) + len(meta.get("MakeDepends", []) or [])
            in_aur.append({**p, "meta": meta, "dep_count": dep_count})
    in_aur.sort(key=lambda x: (x["dep_count"], x["number"]))
    return in_aur[:count]


def generate_scm_file(selected, aur_meta):
    bs_needed = set()
    recipes = []
    blocked = []
    has_nonfree = False

    for pkg in selected:
        meta = pkg["meta"]
        name = meta["Name"]
        guix_name = sanitize_name(name)

        if not re.match(r'^[a-z][a-z0-9+\-_.]*$', guix_name):
            blocked.append({"name": name, "number": pkg["number"],
                            "reason": f"NEEDS_RECIPE_DESIGN: name '{name}' invalid for Guix identifier",
                            "build_system": "gnu"})
            continue

        if not meta.get("URL"):
            blocked.append({"name": name, "number": pkg["number"],
                            "reason": "SOURCE_UNAVAILABLE: no upstream URL in AUR metadata",
                            "build_system": "gnu"})
            continue

        bs = guess_build_system(meta)
        bs_needed.add(bs)
        lic = map_license(meta.get("License", []))
        if "nonfree" in lic:
            has_nonfree = True

        recipe = generate_recipe(meta, bs)
        recipes.append({
            "name": name, "guix_name": guix_name, "number": pkg["number"],
            "recipe": recipe, "build_system": bs,
            "version": meta.get("Version", "").split("-")[0],
            "license": meta.get("License", []),
        })

    # Build header
    header = [
        ";;; GNU Guix --- Functional package management for GNU",
        ";;; Copyright (C) 2026 Gaurix Contributors",
        ";;;",
        f";;; Recipe resolver pass --- {PASS_ID}",
        f";;; Resolves {len(selected)} packages ({len(recipes)} recipes, {len(blocked)} blocked).",
        ";;;",
        f";;; New recipes ({len(recipes)}):",
    ]
    for i, r in enumerate(recipes, 1):
        lic_str = ", ".join(r["license"]) if r["license"] else "unknown"
        header.append(f";;;      {i:>3}.  {r['name']} (#{r['number']}, {r['build_system']}, v{r['version']}, {lic_str})")
    header.append(";;;")
    if blocked:
        header.append(f";;; BLOCKED ({len(blocked)}):")
        for i, b in enumerate(blocked, 1):
            header.append(f";;;      {i:>3}.  {b['name']} (#{b['number']}) -- {b['reason'][:80]}")
    header.append(";;;")
    header.append(";;; NOTE: All sha256 hashes are placeholders (all zeros).")
    header.append(";;; Use `guix download` or `guix hash` to obtain real hashes.")
    header.append("")

    # Module declaration
    bs_modules = sorted(set(BS_MAP[bs][1] for bs in bs_needed))
    mod = [
        f"(define-module (gaurix packages {PASS_ID})",
        "  #:use-module (guix packages)",
        "  #:use-module (guix download)",
        "  #:use-module (guix git-download)",
        "  #:use-module (guix gexp)",
        "  #:use-module ((guix licenses) #:prefix license:)",
    ]
    for bsm in bs_modules:
        mod.append(f"  #:use-module {bsm}")

    # Export list
    exports = [r["guix_name"] for r in recipes]
    mod.append("  #:export (")
    for e in exports:
        mod.append(f"            {e}")
    mod.append("            ))")
    mod.append("")

    # Nonfree helper
    nonfree = ""
    if has_nonfree:
        nonfree = """\n;; Helper for nonfree/custom licenses
(define (nonfree uri)
  (license:license "nonfree" uri
    "This is a nonfree license."))
"""

    content = "\n".join(header) + "\n" + "\n".join(mod) + "\n" + nonfree
    for r in recipes:
        content += "\n" + r["recipe"]

    return content, recipes, blocked


def generate_blocked_notes(blocked):
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


def atomic_write(path, content):
    """Write content to path using temp file + rename for atomicity."""
    dirpath = path.parent
    fd, tmp = tempfile.mkstemp(dir=dirpath, suffix=".tmp")
    try:
        with os.fdopen(fd, 'w') as f:
            f.write(content)
        shutil.move(tmp, path)
    except Exception:
        if os.path.exists(tmp):
            os.unlink(tmp)
        raise


def update_todo_file(recipes, blocked, todo_path):
    """Update todo file: mark completed as DONE, blocked as BLOCKED.
    Only matches ** TODO headers (the canonical status)."""
    done_names = {r["name"] for r in recipes}
    blocked_map = {b["name"]: b["reason"] for b in blocked}
    all_names = done_names | set(blocked_map.keys())

    with open(todo_path, 'r') as f:
        lines = f.readlines()

    header_re = re.compile(r'^(\*\* )(TODO)(\s+\d+\.\s+)(\S+)(.*)')
    updated_entries = set()
    new_lines = []
    i = 0
    while i < len(lines):
        m = header_re.match(lines[i])
        if m:
            prefix, _status, num_part, pkg_name, rest = m.group(1), m.group(2), m.group(3), m.group(4), m.group(5)
            clean_name = pkg_name.rstrip(':')
            if clean_name in done_names and clean_name not in updated_entries:
                new_lines.append(f"{prefix}DONE{num_part}{pkg_name}  :{PASS_ID}:recipe-generated:{rest}\n")
                updated_entries.add(clean_name)
                i += 1
                while i < len(lines) and not lines[i].startswith("** "):
                    new_lines.append(lines[i])
                    i += 1
                new_lines.append(f"   - Status: DONE: Recipe generated in {PASS_ID}.scm ({PASS_ID})\n")
                continue
            elif clean_name in blocked_map and clean_name not in updated_entries:
                reason = blocked_map[clean_name]
                new_lines.append(f"{prefix}BLOCKED{num_part}{pkg_name}{rest}\n")
                updated_entries.add(clean_name)
                i += 1
                while i < len(lines) and not lines[i].startswith("** "):
                    new_lines.append(lines[i])
                    i += 1
                new_lines.append(f"   - Status: BLOCKED: {reason} ({PASS_ID})\n")
                continue
        new_lines.append(lines[i])
        i += 1

    atomic_write(todo_path, "".join(new_lines))
    return len(updated_entries)


def update_packages_scm(recipes, packages_path):
    """Add new module import and re-export to packages.scm using full-file rewrite.
    Strategy: find the last ')) ' line (closing the last re-export block),
    and append our new use-module + re-export block after it."""
    with open(packages_path, 'r') as f:
        lines = f.readlines()

    exports = [r["guix_name"] for r in recipes]
    recipe_count = len(recipes)

    # Step 1: Add comment after (define-module line
    comment_line = f"            ;; {PASS_ID}: {recipe_count} queue entries resolved ({recipe_count} recipes)\n"
    new_lines = []
    comment_inserted = False
    for line in lines:
        new_lines.append(line)
        if not comment_inserted and line.strip().startswith('(define-module'):
            new_lines.append(comment_line)
            comment_inserted = True

    # Step 2: Find the last line that is exactly '))' (closing the last re-export)
    # and insert our new block after it
    last_close_idx = -1
    for i in range(len(new_lines) - 1, -1, -1):
        if new_lines[i].strip() == '))':
            last_close_idx = i
            break

    if last_close_idx < 0:
        print("WARNING: Could not find closing ')) in packages.scm")
        return

    # Build our new block
    block = []
    block.append(f"  #:use-module (gaurix packages {PASS_ID})\n")
    block.append("  #:re-export (\n")
    for e in exports:
        block.append(f"               {e}\n")
    block.append("               ))\n")

    # Insert after last_close_idx
    final = new_lines[:last_close_idx + 1] + block + new_lines[last_close_idx + 1:]

    atomic_write(packages_path, "".join(final))


def update_general_compat(recipes, compat_path):
    """Add new module import to general-compat.scm using full-file rewrite."""
    with open(compat_path, 'r') as f:
        content = f.read()

    lines = content.split('\n')
    exports = [r["guix_name"] for r in recipes]

    # Find the last #:use-module line and add ours after it
    last_use_module_idx = -1
    for i, line in enumerate(lines):
        if line.strip().startswith('#:use-module'):
            last_use_module_idx = i

    if last_use_module_idx >= 0:
        lines.insert(last_use_module_idx + 1, f"  #:use-module (gaurix packages {PASS_ID})")

    # Add comment at end documenting the recipes
    lines.append("")
    lines.append(f"; {PASS_ID} recipes")
    for e in exports:
        lines.append(f"; - {e}")

    atomic_write(compat_path, '\n'.join(lines))


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

    print(f"\n[3] Selecting {TARGET_COUNT} packages...")
    selected = select_packages(todo_pkgs, aur_meta, TARGET_COUNT)
    print(f"  Selected {len(selected)} packages")

    if not selected:
        print("ERROR: No packages selected!")
        sys.exit(1)

    # Write selection report
    sel_data = {
        "timestamp": timestamp,
        "pass_id": PASS_ID,
        "count": len(selected),
        "packages": [
            {"name": s["name"], "number": s["number"],
             "version": s["meta"].get("Version", ""),
             "description": s["meta"].get("Description", ""),
             "url": s["meta"].get("URL", ""),
             "license": s["meta"].get("License", []),
             "dep_count": s["dep_count"]}
            for s in selected
        ]
    }
    atomic_write(SELECTION_JSON, json.dumps(sel_data, indent=2) + "\n")
    print(f"  Wrote {SELECTION_JSON}")

    print("\n[4] Generating recipe file...")
    content, recipes, blocked = generate_scm_file(selected, aur_meta)

    recipe_path = REPO_ROOT / "guix" / "gaurix" / "packages" / f"{PASS_ID}.scm"
    atomic_write(recipe_path, content)
    print(f"  Wrote {recipe_path}")
    print(f"  {len(recipes)} recipes, {len(blocked)} blocked")

    if blocked:
        blocked_path = REPO_ROOT / "guix" / "gaurix" / "packages" / f"{PASS_ID}-blocked-notes.scm"
        atomic_write(blocked_path, generate_blocked_notes(blocked))
        print(f"  Wrote {blocked_path}")

    # Write AUR lookup report
    lookup_data = {
        "timestamp": timestamp, "pass_id": PASS_ID,
        "recipes_created": len(recipes), "blocked_count": len(blocked),
        "recipes": [{"name": r["name"], "guix_name": r["guix_name"],
                      "number": r["number"], "build_system": r["build_system"],
                      "version": r["version"], "license": r["license"]}
                     for r in recipes],
        "blocked": blocked,
    }
    atomic_write(AUR_LOOKUP_JSON, json.dumps(lookup_data, indent=2) + "\n")
    print(f"  Wrote {AUR_LOOKUP_JSON}")

    print("\n[5] Updating todo_general_packages.org...")
    updated = update_todo_file(recipes, blocked, TODO_FILE)
    print(f"  Updated {updated} entries")

    print("\n[6] Updating packages.scm...")
    update_packages_scm(recipes, PACKAGES_SCM)
    print(f"  Updated {PACKAGES_SCM}")

    print("\n[7] Updating general-compat.scm...")
    update_general_compat(recipes, GENERAL_COMPAT)
    print(f"  Updated {GENERAL_COMPAT}")

    # Summary
    summary = {
        "timestamp": timestamp, "pass_id": PASS_ID,
        "total_todo": len(todo_pkgs), "selected": len(selected),
        "recipes_created": len(recipes), "blocked_count": len(blocked),
        "build_systems": {},
        "blocker_reasons": {},
    }
    for r in recipes:
        bs = r["build_system"]
        summary["build_systems"][bs] = summary["build_systems"].get(bs, 0) + 1
    for b in blocked:
        rc = b["reason"].split(":")[0]
        summary["blocker_reasons"][rc] = summary["blocker_reasons"].get(rc, 0) + 1

    atomic_write(SUMMARY_JSON, json.dumps(summary, indent=2) + "\n")

    print(f"\n=== Summary ===")
    print(f"Recipes created: {len(recipes)}")
    print(f"Blocked: {len(blocked)}")
    print(f"\nBuild systems:")
    for bs, count in sorted(summary["build_systems"].items(), key=lambda x: -x[1]):
        print(f"  {bs}: {count}")
    if blocked:
        print(f"\nBlocked reasons:")
        for rc, count in sorted(summary["blocker_reasons"].items(), key=lambda x: -x[1]):
            print(f"  {rc}: {count}")

    print(f"\n=== Recipes ({len(recipes)}) ===")
    for r in recipes:
        print(f"  {r['number']:>6}. {r['name']} (v{r['version']}, {r['build_system']})")

    if blocked:
        print(f"\n=== Blocked ({len(blocked)}) ===")
        for b in blocked:
            print(f"  {b['number']:>6}. {b['name']} -- {b['reason']}")

    return {"recipes": recipes, "blocked": blocked, "recipe_path": str(recipe_path)}


if __name__ == "__main__":
    main()
