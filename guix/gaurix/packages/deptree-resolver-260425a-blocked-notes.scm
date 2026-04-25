;;; deptree-resolver-260425a --- Blocked Package Notes
;;;
;;; 100 BLOCKED packages evaluated, all 100 selected for resolution.
;;; Results: 6 new recipes, 2 ALREADY_RESOLVED, 11 AUR_REPO_DELETED, 81 remain BLOCKED.
;;;
;;; === NEW RECIPES (6) ===
;;; 1. secho v1.2.0 — colorful replacement for echo (source build)
;;; 2. openjlc-bin v2.23.7 — ultra-fast Gerber conversion tool (prebuilt)
;;; 3. roon-tui-bin v0.3.2 — Roon remote for the terminal (prebuilt)
;;; 4. openstack-tui-bin v0.13.5 — terminal UI for OpenStack (prebuilt)
;;; 5. blahaj-bin v2.2.0 — lolcat-like CLI with pride colors (static binary)
;;; 6. cosu-trainer-bin v0.15 — osu! map parameter editor (AppImage)
;;;
;;; === ALREADY RESOLVED (2) ===
;;; - quickenv-bin v0.4.4 — recipe exists in recipe-resolver-260418e.scm
;;; - playit-bin v0.17.1 — recipe exists in recipe-resolver-260408o.scm
;;;
;;; === AUR REPO DELETED (10, re-confirmed) ===
;;; - elp (#19246) — AUR git repository empty/deleted
;;; - huawei-me936-udev (#11204) — AUR git repository empty/deleted
;;; - celeste64 (#18190) — AUR git repository empty/deleted
;;; - feather-music-git (#18195) — AUR git repository empty/deleted
;;; - clspv-git (#18156) — AUR git repository empty/deleted
;;; - kodi-addon-pvr-hts (#18229) — AUR git repository empty/deleted
;;; - smuxi-server (#41720) — AUR git repository empty/deleted
;;; - dotnet-runtime-5.0-bin (#33221) — AUR git repository empty/deleted
;;; - realesrgan-ncnn-vulkan (#18232) — AUR git repository empty/deleted
;;; - dotnet-runtime-6.0-bin (#32716) — AUR git repository empty/deleted
;;;
;;; === REMAINING BLOCKED — BY CATEGORY ===
;;;
;;; MINGW_CROSS_COMPILATION (8):
;;;   mingw-w64-cblas (#34115), mingw-w64-lapack (#34113),
;;;   mingw-w64-soundtouch (#22), mingw-w64-sqlite (#25121),
;;;   mingw-w64-boost (#23783), mingw-w64-cppwinrt (#43750),
;;;   mingw-w64-pcre2 (#26805), mingw-w64-spirv-tools (#42666),
;;;   mingw-w64-postgresql (#24572)
;;;   Reason: Windows cross-compilation toolchain (mingw-w64) not available
;;;   in Guix.  These libraries target the Windows platform.
;;;   A1: Guix has cross-toolchain support but no mingw-w64-cmake wrapper.
;;;   A2: Native Linux equivalents exist but target different platform.
;;;   A3: Building full mingw-w64 library stack is out of scope.
;;;
;;; MULTILIB_UNSUPPORTED (4):
;;;   lib32-opencl-nvidia-390xx (#17502), lib32-libglade (#45410),
;;;   lib32-libxpm (#16491), lib32-sdl_sound (#22729)
;;;   Reason: 32-bit multilib packages; Guix uses per-architecture builds
;;;   rather than multilib.  These require lib32-* infrastructure.
;;;   A1: Guix builds for i686-linux natively, but lib32 ABI compat within
;;;       x86_64 is not supported.
;;;   A2: No equivalent mechanism for 32-bit compat layer in Guix.
;;;   A3: Could theoretically use cross-compilation but impractical.
;;;
;;; LEGACY_PYTHON2 (3):
;;;   python2-wxpython3 (#25153), python2-dbus (#37854),
;;;   python2-gimp (#23210)
;;;   Reason: Python 2 reached end-of-life in January 2020.  These packages
;;;   require Python 2.7 bindings which Guix no longer supports.
;;;   A1: No Python 3 ports exist for these specific AUR packages.
;;;   A2: Upstream projects have either migrated to Python 3 or been abandoned.
;;;   A3: Guix's python2 package is deprecated/removed.
;;;
;;; DISTRO_SPECIFIC (5):
;;;   chromium-extension-arch-search (#17897), pacpak-git (#17862),
;;;   pamac-cli (#17940), python-pypi2pkgbuild (#17822),
;;;   asp (#14587), aurutils (#11354)
;;;   Reason: Arch Linux-specific tools that depend on pacman, makepkg,
;;;   AUR infrastructure, or PKGBUILD formats.
;;;   A1: These tools are tightly coupled to Arch Linux ecosystem.
;;;   A2: No meaningful use case on Guix System.
;;;   A3: Porting would require reimplementation, not just packaging.
;;;
;;; KERNEL_SPECIFIC (3):
;;;   zfs-linux-hardened-headers (#55), zfs-linux-rt-headers (#56),
;;;   zfs-linux-git-headers (#70)
;;;   Reason: Kernel-variant-specific ZFS header packages tied to specific
;;;   Linux kernel flavors (hardened, RT, git).
;;;   A1: Guix packages ZFS modules against its own kernel builds.
;;;   A2: These are meaningless outside the Arch kernel naming scheme.
;;;   A3: Guix's linux-libre kernel does not have these variants.
;;;
;;; KERNEL_MODULE (3):
;;;   libch343ser-git (#18), rtl88x2ce-dkms-git (#52), linux-gpib (#88)
;;;   Reason: Out-of-tree kernel modules using DKMS.
;;;   A1: Guix does not support DKMS (dynamic kernel module system).
;;;   A2: Kernel modules must be built against specific kernel in Guix.
;;;   A3: These require custom kernel configuration, out of scope.
;;;
;;; ANDROID_SDK_PLATFORM (2):
;;;   android-platform-19 (#28671), android-platform-21 (#23109)
;;;   Reason: Android SDK platform packages.  Guix has limited Android
;;;   SDK support.
;;;   A1: These are proprietary Google Android SDK components.
;;;   A2: Guix packages some Android tools but not SDK platforms.
;;;   A3: License restrictions prevent redistribution.
;;;
;;; PLATFORM_UNSUPPORTED (1):
;;;   bakkesmod-steam (#17468)
;;;   Reason: Windows-only BakkesMod for Rocket League via Steam.
;;;   A1: Requires Windows DLL injection into game process.
;;;   A2: No Linux version exists.
;;;   A3: Wine compatibility unknown and likely non-functional.
;;;
;;; PROPRIETARY_BINARY (1):
;;;   libfprint-2-tod1-broadcom-cv3plus (#19)
;;;   Reason: Proprietary Broadcom fingerprint driver blob.
;;;   A1: Closed-source binary-only driver.
;;;   A2: Guix policy restricts non-free software.
;;;   A3: No open-source alternative available.
;;;
;;; PROPRIETARY_DEP (1):
;;;   soapysdrplay3-luarvique-git (#67)
;;;   Reason: Depends on proprietary SDRplay API (libsdrplay_api).
;;;   A1: SDRplay API is closed-source, requires license agreement.
;;;   A2: Cannot build without proprietary dependency.
;;;   A3: No open-source alternative for SDRplay hardware.
;;;
;;; SOURCE_UNAVAILABLE (7):
;;;   squareline-studio (#17812) — proprietary GUI designer, no public download
;;;   euroscope-bin (#44) — Windows ATC simulator, source not public
;;;   ut2004-gog (#54) — GOG game, requires purchase/account
;;;   inkdrop (#61) — proprietary note app, requires subscription
;;;   smtube (#66) — upstream sourceforge page removed
;;;   unrealtournament4 (#68) — Epic Games, requires Epic account
;;;   llvm40-libs (#89) — AUR git repo deleted, LLVM 4.0 obsolete
;;;   A1: No publicly accessible download URL for source/binary.
;;;   A2: Some require commercial licenses or accounts.
;;;   A3: Cannot create reproducible package without stable source.
;;;
;;; NON_DISTRIBUTABLE (1):
;;;   factorio-space-age-experimental (#73)
;;;   Reason: Commercial game DLC, cannot redistribute.
;;;   A1: Requires Factorio purchase and account.
;;;   A2: License prohibits redistribution of game files.
;;;   A3: Similar to other commercial game packages.
;;;
;;; ABANDONED_UPSTREAM (1):
;;;   clash-for-windows-chinese (#42)
;;;   Reason: Clash for Windows project abandoned, developer deleted repos.
;;;   A1: Original GitHub repository deleted in November 2023.
;;;   A2: No maintained fork with releases.
;;;   A3: Alternative clients exist but are different packages.
;;;
;;; CROSS_COMPILATION (1):
;;;   kamilsss655-uv-k5-firmware-custom-git (#62)
;;;   Reason: ARM cross-compilation firmware for Quansheng UV-K5 radio.
;;;   A1: Requires arm-none-eabi-gcc cross-compiler toolchain.
;;;   A2: Guix has cross-compilation support but this firmware build
;;;       is complex with custom linker scripts.
;;;   A3: Firmware binary could theoretically be packaged but build
;;;       toolchain integration is non-trivial.
;;;
;;; ARCH_SPECIFIC (2):
;;;   mkinitcpio-systemd-root-password (#10)
;;;   mkinitcpio-clevis-hook (#91)
;;;   Reason: mkinitcpio hooks are Arch-specific initramfs tools.
;;;   A1: Guix uses its own initrd generation, not mkinitcpio.
;;;   A2: These hooks have no equivalent purpose on Guix System.
;;;   A3: Functionality could be reimplemented as Guix services but
;;;       that's a different package entirely.
;;;
;;; COMPLEX_DEPS (1):
;;;   glibc-eac (#86)
;;;   Reason: Patched glibc for Easy Anti-Cheat compatibility.
;;;   A1: Replacing system glibc is dangerous and Guix-incompatible.
;;;   A2: Requires specific glibc patches that may break other software.
;;;   A3: Better handled via Guix system configuration, not a package.
;;;
;;; LICENSE_REVIEW_NEEDED (4):
;;;   brother-mfc-l2400dw (#15) — Brother proprietary printer driver,
;;;     requires lib32-glibc (multilib), custom commercial license.
;;;     A1: Proprietary binary, non-free license.
;;;     A2: Requires 32-bit multilib support.
;;;     A3: Brother provides Linux drivers but with restrictive license.
;;;   ttf-consolas-ligaturized (#27) — Modified Microsoft Consolas font,
;;;     custom license (derivative of proprietary font).
;;;     A1: Consolas is a Microsoft proprietary font.
;;;     A2: Ligaturized version is a derivative work of proprietary font.
;;;     A3: Cannot redistribute without Microsoft permission.
;;;   geekbench-ai (#75) — Proprietary benchmark tool,
;;;     custom Geekbench license.
;;;     A1: Proprietary commercial software.
;;;     A2: Free tier exists but license restricts redistribution.
;;;     A3: Binary-only, no source available.
;;;   anytxt-bin (#97) — Proprietary desktop search tool, freeware license.
;;;     A1: Closed-source software with freeware license.
;;;     A2: Requires multiple Qt/GTK libraries, complex binary.
;;;     A3: No source available for building from source.
;;;
;;; DEP_RESOLUTION_FAILED — remaining (16):
;;;   wayfire-git (#1) — Wayland compositor, depends on wlroots-git
;;;     (custom wlroots fork/version not in Guix).
;;;     A1: Guix has wlroots but wayfire-git needs bleeding-edge version.
;;;     A2: Building from source requires matching wlroots API.
;;;     A3: Stable wayfire release may work but AUR only has -git variant.
;;;   aws-amplify-cli (#13) — Node.js CLI with massive npm dependency tree.
;;;     A1: npm packages not individually packaged in Guix.
;;;     A2: node-build-system cannot handle 1000+ transitive deps.
;;;     A3: Binary distribution not available from AWS.
;;;   aws-cdk (#14) — Node.js CLI with massive npm dependency tree.
;;;     A1: Same npm dependency issue as aws-amplify-cli.
;;;     A2: node-build-system cannot handle complex npm projects.
;;;     A3: CDK requires specific Node.js module resolution.
;;;   decrypto-pro-git (#16) — Depends on openssl-gost-engine (not in Guix).
;;;     A1: openssl-gost-engine is a Russian cryptography extension.
;;;     A2: Not packaged in Guix, complex OpenSSL engine plugin.
;;;     A3: Niche use case (CryptoPro key conversion).
;;;   nodejs-cspell (#24) — Node.js spell checker with npm deps.
;;;     A1: Complex npm dependency tree.
;;;     A2: node-build-system limitations.
;;;     A3: No standalone binary available.
;;;   beammp-launcher-git (#28) — Requires vcpkg (C++ package manager).
;;;     A1: vcpkg is not available in Guix.
;;;     A2: Complex C++ project with vcpkg-managed dependencies.
;;;     A3: No prebuilt Linux binary available.
;;;   latte-dock (#31) — KDE Plasma 5 dock, depends on plasma-framework5.
;;;     A1: Guix has KDE Frameworks but plasma-framework5 integration
;;;         is incomplete.
;;;     A2: Latte Dock is discontinued (archived upstream).
;;;     A3: KDE Plasma 6 has replaced Plasma 5 components.
;;;   lightdm-webkit-theme-aether (#32) — Depends on lightdm-webkit2-greeter.
;;;     A1: lightdm-webkit2-greeter not packaged in Guix.
;;;     A2: WebKit-based greeter is complex to package.
;;;     A3: Arch-specific theme references.
;;;   nvidia-bl-dkms (#33) — Legacy NVIDIA backlight DKMS module.
;;;     A1: DKMS not supported in Guix.
;;;     A2: Kernel module for very old NVIDIA GPUs.
;;;     A3: No upstream URL, abandoned project.
;;;   vesktop-electron (#40) — Electron app requiring pnpm + npm build.
;;;     A1: Complex Node.js/Electron build with pnpm.
;;;     A2: Electron version pinning issues.
;;;     A3: No prebuilt standalone binary available.
;;;   truckersmp-cli (#53) — Depends on mingw-w64-gcc for Windows DLLs.
;;;     A1: Requires Windows cross-compilation.
;;;     A2: Game mod requiring Wine + Windows components.
;;;     A3: Complex multi-platform build.
;;;   fortran_stdlib (#58) — Depends on fypp (Fortran preprocessor).
;;;     A1: fypp not packaged in Guix.
;;;     A2: Could package fypp first, but it's a Python tool.
;;;     A3: gcc-fortran available but fypp is the blocker.
;;;   hq (#60) — Depends on modest (HTML parser library, not in Guix).
;;;     A1: modest (Modest HTML parser) not packaged in Guix.
;;;     A2: modest has its own complex build.
;;;     A3: Small project, niche use case.
;;;   xidlehook (#69) — Rust project, no prebuilt binary, complex crate deps.
;;;     A1: cargo-build-system requires listing all crate dependencies.
;;;     A2: No GitHub releases with prebuilt binaries.
;;;     A3: Would need guix import crate + manual dependency resolution.
;;;   vegastrike-git (#83) — Depends on vegastrike-engine (not in Guix).
;;;     A1: vegastrike-engine is a complex game engine, not packaged.
;;;     A2: Also needs python-kivy and python-screeninfo.
;;;     A3: Very large build with many unpackaged dependencies.
;;;   eddiscovery (#85) — .NET/Mono application requiring msbuild + nuget.
;;;     A1: msbuild not packaged in Guix.
;;;     A2: NuGet package restoration requires network.
;;;     A3: .NET ecosystem poorly supported in Guix.
;;;
;;; MISSING_DEP — remaining (3):
;;;   texmacs-pure (#38) — Depends on 'pure' language (not in Guix).
;;;     A1: Pure programming language not packaged in Guix.
;;;     A2: Also depends on LLVM 3.5 (extremely old).
;;;     A3: Pure language project appears largely unmaintained.
;;;   eclipse-pydev (#43) — Depends on Eclipse IDE (not fully in Guix).
;;;     A1: Eclipse IDE not fully packaged in Guix.
;;;     A2: Complex Java/OSGi plugin system.
;;;     A3: Would need Eclipse base package first.
;;;   emerald (#99) — Depends on compiz-core (not in Guix).
;;;     A1: Compiz window manager not packaged in Guix.
;;;     A2: Compiz 0.8.x is legacy, mostly abandoned.
;;;     A3: Would need to package compiz-core first.
;;;
;;; BUILD_FAILED — remaining (1):
;;;   qtspim-iconfix (#51) — Qt5 MIPS simulator, SVN source.
;;;     A1: Source uses Subversion, complex checkout.
;;;     A2: Qt5 build with custom icon patching.
;;;     A3: Sourceforge SVN may have availability issues.
;;;
;;; TOOLING_FAILURE (1):
;;;   mingw-w64-soundtouch (#22) — mingw-w64 cross-compilation.
;;;     Already covered under MINGW_CROSS_COMPILATION category.
;;;
;;; NEEDS_RECIPE_DESIGN — remaining (2):
;;;   librewolf-extension-ublock-origin-bin (#8) — Browser extension for
;;;     LibreWolf, depends on librewolf (not in Guix).
;;;     A1: LibreWolf not packaged in Guix.
;;;     A2: Browser extensions need special install mechanism.
;;;     A3: Guix has IceCat but not LibreWolf.
;;;   librewolf-tridactyl-native-bin (#9) — Native messaging host for
;;;     LibreWolf's Tridactyl extension.
;;;     A1: Depends on LibreWolf (not in Guix).
;;;     A2: Native messaging requires browser-specific paths.
;;;     A3: Could theoretically work with IceCat but untested.
;;;   nftables-geoip-db (#23) — GeoIP database for nftables.
;;;     A1: Requires downloading and processing IP geolocation database.
;;;     A2: Build depends on perl-text-csv-xs and perl-net-cidr-lite.
;;;     A3: Database updates frequently, versioning is complex.
;;;   futu-ftnn-wine (#59) — Chinese stock trading app via Wine.
;;;     A1: Requires Wine + wine-mono + specific Chinese fonts.
;;;     A2: Unknown license, possibly proprietary.
;;;     A3: Niche regional application.
;;;   fileoptimizer-bin (#74) — Windows app running under Wine.
;;;     A1: Requires Wine + wine-mono + wine-gecko stack.
;;;     A2: Complex Wine application with many DLL dependencies.
;;;     A3: Would need extensive Wine prefix configuration.
;;;
;;; TOTAL: 8 resolved + 10 AUR_REPO_DELETED + 82 remain BLOCKED = 100
