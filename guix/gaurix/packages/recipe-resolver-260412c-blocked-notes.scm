;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Blocked notes for recipe-resolver-260412c
;;; 31 packages blocked with specific reason codes.

(define-module (gaurix packages recipe-resolver-260412c-blocked-notes))

;;; ═══════════════════════════════════════════════════════════════════
;;; Blocked package notes
;;; ═══════════════════════════════════════════════════════════════════

;;; kio-s3 (#11624)
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN
;;; Detail: KDE KIO worker for S3; requires KDE Frameworks 6, Qt6, cmake, aws-sdk-cpp.  Next: enumerate KF6/Qt6 deps.

;;; plasma-login-manager-git (#11631)
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN
;;; Detail: KDE Plasma display manager forked from SDDM; requires KDE Frameworks 6, Qt6, PAM, systemd, Wayland.  Complex build.

;;; fcitx5-mozc-ut (#11635)
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN
;;; Detail: Mozc Japanese input for Fcitx5; requires bazel/GYP build system, protobuf, abseil-cpp, fcitx5 headers.  Extremely complex build (Google-style).

;;; wayvr-git (#11647)
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN
;;; Detail: Rust VR Wayland compositor; requires cargo-inputs + wlroots, openxr-loader, vulkan-loader, openvr.  VR ecosystem not in Guix.

;;; lib32-python311-bin (#11654)
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN
;;; Detail: 32-bit Python 3.11 binary; lib32 concept not directly applicable to Guix.  Use Guix cross-compilation or multilib support.

;;; barrier-headless (#11656)
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN
;;; Detail: Headless build of Barrier KVM; C++ cmake with openssl, libx11, libxi, libxtst, curl.  Note: barrier exists in Guix upstream; this is headless variant.

;;; mal (#11662)
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN
;;; Detail: Rust CLI for MyAnimeList with ani-cli integration; requires cargo-inputs enumeration.  Next: try guix import crate mal.

;;; vicinae (#11663)
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN
;;; Detail: Desktop launcher; unclear upstream source and build system from AUR metadata.  Next: identify upstream repository.

;;; citron (#11666)
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN
;;; Detail: Nintendo Switch emulator (yuzu fork); massive C++ cmake build with Qt6, SDL2, Vulkan, boost, ffmpeg, 50+ deps.  Extremely complex.

;;; nekobox (#11667)
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN
;;; Detail: Qt6 cross-platform proxy GUI using sing-box; requires cmake, Qt6, protobuf, sing-box-core, grpc.  Multiple missing deps.

;;; nekobox-core (#11668)
;;; Status: BLOCKED: DEP_RESOLUTION_FAILED
;;; Detail: Go-based proxy core for NekoBox; depends on sing-box and Go ecosystem.  Blocked on nekobox.

;;; nitrox (#11669)
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN
;;; Detail: .NET/Mono Subnautica multiplayer mod; requires dotnet-runtime or mono, plus game-specific assets.  No standalone use.

;;; backintime (#11671)
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN
;;; Detail: Python/Qt6 backup tool using rsync snapshots; requires python-qt6, rsync, cron integration, polkit.  Multiple Python deps needed.

;;; qdiskinfo (#11676)
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN
;;; Detail: Qt-based CrystalDiskInfo alternative; requires Qt5/Qt6, smartmontools, cmake.  Next: enumerate Qt deps and try cmake-build-system.

;;; opentubex-git (#11677)
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN
;;; Detail: Electron-based YouTube frontend fork of FreeTube; requires npm dependency tree + Electron build.  Binary version preferred.

;;; qt5-doc (#11679)
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN
;;; Detail: Qt5 documentation package; requires extracting docs from Qt5 source build.  Qt5 build in Guix may already include docs.

;;; qt5-examples (#11680)
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN
;;; Detail: Qt5 examples and demos; requires Qt5 source build with examples enabled.  Complex Qt5 build.

;;; portproton (#11681)
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN
;;; Detail: Wine/Proton game launcher for Russian-language Windows games; requires wine, proton, steam runtime integration.  Complex gaming stack.

;;; input-remapper-git (#11682)
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN
;;; Detail: Python/GTK input device remapper; requires python-evdev, python-pydbus, udev rules, systemd service integration.  Multiple missing deps.

;;; niri-sidebar-git (#11684)
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN
;;; Detail: Rust sidebar manager for Niri WM; requires cargo-inputs + layer-shell, wayland-client crates.  Next: try guix import crate.

;;; plasma-x11-session-povd (#11688)
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN
;;; Detail: Custom Plasma X11 session variant; requires plasma-desktop, KDE Frameworks, session management.  Distro-specific session configuration.

;;; plasma6-applets-appgrid (#11690)
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN
;;; Detail: KDE Plasma 6 fullscreen app launcher; requires KDE Frameworks 6, Qt6, cmake, plasma-desktop.  Next: enumerate KF6 deps.

;;; xr-chaperone-git (#11691)
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN
;;; Detail: OpenXR chaperone/guardian system; requires openxr-loader, vulkan, cmake.  VR ecosystem deps.

;;; ccraw (#11695)
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN
;;; Detail: Terminal crow animation; unclear upstream source and build system.  Next: identify upstream repository and language.

;;; osmium (#11696)
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN
;;; Detail: Distributed messaging platform; unclear build system (possibly Rust or Go).  Next: identify upstream source and build requirements.

;;; asusctl (#11697)
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN
;;; Detail: Rust daemon for ASUS ROG laptops; requires cargo-inputs + dbus, udev, systemd integration, kernel-specific ASUS WMI.  Next: enumerate Rust deps.

;;; rog-control-center (#11698)
;;; Status: BLOCKED: DEP_RESOLUTION_FAILED
;;; Detail: Rust/GTK4 GUI for asusctl; depends on asusctl which is not yet in Guix.  Blocked on asusctl.

;;; samrewritten-git (#11699)
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN
;;; Detail: C++ GTK3 Steam achievement manager; requires steam API headers, GTK3, curl, json-c, cmake.  Niche gaming tool.

;;; waterfox (#11701)
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN
;;; Detail: Firefox fork from source; requires Mozilla build system (mach, rust, cbindgen, node, clang, 100+ deps).  Extremely complex; binary version preferred.

;;; sysd-manager (#11702)
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN
;;; Detail: Rust/GTK4 systemd unit manager; requires cargo-inputs + gtk4, dbus, systemd crates.  Next: try guix import crate.

;;; i3a (#11705)
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN
;;; Detail: Python scripts for i3/sway layout automation; requires python-i3ipc, python-xlib.  Next: check python-i3ipc availability.
