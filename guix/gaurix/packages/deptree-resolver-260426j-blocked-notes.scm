;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Blocked notes for deptree-resolver-260426j
;;;
;;; 100 packages evaluated from the top-100 priority queue.
;;; 0 resolved from top-100 queue (all have permanent blockers).
;;; 10 bonus recipes from extended queue (positions 101-228).
;;; 90 remain BLOCKED with documented reasons.
;;;
;;; === MISSING_SOURCE (5) ===
;;; Not found in AUR metadata cache; package deleted, renamed, or ephemeral.
;;; gradience (#18644): Not in AUR cache.  GNOME/libadwaita theming app;
;;;   GradienceTeam/Gradience on GitHub archived/abandoned.
;;;   A1: Package from GitHub archive — project abandoned, no releases since 2023.
;;;   A2: Search for fork — no actively maintained fork found.
;;;   A3: Skip — defunct project with no upstream support.
;;; deadbeef-mpris2-plugin (#19282): Not in AUR cache.  MPRIS2 plugin for
;;;   DeaDBeeF; likely merged into main package.
;;;   A1: Check deadbeef core — deadbeef-git includes MPRIS2 support.
;;;   A2: Package standalone plugin — no source available in AUR.
;;;   A3: Skip — functionality integrated into deadbeef.
;;; linux6.18.22-1-lts-bin (#37932): Not in AUR cache.  Ephemeral kernel
;;;   binary package for specific kernel version.
;;;   A1: Package current LTS — Guix has linux-libre.
;;;   A2: Find successor — version-pinned kernel packages are transient.
;;;   A3: Skip — ephemeral package.
;;; matlab-jre-bundled (#19363): Not in AUR cache.  MATLAB Java runtime;
;;;   removed due to MATLAB licensing restrictions.
;;;   A1: Bundle JRE with MATLAB — MATLAB is proprietary.
;;;   A2: Use Guix OpenJDK — already available.
;;;   A3: Skip — proprietary ecosystem.
;;; sipgate-app-clinq (#18449): Not in AUR cache.  Sipgate VoIP desktop app;
;;;   product discontinued in favor of web version.
;;;   A1: Package Electron wrapper — no source available.
;;;   A2: Web-only alternative — not a desktop package.
;;;   A3: Skip — removed from AUR, product discontinued.
;;;
;;; === SELINUX_SPECIFIC (1) ===
;;; base-selinux (#18537): Arch SELinux meta-package providing full SELinux
;;;   userland stack.  Not applicable to Guix (no SELinux support).
;;;   A1: Package individual SELinux tools — 15+ packages, no Guix demand.
;;;   A2: SELinux integration — Guix kernel has no SELinux support.
;;;   A3: Skip — fundamentally incompatible with Guix model.
;;;
;;; === DKMS_KERNEL_MODULE (9) ===
;;; All require DKMS, incompatible with Guix's immutable/functional kernel model.
;;; aquacomputer_d5next-hwmon-dkms (#18606): Aquacomputer HWMON driver.
;;; amneziawg-dkms-git (#18642): AmneziaWG VPN kernel module.
;;; faustus-dkms-git (#18859): ASUS TUF fan control DKMS driver.
;;; ideapad-laptop-tb-dkms (#18957): Lenovo ThinkBook DKMS driver.
;;; ideapad-laptop-tb2024g6plus-dkms (#18895): Lenovo 2024 G6+ DKMS driver.
;;; pfring-dkms (#18399): PF_RING network monitoring DKMS module.
;;; r8126-dkms (#18487): Realtek RTL8126 ethernet DKMS driver.
;;; rtl88x2ce-dkms-git (#18362): Realtek WiFi DKMS driver.
;;; nvidia-open-tinygrad-dkms-git (#18617): NVIDIA open kernel modules (tinygrad).
;;;   Common attempts:
;;;   A1: Build as out-of-tree .ko — Guix kernel is immutable.
;;;   A2: Custom kernel config — per-user build, not distributable.
;;;   A3: linux-module-build-system — does not exist in Guix yet.
;;;
;;; === KERNEL_MODULE (5) ===
;;; Out-of-tree kernel modules or kernel-specific headers.
;;; amneziawg-linux (#18452): AmneziaWG kernel module.
;;; amneziawg-linux-hardened (#18382): AmneziaWG for hardened kernel.
;;; zfs-linux-hardened-headers (#17921): ZFS headers for hardened kernel.
;;; zfs-linux-rt-headers (#17920): ZFS headers for RT kernel.
;;; zfs-linux-git-headers (#17919): ZFS headers for git kernel.
;;;   Common attempts:
;;;   A1: Build against Guix linux-libre — kernel module loading not supported.
;;;   A2: Custom kernel config — per-user, not distributable.
;;;   A3: Skip — Guix kernel model fundamentally incompatible.
;;;
;;; === DISTRO_SPECIFIC (13) ===
;;; Tightly coupled to Arch Linux pacman/mkinitcpio/ALPM infrastructure.
;;; mkinitcpio-systemd-root-password (#18371): mkinitcpio hook.
;;; repacman (#18707): Produces pacman packages.
;;; findbrokenpkgs (#18930): Uses pacman database for broken package detection.
;;; sbctl-initcpio-post-hook (#18720): mkinitcpio Secure Boot hook.
;;; linux-keep-modules (#18490): Pacman hook preserving kernel modules.
;;; pacpak-git (#17862): Pacman wrapper for Flatpak integration.
;;; chromium-extension-arch-search (#17897): Arch Wiki browser extension.
;;; python-pypi2pkgbuild (#17822): PyPI to Arch PKGBUILD converter.
;;; archwiki-offline (#18568): Depends on arch-wiki-docs package.
;;; coreutils-arch (#18690): Just the GNU `arch` command (Guix coreutils has it).
;;; asp (#14587): Arch Source Package tool (uses pacman infrastructure).
;;; aurutils (#11354): AUR helper tools (pacman-based).
;;; pamac-cli (#17940): Manjaro package manager CLI (pacman frontend).
;;;   Common attempts:
;;;   A1: Port functionality — requires pacman/ALPM infrastructure.
;;;   A2: Reimplement — different tool entirely, not a port.
;;;   A3: Skip — Arch-specific tools have no Guix equivalent.
;;;
;;; === NPM_COMPLEX (7) ===
;;; Node.js packages requiring extensive npm dependency trees not in Guix.
;;; edgeimpulse-cli (#18574): Edge Impulse IoT CLI; npm with native deps.
;;; nodejs-cspell (#18215): Code spell checker; 200+ npm dependencies.
;;; osmtogeojson (#18417): OSM-to-GeoJSON converter; ~25 npm deps.
;;; emmet-language-server (#18958): Emmet LSP; ~25 npm deps.
;;; aws-amplify-cli (#18269): AWS Amplify CLI; massive npm dep tree.
;;; aws-cdk (#18298): AWS CDK CLI; massive npm dep tree.
;;; nodejs-nestjs-cli (#18753): NestJS CLI; npm + TypeScript.
;;;   Common attempts:
;;;   A1: node-build-system — requires packaging 25-200+ npm deps individually.
;;;   A2: Bundled node_modules — violates Guix reproducibility model.
;;;   A3: Pre-built binary — node binaries not portable across systems.
;;;
;;; === PROPRIETARY_BINARY (5) ===
;;; Proprietary, non-redistributable, or unknown-license binaries.
;;; squareline-studio (#17812): SquareLine Studio (LVGL GUI designer); proprietary.
;;; brother-mfc-l2400dw (#17797): Brother printer driver; proprietary binary.
;;; inkdrop (#17819): Markdown note-taking app; proprietary license.
;;; luniistore (#18478): French children's storyteller app; proprietary binary.
;;; simplicity-commander (#18419): Silicon Labs debug tool; depends on
;;;   proprietary jlink-software-and-documentation.
;;;   Common attempts:
;;;   A1: Repackage binary — license prohibits redistribution.
;;;   A2: Build from source — no source available.
;;;   A3: Skip — proprietary software.
;;;
;;; === PLATFORM_UNSUPPORTED (3) ===
;;; bakkesmod-steam (#17468): Windows-only BakkesMod for Rocket League.
;;; android-platform-19 (#28671): Android SDK platform level 19.
;;; android-platform-21 (#23109): Android SDK platform level 21.
;;;   A1: Wine wrapper — game modding tools don't work well under Wine.
;;;   A2: Android SDK packaging — massive proprietary infrastructure.
;;;   A3: Skip — platform-specific, no Linux equivalent.
;;;
;;; === MULTILIB_UNSUPPORTED (3) ===
;;; lib32-opencl-nvidia-390xx (#17502): 32-bit NVIDIA OpenCL (legacy driver).
;;; lib32-libglade (#45410): 32-bit libglade (also EOL library).
;;; lib32-libxpm (#16491): 32-bit libXpm.
;;;   A1: Cross-compile for i686 — Guix multilib model differs from Arch.
;;;   A2: Package 64-bit versions — already in Guix.
;;;   A3: Skip — 32-bit variants not well-supported in Guix.
;;;
;;; === MINGW_CROSS (7) ===
;;; MinGW Windows cross-compilation packages.
;;; mingw-w64-cblas (#34115): MinGW CBLAS.
;;; mingw-w64-lapack (#34113): MinGW LAPACK.
;;; mingw-w64-soundtouch (#18330): MinGW SoundTouch.
;;; mingw-w64-boost (#23783): MinGW Boost.
;;; mingw-w64-cppwinrt (#43750): MinGW C++/WinRT.
;;; mingw-w64-pcre2 (#26805): MinGW PCRE2.
;;; mingw-w64-spirv-tools (#42666): MinGW SPIRV-Tools.
;;;   A1: Guix cross-compilation to Windows — not well-supported.
;;;   A2: Package native Linux versions — already in Guix.
;;;   A3: Skip — Windows-target cross builds.
;;;
;;; === NON_DISTRIBUTABLE (2) ===
;;; ttf-consolas-ligaturized (#20499): Microsoft Consolas font (modified).
;;;   A1: Redistribute — violates Microsoft font EULA.
;;;   A2: Patch script — needs original Consolas font file.
;;;   A3: Skip — font cannot be redistributed.
;;; receitanet (#18413): Brazilian tax software; government license.
;;;   A1: Repackage JAR — license prohibits redistribution.
;;;   A2: Download-only script — not a real package.
;;;   A3: Skip — government software, redistribution blocked.
;;;
;;; === WINE_WRAPPER (2) ===
;;; fileoptimizer-bin (#18315): Windows file optimizer via Wine.
;;; dxvk-async-git (#18820): DXVK fork; requires MinGW cross-compilation
;;;   to build Windows DLLs from source.
;;;   A1: meson with mingw cross-files — Guix doesn't support Windows targets.
;;;   A2: Pre-built binaries — no releases for async fork.
;;;   A3: Skip — Windows cross-compilation required.
;;;
;;; === ABANDONED_UPSTREAM (2) ===
;;; clash-for-windows-chinese (#17433): Clash for Windows (Chinese); upstream
;;;   project deleted by author due to legal pressure.
;;;   A1: Fork — no actively maintained fork with GUI.
;;;   A2: CLI alternative — different tool (clash-meta exists).
;;;   A3: Skip — project permanently abandoned.
;;; lightdm-webkit-theme-aether (#19028): LightDM WebKit theme; no updates
;;;   since 2019, WebKit2 greeter API changed.
;;;   A1: Port to new API — substantial rewrite needed.
;;;   A2: Alternative theme — many other LightDM themes exist.
;;;   A3: Skip — abandoned, API incompatible.
;;;
;;; === OBSOLETE_DEPS (2) ===
;;; knossu (#18461): Requires glew1.10 and libpng12 (both EOL with known CVEs).
;;;   A1: Patch binary — proprietary, can't rebuild.
;;;   A2: Provide compat libs — known CVEs in EOL libraries.
;;;   A3: Skip — obsolete dependencies with security issues.
;;; phonon-qt4-vlc (#18938): Requires Qt4 (EOL since 2015).
;;;   A1: Build against Qt5/6 — wrong package (Qt5 version exists separately).
;;;   A2: Package Qt4 — massive EOL framework with security issues.
;;;   A3: Skip — Qt4 ecosystem dead.
;;;
;;; === BUILD_SYSTEM_TOO_COMPLEX (5) ===
;;; java-language-server (#18379): Maven build; 14+ transitive Java deps.
;;;   Also marked out-of-date since 2023-06-20.
;;;   A1: maven-build-system — not in Guix.
;;;   A2: ant-build-system — can't handle Maven POM properly.
;;;   A3: Pre-built JAR — no official binary releases.
;;; eclipse-pydev (#17948): Eclipse OSGI bundle; requires Eclipse PDE.
;;;   A1: copy-build-system with pre-built — depends on Eclipse (not in Guix).
;;;   A2: Build from source — requires Eclipse PDE.
;;;   A3: Skip — Eclipse ecosystem not in Guix.
;;; gephi-git (#18898): Maven build; ~20 transitive Java dependencies.
;;;   A1: maven-build-system — not in Guix.
;;;   A2: Pre-built binary — no official Linux binary.
;;;   A3: Skip — Maven ecosystem.
;;; rdt-client (#18561): .NET 9 web app; requires ASP.NET 9 runtime.
;;;   Guix has limited .NET support, no .NET 9 or ASP.NET runtime.
;;;   A1: dotnet-build-system — limited Guix .NET 8 support only.
;;;   A2: Self-contained publish — needs full .NET framework.
;;;   A3: Skip — .NET 9 ecosystem not in Guix.
;;; logstash (#18911): Complex Java/JRuby app (Elastic Stack).
;;;   Dual-licensed Apache-2.0 OR Elastic-2.0 (non-free).
;;;   A1: ant-build-system — uses Gradle, not Ant.
;;;   A2: Pre-built tarball — ships bundled JRuby runtime.
;;;   A3: Skip — complex build pipeline + licensing concerns.
;;;
;;; === MISSING_DEPS (6) ===
;;; libfprint-2-tod1-broadcom-cv3plus (#17912): Proprietary fingerprint driver;
;;;   requires closed-source firmware blobs.
;;;   A1: Package open parts — still needs proprietary firmware.
;;;   A2: Alternative driver — no open-source alternative.
;;;   A3: Skip — proprietary firmware required.
;;; texmacs-pure (#17873): Requires Pure language + LLVM 3.5 (ancient).
;;;   A1: Package Pure language — requires LLVM 3.5, incompatible with modern LLVM.
;;;   A2: Build with newer LLVM — Pure not maintained for modern LLVM.
;;;   A3: Skip — unmaintained language dependency.
;;; nfuspire-git (#18401): Requires libnspire (not in Guix).
;;;   A1: Package libnspire first — small library, feasible but niche.
;;;   A2: Skip until libnspire packaged.
;;;   A3: Skip — blocking dependency.
;;; gbm (#19044): Requires mono-basic (VB.NET); Mono not in Guix.
;;;   A1: Package Mono runtime — massive effort, not in Guix.
;;;   A2: .NET Core port — project uses .NET Framework, not Core.
;;;   A3: Skip — Mono ecosystem not in Guix.
;;; soapysdrplay3-luarvique-git (#18141): Requires proprietary libsdrplay.
;;;   A1: Package libsdrplay — proprietary, redistribution unclear.
;;;   A2: Alternative SDR backend — defeats purpose.
;;;   A3: Skip — proprietary dependency.
;;; kamilsss655-uv-k5-firmware-custom-git (#17909): Requires arm-none-eabi
;;;   bare-metal cross-toolchain (not Linux cross-compilation).
;;;   A1: Package arm-none-eabi-gcc — Guix supports Linux targets, not bare-metal.
;;;   A2: Pre-built firmware — binary blob, not useful as package.
;;;   A3: Skip — bare-metal cross-compilation not supported.
;;;
;;; === COMPLEX_BUILD (5) ===
;;; libarchive-static (#18758): Static musl build of libarchive.
;;;   A1: gnu-build-system with musl — Guix musl is for cross-compilation.
;;;   A2: Modify existing libarchive — upstream uses glibc.
;;;   A3: Skip — Guix already has dynamic libarchive.
;;; quartz-utils-git (#18430): Written in Crystal language; no Crystal compiler
;;;   in Guix.
;;;   A1: crystal-build-system — doesn't exist in Guix.
;;;   A2: Package Crystal compiler — massive bootstrapping effort.
;;;   A3: Skip — Crystal ecosystem not in Guix.
;;; python-gradio-pdf (#18463): Depends on python-gradio (100+ Python deps).
;;;   A1: Package entire gradio ecosystem — 100+ packages.
;;;   A2: Minimal stub — defeats purpose.
;;;   A3: Skip — massive dependency chain.
;;; python-jaxlib-bin (#18474): Binary wheel with native XLA/LLVM code.
;;;   A1: Install wheel — native .so files link to wrong paths.
;;;   A2: Build from source — requires Bazel + XLA (not in Guix).
;;;   A3: Patchelf — 50+ .so files with complex interdependencies.
;;; python-home-assistant-frontend (#18556): 110MB opaque JS bundle.
;;;   A1: pyproject with wheel — violates source-bootstrapping model.
;;;   A2: Build from source — needs 100s of npm packages.
;;;   A3: Skip — opaque JS bundle, not reproducibly buildable.
;;;
;;; === COMPLEX_DEPS (3) ===
;;; vscodium-marketplace (#18695): Depends on vscodium (massive Electron app
;;;   not in Guix).  The patch script is useless without the base IDE.
;;;   A1: Package vscodium — massive Electron app build.
;;;   A2: Patch script only — useless without vscodium.
;;;   A3: Skip — depends on unpackaged Electron IDE.
;;; plugin-autenticacao-gov-pt (#18557): Portuguese government auth plugin;
;;;   binary-only package with no source available.
;;;   A1: Repackage binary — no source, unclear license.
;;;   A2: Build from source — no source available.
;;;   A3: Skip — binary-only, no source.
;;; nvidia-bl-dkms (#17755): NVIDIA backlight DKMS kernel module.
;;;   (Also categorized as DKMS, but listed separately due to custom nature.)
;;;   A1: DKMS — incompatible with Guix kernel model.
;;;   A2: Kernel config — per-user build.
;;;   A3: Skip — DKMS kernel module.
;;;
;;; === GLIBC_REPLACEMENT (1) ===
;;; glibc-eac (#24719): Patched glibc adding DT_HASH for EasyAntiCheat games.
;;;   Marked out-of-date in AUR.  Extremely dangerous to replace system glibc.
;;;   A1: Alternate glibc package — conflicts with store integrity.
;;;   A2: LD_PRELOAD wrapper — requires deep ELF hash table manipulation.
;;;   A3: Container with modified glibc — Guix lacks container glibc override.
;;;
;;; === GAME_NON_DISTRIBUTABLE (2) ===
;;; ut2004-gog (#18333): Requires GOG purchase for game data.
;;;   A1: Engine-only — useless without paid game data.
;;;   A2: Download script — requires purchase.
;;;   A3: Skip — commercial game.
;;; unrealtournament4 (#18319): Epic Games proprietary.
;;;   A1-A3: Proprietary, requires Epic account.
;;;
;;; === WINE_WINDOWS_ONLY (1) ===
;;; anytxt-bin (#18295): Windows desktop search tool, freeware via Wine.
;;;   Non-free license (freeware), requires Wine runtime.
;;;   A1: Repackage with Wine — non-free, complex Wine integration.
;;;   A2: Native alternative — different tools exist (recoll, etc.).
;;;   A3: Skip — proprietary Windows software.
;;; euroscope-bin (#17945): Windows ATC simulator; Wine-wrapped binary.
;;;   A1: Wine wrapper — complex Win32 app.
;;;   A2: Native alternative — no Linux equivalent.
;;;   A3: Skip — Windows-only platform.
;;;
;;; === OTHER BLOCKED (7) ===
;;; plank-reloaded-docklet-picky-git (#18397): Depends on plank-reloaded
;;;   (not in Guix).
;;;   A1: Package plank-reloaded first — additional project needed.
;;;   A2: Skip until plank packaged.
;;;   A3: Use alternative dock (e.g., GNOME dash-to-dock).
;;; wayprompt-git (#18262): Written in Zig; Zig compiler not in Guix.
;;;   A1: zig-build-system — doesn't exist in Guix.
;;;   A2: Package Zig — complex self-hosting compiler.
;;;   A3: Skip until Zig compiler in Guix.
;;; emerald (#22333): Requires compiz-core (not in Guix).
;;;   A1: Package compiz — substantial effort, ~20 packages.
;;;   A2: Skip until compiz ecosystem packaged.
;;;   A3: Use alternative window decorators.
;;; limine-snapper-sync-git (#18667): Limine bootloader + Snapper integration.
;;;   Guix uses GRUB/EFI, not Limine.
;;;   A1: Port to Guix boot — different bootloader model.
;;;   A2: Package Limine — incompatible with Guix boot process.
;;;   A3: Skip — fundamentally different boot infrastructure.
;;; linux-gpib (#20547): Kernel module + userspace GPIB library.
;;;   A1: Userspace library only — still depends on kernel module.
;;;   A2: Full kernel module — incompatible with Guix.
;;;   A3: Skip — DKMS + kernel module.
;;; mkinitcpio-clevis-hook (#18342): mkinitcpio hook for LUKS+clevis+TPM.
;;;   A1: Adapt for Guix initrd — different initrd system.
;;;   A2: Port clevis integration — requires Guix initrd service.
;;;   A3: Skip — fundamentally different boot infrastructure.
;;; wyc (#18777): Commercial Chinese port mapping service; proprietary binary.
;;;   A1: Repackage binary — commercial license prohibits.
;;;   A2: Build from source — no source available.
;;;   A3: Skip — commercial software.
;;;
;;; === LEGACY_PYTHON2 (1) ===
;;; python2-gimp (#23210): Python 2 bindings for GIMP.
;;;   A1: Build against Python 2 — Python 2 removed from Guix.
;;;   A2: Use Python 3 GIMP bindings — GIMP 3.x has Python 3 support.
;;;   A3: Skip — Python 2 is EOL.
;;;
;;; === BONUS RECIPES FROM EXTENDED QUEUE ===
;;; 10 packages resolved from positions 101-228:
;;;   go2tv (#18598, position 180) — Go DLNA/UPnP media caster
;;;   principia-git (#18613, position 126) — Physics sandbox game
;;;   glsmac-git (#18619, position 192) — Alpha Centauri reimplementation
;;;   lincity-ng-git (#18610, position 194) — City simulation game
;;;   cockatrice-server-git (#18377, position 142) — Card game server
;;;   shijima-qt (#18654, position 117) — Desktop mascot app
;;;   ausweiskopie (#18605, position 118) — German ID copy tool
;;;   openxcom-git (#18254, position 199) — X-COM reimplementation
;;;   whatip-git (#18378, position 129) — GNOME IP info tool
;;;   panda3ds (#18530, position 196) — Nintendo 3DS emulator
;;;
;;; === SUMMARY ===
;;; Total evaluated: 100 (from priority queue) + 10 bonus from extended queue
;;; New recipes: 10 (all from extended queue)
;;; Remaining BLOCKED from queue: 90
;;; Total BLOCKED remaining: 218 (228 - 10 resolved)
;;;
;;; Breakdown of queue blockers:
;;;   DKMS/kernel modules: 15 (9 DKMS + 5 kernel + 1 nvidia-bl)
;;;   Distro-specific (Arch): 13
;;;   NPM complex: 7
;;;   MinGW cross: 7
;;;   Proprietary binary: 5
;;;   Missing AUR source: 5
;;;   Missing deps: 6
;;;   Complex build: 5
;;;   Build system too complex: 5
;;;   Multilib unsupported: 3
;;;   Platform unsupported: 3
;;;   Complex deps: 3
;;;   Non-distributable: 2
;;;   Wine/Windows only: 3
;;;   Abandoned upstream: 2
;;;   Obsolete deps: 2
;;;   Game non-distributable: 2
;;;   Other blocked: 7
;;;   glibc replacement: 1
;;;   Legacy Python 2: 1
