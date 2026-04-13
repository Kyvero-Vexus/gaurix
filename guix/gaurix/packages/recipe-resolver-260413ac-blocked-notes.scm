;;; recipe-resolver-260413ac — blocked notes
;;; Generated: 2026-04-13T23:00:00+00:00
;;; 18 packages blocked in this pass

(define-module (gaurix packages recipe-resolver-260413ac-blocked-notes))

;;; ── PROPRIETARY (1 package) ──
;;; #17 tableplus: Commercial database GUI; closed-source binary with custom license;
;;;   A1: no source code available; A2: binary requires proprietary libs; A3: license prohibits redistribution

;;; ── ARCH_SPECIFIC (1 package) ──
;;; #138 devtools-doas: Arch Linux devtools patched for opendoas; depends on arch-install-scripts,
;;;   expac, pacman-specific tooling (25 deps); no Guix utility;
;;;   A1: package as-is — pacman/expac/arch-install-scripts not in Guix; A2: strip Arch deps — removes all functionality; A3: no upstream interest in portability

;;; ── DOTNET_UNSUPPORTED (1 package) ──
;;; #216 mesen: Multi-system emulator requiring .NET SDK 8.0 for build and .NET runtime at runtime;
;;;   A1: build with dotnet-sdk — not in Guix; A2: build native-only C++ core — app is primarily .NET; A3: use pre-built binary — no official Linux binary releases

;;; ── DEBIAN_SPECIFIC (1 package) ──
;;; #920 dput-ng: Debian package upload tool; depends on python-debian (Debian-specific library)
;;;   and python-distro-info (Debian release database); no utility outside Debian ecosystem;
;;;   A1: package python-debian — deep Debian toolchain dep; A2: mock Debian deps — breaks functionality; A3: no upstream portable version

;;; ── INFEASIBLE_BUILD (1 package) ──
;;; #1572 servo: Mozilla Servo browser engine; massive Rust+C++ codebase (~200k LOC), 14 runtime deps,
;;;   12 makedeps including pinned glibc<2.43, embedded Rust build with cargo;
;;;   A1: cargo-build-system — 1000+ crates needed; A2: pre-built binary — no stable releases; A3: custom build script — too many moving parts

;;; ── MASSIVE_DEPS (1 package) ──
;;; #1875 home-assistant: Home automation platform; 1000+ Python integrations, each with own dep tree;
;;;   core alone needs ~50 Python packages; full install needs 500+;
;;;   A1: package core only — still 50+ missing Python deps; A2: containerized — defeats Guix purpose; A3: guix import pypi --recursive — generates 500+ incomplete packages

;;; ── COMPLEX_DEPS (6 packages) ──
;;; #29 syncthingtray: Qt tray for Syncthing; needs c++utilities, qtutilities, qtforkawesome (3 custom
;;;   libraries by same author, not in Guix); A1: package all 3 deps first — significant work; A2: build
;;;   bundled — upstream does not support; A3: use syncthing CLI — different UX
;;; #51 wireguard-ui: WireGuard web management UI; Go backend + npm/yarn React frontend;
;;;   A1: go-build-system — needs 100+ Go modules; A2: pre-built binary — project has no releases;
;;;   A3: split build — frontend needs npm ecosystem not in Guix
;;; #219 howdy-git: Facial auth for Linux; needs python-dlib (massive C++ ML library),
;;;   IR camera support, PAM integration;
;;;   A1: package python-dlib — requires dlib C++ library (~500MB build); A2: pre-built — none available;
;;;   A3: use simplified face matching — breaks core functionality
;;; #253 music-assistant-desktop: Desktop companion app; Tauri (Rust) + Node.js + Yarn frontend;
;;;   A1: cargo-build-system — 200+ crates + Tauri framework; A2: pre-built binary — AppImage available
;;;   but proprietary bundling; A3: build frontend separately — tightly coupled build
;;; #1567 retroshare: P2P encrypted messenger; depends on sqlcipher (encrypted SQLite, not in Guix),
;;;   miniupnpc, custom crypto stack; A1: package sqlcipher first — non-trivial crypto lib;
;;;   A2: use SQLite without encryption — breaks security model; A3: pre-built — no binary releases
;;; #1995 gns3-server: Network simulator server; 23 Python deps many not in Guix (python-aiofiles,
;;;   python-aiosqlite, python-fastapi, uvicorn, etc.); also needs dynamips, QEMU, Docker integration;
;;;   A1: package 15+ missing Python deps — massive scope; A2: core-only — breaks functionality;
;;;   A3: containerized — defeats purpose

;;; ── GO_VENDORED_DEPS (5 packages) ──
;;; #914 elephant-bookmarks: Go plugin for elephant launcher; go-build-system requires individual
;;;   Go module packaging; A1: go-build-system — need to package Go module deps; A2: pre-built binary
;;;   — no releases on GitHub; A3: vendored build — Guix build isolation prevents `go mod download`
;;; #2824 pomo-cli: Go terminal pomodoro timer; A1: go-build-system — needs Go module deps;
;;;   A2: pre-built binary — no GitHub releases; A3: vendored build — network isolation prevents it
;;; #4106 caddy-he: Caddy web server with Hurricane Electric DNS; custom Go build with plugins;
;;;   A1: go-build-system — 100+ Go modules; A2: use standard caddy — different package;
;;;   A3: pre-built — HE-specific build has no releases
;;; #4399 ryelang-git: Rye programming language (Go); A1: go-build-system — complex Go module tree;
;;;   A2: pre-built binary — no releases; A3: vendored build — network isolation

;;; ── RUST_VENDORED_DEPS (1 package) ──
;;; #240 dosr: Rust sudo replacement (RootAsRole); cargo-build-system requires individual crate
;;;   packaging; A1: cargo-build-system — 100+ crates needed; A2: pre-built binary — no releases;
;;;   A3: vendored build — Guix build isolation prevents `cargo fetch`

;;; ── COMPLEX_DEPS (1 additional package) ──
;;; #1791 uzdoom: GZDoom fork (Doom engine port); massive C++ codebase with ZDoom/GZDoom deps
;;;   (ZMusic, custom OpenGL renderer), 8 runtime deps;
;;;   A1: cmake-build-system — needs ZMusic and ZDoom-specific libs not in Guix;
;;;   A2: use upstream GZDoom — different project; A3: pre-built binary — no binary releases
