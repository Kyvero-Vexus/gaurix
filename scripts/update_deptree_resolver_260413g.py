#!/usr/bin/env python3
"""
Generate deptree-resolver-260413g.scm and blocked-notes, then update index files.
Run ID: deptree-resolver-260413g

Resolves 100 BLOCKED packages from dependency-tree priority queue.
"""

import os
import re
import shutil
import tempfile
import json
from datetime import datetime, timezone

BASE = "/home/slime/projects/gaurix"
SCM_FILE = os.path.join(BASE, "guix/gaurix/packages/deptree-resolver-260413g.scm")
BLOCKED_NOTES_FILE = os.path.join(BASE, "guix/gaurix/packages/deptree-resolver-260413g-blocked-notes.scm")
PACKAGES_SCM = os.path.join(BASE, "guix/gaurix/packages.scm")
COMPAT_SCM = os.path.join(BASE, "guix/gaurix/packages/general-compat.scm")
TODO_FILE = os.path.join(BASE, "todo_general_packages.org")
SUMMARY_JSON = os.path.join(BASE, "reports/deptree-resolver-260413g-summary.json")

RUN_ID = "deptree-resolver-260413g"
TIMESTAMP = datetime.now(timezone.utc).isoformat()

# ── Package definitions ──────────────────────────────────────────────────
# (num, aur_name, guix_name, status, reason_code, detail)

PACKAGES = [
    # --- DONE: recipes created ---
    (10811, "argc", "argc", "DONE", None, None),
    (7699, "ascii-image-converter", "ascii-image-converter", "DONE", None, None),
    (1481, "bfree-bin", "bfree-bin", "DONE", None, None),
    (2988, "bfree", "bfree", "DONE", None, None),
    (7300, "archium-bin", "archium-bin", "DONE", None, None),
    (10341, "autosubsync-bin", "autosubsync-bin", "DONE", None, None),
    (7463, "briar-desktop-bin", "briar-desktop-bin", "DONE", None, None),
    (2914, "bash-fuzzy-clock-git", "bash-fuzzy-clock", "DONE", None, None),
    (15761, "arkenfox-user.js-git", "arkenfox-user.js", "DONE", None, None),
    (12011, "xone-dongle-firmware", "xone-dongle-firmware", "DONE", None, None),
    (3518, "unreal-tournament-data-archiveorg", "unreal-tournament-data", "DONE", None, None),
    (748, "bcpp", "bcpp", "DONE", None, None),
    (10741, "blt", "blt", "DONE", None, None),
    (1628, "powerofforreboot.efi", "powerofforreboot-efi", "DONE", None, None),
    (9248, "typing_test", "typing-test", "DONE", None, None),
    (2884, "batctl-tui", "batctl-tui", "DONE", None, None),
    (4093, "aspire-cli", "aspire-cli-bin", "DONE", None, None),
    (11985, "chromium-gost", "chromium-gost", "DONE", None, None),
    (2484, "megit", "megit", "DONE", None, None),
    (943, "bisq-cli", "bisq-cli", "DONE", None, None),
    (942, "bisq-daemon", "bisq-daemon", "DONE", None, None),
    (941, "bisq-desktop", "bisq-desktop", "DONE", None, None),
    (3749, "vibe-kanban-bin", "vibe-kanban-bin", "DONE", None, None),
    (10219, "binkplayer-bin", "binkplayer-bin", "DONE", None, None),
    (2780, "plecs-standalone", "plecs-standalone-bin", "DONE", None, None),
    (11928, "davinci-resolve-studio", "davinci-resolve-studio-bin", "DONE", None, None),
    (3334, "ssacli-bin", "ssacli-bin", "DONE", None, None),
    (3323, "breitbandmessung-bin", "breitbandmessung-bin", "DONE", None, None),

    # --- BLOCKED: SOURCE_UNAVAILABLE ---
    (58, "anbox-git", "anbox-git", "BLOCKED", "SOURCE_UNAVAILABLE",
     "Package removed from AUR; project discontinued; A1: clone archived repo — no maintained source; A2: use Waydroid instead; A3: check GitHub archive — only stale 2021 code remains"),
    (7510, "linux6.19.8.arch1-1-bin", "linux6.19.8.arch1-1-bin", "BLOCKED", "SOURCE_UNAVAILABLE",
     "Obsolete versioned kernel binary; removed from AUR; no download source available"),
    (7512, "linux6.19.8.arch1-1-docs-bin", "linux6.19.8.arch1-1-docs-bin", "BLOCKED", "SOURCE_UNAVAILABLE",
     "Obsolete versioned kernel docs binary; removed from AUR"),
    (7511, "linux6.19.8.arch1-1-headers-bin", "linux6.19.8.arch1-1-headers-bin", "BLOCKED", "SOURCE_UNAVAILABLE",
     "Obsolete versioned kernel headers binary; removed from AUR"),
    (9670, "linux6.19.9.arch1-1-bin", "linux6.19.9.arch1-1-bin", "BLOCKED", "SOURCE_UNAVAILABLE",
     "Obsolete versioned kernel binary; removed from AUR"),
    (9672, "linux6.19.9.arch1-1-docs-bin", "linux6.19.9.arch1-1-docs-bin", "BLOCKED", "SOURCE_UNAVAILABLE",
     "Obsolete versioned kernel docs binary; removed from AUR"),
    (9671, "linux6.19.9.arch1-1-headers-bin", "linux6.19.9.arch1-1-headers-bin", "BLOCKED", "SOURCE_UNAVAILABLE",
     "Obsolete versioned kernel headers binary; removed from AUR"),
    (9956, "linux6.19.9.zen1-1-zen-bin", "linux6.19.9.zen1-1-zen-bin", "BLOCKED", "SOURCE_UNAVAILABLE",
     "Obsolete versioned zen kernel binary; removed from AUR"),
    (9958, "linux6.19.9.zen1-1-zen-docs-bin", "linux6.19.9.zen1-1-zen-docs-bin", "BLOCKED", "SOURCE_UNAVAILABLE",
     "Obsolete versioned zen kernel docs binary; removed from AUR"),
    (9957, "linux6.19.9.zen1-1-zen-headers-bin", "linux6.19.9.zen1-1-zen-headers-bin", "BLOCKED", "SOURCE_UNAVAILABLE",
     "Obsolete versioned zen kernel headers binary; removed from AUR"),
    (548, "nvidia-vulkan-dkms", "nvidia-vulkan-dkms", "BLOCKED", "SOURCE_UNAVAILABLE",
     "Removed from AUR; NVIDIA Vulkan beta driver now merged into main nvidia-dkms; no separate package source"),
    (1578, "openai-codex-autoup-bin", "openai-codex-autoup-bin", "BLOCKED", "SOURCE_UNAVAILABLE",
     "Removed from AUR; OpenAI Codex auto-updater binary; product discontinued"),
    (7333, "opensc-p11-kit-module", "opensc-p11-kit-module", "BLOCKED", "SOURCE_UNAVAILABLE",
     "Removed from AUR; OpenSC PKCS#11 module for p11-kit; functionality merged into opensc package"),
    (6759, "projtlauncher", "projtlauncher", "BLOCKED", "SOURCE_UNAVAILABLE",
     "Removed from AUR; no upstream source found; project appears abandoned"),
    (7482, "shimmy-bin", "shimmy-bin", "BLOCKED", "SOURCE_UNAVAILABLE",
     "Removed from AUR; no upstream source or binary download available"),
    (2878, "subs2srs-git", "subs2srs-git", "BLOCKED", "SOURCE_UNAVAILABLE",
     "Removed from AUR; .NET/WinForms app for Anki flashcard generation; A1: source repo unavailable; A2: Windows-only application"),
    (24, "vivaldi-ffmpeg-codecs", "vivaldi-ffmpeg-codecs", "BLOCKED", "SOURCE_UNAVAILABLE",
     "Removed from AUR; Vivaldi-specific ffmpeg codec build; A1: functionality now bundled with vivaldi-stable; A2: chromium-codecs-ffmpeg-extra provides same; A3: build from chromium source — too complex"),
    (46, "whatsapp-for-linux", "whatsapp-for-linux", "BLOCKED", "SOURCE_UNAVAILABLE",
     "Removed from AUR; WhatsApp web wrapper using WebKitGTK; A1: GitHub repo may still exist but AUR package gone; A2: use browser-based WhatsApp Web; A3: Flatpak available but out of scope"),
    (38, "zettlr", "zettlr", "BLOCKED", "SOURCE_UNAVAILABLE",
     "Removed from AUR; Electron-based Markdown editor; A1: build from GitHub source — Electron + npm + 800 deps; A2: use AppImage — not in AUR; A3: Flatpak available but out of scope"),

    # --- BLOCKED: ARCH_SPECIFIC ---
    (9004, "pac-pacman-aliases", "pac-pacman-aliases", "BLOCKED", "ARCH_SPECIFIC",
     "Shell aliases for pacman commands; tightly coupled to pacman CLI; A1: adapt for Guix — aliases reference pacman internals; A2: create Guix-native equivalent — different CLI; A3: ship as-is — non-functional without pacman"),
    (11596, "pacman-log-orphans-hook", "pacman-log-orphans-hook", "BLOCKED", "ARCH_SPECIFIC",
     "Pacman hook to log orphan packages; uses alpm hooks API; A1: port to Guix profile hook — different hook mechanism; A2: cron job alternative — loses pacman integration; A3: ship script only — non-functional without pacman"),
    (3243, "pipewire-enable-bluez5", "pipewire-enable-bluez5", "BLOCKED", "ARCH_SPECIFIC",
     "Pacman hook to auto-enable PipeWire Bluez5; A1: Guix service config handles this natively; A2: shell script — already handled by Guix PipeWire service; A3: no-op on Guix"),
    (1584, "systemd-boot-pacman-hook", "systemd-boot-pacman-hook", "BLOCKED", "ARCH_SPECIFIC",
     "Pacman hook for systemd-boot updates; A1: Guix bootloader config handles this; A2: manual script — Guix reconfigure already updates bootloader; A3: no equivalent needed"),
    (1130, "localepurge-hook", "localepurge-hook", "BLOCKED", "ARCH_SPECIFIC",
     "Pacman hook for locale cleanup; depends on localepurge + alpm hooks; A1: Guix handles locale at system level; A2: guix gc already handles cleanup; A3: no-op on Guix"),
    (11783, "paccache-hook", "paccache-hook", "BLOCKED", "ARCH_SPECIFIC",
     "Pacman hook for package cache cleanup; depends on pacman-contrib; A1: guix gc equivalent — different mechanism; A2: cron-based cleanup — loses hook integration; A3: non-functional without pacman"),
    (15341, "yaycache-hook", "yaycache-hook", "BLOCKED", "ARCH_SPECIFIC",
     "Hook for yay AUR helper cache cleanup; depends on yaycache + pacman; A1: no AUR helper concept in Guix; A2: channel-level caching different; A3: non-functional"),
    (3325, "ancient-packages", "ancient-packages", "BLOCKED", "ARCH_SPECIFIC",
     "Lists packages no longer in repos; depends on package-query/pacman; A1: guix refresh provides similar function; A2: rewrite for Guix — different package DB; A3: non-functional without pacman"),
    (10058, "mandb-instant-update", "mandb-instant-update", "BLOCKED", "ARCH_SPECIFIC",
     "Pacman hook for man-db updates; A1: Guix profile hook handles man-db; A2: post-install script — Guix handles via profile; A3: no-op on Guix"),
    (9822, "arch-gdm-theme-list", "arch-gdm-theme-list", "BLOCKED", "ARCH_SPECIFIC",
     "Arch Linux branded GDM theme; ships Arch-specific logos and branding; A1: rebrand for Guix — loses purpose; A2: generic GDM theme — already available; A3: Arch-only branding"),

    # --- BLOCKED: PROPRIETARY_FONT_LICENSE ---
    (12925, "ttf-ms-win10-japanese", "font-ms-win10-japanese", "BLOCKED", "PROPRIETARY_FONT_LICENSE",
     "Microsoft Windows 10 Japanese fonts; requires Windows ISO extraction + MS license acceptance; A1: extract from ISO — license prohibits redistribution; A2: use Noto CJK fonts instead; A3: user-provided ISO extraction script"),
    (12926, "ttf-ms-win10-korean", "font-ms-win10-korean", "BLOCKED", "PROPRIETARY_FONT_LICENSE",
     "Microsoft Windows 10 Korean fonts; requires Windows ISO + license; same restrictions as Japanese variant"),
    (12931, "ttf-ms-win10-other", "font-ms-win10-other", "BLOCKED", "PROPRIETARY_FONT_LICENSE",
     "Microsoft Windows 10 misc fonts; requires Windows ISO + license"),
    (12927, "ttf-ms-win10-sea", "font-ms-win10-sea", "BLOCKED", "PROPRIETARY_FONT_LICENSE",
     "Microsoft Windows 10 SEA fonts; requires Windows ISO + license"),
    (12928, "ttf-ms-win10-thai", "font-ms-win10-thai", "BLOCKED", "PROPRIETARY_FONT_LICENSE",
     "Microsoft Windows 10 Thai fonts; requires Windows ISO + license"),
    (12929, "ttf-ms-win10-zh_cn", "font-ms-win10-zh-cn", "BLOCKED", "PROPRIETARY_FONT_LICENSE",
     "Microsoft Windows 10 Simplified Chinese fonts; requires Windows ISO + license"),
    (12930, "ttf-ms-win10-zh_tw", "font-ms-win10-zh-tw", "BLOCKED", "PROPRIETARY_FONT_LICENSE",
     "Microsoft Windows 10 Traditional Chinese fonts; requires Windows ISO + license"),
    (22454, "ttf-ms-win11-japanese", "font-ms-win11-japanese", "BLOCKED", "PROPRIETARY_FONT_LICENSE",
     "Microsoft Windows 11 Japanese fonts; requires Windows ISO + license"),
    (22455, "ttf-ms-win11-korean", "font-ms-win11-korean", "BLOCKED", "PROPRIETARY_FONT_LICENSE",
     "Microsoft Windows 11 Korean fonts; requires Windows ISO + license"),
    (22460, "ttf-ms-win11-other", "font-ms-win11-other", "BLOCKED", "PROPRIETARY_FONT_LICENSE",
     "Microsoft Windows 11 misc fonts; requires Windows ISO + license"),
    (22456, "ttf-ms-win11-sea", "font-ms-win11-sea", "BLOCKED", "PROPRIETARY_FONT_LICENSE",
     "Microsoft Windows 11 SEA fonts; requires Windows ISO + license"),
    (22457, "ttf-ms-win11-thai", "font-ms-win11-thai", "BLOCKED", "PROPRIETARY_FONT_LICENSE",
     "Microsoft Windows 11 Thai fonts; requires Windows ISO + license"),
    (22458, "ttf-ms-win11-zh_cn", "font-ms-win11-zh-cn", "BLOCKED", "PROPRIETARY_FONT_LICENSE",
     "Microsoft Windows 11 Simplified Chinese fonts; requires Windows ISO + license"),
    (22459, "ttf-ms-win11-zh_tw", "font-ms-win11-zh-tw", "BLOCKED", "PROPRIETARY_FONT_LICENSE",
     "Microsoft Windows 11 Traditional Chinese fonts; requires Windows ISO + license"),

    # --- BLOCKED: DKMS_KERNEL_MODULE ---
    (11866, "new-lg4ff-dkms-git", "new-lg4ff-dkms-git", "BLOCKED", "DKMS_KERNEL_MODULE",
     "Logitech force feedback kernel module; requires linux-module-build-system with matching kernel headers; A1: DKMS package — Guix linux-module needs specific kernel pairing; A2: build out-of-tree — complex kernel version matching; A3: upstream merge request pending"),
    (11762, "amneziawg-dkms", "amneziawg-dkms", "BLOCKED", "DKMS_KERNEL_MODULE",
     "AmneziaWG VPN kernel module; requires DKMS + kernel headers; A1: linux-module-build-system — needs kernel version matching; A2: userspace alternative (amneziawg-go) — different package; A3: wait for kernel mainline merge"),
    (1755, "linux-cachyos-lts", "linux-cachyos-lts", "BLOCKED", "DKMS_KERNEL_MODULE",
     "CachyOS LTS kernel with BORE scheduler; full kernel build with custom patches; A1: linux-libre fork — patches not trivially portable; A2: binary kernel — architecture mismatch with Guix initrd; A3: kernel config extraction — CachyOS-specific toolchain"),
    (1070, "linux-cachyos", "linux-cachyos", "BLOCKED", "DKMS_KERNEL_MODULE",
     "CachyOS kernel with EEVDF+LTO+AutoFDO; full kernel build with Rust support; A1: custom kernel recipe — requires Rust toolchain in kernel build; A2: binary import — initrd incompatible; A3: patch-only approach — CachyOS patches too divergent"),
    (10770, "linux-cachyos-rc", "linux-cachyos-rc", "BLOCKED", "DKMS_KERNEL_MODULE",
     "CachyOS RC kernel; bleeding-edge with BORE+LTO; same issues as linux-cachyos plus unstable API"),

    # --- BLOCKED: NEEDS_RECIPE_DESIGN ---
    (12012, "nvidia-utils-beta", "nvidia-utils-beta", "BLOCKED", "NEEDS_RECIPE_DESIGN",
     "NVIDIA beta driver utilities; proprietary driver with kernel module integration, OpenGL/Vulkan ICDs, systemd services; A1: extract userspace utils from .run installer — needs matching kernel module; A2: use nonguix nvidia-driver — beta version not in nonguix; A3: binary repack — complex library path patching"),
    (12066, "python-opentelemetry-exporter-otlp-proto-common", "python-opentelemetry-exporter-otlp-proto-common", "BLOCKED", "NEEDS_RECIPE_DESIGN",
     "OpenTelemetry OTLP protobuf encoding; depends on full opentelemetry-sdk/api/proto chain not in Guix; A1: pyproject-build-system — blocked by 5+ missing deps; A2: package entire otel chain — 15+ packages needed; A3: vendor deps — API compatibility issues"),
    (11979, "sonic-win", "sonic-win", "BLOCKED", "NEEDS_RECIPE_DESIGN",
     "KWin fork with X11 ports; full KDE Plasma/KF6 dependency chain; A1: cmake-build-system — needs 50+ KDE/Qt deps; A2: inherit kwin and patch — Guix kwin version mismatch; A3: binary — no standalone binary available"),
    (256, "lib32-xrizer", "lib32-xrizer", "BLOCKED", "NEEDS_RECIPE_DESIGN",
     "32-bit OpenVR-to-OpenXR translation; requires multilib Rust build; A1: cross-compile — Guix lacks lib32 Rust toolchain; A2: 64-bit only — breaks 32-bit VR apps; A3: Guix multilib support incomplete"),
    (2890, "plasma-workspace-povd", "plasma-workspace-povd", "BLOCKED", "NEEDS_RECIPE_DESIGN",
     "KDE Plasma Workspace fork for per-output virtual desktops; massive dep chain (100+ packages); A1: cmake-build-system — needs full Plasma 6 stack; A2: patch existing plasma-workspace — version sync issues; A3: binary — none available"),
    (11948, "yabridgectl-wine10-git", "yabridgectl-wine10-git", "BLOCKED", "NEEDS_RECIPE_DESIGN",
     "Yabridge controller for Wine 10; Rust/Meson with Wine, Boost, ASIO deps; A1: cargo+meson hybrid build — complex multi-stage; A2: binary from yabridge releases — wine10-specific not released; A3: build yabridge chain first — 3+ packages"),
    (12072, "python-opentelemetry-exporter-zipkin-proto-http", "python-opentelemetry-exporter-zipkin-proto-http", "BLOCKED", "NEEDS_RECIPE_DESIGN",
     "Zipkin protobuf HTTP exporter; depends on opentelemetry-sdk chain; A1: pyproject — blocked by SDK chain (same as otlp-proto-common); A2: vendor deps; A3: package otel chain first"),
    (12026, "qt6-base-hifps", "qt6-base-hifps", "BLOCKED", "NEEDS_RECIPE_DESIGN",
     "Qt6 fork with high-FPS patches; requires full Qt6 source build (~2h); A1: inherit qt6-base + patches — qt6 version must match; A2: binary — no prebuilt available; A3: patch extraction — hifps patches may not apply cleanly"),
    (11976, "lib32-libudev0-shim", "lib32-libudev0-shim", "BLOCKED", "NEEDS_RECIPE_DESIGN",
     "32-bit libudev0 compatibility shim; Guix lacks multilib/32-bit support; A1: cross-compile for i686 — complex ABI compat; A2: skip — limited 64-bit use case; A3: docker/container approach — out of scope"),
    (10703, "lib32-libtxc_dxtn", "lib32-libtxc-dxtn", "BLOCKED", "NEEDS_RECIPE_DESIGN",
     "32-bit S3TC texture compression; requires lib32-mesa; A1: cross-compile — needs 32-bit mesa; A2: mesa now includes S3TC — may be obsolete; A3: Guix multilib incomplete"),
    (9955, "linux-zen-versioned-docs-bin", "linux-zen-versioned-docs-bin", "BLOCKED", "NEEDS_RECIPE_DESIGN",
     "Metapackage for versioned zen kernel docs; depends on specific kernel version binary not available; A1: create matching kernel package — full kernel build; A2: skip — metapackage with circular dep; A3: provide generic zen docs"),
    (9954, "linux-zen-versioned-headers-bin", "linux-zen-versioned-headers-bin", "BLOCKED", "NEEDS_RECIPE_DESIGN",
     "Metapackage for versioned zen kernel headers; depends on specific kernel version binary; A1: create matching kernel — full build; A2: skip — metapackage; A3: provide generic zen headers"),
    (3480, "oopz", "oopz", "BLOCKED", "NEEDS_RECIPE_DESIGN",
     "OOPZ desktop client; Electron wrapper requiring electron39 (not in Guix); A1: package electron39 first — massive undertaking (Chromium-based); A2: use system electron — version mismatch; A3: AppImage — none available"),
    (3192, "youtube-music-desktop", "youtube-music-desktop", "BLOCKED", "NEEDS_RECIPE_DESIGN",
     "YouTube Music web-app wrapper; depends on qtws-base (Qt Web Shell, not in Guix); A1: package qtws-base first — Qt5 WebEngine wrapper; A2: use electron alternative — different project; A3: browser bookmark — not a package"),
    (6765, "keychron-q3-max-udev", "keychron-q3-max-udev", "BLOCKED", "NEEDS_RECIPE_DESIGN",
     "Udev rule for Keychron Q3 Max; depends on keychron-link-udev (not in Guix/AUR chain unclear); A1: standalone udev rule — need device IDs from keychron-link-udev; A2: combine into single package; A3: extract udev rules from keychron docs"),
    (2584, "lib32-zix", "lib32-zix", "BLOCKED", "NEEDS_RECIPE_DESIGN",
     "32-bit zix C library; meson build but Guix lacks multilib; A1: cross-compile for i686 — meson cross-file needed; A2: 64-bit only — breaks lib32 dependents; A3: Guix multilib support incomplete"),
    (1980, "bcompare-cinnamon", "bcompare-cinnamon", "BLOCKED", "NEEDS_RECIPE_DESIGN",
     "Cinnamon service menus for Beyond Compare; depends on bcompare (proprietary, not packaged); A1: package bcompare first — proprietary license; A2: standalone menu files — non-functional without bcompare; A3: skip — proprietary dep chain"),
    (1977, "bcompare-kde4", "bcompare-kde4", "BLOCKED", "NEEDS_RECIPE_DESIGN",
     "KDE4 service menus for Beyond Compare; depends on bcompare (proprietary); same as bcompare-cinnamon"),
    (1975, "bcompare-kde6", "bcompare-kde6", "BLOCKED", "NEEDS_RECIPE_DESIGN",
     "KDE6 service menus for Beyond Compare; depends on bcompare (proprietary)"),
    (1981, "bcompare-mate", "bcompare-mate", "BLOCKED", "NEEDS_RECIPE_DESIGN",
     "MATE service menus for Beyond Compare; depends on bcompare (proprietary)"),
    (1978, "bcompare-nautilus", "bcompare-nautilus", "BLOCKED", "NEEDS_RECIPE_DESIGN",
     "GNOME/Nautilus service menus for Beyond Compare; depends on bcompare (proprietary)"),
    (1979, "bcompare-thunar", "bcompare-thunar", "BLOCKED", "NEEDS_RECIPE_DESIGN",
     "Xfce/Thunar service menus for Beyond Compare; depends on bcompare (proprietary)"),
    (7498, "ninjarmm-ncplayer", "ninjarmm-ncplayer", "BLOCKED", "NEEDS_RECIPE_DESIGN",
     "NinjaRMM remote access agent; proprietary binary with custom protocol; A1: binary repack — needs account/license; A2: extract from installer — no public URL; A3: proprietary ecosystem"),
    (9392, "nautilus-megasync", "nautilus-megasync", "BLOCKED", "NEEDS_RECIPE_DESIGN",
     "MEGA Cloud nautilus extension; proprietary binary; A1: package megasync first — proprietary; A2: standalone extension — needs megasync SDK; A3: use rclone instead"),
]

assert len(PACKAGES) == 100, f"Expected 100 packages, got {len(PACKAGES)}"
assert sum(1 for p in PACKAGES if p[3] == "DONE") + sum(1 for p in PACKAGES if p[3] == "BLOCKED") == 100

# ── Recipe definitions (Scheme code) ─────────────────────────────────────

RECIPE_DEFS = {}

RECIPE_DEFS["argc"] = ''';;; ── argc ────────────────────────────────────────────────────────────
;;; Elegant command-line argument parser (Rust binary from GitHub release)
;;; AUR: argc  →  Guix: argc
;;; Upstream: https://github.com/sigoden/argc
;;;
(define-public argc
  (package
    (name "argc")
    (version "1.23.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/sigoden/argc/releases/download/v"
             version "/argc-v" version "-x86_64-unknown-linux-musl.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~\'(("argc" "bin/argc"))))
    (supported-systems \'("x86_64-linux"))
    (home-page "https://github.com/sigoden/argc")
    (synopsis "elegant command-line argument parser")
    (description "Argc is a command-line argument parser for Bash scripts.
It allows you to define argument parsing logic using comment annotations
and generates completions for various shells.")
    (license license:asl2.0)))
'''

RECIPE_DEFS["ascii-image-converter"] = ''';;; ── ascii-image-converter ───────────────────────────────────────────
;;; Convert images into ASCII art (Go binary from GitHub release)
;;; AUR: ascii-image-converter  →  Guix: ascii-image-converter
;;; Upstream: https://github.com/TheZoraiz/ascii-image-converter
;;;
(define-public ascii-image-converter
  (package
    (name "ascii-image-converter")
    (version "1.13.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/TheZoraiz/ascii-image-converter/releases/download/v"
             version "/ascii-image-converter_Linux_amd64_64bit.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~\'(("ascii-image-converter" "bin/ascii-image-converter"))))
    (supported-systems \'("x86_64-linux"))
    (home-page "https://github.com/TheZoraiz/ascii-image-converter")
    (synopsis "convert images into ASCII art on the terminal")
    (description "Ascii-image-converter converts images into ASCII art and
prints them to the console.  It supports multiple image formats, custom
character sets, colored output, and braille art mode.")
    (license license:asl2.0)))
'''

RECIPE_DEFS["bfree-bin"] = ''';;; ── bfree-bin ───────────────────────────────────────────────────────
;;; A better free, human by default (prebuilt Rust binary)
;;; AUR: bfree-bin  →  Guix: bfree-bin
;;; Upstream: https://github.com/glexposito/bfree
;;;
(define-public bfree-bin
  (package
    (name "bfree-bin")
    (version "0.1.14")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/glexposito/bfree/releases/download/v"
             version "/bfree"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~\'(("bfree" "bin/bfree"))))
    (supported-systems \'("x86_64-linux"))
    (home-page "https://github.com/glexposito/bfree")
    (synopsis "memory statistics tool for humans")
    (description "Bfree is a human-readable memory information tool that
displays system memory usage in a clear, intuitive format.  It is a modern
replacement for the traditional @command{free} command.")
    (license license:expat)))
'''

RECIPE_DEFS["bfree"] = ''';;; ── bfree ───────────────────────────────────────────────────────────
;;; A better free, human by default (from source)
;;; AUR: bfree  →  Guix: bfree
;;; Upstream: https://github.com/glexposito/bfree
;;;
(define-public bfree
  (package
    (name "bfree")
    (version "0.1.14")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/glexposito/bfree")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f
           #:install-source? #f))
    (home-page "https://github.com/glexposito/bfree")
    (synopsis "memory statistics tool for humans")
    (description "Bfree is a human-readable memory information tool that
displays system memory usage in a clear, intuitive format.  It is a modern
replacement for the traditional @command{free} command.")
    (license license:expat)))
'''

RECIPE_DEFS["archium-bin"] = ''';;; ── archium-bin ─────────────────────────────────────────────────────
;;; Wrapper for AUR helpers (prebuilt binary)
;;; AUR: archium-bin  →  Guix: archium-bin
;;; Upstream: https://github.com/keircn/archium
;;;
(define-public archium-bin
  (package
    (name "archium-bin")
    (version "1.10.4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/keircn/archium/releases/download/"
             version "/archium-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~\'(("archium" "bin/archium"))))
    (supported-systems \'("x86_64-linux"))
    (home-page "https://github.com/keircn/archium")
    (synopsis "wrapper for AUR helpers")
    (description "Archium is a wrapper for AUR helpers such as yay and paru,
providing a unified interface for package management operations.")
    (license license:expat)))
'''

RECIPE_DEFS["autosubsync-bin"] = ''';;; ── autosubsync-bin ─────────────────────────────────────────────────
;;; Automatic subtitle synchronization tool (AppImage)
;;; AUR: autosubsync-bin  →  Guix: autosubsync-bin
;;; Upstream: https://github.com/denizsafak/AutoSubSync
;;;
(define-public autosubsync-bin
  (package
    (name "autosubsync-bin")
    (version "6.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/denizsafak/AutoSubSync/releases/download/v"
             version "/AutoSubSync-" version "-x86_64.AppImage"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~\'(("AutoSubSync.AppImage" "bin/autosubsync"))))
    (supported-systems \'("x86_64-linux"))
    (home-page "https://github.com/denizsafak/AutoSubSync")
    (synopsis "automatic subtitle synchronization tool")
    (description "AutoSubSync automatically synchronizes subtitle files to
match the audio track of a video file using speech recognition and audio
fingerprinting techniques.")
    (license license:gpl3+)))
'''

RECIPE_DEFS["briar-desktop-bin"] = ''';;; ── briar-desktop-bin ───────────────────────────────────────────────
;;; Secure messaging for the next generation (desktop beta)
;;; AUR: briar-desktop-bin  →  Guix: briar-desktop-bin
;;; Upstream: https://code.briarproject.org/briar/briar-desktop
;;;
(define-public briar-desktop-bin
  (package
    (name "briar-desktop-bin")
    (version "0.6.5-beta")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://desktop.briarproject.org/jars/linux/"
             version "/briar-desktop-linux-" version ".jar"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~\'(("briar-desktop.jar" "share/java/briar-desktop.jar"))))
    (home-page "https://code.briarproject.org/briar/briar-desktop")
    (synopsis "secure peer-to-peer messaging desktop client")
    (description "Briar Desktop is a beta desktop client for the Briar
secure messaging system.  Briar synchronizes messages via Tor, Wi-Fi,
and Bluetooth, enabling communication even when the internet is down.")
    (license license:gpl3+)))
'''

RECIPE_DEFS["bash-fuzzy-clock"] = ''';;; ── bash-fuzzy-clock ────────────────────────────────────────────────
;;; Display time in natural language
;;; AUR: bash-fuzzy-clock-git  →  Guix: bash-fuzzy-clock
;;; Upstream: https://github.com/coreymwamba/bash-fuzzy-clock
;;;
(define-public bash-fuzzy-clock
  (package
    (name "bash-fuzzy-clock")
    (version "0.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/coreymwamba/bash-fuzzy-clock")
             (commit "e66578e7f1b3fbc66ebef35be2cc3c2c2f3f6d6f")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~\'(("fuzzy_clock.sh" "bin/fuzzy-clock"))))
    (inputs (list bash))
    (home-page "https://github.com/coreymwamba/bash-fuzzy-clock")
    (synopsis "display time in natural language")
    (description "Bash Fuzzy Clock is a script that displays the current
time in natural language (e.g., @samp{quarter past three}).  It supports
six languages including English, French, German, Spanish, Italian, and
Portuguese.")
    (license license:gpl3+)))
'''

RECIPE_DEFS["arkenfox-user.js"] = ''';;; ── arkenfox-user.js ────────────────────────────────────────────────
;;; Firefox privacy user.js template
;;; AUR: arkenfox-user.js-git  →  Guix: arkenfox-user.js
;;; Upstream: https://github.com/arkenfox/user.js
;;;
(define-public arkenfox-user.js
  (package
    (name "arkenfox-user.js")
    (version "128.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/arkenfox/user.js")
             (commit "f906f7f5a485aa24fee88b086470d3b37baee696")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~\'(("user.js" "share/arkenfox/user.js")
               ("updater.sh" "bin/arkenfox-updater")
               ("prefsCleaner.sh" "bin/arkenfox-prefs-cleaner"))))
    (inputs (list bash))
    (home-page "https://github.com/arkenfox/user.js")
    (synopsis "Firefox privacy, security and anti-tracking user.js template")
    (description "Arkenfox user.js is a comprehensive Firefox @file{user.js}
template for configuring and hardening Firefox privacy, security, and
anti-tracking settings.  Includes updater and preferences cleaner scripts.")
    (license license:expat)))
'''

RECIPE_DEFS["xone-dongle-firmware"] = ''';;; ── xone-dongle-firmware ────────────────────────────────────────────
;;; Xbox Wireless Controller Adapter firmware
;;; AUR: xone-dongle-firmware  →  Guix: xone-dongle-firmware
;;; Upstream: https://support.xbox.com/
;;;
(define-public xone-dongle-firmware
  (package
    (name "xone-dongle-firmware")
    (version "2.0.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://catalog.s.download.windowsupdate.com/d/msdownload/update/driver/drvs/2017/03/2ea9591b-5e23-4b0e-82ed-2d16e4b849e0_96078d7e1af90c57d80500e93b4b17adb757e92c.cab")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~\'(("." "lib/firmware/"))))
    (home-page "https://support.xbox.com/en-US/help/hardware-network/browse")
    (synopsis "Xbox Wireless Controller Adapter firmware blobs")
    (description "Firmware files for the Xbox Wireless Controller Adapter
dongles, extracted from Microsoft Windows Update cabinet files.  Required
for use with the xone kernel driver.")
    (license (license:non-copyleft
              "https://www.microsoft.com/en-us/legal/terms-of-use"
              "Microsoft Terms of Use"))))
'''

RECIPE_DEFS["unreal-tournament-data"] = ''';;; ── unreal-tournament-data ──────────────────────────────────────────
;;; Unreal Tournament 99 (GOTY) data from Archive.org
;;; AUR: unreal-tournament-data-archiveorg  →  Guix: unreal-tournament-data
;;; Upstream: https://archive.org/details/ut-goty
;;;
(define-public unreal-tournament-data
  (package
    (name "unreal-tournament-data")
    (version "436")
    (source
     (origin
       (method url-fetch)
       (uri "https://archive.org/download/ut-goty/UT_GOTY_CD1.iso")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~\'(("." "share/games/unreal-tournament/"))))
    (native-inputs (list p7zip))
    (home-page "https://archive.org/details/ut-goty")
    (synopsis "Unreal Tournament 99 GOTY game data files")
    (description "Game data files for Unreal Tournament 99 Game of the Year
edition, extracted from the Archive.org ISO image.  Requires a compatible
game engine binary to play.")
    (license (license:non-copyleft
              "https://archive.org/details/ut-goty"
              "Epic Games / GT Interactive EULA"))))
'''

RECIPE_DEFS["bcpp"] = ''';;; ── bcpp ────────────────────────────────────────────────────────────
;;; C/C++ source code beautifier
;;; AUR: bcpp  →  Guix: bcpp
;;; Upstream: https://invisible-island.net/bcpp/bcpp.html
;;;
(define-public bcpp
  (package
    (name "bcpp")
    (version "20240917")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://invisible-island.net/archives/bcpp/bcpp-"
             version ".tgz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://invisible-island.net/bcpp/bcpp.html")
    (synopsis "C/C++ source code indenter and beautifier")
    (description "Bcpp is a utility for indenting and reformatting C and
C++ source code.  It can adjust indentation levels, brace styles, and
other formatting aspects of source files.")
    (license (license:non-copyleft
              "https://invisible-island.net/bcpp/bcpp.html"
              "bcpp license (MIT-like)"))))
'''

RECIPE_DEFS["blt"] = ''';;; ── blt ─────────────────────────────────────────────────────────────
;;; Extension to Tcl/Tk with new commands and widgets
;;; AUR: blt  →  Guix: blt
;;; Upstream: http://blt.sourceforge.net
;;;
(define-public blt
  (package
    (name "blt")
    (version "2.4z")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "mirror://sourceforge/blt/BLT/BLT%20"
             version "/BLT" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (inputs (list tcl tk))
    (home-page "http://blt.sourceforge.net")
    (synopsis "extension library for Tcl/Tk")
    (description "BLT is an extension to the Tcl and Tk scripting language
that adds new commands and widgets.  It includes graph, barchart, stripchart,
tabset, tree, treeview, and other widgets.")
    (license (license:non-copyleft
              "http://blt.sourceforge.net"
              "BLT license (BSD-like)"))))
'''

RECIPE_DEFS["powerofforreboot-efi"] = ''';;; ── powerofforreboot-efi ────────────────────────────────────────────
;;; UEFI power-off and reboot utilities
;;; AUR: powerofforreboot.efi  →  Guix: powerofforreboot-efi
;;; Upstream: N/A (simple EFI utilities)
;;;
(define-public powerofforreboot-efi
  (package
    (name "powerofforreboot-efi")
    (version "20190517")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/powerofforreboot.efi.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (delete \'configure))))
    (native-inputs (list gnu-efi))
    (home-page "https://aur.archlinux.org/packages/powerofforreboot.efi")
    (synopsis "UEFI power-off and reboot utilities")
    (description "Simple EFI applications for power-off and reboot that can
be used from within a UEFI boot manager or shell environment.")
    (license license:gpl2)))
'''

RECIPE_DEFS["typing-test"] = ''';;; ── typing-test ────────────────────────────────────────────────────
;;; Simple terminal typing test (Rust)
;;; AUR: typing_test  →  Guix: typing-test
;;; Upstream: https://github.com/owenhar/rust_typing_test
;;;
(define-public typing-test
  (package
    (name "typing-test")
    (version "1.0.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/owenhar/rust_typing_test")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f
           #:install-source? #f))
    (home-page "https://github.com/owenhar/rust_typing_test")
    (synopsis "simple typing speed test for the terminal")
    (description "A terminal-based typing speed test written in Rust.
Measures words per minute and accuracy with randomly generated text
prompts.")
    (license license:expat)))
'''

RECIPE_DEFS["batctl-tui"] = ''';;; ── batctl-tui ──────────────────────────────────────────────────────
;;; TUI tool for managing battery charge thresholds
;;; AUR: batctl-tui  →  Guix: batctl-tui
;;; Upstream: https://github.com/Ooooze/batctl
;;;
(define-public batctl-tui
  (package
    (name "batctl-tui")
    (version "2026.3.13")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/Ooooze/batctl")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/Ooooze/batctl"
           #:tests? #f))
    (home-page "https://github.com/Ooooze/batctl")
    (synopsis "TUI and CLI tool for managing battery charge thresholds")
    (description "Batctl is a terminal user interface and command-line tool
for managing battery charge thresholds on Linux laptops.  It allows setting
charge start and stop thresholds to extend battery lifespan.")
    (license license:expat)))
'''

RECIPE_DEFS["aspire-cli-bin"] = ''';;; ── aspire-cli-bin ──────────────────────────────────────────────────
;;; .NET Aspire CLI tooling (prebuilt binary)
;;; AUR: aspire-cli  →  Guix: aspire-cli-bin
;;; Upstream: https://github.com/dotnet/aspire
;;;
(define-public aspire-cli-bin
  (package
    (name "aspire-cli-bin")
    (version "13.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://ci.dot.net/public/aspire/"
             version "-preview.1.26166.8"
             "/aspire-cli-linux-x64-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~\'(("aspire" "bin/aspire"))))
    (supported-systems \'("x86_64-linux"))
    (home-page "https://github.com/dotnet/aspire")
    (synopsis ".NET Aspire CLI for building observable cloud applications")
    (description "Aspire CLI provides tools, templates, and packages for
building observable, production-ready, distributed .NET applications.  This
is the prebuilt binary release.")
    (license license:expat)))
'''

RECIPE_DEFS["chromium-gost"] = ''';;; ── chromium-gost ───────────────────────────────────────────────────
;;; Chromium with GOST cryptography support
;;; AUR: chromium-gost  →  Guix: chromium-gost
;;; Upstream: https://github.com/nickel-browser/nickel
;;;
(define-public chromium-gost
  (package
    (name "chromium-gost")
    (version "142.0.7444.176")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/nickel-browser/nickel/releases/download/"
             version "/nickel-linux-x64-" version ".deb"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~\'(("." "share/chromium-gost/"))))
    (supported-systems \'("x86_64-linux"))
    (home-page "https://github.com/deemru/Chromium-Gost")
    (synopsis "Chromium browser with GOST cryptography support")
    (description "Chromium-Gost is a Chromium-based web browser with support
for Russian GOST cryptographic algorithms and digital signatures.  It enables
access to Russian government portals that require GOST TLS.")
    (license license:expat)))
'''

RECIPE_DEFS["megit"] = ''';;; ── megit ───────────────────────────────────────────────────────────
;;; Git GUI based on EGit Eclipse plugin
;;; AUR: megit  →  Guix: megit
;;; Upstream: https://github.com/nickel-browser/nickel
;;;
(define-public megit
  (package
    (name "megit")
    (version "0.9.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/nickel-browser/nickel")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~\'(("." "share/megit/"))))
    (home-page "https://github.com/eclipsesource/megit")
    (synopsis "Git GUI repository manager based on EGit")
    (description "Megit is a graphical Git repository manager based on the
EGit Eclipse plugin.  It provides a standalone interface for common Git
operations including staging, committing, branching, and merging.")
    (license license:epl2.0)))
'''

RECIPE_DEFS["bisq-desktop"] = ''';;; ── bisq-desktop ───────────────────────────────────────────────────
;;; Decentralized Bitcoin exchange (desktop client)
;;; AUR: bisq-desktop  →  Guix: bisq-desktop
;;; Upstream: https://bisq.network
;;;
(define-public bisq-desktop
  (package
    (name "bisq-desktop")
    (version "1.9.22")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/bisq-network/bisq/releases/download/v"
             version "/Bisq-64bit-" version ".deb"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~\'(("." "share/bisq/"))))
    (home-page "https://bisq.network")
    (synopsis "decentralized Bitcoin exchange desktop application")
    (description "Bisq is a decentralized peer-to-peer Bitcoin exchange
that allows users to trade national currencies for Bitcoin without
intermediaries.  It uses Tor for privacy and multi-signature escrow for
security.")
    (license license:agpl3+)))
'''

RECIPE_DEFS["bisq-cli"] = ''';;; ── bisq-cli ───────────────────────────────────────────────────────
;;; Decentralized Bitcoin exchange (CLI)
;;; AUR: bisq-cli  →  Guix: bisq-cli
;;; Upstream: https://bisq.network
;;;
(define-public bisq-cli
  (package
    (inherit bisq-desktop)
    (name "bisq-cli")
    (synopsis "decentralized Bitcoin exchange CLI client")
    (description "Bisq CLI is the command-line interface for the Bisq
decentralized Bitcoin exchange network.  It provides programmatic access
to trading, wallet, and network operations.")))
'''

RECIPE_DEFS["bisq-daemon"] = ''';;; ── bisq-daemon ────────────────────────────────────────────────────
;;; Decentralized Bitcoin exchange (daemon)
;;; AUR: bisq-daemon  →  Guix: bisq-daemon
;;; Upstream: https://bisq.network
;;;
(define-public bisq-daemon
  (package
    (inherit bisq-desktop)
    (name "bisq-daemon")
    (synopsis "decentralized Bitcoin exchange daemon")
    (description "Bisq daemon is the headless service for the Bisq
decentralized Bitcoin exchange network.  It runs the trading engine
without a GUI, suitable for server deployments and automation.")))
'''

RECIPE_DEFS["vibe-kanban-bin"] = ''';;; ── vibe-kanban-bin ─────────────────────────────────────────────────
;;; AI-powered Kanban board (binary)
;;; AUR: vibe-kanban-bin  →  Guix: vibe-kanban-bin
;;; Upstream: https://vibekanban.com
;;;
(define-public vibe-kanban-bin
  (package
    (name "vibe-kanban-bin")
    (version "0.1.41")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://vibekanban.com/releases/vibe-kanban-"
             version "-linux-x64.zip"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~\'(("." "share/vibe-kanban/"))))
    (native-inputs (list unzip))
    (supported-systems \'("x86_64-linux"))
    (home-page "https://vibekanban.com")
    (synopsis "AI-powered Kanban board application")
    (description "Vibe Kanban is an AI-powered Kanban board application for
project management and task tracking with intelligent suggestions and
automation features.")
    (license (license:non-copyleft
              "https://vibekanban.com"
              "Proprietary"))))
'''

RECIPE_DEFS["binkplayer-bin"] = ''';;; ── binkplayer-bin ──────────────────────────────────────────────────
;;; Bink Video Player (binary)
;;; AUR: binkplayer-bin  →  Guix: binkplayer-bin
;;; Upstream: http://www.radgametools.com/bnkmain.htm
;;;
(define-public binkplayer-bin
  (package
    (name "binkplayer-bin")
    (version "2025.05")
    (source
     (origin
       (method url-fetch)
       (uri "http://www.radgametools.com/down/Bink/BinkLinuxPlayer.7z")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~\'(("." "bin/"))))
    (supported-systems \'("x86_64-linux"))
    (home-page "http://www.radgametools.com/bnkmain.htm")
    (synopsis "Bink Video format player")
    (description "Bink Player is the official player for the Bink Video
format, widely used in video games for cutscenes and cinematics.  This
is the prebuilt Linux binary from RAD Game Tools.")
    (license (license:non-copyleft
              "http://www.radgametools.com/bnkmain.htm"
              "RAD Game Tools License"))))
'''

RECIPE_DEFS["plecs-standalone-bin"] = ''';;; ── plecs-standalone-bin ────────────────────────────────────────────
;;; Circuit simulation tool from Plexim (proprietary, trial)
;;; AUR: plecs-standalone  →  Guix: plecs-standalone-bin
;;; Upstream: https://www.plexim.com/products/plecs
;;;
(define-public plecs-standalone-bin
  (package
    (name "plecs-standalone-bin")
    (version "5.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://www.plexim.com/sites/default/files/"
             "plecs_standalone_" version "_linux64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~\'(("." "opt/plecs/"))))
    (supported-systems \'("x86_64-linux"))
    (home-page "https://www.plexim.com/products/plecs")
    (synopsis "circuit simulation tool from Plexim")
    (description "PLECS Standalone is a circuit simulation tool for power
electronics and electrical drives.  It provides a graphical environment
for modeling, simulating, and analyzing power electronic circuits.
Note: requires a license from Plexim (30-day free trial available).")
    (license (license:non-copyleft
              "https://www.plexim.com/legal"
              "Plexim PLECS License"))))
'''

RECIPE_DEFS["davinci-resolve-studio-bin"] = ''';;; ── davinci-resolve-studio-bin ──────────────────────────────────────
;;; Professional A/V post-production suite (Studio edition)
;;; AUR: davinci-resolve-studio  →  Guix: davinci-resolve-studio-bin
;;; Upstream: https://www.blackmagicdesign.com/
;;;
(define-public davinci-resolve-studio-bin
  (package
    (name "davinci-resolve-studio-bin")
    (version "20.3.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://swr.cloud.blackmagicdesign.com/DaVinciResolve/v"
             version "/DaVinci_Resolve_Studio_" version "_Linux.zip"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~\'(("." "opt/davinci-resolve-studio/"))))
    (native-inputs (list unzip))
    (supported-systems \'("x86_64-linux"))
    (home-page "https://www.blackmagicdesign.com/products/davinciresolve")
    (synopsis "professional video editing and color grading suite (studio)")
    (description "DaVinci Resolve Studio is a professional video editing,
color correction, visual effects, and audio post-production suite from
Blackmagic Design.  This is the Studio (paid) edition with additional
features over the free version.")
    (license (license:non-copyleft
              "https://www.blackmagicdesign.com/eula"
              "Blackmagic Design EULA"))))
'''

RECIPE_DEFS["ssacli-bin"] = ''';;; ── ssacli-bin ──────────────────────────────────────────────────────
;;; HPE Smart Storage Administrator CLI
;;; AUR: ssacli-bin  →  Guix: ssacli-bin
;;; Upstream: HPE Support
;;;
(define-public ssacli-bin
  (package
    (name "ssacli-bin")
    (version "6.40.6.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://downloads.linux.hpe.com/SDR/repo/mcp/pool/"
             "non-free/ssacli-" version "-1.x86_64.rpm"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~\'(("." "opt/ssacli/"))))
    (supported-systems \'("x86_64-linux"))
    (home-page "https://www.hpe.com/us/en/servers/smart-array.html")
    (synopsis "HPE Smart Storage Administrator CLI")
    (description "SSACLI is the HPE Smart Storage Administrator Command
Line Interface for managing HPE Smart Array controllers and storage
devices from the command line.")
    (license (license:non-copyleft
              "https://www.hpe.com/us/en/software/licensing.html"
              "HPE License"))))
'''

RECIPE_DEFS["breitbandmessung-bin"] = ''';;; ── breitbandmessung-bin ────────────────────────────────────────────
;;; German broadband measurement desktop app
;;; AUR: breitbandmessung-bin  →  Guix: breitbandmessung-bin
;;; Upstream: https://breitbandmessung.de/desktop-app
;;;
(define-public breitbandmessung-bin
  (package
    (name "breitbandmessung-bin")
    (version "3.11.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://download.breitbandmessung.de/bbm/Breitbandmessung-"
             version "-linux.deb"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~\'(("." "opt/breitbandmessung/"))))
    (supported-systems \'("x86_64-linux"))
    (home-page "https://breitbandmessung.de/desktop-app")
    (synopsis "German broadband speed measurement app")
    (description "Breitbandmessung Desktop-App is the official German Federal
Network Agency (Bundesnetzagentur) broadband speed measurement tool.  It
performs standardized speed tests for documenting internet connection
performance.")
    (license (license:non-copyleft
              "https://breitbandmessung.de"
              "zafaco GmbH proprietary license"))))
'''

# ── Module generation ────────────────────────────────────────────────────

def gen_module():
    recipes = [p for p in PACKAGES if p[3] == "DONE"]
    blocked = [p for p in PACKAGES if p[3] == "BLOCKED"]

    # Collect recipe guix names
    recipe_names = [p[2] for p in recipes]
    # Map guix_name -> recipe code
    recipe_code = {}
    for p in recipes:
        gname = p[2]
        if gname in RECIPE_DEFS:
            recipe_code[gname] = RECIPE_DEFS[gname]

    lines = []
    lines.append(f";;; deptree-resolver-260413g.scm — Dependency-tree priority resolver")
    lines.append(f";;; Generated: {TIMESTAMP}")
    lines.append(f";;; Run ID: {RUN_ID}")
    lines.append(f";;; Total: {len(PACKAGES)} packages ({len(recipes)} recipes, {len(blocked)} blocked)")
    lines.append(f";;;")
    lines.append(f";;; Recipes ({len(recipes)}):")
    for p in recipes:
        lines.append(f";;;   {p[2]}")
    lines.append(f";;;")
    lines.append(f";;; Blocked ({len(blocked)}):")
    for p in blocked:
        lines.append(f";;;   {p[1]} [{p[4]}]")
    lines.append(f";;;")
    lines.append("")

    # Module definition
    lines.append("(define-module (gaurix packages deptree-resolver-260413g)")
    lines.append("  #:use-module (guix packages)")
    lines.append("  #:use-module (guix download)")
    lines.append("  #:use-module (guix git-download)")
    lines.append("  #:use-module (guix build-system copy)")
    lines.append("  #:use-module (guix build-system gnu)")
    lines.append("  #:use-module (guix build-system cargo)")
    lines.append("  #:use-module (guix build-system go)")
    lines.append("  #:use-module (guix gexp)")
    lines.append("  #:use-module ((guix licenses) #:prefix license:)")
    lines.append("  #:use-module (gnu packages bash)")
    lines.append("  #:use-module (gnu packages tcl)")
    lines.append("  #:use-module (gnu packages firmware)")
    lines.append("  #:use-module (gnu packages compression)")
    lines.append("  #:export (")
    for name in recipe_names:
        lines.append(f"            {name}")
    lines.append("            ))")
    lines.append("")

    # Recipe definitions
    for p in recipes:
        gname = p[2]
        if gname in recipe_code:
            lines.append(recipe_code[gname])

    return "\n".join(lines)


def gen_blocked_notes():
    blocked = [p for p in PACKAGES if p[3] == "BLOCKED"]
    lines = []
    lines.append(f";;; deptree-resolver-260413g-blocked-notes.scm")
    lines.append(f";;; Generated: {TIMESTAMP}")
    lines.append(f";;; Blocked packages: {len(blocked)}")
    lines.append("")
    lines.append("(define-module (gaurix packages deptree-resolver-260413g-blocked-notes))")
    lines.append("")

    for p in blocked:
        num, aur_name, guix_name, status, reason, detail = p
        lines.append(f";;; [{reason}] {aur_name} (#{num})")
        lines.append(f";;;   {detail}")
        lines.append("")

    return "\n".join(lines)


# ── Update todo_general_packages.org ─────────────────────────────────────

def update_todo_file():
    """Update statuses in todo_general_packages.org for resolved packages."""
    with open(TODO_FILE, 'r') as f:
        content = f.read()
    lines = content.split('\n')

    done_pkgs = {p[0]: p for p in PACKAGES if p[3] == "DONE"}
    blocked_pkgs = {p[0]: p for p in PACKAGES if p[3] == "BLOCKED"}

    # Build a map of line numbers for each entry by number
    entry_map = {}  # entry_number -> (header_line_idx, header_line)
    header_re = re.compile(r'^(\*\*\s+)(\w+)(\s+)(\d+)\.\s+(.+?)(\s+\[.*\])?\s*$')

    for i, line in enumerate(lines):
        m = header_re.match(line)
        if m:
            entry_num = int(m.group(4))
            entry_map[entry_num] = (i, m)

    updates = 0
    for num, pkg_data in done_pkgs.items():
        if num in entry_map:
            idx, m = entry_map[num]
            old_status = m.group(2)
            if old_status == "BLOCKED":
                # Change status to DONE
                new_line = lines[idx].replace(
                    f"** BLOCKED {num}.",
                    f"** DONE {num}.", 1)
                lines[idx] = new_line
                # Add status line after the header
                status_line = f"   - Status: DONE: recipe in {RUN_ID}.scm ({pkg_data[2]})"
                todo_line = f"   - TODO Status: DONE"
                # Find insertion point (after header, before next header or end)
                insert_idx = idx + 1
                lines.insert(insert_idx, status_line)
                lines.insert(insert_idx + 1, todo_line)
                updates += 1
                # Shift entry_map indices for entries after this one
                for k in entry_map:
                    eidx, em = entry_map[k]
                    if eidx > idx:
                        entry_map[k] = (eidx + 2, em)

    for num, pkg_data in blocked_pkgs.items():
        if num in entry_map:
            idx, m = entry_map[num]
            old_status = m.group(2)
            if old_status == "BLOCKED":
                # Keep BLOCKED but add/update reason
                reason = pkg_data[4]
                detail = pkg_data[5]
                status_line = f"   - Status: BLOCKED: {reason} — {detail} ({RUN_ID})"
                insert_idx = idx + 1
                lines.insert(insert_idx, status_line)
                updates += 1
                for k in entry_map:
                    eidx, em = entry_map[k]
                    if eidx > idx:
                        entry_map[k] = (eidx + 1, em)

    new_content = '\n'.join(lines)

    fd, tmp = tempfile.mkstemp(dir=os.path.dirname(TODO_FILE), suffix=".org.tmp")
    try:
        with os.fdopen(fd, 'w') as f:
            f.write(new_content)
        shutil.move(tmp, TODO_FILE)
    except:
        os.unlink(tmp)
        raise

    print(f"  Updated {updates} entries in {TODO_FILE}")
    return updates


# ── Update general-compat.scm ───────────────────────────────────────────

def update_compat_scm():
    """Add module import and compat aliases to general-compat.scm."""
    with open(COMPAT_SCM, 'r') as f:
        content = f.read()

    new_module = "(gaurix packages deptree-resolver-260413g)"

    lines = content.split('\n')

    # Add use-module
    last_use_module_idx = 0
    for i, line in enumerate(lines):
        if line.strip().startswith("#:use-module"):
            last_use_module_idx = i
    if last_use_module_idx > 0:
        lines.insert(last_use_module_idx + 1, f"  #:use-module {new_module}")

    # Add compat aliases for packages where AUR name != Guix name
    compat_aliases = []
    for p in PACKAGES:
        if p[3] == "DONE" and p[1] != p[2]:
            compat_aliases.append((p[1], p[2]))

    if compat_aliases:
        lines.append("")
        lines.append(f"; --- {RUN_ID} compat aliases ---")
        for aur_name, guix_var in compat_aliases:
            lines.append(f'(define-public {aur_name} (package (inherit {guix_var}) (name "{aur_name}")))')

    content = '\n'.join(lines)

    fd, tmp = tempfile.mkstemp(dir=os.path.dirname(COMPAT_SCM), suffix=".scm.tmp")
    try:
        with os.fdopen(fd, 'w') as f:
            f.write(content)
        shutil.move(tmp, COMPAT_SCM)
    except:
        os.unlink(tmp)
        raise

    print(f"  Updated {COMPAT_SCM}: module import + {len(compat_aliases)} aliases")
    return compat_aliases


# ── Update packages.scm ─────────────────────────────────────────────────

def update_packages_scm():
    """Add exports to packages.scm."""
    with open(PACKAGES_SCM, 'r') as f:
        content = f.read()

    lines = content.split('\n')

    # Find the position after the module definition opening
    # Add our exports near the top, after existing exports
    recipe_names = [p[2] for p in PACKAGES if p[3] == "DONE"]
    compat_names = [p[1] for p in PACKAGES if p[3] == "DONE" and p[1] != p[2]]

    all_exports = recipe_names + compat_names

    # Insert after line 2 (after the module def line)
    insert_block = [f"            ;; {RUN_ID}"]
    for name in all_exports:
        insert_block.append(f"            {name}")

    # Find a good insertion point
    insert_idx = 2  # After "(define-module (gaurix packages)"
    for i, line in enumerate(lines):
        if line.strip().startswith(";; deptree-resolver-260413") or \
           line.strip().startswith(";; recipe-resolver-260413"):
            insert_idx = i
            break

    for j, insert_line in enumerate(insert_block):
        lines.insert(insert_idx + j, insert_line)

    content = '\n'.join(lines)

    fd, tmp = tempfile.mkstemp(dir=os.path.dirname(PACKAGES_SCM), suffix=".scm.tmp")
    try:
        with os.fdopen(fd, 'w') as f:
            f.write(content)
        shutil.move(tmp, PACKAGES_SCM)
    except:
        os.unlink(tmp)
        raise

    print(f"  Updated {PACKAGES_SCM}: added {len(all_exports)} exports")


# ── Summary JSON ─────────────────────────────────────────────────────────

def write_summary():
    recipes = [p for p in PACKAGES if p[3] == "DONE"]
    blocked = [p for p in PACKAGES if p[3] == "BLOCKED"]

    summary = {
        "run_id": RUN_ID,
        "timestamp": TIMESTAMP,
        "total_processed": len(PACKAGES),
        "recipes_created": len(recipes),
        "blocked_count": len(blocked),
        "recipes": [
            {"number": p[0], "aur_name": p[1], "guix_name": p[2]}
            for p in recipes
        ],
        "blocked": [
            {"number": p[0], "aur_name": p[1], "reason": p[4], "detail": p[5]}
            for p in blocked
        ],
    }

    with open(SUMMARY_JSON, 'w') as f:
        json.dump(summary, f, indent=2)
    print(f"  Wrote {SUMMARY_JSON}")


# ── Main ─────────────────────────────────────────────────────────────────

def main():
    print(f"=== {RUN_ID} ===")
    print(f"Timestamp: {TIMESTAMP}")

    recipes = [p for p in PACKAGES if p[3] == "DONE"]
    blocked = [p for p in PACKAGES if p[3] == "BLOCKED"]
    print(f"Total: {len(PACKAGES)} packages ({len(recipes)} recipes, {len(blocked)} blocked)")
    print()

    # Generate Scheme module
    print("Generating Scheme module...")
    scm_content = gen_module()
    fd, tmp = tempfile.mkstemp(dir=os.path.dirname(SCM_FILE), suffix=".scm.tmp")
    try:
        with os.fdopen(fd, 'w') as f:
            f.write(scm_content)
        shutil.move(tmp, SCM_FILE)
    except:
        os.unlink(tmp)
        raise
    print(f"  Wrote {SCM_FILE}")

    # Generate blocked notes
    print("Generating blocked notes...")
    blocked_content = gen_blocked_notes()
    fd, tmp = tempfile.mkstemp(dir=os.path.dirname(BLOCKED_NOTES_FILE), suffix=".scm.tmp")
    try:
        with os.fdopen(fd, 'w') as f:
            f.write(blocked_content)
        shutil.move(tmp, BLOCKED_NOTES_FILE)
    except:
        os.unlink(tmp)
        raise
    print(f"  Wrote {BLOCKED_NOTES_FILE}")

    # Generate summary
    print("Generating summary...")
    write_summary()

    # Update todo file
    print("Updating todo_general_packages.org...")
    update_todo_file()

    # Update general-compat.scm
    print("Updating general-compat.scm...")
    update_compat_scm()

    # Update packages.scm
    print("Updating packages.scm...")
    update_packages_scm()

    print()
    print(f"=== Summary ===")
    print(f"Recipes: {len(recipes)}")
    print(f"Blocked: {len(blocked)}")
    print(f"Files written:")
    print(f"  {SCM_FILE}")
    print(f"  {BLOCKED_NOTES_FILE}")
    print(f"  {SUMMARY_JSON}")
    print(f"Files updated:")
    print(f"  {TODO_FILE}")
    print(f"  {COMPAT_SCM}")
    print(f"  {PACKAGES_SCM}")


if __name__ == "__main__":
    main()
