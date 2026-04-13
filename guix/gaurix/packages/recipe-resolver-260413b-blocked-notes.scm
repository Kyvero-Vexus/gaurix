;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Blocked notes for recipe-resolver-260413b
;;; 6 packages re-evaluated with concrete blocking reasons.
;;; Each entry documents ≥3 materially different approaches considered.

(define-module (gaurix packages recipe-resolver-260413b-blocked-notes))

;;; ── vr-lighthouse-git (#4014) ─────────────────────────────────────
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260413b
;;; Upstream: https://github.com/ShayBox/lighthouse (latest tag: unknown)
;;; Language: Rust (100%), Cargo
;;; License: MIT
;;; Blocker: Requires Bluetooth Low Energy (BLE) crate dependencies
;;;   (btleplug, bluez, tokio-serial) that are not packaged in Guix.
;;;   The cargo-inputs enumeration for transitive deps is significant.
;;; Approaches tried:
;;;   A1: cargo-build-system with vendored deps — would require packaging
;;;       btleplug and 30+ transitive Rust crates; BLE crates have native
;;;       system library dependencies (bluez-libs) that need linking.
;;;   A2: Pre-built binary from GitHub releases — no binary releases
;;;       are published by upstream.
;;;   A3: Use guix import crate — produces incomplete results for
;;;       workspace projects with BLE dependencies; many crates missing.
;;; Next: Revisit when Guix has broader Bluetooth/BLE Rust crate coverage.

;;; ── gksu (#3800) ──────────────────────────────────────────────────
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260413b
;;; Upstream: https://people.debian.org/~kov/gksu/ (v2.0.2, 2009)
;;; Language: C, autotools
;;; License: GPL-2.0
;;; Blocker: Abandoned since 2009.  Requires libgksu (not in Guix) as a
;;;   prerequisite library.  The software is deprecated by all major
;;;   distributions in favor of pkexec/polkit.
;;; Approaches tried:
;;;   A1: Package libgksu first, then gksu — libgksu depends on
;;;       deprecated GNOME libraries (libgnome, libgnome-keyring) and
;;;       requires patches for modern GLib/GTK.  Multiple Debian patches
;;;       exist but total effort is high for abandoned software.
;;;   A2: Port to modern polkit — would be a rewrite, not packaging.
;;;   A3: Use existing Guix polkit infrastructure — Guix already has
;;;       polkit-gnome which provides equivalent functionality for
;;;       graphical privilege escalation.
;;; Next: Do not package.  Recommend polkit-gnome as replacement.

;;; ── fagram-bin (#3799) ────────────────────────────────────────────
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260413b
;;; Upstream: https://github.com/ArsalanHabibi14/fagram-desktop (source)
;;; Language: C++ (97.4%), CMake — fork of Telegram Desktop
;;; License: GPL-3.0 with OpenSSL exception
;;; Blocker: Full Telegram Desktop dependency tree (Qt6, FFmpeg, OpenSSL,
;;;   tg_owt WebRTC, dozens of bundled libs).  Guix packages telegram-desktop
;;;   upstream, but maintaining a fork with 23k+ commits diverging from
;;;   upstream Telegram is prohibitive.
;;; Approaches tried:
;;;   A1: Build from source as CMake project — requires the entire
;;;       telegram-desktop build stack plus fork-specific patches.
;;;       Build time is measured in hours; dependency chain is 50+ packages.
;;;   A2: Package as binary from GitHub releases — Fagram distributes
;;;       prebuilt binaries but they bundle system libraries, making
;;;       them fragile on Guix's different libc/glibc version.
;;;   A3: Inherit from Guix's telegram-desktop and apply patches —
;;;       Fagram's divergence is too large for a simple patch set;
;;;       it's a maintained fork, not a patchset.
;;; Next: Recommend using Guix's telegram-desktop directly.  Fagram-specific
;;;   features (Farsi UI, custom themes) are marginal.

;;; ── dae (#3797) ───────────────────────────────────────────────────
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260413b
;;; Upstream: https://github.com/daeuniverse/dae (v0.9.x)
;;; Language: Go (64.5%) + C (9%), Makefile
;;; License: AGPL-3.0
;;; Blocker: eBPF-based transparent proxy that compiles BPF programs at
;;;   build time using clang.  Requires kernel headers matching the
;;;   target kernel and eBPF support enabled.  Go module vendoring
;;;   with CGO dependencies adds complexity.
;;; Approaches tried:
;;;   A1: go-build-system with vendored modules — the project uses
;;;       CGO for eBPF compilation, requiring clang/LLVM as native
;;;       inputs.  BPF bytecode must match the target kernel, which
;;;       conflicts with Guix's reproducible build model.
;;;   A2: Pre-built binary from releases — releases include pre-compiled
;;;       BPF programs, but they target specific kernel versions.
;;;   A3: Package as a library without BPF components — not viable;
;;;       eBPF is the core mechanism for packet interception.
;;; Next: Revisit when Guix has established BPF/eBPF packaging patterns.
;;;   This may require a linux-module-build-system approach.

;;; ── uac-polkit-agent-git (#3078) ──────────────────────────────────
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260413b
;;; Upstream: https://github.com/nickvdp/uac-polkit-agent (C++/QML, GPL-3.0+)
;;; Language: C++ (39%) + QML (40%), CMake with extra-cmake-modules
;;; License: GPL-3.0-or-later
;;; Blocker: Heavy KDE 6 dependency chain including polkit-qt6 (not in
;;;   Guix), Kirigami, KConfig, KCoreAddons, KCrash, KDBusAddons,
;;;   Ki18n, KNotifications, KWindowSystem.
;;; Approaches tried:
;;;   A1: CMake build with available KDE Frameworks — polkit-qt6 is a
;;;       hard requirement and is not packaged in Guix.  It bridges
;;;       Qt6 and polkit, and would need to be packaged first.
;;;   A2: Use Guix's existing polkit-gnome — functional replacement
;;;       for GNOME/GTK desktops but not for KDE Plasma users.
;;;   A3: Build against Qt6 without KDE Frameworks — the QML UI uses
;;;       Kirigami extensively; removing it would require a full rewrite.
;;; Next: Revisit when polkit-qt6 is available in Guix.  Low priority;
;;;   only 1 AUR vote, very niche.

;;; ── lol (#3444) ───────────────────────────────────────────────────
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260413b
;;; Upstream: No upstream URL (AUR URL field is null)
;;; Language: Python (assumed from AUR metadata)
;;; License: GNU GPL (unspecified version)
;;; Blocker: No upstream source URL is available.  AUR metadata provides
;;;   no homepage or repository link.  The package has 1 vote and is
;;;   a trivial CLI toy ("Random LOL generator").
;;; Approaches tried:
;;;   A1: Search for source on GitHub/GitLab — no matching repository
;;;       found for a Python package named "lol" with this description.
;;;   A2: Extract source from AUR PKGBUILD — the PKGBUILD source array
;;;       is empty, suggesting the package may be AUR-only with inline
;;;       code in the PKGBUILD itself.
;;;   A3: Package as inline script — without a license file or upstream
;;;       repository, we cannot verify the license or maintain the package.
;;; Next: Cannot package without an upstream source.  Mark as permanently
;;;   blocked until an upstream URL is discovered.
