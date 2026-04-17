;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Blocked notes for recipe-resolver-260416i
;;; 4 packages BLOCKED out of 30 attempted.

;;; 27. gotify-tray-cpp — BLOCKED: NEEDS_RECIPE_DESIGN
;;; Reason: C++/CMake/Qt6 project requiring qt6-websockets (QtWebSockets module).
;;; Qt6 WebSockets availability in Guix not confirmed; building from source
;;; requires verifying qt6-websockets presence or packaging it first.
;;; Attempts:
;;;   A1: Checked Qt6 modules in Guix — qtbase-6 available, qt6-websockets not found.
;;;   A2: Considered Qt5 build path — upstream uses Qt6 CMake targets exclusively.
;;;   A3: Considered binary packaging — no release binaries provided (source-only).
;;; Disposition: BLOCKED: NEEDS_RECIPE_DESIGN — requires qt6-websockets to be
;;; packaged in Guix or Gaurix first.

;;; 28. screenpipe-bin — BLOCKED: NEEDS_RECIPE_DESIGN
;;; Reason: AUR package is orphaned (no maintainer). Version tag confusion:
;;; CLI releases use v0.3.x track, desktop/app releases use app-v2.x track
;;; with no downloadable binary assets. The AUR PKGBUILD on disk references
;;; v2.2.165 which does not exist as a GitHub tag.
;;; Attempts:
;;;   A1: Checked GitHub releases for v0.3.135 CLI binary — asset URL pattern
;;;       may work but reliability of future releases is unknown (orphaned).
;;;   A2: Checked app-v2.x releases — no binary assets, only source tags.
;;;   A3: Checked for alternative distribution (Flathub, snap) — none found.
;;; Disposition: BLOCKED: NEEDS_RECIPE_DESIGN — orphaned AUR, unstable release
;;; versioning, no reliable binary distribution URL.

;;; 29. sticker-convert — BLOCKED: NEEDS_RECIPE_DESIGN
;;; Reason: Python package on PyPI (v2.20.2.0) with 13+ dependencies including
;;; forked packages not in Guix: ttkbootstrap-fork-laggykiller,
;;; signalstickers-client-fork-laggykiller. Also needs apngasm-python (C++
;;; native extension), python-av (ffmpeg bindings), and many other non-standard
;;; Python packages.
;;; Attempts:
;;;   A1: Checked PyPI dependency list — 13+ deps not in Guix including 2 forks.
;;;   A2: Considered packaging just the CLI subset — still requires fork deps.
;;;   A3: Considered binary/AppImage distribution — none available.
;;; Disposition: BLOCKED: NEEDS_RECIPE_DESIGN — requires packaging 13+ Python
;;; dependencies including upstream forks.

;;; 30. reticulum-meshchat-bin — BLOCKED: NEEDS_RECIPE_DESIGN
;;; Reason: Electron/Node.js application distributed only as AppImage. No
;;; native build path without npm/electron toolchain. AppImage extraction
;;; requires FUSE or --appimage-extract which creates a large unpacked tree
;;; with bundled Chromium.
;;; Attempts:
;;;   A1: Checked GitHub releases — only AppImage format available.
;;;   A2: Checked for alternative packages (Flatpak, .deb) — none found.
;;;   A3: Considered source build — requires electron 30, Vue.js, 30+ npm deps.
;;; Disposition: BLOCKED: NEEDS_RECIPE_DESIGN — Electron AppImage only, no
;;; native build path, npm/electron toolchain not in Guix.
