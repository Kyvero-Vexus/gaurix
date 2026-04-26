;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Blocked notes for deptree-resolver-260426f
;;;
;;; 100 packages evaluated, 3 resolved with recipes, 97 remain BLOCKED.
;;;
;;; Resolved packages:
;;;   1. arti (Rust Tor implementation; cargo-build-system, all native deps
;;;      (openssl, sqlite, xz) in Guix.  guix import crate produces clean
;;;      definition.  cargo-inputs auto-vendors ~47 crate dependencies.)
;;;   2. vegastrike-engine (space sim engine; cmake-build-system, all deps in
;;;      Guix: boost, sdl2, openal, opengl, python, etc.  Source from GitHub
;;;      v0.9.1 stable release.)
;;;   3. vegastrike (game assets; copy-build-system, 700MB asset archive from
;;;      GitHub v0.9.1 tag.  Depends on vegastrike-engine.)
;;;
;;; Blocked packages by category:
;;;
;;; === SELINUX_SPECIFIC (2) ===
;;; sudo-selinux (#18513): SELinux-enabled sudo; Guix does not use SELinux.
;;; base-selinux (#18537): SELinux meta-package for Arch; full SELinux stack.
;;;
;;; === DKMS_KERNEL_MODULE (11) ===
;;; All require DKMS which is incompatible with Guix's immutable kernel model.
;;; aquacomputer_d5next-hwmon-dkms (#18447): HWMON driver for Aquacomputer
;;; amneziawg-dkms-git (#18384): AmneziaWG VPN kernel module
;;; amneziawg-linux (#18358): AmneziaWG kernel module
;;; amneziawg-linux-hardened (#18403): AmneziaWG for hardened kernel
;;; ideapad-laptop-tb-dkms (#17938): Lenovo Ideapad ThinkBook DKMS driver
;;; ideapad-laptop-tb2024g6plus-dkms (#17937): Lenovo 2024 G6+ DKMS driver
;;; pfring-dkms (#18430): PF_RING network monitoring DKMS module
;;; nvidia-bl-dkms (#18356): NVIDIA backlight DKMS driver
;;; r8126-dkms (#18346): Realtek RTL8126 ethernet DKMS driver
;;; rtl88x2ce-dkms-git (#18369): Realtek WiFi DKMS driver
;;; faustus-dkms-git (#18414): ASUS TUF fan control DKMS driver
;;;
;;; === PLATFORM_UNSUPPORTED (5) ===
;;; bakkesmod-steam (#18417): Windows-only Rocket League modding tool
;;; android-platform-19 (#18550): Proprietary Google Android SDK API level 19
;;; android-platform-21 (#18549): Proprietary Google Android SDK API level 21
;;; euroscope-bin (#18289): Windows-only VATSIM radar client
;;; fileoptimizer-bin (#18448): Windows app via Wine
;;;
;;; === DISTRO_SPECIFIC (13) ===
;;; All tightly coupled to Arch Linux's pacman/mkinitcpio/ALPM.
;;; mkinitcpio-systemd-root-password (#18515): mkinitcpio hook
;;; repacman (#18374): Pacman package rebuilder
;;; findbrokenpkgs (#18385): Pacman broken-package finder
;;; sbctl-initcpio-post-hook (#18390): sbctl mkinitcpio hook
;;; system-age (#18381): Reads pacman install date
;;; linux-keep-modules (#18342): Pacman hook for kernel modules
;;; pacpak-git (#18531): pacman + flatpak unified wrapper
;;; chromium-extension-arch-search (#18382): Arch Wiki/AUR browser extension
;;; python-pypi2pkgbuild (#18324): PyPI-to-PKGBUILD converter
;;; archwiki-offline (#18397): Arch Wiki offline reader
;;; asp (#14587): Arch Build System package retrieval tool
;;; pamac-cli (#18299): ALPM/pacman package manager frontend
;;; aurutils (#18?): AUR helper tools requiring pacman
;;;
;;; === SOURCE_UNAVAILABLE (10) ===
;;; deadbeef-mpris2-plugin (#18511): Merged into DeaDBeeF 1.10.2+
;;; linux6.18.22-1-lts-bin (#18555): Not in AUR cache; removed or renamed
;;; matlab-jre-bundled (#18419): Proprietary MATLAB; not redistributable
;;; sipgate-app-clinq (#18?): Proprietary Electron; not in AUR cache
;;; luniistore (#18418): Proprietary; download returns 403
;;; simplicity-commander (#18361): Proprietary; download URL dead
;;; receitanet (#18?): Proprietary Brazilian government software
;;; wyc (#18?): Proprietary Chinese tunneling binary
;;; plugin-autenticacao-gov-pt (#18?): Binary .deb, no source repo
;;; inkdrop (#18?): Proprietary commercial Electron app
;;;
;;; === PROPRIETARY_BINARY (3) ===
;;; squareline-studio (#18?): Commercial binary, custom license
;;; brother-mfc-l2400dw (#18?): Binary-only i386 printer driver
;;; libfprint-2-tod1-broadcom-cv3plus (#18?): Non-redistributable
;;;
;;; === MINGW_CROSS_COMPILATION (7) ===
;;; All target Windows via MinGW cross-compiler, not available in Guix.
;;; mingw-w64-cblas, mingw-w64-lapack, mingw-w64-soundtouch,
;;; mingw-w64-boost, mingw-w64-cppwinrt, mingw-w64-pcre2,
;;; mingw-w64-spirv-tools
;;;
;;; === MULTILIB_UNSUPPORTED (2) ===
;;; lib32-opencl-nvidia-390xx (#18?): 32-bit multilib not supported in Guix
;;; lib32-libglade (#18?): 32-bit multilib not supported in Guix
;;;
;;; === NON_DISTRIBUTABLE (4) ===
;;; ttf-consolas-ligaturized (#18?): Derivative of proprietary Microsoft font
;;; ut2004-gog (#18?): Commercial game
;;; unrealtournament4 (#18?): Proprietary Epic Games
;;; factorio-space-age-experimental (#18?): Proprietary commercial game
;;;
;;; === KERNEL_SPECIFIC (3) ===
;;; zfs-linux-hardened-headers (#18?): Kernel-version-specific ZFS headers
;;; zfs-linux-rt-headers (#18?): Kernel-version-specific ZFS headers
;;; zfs-linux-git-headers (#18?): Kernel-version-specific ZFS headers
;;;
;;; === KERNEL_MODULE (1) ===
;;; libch343ser-git (#18?): Kernel module, AUR repo empty
;;;
;;; === BROWSER_EXTENSION (1) ===
;;; librewolf-extension-ublock-origin-bin (#18?): .xpi browser extension
;;;
;;; === ABANDONED_UPSTREAM (2) ===
;;; lightdm-webkit-theme-aether (#18?): Depends on lightdm-webkit2-greeter
;;;   (not in Guix), project archived
;;; clash-for-windows-chinese (#18?): GitHub repo deleted
;;;
;;; === CROSS_COMPILATION (1) ===
;;; kamilsss655-uv-k5-firmware-custom-git (#18?): ARM cross-compilation
;;;
;;; === PROPRIETARY_DEP (1) ===
;;; soapysdrplay3-luarvique-git (#18?): Depends on SDRPlay API (proprietary)
;;;
;;; === DEP_RESOLUTION_FAILED (19) ===
;;; gradience (#18?): AUR_REPO_DELETED: project archived Jul 2024
;;;   A1: checked GitHub - repo is archived, 0.4.1 from 2023, no forks
;;;   A2: no active continuation or fork exists
;;;   A3: confirmed removed from AUR
;;; virtualbox-svn (#18?): 53+ deps, kernel modules, proprietary components
;;;   A1: too complex (libtpms, gsoap, libvncserver all missing)
;;;   A2: kernel modules (vboxdrv) incompatible with Guix
;;;   A3: VirtualBox already available as binary package
;;; edgeimpulse-cli (#18?): npm package, 29 native deps (sharp, serialport)
;;;   A1: npm ecosystem not supported in Guix sandbox
;;;   A2: no pre-built binary available
;;;   A3: sharp + serialport native deps need node-gyp (not in Guix)
;;; nodejs-cspell (#18?): npm monorepo, 200+ transitive deps
;;; osmtogeojson (#18?): npm with 10 direct + many transitive deps
;;;   A1: npm build not feasible in Guix sandbox
;;;   A2: no standalone binary available
;;;   A3: considered vendoring node_modules - too many deps to maintain
;;; python-home-assistant-frontend (#18?): 115MB pre-built JS frontend
;;;   Not a real Python package - massive JS/TS project distributed as wheel
;;; java-language-server (#18?): Maven build, OutOfDate since 2023-06-20
;;;   A1: Maven needs network in sandbox - blocked
;;;   A2: no pre-built JARs or GitHub releases (zero releases)
;;;   A3: protobuf-java not in Guix; emacs-lsp-java already provides Java LSP
;;; nfuspire-git (#18?): Depends on libnspire (not in Guix)
;;;   A1: libnspire has 26 commits, no tags/releases, dormant since 2022
;;;   A2: nfuspire has 1 commit, created 2025-03-27, requires C23
;;;   A3: 1 AUR vote each, niche TI calculator tool, not worth packaging chain
;;; nodejs-nestjs-cli (#18?): npm, deep node dependency tree
;;; quartz-utils-git (#18?): Crystal language not in Guix
;;; rdt-client (#18?): Needs .NET 9/10, Guix only has dotnet 8
;;; texmacs-pure (#18?): Pure language defunct, needs LLVM 3.5
;;; eclipse-pydev (#18?): Eclipse IDE not in Guix
;;; gbm (#18?): VB.NET/Mono, mono-basic compiler not in Guix
;;; gephi-git (#18?): Maven + NetBeans Platform double blocker
;;; aws-amplify-cli (#18?): Massive npm dependency tree
;;; aws-cdk (#18?): Massive npm dependency tree
;;; emmet-language-server (#18?): npm with ~6 direct + many transitive deps
;;; awk-language-server (#18?): npm/TypeScript, needs yarn (not in Guix)
;;;
;;; === TOOLING_FAILURE (4) ===
;;; vscodium-marketplace (#18?): Patches vscodium product.json; licensing concern
;;;   A1: Microsoft marketplace ToS may prohibit redistribution
;;;   A2: vscodium itself intentionally disables proprietary marketplace
;;;   A3: Open VSX marketplace is the sanctioned alternative
;;; libarchive-static (#18?): Requires musl-gcc toolchain not in Guix
;;;   A1: musl in Guix is only for cross-compilation, no musl-gcc wrapper
;;;   A2: would need 7 static-musl library variants (attr, acl, openssl, etc.)
;;;   A3: use case (emergency recovery) not relevant to Guix package model
;;; nvidia-open-tinygrad-dkms-git (#18?): DKMS kernel module (empty AUR repo)
;;; vivaldi-autoinject-custom-js-ui (#18?): Depends on vivaldi (proprietary)
;;;
;;; === OTHER (10) ===
;;; phonon-qt4-vlc (#18?): Qt4 is dead/EOL since 2015, removed from Guix
;;; mailnaggertray-git (#18?): Needs mailnagger (not in Guix) + Rust vendoring
;;;   A1: mailnagger itself has python-zombie-imp dep (not in Guix)
;;;   A2: mailnaggertray is Rust/Cargo needing vendored deps
;;;   A3: only 11 commits, very low popularity
;;; pulumi-git (#18?): Large multi-language Go+Node+Python project
;;;   A1: Go build feasible but massive dep vendoring needed
;;;   A2: also integrates Node.js + Python SDKs at runtime
;;;   A3: >200 Go module dependencies
;;; python-gradio-pdf (#18?): Needs python-gradio (massive dep tree)
;;; python-jaxlib-bin (#18?): Binary wheel; source build requires Bazel
;;; futu-ftnn-wine (#18?): Proprietary Windows binary via Wine
;;; knossu (#18?): Binary-only from 2015, needs glew1.10 + libpng12 (obsolete)
;;; urbanterror (#18?): Proprietary game data, download broken
;;; dxvk-async-git (#18?): Needs mingw-w64-gcc cross compiler for Windows DLLs
;;; arti-git (#18?): RESOLVED via arti recipe (crate v2.2.0)
