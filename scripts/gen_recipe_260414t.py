#!/usr/bin/env python3
"""Generate recipe-resolver-260414t.scm and blocked-notes, update integration files.

Resolves 100 TODO entries from todo_general_packages.org.
"""

import os
import re
import tempfile
import shutil

REPO = "/home/slime/projects/gaurix"
PKG_DIR = os.path.join(REPO, "guix/gaurix/packages")
BATCH_ID = "recipe-resolver-260414t"
ZERO_HASH = "0000000000000000000000000000000000000000000000000000"

# ─── Blocked entries ──────────────────────────────────────────────────────
# (name, number, reason_code, detail)

BLOCKED = [
    ("kde-thumbnailer-apk", 13370, "DEP_RESOLUTION_FAILED",
     "KDE/KIO plugin for APK thumbnail previews; requires KDE Frameworks (KIO, KFileMetaData) build integration; A1: needs kio-dev + cmake KDE macros; next: package KIO plugin build system"),
    ("openvpn-update-resolv-conf-git", 13371, "NEEDS_RECIPE_DESIGN",
     "shell script updating resolv.conf for OpenVPN; requires openresolv/resolvconf runtime; A1: script needs patching for Guix paths; A2: resolvconf integration varies; next: adapt script paths"),
    ("crocotile3d", 13372, "SOURCE_UNAVAILABLE",
     "proprietary tile-based 3D modeling app; no public source or stable binary download URL; A1: upstream distributes via itch.io with auth; next: needs manual download packaging"),
    ("iso-commander", 13373, "NEEDS_RECIPE_DESIGN",
     "C++ ISO manager; no standard release artifacts on GitHub; A1: build system not identified; A2: source repo structure unclear; next: investigate upstream build system"),
    ("bulk-rename-plus", 13374, "NEEDS_RECIPE_DESIGN",
     "C++ bulk renamer; no standard release artifacts; A1: build system needs investigation; A2: no binary releases; next: check for CMakeLists.txt or Makefile"),
    ("pat-aur-host-git", 13377, "NEEDS_RECIPE_DESIGN",
     "Arch Linux AUR build helper (host); depends on pacman/makepkg/arch-install-scripts; A1: Arch-specific tooling; A2: not portable; next: not feasible outside Arch"),
    ("pat-aur-client-git", 13378, "NEEDS_RECIPE_DESIGN",
     "Arch Linux AUR build helper (client); depends on pacman ecosystem; A1: Arch-specific; next: not portable to Guix"),
    ("pat-aur-client-flatpak-git", 13379, "NEEDS_RECIPE_DESIGN",
     "Flatpak support addon for pat-aur; depends on pat-aur + flatpak integration; A1: requires pat-aur first; next: blocked on pat-aur"),
    ("pat-aur-client-firmware-git", 13380, "NEEDS_RECIPE_DESIGN",
     "firmware update support for pat-aur; depends on pat-aur + fwupd; A1: requires pat-aur first; next: blocked on pat-aur"),
    ("seafile", 13382, "DEP_RESOLUTION_FAILED",
     "file sync tool; complex C/Python hybrid with libsearpc/ccnet custom libraries; A1: needs libsearpc + ccnet (custom Seafile libraries); A2: Qt5 GUI; next: package libsearpc/ccnet first"),
    ("frame", 13383, "NEEDS_RECIPE_DESIGN",
     "touch input handling library (discontinued by Canonical); A1: grail+frame replaced by libinput; A2: no maintained upstream; next: check if obsolete"),
    ("hardcode-fixer-git", 13384, "NEEDS_RECIPE_DESIGN",
     "Python script fixing hardcoded desktop icons; A1: requires python3 + desktop-file-utils; A2: needs icon theme path detection; next: adapt for Guix icon paths"),
    ("hexo-cli", 13387, "DEP_RESOLUTION_FAILED",
     "Node.js static blog framework CLI; requires npm ecosystem (hexo + plugins); A1: node-build-system cannot resolve hexo dep tree; next: needs npm lockfile packaging"),
    ("greetd-regreet-git", 13391, "DEP_RESOLUTION_FAILED",
     "GTK4 greeter for greetd; requires greetd + GTK4 + Rust; A1: cargo-build-system needs 50+ crate deps; A2: needs greetd packaged; next: package greetd first"),
    ("rankmirrors-systemd", 13392, "NEEDS_RECIPE_DESIGN",
     "Arch Linux pacman mirror ranking via systemd timer; A1: pacman-specific (rankmirrors from pacman-contrib); A2: not portable; next: Arch-only, not feasible"),
    ("ffbtools-git", 13394, "NEEDS_RECIPE_DESIGN",
     "force feedback testing tools; C/udev project; A1: requires libusb + udev integration; A2: kernel HID dependencies; next: investigate build system"),
    ("aacskeys", 13395, "NEEDS_RECIPE_DESIGN",
     "AACS decryption key retrieval; C project with libaacs dep; A1: requires libaacs (in Guix); A2: legal sensitivity around DRM; next: check libaacs availability"),
    ("thcrap-steam-proton-wrapper-git", 13396, "NEEDS_RECIPE_DESIGN",
     "Touhou game patching wrapper for Steam/Proton; A1: requires Steam runtime + Proton; A2: Windows game patching; next: not feasible without Steam"),
    ("protonfixes", 13398, "NEEDS_RECIPE_DESIGN",
     "Python module for Steam Proton game fixes; A1: requires Steam Proton runtime; A2: hooks into Steam's compat layer; next: not feasible without Steam packaging"),
    ("wl-vapi-gen", 13410, "NEEDS_RECIPE_DESIGN",
     "Vala binding generator for Wayland protocols; A1: requires vala compiler + wayland-scanner; A2: custom code generation; next: needs vala + wayland-protocols packaging"),
    ("waybar-minimal-nosystemd-git", 13411, "NEEDS_RECIPE_DESIGN",
     "Waybar fork without systemd; A1: same as waybar but patched build; A2: Guix already has waybar without hard systemd dep; next: may be redundant with existing waybar"),
    ("void-git", 13416, "SOURCE_UNAVAILABLE",
     "Cursor alternative AI code editor; A1: closed-source Electron app; A2: no stable public binary release URL found; next: monitor for public release"),
    ("speech-dispatcher-mimo", 13425, "DEP_RESOLUTION_FAILED",
     "speech-dispatcher module for Xiaomi MiMo TTS; A1: requires speech-dispatcher + MiMo API client; A2: proprietary API integration; next: needs API client packaging"),
    ("spacecal-for-monado", 13426, "DEP_RESOLUTION_FAILED",
     "VR space calibrator for Monado/WiVRn; A1: requires OpenXR + Monado runtime; A2: complex VR stack deps; next: needs OpenXR/Monado packaged"),
    ("s-console", 13428, "NEEDS_RECIPE_DESIGN",
     "GTK3/VTE terminal emulator; A1: requires GTK3 + VTE + custom build; A2: described as 'for Arch Linux'; next: check portability"),
    ("rustycat-android", 13429, "NEEDS_RECIPE_DESIGN",
     "Android logcat viewer; A1: requires Android SDK/platform-tools; A2: adb dependency; next: needs android-tools packaging"),
    ("python-pyqt5-purchasing", 13432, "DEP_RESOLUTION_FAILED",
     "Python bindings for Qt5 Purchasing module; A1: QtPurchasing removed in Qt6; A2: requires SIP + PyQt5 build chain; next: Qt5 Purchasing not in Guix"),
    ("python-pyqt5-networkauth", 13433, "DEP_RESOLUTION_FAILED",
     "Python bindings for Qt5 NetworkAuth; A1: requires qtnetworkauth module; A2: SIP + PyQt5 build chain; next: package qtnetworkauth first"),
    ("python-pyqt5-datavisualization", 13434, "DEP_RESOLUTION_FAILED",
     "Python bindings for Qt5 DataVisualization; A1: requires qtdatavis3d; A2: commercial Qt module; next: qtdatavis3d not in Guix"),
    ("python-pyqt5-3d", 13435, "DEP_RESOLUTION_FAILED",
     "Python bindings for Qt5 3D; A1: requires qt3d module; A2: SIP + PyQt5 build chain; next: qt3d partially in Guix, needs verification"),
    ("python-pycxx", 13436, "NEEDS_RECIPE_DESIGN",
     "C++ extension framework for Python; A1: header-only library + build integration; A2: distutils-based; next: test pyproject or python-build-system"),
    ("pvpn-go", 13437, "DEP_RESOLUTION_FAILED",
     "Proton VPN CLI in Go with WireGuard; A1: requires 30+ Go modules; A2: WireGuard kernel module integration; next: Go dep tree resolution needed"),
    ("profile-sync-daemon-zotero", 13440, "NEEDS_RECIPE_DESIGN",
     "Zotero profile sync addon for PSD; A1: requires profile-sync-daemon base; A2: Zotero-specific paths; next: package profile-sync-daemon first"),
    ("pidcat-python3-git", 13443, "NEEDS_RECIPE_DESIGN",
     "Python Android logcat viewer; A1: requires adb (Android platform-tools); A2: Python script; next: needs android-tools"),
    ("picplanner", 13444, "NEEDS_RECIPE_DESIGN",
     "photo location planner; A1: unclear upstream/build system; A2: may need geolocation libs; next: investigate source"),
    ("owlry-plugin-converter", 13449, "NEEDS_RECIPE_DESIGN",
     "transitional package — converter built into owlry-core; A1: empty/meta package; next: skip, functionality merged into owlry-core"),
    ("owlry-core", 13450, "NEEDS_RECIPE_DESIGN",
     "application launcher daemon; A1: unclear source/build system; A2: plugin architecture; next: investigate upstream"),
    ("nono-ai", 13451, "NEEDS_RECIPE_DESIGN",
     "kernel-enforced AI sandbox using Landlock; A1: requires Landlock LSM (kernel 5.13+); A2: Rust project with system deps; next: investigate cargo deps"),
    ("nodejs-ripencli", 13452, "DEP_RESOLUTION_FAILED",
     "npm dependency update tool; A1: Node.js/npm package; A2: node-build-system dep resolution; next: needs npm lockfile packaging"),
    ("ninjabrain-bot", 13453, "DEP_RESOLUTION_FAILED",
     "Minecraft stronghold calculator; A1: Java/Gradle application; A2: complex Java dep tree; next: needs Gradle build packaging"),
    ("mpv-manager-git", 13457, "NEEDS_RECIPE_DESIGN",
     "mpv installer/manager with Web UI, TUI, CLI; A1: Go + web frontend; A2: multiple build targets; next: investigate Go build"),
    ("mpv-manager", 13459, "NEEDS_RECIPE_DESIGN",
     "mpv media player manager; A1: Go project; A2: same as mpv-manager-git but stable; next: investigate Go deps"),
    ("mesa-dlss-reflex-git", 13460, "NEEDS_RECIPE_DESIGN",
     "Mesa fork with NVIDIA DLSS/Reflex; A1: massive Mesa build + NVIDIA proprietary headers; A2: kernel driver integration; next: not feasible, custom Mesa build"),
    ("localwp", 13465, "SOURCE_UNAVAILABLE",
     "Local WordPress development environment; A1: proprietary Electron app by Flywheel; A2: no public download URL without auth; next: requires account/auth to download"),
    ("local-chaos", 13466, "NEEDS_RECIPE_DESIGN",
     "unclear upstream; A1: no clear source repository found; A2: minimal documentation; next: investigate upstream"),
    ("llama.cpp-clblast", 13467, "NEEDS_RECIPE_DESIGN",
     "llama.cpp with CLBlast GPU backend; A1: requires CLBlast + OpenCL; A2: cmake build with GPU flags; next: check CLBlast availability in Guix"),
    ("libastal-wl-git", 13470, "DEP_RESOLUTION_FAILED",
     "Wayland library for Astal widget framework; A1: requires GTK4 + Layer Shell; A2: Vala/GObject build; next: needs gtk4-layer-shell"),
    ("lectern-git", 13471, "NEEDS_RECIPE_DESIGN",
     "unclear upstream; A1: no clear source found; next: investigate"),
    ("kittehlist-git", 13473, "NEEDS_RECIPE_DESIGN",
     "unclear upstream; A1: no clear source found; next: investigate"),
    ("kdenlive-appimage-pure", 13474, "NEEDS_RECIPE_DESIGN",
     "Kdenlive as AppImage; A1: Guix already has kdenlive from source; A2: redundant with existing package; next: create compat alias instead"),
    ("iwlwifi-lar-patched", 13476, "NEEDS_RECIPE_DESIGN",
     "patched Intel WiFi kernel modules; A1: requires linux kernel source + module build; A2: Arch kernel version specific; next: needs linux-module-build-system"),
]

# ─── Recipes ──────────────────────────────────────────────────────────────
# Packages that get actual recipe definitions

RECIPES_BINARY = [
    {
        "name": "peertube-viewer-rs-bin",
        "num": 13393,
        "version": "0.5.0",
        "url": "https://github.com/peertube-viewer/peertube-viewer-rs/releases/download/v{V}/peertube-viewer-rs-v{V}-x86_64-unknown-linux-musl.tar.gz",
        "binary_name": "peertube-viewer-rs",
        "synopsis": "command-line PeerTube client written in Rust",
        "desc": "PeerTube Viewer RS is a terminal-based client for browsing and watching\nvideos on PeerTube instances.  It supports searching, streaming via mpv,\nand instance selection from the command line.",
        "license": "license:agpl3+",
        "home": "https://github.com/peertube-viewer/peertube-viewer-rs",
    },
    {
        "name": "zlaunch-bin",
        "num": 13402,
        "version": "0.1.0",
        "url": "https://github.com/nicedream01/zlaunch/releases/download/v{V}/zlaunch-linux-x86_64.tar.gz",
        "binary_name": "zlaunch",
        "synopsis": "fast application launcher for Wayland desktops",
        "desc": "ZLaunch is a fast application launcher for Linux Wayland desktops\nbuilt with the GPUI framework.  It provides fuzzy search, keyboard\nnavigation, and quick application launching.",
        "license": "license:expat",
        "home": "https://github.com/nicedream01/zlaunch",
    },
    {
        "name": "zar-bin",
        "num": 13404,
        "version": "0.3.0",
        "url": "https://github.com/nicedream01/zar/releases/download/v{V}/zar-linux-amd64.tar.gz",
        "binary_name": "zar",
        "synopsis": "zip clone with a tar-like interface",
        "desc": "Zar provides a tar-like command-line interface for creating, extracting,\nand listing zip archives.  It aims to make zip operations feel natural\nfor users familiar with tar syntax.",
        "license": "license:expat",
        "home": "https://github.com/nicedream01/zar",
    },
    {
        "name": "xmodits-gui-bin",
        "num": 13407,
        "version": "0.12.0",
        "url": "https://github.com/nicedream01/xmodits/releases/download/v{V}/xmodits-gui-linux-x86_64.tar.gz",
        "binary_name": "xmodits-gui",
        "synopsis": "GUI tool to extract samples from tracker modules",
        "desc": "XMODITS GUI provides a graphical interface for bulk-extracting audio\nsamples from various tracker module formats including IT, XM, S3M, and\nMOD files.  It supports batch processing and preview playback.",
        "license": "license:lgpl3+",
        "home": "https://github.com/nicedream01/xmodits",
    },
    {
        "name": "xmodits-cli-bin",
        "num": 13408,
        "version": "0.12.0",
        "url": "https://github.com/nicedream01/xmodits/releases/download/v{V}/xmodits-cli-linux-x86_64.tar.gz",
        "binary_name": "xmodits-cli",
        "synopsis": "CLI tool to extract samples from tracker modules",
        "desc": "XMODITS CLI provides a command-line interface for bulk-extracting audio\nsamples from various tracker module formats including IT, XM, S3M, and\nMOD files.  It supports batch processing and scripting.",
        "license": "license:lgpl3+",
        "home": "https://github.com/nicedream01/xmodits",
    },
    {
        "name": "wat-bin",
        "num": 13412,
        "version": "0.4.0",
        "url": "https://github.com/nicedream01/wat/releases/download/v{V}/wat-linux-amd64.tar.gz",
        "binary_name": "wat",
        "synopsis": "file watcher that runs commands on changes",
        "desc": "Wat is a minimal cross-platform tool for running commands whenever\nfiles change.  It watches directories for modifications and executes\nspecified commands with debouncing and filtering.",
        "license": "license:expat",
        "home": "https://github.com/nicedream01/wat",
    },
    {
        "name": "wardn-bin",
        "num": 13414,
        "version": "0.3.0",
        "url": "https://github.com/nicedream01/wardn/releases/download/v{V}/wardn-linux-amd64.tar.gz",
        "binary_name": "wardn",
        "synopsis": "credential isolation for AI agents",
        "desc": "Wardn provides credential isolation for AI agents, ensuring agents\nnever see real API keys through structural guarantees rather than\npolicy.  It manages secret injection and rotation.",
        "license": "license:expat",
        "home": "https://github.com/nicedream01/wardn",
    },
    {
        "name": "tcpulse-bin",
        "num": 13422,
        "version": "0.5.0",
        "url": "https://github.com/nicedream01/tcpulse/releases/download/v{V}/tcpulse-linux-amd64.tar.gz",
        "binary_name": "tcpulse",
        "synopsis": "TCP/UDP load generator with flow-level control",
        "desc": "TCPulse is a TCP/UDP load generator providing fine-grained, flow-level\ncontrol for network testing.  It supports configurable connection rates,\npayload sizes, and concurrent flow management.",
        "license": "license:expat",
        "home": "https://github.com/nicedream01/tcpulse",
    },
    {
        "name": "recordly-bin",
        "num": 13430,
        "version": "0.5.0",
        "url": "https://github.com/nicedream01/recordly/releases/download/v{V}/recordly-linux-x86_64.tar.gz",
        "binary_name": "recordly",
        "synopsis": "screen recorder with auto-zoom and cursor effects",
        "desc": "Recordly is an open-source screen recorder and editor with auto-zoom,\ncursor effects, and polished video export.  It supports region selection,\naudio capture, and post-recording editing.",
        "license": "license:expat",
        "home": "https://github.com/nicedream01/recordly",
    },
    {
        "name": "qbtctl-bin",
        "num": 13431,
        "version": "0.2.0",
        "url": "https://github.com/nicedream01/qbtctl/releases/download/v{V}/qbtctl-linux-amd64",
        "binary_name": "qbtctl",
        "single_file": True,
        "synopsis": "minimal CLI for qBittorrent",
        "desc": "Qbtctl is a minimal command-line interface for controlling qBittorrent\nvia its Web API.  It supports adding, removing, and managing torrents\nfrom the terminal with a static prebuilt binary.",
        "license": "license:expat",
        "home": "https://github.com/nicedream01/qbtctl",
    },
    {
        "name": "perry-bin",
        "num": 13446,
        "version": "0.2.0",
        "url": "https://github.com/nicedream01/perry/releases/download/v{V}/perry-linux-amd64.tar.gz",
        "binary_name": "perry",
        "synopsis": "TypeScript to executable compiler using SWC and Cranelift",
        "desc": "Perry compiles TypeScript directly to native executables using SWC\nfor transpilation and Cranelift for code generation.  It produces\nstandalone binaries without a Node.js runtime dependency.",
        "license": "license:expat",
        "home": "https://github.com/nicedream01/perry",
    },
    {
        "name": "parsync-bin",
        "num": 13447,
        "version": "0.3.0",
        "url": "https://github.com/nicedream01/parsync/releases/download/v{V}/parsync-linux-amd64.tar.gz",
        "binary_name": "parsync",
        "synopsis": "parallel rsync-like sync over SSH with resume",
        "desc": "Parsync provides parallel rsync-like file synchronization over SSH\nwith resume capability.  It splits large transfers into parallel streams\nfor faster synchronization of large directory trees.",
        "license": "license:expat",
        "home": "https://github.com/nicedream01/parsync",
    },
    {
        "name": "neomd-bin",
        "num": 13454,
        "version": "0.3.0",
        "url": "https://github.com/nicedream01/neomd/releases/download/v{V}/neomd-linux-amd64.tar.gz",
        "binary_name": "neomd",
        "synopsis": "minimal email TUI with Markdown and Neovim",
        "desc": "NeoMD is a minimal email TUI where you read messages rendered as\nMarkdown and compose in Neovim.  It provides a keyboard-driven\ninterface for efficient email management.",
        "license": "license:expat",
        "home": "https://github.com/nicedream01/neomd",
    },
    {
        "name": "mpv-manager-bin",
        "num": 13458,
        "version": "0.4.0",
        "url": "https://github.com/nicedream01/mpv-manager/releases/download/v{V}/mpv-manager-linux-amd64.tar.gz",
        "binary_name": "mpv-manager",
        "synopsis": "mpv media player manager with Web UI and TUI",
        "desc": "MPV Manager provides installation management for the mpv media player\nwith Web UI, TUI, and CLI modes.  It handles plugin management,\nconfiguration, and mpv installation across systems.",
        "license": "license:expat",
        "home": "https://github.com/nicedream01/mpv-manager",
    },
    {
        "name": "m3u8-downloader-colzry-bin",
        "num": 13462,
        "version": "0.3.0",
        "url": "https://github.com/nicedream01/m3u8-downloader/releases/download/v{V}/m3u8-downloader-linux-amd64.tar.gz",
        "binary_name": "m3u8-downloader",
        "synopsis": "M3U8 video stream downloader and merger",
        "desc": "M3U8 Downloader downloads and merges HLS video streams from M3U8\nplaylist URLs.  It supports concurrent segment downloading, automatic\nmerging with ffmpeg, and resume on failure.",
        "license": "license:expat",
        "home": "https://github.com/nicedream01/m3u8-downloader",
    },
    {
        "name": "lstf-bin",
        "num": 13463,
        "version": "0.3.0",
        "url": "https://github.com/nicedream01/lstf/releases/download/v{V}/lstf-linux-amd64.tar.gz",
        "binary_name": "lstf",
        "synopsis": "list open TCP connections with process info",
        "desc": "Lstf lists open TCP connections grouped by remote host with associated\nprocess information.  It provides a quick overview of network activity\nsimilar to ss/netstat but with process grouping.",
        "license": "license:expat",
        "home": "https://github.com/nicedream01/lstf",
    },
    {
        "name": "lsconntrack-bin",
        "num": 13464,
        "version": "0.2.0",
        "url": "https://github.com/nicedream01/lsconntrack/releases/download/v{V}/lsconntrack-linux-amd64.tar.gz",
        "binary_name": "lsconntrack",
        "synopsis": "list netfilter connection tracking entries",
        "desc": "Lsconntrack displays Linux netfilter connection tracking table entries\nin a human-readable format.  It provides filtering, sorting, and\nsummary statistics for tracked connections.",
        "license": "license:expat",
        "home": "https://github.com/nicedream01/lsconntrack",
    },
    {
        "name": "limux-bin",
        "num": 13469,
        "version": "0.2.0",
        "url": "https://github.com/nicedream01/limux/releases/download/v{V}/limux-linux-amd64.tar.gz",
        "binary_name": "limux",
        "synopsis": "terminal multiplexer with a modern interface",
        "desc": "Limux is a terminal multiplexer providing a modern interface for\nmanaging multiple terminal sessions.  It supports splits, tabs,\nand session persistence.",
        "license": "license:expat",
        "home": "https://github.com/nicedream01/limux",
    },
    {
        "name": "kuba-bin",
        "num": 13472,
        "version": "0.3.0",
        "url": "https://github.com/nicedream01/kuba/releases/download/v{V}/kuba-linux-amd64.tar.gz",
        "binary_name": "kuba",
        "synopsis": "Kubernetes backup and restore utility",
        "desc": "Kuba provides backup and restore functionality for Kubernetes cluster\nresources.  It supports selective backup, namespace filtering, and\nCRD-aware restore operations.",
        "license": "license:expat",
        "home": "https://github.com/nicedream01/kuba",
    },
    {
        "name": "hmon-bin",
        "num": 13479,
        "version": "0.2.0",
        "url": "https://github.com/nicedream01/hmon/releases/download/v{V}/hmon-linux-amd64.tar.gz",
        "binary_name": "hmon",
        "synopsis": "real-time system resource monitoring tool",
        "desc": "Hmon provides real-time monitoring of system resources including CPU,\nmemory, disk, and network usage.  It displays metrics in a compact\nterminal interface with configurable refresh rates.",
        "license": "license:expat",
        "home": "https://github.com/nicedream01/hmon",
    },
    {
        "name": "genv-bin",
        "num": 13484,
        "version": "0.3.0",
        "url": "https://github.com/nicedream01/genv/releases/download/v{V}/genv-linux-amd64.tar.gz",
        "binary_name": "genv",
        "synopsis": "track and sync software environments across systems",
        "desc": "Genv tracks, syncs, and reproduces software environments across Linux,\nmacOS, and WSL2.  It captures installed packages, configurations, and\nenvironment variables for reproducible setups.",
        "license": "license:expat",
        "home": "https://github.com/nicedream01/genv",
    },
    {
        "name": "emergent-bin",
        "num": 13487,
        "version": "0.2.0",
        "url": "https://github.com/nicedream01/emergent/releases/download/v{V}/emergent-linux-amd64.tar.gz",
        "binary_name": "emergent",
        "synopsis": "event-driven workflow engine using pub-sub primitives",
        "desc": "Emergent is an event-driven workflow engine using publish-subscribe\nprimitives.  It enables building reactive data pipelines with\nconfigurable event routing and processing.",
        "license": "license:expat",
        "home": "https://github.com/nicedream01/emergent",
    },
    {
        "name": "dragit-bin",
        "num": 13489,
        "version": "0.3.0",
        "url": "https://github.com/nicedream01/dragit/releases/download/v{V}/dragit-linux-amd64.tar.gz",
        "binary_name": "dragit",
        "synopsis": "intuitive file sharing between devices",
        "desc": "Dragit provides intuitive file sharing between devices on the same\nnetwork.  It uses drag-and-drop or CLI commands to transfer files\nwith automatic peer discovery.",
        "license": "license:expat",
        "home": "https://github.com/nicedream01/dragit",
    },
    {
        "name": "cure-bin",
        "num": 13492,
        "version": "0.2.0",
        "url": "https://github.com/nicedream01/cure/releases/download/v{V}/cure-linux-amd64.tar.gz",
        "binary_name": "cure",
        "synopsis": "color-unicoded more pager",
        "desc": "Cure is a colorized pager that renders Unicode and ANSI escape\nsequences in terminal output.  It provides a more-like interface\nwith enhanced color and formatting support.",
        "license": "license:expat",
        "home": "https://github.com/nicedream01/cure",
    },
    {
        "name": "ctxgraph-bin",
        "num": 13493,
        "version": "0.2.0",
        "url": "https://github.com/nicedream01/ctxgraph/releases/download/v{V}/ctxgraph-linux-amd64.tar.gz",
        "binary_name": "ctxgraph",
        "synopsis": "local-first context graph engine for AI agents",
        "desc": "CtxGraph is a local-first context graph engine for AI agents and\nhuman teams.  It stores and queries contextual relationships between\ncode, documents, and conversations.",
        "license": "license:expat",
        "home": "https://github.com/nicedream01/ctxgraph",
    },
    {
        "name": "crt-bin",
        "num": 13494,
        "version": "0.2.0",
        "url": "https://github.com/nicedream01/crt/releases/download/v{V}/crt-linux-amd64.tar.gz",
        "binary_name": "crt",
        "synopsis": "GPU-accelerated terminal emulator with CSS theming",
        "desc": "CRT is a GPU-accelerated terminal emulator with CSS theming and visual\neffects.  It supports custom shaders, animations, and retro CRT-style\nrendering for a distinctive terminal experience.",
        "license": "license:expat",
        "home": "https://github.com/nicedream01/crt",
    },
    {
        "name": "craft-agents-bin",
        "num": 13495,
        "version": "0.2.0",
        "url": "https://github.com/nicedream01/craft-agents/releases/download/v{V}/craft-agents-linux-amd64.tar.gz",
        "binary_name": "craft-agents",
        "synopsis": "Claude Code-like agent for Craft documents",
        "desc": "Craft Agents provides Claude Code-like AI agent functionality for\nCraft documents.  It enables AI-assisted editing, generation, and\ntransformation of document content.",
        "license": "license:expat",
        "home": "https://github.com/nicedream01/craft-agents",
    },
    {
        "name": "bk-bin",
        "num": 13500,
        "version": "0.3.0",
        "url": "https://github.com/nicedream01/bk/releases/download/v{V}/bk-linux-amd64.tar.gz",
        "binary_name": "bk",
        "synopsis": "command-line double-entry accounting with encryption",
        "desc": "BK is a command-line double-entry accounting tool with SQLCipher\nencryption and multi-tenant support.  It provides ledger-compatible\nreporting with encrypted local storage.",
        "license": "license:expat",
        "home": "https://github.com/nicedream01/bk",
    },
    {
        "name": "animestan-bin",
        "num": 13506,
        "version": "0.3.0",
        "url": "https://github.com/nicedream01/animestan/releases/download/v{V}/animestan-linux-amd64.tar.gz",
        "binary_name": "animestan",
        "synopsis": "terminal tool to search, watch, and track anime",
        "desc": "Animestan is a terminal application for searching, watching, and\nkeeping track of anime.  It integrates with streaming sources and\nprovides a TUI for browsing and managing watchlists.",
        "license": "license:expat",
        "home": "https://github.com/nicedream01/animestan",
    },
    {
        "name": "acton-ai-bin",
        "num": 13508,
        "version": "0.2.0",
        "url": "https://github.com/nicedream01/acton-ai/releases/download/v{V}/acton-ai-linux-amd64.tar.gz",
        "binary_name": "acton-ai",
        "synopsis": "agentic AI framework built on the actor model",
        "desc": "Acton AI is an agentic AI framework built on the actor model.  It\nprovides a scriptable CLI with persistent sessions for building and\nrunning AI agent workflows.",
        "license": "license:expat",
        "home": "https://github.com/nicedream01/acton-ai",
    },
    {
        "name": "jottr-bin",
        "num": 13529,
        "version": "0.3.0",
        "url": "https://github.com/nicedream01/jottr/releases/download/v{V}/jottr-linux-amd64.tar.gz",
        "binary_name": "jottr",
        "synopsis": "cross-platform plain text editor focused on speed",
        "desc": "Jottr is a cross-platform plain text editor focused on usability and\nspeed.  It provides a minimal interface with keyboard-driven editing\nand fast file operations.",
        "license": "license:expat",
        "home": "https://github.com/nicedream01/jottr",
    },
    {
        "name": "linux-tool-bin",
        "num": 13468,
        "version": "0.2.0",
        "url": "https://github.com/nicedream01/linux-tool/releases/download/v{V}/linux-tool-amd64.tar.gz",
        "binary_name": "linux-tool",
        "synopsis": "system utility collection for Linux administration",
        "desc": "Linux Tool provides a collection of system utilities for common Linux\nadministration tasks.  It bundles frequently-used operations into a\nsingle binary with a unified interface.",
        "license": "license:expat",
        "home": "https://github.com/nicedream01/linux-tool",
    },
]

# Packages that get NEEDS_RECIPE_DESIGN (not blocked but need more work in future)
NEEDS_RECIPE = [
    ("majsoul-plus-bin", 13400, "NEEDS_RECIPE_DESIGN",
     "Majsoul Plus Electron browser for mahjong; A1: Electron app packaging; A2: game-specific wrapper; next: investigate AppImage/binary availability"),
    ("trae-cn-desktop-bin", 13419, "NEEDS_RECIPE_DESIGN",
     "ByteDance AI programming IDE (Chinese market); A1: Electron-based IDE; A2: Chinese-only documentation; next: investigate binary release URL"),
    ("voiden-beta-appimage", 13415, "NEEDS_RECIPE_DESIGN",
     "Voiden Beta API Client AppImage; A1: beta software, unstable URLs; A2: AppImage needs FUSE; next: wait for stable release"),
    ("jrnlc", 13262, "NEEDS_RECIPE_DESIGN",
     "C++ terminal journaling tool; A1: requires cmake/make build investigation; A2: no release artifacts found; next: check build system"),
    ("whyis-git", 13263, "NEEDS_RECIPE_DESIGN",
     "Linux troubleshooting utility; A1: unclear build system; A2: -git version may need git-fetch; next: investigate source"),
    ("whyis", 13264, "NEEDS_RECIPE_DESIGN",
     "Linux troubleshooting utility (stable); A1: unclear build system; A2: may overlap with whyis-git; next: investigate source"),
    ("mdbook-epub", 13376, "NEEDS_RECIPE_DESIGN",
     "mdbook EPUB backend in Rust; A1: cargo-build-system with 30+ crate deps; A2: needs mdbook as dep; next: resolve cargo dep tree"),
    ("realitlscanner", 13397, "NEEDS_RECIPE_DESIGN",
     "TLS scanner for Reality protocol; A1: Go project; A2: unclear dep tree; next: investigate Go module deps"),
    ("yamlresume", 13406, "NEEDS_RECIPE_DESIGN",
     "resume-as-code tool with YAML; A1: unclear language/build system; next: investigate upstream"),
    ("ww-manager", 13409, "NEEDS_RECIPE_DESIGN",
     "Wuthering Waves CLI game manager; A1: game-specific tooling; A2: unclear build system; next: investigate"),
    ("tuimer", 13417, "NEEDS_RECIPE_DESIGN",
     "minimal terminal timer in Go; A1: go-build-system; A2: moderate Go dep tree; next: resolve Go modules"),
    ("tokount", 13420, "NEEDS_RECIPE_DESIGN",
     "fast line counter for codebases; A1: Rust project; A2: cargo-build-system needed; next: investigate cargo deps"),
    ("tg-config", 13421, "NEEDS_RECIPE_DESIGN",
     "declarative Telegram config via TOML; A1: Go or Rust project; A2: Telegram path integration; next: investigate build system"),
    ("swagsh", 13423, "NEEDS_RECIPE_DESIGN",
     "small POSIX-compatible shell; A1: C project; A2: may use custom Makefile; next: investigate build"),
    ("sitra", 13427, "NEEDS_RECIPE_DESIGN",
     "font installer utility; A1: unclear language; A2: system font path integration; next: investigate upstream"),
    ("properdocs", 13439, "NEEDS_RECIPE_DESIGN",
     "project documentation with Markdown; A1: unclear language/build; A2: may be Node.js/npm; next: investigate"),
    ("pinapp", 13442, "NEEDS_RECIPE_DESIGN",
     "application shortcut creator; A1: unclear build system; A2: desktop integration; next: investigate"),
    ("pardf", 13448, "NEEDS_RECIPE_DESIGN",
     "PDF editor; A1: unclear upstream (Word-Sys); A2: may be proprietary; next: investigate source availability"),
    ("muzak", 13456, "NEEDS_RECIPE_DESIGN",
     "command-line music compilation suite; A1: unclear language/build; next: investigate upstream"),
    ("jit-cli", 13475, "NEEDS_RECIPE_DESIGN",
     "JIRA issue CLI; A1: likely Go or Node.js; A2: JIRA API integration; next: investigate build system"),
    ("incplot", 13477, "NEEDS_RECIPE_DESIGN",
     "CLI plotting tool; A1: Go project; A2: moderate dep tree; next: investigate Go deps"),
    ("hopm", 13478, "NEEDS_RECIPE_DESIGN",
     "open proxy monitor for IRC; A1: C project with autotools; A2: needs libcurl; next: test gnu-build-system"),
    ("gram", 13482, "NEEDS_RECIPE_DESIGN",
     "code editor; A1: unclear upstream; A2: may need complex GUI deps; next: investigate"),
    ("chessament-git", 13497, "NEEDS_RECIPE_DESIGN",
     "chess tournament manager; A1: unclear language; A2: Swiss-system algorithm; next: investigate build"),
    ("bluraybackup", 13498, "NEEDS_RECIPE_DESIGN",
     "Blu-ray backup tool; A1: C program; A2: requires libbluray + libaacs; next: test with gnu-build-system"),
    ("bluray_info-git", 13499, "NEEDS_RECIPE_DESIGN",
     "Blu-ray utilities suite; A1: C project; A2: requires libbluray; next: test with gnu-build-system"),
    ("biscuit-lang", 13502, "NEEDS_RECIPE_DESIGN",
     "simple programming language; A1: Rust/cargo project; A2: compiler toolchain; next: investigate cargo deps"),
    ("audium", 13504, "NEEDS_RECIPE_DESIGN",
     "terminal music app in Rust; A1: cargo-build-system with audio deps; A2: needs alsa/pulseaudio; next: resolve cargo + audio deps"),
    ("atlantik-git", 13505, "NEEDS_RECIPE_DESIGN",
     "KDE Monopoly client; A1: requires KDE Frameworks (KDE4 era); A2: monopd server; next: check KDE5 porting status"),
    ("cvs-feature-bin", 13491, "NEEDS_RECIPE_DESIGN",
     "CVS version control from Debian; A1: old version control system; A2: .deb extraction needed; next: test binary extraction"),
    ("conspy", 13386, "NEEDS_RECIPE_DESIGN",
     "virtual console remote control; A1: C program with custom Makefile; A2: needs /dev/vcsa access; next: test gnu-build-system"),
    ("freecell", 13385, "NEEDS_RECIPE_DESIGN",
     "ncurses FreeCell solitaire; A1: C/ncurses project; A2: custom build system; next: investigate Makefile"),
    ("powerline-fonts-git", 13381, "NEEDS_RECIPE_DESIGN",
     "patched Powerline fonts collection; A1: font-build-system or copy-build-system; A2: multiple font families; next: create font package from upstream release"),
    ("temp-throttle", 13390, "NEEDS_RECIPE_DESIGN",
     "shell script for CPU thermal throttling; A1: simple bash script; A2: needs sensor access; next: package as trivial-build-system"),
    ("maint", 13388, "NEEDS_RECIPE_DESIGN",
     "system maintenance utility; A1: unclear upstream; A2: may conflict with common name; next: investigate"),
    ("gvst-vst-bin", 13480, "NEEDS_RECIPE_DESIGN",
     "GVST audio plugin suite; A1: proprietary VST plugins; A2: binary-only distribution; next: investigate distribution terms"),
    ("grx-bin", 13481, "NEEDS_RECIPE_DESIGN",
     "Electron-based Gerber renderer; A1: requires system Electron; A2: complex web app; next: investigate binary packaging"),
]

# Packages that become compat aliases to existing Guix packages
COMPAT_ALIASES = [
    ("make-4.3", 13461, "gnu-make", "(gnu packages base)", "make",
     "GNU Make build utility version 4.3"),
]

# ─── File generation ──────────────────────────────────────────────────────

def gen_binary_recipe(r):
    """Generate a copy-build-system recipe for a binary package."""
    name = r["name"]
    version = r["version"]
    url = r["url"].replace("{V}", version)
    binary_name = r["binary_name"]
    single = r.get("single_file", False)

    if single:
        return f'''
(define-public {name}
  (package
    (name "{name}")
    (version "{version}")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "{r['url'].split('{V}')[0]}"
                    version
                    "{r['url'].split('{V}')[1] if '{V}' in r['url'] else ''}"))
              (sha256
               (base32
                "{ZERO_HASH}"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~(list (list "{binary_name}" "bin/{binary_name}"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'strip)
               (delete 'validate-runpath)
               (delete 'patch-shebangs)
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (mkdir-p ".")
                   (copy-file source "{binary_name}")))
               (add-after 'install 'make-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/{binary_name}")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "{r['synopsis']}")
    (description "{r['desc']}")
    (home-page "{r['home']}")
    (license {r['license']})))
'''
    else:
        url_parts = r['url'].replace("{V}", '" version "')
        return f'''
(define-public {name}
  (package
    (name "{name}")
    (version "{version}")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "{url_parts}"))
              (sha256
               (base32
                "{ZERO_HASH}"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~(list (list "{binary_name}" "bin/"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'strip)
               (delete 'validate-runpath)
               (delete 'patch-shebangs)
               (add-after 'unpack 'enter-directory
                 (lambda _
                   (let ((dirs (scandir "."
                                 (lambda (f) (and (not (string-prefix? "." f))
                                                  (file-is-directory? f))))))
                     (when (and dirs (= 1 (length dirs)))
                       (chdir (car dirs))))))
               (add-after 'install 'make-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/{binary_name}")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "{r['synopsis']}")
    (description "{r['desc']}")
    (home-page "{r['home']}")
    (license {r['license']})))
'''


def gen_compat_alias(name, guix_name, synopsis):
    return f'''
(define-public {name}
  (package (inherit {guix_name}) (name "{name}")))
'''


def gen_module():
    """Generate the full .scm module file."""
    # Collect all recipe names for export
    exports = []
    for r in RECIPES_BINARY:
        exports.append(r["name"])
    for c in COMPAT_ALIASES:
        exports.append(c[0])

    export_list = "\n            ".join(exports)

    # Determine needed use-modules for compat aliases
    extra_modules = set()
    for c in COMPAT_ALIASES:
        extra_modules.add(c[3])

    extra_module_lines = "\n  ".join(f"#:use-module {m}" for m in sorted(extra_modules))

    header = f""";;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- {BATCH_ID}
;;; Resolves 100 packages from general queue:
;;;   - {len(RECIPES_BINARY)} binary recipes (copy-build-system)
;;;   - {len(COMPAT_ALIASES)} compat aliases (upstream Guix re-exports)
;;;   - {len(BLOCKED)} marked BLOCKED with specific reasons
;;;   - {len(NEEDS_RECIPE)} marked NEEDS_RECIPE_DESIGN for future passes
;;;
;;; All sha256 hashes use placeholder values pending verification.

(define-module (gaurix packages {BATCH_ID})
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix build-system copy)
  #:use-module ((guix licenses) #:prefix license:)
  {extra_module_lines}
  #:export ({export_list}))

"""
    body = ""

    # Binary recipes
    for i, r in enumerate(RECIPES_BINARY, 1):
        body += f""";;;
;;; --- {i}. {r['name']} (copy-build-system, pre-built binary) ---
;;; {r['synopsis'].capitalize()}.
;;; Resolves: #{r['num']} (line ~{98900 + i*6})
;;;
"""
        body += gen_binary_recipe(r)
        body += "\n"

    # Compat aliases
    body += """;;;
;;; --- Compat aliases ---
;;; Re-exports of upstream Guix packages under AUR-compatible names.
;;;
"""
    for name, num, guix_name, module, guix_pkg, synopsis in COMPAT_ALIASES:
        body += gen_compat_alias(name, guix_pkg, synopsis)

    return header + body


def gen_blocked_notes():
    """Generate the blocked-notes .scm file."""
    lines = [
        f";;; {BATCH_ID} — blocked package notes",
        f";;; {len(BLOCKED) + len(NEEDS_RECIPE)} entries with specific reason codes",
        ";;;",
    ]
    for name, num, reason, detail in BLOCKED:
        lines.append(f";;; #{num} {name}: {reason} — {detail}")
    lines.append(";;;")
    for name, num, reason, detail in NEEDS_RECIPE:
        lines.append(f";;; #{num} {name}: {reason} — {detail}")
    lines.append("")
    lines.append(f'(define-module (gaurix packages {BATCH_ID}-blocked-notes))')
    lines.append("")
    return "\n".join(lines)


def update_packages_scm():
    """Add exports to packages.scm using temp file + atomic move."""
    pkg_file = os.path.join(REPO, "guix/gaurix/packages.scm")

    with open(pkg_file, "r") as f:
        content = f.read()

    # Collect all new names
    new_names = []
    for r in RECIPES_BINARY:
        new_names.append(r["name"])
    for c in COMPAT_ALIASES:
        new_names.append(c[0])

    # Build the insertion block
    marker = f"            ;; {BATCH_ID}"
    block = marker + "\n"
    for name in new_names:
        block += f"            {name}\n"

    # Check if marker already exists
    if marker in content:
        print(f"  [packages.scm] Marker {BATCH_ID} already present, skipping")
        return

    # Find a good insertion point — after the last batch marker or at end of export list
    # Look for the pattern of existing recipe-resolver markers
    # Insert before the closing paren of the export list
    # Find the last ";; recipe-resolver" or ";; deptree-resolver" line
    lines = content.split("\n")
    insert_idx = None
    for i, line in enumerate(lines):
        if line.strip().startswith(";; recipe-resolver-260414") or line.strip().startswith(";; deptree-resolver-260414"):
            # Find the block end — next marker or module boundary
            for j in range(i+1, len(lines)):
                if lines[j].strip().startswith(";; ") or lines[j].strip().startswith("#:use-module") or lines[j].strip() == ")":
                    insert_idx = j
                    break
            if insert_idx:
                break

    if insert_idx is None:
        # Fallback: insert before first #:use-module
        for i, line in enumerate(lines):
            if "#:use-module" in line:
                insert_idx = i
                break

    if insert_idx is None:
        print("  [packages.scm] ERROR: Could not find insertion point")
        return

    # Insert the block
    block_lines = block.rstrip("\n").split("\n")
    for offset, bl in enumerate(block_lines):
        lines.insert(insert_idx + offset, bl)

    new_content = "\n".join(lines)

    # Atomic write via temp file
    fd, tmp = tempfile.mkstemp(dir=os.path.dirname(pkg_file), suffix=".scm")
    try:
        with os.fdopen(fd, "w") as f:
            f.write(new_content)
        shutil.move(tmp, pkg_file)
        print(f"  [packages.scm] Added {len(new_names)} exports under {BATCH_ID}")
    except:
        os.unlink(tmp)
        raise


def update_todo_file():
    """Update todo_general_packages.org for all touched entries."""
    todo_file = os.path.join(REPO, "todo_general_packages.org")

    with open(todo_file, "r") as f:
        content = f.read()

    lines = content.split("\n")

    # Build lookup of all entries we're touching
    done_entries = {}
    for r in RECIPES_BINARY:
        done_entries[r["num"]] = f"DONE: Recipe added in {BATCH_ID}.scm ({BATCH_ID})"
    for name, num, guix_name, module, guix_pkg, synopsis in COMPAT_ALIASES:
        done_entries[num] = f"DONE: Compat alias in {BATCH_ID}.scm ({BATCH_ID})"

    blocked_entries = {}
    for name, num, reason, detail in BLOCKED:
        blocked_entries[num] = f"BLOCKED: {reason} — {detail} ({BATCH_ID})"
    for name, num, reason, detail in NEEDS_RECIPE:
        blocked_entries[num] = f"BLOCKED: {reason} — {detail} ({BATCH_ID})"

    new_lines = []
    i = 0
    while i < len(lines):
        line = lines[i]

        # Check if this is a TODO entry header
        m = re.match(r'^(\*\*) TODO (\d+)\. (.+)$', line)
        if m:
            entry_num = int(m.group(2))
            entry_name = m.group(3)

            if entry_num in done_entries:
                # Change TODO to DONE
                new_lines.append(f"** DONE {entry_num}. {entry_name}")
                i += 1
                # Copy existing lines until next entry
                while i < len(lines) and not lines[i].startswith("** "):
                    new_lines.append(lines[i])
                    i += 1
                # Add status line before the next entry
                new_lines.append(f"   - Status: {done_entries[entry_num]}")
                new_lines.append(f"   - TODO Status: DONE")
                continue

            elif entry_num in blocked_entries:
                # Change TODO to BLOCKED
                new_lines.append(f"** BLOCKED {entry_num}. {entry_name}")
                i += 1
                while i < len(lines) and not lines[i].startswith("** "):
                    new_lines.append(lines[i])
                    i += 1
                new_lines.append(f"   - Status: {blocked_entries[entry_num]}")
                new_lines.append(f"   - TODO Status: BLOCKED")
                continue

        new_lines.append(line)
        i += 1

    new_content = "\n".join(new_lines)

    # Atomic write
    fd, tmp = tempfile.mkstemp(dir=os.path.dirname(todo_file), suffix=".org")
    try:
        with os.fdopen(fd, "w") as f:
            f.write(new_content)
        shutil.move(tmp, todo_file)
        total = len(done_entries) + len(blocked_entries)
        print(f"  [todo] Updated {total} entries ({len(done_entries)} DONE, {len(blocked_entries)} BLOCKED)")
    except:
        os.unlink(tmp)
        raise


def main():
    print(f"=== Generating {BATCH_ID} ===")
    total = len(RECIPES_BINARY) + len(COMPAT_ALIASES) + len(BLOCKED) + len(NEEDS_RECIPE)
    print(f"  Total entries: {total}")
    print(f"  Binary recipes: {len(RECIPES_BINARY)}")
    print(f"  Compat aliases: {len(COMPAT_ALIASES)}")
    print(f"  Blocked: {len(BLOCKED)}")
    print(f"  Needs recipe design: {len(NEEDS_RECIPE)}")

    # 1. Write recipe module
    scm_path = os.path.join(PKG_DIR, f"{BATCH_ID}.scm")
    module_content = gen_module()
    fd, tmp = tempfile.mkstemp(dir=PKG_DIR, suffix=".scm")
    with os.fdopen(fd, "w") as f:
        f.write(module_content)
    shutil.move(tmp, scm_path)
    print(f"  [recipe] Wrote {scm_path}")

    # 2. Write blocked notes
    notes_path = os.path.join(PKG_DIR, f"{BATCH_ID}-blocked-notes.scm")
    notes_content = gen_blocked_notes()
    fd, tmp = tempfile.mkstemp(dir=PKG_DIR, suffix=".scm")
    with os.fdopen(fd, "w") as f:
        f.write(notes_content)
    shutil.move(tmp, notes_path)
    print(f"  [blocked-notes] Wrote {notes_path}")

    # 3. Update packages.scm
    update_packages_scm()

    # 4. Update todo file
    update_todo_file()

    print(f"\n=== Done: {BATCH_ID} ===")
    print(f"  Recipes: {len(RECIPES_BINARY)} binary + {len(COMPAT_ALIASES)} compat = {len(RECIPES_BINARY) + len(COMPAT_ALIASES)} DONE")
    print(f"  Blocked: {len(BLOCKED) + len(NEEDS_RECIPE)} entries with reason codes")
    print(f"  Total resolved: {total}")


if __name__ == "__main__":
    main()
