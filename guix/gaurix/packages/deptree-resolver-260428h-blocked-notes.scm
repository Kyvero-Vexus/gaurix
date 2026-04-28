;;; Blocked notes for deptree-resolver-260428h
;;; 171 BLOCKED packages evaluated (full queue), 0 new recipes,
;;; 6 ALREADY_PACKAGED resolved to DONE,
;;; 1 newly categorized (python-pylink-square → PROPRIETARY_BINARY),
;;; 164 remain BLOCKED across intractable categories.
;;;
;;; Generated: 2026-04-28
;;;
;;; The BLOCKED queue drops from 171 to 165 packages.

;;; === ALREADY_PACKAGED (6 packages — resolved to DONE) ===

;;; synfigstudio-dev — already packaged as `synfigstudio` in upstream Guix
;;;   (gnu packages animation) synfigstudio version 1.5.3.
;;;   AUR synfigstudio-dev is the dev branch of the same software.
;;;   A1: use upstream synfigstudio → works, same version 1.5.3.
;;;   A2: track git HEAD → no value over upstream.
;;;   A3: separate dev package → unnecessary, upstream covers it.

;;; modemmanager-dev — already packaged as `modem-manager` in upstream Guix
;;;   (gnu packages freedesktop) modem-manager version 1.22.0.
;;;   AUR modemmanager-dev is the development branch of ModemManager.
;;;   A1: use upstream modem-manager → works, recent stable release.
;;;   A2: track dev branch → unstable API, no value for packaging.
;;;   A3: separate dev package → unnecessary.

;;; audacious-plugins-git — already packaged as part of `audacious` in upstream Guix
;;;   (gnu packages music) audacious version 4.4.2.
;;;   Guix audacious includes plugins in a bundled build.
;;;   A1: use upstream audacious → works, includes plugins.
;;;   A2: separate plugins → unnecessary, bundled in Guix.
;;;   A3: track git → no value over upstream stable.

;;; sddm-idle — already packaged as `sddm` in upstream Guix
;;;   (gnu packages display-managers) sddm version 0.21.0.
;;;   sddm-idle is the same upstream (github.com/sddm/sddm) with idle timeout.
;;;   A1: use upstream sddm → works, same codebase.
;;;   A2: patch sddm for idle timeout → doable but AUR variant adds no value.
;;;   A3: separate package → unnecessary, sddm provides the functionality.

;;; nheko-scrollfix — already packaged as `nheko` in upstream Guix
;;;   (gnu packages matrix) nheko version 0.12.1.
;;;   nheko-scrollfix is a patched variant with scroll behavior fixes.
;;;   A1: use upstream nheko → works, may include the fix already.
;;;   A2: apply scroll fix patch → trivial patch on upstream nheko if needed.
;;;   A3: separate package → unnecessary duplication.

;;; mesa-minimal-git — already packaged as `mesa` in upstream Guix
;;;   (gnu packages gl) mesa version 25.2.3.
;;;   mesa-minimal-git is a stripped-down mesa from git.
;;;   A1: use upstream mesa → works, full feature set.
;;;   A2: minimal mesa → Guix mesa already configurable via flags.
;;;   A3: track git → unstable, no value over upstream.

;;; === NEWLY CATEGORIZED (1 package) ===

;;; python-pylink-square — PROPRIETARY_BINARY
;;;   Python interface for SEGGER J-Link debugger. Apache-2.0 license.
;;;   Hard dependency on `jlink-software-and-documentation` (proprietary SEGGER software).
;;;   A1: package without J-Link → useless without the hardware interface.
;;;   A2: package J-Link → proprietary, non-redistributable.
;;;   A3: alternative debugger interface → different software entirely.

;;; === BLOCKED — ABANDONED_UPSTREAM (6) ===
;;; deadbeef-mpris2-plugin — Dead upstream, no recent activity, no source repo.
;;; lightdm-webkit-theme-aether — Archived LightDM theme, depends on lightdm-webkit2-greeter.
;;; phonon-qt4-vlc — Phonon backend for Qt4 (EOL, removed from Guix).
;;; texmacs-pure — TeXmacs plugin for Pure language (dead since 2018).
;;; clash-for-windows-chinese — Removed due to legal issues, no legitimate forks.
;;; beignet-git — Intel OpenCL for old GPUs, superseded by NEO, needs Clang 7.0.

;;; === BLOCKED — ARCH_SPECIFIC (5) ===
;;; mkinitcpio-systemd-root-password — mkinitcpio hook, Arch initramfs only.
;;; linux-keep-modules — Arch pacman hook for kernel module preservation.
;;; python-pypi2pkgbuild — Converts PyPI packages to PKGBUILD, pacman-specific.
;;; glibc-eac — Patched system glibc for Easy Anti-Cheat, incompatible with Guix model.
;;; mkinitcpio-clevis-hook — mkinitcpio hook for Clevis/LUKS, Arch initramfs only.

;;; === BLOCKED — COMPLEX_DEPS (35) ===
;;; virtualbox-svn — Needs DKMS kernel modules, VBox not in upstream Guix.
;;; python-home-assistant-frontend — 500+ transitive npm deps.
;;; quartz-utils-git — Crystal language not in Guix.
;;; rdt-client — .NET 9.0 not in Guix.
;;; gbm — Needs mono-basic (VB.NET/Mono), barely supported in Guix.
;;; mailnaggertray-git — Source 404, zbus 5.x unverified.
;;; python-gradio-pdf — Depends on gradio (200+ JS deps).
;;; webcord-vencord-git — Electron not packaged in Guix.
;;; frame-eth — Electron + massive npm deps.
;;; freetube-electron-git — Electron + pnpm, 100+ npm deps.
;;; madness-interactive-reloaded — .NET 9.0 not in Guix.
;;; mobirise — Proprietary + Electron, no source available.
;;; borgwarehouse — Node.js webapp, npm build with massive dep tree.
;;; hnefatafl-copenhagen — Needs Rust >=1.89, Guix has 1.85.1, 80+ crate deps cascade fail.
;;; mailspring — Electron + npm + grunt, massive npm dep tree.
;;; virtualbox-bin-sdk — Requires proprietary VirtualBox binary.
;;; luxtorpeda-git — Needs godot-export-templates-linux, Steam ecosystem.
;;; envoyproxy — Bazel build system not in Guix, 1000+ deps.
;;; opendrop-git — Depends on owlink-git + custom Python deps not in Guix.
;;; betterx-desktop-git — Electron + bun (not in Guix).
;;; illogical-impulse-ags — npm + TypeScript build, many custom deps.
;;; python-jax-rocm — Bazel + ROCm ecosystem, massive dep chain.
;;; goxlr-utility-ui — webkit2gtk complex Rust build + GoXLR ecosystem.
;;; rpfm-git — Qt5 + KDE Frameworks + Rust, mixed build system.
;;; paperde — Depends on wayfire (not in Guix).
;;; xivlauncher-rb — .NET SDK >=10 not in Guix.
;;; openconnect-sso-git — Python poetry + many non-standard deps.
;;; ecal-samples — Depends on ecal (not in Guix).
;;; nyarchassistant — 25+ Python deps including edge-tts, livepng not in Guix.
;;; qgroundcontrol — 37 deps + Qt5 heavy, patchelf-dependent.
;;; darling-cli-devenv-gui-common-git — Darling macOS compat layer, 40+ makedeps.
;;; darling-iosurface-git — Darling macOS compat layer, 40+ makedeps.
;;; shadps4-git — PS4 emulator, needs SDL3 (Guix has SDL2), 27+ makedeps.
;;; waytrogen — 49+ deps + Rust + Meson, extremely many deps.
;;; teb-obs — OBS variant with 58+ deps, complex build.

;;; === BLOCKED — DISTRO_SPECIFIC (11) ===
;;; repacman — Arch pacman wrapper.
;;; archwiki-offline — Arch Wiki offline browser.
;;; findbrokenpkgs — Finds broken packages in pacman database.
;;; sbctl-initcpio-post-hook — Secure Boot for mkinitcpio.
;;; pacpak-git — Pacman/Flatpak integration.
;;; chromium-extension-arch-search — Browser extension for Arch package search.
;;; pamac-cli — Pamac package manager, requires libalpm/pacman.
;;; pikaur-static — AUR helper wrapping pacman.
;;; pikaur-static-git — Git version of pikaur-static.
;;; devtools-git — Arch Linux package maintainer tools.
;;; auracle-git — AUR helper, Arch-specific.

;;; === BLOCKED — DKMS_KERNEL_MODULE (12) ===
;;; aquacomputer_d5next-hwmon-dkms, amneziawg-dkms-git, amneziawg-linux,
;;; amneziawg-linux-hardened, ideapad-laptop-tb-dkms,
;;; ideapad-laptop-tb2024g6plus-dkms, libch343ser-git, pfring-dkms,
;;; r8126-dkms, nvidia-bl-dkms, rtl88x2ce-dkms-git,
;;; nvidia-open-tinygrad-dkms-git
;;; All require host kernel headers/DKMS, incompatible with Guix's functional build.

;;; === BLOCKED — GCC_SNAPSHOT (5) ===
;;; libga68-snapshot, libgfortran-snapshot, libgnat-snapshot, libgo-snapshot,
;;; lto-dump-snapshot
;;; Snapshot GCC library/tool builds requiring lib32-glibc and unstable gcc-git sources.

;;; === BLOCKED — HARDWARE_SPECIFIC (1) ===
;;; kamilsss655-uv-k5-firmware-custom-git — Needs arm-none-eabi cross-compiler.

;;; === BLOCKED — KERNEL_HEADERS (13) ===
;;; linux6.18.22-1-lts-bin — Specific kernel binary.
;;; zfs-linux-hardened-headers — ZFS kernel headers for hardened kernel.
;;; zfs-linux-rt-headers — ZFS kernel headers for RT kernel.
;;; zfs-linux-git-headers — ZFS kernel headers from git.
;;; linux-sched-ext-git-headers — Kernel headers for sched_ext branch.
;;; linux-tip-git-headers — Kernel headers for tip branch.
;;; linux-xanmod-lts-headers — Kernel headers for Xanmod LTS.
;;; linux-cachyos-hardened-headers — CachyOS hardened kernel headers.
;;; linux-next-git-headers — Linux NEXT kernel headers.
;;; linux-covolunablu-gaming-headers — Custom gaming kernel headers.
;;; linux-cachyos-bmq-headers — CachyOS BMQ scheduler kernel headers.
;;; linux-cachyos-eevdf-headers — CachyOS EEVDF scheduler kernel headers.
;;; linux-cachyos-server-headers — CachyOS server kernel headers.

;;; === BLOCKED — LEGACY_PYTHON2 (2) ===
;;; python2-gimp — Python 2 GIMP bindings, Python 2 is EOL.
;;; boost-python2 — Boost with Python 2 bindings, Python 2 is EOL.

;;; === BLOCKED — MINGW_CROSS_COMPILATION (11) ===
;;; mingw-w64-cblas, mingw-w64-lapack, mingw-w64-soundtouch, mingw-w64-boost,
;;; mingw-w64-cppwinrt, mingw-w64-pcre2, mingw-w64-spirv-tools,
;;; dxvk-async-git, mingw-w64-postgresql, mingw-w64-lame,
;;; mingw-w64-libopenmpt

;;; === BLOCKED — MULTILIB_UNSUPPORTED (8) ===
;;; lib32-opencl-nvidia-390xx — 32-bit NVIDIA OpenCL + proprietary.
;;; lib32-libglade — 32-bit deprecated libglade.
;;; lib32-libxpm — 32-bit X11 pixmap library.
;;; lib32-sdl_sound — 32-bit SDL_sound.
;;; lib32-vkbasalt — 32-bit VkBasalt post-processing layer.
;;; capt-src — Canon printer driver needing lib32-libxml2-legacy/lib32-popt.
;;; firestorm-next-bin — Second Life viewer needing lib32 deps.
;;; etlegacy32-mod — 32-bit Enemy Territory mod.

;;; === BLOCKED — NON_DISTRIBUTABLE (6) ===
;;; ttf-consolas-ligaturized — Microsoft font derivative.
;;; ut2004-gog — Commercial game, requires purchase.
;;; unrealtournament4 — Commercial game, Epic exclusive.
;;; factorio-space-age-experimental — Commercial game DLC.
;;; prey — Retail game, 32-bit binary, requires retail files.
;;; ffmpeg-full-git — License: "nonfree-and-unredistributable".

;;; === BLOCKED — PLATFORM_UNSUPPORTED (6) ===
;;; bakkesmod-steam — Windows-only Rocket League mod.
;;; android-platform-19 — Android SDK platform 19.
;;; android-platform-21 — Android SDK platform 21.
;;; futu-ftnn-wine — Windows app via Wine, proprietary.
;;; eddiscovery — Windows .NET app (Elite Dangerous).
;;; aosp-devel — AOSP meta-package, Android ecosystem.

;;; === BLOCKED — PROPRIETARY_BINARY (19) ===
;;; matlab-jre-bundled — MATLAB proprietary JRE.
;;; sipgate-app-clinq — Not in AUR metadata.
;;; squareline-studio — Proprietary UI design tool.
;;; upd72020x-fw-ng — Proprietary Renesas USB firmware.
;;; xairedit — Proprietary audio editor.
;;; simplicity-commander — Proprietary Silicon Labs tool.
;;; brother-mfc-l2400dw — Proprietary printer driver.
;;; knossu — Binary-only game, downloads return 404.
;;; libfprint-2-tod1-broadcom-cv3plus — Proprietary fingerprint driver.
;;; wyc — Proprietary application.
;;; inkdrop — Proprietary Markdown editor.
;;; soapysdrplay3-luarvique-git — Depends on proprietary SDRPlay API.
;;; anytxt-bin — Proprietary Windows search tool.
;;; pianoteq-stage — Proprietary piano VST.
;;; vmd — Proprietary academic license.
;;; nvidia-390xx-settings — Depends on nvidia-390xx-utils (proprietary).
;;; deepin-wine8-stable — Proprietary license.
;;; vmware-workstation — Proprietary VMware.
;;; python-pylink-square — Depends on proprietary jlink-software-and-documentation.

;;; === BLOCKED — PROPRIETARY_CLOSED_SOURCE (2) ===
;;; quartus-free-quartus — Proprietary Intel FPGA tools.
;;; virtualbox-ext-oracle-dev — Oracle PUEL license.

;;; === BLOCKED — SELINUX_SPECIFIC (3) ===
;;; sudo-selinux — SELinux-patched sudo.
;;; base-selinux — SELinux-patched base.
;;; base-devel-selinux — SELinux base-devel meta-package.

;;; === BLOCKED — COMPLEX_DEPS_MOZILLA (3) ===
;;; thunderbird-beta — Mozilla build system, 21+ makedeps, Guix has icedove already.
;;; thunderbird-globalmenu — Patched Thunderbird, 50+ deps, Mozilla build.
;;; ffmpeg-cuda-full — 77+ deps, CUDA (proprietary NVIDIA), nonfree codecs.

;;; === BLOCKED — COMPLEX_DEPS_MISC (9) ===
;;; qt6-xcb-private-headers-git — Version-locked to qt6-base-git specific commit.
;;; veloren — Large Rust game, needs rustup + git-lfs, massive crate tree.
;;; codeblocks-svn — SVN checkout build, needs subversion + 19 deps.
;;; wine-osu-spectator-wow64 — Custom Wine with 61 makedeps, massive build.
;;; java-openjfx-nowebkit — Java/Gradle build, 24 makedeps.
;;; systemd-ukify-git — Depends on systemd-git specific version, 50+ makedeps.
;;; ghostty-git-zen3 — Zig build system not in Guix.
;;; deadbeef-git — Needs libblocksruntime/libdispatch not in Guix.
;;; texpresso-git — Cargo + libmupdf build, 26+ deps.

;;; === BLOCKED — COMPLEX_DEPS_REMAINING (5) ===
;;; scans2any-git — Python app needing python-libnmap + python-partial-json-parser.
;;; php-legacy-pdlib — php-legacy + dlib + 14 deps.
;;; oclint — Static analysis tool, llvm/clang deps, 10+ deps.
;;; gst-plugins-rs-git — Needs cargo-c + vvdec not in Guix.
;;; wayfire-plugins-extra-git — Needs wayfire (not in Guix).
;;;
;;; NOTE: oclint, gst-plugins-rs-git, and wayfire-plugins-extra-git are
;;; borderline feasible but require packaging 1-3 missing dependencies first.
;;; They are marked BLOCKED for this pass but could be RESOLVABLE in a future
;;; pass focused on expanding the Guix dependency base.
