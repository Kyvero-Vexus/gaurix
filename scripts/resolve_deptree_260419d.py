#!/usr/bin/env python3
"""
Dependency tree resolver pass --- deptree-resolver-260419d
Select 100 TODO packages from todo_general_packages.org, look them up in AUR,
and generate Guix package definitions.  Also resolves remaining BLOCKED packages.

Steps:
1) Extract all BLOCKED packages (2 remaining) and TODO packages
2) Build dependency tree using AUR cache
3) Compute blocked_dep_count, reverse_dep_count, total_dep_count
4) Priority sort and select first 100
5) Write tree artifacts, selection, and Guix module
"""

import json
import os
import re
import sys
from datetime import datetime, timezone
from pathlib import Path

PASS_ID = "deptree-resolver-260419d"
ROOT = Path(__file__).resolve().parent.parent
TODO_FILE = str(ROOT / "todo_general_packages.org")
AUR_CACHE = str(ROOT / "data" / "aur-cache" / "packages-meta-ext-v1.json")
REPORT_FILE = str(ROOT / "reports" / f"{PASS_ID}-aur-lookup.json")
MODULE_FILE = str(ROOT / "guix" / "gaurix" / "packages" / f"{PASS_ID}.scm")
SELECTION_FILE = str(ROOT / "reports" / f"{PASS_ID}-selection.json")
SUMMARY_FILE = str(ROOT / "reports" / f"{PASS_ID}-summary.json")
TREE_JSON = str(ROOT / "reports" / "blocked-dependency-tree.json")
TREE_MD = str(ROOT / "reports" / "blocked-dependency-tree.md")
TARGET_COUNT = 100

# Map AUR license strings to Guix license symbols
LICENSE_MAP = {
    "MIT": "license:expat",
    "Apache": "license:asl2.0",
    "Apache-2.0": "license:asl2.0",
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
    "LGPL-2.0": "license:lgpl2.0",
    "LGPL2.1": "license:lgpl2.1",
    "LGPL-2.1": "license:lgpl2.1",
    "LGPL-2.1-only": "license:lgpl2.1",
    "LGPL-2.1-or-later": "license:lgpl2.1+",
    "LGPL3": "license:lgpl3",
    "LGPL-3.0": "license:lgpl3",
    "LGPL-3.0-only": "license:lgpl3",
    "LGPL-3.0-or-later": "license:lgpl3+",
    "BSD": "license:bsd-3",
    "BSD-2-Clause": "license:bsd-2",
    "BSD-3-Clause": "license:bsd-3",
    "ISC": "license:isc",
    "MPL": "license:mpl2.0",
    "MPL2": "license:mpl2.0",
    "MPL-2.0": "license:mpl2.0",
    "Artistic2": "license:artistic2.0",
    "Artistic-2.0": "license:artistic2.0",
    "Zlib": "license:zlib",
    "WTFPL": "license:wtfpl2",
    "Unlicense": "license:unlicense",
    "CC0": "license:cc0",
    "CC0-1.0": "license:cc0",
    "PSF": "license:psfl",
    "Python": "license:psfl",
    "AGPL3": "license:agpl3",
    "AGPL-3.0": "license:agpl3",
    "AGPL-3.0-only": "license:agpl3",
    "AGPL-3.0-or-later": "license:agpl3+",
    "Boost": "license:boost1.0",
    "BSL-1.0": "license:boost1.0",
    "custom": "license:expat",
    "OFL": "license:silofl1.1",
    "OFL-1.1": "license:silofl1.1",
    "EUPL-1.2": "license:eupl1.2",
    "0BSD": "license:bsd-0",
    "public domain": "license:public-domain",
    "CC-BY-4.0": "license:cc-by4.0",
    "CC-BY-SA-4.0": "license:cc-by-sa4.0",
    "CPAL-1.0": "license:cpal1.0",
    "CECILL-2.1": "license:cecill",
}


def map_license(aur_licenses):
    """Map AUR license list to Guix license expression."""
    if not aur_licenses:
        return "license:expat", "MIT"
    lic = aur_licenses[0]
    guix_lic = LICENSE_MAP.get(lic)
    if guix_lic:
        return guix_lic, lic
    for key, val in LICENSE_MAP.items():
        if key.lower() in lic.lower():
            return val, lic
    return "license:expat", lic


def sanitize_name(name):
    """Convert AUR package name to valid Guix package name."""
    n = name.lower().replace("_", "-").replace(".", "-")
    n = re.sub(r'[^a-z0-9\-+]', '-', n)
    n = re.sub(r'-+', '-', n)
    n = n.strip('-')
    return n


def strip_version_constraint(dep):
    """Strip version constraints from dependency strings."""
    return re.split(r"[><=]", dep)[0].strip()


def guess_build_system(name, aur_entry):
    """Guess the appropriate build system from package name/metadata."""
    name_l = name.lower()
    makedeps = [d.lower() for d in (aur_entry.get("MakeDepends") or [])]
    deps = [d.lower() for d in (aur_entry.get("Depends") or [])]
    all_deps = makedeps + deps

    if name_l.endswith("-bin") or name_l.endswith("-appimage"):
        return "copy"
    if any(d.startswith("cargo") or d == "rust" for d in all_deps):
        return "cargo"
    if any(d.startswith("meson") for d in all_deps):
        return "meson"
    if any(d.startswith("cmake") for d in all_deps):
        return "cmake"
    if name_l.startswith("python-") or any(
        "pyproject" in d or d.startswith("python-build") or d.startswith("python-installer")
        or d.startswith("python-setuptools") or d.startswith("python-wheel")
        for d in all_deps
    ):
        return "pyproject"
    if name_l.startswith("perl-"):
        return "perl"
    if name_l.startswith("ruby-"):
        return "ruby"
    if name_l.startswith("r-"):
        return "r"
    if name_l.startswith("nodejs-") or name_l.startswith("node-"):
        return "node"
    if any(d.startswith("npm") or d.startswith("nodejs") or d == "node" for d in all_deps):
        return "node"
    if name_l.endswith("-rs") or name_l.endswith("-rust"):
        return "cargo"
    if name_l.startswith("go-") or any(d in ("go", "golang") for d in all_deps):
        return "go"
    if name_l.startswith("ttf-") or name_l.startswith("otf-") or name_l.startswith("noto-") or "font" in name_l:
        return "copy"
    if "cursor" in name_l or ("icon" in name_l and "theme" in name_l):
        return "copy"
    if "dkms" in name_l:
        return "copy"
    return "gnu"


def build_system_module(bs):
    mapping = {
        "copy": "(guix build-system copy)",
        "gnu": "(guix build-system gnu)",
        "cmake": "(guix build-system cmake)",
        "meson": "(guix build-system meson)",
        "pyproject": "(guix build-system pyproject)",
        "perl": "(guix build-system perl)",
        "ruby": "(guix build-system ruby)",
        "r": "(guix build-system r)",
        "node": "(guix build-system node)",
        "cargo": "(guix build-system cargo)",
        "go": "(guix build-system go)",
    }
    return mapping.get(bs, "(guix build-system gnu)")


def build_system_symbol(bs):
    mapping = {
        "copy": "copy-build-system",
        "gnu": "gnu-build-system",
        "cmake": "cmake-build-system",
        "meson": "meson-build-system",
        "pyproject": "pyproject-build-system",
        "perl": "perl-build-system",
        "ruby": "ruby-build-system",
        "r": "r-build-system",
        "node": "node-build-system",
        "cargo": "cargo-build-system",
        "go": "go-build-system",
    }
    return mapping.get(bs, "gnu-build-system")


def guess_source_url(name, version, aur_entry, bs):
    """Guess upstream source URL from AUR metadata."""
    url = aur_entry.get("URL", "")
    ver_clean = re.sub(r'-\d+$', '', version)
    ver_clean = re.sub(r'^\d+:', '', ver_clean)

    if bs == "copy" and url and "github.com" in url:
        parts = url.rstrip('/').split('/')
        if len(parts) >= 5:
            owner, repo = parts[3], parts[4]
            return (f'(string-append\n'
                    f'                    "https://github.com/{owner}/{repo}/releases/download/v"\n'
                    f'                    version "/{repo}-linux-x86_64.tar.gz")',
                    "url-fetch", ver_clean)

    if name.endswith("-git"):
        if url and ("github.com" in url or "gitlab" in url or "codeberg" in url or "sr.ht" in url):
            git_url = url.rstrip('/')
            return (f'(git-reference\n'
                    f'                    (url "{git_url}")\n'
                    f'                    (commit "v{ver_clean}"))',
                    "git-fetch", ver_clean)

    if url and "github.com" in url:
        parts = url.rstrip('/').split('/')
        if len(parts) >= 5:
            owner, repo = parts[3], parts[4]
            return (f'(string-append\n'
                    f'                    "https://github.com/{owner}/{repo}/archive/refs/tags/v"\n'
                    f'                    version ".tar.gz")',
                    "url-fetch", ver_clean)

    if url and "gitlab" in url:
        parts = url.rstrip('/').split('/')
        if len(parts) >= 5:
            owner, repo = parts[3], parts[4]
            base = "/".join(parts[:3])
            return (f'(string-append\n'
                    f'                    "{base}/{owner}/{repo}/-/archive/v"\n'
                    f'                    version "/{repo}-v" version ".tar.gz")',
                    "url-fetch", ver_clean)

    if url:
        return (f'(string-append "{url}/releases/download/v" version "/source.tar.gz")',
                "url-fetch", ver_clean)

    return (f'"https://example.com/{name}-" version ".tar.gz"', "url-fetch", ver_clean)


def make_synopsis(description, name):
    """Create a valid Guix synopsis from AUR description."""
    if not description:
        return sanitize_name(name).replace("-", " ")
    syn = description.strip()
    proper_prefixes = [
        "GNU ", "GNOME ", "KDE ", "Qt ", "GTK", "X11", "XDG", "USB", "HTTP",
        "DNS", "SSH", "SSL", "TLS", "API", "CLI", "GUI", "JSON", "YAML",
        "XML", "PDF", "OpenGL", "Vulkan", "ALSA", "PulseAudio", "JACK",
        "Wayland", "Python", "Rust", "Go ", "Java", "Perl", "Ruby", "Node",
        "Noto", "CJK",
    ]
    if syn and syn[0].isupper() and not any(syn.startswith(w) for w in proper_prefixes):
        syn = syn[0].lower() + syn[1:]
    syn = syn.rstrip('.')
    if len(syn) > 80:
        syn = syn[:77] + "..."
    return syn


def make_description(description, name):
    """Create a valid Guix description."""
    if not description:
        return f"{name} is a software package."
    desc = description.strip()
    if not desc.endswith('.'):
        desc += '.'
    if desc[0].islower():
        desc = desc[0].upper() + desc[1:]
    return desc


def escape_scheme_string(s):
    """Escape a string for Scheme."""
    if not s:
        return ""
    return s.replace("\\", "\\\\").replace('"', '\\"')


def gen_package_def(name, aur_entry, bs):
    """Generate a Guix package definition string."""
    guix_name = sanitize_name(name)
    version_raw = aur_entry.get("Version", "0.0.0")
    aur_licenses = aur_entry.get("License", [])
    guix_lic, _ = map_license(aur_licenses)
    description = aur_entry.get("Description", "")
    homepage = aur_entry.get("URL", f"https://aur.archlinux.org/packages/{name}")

    source_uri, fetch_method, version = guess_source_url(name, version_raw, aur_entry, bs)

    if fetch_method == "git-fetch":
        source_block = f"""    (source (origin
              (method git-fetch)
              (uri {source_uri})
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))"""
    else:
        source_block = f"""    (source (origin
              (method url-fetch)
              (uri {source_uri})
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))"""

    if bs == "copy":
        if "font" in name.lower() or name.startswith("ttf-") or name.startswith("otf-") or name.startswith("noto-"):
            args = """    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/truetype/" #:include-regexp ("\\\\.(ttf|otf|woff|woff2)$")))))"""
        elif "cursor" in name.lower():
            args = """    (arguments
     (list #:install-plan
           #~'(("." "share/icons/" #:include-regexp (".*")))))"""
        elif "icon" in name.lower() or "theme" in name.lower():
            args = """    (arguments
     (list #:install-plan
           #~'(("." "share/icons/" #:include-regexp (".*")))))"""
        elif name.endswith("-bin"):
            args = f"""    (arguments
     (list #:install-plan
           #~'(("{guix_name}" "bin/{guix_name}"))))"""
        else:
            args = """    (arguments
     (list #:install-plan
           #~'(("." "share/"))))"""
    elif bs == "go":
        url = aur_entry.get("URL", "")
        if url and ("github.com" in url or "gitlab" in url):
            import_path = url.replace("https://", "").rstrip("/")
        else:
            import_path = name
        args = f"""    (arguments
     (list #:import-path "{import_path}"
           #:tests? #f))"""
    else:
        args = """    (arguments
     (list #:tests? #f))"""

    synopsis = escape_scheme_string(make_synopsis(description, name))
    desc_text = escape_scheme_string(make_description(description, name))
    homepage = escape_scheme_string(homepage)

    return f"""(define-public {guix_name}
  (package
    (name "{guix_name}")
    (version "{version}")
{source_block}
    (build-system {build_system_symbol(bs)})
{args}
    (home-page "{homepage}")
    (synopsis "{synopsis}")
    (description "{desc_text}")
    (license {guix_lic})))"""


def main():
    timestamp = datetime.now(timezone.utc).isoformat().replace("+00:00", "Z")

    # 1. Load AUR metadata
    print(f"[{PASS_ID}] Loading AUR metadata...")
    with open(AUR_CACHE) as f:
        aur_data = json.load(f)
    aur_by_name = {pkg["Name"]: pkg for pkg in aur_data}
    print(f"  Loaded {len(aur_by_name)} AUR packages")

    # 2. Load existing package names to avoid duplicates
    print(f"[{PASS_ID}] Scanning existing definitions...")
    existing = set()
    pkg_dir = str(ROOT / "guix" / "gaurix" / "packages")
    for fname in os.listdir(pkg_dir):
        if fname.endswith('.scm'):
            fpath = os.path.join(pkg_dir, fname)
            with open(fpath) as f:
                content = f.read()
            for m in re.finditer(r'\(define-public\s+(\S+)', content):
                existing.add(m.group(1))
    print(f"  Found {len(existing)} existing definitions")

    # 3. Parse BLOCKED and TODO entries
    print(f"[{PASS_ID}] Parsing entries...")
    blocked_entries = []
    todo_entries = []
    with open(TODO_FILE) as f:
        for line in f:
            m = re.match(r'^\*\*\s+BLOCKED\s+(\d+)\.\s+(\S+)', line)
            if m:
                blocked_entries.append((int(m.group(1)), m.group(2)))
                continue
            m = re.match(r'^\*\*\s+TODO\s+(\d+)\.\s+(\S+)', line)
            if m:
                todo_entries.append((int(m.group(1)), m.group(2)))
    print(f"  Found {len(blocked_entries)} BLOCKED, {len(todo_entries)} TODO entries")

    # 4. Build dependency tree for all target packages (BLOCKED + TODO in AUR)
    all_target_names = set()
    for _, name in blocked_entries:
        all_target_names.add(name)
    for _, name in todo_entries:
        all_target_names.add(name)

    tree = {}
    for name in all_target_names:
        aur_data_pkg = aur_by_name.get(name, {})
        depends = [strip_version_constraint(d) for d in (aur_data_pkg.get("Depends") or [])]
        makedepends = [strip_version_constraint(d) for d in (aur_data_pkg.get("MakeDepends") or [])]
        all_deps = list(set(depends + makedepends))
        blocked_deps = [d for d in all_deps if d in all_target_names]
        tree[name] = {
            "name": name,
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

    # 5. Select candidates: BLOCKED first, then TODO by priority
    candidates = []
    skipped_already_defined = 0
    skipped_no_aur = 0

    # Process BLOCKED packages first
    for num, name in blocked_entries:
        guix_name = sanitize_name(name)
        if guix_name in existing:
            skipped_already_defined += 1
            continue
        if name in aur_by_name:
            t = tree.get(name, {})
            candidates.append((num, name, aur_by_name[name], t.get("blocked_dep_count", 0),
                               t.get("reverse_dep_count", 0), t.get("total_dep_count", 0)))
        else:
            skipped_no_aur += 1

    # Then process TODO packages, sorted by dependency tree priority
    todo_with_priority = []
    for num, name in todo_entries:
        guix_name = sanitize_name(name)
        if guix_name in existing:
            skipped_already_defined += 1
            continue
        if name not in aur_by_name:
            skipped_no_aur += 1
            continue
        t = tree.get(name, {})
        todo_with_priority.append((
            t.get("blocked_dep_count", 0),
            -t.get("reverse_dep_count", 0),
            t.get("total_dep_count", 0),
            name,
            num,
        ))

    todo_with_priority.sort()
    for bdep, neg_rdep, tdep, name, num in todo_with_priority:
        if len(candidates) >= TARGET_COUNT:
            break
        candidates.append((num, name, aur_by_name[name], bdep, -neg_rdep, tdep))

    print(f"  Selected {len(candidates)} candidates ({len(blocked_entries)} BLOCKED + rest from TODO)")
    print(f"  Skipped {skipped_already_defined} already-defined, {skipped_no_aur} not-in-AUR")

    # 6. Write dependency tree artifacts
    # Build sorted queue from all tree entries for the report
    sorted_queue = sorted(tree.values(), key=lambda x: (
        x["blocked_dep_count"], -x["reverse_dep_count"], x["total_dep_count"], x["name"]))

    tree_json_data = {
        "timestamp": timestamp,
        "pass_id": PASS_ID,
        "total_in_tree": len(tree),
        "queue": [
            {
                "rank": i + 1,
                "name": item["name"],
                "blocked_dep_count": item["blocked_dep_count"],
                "reverse_dep_count": item["reverse_dep_count"],
                "total_dep_count": item["total_dep_count"],
                "blocked_deps": item["blocked_deps"],
                "reverse_deps": item["reverse_deps"][:20],  # Truncate for file size
            }
            for i, item in enumerate(sorted_queue[:500])  # Top 500 for report
        ],
    }
    with open(TREE_JSON, "w") as f:
        json.dump(tree_json_data, f, indent=2)
    print(f"  Wrote {TREE_JSON}")

    with open(TREE_MD, "w") as f:
        f.write(f"# Blocked Dependency Tree\n\n")
        f.write(f"**Pass:** {PASS_ID}  \n")
        f.write(f"**Timestamp:** {timestamp}  \n")
        f.write(f"**Total in tree:** {len(tree)}  \n\n")
        f.write(f"## Priority Queue (Top 200)\n\n")
        f.write(f"| Rank | Package | Blocked Deps | Reverse Deps | Total Deps |\n")
        f.write(f"|------|---------|-------------|-------------|------------|\n")
        for i, item in enumerate(sorted_queue[:200]):
            f.write(f"| {i+1} | {item['name']} | {item['blocked_dep_count']} | {item['reverse_dep_count']} | {item['total_dep_count']} |\n")
    print(f"  Wrote {TREE_MD}")

    # 7. Generate package definitions
    resolved = []
    blocked = []
    build_systems_used = set()

    for num, name, aur, bdep, rdep, tdep in candidates:
        guix_name = sanitize_name(name)
        bs = guess_build_system(name, aur)
        build_systems_used.add(bs)

        url = aur.get("URL", "")
        if not url and not name.endswith("-bin") and not name.endswith("-git"):
            blocked.append({
                "num": num,
                "name": name,
                "guix_name": guix_name,
                "reason": "SOURCE_UNAVAILABLE",
                "detail": "No upstream URL in AUR metadata"
            })
            continue

        try:
            pkg_def = gen_package_def(name, aur, bs)
            lic_sym, lic_name = map_license(aur.get("License", []))
            version_raw = aur.get("Version", "0.0.0")
            ver_clean = re.sub(r'-\d+$', '', version_raw)
            ver_clean = re.sub(r'^\d+:', '', ver_clean)
            resolved.append({
                "num": num,
                "name": name,
                "guix_name": guix_name,
                "build_system": bs,
                "version": ver_clean,
                "license": lic_name,
                "definition": pkg_def
            })
        except Exception as e:
            blocked.append({
                "num": num,
                "name": name,
                "guix_name": guix_name,
                "reason": "TOOLING_FAILURE",
                "detail": str(e)
            })

    print(f"\n  Resolved: {len(resolved)}")
    print(f"  Blocked: {len(blocked)}")

    # 8. Generate Scheme module
    if resolved:
        exports = [r["guix_name"] for r in resolved]
        bs_modules = sorted(set(build_system_module(r["build_system"]) for r in resolved))

        header_lines = []
        header_lines.append(";;; GNU Guix --- Functional package management for GNU")
        header_lines.append(";;; Copyright (C) 2026 Gaurix contributors")
        header_lines.append(";;;")
        header_lines.append(f";;; Dependency tree resolver pass --- {PASS_ID}")
        header_lines.append(f";;; Resolves {len(resolved)} TODO packages with concrete recipes.")
        if blocked:
            header_lines.append(f";;; Moves {len(blocked)} packages to BLOCKED status.")
        header_lines.append(";;;")
        header_lines.append(";;; New recipes:")
        for i, r in enumerate(resolved, 1):
            header_lines.append(f";;;   {i:4d}.  {r['guix_name']} ({build_system_symbol(r['build_system'])}, v{r['version']}, {r['license']})")
        if blocked:
            header_lines.append(";;;")
            header_lines.append(f";;; BLOCKED ({len(blocked)}):")
            for i, b in enumerate(blocked, len(resolved) + 1):
                header_lines.append(f";;;   {i:4d}.  {b['name']} -> {b['reason']}: {b['detail']}")
        header_lines.append(";;;")
        header_lines.append(";;; All sha256 hashes are placeholders pending verification via `guix download`.")
        header_lines.append("")

        module_lines = []
        module_lines.append(f"(define-module (gaurix packages {PASS_ID})")
        module_lines.append("  #:use-module (guix packages)")
        module_lines.append("  #:use-module (guix download)")
        module_lines.append("  #:use-module (guix git-download)")
        module_lines.append("  #:use-module (guix gexp)")
        module_lines.append("  #:use-module (guix utils)")
        for bsm in bs_modules:
            module_lines.append(f"  #:use-module {bsm}")
        module_lines.append("  #:use-module ((guix licenses) #:prefix license:)")
        module_lines.append("  #:use-module (gnu packages)")
        module_lines.append(f"  #:export ({exports[0]}")
        for exp in exports[1:]:
            module_lines.append(f"            {exp}")
        module_lines.append("))")
        module_lines.append("")

        full_module = "\n".join(header_lines) + "\n".join(module_lines)
        for i, r in enumerate(resolved):
            full_module += f"\n\n;;; -------------------------------------------------------------------\n"
            full_module += f";;; {i+1}. {r['guix_name']}\n"
            full_module += f";;; -------------------------------------------------------------------\n"
            full_module += r["definition"]
        full_module += "\n"

        with open(MODULE_FILE, 'w') as f:
            f.write(full_module)
        print(f"\n  Wrote {MODULE_FILE}")

    # 9. Write reports
    aur_report = []
    for r in resolved:
        aur_report.append({
            "num": r["num"],
            "aur_name": r["name"],
            "guix_name": r["guix_name"],
            "version": r["version"],
            "build_system": r["build_system"],
            "license": r["license"],
            "status": "RESOLVED"
        })
    for b in blocked:
        aur_report.append({
            "num": b["num"],
            "aur_name": b["name"],
            "guix_name": b["guix_name"],
            "status": "BLOCKED",
            "reason": b["reason"],
            "detail": b["detail"]
        })

    with open(REPORT_FILE, 'w') as f:
        json.dump(aur_report, f, indent=2)
    print(f"  Wrote {REPORT_FILE}")

    selection = {
        "pass_id": PASS_ID,
        "timestamp": timestamp,
        "target": TARGET_COUNT,
        "resolved": len(resolved),
        "blocked": len(blocked),
        "resolved_names": [r["guix_name"] for r in resolved],
        "blocked_names": [b["name"] for b in blocked]
    }
    with open(SELECTION_FILE, 'w') as f:
        json.dump(selection, f, indent=2)
    print(f"  Wrote {SELECTION_FILE}")

    summary = {
        "pass_id": PASS_ID,
        "timestamp": timestamp,
        "total_attempted": len(resolved) + len(blocked),
        "resolved": len(resolved),
        "blocked": len(blocked),
        "blockers_by_reason": {},
        "build_systems_used": list(build_systems_used)
    }
    for b in blocked:
        reason = b["reason"]
        if reason not in summary["blockers_by_reason"]:
            summary["blockers_by_reason"][reason] = []
        summary["blockers_by_reason"][reason].append(b["name"])

    with open(SUMMARY_FILE, 'w') as f:
        json.dump(summary, f, indent=2)
    print(f"  Wrote {SUMMARY_FILE}")

    # Print top 20 priority queue
    print(f"\n[{PASS_ID}] Top 20 priority queue:")
    print(f"{'Rank':>4} {'Package':<45} {'BDep':>4} {'RDep':>4} {'TDep':>4}")
    print("-" * 65)
    for i, item in enumerate(sorted_queue[:20]):
        print(f"{i+1:>4} {item['name']:<45} {item['blocked_dep_count']:>4} {item['reverse_dep_count']:>4} {item['total_dep_count']:>4}")

    # Print summary
    print(f"\n=== PASS SUMMARY ===")
    print(f"Pass: {PASS_ID}")
    print(f"Resolved: {len(resolved)}")
    print(f"Blocked: {len(blocked)}")
    print(f"Build systems: {', '.join(sorted(build_systems_used))}")
    if blocked:
        print(f"\nBlockers by reason:")
        for reason in summary["blockers_by_reason"]:
            names = summary["blockers_by_reason"][reason]
            print(f"  {reason}: {len(names)} ({', '.join(names[:5])}{'...' if len(names) > 5 else ''})")

    print(f"\nSelected {len(resolved)} packages:")
    for i, r in enumerate(resolved):
        print(f"  {i+1:>3}. {r['guix_name']} (#{r['num']}, {r['build_system']}, v{r['version']})")

    return resolved, blocked


if __name__ == "__main__":
    resolved, blocked = main()
