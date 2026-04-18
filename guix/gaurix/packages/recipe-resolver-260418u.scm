;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260418u
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages.
;;;
;;; New recipes (3):
;;;     1.  pycdc (cmake-build-system, v0.0.0-git, gpl3)
;;;     2.  wayneko (gnu-build-system, v0.0.0-git, gpl3)
;;;     3.  sfwbar (meson-build-system, v1.0_beta17, gpl3)
;;;
;;; BLOCKED EXHAUSTED (27):
;;;     4.  sway-desktop-env-hook -> NEEDS_RECIPE_DESIGN_EXHAUSTED: ARCH_SPECIFIC_HOOK:
;;;         pacman install hook for sway-desktop; Arch-specific;
;;;         A1: no equivalent concept in Guix (uses Shepherd services);
;;;         A2: hook logic is inline in PKGBUILD, no standalone source;
;;;         A3: functionality handled by Guix system configuration
;;;     5.  sway-desktop-unsupportedgpu-hook -> NEEDS_RECIPE_DESIGN_EXHAUSTED: ARCH_SPECIFIC_HOOK:
;;;         pacman hook for GPU detection in sway; Arch-specific;
;;;         A1: no Guix hook equivalent; A2: no standalone source;
;;;         A3: GPU detection handled by mesa/drm at OS level in Guix
;;;     6.  vesktop-spoof-pacman-hook -> NEEDS_RECIPE_DESIGN_EXHAUSTED: ARCH_SPECIFIC_HOOK:
;;;         pacman hook for Vesktop; Arch-specific;
;;;         A1: no Guix hook equivalent; A2: inline PKGBUILD only;
;;;         A3: Vesktop itself packaged separately without needing hooks
;;;     7.  lib32-vulkan-icd-loader-git -> NEEDS_RECIPE_DESIGN_EXHAUSTED: MULTILIB_UNSUPPORTED:
;;;         32-bit Vulkan ICD loader; Guix does not support multilib;
;;;         A1: cross-compilation infra needed; A2: no multilib model in Guix;
;;;         A3: use native-arch Vulkan package instead
;;;     8.  looking-glass-module-dkms-git -> NEEDS_RECIPE_DESIGN_EXHAUSTED: DKMS_UNSUPPORTED:
;;;         KVMFR kernel module for Looking Glass KVM framebuffer;
;;;         A1: DKMS not supported in Guix; A2: requires kernel-loadable-modules
;;;         in operating-system config; A3: package client separately (already in Guix)
;;;     9.  lib32-glibc-git -> NEEDS_RECIPE_DESIGN_EXHAUSTED: MULTILIB_UNSUPPORTED:
;;;         32-bit glibc; fundamental architecture mismatch;
;;;         A1: Guix does not support multilib; A2: would require parallel glibc;
;;;         A3: use containerized 32-bit environment instead
;;;    10.  ddcci-driver-linux-dkms-git -> NEEDS_RECIPE_DESIGN_EXHAUSTED: DKMS_UNSUPPORTED:
;;;         DDC/CI monitor control kernel module;
;;;         A1: DKMS not supported in Guix; A2: requires kernel build infra;
;;;         A3: upstream may be merged into mainline kernel
;;;    11.  com.qq.weixin.work.deepin -> NEEDS_RECIPE_DESIGN_EXHAUSTED: PROPRIETARY_ECOSYSTEM:
;;;         WeChat Work via Deepin Wine; proprietary binary + Wine wrapper;
;;;         A1: Deepin Wine not in Guix; A2: proprietary WeChat binary;
;;;         A3: license prohibits redistribution
;;;    12.  homeassistant-supervised -> NEEDS_RECIPE_DESIGN_EXHAUSTED: INCOMPATIBLE_INIT:
;;;         Home Assistant Supervised requires systemd + Docker;
;;;         A1: Guix uses Shepherd not systemd; A2: Docker integration complex;
;;;         A3: use Home Assistant Core via Python packages instead
;;;    13.  linux-zencjk -> NEEDS_RECIPE_DESIGN_EXHAUSTED: CUSTOM_KERNEL_INFEASIBLE:
;;;         custom Linux kernel with CJK patches;
;;;         A1: requires make-linux-libre infrastructure; A2: interactive config;
;;;         A3: 30+ min build, 10GB+ disk; batch packaging infeasible
;;;    14.  linux-zencjk-headers -> NEEDS_RECIPE_DESIGN_EXHAUSTED: DEP_BLOCKED:
;;;         kernel headers for linux-zencjk;
;;;         A1: depends on linux-zencjk which cannot be packaged;
;;;         A2: headers coupled to kernel build; A3: no independent packaging path
;;;    15.  corefreq-dkms -> NEEDS_RECIPE_DESIGN_EXHAUSTED: DKMS_UNSUPPORTED:
;;;         CPU monitoring kernel module;
;;;         A1: DKMS not supported in Guix; A2: requires kernel headers;
;;;         A3: use kernel-loadable-modules in OS config instead
;;;    16.  gpd-fan-driver-dkms-git -> NEEDS_RECIPE_DESIGN_EXHAUSTED: DKMS_UNSUPPORTED:
;;;         GPD device fan control kernel module;
;;;         A1: DKMS not supported; A2: out-of-tree module;
;;;         A3: niche hardware, submit upstream to kernel.org instead
;;;    17.  hid-asus-mouse-dkms-git -> NEEDS_RECIPE_DESIGN_EXHAUSTED: DKMS_UNSUPPORTED:
;;;         ASUS mouse HID kernel module;
;;;         A1: DKMS not supported; A2: requires kernel build infra;
;;;         A3: submit patch upstream to linux-input subsystem
;;;    18.  lib32-wayland-git -> NEEDS_RECIPE_DESIGN_EXHAUSTED: MULTILIB_UNSUPPORTED:
;;;         32-bit Wayland library; Guix does not support multilib;
;;;         A1: no multilib model; A2: cross-compilation infra needed;
;;;         A3: use native architecture Wayland package
;;;    19.  gentoo-sources -> NEEDS_RECIPE_DESIGN_EXHAUSTED: DISTRO_SPECIFIC:
;;;         Gentoo kernel sources packaging; distribution-specific concept;
;;;         A1: Guix has its own kernel packaging (linux-libre);
;;;         A2: Gentoo USE flags not applicable; A3: no cross-distro value
;;;    20.  snd-pcsp-dkms -> NEEDS_RECIPE_DESIGN_EXHAUSTED: DKMS_UNSUPPORTED:
;;;         PC speaker sound kernel module;
;;;         A1: DKMS not supported; A2: snd-pcsp already in mainline kernel;
;;;         A3: enable via kernel config, not external module
;;;    21.  python-google-cloud-texttospeech -> NEEDS_RECIPE_DESIGN_EXHAUSTED: DEEP_DEPENDENCY_TREE:
;;;         Google Cloud TTS Python client; 20+ transitive Google deps;
;;;         A1: massive googleapis/grpc dependency chain not in Guix;
;;;         A2: proto-plus, google-auth, grpc all need packaging;
;;;         A3: use REST API directly instead of SDK
;;;    22.  php-phalcon -> NEEDS_RECIPE_DESIGN_EXHAUSTED: MISSING_ECOSYSTEM:
;;;         PHP C-extension web framework; requires PHP + Zephir compiler;
;;;         A1: PHP not well-supported in Guix; A2: Zephir bootstrap circular dep;
;;;         A3: entire PHP ecosystem would need building first
;;;    23.  linux-bcachefs-git -> NEEDS_RECIPE_DESIGN_EXHAUSTED: OBSOLETE_UPSTREAM:
;;;         Linux kernel with bcachefs patches; bcachefs merged mainline in 6.7;
;;;         A1: custom kernel infeasible in batch; A2: bcachefs now in mainline;
;;;         A3: use standard linux-libre >= 6.7 with bcachefs enabled
;;;    24.  linux-bcachefs-git-headers -> NEEDS_RECIPE_DESIGN_EXHAUSTED: DEP_BLOCKED:
;;;         headers for linux-bcachefs-git;
;;;         A1: parent kernel package not packageable;
;;;         A2: bcachefs in mainline, custom kernel unnecessary;
;;;         A3: use standard kernel headers
;;;    25.  lib32-libxpm -> NEEDS_RECIPE_DESIGN_EXHAUSTED: MULTILIB_UNSUPPORTED:
;;;         32-bit libXpm; Guix does not support multilib;
;;;         A1: no multilib model; A2: cross-compilation needed;
;;;         A3: use native-arch libxpm
;;;    26.  xtables-addons-dkms -> NEEDS_RECIPE_DESIGN_EXHAUSTED: DKMS_UNSUPPORTED:
;;;         netfilter extension kernel modules;
;;;         A1: DKMS not supported; A2: requires kernel build infra;
;;;         A3: some addons merged upstream; use kernel config
;;;    27.  linux-xanmod-bore -> NEEDS_RECIPE_DESIGN_EXHAUSTED: CUSTOM_KERNEL_INFEASIBLE:
;;;         XanMod kernel with BORE scheduler;
;;;         A1: requires make-linux-libre infra; A2: interactive config;
;;;         A3: 30+ min build; define as Guix kernel variant if needed
;;;    28.  linux-xanmod-bore-headers -> NEEDS_RECIPE_DESIGN_EXHAUSTED: DEP_BLOCKED:
;;;         headers for linux-xanmod-bore;
;;;         A1: parent kernel not packageable in batch;
;;;         A2: coupled to kernel build; A3: no independent path
;;;    29.  ubuntu-mate-icon-themes -> NEEDS_RECIPE_DESIGN_EXHAUSTED: COMPLEX_DEPS:
;;;         Ubuntu MATE icon themes; requires yaru-theme-icon not in Guix;
;;;         A1: Debian packaging only, no Makefile/Meson;
;;;         A2: depends on yaru ecosystem not in Guix;
;;;         A3: use hicolor-icon-theme or papirus as alternative
;;;    30.  corefreq-client -> NEEDS_RECIPE_DESIGN_EXHAUSTED: RUNTIME_DEP_BLOCKED:
;;;         CoreFreq userspace client; requires corefreq kernel module;
;;;         A1: kernel module (DKMS) cannot be packaged in Guix;
;;;         A2: client useless without kernel module loaded;
;;;         A3: entire corefreq stack needs kernel-loadable-modules OS config
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Use `guix download` to obtain real hashes.

(define-module (gaurix packages recipe-resolver-260418u)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system meson)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages cmake)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages web)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages wm)
  #:use-module (gnu packages xdisorg)
  #:export (pycdc
            wayneko
            sfwbar))

;;; -------------------------------------------------------------------
;;; 1. pycdc --- C++ Python bytecode disassembler and decompiler
;;; From https://github.com/zrax/pycdc; cmake-build-system.
;;; -------------------------------------------------------------------
(define-public pycdc
  (let ((commit "d7dec528ab51090a2e60dd8f3ddb351ed7b3847f")
        (revision "0"))
    (package
      (name "pycdc")
      (version (git-version "0.0.0" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/zrax/pycdc")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "0000000000000000000000000000000000000000000000000000"))))
      (build-system cmake-build-system)
      (arguments
       (list #:tests? #f))  ; no test suite
      (home-page "https://github.com/zrax/pycdc")
      (synopsis "Decompile and disassemble Python bytecode")
      (description
       "Pycdc (Decompyle++) is a C++ tool that decompiles compiled Python
bytecode (.pyc files) back into readable Python source code.  It also
includes pycdas, a bytecode disassembler.  Supports Python versions from
1.0 through 3.12.")
      (license license:gpl3))))

;;; -------------------------------------------------------------------
;;; 2. wayneko --- animated neko cat for Wayland
;;; From https://codeberg.org/look/wayneko; gnu-build-system (Makefile).
;;; -------------------------------------------------------------------
(define-public wayneko
  (let ((commit "cb3668e5add76ede2e3e02c69a9e2bd71c2e8e1a")
        (revision "0"))
    (package
      (name "wayneko")
      (version (git-version "0.0.0" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://codeberg.org/look/wayneko")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "0000000000000000000000000000000000000000000000000000"))))
      (build-system gnu-build-system)
      (arguments
       (list #:tests? #f
             #:make-flags
             #~(list (string-append "PREFIX=" #$output)
                     (string-append "CC=" #$(cc-for-target)))
             #:phases
             #~(modify-phases %standard-phases
                 (delete 'configure))))  ; no configure script
      (native-inputs (list pkg-config wayland-protocols))
      (inputs (list wayland))
      (home-page "https://codeberg.org/look/wayneko")
      (synopsis "Animated neko cat on a Wayland output")
      (description
       "Wayneko displays an animated neko cat on the bottom of a Wayland
output.  The cat chases the mouse pointer using the
@code{zwlr-layer-shell-unstable-v1} Wayland protocol.  It is a Wayland
port of the classic xneko/oneko desktop toy.")
      (license license:gpl3))))

;;; -------------------------------------------------------------------
;;; 3. sfwbar --- S*Floating Window taskBar for Wayland
;;; From https://github.com/LBCrion/sfwbar; meson-build-system.
;;; -------------------------------------------------------------------
(define-public sfwbar
  (package
    (name "sfwbar")
    (version "1.0_beta17")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/LBCrion/sfwbar")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))  ; no test suite
    (native-inputs (list pkg-config wayland-protocols))
    (inputs (list gtk+
                  gtk-layer-shell
                  json-c
                  wayland
                  python))
    (home-page "https://github.com/LBCrion/sfwbar")
    (synopsis "Flexible taskbar for Wayland compositors")
    (description
     "SFWBar (S* Floating Window Bar) is a flexible taskbar for Wayland
compositors.  It provides a taskbar, window switcher, pager, system tray
and window placement functionality.  SFWBar is designed to work with
Sway and other wlroots-based Wayland compositors.  Configuration is done
via a simple CSS-like layout language.")
    (license license:gpl3)))
