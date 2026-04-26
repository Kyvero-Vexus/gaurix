;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Blocked notes for deptree-resolver-260426e
;;;
;;; 100 packages evaluated, 3 resolved with recipes (+ 1 dep), 97 remain BLOCKED.
;;;
;;; Resolved packages:
;;;   1. python-uhid (dependency; pure Python UHID interface, pyproject-build-system)
;;;   2. fido2-hid-bridge (FIDO2 HID bridge; all deps now in Guix: python-fido2,
;;;      python-pyscard, python-uhid.  Prior assessment incorrectly stated FIDO2
;;;      stack was missing.)
;;;   3. sommelier (ChromeOS nested Wayland compositor; standalone meson build with
;;;      subdirectory tarball from googlesource.  All deps available: libdrm, mesa/gbm,
;;;      pixman, wayland, xcb, xkbcommon, xwayland.  Prior assessment incorrectly stated
;;;      monorepo was not separable.)
;;;
;;; Blocked packages by category:
;;;
;;; === SELINUX_SPECIFIC (2) ===
;;; sudo-selinux (#18513): SELinux-enabled sudo; Guix does not use SELinux.
;;;   Approaches tried: (1) check if SELinux patches optional - they are core to this
;;;   variant, (2) check if Guix has SELinux support - it does not and has no plans to,
;;;   (3) considered packaging as educational - no practical use without SELinux kernel.
;;; base-selinux (#18537): SELinux meta-package for Arch; requires full SELinux stack.
;;;   Same analysis as sudo-selinux.
;;;
;;; === DKMS_KERNEL_MODULE (11) ===
;;; All require DKMS (Dynamic Kernel Module Support) which is fundamentally
;;; incompatible with Guix's immutable kernel module model.  Guix kernel modules
;;; must be built as part of the kernel package, not loaded dynamically.
;;; aquacomputer_d5next-hwmon-dkms (#18447): HWMON driver for Aquacomputer devices
;;; amneziawg-dkms-git (#18384): AmneziaWG VPN kernel module
;;; amneziawg-linux (#18358): AmneziaWG kernel module (non-DKMS variant also needs kernel build)
;;; amneziawg-linux-hardened (#18403): AmneziaWG for hardened kernel
;;; ideapad-laptop-tb-dkms (#17938): Lenovo Ideapad ThinkBook DKMS driver
;;; ideapad-laptop-tb2024g6plus-dkms (#17937): Lenovo 2024 G6+ DKMS driver
;;; pfring-dkms (#18430): PF_RING network monitoring DKMS module
;;; nvidia-bl-dkms (#18356): NVIDIA backlight DKMS driver
;;; r8126-dkms (#18346): Realtek RTL8126 ethernet DKMS driver
;;; rtl88x2ce-dkms-git (#18369): Realtek WiFi DKMS driver
;;; faustus-dkms-git (#18414): ASUS TUF fan control DKMS driver
;;;
;;; === PLATFORM_UNSUPPORTED (5) ===
;;; bakkesmod-steam (#18417): Windows-only Rocket League modding tool; no Linux version exists.
;;; android-platform-19 (#18550): Proprietary Google Android SDK platform API level 19.
;;; android-platform-21 (#18549): Proprietary Google Android SDK platform API level 21.
;;; euroscope-bin (#18289): Windows-only VATSIM radar client; runs via Wine.
;;;   Tried: (1) check for native Linux port - none, (2) Wine wrapper - too fragile,
;;;   (3) check for alternative clients - only proprietary Windows alternatives.
;;; fileoptimizer-bin (#18448): Windows app via Wine; no native Linux version.
;;;
;;; === DISTRO_SPECIFIC (12) ===
;;; All are tools tightly coupled to Arch Linux's package manager (pacman),
;;; mkinitcpio, or ALPM library.  No Guix equivalent exists because Guix uses
;;; a fundamentally different package management model.
;;; mkinitcpio-systemd-root-password (#18515): Arch mkinitcpio hook for root password
;;; repacman (#18374): Pacman package rebuilder
;;; findbrokenpkgs (#18385): Pacman broken-package finder
;;; sbctl-initcpio-post-hook (#18390): sbctl mkinitcpio hook for Secure Boot signing
;;; system-age (#18381): Reads pacman install date to show system age
;;; linux-keep-modules (#18342): Pacman hook to preserve kernel modules on update
;;; pacpak-git (#18531): pacman + flatpak unified wrapper
;;; chromium-extension-arch-search (#18382): Browser extension for Arch Wiki/AUR search
;;; python-pypi2pkgbuild (#18324): PyPI-to-PKGBUILD converter (Arch packaging tool)
;;; archwiki-offline (#18397): Arch Wiki offline reader; content is Arch-specific
;;; asp (#14587): Arch Build System package retrieval tool
;;; pamac-cli (#18299): ALPM/pacman package manager frontend (libalpm dependency)
;;;   Tried: (1) check if pamac supports non-ALPM backends - it doesn't, it's tightly
;;;   coupled to libalpm, (2) check for Guix-compatible forks - none exist.
;;;
;;; === SOURCE_UNAVAILABLE (10) ===
;;; deadbeef-mpris2-plugin (#18511): Merged into DeaDBeeF 1.10.2+; standalone plugin removed from AUR.
;;; linux6.18.22-1-lts-bin (#18555): Not in AUR cache; removed or renamed.
;;; matlab-jre-bundled (#18419): Proprietary MATLAB component; not redistributable.
;;; luniistore (#18418): Proprietary Lunii story player; download returns 403 Forbidden.
;;;   Tried: (1) direct download URL - 403, (2) alternative mirrors - none found,
;;;   (3) Flatpak version - exists but proprietary, outside scope.
;;; simplicity-commander (#18361): Proprietary Silicon Labs tool; download URL dead.
;;;   Tried: (1) silabs.com download page - requires login/NDA, (2) GitHub mirror - none,
;;;   (3) alternative JTAG tools - different products entirely.
;;; receitanet (#18375): Brazilian government tax software; download restricted to Brazil.
;;;   Tried: (1) gov.br download - geo-restricted, (2) mirrors - none redistributable.
;;; wyc (#18406): Proprietary Chinese tunneling binary; website requires auth.
;;; plugin-autenticacao-gov-pt (#18286): Portuguese government auth plugin; binary .deb only.
;;;   Tried: (1) source repo - none exists, (2) apt repo for .deb - available but binary only.
;;; urbanterror (#1833): Pre-built game binaries + proprietary assets; not source-buildable.
;;;   Tried: (1) check ioquake3 engine source - available but UrT modifications are closed,
;;;   (2) check asset license - proprietary, not redistributable, (3) check for open-source
;;;   alternatives - OpenArena exists but is a different game.
;;; python-jaxlib-bin (#18540): Binary wheel for JAX; source build requires Bazel (not in Guix).
;;;   Tried: (1) source build - requires Bazel 7.x which is not in Guix and extremely complex
;;;   to package (Java+Python+shell hybrid), (2) binary wheel install - python-jaxlib-bin is
;;;   specifically the binary variant, (3) check if Guix has jaxlib - it does not.
;;;
;;; === MINGW_CROSS_COMPILATION (7) ===
;;; All are Windows cross-compilation targets using MinGW-w64 toolchain.
;;; Guix supports cross-compilation but these are specifically Windows DLLs
;;; with no Linux use case.
;;; mingw-w64-cblas (#18520): CBLAS for Windows
;;; mingw-w64-lapack (#18519): LAPACK for Windows
;;; mingw-w64-soundtouch (#18518): SoundTouch for Windows
;;; mingw-w64-boost (#18561): Boost for Windows
;;; mingw-w64-cppwinrt (#18560): C++/WinRT headers (Windows Runtime APIs)
;;; mingw-w64-pcre2 (#18559): PCRE2 for Windows
;;; mingw-w64-spirv-tools (#18558): SPIR-V tools for Windows
;;;
;;; === PROPRIETARY_BINARY (4) ===
;;; squareline-studio (#18567): Proprietary commercial LVGL GUI design tool.
;;; brother-mfc-l2400dw (#18454): Proprietary i386 binary printer driver from Brother.
;;;   Tried: (1) check for open-source driver - none for this model, (2) check if
;;;   cups-filters/gutenprint supports it - not listed, (3) i386 binary won't run
;;;   without 32-bit compat libraries.
;;; libfprint-2-tod1-broadcom-cv3plus (#18453): Proprietary fingerprint driver blob.
;;; inkdrop (#18501): Proprietary commercial Electron note-taking app.
;;;   Tried: (1) check for source - commercial closed-source, (2) check for Linux
;;;   binary packaging - .deb/.rpm only, (3) considered AppImage - doesn't exist.
;;;
;;; === NON_DISTRIBUTABLE (4) ===
;;; ttf-consolas-ligaturized (#18423): Derivative of proprietary Microsoft Consolas font.
;;; ut2004-gog (#18327): Commercial game (Unreal Tournament 2004); requires GOG purchase.
;;; unrealtournament4 (#18328): Proprietary Epic Games title.
;;; factorio-space-age-experimental (#18393): Proprietary commercial game DLC.
;;;
;;; === TOOLING_FAILURE (4) ===
;;; vscodium-marketplace (#18371): Patches VSCodium internals to use Microsoft marketplace.
;;;   Tried: (1) check approach - it patches VSCodium's product.json which is fragile,
;;;   (2) depends on vscodium package which is not in Guix, (3) even if packaged, it
;;;   would break on any VSCodium update.
;;; libarchive-static (#18529): Static musl build of libarchive.
;;;   Tried: (1) check musl toolchain in Guix - available via cross-compilation but
;;;   not as a native static-linking target, (2) check if Guix libarchive supports
;;;   static build - it doesn't expose a static output, (3) attempted configuring
;;;   with musl - musl static compilation infrastructure is immature in Guix.
;;; nvidia-open-tinygrad-dkms-git (#18350): NVIDIA open kernel modules for tinygrad;
;;;   DKMS kernel module (same issue as DKMS category above).
;;; vivaldi-autoinject-custom-js-ui (#18437): Shell script to inject custom JS/CSS into Vivaldi.
;;;   Tried: (1) check build - trivial make install, (2) check deps - requires Vivaldi
;;;   browser (proprietary, not in Guix), (3) project archived Feb 2026, unmaintained.
;;;
;;; === BROWSER_EXTENSION (1) ===
;;; librewolf-extension-ublock-origin-bin (#18525): .xpi browser extension.
;;;   Guix browser extensions need integration with the browser profile system; standalone
;;;   .xpi packaging has no standard Guix model.
;;;
;;; === KERNEL_SPECIFIC (3) ===
;;; zfs-linux-hardened-headers (#18310): ZFS headers for specific hardened kernel version.
;;; zfs-linux-rt-headers (#18279): ZFS headers for specific RT kernel version.
;;; zfs-linux-git-headers (#18388): ZFS headers for git kernel version.
;;;   All are kernel-version-locked ZFS header packages; Guix handles ZFS differently
;;;   (as part of the kernel build if at all).
;;;
;;; === MULTILIB_UNSUPPORTED (2) ===
;;; lib32-opencl-nvidia-390xx (#18503): 32-bit NVIDIA OpenCL for legacy GPU.
;;; lib32-libglade (#18536): 32-bit libglade; Guix doesn't support 32-bit multilib.
;;;
;;; === ABANDONED_UPSTREAM (2) ===
;;; lightdm-webkit-theme-aether (#18395): Project archived; depends on lightdm-webkit2-greeter
;;;   which is itself abandoned.
;;;   Tried: (1) check GitHub - archived since 2023, (2) check forks - no active forks,
;;;   (3) check alternatives - web-greeter project also stalled.
;;; clash-for-windows-chinese (#18373): GitHub repo deleted entirely; proxy tool with
;;;   regulatory issues.
;;;
;;; === KERNEL_MODULE (1) ===
;;; libch343ser-git (#18428): USB-UART kernel module for CH343 chips; AUR repo is empty.
;;;   Tried: (1) check AUR repo - confirmed empty/deleted, (2) check upstream WCH driver
;;;   page - driver exists but is a proprietary kernel module with custom build system.
;;;
;;; === CROSS_COMPILATION (1) ===
;;; kamilsss655-uv-k5-firmware-custom-git (#17798): ARM firmware for Quansheng UV-K5
;;;   radio; requires arm-none-eabi cross-compilation toolchain.
;;;   Tried: (1) check Guix ARM cross-compilation - supported but arm-none-eabi-newlib
;;;   not packaged, (2) check if firmware can be downloaded pre-built - releases exist
;;;   on GitHub but building from source needs the full ARM toolchain, (3) this is
;;;   bare-metal firmware, not a regular Linux package.
;;;
;;; === PROPRIETARY_DEP (1) ===
;;; soapysdrplay3-luarvique-git (#18380): SoapySDR plugin for SDRPlay receivers;
;;;   depends on proprietary SDRPlay API3 binary driver.
;;;
;;; === DEP_RESOLUTION_FAILED (26) ===
;;;
;;; -- npm/Node.js ecosystem (9) --
;;; These all require npm packaging which is fundamentally difficult in Guix due to
;;; the npm ecosystem's deep transitive dependency trees (hundreds to thousands of
;;; packages per project), non-reproducible build processes, and binary native addons.
;;; gradience (#18644): Project archived Jul 2024; removed from AUR entirely.
;;; edgeimpulse-cli (#18448): 29+ native npm deps (sharp, serialport).
;;; aws-amplify-cli (#18571): Massive npm tree (1000+ transitive deps).
;;; emmet-language-server (#18564): npm, deep node dependency tree.
;;; nodejs-cspell (#18507): npm monorepo, 200+ transitive deps.
;;; osmtogeojson (#18505): npm with 10 direct deps + transitive tree.
;;;   Tried: (1) check if available as standalone binary - no, (2) check node-build-system
;;;   feasibility - requires packaging 50+ npm deps, (3) check for alternative implementations
;;;   in other languages - none found.
;;; aws-cdk (#18562): Massive npm tree (2000+ transitive deps).
;;; nodejs-nestjs-cli (#18496): npm, deep node dependency tree.
;;; awk-language-server (#18479): yarn + TypeScript, ~20-30 transitive deps.
;;;   Tried: (1) check if pre-built binary available - no, (2) check yarn packaging in
;;;   Guix - no yarn support, (3) check if tree-sitter-awk is separately usable - it is
;;;   but the LSP server itself needs the full node stack.
;;;
;;; -- Other DEP_RESOLUTION_FAILED (17) --
;;; virtualbox-svn (#18535): 53+ deps including kernel modules, Qt GUI, SDK;
;;;   effectively an entire OS subsystem.
;;; python-home-assistant-frontend (#18504): 115MB pre-built JS frontend wheel;
;;;   source build requires Node.js + npm + 500+ npm deps.
;;; java-language-server (#18497): Maven project that downloads 100+ deps at build time;
;;;   Maven offline builds in Guix are extremely complex.
;;; nfuspire-git (#18488): Depends on libnspire (not in Guix); only 1 commit upstream,
;;;   immature project.
;;; phonon-qt4-vlc (#18492): Qt4 EOL since Dec 2015; depends on phonon-qt4 which is
;;;   unmaintained and not in Guix.
;;; quartz-utils-git (#18491): Crystal language not available in Guix; Crystal compiler
;;;   is self-hosted making it very hard to bootstrap.
;;; sommelier-git: RESOLVED in this pass (see recipe above).
;;; texmacs-pure (#18489): Pure language defunct; needs LLVM 3.5 which is ancient.
;;; eclipse-pydev (#18334): Eclipse IDE not in Guix; Eclipse packaging is extremely
;;;   complex (OSGi plugin system, p2 update sites).
;;; gephi-git (#18332): Maven + NetBeans Platform; double blocker (both very hard in Guix).
;;; rdt-client (#18343): Requires .NET 9 runtime; Guix only packages .NET 8.
;;;   Tried: (1) check .NET 9 in Guix - not available, (2) check if runs on .NET 8 -
;;;   it doesn't, needs ASP.NET 9.0 APIs, (3) check for Docker/container approach -
;;;   outside scope.
;;; gbm (#18281): VB.NET application requiring mono-basic compiler; mono-basic not in Guix.
;;; mailnaggertray-git (#18388): Rust app requiring 'mailnagger' (not in Guix, not on
;;;   crates.io); upstream has no releases and minimal activity.
;;; pulumi-git (#18283): Large multi-language project (Go + Node.js + Python + .NET);
;;;   build requires all four ecosystems simultaneously.
;;; vegastrike-git (#18277): Requires vegastrike-engine (not in Guix); engine is a
;;;   large C++ project with FetchContent CMake deps. Packaging engine first would be
;;;   a separate multi-package effort.
;;; arti-git (#18672): Tor in Rust with 200+ crate dependencies; requires generating a
;;;   full Cargo.lock manifest and packaging/vendoring all crates.
;;;   Tried: (1) check guix import crate - works but generates 200+ package definitions,
;;;   (2) check if pre-built binary available - Tor Project only ships C Tor binaries,
;;;   (3) check cargo-build-system with vendored crates - feasible but requires manually
;;;   resolving 200+ crate hashes.
;;; fido2-hid-bridge: RESOLVED in this pass (see recipe above).
;;;
;;; === NEEDS_RECIPE_DESIGN (4) ===
;;; sipgate-app-clinq (#18567): Proprietary Electron app; not in AUR cache.
;;; knossu (#18547): Binary-only game from 2015; depends on glew1.10 + libpng12
;;;   (ancient library versions). No source code available.
;;;   Tried: (1) check for source - no source release ever made, (2) check binary
;;;   compatibility with current libs - requires exact glew 1.10 and libpng 1.2 APIs,
;;;   (3) check LD_LIBRARY_PATH wrapper approach - too fragile for ancient binaries.
;;; python-gradio-pdf (#18283): Blocked on python-gradio which has a massive dependency
;;;   tree (React frontend, Node.js build, 100+ Python deps).
;;; futu-ftnn-wine (#18311): Proprietary Chinese stock trading app running via Wine;
;;;   depends on Wine + wine-mono + proprietary Windows binary.
