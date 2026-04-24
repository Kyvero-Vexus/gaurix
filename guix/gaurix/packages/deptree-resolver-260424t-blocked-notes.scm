;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Blocked notes for deptree-resolver-260424t
;;; Timestamp: 2026-04-24T16:17:36+00:00
;;; 87 packages remain BLOCKED (11 recipes + 2 ALREADY_IN_GUIX from 100)
;;;
;;; === NEW RECIPES (11 resolved) ===
;;; dashpay-bls-signatures, python-pylibssh, ipe, thanos, ocaml-lablgl,
;;; fht-compositor, rsdkv4-bin, redlib-git, mycorrhiza-git, minikube-git,
;;; fht-share-picker-git
;;;
;;; === ALREADY IN GUIX (2 resolved) ===
;;; libxfce4ui-devel (#17932) -> libxfce4ui in (gnu packages xfce) v4.20.2
;;; llvm19 (#45739) -> llvm@19 in (gnu packages llvm) v19.1.7
;;;
;;; === REMAINING BLOCKED (87 packages) ===

(define-module (gaurix packages deptree-resolver-260424t-blocked-notes)
  #:use-module (guix packages)
  #:use-module (guix gexp)
  #:use-module ((guix licenses) #:prefix license:))

;;; --- PROPRIETARY_BINARY (7 packages) ---
;;; squareline-studio (#17812): PROPRIETARY_BINARY: commercial SquareLine Studio LVGL GUI designer, closed-source, custom license
;;; libfprint-2-tod1-broadcom-cv3plus (#17912): PROPRIETARY_BINARY: Broadcom fingerprint sensor proprietary binary driver
;;; dropbox (#2254): PROPRIETARY_BINARY: Dropbox proprietary closed-source cloud sync client
;;; realvnc-rvnc-connect (#17860): PROPRIETARY_BINARY: RealVNC commercial proprietary remote desktop
;;; deepin-wine8-stable (#35454): PROPRIETARY_BINARY: Deepin proprietary Wine fork with custom patches
;;; vmware-workstation (#1833): PROPRIETARY_BINARY: VMware Workstation proprietary virtualization platform
;;; inkdrop (#17819): PROPRIETARY_BINARY: commercial Electron-based note-taking app, proprietary license

;;; --- PLATFORM_UNSUPPORTED (3 packages) ---
;;; bakkesmod-steam (#17468): PLATFORM_UNSUPPORTED: Windows-only Rocket League modding tool via Steam/Proton
;;; android-platform-19 (#28671): PLATFORM_UNSUPPORTED: Android SDK platform API 19, requires Android SDK toolchain
;;; android-platform-21 (#23109): PLATFORM_UNSUPPORTED: Android SDK platform API 21, requires Android SDK toolchain

;;; --- MULTILIB_UNSUPPORTED (5 packages) ---
;;; lib32-opencl-nvidia-390xx (#17502): MULTILIB_UNSUPPORTED: 32-bit NVIDIA OpenCL for legacy 390xx driver
;;; lib32-libglade (#45410): MULTILIB_UNSUPPORTED: 32-bit libglade, Guix lacks multilib support
;;; lib32-libxpm (#16491): MULTILIB_UNSUPPORTED: 32-bit libXpm library
;;; lib32-sdl_sound (#22729): MULTILIB_UNSUPPORTED: 32-bit SDL_sound library
;;; capt-src (#17255): MULTILIB_UNSUPPORTED: Canon CAPT printer driver requiring 32-bit binary components

;;; --- MINGW_CROSS_COMPILATION (9 packages) ---
;;; mingw-w64-cblas (#34115): MINGW_CROSS_COMPILATION: CBLAS for MinGW-w64 Windows cross-compilation
;;; mingw-w64-lapack (#34113): MINGW_CROSS_COMPILATION: LAPACK for MinGW-w64 cross-compilation
;;; mingw-w64-sqlite (#25121): MINGW_CROSS_COMPILATION: SQLite for MinGW-w64 cross-compilation
;;; mingw-w64-boost (#23783): MINGW_CROSS_COMPILATION: Boost for MinGW-w64 cross-compilation
;;; mingw-w64-cppwinrt (#43750): MINGW_CROSS_COMPILATION: C++/WinRT for MinGW-w64, Windows-specific API
;;; mingw-w64-pcre2 (#26805): MINGW_CROSS_COMPILATION: PCRE2 for MinGW-w64 cross-compilation
;;; mingw-w64-spirv-tools (#42666): MINGW_CROSS_COMPILATION: SPIR-V tools for MinGW-w64 cross-compilation
;;; mingw-w64-lame (#34112): MINGW_CROSS_COMPILATION: LAME MP3 encoder for MinGW-w64 cross-compilation
;;; mingw-w64-postgresql (#24572): MINGW_CROSS_COMPILATION: PostgreSQL for MinGW-w64 cross-compilation

;;; --- DISTRO_SPECIFIC (6 packages) ---
;;; aurutils (#11354): DISTRO_SPECIFIC: AUR helper utilities, requires pacman/makepkg ecosystem
;;; asp (#14587): DISTRO_SPECIFIC: Arch Build System package tool, Arch Linux specific
;;; pamac-cli (#17940): DISTRO_SPECIFIC: Pamac package manager CLI, Arch/Manjaro specific
;;; pacpak-git (#17862): DISTRO_SPECIFIC: pacman wrapper for flatpak, requires pacman
;;; python-pypi2pkgbuild (#17822): DISTRO_SPECIFIC: converts PyPI packages to PKGBUILD format, Arch specific
;;; chromium-extension-arch-search (#17897): DISTRO_SPECIFIC: Chromium extension for Arch Linux package search
;;; auracle-git (#2160): DISTRO_SPECIFIC: AUR client, requires Arch Linux infrastructure

;;; --- LEGACY_PYTHON2 (4 packages) ---
;;; python2-wxpython3 (#25153): LEGACY_PYTHON2: wxPython for Python 2, Python 2 is EOL since 2020
;;; python2-dbus (#37854): LEGACY_PYTHON2: Python 2 D-Bus bindings, Python 2 is EOL
;;; python2-gimp (#23210): LEGACY_PYTHON2: GIMP Python 2 scripting support, Python 2 is EOL
;;; boost-python2 (#37225): LEGACY_PYTHON2: Boost.Python for Python 2, Python 2 is EOL

;;; --- OLD_VERSION_VARIANT (4 packages) ---
;;; gcc8 (#26185): OLD_VERSION_VARIANT: GCC 8.5.0, superseded by modern GCC versions in Guix
;;; boost1.86-libs (#19936): OLD_VERSION_VARIANT: Boost 1.86 libs, Guix provides current Boost
;;; boost183-libs (#20944): OLD_VERSION_VARIANT: Boost 1.83 libs, Guix provides current Boost
;;; llvm40-libs (#35628): OLD_VERSION_VARIANT: LLVM 4.0 runtime libs, ancient version

;;; --- KERNEL_SPECIFIC (3 packages) ---
;;; zfs-linux-hardened-headers (#17921): KERNEL_SPECIFIC: ZFS headers for linux-hardened kernel variant
;;; zfs-linux-rt-headers (#17920): KERNEL_SPECIFIC: ZFS headers for linux-rt (realtime) kernel variant
;;; zfs-linux-git-headers (#17919): KERNEL_SPECIFIC: ZFS headers for linux-git development kernel

;;; --- KERNEL_MODULE (2 packages) ---
;;; libch343ser-git (#17880): KERNEL_MODULE: USB serial kernel module for CH343 chipsets, requires DKMS
;;; linux-gpib (#20547): KERNEL_MODULE: Linux GPIB kernel module for IEEE 488 instruments

;;; --- EOL_VERSION (2 packages) ---
;;; dotnet-runtime-5.0-bin (#33221): EOL_VERSION: .NET 5.0 reached end-of-life May 2022
;;; dotnet-runtime-6.0-bin (#32716): EOL_VERSION: .NET 6.0 reached end-of-life November 2024

;;; --- SOURCE_UNAVAILABLE (2 packages) ---
;;; elp (#19246): SOURCE_UNAVAILABLE: AUR entry has no URL, binary-only distribution from GitHub Releases.
;;;   Investigated: source exists at github.com/WhatsApp/erlang-language-platform (Rust).
;;;   Approach 1: copy-build-system for binary - download URL format unstable, version pinning unclear.
;;;   Approach 2: cargo-build-system from source - massive Rust workspace with ~50 crates, impractical.
;;;   Approach 3: guix import crate - not on crates.io, no upstream Guix support.
;;; euroscope-bin (#17945): SOURCE_UNAVAILABLE: Windows-only air traffic control simulation, no Linux source

;;; --- LICENSE_REVIEW_NEEDED (2 packages) ---
;;; brother-mfc-l2400dw (#17797): NON_DISTRIBUTABLE: Brother commercial printer driver license + requires lib32-glibc
;;; ttf-consolas-ligaturized (#20499): NON_DISTRIBUTABLE: Consolas is a Microsoft proprietary font, ligaturized derivative

;;; --- COMPLEX_BUILD (7 packages) ---
;;; nvidia-bl-dkms (#17755): KERNEL_MODULE: DKMS kernel module for NVidia backlight, requires kernel headers at build time
;;; envoyproxy (#17824): COMPLEX_BUILD: Massive C++ proxy with Bazel build system requiring hundreds of deps.
;;;   Investigated: requires Bazel + Go + Java + CMake + LLD + hundreds of C++ libraries.
;;;   Approach 1: cmake-build-system - Envoy uses Bazel exclusively, not CMake.
;;;   Approach 2: trivial-build from prebuilt - no official Linux binary distribution.
;;;   Approach 3: port Bazel build - Bazel not available in Guix, would require bootstrapping.
;;; perl-math-clipper (#22584): COMPLEX_BUILD: Perl XS module requiring Module::Build::WithXSpp and ExtUtils::XSpp,
;;;   C++ clipper library vendored, XS++ code generation pipeline not available in Guix.
;;; vapoursynth-plugin-d2vsource-git (#27646): MISSING_DEP: requires vapoursynth which is not in Guix
;;; reduce-common (#44133): COMPLEX_BUILD: REDUCE computer algebra system, requires complex TeX dependencies
;;;   and custom Lisp build system (CSL/PSL), massive build requiring 12+ texlive packages.
;;; anyrun-git (#17933): MISSING_DEP: Rust/GTK4 runner requires anyrun-provider meta-package not in Guix
;;; rpfm-git (#17833): COMPLEX_BUILD: Rust/Qt5 modding tool requiring KDE Frameworks (kcompletion5, kiconthemes5, ktexteditor5)

;;; --- COMPLEX_DEPS (3 packages) ---
;;; glibc-eac (#24719): MODIFIED_SYSTEM_PACKAGE: patched glibc for EAC gaming, modifying core system library is unsafe
;;; freetube-electron-git (#17925): COMPLEX_DEPS: Electron app requiring electron41 + yarn build, Electron not in Guix
;;; python-pylink-square (#21233): PROPRIETARY_DEP: requires jlink-software-and-documentation (proprietary SEGGER J-Link SDK)

;;; --- DEP_RESOLUTION_FAILED (5 packages) ---
;;; heroku-cli (#17796): PROPRIETARY_SERVICE: Heroku CLI for proprietary cloud platform, Node.js app with npm build
;;; lightdm-webkit-theme-aether (#19028): MISSING_DEP: requires lightdm-webkit2-greeter which is not in Guix
;;; n8n (#17807): NON_FREE_LICENSE: Sustainable Use License (not FOSS), Node.js workflow automation
;;; esp8266-rtos-sdk (#17825): CROSS_COMPILATION: ESP8266 embedded SDK, requires xtensa cross-compiler toolchain
;;; plasma6-applets-panon (#17808): MISSING_DEP: KDE Plasma applet requiring plasma-workspace + python-soundcard

;;; --- MISSING_DEP (6 packages) ---
;;; slxfig-snapshot (#17879): MISSING_DEP: requires slsh (S-Lang shell) which may not be separately packaged in Guix
;;; texmacs-pure (#17873): MISSING_DEP: requires Pure programming language and LLVM 3.5, both unavailable in Guix
;;; eclipse-pydev (#17948): MISSING_DEP: Eclipse IDE plugin, Eclipse not available in Guix
;;; slrn-snapshot-canlock (#17889): MISSING_DEP: requires libcanlock and uudeview, neither in Guix
;;; smuxi-server (#41720): MISSING_DEP: Mono/.NET IRC client requiring log4net, nini, stfl (.NET ecosystem)
;;; emerald (#22333): MISSING_DEP: Compiz window decorator requiring compiz-core which is not in Guix
;;; oqsprovider-git (#17887): MISSING_DEP: OpenSSL post-quantum provider requiring liboqs not in Guix

;;; --- GCC_SNAPSHOT (4 packages) ---
;;; libga68-snapshot (#19629): GCC_SNAPSHOT: GCC 16.0.0 snapshot Algol68 runtime, unstable pre-release + requires lib32-glibc
;;; libgfortran-snapshot (#19625): GCC_SNAPSHOT: GCC 16.0.0 snapshot Fortran runtime, unstable pre-release + requires lib32-glibc
;;; libgnat-snapshot (#19623): GCC_SNAPSHOT: GCC 16.0.0 snapshot Ada runtime, unstable pre-release + requires lib32-glibc
;;; libgo-snapshot (#19622): GCC_SNAPSHOT: GCC 16.0.0 snapshot Go runtime, unstable pre-release + requires lib32-glibc

;;; --- HARDWARE_SPECIFIC (1 package) ---
;;; python-jax-rocm (#17278): HARDWARE_SPECIFIC: JAX for AMD ROCm GPUs, ROCm stack not available in Guix

;;; --- ABANDONED_UPSTREAM (1 package) ---
;;; clash-for-windows-chinese (#17433): ABANDONED_UPSTREAM: original project deleted from GitHub, source unavailable

;;; --- NON_DISTRIBUTABLE (1 package) ---
;;; factorio-space-age-experimental (#17440): NON_DISTRIBUTABLE: commercial game requiring purchased license

;;; --- CROSS_COMPILATION (1 package) ---
;;; kamilsss655-uv-k5-firmware-custom-git (#17909): CROSS_COMPILATION: custom firmware for UV-K5 radio,
;;;   requires ARM cross-compiler toolchain (arm-none-eabi-gcc)

;;; --- OLD_ELECTRON (1 package) ---
;;; electron23-bin (#17970): OLD_ELECTRON: Electron 23 is EOL, superseded by current Electron versions

;;; --- NEEDS_RECIPE_DESIGN (1 package) ---
;;; gtk-theme-config (#21782): ABANDONED_UPSTREAM: depends on GConf (deprecated GNOME 2 configuration system),
;;;   last upstream commit 2014, gconf not maintained.
;;;   Approach 1: gnu-build-system with gconf - gconf is deprecated and increasingly broken.
;;;   Approach 2: patch to use gsettings/dconf - would require rewriting core functionality.
;;;   Approach 3: fork and modernize - not worth effort for unmaintained GTK theme tool.

;;; --- NICHE / OTHER (5 packages) ---
;;; illogical-impulse-ags (#17937): NICHE_FORK: fork of AGS (Aylur's Gtk Shell) pinned to specific dotfiles,
;;;   requires gjs, npm, typescript build. Upstream AGS exists but this is a niche derivative.
;;;   Approach 1: meson-build-system - complex JS/GJS hybrid build with npm step.
;;;   Approach 2: copy installed output - no binary distribution available.
;;;   Approach 3: package upstream AGS instead - different scope from this AUR entry.
;;; better-control-git (#17810): MISSING_DEP: Python GTK3 system settings tool with 18+ runtime dependencies,
;;;   many not in Guix (python-pydbus, python-qrcode, python-setproctitle, usbguard, power-profiles-daemon).
;;;   Approach 1: copy-build-system - trivial build but massive missing dep tree.
;;;   Approach 2: package all deps first - would need 8+ new packages recursively.
;;;   Approach 3: minimal install skipping optional deps - defeats purpose of the tool.
;;; erwise (#17867): LICENSE_UNKNOWN: historical 1992 web browser from Finland with unknown license,
;;;   depends on OpenMotif. FTP source at funet.fi may be fragile.
;;;   Approach 1: gnu-build-system with motif - license unknown, cannot distribute.
;;;   Approach 2: contact authors for license clarification - 30+ years old project.
;;;   Approach 3: package as historical artifact - still blocked by license.
;;; shadow-selinux (#24418): SELINUX_SPECIFIC: SELinux-enhanced shadow utilities, requires libsemanage
;;;   and SELinux policy infrastructure not available in Guix.
;;; python-pylibssh-alt (#17953): RESOLVED: recipe created as python-pylibssh in deptree-resolver-260424t.scm
