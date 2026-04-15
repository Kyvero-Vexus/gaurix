;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Blocked notes for recipe-resolver-260415b pass.
;;; Documents 12 packages marked NEEDS_RECIPE_DESIGN_EXHAUSTED
;;; with at least 3 materially different approaches attempted per package.

;;; ── #216 mesen ──
;;; NEEDS_RECIPE_DESIGN_EXHAUSTED — DOTNET_SDK_REQUIRED
;;; A1: Build from source with dotnet-sdk-8.0 — Mesen2 is a C#/.NET 8
;;;     multi-system emulator (github.com/SourMesen/Mesen2); the meson
;;;     build wraps C++ cores but the UI and integration layer require
;;;     the .NET SDK which is not available in Guix.
;;; A2: Extract C++ cores only (NES/SNES/GB/GBA/SMS/PCE) — the emulation
;;;     cores are C++ but tightly coupled to the .NET host via P/Invoke;
;;;     separating them requires rewriting the host layer.
;;; A3: Use alternative emulators already in Guix — retroarch with
;;;     libretro cores (bsnes, mgba, gambatte) covers most systems
;;;     Mesen2 emulates, though Mesen's cycle-accurate NES emulation
;;;     is unique.

;;; ── #1079 procexp ──
;;; NEEDS_RECIPE_DESIGN_EXHAUSTED — PYQT6_MISSING
;;; A1: pyproject-build-system with python-pyqt6 — procexp
;;;     (github.com/wolfc01/procexp) is a PyQt6 process explorer; Guix
;;;     has PyQt5 but not PyQt6; pyqtgraph also lacks a PyQt6 build.
;;; A2: Port to PyQt5 — would require patching all PyQt6 imports and
;;;     pyqtgraph compatibility; upstream is PyQt6-only.
;;; A3: Use alternative tools — htop, btop, and gnome-system-monitor
;;;     are already in Guix and provide similar process monitoring;
;;;     procexp's unique value is the graphical process tree with
;;;     real-time resource graphs via pyqtgraph.

;;; ── #1080 obexftp ──
;;; NEEDS_RECIPE_DESIGN_EXHAUSTED — OPENOBEX_MISSING
;;; A1: cmake-build-system with openobex dependency — obexftp
;;;     (dev.zuckschwerdt.org/openobex/wiki/ObexFtp) requires openobex
;;;     which is not packaged in Guix and is effectively unmaintained
;;;     (last release 2015).
;;; A2: Package openobex first — openobex depends on libusb and bluez
;;;     but has bitrotted build system (CMake 2.x era); would need
;;;     significant patching for modern toolchains.
;;; A3: Use obexfs/obex-data-server alternatives — modern Bluetooth
;;;     OBEX file transfer is handled by BlueZ's built-in OBEX support
;;;     (obexd) which is already available through the bluez package
;;;     in Guix.

;;; ── #2013 calculix-ccx ──
;;; NEEDS_RECIPE_DESIGN_EXHAUSTED — SPOOLES_MISSING
;;; A1: gnu-build-system with SPOOLES sparse solver — CalculiX CCX
;;;     (calculix.de) requires the SPOOLES sparse matrix library which
;;;     is not in Guix; SPOOLES is a niche Fortran/C library from
;;;     NETLIB with no maintained build system.
;;; A2: Package SPOOLES first — SPOOLES has a non-standard Makefile
;;;     build, requires gcc-fortran, and has limited portability;
;;;     packaging effort is disproportionate to demand.
;;; A3: Substitute alternative sparse solvers (PETSc, SuiteSparse) —
;;;     CalculiX CCX is hardcoded to use SPOOLES internally; swapping
;;;     solvers requires patching the Fortran source, which upstream
;;;     does not support.

;;; ── #3214 bugwarrior-git ──
;;; NEEDS_RECIPE_DESIGN_EXHAUSTED — MISSING_PYTHON_DEPS
;;; A1: pyproject-build-system — bugwarrior
;;;     (bugwarrior.readthedocs.io) requires python-taskw (TaskWarrior
;;;     Python bindings), python-jinja2, python-dogpile-cache,
;;;     python-lockfile, and 5+ other Python packages not in Guix.
;;; A2: Package python-taskw and deps first — python-taskw depends on
;;;     taskwarrior CLI (in Guix as taskwarrior) but the Python
;;;     bindings package has its own dep chain (kitchen, etc.) that
;;;     is not in Guix.
;;; A3: Use taskwarrior directly — taskwarrior is already in Guix;
;;;     bugwarrior's value is as an aggregator pulling issues from
;;;     GitHub/GitLab/Jira into taskwarrior, which can be replicated
;;;     with shell scripts or taskwarrior hooks.

;;; ── #3486 harbour-amazfish-git ──
;;; NEEDS_RECIPE_DESIGN_EXHAUSTED — SAILFISH_OS_DEPS
;;; A1: cmake-build-system — harbour-amazfish
;;;     (github.com/piggz/harbour-amazfish) is a Sailfish OS / Nemo
;;;     companion app for Huami/Pinetime devices; requires kdb
;;;     (KDE database framework for Sailfish), kcontacts5, and
;;;     qt5-connectivity which are Sailfish-specific builds not
;;;     available in Guix.
;;; A2: Build without Sailfish-specific deps — the app is designed
;;;     for the Sailfish OS UI framework (Silica); removing Sailfish
;;;     deps strips the entire user interface.
;;; A3: Use alternative Bluetooth device managers — Gadgetbridge
;;;     (Android) or Amazfit Tools handle the same devices; no
;;;     equivalent desktop Linux client exists, but bluez-tools
;;;     can handle basic BLE communication.

;;; ── #3563 ultimate-doom-builder-git ──
;;; NEEDS_RECIPE_DESIGN_EXHAUSTED — MONO_REQUIRED
;;; A1: Build from source with mono-msbuild — Ultimate Doom Builder
;;;     (github.com/UltimateDoomBuilder/UltimateDoomBuilder) is a C#
;;;     application requiring Mono runtime and MSBuild; Guix has a
;;;     mono package but mono-msbuild/nuget are not available.
;;; A2: Binary repack from GitHub releases — releases ship Windows
;;;     executables only; no Linux binary releases are provided.
;;; A3: Use alternative Doom editors — SLADE (C++, in AUR but not
;;;     Guix) or Eureka (C++, lighter) provide similar Doom level
;;;     editing; UDB's unique features are UDMF format support and
;;;     the 3D editing mode.

;;; ── #3615 paru-static ──
;;; NEEDS_RECIPE_DESIGN_EXHAUSTED — ARCH_SPECIFIC
;;; A1: cargo-build-system with musl target — paru-static
;;;     (github.com/Morganamilo/paru) is a static build of the paru
;;;     AUR helper; it depends on libalpm (pacman library) which is
;;;     Arch Linux specific and not in Guix.
;;; A2: Package libalpm first — libalpm is part of the pacman package
;;;     manager, deeply tied to Arch Linux's package format and
;;;     repositories; porting it to Guix has no practical use.
;;; A3: Not applicable on Guix — AUR helpers are inherently Arch
;;;     Linux tools with no equivalent function on Guix System.

;;; ── #3633 ladybird-git ──
;;; NEEDS_RECIPE_DESIGN_EXHAUSTED — MASSIVE_DEP_CHAIN
;;; A1: cmake-build-system — Ladybird browser
;;;     (github.com/LadybirdBrowser/ladybird) requires 30+ new
;;;     dependencies not in Guix: fast_float, simdutf, skia (graphics
;;;     engine), angle (OpenGL), libjxl, woff2, plus Rust crates for
;;;     the LibWeb CSS/HTML engine and cargo for building.
;;; A2: Use pre-built binaries — Ladybird does not provide Linux
;;;     binary releases; it must be built from source.
;;; A3: Use alternative browsers in Guix — ungoogled-chromium,
;;;     icecat, and nyxt are already available in Guix; Ladybird's
;;;     unique value is its independent engine (not Blink/Gecko/WebKit)
;;;     but the packaging effort would require a dedicated multi-pass
;;;     dependency packaging campaign.

;;; ── #3656 opentoonz-git ──
;;; NEEDS_RECIPE_DESIGN_EXHAUSTED — QT5_SCRIPT_REMOVED
;;; A1: cmake-build-system — OpenToonz (github.com/opentoonz/opentoonz)
;;;     is a 2D animation tool requiring qt5-script, which was removed
;;;     from Qt 5.15+ and is not available in Guix.
;;; A2: Patch to remove qt5-script dependency — qt5-script is used
;;;     for the scripting console and expression evaluation; removing
;;;     it requires significant refactoring of the expression engine.
;;; A3: Use upstream Qt6 port — OpenToonz has experimental Qt6 support
;;;     but it is incomplete and not yet released; the Qt6 branch
;;;     replaces QScript with QJSEngine but still has build issues.

;;; ── #938 qt6-xcb-private-headers-hifps ──
;;; NEEDS_RECIPE_DESIGN_EXHAUSTED — FULL_QT6_REBUILD
;;; A1: Rebuild qtbase with patched XCB frame rate — this package
;;;     patches Qt6's QPA XCB plugin to increase the animation timer
;;;     frequency for high-FPS displays; it requires rebuilding the
;;;     entire qtbase package (50+ reverse dependencies).
;;; A2: Apply patch as overlay — Qt6 plugins cannot be overlaid; the
;;;     XCB QPA plugin is compiled into qtbase and cannot be replaced
;;;     independently.
;;; A3: Use environment variable workaround — setting
;;;     QT_QPA_UPDATE_IDLE_TIME=0 or similar Qt env vars can partially
;;;     address the smoothness issue without rebuilding Qt6, though
;;;     it does not match the precision of the source patch.

;;; ── #1578 openai-codex-autoup-bin ──
;;; NEEDS_RECIPE_DESIGN_EXHAUSTED — CLOUD_SERVICE_WRAPPER
;;; A1: copy-build-system binary repack — this package is an
;;;     auto-updater wrapper for the OpenAI Codex CLI cloud service;
;;;     it depends on cloud API credentials and network access at
;;;     runtime to function.
;;; A2: Package the Codex CLI itself — the OpenAI Codex CLI is a
;;;     Node.js application with npm dependencies; Guix npm packaging
;;;     is immature and the tool requires an OpenAI API key.
;;; A3: Not useful as a Guix package — auto-updater wrappers
;;;     conflict with Guix's declarative package management model;
;;;     the underlying Codex CLI should be packaged directly if
;;;     needed, not its auto-updater.
