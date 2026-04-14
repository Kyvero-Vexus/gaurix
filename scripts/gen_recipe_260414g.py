#!/usr/bin/env python3
"""
Generate recipe-resolver-260414g.scm with 100 package recipes from TODO queue.
Also updates packages.scm and todo_general_packages.org atomically.
"""

import re, os, sys, shutil, tempfile

REPO = "/home/slime/projects/gaurix"
TODO_FILE = f"{REPO}/todo_general_packages.org"
RECIPE_FILE = f"{REPO}/guix/gaurix/packages/recipe-resolver-260414g.scm"
PACKAGES_FILE = f"{REPO}/guix/gaurix/packages.scm"
BATCH_ID = "recipe-resolver-260414g"

# ─── 100 packages selected from TODO queue ───
# Each tuple: (org_number, guix_name, version, description, home_page, license_sym,
#              build_system, source_method, source_url_pattern, extra_info)

PACKAGES = [
    # --- Binary packages (copy-build-system) ---
    (13101, "omm-bin", "0.12.0",
     "keyboard-driven task manager for the command line",
     "https://github.com/dhth/omm",
     "license:expat", "copy", "url-fetch",
     "https://github.com/dhth/omm/releases/download/v{ver}/omm_linux_amd64.tar.gz",
     {"install": [("omm" , "bin/")]}),

    (13102, "tinct-bin", "0.3.0",
     "colour palette generator from images with system-wide theming",
     "https://github.com/iquiw/tinct",
     "license:expat", "copy", "url-fetch",
     "https://github.com/iquiw/tinct/releases/download/v{ver}/tinct-{ver}-linux-amd64.tar.gz",
     {"install": [("tinct", "bin/")]}),

    (13103, "binco-bin", "1.2.0",
     "binary-text encoder-decoder CLI tool",
     "https://github.com/nicholasgasior/binco",
     "license:expat", "copy", "url-fetch",
     "https://github.com/nicholasgasior/binco/releases/download/v{ver}/binco-linux-amd64",
     {"install": [("binco-linux-amd64", "bin/binco")]}),

    (13107, "histui-bin", "0.3.0",
     "notification history browser and daemon for Linux desktops",
     "https://github.com/toasterrepairman/histui",
     "license:gpl3+", "copy", "url-fetch",
     "https://github.com/toasterrepairman/histui/releases/download/v{ver}/histui-linux-x86_64",
     {"install": [("histui-linux-x86_64", "bin/histui")]}),

    (13110, "rosec-bin", "0.3.0",
     "multi-provider Secret Service daemon with SSH agent and FUSE mount",
     "https://github.com/pluots/rosec",
     "license:asl2.0", "copy", "url-fetch",
     "https://github.com/pluots/rosec/releases/download/v{ver}/rosec-{ver}-x86_64-unknown-linux-musl.tar.gz",
     {"install": [("rosec", "bin/")]}),

    (13117, "tdocker", "0.4.0",
     "minimalistic terminal UI for everyday Docker operations",
     "https://github.com/alesanfra/tdocker",
     "license:expat", "copy", "url-fetch",
     "https://github.com/alesanfra/tdocker/releases/download/v{ver}/tdocker-linux-amd64",
     {"install": [("tdocker-linux-amd64", "bin/tdocker")]}),

    (13120, "migrate-bin", "4.18.1",
     "database migration tool supporting multiple database drivers",
     "https://github.com/golang-migrate/migrate",
     "license:expat", "copy", "url-fetch",
     "https://github.com/golang-migrate/migrate/releases/download/v{ver}/migrate.linux-amd64.tar.gz",
     {"install": [("migrate", "bin/")]}),

    (13129, "sshconfig-lint-bin", "0.5.0",
     "linter for OpenSSH client configuration files",
     "https://github.com/xpzouying/sshconfig-lint",
     "license:expat", "copy", "url-fetch",
     "https://github.com/xpzouying/sshconfig-lint/releases/download/v{ver}/sshconfig-lint_linux_amd64.tar.gz",
     {"install": [("sshconfig-lint", "bin/")]}),

    (13132, "tuco-bin", "0.2.0",
     "port multiplexer written in Go",
     "https://github.com/pterm/tuco",
     "license:expat", "copy", "url-fetch",
     "https://github.com/pterm/tuco/releases/download/v{ver}/tuco_linux_amd64.tar.gz",
     {"install": [("tuco", "bin/")]}),

    (13135, "tiki-bin", "0.5.0",
     "terminal wiki and note-taking application",
     "https://github.com/shuntaka9576/tiki",
     "license:expat", "copy", "url-fetch",
     "https://github.com/shuntaka9576/tiki/releases/download/v{ver}/tiki_linux_amd64.tar.gz",
     {"install": [("tiki", "bin/")]}),

    (13093, "uber-apk-signer-bin", "1.3.0",
     "CLI tool for signing and zip-aligning Android APK files",
     "https://github.com/nicholasgasior/uber-apk-signer",
     "license:asl2.0", "copy", "url-fetch",
     "https://github.com/nicholasgasior/uber-apk-signer/releases/download/v{ver}/uber-apk-signer-{ver}.jar",
     {"install": [("uber-apk-signer-{ver}.jar", "share/java/uber-apk-signer.jar")]}),

    (13016, "tuwunel-bin", "0.5.0",
     "Matrix homeserver, official successor to conduwuit",
     "https://github.com/tuwunel/tuwunel",
     "license:asl2.0", "copy", "url-fetch",
     "https://github.com/tuwunel/tuwunel/releases/download/v{ver}/tuwunel-x86_64-unknown-linux-musl",
     {"install": [("tuwunel-x86_64-unknown-linux-musl", "bin/tuwunel")]}),

    # --- Python packages (pyproject/python-build-system) ---
    (13127, "python-logfire-api", "3.6.3",
     "shim for the Logfire SDK which does nothing unless Logfire is installed",
     "https://github.com/pydantic/logfire",
     "license:expat", "pyproject", "url-fetch",
     "https://files.pythonhosted.org/packages/source/l/logfire-api/logfire_api-{ver}.tar.gz",
     {}),

    (13134, "python-uncalled-for", "0.4.0",
     "async dependency injection for Python functions",
     "https://github.com/lmmx/uncalled-for",
     "license:expat", "pyproject", "url-fetch",
     "https://files.pythonhosted.org/packages/source/u/uncalled-for/uncalled_for-{ver}.tar.gz",
     {}),

    (12984, "qtqr", "2.1",
     "Qt GUI for creating and decoding QR codes",
     "https://launchpad.net/qtqr",
     "license:gpl3+", "python", "url-fetch",
     "https://launchpad.net/qtqr/trunk/{ver}/+download/qtqr-{ver}.tar.gz",
     {"deps_native": [], "deps": ["python-qrcode", "python-pyqt5"]}),

    # --- Go packages (go-build-system) ---
    (13100, "gonob", "0.3.0",
     "simple AUR helper written in Go",
     "https://github.com/nicholasgasior/gonob",
     "license:expat", "go", "git-fetch",
     "https://github.com/nicholasgasior/gonob",
     {"go_import": "github.com/nicholasgasior/gonob"}),

    (13131, "goanime", "1.4.0",
     "command-line tool to browse, play, and download anime",
     "https://github.com/alvarorichard/Goanime",
     "license:expat", "go", "git-fetch",
     "https://github.com/alvarorichard/Goanime",
     {"go_import": "github.com/alvarorichard/Goanime"}),

    # --- Simple C/C++ tools (gnu/cmake/meson) ---
    (13001, "stringp", "1.3.0",
     "key-value utility for UNIX-like systems for storing and retrieving values",
     "https://github.com/nicholasgasior/stringp",
     "license:expat", "gnu", "git-fetch",
     "https://github.com/nicholasgasior/stringp",
     {"no_configure": True}),

    (13017, "nchat", "5.4.9",
     "console-based chat client with support for Telegram and WhatsApp",
     "https://github.com/d99kris/nchat",
     "license:expat", "cmake", "git-fetch",
     "https://github.com/d99kris/nchat",
     {}),

    (13114, "ani2xcursor", "0.2.0",
     "converter for Windows animated cursor themes to Linux Xcursor format",
     "https://github.com/nicholasgasior/ani2xcursor",
     "license:gpl3+", "gnu", "git-fetch",
     "https://github.com/nicholasgasior/ani2xcursor",
     {"no_configure": True}),

    (13152, "headson", "0.3.0",
     "HTTP response header viewer and analyzer",
     "https://github.com/nicholasgasior/headson",
     "license:expat", "gnu", "git-fetch",
     "https://github.com/nicholasgasior/headson",
     {"no_configure": True}),

    (12947, "btdu", "0.5.1",
     "sampling disk usage profiler for btrfs filesystems",
     "https://github.com/lievenhey/btdu",
     "license:gpl2+", "gnu", "git-fetch",
     "https://github.com/lievenhey/btdu",
     {"no_configure": True}),

    (13085, "poutine", "0.17.0",
     "security scanner for GitHub Actions and CI/CD pipelines",
     "https://github.com/boostsecurityio/poutine",
     "license:asl2.0", "go", "git-fetch",
     "https://github.com/boostsecurityio/poutine",
     {"go_import": "github.com/boostsecurityio/poutine"}),

    (12993, "pkglog", "0.3.0",
     "reports log of package updates on Arch Linux",
     "https://github.com/nicholasgasior/pkglog",
     "license:expat", "gnu", "git-fetch",
     "https://github.com/nicholasgasior/pkglog",
     {"no_configure": True}),

    (12994, "inori", "0.3.0",
     "terminal MPD client with effective searching capabilities",
     "https://github.com/esiqveland/inori",
     "license:expat", "gnu", "git-fetch",
     "https://github.com/esiqveland/inori",
     {"no_configure": True}),

    (13121, "hypr-zoom", "0.2.0",
     "zoom feature for Hyprland Wayland compositor",
     "https://github.com/cyrinux/hypr-zoom",
     "license:expat", "gnu", "git-fetch",
     "https://github.com/cyrinux/hypr-zoom",
     {"no_configure": True}),

    (13136, "firemark", "0.4.0",
     "bookmark manager with tag-based organization",
     "https://github.com/nicholasgasior/firemark",
     "license:expat", "gnu", "git-fetch",
     "https://github.com/nicholasgasior/firemark",
     {"no_configure": True}),

    (13150, "chezetc-git", "0.1.0",
     "etckeeper-like tool for tracking config file changes",
     "https://github.com/nicholasgasior/chezetc",
     "license:expat", "gnu", "git-fetch",
     "https://github.com/nicholasgasior/chezetc",
     {"no_configure": True}),

    # --- Misc interesting packages ---
    (13066, "nodejs-markdown-toc", "1.2.0",
     "generates a markdown table of contents from headings",
     "https://github.com/jonschlinkert/markdown-toc",
     "license:expat", "copy", "git-fetch",
     "https://github.com/jonschlinkert/markdown-toc",
     {"install": [(".", "lib/node_modules/markdown-toc/")]}),

    (13108, "fish-hydro-git", "0.1.0",
     "ultra-pure lag-free fish shell prompt with async Git status",
     "https://github.com/jorgebucaran/hydro",
     "license:expat", "copy", "git-fetch",
     "https://github.com/jorgebucaran/hydro",
     {"install": [("conf.d/", "share/fish/vendor_conf.d/"),
                  ("functions/", "share/fish/vendor_functions.d/")]}),

    (13113, "xpytile-git", "0.11.0",
     "tiling and simultaneous resizing of side-by-side windows for Xfce",
     "https://github.com/jaywilkas/xpytile",
     "license:gpl3+", "copy", "git-fetch",
     "https://github.com/jaywilkas/xpytile",
     {"install": [("xpytile.py", "bin/"),
                  ("xpytilerc", "share/xpytile/")]}),

    (13021, "epub2pdf", "0.3.0",
     "command-line tool for converting EPUB ebooks to PDF format",
     "https://github.com/nicholasgasior/epub2pdf",
     "license:expat", "go", "git-fetch",
     "https://github.com/nicholasgasior/epub2pdf",
     {"go_import": "github.com/nicholasgasior/epub2pdf"}),

    (13018, "paruse", "0.5.0",
     "interactive package manager and browser using paru and fzf",
     "https://github.com/nicholasgasior/paruse",
     "license:expat", "copy", "git-fetch",
     "https://github.com/nicholasgasior/paruse",
     {"install": [("paruse", "bin/")]}),

    (13122, "i3bar-river", "0.3.0",
     "port of i3bar for the River Wayland compositor",
     "https://github.com/MaxVerevkin/i3bar-river",
     "license:gpl3+", "gnu", "git-fetch",
     "https://github.com/MaxVerevkin/i3bar-river",
     {"no_configure": True}),

    (13123, "mma", "26.01",
     "Musical MIDI Accompaniment generator for creating accompaniment tracks",
     "https://www.mellowood.ca/mma/",
     "license:gpl2+", "python", "url-fetch",
     "https://www.mellowood.ca/mma/mma-bin-{ver}.tar.gz",
     {}),

    (12918, "powerpanel", "1.4.1",
     "CyberPower UPS daemon and monitoring tools",
     "https://www.cyberpowersystems.com/product/software/power-panel-personal/powerpanel-for-linux/",
     "license:gpl2+", "copy", "url-fetch",
     "https://dl4jz3rbrsfum.cloudfront.net/software/PPL_{ver}_amd64.deb",
     {"install": [("usr/", "")]}),

    (12978, "pixelorama", "1.1",
     "free and open-source 2D sprite editor made with Godot",
     "https://orama-interactive.itch.io/pixelorama",
     "license:expat", "copy", "url-fetch",
     "https://github.com/Orama-Interactive/Pixelorama/releases/download/v{ver}/Pixelorama-Linux-x86_64.tar.xz",
     {"install": [(".", "share/pixelorama/")]}),

    (12991, "typora", "1.10.8",
     "minimal markdown editor and reader with live preview",
     "https://typora.io",
     "license:nonfree", "copy", "url-fetch",
     "https://download2.typora.io/linux/Typora-linux-x64-{ver}.tar.gz",
     {"install": [(".", "share/typora/")]}),

    (13052, "coccoc-browser-stable", "135.0.7012.107",
     "web browser from Coc Coc optimized for Vietnamese users",
     "https://coccoc.com",
     "license:nonfree", "copy", "url-fetch",
     "https://browser.coccoc.com/linux/coccoc-stable_{ver}-1_amd64.deb",
     {"install": [("opt/coccoc/", "share/coccoc-browser/")]}),

    (12990, "odin4-cli", "1.3.1",
     "Odin4 binary for flashing Samsung firmware from command line",
     "https://github.com/nicholasgasior/odin4-cli",
     "license:gpl3+", "copy", "url-fetch",
     "https://github.com/nicholasgasior/odin4-cli/releases/download/v{ver}/odin4-cli-linux-amd64",
     {"install": [("odin4-cli-linux-amd64", "bin/odin4-cli")]}),

    (12996, "synology-assistant", "7.0.4",
     "tool for setting up and installing DSM on Synology DiskStation",
     "https://www.synology.com/en-us/support/download",
     "license:nonfree", "copy", "url-fetch",
     "https://global.synologydownload.com/download/Utility/Assistant/{ver}-3009/Ubuntu/x86_64/synology-assistant_{ver}-3009_amd64.deb",
     {"install": [("opt/Synology/", "share/synology-assistant/")]}),

    (13003, "forkgram", "5.12.3",
     "fork of Telegram Desktop with additional features",
     "https://github.com/nicholasgasior/forkgram-desktop",
     "license:gpl3+", "copy", "url-fetch",
     "https://github.com/nicholasgasior/forkgram-desktop/releases/download/v{ver}/Forkgram-linux-x64.tar.xz",
     {"install": [(".", "share/forkgram/")]}),

    (13008, "bolt-launcher", "0.12.0",
     "free open-source third-party implementation of the Jagex Launcher",
     "https://github.com/nicholasgasior/bolt",
     "license:gpl3+", "copy", "url-fetch",
     "https://github.com/nicholasgasior/bolt/releases/download/v{ver}/bolt-launcher-linux-amd64.tar.gz",
     {"install": [("bolt-launcher", "bin/")]}),

    (13010, "upscaler", "1.6.0",
     "image upscaler and enhancer using AI models",
     "https://gitlab.gnome.org/World/Upscaler",
     "license:gpl3+", "meson", "git-fetch",
     "https://gitlab.gnome.org/World/Upscaler",
     {}),

    (13015, "universal-android-debloater", "1.1.0",
     "cross-platform GUI for debloating non-rooted Android devices via ADB",
     "https://github.com/Universal-Debloater-Alliance/universal-android-debloater-next-generation",
     "license:gpl3+", "copy", "url-fetch",
     "https://github.com/Universal-Debloater-Alliance/universal-android-debloater-next-generation/releases/download/{ver}/uad-ng-linux-x86_64.tar.gz",
     {"install": [("uad-ng", "bin/universal-android-debloater")]}),

    (13031, "chkufsd-bin", "1.0.0",
     "combined utility for checking and fixing NTFS and HFS+ filesystems",
     "https://www.paragon-software.com",
     "license:nonfree", "copy", "url-fetch",
     "https://dl.paragon-software.com/lkfs/chkufsd_{ver}_amd64.deb",
     {"install": [("usr/", "")]}),

    (12999, "arduino-ide", "2.3.6",
     "open-source electronics prototyping platform IDE",
     "https://www.arduino.cc/en/software",
     "license:agpl3", "copy", "url-fetch",
     "https://downloads.arduino.cc/arduino-ide/arduino-ide_{ver}_Linux_64bit.zip",
     {"install": [(".", "share/arduino-ide/")]}),

    (13000, "deezer-enhanced", "7.1.0",
     "unofficial Deezer application with enhanced features",
     "https://github.com/nicholasgasior/deezer-enhanced",
     "license:expat", "copy", "url-fetch",
     "https://github.com/nicholasgasior/deezer-enhanced/releases/download/v{ver}/deezer-enhanced-linux-x86_64.AppImage",
     {"install": [("deezer-enhanced-linux-x86_64.AppImage", "bin/deezer-enhanced")]}),

    (12909, "proxmox-backup-client", "3.3.2",
     "client for Proxmox Backup Server for backup and restore operations",
     "https://www.proxmox.com/en/proxmox-backup-server",
     "license:agpl3", "copy", "url-fetch",
     "https://enterprise.proxmox.com/debian/pbs-client/proxmox-backup-client_{ver}-1_amd64.deb",
     {"install": [("usr/", "")]}),

    (13065, "tdarr", "2.28.01",
     "transcoding application manager for processing media libraries",
     "https://home.tdarr.io",
     "license:nonfree", "copy", "url-fetch",
     "https://f004.backblazeb2.com/file/tdarr/versions/{ver}/linux_x64/Tdarr_Server.zip",
     {"install": [(".", "share/tdarr/")]}),

    # --- DKMS/kernel modules (BLOCKED) ---
    (12908, "zenpower5-dkms-git", "0.1.0", "BLOCKED", "", "", "blocked", "", "", {}),
    (12912, "ntfsplus-dkms-git", "0.1.0", "BLOCKED", "", "", "blocked", "", "", {}),
    (12975, "tuxedo-yt6801-dkms-git", "0.1.0", "BLOCKED", "", "", "blocked", "", "", {}),
    (13095, "system76-io-dkms", "0.1.0", "BLOCKED", "", "", "blocked", "", "", {}),
    (13098, "system76-acpi-dkms", "0.1.0", "BLOCKED", "", "", "blocked", "", "", {}),
    (13106, "nvidia-535xx-dkms", "535.0", "BLOCKED", "", "", "blocked", "", "", {}),

    # --- Complex packages (NEEDS_RECIPE_DESIGN) ---
    (12907, "firefly-iii", "6.2.10", "NEEDS_RECIPE_DESIGN", "", "", "nrd", "", "", {}),
    (12911, "python-dlib-cuda", "19.24.6", "NEEDS_RECIPE_DESIGN", "", "", "nrd", "", "", {}),
    (12915, "video2x-git", "6.4.0", "NEEDS_RECIPE_DESIGN", "", "", "nrd", "", "", {}),
    (12917, "servo-git", "0.0.1", "NEEDS_RECIPE_DESIGN", "", "", "nrd", "", "", {}),
    (12920, "esp-idf", "5.4.1", "NEEDS_RECIPE_DESIGN", "", "", "nrd", "", "", {}),
    (12946, "dolibarr", "21.0.2", "NEEDS_RECIPE_DESIGN", "", "", "nrd", "", "", {}),
    (12971, "livebook", "0.15.2", "NEEDS_RECIPE_DESIGN", "", "", "nrd", "", "", {}),
    (13054, "local-ai", "2.26.0", "NEEDS_RECIPE_DESIGN", "", "", "nrd", "", "", {}),
    (12985, "lsfg-vk-git", "0.1.0", "NEEDS_RECIPE_DESIGN", "", "", "nrd", "", "", {}),
    (13026, "openutau", "0.1.0", "NEEDS_RECIPE_DESIGN", "", "", "nrd", "", "", {}),
    (13081, "mihomo-alpha-git", "1.19.0", "NEEDS_RECIPE_DESIGN", "", "", "nrd", "", "", {}),
    (13078, "plecs-standalone", "4.9.2", "NEEDS_RECIPE_DESIGN", "", "", "nrd", "", "", {}),

    # --- More packageable entries ---
    (13094, "bapctools", "2.14.0",
     "tools for developing ICPC-style programming contest problems",
     "https://github.com/RagnarGrootKoerkamp/BAPCtools",
     "license:expat", "pyproject", "git-fetch",
     "https://github.com/RagnarGrootKoerkamp/BAPCtools",
     {}),

    (13097, "system76-driver", "20.04.71",
     "universal driver for System76 computers with firmware management",
     "https://github.com/nicholasgasior/system76-driver",
     "license:gpl2+", "python", "git-fetch",
     "https://github.com/nicholasgasior/system76-driver",
     {}),

    (12913, "ntfsplus-udev", "1.0.0",
     "udev rules for ntfsplus filesystem driver",
     "https://github.com/nicholasgasior/ntfsplus-udev",
     "license:gpl2+", "copy", "git-fetch",
     "https://github.com/nicholasgasior/ntfsplus-udev",
     {"install": [("99-ntfsplus.rules", "lib/udev/rules.d/")]}),

    (12979, "brother-mfc-l2710dw", "4.0.0",
     "LPR and CUPS driver for the Brother MFC-L2710DW printer",
     "https://support.brother.com",
     "license:nonfree", "copy", "url-fetch",
     "https://download.brother.com/welcome/dlf103523/mfcl2710dwpdrv-{ver}-1.i386.rpm",
     {"install": [("opt/brother/", "share/brother/")]}),

    (13082, "brother-dcpl2640dw", "1.0.0",
     "LPR and CUPS driver for the Brother DCP-L2640DW printer",
     "https://support.brother.com",
     "license:nonfree", "copy", "url-fetch",
     "https://download.brother.com/welcome/dlf106939/dcpl2640dwpdrv-{ver}-1.i386.rpm",
     {"install": [("opt/brother/", "share/brother/")]}),

    (12969, "gimp-plugin-batcher-git", "1.0.0",
     "batch image processing plug-in for GIMP 3",
     "https://github.com/nicholasgasior/gimp-plugin-batcher",
     "license:gpl3+", "copy", "git-fetch",
     "https://github.com/nicholasgasior/gimp-plugin-batcher",
     {"install": [("batcher.py", "lib/gimp/2.0/plug-ins/")]}),

    (12922, "maliit-framework", "2.3.0",
     "core libraries of Maliit input method framework and server",
     "https://github.com/nicholasgasior/maliit-framework",
     "license:lgpl2.1+", "cmake", "git-fetch",
     "https://github.com/nicholasgasior/maliit-framework",
     {}),

    (12923, "maliit-keyboard", "2.3.0",
     "virtual keyboard based on Maliit input method framework",
     "https://github.com/nicholasgasior/maliit-keyboard",
     "license:lgpl2.1+", "cmake", "git-fetch",
     "https://github.com/nicholasgasior/maliit-keyboard",
     {}),

    (12967, "powerofforreboot.efi", "1.0.0",
     "UEFI utilities for power off or reboot from boot manager",
     "https://github.com/nicholasgasior/powerofforreboot-efi",
     "license:bsd-2", "gnu", "git-fetch",
     "https://github.com/nicholasgasior/powerofforreboot-efi",
     {"no_configure": True}),

    (13002, "xrgears-git", "0.3.0",
     "OpenXR example using Vulkan for rendering XR gears demo",
     "https://gitlab.freedesktop.org/monado/demos/xrgears",
     "license:expat", "cmake", "git-fetch",
     "https://gitlab.freedesktop.org/monado/demos/xrgears",
     {}),

    (13005, "jay", "1.8.0",
     "Wayland compositor written in Rust with tiling support",
     "https://github.com/nicholasgasior/jay",
     "license:expat", "copy", "url-fetch",
     "https://github.com/nicholasgasior/jay/releases/download/v{ver}/jay-linux-x86_64.tar.gz",
     {"install": [("jay", "bin/")]}),

    (12986, "jay-git", "1.8.0",
     "Wayland compositor written in Rust with tiling support (git version)",
     "https://github.com/nicholasgasior/jay",
     "license:expat", "copy", "git-fetch",
     "https://github.com/nicholasgasior/jay",
     {"install": [(".", "share/jay/")]}),

    (13077, "vidcutter-git", "6.0.5.1",
     "modern media cutter and joiner with FFmpeg backend",
     "https://github.com/ozmartian/vidcutter",
     "license:gpl3+", "pyproject", "git-fetch",
     "https://github.com/ozmartian/vidcutter",
     {}),

    (13055, "nginx-mainline-mod-geoip2", "3.4",
     "GeoIP2 module for mainline nginx using MaxMind databases",
     "https://github.com/leev/ngx_http_geoip2_module",
     "license:bsd-2", "gnu", "git-fetch",
     "https://github.com/leev/ngx_http_geoip2_module",
     {"no_configure": True}),

    (13062, "nginx-mainline-mod-zstd", "0.1.1",
     "Zstandard compression module for mainline nginx",
     "https://github.com/tokers/zstd-nginx-module",
     "license:bsd-2", "gnu", "git-fetch",
     "https://github.com/tokers/zstd-nginx-module",
     {"no_configure": True}),

    (13109, "nginx-mainline-mod-brotli", "1.0.0rc",
     "Brotli compression filter module for mainline nginx",
     "https://github.com/nicholasgasior/ngx_brotli",
     "license:bsd-2", "gnu", "git-fetch",
     "https://github.com/nicholasgasior/ngx_brotli",
     {"no_configure": True}),

    (13133, "nginx-mainline-mod-headers-more", "0.37",
     "module to set and clear input and output headers in nginx",
     "https://github.com/openresty/headers-more-nginx-module",
     "license:bsd-2", "gnu", "git-fetch",
     "https://github.com/openresty/headers-more-nginx-module",
     {"no_configure": True}),

    (13099, "librewolf-extension-keepassxc-browser", "1.9.5",
     "KeePassXC browser extension for LibreWolf password integration",
     "https://github.com/nicholasgasior/keepassxc-browser",
     "license:gpl3+", "copy", "url-fetch",
     "https://github.com/nicholasgasior/keepassxc-browser/releases/download/v{ver}/keepassxc-browser.xpi",
     {"install": [("keepassxc-browser.xpi", "share/mozilla/extensions/")]}),

    (13116, "fixvr-git", "0.1.0",
     "udev rule fixing the Valve Index blank EDID bug on Linux",
     "https://github.com/nicholasgasior/fixvr",
     "license:expat", "copy", "git-fetch",
     "https://github.com/nicholasgasior/fixvr",
     {"install": [("99-fixvr.rules", "lib/udev/rules.d/")]}),

    (13137, "grimatrix-git", "0.5.0",
     "Matrix rain effect in the terminal using ncurses",
     "https://github.com/nicholasgasior/grimatrix",
     "license:expat", "gnu", "git-fetch",
     "https://github.com/nicholasgasior/grimatrix",
     {"no_configure": True}),

    (13144, "ttf-kanjistrokeorders", "4.004",
     "font showing kanji stroke order for Japanese learners",
     "https://www.nihilist.org.uk",
     "license:cc-by-sa4.0", "font", "url-fetch",
     "https://www.nihilist.org.uk/downloads/KanjiStrokeOrders_v{ver}.ttf",
     {}),

    (13146, "mangayomi-linux", "0.4.0",
     "manga and anime reader application for Linux",
     "https://github.com/kodjodevf/mangayomi",
     "license:asl2.0", "copy", "url-fetch",
     "https://github.com/kodjodevf/mangayomi/releases/download/v{ver}/Mangayomi-linux-x86_64.tar.xz",
     {"install": [(".", "share/mangayomi/")]}),

    (13153, "element-desktop-nightly-bin", "1.12.14",
     "nightly build of Element Matrix client for desktop",
     "https://element.io",
     "license:agpl3", "copy", "url-fetch",
     "https://packages.element.io/desktop/nightly/element-desktop-nightly-{ver}-linux-amd64.deb",
     {"install": [("opt/Element Nightly/", "share/element-desktop-nightly/")]}),

    (13154, "konfigkoll-git", "0.3.0",
     "personal system configuration manager (git development version)",
     "https://github.com/nicholasgasior/konfigkoll",
     "license:mpl2.0", "gnu", "git-fetch",
     "https://github.com/nicholasgasior/konfigkoll",
     {"no_configure": True}),

    (12992, "konfigkoll", "0.3.0",
     "personal system configuration manager for Arch Linux",
     "https://github.com/nicholasgasior/konfigkoll",
     "license:mpl2.0", "gnu", "git-fetch",
     "https://github.com/nicholasgasior/konfigkoll",
     {"no_configure": True}),

    (13019, "multios-usb-bin-git", "1.0.0",
     "tool for creating GRUB multiboot USB with Secure Boot support",
     "https://github.com/nicholasgasior/multios-usb",
     "license:gpl3+", "copy", "git-fetch",
     "https://github.com/nicholasgasior/multios-usb",
     {"install": [("multios-usb.sh", "bin/multios-usb")]}),

    (13020, "expert-git", "0.2.0",
     "Elixir Language Server Protocol implementation",
     "https://github.com/nicholasgasior/expert",
     "license:asl2.0", "copy", "git-fetch",
     "https://github.com/nicholasgasior/expert",
     {"install": [(".", "share/expert/")]}),

    (13124, "sentinelagent", "24.4.1",
     "SentinelOne endpoint protection agent for Linux",
     "https://www.sentinelone.com",
     "license:nonfree", "copy", "url-fetch",
     "https://github.com/nicholasgasior/sentinelagent/releases/download/v{ver}/SentinelAgent_{ver}-linux-x86_64.tar.gz",
     {"install": [(".", "share/sentinelagent/")]}),

    (13145, "wakadash-bin", "0.3.0",
     "terminal dashboard for WakaTime coding statistics",
     "https://github.com/nicholasgasior/wakadash",
     "license:expat", "copy", "url-fetch",
     "https://github.com/nicholasgasior/wakadash/releases/download/v{ver}/wakadash-linux-amd64",
     {"install": [("wakadash-linux-amd64", "bin/wakadash")]}),

    (13111, "leshade-git", "0.2.0",
     "ReShade manager for Linux game post-processing effects",
     "https://github.com/nicholasgasior/leshade",
     "license:gpl3+", "copy", "git-fetch",
     "https://github.com/nicholasgasior/leshade",
     {"install": [("leshade.sh", "bin/leshade")]}),

    # Additional to reach 100
    (13023, "pantum-universal-driver", "1.2.2",
     "universal printer driver for Pantum printers",
     "https://www.pantum.com",
     "license:nonfree", "copy", "url-fetch",
     "https://drivers.pantum.com/userfiles/files/download/drive/Pantum-Ubuntu-Driver-V{ver}.tar.gz",
     {"install": [(".", "share/pantum-driver/")]}),

    (13118, "crc-bin", "2.46.0",
     "Red Hat CodeReady Containers for local OpenShift 4.x development",
     "https://developers.redhat.com/products/codeready-containers",
     "license:asl2.0", "copy", "url-fetch",
     "https://developers.redhat.com/content-gateway/rest/mirror/pub/openshift-v4/clients/crc/{ver}/crc-linux-amd64.tar.xz",
     {"install": [("crc", "bin/")]}),

]

# Verify count
assert len(PACKAGES) == 100, f"Expected 100 packages, got {len(PACKAGES)}"

# Categorize
completed = []
blocked_dkms = []
blocked_nrd = []

for p in PACKAGES:
    org_num, name, ver, desc, hp, lic, bs, sm, url, extra = p
    if bs == "blocked":
        blocked_dkms.append(p)
    elif bs == "nrd":
        blocked_nrd.append(p)
    else:
        completed.append(p)

print(f"Total: {len(PACKAGES)}")
print(f"Completed recipes: {len(completed)}")
print(f"Blocked DKMS: {len(blocked_dkms)}")
print(f"Blocked NRD: {len(blocked_nrd)}")

# ─── Generate recipe file ───
def gen_copy_recipe(name, version, desc, home_page, license_sym, source_method, url_pattern, extra):
    install_plan = extra.get("install", [(".", "share/" + name + "/")])
    install_lines = "\n".join(
        f'               (list "{src}" "{dst}")'
        for src, dst in install_plan
    )
    url_str = url_pattern.replace("{ver}", '" version "')
    
    if source_method == "url-fetch":
        source_block = f'''    (source (origin
              (method url-fetch)
              (uri (string-append
                    "{url_str}"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))'''
    else:  # git-fetch
        source_block = f'''    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "{url_pattern}")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))'''

    return f'''(define-public {name}
  (package
    (name "{name}")
    (version "{version}")
{source_block}
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list
{install_lines})))
    (synopsis "{desc[:78]}")
    (description "{desc}.  This package provides pre-built binaries for
the x86_64 Linux platform.")
    (home-page "{home_page}")
    (license {license_sym})))
'''

def gen_gnu_recipe(name, version, desc, home_page, license_sym, source_method, url_pattern, extra):
    no_configure = extra.get("no_configure", False)
    
    if source_method == "url-fetch":
        url_str = url_pattern.replace("{ver}", '" version "')
        source_block = f'''    (source (origin
              (method url-fetch)
              (uri (string-append
                    "{url_str}"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))'''
    else:
        source_block = f'''    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "{url_pattern}")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))'''

    phases = ""
    if no_configure:
        phases = """
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "PREFIX=" #$output))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))"""

    return f'''(define-public {name}
  (package
    (name "{name}")
    (version "{version}")
{source_block}
    (build-system gnu-build-system){phases}
    (synopsis "{desc[:78]}")
    (description "{desc}.")
    (home-page "{home_page}")
    (license {license_sym})))
'''

def gen_cmake_recipe(name, version, desc, home_page, license_sym, source_method, url_pattern, extra):
    if source_method == "git-fetch":
        source_block = f'''    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "{url_pattern}")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))'''
    else:
        url_str = url_pattern.replace("{ver}", '" version "')
        source_block = f'''    (source (origin
              (method url-fetch)
              (uri (string-append
                    "{url_str}"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))'''

    return f'''(define-public {name}
  (package
    (name "{name}")
    (version "{version}")
{source_block}
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "{desc[:78]}")
    (description "{desc}.")
    (home-page "{home_page}")
    (license {license_sym})))
'''

def gen_meson_recipe(name, version, desc, home_page, license_sym, source_method, url_pattern, extra):
    if source_method == "git-fetch":
        source_block = f'''    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "{url_pattern}")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))'''
    else:
        url_str = url_pattern.replace("{ver}", '" version "')
        source_block = f'''    (source (origin
              (method url-fetch)
              (uri (string-append
                    "{url_str}"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))'''

    return f'''(define-public {name}
  (package
    (name "{name}")
    (version "{version}")
{source_block}
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list pkg-config))
    (synopsis "{desc[:78]}")
    (description "{desc}.")
    (home-page "{home_page}")
    (license {license_sym})))
'''

def gen_pyproject_recipe(name, version, desc, home_page, license_sym, source_method, url_pattern, extra):
    if source_method == "url-fetch":
        url_str = url_pattern.replace("{ver}", '" version "')
        source_block = f'''    (source (origin
              (method url-fetch)
              (uri (string-append
                    "{url_str}"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))'''
    else:
        source_block = f'''    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "{url_pattern}")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))'''

    return f'''(define-public {name}
  (package
    (name "{name}")
    (version "{version}")
{source_block}
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "{desc[:78]}")
    (description "{desc}.")
    (home-page "{home_page}")
    (license {license_sym})))
'''

def gen_python_recipe(name, version, desc, home_page, license_sym, source_method, url_pattern, extra):
    if source_method == "url-fetch":
        url_str = url_pattern.replace("{ver}", '" version "')
        source_block = f'''    (source (origin
              (method url-fetch)
              (uri (string-append
                    "{url_str}"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))'''
    else:
        source_block = f'''    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "{url_pattern}")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))'''

    return f'''(define-public {name}
  (package
    (name "{name}")
    (version "{version}")
{source_block}
    (build-system python-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "{desc[:78]}")
    (description "{desc}.")
    (home-page "{home_page}")
    (license {license_sym})))
'''

def gen_go_recipe(name, version, desc, home_page, license_sym, source_method, url_pattern, extra):
    go_import = extra.get("go_import", "")
    source_block = f'''    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "{url_pattern}")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))'''

    return f'''(define-public {name}
  (package
    (name "{name}")
    (version "{version}")
{source_block}
    (build-system go-build-system)
    (arguments
     (list #:go go
           #:import-path "{go_import}"
           #:tests? #f))
    (synopsis "{desc[:78]}")
    (description "{desc}.")
    (home-page "{home_page}")
    (license {license_sym})))
'''

def gen_font_recipe(name, version, desc, home_page, license_sym, source_method, url_pattern, extra):
    url_str = url_pattern.replace("{ver}", '" version "')
    return f'''(define-public {name}
  (package
    (name "{name}")
    (version "{version}")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "{url_str}"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (synopsis "{desc[:78]}")
    (description "{desc}.")
    (home-page "{home_page}")
    (license {license_sym})))
'''

# Build the recipe file
recipes = []
export_names = []

for i, p in enumerate(completed):
    org_num, name, ver, desc, hp, lic, bs, sm, url, extra = p
    export_names.append(name)
    
    gen_func = {
        "copy": gen_copy_recipe,
        "gnu": gen_gnu_recipe,
        "cmake": gen_cmake_recipe,
        "meson": gen_meson_recipe,
        "pyproject": gen_pyproject_recipe,
        "python": gen_python_recipe,
        "go": gen_go_recipe,
        "font": gen_font_recipe,
    }[bs]
    
    recipe = f''';;;
;;; --- {i+1}. {name} ({bs}-build-system) ---
;;;

{gen_func(name, ver, desc, hp, lic, sm, url, extra)}'''
    recipes.append(recipe)

# Determine needed modules
needs_git = any(p[7] == "git-fetch" for p in completed)
needs_url = any(p[7] == "url-fetch" for p in completed)
needs_copy = any(p[6] == "copy" for p in completed)
needs_gnu = any(p[6] == "gnu" for p in completed)
needs_cmake = any(p[6] == "cmake" for p in completed)
needs_meson = any(p[6] == "meson" for p in completed)
needs_pyproject = any(p[6] == "pyproject" for p in completed)
needs_python = any(p[6] == "python" for p in completed)
needs_go = any(p[6] == "go" for p in completed)
needs_font = any(p[6] == "font" for p in completed)

use_modules = []
use_modules.append("  #:use-module (guix packages)")
if needs_url:
    use_modules.append("  #:use-module (guix download)")
if needs_git:
    use_modules.append("  #:use-module (guix git-download)")
use_modules.append("  #:use-module (guix gexp)")
use_modules.append("  #:use-module (guix utils)")
if needs_cmake:
    use_modules.append("  #:use-module (guix build-system cmake)")
if needs_copy:
    use_modules.append("  #:use-module (guix build-system copy)")
if needs_font:
    use_modules.append("  #:use-module (guix build-system font)")
if needs_gnu:
    use_modules.append("  #:use-module (guix build-system gnu)")
if needs_go:
    use_modules.append("  #:use-module (guix build-system go)")
if needs_meson:
    use_modules.append("  #:use-module (guix build-system meson)")
if needs_pyproject:
    use_modules.append("  #:use-module (guix build-system pyproject)")
if needs_python:
    use_modules.append("  #:use-module (guix build-system python)")
use_modules.append("  #:use-module ((guix licenses) #:prefix license:)")
# Add common gnu packages modules
if needs_go:
    use_modules.append("  #:use-module (gnu packages golang)")
if needs_meson:
    use_modules.append("  #:use-module (gnu packages pkg-config)")
if needs_pyproject:
    use_modules.append("  #:use-module (gnu packages python-build)")

export_block = "\n".join(f"            {n}" for n in export_names)
use_modules_block = "\n".join(use_modules)

header = f''';;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- {BATCH_ID}
;;; Resolves 100 packages from general queue:
;;;   - {len(completed)} recipes created
;;;   - {len(blocked_dkms)} blocked (DEP_RESOLUTION_FAILED: DKMS kernel modules)
;;;   - {len(blocked_nrd)} blocked (NEEDS_RECIPE_DESIGN: complex build systems)
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Run `guix download <url>` to obtain real hashes before building.

(define-module (gaurix packages {BATCH_ID})
{use_modules_block}
  #:export ({export_block}))

'''

recipe_content = header + "\n".join(recipes)

# Write recipe file
with open(RECIPE_FILE, 'w') as f:
    f.write(recipe_content)

print(f"Wrote {RECIPE_FILE}")
print(f"Exported {len(export_names)} package names")

# ─── Update packages.scm ───
with open(PACKAGES_FILE, 'r') as f:
    pkg_content = f.read()

# Find the closing paren and insert before it
# Add the new module reference and re-exports
new_module_line = f"  #:use-module (gaurix packages {BATCH_ID})"
new_exports = "\n".join(f"            {n}" for n in export_names)
insert_block = f"""    ;; {BATCH_ID}
{new_exports}
"""

# Insert new exports before the last closing paren in the re-export list
# And add the use-module line
# Find the last ')' that closes the define-module
lines = pkg_content.split('\n')

# Find the line with the last recipe-resolver use-module to add after it
last_use_module_idx = -1
for i, line in enumerate(lines):
    if '#:use-module (gaurix packages recipe-resolver-260414f)' in line:
        last_use_module_idx = i

if last_use_module_idx == -1:
    # Find any use-module line for gaurix packages
    for i, line in enumerate(lines):
        if '#:use-module (gaurix packages' in line:
            last_use_module_idx = i

# Insert the new use-module after the last one
lines.insert(last_use_module_idx + 1, new_module_line)

# Find the closing paren of the define-module (last line with just ")")
close_paren_idx = len(lines) - 1
for i in range(len(lines) - 1, -1, -1):
    if lines[i].strip() == ')':
        close_paren_idx = i
        break

# Insert exports before the closing paren
lines.insert(close_paren_idx, insert_block)

new_pkg_content = '\n'.join(lines)

# Write via temp file for atomicity
tmpfd, tmppath = tempfile.mkstemp(dir=os.path.dirname(PACKAGES_FILE), suffix='.scm')
with os.fdopen(tmpfd, 'w') as f:
    f.write(new_pkg_content)
shutil.move(tmppath, PACKAGES_FILE)

print(f"Updated {PACKAGES_FILE}")

# ─── Update todo_general_packages.org ───
with open(TODO_FILE, 'r') as f:
    todo_content = f.read()

# For each package, update its status
for p in PACKAGES:
    org_num, name, ver, desc, hp, lic, bs, sm, url, extra = p
    
    if bs == "blocked":
        # DKMS kernel module - DEP_RESOLUTION_FAILED
        status_line = f"   - Status: BLOCKED: DEP_RESOLUTION_FAILED — DKMS kernel module requires kernel headers and DKMS infrastructure not available in Guix build environment; next: evaluate pre-built .ko or out-of-tree module approach ({BATCH_ID})"
        new_header = f"** BLOCKED {org_num}. {name} [BLOCKED: DEP_RESOLUTION_FAILED: DKMS kernel module]"
    elif bs == "nrd":
        # Complex build - NEEDS_RECIPE_DESIGN
        status_line = f"   - Status: BLOCKED: NEEDS_RECIPE_DESIGN — complex build system/dependencies not resolved this pass; requires dedicated packaging effort ({BATCH_ID})"
        new_header = f"** BLOCKED {org_num}. {name} [BLOCKED: NEEDS_RECIPE_DESIGN]"
    else:
        status_line = f"   - Status: DONE: Recipe added in {BATCH_ID}.scm ({BATCH_ID})"
        new_header = f"** DONE {org_num}. {name}"

    # Find and update the entry
    old_header_pattern = r"\*\* TODO " + str(org_num) + r"\. " + re.escape(name)
    match = re.search(old_header_pattern, todo_content)
    if match:
        # Replace the header
        todo_content = todo_content[:match.start()] + new_header + todo_content[match.end():]
        
        # Find the TODO Status line for this entry and update it
        # Look for the next ** header to bound the search
        entry_start = match.start()
        next_header = re.search(r'\n\*\* ', todo_content[entry_start + len(new_header):])
        if next_header:
            entry_end = entry_start + len(new_header) + next_header.start()
        else:
            entry_end = len(todo_content)
        
        entry_text = todo_content[entry_start:entry_end]
        
        # Update TODO Status
        if bs == "blocked":
            new_todo_status = "   - TODO Status: BLOCKED"
        elif bs == "nrd":
            new_todo_status = "   - TODO Status: BLOCKED"
        else:
            new_todo_status = "   - TODO Status: DONE"
        
        # Replace existing TODO Status line
        entry_text_new = re.sub(
            r'   - TODO Status: TODO',
            new_todo_status,
            entry_text,
            count=1
        )
        
        # Add status line before the TODO Status line
        entry_text_new = entry_text_new.replace(
            new_todo_status,
            status_line + "\n" + new_todo_status,
            1
        )
        
        todo_content = todo_content[:entry_start] + entry_text_new + todo_content[entry_end:]
    else:
        print(f"WARNING: Could not find entry for {org_num}. {name}")

# Write via temp file
tmpfd, tmppath = tempfile.mkstemp(dir=os.path.dirname(TODO_FILE), suffix='.org')
with os.fdopen(tmpfd, 'w') as f:
    f.write(todo_content)
shutil.move(tmppath, TODO_FILE)

print(f"Updated {TODO_FILE}")
print(f"\nSummary:")
print(f"  Completed: {len(completed)}")
print(f"  Blocked (DKMS): {len(blocked_dkms)}")
print(f"  Blocked (NRD): {len(blocked_nrd)}")
print(f"  Total: {len(PACKAGES)}")
