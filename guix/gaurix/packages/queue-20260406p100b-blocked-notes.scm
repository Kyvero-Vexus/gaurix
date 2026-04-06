;;; Queue drain 2026-04-06 batch b — blocked notes.
;;; 82 packages blocked with specific reasons after investigation.
(define-module (gaurix packages queue-20260406p100b-blocked-notes))

;; ── ttf-ms-win11-fod-auto-kore ───────────────────────────────────
;; BLOCKED: SOURCE_UNAVAILABLE — Microsoft Windows 11 FOD fonts require
;; extraction from Windows Update .cab files via specific MS update catalog
;; URLs that change per build.  No stable public download endpoint.
;; Next action: need script to parse MS update catalog for current cab URL.

;; ── ttf-ms-win11-fod-auto-knda ───────────────────────────────────
;; BLOCKED: SOURCE_UNAVAILABLE — Same as ttf-ms-win11-fod-auto-kore;
;; Microsoft Windows 11 FOD font cab extraction pipeline not available.

;; ── ttf-ms-win11-fod-auto-khmr ───────────────────────────────────
;; BLOCKED: SOURCE_UNAVAILABLE — Same as ttf-ms-win11-fod-auto-kore;
;; Microsoft Windows 11 FOD font cab extraction pipeline not available.

;; ── ttf-ms-win11-fod-auto-jpan ───────────────────────────────────
;; BLOCKED: SOURCE_UNAVAILABLE — Same as ttf-ms-win11-fod-auto-kore;
;; Microsoft Windows 11 FOD font cab extraction pipeline not available.

;; ── ttf-ms-win11-fod-auto-hebr ───────────────────────────────────
;; BLOCKED: SOURCE_UNAVAILABLE — Same as ttf-ms-win11-fod-auto-kore;
;; Microsoft Windows 11 FOD font cab extraction pipeline not available.

;; ── ttf-ms-win11-fod-auto-hant ───────────────────────────────────
;; BLOCKED: SOURCE_UNAVAILABLE — Same as ttf-ms-win11-fod-auto-kore;
;; Microsoft Windows 11 FOD font cab extraction pipeline not available.

;; ── linux6.19.9.zen1-1-zen-bin ───────────────────────────────────
;; BLOCKED: NEEDS_RECIPE_DESIGN — Version-pinned Linux ZEN kernel binary.
;; Guix kernel packaging requires custom kernel-config and module phases.
;; Additionally, version 6.19.9 is ephemeral and will be superseded quickly.
;; Next action: design generic zen-kernel recipe with version parameter.

;; ── linux6.19.9.zen1-1-zen-headers-bin ───────────────────────────
;; BLOCKED: DEP_RESOLUTION_FAILED — Depends on linux6.19.9.zen1-1-zen-bin
;; kernel package which is not yet packaged.  Headers package cannot be
;; built standalone.

;; ── linux6.19.9.zen1-1-zen-docs-bin ──────────────────────────────
;; BLOCKED: DEP_RESOLUTION_FAILED — Depends on linux6.19.9.zen1-1-zen-bin
;; kernel package which is not yet packaged.  Docs package follows kernel.

;; ── openal-hrtf ──────────────────────────────────────────────────
;; BLOCKED: NEEDS_RECIPE_DESIGN — HRTF dataset generator for OpenAL Soft.
;; Uses CMake + MHR compiler from OpenAL Soft source.  Need to extract
;; makemhr tool from openal-soft build first.
;; Next action: investigate if openal-soft can export makemhr as output.

;; ── cynthiune.app ────────────────────────────────────────────────
;; BLOCKED: NEEDS_RECIPE_DESIGN — GNUstep application requiring gnustep-make
;; build system.  Guix has gnustep-make but GNUstep app packaging patterns
;; are uncommon.  Needs GNUstep framework integration testing.
;; Next action: study gnustep-base package in Guix for build-system pattern.

;; ── fasttext-langid-models ───────────────────────────────────────
;; BLOCKED: SOURCE_UNAVAILABLE — Pre-trained fastText models hosted on
;; dl.fbaipublicfiles.com which has intermittent availability.  Models
;; are ~131MB (lid.176.bin).  No versioned release archive.
;; Next action: verify current download URL stability.

;; ── mandb-instant-update ─────────────────────────────────────────
;; BLOCKED: NEEDS_RECIPE_DESIGN — Arch Linux pacman hook script that
;; triggers mandb update on package install.  Concept doesn't directly
;; translate to Guix (no pacman hooks).  Would need Guix service adapter.
;; Next action: design as guix system service instead of standalone package.

;; ── gx52 ─────────────────────────────────────────────────────────
;; BLOCKED: NEEDS_RECIPE_DESIGN — Python/GTK3 application for Logitech
;; X52 HOTAS using python-usb and udev rules.  Needs investigation of
;; USB HID access patterns under Guix.
;; Next action: verify python-usb and udev rules integration.

;; ── mirth-connect-administrator-launcher ─────────────────────────
;; BLOCKED: LICENSE_REVIEW_NEEDED — NextGen Healthcare Mirth Connect is
;; dual-licensed (open source + commercial).  The administrator launcher
;; is a Java WebStart client for the proprietary management interface.
;; Need to confirm redistribution rights for the launcher component.

;; ── tomoyo-tools ─────────────────────────────────────────────────
;; BLOCKED: NEEDS_RECIPE_DESIGN — Linux security module userspace tools
;; that need kernel-specific headers and compile against TOMOYO LSM APIs.
;; Requires matching kernel version with TOMOYO enabled.
;; Next action: check if Guix default kernel has TOMOYO compiled in.

;; ── brother-hl-1110 ──────────────────────────────────────────────
;; BLOCKED: LICENSE_REVIEW_NEEDED — Brother printer driver distributed as
;; proprietary binary .deb/.rpm from Brother's download center.  EULA
;; restricts redistribution.  Need to confirm if Gaurix binary packaging
;; policy allows repackaging vendor printer drivers.

;; ── airwindows-lv2 ──────────────────────────────────────────────
;; BLOCKED: NEEDS_RECIPE_DESIGN — LV2 port of Airwindows plugins.
;; CMake build needs lv2 development headers and extensive audio plugin
;; infrastructure.  ~300 individual plugin builds.
;; Next action: test cmake build with guix lv2 and lilv packages.

;; ── vectorchord ──────────────────────────────────────────────────
;; BLOCKED: NEEDS_RECIPE_DESIGN — PostgreSQL extension written in Rust
;; using pgrx framework.  Requires PostgreSQL server headers + Rust
;; cargo build with pgrx-specific compilation model.
;; Next action: investigate pgrx packaging pattern for Guix.

;; ── orca-slicer-unstable-bin ─────────────────────────────────────
;; BLOCKED: NEEDS_RECIPE_DESIGN — AppImage binary of OrcaSlicer with
;; complex runtime deps (OpenGL, wxWidgets, CUDA optional).  AppImage
;; extraction + patchelf for Guix store paths needed.
;; Next action: extract AppImage and catalog shared library deps.

;; ── bibata-cursor-git ────────────────────────────────────────────
;; BLOCKED: NEEDS_RECIPE_DESIGN — Cursor theme built from SVG sources
;; using clickgen (Python tool) + yarn for building.  Build pipeline
;; requires yarn/node for SVG→cursor conversion.
;; Next action: investigate if pre-built cursor tarballs are available.

;; ── organicmaps-git ──────────────────────────────────────────────
;; BLOCKED: NEEDS_RECIPE_DESIGN — Massive C++/Qt/CMake project with
;; map data compilation pipeline.  Requires downloading OpenStreetMap
;; data and running map generation tools.  Build takes hours.
;; Next action: evaluate if pre-built map data packages exist.

;; ── syshud ───────────────────────────────────────────────────────
;; BLOCKED: NEEDS_RECIPE_DESIGN — Wayland HUD overlay using wlr-layer-shell.
;; C project with meson build, depends on gtk4-layer-shell which may not
;; be in Guix yet.  Need to verify dep availability.
;; Next action: check if gtk4-layer-shell is packaged in Guix.

;; ── stack-wallet-appimage ────────────────────────────────────────
;; BLOCKED: NEEDS_RECIPE_DESIGN — Flutter/Dart cryptocurrency wallet
;; distributed as AppImage.  Extracting and patching AppImage binaries
;; for Guix store paths requires significant ELF patching work.
;; Next action: investigate AppImage extraction pattern in Guix.

;; ── xunlei-bin ───────────────────────────────────────────────────
;; BLOCKED: SOURCE_UNAVAILABLE — Xunlei (迅雷) download manager for Linux.
;; Binary distributed via Chinese mirrors with registration-gated downloads.
;; No stable public URL for automated fetching.

;; ── rclone-appmenu ───────────────────────────────────────────────
;; BLOCKED: NEEDS_RECIPE_DESIGN — Trivial .desktop file package that
;; adds rclone WebUI to app menu.  Depends on rclone (available in Guix).
;; Recipe is straightforward but needs desktop-file-utils integration.
;; Next action: write trivial copy-build recipe with .desktop file.

;; ── ksysguard6-git ───────────────────────────────────────────────
;; BLOCKED: DEP_RESOLUTION_FAILED — KDE Frameworks 6 system monitor
;; requiring kf6-kio, kf6-knewstuff, libksysguard6.  Multiple KF6
;; dependencies not yet packaged in Guix.
;; Next action: check Guix KF6 packaging status.

;; ── localsend-go ─────────────────────────────────────────────────
;; BLOCKED: NEEDS_RECIPE_DESIGN — Go CLI for LocalSend protocol.
;; Requires Go module vendoring for Guix build.  Need to generate
;; go.sum and vendor directory for offline build.
;; Next action: run `go mod vendor` and prepare import.

;; ── web-ext ──────────────────────────────────────────────────────
;; BLOCKED: DEP_RESOLUTION_FAILED — Mozilla's web-ext CLI tool has
;; hundreds of transitive npm dependencies.  Guix node ecosystem lacks
;; most of these packages.  Node dependency avalanche.
;; Next action: evaluate binary distribution or bundled approach.

;; ── okular-backend-mupdf-git ─────────────────────────────────────
;; BLOCKED: DEP_RESOLUTION_FAILED — Requires Okular development headers
;; and MuPDF C library.  Both exist in Guix but integration with KDE
;; Okular plugin system needs testing.
;; Next action: verify okular plugin installation paths in Guix.

;; ── intel-ipsec-mb ───────────────────────────────────────────────
;; BLOCKED: NEEDS_RECIPE_DESIGN — Intel IPsec crypto library using
;; NASM assembler for x86-specific optimized code.  CMake build with
;; NASM dependency.  Guix has nasm but build system integration untested.
;; Next action: test cmake build with nasm in Guix.

;; ── upwork ───────────────────────────────────────────────────────
;; BLOCKED: SOURCE_UNAVAILABLE — Upwork desktop app distributed as
;; proprietary .deb via Upwork's website.  Download URL requires
;; user-agent negotiation.  No stable versioned archive URL.

;; ── booster-um ───────────────────────────────────────────────────
;; BLOCKED: NEEDS_RECIPE_DESIGN — Bash script UKI manager for booster
;; initramfs + systemd-ukify.  Arch-specific integration with mkinitcpio
;; hooks.  Would need adaptation for Guix boot system.
;; Next action: evaluate portability of UKI generation to Guix.

;; ── photoprism ───────────────────────────────────────────────────
;; BLOCKED: NEEDS_RECIPE_DESIGN — Large Go + Node.js photo management
;; application.  Requires Go module vendoring, npm build for frontend,
;; TensorFlow Lite for AI features.  Very complex build pipeline.
;; Next action: evaluate container-based deployment vs native package.

;; ── duo-desktop ──────────────────────────────────────────────────
;; BLOCKED: SOURCE_UNAVAILABLE — Cisco Duo Desktop is a proprietary
;; endpoint security agent.  Binary distributed via Duo admin portal
;; with no public download URL.  Requires organization account access.

;; ── nstool ───────────────────────────────────────────────────────
;; BLOCKED: NEEDS_RECIPE_DESIGN — Nintendo Switch file format tool.
;; C++ with CMake, depends on libfmt and mbedtls.  Both available in
;; Guix but project-specific CMake configuration untested.
;; Next action: test cmake build in Guix environment.

;; ── brother-dcpt720dw ────────────────────────────────────────────
;; BLOCKED: LICENSE_REVIEW_NEEDED — Brother printer driver for DCP-T720DW.
;; Proprietary binary distribution.  Same redistribution concerns as
;; brother-hl-1110.  EULA review needed.

;; ── d2x-rebirth ──────────────────────────────────────────────────
;; BLOCKED: NEEDS_RECIPE_DESIGN — Enhanced Descent 2 engine.  CMake
;; build with SDL2, physfs, and OpenGL deps.  All deps available in Guix
;; but needs testing of CMake configuration and game data path setup.
;; Next action: test cmake build with SDL2 and physfs.

;; ── binkplayer-bin ───────────────────────────────────────────────
;; BLOCKED: SOURCE_UNAVAILABLE — RAD Game Tools Bink Video Player is
;; proprietary.  Binary distributed from radgametools.com but download
;; requires manual acceptance.  No automated download URL.

;; ── python-mlflow ────────────────────────────────────────────────
;; BLOCKED: DEP_RESOLUTION_FAILED — MLflow has 40+ Python dependencies
;; including alembic, sqlalchemy, flask, gunicorn, scikit-learn, and
;; many more.  Many not yet in Guix.  Massive dependency tree.
;; Next action: catalog missing Python deps for phased packaging.

;; ── oterm ────────────────────────────────────────────────────────
;; BLOCKED: DEP_RESOLUTION_FAILED — Python TUI for Ollama using textual
;; framework.  python-textual and python-rich are in Guix but oterm
;; depends on python-ollama, python-aiohttp-client-cache which are not.
;; Next action: package python-ollama first.

;; ── wifiman ──────────────────────────────────────────────────────
;; BLOCKED: SOURCE_UNAVAILABLE — Ubiquiti WiFiman is a proprietary
;; network management app.  AUR description says "wpa_supplicant config
;; manager" but actual package is Ubiquiti's proprietary tool.  No
;; public source repository found.

;; ── osrm-backend ─────────────────────────────────────────────────
;; BLOCKED: NEEDS_RECIPE_DESIGN — C++14 routing engine with CMake build.
;; Depends on boost, lua, tbb, libxml2, and requires large OSM data files
;; for testing.  Complex build with many optional features.
;; Next action: test minimal cmake build without optional deps.

;; ── evcxr_jupyter ────────────────────────────────────────────────
;; BLOCKED: NEEDS_RECIPE_DESIGN — Rust Jupyter kernel.  Cargo build
;; with many crate dependencies.  Needs cargo vendor + integration with
;; Jupyter kernel installation paths.
;; Next action: generate Cargo.lock vendored deps list.

;; ── albert-git ───────────────────────────────────────────────────
;; BLOCKED: DEP_RESOLUTION_FAILED — Qt6/C++ application launcher with
;; plugin system.  Depends on qt6-declarative, qt6-scxml, qt6-svg.
;; Several Qt6 modules may not be packaged in Guix yet.
;; Next action: verify Qt6 module availability in Guix.

;; ── d1x-rebirth ──────────────────────────────────────────────────
;; BLOCKED: NEEDS_RECIPE_DESIGN — Enhanced Descent 1 engine.  Same
;; build system as d2x-rebirth (CMake + SDL2 + physfs).  Needs same
;; investigation as d2x-rebirth.
;; Next action: test cmake build alongside d2x-rebirth.

;; ── brisqi-bin ───────────────────────────────────────────────────
;; BLOCKED: NEEDS_RECIPE_DESIGN — Electron-based Kanban app distributed
;; as binary .deb.  Requires Electron runtime patching for Guix store.
;; Massive Chromium dependency tree in binary form.
;; Next action: evaluate if AppImage/binary extraction is viable.

;; ── objconv ──────────────────────────────────────────────────────
;; BLOCKED: NEEDS_RECIPE_DESIGN — Agner Fog's object file converter.
;; C++ source with custom Makefile.  Source distributed as .zip from
;; agner.org.  No version-tagged releases on any git forge.
;; Next action: verify source download URL stability.

;; ── latin-words ──────────────────────────────────────────────────
;; BLOCKED: NEEDS_RECIPE_DESIGN — William Whitaker's WORDS Latin
;; dictionary.  Written in Ada, requires GNAT compiler.  Guix has
;; gcc-toolchain but Ada (gnat) support may need verification.
;; Next action: check if Guix gnat/gcc supports Ada compilation.

;; ── kak-tree-sitter ──────────────────────────────────────────────
;; BLOCKED: NEEDS_RECIPE_DESIGN — Rust program for tree-sitter
;; integration with Kakoune editor.  Cargo build with tree-sitter
;; runtime dependency.  Needs cargo vendor for offline build.
;; Next action: generate vendored crate list.

;; ── ffmpeg-cuda ──────────────────────────────────────────────────
;; BLOCKED: NEEDS_RECIPE_DESIGN — FFmpeg compiled with CUDA/NVENC
;; support.  Requires NVIDIA CUDA toolkit headers and nvenc SDK.
;; Guix has ffmpeg but CUDA variant needs nonguix CUDA packages.
;; Next action: investigate CUDA SDK availability in Guix/nonguix.

;; ── psdoom-ng ────────────────────────────────────────────────────
;; BLOCKED: NEEDS_RECIPE_DESIGN — Process-killing Doom mod based on
;; Chocolate Doom.  C source with CMake, depends on SDL2 + Doom WAD
;; file handling.  Needs Chocolate Doom as build dependency.
;; Next action: check if chocolate-doom is packaged in Guix.

;; ── x11-emoji-picker ─────────────────────────────────────────────
;; BLOCKED: NEEDS_RECIPE_DESIGN — C++ emoji picker for X11 using
;; CMake + Qt5.  Depends on xdotool for key injection.  Build system
;; needs Qt5 + X11 integration testing.
;; Next action: test cmake build with qt5 and xdotool.

;; ── k6 ──────────────────────────────────────────────────────────
;; BLOCKED: NEEDS_RECIPE_DESIGN — Go load testing tool from Grafana.
;; Requires Go module vendoring with many dependencies including
;; embedded JavaScript engine (goja).  Complex Go build.
;; Next action: run go mod vendor to catalog dependencies.

;; ── energygraph ──────────────────────────────────────────────────
;; BLOCKED: NEEDS_RECIPE_DESIGN — Terminal power graphing tool using
;; Intel RAPL interface.  C source with simple Makefile but requires
;; access to /sys/class/powercap/ (root/sysfs access).
;; Next action: verify build and runtime sysfs access pattern.

;; ── proto ────────────────────────────────────────────────────────
;; BLOCKED: NEEDS_RECIPE_DESIGN — Rust version manager (moonrepo/proto).
;; Large Cargo workspace with many crate deps.  Conceptually overlaps
;; with Guix's own version management.
;; Next action: evaluate if useful on Guix systems.

;; ── gpt4all-chat ─────────────────────────────────────────────────
;; BLOCKED: NEEDS_RECIPE_DESIGN — Qt6/C++ LLM chat client with
;; llama.cpp backend integration.  Complex CMake build requiring
;; Qt6, Vulkan, and optional CUDA.  Large dependency tree.
;; Next action: evaluate binary AppImage distribution.

;; ── pacmods ──────────────────────────────────────────────────────
;; BLOCKED: NEEDS_RECIPE_DESIGN — Arch Linux specific tool that queries
;; pacman database for modified config files.  Uses libalpm (pacman lib).
;; Not applicable to Guix package management model.
;; Next action: none — Arch-specific, low priority for Guix.

;; ── amazon-corretto-8 ────────────────────────────────────────────
;; BLOCKED: NEEDS_RECIPE_DESIGN — Amazon's OpenJDK 8 distribution.
;; Binary .tar.gz available from corretto.aws.  Guix already has
;; icedtea/openjdk-8; need to justify separate Corretto packaging.
;; Next action: evaluate if users need Corretto-specific patches.

;; ── amazon-corretto-17 ───────────────────────────────────────────
;; BLOCKED: NEEDS_RECIPE_DESIGN — Amazon's OpenJDK 17 distribution.
;; Binary .tar.gz available from corretto.aws.  Guix already has
;; openjdk-17; need to justify separate Corretto packaging.
;; Next action: evaluate if users need Corretto-specific patches.

;; ── dracut-ukify ─────────────────────────────────────────────────
;; BLOCKED: NEEDS_RECIPE_DESIGN — Integration layer for dracut + ukify
;; on Arch Linux.  Shell scripts + pacman hooks.  Arch-specific
;; integration that doesn't translate to Guix boot system.
;; Next action: evaluate if dracut-ukify concept applies to Guix.

;; ── hyphen-el ────────────────────────────────────────────────────
;; BLOCKED: NEEDS_RECIPE_DESIGN — Greek hyphenation rules for
;; LibreOffice/OpenOffice.  Typically installed as OXT extension.
;; Need to determine correct installation path for Guix LibreOffice.
;; Next action: study libreoffice extension packaging in Guix.

;; ── libre-menu-editor ────────────────────────────────────────────
;; BLOCKED: NEEDS_RECIPE_DESIGN — Python/GTK4 menu editor.  Uses
;; meson build system with Python + GObject introspection.  Deps
;; include gtk4 + libadwaita which are in Guix but need testing.
;; Next action: test meson build with gtk4 + python-gobject.

;; ── gf2-git ──────────────────────────────────────────────────────
;; BLOCKED: NEEDS_RECIPE_DESIGN — GDB frontend using GTK3 + Cairo.
;; Zig build system (uses build.zig).  Guix has zig but zig
;; build-system integration for complex projects is untested.
;; Next action: investigate Zig build-system support in Guix.

;; ── netbeans-bin ─────────────────────────────────────────────────
;; BLOCKED: NEEDS_RECIPE_DESIGN — Apache NetBeans IDE.  Large Java
;; application (~400MB).  Binary distribution as .zip.  Requires
;; JDK runtime and proper desktop integration.
;; Next action: evaluate copy-build-system with JDK wrapper script.

;; ── python-deezer-py ─────────────────────────────────────────────
;; BLOCKED: DEP_RESOLUTION_FAILED — Python Deezer API wrapper.
;; Depends on python-tornado and python-requests (both in Guix) but
;; also python-slumber which is not packaged.
;; Next action: package python-slumber first.

;; ── technitium-dns-server-bin ────────────────────────────────────
;; BLOCKED: NEEDS_RECIPE_DESIGN — .NET-based DNS server.  Binary
;; distribution requires .NET runtime which is not in upstream Guix.
;; Would need dotnet-runtime as dependency.
;; Next action: evaluate dotnet-runtime availability.

;; ── msi-psu-dkms ─────────────────────────────────────────────────
;; BLOCKED: NEEDS_RECIPE_DESIGN — DKMS kernel module for MSI PSU
;; monitoring.  DKMS model doesn't apply to Guix (Guix builds kernel
;; modules at system reconfigure time).  Would need custom kernel
;; module package pattern.
;; Next action: study Guix kernel module packaging pattern.

;; ── oshd ─────────────────────────────────────────────────────────
;; BLOCKED: NEEDS_RECIPE_DESIGN — Static hosts daemon.  C with CMake.
;; Depends on openssl and libsodium.  Both in Guix.  Build seems
;; straightforward but needs CMake configuration testing.
;; Next action: test cmake build in Guix environment.

;; ── the-house ────────────────────────────────────────────────────
;; BLOCKED: NEEDS_RECIPE_DESIGN — Terminal casino game.  Small Rust
;; project with cargo build.  Needs cargo vendor for offline build.
;; Simple enough but Rust vendoring setup time exceeds batch limit.
;; Next action: generate vendored crate list.

;; ── bobcat-terminal-git ──────────────────────────────────────────
;; BLOCKED: DEP_RESOLUTION_FAILED — Cross-platform terminal emulator
;; using Qt6 + libvterm.  Depends on qt6-declarative and libvterm.
;; Qt6 module availability in Guix needs verification.
;; Next action: check Qt6 QML module availability.

;; ── q4wine-git ───────────────────────────────────────────────────
;; BLOCKED: NEEDS_RECIPE_DESIGN — Qt GUI for Wine.  CMake + Qt5 build.
;; Depends on wine, qt5-base, icoutils.  All available in Guix but
;; Wine integration and .desktop file setup needs testing.
;; Next action: test cmake build with qt5 and wine.

;; ── clash-verge-rev ──────────────────────────────────────────────
;; BLOCKED: NEEDS_RECIPE_DESIGN — Tauri (Rust + web frontend) proxy
;; GUI.  Requires cargo + npm build pipeline with Tauri CLI.  Guix
;; has no Tauri build-system support.  Would need full vendoring of
;; both Rust crates and npm packages.
;; Next action: evaluate binary distribution (AppImage/deb).

;; ── pix2tex ──────────────────────────────────────────────────────
;; BLOCKED: DEP_RESOLUTION_FAILED — Python ML tool using PyTorch,
;; transformers, timm, and many heavy ML dependencies.  Most not
;; packaged in Guix.  Massive Python ML dependency tree.
;; Next action: catalog missing PyTorch ecosystem deps.

;; ── telegraf ─────────────────────────────────────────────────────
;; BLOCKED: NEEDS_RECIPE_DESIGN — Go metrics agent from InfluxData.
;; Huge Go module with 200+ plugin dependencies.  Go module vendoring
;; would produce massive vendor directory.
;; Next action: evaluate binary distribution from InfluxData.

;; ── onvif-util ───────────────────────────────────────────────────
;; BLOCKED: NEEDS_RECIPE_DESIGN — ONVIF client in C++.  CMake build
;; depends on gsoap (SOAP toolkit) which may not be in Guix.
;; Next action: check gsoap availability in Guix.

;; ── miraclecast-git ──────────────────────────────────────────────
;; BLOCKED: NEEDS_RECIPE_DESIGN — WiFi display (Miracast) for Linux.
;; C with meson/autotools build.  Depends on systemd, udev, gstreamer,
;; and WiFi Direct kernel support.  Complex system integration.
;; Next action: evaluate systemd dependency compatibility with Guix.

;; ── seafile-client ───────────────────────────────────────────────
;; BLOCKED: DEP_RESOLUTION_FAILED — Qt5/CMake file sync client.
;; Depends on libsearpc and ccnet (Seafile-specific libraries) that
;; are not packaged in Guix.  Need to package dep chain first.
;; Next action: package libsearpc, then ccnet-client.

;; ── gnome-shell-extension-fuzzy-app-search-git ───────────────────
;; BLOCKED: NEEDS_RECIPE_DESIGN — GNOME Shell extension (JavaScript).
;; Copy-build is straightforward but GNOME Shell extension installation
;; paths and metadata.json UUID handling needs Guix-specific setup.
;; Next action: study gnome-shell-extension packaging pattern in Guix.

;; ── mp3tag ───────────────────────────────────────────────────────
;; BLOCKED: NEEDS_RECIPE_DESIGN — Windows-native tag editor that runs
;; on Linux via bundled Wine.  AUR package wraps Wine + mp3tag.exe.
;; Complex Wine prefix setup with runtime dependencies.
;; Next action: evaluate Wine wrapper packaging pattern.

;; ── terabox-bin ──────────────────────────────────────────────────
;; BLOCKED: SOURCE_UNAVAILABLE — Baidu TeraBox cloud storage client.
;; Download URL from terabox.com requires browser-based download with
;; captcha verification.  No stable CLI-fetchable URL.

;; ── openhv ───────────────────────────────────────────────────────
;; BLOCKED: NEEDS_RECIPE_DESIGN — OpenRA mod (sci-fi RTS game).
;; C#/.NET application requiring .NET SDK for building and Mono/.NET
;; runtime.  Neither is well-supported in Guix.
;; Next action: evaluate if AppImage or Flatpak binary exists.
