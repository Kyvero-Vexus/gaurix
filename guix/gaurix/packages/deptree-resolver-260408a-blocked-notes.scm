;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency-tree resolver pass — deptree-resolver-260408a — blocked notes
;;; Documents why 93 of 100 selected packages remain BLOCKED.
;;; Generated: 2026-04-08

(define-module (gaurix packages deptree-resolver-260408a-blocked-notes))

;;; ════════════════════════════════════════════════════════════════════════
;;; BLOCKED PACKAGE NOTES (93 packages)
;;; ════════════════════════════════════════════════════════════════════════
;;;
;;; ── NON_DISTRIBUTABLE ─────────────────────────────────────────────────
;;; Microsoft/Apple fonts requiring OS license. Not redistributable.
;;;
;;; 8. ttf-ms-win10-auto (rdeps=31)
;;;    NON_DISTRIBUTABLE — Microsoft Windows 10 TrueType fonts.
;;;    Requires a Windows ISO to extract. Microsoft EULA prohibits redistribution.
;;;
;;; 9. ttf-ms-win10-japanese (rdeps=30)
;;;    NON_DISTRIBUTABLE — Microsoft Windows 10 Japanese fonts.
;;;
;;; 10. ttf-ms-win10-korean (rdeps=30)
;;;    NON_DISTRIBUTABLE — Microsoft Windows 10 Korean fonts.
;;;
;;; 11. ttf-ms-win10-other (rdeps=30)
;;;    NON_DISTRIBUTABLE — Microsoft Windows 10 Other fonts.
;;;
;;; 12. ttf-ms-win10-sea (rdeps=30)
;;;    NON_DISTRIBUTABLE — Microsoft Windows 10 Southeast Asian fonts.
;;;
;;; 13. ttf-ms-win10-thai (rdeps=30)
;;;    NON_DISTRIBUTABLE — Microsoft Windows 10 Thai fonts.
;;;
;;; 14. ttf-ms-win10-zh_cn (rdeps=30)
;;;    NON_DISTRIBUTABLE — Microsoft Windows 10 Simplified Chinese fonts.
;;;
;;; 15. ttf-ms-win10-zh_tw (rdeps=30)
;;;    NON_DISTRIBUTABLE — Microsoft Windows 10 Traditional Chinese fonts.
;;;
;;; 16. ttf-ms-win11-japanese (rdeps=30)
;;;    NON_DISTRIBUTABLE — Microsoft Windows 11 Japanese fonts.
;;;
;;; 17. ttf-ms-win11-korean (rdeps=30)
;;;    NON_DISTRIBUTABLE — Microsoft Windows 11 Korean fonts.
;;;
;;; 18. ttf-ms-win11-other (rdeps=30)
;;;    NON_DISTRIBUTABLE — Microsoft Windows 11 Other fonts.
;;;
;;; 19. ttf-ms-win11-sea (rdeps=30)
;;;    NON_DISTRIBUTABLE — Microsoft Windows 11 Southeast Asian fonts.
;;;
;;; 20. ttf-ms-win11-thai (rdeps=30)
;;;    NON_DISTRIBUTABLE — Microsoft Windows 11 Thai fonts.
;;;
;;; 21. ttf-ms-win11-zh_cn (rdeps=30)
;;;    NON_DISTRIBUTABLE — Microsoft Windows 11 Simplified Chinese fonts.
;;;
;;; 22. ttf-ms-win11-zh_tw (rdeps=30)
;;;    NON_DISTRIBUTABLE — Microsoft Windows 11 Traditional Chinese fonts.
;;;
;;; 23. apple-fonts (rdeps=30)
;;;    NON_DISTRIBUTABLE — Apple San Francisco/New York fonts.
;;;    Apple proprietary license. Not redistributable.
;;;
;;; ── PROPRIETARY_LICENSE ────────────────────────────────────────────────
;;; Packages with non-FOSS licenses that cannot be redistributed.
;;;
;;; 3. jdk8-graalvm-ee-bin (rdeps=159)
;;;    PROPRIETARY_LICENSE — GraalVM Enterprise Edition JDK 8. OTN license.
;;;    Oracle Technology Network License Agreement. Not redistributable.
;;;
;;; 4. jdk17-zulu-prime-bin (rdeps=159)
;;;    PROPRIETARY_LICENSE — Azul Platform Prime JDK 17. Custom Azul
;;;    Platform Prime Stream License Agreement. Requires Azul subscription.
;;;
;;; 5. jdk17-graalvm-ee-bin (rdeps=153)
;;;    PROPRIETARY_LICENSE — GraalVM Enterprise JDK 17. OTN license.
;;;
;;; 6. jdk21-graalvm-ee-bin (rdeps=153)
;;;    PROPRIETARY_LICENSE — GraalVM Enterprise JDK 21. GFTC license.
;;;
;;; 34. matlab (rdeps=3)
;;;    PROPRIETARY_LICENSE — MathWorks MATLAB. Custom EULA, requires
;;;    MathWorks account and license. Not redistributable.
;;;
;;; 46. ndi-sdk (rdeps=1)
;;;    PROPRIETARY_LICENSE — NewTek NDI SDK. Proprietary license.
;;;
;;; 53. samsung-unified-driver-printer (rdeps=1)
;;;    PROPRIETARY_LICENSE — Samsung printer driver. Custom Samsung license.
;;;
;;; 54. iscan (rdeps=1)
;;;    PROPRIETARY_LICENSE — EPSON Image Scan. Custom AVASYSPL license
;;;    (partially GPL2 but core is proprietary).
;;;
;;; 55. mongodb-bin (rdeps=1)
;;;    NON_FOSS_LICENSE — MongoDB Community Server. SSPL-1.0 license (Server
;;;    Side Public License). Not OSI-approved; not suitable for free distribution.
;;;
;;; 58. samsung-unified-driver-scanner (rdeps=1)
;;;    PROPRIETARY_LICENSE — Samsung scanner driver. Custom Samsung license.
;;;
;;; 70. spotify-1.1 (rdeps=1)
;;;    PROPRIETARY_LICENSE — Spotify legacy v1.1. Proprietary streaming service.
;;;
;;; 71. spotify-dev (rdeps=1)
;;;    PROPRIETARY_LICENSE — Spotify development branch. Proprietary.
;;;
;;; 79. bigpemu-bin (rdeps=0)
;;;    PROPRIETARY_LICENSE — BigPEmu Jaguar emulator. Proprietary license.
;;;
;;; 84. chkufsd-bin (rdeps=0)
;;;    PROPRIETARY_LICENSE — Paragon UFSD filesystem utility. Despite LGPL
;;;    claim in AUR, binary is from Paragon proprietary distribution.
;;;
;;; 88. codeql (rdeps=0)
;;;    PROPRIETARY_LICENSE — GitHub CodeQL. Custom proprietary license.
;;;    Free for open source but proprietary redistribution terms.
;;;
;;; 89. coder-bin (rdeps=0)
;;;    PROPRIETARY_LICENSE — Coder remote dev platform. Proprietary license.
;;;
;;; 93. crql-anina (rdeps=0)
;;;    PROPRIETARY_LICENSE — CRQL spectral resonance suppression VST3/CLAP
;;;    plugin. Proprietary license.
;;;
;;; 94. crql-locd (rdeps=0)
;;;    PROPRIETARY_LICENSE — CRQL phase-locked distortion VST3/CLAP plugin.
;;;    Proprietary license.
;;;
;;; ── PROPRIETARY_DRIVER ─────────────────────────────────────────────────
;;; Proprietary GPU/hardware drivers not suitable for Guix.
;;;
;;; 7. nvidia-535xx-utils (rdeps=39)
;;;    PROPRIETARY_DRIVER — NVIDIA 535.xx driver utilities. Proprietary
;;;    NVIDIA license. Requires NVIDIA binary blob extraction.
;;;
;;; 25. rocm-gfx110x-bin (rdeps=16)
;;;    PROPRIETARY_DRIVER — AMD ROCm Core SDK for RDNA3. Proprietary AMD
;;;    binary distribution with custom AMD license.
;;;
;;; 26. rocm-nightly-gfx110x-bin (rdeps=14)
;;;    PROPRIETARY_DRIVER — AMD ROCm Nightly for gfx110x. Proprietary
;;;    ROCm-EULA nightly binary distribution.
;;;
;;; 27. rocm-nightly-gfx1151-bin (rdeps=14)
;;;    PROPRIETARY_DRIVER — AMD ROCm Nightly for gfx1151. Proprietary
;;;    ROCm-EULA nightly binary distribution.
;;;
;;; 28. opencl-amd (rdeps=11)
;;;    PROPRIETARY_DRIVER — AMD ROCm OpenCL. Repackaged proprietary AMD
;;;    binaries from AMDGPU-PRO driver stack.
;;;
;;; 31. lib32-nvidia-utils-beta (rdeps=6)
;;;    PROPRIETARY_DRIVER — NVIDIA 32-bit beta utilities. Proprietary
;;;    NVIDIA license + requires multilib (not supported in Guix).
;;;
;;; 35. opencl-nvidia-390xx (rdeps=2)
;;;    PROPRIETARY_DRIVER — NVIDIA 390.xx OpenCL. Proprietary NVIDIA license.
;;;
;;; 36. opencl-nvidia-470xx (rdeps=2)
;;;    PROPRIETARY_DRIVER — NVIDIA 470.xx OpenCL. Proprietary NVIDIA license.
;;;
;;; 37. opencl-nvidia-580xx (rdeps=2)
;;;    PROPRIETARY_DRIVER — NVIDIA 580.xx OpenCL. Proprietary NVIDIA license.
;;;
;;; 38. opencl-nvidia-beta (rdeps=2)
;;;    PROPRIETARY_DRIVER — NVIDIA beta OpenCL. Proprietary NVIDIA license.
;;;
;;; 39. opencl-nvidia-535xx (rdeps=2)
;;;    PROPRIETARY_DRIVER — NVIDIA 535.xx OpenCL. Proprietary NVIDIA license.
;;;
;;; 40. opencl-nvidia-550xx (rdeps=2)
;;;    PROPRIETARY_DRIVER — NVIDIA 550.xx OpenCL. Proprietary NVIDIA license.
;;;
;;; 49. nvidia-390xx-dkms (rdeps=1)
;;;    PROPRIETARY_DRIVER — NVIDIA 390.xx DKMS kernel module. Proprietary.
;;;
;;; 50. nvidia-470xx-dkms (rdeps=1)
;;;    PROPRIETARY_DRIVER — NVIDIA 470.xx DKMS kernel module. Proprietary.
;;;
;;; 51. nvidia-580xx-dkms (rdeps=1)
;;;    PROPRIETARY_DRIVER — NVIDIA 580.xx DKMS kernel module. Proprietary.
;;;
;;; 52. nvidia-beta-dkms (rdeps=1)
;;;    PROPRIETARY_DRIVER — NVIDIA beta DKMS kernel module. Proprietary.
;;;
;;; 56. nvidia-open-beta (rdeps=1)
;;;    PROPRIETARY_DRIVER — NVIDIA open kernel modules (beta). Mixed MIT +
;;;    GPL-2.0, but depends on proprietary nvidia-utils-beta runtime.
;;;
;;; 57. nvidia-open-beta-dkms (rdeps=1)
;;;    PROPRIETARY_DRIVER — NVIDIA open DKMS (beta). Same licensing issue
;;;    as nvidia-open-beta; depends on proprietary nvidia-utils-beta.
;;;
;;; 62. nvidia-beta (rdeps=1)
;;;    PROPRIETARY_DRIVER — NVIDIA beta kernel module. Proprietary license.
;;;    Depends on nvidia-utils-beta.
;;;
;;; ── LIB32_COMPAT ───────────────────────────────────────────────────────
;;; 32-bit compatibility libraries. Guix does not support multilib.
;;;
;;; 60. lib32-libdovi (rdeps=1)
;;;    LIB32_COMPAT — Dolby Vision 32-bit library. No multilib in Guix.
;;;
;;; 61. lib32-libvmaf (rdeps=1)
;;;    LIB32_COMPAT — Netflix VMAF 32-bit library. No multilib in Guix.
;;;
;;; 67. lib32-libbluray (rdeps=1)
;;;    LIB32_COMPAT — Blu-Ray 32-bit library. No multilib in Guix.
;;;
;;; 68. lib32-bluez-libs (rdeps=1)
;;;    LIB32_COMPAT — BlueZ 32-bit libs. No multilib in Guix.
;;;
;;; ── ARCH_SPECIFIC ──────────────────────────────────────────────────────
;;; Packages that require Arch Linux infrastructure.
;;;
;;; 33. archlinux-java-run (rdeps=4)
;;;    ARCH_SPECIFIC — Arch Linux Java launcher. Hardcoded /usr/lib/jvm
;;;    paths and arch-specific java-runtime-common. Guix handles Java
;;;    via profiles natively.
;;;
;;; 74. arch-remaster (rdeps=0)
;;;    ARCH_SPECIFIC — Arch ISO remastering tool. Requires pacman.
;;;    Name in org includes extra metadata.
;;;
;;; 75. arch-updater (rdeps=0)
;;;    ARCH_SPECIFIC — Arch update utility. Depends on pacman/yay/expac.
;;;    Name in org includes extra metadata.
;;;
;;; 76. archarchive (rdeps=0)
;;;    ARCH_SPECIFIC — Arch Linux Archive rollback utility.
;;;    Requires pacman package database.
;;;
;;; 77. archlinux-artwork (rdeps=0)
;;;    ARCH_SPECIFIC — Official Arch Linux artwork/logos. Custom trademark
;;;    license (CC-BY-NC-SA + TRADEMARKS). Not applicable to Guix.
;;;
;;; 83. check-broken-packages-pacman-hook-git (rdeps=0)
;;;    ARCH_SPECIFIC — Pacman hook for broken packages. Requires pacman
;;;    hook infrastructure. Name in org includes extra metadata.
;;;
;;; ── BUILD_SYSTEM_TOO_COMPLEX ───────────────────────────────────────────
;;; Build systems too complex to port within a single resolver pass.
;;;
;;; 1. freetype2-qdoled-aw3225qf (rdeps=176)
;;;    BUILD_SYSTEM_TOO_COMPLEX — Custom freetype2 build patched for
;;;    Dell AW3225QF QD-OLED subpixel layout. Requires monitor-specific
;;;    patches from AUR PKGBUILD. Meson build, 10 deps. Very high rdeps
;;;    but extremely niche (single monitor model). Patches not available
;;;    in upstream freetype2.
;;;
;;; 2. freetype2-qdoled-gen3 (rdeps=176)
;;;    BUILD_SYSTEM_TOO_COMPLEX — Custom freetype2 for QD-OLED Gen3
;;;    panels (AW2725D etc). Same issue as freetype2-qdoled-aw3225qf.
;;;    Monitor-specific subpixel patches not in upstream.
;;;
;;; 24. libinput-no-gestures (rdeps=27)
;;;    BUILD_SYSTEM_TOO_COMPLEX — Custom patched libinput with gesture
;;;    support removed. Requires rebuilding libinput from source with
;;;    specific patches. 9 deps including systemd.
;;;
;;; 30. mingw-w64-crt-msvcrt (rdeps=6)
;;;    BUILD_SYSTEM_TOO_COMPLEX — MinGW-w64 CRT with MSVCRT. Cross-
;;;    compilation toolchain requiring mingw-w64-gcc, mingw-w64-binutils,
;;;    and mingw-w64-headers. Guix handles cross-compilation differently.
;;;
;;; 32. firefox-beta-bin-all-localizations (rdeps=6)
;;;    BUILD_SYSTEM_TOO_COMPLEX — Firefox beta with all localizations.
;;;    Complex Perl-based download/installation script requiring
;;;    perl-file-slurp, perl-lwp-protocol-https, perl-switch.
;;;
;;; 42. vscodium-electron-bin (rdeps=2)
;;;    DEPENDS_ON_BLOCKED — VSCodium with system Electron. Requires
;;;    electron39 which is not in Guix and is itself a massive build.
;;;
;;; 59. kdesignerplugin (rdeps=1)
;;;    BUILD_SYSTEM_TOO_COMPLEX — KDE5 Frameworks widget integration.
;;;    Requires kconfig5, kcoreaddons5, extra-cmake-modules, qt5-tools.
;;;    Full KDE5 Frameworks stack not in Gaurix channel.
;;;
;;; 64. kemoticons (rdeps=1)
;;;    BUILD_SYSTEM_TOO_COMPLEX — KDE5 emoticon support framework.
;;;    Requires karchive5, kservice5. Same KDE5 stack issue.
;;;
;;; 66. ps3toolchain (rdeps=1)
;;;    BUILD_SYSTEM_TOO_COMPLEX — PS3 homebrew cross-compilation meta
;;;    package. Requires 6+ PS3-specific cross-compiler packages
;;;    (ps3-ppu-binutils, ps3-ppu-gcc, ps3-spu-binutils, etc.).
;;;
;;; 69. mips64-linux-gnu-gcc-bootstrap (rdeps=1)
;;;    BUILD_SYSTEM_TOO_COMPLEX — MIPS64 cross-compiler bootstrap.
;;;    Guix handles cross-compilation via its own (cross-base) module.
;;;    9 deps including mips64-specific binutils and linux-api-headers.
;;;
;;; 80. boomer-git (rdeps=0)
;;;    MISSING_BUILD_TOOLS — Screen zoomer written in Nim. Guix has no
;;;    Nim compiler or nimble build system. No tagged releases or binary
;;;    downloads available.
;;;
;;; 85. chough-bin (rdeps=0)
;;;    BUILD_SYSTEM_TOO_COMPLEX — ASR CLI using sherpa-onnx. Binary
;;;    bundles proprietary ONNX runtime shared libraries. Source build
;;;    requires packaging onnxruntime and sherpa-onnx first.
;;;
;;; 86. chromium-gost (rdeps=0)
;;;    BUILD_SYSTEM_TOO_COMPLEX — Full Chromium build with Russian GOST
;;;    cryptographic patches. Building Chromium from source is infeasible
;;;    in a single resolver pass.
;;;
;;; 91. cosmic-greeter-git (rdeps=0)
;;;    BUILD_SYSTEM_TOO_COMPLEX — COSMIC greeter for greetd. Requires
;;;    cosmic-comp-git, cosmic-icons-git, cargo + clang + just + mold
;;;    build toolchain, plus the entire COSMIC desktop ecosystem.
;;;
;;; ── DEPENDS_ON_BLOCKED ─────────────────────────────────────────────────
;;;
;;; 29. aspnet-runtime-preview-bin (rdeps=7)
;;;    DEPENDS_ON_BLOCKED — ASP.NET Core runtime preview. Depends on
;;;    dotnet-runtime-preview-bin which is also BLOCKED.
;;;
;;; 48. vectorchord-bin (rdeps=1)
;;;    DEPENDS_ON_BLOCKED — PostgreSQL vector search extension. Requires
;;;    PostgreSQL 18 (specific version) + pgvector extension.
;;;
;;; 63. heidisql-qt6-bin (rdeps=1)
;;;    DEPENDS_ON_BLOCKED — HeidiSQL Qt6 database GUI. Requires qt6pas
;;;    (Free Pascal Qt6 bindings), libperconaserverclient, freetds —
;;;    none available in Guix.
;;;
;;; ── KERNEL_SPECIFIC ────────────────────────────────────────────────────
;;;
;;; 44. mechrevo-drivers-dkms (rdeps=1)
;;;    KERNEL_SPECIFIC — MECHREVO laptop DKMS kernel modules. Requires
;;;    Linux DKMS infrastructure. Guix manages kernels differently.
;;;
;;; ── MISSING_BUILD_TOOLS ────────────────────────────────────────────────
;;;
;;; 65. llama.cpp-opencl (rdeps=1)
;;;    MISSING_BUILD_TOOLS — llama.cpp with OpenCL backend. OpenCL
;;;    support has been deprecated in llama.cpp in favor of Vulkan.
;;;    No Linux OpenCL prebuilt binaries available. Source build would
;;;    target a deprecated/removed backend.
;;;
;;; ── GAME_DATA_CUSTOM_LICENSE ───────────────────────────────────────────
;;;
;;; 45. unreal-tournament-data-archiveorg (rdeps=1)
;;;    GAME_DATA_CUSTOM_LICENSE — Unreal Tournament 99 GOTY data from
;;;    Archive.org. Game data under custom proprietary license.
;;;
;;; 47. unreal-tournament-data-gog (rdeps=1)
;;;    GAME_DATA_CUSTOM_LICENSE — Unreal Tournament 99 GOTY data from
;;;    GOG. Requires GOG account + lgogdownloader. Not redistributable.
;;;
;;; ── NOT_IN_AUR ─────────────────────────────────────────────────────────
;;; Not found in AUR cache. Package may have been removed or renamed.
;;;
;;; 43. gst-thumbnailers (rdeps=1)
;;;    NOT_IN_AUR — GStreamer thumbnailer. Not found in AUR cache.
;;;
;;; 72. anbox-git (rdeps=0)
;;;    NOT_IN_AUR — Anbox (Android in a Box). Project appears discontinued.
;;;    GitHub repo archived. Not found in AUR cache.
;;;
;;; 73. ancestris (rdeps=0)
;;;    NOT_IN_AUR — Ancestris genealogy software. Listed in AUR but no
;;;    dependency or source data in cache. Java-based (NetBeans platform),
;;;    would require complex Java packaging.
;;;
;;; 78. audiobookshelf (rdeps=0)
;;;    NOT_IN_AUR — Audiobook streaming server. Not found in AUR cache.
;;;    Node.js application with complex build process.
;;;
;;; 81. bulky (rdeps=0)
;;;    NOT_IN_AUR — Linux Mint bulk file renamer. Not found in AUR cache.
;;;
;;; 82. butter-launcher-bin (rdeps=0)
;;;    NOT_IN_AUR — Butter Launcher (Electron-based). No AUR metadata,
;;;    no dependency info. Electron apps require complex wrapping in Guix.
;;;
;;; 87. cnrdrvcups-lb-bin (rdeps=0)
;;;    NOT_IN_AUR — Canon UFRII LT printer driver. Not found in AUR
;;;    cache. Canon proprietary binary.
;;;
;;; 90. codex-desktop-bin (rdeps=0)
;;;    NOT_IN_AUR — OpenAI Codex Desktop. Not found in AUR cache.
;;;    Likely Electron-based, proprietary.
;;;
;;; 92. cromite-bin (rdeps=0)
;;;    LARGE_BROWSER_BINARY — Cromite (Chromium fork, GPL3). Prebuilt
;;;    browser binary with complex dynamic library dependencies (alsa-lib,
;;;    gtk3, libxss, nss). Would require extensive patchelf to fix library
;;;    paths. Release tags include commit hashes making URL templating
;;;    brittle.
;;;
;;; ══════════════════════════════════════════════════════════════════════
;;; RESOLVED IN THIS PASS (7 packages)
;;; ══════════════════════════════════════════════════════════════════════
;;;
;;; 41. icu74 — icu4c-74.2, Unicode-3.0, inherits from icu4c
;;; 95. crtui-bin — v0.1.2, Go container registry TUI, MIT
;;; 96. crunch — v3.6, C wordlist generator, GPL-2.0
;;; 97. crycco-bin — v0.5.2, Crystal literate programming tool, MIT
;;; 98. cs-bin — v3.1.0, Go code search CLI, MIT
;;; 99. csvi-bin — v1.23.1, Go CSV editor, MIT (existing had no general-compat)
;;; 100. cubyz-bin — v0.2.0, Zig voxel sandbox game, GPL-3.0
