#!/usr/bin/env python3
"""Worker for deptree-resolver-260415f: updates todo_general_packages.org

Categories:
- SKIPPED: MISSING_SOURCE (23 not in AUR)
- DONE: already resolved in prior passes (7)
- DONE: new recipes in deptree-resolver-260415f.scm (19)
- DONE: renesas-flash-programmer-bin (1)
- BLOCKED: arch-specific, lib32/cross-compile, proprietary, complex deps (50)
"""

import re
import shutil
import tempfile
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
TODO_FILE = ROOT / "todo_general_packages.org"
PASS_ID = "deptree-resolver-260415f"

# ---- Package categorization ----

SKIPPED_MISSING_SOURCE = {
    58: "anbox-git",
    2986: "gram-editor-git",
    7510: "linux6.19.8.arch1-1-bin",
    7512: "linux6.19.8.arch1-1-docs-bin",
    7511: "linux6.19.8.arch1-1-headers-bin",
    9670: "linux6.19.9.arch1-1-bin",
    9672: "linux6.19.9.arch1-1-docs-bin",
    9671: "linux6.19.9.arch1-1-headers-bin",
    9956: "linux6.19.9.zen1-1-zen-bin",
    9958: "linux6.19.9.zen1-1-zen-docs-bin",
    9957: "linux6.19.9.zen1-1-zen-headers-bin",
    2097: "llama.cpp-aio",
    13452: "nodejs-ripencli",
    548: "nvidia-vulkan-dkms",
    1578: "openai-codex-autoup-bin",
    7333: "opensc-p11-kit-module",
    13442: "pinapp",
    6759: "projtlauncher",
    7482: "shimmy-bin",
    1149: "shorinclip-git",
    24: "vivaldi-ffmpeg-codecs",
    46: "whatsapp-for-linux",
    38: "zettlr",
}

DONE_ALREADY_RESOLVED = {
    13171: ("calculix-ccx", "already in recipe-resolver-260414ab.scm"),
    7423: ("gashell", "already resolved in prior pass"),
    13895: ("git-series-git", "already in recipe-resolver-260415e.scm"),
    7523: ("keepassxc-cryptomator", "already resolved in prior pass"),
    3557: ("linux-firmware-liquidio-git", "already resolved in prior pass"),
    3558: ("linux-firmware-qlogic-git", "already resolved in prior pass"),
    7426: ("pacboost-bin", "already resolved in prior pass"),
    7305: ("radeon-gpu-profiler", "already resolved in prior pass"),
}

DONE_NEW_RECIPES = {
    8971: ("gnu-apl", "gnu-apl v1.9, gnu-build-system, GPL-3.0+"),
    2463: ("opentyrian-git", "opentyrian v2.1, gnu-build-system with SDL2, GPL-2.0+"),
    2947: ("releng-tool", "releng-tool v3.0.0, pyproject-build-system, BSD-2-Clause"),
    13521: ("luaunbound", "luaunbound v1.0.0, gnu-build-system, MIT"),
    13620: ("lxappearance-obconf-gtk3", "lxappearance-obconf-gtk3 v0.2.4, gnu-build-system, GPL-2.0+"),
    10522: ("pass-audit", "pass-audit v1.2, gnu-build-system, GPL-3.0+"),
    4557: ("python-requirements-language-server", "python-requirements-language-server v0.0.22, pyproject-build-system, GPL-3.0+"),
    10153: ("ajantv2-tools", "ajantv2-tools v17.5.0, cmake-build-system, MIT"),
    867: ("pins-git", "pins v2.4.5, meson-build-system with GTK4/libadwaita, GPL-3.0+"),
    877: ("onset-git", "onset v1.0.3, cargo-build-system with GTK4/libadwaita, MIT"),
    2605: ("oniri-git", "oniri v1.0.0, cargo-build-system, GPL-3.0+"),
    841: ("proxybridge-git", "proxybridge v0.1.0, gnu-build-system, MIT"),
    10424: ("onthespot-appimage", "onthespot-bin v1.2.2, copy-build-system AppImage, GPL-2.0"),
    10045: ("libreoffice-extension-writingtool-bin", "libreoffice-extension-writingtool-bin v26.1, copy-build-system, LGPL-2.1"),
    3559: ("linux-firmware-bnx2x-git", "linux-firmware-bnx2x v20250305, copy-build-system firmware subset, GPL-2.0/GPL-3.0"),
    3555: ("linux-firmware-marvell-git", "linux-firmware-marvell v20250305, copy-build-system firmware subset, GPL-2.0/GPL-3.0"),
    3554: ("linux-firmware-mellanox-git", "linux-firmware-mellanox v20250305, copy-build-system firmware subset, GPL-2.0/GPL-3.0"),
    3553: ("linux-firmware-nfp-git", "linux-firmware-nfp v20250305, copy-build-system firmware subset, GPL-2.0/GPL-3.0"),
    3556: ("linux-firmware-qcom-git", "linux-firmware-qcom v20250305, copy-build-system firmware subset, GPL-2.0/GPL-3.0"),
    13605: ("renesas-flash-programmer-bin", "renesas-flash-programmer-bin v3.21, binary from Renesas, commercial"),
}

BLOCKED_ARCH_SPECIFIC = {
    1583: ("clean-chroot-manager", "ARCH_SPECIFIC: pacman/devtools clean chroot wrapper"),
    4064: ("goatdkernel", "ARCH_SPECIFIC: Arch Linux kernel build script"),
    9853: ("oxidizr-arch", "ARCH_SPECIFIC: Arch coreutils-to-Rust replacer, depends on pacman"),
    4654: ("pacboost", "ARCH_SPECIFIC: pacman frontend, depends on pacman"),
    19178: ("parui-git", "ARCH_SPECIFIC: paru/yay TUI frontend, depends on pacman"),
}

BLOCKED_LIB32_CROSS = {
    12383: ("lib32-libdovi", "LIB32_NOT_APPLICABLE: 32-bit Dolby Vision lib, Guix has no multilib"),
    1759: ("lib32-libstdc++5", "LIB32_NOT_APPLICABLE: 32-bit legacy GCC C++ lib, Guix has no multilib"),
    12209: ("lib32-opencl-nvidia-beta", "LIB32_NOT_APPLICABLE: 32-bit NVIDIA OpenCL, Guix has no multilib"),
    25120: ("mingw-w64-mariadb-connector-c", "CROSS_COMPILE: MinGW cross-compile target, not applicable"),
    10303: ("mipsel-linux-gnu-gcc", "CROSS_COMPILE: MIPS cross-compiler, specialized toolchain"),
}

BLOCKED_PROPRIETARY = {
    1064: ("furmark", "PROPRIETARY_BINARY: freeware GPU benchmark, no source available"),
    1006: ("masterpdfeditor-free", "PROPRIETARY_BINARY: proprietary freeware PDF editor v4, no source"),
    2543: ("dnspyex-wine-bin", "PROPRIETARY_BINARY: .NET debugger requiring Wine, complex stack"),
    8912: ("lacuna-webpki", "PROPRIETARY_BINARY: WebPKI native app, unknown/proprietary license"),
    21328: ("nvidia-beta", "PROPRIETARY_BINARY: NVIDIA beta driver, proprietary, needs DKMS"),
    968: ("opencl-amd-dev", "PROPRIETARY_BINARY: AMD ROCm OpenCL dev tools, proprietary AMD license"),
    25147: ("psychonauts", "PROPRIETARY_BINARY: commercial game, requires purchase, lib32 deps"),
    1023: ("osu", "PROPRIETARY_BINARY: proprietary rhythm game, needs Wine/umu-launcher"),
}

BLOCKED_COMPLEX_DEPS = {
    452: ("dms-shell-git", "DEP_CHAIN: needs quickshell + dgop (not in Guix), Go + QML build"),
    9965: ("gnome-shell-extension-pano-git", "DEP_CHAIN: GNOME ext needing npm/yarn build + libgda6"),
    8849: ("jellyseerr", "DEP_CHAIN: Node.js/pnpm app with massive npm dependency tree"),
    9282: ("laborejo", "DEP_CHAIN: needs libcalfbox-lss (not in Guix), specialized MIDI lib"),
    9274: ("patroneo", "DEP_CHAIN: needs libcalfbox-lss (not in Guix), same as laborejo"),
    11266: ("onedrivegui-git", "DEP_CHAIN: PySide6 + qt6-webengine + onedrive-abraunegg, complex"),
    787: ("openrgb-plugin-effects-git", "DEP_CHAIN: needs openrgb plugin API (not in Guix)"),
    956: ("pear-desktop-git", "DEP_CHAIN: Electron app with nvm/pnpm build"),
    10415: ("min", "DEP_CHAIN: Electron browser with npm build, electron38 dep"),
    25171: ("sickrage-git", "DEP_CHAIN: unmaintained Python PVR with virtualenv, no releases"),
    11305: ("rime-frost-git", "DEP_CHAIN: needs librime + rime-prelude + Lua integration"),
    11589: ("language-toolkit", "DEP_CHAIN: Rust app with complex cargo deps, no Cargo.lock published"),
    290: ("qobuz-player", "DEP_CHAIN: Rust + protobuf + npm multi-toolchain build"),
    10305: ("redeclipse", "DEP_CHAIN: FPS game needing custom game data + complex SDL2 build"),
}

ALREADY_EXHAUSTED_PRIOR = {
    13929: "firefox-nightly-i18n-pt-br",
    13456: "muzak",
    11852: "pacdiff-pacman-hook-git",
    13288: "reboot-arch-btw",
    4412: "happy-cli",
    7215: "immich-cli",
    11654: "lib32-python311-bin",
    7752: "libloot",
    13467: "llama.cpp-clblast",
    7280: "loginized",
    6999: "nbb",
    11070: "neural-amp-modeler-lv2",
    7710: "nvidia-340xx-dkms",
    7369: "omnissa-horizon-integrated-printing",
    7249: "osuboot-git",
    7019: "perplexity",
    13162: "portage-manifest",
}


def update_entry(content, num, name, new_status, reason):
    """Update a single entry in the org file."""
    # Match the entry header
    pattern = rf'^(\*\*\s+)BLOCKED(\s+{num}\.\s+{re.escape(name)})'

    def replacer(m):
        return f"{m.group(1)}{new_status}{m.group(2)}"

    new_content = re.sub(pattern, replacer, content, count=1, flags=re.MULTILINE)

    if new_content == content:
        print(f"  WARNING: Could not find entry for #{num} {name}")
        return content

    # Add status line after the header
    # Find the entry and add status after it
    header_pattern = rf'^(\*\*\s+{re.escape(new_status)}\s+{num}\.\s+{re.escape(name)}[^\n]*\n)'

    def add_status(m):
        return m.group(1) + f"   - Status: {new_status}: {reason} [{PASS_ID}]\n"

    new_content = re.sub(header_pattern, add_status, new_content, count=1, flags=re.MULTILINE)

    return new_content


def main():
    content = TODO_FILE.read_text()
    original_len = len(content)

    resolved_count = 0
    blocked_count = 0
    skipped_count = 0

    # 1. SKIPPED: MISSING_SOURCE packages
    print(f"\n[{PASS_ID}] Marking {len(SKIPPED_MISSING_SOURCE)} MISSING_SOURCE packages as SKIPPED...")
    for num, name in SKIPPED_MISSING_SOURCE.items():
        content = update_entry(content, num, name, "SKIPPED",
                             f"MISSING_SOURCE: not in AUR metadata cache, removed/renamed")
        skipped_count += 1

    # 2. DONE: already resolved in prior passes
    print(f"[{PASS_ID}] Marking {len(DONE_ALREADY_RESOLVED)} already-resolved packages as DONE...")
    for num, (name, reason) in DONE_ALREADY_RESOLVED.items():
        content = update_entry(content, num, name, "DONE", reason)
        resolved_count += 1

    # 3. DONE: new recipes
    print(f"[{PASS_ID}] Marking {len(DONE_NEW_RECIPES)} new recipes as DONE...")
    for num, (name, reason) in DONE_NEW_RECIPES.items():
        content = update_entry(content, num, name, "DONE",
                             f"recipe in deptree-resolver-260415f.scm ({reason})")
        resolved_count += 1

    # 4. BLOCKED: arch-specific
    print(f"[{PASS_ID}] Updating {len(BLOCKED_ARCH_SPECIFIC)} ARCH_SPECIFIC blockers...")
    for num, (name, reason) in BLOCKED_ARCH_SPECIFIC.items():
        # These stay BLOCKED, just add status
        header_pattern = rf'^(\*\*\s+BLOCKED\s+{num}\.\s+{re.escape(name)}[^\n]*\n)'
        def add_status(m, r=reason):
            return m.group(1) + f"   - Status: BLOCKED: {r} [{PASS_ID}]\n"
        content = re.sub(header_pattern, add_status, content, count=1, flags=re.MULTILINE)
        blocked_count += 1

    # 5. BLOCKED: lib32/cross-compile
    print(f"[{PASS_ID}] Updating {len(BLOCKED_LIB32_CROSS)} LIB32/CROSS_COMPILE blockers...")
    for num, (name, reason) in BLOCKED_LIB32_CROSS.items():
        header_pattern = rf'^(\*\*\s+BLOCKED\s+{num}\.\s+{re.escape(name)}[^\n]*\n)'
        def add_status(m, r=reason):
            return m.group(1) + f"   - Status: BLOCKED: {r} [{PASS_ID}]\n"
        content = re.sub(header_pattern, add_status, content, count=1, flags=re.MULTILINE)
        blocked_count += 1

    # 6. BLOCKED: proprietary
    print(f"[{PASS_ID}] Updating {len(BLOCKED_PROPRIETARY)} PROPRIETARY blockers...")
    for num, (name, reason) in BLOCKED_PROPRIETARY.items():
        header_pattern = rf'^(\*\*\s+BLOCKED\s+{num}\.\s+{re.escape(name)}[^\n]*\n)'
        def add_status(m, r=reason):
            return m.group(1) + f"   - Status: BLOCKED: {r} [{PASS_ID}]\n"
        content = re.sub(header_pattern, add_status, content, count=1, flags=re.MULTILINE)
        blocked_count += 1

    # 7. BLOCKED: complex deps
    print(f"[{PASS_ID}] Updating {len(BLOCKED_COMPLEX_DEPS)} COMPLEX_DEPS blockers...")
    for num, (name, reason) in BLOCKED_COMPLEX_DEPS.items():
        header_pattern = rf'^(\*\*\s+BLOCKED\s+{num}\.\s+{re.escape(name)}[^\n]*\n)'
        def add_status(m, r=reason):
            return m.group(1) + f"   - Status: BLOCKED: {r} [{PASS_ID}]\n"
        content = re.sub(header_pattern, add_status, content, count=1, flags=re.MULTILINE)
        blocked_count += 1

    # 8. Already exhausted - just add a note
    print(f"[{PASS_ID}] Adding notes to {len(ALREADY_EXHAUSTED_PRIOR)} already-exhausted packages...")
    for num, name in ALREADY_EXHAUSTED_PRIOR.items():
        header_pattern = rf'^(\*\*\s+BLOCKED\s+{num}\.\s+{re.escape(name)}[^\n]*\n)'
        def add_status(m, n=name):
            return m.group(1) + f"   - Status: BLOCKED: re-evaluated in {PASS_ID}; prior exhaustion reasons still apply\n"
        content = re.sub(header_pattern, add_status, content, count=1, flags=re.MULTILINE)
        blocked_count += 1

    # Write atomically
    tmp = tempfile.NamedTemporaryFile(mode='w', dir=TODO_FILE.parent,
                                      suffix='.tmp', delete=False)
    tmp.write(content)
    tmp.close()
    shutil.move(tmp.name, TODO_FILE)

    print(f"\n[{PASS_ID}] Summary:")
    print(f"  Resolved (DONE): {resolved_count}")
    print(f"  Skipped (MISSING_SOURCE): {skipped_count}")
    print(f"  Blocked (various reasons): {blocked_count}")
    print(f"  Total processed: {resolved_count + skipped_count + blocked_count}")
    print(f"  File size: {original_len} -> {len(content)}")


if __name__ == "__main__":
    main()
