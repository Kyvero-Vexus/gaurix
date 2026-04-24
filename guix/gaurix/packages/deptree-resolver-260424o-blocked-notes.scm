;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Dep-tree resolver pass --- deptree-resolver-260424o --- BLOCKED NOTES
;;;
;;; 67 packages remain BLOCKED after evaluation.
;;;
;;; === MINGW_CROSS_COMPILATION (9) ===
;;; MinGW-w64 cross-compilation packages target Windows and cannot be
;;; meaningfully packaged for native GNU/Linux in Guix.
;;;  1. mingw-w64-sqlite (#25121) — SQLite for MinGW-w64
;;;  2. mingw-w64-pcre2 (#26805) — PCRE2 for MinGW-w64
;;;  3. mingw-w64-postgresql (#24572) — PostgreSQL for MinGW-w64
;;;  4. mingw-w64-lapack (#34113) — LAPACK for MinGW-w64
;;;  5. mingw-w64-cblas (#34115) — CBLAS for MinGW-w64
;;;  6. mingw-w64-boost (#23783) — Boost for MinGW-w64
;;;  7. mingw-w64-cppwinrt (#43750) — C++/WinRT for MinGW-w64
;;;  8. mingw-w64-spirv-tools (#42666) — SPIR-V tools for MinGW-w64
;;;  9. mingw-w64-lame (#mingw-w64-lame) — LAME encoder for MinGW-w64
;;;
;;; === MULTILIB_UNSUPPORTED (3) ===
;;; 32-bit multilib packages; Guix uses per-system builds instead.
;;;  1. lib32-libxpm (#16491)
;;;  2. lib32-libglade (#45410)
;;;  3. lib32-sdl_sound (#lib32-sdl_sound)
;;;
;;; === PLATFORM_UNSUPPORTED (2) ===
;;; Android SDK platform packages; require proprietary Android SDK.
;;;  1. android-platform-19 (#28671) — Android API level 19
;;;  2. android-platform-21 (#23109) — Android API level 21
;;;
;;; === LEGACY_PYTHON2 (3) ===
;;; Python 2 packages; Python 2 is EOL since 2020.
;;;  1. python2-dbus (#37854)
;;;  2. python2-gimp (#23210)
;;;  3. python2-wxpython3 (#25153)
;;;
;;; === COMPLEX_DEPS (14) ===
;;; Packages with deep or unavailable dependency chains.
;;;  1. darling-cli-devenv-gui-common-git (#22161) — macOS compatibility layer, 40+ deps
;;;  2. darling-iosurface-git (#22171) — macOS IOSurface, requires Darling ecosystem
;;;  3. dashpay-bls-signatures (#33165) — Chia BLS fork for Dash, custom crypto deps
;;;  4. perl-math-clipper (#perl-math-clipper) — requires Clipper C++ library binding
;;;  5. vapoursynth-plugin-d2vsource-git (#vapoursynth-plugin-d2vsource-git) — VapourSynth plugin, complex AV deps
;;;  6. python-rtmixer (#python-rtmixer) — requires PortAudio CFFI bindings
;;;  7. the-libs (#the-libs) — Qt utility lib for theShell ecosystem
;;;  8. gss-ntlmssp (#gss-ntlmssp) ��� GSSAPI NTLM, requires krb5/samba GSSAPI integration
;;;  9. darknet-hankai-git (#darknet-hankai-git) — YOLO neural network framework, optional CUDA
;;; 10. precice (#precice) — multi-physics coupling library, many scientific deps
;;; 11. magics++ (#magics++) — ECMWF meteorological library, complex geospatial deps
;;; 12. python-ivre-git (#python-ivre-git) — network recon framework, many system tool deps
;;; 13. python-pylink-square (#python-pylink-square) — SEGGER J-Link proprietary interface
;;; 14. reduce-common (#reduce-common) — REDUCE algebra system, complex Lisp build
;;;
;;; === COMPLEX_BUILD (2) ===
;;; Packages with very complex build processes.
;;;  1. llvm19 (#45739) — LLVM 19, enormous build; Guix has llvm-17/18
;;;  2. ocaml-lablgl (#ocaml-lablgl) — OCaml OpenGL bindings, needs OCaml + GL integration
;;;
;;; === SELINUX_SPECIFIC (1) ===
;;; SELinux-patched packages; Guix does not use SELinux.
;;;  1. shadow-selinux (#24418) — shadow utils with SELinux support
;;;
;;; === DISTRO_SPECIFIC (4) ===
;;; Arch Linux-specific tools with no purpose outside Arch.
;;;  1. pamac-cli (#17940) — Manjaro package manager
;;;  2. asp (#14587) — Arch Source Package tool
;;;  3. aurutils (#11354) — AUR helper utilities
;;;  4. auracle-git (#auracle-git) — AUR client
;;;
;;; === PROPRIETARY_BINARY (4) ===
;;; Proprietary/non-redistributable software.
;;;  1. vmware-workstation (#1833) — VMware proprietary virtualization
;;;  2. dropbox (#2254) — Dropbox proprietary client
;;;  3. deepin-wine8-stable (#35454) — Deepin Wine with proprietary patches
;;;  4. rsdkv4-bin (#rsdkv4-bin) — Proprietary Retro Engine for Sonic games
;;;
;;; === PROPRIETARY_PLATFORM (1) ===
;;;  1. quartus-free-quartus (#23279) ��� Intel/Altera FPGA toolchain, proprietary
;;;
;;; === LEGACY_VERSION (6) ===
;;; Outdated versions superseded by current Guix packages.
;;;  1. gcc8 (#26185) — GCC 8, Guix has gcc-12+
;;;  2. llvm40-libs (#llvm40-libs) — LLVM 4.0 runtime, ancient
;;;  3. boost1.86-libs (#boost1.86-libs) — Boost 1.86, Guix has current Boost
;;;  4. boost183-libs (#boost183-libs) — Boost 1.83, Guix has current Boost
;;;  5. boost-python2 (#boost-python2) — Boost.Python for Python 2
;;;  6. glibc-eac (#glibc-eac) — Easy Anti-Cheat patched glibc
;;;
;;; === LEGACY_EOL (2) ===
;;; End-of-life runtime binaries.
;;;  1. dotnet-runtime-5.0-bin (#dotnet-runtime-5.0-bin) — .NET 5.0 EOL
;;;  2. dotnet-runtime-6.0-bin (#dotnet-runtime-6.0-bin) — .NET 6.0 EOL
;;;
;;; === GCC_SNAPSHOT (4) ===
;;; Unstable GCC 16 snapshot runtime libraries.
;;;  1. libga68-snapshot (#libga68-snapshot) — Algol68 runtime (GCC 16 snapshot)
;;;  2. libgfortran-snapshot (#libgfortran-snapshot) — Fortran runtime (GCC 16 snapshot)
;;;  3. libgnat-snapshot (#libgnat-snapshot) — Ada runtime (GCC 16 snapshot)
;;;  4. libgo-snapshot (#libgo-snapshot) — Go runtime (GCC 16 snapshot)
;;;
;;; === MISSING_SOURCE (1) ===
;;;  1. adwaita-color-schemes (#adwaita-color-schemes) — GitHub repo deleted/moved
;;;
;;; === ABANDONED_UPSTREAM (2) ===
;;;  1. emerald (#emerald) — Compiz window decorator, project abandoned
;;;  2. ha-glue (#ha-glue) — Cluster Glue HA libraries, archived
;;;
;;; === MONO_REQUIRED (1) ===
;;;  1. smuxi-server (#smuxi-server) — IRC client requiring Mono runtime
;;;
;;; === PLATFORM_SPECIFIC (1) ===
;;;  1. chromeos-flashrom-git (#chromeos-flashrom-git) — ChromeOS-specific flashrom fork
;;;
;;; === KERNEL_MODULE (1) ===
;;;  1. linux-gpib (#linux-gpib) — GPIB kernel module, needs kernel integration
;;;
;;; === DEPRECATED (1) ===
;;;  1. python-pynotify (#python-pynotify) — deprecated notification library
;;;
;;; === COMPLEX_DEPS (game data) (1) ===
;;;  1. assaultcube-common (#assaultcube-common) — game data with custom license
;;;
;;; === COMPLEX_DEPS (ICAP server) (1) ===
;;;  1. c-icap (#c-icap) — ICAP server, requires Squid proxy integration
;;;
;;; === COMPLEX_DEPS (gaming) (1) ===
;;;  1. libgaminggear (#libgaminggear) — gaming device library, udev + dbus integration
;;;
;;; === COMPLEX_DEPS (drawing) (1) ===
;;;  1. ipe (#ipe) — extensible drawing editor, complex Qt/Lua/LaTeX deps
