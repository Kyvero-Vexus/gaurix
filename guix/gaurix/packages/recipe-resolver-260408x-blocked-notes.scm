;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Blocked notes for recipe-resolver-260408x
;;; 10 packages re-evaluated with concrete blocking reasons.

(define-module (gaurix packages recipe-resolver-260408x-blocked-notes))

;;; rexit-git
;;; AUR: rexit-git r20.4e33f53-1
;;; URL: https://github.com/Ninso112/rexit
;;; Status: BLOCKED — CARGO_DEPS_NOT_AVAILABLE
;;; TUI power menu for Linux written in Rust.  Requires full cargo-inputs
;;; enumeration for transitive crate dependencies.  guix import crate
;;; does not cover all transitive deps.
;;; Approaches tried:
;;;   A1: guix import crate — incomplete results, many transitive deps missing
;;;   A2: manual cargo-inputs enumeration — too many crates for batch scope
;;;   A3: pre-built binary from releases — no pre-built binaries available

;;; tuack-ng-git
;;; AUR: tuack-ng-git 0.4.0-1
;;; URL: https://github.com/tuack-ng/tuack-ng
;;; Status: BLOCKED — CARGO_DEPS_NOT_AVAILABLE
;;; Refactored tuack project for efficient test generation, written in Rust.
;;; Same cargo vendoring blocker as rexit-git.
;;; Approaches tried:
;;;   A1: guix import crate — incomplete, many transitive deps not in Guix
;;;   A2: manual enumeration — excessive for batch processing
;;;   A3: no pre-built binary releases available

;;; upi
;;; AUR: upi 0.1.4-1
;;; URL: https://github.com/skorotkiewicz/upi
;;; Status: BLOCKED — CARGO_DEPS_NOT_AVAILABLE
;;; Rust daemon that monitors URLs and triggers scripts on content changes.
;;; Requires cargo-build-system with full vendored crate enumeration.
;;; Approaches tried:
;;;   A1: guix import crate upi — package not on crates.io
;;;   A2: manual Cargo.lock inspection — multiple transitive deps not in Guix
;;;   A3: no pre-built binary releases available on GitHub

;;; alacritty-nox-git
;;; AUR: alacritty-nox-git 1:0.16.1-1
;;; URL: https://github.com/alacritty/alacritty
;;; Status: BLOCKED — CARGO_DEPS_NOT_AVAILABLE
;;; Wayland-only variant of Alacritty terminal emulator.  Guix already has
;;; alacritty in (gnu packages rust-apps) with X11 support.  Building a
;;; Wayland-only variant requires cargo-build-system with full crate deps
;;; and feature flag customization.
;;; Approaches tried:
;;;   A1: inherit from upstream alacritty — no straightforward feature toggle
;;;   A2: guix import crate alacritty — 200+ transitive crate deps
;;;   A3: upstream Guix alacritty already supports Wayland via X11+Wayland

;;; ethtui
;;; AUR: ethtui 0.1.0-1
;;; URL: https://github.com/skibidiandulka/ethtui
;;; Status: BLOCKED — CARGO_DEPS_NOT_AVAILABLE
;;; TUI for Ethernet status display written in Rust.
;;; Requires cargo-build-system with crate dependency vendoring.
;;; Approaches tried:
;;;   A1: guix import crate — package not on crates.io
;;;   A2: manual Cargo.lock inspection — needs ratatui and tokio crates
;;;   A3: no pre-built binary releases available

;;; oxicord-git
;;; AUR: oxicord-git 0.1.9-1
;;; URL: https://github.com/linuxmobile/oxicord
;;; Status: BLOCKED — CARGO_DEPS_NOT_AVAILABLE
;;; Vim-native Discord TUI for terminal enthusiasts, written in Rust.
;;; Requires cargo-build-system with full vendored crate enumeration.
;;; Also requires Discord API access which may have ToS implications.
;;; Approaches tried:
;;;   A1: guix import crate — package not on crates.io
;;;   A2: manual Cargo.lock inspection — many transitive deps (chafa, dbus)
;;;   A3: no pre-built binary releases available

;;; zerobrew-git
;;; AUR: zerobrew-git r109.31b8d83-1
;;; URL: https://github.com/lucasgelfond/zerobrew
;;; Status: BLOCKED — CARGO_DEPS_NOT_AVAILABLE
;;; Drop-in faster Homebrew alternative written in Rust.
;;; Requires cargo-build-system with full vendored crate enumeration.
;;; Approaches tried:
;;;   A1: guix import crate — not on crates.io
;;;   A2: manual Cargo.lock — sqlite, openssl, zlib deps + many crates
;;;   A3: no pre-built binary releases available

;;; archforge-git
;;; AUR: archforge-git 0.2.2-1
;;; URL: https://github.com/Scqxd/archforge
;;; Status: BLOCKED — ARCH_SPECIFIC + CARGO_DEPS_NOT_AVAILABLE
;;; AI-powered TUI for PKGBUILD generation and AUR management.
;;; Arch Linux-specific tool with no utility on Guix (generates PKGBUILDs,
;;; manages AUR packages).  Also requires Rust cargo-build-system with
;;; full crate enumeration.
;;; Approaches tried:
;;;   A1: evaluate portability — tool is fundamentally Arch-specific
;;;   A2: guix import crate — not on crates.io
;;;   A3: no pre-built binary releases available

;;; codelldb
;;; AUR: codelldb 1.12.1-2
;;; URL: https://github.com/vadimcn/codelldb
;;; Status: BLOCKED — COMPLEX_MULTI_TOOL_BUILD
;;; Native debugger extension for VSCode based on LLDB.  Requires
;;; simultaneous Rust/Cargo + Node.js/npm build chains plus specific
;;; LLDB version matching.  Also requires libc++ which needs special
;;; handling in Guix.
;;; Approaches tried:
;;;   A1: cargo-build-system — also needs npm for frontend, multi-tool
;;;   A2: pre-built vsix from GitHub releases — extension format, not standalone
;;;   A3: separate Rust backend + Node frontend — too complex for batch

;;; bsky-electron-git
;;; AUR: bsky-electron-git 0.5.0-1
;;; URL: https://github.com/CaffeeLake/bsky-electron
;;; Status: BLOCKED — ELECTRON_NOT_IN_GUIX
;;; Bluesky social media Electron client.  Guix lacks Electron packaging
;;; infrastructure (electron binary, node-build-system integration for
;;; Electron apps).  Building from source requires pnpm + npm + Electron
;;; rebuild.
;;; Approaches tried:
;;;   A1: node-build-system — Guix node-build-system doesn't support Electron
;;;   A2: binary AppImage — no AppImage releases available
;;;   A3: web wrapper alternative — not a direct equivalent
