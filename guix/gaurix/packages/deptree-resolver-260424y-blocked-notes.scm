;;; deptree-resolver-260424y --- Blocked Package Notes
;;;
;;; 100 BLOCKED packages evaluated, all 100 selected for resolution.
;;; Results: 5 new recipes, 19 AUR_REPO_DELETED, 76 remain BLOCKED.
;;;
;;; === NEW RECIPES (5) ===
;;; 1. wooting-udev v1.0.1 — udev rules for Wooting keyboards
;;; 2. lamzu-maya-x-udev v1.0.1 — udev rules for Lamzu Maya X mouse
;;; 3. udiskie-systemd v0.0.1 — systemd user service for udiskie
;;; 4. neoforge-server v21.1.172 — Minecraft NeoForge modded server
;;; 5. pixelflasher v9.0.2.0 — Pixel phone flashing GUI utility
;;;
;;; === AUR REPO DELETED (19) ===
;;; - celeste64 (#18190) — AUR git repository empty/deleted as of 2026-04-25
;;; - clspv-git (#18156) — AUR git repository empty/deleted
;;; - codeblocks-svn (#18158) — AUR git repository empty/deleted
;;; - dotnet-runtime-5.0-bin (#33221) — AUR git repository empty/deleted
;;; - dotnet-runtime-6.0-bin (#32716) — AUR git repository empty/deleted
;;; - elp (#19246) — AUR git repository empty/deleted
;;; - feather-music-git (#18195) — AUR git repository empty/deleted
;;; - ffmpeg-full-git (#18189) — AUR git repository empty/deleted
;;; - huawei-me936-udev (#11204) — AUR git repository empty/deleted
;;; - kodi-addon-pvr-hts (#18229) — AUR git repository empty/deleted
;;; - libga68-snapshot (#19629) — AUR git repository empty/deleted
;;; - libgfortran-snapshot (#19625) — AUR git repository empty/deleted
;;; - libgnat-snapshot (#19623) — AUR git repository empty/deleted
;;; - libgo-snapshot (#19622) — AUR git repository empty/deleted
;;; - realesrgan-ncnn-vulkan (#18232) — AUR git repository empty/deleted
;;; - shadps4-git (#18192) — AUR git repository empty/deleted
;;; - smuxi-server (#41720) — AUR git repository empty/deleted
;;; - systemd-ukify-git (#18200) — AUR git repository empty/deleted
;;; - thunderbird-globalmenu (#18157) — AUR git repository empty/deleted
;;;
;;; === REMAINING BLOCKED — BY CATEGORY ===
;;;
;;; MINGW_CROSS_COMPILATION (9):
;;;   mingw-w64-boost (#23783), mingw-w64-cblas (#34115),
;;;   mingw-w64-cppwinrt (#43750), mingw-w64-lame (#34112),
;;;   mingw-w64-lapack (#34113), mingw-w64-pcre2 (#26805),
;;;   mingw-w64-postgresql (#24572), mingw-w64-spirv-tools (#42666),
;;;   mingw-w64-sqlite (#25121)
;;;   Reason: Windows cross-compilation toolchain (mingw-w64) not available
;;;   in Guix.  These libraries target the Windows platform.
;;;   A1: Guix has i686-w64-mingw32/x86_64-w64-mingw32 cross-toolchains
;;;       but no mingw-w64-cmake wrapper or build infrastructure.
;;;   A2: Native Linux equivalents exist but are not interchangeable
;;;       (different target platform).
;;;   A3: Building a full mingw-w64 library stack is out of scope.
;;;
;;; MULTILIB_UNSUPPORTED (5):
;;;   lib32-libglade (#45410), lib32-libxpm (#16491),
;;;   lib32-opencl-nvidia-390xx (#17502), lib32-sdl_sound (#22729),
;;;   capt-src (#17255)
;;;   Reason: 32-bit multilib packages; Guix uses per-architecture builds
;;;   rather than multilib.  These require lib32-* infrastructure.
;;;   A1: Guix builds for i686-linux natively, but lib32 ABI compat within
;;;       x86_64 is not supported.
;;;   A2: firestorm-next-bin (#17261) also requires lib32 deps (lib32-libidn).
;;;   A3: etlegacy32-mod (#17424) is a 32-bit game mod requiring 32-bit libs.
;;;   Total with multilib issues: 7 packages.
;;;
;;; LEGACY_PYTHON2 (4):
;;;   boost-python2 (#37225), python2-dbus (#37854),
;;;   python2-gimp (#23210), python2-wxpython3 (#25153)
;;;   Reason: Python 2 reached end-of-life in January 2020.  These packages
;;;   require Python 2.7 bindings which Guix no longer supports.
;;;   A1: No Python 3 ports exist for these specific AUR packages.
;;;   A2: Upstream projects have either migrated to Python 3 or been abandoned.
;;;   A3: Guix's python2 package is deprecated/removed.
;;;
;;; DISTRO_SPECIFIC (7):
;;;   asp (#14587), auracle-git (#2160), aurutils (#11354),
;;;   chromium-extension-arch-search (#17897), pacpak-git (#17862),
;;;   pamac-cli (#17940), python-pypi2pkgbuild (#17822)
;;;   Reason: Arch Linux-specific tools that depend on pacman, makepkg,
;;;   AUR infrastructure, or PKGBUILD formats.
;;;   A1: asp/aurutils/auracle-git depend on pacman and AUR APIs.
;;;   A2: pamac-cli depends on libpamac (Manjaro package manager).
;;;   A3: chromium-extension-arch-search is a browser extension for Arch
;;;       package search.  pacpak-git wraps flatpak with pacman syntax.
;;;       python-pypi2pkgbuild generates Arch PKGBUILDs from PyPI.
;;;
;;; PROPRIETARY_BINARY (5):
;;;   brother-mfc-l2400dw (#17797), deepin-wine8-stable (#35454),
;;;   inkdrop (#17819), squareline-studio (#17812),
;;;   vmware-workstation (#1833)
;;;   Reason: Proprietary binary distributions with restrictive licenses
;;;   that cannot be freely redistributed.
;;;   A1: brother-mfc-l2400dw requires Brother commercial printer drivers.
;;;   A2: deepin-wine8-stable is a proprietary Wine fork from Deepin.
;;;   A3: inkdrop, squareline-studio, vmware-workstation are commercial
;;;       products with custom licenses.
;;;
;;; PLATFORM_UNSUPPORTED (4):
;;;   android-platform-19 (#28671), android-platform-21 (#23109),
;;;   bakkesmod-steam (#17468), euroscope-bin (#17945)
;;;   Reason: Target platform not supported on GNU/Linux.
;;;   A1: android-platform-* require Android SDK infrastructure.
;;;   A2: bakkesmod-steam is a Windows-only Rocket League game mod.
;;;   A3: euroscope-bin runs through Wine (Windows ATC simulator).
;;;
;;; HARDWARE_SPECIFIC (3):
;;;   etlegacy32-mod (#17424), ffmpeg-cuda-full (#17346),
;;;   python-jax-rocm (#17278)
;;;   Reason: Require specific hardware vendor SDKs or drivers.
;;;   A1: ffmpeg-cuda-full requires NVIDIA CUDA toolkit.
;;;   A2: python-jax-rocm requires AMD ROCm stack.
;;;   A3: etlegacy32-mod requires 32-bit graphics libraries (multilib).
;;;
;;; ABANDONED_UPSTREAM (3):
;;;   clash-for-windows-chinese (#17433),
;;;   lightdm-webkit-theme-aether (#19028),
;;;   qtspim-iconfix (#18421)
;;;   Reason: Upstream projects discontinued or archived.
;;;   A1: clash-for-windows-chinese: project shut down by upstream.
;;;   A2: lightdm-webkit-theme-aether: no updates since 2019, depends
;;;       on lightdm-webkit2-greeter which is also unmaintained.
;;;   A3: qtspim-iconfix: upstream spim project no longer maintained.
;;;
;;; NON_DISTRIBUTABLE (2):
;;;   factorio-space-age-experimental (#17440),
;;;   ttf-consolas-ligaturized (#20499)
;;;   Reason: Commercial content or non-redistributable licenses.
;;;   A1: factorio is a commercial game requiring purchase.
;;;   A2: ttf-consolas-ligaturized derives from Microsoft's Consolas font
;;;       which has a restrictive EULA.
;;;
;;; COMPLEX_DEPS (2):
;;;   darling-cli-devenv-gui-common-git (#22161),
;;;   darling-iosurface-git (#22171)
;;;   Reason: Part of the Darling macOS compatibility layer which requires
;;;   a massive dependency tree (darling-system-git, custom kernel modules,
;;;   macOS framework reimplementations).
;;;   A1: darling-system-git is not in Guix and would be enormous to package.
;;;   A2: Requires custom kernel module (darling-mach) for Mach IPC emulation.
;;;   A3: Cross-platform framework reimplementation scope is prohibitive.
;;;
;;; DKMS_KERNEL_MODULE (2):
;;;   libch343ser-git (#17880), nvidia-bl-dkms (#17755)
;;;   Reason: DKMS kernel modules require kernel source tree integration.
;;;   A1: libch343ser-git is a USB serial driver for WCH CH343/CH344 chips.
;;;   A2: nvidia-bl-dkms is a backlight driver for legacy NVIDIA GPUs.
;;;   A3: Guix handles kernel modules differently from DKMS; would need
;;;       custom kernel configuration.
;;;
;;; KERNEL_SPECIFIC (3):
;;;   zfs-linux-git-headers (#17919), zfs-linux-hardened-headers (#17921),
;;;   zfs-linux-rt-headers (#17920)
;;;   Reason: ZFS kernel headers tied to specific kernel variants
;;;   (linux-hardened, linux-rt, linux-git) and specific kernel versions.
;;;   A1: These require exact kernel version matches (e.g., linux-rt=6.14.0).
;;;   A2: Guix has its own ZFS packaging approach via linux-libre.
;;;   A3: Kernel-specific headers are not meaningful without the matching
;;;       kernel package.
;;;
;;; PROPRIETARY_PLATFORM (1):
;;;   quartus-free-quartus (#23279)
;;;   Reason: Intel FPGA IDE with proprietary platform requirements.
;;;   A1: Requires proprietary Intel FPGA toolchain components.
;;;   A2: Depends on ld-lsb and various system libraries at specific paths.
;;;   A3: License (LicenseRef-QuartusPrime) prohibits redistribution.
;;;
;;; PROPRIETARY_DEP (3):
;;;   libfprint-2-tod1-broadcom-cv3plus (#17912),
;;;   python-pylink-square (#21233),
;;;   soapysdrplay3-luarvique-git (#18141)
;;;   Reason: Depend on proprietary libraries not available in Guix.
;;;   A1: libfprint-2-tod1-broadcom needs proprietary Broadcom driver blob.
;;;   A2: python-pylink-square needs SEGGER J-Link proprietary SDK.
;;;   A3: soapysdrplay3 needs proprietary libsdrplay from SDRplay.
;;;
;;; DEP_RESOLUTION_FAILED (8):
;;;   audacious-plugins-git (#17814) — requires audacious-git (development
;;;     version API not available in Guix's audacious 4.4.2).
;;;   deadbeef-git (#17914) — requires libblocksruntime (Clang Blocks
;;;     runtime not available as standalone in Guix).
;;;   envoyproxy (#17824) — Bazel build system with hundreds of deps;
;;;     Guix lacks Bazel build-system support.
;;;   freetube-electron-git (#17925) — requires electron41 (specific
;;;     Electron version not in Guix) and yarn for node_modules.
;;;   openconnect-sso-git (#18168) — requires python-pyqt6 and
;;;     python-pyqt6-webengine (not in Guix; only python-pyqt/Qt5).
;;;   smtube (#18131) — requires qt5-webkit/qtwebkit (deprecated and
;;;     not available in Guix).
;;;   openfortivpn-webview-electron (#18167) — requires electron28.
;;;   nodejs-cspell (#18215) — npm package requiring hundreds of Node.js
;;;     dependencies not individually packaged in Guix.
;;;
;;; BUILD_SYSTEM_TOO_COMPLEX (6):
;;;   eclipse-pydev (#17948) — Eclipse IDE plugin using OSGi/P2 update
;;;     mechanism; Guix has no Eclipse plugin build system.
;;;   glibc-eac (#24719) — modified glibc with DT_HASH patch; system-level
;;;     modification that conflicts with Guix's glibc package.
;;;   illogical-impulse-ags (#17937) — AGS shell requiring npm + typescript
;;;     + gjs + GTK3 integration with build-time npm install.
;;;   texmacs-pure (#17873) — requires Pure language interpreter and
;;;     LLVM 3.5 (Guix only has LLVM 21.x).
;;;   wine-osu-spectator-wow64 (#18197) — custom Wine build with osu!
;;;     patches; full Wine compilation is extremely complex.
;;;   futu-ftnn-wine (#18151) — Chinese stock trading app requiring Wine +
;;;     proprietary installer; redistributability unclear.
;;;
;;; CROSS_COMPILATION (1):
;;;   kamilsss655-uv-k5-firmware-custom-git (#17909) — firmware for UV-K5
;;;     handheld radio requiring arm-none-eabi cross-compilation toolchain.
;;;   A1: Guix has arm-none-eabi support via cross-compilation but the
;;;       firmware build process (Makefile + python-crcmod) needs specific
;;;       toolchain integration not readily available.
;;;   A2: Alternative firmware builds exist but all need ARM bare-metal tools.
;;;   A3: Packaging the pre-built firmware binary is not useful (device-
;;;       specific, user must flash with custom serial programmer).
;;;
;;; COMPLEX_DEPS (remaining, 5):
;;;   anyrun-git (#17933) — Rust/Wayland launcher needing gtk4-layer-shell
;;;     (not in Guix) plus full cargo dependency resolution.
;;;   emerald (#22333) — Compiz window decorator; depends on compiz-core
;;;     (not in Guix, project largely abandoned).
;;;   linux-gpib (#20547) — GPIB device driver requiring kernel headers for
;;;     specific kernel version range (linux>=6.16,<6.17).
;;;   smoothpaper (#18241) — Go wallpaper daemon; go-build-system needs all
;;;     Go module dependencies vendored; guix import go failed (not on pkg.go.dev).
;;;   wldash (#18237) — Rust Wayland dashboard; cargo-build-system needs all
;;;     crate dependencies listed; no guix import crate available for this package.
;;;
;;; SOURCE_UNAVAILABLE (1):
;;;   llvm40-libs (#35628) — LLVM 4.0 runtime libraries.  While AUR PKGBUILD
;;;     exists, LLVM 4.0 source requires Python 2 to build and is heavily
;;;     outdated (2017).  Guix only provides LLVM 21.x.
;;;   A1: LLVM 4.0 source is available at llvm.org but build requires python2.
;;;   A2: Guix's llvm package could theoretically be modified to build 4.0
;;;       but the effort is disproportionate for a single legacy library.
;;;   A3: Packages depending on llvm40-libs should migrate to newer LLVM.
;;;
;;; === TOTAL SUMMARY ===
;;; New recipes: 5
;;; AUR repo deleted: 19
;;; MINGW_CROSS_COMPILATION: 9
;;; MULTILIB_UNSUPPORTED: 7 (5 lib32-* + capt-src + firestorm-next-bin)
;;; LEGACY_PYTHON2: 4
;;; DISTRO_SPECIFIC: 7
;;; PROPRIETARY_BINARY: 5
;;; PLATFORM_UNSUPPORTED: 4
;;; HARDWARE_SPECIFIC: 3
;;; ABANDONED_UPSTREAM: 3
;;; NON_DISTRIBUTABLE: 2
;;; COMPLEX_DEPS: 7 (darling×2 + anyrun + emerald + linux-gpib + smoothpaper + wldash)
;;; DKMS_KERNEL_MODULE: 2
;;; KERNEL_SPECIFIC: 3
;;; PROPRIETARY_PLATFORM: 1
;;; PROPRIETARY_DEP: 3
;;; DEP_RESOLUTION_FAILED: 8
;;; BUILD_SYSTEM_TOO_COMPLEX: 6
;;; CROSS_COMPILATION: 1
;;; SOURCE_UNAVAILABLE: 1
;;; Total: 5 + 19 + 76 = 100 ✓
