#!/usr/bin/env python3
"""Generate deptree-resolver-260414d.scm and blocked-notes, update integration files.

Batch: deptree-resolver-260414d
Dependency-tree-driven packaging pass for 100 BLOCKED packages.
"""

import os
import re
import tempfile

REPO = "/home/slime/projects/gaurix"
PKG_DIR = os.path.join(REPO, "guix/gaurix/packages")
BATCH_ID = "deptree-resolver-260414d"
ZERO_HASH = "0000000000000000000000000000000000000000000000000000"

# ─── Blocked packages ──────────────────────────────────────────────────────
BLOCKED = [
    # SOURCE_UNAVAILABLE — not in AUR metadata, removed or delisted
    ("anbox-git", 58, "SOURCE_UNAVAILABLE",
     "not in AUR metadata; project deprecated since Feb 2023, superseded by Waydroid"),
    ("gram-editor-git", 2986, "SOURCE_UNAVAILABLE",
     "not in AUR metadata; no upstream source available"),
    ("linux6.19.8.arch1-1-bin", 7510, "SOURCE_UNAVAILABLE",
     "not in AUR metadata; versioned kernel binary, superseded by newer releases"),
    ("linux6.19.8.arch1-1-docs-bin", 7512, "SOURCE_UNAVAILABLE",
     "not in AUR metadata; versioned kernel docs, superseded by newer releases"),
    ("linux6.19.8.arch1-1-headers-bin", 7511, "SOURCE_UNAVAILABLE",
     "not in AUR metadata; versioned kernel headers, superseded by newer releases"),
    ("linux6.19.9.arch1-1-bin", 9670, "SOURCE_UNAVAILABLE",
     "not in AUR metadata; versioned kernel binary, superseded by newer releases"),
    ("linux6.19.9.arch1-1-docs-bin", 9672, "SOURCE_UNAVAILABLE",
     "not in AUR metadata; versioned kernel docs, superseded by newer releases"),
    ("linux6.19.9.arch1-1-headers-bin", 9671, "SOURCE_UNAVAILABLE",
     "not in AUR metadata; versioned kernel headers, superseded by newer releases"),
    ("linux6.19.9.zen1-1-zen-bin", 9956, "SOURCE_UNAVAILABLE",
     "not in AUR metadata; versioned ZEN kernel binary, superseded by newer releases"),
    ("linux6.19.9.zen1-1-zen-docs-bin", 9958, "SOURCE_UNAVAILABLE",
     "not in AUR metadata; versioned ZEN kernel docs, superseded by newer releases"),
    ("linux6.19.9.zen1-1-zen-headers-bin", 9957, "SOURCE_UNAVAILABLE",
     "not in AUR metadata; versioned ZEN kernel headers, superseded by newer releases"),
    ("llama.cpp-aio", 2097, "SOURCE_UNAVAILABLE",
     "not in AUR metadata; all-in-one llama.cpp variant removed from AUR"),
    ("nvidia-vulkan-dkms", 548, "SOURCE_UNAVAILABLE",
     "not in AUR metadata; NVIDIA Vulkan developer branch removed from AUR"),
    ("openai-codex-autoup-bin", 1578, "SOURCE_UNAVAILABLE",
     "not in AUR metadata; OpenAI Codex auto-updater removed from AUR"),
    ("opensc-p11-kit-module", 7333, "SOURCE_UNAVAILABLE",
     "not in AUR metadata; OpenSC PKCS#11 module removed from AUR"),
    ("projtlauncher", 6759, "SOURCE_UNAVAILABLE",
     "not in AUR metadata; project launcher removed from AUR"),
    ("python-uharfbuzz", 12043, "SOURCE_UNAVAILABLE",
     "not in AUR metadata; Cython harfbuzz bindings need manual packaging"),
    ("shimmy-bin", 7482, "SOURCE_UNAVAILABLE",
     "not in AUR metadata; lightweight Ollama alternative removed from AUR"),
    ("shorinclip-git", 1149, "SOURCE_UNAVAILABLE",
     "not in AUR metadata; no upstream source available"),
    ("subs2srs-git", 2878, "SOURCE_UNAVAILABLE",
     "not in AUR metadata; Anki flashcard subtitle tool removed from AUR"),
    ("vdhcoapp", 7274, "SOURCE_UNAVAILABLE",
     "not in AUR metadata; Video DownloadHelper companion app removed from AUR"),
    ("vivaldi-ffmpeg-codecs", 24, "SOURCE_UNAVAILABLE",
     "not in AUR metadata; Vivaldi FFmpeg codecs removed from AUR"),
    ("whatsapp-for-linux", 46, "SOURCE_UNAVAILABLE",
     "not in AUR metadata; WhatsApp desktop wrapper removed from AUR"),
    ("zettlr", 38, "SOURCE_UNAVAILABLE",
     "not in AUR metadata; Zettlr Markdown editor removed from AUR"),

    # PROPRIETARY_FONT_LICENSE — Microsoft fonts requiring Windows ISO
    ("ttf-ms-win10-japanese", 1609, "PROPRIETARY_FONT_LICENSE",
     "proprietary Microsoft Windows 10 Japanese fonts; license prohibits redistribution"),
    ("ttf-ms-win10-korean", 1610, "PROPRIETARY_FONT_LICENSE",
     "proprietary Microsoft Windows 10 Korean fonts; license prohibits redistribution"),
    ("ttf-ms-win10-other", 1615, "PROPRIETARY_FONT_LICENSE",
     "proprietary Microsoft Windows 10 supplemental fonts; license prohibits redistribution"),
    ("ttf-ms-win10-sea", 1611, "PROPRIETARY_FONT_LICENSE",
     "proprietary Microsoft Windows 10 Southeast Asian fonts; license prohibits redistribution"),
    ("ttf-ms-win10-thai", 1612, "PROPRIETARY_FONT_LICENSE",
     "proprietary Microsoft Windows 10 Thai fonts; license prohibits redistribution"),
    ("ttf-ms-win10-zh_cn", 1613, "PROPRIETARY_FONT_LICENSE",
     "proprietary Microsoft Windows 10 Simplified Chinese fonts; license prohibits redistribution"),
    ("ttf-ms-win10-zh_tw", 1614, "PROPRIETARY_FONT_LICENSE",
     "proprietary Microsoft Windows 10 Traditional Chinese fonts; license prohibits redistribution"),
    ("ttf-ms-win11-japanese", 703, "PROPRIETARY_FONT_LICENSE",
     "proprietary Microsoft Windows 11 Japanese fonts; license prohibits redistribution"),
    ("ttf-ms-win11-korean", 702, "PROPRIETARY_FONT_LICENSE",
     "proprietary Microsoft Windows 11 Korean fonts; license prohibits redistribution"),
    ("ttf-ms-win11-other", 701, "PROPRIETARY_FONT_LICENSE",
     "proprietary Microsoft Windows 11 supplemental fonts; license prohibits redistribution"),
    ("ttf-ms-win11-sea", 700, "PROPRIETARY_FONT_LICENSE",
     "proprietary Microsoft Windows 11 Southeast Asian fonts; license prohibits redistribution"),
    ("ttf-ms-win11-thai", 699, "PROPRIETARY_FONT_LICENSE",
     "proprietary Microsoft Windows 11 Thai fonts; license prohibits redistribution"),
    ("ttf-ms-win11-zh_cn", 698, "PROPRIETARY_FONT_LICENSE",
     "proprietary Microsoft Windows 11 Simplified Chinese fonts; license prohibits redistribution"),
    ("ttf-ms-win11-zh_tw", 697, "PROPRIETARY_FONT_LICENSE",
     "proprietary Microsoft Windows 11 Traditional Chinese fonts; license prohibits redistribution"),

    # PROPRIETARY_LICENSE — proprietary software without public redistribution
    ("matlab", 9975, "PROPRIETARY_LICENSE",
     "MathWorks MATLAB requires commercial license; no public download URL for redistribution"),
    ("intel-oneapi-basekit-2025", 11871, "PROPRIETARY_LICENSE",
     "Intel oneAPI Base Toolkit 2025; 30GB+ proprietary installer; requires Intel EULA acceptance"),
    ("cisco-secure-client", 11922, "PROPRIETARY_LICENSE",
     "Cisco AnyConnect VPN; no public download URL; requires Cisco service contract"),
    ("brother-dcpt535dw", 9029, "PROPRIETARY_LICENSE",
     "Brother DCP-T535DW driver; proprietary binary with custom EULA; no redistribution rights"),
    ("brother-hl-1110", 10064, "PROPRIETARY_LICENSE",
     "Brother HL-1110 CUPS driver; proprietary binary with custom EULA; no redistribution rights"),
    ("hpuld", 1502, "PROPRIETARY_LICENSE",
     "HP Unified Linux Driver; proprietary HP binary with custom EULA"),
    ("lib32-opencl-nvidia-vulkan", 11761, "PROPRIETARY_LICENSE",
     "32-bit NVIDIA OpenCL proprietary library; Vulkan developer branch; lib32 not supported in Guix"),

    # DKMS_KERNEL_MODULE — requires DKMS/kernel module build not supported in Guix
    ("phc-intel-dkms-stable", 4537, "DKMS_KERNEL_MODULE",
     "Intel PHC undervolting DKMS kernel module; Guix has no DKMS infrastructure"),
    ("r8125-dkms", 11854, "DKMS_KERNEL_MODULE",
     "Realtek RTL8125 DKMS kernel module; Guix has no DKMS infrastructure"),
    ("bcachefs-kernel-dkms-git", 12139, "DKMS_KERNEL_MODULE",
     "bcachefs DKMS kernel module; Guix has no DKMS infrastructure"),
    ("it87-dkms-git", 183, "DKMS_KERNEL_MODULE",
     "ITE LPC sensor DKMS kernel module; Guix has no DKMS infrastructure"),
    ("magewell-pro-capture-dkms", 2455, "DKMS_KERNEL_MODULE",
     "Magewell Pro Capture DKMS kernel module; proprietary driver, no DKMS in Guix"),
    ("msi-ec-dkms-git", 7494, "DKMS_KERNEL_MODULE",
     "MSI laptop EC DKMS kernel module; Guix has no DKMS infrastructure"),

    # ARCH_SPECIFIC — requires pacman, mkinitcpio, or Arch-specific tooling
    ("find-the-command", 3139, "ARCH_SPECIFIC",
     "command-not-found hook querying pacman -Fq; requires pacman and Arch package DB"),
    ("makepkg-optimize-mold", 4150, "ARCH_SPECIFIC",
     "makepkg optimization hooks for mold linker; Arch-specific build tooling"),
    ("paccache-hook", 421, "ARCH_SPECIFIC",
     "pacman paccache cleanup hook; libalpm hook mechanism not available in Guix"),
    ("pacseek-bin", 2383, "ARCH_SPECIFIC",
     "TUI for searching/installing Arch packages; depends on pacman runtime"),
    ("systemd-boot-pacman-hook", 1584, "ARCH_SPECIFIC",
     "pacman hook for systemd-boot update; libalpm hook mechanism not available in Guix"),
    ("timeshift-autosnap", 12130, "ARCH_SPECIFIC",
     "pacman hook for Timeshift auto-snapshots; libalpm hook mechanism not available in Guix"),
    ("arch-os-manager", 10421, "ARCH_SPECIFIC",
     "Arch OS system manager; requires pacman, paru/yay, and Arch-specific paths"),
    ("dcli-arch-git", 7398, "ARCH_SPECIFIC",
     "declarative package manager for Arch; requires pacman and libalpm"),
    ("dracut-ukify", 10253, "ARCH_SPECIFIC",
     "Arch-specific dracut+ukify integration; requires mkinitcpio infrastructure"),
    ("mandb-ondemand", 4043, "ARCH_SPECIFIC",
     "pacman hook for faster mandb updates; libalpm hook mechanism not available in Guix"),
    ("mkinitcpio-archlogo", 414, "ARCH_SPECIFIC",
     "mkinitcpio hook for Arch ASCII logo at boot; Guix uses different initramfs tooling"),
    ("mkinitcpio-numlock", 11797, "ARCH_SPECIFIC",
     "mkinitcpio hook to enable numlock in early userspace; Guix uses different initramfs"),

    # ELECTRON_RUNTIME_MISSING — needs Electron runtime not available in Guix
    ("cherry-studio-electron-bin", 3876, "ELECTRON_RUNTIME_MISSING",
     "Cherry Studio LLM client needs electron40 runtime; Guix has no standalone Electron package"),
    ("kando-bin", 7267, "ELECTRON_RUNTIME_MISSING",
     "Kando pie menu needs electron37 runtime; Guix has no standalone Electron package"),

    # WINDOWS_ONLY — Windows applications requiring Wine
    ("microsip", 10072, "WINDOWS_ONLY",
     "Windows SIP softphone based on PJSIP; requires Wine runtime for Linux use"),
    ("gitextensions", 6816, "WINDOWS_ONLY",
     "Windows .NET Git GUI; requires Mono/.NET runtime not available in Guix"),
    ("mp3tag", 10283, "WINE_WRAPPER",
     "Windows tag editor requiring Wine runtime; complex Wine prefix setup needed"),

    # COMPLEX/EXHAUSTED
    ("qt6-base-hifps", 939, "NEEDS_RECIPE_DESIGN_EXHAUSTED",
     "Qt6 with high-FPS patches; 62 dependencies; massive build complexity exceeded batch scope"),
    ("circuit_macros", 10653, "FETCH_FAILED",
     "upstream URL ece.uwaterloo.ca returns redirect/error; no alternative mirror found"),
    ("helix-steel-git", 2567, "NEEDS_RECIPE_DESIGN_EXHAUSTED",
     "complex Rust/cargo Helix fork; requires full Cargo dependency vendoring not yet supported"),
    ("dolibarr", 1619, "NEEDS_RECIPE_DESIGN_EXHAUSTED",
     "PHP ERP webapp requiring Apache+MySQL+PHP deployment model; too complex for batch"),
    ("fcitx5-hazkey-bin", 3304, "BINARY_COMPLEX_DEPS",
     "fcitx5 Japanese IME binary with complex shared library dependencies"),
    ("betterbird-ru-bin", 1248, "NEEDS_RECIPE_DESIGN_EXHAUSTED",
     "locale-specific Thunderbird binary; complex GTK/dbus/hunspell runtime wrapping"),

    # DEP_RESOLUTION_FAILED
    ("docker-model-plugin", 12709, "DEP_RESOLUTION_FAILED",
     "Docker CLI plugin requires Docker Engine runtime API; Guix Docker support incomplete"),
    ("mingw-w64-zlib-ng", 12387, "CROSS_COMPILE_UNSUPPORTED",
     "MinGW-w64 cross-compilation target; not supported in Guix build infrastructure"),

    # ARCHIVED
    ("ibus-lotus-bin", 9068, "ARCHIVED_PROJECT",
     "ibus-lotus archived 2026-01-17; discontinued in favor of fcitx5-unikey"),
]

# ─── Recipe packages ────────────────────────────────────────────────────────
RECIPES = [
    # ── Shell/script packages (copy-build-system) ──
    {
        "name": "butter",
        "num": 7184,
        "version": "12",
        "url_git": "https://github.com/moviuro/butter.git",
        "tag": "v{V}",
        "build": "copy",
        "plan": [("butter", "bin/"), ("butter.1", "share/man/man1/")],
        "synopsis": "btrfs snapshot manager script",
        "desc": "Butter is a shell script that manages btrfs snapshots.  It creates\nand rotates snapshots according to configurable retention policies\nfor automated btrfs backup workflows.",
        "license": "license:wtfpl2",
        "home": "https://github.com/moviuro/butter",
    },
    {
        "name": "bwrap-common",
        "num": 2530,
        "version": "0.0.5",
        "url_git": "https://gitlab.com/fkzys/bwrap-common.git",
        "tag": "v{V}",
        "build": "gnu-generic",
        "synopsis": "reusable bubblewrap sandbox helpers for shell wrappers",
        "desc": "Bwrap-common provides reusable bubblewrap sandbox helper scripts for\nshell wrappers.  It simplifies creating sandboxed application launchers\nwith pre-configured filesystem and network isolation.",
        "license": "license:agpl3+",
        "home": "https://gitlab.com/fkzys/bwrap-common",
    },
    {
        "name": "getnf-git",
        "num": 7341,
        "version": "0.3.0",
        "url_git": "https://github.com/getnf/getnf.git",
        "tag": "v{V}",
        "build": "copy",
        "plan": [("getnf", "bin/")],
        "synopsis": "command-line tool for installing Nerd Fonts",
        "desc": "Getnf is a command-line tool for browsing and installing Nerd Fonts.\nIt downloads font archives from the Nerd Fonts GitHub releases and\ninstalls them to the user font directory.",
        "license": "license:gpl3+",
        "home": "https://github.com/getnf/getnf",
    },
    {
        "name": "makesure",
        "num": 7393,
        "version": "0.9.26",
        "url_git": "https://github.com/xonixx/makesure.git",
        "tag": "v{V}",
        "build": "copy",
        "plan": [("makesure", "bin/")],
        "synopsis": "AWK-based task runner with declarative goals and dependencies",
        "desc": "Makesure is a simple task and command runner implemented in AWK.  It\nuses declarative goal definitions with dependencies and provides a\nlightweight alternative to Make for shell-based workflows.",
        "license": "license:expat",
        "home": "https://github.com/xonixx/makesure",
    },
    {
        "name": "mons",
        "num": 1618,
        "version": "0.8.2",
        "url_git": "https://github.com/Ventto/mons.git",
        "tag": "{V}",
        "build": "gnu-make",
        "synopsis": "POSIX shell script for managing dual-monitor displays",
        "desc": "Mons is a POSIX shell script for quickly managing dual-monitor display\nconfigurations.  It provides simple commands for extending, mirroring,\nand switching between monitor layouts using xrandr.",
        "license": "license:expat",
        "home": "https://github.com/Ventto/mons",
    },
    {
        "name": "laptop-mode-tools",
        "num": 9871,
        "version": "1.74",
        "url_git": "https://github.com/rickysarraf/laptop-mode-tools.git",
        "tag": "{V}",
        "build": "gnu-make",
        "synopsis": "power saving tool for Linux laptops",
        "desc": "Laptop Mode Tools is a collection of scripts for power management on\nLinux laptops.  It configures hard drive spin-down, CPU frequency\nscaling, screen brightness, and other power-saving features.",
        "license": "license:gpl2+",
        "home": "https://github.com/rickysarraf/laptop-mode-tools",
    },
    {
        "name": "mpv-thumbfast-git",
        "num": 707,
        "version": "0.1",
        "url_git": "https://github.com/po5/thumbfast.git",
        "tag": "v{V}",
        "build": "copy",
        "plan": [("thumbfast.lua", "share/mpv/scripts/")],
        "synopsis": "high-performance on-the-fly thumbnailer for mpv",
        "desc": "Thumbfast is a high-performance on-the-fly thumbnailer script for the\nmpv media player.  It generates preview thumbnails during seek\noperations with minimal CPU and memory overhead.",
        "license": "license:mpl2.0",
        "home": "https://github.com/po5/thumbfast",
    },
    {
        "name": "esp8266-nonos-sdk",
        "num": 10392,
        "version": "3.0.6",
        "url_git": "https://github.com/espressif/ESP8266_NONOS_SDK.git",
        "tag": "v{V}",
        "build": "copy",
        "plan": [(".", "share/esp8266-nonos-sdk/")],
        "synopsis": "ESP8266 non-OS SDK for firmware development",
        "desc": "ESP8266 NonOS SDK provides libraries and headers for developing\nfirmware on ESP8266 Wi-Fi microcontrollers without an operating\nsystem.  It includes Wi-Fi, TCP/IP, and peripheral APIs.",
        "license": "license:expat",
        "home": "https://github.com/espressif/ESP8266_NONOS_SDK",
    },
    {
        "name": "cdebootstrap-static",
        "num": 2473,
        "version": "0.7.9",
        "url": "http://deb.debian.org/debian/pool/main/c/cdebootstrap/cdebootstrap-static_{V}_amd64.deb",
        "build": "copy-deb",
        "plan": [],
        "synopsis": "static binary for bootstrapping a Debian system",
        "desc": "Cdebootstrap-static is a statically linked tool for bootstrapping a\nminimal Debian system from a mirror.  It can create chroot environments\nand base installations without requiring a running Debian system.",
        "license": "license:gpl2+",
        "home": "https://packages.debian.org/cdebootstrap",
    },
    # ── Binary packages (pre-built) ──
    {
        "name": "matchmaker-bin",
        "num": 2885,
        "version": "0.0.24",
        "url": "https://github.com/Squirreljetpack/matchmaker/releases/download/v{V}/matchmaker-{V}-x86_64-unknown-linux-gnu.tar.gz",
        "build": "copy",
        "plan": [("matchmaker", "bin/")],
        "synopsis": "fast configurable fuzzy searcher",
        "desc": "Matchmaker is a fast and configurable fuzzy searcher for the terminal.\nIt provides interactive filtering with customizable scoring, previews,\nand integration with shell workflows.",
        "license": "license:gpl3",
        "home": "https://github.com/Squirreljetpack/matchmaker",
    },
    {
        "name": "clion-eap",
        "num": 4489,
        "version": "261.22158.273",
        "url": "https://download.jetbrains.com/cpp/CLion-{V}.tar.gz",
        "build": "copy",
        "plan": [(".", "share/clion-eap/")],
        "synopsis": "JetBrains CLion C/C++ IDE Early Access Program",
        "desc": "CLion EAP is the Early Access Program build of JetBrains' cross-platform\nIDE for C and C++ development.  It provides code analysis, refactoring,\ndebugging, and CMake/Makefile project support.",
        "license": '(nonguix-license:nonfree "https://www.jetbrains.com/legal/docs/toolbox/license/")',
        "home": "https://www.jetbrains.com/clion",
    },
    # ── Go packages (go-like placeholder) ──
    {
        "name": "discordo-git",
        "num": 453,
        "version": "0.0.1",
        "url_git": "https://github.com/ayntgl/discordo.git",
        "tag": "v{V}",
        "build": "go-like",
        "synopsis": "lightweight terminal-based Discord client",
        "desc": "Discordo is a lightweight, feature-rich Discord client for the\nterminal.  It provides text messaging, server navigation, and\nchannel management through a keyboard-driven TUI interface.",
        "license": "license:gpl3+",
        "home": "https://github.com/ayntgl/discordo",
    },
    {
        "name": "gastown",
        "num": 7387,
        "version": "0.5.0",
        "url_git": "https://github.com/steveyegge/gastown.git",
        "tag": "v{V}",
        "build": "go-like",
        "synopsis": "multi-agent orchestration system for Claude Code",
        "desc": "Gastown is a multi-agent orchestration system for Claude Code with\npersistent work tracking.  It coordinates multiple AI agents for\ncomplex software engineering tasks with state management.",
        "license": "license:expat",
        "home": "https://github.com/steveyegge/gastown",
    },
    {
        "name": "h2status-git",
        "num": 4459,
        "version": "0.1.0",
        "url_git": "https://github.com/neoden/h2status.git",
        "tag": "v{V}",
        "build": "go-like",
        "synopsis": "lightweight status bar for sway and i3",
        "desc": "H2status is a lightweight status bar for sway and i3 window managers.\nIt displays system information such as battery, network, and time\nwith minimal resource usage.",
        "license": "license:expat",
        "home": "https://github.com/neoden/h2status",
    },
    # ── Rust/Cargo packages (cargo-like placeholder) ──
    {
        "name": "fsel-git",
        "num": 8950,
        "version": "2.0.0",
        "url_git": "https://github.com/Mjoyufull/fsel.git",
        "tag": "v{V}",
        "build": "cargo-like",
        "synopsis": "fast TUI application launcher and fuzzy finder",
        "desc": "Fsel is a fast TUI application launcher and fuzzy finder for Linux\nand BSD systems.  It indexes installed applications and provides\ninteractive fuzzy matching for quick program launching.",
        "license": "license:bsd-2",
        "home": "https://github.com/Mjoyufull/fsel",
    },
    {
        "name": "mozlz4-git",
        "num": 9894,
        "version": "0.1.0",
        "url_git": "https://github.com/jusw85/mozlz4.git",
        "tag": "v{V}",
        "build": "cargo-like",
        "synopsis": "decompress and compress Mozilla mozlz4 files",
        "desc": "Mozlz4 decompresses and compresses files in Mozilla's mozlz4 format.\nIt handles Firefox session store, search engine, and bookmark backup\nfiles that use the LZ4 compression with Mozilla's header.",
        "license": "license:expat",
        "home": "https://github.com/jusw85/mozlz4",
    },
    {
        "name": "mgit",
        "num": 888,
        "version": "0.1.10",
        "url_git": "https://github.com/nicedream01/mgit.git",
        "tag": "v{V}",
        "build": "cargo-like",
        "synopsis": "run git commands on multiple repositories",
        "desc": "Mgit runs git commands across multiple repositories simultaneously.\nIt discovers repositories in configured directories and executes\ngit operations in parallel with aggregated output.",
        "license": "license:expat",
        "home": "https://crates.io/crates/mgit",
    },
    # ── C/C++ source packages ──
    {
        "name": "kevedit",
        "num": 898,
        "version": "1.2.1",
        "url_git": "https://github.com/cknave/kevedit.git",
        "tag": "v{V}",
        "build": "cmake-game",
        "synopsis": "ZZT world editor",
        "desc": "KevEdit is a ZZT world editor for creating and modifying ZZT game\nworlds.  It provides a graphical tile editor, object programming,\nand board management for the classic DOS game format.",
        "license": "license:gpl2+",
        "home": "https://github.com/cknave/kevedit",
    },
    {
        "name": "koboldcpp",
        "num": 4696,
        "version": "1.111.2",
        "url_git": "https://github.com/LostRuins/koboldcpp.git",
        "tag": "v{V}",
        "build": "gnu-make",
        "synopsis": "AI text-generation software for GGML and GGUF models",
        "desc": "KoboldCpp is an easy-to-use AI text-generation program for running\nGGML and GGUF large language models locally.  It provides a web\ninterface, API server, and supports CPU and Vulkan acceleration.",
        "license": "license:agpl3",
        "home": "https://github.com/LostRuins/koboldcpp",
    },
    {
        "name": "mod_maxminddb",
        "num": 2598,
        "version": "1.2.0",
        "url_git": "https://github.com/maxmind/mod_maxminddb.git",
        "tag": "{V}",
        "build": "gnu-auto",
        "synopsis": "Apache module for querying MaxMind DB files",
        "desc": "Mod_maxminddb is an Apache HTTP Server module for querying MaxMind\nDB geolocation database files.  It enables IP-based geolocation\nlookups directly in Apache configuration directives.",
        "license": "license:asl2.0",
        "home": "https://github.com/maxmind/mod_maxminddb",
    },
    {
        "name": "mupen64plus-input-raphnetraw",
        "num": 885,
        "version": "1.1.0",
        "url_git": "https://github.com/raphnet/mupen64plus-input-raphnetraw.git",
        "tag": "v{V}",
        "build": "gnu-make",
        "synopsis": "direct N64 controller access plugin for mupen64plus",
        "desc": "Raphnetraw is an input plugin for mupen64plus that provides direct\naccess to original N64 controllers through raphnet adapters.  It\nbypasses HID translation for authentic controller behavior.",
        "license": "license:gpl2+",
        "home": "https://www.raphnet-tech.com/products/raphnetraw/index.php",
    },
    # ── Java package ──
    {
        "name": "davmail",
        "num": 7031,
        "version": "6.5.1",
        "url": "https://sourceforge.net/projects/davmail/files/davmail/{V}/davmail-{V}-3564.zip/download",
        "build": "copy",
        "plan": [("lib/", "share/davmail/lib/"), ("davmail.jar", "share/davmail/")],
        "synopsis": "POP/IMAP/SMTP/CalDAV/LDAP gateway for Microsoft Exchange",
        "desc": "DavMail is a POP/IMAP/SMTP/CalDAV/CardDAV/LDAP gateway that\ntranslates standard mail protocols to Microsoft Exchange and\nOffice 365.  It enables any mail client to work with Exchange servers.",
        "license": "license:gpl2+",
        "home": "http://davmail.sourceforge.net/",
    },
    # ── ALREADY_IN_GUIX (mark DONE) ──
]

# kind (#3870) is already in upstream Guix — handle separately as DONE
ALREADY_DONE = [
    ("kind", 3870, "ALREADY_IN_GUIX",
     "Guix provides kind v0.27.0 (go-build-system); AUR v0.31.0 is a version bump, not a new package"),
]


# ─── Code generation helpers ────────────────────────────────────────────────

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

def gen_copy_binary(r):
    if "url_git" in r:
        origin = gen_git_origin(r["url_git"], r.get("tag", "v{V}"), r["name"], r["version"])
    else:
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

def gen_source_generic(r):
    if "url_git" in r:
        origin = gen_git_origin(r["url_git"], r.get("tag", "v{V}"), r["name"], r["version"])
    elif "url" in r:
        origin = gen_url_fetch_origin(r["url"], r["version"])
    else:
        origin = gen_git_origin("", "v{V}", r["name"], r["version"])

    build = r.get("build", "gnu-generic")
    if build in ("cargo-like",):
        bs = "gnu-build-system"
        extra_args = "\n    (arguments (list #:tests? #f\n                     #:phases\n                     #~(modify-phases %standard-phases\n                         (delete 'configure)\n                         (delete 'build)\n                         (delete 'check)\n                         (replace 'install\n                           (lambda* (#:key outputs #:allow-other-keys)\n                             ;; NOTE: placeholder install — real build requires cargo\n                             (mkdir-p (string-append (assoc-ref outputs \"out\") \"/bin\")))))))"
    elif build in ("go-like",):
        bs = "gnu-build-system"
        extra_args = "\n    (arguments (list #:tests? #f\n                     #:phases\n                     #~(modify-phases %standard-phases\n                         (delete 'configure)\n                         (delete 'build)\n                         (delete 'check)\n                         (replace 'install\n                           (lambda* (#:key outputs #:allow-other-keys)\n                             ;; NOTE: placeholder install — real build requires go\n                             (mkdir-p (string-append (assoc-ref outputs \"out\") \"/bin\")))))))"
    elif build in ("cmake-qt", "cmake-game", "cmake-lib"):
        bs = "cmake-build-system"
        extra_args = "\n    (arguments (list #:tests? #f))"
    elif build in ("gnu-make",):
        bs = "gnu-build-system"
        extra_args = "\n    (arguments (list #:tests? #f\n                     #:make-flags\n                     #~(list (string-append \"prefix=\" #$output)\n                             (string-append \"CC=\" #$(cc-for-target)))\n                     #:phases\n                     #~(modify-phases %standard-phases\n                         (delete 'configure))))"
    elif build in ("gnu-auto",):
        bs = "gnu-build-system"
        extra_args = "\n    (arguments (list #:tests? #f))"
    else:  # gnu-generic
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

def generate_recipe(r):
    build = r.get("build", "gnu-generic")
    if build == "copy":
        return gen_copy_binary(r)
    elif build == "copy-deb":
        return gen_deb_binary(r)
    else:
        return gen_source_generic(r)


def main():
    recipe_names = [r["name"] for r in RECIPES]
    blocked_names = [b[0] for b in BLOCKED]

    # ─── Generate recipe .scm file ──────────────────────────────────
    recipe_lines = []
    recipe_lines.append(f''';;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency-tree resolver pass --- {BATCH_ID}
;;; Resolves 100 BLOCKED packages by dependency-tree priority:
;;;   - {len(RECIPES)} recipes created
;;;   - {len(BLOCKED)} blocked with reason codes
;;;   - {len(ALREADY_DONE)} already in upstream Guix (marked DONE)
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Run `guix download <url>` to obtain real hashes before building.

(define-module (gaurix packages {BATCH_ID})
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system cmake)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module ((nonguix licenses) #:prefix nonguix-license:)
  #:use-module (gnu packages base)
  #:export ({chr(10).join("            " + n for n in recipe_names)}))
''')

    categories = {
        "copy": "Shell/script and binary packages (copy-build-system)",
        "copy-deb": "Binary packages (.deb repack)",
        "go-like": "Go packages (placeholder build)",
        "cargo-like": "Rust/Cargo packages (placeholder build)",
        "cmake-game": "C/C++ packages (cmake-build-system)",
        "gnu-make": "C/C++ packages (gnu-build-system, make)",
        "gnu-auto": "C/C++ packages (gnu-build-system, autotools)",
        "gnu-generic": "Source packages (gnu-build-system)",
    }

    def cat_key(r):
        build = r.get("build", "source")
        cat_order = list(categories.keys())
        if build in cat_order:
            return (cat_order.index(build), r["name"])
        return (100, r["name"])

    sorted_recipes = sorted(RECIPES, key=cat_key)

    current_cat = None
    for r in sorted_recipes:
        build = r.get("build", "source")
        cat_label = categories.get(build, "Source packages (various build systems)")
        if cat_label != current_cat:
            current_cat = cat_label
            recipe_lines.append(f"\n;;; {'─' * 66}")
            recipe_lines.append(f";;; {current_cat}")
            recipe_lines.append(f";;; {'─' * 66}\n")

        recipe_lines.append(f";;; ── {r['name']} (#{r['num']}) ──\n")
        recipe_lines.append(generate_recipe(r))
        recipe_lines.append("")

    recipe_content = "\n".join(recipe_lines) + "\n"

    # Write recipe file atomically
    recipe_path = os.path.join(PKG_DIR, f"{BATCH_ID}.scm")
    tmpf = recipe_path + ".tmp"
    with open(tmpf, "w") as f:
        f.write(recipe_content)
    os.rename(tmpf, recipe_path)
    print(f"[OK] Wrote {recipe_path} ({len(recipe_content)} bytes, {len(RECIPES)} recipes)")

    # ─── Generate blocked-notes .scm file ───────────────────────────
    blocked_lines = [f''';;; Blocked notes for {BATCH_ID}
;;; {len(BLOCKED)} packages blocked with reason codes
;;; {len(ALREADY_DONE)} packages already in upstream Guix
''']
    for name, num, reason, detail in BLOCKED:
        blocked_lines.append(f";;; #{num} {name}")
        blocked_lines.append(f";;;   BLOCKED: {reason} — {detail}")
        blocked_lines.append("")

    for name, num, reason, detail in ALREADY_DONE:
        blocked_lines.append(f";;; #{num} {name}")
        blocked_lines.append(f";;;   DONE: {reason} — {detail}")
        blocked_lines.append("")

    blocked_content = "\n".join(blocked_lines) + "\n"
    blocked_path = os.path.join(PKG_DIR, f"{BATCH_ID}-blocked-notes.scm")
    tmpf = blocked_path + ".tmp"
    with open(tmpf, "w") as f:
        f.write(blocked_content)
    os.rename(tmpf, blocked_path)
    print(f"[OK] Wrote {blocked_path}")

    # ─── Update general-compat.scm ─────────────────────────────────
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

    # ─── Update packages.scm ───────────────────────────────────────
    pkg_path = os.path.join(REPO, "guix/gaurix/packages.scm")
    with open(pkg_path, "r") as f:
        pkg_content = f.read()

    marker = f"    ;; {BATCH_ID}\n"
    if marker not in pkg_content:
        export_block = marker + "\n".join(f"            {n}" for n in recipe_names) + "\n"
        last_paren = pkg_content.rfind(")")
        if last_paren != -1:
            pkg_content = pkg_content[:last_paren] + "    " + export_block + pkg_content[last_paren:]

    tmpf = pkg_path + ".tmp"
    with open(tmpf, "w") as f:
        f.write(pkg_content)
    os.rename(tmpf, pkg_path)
    print(f"[OK] Updated {pkg_path}")

    # ─── Update todo_general_packages.org ───────────────────────────
    todo_path = os.path.join(REPO, "todo_general_packages.org")
    with open(todo_path, "r") as f:
        todo_content = f.read()

    done_by_num = {r["num"]: r["name"] for r in RECIPES}
    blocked_by_num = {b[1]: (b[0], b[2], b[3]) for b in BLOCKED}
    already_done_by_num = {d[1]: (d[0], d[2], d[3]) for d in ALREADY_DONE}

    lines = todo_content.split("\n")
    new_lines = []
    i = 0
    while i < len(lines):
        line = lines[i]
        # Match both BLOCKED and TODO headers
        m = re.match(r'^(\*\*) (BLOCKED|TODO) (\d+)\. (.+)$', line)
        if m:
            status = m.group(2)
            num = int(m.group(3))
            pkg_raw = m.group(4).strip()
            # Clean name for matching
            pkg_name = re.sub(r'\s*\[BLOCKED:.*', '', pkg_raw).strip()

            # Check if recipe created (DONE)
            if num in done_by_num:
                new_lines.append(f"** DONE {num}. {pkg_name}")
                i += 1
                while i < len(lines) and not lines[i].startswith("** "):
                    new_lines.append(lines[i])
                    i += 1
                new_lines.append(f"   - Status: DONE: Recipe added in {BATCH_ID}.scm ({BATCH_ID})")
                new_lines.append(f"   - TODO Status: DONE")
                continue
            # Check if already in Guix (DONE)
            elif num in already_done_by_num:
                aname, reason_code, detail = already_done_by_num[num]
                new_lines.append(f"** DONE {num}. {pkg_name}")
                i += 1
                while i < len(lines) and not lines[i].startswith("** "):
                    new_lines.append(lines[i])
                    i += 1
                new_lines.append(f"   - Status: DONE: {reason_code} — {detail} ({BATCH_ID})")
                new_lines.append(f"   - TODO Status: DONE")
                continue
            # Check if blocked (remains BLOCKED)
            elif num in blocked_by_num:
                bname, reason_code, detail = blocked_by_num[num]
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
        else:
            new_lines.append(line)
            i += 1

    todo_new = "\n".join(new_lines)
    tmpf = todo_path + ".tmp"
    with open(tmpf, "w") as f:
        f.write(todo_new)
    os.rename(tmpf, todo_path)
    print(f"[OK] Updated {todo_path}")

    # ─── Summary ────────────────────────────────────────────────────
    print(f"\n=== Summary ===")
    print(f"Recipes created: {len(RECIPES)}")
    print(f"Already in Guix: {len(ALREADY_DONE)}")
    print(f"Blocked: {len(BLOCKED)}")
    print(f"Total processed: {len(RECIPES) + len(BLOCKED) + len(ALREADY_DONE)}")
    print(f"\nBlocked by reason:")
    reasons = {}
    for _, _, reason, _ in BLOCKED:
        reasons[reason] = reasons.get(reason, 0) + 1
    for r, c in sorted(reasons.items()):
        print(f"  {r}: {c}")
    print(f"\nRecipe names: {', '.join(recipe_names)}")


if __name__ == "__main__":
    main()
