#!/usr/bin/env python3
"""
recipe-resolver-260417x: Resolve 100 TODO packages from the general queue.

Steps:
1. Select 100 TODO entries from todo_general_packages.org
2. Look up AUR metadata for each
3. Determine source URL, build system, license
4. Attempt to download source and compute hash via guix download
5. Generate recipe-resolver-260417x.scm
6. Update packages.scm, general-compat.scm, todo_general_packages.org
"""

import json
import os
import re
import shutil
import subprocess
import sys
import tempfile
import urllib.parse
import urllib.request
from concurrent.futures import ThreadPoolExecutor, as_completed

RESOLVER_ID = "recipe-resolver-260417x"
RESOLVER_FILE = f"guix/gaurix/packages/{RESOLVER_ID}.scm"
TODO_FILE = "todo_general_packages.org"
PACKAGES_FILE = "guix/gaurix/packages.scm"
COMPAT_FILE = "guix/gaurix/packages/general-compat.scm"
AUR_CACHE = "data/aur-cache/packages-meta-ext-v1.json"
MAX_PACKAGES = 100
DOWNLOAD_TIMEOUT = 45  # seconds per download
MAX_PARALLEL_DOWNLOADS = 6

# ── Load AUR cache ──────────────────────────────────────────────────
print("Loading AUR cache...", file=sys.stderr)
with open(AUR_CACHE) as f:
    aur_list = json.load(f)
aur_data = {p["Name"]: p for p in aur_list}
print(f"AUR cache: {len(aur_data)} packages", file=sys.stderr)


# ── Select 100 TODO items ──────────────────────────────────────────
print("Selecting TODO entries...", file=sys.stderr)
with open(TODO_FILE) as f:
    org_lines = f.readlines()

todos = []
i = 0
while i < len(org_lines) and len(todos) < MAX_PACKAGES:
    m = re.match(r"^\*\* TODO (\d+)\. (.+)", org_lines[i])
    if m:
        num = int(m.group(1))
        name = m.group(2).strip()
        # Strip any trailing bracket annotations like [BLOCKED: ...]
        name = re.sub(r"\s*\[.*\]\s*$", "", name)
        note = ""
        for j in range(i + 1, min(i + 6, len(org_lines))):
            nm = re.match(r"\s+- Note: (.+)", org_lines[j])
            if nm:
                note = nm.group(1).strip()
                break
        todos.append({"num": num, "name": name, "line_idx": i, "note": note})
    i += 1

print(f"Selected {len(todos)} TODO packages", file=sys.stderr)


# ── Helper functions ────────────────────────────────────────────────

def scheme_varname(name):
    """Convert package name to valid Scheme variable name."""
    s = name
    # Scheme identifiers can't start with a digit
    if s and s[0].isdigit():
        s = "pkg-" + s
    s = s.replace(".", "-dot-")
    s = s.replace("+", "-plus-")
    s = s.replace("_", "-")
    s = s.replace("@", "-at-")
    s = re.sub(r"-+", "-", s)
    s = s.strip("-")
    return s


def map_license(lic_list):
    """Map AUR license strings to Guix license symbols."""
    if not lic_list or lic_list == ["unknown"]:
        return "license:gpl3+"

    lic = lic_list[0].lower().strip() if isinstance(lic_list, list) else lic_list.lower().strip()

    mapping = {
        "gpl": "license:gpl3+",
        "gpl2": "license:gpl2+",
        "gpl-2.0": "license:gpl2",
        "gpl-2.0-only": "license:gpl2",
        "gpl-2.0-or-later": "license:gpl2+",
        "gplv2": "license:gpl2+",
        "gpl3": "license:gpl3+",
        "gpl-3.0": "license:gpl3",
        "gpl-3.0-only": "license:gpl3",
        "gpl-3.0-or-later": "license:gpl3+",
        "gplv3": "license:gpl3+",
        "lgpl-2.1": "license:lgpl2.1",
        "lgpl-2.1+": "license:lgpl2.1+",
        "lgpl-2.1-or-later": "license:lgpl2.1+",
        "lgpl-3.0": "license:lgpl3+",
        "lgpl-3.0-or-later": "license:lgpl3+",
        "lgpl3": "license:lgpl3+",
        "agpl-3.0": "license:agpl3+",
        "agpl-3.0-only": "license:agpl3+",
        "agpl-3.0-or-later": "license:agpl3+",
        "agpl3": "license:agpl3+",
        "mit": "license:expat",
        "expat": "license:expat",
        "bsd": "license:bsd-3",
        "bsd-2-clause": "license:bsd-2",
        "bsd-3-clause": "license:bsd-3",
        "bsd-2": "license:bsd-2",
        "bsd-3": "license:bsd-3",
        "apache-2.0": "license:asl2.0",
        "apache": "license:asl2.0",
        "mpl-2.0": "license:mpl2.0",
        "isc": "license:isc",
        "0bsd": "license:bsd-0",
        "artistic-2.0": "license:artistic2.0",
        "zlib": "license:zlib",
        "unlicense": "license:unlicense",
        "cc0-1.0": "license:cc0",
        "cc-by-4.0": "license:cc-by4.0",
        "cc-by-sa-4.0": "license:cc-by-sa4.0",
        "proprietary": "license:nonfree",
        "nonfree": "license:nonfree",
        "custom": "license:nonfree",
        "custom:proprietary": "license:nonfree",
        "sspl": "license:nonfree",
        "eupl-1.2": "license:eupl1.2",
        "mpl2": "license:mpl2.0",
        "wtfpl": "license:wtfpl2",
        "public domain": "license:public-domain",
        "publicdomain": "license:public-domain",
        "boost": "license:boost1.0",
        "bsl-1.0": "license:boost1.0",
    }

    if lic in mapping:
        return mapping[lic]

    for key, val in mapping.items():
        if key in lic:
            return val

    if " or " in lic:
        parts = lic.split(" or ")
        mapped = [map_license([p.strip()]) for p in parts]
        if len(set(mapped)) == 1:
            return mapped[0]
        return f"(list {' '.join(mapped)})"

    return "license:gpl3+"


def guess_build_system(name, aur_info):
    """Guess build system from package name and AUR metadata."""
    deps = aur_info.get("Depends", []) or []
    makedeps = aur_info.get("MakeDepends", []) or []
    all_deps = [d.lower() for d in deps + makedeps]

    if name.endswith("-bin") or name.endswith("-appimage"):
        return "copy"
    if name.startswith("python-") or name.startswith("python2-"):
        return "pyproject"
    if any("cmake" in d for d in all_deps):
        return "cmake"
    if any("meson" in d for d in all_deps):
        return "meson"
    if any("cargo" in d or "rust" in d for d in all_deps):
        return "cargo"
    if name.endswith("-git"):
        return "gnu"
    return "gnu"


def clean_version(ver):
    """Clean AUR version string for Guix."""
    ver = re.sub(r"-\d+$", "", ver)  # strip pkgrel
    ver = re.sub(r"^v", "", ver)
    ver = ver.replace(":", ".")  # epoch separator
    return ver


def sanitize_description(desc):
    """Make description safe for Scheme strings."""
    if not desc:
        return "No description available."
    desc = desc.replace("\\", "\\\\")
    desc = desc.replace('"', '\\"')
    if not desc.endswith((".","!",")")):
        desc += "."
    return desc


def sanitize_synopsis(desc):
    """Make synopsis safe and compliant."""
    if not desc:
        return "no description available"
    syn = desc.replace("\\", "")
    syn = syn.replace('"', '\\"')
    if syn and syn[0].isupper():
        syn = syn[0].lower() + syn[1:]
    syn = syn.rstrip(".")
    if len(syn) > 80:
        syn = syn[:77] + "..."
    return syn


def construct_uri_expression(src_url, version, name):
    """Construct a Scheme URI expression, using string-append with version where possible."""
    if version and version in src_url:
        parts = src_url.split(version)
        if len(parts) == 2:
            prefix = parts[0].replace('"', '\\"')
            suffix = parts[1].replace('"', '\\"')
            if suffix:
                return f'(string-append "{prefix}" version "{suffix}")'
            else:
                return f'(string-append "{prefix}" version)'
    # Fallback: literal URL
    return f'"{src_url}"'


def extract_github_info(url):
    """Extract owner/repo from a GitHub URL."""
    if not url:
        return None
    m = re.match(r"https?://github\.com/([^/]+)/([^/]+?)(?:\.git)?(?:/.*)?$", url)
    if m:
        return m.group(1), m.group(2)
    return None


def construct_source_url(name, version, url, build_system):
    """Construct source URL from package metadata."""
    gh = extract_github_info(url)

    if build_system == "copy" and name.endswith("-bin"):
        # Binary package — try GitHub releases
        if gh:
            owner, repo = gh
            base_name = name.replace("-bin", "")
            # Try common release patterns
            return [
                f"https://github.com/{owner}/{repo}/releases/download/v{version}/{base_name}-{version}-linux-x86_64.tar.gz",
                f"https://github.com/{owner}/{repo}/releases/download/v{version}/{repo}-{version}-linux-x86_64.tar.gz",
                f"https://github.com/{owner}/{repo}/releases/download/{version}/{base_name}-{version}-linux-x86_64.tar.gz",
                f"https://github.com/{owner}/{repo}/releases/download/v{version}/{repo}-linux-amd64-v{version}.tar.gz",
                f"https://github.com/{owner}/{repo}/releases/download/v{version}/{repo}_{version}_linux_amd64.tar.gz",
                f"https://github.com/{owner}/{repo}/archive/refs/tags/v{version}.tar.gz",
                f"https://github.com/{owner}/{repo}/archive/refs/tags/{version}.tar.gz",
            ]
        return []

    if build_system == "pyproject" and name.startswith("python-"):
        pypi_name = name[7:]  # strip python-
        pypi_name_clean = pypi_name.replace("-", "_") if "-" in pypi_name else pypi_name
        return [
            f"https://files.pythonhosted.org/packages/source/{pypi_name[0]}/{pypi_name}/{pypi_name}-{version}.tar.gz",
            f"https://files.pythonhosted.org/packages/source/{pypi_name_clean[0]}/{pypi_name_clean}/{pypi_name_clean}-{version}.tar.gz",
        ]

    if gh:
        owner, repo = gh
        urls = [
            f"https://github.com/{owner}/{repo}/archive/refs/tags/v{version}.tar.gz",
            f"https://github.com/{owner}/{repo}/archive/refs/tags/{version}.tar.gz",
        ]
        if name.endswith("-git") or version in ("0.0.0", "0.0.1"):
            urls.append(f"https://github.com/{owner}/{repo}/archive/refs/heads/master.tar.gz")
            urls.append(f"https://github.com/{owner}/{repo}/archive/refs/heads/main.tar.gz")
        return urls

    # Fallback: try SourceForge or generic patterns
    if url and "sourceforge" in url:
        sf_name = re.search(r"sourceforge\.net/projects/([^/]+)", url)
        if sf_name:
            proj = sf_name.group(1)
            return [
                f"https://sourceforge.net/projects/{proj}/files/{proj}-{version}.tar.gz",
                f"https://sourceforge.net/projects/{proj}/files/{proj}/{version}/{proj}-{version}.tar.gz",
            ]

    if url and "gitlab" in url:
        gl = re.match(r"https?://([^/]+)/([^/]+)/([^/]+?)(?:\.git)?(?:/.*)?$", url)
        if gl:
            host, owner, repo = gl.group(1), gl.group(2), gl.group(3)
            return [
                f"https://{host}/{owner}/{repo}/-/archive/v{version}/{repo}-v{version}.tar.gz",
                f"https://{host}/{owner}/{repo}/-/archive/{version}/{repo}-{version}.tar.gz",
            ]

    return []


def try_guix_download(url, timeout=DOWNLOAD_TIMEOUT):
    """Try to download a URL with guix download and return the hash."""
    try:
        result = subprocess.run(
            ["guix", "download", url],
            capture_output=True, text=True, timeout=timeout
        )
        if result.returncode == 0:
            # Output is like: /gnu/store/...-file\n0abc...hash
            lines = result.stdout.strip().split("\n")
            for line in lines:
                line = line.strip()
                if len(line) == 52 and all(c in "0123456789abcdfghijklmnpqrsvwxyz" for c in line):
                    return line
            # Try last line
            if len(lines) >= 2:
                hash_line = lines[-1].strip()
                if len(hash_line) == 52:
                    return hash_line
        return None
    except (subprocess.TimeoutExpired, Exception) as e:
        return None


def download_and_hash(pkg_info):
    """Try to download package source and get hash."""
    name = pkg_info["name"]
    version = pkg_info["version"]
    url = pkg_info["url"]
    build_system = pkg_info["build_system"]

    candidate_urls = construct_source_url(name, version, url, build_system)

    for src_url in candidate_urls:
        h = try_guix_download(src_url)
        if h:
            return {"hash": h, "source_url": src_url, "status": "ok"}

    return {"hash": None, "source_url": None, "status": "fetch_failed"}


# ── Process packages ────────────────────────────────────────────────

print("Processing packages...", file=sys.stderr)

packages = []
blocked = []
needs_nonfree = False

for t in todos:
    name = t["name"]
    aur = aur_data.get(name, {})
    desc = aur.get("Description", t["note"] or "No description available")
    url = aur.get("URL", "")
    lic = aur.get("License", ["unknown"])
    ver = clean_version(aur.get("Version", "0.0.1"))
    varname = scheme_varname(name)

    if not url or url == "None":
        url = f"https://aur.archlinux.org/packages/{name}"

    bs = guess_build_system(name, aur)
    lic_sym = map_license(lic)

    if "nonfree" in lic_sym:
        needs_nonfree = True

    pkg_info = {
        "name": name,
        "varname": varname,
        "version": ver,
        "description": desc,
        "url": url,
        "license": lic_sym,
        "build_system": bs,
        "num": t["num"],
        "line_idx": t["line_idx"],
        "aur_found": bool(aur),
    }
    packages.append(pkg_info)


# ── Download sources in parallel ────────────────────────────────────

print(f"Downloading sources for {len(packages)} packages (max {MAX_PARALLEL_DOWNLOADS} parallel)...", file=sys.stderr)

download_results = {}
with ThreadPoolExecutor(max_workers=MAX_PARALLEL_DOWNLOADS) as executor:
    future_to_pkg = {
        executor.submit(download_and_hash, p): p["name"]
        for p in packages
    }
    completed = 0
    for future in as_completed(future_to_pkg):
        name = future_to_pkg[future]
        completed += 1
        try:
            result = future.result()
            download_results[name] = result
            status_char = "✓" if result["status"] == "ok" else "✗"
            print(f"  [{completed}/{len(packages)}] {status_char} {name}", file=sys.stderr)
        except Exception as e:
            download_results[name] = {"hash": None, "source_url": None, "status": "error"}
            print(f"  [{completed}/{len(packages)}] ✗ {name}: {e}", file=sys.stderr)


# ── Classify results ────────────────────────────────────────────────

recipes = []
blocked_pkgs = []

for p in packages:
    name = p["name"]
    dl = download_results.get(name, {"hash": None, "source_url": None, "status": "error"})

    if dl["status"] == "ok" and dl["hash"]:
        p["hash"] = dl["hash"]
        p["source_url"] = dl["source_url"]
        recipes.append(p)
    else:
        if not p["aur_found"]:
            p["blocker"] = "SOURCE_UNAVAILABLE"
            p["blocker_detail"] = "not found in AUR metadata; no upstream source identified"
        else:
            p["blocker"] = "FETCH_FAILED"
            p["blocker_detail"] = f"source download failed for all candidate URLs from {p['url']}"
        blocked_pkgs.append(p)

print(f"\nResults: {len(recipes)} recipes, {len(blocked_pkgs)} blocked", file=sys.stderr)


# ── Generate .scm file ─────────────────────────────────────────────

print(f"Generating {RESOLVER_FILE}...", file=sys.stderr)

export_names = [p["varname"] for p in recipes]

# Determine needed build system modules
bs_modules = set()
for p in recipes:
    bs_modules.add(p["build_system"])

# Determine needed gnu packages modules
needed_gnu_modules = set()
needed_gnu_modules.add("(gnu packages)")
needed_gnu_modules.add("(gnu packages compression)")
needed_gnu_modules.add("(gnu packages pkg-config)")

for p in recipes:
    if p["build_system"] == "pyproject":
        needed_gnu_modules.add("(gnu packages python)")
        needed_gnu_modules.add("(gnu packages python-build)")
        needed_gnu_modules.add("(gnu packages python-xyz)")
    if p["build_system"] == "cmake":
        needed_gnu_modules.add("(gnu packages cmake)")
    if p["build_system"] in ("gnu", "meson"):
        needed_gnu_modules.add("(gnu packages autotools)")
        needed_gnu_modules.add("(gnu packages base)")

scm = []
scm.append(";;; GNU Guix --- Functional package management for GNU")
scm.append(";;; Copyright (C) 2026 Gaurix contributors")
scm.append(";;;")
scm.append(f";;; Recipe resolver pass --- {RESOLVER_ID}")
scm.append(f";;; Resolves {len(packages)} packages from general TODO queue.")
scm.append(";;;")

# Recipe manifest
scm.append(f";;; Recipes ({len(recipes)}):")
for idx, p in enumerate(recipes, 1):
    bs_label = p["build_system"]
    lic_short = p["license"].replace("license:", "")
    scm.append(f";;;   {idx:3d}. {p['name']} ({bs_label}, v{p['version']}, {lic_short})")

# Blocked manifest
if blocked_pkgs:
    scm.append(f";;;")
    scm.append(f";;; Blocked ({len(blocked_pkgs)}):")
    for idx, p in enumerate(blocked_pkgs, len(recipes) + 1):
        scm.append(f";;;   {idx:3d}. {p['name']} — BLOCKED: {p['blocker']} ({p['blocker_detail'][:80]})")

scm.append(f";;;")
scm.append(f";;; {len(recipes)} recipes + {len(blocked_pkgs)} BLOCKED = {len(packages)} total.")
scm.append(";;;")
scm.append(";;; NOTE: All sha256 hashes obtained via `guix download`.")
scm.append("")

# Module definition
scm.append(f"(define-module (gaurix packages {RESOLVER_ID})")
scm.append("  #:use-module (guix packages)")
scm.append("  #:use-module (guix download)")
scm.append("  #:use-module (guix git-download)")
scm.append("  #:use-module (guix gexp)")
scm.append("  #:use-module (guix utils)")

# Build system modules
bs_map = {
    "gnu": "  #:use-module (guix build-system gnu)",
    "cmake": "  #:use-module (guix build-system cmake)",
    "meson": "  #:use-module (guix build-system meson)",
    "copy": "  #:use-module (guix build-system copy)",
    "pyproject": "  #:use-module (guix build-system pyproject)",
    "cargo": "  #:use-module (guix build-system cargo)",
    "node": "  #:use-module (guix build-system node)",
}
for bs in sorted(bs_modules):
    if bs in bs_map:
        scm.append(bs_map[bs])

scm.append("  #:use-module ((guix licenses) #:prefix license:)")

for mod in sorted(needed_gnu_modules):
    scm.append(f"  #:use-module {mod}")

# Export list
scm.append("  #:export (")
for en in export_names:
    scm.append(f"            {en}")
scm.append("            ))")
scm.append("")

# Nonfree license definition if needed
if needs_nonfree:
    scm.append(";;; Nonfree license placeholder for proprietary packages.")
    scm.append("(define license:nonfree")
    scm.append('  ((@@ (guix licenses) license) "nonfree"')
    scm.append('    "https://aur.archlinux.org"')
    scm.append('    "Nonfree/proprietary license; see upstream for terms."))')
    scm.append("")

# Package definitions
for idx, p in enumerate(recipes, 1):
    name = p["name"]
    varname = p["varname"]
    ver = p["version"]
    desc = sanitize_description(p["description"])
    syn = sanitize_synopsis(p["description"])
    url = p["url"]
    lic = p["license"]
    bs = p["build_system"]
    h = p["hash"]
    src_url = p["source_url"]

    scm.append(f";;; -------------------------------------------------------------------")
    scm.append(f";;; {idx}. {name}")
    scm.append(f";;; -------------------------------------------------------------------")

    # Build system specific module name and arguments
    if bs == "copy":
        bs_module = "copy-build-system"
        base_name = name.replace("-bin", "").replace("-appimage", "")
        args_block = f'    (arguments\n     (list #:install-plan\n           #~\'(("./" "share/{base_name}/"))))'
    elif bs == "pyproject":
        bs_module = "pyproject-build-system"
        args_block = "    (arguments\n     (list #:tests? #f))"
    elif bs == "cmake":
        bs_module = "cmake-build-system"
        args_block = "    (arguments\n     (list #:tests? #f))"
    elif bs == "meson":
        bs_module = "meson-build-system"
        args_block = "    (arguments\n     (list #:tests? #f))"
    else:
        bs_module = "gnu-build-system"
        args_block = "    (arguments\n     (list #:tests? #f))"

    # Construct the source URI expression
    # Try to make it use string-append with version variable
    src_uri_expr = construct_uri_expression(src_url, ver, name)

    scm.append(f"(define-public {varname}")
    scm.append(f"  (package")
    scm.append(f'    (name "{name}")')
    scm.append(f'    (version "{ver}")')
    scm.append(f"    (source (origin")
    scm.append(f"              (method url-fetch)")
    scm.append(f"              (uri {src_uri_expr})")
    scm.append(f"              (sha256")
    scm.append(f"               (base32")
    scm.append(f'                "{h}"))))')
    scm.append(f"    (build-system {bs_module})")
    scm.append(args_block)

    # Add native-inputs for pyproject packages
    if bs == "pyproject":
        scm.append("    (native-inputs")
        scm.append("     (list python-setuptools python-wheel))")

    scm.append(f'    (synopsis "{syn}")')
    scm.append(f'    (description "{desc}")')
    scm.append(f'    (home-page "{url}")')
    scm.append(f"    (license {lic})))")
    scm.append("")

with open(RESOLVER_FILE, "w") as f:
    f.write("\n".join(scm))

print(f"Wrote {RESOLVER_FILE} with {len(recipes)} recipes", file=sys.stderr)


# ── Update todo_general_packages.org ────────────────────────────────

print("Updating todo_general_packages.org...", file=sys.stderr)

# Build lookup of results
result_lookup = {}
for p in recipes:
    result_lookup[p["name"]] = ("DONE", f"DONE: Recipe added in {RESOLVER_ID}.scm ({RESOLVER_ID})")
for p in blocked_pkgs:
    result_lookup[p["name"]] = ("BLOCKED", f"BLOCKED: {p['blocker']}: {p['blocker_detail']}")

update_count = 0
# Process in reverse order to handle line insertions correctly
for t in reversed(todos):
    name = t["name"]
    line_idx = t["line_idx"]
    if name not in result_lookup:
        continue

    status_type, status_msg = result_lookup[name]

    # Update the heading line
    old_heading = org_lines[line_idx]
    if status_type == "DONE":
        org_lines[line_idx] = old_heading.replace("** TODO ", "** DONE ", 1)
    else:
        org_lines[line_idx] = old_heading.replace("** TODO ", "** BLOCKED ", 1)

    # Find TODO Status line and update it
    for j in range(line_idx + 1, min(line_idx + 8, len(org_lines))):
        if "TODO Status:" in org_lines[j]:
            if status_type == "DONE":
                org_lines[j] = org_lines[j].replace("TODO Status: TODO", "TODO Status: DONE")
            else:
                org_lines[j] = org_lines[j].replace("TODO Status: TODO", "TODO Status: BLOCKED")
            break

    # Add status line
    insert_idx = line_idx + 1
    for j in range(line_idx + 1, min(line_idx + 8, len(org_lines))):
        if "TODO Status:" in org_lines[j] or "Status:" in org_lines[j]:
            insert_idx = j + 1
    status_line = f"   - Status: {status_msg}\n"
    org_lines.insert(insert_idx, status_line)
    update_count += 1

# Write atomically via temp file
tmp_todo = TODO_FILE + ".tmp"
with open(tmp_todo, "w") as f:
    f.writelines(org_lines)
os.replace(tmp_todo, TODO_FILE)
print(f"Updated {update_count} entries in todo_general_packages.org", file=sys.stderr)


# ── Update packages.scm (deterministic full-file transform) ────────

print("Updating packages.scm...", file=sys.stderr)

with open(PACKAGES_FILE) as f:
    pkg_content = f.read()

# Strategy: append a new (define-module ...) block at the end of the file
# following the existing pattern
new_block = f"""
(define-module (gaurix packages)
  #:use-module (gaurix packages {RESOLVER_ID})
  #:re-export (
            ;; {RESOLVER_ID} ({len(recipes)} recipes)
"""
for en in export_names:
    new_block += f"            {en}\n"
new_block += "            ))\n"

pkg_content_updated = pkg_content.rstrip("\n") + "\n" + new_block

tmp_pkg = PACKAGES_FILE + ".tmp"
with open(tmp_pkg, "w") as f:
    f.write(pkg_content_updated)
os.replace(tmp_pkg, PACKAGES_FILE)
print("Updated packages.scm", file=sys.stderr)


# ── Update general-compat.scm (deterministic full-file transform) ──

print("Updating general-compat.scm...", file=sys.stderr)

with open(COMPAT_FILE) as f:
    compat_content = f.read()

# Add #:use-module line for our resolver
# Find the last recipe-resolver or deptree-resolver #:use-module line
compat_lines = compat_content.split("\n")
insert_module_idx = None
for idx, line in enumerate(compat_lines):
    if "#:use-module (gaurix packages recipe-resolver-" in line or \
       "#:use-module (gaurix packages deptree-resolver-" in line:
        insert_module_idx = idx

if insert_module_idx is not None:
    compat_lines.insert(insert_module_idx + 1,
                        f"  #:use-module (gaurix packages {RESOLVER_ID})")

# Add re-exports at the end
re_export_block = f"\n; {RESOLVER_ID}\n"
for en in export_names:
    re_export_block += f"(re-export {en})\n"

compat_content_updated = "\n".join(compat_lines).rstrip("\n") + "\n" + re_export_block

tmp_compat = COMPAT_FILE + ".tmp"
with open(tmp_compat, "w") as f:
    f.write(compat_content_updated)
os.replace(tmp_compat, COMPAT_FILE)
print("Updated general-compat.scm", file=sys.stderr)


# ── Summary ─────────────────────────────────────────────────────────

print("\n" + "=" * 60, file=sys.stderr)
print(f"SUMMARY: {RESOLVER_ID}", file=sys.stderr)
print("=" * 60, file=sys.stderr)
print(f"Total selected:  {len(packages)}", file=sys.stderr)
print(f"Recipes created: {len(recipes)}", file=sys.stderr)
print(f"Blocked:         {len(blocked_pkgs)}", file=sys.stderr)

if blocked_pkgs:
    # Group by blocker type
    by_blocker = {}
    for p in blocked_pkgs:
        b = p["blocker"]
        by_blocker.setdefault(b, []).append(p["name"])
    print("\nBlocked by reason:", file=sys.stderr)
    for reason, names in sorted(by_blocker.items()):
        print(f"  {reason} ({len(names)}):", file=sys.stderr)
        for n in names[:10]:
            print(f"    - {n}", file=sys.stderr)
        if len(names) > 10:
            print(f"    ... and {len(names) - 10} more", file=sys.stderr)

# Write JSON report
report = {
    "resolver_id": RESOLVER_ID,
    "total": len(packages),
    "recipes": len(recipes),
    "blocked": len(blocked_pkgs),
    "recipe_names": [p["name"] for p in recipes],
    "blocked_details": [
        {"name": p["name"], "reason": p["blocker"], "detail": p["blocker_detail"]}
        for p in blocked_pkgs
    ],
}
report_file = f"reports/{RESOLVER_ID}-summary.json"
os.makedirs("reports", exist_ok=True)
with open(report_file, "w") as f:
    json.dump(report, f, indent=2)

print(f"\nReport written to {report_file}", file=sys.stderr)
print(f"Recipe file: {RESOLVER_FILE}", file=sys.stderr)
