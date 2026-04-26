;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Blocked notes for deptree-resolver-260426k
;;;
;;; 100 packages evaluated from the top-100 priority queue.
;;; 0 resolved from top-100 queue (all have permanent blockers).
;;; 9 recipes from extended queue (positions 101-218):
;;;   - 3 new dependency packages (libatrac9, libunarr, libuiohook)
;;;   - 6 BLOCKED packages resolved (vanilla-wiiu-git, lcd4linux-git,
;;;     librum, vgmstream-git, yacreader-poppler-git,
;;;     obs-plugin-input-overlay-git)
;;; 94 remain BLOCKED with documented reasons.
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
;;; === SELINUX_SPECIFIC (2) ===
;;; base-selinux (#18537): Arch SELinux meta-package providing full SELinux
;;;   userland stack.  Not applicable to Guix (no SELinux support).
;;;   A1: Package individual SELinux tools — 15+ packages, no Guix demand.
;;;   A2: SELinux integration — Guix kernel has no SELinux support.
;;;   A3: Skip — fundamentally incompatible with Guix model.
;;; sudo-selinux (#18513): SELinux-aware sudo variant.
;;;   A1: Patch Guix sudo — SELinux not available in Guix.
;;;   A2: Build with SELinux disabled — identical to standard sudo.
;;;   A3: Skip — requires SELinux infrastructure.
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
;;; asp (#14587): Arch Source Package tool (uses pacman infrastructure).
;;; aurutils (#11354): AUR helper tools (pacman-based).
;;; pamac-cli (#17940): Manjaro package manager CLI (pacman frontend).
;;; system-age (#18453): Checks pacman install time; Arch-specific.
;;;   Common attempts:
;;;   A1: Port functionality — requires pacman/ALPM infrastructure.
;;;   A2: Reimplement — different tool entirely, not a port.
;;;   A3: Skip �� Arch-specific tools have no Guix equivalent.
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
;;; === PROPRIETARY_BINARY (8) ===
;;; Proprietary, non-redistributable, or unknown-license binaries.
;;; squareline-studio (#17812): SquareLine Studio (LVGL GUI designer); proprietary.
;;; brother-mfc-l2400dw (#17797): Brother printer driver; proprietary binary.
;;; inkdrop (#17819): Markdown note-taking app; proprietary license.
;;; luniistore (#18478): French children's storyteller app; proprietary binary.
;;; simplicity-commander (#18419): Silicon Labs debug tool; depends on
;;;   proprietary jlink-software-and-documentation.
;;; unrealtournament4 (#18319): Proprietary Unreal Tournament 4; custom license.
;;; wyc (#18777): 网云穿 port forwarding tool; commercial license.
;;; vmware-workstation (#1833): VMware Workstation; proprietary binary.
;;;   Common attempts:
;;;   A1: Repackage binary — license prohibits redistribution.
;;;   A2: Build from source — no source available.
;;;   A3: Skip �� proprietary software.
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
;;; === MINGW_CROSS (8) ===
;;; MinGW Windows cross-compilation packages.
;;; mingw-w64-cblas (#34115): MinGW CBLAS.
;;; mingw-w64-lapack (#34113): MinGW LAPACK.
;;; mingw-w64-soundtouch (#18330): MinGW SoundTouch.
;;; mingw-w64-boost (#23783): MinGW Boost.
;;; mingw-w64-cppwinrt (#43750): MinGW C++/WinRT.
;;; mingw-w64-pcre2 (#26805): MinGW PCRE2.
;;; mingw-w64-spirv-tools (#42666): MinGW SPIRV-Tools.
;;; dxvk-async-git (#18820): DXVK fork; requires MinGW cross-compilation.
;;;   A1: Guix cross-compilation to Windows — not well-supported.
;;;   A2: Package native Linux versions — already in Guix.
;;;   A3: Skip — Windows-target cross builds.
;;;
;;; === NON_DISTRIBUTABLE (4) ===
;;; ttf-consolas-ligaturized (#20499): Microsoft Consolas font (modified).
;;;   A1: Redistribute — violates Microsoft font EULA.
;;;   A2: Patch script — needs original Consolas font file.
;;;   A3: Skip — font cannot be redistributed.
;;; receitanet (#18413): Brazilian tax software; government license.
;;;   A1: Repackage JAR — license prohibits redistribution.
;;;   A2: Download-only script — not a real package.
;;;   A3: Skip — government software, redistribution blocked.
;;; factorio-space-age-experimental (#17440): Commercial game; custom license.
;;;   A1: Redistribute — license prohibits it.
;;;   A2: Installer wrapper — still non-distributable.
;;;   A3: Skip — commercial software.
;;; plugin-autenticacao-gov-pt (#18557): Portuguese auth plugin; EUPL license
;;;   but depends on proprietary components.
;;;   A1: Package open parts — still needs proprietary middleware.
;;;   A2: Reverse-engineer protocol — impractical.
;;;   A3: Skip — proprietary components required.
;;;
;;; === WINE_WRAPPER (2) ===
;;; fileoptimizer-bin (#18315): Windows file optimizer via Wine.
;;; euroscope-bin (#17945): Windows VATSIM radar scope via Wine.
;;;   A1: meson with mingw cross-files — Guix doesn't support Windows targets.
;;;   A2: Pre-built binaries — no native Linux version.
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
;;; gbm (#19044): Requires mono-basic (VB.NET); Mono not in Guix.
;;;   A1: mono-build-system — Mono not in Guix.
;;;   A2: Pre-built binary — no Linux binary releases.
;;;   A3: Skip — Mono/.NET ecosystem.
;;;
;;; === MISSING_DEPS (8) ===
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
;;; libch343ser-git (#17880): USB serial kernel module for WCH chips.
;;;   A1: Out-of-tree kernel module — Guix kernel model blocks this.
;;;   A2: Submit upstream to mainline kernel — long process.
;;;   A3: Skip — kernel driver, not userspace.
;;; mailnaggertray-git (#18592): Requires mailnagger (not in Guix).
;;;   A1: Package mailnagger first — Python app, feasible but niche.
;;;   A2: Skip until mailnagger packaged.
;;;   A3: Skip — blocking dependency.
;;; kamilsss655-uv-k5-firmware-custom-git (#17909): Requires arm-none-eabi
;;;   cross toolchain.
;;;   A1: Package ARM cross-compiler — available but complex setup.
;;;   A2: Pre-built firmware — not useful for custom builds.
;;;   A3: Skip — embedded cross-compilation toolchain.
;;; awk-language-server (#18691): Node.js LSP; requires yarn + typescript
;;;   build toolchain and npm dependencies.
;;;   A1: node-build-system — requires packaging npm deps.
;;;   A2: Pre-built from npm — not reproducible.
;;;   A3: Skip — npm build complexity.
;;; quartz-utils-git (#18777): Requires Crystal language (not in Guix).
;;;   A1: Package Crystal compiler — bootstrap chain not in Guix.
;;;   A2: Pre-built binary — no releases available.
;;;   A3: Skip — Crystal ecosystem not in Guix.
;;;
;;; === COMPLEX_BUILD (6) ===
;;; pulumi-git (#18748): Go-based IaC tool; massive dependency tree
;;;   with 300+ Go modules.
;;;   A1: go-build-system — requires packaging 300+ modules.
;;;   A2: Pre-built binary — available but updates frequently.
;;;   A3: Skip — too many transitive Go dependencies.
;;; python-gradio-pdf (#18463): Requires gradio framework (massive Python
;;;   ecosystem with npm frontend build).
;;;   A1: Package gradio — 100+ Python deps + npm frontend.
;;;   A2: Standalone PDF viewer — not the same functionality.
;;;   A3: Skip — gradio ecosystem too large.
;;; python-home-assistant-frontend (#18556): Home Assistant web frontend;
;;;   massive npm build with 500+ JS dependencies.
;;;   A1: npm build — impractical for Guix.
;;;   A2: Pre-built JS — violates reproducibility.
;;;   A3: Skip — massive npm ecosystem.
;;; python-jaxlib-bin (#18474): Binary JAX library; requires CUDA/ROCm
;;;   headers and specific NumPy ABI compatibility.
;;;   A1: Build from source — requires Bazel + CUDA toolkit.
;;;   A2: Binary repackage — ABI compatibility issues.
;;;   A3: Skip — ML infrastructure ecosystem gap.
;;; virtualbox-svn (#18799): Full VirtualBox build from SVN; 67 deps
;;;   including custom kernel modules and Qt GUI.
;;;   A1: Build from SVN — massive, requires kernel modules.
;;;   A2: Binary repackage — proprietary license.
;;;   A3: Skip — too complex for automated resolution.
;;; vscodium-marketplace (#18695): Requires vscodium (not in Guix);
;;;   script to reconfigure marketplace URL.
;;;   A1: Package vscodium first — Electron app.
;;;   A2: Manual config — not a real package.
;;;   A3: Skip — depends on vscodium.
;;;
;;; === HARDWARE_SPECIFIC (3) ===
;;; nvidia-bl-dkms (#17755): NVIDIA backlight DKMS driver.
;;;   Same as DKMS category — kernel module.
;;; python-jax-rocm (not in top-100 but referenced): ROCm-specific JAX.
;;; soapysdrplay3-luarvique-git (#18141): Requires SDRplay API v3
;;;   (proprietary hardware SDK).
;;;   A1: Package SoapySDR module — needs proprietary libsdrplay_api.
;;;   A2: Open-source SDR alternative — different hardware.
;;;   A3: Skip — proprietary hardware SDK.
;;;
;;; === LEGACY_PYTHON2 (0 in top-100) ===
;;; (python2-gimp is in extended queue, not top-100)
;;;
;;; === MISC_BLOCKED (9) ===
;;; limine-snapper-sync-git (#18667): Gradle build + depends on Limine
;;;   bootloader and Snapper; bootloader-specific sync tool.
;;;   A1: Gradle build — not well-supported in Guix.
;;;   A2: Bash reimplementation — different scope.
;;;   A3: Skip — Gradle + bootloader-specific.
;;; eddiscovery (#18320): Mono/.NET application for Elite Dangerous;
;;;   requires msbuild + nuget.
;;;   A1: mono-build-system — Mono not in Guix.
;;;   A2: Pre-built binary — Mono runtime needed.
;;;   A3: Skip — Mono ecosystem.
;;; futu-ftnn-wine (#18151): Chinese stock trading app running under Wine.
;;;   A1: Wine wrapper — requires Wine + proprietary binary.
;;;   A2: Native alternative — no Linux native version.
;;;   A3: Skip — Wine wrapper for proprietary app.
;;; urbanterror (#18814): FPS game; requires proprietary game data files
;;;   with custom license.
;;;   A1: Package engine only — game data non-redistributable.
;;;   A2: Download script — not a real package.
;;;   A3: Skip — proprietary game data.
;;; ut2004-gog (#18333): Unreal Tournament 2004 GOG edition;
;;;   requires purchased game data.
;;;   A1: Package runner script — data non-distributable.
;;;   A2: Open-source alternative — no equivalent.
;;;   A3: Skip — commercial game.
;;; libarchive-static (#18758): Static build of libarchive with musl.
;;;   A1: Musl cross-build — complex toolchain setup.
;;;   A2: Static linking flag on existing libarchive — non-standard for Guix.
;;;   A3: Skip — Guix prefers dynamic linking.
;;; nvidia-390xx-settings (#18484): Legacy NVIDIA settings app for 390xx driver.
;;;   A1: Package with NVIDIA 390xx — legacy driver not in Guix.
;;;   A2: Newer nvidia-settings — different driver branch.
;;;   A3: Skip — legacy NVIDIA driver ecosystem.
;;; glibc-eac (#24719): glibc with DT_HASH patch for EAC games.
;;;   Has 45 reverse deps but patching glibc is extremely risky.
;;;   A1: Patch Guix glibc — breaks reproducibility guarantees.
;;;   A2: LD_PRELOAD shim — not a full solution.
;;;   A3: Skip — patching glibc is too invasive.
;;; python-pypi2pkgbuild (#17822): Already in DISTRO_SPECIFIC above.
