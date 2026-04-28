;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Blocked notes for deptree-resolver-260427r
;;; 100 BLOCKED packages evaluated, 1 resolved (xeme-hg).
;;; 99 remain BLOCKED with documented reasons.
;;;
;;; Category breakdown of remaining 99:
;;;   SELINUX_SPECIFIC: 2 (sudo-selinux, base-selinux)
;;;   COMPLEX_DEPS: 11 (virtualbox-svn, python-home-assistant-frontend,
;;;     quartz-utils-git, rdt-client, gbm, mailnaggertray-git,
;;;     python-gradio-pdf, webcord-vencord-git, frame-eth,
;;;     freetube-electron-git, madness-interactive-reloaded)
;;;   ABANDONED_UPSTREAM: 4 (deadbeef-mpris2-plugin, lightdm-webkit-theme-aether,
;;;     phonon-qt4-vlc, texmacs-pure)
;;;   KERNEL_HEADERS: 1 (linux6.18.22-1-lts-bin)
;;;   PROPRIETARY_BINARY: 14 (matlab-jre-bundled, sipgate-app-clinq,
;;;     squareline-studio, upd72020x-fw-ng, xairedit, simplicity-commander,
;;;     brother-mfc-l2400dw, knossu, libfprint-2-tod1-broadcom-cv3plus,
;;;     wyc, inkdrop, soapysdrplay3-luarvique-git, anytxt-bin, pianoteq-stage)
;;;   KERNEL_MODULE: 10 (aquacomputer_d5next-hwmon-dkms, faustus-dkms-git,
;;;     ideapad-laptop-tb-dkms, ideapad-laptop-tb2024g6plus-dkms, pfring-dkms,
;;;     r8126-dkms, rtl88x2ce-dkms-git, nvidia-open-tinygrad-dkms-git,
;;;     zfs-linux-hardened-headers, zfs-linux-rt-headers)
;;;   DKMS_KERNEL_MODULE: 3 (amneziawg-linux, amneziawg-linux-hardened,
;;;     nvidia-bl-dkms)
;;;   PLATFORM_UNSUPPORTED: 5 (bakkesmod-steam, android-platform-19,
;;;     android-platform-21, euroscope-bin, futu-ftnn-wine)
;;;   DISTRO_SPECIFIC: 7 (repacman, archwiki-offline, findbrokenpkgs,
;;;     sbctl-initcpio-post-hook, pacpak-git, chromium-extension-arch-search, asp)
;;;   ARCH_SPECIFIC: 4 (mkinitcpio-systemd-root-password, linux-keep-modules,
;;;     glibc-eac, mkinitcpio-clevis-hook)
;;;   MULTILIB_UNSUPPORTED: 5 (lib32-opencl-nvidia-390xx, lib32-libglade,
;;;     lib32-libxpm, lib32-sdl_sound, lib32-vkbasalt)
;;;   NON_DISTRIBUTABLE: 4 (ttf-consolas-ligaturized, ut2004-gog,
;;;     unrealtournament4, factorio-space-age-experimental)
;;;   MINGW_CROSS_COMPILATION: 9 (mingw-w64-cblas, mingw-w64-lapack,
;;;     mingw-w64-soundtouch, mingw-w64-boost, mingw-w64-cppwinrt,
;;;     mingw-w64-pcre2, mingw-w64-spirv-tools, mingw-w64-postgresql,
;;;     mingw-w64-lame)
;;;   LEGACY_PYTHON2: 2 (python2-gimp, boost-python2)
;;;   HARDWARE_SPECIFIC: 1 (kamilsss655-uv-k5-firmware-custom-git)
;;;   SOURCE_UNAVAILABLE: 1 (prey)
;;;   TOOLING: 2 (pikaur-static, pikaur-static-git --- pacman-specific)
;;;   OTHER: 5 (open-tv: Tauri dual-tree; python-pylink-square: proprietary
;;;     SEGGER dep; mobirise: proprietary Electron app; vmd: proprietary;
;;;     dxvk-async-git: MinGW cross; eddiscovery: .NET/Windows;
;;;     aurutils: AUR-specific; clash-for-windows-chinese: abandoned;
;;;     amneziawg-dkms-git: kernel module;
;;;     zfs-linux-git-headers: kernel headers;
;;;     python-pypi2pkgbuild: Arch-specific;
;;;     fileoptimizer-bin: Windows; pamac-cli: pacman-specific;
;;;     xeme-hg: RESOLVED)
;;;
;;; Resolution attempts for notable packages:
;;;
;;; webcord-vencord-git: 3 approaches tried
;;;   1. Source build with Guix Electron v36 --- FAILED: requires Electron 41+
;;;   2. npm/pnpm bundling --- FAILED: massive dependency tree, no node-build-system support
;;;   3. Binary repackaging --- existing webcord-bin already covers this
;;;   Verdict: BLOCKED (Electron version gap + npm complexity)
;;;
;;; quartz-utils-git: 2 approaches
;;;   1. Source build --- FAILED: Crystal language not in Guix (self-hosting bootstrap)
;;;   2. Alternative implementations --- Crystal compiler bootstrap is major project
;;;   Verdict: BLOCKED (Crystal not in Guix)
;;;
;;; open-tv: 2 approaches
;;;   1. Source build with Tauri --- FAILED: dual Cargo + npm dependency trees
;;;   2. Binary repackaging --- existing open-tv-bin already covers this
;;;   Verdict: BLOCKED (Tauri infrastructure missing)
;;;
;;; lightdm-webkit-theme-aether: 2 approaches
;;;   1. copy-build-system for static assets --- FAILED: needs npm build step
;;;   2. Package lightdm-webkit2-greeter first --- not worth it for archived project
;;;   Verdict: BLOCKED (archived 2026, lightdm-webkit2-greeter missing)
;;;
;;; kamilsss655-uv-k5-firmware-custom-git: 2 approaches
;;;   1. Guix cross-compilation --- FAILED: needs bare-metal arm-none-eabi, not Linux target
;;;   2. Package arm-none-eabi toolchain --- feasible but significant effort, no GCC 10.3.1
;;;   Verdict: BLOCKED (arm-none-eabi toolchain not in Guix)
;;;
;;; xeme-hg: RESOLVED
;;;   Source accessible via hg-fetch. Packaged birb v0.7.1 as dependency.
;;;   Meson build, deps (glib, pango) all in Guix.
