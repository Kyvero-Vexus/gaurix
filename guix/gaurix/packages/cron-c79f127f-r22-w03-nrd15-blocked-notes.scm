;;; Blocked-notes for cron-c79f127f-r22-w03-nrd15.
;;; 18 packages re-blocked with specific reasons.

(define-module (gaurix packages cron-c79f127f-r22-w03-nrd15-blocked-notes)
  #:use-module (guix packages)
  #:use-module (guix gexp)
  #:use-module ((guix licenses) #:prefix license:)
  #:export (openbuilds-control-blocked-note
            openscad-attachable-text3d-blocked-note
            protobuf-21-blocked-note
            zsh-nix-shell-blocked-note
            novafetch-blocked-note
            eprosima-fast-dds-monitor-blocked-note
            wperf-blocked-note
            odin-git-blocked-note
            nimble-git-blocked-note
            nimsuggest-git-blocked-note
            passwordsafe-blocked-note
            gns3-server-2-blocked-note
            gns3-gui-2-blocked-note
            vim-youcompleteme-git-blocked-note
            spflashtool5-bin-blocked-note
            alacritty-use-theme-with-redshift-git-blocked-note
            alacritty-use-theme-with-gnome-darkmode-git-blocked-note
            wooting-bg-service-blocked-note))

(define %dummy-source
  (plain-file "blocked-note" "This package is blocked; see description.\n"))

(define (make-blocked-note name reason)
  (package
    (name (string-append name "-blocked-note"))
    (version "0")
    (source %dummy-source)
    (build-system (@ (guix build-system trivial) trivial-build-system))
    (arguments (list #:builder #~(mkdir #$output)))
    (synopsis (string-append "Blocked note for " name))
    (description reason)
    (home-page "https://github.com/Chrysolambda/gaurix")
    (license license:gpl3+)))

;; 1. openbuilds-control: Electron 23 app with heavy npm + X11 dependency tree
(define-public openbuilds-control-blocked-note
  (make-blocked-note "openbuilds-control"
    "BLOCKED: Electron 23 app requiring npm ecosystem + electron-builder. \
Heavy X11/GTK3/dbus dependency tree.  Needs Guix electron packaging \
infrastructure that does not yet exist in this channel."))

;; 2. openscad-attachable-text3d: OpenSCAD library needing BOSL2 framework
(define-public openscad-attachable-text3d-blocked-note
  (make-blocked-note "openscad-attachable-text3d"
    "BLOCKED: OpenSCAD library that depends on BOSL2 framework (not \
packaged in Guix).  Would need BOSL2 packaged first, plus fontmetrics \
library (CC-BY-4.0)."))

;; 3. protobuf-21: Legacy protobuf requiring abseil-cpp11 + Python split package
(define-public protobuf-21-blocked-note
  (make-blocked-note "protobuf-21"
    "BLOCKED: Legacy Protocol Buffers v21.12 requiring abseil-cpp11 and \
complex CMake build with Python bindings split package.  Guix has \
protobuf 6.x; backporting v21 needs abseil-cpp11 + ABI patches."))

;; 4. zsh-nix-shell: Nix-specific zsh plugin
(define-public zsh-nix-shell-blocked-note
  (make-blocked-note "zsh-nix-shell"
    "BLOCKED: Zsh plugin for nix-shell integration.  Semantic mismatch: \
requires nix-shell/nix develop to be functional.  Not useful in a \
pure Guix environment without Nix installed."))

;; 5. novafetch: Rust/Cargo source build without vendored deps
(define-public novafetch-blocked-note
  (make-blocked-note "novafetch"
    "BLOCKED: Rust system fetch tool built with Cargo.  No pre-built \
binary release available.  cargo-build-system requires vendored \
dependency crate hashes which need per-crate analysis.  No binary \
release on GitHub."))

;; 6. eprosima-fast-dds-monitor: Complex Qt5 + DDS ecosystem
(define-public eprosima-fast-dds-monitor-blocked-note
  (make-blocked-note "eprosima-fast-dds-monitor"
    "BLOCKED: Qt5 monitoring application for eProsima Fast DDS.  Requires \
eprosima-fast-dds, eprosima-fast-dds-statistics-backend (neither in \
Guix), plus Qt5 quickcontrols/charts.  Full eProsima ecosystem needed."))

;; 7. wperf: npm package requiring Node.js ecosystem
(define-public wperf-blocked-note
  (make-blocked-note "wperf"
    "BLOCKED: Node.js CLI tool from npm registry.  node-build-system in \
Guix has limited npm ecosystem support.  Would need npm dependency \
resolution and bundling."))

;; 8. odin-git: LLVM-based language with vendored deps, rolling release
(define-public odin-git-blocked-note
  (make-blocked-note "odin-git"
    "BLOCKED: Odin programming language compiler.  Rolling git release, \
requires LLVM/Clang toolchain, vendored C libraries (box2d, cgltf, \
miniaudio, stb).  Complex build with LLVM version coupling."))

;; 9. nimble-git: Nim package manager requiring Nim compiler
(define-public nimble-git-blocked-note
  (make-blocked-note "nimble-git"
    "BLOCKED: Nim package manager.  Rolling git release, requires Nim \
compiler (not in upstream Guix).  Would need Nim packaged first."))

;; 10. nimsuggest-git: Nim IDE tool requiring Nim + Nimble
(define-public nimsuggest-git-blocked-note
  (make-blocked-note "nimsuggest-git"
    "BLOCKED: Nim IDE suggestion tool.  Requires Nim compiler and Nimble \
package manager (neither in upstream Guix).  Interactive build prompts \
in PKGBUILD."))

;; 11. passwordsafe: Complex CMake + wxWidgets + yubikey
(define-public passwordsafe-blocked-note
  (make-blocked-note "passwordsafe"
    "BLOCKED: Password manager with CMake build.  Heavy dependencies: \
wxwidgets-gtk3, yubikey-personalization, xerces-c, qrencode.  \
wxWidgets GUI integration and Yubikey hardware support make this \
complex to package correctly."))

;; 12. gns3-server-2: Python app with 29+ dependencies
(define-public gns3-server-2-blocked-note
  (make-blocked-note "gns3-server-2"
    "BLOCKED: GNS3 network simulator server v2.2.56.1.  Python setuptools \
build with 29+ Python dependencies (aiohttp, jsonschema, sentry_sdk, \
etc.).  Requires custom patches for dependency version pinning."))

;; 13. gns3-gui-2: PyQt6 GUI requiring gns3-server
(define-public gns3-gui-2-blocked-note
  (make-blocked-note "gns3-gui-2"
    "BLOCKED: GNS3 network simulator GUI v2.2.56.1.  Requires PyQt6 \
(not widely available in Guix), python-sentry_sdk, python-truststore, \
qt6-svg, qt6-websockets.  Depends on gns3-server."))

;; 14. vim-youcompleteme-git: Complex Vim plugin with clang/cmake
(define-public vim-youcompleteme-git-blocked-note
  (make-blocked-note "vim-youcompleteme-git"
    "BLOCKED: YouCompleteMe Vim plugin.  Rolling git release with git \
submodules (ycmd).  Requires CMake build with Clang/LLVM, pybind11, \
multiple optional language servers (gopls, rust-analyzer, etc.)."))

;; 15. spflashtool5-bin: Proprietary binary with unknown license
(define-public spflashtool5-bin-blocked-note
  (make-blocked-note "spflashtool5-bin"
    "BLOCKED: SP Flash Tool for MediaTek devices.  Proprietary binary \
with unknown license (cannot redistribute).  Requires deprecated \
libpng12 and qtwebkit.  Download needs custom HTTP Referer header."))

;; 16. alacritty-use-theme-with-redshift-git: Rolling git version (tagged v1.0.0 already packaged)
(define-public alacritty-use-theme-with-redshift-git-blocked-note
  (make-blocked-note "alacritty-use-theme-with-redshift-git"
    "BLOCKED: Git rolling release of alacritty-use-theme-with-redshift. \
The tagged v1.0.0 release is packaged as alacritty-use-theme-with-redshift; \
this -git variant requires alacritty-use-theme parent package + systemd \
user units.  Use the non-git variant instead."))

;; 17. alacritty-use-theme-with-gnome-darkmode-git: Rolling + systemd + GNOME
(define-public alacritty-use-theme-with-gnome-darkmode-git-blocked-note
  (make-blocked-note "alacritty-use-theme-with-gnome-darkmode-git"
    "BLOCKED: Git rolling release shell scripts for Alacritty theme \
switching based on GNOME dark mode.  Requires alacritty-use-theme \
(not packaged), systemd user units, GNOME dbus signals.  No tagged \
release."))

;; 17. wooting-bg-service: AppImage with unknown license
(define-public wooting-bg-service-blocked-note
  (make-blocked-note "wooting-bg-service"
    "BLOCKED: Wooting keyboard background service.  Distributed as \
AppImage with unknown/proprietary license (cannot redistribute).  \
Vendor-specific hardware service with systemd integration."))
