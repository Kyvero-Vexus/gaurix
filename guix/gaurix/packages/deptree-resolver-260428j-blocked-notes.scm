;;; Blocked notes for deptree-resolver-260428j
;;; 100 BLOCKED packages evaluated (top of priority queue), 5 new recipes,
;;; 3 resolved to DONE (scans2any-git, oclint, deadbeef-git),
;;; 2 new dependency packages (python-libnmap, python-partial-json-parser),
;;; 97 remain BLOCKED across intractable categories.
;;;
;;; Generated: 2026-04-28
;;;
;;; Verification checks performed:
;;; - All 100 selected checked against upstream Guix (guix show / guix search)
;;; - Key dependency availability verified: rust 1.85.1, electron 36.8.1,
;;;   dotnet 8.0.401, node 22.14.0, mono 6.12.0, llvm 21.1.8, clang 21.1.8,
;;;   libdispatch 5.9.2, mupdf 1.26.8, granite 7.3.0
;;; - Crystal language still not in Guix
;;; - .NET 9.0 still not in Guix (only 8.0)
;;; - Rust 1.89+ still not in Guix (only 1.85.1)
;;; - Zig still not in Guix
;;; - Wayfire still not in Guix

;;; =========================================================================
;;; RESOLVED (3 packages)
;;; =========================================================================

;;; scans2any-git — RESOLVED (was COMPLEX_DEPS)
;;;   Python app for converting infrastructure scans. AGPL-3.0.
;;;   Previously blocked on missing python-libnmap and python-partial-json-parser.
;;;   Both are pure Python packages now packaged in this pass.
;;;   All other deps (jinja2, pandas, tabulate, rich, pyyaml, defusedxml,
;;;   pydantic, sortedcontainers) confirmed in upstream Guix.
;;;   Recipe: pyproject-build-system, git-fetch from GitHub.

;;; oclint — RESOLVED (was COMPLEX_DEPS)
;;;   Static analysis tool for C/C++/ObjC. BSD license.
;;;   Previously blocked on "10+ deps" — but all deps are now in Guix:
;;;   clang 21.1.8, llvm 21.1.8, zlib, xz, libffi, libedit, libxml2, icu4c.
;;;   Latest release v26.02 supports LLVM 21. Actively maintained.
;;;   Recipe: cmake-build-system, url-fetch from GitHub releases.

;;; deadbeef-git — RESOLVED (was COMPLEX_DEPS)
;;;   GTK+ audio player for GNU/Linux. GPL-2.0+/LGPL-2.1+/zlib.
;;;   Previously blocked on libblocksruntime + libdispatch not being in Guix.
;;;   KEY CHANGE: libdispatch@5.9.2 is now in Guix AND includes
;;;   libBlocksRuntime.so (the Blocks extension runtime).
;;;   All other deps confirmed available: jansson, alsa-lib, curl, faad2,
;;;   flac, ffmpeg, gtk2, gtk3, imlib2, libcddb, libcdio, libmad,
;;;   libsamplerate, libvorbis, libzip, wavpack, pipewire, pulseaudio.
;;;   Recipe: gnu-build-system, git-fetch from GitHub, clang as compiler.

;;; =========================================================================
;;; BLOCKED — PROPRIETARY_BINARY (15 packages)
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

;;; inkdrop — PROPRIETARY_BINARY
;;;   Markdown note-taking app. Proprietary commercial software.
;;;   A1: package binary → proprietary, requires license purchase.
;;;   A2: build from source → closed-source.
;;;   A3: alternative → many FOSS markdown editors in Guix.

;;; pianoteq-stage — PROPRIETARY_BINARY
;;;   Piano synthesizer. Proprietary Modartt software.
;;;   A1: package binary → proprietary, non-redistributable.
;;;   A2: build from source → closed-source.
;;;   A3: alternative → no equivalent physical modeling piano synth.

;;; anytxt-bin — PROPRIETARY_BINARY
;;;   Full-text search tool. Proprietary Windows software.
;;;   A1: package binary → proprietary + Windows-only.
;;;   A2: Wine wrapper → still proprietary.
;;;   A3: alternative → recoll, tracker in Guix.

;;; kamilsss655-uv-k5-firmware-custom-git — HARDWARE_SPECIFIC
;;;   Custom firmware for Quansheng UV-K5 radio. Apache-2.0.
;;;   A1: package firmware → requires ARM cross-compiler + specific toolchain.
;;;   A2: provide pre-built binary → needs device-specific flashing tools.
;;;   A3: build with Guix cross-compilation → arm-none-eabi toolchain not standard.

;;; futu-ftnn-wine — PROPRIETARY_BINARY
;;;   Futu trading platform via Wine. Proprietary financial software.
;;;   A1: package binary → proprietary, non-redistributable.
;;;   A2: native build → no Linux source available.
;;;   A3: Wine wrapper → still depends on proprietary app.

;;; mobirise — PROPRIETARY_BINARY
;;;   Website builder. Proprietary commercial software.
;;;   A1: package binary → proprietary, non-redistributable.
;;;   A2: build from source → closed-source.
;;;   A3: alternative → many FOSS website builders exist.

;;; nvidia-390xx-settings — PROPRIETARY_BINARY
;;;   NVIDIA 390xx driver settings. Requires proprietary NVIDIA driver.
;;;   A1: package as-is → tied to proprietary NVIDIA 390xx driver.
;;;   A2: use nvidia-settings → different driver version.
;;;   A3: nouveau → open-source but different functionality.

;;; python-pylink-square — PROPRIETARY_BINARY
;;;   Python interface for SEGGER J-Link. Requires proprietary J-Link software.
;;;   A1: package without J-Link → useless without proprietary backend.
;;;   A2: package J-Link → proprietary, non-redistributable EULA.
;;;   A3: alternative → OpenOCD for supported debuggers.

;;; =========================================================================
;;; BLOCKED — DKMS_KERNEL_MODULE (12 packages)
;;; =========================================================================

;;; aquacomputer_d5next-hwmon-dkms — DKMS_KERNEL_MODULE
;;;   Aquacomputer hardware monitoring driver. Requires DKMS + specific kernel.
;;;   A1: package as kernel module → Guix handles kernel modules differently.
;;;   A2: use in-tree driver → may be in mainline kernel already.
;;;   A3: package as Guix kernel config → requires custom kernel build.

;;; amneziawg-dkms-git — DKMS_KERNEL_MODULE
;;;   AmneziaWG kernel module. WireGuard variant with obfuscation.
;;;   A1-A3: Same DKMS analysis. Not in mainline kernel.

;;; ideapad-laptop-tb-dkms — DKMS_KERNEL_MODULE
;;;   Lenovo IdeaPad tablet button driver. Out-of-tree kernel module.
;;;   A1-A3: Same DKMS analysis. Niche hardware driver.

;;; ideapad-laptop-tb2024g6plus-dkms — DKMS_KERNEL_MODULE
;;;   Lenovo IdeaPad 2024 variant driver. Out-of-tree kernel module.
;;;   A1-A3: Same DKMS analysis. Niche hardware driver.

;;; libch343ser-git — DKMS_KERNEL_MODULE
;;;   CH343 USB serial driver. Out-of-tree kernel module.
;;;   A1-A3: Same DKMS analysis. May be in mainline as ch341.

;;; pfring-dkms — DKMS_KERNEL_MODULE
;;;   PF_RING kernel module for high-speed packet capture.
;;;   A1-A3: Same DKMS analysis. Requires specific kernel headers.

;;; r8126-dkms — DKMS_KERNEL_MODULE
;;;   Realtek r8126 network driver. Out-of-tree kernel module.
;;;   A1-A3: Same DKMS analysis. r8169 in mainline may work.

;;; rtl88x2ce-dkms-git — DKMS_KERNEL_MODULE
;;;   Realtek RTL8822CE WiFi driver. Out-of-tree kernel module.
;;;   A1-A3: Same DKMS analysis. rtw88 in mainline supports some models.

;;; nvidia-bl-dkms — DKMS_KERNEL_MODULE
;;;   NVIDIA backlight control. Out-of-tree kernel module.
;;;   A1-A3: Same DKMS analysis. Tied to proprietary NVIDIA driver.

;;; nvidia-open-tinygrad-dkms-git — DKMS_KERNEL_MODULE
;;;   NVIDIA open kernel module for tinygrad. Out-of-tree.
;;;   A1-A3: Same DKMS analysis. Requires NVIDIA GPU + specific kernel.

;;; amneziawg-linux — DKMS_KERNEL_MODULE
;;;   AmneziaWG tools + kernel module for standard kernel.
;;;   A1-A3: Same DKMS analysis.

;;; amneziawg-linux-hardened — DKMS_KERNEL_MODULE
;;;   AmneziaWG for hardened kernel variant.
;;;   A1-A3: Same DKMS analysis.

;;; =========================================================================
;;; BLOCKED — MINGW_CROSS_COMPILATION (10 packages)
;;; =========================================================================

;;; mingw-w64-cblas, mingw-w64-lapack, mingw-w64-soundtouch,
;;; mingw-w64-boost, mingw-w64-cppwinrt, mingw-w64-pcre2,
;;; mingw-w64-spirv-tools, mingw-w64-postgresql, mingw-w64-lame,
;;; mingw-w64-libopenmpt
;;;
;;; All require mingw-w64 cross-compilation toolchain which is not in Guix.
;;; Guix supports cross-compilation but not via the mingw-w64 ABI directly.
;;; A1: package with mingw-w64 toolchain → toolchain not in Guix.
;;; A2: use Guix cross-compilation → different ABI, not compatible.
;;; A3: native Linux versions → already available as regular packages.

;;; =========================================================================
;;; BLOCKED — DISTRO_SPECIFIC (9 packages)
;;; =========================================================================

;;; repacman — Arch pacman wrapper.
;;; archwiki-offline — Arch Wiki offline browser, depends on pacman.
;;; findbrokenpkgs — Finds broken Arch packages, depends on pacman.
;;; sbctl-initcpio-post-hook — Arch initcpio hook for secure boot.
;;; pacpak-git — Pacman wrapper, Arch-specific.
;;; chromium-extension-arch-search — Chrome extension for Arch repos.
;;; pikaur-static — Pacman-based AUR helper (static build).
;;; pikaur-static-git — Git version of pikaur-static.
;;; devtools-git — Arch Linux development tools (depends on makepkg/pacman).
;;;
;;; All depend on pacman (Arch package manager) or Arch-specific infrastructure.
;;; Guix has its own package management model. These are non-functional outside Arch.

;;; =========================================================================
;;; BLOCKED — ABANDONED_UPSTREAM (6 packages)
;;; =========================================================================

;;; deadbeef-mpris2-plugin — Plugin for deadbeef, project inactive since 2020.
;;;   A1: package last commit → depends on deadbeef API that may have changed.
;;;   A2: fork → no active forks exist.
;;;   A3: alternative → deadbeef has built-in MPRIS2 in recent versions.

;;; lightdm-webkit-theme-aether — LightDM webkit theme, last update 2019.
;;;   A1: package as-is → depends on lightdm-webkit2-greeter (not in Guix).
;;;   A2: update → no activity, archived repo.
;;;   A3: alternative → use other greeters in Guix.

;;; texmacs-pure — GNU TeXmacs with Pure language plugin. Pure lang is abandoned.
;;;   A1: package Pure → Pure language interpreter last released 2018, abandoned.
;;;   A2: use TeXmacs without Pure → TeXmacs is in Guix without this plugin.
;;;   A3: alternative → no demand for abandoned Pure language support.

;;; clash-for-windows-chinese — Chinese fork of Clash GUI, original project deleted.
;;;   A1: package from archive → original Clash project DMCA'd and deleted.
;;;   A2: use fork → forks are legally questionable.
;;;   A3: alternative → use other proxy clients.

;;; phonon-qt4-vlc — Phonon VLC backend for Qt4. Qt4 is EOL.
;;;   A1: package with Qt4 → Qt4 removed from Guix, EOL since 2015.
;;;   A2: use Qt5/Qt6 version → different package (phonon-backend-vlc in Guix).
;;;   A3: no demand for Qt4 multimedia backend.

;;; dxvk-async-git — Async shader compilation for DXVK. Fork of DXVK.
;;;   A1: build with Rust → needs specific Rust/meson version + mingw-w64.
;;;   A2: use upstream DXVK → DXVK in Guix without async patch.
;;;   A3: async functionality merged into mainline DXVK recently.

;;; =========================================================================
;;; BLOCKED — PLATFORM_UNSUPPORTED (5 packages)
;;; =========================================================================

;;; bakkesmod-steam — BakkesMod for Rocket League, Windows-only game mod.
;;; android-platform-19 — Android SDK platform API 19, requires Android SDK.
;;; android-platform-21 — Android SDK platform API 21, requires Android SDK.
;;; futu-ftnn-wine — (also PROPRIETARY, listed above)
;;; eddiscovery — Elite Dangerous companion, .NET WPF app (Windows-only UI framework).

;;; =========================================================================
;;; BLOCKED — ARCH_SPECIFIC (5 packages)
;;; =========================================================================

;;; mkinitcpio-systemd-root-password — Arch mkinitcpio hook.
;;; mkinitcpio-clevis-hook — Arch mkinitcpio hook for Clevis/LUKS.
;;; linux-keep-modules — Arch-specific kernel module preservation tool.
;;; python-pypi2pkgbuild — Converts PyPI packages to Arch PKGBUILDs.
;;; glibc-eac — Patched glibc for Easy Anti-Cheat, Arch-specific build.

;;; =========================================================================
;;; BLOCKED — MULTILIB_UNSUPPORTED (5 packages)
;;; =========================================================================

;;; lib32-opencl-nvidia-390xx — 32-bit NVIDIA OpenCL (proprietary + multilib).
;;; lib32-libglade — 32-bit libglade (obsolete GTK2 UI library).
;;; lib32-libxpm — 32-bit libXpm (Guix doesn't do multilib).
;;; lib32-sdl_sound — 32-bit SDL_sound (Guix doesn't do multilib).
;;; lib32-vkbasalt — 32-bit VkBasalt (Guix doesn't do multilib).

;;; =========================================================================
;;; BLOCKED — NON_DISTRIBUTABLE (5 packages)
;;; =========================================================================

;;; ttf-consolas-ligaturized — Microsoft Consolas font with ligatures added.
;;;   Consolas font is proprietary Microsoft, non-redistributable.
;;; ut2004-gog — Unreal Tournament 2004 from GOG. Proprietary game.
;;; unrealtournament4 — Unreal Tournament 4. Proprietary Epic Games.
;;; factorio-space-age-experimental — Factorio DLC. Proprietary Wube Software.
;;; prey — FPS game. Proprietary, requires retail game files.

;;; =========================================================================
;;; BLOCKED — KERNEL_HEADERS (4 packages)
;;; =========================================================================

;;; linux6.18.22-1-lts-bin — Specific kernel version binary package.
;;; zfs-linux-hardened-headers — ZFS headers for hardened kernel.
;;; zfs-linux-rt-headers — ZFS headers for RT kernel.
;;; zfs-linux-git-headers — ZFS headers for git kernel.
;;;
;;; All are tied to specific kernel versions/variants. Guix manages kernels
;;; differently and ZFS has licensing conflicts with GPL.

;;; =========================================================================
;;; BLOCKED — GCC_SNAPSHOT (4 packages)
;;; =========================================================================

;;; libga68-snapshot, libgfortran-snapshot, libgnat-snapshot, libgo-snapshot
;;; All are snapshot libraries from GCC development builds.
;;; A1: package from GCC git → unstable, changes daily.
;;; A2: use stable GCC → already in Guix (gcc 14.2.0).
;;; A3: no demand for unstable GCC snapshot libraries.

;;; =========================================================================
;;; BLOCKED — SELINUX_SPECIFIC (2 packages)
;;; =========================================================================

;;; sudo-selinux — sudo with SELinux support. Guix doesn't use SELinux.
;;; base-selinux — Arch base with SELinux. Guix doesn't use SELinux.

;;; =========================================================================
;;; BLOCKED — LEGACY_PYTHON2 (2 packages)
;;; =========================================================================

;;; python2-gimp — Python 2 GIMP plugins. Python 2 EOL.
;;; boost-python2 — Boost with Python 2 bindings. Python 2 EOL.

;;; =========================================================================
;;; BLOCKED — COMPLEX_DEPS (remaining, 11 packages)
;;; =========================================================================

;;; virtualbox-svn — 67 makedeps, massive project.
;;;   Needs virtualbox-host-dkms, specific kernel modules.
;;; virtualbox-bin-sdk — Requires proprietary VirtualBox binary.
;;; virtualbox-ext-oracle-dev — Oracle proprietary extension pack.
;;; python-home-assistant-frontend — Hundreds of JS deps, massive npm build.
;;; rdt-client — .NET 8.0 web app, ASP.NET Core, ~50 NuGet deps.
;;; gbm — Mesa GBM component, deeply tied to Mesa build system.
;;; mailspring — Electron + npm + grunt, massive npm dependency tree.
;;; freetree-electron-git — Electron + npm, hundreds of JS deps.
;;; texpresso-git — Cargo + libmupdf build, mixed Rust/C, 26+ deps.
;;; gst-plugins-rs-git — Needs cargo-c + vvdec (not in Guix).
;;; wayfire-plugins-extra-git — Needs wayfire (not in Guix).

;;; NOTE: texpresso-git and gst-plugins-rs-git are borderline feasible
;;; but require packaging 1-3 missing dependencies (cargo-c, vvdec) first.
;;; They could be resolved in a future pass.

;;; =========================================================================
;;; BLOCKED — REMAINING (7 packages in other categories)
;;; =========================================================================

;;; lto-dump-snapshot — GCC_SNAPSHOT, same as libg*-snapshot packages.
;;; qt6-xcb-private-headers-git — COMPLEX_DEPS, locked to qt6-base-git commit.
;;; java-openjfx-nowebkit — COMPLEX_DEPS, Java/Gradle 24 makedeps.
;;; php-legacy-pdlib — COMPLEX_DEPS, php-legacy + dlib.
;;; codeblocks-svn — COMPLEX_DEPS, SVN checkout build + 19 deps.
;;; wine-osu-spectator-wow64 — COMPLEX_DEPS, custom Wine 61 makedeps.
;;; systemd-ukify-git — COMPLEX_DEPS, depends on systemd-git 50+ makedeps.
