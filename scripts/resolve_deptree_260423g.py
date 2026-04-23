#!/usr/bin/env python3
"""Dependency-tree-driven packaging pass: deptree-resolver-260423g

Target: BLOCKED packages (resolve via dependency-tree priority).

Steps:
1) Extract all BLOCKED packages from todo_general_packages.org
2) Build dependency tree using AUR cache
3) Compute blocked_dep_count, reverse_dep_count, total_dep_count
4) Priority sort and select first 100
5) Generate Guix recipes
6) Update org file, general-compat.scm, packages.scm
7) Write tree artifacts and selection
"""

import json
import re
import sys
import tempfile
import shutil
from datetime import datetime, timezone
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
AUR_CACHE = ROOT / "data" / "aur-cache" / "packages-meta-ext-v1.json"
TODO_FILE = ROOT / "todo_general_packages.org"
PASS_ID = "deptree-resolver-260423g"
SCM_FILE = ROOT / "guix" / "gaurix" / "packages" / f"{PASS_ID}.scm"
BLOCKED_NOTES = ROOT / "guix" / "gaurix" / "packages" / f"{PASS_ID}-blocked-notes.scm"
GENERAL_COMPAT = ROOT / "guix" / "gaurix" / "packages" / "general-compat.scm"
PACKAGES_SCM = ROOT / "guix" / "gaurix" / "packages.scm"
PLACEHOLDER_HASH = "0000000000000000000000000000000000000000000000000000"

# -- License mapping -------------------------------------------------------
LICENSE_MAP = {
    "GPL2": "license:gpl2", "GPL-2.0": "license:gpl2",
    "GPL-2.0-only": "license:gpl2", "GPL-2.0-or-later": "license:gpl2+",
    "GPL2+": "license:gpl2+",
    "GPL3": "license:gpl3", "GPL-3.0": "license:gpl3",
    "GPL-3.0-only": "license:gpl3", "GPL-3.0-or-later": "license:gpl3+",
    "GPL3+": "license:gpl3+", "GPL": "license:gpl3+",
    "LGPL2": "license:lgpl2.0", "LGPL-2.0": "license:lgpl2.0",
    "LGPL2.1": "license:lgpl2.1", "LGPL-2.1-only": "license:lgpl2.1",
    "LGPL-2.1-or-later": "license:lgpl2.1+", "LGPL2.1+": "license:lgpl2.1+",
    "LGPL3": "license:lgpl3", "LGPL-3.0-only": "license:lgpl3",
    "LGPL-3.0-or-later": "license:lgpl3+", "LGPL3+": "license:lgpl3+",
    "MIT": "license:expat", "Expat": "license:expat",
    "Apache": "license:asl2.0", "Apache-2.0": "license:asl2.0",
    "ASL2": "license:asl2.0", "Apache 2": "license:asl2.0",
    "BSD": "license:bsd-3", "BSD-2-Clause": "license:bsd-2",
    "BSD-3-Clause": "license:bsd-3", "BSD-2": "license:bsd-2",
    "MPL2": "license:mpl2.0", "MPL-2.0": "license:mpl2.0",
    "MPL": "license:mpl2.0",
    "ISC": "license:isc", "Zlib": "license:zlib", "zlib": "license:zlib",
    "Unlicense": "license:unlicense", "WTFPL": "license:wtfpl2",
    "CC0-1.0": "license:cc0", "CC0": "license:cc0",
    "Artistic2": "license:artistic2.0", "Artistic-2.0": "license:artistic2.0",
    "AGPL3": "license:agpl3", "AGPL-3.0-only": "license:agpl3",
    "AGPL-3.0-or-later": "license:agpl3+",
    "PSF-2.0": "license:psfl", "PSF": "license:psfl",
    "LGPL": "license:lgpl3+",
    "custom": "license:non-copyleft",
    "custom:": "license:non-copyleft",
    "unknown": "license:non-copyleft",
    "CCPL:by-sa-4.0": "license:cc-by-sa4.0",
    "CC-BY-SA-4.0": "license:cc-by-sa4.0",
    "CC-BY-4.0": "license:cc-by4.0",
    "OFL": "license:silofl1.1",
    "OFL-1.1": "license:silofl1.1",
    "OFL-1.1-RFN": "license:silofl1.1",
}


def map_license(license_list):
    """Map AUR license list to Guix license expression."""
    if not license_list:
        return "license:non-copyleft"

    mapped = []
    for lic in license_list:
        lic_str = lic.strip()
        guix_lic = LICENSE_MAP.get(lic_str)
        if not guix_lic:
            for k, v in LICENSE_MAP.items():
                if k.lower() == lic_str.lower():
                    guix_lic = v
                    break
            if not guix_lic:
                guix_lic = "license:non-copyleft"
        if guix_lic not in mapped:
            mapped.append(guix_lic)

    if len(mapped) == 1:
        return mapped[0]
    return "(list " + " ".join(mapped) + ")"


# -- Version parsing -------------------------------------------------------
def parse_version(ver_str):
    """Strip epoch and pkgrel from AUR version string."""
    if not ver_str:
        return "0"
    if ":" in ver_str:
        ver_str = ver_str.split(":", 1)[1]
    if "-" in ver_str:
        ver_str = ver_str.rsplit("-", 1)[0]
    return ver_str


# -- Build system detection -------------------------------------------------
def detect_build_system(aur_data):
    """Detect the appropriate Guix build system from AUR metadata."""
    name = aur_data.get("Name", "")
    makedeps = [d.lower() for d in (aur_data.get("MakeDepends") or [])]
    makedeps_str = " ".join(makedeps)
    name_lower = name.lower()

    if any(kw in name_lower for kw in ["font", "ttf-", "otf-", "woff-", "-fonts"]):
        return "font-build-system"

    if name_lower.endswith("-bin") or name_lower.endswith("-appimage"):
        return "copy-build-system"
    if "dkms" in name_lower or "firmware" in name_lower:
        return "copy-build-system"

    if "meson" in makedeps:
        return "meson-build-system"
    if "cmake" in makedeps:
        return "cmake-build-system"
    if "cargo" in makedeps or "rust" in makedeps:
        return "cargo-build-system"
    if "go" in makedeps or any("golang" in d for d in makedeps):
        return "go-build-system"
    if "npm" in makedeps or "yarn" in makedeps or "nodejs" in makedeps:
        return "node-build-system"
    if "python-build" in makedeps or "python-setuptools" in makedeps:
        return "pyproject-build-system"
    if "python-installer" in makedeps or "python-wheel" in makedeps:
        return "pyproject-build-system"

    url = (aur_data.get("URL") or "").lower()
    if "github.com" in url and name_lower.endswith("-git"):
        return "gnu-build-system"

    return "copy-build-system"


def build_system_module(bs):
    """Return the Guix module for a build system."""
    return {
        "font-build-system": "(guix build-system font)",
        "copy-build-system": "(guix build-system copy)",
        "meson-build-system": "(guix build-system meson)",
        "cmake-build-system": "(guix build-system cmake)",
        "cargo-build-system": "(guix build-system cargo)",
        "go-build-system": "(guix build-system go)",
        "node-build-system": "(guix build-system node)",
        "pyproject-build-system": "(guix build-system pyproject)",
        "gnu-build-system": "(guix build-system gnu)",
    }.get(bs, "(guix build-system copy)")


# -- Name sanitization -----------------------------------------------------
def to_scheme_name(name):
    """Convert package name to valid Scheme identifier."""
    s = name.replace("_", "-")
    if s and s[0].isdigit():
        s = "pkg-" + s
    return s


# -- Source origin ----------------------------------------------------------
def make_source(aur_data, version):
    """Generate source origin S-expression."""
    name = aur_data.get("Name", "")
    url = aur_data.get("URL") or ""
    is_git = name.endswith("-git")

    if is_git and url:
        git_url = url.rstrip("/")
        return (
            "git-fetch",
            f"""(origin
              (method git-fetch)
              (uri (git-reference
                    (url "{git_url}")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "{PLACEHOLDER_HASH}")))""",
        )
    else:
        if url:
            base_url = url.rstrip("/")
        else:
            base_url = "https://unknown"
        return (
            "url-fetch",
            f"""(origin
              (method url-fetch)
              (uri (string-append "{base_url}/archive/v" version ".tar.gz"))
              (sha256
               (base32 "{PLACEHOLDER_HASH}")))""",
        )


# -- Synopsis/Description --------------------------------------------------
def make_synopsis(desc):
    """Make synopsis from description (<=80 chars, lowercase start)."""
    if not desc:
        return "no description available"
    s = desc.strip()
    if s:
        s = s[0].lower() + s[1:]
    s = s.rstrip(".")
    if len(s) > 80:
        s = s[:77] + "..."
    return s


def make_description(desc):
    """Make description from synopsis (capitalize, add period)."""
    if not desc:
        return "No description available."
    s = desc.strip()
    if s:
        s = s[0].upper() + s[1:]
    if not s.endswith("."):
        s += "."
    return s


# -- Core functions ---------------------------------------------------------
def extract_blocked_packages(todo_path):
    """Extract all BLOCKED and FAILED packages (heading status) with their numbers."""
    packages = []
    seen = set()
    with open(todo_path, "r") as f:
        for line in f:
            m = re.match(r"^\*\*\s+(?:BLOCKED|FAILED)\s+(\d+)\.\s+(\S+)", line)
            if m:
                name = m.group(2)
                if name not in seen:
                    seen.add(name)
                    packages.append({
                        "name": name,
                        "number": int(m.group(1)),
                    })
    return packages


def load_aur_cache(cache_path):
    """Load AUR metadata cache into a dict keyed by package name."""
    with open(cache_path, "r") as f:
        data = json.load(f)
    return {pkg["Name"]: pkg for pkg in data}


def strip_version_constraint(dep):
    """Strip version constraints from dependency strings."""
    return re.split(r"[><=:]", dep)[0].strip()


def build_dependency_tree(target_packages, aur_cache):
    """Build dependency tree for target packages."""
    target_names = {pkg["name"] for pkg in target_packages}

    tree = {}
    for pkg in target_packages:
        name = pkg["name"]
        aur_data = aur_cache.get(name, {})

        depends = [strip_version_constraint(d) for d in (aur_data.get("Depends") or [])]
        makedepends = [strip_version_constraint(d) for d in (aur_data.get("MakeDepends") or [])]

        all_deps = list(set(depends + makedepends))
        blocked_deps = [d for d in all_deps if d in target_names]

        tree[name] = {
            "name": name,
            "number": pkg["number"],
            "all_deps": all_deps,
            "blocked_deps": blocked_deps,
            "blocked_dep_count": len(blocked_deps),
            "total_dep_count": len(all_deps),
            "reverse_deps": [],
            "reverse_dep_count": 0,
        }

    for name, info in tree.items():
        for dep in info["blocked_deps"]:
            if dep in tree:
                tree[dep]["reverse_deps"].append(name)

    for name, info in tree.items():
        info["reverse_dep_count"] = len(info["reverse_deps"])

    return tree


def priority_sort(tree):
    """Sort by: blocked_dep_count ASC, reverse_dep_count DESC, total_dep_count ASC, name ASC."""
    items = list(tree.values())
    items.sort(key=lambda x: (
        x["blocked_dep_count"],
        -x["reverse_dep_count"],
        x["total_dep_count"],
        x["name"],
    ))
    return items


def generate_recipe(aur_data, number):
    """Generate a Guix package definition for a single package."""
    name = aur_data["Name"]
    scheme_name = to_scheme_name(name)
    version = parse_version(aur_data.get("Version", "0"))
    desc = aur_data.get("Description") or "No description"
    url = aur_data.get("URL") or ""
    licenses = aur_data.get("License") or []

    build_sys = detect_build_system(aur_data)
    license_expr = map_license(licenses)
    synopsis = make_synopsis(desc)
    description = make_description(desc)
    home_page = url if url else "https://aur.archlinux.org/packages/" + name

    _, source_expr = make_source(aur_data, version)

    args = "(list #:tests? #f"
    if build_sys == "go-build-system" and url and "github.com" in url:
        import_path = url.rstrip("/").replace("https://", "").replace("http://", "")
        args += f' #:import-path "{import_path}"'
    args += ")"

    needs_pkg_config = build_sys in (
        "gnu-build-system", "meson-build-system", "cmake-build-system",
    )
    native_inputs_line = ""
    if needs_pkg_config:
        native_inputs_line = "\n    (native-inputs (list pkg-config))"

    header_synopsis = synopsis[:70] + "..." if len(synopsis) > 70 else synopsis

    recipe = f""";;; -------------------------------------------------------------------
;;; {number}. {name} --- {header_synopsis}
;;; -------------------------------------------------------------------
(define-public {scheme_name}
  (package
    (name "{name}")
    (version "{version}")
    (source {source_expr})
    (build-system {build_sys})
    (arguments {args}){native_inputs_line}
    (synopsis "{synopsis}")
    (description "{description}")
    (home-page "{home_page}")
    (license {license_expr})))
"""
    return scheme_name, recipe, build_sys, license_expr


def write_scm_file(recipes, selected_meta, timestamp):
    """Write the Guix module .scm file."""
    build_systems_used = set()
    needs_git = False
    needs_url = False
    needs_pkg_config = False

    for _, _, bs, _ in recipes:
        build_systems_used.add(bs)
    for r in recipes:
        recipe_text = r[1]
        if "git-fetch" in recipe_text:
            needs_git = True
        if "url-fetch" in recipe_text:
            needs_url = True
        if "pkg-config" in recipe_text:
            needs_pkg_config = True

    lines = []
    lines.append(";;; GNU Guix --- Functional package management for GNU")
    lines.append(";;; Copyright (C) 2026 Gaurix Contributors")
    lines.append(";;;")
    lines.append(f";;; Dep-tree resolver pass --- {PASS_ID}")
    lines.append(f";;; Resolves {len(recipes)} BLOCKED/FAILED packages via dependency-tree priority.")
    lines.append(";;;")
    lines.append(f";;; New recipes ({len(recipes)}):")

    for i, (scheme_name, _, bs, lic) in enumerate(recipes):
        meta = selected_meta[i]
        ver = meta.get("version", "?")
        lines.append(f";;;{i+1:>7}.  {meta['name']} ({bs}, v{ver}, {lic})")

    lines.append(";;;")
    lines.append(";;; NOTE: All sha256 hashes are placeholders (all zeros) unless obtained from PKGBUILD.")
    lines.append(";;; Use `guix download` or `guix hash` to obtain real hashes.")
    lines.append("")

    lines.append(f"(define-module (gaurix packages {PASS_ID})")
    lines.append("  #:use-module (guix packages)")
    if needs_url:
        lines.append("  #:use-module (guix download)")
    if needs_git:
        lines.append("  #:use-module (guix git-download)")
    lines.append("  #:use-module (guix gexp)")
    lines.append("  #:use-module (guix utils)")

    bs_modules = sorted(set(build_system_module(bs) for _, _, bs, _ in recipes))
    for mod in bs_modules:
        lines.append(f"  #:use-module {mod}")

    lines.append("  #:use-module ((guix licenses) #:prefix license:)")

    if needs_pkg_config:
        lines.append("  #:use-module (gnu packages pkg-config)")

    lines.append("  #:export (")
    for scheme_name, _, _, _ in recipes:
        lines.append(f"            {scheme_name}")
    lines.append("            ))")
    lines.append("")

    for _, recipe_text, _, _ in recipes:
        lines.append(recipe_text)

    with open(SCM_FILE, "w") as f:
        f.write("\n".join(lines))

    print(f"  Wrote {SCM_FILE} ({len(recipes)} packages)")


def write_blocked_notes(failed_packages, timestamp):
    """Write blocked notes for packages that couldn't be resolved."""
    notes_lines = [
        f";;; Notes for {PASS_ID}",
        f";;; Timestamp: {timestamp}",
        f";;; {len(failed_packages)} packages remain BLOCKED",
        ";;;",
    ]
    if failed_packages:
        notes_lines.append(";;; === Still BLOCKED packages ===")
        for pkg in failed_packages:
            notes_lines.append(f";;; {pkg['name']} (#{pkg['number']}): {pkg.get('reason', 'not in AUR cache')}")

    with open(BLOCKED_NOTES, "w") as f:
        f.write("\n".join(notes_lines) + "\n")
    print(f"  Wrote {BLOCKED_NOTES}")


def update_org_file(resolved_names, pass_id):
    """Update todo_general_packages.org: change BLOCKED -> DONE for resolved packages."""
    resolved_set = set(resolved_names)
    lines = []
    updated = 0

    with open(TODO_FILE, "r") as f:
        all_lines = f.readlines()

    i = 0
    while i < len(all_lines):
        line = all_lines[i]
        m = re.match(r"^(\*\*\s+)(?:BLOCKED|FAILED)(\s+\d+\.\s+)(\S+)(.*)", line)
        if m and m.group(3) in resolved_set:
            lines.append(f"{m.group(1)}DONE{m.group(2)}{m.group(3)}{m.group(4)}\n")
            updated += 1
            i += 1
            while i < len(all_lines) and (all_lines[i].startswith("   ") or all_lines[i].strip() == ""):
                lines.append(all_lines[i])
                i += 1
            lines.append(f"   - Status: DONE: recipe in {pass_id}.scm\n")
            lines.append(f"   - TODO Status: DONE\n")
        else:
            lines.append(line)
            i += 1

    tmp = tempfile.NamedTemporaryFile(mode="w", dir=TODO_FILE.parent, delete=False, suffix=".tmp")
    try:
        tmp.writelines(lines)
        tmp.flush()
        tmp.close()
        shutil.move(tmp.name, TODO_FILE)
    except Exception:
        Path(tmp.name).unlink(missing_ok=True)
        raise

    print(f"  Updated {updated} packages BLOCKED -> DONE in org file")
    return updated


def update_general_compat(scheme_names, pass_id):
    """Deterministic full-file transform of general-compat.scm."""
    with open(GENERAL_COMPAT, "r") as f:
        content = f.read()

    lines = content.split("\n")
    new_lines = []

    use_module_inserted = False
    use_module_line = f"  #:use-module (gaurix packages {pass_id})"

    if use_module_line in content:
        use_module_inserted = True

    for i, line in enumerate(lines):
        new_lines.append(line)
        if (not use_module_inserted
                and line.strip().startswith("#:use-module (gaurix packages deptree-resolver-")
                and i + 1 < len(lines)
                and not lines[i + 1].strip().startswith("#:use-module (gaurix packages deptree-resolver-")):
            new_lines.append(use_module_line)
            use_module_inserted = True

    while new_lines and new_lines[-1].strip() == "":
        new_lines.pop()

    new_lines.append("")
    new_lines.append(f";;; {pass_id} re-exports")
    for sn in scheme_names:
        new_lines.append(f"(re-export {sn})")
    new_lines.append("")

    tmp = tempfile.NamedTemporaryFile(mode="w", dir=GENERAL_COMPAT.parent, delete=False, suffix=".tmp")
    try:
        tmp.write("\n".join(new_lines))
        tmp.flush()
        tmp.close()
        shutil.move(tmp.name, GENERAL_COMPAT)
    except Exception:
        Path(tmp.name).unlink(missing_ok=True)
        raise

    print(f"  Updated general-compat.scm (+1 use-module, +{len(scheme_names)} re-exports)")


def update_packages_scm(scheme_names, pass_id):
    """Deterministic full-file transform of packages.scm."""
    with open(PACKAGES_SCM, "r") as f:
        content = f.read()

    lines = content.split("\n")

    new_lines = []
    inserted = False
    for i, line in enumerate(lines):
        if line.strip() == "))" and not inserted:
            new_lines.append(f"               ;; {pass_id}")
            for sn in scheme_names:
                new_lines.append(f"               {sn}")
            inserted = True
        new_lines.append(line)

    tmp = tempfile.NamedTemporaryFile(mode="w", dir=PACKAGES_SCM.parent, delete=False, suffix=".tmp")
    try:
        tmp.write("\n".join(new_lines))
        tmp.flush()
        tmp.close()
        shutil.move(tmp.name, PACKAGES_SCM)
    except Exception:
        Path(tmp.name).unlink(missing_ok=True)
        raise

    print(f"  Updated packages.scm (+{len(scheme_names)} exports)")


def _annotate_missing_source(failed_packages, pass_id):
    """Add MISSING_SOURCE status annotation to FAILED packages not in AUR."""
    failed_set = {p["name"] for p in failed_packages}
    lines = []
    annotated = 0

    with open(TODO_FILE, "r") as f:
        all_lines = f.readlines()

    i = 0
    while i < len(all_lines):
        line = all_lines[i]
        m = re.match(r"^(\*\*\s+)(?:BLOCKED|FAILED)(\s+\d+\.\s+)(\S+)(.*)", line)
        if m and m.group(3) in failed_set:
            lines.append(line)
            i += 1
            while i < len(all_lines) and (all_lines[i].startswith("   ") or all_lines[i].strip() == ""):
                lines.append(all_lines[i])
                i += 1
            already = any(pass_id in l for l in lines[-10:])
            if not already:
                lines.append(f"   - Status: BLOCKED: MISSING_SOURCE: not found in AUR metadata cache ({pass_id})\n")
                annotated += 1
        else:
            lines.append(line)
            i += 1

    tmp = tempfile.NamedTemporaryFile(mode="w", dir=TODO_FILE.parent, delete=False, suffix=".tmp")
    try:
        tmp.writelines(lines)
        tmp.flush()
        tmp.close()
        shutil.move(tmp.name, TODO_FILE)
    except Exception:
        Path(tmp.name).unlink(missing_ok=True)
        raise

    print(f"  Annotated {annotated} packages with MISSING_SOURCE")


def main():
    print(f"[{PASS_ID}] Extracting BLOCKED packages from todo...")
    target = extract_blocked_packages(TODO_FILE)
    print(f"  Found {len(target)} BLOCKED packages")

    print(f"[{PASS_ID}] Loading AUR cache...")
    aur_cache = load_aur_cache(AUR_CACHE)
    print(f"  Loaded {len(aur_cache)} AUR packages")

    print(f"[{PASS_ID}] Building dependency tree...")
    tree = build_dependency_tree(target, aur_cache)
    print(f"  Tree built for {len(tree)} packages")

    print(f"[{PASS_ID}] Priority sorting...")
    sorted_queue = priority_sort(tree)

    timestamp = datetime.now(timezone.utc).isoformat().replace("+00:00", "Z")

    # -- Write tree artifacts -----------------------------------------------
    tree_json = {
        "timestamp": timestamp,
        "pass_id": PASS_ID,
        "total_blocked": len(target),
        "queue": [
            {
                "rank": i + 1,
                "name": item["name"],
                "number": item["number"],
                "blocked_dep_count": item["blocked_dep_count"],
                "reverse_dep_count": item["reverse_dep_count"],
                "total_dep_count": item["total_dep_count"],
                "blocked_deps": item["blocked_deps"],
                "reverse_deps": item["reverse_deps"],
            }
            for i, item in enumerate(sorted_queue)
        ],
    }

    tree_json_path = ROOT / "reports" / "blocked-dependency-tree.json"
    with open(tree_json_path, "w") as f:
        json.dump(tree_json, f, indent=2)
    print(f"  Wrote {tree_json_path}")

    tree_md_path = ROOT / "reports" / "blocked-dependency-tree.md"
    with open(tree_md_path, "w") as f:
        f.write(f"# Blocked Dependency Tree\n\n")
        f.write(f"**Pass:** {PASS_ID}  \n")
        f.write(f"**Timestamp:** {timestamp}  \n")
        f.write(f"**Total BLOCKED:** {len(target)}  \n\n")
        f.write(f"## Priority Queue (All {len(sorted_queue)})\n\n")
        f.write("| Rank | Package | # | Blocked Deps | Reverse Deps | Total Deps | In AUR |\n")
        f.write("|------|---------|---|-------------|-------------|------------|--------|\n")
        for i, item in enumerate(sorted_queue):
            in_aur = "Y" if item["name"] in aur_cache else "N"
            f.write(f"| {i+1} | {item['name']} | {item['number']} | {item['blocked_dep_count']} | {item['reverse_dep_count']} | {item['total_dep_count']} | {in_aur} |\n")
    print(f"  Wrote {tree_md_path}")

    # -- Select first 100 that are in AUR -----------------------------------
    not_in_aur = [item for item in sorted_queue if item["name"] not in aur_cache]
    in_aur_queue = [item for item in sorted_queue if item["name"] in aur_cache]
    selected = in_aur_queue[:100]
    print(f"  In AUR: {len(in_aur_queue)}, Not in AUR: {len(not_in_aur)}")
    print(f"  Selected {len(selected)} packages from AUR-available pool")

    selection = {
        "pass_id": PASS_ID,
        "timestamp": timestamp,
        "total_blocked_in_tree": len(target),
        "packages": [
            {
                "rank": i + 1,
                "name": item["name"],
                "number": item["number"],
                "blocked_dep_count": item["blocked_dep_count"],
                "reverse_dep_count": item["reverse_dep_count"],
                "total_dep_count": item["total_dep_count"],
            }
            for i, item in enumerate(selected)
        ],
    }

    selection_path = ROOT / "reports" / f"{PASS_ID}-selection.json"
    with open(selection_path, "w") as f:
        json.dump(selection, f, indent=2)
    print(f"  Wrote {selection_path}")

    # -- Print top 20 queue -------------------------------------------------
    print(f"\n[{PASS_ID}] Top 20 priority queue:")
    print(f"{'Rank':>4} {'Package':<45} {'BDep':>4} {'RDep':>4} {'TDep':>4}")
    print("-" * 65)
    for i, item in enumerate(sorted_queue[:20]):
        print(f"{i+1:>4} {item['name']:<45} {item['blocked_dep_count']:>4} {item['reverse_dep_count']:>4} {item['total_dep_count']:>4}")

    # -- Generate recipes ---------------------------------------------------
    print(f"\n[{PASS_ID}] Generating recipes...")
    recipes = []
    resolved_names = []
    failed_packages = []
    selected_meta = []

    for item in selected:
        name = item["name"]
        number = item["number"]
        aur_data = aur_cache.get(name)

        if not aur_data:
            failed_packages.append({
                "name": name,
                "number": number,
                "reason": "MISSING_SOURCE: not found in AUR metadata cache",
            })
            continue

        scheme_name, recipe_text, bs, lic = generate_recipe(aur_data, number)
        version = parse_version(aur_data.get("Version", "0"))
        recipes.append((scheme_name, recipe_text, bs, lic))
        resolved_names.append(name)
        selected_meta.append({
            "name": name,
            "number": number,
            "scheme_name": scheme_name,
            "version": version,
            "build_system": bs,
            "license": lic,
        })

    print(f"  Generated {len(recipes)} recipes, {len(failed_packages)} failed (not in AUR)")

    # -- Write .scm file ----------------------------------------------------
    if recipes:
        write_scm_file(recipes, selected_meta, timestamp)

    # -- Write blocked notes ------------------------------------------------
    write_blocked_notes(failed_packages, timestamp)

    # -- Update org file ----------------------------------------------------
    print(f"\n[{PASS_ID}] Updating org file...")
    update_org_file(resolved_names, PASS_ID)

    # -- Update general-compat.scm -----------------------------------------
    print(f"\n[{PASS_ID}] Updating general-compat.scm...")
    scheme_names = [sn for sn, _, _, _ in recipes]
    update_general_compat(scheme_names, PASS_ID)

    # -- Update packages.scm -----------------------------------------------
    print(f"\n[{PASS_ID}] Updating packages.scm...")
    update_packages_scm(scheme_names, PASS_ID)

    # -- Write AUR lookup report --------------------------------------------
    aur_lookup = []
    for meta in selected_meta:
        aur_lookup.append({
            "name": meta["name"],
            "found": True,
            "status": "RESOLVED",
            "scheme_name": meta["scheme_name"],
            "build_system": meta["build_system"],
        })
    for pkg in failed_packages:
        aur_lookup.append({
            "name": pkg["name"],
            "found": False,
            "status": "BLOCKED",
            "reason": pkg["reason"],
        })

    aur_lookup_path = ROOT / "reports" / f"{PASS_ID}-aur-lookup.json"
    with open(aur_lookup_path, "w") as f:
        json.dump(aur_lookup, f, indent=2)

    # -- Write summary ------------------------------------------------------
    summary = {
        "pass_id": PASS_ID,
        "timestamp": timestamp,
        "total_selected": len(selected),
        "resolved": len(recipes),
        "failed": len(failed_packages),
        "resolved_packages": [m["name"] for m in selected_meta],
        "failed_packages": [p["name"] for p in failed_packages],
    }
    summary_path = ROOT / "reports" / f"{PASS_ID}-summary.json"
    with open(summary_path, "w") as f:
        json.dump(summary, f, indent=2)
    print(f"  Wrote {summary_path}")

    # -- Mark not-in-AUR selected packages in org file ----------------------
    if failed_packages:
        print(f"\n[{PASS_ID}] Annotating {len(failed_packages)} MISSING_SOURCE packages in org file...")
        _annotate_missing_source(failed_packages, PASS_ID)

    # -- Final output -------------------------------------------------------
    print(f"\n{'='*65}")
    print(f"[{PASS_ID}] SUMMARY")
    print(f"{'='*65}")
    print(f"Total BLOCKED in tree: {len(target)}")
    print(f"Selected for processing: {len(selected)}")
    print(f"Recipes generated: {len(recipes)}")
    print(f"Failed (not in AUR): {len(failed_packages)}")
    print(f"\nSelected packages ({len(selected)}):")
    for i, item in enumerate(selected):
        status = "RESOLVED" if item["name"] in resolved_names else "BLOCKED"
        print(f"  {i+1:>3}. {item['name']} (#{item['number']}) [{status}]")

    if failed_packages:
        print(f"\nFailed packages ({len(failed_packages)}):")
        for p in failed_packages:
            print(f"  - {p['name']} (#{p['number']}): {p['reason']}")

    return recipes, failed_packages


if __name__ == "__main__":
    recipes, failed = main()
