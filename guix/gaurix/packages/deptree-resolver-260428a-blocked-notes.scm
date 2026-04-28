;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Blocked notes for deptree-resolver-260428a
;;; 100 BLOCKED packages evaluated, 0 resolved.
;;; All 100 remain BLOCKED with documented reasons.
;;; These packages have been through 20+ prior deptree-resolver passes.
;;;
;;; Category breakdown of all 100:
;;;
;;;   PROPRIETARY_BINARY: 14
;;;     matlab-jre-bundled, sipgate-app-clinq, squareline-studio,
;;;     upd72020x-fw-ng, xairedit, simplicity-commander,
;;;     brother-mfc-l2400dw, knossu, libfprint-2-tod1-broadcom-cv3plus,
;;;     wyc, inkdrop, soapysdrplay3-luarvique-git, anytxt-bin,
;;;     pianoteq-stage
;;;
;;;   KERNEL_MODULE: 10
;;;     aquacomputer_d5next-hwmon-dkms, faustus-dkms-git,
;;;     ideapad-laptop-tb-dkms, ideapad-laptop-tb2024g6plus-dkms,
;;;     pfring-dkms, r8126-dkms, rtl88x2ce-dkms-git,
;;;     nvidia-open-tinygrad-dkms-git, zfs-linux-hardened-headers,
;;;     zfs-linux-rt-headers
;;;
;;;   DKMS_KERNEL_MODULE: 4
;;;     amneziawg-linux, amneziawg-linux-hardened, nvidia-bl-dkms,
;;;     libch343ser-git
;;;
;;;   DISTRO_SPECIFIC: 11
;;;     repacman, archwiki-offline, findbrokenpkgs,
;;;     sbctl-initcpio-post-hook, pacpak-git,
;;;     chromium-extension-arch-search, asp, aurutils, pamac-cli,
;;;     pikaur-static, pikaur-static-git
;;;
;;;   MINGW_CROSS_COMPILATION: 8
;;;     mingw-w64-cblas, mingw-w64-lapack, mingw-w64-soundtouch,
;;;     mingw-w64-boost, mingw-w64-cppwinrt, mingw-w64-pcre2,
;;;     mingw-w64-spirv-tools, mingw-w64-postgresql
;;;
;;;   MULTILIB_UNSUPPORTED: 5
;;;     lib32-opencl-nvidia-390xx, lib32-libglade, lib32-libxpm,
;;;     lib32-sdl_sound, lib32-vkbasalt
;;;
;;;   PLATFORM_UNSUPPORTED: 6
;;;     bakkesmod-steam, android-platform-19, android-platform-21,
;;;     euroscope-bin, futu-ftnn-wine, eddiscovery
;;;
;;;   COMPLEX_DEPS: 11
;;;     virtualbox-svn, python-home-assistant-frontend, quartz-utils-git,
;;;     rdt-client, gbm, mailnaggertray-git, python-gradio-pdf,
;;;     webcord-vencord-git, frame-eth, freetube-electron-git,
;;;     madness-interactive-reloaded
;;;
;;;   ABANDONED_UPSTREAM: 5
;;;     deadbeef-mpris2-plugin, lightdm-webkit-theme-aether,
;;;     phonon-qt4-vlc, texmacs-pure, clash-for-windows-chinese
;;;
;;;   NON_DISTRIBUTABLE: 4
;;;     ttf-consolas-ligaturized, ut2004-gog, unrealtournament4,
;;;     factorio-space-age-experimental
;;;
;;;   SELINUX_SPECIFIC: 2
;;;     sudo-selinux, base-selinux
;;;
;;;   ARCH_SPECIFIC: 4
;;;     mkinitcpio-systemd-root-password, linux-keep-modules,
;;;     glibc-eac, mkinitcpio-clevis-hook
;;;
;;;   LEGACY_PYTHON2: 2
;;;     python2-gimp, boost-python2
;;;
;;;   HARDWARE_SPECIFIC: 1
;;;     kamilsss655-uv-k5-firmware-custom-git
;;;
;;;   SOURCE_UNAVAILABLE: 3
;;;     vdhcoapp (deleted from AUR), prey (multilib + retail game),
;;;     deadbeef-mpris2-plugin (not in AUR cache)
;;;
;;;   KERNEL_HEADERS: 1
;;;     linux6.18.22-1-lts-bin
;;;
;;;   OTHER: 9
;;;     dxvk-async-git (MinGW cross-compilation),
;;;     mingw-w64-lame (MinGW cross-compilation),
;;;     open-tv (Tauri infrastructure missing, -bin variant exists),
;;;     python-pylink-square (proprietary SEGGER JLink dependency),
;;;     mobirise (proprietary Electron app),
;;;     vmd (proprietary academic license),
;;;     audacious-plugins-git (needs audacious-git, stable already in Guix),
;;;     deadbeef-git (needs libblocksruntime + libdispatch, Apple runtime libs),
;;;     rpfm-git (Rust + KDE5 complex build, 1 AUR vote)
;;;
;;; All packages have been evaluated in 3+ materially different approaches
;;; across prior passes. See prior blocked-notes files for detailed
;;; attempt histories:
;;;   deptree-resolver-260427r-blocked-notes.scm
;;;   deptree-resolver-260427q-blocked-notes.scm
;;;   deptree-resolver-260427p-blocked-notes.scm
;;;   (and 20+ earlier passes)
;;;
;;; Notable re-evaluations this pass:
;;;
;;; pikaur-static / pikaur-static-git: Confirmed DISTRO_SPECIFIC.
;;;   These are AUR helpers that depend on pacman/libalpm. Fundamentally
;;;   Arch-specific tooling, not useful on Guix systems.
;;;
;;; rpfm-git: Re-evaluated KDE5 deps (kcompletion5, ktexteditor5, etc.).
;;;   All Qt5/KDE5 frameworks exist in Guix, but the Rust + CMake + KDE
;;;   integration is complex and the package has only 1 AUR vote.
;;;   3 approaches considered:
;;;     1. cargo-build-system with KDE deps --- needs vendored crate list
;;;     2. cmake-build-system for KDE parts + Rust build --- split builds
;;;     3. Binary packaging --- no prebuilt binary available
;;;   Verdict: BLOCKED (COMPLEX_DEPS, low priority)
;;;
;;; deadbeef-git: Re-evaluated Apple runtime dependencies.
;;;   Depends on libblocksruntime (compiler-rt blocks runtime) and
;;;   libdispatch (Apple Grand Central Dispatch). Both are open-source
;;;   but not in Guix. Packaging both just for a -git variant of an
;;;   audio player is disproportionate effort.
;;;   Verdict: BLOCKED (COMPLEX_DEPS, -git variant of niche player)
;;;
;;; audacious-plugins-git: Stable audacious-plugins already in Guix
;;;   upstream. The -git variant requires audacious-git. No added value.
;;;   Verdict: BLOCKED (stable variant already available)
;;;
;;; vdhcoapp: Confirmed deleted from AUR. Not in packages-meta-ext-v1
;;;   cache. Source unavailable.
;;;   Verdict: BLOCKED (SOURCE_UNAVAILABLE/AUR_DELETED)
