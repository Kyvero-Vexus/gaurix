;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Blocked notes for deptree-resolver-260426d
;;;
;;; 100 packages evaluated, 1 resolved with recipes, 99 remain BLOCKED.
;;;
;;; Resolved packages:
;;;   1. swscreenshot-gui (GTK3/Python Sway screenshot GUI, copy-build-system)
;;;      Previous assessment incorrectly cited missing sway tooling; all deps
;;;      (grim, slurp, wl-clipboard, swaybg, libnotify, python-pygobject)
;;;      are available in Guix.
;;;
;;; Blocked packages by category:
;;;
;;; === SELINUX_SPECIFIC (2) ===
;;; sudo-selinux: requires SELinux kernel infrastructure
;;; base-selinux: meta-package for SELinux Arch installation
;;;
;;; === DKMS_KERNEL_MODULE (12) ===
;;; aquacomputer_d5next-hwmon-dkms: HWMON DKMS module
;;; amneziawg-dkms-git: AmneziaWG VPN DKMS
;;; amneziawg-linux: AmneziaWG kernel module
;;; amneziawg-linux-hardened: AmneziaWG for hardened kernel
;;; faustus-dkms-git: ASUS TUF fan control DKMS
;;; ideapad-laptop-tb-dkms: Ideapad ThinkBook DKMS
;;; ideapad-laptop-tb2024g6plus-dkms: Ideapad 2024 G6+ DKMS
;;; pfring-dkms: PF_RING network DKMS
;;; r8126-dkms: Realtek RTL8126 DKMS
;;; nvidia-bl-dkms: NVIDIA backlight DKMS
;;; rtl88x2ce-dkms-git: Realtek WiFi DKMS
;;; nvidia-open-tinygrad-dkms-git: NVIDIA open tinygrad DKMS
;;;
;;; === PLATFORM_UNSUPPORTED (3) ===
;;; bakkesmod-steam: Windows-only Rocket League mod
;;; euroscope-bin: Windows-only VATSIM radar, runs via Wine
;;; fileoptimizer-bin: Windows app via Wine
;;;
;;; === DISTRO_SPECIFIC (13) ===
;;; mkinitcpio-systemd-root-password: Arch mkinitcpio hook
;;; repacman: pacman package rebuilder
;;; archwiki-offline: Arch Wiki offline reader
;;; findbrokenpkgs: pacman broken-package finder
;;; linux-keep-modules: pacman kernel module hook
;;; sbctl-initcpio-post-hook: sbctl mkinitcpio hook
;;; system-age: reads pacman install date
;;; vscodium-marketplace: patches VSCodium internals via pacman hook
;;; chromium-extension-arch-search: Arch search browser ext
;;; pacpak-git: pacman + flatpak wrapper
;;; pamac-cli: ALPM/pacman package manager frontend
;;; python-pypi2pkgbuild: PyPI to PKGBUILD converter
;;; asp: Arch build source management tool
;;; aurutils: AUR helper tools
;;;
;;; === SOURCE_UNAVAILABLE (10) ===
;;; deadbeef-mpris2-plugin: merged into DeaDBeeF 1.10.2+, removed from AUR
;;; linux6.18.22-1-lts-bin: not in AUR cache, removed
;;; matlab-jre-bundled: proprietary MATLAB component, removed from AUR
;;; sipgate-app-clinq: proprietary Electron app, not in AUR cache
;;; squareline-studio: proprietary binary, custom license
;;; luniistore: proprietary Java app, download 403
;;; simplicity-commander: proprietary binary, download URL dead
;;; receitanet: proprietary Brazilian government software
;;; wyc: proprietary Chinese tunneling binary
;;; urbanterror: proprietary game data, download broken
;;;
;;; === PROPRIETARY_BINARY / PROPRIETARY_DEP (5) ===
;;; brother-mfc-l2400dw: proprietary i386 binary printer driver
;;; libfprint-2-tod1-broadcom-cv3plus: proprietary fingerprint driver
;;; inkdrop: proprietary commercial Electron note-taking app
;;; plugin-autenticacao-gov-pt: binary .deb, no source repo
;;; soapysdrplay3-luarvique-git: depends on proprietary SDRPlay API
;;;
;;; === NON_DISTRIBUTABLE (4) ===
;;; ttf-consolas-ligaturized: derivative of proprietary Microsoft font
;;; ut2004-gog: commercial game (Unreal Tournament 2004)
;;; unrealtournament4: proprietary Epic Games
;;; factorio-space-age-experimental: proprietary commercial game
;;;
;;; === MULTILIB_UNSUPPORTED (2) ===
;;; lib32-opencl-nvidia-390xx: 32-bit multilib not supported
;;; lib32-libglade: 32-bit multilib not supported
;;;
;;; === MINGW_CROSS_COMPILATION (7) ===
;;; mingw-w64-cblas: Windows cross-compilation target
;;; mingw-w64-lapack: Windows cross-compilation target
;;; mingw-w64-soundtouch: Windows cross-compilation target
;;; mingw-w64-boost: Windows cross-compilation target
;;; mingw-w64-cppwinrt: Windows Runtime APIs cross-compilation
;;; mingw-w64-pcre2: Windows cross-compilation target
;;; mingw-w64-spirv-tools: Windows cross-compilation target
;;;
;;; === BROWSER_EXTENSION (1) ===
;;; librewolf-extension-ublock-origin-bin: browser extension .xpi
;;;
;;; === KERNEL_SPECIFIC (3) ===
;;; zfs-linux-hardened-headers: kernel-version-specific ZFS headers
;;; zfs-linux-rt-headers: kernel-version-specific ZFS headers
;;; zfs-linux-git-headers: kernel-version-specific ZFS headers
;;;
;;; === CROSS_COMPILATION (1) ===
;;; kamilsss655-uv-k5-firmware-custom-git: ARM cross-compilation toolchain
;;;
;;; === ABANDONED_UPSTREAM (2) ===
;;; clash-for-windows-chinese: GitHub repo deleted
;;; lightdm-webkit-theme-aether: project archived + needs lightdm-webkit2-greeter
;;;
;;; === LEGACY_QT4 (1) ===
;;; phonon-qt4-vlc: Qt4 EOL since 2015
;;;
;;; === ANDROID_SDK_PLATFORM (2) ===
;;; android-platform-19: proprietary Google Android SDK
;;; android-platform-21: proprietary Google Android SDK
;;;
;;; === DEP_RESOLUTION_FAILED (17) ===
;;; gradience: project archived Jul 2024, removed from AUR
;;; virtualbox-svn: 53+ deps, kernel modules, proprietary components
;;; edgeimpulse-cli: npm + 29 native deps (sharp, serialport)
;;; aws-amplify-cli: massive npm dependency tree
;;; aws-cdk: massive npm dependency tree
;;; emmet-language-server: npm, deep node dependency tree
;;; nodejs-cspell: npm monorepo, 200+ transitive deps
;;; osmtogeojson: npm, 10 direct deps + transitive tree
;;; python-home-assistant-frontend: 115MB pre-built JS frontend
;;; java-language-server: Maven downloads 100+ deps at build time
;;; nodejs-nestjs-cli: npm, deep node dependency tree
;;; quartz-utils-git: Crystal language not in Guix
;;; rdt-client: needs .NET 9/10, Guix only has .NET 8
;;; sommelier-git: ChromeOS platform2 monorepo
;;; texmacs-pure: Pure language defunct, needs LLVM 3.5
;;; eclipse-pydev: Eclipse IDE not in Guix
;;; gephi-git: Maven + NetBeans Platform (double blocker)
;;;
;;; === DEP_RESOLUTION_FAILED (continued, re-evaluated) ===
;;; vegastrike-git: requires vegastrike-engine (not yet in Guix); engine CMake
;;;   build feasible (all deps available: boost, opengl, sdl2, openal, python,
;;;   freeglut, libvorbis, zlib, expat, libjpeg-turbo, libpng); needs patches
;;;   for FetchContent (gtest) and git version detection. Game assets in separate
;;;   Assets-Production repo. Actionable: package engine first, then assets.
;;; gbm: VB.NET/Mono, mono-basic compiler not in Guix
;;; pulumi-git: large multi-language Go+Node+Python
;;; awk-language-server: npm/TypeScript + tree-sitter (~20-30 transitive deps)
;;; nfuspire-git: needs libnspire (not in Guix), 1 commit, immature
;;; mailnaggertray-git: missing mailnagger dep, no releases, immature
;;;
;;; === TOOLING_FAILURE (2) ===
;;; libarchive-static: static musl build, musl toolchain not mature in Guix
;;; vivaldi-autoinject-custom-js-ui: Vivaldi browser internals modification
;;;
;;; === NEEDS_RECIPE_DESIGN (3) ===
;;; knossu: binary-only game from 2015, no source, obsolete deps
;;; futu-ftnn-wine: proprietary Windows binary via Wine
;;; python-gradio-pdf: blocked on python-gradio (massive dep tree)
;;;
;;; === OTHER (2) ===
;;; python-jaxlib-bin: binary wheel, source build requires Bazel
;;; libch343ser-git: kernel module, AUR repo empty
;;;
;;; === KERNEL_MODULE (1) ===
;;; edgeimpulse-cli: already listed above under DEP_RESOLUTION_FAILED
