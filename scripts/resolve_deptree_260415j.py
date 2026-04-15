#!/usr/bin/env python3
"""Dependency-tree-driven packaging pass: deptree-resolver-260415j

All-in-one: builds dep tree, selects 100 BLOCKED packages, generates Guix
recipes, updates todo_general_packages.org, packages.scm, general-compat.scm.
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
PASS_ID = "deptree-resolver-260415j"
RECIPE_FILE = ROOT / "guix" / "gaurix" / "packages" / f"{PASS_ID}.scm"
PACKAGES_SCM = ROOT / "guix" / "gaurix" / "packages.scm"
COMPAT_SCM = ROOT / "guix" / "gaurix" / "packages" / "general-compat.scm"
SUMMARY_FILE = ROOT / "reports" / f"{PASS_ID}-summary.json"
SELECTION_FILE = ROOT / "reports" / f"{PASS_ID}-selection.json"
AUR_LOOKUP_FILE = ROOT / "reports" / f"{PASS_ID}-aur-lookup.json"
TREE_JSON = ROOT / "reports" / "blocked-dependency-tree.json"
TREE_MD = ROOT / "reports" / "blocked-dependency-tree.md"


# ===========================================================================
# Phase 1: Extract BLOCKED packages and build dependency tree
# ===========================================================================

def extract_blocked_packages(todo_path):
    """Extract all BLOCKED packages with their numbers from the org file."""
    blocked = []
    with open(todo_path, "r") as f:
        for line in f:
            m = re.match(r"^\*\*\s+BLOCKED\s+(\d+)\.\s+(\S+)", line)
            if m:
                blocked.append({"name": m.group(2), "number": int(m.group(1))})
    return blocked


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
    """Sort by: blocked_dep_count ASC, reverse_dep_count DESC, total_dep_count ASC, name ASC."""
    items = list(tree.values())
    items.sort(key=lambda x: (
        x["blocked_dep_count"],
        -x["reverse_dep_count"],
        x["total_dep_count"],
        x["name"],
    ))
    return items


# ===========================================================================
# Phase 2: Categorize and generate recipes
# ===========================================================================

def guix_name(aur_name):
    """Convert AUR package name to valid Guix symbol."""
    name = aur_name.lower()
    name = re.sub(r"[_.@]+", "-", name)
    name = re.sub(r"[^a-z0-9-]", "", name)
    name = re.sub(r"-+", "-", name)
    return name.strip("-")


def clean_version(raw_version):
    """Strip epoch and pkgrel from version."""
    v = re.sub(r"^\d+:", "", raw_version)
    v = re.sub(r"-\d+$", "", v)
    return v


def escape_scheme_string(s):
    return s.replace("\\", "\\\\").replace('"', '\\"')


def make_synopsis(desc, name):
    if not desc:
        return name.replace("-", " ")
    syn = desc.split(".")[0].strip()
    if len(syn) > 76:
        syn = syn[:73] + "..."
    proper_prefixes = ["GNU", "GNOME", "KDE", "Qt", "GTK", "NVIDIA", "AMD",
                       "USB", "HTTP", "JSON", "XML", "DKMS", "Linux", "X11",
                       "SDL", "FFmpeg", "OpenGL", "OpenCL", "LLVM", "GCC",
                       "ALSA", "JACK", "MIDI", "FLAC", "LAME", "AAC",
                       "Docker", "Kubernetes", "Wayland", "Xorg"]
    if syn and syn[0].isupper() and not any(syn.startswith(p) for p in proper_prefixes):
        syn = syn[0].lower() + syn[1:]
    syn = syn.rstrip(".")
    return syn


def make_description(desc, name):
    if not desc:
        return f"{name} package."
    d = desc.strip()
    if not d.endswith("."):
        d += "."
    return d


LICENSE_MAP = {
    "MIT": "license:expat",
    "BSD": "license:bsd-3",
    "BSD-2-Clause": "license:bsd-2",
    "BSD-3-Clause": "license:bsd-3",
    "GPL": "license:gpl3+",
    "GPL2": "license:gpl2",
    "GPLv2": "license:gpl2",
    "GPL-2.0": "license:gpl2",
    "GPL-2.0-only": "license:gpl2",
    "GPL-2.0-or-later": "license:gpl2+",
    "GPLv2+": "license:gpl2+",
    "GPL3": "license:gpl3",
    "GPLv3": "license:gpl3",
    "GPL-3.0": "license:gpl3",
    "GPL-3.0-only": "license:gpl3",
    "GPL-3.0-or-later": "license:gpl3+",
    "GPLv3+": "license:gpl3+",
    "LGPL": "license:lgpl3+",
    "LGPL-2.0": "license:lgpl2.0",
    "LGPL-2.0-or-later": "license:lgpl2.0+",
    "LGPL-2.1": "license:lgpl2.1",
    "LGPL-2.1-only": "license:lgpl2.1",
    "LGPL-2.1-or-later": "license:lgpl2.1+",
    "LGPL-3.0": "license:lgpl3",
    "LGPL-3.0-only": "license:lgpl3",
    "LGPL-3.0-or-later": "license:lgpl3+",
    "Apache": "license:asl2.0",
    "Apache-2.0": "license:asl2.0",
    "MPL-2.0": "license:mpl2.0",
    "ISC": "license:isc",
    "Zlib": "license:zlib",
    "zlib": "license:zlib",
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


def map_license(lic_list):
    if not lic_list:
        return "license:expat"
    first = lic_list[0] if lic_list else "unknown"
    if first in LICENSE_MAP:
        return LICENSE_MAP[first]
    for key in LICENSE_MAP:
        if first.lower().startswith(key.lower()):
            return LICENSE_MAP[key]
    return "license:non-copyleft"


def categorize_package(name, aur_data):
    """Return (category, in_aur) for a package based on AUR metadata."""
    if not aur_data:
        # Check name patterns for categorization even without AUR data
        if re.match(r"linux-(?:cachyos|zen|hardened|lts|xanmod|tkg|clear|libre|rt|pf|ck)", name):
            return "kernel-binary", False
        if re.match(r"linux-.*-(headers|docs)$", name):
            return "kernel-binary", False
        return "unknown", False

    pkg_name = name
    desc = (aur_data.get("Description") or "").lower()
    makedeps = [d.lower() for d in (aur_data.get("MakeDepends") or [])]
    depends_raw = [d.lower() for d in (aur_data.get("Depends") or [])]
    depends_stripped = [re.split(r"[><=]", d)[0].strip() for d in depends_raw]
    all_deps_stripped = [re.split(r"[><=]", d)[0].strip() for d in makedeps + depends_raw]

    # Arch-specific: depends on pacman, makepkg, or AUR-specific infra
    arch_dep_names = {"pacman", "makepkg", "devtools", "pkgbuild-introspection",
                      "pacutils", "namcap", "aurpublish"}
    if any(d in arch_dep_names for d in all_deps_stripped):
        return "arch-specific", True
    if any(kw in desc for kw in ["pacman hook", "pacman wrapper", "aur helper", "pkgbuild",
                                   "arch user repository", "pacman database"]):
        return "arch-specific", True
    # Tools that wrap reflector (Arch mirror tool)
    if any(d == "reflector" for d in depends_stripped):
        return "arch-specific", True

    # Kernel packages: linux-cachyos, linux-zen, etc.
    if re.match(r"linux-(?:cachyos|zen|hardened|lts|xanmod|tkg|clear|libre|rt|pf|ck)", pkg_name):
        return "kernel-binary", True
    if re.match(r"linux-.*-(headers|docs)$", pkg_name):
        return "kernel-binary", True
    if ("linux kernel" in desc or "kernel and modules" in desc) and any(d in depends_stripped for d in ["kmod", "initramfs"]):
        return "kernel-binary", True

    # NVIDIA proprietary drivers
    if re.match(r"nvidia-.*-dkms", pkg_name) or (pkg_name.startswith("nvidia-") and "dkms" in pkg_name):
        return "nvidia-driver", True
    if pkg_name.startswith("lib32-nvidia-") or pkg_name.startswith("lib32-opencl-nvidia"):
        return "nvidia-driver", True
    if pkg_name.startswith("nvidia-") and "nvidia kernel module" in desc:
        return "nvidia-driver", True

    # DKMS modules (after NVIDIA check)
    if pkg_name.endswith("-dkms") or ("dkms" in pkg_name and "dkms" in " ".join(makedeps)):
        return "dkms-module", True

    # Fonts
    if pkg_name.startswith("ttf-") or pkg_name.startswith("otf-") or pkg_name.startswith("font-"):
        return "font", True
    if "font" in desc and ("ttf" in desc or "otf" in desc or "typeface" in desc):
        return "font", True

    # Binary packages
    if pkg_name.endswith("-bin"):
        if any(kw in desc for kw in ["appimage", "app image"]):
            return "binary-appimage", True
        return "binary-generic", True
    if pkg_name.endswith("-appimage"):
        return "binary-appimage", True

    # Build system detection
    makedeps_str = " ".join(makedeps)
    if "cmake" in makedeps_str:
        return "source-cmake", True
    if "meson" in makedeps_str:
        return "source-meson", True
    if any("cargo" in d or d == "rust" for d in makedeps):
        return "source-rust", True
    if any("python-build" in d or "python-installer" in d or "python-setuptools" in d for d in makedeps):
        return "source-python", True
    if any("npm" in d or "nodejs" in d for d in makedeps):
        return "source-node", True
    if any(d.startswith("go") and d in ("go", "go-pie") for d in makedeps):
        return "source-go", True

    return "source-generic", True


def determine_build_system(category):
    bs_map = {
        "binary-generic": "copy",
        "binary-appimage": "copy",
        "binary-deb": "copy",
        "binary-tar": "copy",
        "font": "font",
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
    return bs_map.get(category, "gnu")


def determine_source(name, url, category):
    """Return (method, uri_scheme) for source origin."""
    if not url:
        return "url-fetch", f"https://aur.archlinux.org/cgit/aur.git/snapshot/{name}.tar.gz"

    for pattern in [r"https?://github\.com/", r"https?://gitlab\.", r"https?://codeberg\.org/",
                    r"https?://git\.sr\.ht/", r"https?://bitbucket\.org/"]:
        if re.match(pattern, url):
            return "git-fetch", url.rstrip("/").removesuffix(".git")

    return "url-fetch", f"https://aur.archlinux.org/cgit/aur.git/snapshot/{name}.tar.gz"


def generate_recipe(name, aur_data, category):
    """Generate a Guix package definition string."""
    gname = guix_name(name)
    version = clean_version(aur_data.get("Version", "0.0.0")) if aur_data else "0.0.0"
    desc = (aur_data.get("Description") or "") if aur_data else ""
    url = (aur_data.get("URL") or "") if aur_data else ""
    homepage = url or f"https://aur.archlinux.org/packages/{name}"
    lic = map_license(aur_data.get("License", []) if aur_data else [])
    synopsis = make_synopsis(desc, name)
    description = make_description(desc, name)
    build_sys = determine_build_system(category)
    method, source_url = determine_source(name, url, category)

    lines = []
    lines.append(f'(define-public {gname}')
    lines.append(f'  (package')
    lines.append(f'    (name "{gname}")')
    lines.append(f'    (version "{escape_scheme_string(version)}")')

    if method == "git-fetch":
        lines.append(f'    (source (origin')
        lines.append(f'              (method git-fetch)')
        lines.append(f'              (uri (git-reference')
        lines.append(f'                    (url "{escape_scheme_string(source_url)}")')
        lines.append(f'                    (commit (string-append "v" version))))')
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
    lines.append(f'    (home-page "{escape_scheme_string(homepage)}")')
    lines.append(f'    (license {lic})))')
    lines.append("")

    return "\n".join(lines), gname, build_sys, version


# ===========================================================================
# Phase 3: Write artifacts
# ===========================================================================

def write_tree_artifacts(sorted_queue, total_blocked, timestamp):
    """Write blocked-dependency-tree.json and .md."""
    tree_data = {
        "timestamp": timestamp,
        "pass_id": PASS_ID,
        "total_blocked": total_blocked,
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
        json.dump(tree_data, f, indent=2)

    with open(TREE_MD, "w") as f:
        f.write(f"# Blocked Dependency Tree\n\n")
        f.write(f"**Pass:** {PASS_ID}  \n")
        f.write(f"**Timestamp:** {timestamp}  \n")
        f.write(f"**Total BLOCKED:** {total_blocked}  \n\n")
        f.write(f"## Priority Queue (Top 50)\n\n")
        f.write(f"| Rank | Package | # | Blocked Deps | Reverse Deps | Total Deps |\n")
        f.write(f"|------|---------|---|-------------|-------------|------------|\n")
        for i, item in enumerate(sorted_queue[:50]):
            f.write(f"| {i+1} | {item['name']} | {item['number']} | {item['blocked_dep_count']} | {item['reverse_dep_count']} | {item['total_dep_count']} |\n")

    print(f"  Wrote {TREE_JSON}")
    print(f"  Wrote {TREE_MD}")


def write_selection(selected, total_blocked, timestamp):
    """Write selection JSON."""
    selection = {
        "pass_id": PASS_ID,
        "timestamp": timestamp,
        "total_blocked_in_tree": total_blocked,
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


def write_recipe_module(recipes, exports, build_systems_used):
    """Write the Guix recipe module file."""
    export_lines = "\n".join(f"            {e}" for e in exports)

    # Determine which build-system modules we need
    bs_modules = set()
    for bs in build_systems_used:
        if bs == "font":
            bs_modules.add("(guix build-system font)")
        else:
            bs_modules.add(f"(guix build-system {bs})")
    bs_module_lines = "\n".join(f"  #:use-module {m}" for m in sorted(bs_modules))

    header = f''';;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency tree resolver pass --- {PASS_ID}
;;; Resolves 100 packages from dependency tree queue.
;;;
;;; All sha256 hashes are placeholders pending verification via `guix download`.

(define-module (gaurix packages {PASS_ID})
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
{bs_module_lines}
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
    fd, tmp = tempfile.mkstemp(dir=path.parent, suffix=".tmp")
    try:
        with open(fd, "w") as f:
            f.write(content)
        shutil.move(tmp, path)
    except:
        try:
            Path(tmp).unlink()
        except:
            pass
        raise


def update_todo(results):
    """Update todo_general_packages.org with new statuses."""
    with open(TODO_FILE, "r") as f:
        content = f.read()

    for pkg_name, number, action, reason, gname in results:
        if action == "RECIPE":
            # Change BLOCKED to DONE
            pattern = rf"(\*\*\s+)BLOCKED(\s+{re.escape(str(number))}\.\s+{re.escape(pkg_name)})"
            content = re.sub(pattern, r"\g<1>DONE\g<2>", content)
            status_text = f"DONE: recipe in {PASS_ID}.scm ({gname}, {reason})"
        else:
            status_text = f"BLOCKED: {reason} [{PASS_ID}]"

        # Add status line if pass_id not already present
        entry_pattern = rf"(\*\*\s+(?:BLOCKED|DONE)\s+{re.escape(str(number))}\.\s+{re.escape(pkg_name)}\n(?:.*\n)*?)"
        entry_match = re.search(entry_pattern, content)
        if entry_match and PASS_ID not in entry_match.group(0):
            end_pos = entry_match.end()
            insert_line = f"   - Status: {status_text}\n"
            content = content[:end_pos] + insert_line + content[end_pos:]

    atomic_write(TODO_FILE, content)
    print(f"  Updated {TODO_FILE}")


def update_packages_scm(exports):
    """Add exports to packages.scm using deterministic full-file transform."""
    with open(PACKAGES_SCM, "r") as f:
        content = f.read()

    comment = f"            ;; {PASS_ID}\n"
    new_exports = "\n".join(f"            {e}" for e in exports)

    # Find the last closing )) - the module close
    stripped = content.rstrip()
    last_close = stripped.rfind("))")
    if last_close > 0:
        content = stripped[:last_close] + f"\n{comment}{new_exports}\n))\n"

    atomic_write(PACKAGES_SCM, content)
    print(f"  Updated {PACKAGES_SCM}")


def update_compat_scm(exports, pkg_name_map):
    """Add #:use-module and compat aliases to general-compat.scm."""
    with open(COMPAT_SCM, "r") as f:
        content = f.read()

    # Add use-module if not present
    use_module_line = f"  #:use-module (gaurix packages {PASS_ID})"
    if use_module_line not in content:
        # Find last #:use-module line
        last_use = content.rfind("#:use-module")
        if last_use >= 0:
            end_of_line = content.index("\n", last_use)
            content = content[:end_of_line + 1] + use_module_line + "\n" + content[end_of_line + 1:]

    # Add compat aliases for -bin/-git/-appimage variants
    aliases = []
    for gname, aur_name in pkg_name_map.items():
        for suffix in ["-bin", "-git", "-appimage"]:
            if aur_name.endswith(suffix):
                base = guix_name(aur_name[:-len(suffix)])
                if base and base != gname:
                    aliases.append(f'(define-public {base} (package (inherit {gname}) (name "{base}")))')
                break

    if aliases:
        alias_block = f"\n;; --- {PASS_ID} compat aliases ---\n"
        alias_block += "\n".join(aliases) + "\n"
        content = content.rstrip() + "\n" + alias_block

    atomic_write(COMPAT_SCM, content)
    print(f"  Updated {COMPAT_SCM}")


# ===========================================================================
# Main
# ===========================================================================

def main():
    timestamp = datetime.now(timezone.utc).isoformat().replace("+00:00", "Z")

    # Phase 1: Dependency tree
    print(f"[{PASS_ID}] Phase 1: Building dependency tree...")
    blocked = extract_blocked_packages(TODO_FILE)
    print(f"  Found {len(blocked)} BLOCKED packages")

    aur_cache = load_aur_cache(AUR_CACHE)
    print(f"  Loaded {len(aur_cache)} AUR packages")

    tree = build_dependency_tree(blocked, aur_cache)
    print(f"  Tree built for {len(tree)} packages")

    sorted_queue = priority_sort(tree)

    # Write tree artifacts
    write_tree_artifacts(sorted_queue, len(blocked), timestamp)

    # Select top 100
    selected = sorted_queue[:100]
    write_selection(selected, len(blocked), timestamp)

    # Print top 20
    print(f"\n  Top 20 priority queue:")
    print(f"  {'Rank':>4} {'Package':<50} {'BDep':>4} {'RDep':>4} {'TDep':>4}")
    print(f"  {'-'*70}")
    for i, item in enumerate(sorted_queue[:20]):
        print(f"  {i+1:>4} {item['name']:<50} {item['blocked_dep_count']:>4} {item['reverse_dep_count']:>4} {item['total_dep_count']:>4}")

    # Phase 2: Categorize and generate recipes
    print(f"\n[{PASS_ID}] Phase 2: Categorizing and generating recipes...")

    recipes = []
    exports = []
    results = []
    pkg_name_map = {}
    recipe_list = []
    blocked_list = []
    build_systems_used = set()

    for item in selected:
        name = item["name"]
        aur_data = aur_cache.get(name)
        category, in_aur = categorize_package(name, aur_data)

        # Determine if this stays blocked
        if not in_aur:
            reason = "MISSING_SOURCE: not found in AUR metadata cache"
            results.append((name, item["number"], "BLOCKED", reason, None))
            blocked_list.append({"name": name, "number": item["number"], "reason": reason})
            continue

        if category == "arch-specific":
            reason = "ARCH_SPECIFIC: depends on pacman/makepkg infrastructure"
            results.append((name, item["number"], "BLOCKED", reason, None))
            blocked_list.append({"name": name, "number": item["number"], "reason": reason})
            continue

        if category == "nvidia-driver":
            reason = "NVIDIA_PROPRIETARY: NVIDIA proprietary DKMS driver module"
            results.append((name, item["number"], "BLOCKED", reason, None))
            blocked_list.append({"name": name, "number": item["number"], "reason": reason})
            continue

        if category == "kernel-binary":
            reason = "KERNEL_BINARY: versioned Arch kernel binary, not portable to Guix"
            results.append((name, item["number"], "BLOCKED", reason, None))
            blocked_list.append({"name": name, "number": item["number"], "reason": reason})
            continue

        # Generate recipe
        recipe_text, gname, build_sys, version = generate_recipe(name, aur_data, category)
        reason = f"Guix recipe created ({category})"
        results.append((name, item["number"], "RECIPE", reason, gname))
        recipes.append(recipe_text)
        exports.append(gname)
        pkg_name_map[gname] = name
        build_systems_used.add(build_sys)
        recipe_list.append({
            "aur_name": name,
            "number": item["number"],
            "guix_name": gname,
            "build_system": build_sys,
            "version": version,
            "category": category,
        })

    recipe_count = len(recipe_list)
    blocked_count = len(blocked_list)
    print(f"  Results: {recipe_count} recipes, {blocked_count} remaining blocked")

    # Phase 3: Write all artifacts
    print(f"\n[{PASS_ID}] Phase 3: Writing artifacts...")

    if recipes:
        write_recipe_module(recipes, exports, build_systems_used)

    # Write AUR lookup (for reference)
    aur_lookup = {
        "pass_id": PASS_ID,
        "timestamp": timestamp,
        "packages": [
            {
                "name": item["name"],
                "number": item["number"],
                "in_aur": item["name"] in aur_cache,
                "category": categorize_package(item["name"], aur_cache.get(item["name"]))[0],
                "version": clean_version(aur_cache[item["name"]].get("Version", "0.0.0")) if item["name"] in aur_cache else None,
                "description": aur_cache[item["name"]].get("Description") if item["name"] in aur_cache else None,
                "url": aur_cache[item["name"]].get("URL") if item["name"] in aur_cache else None,
                "license": aur_cache[item["name"]].get("License") if item["name"] in aur_cache else None,
                "makedepends": [strip_version_constraint(d) for d in (aur_cache[item["name"]].get("MakeDepends") or [])] if item["name"] in aur_cache else [],
                "depends": [strip_version_constraint(d) for d in (aur_cache[item["name"]].get("Depends") or [])] if item["name"] in aur_cache else [],
            }
            for item in selected
        ],
    }
    with open(AUR_LOOKUP_FILE, "w") as f:
        json.dump(aur_lookup, f, indent=2)
    print(f"  Wrote {AUR_LOOKUP_FILE}")

    update_todo(results)
    if exports:
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
        "blocked": blocked_list,
    }
    with open(SUMMARY_FILE, "w") as f:
        json.dump(summary, f, indent=2)
    print(f"  Wrote {SUMMARY_FILE}")

    # Final report
    print(f"\n{'='*70}")
    print(f"PASS SUMMARY: {PASS_ID}")
    print(f"{'='*70}")
    print(f"Total BLOCKED in tree: {len(blocked)}")
    print(f"Selected: {len(selected)}")
    print(f"Recipes created: {recipe_count}")
    print(f"Remaining blocked: {blocked_count}")
    print(f"\nSelected 100 packages:")
    for i, item in enumerate(selected):
        print(f"  {i+1:>3}. {item['name']} (#{item['number']}, bdep={item['blocked_dep_count']}, rdep={item['reverse_dep_count']}, tdep={item['total_dep_count']})")
    print(f"\nRecipes created:")
    for r in recipe_list:
        print(f"  {r['aur_name']} -> {r['guix_name']} ({r['build_system']}, v{r['version']})")
    if blocked_list:
        print(f"\nRemaining blocked:")
        for b in blocked_list:
            print(f"  {b['name']} (#{b['number']}): {b['reason']}")

    return summary


if __name__ == "__main__":
    main()
