;;; Blocked notes for round-22 worker-03 NRD pass 5.
;;; 17 packages re-blocked with concrete reasons after investigation.
(define-module (gaurix packages cron-c79f127f-r22-w03-nrd5-blocked-notes))

;;; ── Re-blocked packages ──────────────────────────────────────────

;; #3020 webtorrent-bittorrent-tracker
;; BLOCKED: NODE_DEPS_NOT_AVAILABLE — Node.js package (bittorrent-tracker v11.2.2,
;; MIT); npm dependency tree has 100+ transitive packages not available in Guix.
;; A1: checked npm registry — 100+ deps; A2: no binary release; A3: no reduced-dep fork.

;; #3021 linux-clear-cjktty-zfs
;; BLOCKED: CUSTOM_KERNEL_NOT_FEASIBLE — custom Linux kernel combining Clear Linux
;; patches + CJKTTY CJK console font patches + ZFS DKMS module.  Requires custom
;; kernel config, out-of-tree ZFS module build, and Clear Linux patchset tracking.
;; A1: examined AUR PKGBUILD — 3 disparate patchsets on moving kernel target;
;; A2: ZFS DKMS requires kernel-specific build not supported in Guix;
;; A3: no upstream binary/prebuilt kernel available.

;; #3022 linux-clear-cjktty-zfs-headers
;; BLOCKED: CUSTOM_KERNEL_NOT_FEASIBLE — headers companion to linux-clear-cjktty-zfs;
;; same blockers apply.

;; #3031 fw-fanctrl-rs-git
;; BLOCKED: CARGO_DEPS_NOT_AVAILABLE — Rust source (fw-ec-utils repo), no binary
;; release; cargo dep tree includes embedded-hal, i2cdev, serde not in Guix.
;; A1: no GitHub binary releases; A2: cargo deps 30+ crates not in Guix;
;; A3: no reduced-dependency fork.

;; #3034 bapctools-git
;; BLOCKED: COMPLEX_PYTHON_DEPS — Python project (BAPCtools) requires latex,
;; checktestdata (custom C++ tool), and complex Python packaging with platypus,
;; colorama, ruamel.yaml.  checktestdata itself needs packaging first.
;; A1: no binary release; A2: checktestdata dep not in Guix;
;; A3: too many layered deps for single pass.

;; #3035 nodejs-knit
;; BLOCKED: NODE_DEPS_NOT_AVAILABLE — Node.js package (knit v0.1.2);
;; npm dep tree not packaged in Guix.
;; A1: checked GitHub — small tool but npm deps; A2: no binary; A3: no standalone version.

;; #3039 synergy3-bin
;; BLOCKED: PROPRIETARY_NO_PUBLIC_BINARY — Synergy 3 is proprietary (Symless);
;; binary download requires paid account/authentication.  No public download URL.
;; A1: checked symless.com — requires login; A2: no GitHub releases;
;; A3: Guix has synergy 1.x already, v3 is commercial-only.

;; #3042 swhook
;; BLOCKED: CARGO_DEPS_NOT_AVAILABLE — Rust source (v0.0.3, GPL-3.0);
;; cargo deps include actix-web, serde, tokio — ~100 crates not in Guix.
;; A1: no binary release; A2: actix-web dep chain massive; A3: no reduced fork.

;; #3047 op-cache-git
;; BLOCKED: CARGO_DEPS_NOT_AVAILABLE — Rust source (op-cache); cargo deps
;; include tokio, serde, clap not fully available in Guix.
;; A1: no binary release; A2: Rust/cargo deps not in Guix; A3: no Go/simple alt.

;; #3049 szsol-rs
;; BLOCKED: CARGO_DEPS_NOT_AVAILABLE — Rust source (v1.0.1); cargo deps include
;; crossterm, rand, clap — ~40 crates not in Guix.
;; A1: no binary release; A2: cargo dep tree not in Guix; A3: no pre-built binary.

;; #3050 aerothemeplasma-desktop-x11-git
;; BLOCKED: KDE_PLASMA6_BUILD_CHAIN — AeroThemePlasma X11 session file requires
;; KDE Plasma 6 desktop components and AeroShell patch family, which are not
;; available in Guix.
;; A1: needs libplasma, kwin, plasma-desktop (KDE6); A2: Guix has KDE5 only;
;; A3: no standalone installable without full KDE6.

;; #3051 aeroshell-workspace-git
;; BLOCKED: KDE_PLASMA6_BUILD_CHAIN — AeroShell workspace components require
;; KDE Plasma 6 full build chain not available in Guix.
;; A1: cmake build needs KDE6 frameworks; A2: Guix packages KDE5 only;
;; A3: no standalone extraction possible.

;; #3053 aeroshell-libplasma-git
;; BLOCKED: KDE_PLASMA6_BUILD_CHAIN — Patched libplasma fork requires full
;; KDE Plasma 6 build chain (KDE Frameworks 6, Qt6, etc.) not in Guix.
;; A1: massive C++ cmake build with KDE6 deps; A2: Guix has KDE5;
;; A3: cannot build without full KDE6 stack.

;; #3054 aeroshell-kwin-components-git
;; BLOCKED: KDE_PLASMA6_BUILD_CHAIN — KWin effects/scripts for AeroShell require
;; KDE Plasma 6 kwin headers/libraries not available in Guix.
;; A1: cmake build needs kwin6 dev headers; A2: Guix has KDE5 only;
;; A3: no standalone extraction possible.

;; #3078 uac-polkit-agent-git
;; BLOCKED: KDE_PLASMA6_BUILD_CHAIN — UAC-style Polkit agent depends on
;; AeroShell components and KDE Plasma 6 not available in Guix.
;; A1: cmake+KDE6 build; A2: depends on aeroshell-libplasma (also blocked);
;; A3: no standalone build without KDE6 stack.

;; #3073 baremetal-compiler-rt
;; BLOCKED: CROSS_COMPILE_NOT_SUPPORTED — compiler-rt builtins for bare-metal
;; ARM Cortex-M targets requires LLVM cross-compilation infrastructure
;; (arm-none-eabi target) which is not set up in Guix's LLVM packaging.
;; A1: cmake cross-compile for arm-none-eabi; A2: Guix LLVM doesn't support
;; bare-metal ARM targets; A3: no prebuilt archive available.

;; #3097 mkinitcpio-firmware
;; BLOCKED: ARCH_SPECIFIC — mkinitcpio is Arch Linux's initramfs generator;
;; this package collects firmware blobs for mkinitcpio hooks.  Not applicable
;; to Guix which uses its own initrd generation.
;; A1: Arch-specific initramfs tool; A2: Guix uses different initrd system;
;; A3: firmware blobs available separately via linux-firmware in Guix.
