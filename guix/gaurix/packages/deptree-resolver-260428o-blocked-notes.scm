;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Blocked notes for deptree-resolver-260428o
;;; 100 packages evaluated, 2 resolved (gbm + mono-basic), 98 confirmed BLOCKED.
;;;
;;; Generated: 2026-04-28

(define-module (gaurix packages deptree-resolver-260428o-blocked-notes))

;;; ── RESOLVED ──────────────────────────────────────────────────────────

;;; gbm (#19044) — Game Backup Monitor
;;; Status: DONE (new recipe in deptree-resolver-260428o.scm)
;;; Previously BLOCKED as COMPLEX_DEPS because it depends on mono-basic
;;; (VB.NET runtime), which was not in Guix.  Resolution: packaged
;;; mono-basic v4.8 from upstream GitHub (autotools build on Mono), then
;;; gbm v1.4.3 as pre-compiled Mono binary (copy-build-system with 7z
;;; extraction).  Both packages build and lint clean.

;;; mono-basic (new dependency for gbm)
;;; VB.NET compiler and runtime libraries for Mono v4.8.
;;; Source: https://github.com/mono/mono-basic (commit e31cb70)
;;; Build: gnu-build-system, required fixing SDK path and /usr/bin/install.
;;; License: LGPL-2.1+.

;;; ── BLOCKED PACKAGES ──────────────────────────────────────────────────

;;; ── ABANDONED_UPSTREAM (6 packages) ────────────────────────────────────
;;; Upstream project abandoned/deleted; source no longer available or viable.
;;;
;;; deadbeef-mpris2-plugin (#19282)
;;;   Not in AUR cache, no upstream source found.
;;;   Prior 20+ evaluations, consistently BLOCKED.
;;;
;;; lightdm-webkit-theme-aether (#19028)
;;;   AUR present, deps=3. GitHub archived 2022, last commit 2020.
;;;   Depends on lightdm-webkit2-greeter (not in Guix, also deprecated).
;;;
;;; phonon-qt4-vlc (#18938)
;;;   AUR present, deps=3. Requires Qt4 (EOL 2015, not in Guix).
;;;   Package abandoned 2020, no forward path.
;;;
;;; texmacs-pure (#17873)
;;;   AUR present, deps=3. Pure language archived, requires LLVM 3.5.
;;;
;;; clash-for-windows-chinese (#17433)
;;;   AUR present, deps=4. Upstream DMCA'd Nov 2023, no legitimate source.
;;;
;;; beignet-git (#18416)
;;;   AUR present. Intel OpenCL for pre-Gen12, superseded by NEO. Archived.

;;; ── ARCH_SPECIFIC (5 packages) ────────────────────────────────────
;;; Arch-Linux-specific infrastructure (mkinitcpio, pacman tooling, glibc patches).
;;;
;;; mkinitcpio-systemd-root-password (#18371)
;;;   mkinitcpio hook for root password. Guix uses different initrd system.
;;;
;;; linux-keep-modules (#18490)
;;;   Arch mkinitcpio hook. Not applicable to Guix.
;;;
;;; python-pypi2pkgbuild (#17822)
;;;   Converts PyPI packages to Arch PKGBUILDs. Depends on pacman tools.
;;;
;;; glibc-eac (#24719)
;;;   Patched glibc for Easy Anti-Cheat. Arch-specific, non-portable.
;;;
;;; mkinitcpio-clevis-hook (#18342)
;;;   mkinitcpio hook for Clevis/LUKS. Arch initrd-specific.

;;; ── COMPLEX_DEPS (12 packages — gbm resolved above) ──────────────────
;;; Packages with deep dependency trees not feasible in Guix.
;;;
;;; virtualbox-svn (#18799)
;;;   53 deps. Massive build from SVN source. Requires DKMS kernel modules,
;;;   extensive toolchain (iasl, glslang, nasm, yasm). Not feasible as
;;;   channel package without major infrastructure work.
;;;
;;; python-home-assistant-frontend (#18556)
;;;   Pre-built JS blob (~110MB). Building from source requires 500+ npm
;;;   deps with Webpack/Polymer/LitElement toolchain. Not feasible.
;;;
;;; quartz-utils-git (#18430)
;;;   Crystal language CLI app. Crystal compiler not available in Guix.
;;;   Crystal has self-hosting bootstrap problem.
;;;
;;; rdt-client (#18561)
;;;   C# application requiring .NET 9 runtime. dotnet-runtime-9.0 not
;;;   available in Guix. Would need full .NET infrastructure first.
;;;
;;; mailnaggertray-git (#18592)
;;;   Rust email notification app. Depends on mailnagger package (not in
;;;   Guix, separate project that would also need packaging).
;;;
;;; python-gradio-pdf (#18463)
;;;   Depends on python-gradio which has massive dependency tree. Not
;;;   feasible without packaging entire Gradio ecosystem.
;;;
;;; webcord-vencord-git (#18852)
;;;   Electron Discord client. Complex npm/pnpm build with hundreds of
;;;   Node.js dependencies. Electron packaging not mature in Guix.
;;;
;;; frame-eth (#18612)
;;;   Node.js Ethereum wallet. Complex native module build with node-gyp,
;;;   nvm. Hundreds of npm dependencies.
;;;
;;; freetube-electron-git (#17925)
;;;   Electron YouTube client. Complex pnpm build requiring electron41
;;;   and hundreds of npm packages. Electron packaging infeasible.
;;;
;;; madness-interactive-reloaded (#18618)
;;;   C# game requiring .NET 9 SDK/runtime. Same .NET infrastructure
;;;   blocker as rdt-client.
;;;
;;; mobirise (#18357)
;;;   Proprietary closed-source website builder. Distributed as binary
;;;   only despite being in AUR. Not redistributable.
;;;
;;; borgwarehouse (#18840)
;;;   Next.js web application with 500+ npm dependencies. Guix
;;;   node-build-system cannot handle complex Next.js builds with
;;;   lockfile vendoring requirements.

;;; ── DISTRO_SPECIFIC (12 packages) ────────────────────────────────────
;;; Tools tied to Arch/Manjaro/OpenRC/runit package ecosystems.
;;;
;;; repacman (#18707): converts installed software to pacman packages.
;;; archwiki-offline (#18568): wrapper around arch-wiki-docs.
;;; findbrokenpkgs (#18930): broken library detector for pacman (libalpm).
;;; sbctl-initcpio-post-hook (#18720): mkinitcpio Secure Boot hook.
;;; pacpak-git (#17862): AUR+pacman wrapper. Depends on libalpm.
;;; chromium-extension-arch-search (#17897): Chromium ext for Arch Wiki.
;;; pamac-cli (#17940): pacman GUI/CLI wrapper. Depends on libalpm.
;;; fcitx5-lotus-openrc-git (#55324): OpenRC service files for fcitx5-lotus.
;;; fcitx5-lotus-runit-git (#55325): runit service files for fcitx5-lotus.
;;; pikaur-static (#18750): AUR helper, depends on pacman.
;;; pikaur-static-git (#18749): AUR helper (git), depends on pacman.
;;; auracle-git (#2160): AUR CLI tool, depends on libalpm.

;;; ── DKMS_KERNEL_MODULE (12 packages) ──────────────────────────────────
;;; Kernel modules requiring DKMS infrastructure not available in Guix.
;;;
;;; aquacomputer_d5next-hwmon-dkms (#18606): Aqua Computer sensor driver.
;;; amneziawg-dkms-git (#18642): AmneziaWG VPN kernel module.
;;; amneziawg-linux (#18452): AmneziaWG kernel patches.
;;; amneziawg-linux-hardened (#18382): AmneziaWG for hardened kernel.
;;; ideapad-laptop-tb-dkms (#18957): Lenovo IdeaPad keyboard backlight.
;;; ideapad-laptop-tb2024g6plus-dkms (#18895): Lenovo IdeaPad 2024 driver.
;;; libch343ser-git (#17880): WCH CH343 serial port DKMS driver.
;;; pfring-dkms (#18399): PF_RING high-speed packet capture.
;;; r8126-dkms (#18487): Realtek r8126 2.5GbE DKMS driver.
;;; nvidia-bl-dkms (#17755): NVIDIA backlight DKMS module.
;;; rtl88x2ce-dkms-git (#18362): Realtek RTL88x2CE WiFi DKMS.
;;; nvidia-open-tinygrad-dkms-git (#18617): NVIDIA open driver for tinygrad.

;;; ── HARDWARE_SPECIFIC (1 package) ────────────────────────────────────
;;;
;;; kamilsss655-uv-k5-firmware-custom-git (#17909)
;;;   Custom firmware for Quansheng UV-K5 radio. Requires arm-none-eabi
;;;   cross-compilation toolchain (gcc, binutils, newlib) not in Guix.
;;;   Newlib is completely absent from Guix. Would need packaging the
;;;   entire ARM bare-metal toolchain first.

;;; ── KERNEL_HEADERS (4 packages) ────────────────────────────────────
;;; Kernel-version-specific header packages.
;;;
;;; linux6.18.22-1-lts-bin (#37932): Arch prebuilt kernel binary.
;;;   Guix uses linux-libre, builds from source.
;;; zfs-linux-hardened-headers (#17921): ZFS for linux-hardened.
;;; zfs-linux-rt-headers (#17920): ZFS for linux-rt.
;;; zfs-linux-git-headers (#17919): ZFS for linux-git.
;;;   All ZFS header packages pin specific kernel variants that Guix
;;;   doesn't ship. CDDL license also creates kernel linking concerns.

;;; ── LEGACY_PYTHON2 (1 package) ────────────────────────────────────
;;;
;;; python2-gimp (#23210)
;;;   GIMP 2.10 Python 2 scripting. Python 2 EOL 2020.
;;;   GIMP 3.0+ in Guix uses Python 3. Migration path exists.

;;; ── MINGW_CROSS_COMPILATION (10 packages) ──────────────────────────
;;; MinGW-w64 cross-compilation packages targeting Windows.
;;;
;;; mingw-w64-cblas (#34115): CBLAS for MinGW cross-compilation.
;;; mingw-w64-lapack (#34113): LAPACK for MinGW.
;;; mingw-w64-soundtouch (#18330): SoundTouch for MinGW.
;;; mingw-w64-boost (#23783): Boost for MinGW.
;;; mingw-w64-cppwinrt (#43750): C++/WinRT for MinGW.
;;; mingw-w64-pcre2 (#26805): PCRE2 for MinGW.
;;; mingw-w64-spirv-tools (#42666): SPIRV-Tools for MinGW.
;;; dxvk-async-git (#18820): DXVK async (Wine/DirectX). MinGW cross-build.
;;; mingw-w64-postgresql (#24572): PostgreSQL for MinGW.
;;; mingw-w64-lame (#34112): LAME for MinGW.
;;;   All require MinGW-w64 cross-toolchain infrastructure. Guix has
;;;   limited MinGW cross-compilation support.

;;; ── MULTILIB_UNSUPPORTED (5 packages) ──────────────────────────────
;;; 32-bit (lib32) compatibility libraries.
;;;
;;; lib32-opencl-nvidia-390xx (#17502): 32-bit NVIDIA OpenCL (legacy).
;;; lib32-libglade (#45410): 32-bit libglade (GTK+2 era, deprecated).
;;; lib32-libxpm (#16491): 32-bit libxpm.
;;; lib32-sdl_sound (#22729): 32-bit SDL_sound.
;;; lib32-vkbasalt (#18688): 32-bit VkBasalt.
;;;   Guix doesn't support multilib 32-bit package variants.

;;; ── NON_DISTRIBUTABLE (5 packages) ────────────────────────────────
;;; Licenses prohibit redistribution.
;;;
;;; ttf-consolas-ligaturized (#20499): Microsoft proprietary font base.
;;; ut2004-gog (#18333): Requires GOG account/purchase. EULA restricts.
;;; unrealtournament4 (#18319): Epic Games proprietary EULA.
;;; factorio-space-age-experimental (#17440): Requires purchased license.
;;; prey (#18251): Binary-only game, no source available.

;;; ── PLATFORM_UNSUPPORTED (5 packages) ──────────────────────────────
;;;
;;; bakkesmod-steam (#17468): Windows DLL injection mod for Rocket League.
;;; android-platform-19 (#28671): Android SDK platform (Google proprietary).
;;; android-platform-21 (#23109): Android SDK platform (Google proprietary).
;;; futu-ftnn-wine (#18151): Chinese stock trading via Wine wrapper.
;;; eddiscovery (#18320): Elite Dangerous tool (.NET/Mono with msbuild/nuget).

;;; ── PROPRIETARY_BINARY (16 packages) ──────────────────────────────
;;; Closed-source proprietary software.
;;;
;;; matlab-jre-bundled (#19363): MATLAB runtime (MathWorks proprietary).
;;; sipgate-app-clinq (#18449): Sipgate VoIP app (proprietary).
;;; squareline-studio (#17812): SquareLine LVGL GUI designer (proprietary).
;;; upd72020x-fw-ng (#29404): Renesas USB firmware (proprietary binary).
;;; xairedit (#20522): X-AIR mixer editor (proprietary).
;;; simplicity-commander (#18419): Silicon Labs MCU tool (proprietary).
;;; brother-mfc-l2400dw (#17797): Brother printer driver (proprietary).
;;; knossu (#18461): Knossu game manager (proprietary).
;;; libfprint-2-tod1-broadcom-cv3plus (#17912): Broadcom fingerprint (proprietary).
;;; wyc (#18777): WhatsApp Yandex Chrome (proprietary).
;;; inkdrop (#17819): Inkdrop note-taking app (proprietary).
;;; soapysdrplay3-luarvique-git (#18141): SDRplay3 API (proprietary driver).
;;; anytxt-bin (#18295): AnyTXT file search (proprietary).
;;; pianoteq-stage (#18367): Pianoteq piano synth (proprietary).
;;; vmd (#18253): Visual Molecular Dynamics (proprietary academic).
;;; python-pylink-square (#21233): J-Link debug probe (SEGGER proprietary).

;;; ── SELINUX_SPECIFIC (2 packages) ──────────────────────────────────
;;; SELinux-patched versions of core packages.
;;;
;;; sudo-selinux (#18513): sudo with SELinux support. Requires libselinux,
;;;   libsemanage, libsepol (SELinux stack not fully in Guix).
;;; base-selinux (#18537): Arch base metapackage with SELinux.
;;;   Depends on sudo-selinux and other SELinux infrastructure.

;;; ── SOURCE_UNAVAILABLE (3 packages) ────────────────────────────────
;;; Source or distribution no longer available.
;;;
;;; linux6.18.20-1-lts-bin (#20997): Arch prebuilt kernel (obsolete version).
;;; linux6.18.20-1-lts-docs-bin (#20996): Arch kernel docs (obsolete).
;;; linux6.18.20-1-lts-headers-bin (#20995): Arch kernel headers (obsolete).
;;;   All are Arch-specific prebuilt binaries for an obsolete kernel version.
;;;   Guix builds kernels from source (linux-libre). Not applicable.
