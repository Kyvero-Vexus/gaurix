;;; Blocked notes for deptree-resolver-260424e
;;; Timestamp: 2026-04-24T12:00:00+00:00
;;; 36 packages remain BLOCKED (8 resolved from 44)
;;;
;;; === ALREADY_IN_GUIX (5 resolved) ===
;;; python-roman (#38100): ALREADY_IN_GUIX: python-roman v5.2 in (gnu packages python-xyz); exact same package.
;;; electron33 (#339): ALREADY_IN_GUIX: electron v33.4.11 in nonguix (nongnu packages electron); exact version match.
;;; electron29 (#20370): ALREADY_IN_GUIX: electron v29.4.6 in nonguix (nongnu packages electron); exact version match.
;;; gcc5 (#24168): ALREADY_IN_GUIX: gcc-toolchain v5.5.0 in (gnu packages commencement); provides gcc5 runtime libs.
;;; gcc8-libs (#26186): ALREADY_IN_GUIX: gcc-toolchain v8.5.0 in (gnu packages commencement); provides gcc8 runtime libs.
;;;
;;; === NEW RECIPES (3 resolved) ===
;;; otf-anti (#45059): DONE: font-build-system recipe, AGPL3+, from GitHub release.
;;; otf-avara (#45254): DONE: font-build-system recipe, OFL, from GitLab/Velvetyne.
;;; ttf-amiri-typewriter (#45013): DONE: font-build-system recipe, OFL, from GitHub release.
;;;
;;; === REMAINING BLOCKED (36 packages) ===
;;;
;;; --- MINGW_CROSS_COMPILATION (8 packages) ---
;;; mingw-w64-cblas (#34115): MINGW_CROSS_COMPILATION: requires mingw-w64 cross-compilation toolchain (mingw-w64-cmake, mingw-w64-blas). A1: checked Guix cross-compilation — has i686-w64-mingw32/x86_64-w64-mingw32 toolchains but no mingw-w64-cmake wrapper or pre-built mingw target libraries. A2: checked if native CBLAS (lapack) substitutes — different target, not interchangeable. A3: building full mingw-w64 library stack is out of scope for single package.
;;; mingw-w64-lapack (#34113): MINGW_CROSS_COMPILATION: same as mingw-w64-cblas; requires mingw-w64-blas and mingw-w64-cmake. A1-A3: same analysis as mingw-w64-cblas.
;;; mingw-w64-sqlite (#25121): MINGW_CROSS_COMPILATION: requires mingw-w64-configure, mingw-w64-crt. A1: Guix has cross toolchain but not mingw-w64-configure helper. A2: native sqlite already in Guix. A3: full mingw library packaging out of scope.
;;; mingw-w64-boost (#23783): MINGW_CROSS_COMPILATION: requires mingw-w64-gcc, mingw-w64-wine, mingw-w64-environment, mingw-w64-zstd, etc. A1-A3: same fundamental issue — extensive mingw-w64 library ecosystem not available.
;;; mingw-w64-cppwinrt (#43750): MINGW_CROSS_COMPILATION: Windows Runtime C++ projection; fundamentally Windows-only API (mingw-w64-crt, mingw-w64-cmake, mingw-w64-wine). A1: no Linux equivalent. A2: Windows-specific API. A3: not portable.
;;; mingw-w64-pcre2 (#26805): MINGW_CROSS_COMPILATION: requires mingw-w64-configure, mingw-w64-readline, etc. A1: native pcre2 already in Guix. A2: cross-build requires full mingw env. A3: out of scope.
;;; mingw-w64-spirv-tools (#42666): MINGW_CROSS_COMPILATION: requires mingw-w64-cmake, mingw-w64-spirv-headers. A1: native spirv-tools in Guix. A2: cross-build needs mingw env. A3: out of scope.
;;; mingw-w64-postgresql (#24572): MINGW_CROSS_COMPILATION: requires mingw-w64-configure, mingw-w64-gettext, mingw-w64-openssl, etc. A1: native postgresql in Guix. A2: cross-build needs full mingw env. A3: out of scope.
;;;
;;; --- MULTILIB_UNSUPPORTED (4 packages) ---
;;; lib32-opencl-nvidia-390xx (#17502): MULTILIB_UNSUPPORTED: requires 32-bit NVIDIA 390xx legacy driver (lib32-zlib, lib32-gcc-libs); Guix lacks multilib support. A1: checked for 64-bit equivalent — nvidia-390xx is legacy/EOL. A2: checked Guix multilib — not supported. A3: NVIDIA 390xx series is end-of-life.
;;; lib32-libxpm (#16491): MULTILIB_UNSUPPORTED: 32-bit X11 pixmap library (lib32-libxt, lib32-libxext, lib32-libx11, lib32-glibc). A1: Guix has 64-bit libxpm. A2: Guix does not support multilib/32-bit libraries. A3: no workaround without full multilib infrastructure.
;;; lib32-libglade (#45410): MULTILIB_UNSUPPORTED: 32-bit libglade (lib32-gtk2, lib32-libxml2). A1: Guix has 64-bit libglade. A2: no multilib support. A3: libglade itself is deprecated upstream (replaced by GtkBuilder).
;;; capt-src (#17255): MULTILIB_UNSUPPORTED: Canon CAPT printer driver requires 32-bit filter binaries (lib32-libxml2-legacy, lib32-popt, lib32-gcc-libs, lib32-libcups). A1: checked if 64-bit-only build possible — CAPT protocol uses 32-bit captfilter. A2: no alternative 64-bit Canon driver for CAPT. A3: Guix lacks multilib.
;;;
;;; --- DISTRO_SPECIFIC (3 packages) ---
;;; asp (#14587): DISTRO_SPECIFIC: Arch Build System tool; depends on pacman infrastructure (makepkg, pacman repos). A1: checked for generic equivalent — asp is Arch-only by design. A2: Guix has its own build system. A3: no portable use case outside Arch.
;;; aurutils (#11354): DISTRO_SPECIFIC: AUR helper tools; depends on pacutils, pacman, makepkg. A1: fundamentally tied to Arch package management. A2: no portable use case. A3: Guix users use guix import instead.
;;; pamac-cli (#17940): DISTRO_SPECIFIC: Manjaro package manager frontend; depends on libpamac/libalpm (pacman libraries). A1: Manjaro-only tool. A2: libalpm not available in Guix. A3: no portable use case.
;;;
;;; --- LEGACY_PYTHON2 (3 packages) ---
;;; python2-dbus (#37854): LEGACY_PYTHON2: Python 2 D-Bus bindings; Python 2 reached EOL 2020-01-01. A1: Guix has python-dbus for Python 3. A2: Python 2 interpreter removed from many distros. A3: upstream recommends migration to Python 3.
;;; python2-gimp (#23210): LEGACY_PYTHON2: Python 2 GIMP plugins; GIMP 2.10 is last version with Python 2 support, GIMP 3.0+ uses Python 3. A1: Guix has gimp with Python 3 support. A2: Python 2 EOL. A3: GIMP 3.0 migration path exists.
;;; python2-wxpython3 (#25153): LEGACY_PYTHON2: Python 2 wxWidgets bindings (wxPython 3.x); superseded by wxPython 4.x for Python 3. A1: Guix has python-wxwidgets for Python 3. A2: Python 2 EOL. A3: wxPython 4.x is the supported version.
;;;
;;; --- PROPRIETARY_PLATFORM (8 packages) ---
;;; dropbox (#2254): PROPRIETARY_BINARY: proprietary cloud storage client; custom license prohibits redistribution. A1: checked for open-source alternative (rclone supports Dropbox API). A2: binary download possible but EULA restricts redistribution. A3: Guix philosophy excludes proprietary software.
;;; vmware-workstation (#1833): PROPRIETARY_BINARY: commercial VM software; requires paid license. A1: Guix has QEMU/KVM as FOSS alternative. A2: VMware binaries not redistributable. A3: DKMS kernel modules incompatible with Guix kernel model.
;;; factorio-space-age-experimental (#17440): NON_DISTRIBUTABLE: commercial game; EULA prohibits binary redistribution. A1: no open-source client. A2: installer requires credentials. A3: EULA restricts distribution.
;;; quartus-free-quartus (#23279): PROPRIETARY_PLATFORM: Intel FPGA design suite; LicenseRef-QuartusPrime custom license. A1: no FOSS alternative for Intel FPGA synthesis. A2: binary is 10GB+, not redistributable. A3: requires lib32/multilib (lib32-gcc-libs).
;;; clash-for-windows-chinese (#17433): ABANDONED_UPSTREAM: Chinese fork of Clash for Windows (proxy tool); no license declared in repo; original project was proprietary and taken down. A1: source available but license unclear. A2: original project removed by author. A3: redistribution rights undefined.
;;; deepin-wine8-stable (#35454): PROPRIETARY_BINARY: Deepin proprietary Wine fork; license listed as "proprietary". A1: upstream Guix has Wine. A2: Deepin patches are proprietary. A3: not redistributable.
;;; otf-alibaba-puhuiti (#44962): PROPRIETARY_FONT_LICENSE: Alibaba PuHuiTi fonts under custom "LicenseRef-AlibabaPuHuiTi" license; depends on alibaba-puhuiti-fontconfig (also custom license). A1: license is non-standard, not OSI/FSF approved. A2: terms may restrict redistribution. A3: requires separate fontconfig package also under custom license.
;;; ttf-alibaba-puhuiti (#44963): PROPRIETARY_FONT_LICENSE: same as otf-alibaba-puhuiti; TTF variant under same custom license. A1-A3: same analysis.
;;;
;;; --- PLATFORM_UNSUPPORTED (1 package) ---
;;; bakkesmod-steam (#17468): PLATFORM_UNSUPPORTED: Windows-only mod for Rocket League (Steam); hooks into Windows game process. A1: no Linux port exists. A2: mod requires Windows process injection. A3: no alternative Linux-native mods.
;;;
;;; --- COMPLEX_DEPS (4 packages) ---
;;; electron25 (#32692): COMPLEX_DEPS: Electron v25.9.8; not available in nonguix (minimum is v27.3.11). Requires full Chromium build infrastructure. A1: nonguix has electron 27-36 but not 25. A2: building from source needs massive Chromium build (8+ hours, 30GB+). A3: v25 is EOL, recommending upgrade to supported electron version.
;;; darling-cli-devenv-gui-common-git (#22161): COMPLEX_DEPS: macOS compatibility layer (Darling); requires darling-system-git plus 40+ build deps including gcc-multilib, lib32-gcc-libs. A1: Darling project is largely experimental. A2: requires multilib. A3: massive dependency tree with macOS-specific components.
;;; darling-iosurface-git (#22171): COMPLEX_DEPS: IOSurface framework for Darling; same dependency chain as darling-cli-devenv-gui-common-git. A1-A3: same analysis.
;;; firestorm-next-bin (#17261): MULTILIB_UNSUPPORTED: Second Life viewer binary requiring 32-bit libraries (lib32-libidn, lib32-libsndfile, lib32-util-linux, lib32-zlib). A1: binary bundles 32-bit libs. A2: source build still needs 32-bit compat. A3: Guix lacks multilib.
;;;
;;; --- HARDWARE_SPECIFIC (3 packages) ---
;;; python-jax-rocm (#17278): ROCM_DEPENDENCY: JAX for AMD ROCm GPU acceleration; requires full ROCm stack (miopen-hip, rccl, rocm-hip-runtime, bazel). A1: Guix lacks ROCm. A2: CPU-only JAX (python-jax) already in Guix. A3: ROCm stack is dozens of interdependent packages.
;;; ffmpeg-cuda-full (#17346): CUDA_DEPENDENCY: FFmpeg with NVIDIA CUDA/NVENC and nonfree codecs; requires cuda, nvidia-utils, libfdk-aac. A1: Guix lacks CUDA toolkit. A2: standard ffmpeg already in Guix. A3: license is 'nonfree' due to libfdk-aac.
;;; etlegacy32-mod (#17424): MULTILIB_UNSUPPORTED: 32-bit game mod requiring lib32-* build deps. A1: 64-bit etlegacy exists as separate package. A2: this is explicitly 32-bit. A3: Guix lacks multilib.
;;;
;;; --- DUPLICATE (1 package) ---
;;; vmware-workstation (#11356): DUPLICATE of #1833; same package, already documented above.
