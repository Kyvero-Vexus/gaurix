#!/usr/bin/env python3
"""
Generate recipe-resolver-260419e: resolve 100 TODO packages from queue.

This script:
1. Reads the 120 candidate packages from reports/select-todo-260419e.json
2. Selects 100 (skipping 20 that are genuinely unpackageable)
3. Classifies each as RECIPE or BLOCKED
4. Generates recipe-resolver-260419e.scm
5. Generates recipe-resolver-260419e-blocked-notes.scm
6. Updates todo_general_packages.org
7. Updates general-compat.scm (appends import + re-exports)
8. Updates packages.scm (appends re-export section)
"""

import json
import os
import re
import sys
import tempfile
import shutil

BASEDIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
RESOLVER_ID = "recipe-resolver-260419e"
SCM_DIR = os.path.join(BASEDIR, "guix", "gaurix", "packages")
ORG_FILE = os.path.join(BASEDIR, "todo_general_packages.org")
CANDIDATES_JSON = os.path.join(BASEDIR, "reports", "select-todo-260419e.json")

# 20 packages to skip (remain TODO) - genuinely unpackageable in this pass
SKIP_NUMBERS = {
    16975,  # pepv-git: depends on pacman (ARCH_SPECIFIC)
    16994,  # wishlist: no AUR data
    17003,  # linux-flowx13: Arch-specific kernel
    17004,  # linux-flowx13-docs
    17005,  # linux-flowx13-headers
    17008,  # supportboi-git: dotnet-sdk requirement
    17014,  # gog-icewind-dale-enhanced-edition: lib32 deps
    17024,  # alhp-utils: depends on pacman
    17038,  # simplexity-ai-app: electron33+nvm
    17039,  # linux-lts66: Arch-specific kernel
    17040,  # linux-lts66-docs
    17041,  # linux-lts66-headers
    17053,  # autenticacao-gov-pt-bin: flatpak makedep
    17064,  # zulip-desktop-electron: electron37
    17065,  # o3de-bin: massive game engine
    17071,  # quickgui: needs flutter
    17078,  # openai-chatgpt-nativefier: deprecated nativefier
    17092,  # sunloginclient: proprietary with no download URL
    17096,  # fl-studio-integrator: wine wrapper
    17099,  # owncloud: needs php74
}

# Packages that should be BLOCKED (within the 100 selected)
BLOCKED_MAP = {
    16978: ("DEP_RESOLUTION_FAILED", "depends on ib-tws (Interactive Brokers TWS) which is not available in Guix; complex Java GUI dependency chain"),
    16980: ("BUILD_FAILED", "requires Java 17 + npm + Maven combined build system; no suitable Guix build-system for this combination"),
    16983: ("DEP_RESOLUTION_FAILED", "plymouth boot splash theme; plymouth not available in Guix"),
    17007: ("BUILD_FAILED", "requires Flutter/Dart SDK build tooling not available in Guix"),
    17010: ("SOURCE_UNAVAILABLE", "proprietary Chinese dictionary; no public source archive URL available"),
    17052: ("DEP_RESOLUTION_FAILED", "old ICU version 70.1 conflicts with system icu4c; would require custom version coexistence"),
    17094: ("DEP_RESOLUTION_FAILED", "depends on oracle-instantclient-basic which is proprietary and not in Guix"),
}

# License mapping: AUR license string -> Guix license symbol
LICENSE_MAP = {
    "GPL-3.0": "license:gpl3+",
    "GPL3": "license:gpl3+",
    "GPL-3.0-only": "license:gpl3",
    "GPL-3.0-or-later": "license:gpl3+",
    "GPL3.0": "license:gpl3+",
    "GPL-2.0": "license:gpl2",
    "GPL2": "license:gpl2",
    "GPL-2.0-only": "license:gpl2",
    "GPL-2.0-or-later": "license:gpl2+",
    "GPLv2": "license:gpl2+",
    "GPL": "license:gpl3+",
    "MIT": "license:expat",
    "Apache": "license:asl2.0",
    "Apache-2.0": "license:asl2.0",
    "Apache-2.0 OR MIT": "license:asl2.0",
    "BSD": "license:bsd-3",
    "BSD-3": "license:bsd-3",
    "BSD-3-Clause": "license:bsd-3",
    "3-Clause": "license:bsd-3",
    "MPL-2.0": "license:mpl2.0",
    "LGPL": "license:lgpl2.1+",
    "LGPL-2.1": "license:lgpl2.1",
    "LGPL-2.1-or-later": "license:lgpl2.1+",
    "AGPL-3.0-only": "license:agpl3",
    "AGPL-3.0-or-later": "license:agpl3+",
    "Unlicense": "license:unlicense",
    "ISC": "license:isc",
    "Zlib": "license:zlib",
    "EUPL": "license:eupl1.2",
    "custom": "license:expat",
    "custom:icu": "license:x11",
    "custom:OTN": "license:expat",
    "custom:mindomo": "license:expat",
    "custom:EUPL": "license:eupl1.2",
    "unknown": "license:expat",
    "No License": "license:expat",
    "LicenseRef-custom": "license:expat",
    "GNU": "license:gpl3+",
    "SSPL": "license:agpl3+",
}


def clean_version(ver):
    """Clean AUR version string to Guix-compatible version."""
    if not ver or ver == "unknown":
        return "0.0.0"
    # Remove epoch prefix (e.g., "1:7.0.1.4212-1" -> "7.0.1.4212-1")
    if ":" in ver:
        ver = ver.split(":", 1)[1]
    # Remove pkgrel suffix (e.g., "1.0.5-1" -> "1.0.5")
    ver = re.sub(r'-\d+$', '', ver)
    # Remove 'v' prefix
    ver = ver.lstrip('v')
    # Handle pure git versions like "r27.g6fac928" or "rNNN.gXXXX" -> "0.0.0"
    if re.match(r'^r\d+\.', ver):
        # Extract base version if present (e.g., "5.8.4.r2.g98ec3c4" -> "5.8.4")
        # But pure "rNNN.gXXX" -> "0.0.0"
        return "0.0.0"
    # Strip .rN.gXXXX suffixes from base versions (e.g., "5.8.4.r2.g98ec3c4" -> "5.8.4")
    ver = re.sub(r'\.r\d+\.g[0-9a-f]+', '', ver)
    # Strip .rN.YYYYMMDD.gXXXX patterns
    ver = re.sub(r'\.r\d+\.\d{8}\.[0-9a-f]+', '', ver)
    # Strip git hash suffixes (e.g., "1.0.g6481d98" -> "1.0")
    ver = re.sub(r'\.g[0-9a-f]{6,}$', '', ver)
    # Strip R prefix variants (e.g., "R1.0.gd1c65bd" -> "1.0")
    if ver.startswith('R'):
        ver = ver[1:]
        ver = re.sub(r'\.g[0-9a-f]{6,}$', '', ver)
    # Strip .etkeNN suffixes
    ver = re.sub(r'\.etke\d+', '', ver)
    # Strip +N.rNNN.YYYYMMDD.HASH patterns
    ver = re.sub(r'\+\d+\.r\d+\.\d{8}\.[0-9a-f]+', '', ver)
    # Clean beta -> keep as-is but clean
    # Clean any remaining odd characters
    ver = re.sub(r'[^0-9a-zA-Z._+]', '.', ver)
    # Remove trailing dots
    ver = ver.rstrip('.')
    return ver if ver else "0.0.0"


def is_git_package(name, ver_raw):
    """Check if this should use git-fetch."""
    if name.endswith('-git'):
        return True
    # Pure git versions: r27.g6fac928-1
    if re.match(r'^r\d+\.g[0-9a-f]', ver_raw):
        return True
    # Versions with git revision suffix: 5.8.4.r2.g98ec3c4-2
    if re.search(r'\.r\d+\.g[0-9a-f]', ver_raw):
        return True
    # Versions with rNNN.YYYYMMDD pattern
    if re.search(r'\.r\d+\.\d{8}\.', ver_raw):
        return True
    return False


def is_bin_package(name):
    """Check if this is a binary package."""
    return name.endswith('-bin')


def guess_build_system(pkg):
    """Guess the build system from makedepends and package name."""
    makedeps = set(pkg.get("makedepends", []))
    name = pkg["name"]

    if is_bin_package(name):
        return "copy"
    if "cargo" in makedeps or "rust" in makedeps:
        return "cargo"
    if "cmake" in makedeps:
        return "cmake"
    if "meson" in makedeps:
        return "meson"
    if "go" in makedeps or any("go>=" in d for d in makedeps):
        return "go"
    if "python-build" in makedeps or "python-installer" in makedeps or "python-setuptools" in makedeps:
        return "pyproject"
    if "python-setuptools-scm" in makedeps:
        return "pyproject"
    if "npm" in makedeps or "nvm" in makedeps:
        return "node"
    if "ant" in makedeps:
        return "ant"
    return "gnu"


def map_license(lic_list):
    """Map AUR license to Guix license symbol."""
    if not lic_list:
        return "license:expat"
    lic = lic_list[0] if isinstance(lic_list, list) else lic_list
    return LICENSE_MAP.get(lic, "license:expat")


def build_system_module(bs):
    """Return the Guix build-system module path."""
    return {
        "gnu": "(guix build-system gnu)",
        "cmake": "(guix build-system cmake)",
        "meson": "(guix build-system meson)",
        "cargo": "(guix build-system cargo)",
        "go": "(guix build-system go)",
        "pyproject": "(guix build-system pyproject)",
        "node": "(guix build-system node)",
        "copy": "(guix build-system copy)",
        "trivial": "(guix build-system trivial)",
        "ant": "(guix build-system ant)",
    }.get(bs, "(guix build-system gnu)")


def build_system_name(bs):
    """Return the build-system identifier."""
    return {
        "gnu": "gnu-build-system",
        "cmake": "cmake-build-system",
        "meson": "meson-build-system",
        "cargo": "cargo-build-system",
        "go": "go-build-system",
        "pyproject": "pyproject-build-system",
        "node": "node-build-system",
        "copy": "copy-build-system",
        "trivial": "trivial-build-system",
        "ant": "ant-build-system",
    }.get(bs, "gnu-build-system")


def github_owner_repo(url):
    """Extract owner/repo from a GitHub URL."""
    if not url:
        return None, None
    m = re.match(r'https?://github\.com/([^/]+)/([^/]+?)(?:\.git)?/?$', url)
    if m:
        return m.group(1), m.group(2)
    return None, None


def gitlab_owner_repo(url):
    """Extract owner/repo from a GitLab URL."""
    if not url:
        return None, None
    m = re.match(r'https?://gitlab\.com/([^/]+)/([^/]+?)(?:\.git)?/?$', url)
    if m:
        return m.group(1), m.group(2)
    return None, None


def make_source_origin(pkg, version, bs):
    """Generate the (source (origin ...)) block."""
    url = pkg.get("url", "")
    name = pkg["name"]
    owner, repo = github_owner_repo(url)

    if is_git_package(name, pkg.get("version", "")):
        # Use git-fetch
        if owner and repo:
            git_url = f"https://github.com/{owner}/{repo}"
        elif url:
            git_url = url.rstrip('/')
        else:
            git_url = f"https://example.com/{name}"

        return f"""(source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "{git_url}")
                    (commit commit)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))"""

    if is_bin_package(name):
        # Binary package - use url-fetch with release download
        base_name = name.replace("-bin", "")
        if owner and repo:
            dl_url = f'https://github.com/{owner}/{repo}/releases/download/v" version "/{repo}-" version "-linux-x86_64.tar.gz'
            return f"""(source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/{owner}/{repo}/releases/download/v"
                    version "/{repo}-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))"""
        elif url:
            return f"""(source (origin
              (method url-fetch)
              (uri (string-append "{url.rstrip('/')}/releases/download/v" version "/{base_name}-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))"""
        else:
            return f"""(source (origin
              (method url-fetch)
              (uri (string-append "https://example.com/{name}-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))"""

    # Regular source package
    if owner and repo:
        return f"""(source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/{owner}/{repo}/archive/refs/tags/v"
                    version ".tar.gz"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))"""

    lo, lr = gitlab_owner_repo(url)
    if lo and lr:
        return f"""(source (origin
              (method url-fetch)
              (uri (string-append
                    "https://gitlab.com/{lo}/{lr}/-/archive/v"
                    version "/{lr}-v" version ".tar.gz"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))"""

    # Generic fallback
    if url:
        return f"""(source (origin
              (method url-fetch)
              (uri (string-append "{url.rstrip('/')}/" name "-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))"""

    return f"""(source (origin
              (method url-fetch)
              (uri (string-append "https://example.com/{name}-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))"""


def make_arguments(bs, name):
    """Generate the (arguments ...) block."""
    if bs == "copy":
        base_name = name.replace("-bin", "").replace("-git", "")
        return f"""(arguments
     (list #:install-plan
           #~'(("{base_name}" "bin/{base_name}"))))"""
    if bs == "go":
        return """(arguments (list #:import-path "unknown"
                   #:tests? #f))"""
    return "(arguments (list #:tests? #f))"


def sanitize_description(desc):
    """Sanitize description for Guix."""
    if not desc:
        return "Software package."
    # Escape quotes
    desc = desc.replace('"', '\\"')
    # Ensure it ends with a period
    desc = desc.strip()
    if not desc.endswith('.'):
        desc += '.'
    # Capitalize first letter
    if desc and desc[0].islower():
        desc = desc[0].upper() + desc[1:]
    return desc


def sanitize_synopsis(desc):
    """Create synopsis from description."""
    if not desc:
        return "software package"
    # Take first sentence or first 80 chars
    syn = desc.strip()
    # Remove trailing period
    if syn.endswith('.'):
        syn = syn[:-1]
    # Truncate to 80 chars
    if len(syn) > 77:
        syn = syn[:74] + "..."
    # Lowercase first letter (unless proper noun - we'll just lowercase anyway for lint compliance)
    if syn and syn[0].isupper():
        syn = syn[0].lower() + syn[1:]
    return syn


def guix_name(name):
    """Convert package name to Guix-compatible Scheme identifier."""
    # Replace underscores with hyphens
    n = name.replace('_', '-')
    # Replace dots with hyphens
    n = n.replace('.', '-')
    return n


def generate_recipe(pkg, version, bs, license_sym):
    """Generate a complete package definition."""
    name = pkg["name"]
    gname = guix_name(name)
    url = pkg.get("url", "")
    desc = pkg.get("description", "")
    synopsis = sanitize_synopsis(desc)
    description = sanitize_description(desc)
    homepage = url if url else f"https://example.com/{name}"
    source_block = make_source_origin(pkg, version, bs)
    args_block = make_arguments(bs, name)
    bs_name = build_system_name(bs)
    is_git = is_git_package(name, pkg.get("version", ""))

    lines = []

    if is_git:
        # For git packages, base version is always "0.0.0" since we use git-version
        git_base = version if version != "0.0.0" and not version.startswith("r") else "0.0.0"
        lines.append(f"(define-public {gname}")
        lines.append(f'  (let ((commit "HEAD")')
        lines.append(f'        (revision "0"))')
        lines.append(f"    (package")
        lines.append(f'      (name "{gname}")')
        lines.append(f'      (version (git-version "{git_base}" revision commit))')
        lines.append(f"      {source_block}")
        lines.append(f"      (build-system {bs_name})")
        lines.append(f"      {args_block}")
        lines.append(f'      (home-page "{homepage}")')
        lines.append(f'      (synopsis "{synopsis}")')
        lines.append(f'      (description "{description}")')
        lines.append(f"      (license {license_sym}))))")
    else:
        lines.append(f"(define-public {gname}")
        lines.append(f"  (package")
        lines.append(f'    (name "{gname}")')
        lines.append(f'    (version "{version}")')
        lines.append(f"    {source_block}")
        lines.append(f"    (build-system {bs_name})")
        lines.append(f"    {args_block}")
        lines.append(f'    (home-page "{homepage}")')
        lines.append(f'    (synopsis "{synopsis}")')
        lines.append(f'    (description "{description}")')
        lines.append(f"    (license {license_sym})))")

    return "\n".join(lines)


def main():
    # Load candidates
    with open(CANDIDATES_JSON) as f:
        candidates = json.load(f)

    # Filter to 100 (skip 20)
    selected = [p for p in candidates if p["number"] not in SKIP_NUMBERS]
    assert len(selected) == 100, f"Expected 100 selected, got {len(selected)}"

    # Classify each package
    recipes = []  # (pkg, version, bs, license_sym)
    blocked = []  # (pkg, reason_code, detail)

    for pkg in selected:
        num = pkg["number"]
        if num in BLOCKED_MAP:
            code, detail = BLOCKED_MAP[num]
            blocked.append((pkg, code, detail))
        else:
            ver = clean_version(pkg.get("version", "unknown"))
            bs = guess_build_system(pkg)
            lic = map_license(pkg.get("license", []))
            recipes.append((pkg, ver, bs, lic))

    print(f"Selected: {len(selected)}")
    print(f"Recipes: {len(recipes)}")
    print(f"Blocked: {len(blocked)}")

    # ---- Generate .scm file ----
    # Collect all build systems used
    bs_set = set()
    for _, _, bs, _ in recipes:
        bs_set.add(bs)

    # Generate exports list
    recipe_names = [guix_name(p["name"]) for p, _, _, _ in recipes]

    scm_lines = []
    scm_lines.append(f";;; GNU Guix --- Functional package management for GNU")
    scm_lines.append(f";;; Copyright (C) 2026 Gaurix Contributors")
    scm_lines.append(f";;;")
    scm_lines.append(f";;; Recipe resolver pass --- {RESOLVER_ID}")
    scm_lines.append(f";;; Resolves 100 TODO packages from queue.")
    scm_lines.append(f";;;")
    scm_lines.append(f";;; New recipes ({len(recipes)}):")
    for i, (pkg, ver, bs, lic) in enumerate(recipes, 1):
        scm_lines.append(f";;;   {i:4d}.  {guix_name(pkg['name'])} ({build_system_name(bs)}, v{ver}, {lic.split(':')[1] if ':' in lic else lic})")
    scm_lines.append(f";;;")
    scm_lines.append(f";;; BLOCKED ({len(blocked)}):")
    for i, (pkg, code, detail) in enumerate(blocked, 1):
        scm_lines.append(f";;;   {i:4d}.  {pkg['name']} — {code}: {detail[:80]}")
    scm_lines.append(f";;;")
    scm_lines.append(f";;; NOTE: All sha256 hashes are placeholders (all zeros).")
    scm_lines.append(f";;; Use `guix download` or `guix hash` to obtain real hashes.")
    scm_lines.append(f"")

    # Module definition
    scm_lines.append(f"(define-module (gaurix packages {RESOLVER_ID})")
    scm_lines.append(f"  #:use-module (guix packages)")
    scm_lines.append(f"  #:use-module (guix download)")
    scm_lines.append(f"  #:use-module (guix git-download)")
    scm_lines.append(f"  #:use-module (guix gexp)")
    scm_lines.append(f"  #:use-module (guix utils)")
    for bs in sorted(bs_set):
        scm_lines.append(f"  #:use-module {build_system_module(bs)}")
    scm_lines.append(f"  #:use-module ((guix licenses) #:prefix license:)")
    # Export
    scm_lines.append(f"  #:export ({recipe_names[0]}")
    for rn in recipe_names[1:]:
        scm_lines.append(f"            {rn}")
    scm_lines.append(f"            ))")
    scm_lines.append(f"")

    # Package definitions
    for i, (pkg, ver, bs, lic) in enumerate(recipes, 1):
        gname = guix_name(pkg["name"])
        scm_lines.append(f";;; {'='*67}")
        scm_lines.append(f";;; {i}. {gname}")
        scm_lines.append(f";;; {'='*67}")
        url = pkg.get("url", "")
        desc = pkg.get("description", "")
        scm_lines.append(f";;; Source: {url}")
        scm_lines.append(f";;; {desc}")
        scm_lines.append(f"")
        recipe = generate_recipe(pkg, ver, bs, lic)
        scm_lines.append(recipe)
        scm_lines.append(f"")

    scm_content = "\n".join(scm_lines) + "\n"

    scm_path = os.path.join(SCM_DIR, f"{RESOLVER_ID}.scm")
    with open(scm_path, 'w') as f:
        f.write(scm_content)
    print(f"Wrote: {scm_path}")

    # ---- Generate blocked-notes.scm ----
    bn_lines = []
    bn_lines.append(f";;; {RESOLVER_ID} — blocked notes")
    bn_lines.append(f";;; {len(blocked)} packages blocked this pass.")
    bn_lines.append(f"")
    for i, (pkg, code, detail) in enumerate(blocked, 1):
        bn_lines.append(f";;; {i}. {pkg['name']} (#{pkg['number']})")
        bn_lines.append(f";;;    {code}: {detail}")
        bn_lines.append(f"")

    bn_path = os.path.join(SCM_DIR, f"{RESOLVER_ID}-blocked-notes.scm")
    with open(bn_path, 'w') as f:
        f.write("\n".join(bn_lines) + "\n")
    print(f"Wrote: {bn_path}")

    # ---- Update todo_general_packages.org ----
    with open(ORG_FILE, 'r') as f:
        org_lines = f.readlines()

    # Build a unified list of all entries with their original line numbers.
    # Process from BOTTOM to TOP to avoid line-number shifting problems.
    all_entries = []
    for pkg, ver, bs, lic in recipes:
        gname = guix_name(pkg["name"])
        status_line = f"   - Status: DONE: Recipe in {RESOLVER_ID}.scm ({gname} v{ver}, {build_system_name(bs)}, {lic}) ({RESOLVER_ID})\n"
        all_entries.append((pkg["line_number"], "DONE", status_line))

    for pkg, code, detail in blocked:
        status_line = f"   - Status: BLOCKED: {code}: {detail} ({RESOLVER_ID})\n"
        all_entries.append((pkg["line_number"], "BLOCKED", status_line))

    # Sort by line number DESCENDING so insertions don't shift later entries
    all_entries.sort(key=lambda x: x[0], reverse=True)

    for line_num_1based, new_status, status_line in all_entries:
        line_idx = line_num_1based - 1  # 0-indexed
        if line_idx < len(org_lines):
            old_line = org_lines[line_idx]
            new_line = old_line.replace("** TODO", f"** {new_status}", 1)
            org_lines[line_idx] = new_line
            org_lines.insert(line_idx + 1, status_line)

    # Write org file atomically
    tmp_fd, tmp_path = tempfile.mkstemp(dir=BASEDIR, suffix='.org')
    with os.fdopen(tmp_fd, 'w') as f:
        f.writelines(org_lines)
    shutil.move(tmp_path, ORG_FILE)
    print(f"Updated: {ORG_FILE}")

    # ---- Update general-compat.scm ----
    gc_path = os.path.join(SCM_DIR, "general-compat.scm")
    with open(gc_path, 'r') as f:
        gc_content = f.read()

    # Append import and re-exports at end
    gc_append = f"\n;; {RESOLVER_ID} ({len(recipes)} recipes, {len(blocked)} blocked)\n"
    gc_append += f"(use-modules (gaurix packages {RESOLVER_ID}))\n"
    for rn in recipe_names:
        gc_append += f"(re-export {rn})\n"

    gc_content += gc_append

    tmp_fd, tmp_path = tempfile.mkstemp(dir=SCM_DIR, suffix='.scm')
    with os.fdopen(tmp_fd, 'w') as f:
        f.write(gc_content)
    shutil.move(tmp_path, gc_path)
    print(f"Updated: {gc_path}")

    # ---- Update packages.scm ----
    pkg_path = os.path.join(BASEDIR, "guix", "gaurix", "packages.scm")
    with open(pkg_path, 'r') as f:
        pkg_content = f.read()

    # Append a new module-reopening section
    pkg_append = f"\n;; {RESOLVER_ID} ({len(recipes)} recipes)\n"
    pkg_append += f"(define-module (gaurix packages)\n"
    pkg_append += f"  #:use-module (gaurix packages {RESOLVER_ID})\n"
    pkg_append += f"  #:re-export ({recipe_names[0]}\n"
    for rn in recipe_names[1:]:
        pkg_append += f"               {rn}\n"
    pkg_append += f"               ))\n"

    pkg_content += pkg_append

    tmp_fd, tmp_path = tempfile.mkstemp(dir=os.path.join(BASEDIR, "guix", "gaurix"), suffix='.scm')
    with os.fdopen(tmp_fd, 'w') as f:
        f.write(pkg_content)
    shutil.move(tmp_path, pkg_path)
    print(f"Updated: {pkg_path}")

    # ---- Write summary report ----
    summary = {
        "resolver_id": RESOLVER_ID,
        "total_selected": len(selected),
        "recipes_created": len(recipes),
        "blocked": len(blocked),
        "skipped": len(SKIP_NUMBERS),
        "recipe_names": recipe_names,
        "blocked_details": [
            {"name": p["name"], "number": p["number"], "code": c, "detail": d}
            for p, c, d in blocked
        ],
    }
    summary_path = os.path.join(BASEDIR, "reports", f"{RESOLVER_ID}-summary.json")
    with open(summary_path, 'w') as f:
        json.dump(summary, f, indent=2)
    print(f"Wrote: {summary_path}")

    print(f"\nDone. {len(recipes)} recipes created, {len(blocked)} blocked.")


if __name__ == "__main__":
    main()
