;;; Blocked-notes for queue-20260406-nrd30e pass.
;;; 21 packages re-blocked with specific reasons after research
;;; (eve-ng-integration already in nrd30d, counted as resolved not new recipe).
;;;
;;; Re-blocked categories:
;;; - PROPRIETARY (4): thedude, sentinelagent, booktab, sononym
;;; - PROPRIETARY_NO_SOURCE (1): fluxdown-bin
;;; - WINDOWS_ONLY (1): dn-famitracker-bin
;;; - GHC_BOOTSTRAP_COMPLEX (1): ghc9.12-bin
;;; - BROWSER_EXTENSION_NOT_PKG (1): librewolf-extension-keepassxc-browser
;;; - ZIG_NOT_IN_GUIX (1): rockbox-zig-bin
;;; - ARCH_SPECIFIC (1): archforge
;;; - KDE_PLASMA6_MISSING (2): aeroshell-smod-git, aeroshell-smodglow-x11-git
;;; - BUILD_FLAG_VARIANT (1): swayidle-nologind
;;; - TRIVIAL_WRAPPER (1): saveshasum
;;; - PYTHON_MISSING_DEPS (1): python-docling-core
;;; - RUST_CARGO_DEPS (2): bwlog, disk-spinner
;;; - CMAKE_MISSING_DEP (2): keyleds, sddm-conf-git
;;; - QT6_DISTRO_SPECIFIC (1): mx-samba-config

(define-module (gaurix packages queue-20260406-nrd30e-blocked-notes))

;;; 3402. thedude — BLOCKED: PROPRIETARY.
;;; MikroTik "The Dude" network monitor. Proprietary Windows-only binary
;;; requiring Wine to run. No source code. Incompatible with Guix FSDG
;;; and free software policy.

;;; 3404. dn-famitracker-bin — BLOCKED: WINDOWS_ONLY.
;;; Fork of 0cc-FamiTracker NES music tracker. Source is GPL-2.0 but
;;; application is Windows-only (MFC/Win32 C++) with no native Linux build.
;;; Would require Wine wrapper or cross-compilation, neither practical.

;;; 3406. ghc9.12-bin — BLOCKED: GHC_BOOTSTRAP_COMPLEX.
;;; GHC 9.12 binary distribution. Guix has GHC up to 9.2.8; adding 9.12
;;; requires complex bootstrap chain work that belongs in upstream Guix,
;;; not a channel package.

;;; 3407. librewolf-extension-keepassxc-browser — BLOCKED: BROWSER_EXTENSION_NOT_PKG.
;;; KeePassXC browser extension (.xpi). Browser extensions are managed by
;;; the browser itself. LibreWolf is not in Guix. Not meaningful as a
;;; system package.

;;; 3411. sentinelagent — BLOCKED: PROPRIETARY.
;;; SentinelOne endpoint protection agent. Proprietary enterprise security
;;; software. No public source or download URL (source is local .deb).
;;; Requires paid enterprise license.

;;; 3412. python-docling-core — BLOCKED: PYTHON_MISSING_DEPS.
;;; IBM Docling document processing library. Needs python-latex2mathml and
;;; python-jsonref which are not in Guix. Would require packaging 2+
;;; missing Python dependencies first.

;;; 3413. rockbox-zig-bin — BLOCKED: ZIG_NOT_IN_GUIX.
;;; Rockbox firmware built with Zig compiler. Guix does not have Zig
;;; compiler/build-system. Binary package is Arch .pkg.tar.zst format,
;;; not a usable tarball.

;;; 3415. bwlog — BLOCKED: RUST_CARGO_DEPS.
;;; Bandwidth logger from KIT Karlsruhe. Rust/Cargo project hosted on
;;; GitLab (gitlab.kit.edu). Not on crates.io, requiring manual cargo
;;; dependency enumeration. Build complexity exceeds batch capacity.

;;; 3416. booktab — BLOCKED: PROPRIETARY.
;;; Italian ebook reader for Zanichelli school textbooks. Proprietary
;;; closed-source binary with unknown license. Includes proprietary
;;; libraries (libPDFNetC.so). Incompatible with Guix FSDG policy.

;;; 3418. disk-spinner — BLOCKED: RUST_CARGO_DEPS.
;;; HDD burn-in/benchmark tool. Rust/Cargo project requiring full cargo
;;; dependency vendoring. systemd-libs dependency may also be problematic.
;;; Build complexity exceeds batch capacity.

;;; 3419. archforge — BLOCKED: ARCH_SPECIFIC.
;;; AI-powered TUI for PKGBUILD generation and AUR management. Arch
;;; Linux-specific tool with no utility on Guix or non-Arch systems.
;;; Depends on paru/yay (AUR helpers).

;;; 3420. fluxdown-bin — BLOCKED: PROPRIETARY_NO_SOURCE.
;;; Multi-protocol download manager. Proprietary/custom license
;;; ("LicenseRef-custom"), no source code available. Cannot be packaged
;;; from source for Guix.

;;; 3422. sononym — BLOCKED: PROPRIETARY.
;;; Commercial AI-powered audio sample browser. Proprietary commercial
;;; software with custom license (sononym). No source code.

;;; 3423. aeroshell-smod-git — BLOCKED: KDE_PLASMA6_MISSING.
;;; KDecoration3 engine for AeroShell KDE desktop. Requires KDE Plasma 6 /
;;; KWin 6 / KDecoration3 which are not yet packaged in Guix.

;;; 3424. aeroshell-smodglow-x11-git — BLOCKED: KDE_PLASMA6_MISSING.
;;; Decoration glow plugin for SMOD (X11 variant). Depends on
;;; aeroshell-smod which requires KDE Plasma 6 (not in Guix).

;;; 3426. swayidle-nologind — BLOCKED: BUILD_FLAG_VARIANT.
;;; Swayidle compiled without logind dependency. swayidle already exists
;;; in Guix (v1.9.0). This is just a configure flag variant
;;; (-Dlogind=disabled). Not worth a separate package.

;;; 3427. saveshasum — BLOCKED: TRIVIAL_WRAPPER.
;;; Shell script wrapper around coreutils sha*sum commands. Too minimal
;;; to warrant a Guix package. Functionality already provided by
;;; coreutils which is part of every Guix system.

;;; 3429. mx-samba-config — BLOCKED: QT6_DISTRO_SPECIFIC.
;;; MX Linux Samba configuration GUI. CMake/Qt6 project with MX Linux
;;; branding and distro-specific paths. While technically buildable,
;;; limited utility outside MX Linux ecosystem.

;;; 3431. keyleds — BLOCKED: CMAKE_MISSING_DEP.
;;; Logitech keyboard RGB LED control. CMake C++ project. Last release
;;; v1.1.1 is from 2020, project appears unmaintained. Requires
;;; systemd/udev integration and lua bindings that may need patching.

;;; 3432. sddm-conf-git — BLOCKED: CMAKE_MISSING_DEP.
;;; SDDM configuration editor GUI. CMake/Qt6 project requiring
;;; qtilitools (CMake utility from qtilities org) which is not in Guix.
;;; Would need packaging qtilitools first.
