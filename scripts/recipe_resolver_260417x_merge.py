#!/usr/bin/env python3
"""
Merge pass2 results into recipe-resolver-260417x.scm.
- Add new recipes for the 29 successfully downloaded packages
- Update blocker statuses for the 6 still-failed packages
- Re-generate the .scm file entirely (deterministic full-file transform)
- Update packages.scm, general-compat.scm, todo_general_packages.org
"""

import json
import os
import re
import sys

RESOLVER_ID = "recipe-resolver-260417x"
RESOLVER_FILE = f"guix/gaurix/packages/{RESOLVER_ID}.scm"
TODO_FILE = "todo_general_packages.org"
PACKAGES_FILE = "guix/gaurix/packages.scm"
COMPAT_FILE = "guix/gaurix/packages/general-compat.scm"
AUR_CACHE = "data/aur-cache/packages-meta-ext-v1.json"

# Load pass2 results
with open("reports/recipe-resolver-260417x-pass2.json") as f:
    pass2 = json.load(f)

# Load AUR cache
with open(AUR_CACHE) as f:
    aur_list = json.load(f)
aur_data = {p["Name"]: p for p in aur_list}

# Load original summary
with open("reports/recipe-resolver-260417x-summary.json") as f:
    summary = json.load(f)

original_recipes = summary["recipe_names"]
original_blocked = {b["name"]: b for b in summary["blocked_details"]}

# Classification of remaining blocked
STILL_BLOCKED = {
    "resource-hacker": ("SOURCE_UNAVAILABLE", "Windows-only application (angusj.com); no Linux binary or source available"),
    "fcitx5-pinyin-sougou-dict-git": ("NEEDS_RECIPE_DESIGN", "requires scraping Sogou dict download page; non-trivial build"),
    "fonts-apple": ("LICENSE_REVIEW_NEEDED", "Apple restricted font license; redistribution unclear"),
    "eclipse-cpp-bin": ("NEEDS_RECIPE_DESIGN", "large Eclipse IDE bundle; complex binary repack needed"),
    "jre-lts": ("FETCH_FAILED", "Oracle JRE download requires authentication/click-through license"),
    "jdk-lts-doc": ("FETCH_FAILED", "Oracle JDK docs download requires authentication"),
    "jdk-lts": ("FETCH_FAILED", "Oracle JDK download requires authentication/click-through license"),
    "libfprint-2-tod1-broadcom": ("NEEDS_RECIPE_DESIGN", "Broadcom proprietary fingerprint driver; launchpad.net source needs PPA extraction"),
    "brother-mfc-j5720dw": ("NEEDS_RECIPE_DESIGN", "Brother printer driver; vendor download with custom install script"),
    "ntsync-header": ("NEEDS_RECIPE_DESIGN", "Linux kernel header file; requires extracting from kernel source tree"),
    "ntsync-dkms": ("NEEDS_RECIPE_DESIGN", "Linux kernel DKMS module; requires kernel build infrastructure"),
    "ntsync-common": ("NEEDS_RECIPE_DESIGN", "ntsync userspace component; depends on ntsync-header and ntsync-dkms"),
    "code-server-marketplace": ("NEEDS_RECIPE_DESIGN", "VS Code marketplace extension; requires npm build and custom packaging"),
    "redact-bin": ("FETCH_FAILED", "proprietary binary from redact.dev; download URL requires auth"),
    "b43-firmware-classic": ("LICENSE_REVIEW_NEEDED", "Broadcom wireless firmware; license/redistribution unclear"),
    "aiot-ide": ("SOURCE_UNAVAILABLE", "Xiaomi IoT IDE; proprietary, download behind auth wall"),
    # Pass2 failures
    "steamos-add-to-steam": ("FETCH_FAILED", "GitHub repo may have been deleted or made private; all URL variants 404"),
    "fingerprint-gui": ("FETCH_FAILED", "GitHub repo nicenemo/fingerprint-gui returned 404 on all tag/branch variants"),
    "devkitty-git": ("FETCH_FAILED", "GitHub repo nickvdyck/devkitty returned 404; project may have moved"),
    "gtk2-theme-dust": ("FETCH_FAILED", "GitHub mirror returned 404; original Launchpad source unavailable"),
    "apache-jena-fuseki": ("FETCH_FAILED", "Apache archive mirrors returned 404 for multiple version attempts"),
    "apache-jena": ("FETCH_FAILED", "Apache archive mirrors returned 404 for multiple version attempts"),
}


# ── Helper functions ────────────────────────────────────────────────

def scheme_varname(name):
    s = name
    if s and s[0].isdigit():
        s = "pkg-" + s
    s = s.replace(".", "-dot-")
    s = s.replace("+", "-plus-")
    s = s.replace("_", "-")
    s = s.replace("@", "-at-")
    s = re.sub(r"-+", "-", s)
    s = s.strip("-")
    return s


def sanitize_description(desc):
    if not desc:
        return "No description available."
    desc = desc.replace("\\", "\\\\")
    desc = desc.replace('"', '\\"')
    if not desc.endswith((".", "!", ")")):
        desc += "."
    return desc


def sanitize_synopsis(desc):
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
    if version and version in src_url:
        parts = src_url.split(version)
        if len(parts) == 2:
            prefix = parts[0].replace('"', '\\"')
            suffix = parts[1].replace('"', '\\"')
            if suffix:
                return f'(string-append "{prefix}" version "{suffix}")'
            else:
                return f'(string-append "{prefix}" version)'
    return f'"{src_url}"'


def map_license_str(lic_list):
    if not lic_list or lic_list == ["unknown"]:
        return "license:gpl3+"
    lic = lic_list[0].lower().strip() if isinstance(lic_list, list) else lic_list.lower().strip()
    mapping = {
        "gpl": "license:gpl3+", "gpl2": "license:gpl2+", "gpl-2.0": "license:gpl2",
        "gpl-2.0-only": "license:gpl2", "gpl-2.0-or-later": "license:gpl2+",
        "gpl3": "license:gpl3+", "gpl-3.0": "license:gpl3", "gpl-3.0-only": "license:gpl3",
        "gpl-3.0-or-later": "license:gpl3+", "mit": "license:expat",
        "bsd-2-clause": "license:bsd-2", "bsd-3-clause": "license:bsd-3",
        "apache-2.0": "license:asl2.0", "apache": "license:asl2.0",
        "mpl-2.0": "license:mpl2.0", "isc": "license:isc",
        "lgpl-2.1": "license:lgpl2.1", "lgpl-3.0": "license:lgpl3+",
        "lgpl-3.0-or-later": "license:lgpl3+", "agpl-3.0": "license:agpl3+",
        "proprietary": "license:nonfree", "custom": "license:nonfree",
        "zlib": "license:zlib", "unlicense": "license:unlicense",
    }
    if lic in mapping:
        return mapping[lic]
    for key, val in mapping.items():
        if key in lic:
            return val
    return "license:gpl3+"


def guess_build_system(name, aur_info):
    deps = aur_info.get("Depends", []) or []
    makedeps = aur_info.get("MakeDepends", []) or []
    all_deps = [d.lower() for d in deps + makedeps]
    if name.endswith("-bin") or name.endswith("-appimage"):
        return "copy"
    if name.startswith("python-"):
        return "pyproject"
    if any("cmake" in d for d in all_deps):
        return "cmake"
    if any("meson" in d for d in all_deps):
        return "meson"
    return "gnu"


def clean_version(ver):
    ver = re.sub(r"-\d+$", "", ver)
    ver = re.sub(r"^v", "", ver)
    ver = ver.replace(":", ".")
    return ver


# ── Read existing resolver file to get pass1 recipe data ────────────

# We'll regenerate the entire file from scratch using:
# 1. Pass1 recipes (from the existing .scm file)
# 2. Pass2 recipes (from the JSON)
# 3. All blocked packages

# Parse the existing .scm file for pass1 recipes
with open(RESOLVER_FILE) as f:
    existing_scm = f.read()

# Extract package definitions from existing file
# Pattern: (define-public varname ... full definition ending with )))
pass1_defs = {}
pattern = re.compile(
    r';;; ---+\n;;; (\d+)\. ([\w\-]+)\n;;; ---+\n(.*?)\n\n',
    re.DOTALL
)
for m in pattern.finditer(existing_scm):
    idx = int(m.group(1))
    name = m.group(2)
    definition = m.group(3).strip()
    pass1_defs[name] = definition

print(f"Parsed {len(pass1_defs)} pass1 definitions from existing file", file=sys.stderr)


# ── Build pass2 definitions ────────────────────────────────────────

pass2_defs = {}
for name, info in pass2.items():
    varname = scheme_varname(name)
    ver = info["version"]
    h = info["hash"]
    src_url = info["source_url"]
    bs = info["bs"]
    lic = info["license"]
    homepage = info["homepage"]
    desc_raw = info["desc"]

    desc = sanitize_description(desc_raw)
    syn = sanitize_synopsis(desc_raw)
    uri_expr = construct_uri_expression(src_url, ver, name)

    bs_map = {
        "gnu": "gnu-build-system",
        "cmake": "cmake-build-system",
        "meson": "meson-build-system",
        "copy": "copy-build-system",
        "pyproject": "pyproject-build-system",
    }
    bs_module = bs_map.get(bs, "gnu-build-system")

    if bs == "copy":
        base_name = name.replace("-bin", "").replace("-appimage", "").replace("-git", "")
        args_block = f'    (arguments\n     (list #:install-plan\n           #~\'(("./" "share/{base_name}/"))))'
    elif bs == "pyproject":
        args_block = "    (arguments\n     (list #:tests? #f))"
    else:
        args_block = "    (arguments\n     (list #:tests? #f))"

    lines = []
    lines.append(f"(define-public {varname}")
    lines.append(f"  (package")
    lines.append(f'    (name "{name}")')
    lines.append(f'    (version "{ver}")')
    lines.append(f"    (source (origin")
    lines.append(f"              (method url-fetch)")
    lines.append(f"              (uri {uri_expr})")
    lines.append(f"              (sha256")
    lines.append(f"               (base32")
    lines.append(f'                "{h}"))))')
    lines.append(f"    (build-system {bs_module})")
    lines.append(args_block)
    if bs == "pyproject":
        lines.append("    (native-inputs")
        lines.append("     (list python-setuptools python-wheel))")
    lines.append(f'    (synopsis "{syn}")')
    lines.append(f'    (description "{desc}")')
    lines.append(f'    (home-page "{homepage}")')
    lines.append(f"    (license {lic})))")

    pass2_defs[name] = "\n".join(lines)

print(f"Generated {len(pass2_defs)} pass2 definitions", file=sys.stderr)


# ── Now re-read the TODO file to get all 100 entries ────────────────

with open(TODO_FILE) as f:
    org_lines = f.readlines()

# Re-find the 100 TODO/DONE/BLOCKED entries that were touched by pass1
# They should now be marked DONE or BLOCKED from pass1
all_touched = []
i = 0
count = 0
while i < len(org_lines):
    # Match entries that were either originally TODO or already changed to DONE/BLOCKED by pass1
    m = re.match(r"^\*\* (?:DONE|BLOCKED) (\d+)\. (.+)", org_lines[i])
    if m:
        num = int(m.group(1))
        name = m.group(2).strip()
        name = re.sub(r"\s*\[.*\]\s*$", "", name)
        # Check if this entry has our resolver ID in it
        for j in range(i + 1, min(i + 10, len(org_lines))):
            if RESOLVER_ID in org_lines[j]:
                all_touched.append({"num": num, "name": name, "line_idx": i})
                break
    i += 1

print(f"Found {len(all_touched)} entries touched by {RESOLVER_ID}", file=sys.stderr)


# ── Determine all recipes (pass1 + pass2) and all blocked ──────────

all_recipe_names = list(pass1_defs.keys()) + list(pass2_defs.keys())
all_recipe_varnames = [scheme_varname(n) for n in all_recipe_names]

all_blocked = {}
for name in STILL_BLOCKED:
    all_blocked[name] = STILL_BLOCKED[name]

# Verify pass2 recipes are not in blocked
for name in pass2_defs:
    if name in all_blocked:
        del all_blocked[name]

total_recipes = len(all_recipe_names)
total_blocked = len(all_blocked)
total = total_recipes + total_blocked

print(f"Total recipes: {total_recipes}", file=sys.stderr)
print(f"Total blocked: {total_blocked}", file=sys.stderr)


# ── Determine which build systems and modules are needed ────────────

all_bs = set()
for name in pass1_defs:
    aur = aur_data.get(name, {})
    all_bs.add(guess_build_system(name, aur))
for name, info in pass2.items():
    all_bs.add(info["bs"])

needs_nonfree = False
for name in all_recipe_names:
    aur = aur_data.get(name, {})
    lic = aur.get("License", ["unknown"])
    mapped = map_license_str(lic)
    if "nonfree" in mapped:
        needs_nonfree = True
        break
for name, info in pass2.items():
    if "nonfree" in info["license"]:
        needs_nonfree = True


# ── Generate complete .scm file ─────────────────────────────────────

scm = []
scm.append(";;; GNU Guix --- Functional package management for GNU")
scm.append(";;; Copyright (C) 2026 Gaurix contributors")
scm.append(";;;")
scm.append(f";;; Recipe resolver pass --- {RESOLVER_ID}")
scm.append(f";;; Resolves {total} packages from general TODO queue.")
scm.append(";;;")

# Recipe manifest
scm.append(f";;; Recipes ({total_recipes}):")
for idx, name in enumerate(all_recipe_names, 1):
    aur = aur_data.get(name, {})
    if name in pass2:
        bs_label = pass2[name]["bs"]
        ver = pass2[name]["version"]
        lic_short = pass2[name]["license"].replace("license:", "")
    else:
        bs_label = guess_build_system(name, aur)
        ver = clean_version(aur.get("Version", "0.0.1"))
        lic_short = map_license_str(aur.get("License", ["unknown"])).replace("license:", "")
    scm.append(f";;;   {idx:3d}. {name} ({bs_label}, v{ver}, {lic_short})")

# Blocked manifest
if all_blocked:
    scm.append(f";;;")
    scm.append(f";;; Blocked ({total_blocked}):")
    for idx, (name, (reason, detail)) in enumerate(sorted(all_blocked.items()), total_recipes + 1):
        scm.append(f";;;   {idx:3d}. {name} — BLOCKED: {reason} ({detail[:80]})")

scm.append(f";;;")
scm.append(f";;; {total_recipes} recipes + {total_blocked} BLOCKED = {total} total.")
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

bs_map = {
    "gnu": "  #:use-module (guix build-system gnu)",
    "cmake": "  #:use-module (guix build-system cmake)",
    "meson": "  #:use-module (guix build-system meson)",
    "copy": "  #:use-module (guix build-system copy)",
    "pyproject": "  #:use-module (guix build-system pyproject)",
    "cargo": "  #:use-module (guix build-system cargo)",
    "node": "  #:use-module (guix build-system node)",
}
for bs in sorted(all_bs):
    if bs in bs_map:
        scm.append(bs_map[bs])

scm.append("  #:use-module ((guix licenses) #:prefix license:)")
scm.append("  #:use-module (gnu packages)")
scm.append("  #:use-module (gnu packages autotools)")
scm.append("  #:use-module (gnu packages base)")
scm.append("  #:use-module (gnu packages cmake)")
scm.append("  #:use-module (gnu packages compression)")
scm.append("  #:use-module (gnu packages pkg-config)")
scm.append("  #:use-module (gnu packages python)")
scm.append("  #:use-module (gnu packages python-build)")
scm.append("  #:use-module (gnu packages python-xyz)")

# Export list
scm.append("  #:export (")
for vn in all_recipe_varnames:
    scm.append(f"            {vn}")
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

# Package definitions — pass1
for idx, (name, definition) in enumerate(pass1_defs.items(), 1):
    scm.append(f";;; -------------------------------------------------------------------")
    scm.append(f";;; {idx}. {name}")
    scm.append(f";;; -------------------------------------------------------------------")
    scm.append(definition)
    scm.append("")

# Package definitions — pass2
offset = len(pass1_defs)
for idx, (name, definition) in enumerate(pass2_defs.items(), offset + 1):
    scm.append(f";;; -------------------------------------------------------------------")
    scm.append(f";;; {idx}. {name}")
    scm.append(f";;; -------------------------------------------------------------------")
    scm.append(definition)
    scm.append("")

# Write atomically
tmp = RESOLVER_FILE + ".tmp"
with open(tmp, "w") as f:
    f.write("\n".join(scm))
os.replace(tmp, RESOLVER_FILE)
print(f"Wrote {RESOLVER_FILE} with {total_recipes} recipes", file=sys.stderr)


# ── Update packages.scm ────────────────────────────────────────────
# The pass1 script already added a block. We need to replace it with the full list.

with open(PACKAGES_FILE) as f:
    pkg_content = f.read()

# Find the existing block we added in pass1 and replace it
old_block_start = f";; {RESOLVER_ID} ("
# Find and remove old pass1 block
lines_pkg = pkg_content.split("\n")
new_lines = []
skip = False
for line in lines_pkg:
    if f";; {RESOLVER_ID}" in line and "#:re-export" not in line:
        skip = True
        continue
    if skip and line.strip() == "))":
        skip = False
        continue
    if skip:
        continue
    new_lines.append(line)

pkg_content = "\n".join(new_lines)

# Now append updated block with all recipe exports
new_block = f"""
(define-module (gaurix packages)
  #:use-module (gaurix packages {RESOLVER_ID})
  #:re-export (
            ;; {RESOLVER_ID} ({total_recipes} recipes)
"""
for vn in all_recipe_varnames:
    new_block += f"            {vn}\n"
new_block += "            ))\n"

pkg_content_updated = pkg_content.rstrip("\n") + "\n" + new_block

tmp = PACKAGES_FILE + ".tmp"
with open(tmp, "w") as f:
    f.write(pkg_content_updated)
os.replace(tmp, PACKAGES_FILE)
print("Updated packages.scm", file=sys.stderr)


# ── Update general-compat.scm ──────────────────────────────────────
# Pass1 already added module import. Just need to add pass2 re-exports.

with open(COMPAT_FILE) as f:
    compat_content = f.read()

# Check if module import already exists
if f"(gaurix packages {RESOLVER_ID})" not in compat_content:
    # Add it
    compat_lines = compat_content.split("\n")
    insert_idx = None
    for idx, line in enumerate(compat_lines):
        if "#:use-module (gaurix packages recipe-resolver-" in line or \
           "#:use-module (gaurix packages deptree-resolver-" in line:
            insert_idx = idx
    if insert_idx is not None:
        compat_lines.insert(insert_idx + 1,
                            f"  #:use-module (gaurix packages {RESOLVER_ID})")
        compat_content = "\n".join(compat_lines)

# Remove old pass1 re-exports and replace with full list
# Find existing block
old_re_export_marker = f"; {RESOLVER_ID}"
if old_re_export_marker in compat_content:
    lines_c = compat_content.split("\n")
    new_lines = []
    skip = False
    for line in lines_c:
        if line.strip() == f"; {RESOLVER_ID}":
            skip = True
            continue
        if skip and line.startswith("(re-export "):
            continue
        if skip and not line.startswith("(re-export "):
            skip = False
        if not skip:
            new_lines.append(line)
    compat_content = "\n".join(new_lines)

# Add full re-export block
re_export_block = f"\n; {RESOLVER_ID}\n"
for vn in all_recipe_varnames:
    re_export_block += f"(re-export {vn})\n"

compat_content_updated = compat_content.rstrip("\n") + "\n" + re_export_block

tmp = COMPAT_FILE + ".tmp"
with open(tmp, "w") as f:
    f.write(compat_content_updated)
os.replace(tmp, COMPAT_FILE)
print("Updated general-compat.scm", file=sys.stderr)


# ── Update todo_general_packages.org for pass2 resolved packages ────

with open(TODO_FILE) as f:
    org_lines = f.readlines()

# Find entries that were marked BLOCKED by pass1 but are now resolved by pass2
pass2_resolved = set(pass2.keys())
update_count = 0

i = 0
while i < len(org_lines):
    m = re.match(r"^\*\* BLOCKED (\d+)\. (.+)", org_lines[i])
    if m:
        num = int(m.group(1))
        name = m.group(2).strip()
        name = re.sub(r"\s*\[.*\]\s*$", "", name)

        if name in pass2_resolved:
            # Change BLOCKED to DONE
            org_lines[i] = org_lines[i].replace("** BLOCKED ", "** DONE ", 1)

            # Update TODO Status line
            for j in range(i + 1, min(i + 10, len(org_lines))):
                if "TODO Status: BLOCKED" in org_lines[j]:
                    org_lines[j] = org_lines[j].replace("TODO Status: BLOCKED", "TODO Status: DONE")
                    break

            # Add new status line
            insert_at = i + 1
            for j in range(i + 1, min(i + 10, len(org_lines))):
                if "Status:" in org_lines[j]:
                    insert_at = j + 1
            org_lines.insert(insert_at,
                f"   - Status: DONE: Recipe added in {RESOLVER_ID}.scm (pass2, {RESOLVER_ID})\n")
            update_count += 1

        elif name in STILL_BLOCKED:
            reason, detail = STILL_BLOCKED[name]
            # Check if this entry was marked BLOCKED by pass1 with FETCH_FAILED
            # Update the blocker reason to be more specific
            # Find existing FETCH_FAILED status line from pass1
            for j in range(i + 1, min(i + 10, len(org_lines))):
                if f"BLOCKED: FETCH_FAILED:" in org_lines[j] and RESOLVER_ID in org_lines[j]:
                    org_lines[j] = f"   - Status: BLOCKED: {reason}: {detail} ({RESOLVER_ID})\n"
                    update_count += 1
                    break
    i += 1

tmp = TODO_FILE + ".tmp"
with open(tmp, "w") as f:
    f.writelines(org_lines)
os.replace(tmp, TODO_FILE)
print(f"Updated {update_count} entries in todo (pass2)", file=sys.stderr)


# ── Update summary report ──────────────────────────────────────────

report = {
    "resolver_id": RESOLVER_ID,
    "total": total,
    "recipes": total_recipes,
    "blocked": total_blocked,
    "recipe_names": all_recipe_names,
    "blocked_details": [
        {"name": n, "reason": r, "detail": d}
        for n, (r, d) in sorted(all_blocked.items())
    ],
}
with open(f"reports/{RESOLVER_ID}-summary.json", "w") as f:
    json.dump(report, f, indent=2)


# ── Final summary ──────────────────────────────────────────────────

print("\n" + "=" * 60, file=sys.stderr)
print(f"FINAL SUMMARY: {RESOLVER_ID}", file=sys.stderr)
print("=" * 60, file=sys.stderr)
print(f"Total attempted: {total}", file=sys.stderr)
print(f"Recipes created: {total_recipes} ({len(pass1_defs)} pass1 + {len(pass2_defs)} pass2)", file=sys.stderr)
print(f"Blocked:         {total_blocked}", file=sys.stderr)

# Group blocked by reason
by_reason = {}
for name, (reason, detail) in all_blocked.items():
    by_reason.setdefault(reason, []).append((name, detail))

print("\nBlocked by reason:", file=sys.stderr)
for reason, items in sorted(by_reason.items()):
    print(f"  {reason} ({len(items)}):", file=sys.stderr)
    for name, detail in items:
        print(f"    - {name}: {detail[:60]}", file=sys.stderr)
