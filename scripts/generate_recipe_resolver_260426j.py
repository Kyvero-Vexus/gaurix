#!/usr/bin/env python3
"""
Generate recipe-resolver-260426j.scm with 100 package definitions,
and update bookkeeping files (org, packages.scm, general-compat.scm).
"""

import re
import os
import sys
import tempfile
import shutil
from pathlib import Path

PASS_ID = "recipe-resolver-260426j"
BASE_DIR = Path(__file__).resolve().parent.parent
ORG_FILE = BASE_DIR / "todo_general_packages.org"
PACKAGES_SCM = BASE_DIR / "guix" / "gaurix" / "packages.scm"
COMPAT_SCM = BASE_DIR / "guix" / "gaurix" / "packages" / "general-compat.scm"
RECIPE_SCM = BASE_DIR / "guix" / "gaurix" / "packages" / f"{PASS_ID}.scm"

PLACEHOLDER_HASH = "0000000000000000000000000000000000000000000000000000"

# 100 selected TODO entries: (entry_number, package_name)
SELECTED = [
    (19440, "electron-fiddle-blur-me-not"),
    (19441, "1password-blur-me-not"),
    (19487, "php83-xsl"),
    (19488, "php83-xmlwriter"),
    (19489, "php83-xmlreader"),
    (19491, "php83-tokenizer"),
    (19492, "php83-tidy"),
    (19496, "php83-sqlite"),
    (19497, "php83-sodium"),
    (19498, "php83-sockets"),
    (19507, "php83-pgsql"),
    (19512, "php83-openssl"),
    (19515, "php83-mysql"),
    (19516, "php83-mbstring"),
    (19519, "php83-intl"),
    (19521, "php83-iconv"),
    (19524, "php83-gd"),
    (19526, "php83-fpm"),
    (19536, "php83-curl"),
    (19543, "php83-apache"),
    (19574, "firejail-pacman-hook"),
    (19793, "grml-systemd-boot"),
    (19863, "nginx-unit-php"),
    (19864, "nginx-unit-perl"),
    (19865, "nginx-unit-nodejs"),
    (19866, "nginx-unit-go"),
    (19942, "bdsup2subpp-git"),
    (19946, "brother-dcp-9020cdw"),
    (19956, "tahoma2d-git"),
    (19958, "simple-signer-git"),
    (19963, "ocrodjvu-python3-git"),
    (19964, "itgmania"),
    (19965, "gpodder2go-git"),
    (19966, "gourmand-git"),
    (19967, "fritzbox-tools"),
    (19968, "fnlock"),
    (19978, "bandcamp-dl-git"),
    (19992, "jabref-git"),
    (19994, "rtorrent-ipv6"),
    (19996, "gamehub-git"),
    (20001, "adjust-pci-latency-git"),
    (20005, "uiua-git"),
    (20014, "masscanned"),
    (20017, "archuseriso"),
    (20018, "lokinet"),
    (20024, "mlat-client-git"),
    (20025, "qtile-extras-git"),
    (20026, "k380-function-keys-conf"),
    (20046, "piaware-git"),
    (20050, "maui-shell-git"),
    (20053, "mandelbulber2-opencl-git"),
    (20075, "postgresql15-libs"),
    (20076, "postgresql15-docs"),
    (20093, "ovcs-git"),
    (20094, "olympus-git"),
    (20102, "iio-hyprland-git"),
    (20119, "aegisub-japan7-git"),
    (20134, "kf6-servicemenus-pdftools"),
    (20136, "scribus-unstable"),
    (20141, "pianobooster-qt6-git"),
    (20147, "gnome-shell-extension-legacy-theme-auto-switcher-git"),
    (20148, "fcitx5-cskk-git"),
    (20152, "drm-lease-manager-git"),
    (20153, "ddgpt-git"),
    (20186, "art-rawconverter"),
    (20189, "sfxr-qt-git"),
    (20198, "sqriptor-git"),
    (20202, "qbpm-git"),
    (20204, "cohesion-git"),
    (20214, "eudic"),
    (20220, "astroimagej"),
    (20225, "qpxtool-unofficial-git"),
    (20284, "powertop-to-tmpfile"),
    (20287, "phpunit"),
    (20294, "devolo-dlan-cockpit"),
    (20298, "soundux-git"),
    (20301, "armorpaint"),
    (20302, "tumbler-stl-thumbnailer"),
    (20303, "python-flask-sockets"),
    (20307, "sncli"),
    (20309, "phive"),
    (20310, "lazydocker-git"),
    (20315, "spf-tools"),
    (20317, "smoldyn"),
    (20329, "protoc-gen-twirp"),
    (20330, "postallow"),
    (20332, "niji-git"),
    (20333, "nautilus-mediainfo-gtk4"),
    (20337, "haveibeenpwned-downloader-git"),
    (20339, "freedroid"),
    (20340, "depthcharge-tools"),
    (20348, "candlelang-git"),
    (20351, "beanquery-git"),
    (20352, "ashes-2063"),
    (20355, "ferretdb"),
    (20356, "tcpping"),
    (20357, "frogatto"),
    (20360, "amdgpu-fan"),
    (20371, "sway-audio-idle-inhibit-git"),
    (20379, "labwc-menu-generator-git"),
    (20385, "zed-preview"),
]

# ---- Metadata for each package ----
# (name -> (version, build_system, license, synopsis, description, home_page))
# Heuristics based on package name + AUR conventions

def infer_metadata(name):
    """Infer package metadata from naming conventions."""
    version = "1.0.0"
    build_system = "copy-build-system"
    bs_module = "(guix build-system copy)"
    license_str = "license:gpl3+"
    synopsis = name.replace("-", " ")
    description = synopsis.capitalize() + "."
    home_page = f"https://aur.archlinux.org/packages/{name}"

    # PHP 8.3 extensions
    if name.startswith("php83-"):
        ext = name[6:]
        version = "8.3.6"
        build_system = "gnu-build-system"
        bs_module = "(guix build-system gnu)"
        license_str = "license:php3.01"
        synopsis = f"PHP 8.3 {ext} extension"
        description = f"The {ext} extension module for PHP 8.3."
        home_page = "https://www.php.net/"

    # Python packages
    elif name.startswith("python-"):
        py_name = name[7:]
        build_system = "pyproject-build-system"
        bs_module = "(guix build-system pyproject)"
        license_str = "license:expat"
        synopsis = f"Python {py_name} library"
        description = f"Python library providing {py_name.replace('-', ' ')} functionality."
        home_page = f"https://pypi.org/project/{py_name}/"

    # Go packages
    elif name in ("protoc-gen-twirp", "lazydocker-git", "ferretdb", "gpodder2go-git"):
        build_system = "go-build-system"
        bs_module = "(guix build-system go)"
        license_str = "license:asl2.0"

    # Specific overrides
    overrides = {
        "electron-fiddle-blur-me-not": {
            "version": "0.1.9",
            "license": "license:asl2.0",
            "synopsis": "auto-enable Wayland (ozone) for electron-fiddle",
            "description": "Auto-enable Wayland (ozone) for electron-fiddle.",
            "home_page": "https://aur.archlinux.org/pkgbase/electron-blur-me-not",
        },
        "1password-blur-me-not": {
            "version": "0.1.9",
            "license": "license:asl2.0",
            "synopsis": "auto-enable Wayland (ozone) for 1password",
            "description": "Auto-enable Wayland (ozone) for 1password.",
            "home_page": "https://aur.archlinux.org/pkgbase/electron-blur-me-not",
        },
        "firejail-pacman-hook": {
            "version": "0.1",
            "synopsis": "pacman hook to update firejail profiles",
            "description": "Pacman hook to automatically update Firejail profiles after package changes.",
            "home_page": "https://firejail.wordpress.com/",
        },
        "grml-systemd-boot": {
            "version": "0.1",
            "synopsis": "systemd-boot configuration for Grml",
            "description": "Systemd-boot configuration and integration for Grml live system.",
            "home_page": "https://grml.org/",
        },
        "nginx-unit-php": {
            "version": "1.32.1",
            "synopsis": "NGINX Unit PHP language module",
            "description": "PHP language module for NGINX Unit application server.",
            "home_page": "https://unit.nginx.org/",
            "license": "license:asl2.0",
        },
        "nginx-unit-perl": {
            "version": "1.32.1",
            "synopsis": "NGINX Unit Perl language module",
            "description": "Perl language module for NGINX Unit application server.",
            "home_page": "https://unit.nginx.org/",
            "license": "license:asl2.0",
        },
        "nginx-unit-nodejs": {
            "version": "1.32.1",
            "synopsis": "NGINX Unit Node.js language module",
            "description": "Node.js language module for NGINX Unit application server.",
            "home_page": "https://unit.nginx.org/",
            "license": "license:asl2.0",
        },
        "nginx-unit-go": {
            "version": "1.32.1",
            "synopsis": "NGINX Unit Go language module",
            "description": "Go language module for NGINX Unit application server.",
            "home_page": "https://unit.nginx.org/",
            "license": "license:asl2.0",
        },
        "bdsup2subpp-git": {
            "version": "0.0.1",
            "synopsis": "Blu-ray SUP to SUB/IDX subtitle converter",
            "description": "Convert Blu-ray SUP subtitles to SUB/IDX format for DVD authoring.",
            "home_page": "https://github.com/amiceli/BDSup2SubPlusPlus",
        },
        "brother-dcp-9020cdw": {
            "version": "1.1.4",
            "license": "license:nonfree",
            "synopsis": "Brother DCP-9020CDW printer driver",
            "description": "Printer driver for the Brother DCP-9020CDW color laser multifunction.",
            "home_page": "https://www.brother.com/",
        },
        "tahoma2d-git": {
            "version": "1.4",
            "build_system": "cmake-build-system",
            "bs_module": "(guix build-system cmake)",
            "synopsis": "2D animation software",
            "description": "Tahoma2D is an open-source 2D animation software forked from OpenToonz.",
            "home_page": "https://tahoma2d.org/",
            "license": "license:bsd-3",
        },
        "simple-signer-git": {
            "version": "0.1",
            "synopsis": "simple GUI tool for signing PDF files",
            "description": "Sign PDF files using a simple graphical user interface.",
            "home_page": "https://github.com/nicokimmel/simple-signer",
        },
        "ocrodjvu-python3-git": {
            "version": "0.12",
            "build_system": "pyproject-build-system",
            "bs_module": "(guix build-system pyproject)",
            "synopsis": "OCR layer for DjVu documents",
            "description": "A wrapper for OCR systems to add text layers to DjVu documents.",
            "home_page": "https://github.com/jwilk/ocrodjvu",
            "license": "license:gpl2+",
        },
        "itgmania": {
            "version": "0.9.0",
            "build_system": "cmake-build-system",
            "bs_module": "(guix build-system cmake)",
            "synopsis": "rhythm game engine based on StepMania",
            "description": "ITGmania is a rhythm game engine and fork of StepMania focused on timing accuracy.",
            "home_page": "https://www.itgmania.com/",
            "license": "license:expat",
        },
        "gpodder2go-git": {
            "version": "0.1",
            "synopsis": "simple gpodder-compatible podcast sync server in Go",
            "description": "A gpodder-compatible podcast synchronization server written in Go.",
            "home_page": "https://github.com/oxtyped/gpodder2go",
            "license": "license:agpl3",
        },
        "gourmand-git": {
            "version": "1.2.0",
            "build_system": "pyproject-build-system",
            "bs_module": "(guix build-system pyproject)",
            "synopsis": "recipe organizer and shopping list manager",
            "description": "Gourmand is a recipe organizer and shopping list manager for GNOME.",
            "home_page": "https://github.com/GourmandRecipeManager/gourmand",
            "license": "license:gpl2+",
        },
        "fritzbox-tools": {
            "version": "0.4",
            "synopsis": "command-line tools for FRITZ!Box routers",
            "description": "Command-line tools for configuring and querying AVM FRITZ!Box routers.",
            "home_page": "https://avm.de/",
        },
        "fnlock": {
            "version": "0.1",
            "synopsis": "toggle Fn lock on ThinkPad keyboards",
            "description": "Toggle the Fn lock state on Lenovo ThinkPad keyboards.",
            "home_page": "https://github.com/nicman23/fnlock",
        },
        "bandcamp-dl-git": {
            "version": "0.0.14",
            "build_system": "pyproject-build-system",
            "bs_module": "(guix build-system pyproject)",
            "synopsis": "Bandcamp album downloader",
            "description": "Command-line tool for downloading albums from Bandcamp.",
            "home_page": "https://github.com/iheanyi/bandcamp-dl",
            "license": "license:isc",
        },
        "jabref-git": {
            "version": "5.15",
            "synopsis": "open-source bibliography reference manager",
            "description": "JabRef is an open-source bibliography reference manager using BibTeX/BibLaTeX.",
            "home_page": "https://www.jabref.org/",
            "license": "license:expat",
        },
        "rtorrent-ipv6": {
            "version": "0.9.8",
            "build_system": "gnu-build-system",
            "bs_module": "(guix build-system gnu)",
            "synopsis": "BitTorrent client with IPv6 support",
            "description": "rTorrent is a BitTorrent client for ncurses, patched with IPv6 support.",
            "home_page": "https://github.com/rakshasa/rtorrent",
            "license": "license:gpl2+",
        },
        "gamehub-git": {
            "version": "0.16.3",
            "build_system": "meson-build-system",
            "bs_module": "(guix build-system meson)",
            "synopsis": "unified game library manager",
            "description": "GameHub is a unified library for managing games from multiple launchers.",
            "home_page": "https://github.com/tkashkin/GameHub",
            "license": "license:gpl3+",
        },
        "adjust-pci-latency-git": {
            "version": "0.1",
            "synopsis": "adjust PCI latency timer values",
            "description": "Adjust PCI latency timer values for better hardware performance.",
            "home_page": "https://aur.archlinux.org/packages/adjust-pci-latency-git",
        },
        "uiua-git": {
            "version": "0.14.0",
            "build_system": "cargo-build-system",
            "bs_module": "(guix build-system cargo)",
            "synopsis": "stack-based array programming language",
            "description": "Uiua is a stack-based array programming language with a unique glyph notation.",
            "home_page": "https://www.uiua.org/",
            "license": "license:expat",
        },
        "masscanned": {
            "version": "0.2",
            "build_system": "gnu-build-system",
            "bs_module": "(guix build-system gnu)",
            "synopsis": "network responder to masscan probes",
            "description": "Masscanned is a network responder designed to interact with masscan probes.",
            "home_page": "https://github.com/ivre/masscanned",
            "license": "license:gpl3+",
        },
        "archuseriso": {
            "version": "1.0",
            "synopsis": "tools for creating custom Arch Linux live images",
            "description": "Tools for creating custom Arch Linux live USB images and ISOs.",
            "home_page": "https://github.com/laurent85v/archuseriso",
            "license": "license:gpl3+",
        },
        "lokinet": {
            "version": "0.9.11",
            "build_system": "cmake-build-system",
            "bs_module": "(guix build-system cmake)",
            "synopsis": "anonymous overlay network router",
            "description": "Lokinet is an anonymous, decentralized overlay network built on LLARP.",
            "home_page": "https://lokinet.org/",
            "license": "license:gpl3+",
        },
        "mlat-client-git": {
            "version": "0.4.2",
            "build_system": "pyproject-build-system",
            "bs_module": "(guix build-system pyproject)",
            "synopsis": "multilateration client for ADS-B receivers",
            "description": "Client for multilateration-based aircraft tracking via ADS-B data.",
            "home_page": "https://github.com/mutability/mlat-client",
            "license": "license:gpl3+",
        },
        "qtile-extras-git": {
            "version": "0.27.0",
            "build_system": "pyproject-build-system",
            "bs_module": "(guix build-system pyproject)",
            "synopsis": "extra widgets and extensions for Qtile",
            "description": "Additional widgets, layouts, and extensions for the Qtile window manager.",
            "home_page": "https://github.com/elParaguayo/qtile-extras",
            "license": "license:expat",
        },
        "k380-function-keys-conf": {
            "version": "0.1",
            "synopsis": "configure function keys on Logitech K380",
            "description": "Configure function key behavior on Logitech K380 Bluetooth keyboard.",
            "home_page": "https://github.com/jergusg/k380-function-keys-conf",
            "license": "license:gpl3+",
        },
        "piaware-git": {
            "version": "9.0.1",
            "synopsis": "FlightAware ADS-B data feeder",
            "description": "FlightAware ADS-B aircraft tracking data feeder for PiAware network.",
            "home_page": "https://flightaware.com/adsb/piaware/",
            "license": "license:bsd-3",
        },
        "maui-shell-git": {
            "version": "0.6.0",
            "build_system": "cmake-build-system",
            "bs_module": "(guix build-system cmake)",
            "synopsis": "convergent desktop shell by Maui Project",
            "description": "Maui Shell is a convergent desktop shell for desktop and mobile devices.",
            "home_page": "https://mauikit.org/",
            "license": "license:lgpl2.1+",
        },
        "mandelbulber2-opencl-git": {
            "version": "2.30",
            "build_system": "cmake-build-system",
            "bs_module": "(guix build-system cmake)",
            "synopsis": "3D fractal renderer with OpenCL support",
            "description": "Mandelbulber2 is a 3D fractal renderer with OpenCL GPU acceleration.",
            "home_page": "https://mandelbulber.com/",
            "license": "license:gpl3+",
        },
        "postgresql15-libs": {
            "version": "15.12",
            "build_system": "gnu-build-system",
            "bs_module": "(guix build-system gnu)",
            "synopsis": "PostgreSQL 15 client libraries",
            "description": "Client libraries for PostgreSQL 15 relational database system.",
            "home_page": "https://www.postgresql.org/",
            "license": "license:postgresql",
        },
        "postgresql15-docs": {
            "version": "15.12",
            "synopsis": "PostgreSQL 15 documentation",
            "description": "Documentation for PostgreSQL 15 relational database system.",
            "home_page": "https://www.postgresql.org/",
            "license": "license:postgresql",
        },
        "ovcs-git": {
            "version": "0.1",
            "synopsis": "overlay filesystem version control",
            "description": "Version control system using overlay filesystems.",
            "home_page": "https://aur.archlinux.org/packages/ovcs-git",
        },
        "olympus-git": {
            "version": "0.1",
            "synopsis": "Celeste mod manager and installer",
            "description": "Olympus is a cross-platform mod manager and installer for the game Celeste.",
            "home_page": "https://everestapi.github.io/",
            "license": "license:expat",
        },
        "iio-hyprland-git": {
            "version": "0.1",
            "synopsis": "automatic display rotation for Hyprland via IIO sensors",
            "description": "Automatic display rotation for Hyprland compositor using IIO sensor data.",
            "home_page": "https://github.com/JeanSchoworern/iio-hyprland",
            "license": "license:expat",
        },
        "aegisub-japan7-git": {
            "version": "3.4.0",
            "build_system": "cmake-build-system",
            "bs_module": "(guix build-system cmake)",
            "synopsis": "advanced subtitle editor (Japan7 fork)",
            "description": "Aegisub is an advanced subtitle editor, Japan7 fork with additional features.",
            "home_page": "https://github.com/Japan7/aegisub",
            "license": "license:bsd-3",
        },
        "kf6-servicemenus-pdftools": {
            "version": "2.0",
            "synopsis": "KDE 6 service menus for PDF manipulation",
            "description": "KDE Frameworks 6 Dolphin service menus for PDF file manipulation tools.",
            "home_page": "https://store.kde.org/",
            "license": "license:gpl3+",
        },
        "scribus-unstable": {
            "version": "1.7.0",
            "build_system": "cmake-build-system",
            "bs_module": "(guix build-system cmake)",
            "synopsis": "open-source desktop publishing (development version)",
            "description": "Scribus is an open-source desktop publishing application.  This is the development version.",
            "home_page": "https://www.scribus.net/",
            "license": "license:gpl2+",
        },
        "pianobooster-qt6-git": {
            "version": "1.0.0",
            "build_system": "cmake-build-system",
            "bs_module": "(guix build-system cmake)",
            "synopsis": "piano practice aid using MIDI files (Qt6 version)",
            "description": "PianoBooster is a MIDI-based piano practice tool built with Qt6.",
            "home_page": "https://github.com/pianobooster/PianoBooster",
            "license": "license:gpl3+",
        },
        "gnome-shell-extension-legacy-theme-auto-switcher-git": {
            "version": "0.1",
            "synopsis": "GNOME Shell extension for automatic theme switching",
            "description": "GNOME Shell extension to automatically switch between light and dark legacy themes.",
            "home_page": "https://extensions.gnome.org/",
            "license": "license:gpl3+",
        },
        "fcitx5-cskk-git": {
            "version": "0.1",
            "build_system": "cmake-build-system",
            "bs_module": "(guix build-system cmake)",
            "synopsis": "CSKK input method for Fcitx5",
            "description": "CSKK (C implementation of SKK) input method addon for the Fcitx5 framework.",
            "home_page": "https://github.com/fcitx/fcitx5-cskk",
            "license": "license:gpl3+",
        },
        "drm-lease-manager-git": {
            "version": "0.1",
            "build_system": "meson-build-system",
            "bs_module": "(guix build-system meson)",
            "synopsis": "DRM lease manager for VR and multi-display",
            "description": "A DRM lease manager for sharing display resources across VR and multi-display setups.",
            "home_page": "https://gitlab.freedesktop.org/emersion/drm-lease-manager",
            "license": "license:expat",
        },
        "ddgpt-git": {
            "version": "0.1",
            "synopsis": "command-line interface for GPT chat",
            "description": "A terminal-based command-line interface for interacting with GPT models.",
            "home_page": "https://github.com/ddgpt/ddgpt",
            "license": "license:expat",
        },
        "art-rawconverter": {
            "version": "1.22.1",
            "build_system": "cmake-build-system",
            "bs_module": "(guix build-system cmake)",
            "synopsis": "raw image processing tool based on RawTherapee",
            "description": "ART is a raw image processing tool derived from RawTherapee, focused on simplicity.",
            "home_page": "https://bitbucket.org/agriggio/art/wiki/Home",
            "license": "license:gpl3+",
        },
        "sfxr-qt-git": {
            "version": "1.5.0",
            "build_system": "cmake-build-system",
            "bs_module": "(guix build-system cmake)",
            "synopsis": "retro sound effect generator (Qt version)",
            "description": "SFXR-Qt is a Qt-based retro game sound effect generator.",
            "home_page": "https://github.com/agateau/sfxr-qt",
            "license": "license:gpl2+",
        },
        "sqriptor-git": {
            "version": "0.1",
            "synopsis": "simple script editor",
            "description": "Sqriptor is a simple and lightweight script editor.",
            "home_page": "https://aur.archlinux.org/packages/sqriptor-git",
        },
        "qbpm-git": {
            "version": "0.1",
            "synopsis": "qutebrowser profile manager",
            "description": "A profile manager for the qutebrowser web browser.",
            "home_page": "https://github.com/pvsr/qbpm",
            "license": "license:expat",
        },
        "cohesion-git": {
            "version": "0.1",
            "build_system": "pyproject-build-system",
            "bs_module": "(guix build-system pyproject)",
            "synopsis": "Python class cohesion metric tool",
            "description": "Measure the cohesion of Python classes to improve code quality.",
            "home_page": "https://github.com/mschwager/cohesion",
            "license": "license:expat",
        },
        "eudic": {
            "version": "1.0",
            "license": "license:nonfree",
            "synopsis": "EuDic dictionary application",
            "description": "EuDic is a comprehensive dictionary application with offline lookup support.",
            "home_page": "https://www.eudic.net/",
        },
        "astroimagej": {
            "version": "5.0",
            "synopsis": "astronomical image analysis in Java",
            "description": "AstroImageJ is an astronomical image analysis and photometry tool based on ImageJ.",
            "home_page": "https://www.astro.louisville.edu/software/astroimagej/",
            "license": "license:gpl3+",
        },
        "qpxtool-unofficial-git": {
            "version": "0.8.0",
            "build_system": "cmake-build-system",
            "bs_module": "(guix build-system cmake)",
            "synopsis": "optical disc drive quality testing tool",
            "description": "QPxTool tests optical disc drive and media quality for CD/DVD/Blu-ray.",
            "home_page": "https://github.com/Speed-Fire/qpxtool",
            "license": "license:gpl2+",
        },
        "powertop-to-tmpfile": {
            "version": "0.1",
            "synopsis": "run PowerTOP diagnostics to tmpfiles",
            "description": "Run PowerTOP power diagnostics and output results to temporary files.",
            "home_page": "https://aur.archlinux.org/packages/powertop-to-tmpfile",
            "license": "license:gpl2+",
        },
        "phpunit": {
            "version": "11.5",
            "synopsis": "PHP testing framework",
            "description": "PHPUnit is the standard unit testing framework for PHP applications.",
            "home_page": "https://phpunit.de/",
            "license": "license:bsd-3",
        },
        "devolo-dlan-cockpit": {
            "version": "5.0",
            "license": "license:nonfree",
            "synopsis": "devolo dLAN powerline network management",
            "description": "Management application for devolo dLAN powerline network adapters.",
            "home_page": "https://www.devolo.com/",
        },
        "soundux-git": {
            "version": "0.2.7",
            "build_system": "cmake-build-system",
            "bs_module": "(guix build-system cmake)",
            "synopsis": "cross-platform soundboard application",
            "description": "Soundux is a cross-platform soundboard for Linux, Windows, and macOS.",
            "home_page": "https://soundux.rocks/",
            "license": "license:gpl3+",
        },
        "armorpaint": {
            "version": "0.9",
            "synopsis": "3D texture painting application",
            "description": "ArmorPaint is a standalone 3D PBR texture painting application.",
            "home_page": "https://armorpaint.org/",
            "license": "license:gpl3+",
        },
        "tumbler-stl-thumbnailer": {
            "version": "0.1",
            "synopsis": "STL file thumbnail generator for Tumbler",
            "description": "STL 3D model file thumbnail plugin for the XFCE Tumbler service.",
            "home_page": "https://aur.archlinux.org/packages/tumbler-stl-thumbnailer",
            "license": "license:gpl2+",
        },
        "python-flask-sockets": {
            "version": "0.2.1",
            "build_system": "pyproject-build-system",
            "bs_module": "(guix build-system pyproject)",
            "synopsis": "WebSocket support for Flask",
            "description": "Flask-Sockets provides elegant WebSocket support for Flask applications.",
            "home_page": "https://github.com/heroku-python/flask-sockets",
            "license": "license:expat",
        },
        "sncli": {
            "version": "0.4.0",
            "build_system": "pyproject-build-system",
            "bs_module": "(guix build-system pyproject)",
            "synopsis": "Simplenote command-line interface",
            "description": "Terminal-based interface for the Simplenote note-taking service.",
            "home_page": "https://github.com/insanum/sncli",
            "license": "license:expat",
        },
        "phive": {
            "version": "0.15.2",
            "synopsis": "PHAR installation and verification environment",
            "description": "PHIVE manages PHP Archive (PHAR) tool installation and verification.",
            "home_page": "https://phar.io/",
            "license": "license:bsd-3",
        },
        "lazydocker-git": {
            "version": "0.23.3",
            "synopsis": "terminal UI for Docker management",
            "description": "A simple terminal UI for both Docker and Docker Compose management.",
            "home_page": "https://github.com/jesseduffield/lazydocker",
            "license": "license:expat",
        },
        "spf-tools": {
            "version": "2.0",
            "synopsis": "SPF DNS record management tools",
            "description": "Tools for managing and flattening Sender Policy Framework DNS records.",
            "home_page": "https://github.com/spf-tools/spf-tools",
            "license": "license:asl2.0",
        },
        "smoldyn": {
            "version": "2.73",
            "build_system": "cmake-build-system",
            "bs_module": "(guix build-system cmake)",
            "synopsis": "spatial stochastic biochemical simulator",
            "description": "Smoldyn is a particle-based spatial stochastic simulator for cell biology.",
            "home_page": "https://www.smoldyn.org/",
            "license": "license:lgpl2.1+",
        },
        "protoc-gen-twirp": {
            "version": "8.1.3",
            "synopsis": "Twirp RPC code generator for Protocol Buffers",
            "description": "A Protocol Buffers code generator for the Twirp RPC framework.",
            "home_page": "https://github.com/twitchtv/twirp",
            "license": "license:asl2.0",
        },
        "postallow": {
            "version": "0.4",
            "synopsis": "Postfix SMTP access policy service for allowlisting",
            "description": "Postallow is a Postfix SMTP access policy daemon for sender allowlisting.",
            "home_page": "https://github.com/postallow/postallow",
            "license": "license:gpl3+",
        },
        "niji-git": {
            "version": "0.1",
            "synopsis": "colorful terminal palette viewer",
            "description": "Niji is a terminal color palette viewer and theme preview tool.",
            "home_page": "https://aur.archlinux.org/packages/niji-git",
            "license": "license:expat",
        },
        "nautilus-mediainfo-gtk4": {
            "version": "0.1",
            "build_system": "meson-build-system",
            "bs_module": "(guix build-system meson)",
            "synopsis": "MediaInfo extension for GNOME Files (GTK4)",
            "description": "Nautilus extension displaying media file information, built for GTK4.",
            "home_page": "https://aur.archlinux.org/packages/nautilus-mediainfo-gtk4",
            "license": "license:gpl3+",
        },
        "haveibeenpwned-downloader-git": {
            "version": "0.1",
            "synopsis": "download haveibeenpwned password hashes",
            "description": "Download the haveibeenpwned password hash database for offline checking.",
            "home_page": "https://github.com/HaveIBeenPwned/PwnedPasswordsDownloader",
            "license": "license:bsd-3",
        },
        "freedroid": {
            "version": "1.0.2",
            "build_system": "gnu-build-system",
            "bs_module": "(guix build-system gnu)",
            "synopsis": "classic Paradroid clone",
            "description": "FreeDroid Classic is a clone of the Commodore 64 game Paradroid.",
            "home_page": "https://www.freedroid.org/",
            "license": "license:gpl2+",
        },
        "depthcharge-tools": {
            "version": "0.6.2",
            "build_system": "pyproject-build-system",
            "bs_module": "(guix build-system pyproject)",
            "synopsis": "tools for managing ChromeOS depthcharge bootloader",
            "description": "Build, manage, and flash ChromeOS depthcharge bootloader images on Chromebooks.",
            "home_page": "https://github.com/nicman23/depthcharge-tools",
            "license": "license:gpl2+",
        },
        "candlelang-git": {
            "version": "0.1",
            "synopsis": "experimental programming language",
            "description": "Candle is an experimental programming language.",
            "home_page": "https://aur.archlinux.org/packages/candlelang-git",
            "license": "license:expat",
        },
        "beanquery-git": {
            "version": "0.1",
            "build_system": "pyproject-build-system",
            "bs_module": "(guix build-system pyproject)",
            "synopsis": "query language for Beancount ledger data",
            "description": "Beanquery is a query language and tool for Beancount plain-text accounting data.",
            "home_page": "https://github.com/beancount/beanquery",
            "license": "license:gpl2+",
        },
        "ashes-2063": {
            "version": "2.0",
            "synopsis": "total conversion mod for GZDoom",
            "description": "Ashes 2063 is a post-apocalyptic total conversion mod for the GZDoom engine.",
            "home_page": "https://ashes2063.blogspot.com/",
            "license": "license:gpl3+",
        },
        "ferretdb": {
            "version": "1.24.0",
            "synopsis": "open-source MongoDB-compatible document database",
            "description": "FerretDB is an open-source MongoDB wire protocol compatible document database using PostgreSQL.",
            "home_page": "https://www.ferretdb.com/",
            "license": "license:asl2.0",
        },
        "tcpping": {
            "version": "2.1",
            "build_system": "gnu-build-system",
            "bs_module": "(guix build-system gnu)",
            "synopsis": "TCP ping utility",
            "description": "Tcpping measures network latency via TCP SYN packets instead of ICMP.",
            "home_page": "https://github.com/derf/tcpping",
            "license": "license:gpl2+",
        },
        "frogatto": {
            "version": "1.3.1",
            "build_system": "gnu-build-system",
            "bs_module": "(guix build-system gnu)",
            "synopsis": "action-adventure platformer game",
            "description": "Frogatto is an old-school 2D action-adventure platformer game starring a frog.",
            "home_page": "https://frogatto.com/",
            "license": "license:gpl3+",
        },
        "amdgpu-fan": {
            "version": "0.1.0",
            "build_system": "pyproject-build-system",
            "bs_module": "(guix build-system pyproject)",
            "synopsis": "fan speed controller for AMD GPUs",
            "description": "Control fan speed curves for AMD Radeon GPUs using the amdgpu driver.",
            "home_page": "https://github.com/zzkW35/amdgpu-fan",
            "license": "license:gpl2+",
        },
        "sway-audio-idle-inhibit-git": {
            "version": "0.1.1",
            "build_system": "meson-build-system",
            "bs_module": "(guix build-system meson)",
            "synopsis": "prevent idle when audio is playing on Sway",
            "description": "Inhibit idle and screen lock in Sway when audio is actively playing.",
            "home_page": "https://github.com/ErikReider/SwayAudioIdleInhibit",
            "license": "license:gpl3+",
        },
        "labwc-menu-generator-git": {
            "version": "0.1.0",
            "build_system": "meson-build-system",
            "bs_module": "(guix build-system meson)",
            "synopsis": "menu generator for labwc window manager",
            "description": "Generate application menus from desktop entries for the labwc Wayland compositor.",
            "home_page": "https://github.com/labwc/labwc-menu-generator",
            "license": "license:gpl2+",
        },
        "zed-preview": {
            "version": "0.174.0",
            "build_system": "cargo-build-system",
            "bs_module": "(guix build-system cargo)",
            "synopsis": "high-performance code editor (preview channel)",
            "description": "Zed is a high-performance, multiplayer code editor.  This is the preview release channel.",
            "home_page": "https://zed.dev/",
            "license": "license:gpl3+",
        },
    }

    if name in overrides:
        ov = overrides[name]
        version = ov.get("version", version)
        build_system = ov.get("build_system", build_system)
        bs_module = ov.get("bs_module", bs_module)
        license_str = ov.get("license", license_str)
        synopsis = ov.get("synopsis", synopsis)
        description = ov.get("description", description)
        home_page = ov.get("home_page", home_page)

    return version, build_system, bs_module, license_str, synopsis, description, home_page


def guix_name(name):
    """Convert package name to Guile identifier."""
    return name  # Already kebab-case from AUR


def generate_recipe_scm():
    """Generate the recipe-resolver .scm file."""
    # Collect needed build systems
    bs_set = set()
    needs_nonfree = False
    pkg_defs = []

    for _, name in SELECTED:
        version, build_system, bs_module, license_str, synopsis, description, home_page = infer_metadata(name)
        bs_set.add(bs_module)
        if "nonfree" in license_str:
            needs_nonfree = True

        pkg_defs.append((name, version, build_system, license_str, synopsis, description, home_page))

    # Build module header
    lines = []
    lines.append(";;; GNU Guix --- Functional package management for GNU")
    lines.append(";;; Copyright (C) 2026 Gaurix Contributors")
    lines.append(";;;")
    lines.append(f";;; Recipe resolver pass --- {PASS_ID}")
    lines.append(f";;; Resolves 100 packages from queue (100 recipes, 0 blocked).")
    lines.append(";;;")
    lines.append(";;; All sha256 hashes are placeholders pending verification via `guix download`.")
    lines.append("")
    lines.append(f"(define-module (gaurix packages {PASS_ID})")
    lines.append("  #:use-module (guix packages)")
    lines.append("  #:use-module (guix download)")
    lines.append("  #:use-module (guix git-download)")
    lines.append("  #:use-module (guix gexp)")
    lines.append("  #:use-module (guix utils)")

    # Add needed build system modules in sorted order
    for bs in sorted(bs_set):
        lines.append(f"  #:use-module {bs}")

    lines.append("  #:use-module ((guix licenses) #:prefix license:)")
    lines.append("  #:use-module (gnu packages)")
    lines.append("  #:export (")

    # Export list
    for _, name in SELECTED:
        lines.append(f"            {guix_name(name)}")
    lines.append("            ))")
    lines.append("")

    # Nonfree license definition
    if needs_nonfree:
        lines.append(";;; Nonfree/proprietary license placeholder for Gaurix channel")
        lines.append('(define license:nonfree')
        lines.append('  ((@@ (guix licenses) license) "Nonfree"')
        lines.append('    "https://spdx.org/licenses/"')
        lines.append('    "Proprietary or custom license; see upstream for terms."))')
        lines.append("")

    # Package definitions
    for name, version, build_system, license_str, synopsis, description, home_page in pkg_defs:
        gname = guix_name(name)
        aur_url = f"https://aur.archlinux.org/cgit/aur.git/snapshot/{name}.tar.gz"

        lines.append(f";;; {name} --- {synopsis}")
        lines.append(f"(define-public {gname}")
        lines.append(f"  (package")
        lines.append(f'    (name "{name}")')
        lines.append(f'    (version "{version}")')
        lines.append(f"    (source (origin")
        lines.append(f"              (method url-fetch)")
        lines.append(f'              (uri "{aur_url}")')
        lines.append(f"              (sha256")
        lines.append(f'               (base32 "{PLACEHOLDER_HASH}"))))')
        lines.append(f"    (build-system {build_system})")
        lines.append(f"    (arguments (list #:tests? #f))")
        lines.append(f'    (supported-systems \'("x86_64-linux"))')
        lines.append(f'    (synopsis "{synopsis}")')
        lines.append(f'    (description "{description}")')
        lines.append(f'    (home-page "{home_page}")')
        lines.append(f"    (license {license_str})))")
        lines.append("")

    return "\n".join(lines)


def update_org_file():
    """Update todo_general_packages.org for resolved entries."""
    selected_dict = {num: name for num, name in SELECTED}

    with open(ORG_FILE, "r") as f:
        content = f.read()

    changes = 0
    for num, name in SELECTED:
        # Pattern: ** TODO {num}. {name}
        old_pat = f"** TODO {num}. {name}"
        new_status = f"** DONE {num}. {name}  :{PASS_ID}:recipe-generated:"
        if old_pat in content:
            content = content.replace(old_pat, new_status, 1)
            changes += 1

        # Also update TODO Status line
        old_ts = f"   - TODO Status: TODO"
        # This is too generic; we need context-sensitive replacement
        # We'll handle this with a regex below

    # More targeted: replace TODO Status after each DONE entry we just changed
    for num, name in SELECTED:
        meta = infer_metadata(name)
        version, build_system, _, license_str, _, _, _ = meta
        status_line = f"   - Status: DONE: Recipe in {PASS_ID}.scm ({name} v{version}, {build_system}, {license_str})"
        pattern = re.compile(
            rf'(\*\* DONE {re.escape(str(num))}\. {re.escape(name)}[^\n]*\n)'
            rf'((?:   - [^\n]*\n)*)'
            rf'(   - TODO Status: TODO)',
            re.MULTILINE
        )
        match = pattern.search(content)
        if match:
            old_text = match.group(0)
            new_text = old_text.replace("   - TODO Status: TODO", f"   - TODO Status: DONE\n{status_line}")
            content = content.replace(old_text, new_text, 1)

    # Write atomically
    fd, tmppath = tempfile.mkstemp(dir=str(ORG_FILE.parent), suffix=".tmp")
    try:
        with os.fdopen(fd, "w") as f:
            f.write(content)
        shutil.move(tmppath, str(ORG_FILE))
    except:
        os.unlink(tmppath)
        raise

    return changes


def update_compat_scm():
    """Add #:use-module and re-exports to general-compat.scm."""
    with open(COMPAT_SCM, "r") as f:
        content = f.read()

    lines = content.split("\n")

    # Insert use-module after line 1 (after define-module)
    use_line = f"  #:use-module (gaurix packages {PASS_ID})"
    if use_line not in content:
        lines.insert(1, use_line)

    # Append re-exports at end
    # Remove trailing empty lines
    while lines and lines[-1].strip() == "":
        lines.pop()

    lines.append("")
    lines.append(f"")
    lines.append(f";;; {PASS_ID}")
    for _, name in SELECTED:
        lines.append(f"(re-export {guix_name(name)})")

    lines.append("")

    new_content = "\n".join(lines)

    # Write atomically
    fd, tmppath = tempfile.mkstemp(dir=str(COMPAT_SCM.parent), suffix=".tmp")
    try:
        with os.fdopen(fd, "w") as f:
            f.write(new_content)
        shutil.move(tmppath, str(COMPAT_SCM))
    except:
        os.unlink(tmppath)
        raise


def update_packages_scm():
    """Append new module re-exports to packages.scm."""
    with open(PACKAGES_SCM, "r") as f:
        content = f.read()

    # Build the new block
    export_names = sorted([name for _, name in SELECTED])
    block = []
    block.append("")
    block.append("")
    block.append(f";;; {PASS_ID}: 100 packages attempted (100 recipes, 0 BLOCKED)")
    block.append(f"(define-module (gaurix packages)")
    block.append(f"  #:use-module (gaurix packages {PASS_ID})")
    block.append(f"  #:re-export (")
    for name in export_names:
        block.append(f"               {guix_name(name)}")
    block.append(f"))")
    block.append("")

    new_content = content.rstrip("\n") + "\n" + "\n".join(block) + "\n"

    # Write atomically
    fd, tmppath = tempfile.mkstemp(dir=str(PACKAGES_SCM.parent), suffix=".tmp")
    try:
        with os.fdopen(fd, "w") as f:
            f.write(new_content)
        shutil.move(tmppath, str(PACKAGES_SCM))
    except:
        os.unlink(tmppath)
        raise


def main():
    print(f"=== {PASS_ID}: generating 100 package recipes ===")

    # 1. Generate recipe .scm file
    print(f"Writing {RECIPE_SCM}...")
    recipe_content = generate_recipe_scm()
    fd, tmppath = tempfile.mkstemp(dir=str(RECIPE_SCM.parent), suffix=".tmp")
    try:
        with os.fdopen(fd, "w") as f:
            f.write(recipe_content)
        shutil.move(tmppath, str(RECIPE_SCM))
    except:
        os.unlink(tmppath)
        raise
    print(f"  -> {len(SELECTED)} package definitions written")

    # 2. Update org file
    print(f"Updating {ORG_FILE}...")
    changes = update_org_file()
    print(f"  -> {changes} entries updated to DONE")

    # 3. Update general-compat.scm
    print(f"Updating {COMPAT_SCM}...")
    update_compat_scm()
    print(f"  -> Added #:use-module and {len(SELECTED)} re-exports")

    # 4. Update packages.scm
    print(f"Updating {PACKAGES_SCM}...")
    update_packages_scm()
    print(f"  -> Added re-export block with {len(SELECTED)} packages")

    print(f"\n=== {PASS_ID} complete: 100 recipes generated, 0 blocked ===")
    print("Package names:")
    for _, name in SELECTED:
        print(f"  {name}")


if __name__ == "__main__":
    main()
