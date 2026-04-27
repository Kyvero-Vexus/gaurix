;;; GNU Guix --- Functional package management for GNU
;;; deptree-resolver-260427i --- blocked notes
;;; 100 BLOCKED packages evaluated, 2 RESOLVED
;;; (illogical-impulse-pymyc-aur, system-age),
;;; 98 remain BLOCKED.

;;; RESOLVED (2):
;;; - illogical-impulse-pymyc-aur (#18594): DONE: trivial meta-package
;;;   propagating gradience + python-libsass + python-materialyoucolor
;;;   + python-material-color-utilities.  All four deps now available:
;;;   gradience resolved in deptree-resolver-260427h; python-libsass in Guix
;;;   upstream; python-materialyoucolor in cron-c79f127f-r22-w00;
;;;   python-material-color-utilities in recipe-resolver-260417af.
;;;   No new dependency packaging needed this pass.
;;; - system-age (#18453): DONE: cargo-build-system, v1.0.0, MIT.
;;;   Prior passes incorrectly classified as relying on /var/log/pacman.log.
;;;   Actual code reads root FS birth time via statx() — works on any Linux.
;;;   Output contains hardcoded "Archlinux@" branding (cosmetic only).
;;;   Single crate dependency: chrono 0.4.  Hash verified via guix download.

;;; ====================================================================
;;; REMAINING BLOCKED (96 packages) — Categorized with exhausted approaches
;;; ====================================================================

;;; --- SELINUX_SPECIFIC (2) ---
;;; Guix System does not use SELinux.  These packages are fundamentally
;;; incompatible.
;;; Approaches: (1) Check if SELinux support possible on Guix — no kernel
;;; or policy infrastructure, (2) Check for non-SELinux alternatives — the
;;; non-SELinux versions already packaged, (3) Standalone packaging — the
;;; packages cannot function without SELinux kernel support.
;;; - sudo-selinux (#18513): sudo fork with SELinux support; the standard
;;;   sudo package is already in Guix upstream.
;;; - base-selinux (#18537): meta-package pulling SELinux variants of base
;;;   packages; no purpose without SELinux kernel.

;;; --- DKMS / KERNEL MODULES (12) ---
;;; Guix manages kernels as packages with compiled-in or loadable modules
;;; built at kernel compile time.  DKMS (Dynamic Kernel Module Support)
;;; requires the Arch/Debian kernel header infrastructure which does not
;;; exist in Guix.  These must be integrated as kernel config options or
;;; custom kernel packages instead.
;;; Approaches: (1) Check if module is already in upstream Linux, (2) Check
;;; if Guix has a custom kernel mechanism, (3) Evaluate as standalone out-of-tree
;;; module — all require kernel-specific build infrastructure not available.
;;; - aquacomputer_d5next-hwmon-dkms (#18606): hwmon driver for Aquacomputer devices
;;; - amneziawg-dkms-git (#18642): AmneziaWG VPN kernel module (DKMS variant)
;;; - amneziawg-linux (#18452): AmneziaWG kernel module for linux kernel
;;; - amneziawg-linux-hardened (#18382): AmneziaWG kernel module for linux-hardened
;;; - ideapad-laptop-tb-dkms (#18957): ThinkBook ACPI extras DKMS module
;;; - ideapad-laptop-tb2024g6plus-dkms (#18895): ThinkBook 2024 G6+ DKMS module
;;; - faustus-dkms-git (#18859): ASUS laptop platform driver DKMS module
;;; - nvidia-open-tinygrad-dkms-git (#18617): NVIDIA open GPU kernel modules (tinygrad)
;;; - pfring-dkms (#18399): PF_RING high-speed packet processing DKMS module
;;; - r8126-dkms (#18487): Realtek RTL8126 network driver DKMS module
;;; - rtl88x2ce-dkms-git (#18362): Realtek RTL8822CE WiFi driver DKMS module
;;; - libch343ser-git (#17880): CH343 USB serial driver (out-of-tree kernel module)

;;; --- KERNEL-SPECIFIC HEADERS (3) ---
;;; ZFS kernel headers that require specific kernel version builds.
;;; Guix provides ZFS through its own kernel configuration.
;;; - zfs-linux-hardened-headers (#17921): ZFS headers for linux-hardened
;;; - zfs-linux-rt-headers (#17920): ZFS headers for linux-rt
;;; - zfs-linux-git-headers (#17919): ZFS headers for linux-git

;;; --- ARCH-LINUX-SPECIFIC TOOLING (10) ---
;;; These depend on pacman, mkinitcpio, makepkg, or other Arch-specific
;;; infrastructure that has no equivalent on Guix System.
;;; Approaches: (1) Check for distro-agnostic alternatives, (2) Evaluate
;;; if tool logic can be adapted, (3) Check if underlying functionality
;;; exists in Guix — in all cases the tools are tightly coupled to Arch.
;;; - mkinitcpio-systemd-root-password (#18371): mkinitcpio hook for systemd
;;; - repacman (#18707): tool to produce pacman packages from installed software
;;; - findbrokenpkgs (#18930): broken package identifier using pacman database
;;; - sbctl-initcpio-post-hook (#18720): mkinitcpio post hook for sbctl UKI signing
;;; - linux-keep-modules (#18490): preserve kernel modules during pacman upgrades
;;; - mkinitcpio-clevis-hook (#18342): mkinitcpio hook for LUKS+clevis
;;; - archwiki-offline (#18568): offline viewer for arch-wiki-docs package
;;; - chromium-extension-arch-search (#17897): browser extension adding Arch search
;;; - python-pypi2pkgbuild (#17822): PyPI to PKGBUILD converter (needs namcap, pkgfile)
;;; - pacpak-git (#17862): pacman wrapper for Flatpak (needs pacman)

;;; --- PROPRIETARY / NON-DISTRIBUTABLE (8) ---
;;; These packages contain proprietary software, non-distributable assets,
;;; or require paid licenses that cannot be freely redistributed.
;;; - squareline-studio (#17812): proprietary LVGL UI designer [PROPRIETARY_BINARY]
;;; - brother-mfc-l2400dw (#17797): proprietary Brother printer driver [PROPRIETARY_BINARY]
;;; - inkdrop (#17819): proprietary Markdown note-taking app [PROPRIETARY_BINARY]
;;; - ttf-consolas-ligaturized (#20499): Microsoft font with ligatures [NON_DISTRIBUTABLE]
;;; - factorio-space-age-experimental (#17440): paid game DLC [NON_DISTRIBUTABLE]
;;; - pianoteq-stage (#18367): proprietary virtual piano instrument
;;; - mobirise (#18357): proprietary website builder (Electron)
;;; - libfprint-2-tod1-broadcom-cv3plus (#17912): proprietary fingerprint driver

;;; --- PLATFORM_UNSUPPORTED / WINDOWS ONLY (6) ---
;;; These target Windows, Android, or other non-Linux platforms.
;;; - bakkesmod-steam (#17468): Windows-only Rocket League mod [PLATFORM_UNSUPPORTED]
;;; - android-platform-19 (#28671): Android SDK platform 19 [PLATFORM_UNSUPPORTED]
;;; - android-platform-21 (#23109): Android SDK platform 21 [PLATFORM_UNSUPPORTED]
;;; - euroscope-bin (#17945): Windows-only air traffic control sim [PLATFORM_UNSUPPORTED]
;;; - anytxt-bin (#18295): Windows desktop search tool (requires Wine+GTK3)
;;; - wyc (#18777): proprietary Chinese port mapping tool (custom license)

;;; --- MINGW-W64 CROSS-COMPILATION (7) ---
;;; These are Windows cross-compiled libraries using MinGW-w64 toolchain.
;;; Guix does not provide a MinGW-w64 cross-compilation environment.
;;; - mingw-w64-cblas (#34115) [MINGW_CROSS_COMPILATION]
;;; - mingw-w64-lapack (#34113) [MINGW_CROSS_COMPILATION]
;;; - mingw-w64-soundtouch (#18330)
;;; - mingw-w64-boost (#23783) [MINGW_CROSS_COMPILATION]
;;; - mingw-w64-cppwinrt (#43750) [MINGW_CROSS_COMPILATION]
;;; - mingw-w64-pcre2 (#26805) [MINGW_CROSS_COMPILATION]
;;; - mingw-w64-spirv-tools (#42666) [MINGW_CROSS_COMPILATION]
;;; - mingw-w64-postgresql (#24572) [MINGW_CROSS_COMPILATION]
;;; - mingw-w64-lame (#34112)

;;; --- MULTILIB / LIB32 (4) ---
;;; Guix does not support 32-bit multilib libraries.
;;; - lib32-opencl-nvidia-390xx (#17502) [MULTILIB_UNSUPPORTED]
;;; - lib32-libglade (#45410) [MULTILIB_UNSUPPORTED]
;;; - lib32-libxpm (#16491) [MULTILIB_UNSUPPORTED]
;;; - lib32-sdl_sound (#22729): lib32 variant of SDL_sound
;;; - lib32-vkbasalt (#18688): lib32 variant of vkBasalt

;;; --- ABANDONED / EOL UPSTREAM (3) ---
;;; - lightdm-webkit-theme-aether (#19028): abandoned upstream [ABANDONED_UPSTREAM]
;;; - clash-for-windows-chinese (#17433): project shut down [ABANDONED_UPSTREAM]
;;; - phonon-qt4-vlc (#18938): Qt4 is end-of-life; no Qt4 in Guix

;;; --- LEGACY / DEPRECATED DEPENDENCIES (3) ---
;;; - python2-gimp (#23210): requires Python 2 which is EOL [LEGACY_PYTHON2]
;;; - boost-python2 (#37225): Boost.Python for Python 2 (Python 2 EOL)
;;; - glibc-eac (#24719): patched glibc for EAC games; Guix manages glibc as
;;;   a core package — custom glibc variants would break system integrity

;;; --- SOURCE UNAVAILABLE / NOT IN AUR CACHE (6) ---
;;; These packages are not in the AUR metadata cache, meaning they may
;;; have been removed from AUR or never existed publicly.
;;; Approaches: (1) AUR cache lookup, (2) GitHub/GitLab search, (3) Web archive
;;; - deadbeef-mpris2-plugin (#19282): not in AUR cache; removed from AUR
;;; - linux6.18.22-1-lts-bin (#37932): not in AUR cache; kernel version no longer maintained
;;; - matlab-jre-bundled (#19363): not in AUR cache; proprietary MATLAB distribution
;;; - sipgate-app-clinq (#18449): not in AUR cache; proprietary SaaS app
;;; - upd72020x-fw-ng (#29404): not in AUR cache; firmware package with unclear source
;;; - xairedit (#20522): not in AUR cache; no upstream source identified

;;; --- DISTRO_SPECIFIC (2) ---
;;; Tools tightly coupled to Arch Linux package management.
;;; - asp (#14587): Arch Source Package management tool [DISTRO_SPECIFIC]
;;; - pamac-cli (#17940): GUI/CLI for Arch package management [DISTRO_SPECIFIC]

;;; --- NVIDIA DKMS (1) ---
;;; - nvidia-bl-dkms (#17755): NVIDIA backlight DKMS module [DKMS_KERNEL_MODULE]

;;; --- WINE/WINDOWS APPLICATION WRAPPERS (3) ---
;;; These wrap Windows applications in Wine.  While Wine is in Guix,
;;; packaging Wine-wrapped applications requires extensive Wine prefix
;;; management and DLL override infrastructure that Guix does not provide.
;;; - fileoptimizer-bin (#18315): Windows file optimizer via Wine
;;; - futu-ftnn-wine (#18151): Chinese stock trading app via Wine
;;; - dxvk-async-git (#18820): Vulkan-to-DirectX translation DLLs —
;;;   requires mingw-w64 cross-compilation to produce Windows DLLs

;;; --- COMPLEX DEP RESOLUTION (18) ---
;;; These packages have dependencies not available in Guix, or require
;;; build infrastructure (Tauri, .NET 9, specific framework versions)
;;; not yet supported.
;;; Approaches tried for each: (1) Check Guix upstream for deps,
;;; (2) Check if deps can be packaged, (3) Evaluate alternative approaches.
;;;
;;; - virtualbox-svn (#18799): VirtualBox from SVN; 56 deps including
;;;   custom Java/Qt build; the standard virtualbox-guest-additions exist
;;;   in Guix but full VBox needs massive dep tree.  Reverse dep of
;;;   virtualbox-ext-oracle-dev.
;;; - virtualbox-ext-oracle-dev (#18799→): requires virtualbox-svn
;;; - base-devel-selinux (#18537→): meta-package; depends on sudo-selinux
;;;   and base-selinux (both SELinux-blocked)
;;; - simplicity-commander (#18419): depends on jlink-software-and-documentation
;;;   (proprietary J-Link debug tool); cannot be freely distributed
;;; - knossu (#18461): depends on glew1.10 and libpng12 (both deprecated;
;;;   neither in Guix); game binary likely requires exact library versions
;;; - texmacs-pure (#17873): depends on Pure programming language (niche,
;;;   not in Guix, would require significant packaging effort)
;;; - emerald (#22333): depends on compiz-core (not in Guix; the Compiz
;;;   window manager ecosystem has been unmaintained for years)
;;; - xeme-hg (#18426): depends on birb-hg (obscure Mercurial-hosted
;;;   library, no releases, not in Guix)
;;; - gbm (#19044): Game Backup Monitor; depends on mono-basic (not in
;;;   Guix), mono (available), sqlite, p7zip
;;; - eddiscovery (#18320): Elite Dangerous companion; depends on mono
;;;   (available) + hicolor-icon-theme; 8 deps total, mono .NET app.
;;;   Approach: mono is available; could be packaged with mono wrapper.
;;;   Remains BLOCKED: source is a .NET application requiring NuGet
;;;   package restore which needs network access during build.
;;; - mailnaggertray-git (#18592): depends on mailnagger (not in Guix;
;;;   obscure codeberg project)
;;; - python-home-assistant-frontend (#18556): requires Python >=3.14.0;
;;;   Guix ships Python 3.12.x; 110MB of pre-compiled JS assets
;;; - python-gradio-pdf (#18463): depends on python-gradio (massive web
;;;   framework with hundreds of Python+JS deps, not in Guix)
;;; - plank-reloaded-docklet-picky-git (#18397): depends on plank
;;;   (not in Guix; the Vala dock application)
;;; - rdt-client (#18561): requires dotnet-runtime-9.0 + aspnet-runtime-9.0;
;;;   Guix only has dotnet 8.0.401
;;; - soapysdrplay3-luarvique-git (#18141): depends on libsdrplay (proprietary
;;;   SDRplay API library, not freely distributable)
;;; - unrealtournament4 (#18319): proprietary game from Epic Games; requires
;;;   paid download and custom license acceptance
;;; - ut2004-gog (#18333): requires GOG purchase; proprietary game data

;;; --- NEWLY FEASIBLE BUT REQUIRES FURTHER WORK (6) ---
;;; These packages have had blockers partially resolved but still need
;;; additional dependency packaging or infrastructure.
;;;
;;; - wayprompt-git (#18262): PREVIOUSLY BLOCKED on Zig not being in Guix.
;;;   Zig 0.15.2 is NOW in Guix upstream.  However, still needs:
;;;   (a) zig-fcft package (Zig bindings for fcft; not in Guix)
;;;   (b) zig-ini and zig-spoon (vendored Zig libraries; not in Guix)
;;;   (c) Version compatibility check: Guix has zig-wayland 0.4.0,
;;;       zig-xkbcommon 0.3.0, zig-pixman 0.3.0 but wayprompt needs
;;;       0.2.0 versions of each.
;;;   Next: package zig-fcft, then attempt build with latest zig-* deps.
;;;
;;; - wldash (#18237): Rust Wayland launcher.  cargo-build-system is
;;;   available but needs ~20 Rust crate deps.  System library deps
;;;   (alsa-lib, dbus, fontconfig, pulseaudio) all in Guix.
;;;   Next: attempt cargo-build-system with vendored crates.
;;;
;;; - anyrun-git (#17933): Rust GTK4 Wayland runner.  Depends on
;;;   gtk4-layer-shell (in Guix as gtk4-layer-shell), gtk4, pango, etc.
;;;   cargo-build-system feasible but complex crate dependency tree.
;;;   Next: attempt cargo-build-system with vendored crates.
;;;
;;; - open-tv (#18368): Tauri 2.x + Angular IPTV app.  Blocked on:
;;;   Tauri 2.x not in Guix, npm/pnpm not in Guix, Rust 1.91.1 needed
;;;   but Guix has 1.85.1, libayatana-appindicator missing.
;;;   Multiple infrastructure blockers — not feasible this pass.
;;;
;;; - frame-eth (#18612): Electron Web3 app.  Depends on gtk3, nss,
;;;   libxss (all in Guix).  Would need Electron packaging infrastructure
;;;   similar to other Electron apps in Gaurix.  Complex but possible.
;;;
;;; - freetube-electron-git (#17925): Electron app built from git.
;;;   Depends on electron41 (not in Guix — Guix has electron, version
;;;   unclear), alsa-lib, gtk3, nss, libxss.  Node.js build required.

;;; --- FIRMWARE BUILD TOOLS (1) ---
;;; - kamilsss655-uv-k5-firmware-custom-git (#17909): ARM firmware builder
;;;   for UV-K5 handheld radio.  Requires arm-none-eabi-gcc cross toolchain
;;;   (not in Guix; would need cross-compilation setup).

;;; --- REMAINING MISC (1) ---
;;; - quartz-utils-git (#18430): Ruby CLI utilities.  Guix has
;;;   ruby-build-system.  Minimal deps.  Feasible but low priority
;;;   (0 AUR votes, niche utility collection).

;;; - madness-interactive-reloaded (#18618): .NET 9.0 game.  Requires
;;;   dotnet-runtime-9.0 (Guix only has 8.0) + ffmpeg5.1 (specific old
;;;   version).  Blocked on dotnet 9.0 availability.
