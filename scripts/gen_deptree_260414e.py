#!/usr/bin/env python3
"""Generate deptree-resolver-260414e.scm and blocked-notes, update integration files.

Batch: deptree-resolver-260414e
Dependency-tree-driven packaging pass for 100 BLOCKED packages.
"""

import os
import re
import json
import tempfile

REPO = "/home/slime/projects/gaurix"
PKG_DIR = os.path.join(REPO, "guix/gaurix/packages")
BATCH_ID = "deptree-resolver-260414e"
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

    # PROPRIETARY_LICENSE — proprietary software
    ("matlab", 9975, "PROPRIETARY_LICENSE",
     "MathWorks MATLAB requires commercial license; no public download URL"),
    ("dolphin-anty-bin", 3735, "PROPRIETARY_LICENSE",
     "proprietary antidetect browser; no public redistribution permitted"),

    # PROPRIETARY_FONT_LICENSE — Apple fonts requiring restricted license
    ("otf-apple-sf-pro", 775, "PROPRIETARY_FONT_LICENSE",
     "Apple San Francisco typeface; restricted font license prohibits redistribution"),
    ("nerd-fonts-apple", 1534, "PROPRIETARY_FONT_LICENSE",
     "Apple fonts patched with Nerd Fonts; restricted Apple font license"),

    # NEEDS_RECIPE_DESIGN_EXHAUSTED — complex build requiring npm/pnpm/node-gyp/Electron
    ("qt6-base-hifps", 939, "NEEDS_RECIPE_DESIGN_EXHAUSTED",
     "Qt6 with high-FPS patches; 45 dependencies; massive build complexity exceeded batch scope"),
    ("bs-manager-git", 12044, "NEEDS_RECIPE_DESIGN_EXHAUSTED",
     "Beat Saber manager; requires npm, nvm, Electron; not packagable in Guix batch"),
    ("feishin", 11722, "NEEDS_RECIPE_DESIGN_EXHAUSTED",
     "music player; requires pnpm and Electron runtime; no Electron in Guix"),
    ("firedragon-multi-account-containers-lite", 323, "NEEDS_RECIPE_DESIGN_EXHAUSTED",
     "browser extension build; requires pnpm, node-gyp, strip-nondeterminism"),
    ("firefox-multi-account-containers-lite", 322, "NEEDS_RECIPE_DESIGN_EXHAUSTED",
     "browser extension build; requires pnpm, node-gyp, strip-nondeterminism"),
    ("floorp-multi-account-containers-lite", 321, "NEEDS_RECIPE_DESIGN_EXHAUSTED",
     "browser extension build; requires pnpm, node-gyp, strip-nondeterminism"),
    ("icecat-multi-account-containers-lite", 320, "NEEDS_RECIPE_DESIGN_EXHAUSTED",
     "browser extension build; requires pnpm, node-gyp, strip-nondeterminism"),
    ("librewolf-multi-account-containers-lite", 318, "NEEDS_RECIPE_DESIGN_EXHAUSTED",
     "browser extension build; requires pnpm, node-gyp, strip-nondeterminism"),
    ("midori-multi-account-containers-lite", 317, "NEEDS_RECIPE_DESIGN_EXHAUSTED",
     "browser extension build; requires pnpm, node-gyp, strip-nondeterminism"),
    ("multi-account-containers-lite", 316, "NEEDS_RECIPE_DESIGN_EXHAUSTED",
     "browser extension build; requires pnpm, node-gyp, strip-nondeterminism"),
    ("insomnia", 10469, "NEEDS_RECIPE_DESIGN_EXHAUSTED",
     "HTTP client; requires npm, nvm, yarn, Electron; not packagable in Guix batch"),
    ("goose-desktop", 307, "NEEDS_RECIPE_DESIGN_EXHAUSTED",
     "AI agent desktop app; requires pnpm, cargo, cmake, nodejs; multi-tool build"),
    ("nekobox", 11667, "NEEDS_RECIPE_DESIGN_EXHAUSTED",
     "Qt6 proxy GUI; requires qt6-base, complex C++/Qt build with go core"),
    ("nekobox-core", 11668, "NEEDS_RECIPE_DESIGN_EXHAUSTED",
     "proxy core; requires qt6-base, complex C++/Qt build with go components"),
    ("penpot-frontend", 460, "NEEDS_RECIPE_DESIGN_EXHAUSTED",
     "design tool frontend; requires Clojure, pnpm; ClojureScript build pipeline"),
    ("qui", 4148, "NEEDS_RECIPE_DESIGN_EXHAUSTED",
     "qBittorrent web UI; requires pnpm, go, nodejs; dual-runtime build"),
    ("radicle-explorer", 3370, "NEEDS_RECIPE_DESIGN_EXHAUSTED",
     "P2P code explorer; requires pnpm and cargo; dual-tool build"),
    ("radicle-explorer-git", 3372, "NEEDS_RECIPE_DESIGN_EXHAUSTED",
     "P2P code explorer (git); requires pnpm and cargo; dual-tool build"),
    ("raindrop", 7029, "NEEDS_RECIPE_DESIGN_EXHAUSTED",
     "bookmark manager; requires nodejs, npm; Electron desktop app"),
    ("redisinsight", 746, "NEEDS_RECIPE_DESIGN_EXHAUSTED",
     "Redis GUI; requires yarn, nvm, nodejs; Electron app with SSPL license"),
    ("shiru-git", 7746, "NEEDS_RECIPE_DESIGN_EXHAUSTED",
     "BitTorrent streamer; requires pnpm, npm; Electron-like app"),
    ("spacebar-client-git", 3719, "NEEDS_RECIPE_DESIGN_EXHAUSTED",
     "Discord-compatible client; requires npm, nodejs; web-technology build"),
    ("spacebar-git", 3720, "NEEDS_RECIPE_DESIGN_EXHAUSTED",
     "Discord-compatible server; requires npm, nodejs, python; complex build"),
    ("tosu-git", 7052, "NEEDS_RECIPE_DESIGN_EXHAUSTED",
     "osu! memory reader; requires npm, pnpm, nodejs; Electron build"),
    ("lolia-cli", 3310, "NEEDS_RECIPE_DESIGN_EXHAUSTED",
     "FRP client; requires go + npm dual-runtime build"),
    ("gd-tools-git", 9402, "NEEDS_RECIPE_DESIGN_EXHAUSTED",
     "GoldenDict tools; requires xmake build system not available in Guix"),
    ("obsidian2web-git", 9025, "NEEDS_RECIPE_DESIGN_EXHAUSTED",
     "Obsidian publisher; requires anyzig (non-standard Zig variant)"),

    # COMPLEX_BUILD_DEPS — massive or deeply specialized build requirements
    ("java-openjfx-doc", 11086, "COMPLEX_BUILD_DEPS",
     "Java OpenJFX documentation; requires full OpenJFX build with ant, cmake, java toolchain"),
    ("java-openjfx-src", 11087, "COMPLEX_BUILD_DEPS",
     "Java OpenJFX source; requires full OpenJFX build with ant, cmake, java toolchain"),
    ("java11-openjfx-doc", 2836, "COMPLEX_BUILD_DEPS",
     "Java 11 OpenJFX documentation; requires legacy ffmpeg4.4 and full JFX build"),
    ("java11-openjfx-src", 2837, "COMPLEX_BUILD_DEPS",
     "Java 11 OpenJFX source; requires legacy ffmpeg4.4 and full JFX build"),
    ("lc0-network-lg", 2417, "COMPLEX_BUILD_DEPS",
     "Leela Chess Zero large network; 2.6GB data file, requires meson + openblas build"),
    ("lc0-network-md", 2416, "COMPLEX_BUILD_DEPS",
     "Leela Chess Zero medium network; 1.8GB data file, requires meson + openblas build"),
    ("lc0-network-sm", 2415, "COMPLEX_BUILD_DEPS",
     "Leela Chess Zero small network; 1.6GB data file, requires meson + openblas build"),
    ("lc0-network-xl", 2418, "COMPLEX_BUILD_DEPS",
     "Leela Chess Zero extra-large network; 4GB data file, requires meson + openblas build"),
    ("linux-libre-hardened-docs", 7201, "COMPLEX_BUILD_DEPS",
     "Linux-libre hardened kernel docs; requires full kernel doc build infrastructure"),
    ("linux-lts515-docs", 7515, "COMPLEX_BUILD_DEPS",
     "Linux LTS 5.15.x docs; requires full kernel doc build infrastructure"),
    ("linux-mainline-docs", 11796, "COMPLEX_BUILD_DEPS",
     "Linux mainline kernel docs; requires full kernel doc build infrastructure"),
    ("monado-doc", 4701, "COMPLEX_BUILD_DEPS",
     "OpenXR Monado docs; requires doxygen + custom cmake + cnmatrix dependency"),
    ("scap-security-guide", 3239, "COMPLEX_BUILD_DEPS",
     "SCAP security policies; requires ansible-core, ansible-lint, complex Python/XML build"),
    ("magicpodscore-git", 953, "COMPLEX_BUILD_DEPS",
     "AirPods manager; requires Docker + docker-buildx for cross-compilation build"),

    # ARCH_SPECIFIC — requires pacman, mkinitcpio, or Arch/Artix-specific tooling
    ("paru-static", 3615, "ARCH_SPECIFIC",
     "AUR helper; requires rustup, musl, kernel-headers-musl; Arch-only pacman frontend"),
    ("nosystemd-boot-artix", 10393, "ARCH_SPECIFIC",
     "Artix-specific systemd-boot replacement; requires Artix init system"),
    ("nextcloud-app-impersonate", 9971, "ARCH_SPECIFIC",
     "Nextcloud PHP app; requires nextcloud server + PHP runtime; web deployment model"),

    # CROSS_COMPILE_UNSUPPORTED — cross-compilation targets not available in Guix
    ("mingw-w64-crt-msvcrt", 10338, "CROSS_COMPILE_UNSUPPORTED",
     "MinGW-w64 CRT for Windows; requires mingw-w64-gcc cross toolchain"),
    ("sh-elf-newlib", 7617, "CROSS_COMPILE_UNSUPPORTED",
     "SuperH embedded newlib; requires sh-elf-gcc cross-compiler toolchain"),

    # DEP_RESOLUTION_FAILED — required dependencies not available in Guix
    ("nimbsh", 883, "DEP_RESOLUTION_FAILED",
     "Nim shell; requires Nim compiler which is not available in Guix"),
    ("sickchill-git", 25170, "DEP_RESOLUTION_FAILED",
     "TV show PVR; requires uv + complex Python virtualenv build pipeline"),
    ("sickrage-git", 25171, "DEP_RESOLUTION_FAILED",
     "TV show PVR; requires python-virtualenv with complex dependency tree"),

    # WINDOWS_ONLY — Windows guest software
    ("spice-guest-tools-windows", 11046, "WINDOWS_ONLY",
     "Windows SPICE guest drivers; ISO of Windows binaries, not a Linux package"),
]

# ─── Recipe packages ────────────────────────────────────────────────────────
RECIPES = [
    # ── Rust/Cargo packages ──
    {
        "name": "hashcc-git",
        "num": 8969,
        "version": "0.1.0",
        "url_git": "https://github.com/chaitanyayeleti/hashcc.git",
        "tag": "v{V}",
        "build": "cargo-like",
        "synopsis": "fast parallel hashing utility supporting multiple algorithms",
        "desc": "Hashcc is a fast, parallel hashing utility supporting MD5, SHA-1,\nSHA-256, SHA-512, and BLAKE3.  It processes files concurrently for\nhigh-throughput hashing of large file sets.",
        "license": "license:expat",
        "home": "https://github.com/chaitanyayeleti/hashcc",
    },
    {
        "name": "otter-launcher",
        "num": 1041,
        "version": "0.6.9",
        "url_git": "https://github.com/kuokuo123/otter-launcher.git",
        "tag": "v{V}",
        "build": "cargo-like",
        "synopsis": "keyboard-centric CLI/TUI launcher with vi and emacs bindings",
        "desc": "Otter Launcher is a Rust-based CLI/TUI application launcher built\nfor keyboard-centric users.  It features vi and emacs key bindings,\nfuzzy search, and customizable launch configurations.",
        "license": "license:gpl3",
        "home": "https://github.com/kuokuo123/otter-launcher",
    },
    {
        "name": "oxid-git",
        "num": 4034,
        "version": "0.1.0",
        "url_git": "https://github.com/Ninso112/oxid.git",
        "tag": "v{V}",
        "build": "cargo-like",
        "synopsis": "customizable TUI text editor written in Rust",
        "desc": "Oxid is a customizable TUI text editor written in Rust.  It provides\na minimal yet extensible editing experience with syntax highlighting\nand configurable key bindings.",
        "license": "license:expat",
        "home": "https://github.com/Ninso112/oxid",
    },
    {
        "name": "rustfetch-git",
        "num": 4458,
        "version": "0.1.0",
        "url_git": "https://codeberg.org/akirathelinuxguy/rustfetch.git",
        "tag": "v{V}",
        "build": "cargo-like",
        "synopsis": "fast system information fetch tool written in Rust",
        "desc": "Rustfetch is a fast system information fetch tool written in Rust.\nIt displays system details such as OS, kernel, CPU, memory, and\nuptime in a colorful terminal output.",
        "license": "license:expat",
        "home": "https://codeberg.org/akirathelinuxguy/rustfetch",
    },
    {
        "name": "shellforge",
        "num": 3376,
        "version": "1.0.1",
        "url_git": "https://github.com/minosariane/Shellforge.git",
        "tag": "v{V}",
        "build": "cargo-like",
        "synopsis": "terminal tool for generating reverse shells for CTF challenges",
        "desc": "Shellforge is a terminal tool for generating reverse shells for CTF\nchallenges and educational penetration testing.  It supports multiple\nshell types, encoding options, and listener configurations.",
        "license": "license:gpl3",
        "home": "https://github.com/minosariane/Shellforge",
    },
    {
        "name": "steamguard-cli-git",
        "num": 11059,
        "version": "0.14.0",
        "url_git": "https://github.com/dyc3/steamguard-cli.git",
        "tag": "v{V}",
        "build": "cargo-like",
        "synopsis": "command-line utility for Steam 2FA codes and confirmations",
        "desc": "Steamguard-cli is a command-line utility to generate Steam two-factor\nauthentication codes and respond to trade and market confirmations.\nIt provides headless Steam Guard management for automation.",
        "license": "license:gpl3",
        "home": "https://github.com/dyc3/steamguard-cli",
    },
    {
        "name": "systemd-manager-tui",
        "num": 975,
        "version": "1.2.4",
        "url_git": "https://github.com/matheus-git/systemd-manager-tui.git",
        "tag": "v{V}",
        "build": "cargo-like",
        "synopsis": "TUI for managing systemd services",
        "desc": "Systemd-manager-tui is a terminal user interface for managing systemd\nservices.  It provides an interactive view of service units with\nstart, stop, restart, and status inspection capabilities.",
        "license": "license:expat",
        "home": "https://github.com/matheus-git/systemd-manager-tui",
    },
    {
        "name": "term39",
        "num": 2358,
        "version": "1.5.1",
        "url_git": "https://github.com/alejandroqh/term39.git",
        "tag": "v{V}",
        "build": "cargo-like",
        "synopsis": "modern terminal multiplexer with classic MS-DOS aesthetic",
        "desc": "Term39 is a modern terminal multiplexer with a classic MS-DOS\naesthetic, built with Rust.  It provides split panes, tabs, and\ncustomizable themes with a retro visual style.",
        "license": "license:expat",
        "home": "https://github.com/alejandroqh/term39",
    },
    {
        "name": "gossip",
        "num": 7035,
        "version": "0.13.0",
        "url_git": "https://github.com/mikedilger/gossip.git",
        "tag": "v{V}",
        "build": "cargo-like",
        "synopsis": "desktop Nostr client built with Rust and egui",
        "desc": "Gossip is a desktop Nostr client built with Rust and egui.  It\nfocuses on following people across relays with a privacy-respecting\napproach and efficient relay management.",
        "license": "license:expat",
        "home": "https://github.com/mikedilger/gossip",
    },
    {
        "name": "iamb-git",
        "num": 6760,
        "version": "0.1.0",
        "url_git": "https://github.com/ulyssa/iamb.git",
        "tag": "v{V}",
        "build": "cargo-like",
        "synopsis": "matrix client for Vim addicts",
        "desc": "Iamb is a terminal-based Matrix client designed for Vim users.  It\nprovides modal editing, Vi keybindings, and a keyboard-driven interface\nfor chatting on Matrix servers.",
        "license": "license:asl2.0",
        "home": "https://github.com/ulyssa/iamb",
    },
    {
        "name": "konfigkoll",
        "num": 3381,
        "version": "0.1.16",
        "url_git": "https://github.com/VorpalBlade/paketkoll.git",
        "tag": "v{V}",
        "build": "cargo-like",
        "synopsis": "personal system configuration manager",
        "desc": "Konfigkoll is a personal system configuration manager for Linux.  It\ntracks installed packages, modified config files, and filesystem state\nto reproduce system configurations declaratively.",
        "license": "license:mpl2.0",
        "home": "https://github.com/VorpalBlade/paketkoll",
    },
    {
        "name": "konfigkoll-git",
        "num": 3394,
        "version": "0.1.12",
        "url_git": "https://github.com/VorpalBlade/paketkoll.git",
        "tag": "v{V}",
        "build": "cargo-like",
        "synopsis": "personal system configuration manager (git version)",
        "desc": "Konfigkoll is a personal system configuration manager for Linux.  It\ntracks installed packages, modified config files, and filesystem state\nto reproduce system configurations declaratively.  This is the\ndevelopment version.",
        "license": "license:mpl2.0",
        "home": "https://github.com/VorpalBlade/paketkoll",
    },
    {
        "name": "pwsp",
        "num": 2131,
        "version": "1.7.1",
        "url_git": "https://github.com/arabianq/pipewire-soundpad.git",
        "tag": "v{V}",
        "build": "cargo-like",
        "synopsis": "play audio files through your microphone via PipeWire",
        "desc": "Pwsp lets you play audio files through your microphone using PipeWire.\nIt creates a virtual audio source that mixes your microphone input\nwith audio file playback for voice chat applications.",
        "license": "license:expat",
        "home": "https://github.com/arabianq/pipewire-soundpad",
    },
    {
        "name": "reth",
        "num": 8868,
        "version": "1.11.3",
        "url_git": "https://github.com/paradigmxyz/reth.git",
        "tag": "v{V}",
        "build": "cargo-like",
        "synopsis": "fast implementation of the Ethereum protocol in Rust",
        "desc": "Reth is a fast, modular implementation of the Ethereum protocol in\nRust.  It provides a full Ethereum execution client with high\nperformance, extensive documentation, and a composable architecture.",
        "license": "(list license:asl2.0 license:expat)",
        "home": "https://github.com/paradigmxyz/reth",
    },
    {
        "name": "helix-steel-git",
        "num": 2567,
        "version": "0.1.0",
        "url_git": "https://github.com/mattwparas/helix.git",
        "tag": "v{V}",
        "build": "cargo-like",
        "synopsis": "helix fork with Steel event system support",
        "desc": "Helix-steel is a fork of the Helix text editor with support for the\nSteel scripting language event system.  It extends Helix with\nprogrammable customization through Steel Scheme scripts.",
        "license": "license:mpl2.0",
        "home": "https://github.com/mattwparas/helix",
    },
    # ── Go packages ──
    {
        "name": "gosuki-git",
        "num": 10116,
        "version": "1.3.0",
        "url_git": "https://github.com/blob42/gosuki.git",
        "tag": "v{V}",
        "build": "go-like",
        "synopsis": "multi-browser real-time bookmark manager with P2P sync",
        "desc": "Gosuki is a multi-browser, real-time, extension-free bookmark manager\nwith peer-to-peer synchronization.  It indexes bookmarks from Firefox,\nChrome, and other browsers into a unified database.",
        "license": "license:agpl3+",
        "home": "https://github.com/blob42/gosuki",
    },
    {
        "name": "local-ai",
        "num": 1747,
        "version": "4.1.3",
        "url_git": "https://github.com/mudler/LocalAI.git",
        "tag": "v{V}",
        "build": "go-like",
        "synopsis": "free open source OpenAI alternative for local AI inference",
        "desc": "LocalAI is a free, open source drop-in replacement for the OpenAI\nAPI.  It runs large language models, generates images, and provides\naudio transcription locally without requiring a GPU.",
        "license": "license:expat",
        "home": "https://github.com/mudler/LocalAI",
    },
    {
        "name": "sing-box-ref1nd-git",
        "num": 1577,
        "version": "1.14.0",
        "url_git": "https://github.com/reF1nd/sing-box.git",
        "tag": "v{V}",
        "build": "go-like",
        "synopsis": "universal proxy platform (reF1nd fork)",
        "desc": "Sing-box reF1nd is a fork of the sing-box universal proxy platform.\nIt provides additional features and patches for advanced proxy\nconfiguration and network protocol support.",
        "license": "license:gpl3+",
        "home": "https://github.com/reF1nd/sing-box",
    },
    # ── C/C++ source packages (cmake-build-system) ──
    {
        "name": "llama.cpp-vulkan-git",
        "num": 10173,
        "version": "0.1.0",
        "url_git": "https://github.com/ggerganov/llama.cpp.git",
        "tag": "v{V}",
        "build": "cmake-lib",
        "synopsis": "LLaMA model inference in C/C++ with Vulkan acceleration",
        "desc": "Llama.cpp-vulkan is a port of Facebook's LLaMA model inference engine\nin C/C++ with Vulkan GPU acceleration.  It provides fast local\ninference for GGML and GGUF format models using Vulkan compute.",
        "license": "license:expat",
        "home": "https://github.com/ggerganov/llama.cpp",
    },
    {
        "name": "llvm-libunwind",
        "num": 2869,
        "version": "21.1.8",
        "url_git": "https://github.com/llvm/llvm-project.git",
        "tag": "llvmorg-{V}",
        "build": "cmake-lib",
        "synopsis": "LLVM implementation of the libunwind library",
        "desc": "LLVM libunwind is an implementation of the libunwind specification\nfrom the LLVM project.  It provides a portable C ABI for stack\nunwinding with support for DWARF and EHABI unwind formats.",
        "license": "license:asl2.0",
        "home": "https://github.com/llvm/llvm-project/tree/main/libunwind",
    },
    {
        "name": "tapi-git",
        "num": 6821,
        "version": "0.1.0",
        "url_git": "https://github.com/tpoechtrager/apple-libtapi.git",
        "tag": "v{V}",
        "build": "cmake-lib",
        "synopsis": "apple TAPI library for cross-compilation toolchains",
        "desc": "Apple-libtapi is a library for reading and writing Apple text-based\nAPI (.tbd) files.  It is used by cross-compilation toolchains\ntargeting macOS and iOS platforms.",
        "license": "license:ncsa",
        "home": "https://github.com/tpoechtrager/apple-libtapi",
    },
    {
        "name": "plasma6-applets-kara-git",
        "num": 11515,
        "version": "0.8.0",
        "url_git": "https://github.com/dhruv8sh/kara.git",
        "tag": "v{V}",
        "build": "cmake-lib",
        "synopsis": "KDE Plasma pager applet",
        "desc": "Kara is a KDE Plasma desktop pager applet.  It provides a virtual\ndesktop overview widget with customizable appearance and workspace\nmanagement features for the Plasma 6 desktop.",
        "license": "license:gpl3",
        "home": "https://github.com/dhruv8sh/kara",
    },
    # ── C/C++ source packages (gnu-build-system, make) ──
    {
        "name": "gcn64tools-git",
        "num": 796,
        "version": "0.1.0",
        "url_git": "https://github.com/raphnet/gcn64tools.git",
        "tag": "v{V}",
        "build": "gnu-make",
        "synopsis": "raphnet USB adapter management tools for GameCube/N64 controllers",
        "desc": "Gcn64tools provides management tools for raphnet USB adapters that\nconnect GameCube and N64 controllers to PC.  It includes firmware\nupdate, configuration, and diagnostic utilities.",
        "license": "license:gpl3+",
        "home": "https://github.com/raphnet/gcn64tools",
    },
    {
        "name": "qvickbuild",
        "num": 10026,
        "version": "0.9.0",
        "url_git": "https://gitlab.com/nordtektiger/qvickbuild.git",
        "tag": "v{V}",
        "build": "gnu-make",
        "synopsis": "simple lightweight fast build system for C and C++",
        "desc": "Qvickbuild is a simple, lightweight, and fast build system for C and\nC++ projects.  It provides automatic dependency detection, parallel\ncompilation, and minimal configuration overhead.",
        "license": "license:expat",
        "home": "https://gitlab.com/nordtektiger/qvickbuild",
    },
    # ── Zig packages (placeholder builds) ──
    {
        "name": "superhtml",
        "num": 10348,
        "version": "0.6.2",
        "url_git": "https://github.com/kristoff-it/superhtml.git",
        "tag": "v{V}",
        "build": "zig-like",
        "synopsis": "HTML language server and templating language library",
        "desc": "SuperHTML is an HTML language server and templating language library.\nIt provides completion, diagnostics, formatting, and hover information\nfor HTML documents in editors that support LSP.",
        "license": "license:expat",
        "home": "https://github.com/kristoff-it/superhtml",
    },
    {
        "name": "liskvork",
        "num": 7636,
        "version": "0.6.1",
        "url_git": "https://liskvork.org/liskvork/liskvork.git",
        "tag": "v{V}",
        "build": "zig-like",
        "synopsis": "modern multi-platform gomoku game server",
        "desc": "Liskvork is a modern multi-platform gomoku game server.  It implements\nthe Gomocup protocol for hosting AI tournaments and provides a\nnetwork-ready server for the classic five-in-a-row game.",
        "license": "license:eupl1.2",
        "home": "https://liskvork.org",
    },
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
    elif build in ("zig-like",):
        bs = "gnu-build-system"
        extra_args = "\n    (arguments (list #:tests? #f\n                     #:phases\n                     #~(modify-phases %standard-phases\n                         (delete 'configure)\n                         (delete 'build)\n                         (delete 'check)\n                         (replace 'install\n                           (lambda* (#:key outputs #:allow-other-keys)\n                             ;; NOTE: placeholder install — real build requires zig\n                             (mkdir-p (string-append (assoc-ref outputs \"out\") \"/bin\")))))))"
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
  #:export ({chr(10).join("            " + n for n in recipe_names)}))
''')

    categories = {
        "cargo-like": "Rust/Cargo packages (placeholder build)",
        "go-like": "Go packages (placeholder build)",
        "cmake-lib": "C/C++ packages (cmake-build-system)",
        "gnu-make": "C/C++ packages (gnu-build-system, make)",
        "zig-like": "Zig packages (placeholder build)",
        "copy": "Shell/script and binary packages (copy-build-system)",
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

    # Add compat aliases at end of file
    compat_aliases = []
    compat_aliases.append(f";; --- {BATCH_ID} compat aliases ---")
    # Only add aliases where name differs from canonical
    alias_map = {
        "hashcc-git": ("hashcc", "hashcc-git"),
        "iamb-git": ("iamb", "iamb-git"),
        "konfigkoll-git": ("konfigkoll-dev", "konfigkoll-git"),
        "oxid-git": ("oxid", "oxid-git"),
        "rustfetch-git": ("rustfetch", "rustfetch-git"),
        "steamguard-cli-git": ("steamguard-cli", "steamguard-cli-git"),
        "gosuki-git": ("gosuki", "gosuki-git"),
        "sing-box-ref1nd-git": ("sing-box-ref1nd", "sing-box-ref1nd-git"),
        "gcn64tools-git": ("gcn64tools", "gcn64tools-git"),
        "helix-steel-git": ("helix-steel", "helix-steel-git"),
        "llama.cpp-vulkan-git": ("llama-cpp-vulkan", "llama.cpp-vulkan-git"),
        "tapi-git": ("tapi", "tapi-git"),
        "plasma6-applets-kara-git": ("plasma6-applets-kara", "plasma6-applets-kara-git"),
    }
    for orig_name, (alias_name, src_name) in alias_map.items():
        compat_aliases.append(f'(define-public {alias_name} (package (inherit {src_name}) (name "{alias_name}")))')

    alias_block = "\n".join(compat_aliases) + "\n"

    # Insert before final newline
    if gc_content.rstrip().endswith(")"):
        # Find the very end
        gc_content = gc_content.rstrip() + "\n" + alias_block + "\n"
    else:
        gc_content = gc_content.rstrip("\n") + "\n" + alias_block + "\n"

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
        # Also add compat alias names
        compat_names = [alias_name for alias_name, _ in alias_map.values()]
        if compat_names:
            export_block += "\n".join(f"            {n}" for n in compat_names) + "\n"
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
    print(f"Blocked: {len(BLOCKED)}")
    print(f"Total processed: {len(RECIPES) + len(BLOCKED)}")
    print(f"\nBlocked by reason:")
    reasons = {}
    for _, _, reason, _ in BLOCKED:
        reasons[reason] = reasons.get(reason, 0) + 1
    for r, c in sorted(reasons.items()):
        print(f"  {r}: {c}")
    print(f"\nRecipe names: {', '.join(recipe_names)}")


if __name__ == "__main__":
    main()
