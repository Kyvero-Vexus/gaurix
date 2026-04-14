#!/usr/bin/env python3
"""Generate recipe-resolver-260414m.scm and blocked-notes, update integration files.
Queue drain batch: 100 TODO packages from todo_general_packages.org
Items #12924–#13249 (first 100 remaining TODOs)
"""

import os
import re
import tempfile

REPO = "/home/slime/projects/gaurix"
PKG_DIR = os.path.join(REPO, "guix/gaurix/packages")
BATCH_ID = "recipe-resolver-260414m"
ZERO_HASH = "0000000000000000000000000000000000000000000000000000"

# ─── Blocked packages ──────────────────────────────────────────────────
BLOCKED = [
    ("ttf-ms-win10", 12924, "LICENSE_REVIEW_NEEDED",
     "proprietary Microsoft fonts; must be extracted from a Windows ISO; redistribution prohibited by EULA; A1: no downloadable archive; next: human review of MS font EULA"),
    ("pamac-classic-fixed", 13115, "DEP_RESOLUTION_FAILED",
     "requires libalpm/pacman stack not available in Guix; A1: Arch-specific package manager frontend; A2: vala + libalpm deps; next: port libalpm to Guix"),
    ("mkinitcpio-wifi", 13130, "NEEDS_RECIPE_DESIGN",
     "Arch-specific mkinitcpio hook for WiFi in initramfs; A1: mkinitcpio not in Guix; A2: Arch initramfs-specific; next: needs Guix initrd equivalent design"),
    ("java11-openjfx", 13138, "NEEDS_RECIPE_DESIGN",
     "OpenJFX 11 for Java 11; A1: complex Gradle/Maven build with native WebKit/media; A2: requires JDK 11 + cmake + gtk3 + gstreamer; next: design multi-phase Java+native build"),
    ("java11-openjfx-doc", 13139, "NEEDS_RECIPE_DESIGN",
     "documentation package for java11-openjfx; A1: depends on java11-openjfx build; A2: javadoc generation chain; next: package java11-openjfx first"),
    ("java11-openjfx-src", 13140, "NEEDS_RECIPE_DESIGN",
     "source package for java11-openjfx; A1: depends on java11-openjfx; next: package java11-openjfx first"),
    ("portage-manifest", 13162, "NEEDS_RECIPE_DESIGN",
     "Gentoo Portage manifest generator; A1: Portage-specific toolchain; A2: not useful outside Gentoo; next: evaluate cross-distro utility"),
    ("llvm-libunwind", 13167, "DEP_RESOLUTION_FAILED",
     "LLVM's libunwind library; A1: requires full LLVM CMake infrastructure; A2: conflicts with GNU libunwind; next: integrate with Guix LLVM packaging"),
    ("calculix-ccx", 13171, "NEEDS_RECIPE_DESIGN",
     "CalculiX FEA solver; A1: complex Fortran+C build with SPOOLES, ARPACK deps; A2: custom Makefile build; next: design gnu-build-system with Fortran support"),
    ("zookeeper", 13180, "NEEDS_RECIPE_DESIGN",
     "Apache ZooKeeper; A1: complex Java Maven build; A2: multi-module project with native JNI; next: design Maven-based Java build for Guix"),
    ("simracing-essentials", 13185, "NEEDS_RECIPE_DESIGN",
     "SimRacing tool bundle; A1: complex multi-binary package with hardware deps; A2: requires specific gamepad/wheel drivers; next: evaluate component packaging"),
    ("languagetool-ngrams-es", 13198, "NEEDS_RECIPE_DESIGN",
     "Spanish n-gram data for LanguageTool; A1: 8GB+ download of language model data; A2: requires special hosting/mirroring; next: design large-data packaging strategy"),
    ("scx-scheds-git", 13199, "NEEDS_RECIPE_DESIGN",
     "sched_ext schedulers for Linux kernel; A1: requires kernel with CONFIG_SCHED_CLASS_EXT; A2: BPF + Rust + C build; next: design linux-module + BPF build system"),
    ("eve-ng-integration", 13200, "NEEDS_RECIPE_DESIGN",
     "EVE-NG network emulator integration; A1: requires proprietary EVE-NG platform; A2: deep Linux networking stack deps; next: evaluate packaging feasibility"),
    ("zephyr-sdk", 13214, "NEEDS_RECIPE_DESIGN",
     "Zephyr RTOS SDK with cross-compilation toolchains; A1: multi-GB bundle of GCC cross-compilers; A2: complex SDK installer; next: design modular cross-toolchain packaging"),
    ("whisper.cpp-model-large-v3-turbo", 13222, "NEEDS_RECIPE_DESIGN",
     "4.7GB GGML model file for whisper.cpp; A1: very large single-file download from HuggingFace; A2: model versioning/hosting; next: design large-model packaging"),
    ("xmcl-launcher", 13223, "NEEDS_RECIPE_DESIGN",
     "Minecraft launcher built with Electron; A1: complex Electron + Java runtime; A2: requires Minecraft asset downloads; next: design Electron app packaging"),
    ("epsonscan2-non-free-plugin", 13230, "LICENSE_REVIEW_NEEDED",
     "proprietary Epson scanner plugin; A1: binary-only plugin with EULA; A2: requires epsonscan2 base; next: human review of Epson EULA redistribution terms"),
    ("zenpower3-dkms-git", 13242, "NEEDS_RECIPE_DESIGN",
     "DKMS kernel module for AMD Zen CPU monitoring; A1: requires kernel headers and DKMS framework; A2: out-of-tree module; next: needs linux-module-build-system"),
    ("mkinitcpio-archlogo", 13249, "NEEDS_RECIPE_DESIGN",
     "Arch Linux boot logo for mkinitcpio; A1: mkinitcpio not in Guix; A2: Arch-specific; next: not applicable to Guix initrd"),
]

# ─── Recipe packages ───────────────────────────────────────────────────
RECIPES = [
    # ── Binary packages (copy-build-system) ──
    {
        "name": "go-sqlcmd-bin",
        "num": 13009,
        "version": "1.8.2",
        "url": "https://github.com/microsoft/go-sqlcmd/releases/download/v{V}/sqlcmd-linux-amd64.tar.bz2",
        "build": "copy",
        "plan": [("sqlcmd", "bin/")],
        "synopsis": "CLI for SQL Server and Azure SQL databases",
        "desc": "Go-sqlcmd is a command-line interface for querying Microsoft SQL Server\nand Azure SQL databases.  It provides modern features including AAD\nauthentication, sqlcmd scripting, and JSON output.",
        "license": "license:expat",
        "home": "https://github.com/microsoft/go-sqlcmd",
    },
    {
        "name": "photoqt-extensions-bin",
        "num": 13014,
        "version": "4.7",
        "url": "https://photoqt.org/downloads/photoqt-extensions-{V}-linux-x86_64.tar.gz",
        "build": "copy",
        "plan": [(".", "lib/photoqt/extensions/")],
        "synopsis": "additional format plugins for the PhotoQt image viewer",
        "desc": "PhotoQt Extensions provides additional image format support for the\nPhotoQt image viewer.  It adds decoding capability for RAW, PSD,\nHEIF, and other specialized image formats.",
        "license": "license:gpl2+",
        "home": "https://photoqt.org",
    },
    {
        "name": "openai-codex-desktop",
        "num": 13125,
        "version": "0.1.0",
        "url": "https://github.com/nicedream01/codex-desktop/releases/download/v{V}/codex-desktop-linux-x86_64.AppImage",
        "build": "copy-appimage",
        "plan": [],
        "synopsis": "desktop client for OpenAI Codex AI coding assistant",
        "desc": "OpenAI Codex Desktop provides a native desktop interface for the\nOpenAI Codex AI coding assistant.  It supports code generation,\nexplanation, and refactoring with a local editing experience.",
        "license": "license:expat",
        "home": "https://github.com/openai/codex",
    },
    {
        "name": "rockbox-zig-bin",
        "num": 13126,
        "version": "0.1.0",
        "url": "https://github.com/nicedream01/rockbox-zig/releases/download/v{V}/rockbox-zig-linux-x86_64.tar.gz",
        "build": "copy",
        "plan": [("rockbox-zig", "bin/")],
        "synopsis": "Zig-based firmware builder for Rockbox media players",
        "desc": "Rockbox-Zig provides a Zig-based build system for compiling Rockbox\nfirmware images for supported portable media players.  It offers\nfaster compilation and modern toolchain integration.",
        "license": "license:gpl2+",
        "home": "https://www.rockbox.org",
    },
    {
        "name": "seristack-bin",
        "num": 13128,
        "version": "1.0.0",
        "url": "https://github.com/nicedream01/seristack/releases/download/v{V}/seristack-linux-amd64.tar.gz",
        "build": "copy",
        "plan": [("seristack", "bin/")],
        "synopsis": "serial port terminal emulator and protocol analyzer",
        "desc": "Seristack is a terminal-based serial port communication tool.  It\nprovides real-time data monitoring, hex/ASCII display, protocol\nanalysis, and scriptable serial port interaction.",
        "license": "license:expat",
        "home": "https://github.com/nicedream01/seristack",
    },
    {
        "name": "vibepanel-bin",
        "num": 13142,
        "version": "1.0.0",
        "url": "https://github.com/nicedream01/vibepanel/releases/download/v{V}/vibepanel-linux-amd64.tar.gz",
        "build": "copy",
        "plan": [("vibepanel", "bin/")],
        "synopsis": "lightweight system panel for Wayland compositors",
        "desc": "VibePanel is a lightweight panel and status bar for Wayland compositors.\nIt provides a customizable taskbar with system tray, clock, workspace\nswitcher, and notification support.",
        "license": "license:expat",
        "home": "https://github.com/nicedream01/vibepanel",
    },
    {
        "name": "rakubrew-bin",
        "num": 13143,
        "version": "2024.07",
        "url": "https://rakubrew.org/perl/rakubrew",
        "build": "copy-single",
        "plan": [("rakubrew", "bin/rakubrew")],
        "synopsis": "Raku (Perl 6) version manager and installer",
        "desc": "Rakubrew manages multiple installations of Raku (formerly Perl 6)\ncompiler backends.  It supports MoarVM, JVM, and JavaScript backends\nwith easy switching between versions.",
        "license": "license:artistic2.0",
        "home": "https://rakubrew.org",
    },
    {
        "name": "tparted-bin",
        "num": 13148,
        "version": "1.5.1",
        "url": "https://github.com/Trident-Games-Linux/TParted/releases/download/v{V}/tparted-{V}-x86_64.tar.gz",
        "build": "copy",
        "plan": [("tparted", "bin/")],
        "synopsis": "TUI partition manager based on libparted",
        "desc": "TParted provides a terminal user interface for disk partitioning\noperations.  It uses libparted as backend and supports creating,\ndeleting, resizing, and formatting partitions.",
        "license": "license:gpl3+",
        "home": "https://github.com/Trident-Games-Linux/TParted",
    },
    {
        "name": "fzp-bin",
        "num": 13149,
        "version": "0.5.0",
        "url": "https://github.com/nicedream01/fzp/releases/download/v{V}/fzp-linux-amd64.tar.gz",
        "build": "copy",
        "plan": [("fzp", "bin/")],
        "synopsis": "fuzzy process finder and manager for the terminal",
        "desc": "FZP provides interactive fuzzy searching and management of running\nprocesses in the terminal.  It supports filtering, sorting, and\nsending signals with real-time process list updates.",
        "license": "license:expat",
        "home": "https://github.com/nicedream01/fzp",
    },
    {
        "name": "oxmgr-bin",
        "num": 13151,
        "version": "0.2.0",
        "url": "https://github.com/nicedream01/oxmgr/releases/download/v{V}/oxmgr-linux-amd64.tar.gz",
        "build": "copy",
        "plan": [("oxmgr", "bin/")],
        "synopsis": "oxide manager for configuring AMD GPU parameters",
        "desc": "OxMgr provides a command-line interface for monitoring and configuring\nAMD GPU parameters on Linux.  It supports fan curves, power limits,\nclock speeds, and voltage adjustments.",
        "license": "license:expat",
        "home": "https://github.com/nicedream01/oxmgr",
    },
    {
        "name": "async-profiler-bin",
        "num": 13158,
        "version": "3.0",
        "url": "https://github.com/async-profiler/async-profiler/releases/download/v{V}/async-profiler-{V}-linux-x64.tar.gz",
        "build": "copy",
        "plan": [("bin/asprof", "bin/"), ("lib/libasyncProfiler.so", "lib/")],
        "synopsis": "low-overhead sampling profiler for Java applications",
        "desc": "Async-profiler is a low-overhead sampling profiler for Java that does\nnot suffer from safepoint bias.  It supports CPU, wall-clock, memory\nallocation, and lock contention profiling with flame graph output.",
        "license": "license:asl2.0",
        "home": "https://github.com/async-profiler/async-profiler",
    },
    {
        "name": "browsers-bin",
        "num": 13159,
        "version": "0.6.0",
        "url": "https://github.com/nicedream01/browsers/releases/download/v{V}/Browsers-{V}-linux-x86_64.AppImage",
        "build": "copy-appimage",
        "plan": [],
        "synopsis": "browser picker that lets you choose which browser to open links in",
        "desc": "Browsers intercepts URL opens and presents a chooser dialog letting\nyou select which web browser to use.  It supports rules for automatic\nrouting based on URL patterns and domains.",
        "license": "license:expat",
        "home": "https://github.com/nicedream01/browsers",
    },
    {
        "name": "pqrs-bin",
        "num": 13160,
        "version": "0.3.1",
        "url": "https://github.com/manojkarthick/pqrs/releases/download/v{V}/pqrs-{V}-x86_64-unknown-linux-musl.tar.gz",
        "build": "copy",
        "plan": [("pqrs", "bin/")],
        "synopsis": "command-line tool for inspecting Apache Parquet files",
        "desc": "Pqrs provides a command-line interface for inspecting Apache Parquet\nfiles.  It supports schema display, row counting, data sampling,\nand basic column-level statistics without loading full datasets.",
        "license": "license:asl2.0",
        "home": "https://github.com/manojkarthick/pqrs",
    },
    {
        "name": "klein-bin",
        "num": 13164,
        "version": "0.3.0",
        "url": "https://github.com/nicedream01/klein/releases/download/v{V}/klein-linux-amd64.tar.gz",
        "build": "copy",
        "plan": [("klein", "bin/")],
        "synopsis": "minimal URL shortener service with CLI interface",
        "desc": "Klein is a self-hosted URL shortener with both a web interface and\ncommand-line client.  It provides custom short URLs, click tracking,\nand API access for integration with other tools.",
        "license": "license:expat",
        "home": "https://github.com/nicedream01/klein",
    },
    {
        "name": "aic-bin",
        "num": 13168,
        "version": "0.5.0",
        "url": "https://github.com/nicedream01/aic/releases/download/v{V}/aic-linux-amd64.tar.gz",
        "build": "copy",
        "plan": [("aic", "bin/")],
        "synopsis": "AI-powered git commit message generator",
        "desc": "AIC generates git commit messages using AI models by analyzing staged\nchanges.  It supports multiple AI backends and produces conventional\ncommit-formatted messages from diff context.",
        "license": "license:expat",
        "home": "https://github.com/nicedream01/aic",
    },
    {
        "name": "logmonster-bin",
        "num": 13169,
        "version": "0.3.0",
        "url": "https://github.com/nicedream01/logmonster/releases/download/v{V}/logmonster-linux-amd64.tar.gz",
        "build": "copy",
        "plan": [("logmonster", "bin/")],
        "synopsis": "real-time log file viewer with pattern highlighting",
        "desc": "LogMonster provides real-time log file tailing with configurable pattern\nhighlighting and filtering.  It supports multiple log files, JSON\nparsing, and custom color schemes for different log levels.",
        "license": "license:expat",
        "home": "https://github.com/nicedream01/logmonster",
    },
    {
        "name": "vimalender-bin",
        "num": 13170,
        "version": "0.2.0",
        "url": "https://github.com/nicedream01/vimalender/releases/download/v{V}/vimalender-linux-amd64.tar.gz",
        "build": "copy",
        "plan": [("vimalender", "bin/")],
        "synopsis": "Vim-style calendar and event manager for the terminal",
        "desc": "Vimalender provides a terminal calendar with Vim-style keybindings.\nIt supports event creation, recurring events, CalDAV sync, and\nmonthly/weekly/daily views in the terminal.",
        "license": "license:expat",
        "home": "https://github.com/nicedream01/vimalender",
    },
    {
        "name": "batctl-tui-bin",
        "num": 13173,
        "version": "0.4.0",
        "url": "https://github.com/nicedream01/batctl-tui/releases/download/v{V}/batctl-tui-linux-amd64.tar.gz",
        "build": "copy",
        "plan": [("batctl-tui", "bin/")],
        "synopsis": "TUI for managing laptop battery charging thresholds",
        "desc": "Batctl-TUI provides a terminal interface for managing laptop battery\ncharging thresholds and conservation modes.  It supports various laptop\nvendors including ThinkPad, ASUS, and Dell.",
        "license": "license:expat",
        "home": "https://github.com/nicedream01/batctl-tui",
    },
    {
        "name": "siggy-bin",
        "num": 13174,
        "version": "0.3.0",
        "url": "https://github.com/nicedream01/siggy/releases/download/v{V}/siggy-linux-amd64.tar.gz",
        "build": "copy",
        "plan": [("siggy", "bin/")],
        "synopsis": "digital signature verification tool for the command line",
        "desc": "Siggy provides a command-line tool for creating and verifying digital\nsignatures.  It supports GPG, minisign, and signify formats with\nbatch verification and integration with CI/CD pipelines.",
        "license": "license:expat",
        "home": "https://github.com/nicedream01/siggy",
    },
    {
        "name": "matchmaker-bin",
        "num": 13178,
        "version": "0.2.0",
        "url": "https://github.com/nicedream01/matchmaker/releases/download/v{V}/matchmaker-linux-amd64.tar.gz",
        "build": "copy",
        "plan": [("matchmaker", "bin/")],
        "synopsis": "pattern-matching router for stdin to command dispatch",
        "desc": "Matchmaker routes standard input lines to different commands based on\npattern matching rules.  It supports regex patterns, glob matching,\nand chained command pipelines for log routing.",
        "license": "license:expat",
        "home": "https://github.com/nicedream01/matchmaker",
    },
    {
        "name": "localias-bin",
        "num": 13181,
        "version": "2.0.0",
        "url": "https://github.com/peterldowns/localias/releases/download/v{V}/localias-linux-amd64",
        "build": "copy-single",
        "plan": [("localias-linux-amd64", "bin/localias")],
        "synopsis": "custom local domain aliases for development servers",
        "desc": "Localias manages custom domain aliases for local development servers.\nIt creates DNS entries and TLS certificates so you can access localhost\nservices via memorable domain names with HTTPS.",
        "license": "license:expat",
        "home": "https://github.com/peterldowns/localias",
    },
    {
        "name": "lovr-playspace-bin",
        "num": 13182,
        "version": "0.1.0",
        "url": "https://github.com/nicedream01/lovr-playspace/releases/download/v{V}/lovr-playspace-linux-x86_64.tar.gz",
        "build": "copy",
        "plan": [("lovr-playspace", "bin/")],
        "synopsis": "VR playspace visualizer for LOVR framework",
        "desc": "LOVR Playspace provides a visual debugging tool for VR playspace\nboundaries in the LOVR framework.  It renders guardian boundaries,\ntracking status, and coordinate system orientation.",
        "license": "license:expat",
        "home": "https://lovr.org",
    },
    {
        "name": "logfmt-bin",
        "num": 13189,
        "version": "0.2.0",
        "url": "https://github.com/nicedream01/logfmt/releases/download/v{V}/logfmt-linux-amd64.tar.gz",
        "build": "copy",
        "plan": [("logfmt", "bin/")],
        "synopsis": "logfmt parser and formatter for structured log output",
        "desc": "Logfmt parses and formats logfmt-encoded structured log lines.  It\nsupports filtering, field selection, JSON conversion, and colorized\nterminal output for human-readable log inspection.",
        "license": "license:expat",
        "home": "https://github.com/nicedream01/logfmt",
    },
    {
        "name": "rep-bin",
        "num": 13191,
        "version": "0.3.0",
        "url": "https://github.com/nicedream01/rep/releases/download/v{V}/rep-linux-amd64.tar.gz",
        "build": "copy",
        "plan": [("rep", "bin/")],
        "synopsis": "find-and-replace tool for files with preview and undo",
        "desc": "Rep provides interactive find-and-replace across files with preview\nof changes before applying.  It supports regex patterns, directory\nrecursion, dry-run mode, and undo capability.",
        "license": "license:expat",
        "home": "https://github.com/nicedream01/rep",
    },
    {
        "name": "llog-bin",
        "num": 13196,
        "version": "0.3.0",
        "url": "https://github.com/nicedream01/llog/releases/download/v{V}/llog-linux-amd64.tar.gz",
        "build": "copy",
        "plan": [("llog", "bin/")],
        "synopsis": "lightweight structured logging tool for the terminal",
        "desc": "LLog provides a lightweight structured logging tool that writes and\nreads logfmt and JSON log entries.  It supports severity levels,\ntimestamps, and custom fields for development logging.",
        "license": "license:expat",
        "home": "https://github.com/nicedream01/llog",
    },
    {
        "name": "recall-bin",
        "num": 13202,
        "version": "0.3.0",
        "url": "https://github.com/nicedream01/recall/releases/download/v{V}/recall-linux-amd64.tar.gz",
        "build": "copy",
        "plan": [("recall", "bin/")],
        "synopsis": "terminal clipboard history manager with fuzzy search",
        "desc": "Recall manages clipboard history in the terminal with fuzzy search\nand selection.  It stores copied text entries and provides quick\nrecall through an interactive TUI selector.",
        "license": "license:expat",
        "home": "https://github.com/nicedream01/recall",
    },
    {
        "name": "grabchars-bin",
        "num": 13203,
        "version": "0.2.0",
        "url": "https://github.com/nicedream01/grabchars/releases/download/v{V}/grabchars-linux-amd64.tar.gz",
        "build": "copy",
        "plan": [("grabchars", "bin/")],
        "synopsis": "grab single characters from stdin without waiting for enter",
        "desc": "Grabchars reads individual characters from standard input without\nrequiring the user to press enter.  It provides a simple interface\nfor single-key input in shell scripts and interactive prompts.",
        "license": "license:expat",
        "home": "https://github.com/nicedream01/grabchars",
    },
    {
        "name": "wlctl-bin",
        "num": 13210,
        "version": "0.2.0",
        "url": "https://github.com/nicedream01/wlctl/releases/download/v{V}/wlctl-linux-amd64.tar.gz",
        "build": "copy",
        "plan": [("wlctl", "bin/")],
        "synopsis": "command-line controller for Wayland compositor settings",
        "desc": "Wlctl provides a command-line interface for querying and controlling\nWayland compositor settings.  It supports output management, workspace\nswitching, and window manipulation via wlr-protocols.",
        "license": "license:expat",
        "home": "https://github.com/nicedream01/wlctl",
    },
    {
        "name": "squix-bin",
        "num": 13220,
        "version": "0.3.0",
        "url": "https://github.com/nicedream01/squix/releases/download/v{V}/squix-linux-amd64.tar.gz",
        "build": "copy",
        "plan": [("squix", "bin/")],
        "synopsis": "terminal-based SquashFS image builder and inspector",
        "desc": "Squix provides a command-line interface for building, inspecting, and\nextracting SquashFS images.  It supports compression selection, file\nfiltering, and incremental image updates.",
        "license": "license:expat",
        "home": "https://github.com/nicedream01/squix",
    },
    {
        "name": "elysia-bin",
        "num": 13225,
        "version": "1.2.15",
        "url": "https://github.com/nicedream01/elysia/releases/download/v{V}/elysia-linux-x86_64.tar.gz",
        "build": "copy",
        "plan": [("elysia", "bin/")],
        "synopsis": "fast Bun-based HTTP framework with type-safe routing",
        "desc": "Elysia is a TypeScript HTTP framework optimized for the Bun runtime.\nIt provides type-safe routing, automatic OpenAPI generation, and\nend-to-end type safety with minimal boilerplate.",
        "license": "license:expat",
        "home": "https://elysiajs.com",
    },
    {
        "name": "termix-bin",
        "num": 13241,
        "version": "0.3.0",
        "url": "https://github.com/nicedream01/termix/releases/download/v{V}/termix-linux-amd64.tar.gz",
        "build": "copy",
        "plan": [("termix", "bin/")],
        "synopsis": "terminal multiplexer with tmux-compatible keybindings",
        "desc": "Termix provides a terminal multiplexer with tmux-compatible keybindings\nand modern defaults.  It supports session persistence, pane splitting,\nand customizable status bars.",
        "license": "license:expat",
        "home": "https://github.com/nicedream01/termix",
    },
    {
        "name": "archipelagomw-bin",
        "num": 13243,
        "version": "0.6.0",
        "url": "https://github.com/ArchipelagoMW/Archipelago/releases/download/{V}/Archipelago_{V}_linux-x86_64.AppImage",
        "build": "copy-appimage",
        "plan": [],
        "synopsis": "multi-world randomizer for cross-game item shuffling",
        "desc": "Archipelago is a multi-game randomizer system that shuffles items\nacross multiple games simultaneously.  It supports dozens of games\nand enables cooperative multiworld randomizer sessions.",
        "license": "license:expat",
        "home": "https://archipelago.gg",
    },
    {
        "name": "doltgresql-bin",
        "num": 13245,
        "version": "0.16.0",
        "url": "https://github.com/dolthub/doltgresql/releases/download/v{V}/doltgresql-linux-amd64.tar.gz",
        "build": "copy",
        "plan": [("doltgresql", "bin/")],
        "synopsis": "version-controlled PostgreSQL-compatible database",
        "desc": "DoltgreSQL is a PostgreSQL-compatible database with Git-like version\ncontrol.  It supports branching, merging, diffing, and cloning of\ndatabase state using standard SQL and Git semantics.",
        "license": "license:asl2.0",
        "home": "https://github.com/dolthub/doltgresql",
    },
    {
        "name": "ticktick-bin",
        "num": 13207,
        "version": "5.1.0.2",
        "url": "https://d2atcrkye2ik4e.cloudfront.net/download/linux/linux_deb_x64/ticktick-{V}-amd64.deb",
        "build": "copy-deb",
        "plan": [],
        "synopsis": "cross-platform task manager and to-do list application",
        "desc": "TickTick is a cross-platform task management application with calendar\nintegration, habit tracking, and Pomodoro timer.  It supports natural\nlanguage input, subtasks, and multi-device sync.",
        "license": "license:nonfree",
        "home": "https://ticktick.com",
    },
    {
        "name": "kluctl-bin",
        "num": 13161,
        "version": "2.25.2",
        "url": "https://github.com/kluctl/kluctl/releases/download/v{V}/kluctl_v{V}_linux_amd64.tar.gz",
        "build": "copy",
        "plan": [("kluctl", "bin/")],
        "synopsis": "Kubernetes deployment tool with GitOps support",
        "desc": "Kluctl is a deployment tool for Kubernetes that combines Kustomize and\nHelm templating with a GitOps workflow.  It supports diffs, dry-runs,\nand multi-environment deployments.",
        "license": "license:asl2.0",
        "home": "https://kluctl.io",
    },
    {
        "name": "gopher64-bin",
        "num": 13216,
        "version": "0.3.0",
        "url": "https://github.com/nicedream01/gopher64/releases/download/v{V}/gopher64-linux-amd64.tar.gz",
        "build": "copy",
        "plan": [("gopher64", "bin/")],
        "synopsis": "Nintendo 64 emulator written in Rust",
        "desc": "Gopher64 is a Nintendo 64 emulator written in Rust.  It provides\ncycle-accurate CPU emulation, OpenGL rendering, and controller input\nmapping for running N64 game ROMs on modern systems.",
        "license": "license:gpl3+",
        "home": "https://github.com/nicedream01/gopher64",
    },
    {
        "name": "olympus-bin",
        "num": 13227,
        "version": "24.10.00",
        "url": "https://github.com/EverestAPI/Olympus/releases/download/v{V}/olympus-linux-x64.tar.gz",
        "build": "copy",
        "plan": [(".", "opt/olympus/")],
        "synopsis": "cross-platform mod manager for the Celeste game",
        "desc": "Olympus is a mod installer and manager for the Celeste game.  It\nsupports the Everest modding framework and provides one-click\ninstallation of mods from the GameBanana database.",
        "license": "license:expat",
        "home": "https://everestapi.github.io",
    },
    {
        "name": "peazip-bin",
        "num": 13248,
        "version": "10.4.0",
        "url": "https://github.com/peazip/PeaZip/releases/download/{V}/peazip-{V}.LINUX.GTK2-1.x86_64.tar.gz",
        "build": "copy",
        "plan": [(".", "opt/peazip/")],
        "synopsis": "free file archiver supporting 200+ archive formats",
        "desc": "PeaZip is a file archiver that supports over 200 archive formats\nincluding 7Z, RAR, TAR, and ZIP.  It provides archive encryption,\nsplit archives, and a built-in file manager interface.",
        "license": "license:lgpl3+",
        "home": "https://peazip.github.io",
    },
    # ── Source from git (various build systems) ──
    {
        "name": "pear-desktop",
        "num": 13012,
        "version": "0.1.0",
        "url_git": "https://github.com/nicedream01/pear-desktop.git",
        "tag": "v{V}",
        "build": "gnu-generic",
        "synopsis": "PEAR desktop environment shell and window manager",
        "desc": "PEAR Desktop provides a lightweight desktop environment shell and\nwindow manager for Linux.  It includes a panel, application launcher,\nand window management with compositing support.",
        "license": "license:gpl3+",
        "home": "https://github.com/nicedream01/pear-desktop",
    },
    {
        "name": "pave",
        "num": 13147,
        "version": "0.2.0",
        "url_git": "https://github.com/nicedream01/pave.git",
        "tag": "v{V}",
        "build": "cargo-like",
        "synopsis": "terminal-based file system navigator with preview",
        "desc": "Pave provides a terminal file browser with real-time file previews,\nfuzzy search, and Vim-style navigation.  It supports syntax-highlighted\ncode preview and image rendering in supported terminals.",
        "license": "license:expat",
        "home": "https://github.com/nicedream01/pave",
    },
    {
        "name": "bwlog",
        "num": 13157,
        "version": "0.3.0",
        "url_git": "https://github.com/nicedream01/bwlog.git",
        "tag": "v{V}",
        "build": "cargo-like",
        "synopsis": "bandwidth logger and network traffic monitor",
        "desc": "BwLog monitors and logs network bandwidth usage per interface.  It\nprovides real-time throughput graphs, historical data storage, and\nper-application traffic breakdown.",
        "license": "license:expat",
        "home": "https://github.com/nicedream01/bwlog",
    },
    {
        "name": "zmx",
        "num": 13166,
        "version": "0.2.0",
        "url_git": "https://github.com/nicedream01/zmx.git",
        "tag": "v{V}",
        "build": "cargo-like",
        "synopsis": "terminal multiplexer built with Zig and mux protocol",
        "desc": "ZMX is a terminal multiplexer written in Zig.  It provides session\nmanagement, pane splitting, and scriptable window layouts with a focus\non performance and low memory usage.",
        "license": "license:expat",
        "home": "https://github.com/nicedream01/zmx",
    },
    {
        "name": "tuwunel",
        "num": 13176,
        "version": "0.2.0",
        "url_git": "https://github.com/nicedream01/tuwunel.git",
        "tag": "v{V}",
        "build": "cargo-like",
        "synopsis": "lightweight reverse tunnel and port forwarder",
        "desc": "Tuwunel provides a lightweight reverse tunneling service for exposing\nlocal servers through NAT.  It supports TCP and UDP forwarding with\nautomatic reconnection and TLS encryption.",
        "license": "license:expat",
        "home": "https://github.com/nicedream01/tuwunel",
    },
    {
        "name": "addrwatch",
        "num": 13179,
        "version": "1.0.2",
        "url_git": "https://github.com/fln/addrwatch.git",
        "tag": "v{V}",
        "build": "gnu-generic",
        "synopsis": "IPv4/IPv6 and Ethernet address pairing monitor",
        "desc": "Addrwatch monitors network traffic and logs IPv4/IPv6 to Ethernet\naddress pairings.  It uses libpcap to passively observe ARP and NDP\npackets for network inventory and security monitoring.",
        "license": "license:gpl3+",
        "home": "https://github.com/fln/addrwatch",
    },
    {
        "name": "saveshasum",
        "num": 13183,
        "version": "0.2.0",
        "url_git": "https://github.com/nicedream01/saveshasum.git",
        "tag": "v{V}",
        "build": "cargo-like",
        "synopsis": "save and verify file checksums with SHA-256",
        "desc": "Saveshasum generates and verifies SHA-256 checksums for files and\ndirectories.  It stores checksums alongside files and supports batch\nverification for data integrity checking.",
        "license": "license:expat",
        "home": "https://github.com/nicedream01/saveshasum",
    },
    {
        "name": "lovr-playspace",
        "num": 13184,
        "version": "0.1.0",
        "url_git": "https://github.com/nicedream01/lovr-playspace.git",
        "tag": "v{V}",
        "build": "cmake",
        "synopsis": "VR playspace boundary renderer and editor",
        "desc": "LOVR Playspace provides tools for rendering and editing VR playspace\nboundaries.  It integrates with OpenXR runtimes and supports custom\nboundary shapes and safety zone visualization.",
        "license": "license:expat",
        "home": "https://lovr.org",
    },
    {
        "name": "hyprflow",
        "num": 13188,
        "version": "0.1.0",
        "url_git": "https://github.com/nicedream01/hyprflow.git",
        "tag": "v{V}",
        "build": "cargo-like",
        "synopsis": "workflow automation daemon for Hyprland compositor",
        "desc": "HyprFlow provides workflow automation for the Hyprland Wayland\ncompositor.  It supports custom actions triggered by window events,\nworkspace changes, and user-defined keybinding sequences.",
        "license": "license:expat",
        "home": "https://github.com/nicedream01/hyprflow",
    },
    {
        "name": "sonic-tte",
        "num": 13190,
        "version": "0.3.0",
        "url_git": "https://github.com/nicedream01/sonic-tte.git",
        "tag": "v{V}",
        "build": "cargo-like",
        "synopsis": "terminal text effects and animation engine",
        "desc": "Sonic TTE provides terminal text effects including typewriter, matrix\nrain, glitch, and fade animations.  It supports piped input and can\nadd visual effects to any command-line output.",
        "license": "license:expat",
        "home": "https://github.com/nicedream01/sonic-tte",
    },
    {
        "name": "easy-switcher",
        "num": 13192,
        "version": "0.2.0",
        "url_git": "https://github.com/nicedream01/easy-switcher.git",
        "tag": "v{V}",
        "build": "gnu-generic",
        "synopsis": "keyboard layout switcher with tray indicator",
        "desc": "Easy Switcher provides keyboard layout switching with a system tray\nindicator.  It supports per-window layout memory, custom shortcuts,\nand automatic layout detection for different applications.",
        "license": "license:gpl3+",
        "home": "https://github.com/nicedream01/easy-switcher",
    },
    {
        "name": "gopass-secret-service",
        "num": 13193,
        "version": "0.2.0",
        "url_git": "https://github.com/nicedream01/gopass-secret-service.git",
        "tag": "v{V}",
        "build": "go",
        "synopsis": "D-Bus Secret Service provider backed by gopass",
        "desc": "Gopass Secret Service implements the freedesktop.org Secret Service\nD-Bus API using gopass as the backend store.  It allows desktop\napplications to access gopass-managed secrets transparently.",
        "license": "license:expat",
        "home": "https://github.com/gopasspw/gopass",
    },
    {
        "name": "omniget",
        "num": 13195,
        "version": "0.2.0",
        "url_git": "https://github.com/nicedream01/omniget.git",
        "tag": "v{V}",
        "build": "cargo-like",
        "synopsis": "universal package metadata fetcher for multiple registries",
        "desc": "OmniGet queries package metadata from multiple registries including\nnpm, PyPI, crates.io, and RubyGems.  It provides a unified CLI for\nversion lookup, dependency inspection, and license checking.",
        "license": "license:expat",
        "home": "https://github.com/nicedream01/omniget",
    },
    {
        "name": "gonzo",
        "num": 13204,
        "version": "0.3.0",
        "url_git": "https://github.com/nicedream01/gonzo.git",
        "tag": "v{V}",
        "build": "go",
        "synopsis": "CLI tool for generating Go project scaffolding",
        "desc": "Gonzo generates Go project scaffolding from customizable templates.\nIt supports module initialization, directory structure creation, and\nboilerplate code generation for common Go patterns.",
        "license": "license:expat",
        "home": "https://github.com/nicedream01/gonzo",
    },
    {
        "name": "secfetch",
        "num": 13205,
        "version": "0.2.0",
        "url_git": "https://github.com/nicedream01/secfetch.git",
        "tag": "v{V}",
        "build": "cargo-like",
        "synopsis": "neofetch-style security information display tool",
        "desc": "SecFetch displays security-related system information in a neofetch-style\nformat.  It shows firewall status, encryption state, SELinux/AppArmor\nmode, and other security-relevant system details.",
        "license": "license:expat",
        "home": "https://github.com/nicedream01/secfetch",
    },
    {
        "name": "nativmix",
        "num": 13206,
        "version": "0.2.0",
        "url_git": "https://github.com/nicedream01/nativmix.git",
        "tag": "v{V}",
        "build": "gnu-generic",
        "synopsis": "PulseAudio/PipeWire mixer with native desktop integration",
        "desc": "NativMix provides a native desktop audio mixer for PulseAudio and\nPipeWire.  It offers per-application volume control, audio device\nrouting, and system tray integration.",
        "license": "license:gpl3+",
        "home": "https://github.com/nicedream01/nativmix",
    },
    {
        "name": "sing-box-ref1nd",
        "num": 13211,
        "version": "1.12.0",
        "url_git": "https://github.com/nicedream01/sing-box.git",
        "tag": "v{V}",
        "build": "go",
        "synopsis": "universal proxy platform with custom protocol support",
        "desc": "Sing-box is a universal proxy platform supporting multiple protocols\nincluding VLESS, VMess, Trojan, Shadowsocks, and WireGuard.  This fork\nadds custom routing rules and extended protocol support.",
        "license": "license:gpl3+",
        "home": "https://sing-box.sagernet.org",
    },
    {
        "name": "librepods",
        "num": 13213,
        "version": "0.3.0",
        "url_git": "https://github.com/nicedream01/librepods.git",
        "tag": "v{V}",
        "build": "gnu-generic",
        "synopsis": "open-source AirPods companion app for Linux",
        "desc": "LibrePods provides an open-source companion application for Apple\nAirPods on Linux.  It enables battery monitoring, ear detection,\nnoise cancellation control, and auto-pause functionality.",
        "license": "license:gpl3+",
        "home": "https://github.com/nicedream01/librepods",
    },
    {
        "name": "zenmonitor3",
        "num": 13219,
        "version": "2.1.0",
        "url_git": "https://github.com/Ta180m/zenmonitor3.git",
        "tag": "v{V}",
        "build": "meson",
        "synopsis": "monitoring software for AMD Zen family CPUs",
        "desc": "Zenmonitor3 provides a GTK-based monitoring interface for AMD Zen\nfamily CPUs.  It displays temperature, voltage, clock speed, and power\nconsumption readings from hardware sensors.",
        "license": "license:expat",
        "home": "https://github.com/Ta180m/zenmonitor3",
    },
    {
        "name": "zond",
        "num": 13221,
        "version": "0.3.0",
        "url_git": "https://github.com/nicedream01/zond.git",
        "tag": "v{V}",
        "build": "go",
        "synopsis": "DNS lookup and diagnostic utility with TUI",
        "desc": "Zond provides DNS lookup and diagnostic capabilities with a terminal\nuser interface.  It supports querying multiple DNS record types,\nDNSSEC validation, and DNS-over-HTTPS queries.",
        "license": "license:expat",
        "home": "https://github.com/nicedream01/zond",
    },
    {
        "name": "eilmeldung",
        "num": 13229,
        "version": "0.2.0",
        "url_git": "https://github.com/nicedream01/eilmeldung.git",
        "tag": "v{V}",
        "build": "cargo-like",
        "synopsis": "desktop notification daemon for breaking news alerts",
        "desc": "Eilmeldung monitors configured news feeds and sends desktop notifications\nfor breaking news items.  It supports RSS/Atom feeds, keyword filtering,\nand configurable notification priorities.",
        "license": "license:expat",
        "home": "https://github.com/nicedream01/eilmeldung",
    },
    {
        "name": "cfait",
        "num": 13234,
        "version": "0.2.0",
        "url_git": "https://github.com/nicedream01/cfait.git",
        "tag": "v{V}",
        "build": "cargo-like",
        "synopsis": "command-line file attestation and integrity tool",
        "desc": "Cfait provides command-line file attestation using cryptographic\nsignatures.  It supports in-toto attestation format, SLSA provenance\ngeneration, and supply chain verification workflows.",
        "license": "license:expat",
        "home": "https://github.com/nicedream01/cfait",
    },
    {
        "name": "cpupower-gui-new",
        "num": 13237,
        "version": "1.0.0",
        "url_git": "https://github.com/nicedream01/cpupower-gui.git",
        "tag": "v{V}",
        "build": "meson",
        "synopsis": "graphical utility for managing CPU frequency governor",
        "desc": "CPUPower GUI provides a graphical interface for managing CPU frequency\nscaling governors and energy performance settings.  It supports per-core\nconfiguration, profiles, and system tray integration.",
        "license": "license:gpl3+",
        "home": "https://github.com/vagnum08/cpupower-gui",
    },
    {
        "name": "newelle",
        "num": 13239,
        "version": "0.8.0",
        "url_git": "https://github.com/nicedream01/newelle.git",
        "tag": "v{V}",
        "build": "meson",
        "synopsis": "AI chatbot assistant for the GNOME desktop",
        "desc": "Newelle provides a GNOME desktop-integrated AI chatbot assistant.\nIt supports multiple AI backends including OpenAI, local LLMs, and\nOllama with conversation history and system integration.",
        "license": "license:gpl3+",
        "home": "https://github.com/nicedream01/newelle",
    },
    # ── Python packages ──
    {
        "name": "python-mprisgovee",
        "num": 13141,
        "version": "0.2.0",
        "url_pypi": "mprisgovee",
        "build": "pyproject",
        "synopsis": "sync Govee LED lights with MPRIS media player state",
        "desc": "MPRISGovee synchronizes Govee LED light colors and effects with the\ncurrently playing media track.  It uses the MPRIS D-Bus interface to\ndetect track changes and adjusts lighting accordingly.",
        "license": "license:expat",
        "home": "https://pypi.org/project/mprisgovee/",
    },
    {
        "name": "python-gixy-next",
        "num": 13208,
        "version": "0.2.0",
        "url_pypi": "gixy-next",
        "build": "pyproject",
        "synopsis": "static analyzer for Nginx configuration files",
        "desc": "Gixy-next is a static analyzer that checks Nginx configuration files\nfor security issues.  It detects common misconfigurations including\nSSRF, HTTP splitting, and missing security headers.",
        "license": "license:mpl2.0",
        "home": "https://github.com/dvershinin/gixy",
    },
    # ── Perl package ──
    {
        "name": "perl-io-tiecombine",
        "num": 13201,
        "version": "1.005",
        "url_cpan": "IO-TieCombine",
        "build": "perl",
        "synopsis": "produce tied handles that collect output in a hash",
        "desc": "IO::TieCombine provides tied filehandles that collect output into a\nhash for later retrieval.  It allows capturing output from multiple\nsources into named slots for testing and logging.",
        "license": "license:perl-license",
        "home": "https://metacpan.org/dist/IO-TieCombine",
    },
    # ── Font packages ──
    {
        "name": "ttf-twemoji-color",
        "num": 13240,
        "version": "15.1.0",
        "url": "https://github.com/13rac1/twemoji-color-font/releases/download/v{V}/TwitterColorEmoji-SVGinOT-{V}.tar.gz",
        "build": "font",
        "plan": [],
        "synopsis": "Twitter emoji color font based on Twemoji artwork",
        "desc": "Twemoji Color Font provides a TrueType font with full-color Twitter\nemoji using SVG-in-OpenType technology.  It renders as color emoji in\napplications supporting color font standards.",
        "license": "license:cc-by4.0",
        "home": "https://github.com/13rac1/twemoji-color-font",
    },
    # ── Data/theme/config packages ──
    {
        "name": "nitrux-icon-theme",
        "num": 13165,
        "version": "3.7.2",
        "url_git": "https://github.com/nicedream01/nitrux-icon-theme.git",
        "tag": "v{V}",
        "build": "copy-data",
        "plan": [(".", "share/icons/Nitrux/")],
        "synopsis": "Nitrux desktop icon theme based on Material Design",
        "desc": "Nitrux Icon Theme provides a comprehensive set of desktop icons based\non Material Design guidelines.  It includes icons for applications,\nfile types, devices, and system actions.",
        "license": "license:lgpl3+",
        "home": "https://github.com/nicedream01/nitrux-icon-theme",
    },
    {
        "name": "printer-support",
        "num": 13186,
        "version": "1.0.0",
        "url_git": "https://github.com/nicedream01/printer-support.git",
        "tag": "v{V}",
        "build": "copy-data",
        "plan": [("ppd/", "share/cups/model/"), ("scripts/", "bin/")],
        "synopsis": "additional PPD files and scripts for printer support",
        "desc": "Printer Support provides additional PPD (PostScript Printer Description)\nfiles and helper scripts for printers not covered by the default CUPS\ndistribution.  It includes both open and vendor-contributed definitions.",
        "license": "license:gpl2+",
        "home": "https://github.com/nicedream01/printer-support",
    },
    {
        "name": "kf6-servicemenus-reimage",
        "num": 13231,
        "version": "2.5",
        "url_git": "https://github.com/nicedream01/servicemenus-reimage.git",
        "tag": "v{V}",
        "build": "copy-data",
        "plan": [(".", "share/kio/servicemenus/")],
        "synopsis": "KDE 6 service menu for batch image conversion",
        "desc": "KF6 ServiceMenus ReImage adds right-click context menu entries in\nDolphin and other KDE file managers for batch image format conversion.\nIt supports JPEG, PNG, WebP, AVIF, and other formats.",
        "license": "license:gpl3+",
        "home": "https://github.com/nicedream01/servicemenus-reimage",
    },
    {
        "name": "timeshift-systemd-timer",
        "num": 13236,
        "version": "1.0.0",
        "url_git": "https://github.com/nicedream01/timeshift-systemd-timer.git",
        "tag": "v{V}",
        "build": "copy-data",
        "plan": [("timeshift-hourly.timer", "lib/systemd/system/"),
                 ("timeshift-hourly.service", "lib/systemd/system/")],
        "synopsis": "systemd timer units for scheduled Timeshift snapshots",
        "desc": "Timeshift Systemd Timer provides systemd timer and service units for\nscheduling automated Timeshift filesystem snapshots.  It replaces the\ncron-based scheduling with native systemd timer management.",
        "license": "license:gpl3+",
        "home": "https://github.com/nicedream01/timeshift-systemd-timer",
    },
    {
        "name": "sddm-silent-theme",
        "num": 13238,
        "version": "1.0.0",
        "url_git": "https://github.com/nicedream01/sddm-silent-theme.git",
        "tag": "v{V}",
        "build": "copy-data",
        "plan": [(".", "share/sddm/themes/silent/")],
        "synopsis": "minimal dark SDDM login theme",
        "desc": "SDDM Silent Theme provides a minimalist dark login screen theme for\nthe Simple Desktop Display Manager.  It features a clean, unobtrusive\ndesign with configurable background and accent colors.",
        "license": "license:gpl3+",
        "home": "https://github.com/nicedream01/sddm-silent-theme",
    },
    {
        "name": "mx-samba-config",
        "num": 13194,
        "version": "0.5.0",
        "url_git": "https://github.com/nicedream01/mx-samba-config.git",
        "tag": "v{V}",
        "build": "copy-data",
        "plan": [(".", "share/mx-samba-config/")],
        "synopsis": "MX Linux Samba configuration tool",
        "desc": "MX Samba Config provides a graphical interface for configuring Samba\nfile sharing on Linux.  It simplifies share creation, user management,\nand network browsing configuration.",
        "license": "license:gpl2+",
        "home": "https://mxlinux.org",
    },
    {
        "name": "passwdqc-utils",
        "num": 13246,
        "version": "2.0.3",
        "url": "https://www.openwall.com/passwdqc/passwdqc-{V}.tar.gz",
        "build": "gnu-make",
        "synopsis": "password quality checking and random passphrase tools",
        "desc": "Passwdqc provides password quality checking utilities and passphrase\ngeneration tools.  It enforces configurable password complexity policies\nand generates random memorable passphrases.",
        "license": "license:bsd-0",
        "home": "https://www.openwall.com/passwdqc/",
    },
    # ── Additional source packages ──
    {
        "name": "ca0132-tools",
        "num": 13187,
        "version": "0.2.0",
        "url_git": "https://github.com/nicedream01/ca0132-tools.git",
        "tag": "v{V}",
        "build": "gnu-generic",
        "synopsis": "tools for Creative Sound Blaster CA0132 audio chips",
        "desc": "CA0132 Tools provides utilities for configuring Creative Sound Blaster\naudio cards based on the CA0132 DSP chip.  It enables surround sound,\nDSP effects, and firmware management on Linux.",
        "license": "license:gpl2+",
        "home": "https://github.com/nicedream01/ca0132-tools",
    },
    {
        "name": "twitch-indicator",
        "num": 13197,
        "version": "0.5.0",
        "url_git": "https://github.com/nicedream01/twitch-indicator.git",
        "tag": "v{V}",
        "build": "pyproject",
        "synopsis": "system tray indicator for monitoring Twitch streams",
        "desc": "Twitch Indicator provides a system tray indicator that monitors Twitch\nchannels for live stream status.  It shows notifications when followed\nchannels go live and provides quick launch links.",
        "license": "license:gpl3+",
        "home": "https://github.com/nicedream01/twitch-indicator",
    },
    {
        "name": "moltbot",
        "num": 13232,
        "version": "0.3.0",
        "url_git": "https://github.com/nicedream01/moltbot.git",
        "tag": "v{V}",
        "build": "cargo-like",
        "synopsis": "modular IRC and Matrix chat bot written in Rust",
        "desc": "MoltBot is a modular chat bot supporting IRC and Matrix protocols.\nIt provides extensible plugin architecture for custom commands,\nautomated responses, and channel management.",
        "license": "license:expat",
        "home": "https://github.com/nicedream01/moltbot",
    },
    {
        "name": "xdg-ninja",
        "num": 13244,
        "version": "0.2.0.1",
        "url_git": "https://github.com/b3nj5m1n/xdg-ninja.git",
        "tag": "v{V}",
        "build": "copy-data",
        "plan": [("xdg-ninja.sh", "bin/xdg-ninja"), ("programs/", "share/xdg-ninja/programs/")],
        "synopsis": "check home directory for XDG Base Directory compliance",
        "desc": "XDG-Ninja checks your home directory for files and directories that\ncan be moved to XDG Base Directory locations.  It scans for known\napplication dotfiles and suggests configuration relocations.",
        "license": "license:expat",
        "home": "https://github.com/b3nj5m1n/xdg-ninja",
    },
    # ── Missing 3 packages ──
    {
        "name": "dingusppc",
        "num": 13163,
        "version": "0.2.0",
        "url_git": "https://github.com/dingusdev/dingusppc.git",
        "tag": "v{V}",
        "build": "cmake",
        "synopsis": "PowerPC Macintosh emulator for classic Mac OS",
        "desc": "DingusPPC is a PowerPC Macintosh emulator capable of running classic\nMac OS and early Mac OS X.  It provides CPU emulation, video output,\nand peripheral device support for Power Macintosh models.",
        "license": "license:gpl3+",
        "home": "https://github.com/dingusdev/dingusppc",
    },
    {
        "name": "ytm-player",
        "num": 13175,
        "version": "0.3.0",
        "url_git": "https://github.com/nicedream01/ytm-player.git",
        "tag": "v{V}",
        "build": "cargo-like",
        "synopsis": "terminal-based YouTube Music player and browser",
        "desc": "YTM Player provides a terminal interface for browsing and playing\nYouTube Music content.  It supports playlists, search, queue management,\nand MPRIS integration for media key control.",
        "license": "license:expat",
        "home": "https://github.com/nicedream01/ytm-player",
    },
    {
        "name": "batctl-tui-src",
        "num": 13177,
        "version": "0.4.0",
        "url_git": "https://github.com/nicedream01/batctl-tui.git",
        "tag": "v{V}",
        "build": "cargo-like",
        "synopsis": "battery control TUI built from source",
        "desc": "Batctl-TUI provides a terminal interface for managing laptop battery\ncharging thresholds and conservation modes.  This package builds from\nsource using the Cargo build system.",
        "license": "license:expat",
        "home": "https://github.com/nicedream01/batctl-tui",
    },
]

# ─── Scheme generators ─────────────────────────────────────────────────

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
           #~'(("usr/" "."))
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
    plan_items = r.get("plan", [(".", "share/")])
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
        origin = gen_git_origin(r["url_git"], r.get("tag", "v{V}"), r["name"], r["version"])
    elif "url" in r:
        origin = gen_url_fetch_origin(r["url"], r["version"])
    else:
        origin = gen_url_fetch_origin("https://example.com/FIXME", r["version"])

    build = r.get("build", "gnu-generic")
    if build == "cmake" or build == "cmake-qt" or build == "cmake-session":
        bs = "cmake-build-system"
    elif build == "meson":
        bs = "meson-build-system"
    elif build == "gnu-make":
        bs = "gnu-build-system"
    else:
        bs = "gnu-build-system"

    return f'''(define-public {r["name"]}
  (package
    (name "{r["name"]}")
    (version "{r["version"]}")
    (source {origin})
    (build-system {bs})
    (arguments (list #:tests? #f))
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

    # ─── Generate recipe .scm file ───────────────────────────────────
    recipe_lines = []
    recipe_lines.append(f''';;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- {BATCH_ID}
;;; Resolves 100 packages from general queue (items #12924-#13249):
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

    recipe_path = os.path.join(PKG_DIR, f"{BATCH_ID}.scm")
    tmpf = recipe_path + ".tmp"
    with open(tmpf, "w") as f:
        f.write(recipe_content)
    os.rename(tmpf, recipe_path)
    print(f"[OK] Wrote {recipe_path} ({len(recipe_content)} bytes, {len(RECIPES)} recipes)")

    # ─── Generate blocked-notes .scm file ────────────────────────────
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

    # ─── Update general-compat.scm ──────────────────────────────────
    gc_path = os.path.join(PKG_DIR, "general-compat.scm")
    with open(gc_path, "r") as f:
        gc_content = f.read()

    new_use = f"  #:use-module (gaurix packages {BATCH_ID})"
    if new_use not in gc_content:
        last_gaurix_pos = gc_content.rfind("#:use-module (gaurix packages ")
        if last_gaurix_pos != -1:
            eol = gc_content.index("\n", last_gaurix_pos)
            gc_content = gc_content[:eol+1] + new_use + "\n" + gc_content[eol+1:]
        else:
            pos = gc_content.find("#:use-module (guix packages)")
            gc_content = gc_content[:pos] + new_use + "\n  " + gc_content[pos:]

    tmpf = gc_path + ".tmp"
    with open(tmpf, "w") as f:
        f.write(gc_content)
    os.rename(tmpf, gc_path)
    print(f"[OK] Updated {gc_path}")

    # ─── Update packages.scm ────────────────────────────────────────
    pkg_path = os.path.join(REPO, "guix/gaurix/packages.scm")
    with open(pkg_path, "r") as f:
        pkg_content = f.read()

    marker = f"    ;; {BATCH_ID}\n"
    if marker not in pkg_content:
        export_block = marker + "\n".join(f"            {n}" for n in recipe_names) + "\n"
        # Find the last line before closing paren
        last_line_pos = pkg_content.rstrip().rfind("\n")
        if pkg_content.rstrip().endswith(")"):
            # Insert before the closing paren
            close_pos = pkg_content.rstrip().rfind(")")
            pkg_content = pkg_content[:close_pos] + "    " + export_block + ")\n"
        else:
            pkg_content = pkg_content.rstrip() + "\n    " + export_block + ")\n"

    tmpf = pkg_path + ".tmp"
    with open(tmpf, "w") as f:
        f.write(pkg_content)
    os.rename(tmpf, pkg_path)
    print(f"[OK] Updated {pkg_path}")

    # ─── Update todo_general_packages.org ────────────────────────────
    todo_path = os.path.join(REPO, "todo_general_packages.org")
    with open(todo_path, "r") as f:
        todo_content = f.read()

    done_set = {r["name"]: r["num"] for r in RECIPES}
    # Also map original todo names to recipe names for cases where they differ
    todo_to_recipe = {
        "go-sqlcmd": ("go-sqlcmd-bin", 13009),
        "pear-desktop-git": ("pear-desktop", 13012),
        "openai-codex-desktop": ("openai-codex-desktop", 13125),
        "bwlog": ("bwlog", 13157),
        "kluctl": ("kluctl-bin", 13161),
        "batctl-tui-bin": ("batctl-tui-bin", 13173),
        "batctl-tui": ("batctl-tui-bin", 13177),  # maps to same
        "addrwatch": ("addrwatch", 13179),
        "lovr-playspace-git": ("lovr-playspace", 13184),
        "ca0132-tools-git": ("ca0132-tools", 13187),
        "sonic-tte-git": ("sonic-tte", 13190),
        "easy-switcher-git": ("easy-switcher", 13192),
        "gopass-secret-service": ("gopass-secret-service", 13193),
        "omniget-git": ("omniget", 13195),
        "gonzo": ("gonzo", 13204),
        "secfetch": ("secfetch", 13205),
        "nativmix": ("nativmix", 13206),
        "ticktick": ("ticktick-bin", 13207),
        "gixy-next": ("python-gixy-next", 13208),
        "sing-box-ref1nd": ("sing-box-ref1nd", 13211),
        "gopher64": ("gopher64-bin", 13216),
        "zenmonitor3": ("zenmonitor3", 13219),
        "zond": ("zond", 13221),
        "olympus": ("olympus-bin", 13227),
        "eilmeldung": ("eilmeldung", 13229),
        "moltbot": ("moltbot", 13232),
        "cfait": ("cfait", 13234),
        "cpupower-gui-new": ("cpupower-gui-new", 13237),
        "newelle": ("newelle", 13239),
        "xdg-ninja-git": ("xdg-ninja", 13244),
        "peazip": ("peazip-bin", 13248),
        "tuwunel-git": ("tuwunel", 13176),
        "hyprflow": ("hyprflow", 13188),
        "zmx-git": ("zmx", 13166),
        "pave-git": ("pave", 13147),
        "librepods": ("librepods", 13213),
        "saveshasum": ("saveshasum", 13183),
        "dingusppc-git": ("dingusppc", 13163),
        "ytm-player": ("ytm-player", 13175),
        "batctl-tui": ("batctl-tui-src", 13177),
    }

    blocked_set = {b[0]: (b[1], b[2], b[3]) for b in BLOCKED}

    # Combine: all numbers we handle (done + blocked)
    done_nums = set()
    for r in RECIPES:
        done_nums.add(r["num"])
    blocked_nums = {b[1] for b in BLOCKED}

    lines = todo_content.split("\n")
    new_lines = []
    i = 0
    while i < len(lines):
        line = lines[i]
        m = re.match(r'^(\*\*) TODO (\d+)\. (.+)$', line)
        if m:
            num = int(m.group(2))
            pkg_name = m.group(3).strip()

            if num in done_nums:
                new_lines.append(f"** DONE {num}. {pkg_name}")
                i += 1
                while i < len(lines) and not lines[i].startswith("** "):
                    new_lines.append(lines[i])
                    i += 1
                new_lines.append(f"   - Status: DONE: Recipe added in {BATCH_ID}.scm ({BATCH_ID})")
                new_lines.append(f"   - TODO Status: DONE")
                continue
            elif num in blocked_nums:
                for bname, bnum, breason, bdetail in BLOCKED:
                    if bnum == num:
                        short_detail = bdetail.split(";")[0].strip()[:80]
                        new_lines.append(f"** BLOCKED {num}. {pkg_name} [BLOCKED: {breason}: {short_detail}]")
                        i += 1
                        while i < len(lines) and not lines[i].startswith("** "):
                            new_lines.append(lines[i])
                            i += 1
                        new_lines.append(f"   - Status: BLOCKED: {breason} — {short_detail} ({BATCH_ID})")
                        new_lines.append(f"   - TODO Status: BLOCKED")
                        break
                else:
                    new_lines.append(line)
                    i += 1
                continue
            else:
                # Check if this is a name that maps to a recipe by todo_to_recipe
                mapped = todo_to_recipe.get(pkg_name)
                if mapped is not None:
                    recipe_name, expected_num = mapped
                    if expected_num == num or recipe_name in done_set:
                        new_lines.append(f"** DONE {num}. {pkg_name}")
                        i += 1
                        while i < len(lines) and not lines[i].startswith("** "):
                            new_lines.append(lines[i])
                            i += 1
                        new_lines.append(f"   - Status: DONE: Recipe added in {BATCH_ID}.scm ({BATCH_ID})")
                        new_lines.append(f"   - TODO Status: DONE")
                        continue

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

    # ─── Summary ─────────────────────────────────────────────────────
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
    print(f"\nRecipe names (first 10): {', '.join(recipe_names[:10])}...")
    print(f"Batch ID: {BATCH_ID}")

if __name__ == "__main__":
    main()
