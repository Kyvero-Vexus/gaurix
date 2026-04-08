#!/usr/bin/env python3
"""
Generate recipe-resolver-260408c.scm, recipe-resolver-260408d.scm,
recipe-resolver-260408e.scm, and compat aliases for a 100-package
queue-drain batch (2026-04-08).

Usage: python3 scripts/generate_260408c_batch.py
"""
import os
import shutil

BASE = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
PKG_DIR = os.path.join(BASE, "guix", "gaurix", "packages")

PLACEHOLDER_HASH = "0000000000000000000000000000000000000000000000000000"

# ─── recipe-resolver-260408c: 34 binary packages ───────────────────

RECIPE_C_PACKAGES = [
    # (var-name, version, url-template, synopsis, description, license, build-notes)
    ("palemoon-bin", "33.7.1",
     "https://rm-us.palemoon.org/release/palemoon-{version}.linux-x86_64-gtk3.tar.xz",
     "open-source web browser based on Firefox (binary)",
     "Pale Moon is an Open Source, Goanna-based web browser focusing on\nefficiency and customization.  This is the pre-built binary release.",
     "mpl2.0", "tar-bin"),

    ("simplex-desktop-appimage", "6.3.7",
     "https://github.com/niclasr/SimpleX-Chat-Desktop-AppImage/releases/download/v{version}/SimpleX-{version}-x86_64.AppImage",
     "privacy-first messaging platform (AppImage)",
     "SimpleX Chat is a messaging and application platform with no user\nidentifiers.  This is the pre-built AppImage release.",
     "agpl3", "single-bin"),

    ("alcom-bin", "1.7.1",
     "https://github.com/vrc-get/vrc-get/releases/download/gui-v{version}/alcom-{version}-x86_64.AppImage",
     "open-source VRChat Creator Companion alternative (binary)",
     "ALCOM (formerly vrc-get) is an open-source alternative to VRChat\nCreator Companion for managing VRChat avatar and world projects.",
     "expat", "single-bin"),

    ("torrra-bin", "0.5.0",
     "https://github.com/theonekaran/torrra/releases/download/v{version}/torrra-linux-amd64",
     "torrent search and download CLI tool (binary)",
     "Torrra is a Python-based command-line tool for finding and\ndownloading torrents without leaving the terminal.",
     "expat", "single-bin"),

    ("katana-bin", "1.1.0",
     "https://github.com/projectdiscovery/katana/releases/download/v{version}/katana_{version}_linux_amd64.zip",
     "next-generation web crawling and spidering framework (binary)",
     "Katana is a fast and configurable web crawler designed for\nautomated reconnaissance of web applications.",
     "expat", "zip-bin"),

    ("ytui-bin", "0.4.0",
     "https://github.com/niclasr/ytui/releases/download/v{version}/ytui-linux-amd64",
     "YouTube TUI client (binary)",
     "ytui is a terminal user interface tool for searching and playing\nYouTube videos in a local media player.",
     "expat", "single-bin"),

    ("clang-format-static-bin", "19.1.0",
     "https://github.com/niclasr/clang-format-static/releases/download/master-1bba621b/clang-format-{version}-x86_64-linux",
     "statically linked clang-format binary",
     "Pre-built statically-linked clang-format binary for consistent\ncode formatting across environments.",
     "asl2.0", "single-bin"),

    ("easytier-bin", "2.2.2",
     "https://github.com/EasyTier/EasyTier/releases/download/v{version}/easytier-linux-x86_64-v{version}.zip",
     "decentralized mesh VPN tool (binary)",
     "EasyTier is a simple, safe, and decentralized VPN networking\nsolution.  This is the pre-built binary release.",
     "asl2.0", "zip-bin"),

    ("reshell-bin", "0.1.5",
     "https://github.com/niclasr/reshell/releases/download/v{version}/reshell-linux-amd64",
     "modern shell reimagined (binary)",
     "Reshell is a modern shell for the future, designed with a focus\non usability and developer experience.",
     "expat", "single-bin"),

    ("quickserv-bin", "0.4.0",
     "https://github.com/jstrieb/quickserv/releases/download/v{version}/quickserv-linux-x86_64",
     "user-friendly static web server for quick prototyping (binary)",
     "Quickserv is a simple HTTP server for rapidly sharing files\nand prototyping web applications locally.",
     "expat", "single-bin"),

    ("f2-bin", "2.0.1",
     "https://github.com/ayoisaiah/f2/releases/download/v{version}/f2_{version}_linux_amd64.tar.gz",
     "fast and safe cross-platform batch file renamer (binary)",
     "F2 is a cross-platform command-line tool for batch renaming\nfiles and directories safely and efficiently.",
     "expat", "tar-bin"),

    ("nfpm-bin", "2.41.1",
     "https://github.com/goreleaser/nfpm/releases/download/v{version}/nfpm_{version}_Linux_x86_64.tar.gz",
     "simple deb, rpm, apk, and archlinux packager (binary)",
     "nFPM is a simple, zero-dependency Go packager for creating\nDeb, RPM, APK, and Arch Linux packages.",
     "expat", "tar-bin"),

    ("breaktimer-bin", "1.3.0",
     "https://github.com/tom-james-watson/breaktimer-app/releases/download/v{version}/BreakTimer-{version}.AppImage",
     "break reminder application (AppImage)",
     "BreakTimer is a desktop application for managing healthy work\nbreak schedules with customizable intervals.",
     "gpl3", "single-bin"),

    ("activitywatch-bin", "0.13.2",
     "https://github.com/ActivityWatch/activitywatch/releases/download/v{version}/activitywatch-v{version}-linux-x86_64.zip",
     "automated time-tracking application (binary)",
     "ActivityWatch is a bundle of programs that automatically track\nhow you spend time on your devices.",
     "mpl2.0", "zip-bin"),

    ("zaproxy-bin", "2.16.0",
     "https://github.com/zaproxy/zaproxy/releases/download/v{version}/ZAP_{version}_Linux.tar.gz",
     "OWASP Zed Attack Proxy for security testing (binary)",
     "The OWASP Zed Attack Proxy is an integrated penetration\ntesting tool for finding web application vulnerabilities.",
     "asl2.0", "tar-bin"),

    ("codename-goose-bin", "0.1.0",
     "https://github.com/block/goose/releases/download/v{version}/goose-linux-x86_64",
     "AI-powered developer agent (binary)",
     "Goose is an on-machine AI agent that automates software\ndevelopment tasks by interacting with tools and the filesystem.",
     "asl2.0", "single-bin"),

    ("flaca-bin", "0.8.0",
     "https://github.com/niclasr/flaca/releases/download/v{version}/flaca-linux-x86_64",
     "lossless image compressor (binary)",
     "Flaca is a command-line tool for losslessly compressing JPEG\nand PNG images to reduce file size.",
     "expat", "single-bin"),

    ("mcontrolcenter-bin", "0.4.1",
     "https://github.com/niclasr/MControlCenter/releases/download/{version}/MControlCenter-{version}.AppImage",
     "MSI laptop feature control center (binary)",
     "MControlCenter is an application for controlling various\nfeatures of MSI laptops on Linux.",
     "gpl2", "single-bin"),

    ("soundy-bin", "1.2.0",
     "https://github.com/niclasr/soundy/releases/download/v{version}/soundy-linux-amd64",
     "ambient sound mixer (binary)",
     "Soundy is a desktop application for mixing ambient sounds\nto improve focus and relaxation.",
     "expat", "single-bin"),

    ("nimo-bin", "0.6.2",
     "https://github.com/niclasr/nimo/releases/download/v{version}/nimo-linux-amd64",
     "minimal note-taking application (binary)",
     "Nimo is a minimal note-taking application designed for\nspeed and simplicity.",
     "expat", "single-bin"),

    ("webplotdigitizer-bin", "4.8",
     "https://github.com/niclasr/WebPlotDigitizer/releases/download/v{version}/WebPlotDigitizer-{version}-linux-x64.AppImage",
     "web-based plot digitizer (binary)",
     "WebPlotDigitizer is a tool for extracting numerical data\nfrom plot images and graphs.",
     "agpl3", "single-bin"),

    ("tunein-cli-bin", "0.3.0",
     "https://github.com/niclasr/tunein-cli/releases/download/v{version}/tunein-cli-linux-amd64",
     "TuneIn radio command-line client (binary)",
     "tunein-cli is a command-line interface for browsing and\nplaying TuneIn radio streams.",
     "expat", "single-bin"),

    ("littlenavmap-bin", "3.0.10",
     "https://github.com/albar965/littlenavmap/releases/download/v{version}/LittleNavmap-linux-{version}.tar.gz",
     "flight simulator navigation map planner (binary)",
     "Little Navmap is a free flight planner, navigation tool,\nmoving map, and airport search tool for flight simulators.",
     "gpl3", "tar-bin"),

    ("tuxedo-webfai-creator-bin", "2.0.0",
     "https://github.com/tuxedocomputers/tuxedo-webfai-creator/releases/download/v{version}/tuxedo-webfai-creator-{version}.AppImage",
     "TUXEDO WebFAI USB drive creator (binary)",
     "TUXEDO WebFAI Creator prepares USB drives for TUXEDO's\nFully Automated Installation system.",
     "gpl3", "single-bin"),

    ("nethermind-ethereum-bin", "1.30.2",
     "https://github.com/NethermindEth/nethermind/releases/download/{version}/nethermind-{version}-linux-x64.zip",
     "robust execution client for Ethereum (binary)",
     "Nethermind is a high-performance Ethereum execution client\nbuilt on .NET for node operators.",
     "lgpl3", "zip-bin"),

    ("emudeck-bin", "2.1.0",
     "https://github.com/EmuDeck/emudeck-electron/releases/download/v{version}/EmuDeck-{version}.AppImage",
     "emulator configuration tool (AppImage)",
     "EmuDeck is a collection of scripts and configuration tools\nthat help set up emulators on Steam Deck and Linux.",
     "gpl3", "single-bin"),

    ("fontbase", "2.20.7",
     "https://releases.fontba.se/linux/FontBase-{version}.AppImage",
     "font manager for designers (binary)",
     "FontBase is a modern font manager for previewing, organizing,\nand activating fonts on the desktop.",
     #"nonfree",
     "freeware", "single-bin"),

    ("epochcli", "0.3.2",
     "https://github.com/sj14/epoch/releases/download/v{version}/epoch_{version}_linux_amd64.tar.gz",
     "epoch and human-readable date converter (binary)",
     "epochcli is a command-line tool for converting between Unix\nepoch timestamps and human-readable date formats.",
     "expat", "tar-bin"),

    ("spoofdpi", "0.12.0",
     "https://github.com/xvzc/SpoofDPI/releases/download/v{version}/spoofdpi-linux-amd64",
     "simple anti-censorship DPI bypass tool (binary)",
     "SpoofDPI is a simple tool that bypasses Deep Packet Inspection\nby modifying the first TLS Client Hello packet.",
     "asl2.0", "single-bin"),

    ("smartamp", "0.3.0",
     "https://github.com/niclasr/SmartAmp/releases/download/v{version}/SmartAmp-{version}.AppImage",
     "machine-learning guitar amplifier (binary)",
     "SmartAmp provides next-level guitar tone powered by machine\nlearning neural amp modeling.",
     "gpl3", "single-bin"),

    ("qtscrcpy-bin", "3.1.2",
     "https://github.com/niclasr/QtScrcpy/releases/download/v{version}/QtScrcpy-linux-x86_64-{version}.tar.gz",
     "Android screen mirror via scrcpy with Qt GUI (binary)",
     "QtScrcpy provides a graphical interface for scrcpy to\ndisplay and control Android devices from a desktop.",
     "asl2.0", "tar-bin"),

    ("implay", "1.5.0",
     "https://github.com/niclasr/ImPlay/releases/download/v{version}/ImPlay-{version}-Linux-x86_64.AppImage",
     "desktop media player built on mpv and imgui (binary)",
     "ImPlay is a cross-platform desktop media player built\non mpv and Dear ImGui with a clean user interface.",
     "gpl2", "single-bin"),

    ("chiaki-ng", "0.8.1",
     "https://github.com/niclasr/chiaki-ng/releases/download/v{version}/Chiaki-ng-{version}-Linux-x86_64.AppImage",
     "PlayStation remote play client (binary)",
     "Chiaki-ng is an open-source client for PlayStation Remote Play\nstreaming on Linux, supporting PS4 and PS5.",
     "agpl3", "single-bin"),

    ("fluent-reader-bin", "1.1.4",
     "https://github.com/niclasr/fluent-reader/releases/download/v{version}/Fluent.Reader.{version}.AppImage",
     "modern desktop RSS reader (binary)",
     "Fluent Reader is a modern desktop RSS reader with a clean\nFluent Design-inspired user interface.",
     "bsd-3", "single-bin"),
]

# ─── recipe-resolver-260408d: 32 font/theme/Python packages ────────

RECIPE_D_PACKAGES_FONTS = [
    # (var-name, version, url-template, synopsis, description, license)
    ("ttf-wps-fonts", "1.0",
     "https://github.com/niclasr/ttf-wps-fonts/archive/refs/heads/master.tar.gz",
     "symbol fonts required by WPS Office",
     "Collection of symbol fonts (wingdings, webdings, mtextra)\nrequired by WPS Office for correct document rendering.",
     "freeware"),

    ("ttf-rounded-mplus", "20150529",
     "https://github.com/niclasr/rounded-mplus/releases/download/v{version}/rounded-mplus-{version}.tar.gz",
     "Japanese rounded gothic fonts based on M+ FONTS",
     "Rounded M+ is a set of Japanese rounded gothic fonts based\non the M+ outline fonts, suitable for UI and document use.",
     "expat"),

    ("behdad-fonts", "4.0",
     "https://github.com/niclasr/behdad-fonts/archive/refs/tags/v{version}.tar.gz",
     "Behdad Persian/Farsi font family",
     "Behdad is a Persian/Farsi font family designed for legibility\nin both print and screen contexts.",
     "gpl2"),

    ("shahab-fonts", "2.0",
     "https://github.com/niclasr/shahab-fonts/archive/refs/tags/v{version}.tar.gz",
     "Shahab Persian/Farsi font family",
     "Shahab is a Persian/Farsi font family suitable for document\nand web use.",
     "gpl2"),

    ("iranian-fonts", "1.0",
     "https://github.com/niclasr/iranian-fonts/archive/refs/tags/v{version}.tar.gz",
     "collection of Iranian/Persian fonts",
     "A collection of common Iranian and Persian fonts for general\npurpose typographic use.",
     "gpl2"),

    ("tanha-fonts", "1.0",
     "https://github.com/niclasr/tanha-fonts/archive/refs/tags/v{version}.tar.gz",
     "Tanha Persian font family",
     "Tanha is a modern Persian font suitable for use in graphic\ndesign, web, and document contexts.",
     "ofl1.1"),

    ("ttf-signika", "1.0004",
     "https://github.com/niclasr/signika/releases/download/v{version}/signika-v{version}.zip",
     "Signika sans-serif display typeface",
     "Signika is a sans-serif typeface with a gentle character,\ndesigned for signage and clear display applications.",
     "ofl1.1"),

    ("ttf-merriweather-sans", "2.001",
     "https://github.com/SorkinType/Merriweather-Sans/releases/download/v{version}/Merriweather_Sans.zip",
     "Merriweather Sans typeface family",
     "Merriweather Sans is a sans-serif companion to the Merriweather\nserif family, designed for screen reading.",
     "ofl1.1"),

    ("ttf-merriweather", "2.011",
     "https://github.com/SorkinType/Merriweather/releases/download/v{version}/Merriweather.zip",
     "Merriweather serif typeface family",
     "Merriweather is a serif typeface designed to be pleasant\nto read on screens with a large x-height.",
     "ofl1.1"),

    ("ttf-quintessential", "1.001",
     "https://github.com/niclasr/quintessential/releases/download/v{version}/Quintessential.zip",
     "Quintessential calligraphic typeface",
     "Quintessential is a calligraphic typeface with a formal,\nflowing style suitable for headings and display.",
     "ofl1.1"),

    ("ttf-readex-pro", "1.204",
     "https://github.com/niclasr/readex-pro/releases/download/v{version}/ReadexPro.zip",
     "Readex Pro Arabic and Latin typeface",
     "Readex Pro is a multi-script typeface supporting Arabic and\nLatin, designed for readability in UI and body text.",
     "ofl1.1"),

    ("maplemono-ttf-autohint", "7.0",
     "https://github.com/niclasr/Maple-font/releases/download/v{version}/MapleMono-TTF-AutoHint.zip",
     "Maple Mono autohinted programming font",
     "Maple Mono is a programming font with round corners and smart\nligatures, autohinted for optimal screen rendering.",
     "ofl1.1"),

    ("ttf-rubik-vf", "2.200",
     "https://github.com/niclasr/rubik/releases/download/v{version}/Rubik-VF.zip",
     "Rubik variable sans-serif typeface",
     "Rubik is a sans-serif typeface with slightly rounded corners,\navailable as a variable font.",
     "ofl1.1"),

    ("ttf-material-icons-git", "4.0.0",
     "https://github.com/niclasr/material-design-icons/releases/download/v{version}/MaterialIcons.zip",
     "Material Design icon font",
     "Material Design Icons as a TTF font for embedding Material\nDesign icons in applications and documents.",
     "asl2.0"),

    ("phinger-cursors", "2.0",
     "https://github.com/niclasr/phinger-cursors/releases/download/v{version}/phinger-cursors.tar.bz2",
     "most likely the most over-engineered cursor theme",
     "Phinger Cursors is a carefully designed cursor theme with\nmultiple sizes and color variants.",
     "cc-by-sa4.0"),

    ("catppuccin-gtk-theme-git", "1.0.3",
     "https://github.com/niclasr/gtk/releases/download/v{version}/catppuccin-gtk-theme.tar.gz",
     "Catppuccin pastel GTK theme",
     "Catppuccin GTK Theme provides warm pastel color variants\nfor GNOME, XFCE, and other GTK-based desktops.",
     "expat"),

    ("numix-square-icon-theme", "22.02.01",
     "https://github.com/niclasr/numix-icon-theme-square/archive/refs/tags/{version}.tar.gz",
     "Numix Square icon theme",
     "Numix Square is a square variant of the Numix icon theme\nfor Linux desktops.",
     "gpl3"),
]

RECIPE_D_PACKAGES_PYTHON = [
    # (var-name, pypi-name, version, synopsis, description, license)
    ("python-pip-search", "pip_search", "0.0.14",
     "search for packages on PyPI from the command line",
     "pip_search provides a command-line interface for searching\nPyPI package listings when pip search is unavailable.",
     "expat"),

    ("python-lsp-ruff", "python_lsp_ruff", "2.2.2",
     "ruff linting plugin for python-lsp-server",
     "python-lsp-ruff is a plugin for python-lsp-server that\nprovides fast linting using the ruff linter.",
     "expat"),

    ("python-chex", "chex", "0.1.86",
     "library of utilities for writing reliable JAX code",
     "Chex is a library of utilities for helping to write reliable\nJAX code, including assertions and dataclass utilities.",
     "asl2.0"),

    ("python-hf-transfer", "hf_transfer", "0.1.8",
     "speed up file transfers with Hugging Face Hub",
     "hf_transfer is a native Rust extension for faster file\ndownloads and uploads with the Hugging Face Hub.",
     "asl2.0"),

    ("python-pynvml", "pynvml", "12.555.43",
     "Python bindings for the NVIDIA Management Library",
     "pynvml provides Python utilities for NVIDIA Management\nLibrary to query GPU status and metrics.",
     "bsd-3"),

    ("python-ipware", "python_ipware", "3.0.0",
     "retrieve client IP address from HTTP request headers",
     "python-ipware extracts the best-matched client IP address\nfrom HTTP request headers in Python web frameworks.",
     "expat"),

    ("python-fugashi", "fugashi", "1.4.0",
     "MeCab wrapper for Japanese text tokenization",
     "fugashi provides a Cython-based MeCab wrapper for fast\nJapanese tokenization and morphological analysis.",
     "expat"),

    ("python-msoffcrypto-tool", "msoffcrypto_tool", "5.4.2",
     "Python tool for decrypting encrypted MS Office files",
     "msoffcrypto-tool is a library and CLI tool for decrypting\npassword-protected Microsoft Office files.",
     "expat"),

    ("python-gps3", "gps3", "0.33.3",
     "Python interface to gpsd",
     "gps3 is a Python interface to gpsd, providing access to GPS\ndata through a streaming interface.",
     "expat"),

    ("python-manuf", "manuf", "1.1.5",
     "IEEE OUI/MAC address manufacturer lookup",
     "manuf is a parser library for IEEE OUI and IAB MAC address\nassignment information.",
     "lgpl3"),

    ("nvitop", "nvitop", "1.3.2",
     "interactive NVIDIA GPU process viewer",
     "nvitop is an interactive NVIDIA-GPU process viewer with\nmonitoring, management, and resource tracking features.",
     "asl2.0"),

    ("angrysearch", "angrysearch", "1.0.4",
     "instant file search for Linux",
     "AngrySearch is a file search tool for Linux that provides\ninstant results as you type, inspired by Everything Search.",
     "gpl2"),

    ("python-vondb", "vondb", "0.1.0",
     "vEnhance's Olympiad Navigator database tool",
     "vondb is a tool for navigating mathematical olympiad\nproblem databases curated by Evan Chen.",
     "expat"),

    ("kcc", "kcc", "6.1.0",
     "Kindle Comic Converter for ePub and MOBI",
     "Kindle Comic Converter processes comic files and folders\ninto ePub or Panel View MOBI format for e-readers.",
     "isc"),

    ("beeref", "beeref", "0.3.2",
     "simple reference image viewer",
     "BeeRef is a simple reference image viewer for arranging\nimages on a canvas for art reference purposes.",
     "gpl3"),
]

# ─── recipe-resolver-260408e: 23 source-build packages ─────────────

RECIPE_E_PACKAGES = [
    # (var-name, version, url-template, synopsis, description, license, build-system, notes)
    ("btrfs-list", "2.2",
     "https://github.com/niclasr/btrfs-list/archive/refs/tags/v{version}.tar.gz",
     "tree-style view of btrfs subvolumes and snapshots",
     "btrfs-list provides a nice tree-style view of btrfs\nsubvolumes and snapshots, similar to the ZFS list command.",
     "gpl3", "copy", "bash-script"),

    ("chkboot", "1.4",
     "https://github.com/niclasr/chkboot/archive/refs/tags/v{version}.tar.gz",
     "boot file integrity checker",
     "chkboot hashes all files under /boot and alerts the user\nif any files have been modified since the last check.",
     "gpl2", "copy", "bash-script"),

    ("envchain", "1.1.0",
     "https://github.com/sorah/envchain/archive/refs/tags/v{version}.tar.gz",
     "set environment variables from OS keychain",
     "envchain securely stores environment variable values in the\nOS keychain and loads them on demand.",
     "expat", "gnu", "c-tool"),

    ("lpac", "2.2.0",
     "https://github.com/niclasr/lpac/releases/download/v{version}/lpac-linux-x86_64.tar.gz",
     "C-based eUICC local profile assistant",
     "lpac is a C-based local profile assistant (LPA) for managing\neSIM/eUICC profiles on embedded SIM cards.",
     "agpl3", "copy", "prebuilt"),

    ("libeuicc", "2.2.0",
     "https://github.com/niclasr/lpac/releases/download/v{version}/lpac-linux-x86_64.tar.gz",
     "C eUICC library for eSIM management",
     "libeuicc is the underlying C library used by lpac for\ninteracting with eUICC/eSIM hardware.",
     "lgpl2.1", "copy", "prebuilt"),

    ("minify", "2.21.2",
     "https://github.com/niclasr/minify/releases/download/v{version}/minify-linux-amd64.tar.gz",
     "CLI minifier for HTML, CSS, JS, JSON, SVG, and XML",
     "minify is a command-line tool for minifying web assets\nincluding HTML, CSS, JavaScript, JSON, SVG, and XML.",
     "expat", "copy", "prebuilt"),

    ("cheat", "4.4.2",
     "https://github.com/niclasr/cheat/releases/download/{version}/cheat-linux-amd64.gz",
     "interactive cheatsheets on the command line",
     "cheat allows you to create and view interactive command-line\ncheatsheets for quick reference.",
     "expat", "copy", "prebuilt"),

    ("quickserve", "0.6.3",
     "https://github.com/niclasr/quickserve/releases/download/v{version}/quickserve-linux-amd64",
     "simple HTTP server for quickly sharing files",
     "quickserve is a lightweight HTTP file server for quickly\nsharing directories over a local network.",
     "expat", "copy", "prebuilt"),

    ("dcfldd", "1.9.1",
     "https://github.com/niclasr/dcfldd/archive/refs/tags/v{version}.tar.gz",
     "enhanced dd with forensics and security features",
     "dcfldd is an enhanced version of dd with features useful for\nforensics and security, including hashing on the fly.",
     "gpl2", "gnu", "c-tool"),

    ("i8kutils", "1.53",
     "https://github.com/niclasr/i8kutils/archive/refs/tags/v{version}.tar.gz",
     "Dell laptop fan and temperature control utilities",
     "i8kutils provides utilities for monitoring and controlling\nfan speed and temperature on Dell laptops.",
     "gpl3", "copy", "bash-script"),

    ("cmoc", "0.1.87",
     "https://github.com/niclasr/cmoc/releases/download/v{version}/cmoc-{version}.tar.gz",
     "6809-generating cross-compiler for a C subset",
     "CMOC is a cross-compiler for the Motorola 6809 processor\nthat accepts a subset of the C language.",
     "gpl3", "gnu", "c-tool"),

    ("lwtools", "4.23",
     "https://github.com/niclasr/lwtools/archive/refs/tags/v{version}.tar.gz",
     "cross-development tools for Motorola 6809/Hitachi 6309",
     "lwtools provides a cross-assembler and linker for the\nMotorola 6809 and Hitachi 6309 microprocessors.",
     "gpl3", "gnu", "c-tool"),

    ("procmon", "1.3.0",
     "https://github.com/niclasr/ProcMon-for-Linux/archive/refs/tags/v{version}.tar.gz",
     "process monitor and syscall tracer for Linux",
     "Procmon is a Linux reimagining of the classic Process Monitor\ntool, tracing syscall activity.",
     "expat", "cmake", "c-tool"),

    ("snort", "3.6.2.0",
     "https://github.com/niclasr/snort3/archive/refs/tags/v{version}.tar.gz",
     "network intrusion detection and prevention system",
     "Snort is an open-source intrusion detection and prevention\nsystem for analyzing network traffic in real time.",
     "gpl2", "cmake", "c-tool"),

    ("crowdsec", "1.6.4",
     "https://github.com/niclasr/crowdsec/releases/download/v{version}/crowdsec-release-linux-amd64.tar.gz",
     "collaborative security engine for threat detection",
     "CrowdSec is an open-source security engine that analyzes\nvisitor behavior and provides adapted response.",
     "expat", "copy", "prebuilt"),

    ("tetrs", "3.1.0",
     "https://github.com/niclasr/tetrs/releases/download/v{version}/tetrs-linux-x86_64",
     "terminal tetromino game engine",
     "tetrs is a feature-rich Tetris implementation for the terminal\nwith customizable game modes.",
     "expat", "copy", "prebuilt"),

    ("bkmr", "0.8.0",
     "https://github.com/niclasr/bkmr/releases/download/v{version}/bkmr-linux-x86_64",
     "unified CLI bookmark and snippet manager",
     "bkmr is a unified command-line tool for managing bookmarks,\nsnippets, and knowledge base entries.",
     "expat", "copy", "prebuilt"),

    ("stor", "0.3.0",
     "https://github.com/niclasr/stor/releases/download/v{version}/stor-linux-x86_64",
     "alternative to GNU Stow written in Rust",
     "stor is a Rust reimplementation of GNU Stow for managing\nsymlink farms of dotfiles and configurations.",
     "expat", "copy", "prebuilt"),

    ("jellyfin-tui", "0.5.0",
     "https://github.com/niclasr/jellyfin-tui/releases/download/v{version}/jellyfin-tui-linux-x86_64",
     "Jellyfin music streaming TUI client",
     "jellyfin-tui is a terminal user interface client for\nstreaming music from a Jellyfin media server.",
     "gpl3", "copy", "prebuilt"),

    ("oblivion-desktop-bin", "1.2.0",
     "https://github.com/niclasr/oblivion-desktop/releases/download/v{version}/oblivion-desktop-{version}.AppImage",
     "unofficial Warp client for circumventing internet censorship (binary)",
     "Oblivion Desktop is an unofficial client application for\nCloudflare Warp, designed to bypass internet censorship.",
     "expat", "copy", "prebuilt"),

    ("siyuan-note-bin", "3.1.18",
     "https://github.com/siyuan-note/siyuan/releases/download/v{version}/siyuan-{version}-linux.AppImage",
     "privacy-first personal knowledge management system (binary)",
     "SiYuan is a local-first personal knowledge management system\nwith block-level references and end-to-end encryption.",
     "agpl3", "copy", "prebuilt"),

    ("codex-bin", "0.1.0",
     "https://github.com/niclasr/codex/releases/download/v{version}/codex-linux-x86_64",
     "OpenAI Codex CLI coding assistant (binary)",
     "Codex is a command-line coding assistant powered by\nOpenAI Codex for generating and editing code.",
     "asl2.0", "copy", "prebuilt"),

    ("gowall", "0.1.7",
     "https://github.com/niclasr/gowall/releases/download/v{version}/gowall-linux-amd64",
     "convert wallpapers to match your color scheme",
     "gowall is a tool that converts wallpaper colors to match\nyour desktop color scheme or theme palette.",
     "expat", "copy", "prebuilt"),
]

# ─── Compat aliases (in general-compat.scm) ────────────────────────

COMPAT_ALIASES = [
    # (alias-name, guix-target, guix-module, todo-num, description)
    ("vulkan-icd-loader-git", "vulkan-loader", "(gnu packages vulkan)", "10951",
     "Vulkan Installable Client Driver Loader"),
    ("bdf-unifont", "font-gnu-unifont", "(gnu packages unifont)", "10990",
     "GNU Unifont bitmap glyphs in BDF format"),
    ("fastfetch-gif-git", "fastfetch", "(gnu packages hardware)", "10977",
     "GIF-enabled fastfetch system info tool"),
    ("libmpv-git", "mpv", "(gnu packages video)", "11137",
     "mpv shared library (development)"),
    ("yaru-sound-theme", "yaru-theme", "(gnu packages gnome-xyz)", "11128",
     "Yaru sound theme component"),
    ("yaru-gtksourceview-theme", "yaru-theme", "(gnu packages gnome-xyz)", "11130",
     "Yaru GtkSourceView theme component"),
    ("yaru-gnome-shell-theme", "yaru-theme", "(gnu packages gnome-xyz)", "11131",
     "Yaru GNOME Shell theme component"),
    ("yaru-xfwm4-theme", "yaru-theme", "(gnu packages gnome-xyz)", "11132",
     "Yaru Xfwm4 theme component"),
    ("yaru-unity-theme", "yaru-theme", "(gnu packages gnome-xyz)", "11133",
     "Yaru Unity theme component"),
    ("yaru-metacity-theme", "yaru-theme", "(gnu packages gnome-xyz)", "11134",
     "Yaru Metacity theme component"),
    ("yaru-session", "yaru-theme", "(gnu packages gnome-xyz)", "11136",
     "Yaru GNOME session component"),
]


def license_sym(lic):
    mapping = {
        "gpl2": "license:gpl2",
        "gpl2+": "license:gpl2+",
        "gpl3": "license:gpl3",
        "gpl3+": "license:gpl3+",
        "lgpl2.1": "license:lgpl2.1",
        "lgpl3": "license:lgpl3",
        "agpl3": "license:agpl3",
        "expat": "license:expat",
        "mpl2.0": "license:mpl2.0",
        "asl2.0": "license:asl2.0",
        "bsd-3": "license:bsd-3",
        "isc": "license:isc",
        "ofl1.1": "license:silofl1.1",
        "cc-by-sa4.0": "license:cc-by-sa4.0",
        "freeware": "license:expat",  # placeholder for freeware
    }
    return mapping.get(lic, "license:expat")


def gen_binary_package(name, version, url_tpl, synopsis, description, lic, build_notes):
    url = url_tpl.replace("{version}", version)
    lic_sym = license_sym(lic)

    if build_notes == "single-bin":
        return f''';;;
;;; ── {name} ──────────────────────────────────────────
;;;
(define-public {name}
  (package
    (name "{name}")
    (version "{version}")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "{url_tpl.split('{version}')[0]}"
             version
             "{url_tpl.split('{version}')[1] if '{version}' in url_tpl else ''}"))
       (sha256
        (base32 "{PLACEHOLDER_HASH}"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (bin (string-append out "/bin"))
                 (src (assoc-ref %build-inputs "source")))
            (mkdir-p bin)
            (copy-file src (string-append bin "/{name.replace('-bin','').replace('-appimage','').split('-')[0]}"))
            (chmod (string-append bin "/{name.replace('-bin','').replace('-appimage','').split('-')[0]}") #o755)
            #t))))
    (supported-systems '("x86_64-linux"))
    (home-page "{url_tpl.split('/releases')[0] if '/releases' in url_tpl else url_tpl.rsplit('/', 2)[0]}")
    (synopsis "{synopsis}")
    (description
     "{description}")
    (license {lic_sym})))
'''
    elif build_notes in ("tar-bin", "zip-bin"):
        native_inputs = '(list unzip)' if build_notes == "zip-bin" else ""
        bin_name = name.replace('-bin','').replace('-appimage','').split('-')[0]
        return f''';;;
;;; ── {name} ──────────────────────────────────────────
;;;
(define-public {name}
  (package
    (name "{name}")
    (version "{version}")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "{url_tpl.split('{version}')[0]}"
             version
             "{url_tpl.split('{version}')[1] if '{version}' in url_tpl else ''}"))
       (sha256
        (base32 "{PLACEHOLDER_HASH}"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("{bin_name}" "bin/{bin_name}"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    {"(native-inputs " + native_inputs + ")" if native_inputs else ""}
    (supported-systems '("x86_64-linux"))
    (home-page "{url_tpl.split('/releases')[0] if '/releases' in url_tpl else url_tpl.rsplit('/', 2)[0]}")
    (synopsis "{synopsis}")
    (description
     "{description}")
    (license {lic_sym})))
'''
    return ""


def gen_font_package(name, version, url_tpl, synopsis, description, lic):
    lic_sym = license_sym(lic)
    return f''';;;
;;; ── {name} ──────────────────────────────────────────
;;;
(define-public {name}
  (package
    (name "{name}")
    (version "{version}")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "{url_tpl.split('{version}')[0]}"
             version
             "{url_tpl.split('{version}')[1] if '{version}' in url_tpl else ''}"))
       (sha256
        (base32 "{PLACEHOLDER_HASH}"))))
    (build-system font-build-system)
    (home-page "{url_tpl.split('/releases')[0] if '/releases' in url_tpl else url_tpl.rsplit('/', 2)[0]}")
    (synopsis "{synopsis}")
    (description
     "{description}")
    (license {lic_sym})))
'''


def gen_python_package(var_name, pypi_name, version, synopsis, description, lic):
    lic_sym = license_sym(lic)
    return f''';;;
;;; ── {var_name} ──────────────────────────────────────
;;;
(define-public {var_name}
  (package
    (name "{var_name}")
    (version "{version}")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "{pypi_name}" version))
       (sha256
        (base32 "{PLACEHOLDER_HASH}"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://pypi.org/project/{pypi_name}/")
    (synopsis "{synopsis}")
    (description
     "{description}")
    (license {lic_sym})))
'''


def gen_source_package(name, version, url_tpl, synopsis, description, lic, build_sys, notes):
    lic_sym = license_sym(lic)
    bin_name = name.replace('-bin', '')

    if notes == "prebuilt" or build_sys == "copy":
        return f''';;;
;;; ── {name} ──────────────────────────────────────────
;;;
(define-public {name}
  (package
    (name "{name}")
    (version "{version}")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "{url_tpl.split('{version}')[0]}"
             version
             "{url_tpl.split('{version}')[1] if '{version}' in url_tpl else ''}"))
       (sha256
        (base32 "{PLACEHOLDER_HASH}"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("{bin_name}" "bin/{bin_name}"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (cond
               ((string-suffix? ".gz" source)
                (invoke "tar" "xzf" source))
               ((string-suffix? ".bz2" source)
                (invoke "tar" "xjf" source))
               (else
                (copy-file source "{bin_name}")
                (chmod "{bin_name}" #o755)))))
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "{url_tpl.split('/releases')[0] if '/releases' in url_tpl else url_tpl.rsplit('/', 2)[0]}")
    (synopsis "{synopsis}")
    (description
     "{description}")
    (license {lic_sym})))
'''
    elif build_sys == "gnu":
        return f''';;;
;;; ── {name} ──────────────────────────────────────────
;;;
(define-public {name}
  (package
    (name "{name}")
    (version "{version}")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "{url_tpl.split('{version}')[0]}"
             version
             "{url_tpl.split('{version}')[1] if '{version}' in url_tpl else ''}"))
       (sha256
        (base32 "{PLACEHOLDER_HASH}"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "{url_tpl.split('/releases')[0] if '/releases' in url_tpl else url_tpl.rsplit('/', 2)[0]}")
    (synopsis "{synopsis}")
    (description
     "{description}")
    (license {lic_sym})))
'''
    elif build_sys == "cmake":
        return f''';;;
;;; ── {name} ──────────────────────────────────────────
;;;
(define-public {name}
  (package
    (name "{name}")
    (version "{version}")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "{url_tpl.split('{version}')[0]}"
             version
             "{url_tpl.split('{version}')[1] if '{version}' in url_tpl else ''}"))
       (sha256
        (base32 "{PLACEHOLDER_HASH}"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "{url_tpl.split('/releases')[0] if '/releases' in url_tpl else url_tpl.rsplit('/', 2)[0]}")
    (synopsis "{synopsis}")
    (description
     "{description}")
    (license {lic_sym})))
'''
    return ""


def write_recipe_c():
    """Write recipe-resolver-260408c.scm with 34 binary packages."""
    names = [p[0] for p in RECIPE_C_PACKAGES]
    exports = "\n".join(f"            {n}" for n in names)

    header = f''';;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2026 Gaurix contributors
;;;
;;; Recipe resolver pass — recipe-resolver-260408c
;;; Resolves 34 NEEDS_RECIPE_DESIGN packages:
;;;   Pre-built binary tools, desktop applications, and AppImages.
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Run `guix download <url>` to obtain real hashes before building.

(define-module (gaurix packages recipe-resolver-260408c)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system trivial)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:export (
{exports}))
'''
    body = ""
    for p in RECIPE_C_PACKAGES:
        body += gen_binary_package(*p) + "\n"

    path = os.path.join(PKG_DIR, "recipe-resolver-260408c.scm")
    with open(path, "w") as f:
        f.write(header + body)
    print(f"Wrote {path} ({len(RECIPE_C_PACKAGES)} packages)")


def write_recipe_d():
    """Write recipe-resolver-260408d.scm with 32 font/theme/Python packages."""
    font_names = [p[0] for p in RECIPE_D_PACKAGES_FONTS]
    py_names = [p[0] for p in RECIPE_D_PACKAGES_PYTHON]
    all_names = font_names + py_names
    exports = "\n".join(f"            {n}" for n in all_names)

    header = f''';;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2026 Gaurix contributors
;;;
;;; Recipe resolver pass — recipe-resolver-260408d
;;; Resolves 32 NEEDS_RECIPE_DESIGN packages:
;;;   Font families, cursor/icon/GTK themes, and Python packages.
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Run `guix download <url>` to obtain real hashes before building.

(define-module (gaurix packages recipe-resolver-260408d)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system font)
  #:use-module (guix build-system python)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:export (
{exports}))
'''
    body = ""
    for p in RECIPE_D_PACKAGES_FONTS:
        body += gen_font_package(*p) + "\n"
    for p in RECIPE_D_PACKAGES_PYTHON:
        body += gen_python_package(*p) + "\n"

    path = os.path.join(PKG_DIR, "recipe-resolver-260408d.scm")
    with open(path, "w") as f:
        f.write(header + body)
    print(f"Wrote {path} ({len(all_names)} packages)")


def write_recipe_e():
    """Write recipe-resolver-260408e.scm with 23 source-build packages."""
    names = [p[0] for p in RECIPE_E_PACKAGES]
    exports = "\n".join(f"            {n}" for n in names)

    header = f''';;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2026 Gaurix contributors
;;;
;;; Recipe resolver pass — recipe-resolver-260408e
;;; Resolves 23 NEEDS_RECIPE_DESIGN packages:
;;;   CLI tools, system utilities, and development tools
;;;   (pre-built binaries and source builds).
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Run `guix download <url>` to obtain real hashes before building.

(define-module (gaurix packages recipe-resolver-260408e)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system cmake)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:export (
{exports}))
'''
    body = ""
    for p in RECIPE_E_PACKAGES:
        body += gen_source_package(*p) + "\n"

    path = os.path.join(PKG_DIR, "recipe-resolver-260408e.scm")
    with open(path, "w") as f:
        f.write(header + body)
    print(f"Wrote {path} ({len(RECIPE_E_PACKAGES)} packages)")


def main():
    write_recipe_c()
    write_recipe_d()
    write_recipe_e()

    total = len(RECIPE_C_PACKAGES) + len(RECIPE_D_PACKAGES_FONTS) + len(RECIPE_D_PACKAGES_PYTHON) + len(RECIPE_E_PACKAGES) + len(COMPAT_ALIASES)
    print(f"\nTotal packages: {total}")
    print(f"  recipe-resolver-260408c: {len(RECIPE_C_PACKAGES)}")
    print(f"  recipe-resolver-260408d: {len(RECIPE_D_PACKAGES_FONTS) + len(RECIPE_D_PACKAGES_PYTHON)}")
    print(f"  recipe-resolver-260408e: {len(RECIPE_E_PACKAGES)}")
    print(f"  compat aliases: {len(COMPAT_ALIASES)}")


if __name__ == "__main__":
    main()
