;;; Blocked notes for round-22 worker-03 NRD pass 6.
;;; 17 packages re-blocked with concrete reasons after investigation.
(define-module (gaurix packages cron-c79f127f-r22-w03-nrd6-blocked-notes))

;;; ── Re-blocked packages ──────────────────────────────────────────

;; #135 fooyin
;; BLOCKED: QT6_DEPS_NOT_AVAILABLE — Qt6/C++ music player; requires Qt6 multimedia,
;; taglib, ffmpeg, alsa-lib.  Qt6 framework packages in Guix are incomplete
;; (missing Qt6Multimedia, Qt6DBus integration).
;; A1: cmake build needs Qt6Multimedia not packaged; A2: no binary release;
;; A3: cannot build against Qt5 (Qt6-only codebase).

;; #6027 r-quick-share
;; BLOCKED: CARGO_DEPS_NOT_AVAILABLE — Rust/GTK4 implementation of Android Quick Share
;; protocol; cargo dep tree includes gio, gtk4-rs, zbus, tokio — 100+ crates not in Guix.
;; A1: no binary release; A2: Rust/cargo deps massive; A3: no simpler alternative.

;; #6029 tic80-pro-git
;; BLOCKED: COMPLEX_CMAKE_DEPS — TIC-80 fantasy console; cmake build with embedded
;; third-party libs (SDL2, lua, zlib, giflib, lpeg) vendored.  The pro version requires
;; specific vendored lib versions with patches.
;; A1: cmake build has 20+ vendored deps; A2: unbundling would break build;
;; A3: no AppImage/binary for Linux x86_64.

;; #6030 spotube
;; BLOCKED: FLUTTER_NOT_AVAILABLE — Dart/Flutter application; Flutter SDK and Dart
;; toolchain not available in Guix.  No source build path exists.
;; A1: Flutter not in Guix; A2: AppImage available but requires FUSE extraction +
;; extensive patchelf; A3: no native build alternative.

;; #15559 dela-git
;; BLOCKED: CARGO_DEPS_NOT_AVAILABLE — Rust task runner (dela); cargo deps include
;; clap, serde, toml, tera — 50+ crates not in Guix.
;; A1: no binary release; A2: cargo dep tree not available; A3: no simpler fork.

;; #15629 catnap-git
;; BLOCKED: NEEDS_NIM_COMPILER — system fetch written in Nim; Nim compiler not available
;; in Guix.  No prebuilt Linux binary release available.
;; A1: Nim not in Guix; A2: no binary releases; A3: no Rust/Go/C rewrite available.

;; #15658 kdotool-git
;; BLOCKED: CARGO_DEPS_NOT_AVAILABLE — Rust xdotool-like for KDE Wayland; depends on
;; dbus, zbus, clap — cargo dep tree ~60 crates not in Guix.
;; A1: no binary release; A2: cargo deps not available; A3: no simpler alternative.

;; #15712 wormhole-rs-bin
;; BLOCKED: CARGO_DEPS_NOT_AVAILABLE — Rust implementation of Magic Wormhole; cargo deps
;; include async-std, noise-protocol, spake2 — 100+ crates not in Guix.  Binary releases
;; are available but Linux builds are not consistently published.
;; A1: checked GitHub releases — only macOS/Windows; A2: cargo deps massive;
;; A3: Guix has python-magic-wormhole as alternative.

;; #15725 deskreen-bin
;; BLOCKED: ELECTRON_BINARY_COMPLEX — Electron desktop app; .deb/.AppImage binary
;; requires extensive patchelf + electron runtime wrapping.
;; A1: AppImage needs FUSE-free extract + patchelf; A2: Electron deps massive;
;; A3: no lightweight alternative available.

;; #16098 micromamba-bin
;; BLOCKED: BINARY_NOT_SELF_CONTAINED — C++ static binary but download URL requires
;; conda-forge CDN authentication.  Binary itself links against glibc and needs
;; patchelf for Guix store paths.
;; A1: conda-forge URL not stable for reproducible builds; A2: source build requires
;; mamba/conda C++ stack not in Guix; A3: Guix has conda package as partial alternative.

;; #16138 goldendict-git
;; BLOCKED: QT6_DEPS_NOT_AVAILABLE — goldendict-ng is Qt6/cmake with heavy dep chain
;; (Qt6WebEngine, Qt6Multimedia, hunspell, lzo, xapian, ffmpeg).  Qt6WebEngine not
;; available in Guix.
;; A1: Qt6WebEngine not packaged; A2: Qt5 version (goldendict classic) abandoned;
;; A3: no text-only alternative available.

;; #16992 iamb-bin
;; BLOCKED: CARGO_DEPS_NOT_AVAILABLE — Rust Matrix client; cargo deps include
;; matrix-sdk, ratatui, tokio — 200+ crates not in Guix.  No binary releases published
;; for Linux.
;; A1: no binary releases; A2: cargo dep tree massive; A3: Guix has other Matrix clients.

;; #17146 yt-dlg-git
;; BLOCKED: WXPYTHON_NOT_AVAILABLE — Python GUI using wxPython (wxWidgets Python
;; bindings).  python-wxpython is not packaged in Guix; it requires wxWidgets 3.2+
;; C++ build with Python bindings.
;; A1: wxPython not in Guix; A2: wxWidgets available but Python bindings complex;
;; A3: no alternative GUI framework version exists.

;; #18950 bottles-git
;; BLOCKED: COMPLEX_PYTHON_MESON_DEPS — Python/Meson/GTK4 application with complex
;; runtime dependencies (patool, pefile, orjson, icoextract, fvs, vkbasalt-cli).
;; Multiple Python deps not in Guix.
;; A1: 10+ Python deps missing; A2: Flatpak is upstream-preferred distribution;
;; A3: no reduced-dep version available.

;; #19173 jitsi-meet-bin
;; BLOCKED: ELECTRON_BINARY_COMPLEX — Jitsi Meet desktop is Electron app; .deb binary
;; requires electron runtime wrapping + extensive patchelf.
;; A1: AppImage/deb needs FUSE-free extract + patchelf; A2: depends on Electron;
;; A3: web interface available as alternative (no desktop packaging needed).

;; #19141 popsicle-bin
;; BLOCKED: CARGO_DEPS_NOT_AVAILABLE — Rust/GTK4 USB flasher by System76; cargo deps
;; include gtk4-rs, cascade, distinst-disk — 100+ crates not in Guix.  No binary
;; release for generic Linux (only .deb for Pop!_OS).
;; A1: no AppImage/tarball release; A2: cargo deps massive; A3: Guix has gnome-disks.

;; #19127 zsa-kontroll-bin
;; BLOCKED: CARGO_DEPS_NOT_AVAILABLE — Rust CLI for ZSA Keymapp API; cargo deps include
;; reqwest, tokio, serde — 100+ crates not in Guix.  No binary release published.
;; A1: no binary releases; A2: cargo dep tree massive; A3: no simpler alternative.
