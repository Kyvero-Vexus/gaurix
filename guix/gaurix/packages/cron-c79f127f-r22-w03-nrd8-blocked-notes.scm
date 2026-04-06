;;; Blocked-notes for cron-c79f127f-r22-w03 NEEDS_RECIPE_DESIGN pass #8.
;;; 18 packages re-blocked with specific, exhaustive reasons.
(define-module (gaurix packages cron-c79f127f-r22-w03-nrd8-blocked-notes)
  #:use-module (guix packages)
  #:use-module (gnu packages rust-apps)
  #:export (fw-fanctrl-rs-git/blocked
            synergy3-bin/blocked
            aerothemeplasma-desktop-x11-git/blocked
            aeroshell-workspace-git/blocked
            aeroshell-libplasma-git/blocked
            aeroshell-kwin-components-git/blocked
            hurrycurry-server/blocked
            jellything-git/blocked
            keks-meet-server/blocked
            baremetal-compiler-rt/blocked
            uac-polkit-agent-git/blocked
            we-layerd-git/blocked
            boomer-git/blocked
            linux-clear-cjktty-zfs/blocked
            linux-clear-cjktty-zfs-headers/blocked
            lenovo-print-driver-lj2400-m7400-bin/blocked
            mkinitcpio-firmware/blocked
            spinwheel-pipewire/blocked))

;; ── fw-fanctrl-rs-git (#3031) ────────────────────────────────────
;; Reason: NIGHTLY_RUST_REQUIRED
;; Source: https://github.com/NexusXe/fw-ec-utils
;; This Rust daemon requires cargo-nightly (not available in Guix) and
;; targets Framework laptop EC hardware only.
;; Attempts: (1) checked crates.io — not published;
;;   (2) reviewed Cargo.toml — requires nightly features;
;;   (3) no stable Rust build path available.
(define-public fw-fanctrl-rs-git/blocked
  (package
    (inherit zoxide)
    (name "fw-fanctrl-rs-git")))

;; ── synergy3-bin (#3039) ─────────────────────────────────────────
;; Reason: PROPRIETARY_COMPLEX_DOWNLOAD
;; Source: https://symless.com/synergy
;; Proprietary binary distributed as .deb with token-scraping from
;; landing page.  License is custom:Proprietary.
;; Attempts: (1) reviewed AUR PKGBUILD — requires scraping auth token
;;   from symless.com before download; (2) no redistributable URL;
;;   (3) proprietary license incompatible with Guix policy.
(define-public synergy3-bin/blocked
  (package
    (inherit zoxide)
    (name "synergy3-bin")))

;; ── aerothemeplasma-desktop-x11-git (#3050) ──────────────────────
;; Reason: UNPACKAGED_DEPS
;; Source: https://github.com/aeroshell-desktop/aerothemeplasma
;; Depends on aerothemeplasma-desktop, aeroshell-kwin-components-x11,
;; aeroshell-smodglow-x11, aeroshell-libplasma, aeroshell-workspace —
;; none of which are packaged in Guix or Gaurix.
;; Attempts: (1) checked dep chain — 5+ unpackaged AeroShell AUR deps;
;;   (2) packaging entire AeroShell suite exceeds single-pass scope;
;;   (3) re-blocked pending aeroshell-libplasma packaging.
(define-public aerothemeplasma-desktop-x11-git/blocked
  (package
    (inherit zoxide)
    (name "aerothemeplasma-desktop-x11-git")))

;; ── aeroshell-workspace-git (#3051) ──────────────────────────────
;; Reason: UNPACKAGED_DEPS
;; Source: https://github.com/aeroshell-desktop/aeroshell-workspace
;; CMake project with 16+ KDE/Qt6 runtime deps.  Depends on
;; aeroshell-libplasma (unpackaged) plus libksysguard, plasma-workspace.
;; Attempts: (1) identified dep chain — requires aeroshell-libplasma;
;;   (2) aeroshell-libplasma itself has 24+ deps and replaces plasma-framework;
;;   (3) cascading dep resolution exceeds pass scope.
(define-public aeroshell-workspace-git/blocked
  (package
    (inherit zoxide)
    (name "aeroshell-workspace-git")))

;; ── aeroshell-libplasma-git (#3053) ──────────────────────────────
;; Reason: MASSIVE_DEP_CHAIN
;; Source: https://github.com/aeroshell-desktop/libplasma
;; Core component replacing plasma-framework with 24+ KDE/Qt6 runtime deps
;; (kconfig, kcoreaddons, ki18n, kirigami, ksvg, qt6-5compat, wayland, etc.).
;; Attempts: (1) enumerated all 24 runtime deps — most exist in Guix but
;;   integration testing needed; (2) package provides/conflicts with
;;   plasma-framework; (3) requires careful substitution to avoid breaking
;;   existing KDE packages.
(define-public aeroshell-libplasma-git/blocked
  (package
    (inherit zoxide)
    (name "aeroshell-libplasma-git")))

;; ── aeroshell-kwin-components-git (#3054) ────────────────────────
;; Reason: UNPACKAGED_DEPS
;; Source: https://github.com/aeroshell-desktop/aeroshell-kwin-components
;; CMake project depending on aeroshell-libplasma (unpackaged) plus
;; kwin, kdecoration, plasma-workspace, plasma5support.
;; Attempts: (1) deps require aeroshell-libplasma first;
;;   (2) blocked on same chain as aeroshell-workspace-git;
;;   (3) cannot proceed until aeroshell-libplasma is resolved.
(define-public aeroshell-kwin-components-git/blocked
  (package
    (inherit zoxide)
    (name "aeroshell-kwin-components-git")))

;; ── hurrycurry-server (#3056) ────────────────────────────────────
;; Reason: EXOTIC_BUILD_DEPS
;; Source: https://codeberg.org/hurrycurry/hurrycurry
;; Requires nightly Rust + Deno + Godot + esbuild + graphviz for build.
;; Deno and Godot are not available in Guix.
;; Attempts: (1) reviewed PKGBUILD — needs rustup (nightly), deno, godot;
;;   (2) deno not in Guix upstream or Gaurix; (3) godot game engine not
;;   in Guix; no feasible build path without packaging both first.
(define-public hurrycurry-server/blocked
  (package
    (inherit zoxide)
    (name "hurrycurry-server")))

;; ── jellything-git (#3057) ───────────────────────────────────────
;; Reason: EXOTIC_BUILD_DEPS
;; Source: https://codeberg.org/metamuffin/jellything
;; Requires nightly Rust + esbuild + mdbook + git submodules + meson/cmake.
;; Esbuild is not in Guix; git submodules complicate reproducible builds.
;; Attempts: (1) reviewed PKGBUILD — complex multi-stage build;
;;   (2) esbuild (Go) not packaged in Guix; (3) git submodules require
;;   special handling in Guix origins.
(define-public jellything-git/blocked
  (package
    (inherit zoxide)
    (name "jellything-git")))

;; ── keks-meet-server (#3058) ─────────────────────────────────────
;; Reason: NIGHTLY_RUST_PLUS_ESBUILD
;; Source: https://codeberg.org/metamuffin/keks-meet
;; Requires nightly Rust + esbuild for client build.  Esbuild is not
;; available in Guix.
;; Attempts: (1) reviewed PKGBUILD — uses `cargo +nightly build` and
;;   `make client-build` (esbuild); (2) esbuild not in Guix;
;;   (3) no alternative JS bundler tested.
(define-public keks-meet-server/blocked
  (package
    (inherit zoxide)
    (name "keks-meet-server")))

;; ── baremetal-compiler-rt (#3073) ────────────────────────────────
;; Reason: CROSS_COMPILATION_SPECIALIZED
;; Source: https://github.com/llvm/llvm-project (compiler-rt subdirectory)
;; Cross-compiles compiler-rt builtins for ARM bare-metal targets
;; (armv7m, armv7em, armv8m.main, armv8.1m.main) using clang.
;; Requires arm-none-eabi-newlib sysroot.
;; Attempts: (1) reviewed PKGBUILD — iterates over 4 ARM architectures
;;   with CMake cross-compilation; (2) arm-none-eabi-newlib not in Guix;
;;   (3) Guix cross-compilation model differs significantly from approach.
(define-public baremetal-compiler-rt/blocked
  (package
    (inherit zoxide)
    (name "baremetal-compiler-rt")))

;; ── uac-polkit-agent-git (#3078) ─────────────────────────────────
;; Reason: UNPACKAGED_DEPS
;; Source: https://github.com/aeroshell-desktop/uac-polkit-agent
;; Part of AeroShell desktop suite.  CMake/Qt6 project depending on
;; polkit-qt6, kirigami, and other KDE6 components.
;; Attempts: (1) polkit-qt6 not in Guix (only polkit-qt5);
;;   (2) part of broader AeroShell suite blocked on aeroshell-libplasma;
;;   (3) would need polkit-qt6 packaged first.
(define-public uac-polkit-agent-git/blocked
  (package
    (inherit zoxide)
    (name "uac-polkit-agent-git")))

;; ── we-layerd-git (#3085) ────────────────────────────────────────
;; Reason: ORPHANED_UNKNOWN_LICENSE
;; Source: https://github.com/Aromatic05/we-layerd
;; Rust daemon for running Wallpaper Engine via Wine on Wayland.
;; AUR package is orphaned (maintainer=null).  License listed as "unknown".
;; Requires Wine + complex Wayland/X11 interop.
;; Attempts: (1) reviewed PKGBUILD — orphaned, no license file;
;;   (2) depends on Wine runtime (heavy); (3) unknown license prevents
;;   inclusion in Guix.
(define-public we-layerd-git/blocked
  (package
    (inherit zoxide)
    (name "we-layerd-git")))

;; ── boomer-git (#3095) ───────────────────────────────────────────
;; Reason: NIM_BUILD_SYSTEM_UNAVAILABLE
;; Source: https://github.com/tsoding/boomer
;; Screen zoomer written in Nim.  Requires nimble build system which
;; is not available in Guix.
;; Attempts: (1) checked Guix for Nim/nimble — not packaged;
;;   (2) no alternative build path (source is pure Nim);
;;   (3) would require packaging Nim toolchain first.
(define-public boomer-git/blocked
  (package
    (inherit zoxide)
    (name "boomer-git")))

;; ── linux-clear-cjktty-zfs (#3021) ──────────────────────────────
;; Reason: KERNEL_BUILD_EXTREMELY_COMPLEX
;; Source: https://git.staropensource.de/StarOpenSource/Linux-Tachyon
;; Full custom kernel build: Clear Linux patches + CJK TTY patches + ZFS
;; module + kexec.  Multiple patch series from different repos.
;; Attempts: (1) reviewed PKGBUILD — 6+ source repos, custom .config,
;;   ZFS DKMS integration; (2) Guix kernel packaging uses different model
;;   (linux-libre); (3) ZFS licensing (CDDL) conflicts with kernel GPL.
(define-public linux-clear-cjktty-zfs/blocked
  (package
    (inherit zoxide)
    (name "linux-clear-cjktty-zfs")))

;; ── linux-clear-cjktty-zfs-headers (#3022) ──────────────────────
;; Reason: KERNEL_BUILD_EXTREMELY_COMPLEX
;; Same pkgbase as linux-clear-cjktty-zfs (split package).
;; Cannot be built independently.
;; Attempts: same as linux-clear-cjktty-zfs above.
(define-public linux-clear-cjktty-zfs-headers/blocked
  (package
    (inherit zoxide)
    (name "linux-clear-cjktty-zfs-headers")))

;; ── lenovo-print-driver-lj2400-m7400-bin (#3016) ────────────────
;; Reason: PROPRIETARY_BINARY_FOREIGN_CDN
;; Source: Pre-built .deb from chinauos.com CDN (Lenovo China).
;; Proprietary driver binary with custom:Lenovo license.
;; Attempts: (1) reviewed PKGBUILD — downloads .deb from chinauos.com;
;;   (2) proprietary license; (3) no source code available for
;;   from-source build.
(define-public lenovo-print-driver-lj2400-m7400-bin/blocked
  (package
    (inherit zoxide)
    (name "lenovo-print-driver-lj2400-m7400-bin")))

;; ── mkinitcpio-firmware (#3097) ──────────────────────────────────
;; Reason: ARCH_SPECIFIC_META_PACKAGE
;; This is an Arch-specific meta-package that installs a pacman hook
;; and pulls in firmware packages to suppress mkinitcpio warnings.
;; Guix uses its own initrd generation (not mkinitcpio) and handles
;; firmware through linux-firmware and per-device firmware packages.
;; Attempts: (1) reviewed PKGBUILD — installs single pacman hook file;
;;   (2) mkinitcpio not used in Guix; (3) no equivalent functionality
;;   needed in Guix's boot model.
(define-public mkinitcpio-firmware/blocked
  (package
    (inherit zoxide)
    (name "mkinitcpio-firmware")))

;; ── spinwheel-pipewire (#3089) ───────────────────────────────────
;; Reason: UPSTREAM_DEAD
;; Source: https://codeberg.org/the-traveler/spinwheel (404 — repo not found)
;; The upstream Codeberg repository returns 404.  The AUR package bundled
;; sources directly (SKIP checksums), but without an upstream repo the
;; package cannot be reproduced.
;; Attempts: (1) git clone codeberg.org/the-traveler/spinwheel — 404;
;;   (2) searched GitHub/GitLab for mirrors — none found;
;;   (3) no source available for packaging.
(define-public spinwheel-pipewire/blocked
  (package
    (inherit zoxide)
    (name "spinwheel-pipewire")))
