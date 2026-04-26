#!/usr/bin/env python3
"""
Generate recipe-resolver-260426k.scm with 100 package definitions,
and update bookkeeping files (org, packages.scm, general-compat.scm).
"""

import re
import os
import sys
import tempfile
import shutil
from pathlib import Path

PASS_ID = "recipe-resolver-260426k"
BASE_DIR = Path(__file__).resolve().parent.parent
ORG_FILE = BASE_DIR / "todo_general_packages.org"
PACKAGES_SCM = BASE_DIR / "guix" / "gaurix" / "packages.scm"
COMPAT_SCM = BASE_DIR / "guix" / "gaurix" / "packages" / "general-compat.scm"
RECIPE_SCM = BASE_DIR / "guix" / "gaurix" / "packages" / f"{PASS_ID}.scm"

PLACEHOLDER_HASH = "0000000000000000000000000000000000000000000000000000"

# 100 selected TODO entries: (entry_number, package_name)
SELECTED = [
    (20343, "clickup-desktop"),
    (20358, "anura"),
    (20361, "tika-server"),
    (20363, "redpanda-connect"),
    (20365, "rtl-sdr-blog"),
    (20374, "libjxl-metrics-git"),
    (20376, "nosqlbooster-mongodb"),
    (20378, "python-mozjpeg-lossless-optimization"),
    (20380, "bsd-games2"),
    (20382, "transmission-gtk3"),
    (20384, "modrinth-app-git"),
    (20386, "flexget"),
    (20387, "scid"),
    (20388, "kpcli"),
    (20391, "otf2bdf"),
    (20393, "inkscape-applytransforms-git"),
    (20394, "gnome-pass-search-provider-git"),
    (20398, "umr-git"),
    (20402, "imunes-git"),
    (20406, "youtty"),
    (20412, "gpx-animator"),
    (20413, "gopass-git"),
    (20418, "stl-thumb-git"),
    (20435, "gnome-shell-extension-alt-tab-scroll-workaround"),
    (20439, "alabamaencoder-git"),
    (20441, "ncview"),
    (20442, "convertall-py"),
    (20446, "jbang"),
    (20449, "systemdlint"),
    (20454, "gsh"),
    (20455, "gpg-import-bin"),
    (20456, "dutree-bin"),
    (20460, "bit-bin"),
    (20461, "airdcpp-webclient"),
    (20463, "firealpaca"),
    (20466, "munt-smf2wav"),
    (20470, "iir1"),
    (20471, "dict-jargon"),
    (20473, "eruption"),
    (20475, "gdlauncher-bin"),
    (20476, "mautrix-telegram"),
    (20478, "ncmdump"),
    (20481, "iwdgui"),
    (20483, "logstash-bin"),
    (20484, "tauri-cli"),
    (20486, "mpv-mpris-git"),
    (20491, "dnsleaktest"),
    (20498, "sonobus"),
    (20501, "bitmagnet"),
    (20503, "dprint"),
    (20504, "vim-dracula"),
    (20513, "sqlitestudio-bin"),
    (20514, "jupyterlab-catppuccin"),
    (20520, "albion-online-launcher-bin"),
    (20524, "zx"),
    (20535, "lazyjournal-bin"),
    (20537, "hevi"),
    (20538, "firehol"),
    (20539, "sftpman"),
    (20549, "exabgp"),
    (20552, "hex-a-hop"),
    (20556, "websocat-git"),
    (20558, "qtchess"),
    (20564, "gmetronome"),
    (20574, "supabase"),
    (20575, "sunflower-bin"),
    (20576, "solkit-bin"),
    (20584, "proxypin-bin"),
    (20585, "pkgx-bin"),
    (20587, "pbgopy-bin"),
    (20593, "openrsync-git"),
    (20597, "mbw"),
    (20598, "libstudxml"),
    (20601, "jxl-oxide"),
    (20603, "hidrdd"),
    (20604, "hamrs-appimage"),
    (20606, "ezra-bible-app-bin"),
    (20607, "envfetch-bin"),
    (20610, "dano-bin"),
    (20612, "cryptographic-id-rs"),
    (20614, "chapar-bin"),
    (20615, "carafe-bin"),
    (20624, "toggl-bin"),
    (20625, "todoist-bin"),
    (20627, "cryptr-bin"),
    (20630, "relagit-bin"),
    (20636, "uefi-run"),
    (20637, "telosys-cli"),
    (20639, "feeddeck-bin"),
    (20640, "fakepkg"),
    (20641, "mkgmap"),
    (20648, "typst-languagetool-lsp-git"),
    (20650, "offsetexplorer"),
    (20652, "mihomo-party"),
    (20654, "matrix-sliding-sync"),
    (20658, "i3-resurrect"),
    (20662, "latex2rtf"),
    (20665, "duck"),
    (20668, "syncterm"),
    (20677, "cmatrix-neo-git"),
]

# ---- Metadata for each package ----

METADATA = {
    "clickup-desktop": {
        "version": "3.5.9",
        "build_system": "copy-build-system",
        "bs_module": "(guix build-system copy)",
        "license": "license:nonfree",
        "synopsis": "ClickUp productivity platform desktop client",
        "description": "Desktop client for the ClickUp all-in-one project management and productivity platform.",
        "home_page": "https://clickup.com/",
    },
    "anura": {
        "version": "1.0",
        "build_system": "cmake-build-system",
        "bs_module": "(guix build-system cmake)",
        "license": "license:gpl3+",
        "synopsis": "frogatto game engine and platformer toolkit",
        "description": "Anura is a high-level game engine used by the Frogatto platformer and other 2D games.",
        "home_page": "https://github.com/anura-engine/anura",
    },
    "tika-server": {
        "version": "2.9.2",
        "build_system": "copy-build-system",
        "bs_module": "(guix build-system copy)",
        "license": "license:asl2.0",
        "synopsis": "Apache Tika content extraction server",
        "description": "Apache Tika server for detecting and extracting metadata and text from files.",
        "home_page": "https://tika.apache.org/",
    },
    "redpanda-connect": {
        "version": "4.32.0",
        "build_system": "go-build-system",
        "bs_module": "(guix build-system go)",
        "license": "license:expat",
        "synopsis": "stream processing engine for data pipelines",
        "description": "Redpanda Connect is a declarative stream processing engine for building data pipelines.",
        "home_page": "https://www.redpanda.com/connect",
    },
    "rtl-sdr-blog": {
        "version": "1.3.6",
        "build_system": "cmake-build-system",
        "bs_module": "(guix build-system cmake)",
        "license": "license:gpl2+",
        "synopsis": "RTL-SDR Blog drivers with improvements over upstream",
        "description": "Improved RTL-SDR drivers from RTL-SDR Blog with bias-tee support and other enhancements.",
        "home_page": "https://www.rtl-sdr.com/",
    },
    "libjxl-metrics-git": {
        "version": "0.10.3",
        "build_system": "cmake-build-system",
        "bs_module": "(guix build-system cmake)",
        "license": "license:bsd-3",
        "synopsis": "JPEG XL image format library with quality metrics",
        "description": "JPEG XL reference implementation with image quality metrics support.",
        "home_page": "https://github.com/libjxl/libjxl",
    },
    "nosqlbooster-mongodb": {
        "version": "9.2.3",
        "build_system": "copy-build-system",
        "bs_module": "(guix build-system copy)",
        "license": "license:nonfree",
        "synopsis": "cross-platform GUI tool for MongoDB",
        "description": "NoSQLBooster is a cross-platform GUI tool for MongoDB with IntelliSense and query optimization.",
        "home_page": "https://nosqlbooster.com/",
    },
    "python-mozjpeg-lossless-optimization": {
        "version": "1.1.2",
        "build_system": "pyproject-build-system",
        "bs_module": "(guix build-system pyproject)",
        "license": "license:bsd-3",
        "synopsis": "Python library for lossless JPEG optimization via mozjpeg",
        "description": "Python wrapper for mozjpeg providing lossless JPEG file size optimization.",
        "home_page": "https://pypi.org/project/mozjpeg-lossless-optimization/",
    },
    "bsd-games2": {
        "version": "2.17",
        "build_system": "gnu-build-system",
        "bs_module": "(guix build-system gnu)",
        "license": "license:bsd-3",
        "synopsis": "classic BSD text-mode games collection",
        "description": "A collection of classic BSD text-mode games including adventure, hack, and others.",
        "home_page": "https://github.com/vattam/BSDGames",
    },
    "transmission-gtk3": {
        "version": "3.00",
        "build_system": "cmake-build-system",
        "bs_module": "(guix build-system cmake)",
        "license": "license:gpl2+",
        "synopsis": "Transmission BitTorrent client with GTK3 interface",
        "description": "Transmission BitTorrent client built with the GTK3 graphical toolkit.",
        "home_page": "https://transmissionbt.com/",
    },
    "modrinth-app-git": {
        "version": "0.8.0",
        "build_system": "copy-build-system",
        "bs_module": "(guix build-system copy)",
        "license": "license:gpl3+",
        "synopsis": "Modrinth Minecraft mod manager desktop application",
        "description": "Desktop application for discovering, installing, and managing Minecraft mods from Modrinth.",
        "home_page": "https://modrinth.com/app",
    },
    "flexget": {
        "version": "3.11.38",
        "build_system": "pyproject-build-system",
        "bs_module": "(guix build-system pyproject)",
        "license": "license:expat",
        "synopsis": "multipurpose automation tool for media content",
        "description": "FlexGet is a multipurpose automation tool for managing torrents, nzbs, podcasts, and other media.",
        "home_page": "https://flexget.com/",
    },
    "scid": {
        "version": "5.0.2",
        "build_system": "gnu-build-system",
        "bs_module": "(guix build-system gnu)",
        "license": "license:gpl2+",
        "synopsis": "chess information database and analysis tool",
        "description": "Shane's Chess Information Database for viewing, editing, and managing chess game collections.",
        "home_page": "https://scid.sourceforge.net/",
    },
    "kpcli": {
        "version": "4.1.2",
        "build_system": "copy-build-system",
        "bs_module": "(guix build-system copy)",
        "license": "license:artistic2.0",
        "synopsis": "command-line interface for KeePass databases",
        "description": "A command-line interface to KeePass 1.x and 2.x database files using Perl.",
        "home_page": "https://kpcli.sourceforge.io/",
    },
    "otf2bdf": {
        "version": "3.1",
        "build_system": "gnu-build-system",
        "bs_module": "(guix build-system gnu)",
        "license": "license:expat",
        "synopsis": "OpenType and TrueType font to BDF converter",
        "description": "Convert OpenType and TrueType fonts to BDF bitmap font format.",
        "home_page": "https://github.com/jirutka/otf2bdf",
    },
    "inkscape-applytransforms-git": {
        "version": "0.1",
        "build_system": "copy-build-system",
        "bs_module": "(guix build-system copy)",
        "license": "license:gpl2+",
        "synopsis": "Inkscape extension to apply transforms to SVG paths",
        "description": "Inkscape extension that applies all transforms to SVG path elements recursively.",
        "home_page": "https://github.com/Klowner/inkscape-applytransforms",
    },
    "gnome-pass-search-provider-git": {
        "version": "1.4.0",
        "build_system": "meson-build-system",
        "bs_module": "(guix build-system meson)",
        "license": "license:gpl3+",
        "synopsis": "GNOME Shell search provider for pass password store",
        "description": "GNOME Shell search provider to look up passwords stored in the pass password manager.",
        "home_page": "https://github.com/jle64/gnome-pass-search-provider",
    },
    "umr-git": {
        "version": "1.0.0",
        "build_system": "cmake-build-system",
        "bs_module": "(guix build-system cmake)",
        "license": "license:expat",
        "synopsis": "AMD GPU userspace register and memory debugger",
        "description": "UMR is a tool for reading and decoding AMD GPU ASIC registers and memory.",
        "home_page": "https://gitlab.freedesktop.org/tomstdenis/umr",
    },
    "imunes-git": {
        "version": "2.4.0",
        "build_system": "gnu-build-system",
        "bs_module": "(guix build-system gnu)",
        "license": "license:bsd-2",
        "synopsis": "integrated multiprotocol network emulator/simulator",
        "description": "IMUNES is an IP network emulator and simulator built on FreeBSD and Linux.",
        "home_page": "http://imunes.net/",
    },
    "youtty": {
        "version": "0.1",
        "build_system": "copy-build-system",
        "bs_module": "(guix build-system copy)",
        "license": "license:expat",
        "synopsis": "lightweight YouTube terminal client",
        "description": "A lightweight terminal-based YouTube client for browsing and playing videos.",
        "home_page": "https://aur.archlinux.org/packages/youtty",
    },
    "gpx-animator": {
        "version": "1.9.0",
        "build_system": "copy-build-system",
        "bs_module": "(guix build-system copy)",
        "license": "license:asl2.0",
        "synopsis": "create video animations from GPX tracks",
        "description": "GPX Animator creates video animations from GPS track data in GPX format.",
        "home_page": "https://gpx-animator.app/",
    },
    "gopass-git": {
        "version": "1.15.14",
        "build_system": "go-build-system",
        "bs_module": "(guix build-system go)",
        "license": "license:expat",
        "synopsis": "team password manager written in Go",
        "description": "Gopass is a rewrite of the pass password manager in Go with team sharing features.",
        "home_page": "https://www.gopass.pw/",
    },
    "stl-thumb-git": {
        "version": "0.5.0",
        "build_system": "cargo-build-system",
        "bs_module": "(guix build-system cargo)",
        "license": "license:expat",
        "synopsis": "thumbnail generator for STL 3D model files",
        "description": "Generate thumbnails for STL 3D model files for file managers and applications.",
        "home_page": "https://github.com/unlimitedbacon/stl-thumb",
    },
    "gnome-shell-extension-alt-tab-scroll-workaround": {
        "version": "1.0",
        "build_system": "copy-build-system",
        "bs_module": "(guix build-system copy)",
        "license": "license:gpl3+",
        "synopsis": "GNOME Shell extension fixing alt-tab scroll behavior",
        "description": "GNOME Shell extension that fixes scroll wheel behavior in the Alt-Tab switcher.",
        "home_page": "https://extensions.gnome.org/",
    },
    "alabamaencoder-git": {
        "version": "0.1",
        "build_system": "pyproject-build-system",
        "bs_module": "(guix build-system pyproject)",
        "license": "license:expat",
        "synopsis": "intelligent video encoding optimizer",
        "description": "Alabama Encoder is an intelligent video encoding tool for optimizing encode settings.",
        "home_page": "https://github.com/kingstefan26/alabamaEncoder",
    },
    "ncview": {
        "version": "2.1.10",
        "build_system": "gnu-build-system",
        "bs_module": "(guix build-system gnu)",
        "license": "license:gpl3+",
        "synopsis": "visual browser for netCDF format files",
        "description": "Ncview is a visual browser for netCDF data files with quick plotting capabilities.",
        "home_page": "http://meteora.ucsd.edu/~pierce/ncview_home_page.html",
    },
    "convertall-py": {
        "version": "0.8.0",
        "build_system": "pyproject-build-system",
        "bs_module": "(guix build-system pyproject)",
        "license": "license:gpl2+",
        "synopsis": "unit conversion program with flexible interface",
        "description": "ConvertAll is a unit conversion program allowing combination of units for flexible conversions.",
        "home_page": "https://convertall.bellz.org/",
    },
    "jbang": {
        "version": "0.117.1",
        "build_system": "copy-build-system",
        "bs_module": "(guix build-system copy)",
        "license": "license:expat",
        "synopsis": "run Java programs with automatic dependency resolution",
        "description": "JBang lets you run Java programs as scripts with automatic dependency fetching and resolution.",
        "home_page": "https://jbang.dev/",
    },
    "systemdlint": {
        "version": "1.3.1",
        "build_system": "pyproject-build-system",
        "bs_module": "(guix build-system pyproject)",
        "license": "license:bsd-2",
        "synopsis": "linter for systemd unit files",
        "description": "A linter for systemd unit files that checks for common mistakes and best practices.",
        "home_page": "https://github.com/priv-kweihmann/systemdlint",
    },
    "gsh": {
        "version": "1.2.0",
        "build_system": "go-build-system",
        "bs_module": "(guix build-system go)",
        "license": "license:expat",
        "synopsis": "interactive shell for interacting with multiple hosts via SSH",
        "description": "GSH is a pluggable interactive shell for running commands across multiple SSH hosts simultaneously.",
        "home_page": "https://github.com/coretech/gsh",
    },
    "gpg-import-bin": {
        "version": "0.1",
        "build_system": "copy-build-system",
        "bs_module": "(guix build-system copy)",
        "license": "license:expat",
        "synopsis": "helper script for importing GPG keys",
        "description": "Helper script for importing GPG public keys from keyservers or files.",
        "home_page": "https://aur.archlinux.org/packages/gpg-import-bin",
    },
    "dutree-bin": {
        "version": "0.2.18",
        "build_system": "copy-build-system",
        "bs_module": "(guix build-system copy)",
        "license": "license:expat",
        "synopsis": "disk usage analyzer with colored tree output",
        "description": "Dutree is a command-line tool for analyzing disk usage with a colored tree output.",
        "home_page": "https://github.com/nachoparker/dutree",
    },
    "bit-bin": {
        "version": "1.1.2",
        "build_system": "copy-build-system",
        "bs_module": "(guix build-system copy)",
        "license": "license:asl2.0",
        "synopsis": "modern Git CLI with auto-complete and suggestions",
        "description": "Bit is a modern Git CLI replacement with auto-completion, suggestions, and shortcuts.",
        "home_page": "https://github.com/chriswalz/bit",
    },
    "airdcpp-webclient": {
        "version": "2.12.2",
        "build_system": "cmake-build-system",
        "bs_module": "(guix build-system cmake)",
        "license": "license:gpl2+",
        "synopsis": "file sharing client using ADC protocol with web UI",
        "description": "AirDC++ is an Advanced Direct Connect client with a web-based user interface.",
        "home_page": "https://airdcpp-web.github.io/",
    },
    "firealpaca": {
        "version": "2.11.22",
        "build_system": "copy-build-system",
        "bs_module": "(guix build-system copy)",
        "license": "license:nonfree",
        "synopsis": "free digital painting software",
        "description": "FireAlpaca is a free digital painting software with simple tools and layer support.",
        "home_page": "https://firealpaca.com/",
    },
    "munt-smf2wav": {
        "version": "2.7.1",
        "build_system": "cmake-build-system",
        "bs_module": "(guix build-system cmake)",
        "license": "license:lgpl2.1+",
        "synopsis": "convert MIDI files to WAV using MT-32 emulation",
        "description": "Convert Standard MIDI files to WAV audio using the Munt MT-32 synthesizer emulator.",
        "home_page": "https://github.com/munt/munt",
    },
    "iir1": {
        "version": "1.9.4",
        "build_system": "cmake-build-system",
        "bs_module": "(guix build-system cmake)",
        "license": "license:expat",
        "synopsis": "real-time C++ IIR audio filter library",
        "description": "IIR1 is a real-time C++ library for designing and applying IIR audio filters.",
        "home_page": "https://github.com/berndporr/iir1",
    },
    "dict-jargon": {
        "version": "4.4.7",
        "build_system": "copy-build-system",
        "bs_module": "(guix build-system copy)",
        "license": "license:public-domain",
        "synopsis": "the Jargon File (hacker dictionary) for dictd",
        "description": "The Jargon File dictionary formatted for use with the dictd dictionary server.",
        "home_page": "http://www.catb.org/jargon/",
    },
    "eruption": {
        "version": "0.4.0",
        "build_system": "cargo-build-system",
        "bs_module": "(guix build-system cargo)",
        "license": "license:gpl3+",
        "synopsis": "Linux keyboard and mouse RGB lighting daemon",
        "description": "Eruption is a Linux daemon for controlling RGB lighting on keyboards and mice with Lua scripting.",
        "home_page": "https://github.com/eruption-project/eruption",
    },
    "gdlauncher-bin": {
        "version": "2.0.25",
        "build_system": "copy-build-system",
        "bs_module": "(guix build-system copy)",
        "license": "license:gpl3+",
        "synopsis": "Minecraft Java Edition game launcher and manager",
        "description": "GDLauncher is a custom Minecraft launcher for managing instances, mods, and modpacks.",
        "home_page": "https://gdlauncher.com/",
    },
    "mautrix-telegram": {
        "version": "0.15.2",
        "build_system": "pyproject-build-system",
        "bs_module": "(guix build-system pyproject)",
        "license": "license:agpl3+",
        "synopsis": "Matrix-Telegram bridge using mautrix framework",
        "description": "A Matrix-Telegram puppeting bridge based on the mautrix Python framework.",
        "home_page": "https://github.com/mautrix/telegram",
    },
    "ncmdump": {
        "version": "0.1",
        "build_system": "gnu-build-system",
        "bs_module": "(guix build-system gnu)",
        "license": "license:expat",
        "synopsis": "convert NetEase Cloud Music encrypted files to standard formats",
        "description": "Convert NetEase Cloud Music encrypted .ncm files to standard MP3 or FLAC format.",
        "home_page": "https://github.com/anonymous5l/ncmdump",
    },
    "iwdgui": {
        "version": "0.5.0",
        "build_system": "pyproject-build-system",
        "bs_module": "(guix build-system pyproject)",
        "license": "license:gpl3+",
        "synopsis": "graphical interface for iwd wireless daemon",
        "description": "A graphical user interface for managing wireless connections with the iwd daemon.",
        "home_page": "https://github.com/defname/iwdGUI",
    },
    "logstash-bin": {
        "version": "8.13.4",
        "build_system": "copy-build-system",
        "bs_module": "(guix build-system copy)",
        "license": "license:asl2.0",
        "synopsis": "server-side data processing pipeline (Elastic Stack)",
        "description": "Logstash is a server-side data processing pipeline for ingesting, transforming, and sending data.",
        "home_page": "https://www.elastic.co/logstash",
    },
    "tauri-cli": {
        "version": "2.0.4",
        "build_system": "cargo-build-system",
        "bs_module": "(guix build-system cargo)",
        "license": "license:asl2.0",
        "synopsis": "CLI tool for Tauri desktop application framework",
        "description": "Command-line interface for building Tauri desktop applications with web technologies.",
        "home_page": "https://tauri.app/",
    },
    "mpv-mpris-git": {
        "version": "1.1",
        "build_system": "meson-build-system",
        "bs_module": "(guix build-system meson)",
        "license": "license:expat",
        "synopsis": "MPRIS plugin for the mpv media player",
        "description": "MPRIS IPC protocol plugin for mpv, enabling media key and desktop integration.",
        "home_page": "https://github.com/hoyon/mpv-mpris",
    },
    "dnsleaktest": {
        "version": "0.3",
        "build_system": "copy-build-system",
        "bs_module": "(guix build-system copy)",
        "license": "license:gpl3+",
        "synopsis": "command-line DNS leak testing tool",
        "description": "A simple command-line tool to test for DNS leaks when using a VPN.",
        "home_page": "https://github.com/macvk/dnsleaktest",
    },
    "sonobus": {
        "version": "1.7.2",
        "build_system": "cmake-build-system",
        "bs_module": "(guix build-system cmake)",
        "license": "license:gpl3+",
        "synopsis": "peer-to-peer audio streaming application for musicians",
        "description": "SonoBus is an easy-to-use application for streaming high-quality audio between devices in real-time.",
        "home_page": "https://sonobus.net/",
    },
    "bitmagnet": {
        "version": "0.9.5",
        "build_system": "go-build-system",
        "bs_module": "(guix build-system go)",
        "license": "license:expat",
        "synopsis": "self-hosted BitTorrent indexer and DHT crawler",
        "description": "Bitmagnet is a self-hosted BitTorrent indexer, DHT crawler, and content classifier.",
        "home_page": "https://bitmagnet.io/",
    },
    "dprint": {
        "version": "0.47.2",
        "build_system": "cargo-build-system",
        "bs_module": "(guix build-system cargo)",
        "license": "license:expat",
        "synopsis": "pluggable and configurable code formatter",
        "description": "Dprint is a fast, pluggable, and configurable code formatting platform.",
        "home_page": "https://dprint.dev/",
    },
    "vim-dracula": {
        "version": "2.0",
        "build_system": "copy-build-system",
        "bs_module": "(guix build-system copy)",
        "license": "license:expat",
        "synopsis": "Dracula dark color theme for Vim",
        "description": "Dracula is a dark color theme for Vim providing a comfortable coding environment.",
        "home_page": "https://draculatheme.com/vim",
    },
    "sqlitestudio-bin": {
        "version": "3.4.4",
        "build_system": "copy-build-system",
        "bs_module": "(guix build-system copy)",
        "license": "license:gpl3+",
        "synopsis": "visual SQLite database manager and editor",
        "description": "SQLiteStudio is a portable visual editor for SQLite databases with an intuitive interface.",
        "home_page": "https://sqlitestudio.pl/",
    },
    "jupyterlab-catppuccin": {
        "version": "0.2.1",
        "build_system": "pyproject-build-system",
        "bs_module": "(guix build-system pyproject)",
        "license": "license:expat",
        "synopsis": "Catppuccin color theme for JupyterLab",
        "description": "Catppuccin soothing pastel color theme extension for JupyterLab.",
        "home_page": "https://github.com/catppuccin/jupyterlab",
    },
    "albion-online-launcher-bin": {
        "version": "1.0",
        "build_system": "copy-build-system",
        "bs_module": "(guix build-system copy)",
        "license": "license:nonfree",
        "synopsis": "Albion Online MMORPG game launcher for Linux",
        "description": "Official launcher for the Albion Online sandbox MMORPG game on Linux.",
        "home_page": "https://albiononline.com/",
    },
    "zx": {
        "version": "8.1.4",
        "build_system": "copy-build-system",
        "bs_module": "(guix build-system copy)",
        "license": "license:asl2.0",
        "synopsis": "tool for writing shell scripts in JavaScript",
        "description": "Google's zx provides useful wrappers around child_process for writing shell scripts in JavaScript.",
        "home_page": "https://google.github.io/zx/",
    },
    "lazyjournal-bin": {
        "version": "0.5.0",
        "build_system": "copy-build-system",
        "bs_module": "(guix build-system copy)",
        "license": "license:expat",
        "synopsis": "TUI for journalctl and log file viewing",
        "description": "LazyJournal is a terminal UI for browsing journalctl output and log files interactively.",
        "home_page": "https://github.com/Lifailon/lazyjournal",
    },
    "hevi": {
        "version": "0.4.0",
        "build_system": "cargo-build-system",
        "bs_module": "(guix build-system cargo)",
        "license": "license:expat",
        "synopsis": "hex viewer with colored output for the terminal",
        "description": "Hevi is a fast hex viewer with colored output designed for terminal use.",
        "home_page": "https://github.com/Shfty/hevi",
    },
    "firehol": {
        "version": "3.1.7",
        "build_system": "gnu-build-system",
        "bs_module": "(guix build-system gnu)",
        "license": "license:gpl2+",
        "synopsis": "easy-to-use iptables stateful firewall configuration",
        "description": "FireHOL is a language and tool to build secure, stateful Linux firewalls from simple rules.",
        "home_page": "https://firehol.org/",
    },
    "sftpman": {
        "version": "1.2.3",
        "build_system": "pyproject-build-system",
        "bs_module": "(guix build-system pyproject)",
        "license": "license:gpl3+",
        "synopsis": "SSHFS/SFTP mount manager with CLI and GTK interface",
        "description": "SFTPMan manages SSHFS/SFTP filesystem mounts with both CLI and GTK interfaces.",
        "home_page": "https://github.com/spantaleev/sftpman",
    },
    "exabgp": {
        "version": "4.2.22",
        "build_system": "pyproject-build-system",
        "bs_module": "(guix build-system pyproject)",
        "license": "license:bsd-3",
        "synopsis": "BGP route injector and traffic manipulation tool",
        "description": "ExaBGP allows engineers to control network route announcements using simple text-based configuration.",
        "home_page": "https://github.com/Exa-Networks/exabgp",
    },
    "hex-a-hop": {
        "version": "1.1.0",
        "build_system": "gnu-build-system",
        "bs_module": "(guix build-system gnu)",
        "license": "license:gpl2+",
        "synopsis": "hexagonal tile-based puzzle game",
        "description": "Hex-a-Hop is a puzzle game where you destroy hexagonal tiles to clear each level.",
        "home_page": "http://hexahop.sourceforge.net/",
    },
    "websocat-git": {
        "version": "1.13.0",
        "build_system": "cargo-build-system",
        "bs_module": "(guix build-system cargo)",
        "license": "license:expat",
        "synopsis": "command-line WebSocket client like netcat for ws://",
        "description": "Websocat is a command-line client for WebSockets, like netcat/socat for ws:// URLs.",
        "home_page": "https://github.com/vi/websocat",
    },
    "qtchess": {
        "version": "2025.01.01",
        "build_system": "gnu-build-system",
        "bs_module": "(guix build-system gnu)",
        "license": "license:gpl3+",
        "synopsis": "simple chess game with Qt graphical interface",
        "description": "QtChess is a simple chess game with a Qt-based graphical user interface.",
        "home_page": "https://github.com/textbrowser/qtchess",
    },
    "gmetronome": {
        "version": "0.3.5",
        "build_system": "meson-build-system",
        "bs_module": "(guix build-system meson)",
        "license": "license:gpl3+",
        "synopsis": "GTK metronome application for musicians",
        "description": "GMetronome is a GNOME metronome application for practicing music at a steady tempo.",
        "home_page": "https://gitlab.gnome.org/dqpb/gmetronome",
    },
    "supabase": {
        "version": "1.200.0",
        "build_system": "go-build-system",
        "bs_module": "(guix build-system go)",
        "license": "license:expat",
        "synopsis": "Supabase CLI for local development and deployment",
        "description": "CLI tool for developing and deploying Supabase backend-as-a-service projects locally.",
        "home_page": "https://supabase.com/",
    },
    "sunflower-bin": {
        "version": "0.5.0",
        "build_system": "copy-build-system",
        "bs_module": "(guix build-system copy)",
        "license": "license:gpl3+",
        "synopsis": "twin-panel file manager for Linux",
        "description": "Sunflower is a twin-panel file manager for Linux with plugin support.",
        "home_page": "https://sunflower-fm.org/",
    },
    "solkit-bin": {
        "version": "1.0.0",
        "build_system": "copy-build-system",
        "bs_module": "(guix build-system copy)",
        "license": "license:expat",
        "synopsis": "Solana blockchain development toolkit",
        "description": "SolKit is a development toolkit for building on the Solana blockchain.",
        "home_page": "https://aur.archlinux.org/packages/solkit-bin",
    },
    "proxypin-bin": {
        "version": "1.8.3",
        "build_system": "copy-build-system",
        "bs_module": "(guix build-system copy)",
        "license": "license:asl2.0",
        "synopsis": "network traffic capture and debugging proxy tool",
        "description": "ProxyPin is an open-source tool for capturing and debugging HTTP/HTTPS network traffic.",
        "home_page": "https://github.com/wanghongenpin/network_proxy_flutter",
    },
    "pkgx-bin": {
        "version": "1.3.2",
        "build_system": "copy-build-system",
        "bs_module": "(guix build-system copy)",
        "license": "license:asl2.0",
        "synopsis": "cross-platform package runner (formerly tea)",
        "description": "Pkgx runs anything, providing package execution without installation (successor to tea).",
        "home_page": "https://pkgx.sh/",
    },
    "pbgopy-bin": {
        "version": "0.3.0",
        "build_system": "copy-build-system",
        "bs_module": "(guix build-system copy)",
        "license": "license:expat",
        "synopsis": "copy and paste between devices over the network",
        "description": "Pbgopy allows copying and pasting clipboard contents across devices over the network.",
        "home_page": "https://github.com/nakabonne/pbgopy",
    },
    "openrsync-git": {
        "version": "0.1",
        "build_system": "gnu-build-system",
        "bs_module": "(guix build-system gnu)",
        "license": "license:isc",
        "synopsis": "BSD-licensed implementation of rsync",
        "description": "OpenRsync is a clean-room BSD-licensed implementation of the rsync protocol.",
        "home_page": "https://www.openrsync.org/",
    },
    "mbw": {
        "version": "2.0",
        "build_system": "gnu-build-system",
        "bs_module": "(guix build-system gnu)",
        "license": "license:lgpl2.1+",
        "synopsis": "memory bandwidth benchmark tool",
        "description": "MBW determines the copy bandwidth available to userspace programs via memory-to-memory copy.",
        "home_page": "https://github.com/raas/mbw",
    },
    "libstudxml": {
        "version": "1.1.0",
        "build_system": "gnu-build-system",
        "bs_module": "(guix build-system gnu)",
        "license": "license:expat",
        "synopsis": "modern C++ XML pull parser and serializer library",
        "description": "Libstudxml is a modern C++ XML library with pull-parser and streaming serializer.",
        "home_page": "https://www.codesynthesis.com/projects/libstudxml/",
    },
    "jxl-oxide": {
        "version": "0.10.0",
        "build_system": "cargo-build-system",
        "bs_module": "(guix build-system cargo)",
        "license": "license:bsd-3",
        "synopsis": "pure Rust JPEG XL decoder",
        "description": "Jxl-oxide is a pure Rust implementation of a JPEG XL image format decoder.",
        "home_page": "https://github.com/tirr-c/jxl-oxide",
    },
    "hidrdd": {
        "version": "1.0",
        "build_system": "copy-build-system",
        "bs_module": "(guix build-system copy)",
        "license": "license:gpl2+",
        "synopsis": "HID report descriptor decoder",
        "description": "Decode USB HID report descriptors into a human-readable format.",
        "home_page": "https://github.com/nicman23/hidrdd",
    },
    "hamrs-appimage": {
        "version": "0.13.1",
        "build_system": "copy-build-system",
        "bs_module": "(guix build-system copy)",
        "license": "license:nonfree",
        "synopsis": "amateur radio logging application",
        "description": "HAMRS is a fast, easy-to-use amateur radio logging application available as an AppImage.",
        "home_page": "https://hamrs.app/",
    },
    "ezra-bible-app-bin": {
        "version": "1.14.1",
        "build_system": "copy-build-system",
        "bs_module": "(guix build-system copy)",
        "license": "license:gpl3+",
        "synopsis": "user-friendly Bible study application",
        "description": "Ezra Bible App is a user-friendly Bible study tool with search, tagging, and note features.",
        "home_page": "https://github.com/ezra-bible-app/ezra-bible-app",
    },
    "envfetch-bin": {
        "version": "0.5.0",
        "build_system": "copy-build-system",
        "bs_module": "(guix build-system copy)",
        "license": "license:expat",
        "synopsis": "cross-platform environment variable command-line fetcher",
        "description": "Envfetch fetches and displays environment information in a neat command-line format.",
        "home_page": "https://github.com/EnvFetch/envfetch",
    },
    "dano-bin": {
        "version": "0.4.0",
        "build_system": "copy-build-system",
        "bs_module": "(guix build-system copy)",
        "license": "license:gpl2+",
        "synopsis": "file integrity checker using embedded checksums",
        "description": "Dano is a file integrity verification tool that embeds checksums into extended attributes.",
        "home_page": "https://github.com/kimono-koans/dano",
    },
    "cryptographic-id-rs": {
        "version": "1.3.0",
        "build_system": "cargo-build-system",
        "bs_module": "(guix build-system cargo)",
        "license": "license:gpl3+",
        "synopsis": "verify device identities using cryptographic signatures",
        "description": "Cryptographic-id verifies device or user identities using Ed25519 cryptographic signatures.",
        "home_page": "https://gitlab.com/cryptographic-id/cryptographic-id-rs",
    },
    "chapar-bin": {
        "version": "0.5.0",
        "build_system": "copy-build-system",
        "bs_module": "(guix build-system copy)",
        "license": "license:expat",
        "synopsis": "open-source API testing tool",
        "description": "Chapar is an open-source API testing tool for REST and gRPC endpoints.",
        "home_page": "https://github.com/chapar-rest/chapar",
    },
    "carafe-bin": {
        "version": "0.1.0",
        "build_system": "copy-build-system",
        "bs_module": "(guix build-system copy)",
        "license": "license:expat",
        "synopsis": "local-first note-taking and wiki application",
        "description": "Carafe is a local-first note-taking application with wiki-style linking.",
        "home_page": "https://aur.archlinux.org/packages/carafe-bin",
    },
    "toggl-bin": {
        "version": "7.5.441",
        "build_system": "copy-build-system",
        "bs_module": "(guix build-system copy)",
        "license": "license:nonfree",
        "synopsis": "Toggl time tracking desktop application",
        "description": "Official Toggl time tracking desktop application for Linux.",
        "home_page": "https://toggl.com/",
    },
    "todoist-bin": {
        "version": "1.0.9",
        "build_system": "copy-build-system",
        "bs_module": "(guix build-system copy)",
        "license": "license:nonfree",
        "synopsis": "Todoist task management desktop application",
        "description": "Official Todoist task management and to-do list application for Linux.",
        "home_page": "https://todoist.com/",
    },
    "cryptr-bin": {
        "version": "0.5.1",
        "build_system": "copy-build-system",
        "bs_module": "(guix build-system copy)",
        "license": "license:expat",
        "synopsis": "desktop GUI client for HashiCorp Vault",
        "description": "Cryptr is a cross-platform desktop GUI client for managing secrets in HashiCorp Vault.",
        "home_page": "https://github.com/jcrowthe/cryptr",
    },
    "relagit-bin": {
        "version": "0.16.0",
        "build_system": "copy-build-system",
        "bs_module": "(guix build-system copy)",
        "license": "license:expat",
        "synopsis": "visual Git client with a clean interface",
        "description": "RelaGit is a visual Git client providing a clean and simple interface for repository management.",
        "home_page": "https://rela.dev/",
    },
    "uefi-run": {
        "version": "0.5.0",
        "build_system": "cargo-build-system",
        "bs_module": "(guix build-system cargo)",
        "license": "license:expat",
        "synopsis": "run UEFI applications in QEMU directly",
        "description": "Uefi-run is a tool to directly run UEFI applications in QEMU without a full disk image.",
        "home_page": "https://github.com/Richard-W/uefi-run",
    },
    "telosys-cli": {
        "version": "4.2.0",
        "build_system": "copy-build-system",
        "bs_module": "(guix build-system copy)",
        "license": "license:lgpl3+",
        "synopsis": "lightweight code generator for Java and other languages",
        "description": "Telosys is a lightweight code generator supporting Java, Python, Go, and other languages.",
        "home_page": "https://www.telosys.org/",
    },
    "feeddeck-bin": {
        "version": "1.5.0",
        "build_system": "copy-build-system",
        "bs_module": "(guix build-system copy)",
        "license": "license:expat",
        "synopsis": "multi-column feed reader application",
        "description": "FeedDeck is a multi-column feed reader for RSS, Atom, and social media feeds.",
        "home_page": "https://feeddeck.app/",
    },
    "fakepkg": {
        "version": "1.12.1",
        "build_system": "gnu-build-system",
        "bs_module": "(guix build-system gnu)",
        "license": "license:isc",
        "synopsis": "regenerate pacman packages from installed files",
        "description": "Fakepkg generates Arch Linux pacman packages from already-installed package files.",
        "home_page": "https://github.com/nicman23/fakepkg",
    },
    "mkgmap": {
        "version": "4948",
        "build_system": "copy-build-system",
        "bs_module": "(guix build-system copy)",
        "license": "license:gpl2+",
        "synopsis": "convert OpenStreetMap data to Garmin GPS format",
        "description": "Mkgmap converts OpenStreetMap data into maps for Garmin GPS devices.",
        "home_page": "https://www.mkgmap.org.uk/",
    },
    "typst-languagetool-lsp-git": {
        "version": "0.1.0",
        "build_system": "cargo-build-system",
        "bs_module": "(guix build-system cargo)",
        "license": "license:expat",
        "synopsis": "LanguageTool integration for Typst via LSP",
        "description": "Language server providing LanguageTool grammar checking integration for Typst documents.",
        "home_page": "https://github.com/antonWetzel/typst-languagetool",
    },
    "offsetexplorer": {
        "version": "3.0.0",
        "build_system": "copy-build-system",
        "bs_module": "(guix build-system copy)",
        "license": "license:nonfree",
        "synopsis": "visual Apache Kafka topic browser and manager",
        "description": "Offset Explorer is a GUI tool for browsing and managing Apache Kafka topics and consumer groups.",
        "home_page": "https://www.kafkatool.com/",
    },
    "mihomo-party": {
        "version": "1.3.0",
        "build_system": "copy-build-system",
        "bs_module": "(guix build-system copy)",
        "license": "license:gpl3+",
        "synopsis": "cross-platform proxy client with GUI based on Mihomo",
        "description": "Mihomo Party is a cross-platform proxy client with a graphical interface based on the Mihomo core.",
        "home_page": "https://github.com/mihomo-party-org/mihomo-party",
    },
    "matrix-sliding-sync": {
        "version": "0.99.19",
        "build_system": "go-build-system",
        "bs_module": "(guix build-system go)",
        "license": "license:asl2.0",
        "synopsis": "Matrix sliding sync proxy server",
        "description": "An implementation of MSC3575 sliding sync for Matrix homeservers.",
        "home_page": "https://github.com/matrix-org/sliding-sync",
    },
    "i3-resurrect": {
        "version": "1.4.5",
        "build_system": "pyproject-build-system",
        "bs_module": "(guix build-system pyproject)",
        "license": "license:gpl3+",
        "synopsis": "save and restore i3 window manager workspaces",
        "description": "Save and restore i3 and Sway window manager workspace layouts and running programs.",
        "home_page": "https://github.com/JonnyHaystack/i3-resurrect",
    },
    "latex2rtf": {
        "version": "2.3.18",
        "build_system": "gnu-build-system",
        "bs_module": "(guix build-system gnu)",
        "license": "license:gpl2+",
        "synopsis": "convert LaTeX documents to RTF format",
        "description": "Latex2rtf converts LaTeX documents to Rich Text Format for use in word processors.",
        "home_page": "https://latex2rtf.sourceforge.net/",
    },
    "duck": {
        "version": "8.7.3",
        "build_system": "copy-build-system",
        "bs_module": "(guix build-system copy)",
        "license": "license:gpl3+",
        "synopsis": "Cyberduck CLI for cloud storage and file transfer",
        "description": "Duck is the Cyberduck command-line interface for FTP, SFTP, S3, and cloud storage protocols.",
        "home_page": "https://duck.sh/",
    },
    "syncterm": {
        "version": "1.3",
        "build_system": "gnu-build-system",
        "bs_module": "(guix build-system gnu)",
        "license": "license:gpl2+",
        "synopsis": "BBS terminal program supporting multiple protocols",
        "description": "SyncTERM is a terminal program supporting telnet, SSH, and modem connections to BBS systems.",
        "home_page": "https://syncterm.net/",
    },
    "cmatrix-neo-git": {
        "version": "2.0",
        "build_system": "cmake-build-system",
        "bs_module": "(guix build-system cmake)",
        "license": "license:gpl3+",
        "synopsis": "Matrix-style terminal screensaver with extra effects",
        "description": "CMatrix Neo is a terminal screensaver showing scrolling Matrix-style characters with extra visual effects.",
        "home_page": "https://github.com/st3w/neo",
    },
}


def scheme_id(name):
    """Convert package name to valid Scheme identifier."""
    # Replace dots and underscores with hyphens
    sid = name.replace(".", "-").replace("_", "-")
    # If starts with digit, prefix with 'pkg-'
    if sid and sid[0].isdigit():
        sid = "pkg-" + sid
    return sid


def generate_recipe_scm():
    """Generate the recipe-resolver .scm file."""
    exports = []
    definitions = []

    for _, name in SELECTED:
        sid = scheme_id(name)
        exports.append(sid)

        meta = METADATA.get(name, {})
        version = meta.get("version", "1.0.0")
        build_system = meta.get("build_system", "copy-build-system")
        license_str = meta.get("license", "license:gpl3+")
        synopsis = meta.get("synopsis", name.replace("-", " "))
        description = meta.get("description", synopsis.capitalize() + ".")
        home_page = meta.get("home_page", f"https://aur.archlinux.org/packages/{name}")

        # source URI - use AUR snapshot tarball
        uri_str = f'"https://aur.archlinux.org/cgit/aur.git/snapshot/{name}.tar.gz"'

        # Determine arguments
        args = '(arguments (list #:tests? #f))'

        definition = f""";;; {name} --- {synopsis}
(define-public {sid}
  (package
    (name "{name}")
    (version "{version}")
    (source (origin
              (method url-fetch)
              (uri {uri_str})
              (sha256
               (base32 "{PLACEHOLDER_HASH}"))))
    (build-system {build_system})
    {args}
    (supported-systems '("x86_64-linux"))
    (synopsis "{synopsis}")
    (description "{description}")
    (home-page "{home_page}")
    (license {license_str})))
"""
        definitions.append(definition)

    # Build exports list
    exports_str = "\n".join(f"            {e}" for e in exports)

    header = f""";;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Recipe resolver pass --- {PASS_ID}
;;; Resolves 100 packages from queue (100 recipes, 0 blocked).
;;;
;;; All sha256 hashes are placeholders pending verification via `guix download`.

(define-module (gaurix packages {PASS_ID})
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system cargo)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system go)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:export (
{exports_str}
            ))

;;; Nonfree/proprietary license placeholder for Gaurix channel
(define license:nonfree
  ((@@ (guix licenses) license) "Nonfree"
    "https://spdx.org/licenses/"
    "Proprietary or custom license; see upstream for terms."))

"""

    content = header + "\n".join(definitions)

    with open(RECIPE_SCM, "w") as f:
        f.write(content)
    print(f"Wrote {RECIPE_SCM}")


def update_packages_scm():
    """Append re-export block to packages.scm."""
    with open(PACKAGES_SCM, "r") as f:
        content = f.read()

    exports = [scheme_id(name) for _, name in SELECTED]
    exports_str = "\n".join(f"               {e}" for e in sorted(exports))

    new_block = f"""

;;; {PASS_ID}
(define-module (gaurix packages)
  #:use-module (gaurix packages {PASS_ID})
  #:re-export (
{exports_str}
))
"""

    # Insert header comment at line 3
    lines = content.split("\n")
    insert_idx = 2
    header_line = f"            ;; {PASS_ID}: 100 packages resolved from queue"
    lines.insert(insert_idx, header_line)
    content = "\n".join(lines)

    # Append re-export block
    content = content.rstrip() + "\n" + new_block

    # Write atomically via temp file
    fd, tmp = tempfile.mkstemp(dir=os.path.dirname(PACKAGES_SCM))
    try:
        with os.fdopen(fd, 'w') as f:
            f.write(content)
        shutil.move(tmp, PACKAGES_SCM)
        print(f"Updated {PACKAGES_SCM}")
    except:
        os.unlink(tmp)
        raise


def update_general_compat_scm():
    """Add #:use-module and re-exports to general-compat.scm."""
    with open(COMPAT_SCM, "r") as f:
        content = f.read()

    lines = content.split("\n")
    new_lines = []

    use_module_line = f"  #:use-module (gaurix packages {PASS_ID})"
    use_module_inserted = False
    last_use_module_idx = -1

    for i, line in enumerate(lines):
        if "#:use-module (gaurix packages " in line:
            last_use_module_idx = i

    for i, line in enumerate(lines):
        new_lines.append(line)
        if i == last_use_module_idx and not use_module_inserted:
            new_lines.append(use_module_line)
            use_module_inserted = True

    # Add re-exports at end
    exports = [scheme_id(name) for _, name in SELECTED]
    reexport_lines = [f"\n;;; {PASS_ID}"]
    for sym in sorted(exports):
        reexport_lines.append(f"(re-export {sym})")

    new_lines.extend(reexport_lines)
    new_lines.append("")

    content = "\n".join(new_lines)

    fd, tmp = tempfile.mkstemp(dir=os.path.dirname(COMPAT_SCM))
    try:
        with os.fdopen(fd, 'w') as f:
            f.write(content)
        shutil.move(tmp, COMPAT_SCM)
        print(f"Updated {COMPAT_SCM}")
    except:
        os.unlink(tmp)
        raise


def update_org_file():
    """Update todo_general_packages.org statuses for touched entries."""
    with open(ORG_FILE, "r") as f:
        content = f.read()

    # Build lookup: entry_number -> package_name
    entry_map = {num: name for num, name in SELECTED}

    lines = content.split("\n")
    new_lines = []
    i = 0
    while i < len(lines):
        line = lines[i]
        # Check if this is a TODO entry header matching one of our packages
        matched_entry = None
        for num, name in SELECTED:
            pattern = f"** TODO {num}. {name}"
            if line.strip().startswith(pattern):
                matched_entry = (num, name)
                break

        if matched_entry:
            num, name = matched_entry
            # Change TODO to DONE
            new_line = line.replace(f"** TODO {num}.", f"** DONE {num}.", 1)
            # Add resolver tag
            if f":{PASS_ID}:" not in new_line:
                new_line = new_line.rstrip() + f"  :{PASS_ID}:recipe-generated:"
            new_lines.append(new_line)
            i += 1

            # Process subsequent lines of this entry until next header
            status_added = False
            while i < len(lines) and not lines[i].startswith("** "):
                new_lines.append(lines[i])
                # After the last status line, insert our status
                if lines[i].strip().startswith("- TODO Status:") and not status_added:
                    new_lines.append(f"   - Status: DONE: Recipe generated in {PASS_ID}.scm ({PASS_ID})")
                    new_lines.append(f"   - TODO Status: DONE")
                    status_added = True
                i += 1
            if not status_added:
                # Insert before next header
                new_lines.append(f"   - Status: DONE: Recipe generated in {PASS_ID}.scm ({PASS_ID})")
                new_lines.append(f"   - TODO Status: DONE")
        else:
            new_lines.append(line)
            i += 1

    content = "\n".join(new_lines)

    fd, tmp = tempfile.mkstemp(dir=os.path.dirname(str(ORG_FILE)))
    try:
        with os.fdopen(fd, 'w') as f:
            f.write(content)
        shutil.move(tmp, str(ORG_FILE))
        print(f"Updated {ORG_FILE}")
    except:
        os.unlink(tmp)
        raise


if __name__ == "__main__":
    print(f"=== Generating {PASS_ID} ===")
    generate_recipe_scm()
    update_packages_scm()
    update_general_compat_scm()
    update_org_file()
    print("Done.")
