#!/usr/bin/env python3
"""Dependency-tree-driven packaging pass: deptree-resolver-260418a

Processes all 100 selected BLOCKED packages:
- 11 resolved with new Guix recipes (+2 dependency packages)
- 89 remain BLOCKED with documented reasons

Updates:
- todo_general_packages.org: status lines for all 100 packages
- guix/gaurix/packages.scm: adds new package exports
- guix/gaurix/packages/general-compat.scm: adds new module import
- reports/: selection, summary, AUR lookup, tree artifacts
"""

import json
import re
import shutil
import tempfile
from datetime import datetime, timezone
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
TODO_FILE = ROOT / "todo_general_packages.org"
PACKAGES_SCM = ROOT / "guix" / "gaurix" / "packages.scm"
COMPAT_SCM = ROOT / "guix" / "gaurix" / "packages" / "general-compat.scm"
AUR_CACHE = ROOT / "data" / "aur-cache" / "packages-meta-ext-v1.json"

PASS_ID = "deptree-resolver-260418a"
TIMESTAMP = datetime.now(timezone.utc).isoformat()

# Packages resolved with new recipes
RESOLVED = {
    "arcticons-icon-theme": "DONE",
    "chipwhisperer-udev": "DONE",
    "openrgb-udev-rules": "DONE",
    "catppuccin-mocha-grub-theme-git": "DONE",  # mapped to catppuccin-mocha-grub-theme
    "flandre-grub-theme-git": "DONE",  # mapped to flandre-grub-theme
    "sddm-lain-wired-theme": "DONE",
    "multicolor-sddm-theme": "DONE",
    "nwg-wrapper": "DONE",
    "howdoi": "DONE",
    "rsvndump": "DONE",
    "ubuntu-wallpapers": "DONE",
}

# Packages that remain BLOCKED with reason codes
BLOCKED_REASONS = {
    # lib32 multilib - Guix doesn't support multilib
    "lib32-lv2": "LIB32_UNSUPPORTED: Guix does not support 32-bit multilib",
    "lib32-libbs2b": "LIB32_UNSUPPORTED: Guix does not support 32-bit multilib",
    "lib32-libmpeg2": "LIB32_UNSUPPORTED: Guix does not support 32-bit multilib",
    "lib32-wildmidi": "LIB32_UNSUPPORTED: Guix does not support 32-bit multilib",
    "lib32-libgme": "LIB32_UNSUPPORTED: Guix does not support 32-bit multilib",
    "lib32-rav1e": "LIB32_UNSUPPORTED: Guix does not support 32-bit multilib",
    "lib32-raptor": "LIB32_UNSUPPORTED: Guix does not support 32-bit multilib",
    "lib32-liblrdf": "LIB32_UNSUPPORTED: Guix does not support 32-bit multilib",
    "lib32-sratom": "LIB32_UNSUPPORTED: Guix does not support 32-bit multilib",
    "lib32-lilv": "LIB32_UNSUPPORTED: Guix does not support 32-bit multilib",
    "lib32-ffmpeg": "LIB32_UNSUPPORTED: Guix does not support 32-bit multilib",
    "lib32-gst-libav": "LIB32_UNSUPPORTED: Guix does not support 32-bit multilib",
    "lib32-gst-plugins-bad": "LIB32_UNSUPPORTED: Guix does not support 32-bit multilib",
    "lib32-gst-plugins-bad-libs": "LIB32_UNSUPPORTED: Guix does not support 32-bit multilib",
    "lib32-gst-plugins-ugly": "LIB32_UNSUPPORTED: Guix does not support 32-bit multilib",
    "lib32-amdvlk-bin": "LIB32_UNSUPPORTED: Guix does not support 32-bit multilib",

    # IUP toolkit stack not in Guix
    "iup": "COMPLEX_DEPS: depends on libcd and ftgl (neither in Guix), non-standard TecGraf build system",
    "lua-iup": "MISSING_DEP_IUP: depends on iup toolkit (not in Guix)",
    "lua51-iup": "MISSING_DEP_IUP: depends on iup toolkit (not in Guix)",
    "lua52-iup": "MISSING_DEP_IUP: depends on iup toolkit (not in Guix)",
    "lua53-iup": "MISSING_DEP_IUP: depends on iup toolkit (not in Guix)",

    # GNUstep/SOPE stack not in Guix
    "sope": "COMPLEX_BUILD: GNUstep application server, needs gnustep-base + gcc-objc",
    "sogo": "MISSING_DEP_SOPE: depends on sope, gnustep-base, libwbxml, libytnef (none in Guix)",

    # Complex/missing deps
    "vitis": "PROPRIETARY: Xilinx/AMD Vitis closed-source FPGA IDE, 50+ GB installer, non-redistributable",
    "np2kai-git": "COMPLEX_BUILD: requires custom patches, unstable git-only versioning, SDL2-compat shim",

    # Previously classified (confirming from prior passes)
    "godot-double-mono": "DOTNET_UNSUPPORTED: .NET SDK 8.0 not in Guix",
    "python-torchaudio-rocm": "COMPLEX_DEPS: ROCm ecosystem (100+ pkgs) not in Guix",
    "pacwall-git": "ARCH_SPECIFIC: queries pacman database exclusively",
    "asp": "ARCH_SPECIFIC: Arch Build System tool replaced by pkgctl",
    "xilinx-ise": "PROPRIETARY_LICENSE: registration-walled 6GB+ installer",
    "odoo18-nightly": "MASSIVE_SCALE: Odoo 18 ERP needs 500+ Python deps",
    "dude-bin": "ARCH_SPECIFIC: Rust binary linking against libalpm (pacman library)",
    "arch-shell": "ARCH_SPECIFIC: depends on devtools/mkarchroot for Arch chroots",
    "deemix-gui-appimage": "LEGAL_ISSUES: archived after legal action",
    "mt76-dkms-git": "DKMS_UNSUPPORTED: out-of-tree DKMS kernel module, mt76 already upstream",
    "fonts-apple": "PROPRIETARY_LICENSE: Apple restricted font license forbids redistribution",
    "libfprint-2-tod1-broadcom": "PROPRIETARY_LICENSE: Dell/Broadcom proprietary fingerprint driver",
    "brother-mfc-j5720dw": "PROPRIETARY_LICENSE: Brother proprietary printer driver with i386 blobs",
    "ntsync-dkms": "DKMS_UNSUPPORTED: ntsync upstream in Linux >= 6.14",
    "code-server-marketplace": "COMPLEX_DEPS: requires code-server (complex Node.js app not in Guix)",
    "devkitty-git": "COMPLEX_DEPS: requires Electron 41 not in Guix",
    "aiot-ide": "PROPRIETARY_LICENSE: Xiaomi proprietary with no source",
    "gdrcopy": "COMPLEX_DEPS: NVIDIA GPU Direct RDMA requiring proprietary kernel modules",
    "starsector": "PROPRIETARY_LICENSE: commercial game requiring paid license",
    "parus": "ARCH_SPECIFIC: TUI for paru (Arch AUR helper)",
    "sail-model": "COMPLEX_BUILD: OCaml project requiring opam ecosystem",
    "fnq-monitor": "DKMS_DEPENDENCY: depends on acpi_call (DKMS kernel module)",
    "cn-dascom-pin-driver": "PROPRIETARY_BINARY: Dascom printer driver with binary components",
    "olauncher": "PROPRIETARY_LICENSE: custom Minecraft launcher with custom license",
    "pdflib-lite": "CUSTOM_LICENSE: custom:pdflib-lite license with commercial restrictions",
    "nginx-mod-cgi": "NGINX_MODULE: requires nginx-src build infrastructure",
    "libretro-easyrpg-player": "MISSING_DEP: depends on liblcf (not in Guix)",
    "pypy3-pyparsing": "MISSING_RUNTIME: depends on PyPy3 (not in Guix)",
    "8192eu-dkms-git": "DKMS_UNSUPPORTED: out-of-tree WiFi driver via DKMS",
    "profile-sync-daemon-edge": "MISSING_RUNTIME: depends on profile-sync-daemon (not in Guix)",
    "seamonkey-i18n-es-es": "MISSING_RUNTIME: depends on SeaMonkey browser (not in Guix)",
    "palemoon-i18n-fr": "MISSING_RUNTIME: depends on Pale Moon browser (not in Guix)",
    "binance-app": "PROPRIETARY_LICENSE: Binance custom commercial license",
    "claudes-c-compiler": "NO_STABLE_RELEASE: GitHub repo has 0 releases",
    "claudes-c-compiler-doc": "NO_STABLE_RELEASE: same as claudes-c-compiler",
    "claudes-c-compiler-src": "NO_STABLE_RELEASE: same as claudes-c-compiler",
    "ec-su_axb35-dkms-git": "DKMS_UNSUPPORTED: embedded controller DKMS module",
    "framework-control": "MISSING_RUNTIME: depends on framework-system (not in Guix)",
    "gpufetch-nocuda-git": "COMPLEX_DEPS: depends on hsa-rocr (AMD ROCm runtime)",
    "gsdb": "COMPLEX_BUILD: Rust + Node.js hybrid needing webkit2gtk + npm build",
    "niri-companion": "MISSING_RUNTIME: depends on niri (not in Guix)",
    "qtutilities-qt6": "MISSING_DEP: depends on c++utilities (not in Guix)",
    "datagrip-jre": "PROPRIETARY_LICENSE: JetBrains custom JRE with restricted distribution",
    "deezer": "PROPRIETARY_LICENSE + ELECTRON: proprietary music service needing Electron 39",
    "scribus-svn": "COMPLEX_DEPS: dev version, prefer upstream stable scribus",
    "nautilus-typeahead": "COMPLEX_DEPS: requires rebuilding entire Nautilus",
    "pamac-all": "ARCH_SPECIFIC: Manjaro package manager GUI",
    "rtl8821ce-dkms-git": "DKMS_UNSUPPORTED: Realtek WiFi driver via DKMS",
    "subliminal": "COMPLEX_DEPS: 6+ Python deps missing",
    "ladybird-git": "COMPLEX_DEPS: vcpkg + experimental alpha browser",
    "cdesktopenv": "COMPLEX_DEPS: Motif + ksh + opensp not in Guix",
    "mkchromecast-git": "COMPLEX_DEPS: depends on python-pychromecast (not in Guix)",
    "hyperhdr-git": "COMPLEX_DEPS: depends on libayatana-appindicator (not in Guix)",
    "syncthingtray": "MISSING_DEP: depends on qtutilities, qtforkawesome, c++utilities (none in Guix)",
    "gksu": "ABANDONED_UPSTREAM: libgksu deprecated since 2012",
    "vim-youcompleteme-git": "COMPLEX_DEPS: multi-engine completion system needing ycmd server",
    "python-mtga-helper-git": "COMPLEX_DEPS: missing Python deps",
    "trilinos-git": "MASSIVE_SCALE: large HPC library with 100+ packages",
    "ocudu": "SOURCE_URL_UNKNOWN: no public Git repository found",
    "ripple": "SOURCE_UNAVAILABLE: no public Git repository found",
    "selinux-refpolicy-arch-git": "ARCH_SPECIFIC: Arch-specific SELinux reference policy",
    "otf-apple-pingfang": "PROPRIETARY_LICENSE: Apple PingFang font with restricted redistribution",
    "otf-apple-pingfang-relaxed": "PROPRIETARY_LICENSE: Apple PingFang variant with restricted license",
    "otf-apple-pingfang-ui": "PROPRIETARY_LICENSE: Apple PingFang UI variant with restricted license",
    "memtest86-efi": "PROPRIETARY_LICENSE: PassMark MemTest86 proprietary license",
    "ttf-ms-office365": "PROPRIETARY_LICENSE: Microsoft Office fonts prohibit redistribution",
}


def update_todo_org():
    """Update todo_general_packages.org with resolved/blocked statuses."""
    with open(TODO_FILE, "r") as f:
        lines = f.readlines()

    output_lines = []
    i = 0
    resolved_count = 0
    blocked_count = 0

    while i < len(lines):
        line = lines[i]
        m = re.match(r'^(\*\* )(BLOCKED)( \d+\. )(\S+)(.*)', line)
        if m:
            prefix, _status, num_part, pkg_name, rest = m.groups()
            pkg_name_stripped = pkg_name.strip()

            if pkg_name_stripped in RESOLVED:
                # Change status to DONE
                output_lines.append(f"{prefix}DONE{num_part}{pkg_name}  :{PASS_ID}:RECIPE\n")
                # Keep all existing lines until next heading
                i += 1
                while i < len(lines) and not lines[i].startswith("** "):
                    output_lines.append(lines[i])
                    i += 1
                # Add status line before next heading
                output_lines.append(f"- Status: DONE: RECIPE: packaged in {PASS_ID} ({TIMESTAMP})\n")
                resolved_count += 1
                continue

            elif pkg_name_stripped in BLOCKED_REASONS:
                reason = BLOCKED_REASONS[pkg_name_stripped]
                # Keep BLOCKED status, update reason tag
                reason_code = reason.split(":")[0].strip()
                output_lines.append(
                    f"{prefix}BLOCKED{num_part}{pkg_name}  :{PASS_ID}:{reason_code}: {reason}\n"
                )
                # Keep existing lines until next heading
                i += 1
                while i < len(lines) and not lines[i].startswith("** "):
                    output_lines.append(lines[i])
                    i += 1
                # Add status line
                output_lines.append(
                    f"- Status: BLOCKED: {reason} ({PASS_ID})\n"
                )
                blocked_count += 1
                continue
            else:
                # Package not in our selection, keep as-is
                output_lines.append(line)
        else:
            output_lines.append(line)
        i += 1

    # Atomic write
    with tempfile.NamedTemporaryFile(mode="w", dir=TODO_FILE.parent,
                                      suffix=".tmp", delete=False) as tmp:
        tmp.writelines(output_lines)
        tmp_path = Path(tmp.name)
    shutil.move(str(tmp_path), str(TODO_FILE))

    print(f"[{PASS_ID}] Updated org file: {resolved_count} resolved, {blocked_count} confirmed blocked")
    return resolved_count, blocked_count


def update_packages_scm():
    """Add new package exports to packages.scm using atomic write."""
    new_exports = [
        "python-terminaltables3",
        "python-keep",
        "arcticons-icon-theme",
        "chipwhisperer-udev",
        "openrgb-udev-rules",
        "catppuccin-mocha-grub-theme",
        "flandre-grub-theme",
        "sddm-lain-wired-theme",
        "multicolor-sddm-theme",
        "nwg-wrapper",
        "howdoi",
        "rsvndump",
        "ubuntu-wallpapers",
    ]

    with open(PACKAGES_SCM, "r") as f:
        content = f.read()

    # Find existing exports to avoid duplicates
    existing = set(re.findall(r'\(re-export (\S+)\)', content))
    existing |= set(re.findall(r'#:re-export \(([^)]+)\)', content))

    # Find the last re-export or export line to add after
    lines = content.split("\n")
    insert_idx = None
    for idx, line in enumerate(lines):
        if "(re-export " in line or "#:re-export" in line:
            insert_idx = idx

    if insert_idx is None:
        # Find last line before closing paren
        for idx in range(len(lines) - 1, -1, -1):
            if lines[idx].strip() and lines[idx].strip() != ")":
                insert_idx = idx
                break

    added = []
    for pkg in new_exports:
        if pkg not in existing:
            added.append(pkg)

    if added and insert_idx is not None:
        # Add comment and re-exports
        new_lines = [f"  ;; {PASS_ID} ({len(added)} packages)"]
        for pkg in added:
            new_lines.append(f"  (re-export {pkg})")
        lines = lines[:insert_idx + 1] + new_lines + lines[insert_idx + 1:]
        content = "\n".join(lines)

        with tempfile.NamedTemporaryFile(mode="w", dir=PACKAGES_SCM.parent,
                                          suffix=".tmp", delete=False) as tmp:
            tmp.write(content)
            tmp_path = Path(tmp.name)
        shutil.move(str(tmp_path), str(PACKAGES_SCM))
        print(f"[{PASS_ID}] Added {len(added)} exports to packages.scm")
    else:
        print(f"[{PASS_ID}] No new exports needed for packages.scm")

    return added


def update_general_compat_scm():
    """Add our module import to general-compat.scm using atomic write."""
    with open(COMPAT_SCM, "r") as f:
        content = f.read()

    module_line = f"  #:use-module (gaurix packages {PASS_ID})"

    if module_line.strip() in content:
        print(f"[{PASS_ID}] Module already imported in general-compat.scm")
        return False

    # Find where to insert (after last gaurix packages deptree-resolver line)
    lines = content.split("\n")
    insert_idx = None
    for idx, line in enumerate(lines):
        if "#:use-module (gaurix packages deptree-resolver-" in line:
            insert_idx = idx
        elif "#:use-module (gaurix packages recipe-resolver-" in line and insert_idx is None:
            insert_idx = idx

    if insert_idx is not None:
        lines.insert(insert_idx + 1, module_line)
    else:
        # Fallback: insert before first (guix packages) import
        for idx, line in enumerate(lines):
            if "#:use-module (guix packages)" in line:
                lines.insert(idx, module_line)
                break

    content = "\n".join(lines)
    with tempfile.NamedTemporaryFile(mode="w", dir=COMPAT_SCM.parent,
                                      suffix=".tmp", delete=False) as tmp:
        tmp.write(content)
        tmp_path = Path(tmp.name)
    shutil.move(str(tmp_path), str(COMPAT_SCM))
    print(f"[{PASS_ID}] Added module import to general-compat.scm")
    return True


def write_summary_report():
    """Write summary JSON report."""
    summary = {
        "pass_id": PASS_ID,
        "timestamp": TIMESTAMP,
        "total_evaluated": 100,
        "resolved": list(RESOLVED.keys()),
        "resolved_count": len(RESOLVED),
        "dependency_packages": ["python-terminaltables3", "python-keep"],
        "blocked_count": len(BLOCKED_REASONS),
        "blocked_categories": {},
    }

    # Categorize blocked reasons
    cats = {}
    for name, reason in BLOCKED_REASONS.items():
        cat = reason.split(":")[0].strip()
        cats.setdefault(cat, []).append(name)
    summary["blocked_categories"] = {k: len(v) for k, v in sorted(cats.items())}

    out_path = ROOT / "reports" / f"{PASS_ID}-summary.json"
    with open(out_path, "w") as f:
        json.dump(summary, f, indent=2)
    print(f"[{PASS_ID}] Wrote {out_path}")
    return summary


def write_aur_lookup():
    """Write AUR lookup report for resolved packages."""
    with open(AUR_CACHE, "r") as f:
        aur_data = json.load(f)
    aur_by_name = {pkg["Name"]: pkg for pkg in aur_data}

    lookup = {}
    for name in list(RESOLVED.keys()) + list(BLOCKED_REASONS.keys()):
        aur_pkg = aur_by_name.get(name)
        if aur_pkg:
            lookup[name] = {
                "ID": aur_pkg.get("ID"),
                "Name": aur_pkg["Name"],
                "Version": aur_pkg.get("Version"),
                "Description": aur_pkg.get("Description"),
                "URL": aur_pkg.get("URL"),
                "License": aur_pkg.get("License"),
            }

    out_path = ROOT / "reports" / f"{PASS_ID}-aur-lookup.json"
    with open(out_path, "w") as f:
        json.dump(lookup, f, indent=2)
    print(f"[{PASS_ID}] Wrote {out_path} ({len(lookup)} entries)")


def main():
    print(f"\n{'='*60}")
    print(f"  deptree-resolver-260418a")
    print(f"  {TIMESTAMP}")
    print(f"{'='*60}\n")

    # Update org file
    resolved_count, blocked_count = update_todo_org()

    # Update package registry
    added = update_packages_scm()

    # Update general-compat
    update_general_compat_scm()

    # Write reports
    summary = write_summary_report()
    write_aur_lookup()

    # Print summary
    print(f"\n{'='*60}")
    print(f"  Summary")
    print(f"{'='*60}")
    print(f"  Evaluated:  100 packages")
    print(f"  Resolved:   {len(RESOLVED)} packages (+ 2 dependency packages)")
    print(f"  Blocked:    {len(BLOCKED_REASONS)} packages")
    print(f"  New recipes: 13 (in deptree-resolver-260418a.scm)")
    print()
    print(f"  Resolved packages:")
    for name in sorted(RESOLVED.keys()):
        print(f"    - {name}")
    print()
    print(f"  New dependency packages:")
    print(f"    - python-terminaltables3")
    print(f"    - python-keep")
    print()
    print(f"  Blocked categories:")
    cats = summary.get("blocked_categories", {})
    for cat, count in sorted(cats.items(), key=lambda x: -x[1]):
        print(f"    {cat}: {count}")


if __name__ == "__main__":
    main()
