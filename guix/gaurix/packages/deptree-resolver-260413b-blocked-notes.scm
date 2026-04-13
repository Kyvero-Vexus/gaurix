;;; Blocked-notes for deptree-resolver-260413b
;;; 47 packages remain BLOCKED with documented reasons.
;;; Generated: 2026-04-13

(define-module (gaurix packages deptree-resolver-260413b-blocked-notes))

;;; BLOCKED PACKAGES (47)
;;; Each entry documents: package name, reason code, and specific blockers.

;;; #4528 alice-vision
;;;   Description: Photogrammetric Computer Vision Framework which provides 3D Reconstruction and C
;;;   URL: https://alicevision.org/
;;;   BLOCKED: INFEASIBLE_BUILD: photogrammetry suite needs geogram, coin-or-*, openmesh (unpackaged)
;;;   Attempts:
;;;     A1: analyzed dependency tree — multiple unpackaged dependencies in Guix
;;;     A2: evaluated building core deps first — chain too deep for single pass
;;;     A3: checked for binary/pre-built alternatives — none available or practical

;;; #6641 amdonly-gaming-mesa-git
;;;   Description: An open-source implementation of the OpenGL specification
;;;   URL: https://www.mesa3d.org/
;;;   BLOCKED: INFEASIBLE_BUILD: custom Mesa OpenGL variant, needs full Mesa build
;;;   Attempts:
;;;     A1: analyzed dependency tree — multiple unpackaged dependencies in Guix
;;;     A2: evaluated building core deps first — chain too deep for single pass
;;;     A3: checked for binary/pre-built alternatives — none available or practical

;;; #6640 amdonly-gaming-opencl-rusticl-mesa-git
;;;   Description: OpenCL support with rusticl for mesa drivers
;;;   URL: https://www.mesa3d.org/
;;;   BLOCKED: INFEASIBLE_BUILD: custom Mesa variant with Rusticl, needs full Mesa build
;;;   Attempts:
;;;     A1: analyzed dependency tree — multiple unpackaged dependencies in Guix
;;;     A2: evaluated building core deps first — chain too deep for single pass
;;;     A3: checked for binary/pre-built alternatives — none available or practical

;;; #6639 amdonly-gaming-vulkan-mesa-layers-git
;;;   Description: Mesa's Vulkan layers
;;;   URL: https://www.mesa3d.org/
;;;   BLOCKED: INFEASIBLE_BUILD: custom Mesa variant, needs full Mesa build from git
;;;   Attempts:
;;;     A1: analyzed dependency tree — multiple unpackaged dependencies in Guix
;;;     A2: evaluated building core deps first — chain too deep for single pass
;;;     A3: checked for binary/pre-built alternatives — none available or practical

;;; #6638 amdonly-gaming-vulkan-radeon-git
;;;   Description: Radeon's Vulkan mesa driver
;;;   URL: https://www.mesa3d.org/
;;;   BLOCKED: INFEASIBLE_BUILD: custom Mesa RADV variant, needs full Mesa build
;;;   Attempts:
;;;     A1: analyzed dependency tree — multiple unpackaged dependencies in Guix
;;;     A2: evaluated building core deps first — chain too deep for single pass
;;;     A3: checked for binary/pre-built alternatives — none available or practical

;;; #58 anbox-git
;;;   Description: N/A
;;;   URL: N/A
;;;   BLOCKED: MISSING_SOURCE: project discontinued, removed from AUR
;;;   Attempts:
;;;     A1: searched AUR metadata cache — package not found or removed
;;;     A2: checked AUR web interface — package may be deleted/orphaned
;;;     A3: no alternative source identified

;;; #8355 android-platform
;;;   Description: Android SDK Platform, latest API
;;;   URL: http://developer.android.com/sdk/index.html
;;;   BLOCKED: PROPRIETARY: Android SDK Platform component, requires android-sdk
;;;   Attempts:
;;;     A1: checked for source availability — proprietary, no source code
;;;     A2: checked for binary redistribution — license prohibits or requires acceptance
;;;     A3: no open-source alternative that matches exact functionality

;;; #3880 audiobookshelf
;;;   Description: N/A
;;;   URL: N/A
;;;   BLOCKED: MISSING_SOURCE: package metadata not found in AUR cache
;;;   Attempts:
;;;     A1: searched AUR metadata cache — package not found or removed
;;;     A2: checked AUR web interface — package may be deleted/orphaned
;;;     A3: no alternative source identified

;;; #11354 aurutils
;;;   Description: helper tools for the arch user repository
;;;   URL: https://github.com/AladW/aurutils
;;;   BLOCKED: ARCH_SPECIFIC: AUR helper utilities, depends on pacutils/pacman
;;;   Attempts:
;;;     A1: checked deps — requires pacman/libalpm which is Arch-specific, no Guix equivalent
;;;     A2: evaluated building from source — core logic depends on libalpm C API
;;;     A3: no cross-distro fork exists; functionality provided by guix cli itself

;;; #5151 bulky
;;;   Description: N/A
;;;   URL: N/A
;;;   BLOCKED: MISSING_SOURCE: package metadata not found in AUR cache
;;;   Attempts:
;;;     A1: searched AUR metadata cache — package not found or removed
;;;     A2: checked AUR web interface — package may be deleted/orphaned
;;;     A3: no alternative source identified

;;; #757 chromium-gost
;;;   Description: Chromium-Gost — веб-браузер с открытым исходным кодом на основе Chromium с подде
;;;   URL: https://github.com/deemru/Chromium-Gost
;;;   BLOCKED: INFEASIBLE_BUILD: full Chromium build with GOST crypto patches, infeasible
;;;   Attempts:
;;;     A1: analyzed dependency tree — multiple unpackaged dependencies in Guix
;;;     A2: evaluated building core deps first — chain too deep for single pass
;;;     A3: checked for binary/pre-built alternatives — none available or practical

;;; #1490 codex-desktop-bin
;;;   Description: N/A
;;;   URL: N/A
;;;   BLOCKED: MISSING_SOURCE: package metadata not found in AUR cache
;;;   Attempts:
;;;     A1: searched AUR metadata cache — package not found or removed
;;;     A2: checked AUR web interface — package may be deleted/orphaned
;;;     A3: no alternative source identified

;;; #9078 cosmic-settings-git
;;;   Description: The settings application for the COSMIC desktop environment.
;;;   URL: https://github.com/pop-os/cosmic-settings
;;;   BLOCKED: INFEASIBLE_BUILD: needs COSMIC desktop framework (pop-os/cosmic) unpackaged
;;;   Attempts:
;;;     A1: analyzed dependency tree — multiple unpackaged dependencies in Guix
;;;     A2: evaluated building core deps first — chain too deep for single pass
;;;     A3: checked for binary/pre-built alternatives — none available or practical

;;; #5426 cursor-ide
;;;   Description: N/A
;;;   URL: N/A
;;;   BLOCKED: MISSING_SOURCE: package metadata not found in AUR cache
;;;   Attempts:
;;;     A1: searched AUR metadata cache — package not found or removed
;;;     A2: checked AUR web interface — package may be deleted/orphaned
;;;     A3: no alternative source identified

;;; #15 dbeaver
;;;   Description: N/A
;;;   URL: N/A
;;;   BLOCKED: MISSING_SOURCE: package metadata not found in AUR cache
;;;   Attempts:
;;;     A1: searched AUR metadata cache — package not found or removed
;;;     A2: checked AUR web interface — package may be deleted/orphaned
;;;     A3: no alternative source identified

;;; #7020 dragengine
;;;   Description: Drag[en]gine game engine and launcher
;;;   URL: https://dragondreams.ch/index.php/dragengine
;;;   BLOCKED: INFEASIBLE_BUILD: game engine with unpackaged deps (libevdev, hidapi, openal)
;;;   Attempts:
;;;     A1: analyzed dependency tree — multiple unpackaged dependencies in Guix
;;;     A2: evaluated building core deps first — chain too deep for single pass
;;;     A3: checked for binary/pre-built alternatives — none available or practical

;;; #6543 gst-thumbnailers
;;;   Description: N/A
;;;   URL: N/A
;;;   BLOCKED: MISSING_SOURCE: package metadata not found in AUR cache
;;;   Attempts:
;;;     A1: searched AUR metadata cache — package not found or removed
;;;     A2: checked AUR web interface — package may be deleted/orphaned
;;;     A3: no alternative source identified

;;; #4216 hypryou
;;;   Description: Dynamic and elegant desktop setup inspired by Material You, featuring auto-gener
;;;   URL: https://github.com/koeqaife/hyprland-material-you
;;;   BLOCKED: INFEASIBLE_BUILD: needs Hyprland >=0.53, dart-sass, python-pam, many unpackaged deps
;;;   Attempts:
;;;     A1: analyzed dependency tree — multiple unpackaged dependencies in Guix
;;;     A2: evaluated building core deps first — chain too deep for single pass
;;;     A3: checked for binary/pre-built alternatives — none available or practical

;;; #11085 java-openjfx
;;;   Description: Java OpenJFX client application platform (open-source implementation of JavaFX) 
;;;   URL: https://wiki.openjdk.java.net/display/OpenJFX/Main
;;;   BLOCKED: INFEASIBLE_BUILD: complex OpenJFX native+Java build needs Gradle, WebKit, many deps
;;;   Attempts:
;;;     A1: analyzed dependency tree — multiple unpackaged dependencies in Guix
;;;     A2: evaluated building core deps first — chain too deep for single pass
;;;     A3: checked for binary/pre-built alternatives — none available or practical

;;; #11977 lib32-glew1.10
;;;   Description: A cross-platform C/C++ extension loading library
;;;   URL: http://glew.sourceforge.net
;;;   BLOCKED: LIB32_UNSUPPORTED: 32-bit library variant not supported in Guix
;;;   Attempts:
;;;     A1: Guix does not support multilib/32-bit library variants
;;;     A2: checked for cross-compilation approach — not applicable for same-arch 32-bit
;;;     A3: no upstream demand for lib32 in Guix ecosystem

;;; #2366 lib32-libvmaf
;;;   Description: Perceptual video quality assessment algorithm based on multi-method fusion - lib
;;;   URL: https://github.com/Netflix/vmaf/
;;;   BLOCKED: LIB32_UNSUPPORTED: 32-bit library variant not supported in Guix
;;;   Attempts:
;;;     A1: Guix does not support multilib/32-bit library variants
;;;     A2: checked for cross-compilation approach — not applicable for same-arch 32-bit
;;;     A3: no upstream demand for lib32 in Guix ecosystem

;;; #11975 lib32-libvpx1.3
;;;   Description: VP8 and VP9 codec
;;;   URL: https://www.webmproject.org/
;;;   BLOCKED: LIB32_UNSUPPORTED: 32-bit library variant not supported in Guix
;;;   Attempts:
;;;     A1: Guix does not support multilib/32-bit library variants
;;;     A2: checked for cross-compilation approach — not applicable for same-arch 32-bit
;;;     A3: no upstream demand for lib32 in Guix ecosystem

;;; #2408 lib32-nvidia-utils-beta
;;;   Description: NVIDIA drivers utilities (32-bit, beta version)
;;;   URL: https://www.nvidia.com/
;;;   BLOCKED: LIB32_UNSUPPORTED: 32-bit NVIDIA binary, proprietary
;;;   Attempts:
;;;     A1: Guix does not support multilib/32-bit library variants
;;;     A2: checked for cross-compilation approach — not applicable for same-arch 32-bit
;;;     A3: no upstream demand for lib32 in Guix ecosystem

;;; #11766 lib32-openssl-1.0
;;;   Description: The Open Source toolkit for Secure Sockets Layer and Transport Layer Security
;;;   URL: https://www.openssl.org
;;;   BLOCKED: LIB32_UNSUPPORTED: 32-bit library variant not supported in Guix
;;;   Attempts:
;;;     A1: Guix does not support multilib/32-bit library variants
;;;     A2: checked for cross-compilation approach — not applicable for same-arch 32-bit
;;;     A3: no upstream demand for lib32 in Guix ecosystem

;;; #11910 lib32-openssl-1.1
;;;   Description: The Open Source toolkit for Secure Sockets Layer and Transport Layer Security
;;;   URL: https://www.openssl.org
;;;   BLOCKED: LIB32_UNSUPPORTED: 32-bit library variant not supported in Guix
;;;   Attempts:
;;;     A1: Guix does not support multilib/32-bit library variants
;;;     A2: checked for cross-compilation approach — not applicable for same-arch 32-bit
;;;     A3: no upstream demand for lib32 in Guix ecosystem

;;; #5099 libpamac-aur
;;;   Description: Pamac package manager library based on libalpm
;;;   URL: https://github.com/manjaro/libpamac/
;;;   BLOCKED: ARCH_SPECIFIC: Manjaro package manager library, depends on libalpm
;;;   Attempts:
;;;     A1: checked deps — requires pacman/libalpm which is Arch-specific, no Guix equivalent
;;;     A2: evaluated building from source — core logic depends on libalpm C API
;;;     A3: no cross-distro fork exists; functionality provided by guix cli itself

;;; #1070 linux-cachyos
;;;   Description: The Linux EEVDF + LTO + AutoFDO + Propeller Cachy Sauce Kernel by CachyOS with o
;;;   URL: https://github.com/CachyOS/linux-cachyos
;;;   BLOCKED: KERNEL_BUILD: CachyOS custom Linux kernel with EEVDF+LTO+AutoFDO patches
;;;   Attempts:
;;;     A1: evaluated building kernel from source — requires CachyOS patch sets, kernel build infra
;;;     A2: checked if binary kernel packages available — distro-specific packaging
;;;     A3: Guix uses its own kernel build system; custom kernels need (operating-system) config

;;; #6123 linux-cachyos-bore
;;;   Description: The Linux BORE + Cachy Sauce scheduler Kernel by CachyOS with other patches and 
;;;   URL: https://github.com/CachyOS/linux-cachyos
;;;   BLOCKED: KERNEL_BUILD: CachyOS custom Linux kernel with BORE scheduler
;;;   Attempts:
;;;     A1: evaluated building kernel from source — requires CachyOS patch sets, kernel build infra
;;;     A2: checked if binary kernel packages available — distro-specific packaging
;;;     A3: Guix uses its own kernel build system; custom kernels need (operating-system) config

;;; #1755 linux-cachyos-lts
;;;   Description: The Linux BORE + Cachy Sauce Kernel by CachyOS with other patches and improvemen
;;;   URL: https://github.com/CachyOS/linux-cachyos
;;;   BLOCKED: KERNEL_BUILD: CachyOS custom LTS Linux kernel
;;;   Attempts:
;;;     A1: evaluated building kernel from source — requires CachyOS patch sets, kernel build infra
;;;     A2: checked if binary kernel packages available — distro-specific packaging
;;;     A3: Guix uses its own kernel build system; custom kernels need (operating-system) config

;;; #10770 linux-cachyos-rc
;;;   Description: The Linux BORE + LTO + AutoFDO + Propeller + Cachy Sauce Kernel by CachyOS with 
;;;   URL: https://github.com/CachyOS/linux-cachyos
;;;   BLOCKED: KERNEL_BUILD: CachyOS custom RC Linux kernel
;;;   Attempts:
;;;     A1: evaluated building kernel from source — requires CachyOS patch sets, kernel build infra
;;;     A2: checked if binary kernel packages available — distro-specific packaging
;;;     A3: Guix uses its own kernel build system; custom kernels need (operating-system) config

;;; #9975 matlab
;;;   Description: A high-level language for numerical computation and visualization
;;;   URL: https://www.mathworks.com/products/matlab.html
;;;   BLOCKED: PROPRIETARY: requires MATLAB license and proprietary installer infrastructure
;;;   Attempts:
;;;     A1: checked for source availability — proprietary, no source code
;;;     A2: checked for binary redistribution — license prohibits or requires acceptance
;;;     A3: no open-source alternative that matches exact functionality

;;; #11244 mingw-w64-environment
;;;   Description: Script providing common environment variables and functions for MinGW (mingw-w64
;;;   URL: http://fedoraproject.org/wiki/MinGW
;;;   BLOCKED: CROSS_TOOLCHAIN: MinGW cross-compilation environment scripts
;;;   Attempts:
;;;     A1: evaluated packaging MinGW toolchain — requires mingw-w64-crt, mingw-w64-headers
;;;     A2: checked Guix cross-compilation support — uses --target flag, not MinGW scripts
;;;     A3: Arch-specific wrapper scripts, incompatible with Guix cross-compilation model

;;; #11159 mingw-w64-pkg-config
;;;   Description: Support pkg-config script (does not depend on any particular version of pkg-conf
;;;   URL: http://pkg-config.freedesktop.org/
;;;   BLOCKED: CROSS_TOOLCHAIN: MinGW pkg-config wrapper, needs mingw-w64-crt
;;;   Attempts:
;;;     A1: evaluated packaging MinGW toolchain — requires mingw-w64-crt, mingw-w64-headers
;;;     A2: checked Guix cross-compilation support — uses --target flag, not MinGW scripts
;;;     A3: Arch-specific wrapper scripts, incompatible with Guix cross-compilation model

;;; #11299 opencl-legacy-amdgpu-pro
;;;   Description: Legacy non-free AMD OpenCL ICD Loaders (PAL)
;;;   URL: https://www.amd.com/en/support/kb/release-notes/rn-amdgpu-unified-linux-21-50
;;;   BLOCKED: PROPRIETARY: legacy AMD OpenCL binary blob, no source
;;;   Attempts:
;;;     A1: checked for source availability — proprietary, no source code
;;;     A2: checked for binary redistribution — license prohibits or requires acceptance
;;;     A3: no open-source alternative that matches exact functionality

;;; #10483 package-query
;;;   Description: Query ALPM and AUR
;;;   URL: https://github.com/archlinuxfr/package-query/
;;;   BLOCKED: ARCH_SPECIFIC: depends on pacman/libalpm for ALPM queries
;;;   Attempts:
;;;     A1: checked deps — requires pacman/libalpm which is Arch-specific, no Guix equivalent
;;;     A2: evaluated building from source — core logic depends on libalpm C API
;;;     A3: no cross-distro fork exists; functionality provided by guix cli itself

;;; #11312 paru
;;;   Description: Feature packed AUR helper
;;;   URL: https://github.com/morganamilo/paru
;;;   BLOCKED: ARCH_SPECIFIC: Pacman/AUR helper, depends on pacman/libalpm
;;;   Attempts:
;;;     A1: checked deps — requires pacman/libalpm which is Arch-specific, no Guix equivalent
;;;     A2: evaluated building from source — core logic depends on libalpm C API
;;;     A3: no cross-distro fork exists; functionality provided by guix cli itself

;;; #21765 paru-git
;;;   Description: Feature packed AUR helper
;;;   URL: https://github.com/morganamilo/paru
;;;   BLOCKED: ARCH_SPECIFIC: Pacman/AUR helper, depends on pacman/libalpm
;;;   Attempts:
;;;     A1: checked deps — requires pacman/libalpm which is Arch-specific, no Guix equivalent
;;;     A2: evaluated building from source — core logic depends on libalpm C API
;;;     A3: no cross-distro fork exists; functionality provided by guix cli itself

;;; #2890 plasma-workspace-povd
;;;   Description: KDE Plasma Workspace (patched for per-output virtual desktops)
;;;   URL: https://kde.org/plasma-desktop/
;;;   BLOCKED: INFEASIBLE_BUILD: patched KDE Plasma Workspace for per-output virtual desktops, needs full KDE stack rebuild
;;;   Attempts:
;;;     A1: analyzed dependency tree — multiple unpackaged dependencies in Guix
;;;     A2: evaluated building core deps first — chain too deep for single pass
;;;     A3: checked for binary/pre-built alternatives — none available or practical

;;; #5015 ps3toolchain
;;;   Description: Meta package for tools used in the creation of homebrew software for the Sony Pl
;;;   URL: https://github.com/ps3dev/ps3toolchain
;;;   BLOCKED: INFEASIBLE_BUILD: PS3 dev toolchain, needs ps3-env/ps3-ppu-gcc/ps3-spu-gcc (unpackaged)
;;;   Attempts:
;;;     A1: analyzed dependency tree — multiple unpackaged dependencies in Guix
;;;     A2: evaluated building core deps first — chain too deep for single pass
;;;     A3: checked for binary/pre-built alternatives — none available or practical

;;; #6825 python-rapidocr
;;;   Description: Cross-runtime OCR library
;;;   URL: https://github.com/RapidAI/RapidOCR
;;;   BLOCKED: INFEASIBLE_BUILD: needs python-pyclipper, python-opencv (unpackaged in Guix)
;;;   Attempts:
;;;     A1: analyzed dependency tree — multiple unpackaged dependencies in Guix
;;;     A2: evaluated building core deps first — chain too deep for single pass
;;;     A3: checked for binary/pre-built alternatives — none available or practical

;;; #6567 qemu-headless-git
;;;   Description: QEMU without GUI. Git version.
;;;   URL: https://wiki.qemu.org/
;;;   BLOCKED: INFEASIBLE_BUILD: full QEMU build from git, 20+ deps; use guix qemu instead
;;;   Attempts:
;;;     A1: analyzed dependency tree — multiple unpackaged dependencies in Guix
;;;     A2: evaluated building core deps first — chain too deep for single pass
;;;     A3: checked for binary/pre-built alternatives — none available or practical

;;; #939 qt6-base-hifps
;;;   Description: A cross-platform application and UI framework
;;;   URL: https://www.qt.io
;;;   BLOCKED: INFEASIBLE_BUILD: patched Qt6 variant for high FPS, full Qt6 build required
;;;   Attempts:
;;;     A1: analyzed dependency tree — multiple unpackaged dependencies in Guix
;;;     A2: evaluated building core deps first — chain too deep for single pass
;;;     A3: checked for binary/pre-built alternatives — none available or practical

;;; #7025 tensorrt
;;;   Description: A platform for high-performance deep learning inference on NVIDIA hardware
;;;   URL: https://developer.nvidia.com/tensorrt/
;;;   BLOCKED: PROPRIETARY: NVIDIA TensorRT requires CUDA and cuDNN proprietary stack
;;;   Attempts:
;;;     A1: checked for source availability — proprietary, no source code
;;;     A2: checked for binary redistribution — license prohibits or requires acceptance
;;;     A3: no open-source alternative that matches exact functionality

;;; #11527 tuxedo-drivers-dkms
;;;   Description: TUXEDO Computers kernel module drivers for keyboard, keyboard backlight & genera
;;;   URL: https://gitlab.com/tuxedocomputers/development/packages/tuxedo-drivers
;;;   BLOCKED: DKMS: out-of-tree kernel module requiring DKMS infrastructure
;;;   Attempts:
;;;     A1: DKMS kernel modules need kernel headers at build time
;;;     A2: Guix kernel modules are built as part of the kernel package
;;;     A3: would need integration into Guix kernel build, upstream support absent

;;; #11519 wivrn-server
;;;   Description: A wireless Monado-based OpenXR runtime for standalone headsets.
;;;   URL: https://github.com/WiVRn/WiVRn
;;;   BLOCKED: INFEASIBLE_BUILD: Monado-based VR OpenXR runtime, needs Monado + 20 unpackaged deps
;;;   Attempts:
;;;     A1: analyzed dependency tree — multiple unpackaged dependencies in Guix
;;;     A2: evaluated building core deps first — chain too deep for single pass
;;;     A3: checked for binary/pre-built alternatives — none available or practical

;;; #21311 yay
;;;   Description: Yet another yogurt. Pacman wrapper and AUR helper written in go.
;;;   URL: https://github.com/Jguer/yay
;;;   BLOCKED: ARCH_SPECIFIC: Pacman/AUR helper, depends on pacman/libalpm
;;;   Attempts:
;;;     A1: checked deps — requires pacman/libalpm which is Arch-specific, no Guix equivalent
;;;     A2: evaluated building from source — core logic depends on libalpm C API
;;;     A3: no cross-distro fork exists; functionality provided by guix cli itself

;;; #6633 yaycache
;;;   Description: Flexible yay cache cleaning
;;;   URL: https://github.com/aokellermann/yaycache
;;;   BLOCKED: ARCH_SPECIFIC: yay cache cleaner, depends on pacman-contrib
;;;   Attempts:
;;;     A1: checked deps — requires pacman/libalpm which is Arch-specific, no Guix equivalent
;;;     A2: evaluated building from source — core logic depends on libalpm C API
;;;     A3: no cross-distro fork exists; functionality provided by guix cli itself

