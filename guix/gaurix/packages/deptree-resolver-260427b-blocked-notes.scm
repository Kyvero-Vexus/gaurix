;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Blocked notes for deptree-resolver-260427b
;;; 96 packages remain BLOCKED after evaluation. 3 resolved as ALREADY_RESOLVED.
;;; 1 new recipe created (rocketchat-desktop-bin).
;;;
;;; ALREADY_RESOLVED (3):
;;;   euroscope-bin — recipe in recipe-resolver-260426l
;;;   asp — recipe in deptree-resolver-260418j
;;;   aurutils — recipe in queue-20260329p100
;;;
;;; NEW RECIPE (1):
;;;   rocketchat-desktop-bin — Electron .deb binary, v4.14.0, MIT license
;;;
;;; Categories of BLOCKED packages:
;;;
;;;   KERNEL_MODULE (18): aquacomputer_d5next-hwmon-dkms, amneziawg-dkms-git,
;;;     amneziawg-linux, amneziawg-linux-hardened, faustus-dkms-git,
;;;     ideapad-laptop-tb-dkms, ideapad-laptop-tb2024g6plus-dkms, pfring-dkms,
;;;     r8126-dkms, nvidia-bl-dkms, rtl88x2ce-dkms-git, nvidia-open-tinygrad-dkms-git,
;;;     libch343ser-git, linux-keep-modules, linux-gpib,
;;;     zfs-linux-hardened-headers, zfs-linux-rt-headers, zfs-linux-git-headers
;;;     Reason: DKMS/out-of-tree kernel modules or kernel-version-specific headers.
;;;     Guix manages kernels as store items; DKMS requires a mutable /lib/modules tree.
;;;     linux6.18.22-1-lts-bin also kernel-specific (not in AUR cache).
;;;
;;;   ARCH/DISTRO_SPECIFIC (17): sudo-selinux, base-selinux,
;;;     mkinitcpio-systemd-root-password, repacman, archwiki-offline, findbrokenpkgs,
;;;     sbctl-initcpio-post-hook, system-age, vscodium-marketplace, pacpak-git,
;;;     chromium-extension-arch-search, pamac-cli, python-pypi2pkgbuild,
;;;     mkinitcpio-clevis-hook, coreutils-arch, pikaur-static, pikaur-static-git
;;;     Reason: Tools depending on pacman/makepkg/mkinitcpio/AUR/SELinux or other
;;;     Arch Linux infrastructure with no equivalent use on Guix System.
;;;
;;;   PROPRIETARY/NON_DISTRIBUTABLE (15): squareline-studio, brother-mfc-l2400dw,
;;;     inkdrop, ttf-consolas-ligaturized, unrealtournament4,
;;;     factorio-space-age-experimental, luniistore, simplicity-commander,
;;;     libfprint-2-tod1-broadcom-cv3plus, soapysdrplay3-luarvique-git, ut2004-gog,
;;;     anytxt-bin, pianoteq-stage, vmd, matlab-jre-bundled
;;;     Reason: Proprietary/closed-source, non-redistributable fonts/games,
;;;     binary blobs with unclear licenses, or commercial software requiring purchase.
;;;
;;;   MULTILIB_UNSUPPORTED (4): lib32-opencl-nvidia-390xx, lib32-libglade,
;;;     lib32-libxpm, lib32-sdl_sound
;;;     Reason: 32-bit library variants; Guix handles multilib differently via
;;;     system profiles, not separate lib32-* packages.
;;;
;;;   MINGW_CROSS (9): mingw-w64-cblas, mingw-w64-lapack, mingw-w64-soundtouch,
;;;     mingw-w64-boost, mingw-w64-cppwinrt, mingw-w64-pcre2, mingw-w64-spirv-tools,
;;;     mingw-w64-postgresql, mingw-w64-lame
;;;     Reason: MinGW-w64 cross-compilation packages. Guix can cross-compile but
;;;     doesn't package the MinGW toolchain ecosystem.
;;;
;;;   PLATFORM_UNSUPPORTED (5): bakkesmod-steam, android-platform-19,
;;;     android-platform-21, fileoptimizer-bin, futu-ftnn-wine
;;;     Reason: Windows-only (Rocket League mod, Wine wrapper, FileOptimizer),
;;;     or Android SDK platform packages requiring Android SDK infrastructure.
;;;
;;;   MISSING_SOURCE (5): gradience, deadbeef-mpris2-plugin, sipgate-app-clinq,
;;;     wyc, linux6.18.22-1-lts-bin
;;;     Reason: Not found in AUR metadata cache; package likely removed, renamed,
;;;     or source URL unavailable.
;;;
;;;   ABANDONED_UPSTREAM (2): lightdm-webkit-theme-aether, clash-for-windows-chinese
;;;     Reason: Upstream project archived/abandoned (Clash for Windows) or
;;;     LightDM Arch theme no longer maintained.
;;;
;;;   LEGACY_DEPS (3): knossu, phonon-qt4-vlc, python2-gimp
;;;     Reason: knossu depends on obsolete glew1.10 + libpng12 (near-zero popularity);
;;;     phonon-qt4-vlc requires Qt4 (EOL); python2-gimp requires Python 2 (EOL, GIMP 3
;;;     uses Python 3).
;;;
;;;   MISSING_TOOLCHAIN/DEPS (18):
;;;     virtualbox-svn — massive build (Qt5+SDL+XPCOM); VBox available via nonguix
;;;     python-home-assistant-frontend — 500+ npm deps; webpack pipeline
;;;     nfuspire-git — requires libnspire (not in Guix)
;;;     quartz-utils-git — Crystal language not in Guix
;;;     rdt-client — .NET runtime/SDK not in Guix
;;;     texmacs-pure — Pure language + LLVM 3.5 not available
;;;     gbm — mono-basic not in Guix (Mono VB.NET)
;;;     kamilsss655-uv-k5-firmware-custom-git — arm-none-eabi-gcc not in Guix
;;;     mailnaggertray-git — mailnagger runtime dep not in Guix/AUR
;;;     python-gradio-pdf — python-gradio not in Guix (massive dep tree)
;;;     dxvk-async-git — requires MinGW-w64 cross-compilation for Wine DLLs
;;;     eddiscovery — nuget not in Guix; .NET/Mono complex build
;;;     glibc-eac — patched system glibc; dangerous and complex
;;;     logstash — JRuby + Java + 100s of bundled gems; binary too large
;;;     plank-reloaded-docklet-picky-git — plank-reloaded (fork) not in Guix
;;;     wayprompt-git — zig-build-system available but missing zig deps
;;;       (zig-fcft, zig-ini, zig-spoon) + version mismatches with zig@0.11
;;;       A1: zig-build-system with zig@0.11 — missing zig-fcft/zig-ini/zig-spoon
;;;       A2: package the 3 missing zig deps — version conflicts with Guix zig-pixman
;;;         0.3.0 vs wayprompt's 0.2.0 requirement
;;;       A3: build from source with gnu-build-system + zig as native-input — still
;;;         needs zig.zon dependency resolution
;;;     wldash — 50+ Rust crate deps; cargo-build-system requires enumerating all
;;;     emerald — compiz-core not in Guix

(define-module (gaurix packages deptree-resolver-260427b-blocked-notes))
