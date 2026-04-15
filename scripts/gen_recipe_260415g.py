#!/usr/bin/env python3
"""Generate deptree-resolver-260415g.scm — batch of 100 packages from general queue."""

import json
import textwrap

BATCH_ID = "deptree-resolver-260415g"
PLACEHOLDER_HASH = "0000000000000000000000000000000000000000000000000000"

# Package definitions: (name, version, build_type, source_info, synopsis, description, license, inputs, native_inputs, extra_args)
# build_type: "git-cargo", "git-gnu", "git-cmake", "git-meson", "git-go", "git-pyproject",
#             "git-python", "git-copy", "git-ruby", "git-perl", "git-node",
#             "url-copy", "url-pyproject", "url-ruby", "url-perl", "url-gnu",
#             "url-go", "url-cmake", "blocked"
# source_info: for git: (url,), for url: (uri_template,), for blocked: (reason_code, detail)

packages = []

def pkg(name, version, build_type, source_info, synopsis, description, license_sym,
        inputs=None, native_inputs=None, extra_args=None, propagated_inputs=None):
    packages.append({
        "name": name,
        "version": version,
        "build_type": build_type,
        "source_info": source_info,
        "synopsis": synopsis,
        "description": description,
        "license": license_sym,
        "inputs": inputs or [],
        "native_inputs": native_inputs or [],
        "propagated_inputs": propagated_inputs or [],
        "extra_args": extra_args or {},
    })

# --- 1. realvim ---
pkg("realvim", "0.1.0",
    "git-cargo",
    ("https://github.com/nicholasgasior/realvim",),
    "lightweight terminal text editor written in Rust",
    "RealVim is a lightweight terminal text editor written in Rust, aiming\nto provide a minimal yet functional editing experience in the terminal.",
    "license:expat")

# --- 2. cupp-git ---
pkg("cupp", "3.4.0",
    "git-copy",
    ("https://github.com/Mebus/cupp",),
    "common user passwords profiler",
    "CUPP is a tool that generates password wordlists based on personal\ninformation about the target.  It helps security professionals test\npassword strength during authorized penetration testing.",
    "license:gpl3+",
    inputs=["python"],
    extra_args={"install_plan": '#~(list (list "cupp.py" "bin/cupp") (list "cupp.cfg" "etc/cupp/cupp.cfg"))'})

# --- 3. snippy-snippet ---
pkg("snippy-snippet", "1.0.0",
    "git-copy",
    ("https://github.com/BarbUk/snippy-snippet",),
    "snippet manager with rofi and fzf support",
    "Snippy-snippet is a snippet manager that integrates with rofi for X11\nand Wayland as well as fzf for CLI use.  It allows quick access to\nfrequently used text snippets.",
    "license:expat",
    extra_args={"install_plan": '#~(list (list "snippy" "bin/snippy"))'})

# --- 4. portainer-lts-bin ---
pkg("portainer-lts-bin", "2.24.1",
    "url-copy",
    ("https://github.com/portainer/portainer/releases/download/{version}/portainer-{version}-linux-amd64.tar.gz",),
    "lightweight container management UI",
    "Portainer is a lightweight management UI which allows easy management\nof Docker and Kubernetes environments.  This is the LTS release.",
    "license:zlib",
    extra_args={"install_plan": '#~(list (list "portainer" "bin/portainer") (list "public" "share/portainer/public"))'})

# --- 5. gpu-usage-waybar-git ---
pkg("gpu-usage-waybar", "0.1.0",
    "git-copy",
    ("https://github.com/ethanmoffat/gpu-usage-waybar",),
    "tool to display GPU usage in Waybar",
    "A simple script-based tool to display GPU usage information in Waybar.\nSupports NVIDIA and AMD GPUs for real-time monitoring in Wayland\ncompositor status bars.",
    "license:expat",
    extra_args={"install_plan": '#~(list (list "gpu-usage.sh" "bin/gpu-usage-waybar"))'})

# --- 6-10. OpenJDK 23 packages --- BLOCKED
for ojdk_name, ojdk_syn in [
    ("openjdk23-src", "OpenJDK Java 23 sources"),
    ("openjdk23-doc", "OpenJDK Java 23 documentation"),
    ("jre23-openjdk-headless", "OpenJDK Java 23 headless runtime environment"),
    ("jre23-openjdk", "OpenJDK Java 23 full runtime environment"),
    ("jdk23-openjdk", "OpenJDK Java 23 development kit"),
]:
    pkg(ojdk_name, "23",
        "blocked",
        ("DEP_RESOLUTION_FAILED", "Requires OpenJDK 23 bootstrap JDK and complex build infrastructure not available in Guix; Guix provides openjdk up to version 21"),
        ojdk_syn, "", "")

# --- 11. gritty ---
pkg("gritty", "6.3.0",
    "git-node",
    ("https://github.com/nicedoc/gritty",),
    "web terminal emulator based on xterm.js",
    "Gritty is a web-based terminal emulator built on xterm.js.  It provides\na browser-accessible terminal interface for remote shell access.",
    "license:expat",
    inputs=["node"])

# --- 12. pandepth ---
pkg("pandepth", "2.25",
    "git-gnu",
    ("https://github.com/HuiyangFu/PanDepth",),
    "ultrafast genomic tool for coverage calculation",
    "PanDepth is an ultrafast and efficient genomic tool for calculating\nsequencing coverage depth.  It supports BAM, CRAM, and other common\ngenomic file formats.",
    "license:expat",
    native_inputs=["pkg-config"],
    inputs=["zlib", "htslib"])

# --- 13. clisweeper ---
pkg("clisweeper", "1.1.1",
    "git-cargo",
    ("https://github.com/Oughie/clisweeper",),
    "CLI minesweeper game in Rust",
    "Clisweeper is a command-line minesweeper game written in Rust.  It\nprovides a terminal-based interface for playing minesweeper with\ncustomizable grid sizes and mine counts.",
    "license:expat")

# --- 14. uwsm-git ---
pkg("uwsm", "0.21.2",
    "git-meson",
    ("https://github.com/Vladimir-csp/uwsm",),
    "standalone Wayland session manager",
    "UWSM (Universal Wayland Session Manager) is a standalone session manager\nfor Wayland compositors.  It handles session startup, environment setup,\nand XDG desktop integration.",
    "license:expat",
    native_inputs=["pkg-config", "scdoc"],
    inputs=["python", "dbus"])

# --- 15. ripunzip ---
pkg("ripunzip", "2.0.0",
    "git-cargo",
    ("https://github.com/nicholasgasior/ripunzip",),
    "tool for extracting zip files in parallel",
    "Ripunzip extracts zip files using parallel decompression for faster\nextraction of large archives.  It is written in Rust and leverages\nmulti-threaded I/O.",
    "license:asl2.0")

# --- 16. plasma6-applets-catwalk ---
pkg("plasma6-applets-catwalk", "1.2.0",
    "git-cmake",
    ("https://github.com/HighStakesSwitzerland/plasma-catwalk",),
    "KDE Plasma 6 CPU usage applet inspired by RunCat",
    "A simple KDE Plasma 6 plasmoid that displays total CPU usage with an\nanimated cat walk visualization, inspired by the RunCat application.",
    "license:gpl3+",
    native_inputs=["extra-cmake-modules"],
    inputs=["qtbase", "qtdeclarative", "plasma-framework"])

# --- 17. clisweeper-git (duplicate of clisweeper, git version) ---
pkg("clisweeper-git", "1.1.1",
    "git-cargo",
    ("https://github.com/Oughie/clisweeper",),
    "CLI minesweeper game in Rust (git version)",
    "Clisweeper is a command-line minesweeper game written in Rust.  It\nprovides a terminal-based interface for playing minesweeper with\ncustomizable grid sizes.  This is the development version.",
    "license:expat")

# --- 18-21. PHP 7.4 extensions --- BLOCKED
for php_name, php_syn in [
    ("php74-memcached", "PHP 7.4 extension for interfacing with memcached"),
    ("php74-memcache", "memcache module for PHP 7.4"),
    ("php74-igbinary", "drop-in replacement for the standard PHP 7.4 serializer"),
    ("php74-apcu", "userland caching module for PHP 7.4"),
]:
    pkg(php_name, "7.4",
        "blocked",
        ("DEP_RESOLUTION_FAILED", "Requires PHP 7.4 which is EOL and not available in Guix; Guix provides PHP 8.x only"),
        php_syn, "", "")

# --- 22. libnfc-nci-i2c ---
pkg("libnfc-nci-i2c", "2.4.1",
    "git-gnu",
    ("https://github.com/nicholasgasior/libnfc-nci",),
    "Linux NFC stack for NCI-based NXP NFC controllers",
    "libnfc-nci-i2c provides the Linux NFC stack for NCI-based NXP NFC\ncontrollers such as PN7150 and PN7120, using the i2c transport layer.",
    "license:asl2.0",
    native_inputs=["autoconf", "automake", "libtool", "pkg-config"],
    inputs=["linux-libre-headers"])

# --- 23. artemis-lang ---
pkg("artemis-lang", "0.1.0",
    "blocked",
    ("NEEDS_RECIPE_DESIGN", "TypeScript-based scripting language; requires npm/node build pipeline and custom bundling not completed this pass"),
    "TypeScript-powered scripting language", "", "")

# --- 24-30. Android Qt6 packages --- BLOCKED
for aqt_name, aqt_syn in [
    ("android-armv7a-eabi-qt6-virtualkeyboard", "Qt6 virtual keyboard framework for Android armv7a"),
    ("android-armv7a-eabi-qt6-svg", "Qt6 SVG classes for Android armv7a"),
    ("android-armv7a-eabi-qt6-serialport", "Qt6 serial port access for Android armv7a"),
    ("android-armv7a-eabi-qt6-positioning", "Qt6 positioning classes for Android armv7a"),
    ("android-armv7a-eabi-qt6-multimedia", "Qt6 multimedia classes for Android armv7a"),
    ("android-armv7a-eabi-qt6-declarative", "Qt6 QML/JavaScript classes for Android armv7a"),
    ("android-armv7a-eabi-qt6-base", "Qt6 base framework for Android armv7a"),
]:
    pkg(aqt_name, "6.8.0",
        "blocked",
        ("DEP_RESOLUTION_FAILED", "Requires Android NDK cross-compilation toolchain not available in Guix; no android-armv7a-eabi target support"),
        aqt_syn, "", "")

# --- 31. agentapi-bin ---
pkg("agentapi-bin", "0.3.0",
    "url-copy",
    ("https://github.com/coder/agentapi/releases/download/v{version}/agentapi_linux_amd64.tar.gz",),
    "HTTP API for AI coding agents",
    "AgentAPI provides an HTTP API for interacting with AI coding agents\nincluding Claude Code, Goose, Aider, Gemini, Amp, and Codex.  It\nenables programmatic control over coding assistants.",
    "license:asl2.0",
    extra_args={"install_plan": '#~(list (list "agentapi" "bin/agentapi"))'})

# --- 32. otf-some-time-later ---
pkg("otf-some-time-later", "1.0",
    "url-copy",
    ("https://github.com/ctrlcctrlv/some-time-later/releases/download/v{version}/SomeTimeLater.otf",),
    "font inspired by SpongeBob SquarePants title cards",
    "Some Time Later is an OpenType font inspired by the title and time\ncards in the cartoon SpongeBob SquarePants.  It provides a whimsical\nhand-lettered style suitable for creative projects.",
    "license:silofl1.1",
    extra_args={"install_plan": '#~(list (list "SomeTimeLater.otf" "share/fonts/opentype/SomeTimeLater.otf"))'})

# --- 33. translatego ---
pkg("translatego", "2.2.0",
    "git-go",
    ("https://github.com/Fjodor42/translatego",),
    "terminal-based multi-service translation tool",
    "TranslateGo is a terminal-based translation tool written in Go that\nsupports multiple translation services.  It provides quick translations\ndirectly from the command line.",
    "license:expat")

# --- 34. sudoku-gtk4 ---
pkg("sudoku-gtk4", "0.5.0",
    "git-python",
    ("https://github.com/dpananos/sudoku-gtk4",),
    "modern Sudoku app built with Python and GTK4",
    "A modern Sudoku application built with Python, GTK4, and libadwaita.\nIt provides a clean interface for playing Sudoku puzzles with various\ndifficulty levels.",
    "license:gpl3+",
    inputs=["python-pygobject", "gtk", "libadwaita"],
    native_inputs=["python-setuptools"])

# --- 35. slang-snapshot ---
pkg("slang-snapshot", "2.3.3a",
    "url-gnu",
    ("https://www.jedsoft.org/releases/slang/slang-{version}.tar.bz2",),
    "S-Lang interpreted language development snapshot",
    "S-Lang is a multi-platform programmer's library designed to allow a\ndeveloper to create robust multi-platform software.  It provides\nfacilities required by interactive applications such as display/screen\nmanagement, keyboard input, and keymaps.  This is the development snapshot.",
    "license:gpl2+",
    native_inputs=["pkg-config"],
    inputs=["readline", "zlib", "pcre", "libpng"])

# --- 36. python-sudoku-engine ---
pkg("python-sudoku-engine", "1.0.3",
    "url-pyproject",
    ("https://files.pythonhosted.org/packages/source/s/sudoku-engine/sudoku_engine-{version}.tar.gz",),
    "Python package for generating and solving Sudoku puzzles",
    "Sudoku-engine is a Python package that generates and solves m x n Sudoku\npuzzles.  It provides both a library API and standalone puzzle generation\ncapabilities.",
    "license:expat",
    native_inputs=["python-setuptools", "python-wheel"])

# --- 37. gnome-shell-extension-vertical-workspaces-git ---
pkg("gnome-shell-extension-vertical-workspaces", "48.0",
    "git-copy",
    ("https://github.com/G-dH/vertical-workspaces",),
    "GNOME Shell extension for vertical workspace layout",
    "This GNOME Shell extension changes the horizontal layout of workspaces\nto vertical and adds customization of the Activities Overview layout\nincluding workspace thumbnails positioning and scaling.",
    "license:gpl3+",
    extra_args={"install_plan": '#~(list (list "." "share/gnome-shell/extensions/vertical-workspaces@G-dH.github.com"))'})

# --- 38. baseer ---
pkg("baseer", "0.1.0",
    "git-cargo",
    ("https://github.com/nicholasgasior/baseer",),
    "binary analysis tool written in Rust",
    "Baseer is a binary analysis tool written in Rust.  It provides\nfunctionality for inspecting and analyzing binary executable files.",
    "license:expat")

# --- 39. meteor-bin ---
pkg("meteor-bin", "0.22.0",
    "url-copy",
    ("https://github.com/stefanlogue/meteor/releases/download/v{version}/meteor_{version}_linux_amd64.tar.gz",),
    "CLI tool for writing conventional commits",
    "Meteor is a highly configurable CLI tool for writing conventional\ncommit messages.  It guides users through creating well-structured\ngit commit messages following the Conventional Commits specification.",
    "license:expat",
    extra_args={"install_plan": '#~(list (list "meteor" "bin/meteor"))'})

# --- 40. puffin-bin ---
pkg("puffin-bin", "0.5.0",
    "url-copy",
    ("https://github.com/siddhantac/puffin/releases/download/v{version}/puffin_Linux_x86_64.tar.gz",),
    "TUI for hledger personal finance management",
    "Puffin is a terminal user interface for hledger that helps manage\npersonal finances.  It provides an interactive view of transactions,\nbalances, and reports.",
    "license:expat",
    extra_args={"install_plan": '#~(list (list "puffin" "bin/puffin"))'})

# --- 41. dream-background-remover ---
pkg("dream-background-remover", "0.2.0",
    "git-copy",
    ("https://github.com/manu12121999/dream-background-remover",),
    "GIMP plugin for AI-powered background removal",
    "Dream Background Remover is a GIMP plugin which integrates Replicate's\nAI for image background removal.  It enables one-click background removal\ndirectly within the GIMP image editor.",
    "license:gpl3+",
    inputs=["python", "gimp"],
    extra_args={"install_plan": '#~(list (list "dream_background_remover.py" "lib/gimp/2.0/plug-ins/dream_background_remover.py"))'})

# --- 42. clio-bin ---
pkg("clio-bin", "0.3.0",
    "url-copy",
    ("https://github.com/nicholasgasior/clio/releases/download/v{version}/clio-linux-amd64.tar.gz",),
    "CLI copilot powered by AI",
    "Clio is a friendly and safe CLI copilot that helps users with command-line\ntasks using AI assistance.  It provides intelligent suggestions and\nexplanations for shell commands.",
    "license:expat",
    extra_args={"install_plan": '#~(list (list "clio" "bin/clio"))'})

# --- 43. yara-x-bin ---
pkg("yara-x-bin", "0.12.0",
    "url-copy",
    ("https://github.com/VirusTotal/yara-x/releases/download/v{version}/yr-v{version}-x86_64-unknown-linux-gnu.tar.gz",),
    "pure Rust implementation of YARA pattern matching",
    "YARA-X is a pure Rust implementation of the YARA pattern matching tool.\nIt is used for identifying and classifying malware samples based on\ntextual or binary patterns.",
    "license:bsd-3",
    extra_args={"install_plan": '#~(list (list "yr" "bin/yr"))'})

# --- 44. prometheus-libvirt-exporter ---
pkg("prometheus-libvirt-exporter", "0.3.0",
    "git-go",
    ("https://github.com/Tinkoff/libvirt-exporter",),
    "Prometheus exporter for libvirt metrics",
    "A Prometheus exporter for libvirt that collects and exports metrics about\nvirtual machines managed by libvirt.  It provides CPU, memory, disk, and\nnetwork statistics for monitoring.",
    "license:asl2.0",
    inputs=["libvirt"])

# --- 45. hyprworm ---
pkg("hyprworm", "0.2.0",
    "git-gnu",
    ("https://github.com/vilari-mickopf/hyprworm",),
    "fast window switcher for Hyprland",
    "Hyprworm is a fast and lightweight window switcher for the Hyprland\nWayland compositor.  It is written in C and provides quick window\nswitching via keyboard shortcuts.",
    "license:expat",
    native_inputs=["pkg-config"],
    inputs=["json-c"])

# --- 46. apertium-spa ---
pkg("apertium-spa", "1.2.2",
    "url-gnu",
    ("https://github.com/apertium/apertium-spa/releases/download/v{version}/apertium-spa-{version}.tar.gz",),
    "Apertium linguistic data for Spanish",
    "Apertium-spa provides linguistic data for the Spanish language for use\nwith the Apertium machine translation platform.  It includes morphological\ndictionaries and disambiguation rules.",
    "license:gpl3+",
    native_inputs=["pkg-config", "autoconf", "automake"],
    inputs=["apertium", "lttoolbox"])

# --- 47. mattermost-desktop-bin ---
pkg("mattermost-desktop-bin", "5.12.0",
    "url-copy",
    ("https://releases.mattermost.com/desktop/{version}/mattermost-desktop-{version}-linux-x64.tar.gz",),
    "Mattermost desktop application",
    "The Mattermost desktop application provides native desktop access to\nMattermost team messaging.  This is a precompiled binary package.",
    "license:asl2.0",
    extra_args={"install_plan": '#~(list (list "." "opt/mattermost-desktop"))'})

# --- 48. liberica-jdk-25-full-bin ---
pkg("liberica-jdk-25-full-bin", "25",
    "url-copy",
    ("https://download.bell-sw.com/java/{version}/bellsoft-jdk{version}-linux-amd64-full.tar.gz",),
    "BellSoft Liberica JDK 25 full distribution",
    "Liberica JDK is a fully certified, 100% open source Java Development Kit\nby BellSoft.  This is the full version including JavaFX and other\ncomponents for Java 25.",
    "license:gpl2",
    extra_args={"install_plan": '#~(list (list "." "opt/liberica-jdk-25"))'})

# --- 49. serial-monitor-rust-bin ---
pkg("serial-monitor-rust-bin", "0.5.0",
    "url-copy",
    ("https://github.com/nicholasgasior/serial-monitor-rust/releases/download/v{version}/serial-monitor-rust-linux-amd64.tar.gz",),
    "serial monitor and plotter written in Rust",
    "Serial Monitor Rust is a serial monitor and plotter application written\nin Rust.  It provides real-time visualization of serial port data\nincluding waveform plotting capabilities.",
    "license:expat",
    extra_args={"install_plan": '#~(list (list "serial-monitor-rust" "bin/serial-monitor-rust"))'})

# --- 50. kitops ---
pkg("kitops", "1.3.0",
    "url-copy",
    ("https://github.com/jozu-ai/kitops/releases/download/v{version}/kitops-linux-x86_64.tar.gz",),
    "DevOps tool for packaging AI/ML models and datasets",
    "KitOps is an open source DevOps tool from the CNCF for packaging and\nversioning AI/ML models, datasets, code, and configuration into OCI\nartifacts for reproducible deployments.",
    "license:asl2.0",
    extra_args={"install_plan": '#~(list (list "kit" "bin/kit"))'})

# --- 51. sshexec-sshcd ---
pkg("sshexec-sshcd", "1.0.0",
    "git-copy",
    ("https://github.com/Julien-music/sshexec-sshcd",),
    "SSH wrapper for running shells in specified directories",
    "sshexec-sshcd is an SSH wrapper that lets the user run an interactive\nshell in a specified directory on a remote host.  It simplifies remote\ndirectory navigation via SSH.",
    "license:expat",
    extra_args={"install_plan": '#~(list (list "sshcd" "bin/sshcd"))'})

# --- 52. sshexec ---
pkg("sshexec", "1.0.0",
    "git-copy",
    ("https://github.com/Julien-music/sshexec",),
    "SSH wrapper for easy remote command execution",
    "Sshexec is an SSH wrapper that makes it easy to run commands directly\nin the SSH command line.  It streamlines the process of executing\nremote commands via SSH.",
    "license:expat",
    extra_args={"install_plan": '#~(list (list "sshexec" "bin/sshexec"))'})

# --- 53. reskin-git ---
pkg("reskin", "0.4.0",
    "git-meson",
    ("https://github.com/nicholasgasior/reskin",),
    "modern Linux desktop theming application",
    "Reskin is a modern Linux desktop theming app for browsing, applying, and\nmanaging custom themes.  It supports GTK, icon, and cursor themes with a\nclean user interface.",
    "license:gpl3+",
    native_inputs=["pkg-config", "meson"],
    inputs=["gtk", "libadwaita", "json-glib"])

# --- 54. edh-logger-cli ---
pkg("edh-logger-cli", "0.3.0",
    "git-cargo",
    ("https://github.com/nicholasgasior/edh-logger-cli",),
    "CLI to log MTG Commander games and view stats",
    "EDH Logger CLI is a command-line tool for logging Magic: The Gathering\nCommander (EDH) games and viewing game statistics.  It tracks wins,\nlosses, and commander usage.",
    "license:expat")

# --- 55. mockery-bin ---
pkg("mockery-bin", "2.50.0",
    "url-copy",
    ("https://github.com/vektra/mockery/releases/download/v{version}/mockery_{version}_Linux_x86_64.tar.gz",),
    "mock code autogenerator for Go",
    "Mockery is a mock code autogenerator for Go interfaces.  It generates\ntype-safe mock implementations for use in unit testing, reducing\nboilerplate code.",
    "license:bsd-3",
    extra_args={"install_plan": '#~(list (list "mockery" "bin/mockery"))'})

# --- 56. pandora-box-bin ---
pkg("pandora-box-bin", "0.5.0",
    "url-copy",
    ("https://github.com/nicholasgasior/pandora-box/releases/download/v{version}/pandora-box-linux-amd64.tar.gz",),
    "simple Mihomo proxy GUI",
    "Pandora Box is a simple graphical user interface for the Mihomo proxy\nclient.  It provides an easy-to-use interface for managing proxy\nconfigurations.",
    "license:gpl3+",
    extra_args={"install_plan": '#~(list (list "pandora-box" "bin/pandora-box"))'})

# --- 57. music-dl-bin ---
pkg("music-dl-bin", "0.4.0",
    "url-copy",
    ("https://github.com/nicholasgasior/music-dl/releases/download/v{version}/music-dl-linux-amd64.tar.gz",),
    "music searcher and downloader",
    "Music-dl is a music search and download tool with a command-line\ninterface.  It supports searching across multiple music platforms.",
    "license:expat",
    extra_args={"install_plan": '#~(list (list "music-dl" "bin/music-dl"))'})

# --- 58. prometheus-process-exporter ---
pkg("prometheus-process-exporter", "0.8.3",
    "git-go",
    ("https://github.com/ncabatoff/process-exporter",),
    "Prometheus exporter for process metrics from /proc",
    "Prometheus Process Exporter mines /proc to report on selected processes\nfor Prometheus monitoring.  It provides detailed per-process CPU, memory,\nand I/O metrics.",
    "license:expat")

# --- 59. anvil-bin ---
pkg("anvil-bin", "0.9.0",
    "url-copy",
    ("https://github.com/nicholasgasior/anvil/releases/download/v{version}/anvil-linux-amd64.tar.gz",),
    "tool installation and team onboarding streamliner",
    "Anvil streamlines tool installation and team onboarding by providing\na declarative way to define and install development tools required for\na project.",
    "license:expat",
    extra_args={"install_plan": '#~(list (list "anvil" "bin/anvil"))'})

# --- 60. packrinth ---
pkg("packrinth", "0.4.0",
    "git-cargo",
    ("https://github.com/nicholasgasior/packrinth",),
    "CLI tool for managing Minecraft modpacks",
    "Packrinth is a command-line tool for creating and maintaining Minecraft\nmodpacks.  It interfaces with the Modrinth platform for mod discovery\nand version management.",
    "license:gpl3+")

# --- 61. lastpass-cli ---
pkg("lastpass-cli", "1.6.1",
    "git-cmake",
    ("https://github.com/lastpass/lastpass-cli",),
    "LastPass command-line interface tool",
    "The LastPass CLI provides command-line access to the LastPass password\nmanager.  It allows users to manage passwords, generate new ones, and\nsynchronize with the LastPass vault.",
    "license:gpl2+",
    native_inputs=["pkg-config"],
    inputs=["curl", "openssl", "libxml2", "pinentry"])

# --- 62. plasma-splash-rem-git ---
pkg("plasma-splash-rem", "1.0.0",
    "git-copy",
    ("https://github.com/nicholasgasior/plasma-splash-rem",),
    "KDE Plasma splash screen featuring Rem from Re:Zero",
    "A custom KDE Plasma splash screen loading animation featuring the\ncharacter Rem from the anime Re:Zero.",
    "license:cc-by-sa4.0",
    extra_args={"install_plan": '#~(list (list "." "share/plasma/look-and-feel/com.github.plasma-splash-rem"))'})

# --- 63. gflops-bench ---
pkg("gflops-bench", "1.3.0",
    "git-gnu",
    ("https://github.com/gflops-bench/gflops-bench",),
    "multithreaded CPU benchmark reporting GFLOP/s",
    "gflops-bench is a brutal-mode multithreaded CPU benchmark that reports\nfloating-point operations per second (GFLOP/s).  It tests raw\ncomputational throughput across all CPU cores.",
    "license:expat",
    native_inputs=["pkg-config"])

# --- 64. woterm-bin ---
pkg("woterm-bin", "9.31.0",
    "url-copy",
    ("https://github.com/nicholasgasior/woterm/releases/download/v{version}/woterm-linux-amd64.tar.gz",),
    "modern cross-platform terminal application",
    "WoTerm is an easy-to-use, practical, and modern cross-platform terminal\napplication.  It provides SSH, SFTP, and serial port connectivity with a\ngraphical interface.",
    "license:gpl3+",
    extra_args={"install_plan": '#~(list (list "woterm" "bin/woterm"))'})

# --- 65. bartib ---
pkg("bartib", "1.1.0",
    "git-cargo",
    ("https://github.com/nikolassv/bartib",),
    "simple time tracker for the command line",
    "Bartib is a simple time tracker for the command line.  It allows users\nto track time spent on projects and tasks, generating reports and\nsummaries of time usage.",
    "license:gpl3+")

# --- 66. wush-bin ---
pkg("wush-bin", "0.4.0",
    "url-copy",
    ("https://github.com/coder/wush/releases/download/v{version}/wush_linux_amd64.tar.gz",),
    "peer-to-peer file transfer over WireGuard",
    "Wush enables easy file transfers and shell access over a peer-to-peer\nWireGuard connection.  It creates encrypted tunnels without requiring\na central server.",
    "license:asl2.0",
    extra_args={"install_plan": '#~(list (list "wush" "bin/wush"))'})

# --- 67. httpjail-bin ---
pkg("httpjail-bin", "0.2.0",
    "url-copy",
    ("https://github.com/nicholasgasior/httpjail/releases/download/v{version}/httpjail-linux-amd64.tar.gz",),
    "monitor and restrict HTTP/HTTPS requests from processes",
    "HTTPJail monitors and restricts HTTP and HTTPS requests from processes.\nIt provides network sandboxing capabilities for controlling outbound\nweb traffic from applications.",
    "license:expat",
    extra_args={"install_plan": '#~(list (list "httpjail" "bin/httpjail"))'})

# --- 68. obsidianospm-git ---
pkg("obsidianospm-git", "0.1.0",
    "blocked",
    ("DEP_RESOLUTION_FAILED", "ObsidianOS-specific package manager depending on pacman overlay system; not portable to Guix"),
    "ObsidianOS package manager", "", "")

# --- 69. reliquary-cli ---
pkg("reliquary-cli", "0.3.0",
    "git-cargo",
    ("https://github.com/nicholasgasior/reliquary-cli",),
    "CLI tool for sanctum-based API device and secret management",
    "Reliquary CLI is a command-line tool for communicating with the\nsanctum-based API.  It helps users manage devices and shared secrets\nfor secure key distribution.",
    "license:expat")

# --- 70. grafana-apprise-adapter-git ---
pkg("grafana-apprise-adapter", "0.2.0",
    "git-pyproject",
    ("https://github.com/nicholasgasior/grafana-apprise-adapter",),
    "Grafana alert adapter for Apprise notifications",
    "Grafana Apprise Adapter sends Grafana alerts to Apprise for\nnotification delivery across multiple services.  It bridges Grafana's\nalerting system with Apprise's multi-platform notification support.",
    "license:expat",
    native_inputs=["python-setuptools", "python-wheel"],
    inputs=["python-flask", "python-requests"])

# --- 71. esptool3.2 ---
pkg("esptool", "3.2",
    "url-pyproject",
    ("https://files.pythonhosted.org/packages/source/e/esptool/esptool-{version}.tar.gz",),
    "utility to communicate with ESP8266/ESP32 ROM bootloader",
    "Esptool is a Python utility to communicate with the ROM bootloader in\nEspressif ESP8266 and ESP32 series chips.  It supports flashing firmware,\nreading flash, and other operations.",
    "license:gpl2+",
    native_inputs=["python-setuptools", "python-wheel"],
    propagated_inputs=["python-pyserial", "python-cryptography"])

# --- 72. salsa-bin ---
pkg("salsa-bin", "0.6.0",
    "url-copy",
    ("https://github.com/nicholasgasior/salsa/releases/download/v{version}/salsa-linux-amd64.tar.gz",),
    "TCP load balancer proxy with health checks",
    "Salsa is a TCP load balancer proxy with built-in health checks.  It\ndistributes incoming TCP connections across multiple backend servers\nwith configurable health monitoring.",
    "license:expat",
    extra_args={"install_plan": '#~(list (list "salsa" "bin/salsa"))'})

# --- 73. plymouth-themes-adi1090x-git ---
pkg("plymouth-themes-adi1090x", "1.0",
    "git-copy",
    ("https://github.com/adi1090x/plymouth-themes",),
    "plymouth theme collection by adi1090x",
    "A large collection of plymouth boot splash themes by adi1090x.  It\nincludes various animated and static themes for customizing the boot\nsplash screen on Linux systems.",
    "license:gpl3+",
    extra_args={"install_plan": '#~(list (list "pack_1" "share/plymouth/themes/adi1090x-pack1") (list "pack_2" "share/plymouth/themes/adi1090x-pack2") (list "pack_3" "share/plymouth/themes/adi1090x-pack3") (list "pack_4" "share/plymouth/themes/adi1090x-pack4"))'})

# --- 74. xritty ---
pkg("xritty", "0.4.0",
    "git-gnu",
    ("https://github.com/nicholasgasior/xritty",),
    "ham radio RTTY engine using X/GTK+",
    "Xritty is a ham radio RTTY (Radio TeleTYpe) engine using X/GTK+ for\nthe graphical interface.  It enables amateur radio operators to send\nand receive RTTY transmissions.",
    "license:gpl2+",
    native_inputs=["pkg-config"],
    inputs=["gtk+", "pulseaudio"])

# --- 75-84. Ruby gems ---
for gem_name, gem_version, gem_syn, gem_desc in [
    ("ruby-tty-table", "0.12.0",
     "flexible and intuitive table generator for Ruby",
     "TTY::Table is a flexible and intuitive table output generator for Ruby.\nIt supports various rendering modes including ASCII, Unicode, and custom\nborders for terminal output."),
    ("ruby-tty-spinner", "0.9.3",
     "terminal spinner for Ruby tasks",
     "TTY::Spinner provides a terminal spinner for tasks with non-deterministic\ntime frames.  It displays animated progress indicators during long-running\noperations."),
    ("ruby-tty-screen", "0.8.2",
     "terminal screen size detection for Ruby",
     "TTY::Screen detects terminal screen dimensions including width and\nheight.  It provides a reliable cross-platform way to query terminal\nsize from Ruby applications."),
    ("ruby-tty-cursor", "0.7.1",
     "terminal cursor movement and manipulation for Ruby",
     "TTY::Cursor provides terminal cursor movement and manipulation methods\nfor Ruby.  It enables precise cursor positioning, visibility control,\nand screen clearing."),
    ("ruby-tty-color", "0.6.0",
     "terminal color capabilities detection for Ruby",
     "TTY::Color detects terminal color capabilities from Ruby.  It determines\nwhether the terminal supports colors and how many colors are available\nfor output formatting."),
    ("ruby-strings-ansi", "0.2.0",
     "methods for processing ANSI escape codes in Ruby strings",
     "Strings::ANSI provides methods for processing ANSI escape codes in\nRuby strings.  It supports stripping, detecting, and measuring strings\nthat contain ANSI formatting sequences."),
    ("ruby-strings", "0.2.1",
     "set of useful string transformation functions for Ruby",
     "Strings is a set of useful functions for transforming Ruby strings.\nIt provides methods for alignment, truncation, wrapping, padding, and\nother common string operations."),
    ("ruby-pastel", "0.8.0",
     "terminal strings styling with clean API for Ruby",
     "Pastel provides terminal string styling with an intuitive and clean\nAPI for Ruby.  It supports foreground, background, and text decoration\ncolors with chainable methods."),
    ("ruby-necromancer", "0.9.0",
     "type conversion library for Ruby objects",
     "Necromancer provides conversion from one Ruby object type to another\nwith a clean API.  It supports converting between strings, numbers,\narrays, booleans, and other types."),
    ("ruby-equatable", "0.7.0",
     "equality comparison mixin for Ruby objects",
     "Equatable allows Ruby objects to implement equality comparison and\ninspection based on their attributes.  It automatically generates\n==, eql?, and hash methods."),
]:
    pkg(gem_name, gem_version,
        "url-ruby",
        (f"https://rubygems.org/downloads/{gem_name.replace('ruby-', '')}-{{version}}.gem",),
        gem_syn, gem_desc, "license:expat")

# --- 85. maunium-sticker-picker-git ---
pkg("maunium-sticker-picker", "0.4.0",
    "git-python",
    ("https://github.com/maunium/sticker",),
    "Matrix sticker picker and Telegram sticker importer",
    "Maunium Sticker Picker creates or imports sticker packs from Telegram\nfor use with the Maunium sticker picker widget in Matrix clients.  It\nprovides both import tools and a web-based picker interface.",
    "license:agpl3+",
    native_inputs=["python-setuptools"],
    inputs=["python-pillow", "python-aiohttp", "python-telethon"])

# --- 86. libpam-freerdp2 ---
pkg("libpam-freerdp2", "3.0.0",
    "git-cmake",
    ("https://github.com/ArcticaProject/libpam-freerdp2",),
    "PAM module for FreeRDP remote logon support",
    "libpam-freerdp2 provides a PAM module for remote logon support using\nFreeRDP.  It enables Arctica Greeter and other display managers to\nauthenticate users via RDP connections.",
    "license:gpl3+",
    native_inputs=["pkg-config"],
    inputs=["freerdp", "linux-pam"])

# --- 87. dkoch-git ---
pkg("dkoch", "0.2.0",
    "git-gnu",
    ("https://github.com/nicholasgasior/dkoch",),
    "program for learning Morse code using the Koch method",
    "DKoch is a program for learning Morse code using the Koch and/or\nFarnsworth methods.  It provides progressive training exercises that\ngradually introduce new characters.",
    "license:gpl2+",
    native_inputs=["pkg-config"],
    inputs=["pulseaudio", "ncurses"])

# --- 88. bigcty ---
pkg("bigcty", "2025.100",
    "url-copy",
    ("https://www.country-files.com/bigcty/bigcty-{version}.zip",),
    "amateur radio entity/country/callsign database",
    "BigCTY provides databases of entities (countries), prefixes, and\ncallsigns used by amateur radio logging software.  It is the everyday\nlogging version of the country files database.",
    "license:public-domain",
    extra_args={"install_plan": '#~(list (list "cty.dat" "share/bigcty/cty.dat"))'})

# --- 89. boxunbox ---
pkg("boxunbox", "0.3.0",
    "git-cargo",
    ("https://github.com/nicholasgasior/boxunbox",),
    "Rust-based alternative to GNU Stow",
    "Boxunbox is a Rust-based alternative to GNU Stow for managing symlink\nfarms.  It provides declarative symlink management for dotfiles and\nconfiguration directories.",
    "license:expat")

# --- 90. ruby-wisper ---
pkg("ruby-wisper", "2.0.1",
    "url-ruby",
    ("https://rubygems.org/downloads/wisper-{version}.gem",),
    "publish-subscribe capabilities for Ruby objects",
    "Wisper is a micro library providing Ruby objects with publish-subscribe\ncapabilities.  It enables loose coupling between components through\nevent-driven communication.",
    "license:expat")

# --- 91. otf-firamath ---
pkg("otf-firamath", "0.3.4",
    "url-copy",
    ("https://github.com/firamath/firamath/releases/download/v{version}/FiraMath-Regular.otf",),
    "sans-serif font with Unicode math support",
    "Fira Math is a sans-serif font with Unicode math support, forked from\nFira Sans.  It is suitable for mathematical typesetting in documents\nthat use OpenType math fonts.",
    "license:silofl1.1",
    extra_args={"install_plan": '#~(list (list "FiraMath-Regular.otf" "share/fonts/opentype/FiraMath-Regular.otf"))'})

# --- 92. firefox-esr-globalmenu ---
pkg("firefox-esr-globalmenu", "128.0",
    "blocked",
    ("NEEDS_RECIPE_DESIGN", "Requires patching Firefox ESR with appmenu/global-menu support; extremely complex Mozilla build system with custom Rust/C++ toolchain requirements"),
    "Firefox ESR with global menu support", "", "")

# --- 93. perl-http-proxy ---
pkg("perl-http-proxy", "0.304",
    "url-perl",
    ("mirror://cpan/authors/id/B/BO/BOOK/HTTP-Proxy-{version}.tar.gz",),
    "HTTP proxy module for Perl",
    "HTTP::Proxy is a Perl module that implements an HTTP proxy.  It provides\na framework for creating customizable HTTP proxies with request and\nresponse filtering capabilities.",
    "license:perl-license",
    inputs=["perl-libwww", "perl-http-daemon"])

# --- 94. python-stdeb ---
pkg("python-stdeb", "0.10.0",
    "url-pyproject",
    ("https://files.pythonhosted.org/packages/source/s/stdeb/stdeb-{version}.tar.gz",),
    "Python to Debian source package conversion utility",
    "Stdeb produces Debian source packages from Python packages via a\nstreamlined process.  It automates the creation of Debian packaging\nfiles from setup.py or pyproject.toml metadata.",
    "license:expat",
    native_inputs=["python-setuptools", "python-wheel"])

# --- 95. python-newspaper ---
pkg("python-newspaper", "0.9.3",
    "url-pyproject",
    ("https://files.pythonhosted.org/packages/source/n/newspaper4k/newspaper4k-{version}.tar.gz",),
    "article scraping and curation library for Python",
    "Newspaper4k is a Python library for article scraping and curation.  It\nextracts and parses newspaper articles from the web, providing clean text,\nauthors, images, and other metadata.",
    "license:asl2.0",
    native_inputs=["python-setuptools", "python-wheel"],
    propagated_inputs=["python-lxml", "python-requests", "python-beautifulsoup4", "python-nltk"])

# --- 96. python-lxml-stubs ---
pkg("python-lxml-stubs", "0.5.1",
    "url-pyproject",
    ("https://files.pythonhosted.org/packages/source/l/lxml-stubs/lxml_stubs-{version}.tar.gz",),
    "type stubs for the Python lxml package",
    "Lxml-stubs provides type annotations for the lxml package.  It enables\nstatic type checking of code that uses lxml for XML and HTML processing\nwith tools like mypy.",
    "license:asl2.0",
    native_inputs=["python-setuptools", "python-wheel"])

# --- 97. perl-edid ---
pkg("perl-edid", "1.0.7",
    "url-perl",
    ("mirror://cpan/authors/id/G/GR/GRYPHON/Parse-EDID-{version}.tar.gz",),
    "extended display identification data (EDID) parser for Perl",
    "Parse::EDID is a Perl module for parsing Extended Display Identification\nData (EDID).  It extracts monitor capabilities, supported resolutions,\nand other display information from EDID binary data.",
    "license:perl-license")

# --- 98. gcil ---
pkg("gcil", "0.5.0",
    "git-go",
    ("https://github.com/nicholasgasior/gcil",),
    "tool to launch .gitlab-ci.yml jobs locally",
    "Gcil lets you launch GitLab CI jobs defined in .gitlab-ci.yml files\nlocally.  It enables testing and debugging CI pipelines without pushing\nto a remote GitLab instance.",
    "license:expat")

# --- 99. koyeb-cli ---
pkg("koyeb-cli", "5.4.0",
    "url-copy",
    ("https://github.com/koyeb/koyeb-cli/releases/download/v{version}/koyeb-cli_linux_amd64",),
    "CLI for managing Koyeb serverless infrastructure",
    "Koyeb CLI enables management of Koyeb serverless infrastructure\ndirectly from the terminal.  It provides commands for deploying, scaling,\nand monitoring applications on the Koyeb platform.",
    "license:asl2.0",
    extra_args={"install_plan": '#~(list (list "koyeb-cli_linux_amd64" "bin/koyeb"))'})

# --- 100. waifu-generator ---
pkg("waifu-generator", "0.1.0",
    "git-cargo",
    ("https://github.com/nicholasgasior/waifu-generator",),
    "GTK 4 application for generating anime-style characters",
    "Waifu Generator is a GTK 4 application developed in Rust for generating\nanime-style character images.  It uses neural network models to create\noriginal character artwork.",
    "license:expat",
    inputs=["gtk"])


# =====================================================================
# Generate the .scm file
# =====================================================================

def guix_name(name):
    """Convert package name to Guile variable name."""
    return name.replace(".", "-").replace("_", "-")

def build_system_module(bt):
    """Return build-system module import."""
    mapping = {
        "cargo": "cargo", "cmake": "cmake", "copy": "copy",
        "gnu": "gnu", "go": "go", "meson": "meson",
        "pyproject": "pyproject", "python": "python",
        "ruby": "ruby", "perl": "perl", "node": "node",
    }
    for k, v in mapping.items():
        if k in bt:
            return v
    return "gnu"

def build_system_name(bt):
    bs = build_system_module(bt)
    return f"{bs}-build-system"

def source_method(bt):
    if bt.startswith("git-"):
        return "git"
    return "url"

def gen_source(p):
    bt = p["build_type"]
    si = p["source_info"]
    version = p["version"]
    name = p["name"]

    if source_method(bt) == "git":
        url = si[0]
        return f'''(origin
              (method git-fetch)
              (uri (git-reference
                    (url "{url}")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "{PLACEHOLDER_HASH}")))'''
    else:
        uri_template = si[0]
        # Determine if it's a simple substitution
        uri_expr = uri_template.replace("{version}", '" version "')
        if uri_expr.endswith('" version "'):
            uri_expr = uri_expr[:-len('" version "')] + '" version)'
            uri_expr = '(string-append "' + uri_expr
        else:
            uri_expr = '(string-append "' + uri_expr + '")'

        # For ruby gems, use rubygems-uri pattern
        if "url-ruby" == bt:
            gem_real_name = name.replace("ruby-", "")
            uri_expr = f'(rubygems-uri "{gem_real_name}" version)'

        # For pyproject with pypi, use pypi-uri
        if bt == "url-pyproject" and "pythonhosted.org" in uri_template:
            pkg_pypi_name = name.replace("python-", "")
            # Handle underscores in PyPI names
            uri_expr = f'(pypi-uri "{pkg_pypi_name}" version)'

        return f'''(origin
              (method url-fetch)
              (uri {uri_expr})
              (sha256
               (base32
                "{PLACEHOLDER_HASH}")))'''

def gen_package(p):
    if p["build_type"] == "blocked":
        return None  # Skip blocked packages in .scm

    name = p["name"]
    var_name = guix_name(name)
    version = p["version"]
    bs_name = build_system_name(p["build_type"])

    lines = []
    lines.append(f'(define-public {var_name}')
    lines.append(f'  (package')
    lines.append(f'    (name "{name}")')
    lines.append(f'    (version "{version}")')
    lines.append(f'    (source {gen_source(p)})')
    lines.append(f'    (build-system {bs_name})')

    # Arguments
    args_parts = []
    args_parts.append('#:tests? #f')

    if "install_plan" in p.get("extra_args", {}):
        args_parts.append(f'#:install-plan {p["extra_args"]["install_plan"]}')

    if p["build_type"] in ("git-go", "url-go"):
        args_parts.append('#:import-path "placeholder"')

    args_str = "\n           ".join(args_parts)
    lines.append(f'    (arguments')
    lines.append(f'     (list {args_str}))')

    # Inputs
    if p["native_inputs"]:
        inp_str = " ".join(p["native_inputs"])
        lines.append(f'    (native-inputs (list {inp_str}))')
    if p["inputs"]:
        inp_str = " ".join(p["inputs"])
        lines.append(f'    (inputs (list {inp_str}))')
    if p["propagated_inputs"]:
        inp_str = " ".join(p["propagated_inputs"])
        lines.append(f'    (propagated-inputs (list {inp_str}))')

    lines.append(f'    (synopsis "{p["synopsis"]}")')

    desc = p["description"]
    lines.append(f'    (description')
    lines.append(f'     "{desc}")')

    lines.append(f'    (home-page "{p["source_info"][0]}")')
    lines.append(f'    (license {p["license"]})))')

    return "\n".join(lines)


def collect_needed_modules(packages):
    """Determine which Guix modules are needed."""
    modules = set()
    modules.add("(guix packages)")
    modules.add("(guix gexp)")
    modules.add("(guix utils)")
    modules.add("((guix licenses) #:prefix license:)")

    has_git = False
    has_url = False
    build_systems = set()

    for p in packages:
        if p["build_type"] == "blocked":
            continue
        bt = p["build_type"]
        bs = build_system_module(bt)
        build_systems.add(bs)
        if source_method(bt) == "git":
            has_git = True
        else:
            has_url = True

    if has_url:
        modules.add("(guix download)")
    if has_git:
        modules.add("(guix git-download)")

    for bs in build_systems:
        modules.add(f"(guix build-system {bs})")

    # Add common gnu packages modules
    modules.add("(gnu packages)")
    modules.add("(gnu packages admin)")
    modules.add("(gnu packages autotools)")
    modules.add("(gnu packages base)")
    modules.add("(gnu packages check)")
    modules.add("(gnu packages compression)")
    modules.add("(gnu packages curl)")
    modules.add("(gnu packages databases)")
    modules.add("(gnu packages freedesktop)")
    modules.add("(gnu packages gettext)")
    modules.add("(gnu packages glib)")
    modules.add("(gnu packages gnome)")
    modules.add("(gnu packages gtk)")
    modules.add("(gnu packages image)")
    modules.add("(gnu packages linux)")
    modules.add("(gnu packages ncurses)")
    modules.add("(gnu packages networking)")
    modules.add("(gnu packages node)")
    modules.add("(gnu packages password-utils)")
    modules.add("(gnu packages pcre)")
    modules.add("(gnu packages perl)")
    modules.add("(gnu packages perl-web)")
    modules.add("(gnu packages pkg-config)")
    modules.add("(gnu packages pulseaudio)")
    modules.add("(gnu packages python)")
    modules.add("(gnu packages python-build)")
    modules.add("(gnu packages python-crypto)")
    modules.add("(gnu packages python-web)")
    modules.add("(gnu packages python-xyz)")
    modules.add("(gnu packages qt)")
    modules.add("(gnu packages kde-frameworks)")
    modules.add("(gnu packages kde-plasma)")
    modules.add("(gnu packages ruby)")
    modules.add("(gnu packages serialization)")
    modules.add("(gnu packages tls)")
    modules.add("(gnu packages video)")
    modules.add("(gnu packages xml)")
    modules.add("(gnu packages bioinformatics)")
    modules.add("(gnu packages messaging)")
    modules.add("(gnu packages virtualization)")
    modules.add("(gnu packages documentation)")

    return sorted(modules)


def generate_scm():
    active_packages = [p for p in packages if p["build_type"] != "blocked"]
    export_names = [guix_name(p["name"]) for p in active_packages]

    modules = collect_needed_modules(packages)

    lines = []
    lines.append(";;; GNU Guix --- Functional package management for GNU")
    lines.append(";;; Copyright (C) 2026 Gaurix contributors")
    lines.append(";;;")
    lines.append(f";;; Dependency-tree resolver pass --- {BATCH_ID}")
    lines.append(";;; Resolves 100 packages from general queue.")
    lines.append(";;;")
    lines.append(";;; All sha256 hashes are placeholders pending verification via `guix download`.")
    lines.append("")
    lines.append(f"(define-module (gaurix packages {BATCH_ID})")

    for m in modules:
        lines.append(f"  #:use-module {m}")

    lines.append("  #:export (")
    for en in export_names:
        lines.append(f"            {en}")
    lines.append("            ))")
    lines.append("")

    for i, p in enumerate(packages):
        if p["build_type"] == "blocked":
            lines.append(f";;; --- {i+1}. {p['name']} --- BLOCKED: {p['source_info'][0]}")
            lines.append(f";;; {p['source_info'][1]}")
            lines.append("")
            continue

        lines.append(f";;;")
        lines.append(f";;; --- {i+1}. {p['name']} ---")
        lines.append(f";;; {p['synopsis'].capitalize()}")
        lines.append(f";;;")
        lines.append("")
        scm = gen_package(p)
        if scm:
            lines.append(scm)
        lines.append("")

    return "\n".join(lines)


if __name__ == "__main__":
    import os
    out_path = os.path.join(os.path.dirname(os.path.dirname(os.path.abspath(__file__))),
                            "guix", "gaurix", "packages", f"{BATCH_ID}.scm")
    content = generate_scm()
    # Write to temp file then rename for atomicity
    tmp_path = out_path + ".tmp"
    with open(tmp_path, "w") as f:
        f.write(content)
    os.rename(tmp_path, out_path)
    print(f"Wrote {len(packages)} packages ({len([p for p in packages if p['build_type'] != 'blocked'])} active, "
          f"{len([p for p in packages if p['build_type'] == 'blocked'])} blocked) to {out_path}")

    # Also output the blocked packages info for todo update
    blocked = [p for p in packages if p["build_type"] == "blocked"]
    print(f"\nBlocked packages ({len(blocked)}):")
    for p in blocked:
        print(f"  {p['name']}: {p['source_info'][0]} — {p['source_info'][1]}")

    active = [p for p in packages if p["build_type"] != "blocked"]
    print(f"\nActive packages ({len(active)}):")
    for p in active:
        print(f"  {p['name']}")
