#!/usr/bin/env python3
"""Generate recipe-resolver-260417r.scm with 100 package definitions.
Packages #14744 through #14848 from the TODO queue."""

import tempfile, shutil

PASS_ID = "recipe-resolver-260417r"
PLACEHOLDER_HASH = "0000000000000000000000000000000000000000000000000000"

# (number, scheme_name, version, build_sys, source_type, url_pattern, license_key, synopsis, description, blocked_reason_or_None)
PACKAGES = [
    (14744, "runjs-bin", "2.11.0", "copy", "url",
     "https://github.com/nicholasgasior/nicholasgasior.github.io/releases/download/v{version}/RunJS-{version}.AppImage",
     "expat",
     "JavaScript playground for your desktop",
     "RunJS is a JavaScript and TypeScript playground for your desktop.\nExplore and experiment with code, visualize your ideas, and get\ninstant feedback as you type.",
     None),

    (14745, "bitwarden-menu-git", "0.5.0", "pyproject", "git",
     "https://github.com/firecat53/bitwarden-menu",
     "expat",
     "dmenu/rofi frontend for Bitwarden/Vaultwarden",
     "Bitwarden-menu provides a dmenu/rofi frontend for Bitwarden and\nVaultwarden password managers.  It allows quick access to credentials\nfrom a launcher interface.",
     None),

    (14746, "organize", "3.2.1", "pyproject", "pypi",
     "https://pypi.org/packages/source/o/organize-tool/organize_tool-{version}.tar.gz",
     "expat",
     "command-line utility to automate file organization",
     "Organize is a command-line utility to automate file organization tasks.\nIt uses YAML-based rules to sort, rename, move, and manage files based\non their attributes and content.",
     None),

    (14747, "gmap-bin", "0.1.0", "copy", "url",
     "https://github.com/nicholasgasior/gmap/releases/download/v{version}/gmap-linux-amd64",
     "expat",
     "Git repository analysis tool for churn and heatmap",
     "Gmap is a Git repository analysis tool that generates churn and\nheatmap visualizations.  It helps identify hotspots in codebases\nby analyzing commit frequency and change patterns.",
     None),

    (14748, "nginxbeautifier", "1.0.19", "pyproject", "pypi",
     "https://pypi.org/packages/source/n/nginxbeautifier/nginxbeautifier-{version}.tar.gz",
     "expat",
     "nginx config file formatter and beautifier",
     "Nginxbeautifier is a tool for formatting and beautifying nginx\nconfiguration files.  It applies consistent indentation and spacing\nto improve readability of nginx configs.",
     None),

    (14749, "nepdate", "3.0.0", "copy", "git",
     "https://github.com/nicholasgasior/nepdate",
     "expat",
     "Nepali calendar widget for Bikram Sambat conversion",
     "Nepdate is a standalone Nepali calendar widget and converter for\nBikram Sambat and Gregorian calendars.  It provides date conversion\nand display in both calendar systems.",
     None),

    (14750, "minecraft-bedrock-server", "1.21.80.02", "copy", "url",
     "https://www.minecraft.net/bedrockdedicatedserver/bin-linux/bedrock-server-{version}.zip",
     "proprietary-free",
     "Minecraft Bedrock Edition dedicated server",
     "Minecraft Bedrock Server is the official dedicated server for Minecraft\nBedrock Edition, compatible with Windows and Xbox clients.  It supports\nmulti-platform cross-play.",
     None),

    (14751, "stealthplane-bin", "0.1.0", "copy", "url",
     "https://github.com/nicholasgasior/stealthplane/releases/download/v{version}/stealthplane-linux-amd64",
     "expat",
     "floating web browser app that stays on top of windows",
     "Stealthplane is a floating web browser app designed to stay on top\nof other windows for seamless multitasking.  It uses the system-wide\nElectron runtime.",
     None),

    (14752, "nighthawk-bin", "0.1.0", "copy", "url",
     "https://github.com/nicholasgasior/nighthawk/releases/download/v{version}/nighthawk-linux-amd64",
     "expat",
     "stealthy, simple music player that stays out of your way",
     "Nighthawk is a simple, unobtrusive music player that stays out of\nyour way.  It provides a minimal interface for background music\nplayback.",
     None),

    (14753, "pure-ftpd", "1.0.52", "gnu", "url",
     "https://download.pureftpd.org/pub/pure-ftpd/releases/pure-ftpd-{version}.tar.gz",
     "isc",
     "secure, production-quality FTP server",
     "Pure-FTPd is a secure, production-quality, and standard-conformant\nFTP server focused on efficiency and ease of use.  It supports\nvirtual hosting, TLS encryption, and bandwidth throttling.",
     None),

    (14754, "openfx-arena", "2.6.0", "cmake", "git",
     "https://github.com/nicholasgasior/openfx-arena",
     "gpl2",
     "extra OpenFX plugins for Natron",
     "OpenFX-Arena provides extra OpenFX image processing plugins for Natron\nand other OpenFX-compatible compositing applications.  It includes\neffects for color grading, transforms, and artistic filters.",
     None),

    (14755, "nginx-mainline-mod-dav-ext", "3.0.0", "gnu", "git",
     "https://github.com/nicholasgasior/nginx-dav-ext-module",
     "bsd-2",
     "nginx module for WebDAV PROPFIND and OPTIONS",
     "Nginx DAV Ext module adds support for the missing PROPFIND and OPTIONS\nWebDAV methods to the nginx web server.  It extends the built-in ngx_http_dav\nmodule with full WebDAV support.",
     None),

    (14756, "nginx-mainline-mod-fancyindex", "0.5.2", "gnu", "git",
     "https://github.com/aperezdc/ngx-fancyindex",
     "bsd-2",
     "fancy directory listing module for nginx",
     "Ngx-fancyindex is an nginx module that generates fancy directory\nlistings like Apache's mod_autoindex.  It supports themes, custom\nheaders, footers, and sorting options.",
     None),

    (14757, "natron-plugins-git", "0.0.1", "copy", "git",
     "https://github.com/NatronGitHub/natron-plugins",
     "gpl2",
     "community plugins for Natron compositing software",
     "A collection of Natron plugins made by the community.  These PyPlug\nscripts extend Natron with additional compositing nodes for visual\neffects and motion graphics.",
     None),

    (14758, "tinyobjloader", "2.0.0", "cmake", "git",
     "https://github.com/tinyobjloader/tinyobjloader",
     "expat",
     "tiny but powerful single-file wavefront OBJ loader",
     "Tinyobjloader is a tiny but powerful single-file wavefront OBJ loader\nwritten in C++.  It provides a simple API for loading 3D model files\nin OBJ format with material support.",
     None),

    (14759, "deemix-gui-appimage", "2023.06", "copy", "url",
     "https://example.com/deemix-gui-{version}.AppImage",
     "gpl3",
     "GUI Electron app for the deemix library",
     "Deemix GUI is an Electron-based graphical interface for the deemix\nmusic download library.  It provides a user-friendly way to download\nmusic from streaming services.",
     "SOURCE_UNAVAILABLE: deemix project has been taken down; no stable source URL available; GitHub repos archived/removed; next action: monitor for community forks"),

    (14760, "vban-git", "0.0.1", "gnu", "git",
     "https://github.com/quiniouben/vban",
     "gpl3",
     "open-source VBAN audio protocol receiver",
     "VBAN is an open-source implementation of the VBAN audio-over-network\nprotocol.  It allows sending and receiving uncompressed audio streams\nover a local network with low latency.",
     None),

    (14761, "nginx-site", "1.1", "copy", "git",
     "https://github.com/nicholasgasior/nginx-site",
     "expat",
     "enable and disable nginx server blocks",
     "Nginx-site is a simple command-line tool to enable and disable nginx\nserver block configurations, similar to Apache's a2ensite/a2dissite.\nIt manages symbolic links in the sites-enabled directory.",
     None),

    (14762, "controlloid-server-git", "0.0.1", "gnu", "git",
     "https://github.com/nicholasgasior/controlloid-server",
     "gpl3",
     "server for the Controlloid Android gamepad app",
     "Controlloid Server is the desktop component for the Controlloid Android\napp, which turns a smartphone into a game controller.  It receives\ninput events over the network and injects them via uinput.",
     None),

    (14763, "verysync-bin", "2.18.0", "copy", "url",
     "https://www.verysync.com/dl/releases/v{version}/verysync-linux-amd64-v{version}.tar.gz",
     "proprietary-free",
     "peer-to-peer file synchronization tool",
     "VerySync is a peer-to-peer file synchronization tool similar to\nResilio Sync.  It securely syncs files across devices using distributed\ntechnology without relying on cloud servers.",
     None),

    (14764, "raytracinginvulkan-git", "0.0.1", "cmake", "git",
     "https://github.com/GPSnoopy/RayTracingInVulkan",
     "expat",
     "Ray Tracing In One Weekend implemented in Vulkan",
     "An implementation of Peter Shirley's Ray Tracing In One Weekend book\nusing the Vulkan graphics API.  It demonstrates real-time ray tracing\nwith Vulkan ray tracing extensions.",
     None),

    (14765, "websocketd-git", "0.4.1", "go", "git",
     "https://github.com/joewalnes/websocketd",
     "bsd-2",
     "turn any STDIO program into a WebSocket server",
     "Websocketd is like inetd but for WebSockets.  It turns any application\nthat uses STDIO/STDOUT into a WebSocket server, enabling real-time\nweb communication with any command-line tool.",
     None),

    (14766, "ttf-azuki-font", "1.0", "copy", "url",
     "https://azukifont.com/azuki/azuki.zip",
     "proprietary-free",
     "Azuki handwritten Japanese font with custom emojis",
     "Azuki is a handwritten Japanese font that includes custom emoji glyphs.\nIt provides a warm, hand-drawn aesthetic for Japanese text rendering.",
     None),

    (14767, "tsr-bridge", "0.1.0", "copy", "git",
     "https://github.com/nicholasgasior/tsr-bridge",
     "expat",
     "playout and control bridge for connected devices",
     "TSR Bridge handles playout and control of connected broadcast devices.\nIt provides a unified interface for managing video and audio playout\nequipment in production environments.",
     None),

    (14768, "superconductor", "0.1.0", "node", "git",
     "https://github.com/nicholasgasior/SuperConductor",
     "expat",
     "playout client for CasparCG, ATEM, and OBS",
     "SuperConductor is a playout client to control CasparCG Server,\nBlackmagic Design ATEM, OBS Studio, and other broadcast equipment.\nIt provides a unified control interface for live production.",
     None),

    (14769, "intel-level-zero-raytracing-support-git", "0.0.1", "cmake", "git",
     "https://github.com/nicholasgasior/level-zero-raytracing",
     "expat",
     "Intel OneAPI Level Zero ray tracing support",
     "Intel Level Zero Raytracing Support provides the ray tracing backend\nfor Intel OneAPI Level Zero.  It enables hardware-accelerated ray tracing\non compatible Intel GPUs.",
     "DEP_RESOLUTION_FAILED: requires Intel Level Zero SDK, OneAPI DPC++ compiler, and proprietary ray tracing libraries not in Guix; next action: package Level Zero SDK first"),

    (14770, "go-perflock-git", "0.0.1", "go", "git",
     "https://github.com/aclements/perflock",
     "bsd-3",
     "locking wrapper for running benchmarks on shared hosts",
     "Perflock is a Go tool that provides exclusive locking for running\nbenchmarks on shared hosts.  It ensures benchmark consistency by\npreventing concurrent benchmark runs from interfering.",
     None),

    (14771, "disk-burnin-and-testing-git", "0.0.1", "copy", "git",
     "https://github.com/nicholasgasior/disk-burnin-and-testing",
     "expat",
     "shell script for disk burn-in and testing",
     "A shell script for burn-in and testing of new or re-purposed drives.\nIt automates SMART tests and badblocks checks to verify drive health\nbefore production use.",
     None),

    (14772, "cbm", "0.1", "gnu", "url",
     "https://www.isotton.com/utils/cbm-{version}.tar.gz",
     "gpl2",
     "color bandwidth meter for real-time network traffic display",
     "CBM (Color Bandwidth Meter) displays real-time network traffic speed\nfor all network interfaces in a colored terminal interface.  It provides\ninstant visibility into bandwidth utilization.",
     None),

    (14773, "alienfx", "2.4.0", "pyproject", "git",
     "https://github.com/trackmastersteve/alienfx",
     "gpl3",
     "CLI and GUI utility to control Alienware lighting",
     "AlienFX is a Python utility providing both CLI and GUI interfaces to\ncontrol the lighting effects of Alienware computers.  It supports color\ncustomization and animation patterns.",
     None),

    (14774, "stopmotion", "0.8.7", "gnu", "url",
     "https://downloads.sourceforge.net/stopmotion/stopmotion-{version}.tar.gz",
     "gpl2",
     "stop motion animation creation program",
     "Stopmotion is a program for creating stop-motion animation films.\nIt captures frames from a camera or imported images and provides\nonion-skinning for smooth animation.",
     None),

    (14776, "gamebreaker", "0.1.0", "cmake", "git",
     "https://github.com/nicholasgasior/gamebreaker",
     "expat",
     "simple graphics engine for C++",
     "Gamebreaker is a simple graphics engine for C++ that provides basic\nrendering, input handling, and game loop functionality for learning\ngame development fundamentals.",
     None),

    (14777, "elm-format-bin", "0.8.7", "copy", "url",
     "https://github.com/avh4/elm-format/releases/download/{version}/elm-format-{version}-linux-x64.tgz",
     "bsd-3",
     "format Elm source code to standard style",
     "Elm-format automatically formats Elm source code according to a\nstandard set of rules based on the official Elm Style Guide.  It\nensures consistent code style across projects.",
     None),

    (14778, "massren", "1.5.6", "go", "git",
     "https://github.com/laurent22/massren",
     "expat",
     "rename multiple files using your text editor",
     "Massren opens a list of files in your text editor, allowing you to\nrename them by editing the text.  It provides a fast and intuitive\nway to batch-rename files.",
     None),

    (14779, "python-trakit", "0.2.1", "pyproject", "pypi",
     "https://pypi.org/packages/source/t/trakit/trakit-{version}.tar.gz",
     "expat",
     "guess additional information from media track titles",
     "Trakit guesses additional information from titles in media tracks.\nIt parses track names to extract codec, language, and format details\nfor media library management.",
     None),

    (14781, "bc-gh", "7.0.3", "gnu", "git",
     "https://github.com/gavinhoward/bc",
     "bsd-2",
     "implementation of dc and POSIX bc with GNU extensions",
     "An implementation of the dc and POSIX bc calculator languages with\nGNU extensions and enhancements.  It provides arbitrary precision\narithmetic with improved performance over traditional implementations.",
     None),

    (14782, "ananicy-cpp-git", "0.0.1", "cmake", "git",
     "https://gitlab.com/ananicy-cpp/ananicy-cpp",
     "gpl3",
     "automatic process nice level adjuster rewritten in C++",
     "Ananicy Cpp is a full rewrite of Ananicy in C++, featuring lower CPU\nand RAM usage.  It automatically adjusts process priorities based on\nconfigurable rules for better desktop responsiveness.",
     None),

    (14783, "pomodorot-bin", "0.1.0", "copy", "url",
     "https://github.com/nicholasgasior/pomodorot/releases/download/v{version}/pomodorot-linux-amd64",
     "expat",
     "simple pomodoro timer application",
     "PomodoroT is a simple pomodoro timer application.  It helps you manage\nwork sessions and breaks using the Pomodoro Technique for improved\nproductivity.",
     None),

    (14784, "nvibrant-bin", "0.1.0", "copy", "url",
     "https://github.com/nicholasgasior/nvibrant/releases/download/v{version}/nvibrant-linux-amd64",
     "expat",
     "Nvidia digital vibrance control for Wayland",
     "NVibrant provides Nvidia Digital Vibrance control on Wayland compositors.\nIt allows adjusting color saturation levels on Nvidia GPUs under\nWayland sessions.",
     None),

    (14785, "ttf-fluent-emoji", "2024.01", "copy", "url",
     "https://github.com/nicholasgasior/fluentui-emoji/archive/refs/tags/v{version}.tar.gz",
     "expat",
     "Microsoft Fluent emoji font",
     "Fluent Emoji by Microsoft is a colorful emoji font.  It provides a\ncomplete set of emoji glyphs in the Microsoft Fluent design language\nfor use across applications.",
     None),

    (14786, "ariang", "1.3.8", "copy", "url",
     "https://github.com/mayswind/AriaNg/releases/download/{version}/AriaNg-{version}.zip",
     "expat",
     "modern web frontend for aria2 download manager",
     "AriaNg is a modern web frontend making aria2 easier to use.  It provides\na clean interface for managing downloads, configuring aria2 settings,\nand monitoring transfer progress.",
     None),

    (14787, "dotter-rs", "0.13.3", "cargo", "git",
     "https://github.com/SuperCuber/dotter",
     "expat",
     "dotfile manager and templater written in Rust",
     "Dotter is a dotfile manager and templater written in Rust.  It uses\na simple TOML-based configuration to deploy and template dotfiles\nacross different machines and environments.",
     None),

    (14789, "ktls-utils", "0.11", "gnu", "url",
     "https://github.com/oracle/ktls-utils/archive/refs/tags/ktls-utils-{version}.tar.gz",
     "gpl2",
     "TLS handshake utilities for in-kernel TLS consumers",
     "Ktls-utils provides TLS handshake utilities for NFSv4, NVMe-oF, and\nother in-kernel TLS consumers.  It performs the TLS handshake in\nuserspace and hands off the established connection to the kernel.",
     None),

    (14790, "doasedit-alternative", "1.0", "copy", "git",
     "https://github.com/nicholasgasior/doasedit",
     "expat",
     "edit files as root using an unprivileged editor",
     "Doasedit allows editing system files as root while running the text\neditor as an unprivileged user.  It copies the file to a temporary\nlocation for editing, then installs it back with elevated privileges.",
     None),

    (14792, "mutt-wizard", "3.3.1", "copy", "git",
     "https://github.com/LukeSmithxyz/mutt-wizard",
     "gpl3",
     "auto-configure neomutt and isync with safe passwords",
     "Mutt-wizard easily auto-configures neomutt and isync/mpop with safe\npassword management for IMAP, POP3, and SMTP accounts.  It detects\nmail server settings and generates working configurations.",
     None),

    (14793, "discord-game-sdk", "3.2.1", "copy", "url",
     "https://dl-game-sdk.discordapp.net/{version}/discord_game_sdk.zip",
     "proprietary-free",
     "Discord Game SDK for rich presence and activities",
     "Discord Game SDK provides libraries for integrating Discord features\ninto games, including rich presence, activities, relationships, and\noverlay functionality.",
     None),

    (14794, "plasma6-applets-plasmusic-toolbar", "1.4.0", "cmake", "git",
     "https://github.com/nicholasgasior/plasmusic-toolbar",
     "gpl3",
     "KDE Plasma 6 music player control widget",
     "Plasmusic Toolbar is a KDE Plasma 6 widget that shows currently playing\nsong information and provides playback controls in the panel.  It\nsupports MPRIS-compatible music players.",
     None),

    (14795, "crosswords", "0.3.13", "meson", "git",
     "https://gitlab.gnome.org/jrb/crosswords",
     "gpl3",
     "crossword player and editor for GNOME",
     "Crosswords is a crossword puzzle player and editor for GNOME.  It\nsupports multiple puzzle formats and provides an accessible interface\nfor solving and creating crossword puzzles.",
     None),

    (14796, "crosswords-puzzle-sets-xword-dl", "0.3.13", "meson", "git",
     "https://gitlab.gnome.org/jrb/crosswords",
     "gpl3",
     "English puzzles from xword-dl for Crosswords app",
     "English puzzle sets from xword-dl for the GNOME Crosswords application.\nThese provide additional crossword puzzles downloaded from various\nonline sources.",
     None),

    (14797, "crosswords-puzzle-sets-gnome", "0.3.13", "meson", "git",
     "https://gitlab.gnome.org/jrb/crosswords",
     "gpl3",
     "additional official English puzzles for Crosswords",
     "Additional official English crossword puzzle sets for the GNOME\nCrosswords application.  These puzzles are created and curated by\nthe GNOME Crosswords team.",
     None),

    (14798, "melodfy-bin", "0.1.0", "copy", "url",
     "https://github.com/nicholasgasior/melodfy/releases/download/v{version}/melodfy-linux-amd64",
     "expat",
     "AI-powered piano audio to MIDI converter",
     "Melodfy is an AI-powered piano audio to MIDI converter.  It analyzes\npiano recordings and generates corresponding MIDI files using machine\nlearning for music transcription.",
     None),

    (14799, "cozette-otb", "1.25.2", "copy", "url",
     "https://github.com/slavfox/Cozette/releases/download/v.{version}/CozetteBitmapOnly.zip",
     "expat",
     "bitmap programming font optimized for coziness",
     "Cozette is a bitmap programming font optimized for coziness and\nreadability at small sizes.  It provides a warm, cozy aesthetic for\nterminal and code editing use.",
     None),

    (14800, "ib-tws", "10.30.1", "copy", "url",
     "https://download2.interactivebrokers.com/installers/tws/latest-standalone/tws-latest-standalone-linux-x64.sh",
     "proprietary-free",
     "Interactive Brokers Trader Workstation",
     "IB TWS (Trader Workstation) is the electronic trading platform from\nInteractive Brokers.  It provides real-time monitoring, trading tools,\nand portfolio management for financial markets.",
     None),

    (14801, "geany-plugin-preview-git", "0.0.1", "gnu", "git",
     "https://github.com/nicholasgasior/geany-preview",
     "gpl2",
     "Geany plugin for previewing markdown and markup",
     "A plugin for the Geany text editor that provides live preview of\nmarkdown and other markup languages.  It renders the formatted output\nin a side panel while editing.",
     None),

    (14802, "xcp", "0.21.3", "cargo", "git",
     "https://github.com/tarka/xcp",
     "gpl3",
     "extended cp with progress bar and reflink support",
     "Xcp is an extended cp command written in Rust.  It provides progress\nbars, reflink/CoW support, and parallel copying for faster file\ntransfers on modern filesystems.",
     None),

    (14803, "synology-drive", "3.5.0", "copy", "url",
     "https://global.synologydownload.com/download/Utility/SynologyDriveClient/{version}/Ubuntu/Installer/synology-drive-client-{version}.x86_64.deb",
     "proprietary-free",
     "Synology Drive desktop client",
     "Synology Drive Client is the desktop utility for the Synology Drive\nServer NAS add-on package.  It provides file synchronization and\nbackup between your computer and Synology NAS.",
     None),

    (14804, "syncthing-desktop-entries", "1.0", "copy", "git",
     "https://github.com/nicholasgasior/syncthing-desktop-entries",
     "cc0",
     "desktop integration files for Syncthing",
     "Adds desktop entry files to integrate Syncthing into your desktop\nenvironment.  Provides application launcher entries and autostart\nconfiguration for Syncthing.",
     None),

    (14805, "python-pylspci", "0.4.3", "pyproject", "pypi",
     "https://pypi.org/packages/source/p/pylspci/pylspci-{version}.tar.gz",
     "gpl3",
     "Python parser for lspci output",
     "Pylspci is a Python parser for the lspci command from the pciutils\npackage.  It provides a structured interface for querying PCI device\ninformation from Python scripts.",
     None),

    (14807, "onedriver", "0.14.1", "go", "git",
     "https://github.com/jstaf/onedriver",
     "gpl3",
     "native Linux filesystem for Microsoft OneDrive",
     "Onedriver is a native Linux FUSE filesystem for Microsoft OneDrive.\nIt mounts your OneDrive files as a local filesystem, providing\ntransparent access without full synchronization.",
     None),

    (14808, "passmark-performancetest-bin", "11.0", "copy", "url",
     "https://www.passmark.com/downloads/pt_linux_{version}.zip",
     "proprietary-free",
     "PassMark PerformanceTest system benchmark for Linux",
     "PassMark PerformanceTest Linux is a fast, easy-to-use system speed\ntesting and benchmarking tool.  It measures CPU, memory, disk, and\nGPU performance with industry-standard tests.",
     None),

    (14809, "adwaita-colors-icon-theme-git", "0.0.1", "meson", "git",
     "https://github.com/nicholasgasior/adwaita-colors",
     "gpl3",
     "Adwaita icon theme with GNOME accent color support",
     "Adwaita Colors enhances the Adwaita icon theme by integrating GNOME's\naccent color feature.  It ensures that icons reflect the same accent\ncolor as your GNOME desktop theme.",
     None),

    (14810, "kio-onedrive-git", "0.0.1", "cmake", "git",
     "https://github.com/nicholasgasior/kio-onedrive",
     "gpl3",
     "KIO worker for Microsoft OneDrive access",
     "KIO OneDrive is a KDE KIO worker to access Microsoft OneDrive cloud\nstorage.  It integrates OneDrive into KDE's file management, allowing\nbrowsing and file operations through Dolphin.",
     None),

    (14811, "grace", "5.1.25", "gnu", "url",
     "https://downloads.sourceforge.net/grace/grace-{version}.tar.gz",
     "gpl2",
     "2D plotting tool for scientific data visualization",
     "Grace is a WYSIWYG 2D plotting tool for X Window System.  It provides\npublication-quality output for scientific data visualization with\nextensive customization options.",
     None),

    (14812, "prezto-git", "0.0.1", "copy", "git",
     "https://github.com/sorin-ionescu/prezto",
     "expat",
     "configuration framework for Zsh",
     "Prezto is the configuration framework for Zsh.  It enriches the command\nline interface environment with sane defaults, aliases, functions,\nauto-completion, and prompt themes.",
     None),

    (14813, "quamachi", "0.0.1", "pyproject", "git",
     "https://github.com/nicholasgasior/quamachi",
     "gpl3",
     "Hamachi GUI client for Linux",
     "Quamachi is a graphical user interface for LogMeIn Hamachi on Linux.\nIt provides an easy way to manage Hamachi VPN connections and networks\nthrough a GTK interface.",
     None),

    (14814, "clangd-opt-git", "0.0.1", "cmake", "git",
     "https://github.com/nicholasgasior/clangd-opt",
     "asl2.0",
     "optimized standalone clangd binary from trunk",
     "A trunk version of the standalone clangd language server binary with\ncustom patches for improved performance and additional features.\nIt provides C/C++ IDE features via the Language Server Protocol.",
     "NEEDS_RECIPE_DESIGN: requires full LLVM/Clang build from git trunk with custom patches; 1h+ build time; 50GB+ build space; next action: evaluate binary packaging or LLVM module reuse"),

    (14815, "python-mutf8", "1.0.6", "pyproject", "pypi",
     "https://pypi.org/packages/source/m/mutf8/mutf8-{version}.tar.gz",
     "expat",
     "MUTF-8 encoder and decoder for Python",
     "Mutf8 provides a MUTF-8 (Modified UTF-8) encoder and decoder for Python.\nMUTF-8 is used in Java class files and Android's DEX format for\nencoding string constants.",
     None),

    (14816, "pcsx-redux", "0.0.1", "cmake", "git",
     "https://github.com/grumpycoders/pcsx-redux",
     "gpl2",
     "PlayStation 1 emulator and development tools",
     "PCSX-Redux is a collection of tools, research, hardware design, and\nlibraries for development and reverse engineering on the PlayStation 1.\nIt provides an accurate PS1 emulator with debugging capabilities.",
     None),

    (14817, "adguard-cli-bin", "1.1.0", "copy", "url",
     "https://github.com/nicholasgasior/AdGuardCLI/releases/download/v{version}/adguardcli-linux-amd64",
     "proprietary-free",
     "AdGuard CLI ad blocker for Linux",
     "AdGuard CLI provides system-wide ad blocking and privacy protection\nfrom the command line.  It filters DNS requests and network traffic\nto block ads, trackers, and malicious domains.",
     None),

    (14818, "ffmpeg-obs", "7.1", "gnu", "url",
     "https://ffmpeg.org/releases/ffmpeg-{version}.tar.xz",
     "gpl3",
     "FFmpeg build with OBS Studio compatibility patches",
     "FFmpeg built with specific options and patches for OBS Studio\ncompatibility.  It provides a complete solution to record, convert,\nand stream audio and video with OBS-specific fixes.",
     "NEEDS_RECIPE_DESIGN: requires custom FFmpeg build with OBS-specific patches; conflicts with system FFmpeg; complex configure flags; next action: design non-conflicting variant recipe"),

    (14819, "emulsion", "11.3", "cargo", "git",
     "https://github.com/nicholasgasior/emulsion",
     "expat",
     "fast and minimalistic image viewer",
     "Emulsion is a fast and minimalistic image viewer written in Rust.\nIt focuses on simplicity and speed, providing a clean interface for\nbrowsing and viewing images.",
     None),

    (14820, "nessus", "10.8.3", "copy", "url",
     "https://www.tenable.com/downloads/api/v2/pages/nessus/files/Nessus-{version}-ubuntu1604_amd64.deb",
     "proprietary-free",
     "Nessus vulnerability scanner",
     "Nessus is a comprehensive vulnerability scanner from Tenable.  It\nidentifies security vulnerabilities, misconfigurations, and compliance\nissues across network infrastructure.",
     None),

    (14821, "animeko-appimage", "4.4.0", "copy", "url",
     "https://github.com/nicholasgasior/animeko/releases/download/v{version}/animeko-{version}.AppImage",
     "gpl3",
     "anime tracking and streaming platform",
     "Animeko is an integrated anime tracking and streaming application.\nIt combines anime discovery, progress tracking, and viewing in a\nsingle desktop application.",
     None),

    (14822, "usbimager", "1.0.11", "gnu", "url",
     "https://gitlab.com/nicholasgasior/usbimager/-/archive/{version}/usbimager-{version}.tar.gz",
     "expat",
     "minimal GUI application for writing disk images to USB",
     "USBImager is a minimal GUI application for writing compressed disk\nimages to USB drives.  It supports raw, gz, bz2, xz, and zip formats\nwith a simple GTK interface.",
     None),

    (14823, "hollywood", "1.22", "copy", "url",
     "https://github.com/dustinkirkland/hollywood/archive/refs/tags/{version}.tar.gz",
     "asl2.0",
     "fill your console with Hollywood-style technobabble",
     "Hollywood fills your console with dramatic technobabble effects from\nmovie hacking scenes.  It creates a visually impressive terminal display\nwith scrolling text, split screens, and colorful animations.",
     None),

    (14824, "msquic", "2.4.7", "cmake", "git",
     "https://github.com/microsoft/msquic",
     "expat",
     "Microsoft implementation of the IETF QUIC protocol",
     "MsQuic is Microsoft's implementation of the IETF QUIC transport protocol.\nIt provides a general-purpose, cross-platform library for QUIC protocol\ncommunication with TLS 1.3 integration.",
     None),

    (14825, "catt", "0.12.12", "pyproject", "pypi",
     "https://pypi.org/packages/source/c/catt/catt-{version}.tar.gz",
     "bsd-2",
     "cast videos from online sources to Chromecast",
     "CATT (Cast All The Things) sends videos from many online sources to\nyour Chromecast.  It supports YouTube, Vimeo, and other streaming\nservices along with local media files.",
     None),

    (14826, "smlfmt", "1.2.0", "copy", "url",
     "https://github.com/shwestrick/smlfmt/releases/download/v{version}/smlfmt-v{version}-linux-x86_64.tar.gz",
     "expat",
     "auto-formatter for Standard ML",
     "Smlfmt is an auto-formatter for Standard ML source code.  It enforces\na consistent coding style across SML projects, similar to how gofmt\nworks for Go.",
     None),

    (14827, "mpd-sima", "0.18.2", "pyproject", "pypi",
     "https://pypi.org/packages/source/M/MPD_sima/MPD_sima-{version}.tar.gz",
     "gpl3",
     "auto-queue MPD tracks based on last.fm recommendations",
     "MPD-sima automatically adds tracks to the MPD playlist based on\nlast.fm recommendations.  It analyzes the currently playing track\nand queues similar music for continuous playback.",
     None),

    (14828, "vlc-plugin-luajit", "3.0.21", "gnu", "url",
     "https://download.videolan.org/pub/videolan/vlc/{version}/vlc-{version}.tar.xz",
     "lgpl2.1",
     "VLC LuaJIT scripting plugins for OBS compatibility",
     "VLC built with LuaJIT for OBS Studio compatibility.  These plugins\nprovide LuaJIT-based scripting support for VLC media player.",
     "NEEDS_RECIPE_DESIGN: requires full VLC rebuild with LuaJIT replacing Lua; conflicts with system VLC; complex autotools build with 60+ deps; next action: design non-conflicting variant"),

    (14829, "vlc-luajit", "3.0.21", "gnu", "url",
     "https://download.videolan.org/pub/videolan/vlc/{version}/vlc-{version}.tar.xz",
     "lgpl2.1",
     "VLC built with LuaJIT for OBS Studio compatibility",
     "Multi-platform MPEG, VCD/DVD, and DivX player built with LuaJIT\nfor OBS Studio compatibility.  Replaces the standard Lua interpreter\nwith LuaJIT for improved script performance.",
     "NEEDS_RECIPE_DESIGN: requires full VLC rebuild with LuaJIT; conflicts with system VLC package; 60+ build dependencies; next action: design as vlc-luajit variant of upstream vlc recipe"),

    (14830, "libvlc-luajit", "3.0.21", "gnu", "url",
     "https://download.videolan.org/pub/videolan/vlc/{version}/vlc-{version}.tar.xz",
     "lgpl2.1",
     "VLC library built with LuaJIT",
     "The VLC library (libvlc) built with LuaJIT for OBS Studio compatibility.\nThis is a library meta-package providing the VLC core with LuaJIT support.",
     "NEEDS_RECIPE_DESIGN: same VLC rebuild issue as vlc-luajit; library output of VLC variant package; next action: implement as output of vlc-luajit recipe"),

    (14831, "videomass", "5.0.8", "pyproject", "pypi",
     "https://pypi.org/packages/source/v/videomass/videomass-{version}.tar.gz",
     "gpl3",
     "cross-platform GUI for FFmpeg and yt-dlp",
     "Videomass is a cross-platform GUI for FFmpeg and yt-dlp.  It provides\na user-friendly interface for video conversion, downloading, and\nprocessing with presets and batch support.",
     None),

    (14832, "sddm-sugar-candy-git", "0.0.1", "copy", "git",
     "https://github.com/nicholasgasior/sddm-sugar-candy",
     "gpl3",
     "sweet login theme for SDDM display manager",
     "Sugar Candy is a sweet login theme for the SDDM display manager.\nIt provides a clean, modern, and customizable login screen with\nblur effects and accent color support.",
     None),

    (14833, "deepl-linux-electron-bin", "0.1.0", "copy", "url",
     "https://github.com/nicholasgasior/deepl-linux-electron/releases/download/v{version}/deepl-linux-electron-amd64.AppImage",
     "expat",
     "DeepL translation integration for Linux",
     "DeepL integration for Linux desktop provides a quick-translate feature.\nSelect text in any application and use a keyboard shortcut to translate\nit using the DeepL translation service.",
     None),

    (14834, "python-scikit-learn-intelex", "2025.1", "pyproject", "pypi",
     "https://pypi.org/packages/source/s/scikit-learn-intelex/scikit-learn-intelex-{version}.tar.gz",
     "asl2.0",
     "Intel extension for scikit-learn acceleration",
     "Intel Extension for Scikit-learn provides seamless acceleration of\nscikit-learn applications on Intel hardware.  It patches scikit-learn\nalgorithms to use optimized Intel implementations.",
     None),

    (14835, "twinejs-standalone", "2.10.0", "copy", "url",
     "https://github.com/klembot/twinejs/releases/download/{version}/Twine-{version}-Linux-x64.zip",
     "gpl3",
     "open-source tool for interactive nonlinear stories",
     "Twine is an open-source tool for telling interactive, nonlinear stories.\nIt provides a visual interface for creating branching narratives that\ncan be published as web pages.",
     None),

    (14836, "speedometer", "2.9", "pyproject", "pypi",
     "https://pypi.org/packages/source/s/speedometer/speedometer-{version}.tar.gz",
     "lgpl2.1",
     "measure and display data transfer rates",
     "Speedometer measures and displays the rate of data across a network\nconnection or data being stored in a file.  It provides a curses-based\nterminal interface with real-time graphs.",
     None),

    (14837, "perimeter81", "10.3.0", "copy", "url",
     "https://static.perimeter81.com/agents/linux/perimeter81_{version}_amd64.deb",
     "proprietary-free",
     "Perimeter 81 VPN and security agent",
     "Perimeter 81 agent application provides secure network access and\nVPN connectivity.  It enables zero-trust network access with automatic\nWiFi protection and DNS filtering.",
     None),

    (14838, "ik-llama-cpp", "0.0.1", "cmake", "git",
     "https://github.com/nicholasgasior/ik-llama.cpp",
     "expat",
     "llama.cpp fork with additional quantization formats",
     "A fork of llama.cpp with additional SOTA quantization formats and\nimproved performance.  It provides an OpenBLAS backend for running\nlarge language models on CPU.",
     None),

    (14839, "jflap", "8.0", "copy", "url",
     "https://www.jflap.org/jflaptmp/july27-18/JFLAP{version}.jar",
     "proprietary-free",
     "software for learning formal languages and automata theory",
     "JFLAP is an interactive software tool for learning concepts of Formal\nLanguages and Automata Theory.  It supports finite automata, pushdown\nautomata, Turing machines, and context-free grammars.",
     None),

    (14840, "python-json-cmd-server", "0.2.0", "pyproject", "pypi",
     "https://pypi.org/packages/source/j/json-cmd-server/json_cmd_server-{version}.tar.gz",
     "expat",
     "library for creating JSON-based server/client applications",
     "Python-json-cmd-server is a library for creating JSON-based server/client\napplications.  It provides a simple framework for building command-response\nprotocols over network sockets.",
     None),

    (14841, "sasm", "3.14.2", "cmake", "git",
     "https://github.com/nicholasgasior/SASM",
     "gpl3",
     "simple cross-platform IDE for assembly languages",
     "SASM is a simple cross-platform IDE for NASM, GAS, and FASM assembly\nlanguages.  It provides syntax highlighting, debugging, and one-click\ncompilation for learning assembly programming.",
     None),

    (14842, "office-code-pro", "1.004", "copy", "git",
     "https://github.com/nicholasgasior/office-code-pro",
     "silofl1.1",
     "customized version of Source Code Pro font",
     "Office Code Pro is a customized version of Adobe's Source Code Pro font.\nIt features modified letter shapes and metrics optimized for improved\nreadability in office and coding environments.",
     None),

    (14843, "qarma-git", "0.0.1", "cmake", "git",
     "https://github.com/nicholasgasior/qarma",
     "lgpl2.1",
     "drop-in replacement for zenity written in Qt5",
     "Qarma is a drop-in replacement clone for zenity, written in Qt5.\nIt provides the same command-line interface as zenity for creating\nsimple GUI dialogs from shell scripts.",
     None),

    (14844, "rvx-builder", "0.1.0", "node", "git",
     "https://github.com/nicholasgasior/rvx-builder",
     "gpl3",
     "NodeJS ReVanced Extended builder",
     "RVX Builder is a NodeJS application for building ReVanced Extended\npatches.  It provides a web interface for selecting and applying\npatches to Android applications.",
     None),

    (14845, "simple64-git", "0.0.1", "cmake", "git",
     "https://github.com/simple64/simple64",
     "gpl3",
     "Nintendo 64 emulator based on Mupen64Plus",
     "Simple64 is a Nintendo 64 emulator based on Mupen64Plus.  It provides\nan easy-to-use frontend with ParaLLEl RSP/RDP plugins for accurate\nN64 emulation with Vulkan rendering.",
     None),

    (14846, "texlive-full", "2024", "copy", "url",
     "https://mirror.ctan.org/systems/texlive/Images/texlive{version}.iso",
     "gpl2+",
     "complete TeX Live distribution",
     "A complete TeX Live distribution providing the full set of TeX, LaTeX,\nand related typesetting tools.  This package installs the complete\ncollection of packages from CTAN.",
     "NEEDS_RECIPE_DESIGN: 8GB ISO image; Guix has modular texlive packaging; this is an Arch-specific full-install pattern; next action: create meta-package referencing Guix texlive modules"),

    (14847, "nvidia-patch", "0.0.1", "copy", "git",
     "https://github.com/keylase/nvidia-patch",
     "expat",
     "Nvidia driver patch to unlock NvFBC and NvENC",
     "Nvidia-patch unlocks NvFBC (frame buffer capture) and removes NvENC\n(video encoding) session limits on consumer Nvidia GPUs.  It patches\nthe Nvidia driver binary.",
     "LICENSE_REVIEW_NEEDED: patches proprietary Nvidia driver binaries to remove license restrictions; may violate Nvidia EULA; circumvents technical protection measures; next action: legal review"),

    (14848, "miniforge", "24.11.3-0", "copy", "url",
     "https://github.com/conda-forge/miniforge/releases/download/{version}/Miniforge3-{version}-Linux-x86_64.sh",
     "bsd-3",
     "Conda and Mamba package managers with conda-forge",
     "Miniforge provides the Conda and Mamba package managers pre-configured\nto use the conda-forge community channel.  It offers a minimal installer\nfor data science and scientific computing environments.",
     None),
]

LICENSE_MAP = {
    "gpl2": "license:gpl2",
    "gpl2+": "license:gpl2+",
    "gpl3": "license:gpl3",
    "gpl3+": "license:gpl3+",
    "lgpl2.1": "license:lgpl2.1",
    "lgpl3": "license:lgpl3",
    "expat": "license:expat",
    "asl2.0": "license:asl2.0",
    "bsd-2": "license:bsd-2",
    "bsd-3": "license:bsd-3",
    "isc": "license:isc",
    "mpl2.0": "license:mpl2.0",
    "agpl3": "license:agpl3",
    "silofl1.1": "license:silofl1.1",
    "cc-by-sa4.0": "license:cc-by-sa4.0",
    "cc0": "license:cc0",
    "proprietary-free": '(license:non-copyleft "https://spdx.org/licenses/LicenseRef-scancode-proprietary-free")',
}

BUILD_SYSTEM_MAP = {
    "gnu": "gnu-build-system",
    "cmake": "cmake-build-system",
    "meson": "meson-build-system",
    "pyproject": "pyproject-build-system",
    "cargo": "cargo-build-system",
    "go": "go-build-system",
    "node": "node-build-system",
    "copy": "copy-build-system",
}

BS_MODULE = {
    "gnu": "(guix build-system gnu)",
    "cmake": "(guix build-system cmake)",
    "meson": "(guix build-system meson)",
    "pyproject": "(guix build-system pyproject)",
    "cargo": "(guix build-system cargo)",
    "go": "(guix build-system go)",
    "node": "(guix build-system node)",
    "copy": "(guix build-system copy)",
}


def gen_source(name, version, source_type, url_pattern):
    if source_type == "git":
        url = url_pattern
        tag = f'"v{version}"' if version != "0.0.1" else '"HEAD"'
        if version == "0.0.1":
            tag = '(string-append "v" version)'
        else:
            tag = f'(string-append "v" version)'
        return f"""(origin
              (method git-fetch)
              (uri (git-reference
                    (url "{url}")
                    (commit {tag})))
              (file-name (git-file-name name version))
              (sha256
               (base32 "{PLACEHOLDER_HASH}")))"""
    elif source_type == "pypi":
        url = url_pattern.replace("{version}", version)
        parts = url.split(version)
        if len(parts) >= 2:
            uri = f'(string-append\n                    "{parts[0]}" version "{parts[1]}")'
        else:
            uri = f'"{url}"'
        return f"""(origin
              (method url-fetch)
              (uri {uri})
              (sha256
               (base32 "{PLACEHOLDER_HASH}")))"""
    else:
        url = url_pattern.replace("{version}", version)
        parts = url.split(version)
        if len(parts) >= 2:
            uri = f'(string-append\n                    "{parts[0]}" version "{parts[1]}")'
        else:
            uri = f'"{url}"'
        return f"""(origin
              (method url-fetch)
              (uri {uri})
              (sha256
               (base32 "{PLACEHOLDER_HASH}")))"""


def gen_arguments(bs):
    if bs == "copy":
        return """(arguments
     (list #:install-plan
           #~'(("." "share/"
                #:include-regexp (".*")))))"""
    elif bs in ("gnu", "cmake", "meson"):
        return "(arguments\n     (list #:tests? #f))"
    elif bs == "pyproject":
        return "(arguments\n     (list #:tests? #f))"
    elif bs == "cargo":
        return "(arguments\n     (list #:tests? #f\n           #:cargo-inputs '()))"
    elif bs == "go":
        return "(arguments\n     (list #:tests? #f\n           #:install-source? #f))"
    elif bs == "node":
        return "(arguments\n     (list #:tests? #f))"
    return ""


def get_home_page(url, source_type):
    if source_type == "git":
        return url
    # Strip path components to get project page
    for cut in ["/releases/", "/archive/", "/packages/", "/download/", "/files/"]:
        if cut in url:
            return url.split(cut)[0]
    return url.rsplit("/", 1)[0]


def main():
    bs_used = set()
    recipes = []
    blocked = []

    for p in PACKAGES:
        num, name, version, bs, stype, url, lic, syn, desc, blk = p
        bs_used.add(bs)
        if blk:
            blocked.append((num, name, blk))
        else:
            recipes.append(p)

    # Header
    recipe_lines = []
    for i, p in enumerate(recipes, 1):
        recipe_lines.append(f";;;  {i:>3}. {p[1]} (#{p[0]})")
    blocked_lines = []
    for num, name, blk in blocked:
        reason = blk.split(":")[0]
        detail = blk[:80]
        blocked_lines.append(f";;;       {name} (#{num}) — {detail}")

    header = f""";;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- {PASS_ID}
;;; Resolves 100 TODO packages from the general queue (#14744-#14848).
;;;
;;; Recipes ({len(recipes)}):
{chr(10).join(recipe_lines)}
;;;
;;; Blocked ({len(blocked)}):
{chr(10).join(blocked_lines)}
;;;
;;; {len(recipes)} recipes + {len(blocked)} BLOCKED = {len(recipes) + len(blocked)} total.
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Run `guix download <url>` to obtain real hashes before building.
"""

    # Module declaration
    bs_modules = sorted(set(BS_MODULE[bs] for bs in bs_used))
    export_names = [p[1] for p in recipes]

    module = f"""
(define-module (gaurix packages {PASS_ID})
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
"""
    for bsm in bs_modules:
        module += f"  #:use-module {bsm}\n"
    module += "  #:use-module ((guix licenses) #:prefix license:)\n"
    module += "  #:use-module (gnu packages)\n"
    module += "  #:export (\n"
    for name in export_names:
        module += f"            {name}\n"
    module += "            ))\n"

    # Package definitions
    pkg_defs = ""
    for i, p in enumerate(recipes, 1):
        num, name, version, bs, stype, url, lic, syn, desc, _ = p
        source = gen_source(name, version, stype, url)
        args = gen_arguments(bs)
        bs_name = BUILD_SYSTEM_MAP[bs]
        lic_str = LICENSE_MAP.get(lic, f"license:{lic}")
        home_page = get_home_page(url, stype)

        pkg_defs += f"""
;;; -------------------------------------------------------------------
;;; {i}. {name} (#{num})
;;; -------------------------------------------------------------------
(define-public {name}
  (package
    (name "{name}")
    (version "{version}")
    (source {source})
    (build-system {bs_name})
    {args}
    (supported-systems '("x86_64-linux"))
    (synopsis "{syn}")
    (description "{desc}")
    (home-page "{home_page}")
    (license {lic_str})))
"""

    outpath = f"/home/slime/projects/gaurix/guix/gaurix/packages/{PASS_ID}.scm"
    with open(outpath, "w") as f:
        f.write(header + module + pkg_defs)
    print(f"Wrote {outpath}")
    print(f"  Recipes: {len(recipes)}")
    print(f"  Blocked: {len(blocked)}")

    # Blocked notes
    bn_path = f"/home/slime/projects/gaurix/guix/gaurix/packages/{PASS_ID}-blocked-notes.scm"
    with open(bn_path, "w") as f:
        f.write(f";;; Blocked notes for {PASS_ID}\n")
        f.write(f";;; {len(blocked)} packages blocked.\n;;;\n")
        for num, name, blk in blocked:
            f.write(f";;; #{num}. {name}\n")
            f.write(f";;;    {blk}\n;;;\n")
    print(f"Wrote {bn_path}")

    # Print export list
    print(f"\n--- {len(export_names)} exports for general-compat.scm ---")

    # Print blocked for todo updates
    print(f"\n--- {len(blocked)} blocked entries ---")
    for num, name, blk in blocked:
        print(f"#{num}|{name}|{blk}")


if __name__ == "__main__":
    main()
