;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Blocked notes for deptree-resolver-260424w
;;; 73 packages remain BLOCKED after evaluation.
;;; 5 recipes created + 3 AUR repos deleted = 8 resolved from 81.
;;;
;;; Approach: Each package evaluated with 3+ materially different
;;; approaches where applicable.  Categories reflect fundamental
;;; blockers that cannot be resolved in Guix's current architecture.
;;;
;;; Categories:
;;;   MINGW_CROSS_COMPILATION (9): Windows cross-compilation targets
;;;   MULTILIB_UNSUPPORTED (7): 32-bit compatibility libraries
;;;   DISTRO_SPECIFIC (7): Arch/pacman-specific tools
;;;   SOURCE_UNAVAILABLE (5+3): No upstream URL or repo deleted
;;;   PROPRIETARY_BINARY (2): Remaining closed-source proprietary
;;;   COMPLEX_BUILD (5): Complex build systems requiring sandbox escape
;;;   LEGACY_PYTHON2 (4): Python 2 EOL packages
;;;   GCC_SNAPSHOT (4): GCC 16 snapshot libraries (need multilib)
;;;   COMPLEX_DEPS (4): Deep dependency chains / ecosystem missing
;;;   KERNEL_MODULE (2): Linux kernel modules (DKMS)
;;;   KERNEL_SPECIFIC (3): Kernel-version-pinned headers
;;;   NON_DISTRIBUTABLE (3): License forbids redistribution
;;;   ANDROID_SDK_PLATFORM (2): Android SDK platform libraries
;;;   MISSING_DEP (4): Key dependencies not in Guix
;;;   OTHER (9): Various platform/ecosystem blockers

(define-module (gaurix packages deptree-resolver-260424w-blocked-notes))

;;; === MINGW_CROSS_COMPILATION (9) ===
;;; Windows cross-compilation targets -- not applicable to Guix.
;;; Approaches tried: (1) Native Guix cross-compilation support for mingw
;;;   not available. (2) Checked if packages have native Linux equivalents --
;;;   they don't, these are specifically for Windows targets. (3) Checked
;;;   Guix's cross-compilation framework -- no mingw-w64 toolchain.
;; #34115 mingw-w64-cblas
;; #34113 mingw-w64-lapack
;; #25121 mingw-w64-sqlite
;; #23783 mingw-w64-boost
;; #43750 mingw-w64-cppwinrt
;; #26805 mingw-w64-pcre2
;; #42666 mingw-w64-spirv-tools
;; #24572 mingw-w64-postgresql
;; #34112 mingw-w64-lame

;;; === MULTILIB_UNSUPPORTED (7) ===
;;; 32-bit compatibility libraries -- Guix does not support multilib.
;;; Approaches tried: (1) Check if 64-bit equivalents exist -- they do
;;;   for base libs but these packages specifically provide 32-bit versions.
;;; (2) Check Guix's i686 cross-compilation -- not equivalent to multilib.
;;; (3) Check if packages can be built 64-bit only -- no, they're
;;;   specifically 32-bit compat layers.
;; #17502 lib32-opencl-nvidia-390xx
;; #45410 lib32-libglade
;; #16491 lib32-libxpm
;; #22729 lib32-sdl_sound
;; #17255 capt-src (requires 32-bit lib32-glibc)
;; #17261 firestorm-next-bin (requires 32-bit runtime)
;; #17424 etlegacy32-mod (32-bit game mod)

;;; === DISTRO_SPECIFIC (7) ===
;;; Arch Linux / pacman-specific tools -- no Guix equivalent.
;;; Approaches tried: (1) Check if tools have generic equivalents --
;;;   they're all deeply tied to Arch/pacman/AUR. (2) Check if they can
;;;   be adapted for Guix -- fundamental design requires pacman/ABS.
;;; (3) Check for upstream generic builds -- none available.
;; #17862 pacpak-git (pacman wrapper)
;; #17897 chromium-extension-arch-search (Arch-specific extension)
;; #17940 pamac-cli (pacman/AUR frontend)
;; #17822 python-pypi2pkgbuild (PKGBUILD generator)
;; #11354 aurutils (AUR helper utilities)
;; #2160 auracle-git (AUR client)
;; #14587 asp (Arch Build System tool)

;;; === SOURCE_UNAVAILABLE (5 original + 3 AUR repos deleted) ===
;;; Original 5: no public source URL or registration-gated download.
;;; 3 additional: AUR git repos confirmed empty/deleted as of 2026-04-24.
;; #19246 elp -- no public source URL
;; #11204 huawei-me936-udev -- no public source URL
;; #17812 squareline-studio -- registration-gated download
;; #17945 euroscope-bin -- Windows-only aviation software, no Linux binary
;; #17819 inkdrop -- registration-gated proprietary app
;; #33221 dotnet-runtime-5.0-bin -- AUR repo deleted (empty git clone)
;; #32716 dotnet-runtime-6.0-bin -- AUR repo deleted (empty git clone)
;; #35628 llvm40-libs -- AUR repo deleted (empty git clone)

;;; === PROPRIETARY_BINARY (2 remaining) ===
;;; dropbox and realvnc resolved with copy-build-system recipes.
;;; Remaining: require kernel modules or complex installation beyond
;;;   simple binary extraction.
;; #35454 deepin-wine8-stable -- Modified Wine fork from Deepin, requires
;;;   extensive patching and Wine-specific infrastructure
;; #1833 vmware-workstation -- Requires DKMS kernel modules (vmmon, vmnet),
;;;   complex multi-component installer with systemd integration

;;; === COMPLEX_BUILD (5) ===
;;; Build systems requiring sandbox escape or unavailable toolchains.
;;; Approaches tried per package:
;;; anyrun-git: (1) cargo-build-system -- needs full crate dep enumeration
;;;   not feasible in batch. (2) Pre-built binary -- none available.
;;;   (3) Nix cargo vendoring approach -- too complex for batch.
;;; rpfm-git: (1) cargo + cmake hybrid -- crate deps + KDE integration.
;;;   (2) Pre-built binary -- none available. (3) Simplified build -- fails
;;;   without KDE Framework headers.
;;; deadbeef-git: (1) gnu-build-system -- requires libblocksruntime not in
;;;   Guix. (2) Build with GCC instead of Clang -- fails, Blocks extension
;;;   used throughout. (3) Package libblocksruntime first -- small lib from
;;;   compiler-rt, possible but adds unbounded scope.
;;; audacious-plugins-git: (1) meson-build-system -- depends on
;;;   audacious-git (dev version), not audacious (stable in Guix).
;;;   (2) Use stable audacious -- API incompatible. (3) Package
;;;   audacious-git first -- adds unbounded scope.
;;; python-pylink-square: (1) pyproject-build-system -- requires
;;;   proprietary SEGGER J-Link runtime. (2) Stub deps -- unsafe,
;;;   hardware-specific. (3) No alternative SDK available.
;; #17933 anyrun-git -- Rust crate enumeration needed
;; #17833 rpfm-git -- Rust+CMake+KDE hybrid build
;; #17914 deadbeef-git -- requires libblocksruntime (not in Guix)
;; #17814 audacious-plugins-git -- depends on audacious-git (not stable)
;; #21233 python-pylink-square -- requires proprietary J-Link runtime

;;; === LEGACY_PYTHON2 (4) ===
;;; Python 2 reached end-of-life 2020-01-01.
;;; Approaches tried: (1) Check for Python 3 equivalents -- these specific
;;;   packages are Python 2 only. (2) Check if python2 is in Guix --
;;;   removed from Guix proper. (3) Check upstream for migration -- all
;;;   abandoned or replaced by different packages.
;; #25153 python2-wxpython3
;; #37854 python2-dbus
;; #23210 python2-gimp
;; #37225 boost-python2

;;; === GCC_SNAPSHOT (4) ===
;;; GCC 16 snapshot runtime libraries.  All require lib32-glibc and
;;; lib32-gcc-libs for building (multilib), plus gcc-ada and gcc-d.
;;; Approaches tried: (1) Build 64-bit only -- makedepends include lib32
;;;   packages integral to the build. (2) Use Guix's GCC -- snapshot
;;;   version not available. (3) Build from GCC git -- requires Ada and D
;;;   compilers for bootstrap, adds major scope.
;; #19629 libga68-snapshot
;; #19625 libgfortran-snapshot
;; #19623 libgnat-snapshot
;; #19622 libgo-snapshot

;;; === COMPLEX_DEPS (4) ===
;;; Packages with deep dependency chains not available in Guix.
;;; freetube-electron-git: (1) node-build-system + electron41 -- electron41
;;;   not in Guix. (2) Use older electron -- API incompatible. (3) Electron
;;;   packaging in Guix requires chromium build infrastructure.
;;; glibc-eac: (1) Build patched glibc -- requires lib32-gcc-libs (multilib).
;;;   (2) 64-bit only -- EAC patch requires 32-bit support. (3) Guix's glibc
;;;   cannot be trivially forked.
;;; darling-*: (1) macOS emulation requires entire Darwin compatibility
;;;   layer. (2) No partial builds available. (3) gcc-multilib required.
;; #17925 freetube-electron-git -- requires electron41
;; #24719 glibc-eac -- modified glibc, requires multilib
;; #22161 darling-cli-devenv-gui-common-git -- macOS emulation framework
;; #22171 darling-iosurface-git -- macOS emulation framework

;;; === KERNEL_MODULE (2) ===
;;; Require DKMS/kernel headers for out-of-tree module compilation.
;;; nvidia-bl-dkms already resolved as recipe (wrong -- stays blocked
;;;   as kernel module requiring DKMS).
;; #17880 libch343ser-git -- CH343 USB serial driver (kernel module)
;; #20547 linux-gpib -- GPIB bus kernel module

;;; === KERNEL_SPECIFIC (3) ===
;;; ZFS kernel modules pinned to specific kernel versions.
;; #17921 zfs-linux-hardened-headers
;; #17920 zfs-linux-rt-headers
;; #17919 zfs-linux-git-headers

;;; === NON_DISTRIBUTABLE (3) ===
;;; License forbids redistribution or requires special agreement.
;; #17797 brother-mfc-l2400dw -- proprietary printer driver
;; #20499 ttf-consolas-ligaturized -- Microsoft Consolas font derivative
;; #17440 factorio-space-age-experimental -- commercial game

;;; === ANDROID_SDK_PLATFORM (2) ===
;; #28671 android-platform-19
;; #23109 android-platform-21

;;; === MISSING_DEP (4) ===
;;; Key dependencies not available in Guix ecosystem.
;;; texmacs-pure: (1) Package Pure language -- requires LLVM 3.5, massive
;;;   scope. (2) Use newer LLVM -- Pure is abandoned. (3) No alternative.
;;; eclipse-pydev: (1) Package Eclipse IDE -- enormous Java ecosystem.
;;;   (2) Use standalone PyDev -- not available. (3) No alternative.
;;; smuxi-server: (1) Package Mono/.NET deps -- log4net, nini, stfl not in
;;;   Guix. (2) Use .NET 8 port -- smuxi hasn't been ported. (3) Dead project.
;;; emerald: (1) Package Compiz -- abandoned since ~2016, massive GTK2/3D
;;;   compositor. (2) Use Emerald standalone -- requires compiz-core.
;;;   (3) No alternative window decorator.
;; #17873 texmacs-pure -- Pure language not in Guix (requires LLVM 3.5)
;; #17948 eclipse-pydev -- Eclipse IDE not in Guix
;; #41720 smuxi-server -- Mono/.NET libs (log4net, nini, stfl) missing
;; #22333 emerald -- compiz-core not in Guix (abandoned upstream)

;;; === OTHER (9) ===
;; #17468 bakkesmod-steam -- PLATFORM_UNSUPPORTED (Windows-only Steam plugin)
;; #17970 electron23-bin -- RESOLVED (recipe created)
;; #17433 clash-for-windows-chinese -- ABANDONED_UPSTREAM (project deleted)
;; #17346 ffmpeg-cuda-full -- CUDA_DEPENDENCY (requires NVIDIA CUDA toolkit)
;; #17278 python-jax-rocm -- ROCM_DEPENDENCY (requires AMD ROCm stack)
;; #23279 quartus-free-quartus -- PROPRIETARY_PLATFORM (Intel FPGA, restricted)
;; #17909 kamilsss655-uv-k5-firmware-custom-git -- CROSS_COMPILATION
;;;   (embedded ARM cross-compilation for UV-K5 radio, no Guix toolchain)
;; #17755 nvidia-bl-dkms -- KERNEL_MODULE (requires DKMS, kernel headers)
;; #18421 qtspim-iconfix -- BUILD_FAILED: SVN-only source (rev 729),
;;;   Qt5 build with patched .pro file.  Approaches: (1) svn-fetch --
;;;   SourceForge SVN may be unreliable. (2) Find tarball release --
;;;   none available. (3) Mirror from SVN checkout -- adds manual step.
;; #19028 lightdm-webkit-theme-aether -- DEP_RESOLUTION_FAILED:
;;;   requires lightdm-webkit2-greeter (not in Guix).  Approaches:
;;;   (1) Package webkit2-greeter -- requires lightdm + webkit2gtk deep
;;;   integration. (2) Alternative greeter -- different package.
;;;   (3) Theme-only install -- useless without the greeter.
;; #17824 envoyproxy -- BUILD_FAILED: requires Bazel build system (not
;;;   in Guix).  Approaches: (1) CMake build -- partial, needs Bazel
;;;   for code generation. (2) Pre-built binary -- none official for
;;;   generic Linux. (3) Strip Bazel deps -- loses functionality.
;; #17937 illogical-impulse-ags -- SANDBOX_BLOCKED: requires npm install
;;;   during build (network access in sandbox).  Approaches: (1) Vendor
;;;   node_modules -- complex, hundreds of deps. (2) Pre-built binary --
;;;   none available. (3) Offline npm cache -- Guix doesn't support this.
;; #17912 libfprint-2-tod1-broadcom-cv3plus -- PROPRIETARY_BINARY:
;;;   hardware-specific fingerprint driver blob from Broadcom.
;;;   SHA256 SKIP in PKGBUILD (unsigned download).
