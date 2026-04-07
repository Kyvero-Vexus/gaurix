#!/usr/bin/env python3
"""Update todo_general_packages.org statuses for the deptree-resolver-260407 run.

Performs a deterministic full-file transform: read → compute → write temp → atomic move.
"""
import re
import os
import tempfile
from pathlib import Path

REPO_ROOT = Path(__file__).resolve().parent.parent
ORG_FILE = REPO_ROOT / "todo_general_packages.org"

# Packages resolved with real Guix recipes in deptree-resolver-260407.scm
RESOLVED_RECIPES = {
    "davs2", "xavs2", "xevd", "xeve", "vvenc", "openapv",
    "libaribcaption", "uavs3d-git", "zmusic", "libuvc",
    "httpdirfs", "grepcidr", "domake", "arduino-ctags",
    "html2markdown", "elephant", "gslapper", "xboxdrv",
    "genders",
    # Python packages
    "python-art", "python-pid", "python-plyer", "python-condense-json",
    "python-m3u8", "python-wassima", "python-munge", "python-opencensus",
    "python-inquirerpy", "python-sse-starlette", "python-syncedlyrics",
    "python-materialyoucolor", "python-uv-dynamic-versioning",
    "python-urllib3-future",
    # Firmware/data/trivial
    "ghostty-shell-integration-nightly-bin", "ghostty-terminfo-nightly-bin",
    "clash-geoip", "keychron-link-udev",
}

# Packages resolved via compat aliases
RESOLVED_COMPAT = {
    "openssl-1.1": "compat alias for gnu:openssl-1.1 (already in general-compat.scm)",
    "qt5-scxml": "compat alias for qtscxml-5 (already in general-compat.scm)",
    "python312": "compat alias for python-3.12 (already in general-compat.scm)",
    "noto-fonts-emoji-blob": "compat alias for font-google-noto-emoji",
    "doas": "compat alias for opendoas",
}

# Packages that remain BLOCKED with updated reasons
BLOCKED_REASONS = {
    "qt5-doc": "BLOCKED: no Qt5 documentation meta-package in Guix; would need custom build from Qt sources",
    "bcompare": "BLOCKED: proprietary commercial software (Beyond Compare); no redistributable binary available",
    "rvgl-bin": "BLOCKED: proprietary game binary; no public release URL for direct download",
    "auto-auto-complete": "BLOCKED: depends on custom build system; codeberg source needs manual packaging",
    "archlinux-java-run": "BLOCKED: Arch-specific Java launcher depending on Arch java-runtime-common",
    "asf": "BLOCKED: requires .NET/ASP.NET runtime >= 10; dotnet ecosystem not in Guix",
    "cosmic-icons-git": "BLOCKED: depends on pop-icon-theme-git (not in Guix); COSMIC desktop not packaged",
    "yay": "BLOCKED: AUR helper depending on pacman/libalpm; Arch-specific, not portable",
    "openvino": "BLOCKED: complex ML toolkit; needs onetbb, flatbuffers, multiple custom deps; build system very complex",
    "xlibre-xserver-common-git": "BLOCKED: X server fork with complex build deps; needs xorg-util-macros and many xcb packages",
    "waydroid": "BLOCKED: not in AUR cache (removed/renamed); complex Android container requiring LXC/kernel modules",
    "xrizer-common": "BLOCKED: needs lib32-rust-libs and complex Rust cross-compilation; OpenVR reimplementation",
    "sqlite-utils": "BLOCKED: depends on python-sqlite-fts4 and python-click-default-group (not in Guix)",
    "qt5-connectivity": "BLOCKED: Qt5 Bluetooth module; qtconnectivity package exists but is Qt6; Qt5 version dropped",
    "cosmic-randr-git": "BLOCKED: COSMIC desktop Rust package needing cosmic-specific Wayland protocols",
    "python-condense-json": "RESOLVED: recipe in deptree-resolver-260407.scm",
    "python-m3u8": "RESOLVED: recipe in deptree-resolver-260407.scm",
    "python-uv-dynamic-versioning": "RESOLVED: recipe in deptree-resolver-260407.scm",
    "mozc-ut-full-common": "BLOCKED: requires Bazel build system; very complex Japanese IME build process",
    "llvm-libs-minimal-git": "BLOCKED: LLVM git trunk build; extremely complex and resource-intensive",
    "hyprtoolkit-git": "BLOCKED: depends on aquamarine-git, hyprgraphics-git, hyprlang-git (all unpackaged -git deps)",
    "wayfire": "BLOCKED: depends on wf-config and wlroots0.19 (specific wlroots version not in Guix)",
    "logmein-hamachi": "BLOCKED: proprietary VPN service; binary not freely redistributable",
    "libklvanc": "BLOCKED: no tagged releases on GitHub; source URL not available",
    "mips64-linux-gnu-linux-api-headers": "BLOCKED: cross-compilation kernel headers; Guix has its own cross-build approach",
    "lianwalld-bin": "BLOCKED: depends on awww and mpvpaper (neither in Guix)",
    "qt5-scxml": "RESOLVED: compat alias for qtscxml-5 in general-compat.scm",
    "xone-dongle-firmware": "BLOCKED: firmware extraction requires html-xml-utils and w3m; URL parsing at build time",
    "flite1": "BLOCKED: upstream source URL (speech.cs.cmu.edu) is down; no alternate source found",
    "gtk-sharp-2": "BLOCKED: GTK2 C# bindings requiring Mono runtime (not in Guix)",
    "quirc": "BLOCKED: depends on sdl12-compat and sdl_gfx (SDL1.2 compat not in Guix)",
    "foobar2000": "BLOCKED: Windows audio player running under Wine; complex Wine packaging",
    "libelectron": "BLOCKED: Electron meta-package depending on npm; Electron not in Guix",
    "mozc": "BLOCKED: requires Bazel build system and complex build process",
    "paru": "BLOCKED: AUR helper depending on pacman/libalpm; Arch-specific",
    "python-wassima": "RESOLVED: recipe in deptree-resolver-260407.scm",
    "python-pid": "RESOLVED: recipe in deptree-resolver-260407.scm",
    "bms-shell": "BLOCKED: depends on quickshell, dgop, ttf-material-symbols-variable (not in Guix)",
    "lcevcdec": "BLOCKED: no tagged releases on GitHub; source URL resolution failed",
    "dotnet-runtime-9.0-bin": "BLOCKED: .NET runtime binary; complex dependency on dotnet-host ecosystem",
    "wl-screenrec": "BLOCKED: Rust/Cargo build needing vulkan-headers and libva-driver (complex GPU deps)",
    "openbangla-keyboard-git": "BLOCKED: Bengali IME needing openbangla-im, ibus/fcitx5 integration",
    "qtutilities-qt6": "BLOCKED: depends on c++utilities (not in Guix)",
    "radicle-node": "BLOCKED: Rust/Cargo build needing specific libgit2 version",
    "qmc2-common-git": "BLOCKED: MAME frontend needing qt5-script, qt5-xmlpatterns (deprecated Qt5 modules)",
    "cosmic-comp-git": "BLOCKED: COSMIC desktop compositor; depends on cosmic-specific Wayland protocols",
    "linux-lqx": "BLOCKED: custom kernel; Guix uses its own kernel build approach with linux-libre",
    "python-urllib3-future": "RESOLVED: recipe in deptree-resolver-260407.scm",
    "vscodium-translucent": "BLOCKED: complex Electron/Node.js build needing nvm, rustup, gulp",
    "ros2-arch-deps": "BLOCKED: Arch-specific meta-package for ROS2 build dependencies",
    "sonic-win": "BLOCKED: KWin fork with 50+ KDE/Plasma dependencies; extremely complex",
    "libfmod": "BLOCKED: proprietary FMOD audio engine; binary not freely redistributable",
    "localepurge": "BLOCKED: Debian-specific locale removal tool; not applicable to Guix's functional model",
    "nordvpn-bin": "BLOCKED: proprietary VPN client; binary not freely redistributable",
    "redhat-fonts": "BLOCKED: need to verify OFL license compatibility and font file source URL",
    "tailscale": "BLOCKED: not in AUR cache (removed/renamed); complex Go VPN client",
    "tosu": "BLOCKED: osu! memory reader; game-specific tool with unclear build process",
    "upd72020x-fw": "BLOCKED: proprietary Renesas USB firmware; not freely redistributable",
    "aspnet-runtime-bin": "BLOCKED: depends on dotnet-runtime-bin (not in Guix)",
    "aspnet-targeting-pack-bin": "BLOCKED: depends on dotnet-targeting-pack-bin (not in Guix)",
    "asroot": "BLOCKED: depends on libenv (not in Guix); alternative to sudo/doas",
    "brscan4": "BLOCKED: proprietary Brother scanner driver; binary not freely redistributable",
    "deb2targz": "BLOCKED: trivial Perl script for Debian packages; not useful on Guix",
    "kaitai-struct-compiler": "BLOCKED: Java-based compiler; needs specific java-runtime packaging",
}


def update_org_file():
    with open(ORG_FILE, 'r', encoding='utf-8') as f:
        lines = f.readlines()

    heading_re = re.compile(r'^(\*\*\s+)(BLOCKED|DONE|FAILED|TODO|IN_PROGRESS)(\s+\d+\.\s+)(\S+)')
    status_re = re.compile(r'^(\s+-\s+TODO Status:\s+)(BLOCKED|DONE|FAILED|TODO|IN_PROGRESS)')
    detail_re = re.compile(r'^(\s+-\s+Status:\s+)(.*)')

    output_lines = []
    current_pkg = None
    i = 0
    changed = 0

    while i < len(lines):
        line = lines[i]
        m = heading_re.match(line)
        if m:
            prefix, old_status, mid, pkg_name = m.groups()
            current_pkg = pkg_name

            if pkg_name in RESOLVED_RECIPES:
                new_line = f"{prefix}DONE{mid}{pkg_name}\n"
                output_lines.append(new_line)
                changed += 1
                i += 1
                continue
            elif pkg_name in RESOLVED_COMPAT:
                new_line = f"{prefix}DONE{mid}{pkg_name}\n"
                output_lines.append(new_line)
                changed += 1
                i += 1
                continue

        sm = status_re.match(line)
        if sm and current_pkg:
            prefix_s, old_st = sm.groups()
            if current_pkg in RESOLVED_RECIPES:
                output_lines.append(f"{prefix_s}DONE\n")
                i += 1
                continue
            elif current_pkg in RESOLVED_COMPAT:
                output_lines.append(f"{prefix_s}DONE\n")
                i += 1
                continue

        dm = detail_re.match(line)
        if dm and current_pkg:
            prefix_d, old_detail = dm.groups()
            if current_pkg in RESOLVED_RECIPES:
                reason = f"Resolved in deptree-resolver-260407.scm with real Guix recipe (2026-04-07)"
                output_lines.append(f"{prefix_d}{reason}\n")
                i += 1
                continue
            elif current_pkg in RESOLVED_COMPAT:
                reason = f"Resolved via {RESOLVED_COMPAT[current_pkg]} (2026-04-07)"
                output_lines.append(f"{prefix_d}{reason}\n")
                i += 1
                continue
            elif current_pkg in BLOCKED_REASONS:
                reason = BLOCKED_REASONS[current_pkg]
                if not reason.startswith("RESOLVED"):
                    output_lines.append(f"{prefix_d}{reason} (deptree-resolver-260407, 2026-04-07)\n")
                    i += 1
                    continue

        output_lines.append(line)
        i += 1

    # Write atomically
    tmp_fd, tmp_path = tempfile.mkstemp(dir=str(REPO_ROOT), suffix='.org')
    try:
        with os.fdopen(tmp_fd, 'w', encoding='utf-8') as f:
            f.writelines(output_lines)
        os.replace(tmp_path, str(ORG_FILE))
    except:
        os.unlink(tmp_path)
        raise

    resolved_total = len(RESOLVED_RECIPES) + len(RESOLVED_COMPAT)
    print(f"Updated {changed} headings")
    print(f"Resolved: {resolved_total} packages ({len(RESOLVED_RECIPES)} recipes + {len(RESOLVED_COMPAT)} compat)")
    print(f"Remaining BLOCKED with updated reasons: {len([r for r in BLOCKED_REASONS.values() if r.startswith('BLOCKED')])}")


if __name__ == '__main__':
    update_org_file()
