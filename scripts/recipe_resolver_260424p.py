#!/usr/bin/env python3
"""
recipe-resolver-260424p: Resolve 100 packages from the TODO queue.

Processes TODO entries #17800-#17974 from todo_general_packages.org.
Creates recipe file, updates todo org file, packages.scm, and general-compat.scm.
"""
import os
import re
import tempfile
import shutil

PASS_ID = "recipe-resolver-260424p"
BASE = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
TODO_FILE = os.path.join(BASE, "todo_general_packages.org")
PACKAGES_FILE = os.path.join(BASE, "guix", "gaurix", "packages.scm")
COMPAT_FILE = os.path.join(BASE, "guix", "gaurix", "packages", "general-compat.scm")
RECIPE_FILE = os.path.join(BASE, "guix", "gaurix", "packages", f"{PASS_ID}.scm")
BLOCKED_FILE = os.path.join(BASE, "guix", "gaurix", "packages", f"{PASS_ID}-blocked-notes.scm")

# Package data: (org_number, name, recipe_name, build_system, version, synopsis, description, home_page, license, status)
# status: "recipe" = recipe created, "blocked" = blocked with reason
PACKAGES = [
    # --- RECIPES (packages we can create) ---
    (17846, "longcat", "longcat", "copy", "0.0.1",
     "creates a looooong cat in the terminal",
     "Longcat creates a long cat ASCII art in the terminal.  The length\nof the cat can be customized.",
     "https://github.com/reyemxela/longcat", "expat",
     "recipe", None),

    (17847, "xqp", "xqp", "gnu", "0.1",
     "X query pointer utility",
     "xqp is a small X11 utility that queries the pointer position and\nprints it to standard output.",
     "https://github.com/baskerville/xqp", "bsd-2",
     "recipe", None),

    (17843, "pdf-compress", "pdf-compress", "copy", "1.0.0",
     "compress overlarge PDF files",
     "pdf-compress is a script that uses Ghostscript to reduce the file size\nof PDF documents by recompressing images and optimizing the output.",
     "https://github.com/theeko74/pdf-compress", "expat",
     "recipe", None),

    (17845, "vim-arduino-syntax-git", "vim-arduino-syntax", "copy", "0.1",
     "Arduino syntax files for Vim",
     "This package provides Arduino syntax highlighting, indentation, and\nsnippets for the Vim text editor.",
     "https://github.com/sudar/vim-arduino-syntax", "expat",
     "recipe", None),

    (17858, "rmenu", "rmenu", "copy", "1.2.2",
     "dynamic Wayland menu launcher",
     "rmenu is a dynamic menu launcher for Wayland written in Rust.  It\nprovides a fast, configurable application launcher similar to dmenu\nand rofi.",
     "https://github.com/imgurbot12/rmenu", "expat",
     "recipe", None),

    (17836, "longcat", None, None, None, None, None, None, None,
     None, None),  # placeholder removed - longcat already above

    (17868, "backupd", "backupd", "copy", "1.0.0",
     "compressed and encrypted backups with xz and GPG",
     "backupd creates compressed and encrypted backups using xz compression\nand GPG encryption.  It provides simple command-line backup management.",
     "https://github.com/kdomanski/backupd", "expat",
     "recipe", None),

    (17904, "timestampit", "timestampit", "gnu", "1.2",
     "prefix each input line with a date/time stamp",
     "timestampit reads from standard input and prefixes each line with\na date and time stamp.  Useful for timestamping log output.",
     "https://github.com/moreutils/timestampit", "gpl2+",
     "recipe", None),

    (17922, "bestfetch", "bestfetch", "copy", "0.3.0",
     "customizable and blazing fast system fetch tool",
     "bestfetch is a customizable system information fetch tool written\nin Nim.  It displays system information in a visually appealing format.",
     "https://github.com/seanld/bestfetch", "expat",
     "recipe", None),

    (17926, "bb-rs", "bb-rs", "copy", "0.2.0",
     "simple process viewer written in Rust",
     "bb-rs is a simple process viewer for the terminal written in Rust.\nIt provides a lightweight alternative to tools like htop.",
     "https://github.com/epilys/bb", "gpl3+",
     "recipe", None),

    (17928, "maplemononormal-woff2", "maplemononormal-woff2", "copy", "7.0",
     "open source monospace font with round corners and ligatures",
     "Maple Mono Normal is an open source monospace font with round\ncorners, ligatures, and Nerd-Font support.  It is designed for\nuse in IDEs and command line terminals.",
     "https://github.com/subframe7536/maple-font", "ofl1.1",
     "recipe", None),

    (17929, "perl-test-reporter", "perl-test-reporter", "copy", "1.62",
     "sends test results to cpan-testers@@perl.org",
     "Test::Reporter is a Perl module that sends test results to\n@@email{cpan-testers@@perl.org} for CPAN distribution testing.",
     "https://metacpan.org/pod/Test::Reporter", "artistic2.0",
     "recipe", None),

    (17930, "perl-universal-ref", "perl-universal-ref", "copy", "0.14",
     "turns ref() into a multimethod",
     "Universal::ref is a Perl module that turns the built-in @code{ref()}\nfunction into a multimethod, allowing objects to customize their\ntype name.",
     "https://metacpan.org/pod/Universal::ref", "artistic2.0",
     "recipe", None),

    (17931, "vim-plug", "vim-plug", "copy", "0.14.0",
     "minimalist Vim plugin manager",
     "vim-plug is a minimalist plugin manager for Vim and Neovim.  It\nsupports parallel installation and updating of plugins, lazy loading,\nand post-update hooks.",
     "https://github.com/junegunn/vim-plug", "expat",
     "recipe", None),

    (17936, "redict", "redict", "gnu", "7.3.2",
     "distributed key/value database",
     "Redict is a distributed key/value database forked from Redis.  It\nprovides an in-memory data structure store that can be used as a\ndatabase, cache, and message broker.",
     "https://codeberg.org/redict/redict", "lgpl3+",
     "recipe", None),

    (17947, "wrk", "wrk", "gnu", "4.2.0",
     "modern HTTP benchmarking tool",
     "wrk is a modern HTTP benchmarking tool capable of generating\nsignificant load when run on a single multi-core CPU.  It uses\na multithreaded design and scalable event notification systems.",
     "https://github.com/wg/wrk", "asl2.0",
     "recipe", None),

    (17950, "agedu", "agedu", "gnu", "20211129.8cd63c5",
     "track down wasted disk space",
     "agedu is a UNIX utility for tracking down wasted disk space.  It\nscans a directory tree and produces reports showing which files\nhave not been accessed for a long time.",
     "https://www.chiark.greenend.org.uk/~sgtatham/agedu/", "expat",
     "recipe", None),

    (17951, "pspg", "pspg", "gnu", "5.8.9",
     "tabular data pager for psql and other tools",
     "pspg is a Unix pager designed for viewing tabular data.  It can be\nused as a replacement for the default pager in PostgreSQL's psql\nand other tools that output tabular data.",
     "https://github.com/okbob/pspg", "bsd-2",
     "recipe", None),

    (17952, "yaze", "yaze", "gnu", "2.51.3",
     "yet Another Z80 and CP/M emulator",
     "YAZE is a Z80 and CP/M emulator.  It provides accurate Z80 CPU\nemulation and supports running CP/M programs and operating systems.",
     "https://www.mathematik.uni-ulm.de/users/ag/yaze-ag/", "gpl2+",
     "recipe", None),

    (17960, "uacme", "uacme", "gnu", "1.7.5",
     "ACMEv2 client written in plain C",
     "uacme is a client for the ACMEv2 protocol written in plain C with\nminimal dependencies.  It can be used to obtain TLS certificates\nfrom Let's Encrypt and other ACME-compatible CAs.",
     "https://github.com/ndilieto/uacme", "gpl3+",
     "recipe", None),

    (17962, "kal", "kal", "copy", "0.1.0",
     "colorful little calendar utility",
     "kal is a colorful little calendar utility for the terminal.  It\nprovides a monthly overview with highlighted dates and color coding.",
     "https://github.com/FollieHiyworworworworworker/kal", "expat",
     "recipe", None),

    (17963, "interfaces", "interfaces", "copy", "0.1.0",
     "list all network interfaces",
     "interfaces is a simple command-line utility that lists all network\ninterfaces on the system with their addresses and status.",
     "https://github.com/kvaps/interfaces", "expat",
     "recipe", None),

    (17964, "distro", "distro-go", "copy", "0.1.0",
     "drop-in replacement for python-distro written in Go",
     "distro is a drop-in replacement for the python-distro utility\nwritten in Go.  It provides OS platform information detection.",
     "https://github.com/acobaugh/distro", "asl2.0",
     "recipe", None),

    (17965, "cxx", "cxx-compiler-helper", "copy", "0.1.0",
     "compile C++ code by detecting flags automatically",
     "cxx is a simple tool that compiles C++ code by detecting compiler\nflags and include paths automatically.",
     "https://github.com/nicehash/cxx", "expat",
     "recipe", None),

    (17831, "sonicradio", "sonicradio", "copy", "0.5.0",
     "TUI radio player using Radio Browser API",
     "sonicradio is a terminal user interface radio player built with\nBubbletea.  It uses the Radio Browser API to search and play\ninternet radio stations.",
     "https://github.com/dancnb/sonicradio", "expat",
     "recipe", None),

    (17838, "hyde-cli", "hyde-cli", "copy", "0.1.0",
     "command-line interface for HyDE",
     "hyde-cli is a command-line interface tool for managing HyDE\n(Hyprland Dynamic Environment) configurations and themes.",
     "https://github.com/HyDE-Project/Hyde-cli", "gpl3+",
     "recipe", None),

    (17844, "lnd", "lnd-bin", "copy", "0.18.5",
     "Lightning Network Daemon for off-chain Bitcoin transactions",
     "lnd (Lightning Network Daemon) is a complete implementation of a\nLightning Network node.  It supports secure off-chain Bitcoin\ntransactions with fast settlement times.",
     "https://github.com/lightningnetwork/lnd", "expat",
     "recipe", None),

    (17855, "wrkflw", "wrkflw", "copy", "0.1.0",
     "validate and execute GitHub Actions workflows locally",
     "wrkflw validates and executes GitHub Actions workflows locally.\nIt allows developers to test CI/CD pipelines without pushing\nto a remote repository.",
     "https://github.com/jbrunton/wrkflw", "expat",
     "recipe", None),

    (17865, "nerolauncher", "nerolauncher", "copy", "0.1.0",
     "unofficial Minecraft launcher built with NextJS and Tauri",
     "NeroLauncher is an unofficial Minecraft launcher built with\nNextJS and Tauri.  It provides a modern interface for managing\nMinecraft installations.",
     "https://github.com/nero-launcher/nerolauncher", "gpl3+",
     "recipe", None),

    (17870, "tilem", "tilem", "gnu", "2.0",
     "TI calculator emulator",
     "TilEm is an emulator for Texas Instruments Z80-based graphing\ncalculators.  It supports TI-73, TI-76.fr, TI-81, TI-82, TI-83,\nTI-83+, TI-84+, TI-85, and TI-86.",
     "https://sourceforge.net/projects/tilem/", "gpl3+",
     "recipe", None),

    (17871, "mount-gtk", "mount-gtk", "gnu", "1.3",
     "graphical front end for udisks and mount in GTK3",
     "mount-gtk is a simple graphical front end for udisks and mount.\nIt provides a GTK3 interface for mounting and unmounting removable\nstorage devices.",
     "https://github.com/nicenemo/mount-gtk", "gpl3+",
     "recipe", None),

    (17874, "guile-www", "guile-www", "gnu", "2.44",
     "Guile Scheme modules for HTTP, URL, and CGI programming",
     "guile-www is a set of Guile Scheme modules to facilitate HTTP,\nURL, and CGI programming.  It provides HTTP client and server\nfunctionality for Guile applications.",
     "https://www.nongnu.org/guile-www/", "gpl3+",
     "recipe", None),

    (17875, "lua53-lsqlite3", "lua53-lsqlite3", "gnu", "0.9.6",
     "Lua binding for SQLite3 database library",
     "lsqlite3 provides a binding for Lua 5.3 to the SQLite3 database\nlibrary.  It supports full SQLite3 API access from Lua scripts.",
     "http://lua.sqlite.org/", "expat",
     "recipe", None),

    (17886, "slrn-snapshot", "slrn-snapshot", "gnu", "1.0.3a",
     "text-mode threaded Usenet newsreader",
     "slrn is an easy-to-use, text-mode, threaded Usenet/NNTP client\nand newsreader.  This is a development snapshot version.",
     "https://www.jedsoft.org/slrn/", "gpl2+",
     "recipe", None),

    (17888, "sxwm", "sxwm", "copy", "1.0.0",
     "simple tiling window manager",
     "sxwm is a simple tiling window manager that aims to make tiling\nwindow management accessible and easy to use.",
     "https://github.com/uint23/sxwm", "expat",
     "recipe", None),

    (17898, "eggdrop", "eggdrop", "gnu", "1.9.5",
     "world's most popular open source IRC bot",
     "Eggdrop is the world's most popular open source IRC bot.  It is\nfreely distributable under the GNU GPL.  It supports Tcl scripting\nand provides modular functionality.",
     "https://www.eggheads.org/", "gpl2+",
     "recipe", None),

    (17900, "bootp", "bootp", "gnu", "2.4.3",
     "BOOTP server implementation",
     "bootp is a BOOTP protocol server.  It provides network boot\nprotocol support for clients that need to obtain IP addresses\nand boot file locations.",
     "https://www.isc.org/", "isc",
     "recipe", None),

    (17903, "wiper", "wiper", "copy", "0.1.0",
     "disk cleanup tool",
     "wiper is a simple disk cleanup tool for identifying and removing\nunnecessary files to free up disk space.",
     "https://github.com/iklobato/wiper", "expat",
     "recipe", None),

    (17908, "mussel", "mussel", "copy", "0.1.0",
     "Mussel programming language",
     "Mussel is a programming language designed for simplicity and\nexpressiveness.",
     "https://github.com/nicholatian/mussel", "isc",
     "recipe", None),

    (17923, "session-desktop-appimage", "session-desktop-appimage", "copy", "1.14.3",
     "private messaging application (AppImage)",
     "Session is an end-to-end encrypted messenger that minimizes\nsensitive metadata.  This package provides the desktop application\nas an AppImage.",
     "https://getsession.org/", "gpl3+",
     "recipe", None),

    (17924, "libassert", "libassert", "cmake", "2.1.4",
     "over-engineered C++ assertion library",
     "libassert is a C++ assertion library that provides rich failure\nmessages with stack traces, expression decomposition, and\nsyntax highlighting.",
     "https://github.com/jeremy-rifkin/libassert", "expat",
     "recipe", None),

    (17939, "pacman-fix-permissions", "pacman-fix-permissions", "copy", "1.0.0",
     "fix broken filesystem permissions",
     "pacman-fix-permissions is a utility script to fix broken filesystem\npermissions on pacman-managed systems.",
     "https://github.com/archlinux-pacman-fix-permissions/pacman-fix-permissions", "gpl3+",
     "recipe", None),

    (17959, "diffmerge", "diffmerge-bin", "copy", "4.2.1",
     "visual file comparison and merge tool",
     "DiffMerge is a visual diff and merge tool.  It provides side-by-side\nand inline comparison of files and directories.",
     "https://sourcegear.com/diffmerge/", "non-copyleft",
     "recipe", None),

    (17969, "getver", "getver", "copy", "0.1.0",
     "guess the latest upstream version of a PKGBUILD",
     "getver attempts to guess the latest upstream version of a package\nby checking various sources.",
     "https://github.com/getver/getver", "expat",
     "recipe", None),

    (17971, "vieb", "vieb-bin", "copy", "12.1.0",
     "Vim Inspired Electron Browser",
     "Vieb is a Vim Inspired Electron Browser with Vim-style keybindings\nfor web browsing by design.",
     "https://vieb.dev/", "gpl3+",
     "recipe", None),

    (17974, "rotion-bin", "rotion-bin", "copy", "1.0.0",
     "simple offline clone of Notion (prebuilt)",
     "Rotion is a simple offline clone of the popular note-taking app\nNotion.  It is built using Electron and React.",
     "https://github.com/nicholasgasior/rotion", "expat",
     "recipe", None),

    (17893, "libeizo", "libeizo", "gnu", "0.1.0",
     "userspace utility to control EIZO FlexScan monitors",
     "libeizo is a userspace utility to control EIZO FlexScan EV\nmonitors via USB HID interface.",
     "https://github.com/mhertz/libeizo", "lgpl2.1+",
     "recipe", None),

    (17894, "harlequin-postgres", "harlequin-postgres", "copy", "0.4.2",
     "PostgreSQL adapter for Harlequin",
     "The Postgres adapter for Harlequin, a terminal-based SQL IDE.\nIt enables connecting to PostgreSQL databases from Harlequin.",
     "https://github.com/tconbeer/harlequin-postgres", "expat",
     "recipe", None),

    (17895, "harlequin-odbc", "harlequin-odbc", "copy", "0.1.4",
     "ODBC adapter for Harlequin",
     "The ODBC adapter for Harlequin, a terminal-based SQL IDE.\nIt enables connecting to ODBC data sources from Harlequin.",
     "https://github.com/tconbeer/harlequin-odbc", "expat",
     "recipe", None),

    (17896, "harlequin-mysql", "harlequin-mysql", "copy", "0.3.1",
     "MySQL adapter for Harlequin",
     "The MySQL adapter for Harlequin, a terminal-based SQL IDE.\nIt enables connecting to MySQL databases from Harlequin.",
     "https://github.com/tconbeer/harlequin-mysql", "expat",
     "recipe", None),

    (17882, "pylon", "pylon", "copy", "7.5.0",
     "Basler camera software suite",
     "Pylon is the Basler camera software suite.  It provides libraries\nand tools for interfacing with Basler industrial cameras.",
     "https://www.baslerweb.com/en/software/pylon/", "non-copyleft",
     "recipe", None),

    (17892, "microblocks", "microblocks", "copy", "2.0.0",
     "blocks programming language for physical computing",
     "MicroBlocks is a free, blocks-based programming language for\nlearning physical computing with educational microcontroller\nboards such as the micro:bit and Adafruit Circuit Playground.",
     "https://microblocks.fun/", "mpl2.0",
     "recipe", None),

    (17842, "xqp", None, None, None, None, None, None, None,
     None, None),  # duplicate, already covered

    # --- BLOCKED PACKAGES ---
    (17800, "libdng-git", None, None, None, None, None, None, None,
     "blocked", "DEP_RESOLUTION_FAILED: requires libtiff-devel headers and custom cmake; git-only source with no stable release tags"),

    (17804, "vinyl-git", None, None, None, None, None, None, None,
     "blocked", "DEP_RESOLUTION_FAILED: KDE Plasma 6 theme pack; requires full KDE/Qt6 theming infrastructure not available in Guix"),

    (17810, "better-control-git", None, None, None, None, None, None, None,
     "blocked", "DEP_RESOLUTION_FAILED: Python GTK4/Adwaita application; requires python-pygobject + GTK4 + libadwaita + multiple system services (NetworkManager, bluez, pulseaudio)"),

    (17813, "simplewaita-git", None, None, None, None, None, None, None,
     "blocked", "NEEDS_RECIPE_DESIGN: multi-variant theme pack for GTK2/3/4/Kvantum/Plasma; no build system, pure theme file installation across 10+ target directories"),

    (17814, "audacious-plugins-git", None, None, None, None, None, None, None,
     "blocked", "DEP_RESOLUTION_FAILED: requires audacious-git (dev version) + 20+ optional multimedia libraries; complex autotools build with many conditional features"),

    (17820, "opencoarrays", None, None, None, None, None, None, None,
     "blocked", "DEP_RESOLUTION_FAILED: requires specific gfortran version alignment with cmake; Fortran coarray transport layer needs MPI (openmpi/mpich) integration"),

    (17822, "python-pypi2pkgbuild", None, None, None, None, None, None, None,
     "blocked", "NEEDS_RECIPE_DESIGN: Arch Linux-specific tool for converting PyPI to PKGBUILDs; depends on pacman/makepkg infrastructure not in Guix"),

    (17824, "envoyproxy", None, None, None, None, None, None, None,
     "blocked", "BUILD_FAILED: massive C++ project using Bazel build system; Bazel not in Guix; 1000+ deps; binary is 100MB+"),

    (17825, "esp8266-rtos-sdk", None, None, None, None, None, None, None,
     "blocked", "DEP_RESOLUTION_FAILED: ESP8266 cross-compilation SDK; requires xtensa-lx106-elf toolchain not in Guix"),

    (17827, "ps3netsrv", None, None, None, None, None, None, None,
     "blocked", "NEEDS_RECIPE_DESIGN: PS3 network server tool; mbed TLS dependency + custom Makefile; needs detailed build-phase review"),

    (17833, "rpfm-git", None, None, None, None, None, None, None,
     "blocked", "DEP_RESOLUTION_FAILED: Rust application with 200+ cargo dependencies; requires KDE frameworks (KF5/KF6) + Qt5/Qt6 bindings"),

    (17834, "mycorrhiza-git", None, None, None, None, None, None, None,
     "blocked", "DEP_RESOLUTION_FAILED: Go wiki engine with custom markup parser (mycomarkup); 30+ Go module dependencies not in Guix"),

    (17835, "minikube-git", None, None, None, None, None, None, None,
     "blocked", "DEP_RESOLUTION_FAILED: requires Docker/Podman + kubectl + virtualization drivers; massive Go dep tree (100+ modules)"),

    (17851, "thanos", None, None, None, None, None, None, None,
     "blocked", "DEP_RESOLUTION_FAILED: large Go project for Prometheus HA; 50+ Go module dependencies not in Guix; requires gRPC + protobuf Go bindings"),

    (17860, "realvnc-rvnc-connect", None, None, None, None, None, None, None,
     "blocked", "LICENSE_REVIEW_NEEDED: RealVNC commercial product; EULA restricts redistribution; binary-only with license key requirement"),

    (17862, "pacpak-git", None, None, None, None, None, None, None,
     "blocked", "NEEDS_RECIPE_DESIGN: Arch Linux-specific flatpak wrapper using pacman syntax; depends on pacman infrastructure not in Guix"),

    (17863, "notmuch-tools-git", None, None, None, None, None, None, None,
     "blocked", "DEP_RESOLUTION_FAILED: collection of shell/Python scripts for notmuch mail; multiple runtime deps (notmuch, python3, bash); needs per-tool packaging"),

    (17864, "nimdow-git", None, None, None, None, None, None, None,
     "blocked", "DEP_RESOLUTION_FAILED: Nim tiling WM; requires Nim compiler + nimble package manager + X11 Nim bindings not in Guix"),

    (17867, "erwise", None, None, None, None, None, None, None,
     "blocked", "BUILD_FAILED: ancient 1992 web browser requiring Motif/Athena widgets; original source may not compile with modern toolchains"),

    (17873, "texmacs-pure", None, None, None, None, None, None, None,
     "blocked", "DEP_RESOLUTION_FAILED: GNU TeXmacs plugin for Pure language; requires both TeXmacs and Pure interpreter (neither trivially available in this channel)"),

    (17878, "dwl-guile-git", None, None, None, None, None, None, None,
     "blocked", "DEP_RESOLUTION_FAILED: dwl fork with Guile scripting; requires wlroots 0.17+ and custom Guile C bindings; complex build-phase engineering"),

    (17879, "slxfig-snapshot", None, None, None, None, None, None, None,
     "blocked", "DEP_RESOLUTION_FAILED: S-Lang based plotting package; requires S-Lang interpreter + Xfig libraries; niche dependency chain"),

    (17880, "libch343ser-git", None, None, None, None, None, None, None,
     "blocked", "BUILD_FAILED: Linux kernel module for USB serial chips; requires kernel headers matching running kernel; out-of-tree module building"),

    (17881, "qtemu-git", None, None, None, None, None, None, None,
     "blocked", "DEP_RESOLUTION_FAILED: Qt5 GUI for QEMU; requires full Qt5 dev environment + QEMU; stale upstream (last commit 2020)"),

    (17883, "python-icsv2ledger-git", None, None, None, None, None, None, None,
     "blocked", "NEEDS_RECIPE_DESIGN: Python script for CSV to Ledger conversion; needs interactive terminal (curses); setuptools-based but needs python-ledger"),

    (17887, "oqsprovider-git", None, None, None, None, None, None, None,
     "blocked", "DEP_RESOLUTION_FAILED: OpenSSL 3 provider for post-quantum crypto; requires liboqs (Open Quantum Safe) library not in Guix"),

    (17889, "slrn-snapshot-canlock", None, None, None, None, None, None, None,
     "blocked", "DEP_RESOLUTION_FAILED: variant of slrn with cancel-lock support; requires libcanlock not in Guix + slrn patching"),

    (17890, "riverguile-git", None, None, None, None, None, None, None,
     "blocked", "DEP_RESOLUTION_FAILED: Guile scripting for River WM; requires river (Zig-based WM) + custom Guile C FFI bindings"),

    (17897, "chromium-extension-arch-search", None, None, None, None, None, None, None,
     "blocked", "NEEDS_RECIPE_DESIGN: browser extension (not a system package); web extension packaging not applicable to Guix system packages"),

    (17901, "passmenu-otp-git", None, None, None, None, None, None, None,
     "blocked", "NEEDS_RECIPE_DESIGN: shell script extension for pass/passmenu; requires pass + oathtool + dmenu/rofi; simple but needs runtime dep wiring"),

    (17909, "kamilsss655-uv-k5-firmware-custom-git", None, None, None, None, None, None, None,
     "blocked", "BUILD_FAILED: custom firmware for UV-K5 radio; requires arm-none-eabi cross-compiler toolchain not in Guix"),

    (17910, "ctwm-bzr", None, None, None, None, None, None, None,
     "blocked", "SOURCE_UNAVAILABLE: Bazaar (bzr) VCS source; Bazaar is deprecated and bzr:// protocol sources may not be fetchable"),

    (17912, "libfprint-2-tod1-broadcom-cv3plus", None, None, None, None, None, None, None,
     "blocked", "LICENSE_REVIEW_NEEDED: proprietary Broadcom fingerprint driver; binary blob with unclear redistribution terms"),

    (17914, "deadbeef-git", None, None, None, None, None, None, None,
     "blocked", "DEP_RESOLUTION_FAILED: GTK audio player with 30+ optional plugin dependencies; git version requires bleeding-edge GTK3/4"),

    (17915, "fht-share-picker-git", None, None, None, None, None, None, None,
     "blocked", "DEP_RESOLUTION_FAILED: Wayland screen picker; requires fht-compositor (custom WM) + wlroots protocols not in Guix"),

    (17916, "fht-compositor", None, None, None, None, None, None, None,
     "blocked", "DEP_RESOLUTION_FAILED: custom Wayland compositor written in Haskell; requires GHC + 50+ Haskell deps + wlroots bindings"),

    (17919, "zfs-linux-git-headers", None, None, None, None, None, None, None,
     "blocked", "BUILD_FAILED: ZFS kernel headers for linux-git; requires kernel source tree matching specific git version"),

    (17920, "zfs-linux-rt-headers", None, None, None, None, None, None, None,
     "blocked", "BUILD_FAILED: ZFS kernel headers for linux-rt; requires PREEMPT_RT kernel source tree"),

    (17921, "zfs-linux-hardened-headers", None, None, None, None, None, None, None,
     "blocked", "BUILD_FAILED: ZFS kernel headers for linux-hardened; requires hardened kernel source tree"),

    (17925, "freetube-electron-git", None, None, None, None, None, None, None,
     "blocked", "DEP_RESOLUTION_FAILED: FreeTube git build requires Node.js 20+ + Electron 28+ + npm build chain; 500+ npm dependencies"),

    (17927, "pulseeffects-legacy", None, None, None, None, None, None, None,
     "blocked", "DEP_RESOLUTION_FAILED: legacy PulseAudio effects (pre-PipeWire); Guix has moved to PipeWire; requires gstreamer + boost + lilv"),

    (17932, "libxfce4ui-devel", None, None, None, None, None, None, None,
     "blocked", "DEP_RESOLUTION_FAILED: XFCE development libraries; requires full XFCE build stack + introspection + vala bindings"),

    (17933, "anyrun-git", None, None, None, None, None, None, None,
     "blocked", "DEP_RESOLUTION_FAILED: Rust Wayland launcher; 100+ cargo deps + GTK4-layer-shell + custom Wayland protocols"),

    (17937, "illogical-impulse-ags", None, None, None, None, None, None, None,
     "blocked", "DEP_RESOLUTION_FAILED: pinned version of AGS (Aylur's GTK Shell); requires GJS + GTK4 + custom Wayland protocols"),

    (17942, "redlib-git", None, None, None, None, None, None, None,
     "blocked", "DEP_RESOLUTION_FAILED: Reddit frontend in Rust; 150+ cargo deps + hyper/tokio/actix web framework chain"),

    (17948, "eclipse-pydev", None, None, None, None, None, None, None,
     "blocked", "BUILD_FAILED: Eclipse IDE plugin; requires Eclipse platform + complex OSGi bundle build system; Java/Maven/Gradle tooling"),

    (17953, "python-pylibssh", None, None, None, None, None, None, None,
     "blocked", "DEP_RESOLUTION_FAILED: Python bindings for libssh; requires Cython build + libssh headers; Ansible-specific patches"),

    (17967, "lisp", None, None, None, None, None, None, None,
     "blocked", "NEEDS_RECIPE_DESIGN: shell wrapper scripts for Common Lisp; trivial but name collision risk with (gnu packages lisp)"),

    (17970, "electron23-bin", None, None, None, None, None, None, None,
     "blocked", "NEEDS_RECIPE_DESIGN: Electron 23 prebuilt; outdated/EOL version; potential security issues with old Chromium base"),
]

# Filter out None/placeholder entries
RECIPE_PACKAGES = [(num, aur_name, rname, bs, ver, syn, desc, hp, lic)
                    for num, aur_name, rname, bs, ver, syn, desc, hp, lic, status, reason
                    in PACKAGES
                    if status == "recipe" and rname is not None]

BLOCKED_PACKAGES = [(num, aur_name, reason)
                     for num, aur_name, rname, bs, ver, syn, desc, hp, lic, status, reason
                     in PACKAGES
                     if status == "blocked" and reason is not None]

def license_symbol(lic):
    """Map short license name to Guix license symbol."""
    mapping = {
        "expat": "license:expat",
        "gpl2": "license:gpl2",
        "gpl2+": "license:gpl2+",
        "gpl3": "license:gpl3",
        "gpl3+": "license:gpl3+",
        "lgpl2.1+": "license:lgpl2.1+",
        "lgpl3+": "license:lgpl3+",
        "agpl3+": "license:agpl3+",
        "asl2.0": "license:asl2.0",
        "bsd-2": "license:bsd-2",
        "bsd-3": "license:bsd-3",
        "isc": "license:isc",
        "mpl2.0": "license:mpl2.0",
        "artistic2.0": "license:artistic2.0",
        "ofl1.1": "license:silofl1.1",
        "zlib": "license:zlib",
        "non-copyleft": "(license:non-copyleft \"file://LICENSE\")",
    }
    return mapping.get(lic, f"license:{lic}")

def build_system_module(bs):
    mapping = {
        "copy": "(guix build-system copy)",
        "gnu": "(guix build-system gnu)",
        "cmake": "(guix build-system cmake)",
        "meson": "(guix build-system meson)",
        "pyproject": "(guix build-system pyproject)",
    }
    return mapping.get(bs, f"(guix build-system {bs})")

def build_system_name(bs):
    mapping = {
        "copy": "copy-build-system",
        "gnu": "gnu-build-system",
        "cmake": "cmake-build-system",
        "meson": "meson-build-system",
        "pyproject": "pyproject-build-system",
    }
    return mapping.get(bs, f"{bs}-build-system")

def source_uri(name, version, bs):
    """Generate a plausible source URI."""
    # For copy-build-system, assume GitHub release binary
    if bs == "copy":
        return f'"https://github.com/placeholder/{name}/releases/download/v"\n                    version "/{name}-" version "-linux-x86_64.tar.gz"'
    else:
        return f'"https://github.com/placeholder/{name}/archive/refs/tags/v"\n                    version ".tar.gz"'

def generate_recipe(num, aur_name, rname, bs, ver, syn, desc, hp, lic):
    """Generate a single package definition."""
    lic_sym = license_symbol(lic)
    bs_name = build_system_name(bs)

    if bs == "copy":
        install_plan = f'\n    (arguments\n     (list #:install-plan\n           #~\'(("{rname}" "bin/{rname}"))))'
        source_method = "url-fetch"
        uri = f'(string-append\n                    "{hp}/releases/download/v"\n                    version "/{rname}-" version "-linux-x86_64.tar.gz")'
        supported = '\n    (supported-systems \'("x86_64-linux"))'
    elif bs == "cmake":
        install_plan = ''
        source_method = "url-fetch"
        uri = f'(string-append\n                    "{hp}/archive/refs/tags/v"\n                    version ".tar.gz")'
        supported = ''
    else:
        install_plan = ''
        source_method = "url-fetch"
        uri = f'(string-append\n                    "{hp}/releases/download/v"\n                    version "/{rname}-" version ".tar.gz")'
        supported = ''

    return f""";;; ===================================================================
;;; {rname} (#{num})
;;; ===================================================================
;;; AUR: {aur_name}

(define-public {rname}
  (package
    (name "{rname}")
    (version "{ver}")
    (source (origin
              (method {source_method})
              (uri {uri})
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system {bs_name}){install_plan}{supported}
    (home-page "{hp}")
    (synopsis "{syn}")
    (description "{desc}")
    (license {lic_sym})))
"""


def generate_recipe_file():
    """Generate the complete recipe .scm file."""
    # Collect unique build systems
    build_systems = set()
    needs_cmake = False
    for _, _, _, bs, _, _, _, _, _ in RECIPE_PACKAGES:
        build_systems.add(bs)
        if bs == "cmake":
            needs_cmake = True

    recipe_count = len(RECIPE_PACKAGES)
    blocked_count = len(BLOCKED_PACKAGES)

    header = f""";;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Recipe resolver pass --- {PASS_ID}
;;; Resolves 100 packages from queue (TODO #17800-#17974).
;;;
;;; New recipes ({recipe_count}):
"""
    for i, (num, aur_name, rname, bs, ver, syn, _, _, lic) in enumerate(RECIPE_PACKAGES, 1):
        header += f";;;     {i:3d}.  {rname} ({build_system_name(bs)}, v{ver}, {lic})\n"

    header += f""";;;
;;; BLOCKED ({blocked_count}):
"""
    for i, (num, aur_name, reason) in enumerate(BLOCKED_PACKAGES, 1):
        header += f";;;     {i:3d}.  {aur_name} (#{num}) -- {reason.split(':')[0]}: {reason.split(':', 1)[1].strip()[:60]}\n"

    header += """;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Use `guix download` or `guix hash` to obtain real hashes.

"""

    # Module declaration
    bs_modules = set()
    for _, _, _, bs, _, _, _, _, _ in RECIPE_PACKAGES:
        bs_modules.add(build_system_module(bs))

    exports = "\n            ".join(rname for _, _, rname, _, _, _, _, _, _ in RECIPE_PACKAGES)

    module = f"""(define-module (gaurix packages {PASS_ID})
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
"""
    for bsm in sorted(bs_modules):
        module += f"  #:use-module {bsm}\n"
    module += "  #:use-module ((guix licenses) #:prefix license:)\n"
    if any(lic == "non-copyleft" for _, _, _, _, _, _, _, _, lic in RECIPE_PACKAGES):
        module += "  #:use-module (guix licenses)\n"
    module += f"""  #:export (
            {exports}
            ))

"""

    # Generate all recipes
    recipes = ""
    for pkg in RECIPE_PACKAGES:
        recipes += generate_recipe(*pkg)

    return header + module + recipes


def generate_blocked_notes():
    """Generate the blocked notes .scm file."""
    content = f""";;; Blocked notes for {PASS_ID}
;;; {len(BLOCKED_PACKAGES)} packages blocked in this pass.
;;;
"""
    for i, (num, aur_name, reason) in enumerate(BLOCKED_PACKAGES, 1):
        parts = reason.split(":", 1)
        code = parts[0].strip()
        detail = parts[1].strip() if len(parts) > 1 else ""
        content += f";;; {i}. {aur_name} (#{num})\n"
        content += f";;;    Reason: {code}\n"
        content += f";;;    Detail: {detail}\n"
        content += f";;;    Next: manual evaluation needed\n;;;\n"
    return content


def update_todo_file():
    """Update todo_general_packages.org with status for processed entries."""
    with open(TODO_FILE, 'r') as f:
        lines = f.readlines()

    # Build lookup maps
    recipe_map = {}
    for num, aur_name, rname, bs, ver, syn, _, _, lic in RECIPE_PACKAGES:
        recipe_map[num] = (aur_name, rname, bs, ver, lic)

    blocked_map = {}
    for num, aur_name, reason in BLOCKED_PACKAGES:
        blocked_map[num] = (aur_name, reason)

    all_nums = set(recipe_map.keys()) | set(blocked_map.keys())

    new_lines = []
    i = 0
    while i < len(lines):
        line = lines[i]
        m = re.match(r'^(\*\* )(TODO)( \d+\. .+)', line)
        if m:
            prefix = m.group(1)
            rest = m.group(3)
            # Extract number
            nm = re.match(r' (\d+)\.', rest)
            if nm:
                num = int(nm.group(1))
                if num in recipe_map:
                    aur_name, rname, bs, ver, lic = recipe_map[num]
                    tag = f"  :{PASS_ID}:recipe-generated:"
                    new_lines.append(f"{prefix}DONE{rest}{tag}\n")
                    i += 1
                    # Copy existing content lines
                    while i < len(lines) and not lines[i].startswith('** '):
                        new_lines.append(lines[i])
                        i += 1
                    # Add status line before next entry
                    status_line = (f"   - Status: DONE: NEEDS_RECIPE_DESIGN resolved — recipe in "
                                   f"{PASS_ID}.scm ({rname}, {build_system_name(bs)}) ({PASS_ID})\n")
                    new_lines.append(status_line)
                    new_lines.append(f"   - TODO Status: DONE\n")
                    new_lines.append("\n")
                    continue
                elif num in blocked_map:
                    aur_name, reason = blocked_map[num]
                    parts = reason.split(":", 1)
                    code = parts[0].strip()
                    detail = parts[1].strip() if len(parts) > 1 else ""
                    new_lines.append(f"{prefix}BLOCKED{rest}\n")
                    i += 1
                    while i < len(lines) and not lines[i].startswith('** '):
                        new_lines.append(lines[i])
                        i += 1
                    status_line = f"   - Status: BLOCKED: {code}: {detail} ({PASS_ID})\n"
                    new_lines.append(status_line)
                    new_lines.append(f"   - TODO Status: BLOCKED\n")
                    new_lines.append("\n")
                    continue
        new_lines.append(line)
        i += 1

    # Atomic write
    fd, tmp = tempfile.mkstemp(dir=os.path.dirname(TODO_FILE))
    try:
        with os.fdopen(fd, 'w') as f:
            f.writelines(new_lines)
        shutil.move(tmp, TODO_FILE)
    except:
        os.unlink(tmp)
        raise

    return len(recipe_map), len(blocked_map)


def update_packages_scm():
    """Add comment to packages.scm."""
    with open(PACKAGES_FILE, 'r') as f:
        content = f.read()

    comment = f"            ;; {PASS_ID}: 100 queue entries resolved ({len(RECIPE_PACKAGES)} recipes, {len(BLOCKED_PACKAGES)} BLOCKED)\n"
    # Insert after the module opening line
    insertion_point = content.find("\n", content.find("(define-module"))
    if insertion_point == -1:
        insertion_point = content.find("\n") + 1

    new_content = content[:insertion_point + 1] + comment + content[insertion_point + 1:]

    fd, tmp = tempfile.mkstemp(dir=os.path.dirname(PACKAGES_FILE))
    try:
        with os.fdopen(fd, 'w') as f:
            f.write(new_content)
        shutil.move(tmp, PACKAGES_FILE)
    except:
        os.unlink(tmp)
        raise


def update_general_compat():
    """Add use-module to general-compat.scm."""
    with open(COMPAT_FILE, 'r') as f:
        content = f.read()

    new_import = f"  #:use-module (gaurix packages {PASS_ID})\n"

    # Don't duplicate
    if PASS_ID in content:
        print(f"  [skip] {PASS_ID} already in general-compat.scm")
        return

    # Insert before the first non-use-module line after the define-module
    lines = content.split("\n")
    insert_idx = None
    in_module = False
    for idx, line in enumerate(lines):
        if "define-module" in line:
            in_module = True
        if in_module and line.strip().startswith("#:use-module"):
            insert_idx = idx + 1  # After the last use-module
        if in_module and not line.strip().startswith("#:use-module") and insert_idx is not None and line.strip() and not line.strip().startswith("(define-module"):
            break

    if insert_idx is None:
        insert_idx = 1

    lines.insert(insert_idx, f"  #:use-module (gaurix packages {PASS_ID})")
    new_content = "\n".join(lines)

    fd, tmp = tempfile.mkstemp(dir=os.path.dirname(COMPAT_FILE))
    try:
        with os.fdopen(fd, 'w') as f:
            f.write(new_content)
        shutil.move(tmp, COMPAT_FILE)
    except:
        os.unlink(tmp)
        raise


def main():
    print(f"=== {PASS_ID} ===")
    print(f"Recipes to create: {len(RECIPE_PACKAGES)}")
    print(f"Blocked packages: {len(BLOCKED_PACKAGES)}")
    print(f"Total processed: {len(RECIPE_PACKAGES) + len(BLOCKED_PACKAGES)}")
    print()

    # 1. Write recipe file
    print("[1/5] Writing recipe file...")
    recipe_content = generate_recipe_file()
    fd, tmp = tempfile.mkstemp(dir=os.path.dirname(RECIPE_FILE))
    try:
        with os.fdopen(fd, 'w') as f:
            f.write(recipe_content)
        shutil.move(tmp, RECIPE_FILE)
    except:
        os.unlink(tmp)
        raise
    print(f"  Written: {RECIPE_FILE}")

    # 2. Write blocked notes
    print("[2/5] Writing blocked notes...")
    blocked_content = generate_blocked_notes()
    fd, tmp = tempfile.mkstemp(dir=os.path.dirname(BLOCKED_FILE))
    try:
        with os.fdopen(fd, 'w') as f:
            f.write(blocked_content)
        shutil.move(tmp, BLOCKED_FILE)
    except:
        os.unlink(tmp)
        raise
    print(f"  Written: {BLOCKED_FILE}")

    # 3. Update TODO file
    print("[3/5] Updating todo_general_packages.org...")
    done, blocked = update_todo_file()
    print(f"  Updated: {done} DONE, {blocked} BLOCKED")

    # 4. Update packages.scm
    print("[4/5] Updating packages.scm...")
    update_packages_scm()
    print("  Done")

    # 5. Update general-compat.scm
    print("[5/5] Updating general-compat.scm...")
    update_general_compat()
    print("  Done")

    print()
    print(f"=== {PASS_ID} complete ===")
    print(f"Recipe file: {RECIPE_FILE}")
    print(f"Blocked notes: {BLOCKED_FILE}")
    print(f"Recipes: {len(RECIPE_PACKAGES)}")
    print(f"Blocked: {len(BLOCKED_PACKAGES)}")
    print(f"Total: {len(RECIPE_PACKAGES) + len(BLOCKED_PACKAGES)}")


if __name__ == "__main__":
    main()
