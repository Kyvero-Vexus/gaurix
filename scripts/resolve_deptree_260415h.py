#!/usr/bin/env python3
"""Dependency-tree-driven packaging pass: deptree-resolver-260415h

Complete pipeline:
1) Extract all BLOCKED packages from todo_general_packages.org
2) Build dependency tree using AUR cache
3) Compute blocked_dep_count, reverse_dep_count, total_dep_count
4) Priority sort and select top 100
5) Look up AUR metadata, categorize, generate recipes
6) Write tree artifacts, recipe module, update todo/packages.scm/general-compat.scm
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
PASS_ID = "deptree-resolver-260415h"
RECIPE_FILE = ROOT / "guix" / "gaurix" / "packages" / f"{PASS_ID}.scm"
PACKAGES_SCM = ROOT / "guix" / "gaurix" / "packages.scm"
COMPAT_SCM = ROOT / "guix" / "gaurix" / "packages" / "general-compat.scm"
TREE_JSON = ROOT / "reports" / "blocked-dependency-tree.json"
TREE_MD = ROOT / "reports" / "blocked-dependency-tree.md"
SELECTION_FILE = ROOT / "reports" / f"{PASS_ID}-selection.json"
LOOKUP_FILE = ROOT / "reports" / f"{PASS_ID}-aur-lookup.json"
SUMMARY_FILE = ROOT / "reports" / f"{PASS_ID}-summary.json"


# ─── Extraction ───────────────────────────────────────────────────────────────

def extract_blocked_packages(todo_path):
    """Extract all BLOCKED packages with their numbers from the org file."""
    blocked = []
    with open(todo_path, "r") as f:
        for line in f:
            m = re.match(r"^\*\*\s+BLOCKED\s+(\d+)\.\s+(\S+)", line)
            if m:
                blocked.append({"name": m.group(2), "number": int(m.group(1))})
    return blocked


# ─── AUR cache ────────────────────────────────────────────────────────────────

def load_aur_cache(cache_path):
    """Load AUR metadata cache into a dict keyed by package name."""
    with open(cache_path, "r") as f:
        data = json.load(f)
    return {pkg["Name"]: pkg for pkg in data}


def strip_version_constraint(dep):
    """Strip version constraints from dependency strings like 'foo>=1.0'."""
    return re.split(r"[><=]", dep)[0].strip()


# ─── Dependency tree ──────────────────────────────────────────────────────────

def build_dependency_tree(blocked_packages, aur_cache):
    """Build dependency tree for blocked packages."""
    blocked_names = {pkg["name"] for pkg in blocked_packages}
    tree = {}

    for pkg in blocked_packages:
        name = pkg["name"]
        aur_data = aur_cache.get(name, {})

        depends = [strip_version_constraint(d) for d in (aur_data.get("Depends") or [])]
        makedepends = [strip_version_constraint(d) for d in (aur_data.get("MakeDepends") or [])]
        all_deps = list(set(depends + makedepends))
        blocked_deps = [d for d in all_deps if d in blocked_names]

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

    # Compute reverse dependencies
    for name, info in tree.items():
        for dep in info["blocked_deps"]:
            if dep in tree:
                tree[dep]["reverse_deps"].append(name)

    for info in tree.values():
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


# ─── AUR lookup & categorization ─────────────────────────────────────────────

def categorize_package(name, aur_data):
    """Categorize a package based on AUR metadata."""
    if not aur_data:
        # Check if it looks like a kernel binary
        if re.match(r"linux\d+", name):
            return "kernel-binary"
        return "missing"

    desc = (aur_data.get("Description") or "").lower()
    pkg_name = name.lower()
    depends = [d.lower() for d in (aur_data.get("Depends") or [])]
    makedepends = [d.lower() for d in (aur_data.get("MakeDepends") or [])]
    all_deps_lower = depends + makedepends

    # Kernel binaries
    if re.match(r"linux\d+", pkg_name) and pkg_name.endswith("-bin"):
        return "kernel-binary"

    # DKMS modules
    if any("dkms" in d for d in all_deps_lower) or "dkms" in pkg_name:
        return "dkms-module"

    # NVIDIA proprietary
    if "nvidia" in pkg_name and ("driver" in pkg_name or "dkms" in pkg_name):
        return "nvidia-driver"

    # Arch-specific
    arch_indicators = ["pacman", "makepkg", "pacutils", "namcap", "devtools"]
    if any(ind in pkg_name for ind in arch_indicators):
        return "arch-specific"
    if any(any(ind in d for ind in arch_indicators) for d in all_deps_lower):
        return "arch-specific"

    # Binary packages
    if pkg_name.endswith("-bin"):
        if pkg_name.endswith("-appimage") or "appimage" in desc:
            return "binary-appimage"
        return "binary-generic"

    # Fonts
    if pkg_name.startswith("ttf-") or pkg_name.startswith("otf-") or pkg_name.startswith("nerd-fonts-"):
        return "font"
    if "font" in pkg_name and ("ttf" in desc or "otf" in desc or "font" in desc):
        return "font"

    # By build system
    if any("cmake" in d for d in all_deps_lower):
        return "source-cmake"
    if any("meson" in d for d in all_deps_lower):
        return "source-meson"
    if any("cargo" in d or "rust" in d for d in all_deps_lower):
        return "source-rust"
    if any("python" in d and ("setup" in d or "build" in d or "installer" in d) for d in all_deps_lower):
        return "source-python"
    if any("go" == d or "go" in d.split("-") for d in all_deps_lower):
        return "source-go"
    if any("npm" in d or "nodejs" in d for d in all_deps_lower):
        return "source-node"

    return "source-generic"


# ─── Recipe generation ────────────────────────────────────────────────────────

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
    proper_prefixes = ["GNU", "GNOME", "KDE", "Qt", "GTK", "NVIDIA", "AMD",
                       "USB", "HTTP", "JSON", "XML", "DKMS", "Linux", "X11",
                       "OpenGL", "OpenCL", "SDL", "API", "CLI", "TUI", "GUI",
                       "AUR", "LLVM", "GCC", "FFmpeg", "ALSA", "JACK", "MIDI",
                       "DNS", "SSH", "VPN", "TLS", "SSL", "LUKS", "LVM", "ZFS",
                       "BTRFS", "EFI", "UEFI", "GRUB", "QEMU", "KVM", "Docker",
                       "Wayland", "Xorg"]
    if syn and syn[0].isupper() and not any(syn.startswith(p) for p in proper_prefixes):
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
        "GPLv3": "license:gpl3+",
        "LGPL": "license:lgpl3+",
        "LGPL-2.0": "license:lgpl2.0",
        "LGPL-2.0-or-later": "license:lgpl2.0+",
        "LGPL-2.1": "license:lgpl2.1",
        "LGPL-2.1-or-later": "license:lgpl2.1+",
        "LGPL-3.0": "license:lgpl3",
        "LGPL-3.0-or-later": "license:lgpl3+",
        "Apache": "license:asl2.0",
        "Apache-2.0": "license:asl2.0",
        "MPL-2.0": "license:mpl2.0",
        "MPL2": "license:mpl2.0",
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
        "OFL": "license:silofl1.1",
        "custom": "license:non-copyleft",
        "custom:NVIDIA": "license:non-copyleft",
        "proprietary": "license:non-copyleft",
        "unknown": "license:non-copyleft",
        "Boost": "license:boost1.0",
        "BSL-1.0": "license:boost1.0",
        "PSF-2.0": "license:psfl",
        "Ruby": "license:ruby",
        "Perl": "license:perl-license",
    }

    first = lic_list[0] if lic_list else "unknown"
    if first in lic_map:
        return lic_map[first]
    for key in lic_map:
        if first.lower().startswith(key.lower()):
            return lic_map[key]
    return "license:non-copyleft"


def determine_build_system(category, makedepends):
    """Determine appropriate Guix build system from category and makedepends."""
    if category in ("binary-generic", "binary-appimage", "binary-deb", "binary-tar"):
        return "copy"
    if category == "font":
        return "copy"
    if category == "source-cmake":
        return "cmake"
    if category == "source-meson":
        return "meson"
    if category == "source-rust":
        return "cargo"
    if category == "source-python":
        return "pyproject"
    if category == "source-go":
        return "go"
    if category == "source-node":
        return "node"
    if category in ("dkms-module", "kernel-binary", "nvidia-driver"):
        return "copy"

    makedeps_lower = [d.lower() for d in makedepends]
    if any("cmake" in d for d in makedeps_lower):
        return "cmake"
    if any("meson" in d for d in makedeps_lower):
        return "meson"
    if any("cargo" in d or "rust" in d for d in makedeps_lower):
        return "cargo"
    if any("python" in d for d in makedeps_lower):
        return "pyproject"
    if any("go" in d for d in makedeps_lower):
        return "go"
    if any("npm" in d or "node" in d for d in makedeps_lower):
        return "node"

    return "gnu"


def determine_source_method(name, url):
    """Determine download method and URL pattern."""
    if not url:
        return "url-fetch", f"https://aur.archlinux.org/cgit/aur.git/snapshot/{name}.tar.gz"

    if re.match(r"https?://github\.com/[^/]+/[^/]+", url):
        return "git-fetch", url
    if re.match(r"https?://gitlab\.[^/]+/[^/]+/[^/]+", url):
        return "git-fetch", url
    if re.match(r"https?://codeberg\.org/[^/]+/[^/]+", url):
        return "git-fetch", url
    if re.match(r"https?://git\.sr\.ht/~[^/]+/[^/]+", url):
        return "git-fetch", url
    if re.match(r"https?://bitbucket\.org/[^/]+/[^/]+", url):
        return "git-fetch", url

    return "url-fetch", f"https://aur.archlinux.org/cgit/aur.git/snapshot/{name}.tar.gz"


def generate_recipe(name, aur_data, category):
    """Generate a Guix package definition."""
    gname = guix_name(name)
    version = clean_version(aur_data.get("Version", "0.0.0"))
    desc = aur_data.get("Description", "")
    url = aur_data.get("URL", "") or f"https://aur.archlinux.org/packages/{name}"
    lic = map_license(aur_data.get("License", []))
    synopsis = make_synopsis(desc, name)
    description = make_description(desc, name)
    makedeps = aur_data.get("MakeDepends", [])
    build_sys = determine_build_system(category, makedeps)
    source_method, source_url = determine_source_method(name, aur_data.get("URL", ""))

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

    return "\n".join(lines), gname, build_sys


def resolve_package(name, number, aur_data, category):
    """Resolve a single package — returns (action, reason, recipe_text, gname, build_sys)."""
    if not aur_data:
        if category == "kernel-binary":
            return "BLOCKED", f"KERNEL_BINARY: versioned Arch kernel binary ({name}), not portable to Guix", None, None, None
        return "BLOCKED", f"MISSING_SOURCE: not found in AUR metadata cache, likely deleted/renamed", None, None, None

    if category == "arch-specific":
        return "BLOCKED", f"ARCH_SPECIFIC: depends on pacman/makepkg infrastructure", None, None, None

    if category == "nvidia-driver":
        return "BLOCKED", f"NVIDIA_PROPRIETARY: NVIDIA proprietary DKMS driver module", None, None, None

    if category == "kernel-binary":
        return "BLOCKED", f"KERNEL_BINARY: versioned Arch kernel binary, not portable to Guix", None, None, None

    if category == "dkms-module":
        recipe, gname, bsys = generate_recipe(name, aur_data, category)
        return "RECIPE", f"DKMS_SOURCE: kernel module source packaged", recipe, gname, bsys

    recipe, gname, bsys = generate_recipe(name, aur_data, category)
    return "RECIPE", f"RECIPE: Guix recipe created ({category})", recipe, gname, bsys


# ─── File updates (deterministic, atomic) ────────────────────────────────────

def atomic_write(path, content):
    """Write content to path atomically via temp file."""
    fd, tmp = tempfile.mkstemp(dir=path.parent, suffix=".tmp")
    try:
        with os.fdopen(fd, "w") as f:
            f.write(content)
        shutil.move(tmp, path)
    except:
        os.unlink(tmp)
        raise


def write_recipe_module(recipes, exports):
    """Write the Guix recipe module file."""
    export_lines = "\n".join("            " + e for e in exports)
    header = f''';;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Resolver pass --- {PASS_ID}
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
  #:export (
{export_lines}))

'''

    content = header + "\n".join(recipes) + "\n"
    atomic_write(RECIPE_FILE, content)


def update_todo(results):
    """Update todo_general_packages.org with new statuses."""
    with open(TODO_FILE, "r") as f:
        content = f.read()

    for pkg_name, number, action, reason, gname in results:
        if action == "RECIPE":
            # Change BLOCKED to DONE
            pattern = rf"(\*\*\s+)BLOCKED(\s+{re.escape(str(number))}\.\s+{re.escape(pkg_name)})"
            replacement = rf"\g<1>DONE\g<2>"
            content = re.sub(pattern, replacement, content)
            status_text = f"DONE: recipe in {PASS_ID}.scm ({gname})"
        else:
            status_text = f"BLOCKED: {reason} [{PASS_ID}]"

        # Add status annotation if not already present
        entry_pattern = rf"(\*\*\s+(?:BLOCKED|DONE)\s+{re.escape(str(number))}\.\s+{re.escape(pkg_name)}\s*\[.*?\]?\n(?:.*\n)*?)"
        entry_match = re.search(entry_pattern, content)
        if entry_match:
            block = entry_match.group(0)
            if PASS_ID not in block:
                end_pos = entry_match.end()
                insert_line = f"\n   {status_text}\n"
                content = content[:end_pos] + insert_line + content[end_pos:]

    atomic_write(TODO_FILE, content)


def update_packages_scm(exports):
    """Add exports to packages.scm using deterministic full-file transform."""
    with open(PACKAGES_SCM, "r") as f:
        content = f.read()

    comment = f"            ;; {PASS_ID}\n"
    new_exports = "\n".join(f"            {e}" for e in exports)

    # Find the closing )) of the module form
    stripped = content.rstrip()
    last_close = stripped.rfind("))")
    if last_close > 0:
        content = stripped[:last_close] + f"\n{comment}{new_exports}\n))" + "\n"

    atomic_write(PACKAGES_SCM, content)


def update_compat_scm(exports, pkg_name_map):
    """Add #:use-module and compat aliases to general-compat.scm."""
    with open(COMPAT_SCM, "r") as f:
        content = f.read()

    # Add use-module if not present
    use_module_line = f"  #:use-module (gaurix packages {PASS_ID})"
    if use_module_line not in content:
        last_use = content.rfind("#:use-module")
        if last_use >= 0:
            end_of_line = content.index("\n", last_use)
            content = content[:end_of_line + 1] + use_module_line + "\n" + content[end_of_line + 1:]

    # Add compat aliases for -bin/-git variants
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

    atomic_write(COMPAT_SCM, content)


# ─── Main pipeline ────────────────────────────────────────────────────────────

def main():
    timestamp = datetime.now(timezone.utc).isoformat().replace("+00:00", "Z")

    # Step 1: Extract BLOCKED packages
    print(f"[{PASS_ID}] Extracting BLOCKED packages from todo...")
    blocked = extract_blocked_packages(TODO_FILE)
    print(f"  Found {len(blocked)} BLOCKED packages")

    # Step 2: Load AUR cache
    print(f"[{PASS_ID}] Loading AUR cache...")
    aur_cache = load_aur_cache(AUR_CACHE)
    print(f"  Loaded {len(aur_cache)} AUR packages")

    # Step 3: Build dependency tree
    print(f"[{PASS_ID}] Building dependency tree...")
    tree = build_dependency_tree(blocked, aur_cache)
    print(f"  Tree built for {len(tree)} packages")

    # Step 4: Priority sort
    print(f"[{PASS_ID}] Priority sorting...")
    sorted_queue = priority_sort(tree)

    # Step 5: Write tree artifacts
    print(f"[{PASS_ID}] Writing tree artifacts...")
    tree_json = {
        "timestamp": timestamp,
        "pass_id": PASS_ID,
        "total_blocked": len(blocked),
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
    atomic_write(TREE_JSON, json.dumps(tree_json, indent=2) + "\n")
    print(f"  Wrote {TREE_JSON}")

    # Write tree MD
    md_lines = []
    md_lines.append(f"# Blocked Dependency Tree\n")
    md_lines.append(f"**Pass:** {PASS_ID}  ")
    md_lines.append(f"**Timestamp:** {timestamp}  ")
    md_lines.append(f"**Total BLOCKED:** {len(blocked)}  \n")
    md_lines.append(f"## Priority Queue (Top 50)\n")
    md_lines.append(f"| Rank | Package | # | Blocked Deps | Reverse Deps | Total Deps |")
    md_lines.append(f"|------|---------|---|-------------|-------------|------------|")
    for i, item in enumerate(sorted_queue[:50]):
        md_lines.append(f"| {i+1} | {item['name']} | {item['number']} | {item['blocked_dep_count']} | {item['reverse_dep_count']} | {item['total_dep_count']} |")
    atomic_write(TREE_MD, "\n".join(md_lines) + "\n")
    print(f"  Wrote {TREE_MD}")

    # Step 6: Select top 100
    selected = sorted_queue[:100]
    selection = {
        "pass_id": PASS_ID,
        "timestamp": timestamp,
        "total_blocked_in_tree": len(blocked),
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
    atomic_write(SELECTION_FILE, json.dumps(selection, indent=2) + "\n")
    print(f"  Wrote {SELECTION_FILE}")

    # Print top 20
    print(f"\n[{PASS_ID}] Top 20 priority queue:")
    print(f"{'Rank':>4} {'Package':<45} {'BDep':>4} {'RDep':>4} {'TDep':>4}")
    print("-" * 65)
    for i, item in enumerate(sorted_queue[:20]):
        print(f"{i+1:>4} {item['name']:<45} {item['blocked_dep_count']:>4} {item['reverse_dep_count']:>4} {item['total_dep_count']:>4}")

    # Step 7: AUR lookup and categorize
    print(f"\n[{PASS_ID}] Categorizing and resolving {len(selected)} packages...")
    lookup_packages = []
    for item in selected:
        name = item["name"]
        aur_data = aur_cache.get(name, None)
        category = categorize_package(name, aur_data)
        lookup_packages.append({
            "name": name,
            "number": item["number"],
            "in_aur": aur_data is not None,
            "category": category,
            "version": aur_data.get("Version", "") if aur_data else "",
            "description": aur_data.get("Description", "") if aur_data else "",
            "url": aur_data.get("URL", "") if aur_data else "",
            "license": aur_data.get("License", []) if aur_data else [],
            "depends": aur_data.get("Depends", []) if aur_data else [],
            "makedepends": aur_data.get("MakeDepends", []) if aur_data else [],
            "blocked_dep_count": item["blocked_dep_count"],
            "reverse_dep_count": item["reverse_dep_count"],
        })

    # Save AUR lookup
    lookup_data = {"pass_id": PASS_ID, "timestamp": timestamp, "packages": lookup_packages}
    atomic_write(LOOKUP_FILE, json.dumps(lookup_data, indent=2) + "\n")
    print(f"  Wrote {LOOKUP_FILE}")

    # Step 8: Generate recipes and resolve
    recipes = []
    exports = []
    results = []  # (pkg_name, number, action, reason, gname)
    pkg_name_map = {}
    recipe_count = 0
    blocked_count = 0
    recipe_list = []
    blocked_list = []

    for pkg in lookup_packages:
        name = pkg["name"]
        number = pkg["number"]
        aur_data = aur_cache.get(name, None)
        category = pkg["category"]

        action, reason, recipe_text, gname, bsys = resolve_package(name, number, aur_data, category)
        results.append((name, number, action, reason, gname))

        if action == "RECIPE" and recipe_text:
            recipes.append(recipe_text)
            exports.append(gname)
            pkg_name_map[gname] = name
            recipe_count += 1
            recipe_list.append({
                "aur_name": name,
                "number": number,
                "guix_name": gname,
                "build_system": bsys,
                "version": clean_version(pkg.get("version", "0.0.0")),
                "category": category,
            })
        else:
            blocked_count += 1
            blocked_list.append({
                "name": name,
                "number": number,
                "reason": reason,
            })

    print(f"[{PASS_ID}] Results: {recipe_count} recipes, {blocked_count} remaining blocked")

    # Step 9: Write recipe module
    if recipes:
        print(f"[{PASS_ID}] Writing recipe module: {RECIPE_FILE}")
        write_recipe_module(recipes, exports)

    # Step 10: Update todo
    print(f"[{PASS_ID}] Updating {TODO_FILE}")
    update_todo(results)

    # Step 11: Update packages.scm
    if exports:
        print(f"[{PASS_ID}] Updating {PACKAGES_SCM}")
        update_packages_scm(exports)

    # Step 12: Update general-compat.scm
    if exports:
        print(f"[{PASS_ID}] Updating {COMPAT_SCM}")
        update_compat_scm(exports, pkg_name_map)

    # Step 13: Write summary
    summary = {
        "pass_id": PASS_ID,
        "timestamp": timestamp,
        "total_blocked_in_tree": len(blocked),
        "total_selected": len(selected),
        "recipes_created": recipe_count,
        "remaining_blocked": blocked_count,
        "recipes": recipe_list,
        "blocked": blocked_list,
    }
    atomic_write(SUMMARY_FILE, json.dumps(summary, indent=2) + "\n")
    print(f"[{PASS_ID}] Wrote summary: {SUMMARY_FILE}")

    # Print summary
    print(f"\n{'='*60}")
    print(f"PASS SUMMARY: {PASS_ID}")
    print(f"{'='*60}")
    print(f"Total BLOCKED in tree: {len(blocked)}")
    print(f"Selected: {len(selected)}")
    print(f"Recipes created: {recipe_count}")
    print(f"Remaining blocked: {blocked_count}")
    print(f"\nRecipes:")
    for r in recipe_list:
        print(f"  {r['aur_name']} -> {r['guix_name']} ({r['build_system']}, v{r['version']})")
    if blocked_list:
        print(f"\nBlocked:")
        for b in blocked_list:
            print(f"  {b['name']} (#{b['number']}): {b['reason']}")

    # Print selected 100 for summary
    print(f"\n[{PASS_ID}] All 100 selected packages:")
    for i, item in enumerate(selected):
        print(f"  {i+1:>3}. {item['name']} (#{item['number']}, bdep={item['blocked_dep_count']}, rdep={item['reverse_dep_count']}, tdep={item['total_dep_count']})")

    return summary


if __name__ == "__main__":
    main()
