;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Blocked notes for deptree-resolver-260428n
;;; 100 packages evaluated, 1 resolved, 99 confirmed BLOCKED.
;;;
;;; Generated: 2026-04-28

(define-module (gaurix packages deptree-resolver-260428n-blocked-notes))

;;; ── RESOLVED ──────────────────────────────────────────────────────────

;;; xviewer (#21839)
;;; Status: DONE (new recipe in deptree-resolver-260428n.scm)
;;; Previously BLOCKED as SOURCE_UNAVAILABLE (not in AUR cache).
;;; The non-git package was removed from AUR, but upstream source at
;;; https://github.com/linuxmint/xviewer is active (v3.4.16, 2024-12-03).
;;; Required packaging xapp (libxapp v3.2.2) as a new dependency.
;;; Both packages build and lint clean with meson-build-system.
;;; Approach: direct GitHub source tarball, meson build, all deps in Guix.

;;; ── BLOCKED PACKAGES ──────────────────────────────────────────────────

;;; ── ABANDONED_UPSTREAM (6 packages) ────────────────────────────────────
;;; upstream project abandoned/deleted; source no longer available
;;;
;;; deadbeef-mpris2-plugin (#19282)
;;;   Not in AUR cache, no upstream source found.
;;;   Prior passes: 20+ evaluations, consistently BLOCKED.
;;;
;;; lightdm-webkit-theme-aether (#19028)
;;;   AUR present, deps=3. Theme for LightDM webkit2 greeter.
;;;   GitHub archived 2022, last commit 2020. Dependencies deprecated.
;;;
;;; phonon-qt4-vlc (#18938)
;;;   AUR present, deps=3. Qt4 not in Guix; package abandoned 2020.
;;;   Qt4 EOL since 2015, no path forward.
;;;
;;; texmacs-pure (#17873)
;;;   AUR present, deps=3. Pure language plugin for GNU TeXmacs.
;;;   Pure language (https://github.com/agraef/pure-lang) archived.
;;;
;;; clash-for-windows-chinese (#17433)
;;;   AUR present, deps=4. Upstream (Clash for Windows) DMCA'd and
;;;   deleted Nov 2023. No legitimate source available.
;;;
;;; beignet-git (#18416)
;;;   AUR present. Intel OpenCL for pre-Gen12 GPUs.
;;;   Superseded by Intel Compute Runtime (NEO). Repository archived.

;;; ── ARCH_SPECIFIC (5 packages) ────────────────────────────────────
;;; Arch-Linux-specific infrastructure (mkinitcpio hooks, pacman tooling)
;;;
;;; mkinitcpio-systemd-root-password (#18371)
;;;   mkinitcpio hook for root password. Guix uses different initrd system.
;;;
;;; linux-keep-modules (#18490)
;;;   Arch mkinitcpio hook. Not applicable to Guix.
;;;
;;; python-pypi2pkgbuild (#17822)
;;;   Generates Arch PKGBUILDs from PyPI. Distro-specific build tool.
;;;
;;; glibc-eac (#24719)
;;;   Patched glibc for Easy Anti-Cheat. Arch-specific patches for
;;;   mkinitcpio and pacman hooks.
;;;
;;; mkinitcpio-clevis-hook (#18342)
;;;   LUKS unlock via Clevis in mkinitcpio. Arch initrd specific.

;;; ── COMPLEX_DEPS (12 packages) ────────────────────────────────────
;;; complex dependency chain with key deps unavailable in Guix
;;;
;;; virtualbox-svn (#18799)
;;;   53 deps, SVN source. Requires Qt6-scxml, gsoap, iasl, JDK8,
;;;   libidl2, libvncserver. Massive build, kernel module needed.
;;;   Has 1 reverse dep (virtualbox-ext-oracle-dev).
;;;
;;; python-home-assistant-frontend (#18556)
;;;   Requires Python >= 3.14, 110MB pre-built JS blob, npm ecosystem.
;;;
;;; quartz-utils-git (#18430)
;;;   Crystal language not available in Guix. No Guix Crystal compiler.
;;;
;;; rdt-client (#18561)
;;;   .NET binary repackage, needs dotnet-runtime-9.0 (only 8.0 in nonguix).
;;;
;;; gbm (#19044)
;;;   Game Boy Macro hardware mod firmware. Requires custom toolchain.
;;;
;;; mailnaggertray-git (#18592)
;;;   Requires mailnagger framework, not in Guix.
;;;
;;; python-gradio-pdf (#18463)
;;;   Requires python-gradio which has 200+ npm/JS deps.
;;;
;;; webcord-vencord-git (#18852)
;;;   Electron from source build with Vencord patches. Electron source
;;;   builds are infeasible in Guix sandbox.
;;;
;;; frame-eth (#18612)
;;;   Electron app for Ethereum hardware wallets. Same Electron issues.
;;;
;;; freetube-electron-git (#17925)
;;;   Electron from source build. Same Electron issues.
;;;
;;; madness-interactive-reloaded (#18618)
;;;   Unity/Mono game. Mono runtime not fully available in Guix.
;;;
;;; mobirise (#18357)
;;;   Proprietary website builder, no source code, custom license.

;;; ── DISTRO_SPECIFIC (12 packages) ────────────────────────────────────
;;; Arch Linux or init-system specific tools
;;;
;;; repacman (#18707): Arch pacman wrapper.
;;; archwiki-offline (#18568): Arch Wiki offline reader.
;;; findbrokenpkgs (#18930): Finds broken Arch packages.
;;; sbctl-initcpio-post-hook (#18720): Secure Boot hook for mkinitcpio.
;;; pacpak-git (#17862): pacman/flatpak bridge.
;;; chromium-extension-arch-search (#17897): Arch package search extension.
;;; pamac-cli (#17940): Manjaro/Arch package manager.
;;; fcitx5-lotus-openrc-git (#55324): OpenRC init script (Guix uses Shepherd).
;;; fcitx5-lotus-runit-git (#55325): runit init script (Guix uses Shepherd).
;;; pikaur-static (#18750): AUR helper (Arch-specific).
;;; pikaur-static-git (#18749): AUR helper git version.
;;; auracle-git (#2160): AUR RPC client (Arch-specific).

;;; ── DKMS_KERNEL_MODULE (12 packages) ────────────────────────────────
;;; Kernel modules requiring DKMS, incompatible with Guix build model
;;;
;;; aquacomputer_d5next-hwmon-dkms (#18606): Aquacomputer sensor driver.
;;; amneziawg-dkms-git (#18642): AmneziaWG kernel module.
;;; amneziawg-linux (#18452): AmneziaWG kernel module variant.
;;; amneziawg-linux-hardened (#18382): AmneziaWG for hardened kernel.
;;; ideapad-laptop-tb-dkms (#18957): Lenovo IdeaPad DKMS module.
;;; ideapad-laptop-tb2024g6plus-dkms (#18895): Lenovo variant.
;;; libch343ser-git (#17880): CH343 serial driver DKMS.
;;; pfring-dkms (#18399): PF_RING kernel module.
;;; r8126-dkms (#18487): Realtek 8126 NIC driver.
;;; nvidia-bl-dkms (#17755): NVIDIA backlight DKMS module.
;;; rtl88x2ce-dkms-git (#18362): Realtek 88x2ce WiFi driver.
;;; nvidia-open-tinygrad-dkms-git (#18617): NVIDIA open kernel module.

;;; ── HARDWARE_SPECIFIC (1 package) ────────────────────────────────────
;;;
;;; kamilsss655-uv-k5-firmware-custom-git (#17909)
;;;   Custom firmware for UV-K5 radio. Requires specific toolchain.

;;; ── KERNEL_HEADERS (4 packages) ────────────────────────────────────
;;;
;;; linux6.18.22-1-lts-bin (#37932): Prebuilt kernel headers, not in AUR.
;;; zfs-linux-hardened-headers (#17921): ZFS headers for hardened kernel.
;;; zfs-linux-rt-headers (#17920): ZFS headers for RT kernel.
;;; zfs-linux-git-headers (#17919): ZFS headers for git kernel.

;;; ── LEGACY_PYTHON2 (1 package) ────────────────────────────────────
;;;
;;; python2-gimp (#23210)
;;;   Python 2 bindings for GIMP. Python 2 EOL since 2020.

;;; ── MINGW_CROSS_COMPILATION (10 packages) ──────────────────────────
;;; MinGW-w64 cross-compilation packages; no MinGW toolchain in Guix
;;;
;;; mingw-w64-cblas (#34115), mingw-w64-lapack (#34113),
;;; mingw-w64-soundtouch (#18330), mingw-w64-boost (#23783),
;;; mingw-w64-cppwinrt (#43750), mingw-w64-pcre2 (#26805),
;;; mingw-w64-spirv-tools (#42666), dxvk-async-git (#18820),
;;; mingw-w64-postgresql (#24572), mingw-w64-lame (#34112).

;;; ── MULTILIB_UNSUPPORTED (5 packages) ──────────────────────────────
;;; 32-bit multilib packages; Guix doesn't support multilib
;;;
;;; lib32-opencl-nvidia-390xx (#17502), lib32-libglade (#45410),
;;; lib32-libxpm (#16491), lib32-sdl_sound (#22729),
;;; lib32-vkbasalt (#18688).

;;; ── NON_DISTRIBUTABLE (5 packages) ────────────────────────────────
;;; License prevents redistribution
;;;
;;; ttf-consolas-ligaturized (#20499): Microsoft font derivative.
;;; ut2004-gog (#18333): GOG game, proprietary.
;;; unrealtournament4 (#18319): Epic Games, proprietary.
;;; factorio-space-age-experimental (#17440): Wube, proprietary.
;;; prey (#18251): Anti-theft SaaS, proprietary.

;;; ── PLATFORM_UNSUPPORTED (5 packages) ──────────────────────────────
;;; Windows, macOS, or Android-only packages
;;;
;;; bakkesmod-steam (#17468): Windows-only Rocket League mod.
;;; android-platform-19 (#28671): Android SDK platform 19.
;;; android-platform-21 (#23109): Android SDK platform 21.
;;; futu-ftnn-wine (#18151): Wine wrapper for Windows-only Futu app.
;;; eddiscovery (#18320): .NET-based, requires Wine for full function.

;;; ── PROPRIETARY_BINARY (16 packages) ──────────────────────────────
;;; Proprietary closed-source binaries
;;;
;;; matlab-jre-bundled (#19363): MATLAB bundled JRE, proprietary.
;;; sipgate-app-clinq (#18449): Sipgate desktop app, closed source.
;;; squareline-studio (#17812): SquareLine GUI builder, proprietary.
;;; upd72020x-fw-ng (#29404): Renesas USB controller firmware.
;;; xairedit (#20522): XAir mixer editor, proprietary.
;;; simplicity-commander (#18419): Silicon Labs tool, proprietary.
;;; brother-mfc-l2400dw (#17797): Brother printer driver, proprietary.
;;; knossu (#18461): Proprietary app.
;;; libfprint-2-tod1-broadcom-cv3plus (#17912): Broadcom fingerprint blob.
;;; wyc (#18777): Proprietary app.
;;; inkdrop (#17819): Note-taking app, proprietary.
;;; soapysdrplay3-luarvique-git (#18141): SDRplay driver, proprietary API.
;;; anytxt-bin (#18295): Full-text search, proprietary.
;;; pianoteq-stage (#18367): Piano plugin, commercial.
;;; vmd (#18253): Visual Molecular Dynamics, academic license.
;;; python-pylink-square (#21233): J-Link debugger, proprietary.

;;; ── SELINUX_SPECIFIC (2 packages) ──────────────────────────────────
;;; SELinux-specific variants
;;;
;;; sudo-selinux (#18513): sudo with SELinux support. Guix lacks SELinux.
;;; base-selinux (#18537): Arch base-selinux meta-package.

;;; ── SOURCE_UNAVAILABLE (3 packages, xviewer resolved) ─────────────
;;; Source not in AUR cache and no upstream found
;;;
;;; linux6.18.20-1-lts-bin (#20997): Removed from AUR.
;;; linux6.18.20-1-lts-docs-bin (#20996): Removed from AUR.
;;; linux6.18.20-1-lts-headers-bin (#20995): Removed from AUR.
