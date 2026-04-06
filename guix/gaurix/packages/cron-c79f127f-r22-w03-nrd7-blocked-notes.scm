;;; Blocked notes for round-22 worker-03 NRD pass 7.
;;; 30 packages re-blocked with concrete reasons after investigation.
;;; 6 newly investigated + 21 confirmed from prior passes + 3 FAILED entries.
(define-module (gaurix packages cron-c79f127f-r22-w03-nrd7-blocked-notes))

;;; ── Newly investigated packages ─────────────────────────────────────

;; #3016 lenovo-print-driver-lj2400-m7400-bin
;; BLOCKED: NONFREE_BINARY — proprietary Lenovo printer driver distributed as
;; a precompiled .deb from chinauos.com.  No source code available.  Binary-only
;; x86_64 CUPS driver for Lenovo LJ2400/M7400 series printers.
;; A1: checked upstream — proprietary binary only, no source;
;; A2: no alternative FOSS driver exists for this hardware;
;; A3: cannot redistribute due to proprietary license.

;; #3052 arch-remaster
;; BLOCKED: ARCH_SPECIFIC — Arch Linux live ISO remastering tool.  Upstream repo
;; (github.com/AdrianTM/arch-remaster) contains only a LICENSE file; actual
;; scripts are Arch-specific (pacman, mkinitcpio, GRUB on USB).  Has zero
;; utility outside Arch Linux.
;; A1: checked GitHub — repo essentially empty (LICENSE only);
;; A2: scripts use pacman/mkinitcpio (Arch-only tools);
;; A3: Guix has its own system image/installation tooling.

;; #3056 hurrycurry-server
;; BLOCKED: COMPLEX_BUILD_DEPS — cooperative cooking game server (Codeberg).
;; Requires Godot 4.5+ (not in Guix), Deno (not in Guix), esbuild, plus
;; Rust/Cargo for the server component.  Multi-component monorepo build.
;; A1: checked Codeberg — Rust+Godot+Deno+esbuild build;
;; A2: Godot 4.5+ and Deno not available in Guix;
;; A3: server component cannot build independently from monorepo.

;; #3057 jellything-git
;; BLOCKED: COMPLEX_BUILD_DEPS — media streaming server (Codeberg, AGPL-3.0).
;; Hybrid Rust+TypeScript build requiring esbuild (not in Guix) for frontend
;; bundling.  Also needs dav1d, libavif, zstd native deps via meson/cmake.
;; A1: checked Codeberg — multi-toolchain (Rust+TS+meson) build;
;; A2: esbuild not available in Guix;
;; A3: no binary release or simpler build path available.

;; #3058 keks-meet-server
;; BLOCKED: COMPLEX_BUILD_DEPS — secure video conferencing server (Codeberg,
;; AGPL-3.0).  Hybrid Rust+TypeScript requiring esbuild for JS client
;; bundling.  Server binary needs bundled JS assets to function.
;; A1: checked Codeberg — Rust+esbuild build;
;; A2: esbuild not available in Guix;
;; A3: no standalone server binary without JS frontend.

;; #3085 we-layerd-git
;; BLOCKED: NO_LICENSE — Wayland Wallpaper Engine daemon (Rust workspace).
;; No LICENSE file in repository, no license field in Cargo.toml.  Cannot
;; distribute without a clear FOSS license.  Also depends on Wine and
;; proprietary Wallpaper Engine software at runtime.
;; A1: checked GitHub — no license file or Cargo.toml license field;
;; A2: runtime depends on proprietary Wallpaper Engine;
;; A3: no standalone functionality without proprietary software.

;;; ── Confirmed from prior passes ─────────────────────────────────────

;; #3020 webtorrent-bittorrent-tracker
;; CONFIRMED: NODE_DEPS_NOT_AVAILABLE — (nrd5, r26-nrd) npm dep tree 100+
;; packages not in Guix.

;; #3021 linux-clear-cjktty-zfs
;; CONFIRMED: CUSTOM_KERNEL_NOT_FEASIBLE — (nrd5) 3 patchsets on moving kernel
;; target + ZFS DKMS.

;; #3022 linux-clear-cjktty-zfs-headers
;; CONFIRMED: CUSTOM_KERNEL_NOT_FEASIBLE — (nrd5) headers companion; same blockers.

;; #3031 fw-fanctrl-rs-git
;; CONFIRMED: CARGO_DEPS_NOT_AVAILABLE — (nrd5) requires nightly Rust + 30+
;; embedded crates not in Guix.

;; #3034 bapctools-git
;; CONFIRMED: COMPLEX_PYTHON_DEPS — (nrd5) needs checktestdata (custom C++),
;; latex, platypus.

;; #3035 nodejs-knit
;; CONFIRMED: NODE_DEPS_NOT_AVAILABLE — (nrd5) npm dep tree not in Guix.

;; #3039 synergy3-bin
;; CONFIRMED: PROPRIETARY_NO_PUBLIC_BINARY — (nrd5) requires paid account.

;; #3042 swhook
;; CONFIRMED: CARGO_DEPS_NOT_AVAILABLE — (nrd5, r26-nrd) actix-web dep chain
;; ~100 crates.

;; #3047 op-cache-git
;; CONFIRMED: CARGO_DEPS_NOT_AVAILABLE — (nrd5) tokio/serde/clap deps.

;; #3049 szsol-rs
;; CONFIRMED: CARGO_DEPS_NOT_AVAILABLE — (nrd5) crossterm/rand/clap ~40 crates.

;; #3050 aerothemeplasma-desktop-x11-git
;; CONFIRMED: KDE_PLASMA6_BUILD_CHAIN — (nrd5) requires full KDE6 + AeroShell.

;; #3051 aeroshell-workspace-git
;; CONFIRMED: KDE_PLASMA6_BUILD_CHAIN — (nrd5) cmake needs KDE6 frameworks.

;; #3053 aeroshell-libplasma-git
;; CONFIRMED: KDE_PLASMA6_BUILD_CHAIN — (nrd5) patched libplasma fork.

;; #3054 aeroshell-kwin-components-git
;; CONFIRMED: KDE_PLASMA6_BUILD_CHAIN — (nrd5) kwin6 dev headers.

;; #3060 udiskr
;; CONFIRMED: NEEDS_NIGHTLY_RUST — (nrd3) Rust edition 2024 + nightly features.

;; #3066 docx-you-want
;; CONFIRMED: CARGO_DEPS_NOT_AVAILABLE — (r26-nrd) PDF/DOCX crates.

;; #3073 baremetal-compiler-rt
;; CONFIRMED: CROSS_COMPILE_NOT_SUPPORTED — (nrd5) arm-none-eabi LLVM target.

;; #3078 uac-polkit-agent-git
;; CONFIRMED: KDE_PLASMA6_BUILD_CHAIN — (nrd5) AeroShell + KDE6 deps.

;; #3089 spinwheel-pipewire
;; CONFIRMED: SOURCE_UNAVAILABLE — (nrd3) Codeberg repo 404.

;; #3095 boomer-git
;; CONFIRMED: NEEDS_NIM_COMPILER — (nrd3) Nim not in Guix.

;; #3097 mkinitcpio-firmware
;; CONFIRMED: ARCH_SPECIFIC — (nrd5) Arch initramfs firmware meta-package.

;;; ── FAILED entries re-blocked ───────────────────────────────────────

;; #1830 lib32-opencl-nvidia-580xx
;; BLOCKED: NONFREE_PROPRIETARY — proprietary NVIDIA 32-bit OpenCL driver
;; (580xx series).  Binary blob from nvidia.com, no source code.  Guix
;; free software policy forbids distribution.  Also requires 32-bit
;; multilib support not available in Guix.
;; A1: proprietary binary; A2: no FOSS alternative; A3: 32-bit multilib missing.

;; #1831 lib32-nvidia-580xx-utils
;; BLOCKED: NONFREE_PROPRIETARY — proprietary NVIDIA 32-bit driver utilities.
;; Same binary blob source and blockers as lib32-opencl-nvidia-580xx.
;; A1: proprietary binary; A2: no FOSS alternative; A3: 32-bit multilib missing.

;; #1833 vmware-workstation
;; BLOCKED: NONFREE_PROPRIETARY — proprietary VMware Workstation hypervisor.
;; Binary-only distribution from vmware.com/Broadcom.  No source code.
;; Binary redistribution likely violates VMware EULA.
;; A1: proprietary commercial software; A2: QEMU/KVM available as FOSS
;; alternative; A3: EULA forbids redistribution.
