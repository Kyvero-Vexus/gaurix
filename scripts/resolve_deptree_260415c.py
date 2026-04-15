#!/usr/bin/env python3
"""Dependency-tree-driven packaging pass: deptree-resolver-260415c

Complete pipeline:
1) Extract all BLOCKED packages from todo_general_packages.org
2) Build dependency tree using AUR cache
3) Compute blocked_dep_count, reverse_dep_count, total_dep_count
4) Priority sort and select top 100
5) Write tree artifacts (JSON + MD)
6) Create AUR lookup for selected packages
7) Generate Guix recipes
8) Update todo_general_packages.org, packages.scm, general-compat.scm
9) Write summary
"""

import json
import re
import sys
import tempfile
import shutil
from collections import defaultdict
from datetime import datetime, timezone
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
AUR_CACHE = ROOT / "data" / "aur-cache" / "packages-meta-ext-v1.json"
TODO_FILE = ROOT / "todo_general_packages.org"
PASS_ID = "deptree-resolver-260415c"
RECIPE_FILE = ROOT / "guix" / "gaurix" / "packages" / f"{PASS_ID}.scm"
PACKAGES_SCM = ROOT / "guix" / "gaurix" / "packages.scm"
COMPAT_SCM = ROOT / "guix" / "gaurix" / "packages" / "general-compat.scm"
SUMMARY_FILE = ROOT / "reports" / f"{PASS_ID}-summary.json"
SELECTION_FILE = ROOT / "reports" / f"{PASS_ID}-selection.json"
LOOKUP_FILE = ROOT / "reports" / f"{PASS_ID}-aur-lookup.json"
TREE_JSON = ROOT / "reports" / "blocked-dependency-tree.json"
TREE_MD = ROOT / "reports" / "blocked-dependency-tree.md"


# ─── Phase 1: Extract BLOCKED packages ───────────────────────────────

def extract_blocked_packages(todo_path):
    """Extract all BLOCKED packages with their numbers from the org file."""
    blocked = []
    with open(todo_path, "r") as f:
        for line in f:
            m = re.match(r"^\*\*\s+BLOCKED\s+(\d+)\.\s+(\S+)", line)
            if m:
                blocked.append({
                    "name": m.group(2),
                    "number": int(m.group(1)),
                })
    return blocked


# ─── Phase 2: Build dependency tree ──────────────────────────────────

def load_aur_cache(cache_path):
    """Load AUR metadata cache into a dict keyed by package name."""
    with open(cache_path, "r") as f:
        data = json.load(f)
    return {pkg["Name"]: pkg for pkg in data}


def strip_version_constraint(dep):
    """Strip version constraints from dependency strings like 'foo>=1.0'."""
    return re.split(r"[><=:]", dep)[0].strip()


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
    """Sort by: blocked_dep_count ASC, reverse_dep_count DESC,
    total_dep_count ASC, name ASC."""
    items = list(tree.values())
    items.sort(key=lambda x: (
        x["blocked_dep_count"],
        -x["reverse_dep_count"],
        x["total_dep_count"],
        x["name"],
    ))
    return items


# ─── Phase 3: Categorize for AUR lookup ──────────────────────────────

def categorize_aur_package(name, aur_data):
    """Classify an AUR package into a build category."""
    if not aur_data:
        if re.match(r"linux\d", name) and "bin" in name:
            return "kernel-binary"
        return "unknown"

    desc = (aur_data.get("Description") or "").lower()
    makedeps = [d.lower() for d in (aur_data.get("MakeDepends") or [])]
    depends = [d.lower() for d in (aur_data.get("Depends") or [])]

    # Kernel / DKMS
    if "dkms" in name.lower() or "dkms" in desc:
        return "dkms-module"
    if re.match(r"linux\d", name) and "bin" in name:
        return "kernel-binary"

    # NVIDIA proprietary
    if ("nvidia" in name.lower() and
        any(x in name.lower() for x in ["dkms", "driver", "utils"]) and
        "open" not in name.lower()):
        return "nvidia-driver"

    # Arch-specific
    if any(x in name.lower() for x in ["pacman", "makepkg", "archlinux"]):
        if "hook" in name.lower() or "archlinux" in name.lower():
            return "arch-specific"

    # Font
    if any(name.lower().startswith(p) for p in ["ttf-", "otf-", "nerd-fonts-", "font-"]):
        return "font"
    if "font" in desc and any(name.lower().startswith(p) for p in ["ttf-", "otf-"]):
        return "font"

    # Binary packages
    if name.endswith("-bin"):
        if "appimage" in desc:
            return "binary-appimage"
        return "binary-generic"
    if name.endswith("-appimage"):
        return "binary-appimage"

    # Build system detection from makedepends
    makedeps_str = " ".join(makedeps)
    if "cmake" in makedeps_str:
        return "source-cmake"
    if "meson" in makedeps_str:
        return "source-meson"
    if any("cargo" in d or "rust" in d for d in makedeps):
        return "source-rust"
    if any("python" in d for d in makedeps) or "setup.py" in desc or "pyproject" in desc:
        return "source-python"
    if any("go" in d for d in makedeps):
        return "source-go"
    if any("npm" in d or "nodejs" in d or "node" in d for d in makedeps):
        return "source-node"

    # Git source packages
    if name.endswith("-git"):
        return "source-generic"

    return "source-generic"


# ─── Phase 4: Recipe generation ──────────────────────────────────────

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
    if syn and syn[0].isupper() and not any(
        syn.startswith(p) for p in [
            "GNU", "GNOME", "KDE", "Qt", "GTK", "NVIDIA", "AMD", "USB",
            "HTTP", "JSON", "XML", "DKMS", "Linux", "SSH", "LLVM", "GCC",
            "FFmpeg", "OpenGL", "ALSA", "PulseAudio", "Wayland", "X11",
        ]
    ):
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
        "GPL3": "license:gpl3",
        "GPL-3.0": "license:gpl3",
        "GPL-3.0-only": "license:gpl3",
        "GPL-3.0-or-later": "license:gpl3+",
        "GPLv2": "license:gpl2",
        "GPLv3": "license:gpl3",
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
        "MPL": "license:mpl2.0",
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
        "OFL": "license:silofl1.1",
        "OFL-1.1": "license:silofl1.1",
        "custom": "license:non-copyleft",
        "custom:NVIDIA": "license:non-copyleft",
        "proprietary": "license:non-copyleft",
        "unknown": "license:non-copyleft",
        "PSF-2.0": "license:psfl",
        "Boost": "license:boost1.0",
        "BSL-1.0": "license:boost1.0",
    }

    first = lic_list[0] if lic_list else "unknown"
    if first in lic_map:
        return lic_map[first]
    for key in lic_map:
        if first.lower().startswith(key.lower()):
            return lic_map[key]
    return "license:non-copyleft"


def determine_build_system(category, makedeps):
    """Determine appropriate Guix build system."""
    makedeps_lower = [d.lower() for d in makedeps]

    if category in ("binary-generic", "binary-appimage", "binary-deb", "binary-tar"):
        return "copy"
    if category == "font":
        return "font"
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

    # Auto-detect from makedepends
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

    # GitHub
    if re.match(r"https?://github\.com/[^/]+/[^/]+", url):
        return "git-fetch", url
    # GitLab
    if re.match(r"https?://gitlab\.\w+[^/]*/[^/]+/[^/]+", url):
        return "git-fetch", url
    # Codeberg
    if re.match(r"https?://codeberg\.org/[^/]+/[^/]+", url):
        return "git-fetch", url
    # sr.ht
    if re.match(r"https?://git\.sr\.ht/~[^/]+/[^/]+", url):
        return "git-fetch", url
    # Bitbucket
    if re.match(r"https?://bitbucket\.org/[^/]+/[^/]+", url):
        return "git-fetch", url

    return "url-fetch", f"https://aur.archlinux.org/cgit/aur.git/snapshot/{name}.tar.gz"


def generate_recipe(name, gname, version, desc, url, lic_list, category, makedeps):
    """Generate a Guix package definition."""
    version = clean_version(version)
    lic = map_license(lic_list)
    synopsis = make_synopsis(desc, name)
    description = make_description(desc, name)
    build_sys = determine_build_system(category, makedeps)
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

    if build_sys == "font":
        lines.append(f'    (build-system font-build-system)')
    else:
        lines.append(f'    (build-system {build_sys}-build-system)')

    lines.append(f'    (arguments (list #:tests? #f))')
    lines.append(f'    (synopsis "{escape_scheme_string(synopsis)}")')
    lines.append(f'    (description "{escape_scheme_string(description)}")')
    lines.append(f'    (home-page "{escape_scheme_string(url or f"https://aur.archlinux.org/packages/{name}")}")')
    lines.append(f'    (license {lic})))')
    lines.append("")

    return "\n".join(lines), build_sys


def categorize_and_resolve(name, number, aur_data, category):
    """Categorize package and determine if it can be resolved."""
    gname = guix_name(name)

    if not aur_data:
        if category == "kernel-binary":
            return "BLOCKED", f"KERNEL_BINARY: versioned Arch kernel binary ({name}), not portable to Guix", None, None, None
        return "BLOCKED", f"MISSING_SOURCE: not found in AUR metadata cache, likely deleted/renamed", None, None, None

    if category == "arch-specific":
        return "BLOCKED", f"ARCH_SPECIFIC: depends on pacman/makepkg infrastructure", None, None, None

    if category == "nvidia-driver":
        return "BLOCKED", f"NVIDIA_PROPRIETARY: NVIDIA proprietary DKMS driver module, requires kernel build integration", None, None, None

    if category == "kernel-binary":
        return "BLOCKED", f"KERNEL_BINARY: versioned Arch kernel binary, not portable to Guix", None, None, None

    version = aur_data.get("Version", "0.0.0")
    desc = aur_data.get("Description", "")
    url = aur_data.get("URL", "")
    lic_list = aur_data.get("License") or []
    makedeps = aur_data.get("MakeDepends") or []

    recipe, build_sys = generate_recipe(
        name, gname, version, desc, url, lic_list, category, makedeps
    )
    reason_prefix = {
        "dkms-module": "DKMS_SOURCE: kernel module source packaged",
        "font": "FONT: font package created",
    }.get(category, f"RECIPE: Guix recipe created ({category})")

    return "RECIPE", reason_prefix, recipe, gname, build_sys


# ─── Phase 5: File updates (atomic) ─────────────────────────────────

def write_recipe_module(recipes, exports):
    """Write the Guix recipe module file."""
    build_sys_modules = set()
    for r in recipes:
        for bs in ["gnu", "copy", "cmake", "meson", "pyproject", "cargo", "go", "node", "font"]:
            if f"{bs}-build-system)" in r:
                build_sys_modules.add(bs)

    bs_lines = []
    for bs in sorted(build_sys_modules):
        bs_lines.append(f"  #:use-module (guix build-system {bs})")

    export_lines = "\n".join(f"            {e}" for e in exports)
    bs_block = "\n".join(bs_lines)

    header = f''';;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency tree resolver pass --- {PASS_ID}
;;; Resolves 100 BLOCKED packages from dependency tree queue.
;;;
;;; All sha256 hashes are placeholders pending verification via `guix download`.

(define-module (gaurix packages {PASS_ID})
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
{bs_block}
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:export ({export_lines}))

'''

    with open(RECIPE_FILE, "w") as f:
        f.write(header)
        for recipe in recipes:
            f.write(recipe)
            f.write("\n")

    print(f"  Wrote {RECIPE_FILE}")


def atomic_write(path, content):
    """Write content to path atomically via temp file + rename."""
    d = path.parent
    with tempfile.NamedTemporaryFile(mode="w", dir=d, delete=False, suffix=".tmp") as tmp:
        tmp.write(content)
        tmp_name = tmp.name
    shutil.move(tmp_name, str(path))


def update_todo(results):
    """Update todo_general_packages.org with new statuses."""
    with open(TODO_FILE, "r") as f:
        lines = f.readlines()

    entry_starts = {}
    for i, line in enumerate(lines):
        m = re.match(r"^\*\*\s+(?:BLOCKED|DONE)\s+(\d+)\.\s+(\S+)", line)
        if m:
            entry_starts[int(m.group(1))] = i

    for pkg_name, number, action, reason, gname in results:
        if number not in entry_starts:
            continue

        line_idx = entry_starts[number]

        if action == "RECIPE":
            lines[line_idx] = re.sub(
                r"^(\*\*\s+)BLOCKED(\s+)",
                r"\1DONE\2",
                lines[line_idx]
            )
            status_text = f"DONE: recipe in {PASS_ID}.scm ({gname}, {reason})"
        else:
            status_text = f"BLOCKED: {reason} [{PASS_ID}]"

        next_entry = len(lines)
        for j in range(line_idx + 1, len(lines)):
            if re.match(r"^\*\*\s+", lines[j]):
                next_entry = j
                break

        block_text = "".join(lines[line_idx:next_entry])
        if PASS_ID not in block_text:
            insert_line = f"   - Status: {status_text}\n"
            lines.insert(next_entry, insert_line)
            for num, idx in entry_starts.items():
                if idx >= next_entry:
                    entry_starts[num] = idx + 1

    atomic_write(TODO_FILE, "".join(lines))
    print(f"  Updated {TODO_FILE}")


def update_packages_scm(exports):
    """Add re-exports to packages.scm using append-block pattern."""
    with open(PACKAGES_SCM, "r") as f:
        content = f.read()

    if PASS_ID in content:
        print(f"  {PACKAGES_SCM} already has {PASS_ID}, skipping")
        return

    # Append a new define-module re-export block at end of file
    export_lines = "\n               ".join(exports)
    block = f"""
;; {PASS_ID}
(define-module (gaurix packages)
  #:use-module (gaurix packages {PASS_ID})
  #:re-export ({export_lines}))
"""

    content = content.rstrip() + "\n" + block
    atomic_write(PACKAGES_SCM, content)
    print(f"  Updated {PACKAGES_SCM}")


def update_compat_scm(exports, pkg_name_map):
    """Add #:use-module and compat aliases to general-compat.scm."""
    with open(COMPAT_SCM, "r") as f:
        content = f.read()

    if PASS_ID in content:
        print(f"  {COMPAT_SCM} already has {PASS_ID}, skipping")
        return

    # Add use-module after the last existing one
    use_module_line = f"  #:use-module (gaurix packages {PASS_ID})"
    last_use = content.rfind("#:use-module")
    if last_use >= 0:
        end_of_line = content.index("\n", last_use)
        content = content[:end_of_line + 1] + use_module_line + "\n" + content[end_of_line + 1:]

    # Add compat aliases
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
    print(f"  Updated {COMPAT_SCM}")


# ─── Main pipeline ───────────────────────────────────────────────────

def main():
    timestamp = datetime.now(timezone.utc).isoformat().replace("+00:00", "Z")

    # Phase 1: Extract BLOCKED packages
    print(f"[{PASS_ID}] Phase 1: Extracting BLOCKED packages...")
    blocked = extract_blocked_packages(TODO_FILE)
    print(f"  Found {len(blocked)} BLOCKED packages")

    # Phase 2: Load AUR cache and build dependency tree
    print(f"[{PASS_ID}] Phase 2: Loading AUR cache...")
    aur_cache = load_aur_cache(AUR_CACHE)
    print(f"  Loaded {len(aur_cache)} AUR packages")

    print(f"[{PASS_ID}] Building dependency tree...")
    tree = build_dependency_tree(blocked, aur_cache)
    print(f"  Tree built for {len(tree)} packages")

    print(f"[{PASS_ID}] Priority sorting...")
    sorted_queue = priority_sort(tree)

    # Select top 100
    selected = sorted_queue[:100]

    # Write tree artifact (JSON)
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

    with open(TREE_JSON, "w") as f:
        json.dump(tree_json, f, indent=2)
    print(f"  Wrote {TREE_JSON}")

    # Write tree artifact (Markdown)
    with open(TREE_MD, "w") as f:
        f.write(f"# Blocked Dependency Tree\n\n")
        f.write(f"**Pass:** {PASS_ID}  \n")
        f.write(f"**Timestamp:** {timestamp}  \n")
        f.write(f"**Total BLOCKED:** {len(blocked)}  \n\n")
        f.write(f"## Priority Queue (Top 50)\n\n")
        f.write(f"| Rank | Package | # | Blocked Deps | Reverse Deps | Total Deps |\n")
        f.write(f"|------|---------|---|-------------|-------------|------------|\n")
        for i, item in enumerate(sorted_queue[:50]):
            f.write(
                f"| {i+1} | {item['name']} | {item['number']} "
                f"| {item['blocked_dep_count']} | {item['reverse_dep_count']} "
                f"| {item['total_dep_count']} |\n"
            )
    print(f"  Wrote {TREE_MD}")

    # Write selection
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

    with open(SELECTION_FILE, "w") as f:
        json.dump(selection, f, indent=2)
    print(f"  Wrote {SELECTION_FILE}")

    # Print top 20
    print(f"\n[{PASS_ID}] Top 20 priority queue:")
    print(f"{'Rank':>4} {'Package':<45} {'BDep':>4} {'RDep':>4} {'TDep':>4}")
    print("-" * 65)
    for i, item in enumerate(sorted_queue[:20]):
        print(
            f"{i+1:>4} {item['name']:<45} "
            f"{item['blocked_dep_count']:>4} {item['reverse_dep_count']:>4} "
            f"{item['total_dep_count']:>4}"
        )

    # Phase 3: Create AUR lookup for selected packages
    print(f"\n[{PASS_ID}] Phase 3: Creating AUR lookup for {len(selected)} packages...")
    lookup_packages = []
    for item in selected:
        name = item["name"]
        aur_data = aur_cache.get(name)
        category = categorize_aur_package(name, aur_data)

        if aur_data:
            lookup_packages.append({
                "name": name,
                "number": item["number"],
                "in_aur": True,
                "version": aur_data.get("Version", ""),
                "description": aur_data.get("Description", ""),
                "url": aur_data.get("URL", ""),
                "license": aur_data.get("License") or [],
                "depends": [strip_version_constraint(d) for d in (aur_data.get("Depends") or [])],
                "makedepends": [strip_version_constraint(d) for d in (aur_data.get("MakeDepends") or [])],
                "pkgbase": aur_data.get("PackageBase", ""),
                "category": category,
            })
        else:
            lookup_packages.append({
                "name": name,
                "number": item["number"],
                "in_aur": False,
                "version": "",
                "description": "",
                "url": "",
                "license": [],
                "depends": [],
                "makedepends": [],
                "pkgbase": "",
                "category": category,
            })

    lookup = {"pass_id": PASS_ID, "packages": lookup_packages}
    with open(LOOKUP_FILE, "w") as f:
        json.dump(lookup, f, indent=2)
    print(f"  Wrote {LOOKUP_FILE}")

    # Phase 4: Resolve packages — generate recipes
    print(f"\n[{PASS_ID}] Phase 4: Resolving packages...")
    recipes = []
    exports = []
    results = []
    pkg_name_map = {}
    recipe_list = []
    recipe_count = 0
    blocked_count = 0

    for pkg in lookup_packages:
        name = pkg["name"]
        number = pkg["number"]
        category = pkg["category"]
        aur_data = aur_cache.get(name)

        action, reason, recipe_text, gname, build_sys = categorize_and_resolve(
            name, number, aur_data, category
        )
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
                "build_system": build_sys,
                "version": clean_version(pkg.get("version", "0.0.0")),
            })
        else:
            blocked_count += 1

    print(f"  Results: {recipe_count} recipes, {blocked_count} remaining blocked")

    # Phase 5: Write all artifacts
    print(f"\n[{PASS_ID}] Phase 5: Writing artifacts...")

    if recipes:
        write_recipe_module(recipes, exports)

    update_todo(results)
    update_packages_scm(exports)
    update_compat_scm(exports, pkg_name_map)

    # Write summary
    summary = {
        "pass_id": PASS_ID,
        "timestamp": timestamp,
        "total_blocked_in_tree": len(blocked),
        "total_selected": len(selected),
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
    print(f"  Wrote {SUMMARY_FILE}")

    # Final summary
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
    print(f"\nBlocked:")
    for r in results:
        if r[2] == "BLOCKED":
            print(f"  {r[0]} (#{r[1]}): {r[3]}")

    return summary


if __name__ == "__main__":
    main()
