#!/usr/bin/env python3
"""recipe-resolver-260423f: Resolve 30 NEEDS_RECIPE_DESIGN packages.

12 new recipes + 18 EXHAUSTED.
"""

import json
import os
import shutil
import tempfile

PASS_ID = "recipe-resolver-260423f"
ORG_FILE = "todo_general_packages.org"
PACKAGES_SCM = "guix/gaurix/packages.scm"
COMPAT_SCM = "guix/gaurix/packages/general-compat.scm"

# Recipes: (pkg_name, pkg_num, header_line, build_system, version, license_str)
RECIPES = [
    ("faal", 7917, 63398, "cmake", "1.0.4.3", "MIT"),
    ("atmosim", 7928, 63464, "cmake", "2.4.1", "GPL-3.0+"),
    ("calf-gui", 7929, 63469, "cmake", "0.90.9", "GPL-2.0+/LGPL-2.0+"),
    ("pms-git", 7931, 63481, "go", "0.42", "MIT"),
    ("lux-dl-git", 7936, 63512, "go", "0.24.1", "MIT"),
    ("derper-ipcert", 7913, 63377, "go", "1.96.4", "BSD-3"),
    ("axenc-git", 7901, 63309, "cmake", "0.1.0", "GPL-3.0+"),
    ("qtask-git", 7891, 63242, "cmake", "0.1", "MIT"),
    ("openocd-raspberrypi-git", 7848, 62972, "gnu", "0.12.0", "GPL-2.0+"),
    ("urbackup2-server", 7902, 63314, "gnu", "2.5.36", "GPL-3.0+"),
    ("sql-workbench", 7935, 63507, "copy", "132", "custom"),
    ("vacuum", 7907, 63343, "go", "0.26.1", "MIT"),
]

# Exhausted: (pkg_name, pkg_num, header_line, reason_code, detail)
EXHAUSTED = [
    ("checkpac", 7843, 62945,
     "ARCH_SPECIFIC",
     "A1: bash script calling pacman/expac (Arch-only); A2: no Guix equivalents for pacman; A3: tool fundamentally Arch-specific"),
    ("mkinitcpio-ykfde", 7847, 62967,
     "ARCH_SPECIFIC",
     "A1: mkinitcpio hook (Arch-specific initramfs); A2: Guix has different initrd mechanism; A3: Yubikey logic tightly coupled to mkinitcpio"),
    ("mkinitcpio-ykfde-git", 7849, 62977,
     "ARCH_SPECIFIC",
     "A1: same mkinitcpio dependency as stable; A2: same rewrite required; A3: identical Arch-specific blocker"),
    ("n-m3u8dl-re-git", 7850, 62982,
     "DOTNET_REQUIRED",
     "A1: .NET 9+ SDK required, not in Guix; A2: dotnet publish --self-contained needs SDK; A3: prebuilt binary bundles 100MB .NET runtime"),
    ("uptimekit", 7865, 63076,
     "NPM_ECOSYSTEM",
     "A1: npm install -g distribution only; A2: npm bundling not idiomatic for Guix; A3: platform-specific node_modules not reproducible"),
    ("adblock2privoxy", 7866, 63081,
     "HASKELL_DEPS_CHAIN",
     "A1: guix import pulls 8+ missing Haskell deps; A2: parsec-permutation/missingh chains need sub-deps; A3: all versions need same dep set"),
    ("nekoray-qt6", 7876, 63147,
     "COMPLEX_DEPS",
     "A1: Qt6 + sing-box Go backend with 100+ Go modules; A2: dual C++/Go build; A3: no prebuilt releases"),
    ("raven-reader", 7877, 63152,
     "ELECTRON_NPM",
     "A1: Electron/Vue.js with full npm dep tree; A2: no AppImage release; A3: no .deb release; npm-only"),
    ("vcpkg-git", 7890, 63237,
     "COMPLEX_DEPS",
     "A1: cmake builds tool that downloads at runtime (incompatible with Guix sandbox); A2: no standalone binary; A3: stripping downloads removes core purpose"),
    ("brother-hll2445dw-lpr-bin", 7893, 63253,
     "PROPRIETARY_BINARY",
     "A1: proprietary i386 binary blobs from .deb; A2: no generic CUPS driver for this model; A3: brlaser doesn't support HL-L2445DW"),
    ("libisl-git", 7900, 63304,
     "UPSTREAM_DELETED",
     "A1: AUR git repo is empty (no commits); A2: upstream isl already in Guix; A3: -git variant adds no value"),
    ("github-desktop-plus", 7910, 63362,
     "ELECTRON_NPM",
     "A1: Electron + yarn + hundreds of npm deps; A2: prebuilt .deb bundles 200MB Electron; A3: no AppImage available"),
    ("mingw-w64-minizip-ng", 7912, 63372,
     "CROSS_TOOLCHAIN",
     "A1: requires MinGW-w64 cross-compilation toolchain; A2: Guix cross model differs; A3: Windows-only target defeats purpose"),
    ("brother-dcpt300", 7916, 63393,
     "PROPRIETARY_BINARY",
     "A1: proprietary Brother CUPS/LPR binaries; A2: no open-source driver for DCP-T300; A3: brlaser doesn't support ink tank models"),
    ("python-pyqt5-webengine", 7918, 63403,
     "QT_WEBENGINE_COMPLEX",
     "A1: requires building QtWebEngine (~2GB Chromium source); A2: SIP-generated wrappers need exact Qt version match; A3: binary wheels not reproducible"),
    ("borked3ds", 7925, 63448,
     "COMPLEX_DEPS",
     "A1: 51 git submodules each needing individual Guix origin; A2: vendored forks incompatible with system versions; A3: no prebuilt Linux binaries"),
    ("grub-git", 7926, 63453,
     "ALREADY_IN_GUIX",
     "A1: grub-git needs gnulib+grub-extras submodules + multi-platform build; A2: maintenance burden for dev snapshot; A3: stable grub already in Guix"),
    ("twitter", 7939, 63529,
     "ELECTRON_NPM",
     "A1: depends on Arch-specific libelectron packages; A2: Electron not packaged in Guix upstream; A3: thin wrapper needs full Electron chain"),
]


def update_org_file():
    """Insert status lines after the Blocker line for each package."""
    with open(ORG_FILE, "r") as f:
        lines = f.readlines()

    # Collect all insertions: (line_number_1indexed, new_line_text)
    insertions = {}

    for pkg_name, pkg_num, header_line, build_sys, version, lic in RECIPES:
        blocker_line = header_line + 3  # Blocker is always at offset +3
        new_status = (
            f"   - Status: DONE: recipe in recipe-resolver-260423f.scm "
            f"({pkg_name} v{version}, {build_sys}-build-system, {lic}) ({PASS_ID})\n"
        )
        insertions[blocker_line] = new_status

    for pkg_name, pkg_num, header_line, reason_code, detail in EXHAUSTED:
        blocker_line = header_line + 3
        new_status = (
            f"   - Status: BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED: "
            f"{reason_code}: {detail} ({PASS_ID})\n"
        )
        insertions[blocker_line] = new_status

    # Build new content by inserting after each target line
    new_lines = []
    for i, line in enumerate(lines):
        line_num = i + 1
        new_lines.append(line)
        if line_num in insertions:
            new_lines.append(insertions[line_num])

    # Atomic write
    fd, tmp_path = tempfile.mkstemp(dir=".", suffix=".org.tmp")
    try:
        with os.fdopen(fd, "w") as f:
            f.writelines(new_lines)
        shutil.move(tmp_path, ORG_FILE)
    except:
        os.unlink(tmp_path)
        raise

    print(f"Updated {ORG_FILE}: inserted {len(insertions)} status lines "
          f"({len(RECIPES)} DONE + {len(EXHAUSTED)} EXHAUSTED)")


def update_packages_scm():
    """Add pass comment and new exports to packages.scm."""
    with open(PACKAGES_SCM, "r") as f:
        content = f.read()

    lines = content.split("\n")

    # 1. Find the last resolver comment and insert after it
    last_comment_idx = None
    for i, line in enumerate(lines):
        stripped = line.strip()
        if stripped.startswith(";; recipe-resolver-") or stripped.startswith(";; deptree-resolver-"):
            last_comment_idx = i

    if last_comment_idx is not None:
        new_comment = (
            "            ;; recipe-resolver-260423f "
            "(30 NRD resolved: 12 recipes, 18 EXHAUSTED)"
        )
        lines.insert(last_comment_idx + 1, new_comment)

    # 2. Add use-module for the new recipe resolver
    # Find the last #:use-module line
    last_use_idx = None
    for i, line in enumerate(lines):
        if "#:use-module" in line:
            last_use_idx = i

    if last_use_idx is not None:
        new_use = "  #:use-module (gaurix packages recipe-resolver-260423f)"
        lines.insert(last_use_idx + 1, new_use)

    # 3. Add new exports before the closing ))
    # Find the last )) which closes the define-module
    recipe_names = [r[0] for r in RECIPES]
    export_block = "\n".join(f"               {name}" for name in recipe_names)

    # Find the closing paren of the export list
    for i in range(len(lines) - 1, -1, -1):
        if lines[i].strip() == "))":
            # Insert exports before the closing ))
            lines.insert(i, "")
            for name in reversed(recipe_names):
                lines.insert(i, f"               {name}")
            break

    new_content = "\n".join(lines)

    fd, tmp_path = tempfile.mkstemp(dir=".", suffix=".scm.tmp")
    try:
        with os.fdopen(fd, "w") as f:
            f.write(new_content)
        shutil.move(tmp_path, PACKAGES_SCM)
    except:
        os.unlink(tmp_path)
        raise

    print(f"Updated {PACKAGES_SCM}: added pass comment + {len(recipe_names)} exports")


def update_compat_scm():
    """Add use-module and re-exports for new recipes to general-compat.scm."""
    with open(COMPAT_SCM, "r") as f:
        content = f.read()

    lines = content.split("\n")

    # 1. Add use-module after last existing use-module for recipe-resolver
    last_recipe_use_idx = None
    for i, line in enumerate(lines):
        if "gaurix packages recipe-resolver-" in line and "#:use-module" in line:
            last_recipe_use_idx = i

    if last_recipe_use_idx is not None:
        new_use = "  #:use-module (gaurix packages recipe-resolver-260423f)"
        lines.insert(last_recipe_use_idx + 1, new_use)

    # 2. Add re-exports at the end (before the last line if it's empty)
    recipe_names = [r[0] for r in RECIPES]
    for name in recipe_names:
        lines.append(f"(re-export {name})")

    new_content = "\n".join(lines)

    fd, tmp_path = tempfile.mkstemp(dir=".", suffix=".scm.tmp")
    try:
        with os.fdopen(fd, "w") as f:
            f.write(new_content)
        shutil.move(tmp_path, COMPAT_SCM)
    except:
        os.unlink(tmp_path)
        raise

    print(f"Updated {COMPAT_SCM}: added use-module + {len(recipe_names)} re-exports")


def write_summary_report():
    """Write a JSON summary report."""
    summary = {
        "pass_id": PASS_ID,
        "total_evaluated": len(RECIPES) + len(EXHAUSTED),
        "recipes_created": len(RECIPES),
        "exhausted": len(EXHAUSTED),
        "recipes": [],
        "exhausted_by_reason": {},
        "exhausted_packages": []
    }

    for pkg_name, pkg_num, _, build_sys, version, lic in RECIPES:
        summary["recipes"].append({
            "name": pkg_name,
            "pkg_num": pkg_num,
            "build_system": build_sys,
            "version": version,
            "license": lic,
        })

    for pkg_name, pkg_num, _, reason_code, detail in EXHAUSTED:
        summary["exhausted_by_reason"][reason_code] = \
            summary["exhausted_by_reason"].get(reason_code, 0) + 1
        summary["exhausted_packages"].append({
            "name": pkg_name,
            "pkg_num": pkg_num,
            "status": "EXHAUSTED",
            "reason": reason_code,
            "detail": detail
        })

    report_path = f"reports/{PASS_ID}-summary.json"
    with open(report_path, "w") as f:
        json.dump(summary, f, indent=2)
    print(f"Wrote {report_path}")


if __name__ == "__main__":
    update_org_file()
    update_packages_scm()
    update_compat_scm()
    write_summary_report()
    print(f"\n{PASS_ID} complete: {len(RECIPES) + len(EXHAUSTED)} packages evaluated, "
          f"{len(RECIPES)} recipes, {len(EXHAUSTED)} EXHAUSTED")
