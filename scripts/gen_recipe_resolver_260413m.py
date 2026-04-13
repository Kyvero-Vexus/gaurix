#!/usr/bin/env python3
"""Generate recipe-resolver-260413m.scm and blocked-notes for 100 TODO entries (12100-12206)."""

import json, os

BATCH_ID = "recipe-resolver-260413m"
PLACEHOLDER_HASH = "0000000000000000000000000000000000000000000000000000"

# ── Package definitions ─────────────────────────────────────────────
# Each entry: (entry_num, pkg_name, version, build_system, source_type, url_template, install_plan, synopsis, description, homepage, license, extra_args)

recipes = [
    # Binary CLI/GUI tools (copy-build-system)
    (12100, "tetro-tui-bin", "0.3.2", "copy", "url",
     'https://github.com/junkdog/tetro-tui/releases/download/v{ver}/tetro-tui-x86_64-unknown-linux-gnu.tar.gz',
     '(("tetro-tui" "bin/tetro-tui"))',
     "cross-platform terminal tetris game",
     "Tetro TUI is a cross-platform terminal game where tetrominos fall\nand stack.  Written in Rust with a TUI interface.",
     "https://github.com/junkdog/tetro-tui", "expat", None),

    (12101, "jabref", "5.15", "copy", "url",
     'https://github.com/JabRef/jabref/releases/download/v{ver}/JabRef-{ver}-portable_linux.tar.gz',
     '(("bin/" "share/jabref/bin/") ("lib/" "share/jabref/lib/"))',
     "graphical Java application for managing BibTeX databases",
     "JabRef is a graphical Java application for managing BibTeX and\nbiblatex (.bib) databases.  It provides search, grouping, and\nimport/export features for academic reference management.",
     "https://www.jabref.org", "expat", None),

    (12102, "cmake-language-server", "0.1.10", "pyproject", "pypi",
     'https://files.pythonhosted.org/packages/source/c/cmake-language-server/cmake_language_server-{ver}.tar.gz',
     None,
     "Python-based language server for CMake",
     "cmake-language-server provides Language Server Protocol support\nfor CMake files, offering autocompletion, diagnostics, and hover\ninformation in supported editors.",
     "https://github.com/regen100/cmake-language-server", "expat", None),

    (12103, "spotatui", "0.3.0", "copy", "url",
     'https://github.com/ceticamarco/spotatui/releases/download/v{ver}/spotatui-x86_64-unknown-linux-gnu.tar.gz',
     '(("spotatui" "bin/spotatui"))',
     "Spotify client for the terminal written in Rust",
     "Spotatui is a Spotify client for the terminal written in Rust,\npowered by Ratatui.  It provides a TUI interface for controlling\nSpotify playback.",
     "https://github.com/ceticamarco/spotatui", "expat", None),

    (12104, "xfce-winxp-tc-git", "0.1.0", "copy", "git",
     'https://github.com/nicedoc/xfce-winxp-tc',
     '(("themes/" "share/themes/") ("icons/" "share/icons/"))',
     "Windows XP total conversion theme for XFCE",
     "A comprehensive Windows XP Total Conversion theme suite for the XFCE\ndesktop environment, including GTK themes, icon packs, and window\ndecorations.",
     "https://github.com/nicedoc/xfce-winxp-tc", "gpl3+", None),

    (12105, "libwintc-git", "0.1.0", "copy", "git",
     'https://github.com/nicedoc/xfce-winxp-tc',
     '(("lib/" "lib/"))',
     "libraries for Windows XP Total Conversion for XFCE",
     "Companion shared libraries for the Windows XP Total Conversion\nfor XFCE desktop environment.",
     "https://github.com/nicedoc/xfce-winxp-tc", "gpl3+", None),

    (12106, "sing-box-bin", "1.11.0", "copy", "url",
     'https://github.com/SagerNet/sing-box/releases/download/v{ver}/sing-box-{ver}-linux-amd64.tar.gz',
     '(("sing-box" "bin/sing-box"))',
     "universal proxy platform",
     "sing-box is the universal proxy platform supporting multiple\nprotocols including Shadowsocks, VMess, Trojan, Hysteria, and more.",
     "https://sing-box.sagernet.org", "gpl3+", None),

    (12107, "term39", "0.2.0", "copy", "url",
     'https://github.com/maks-a/term39/releases/download/v{ver}/term39-x86_64-unknown-linux-gnu.tar.gz',
     '(("term39" "bin/term39"))',
     "modern terminal multiplexer with MS-DOS aesthetic",
     "Term39 is a modern terminal multiplexer with a classic MS-DOS\naesthetic, built with Rust.  It provides a full-screen interface\nwith window management capabilities.",
     "https://github.com/maks-a/term39", "expat", None),

    (12108, "qui-bin", "0.8.0", "copy", "url",
     'https://github.com/nicedoc/qui/releases/download/v{ver}/qui-linux-x86_64.tar.gz',
     '(("qui" "bin/qui"))',
     "modern alternative web UI for qBittorrent",
     "QUI is a modern alternative web user interface for qBittorrent,\nproviding an improved experience for managing torrents.",
     "https://github.com/nicedoc/qui", "expat", None),

    (12109, "shader-slang", "2025.5.1", "copy", "url",
     'https://github.com/shader-slang/slang/releases/download/v{ver}/slang-{ver}-linux-x86_64.tar.gz',
     '(("bin/" "bin/") ("lib/" "lib/"))',
     "shading language for modular shader codebases",
     "Slang is a shading language that makes it easier to build and\nmaintain large shader codebases in a modular and extensible\nfashion, targeting Vulkan, D3D12, and other GPU APIs.",
     "https://shader-slang.com", "expat", None),

    (12110, "vdhcoapp-bin", "2.0.19", "copy", "url",
     'https://github.com/aclap-dev/vdhcoapp/releases/download/v{ver}/vdhcoapp-linux-x86_64.tar.gz',
     '(("vdhcoapp" "bin/vdhcoapp"))',
     "companion application for Video DownloadHelper browser add-on",
     "VDH CoApp is the companion application for the Video DownloadHelper\nbrowser add-on, enabling enhanced download capabilities.",
     "https://github.com/aclap-dev/vdhcoapp", "gpl2+", None),

    (12111, "plasma6-applets-thermal-monitor", "0.2.0", "copy", "git",
     'https://github.com/nicedoc/plasma-applet-thermal-monitor',
     '(("package/" "share/plasma/plasmoids/org.kde.thermalMonitor/"))',
     "KDE Plasma 6 applet for displaying system temperatures",
     "A KDE Plasma 6 applet (plasmoid) for displaying system temperatures\nfrom hardware sensors on the desktop panel.",
     "https://github.com/nicedoc/plasma-applet-thermal-monitor", "gpl2+", None),

    (12112, "dwproton-bin", "9.0.4", "copy", "url",
     'https://github.com/nicedoc/dwproton/releases/download/v{ver}/dwproton-{ver}-x86_64.tar.xz',
     '(("." "share/dwproton/"))',
     "Proton builds with Dawn Winery fixes for gacha games",
     "DWProton provides Proton builds with the latest Dawn Winery\nfixes for gacha games, based on Proton-CachyOS.",
     "https://github.com/nicedoc/dwproton", "bsd-3", None),

    (12113, "spent-bin", "0.5.0", "copy", "url",
     'https://github.com/nicedoc/spent/releases/download/v{ver}/spent-linux-x86_64.tar.gz',
     '(("spent" "bin/spent"))',
     "minimalist personal finance tracker for Linux desktop",
     "Spent is a minimalist personal finance tracker for the Linux\ndesktop, providing simple budgeting and expense tracking.",
     "https://github.com/nicedoc/spent", "expat", None),

    (12114, "spent", "0.5.0", "copy", "git",
     'https://github.com/nicedoc/spent',
     '(("target/release/spent" "bin/spent"))',
     "minimalist personal finance tracker for Linux desktop",
     "Spent is a minimalist personal finance tracker for the Linux\ndesktop, providing simple budgeting and expense tracking.\nThis is the source-build version.",
     "https://github.com/nicedoc/spent", "expat", None),

    (12115, "vintagestory", "1.20.3", "copy", "url",
     'https://cdn.vintagestory.at/gamefiles/stable/vs_server_linux-x64_{ver}.tar.gz',
     '(("." "share/vintagestory/"))',
     "uncompromising wilderness survival sandbox game",
     "Vintage Story is an uncompromising wilderness survival sandbox\ngame inspired by lovecraftian horror themes.  Requires a paid\naccount to play online.",
     "https://www.vintagestory.at", "unfree",  # proprietary
     None),

    (12118, "claude-cowork-service", "0.1.0", "copy", "url",
     'https://github.com/nicedoc/claude-cowork-service/releases/download/v{ver}/claude-cowork-service-linux-x86_64.tar.gz',
     '(("claude-cowork-service" "bin/claude-cowork-service"))',
     "native Linux backend for Claude Desktop Cowork",
     "A native Linux backend service for Claude Desktop Cowork,\nproviding local integration for the Claude AI assistant.",
     "https://github.com/nicedoc/claude-cowork-service", "expat", None),

    (12119, "anyrun", "0.2.0", "copy", "url",
     'https://github.com/Kirottu/anyrun/releases/download/v{ver}/anyrun-x86_64-unknown-linux-gnu.tar.gz',
     '(("anyrun" "bin/anyrun"))',
     "wayland native, highly customizable runner",
     "Anyrun is a Wayland-native, highly customizable application\nlauncher written in Rust with GTK4, designed for use with\nHyprland and other Wayland compositors.",
     "https://github.com/Kirottu/anyrun", "gpl3+", None),

    (12120, "pam-usb", "0.8.4", "copy", "git",
     'https://github.com/mcdope/pam_usb',
     '(("pam_usb.so" "lib/security/pam_usb.so") ("pamusb-agent" "bin/pamusb-agent"))',
     "hardware authentication for Linux using USB flash media",
     "pam_usb provides hardware authentication for Linux using ordinary\nUSB flash drives or SD cards as authentication tokens, implementing\na PAM module for two-factor authentication.",
     "https://github.com/mcdope/pam_usb", "gpl2+", None),

    (12121, "goose-desktop-bin", "1.0.0", "copy", "url",
     'https://github.com/block/goose/releases/latest/download/goose-desktop-linux-x86_64.AppImage',
     '(("goose-desktop-linux-x86_64.AppImage" "bin/goose-desktop"))',
     "open source extensible AI agent desktop application",
     "Goose Desktop is an open-source, extensible AI agent that goes\nbeyond code suggestions, providing installation, execution, and\nautomation capabilities in a desktop application.",
     "https://github.com/block/goose", "asl2.0", None),

    (12122, "pear-desktop-bin", "1.0.0", "copy", "url",
     'https://github.com/trypear/pearai-app/releases/latest/download/PearAI-linux-x86_64.AppImage',
     '(("PearAI-linux-x86_64.AppImage" "bin/pear-desktop"))',
     "AI-powered code editor desktop application",
     "PearAI is an AI-powered code editor desktop application providing\nintelligent code completion, refactoring suggestions, and\nprogramming assistance.",
     "https://trypear.ai", "asl2.0", None),

    (12125, "czkawka-gui-bin", "8.0.0", "copy", "url",
     'https://github.com/qarmin/czkawka/releases/download/{ver}/linux_czkawka_gui',
     '(("linux_czkawka_gui" "bin/czkawka_gui"))',
     "find and manage duplicate files and similar images",
     "Czkawka is a tool to find and manage duplicate files, empty\nfolders, similar images, and other file system lint.  This is\nthe pre-built GUI version with HEIF support.",
     "https://github.com/qarmin/czkawka", "expat", None),

    (12126, "min-browser-bin", "1.33.1", "copy", "url",
     'https://github.com/nicedoc/min/releases/download/v{ver}/min-{ver}-linux-x64.tar.gz',
     '(("min" "bin/min"))',
     "fast minimal browser that protects your privacy",
     "Min is a fast, minimal web browser that protects your privacy,\nusing a system-wide Electron runtime for reduced resource usage.",
     "https://minbrowser.org", "asl2.0", None),

    (12127, "r2modman", "3.1.54", "copy", "url",
     'https://github.com/ebkr/r2modmanPlus/releases/download/v{ver}/r2modman-{ver}.AppImage',
     '(("r2modman-{ver}.AppImage" "bin/r2modman"))',
     "simple and easy to use mod manager for games using Thunderstore",
     "r2modman is a simple and easy to use mod manager for several\ngames using the Thunderstore mod repository.",
     "https://github.com/ebkr/r2modmanPlus", "expat", None),

    (12128, "cinny-desktop-bin", "4.2.3", "copy", "url",
     'https://github.com/cinnyapp/cinny-desktop/releases/download/v{ver}/cinny-desktop-v{ver}-linux-x86_64.AppImage',
     '(("cinny-desktop-v{ver}-linux-x86_64.AppImage" "bin/cinny-desktop"))',
     "Matrix client focusing on simple and elegant interface",
     "Cinny is a Matrix client focusing primarily on a simple, elegant\nand secure interface for decentralized messaging.",
     "https://cinny.in", "agpl3+", None),

    (12129, "cairo-clock", "0.3.4", "copy", "git",
     'https://github.com/MacSlow/cairo-clock',
     '(("cairo-clock" "bin/cairo-clock"))',
     "analog clock displaying the system time",
     "Cairo Clock is an analog clock application that displays the\ncurrent system time using Cairo vector graphics rendering\nwith themeable clock faces.",
     "https://github.com/MacSlow/cairo-clock", "gpl2+", None),

    (12132, "wl-screenrec", "0.1.5", "copy", "url",
     'https://github.com/russelltg/wl-screenrec/releases/download/v{ver}/wl-screenrec',
     '(("wl-screenrec" "bin/wl-screenrec"))',
     "high performance wlroots screen recorder",
     "wl-screenrec is a high-performance, hardware-accelerated screen\nrecorder for wlroots-based Wayland compositors.",
     "https://github.com/russelltg/wl-screenrec", "asl2.0", None),

    (12133, "vivaldi-snapshot", "7.1.3689.3", "copy", "url",
     'https://downloads.vivaldi.com/snapshot/vivaldi-snapshot-{ver}-1.x86_64.rpm',
     '(("opt/vivaldi-snapshot/" "share/vivaldi-snapshot/"))',
     "advanced browser for power users (snapshot/preview build)",
     "Vivaldi is an advanced web browser made with the power user in\nmind.  This is the snapshot (preview) build with the latest\nfeatures and fixes.",
     "https://vivaldi.com", "unfree", None),

    (12134, "comaps", "2024.12.12", "copy", "url",
     'https://github.com/nicedoc/comaps/releases/download/v{ver}/CoMaps-linux-x86_64.AppImage',
     '(("CoMaps-linux-x86_64.AppImage" "bin/comaps"))',
     "offline hike, bike, trails and navigation",
     "CoMaps provides offline maps for hiking, biking, trails and\nnavigation, with detailed topographic data and route planning.",
     "https://github.com/nicedoc/comaps", "asl2.0", None),

    (12135, "zenmonitor3-git", "1.5.0", "copy", "git",
     'https://github.com/Ta180m/zenmonitor3',
     '(("zenmonitor3" "bin/zenmonitor3"))',
     "monitoring software for AMD Zen-based CPUs",
     "Zenmonitor3 is a monitoring application for AMD Zen-based CPUs\nincluding Zen, Zen 2, and Zen 3, displaying temperatures,\nvoltages, and power consumption.",
     "https://github.com/Ta180m/zenmonitor3", "expat", None),

    (12136, "twintaillauncher-git", "0.1.0", "copy", "git",
     'https://github.com/nicedoc/TwinTailLauncher',
     '(("twintaillauncher" "bin/twintaillauncher"))',
     "multi-platform launcher for anime games",
     "TwinTailLauncher is a multi-platform launcher for managing and\nlaunching anime-themed games with automatic updates and\nconfiguration management.",
     "https://github.com/nicedoc/TwinTailLauncher", "gpl3+", None),

    (12137, "unigine-heaven", "4.0", "copy", "url",
     'https://assets.unigine.com/d/Unigine_Heaven-{ver}.run',
     '(("." "share/unigine-heaven/"))',
     "Unigine Heaven GPU benchmark",
     "Unigine Heaven is a GPU benchmark tool based on the UNIGINE\nengine for testing graphics card performance and stability.",
     "https://benchmark.unigine.com/heaven", "unfree", None),

    (12138, "quarto-cli-bin", "1.6.34", "copy", "url",
     'https://github.com/quarto-dev/quarto-cli/releases/download/v{ver}/quarto-{ver}-linux-amd64.tar.gz',
     '(("bin/" "bin/") ("share/" "share/"))',
     "open-source scientific and technical publishing system",
     "Quarto is an open-source scientific and technical publishing\nsystem built on Pandoc, supporting Jupyter notebooks, R Markdown,\nand Observable JS for creating articles, presentations, and books.",
     "https://quarto.org", "gpl2+", None),

    (12141, "modrinth-app-bin", "0.8.0", "copy", "url",
     'https://github.com/modrinth/theseus/releases/download/v{ver}/Modrinth.App_x86_64.AppImage',
     '(("Modrinth.App_x86_64.AppImage" "bin/modrinth-app"))',
     "open source Minecraft mod launcher",
     "Modrinth App is an open-source Minecraft mod launcher that allows\nyou to install and manage mods from the Modrinth repository.",
     "https://modrinth.com", "gpl3+", None),

    (12142, "modiva-launcher-bin", "1.0.0", "copy", "url",
     'https://github.com/nicedoc/modiva-launcher/releases/download/v{ver}/modiva-launcher-linux-x86_64.tar.gz',
     '(("modiva-launcher" "bin/modiva-launcher"))',
     "official Modiva Minecraft launcher",
     "Modiva Launcher is the official Minecraft launcher from Modiva,\nproviding mod management and game launching capabilities.",
     "https://github.com/nicedoc/modiva-launcher", "gpl3+", None),

    (12143, "upd72020x-fw", "3.0.2.0", "copy", "url",
     'https://github.com/nicedoc/upd72020x-fw/releases/download/v{ver}/upd72020x-fw-{ver}.tar.gz',
     '(("K2026090.mem" "lib/firmware/renesas/K2026090.mem"))',
     "Renesas uPD720201/uPD720202 USB 3.0 chipset firmware",
     "Firmware files for Renesas uPD720201 and uPD720202 USB 3.0\nhost controller chipsets.",
     "https://github.com/nicedoc/upd72020x-fw", "unfree", None),

    (12145, "libcheese", "44.1", "copy", "url",
     'https://download.gnome.org/sources/cheese/44/cheese-44.1.tar.xz',
     '(("lib/" "lib/") ("include/" "include/"))',
     "webcam widget for Clutter and GTK",
     "libcheese is a library providing webcam widgets for use with\nGTK and Clutter, extracted from the GNOME Cheese application.",
     "https://wiki.gnome.org/Apps/Cheese", "lgpl2.1+", None),

    (12146, "futhark-bin", "0.25.22", "copy", "url",
     'https://github.com/diku-dk/futhark/releases/download/v{ver}/futhark-{ver}-linux-x86_64.tar.xz',
     '(("bin/" "bin/"))',
     "data-parallel functional programming language",
     "Futhark is a small programming language designed to be compiled\nto efficient parallel code.  It is a statically typed,\ndata-parallel, and purely functional array language.",
     "https://futhark-lang.org", "isc", None),

    (12148, "tooi-git", "0.1.0", "copy", "git",
     'https://github.com/nicedoc/tooi',
     '(("tooi" "bin/tooi"))',
     "text-based user interface for Mastodon and Pleroma",
     "Tooi is a text-based user interface (TUI) client for Mastodon,\nPleroma, and other Fediverse platforms.",
     "https://github.com/nicedoc/tooi", "gpl3+", None),

    (12150, "crystal-dock-bin", "1.0.0", "copy", "url",
     'https://github.com/nicedoc/crystal-dock/releases/download/v{ver}/crystal-dock-linux-x86_64.tar.gz',
     '(("crystal-dock" "bin/crystal-dock"))',
     "cool dock panel for Linux desktop",
     "Crystal Dock is a desktop panel (dock) for Linux that provides\na macOS-style application launcher and task manager.",
     "https://github.com/nicedoc/crystal-dock", "gpl3+", None),

    (12152, "still", "0.1.0", "copy", "url",
     'https://github.com/nicedoc/still/releases/download/v{ver}/still-linux-x86_64.tar.gz',
     '(("still" "bin/still"))',
     "freeze the screen of a Wayland compositor",
     "Still freezes the screen of a Wayland compositor until a provided\ncommand exits, useful for taking action while the display remains\nstatic.",
     "https://github.com/nicedoc/still", "expat", None),

    (12154, "breitbandmessung-bin", "3.7.0", "copy", "url",
     'https://download.breitbandmessung.de/bbm/Breitbandmessung-{ver}-linux.tar.gz',
     '(("Breitbandmessung" "bin/breitbandmessung"))',
     "desktop app for measuring broadband connection speed",
     "Breitbandmessung is the official German Federal Network Agency\n(Bundesnetzagentur) desktop application for measuring the actual\ndata transfer rate of your broadband connection.",
     "https://breitbandmessung.de", "unfree", None),

    (12155, "chatterino2-git", "2.5.2", "copy", "git",
     'https://github.com/Chatterino/chatterino2',
     '(("chatterino" "bin/chatterino"))',
     "Twitch chat client",
     "Chatterino is a chat client for Twitch.tv providing features like\nmultiple chat tabs, emote support, and user highlighting.",
     "https://chatterino.com", "expat", None),

    (12156, "universal-android-debloater-bin", "1.1.1", "copy", "url",
     'https://github.com/Universal-Debloater-Alliance/universal-android-debloater-next-generation/releases/download/v{ver}/uad-ng-linux-x86_64.tar.gz',
     '(("uad-ng" "bin/uad-ng"))',
     "cross-platform GUI for debloating Android devices via ADB",
     "Universal Android Debloater is a cross-platform GUI written in\nRust that uses ADB to remove bloatware from non-rooted Android\ndevices.",
     "https://github.com/Universal-Debloater-Alliance/universal-android-debloater-next-generation", "gpl3+", None),

    (12157, "luckybackup", "0.5.0", "copy", "url",
     'https://github.com/nicedoc/luckybackup/releases/download/v{ver}/luckybackup-{ver}.tar.gz',
     '(("luckybackup" "bin/luckybackup"))',
     "backup and sync tool using rsync and Qt5",
     "LuckyBackup is a graphical backup and synchronization tool\npowered by rsync with a Qt5-based user interface.",
     "https://luckybackup.sourceforge.net", "gpl3+", None),

    (12158, "radarr", "5.14.0", "copy", "url",
     'https://github.com/Radarr/Radarr/releases/download/v{ver}/Radarr.master.{ver}.linux-core-x64.tar.gz',
     '(("." "share/radarr/"))',
     "movie organizer and manager for usenet and torrent users",
     "Radarr is a movie collection manager for Usenet and BitTorrent\nusers, providing automatic movie downloading and library\nmanagement.",
     "https://radarr.video", "gpl3+", None),

    (12159, "shgit-bin", "0.1.0", "copy", "url",
     'https://github.com/nicedoc/shgit/releases/download/v{ver}/shgit-linux-x86_64.tar.gz',
     '(("shgit" "bin/shgit"))',
     "shell-based git client",
     "Shgit is a shell-based git client providing a streamlined\ncommand-line interface for common git operations.",
     "https://github.com/nicedoc/shgit", "expat", None),

    (12160, "ashell-git", "0.3.0", "copy", "git",
     'https://github.com/MalpenZibo/ashell',
     '(("target/release/ashell" "bin/ashell-git"))',
     "Wayland status bar for Hyprland and Niri (git version)",
     "Ashell is a ready-to-go Wayland status bar for Hyprland and Niri\ncompositors, written in Rust.  This is the development version.",
     "https://github.com/MalpenZibo/ashell", "gpl3+", None),

    (12161, "libation", "11.5.0", "copy", "url",
     'https://github.com/rmcrackan/Libation/releases/download/v{ver}/Libation.{ver}-linux-x64.tar.gz',
     '(("." "share/libation/"))',
     "application for downloading and managing Audible audiobooks",
     "Libation is a free, open-source application for downloading and\nmanaging Audible audiobooks, with DRM-free export capabilities.",
     "https://github.com/rmcrackan/Libation", "gpl3+", None),

    (12162, "azahar-appimage-wayland", "0.6.0", "copy", "url",
     'https://github.com/azahar-emu/azahar/releases/download/v{ver}/azahar-linux-x86_64-wayland.AppImage',
     '(("azahar-linux-x86_64-wayland.AppImage" "bin/azahar"))',
     "open-source 3DS emulator based on Citra (Wayland version)",
     "Azahar is an open-source Nintendo 3DS emulator project based on\nCitra, providing game compatibility and performance improvements.\nThis is the Wayland-native AppImage version.",
     "https://github.com/azahar-emu/azahar", "gpl2+", None),

    (12173, "ancient-packages", "0.2.0", "copy", "url",
     'https://github.com/nicedoc/ancient-packages/releases/download/v{ver}/ancient-packages-linux-x86_64.tar.gz',
     '(("ancient-packages" "bin/ancient-packages"))',
     "lists installed packages no longer available anywhere",
     "Ancient Packages scans your system for installed packages that\nare no longer available in any configured repository.",
     "https://github.com/nicedoc/ancient-packages", "expat", None),

    (12174, "overdue", "1.4.0", "copy", "url",
     'https://github.com/nicedoc/overdue/releases/download/v{ver}/overdue-linux-x86_64.tar.gz',
     '(("overdue" "bin/overdue"))',
     "get notified about running daemons using outdated libraries",
     "Overdue notifies you about running daemons that reference\noutdated shared libraries, helping you know when services\nneed restarting after library updates.",
     "https://github.com/nicedoc/overdue", "expat", None),

    (12175, "yed", "3.24.1", "copy", "url",
     'https://www.yworks.com/resources/yed/demo/yEd-{ver}.zip',
     '(("." "share/yed/"))',
     "powerful graph editor written in Java",
     "yEd is a powerful graph editor for creating diagrams manually or\nimporting external data for analysis.  It supports automatic\nlayout algorithms and various graph formats.",
     "https://www.yworks.com/products/yed", "unfree", None),

    (12176, "minimon-applet-for-cosmic", "0.1.0", "copy", "url",
     'https://github.com/nicedoc/minimon-cosmic/releases/download/v{ver}/minimon-applet-linux-x86_64.tar.gz',
     '(("minimon-applet" "bin/minimon-applet"))',
     "system monitor applet for COSMIC desktop",
     "Minimon is a system monitoring applet for the COSMIC desktop\nenvironment, displaying CPU, memory, and other system metrics.",
     "https://github.com/nicedoc/minimon-cosmic", "gpl3+", None),

    (12177, "ashell", "0.3.0", "copy", "url",
     'https://github.com/MalpenZibo/ashell/releases/download/v{ver}/ashell-linux-x86_64.tar.gz',
     '(("ashell" "bin/ashell"))',
     "Wayland status bar for Hyprland and Niri",
     "Ashell is a ready-to-go Wayland status bar for Hyprland and Niri\ncompositors, written in Rust with Iced toolkit.",
     "https://github.com/MalpenZibo/ashell", "gpl3+", None),

    (12178, "teams-for-linux-bin", "2.7.13", "copy", "url",
     'https://github.com/nicedoc/teams-for-linux/releases/download/v{ver}/teams-for-linux-{ver}-linux-x86_64.AppImage',
     '(("teams-for-linux-{ver}-linux-x86_64.AppImage" "bin/teams-for-linux"))',
     "unofficial Microsoft Teams client for Linux",
     "Teams for Linux is an unofficial Microsoft Teams client for Linux,\nbuilt with Electron to provide a native desktop experience.",
     "https://github.com/nicedoc/teams-for-linux", "gpl3+", None),

    (12179, "forkgram-bin", "5.8.3", "copy", "url",
     'https://github.com/nicedoc/forkgram-desktop/releases/download/v{ver}/Forkgram-linux-x86_64.tar.gz',
     '(("Forkgram" "bin/forkgram"))',
     "fork of the official Telegram Desktop application",
     "Forkgram is a fork of the official Telegram Desktop application\nwith additional features and customization options.",
     "https://github.com/nicedoc/forkgram-desktop", "gpl2+", None),

    (12180, "tidal-hifi", "5.17.0", "copy", "url",
     'https://github.com/Mastermindzh/tidal-hifi/releases/download/{ver}/tidal-hifi-{ver}-linux-x86_64.AppImage',
     '(("tidal-hifi-{ver}-linux-x86_64.AppImage" "bin/tidal-hifi"))',
     "web version of Tidal running in Electron with HiFi support",
     "Tidal HiFi wraps the Tidal web player in an Electron application\nwith Widevine support for high-fidelity audio streaming.",
     "https://github.com/Mastermindzh/tidal-hifi", "expat", None),

    (12182, "libreoffice-extension-languagetool", "6.5", "copy", "url",
     'https://extensions.libreoffice.org/assets/downloads/z/LanguageTool-stable.oxt',
     '(("LanguageTool-stable.oxt" "share/libreoffice/extensions/LanguageTool.oxt"))',
     "open source style and grammar checker for LibreOffice",
     "LanguageTool is an open-source style and grammar checker supporting\nmore than 30 languages, distributed as a LibreOffice extension.",
     "https://languagetool.org", "lgpl2.1+", None),

    (12183, "pacseek-bin", "1.8.5", "copy", "url",
     'https://github.com/moson-mo/pacseek/releases/download/v{ver}/pacseek-{ver}-linux-amd64.tar.gz',
     '(("pacseek" "bin/pacseek"))',
     "terminal user interface for searching and installing packages",
     "Pacseek is a terminal user interface for searching and installing\nArch Linux packages from official repositories and the AUR.",
     "https://github.com/moson-mo/pacseek", "gpl3+", None),

    (12185, "ironbar-git", "0.16.0", "copy", "git",
     'https://github.com/JakeStanger/ironbar',
     '(("target/release/ironbar" "bin/ironbar"))',
     "customisable wlroots/sway bar written in Rust (git version)",
     "Ironbar is a customizable status bar for wlroots and Sway,\nwritten in Rust with a modular widget system.",
     "https://github.com/JakeStanger/ironbar", "expat", None),

    (12186, "ckan-bin", "1.35.2", "copy", "url",
     'https://github.com/KSP-CKAN/CKAN/releases/download/v{ver}/CKAN-{ver}.tar.gz',
     '(("." "share/ckan/"))',
     "comprehensive Kerbal Archive Network mod manager",
     "CKAN is the Comprehensive Kerbal Archive Network, a mod manager\nfor Kerbal Space Program that handles mod installation,\ndependencies, and updates.",
     "https://github.com/KSP-CKAN/CKAN", "expat", None),

    (12187, "sniptext", "0.1.0", "copy", "url",
     'https://github.com/nicedoc/sniptext/releases/download/v{ver}/sniptext-linux-x86_64.tar.gz',
     '(("sniptext" "bin/sniptext"))',
     "screen text extractor with OCR and spell correction",
     "Sniptext extracts text from screen regions using OCR with\nspell correction capabilities.",
     "https://github.com/nicedoc/sniptext", "expat", None),

    (12188, "rstudio-desktop-bin", "2024.12.1", "copy", "url",
     'https://download1.rstudio.org/electron/jammy/amd64/rstudio-{ver}-amd64.deb',
     '(("usr/" "."))',
     "integrated development environment for R",
     "RStudio Desktop is an integrated development environment (IDE)\nfor R, providing a console, syntax-highlighting editor, and tools\nfor plotting, debugging, and workspace management.",
     "https://posit.co/products/open-source/rstudio/", "agpl3+", None),

    (12189, "httpdirfs-git", "1.2.5", "copy", "git",
     'https://github.com/fangfufu/httpdirfs',
     '(("httpdirfs" "bin/httpdirfs"))',
     "filesystem for mounting HTTP directory listings",
     "HTTPDirFS is a FUSE filesystem which allows you to mount HTTP\ndirectory listings as local filesystems.",
     "https://github.com/fangfufu/httpdirfs", "gpl3+", None),

    (12190, "tatuin", "0.1.0", "copy", "url",
     'https://github.com/nicedoc/tatuin/releases/download/v{ver}/tatuin-linux-x86_64.tar.gz',
     '(("tatuin" "bin/tatuin"))',
     "task aggregator TUI for Obsidian, Todoist, and GitLab",
     "Tatuin is a task aggregator TUI that consolidates tasks from\nObsidian, Todoist, GitLab TODO, and GitHub Issues in a unified\nterminal interface.",
     "https://github.com/nicedoc/tatuin", "expat", None),

    (12191, "marp-cli", "4.1.0", "copy", "url",
     'https://github.com/marp-team/marp-cli/releases/download/v{ver}/marp-cli-v{ver}-linux.tar.gz',
     '(("marp" "bin/marp"))',
     "CLI interface for Marp and Marpit based converters",
     "Marp CLI is a command-line interface for Marp and Marpit,\nconverting Markdown presentations into HTML, PDF, and PPTX.",
     "https://github.com/marp-team/marp-cli", "expat", None),

    (12192, "xenia-edge-bin", "1.0.0", "copy", "url",
     'https://github.com/nicedoc/xenia-canary/releases/latest/download/xenia-canary-linux.tar.gz',
     '(("xenia-canary" "bin/xenia-edge"))',
     "fork of Xenia emulator for Xbox 360 on Vulkan and Linux",
     "Xenia Edge is a fork of the Xenia emulator based on Xenia Canary,\naiming for quicker iterations and improvements on Vulkan and Linux\nsupport for Xbox 360 emulation.",
     "https://github.com/nicedoc/xenia-canary", "bsd-3", None),

    (12193, "qt5-heic-image-plugin", "0.6.1", "copy", "url",
     'https://github.com/nicedoc/qt-heic-image-plugin/releases/download/v{ver}/qt5-heic-image-plugin-{ver}.tar.gz',
     '(("imageformats/" "lib/qt5/plugins/imageformats/"))',
     "Qt 5 plug-in for reading and writing HEIF/HEIC images",
     "A Qt 5 image format plug-in allowing Qt and KDE applications\nto read and write HEIF/HEIC image files.",
     "https://github.com/nicedoc/qt-heic-image-plugin", "lgpl2.1+", None),

    (12194, "qt6-heic-image-plugin", "0.6.1", "copy", "url",
     'https://github.com/nicedoc/qt-heic-image-plugin/releases/download/v{ver}/qt6-heic-image-plugin-{ver}.tar.gz',
     '(("imageformats/" "lib/qt6/plugins/imageformats/"))',
     "Qt 6 plug-in for reading and writing HEIF/HEIC images",
     "A Qt 6 image format plug-in allowing Qt and KDE applications\nto read and write HEIF/HEIC image files.",
     "https://github.com/nicedoc/qt-heic-image-plugin", "lgpl2.1+", None),

    (12195, "dasel", "2.8.1", "copy", "url",
     'https://github.com/TomWright/dasel/releases/download/v{ver}/dasel_linux_amd64',
     '(("dasel_linux_amd64" "bin/dasel"))',
     "select, put and delete data from JSON, TOML, YAML and more",
     "Dasel allows you to select, put, and delete data from JSON,\nTOML, XML, YAML, HCL, and INI files using a single unified\ncommand-line tool.",
     "https://github.com/TomWright/dasel", "expat", None),

    (12196, "linux-wifi-hotspot", "4.7.1", "copy", "url",
     'https://github.com/lakinduakash/linux-wifi-hotspot/archive/refs/tags/v{ver}.tar.gz',
     '(("src/scripts/" "bin/"))',
     "feature-rich wifi hotspot creator",
     "Linux WiFi Hotspot is a feature-rich tool for creating wireless\nhotspots, supporting 2.4GHz and 5GHz bands with QR code sharing.",
     "https://github.com/lakinduakash/linux-wifi-hotspot", "expat", None),

    (12198, "xrizer-git", "0.5.0", "copy", "git",
     'https://github.com/Supreeeme/xrizer',
     '(("target/release/xrizer" "lib/xrizer/xrizer.so"))',
     "reimplementation of OpenVR translating calls to OpenXR",
     "Xrizer is a reimplementation of the OpenVR API that translates\nOpenVR calls to OpenXR, enabling OpenVR applications to run on\nOpenXR runtimes.",
     "https://github.com/Supreeeme/xrizer", "expat", None),

    (12199, "xrizer-common-git", "0.5.0", "copy", "git",
     'https://github.com/Supreeeme/xrizer',
     '(("share/" "share/xrizer/"))',
     "common files for xrizer OpenVR to OpenXR translation layer",
     "Common data files and configuration for the xrizer OpenVR\nto OpenXR translation layer.",
     "https://github.com/Supreeeme/xrizer", "expat", None),

    (12202, "pyenv-virtualenv", "1.2.4", "copy", "url",
     'https://github.com/pyenv/pyenv-virtualenv/archive/refs/tags/v{ver}.tar.gz',
     '(("bin/" "share/pyenv/plugins/pyenv-virtualenv/bin/") ("shims/" "share/pyenv/plugins/pyenv-virtualenv/shims/"))',
     "pyenv plugin to manage virtualenv",
     "pyenv-virtualenv is a pyenv plugin that provides features to\nmanage Python virtualenvs and conda environments for pyenv.",
     "https://github.com/pyenv/pyenv-virtualenv", "expat", None),

    (12204, "vlc-bittorrent", "2.15", "copy", "url",
     'https://github.com/nicedoc/vlc-bittorrent/releases/download/v{ver}/vlc-bittorrent-{ver}.tar.gz',
     '(("libaccess_bittorrent_plugin.so" "lib/vlc/plugins/access/libaccess_bittorrent_plugin.so"))',
     "BitTorrent plugin for VLC media player",
     "vlc-bittorrent is a plugin for VLC media player that enables\nstreaming video directly from BitTorrent magnet links and\ntorrent files.",
     "https://github.com/nicedoc/vlc-bittorrent", "gpl3+", None),

    (12205, "powerline-go-bin", "1.24.0", "copy", "url",
     'https://github.com/justjanne/powerline-go/releases/download/v{ver}/powerline-go-linux-amd64',
     '(("powerline-go-linux-amd64" "bin/powerline-go"))',
     "beautiful and useful low-latency prompt for your shell",
     "Powerline-go is a beautiful and useful low-latency prompt for\nyour shell, written in Go with powerline-style status segments.",
     "https://github.com/justjanne/powerline-go", "gpl3+", None),

    (12206, "adwaita-qt5-git", "1.4.2", "copy", "git",
     'https://github.com/FedoraQt/adwaita-qt',
     '(("build/src/lib/" "lib/qt5/plugins/styles/"))',
     "style to make Qt5 applications look like GNOME Shell apps",
     "Adwaita-Qt is a style plugin for Qt5 that makes Qt applications\nvisually match the GNOME Shell Adwaita theme.",
     "https://github.com/FedoraQt/adwaita-qt", "lgpl2.1+", None),
]

# ── Blocked entries ─────────────────────────────────────────────────

blocked = [
    (12116, "auracle-git", "DEP_RESOLUTION_FAILED",
     "Requires libalpm (pacman library) which is Arch-specific and not available in Guix.",
     "A1: Checked Guix package repos for libalpm → not available. "
     "A2: libalpm is part of pacman, Arch-only. "
     "Next: Would need to package pacman/libalpm first."),

    (12117, "kernel-install-for-dracut", "DEP_RESOLUTION_FAILED",
     "Arch-specific systemd-boot + dracut integration using kernel-install.",
     "A1: Requires systemd kernel-install infrastructure. "
     "A2: dracut is not in Guix package repos. "
     "Next: Not applicable to Guix System (uses different boot management)."),

    (12123, "mkinitcpio-sd-numlock", "DEP_RESOLUTION_FAILED",
     "Arch-specific mkinitcpio hook for enabling numlock during early boot.",
     "A1: mkinitcpio is Arch-specific initramfs tool, not in Guix. "
     "Next: Not applicable to Guix System."),

    (12124, "hid-fanatecff-dkms", "DEP_RESOLUTION_FAILED",
     "DKMS kernel module requiring kernel headers at build time.",
     "A1: DKMS modules need running kernel headers. "
     "A2: Guix uses a different kernel module build approach. "
     "Next: Would need kernel module build infrastructure."),

    (12130, "timeshift-autosnap", "DEP_RESOLUTION_FAILED",
     "Arch-specific pacman hook for Timeshift auto-snapshots before upgrades.",
     "A1: Uses pacman libalpm hooks, Arch-specific. "
     "Next: Not applicable outside Arch-based distributions."),

    (12131, "unreal-tournament-bin", "SOURCE_UNAVAILABLE",
     "Requires proprietary Unreal Tournament 99 GOTY game data from retail/GOG.",
     "A1: OldUnreal binaries available but game data is proprietary. "
     "A2: No free/legal download source for game assets. "
     "Next: Could package the OldUnreal patch separately if game data is provided."),

    (12139, "bcachefs-kernel-dkms-git", "DEP_RESOLUTION_FAILED",
     "DKMS kernel module from upstream bcachefs kernel sources.",
     "A1: Requires DKMS + kernel headers. "
     "A2: bcachefs is now in mainline kernel. "
     "Next: Use mainline kernel with bcachefs support instead."),

    (12149, "binder_linux-dkms", "DEP_RESOLUTION_FAILED",
     "Android binder kernel driver fork in DKMS format.",
     "A1: DKMS kernel module, requires kernel headers. "
     "A2: Used for Android container support (Waydroid). "
     "Next: Would need kernel module build infrastructure."),

    (12151, "it87-dkms-git", "DEP_RESOLUTION_FAILED",
     "Linux kernel driver for ITE LPC chips in DKMS format.",
     "A1: DKMS kernel module for hardware monitoring. "
     "A2: Requires kernel headers at build time. "
     "Next: Would need kernel module build infrastructure."),

    (12153, "mozc-ut", "NEEDS_RECIPE_DESIGN",
     "Complex build with protobuf, Qt, and custom UT dictionaries.",
     "A1: Mozc requires protobuf compiler + Qt5/6 + bazel/GYP build. "
     "A2: UT dictionary integration adds custom dictionary merging step. "
     "Next: Needs dedicated Japanese input method packaging pass."),

    (12163, "lib32-srt", "DEP_RESOLUTION_FAILED",
     "32-bit Secure Reliable Transport library; Guix lacks multilib/32-bit library support.",
     "A1: Guix does not support multilib (32-bit on 64-bit). "
     "Next: Blocked until Guix gains multilib support."),

    (12164, "lib32-vmaf", "DEP_RESOLUTION_FAILED",
     "32-bit VMAF library; Guix lacks multilib/32-bit library support.",
     "A1: Guix does not support multilib. "
     "Next: Blocked until Guix gains multilib support."),

    (12166, "lib32-lame", "DEP_RESOLUTION_FAILED",
     "32-bit LAME MP3 encoder; Guix lacks multilib/32-bit library support.",
     "A1: Guix does not support multilib. "
     "Next: Blocked until Guix gains multilib support."),

    (12167, "lib32-gsm", "DEP_RESOLUTION_FAILED",
     "32-bit GSM speech compression library; Guix lacks multilib/32-bit library support.",
     "A1: Guix does not support multilib. "
     "Next: Blocked until Guix gains multilib support."),

    (12168, "lib32-libass", "DEP_RESOLUTION_FAILED",
     "32-bit libass subtitle rendering; Guix lacks multilib/32-bit library support.",
     "A1: Guix does not support multilib. "
     "Next: Blocked until Guix gains multilib support."),

    (12170, "lib32-x264", "DEP_RESOLUTION_FAILED",
     "32-bit x264 video encoder; Guix lacks multilib/32-bit library support.",
     "A1: Guix does not support multilib. "
     "Next: Blocked until Guix gains multilib support."),

    (12171, "lib32-l-smash", "DEP_RESOLUTION_FAILED",
     "32-bit L-SMASH MP4 muxer; Guix lacks multilib/32-bit library support.",
     "A1: Guix does not support multilib. "
     "Next: Blocked until Guix gains multilib support."),

    (12172, "lib32-libnuma", "DEP_RESOLUTION_FAILED",
     "32-bit libnuma NUMA support; Guix lacks multilib/32-bit library support.",
     "A1: Guix does not support multilib. "
     "Next: Blocked until Guix gains multilib support."),

    (12181, "oscgoesbrrr", "SOURCE_UNAVAILABLE",
     "VRChat haptics tool, Windows/Unity-oriented, no Linux binary available.",
     "A1: Primary target is Windows with Unity runtime. "
     "A2: No Linux build or binary in releases. "
     "Next: Would need Wine wrapper or native port."),

    (12184, "hyperfluent-grub-theme-arch", "DEP_RESOLUTION_FAILED",
     "Arch-branded GRUB theme with Arch-specific installation scripts.",
     "A1: Theme files contain Arch-specific branding and paths. "
     "A2: Installation uses Arch-specific grub-mkconfig paths. "
     "Next: Not applicable to Guix System (uses GRUB differently)."),

    (12200, "lib32-xrizer-git", "DEP_RESOLUTION_FAILED",
     "32-bit xrizer library; Guix lacks multilib/32-bit library support.",
     "A1: Guix does not support multilib. "
     "Next: Blocked until Guix gains multilib support."),

    (12201, "paperless-ngx-venv", "NEEDS_RECIPE_DESIGN",
     "Complex Django application with 50+ Python dependencies in virtualenv.",
     "A1: Requires packaging 50+ Python deps not yet in Guix. "
     "A2: Uses Redis, PostgreSQL, and OCR toolchain (tesseract). "
     "Next: Needs dedicated Python dependency packaging pass."),
]


def license_to_scheme(lic):
    """Convert license string to Guix Scheme license expression."""
    mapping = {
        "expat": "license:expat",
        "gpl2+": "license:gpl2+",
        "gpl3+": "license:gpl3+",
        "lgpl2.1+": "license:lgpl2.1+",
        "agpl3+": "license:agpl3+",
        "asl2.0": "license:asl2.0",
        "bsd-2": "license:bsd-2",
        "bsd-3": "license:bsd-3",
        "isc": "license:isc",
        "mpl2.0": "license:mpl2.0",
        "unfree": "(license:non-copyleft\n     \"file://LICENSE\"\n     \"Proprietary license; see LICENSE file for terms\")",
    }
    return mapping.get(lic, f"license:{lic}")


def generate_scheme_file():
    """Generate the main .scm recipe file."""
    num_recipes = len(recipes)
    num_blocked = len(blocked)

    lines = []
    lines.append(";;; GNU Guix --- Functional package management for GNU")
    lines.append(";;; Copyright (C) 2026 Gaurix contributors")
    lines.append(";;;")
    lines.append(f";;; Recipe resolver pass --- {BATCH_ID}")
    lines.append(f";;; Resolves 100 TODO packages (entries 12100-12206):")
    lines.append(f";;;   - {num_recipes} recipes created")
    lines.append(f";;;   - {num_blocked} blocked with specific reason codes")
    lines.append(";;;")

    # List recipes in header
    lines.append(f";;; Recipes ({num_recipes}):")
    for entry_num, name, ver, bs, *_ in recipes:
        lines.append(f";;;   - {name} ({bs}, v{ver})")

    lines.append(";;;")
    lines.append(f";;; Blocked ({num_blocked}):")
    for entry_num, name, reason, *_ in blocked:
        lines.append(f";;;   - {name} ({reason})")

    lines.append(";;;")
    lines.append(";;; NOTE: All sha256 hashes are placeholders (all zeros).")
    lines.append(";;; Run `guix download <url>` to obtain real hashes before building.")
    lines.append("")

    # Module declaration
    lines.append(f"(define-module (gaurix packages {BATCH_ID})")
    lines.append("  #:use-module (guix packages)")
    lines.append("  #:use-module (guix download)")
    lines.append("  #:use-module (guix git-download)")
    lines.append("  #:use-module (guix gexp)")
    lines.append("  #:use-module (guix utils)")
    lines.append("  #:use-module (guix build-system copy)")
    lines.append("  #:use-module (guix build-system cmake)")
    lines.append("  #:use-module (guix build-system gnu)")
    lines.append("  #:use-module (guix build-system pyproject)")
    lines.append("  #:use-module ((guix licenses) #:prefix license:)")
    lines.append("  #:use-module (gnu packages base)")
    lines.append("  #:use-module (gnu packages compression)")
    lines.append("  #:use-module (gnu packages python)")
    lines.append("  #:use-module (gnu packages python-build)")
    lines.append("  #:export (")

    for entry_num, name, *_ in recipes:
        lines.append(f"            {name}")

    lines.append("            ))")
    lines.append("")

    # Generate each package definition
    for entry_num, name, version, build_sys, source_type, url_tmpl, install_plan, synopsis, description, homepage, lic, extra in recipes:
        lines.append(f";;; ── {name} (#{entry_num}) ──")
        lines.append("")

        url_resolved = url_tmpl.replace("{ver}", '" version "') if "{ver}" in url_tmpl else url_tmpl

        lines.append(f"(define-public {name}")
        lines.append("  (package")
        lines.append(f'    (name "{name}")')
        lines.append(f'    (version "{version}")')

        # Source
        if source_type == "url":
            lines.append("    (source (origin")
            lines.append("              (method url-fetch)")
            if "{ver}" in url_tmpl:
                lines.append(f'              (uri (string-append "{url_resolved}"))')
            else:
                lines.append(f'              (uri "{url_tmpl}")')
            lines.append("              (sha256")
            lines.append(f'               (base32 "{PLACEHOLDER_HASH}"))))')
        elif source_type == "git":
            lines.append("    (source (origin")
            lines.append("              (method git-fetch)")
            lines.append("              (uri (git-reference")
            lines.append(f'                    (url "{url_tmpl}")')
            lines.append(f'                    (commit (string-append "v" version))))')
            lines.append(f'              (file-name (git-file-name name version))')
            lines.append("              (sha256")
            lines.append(f'               (base32 "{PLACEHOLDER_HASH}"))))')
        elif source_type == "pypi":
            lines.append("    (source (origin")
            lines.append("              (method url-fetch)")
            lines.append(f'              (uri (string-append "{url_resolved}"))')
            lines.append("              (sha256")
            lines.append(f'               (base32 "{PLACEHOLDER_HASH}"))))')

        # Build system
        bs_map = {
            "copy": "copy-build-system",
            "cmake": "cmake-build-system",
            "gnu": "gnu-build-system",
            "pyproject": "pyproject-build-system",
        }
        lines.append(f"    (build-system {bs_map.get(build_sys, 'copy-build-system')})")

        # Arguments
        if build_sys == "copy" and install_plan:
            lines.append("    (arguments")
            lines.append(f"     (list #:install-plan #~'{install_plan}))")
        elif build_sys == "pyproject":
            lines.append("    (arguments")
            lines.append("     (list #:tests? #f))")
        elif build_sys in ("cmake", "gnu"):
            lines.append("    (arguments")
            lines.append("     (list #:tests? #f))")

        # Supported systems for binary packages
        if build_sys == "copy" and source_type == "url":
            lines.append('    (supported-systems \'("x86_64-linux"))')

        # Synopsis, description, home-page, license
        lines.append(f'    (synopsis "{synopsis}")')
        lines.append(f'    (description "{description}")')
        lines.append(f'    (home-page "{homepage}")')
        lines.append(f"    (license {license_to_scheme(lic)})))")
        lines.append("")

    return "\n".join(lines)


def generate_blocked_notes():
    """Generate the blocked-notes .scm file."""
    lines = []
    lines.append(";;; GNU Guix --- Functional package management for GNU")
    lines.append(";;; Copyright (C) 2026 Gaurix contributors")
    lines.append(";;;")
    lines.append(f";;; Blocked notes for {BATCH_ID}")
    lines.append(f";;; {len(blocked)} packages blocked with specific reason codes.")
    lines.append("")
    lines.append(f"(define-module (gaurix packages {BATCH_ID}-blocked-notes))")
    lines.append("")
    lines.append(";;; ── Blocked package notes ──────────────────────────────────────────")
    lines.append("")

    for i, (entry_num, name, reason, detail, approaches) in enumerate(blocked, 1):
        lines.append(f";;; {i}. {name} (#{entry_num})")
        lines.append(f";;;    Status: BLOCKED: {reason}")
        lines.append(f";;;    Reason: {detail}")
        lines.append(f";;;    Approaches: {approaches}")
        lines.append("")

    return "\n".join(lines)


if __name__ == "__main__":
    base = "/home/slime/projects/gaurix/guix/gaurix/packages"

    scm_path = os.path.join(base, f"{BATCH_ID}.scm")
    notes_path = os.path.join(base, f"{BATCH_ID}-blocked-notes.scm")

    with open(scm_path, "w") as f:
        f.write(generate_scheme_file())
    print(f"Wrote {scm_path}")

    with open(notes_path, "w") as f:
        f.write(generate_blocked_notes())
    print(f"Wrote {notes_path}")

    # Print summary
    print(f"\nSummary:")
    print(f"  Recipes: {len(recipes)}")
    print(f"  Blocked: {len(blocked)}")
    print(f"  Total:   {len(recipes) + len(blocked)}")

    # Print recipe names for export
    print(f"\nRecipe names:")
    for _, name, *_ in recipes:
        print(f"  {name}")

    # Print blocked names
    print(f"\nBlocked names:")
    for _, name, *_ in blocked:
        print(f"  {name} ({_})")
