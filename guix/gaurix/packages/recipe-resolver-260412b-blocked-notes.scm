;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Blocked notes for recipe-resolver-260412b
;;; 37 packages blocked with specific reason codes.

(define-module (gaurix packages recipe-resolver-260412b-blocked-notes))

;;; ═══════════════════════════════════════════════════════════════════
;;; Blocked package notes
;;; ═══════════════════════════════════════════════════════════════════

;;; rustconn (#11422)
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN
;;; Detail: Rust/GTK4 app; requires cargo-inputs enumeration for full crate dependency tree.  Next: run guix import crate rustconn.

;;; debtap (#11456)
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN
;;; Detail: Arch Linux-specific tool for converting .deb to pacman packages; depends on pacman, pkgfile, fakeroot.  Not useful on Guix.

;;; joplin (#11509)
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN
;;; Detail: npm/Node.js CLI app; requires node-build-system with full npm dependency tree enumeration.  Next: try guix import json with package.json.

;;; plasma6-applets-kara-git (#11515)
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN
;;; Detail: KDE Plasma 6 applet; requires Qt6/KDE Frameworks 6 build deps (plasma-framework, kirigami) not enumerated.  Next: enumerate Qt6/KF6 deps.

;;; wivrn-server (#11519)
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN
;;; Detail: C++ OpenXR/Monado VR server; requires monado, libdrm, vulkan-loader, ffmpeg, avahi, many VR-specific deps.  Complex cmake build.

;;; lib32-wivrn-server (#11520)
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN
;;; Detail: 32-bit build variant of wivrn-server; lib32 concept does not directly apply to Guix (use multilib instead).  Blocked on wivrn-server base.

;;; wivrn-dashboard (#11521)
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN
;;; Detail: Qt6/QML VR dashboard; depends on wivrn-server and Qt6 Quick.  Blocked on wivrn-server.

;;; pikaur (#11522)
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN
;;; Detail: AUR helper for Arch Linux; depends on pacman, pyalpm, makepkg.  Arch-specific utility with no use on Guix.

;;; tuxedo-drivers-dkms (#11527)
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN
;;; Detail: DKMS kernel module for TUXEDO laptops; Guix uses linux-module-build-system, not DKMS.  Requires kernel source integration.

;;; steam-native-runtime (#11529)
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN
;;; Detail: Metapackage providing native replacements for Steam runtime libs; depends on 100+ system libraries in specific versions.  Arch/distro-specific.

;;; sonic-workspace (#11534)
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN
;;; Detail: Modified KDE Plasma workspace for XLibre distribution; requires patching plasma-workspace source with XLibre-specific changes.  Distro-specific fork.

;;; sonic-x11-session (#11535)
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN
;;; Detail: Plasma X11 session for XLibre; depends on sonic-workspace and plasma-desktop.  Blocked on sonic-workspace.

;;; arch-smart-update (#11536)
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN
;;; Detail: Shell script for Arch Linux update timing based on archlinux.org mirror status.  Arch-specific, no use on Guix.

;;; xdg-desktop-portal-termfilechooser-hunkyburrito-git (#11537)
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN
;;; Detail: C xdg-desktop-portal backend for terminal file choosers; requires xdg-desktop-portal, inih, systemd dbus integration.  Next: enumerate deps.

;;; zmx (#11542)
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN
;;; Detail: Rust TUI session persistence tool; requires cargo-inputs enumeration.  Next: try guix import crate zmx.

;;; gpu-screen-recorder-gtk (#11549)
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN
;;; Detail: GTK4 frontend for gpu-screen-recorder; requires gpu-screen-recorder, libayatana-appindicator, wayland-client, many GPU-specific deps.

;;; alhp-mirrorlist (#11552)
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN
;;; Detail: ALHP mirror list for pacman; Arch-specific mirror configuration.  No use on Guix.

;;; alhp-keyring (#11554)
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN
;;; Detail: ALHP PGP keyring for pacman; Arch-specific package signing infrastructure.  No use on Guix.

;;; awww-git (#11559)
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN
;;; Detail: Rust/Wayland animated wallpaper daemon; requires cargo-inputs + wayland-client, wgpu, image crates.  Next: guix import crate awww.

;;; ut2004-bin (#11561)
;;; Status: BLOCKED: SOURCE_UNAVAILABLE
;;; Detail: Unreal Tournament 2004 native binaries require original game assets (proprietary CD/purchase).  No stable public download URL for game data.

;;; aimp (#11562)
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN
;;; Detail: Windows-only audio player; Linux version requires Wine.  No native Linux binary or source available.

;;; obs-studio-git (#11574)
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN
;;; Detail: OBS Studio from git source; cmake build with 30+ deps (ffmpeg, x264, pipewire, wayland, Qt6, lua, etc.).  Note: obs-studio exists in Guix upstream; this is git HEAD.

;;; howdy-git (#11580)
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN
;;; Detail: Python facial authentication using IR camera; requires dlib, opencv, PAM integration, IR camera drivers.  Complex Linux-PAM hook setup.

;;; language-toolkit (#11589)
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN
;;; Detail: Niche language documentation tool; unclear upstream source (no GitHub/stable URL found in AUR cache).  Next: verify upstream URL.

;;; opencode-claude-auth (#11594)
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN
;;; Detail: Go-based credential bridge between Claude Code and opencode; requires Go build with go-inputs enumeration.  Next: try guix import go.

;;; pacman-log-orphans-hook (#11596)
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN
;;; Detail: Pacman hook for Arch Linux package management; depends on pacman.  Arch-specific, no use on Guix.

;;; pyside2 (#11599)
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN
;;; Detail: Python Qt5 bindings; requires shiboken2, Qt5 full build, clang, cmake; extremely complex build with 200+ files.  Next: check if pyside2 exists in Guix upstream.

;;; pyside2-tools (#11600)
;;; Status: BLOCKED: DEP_RESOLUTION_FAILED
;;; Detail: Tools for PySide2; depends on pyside2 which is not yet in Guix.  Blocked on pyside2.

;;; python-shiboken2 (#11602)
;;; Status: BLOCKED: DEP_RESOLUTION_FAILED
;;; Detail: Qt binding generator; depends on pyside2 build infrastructure.  Blocked on pyside2.

;;; uzdoom (#11603)
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN
;;; Detail: GZDoom fork with advanced renderer; C++ cmake build with 40+ deps (ZMusic, OpenAL, vulkan, SDL2, FluidSynth, GLEW, etc.).  Extremely complex.

;;; packwiz-git (#11606)
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN
;;; Detail: Go CLI tool for Minecraft modpacks; requires go-build-system with go-inputs enumeration for vendored modules.  Next: try guix import go.

;;; code-features (#11610)
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN
;;; Detail: VS Code OSS feature unblock extension; depends on code-oss or VS Code.  Minimal standalone utility.

;;; envision-xr-git (#11614)
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN
;;; Detail: Rust GTK4 GUI for Monado VR; requires cargo-inputs + libmonado, steamvr, openxr.  VR ecosystem deps not in Guix.

;;; teams-for-linux (#11616)
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN
;;; Detail: Electron-based MS Teams client from source; requires npm/node dependency tree + Electron rebuild.  Binary version already packaged.

;;; plasmazones (#11619)
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN
;;; Detail: KDE Plasma 6 window tiling plugin; requires KDE Frameworks 6, Qt6, cmake, plasma-desktop.  Next: enumerate KF6 deps.

;;; throne (#11621)
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN
;;; Detail: Qt6 GUI proxy manager using sing-box backend; requires Qt6, sing-box, cmake.  Next: check sing-box availability in Guix.

;;; ryzen_smu-dkms-git (#11622)
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN
;;; Detail: DKMS kernel module for AMD Ryzen SMU access; Guix uses linux-module-build-system, not DKMS.  Requires kernel source integration.
