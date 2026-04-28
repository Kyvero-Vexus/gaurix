;;; Blocked notes for deptree-resolver-260428f
;;; 100 BLOCKED packages evaluated, 0 new recipes,
;;; 1 ALREADY_RESOLVED, 5 newly categorized, 94 remain BLOCKED.
;;;
;;; Generated: 2026-04-28
;;;
;;; The BLOCKED queue is now 172 packages (down from 177 at deptree-resolver-260428e).
;;; All remaining packages are in permanently intractable categories.
;;; 5 packages removed: asp, aurutils, euroscope-bin, faustus-dkms-git,
;;; fileoptimizer-bin (resolved in prior passes 260428d/e).

;;; === ALREADY_RESOLVED (1 package) ===
;;; 1. auracle-git — recipe in deptree-resolver-260416a.scm

;;; === NEWLY CATEGORIZED (5 packages) ===
;;;
;;; borgwarehouse — COMPLEX_DEPS
;;;   Next.js web UI for BorgBackup, 500+ transitive npm deps via pnpm. NPM_ECOSYSTEM.
;;;   A1: node-build-system → requires each npm dep as separate Guix package.
;;;   A2: Standalone build with vendored deps → pnpm install needs network.
;;;   A3: Pre-built binary repack → no standalone release artifact exists.
;;;
;;; pikaur-static — DISTRO_SPECIFIC
;;;   AUR helper wrapping pacman; fundamentally Arch Linux only.
;;;   A1: Package as-is → requires pacman, not available on Guix.
;;;   A2: Strip pacman dep → tool is useless without pacman.
;;;   A3: Stub package → no value, entire purpose is AUR/pacman integration.
;;;
;;; pikaur-static-git — DISTRO_SPECIFIC
;;;   Git version of pikaur-static; same Arch-only issues.
;;;   A1: Same as pikaur-static.
;;;   A2: Same as pikaur-static.
;;;   A3: Same as pikaur-static.
;;;
;;; prey — NON_DISTRIBUTABLE
;;;   FPS based on id Tech 4; requires retail game files. Custom restrictive license. Also needs lib32 deps (MULTILIB_UNSUPPORTED).
;;;   A1: Package binary → requires retail files, can't distribute.
;;;   A2: Installer needing user-supplied files → still needs lib32 deps.
;;;   A3: 64-bit wrapper → game binary is 32-bit only, no 64-bit port.
;;;
;;; python-pylink-square — PROPRIETARY_DEPS
;;;   Python interface for SEGGER J-Link. Depends on jlink-software-and-documentation (proprietary SEGGER binary SDK).
;;;   A1: Package without J-Link → library is useless without proprietary SDK.
;;;   A2: Wrapper with user-provided J-Link → still can't redistribute SDK.
;;;   A3: Alternative open-source J-Link tools → no complete alternative exists.
;;;

;;; === BLOCKED — ABANDONED_UPSTREAM (6) ===
;;; deadbeef-mpris2-plugin, lightdm-webkit-theme-aether, phonon-qt4-vlc
;;; , texmacs-pure, clash-for-windows-chinese, beignet-git

;;; === BLOCKED — ARCH_SPECIFIC (5) ===
;;; mkinitcpio-systemd-root-password, linux-keep-modules, python-pypi2pkgbuild
;;; , glibc-eac, mkinitcpio-clevis-hook

;;; === BLOCKED — COMPLEX_DEPS (13 + 1 newly categorized) ===
;;; virtualbox-svn, python-home-assistant-frontend, quartz-utils-git
;;; , rdt-client, gbm, mailnaggertray-git, python-gradio-pdf
;;; , webcord-vencord-git, frame-eth, freetube-electron-git
;;; , madness-interactive-reloaded, mobirise
;;; , borgwarehouse (newly categorized), hnefatafl-copenhagen

;;; === BLOCKED — DISTRO_SPECIFIC (7 + 2 newly categorized) ===
;;; repacman, archwiki-offline, findbrokenpkgs, sbctl-initcpio-post-hook
;;; , pacpak-git, chromium-extension-arch-search, pamac-cli
;;; , pikaur-static (newly categorized), pikaur-static-git (newly categorized)

;;; === BLOCKED — DKMS_KERNEL_MODULE (12) ===
;;; aquacomputer_d5next-hwmon-dkms, amneziawg-dkms-git, amneziawg-linux
;;; , amneziawg-linux-hardened, ideapad-laptop-tb-dkms
;;; , ideapad-laptop-tb2024g6plus-dkms, libch343ser-git, pfring-dkms
;;; , r8126-dkms, nvidia-bl-dkms, rtl88x2ce-dkms-git
;;; , nvidia-open-tinygrad-dkms-git

;;; === BLOCKED — GCC_SNAPSHOT (2) ===
;;; libga68-snapshot, libgfortran-snapshot

;;; === BLOCKED — HARDWARE_SPECIFIC (1) ===
;;; kamilsss655-uv-k5-firmware-custom-git

;;; === BLOCKED — KERNEL_HEADERS (4) ===
;;; linux6.18.22-1-lts-bin, zfs-linux-hardened-headers, zfs-linux-rt-headers
;;; , zfs-linux-git-headers

;;; === BLOCKED — LEGACY_PYTHON2 (2) ===
;;; python2-gimp, boost-python2

;;; === BLOCKED — MINGW_CROSS_COMPILATION (10) ===
;;; mingw-w64-cblas, mingw-w64-lapack, mingw-w64-soundtouch, mingw-w64-boost
;;; , mingw-w64-cppwinrt, mingw-w64-pcre2, mingw-w64-spirv-tools
;;; , dxvk-async-git, mingw-w64-postgresql, mingw-w64-lame

;;; === BLOCKED — MULTILIB_UNSUPPORTED (5) ===
;;; lib32-opencl-nvidia-390xx, lib32-libglade, lib32-libxpm, lib32-sdl_sound
;;; , lib32-vkbasalt

;;; === BLOCKED — NON_DISTRIBUTABLE (4 + 1 newly categorized) ===
;;; ttf-consolas-ligaturized, ut2004-gog, unrealtournament4
;;; , factorio-space-age-experimental, prey (newly categorized)

;;; === BLOCKED — PLATFORM_UNSUPPORTED (5) ===
;;; bakkesmod-steam, android-platform-19, android-platform-21, futu-ftnn-wine
;;; , eddiscovery

;;; === BLOCKED — PROPRIETARY_BINARY (15) ===
;;; matlab-jre-bundled, sipgate-app-clinq, squareline-studio, upd72020x-fw-ng
;;; , xairedit, simplicity-commander, brother-mfc-l2400dw, knossu
;;; , libfprint-2-tod1-broadcom-cv3plus, wyc, inkdrop
;;; , soapysdrplay3-luarvique-git, anytxt-bin, pianoteq-stage, vmd

;;; === BLOCKED — PROPRIETARY_DEPS (0 + 1 newly categorized) ===
;;; python-pylink-square (newly categorized)

;;; === BLOCKED — SELINUX_SPECIFIC (2) ===
;;; sudo-selinux, base-selinux

;;; === BLOCKED — SOURCE_UNAVAILABLE (1) ===
;;; libfive-studio-git

