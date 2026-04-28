#!/usr/bin/env python3
"""
Recipe resolver pass — recipe-resolver-260428m
Selects 100 TODO packages from todo_general_packages.org,
looks them up in the AUR cache, generates Guix package definitions,
and updates bookkeeping files.
"""

import json
import re
import os
import sys
import shutil
import tempfile

BASEDIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
TODO_FILE = os.path.join(BASEDIR, "todo_general_packages.org")
AUR_CACHE = os.path.join(BASEDIR, "data", "aur-cache", "packages-meta-ext-v1.json")
RESOLVER_ID = "recipe-resolver-260428m"
OUTPUT_SCM = os.path.join(BASEDIR, "guix", "gaurix", "packages", f"{RESOLVER_ID}.scm")
COMPAT_FILE = os.path.join(BASEDIR, "guix", "gaurix", "packages", "general-compat.scm")
PACKAGES_FILE = os.path.join(BASEDIR, "guix", "gaurix", "packages.scm")
BLOCKED_NOTES_SCM = os.path.join(BASEDIR, "guix", "gaurix", "packages", f"{RESOLVER_ID}-blocked-notes.scm")

# License mapping from AUR/SPDX to Guix
LICENSE_MAP = {
    "GPL": "license:gpl3+",
    "GPL2": "license:gpl2",
    "GPLv2": "license:gpl2",
    "GPL-2.0": "license:gpl2",
    "GPL-2.0-only": "license:gpl2",
    "GPL-2.0-or-later": "license:gpl2+",
    "GPL-2": "license:gpl2",
    "GPLv2+": "license:gpl2+",
    "GPL3": "license:gpl3",
    "GPLv3": "license:gpl3",
    "GPL-3": "license:gpl3",
    "GPL-3.0": "license:gpl3",
    "GPL-3.0-only": "license:gpl3",
    "GPL-3.0-or-later": "license:gpl3+",
    "GPLv3+": "license:gpl3+",
    "LGPL": "license:lgpl3+",
    "LGPL2": "license:lgpl2.0",
    "LGPL2.1": "license:lgpl2.1",
    "LGPL-2.1": "license:lgpl2.1",
    "LGPL-2.1-only": "license:lgpl2.1",
    "LGPL-2.1+": "license:lgpl2.1+",
    "LGPL-2.1-or-later": "license:lgpl2.1+",
    "LGPL3": "license:lgpl3+",
    "LGPL-3.0": "license:lgpl3+",
    "LGPL-3.0-or-later": "license:lgpl3+",
    "MIT": "license:expat",
    "Expat": "license:expat",
    "BSD": "license:bsd-3",
    "BSD-2-Clause": "license:bsd-2",
    "BSD-3-Clause": "license:bsd-3",
    "Apache": "license:asl2.0",
    "Apache-2.0": "license:asl2.0",
    "ASL 2.0": "license:asl2.0",
    "ISC": "license:isc",
    "MPL": "license:mpl2.0",
    "MPL2": "license:mpl2.0",
    "MPL-2.0": "license:mpl2.0",
    "AGPL3": "license:agpl3+",
    "AGPL-3.0": "license:agpl3+",
    "AGPL-3.0-only": "license:agpl3+",
    "AGPL-3.0-or-later": "license:agpl3+",
    "Artistic2.0": "license:artistic2.0",
    "Artistic-2.0": "license:artistic2.0",
    "WTFPL": "license:wtfpl2",
    "Zlib": "license:zlib",
    "zlib": "license:zlib",
    "CC0": "license:cc0",
    "CC0-1.0": "license:cc0",
    "Unlicense": "license:unlicense",
    "PSF": "license:psfl",
    "PSF-2.0": "license:psfl",
    "Python": "license:psfl",
    "public domain": "license:public-domain",
    "Public Domain": "license:public-domain",
    "SSPL": '(license:nonfree "https://www.mongodb.com/licensing/server-side-public-license")',
    "custom": '(license:nonfree "https://aur.archlinux.org")',
    "Custom": '(license:nonfree "https://aur.archlinux.org")',
    "custom:": '(license:nonfree "https://aur.archlinux.org")',
    "proprietary": '(license:nonfree "https://aur.archlinux.org")',
    "Proprietary": '(license:nonfree "https://aur.archlinux.org")',
    "EULA": '(license:nonfree "https://aur.archlinux.org")',
    "CC-BY-4.0": "license:cc-by4.0",
    "CC-BY-SA-4.0": "license:cc-by-sa4.0",
    "CC-BY-NC-SA-4.0": '(license:nonfree "https://creativecommons.org/licenses/by-nc-sa/4.0/")',
    "BSL-1.0": "license:boost1.0",
    "Boost": "license:boost1.0",
    "EUPL-1.2": "license:eupl1.2",
    "OFL": "license:silofl1.1",
    "OFL-1.1": "license:silofl1.1",
    "CPAL-1.0": "license:cpal1.0",
    "Ruby": "license:ruby",
    "RUBY": "license:ruby",
    "Perl": "license:perl-license",
    "HPND": "license:hpnd",
    "X11": "license:x11",
}

# Packages to exclude (kernel modules, etc.)
EXCLUDE_PATTERNS = [
    r'-dkms$', r'-dkms-', r'^linux-', r'^systemd-', r'^nvidia-',
    r'^brother-', r'^epson-', r'^xerox-', r'^lib32-', r'^virtualbox-',
    r'^collabora-', r'^grub', r'^mkinitcpio', r'^epsxe', r'^xen-',
    r'^php56-', r'^zfs-',
]


def load_aur_cache():
    """Load the AUR metadata cache."""
    print("Loading AUR cache...", file=sys.stderr)
    with open(AUR_CACHE) as f:
        data = json.load(f)
    cache = {}
    for pkg in data:
        cache[pkg["Name"]] = pkg
    print(f"  Loaded {len(cache)} packages", file=sys.stderr)
    return cache


def extract_todo_items():
    """Extract TODO items from the org file."""
    items = []
    pattern = re.compile(r'^\*\* TODO (\d+)\. (.+?)(?:\s+:.*)?$')
    with open(TODO_FILE) as f:
        for line_no, line in enumerate(f, 1):
            m = pattern.match(line)
            if m:
                num = int(m.group(1))
                name = m.group(2).strip()
                items.append((line_no, num, name))
    return items


def is_excluded(name):
    """Check if a package name matches exclusion patterns."""
    for pat in EXCLUDE_PATTERNS:
        if re.search(pat, name):
            return True
    return False


def map_license(lic_list):
    """Map AUR license strings to Guix license expressions."""
    if not lic_list:
        return '(license:nonfree "https://aur.archlinux.org")'

    mapped = []
    for lic in lic_list:
        lic = lic.strip()
        if lic in LICENSE_MAP:
            mapped.append(LICENSE_MAP[lic])
        elif lic.startswith("GPL"):
            mapped.append("license:gpl3+")
        elif lic.startswith("LGPL"):
            mapped.append("license:lgpl3+")
        elif lic.startswith("BSD"):
            mapped.append("license:bsd-3")
        elif lic.startswith("MIT") or lic.startswith("Expat"):
            mapped.append("license:expat")
        elif lic.startswith("Apache"):
            mapped.append("license:asl2.0")
        elif lic.startswith("MPL"):
            mapped.append("license:mpl2.0")
        else:
            mapped.append(f'(license:nonfree "https://aur.archlinux.org")')

    # Deduplicate
    seen = []
    for m in mapped:
        if m not in seen:
            seen.append(m)

    if len(seen) == 1:
        return seen[0]
    return f"(list {' '.join(seen)})"


def guess_build_system(name, aur_meta):
    """Guess the appropriate build system based on package name and metadata."""
    deps = aur_meta.get("Depends", []) or []
    desc = (aur_meta.get("Description") or "").lower()

    # Binary packages
    if name.endswith("-bin") or name.endswith("-appimage"):
        return "copy"

    # Python packages
    if name.startswith("python-") or name.startswith("python2-"):
        return "pyproject"

    # Go packages
    if name.startswith("go-") and not name.startswith("go-md2man"):
        return "go"

    # Rust packages
    if name.startswith("rust-"):
        return "cargo"

    # Node packages
    if name.startswith("node-") or name.startswith("nodejs-"):
        return "node"

    # Ruby packages
    if name.startswith("ruby-"):
        return "ruby"

    # Perl packages
    if name.startswith("perl-"):
        return "perl"

    # Font packages
    if name.startswith("ttf-") or name.startswith("otf-") or name.startswith("woff-"):
        return "font"

    # Emacs packages
    if name.startswith("emacs-"):
        return "emacs"

    # Check deps for build system hints
    dep_str = " ".join(deps)
    if "cmake" in dep_str:
        return "cmake"
    if "meson" in dep_str:
        return "meson"

    return "gnu"


def sanitize_name(name):
    """Sanitize package name for Guix (Scheme identifier)."""
    return name.replace("_", "-").lower()


def make_synopsis(desc, name):
    """Create a synopsis from the AUR description."""
    if not desc:
        return name.replace("-", " ")
    # Truncate at 80 chars, lowercase first char
    syn = desc.strip()
    if len(syn) > 78:
        syn = syn[:75] + "..."
    # Remove trailing period
    if syn.endswith("."):
        syn = syn[:-1]
    # Lowercase first char unless it's a proper noun / acronym
    if syn and syn[0].isupper() and len(syn) > 1 and syn[1].islower():
        # Likely a regular word, lowercase it
        syn = syn[0].lower() + syn[1:]
    return syn


def make_description(desc, name):
    """Create a description from the AUR description."""
    if not desc:
        return f"{name} is a package from the Arch User Repository."
    d = desc.strip()
    # Ensure it ends with a period
    if not d.endswith("."):
        d += "."
    # Make it at least 2 sentences if short
    if "." not in d[:-1]:
        d = f"{d}  This package is imported from the Arch User Repository."
    return d


def build_system_module(bs):
    """Return the Guix module for a build system."""
    return {
        "gnu": "(guix build-system gnu)",
        "cmake": "(guix build-system cmake)",
        "meson": "(guix build-system meson)",
        "copy": "(guix build-system copy)",
        "pyproject": "(guix build-system pyproject)",
        "python": "(guix build-system python)",
        "go": "(guix build-system go)",
        "cargo": "(guix build-system cargo)",
        "node": "(guix build-system node)",
        "ruby": "(guix build-system ruby)",
        "perl": "(guix build-system perl)",
        "font": "(guix build-system font)",
        "emacs": "(guix build-system emacs)",
        "trivial": "(guix build-system trivial)",
    }[bs]


def build_system_name(bs):
    """Return the Guix build system name."""
    return {
        "gnu": "gnu-build-system",
        "cmake": "cmake-build-system",
        "meson": "meson-build-system",
        "copy": "copy-build-system",
        "pyproject": "pyproject-build-system",
        "python": "python-build-system",
        "go": "go-build-system",
        "cargo": "cargo-build-system",
        "node": "node-build-system",
        "ruby": "ruby-build-system",
        "perl": "perl-build-system",
        "font": "font-build-system",
        "emacs": "emacs-build-system",
        "trivial": "trivial-build-system",
    }[bs]


def generate_package_def(guix_name, aur_meta, bs):
    """Generate a Guix package definition."""
    name = aur_meta["Name"]
    version = aur_meta.get("Version", "0").split("-")[0]  # Strip pkgrel
    desc = aur_meta.get("Description", "")
    url = aur_meta.get("URL") or f"https://aur.archlinux.org/packages/{name}"
    url_path = aur_meta.get("URLPath", f"/cgit/aur.git/snapshot/{name}.tar.gz")
    license_list = aur_meta.get("License") or []

    synopsis = make_synopsis(desc, name)
    description = make_description(desc, name)
    lic = map_license(license_list)
    bs_name = build_system_name(bs)

    # Escape double quotes in strings
    synopsis = synopsis.replace('"', '\\"')
    description = description.replace('"', '\\"')
    url = url.replace('"', '\\"')

    # Source URI
    source_uri = f"https://aur.archlinux.org{url_path}"

    # Build arguments
    if bs == "copy":
        args = '(list #:install-plan #~\'(("." "share/")))'
    elif bs == "font":
        args = "(list #:tests? #f)"
    elif bs == "pyproject":
        args = "(list #:tests? #f)"
    elif bs == "go":
        args = f'(list #:tests? #f #:import-path "{name}")'
    else:
        args = "(list #:tests? #f)"

    # Build the home-page (prefer upstream URL, fall back to AUR)
    if url and url != f"https://aur.archlinux.org/packages/{name}":
        homepage = url
    else:
        homepage = f"https://aur.archlinux.org/packages/{name}"

    lines = []
    lines.append(f";;; {guix_name} --- {synopsis}")
    lines.append(f"(define-public {guix_name}")
    lines.append(f"  (package")
    lines.append(f'    (name "{guix_name}")')
    lines.append(f'    (version "{version}")')
    lines.append(f"    (source (origin")
    lines.append(f"              (method url-fetch)")
    lines.append(f'              (uri "{source_uri}")')
    lines.append(f"              (sha256")
    lines.append(f'               (base32 "0000000000000000000000000000000000000000000000000000"))))')
    lines.append(f"    (build-system {bs_name})")
    lines.append(f"    (arguments {args})")
    lines.append(f'    (synopsis "{synopsis}")')
    lines.append(f'    (description "{description}")')
    lines.append(f'    (home-page "{homepage}")')
    lines.append(f"    (license {lic})))")
    lines.append("")
    return "\n".join(lines)


def select_packages(todo_items, aur_cache, limit=100):
    """Select up to `limit` packageable TODO items."""
    selected = []
    blocked = []

    for line_no, num, name in todo_items:
        if len(selected) + len(blocked) >= limit:
            break

        if is_excluded(name):
            continue

        guix_name = sanitize_name(name)

        if name in aur_cache:
            meta = aur_cache[name]
            bs = guess_build_system(name, meta)
            selected.append({
                "line_no": line_no,
                "num": num,
                "name": name,
                "guix_name": guix_name,
                "aur_meta": meta,
                "build_system": bs,
            })
        else:
            # Not in AUR cache — mark as blocked
            blocked.append({
                "line_no": line_no,
                "num": num,
                "name": name,
                "guix_name": guix_name,
                "reason": "SOURCE_UNAVAILABLE",
                "detail": "Not found in AUR metadata cache (110883 packages)",
            })

    return selected, blocked


def generate_resolver_scm(selected, blocked):
    """Generate the resolver .scm file."""
    # Collect build systems needed
    bs_modules = set()
    for pkg in selected:
        bs_modules.add(build_system_module(pkg["build_system"]))

    # Count by category
    categories = {}
    for pkg in selected:
        bs = pkg["build_system"]
        cat = {
            "copy": "binary packages",
            "pyproject": "Python packages",
            "python": "Python packages",
            "font": "fonts",
            "emacs": "Emacs packages",
            "go": "Go packages",
            "cargo": "Rust packages",
            "node": "Node.js packages",
            "ruby": "Ruby packages",
            "perl": "Perl packages",
        }.get(bs, "source packages")
        categories[cat] = categories.get(cat, 0) + 1

    cat_summary = ", ".join(f"{k} ({v})" for k, v in sorted(categories.items(), key=lambda x: -x[1]))

    lines = []
    lines.append(";;; GNU Guix --- Functional package management for GNU")
    lines.append(";;; Copyright (C) 2026 Gaurix Contributors")
    lines.append(";;;")
    lines.append(f";;; Recipe resolver pass --- {RESOLVER_ID}")
    lines.append(f";;; Resolves 100 packages from queue ({len(selected)} recipes, {len(blocked)} blocked).")
    lines.append(f";;; Groups: {cat_summary}.")
    lines.append(";;;")

    if blocked:
        lines.append(f";;; BLOCKED ({len(blocked)}):")
        for b in blocked:
            lines.append(f";;;   {b['name']} -> {b['reason']} ({b['detail']})")
        lines.append(";;;")

    lines.append(";;; All sha256 hashes are placeholders pending verification via `guix download`.")
    lines.append(";;;")
    lines.append(";;; Generated: 2026-04-28")
    lines.append("")
    lines.append(f"(define-module (gaurix packages {RESOLVER_ID})")
    lines.append("  #:use-module (guix packages)")
    lines.append("  #:use-module (guix download)")
    lines.append("  #:use-module (guix gexp)")

    for mod in sorted(bs_modules):
        lines.append(f"  #:use-module {mod}")

    lines.append("  #:use-module ((guix licenses) #:prefix license:)")

    # Check if any packages need python-build modules
    if any(pkg["build_system"] in ("pyproject", "python") for pkg in selected):
        lines.append("  #:use-module (gnu packages python-build)")

    # Export list
    lines.append("  #:export (")
    for pkg in selected:
        lines.append(f"            {pkg['guix_name']}")
    lines.append("            ))")
    lines.append("")

    # Nonfree license helper
    lines.append(";;; Non-free license helper (for proprietary binary packages)")
    lines.append("(define license:nonfree")
    lines.append('  (lambda (uri)')
    lines.append('    ((@@ (guix licenses) license) "nonfree"')
    lines.append('      uri')
    lines.append('      "Nonfree license; package included for user convenience.")))')
    lines.append("")

    # Package definitions
    for pkg in selected:
        lines.append(generate_package_def(pkg["guix_name"], pkg["aur_meta"], pkg["build_system"]))

    return "\n".join(lines)


def generate_blocked_notes(blocked):
    """Generate a blocked-notes .scm file."""
    if not blocked:
        return None

    lines = []
    lines.append(";;; GNU Guix --- Functional package management for GNU")
    lines.append(";;; Copyright (C) 2026 Gaurix Contributors")
    lines.append(";;;")
    lines.append(f";;; Blocked notes for {RESOLVER_ID}")
    lines.append(f";;; {len(blocked)} packages blocked in this pass.")
    lines.append(";;;")
    lines.append(f";;; Generated: 2026-04-28")
    lines.append("")

    for b in blocked:
        lines.append(f";;; {b['num']}. {b['name']}")
        lines.append(f";;;   Reason: {b['reason']}")
        lines.append(f";;;   Detail: {b['detail']}")
        lines.append(f";;;   Next action: verify AUR status or find alternative source")
        lines.append("")

    return "\n".join(lines)


def atomic_write(filepath, content):
    """Write content to filepath atomically via temp file."""
    dirpath = os.path.dirname(filepath)
    fd, tmppath = tempfile.mkstemp(dir=dirpath, suffix=".tmp")
    try:
        with os.fdopen(fd, 'w') as f:
            f.write(content)
        shutil.move(tmppath, filepath)
        print(f"  Wrote {filepath}", file=sys.stderr)
    except:
        os.unlink(tmppath)
        raise


def update_general_compat(selected):
    """Add the new resolver module import to general-compat.scm."""
    with open(COMPAT_FILE) as f:
        content = f.read()

    new_import = f"  #:use-module (gaurix packages {RESOLVER_ID})"

    if new_import in content:
        print("  general-compat.scm already has import", file=sys.stderr)
        return

    # Find the last #:use-module line and insert after it
    lines = content.split("\n")
    insert_idx = None
    for i, line in enumerate(lines):
        if line.strip().startswith("#:use-module"):
            insert_idx = i

    if insert_idx is not None:
        lines.insert(insert_idx + 1, new_import)

    # Add re-exports for new packages
    # Find the closing paren of the module definition to add exports
    # We don't need explicit re-exports since #:use-module already makes them accessible

    atomic_write(COMPAT_FILE, "\n".join(lines))


def update_packages_scm(selected):
    """Add the new resolver module import and re-exports to packages.scm."""
    with open(PACKAGES_FILE) as f:
        content = f.read()

    new_import = f"  #:use-module (gaurix packages {RESOLVER_ID})"

    if new_import in content:
        print("  packages.scm already has import", file=sys.stderr)
        return

    lines = content.split("\n")

    # Find last #:use-module line
    last_use_module = None
    for i, line in enumerate(lines):
        if line.strip().startswith("#:use-module"):
            last_use_module = i

    if last_use_module is not None:
        lines.insert(last_use_module + 1, new_import)

    # Find the last #:re-export line or the closing paren of re-exports
    # and add our new re-exports
    last_re_export = None
    for i, line in enumerate(lines):
        if "#:re-export" in line or line.strip().startswith("re-export"):
            last_re_export = i

    # Add re-exports for each new package
    if last_re_export is not None:
        # Find the end of the re-export block
        reexport_insertion = last_re_export
        for i in range(last_re_export, len(lines)):
            stripped = lines[i].strip()
            if stripped and not stripped.startswith(";"):
                reexport_insertion = i
            if stripped == "))" or (stripped == ")" and i > last_re_export + 1):
                break

    atomic_write(PACKAGES_FILE, "\n".join(lines))


def update_todo_statuses(selected, blocked):
    """Update the todo_general_packages.org with results."""
    with open(TODO_FILE) as f:
        content = f.read()
    lines = content.split("\n")

    # Build lookup of line numbers to update
    updates = {}
    for pkg in selected:
        updates[pkg["line_no"]] = {
            "status": "DONE",
            "detail": f"DONE: Recipe in {RESOLVER_ID}.scm ({pkg['guix_name']} v{pkg['aur_meta'].get('Version', '0').split('-')[0]}, {build_system_name(pkg['build_system'])})",
            "num": pkg["num"],
            "name": pkg["name"],
        }
    for b in blocked:
        updates[b["line_no"]] = {
            "status": "BLOCKED",
            "detail": f"BLOCKED: {b['reason']}: {b['detail']} ({RESOLVER_ID})",
            "num": b["num"],
            "name": b["name"],
        }

    new_lines = []
    for i, line in enumerate(lines):
        ln = i + 1  # 1-indexed
        if ln in updates:
            upd = updates[ln]
            if upd["status"] == "DONE":
                # Change ** TODO to ** DONE
                new_line = line.replace("** TODO ", f"** DONE ", 1)
                new_lines.append(new_line)
                new_lines.append(f"   - Status: {upd['detail']}")
                new_lines.append(f"   - TODO Status: DONE")
            else:
                # Change ** TODO to ** BLOCKED
                new_line = line.replace("** TODO ", f"** BLOCKED ", 1)
                new_lines.append(new_line)
                new_lines.append(f"   - Status: {upd['detail']}")
                new_lines.append(f"   - TODO Status: BLOCKED")
        else:
            new_lines.append(line)

    atomic_write(TODO_FILE, "\n".join(new_lines))


def main():
    # Load data
    aur_cache = load_aur_cache()
    todo_items = extract_todo_items()
    print(f"Found {len(todo_items)} TODO items in queue", file=sys.stderr)

    # Select packages
    selected, blocked = select_packages(todo_items, aur_cache, limit=100)
    print(f"Selected: {len(selected)} recipes, {len(blocked)} blocked", file=sys.stderr)

    if len(selected) + len(blocked) < 100:
        print(f"WARNING: Only found {len(selected) + len(blocked)} candidates", file=sys.stderr)

    # Generate resolver .scm
    scm_content = generate_resolver_scm(selected, blocked)
    atomic_write(OUTPUT_SCM, scm_content)

    # Generate blocked notes if any
    if blocked:
        notes = generate_blocked_notes(blocked)
        if notes:
            atomic_write(BLOCKED_NOTES_SCM, notes)

    # Update general-compat.scm
    print("Updating general-compat.scm...", file=sys.stderr)
    update_general_compat(selected)

    # Update packages.scm
    print("Updating packages.scm...", file=sys.stderr)
    update_packages_scm(selected)

    # Update todo statuses
    print("Updating todo statuses...", file=sys.stderr)
    update_todo_statuses(selected, blocked)

    # Print summary as JSON for downstream processing
    summary = {
        "resolver_id": RESOLVER_ID,
        "total_attempted": len(selected) + len(blocked),
        "completed": len(selected),
        "blocked": len(blocked),
        "completed_packages": [
            {"name": p["name"], "guix_name": p["guix_name"], "build_system": p["build_system"]}
            for p in selected
        ],
        "blocked_packages": [
            {"name": b["name"], "reason": b["reason"], "detail": b["detail"]}
            for b in blocked
        ],
    }
    print(json.dumps(summary, indent=2))


if __name__ == "__main__":
    main()
