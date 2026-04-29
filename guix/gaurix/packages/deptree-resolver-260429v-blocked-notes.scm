;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Blocked notes for deptree-resolver-260429v
;;; 100 packages evaluated, 1 resolved (hnefatafl-copenhagen), 99 confirmed BLOCKED.
;;;
;;; Generated: 2026-04-29

(define-module (gaurix packages deptree-resolver-260429v-blocked-notes))

;;; ── RESOLVED ──────────────────────────────────────────────────────────

;;; hnefatafl-copenhagen (#18404) — Copenhagen Hnefatafl board game
;;; Status: DONE (new recipe in deptree-resolver-260429v.scm)
;;; Previously BLOCKED as COMPLEX_DEPS because it is a Rust application
;;; with 735 transitive crate dependencies.  Resolution: used Guix's
;;; cargo-build-system with all crate-source origins listed inline,
;;; hashes verified from crates.io sparse index.  System dependencies:
;;; alsa-lib (audio), openssl (TLS), vulkan-loader (GPU rendering),
;;; libxkbcommon (keyboard), wayland (display), pkg-config (build).
;;; Source: crates.io v5.8.0, AGPL-3.0+.

;;; ── BLOCKED PACKAGES ──────────────────────────────────────────────────

;;; ── DKMS_KERNEL_MODULES (9 packages) ──────────────────────────────────
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

;;; ── PROPRIETARY (9 packages) ──────────────────────────────────────────
;;; Proprietary or non-distributable software.  Cannot be packaged due to
;;; license restrictions, missing source, or non-redistributable binaries.
;;;
;;; squareline-studio (#17647)
;;;   SquareLine Studio (proprietary GUI builder).
;;; bakkesmod-steam (#17612)
;;;   BakkesMod for Rocket League (game mod, Windows/proprietary).
;;; ut2004-gog (#18059)
;;;   UT2004 from GOG (non-redistributable game data).
;;; inkdrop (#17810)
;;;   Inkdrop Markdown editor (proprietary, subscription).
;;; unrealtournament4 (#18115)
;;;   Unreal Tournament 4 (Epic Games, proprietary).
;;; factorio-space-age-experimental (#17444)
;;;   Factorio Space Age DLC (proprietary game).
;;; anytxt-bin (#18180)
;;;   AnyTXT full-text search (proprietary binary).
;;; pianoteq-stage (#18175)
;;;   Pianoteq Stage (proprietary piano VST).
;;; mobirise (#18186)
;;;   Mobirise website builder (proprietary).

;;; ── ARCH_SPECIFIC (9 packages) ────────────────────────────────────────
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
;;; python-pypi2pkgbuild (#17822)
;;;   Converts PyPI packages to Arch PKGBUILDs.
;;; mkinitcpio-clevis-hook (#18342)
;;;   mkinitcpio Clevis/LUKS hook.
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
;;; Kernel-version-specific headers for ZFS, custom kernels.  Guix manages
;;; kernel modules differently (declarative system configuration).
;;;
;;; linux-keep-modules (#18490)
;;;   Arch mkinitcpio hook (not applicable to Guix).
;;; zfs-linux-hardened-headers (#18004)
;;;   ZFS headers for linux-hardened.
;;; zfs-linux-rt-headers (#18002)
;;;   ZFS headers for linux-rt.
;;; zfs-linux-git-headers (#17995)
;;;   ZFS headers for linux-git.

;;; ── ABANDONED_UPSTREAM (5 packages) ────────────────────────────────────
;;; Upstream abandoned, archived, or DMCA'd.
;;;
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

;;; ── NOT_IN_AUR (9 packages) ───────────────────────────────────────────
;;; Not found in AUR package cache.  Likely deleted or renamed.
;;;
;;; deadbeef-mpris2-plugin (#19282)
;;;   Not in AUR cache, no upstream source found.
;;; linux6.18.20-1-lts-bin (#24969)
;;;   Version-pinned kernel binary (ephemeral AUR package).
;;; linux6.18.20-1-lts-docs-bin (#24970)
;;;   Version-pinned kernel docs binary.
;;; linux6.18.20-1-lts-headers-bin (#24968)
;;;   Version-pinned kernel headers binary.
;;; linux6.18.22-1-lts-bin (#24852)
;;;   Version-pinned kernel binary.
;;; matlab-jre-bundled (#19253)
;;;   MATLAB bundled JRE (proprietary, not in AUR).
;;; sipgate-app-clinq (#18369)
;;;   Sipgate Clinq app (not in AUR cache).
;;; upd72020x-fw-ng (#18392)
;;;   Renesas USB3 firmware (not in AUR cache).
;;; xairedit (#18394)
;;;   Not in AUR cache.

;;; ── DOTNET_RUNTIME (3 packages) ──────────────────────────────────────
;;; Require .NET runtime (dotnet-runtime-9.0) which is not in Guix.
;;;
;;; rdt-client (#18274)
;;;   Real-Debrid Torrent Client.  Requires ASP.NET 9.0 runtime.
;;; madness-interactive-reloaded (#18195)
;;;   Moddable action game.  Requires .NET 9.0.
;;; eddiscovery (#18320)
;;;   Elite Dangerous tool.  C# WinForms, Mono "with limitations".
;;;   Previous status: PLATFORM_UNSUPPORTED.  Re-evaluated: upstream
;;;   only provides Windows builds, WinForms rendering on Mono is
;;;   incomplete.  Not viable for reliable packaging.

;;; ── ELECTRON_APPS (3 packages) ────────────────────────────────────────
;;; Require Electron runtime which is not in Guix.
;;;
;;; webcord-vencord-git (#18208)
;;;   Discord client built on Electron.
;;; freetube-electron-git (#18219)
;;;   FreeTube YouTube client (Electron).  Also not in AUR cache.
;;; frame-eth (#18191)
;;;   Web3 wallet.  Electron/Node.js.

;;; ── INIT_SYSTEM_SPECIFIC (2 packages) ─────────────────────────────────
;;; Require specific init systems (OpenRC, runit) not used by Guix.
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

;;; ── PLATFORM_UNSUPPORTED (5 packages) ─────────────────────────────────
;;; Platform not supported or binary-only for wrong platform.
;;;
;;; virtualbox-svn (#18799)
;;;   53 deps, massive SVN build.  Requires DKMS, iasl, glslang, nasm,
;;;   yasm.  Not feasible as channel package.
;;; vmd (#18210)
;;;   Visual Molecular Dynamics (proprietary academic license).
;;; prey (#18199)
;;;   FPS game requiring retail data + lib32 dependencies.
;;; python2-gimp (#24791)
;;;   Python 2 GIMP plugins.  Python 2 EOL, pygtk obsolete.
;;; glibc-eac (#24719)
;;;   Patched glibc for Easy Anti-Cheat.  Arch-specific, non-portable.

;;; ── COMPLEX_DEPS (9 packages) ─────────────────────────────────────────
;;; Complex dependency trees not feasible in Guix.
;;;
;;; python-home-assistant-frontend (#18556)
;;;   Pre-built JS blob (~110MB).  Building from source requires 500+ npm deps.
;;; pamac-cli (#18099)
;;;   Depends on libpamac (Manjaro-specific package manager library).
;;; python-gradio-pdf (#18109)
;;;   Depends on python-gradio (complex web framework, massive npm deps).
;;; borgwarehouse (#18418)
;;;   Next.js/React web app.  pnpm build, hundreds of npm deps.
;;;   Guix lacks npm-build-system for complex web apps.
;;; soapysdrplay3-luarvique-git (#18104)
;;;   Depends on libsdrplay (proprietary SDRplay API).
;;; archwiki-offline (#18361)
;;;   Depends on arch-wiki-docs (Arch-specific documentation package).
;;; auracle-git (#18415)
;;;   AUR helper.  Depends on pacman (Arch-specific).
;;; chromium-extension-arch-search (#17878)
;;;   Chromium extension for Arch search (Arch-specific).
;;; mailnaggertray-git (#18103)
;;;   Depends on mailnagger (not in Guix, niche mail tool).

;;; ── HARDWARE_SPECIFIC (3 packages) ────────────────────────────────────
;;; Require specific proprietary hardware drivers or firmware.
;;;
;;; simplicity-commander (#18370)
;;;   Silicon Labs tool.  Depends on jlink-software-and-documentation (proprietary).
;;; brother-mfc-l2400dw (#18362)
;;;   Brother printer driver.  Proprietary binary + lib32-glibc.
;;; libfprint-2-tod1-broadcom-cv3plus (#18279)
;;;   Broadcom fingerprint driver (proprietary).

;;; ── CRYSTAL_LANGUAGE (1 package) ──────────────────────────────────────
;;; Requires Crystal compiler which is not in Guix.
;;;
;;; quartz-utils-git (#17917)
;;;   CLI utilities written in Crystal.  Crystal not in Guix.

;;; ── OTHER (5 packages) ────────────────────────────────────────────────
;;; Miscellaneous intractable packages.
;;;
;;; knossu (#18365)
;;;   Doom-like game.  Depends on glew1.10 and libpng12 (ancient libs).
;;; ttf-consolas-ligaturized (#18283)
;;;   Font based on Microsoft Consolas (non-redistributable base font).
;;; wyc (#18285)
;;;   Chinese commercial tunneling software (proprietary).
;;; kamilsss655-uv-k5-firmware-custom-git (#18097)
;;;   UV-K5 radio firmware.  Cross-compilation for ARM bare-metal.
;;;   Could theoretically be built but produces firmware, not a system package.
;;; python-pylink-square (#18201)
;;;   Depends on jlink-software-and-documentation (proprietary).

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
;;; libch343ser-git (#17855)
;;;   Linux kernel module for CH343 USB serial chips.
;;;   Primary value is the kernel driver (not the userspace lib).
;;;   No versioned releases, DKMS-style module build.
