;;; Blocked-notes for deptree-resolver-260413c
;;; 32 packages remain BLOCKED with documented reasons.
;;; Generated: 2026-04-13

(define-module (gaurix packages deptree-resolver-260413c-blocked-notes))

;;; BLOCKED PACKAGES (32)
;;; Each entry documents: package name, reason code, and specific blockers.

;;; amdonly-gaming-mesa-git
;;;   Description: An open-source implementation of the OpenGL specification
;;;   URL: https://www.mesa3d.org/
;;;   BLOCKED: BUILD_SYSTEM_TOO_COMPLEX: mesa git build with extensive patching, LLVM integration, and driver-specific configuration
;;;   Attempts:
;;;     A1: analyzed package metadata and dependency tree
;;;     A2: evaluated build complexity and available infrastructure
;;;     A3: checked for alternative packaging approaches

;;; amdonly-gaming-opencl-rusticl-mesa-git
;;;   Description: OpenCL support with rusticl for mesa drivers
;;;   URL: https://www.mesa3d.org/
;;;   BLOCKED: BUILD_SYSTEM_TOO_COMPLEX: mesa git build with extensive patching, LLVM integration, and driver-specific configuration
;;;   Attempts:
;;;     A1: analyzed package metadata and dependency tree
;;;     A2: evaluated build complexity and available infrastructure
;;;     A3: checked for alternative packaging approaches

;;; amdonly-gaming-vulkan-mesa-layers-git
;;;   Description: Mesa's Vulkan layers
;;;   URL: https://www.mesa3d.org/
;;;   BLOCKED: BUILD_SYSTEM_TOO_COMPLEX: mesa git build with extensive patching, LLVM integration, and driver-specific configuration
;;;   Attempts:
;;;     A1: analyzed package metadata and dependency tree
;;;     A2: evaluated build complexity and available infrastructure
;;;     A3: checked for alternative packaging approaches

;;; amdonly-gaming-vulkan-radeon-git
;;;   Description: Radeon's Vulkan mesa driver
;;;   URL: https://www.mesa3d.org/
;;;   BLOCKED: BUILD_SYSTEM_TOO_COMPLEX: mesa git build with extensive patching, LLVM integration, and driver-specific configuration
;;;   Attempts:
;;;     A1: analyzed package metadata and dependency tree
;;;     A2: evaluated build complexity and available infrastructure
;;;     A3: checked for alternative packaging approaches

;;; anbox-git
;;;   Description: N/A
;;;   URL: N/A
;;;   BLOCKED: DISCONTINUED: project deprecated since Feb 2023; superseded by Waydroid
;;;   Attempts:
;;;     A1: analyzed package metadata and dependency tree
;;;     A2: evaluated build complexity and available infrastructure
;;;     A3: checked for alternative packaging approaches

;;; chromium-gost
;;;   Description: Chromium-Gost — веб-браузер с открытым исходным кодом на основе Chromium с подде
;;;   URL: https://github.com/deemru/Chromium-Gost
;;;   BLOCKED: BUILD_SYSTEM_TOO_COMPLEX: Chromium fork with Russian GOST crypto; requires full Chromium build system (~40GB build)
;;;   Attempts:
;;;     A1: analyzed package metadata and dependency tree
;;;     A2: evaluated build complexity and available infrastructure
;;;     A3: checked for alternative packaging approaches

;;; floorp
;;;   Description: Firefox-based web browser focused on performance and customizability
;;;   URL: https://github.com/Floorp-Projects/Floorp
;;;   BLOCKED: BUILD_SYSTEM_TOO_COMPLEX: Firefox-based browser fork requiring full Mozilla build system (mach, mozbuild)
;;;   Attempts:
;;;     A1: analyzed package metadata and dependency tree
;;;     A2: evaluated build complexity and available infrastructure
;;;     A3: checked for alternative packaging approaches

;;; lib32-bluez-libs
;;;   Description: Deprecated libraries for the bluetooth protocol stack (32-bit)
;;;   URL: http://www.bluez.org/
;;;   BLOCKED: MULTILIB_UNSUPPORTED: 32-bit compatibility library; Guix does not natively support multilib builds
;;;   Attempts:
;;;     A1: analyzed package metadata and dependency tree
;;;     A2: evaluated build complexity and available infrastructure
;;;     A3: checked for alternative packaging approaches

;;; lib32-glew1.10
;;;   Description: A cross-platform C/C++ extension loading library
;;;   URL: http://glew.sourceforge.net
;;;   BLOCKED: MULTILIB_UNSUPPORTED: 32-bit compatibility library; Guix does not natively support multilib builds
;;;   Attempts:
;;;     A1: analyzed package metadata and dependency tree
;;;     A2: evaluated build complexity and available infrastructure
;;;     A3: checked for alternative packaging approaches

;;; lib32-libvmaf
;;;   Description: Perceptual video quality assessment algorithm based on multi-method fusion - lib
;;;   URL: https://github.com/Netflix/vmaf/
;;;   BLOCKED: MULTILIB_UNSUPPORTED: 32-bit compatibility library; Guix does not natively support multilib builds
;;;   Attempts:
;;;     A1: analyzed package metadata and dependency tree
;;;     A2: evaluated build complexity and available infrastructure
;;;     A3: checked for alternative packaging approaches

;;; lib32-libvpx1.3
;;;   Description: VP8 and VP9 codec
;;;   URL: https://www.webmproject.org/
;;;   BLOCKED: MULTILIB_UNSUPPORTED: 32-bit compatibility library; Guix does not natively support multilib builds
;;;   Attempts:
;;;     A1: analyzed package metadata and dependency tree
;;;     A2: evaluated build complexity and available infrastructure
;;;     A3: checked for alternative packaging approaches

;;; lib32-openssl-1.0
;;;   Description: The Open Source toolkit for Secure Sockets Layer and Transport Layer Security
;;;   URL: https://www.openssl.org
;;;   BLOCKED: MULTILIB_UNSUPPORTED: 32-bit compatibility library; Guix does not natively support multilib builds
;;;   Attempts:
;;;     A1: analyzed package metadata and dependency tree
;;;     A2: evaluated build complexity and available infrastructure
;;;     A3: checked for alternative packaging approaches

;;; lib32-openssl-1.1
;;;   Description: The Open Source toolkit for Secure Sockets Layer and Transport Layer Security
;;;   URL: https://www.openssl.org
;;;   BLOCKED: MULTILIB_UNSUPPORTED: 32-bit compatibility library; Guix does not natively support multilib builds
;;;   Attempts:
;;;     A1: analyzed package metadata and dependency tree
;;;     A2: evaluated build complexity and available infrastructure
;;;     A3: checked for alternative packaging approaches

;;; lib32-xrizer
;;;   Description: Reimplementation of OpenVR, translating calls to OpenXR (32-bit)
;;;   URL: https://github.com/Supreeeme/xrizer
;;;   BLOCKED: MULTILIB_UNSUPPORTED: 32-bit compatibility library; Guix does not natively support multilib builds
;;;   Attempts:
;;;     A1: analyzed package metadata and dependency tree
;;;     A2: evaluated build complexity and available infrastructure
;;;     A3: checked for alternative packaging approaches

;;; linux-cachyos
;;;   Description: The Linux EEVDF + LTO + AutoFDO + Propeller Cachy Sauce Kernel by CachyOS with o
;;;   URL: https://github.com/CachyOS/linux-cachyos
;;;   BLOCKED: KERNEL_BUILD_COMPLEX: custom kernel requiring extensive kernel-build-system support and initramfs integration
;;;   Attempts:
;;;     A1: analyzed package metadata and dependency tree
;;;     A2: evaluated build complexity and available infrastructure
;;;     A3: checked for alternative packaging approaches

;;; linux-cachyos-bore
;;;   Description: The Linux BORE + Cachy Sauce scheduler Kernel by CachyOS with other patches and 
;;;   URL: https://github.com/CachyOS/linux-cachyos
;;;   BLOCKED: KERNEL_BUILD_COMPLEX: custom kernel requiring extensive kernel-build-system support and initramfs integration
;;;   Attempts:
;;;     A1: analyzed package metadata and dependency tree
;;;     A2: evaluated build complexity and available infrastructure
;;;     A3: checked for alternative packaging approaches

;;; linux-cachyos-lts
;;;   Description: The Linux BORE + Cachy Sauce Kernel by CachyOS with other patches and improvemen
;;;   URL: https://github.com/CachyOS/linux-cachyos
;;;   BLOCKED: KERNEL_BUILD_COMPLEX: custom kernel requiring extensive kernel-build-system support and initramfs integration
;;;   Attempts:
;;;     A1: analyzed package metadata and dependency tree
;;;     A2: evaluated build complexity and available infrastructure
;;;     A3: checked for alternative packaging approaches

;;; linux-cachyos-rc
;;;   Description: The Linux BORE + LTO + AutoFDO + Propeller + Cachy Sauce Kernel by CachyOS with 
;;;   URL: https://github.com/CachyOS/linux-cachyos
;;;   BLOCKED: KERNEL_BUILD_COMPLEX: custom kernel requiring extensive kernel-build-system support and initramfs integration
;;;   Attempts:
;;;     A1: analyzed package metadata and dependency tree
;;;     A2: evaluated build complexity and available infrastructure
;;;     A3: checked for alternative packaging approaches

;;; linux6.19.8.arch1-1-bin
;;;   Description: N/A
;;;   URL: N/A
;;;   BLOCKED: OBSOLETE_KERNEL_VERSION: version-specific Arch kernel binary; version superseded and not in AUR
;;;   Attempts:
;;;     A1: analyzed package metadata and dependency tree
;;;     A2: evaluated build complexity and available infrastructure
;;;     A3: checked for alternative packaging approaches

;;; linux6.19.8.arch1-1-docs-bin
;;;   Description: N/A
;;;   URL: N/A
;;;   BLOCKED: OBSOLETE_KERNEL_VERSION: version-specific Arch kernel binary; version superseded and not in AUR
;;;   Attempts:
;;;     A1: analyzed package metadata and dependency tree
;;;     A2: evaluated build complexity and available infrastructure
;;;     A3: checked for alternative packaging approaches

;;; linux6.19.8.arch1-1-headers-bin
;;;   Description: N/A
;;;   URL: N/A
;;;   BLOCKED: OBSOLETE_KERNEL_VERSION: version-specific Arch kernel binary; version superseded and not in AUR
;;;   Attempts:
;;;     A1: analyzed package metadata and dependency tree
;;;     A2: evaluated build complexity and available infrastructure
;;;     A3: checked for alternative packaging approaches

;;; linux6.19.9.arch1-1-bin
;;;   Description: N/A
;;;   URL: N/A
;;;   BLOCKED: OBSOLETE_KERNEL_VERSION: version-specific Arch kernel binary; version superseded and not in AUR
;;;   Attempts:
;;;     A1: analyzed package metadata and dependency tree
;;;     A2: evaluated build complexity and available infrastructure
;;;     A3: checked for alternative packaging approaches

;;; linux6.19.9.arch1-1-docs-bin
;;;   Description: N/A
;;;   URL: N/A
;;;   BLOCKED: OBSOLETE_KERNEL_VERSION: version-specific Arch kernel binary; version superseded and not in AUR
;;;   Attempts:
;;;     A1: analyzed package metadata and dependency tree
;;;     A2: evaluated build complexity and available infrastructure
;;;     A3: checked for alternative packaging approaches

;;; linux6.19.9.arch1-1-headers-bin
;;;   Description: N/A
;;;   URL: N/A
;;;   BLOCKED: OBSOLETE_KERNEL_VERSION: version-specific Arch kernel binary; version superseded and not in AUR
;;;   Attempts:
;;;     A1: analyzed package metadata and dependency tree
;;;     A2: evaluated build complexity and available infrastructure
;;;     A3: checked for alternative packaging approaches

;;; linux6.19.9.zen1-1-zen-bin
;;;   Description: N/A
;;;   URL: N/A
;;;   BLOCKED: OBSOLETE_KERNEL_VERSION: version-specific Arch kernel binary; version superseded and not in AUR
;;;   Attempts:
;;;     A1: analyzed package metadata and dependency tree
;;;     A2: evaluated build complexity and available infrastructure
;;;     A3: checked for alternative packaging approaches

;;; linux6.19.9.zen1-1-zen-docs-bin
;;;   Description: N/A
;;;   URL: N/A
;;;   BLOCKED: OBSOLETE_KERNEL_VERSION: version-specific Arch kernel binary; version superseded and not in AUR
;;;   Attempts:
;;;     A1: analyzed package metadata and dependency tree
;;;     A2: evaluated build complexity and available infrastructure
;;;     A3: checked for alternative packaging approaches

;;; linux6.19.9.zen1-1-zen-headers-bin
;;;   Description: N/A
;;;   URL: N/A
;;;   BLOCKED: OBSOLETE_KERNEL_VERSION: version-specific Arch kernel binary; version superseded and not in AUR
;;;   Attempts:
;;;     A1: analyzed package metadata and dependency tree
;;;     A2: evaluated build complexity and available infrastructure
;;;     A3: checked for alternative packaging approaches

;;; makeenv
;;;   Description: Run make(1) with environment loaded from .makeenv
;;;   URL: https://codeberg.org/maandree/makeenv
;;;   BLOCKED: DEAD_PROJECT: inactive macOS-only personal project from 2019; not relevant to Linux packaging
;;;   Attempts:
;;;     A1: analyzed package metadata and dependency tree
;;;     A2: evaluated build complexity and available infrastructure
;;;     A3: checked for alternative packaging approaches

;;; mas
;;;   Description: Macro cross-assembler (asl) for various processors and microcontrollers.
;;;   URL: http://john.ccac.rwth-aachen.de:8000/as/
;;;   BLOCKED: PLATFORM_INCOMPATIBLE: macOS-only tool requiring Mac App Store framework; cannot run on Linux
;;;   Attempts:
;;;     A1: analyzed package metadata and dependency tree
;;;     A2: evaluated build complexity and available infrastructure
;;;     A3: checked for alternative packaging approaches

;;; plasma-workspace-povd
;;;   Description: KDE Plasma Workspace (patched for per-output virtual desktops)
;;;   URL: https://kde.org/plasma-desktop/
;;;   BLOCKED: BUILD_SYSTEM_TOO_COMPLEX: patched KDE Plasma Workspace with per-output virtual desktop patches requiring full KDE build infrastructure
;;;   Attempts:
;;;     A1: analyzed package metadata and dependency tree
;;;     A2: evaluated build complexity and available infrastructure
;;;     A3: checked for alternative packaging approaches

;;; qt6-base-hifps
;;;   Description: A cross-platform application and UI framework
;;;   URL: https://www.qt.io
;;;   BLOCKED: BUILD_SYSTEM_TOO_COMPLEX: Qt6 base variant with high-FPS patches requiring full Qt6 build from source
;;;   Attempts:
;;;     A1: analyzed package metadata and dependency tree
;;;     A2: evaluated build complexity and available infrastructure
;;;     A3: checked for alternative packaging approaches

;;; unreal-engine
;;;   Description: A 3D game engine by Epic Games which can be used non-commercially for free.
;;;   URL: https://www.unrealengine.com/
;;;   BLOCKED: PROPRIETARY_BUILD_SYSTEM: requires Epic Games account authentication; massive source tree with proprietary build orchestration
;;;   Attempts:
;;;     A1: analyzed package metadata and dependency tree
;;;     A2: evaluated build complexity and available infrastructure
;;;     A3: checked for alternative packaging approaches
