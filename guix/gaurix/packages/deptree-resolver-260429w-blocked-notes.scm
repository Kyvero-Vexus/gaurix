;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Blocked notes for deptree-resolver-260429w
;;; 100 packages evaluated, 1 resolved (mailnaggertray-git via
;;; python-zombie-imp + mailnagger + mailnaggertray), 99 confirmed BLOCKED.
;;;
;;; Generated: 2026-04-29

(define-module (gaurix packages deptree-resolver-260429w-blocked-notes))

;;; ── RESOLVED ──────────────────────────────────────────────────────────

;;; mailnaggertray-git (#18103) — tray icon for mailnagger
;;; Status: DONE (3 new recipes in deptree-resolver-260429w.scm)
;;; Previously BLOCKED as COMPLEX_DEPS because it depends on mailnagger
;;; (not in Guix).  Resolution: packaged python-zombie-imp (PSF-2.0,
;;; trivial pyproject-build-system, provides removed imp module for
;;; Python 3.12+ compat), mailnagger (GPL-2.0+, python-build-system,
;;; all other deps in upstream Guix), and mailnaggertray (MIT, Rust
;;; cargo-build-system with 148 crate-source deps, hashes verified from
;;; crates.io).  All three packages build successfully.

;;; ── BLOCKED PACKAGES ──────────────────────────────────────────────────

;;; ── DKMS_KERNEL_MODULES (10 packages) ─────────────────────────────────
;;; Out-of-tree kernel modules requiring DKMS integration.  Guix uses a
;;; different kernel module build approach (linux-module-build-system) but
;;; these require specific kernel version matching not feasible in a channel.
;;;
;;; aquacomputer_d5next-hwmon-dkms (#18396)
;;;   HWMON driver for Aquacomputer D5 Next.  DKMS kernel module.
;;; amneziawg-dkms-git (#18250)
;;;   AmneziaWG kernel module (DKMS variant).
;;; ideapad-laptop-tb-dkms (#18355)
;;;   Lenovo IdeaPad ThinkBook DKMS driver.
;;; ideapad-laptop-tb2024g6plus-dkms (#18356)
;;;   Lenovo IdeaPad 2024 G6+ DKMS driver.
;;; pfring-dkms (#18297)
;;;   PF_RING kernel module for packet capture.
;;; r8126-dkms (#18334)
;;;   Realtek r8126 network driver.  DKMS.
;;; nvidia-bl-dkms (#17908)
;;;   NVIDIA backlight DKMS module.
;;; rtl88x2ce-dkms-git (#18016)
;;;   Realtek 8822CE/8822CU WiFi driver.  DKMS.
;;; nvidia-open-tinygrad-dkms-git (#18157)
;;;   NVIDIA open kernel module for tinygrad.  DKMS.
;;; libch343ser-git (#17855)
;;;   Linux kernel module for CH343 USB serial chips.
;;;   No versioned releases, DKMS-style module build.

;;; ── LIB32_MULTILIB (5 packages) ──────────────────────────────────────
;;; 32-bit library variants.  Guix does not support multilib; these require
;;; a lib32 compilation profile that does not exist in Guix's build model.
;;;
;;; lib32-opencl-nvidia-390xx (#17633)
;;;   32-bit NVIDIA 390xx OpenCL.
;;; lib32-libglade (#24779)
;;;   32-bit libglade (GTK+2, also obsolete).
;;; lib32-libxpm (#17517)
;;;   32-bit libXpm.
;;; lib32-sdl_sound (#24804)
;;;   32-bit SDL_sound.
;;; lib32-vkbasalt (#18193)
;;;   32-bit VkBasalt Vulkan post-processing.

;;; ── MINGW_CROSS_COMPILATION (9 packages) ──────────────────────────────
;;; Windows cross-compilation libraries via MinGW.  Guix lacks the
;;; mingw-w64 cross-compilation toolchain needed for these packages.
;;;
;;; mingw-w64-cblas (#18271)
;;;   MinGW CBLAS.
;;; mingw-w64-lapack (#18272)
;;;   MinGW LAPACK.
;;; mingw-w64-soundtouch (#18013)
;;;   MinGW SoundTouch.
;;; mingw-w64-boost (#24762)
;;;   MinGW Boost.
;;; mingw-w64-cppwinrt (#24816)
;;;   MinGW C++/WinRT.
;;; mingw-w64-pcre2 (#24813)
;;;   MinGW PCRE2.
;;; mingw-w64-spirv-tools (#24820)
;;;   MinGW SPIRV-Tools.
;;; mingw-w64-postgresql (#24794)
;;;   MinGW PostgreSQL.
;;; mingw-w64-lame (#24800)
;;;   MinGW LAME MP3 encoder.

;;; ── PROPRIETARY (12 packages) ─────────────────────────────────────────
;;; Proprietary or non-distributable software.  Cannot be packaged due to
;;; license restrictions, missing source, or non-redistributable binaries.
;;;
;;; squareline-studio (#17647)
;;;   SquareLine Studio (proprietary GUI builder).
;;; bakkesmod-steam (#17612)
;;;   BakkesMod for Rocket League (game mod, Windows/proprietary).
;;; inkdrop (#17810)
;;;   Inkdrop Markdown editor (proprietary, subscription).
;;; anytxt-bin (#18180)
;;;   AnyTXT full-text search (proprietary binary).
;;; pianoteq-stage (#18175)
;;;   Pianoteq Stage (proprietary piano VST).
;;; mobirise (#18186)
;;;   Mobirise website builder (proprietary).
;;; matlab-jre-bundled (#19253)
;;;   MATLAB bundled JRE (proprietary, not in AUR).
;;; sipgate-app-clinq (#18369)
;;;   Sipgate Clinq app (proprietary, not in AUR cache).
;;; upd72020x-fw-ng (#18392)
;;;   Renesas USB3 firmware (proprietary, not in AUR cache).
;;; xairedit (#18394)
;;;   Not in AUR cache, no upstream source found.
;;; wyc (#18285)
;;;   Chinese commercial tunneling software (proprietary).
;;; soapysdrplay3-luarvique-git (#18104)
;;;   Depends on libsdrplay (proprietary SDRplay API).
;;;   Note: base soapysdrplay3 available in nonguix, this is a fork variant.

;;; ── ARCH_SPECIFIC (7 packages) ────────────────────────────────────────
;;; Arch Linux infrastructure tools.  These depend on pacman, mkinitcpio,
;;; or other Arch-specific subsystems not available in Guix.
;;;
;;; mkinitcpio-systemd-root-password (#18371)
;;;   mkinitcpio hook for root password.
;;; repacman (#18376)
;;;   Pacman wrapper tool.
;;; findbrokenpkgs (#18359)
;;;   Finds broken packages in pacman database.
;;; sbctl-initcpio-post-hook (#18345)
;;;   Secure Boot initcpio hook.
;;; pacpak-git (#17916)
;;;   Pacman/Flatpak wrapper.
;;; mkinitcpio-clevis-hook (#18342)
;;;   mkinitcpio Clevis/LUKS hook.
;;; linux-keep-modules (#18490)
;;;   Arch mkinitcpio hook (not applicable to Guix).

;;; ── DISTRO_SPECIFIC (7 packages) ─────────────────────────────────────
;;; Depends on distro-specific tools (pacman, AUR, OpenRC, runit).
;;;
;;; archwiki-offline (#18361)
;;;   Depends on arch-wiki-docs (Arch-specific documentation package).
;;; auracle-git (#18415)
;;;   AUR helper.  Depends on pacman (Arch-specific).
;;; chromium-extension-arch-search (#17878)
;;;   Chromium extension for Arch search (Arch-specific).
;;; python-pypi2pkgbuild (#17822)
;;;   Converts PyPI packages to Arch PKGBUILDs.
;;; pamac-cli (#18099)
;;;   Depends on libpamac (Manjaro-specific package manager library).
;;; pikaur-static (#18205)
;;;   Static build of pikaur AUR helper.
;;; pikaur-static-git (#18206)
;;;   Git version of pikaur-static.

;;; ── SELINUX (2 packages) ──────────────────────────────────────────────
;;; SELinux-enabled variants.  Guix does not support SELinux.
;;;
;;; sudo-selinux (#18513)
;;;   SELinux-enabled sudo.
;;; base-selinux (#18537)
;;;   SELinux base metapackage.

;;; ── KERNEL_HEADERS (4 packages) ──────────────────────────────────────
;;; Kernel-version-specific headers for ZFS, custom kernels.
;;;
;;; zfs-linux-hardened-headers (#18004)
;;;   ZFS headers for linux-hardened.
;;; zfs-linux-rt-headers (#18002)
;;;   ZFS headers for linux-rt.
;;; zfs-linux-git-headers (#17995)
;;;   ZFS headers for linux-git.
;;; linux6.18.22-1-lts-bin (#24852)
;;;   Version-pinned kernel binary.

;;; ── ABANDONED_UPSTREAM (6 packages) ────────────────────────────────────
;;; Upstream abandoned, archived, or DMCA'd.
;;;
;;; deadbeef-mpris2-plugin (#19282)
;;;   Not in AUR cache, no upstream source found.
;;; lightdm-webkit-theme-aether (#19028)
;;;   GitHub archived 2022, depends on lightdm-webkit2-greeter (deprecated).
;;; phonon-qt4-vlc (#18938)
;;;   Requires Qt4 (EOL 2015).  Abandoned 2020.
;;; texmacs-pure (#17873)
;;;   Pure language archived, requires LLVM 3.5.
;;; clash-for-windows-chinese (#17433)
;;;   Upstream DMCA'd Nov 2023, no legitimate source.
;;; beignet-git (#18416)
;;;   Intel OpenCL for pre-Gen12, superseded by NEO.  Archived.

;;; ── NOT_IN_AUR (5 packages) ──────────────────────────────────────────
;;; Not found in AUR package cache or ephemeral version-pinned packages.
;;;
;;; linux6.18.20-1-lts-bin (#24969)
;;;   Version-pinned kernel binary (ephemeral AUR package).
;;; linux6.18.20-1-lts-docs-bin (#24970)
;;;   Version-pinned kernel docs binary.
;;; linux6.18.20-1-lts-headers-bin (#24968)
;;;   Version-pinned kernel headers binary.
;;; simplicity-commander (#18370)
;;;   Silicon Labs tool.  Depends on jlink-software-and-documentation (proprietary).
;;; libfprint-2-tod1-broadcom-cv3plus (#18279)
;;;   Broadcom fingerprint driver (proprietary).

;;; ── DOTNET_RUNTIME (3 packages) ──────────────────────────────────────
;;; Require .NET runtime 9.0 which is not in Guix (only 8.0 available).
;;;
;;; rdt-client (#18274)
;;;   Real-Debrid Torrent Client.  Requires ASP.NET 9.0 runtime.
;;; madness-interactive-reloaded (#18195)
;;;   Moddable action game.  Requires .NET 9.0.
;;; eddiscovery (#18320)
;;;   Elite Dangerous tool.  C# WinForms, Mono "with limitations".

;;; ── ELECTRON_APPS (3 packages) ────────────────────────────────────────
;;; Require Electron runtime with complex npm build pipelines.
;;;
;;; webcord-vencord-git (#18208)
;;;   Discord client with Vencord mod.  Requires pnpm/typescript/asar build.
;;;   Base webcord already packaged in gaurix.
;;; freetube-electron-git (#18219)
;;;   FreeTube from source.  Requires pnpm with complex npm deps.
;;;   Binary variant already packaged in gaurix.
;;; frame-eth (#18191)
;;;   Web3 wallet.  Electron/Node.js with nvm, node-gyp, complex npm pipeline.

;;; ── INIT_SYSTEM_SPECIFIC (2 packages) ─────────────────────────────────
;;; Require specific init systems not used by Guix.
;;;
;;; fcitx5-lotus-openrc-git (#24919)
;;;   OpenRC init script for fcitx5-lotus.
;;; fcitx5-lotus-runit-git (#24920)
;;;   Runit service for fcitx5-lotus.

;;; ── WINE_COMPLEX (2 packages) ─────────────────────────────────────────
;;; Require Wine with specific configuration or complex Wine dependencies.
;;;
;;; futu-ftnn-wine (#17938)
;;;   Futu Bull trading app wrapped in Wine.  Requires wine-mono.
;;; dxvk-async-git (#18147)
;;;   DXVK with async pipeline compiler.  Windows DLL cross-build.

;;; ── PLATFORM_UNSUPPORTED (4 packages) ─────────────────────────────────
;;; Platform not supported or binary-only for wrong platform.
;;;
;;; virtualbox-svn (#18799)
;;;   53 deps, massive SVN build.  Requires DKMS, iasl, glslang, nasm.
;;; vmd (#18210)
;;;   Visual Molecular Dynamics (proprietary academic license).
;;; prey (#18199)
;;;   FPS game requiring retail data + lib32 dependencies.
;;; glibc-eac (#24719)
;;;   Patched glibc for Easy Anti-Cheat.  Arch-specific, non-portable.

;;; ── COMPLEX_DEPS (9 packages) ─────────────────────────────────────────
;;; Complex dependency trees not feasible in Guix.
;;;
;;; python-home-assistant-frontend (#18556)
;;;   Pre-built JS blob (~110MB).  Building from source requires 500+ npm deps.
;;; python-gradio-pdf (#18109)
;;;   Depends on python-gradio (complex web framework, massive npm deps).
;;; borgwarehouse (#18418)
;;;   Next.js/React web app.  pnpm build, hundreds of npm deps.
;;; quartz-utils-git (#17917)
;;;   CLI utilities written in Crystal.  Crystal not in Guix.
;;; rdt-client: see DOTNET_RUNTIME above.
;;; knossu (#18365)
;;;   Doom-like game.  Depends on glew1.10 and libpng12 (ancient libs).
;;; python-pylink-square (#18201)
;;;   Depends on jlink-software-and-documentation (proprietary).
;;; kamilsss655-uv-k5-firmware-custom-git (#18097)
;;;   UV-K5 radio firmware.  Cross-compilation for ARM bare-metal.
;;; brother-mfc-l2400dw (#18362)
;;;   Brother printer driver.  Proprietary binary + lib32-glibc.

;;; ── NON_DISTRIBUTABLE (4 packages) ───────────────────────────────────
;;; Cannot be redistributed due to license or data restrictions.
;;;
;;; ut2004-gog (#18059)
;;;   UT2004 from GOG (non-redistributable game data).
;;; unrealtournament4 (#18115)
;;;   Unreal Tournament 4 (Epic Games, proprietary).
;;; factorio-space-age-experimental (#17444)
;;;   Factorio Space Age DLC (proprietary game).
;;; ttf-consolas-ligaturized (#18283)
;;;   Font based on Microsoft Consolas (non-redistributable base font).

;;; ── ANDROID_SDK (2 packages) ──────────────────────────────────────────
;;; Require Android SDK (proprietary Google toolchain).
;;;
;;; android-platform-19 (#18263)
;;;   Android SDK Platform API-19.
;;; android-platform-21 (#18265)
;;;   Android SDK Platform API-21.

;;; ── AMNEZIAWG_KERNEL (2 packages) ────────────────────────────────────
;;; Kernel modules for specific kernel builds.
;;;
;;; amneziawg-linux (#18252)
;;;   AmneziaWG for linux kernel.  Requires matching kernel headers.
;;; amneziawg-linux-hardened (#18254)
;;;   AmneziaWG for linux-hardened.  Requires matching kernel headers.

;;; ── LEGACY (1 package) ────────────────────────────────────────────────
;;;
;;; python2-gimp (#24791)
;;;   Python 2 GIMP plugins.  Python 2 EOL, pygtk obsolete.

;;; ── GCC_SNAPSHOT (1 package) ──────────────────────────────────────────
;;;
;;; libga68-snapshot (#24903)
;;;   GCC Algol68 runtime library snapshot.  Requires full GCC bootstrap
;;;   with multiple language frontends (gcc-ada, gcc-d) + lib32-glibc.
;;;   Extremely complex build, not feasible for channel packaging.
