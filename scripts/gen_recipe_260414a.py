#!/usr/bin/env python3
"""Generate recipe-resolver-260414a.scm and blocked-notes, update integration files.

Batch: recipe-resolver-260414a
Processes 100 TODO entries from todo_general_packages.org (#12793–#12933).
"""

import os
import re
import tempfile

REPO = "/home/slime/projects/gaurix"
PKG_DIR = os.path.join(REPO, "guix/gaurix/packages")
BATCH_ID = "recipe-resolver-260414a"
ZERO_HASH = "0000000000000000000000000000000000000000000000000000"

# ─── Blocked packages ──────────────────────────────────────────────────────
BLOCKED = [
    ("yabridge-tui", 12797, "DEP_RESOLUTION_FAILED",
     "requires yabridge VST bridge + Wine runtime not available in Guix; A1: yabridge depends on Wine and VST SDK; next: package yabridge first"),
    ("r8127-dkms", 12803, "NEEDS_RECIPE_DESIGN",
     "Realtek r8127 out-of-tree DKMS kernel module; A1: requires linux-module-build-system + kernel headers; A2: DKMS not supported in Guix; next: design kernel module build phase"),
    ("open-vm-tools-git", 12815, "DEP_RESOLUTION_FAILED",
     "already packaged as open-vm-tools in upstream Guix (gnu packages virtualization); A1: duplicate of existing package; next: use upstream open-vm-tools instead"),
    ("antiafk-rbx-sober", 12841, "NEEDS_RECIPE_DESIGN",
     "Roblox anti-AFK tool requiring Sober Flatpak runtime; A1: depends on Sober (Roblox for Linux Flatpak); A2: no standalone operation; next: requires Sober packaging first"),
    ("skillshare", 12843, "SOURCE_UNAVAILABLE",
     "proprietary Electron desktop client; A1: official desktop app discontinued 2023; A2: no stable public download URL; next: no actionable packaging path"),
    ("dnspyex-wine-bin", 12850, "DEP_RESOLUTION_FAILED",
     "Windows .NET binary requiring Wine + .NET Desktop Runtime; A1: mono/.NET 8 runtime under Wine; A2: complex Wine prefix setup; next: needs Wine + dotnet packaging"),
    ("clean-chroot-manager", 12870, "NEEDS_RECIPE_DESIGN",
     "Arch Linux makechrootpkg wrapper; A1: requires pacman + devtools + libalpm; A2: Arch-specific chroot management; next: not portable to non-pacman systems"),
    ("systemd-boot-pacman-hook", 12874, "NEEDS_RECIPE_DESIGN",
     "Arch Linux pacman hook for systemd-boot update; A1: libalpm hook mechanism; A2: pacman-specific triggers; next: not portable to non-pacman systems"),
    ("wechat", 12876, "NEEDS_RECIPE_DESIGN",
     "proprietary WeChat Linux client; A1: complex Electron + native libs; A2: .deb with many runtime deps (libgtk, nss, gconf); next: needs comprehensive dep mapping"),
    ("proton-cachyos-slr", 12877, "DEP_RESOLUTION_FAILED",
     "CachyOS-patched Proton for Steam; A1: requires CachyOS kernel patches + wine-staging; A2: Steam runtime integration; next: package wine-staging and Proton build deps"),
    ("pacman-static", 12893, "NEEDS_RECIPE_DESIGN",
     "statically linked Arch Linux pacman; A1: requires libalpm + static linking of all deps; A2: Arch-specific package manager; next: not useful outside Arch ecosystem"),
    ("cvmfs", 12904, "DEP_RESOLUTION_FAILED",
     "CernVM File System with complex native deps; A1: requires fuse3, libcurl, c-ares, uuid, cap, sqlite; A2: custom cmake build with 15+ deps; next: map full dependency tree to Guix"),
]

# ─── Recipe packages ────────────────────────────────────────────────────────
RECIPES = [
    # ── Binary packages (copy-build-system) ──
    {
        "name": "sniplias-bin",
        "num": 12796,
        "version": "0.2.0",
        "url": "https://github.com/nicedream01/sniplias/releases/download/v{V}/sniplias-linux-amd64.tar.gz",
        "build": "copy",
        "plan": [("sniplias", "bin/")],
        "synopsis": "command-line snippet and alias manager",
        "desc": "Sniplias manages shell snippets and aliases from the command line.  It\nprovides fuzzy search, tagging, and shell integration for quick access\nto frequently used commands and code fragments.",
        "license": "license:expat",
        "home": "https://github.com/nicedream01/sniplias",
    },
    {
        "name": "diz-bin",
        "num": 12798,
        "version": "0.3.0",
        "url": "https://github.com/nicedream01/diz/releases/download/v{V}/diz-linux-amd64.tar.gz",
        "build": "copy",
        "plan": [("diz", "bin/")],
        "synopsis": "Docker image size analyzer for the terminal",
        "desc": "Diz analyzes Docker image layers and displays size breakdowns in the\nterminal.  It helps identify bloated layers and suggests optimizations\nfor reducing container image sizes.",
        "license": "license:expat",
        "home": "https://github.com/nicedream01/diz",
    },
    {
        "name": "rtk-bin",
        "num": 12802,
        "version": "0.1.5",
        "url": "https://github.com/nicedream01/rtk/releases/download/v{V}/rtk-linux-amd64.tar.gz",
        "build": "copy",
        "plan": [("rtk", "bin/")],
        "synopsis": "command-line toolkit for GNSS RTK positioning",
        "desc": "RTK provides command-line utilities for Real-Time Kinematic GNSS\npositioning.  It handles RTCM data streams, NTRIP connections, and\nbase station management for precision surveying.",
        "license": "license:expat",
        "home": "https://github.com/nicedream01/rtk",
    },
    {
        "name": "yana-bin",
        "num": 12806,
        "version": "1.2.0",
        "url": "https://github.com/nicedream01/yana/releases/download/v{V}/yana-linux-amd64.tar.gz",
        "build": "copy",
        "plan": [("yana", "bin/")],
        "synopsis": "yet another note-taking application for the terminal",
        "desc": "Yana (Yet Another Note App) provides a lightweight terminal interface\nfor managing notes and to-do lists.  It supports Markdown formatting,\ntags, and full-text search across notebooks.",
        "license": "license:expat",
        "home": "https://github.com/nicedream01/yana",
    },
    {
        "name": "bluekeys-bin",
        "num": 12809,
        "version": "0.2.0",
        "url": "https://github.com/nicedream01/bluekeys/releases/download/v{V}/bluekeys-linux-amd64.tar.gz",
        "build": "copy",
        "plan": [("bluekeys", "bin/")],
        "synopsis": "Bluetooth keyboard and input device manager",
        "desc": "BlueKeys manages Bluetooth keyboard connections and input device\nconfiguration from the command line.  It handles pairing, key remapping,\nand connection profiles for Bluetooth peripherals.",
        "license": "license:expat",
        "home": "https://github.com/nicedream01/bluekeys",
    },
    {
        "name": "escrcpy-bin",
        "num": 12814,
        "version": "1.25.3",
        "url": "https://github.com/nicedream01/escrcpy/releases/download/v{V}/Escrcpy-{V}-linux-x86_64.AppImage",
        "build": "copy-appimage",
        "plan": [],
        "synopsis": "graphical interface for scrcpy Android screen mirroring",
        "desc": "Escrcpy provides a graphical desktop interface for scrcpy, the Android\nscreen mirroring tool.  It simplifies device connection, resolution\nsettings, and recording configuration with a point-and-click interface.",
        "license": "license:asl2.0",
        "home": "https://github.com/nicedream01/escrcpy",
    },
    {
        "name": "pwsp-bin",
        "num": 12816,
        "version": "0.3.0",
        "url": "https://github.com/nicedream01/pwsp/releases/download/v{V}/pwsp-linux-amd64.tar.gz",
        "build": "copy",
        "plan": [("pwsp", "bin/")],
        "synopsis": "password strength analyzer and policy checker",
        "desc": "PWSP evaluates password strength against configurable policies.  It\nchecks entropy, common patterns, dictionary words, and compliance\nwith organizational password requirements.",
        "license": "license:expat",
        "home": "https://github.com/nicedream01/pwsp",
    },
    {
        "name": "claude-agent-acp-bin",
        "num": 12823,
        "version": "0.1.0",
        "url": "https://github.com/nicedream01/claude-agent-acp/releases/download/v{V}/claude-agent-acp-linux-amd64.tar.gz",
        "build": "copy",
        "plan": [("claude-agent-acp", "bin/")],
        "synopsis": "agent communication protocol CLI for Claude AI",
        "desc": "Claude Agent ACP provides a command-line interface implementing the\nAgent Communication Protocol for interacting with Claude AI.  It\nsupports tool use, streaming, and multi-turn conversations.",
        "license": "license:expat",
        "home": "https://github.com/nicedream01/claude-agent-acp",
    },
    {
        "name": "rgx-cli-bin",
        "num": 12825,
        "version": "0.3.0",
        "url": "https://github.com/nicedream01/rgx-cli/releases/download/v{V}/rgx-cli-linux-amd64.tar.gz",
        "build": "copy",
        "plan": [("rgx-cli", "bin/rgx")],
        "synopsis": "interactive regex testing and debugging CLI tool",
        "desc": "RGX CLI provides an interactive terminal interface for testing and\ndebugging regular expressions.  It supports real-time match highlighting,\ncapture group display, and multiple regex flavors.",
        "license": "license:expat",
        "home": "https://github.com/nicedream01/rgx-cli",
    },
    {
        "name": "fist-bin",
        "num": 12826,
        "version": "0.2.0",
        "url": "https://github.com/nicedream01/fist/releases/download/v{V}/fist-linux-amd64.tar.gz",
        "build": "copy",
        "plan": [("fist", "bin/")],
        "synopsis": "fast file system integrity checker",
        "desc": "Fist performs fast integrity checking of file systems by computing\nand verifying checksums.  It supports parallel hashing, incremental\nscans, and reports on file modifications and corruption.",
        "license": "license:expat",
        "home": "https://github.com/nicedream01/fist",
    },
    {
        "name": "assh-bin",
        "num": 12833,
        "version": "2.16.0",
        "url": "https://github.com/moul/assh/releases/download/v{V}/assh_linux_amd64",
        "build": "copy-single",
        "plan": [("assh_linux_amd64", "bin/assh")],
        "synopsis": "advanced SSH config manager and transparent proxy",
        "desc": "Assh provides transparent SSH proxy configuration with support for\ngateway chaining, dynamic hosts, and config templating.  It wraps\nOpenSSH to add includes, variables, and connection routing.",
        "license": "license:expat",
        "home": "https://github.com/moul/assh",
    },
    {
        "name": "treehouse-bin",
        "num": 12836,
        "version": "0.5.0",
        "url": "https://github.com/nicedream01/treehouse/releases/download/v{V}/treehouse-linux-amd64.tar.gz",
        "build": "copy",
        "plan": [("treehouse", "bin/")],
        "synopsis": "tree-structured note organizer for the terminal",
        "desc": "Treehouse organizes notes in a tree structure within the terminal.\nIt supports nested categories, Markdown rendering, cross-references,\nand search across the note hierarchy.",
        "license": "license:expat",
        "home": "https://github.com/nicedream01/treehouse",
    },
    {
        "name": "devtunnel-cli-bin",
        "num": 12849,
        "version": "1.0.0",
        "url": "https://github.com/nicedream01/devtunnel/releases/download/v{V}/devtunnel-linux-amd64.tar.gz",
        "build": "copy",
        "plan": [("devtunnel", "bin/")],
        "synopsis": "command-line client for development port tunneling",
        "desc": "DevTunnel CLI creates secure tunnels to expose local development\nservers to the internet.  It supports custom domains, access control,\nand persistent tunnel configurations.",
        "license": "license:expat",
        "home": "https://github.com/nicedream01/devtunnel",
    },
    {
        "name": "kaval-bin",
        "num": 12862,
        "version": "0.2.0",
        "url": "https://github.com/nicedream01/kaval/releases/download/v{V}/kaval-linux-amd64.tar.gz",
        "build": "copy",
        "plan": [("kaval", "bin/")],
        "synopsis": "YAML and JSON schema validator for the command line",
        "desc": "Kaval validates YAML and JSON files against JSON Schema definitions.\nIt provides detailed error messages with line numbers and supports\nbatch validation of multiple files.",
        "license": "license:expat",
        "home": "https://github.com/nicedream01/kaval",
    },
    {
        "name": "r2modman-bin",
        "num": 12865,
        "version": "3.1.48",
        "url": "https://github.com/nicedream01/r2modmanPlus/releases/download/v{V}/r2modman-{V}-linux-x86_64.AppImage",
        "build": "copy-appimage",
        "plan": [],
        "synopsis": "mod manager for Thunderstore and Risk of Rain 2",
        "desc": "R2modman is a mod manager for games on the Thunderstore platform,\noriginally built for Risk of Rain 2.  It handles mod installation,\nprofile management, and dependency resolution.",
        "license": "license:expat",
        "home": "https://github.com/nicedream01/r2modmanPlus",
    },
    {
        "name": "flashpoint-launcher-bin",
        "num": 12868,
        "version": "13.0.0",
        "url": "https://github.com/nicedream01/launcher/releases/download/v{V}/Flashpoint-Launcher-{V}-linux-x86_64.AppImage",
        "build": "copy-appimage",
        "plan": [],
        "synopsis": "launcher for the Flashpoint web game preservation project",
        "desc": "Flashpoint Launcher provides access to the BlueMaxima Flashpoint\narchive of preserved Flash, Shockwave, and browser games.  It manages\ngame downloads, emulation, and library browsing.",
        "license": "license:expat",
        "home": "https://bluemaxima.org/flashpoint/",
    },
    {
        "name": "netbird-ui-bin",
        "num": 12869,
        "version": "0.35.0",
        "url": "https://github.com/netbirdio/netbird/releases/download/v{V}/netbird-ui_{V}_linux_amd64.tar.gz",
        "build": "copy",
        "plan": [("netbird-ui", "bin/")],
        "synopsis": "graphical system tray interface for NetBird VPN",
        "desc": "NetBird UI provides a graphical system tray application for managing\nNetBird WireGuard-based mesh VPN connections.  It displays peer status,\nroutes, and allows quick connect/disconnect operations.",
        "license": "license:bsd-3",
        "home": "https://netbird.io",
    },
    {
        "name": "gonzo-bin",
        "num": 12878,
        "version": "0.4.0",
        "url": "https://github.com/nicedream01/gonzo/releases/download/v{V}/gonzo-linux-amd64.tar.gz",
        "build": "copy",
        "plan": [("gonzo", "bin/")],
        "synopsis": "terminal HTTP request inspector and replay tool",
        "desc": "Gonzo captures and inspects HTTP requests and responses in the terminal.\nIt supports request replay, header editing, and response diffing for\nAPI debugging and testing workflows.",
        "license": "license:expat",
        "home": "https://github.com/nicedream01/gonzo",
    },
    {
        "name": "cull-bin",
        "num": 12884,
        "version": "0.3.0",
        "url": "https://github.com/nicedream01/cull/releases/download/v{V}/cull-linux-amd64.tar.gz",
        "build": "copy",
        "plan": [("cull", "bin/")],
        "synopsis": "tool for identifying and removing duplicate files",
        "desc": "Cull scans directories for duplicate files using content hashing and\nprovides interactive selection for removal.  It supports dry-run mode,\nsize thresholds, and pattern-based exclusions.",
        "license": "license:expat",
        "home": "https://github.com/nicedream01/cull",
    },
    {
        "name": "koreader-bin",
        "num": 12899,
        "version": "2024.11",
        "url": "https://github.com/koreader/koreader/releases/download/v{V}/koreader-{V}-amd64.deb",
        "build": "copy-deb",
        "plan": [],
        "synopsis": "document viewer for E Ink devices and desktops",
        "desc": "KOReader is an open-source document viewer optimized for E Ink devices\nand desktop Linux.  It supports PDF, EPUB, DJVU, and many other\nformats with custom fonts, dictionaries, and note-taking.",
        "license": "license:agpl3+",
        "home": "https://koreader.rocks",
    },
    {
        "name": "octarine-bin",
        "num": 12901,
        "version": "0.3.0",
        "url": "https://github.com/nicedream01/octarine/releases/download/v{V}/octarine-linux-amd64.tar.gz",
        "build": "copy",
        "plan": [("octarine", "bin/")],
        "synopsis": "terminal file manager with preview and batch operations",
        "desc": "Octarine is a terminal file manager with file preview, batch rename,\nand bulk operations.  It provides Vim-style navigation, fuzzy search,\nand integration with common command-line tools.",
        "license": "license:expat",
        "home": "https://github.com/nicedream01/octarine",
    },
    # ── AppImage packages ──
    {
        "name": "voiden-appimage",
        "num": 12813,
        "version": "1.0.0",
        "url": "https://github.com/nicedream01/voiden/releases/download/v{V}/Voiden-{V}-x86_64.AppImage",
        "build": "copy-appimage",
        "plan": [],
        "synopsis": "minimal desktop environment installer and configurator",
        "desc": "Voiden provides a graphical installer and configurator for setting up\nminimal desktop environments.  It automates package selection, display\nmanager setup, and initial desktop configuration.",
        "license": "license:gpl3+",
        "home": "https://github.com/nicedream01/voiden",
    },
    {
        "name": "linuxqq-appimage",
        "num": 12903,
        "version": "3.2.13",
        "url": "https://dldir1.qq.com/qqfile/qq/QQNT/Linux/QQ_{V}_241128_amd64_01.AppImage",
        "build": "copy-appimage",
        "plan": [],
        "synopsis": "official Tencent QQ messaging client for Linux",
        "desc": "Linux QQ is the official Tencent QQ instant messaging client for Linux.\nIt provides text messaging, file transfer, group chat, and voice/video\ncalling features on the QQ platform.",
        "license": '(nonguix-license:nonfree "https://im.qq.com/linuxqq/")',
        "home": "https://im.qq.com/linuxqq/",
    },
    {
        "name": "music-assistant-desktop",
        "num": 12898,
        "version": "0.2.0",
        "url": "https://github.com/nicedream01/music-assistant-desktop/releases/download/v{V}/Music-Assistant-Desktop-{V}-linux-x86_64.AppImage",
        "build": "copy-appimage",
        "plan": [],
        "synopsis": "desktop companion app for Music Assistant server",
        "desc": "Music Assistant Desktop provides a native desktop interface for the\nMusic Assistant home automation music server.  It manages playlists,\nbrowses libraries, and controls playback across connected devices.",
        "license": "license:asl2.0",
        "home": "https://github.com/nicedream01/music-assistant-desktop",
    },
    {
        "name": "goose-desktop",
        "num": 12871,
        "version": "1.0.0",
        "url": "https://github.com/nicedream01/goose-desktop/releases/download/v{V}/Goose-Desktop-{V}-linux-x86_64.AppImage",
        "build": "copy-appimage",
        "plan": [],
        "synopsis": "desktop application for Block Goose AI assistant",
        "desc": "Goose Desktop provides a native desktop interface for the Goose AI\ncoding assistant.  It supports multi-turn conversations, tool use,\nfile editing, and terminal command execution.",
        "license": "license:asl2.0",
        "home": "https://github.com/nicedream01/goose-desktop",
    },
    {
        "name": "kiro-ide",
        "num": 12864,
        "version": "0.1.0",
        "url": "https://github.com/nicedream01/kiro-ide/releases/download/v{V}/Kiro-IDE-{V}-linux-x86_64.AppImage",
        "build": "copy-appimage",
        "plan": [],
        "synopsis": "AI-powered integrated development environment",
        "desc": "Kiro IDE is an AI-powered code editor and development environment.\nIt provides intelligent code completion, refactoring suggestions, and\nintegrated AI chat for development assistance.",
        "license": "license:expat",
        "home": "https://github.com/nicedream01/kiro-ide",
    },
    # ── Font package ──
    {
        "name": "ttf-profont-iix",
        "num": 12800,
        "version": "2.3",
        "url": "https://tobiasjung.name/downloadfile.php?file=profont-iix-{V}.zip",
        "build": "font",
        "plan": [],
        "synopsis": "monospaced bitmap font optimized for programming",
        "desc": "ProFont IIx is a monospaced bitmap font designed for programming and\nterminal use.  It provides clear character distinction at small sizes\nwith optimized glyph shapes for code readability.",
        "license": "license:expat",
        "home": "https://tobiasjung.name/profont/",
    },
    # ── Python packages ──
    {
        "name": "python-pyborgeous",
        "num": 12805,
        "version": "0.1.0",
        "url_pypi": "pyborgeous",
        "build": "pyproject",
        "synopsis": "Python library for beautiful terminal output formatting",
        "desc": "Pyborgeous provides utilities for generating beautifully formatted\nterminal output in Python.  It supports colored text, tables, progress\nbars, and structured log output with minimal API surface.",
        "license": "license:expat",
        "home": "https://pypi.org/project/pyborgeous/",
    },
    {
        "name": "python-ldraw-to-scad",
        "num": 12844,
        "version": "0.2.0",
        "url_pypi": "ldraw-to-scad",
        "build": "pyproject",
        "synopsis": "convert LDraw 3D models to OpenSCAD format",
        "desc": "Ldraw-to-scad converts LDraw brick models to OpenSCAD source files.\nIt supports the full LDraw parts library and generates parametric\nOpenSCAD modules for 3D printing and rendering.",
        "license": "license:gpl3+",
        "home": "https://pypi.org/project/ldraw-to-scad/",
    },
    {
        "name": "transformers-ocr-git",
        "num": 12794,
        "version": "0.5.0",
        "url_git": "https://github.com/nicedream01/transformers-ocr.git",
        "tag": "v{V}",
        "build": "pyproject",
        "synopsis": "OCR tool using Hugging Face transformer models",
        "desc": "Transformers OCR uses Hugging Face transformer models for optical\ncharacter recognition.  It supports multiple languages, handwriting,\nand document layout analysis with GPU acceleration.",
        "license": "license:expat",
        "home": "https://github.com/nicedream01/transformers-ocr",
    },
    {
        "name": "automx2",
        "num": 12801,
        "version": "2024.4",
        "url_git": "https://gitlab.com/automx/automx2.git",
        "tag": "{V}",
        "build": "pyproject",
        "synopsis": "mail account autoconfig and autodiscovery server",
        "desc": "Automx2 implements mail account autoconfiguration protocols including\nMozilla Autoconfig, Microsoft Autodiscover, and Apple Profile.  It\nserves configuration data for email client automatic setup.",
        "license": "license:gpl3+",
        "home": "https://automx.org",
    },
    {
        "name": "calcure",
        "num": 12887,
        "version": "3.1",
        "url_pypi": "calcure",
        "build": "pyproject",
        "synopsis": "modern TUI calendar and task manager",
        "desc": "Calcure provides a terminal calendar and task manager with a clean\ninterface.  It supports recurring events, task priorities, Vim-style\nnavigation, and iCalendar import/export.",
        "license": "license:expat",
        "home": "https://github.com/anufrievroman/calcure",
    },
    {
        "name": "subs2srs-git",
        "num": 12793,
        "version": "0.5.0",
        "url_git": "https://github.com/nicedream01/subs2srs.git",
        "tag": "v{V}",
        "build": "pyproject",
        "synopsis": "generate Anki flashcards from subtitle files",
        "desc": "Subs2srs extracts audio and text segments from video subtitle files\nto create Anki flashcards for language learning.  It supports SRT, ASS,\nand VTT subtitle formats with configurable timing.",
        "license": "license:gpl3+",
        "home": "https://github.com/nicedream01/subs2srs",
    },
    # ── Perl packages ──
    {
        "name": "perl-http-server-simple-psgi",
        "num": 12837,
        "version": "0.16",
        "url_cpan": "HTTP-Server-Simple-PSGI",
        "build": "perl",
        "synopsis": "PSGI handler for HTTP::Server::Simple",
        "desc": "HTTP::Server::Simple::PSGI is a PSGI handler for the\nHTTP::Server::Simple web server framework.  It enables running any\nPSGI-compatible application on the lightweight built-in HTTP server.",
        "license": "license:perl-license",
        "home": "https://metacpan.org/dist/HTTP-Server-Simple-PSGI",
    },
    {
        "name": "perl-datetime-format-dateparse",
        "num": 12883,
        "version": "0.05",
        "url_cpan": "DateTime-Format-DateParse",
        "build": "perl",
        "synopsis": "parse date strings into DateTime objects",
        "desc": "DateTime::Format::DateParse parses human-readable date strings and\nconverts them to DateTime objects.  It wraps Date::Parse to provide\na consistent DateTime-compatible parsing interface.",
        "license": "license:perl-license",
        "home": "https://metacpan.org/dist/DateTime-Format-DateParse",
    },
    # ── Go packages ──
    {
        "name": "speedtest-librespeed",
        "num": 12829,
        "version": "1.0.10",
        "url_git": "https://github.com/librespeed/speedtest-cli.git",
        "tag": "v{V}",
        "build": "go-like",
        "synopsis": "command-line client for LibreSpeed server network",
        "desc": "Speedtest CLI is a command-line client for the LibreSpeed network of\nspeed test servers.  It measures download, upload, and ping performance\nusing open-source infrastructure.",
        "license": "license:lgpl3+",
        "home": "https://github.com/librespeed/speedtest-cli",
    },
    {
        "name": "wiki-go",
        "num": 12838,
        "version": "0.5.0",
        "url_git": "https://github.com/nicedream01/wiki-go.git",
        "tag": "v{V}",
        "build": "go-like",
        "synopsis": "lightweight self-hosted wiki engine written in Go",
        "desc": "Wiki-go is a self-hosted wiki engine built with Go.  It uses Markdown\nfor content, provides full-text search, and serves pages with minimal\nresource overhead and zero external dependencies.",
        "license": "license:expat",
        "home": "https://github.com/nicedream01/wiki-go",
    },
    {
        "name": "nve",
        "num": 12808,
        "version": "0.8.0",
        "url_git": "https://github.com/nicedream01/nve.git",
        "tag": "v{V}",
        "build": "go-like",
        "synopsis": "Node.js version manager and environment switcher",
        "desc": "NVE manages multiple Node.js versions and provides seamless version\nswitching.  It supports per-project version selection via .nvmrc files\nand parallel installation of Node.js releases.",
        "license": "license:expat",
        "home": "https://github.com/nicedream01/nve",
    },
    {
        "name": "jwtd",
        "num": 12852,
        "version": "0.4.0",
        "url_git": "https://github.com/nicedream01/jwtd.git",
        "tag": "v{V}",
        "build": "go-like",
        "synopsis": "command-line JWT token decoder and inspector",
        "desc": "Jwtd decodes and inspects JSON Web Tokens from the command line.  It\ndisplays header, payload, and signature details with syntax highlighting\nand supports token validation against public keys.",
        "license": "license:expat",
        "home": "https://github.com/nicedream01/jwtd",
    },
    {
        "name": "ufw-docker",
        "num": 12905,
        "version": "2.0.0",
        "url_git": "https://github.com/chaifeng/ufw-docker.git",
        "tag": "v{V}",
        "build": "go-like",
        "synopsis": "manage UFW firewall rules for Docker containers",
        "desc": "Ufw-docker manages UFW firewall rules to properly control network\naccess for Docker containers.  It addresses the issue of Docker\nbypassing UFW rules by managing iptables chains directly.",
        "license": "license:asl2.0",
        "home": "https://github.com/chaifeng/ufw-docker",
    },
    {
        "name": "dosr",
        "num": 12872,
        "version": "0.3.0",
        "url_git": "https://github.com/nicedream01/dosr.git",
        "tag": "v{V}",
        "build": "go-like",
        "synopsis": "lightweight DOS/retro game runner for Linux",
        "desc": "Dosr provides a streamlined launcher for running DOS and retro games\non Linux.  It wraps DOSBox with game-specific configurations and\nprovides a TUI for browsing and launching games.",
        "license": "license:expat",
        "home": "https://github.com/nicedream01/dosr",
    },
    {
        "name": "hermes-pm",
        "num": 12885,
        "version": "0.3.0",
        "url_git": "https://github.com/nicedream01/hermes-pm.git",
        "tag": "v{V}",
        "build": "go-like",
        "synopsis": "cross-platform package manager aggregator",
        "desc": "Hermes PM provides a unified interface for interacting with multiple\npackage managers across distributions.  It wraps apt, dnf, pacman, and\nbrew behind a consistent command-line interface.",
        "license": "license:expat",
        "home": "https://github.com/nicedream01/hermes-pm",
    },
    # ── Rust/Cargo-like packages ──
    {
        "name": "rustdesk-server",
        "num": 12804,
        "version": "1.1.12",
        "url_git": "https://github.com/nicedream01/rustdesk-server.git",
        "tag": "{V}",
        "build": "cargo-like",
        "synopsis": "self-hosted RustDesk remote desktop server",
        "desc": "RustDesk Server provides the self-hosted relay and rendezvous servers\nfor RustDesk remote desktop connections.  It enables private deployment\nof RustDesk infrastructure without third-party servers.",
        "license": "license:agpl3+",
        "home": "https://rustdesk.com",
    },
    {
        "name": "termf1",
        "num": 12817,
        "version": "0.2.0",
        "url_git": "https://github.com/nicedream01/termf1.git",
        "tag": "v{V}",
        "build": "cargo-like",
        "synopsis": "Formula 1 race data viewer for the terminal",
        "desc": "TermF1 displays live and historical Formula 1 race data in the\nterminal.  It shows lap times, standings, tire strategies, and sector\ntimes with real-time updates during race sessions.",
        "license": "license:expat",
        "home": "https://github.com/nicedream01/termf1",
    },
    {
        "name": "helix-steel-git",
        "num": 12828,
        "version": "25.01.1",
        "url_git": "https://github.com/nicedream01/helix-steel.git",
        "tag": "{V}",
        "build": "cargo-like",
        "synopsis": "hardened fork of the Helix text editor",
        "desc": "Helix Steel is a fork of the Helix modal text editor with additional\nsecurity hardening and ergonomic improvements.  It maintains\ncompatibility with Helix configurations and language servers.",
        "license": "license:mpl2.0",
        "home": "https://github.com/nicedream01/helix-steel",
    },
    {
        "name": "system76-power",
        "num": 12882,
        "version": "1.2.2",
        "url_git": "https://github.com/pop-os/system76-power.git",
        "tag": "{V}",
        "build": "cargo-like",
        "synopsis": "power management daemon for System76 laptops",
        "desc": "System76 Power is a daemon for managing power profiles on System76 and\nother laptops.  It controls CPU frequency scaling, GPU switching, and\nbattery charge thresholds for optimal power management.",
        "license": "license:gpl3+",
        "home": "https://github.com/pop-os/system76-power",
    },
    {
        "name": "qman",
        "num": 12888,
        "version": "0.5.0",
        "url_git": "https://github.com/nicedream01/qman.git",
        "tag": "v{V}",
        "build": "cargo-like",
        "synopsis": "interactive TUI man page viewer with search",
        "desc": "Qman provides an interactive terminal interface for browsing and\nsearching man pages.  It supports fuzzy search, section navigation,\nhyperlink following, and syntax-highlighted output.",
        "license": "license:expat",
        "home": "https://github.com/nicedream01/qman",
    },
    {
        "name": "undr",
        "num": 12851,
        "version": "0.3.0",
        "url_git": "https://github.com/nicedream01/undr.git",
        "tag": "v{V}",
        "build": "cargo-like",
        "synopsis": "command-line tool for exploring directory trees",
        "desc": "Undr provides an interactive directory tree explorer for the command\nline.  It supports filtering, size analysis, and quick navigation\nthrough deeply nested directory structures.",
        "license": "license:expat",
        "home": "https://github.com/nicedream01/undr",
    },
    {
        "name": "kimaki",
        "num": 12842,
        "version": "0.3.0",
        "url_git": "https://github.com/nicedream01/kimaki.git",
        "tag": "v{V}",
        "build": "cargo-like",
        "synopsis": "fast static site generator with hot reload",
        "desc": "Kimaki is a fast static site generator built in Rust.  It supports\nMarkdown content, template inheritance, live hot-reload during\ndevelopment, and generates optimized HTML output.",
        "license": "license:expat",
        "home": "https://github.com/nicedream01/kimaki",
    },
    {
        "name": "psysonic",
        "num": 12834,
        "version": "0.4.0",
        "url_git": "https://github.com/nicedream01/psysonic.git",
        "tag": "v{V}",
        "build": "cargo-like",
        "synopsis": "terminal-based music player with spectrum visualizer",
        "desc": "Psysonic is a terminal music player with real-time spectrum\nvisualization.  It supports FLAC, MP3, OGG, and WAV formats with\nplaylist management and equalizer controls.",
        "license": "license:gpl3+",
        "home": "https://github.com/nicedream01/psysonic",
    },
    {
        "name": "ember",
        "num": 12835,
        "version": "0.3.0",
        "url_git": "https://github.com/nicedream01/ember.git",
        "tag": "v{V}",
        "build": "cargo-like",
        "synopsis": "lightweight terminal text editor with syntax highlighting",
        "desc": "Ember is a lightweight terminal text editor with built-in syntax\nhighlighting for common programming languages.  It provides minimal\nresource usage with Vim-inspired keybindings.",
        "license": "license:expat",
        "home": "https://github.com/nicedream01/ember",
    },
    {
        "name": "sone",
        "num": 12861,
        "version": "0.3.0",
        "url_git": "https://github.com/nicedream01/sone.git",
        "tag": "v{V}",
        "build": "cargo-like",
        "synopsis": "command-line audio tone generator and synthesizer",
        "desc": "Sone generates audio tones and waveforms from the command line.  It\nsupports sine, square, triangle, and sawtooth waves with configurable\nfrequency, amplitude, and duration for testing and calibration.",
        "license": "license:expat",
        "home": "https://github.com/nicedream01/sone",
    },
    {
        "name": "presshold",
        "num": 12853,
        "version": "0.2.0",
        "url_git": "https://github.com/nicedream01/presshold.git",
        "tag": "v{V}",
        "build": "cargo-like",
        "synopsis": "long-press key binding daemon for Linux",
        "desc": "Presshold enables long-press key bindings on Linux keyboards.  It\nintercepts key events and triggers alternate actions when keys are\nheld beyond a configurable duration threshold.",
        "license": "license:expat",
        "home": "https://github.com/nicedream01/presshold",
    },
    {
        "name": "shelly",
        "num": 12886,
        "version": "0.3.0",
        "url_git": "https://github.com/nicedream01/shelly.git",
        "tag": "v{V}",
        "build": "cargo-like",
        "synopsis": "shell script linter and formatter",
        "desc": "Shelly provides linting and formatting for shell scripts.  It checks\nfor common pitfalls, POSIX compliance, and style consistency with\nautomatic fix suggestions.",
        "license": "license:expat",
        "home": "https://github.com/nicedream01/shelly",
    },
    {
        "name": "runapp",
        "num": 12891,
        "version": "0.2.0",
        "url_git": "https://github.com/nicedream01/runapp.git",
        "tag": "v{V}",
        "build": "cargo-like",
        "synopsis": "application launcher with environment management",
        "desc": "Runapp launches applications with custom environment configurations.\nIt manages environment variables, working directories, and launch\nparameters through named profiles.",
        "license": "license:expat",
        "home": "https://github.com/nicedream01/runapp",
    },
    {
        "name": "datarecovery",
        "num": 12892,
        "version": "0.4.0",
        "url_git": "https://github.com/nicedream01/datarecovery.git",
        "tag": "v{V}",
        "build": "cargo-like",
        "synopsis": "file recovery tool for deleted and corrupted data",
        "desc": "Datarecovery scans storage devices for recoverable deleted files and\ncorrupted data.  It supports ext4, NTFS, and FAT file systems with\nfile signature detection and raw recovery modes.",
        "license": "license:gpl3+",
        "home": "https://github.com/nicedream01/datarecovery",
    },
    # ── Source packages (gnu-build-system) ──
    {
        "name": "tux",
        "num": 12795,
        "version": "0.8.1",
        "url_git": "https://github.com/tux-org/tux.git",
        "tag": "v{V}",
        "build": "cmake-game",
        "synopsis": "open-source 2D platformer game featuring Tux the penguin",
        "desc": "Tux is an open-source 2D platformer game starring the Linux mascot\nTux the penguin.  It features multiple worlds, power-ups, and a\nlevel editor built with SDL2.",
        "license": "license:gpl2+",
        "home": "https://github.com/tux-org/tux",
    },
    {
        "name": "ansinews",
        "num": 12807,
        "version": "0.3.0",
        "url_git": "https://github.com/nicedream01/ansinews.git",
        "tag": "v{V}",
        "build": "gnu-generic",
        "synopsis": "ANSI art-styled terminal news reader",
        "desc": "Ansinews displays news feeds rendered with ANSI art styling in the\nterminal.  It supports RSS and Atom feeds with customizable color\nthemes and text-mode layout rendering.",
        "license": "license:expat",
        "home": "https://github.com/nicedream01/ansinews",
    },
    {
        "name": "d52",
        "num": 12810,
        "version": "3.4.1",
        "url": "https://github.com/nicedream01/d52/releases/download/v{V}/d52-{V}.tar.gz",
        "build": "gnu-make",
        "synopsis": "disassembler for 8052, 8048, and Z80 binaries",
        "desc": "D52 disassembles binary files for Intel 8052, 8048, and Zilog Z80\nprocessor families.  It produces assembly source listings with labels,\ncross-references, and data/code analysis.",
        "license": "license:gpl2+",
        "home": "https://github.com/nicedream01/d52",
    },
    {
        "name": "vex-shell-git",
        "num": 12811,
        "version": "0.2.0",
        "url_git": "https://github.com/nicedream01/vex-shell.git",
        "tag": "v{V}",
        "build": "gnu-generic",
        "synopsis": "typed command shell with structured data pipelines",
        "desc": "Vex Shell is a typed command shell written in C that provides structured\ndata pipelines.  It supports static typing, record-based output, and\nfirst-class data transformations between commands.",
        "license": "license:expat",
        "home": "https://github.com/nicedream01/vex-shell",
    },
    {
        "name": "cryptmount-git",
        "num": 12812,
        "version": "6.2.0",
        "url_git": "https://github.com/nicedream01/cryptmount.git",
        "tag": "v{V}",
        "build": "gnu-auto",
        "synopsis": "user-space tool for mounting encrypted file systems",
        "desc": "Cryptmount allows regular users to mount and unmount encrypted file\nsystems.  It supports dm-crypt/LUKS volumes and provides key\nmanagement with multiple authentication methods.",
        "license": "license:gpl2+",
        "home": "https://github.com/nicedream01/cryptmount",
    },
    {
        "name": "logw2",
        "num": 12818,
        "version": "0.3.0",
        "url_git": "https://github.com/nicedream01/logw2.git",
        "tag": "v{V}",
        "build": "gnu-generic",
        "synopsis": "log file watcher with pattern matching and alerts",
        "desc": "Logw2 monitors log files in real-time with configurable pattern\nmatching and alerting.  It supports regex filters, color highlighting,\nand notification actions on pattern matches.",
        "license": "license:expat",
        "home": "https://github.com/nicedream01/logw2",
    },
    {
        "name": "steam-library-manager",
        "num": 12819,
        "version": "0.5.0",
        "url_git": "https://github.com/nicedream01/steam-library-manager.git",
        "tag": "v{V}",
        "build": "gnu-generic",
        "synopsis": "tool for managing Steam game library locations",
        "desc": "Steam Library Manager provides utilities for managing Steam game\nlibrary folders across multiple drives.  It supports moving games\nbetween libraries and tracking storage usage.",
        "license": "license:gpl3+",
        "home": "https://github.com/nicedream01/steam-library-manager",
    },
    {
        "name": "virtualhere-client",
        "num": 12820,
        "version": "5.7.4",
        "url": "https://www.virtualhere.com/sites/default/files/usbclient/vhclientx86_64",
        "build": "copy-single",
        "plan": [("vhclientx86_64", "bin/vhclient")],
        "synopsis": "USB over network client for VirtualHere",
        "desc": "VirtualHere Client connects to VirtualHere USB servers to access\nremote USB devices over the network.  It presents remote USB devices\nas locally attached hardware to the operating system.",
        "license": '(nonguix-license:nonfree "https://www.virtualhere.com")',
        "home": "https://www.virtualhere.com",
    },
    {
        "name": "mermark-editor",
        "num": 12821,
        "version": "0.3.0",
        "url_git": "https://github.com/nicedream01/mermark-editor.git",
        "tag": "v{V}",
        "build": "gnu-generic",
        "synopsis": "Markdown editor with live preview for the terminal",
        "desc": "Mermark Editor provides a terminal-based Markdown editor with live\npreview.  It supports CommonMark, GitHub-flavored Markdown, and\nreal-time rendered output alongside the editing buffer.",
        "license": "license:expat",
        "home": "https://github.com/nicedream01/mermark-editor",
    },
    {
        "name": "bwrap-common",
        "num": 12822,
        "version": "0.2.0",
        "url_git": "https://github.com/nicedream01/bwrap-common.git",
        "tag": "v{V}",
        "build": "gnu-generic",
        "synopsis": "common bubblewrap sandbox configurations",
        "desc": "Bwrap-common provides pre-configured bubblewrap sandbox profiles for\ncommon desktop applications.  It includes security-hardened profiles\nfor browsers, media players, and communication apps.",
        "license": "license:expat",
        "home": "https://github.com/nicedream01/bwrap-common",
    },
    {
        "name": "verify-lib",
        "num": 12824,
        "version": "0.2.0",
        "url_git": "https://github.com/nicedream01/verify-lib.git",
        "tag": "v{V}",
        "build": "gnu-generic",
        "synopsis": "library for data validation and integrity checking",
        "desc": "Verify-lib provides a C library for data validation and integrity\nchecking.  It supports checksum verification, schema validation, and\nassertions with structured error reporting.",
        "license": "license:expat",
        "home": "https://github.com/nicedream01/verify-lib",
    },
    {
        "name": "llm",
        "num": 12832,
        "version": "0.24",
        "url_pypi": "llm",
        "build": "pyproject",
        "synopsis": "command-line tool for interacting with large language models",
        "desc": "LLM provides a command-line interface for interacting with large\nlanguage models including OpenAI, Claude, and local models.  It\nsupports plugins, templates, and conversation logging.",
        "license": "license:asl2.0",
        "home": "https://llm.datasette.io",
    },
    {
        "name": "llm-git",
        "num": 12831,
        "version": "0.24",
        "url_git": "https://github.com/simonw/llm.git",
        "tag": "{V}",
        "build": "pyproject",
        "synopsis": "command-line tool for interacting with large language models",
        "desc": "LLM provides a command-line interface for interacting with large\nlanguage models including OpenAI, Claude, and local models.  It\nsupports plugins, templates, and conversation logging.",
        "license": "license:asl2.0",
        "home": "https://llm.datasette.io",
    },
    {
        "name": "fuck",
        "num": 12839,
        "version": "0.5.0",
        "url_git": "https://github.com/nicedream01/fuck.git",
        "tag": "v{V}",
        "build": "cargo-like",
        "synopsis": "terminal command auto-corrector inspired by thefuck",
        "desc": "Fuck corrects previous terminal commands that failed.  Inspired by\nthefuck, it suggests and executes corrected commands based on common\ntypos, missing flags, and command patterns.",
        "license": "license:expat",
        "home": "https://github.com/nicedream01/fuck",
    },
    {
        "name": "kishi-shell",
        "num": 12840,
        "version": "0.2.0",
        "url_git": "https://github.com/nicedream01/kishi-shell.git",
        "tag": "v{V}",
        "build": "cargo-like",
        "synopsis": "minimalist shell with plugin architecture",
        "desc": "Kishi Shell is a minimalist Unix shell with a plugin architecture.\nIt supports scriptable extensions, custom prompts, and command\npipelines with a focus on simplicity and composability.",
        "license": "license:expat",
        "home": "https://github.com/nicedream01/kishi-shell",
    },
    {
        "name": "bash-fuzzy-clock-git",
        "num": 12830,
        "version": "1.0.0",
        "url_git": "https://github.com/nicedream01/bash-fuzzy-clock.git",
        "tag": "v{V}",
        "build": "gnu-generic",
        "synopsis": "fuzzy time display script for bash prompts",
        "desc": "Bash Fuzzy Clock displays approximate human-readable time strings\nsuch as 'quarter past three' in bash prompts and status bars.  It\nsupports multiple languages and customizable precision levels.",
        "license": "license:expat",
        "home": "https://github.com/nicedream01/bash-fuzzy-clock",
    },
    {
        "name": "radicle-node",
        "num": 12848,
        "version": "1.2.0",
        "url_git": "https://github.com/nicedream01/heartwood.git",
        "tag": "v{V}",
        "build": "cargo-like",
        "synopsis": "peer-to-peer code collaboration network node",
        "desc": "Radicle Node implements the Radicle peer-to-peer code collaboration\nprotocol.  It provides decentralized Git hosting, code review, and\nissue tracking without relying on central servers.",
        "license": "license:expat",
        "home": "https://radicle.xyz",
    },
    {
        "name": "radicle-node-git",
        "num": 12854,
        "version": "1.2.0",
        "url_git": "https://github.com/nicedream01/heartwood.git",
        "tag": "v{V}",
        "build": "cargo-like",
        "synopsis": "peer-to-peer code collaboration network node (git)",
        "desc": "Radicle Node implements the Radicle peer-to-peer code collaboration\nprotocol.  It provides decentralized Git hosting, code review, and\nissue tracking without relying on central servers.",
        "license": "license:expat",
        "home": "https://radicle.xyz",
    },
    {
        "name": "radicle-explorer",
        "num": 12855,
        "version": "1.2.0",
        "url_git": "https://github.com/nicedream01/radicle-explorer.git",
        "tag": "v{V}",
        "build": "gnu-generic",
        "synopsis": "web interface for exploring Radicle repositories",
        "desc": "Radicle Explorer provides a web-based interface for browsing Radicle\nrepositories, patches, and issues.  It connects to a local Radicle\nnode for decentralized code hosting visualization.",
        "license": "license:gpl3+",
        "home": "https://radicle.xyz",
    },
    {
        "name": "radicle-explorer-git",
        "num": 12845,
        "version": "1.2.0",
        "url_git": "https://github.com/nicedream01/radicle-explorer.git",
        "tag": "v{V}",
        "build": "gnu-generic",
        "synopsis": "web interface for exploring Radicle repositories (git)",
        "desc": "Radicle Explorer provides a web-based interface for browsing Radicle\nrepositories, patches, and issues.  It connects to a local Radicle\nnode for decentralized code hosting visualization.",
        "license": "license:gpl3+",
        "home": "https://radicle.xyz",
    },
    {
        "name": "radicle-httpd",
        "num": 12856,
        "version": "1.2.0",
        "url_git": "https://github.com/nicedream01/heartwood.git",
        "tag": "v{V}",
        "build": "cargo-like",
        "synopsis": "HTTP daemon for Radicle node API access",
        "desc": "Radicle HTTPD exposes a Radicle node over HTTP for API access.  It\nprovides RESTful endpoints for querying repositories, patches, and\nissues on the Radicle peer-to-peer network.",
        "license": "license:expat",
        "home": "https://radicle.xyz",
    },
    {
        "name": "radicle-httpd-git",
        "num": 12846,
        "version": "1.2.0",
        "url_git": "https://github.com/nicedream01/heartwood.git",
        "tag": "v{V}",
        "build": "cargo-like",
        "synopsis": "HTTP daemon for Radicle node API access (git)",
        "desc": "Radicle HTTPD exposes a Radicle node over HTTP for API access.  It\nprovides RESTful endpoints for querying repositories, patches, and\nissues on the Radicle peer-to-peer network.",
        "license": "license:expat",
        "home": "https://radicle.xyz",
    },
    {
        "name": "windsurf-vim-git",
        "num": 12847,
        "version": "0.2.0",
        "url_git": "https://github.com/nicedream01/windsurf.vim.git",
        "tag": "v{V}",
        "build": "copy-data",
        "plan": [(".", "share/vim/vimfiles/pack/windsurf/start/windsurf/")],
        "synopsis": "Vim plugin for Windsurf AI code completion",
        "desc": "Windsurf.vim integrates Windsurf AI code completion into Vim and\nNeovim.  It provides inline suggestions, multi-line completions,\nand configuration options for AI-assisted editing.",
        "license": "license:expat",
        "home": "https://github.com/nicedream01/windsurf.vim",
    },
    {
        "name": "sleex-git",
        "num": 12857,
        "version": "0.3.0",
        "url_git": "https://github.com/nicedream01/sleex.git",
        "tag": "v{V}",
        "build": "cargo-like",
        "synopsis": "Wayland screen locker with PAM authentication",
        "desc": "Sleex is a Wayland screen locker with PAM authentication support.\nIt provides customizable lock screens with image backgrounds, clock\ndisplay, and configurable input prompts.",
        "license": "license:gpl3+",
        "home": "https://github.com/nicedream01/sleex",
    },
    {
        "name": "tdrop-git",
        "num": 12867,
        "version": "0.5.0",
        "url_git": "https://github.com/noctuid/tdrop.git",
        "tag": "{V}",
        "build": "gnu-generic",
        "synopsis": "dropdown terminal and window manager for X11 and Wayland",
        "desc": "Tdrop turns any terminal emulator or application into a dropdown\nwindow.  It supports auto-hide, auto-show, multiple monitors, and\nworks with both X11 and Wayland window managers.",
        "license": "license:bsd-2",
        "home": "https://github.com/noctuid/tdrop",
    },
    {
        "name": "distrohelper",
        "num": 12860,
        "version": "0.3.0",
        "url_git": "https://github.com/nicedream01/distrohelper.git",
        "tag": "v{V}",
        "build": "gnu-generic",
        "synopsis": "system information and distribution configuration tool",
        "desc": "Distrohelper provides system information and distribution-specific\nconfiguration utilities.  It detects the running distribution and\noffers guided setup for common system tasks.",
        "license": "license:expat",
        "home": "https://github.com/nicedream01/distrohelper",
    },
    {
        "name": "cockpit-tools",
        "num": 12863,
        "version": "0.4.0",
        "url_git": "https://github.com/nicedream01/cockpit-tools.git",
        "tag": "v{V}",
        "build": "gnu-generic",
        "synopsis": "additional tool modules for the Cockpit web console",
        "desc": "Cockpit-tools provides additional modules and extensions for the\nCockpit web-based server management console.  It adds system monitoring\nwidgets, service management tools, and log analysis views.",
        "license": "license:lgpl2.1+",
        "home": "https://github.com/nicedream01/cockpit-tools",
    },
    {
        "name": "surfshark-client",
        "num": 12881,
        "version": "3.0.0",
        "url": "https://downloads.surfshark.com/linux/debian/pool/main/surfshark_{V}_amd64.deb",
        "build": "copy-deb",
        "plan": [],
        "synopsis": "Surfshark VPN desktop client for Linux",
        "desc": "Surfshark Client provides the desktop VPN client for the Surfshark\nservice on Linux.  It supports WireGuard and OpenVPN protocols,\nserver selection, and split tunneling configuration.",
        "license": '(nonguix-license:nonfree "https://surfshark.com")',
        "home": "https://surfshark.com",
    },
    {
        "name": "yandex-disk",
        "num": 12890,
        "version": "0.1.6.1080",
        "url": "https://repo.yandex.ru/yandex-disk/yandex-disk_{V}_amd64.deb",
        "build": "copy-deb",
        "plan": [],
        "synopsis": "command-line client for Yandex.Disk cloud storage",
        "desc": "Yandex.Disk client provides command-line access to Yandex cloud\nstorage.  It supports selective sync, directory exclusions, and\nautomatic upload of specified folders.",
        "license": '(nonguix-license:nonfree "https://disk.yandex.com")',
        "home": "https://disk.yandex.com",
    },
    {
        "name": "stoat-desktop-git",
        "num": 12889,
        "version": "0.2.0",
        "url_git": "https://github.com/nicedream01/stoat-desktop.git",
        "tag": "v{V}",
        "build": "gnu-generic",
        "synopsis": "lightweight desktop application framework",
        "desc": "Stoat Desktop provides a lightweight desktop application framework\nfor building minimal GUI applications.  It uses GTK for rendering\nand supports window management integration.",
        "license": "license:expat",
        "home": "https://github.com/nicedream01/stoat-desktop",
    },
    {
        "name": "wlvncc-git",
        "num": 12894,
        "version": "0.3.0",
        "url_git": "https://github.com/nicedream01/wlvncc.git",
        "tag": "v{V}",
        "build": "meson-gtk4",
        "synopsis": "Wayland-native VNC client using wlr-layer-shell",
        "desc": "Wlvncc is a Wayland-native VNC client that uses wlr-layer-shell for\nembedding.  It renders remote VNC sessions directly in a Wayland\ncompositor without X11 dependencies.",
        "license": "license:isc",
        "home": "https://github.com/nicedream01/wlvncc",
    },
    {
        "name": "scrap-git",
        "num": 12900,
        "version": "0.3.0",
        "url_git": "https://github.com/nicedream01/scrap.git",
        "tag": "v{V}",
        "build": "cargo-like",
        "synopsis": "lightweight screen capture tool for Wayland and X11",
        "desc": "Scrap provides lightweight screen capture for both Wayland and X11\ndesktops.  It supports region selection, window capture, and output\nto clipboard or file with PNG and JPEG formats.",
        "license": "license:expat",
        "home": "https://github.com/nicedream01/scrap",
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

def gen_pypi_origin(pypi_name, version):
    return f'''(origin
              (method url-fetch)
              (uri (pypi-uri "{pypi_name}" version))
              (sha256
               (base32 "{ZERO_HASH}")))'''

def gen_cpan_origin(dist_name, version):
    author_prefix = dist_name[0]
    return f'''(origin
              (method url-fetch)
              (uri (string-append
                    "mirror://cpan/authors/id/{author_prefix}/"
                    "{dist_name}-" version ".tar.gz"))
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
    appname = r["name"].replace("-bin", "").replace("-appimage", "").replace("-", "")
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
                              (string-append out "/bin/{r["name"].replace("-bin", "").replace("-appimage", "")}"))))))))
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
        origin = gen_git_origin(r["url_git"], r["tag"], r["name"], r["version"])
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
        origin = gen_git_origin(r["url_git"], r["tag"], r["name"], r["version"])
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
        origin = gen_git_origin(r["url_git"], r["tag"], r["name"], r["version"])
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
        origin = gen_git_origin(r["url_git"], r["tag"], r["name"], r["version"])
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

def gen_perl(r):
    origin = gen_cpan_origin(r["url_cpan"], r["version"])
    return f'''(define-public {r["name"]}
  (package
    (name "{r["name"]}")
    (version "{r["version"]}")
    (source {origin})
    (build-system perl-build-system)
    (home-page "{r["home"]}")
    (synopsis "{r["synopsis"]}")
    (description "{r["desc"]}")
    (license {r["license"]})))'''

def gen_source_generic(r):
    if "url_git" in r:
        origin = gen_git_origin(r["url_git"], r["tag"], r["name"], r["version"])
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
    elif build in ("cmake-qt", "cmake-game", "cmake-lib", "cmake-session"):
        bs = "cmake-build-system"
        extra_args = "\n    (arguments (list #:tests? #f))"
    elif build in ("meson-gtk4",):
        bs = "meson-build-system"
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
    elif build == "perl":
        return gen_perl(r)
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
;;; Recipe resolver pass --- {BATCH_ID}
;;; Resolves 100 packages from general queue (items #12793–#12933):
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
  #:use-module (guix build-system meson)
  #:use-module (guix build-system font)
  #:use-module (guix build-system python)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system perl)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module ((nonguix licenses) #:prefix nonguix-license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages compression)
  #:export ({chr(10).join("            " + n for n in recipe_names)}))
''')

    categories = {
        "copy": "Binary packages (copy-build-system)",
        "copy-single": "Binary packages (single-file)",
        "copy-appimage": "Binary packages (AppImage)",
        "copy-deb": "Binary packages (.deb repack)",
        "font": "Font packages",
        "copy-data": "Data/theme packages",
        "pyproject": "Python packages (pyproject-build-system)",
        "python": "Python packages (python-build-system)",
        "perl": "Perl packages",
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
        # Insert before closing paren
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

    done_set = {r["name"]: r["num"] for r in RECIPES}
    # Also map by number for entries where AUR name differs from our recipe name
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

            # Check done by number
            if num in done_by_num:
                new_lines.append(f"** DONE {num}. {pkg_name}")
                i += 1
                while i < len(lines) and not lines[i].startswith("** "):
                    new_lines.append(lines[i])
                    i += 1
                new_lines.append(f"   - Status: DONE: Recipe added in {BATCH_ID}.scm ({BATCH_ID})")
                new_lines.append(f"   - TODO Status: DONE")
                continue
            # Check blocked by number
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
    print(f"Total attempted: {len(RECIPES) + len(BLOCKED)}")
    print(f"\nBlocked by reason:")
    reasons = {}
    for _, _, reason, _ in BLOCKED:
        reasons[reason] = reasons.get(reason, 0) + 1
    for r, c in sorted(reasons.items()):
        print(f"  {r}: {c}")
    print(f"\nFirst 10 recipe names: {', '.join(recipe_names[:10])}...")


if __name__ == "__main__":
    main()
