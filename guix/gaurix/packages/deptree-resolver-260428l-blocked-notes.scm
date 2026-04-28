;;; Blocked notes for deptree-resolver-260428l
;;; 100 BLOCKED packages evaluated (top of priority queue), 0 new recipes,
;;; 1 resolved to DONE (intel-level-zero-raytracing-support: already resolved,
;;;   recipe fixed in deptree-resolver-260417r.scm),
;;; 2 newly classified (fcitx5-lotus-openrc-git, fcitx5-lotus-runit-git),
;;; 0 new dependency packages,
;;; 99 remain BLOCKED across intractable categories.
;;;
;;; Generated: 2026-04-28
;;;
;;; Verification checks performed:
;;; - All 100 selected checked against upstream Guix (guix show / guix search)
;;; - Key dependency availability verified:
;;;   level-zero 1.27.0, tbb 2021.6.0, mold 2.40.4, wxwidgets 3.2.8.1
;;;   node 22.14.0, borg 1.4.3, rust 1.85.1, electron 36.8.1 (nonfree)
;;; - Crystal language still not in Guix
;;; - .NET 9.0 still not in Guix (only 8.0)
;;; - Rust 1.94+ still not in Guix (only 1.85.1)
;;; - Zig 0.14 still not in Guix
;;; - Wayfire still not in Guix
;;; - Granite (Elementary OS toolkit) still not in Guix
;;; - mono-basic still not in Guix
;;; - fcitx5-lotus still not in Guix

;;; =========================================================================
;;; RESOLVED (1 package)
;;; =========================================================================

;;; intel-level-zero-raytracing-support (#55356) — RESOLVED (ALREADY_RESOLVED)
;;;   Same software as intel-level-zero-raytracing-support-git (#14769),
;;;   already packaged in deptree-resolver-260417r.scm.
;;;   Recipe fixed this pass: switched to url-fetch (git-fetch fails in sandbox),
;;;   added tbb input, set -DZE_RAYTRACING_TBB=normal to prevent FetchContent
;;;   download of TBB during build. Build verified successful.
;;;   Apache-2.0. v1.2.3. CMake build.
;;;   Hash: 1cxmk0qn1s9jkddk3nk8ndc7ay2pkk03n3ijl3dqq8jl66807yqb

;;; =========================================================================
;;; NEWLY CLASSIFIED (2 packages)
;;; =========================================================================

;;; fcitx5-lotus-openrc-git (#55324) — DISTRO_SPECIFIC
;;;   OpenRC init script for fcitx5-lotus input method.
;;;   Guix uses Shepherd as its init system, not OpenRC.
;;;   Also depends on fcitx5-lotus-git which is not in Guix.
;;;   A1: package OpenRC service → meaningless on Guix (Shepherd-based).
;;;   A2: write Shepherd service → would need fcitx5-lotus first, which
;;;       itself is not in Guix.
;;;   A3: skip → correct, DISTRO_SPECIFIC.

;;; fcitx5-lotus-runit-git (#55325) — DISTRO_SPECIFIC
;;;   Runit service for fcitx5-lotus input method.
;;;   Guix uses Shepherd as its init system, not runit.
;;;   Also depends on fcitx5-lotus-git which is not in Guix.
;;;   A1: package runit service → meaningless on Guix (Shepherd-based).
;;;   A2: write Shepherd service → would need fcitx5-lotus first.
;;;   A3: skip → correct, DISTRO_SPECIFIC.

;;; =========================================================================
;;; BLOCKED — PROPRIETARY_BINARY (16 packages)
;;; =========================================================================

;;; matlab-jre-bundled — PROPRIETARY_BINARY
;;;   Bundled JRE for MATLAB. Proprietary MathWorks software.
;;; sipgate-app-clinq — PROPRIETARY_BINARY
;;;   Electron-based VoIP app. Proprietary binary distribution.
;;; squareline-studio — PROPRIETARY_BINARY
;;;   LVGL UI design tool. Commercial proprietary software.
;;; upd72020x-fw-ng — PROPRIETARY_BINARY
;;;   Firmware for Renesas USB 3.0 controller. Non-redistributable firmware.
;;; xairedit — PROPRIETARY_BINARY
;;;   X-Air mixer editor. Proprietary Behringer software.
;;; simplicity-commander — PROPRIETARY_BINARY
;;;   Silicon Labs MCU programmer. Proprietary development tool.
;;; brother-mfc-l2400dw — PROPRIETARY_BINARY
;;;   Brother printer driver. Proprietary binary blob.
;;; knossu — PROPRIETARY_BINARY
;;;   Proprietary game client for Knossos (FreeSWITCH Space).
;;; libfprint-2-tod1-broadcom-cv3plus — PROPRIETARY_BINARY
;;;   Broadcom fingerprint sensor driver. Proprietary.
;;; wyc — PROPRIETARY_BINARY
;;;   Proprietary Windows-Your-Chromebook tool.
;;; inkdrop — PROPRIETARY_BINARY
;;;   Proprietary Markdown note-taking app.
;;; anytxt-bin — PROPRIETARY_BINARY
;;;   Proprietary full-text search tool.
;;; soapysdrplay3-luarvique-git — PROPRIETARY_BINARY
;;;   SDRplay API driver. Requires proprietary SDRplay API.
;;; pianoteq-stage — PROPRIETARY_BINARY
;;;   Modartt piano synthesizer. Commercial proprietary.
;;; vmd — PROPRIETARY_BINARY
;;;   Visual Molecular Dynamics. UIUC proprietary license.
;;; python-pylink-square — PROPRIETARY_BINARY
;;;   J-Link debug probe Python interface. Requires proprietary J-Link.

;;; =========================================================================
;;; BLOCKED — COMPLEX_DEPS (14 packages)
;;; =========================================================================

;;; virtualbox-svn — COMPLEX_DEPS
;;;   67 deps, SVN source. Massive build system, not feasible in batch.
;;; python-home-assistant-frontend — COMPLEX_DEPS
;;;   npm/pip web frontend with massive dependency tree.
;;; quartz-utils-git — COMPLEX_DEPS
;;;   Requires Crystal language (not in Guix).
;;; rdt-client — COMPLEX_DEPS
;;;   Requires dotnet-runtime-9.0 (Guix has only 8.0).
;;; gbm — COMPLEX_DEPS
;;;   Requires mono-basic (not in Guix).
;;; mailnaggertray-git — COMPLEX_DEPS
;;;   Requires mailnagger (not in Guix). Rust/Cargo build.
;;; python-gradio-pdf — COMPLEX_DEPS
;;;   Requires python-gradio (not in Guix).
;;; webcord-vencord-git — COMPLEX_DEPS
;;;   Electron Discord client with massive npm build.
;;; frame-eth — COMPLEX_DEPS
;;;   Node.js Web3 app with nvm/npm build complexity.
;;; freetube-electron-git — COMPLEX_DEPS
;;;   Requires electron41 (specific version, not in Guix).
;;; madness-interactive-reloaded — COMPLEX_DEPS
;;;   Requires dotnet-9.0 and ffmpeg5.1 (neither in Guix).
;;; mobirise — COMPLEX_DEPS
;;;   Commercial website builder. Custom/proprietary license.
;;; borgwarehouse — COMPLEX_DEPS
;;;   Next.js 16 web app with 500+ npm transitive deps.
;;;   node-build-system cannot handle this scale.
;;; hnefatafl-copenhagen — COMPLEX_DEPS
;;;   Rust app requiring Rust >= 1.94 (edition 2024). Guix has 1.85.1.
;;;   661 crate dependencies. Re-evaluate when Guix Rust >= 1.94.

;;; =========================================================================
;;; BLOCKED — DKMS_KERNEL_MODULE (12 packages)
;;; =========================================================================

;;; aquacomputer_d5next-hwmon-dkms — DKMS_KERNEL_MODULE
;;; amneziawg-dkms-git — DKMS_KERNEL_MODULE
;;; ideapad-laptop-tb-dkms — DKMS_KERNEL_MODULE
;;; ideapad-laptop-tb2024g6plus-dkms — DKMS_KERNEL_MODULE
;;; libch343ser-git — DKMS_KERNEL_MODULE
;;; pfring-dkms — DKMS_KERNEL_MODULE
;;; r8126-dkms — DKMS_KERNEL_MODULE
;;; amneziawg-linux — DKMS_KERNEL_MODULE
;;; amneziawg-linux-hardened — DKMS_KERNEL_MODULE
;;; nvidia-bl-dkms — DKMS_KERNEL_MODULE
;;; rtl88x2ce-dkms-git — DKMS_KERNEL_MODULE
;;; nvidia-open-tinygrad-dkms-git — DKMS_KERNEL_MODULE

;;; =========================================================================
;;; BLOCKED — DISTRO_SPECIFIC (12 packages, including 2 new)
;;; =========================================================================

;;; repacman — DISTRO_SPECIFIC (pacman rebuild tool)
;;; archwiki-offline — DISTRO_SPECIFIC (Arch Wiki offline)
;;; findbrokenpkgs — DISTRO_SPECIFIC (Arch package checker)
;;; sbctl-initcpio-post-hook — DISTRO_SPECIFIC (mkinitcpio hook)
;;; chromium-extension-arch-search — DISTRO_SPECIFIC (Arch search extension)
;;; pacpak-git — DISTRO_SPECIFIC (pacman/flatpak bridge)
;;; pamac-cli — DISTRO_SPECIFIC (pacman GUI CLI)
;;; pikaur-static — DISTRO_SPECIFIC (AUR helper)
;;; pikaur-static-git — DISTRO_SPECIFIC (AUR helper git)
;;; auracle-git — DISTRO_SPECIFIC (AUR helper)
;;; fcitx5-lotus-openrc-git — DISTRO_SPECIFIC (OpenRC init, new this pass)
;;; fcitx5-lotus-runit-git — DISTRO_SPECIFIC (runit service, new this pass)

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
;;; dxvk-async-git — MINGW_CROSS_COMPILATION
;;; mingw-w64-postgresql — MINGW_CROSS_COMPILATION
;;; mingw-w64-lame — MINGW_CROSS_COMPILATION

;;; =========================================================================
;;; BLOCKED — ABANDONED_UPSTREAM (6 packages)
;;; =========================================================================

;;; deadbeef-mpris2-plugin — ABANDONED_UPSTREAM
;;; lightdm-webkit-theme-aether — ABANDONED_UPSTREAM
;;; texmacs-pure — ABANDONED_UPSTREAM
;;; clash-for-windows-chinese — ABANDONED_UPSTREAM
;;; phonon-qt4-vlc — ABANDONED_UPSTREAM
;;; beignet-git — ABANDONED_UPSTREAM (Intel OpenCL for old GPUs, replaced by NEO)

;;; =========================================================================
;;; BLOCKED — PLATFORM_UNSUPPORTED (5 packages)
;;; =========================================================================

;;; bakkesmod-steam — PLATFORM_UNSUPPORTED (Windows-only Rocket League mod)
;;; android-platform-19 — PLATFORM_UNSUPPORTED (Android SDK)
;;; android-platform-21 — PLATFORM_UNSUPPORTED (Android SDK)
;;; futu-ftnn-wine — PLATFORM_UNSUPPORTED (Windows app via Wine)
;;; eddiscovery — PLATFORM_UNSUPPORTED (.NET Windows game tool)

;;; =========================================================================
;;; BLOCKED — ARCH_SPECIFIC (5 packages)
;;; =========================================================================

;;; mkinitcpio-systemd-root-password — ARCH_SPECIFIC (mkinitcpio hook)
;;; linux-keep-modules — ARCH_SPECIFIC (Arch kernel module manager)
;;; glibc-eac — ARCH_SPECIFIC (Easy Anti-Cheat glibc patch)
;;; mkinitcpio-clevis-hook — ARCH_SPECIFIC (mkinitcpio hook)
;;; python-pypi2pkgbuild — ARCH_SPECIFIC (pypi to PKGBUILD converter)

;;; =========================================================================
;;; BLOCKED — MULTILIB_UNSUPPORTED (5 packages)
;;; =========================================================================

;;; lib32-opencl-nvidia-390xx — MULTILIB_UNSUPPORTED
;;; lib32-libglade — MULTILIB_UNSUPPORTED
;;; lib32-libxpm — MULTILIB_UNSUPPORTED
;;; lib32-sdl_sound — MULTILIB_UNSUPPORTED
;;; lib32-vkbasalt — MULTILIB_UNSUPPORTED

;;; =========================================================================
;;; BLOCKED — NON_DISTRIBUTABLE (5 packages)
;;; =========================================================================

;;; ttf-consolas-ligaturized — NON_DISTRIBUTABLE (Microsoft font derivative)
;;; ut2004-gog — NON_DISTRIBUTABLE (commercial game)
;;; unrealtournament4 — NON_DISTRIBUTABLE (commercial game)
;;; factorio-space-age-experimental — NON_DISTRIBUTABLE (commercial game)
;;; prey — NON_DISTRIBUTABLE (commercial game)

;;; =========================================================================
;;; BLOCKED — KERNEL_HEADERS (4 packages)
;;; =========================================================================

;;; linux6.18.22-1-lts-bin — KERNEL_HEADERS (prebuilt kernel headers)
;;; zfs-linux-hardened-headers — KERNEL_HEADERS
;;; zfs-linux-rt-headers — KERNEL_HEADERS
;;; zfs-linux-git-headers — KERNEL_HEADERS

;;; =========================================================================
;;; BLOCKED — SELINUX_SPECIFIC (2 packages)
;;; =========================================================================

;;; sudo-selinux — SELINUX_SPECIFIC (SELinux-enabled sudo)
;;; base-selinux — SELINUX_SPECIFIC (SELinux base meta-package)

;;; =========================================================================
;;; BLOCKED — LEGACY_PYTHON2 (2 packages)
;;; =========================================================================

;;; python2-gimp — LEGACY_PYTHON2 (Python 2 GIMP bindings)
;;; boost-python2 — LEGACY_PYTHON2 (Boost.Python for Python 2)

;;; =========================================================================
;;; BLOCKED — HARDWARE_SPECIFIC (1 package)
;;; =========================================================================

;;; kamilsss655-uv-k5-firmware-custom-git — HARDWARE_SPECIFIC
;;;   Custom firmware for UV-K5 radio. Requires ARM cross-compilation
;;;   toolchain and specific radio hardware.
