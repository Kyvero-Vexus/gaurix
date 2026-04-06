;;; Round-22 worker-03 NEEDS_RECIPE_DESIGN resolution pass #9: blocked notes.
;;; 21 packages re-blocked with specific reasons after investigation.
(define-module (gaurix packages cron-c79f127f-r22-w03-nrd9-blocked-notes))

;; ── rapidraw ─────────────────────────────────────────────────────
;; BLOCKED: BUILD_SYSTEM_TOO_COMPLEX — Tauri framework requires integrated
;; cargo + npm build pipeline with cargo-tauri CLI.  Guix has no Tauri
;; build-system support.  Would need full npm dependency tree vendored
;; plus Rust crate deps.  Upstream: https://github.com/CyberTimon/RapidRAW

;; ── weasis-bin ───────────────────────────────────────────────────
;; BLOCKED: BUILD_SYSTEM_TOO_COMPLEX — Java/Maven application with massive
;; dependency tree.  Source at https://github.com/nroduit/Weasis (EPL-2.0).
;; Needs Maven build with dozens of Java library deps not yet in Guix.

;; ── p7zip-gui ────────────────────────────────────────────────────
;; BLOCKED: DEAD_UPSTREAM — p7zip last released 16.02 in 2016.  The wxWidgets
;; GUI (7zFM) portion is unmaintained and rarely builds cleanly on Linux.
;; Guix has p7zip CLI already.  sourceforge.net/projects/p7zip/

;; ── yed ──────────────────────────────────────────────────────────
;; BLOCKED: NONFREE_LICENSE — Proprietary freeware graph editor from yWorks.
;; No source code available.  Cannot be packaged in a free software channel.

;; ── unigine-heaven ───────────────────────────────────────────────
;; BLOCKED: NONFREE_LICENSE — Proprietary GPU benchmark from Unigine Corp.
;; Binary-only distribution with custom license.  No source available.

;; ── breitbandmessung-bin ─────────────────────────────────────────
;; BLOCKED: NONFREE_LICENSE — Proprietary Electron app from German Federal
;; Network Agency (Bundesnetzagentur/zafaco GmbH).  No source available.

;; ── ancient-packages ─────────────────────────────────────────────
;; BLOCKED: ARCH_SPECIFIC — Depends on package-query which queries the
;; Arch Linux pacman database.  Entirely Arch-specific with no applicability
;; to Guix package management.

;; ── tidal-hifi ───────────────────────────────────────────────────
;; BLOCKED: ELECTRON_NONFREE — Electron wrapper for Tidal streaming service.
;; Requires Widevine DRM for playback.  Massive npm dependency tree.
;; Upstream: https://github.com/Mastermindzh/tidal-hifi

;; ── marp-cli ─────────────────────────────────────────────────────
;; BLOCKED: NODE_DEP_AVALANCHE — Node.js CLI with hundreds of transitive npm
;; dependencies.  Guix node ecosystem lacks most of these packages.
;; Upstream: https://github.com/marp-team/marp-cli (MIT license).

;; ── ssacli-bin ───────────────────────────────────────────────────
;; BLOCKED: NONFREE_LICENSE — HPE Smart Storage Administrator CLI.
;; Proprietary binary with no source code.  No public download URL.

;; ── tuxboot ──────────────────────────────────────────────────────
;; BLOCKED: DEAD_DEPENDENCY — Requires Qt4 which has been removed from Guix
;; (EOL since 2015).  Project appears unmaintained.  Would need Qt5/6 port.
;; Upstream: http://www.tuxboot.org/

;; ── scratch3-bin ─────────────────────────────────────────────────
;; BLOCKED: ELECTRON_BUNDLE — Electron-based binary distribution of Scratch 3.0.
;; Source build requires full Electron toolchain.  Binary redistribution
;; bundles Chromium.  Upstream: https://scratch.mit.edu

;; ── libstdc++5-bin ───────────────────────────────────────────────
;; BLOCKED: LEGACY_TOOLCHAIN — Legacy libstdc++ from GCC 3.3 era.
;; Building from source requires GCC 3.3 which is not in Guix.
;; Binary redistribution of a single .so is fragile and version-locked.

;; ── cevomapgen ───────────────────────────────────────────────────
;; BLOCKED: MISSING_TOOLCHAIN — Requires Free Pascal compiler (fpc) and
;; Lazarus IDE with Qt6 bindings (qt6pas).  None of these are packaged
;; in Guix.  Major toolchain packaging effort required first.

;; ── slippi-launcher-bin ──────────────────────────────────────────
;; BLOCKED: ELECTRON_NONFREE — Prebuilt Electron binary for Super Smash Bros
;; Melee netplay.  Tied to proprietary game ecosystem.
;; Upstream: https://github.com/project-slippi/slippi-launcher

;; ── element-web-git ──────────────────────────────────────────────
;; BLOCKED: ALREADY_IN_GUIX — Guix already provides element-desktop v1.12.2.
;; A -git variant is unnecessary; version bumps should go through the
;; existing package.  Upstream: https://github.com/vector-im/element-web

;; ── rapidraw-bin ─────────────────────────────────────────────────
;; BLOCKED: BINARY_REDISTRIBUTION — Prebuilt Tauri/Rust binary shipped as .deb.
;; Prefer source build (see rapidraw entry).  Binary has webkit2gtk runtime deps
;; that may not match Guix library versions.

;; ── vita3k-git ───────────────────────────────────────────────────
;; BLOCKED: EXCESSIVE_VENDORED_DEPS — PlayStation Vita emulator with 30+
;; git submodule dependencies.  CMake build with clang/lld required.
;; Reproducing the submodule tree in Guix is extremely complex.
;; Upstream: https://github.com/Vita3K/Vita3K

;; ── discord-electron-openasar ────────────────────────────────────
;; BLOCKED: NONFREE_LICENSE — Discord client (proprietary service ToS).
;; Downloads nonfree Discord tarball and patches with OpenAsar.
;; Cannot be distributed in a free software channel.

;; ── audiorelay ───────────────────────────────────────────────────
;; BLOCKED: NONFREE_LICENSE — Proprietary Java application for streaming
;; PC audio.  Unknown/proprietary license.  No source code available.
;; Upstream: https://audiorelay.net

;; ── kind ─────────────────────────────────────────────────────────
;; BLOCKED: ALREADY_IN_GUIX — Guix already provides kind v0.27.0
;; (go-build-system).  AUR version is 0.31.0.  Needs version bump on
;; the existing upstream Guix package, not a channel duplicate.
