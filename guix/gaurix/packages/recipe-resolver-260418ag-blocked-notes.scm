;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Blocked notes for recipe-resolver-260418ag
;;;
;;; This file documents packages that could not be resolved
;;; in this NEEDS_RECIPE_DESIGN pass, with exhausted approaches.

(define-module (gaurix packages recipe-resolver-260418ag-blocked-notes))

;;; -------------------------------------------------------------------
;;; 25. archium-bin — BLOCKED: ARCH_SPECIFIC
;;;
;;; Archium is a wrapper for AUR helpers (yay, paru) that provides a
;;; unified interface for managing Arch Linux packages.  It has no
;;; utility on a Guix system because:
;;;   A1: Requires yay or paru (AUR helpers) — these are Arch-only tools
;;;   A2: Wraps pacman operations — pacman is not available on Guix
;;;   A3: No cross-distro functionality; purely Arch ecosystem tool
;;; -------------------------------------------------------------------

;;; -------------------------------------------------------------------
;;; 26. dupeguru — BLOCKED: SOURCE_BUILD_COMPLEX
;;;
;;; DupeGuru is a Python application that must be built from source.
;;; Not a binary package (no -bin suffix in AUR).
;;;   A1: Requires python-pyqt5, python-polib, python-semantic-version,
;;;       python-xxhash, python-mutagen, python-send2trash — multiple
;;;       missing Python deps in Guix
;;;   A2: Build uses custom build.py script, not standard setuptools
;;;   A3: GitHub releases have .deb/.rpm but those require extracting
;;;       and patching complex directory trees
;;; -------------------------------------------------------------------

;;; -------------------------------------------------------------------
;;; 27. fchat-horizon-bin — BLOCKED: ELECTRON_COMPLEX
;;;
;;; Fchat Horizon requires system Electron and complex resource
;;; extraction from a tarball:
;;;   A1: Needs system electron package (not in Gaurix)
;;;   A2: Requires libnotify, libsecret, libappindicator-gtk3
;;;   A3: Resource-only install pattern needs electron wrapper script
;;;       with specific version pinning
;;; -------------------------------------------------------------------

;;; -------------------------------------------------------------------
;;; 28. elecwhat-bin — BLOCKED: ELECTRON_COMPLEX
;;;
;;; ElecWhat distributes as .pacman archive format:
;;;   A1: .pacman format is Arch-specific (zstd-compressed tar)
;;;   A2: Requires system electron37 (not in Guix, Electron 37 EOL)
;;;   A3: app.asar + app.asar.unpacked pattern requires electron runner
;;; -------------------------------------------------------------------

;;; -------------------------------------------------------------------
;;; 29. ytdownloader-gui-bin — BLOCKED: ELECTRON_COMPLEX
;;;
;;; ytDownloader distributes as .rpm format:
;;;   A1: .rpm extraction adds complexity; no .tar.gz or AppImage available
;;;   A2: Requires system electron30 (not in Guix)
;;;   A3: Electron resource-only install needs version-pinned wrapper
;;; -------------------------------------------------------------------

;;; -------------------------------------------------------------------
;;; 30. mkbrr-gui-bin — BLOCKED: RELEASE_CANDIDATE
;;;
;;; mkbrr-gui is currently at v1.19.0-rc.1 (release candidate):
;;;   A1: Not a stable release; version may change significantly
;;;   A2: Tauri-based app requires webkit2gtk-4.1 + libsoup3 + gtk3
;;;       runtime dependencies with specific version requirements
;;;   A3: Will re-evaluate when stable release is published
;;; -------------------------------------------------------------------
