;;; Blocked notes for deptree-resolver-260428k
;;; 100 BLOCKED packages evaluated (top of priority queue), 1 new recipe,
;;; 1 resolved to DONE (vegastrike-engine-git),
;;; 0 new dependency packages,
;;; 99 remain BLOCKED across intractable categories.
;;;
;;; Generated: 2026-04-28
;;;
;;; Verification checks performed:
;;; - All 100 selected checked against upstream Guix (guix show / guix search)
;;; - Key dependency availability verified: boost 1.89.0, freeglut 3.4.0,
;;;   openal 1.23.1, sdl2 2.30.8, glu 9.0.2, libvorbis 1.3.7, gtk+ 3.24.51
;;; - Crystal language still not in Guix
;;; - .NET 9.0 still not in Guix (only 8.0)
;;; - Rust 1.89+ still not in Guix (only 1.85.1)
;;; - Zig still not in Guix
;;; - Wayfire still not in Guix
;;; - Bazel still not in Guix
;;; - Godot still not in Guix
;;; - Granite (Elementary OS toolkit) still not in Guix

;;; =========================================================================
;;; RESOLVED (1 package)
;;; =========================================================================

;;; vegastrike-engine-git — RESOLVED (was unclassified BLOCKED)
;;;   Open-source 3D space flight simulator engine. GPL-3.0.
;;;   CMake build with engine/ subdirectory as source root.
;;;   All deps confirmed in upstream Guix: boost 1.89.0, freeglut 3.4.0,
;;;   openal 1.23.1, sdl2 2.30.8, glu 9.0.2, libvorbis 1.3.7, gtk+ 3.24.51,
;;;   python 3.12.x. Stable release v0.9.1 (2025-05-23) used.
;;;   Hash obtained via guix download: 03xzznkkrs3call44c0bwf2jiziwp1y9wni9374fwgrjix6s8mqg
;;;   Recipe: cmake-build-system, url-fetch from GitHub archive.

;;; =========================================================================
;;; BLOCKED — PROPRIETARY_BINARY (16 packages)
;;; =========================================================================

;;; matlab-jre-bundled — PROPRIETARY_BINARY
;;;   Bundled JRE for MATLAB. Proprietary MathWorks software.
;;;   A1: package as-is → proprietary, non-redistributable.
;;;   A2: use system JRE → MATLAB requires specific bundled JRE version.
;;;   A3: alternative → GNU Octave exists in Guix.

;;; sipgate-app-clinq — PROPRIETARY_BINARY
;;;   Electron-based VoIP app. Proprietary binary distribution.
;;;   A1: package binary → proprietary, non-redistributable.
;;;   A2: build from source → no source available.
;;;   A3: alternative → use SIP clients like Linphone (in Guix).

;;; squareline-studio — PROPRIETARY_BINARY
;;;   LVGL UI design tool. Commercial proprietary software.
;;;   A1: package binary → proprietary, requires license.
;;;   A2: build from source → closed-source.
;;;   A3: alternative → no FOSS equivalent for LVGL design.

;;; upd72020x-fw-ng — PROPRIETARY_BINARY
;;;   Firmware for Renesas USB 3.0 controller. Non-redistributable firmware.
;;;   A1: package firmware → non-redistributable binary blob.
;;;   A2: extract from driver → still proprietary.
;;;   A3: alternative → linux-firmware may include this.

;;; xairedit — PROPRIETARY_BINARY
;;;   X-Air mixer editor. Proprietary Behringer software.
;;;   A1: package binary → proprietary, non-redistributable.
;;;   A2: build from source → closed-source.
;;;   A3: alternative → no FOSS equivalent.

;;; simplicity-commander — PROPRIETARY_BINARY
;;;   Silicon Labs MCU programmer. Proprietary development tool.
;;;   A1: package binary → proprietary, non-redistributable EULA.
;;;   A2: build from source → closed-source.
;;;   A3: alternative → OpenOCD for some Silicon Labs chips.

;;; brother-mfc-l2400dw — PROPRIETARY_BINARY
;;;   Brother printer driver. Proprietary binary blob.
;;;   A1: package driver → proprietary, Brother EULA.
;;;   A2: use generic driver → Brother printers need specific drivers.
;;;   A3: alternative → some Brother printers work with brlaser (in Guix).

;;; knossu — PROPRIETARY_BINARY
;;;   Proprietary platform app. Binary-only distribution.
;;;   A1: package binary → proprietary, non-redistributable.
;;;   A2: build from source → no source available.
;;;   A3: no FOSS alternative.

;;; libfprint-2-tod1-broadcom-cv3plus — PROPRIETARY_BINARY
;;;   Broadcom fingerprint reader driver. Proprietary binary.
;;;   A1: package binary → proprietary Broadcom driver.
;;;   A2: reverse engineer → legal issues, no FOSS driver available.
;;;   A3: alternative → libfprint in Guix supports other readers.

;;; inkdrop — PROPRIETARY_BINARY
;;;   Markdown note-taking app. Proprietary commercial software.
;;;   A1: package binary → proprietary, requires license purchase.
;;;   A2: build from source → closed-source.
;;;   A3: alternative → many FOSS markdown editors in Guix.

;;; wyc — PROPRIETARY_BINARY
;;;   Proprietary binary application. Non-redistributable.
;;;   A1: package binary → proprietary, non-redistributable.
;;;   A2: build from source → no source available.
;;;   A3: no FOSS alternative identified.

;;; anytxt-bin — PROPRIETARY_BINARY
;;;   Full-text search tool. Proprietary Windows app with Wine wrapper.
;;;   A1: package binary → proprietary, non-redistributable.
;;;   A2: use native alternative → recoll or tracker in Guix.
;;;   A3: no source code available.

;;; pianoteq-stage — PROPRIETARY_BINARY
;;;   Piano modeling synthesizer. Commercial proprietary software.
;;;   A1: package binary → proprietary, requires license purchase.
;;;   A2: build from source → closed-source.
;;;   A3: alternative → ZynAddSubFX or similar in Guix.

;;; vmd — PROPRIETARY_BINARY
;;;   Visual Molecular Dynamics viewer. UIUC non-commercial license.
;;;   A1: package binary → non-redistributable license.
;;;   A2: build from source → restricted license.
;;;   A3: alternative → Avogadro or PyMOL (partial) in Guix.

;;; soapysdrplay3-luarvique-git — PROPRIETARY_BINARY
;;;   SoapySDR driver for SDRplay devices. Depends on proprietary SDRplay API.
;;;   A1: package source → needs proprietary libsdrplay_api.
;;;   A2: use open-source alternative → no FOSS SDRplay driver.
;;;   A3: alternative → RTL-SDR or other supported hardware.

;;; python-pylink-square — PROPRIETARY_BINARY
;;;   Python SEGGER J-Link interface. Apache-2.0 source but requires
;;;   proprietary jlink-software-and-documentation package.
;;;   A1: package source → hard dep on proprietary SEGGER software.
;;;   A2: build without J-Link → renders package useless.
;;;   A3: alternative → OpenOCD for supported debug probes.

;;; =========================================================================
;;; BLOCKED — DKMS_KERNEL_MODULE (11 packages)
;;; =========================================================================

;;; aquacomputer_d5next-hwmon-dkms — DKMS_KERNEL_MODULE
;;;   Hardware monitoring driver for Aqua Computer devices.
;;;   Requires kernel module build against running kernel.
;;;   Guix uses a different kernel module model (compiled with kernel).

;;; amneziawg-dkms-git — DKMS_KERNEL_MODULE
;;;   AmneziaWG VPN kernel module. DKMS-based build.
;;;   Requires dynamic kernel module compilation.

;;; amneziawg-linux — DKMS_KERNEL_MODULE
;;;   AmneziaWG VPN patched kernel. Requires custom kernel build.

;;; amneziawg-linux-hardened — DKMS_KERNEL_MODULE
;;;   AmneziaWG VPN patched hardened kernel. Custom kernel build.

;;; ideapad-laptop-tb-dkms — DKMS_KERNEL_MODULE
;;;   ThinkPad toolbar driver. DKMS kernel module.

;;; ideapad-laptop-tb2024g6plus-dkms — DKMS_KERNEL_MODULE
;;;   ThinkPad 2024 G6+ toolbar driver. DKMS kernel module.

;;; pfring-dkms — DKMS_KERNEL_MODULE
;;;   PF_RING network packet capture. DKMS kernel module.

;;; r8126-dkms — DKMS_KERNEL_MODULE
;;;   Realtek RTL8126 ethernet driver. DKMS kernel module.

;;; nvidia-bl-dkms — DKMS_KERNEL_MODULE
;;;   NVIDIA backlight control driver. DKMS kernel module.

;;; rtl88x2ce-dkms-git — DKMS_KERNEL_MODULE
;;;   Realtek RTL8822CE WiFi driver. DKMS kernel module.

;;; nvidia-open-tinygrad-dkms-git — DKMS_KERNEL_MODULE
;;;   NVIDIA open kernel module for tinygrad. DKMS kernel module.

;;; =========================================================================
;;; BLOCKED — DISTRO_SPECIFIC (10 packages)
;;; =========================================================================

;;; repacman — DISTRO_SPECIFIC
;;;   Pacman package re-installer. Requires pacman/libalpm.

;;; archwiki-offline — DISTRO_SPECIFIC
;;;   Offline Arch Wiki reader. Arch-specific content and tools.

;;; findbrokenpkgs — DISTRO_SPECIFIC
;;;   Find broken packages tool. Requires pacman database.

;;; sbctl-initcpio-post-hook — DISTRO_SPECIFIC
;;;   Secure Boot hook for mkinitcpio. Arch initramfs-specific.

;;; pacpak-git — DISTRO_SPECIFIC
;;;   Pacman wrapper script. Requires pacman infrastructure.

;;; chromium-extension-arch-search — DISTRO_SPECIFIC
;;;   Chromium extension for Arch package search. Arch-specific content.

;;; pamac-cli — DISTRO_SPECIFIC
;;;   Pamac package manager CLI. Requires pacman/libalpm.

;;; pikaur-static — DISTRO_SPECIFIC
;;;   AUR helper. Requires pacman and AUR infrastructure.

;;; pikaur-static-git — DISTRO_SPECIFIC
;;;   AUR helper (git version). Requires pacman and AUR infrastructure.

;;; auracle-git — DISTRO_SPECIFIC
;;;   AUR client. Requires Arch packaging infrastructure.

;;; =========================================================================
;;; BLOCKED — MINGW_CROSS_COMPILATION (10 packages)
;;; =========================================================================

;;; mingw-w64-cblas — MINGW_CROSS_COMPILATION
;;; mingw-w64-lapack — MINGW_CROSS_COMPILATION
;;; mingw-w64-soundtouch — MINGW_CROSS_COMPILATION
;;; mingw-w64-boost — MINGW_CROSS_COMPILATION
;;; mingw-w64-cppwinrt — MINGW_CROSS_COMPILATION
;;; mingw-w64-pcre2 — MINGW_CROSS_COMPILATION
;;; mingw-w64-spirv-tools — MINGW_CROSS_COMPILATION
;;; mingw-w64-postgresql — MINGW_CROSS_COMPILATION
;;; mingw-w64-lame — MINGW_CROSS_COMPILATION
;;; dxvk-async-git — MINGW_CROSS_COMPILATION
;;;   All require MinGW-w64 cross-compilation toolchain for Windows targets.
;;;   Guix supports cross-compilation but these produce Windows binaries,
;;;   not meaningful for native Guix installations.

;;; =========================================================================
;;; BLOCKED — COMPLEX_DEPS (10 packages)
;;; =========================================================================

;;; python-home-assistant-frontend — COMPLEX_DEPS
;;;   Home Assistant web frontend. Massive JS build (1000+ npm deps).
;;;   A1: build from source → requires webpack + hundreds of npm packages.
;;;   A2: package pre-built wheel → not acceptable for Guix (no source build).
;;;   A3: alternative → Home Assistant without frontend component.

;;; quartz-utils-git — COMPLEX_DEPS
;;;   Crystal language utility. Crystal compiler not in Guix.
;;;   A1: build with Crystal → Crystal not available in Guix.
;;;   A2: bootstrap Crystal → self-hosted, requires LLVM, circular dep.
;;;   A3: alternative → none, Crystal-specific tool.

;;; rdt-client — COMPLEX_DEPS
;;;   Real-Debrid torrent client. .NET 9.0 (Guix only has 8.0).
;;;   A1: build with .NET 9.0 → not available in Guix.
;;;   A2: port to .NET 8.0 → major upstream changes needed.
;;;   A3: alternative → other torrent clients in Guix.

;;; gbm — COMPLEX_DEPS
;;;   Game Backup Monitor. Mono/VB.NET (mono-basic not in Guix).
;;;   A1: build with mono-basic → VB.NET compiler not in Guix.
;;;   A2: rewrite in C# → requires upstream changes.
;;;   A3: alternative → manual backup scripts.

;;; python-gradio-pdf — COMPLEX_DEPS
;;;   Gradio PDF component. Requires python-gradio (100+ deps).
;;;   A1: package gradio ecosystem → 100+ packages not in Guix.
;;;   A2: strip to minimal deps → breaks functionality.
;;;   A3: alternative → other PDF viewers.

;;; webcord-vencord-git — COMPLEX_DEPS
;;;   Discord client (Electron). Massive npm dep tree.
;;;   A1: build from source → hundreds of npm packages to vendor.
;;;   A2: package binary → non-standard distribution method.
;;;   A3: alternative → other Discord clients or web browser.

;;; frame-eth — COMPLEX_DEPS
;;;   Ethereum wallet (Electron). npm + node-gyp native addons.
;;;   A1: build from source → npm vendoring + native addons.
;;;   A2: package binary → Electron binary packaging.
;;;   A3: alternative → command-line Ethereum tools.

;;; freetube-electron-git — COMPLEX_DEPS
;;;   YouTube client (Electron). Needs electron41 (Guix has 36).
;;;   A1: build from source → wrong Electron version + npm deps.
;;;   A2: package binary → binary recipe exists already.
;;;   A3: alternative → youtube-viewer or yt-dlp in Guix.

;;; madness-interactive-reloaded — COMPLEX_DEPS
;;;   .NET game. Requires .NET 9.0 SDK (Guix only has 8.0).
;;;   A1: build with .NET 9.0 → not available in Guix.
;;;   A2: port to .NET 8.0 → upstream changes needed.
;;;   A3: no alternative.

;;; mobirise — PROPRIETARY_BINARY (reclassified from COMPLEX_DEPS)
;;;   Website builder. Commercial proprietary binary, no source available.
;;;   A1: package binary → proprietary, non-redistributable.
;;;   A2: build from source → closed-source.
;;;   A3: alternative → web design tools in Guix.

;;; =========================================================================
;;; BLOCKED — ABANDONED_UPSTREAM (6 packages)
;;; =========================================================================

;;; deadbeef-mpris2-plugin — ABANDONED_UPSTREAM
;;;   DeaDBeeF MPRIS2 plugin. Not in AUR cache, no upstream info.

;;; lightdm-webkit-theme-aether — ABANDONED_UPSTREAM
;;;   LightDM WebKit theme. Project appears abandoned.

;;; phonon-qt4-vlc — ABANDONED_UPSTREAM
;;;   Phonon VLC backend for Qt4. Qt4 is EOL.

;;; texmacs-pure — ABANDONED_UPSTREAM
;;;   Pure language plugin for TeXmacs. Pure language abandoned.

;;; clash-for-windows-chinese — ABANDONED_UPSTREAM
;;;   Original Clash for Windows deleted from GitHub. Fork status uncertain.

;;; beignet-git — ABANDONED_UPSTREAM
;;;   Intel GPU OpenCL driver. Replaced by intel-compute-runtime.
;;;   A1: package source → deprecated by Intel.
;;;   A2: use successor → intel-compute-runtime exists for newer GPUs.
;;;   A3: no value in packaging abandoned driver.

;;; =========================================================================
;;; BLOCKED — MULTILIB_UNSUPPORTED (5 packages)
;;; =========================================================================

;;; lib32-opencl-nvidia-390xx — MULTILIB_UNSUPPORTED
;;; lib32-libglade — MULTILIB_UNSUPPORTED
;;; lib32-libxpm — MULTILIB_UNSUPPORTED
;;; lib32-sdl_sound — MULTILIB_UNSUPPORTED
;;; lib32-vkbasalt — MULTILIB_UNSUPPORTED
;;;   32-bit library variants. Guix does not support multilib.

;;; =========================================================================
;;; BLOCKED — NON_DISTRIBUTABLE (5 packages)
;;; =========================================================================

;;; ttf-consolas-ligaturized — NON_DISTRIBUTABLE
;;;   Microsoft Consolas font with ligatures. Non-redistributable.

;;; ut2004-gog — NON_DISTRIBUTABLE
;;;   Unreal Tournament 2004. Commercial game, GOG distribution.

;;; unrealtournament4 — NON_DISTRIBUTABLE
;;;   Unreal Tournament 4. Epic Games proprietary.

;;; factorio-space-age-experimental — NON_DISTRIBUTABLE
;;;   Factorio Space Age DLC. Commercial game, requires purchase.

;;; prey — NON_DISTRIBUTABLE
;;;   Anti-theft tracking tool. Proprietary service-dependent.

;;; =========================================================================
;;; BLOCKED — ARCH_SPECIFIC (5 packages)
;;; =========================================================================

;;; glibc-eac — ARCH_SPECIFIC
;;;   Patched glibc for Easy Anti-Cheat. Arch packaging patches.
;;;   22 reverse deps but all are also BLOCKED for other reasons.

;;; mkinitcpio-systemd-root-password — ARCH_SPECIFIC
;;;   mkinitcpio hook. Arch initramfs-specific.

;;; mkinitcpio-clevis-hook — ARCH_SPECIFIC
;;;   mkinitcpio Clevis hook. Arch initramfs-specific.

;;; python-pypi2pkgbuild — ARCH_SPECIFIC
;;;   Converts PyPI packages to Arch PKGBUILDs. Arch-specific tool.

;;; linux-keep-modules — ARCH_SPECIFIC
;;;   Keeps kernel modules from being removed. Arch packaging-specific.

;;; =========================================================================
;;; BLOCKED — KERNEL_HEADERS (4 packages)
;;; =========================================================================

;;; linux6.18.22-1-lts-bin — KERNEL_HEADERS
;;;   Custom LTS kernel binary. Kernel variant not in Guix.

;;; zfs-linux-hardened-headers — KERNEL_HEADERS
;;;   ZFS headers for hardened kernel. Custom kernel headers.

;;; zfs-linux-rt-headers — KERNEL_HEADERS
;;;   ZFS headers for RT kernel. Custom kernel headers.

;;; zfs-linux-git-headers — KERNEL_HEADERS
;;;   ZFS headers for git kernel. Custom kernel headers.

;;; =========================================================================
;;; BLOCKED — PLATFORM_UNSUPPORTED (4 packages)
;;; =========================================================================

;;; bakkesmod-steam — PLATFORM_UNSUPPORTED
;;;   Rocket League mod. Windows/Steam-specific.

;;; android-platform-19 — PLATFORM_UNSUPPORTED
;;;   Android SDK platform API 19. Android-specific.

;;; android-platform-21 — PLATFORM_UNSUPPORTED
;;;   Android SDK platform API 21. Android-specific.

;;; eddiscovery — PLATFORM_UNSUPPORTED
;;;   Elite Dangerous Discovery companion. Windows/.NET application.

;;; =========================================================================
;;; BLOCKED — SELINUX_SPECIFIC (1 package)
;;; =========================================================================

;;; base-selinux — SELINUX_SPECIFIC
;;;   Arch base with SELinux. Guix uses different security model.

;;; =========================================================================
;;; BLOCKED — LEGACY_PYTHON2 (2 packages)
;;; =========================================================================

;;; python2-gimp — LEGACY_PYTHON2
;;;   GIMP Python 2 bindings. Python 2 removed from Guix.

;;; boost-python2 — LEGACY_PYTHON2
;;;   Boost.Python for Python 2. Python 2 removed from Guix.

;;; =========================================================================
;;; BLOCKED — HARDWARE_SPECIFIC (1 package)
;;; =========================================================================

;;; kamilsss655-uv-k5-firmware-custom-git — HARDWARE_SPECIFIC
;;;   Custom firmware for UV-K5 radio. Requires ARM cross-toolchain
;;;   and hardware-specific flashing tools.

;;; =========================================================================
;;; NEWLY CATEGORIZED (8 packages, previously had no fail_reason)
;;; =========================================================================

;;; nvidia-390xx-settings — PROPRIETARY_BINARY (newly categorized)
;;;   NVIDIA 390xx settings tool. GPL-2 source but requires proprietary
;;;   nvidia-390xx-utils and libxnvctrl-390xx. Useless without driver.

;;; virtualbox-bin-sdk — PROPRIETARY_BINARY (newly categorized)
;;;   VirtualBox SDK from proprietary binary distribution.
;;;   Oracle PUEL license. Non-functional without proprietary VirtualBox.

;;; lto-dump-snapshot — GCC_SNAPSHOT (newly categorized)
;;;   GCC LTO dump tool from development snapshots.
;;;   Part of unstable GCC trunk, changes daily.

;;; luxtorpeda-git — COMPLEX_DEPS (newly categorized)
;;;   Steam Play compatibility tool (Rust + Godot).
;;;   Requires Godot engine (not in Guix) and Steam integration.

;;; python-google-cloud-speech — COMPLEX_DEPS (newly categorized)
;;;   Google Cloud Speech API client. 20+ Google Cloud Python
;;;   packages not in Guix (proto-plus, grpcio, google-auth, etc.).

;;; devtools-git — DISTRO_SPECIFIC (newly categorized)
;;;   Arch Linux development tools (makechrootpkg, archbuild).
;;;   Entirely depends on pacman and Arch infrastructure.

;;; envoyproxy — COMPLEX_DEPS (newly categorized)
;;;   CNCF high-performance proxy. Requires Bazel build system
;;;   (not in Guix) with hundreds of hermetically managed deps.

;;; linux-sched-ext-git-headers — KERNEL_HEADERS (newly categorized)
;;;   Headers for sched-ext development kernel. Tracks moving target.

;;; linux-tip-git-headers — KERNEL_HEADERS (newly categorized)
;;;   Headers for linux-tip development kernel. Tracks moving target.
