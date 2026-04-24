;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Blocked notes for deptree-resolver-260424v
;;; 81 packages remain BLOCKED after evaluation.
;;; 4 recipes created + 1 dep package + 1 ALREADY_IN_GUIX = 5 resolved from 86.
;;;
;;; Categories:
;;;   MINGW_CROSS_COMPILATION (9): Windows cross-compilation targets
;;;   COMPLEX_BUILD (8): Complex build systems (Bazel, premake, npm)
;;;   MULTILIB_UNSUPPORTED (7): 32-bit compatibility libraries
;;;   DISTRO_SPECIFIC (7): Arch/pacman-specific tools
;;;   SOURCE_UNAVAILABLE (5): No upstream URL or download-gated
;;;   PROPRIETARY_BINARY (5): Closed-source proprietary software
;;;   LEGACY_PYTHON2 (4): Python 2 EOL packages
;;;   GCC_SNAPSHOT (4): GCC 16 snapshot libraries (bootstrap issues)
;;;   COMPLEX_DEPS (3): Deep dependency chains (Electron, Darling)
;;;   KERNEL_MODULE (3): Linux kernel modules (DKMS)
;;;   KERNEL_SPECIFIC (3): Kernel-version-pinned headers
;;;   NON_DISTRIBUTABLE (3): License forbids redistribution
;;;   DEP_RESOLUTION_FAILED (3): Unresolvable dependency chains
;;;   BUILD_FAILED (3): Build failures after investigation
;;;   ANDROID_SDK_PLATFORM (2): Android SDK platform libraries
;;;   EOL_VERSION (2): End-of-life runtime versions
;;;   MISSING_DEP (2): Key dependencies not in Guix
;;;   CROSS_COMPILATION (1): Embedded cross-compilation toolchain
;;;   OLD_ELECTRON (1), OLD_VERSION_VARIANT (1), ABANDONED_UPSTREAM (1)
;;;   CUDA_DEPENDENCY (1), ROCM_DEPENDENCY (1), PLATFORM_UNSUPPORTED (1)
;;;   PROPRIETARY_PLATFORM (1)

(define-module (gaurix packages deptree-resolver-260424v-blocked-notes))

;;; === MINGW_CROSS_COMPILATION (9) ===
;;; Windows cross-compilation targets -- not applicable to Guix.
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
;; #17502 lib32-opencl-nvidia-390xx
;; #45410 lib32-libglade
;; #16491 lib32-libxpm
;; #22729 lib32-sdl_sound
;; #17255 capt-src (requires 32-bit lib32-glibc)
;; #17261 firestorm-next-bin (requires 32-bit runtime)
;; #17424 etlegacy32-mod (32-bit game mod)

;;; === DISTRO_SPECIFIC (7) ===
;;; Arch Linux / pacman-specific tools -- no Guix equivalent.
;; #17862 pacpak-git (pacman wrapper)
;; #17897 chromium-extension-arch-search (Arch-specific extension)
;; #17940 pamac-cli (pacman/AUR frontend)
;; #17822 python-pypi2pkgbuild (PKGBUILD generator)
;; #11354 aurutils (AUR helper utilities)
;; #2160 auracle-git (AUR client)
;; #14587 asp (Arch Build System)

;;; === SOURCE_UNAVAILABLE (5) ===
;; #19246 elp -- no public source URL
;; #11204 huawei-me936-udev -- no public source URL
;; #17812 squareline-studio -- registration-gated download
;; #17945 euroscope-bin -- Windows-only aviation software
;; #17819 inkdrop -- registration-gated proprietary app

;;; === PROPRIETARY_BINARY (5) ===
;; #17912 libfprint-2-tod1-broadcom-cv3plus
;; #2254 dropbox
;; #17860 realvnc-rvnc-connect
;; #35454 deepin-wine8-stable
;; #1833 vmware-workstation

;;; === COMPLEX_BUILD (8) ===
;; #17933 anyrun-git -- Rust/Cargo crate enumeration needed
;; #17833 rpfm-git -- Rust/Cargo, game modding tool
;; #17914 deadbeef-git -- premake build, libblocksruntime/libdispatch missing
;; #17814 audacious-plugins-git -- git HEAD (stable version in Guix)
;; #17824 envoyproxy -- Bazel build system
;; #17937 illogical-impulse-ags -- npm install in sandbox
;; #21233 python-pylink-square -- proprietary SEGGER J-Link runtime dep
;; #24719 glibc-eac -- patched glibc for EasyAntiCheat

;;; === LEGACY_PYTHON2 (4) ===
;; #25153 python2-wxpython3
;; #37854 python2-dbus
;; #23210 python2-gimp
;; #37225 boost-python2

;;; === GCC_SNAPSHOT (4) ===
;; #19629 libga68-snapshot
;; #19625 libgfortran-snapshot
;; #19623 libgnat-snapshot
;; #19622 libgo-snapshot

;;; === COMPLEX_DEPS (3) ===
;; #17925 freetube-electron-git -- Electron builder
;; #22161 darling-cli-devenv-gui-common-git -- macOS emulation
;; #22171 darling-iosurface-git -- macOS emulation

;;; === KERNEL_MODULE (3) ===
;; #17880 libch343ser-git
;; #20547 linux-gpib
;; #17755 nvidia-bl-dkms

;;; === KERNEL_SPECIFIC (3) ===
;; #17921 zfs-linux-hardened-headers
;; #17920 zfs-linux-rt-headers
;; #17919 zfs-linux-git-headers

;;; === NON_DISTRIBUTABLE (3) ===
;; #17797 brother-mfc-l2400dw
;; #20499 ttf-consolas-ligaturized
;; #17440 factorio-space-age-experimental

;;; === DEP_RESOLUTION_FAILED (3) ===
;; #17796 heroku-cli -- npm ecosystem
;; #17807 n8n -- npm ecosystem
;; #19028 lightdm-webkit-theme-aether -- needs webkit2-greeter

;;; === BUILD_FAILED (3) ===
;; #18421 qtspim-iconfix -- SVN-only, stale (2018), no tarballs
;; #17948 eclipse-pydev -- Eclipse IDE not in Guix
;; #41720 smuxi-server -- Mono/.NET libs missing

;;; === ANDROID_SDK_PLATFORM (2) ===
;; #28671 android-platform-19
;; #23109 android-platform-21

;;; === EOL_VERSION (2) ===
;; #33221 dotnet-runtime-5.0-bin
;; #32716 dotnet-runtime-6.0-bin

;;; === MISSING_DEP (2) ===
;; #17873 texmacs-pure -- Pure language not in Guix
;; #22333 emerald -- compiz-core not in Guix

;;; === OTHER ===
;; #17468 bakkesmod-steam -- PLATFORM_UNSUPPORTED (Windows-only)
;; #17970 electron23-bin -- OLD_ELECTRON
;; #35628 llvm40-libs -- OLD_VERSION_VARIANT
;; #17433 clash-for-windows-chinese -- ABANDONED_UPSTREAM
;; #17346 ffmpeg-cuda-full -- CUDA_DEPENDENCY
;; #17278 python-jax-rocm -- ROCM_DEPENDENCY
;; #23279 quartus-free-quartus -- PROPRIETARY_PLATFORM
;; #17909 kamilsss655-uv-k5-firmware-custom-git -- CROSS_COMPILATION
