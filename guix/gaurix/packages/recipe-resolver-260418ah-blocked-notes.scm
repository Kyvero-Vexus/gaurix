;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Blocked notes for recipe-resolver-260418ah
;;; 6 packages BLOCKED with NEEDS_RECIPE_DESIGN_EXHAUSTED.
;;;
;;; 25. pencil-dev-appimage
;;;     PROPRIETARY: closed-source commercial design tool
;;;     A1: No source code available; proprietary "custom" license
;;;     A2: Download URL is non-versioned (redirects to Google Cloud Storage)
;;;     A3: License prohibits redistribution; FSDG violation
;;;     Exhausted: all approaches require proprietary binary; skip
;;;
;;; 26. udiskr
;;;     RUST_NIGHTLY: requires Rust nightly toolchain
;;;     A1: cargo-build-system with stable Rust -- fails: uses
;;;         `-Zbuild-std-features=` nightly-only flag
;;;     A2: Remove -Z flags and build with stable -- upstream code
;;;         uses unstable features that require nightly
;;;     A3: Binary release -- no binary releases on GitHub
;;;     Exhausted: upstream requires nightly Rust; not available in Guix
;;;
;;; 27. loopi-bin
;;;     ELECTRON_COMPLEX: Electron desktop app with 24+ native deps
;;;     A1: Binary .deb extraction + patchelf -- requires patching
;;;         24+ shared libraries (gtk3, nss, mesa, alsa, pango, cairo, etc.)
;;;     A2: Build from source -- requires Node.js + Electron builder
;;;         infrastructure not available in Guix
;;;     A3: AppImage wrapper -- no AppImage release available;
;;;         only .deb and Windows installers
;;;     Exhausted: Electron packaging infeasible without Guix electron infra
;;;
;;; 28. passless
;;;     RUST_COMPLEX: vendored crates + hidapi + systemd integration
;;;     A1: cargo-build-system with vendored deps -- requires enumerating
;;;         100+ individual crate packages not in Guix
;;;     A2: Use vendor.tar.gz from release -- Guix cargo-build-system
;;;         does not support pre-vendored archives natively
;;;     A3: Binary release -- available but requires libgit2, hidapi,
;;;         systemd-libs at runtime; complex patchelf work
;;;     Exhausted: large Rust dep tree; beyond single-pass scope
;;;
;;; 29. joy2key
;;;     ORPHANED: unmaintained joystick-to-keyboard mapper
;;;     A1: Build from git with autotools -- repo has no tags or releases;
;;;         last commit 2015; requires autoreconf
;;;     A2: Use SourceForge tarball -- SourceForge project page is dead
;;;     A3: Package is flagged out-of-date and orphaned in AUR
;;;     Exhausted: no maintained source; recommend evdev-based alternatives
;;;
;;; 30. lightdm-settings
;;;     MISSING_DEPS: requires multiple packages not in Guix
;;;     A1: Package with available deps -- needs lightdm-slick-greeter
;;;         (not in Guix), python-xapp (not in Guix), python-setproctitle
;;;     A2: Package slick-greeter first -- requires lightdm-webkit2-greeter
;;;         and Linux Mint ecosystem packages
;;;     A3: Patch out missing deps -- core functionality depends on
;;;         slick-greeter; would be non-functional
;;;     Exhausted: Linux Mint ecosystem deps not in Guix; needs dedicated effort
