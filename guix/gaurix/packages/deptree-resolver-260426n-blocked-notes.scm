;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Blocked notes for deptree-resolver-260426n
;;; 100 BLOCKED packages evaluated, 18 recipes written, 82 remain BLOCKED.
;;;
;;; DKMS / KERNEL_MODULE (11 packages — Guix manages kernels as complete
;;; packages, not via DKMS; out-of-tree modules require kernel config patches):
;;;   aquacomputer_d5next-hwmon-dkms, amneziawg-dkms-git, faustus-dkms-git,
;;;   ideapad-laptop-tb-dkms, ideapad-laptop-tb2024g6plus-dkms, nvidia-bl-dkms,
;;;   nvidia-open-tinygrad-dkms-git, pfring-dkms, r8126-dkms,
;;;   rtl88x2ce-dkms-git, amneziawg-linux (requires kernel module),
;;;   amneziawg-linux-hardened (requires kernel module),
;;;   libch343ser-git (USB serial kernel driver)
;;;
;;; MULTILIB_UNSUPPORTED (3 — Guix does not support lib32 multilib packages):
;;;   lib32-opencl-nvidia-390xx, lib32-libglade, lib32-libxpm
;;;
;;; MINGW_CROSS_COMPILATION (6 — MinGW cross-compilation toolchain not in Guix):
;;;   mingw-w64-cblas, mingw-w64-lapack, mingw-w64-soundtouch,
;;;   mingw-w64-boost, mingw-w64-cppwinrt, mingw-w64-pcre2,
;;;   mingw-w64-spirv-tools
;;;
;;; PROPRIETARY_BINARY (4 — non-redistributable proprietary software):
;;;   squareline-studio (SquareLine Studio LVGL GUI designer),
;;;   brother-mfc-l2400dw (Brother printer driver),
;;;   inkdrop (proprietary note-taking app),
;;;   libfprint-2-tod1-broadcom-cv3plus (proprietary fingerprint driver)
;;;
;;; PLATFORM_UNSUPPORTED (3 — Windows/Android/macOS only):
;;;   bakkesmod-steam (Windows-only Rocket League mod),
;;;   android-platform-19, android-platform-21
;;;
;;; NON_DISTRIBUTABLE (2 — license prohibits redistribution):
;;;   ttf-consolas-ligaturized (Microsoft Consolas font derivative),
;;;   factorio-space-age-experimental (proprietary game DLC)
;;;
;;; ABANDONED_UPSTREAM (2 — upstream project discontinued):
;;;   lightdm-webkit-theme-aether (last updated 2019),
;;;   clash-for-windows-chinese (upstream repo deleted/DMCA)
;;;
;;; DISTRO_SPECIFIC (5 — depends on Arch Linux specific tools):
;;;   asp (Arch Linux source package tool, needs devtools/pacman),
;;;   aurutils (AUR helper, depends on pacutils/pacman),
;;;   pamac-cli (Arch package manager GUI, depends on libalpm),
;;;   repacman (pacman wrapper),
;;;   findbrokenpkgs (depends on pacman for package database queries)
;;;
;;; ARCH_SPECIFIC (7 — depends on Arch-specific infrastructure):
;;;   archwiki-offline (depends on arch-wiki-docs package),
;;;   mkinitcpio-systemd-root-password (mkinitcpio hook),
;;;   sbctl-initcpio-post-hook (mkinitcpio post hook for UKI signing),
;;;   system-age (reads Arch pacman install timestamp),
;;;   linux-keep-modules (Arch-specific kernel module preservation),
;;;   pacpak-git (pacman wrapper for flatpak management),
;;;   chromium-extension-arch-search (browser extension for Arch wiki search)
;;;
;;; ZFS_KERNEL_HEADERS (3 — ZFS kernel headers require specific kernel builds):
;;;   zfs-linux-git-headers, zfs-linux-hardened-headers, zfs-linux-rt-headers
;;;
;;; SELINUX_DEPS (2 — requires SELinux userspace stack not in Guix):
;;;   sudo-selinux (needs pam-selinux, libselinux, libsemanage),
;;;   base-selinux (meta-package depending on coreutils-selinux, etc.)
;;;
;;; MONO_DOTNET (3 — requires Mono/.NET runtime not packaged in Guix):
;;;   rdt-client (needs dotnet-runtime-9.0 + aspnet-runtime-9.0),
;;;   gbm (Game Backup Monitor, requires mono-basic),
;;;   eddiscovery (Elite Dangerous tool, requires mono)
;;;
;;; WINE_REQUIRED (2 — requires Wine runtime):
;;;   futu-ftnn-wine (financial app running via Wine),
;;;   fileoptimizer-bin (Windows app running via Wine)
;;;
;;; PROPRIETARY_DEPS (2 — depends on proprietary libraries):
;;;   simplicity-commander (requires jlink-software-and-documentation),
;;;   soapysdrplay3-luarvique-git (requires proprietary libsdrplay)
;;;
;;; DEPRECATED_DEPS (3 — depends on deprecated libraries unavailable in Guix):
;;;   knossu (needs glew1.10 and libpng12 — obsolete),
;;;   phonon-qt4-vlc (Qt4 deprecated, removed from most distros),
;;;   texmacs-pure (depends on Pure language, unmaintained since 2018)
;;;
;;; MISSING_SOURCE (5 — not found in AUR metadata cache, no upstream info):
;;;   gradience, deadbeef-mpris2-plugin, linux6.18.22-1-lts-bin,
;;;   matlab-jre-bundled, sipgate-app-clinq
;;;
;;; MISSING_DEPENDENCY (3 — key dependency not available in Guix):
;;;   nfuspire-git (requires libnspire — TI calculator library not in Guix),
;;;   mailnaggertray-git (Rust app requiring mailnagger — not in Guix),
;;;   python-gradio-pdf (requires python-gradio — not in Guix)
;;;
;;; COMPLEX_BUILD (4 — extremely complex build systems/dependencies):
;;;   virtualbox-svn (50+ build deps, custom kernel module integration),
;;;   python-home-assistant-frontend (massive web build chain, 100+ npm deps),
;;;   dxvk-async-git (DXVK with async patches, needs Vulkan SDK + Wine),
;;;   glibc-eac (glibc variant with DT_HASH patch, conflicts with system glibc)
;;;
;;; CROSS_TOOLCHAIN (1 — requires ARM cross-compilation toolchain):
;;;   kamilsss655-uv-k5-firmware-custom-git (ARM firmware, needs
;;;   arm-none-eabi-gcc/binutils/newlib)
;;;
;;; COMMERCIAL_LICENSE (3 — commercial or unclear license):
;;;   luniistore (Lunii storyteller app, unknown license),
;;;   wyc (commercial tunneling service),
;;;   vscodium-marketplace (depends on vscodium + unclear license)
;;;
;;; PROPRIETARY_GAME_ASSETS (2 — game engine GPL but assets non-free):
;;;   ut2004-gog (UT2004 GOG edition, proprietary game),
;;;   unrealtournament4 (UT4 by Epic, custom non-free license)
;;;
;;; ARCH_SPECIFIC_TOOLS (2):
;;;   python-pypi2pkgbuild (converts PyPI to Arch PKGBUILD, needs namcap),
;;;   edgeimpulse-cli (reclassified — complex npm dep tree, kept as recipe)

(define-module (gaurix packages deptree-resolver-260426n-blocked-notes))
