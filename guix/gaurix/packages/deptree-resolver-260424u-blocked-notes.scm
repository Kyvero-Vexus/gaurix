;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Blocked notes for deptree-resolver-260424u
;;; Timestamp: 2026-04-24T18:00:00+00:00
;;; 86 packages remain BLOCKED (9 recipes + 3 ALREADY_IN_GUIX = 12 resolved from 98)
;;;
;;; === NEW RECIPES (11 resolved + 2 new deps) ===
;;; liboqs (new dep), oqs-provider (oqsprovider-git), libcanlock (new dep),
;;; slrn-canlock (slrn-snapshot-canlock), better-control (better-control-git),
;;; erwise, gtk-theme-config, slxfig-snapshot, d2vsource
;;; (vapoursynth-plugin-d2vsource-git), pulseeffects-legacy, vinyl-theme (vinyl-git)
;;;
;;; === ALREADY IN GUIX (3 resolved) ===
;;; gcc8 (#26185) -> gcc-toolchain@8 in (gnu packages commencement) v8.5.0
;;; boost1.86-libs (#19936) -> boost in (gnu packages boost) v1.89.0
;;; boost183-libs (#20944) -> boost in (gnu packages boost) v1.89.0
;;;
;;; === REMAINING BLOCKED (82 packages) ===

(define-module (gaurix packages deptree-resolver-260424u-blocked-notes)
  #:use-module (guix packages)
  #:use-module (guix gexp)
  #:use-module ((guix licenses) #:prefix license:))

;;; --- SOURCE_UNAVAILABLE (5 packages) ---
;;; elp (#19246): SOURCE_UNAVAILABLE: no upstream URL, package flagged out-of-date, no source mirror found
;;; huawei-me936-udev (#11204): SOURCE_UNAVAILABLE: URL is null, package provides only udev rules with no source
;;; squareline-studio (#17812): SOURCE_UNAVAILABLE: commercial LVGL GUI designer, download-gated behind account
;;; euroscope-bin (#17945): SOURCE_UNAVAILABLE: Windows-only ATC simulator via Wine, custom license, no Linux build
;;; inkdrop (#17819): SOURCE_UNAVAILABLE: proprietary Electron note-taking app, custom license, no redistributable source

;;; --- PROPRIETARY_BINARY (5 packages) ---
;;; libfprint-2-tod1-broadcom-cv3plus (#17912): PROPRIETARY_BINARY: Broadcom fingerprint sensor proprietary binary driver
;;; dropbox (#2254): PROPRIETARY_BINARY: closed-source cloud sync client
;;; realvnc-rvnc-connect (#17860): PROPRIETARY_BINARY: commercial remote desktop
;;; deepin-wine8-stable (#35454): PROPRIETARY_BINARY: Deepin proprietary Wine fork
;;; vmware-workstation (#1833): PROPRIETARY_BINARY: proprietary virtualization platform

;;; --- PLATFORM_UNSUPPORTED (1 package) ---
;;; bakkesmod-steam (#17468): PLATFORM_UNSUPPORTED: Windows-only Rocket League modding tool

;;; --- ANDROID_SDK_PLATFORM (2 packages) ---
;;; android-platform-19 (#28671): ANDROID_SDK_PLATFORM: Android SDK platform API 19, requires Android SDK toolchain
;;; android-platform-21 (#23109): ANDROID_SDK_PLATFORM: Android SDK platform API 21, requires Android SDK toolchain

;;; --- LICENSE_REVIEW_NEEDED (2 packages) ---
;;; brother-mfc-l2400dw (#17797): NON_DISTRIBUTABLE: Brother proprietary commercial printer driver, also requires lib32-glibc
;;; ttf-consolas-ligaturized (#20499): NON_DISTRIBUTABLE: Microsoft Consolas is proprietary, cannot redistribute

;;; --- MULTILIB_UNSUPPORTED (7 packages) ---
;;; lib32-opencl-nvidia-390xx (#17502): MULTILIB_UNSUPPORTED: 32-bit NVIDIA OpenCL for legacy 390xx driver
;;; lib32-libglade (#45410): MULTILIB_UNSUPPORTED: 32-bit libglade, Guix lacks multilib
;;; lib32-libxpm (#16491): MULTILIB_UNSUPPORTED: 32-bit libXpm library
;;; lib32-sdl_sound (#22729): MULTILIB_UNSUPPORTED: 32-bit SDL_sound library
;;; capt-src (#17255): MULTILIB_UNSUPPORTED: Canon CAPT printer driver requiring 32-bit components
;;; firestorm-next-bin (#17261): MULTILIB_UNSUPPORTED: Second Life viewer requiring 32-bit libraries
;;; etlegacy32-mod (#17424): MULTILIB_UNSUPPORTED: 32-bit game mod

;;; --- MINGW_CROSS_COMPILATION (9 packages) ---
;;; mingw-w64-cblas (#34115): MINGW_CROSS_COMPILATION: CBLAS for Windows cross-compilation
;;; mingw-w64-lapack (#34113): MINGW_CROSS_COMPILATION: LAPACK for Windows cross-compilation
;;; mingw-w64-sqlite (#25121): MINGW_CROSS_COMPILATION: SQLite for Windows cross-compilation
;;; mingw-w64-boost (#23783): MINGW_CROSS_COMPILATION: Boost for Windows cross-compilation
;;; mingw-w64-cppwinrt (#43750): MINGW_CROSS_COMPILATION: C++/WinRT for Windows, platform-specific API
;;; mingw-w64-pcre2 (#26805): MINGW_CROSS_COMPILATION: PCRE2 for Windows cross-compilation
;;; mingw-w64-spirv-tools (#42666): MINGW_CROSS_COMPILATION: SPIR-V tools for Windows cross-compilation
;;; mingw-w64-postgresql (#24572): MINGW_CROSS_COMPILATION: PostgreSQL for Windows cross-compilation
;;; mingw-w64-lame (#34112): MINGW_CROSS_COMPILATION: LAME for Windows cross-compilation

;;; --- KERNEL_MODULE (2 packages) ---
;;; libch343ser-git (#17880): KERNEL_MODULE: WinChipHead CH343 serial DKMS driver
;;; linux-gpib (#20547): KERNEL_MODULE: GPIB/IEEE-488 DKMS kernel driver

;;; --- KERNEL_SPECIFIC (3 packages) ---
;;; zfs-linux-hardened-headers (#17921): KERNEL_SPECIFIC: ZFS headers for hardened kernel
;;; zfs-linux-rt-headers (#17920): KERNEL_SPECIFIC: ZFS headers for RT kernel
;;; zfs-linux-git-headers (#17919): KERNEL_SPECIFIC: ZFS headers for git kernel

;;; --- DISTRO_SPECIFIC (6 packages) ---
;;; pacpak-git (#17862): DISTRO_SPECIFIC: pacman wrapper for flatpak
;;; chromium-extension-arch-search (#17897): DISTRO_SPECIFIC: Arch-specific browser extension
;;; pamac-cli (#17940): DISTRO_SPECIFIC: Manjaro/Arch package manager CLI
;;; python-pypi2pkgbuild (#17822): DISTRO_SPECIFIC: PKGBUILD generator, requires namcap/pacman
;;; aurutils (#11354): DISTRO_SPECIFIC: AUR helper utilities, requires pacman
;;; auracle-git (#2160): DISTRO_SPECIFIC: AUR client, depends on pacman
;;; asp (#14587): DISTRO_SPECIFIC: Arch Build System tool

;;; --- LEGACY_PYTHON2 (4 packages) ---
;;; python2-wxpython3 (#25153): LEGACY_PYTHON2: wxPython 3 for EOL Python 2
;;; python2-dbus (#37854): LEGACY_PYTHON2: D-Bus bindings for EOL Python 2
;;; python2-gimp (#23210): LEGACY_PYTHON2: GIMP Python 2 scripting
;;; boost-python2 (#37225): LEGACY_PYTHON2: Boost.Python for EOL Python 2

;;; --- OLD_VERSION_VARIANT (1 package) ---
;;; llvm40-libs (#35628): OLD_VERSION_VARIANT: LLVM 4.0.1, flagged out-of-date, requires Python 2 makedep

;;; --- OLD_ELECTRON (1 package) ---
;;; electron23-bin (#17970): OLD_ELECTRON: EOL Electron 23 runtime

;;; --- EOL_VERSION (2 packages) ---
;;; dotnet-runtime-5.0-bin (#33221): EOL_VERSION: .NET 5.0 is end-of-life
;;; dotnet-runtime-6.0-bin (#32716): EOL_VERSION: .NET 6.0 is end-of-life

;;; --- ABANDONED_UPSTREAM (1 package) ---
;;; clash-for-windows-chinese (#17433): ABANDONED_UPSTREAM: Clash for Windows has been discontinued

;;; --- NON_DISTRIBUTABLE (1 package) ---
;;; factorio-space-age-experimental (#17440): NON_DISTRIBUTABLE: commercial game

;;; --- CROSS_COMPILATION (2 packages) ---
;;; kamilsss655-uv-k5-firmware-custom-git (#17909): CROSS_COMPILATION: ARM embedded firmware, needs arm-none-eabi toolchain
;;; esp8266-rtos-sdk (#17825): CROSS_COMPILATION: ESP8266 SDK requiring Xtensa cross-toolchain for target builds

;;; --- MISSING_DEP (7 packages) ---
;;; texmacs-pure (#17873): MISSING_DEP: depends on Pure language (not in Guix) and llvm35
;;; eclipse-pydev (#17948): MISSING_DEP: depends on Eclipse IDE (not in Guix)
;;; smuxi-server (#41720): MISSING_DEP: Mono/.NET deps (log4net, nini, notify-sharp) not in Guix
;;; emerald (#22333): MISSING_DEP: depends on compiz-core (not in Guix)
;;; plasma6-applets-panon (#17808): MISSING_DEP: depends on pulseaudio-qt not available for Plasma 6
;;; slxfig-snapshot (#17879): resolved separately
;;; slrn-snapshot-canlock (#17889): resolved separately

;;; --- COMPLEX_BUILD (8 packages) ---
;;; perl-math-clipper (#22584): COMPLEX_BUILD: XS/C++ with missing Perl deps (perl-extutils-xspp, perl-module-build-withxspp)
;;; anyrun-git (#17933): COMPLEX_BUILD: Rust/Cargo, all crate dependencies must be specified for Guix cargo-build-system
;;; shadow-selinux (#24418): COMPLEX_BUILD: needs pam-selinux makedep not in Guix
;;; rpfm-git (#17833): COMPLEX_BUILD: needs ktexteditor@5 (KF5) not in Guix
;;; deadbeef-git (#17914): COMPLEX_BUILD: needs libblocksruntime not in Guix
;;; audacious-plugins-git (#17814): COMPLEX_BUILD: needs audacious-git dev version + libsidplayfp not in Guix
;;; reduce-common (#44133): COMPLEX_BUILD: SVN-only source, complex TeX-based build
;;; python-pylink-square (#21233): COMPLEX_BUILD: depends on proprietary SEGGER J-Link software

;;; --- COMPLEX_DEPS (4 packages) ---
;;; glibc-eac (#24719): COMPLEX_DEPS: patched glibc replacement, needs multilib makedeps
;;; freetube-electron-git (#17925): COMPLEX_DEPS: needs electron41 (not in Guix), yarn/npm build
;;; darling-cli-devenv-gui-common-git (#17916): COMPLEX_DEPS: macOS compat layer, needs gcc-multilib
;;; darling-iosurface-git (#17915): COMPLEX_DEPS: macOS compat layer, needs gcc-multilib

;;; --- BUILD_FAILED (3 packages) ---
;;; nvidia-bl-dkms (#17755): KERNEL_MODULE: DKMS kernel module, no source URL
;;; envoyproxy (#17824): COMPLEX_BUILD: massive Bazel-based build, requires specific clang18/libc++/llvm18 combo
;;; qtspim-iconfix (#18421): BUILD_FAILED: SVN-only source, GitHub mirrors dead (404), icon patches unavailable
;;;   Attempted: GitHub mirrors (AshwinKrishn/qtspim_iconfix, JamesLinus/spim) - both 404
;;;   Attempted: SourceForge SVN (svn.code.sf.net) - accessible but no tarballs, patches unknown
;;;   Attempted: alternative spim packages - no compatible iconfix variant found

;;; --- NEEDS_INVESTIGATION (2 packages) ---
;;; illogical-impulse-ags (#17937): COMPLEX_BUILD: AGS v1 Electron-based desktop shell, complex interdependent modules
;;; better-control-git (#17810): resolved as better-control recipe

;;; --- GCC_SNAPSHOT (4 packages) ---
;;; libga68-snapshot (#19629): GCC_SNAPSHOT: Algol68 frontend experimental, makedeps need lib32-glibc (multilib)
;;; libgfortran-snapshot (#19625): GCC_SNAPSHOT: GCC 16 snapshot, stable gfortran-toolchain@14 already in Guix
;;; libgnat-snapshot (#19623): GCC_SNAPSHOT: Ada runtime snapshot, makedeps need lib32-glibc (multilib)
;;; libgo-snapshot (#19622): GCC_SNAPSHOT: Go runtime snapshot, stable gccgo already in Guix

;;; --- ROCM_DEPENDENCY (1 package) ---
;;; python-jax-rocm (#17278): ROCM_DEPENDENCY: requires ROCm GPU stack not in Guix

;;; --- PROPRIETARY_PLATFORM (1 package) ---
;;; quartus-free-quartus (#23279): PROPRIETARY_PLATFORM: Intel FPGA proprietary, requires lib32-*, proprietary license

;;; --- CUDA_DEPENDENCY (1 package) ---
;;; ffmpeg-cuda-full (#17346): CUDA_DEPENDENCY: requires CUDA/nvidia-utils not in Guix

;;; --- DEP_RESOLUTION_FAILED (3 packages) ---
;;; heroku-cli (#17796): DEP_RESOLUTION_FAILED: proprietary service CLI, complex Node.js dependency tree
;;; lightdm-webkit-theme-aether (#19028): DEP_RESOLUTION_FAILED: requires lightdm-webkit2-greeter not in Guix
;;; n8n (#17807): DEP_RESOLUTION_FAILED: complex Node.js workflow automation, massive npm dependency tree

;;; --- OTHER (1 package) ---
;;; vinyl-git (#17804): resolved as vinyl-theme recipe
