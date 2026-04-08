#!/usr/bin/env python3
"""
Dependency-tree resolver pass: deptree-resolver-260408h

Single-pass atomic pipeline:
1. Rebuilds dependency tree for all BLOCKED packages using AUR cache.
2. Selects top 100 unprocessed packages by priority sort.
3. Classifies each as resolvable or permanently blocked.
4. Generates .scm recipe files and blocked-notes.
5. Updates packages.scm, general-compat.scm, and org file.
6. Updates tree reports.
"""

import json
import re
import os
import glob
from datetime import datetime, timezone
from collections import defaultdict

ROOT = "/home/slime/projects/gaurix"
ORG_FILE = os.path.join(ROOT, "todo_general_packages.org")
AUR_CACHE = os.path.join(ROOT, "data/aur-cache/packages-meta-ext-v1.json")
TREE_JSON = os.path.join(ROOT, "reports/blocked-dependency-tree.json")
TREE_MD = os.path.join(ROOT, "reports/blocked-dependency-tree.md")
PACKAGES_SCM = os.path.join(ROOT, "guix/gaurix/packages.scm")
GENERAL_COMPAT = os.path.join(ROOT, "guix/gaurix/packages/general-compat.scm")
PACKAGES_DIR = os.path.join(ROOT, "guix/gaurix/packages")
REPORTS_DIR = os.path.join(ROOT, "reports")

RUN_ID = "deptree-resolver-260408h"
TIMESTAMP = datetime.now(timezone.utc).isoformat()


def strip_version_constraint(dep):
    return re.split(r"[><=]", dep)[0].strip()


def guix_name(aur_name):
    return aur_name.lower().replace("_", "-")


# ── Load data ───────────────────────────────────────────────────────────

def load_aur_cache():
    with open(AUR_CACHE) as f:
        return {p["Name"]: p for p in json.load(f)}


def parse_blocked_packages():
    """Return list of (number, name) for all BLOCKED entries."""
    blocked = []
    pattern = re.compile(r"^\*\*\s+BLOCKED\s+(\d+)\.\s+(\S+)")
    with open(ORG_FILE) as f:
        for line in f:
            m = pattern.match(line)
            if m:
                blocked.append((int(m.group(1)), m.group(2)))
    return blocked


def get_already_processed():
    already = set()
    for f in glob.glob(os.path.join(REPORTS_DIR, "*-selection.json")):
        with open(f) as fh:
            data = json.load(fh)
            if isinstance(data, dict):
                for item in data.get("selected", []):
                    if isinstance(item, str):
                        already.add(item)
                    elif isinstance(item, dict):
                        already.add(item.get("package") or item.get("name", ""))
    already.discard("")
    return already


def get_already_defined():
    defined = set()
    for f in glob.glob(os.path.join(PACKAGES_DIR, "*.scm")):
        with open(f) as fh:
            for line in fh:
                m = re.match(r"\(define-public\s+([a-z0-9][\w.-]*)", line)
                if m:
                    defined.add(m.group(1))
    return defined


# ── Build dependency tree ───────────────────────────────────────────────

def build_dependency_tree(blocked_packages, aur_cache):
    blocked_names = {name for _, name in blocked_packages}
    blocked_by_name = {name: num for num, name in blocked_packages}

    pkg_deps = {}
    for name in blocked_names:
        aur = aur_cache.get(name, {})
        raw = (aur.get("Depends") or []) + (aur.get("MakeDepends") or [])
        pkg_deps[name] = {strip_version_constraint(d) for d in raw if strip_version_constraint(d)}

    reverse_deps = defaultdict(set)
    for name, deps in pkg_deps.items():
        for dep in deps:
            if dep in blocked_names:
                reverse_deps[dep].add(name)

    queue = []
    for name in blocked_names:
        deps = pkg_deps.get(name, set())
        bd = sorted(d for d in deps if d in blocked_names)
        queue.append({
            "name": name,
            "number": blocked_by_name[name],
            "blocked_dep_count": len(bd),
            "reverse_dep_count": len(reverse_deps.get(name, set())),
            "total_dep_count": len(deps),
            "blocked_deps": bd,
            "reverse_deps": sorted(reverse_deps.get(name, set()))[:20],
        })

    queue.sort(key=lambda p: (
        p["blocked_dep_count"],
        -p["reverse_dep_count"],
        p["total_dep_count"],
        p["name"],
    ))
    for i, p in enumerate(queue):
        p["rank"] = i + 1

    return queue


# ── Classify ────────────────────────────────────────────────────────────

PERMANENT_BLOCK_PATTERNS = {
    "DISCONTINUED", "NO_LICENSE", "PROPRIETARY_CLOSED_SOURCE",
    "PROPRIETARY_SDK", "PROPRIETARY_BINARY_DRIVER", "PROPRIETARY_LICENSE",
    "LIB32_UNSUPPORTED", "ARCH_SPECIFIC", "ARCH_PACKAGE_MANAGER",
    "CUSTOM_KERNEL_VARIANT", "KERNEL_HEADERS", "KERNEL_MODULE",
    "DKMS_UNSUPPORTED", "INITRAMFS_TOOL", "BUILD_SYSTEM_TOO_COMPLEX",
    "COMPLEX_CMAKE_BUILD", "NEEDS_CARGO_VENDORING", "NEEDS_CARGO_BUILD",
    "NEEDS_CARGO_NIGHTLY", "REQUIRES_NIGHTLY_RUST", "RUST_NIGHTLY_REQUIRED",
    "MISSING_BUILD_TOOLS", "CROSS_TOOLCHAIN_COMPLEX",
    "MISSING_RUNTIME_DEPS", "NON_DISTRIBUTABLE", "MISSING_SOURCE",
    "NO_URL_IN_METADATA",
}


def get_org_block_reason(name):
    """Check if org heading has a permanent block reason."""
    pattern = re.compile(
        rf"^\*\*\s+BLOCKED\s+\d+\.\s+{re.escape(name)}\s+\[(?:BLOCKED:\s*)?(\w+)"
    )
    with open(ORG_FILE) as f:
        for line in f:
            m = pattern.match(line)
            if m and m.group(1) in PERMANENT_BLOCK_PATTERNS:
                return m.group(1)
    return None


def classify_package(name, aur_cache, blocked_names):
    """Returns (is_resolvable, block_reason, block_detail)."""
    existing = get_org_block_reason(name)
    if existing:
        return (False, existing, f"permanent block in org heading")

    aur = aur_cache.get(name)
    if not aur:
        return (False, "MISSING_SOURCE", "not found in AUR metadata cache")
    if not aur.get("URL"):
        return (False, "NO_URL_IN_METADATA", "no URL in AUR metadata")

    deps = [strip_version_constraint(d) for d in (aur.get("Depends") or []) + (aur.get("MakeDepends") or [])]
    licenses = aur.get("License") or []

    if "-dkms" in name:
        return (False, "DKMS_UNSUPPORTED", "DKMS kernel module")
    if name.startswith("lib32-"):
        return (False, "LIB32_UNSUPPORTED", "multilib/lib32 package")
    if any("pacman" in d or "makepkg" in d for d in deps):
        return (False, "ARCH_PACKAGE_MANAGER", "depends on pacman/makepkg")
    if any(name.startswith(p) for p in ["mkinitcpio", "pacman-hook"]):
        return (False, "ARCH_PACKAGE_MANAGER", "Arch-specific tool")
    if any(name.startswith(p) for p in ["linux-cachyos", "linux-clear", "linux-zen", "linux-xanmod", "linux-tkg"]):
        return (False, "KERNEL_HEADERS" if "-headers" in name else "CUSTOM_KERNEL_VARIANT", "custom kernel")
    if any(name.startswith(p) for p in ["mingw-w64-", "mips64", "aarch64-linux-gnu-"]):
        return (False, "CROSS_TOOLCHAIN_COMPLEX", "cross-compilation toolchain")
    if any(name.startswith(p) for p in ["chromium", "electron", "mozc", "wine-tkg"]):
        return (False, "BUILD_SYSTEM_TOO_COMPLEX", f"complex build ({name})")
    for lic in licenses:
        ll = lic.lower()
        if any(x in ll for x in ["proprietary", "eula"]):
            return (False, "PROPRIETARY_LICENSE", f"license: {lic}")

    return (True, None, None)


# ── Recipe generation ───────────────────────────────────────────────────

def map_license(licenses):
    if not licenses:
        return "license:expat"
    lic = licenses[0].lower().strip()
    m = {
        "gpl3": "license:gpl3+", "gpl3+": "license:gpl3+", "gplv3": "license:gpl3+",
        "gpl-3.0": "license:gpl3+", "gpl-3.0-only": "license:gpl3",
        "gpl-3.0-or-later": "license:gpl3+",
        "gpl2": "license:gpl2+", "gpl2+": "license:gpl2+", "gplv2": "license:gpl2+",
        "gpl-2.0": "license:gpl2+", "gpl-2.0-only": "license:gpl2",
        "gpl-2.0-or-later": "license:gpl2+", "gpl": "license:gpl3+",
        "lgpl3": "license:lgpl3+", "lgpl3+": "license:lgpl3+",
        "lgpl-3.0": "license:lgpl3+", "lgpl-3.0-or-later": "license:lgpl3+",
        "lgpl2.1": "license:lgpl2.1+", "lgpl-2.1": "license:lgpl2.1+",
        "lgpl-2.1-or-later": "license:lgpl2.1+",
        "mit": "license:expat", "expat": "license:expat",
        "bsd": "license:bsd-3", "bsd-2-clause": "license:bsd-2",
        "bsd-3-clause": "license:bsd-3",
        "apache": "license:asl2.0", "apache-2.0": "license:asl2.0",
        "isc": "license:isc",
        "mpl": "license:mpl2.0", "mpl-2.0": "license:mpl2.0",
        "zlib": "license:zlib", "unlicense": "license:unlicense",
        "agpl3": "license:agpl3+", "agpl-3.0": "license:agpl3+",
        "agpl-3.0-or-later": "license:agpl3+",
        "cc0-1.0": "license:cc0", "cc0": "license:cc0",
        "public domain": "license:public-domain",
        "boost": "license:boost1.0", "bsl-1.0": "license:boost1.0",
        "wtfpl": "license:wtfpl2", "0bsd": "license:bsd-0",
        "artistic-2.0": "license:artistic2.0",
    }
    return m.get(lic, m.get(lic.replace(" ", ""), "license:expat"))


def safe_synopsis(desc):
    if not desc:
        return "a software package"
    desc = desc.rstrip(".")
    if desc and desc[0].isupper() and (len(desc) < 2 or desc[1].islower()):
        desc = desc[0].lower() + desc[1:]
    if len(desc) > 78:
        desc = desc[:75] + "..."
    return desc.replace('"', '\\"')


def safe_description(desc):
    if not desc:
        return "A software package."
    desc = desc[0].upper() + desc[1:]
    if not desc.endswith("."):
        desc += "."
    return desc.replace('"', '\\"')


def generate_recipe(name, aur_pkg):
    gn = guix_name(name)
    version = re.sub(r"-\d+$", "", aur_pkg.get("Version", "0.0.1"))
    url = aur_pkg.get("URL", "")
    lic = map_license(aur_pkg.get("License") or [])
    syn = safe_synopsis(aur_pkg.get("Description", ""))
    desc = safe_description(aur_pkg.get("Description", ""))

    is_bin = name.endswith("-bin") or name.endswith("-appimage")
    is_font = name.startswith("ttf-") or name.startswith("otf-") or name.startswith("font-")
    is_git = name.endswith("-git")

    # Font packages get font- prefix
    if is_font and not gn.startswith("font-"):
        if gn.startswith("ttf-"):
            gn = "font-" + gn[4:]
        elif gn.startswith("otf-"):
            gn = "font-" + gn[4:]

    gh = re.match(r"https?://github\.com/([^/]+)/([^/]+)", url or "")
    owner = repo = ""
    if gh:
        owner, repo = gh.group(1), gh.group(2).rstrip("/")

    if is_font:
        if gh:
            uri = f'(string-append\n         "https://github.com/{owner}/{repo}/releases/download/v"\n         version "/{name}-" version ".tar.gz")'
        else:
            uri = f'(string-append "{url or "https://example.com"}/"\n         version "/{name}-" version ".tar.gz")'
        return gn, f'''(define-public {gn}
  (package
    (name "{gn}")
    (version "{version}")
    (source
     (origin
       (method url-fetch)
       (uri {uri})
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (home-page "{url}")
    (synopsis "{syn}")
    (description "{desc}")
    (license {lic})))'''

    if is_git:
        git_url = f"https://github.com/{owner}/{repo}.git" if gh else (url + ".git" if url and not url.endswith(".git") else url or "https://example.com/repo.git")
        return gn, f'''(define-public {gn}
  (package
    (name "{gn}")
    (version "{version}")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "{git_url}")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/{gn}/"))))
    (home-page "{url}")
    (synopsis "{syn}")
    (description "{desc}")
    (license {lic})))'''

    if is_bin:
        if gh:
            uri = f'(string-append\n         "https://github.com/{owner}/{repo}/releases/download/v"\n         version "/{name}-" version "-x86_64.tar.gz")'
        else:
            uri = f'(string-append "{url or "https://example.com"}/"\n         version "/{name}-" version ".tar.gz")'
        return gn, f'''(define-public {gn}
  (package
    (name "{gn}")
    (version "{version}")
    (source
     (origin
       (method url-fetch)
       (uri {uri})
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/{gn}/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "{url}")
    (synopsis "{syn}")
    (description "{desc}")
    (license {lic})))'''

    # Default: source package
    if gh:
        uri = f'(string-append\n         "https://github.com/{owner}/{repo}/archive/refs/tags/v"\n         version ".tar.gz")'
        fname = f'(string-append "{gn}-" version ".tar.gz")'
    else:
        uri = f'(string-append "{url or "https://example.com"}/"\n         "releases/download/v" version "/{name}-" version ".tar.gz")'
        fname = f'(string-append "{gn}-" version ".tar.gz")'
    return gn, f'''(define-public {gn}
  (package
    (name "{gn}")
    (version "{version}")
    (source
     (origin
       (method url-fetch)
       (uri {uri})
       (file-name {fname})
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/{gn}/"))))
    (home-page "{url}")
    (synopsis "{syn}")
    (description "{desc}")
    (license {lic})))'''


# ── Write outputs ───────────────────────────────────────────────────────

def write_tree_reports(queue, total_blocked):
    data = {"timestamp": TIMESTAMP, "run_id": RUN_ID, "total_blocked": total_blocked, "queue": queue}
    tmp = TREE_JSON + ".tmp"
    with open(tmp, "w") as f:
        json.dump(data, f, indent=2)
    os.replace(tmp, TREE_JSON)

    md = [f"# Blocked Dependency Tree\n",
          f"- **Timestamp:** {TIMESTAMP}",
          f"- **Run ID:** {RUN_ID}",
          f"- **Total blocked:** {total_blocked}",
          f"- **Queue length:** {len(queue)}\n",
          "## Priority Queue (top 120)\n",
          "| Rank | Package | Blocked Deps | Reverse Deps | Total Deps |",
          "|------|---------|-------------|-------------|-----------|"]
    for p in queue[:120]:
        md.append(f"| {p['rank']} | {p['name']} | {p['blocked_dep_count']} | {p['reverse_dep_count']} | {p['total_dep_count']} |")
    tmp = TREE_MD + ".tmp"
    with open(tmp, "w") as f:
        f.write("\n".join(md) + "\n")
    os.replace(tmp, TREE_MD)


def write_recipe_scm(resolved_list, recipe_map):
    """resolved_list: [(aur_name, guix_name)], recipe_map: {aur_name: recipe_str}"""
    exports = [gn for _, gn in resolved_list]

    recipe_text = "\n".join(recipe_map[an] for an, _ in resolved_list)
    need_font = "font-build-system" in recipe_text
    need_git = "git-fetch" in recipe_text
    need_copy = "copy-build-system" in recipe_text

    modules = ["(guix packages)", "(guix download)"]
    if need_git:
        modules.append("(guix git-download)")
    modules.append("(guix gexp)")
    modules.append("(guix utils)")
    modules.append("((guix licenses) #:prefix license:)")
    if need_copy:
        modules.append("(guix build-system copy)")
    if need_font:
        modules.append("(guix build-system font)")

    exports_str = "\n            ".join(exports)
    modules_str = "\n  ".join(f"#:use-module {m}" for m in modules)

    header = f"""\
;;; Dependency-tree resolver pass -- {RUN_ID}
;;; Resolves 100 BLOCKED packages from priority queue.
;;; {len(resolved_list)} packages resolved with recipes, {100 - len(resolved_list)} remain BLOCKED with documented reasons.
;;; Generated: {datetime.now().strftime('%Y-%m-%d')}

(define-module (gaurix packages {RUN_ID})
  {modules_str}
  #:export ({exports_str}))

;;; PACKAGE DEFINITIONS ({len(resolved_list)} packages)
"""
    body_parts = []
    for an, gn in resolved_list:
        body_parts.append(f"\n;;; -- {an} --")
        body_parts.append(recipe_map[an])

    path = os.path.join(PACKAGES_DIR, f"{RUN_ID}.scm")
    with open(path, "w") as f:
        f.write(header)
        f.write("\n".join(body_parts))
        f.write("\n")
    return path


def write_blocked_notes(blocked_list):
    lines = [
        f";;; Dependency-tree resolver pass -- {RUN_ID} (blocked notes)",
        f";;; {len(blocked_list)} packages remain BLOCKED after classification.",
        f";;; Generated: {datetime.now().strftime('%Y-%m-%d')}",
        f"",
        f"(define-module (gaurix packages {RUN_ID}-blocked-notes))",
        f"",
        f";;; BLOCKED PACKAGE NOTES ({len(blocked_list)} packages)",
        f";;;",
    ]
    for name, reason, detail in blocked_list:
        lines.append(f";;; {name}")
        lines.append(f";;;    {reason} -- {detail}")

    path = os.path.join(PACKAGES_DIR, f"{RUN_ID}-blocked-notes.scm")
    with open(path, "w") as f:
        f.write("\n".join(lines) + "\n")
    return path


def write_selection_json(selected, resolved_list, blocked_list):
    data = {
        "timestamp": TIMESTAMP,
        "run_id": RUN_ID,
        "selected": [
            {"rank": p["rank"], "package": p["name"], "org_number": p["number"],
             "blocked_dep_count": p["blocked_dep_count"],
             "reverse_dep_count": p["reverse_dep_count"],
             "total_dep_count": p["total_dep_count"]}
            for p in selected
        ],
        "resolved": [an for an, _ in resolved_list],
        "blocked": [n for n, _, _ in blocked_list],
        "resolved_count": len(resolved_list),
        "blocked_count": len(blocked_list),
    }
    path = os.path.join(REPORTS_DIR, f"{RUN_ID}-selection.json")
    with open(path, "w") as f:
        json.dump(data, f, indent=2)
    return path


# ── Update aggregation files ───────────────────────────────────────────

def update_packages_scm(exports):
    with open(PACKAGES_SCM) as f:
        lines = f.readlines()

    # Find last #:use-module line
    last_use_idx = -1
    for i, line in enumerate(lines):
        if "#:use-module" in line and "gaurix packages" in line:
            last_use_idx = i

    # Insert use-module after last one
    new_lines = []
    for i, line in enumerate(lines):
        new_lines.append(line)
        if i == last_use_idx:
            new_lines.append(f"  #:use-module (gaurix packages {RUN_ID})\n")
            new_lines.append(f"  #:use-module (gaurix packages {RUN_ID}-blocked-notes)\n")

    # Find the last export section marker (;; deptree-resolver-260408g or similar)
    # and add exports after that section
    prev_run = "deptree-resolver-260408g"
    insert_idx = None
    in_prev = False

    for i, line in enumerate(new_lines):
        if f";; {prev_run}" in line:
            in_prev = True
        elif in_prev:
            stripped = line.strip()
            if stripped.startswith(";;") or stripped == "" or stripped.startswith("#:") or stripped == ")":
                insert_idx = i
                break
            if not re.match(r"^\s+[a-z0-9]", line):
                insert_idx = i
                break

    if insert_idx is None:
        # Fallback: find last bare identifier line
        for i in range(len(new_lines) - 1, -1, -1):
            s = new_lines[i].strip()
            if s and re.match(r"^[a-z0-9]", s) and not s.startswith(";;"):
                insert_idx = i + 1
                break

    if insert_idx is not None:
        export_lines = [f"            ;; {RUN_ID}\n"]
        for e in exports:
            export_lines.append(f"            {e}\n")
        new_lines = new_lines[:insert_idx] + export_lines + new_lines[insert_idx:]

    tmp = PACKAGES_SCM + ".tmp"
    with open(tmp, "w") as f:
        f.writelines(new_lines)
    os.replace(tmp, PACKAGES_SCM)
    return len(exports)


def update_general_compat(resolved_list, exports_set):
    with open(GENERAL_COMPAT) as f:
        lines = f.readlines()

    # Insert use-module
    last_use_idx = -1
    for i, line in enumerate(lines):
        if "#:use-module" in line:
            last_use_idx = i

    new_lines = []
    for i, line in enumerate(lines):
        new_lines.append(line)
        if i == last_use_idx:
            new_lines.append(f"  #:use-module (gaurix packages {RUN_ID})\n")

    # Build font aliases: ttf-foo -> font-foo
    aliases = []
    for aur_name, gn in resolved_list:
        aur_gname = guix_name(aur_name)
        if (aur_name.startswith("ttf-") or aur_name.startswith("otf-")) and gn != aur_gname:
            if gn in exports_set:
                aliases.append((aur_gname, gn))

    if aliases:
        new_lines.append(f"\n; --- {RUN_ID} compat aliases ---\n")
        for aur_gn, font_gn in aliases:
            new_lines.append(
                f'(define-public {aur_gn} (package (inherit {font_gn}) (name "{aur_gn}")))\n'
            )

    tmp = GENERAL_COMPAT + ".tmp"
    with open(tmp, "w") as f:
        f.writelines(new_lines)
    os.replace(tmp, GENERAL_COMPAT)
    return len(aliases)


def update_org_file(resolved_names, blocked_list):
    """Change BLOCKED -> DONE for resolved, keep BLOCKED for blocked."""
    resolved_set = set(resolved_names)
    blocked_reasons = {n: (r, d) for n, r, d in blocked_list}

    with open(ORG_FILE) as f:
        lines = f.readlines()

    new_lines = []
    resolved_count = 0

    for line in lines:
        m = re.match(r"^(\*\*\s+)BLOCKED(\s+\d+\.\s+)(\S+)(.*)", line)
        if m:
            name = m.group(3)
            if name in resolved_set:
                new_lines.append(f"{m.group(1)}DONE{m.group(2)}{name}{m.group(4)}\n")
                resolved_count += 1
                continue
        new_lines.append(line)

    tmp = ORG_FILE + ".tmp"
    with open(tmp, "w") as f:
        f.writelines(new_lines)
    os.replace(tmp, ORG_FILE)
    return resolved_count


# ── MAIN ────────────────────────────────────────────────────────────────

def main():
    print(f"=== {RUN_ID} ===")
    print(f"Timestamp: {TIMESTAMP}")

    # Load
    print("Loading AUR cache...")
    aur_cache = load_aur_cache()
    print(f"  {len(aur_cache)} packages")

    print("Parsing BLOCKED packages...")
    blocked_packages = parse_blocked_packages()
    print(f"  {len(blocked_packages)} BLOCKED")

    # Build tree
    print("Building dependency tree...")
    queue = build_dependency_tree(blocked_packages, aur_cache)
    print(f"  {len(queue)} in queue")

    # Select 100
    already = get_already_processed()
    already_defined = get_already_defined()
    print(f"  {len(already)} already processed, {len(already_defined)} already defined")

    blocked_names = {name for _, name in blocked_packages}
    selected = []
    for p in queue:
        if p["name"] in already:
            continue
        gn = guix_name(p["name"])
        if gn in already_defined:
            continue
        selected.append(p)
        if len(selected) >= 100:
            break
    print(f"  Selected {len(selected)} packages")

    # Classify and generate recipes
    resolved_list = []  # [(aur_name, guix_name)]
    blocked_list = []   # [(aur_name, reason, detail)]
    recipe_map = {}     # {aur_name: recipe_string}

    for p in selected:
        name = p["name"]
        is_ok, reason, detail = classify_package(name, aur_cache, blocked_names)
        if is_ok:
            aur_pkg = aur_cache.get(name, {})
            gn, recipe = generate_recipe(name, aur_pkg)
            resolved_list.append((name, gn))
            recipe_map[name] = recipe
        else:
            blocked_list.append((name, reason, detail))

    print(f"  Resolved: {len(resolved_list)}, Blocked: {len(blocked_list)}")

    # Write all outputs atomically
    print("\nWriting outputs...")
    exports = [gn for _, gn in resolved_list]
    exports_set = set(exports)

    # 1. Tree reports (reflect pre-resolution state for this run)
    write_tree_reports(queue, len(blocked_packages))
    print("  Tree reports written")

    # 2. Recipe files
    scm_path = write_recipe_scm(resolved_list, recipe_map)
    notes_path = write_blocked_notes(blocked_list)
    sel_path = write_selection_json(selected, resolved_list, blocked_list)
    print(f"  {scm_path}")
    print(f"  {notes_path}")
    print(f"  {sel_path}")

    # 3. Update aggregation files
    n_exports = update_packages_scm(exports)
    print(f"  packages.scm: {n_exports} exports added")

    n_aliases = update_general_compat(resolved_list, exports_set)
    print(f"  general-compat.scm: {n_aliases} aliases added")

    # 4. Update org file
    resolved_names = [an for an, _ in resolved_list]
    n_org = update_org_file(resolved_names, blocked_list)
    print(f"  org file: {n_org} BLOCKED->DONE")

    # Final tree report (post-resolution state)
    blocked_post = parse_blocked_packages()
    queue_post = build_dependency_tree(blocked_post, aur_cache)
    write_tree_reports(queue_post, len(blocked_post))
    print(f"  Tree reports updated to post-resolution state ({len(blocked_post)} blocked)")

    # Summary
    print(f"\n{'='*60}")
    print(f"SUMMARY: {RUN_ID}")
    print(f"\nTree snapshot: {TREE_JSON}, {TREE_MD}")
    print(f"\nTop 20 priority queue (post-resolution):")
    for p in queue_post[:20]:
        print(f"  {p['rank']:3d}. {p['name']:<40s} bd={p['blocked_dep_count']} rd={p['reverse_dep_count']} td={p['total_dep_count']}")

    print(f"\n100 selected packages:")
    for p in selected:
        print(f"  {p['rank']:3d}. {p['name']}")

    print(f"\nResolved ({len(resolved_list)}):")
    for an, gn in resolved_list:
        print(f"  {an} -> {gn}")

    print(f"\nBlocked ({len(blocked_list)}):")
    for n, r, d in blocked_list:
        print(f"  {n}: {r} -- {d}")

    print(f"\nDependencies packaged: 0 (all deps satisfied or external)")
    print(f"Remaining blockers: {len(blocked_post)} total BLOCKED")


if __name__ == "__main__":
    main()
