;;; Blocked notes for deptree-resolver-260428g
;;; 100 BLOCKED packages evaluated, 0 new recipes,
;;; 1 ALREADY_PACKAGED (libfive-studio-git → upstream libfive),
;;; 0 newly categorized (all categories confirmed from 260428f),
;;; 99 remain BLOCKED.
;;;
;;; Generated: 2026-04-28
;;;
;;; The BLOCKED queue is now 171 packages (down from 172 at deptree-resolver-260428f).
;;; libfive-studio-git resolved: upstream Guix `libfive` package includes Studio GUI.
;;; All other remaining packages are in permanently intractable categories.

;;; === ALREADY_PACKAGED (1 package) ===
;;; libfive-studio-git — already packaged as `libfive` in upstream Guix
;;;   (gnu packages engineering) libfive version 0-5.b1ea998 includes Studio GUI.
;;;   Previous categorization as SOURCE_UNAVAILABLE was incorrect — source is
;;;   at https://github.com/libfive/libfive and the upstream Guix package builds
;;;   the full project including the Studio binary.
;;;   A1: inherit from upstream libfive → works, Studio is already built.
;;;   A2: track git HEAD → feasible but upstream Guix pinned commit suffices.
;;;   A3: separate Studio-only package → unnecessary, upstream includes it.

;;; === BLOCKED — ABANDONED_UPSTREAM (6) ===
;;; deadbeef-mpris2-plugin — Dead upstream, no recent activity.
;;;   A1: Package last release → no source repo found, not in AUR metadata.
;;;   A2: Fork and maintain → no forks exist with continued development.
;;;   A3: Alternative MPRIS plugin → different software, out of scope.
;;;
;;; lightdm-webkit-theme-aether — Abandoned LightDM theme.
;;;   A1: Build from source → upstream archived/inactive.
;;;   A2: Fork → no active forks, LightDM themes moving to other frameworks.
;;;   A3: Repackage as static files → depends on lightdm-webkit2-greeter, not in Guix.
;;;
;;; phonon-qt4-vlc — Phonon backend for Qt4 (EOL).
;;;   A1: Build with Qt4 → Qt4 is EOL and removed from Guix.
;;;   A2: Port to Qt5/6 → that would be phonon-vlc, different package.
;;;   A3: Compat layer → no Qt4 compat possible in Guix.
;;;
;;; texmacs-pure — TeXmacs plugin for Pure language.
;;;   A1: Package with TeXmacs → Pure language is dead (last release 2018).
;;;   A2: Update to modern Pure → no modern Pure exists.
;;;   A3: Alternative CAS integration → different software entirely.
;;;
;;; clash-for-windows-chinese — Chinese-localized Clash GUI (takedown).
;;;   A1: Build from source → project removed due to legal issues.
;;;   A2: Alternative fork → no legitimate forks available.
;;;   A3: Different Clash GUI → different software, out of scope.
;;;
;;; beignet-git — Intel OpenCL for IvyBridge/Haswell (superseded by NEO).
;;;   A1: Build from source → depends on clang70 (Clang 7.0), not in Guix.
;;;   A2: Update to modern Clang → Intel deprecated beignet, code won't build.
;;;   A3: Use Intel NEO instead → different package (intel-compute-runtime).

;;; === BLOCKED — ARCH_SPECIFIC (5) ===
;;; mkinitcpio-systemd-root-password — mkinitcpio hook, Arch initramfs only.
;;; linux-keep-modules — Arch pacman hook for kernel module preservation.
;;; python-pypi2pkgbuild — Converts PyPI packages to PKGBUILD, pacman-specific.
;;; glibc-eac — Patched system glibc for Easy Anti-Cheat DT_HASH.
;;;   A1: Package as-is → replaces system glibc, incompatible with Guix model.
;;;   A2: Separate library → EAC checks system glibc specifically.
;;;   A3: LD_PRELOAD wrapper → EAC validates glibc identity, won't work.
;;; mkinitcpio-clevis-hook — mkinitcpio hook for Clevis/LUKS, Arch initramfs only.

;;; === BLOCKED — COMPLEX_DEPS (13) ===
;;; virtualbox-svn — 53 deps, needs VIRTUALBOX-HOST-MODULES-SVN (DKMS kernel module).
;;;   A1: Build without kernel modules → VBox is useless without them.
;;;   A2: Guix has virtualbox? → No, not in upstream Guix.
;;;   A3: Binary repack → needs kernel modules regardless.
;;;
;;; python-home-assistant-frontend — Massive Node.js/webpack build.
;;;   A1: node-build-system → 500+ transitive npm deps, each needs Guix package.
;;;   A2: Pre-built wheel from PyPI → wheel includes bundled JS, but not a Guix approach.
;;;   A3: Vendored build → needs network for npm install, blocked in sandbox.
;;;
;;; quartz-utils-git — Crystal language CLI utilities.
;;;   A1: crystal-build-system → Crystal not in Guix.
;;;   A2: Bootstrap Crystal → self-hosting compiler, multi-month effort.
;;;   A3: Rewrite in supported language → out of scope (not same software).
;;;
;;; rdt-client — Real-Debrid Torrent Client, .NET 9.0 application.
;;;   A1: dotnet-build-system → .NET not in Guix.
;;;   A2: Binary repack → needs aspnet-runtime-9.0, not in Guix.
;;;   A3: Container/flatpak approach → not a Guix packaging pattern.
;;;
;;; gbm — Game Backup Monitor, depends on mono-basic (VB.NET/Mono).
;;;   A1: Build with Mono → mono-basic not in Guix (Mono itself barely supported).
;;;   A2: Binary repack → still needs Mono runtime for VB.NET.
;;;   A3: Port to C#/.NET → different software, out of scope.
;;;
;;; mailnaggertray-git — Rust tray app for mailnagger.
;;;   A1: cargo-build-system → uses edition 2024, compiles might work with Rust 1.85.
;;;   A2: Depends on mailnagger daemon → source is 404, not publicly available.
;;;   A3: Use mailnag (Python) as backend → requires patching + packaging mailnag.
;;;   Still blocked: mailnagger/mailnag not available + zbus 5.x unverified on Rust 1.85.
;;;
;;; python-gradio-pdf — Python Gradio component for PDF display.
;;;   A1: pyproject-build-system → depends on python-gradio (massive npm/JS build).
;;;   A2: Package gradio first → 200+ transitive JS deps, npm ecosystem.
;;;   A3: Minimal install without frontend → Gradio is inherently frontend-heavy.
;;;
;;; webcord-vencord-git — Electron Discord client.
;;;   A1: Electron in Guix → electron not packaged in Guix.
;;;   A2: npm build → 100+ npm deps, network-dependent build.
;;;   A3: Binary AppImage repack → no official AppImage, Electron dep remains.
;;;
;;; frame-eth — Electron Ethereum wallet.
;;;   A1: npm/node-build-system → needs nvm, node-gyp, massive npm deps.
;;;   A2: Binary repack → no standalone binary distribution.
;;;   A3: Alternative wallet → different software, out of scope.
;;;
;;; freetube-electron-git — Electron YouTube client.
;;;   A1: Electron in Guix → electron not packaged.
;;;   A2: pnpm build → needs network, 100+ npm deps.
;;;   A3: Binary AppImage → Guix has freetube in nonguix, but AUR -git variant needs electron.
;;;
;;; madness-interactive-reloaded — .NET 9.0 game.
;;;   A1: dotnet-build-system → .NET not in Guix.
;;;   A2: Binary repack → needs dotnet-runtime-9.0, not in Guix.
;;;   A3: Native build → game uses .NET exclusively.
;;;
;;; mobirise — Website builder, Electron/proprietary (custom license, out-of-date).
;;;   A1: Package binary → custom proprietary license, non-redistributable.
;;;   A2: Build from source → no source available (proprietary).
;;;   A3: Electron build → proprietary + no source.
;;;
;;; hnefatafl-copenhagen — Rust board game, needs Rust >=1.89.
;;;   A1: cargo-build-system → requires rust-version = "1.89"+, Guix has 1.85.1.
;;;   A2: Older version → oldest tag (v5.0.0-4) already requires Rust 1.89.
;;;   A3: Patch rust-version → 80+ crate deps also need Rust >1.85, cascade failure.

;;; === BLOCKED — DISTRO_SPECIFIC (9) ===
;;; repacman — Arch pacman wrapper, fundamentally Arch-only.
;;; archwiki-offline — Arch Wiki offline browser, Arch-specific content.
;;; findbrokenpkgs — Finds broken packages in pacman database.
;;; sbctl-initcpio-post-hook — Secure Boot for mkinitcpio, Arch initramfs only.
;;; pacpak-git — Pacman/Flatpak integration, requires pacman.
;;; chromium-extension-arch-search — Browser extension for Arch package search.
;;; pamac-cli — Pamac package manager CLI, requires libalpm/pacman.
;;; pikaur-static — AUR helper wrapping pacman.
;;; pikaur-static-git — Git version of pikaur-static.

;;; === BLOCKED — DKMS_KERNEL_MODULE (12) ===
;;; aquacomputer_d5next-hwmon-dkms, amneziawg-dkms-git, amneziawg-linux,
;;; amneziawg-linux-hardened, ideapad-laptop-tb-dkms,
;;; ideapad-laptop-tb2024g6plus-dkms, libch343ser-git, pfring-dkms,
;;; r8126-dkms, nvidia-bl-dkms, rtl88x2ce-dkms-git,
;;; nvidia-open-tinygrad-dkms-git
;;; All require host kernel headers/DKMS, incompatible with Guix's functional build.

;;; === BLOCKED — GCC_SNAPSHOT (4) ===
;;; libga68-snapshot, libgfortran-snapshot, libgnat-snapshot, libgo-snapshot
;;; Snapshot GCC library builds requiring lib32-glibc and unstable gcc-git sources.

;;; === BLOCKED — HARDWARE_SPECIFIC (1) ===
;;; kamilsss655-uv-k5-firmware-custom-git — Needs arm-none-eabi cross-compiler.
;;;   A1: Cross-compile in Guix → arm-none-eabi-gcc not in Guix.
;;;   A2: Package arm-none-eabi toolchain → major bootstrapping effort.
;;;   A3: Pre-built firmware binary → defeats purpose of custom firmware builder.

;;; === BLOCKED — KERNEL_HEADERS (4) ===
;;; linux6.18.22-1-lts-bin — Specific kernel binary, not applicable to Guix.
;;; zfs-linux-hardened-headers — ZFS kernel headers for hardened kernel.
;;; zfs-linux-rt-headers — ZFS kernel headers for RT kernel.
;;; zfs-linux-git-headers — ZFS kernel headers from git.

;;; === BLOCKED — LEGACY_PYTHON2 (2) ===
;;; python2-gimp — Python 2 GIMP bindings, Python 2 is EOL and removed from Guix.
;;; boost-python2 — Boost with Python 2 bindings, Python 2 is EOL.

;;; === BLOCKED — MINGW_CROSS_COMPILATION (10) ===
;;; mingw-w64-cblas, mingw-w64-lapack, mingw-w64-soundtouch, mingw-w64-boost,
;;; mingw-w64-cppwinrt, mingw-w64-pcre2, mingw-w64-spirv-tools,
;;; dxvk-async-git, mingw-w64-postgresql, mingw-w64-lame
;;; All require mingw-w64 cross-compilation toolchain, not available in Guix.

;;; === BLOCKED — MULTILIB_UNSUPPORTED (5) ===
;;; lib32-opencl-nvidia-390xx — 32-bit NVIDIA OpenCL (also proprietary).
;;; lib32-libglade — 32-bit libglade (deprecated + Python2 build dep).
;;; lib32-libxpm — 32-bit X11 pixmap library.
;;; lib32-sdl_sound — 32-bit SDL_sound.
;;; lib32-vkbasalt — 32-bit VkBasalt post-processing layer.
;;; Guix does not support 32-bit multilib (lib32) packages.

;;; === BLOCKED — NON_DISTRIBUTABLE (5) ===
;;; ttf-consolas-ligaturized — Microsoft font derivative, non-redistributable.
;;; ut2004-gog — Commercial game, requires retail purchase.
;;; unrealtournament4 — Commercial game, Epic Games exclusive.
;;; factorio-space-age-experimental — Commercial game DLC, requires purchase.
;;; prey — Retail game, 32-bit binary only, requires retail files.

;;; === BLOCKED — PLATFORM_UNSUPPORTED (5) ===
;;; bakkesmod-steam — Windows-only Rocket League mod.
;;; android-platform-19 — Android SDK platform 19, Android ecosystem only.
;;; android-platform-21 — Android SDK platform 21, Android ecosystem only.
;;; futu-ftnn-wine — Windows app via Wine, proprietary.
;;; eddiscovery — Windows .NET app (Elite Dangerous companion).

;;; === BLOCKED — PROPRIETARY_BINARY (14) ===
;;; matlab-jre-bundled — MATLAB proprietary JRE.
;;; sipgate-app-clinq — Not in AUR metadata (MISSING_SOURCE).
;;; squareline-studio — Proprietary UI design tool.
;;; upd72020x-fw-ng — Proprietary Renesas USB firmware.
;;; xairedit — Proprietary audio editor.
;;; simplicity-commander — Proprietary Silicon Labs tool.
;;; brother-mfc-l2400dw — Proprietary printer driver.
;;; knossu — Binary-only game, downloads return 404.
;;;   A1: Repackage binary → download links return HTTP 404, files gone.
;;;   A2: Build from source → no source code exists (binary-only release).
;;;   A3: Contact author → game abandoned since 2015, no contact info.
;;; libfprint-2-tod1-broadcom-cv3plus — Proprietary fingerprint driver.
;;; wyc — Proprietary application.
;;; inkdrop — Proprietary Markdown editor.
;;; soapysdrplay3-luarvique-git — Depends on proprietary SDRPlay API.
;;; anytxt-bin — Proprietary Windows search tool.
;;; pianoteq-stage — Proprietary piano VST, requires license.
;;; vmd — Visual Molecular Dynamics, proprietary academic license.

;;; === BLOCKED — SELINUX_SPECIFIC (2) ===
;;; sudo-selinux — SELinux-patched sudo, requires Arch SELinux ecosystem.
;;; base-selinux — SELinux-patched base, requires Arch SELinux ecosystem.
