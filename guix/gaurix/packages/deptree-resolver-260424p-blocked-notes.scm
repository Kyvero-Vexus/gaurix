;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Blocked notes for deptree-resolver-260424p
;;; Timestamp: 2026-04-24T18:00:00+00:00
;;; 73 packages remain BLOCKED (27 resolved from 100)
;;;
;;; === NEW RECIPES (27 resolved) ===
;;; riverguile-git, simplewaita-git, dwl-guile-git, lisp-wrapper,
;;; libdng-git, ps3netsrv, gss-ntlmssp, c-icap, ctwm-bzr, passmenu-otp-git,
;;; python-icsv2ledger-git, python-pynotify-inotify, python-rtmixer,
;;; python-ivre-git, adwaita-color-schemes, notmuch-tools-git, ha-glue,
;;; libgaminggear, chromeos-flashrom-git, qtemu-git, the-libs, opencoarrays,
;;; precice-coupling, nimdow-git, darknet-hankai-git, assaultcube-common,
;;; magics-plus-plus
;;;
;;; === REMAINING BLOCKED (73 packages) ===

(define-module (gaurix packages deptree-resolver-260424p-blocked-notes)
  #:use-module (guix packages)
  #:use-module (guix gexp)
  #:use-module ((guix licenses) #:prefix license:))

;;; --- PROPRIETARY_BINARY (6 packages) ---
;;; squareline-studio (#17812): PROPRIETARY_BINARY: commercial SquareLine Studio LVGL GUI designer, closed-source
;;; brother-mfc-l2400dw (#17797): PROPRIETARY_BINARY: proprietary Brother printer driver blob
;;; inkdrop (#17819): PROPRIETARY_BINARY: commercial Electron-based note app, proprietary license
;;; vmware-workstation (#1833): PROPRIETARY_BINARY: VMware Workstation proprietary binary
;;; dropbox (#2254): PROPRIETARY_BINARY: Dropbox proprietary binary client
;;; realvnc-rvnc-connect (#17860): PROPRIETARY_BINARY: RealVNC proprietary remote desktop
;;; libfprint-2-tod1-broadcom-cv3plus (#17912): PROPRIETARY_BINARY: proprietary Broadcom fingerprint driver

;;; --- PLATFORM_UNSUPPORTED (4 packages) ---
;;; bakkesmod-steam (#17468): PLATFORM_UNSUPPORTED: Windows-only Rocket League modding tool via Steam
;;; android-platform-19 (#28671): PLATFORM_UNSUPPORTED: Android SDK platform API 19, Android-specific
;;; android-platform-21 (#23109): PLATFORM_UNSUPPORTED: Android SDK platform API 21, Android-specific
;;; euroscope-bin (#17945): PLATFORM_UNSUPPORTED: Windows-only air traffic control simulation

;;; --- MULTILIB_UNSUPPORTED (5 packages) ---
;;; lib32-libxpm (#16491): MULTILIB_UNSUPPORTED: 32-bit libXpm, Guix doesn't support multilib
;;; capt-src (#17255): MULTILIB_UNSUPPORTED: Canon CAPT printer driver requiring 32-bit libs
;;; firestorm-next-bin (#17261): MULTILIB_UNSUPPORTED: Second Life viewer binary requiring 32-bit libs
;;; lib32-opencl-nvidia-390xx (#17502): MULTILIB_UNSUPPORTED: 32-bit NVIDIA OpenCL for legacy driver
;;; lib32-libglade (#45410): MULTILIB_UNSUPPORTED: 32-bit libglade
;;; lib32-sdl_sound (#22729): MULTILIB_UNSUPPORTED: 32-bit SDL_sound library

;;; --- MINGW_CROSS_COMPILATION (8 packages) ---
;;; mingw-w64-cblas (#34115): MINGW_CROSS_COMPILATION: CBLAS for MinGW-w64 cross-compilation
;;; mingw-w64-lapack (#34113): MINGW_CROSS_COMPILATION: LAPACK for MinGW-w64 cross-compilation
;;; mingw-w64-sqlite (#20346): MINGW_CROSS_COMPILATION: SQLite for MinGW-w64 cross-compilation
;;; mingw-w64-boost (#23783): MINGW_CROSS_COMPILATION: Boost for MinGW-w64 cross-compilation
;;; mingw-w64-cppwinrt (#43750): MINGW_CROSS_COMPILATION: C++/WinRT for MinGW-w64
;;; mingw-w64-pcre2 (#26805): MINGW_CROSS_COMPILATION: PCRE2 for MinGW-w64 cross-compilation
;;; mingw-w64-spirv-tools (#42666): MINGW_CROSS_COMPILATION: SPIR-V tools for MinGW-w64
;;; mingw-w64-lame (#34112): MINGW_CROSS_COMPILATION: LAME MP3 encoder for MinGW-w64
;;; mingw-w64-postgresql (#24572): MINGW_CROSS_COMPILATION: PostgreSQL for MinGW-w64

;;; --- DISTRO_SPECIFIC (3 + 3 packages) ---
;;; aurutils (#11354): DISTRO_SPECIFIC: AUR helper utilities, Arch Linux specific
;;; asp (#14587): DISTRO_SPECIFIC: Arch Build System package tool, Arch Linux specific
;;; pamac-cli (#17940): DISTRO_SPECIFIC: Pamac package manager CLI, Arch/Manjaro specific
;;; pacpak-git (#17862): DISTRO_SPECIFIC: pacman wrapper for flatpak, Arch Linux specific
;;; python-pypi2pkgbuild (#17822): DISTRO_SPECIFIC: converts PyPI to PKGBUILD, Arch Linux specific
;;; chromium-extension-arch-search (#17897): DISTRO_SPECIFIC: Chromium extension for Arch Linux search

;;; --- HARDWARE_SPECIFIC (3 packages) ---
;;; python-jax-rocm (#17278): HARDWARE_SPECIFIC: JAX for ROCm GPUs only
;;; ffmpeg-cuda-full (#17346): HARDWARE_SPECIFIC: FFmpeg with full CUDA support, NVIDIA GPU specific
;;; etlegacy32-mod (#17424): HARDWARE_SPECIFIC: ET Legacy 32-bit mod

;;; --- LEGACY_PYTHON2 (3 + 1 packages) ---
;;; python2-dbus (#37854): LEGACY_PYTHON2: Python 2 D-Bus bindings, Python 2 is EOL
;;; python2-wxpython3 (#20547): LEGACY_PYTHON2: wxPython for Python 2, EOL
;;; python2-gimp (#23210): LEGACY_PYTHON2: GIMP Python 2 plugin support, EOL
;;; boost-python2 (#37225): LEGACY_PYTHON2: Boost.Python for Python 2, EOL

;;; --- ABANDONED_UPSTREAM (4 packages) ---
;;; clash-for-windows-chinese (#17433): ABANDONED_UPSTREAM: Clash for Windows Chinese fork, project abandoned
;;; qtspim-iconfix (#18421): ABANDONED_UPSTREAM: QtSPIM MIPS simulator with icon fix, unmaintained
;;; lightdm-webkit-theme-aether (#19028): ABANDONED_UPSTREAM: LightDM webkit greeter theme, unmaintained
;;; gtk-theme-config (#21782): ABANDONED_UPSTREAM: GTK theme configuration utility, unmaintained

;;; --- NON_DISTRIBUTABLE (2 packages) ---
;;; factorio-space-age-experimental (#17440): NON_DISTRIBUTABLE: Factorio DLC, commercial license
;;; ttf-consolas-ligaturized (#20499): NON_DISTRIBUTABLE: modified Microsoft Consolas font

;;; --- DKMS_KERNEL_MODULE (1 + 2 packages) ---
;;; nvidia-bl-dkms (#17755): DKMS_KERNEL_MODULE: NVIDIA backlight DKMS kernel module
;;; libch343ser-git (#17800): KERNEL_MODULE: USB serial kernel driver module, requires kernel build
;;; linux-gpib (#20547): KERNEL_MODULE: GPIB IEEE 488 kernel module, requires specific kernel version

;;; --- KERNEL_SPECIFIC (3 packages) ---
;;; zfs-linux-hardened-headers (#17921): KERNEL_SPECIFIC: ZFS headers for specific hardened kernel version
;;; zfs-linux-rt-headers (#17920): KERNEL_SPECIFIC: ZFS headers for specific RT kernel version
;;; zfs-linux-git-headers (#17919): KERNEL_SPECIFIC: ZFS headers for git kernel version

;;; --- COMPLEX_DEPS (5 + 3 packages) ---
;;; heroku-cli (#17796): COMPLEX_DEPS: Heroku CLI requires npm ecosystem and node build
;;; n8n (#17807): COMPLEX_DEPS: workflow automation requires complex Node.js/npm ecosystem
;;; plasma6-applets-panon (#17808): COMPLEX_DEPS: KDE Plasma 6 applet, requires Plasma framework
;;; darling-cli-devenv-gui-common-git (#22161): COMPLEX_DEPS: macOS translation layer, massive deps
;;; darling-iosurface-git (#22171): COMPLEX_DEPS: Darling IOSurface framework, requires Darling
;;; glibc-eac (#24719): COMPLEX_DEPS: patched glibc with DT_HASH for EAC games, complex toolchain
;;; dashpay-bls-signatures (#33165): COMPLEX_DEPS: requires static libgmp and libsodium builds
;;; freetube-electron-git (#17925): COMPLEX_DEPS: requires Electron 41 and yarn Node.js build

;;; --- OLD_VERSION_VARIANT (4 packages) ---
;;; boost1.86-libs (#19936): OLD_VERSION_VARIANT: Boost 1.86 runtime libs, Guix has 1.89
;;; boost183-libs (#20944): OLD_VERSION_VARIANT: Boost 1.83 runtime libs, Guix has 1.89
;;; gcc8 (#26185): OLD_VERSION_VARIANT: GCC 8.x, complex compiler build; Guix has current GCC
;;; llvm40-libs (#35628): OLD_VERSION_VARIANT: LLVM 4.0 runtime libs, ancient version

;;; --- EOL_VERSION (2 packages) ---
;;; dotnet-runtime-5.0-bin (#33221): EOL_VERSION: .NET 5.0 runtime binary, end-of-life
;;; dotnet-runtime-6.0-bin (#32716): EOL_VERSION: .NET 6.0 runtime binary, end-of-life

;;; --- MISSING_DEP (8 packages) ---
;;; texmacs-pure (#17873): MISSING_DEP: requires Pure language and LLVM 3.5, neither in Guix
;;; eclipse-pydev (#17948): MISSING_DEP: requires Eclipse IDE framework, not in Guix
;;; smuxi-server (#41720): MISSING_DEP: requires Mono/.NET (log4net, nini), not in Guix
;;; emerald (#22333): MISSING_DEP: requires compiz-core window manager, not in Guix
;;; ocaml-lablgl (#44420): MISSING_DEP: requires camlp-streams OCaml library, not in Guix
;;; oqsprovider-git (#17887): MISSING_DEP: requires liboqs post-quantum crypto library, not in Guix
;;; slrn-snapshot-canlock (#17889): MISSING_DEP: requires libcanlock, not in Guix
;;; slxfig-snapshot (#17879): MISSING_DEP: requires slsh (S-Lang shell), not available separately

;;; --- CROSS_COMPILATION (1 package) ---
;;; kamilsss655-uv-k5-firmware-custom-git (#17909): CROSS_COMPILATION: requires arm-none-eabi toolchain for UV-K5 radio firmware

;;; --- PROPRIETARY_PLATFORM (1 package) ---
;;; quartus-free-quartus (#23279): PROPRIETARY_PLATFORM: Intel FPGA design software, proprietary

;;; --- COMPLEX_BUILD (6 packages) ---
;;; electron23-bin (#17970): OLD_ELECTRON: Electron v23 is EOL, complex Chromium-based binary
;;; reduce-common (#44133): COMPLEX_BUILD: REDUCE CAS common files, requires complex TeX/LaTeX build
;;; shadow-selinux (#24418): COMPLEX_BUILD: shadow-utils with SELinux support, requires SELinux policy
;;; vapoursynth-plugin-d2vsource-git (#27646): COMPLEX_BUILD: VapourSynth plugin, requires specific FFmpeg ABI
;;; python-pylibssh (#17953): COMPLEX_BUILD: Python libssh bindings, requires libssh C library
;;; perl-math-clipper (#22584): COMPLEX_BUILD: requires perl-extutils-xspp and perl-module-build-withxspp, not in Guix

;;; --- OTHER (remaining) ---
;;; python-pylink-square (#21233): COMPLEX_BUILD: requires SEGGER J-Link SDK, proprietary
;;; ipe (#21572): COMPLEX_BUILD: extensible drawing editor, requires complex Qt/Lua build
;;; better-control-git (#17810): NEEDS_INVESTIGATION: needs further evaluation
;;; audacious-plugins-git (#17814): NEEDS_INVESTIGATION: complex plugin system with many optional deps
;;; rpfm-git (#17833): NEEDS_INVESTIGATION: Rust mod manager, requires cargo-inputs
;;; deadbeef-git (#17914): NEEDS_INVESTIGATION: music player with complex plugin system
;;; fht-share-picker-git (#17915): NEEDS_INVESTIGATION: Wayland share picker
;;; fht-compositor (#17916): NEEDS_INVESTIGATION: Wayland compositor
;;; pulseeffects-legacy (#17927): NEEDS_INVESTIGATION: audio effects, requires PulseAudio/PipeWire integration
;;; libxfce4ui-devel (#17932): NEEDS_INVESTIGATION: XFCE UI library development version
;;; anyrun-git (#17933): COMPLEX_BUILD: Rust Wayland runner, requires cargo-inputs and gtk4-layer-shell
;;; illogical-impulse-ags (#17937): NEEDS_INVESTIGATION: AGS (Aylur's GTK Shell) config
;;; redlib-git (#17942): COMPLEX_BUILD: Rust Reddit frontend, requires extensive cargo-inputs
;;; mycorrhiza-git (#17834): COMPLEX_BUILD: Go wiki engine, requires vendored Go dependencies
;;; minikube-git (#17835): COMPLEX_BUILD: Go Kubernetes tool, requires vendored Go dependencies
;;; thanos (#17851): COMPLEX_BUILD: Go Prometheus tool, requires vendored Go dependencies
;;; erwise (#17867): NEEDS_INVESTIGATION: historical web browser
;;; rsdkv4-bin (#36263): COMPLEX_BUILD: RSDKv4 game engine, requires specific SDL2 build
;;; c-icap: resolved (recipe created)
;;; python-pynotify: resolved (recipe created)
;;; the-libs: resolved (recipe created)
;;; lisp: resolved (recipe created as lisp-wrapper)
