#!/usr/bin/env python3
"""Dependency tree resolver pass: deptree-resolver-260418k

Finalizes the 43 packages from the previous pass (260418j) that were
given placeholder stub recipes.  All 43 have fundamental blockers
(proprietary, Arch-specific, DKMS, missing critical deps, etc.) and
are marked FAILED with exhaustive documentation.

Steps:
1) Load the 43 packages from the previous blocked-dependency-tree.json
2) Rebuild dependency tree from AUR cache
3) Categorize each with final FAILED determination
4) Generate tree artifacts, blocked-notes
5) Update todo heading DONE→FAILED, body TODO Status→FAILED
6) Add pass comment to packages.scm
"""

import json
import re
import os
import sys
import shutil
import tempfile
from datetime import datetime, timezone
from collections import defaultdict

PASS_ID = "deptree-resolver-260418k"
BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
AUR_CACHE = os.path.join(BASE_DIR, "data/aur-cache/packages-meta-ext-v1.json")
TODO_FILE = os.path.join(BASE_DIR, "todo_general_packages.org")
PACKAGES_SCM = os.path.join(BASE_DIR, "guix/gaurix/packages.scm")
TREE_JSON = os.path.join(BASE_DIR, "reports/blocked-dependency-tree.json")
TREE_MD = os.path.join(BASE_DIR, "reports/blocked-dependency-tree.md")
SELECTION_JSON = os.path.join(BASE_DIR, f"reports/{PASS_ID}-selection.json")
SUMMARY_JSON = os.path.join(BASE_DIR, f"reports/{PASS_ID}-summary.json")
BLOCKED_NOTES_SCM = os.path.join(BASE_DIR,
    f"guix/gaurix/packages/{PASS_ID}-blocked-notes.scm")

TIMESTAMP = datetime.now(timezone.utc).isoformat()

# The 43 packages from the previous tree report (deptree-resolver-260418j)
PREV_TREE_JSON = TREE_JSON  # same file, we read before overwriting

# ── Final determinations ─────────────────────────────────────────────
FINAL_DETERMINATIONS = {
    # PROPRIETARY — cannot redistribute
    "fonts-apple": ("FAILED", "PROPRIETARY_EXHAUSTED",
        "Apple restricted font license prohibits redistribution; "
        "no free alternative with same glyphs; exhausted after 10+ passes"),
    "otf-apple-pingfang": ("FAILED", "PROPRIETARY_EXHAUSTED",
        "Apple PingFang font license prohibits redistribution; "
        "Noto CJK is free alternative; exhausted after 10+ passes"),
    "otf-apple-pingfang-relaxed": ("FAILED", "PROPRIETARY_EXHAUSTED",
        "Apple PingFang variant — same proprietary redistribution restriction; exhausted"),
    "otf-apple-pingfang-ui": ("FAILED", "PROPRIETARY_EXHAUSTED",
        "Apple PingFang UI variant — same proprietary restriction; exhausted"),
    "starsector": ("FAILED", "PROPRIETARY_EXHAUSTED",
        "Commercial game from Fractal Softworks requiring paid license; "
        "no free download URL; AUR expects user-provided installer; exhausted"),
    "xilinx-ise": ("FAILED", "PROPRIETARY_EXHAUSTED",
        "Xilinx ISE: 6GB+ registration-walled installer, EULA prohibits "
        "redistribution, depends on legacy Qt4+gcc49; exhausted"),
    "aiot-ide": ("FAILED", "PROPRIETARY_EXHAUSTED",
        "Xiaomi AIoT IDE: proprietary, requires Chinese iot.mi.com account, "
        "no direct download URL, no source; exhausted"),
    "vitis": ("FAILED", "PROPRIETARY_EXHAUSTED",
        "AMD/Xilinx Vitis: 100GB+ proprietary FPGA suite, registration-walled, "
        "non-redistributable; exhausted"),
    "libfprint-2-tod1-broadcom": ("FAILED", "PROPRIETARY_EXHAUSTED",
        "Dell/Broadcom proprietary fingerprint binary blob; no source code; "
        "restricted license; exhausted"),
    "ttf-ms-office365": ("FAILED", "PROPRIETARY_EXHAUSTED",
        "Microsoft Office 365 proprietary fonts; EULA prohibits redistribution; "
        "no free download; exhausted"),
    "lib32-amdvlk-bin": ("FAILED", "PROPRIETARY_EXHAUSTED",
        "AMD Vulkan 32-bit binary: proprietary + Guix lacks 32-bit multilib; exhausted"),

    # ARCH-SPECIFIC — depends on pacman / Arch infrastructure
    "arch-shell": ("FAILED", "ARCH_SPECIFIC_EXHAUSTED",
        "Creates Arch chroots via mkarchroot/devtools/pacman; "
        "guix shell provides equivalent; no cross-distro utility; exhausted"),
    "dude-bin": ("FAILED", "ARCH_SPECIFIC_EXHAUSTED",
        "Pacman orphan manager linking against libalpm; "
        "guix gc --delete-generations provides native equivalent; exhausted"),
    "parus": ("FAILED", "ARCH_SPECIFIC_EXHAUSTED",
        "TUI for paru AUR helper; depends on paru (Arch-only); "
        "no utility on Guix; exhausted"),
    "pacwall-git": ("FAILED", "ARCH_SPECIFIC_EXHAUSTED",
        "Dependency wallpaper using pacman -Qi exclusively; "
        "guix graph provides native alternative; exhausted"),
    "asp": ("FAILED", "ARCH_SPECIFIC_EXHAUSTED",
        "Deprecated (Nov 2023) Arch Build System tool replaced by pkgctl; "
        "depends on pacman/devtools/Arch SVN; exhausted"),
    "pamac-all": ("FAILED", "ARCH_SPECIFIC_EXHAUSTED",
        "Manjaro GUI package manager for libalpm/pacman/AUR/snap/flatpak; "
        "Arch-ecosystem only; exhausted"),
    "selinux-refpolicy-arch-git": ("FAILED", "ARCH_SPECIFIC_EXHAUSTED",
        "Arch-patched SELinux reference policy; Guix doesn't use SELinux; "
        "distro-specific policy; exhausted"),

    # DKMS_UNSUPPORTED — kernel modules
    "ntsync-dkms": ("FAILED", "DKMS_EXHAUSTED",
        "NT sync primitives DKMS; upstream in Linux >= 6.14; "
        "DKMS incompatible with Guix; users should use kernel >= 6.14; exhausted"),
    "8192eu-dkms-git": ("FAILED", "DKMS_EXHAUSTED",
        "Realtek RTL8192EU WiFi DKMS; rtl8xxxu in mainline kernel may cover; "
        "DKMS incompatible with Guix; exhausted"),
    "mt76-dkms-git": ("FAILED", "DKMS_EXHAUSTED",
        "MediaTek mt76 WiFi DKMS; already upstream in Linux since 5.x; "
        "DKMS incompatible with Guix; exhausted"),
    "rtl8821ce-dkms-git": ("FAILED", "DKMS_EXHAUSTED",
        "Realtek RTL8821CE WiFi DKMS; rtw88 in kernel >= 5.9 covers chipset; "
        "DKMS incompatible with Guix; exhausted"),
    "ec-su_axb35-dkms-git": ("FAILED", "DKMS_EXHAUSTED",
        "Sixunited AXB35-02 embedded controller DKMS; niche hardware; "
        "DKMS incompatible with Guix; exhausted"),

    # MISSING_CRITICAL_DEP
    "palemoon-i18n-fr": ("FAILED", "MISSING_DEP_EXHAUSTED",
        "French locale for Pale Moon browser; Pale Moon not in Guix (XUL); exhausted"),
    "seamonkey-i18n-es-es": ("FAILED", "MISSING_DEP_EXHAUSTED",
        "Spanish locale for SeaMonkey; SeaMonkey not in Guix (Gecko suite); exhausted"),
    "code-server-marketplace": ("FAILED", "MISSING_DEP_EXHAUSTED",
        "VS Code marketplace for code-server; code-server not in Guix; "
        "$EXTENSIONS_GALLERY env var provides equivalent; exhausted"),
    "deezer": ("FAILED", "MISSING_DEP_EXHAUSTED",
        "Proprietary streaming client; Windows .exe via 7z/asar; "
        "requires Electron 39 not in Guix; exhausted"),
    "devkitty-git": ("FAILED", "MISSING_DEP_EXHAUSTED",
        "Developer tool needs Electron 41 not in Guix; "
        "GitHub releases macOS-only; no Linux binary; exhausted"),
    "pypy3-pyparsing": ("FAILED", "MISSING_DEP_EXHAUSTED",
        "pyparsing for PyPy3; PyPy3 not in Guix (complex bootstrap); "
        "CPython pyparsing already available; exhausted"),
    "gdrcopy": ("FAILED", "MISSING_DEP_EXHAUSTED",
        "NVIDIA GPU Direct RDMA lib+kernel module; requires CUDA SDK + gdrdrv; "
        "NVIDIA ecosystem not in Guix; exhausted"),
    "fnq-monitor": ("FAILED", "MISSING_DEP_EXHAUSTED",
        "Fn+Q ACPI monitor for Lenovo; requires acpi_call kernel module (DKMS); "
        "no userspace alternative; exhausted"),
    "lib32-liblrdf": ("FAILED", "MISSING_DEP_EXHAUSTED",
        "32-bit liblrdf; Guix is single-architecture (no lib32/multilib); "
        "Arch-specific concept; exhausted"),

    # MASSIVE_SCALE
    "odoo18-nightly": ("FAILED", "MASSIVE_SCALE_EXHAUSTED",
        "Odoo 18 ERP: 500+ Python deps, PostgreSQL, "
        "nightly versioning breaks reproducibility; exhausted"),
    "python-torchaudio-rocm": ("FAILED", "MASSIVE_SCALE_EXHAUSTED",
        "PyTorch audio with ROCm/HIP; ROCm ecosystem (100+ pkgs) not in Guix; "
        "CPU-only variant loses purpose; exhausted"),

    # SOURCE_UNAVAILABLE
    "rice-switcher": ("FAILED", "SOURCE_EXHAUSTED",
        "Upstream repo S1rEx1/Rice-Switcher returns 404; "
        "no forks or archives found; exhausted"),
    "cn-dascom-pin-driver": ("FAILED", "SOURCE_EXHAUSTED",
        "Dascom printer driver from vendor portal (dascom.cn); no public repo; "
        "niche hardware (1 AUR vote); exhausted"),
    "olauncher": ("FAILED", "SOURCE_EXHAUSTED",
        "Modified Minecraft launcher with custom non-free license; "
        "binary from opaque build; flagged out-of-date (1 vote); exhausted"),
    "gde-creator-bin": ("FAILED", "SOURCE_EXHAUSTED",
        "GDE Creator binary IDE; no public source; vendor account required; "
        "niche embedded development; exhausted"),

    # COMPLEX_DEPS — dep chain exhausted
    "iup": ("FAILED", "COMPLEX_DEPS_EXHAUSTED",
        "PUC-Rio IUP GUI needs libcd + tecmake build system; "
        "build chain IM->CD->IUP; 10+ passes tried; exhausted"),
    "lua-iup": ("FAILED", "COMPLEX_DEPS_EXHAUSTED",
        "Lua 5.4 bindings for IUP; blocked because iup exhausted; exhausted"),
    "lua51-iup": ("FAILED", "COMPLEX_DEPS_EXHAUSTED",
        "Lua 5.1 bindings for IUP; blocked because iup exhausted; exhausted"),
    "lua52-iup": ("FAILED", "COMPLEX_DEPS_EXHAUSTED",
        "Lua 5.2 bindings for IUP; blocked because iup exhausted; exhausted"),
    "lua53-iup": ("FAILED", "COMPLEX_DEPS_EXHAUSTED",
        "Lua 5.3 bindings for IUP; blocked because iup exhausted; exhausted"),
}


def load_aur_cache():
    with open(AUR_CACHE) as f:
        return {p["Name"]: p for p in json.load(f)}


def load_prev_tree():
    """Load the 43 packages from the previous tree report."""
    with open(PREV_TREE_JSON) as f:
        data = json.load(f)
    return [{"name": p["name"], "number": p["number"]} for p in data["queue"]]


def build_dependency_tree(pkgs, aur_map):
    """Build dependency tree with metrics."""
    pkg_names = {p["name"] for p in pkgs}
    pkg_num = {p["name"]: p["number"] for p in pkgs}
    queue = []

    for pkg in pkgs:
        name = pkg["name"]
        aur = aur_map.get(name, {})
        deps = [re.split(r"[><=]", d)[0].strip()
                for d in (aur.get("Depends") or []) + (aur.get("MakeDepends") or [])]
        deps = list(set(deps))
        blocked_deps = sorted(d for d in deps if d in pkg_names)
        queue.append({
            "name": name,
            "number": pkg_num[name],
            "blocked_dep_count": len(blocked_deps),
            "total_dep_count": len(deps),
            "blocked_deps": blocked_deps,
            "reverse_deps": [],
            "reverse_dep_count": 0,
        })

    name_map = {p["name"]: p for p in queue}
    for p in queue:
        for d in p["blocked_deps"]:
            if d in name_map:
                name_map[d]["reverse_deps"].append(p["name"])
    for p in queue:
        p["reverse_deps"] = sorted(p["reverse_deps"])
        p["reverse_dep_count"] = len(p["reverse_deps"])

    queue.sort(key=lambda x: (x["blocked_dep_count"], -x["reverse_dep_count"],
                               x["total_dep_count"], x["name"]))
    for i, p in enumerate(queue):
        p["rank"] = i + 1
    return queue


def atomic_write(path, content):
    d = os.path.dirname(path)
    fd, tmp = tempfile.mkstemp(dir=d, suffix=".tmp")
    try:
        with os.fdopen(fd, "w") as f:
            f.write(content)
        shutil.move(tmp, path)
    except BaseException:
        os.unlink(tmp)
        raise


# ── Artifact generators ──────────────────────────────────────────────

def gen_tree_json(queue):
    return json.dumps({
        "timestamp": TIMESTAMP,
        "pass_id": PASS_ID,
        "total_blocked": 0,
        "note": "BLOCKED pool depleted. All 43 formerly BLOCKED packages "
                "finalized as FAILED by this pass.",
        "previous_queue_finalized": [
            {k: p[k] for k in ("rank", "name", "number", "blocked_dep_count",
                                "reverse_dep_count", "total_dep_count",
                                "blocked_deps", "reverse_deps")}
            for p in queue
        ],
    }, indent=2) + "\n"


def gen_tree_md(queue):
    lines = [
        "# Blocked Dependency Tree", "",
        f"**Pass:** {PASS_ID}  ",
        f"**Timestamp:** {TIMESTAMP}  ",
        "**Total BLOCKED:** 0  ",
        "**Note:** Pool depleted. All 43 formerly BLOCKED packages finalized "
        "as FAILED (exhausted) by this pass.  ", "",
        "## Finalized Queue (43 packages → FAILED)", "",
        "| Rank | Package | # | Blocked Deps | Reverse Deps | Total Deps | Category |",
        "|------|---------|---|-------------|-------------|------------|----------|",
    ]
    for p in queue:
        cat = FINAL_DETERMINATIONS.get(p["name"], ("", "UNKNOWN", ""))[1]
        lines.append(f"| {p['rank']} | {p['name']} | {p['number']} | "
                     f"{p['blocked_dep_count']} | {p['reverse_dep_count']} | "
                     f"{p['total_dep_count']} | {cat} |")
    return "\n".join(lines) + "\n"


def gen_selection_json(queue):
    return json.dumps({
        "timestamp": TIMESTAMP, "pass_id": PASS_ID,
        "selected_count": len(queue),
        "packages": [{"rank": p["rank"], "name": p["name"], "number": p["number"]}
                     for p in queue],
    }, indent=2) + "\n"


def gen_summary_json(queue):
    cats = defaultdict(list)
    for p in queue:
        cats[FINAL_DETERMINATIONS.get(p["name"], ("", "UNKNOWN", ""))[1]].append(p["name"])
    return json.dumps({
        "timestamp": TIMESTAMP, "pass_id": PASS_ID,
        "total_evaluated": len(queue),
        "resolved_done": 0, "resolved_failed": len(queue), "remaining_blocked": 0,
        "categories": {k: {"count": len(v), "packages": v}
                       for k, v in sorted(cats.items())},
    }, indent=2) + "\n"


def gen_blocked_notes(queue):
    lines = [
        ";;; GNU Guix — Functional package management for GNU",
        ";;; Copyright (C) 2026 Gaurix contributors",
        ";;;",
        f";;; Blocked notes for {PASS_ID}",
        f";;; {len(queue)} packages finalized as FAILED (approaches exhausted).",
        f";;; Timestamp: {TIMESTAMP}", ";;;",
        ";;; This pass marks all formerly-BLOCKED packages as FAILED.",
        ";;; The stub recipes from deptree-resolver-260418j remain as documentation.",
        "",
    ]
    for p in queue:
        det = FINAL_DETERMINATIONS.get(p["name"], ("FAILED", "UNKNOWN", "no details"))
        lines += [f";;; {p['name']} (#{p['number']})",
                  f";;;   Category: {det[1]}",
                  f";;;   Reason: {det[2]}", ""]
    return "\n".join(lines)


# ── File updaters ────────────────────────────────────────────────────

def update_todo(path, queue):
    """Change heading DONE→FAILED, add FAILED status line, update body TODO Status."""
    with open(path) as f:
        content = f.read()

    for pkg in queue:
        name = pkg["name"]
        number = pkg["number"]
        det = FINAL_DETERMINATIONS.get(name, ("FAILED", "UNKNOWN", "unknown"))

        # 1) Update heading: ** DONE NUMBER. name ... → ** FAILED NUMBER. name ...
        #    Be careful: heading may contain tags/extra text after the name
        heading_pat = re.compile(
            rf'^(\*\*\s+)\S+(\s+{re.escape(str(number))}\.\s+{re.escape(name)})',
            re.MULTILINE)
        content = heading_pat.sub(rf'\g<1>FAILED\g<2>', content, count=1)

        # 2) Find entry boundaries
        entry_start_m = re.search(
            rf'^\*\*\s+\S+\s+{re.escape(str(number))}\.\s+{re.escape(name)}',
            content, re.MULTILINE)
        if not entry_start_m:
            print(f"  WARNING: entry not found for {number}. {name}")
            continue
        es = entry_start_m.start()
        # Next heading
        next_m = re.search(r'^\*\*\s+', content[es + 5:], re.MULTILINE)
        ee = (es + 5 + next_m.start()) if next_m else len(content)
        entry = content[es:ee]

        # 3) Build new status line
        new_status = (f"   - Status: FAILED: {det[1]}: {det[2]} ({PASS_ID})\n"
                      f"   - TODO Status: FAILED\n")

        # 4) Append the new status line to the entry
        updated = entry.rstrip("\n") + "\n" + new_status + "\n"
        content = content[:es] + updated + content[ee:]

    return content


def update_packages_scm(path):
    """Add a pass comment to packages.scm."""
    with open(path) as f:
        content = f.read()

    comment = (f"            ;; {PASS_ID}: pool depleted — 43 formerly BLOCKED "
               f"finalized as FAILED (exhausted)")

    # Insert after last resolver comment
    last = None
    for m in re.finditer(
            r'^\s+;; (?:deptree|recipe)-resolver-\S+.*$', content, re.MULTILINE):
        last = m
    if last:
        pos = last.end()
        content = content[:pos] + "\n" + comment + content[pos:]
    return content


# ── Main ─────────────────────────────────────────────────────────────

def main():
    print(f"=== {PASS_ID} ===")
    print(f"Timestamp: {TIMESTAMP}\n")

    # 1. Load AUR cache
    print("[1/7] Loading AUR cache...")
    aur = load_aur_cache()
    print(f"  {len(aur)} packages loaded")

    # 2. Load the 43 target packages from previous tree
    print("\n[2/7] Loading previous tree queue...")
    pkgs = load_prev_tree()
    print(f"  {len(pkgs)} packages from deptree-resolver-260418j")

    # 3. Build dependency tree
    print("\n[3/7] Building dependency tree...")
    queue = build_dependency_tree(pkgs, aur)
    print(f"  Queue: {len(queue)} packages")

    # Verify all 43 have determinations
    missing = [p["name"] for p in queue if p["name"] not in FINAL_DETERMINATIONS]
    if missing:
        print(f"  ERROR: missing determinations for: {missing}")
        return 1

    # 4. Write artifacts
    print("\n[4/7] Writing tree artifacts...")
    atomic_write(TREE_JSON, gen_tree_json(queue))
    atomic_write(TREE_MD, gen_tree_md(queue))
    atomic_write(SELECTION_JSON, gen_selection_json(queue))
    atomic_write(SUMMARY_JSON, gen_summary_json(queue))
    print(f"  {TREE_JSON}")
    print(f"  {TREE_MD}")
    print(f"  {SELECTION_JSON}")
    print(f"  {SUMMARY_JSON}")

    # 5. Write blocked notes
    print("\n[5/7] Writing blocked notes...")
    atomic_write(BLOCKED_NOTES_SCM, gen_blocked_notes(queue))
    print(f"  {BLOCKED_NOTES_SCM}")

    # 6. Update TODO file
    print("\n[6/7] Updating todo_general_packages.org...")
    updated_todo = update_todo(TODO_FILE, queue)
    atomic_write(TODO_FILE, updated_todo)
    print(f"  {len(queue)} entries → FAILED")

    # 7. Update packages.scm
    print("\n[7/7] Updating packages.scm...")
    updated_scm = update_packages_scm(PACKAGES_SCM)
    atomic_write(PACKAGES_SCM, updated_scm)
    print("  Pass comment added")

    # ── Summary ──
    cats = defaultdict(list)
    for p in queue:
        cats[FINAL_DETERMINATIONS[p["name"]][1]].append(p["name"])

    print(f"\n{'='*60}")
    print(f"Pass: {PASS_ID}")
    print(f"Total evaluated: {len(queue)}")
    print(f"Resolved DONE: 0")
    print(f"Resolved FAILED: {len(queue)}")
    print(f"Remaining BLOCKED: 0")
    print(f"\nCategory breakdown:")
    for cat in sorted(cats):
        print(f"  {cat}: {len(cats[cat])}")
        for name in sorted(cats[cat]):
            print(f"    - {name}")

    print(f"\nTop 20 priority queue:")
    for p in queue[:20]:
        d = FINAL_DETERMINATIONS[p["name"]]
        print(f"  {p['rank']:3d}. {p['name']:<35s} "
              f"b={p['blocked_dep_count']} r={p['reverse_dep_count']} "
              f"t={p['total_dep_count']} → {d[1]}")

    return 0


if __name__ == "__main__":
    sys.exit(main())
