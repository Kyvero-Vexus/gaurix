#!/usr/bin/env python3
"""
Worker script for deptree-resolver-260417z.

The .scm module file is written directly (not embedded here).
This script handles:
1. guix/gaurix/packages/deptree-resolver-260417z-blocked-notes.scm
2. Updates todo_general_packages.org statuses
3. Updates guix/gaurix/packages/general-compat.scm
4. Updates guix/gaurix/packages.scm
5. Writes reports/deptree-resolver-260417z-summary.json
"""

import json
import os
import re
import shutil
import tempfile
from datetime import datetime, timezone

PASS_ID = "deptree-resolver-260417z"
TODO_PATH = "todo_general_packages.org"
PACKAGES_DIR = "guix/gaurix/packages"
REPORT_DIR = "reports"
BLOCKED_NOTES_PATH = f"{PACKAGES_DIR}/{PASS_ID}-blocked-notes.scm"
COMPAT_PATH = f"{PACKAGES_DIR}/general-compat.scm"
PACKAGES_SCM_PATH = "guix/gaurix/packages.scm"

# ═══ NEW RECIPES: 5 packages getting fresh Guix definitions ═══
NEW_RECIPE_NAMES = {
    "watchman": 14593,
    "resource-hacker": 14969,
    "jre-lts": 15002,
    "jdk-lts": 15004,
    "jdk-lts-doc": 15003,
}

NEW_RECIPE_EXPORTS = [
    "watchman-bin",
    "resource-hacker",
    "jre-lts-bin",
    "jdk-lts-bin",
    "jdk-lts-doc",
]

# ═══ BLOCKED: 21 packages that cannot be resolved (with approach history) ═══
BLOCKED_PACKAGES = {
    "raidrivecli": (14202, "MISSING_SOURCE",
        "Not in AUR cache; no upstream source.  "
        "Tried: (1) AUR search -- no PKGBUILD found; (2) web search for raidrivecli linux -- "
        "product is Windows/macOS only cloud drive client; (3) checked GitHub/GitLab -- no repo exists"),
    "chatgqt": (14575, "MISSING_SOURCE",
        "No upstream repository; source bundled only in AUR git.  "
        "Tried: (1) search for upstream git repo -- none exists, author publishes only via AUR; "
        "(2) extract from AUR tarball -- no stable URL for Guix origin; "
        "(3) recreate from scratch -- single-file PyQt6 WebEngine app but no redistributable source"),
    "fonts-apple": (14971, "PROPRIETARY_LICENSE",
        "Apple restricted font license forbids redistribution.  "
        "Tried: (1) check license terms -- explicitly prohibits redistribution outside Apple products; "
        "(2) look for open-source alternatives -- none are drop-in replacements with same name; "
        "(3) check if fonts are bundled with macOS SDK -- still restricted"),
    "xilinx-ise": (14616, "PROPRIETARY_LICENSE",
        "Xilinx proprietary FPGA tools requiring manual download and EULA acceptance.  "
        "Tried: (1) check for direct download URL -- requires Xilinx account login; "
        "(2) check for open-source FPGA toolchain alternatives -- exist but not ISE-compatible; "
        "(3) binary packaging -- download requires interactive EULA, cannot automate"),
    "libfprint-2-tod1-broadcom": (15005, "PROPRIETARY_LICENSE",
        "Dell/Broadcom proprietary binary fingerprint driver blob.  "
        "Tried: (1) check Launchpad PPA for .so files -- available but custom proprietary license; "
        "(2) check for open-source alternative -- libfprint supports many readers but not this Broadcom model; "
        "(3) binary repackaging -- requires libfprint-tod (modified libfprint2) not in Guix"),
    "brother-mfc-j5720dw": (15008, "PROPRIETARY_LICENSE",
        "Brother proprietary printer driver with i386 binary blobs.  "
        "Tried: (1) download Brother .deb packages -- available but contain i386 binaries requiring lib32-glibc; "
        "(2) check for source-available driver -- Brother provides only binary blobs; "
        "(3) package wrapper scripts only -- useless without the proprietary binary filter"),
    "redact-bin": (15032, "PROPRIETARY_LICENSE",
        "Proprietary Electron app with no source code available.  "
        "Tried: (1) check redact.dev for download -- AppImage available but custom restrictive license; "
        "(2) check for open-source alternative -- no equivalent exists; "
        "(3) binary repackaging -- license explicitly prohibits redistribution"),
    "aiot-ide": (15062, "PROPRIETARY_LICENSE",
        "Xiaomi proprietary IoT development IDE with no source.  "
        "Tried: (1) check iot.mi.com for direct download -- requires Chinese phone auth; "
        "(2) check for mirrors -- none found; "
        "(3) check license -- custom Xiaomi proprietary, no redistribution rights"),
    "pacwall-git": (14584, "ARCH_SPECIFIC",
        "Bash script that queries pacman database to generate dependency wallpapers.  "
        "Tried: (1) check source -- core logic uses pacman -Qi calls throughout; "
        "(2) adapt for Guix -- would need complete rewrite replacing pacman with guix commands; "
        "(3) package as-is with pacman runtime dep -- pacman not available in Guix"),
    "asp": (14587, "ARCH_SPECIFIC",
        "Arch Build System tool for managing PKGBUILDs from SVN/git.  "
        "Tried: (1) check deps -- requires devtools and Arch SVN infrastructure; "
        "(2) package the shell script alone -- depends on makepkg and pacman internals; "
        "(3) check for generic equivalent -- no portable version exists"),
    "dude-bin": (14699, "ARCH_SPECIFIC",
        "Rust binary for managing pacman orphan packages.  "
        "Tried: (1) check source -- directly links against libalpm (pacman library); "
        "(2) build from source without pacman -- compilation fails without libalpm headers; "
        "(3) use pre-built binary -- still requires libalpm.so at runtime"),
    "arch-shell": (14726, "ARCH_SPECIFIC",
        "Tool for disposable Arch chroot environments using devtools.  "
        "Tried: (1) check deps -- requires mkarchroot from devtools; "
        "(2) adapt for Guix containers -- would need complete rewrite; "
        "(3) package as reference script -- nonfunctional without Arch infrastructure"),
    "deemix-gui-appimage": (14759, "LEGAL_ISSUES",
        "Deezer music downloading tool that facilitates copyright infringement.  "
        "Tried: (1) check license -- GPL3 source but purpose is circumventing DRM; "
        "(2) check legal status -- tool designed to download copyrighted content without authorization; "
        "(3) decided against packaging due to legal liability for channel maintainers"),
    "ntsync-dkms": (15010, "DKMS_UNSUPPORTED",
        "Out-of-tree DKMS kernel module for NT sync primitives.  "
        "Tried: (1) ntsync is upstream in Linux >= 6.14, no DKMS needed; "
        "(2) Guix uses custom kernel configs, not DKMS; "
        "(3) already packaged ntsync-common (udev rules) and ntsync-header in prior pass -- "
        "kernel module is included in-tree for Linux >= 6.14"),
    "mt76-dkms-git": (14914, "DKMS_UNSUPPORTED",
        "Out-of-tree DKMS kernel module for MediaTek WiFi.  "
        "Tried: (1) mt76 driver is upstream in Linux kernel already; "
        "(2) DKMS version provides newer features but Guix uses custom kernel builds; "
        "(3) package as linux-module -- requires kernel source tree integration not feasible in batch"),
    "code-server-marketplace": (15031, "COMPLEX_PACKAGING",
        "Python script + JSON patch to enable VS Code marketplace in code-server.  "
        "Tried: (1) package as trivial-build-system with patch.py + patch.json -- "
        "tightly coupled to code-server product.json internal structure; "
        "(2) create standalone marketplace switcher -- requires code-server package first; "
        "(3) package as config overlay -- Guix service would be more appropriate but out of batch scope"),
    "odoo18-nightly": (14669, "COMPLEX_PACKAGING",
        "Massive Python ERP framework (100k+ LOC) with PostgreSQL integration.  "
        "Tried: (1) pip install odoo -- 500+ Python dependencies, most not in Guix; "
        "(2) package from official .deb -- contains embedded Python venv, not idiomatic; "
        "(3) pyproject-build-system -- would require packaging 50+ missing Python deps first"),
    "python-torchaudio-rocm": (14583, "COMPLEX_DEPS",
        "PyTorch audio with ROCm/HIP GPU support.  "
        "Tried: (1) check ROCm in Guix -- ROCm ecosystem not available; "
        "(2) package ROCm first -- 20+ packages (hip, rocblas, miopen, etc.), massive effort; "
        "(3) CPU-only build -- defeats the purpose of the -rocm variant"),
    "godot-double-mono": (14495, "COMPLEX_DEPS",
        "Godot engine with double-precision and Mono/.NET support.  "
        "Tried: (1) pre-built binary -- official releases do NOT include double-precision builds; "
        "(2) build from source -- requires dotnet-sdk-8.0 and nuget, .NET not in Guix; "
        "(3) package standard godot-mono binary -- available but wrong package (not double-precision)"),
    "void-electron-latest-bin": (14576, "COMPLEX_DEPS",
        "Void editor (VS Code fork) on latest Electron.  "
        "Tried: (1) check GitHub releases -- NO Linux binaries published (macOS/Windows only); "
        "(2) build from source -- requires Electron 34 build stack not in Guix; "
        "(3) AppImage -- none published for this project"),
    "devkitty-git": (15058, "COMPLEX_DEPS",
        "Developer tool requiring Electron 41.  "
        "Tried: (1) check GitHub releases -- macOS-only binaries, no Linux builds; "
        "(2) build from source -- requires npm + pnpm + nvm + electron 41; "
        "(3) AppImage -- none available for this project"),
}


def generate_blocked_notes():
    """Generate the blocked notes file."""
    lines = []
    lines.append(f";;; {PASS_ID} — blocked notes")
    lines.append(";;;")
    lines.append(f";;; {len(NEW_RECIPE_NAMES)} packages resolved with new recipes")
    lines.append(f";;; {len(BLOCKED_PACKAGES)} packages remain BLOCKED (with exhaustive approach history)")
    lines.append(";;;")

    by_reason = {}
    for name, (number, reason, detail) in sorted(BLOCKED_PACKAGES.items()):
        if reason not in by_reason:
            by_reason[reason] = []
        by_reason[reason].append((name, number, detail))

    for reason in sorted(by_reason.keys()):
        entries = by_reason[reason]
        lines.append(f";;; {reason} ({len(entries)} packages):")
        for name, number, detail in sorted(entries):
            lines.append(f";;;   {name} (#{number}): {detail}")
        lines.append(";;;")

    lines.append(f";;; NEW RECIPES ({len(NEW_RECIPE_NAMES)} packages):")
    for name, number in sorted(NEW_RECIPE_NAMES.items()):
        lines.append(f";;;   {name} (#{number}): New Guix recipe created")
    lines.append(";;;")

    return "\n".join(lines)


def update_todo_file(todo_path):
    """Update statuses in todo_general_packages.org using atomic file transform."""
    status_updates = {}

    for aur_name, num in NEW_RECIPE_NAMES.items():
        status_updates[num] = ("DONE", f"::{PASS_ID}:recipe_created:")

    for aur_name, (num, reason, detail) in BLOCKED_PACKAGES.items():
        status_updates[num] = ("BLOCKED", f":{PASS_ID}:{reason}: {detail[:120]}:")

    with open(todo_path, "r") as f:
        lines = f.readlines()

    new_lines = []
    for line in lines:
        m = re.match(r'^(\*\* )(BLOCKED|TODO|NEEDS_RECIPE_DESIGN|DONE|FAILED)( \d+\. )(\S+)(.*)\n?$', line)
        if m:
            prefix, old_status, num_part, pkg_name, rest = m.groups()
            num_match = re.search(r'(\d+)', num_part)
            if num_match:
                num = int(num_match.group(1))
                if num in status_updates and old_status == "BLOCKED":
                    new_status, status_text = status_updates[num]
                    new_lines.append(f"{prefix}{new_status}{num_part}{pkg_name}  {status_text}\n")
                    continue
        new_lines.append(line)

    fd, tmp_path = tempfile.mkstemp(dir=os.path.dirname(todo_path), suffix=".tmp")
    try:
        with os.fdopen(fd, 'w') as f:
            f.writelines(new_lines)
        shutil.move(tmp_path, todo_path)
    except Exception:
        os.unlink(tmp_path)
        raise


def update_general_compat(compat_path, pass_id, exports):
    """Add use-module and re-exports for the new resolver."""
    with open(compat_path, "r") as f:
        content = f.read()

    new_import = f"  #:use-module (gaurix packages {pass_id})"

    if new_import in content:
        print(f"  Import already present in {compat_path}")
    else:
        lines = content.split("\n")
        last_use_idx = -1
        for i, line in enumerate(lines):
            if "#:use-module" in line and "gaurix packages" in line:
                last_use_idx = i
        if last_use_idx >= 0:
            lines.insert(last_use_idx + 1, new_import)

        for exp in sorted(exports):
            re_line = f"(re-export {exp})"
            if re_line not in content:
                lines.append(re_line)

        fd, tmp_path = tempfile.mkstemp(dir=os.path.dirname(compat_path), suffix=".tmp")
        try:
            with os.fdopen(fd, 'w') as f:
                f.write("\n".join(lines))
            shutil.move(tmp_path, compat_path)
        except Exception:
            os.unlink(tmp_path)
            raise


def update_packages_scm(packages_path, pass_id):
    """Add use-module for the new resolver to packages.scm."""
    with open(packages_path, "r") as f:
        content = f.read()

    new_import = f"  #:use-module (gaurix packages {pass_id})"

    if new_import in content:
        print(f"  Import already present in {packages_path}")
        return

    lines = content.split("\n")
    last_use_idx = -1
    for i, line in enumerate(lines):
        if "#:use-module" in line and "gaurix packages" in line:
            last_use_idx = i

    if last_use_idx >= 0:
        lines.insert(last_use_idx + 1, new_import)

    fd, tmp_path = tempfile.mkstemp(dir=os.path.dirname(packages_path), suffix=".tmp")
    try:
        with os.fdopen(fd, 'w') as f:
            f.write("\n".join(lines))
        shutil.move(tmp_path, packages_path)
    except Exception:
        os.unlink(tmp_path)
        raise


def write_summary():
    """Write summary JSON report."""
    summary = {
        "timestamp": datetime.now(timezone.utc).isoformat(),
        "pass_id": PASS_ID,
        "new_recipe_count": len(NEW_RECIPE_NAMES),
        "blocked_count": len(BLOCKED_PACKAGES),
        "total_processed": len(NEW_RECIPE_NAMES) + len(BLOCKED_PACKAGES),
        "recipe_names": sorted(NEW_RECIPE_EXPORTS),
        "blocked_reasons": {},
    }

    for name, (num, reason, detail) in BLOCKED_PACKAGES.items():
        if reason not in summary["blocked_reasons"]:
            summary["blocked_reasons"][reason] = []
        summary["blocked_reasons"][reason].append(name)

    path = os.path.join(REPORT_DIR, f"{PASS_ID}-summary.json")
    with open(path, "w") as f:
        json.dump(summary, f, indent=2)
    print(f"Wrote: {path}")


def main():
    print(f"=== {PASS_ID} Worker ===")
    print(f"New recipes: {len(NEW_RECIPE_NAMES)}")
    print(f"Remaining blocked: {len(BLOCKED_PACKAGES)}")
    print(f"Total processed: {len(NEW_RECIPE_NAMES) + len(BLOCKED_PACKAGES)}")
    print()

    # 1. Write blocked notes
    notes_content = generate_blocked_notes()
    with open(BLOCKED_NOTES_PATH, "w") as f:
        f.write(notes_content)
    print(f"Wrote: {BLOCKED_NOTES_PATH}")

    # 2. Update todo file
    update_todo_file(TODO_PATH)
    print(f"Updated: {TODO_PATH}")

    # 3. Update general-compat.scm
    update_general_compat(COMPAT_PATH, PASS_ID, NEW_RECIPE_EXPORTS)
    print(f"Updated: {COMPAT_PATH}")

    # 4. Update packages.scm
    update_packages_scm(PACKAGES_SCM_PATH, PASS_ID)
    print(f"Updated: {PACKAGES_SCM_PATH}")

    # 5. Write summary report
    write_summary()

    # Print summary
    print(f"\n=== New Recipes ===")
    for name, num in sorted(NEW_RECIPE_NAMES.items()):
        print(f"  + {name} (#{num})")

    print(f"\n=== Remaining Blocked ===")
    for name, (num, reason, _) in sorted(BLOCKED_PACKAGES.items()):
        print(f"  x {name} (#{num}) [{reason}]")


if __name__ == "__main__":
    main()
