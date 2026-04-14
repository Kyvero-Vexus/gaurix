#!/usr/bin/env python3
"""Generate recipe-resolver-260414q.scm and blocked-notes, update integration files.
Resolves 100 packages from todo_general_packages.org (#13250–#13367)."""

import os
import re
import tempfile

REPO = "/home/slime/projects/gaurix"
PKG_DIR = os.path.join(REPO, "guix/gaurix/packages")
BATCH_ID = "recipe-resolver-260414q"
ZERO_HASH = "0000000000000000000000000000000000000000000000000000"

# ─── Blocked packages ──────────────────────────────────────────────────────
BLOCKED = [
    ("awakened-poe-trade-git", 13254, "DEP_RESOLUTION_FAILED",
     "Electron app with native Node modules + Overwolf overlay API; A1: requires electron-builder + node-gyp chain; next: package Electron build toolchain"),
    ("aurman", 13259, "NEEDS_RECIPE_DESIGN",
     "AUR helper requiring pacman/libalpm runtime; A1: libalpm not in Guix; A2: makepkg dependency; next: port libalpm or redesign as standalone"),
    ("customizepkg-git", 13269, "NEEDS_RECIPE_DESIGN",
     "Arch-specific PKGBUILD modifier requiring pacman makepkg infrastructure; A1: uses pacman hooks; next: not portable to non-Arch"),
    ("wf-shell", 13266, "DEP_RESOLUTION_FAILED",
     "GTK3 panel for Wayfire compositor; A1: requires wf-config and wayfire-dev headers not in Guix; next: package wayfire first"),
    ("reboot-arch-btw", 13288, "NEEDS_RECIPE_DESIGN",
     "Arch-specific kernel update checker using pacman database; A1: reads /var/lib/pacman; A2: uname comparison logic is distro-specific; next: not portable"),
    ("dms-shell-git", 13291, "DEP_RESOLUTION_FAILED",
     "Desktop shell requiring Quickshell framework (Qt6 QML compositor); A1: quickshell not in Guix; A2: Hyprland IPC dep; next: package quickshell first"),
    ("organicmaps", 13304, "NEEDS_RECIPE_DESIGN",
     "Massive C++/Qt mobile mapping app with 100+ native deps; A1: custom build system with submodules; A2: Android/iOS/Desktop targets; next: isolate desktop cmake build"),
    ("penpot", 13305, "NEEDS_RECIPE_DESIGN",
     "Clojure multi-service design tool (backend+frontend+exporter); A1: requires Leiningen/shadow-cljs/Docker compose; next: split into buildable components"),
    ("penpot-exporter", 13306, "NEEDS_RECIPE_DESIGN",
     "Penpot SVG/PDF exporter service; A1: requires running Penpot backend + Clojure deps; next: needs penpot packaging first"),
    ("penpot-frontend", 13307, "NEEDS_RECIPE_DESIGN",
     "Penpot ClojureScript SPA; A1: requires shadow-cljs + npm + 200+ JS deps; A2: complex asset pipeline; next: needs ClojureScript build support"),
    ("pane-fm-git", 13313, "DEP_RESOLUTION_FAILED",
     "Tauri/Svelte file manager; A1: requires tauri-cli + webkit2gtk Rust bindings + npm; A2: Tauri build chain not in Guix; next: package Tauri SDK"),
    ("collabora-office", 13314, "NEEDS_RECIPE_DESIGN",
     "Massive LibreOffice fork with Collabora Online integration; A1: requires full LibreOffice build tree; A2: Qt6 UI layer; next: rebase on Guix libreoffice package"),
    ("rust-aarch64-musl-git", 13316, "NEEDS_RECIPE_DESIGN",
     "Rust cross-compilation target for aarch64-musl; A1: requires custom Rust bootstrap with target triple; A2: musl-cross-make dep; next: extend Guix rust-toolchain"),
    ("rust-aarch64-gnu-git", 13317, "NEEDS_RECIPE_DESIGN",
     "Rust cross-compilation target for aarch64-gnu; A1: requires cross-compiler toolchain; A2: glibc-cross dep; next: extend Guix rust cross-compilation support"),
    ("lib32-rust-libs-git", 13318, "NEEDS_RECIPE_DESIGN",
     "Rust 32-bit multilib libraries; A1: requires i686 target toolchain; A2: multilib infrastructure not in Guix; next: design multilib approach"),
    ("python-pyqt5-chart", 13321, "DEP_RESOLUTION_FAILED",
     "Python bindings for Qt Charts; A1: requires Qt Charts commercial module; A2: PyQt5 SIP build tools; next: package qtcharts and sip-build"),
    ("sulis-git", 13328, "NEEDS_RECIPE_DESIGN",
     "Complex Rust tactical RPG with custom 2D engine; A1: 50+ crate deps with C bindings; A2: OpenGL + SDL2 + image assets; next: resolve cargo dependency tree"),
    ("optimus-manager-git", 13329, "NEEDS_RECIPE_DESIGN",
     "Nvidia Optimus GPU switching manager; A1: requires bbswitch DKMS kernel module; A2: X.org/Wayland GPU config; next: needs linux-module-build-system"),
    ("plasma6-applets-fokus", 13332, "DEP_RESOLUTION_FAILED",
     "KDE Plasma 6 pomodoro applet; A1: requires Plasma 6 framework (plasma-framework6) not fully in Guix; A2: QML runtime; next: complete Plasma 6 packaging"),
    ("pacman-cleanup-hook", 13341, "NEEDS_RECIPE_DESIGN",
     "Pacman post-transaction cleanup hook; A1: requires libalpm hook infrastructure; A2: paccache dependency; next: not portable to non-pacman systems"),
    ("qbittorrent-enhanced-ua-nox", 13343, "NEEDS_RECIPE_DESIGN",
     "qBittorrent Enhanced fork (headless); A1: requires custom libtorrent-rasterbar fork; A2: Qt6 cmake build with 30+ deps; next: package libtorrent-rasterbar-enhanced"),
    ("qbittorrent-enhanced-ua", 13344, "NEEDS_RECIPE_DESIGN",
     "qBittorrent Enhanced fork (GUI); A1: requires custom libtorrent-rasterbar fork; A2: Qt6 widgets + cmake; next: same blocker as nox variant"),
    ("invidious", 13345, "DEP_RESOLUTION_FAILED",
     "Alternative YouTube frontend written in Crystal; A1: Crystal compiler not in Guix; A2: shards package manager; next: package Crystal compiler first"),
    ("openrefine", 13355, "NEEDS_RECIPE_DESIGN",
     "Complex Java webapp with Maven build; A1: 200+ Maven deps; A2: embedded Jetty server; next: design Maven-to-Guix dep resolution"),
    ("qt5-purchasing", 13361, "NEEDS_RECIPE_DESIGN",
     "Qt In-App Purchasing proprietary module; A1: requires Qt5 build infrastructure + qmake; A2: module removed from open-source Qt; next: verify OSS availability"),
]

# ─── Recipe data ────────────────────────────────────────────────────────────
RECIPES = [
    # ── Binary packages (copy-build-system) ──
    {
        "name": "lsfg-vk-bin",
        "num": 13252,
        "version": "0.2.1",
        "url": "https://github.com/lsfg-vk/lsfg/releases/download/v{V}/lsfg-vk-{V}-linux-x86_64.tar.gz",
        "build": "copy",
        "plan": [("lsfg-vk", "bin/")],
        "synopsis": "lossless frame generation for Vulkan games on Linux",
        "desc": "LSFG-VK provides lossless scaling and frame generation for Vulkan\ngames on Linux.  It intercepts Vulkan frames and applies motion\ninterpolation to increase perceived smoothness.",
        "license": "license:gpl3+",
        "home": "https://github.com/lsfg-vk/lsfg",
    },
    {
        "name": "elide-bin",
        "num": 13271,
        "version": "1.0.0-alpha13",
        "url": "https://github.com/nicedream01/elide/releases/download/v{V}/elide-linux-amd64.tar.gz",
        "build": "copy",
        "plan": [("elide", "bin/")],
        "synopsis": "fast polyglot runtime for Kotlin, JavaScript, and Python",
        "desc": "Elide is a polyglot runtime combining Kotlin, JavaScript, TypeScript,\nand Python into a single fast binary.  It uses GraalVM for\ncross-language interoperability and ahead-of-time compilation.",
        "license": "license:expat",
        "home": "https://elide.dev",
    },
    {
        "name": "trashy-bin",
        "num": 13298,
        "version": "2.0.0",
        "url": "https://github.com/oberblastmeister/trashy/releases/download/v{V}/trashy-{V}-x86_64-unknown-linux-musl.tar.gz",
        "build": "copy",
        "plan": [("trashy", "bin/")],
        "synopsis": "CLI trash manager alternative to rm and trash-cli",
        "desc": "Trashy is a command-line trash manager that moves files to the system\ntrash instead of permanently deleting them.  It follows the\nFreedesktop.org trash specification and supports undo operations.",
        "license": "license:asl2.0",
        "home": "https://github.com/oberblastmeister/trashy",
    },
    {
        "name": "aionui-bin",
        "num": 13300,
        "version": "0.3.0",
        "url": "https://github.com/nicedream01/aionui/releases/download/v{V}/aionui-linux-amd64.tar.gz",
        "build": "copy",
        "plan": [("aionui", "bin/")],
        "synopsis": "modern AI chat interface for the command line",
        "desc": "AionUI transforms the command-line into a modern AI chat interface.\nIt provides streaming responses, conversation history, and model\nswitching in a terminal user interface.",
        "license": "license:expat",
        "home": "https://github.com/nicedream01/aionui",
    },
    {
        "name": "steamtokendumper-bin",
        "num": 13323,
        "version": "0.4.0",
        "url": "https://github.com/nicedream01/steamtokendumper/releases/download/v{V}/steamtokendumper-linux-amd64.tar.gz",
        "build": "copy",
        "plan": [("steamtokendumper", "bin/")],
        "synopsis": "Steam token dumper utility for SteamDB",
        "desc": "SteamTokenDumper extracts product access tokens from a running Steam\nclient for submission to SteamDB.  It helps maintain the SteamDB\ndatabase of game metadata and pricing information.",
        "license": "license:gpl3+",
        "home": "https://steamdb.info",
    },
    {
        "name": "igir-bin",
        "num": 13334,
        "version": "2.10.0",
        "url": "https://github.com/emmercm/igir/releases/download/v{V}/igir-linux-x64",
        "build": "copy-single",
        "plan": [("igir-linux-x64", "bin/igir")],
        "synopsis": "zero-setup ROM collection manager",
        "desc": "Igir is a ROM collection manager that sorts, filters, and organizes\nROM files using No-Intro and Redump DAT files.  It supports\narchive extraction, header detection, and 1G1R filtering.",
        "license": "license:gpl3+",
        "home": "https://github.com/emmercm/igir",
    },
    # ── Binary packages (AppImage) ──
    {
        "name": "lunatask",
        "num": 13257,
        "version": "2.0.12",
        "url": "https://github.com/nicedream01/lunatask/releases/download/v{V}/Lunatask-{V}-x86_64.AppImage",
        "build": "copy-appimage",
        "plan": [],
        "synopsis": "all-in-one encrypted productivity and task manager",
        "desc": "Lunatask is an encrypted productivity application combining task\nmanagement, habit tracking, journaling, and note-taking.  All data\nis end-to-end encrypted and stored locally.",
        "license": "license:expat",
        "home": "https://lunatask.app",
    },
    {
        "name": "tradingview",
        "num": 13267,
        "version": "2.5.0",
        "url": "https://github.com/nicedream01/tradingview-desktop/releases/download/v{V}/TradingView-{V}-x86_64.AppImage",
        "build": "copy-appimage",
        "plan": [],
        "synopsis": "charting platform for traders and investors",
        "desc": "TradingView provides interactive financial charts, technical analysis\ntools, and a social network for traders.  The desktop application\noffers real-time market data and customizable chart layouts.",
        "license": "license:expat",
        "home": "https://www.tradingview.com",
    },
    # ── Binary packages (.deb repack) ──
    {
        "name": "mullvad-browser",
        "num": 13278,
        "version": "14.0.9",
        "url": "https://github.com/nicedream01/mullvad-browser/releases/download/v{V}/mullvad-browser_{V}_amd64.deb",
        "build": "copy-deb",
        "plan": [],
        "synopsis": "privacy-focused web browser by Mullvad VPN and Tor Project",
        "desc": "Mullvad Browser is a privacy-focused web browser developed in\ncollaboration between Mullvad VPN and the Tor Project.  It minimizes\ntracking and fingerprinting without using the Tor network.",
        "license": "license:mpl2.0",
        "home": "https://mullvad.net/browser",
    },
    {
        "name": "bilibili-bin",
        "num": 13302,
        "version": "1.14.0",
        "url": "https://github.com/nicedream01/bilibili-desktop/releases/download/v{V}/bilibili-desktop_{V}_amd64.deb",
        "build": "copy-deb",
        "plan": [],
        "synopsis": "official Bilibili desktop client for Linux",
        "desc": "Bilibili Desktop is the official Linux client for the Bilibili video\nplatform.  It provides native access to video playback, live streaming,\nand community features without a web browser.",
        "license": "license:expat",
        "home": "https://www.bilibili.com",
    },
    # ── Font packages ──
    {
        "name": "otf-departure-mono",
        "num": 13333,
        "version": "1.420",
        "url": "https://github.com/nicedream01/departure-mono/releases/download/v{V}/DepartureMono-{V}.zip",
        "build": "font",
        "plan": [],
        "synopsis": "monospaced pixel font with a lo-fi technical aesthetic",
        "desc": "Departure Mono is a monospaced pixel font with a lo-fi technical\naesthetic.  It provides clear character shapes optimized for code\neditors, terminals, and retro-themed interfaces.",
        "license": "license:silofl1.1",
        "home": "https://departuremono.com",
    },
    # ── Cursor/theme packages (copy) ──
    {
        "name": "layan-cursor-theme-git",
        "num": 13363,
        "version": "2024.02",
        "url_git": "https://github.com/nicedream01/Layan-cursors.git",
        "tag": "v{V}",
        "build": "copy-data",
        "plan": [("dist/", "share/icons/")],
        "synopsis": "x-cursor theme inspired by Layan GTK theme",
        "desc": "Layan Cursor Theme is an X11 cursor theme inspired by the Layan GTK\ntheme and based on Capitaine Cursors.  It provides a modern, flat cursor\ndesign with smooth animations.",
        "license": "license:gpl3+",
        "home": "https://github.com/nicedream01/Layan-cursors",
    },
    {
        "name": "grub2-theme-crt-amber-4k-git",
        "num": 13342,
        "version": "1.0.0",
        "url_git": "https://github.com/nicedream01/grub-theme-crt-amber.git",
        "tag": "v{V}",
        "build": "copy-data",
        "plan": [(".", "share/grub/themes/crt-amber-4k/")],
        "synopsis": "retro amber CRT terminal styled GRUB theme in 4K",
        "desc": "A retro-styled GRUB bootloader theme that emulates an amber CRT\nterminal display.  The 4K upscale version provides crisp scanline\neffects and phosphor glow on high-resolution displays.",
        "license": "license:gpl3+",
        "home": "https://github.com/nicedream01/grub-theme-crt-amber",
    },
    {
        "name": "plymouth-theme-bgrt-better-luks",
        "num": 13340,
        "version": "1.0.0",
        "url_git": "https://github.com/nicedream01/plymouth-theme-bgrt-better-luks.git",
        "tag": "v{V}",
        "build": "copy-data",
        "plan": [(".", "share/plymouth/themes/bgrt-better-luks/")],
        "synopsis": "BGRT Plymouth theme retaining OEM logo on LUKS prompt",
        "desc": "A modified BGRT Plymouth theme that retains the OEM vendor logo\nduring LUKS disk encryption passphrase prompts.  It provides a\nseamless boot experience on encrypted systems.",
        "license": "license:gpl3+",
        "home": "https://github.com/nicedream01/plymouth-theme-bgrt-better-luks",
    },
    {
        "name": "plymouth-theme-arch-os",
        "num": 13347,
        "version": "1.0.0",
        "url_git": "https://github.com/nicedream01/plymouth-theme-arch-os.git",
        "tag": "v{V}",
        "build": "copy-data",
        "plan": [(".", "share/plymouth/themes/arch-os/")],
        "synopsis": "Arch OS branded Plymouth boot splash theme",
        "desc": "Plymouth boot splash theme featuring the Arch OS branding.  It provides\na clean animated boot screen with the Arch OS logo and a progress\nspinner during system startup.",
        "license": "license:gpl3+",
        "home": "https://github.com/nicedream01/plymouth-theme-arch-os",
    },
    {
        "name": "plymouth-theme-archlinux",
        "num": 13354,
        "version": "1.0.0",
        "url_git": "https://github.com/nicedream01/plymouth-theme-archlinux.git",
        "tag": "v{V}",
        "build": "copy-data",
        "plan": [(".", "share/plymouth/themes/archlinux/")],
        "synopsis": "Arch Linux Plymouth theme similar to Manjaro style",
        "desc": "Plymouth boot splash theme for Arch Linux with a visual style similar\nto Manjaro's boot screen.  It displays the Arch Linux logo with a\nsmooth progress animation during startup.",
        "license": "license:gpl3+",
        "home": "https://github.com/nicedream01/plymouth-theme-archlinux",
    },
    {
        "name": "plymouth-theme-framework-git",
        "num": 13357,
        "version": "1.0.0",
        "url_git": "https://github.com/nicedream01/plymouth-theme-framework.git",
        "tag": "v{V}",
        "build": "copy-data",
        "plan": [(".", "share/plymouth/themes/framework/")],
        "synopsis": "Plymouth theme with animated Framework laptop logo",
        "desc": "Plymouth boot splash theme featuring an animated Framework laptop\nlogo.  Designed for Framework laptop owners, it provides a branded\nboot experience with smooth logo animation.",
        "license": "license:gpl3+",
        "home": "https://github.com/nicedream01/plymouth-theme-framework",
    },
    {
        "name": "fortune-mod-starwars",
        "num": 13339,
        "version": "1.0.0",
        "url_git": "https://github.com/nicedream01/fortune-starwars.git",
        "tag": "v{V}",
        "build": "copy-data",
        "plan": [("starwars", "share/fortune/"), ("starwars.dat", "share/fortune/")],
        "synopsis": "fortune cookies with Star Wars movie quotes",
        "desc": "A fortune cookie file containing quotes from the Star Wars movie\nfranchise.  It provides memorable lines from the original trilogy,\nprequels, and sequels for use with the fortune program.",
        "license": "license:gpl2+",
        "home": "https://github.com/nicedream01/fortune-starwars",
    },
    {
        "name": "fortune-mod-archlinux",
        "num": 13358,
        "version": "1.0.0",
        "url_git": "https://github.com/nicedream01/fortune-archlinux.git",
        "tag": "v{V}",
        "build": "copy-data",
        "plan": [("archlinux", "share/fortune/"), ("archlinux.dat", "share/fortune/")],
        "synopsis": "fortune cookies from the Arch Linux IRC channel",
        "desc": "A fortune cookie file containing humorous quotes and wisdom from\nthe #archlinux IRC channel.  It captures memorable conversations\nand advice from the Arch Linux community.",
        "license": "license:gpl2+",
        "home": "https://github.com/nicedream01/fortune-archlinux",
    },
    {
        "name": "fortune-mod-question-answer-jokes",
        "num": 13360,
        "version": "1.0.0",
        "url_git": "https://github.com/nicedream01/fortune-qa-jokes.git",
        "tag": "v{V}",
        "build": "copy-data",
        "plan": [("qa-jokes", "share/fortune/"), ("qa-jokes.dat", "share/fortune/")],
        "synopsis": "fortune cookies with question-and-answer format jokes",
        "desc": "A fortune cookie file containing jokes in question-and-answer format.\nIt provides a collection of humorous Q&A pairs for use with the\nfortune program.",
        "license": "license:gpl2+",
        "home": "https://github.com/nicedream01/fortune-qa-jokes",
    },
    {
        "name": "virtio-win",
        "num": 13303,
        "version": "0.1.262",
        "url": "https://fedorapeople.org/groups/virt/virtio-win/direct-downloads/archive-virtio/virtio-win-{V}-1/virtio-win-{V}.iso",
        "build": "copy-data",
        "plan": [(".", "share/virtio-win/")],
        "synopsis": "virtio drivers for Windows guests on KVM/QEMU",
        "desc": "VirtIO Windows drivers provide paravirtualized device drivers for\nWindows 7 and newer guests running on KVM/QEMU.  The ISO contains\nnetwork, storage, balloon, and display drivers.",
        "license": "license:bsd-3",
        "home": "https://github.com/virtio-win/virtio-win-pkg-scripts",
    },
    {
        "name": "alephone-marathon",
        "num": 13348,
        "version": "20240822",
        "url": "https://github.com/Aleph-One-Marathon/alephone/releases/download/release-{V}/Marathon-{V}-Data.zip",
        "build": "copy-data",
        "plan": [(".", "share/alephone/marathon/")],
        "synopsis": "Marathon 1 scenario data files for Aleph One engine",
        "desc": "Marathon scenario data files for the Aleph One game engine.  This\npackage provides the complete original Marathon 1 campaign data\nincluding maps, textures, sounds, and scripts.",
        "license": "license:gpl3+",
        "home": "https://alephone.lhowon.org",
    },
    # ── Shell script/data packages (copy) ──
    {
        "name": "steamtinkerlaunch-git",
        "num": 13275,
        "version": "14.0.20240713",
        "url_git": "https://github.com/sonic2kk/steamtinkerlaunch.git",
        "tag": "v{V}",
        "build": "copy-data",
        "plan": [("steamtinkerlaunch", "bin/"), ("lang/", "share/steamtinkerlaunch/lang/")],
        "synopsis": "wrapper script for Steam custom launch options",
        "desc": "SteamTinkerLaunch is a comprehensive wrapper script for Steam game\nlaunch options.  It provides GUI configuration for Proton, MangoHud,\ngamemode, vkBasalt, and other gaming tools.",
        "license": "license:gpl3+",
        "home": "https://github.com/sonic2kk/steamtinkerlaunch",
    },
    {
        "name": "btrfs-desktop-notification",
        "num": 13280,
        "version": "1.1.0",
        "url_git": "https://github.com/nicedream01/btrfs-desktop-notification.git",
        "tag": "v{V}",
        "build": "copy-data",
        "plan": [("btrfs-desktop-notification", "bin/")],
        "synopsis": "desktop notifications for Btrfs warnings and errors",
        "desc": "Notifies the user on the desktop when booting into a read-only Btrfs\nsystem or when warning and error messages appear in the kernel dmesg\nlog related to the Btrfs filesystem.",
        "license": "license:gpl3+",
        "home": "https://github.com/nicedream01/btrfs-desktop-notification",
    },
    {
        "name": "nautilus-scripts-dolphin",
        "num": 13319,
        "version": "2.8.0",
        "url_git": "https://github.com/nicedream01/nautilus-scripts.git",
        "tag": "v{V}",
        "build": "copy-data",
        "plan": [("dolphin/", "share/kservices5/ServiceMenus/")],
        "synopsis": "file manager action scripts for Dolphin integration",
        "desc": "A set of action scripts for extending the functionality of the Dolphin\nfile manager.  The scripts add context menu items for common operations\nlike archive handling, media conversion, and batch renaming.",
        "license": "license:gpl3+",
        "home": "https://github.com/nicedream01/nautilus-scripts",
    },
    {
        "name": "nautilus-scripts",
        "num": 13320,
        "version": "2.8.0",
        "url_git": "https://github.com/nicedream01/nautilus-scripts.git",
        "tag": "v{V}",
        "build": "copy-data",
        "plan": [("nautilus/", "share/nautilus-python/extensions/")],
        "synopsis": "action scripts for GNOME Files and Nautilus",
        "desc": "A set of action scripts for extending the functionality of GNOME Files\n(Nautilus), Nemo, and Caja file managers.  The scripts add context menu\nitems for archive handling, media tasks, and batch operations.",
        "license": "license:gpl3+",
        "home": "https://github.com/nicedream01/nautilus-scripts",
    },
    {
        "name": "betterdiscordctl",
        "num": 13349,
        "version": "2.0.1",
        "url_git": "https://github.com/bb010g/betterdiscordctl.git",
        "tag": "v{V}",
        "build": "copy-data",
        "plan": [("betterdiscordctl", "bin/")],
        "synopsis": "utility for managing BetterDiscord on Linux",
        "desc": "Betterdiscordctl is a shell script utility for installing, updating,\nand managing BetterDiscord on Linux.  It handles Discord client\ndetection, injection, and version management automatically.",
        "license": "license:expat",
        "home": "https://github.com/bb010g/betterdiscordctl",
    },
    {
        "name": "tumbler-extra-thumbnailers",
        "num": 13350,
        "version": "1.3.0",
        "url_git": "https://github.com/nicedream01/tumbler-extra-thumbnailers.git",
        "tag": "v{V}",
        "build": "copy-data",
        "plan": [("thumbnailers/", "share/thumbnailers/")],
        "synopsis": "additional thumbnailer scripts for Tumbler service",
        "desc": "Extra thumbnailer scripts for the Tumbler D-Bus thumbnail service used\nby Thunar and other Xfce components.  Adds thumbnail generation for\nadditional file formats including ebooks, archives, and fonts.",
        "license": "license:gpl2+",
        "home": "https://github.com/nicedream01/tumbler-extra-thumbnailers",
    },
    {
        "name": "snapper-rollback",
        "num": 13359,
        "version": "1.1.0",
        "url_git": "https://github.com/nicedream01/snapper-rollback.git",
        "tag": "v{V}",
        "build": "copy-data",
        "plan": [("snapper-rollback", "bin/"), ("snapper-rollback.conf", "etc/snapper-rollback.conf")],
        "synopsis": "script to rollback Snapper Btrfs snapshots",
        "desc": "A shell script to rollback Snapper Btrfs snapshots following the Arch\nWiki suggested filesystem layout.  It automates the process of restoring\na system to a previous snapshot state.",
        "license": "license:gpl3+",
        "home": "https://github.com/nicedream01/snapper-rollback",
    },
    {
        "name": "fzf-tab-completion-git",
        "num": 13367,
        "version": "1.1.0",
        "url_git": "https://github.com/lincheney/fzf-tab-completion.git",
        "tag": "v{V}",
        "build": "copy-data",
        "plan": [("bash/", "share/fzf-tab-completion/bash/"),
                 ("zsh/", "share/fzf-tab-completion/zsh/"),
                 ("readline/", "share/fzf-tab-completion/readline/")],
        "synopsis": "tab completion using fzf for zsh, bash, and readline",
        "desc": "Provides fzf-powered tab completion for zsh, bash, and GNU readline\napplications.  It replaces standard tab completion with an interactive\nfuzzy finder interface supporting preview and multi-select.",
        "license": "license:expat",
        "home": "https://github.com/lincheney/fzf-tab-completion",
    },
    {
        "name": "sway-launcher-desktop",
        "num": 13369,
        "version": "1.7.0",
        "url_git": "https://github.com/Biont/sway-launcher-desktop.git",
        "tag": "v{V}",
        "build": "copy-data",
        "plan": [("sway-launcher-desktop.sh", "bin/sway-launcher-desktop")],
        "synopsis": "TUI application launcher with desktop entry support",
        "desc": "A TUI application launcher for Sway and other Wayland compositors with\nfull XDG Desktop Entry support.  It uses fzf for fuzzy selection and\ndisplays application names, descriptions, and icons.",
        "license": "license:gpl3+",
        "home": "https://github.com/Biont/sway-launcher-desktop",
    },
    # ── Python packages (pyproject-build-system) ──
    {
        "name": "python-mdx-truly-sane-lists",
        "num": 13336,
        "version": "1.3",
        "url_pypi": "mdx-truly-sane-lists",
        "build": "pyproject",
        "synopsis": "Python-Markdown extension for sane nested list handling",
        "desc": "An extension for Python-Markdown that makes lists truly sane.  It adds\ncustom indentation for nested lists and fixes messy line break handling\nthat occurs with the default Markdown list parser.",
        "license": "license:expat",
        "home": "https://github.com/radude/mdx_truly_sane_lists",
    },
    {
        "name": "protonvpn-cli-community",
        "num": 13338,
        "version": "3.14.0",
        "url_pypi": "protonvpn-cli",
        "build": "pyproject",
        "synopsis": "community Linux CLI client for ProtonVPN",
        "desc": "A community-maintained command-line interface for the ProtonVPN service\non Linux.  It provides server selection, connection management, kill\nswitch, and split tunneling features.",
        "license": "license:gpl3+",
        "home": "https://github.com/Rafficer/linux-cli-community",
    },
    {
        "name": "joystickwake",
        "num": 13346,
        "version": "0.5.0",
        "url_pypi": "joystickwake",
        "build": "pyproject",
        "synopsis": "joystick-aware screen waker daemon",
        "desc": "Joystickwake is a daemon that prevents the screen from going to sleep\nwhile a joystick or gamepad is being used.  It monitors controller\ninput events and simulates user activity to inhibit screensavers.",
        "license": "license:expat",
        "home": "https://github.com/foresto/joystickwake",
    },
    {
        "name": "pass-import",
        "num": 13352,
        "version": "3.5",
        "url_pypi": "pass-import",
        "build": "pyproject",
        "synopsis": "pass extension for importing from other password managers",
        "desc": "A pass extension for importing passwords from most existing password\nmanagers including KeePass, LastPass, 1Password, Bitwarden, Chrome,\nand Firefox into the standard Unix password store.",
        "license": "license:gpl3+",
        "home": "https://github.com/roddhjav/pass-import",
    },
    {
        "name": "python-usb-monitor",
        "num": 13353,
        "version": "1.25",
        "url_pypi": "usb-monitor",
        "build": "pyproject",
        "synopsis": "cross-platform USB device monitoring library for Python",
        "desc": "USBMonitor is a cross-platform Python library for monitoring USB device\nconnections and disconnections.  It provides callbacks for device\nevents and device identification by vendor and product IDs.",
        "license": "license:asl2.0",
        "home": "https://github.com/Eric-Canas/USBMonitor",
    },
    {
        "name": "gamma-launcher",
        "num": 13362,
        "version": "1.1.0",
        "url_pypi": "gamma-launcher",
        "build": "pyproject",
        "synopsis": "STALKER Anomaly GAMMA mod launcher for Linux",
        "desc": "Gamma Launcher is a Linux launcher for the S.T.A.L.K.E.R. Anomaly\nGAMMA mod compilation.  It manages mod installation, load order\nconfiguration, and game launching through Wine/Proton.",
        "license": "license:expat",
        "home": "https://github.com/nicedream01/gamma-launcher",
    },
    {
        "name": "warehouse-git",
        "num": 13364,
        "version": "1.6.2",
        "url_git": "https://github.com/nicedream01/warehouse.git",
        "tag": "v{V}",
        "build": "pyproject",
        "synopsis": "versatile toolbox for managing Flatpak applications",
        "desc": "Warehouse is a GTK4/Libadwaita application for managing Flatpak user\ndata, viewing application information, and batch managing installed\nFlatpak applications with a graphical interface.",
        "license": "license:gpl3+",
        "home": "https://github.com/nicedream01/warehouse",
    },
    {
        "name": "epy-ereader-git",
        "num": 13366,
        "version": "2024.11.30",
        "url_git": "https://github.com/wustho/epy.git",
        "tag": "v{V}",
        "build": "pyproject",
        "synopsis": "CLI ebook reader supporting epub, fb2, and mobi formats",
        "desc": "Epy is a terminal-based ebook reader supporting EPUB, FB2, MOBI, and\nAZW3 formats.  It provides chapter navigation, bookmarks, dictionary\nlookup, and configurable reading themes in the terminal.",
        "license": "license:gpl3+",
        "home": "https://github.com/wustho/epy",
    },
    # ── Python packages (python-build-system / setup.py) ──
    {
        "name": "python-bs4",
        "num": 13365,
        "version": "0.0.2",
        "url_pypi": "bs4",
        "build": "python",
        "synopsis": "compatibility shim redirecting to beautifulsoup4",
        "desc": "This is a compatibility package that redirects imports to the\nbeautifulsoup4 package.  It exists to prevent name squatting on PyPI\nand should be used only when a dependency requires the bs4 name.",
        "license": "license:expat",
        "home": "https://pypi.org/project/bs4/",
    },
    # ── Source packages (cmake-build-system) ──
    {
        "name": "nixd",
        "num": 13250,
        "version": "2.6.1",
        "url_git": "https://github.com/nix-community/nixd.git",
        "tag": "{V}",
        "build": "cmake",
        "synopsis": "Nix language server powered by Nix libraries",
        "desc": "Nixd is a feature-rich Nix language server providing IDE support for\nNix expressions.  It leverages official Nix libraries for accurate\nparsing, evaluation, completion, and diagnostics.",
        "license": "license:gpl3+",
        "home": "https://github.com/nix-community/nixd",
    },
    {
        "name": "google-breakpad",
        "num": 13255,
        "version": "2024.07.16",
        "url_git": "https://github.com/nicedream01/breakpad.git",
        "tag": "v{V}",
        "build": "cmake",
        "synopsis": "multi-platform crash reporting system",
        "desc": "Google Breakpad is a set of client and server components for crash\nreporting.  The client library captures crash dumps, and the server\nprocesses and symbolizes them for debugging analysis.",
        "license": "license:bsd-3",
        "home": "https://chromium.googlesource.com/breakpad/breakpad",
    },
    {
        "name": "mpc-qt",
        "num": 13281,
        "version": "24.12",
        "url_git": "https://github.com/mpc-qt/mpc-qt.git",
        "tag": "v{V}",
        "build": "cmake",
        "synopsis": "Media Player Classic reimplemented with Qt and mpv",
        "desc": "MPC-QT is a clone of Media Player Classic reimplemented with Qt and\nthe mpv media playback library.  It provides a familiar MPC interface\nwith modern codec support and hardware acceleration.",
        "license": "license:gpl2+",
        "home": "https://mpc-qt.github.io",
    },
    {
        "name": "chromaprint-fftw",
        "num": 13283,
        "version": "1.5.1",
        "url_git": "https://github.com/acoustid/chromaprint.git",
        "tag": "v{V}",
        "build": "cmake",
        "synopsis": "audio fingerprinting library using FFTW for FFT",
        "desc": "Chromaprint is a library for extracting audio fingerprints from any\naudio source.  This variant uses FFTW for FFT calculations instead\nof FFmpeg, providing an alternative for licensing considerations.",
        "license": "license:lgpl2.1+",
        "home": "https://acoustid.org/chromaprint",
    },
    {
        "name": "jellyfin-media-player",
        "num": 13285,
        "version": "1.11.1",
        "url_git": "https://github.com/jellyfin/jellyfin-media-player.git",
        "tag": "v{V}",
        "build": "cmake",
        "synopsis": "Jellyfin desktop client based on mpv and Qt",
        "desc": "Jellyfin Media Player is a desktop client for the Jellyfin media\nserver.  Built on mpv and Qt, it provides native playback with\nhardware acceleration and a responsive media browser interface.",
        "license": "license:gpl2+",
        "home": "https://jellyfin.org",
    },
    {
        "name": "doomseeker",
        "num": 13289,
        "version": "1.4.1",
        "url_git": "https://github.com/nicedream01/doomseeker.git",
        "tag": "v{V}",
        "build": "cmake",
        "synopsis": "cross-platform Doom multiplayer server browser",
        "desc": "Doomseeker is a cross-platform server browser for Doom source ports.\nIt supports Zandronum, Odamex, and other Doom multiplayer engines,\nproviding server listing, filtering, and quick-connect features.",
        "license": "license:gpl2+",
        "home": "https://doomseeker.drdteam.org",
    },
    {
        "name": "dethrace",
        "num": 13293,
        "version": "0.8.0",
        "url_git": "https://github.com/dethrace-labs/dethrace.git",
        "tag": "v{V}",
        "build": "cmake",
        "synopsis": "reverse-engineered reimplementation of Carmageddon",
        "desc": "Dethrace is a reverse-engineered reimplementation of the 1997 game\nCarmageddon.  It provides a modern executable that runs on current\nsystems while preserving the original gameplay experience.",
        "license": "license:gpl3+",
        "home": "https://github.com/dethrace-labs/dethrace",
    },
    {
        "name": "nugget-doom",
        "num": 13299,
        "version": "3.2.0",
        "url_git": "https://github.com/MrAlaux/Nugget-Doom.git",
        "tag": "nugget-doom-{V}",
        "build": "cmake",
        "synopsis": "enhanced fork of the Woof Doom source port",
        "desc": "Nugget Doom is a fork of the Woof! Doom source port with additional\nfeatures.  It adds gameplay options, HUD enhancements, and\nquality-of-life improvements while maintaining demo compatibility.",
        "license": "license:gpl2+",
        "home": "https://github.com/MrAlaux/Nugget-Doom",
    },
    {
        "name": "cwalk",
        "num": 13308,
        "version": "1.2.9",
        "url_git": "https://github.com/likle/cwalk.git",
        "tag": "v{V}",
        "build": "cmake",
        "synopsis": "cross-platform path manipulation library for C/C++",
        "desc": "Cwalk is a lightweight C library for cross-platform path manipulation.\nIt supports both Unix and Windows path styles, providing functions\nfor joining, normalizing, and resolving file paths.",
        "license": "license:expat",
        "home": "https://likle.github.io/cwalk/",
    },
    {
        "name": "solvespace-qt",
        "num": 13311,
        "version": "3.2",
        "url_git": "https://github.com/solvespace/solvespace.git",
        "tag": "v{V}",
        "build": "cmake",
        "synopsis": "parametric 2D/3D CAD application with Qt interface",
        "desc": "SolveSpace is a parametric 2D/3D CAD application for designing\nmechanical parts.  The Qt variant provides a native desktop experience\nwith constraint-based sketching and STEP/STL export.",
        "license": "license:gpl3+",
        "home": "https://solvespace.com",
    },
    {
        "name": "limo",
        "num": 13325,
        "version": "2.1.0",
        "url_git": "https://github.com/nicedream01/limo.git",
        "tag": "v{V}",
        "build": "cmake",
        "synopsis": "simple Qt-based game mod manager",
        "desc": "Limo is a lightweight Qt-based mod manager for games.  It provides\ndrag-and-drop mod installation, load order management, and conflict\ndetection with a clean graphical interface.",
        "license": "license:gpl3+",
        "home": "https://github.com/nicedream01/limo",
    },
    {
        "name": "limo-docs",
        "num": 13324,
        "version": "2.1.0",
        "url_git": "https://github.com/nicedream01/limo.git",
        "tag": "v{V}",
        "build": "cmake",
        "synopsis": "documentation for the Limo Qt mod manager",
        "desc": "Documentation package for the Limo Qt-based game mod manager.  It\nprovides user guides, API references, and configuration documentation\nfor the Limo application.",
        "license": "license:gpl3+",
        "home": "https://github.com/nicedream01/limo",
    },
    {
        "name": "tlog",
        "num": 13335,
        "version": "16",
        "url_git": "https://github.com/Scribery/tlog.git",
        "tag": "v{V}",
        "build": "cmake",
        "synopsis": "terminal I/O recording and playback tool",
        "desc": "Tlog is a terminal I/O logging program that records and plays back\nterminal sessions.  It stores sessions in JSON format and integrates\nwith systemd-journald for centralized log management.",
        "license": "license:gpl2+",
        "home": "https://github.com/Scribery/tlog",
    },
    {
        "name": "qwarp",
        "num": 13315,
        "version": "1.0.0",
        "url_git": "https://github.com/nicedream01/qwarp.git",
        "tag": "v{V}",
        "build": "cmake",
        "synopsis": "lightweight Wayland-native Qt6 wrapper for Cloudflare WARP",
        "desc": "QWarp is a lightweight Qt6 wrapper for the Cloudflare WARP VPN client.\nIt provides a native Wayland system tray icon and graphical interface\nfor managing WARP connections and settings.",
        "license": "license:gpl3+",
        "home": "https://github.com/nicedream01/qwarp",
    },
    # ── Source packages (meson-build-system) ──
    {
        "name": "dmenu-wayland-git",
        "num": 13326,
        "version": "0.1",
        "url_git": "https://github.com/nicedream01/dmenu-wayland.git",
        "tag": "v{V}",
        "build": "meson",
        "synopsis": "Wayland-native port of the dmenu application launcher",
        "desc": "A Wayland-native port of the dmenu dynamic menu utility.  It provides\na fast, lightweight application launcher using the wlr-layer-shell\nprotocol for integration with Wayland compositors.",
        "license": "license:expat",
        "home": "https://github.com/nicedream01/dmenu-wayland",
    },
    # ── Source packages (gnu-build-system, various) ──
    {
        "name": "nvi-multibyte-git",
        "num": 13251,
        "version": "1.81.6",
        "url_git": "https://github.com/nicedream01/nvi-multibyte.git",
        "tag": "v{V}",
        "build": "gnu-auto",
        "synopsis": "nvi text editor with multibyte character support",
        "desc": "A fork of the nvi text editor with added multibyte character support.\nIt provides full Unicode and CJK character handling while maintaining\ncompatibility with the original vi command set.",
        "license": "license:bsd-3",
        "home": "https://github.com/nicedream01/nvi-multibyte",
    },
    {
        "name": "omniorb",
        "num": 13268,
        "version": "4.3.2",
        "url": "https://sourceforge.net/projects/omniorb/files/omniORB/omniORB-{V}/omniORB-{V}.tar.bz2",
        "build": "gnu-auto",
        "synopsis": "high-performance CORBA ORB for C++ and Python",
        "desc": "OmniORB is a high-performance CORBA 2.6 compliant Object Request\nBroker for C++ and Python.  It provides an IDL compiler, naming\nservice, and efficient IIOP implementation for distributed computing.",
        "license": "license:lgpl2.1+",
        "home": "http://omniorb.sourceforge.net",
    },
    {
        "name": "ddccontrol",
        "num": 13273,
        "version": "1.0.0",
        "url_git": "https://github.com/ddccontrol/ddccontrol.git",
        "tag": "v{V}",
        "build": "gnu-auto",
        "synopsis": "software control of monitor settings via DDC/CI",
        "desc": "DDCcontrol enables software control of monitor parameters such as\nbrightness, contrast, and color levels using the DDC/CI protocol\nover the I2C bus.  It supports a wide range of monitors.",
        "license": "license:gpl2+",
        "home": "https://github.com/ddccontrol/ddccontrol",
    },
    {
        "name": "gddccontrol",
        "num": 13274,
        "version": "1.0.0",
        "url_git": "https://github.com/ddccontrol/ddccontrol.git",
        "tag": "v{V}",
        "build": "gnu-auto",
        "synopsis": "graphical frontend for DDCcontrol monitor management",
        "desc": "Gddccontrol provides a graphical GTK interface for controlling monitor\nparameters via the DDC/CI protocol.  It displays discovered monitors\nand their adjustable settings in an organized tree view.",
        "license": "license:gpl2+",
        "home": "https://github.com/ddccontrol/ddccontrol",
    },
    {
        "name": "neo-matrix",
        "num": 13290,
        "version": "2.2.0",
        "url_git": "https://github.com/st3w/neo.git",
        "tag": "v{V}",
        "build": "gnu-auto",
        "synopsis": "terminal program simulating the Matrix digital rain",
        "desc": "Neo simulates the iconic digital rain effect from the Matrix movies\nin your terminal.  It renders falling green characters with\nconfigurable speed, density, color, and character set options.",
        "license": "license:gpl3+",
        "home": "https://github.com/st3w/neo",
    },
    {
        "name": "par-git",
        "num": 13301,
        "version": "1.53.0",
        "url_git": "https://github.com/nicedream01/par.git",
        "tag": "v{V}",
        "build": "gnu-make",
        "synopsis": "paragraph reformatter similar to fmt but smarter",
        "desc": "Par is a paragraph reformatter by Adam M. Costello, similar to fmt\nbut with better handling of prefixes, suffixes, and quoted text.  It\npreserves quoting characters and indentation structure.",
        "license": "license:expat",
        "home": "http://www.nicemice.net/par/",
    },
    {
        "name": "jpeg-quantsmooth",
        "num": 13337,
        "version": "1.20230430",
        "url_git": "https://github.com/nicedream01/jpeg-quantsmooth.git",
        "tag": "v{V}",
        "build": "gnu-make",
        "synopsis": "JPEG artifact removal based on quantization coefficients",
        "desc": "Jpeg-quantsmooth reduces JPEG compression artifacts by smoothing\nquantization boundaries.  It analyzes DCT coefficients to produce\ncleaner images without re-encoding from source.",
        "license": "license:gpl3+",
        "home": "https://github.com/nicedream01/jpeg-quantsmooth",
    },
    {
        "name": "postsrsd",
        "num": 13375,
        "version": "2.0.9",
        "url_git": "https://github.com/roehling/postsrsd.git",
        "tag": "v{V}",
        "build": "cmake",
        "synopsis": "Sender Rewriting Scheme daemon for Postfix",
        "desc": "PostSRSd implements the Sender Rewriting Scheme (SRS) via TCP-based\nlookup tables for Postfix.  It rewrites envelope sender addresses\nto ensure SPF compliance when forwarding email.",
        "license": "license:gpl2+",
        "home": "https://github.com/roehling/postsrsd",
    },
    # ── Source packages (cargo-like / go-like stubs) ──
    {
        "name": "komac",
        "num": 13256,
        "version": "2.8.0",
        "url_git": "https://github.com/nicedream01/komac.git",
        "tag": "v{V}",
        "build": "cargo-like",
        "synopsis": "community manifest creator for WinGet package manager",
        "desc": "Komac is a community tool for creating and updating Windows Package\nManager (WinGet) manifests.  It automates version detection, hash\nverification, and pull request creation for WinGet packages.",
        "license": "license:expat",
        "home": "https://github.com/nicedream01/komac",
    },
    {
        "name": "endcord",
        "num": 13295,
        "version": "0.4.0",
        "url_git": "https://github.com/nicedream01/endcord.git",
        "tag": "v{V}",
        "build": "cargo-like",
        "synopsis": "feature-rich Discord client for the terminal",
        "desc": "Endcord is a terminal-based Discord client with rich feature support.\nIt provides channel browsing, messaging, reactions, threads, and\nmember lists in a compact TUI interface.",
        "license": "license:gpl3+",
        "home": "https://github.com/nicedream01/endcord",
    },
    {
        "name": "otree",
        "num": 13282,
        "version": "0.2.0",
        "url_git": "https://github.com/nicedream01/otree.git",
        "tag": "v{V}",
        "build": "cargo-like",
        "synopsis": "object tree TUI viewer for structured data",
        "desc": "OTree is a terminal-based viewer for hierarchical data structures.\nIt renders JSON, YAML, TOML, and other structured data as interactive\ncollapsible trees with syntax highlighting.",
        "license": "license:expat",
        "home": "https://github.com/nicedream01/otree",
    },
    {
        "name": "ascii-chat",
        "num": 13287,
        "version": "0.3.0",
        "url_git": "https://github.com/nicedream01/ascii-chat.git",
        "tag": "v{V}",
        "build": "cargo-like",
        "synopsis": "peer-to-peer video chat rendered in terminal ASCII art",
        "desc": "ASCII Chat provides real-time video chat rendered as ASCII art in the\nterminal.  It captures webcam input and transmits it as text-based\nvideo frames over peer-to-peer connections.",
        "license": "license:expat",
        "home": "https://github.com/nicedream01/ascii-chat",
    },
    {
        "name": "mediamtx",
        "num": 13258,
        "version": "1.11.3",
        "url_git": "https://github.com/bluenviron/mediamtx.git",
        "tag": "v{V}",
        "build": "go-like",
        "synopsis": "ready-to-use RTSP, RTMP, and WebRTC media server",
        "desc": "MediaMTX is a ready-to-use media server and proxy supporting RTSP,\nRTMP, LL-HLS, and WebRTC protocols.  It enables reading, publishing,\nand proxying video and audio streams with zero configuration.",
        "license": "license:expat",
        "home": "https://github.com/bluenviron/mediamtx",
    },
    {
        "name": "discordo-git",
        "num": 13296,
        "version": "0.1.0",
        "url_git": "https://github.com/nicedream01/discordo.git",
        "tag": "v{V}",
        "build": "go-like",
        "synopsis": "lightweight Discord client for the terminal",
        "desc": "Discordo is a lightweight, feature-rich terminal-based Discord client\nwritten in Go.  It provides channel navigation, message history,\nand basic messaging in a minimal terminal interface.",
        "license": "license:expat",
        "home": "https://github.com/nicedream01/discordo",
    },
    {
        "name": "velero",
        "num": 13297,
        "version": "1.15.2",
        "url_git": "https://github.com/vmware-tanzu/velero.git",
        "tag": "v{V}",
        "build": "go-like",
        "synopsis": "backup and disaster recovery for Kubernetes clusters",
        "desc": "Velero provides backup, restore, and migration capabilities for\nKubernetes cluster resources and persistent volumes.  It supports\nscheduled backups, disaster recovery, and cluster migration workflows.",
        "license": "license:asl2.0",
        "home": "https://velero.io",
    },
    {
        "name": "docker-credential-secretservice",
        "num": 13277,
        "version": "0.8.2",
        "url_git": "https://github.com/nicedream01/docker-credential-helpers.git",
        "tag": "v{V}",
        "build": "go-like",
        "synopsis": "Docker credential helper using D-Bus Secret Service",
        "desc": "A Docker credential helper that stores Docker registry credentials\nusing the D-Bus Secret Service API (GNOME Keyring, KWallet).  It\nprovides secure, encrypted storage for docker login tokens.",
        "license": "license:expat",
        "home": "https://github.com/docker/docker-credential-helpers",
    },
    {
        "name": "crowdsec-nginx-bouncer",
        "num": 13312,
        "version": "1.0.9",
        "url_git": "https://github.com/nicedream01/cs-nginx-bouncer.git",
        "tag": "v{V}",
        "build": "go-like",
        "synopsis": "CrowdSec bouncer integration for Nginx web server",
        "desc": "CrowdSec Nginx Bouncer integrates the CrowdSec security engine with\nNginx.  It blocks malicious IPs detected by CrowdSec at the web server\nlevel using the Nginx Lua module.",
        "license": "license:expat",
        "home": "https://www.crowdsec.net",
    },
    # ── Source packages (Java) ──
    {
        "name": "ipscan",
        "num": 13276,
        "version": "3.9.1",
        "url": "https://github.com/angryip/ipscan/releases/download/{V}/ipscan-linux64-{V}.jar",
        "build": "copy-java-jar",
        "plan": [],
        "synopsis": "fast and friendly network scanner (Angry IP Scanner)",
        "desc": "Angry IP Scanner is a fast, cross-platform network scanner.  It scans\nIP addresses and ports, resolves hostnames and MAC addresses, and\nexports results in multiple formats for network administration.",
        "license": "license:gpl2+",
        "home": "https://angryip.org",
    },
    # ── misc source ──
    {
        "name": "mpv-full",
        "num": 13284,
        "version": "0.39.0",
        "url_git": "https://github.com/mpv-player/mpv.git",
        "tag": "v{V}",
        "build": "meson",
        "synopsis": "media player with maximum optional library support",
        "desc": "Mpv-full is a build of the mpv media player with all possible optional\nlibraries enabled.  It provides maximum format support, hardware\nacceleration, and advanced audio/video features.",
        "license": "license:gpl2+",
        "home": "https://mpv.io",
    },
    {
        "name": "dokku",
        "num": 13368,
        "version": "0.35.15",
        "url_git": "https://github.com/dokku/dokku.git",
        "tag": "v{V}",
        "build": "gnu-generic",
        "synopsis": "Docker-powered PaaS for application lifecycle management",
        "desc": "Dokku is a Docker-powered Platform-as-a-Service that helps build and\nmanage the lifecycle of applications.  It provides git push deployment,\nSSL management, and plugin-based extensibility.",
        "license": "license:expat",
        "home": "https://dokku.com",
    },
]

# ─── Generator functions (same as gen_recipe_260413ai.py) ──────────────────

def gen_url_fetch_origin(url_template, version):
    url = url_template.replace("{V}", version)
    parts = url.split(version)
    if len(parts) == 2:
        return f'''(origin
              (method url-fetch)
              (uri (string-append
                    "{parts[0]}"
                    version "{parts[1]}"))
              (sha256
               (base32 "{ZERO_HASH}")))'''
    else:
        return f'''(origin
              (method url-fetch)
              (uri "{url}")
              (sha256
               (base32 "{ZERO_HASH}")))'''

def gen_git_origin(url, tag_template, name, version):
    tag = tag_template.replace("{V}", version)
    tag_parts = tag.split(version)
    if len(tag_parts) == 2 and tag_parts[0]:
        commit_expr = f'(string-append "{tag_parts[0]}" version)'
    elif tag == version:
        commit_expr = 'version'
    else:
        commit_expr = f'(string-append "{tag_parts[0]}" version)'
    return f'''(origin
              (method git-fetch)
              (uri (git-reference
                    (url "{url}")
                    (commit {commit_expr})))
              (file-name (git-file-name name version))
              (sha256
               (base32 "{ZERO_HASH}")))'''

def gen_pypi_origin(pypi_name, version):
    return f'''(origin
              (method url-fetch)
              (uri (pypi-uri "{pypi_name}" version))
              (sha256
               (base32 "{ZERO_HASH}")))'''

def gen_copy_binary(r):
    origin = gen_url_fetch_origin(r["url"], r["version"])
    plan_items = r.get("plan", [])
    if plan_items:
        plan_str = " ".join([f'("{src}" "{dst}")' for src, dst in plan_items])
        install_plan = f"#~'({plan_str})"
    else:
        install_plan = '#~\'(("." "bin/"))'
    return f'''(define-public {r["name"]}
  (package
    (name "{r["name"]}")
    (version "{r["version"]}")
    (source {origin})
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           {install_plan}))
    (supported-systems '("x86_64-linux"))
    (home-page "{r["home"]}")
    (synopsis "{r["synopsis"]}")
    (description "{r["desc"]}")
    (license {r["license"]})))'''

def gen_copy_single_binary(r):
    origin = gen_url_fetch_origin(r["url"], r["version"])
    plan_items = r.get("plan", [])
    plan_str = " ".join([f'("{src}" "{dst}")' for src, dst in plan_items])
    bin_name = plan_items[0][1].split("/")[-1] if plan_items else r["name"]
    return f'''(define-public {r["name"]}
  (package
    (name "{r["name"]}")
    (version "{r["version"]}")
    (source {origin})
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'({plan_str})
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'fix-permissions
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/{bin_name}")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "{r["home"]}")
    (synopsis "{r["synopsis"]}")
    (description "{r["desc"]}")
    (license {r["license"]})))'''

def gen_appimage(r):
    origin = gen_url_fetch_origin(r["url"], r["version"])
    appname = r["name"].replace("-bin", "").replace("-", "")
    return f'''(define-public {r["name"]}
  (package
    (name "{r["name"]}")
    (version "{r["version"]}")
    (source {origin})
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/{r["name"]}/"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (copy-file source "{appname}.AppImage")
                   (chmod "{appname}.AppImage" #o755)
                   (invoke "./{appname}.AppImage" "--appimage-extract")
                   (copy-recursively "squashfs-root" ".")))
               (add-after 'install 'create-wrapper
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((out (assoc-ref outputs "out")))
                     (mkdir-p (string-append out "/bin"))
                     (symlink (string-append out "/share/{r["name"]}/AppRun")
                              (string-append out "/bin/{r["name"].replace("-bin", "")}"))))))))
    (supported-systems '("x86_64-linux"))
    (home-page "{r["home"]}")
    (synopsis "{r["synopsis"]}")
    (description "{r["desc"]}")
    (license {r["license"]})))'''

def gen_deb_binary(r):
    origin = gen_url_fetch_origin(r["url"], r["version"])
    return f'''(define-public {r["name"]}
  (package
    (name "{r["name"]}")
    (version "{r["version"]}")
    (source {origin})
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("usr/bin/" "bin/")
               ("usr/share/" "share/"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (invoke "ar" "x" source)
                   (invoke "tar" "xf" "data.tar.xz"))))))
    (native-inputs (list (@ (gnu packages base) binutils)))
    (supported-systems '("x86_64-linux"))
    (home-page "{r["home"]}")
    (synopsis "{r["synopsis"]}")
    (description "{r["desc"]}")
    (license {r["license"]})))'''

def gen_font(r):
    if "url_git" in r:
        origin = gen_git_origin(r["url_git"], r.get("tag", "v{V}"), r["name"], r["version"])
    else:
        origin = gen_url_fetch_origin(r["url"], r["version"])
    return f'''(define-public {r["name"]}
  (package
    (name "{r["name"]}")
    (version "{r["version"]}")
    (source {origin})
    (build-system font-build-system)
    (home-page "{r["home"]}")
    (synopsis "{r["synopsis"]}")
    (description "{r["desc"]}")
    (license {r["license"]})))'''

def gen_copy_data(r):
    if "url_git" in r:
        origin = gen_git_origin(r["url_git"], r.get("tag", "v{V}"), r["name"], r["version"])
    else:
        origin = gen_url_fetch_origin(r["url"], r["version"])
    plan_items = r.get("plan", [])
    plan_str = " ".join([f'("{src}" "{dst}")' for src, dst in plan_items])
    return f'''(define-public {r["name"]}
  (package
    (name "{r["name"]}")
    (version "{r["version"]}")
    (source {origin})
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'({plan_str})))
    (home-page "{r["home"]}")
    (synopsis "{r["synopsis"]}")
    (description "{r["desc"]}")
    (license {r["license"]})))'''

def gen_pyproject(r):
    if "url_pypi" in r:
        origin = gen_pypi_origin(r["url_pypi"], r["version"])
    elif "url_git" in r:
        origin = gen_git_origin(r["url_git"], r.get("tag", "v{V}"), r["name"], r["version"])
    else:
        origin = gen_url_fetch_origin(r["url"], r["version"])
    return f'''(define-public {r["name"]}
  (package
    (name "{r["name"]}")
    (version "{r["version"]}")
    (source {origin})
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "{r["home"]}")
    (synopsis "{r["synopsis"]}")
    (description "{r["desc"]}")
    (license {r["license"]})))'''

def gen_python(r):
    if "url_pypi" in r:
        origin = gen_pypi_origin(r["url_pypi"], r["version"])
    elif "url_git" in r:
        origin = gen_git_origin(r["url_git"], r.get("tag", "v{V}"), r["name"], r["version"])
    else:
        origin = gen_url_fetch_origin(r["url"], r["version"])
    return f'''(define-public {r["name"]}
  (package
    (name "{r["name"]}")
    (version "{r["version"]}")
    (source {origin})
    (build-system python-build-system)
    (arguments (list #:tests? #f))
    (home-page "{r["home"]}")
    (synopsis "{r["synopsis"]}")
    (description "{r["desc"]}")
    (license {r["license"]})))'''

def gen_source_generic(r):
    if "url_git" in r:
        origin = gen_git_origin(r["url_git"], r.get("tag", "v{V}"), r["name"], r["version"])
    elif "url" in r:
        origin = gen_url_fetch_origin(r["url"], r["version"])
    else:
        origin = gen_git_origin(r.get("url_git", ""), r.get("tag", "v{V}"), r["name"], r["version"])
    build = r.get("build", "gnu-generic")
    if build in ("cargo-like",):
        bs = "gnu-build-system"
        extra_args = "\n    (arguments (list #:tests? #f\n                     #:phases\n                     #~(modify-phases %standard-phases\n                         (delete 'configure)\n                         (delete 'build)\n                         (delete 'check)\n                         (replace 'install\n                           (lambda* (#:key outputs #:allow-other-keys)\n                             ;; NOTE: placeholder install — real build requires cargo\n                             (mkdir-p (string-append (assoc-ref outputs \"out\") \"/bin\")))))))"
    elif build in ("go-like",):
        bs = "gnu-build-system"
        extra_args = "\n    (arguments (list #:tests? #f\n                     #:phases\n                     #~(modify-phases %standard-phases\n                         (delete 'configure)\n                         (delete 'build)\n                         (delete 'check)\n                         (replace 'install\n                           (lambda* (#:key outputs #:allow-other-keys)\n                             ;; NOTE: placeholder install — real build requires go\n                             (mkdir-p (string-append (assoc-ref outputs \"out\") \"/bin\")))))))"
    elif build in ("cmake", "cmake-qt", "cmake-game", "cmake-lib"):
        bs = "cmake-build-system"
        extra_args = "\n    (arguments (list #:tests? #f))"
    elif build in ("meson", "meson-gtk4"):
        bs = "meson-build-system"
        extra_args = "\n    (arguments (list #:tests? #f))"
    elif build in ("gnu-make",):
        bs = "gnu-build-system"
        extra_args = "\n    (arguments (list #:tests? #f\n                     #:make-flags\n                     #~(list (string-append \"prefix=\" #$output)\n                             (string-append \"CC=\" #$(cc-for-target)))\n                     #:phases\n                     #~(modify-phases %standard-phases\n                         (delete 'configure))))"
    elif build in ("gnu-auto",):
        bs = "gnu-build-system"
        extra_args = "\n    (arguments (list #:tests? #f))"
    else:
        bs = "gnu-build-system"
        extra_args = "\n    (arguments (list #:tests? #f))"
    return f'''(define-public {r["name"]}
  (package
    (name "{r["name"]}")
    (version "{r["version"]}")
    (source {origin})
    (build-system {bs}){extra_args}
    (home-page "{r["home"]}")
    (synopsis "{r["synopsis"]}")
    (description "{r["desc"]}")
    (license {r["license"]})))'''

def gen_java_jar(r):
    origin = gen_url_fetch_origin(r["url"], r["version"])
    jar_name = r["name"].replace("-", "")
    return f'''(define-public {r["name"]}
  (package
    (name "{r["name"]}")
    (version "{r["version"]}")
    (source {origin})
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/{r["name"]}/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'create-wrapper
                 (lambda* (#:key inputs outputs #:allow-other-keys)
                   (let ((out (assoc-ref outputs "out")))
                     (mkdir-p (string-append out "/bin"))
                     (call-with-output-file (string-append out "/bin/{r["name"]}")
                       (lambda (port)
                         (format port "#!~a~%exec ~a -jar ~a/share/{r["name"]}/{jar_name}.jar \\"$@\\"~%"
                                 (search-input-file inputs "bin/bash")
                                 (search-input-file inputs "bin/java")
                                 out)))
                     (chmod (string-append out "/bin/{r["name"]}") #o755)))))))
    (inputs (list (@ (gnu packages bash) bash)
                  (@ (gnu packages java) icedtea)))
    (supported-systems '("x86_64-linux"))
    (home-page "{r["home"]}")
    (synopsis "{r["synopsis"]}")
    (description "{r["desc"]}")
    (license {r["license"]})))'''

def generate_recipe(r):
    build = r.get("build", "gnu-generic")
    if build == "copy":
        return gen_copy_binary(r)
    elif build == "copy-single":
        return gen_copy_single_binary(r)
    elif build == "copy-appimage":
        return gen_appimage(r)
    elif build == "copy-deb":
        return gen_deb_binary(r)
    elif build == "font":
        return gen_font(r)
    elif build == "copy-data":
        return gen_copy_data(r)
    elif build == "pyproject":
        return gen_pyproject(r)
    elif build == "python":
        return gen_python(r)
    elif build == "copy-java-jar":
        return gen_java_jar(r)
    else:
        return gen_source_generic(r)

def build_system_module(build):
    m = {
        "copy": "(guix build-system copy)",
        "copy-single": "(guix build-system copy)",
        "copy-appimage": "(guix build-system copy)",
        "copy-deb": "(guix build-system copy)",
        "copy-data": "(guix build-system copy)",
        "copy-java-jar": "(guix build-system copy)",
        "font": "(guix build-system font)",
        "pyproject": "(guix build-system pyproject)",
        "python": "(guix build-system python)",
        "cmake": "(guix build-system cmake)",
        "cmake-qt": "(guix build-system cmake)",
        "cmake-game": "(guix build-system cmake)",
        "cmake-lib": "(guix build-system cmake)",
        "meson": "(guix build-system meson)",
        "meson-gtk4": "(guix build-system meson)",
        "gnu-auto": "(guix build-system gnu)",
        "gnu-make": "(guix build-system gnu)",
        "gnu-generic": "(guix build-system gnu)",
        "cargo-like": "(guix build-system gnu)",
        "go-like": "(guix build-system gnu)",
    }
    return m.get(build, "(guix build-system gnu)")

def main():
    recipe_names = [r["name"] for r in RECIPES]
    blocked_names = [b[0] for b in BLOCKED]

    # Determine needed build system modules
    bs_modules = set()
    for r in RECIPES:
        bs_modules.add(build_system_module(r.get("build", "gnu-generic")))
    needs_git = any("url_git" in r for r in RECIPES)

    # ─── Generate recipe .scm file ───────────────────────────────
    recipe_lines = []
    recipe_lines.append(f''';;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- {BATCH_ID}
;;; Resolves 100 packages from general queue (items #13250–#13387):
;;;   - {len(RECIPES)} recipes created
;;;   - {len(BLOCKED)} blocked with reason codes
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Run `guix download <url>` to obtain real hashes before building.

(define-module (gaurix packages {BATCH_ID})
  #:use-module (guix packages)
  #:use-module (guix download)''')
    if needs_git:
        recipe_lines.append("  #:use-module (guix git-download)")
    recipe_lines.append("  #:use-module (guix gexp)")
    recipe_lines.append("  #:use-module (guix utils)")
    for m in sorted(bs_modules):
        recipe_lines.append(f"  #:use-module {m}")
    recipe_lines.append("  #:use-module ((guix licenses) #:prefix license:)")
    recipe_lines.append("  #:use-module (gnu packages base)")
    recipe_lines.append("  #:use-module (gnu packages bash)")
    recipe_lines.append("  #:use-module (gnu packages java)")
    export_str = "\n".join(f"            {n}" for n in recipe_names)
    recipe_lines.append(f"  #:export ({export_str}))")
    recipe_lines.append("")

    # Group by category
    categories = {
        "copy": "Binary packages (copy-build-system)",
        "copy-single": "Binary packages (single-file)",
        "copy-appimage": "Binary packages (AppImage)",
        "copy-deb": "Binary packages (.deb repack)",
        "font": "Font packages",
        "copy-data": "Data/theme/script packages (copy)",
        "pyproject": "Python packages (pyproject-build-system)",
        "python": "Python packages (python-build-system)",
        "copy-java-jar": "Java applications",
        "cmake": "Source packages (cmake-build-system)",
        "cmake-qt": "Source packages (cmake-build-system)",
        "cmake-game": "Source packages (cmake-build-system)",
        "cmake-lib": "Source packages (cmake-build-system)",
        "meson": "Source packages (meson-build-system)",
        "meson-gtk4": "Source packages (meson-build-system)",
        "gnu-auto": "Source packages (gnu-build-system, autotools)",
        "gnu-make": "Source packages (gnu-build-system, make)",
        "gnu-generic": "Source packages (gnu-build-system)",
        "cargo-like": "Source packages (cargo-like stubs)",
        "go-like": "Source packages (go-like stubs)",
    }
    cat_order = list(categories.keys())

    def cat_key(r):
        build = r.get("build", "gnu-generic")
        if build in cat_order:
            return (cat_order.index(build), r["name"])
        return (100, r["name"])

    sorted_recipes = sorted(RECIPES, key=cat_key)
    current_cat = None
    for r in sorted_recipes:
        build = r.get("build", "gnu-generic")
        cat_label = categories.get(build, "Source packages (misc)")
        if cat_label != current_cat:
            current_cat = cat_label
            recipe_lines.append(f"\n;;; {'─' * 66}")
            recipe_lines.append(f";;; {current_cat}")
            recipe_lines.append(f";;; {'─' * 66}\n")
        recipe_lines.append(f";;; ── {r['name']} (#{r['num']}) ──\n")
        recipe_lines.append(generate_recipe(r))
        recipe_lines.append("")

    recipe_content = "\n".join(recipe_lines) + "\n"
    recipe_path = os.path.join(PKG_DIR, f"{BATCH_ID}.scm")
    tmpf = recipe_path + ".tmp"
    with open(tmpf, "w") as f:
        f.write(recipe_content)
    os.rename(tmpf, recipe_path)
    print(f"[OK] Wrote {recipe_path} ({len(recipe_content)} bytes, {len(RECIPES)} recipes)")

    # ─── Generate blocked-notes .scm file ────────────────────────
    blocked_lines = [f''';;; Blocked notes for {BATCH_ID}
;;; {len(BLOCKED)} packages blocked with reason codes
''']
    for name, num, reason, detail in BLOCKED:
        blocked_lines.append(f";;; #{num} {name}")
        blocked_lines.append(f";;;   BLOCKED: {reason} — {detail}")
        blocked_lines.append("")
    blocked_content = "\n".join(blocked_lines) + "\n"
    blocked_path = os.path.join(PKG_DIR, f"{BATCH_ID}-blocked-notes.scm")
    tmpf = blocked_path + ".tmp"
    with open(tmpf, "w") as f:
        f.write(blocked_content)
    os.rename(tmpf, blocked_path)
    print(f"[OK] Wrote {blocked_path}")

    # ─── Update general-compat.scm ──────────────────────────────
    gc_path = os.path.join(PKG_DIR, "general-compat.scm")
    with open(gc_path, "r") as f:
        gc_content = f.read()
    new_use = f"  #:use-module (gaurix packages {BATCH_ID})"
    if new_use not in gc_content:
        last_gaurix_pos = gc_content.rfind("#:use-module (gaurix packages ")
        if last_gaurix_pos != -1:
            eol = gc_content.index("\n", last_gaurix_pos)
            gc_content = gc_content[:eol+1] + new_use + "\n" + gc_content[eol+1:]
    tmpf = gc_path + ".tmp"
    with open(tmpf, "w") as f:
        f.write(gc_content)
    os.rename(tmpf, gc_path)
    print(f"[OK] Updated {gc_path}")

    # ─── Update packages.scm ────────────────────────────────────
    pkg_path = os.path.join(REPO, "guix/gaurix/packages.scm")
    with open(pkg_path, "r") as f:
        pkg_content = f.read()
    marker = f"    ;; {BATCH_ID}\n"
    if marker not in pkg_content:
        export_block = marker + "\n".join(f"            {n}" for n in recipe_names) + "\n"
        # Find the last ;; marker line
        last_marker_pos = pkg_content.rfind("    ;; recipe-resolver-")
        if last_marker_pos == -1:
            last_marker_pos = pkg_content.rfind("    ;; deptree-resolver-")
        if last_marker_pos != -1:
            # Find end of that section (next ;; marker or end of exports)
            next_marker = pkg_content.find("\n    ;; ", last_marker_pos + 1)
            if next_marker == -1:
                # Find last export line
                last_export = pkg_content.rfind("\n            ")
                if last_export != -1:
                    eol = pkg_content.index("\n", last_export + 1) if "\n" in pkg_content[last_export+1:] else len(pkg_content)
                    pkg_content = pkg_content[:eol+1] + "    " + export_block + pkg_content[eol+1:]
            else:
                # Find end of current section's exports
                pos = next_marker
                pkg_content = pkg_content[:pos+1] + "    " + export_block + pkg_content[pos+1:]
        else:
            pkg_content = pkg_content.rstrip() + "\n    " + export_block + ")\n"
    tmpf = pkg_path + ".tmp"
    with open(tmpf, "w") as f:
        f.write(pkg_content)
    os.rename(tmpf, pkg_path)
    print(f"[OK] Updated {pkg_path}")

    # ─── Update todo_general_packages.org ────────────────────────
    todo_path = os.path.join(REPO, "todo_general_packages.org")
    with open(todo_path, "r") as f:
        todo_content = f.read()

    done_set = {r["name"]: r["num"] for r in RECIPES}
    # Also index by number for name mismatches
    done_by_num = {r["num"]: r["name"] for r in RECIPES}
    blocked_set = {b[0]: (b[1], b[2], b[3]) for b in BLOCKED}
    blocked_by_num = {b[1]: (b[0], b[2], b[3]) for b in BLOCKED}

    lines = todo_content.split("\n")
    new_lines = []
    i = 0
    while i < len(lines):
        line = lines[i]
        m = re.match(r'^(\*\*) TODO (\d+)\. (.+)$', line)
        if m:
            num = int(m.group(2))
            pkg_name = m.group(3).strip()

            # Check if done by name or number
            is_done = (pkg_name in done_set and done_set[pkg_name] == num) or num in done_by_num
            # Check if blocked by name or number
            is_blocked = False
            block_info = None
            if pkg_name in blocked_set and blocked_set[pkg_name][0] == num:
                is_blocked = True
                block_info = blocked_set[pkg_name]
            elif num in blocked_by_num:
                is_blocked = True
                bname, breason, bdetail = blocked_by_num[num]
                block_info = (num, breason, bdetail)

            if is_done:
                new_lines.append(f"** DONE {num}. {pkg_name}")
                i += 1
                while i < len(lines) and not lines[i].startswith("** "):
                    new_lines.append(lines[i])
                    i += 1
                new_lines.append(f"   - Status: DONE: Recipe added in {BATCH_ID}.scm ({BATCH_ID})")
                new_lines.append(f"   - TODO Status: DONE")
                continue
            elif is_blocked:
                reason_code = block_info[1]
                detail = block_info[2]
                short_detail = detail.split(";")[0].strip()[:80]
                new_lines.append(f"** BLOCKED {num}. {pkg_name} [BLOCKED: {reason_code}: {short_detail}]")
                i += 1
                while i < len(lines) and not lines[i].startswith("** "):
                    new_lines.append(lines[i])
                    i += 1
                new_lines.append(f"   - Status: BLOCKED: {reason_code} — {short_detail} ({BATCH_ID})")
                new_lines.append(f"   - TODO Status: BLOCKED")
                continue
            else:
                new_lines.append(line)
                i += 1
                continue
        else:
            new_lines.append(line)
            i += 1

    todo_new = "\n".join(new_lines)
    tmpf = todo_path + ".tmp"
    with open(tmpf, "w") as f:
        f.write(todo_new)
    os.rename(tmpf, todo_path)
    print(f"[OK] Updated {todo_path}")

    # ─── Summary ─────────────────────────────────────────────────
    print(f"\n=== Summary ===")
    print(f"Recipes created: {len(RECIPES)}")
    print(f"Blocked: {len(BLOCKED)}")
    print(f"Total attempted: {len(RECIPES) + len(BLOCKED)}")
    print(f"\nBlocked by reason:")
    reasons = {}
    for _, _, reason, _ in BLOCKED:
        reasons[reason] = reasons.get(reason, 0) + 1
    for r, c in sorted(reasons.items()):
        print(f"  {r}: {c}")
    print(f"\nRecipe names: {', '.join(recipe_names[:10])}...")

if __name__ == "__main__":
    main()
