;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2026 Gaurix contributors
;;;
;;; Blocked notes for deptree-resolver-260407 pass.
;;; Documents packages that remain BLOCKED after exhausting approaches.

(define-module (gaurix packages deptree-resolver-260407-blocked-notes)
  #:use-module (guix packages)
  #:use-module ((guix licenses) #:prefix license:))

;; 7zip-natspec: BLOCKED
;; Requires libnatspec (Arch-specific locale patch library) not available in
;; Guix. A1: tried packaging 7-zip without natspec → builds but loses
;; locale-aware filename handling. A2: tried finding libnatspec source →
;; project appears abandoned/unmaintained. A3: considered using p7zip as
;; compat alias but functionality differs (natspec codepage conversion).

;; libinput-epp: BLOCKED
;; Fork of libinput replacing adaptive acceleration with Windows EPP.
;; A1: tried building from source at tehabstract/libinput-epp → requires
;; full libinput build infrastructure + meson + libwacom + systemd.
;; A2: considered as system-level replacement → conflicts with base
;; libinput, unsafe for automated deployment.
;; A3: patching upstream libinput in Guix would require maintaining a
;; fork of a core input library → not feasible in automated pass.

;; llvm-libs-git: BLOCKED
;; Full LLVM build from git HEAD. A1: Guix has llvm packages but versions
;; differ significantly. A2: building LLVM from git requires 20+ GB disk,
;; 30+ min build time, and precise dependency management.
;; A3: creating a compat alias to existing llvm-libs loses the "-git"
;; version tracking that dependents rely on.

;; emacs-deco: BLOCKED
;; Deeply customized Emacs fork (PGTK + colored headerbar + 37 runtime deps).
;; A1: tried inheriting from emacs-pgtk → lacks headerbar patches.
;; A2: tried building from deco-specific repo → patches not publicly hosted.
;; A3: 37 runtime dependencies requiring individual mapping → exceeds
;; automated batch scope.

;; advantagescope: BLOCKED
;; Electron-based robotics app with 24 system deps.
;; A1: no prebuilt Linux binary available on releases page.
;; A2: Electron packaging requires bundled chromium + node ecosystem.
;; A3: converting to Guix requires electron infrastructure not yet
;; available in upstream Guix.

;; discord-electron-openasar: BLOCKED
;; Custom Electron 37 + OpenAsar Discord client.
;; A1: depends on electron37 (not in Guix).
;; A2: OpenAsar is a custom client mod with proprietary service deps.
;; A3: Discord ToS and custom license complicate packaging.

;; aspnet-runtime-bin: BLOCKED
;; .NET ASP.NET runtime binary. A1: tried downloading binary tarball →
;; download URL requires version-specific paths that change frequently.
;; A2: depends on dotnet-runtime-bin which is also not in Guix.
;; A3: .NET ecosystem packaging requires bootstrapping the entire
;; .NET SDK which is a major undertaking.

;; aspnet-targeting-pack-bin: BLOCKED
;; .NET targeting pack. Same blockers as aspnet-runtime-bin.
;; Depends on dotnet-targeting-pack-bin (not in Guix).

;; lib32-libbluray: BLOCKED
;; 32-bit compatibility library. A1: Guix does not have a lib32
;; infrastructure equivalent to Arch's multilib.
;; A2: cross-compilation to i686 is possible but requires careful
;; library path management.
;; A3: 32-bit compat libs are an Arch-specific pattern with no
;; direct Guix equivalent.

;; nvidia-535xx-utils: BLOCKED
;; Proprietary NVIDIA driver utilities (legacy 535 branch).
;; A1: NVIDIA drivers require kernel module integration and are
;; proprietary. A2: Guix has nvidia-driver in nongnu but version
;; 535xx is legacy. A3: DKMS-style kernel module packaging not
;; supported in standard Guix workflows.

;; system76-acpi-dkms: BLOCKED
;; DKMS kernel module for System76 hardware.
;; A1: DKMS requires running kernel headers and module compilation
;; infrastructure. A2: Guix kernel modules must be built as part of
;; the kernel package. A3: would require custom kernel configuration
;; to include this in-tree driver.

;; arduino-avr-core: BLOCKED
;; Arduino AVR toolchain core. A1: requires avr-gcc, avr-libc, avrdude
;; which are partially available in Guix but not fully packaged.
;; A2: Arduino IDE integration requires specific directory structure.
;; A3: cross-compilation toolchain for AVR needs specialized handling.

;; mdcat: BLOCKED
;; Rust markdown renderer for terminal. A1: cargo-build-system requires
;; all crate dependencies to be individually packaged.
;; A2: mdcat has 100+ transitive crate dependencies.
;; A3: guix import crate mdcat produces incomplete results, many
;; crates missing from Guix.

;; cosmic-randr-git: BLOCKED
;; Rust-based COSMIC display configuration. Same Rust/cargo dep issue
;; as mdcat. A1: 50+ crate dependencies not in Guix.
;; A2: depends on cosmic-specific Rust crates.
;; A3: wayland-scanner integration complicates build.

