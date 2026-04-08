;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency-tree resolver pass — deptree-resolver-260407h — blocked notes
;;; Documents why 82 of 100 selected packages remain BLOCKED.
;;; Generated: 2026-04-07T00:00:00+00:00

(define-module (gaurix packages deptree-resolver-260407h-blocked-notes))

;;; ════════════════════════════════════════════════════════════════════════
;;; BLOCKED PACKAGE NOTES (82 packages)
;;; ════════════════════════════════════════════════════════════════════════
;;;
;;; ── ARCH_SPECIFIC ──────────────────────────────────────────────────────
;;; Packages that require Arch Linux infrastructure (pacman, libalpm, AUR).
;;;
;;; 1. yay (rdeps=5)
;;;    ARCH_SPECIFIC — AUR helper wrapping pacman + git. Requires libalpm,
;;;    pacman, and the AUR ecosystem. Fundamental incompatibility with Guix.
;;;
;;; 2. archlinux-java-run (rdeps=4)
;;;    ARCH_SPECIFIC — Arch Java runtime selector. Hardcoded /usr/lib/jvm
;;;    paths. Guix handles Java via profiles natively.
;;;
;;; 4. paru (rdeps=2)
;;;    ARCH_SPECIFIC — AUR helper (Rust). Requires libalpm/pacman.
;;;
;;; 13. yaycache (rdeps=1)
;;;    ARCH_SPECIFIC — yay cache manager. Depends on yay (blocked).
;;;
;;; 15. package-query (rdeps=1)
;;;    ARCH_SPECIFIC — libalpm query tool. Requires Arch package DB.
;;;
;;; 16. paru-git (rdeps=1)
;;;    ARCH_SPECIFIC — paru development version. Same as paru.
;;;
;;; 21. aurutils (rdeps=1)
;;;    ARCH_SPECIFIC — AUR build automation. Requires pacman+makepkg.
;;;
;;; 40. libpamac-full (rdeps=0)
;;;    ARCH_SPECIFIC — Manjaro Pamac lib. Depends on libalpm, pacman>=7.1.
;;;
;;; 51. libpamac-aur (rdeps=0)
;;;    ARCH_SPECIFIC — Pamac AUR lib. Depends on libalpm, pacman>=7.1.
;;;
;;; 66. arch-remaster (rdeps=0)
;;;    ARCH_SPECIFIC — Arch ISO remastering. Requires pacman infra.
;;;
;;; 67. arch-updater (rdeps=0)
;;;    ARCH_SPECIFIC — Arch update utility. Depends on pacman/yay/expac.
;;;
;;; 68. archarchive (rdeps=0)
;;;    ARCH_SPECIFIC — Arch rollback using ALA. Requires pacman.
;;;
;;; 80. check-broken-packages-pacman-hook-git (rdeps=0)
;;;    ARCH_SPECIFIC — Pacman hook. Requires pacman hook infrastructure.
;;;
;;; ── PROPRIETARY_LICENSE ────────────────────────────────────────────────
;;; Packages with non-FOSS licenses that cannot be redistributed.
;;;
;;; 3. matlab (rdeps=3)
;;;    PROPRIETARY_LICENSE — MathWorks MATLAB. Custom EULA, requires
;;;    MathWorks account. Not redistributable.
;;;
;;; 12. samsung-unified-driver-printer (rdeps=1)
;;;    PROPRIETARY_LICENSE — Samsung printer driver. Custom Samsung license.
;;;
;;; 17. samsung-unified-driver-scanner (rdeps=1)
;;;    PROPRIETARY_LICENSE — Samsung scanner driver. Custom Samsung license.
;;;
;;; 32. android-sdk (rdeps=0)
;;;    PROPRIETARY_LICENSE — Google Android SDK. Custom proprietary license.
;;;
;;; 48. tensorrt (rdeps=0)
;;;    PROPRIETARY_LICENSE — NVIDIA TensorRT. Proprietary CUDA stack.
;;;    Apache + custom TensorRT License Agreement.
;;;
;;; 55. wechat-bin (rdeps=0)
;;;    PROPRIETARY_LICENSE — WeChat. Proprietary Tencent license.
;;;
;;; 72. bigpemu-bin (rdeps=0)
;;;    PROPRIETARY_LICENSE — Jaguar emulator. Custom proprietary license.
;;;
;;; 94. codeql (rdeps=0)
;;;    PROPRIETARY_LICENSE — GitHub CodeQL. Custom proprietary license.
;;;
;;; 95. coder-bin (rdeps=0)
;;;    PROPRIETARY_LICENSE — Coder platform. Proprietary license.
;;;
;;; ── PROPRIETARY_DRIVER ─────────────────────────────────────────────────
;;;
;;; 20. opencl-amd (rdeps=1)
;;;    PROPRIETARY_DRIVER — AMD ROCm OpenCL. Repackaged proprietary AMD
;;;    binaries from AMDGPU-PRO driver stack.
;;;
;;; 27. lib32-nvidia-utils-beta (rdeps=0)
;;;    PROPRIETARY_DRIVER — NVIDIA 32-bit beta. Proprietary + LIB32_COMPAT.
;;;
;;; ── LIB32_COMPAT ───────────────────────────────────────────────────────
;;; 32-bit compatibility libraries. Guix does not support multilib.
;;;
;;; 19. lib32-libvmaf (rdeps=1)
;;;    LIB32_COMPAT — Netflix VMAF 32-bit library. No multilib in Guix.
;;;
;;; 30. lib32-bluez-libs (rdeps=0)
;;;    LIB32_COMPAT — BlueZ 32-bit libs. No multilib in Guix.
;;;
;;; ── NOT_IN_AUR ─────────────────────────────────────────────────────────
;;;
;;; 7. gst-thumbnailers (rdeps=1)
;;;    NOT_IN_AUR — Not found in AUR cache. Package may have been removed.
;;;
;;; 76. bulky (rdeps=0)
;;;    NOT_IN_AUR — Not found in AUR cache. Package may have been removed.
;;;
;;; 8. aspnet-runtime-preview-bin (rdeps=1)
;;;    NOT_IN_AUR — AUR repo exists but PKGBUILD is empty/deleted.
;;;
;;; 54. input-leap-headless-git (rdeps=0)
;;;    NOT_IN_AUR — AUR repo exists but PKGBUILD is empty/deleted.
;;;
;;; ── KERNEL_SPECIFIC ────────────────────────────────────────────────────
;;; Custom kernel builds. Guix manages kernels via its own infrastructure.
;;;
;;; 42. linux-cachyos-lts (rdeps=0)
;;;    KERNEL_SPECIFIC — CachyOS LTS kernel with BORE scheduler + patches.
;;;
;;; 45. linux-cachyos (rdeps=0)
;;;    KERNEL_SPECIFIC — CachyOS kernel with EEVDF + LTO + AutoFDO.
;;;
;;; 46. linux-cachyos-rc (rdeps=0)
;;;    KERNEL_SPECIFIC — CachyOS RC kernel with BORE + LTO + AutoFDO.
;;;
;;; ── MISSING_BUILD_TOOLS ────────────────────────────────────────────────
;;; Require build tools/SDKs not available in Guix.
;;;
;;; 11. ggml-sycl-f16-git (rdeps=1)
;;;    MISSING_BUILD_TOOLS — GGML tensor lib with Intel SYCL GPU
;;;    optimizations. Requires Intel OneAPI/SYCL SDK (proprietary).
;;;
;;; 34. llama.cpp-hip (rdeps=0)
;;;    MISSING_BUILD_TOOLS — llama.cpp with AMD ROCm/HIP. Requires HIP SDK.
;;;
;;; 74. boomer-git (rdeps=0)
;;;    MISSING_BUILD_TOOLS — Screen zoomer. Written in Nim. No Nim compiler
;;;    or nimble build system in Guix. No tagged releases or binary downloads.
;;;
;;; ── BUILD_SYSTEM_TOO_COMPLEX ───────────────────────────────────────────
;;; Build systems too complex to port within a single resolver pass.
;;;
;;; 24. ps3toolchain (rdeps=0)
;;;    BUILD_SYSTEM_TOO_COMPLEX — PS3 homebrew cross-compilation meta
;;;    package. Requires 6+ PS3-specific cross-compiler dependencies.
;;;
;;; 28. python-frida (rdeps=0)
;;;    BUILD_SYSTEM_TOO_COMPLEX — Frida Python bindings. Requires
;;;    proprietary frida-core native binary + npm build pipeline.
;;;
;;; 31. mips64-linux-gnu-gcc-bootstrap (rdeps=0)
;;;    BUILD_SYSTEM_TOO_COMPLEX — MIPS64 cross-compiler bootstrap.
;;;    Guix handles cross-compilation via its own (cross-base) module.
;;;
;;; 41. snapx (rdeps=0)
;;;    BUILD_SYSTEM_TOO_COMPLEX — C#/.NET screenshot tool (ShareX fork).
;;;    No dotnet-sdk build system in Guix.
;;;
;;; 53. dragengine (rdeps=0)
;;;    BUILD_SYSTEM_TOO_COMPLEX — Drag[en]gine game engine. Massive custom
;;;    build system with 34+ dependencies.
;;;
;;; 57. amdonly-gaming-vulkan-mesa-layers-git (rdeps=0)
;;;    BUILD_SYSTEM_TOO_COMPLEX — Custom Mesa build with AMD gaming patches.
;;;
;;; 59. amdonly-gaming-opencl-rusticl-mesa-git (rdeps=0)
;;;    BUILD_SYSTEM_TOO_COMPLEX — Custom Mesa Rusticl OpenCL build.
;;;
;;; 60. libnm-iwd (rdeps=0)
;;;    BUILD_SYSTEM_TOO_COMPLEX — NetworkManager rebuild with iwd backend.
;;;    42 deps. Would require rebuilding entire NM stack.
;;;
;;; 61. amdonly-gaming-vulkan-radeon-git (rdeps=0)
;;;    BUILD_SYSTEM_TOO_COMPLEX — Custom Mesa Vulkan radeon driver build.
;;;
;;; 62. amdonly-gaming-mesa-git (rdeps=0)
;;;    BUILD_SYSTEM_TOO_COMPLEX — Custom Mesa OpenGL implementation. 47 deps.
;;;
;;; 63. qt6-base-hifps (rdeps=0)
;;;    BUILD_SYSTEM_TOO_COMPLEX — Patched Qt6 for high FPS. Would require
;;;    full Qt6 rebuild. 62 deps.
;;;
;;; 87. chromium-gost (rdeps=0)
;;;    BUILD_SYSTEM_TOO_COMPLEX — Full Chromium build with Russian GOST
;;;    cryptographic patches. Building Chromium from source is infeasible.
;;;
;;; ── MASSIVE_DEP_TREE ───────────────────────────────────────────────────
;;; Would require packaging enormous dependency trees.
;;;
;;; 6. plasma-workspace-povd (rdeps=2)
;;;    MASSIVE_DEP_TREE — Patched KDE Plasma workspace. 105 deps including
;;;    custom-patched KDE stack. Not feasible without full KDE porting.
;;;
;;; 26. intel-graphics-compiler-legacy (rdeps=0)
;;;    MASSIVE_DEP_TREE — Intel GPU compiler. Massive LLVM-based build with
;;;    custom patches. Requires custom LLVM fork.
;;;
;;; 33. element-web-git (rdeps=0)
;;;    MASSIVE_DEP_TREE — Element Matrix client. npm/yarn + Electron build
;;;    with hundreds of JS dependencies. Not feasible in Guix.
;;;
;;; 44. libastal-meta (rdeps=0)
;;;    MASSIVE_DEP_TREE — Meta package depending on 17 libastal-* service
;;;    packages, most not in Guix.
;;;
;;; 52. alice-vision (rdeps=0)
;;;    MASSIVE_DEP_TREE — Photogrammetry framework. 31 deps, many
;;;    unpackaged (geogram, popsift, USD, openMVG).
;;;
;;; 64. qemu-headless-git (rdeps=0)
;;;    MASSIVE_DEP_TREE — QEMU headless git build. 116 deps.
;;;
;;; ── MISSING_GUIX_DEPS ─────────────────────────────────────────────────
;;; Blocked on dependencies not yet packaged in Guix.
;;;
;;; 5. intel-npu-driver (rdeps=2)
;;;    MISSING_GUIX_DEPS — Intel NPU driver. Requires level-zero-loader
;;;    and level-zero-headers not in Guix.
;;;
;;; 10. sdrpp-headers-git (rdeps=1)
;;;    MISSING_GUIX_DEPS — SDR++ headers. Depends on sdrpp-git (not packaged).
;;;
;;; 14. iscan (rdeps=1)
;;;    MISSING_GUIX_DEPS — EPSON scanner. Requires deprecated libstdc++5
;;;    + proprietary EPSON plugins.
;;;
;;; 18. kdesignerplugin (rdeps=1)
;;;    MISSING_GUIX_DEPS — KDE Framework 5 porting aid. Requires kconfig5,
;;;    kcoreaddons5, extra-cmake-modules, qt5-tools, kdoctools5.
;;;    KF5 porting aids not in Guix channel.
;;;
;;; 23. kemoticons (rdeps=0)
;;;    MISSING_GUIX_DEPS — KDE emoticon framework. Requires karchive5,
;;;    kservice5, qt5 tools.  KF5 not in Guix channel.
;;;
;;; 25. cosmic-bg-git (rdeps=0)
;;;    MISSING_GUIX_DEPS — COSMIC background service. Rust/cargo build
;;;    requires libcosmic crate ecosystem not in Guix.
;;;
;;; 29. cosmic-files-git (rdeps=0)
;;;    MISSING_GUIX_DEPS — COSMIC file manager. Same libcosmic dep.
;;;
;;; 35. python-twisterl (rdeps=0)
;;;    MISSING_GUIX_DEPS — Blocked on python-pytorch (not in Guix).
;;;
;;; 36. cosmic-applets-git (rdeps=0)
;;;    MISSING_GUIX_DEPS — COSMIC panel applets. Same libcosmic dep.
;;;
;;; 37. cosmic-osd-git (rdeps=0)
;;;    MISSING_GUIX_DEPS — COSMIC OSD. Same libcosmic dep.
;;;
;;; 38. libastal-git (rdeps=0)
;;;    MISSING_GUIX_DEPS — Astal desktop shell lib. Blocked on libastal-io.
;;;
;;; 39. kde-material-you-colors (rdeps=0)
;;;    MISSING_GUIX_DEPS — KDE theming. Python scripts requiring
;;;    python-materialyoucolor, Plasma D-Bus interfaces, KDE stack.
;;;
;;; 43. python-rapidocr (rdeps=0)
;;;    MISSING_GUIX_DEPS — Blocked on python-opencv, python-onnxruntime.
;;;
;;; 47. python-insightface (rdeps=0)
;;;    MISSING_GUIX_DEPS — Blocked on albumentations, onnx, scikit-image.
;;;
;;; 49. cosmic-settings-git (rdeps=0)
;;;    MISSING_GUIX_DEPS — COSMIC settings app. Same libcosmic dep.
;;;
;;; 50. goldendict (rdeps=0)
;;;    MISSING_GUIX_DEPS — Dictionary app. Requires qt5-webkit (abandoned)
;;;    and qt5-multimedia, both complex to package.
;;;
;;; 56. hypryou (rdeps=0)
;;;    MISSING_GUIX_DEPS — Hyprland Material You theming. Requires
;;;    libastal-bluetooth-git, libastal-wireplumber-git,
;;;    python-materialyoucolor>=3.0, dart-sass, gtk4-layer-shell,
;;;    hyprland>=0.53, and 30+ other deps.
;;;
;;; 58. pipelex (rdeps=0)
;;;    MISSING_GUIX_DEPS — AI workflow tool. Python with 37 deps including
;;;    python-anthropic, python-instructor, python-fal-client, etc.
;;;
;;; 99. cosmic-greeter-git (rdeps=0)
;;;    MISSING_GUIX_DEPS — COSMIC greeter. Same libcosmic dep.
;;;
;;; ── PLATFORM_SPECIFIC ──────────────────────────────────────────────────
;;;
;;; 22. icu74 (rdeps=0)
;;;    BUILD_SYSTEM_TOO_COMPLEX — Legacy ICU v74. Guix already has icu4c
;;;    (current version). Packaging a legacy version alongside would require
;;;    careful library path management to avoid conflicts.
;;;
;;; 65. ancestris (rdeps=0)
;;;    BUILD_SYSTEM_TOO_COMPLEX — Java genealogy app. Source URL points to
;;;    daily build (Ancestris-daily.zip) with SKIP checksum. No stable
;;;    versioned release tarball available.
;;;
;;; 69. archlinux-artwork (rdeps=0)
;;;    ARCH_SPECIFIC — Arch logos/icons. Trademark restrictions (CCPL:cc-by-nc-sa).
;;;
;;; 75. brother-hl2030 (rdeps=0)
;;;    LIB32_COMPAT — Brother printer driver. Extracts i386 RPMs with
;;;    32-bit binaries requiring lib32-glibc.
;;;
;;; 77. butter-launcher-bin (rdeps=0)
;;;    MISSING_GUIX_DEPS — Electron launcher. Unknown license. Would need
;;;    Electron runtime infrastructure.
;;;
;;; 78. cagent-bin → RESOLVED in deptree-resolver-260407h.scm
;;;
;;; 79. carbonyl-bin → RESOLVED
;;;
;;; 81. chess-merida → RESOLVED as chess-merida-font
;;;
;;; 83. chkufsd-bin (rdeps=0)
;;;    PLATFORM_SPECIFIC — NTFS/HFS checker. Source from archive.org with
;;;    unclear provenance. Proprietary Paragon binary.
;;;
;;; 84. chough-bin (rdeps=0)
;;;    BUILD_SYSTEM_TOO_COMPLEX — ASR CLI. Bundles proprietary ONNX runtime
;;;    shared libraries. Source build requires onnxruntime + sherpa-onnx.
;;;
;;; 85. chromium-extension-adnauseam → RESOLVED
;;;
;;; 86. chromium-extension-web-store → RESOLVED
;;;
;;; 88. claude-agent-acp-bin → RESOLVED
;;;
;;; 91. cnrdrvcups-lb-bin (rdeps=0)
;;;    PROPRIETARY_COMPONENTS — Canon printer driver. Mixed custom/GPL/MIT
;;;    but includes proprietary Canon binary blobs.
;;;
;;; 97. compressonator-cli-bin → RESOLVED
;;;
;;; 100. cosmocc-bin → RESOLVED
