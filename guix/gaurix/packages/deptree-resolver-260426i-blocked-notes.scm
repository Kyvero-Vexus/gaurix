;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Blocked notes for deptree-resolver-260426i
;;;
;;; 100 packages evaluated from the top-100 priority queue.
;;; 6 resolved with recipes from the queue + 5 bonus from extended queue.
;;; 94 remain BLOCKED with documented reasons.
;;;
;;; === MISSING_SOURCE (5) ===
;;; Not found in AUR metadata cache; package may be deleted or renamed.
;;; gradience (#18644): Not in AUR cache.  GNOME/libadwaita theming app
;;;   (GradienceTeam/Gradience on GitHub); project archived or removed from AUR.
;;;   A1: Search for fork or successor — no active fork found.
;;;   A2: Package from GitHub archive — project abandoned, no recent releases.
;;;   A3: Skip — defunct project.
;;; deadbeef-mpris2-plugin (#19282): Not in AUR cache.  MPRIS2 plugin for
;;;   DeaDBeeF; likely merged into main package or abandoned.
;;;   A1: Check if included in deadbeef core — unclear, deadbeef-git has MPRIS.
;;;   A2: Package standalone — no source found in AUR.
;;;   A3: Skip — functionality likely integrated into deadbeef.
;;; linux6.18.22-1-lts-bin (#37932): Not in AUR cache.  Ephemeral kernel
;;;   binary package for a specific kernel version that has expired.
;;;   A1: Package current LTS kernel — Guix already has linux-libre.
;;;   A2: Find successor package — version-pinned kernel packages are transient.
;;;   A3: Skip — ephemeral package.
;;; matlab-jre-bundled (#19363): Not in AUR cache.  MATLAB Java runtime bundle;
;;;   removed from AUR due to MATLAB licensing.
;;;   A1: Bundle JRE with MATLAB package — MATLAB itself is proprietary.
;;;   A2: Provide JRE separately — Guix already has OpenJDK.
;;;   A3: Skip — proprietary ecosystem.
;;; sipgate-app-clinq (#18449): Not in AUR cache.  Sipgate VoIP app; removed.
;;;   A1: Check for web version — sipgate now web-only.
;;;   A2: Package Electron wrapper — no source available.
;;;   A3: Skip — removed from AUR.
;;;
;;; === SELINUX_SPECIFIC (1) ===
;;; base-selinux (#18537): Arch SELinux meta-package; full SELinux stack.
;;;   Not applicable to Guix which does not use SELinux.
;;;   A1: Package individual SELinux variants — 15+ packages, no demand.
;;;   A2: Provide wrapper meta-package — no SELinux in Guix kernel.
;;;   A3: Skip — fundamentally incompatible with Guix model.
;;;
;;; === DKMS_KERNEL_MODULE (9) ===
;;; All require DKMS, incompatible with Guix's immutable kernel model.
;;; aquacomputer_d5next-hwmon-dkms (#18606): Aquacomputer HWMON driver.
;;; amneziawg-dkms-git (#18642): AmneziaWG VPN kernel module.
;;; faustus-dkms-git (#18859): ASUS TUF fan control DKMS driver.
;;; ideapad-laptop-tb-dkms (#18957): Lenovo ThinkBook DKMS driver.
;;; ideapad-laptop-tb2024g6plus-dkms (#18895): Lenovo 2024 G6+ DKMS driver.
;;; pfring-dkms (#18399): PF_RING network monitoring DKMS module.
;;; r8126-dkms (#18487): Realtek RTL8126 ethernet DKMS driver.
;;; rtl88x2ce-dkms-git (#18362): Realtek WiFi DKMS driver.
;;; nvidia-open-tinygrad-dkms-git (#18617): NVIDIA open kernel modules tinygrad.
;;;   Common attempts: A1: Build as out-of-tree .ko — Guix kernel is immutable.
;;;   A2: Custom kernel config — per-user, not distributable.
;;;   A3: linux-module-build-system — does not exist in Guix.
;;;
;;; === KERNEL_MODULE (5) ===
;;; Out-of-tree kernel modules or kernel-specific headers.
;;; amneziawg-linux (#18452): AmneziaWG VPN kernel module.
;;; amneziawg-linux-hardened (#18382): AmneziaWG for hardened kernel.
;;; zfs-linux-hardened-headers (#17921): ZFS headers for hardened kernel.
;;; zfs-linux-rt-headers (#17920): ZFS headers for RT kernel.
;;; zfs-linux-git-headers (#17919): ZFS headers for git kernel.
;;;   Common attempts: A1: Build against Guix linux-libre headers — kernel module
;;;   loading not supported.  A2: Custom kernel config — per-user build.
;;;   A3: Skip — Guix kernel model incompatible.
;;;
;;; === DISTRO_SPECIFIC (12) ===
;;; Tightly coupled to Arch Linux pacman/mkinitcpio/ALPM infrastructure.
;;; mkinitcpio-systemd-root-password (#18371): mkinitcpio hook.
;;; repacman (#18707): Produces pacman packages.
;;; findbrokenpkgs (#18930): Uses pacman database.
;;; sbctl-initcpio-post-hook (#18720): mkinitcpio Secure Boot hook.
;;; linux-keep-modules (#18490): Pacman hook for kernel modules.
;;; pacpak-git (#17862): Pacman wrapper for Flatpak.
;;; chromium-extension-arch-search (#17897): Arch Wiki browser extension.
;;; python-pypi2pkgbuild (#17822): PyPI to Arch PKGBUILD converter.
;;; archwiki-offline (#18568): Depends on arch-wiki-docs.
;;; coreutils-arch (#18690): Just the GNU arch command (Guix has full coreutils).
;;; pikaur-static (#18750): AUR helper (pacman-based).
;;; pikaur-static-git (#18749): AUR helper git version.
;;;   Common attempts: A1: Port functionality — requires pacman infrastructure.
;;;   A2: Reimplement — different tool, not a port.
;;;   A3: Skip — Arch-specific tools have no Guix equivalent.
;;; mkinitcpio-clevis-hook (#18342): mkinitcpio hook for LUKS+clevis+TPM.
;;;   Arch-specific initramfs hook.
;;;   A1: Adapt for Guix initrd — Guix uses different initrd system.
;;;   A2: Port clevis integration — requires Guix initrd service.
;;;   A3: Skip — fundamentally different boot infrastructure.
;;;
;;; === NPM_COMPLEX (9) ===
;;; Node.js packages requiring extensive npm dependency trees not in Guix.
;;; edgeimpulse-cli (#18574): Edge Impulse IoT CLI; npm with native deps.
;;; nodejs-cspell (#18215): Code spell checker; 200+ npm deps.
;;; osmtogeojson (#18417): OSM-to-GeoJSON converter; ~25 npm deps.
;;; emmet-language-server (#18958): Emmet LSP; ~25 npm deps.
;;; aws-amplify-cli (#18269): AWS Amplify CLI; massive npm dep tree.
;;; aws-cdk (#18298): AWS CDK CLI; massive npm dep tree.
;;; nodejs-nestjs-cli (#18753): NestJS CLI; npm + TypeScript.
;;;   Common attempts: A1: node-build-system — requires packaging 25-200+ npm
;;;   deps individually.  A2: Bundled node_modules — violates Guix reproducibility.
;;;   A3: Pre-built binary — node binaries not portable across systems.
;;; open-tv (#18368): Tauri app (Rust + npm frontend); requires Tauri framework
;;;   and npm build step for Angular frontend.
;;;   A1: cargo-build-system — Tauri requires npm for frontend.
;;;   A2: Pre-built AppImage — violates Guix model.
;;;   A3: Separate frontend/backend builds — npm frontend still blocks.
;;; frame-eth (#18612): Electron Web3 wallet; massive npm dep tree.
;;;   A1: node-build-system — 100+ npm deps.
;;;   A2: Pre-built binary — Electron binary portability issues.
;;;   A3: Skip — Electron+npm ecosystem.
;;;
;;; === ELECTRON_APP (3) ===
;;; Electron apps requiring npm build infrastructure.
;;; rocketchat-desktop (#18807): Rocket.Chat Electron client.
;;; webcord-vencord-git (#18852): Discord client (Electron).
;;; freetube-electron-git (#17925): Private YouTube client (Electron).
;;;   Common attempts: A1: node-build-system — 100+ npm deps.
;;;   A2: Pre-built AppImage with copy-build-system — ships opaque binary.
;;;   A3: Patchelf on pre-built — Electron binaries link against specific libs.
;;;
;;; === PROPRIETARY_BINARY (6) ===
;;; Proprietary, non-redistributable, or unknown-license binaries.
;;; luniistore (#18478): French children's storyteller app; proprietary binary.
;;; simplicity-commander (#18419): Silicon Labs debug tool; depends on
;;;   proprietary jlink-software-and-documentation.
;;; anytxt-bin (#18295): Desktop search tool; freeware, Windows via Wine.
;;; pianoteq-stage (#18367): Proprietary piano instrument; custom license.
;;; vmd (#18253): Visual Molecular Dynamics; custom academic license.
;;; mobirise (#18357): Proprietary website builder; custom license.
;;;   Common attempts: A1: Repackage binary — license prohibits redistribution.
;;;   A2: Build from source — no source available.
;;;   A3: Skip — proprietary software.
;;;
;;; === MINGW_CROSS (2) ===
;;; MinGW Windows cross-compilation packages.
;;; mingw-w64-soundtouch (#18330): MinGW SoundTouch.
;;; mingw-w64-lame (#34112): MinGW LAME MP3 encoder.
;;;   A1: Guix cross-compilation to Windows — not well-supported.
;;;   A2: Package native versions instead — already in Guix.
;;;   A3: Skip — Windows-target cross builds.
;;;
;;; === NON_DISTRIBUTABLE (2) ===
;;; Cannot be redistributed.
;;; receitanet (#18413): Brazilian tax software; custom gov license.
;;;   A1: Repackage JAR — license prohibits redistribution.
;;;   A2: Download script — not a real package.
;;;   A3: Skip — government software, redistribution blocked.
;;; ut2004-gog (#18333): Requires GOG purchase for game data.
;;;   A1: Engine-only — useless without data.
;;;   A2: Download script — requires purchase.
;;;   A3: Skip — commercial game.
;;;
;;; === WINE_WRAPPER (2) ===
;;; fileoptimizer-bin (#18315): Windows optimizer via Wine.
;;; dxvk-async-git (#18820): DXVK fork; requires MinGW cross-compilation.
;;;   Not just a Wine wrapper but needs Windows DLLs built from source.
;;;   A1: meson with mingw cross-files — Guix doesn't support Windows targets.
;;;   A2: Pre-built binaries — no releases for async fork.
;;;   A3: Skip — Windows cross-compilation required.
;;;
;;; === OBSOLETE_DEPS (2) ===
;;; knossu (#18461): Requires glew1.10 and libpng12 (both EOL).
;;;   A1: Patch binary — proprietary, can't rebuild.
;;;   A2: Provide compat libs — known CVEs.
;;;   A3: Skip — obsolete dependencies.
;;; phonon-qt4-vlc (#18938): Requires Qt4 (EOL since 2015).
;;;   A1: Build against Qt5/6 — wrong package (Qt5 version is separate).
;;;   A2: Package Qt4 — massive EOL framework.
;;;   A3: Skip — Qt4 ecosystem dead.
;;;
;;; === BUILD_SYSTEM_TOO_COMPLEX (8) ===
;;; java-language-server (#18379): Maven build; 14+ transitive Java deps.
;;;   A1: maven-build-system — not in Guix.
;;;   A2: ant-build-system — can't handle Maven POM.
;;;   A3: Pre-built JAR — no official releases.
;;; eclipse-pydev (#17948): Eclipse OSGI bundle; requires Eclipse PDE.
;;;   A1: copy-build-system with pre-built — depends on Eclipse (not in Guix).
;;;   A2: Build from source — requires Eclipse PDE.
;;;   A3: Skip — Eclipse ecosystem not in Guix.
;;; gephi-git (#18898): Maven build; ~20 Java deps.
;;;   A1: maven-build-system — not in Guix.
;;;   A2: Pre-built binary — no official Linux binary.
;;;   A3: Skip — Maven ecosystem.
;;; rdt-client (#18561): .NET 8 web app; .NET SDK partially in Guix but
;;;   NuGet dependency resolution is not well-supported.
;;;   A1: dotnet-build-system — limited Guix support.
;;;   A2: Self-contained publish — needs full .NET framework.
;;;   A3: Skip — .NET ecosystem.
;;; logstash (#18911): Complex Java/JRuby app (Elastic Stack).
;;;   A1: ant-build-system — uses Gradle, not Ant.
;;;   A2: Pre-built tarball — ships bundled JRuby.
;;;   A3: Skip — complex Java/JRuby build pipeline.
;;; obs-plugin-input-overlay-git (#18383): Needs libuiohook (not in Guix).
;;;   A1: Package libuiohook first — additional package needed.
;;;   A2: Build without input overlay — defeats purpose.
;;;   A3: Skip until libuiohook packaged — blocking dependency.
;;; boost-python2 (#37225): Boost.Python for Python 2; Python 2 is EOL.
;;;   A1: Build against Python 2 — Python 2 support removed from Guix.
;;;   A2: Use Boost.Python for Python 3 — already in Guix.
;;;   A3: Skip — Python 2 is EOL.
;;; lib32-sdl_sound (#22729): 32-bit SDL_sound; multilib not well-supported.
;;;   A1: Cross-compile for i686 — Guix cross-compilation model differs.
;;;   A2: Package 64-bit version — already in Guix.
;;;   A3: Skip — 32-bit variant.
;;;
;;; === MISSING_DEPS (8) ===
;;; libfprint-2-tod1-broadcom-cv3plus (#17912): Proprietary fingerprint driver.
;;; texmacs-pure (#17873): Requires Pure language + LLVM 3.5 (unavailable).
;;; nfuspire-git (#18401): Requires libnspire (not in Guix).
;;; gbm (#19044): Requires mono-basic (VB.NET, Mono not in Guix).
;;; soapysdrplay3-luarvique-git (#18141): Requires proprietary libsdrplay.
;;; kamilsss655-uv-k5-firmware-custom-git (#17909): Requires arm-none-eabi
;;;   cross-toolchain (bare-metal, not Linux cross-compilation).
;;; plugin-autenticacao-gov-pt (#18557): Binary-only; no source available.
;;; eddiscovery (#18320): Requires Mono runtime + msbuild (not in Guix).
;;;   Common attempts: A1: Package missing dep — too complex or proprietary.
;;;   A2: Find alternative — no equivalent.
;;;   A3: Skip — blocking dependency.
;;;
;;; === COMPLEX_BUILD (7) ===
;;; libarchive-static (#18758): Static musl build; Guix musl is for cross-comp.
;;;   A1: gnu-build-system with musl — not for native static builds.
;;;   A2: Modify existing libarchive — upstream uses glibc.
;;;   A3: Skip — Guix already has libarchive (dynamic).
;;; quartz-utils-git (#18430): Crystal language; no Crystal compiler in Guix.
;;;   A1: crystal-build-system — doesn't exist in Guix.
;;;   A2: Package Crystal — massive bootstrapping effort.
;;;   A3: Skip — Crystal ecosystem not in Guix.
;;; python-gradio-pdf (#18463): Depends on python-gradio (100+ Python deps).
;;;   A1: Package gradio ecosystem — 100+ packages.
;;;   A2: Minimal stub — defeats purpose.
;;;   A3: Skip — massive dep chain.
;;; python-jaxlib-bin (#18474): Binary wheel with native XLA/LLVM code.
;;;   A1: Install wheel — native .so files link to wrong paths.
;;;   A2: Build from source — requires Bazel + XLA (not in Guix).
;;;   A3: Patchelf — 50+ .so files with complex interdependencies.
;;; python-home-assistant-frontend (#18556): 110MB opaque JS bundle.
;;;   A1: pyproject with wheel — violates source-bootstrapping.
;;;   A2: Build from source — needs 100s of npm packages.
;;;   A3: Skip — opaque JS bundle, Python 3.14 needed.
;;; vscodium-marketplace (#18695): Depends on vscodium (not in Guix standard).
;;;   A1: Package vscodium — massive Electron app.
;;;   A2: Patch script only — useless without vscodium.
;;;   A3: Skip — depends on unpackaged Electron IDE.
;;; linux-gpib (#20547): Kernel module + userspace library combo.
;;;   A1: Userspace lib only — still depends on kernel module.
;;;   A2: Full kernel module — incompatible with Guix.
;;;   A3: Skip — DKMS + kernel module.
;;;
;;; === GLIBC_REPLACEMENT (1) ===
;;; glibc-eac (#24719): Patched glibc adding DT_HASH for EasyAntiCheat games.
;;;   Extremely dangerous to replace system glibc.
;;;   A1: Alternate glibc package — conflicts with store integrity.
;;;   A2: LD_PRELOAD wrapper — requires deep ELF internals.
;;;   A3: Container with modified glibc — Guix lacks mechanism.
;;;
;;; === GAME_NON_DISTRIBUTABLE (1) ===
;;; urbanterror (#18814): GPL engine but proprietary game data (~1.4GB).
;;;   A1: Package engine only — useless without data.
;;;   A2: Mixed distribution — non-distributable data.
;;;   A3: Skip — game data cannot be redistributed.
;;; unrealtournament4 (#18319): Epic Games proprietary.
;;;   A1-A3: Proprietary, requires Epic account.
;;;
;;; === OTHER BLOCKED (8) ===
;;; plank-reloaded-docklet-picky-git (#18397): Depends on plank-reloaded
;;;   (not in Guix).  A1: Package plank first — additional project.
;;;   A2: Skip until plank packaged.  A3: Use alternative dock.
;;; wayprompt-git (#18262): Written in Zig; Zig compiler not in Guix.
;;;   A1: zig-build-system — doesn't exist.  A2: Package Zig — complex
;;;   self-hosting compiler.  A3: Skip until Zig in Guix.
;;; emerald (#22333): Requires compiz-core (not in Guix).
;;;   A1: Package compiz — substantial effort.  A2: Skip until compiz packaged.
;;;   A3: Use other window decorators.
;;; xeme-hg (#18426): Mercurial source; depends on birb library (not in Guix).
;;;   A1: Package birb first — additional obscure library.
;;;   A2: Use hg-fetch — Guix supports but birb still missing.
;;;   A3: Skip until birb packaged.
;;; anyrun-git (#17933): Rust Wayland launcher; GTK4 bindings + plugin system.
;;;   A1: cargo-build-system — needs many Rust GTK4 binding crates not vendored.
;;;   A2: Pre-built binary — no official releases.
;;;   A3: Vendor all crate deps — very large dep tree, feasible but tedious.
;;; lib32-vkbasalt (#18688): 32-bit Vulkan post-processing layer.
;;;   A1: Package 64-bit first, then cross-compile 32-bit.
;;;   A2: Native 32-bit build — multilib not well-supported.
;;;   A3: Skip 32-bit variant — package 64-bit only.
;;; wyc (#18777): Commercial Chinese port mapping service.
;;;   A1: Repackage binary — commercial license.
;;;   A2: Build from source — no source.
;;;   A3: Skip — commercial software.
;;; madness-interactive-reloaded (#18618): .NET 9 game; Guix has .NET 8 only.
;;;   A1: Build with .NET 8 — requires .NET 9 SDK.
;;;   A2: Pre-built binary — .NET self-contained publish.
;;;   A3: Skip until .NET 9 in Guix.
;;;
;;; === SUMMARY ===
;;; Total evaluated: 100 (from priority queue) + 5 bonus from extended queue
;;; New recipes: 11 (6 from queue + 5 from extended queue)
;;; Remaining BLOCKED: 94
;;;
;;; Breakdown of blockers:
;;;   DKMS/kernel modules: 14 (9 DKMS + 5 kernel)
;;;   Distro-specific (Arch): 13
;;;   NPM/Electron complex: 12 (9 npm + 3 Electron)
;;;   Build system too complex: 8
;;;   Missing deps: 8
;;;   Complex build: 7
;;;   Proprietary binary: 6
;;;   Missing AUR source: 5
;;;   MinGW cross: 2
;;;   Non-distributable: 2
;;;   Wine wrapper: 2
;;;   Obsolete deps: 2
;;;   SELinux: 1
;;;   glibc replacement: 1
;;;   Game data non-distributable: 2
;;;   Other (missing Zig/Compiz/plank/birb/.NET9/etc.): 8
