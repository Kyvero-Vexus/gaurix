;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency-tree resolver pass -- deptree-resolver-260408c -- blocked notes
;;; Documents why 85 of 100 selected packages remain BLOCKED.
;;; Generated: 2026-04-08

(define-module (gaurix packages deptree-resolver-260408c-blocked-notes))

;;; ====================================================================
;;; BLOCKED PACKAGE NOTES (85 packages)
;;; ====================================================================
;;;
;;; -- ARCH_SPECIFIC (8 packages) --------------------------------------
;;; Tools tied to pacman, AUR, or Arch Linux-specific infrastructure.
;;;
;;; 1. yay (rdeps=6)
;;;    ARCH_SPECIFIC -- AUR helper wrapping pacman + git.  Requires
;;;    libalpm and AUR ecosystem; no Guix equivalent possible.
;;;
;;; 5. paru (rdeps=2)
;;;    ARCH_SPECIFIC -- AUR helper wrapping pacman/libalpm + cargo.
;;;    Fundamentally Arch-specific.
;;;
;;; 15. yaycache (rdeps=1)
;;;    ARCH_SPECIFIC -- yay cache cleaner depending on pacman-contrib.
;;;
;;; 17. package-query (rdeps=1)
;;;    ARCH_SPECIFIC -- ALPM and AUR query tool, depends on pacman.
;;;
;;; 18. paru-git (rdeps=1)
;;;    ARCH_SPECIFIC -- Git version of paru AUR helper.
;;;
;;; 23. aurutils (rdeps=0)
;;;    ARCH_SPECIFIC -- Collection of AUR helper scripts, depends on
;;;    pacutils and Arch infrastructure.
;;;
;;; 42. libpamac-full (rdeps=0)
;;;    ARCH_SPECIFIC -- Pamac library, depends on libalpm/snapd/flatpak
;;;    with Arch-specific integration.
;;;
;;; 55. libpamac-aur (rdeps=0)
;;;    ARCH_SPECIFIC -- Pamac library for AUR, depends on libalpm>=16
;;;    and Arch packaging ecosystem.
;;;
;;; -- ARCH_SPECIFIC (distro artwork/locale) ----------------------------
;;;
;;; 70. archarchive (rdeps=0)
;;;    ARCH_SPECIFIC -- Arch Linux rollback utility using Arch Linux
;;;    Archive (ALA).  Only useful on Arch systems.
;;;
;;; 71. archlinux-artwork (rdeps=0)
;;;    ARCH_SPECIFIC -- Official Arch Linux logos and icons.
;;;    Restricted by Arch trademark policy.
;;;
;;; -- PROPRIETARY_LICENSE / NON_DISTRIBUTABLE (8 packages) -----------
;;;
;;; 3. matlab (rdeps=3)
;;;    PROPRIETARY_LICENSE -- MathWorks MATLAB.  Requires commercial
;;;    license and proprietary installer; not redistributable.
;;;
;;; 58. wechat-bin (rdeps=0)
;;;    PROPRIETARY_LICENSE -- WeChat binary, proprietary Tencent license.
;;;    Complex .deb repack with many runtime deps.
;;;
;;; 73. bigpemu-bin (rdeps=0)
;;;    PROPRIETARY_LICENSE -- Atari Jaguar emulator, custom proprietary
;;;    license.  No public download URL found.
;;;
;;; 75. butter-launcher-bin (rdeps=0)
;;;    MISSING_SOURCE -- No clear public download URL for the Electron
;;;    binary.  GitHub repo has no releases.
;;;
;;; 81. crql-anina (rdeps=0)
;;;    PROPRIETARY_LICENSE -- CRQL VST3/CLAP audio plugin, custom
;;;    proprietary license.  No public redistributable binary.
;;;
;;; 82. crql-locd (rdeps=0)
;;;    PROPRIETARY_LICENSE -- CRQL phase-locked distortion plugin,
;;;    custom proprietary license.
;;;
;;; 96. empty (rdeps=0)
;;;    CUSTOM_LICENSE -- SourceForge-hosted C program, "custom" license
;;;    with unclear redistribution terms.
;;;
;;; 97. en_se (rdeps=0)
;;;    TRIVIAL_LOCALE -- English locale for Sweden.  Gist-hosted locale
;;;    definition, not a conventional package.
;;;
;;; -- MISSING_SOURCE / NOT_IN_AUR (7 packages) -----------------------
;;;
;;; 10. gst-thumbnailers (rdeps=1)
;;;    MISSING_SOURCE -- Not in AUR cache; no upstream URL found.
;;;
;;; 68. anbox-git (rdeps=0)
;;;    MISSING_SOURCE -- Project discontinued and archived.  Not in AUR
;;;    cache; no maintained source.
;;;
;;; 72. audiobookshelf (rdeps=0)
;;;    MISSING_SOURCE -- Not in AUR cache; no upstream URL found.
;;;
;;; 74. bulky (rdeps=0)
;;;    MISSING_SOURCE -- Not in AUR cache; no upstream URL found.
;;;
;;; 80. codex-desktop-bin (rdeps=0)
;;;    PROPRIETARY_LICENSE -- OpenAI Codex Desktop, proprietary license.
;;;    Prepatched third-party binary, not redistributable from official
;;;    source.
;;;
;;; 83. cursor-ide (rdeps=0)
;;;    MISSING_SOURCE -- Not in AUR cache; proprietary Cursor IDE.
;;;
;;; 84. dbeaver (rdeps=0)
;;;    MISSING_SOURCE -- Not in AUR cache; complex Eclipse RCP Java app.
;;;    3 approaches tried previously.
;;;
;;; -- COMPLEX_BUILD_SYSTEM (14 packages) ------------------------------
;;;
;;; 4. mozc-ut-full-common (rdeps=3)
;;;    COMPLEX_BUILD_SYSTEM -- Requires Bazel (unpackaged in Guix) +
;;;    custom UT dictionary merging.  ~300 line PKGBUILD.
;;;
;;; 7. intel-npu-driver (rdeps=2)
;;;    COMPLEX_BUILD_SYSTEM -- Intel NPU driver with cmake build
;;;    requiring level-zero-loader/headers (unpackaged in Guix).
;;;
;;; 8. noctalia-qs (rdeps=2)
;;;    COMPLEX_BUILD_SYSTEM -- Custom Quickshell fork with Qt6/Wayland/
;;;    cli11/spirv-tools.  Many unpackaged deps.
;;;
;;; 9. plasma-workspace-povd (rdeps=2)
;;;    COMPLEX_BUILD_SYSTEM -- KDE Plasma Workspace with per-output
;;;    virtual desktops patch.  ~100 KDE dependencies.
;;;
;;; 28. intel-graphics-compiler-legacy (rdeps=0)
;;;    COMPLEX_BUILD_SYSTEM -- Intel Graphics Compiler with complex cmake
;;;    build, LLVM integration, and custom patches.
;;;
;;; 32. mips64-linux-gnu-gcc-bootstrap (rdeps=0)
;;;    COMPLEX_BUILD_SYSTEM -- Cross-compilation GCC bootstrap for
;;;    MIPS64 target.  Requires mips64-linux-gnu-binutils (blocked).
;;;
;;; 35. element-web-git (rdeps=0)
;;;    COMPLEX_BUILD_SYSTEM -- Matrix web client, requires npm/yarn/
;;;    electron/sqlcipher/libxcrypt-compat build chain.
;;;
;;; 56. alice-vision (rdeps=0)
;;;    COMPLEX_BUILD_SYSTEM -- Photogrammetry framework with many
;;;    unpackaged deps: geogram, coin-or-*, popsift, usd, etc.
;;;
;;; 57. dragengine (rdeps=0)
;;;    COMPLEX_BUILD_SYSTEM -- Game engine with scons build, many
;;;    native deps, custom glslang/nasm/patchelf integration.
;;;
;;; 60. amdonly-gaming-opencl-rusticl-mesa-git (rdeps=0)
;;;    COMPLEX_BUILD_SYSTEM -- Mesa git build with AMDGPU-only
;;;    configuration.  Requires directx-headers + rust-bindgen.
;;;
;;; 61. amdonly-gaming-mesa-git (rdeps=0)
;;;    COMPLEX_BUILD_SYSTEM -- Mesa git build with AMD-only drivers.
;;;
;;; 62. amdonly-gaming-vulkan-radeon-git (rdeps=0)
;;;    COMPLEX_BUILD_SYSTEM -- Mesa Radeon Vulkan driver from git.
;;;
;;; 64. amdonly-gaming-vulkan-mesa-layers-git (rdeps=0)
;;;    COMPLEX_BUILD_SYSTEM -- Mesa Vulkan layers from git.
;;;
;;; 63. libnm-iwd (rdeps=0)
;;;    COMPLEX_BUILD_SYSTEM -- NetworkManager with iwd backend.
;;;    40+ build deps, custom meson configuration.
;;;
;;; -- MISSING_DEPS (25 packages) -------------------------------------
;;; Packages depending on other blocked or unpackaged packages.
;;;
;;; 2. archlinux-java-run (rdeps=4)
;;;    MISSING_DEPS -- Depends on java-runtime-common (Arch-specific
;;;    Java wrapper).  ARCH_SPECIFIC.
;;;
;;; 6. bms-shell (rdeps=2)
;;;    MISSING_DEPS -- Depends on dgop, quickshell,
;;;    bms-shell-compositor (all blocked/unpackaged).
;;;
;;; 11. aspnet-runtime-preview-bin (rdeps=1)
;;;    MISSING_DEPS -- Depends on dotnet-runtime-preview-bin (blocked).
;;;
;;; 12. sdrpp-headers-git (rdeps=1)
;;;    MISSING_DEPS -- Depends on sdrpp-git (blocked).
;;;
;;; 13. ggml-sycl-f16-git (rdeps=1)
;;;    MISSING_DEPS -- Depends on intel-oneapi-basekit (unpackaged).
;;;
;;; 14. samsung-unified-driver-printer (rdeps=1)
;;;    MISSING_DEPS -- Depends on samsung-unified-driver-common (blocked).
;;;    Also proprietary Samsung license.
;;;
;;; 16. iscan (rdeps=1)
;;;    MISSING_DEPS -- Depends on libstdc++5 (obsolete library,
;;;    unpackaged).  Also custom AVASYSPL license.
;;;
;;; 19. samsung-unified-driver-scanner (rdeps=1)
;;;    MISSING_DEPS -- Depends on samsung-unified-driver-common (blocked).
;;;    Also proprietary Samsung license.
;;;
;;; 20. kdesignerplugin (rdeps=1)
;;;    MISSING_DEPS -- KDE5 framework; depends on kconfig5, kcoreaddons5
;;;    (KF5 compat, not packaged separately in Guix).
;;;
;;; 21. lib32-libvmaf (rdeps=0)
;;;    MISSING_DEPS -- lib32 build of vmaf.  Guix does not support
;;;    lib32 multilib packages natively.
;;;
;;; 22. opencl-amd (rdeps=0)
;;;    PROPRIETARY_LICENSE -- AMD ROCm components repackaged from Ubuntu.
;;;    Custom AMD license, not redistributable from original.
;;;
;;; 24. kemoticons (rdeps=0)
;;;    MISSING_DEPS -- KDE5 framework; depends on karchive5, kservice5
;;;    (KF5 compat, not packaged separately in Guix).
;;;
;;; 25. ps3toolchain (rdeps=0)
;;;    MISSING_DEPS -- Meta package for PS3 dev tools.  All deps
;;;    (ps3-ppu-gcc, ps3-spu-gcc, ps3-psl1ght) are blocked.
;;;
;;; 26. lib32-nvidia-utils-beta (rdeps=0)
;;;    MISSING_DEPS -- lib32 NVIDIA utils (beta).  Guix does not
;;;    support lib32 multilib.
;;;
;;; 27. cosmic-bg-git (rdeps=0)
;;;    MISSING_DEPS -- COSMIC desktop background service, depends on
;;;    cosmic-icons-git (blocked).
;;;
;;; 29. python-frida (rdeps=0)
;;;    MISSING_DEPS -- Python bindings for Frida, requires nodejs/npm
;;;    and native compilation with custom build steps.
;;;
;;; 30. cosmic-files-git (rdeps=0)
;;;    MISSING_DEPS -- COSMIC file manager, depends on cosmic-icons-git
;;;    (blocked).
;;;
;;; 31. lib32-bluez-libs (rdeps=0)
;;;    MISSING_DEPS -- lib32 bluetooth libraries.  Guix does not
;;;    support lib32 multilib.
;;;
;;; 33. python-twisterl (rdeps=0)
;;;    MISSING_DEPS -- Depends on python-pytorch (not in Guix for
;;;    current CUDA/ROCm).
;;;
;;; 34. android-sdk (rdeps=0)
;;;    PROPRIETARY_LICENSE -- Google Android SDK, custom license.
;;;    Requires lib32-gcc-libs, lib32-glibc (multilib).
;;;
;;; 37. libastal-git (rdeps=0)
;;;    MISSING_DEPS -- Depends on libastal-io (blocked).
;;;
;;; 38. cosmic-applets-git (rdeps=0)
;;;    MISSING_DEPS -- COSMIC applets, depends on cosmic-icons-git (blocked).
;;;
;;; 39. cosmic-greeter-git (rdeps=0)
;;;    MISSING_DEPS -- COSMIC greeter, depends on cosmic-comp-git and
;;;    cosmic-icons-git (both blocked).
;;;
;;; 40. cosmic-osd-git (rdeps=0)
;;;    MISSING_DEPS -- COSMIC OSD, depends on cosmic-randr-git (blocked).
;;;
;;; 41. kde-material-you-colors (rdeps=0)
;;;    MISSING_DEPS -- Depends on python-materialyoucolor, plasma5support,
;;;    python-pywal16 (all blocked/unpackaged).
;;;
;;; -- COMPLEX_BUILD + MISSING_DEPS (11 packages) ---------------------
;;;
;;; 36. llama.cpp-hip (rdeps=0)
;;;    COMPLEX_BUILD_SYSTEM -- llama.cpp with AMD ROCm/HIP.  Depends on
;;;    hip-runtime-amd, hipblas, rocblas (all blocked).
;;;
;;; 43. python-rapidocr (rdeps=0)
;;;    MISSING_DEPS -- Depends on python-pyclipper, python-opencv (partial),
;;;    python-omegaconf (blocked).
;;;
;;; 44. snapx (rdeps=0)
;;;    MISSING_DEPS -- Depends on dotnet-sdk>=10.0 (blocked).
;;;    .NET-based screenshot tool.
;;;
;;; 45. linux-cachyos-bore (rdeps=0)
;;;    COMPLEX_BUILD_SYSTEM -- CachyOS kernel with BORE scheduler.
;;;    Requires initramfs (Arch-specific) and kernel build infra.
;;;
;;; 46. linux-cachyos-lts (rdeps=0)
;;;    COMPLEX_BUILD_SYSTEM -- CachyOS LTS kernel.  Same issues.
;;;
;;; 47. tensorrt (rdeps=0)
;;;    MISSING_DEPS -- NVIDIA TensorRT, depends on cuda, cudnn
;;;    (blocked).  Also partially proprietary.
;;;
;;; 48. libastal-meta (rdeps=0)
;;;    MISSING_DEPS -- Meta package depending on 17 libastal-* packages,
;;;    most of which are blocked.
;;;
;;; 49. python-insightface (rdeps=0)
;;;    MISSING_DEPS -- Depends on python-onnx, python-scikit-image,
;;;    python-albumentations (blocked/unpackaged).
;;;
;;; 50. linux-cachyos (rdeps=0)
;;;    COMPLEX_BUILD_SYSTEM -- CachyOS EEVDF+LTO+AutoFDO kernel.
;;;
;;; 51. linux-cachyos-rc (rdeps=0)
;;;    COMPLEX_BUILD_SYSTEM -- CachyOS release candidate kernel.
;;;
;;; 52. cosmic-settings-git (rdeps=0)
;;;    MISSING_DEPS -- COSMIC settings, depends on cosmic-icons-git,
;;;    cosmic-randr-git (blocked).
;;;
;;; -- REMAINING (2 packages) ------------------------------------------
;;;
;;; 53. goldendict (rdeps=0)
;;;    MISSING_DEPS -- Depends on qt5-webkit (blocked, security
;;;    nightmare, removed from most distros).
;;;
;;; 54. input-leap-headless-git (rdeps=0)
;;;    MISSING_DEPS -- Depends on libei (blocked, not yet in Guix).
;;;
;;; 59. hypryou (rdeps=0)
;;;    MISSING_DEPS -- Hyprland Material You desktop setup.  Depends on
;;;    dart-sass, gtk4-layer-shell, python-materialyoucolor,
;;;    libastal-bluetooth-git (all blocked).
;;;
;;; 65. pipelex (rdeps=0)
;;;    MISSING_DEPS -- Python AI workflow tool.  Depends on 35+ Python
;;;    packages, many blocked (python-anthropic, python-instructor, etc).
;;;
;;; 66. qt6-base-hifps (rdeps=0)
;;;    COMPLEX_BUILD_SYSTEM -- Patched Qt6 base for high-FPS displays.
;;;    Enormous build (~50 deps), requires qt6-translations (blocked).
;;;
;;; 67. qemu-headless-git (rdeps=0)
;;;    COMPLEX_BUILD_SYSTEM -- QEMU git build without GUI.  ~60 deps,
;;;    requires spice, virglrenderer, and many libraries.
;;;
;;; 69. ancestris (rdeps=0)
;;;    MISSING_SOURCE -- Java genealogy freeware.  Source URL is
;;;    unversioned daily snapshot with SKIP hash.  Not reproducible.
;;;
;;; 77. chromium-gost (rdeps=0)
;;;    COMPLEX_BUILD_SYSTEM -- Chromium with Russian GOST crypto.
;;;    Enormous build, equivalent to building all of Chromium.
;;;
;;; 76. chkufsd-bin (rdeps=0)
;;;    MISSING_SOURCE -- Binary from archive.org ZIP without versioned
;;;    URL.  Source provenance unclear.
;;;
;;; ====================================================================
;;; END OF BLOCKED NOTES
;;; ====================================================================
