;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2026 Gaurix contributors
;;;
;;; Blocked notes for recipe-resolver-260408k pass
;;; 20 packages re-evaluated and re-blocked with specific reasons.

(define recipe-resolver-260408k-blocked-notes
  (list
    '(3572 "ripdrag"
      reason: "CARGO_DEPS_NOT_AVAILABLE"
      details: "Rust/Cargo GTK4 drag-and-drop tool (github.com/nik012003/ripdrag v0.4.12, GPL-3.0). Requires cargo-build-system with full crate dependency enumeration. No pre-built binaries available."
      attempts: ("checked GitHub releases for binaries: source-only"
                 "evaluated cargo-build-system feasibility: requires GTK4 + Rust crate vendoring"
                 "considered guix import crate: incomplete results for GTK4 crates"))

    '(3598 "gopac-bin"
      reason: "ARCH_SPECIFIC"
      details: "TUI for Arch Linux package management (github.com/the-daonm/gopac v1.3.0, MIT). Wraps pacman/yay/paru which are Arch-specific. No utility on Guix."
      attempts: ("fetched PKGBUILD: depends on pacman/yay/paru"
                 "evaluated portability: fundamentally Arch-only tool"
                 "no alternative non-Arch usage path"))

    '(3612 "swaystatus"
      reason: "MISSING_BUILD_BACKEND"
      details: "Python swaybar status generator (PyPI swaystatus v0.14.1, MIT). Build backend is uv-build which is not available in Guix. Cannot build wheel without uv ecosystem."
      attempts: ("checked PyPI: uses uv-build PEP 517 backend"
                 "evaluated alternative backends: pyproject.toml specifies uv-build exclusively"
                 "checked if setuptools fallback works: no setup.py or setup.cfg present"))

    '(3627 "boxbuddy"
      reason: "CARGO_DEPS_NOT_AVAILABLE"
      details: "GTK4/libadwaita GUI for Distrobox (github.com/Dvlv/BoxBuddyRS v2.5.7, MIT). Rust/Cargo build with GTK4 deps. Also requires distrobox at runtime which needs podman/docker container infrastructure."
      attempts: ("evaluated cargo-build-system: requires full crate vendoring"
                 "checked runtime deps: requires distrobox + container runtime"
                 "no pre-built Linux binaries available"))

    '(3629 "snipaste"
      reason: "PROPRIETARY_LICENSE"
      details: "Proprietary screenshot tool distributed as AppImage (snipaste.com v2.11.3). Closed-source, no public source code. Custom proprietary license."
      attempts: ("fetched PKGBUILD: source is proprietary AppImage from snipaste.com"
                 "checked license: proprietary/custom, not FOSS"
                 "no open-source alternative with same name"))

    '(3630 "dooble-bin"
      reason: "BUILD_SYSTEM_TOO_COMPLEX"
      details: "QtWebEngine-based web browser (github.com/textbrowser/dooble v2025.11.25, custom BSD-like). Requires QtWebEngine (Chromium-based) which has massive dependency chain. Custom license needs review."
      attempts: ("fetched PKGBUILD: depends on qt6-webengine and 15+ Qt6 modules"
                 "evaluated dep chain: QtWebEngine embeds Chromium, extremely complex"
                 "checked binary .deb: runtime deps too heavy for meaningful Guix package"))

    '(3639 "apifox-bin"
      reason: "PROPRIETARY_LICENSE"
      details: "Proprietary API testing tool (apifox.com v2.8.22). Closed-source Electron app. No public source code. Custom proprietary license."
      attempts: ("fetched PKGBUILD: source is proprietary from apifox.com"
                 "checked license: proprietary, not FOSS"
                 "no open-source code available"))

    '(3649 "geforce-infinity-bin"
      reason: "ELECTRON_APP"
      details: "Electron wrapper for GeForce NOW cloud gaming (github.com/AstralVixen/GeForce-Infinity v1.2.2, MIT). Wraps proprietary NVIDIA service. Electron binary blob, not buildable from source in Guix."
      attempts: ("fetched PKGBUILD: Electron 37 binary .deb"
                 "checked upstream: MIT license but wraps proprietary GeForce NOW"
                 "Guix lacks Electron packaging infrastructure"))

    '(3654 "battinfo-git"
      reason: "MISSING_BUILD_SYSTEM"
      details: "Nim CLI battery info tool (gitlab.com/prashere/battinfo v0.2.1, GPL-3.0). Requires Nim compiler and nimble build system which are not available in Guix."
      attempts: ("fetched PKGBUILD: requires nim and nimble"
                 "checked Guix for Nim support: no nim-build-system"
                 "evaluated manual build: would need Nim bootstrap first"))

    '(3655 "peel-git"
      reason: "NO_TAGGED_RELEASES"
      details: "C++ GObject bindings generator (gitlab.gnome.org/bugaevc/peel, MIT). Meson build. No tagged releases, only git HEAD. Cannot create reproducible package without stable version."
      attempts: ("fetched PKGBUILD: git-only source, no tags"
                 "checked GitLab: zero releases, zero tags"
                 "meson build feasible but no stable version to pin"))

    '(3656 "opentoonz-git"
      reason: "BUILD_SYSTEM_TOO_COMPLEX"
      details: "Professional 2D animation software (github.com/opentoonz/opentoonz v1.7.1, BSD). CMake build with 20+ dependencies including Qt5, OpenCV, SuperLU, libmypaint, boost, GLEW, SDL2. Bundles custom libtiff."
      attempts: ("fetched PKGBUILD: 20+ makedepends, bundles libtiff"
                 "checked Guix upstream: opentoonz not packaged"
                 "evaluated dep chain: many deps available but integration complex"))

    '(3657 "codenomad-bin"
      reason: "UNKNOWN_LICENSE"
      details: "Multi-instance AI coding workspace (github.com/NeuralNomadsAI/CodeNomad v0.13.3). Prebuilt Electron app with unspecified license. Cannot determine if FOSS."
      attempts: ("fetched PKGBUILD: license listed as unknown/unspecified"
                 "checked GitHub: no LICENSE file found"
                 "Electron binary blob, not buildable from source"))

    '(3659 "socialstreamninja-bin"
      reason: "ELECTRON_APP"
      details: "Social media chat aggregator (github.com/steveseguin/social_stream v0.3.98, GPL-3.0). Distributed as AppImage binary blob. Upstream is Electron + browser extension. Not buildable from source in Guix."
      attempts: ("checked GitHub releases: only AppImage binaries"
                 "evaluated source build: Electron + npm ecosystem"
                 "Guix lacks Electron packaging infrastructure"))

    '(3660 "rustwhy-git"
      reason: "IMMATURE_PROJECT"
      details: "Rust system diagnostics CLI (github.com/Ninso112/rustwhy, GPL-3.0). Only 4 commits, no tagged releases, very early stage. Not worth packaging effort."
      attempts: ("checked GitHub: 4 commits total, no releases"
                 "evaluated maturity: too early for packaging"
                 "Rust/Cargo would need full crate vendoring"))

    '(3661 "bar_daemon"
      reason: "CARGO_DEPS_NOT_AVAILABLE"
      details: "Async status bar daemon (github.com/tmforshaw/bar_daemon v0.6.3, MIT). Rust/Cargo build. Hard dependency on asusctl (ASUS-specific). Requires full crate vendoring."
      attempts: ("fetched PKGBUILD: depends on asusctl, wireplumber, bluez"
                 "evaluated portability: asusctl is ASUS laptop-specific"
                 "Rust/Cargo crate deps not available in Guix"))

    '(3662 "carbonyl"
      reason: "BUILD_SYSTEM_TOO_COMPLEX"
      details: "Chromium-based terminal browser (github.com/fathyb/carbonyl v0.0.3, BSD). Build downloads pre-built Chromium via npm. Source build would require building full Chromium. Project abandoned since Feb 2023."
      attempts: ("fetched PKGBUILD: npm install downloads Chromium binary"
                 "evaluated source build: requires full Chromium compilation"
                 "project abandoned (last release v0.0.3, Feb 2023)"))

    '(3664 "oyasumi-bin"
      reason: "PROPRIETARY_DEPS"
      details: "VR sleep utilities for SteamVR (github.com/sofoxe1/OyasumiVR v0.7.3, MIT). Requires proprietary SteamVR/OpenVR runtime. Tauri binary, extremely niche."
      attempts: ("fetched PKGBUILD: binary tarball requiring SteamVR"
                 "evaluated deps: SteamVR is proprietary"
                 "Tauri app not buildable from source in Guix"))

    '(3678 "scantool-git"
      reason: "MISSING_GUIX_DEPS"
      details: "OBD-II vehicle diagnostic scanner (github.com/kees/scantool v2.1, GPL). Simple C/Makefile build but depends on Allegro 4 (legacy game library). Allegro 4 is not packaged in Guix (only Allegro 5)."
      attempts: ("fetched PKGBUILD: depends on allegro4"
                 "checked Guix: only allegro (v5) available, not allegro4"
                 "allegro4 is legacy, would need separate packaging"))

    '(3718 "gasroot"
      reason: "MISSING_GUIX_DEPS"
      details: "GTK2 graphical sudo alternative (codeberg.org/maandree/gasroot v1.0.2, ISC). Simple C/Makefile build but depends on libenv (codeberg.org/maandree/libenv) which is not packaged in Guix."
      attempts: ("fetched PKGBUILD: depends on libenv + gtk2"
                 "checked Guix: libenv not available"
                 "libenv is a small library but needs packaging first"))

    '(3707 "python-textual-fspicker-git"
      reason: "MISSING_BUILD_BACKEND"
      details: "Textual TUI filesystem picker (github.com/davep/textual-fspicker v1.0.0, MIT). Python package using uv-build backend for PEP 517. uv-build is not available in Guix."
      attempts: ("fetched PKGBUILD: makedepends includes python-uv-build"
                 "checked pyproject.toml: build backend is uv-build"
                 "Guix lacks uv-build backend for Python packaging"))))
