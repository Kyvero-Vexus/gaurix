;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency-tree resolver pass — deptree-resolver-260407g — blocked notes
;;; Documents why 83 of 100 selected packages remain BLOCKED.
;;; Generated: 2026-04-07T23:30:00+00:00

(define-module (gaurix packages deptree-resolver-260407g-blocked-notes))

;;; ════════════════════════════════════════════════════════════════════════
;;; BLOCKED PACKAGE NOTES (83 packages)
;;; ════════════════════════════════════════════════════════════════════════
;;;
;;; ARCH_SPECIFIC — Packages that require Arch Linux infrastructure (pacman,
;;; libalpm, AUR) and have no meaningful use on Guix.
;;;
;;; 1. yay (#21311, rdeps=5)
;;;    ARCH_SPECIFIC — AUR helper wrapping pacman + git. Requires libalpm,
;;;    pacman, and the AUR ecosystem. Fundamental incompatibility with Guix.
;;;
;;; 2. archlinux-java-run (#12875, rdeps=4)
;;;    ARCH_SPECIFIC — Arch Java runtime selector. Wraps archlinux-java
;;;    (pacman hook-based). Guix handles Java via profiles natively.
;;;
;;; 5. paru (#11312, rdeps=2)
;;;    ARCH_SPECIFIC — AUR helper (Rust). Requires libalpm/pacman.
;;;
;;; 15. yaycache (#6633, rdeps=1)
;;;    ARCH_SPECIFIC — yay cache manager. Depends on yay (blocked).
;;;
;;; 17. package-query (#10483, rdeps=1)
;;;    ARCH_SPECIFIC — libalpm query tool. Requires Arch package DB.
;;;
;;; 18. paru-git (#21765, rdeps=1)
;;;    ARCH_SPECIFIC — paru development version. Same as paru.
;;;
;;; 23. aurutils (#20, rdeps=1)
;;;    ARCH_SPECIFIC — AUR build automation. Requires pacman+makepkg.
;;;
;;; 69. arch-remaster (#, rdeps=0)
;;;    ARCH_SPECIFIC — Arch ISO remastering. Requires pacman infra.
;;;    NOT_IN_AUR — Not found in AUR cache.
;;;
;;; 70. arch-updater (#, rdeps=0)
;;;    ARCH_SPECIFIC — Arch system updater wrapping pacman.
;;;    NOT_IN_AUR — Not found in AUR cache.
;;;
;;; 71. archarchive (#, rdeps=0)
;;;    ARCH_SPECIFIC — Arch Linux rollback tool using ALA + pacman.
;;;
;;; 72. archlinux-artwork (#, rdeps=0)
;;;    ARCH_SPECIFIC_BRANDING — Arch Linux logos/artwork. Trademark.
;;;
;;; 95. check-broken-packages-pacman-hook-git (#, rdeps=0)
;;;    ARCH_SPECIFIC — Pacman hook. NOT_IN_AUR.
;;;
;;; ════════════════════════════════════════════════════════════════════════
;;; PROPRIETARY_LICENSE / PROPRIETARY_DRIVER — Packages with non-FOSS
;;; licenses or requiring proprietary components.
;;;
;;; 3. matlab (#9975, rdeps=3)
;;;    PROPRIETARY_LICENSE — MathWorks MATLAB. Commercial license, requires
;;;    MathWorks account and license file. Not redistributable.
;;;
;;; 14. samsung-unified-driver-printer (#650, rdeps=1)
;;;    PROPRIETARY_LICENSE — Samsung printer driver. Custom Samsung license.
;;;
;;; 16. iscan (#640, rdeps=1)
;;;    PROPRIETARY_COMPONENTS — EPSON scanner. Mixed GPL + AVASYSPL.
;;;    Requires proprietary EPSON plugins.
;;;
;;; 19. samsung-unified-driver-scanner (#649, rdeps=1)
;;;    PROPRIETARY_LICENSE — Samsung scanner driver. Custom Samsung license.
;;;
;;; 22. opencl-amd (#, rdeps=1)
;;;    PROPRIETARY_DRIVER — AMD OpenCL runtime. Proprietary AMD license.
;;;    Extracted from AMDGPU-PRO driver stack.
;;;
;;; 29. lib32-nvidia-utils-beta (#, rdeps=1)
;;;    PROPRIETARY_DRIVER — NVIDIA 32-bit utils (beta). Proprietary.
;;;
;;; 30. python-frida (#, rdeps=1)
;;;    PROPRIETARY_LICENSE — Frida dynamic instrumentation. Custom license
;;;    with restrictions on commercial use.
;;;
;;; 35. android-sdk (#, rdeps=1)
;;;    PROPRIETARY_LICENSE — Google Android SDK. Proprietary EULA.
;;;
;;; 50. tensorrt (#, rdeps=1)
;;;    PROPRIETARY_LICENSE — NVIDIA TensorRT. Proprietary NVIDIA license.
;;;
;;; 56. input-leap-headless-git (#, rdeps=1)
;;;    PROPRIETARY_LICENSE — Input Leap KVM. Custom license per AUR.
;;;    (Note: upstream may be GPL but AUR marks as custom.)
;;;
;;; 57. wechat-bin (#, rdeps=1)
;;;    PROPRIETARY_LICENSE — Tencent WeChat. Proprietary EULA.
;;;
;;; 96. chess-merida (#, rdeps=0)
;;;    PROPRIETARY_LICENSE — Chess Merida font. Custom/proprietary license.
;;;
;;; 99. chkufsd-bin (#, rdeps=0)
;;;    PROPRIETARY_LICENSE — Paragon UFSD check utility. Proprietary.
;;;
;;; ════════════════════════════════════════════════════════════════════════
;;; 32BIT_LIBRARY — 32-bit compatibility libraries. Guix lacks a
;;; comprehensive 32-bit library ecosystem.
;;;
;;; 21. lib32-libvmaf (#, rdeps=1)
;;;    32BIT_LIBRARY — 32-bit Netflix VMAF library. Needs 32-bit toolchain.
;;;
;;; 32. lib32-bluez-libs (#, rdeps=1)
;;;    32BIT_LIBRARY — 32-bit BlueZ libraries. Needs 32-bit toolchain.
;;;
;;; ════════════════════════════════════════════════════════════════════════
;;; CROSS_COMPILATION_TOOLCHAIN — Cross-compilation or hardware-specific
;;; toolchains that Guix handles natively.
;;;
;;; 26. ps3toolchain (#, rdeps=1)
;;;    MISSING_DEPENDENCIES — PS3 homebrew toolchain meta-package.
;;;    All 5 component deps missing from Guix.
;;;
;;; 33. mips64-linux-gnu-gcc-bootstrap (#, rdeps=1)
;;;    CROSS_COMPILATION_TOOLCHAIN — MIPS64 GCC bootstrap. Guix has
;;;    native cross-compilation support.
;;;
;;; ════════════════════════════════════════════════════════════════════════
;;; COMPLEX_BUILD — Packages requiring extensive build infrastructure,
;;; many missing dependencies, or heavy patching.
;;;
;;; 4. plasma-workspace-povd (#2890, rdeps=3)
;;;    COMPLEX_BUILD — KDE Plasma workspace with POVD patches. 105 deps,
;;;    requires full KDE Frameworks + Plasma stack. Custom fork patches.
;;;
;;; 6. bms-shell (#6310, rdeps=2)
;;;    NO_SOURCE_CODE — GitHub repo contains only a 67MB binary tarball.
;;;    No actual source code. Claims GPL-3.0 but violates source
;;;    distribution requirements. All deps (quickshell, dgop,
;;;    bms-shell-compositor) also missing.
;;;
;;; 7. intel-npu-driver (#9886, rdeps=2)
;;;    COMPLEX_BUILD — Intel NPU (AI accelerator) driver. Requires
;;;    level-zero, intel-compute-runtime, and kernel module. Hardware-
;;;    specific with complex build chain.
;;;
;;; 12. sdrpp-headers-git (#9803, rdeps=1)
;;;    COMPLEX_BUILD — SDR++ header-only dev package. Requires building
;;;    SDR++ from git. Complex DSP/radio dependencies.
;;;
;;; 13. ggml-sycl-f16-git (#3667, rdeps=1)
;;;    MISSING_BUILD_TOOLS — GGML with Intel SYCL (oneAPI) backend.
;;;    Requires Intel DPC++ compiler and oneAPI toolkit, not in Guix.
;;;
;;; 20. kdesignerplugin (#7324, rdeps=1)
;;;    COMPLEX_BUILD — KDE Frameworks 5 designer plugin. Requires full
;;;    KDE Frameworks 5 stack including KF5 Doctools, KF5 CoreAddons, etc.
;;;    KF5 is being superseded by KF6.
;;;
;;; 24. icu74 (#, rdeps=1)
;;;    COMPLEX_BUILD — Specific ICU version 74. Guix has ICU but different
;;;    version. Parallel installing specific ICU versions requires careful
;;;    ABI management.
;;;
;;; 25. kemoticons (#, rdeps=1)
;;;    COMPLEX_BUILD — KDE Frameworks 5 emoticon support. Requires full
;;;    KF5 stack. Being superseded by KF6.
;;;
;;; 27. cosmic-bg-git (#, rdeps=1)
;;;    COMPLEX_BUILD — COSMIC desktop background manager. Written in Rust,
;;;    requires full COSMIC desktop toolkit (libcosmic, iced-sctk).
;;;    Multiple COSMIC-specific deps missing from Guix.
;;;
;;; 28. intel-graphics-compiler-legacy (#, rdeps=1)
;;;    COMPLEX_BUILD — Intel GPU compiler (legacy branch). Requires LLVM
;;;    fork, SPIRV-LLVM-Translator, and Intel-specific patches.
;;;    Extremely complex build.
;;;
;;; 31. cosmic-files-git (#, rdeps=1)
;;;    COMPLEX_BUILD — COSMIC file manager. Same COSMIC toolkit deps.
;;;
;;; 34. python-twisterl (#, rdeps=1)
;;;    MISSING_DEPENDENCIES — Python quantum computing library. Requires
;;;    Python packages not in Guix (qiskit ecosystem).
;;;
;;; 36. element-web-git (#, rdeps=1)
;;;    COMPLEX_BUILD — Matrix Element web client. Requires Node.js/Yarn
;;;    build with hundreds of npm dependencies. Complex web bundling.
;;;
;;; 37. llama.cpp-hip (#, rdeps=1)
;;;    BLOCKED_DEPENDENCY — llama.cpp with AMD ROCm backend. Requires
;;;    ROCm/HIP toolkit not available in Guix.
;;;
;;; 38. cosmic-applets-git (#, rdeps=1)
;;;    COMPLEX_BUILD — COSMIC desktop applets. Same COSMIC toolkit deps.
;;;
;;; 39. cosmic-osd-git (#, rdeps=1)
;;;    COMPLEX_BUILD — COSMIC on-screen display. Same COSMIC toolkit deps.
;;;
;;; 40. libastal-git (#, rdeps=1)
;;;    COMPLEX_BUILD — Astal widget library. Requires Vala, multiple GLib/
;;;    GTK4 deps, and custom build system. Many sub-libraries.
;;;
;;; 41. kde-material-you-colors (#, rdeps=1)
;;;    MISSING_DEPENDENCIES — KDE Material You color scheme. Requires
;;;    python-materialyoucolor (not in Guix) and Plasma 5/6 integration.
;;;
;;; 42. libpamac-full (#, rdeps=1)
;;;    ARCH_SPECIFIC — Manjaro package manager library. Requires libalpm,
;;;    appstream, and pacman infrastructure.
;;;
;;; 43. snapx (#, rdeps=1)
;;;    COMPLEX_BUILD — Snap package helper. Requires snapd ecosystem.
;;;    Fundamentally incompatible with Guix.
;;;
;;; 44. linux-cachyos-lts (#, rdeps=1)
;;;    CUSTOM_KERNEL — CachyOS LTS kernel. Requires patching upstream
;;;    Linux kernel with CachyOS scheduler patches. Guix has its own
;;;    kernel packaging.
;;;
;;; 45. python-rapidocr (#, rdeps=1)
;;;    MISSING_DEPENDENCIES — RapidOCR Python library. Requires
;;;    onnxruntime (not in Guix), OpenCV with specific backends.
;;;
;;; 46. libastal-meta (#, rdeps=1)
;;;    COMPLEX_BUILD — Meta package for libastal. Depends on libastal-git.
;;;
;;; 47. linux-cachyos (#, rdeps=1)
;;;    CUSTOM_KERNEL — CachyOS kernel. Same as linux-cachyos-lts.
;;;
;;; 48. linux-cachyos-rc (#, rdeps=1)
;;;    CUSTOM_KERNEL — CachyOS RC kernel. Same as linux-cachyos.
;;;
;;; 49. python-insightface (#, rdeps=1)
;;;    MISSING_DEPENDENCIES — InsightFace deep learning. Requires
;;;    onnxruntime, mxnet, and CUDA toolkit.
;;;
;;; 51. cosmic-settings-git (#, rdeps=1)
;;;    COMPLEX_BUILD — COSMIC settings app. Same COSMIC toolkit deps.
;;;
;;; 52. goldendict (#, rdeps=1)
;;;    SUPERSEDED — GoldenDict (abandoned). Already available in Guix as
;;;    goldendict-ng (maintained fork). Use goldendict-ng instead.
;;;
;;; 53. libpamac-aur (#, rdeps=1)
;;;    ARCH_SPECIFIC — Manjaro package manager with AUR support. Same as
;;;    libpamac-full.
;;;
;;; 54. alice-vision (#, rdeps=1)
;;;    COMPLEX_BUILD — 3D reconstruction framework. Requires OpenMVG,
;;;    Alembic, OpenEXR, CUDA, Ceres Solver, and many other deps.
;;;    Extremely complex CMake build.
;;;
;;; 55. dragengine (#, rdeps=1)
;;;    COMPLEX_BUILD — Drag[en]gine game engine. Custom build system with
;;;    SCons, requires extensive graphics/audio/physics deps.
;;;
;;; 58. hypryou (#, rdeps=1)
;;;    COMPLEX_BUILD — Hyprland theme/config tool. Requires Hyprland
;;;    ecosystem (hyprland, hyprpaper, etc.) not fully in Guix.
;;;
;;; 59. amdonly-gaming-vulkan-mesa-layers-git (#, rdeps=1)
;;;    PATCHED_FORK — Custom-patched Mesa Vulkan layers for AMD gaming.
;;;    Requires building Mesa from custom fork with specific patches.
;;;
;;; 60. pipelex (#, rdeps=1)
;;;    COMPLEX_BUILD — Pipeline execution framework (Python). Requires
;;;    multiple Python dependencies not in Guix.
;;;
;;; 61. libnm-iwd (#, rdeps=1)
;;;    PATCHED_FORK — NetworkManager rebuilt with iwd backend instead of
;;;    wpa_supplicant. Requires custom-patched NetworkManager build.
;;;
;;; 62. amdonly-gaming-opencl-rusticl-mesa-git (#, rdeps=1)
;;;    PATCHED_FORK — Custom Mesa OpenCL Rusticl for AMD. Same as #59.
;;;
;;; 63. amdonly-gaming-vulkan-radeon-git (#, rdeps=1)
;;;    PATCHED_FORK — Custom Mesa Vulkan RADV for AMD. Same as #59.
;;;
;;; 64. amdonly-gaming-mesa-git (#, rdeps=1)
;;;    PATCHED_FORK — Custom Mesa for AMD gaming. Same as #59.
;;;
;;; 65. qt6-base-hifps (#, rdeps=1)
;;;    PATCHED_FORK — Qt6 with high-FPS patches. Requires patching Qt6
;;;    base which has complex build. Not upstreamable.
;;;
;;; 66. qemu-headless-git (#, rdeps=1)
;;;    COMPLEX_BUILD — QEMU without GUI from git. Guix already has QEMU.
;;;    Building from git requires full development toolchain.
;;;
;;; ════════════════════════════════════════════════════════════════════════
;;; NOT_IN_AUR — Packages not found in the AUR metadata cache.
;;;
;;; 10. gst-thumbnailers (#6543, rdeps=1)
;;;    NOT_IN_AUR — GStreamer thumbnailers. Not found in AUR cache. May be
;;;    removed or renamed.
;;;
;;; 67. anbox-git (#, rdeps=0)
;;;    NOT_IN_AUR — Anbox (Android-in-a-box). Project discontinued,
;;;    succeeded by Waydroid.
;;;
;;; 73. audiobookshelf (#, rdeps=0)
;;;    NOT_IN_AUR — Audiobook server. Not in AUR cache.
;;;
;;; 74. betterbird-fr-bin (#, rdeps=0)
;;;    NOT_IN_AUR — Betterbird French binary. Not in AUR cache.
;;;
;;; 75. bigpemu-bin (#, rdeps=0)
;;;    NOT_IN_AUR — BigPEmu Jaguar emulator. Not in AUR cache.
;;;    Likely proprietary.
;;;
;;; 79. bulky (#, rdeps=0)
;;;    NOT_IN_AUR — Linux Mint bulk renamer. Not in AUR cache.
;;;
;;; 86. carbonyl-bin (#, rdeps=0)
;;;    NOT_IN_AUR — Chromium-based terminal browser. Not in AUR cache.
;;;
;;; ════════════════════════════════════════════════════════════════════════
;;; OTHER BLOCKERS
;;;
;;; 8. fonts-droid-fallback (#10729, rdeps=1) → RESOLVED
;;; 9. fonts-noto-hinted (#10730, rdeps=1) → RESOLVED
;;; 11. aspnet-runtime-preview-bin (#10129, rdeps=1)
;;;    BLOCKED_DEPENDENCY — Depends on dotnet-runtime-preview-bin which
;;;    is also not packaged. .NET runtime preview with unstable API.
;;;
;;; 68. ancestris (#, rdeps=0)
;;;    COMPLEX_BUILD — Java genealogy app. NetBeans Platform build system.
;;;    Requires NetBeans SDK (not in Guix). SVN source only.
;;;
;;; 77. blindpaste (#, rdeps=0)
;;;    SOURCE_UNAVAILABLE — Self-hosted git server returns 403. Upstream
;;;    website also inaccessible. Cannot inspect or build source.
;;;
;;; 78. boomer-git (#, rdeps=0)
;;;    MISSING_BUILD_TOOLS — Nim screen zoomer. Guix has no Nim compiler.
;;;    No tagged releases or binary downloads.
;;;
;;; 80. butter-launcher-bin (#, rdeps=0)
;;;    NO_LICENSE — Electron game launcher. No license file in repo.
;;;    Cannot determine distribution terms.
;;;
;;; 82. cagent-bin (#, rdeps=0)
;;;    UPSTREAM_CHANGED — docker/cagent repo redirected to docker/
;;;    docker-agent (different tool). Original monitoring agent may be
;;;    discontinued.
;;;
;;; 98. chkrootkit (#, rdeps=0)
;;;    FTP_ONLY_SOURCE — Rootkit checker. Source available only via FTP
;;;    with unversioned URL (ftp://ftp.chkrootkit.org/pub/seg/pac/
;;;    chkrootkit.tar.gz). Not reproducible. No HTTPS mirror found.
;;;    3 approaches tried: (1) FTP download — Guix url-fetch does not
;;;    support FTP reliably, (2) GitHub mirror search — no official
;;;    mirror, (3) Debian source package — would need to track Debian
;;;    version separately.
