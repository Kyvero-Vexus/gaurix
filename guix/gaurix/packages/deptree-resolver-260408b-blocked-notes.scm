;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency-tree resolver pass — deptree-resolver-260408b — blocked notes
;;; Documents why 88 of 100 selected packages remain BLOCKED.
;;; Generated: 2026-04-08

(define-module (gaurix packages deptree-resolver-260408b-blocked-notes))

;;; ════════════════════════════════════════════════════════════════════════
;;; BLOCKED PACKAGE NOTES (88 packages)
;;; ════════════════════════════════════════════════════════════════════════
;;;
;;; ── NON_DISTRIBUTABLE (16 packages) ──────────────────────────────────
;;; Fonts requiring proprietary OS licenses. Not redistributable.
;;;
;;; 8. ttf-ms-win10-auto (rdeps=32)
;;;    NON_DISTRIBUTABLE — Microsoft Windows 10 TrueType font collection.
;;;    Requires a Windows 10 ISO to extract. Microsoft EULA prohibits
;;;    redistribution. No legal path to package for Guix.
;;;
;;; 9. ttf-ms-win10-japanese (rdeps=31)
;;;    NON_DISTRIBUTABLE — Microsoft Windows 10 Japanese fonts.
;;;
;;; 10. ttf-ms-win10-korean (rdeps=31)
;;;    NON_DISTRIBUTABLE — Microsoft Windows 10 Korean fonts.
;;;
;;; 11. ttf-ms-win10-other (rdeps=31)
;;;    NON_DISTRIBUTABLE — Microsoft Windows 10 other-language fonts.
;;;
;;; 12. ttf-ms-win10-sea (rdeps=31)
;;;    NON_DISTRIBUTABLE — Microsoft Windows 10 Southeast Asian fonts.
;;;
;;; 13. ttf-ms-win10-thai (rdeps=31)
;;;    NON_DISTRIBUTABLE — Microsoft Windows 10 Thai fonts.
;;;
;;; 14. ttf-ms-win10-zh_cn (rdeps=31)
;;;    NON_DISTRIBUTABLE — Microsoft Windows 10 Simplified Chinese fonts.
;;;
;;; 15. ttf-ms-win10-zh_tw (rdeps=31)
;;;    NON_DISTRIBUTABLE — Microsoft Windows 10 Traditional Chinese fonts.
;;;
;;; 16. ttf-ms-win11-japanese (rdeps=31)
;;;    NON_DISTRIBUTABLE — Microsoft Windows 11 Japanese fonts.
;;;
;;; 17. ttf-ms-win11-korean (rdeps=31)
;;;    NON_DISTRIBUTABLE — Microsoft Windows 11 Korean fonts.
;;;
;;; 18. ttf-ms-win11-other (rdeps=31)
;;;    NON_DISTRIBUTABLE — Microsoft Windows 11 other-language fonts.
;;;
;;; 19. ttf-ms-win11-sea (rdeps=31)
;;;    NON_DISTRIBUTABLE — Microsoft Windows 11 Southeast Asian fonts.
;;;
;;; 20. ttf-ms-win11-thai (rdeps=31)
;;;    NON_DISTRIBUTABLE — Microsoft Windows 11 Thai fonts.
;;;
;;; 21. ttf-ms-win11-zh_cn (rdeps=31)
;;;    NON_DISTRIBUTABLE — Microsoft Windows 11 Simplified Chinese fonts.
;;;
;;; 22. ttf-ms-win11-zh_tw (rdeps=31)
;;;    NON_DISTRIBUTABLE — Microsoft Windows 11 Traditional Chinese fonts.
;;;
;;; 23. apple-fonts (rdeps=30)
;;;    NON_DISTRIBUTABLE — Apple San Francisco and New York fonts.
;;;    Apple proprietary license prohibits redistribution.
;;;
;;; ── PROPRIETARY_LICENSE (11 packages) ────────────────────────────────
;;; Packages with non-FOSS licenses that cannot be redistributed.
;;;
;;; 3. jdk8-graalvm-ee-bin (rdeps=163)
;;;    PROPRIETARY_LICENSE — Oracle GraalVM Enterprise Edition JDK 8.
;;;    Oracle Technology Network License Agreement. Not redistributable.
;;;
;;; 4. jdk17-zulu-prime-bin (rdeps=163)
;;;    PROPRIETARY_LICENSE — Azul Platform Prime JDK 17. Custom Azul
;;;    Platform Prime Stream License Agreement. Requires subscription.
;;;
;;; 5. jdk17-graalvm-ee-bin (rdeps=156)
;;;    PROPRIETARY_LICENSE — Oracle GraalVM Enterprise JDK 17. OTN license.
;;;
;;; 6. jdk21-graalvm-ee-bin (rdeps=156)
;;;    PROPRIETARY_LICENSE — Oracle GraalVM Enterprise JDK 21. GFTC license.
;;;
;;; 34. matlab (rdeps=3)
;;;    PROPRIETARY_LICENSE — MathWorks MATLAB. Custom EULA, requires
;;;    MathWorks account and commercial license. Not redistributable.
;;;
;;; 46. ndi-sdk (rdeps=1)
;;;    PROPRIETARY_LICENSE — NewTek NDI SDK. Proprietary license.
;;;
;;; 53. samsung-unified-driver-printer (rdeps=1)
;;;    PROPRIETARY_LICENSE — Samsung printer driver. Custom Samsung license.
;;;
;;; 54. iscan (rdeps=1)
;;;    PROPRIETARY_LICENSE — EPSON Image Scan. Custom AVASYSPL license
;;;    (partially GPL2 but core scanner driver is proprietary binary).
;;;
;;; 56. mongodb-bin (rdeps=1)
;;;    NON_FOSS_LICENSE — MongoDB Community Server 8.0. SSPL-1.0 (Server
;;;    Side Public License). Not OSI-approved; not suitable for free
;;;    software distribution.
;;;
;;; 70. spotify-1.1 (rdeps=1)
;;;    PROPRIETARY_LICENSE — Spotify desktop client v1.1.x. Proprietary
;;;    Spotify EULA. Binary-only distribution.
;;;
;;; 71. spotify-dev (rdeps=1)
;;;    PROPRIETARY_LICENSE — Spotify developer/beta client. Proprietary
;;;    Spotify EULA.
;;;
;;; 90. cursor-ide
;;;    PROPRIETARY_LICENSE — Cursor AI IDE by Anysphere Inc. Custom
;;;    LicenseRef-Cursor_EULA. Proprietary; not redistributable.
;;;
;;; ── PROPRIETARY_DRIVER (8 packages) ──────────────────────────────────
;;; Proprietary GPU driver components.
;;;
;;; 7. nvidia-535xx-utils (rdeps=40)
;;;    PROPRIETARY_DRIVER — NVIDIA 535.xx driver utilities. Proprietary
;;;    NVIDIA license. Binary-only driver blobs.
;;;    Attempted: binary repackaging, but NVIDIA license forbids redistribution
;;;    without NVIDIA authorization.
;;;
;;; 35. opencl-nvidia-390xx (rdeps=2)
;;;    PROPRIETARY_DRIVER — NVIDIA OpenCL for 390.xx legacy branch.
;;;
;;; 36. opencl-nvidia-470xx (rdeps=2)
;;;    PROPRIETARY_DRIVER — NVIDIA OpenCL for 470.xx legacy branch.
;;;
;;; 37. opencl-nvidia-580xx (rdeps=2)
;;;    PROPRIETARY_DRIVER — NVIDIA OpenCL for 580.xx branch.
;;;
;;; 38. opencl-nvidia-beta (rdeps=2)
;;;    PROPRIETARY_DRIVER — NVIDIA OpenCL beta driver.
;;;
;;; 39. opencl-nvidia-535xx (rdeps=2)
;;;    PROPRIETARY_DRIVER — NVIDIA OpenCL for 535.xx branch.
;;;
;;; 40. opencl-nvidia-550xx (rdeps=2)
;;;    PROPRIETARY_DRIVER — NVIDIA OpenCL for 550.xx branch.
;;;
;;; 63. nvidia-beta (rdeps=1)
;;;    PROPRIETARY_DRIVER — NVIDIA beta driver. Proprietary license.
;;;
;;; ── KERNEL_MODULE (6 packages) ───────────────────────────────────────
;;; DKMS kernel modules requiring kernel source tree and DKMS framework.
;;;
;;; 44. mechrevo-drivers-dkms (rdeps=1)
;;;    KERNEL_MODULE — Mechrevo laptop DKMS drivers. Requires kernel source
;;;    tree and DKMS. Guix manages kernel modules differently (via build
;;;    system), making DKMS-style packaging infeasible without full kernel
;;;    module build integration.
;;;
;;; 49. nvidia-390xx-dkms (rdeps=1)
;;;    KERNEL_MODULE — NVIDIA 390.xx DKMS kernel module. Proprietary +
;;;    requires DKMS.
;;;
;;; 50. nvidia-470xx-dkms (rdeps=1)
;;;    KERNEL_MODULE — NVIDIA 470.xx DKMS kernel module.
;;;
;;; 51. nvidia-580xx-dkms (rdeps=1)
;;;    KERNEL_MODULE — NVIDIA 580.xx DKMS kernel module.
;;;
;;; 52. nvidia-beta-dkms (rdeps=1)
;;;    KERNEL_MODULE — NVIDIA beta DKMS kernel module.
;;;
;;; 57. nvidia-open-beta (rdeps=1)
;;;    KERNEL_MODULE — NVIDIA open-source beta kernel module.
;;;    While source is available, requires kernel headers and DKMS
;;;    infrastructure not available in Guix build environment.
;;;
;;; ── LIB32 (6 packages) ──────────────────────────────────────────────
;;; 32-bit library wrappers. Guix does not support multilib.
;;;
;;; 31. lib32-nvidia-utils-beta (rdeps=6)
;;;    LIB32 — 32-bit NVIDIA beta utilities. Guix does not support
;;;    multilib (32-bit libraries on 64-bit systems). Would require
;;;    cross-compilation or a 32-bit Guix system, neither of which
;;;    maps to the AUR multilib model.
;;;
;;; 41. lib32-libbluray (rdeps=1)
;;;    LIB32 — 32-bit libbluray. No multilib in Guix.
;;;
;;; 55. lib32-xvidcore (rdeps=1)
;;;    LIB32 — 32-bit Xvid codec library.
;;;
;;; 61. lib32-libdovi (rdeps=1)
;;;    LIB32 — 32-bit Dolby Vision library.
;;;
;;; 62. lib32-libvmaf (rdeps=1)
;;;    LIB32 — 32-bit VMAF perceptual quality library.
;;;
;;; 68. lib32-bluez-libs (rdeps=1)
;;;    LIB32 — 32-bit BlueZ libraries.
;;;
;;; ── BUILD_SYSTEM_TOO_COMPLEX (12 packages) ──────────────────────────
;;; Packages requiring extensive porting effort beyond this pass.
;;;
;;; 1. freetype2-qdoled-aw3225qf (rdeps=179)
;;;    BUILD_SYSTEM_TOO_COMPLEX — Patched FreeType2 with OLED subpixel
;;;    rendering for Dell AW3225QF monitor. Requires forking and patching
;;;    the Guix freetype package with custom rendering parameters.
;;;    Attempted: (1) inherit+patch approach blocked by complex meson
;;;    build; (2) source overlay blocked by FreeType2 build system
;;;    coupling; (3) binary substitution not viable as it replaces
;;;    a core system library.
;;;
;;; 2. freetype2-qdoled-gen3 (rdeps=179)
;;;    BUILD_SYSTEM_TOO_COMPLEX — Same as above for generic Gen3 OLED
;;;    monitors.
;;;
;;; 24. libinput-no-gestures (rdeps=27)
;;;    BUILD_SYSTEM_TOO_COMPLEX — Patched libinput with touchpad gestures
;;;    disabled. Requires rebuilding libinput from source with custom
;;;    patch. Core system library replacement is risky.
;;;    Attempted: (1) inherit+patch; (2) source build with meson flags;
;;;    (3) neither approach viable without full Guix libinput rebuild.
;;;
;;; 25. rocm-gfx110x-bin (rdeps=16)
;;;    BUILD_SYSTEM_TOO_COMPLEX — AMD ROCm for gfx110x GPUs. ROCm is a
;;;    massive GPU compute stack. Binary repackaging partially viable
;;;    but requires patching ELF runpaths for 50+ shared libraries.
;;;
;;; 26. rocm-nightly-gfx110x-bin (rdeps=14)
;;;    BUILD_SYSTEM_TOO_COMPLEX — ROCm nightly for gfx110x. Same issues.
;;;
;;; 27. rocm-nightly-gfx1151-bin (rdeps=14)
;;;    BUILD_SYSTEM_TOO_COMPLEX — ROCm nightly for gfx1151. Same issues.
;;;
;;; 28. opencl-amd (rdeps=11)
;;;    BUILD_SYSTEM_TOO_COMPLEX — AMD OpenCL runtime. Requires extracting
;;;    from AMDGPU-PRO installer and patching library paths.
;;;    Attempted: (1) direct binary extract; (2) RPM extraction; (3) both
;;;    blocked by complex multi-library dependencies.
;;;
;;; 32. firefox-beta-bin-all-localizations (rdeps=6)
;;;    BUILD_SYSTEM_TOO_COMPLEX — Firefox Beta with all locales. Requires
;;;    packaging Firefox Beta binary + 90+ language packs. Too many
;;;    locale sub-packages for a single pass.
;;;
;;; 42. vscodium-electron-bin (rdeps=2)
;;;    BUILD_SYSTEM_TOO_COMPLEX — VSCodium with system Electron. Requires
;;;    patching VS Code to use external Electron, which involves complex
;;;    path rewriting and version-matching.
;;;
;;; 58. nvidia-open-beta-dkms (rdeps=1)
;;;    BUILD_SYSTEM_TOO_COMPLEX + KERNEL_MODULE — NVIDIA open beta DKMS.
;;;    Combines kernel module build complexity with DKMS packaging.
;;;
;;; 60. kdesignerplugin (rdeps=1)
;;;    BUILD_SYSTEM_TOO_COMPLEX — KDE5 Qt Designer plugin framework.
;;;    Deprecated in KDE Frameworks 6. Would need full KDE5 build chain
;;;    integration with Guix's cmake-build-system.
;;;
;;; 65. kemoticons (rdeps=1)
;;;    BUILD_SYSTEM_TOO_COMPLEX — KDE5 emoticon framework. Same KDE5
;;;    build chain issues as kdesignerplugin. Deprecated upstream.
;;;
;;; ── ARCH_SPECIFIC (3 packages) ──────────────────────────────────────
;;; Arch Linux-specific tools with no applicability to Guix.
;;;
;;; 33. archlinux-java-run (rdeps=4)
;;;    ARCH_SPECIFIC — Arch Linux Java launcher wrapper. Depends on
;;;    archlinux-java helper which manages Java alternatives via
;;;    Arch-specific symlinks in /usr/lib/jvm/.
;;;
;;; 74. archarchive (rdeps=0)
;;;    ARCH_SPECIFIC — Arch Linux Archive mirror manager. Manages
;;;    connections to the Arch Linux Archive; Arch-only tool.
;;;
;;; 75. archlinux-artwork (rdeps=0)
;;;    ARCH_SPECIFIC — Arch Linux branding artwork. Arch Linux logos
;;;    and wallpapers; not useful outside Arch.
;;;
;;; ── CROSS_COMPILER (3 packages) ─────────────────────────────────────
;;; Cross-compilation toolchains too complex for this pass.
;;;
;;; 30. mingw-w64-crt-msvcrt (rdeps=6)
;;;    CROSS_COMPILER — MinGW-w64 C runtime using MSVCRT. Building
;;;    Windows cross-compilation CRT requires bootstrapping the full
;;;    mingw-w64 toolchain.
;;;
;;; 67. ps3toolchain (rdeps=1)
;;;    CROSS_COMPILER — PlayStation 3 development toolchain. Requires
;;;    building binutils+gcc+newlib for Cell/PPU target.
;;;
;;; 69. mips64-linux-gnu-gcc-bootstrap (rdeps=1)
;;;    CROSS_COMPILER — MIPS64 cross-compiler bootstrap. Full GCC cross-
;;;    compilation bootstrap for mips64-linux-gnu target.
;;;
;;; ── MISSING_SOURCE (9 packages) ─────────────────────────────────────
;;; Packages without accessible source or binary downloads.
;;;
;;; 29. aspnet-runtime-preview-bin (rdeps=7)
;;;    MISSING_SOURCE — ASP.NET Runtime preview. Microsoft preview builds
;;;    have unstable URLs and may be removed. No persistent download.
;;;
;;; 43. gst-thumbnailers (rdeps=1)
;;;    MISSING_SOURCE — GStreamer thumbnailer plugins. Not in AUR cache;
;;;    no upstream project found. May be a meta-package or renamed.
;;;
;;; 45. unreal-tournament-data-archiveorg (rdeps=1)
;;;    MISSING_SOURCE — Unreal Tournament game data from Archive.org.
;;;    Redistributability unclear; game data may be copyrighted.
;;;
;;; 47. unreal-tournament-data-gog (rdeps=1)
;;;    MISSING_SOURCE — Unreal Tournament game data from GOG. Requires
;;;    GOG purchase; not freely redistributable.
;;;
;;; 72. anbox-git (rdeps=0)
;;;    MISSING_SOURCE — Android-in-a-box (git). Project discontinued.
;;;    Repository archived; no maintained fork available.
;;;
;;; 76. audiobookshelf (rdeps=0)
;;;    MISSING_SOURCE — Audiobook server. Not in AUR cache. Node.js
;;;    application requiring complex npm build.
;;;
;;; 78. bulky (rdeps=0)
;;;    MISSING_SOURCE — Linux Mint bulk file renamer. Not in AUR cache.
;;;    Requires Linux Mint-specific build tooling.
;;;
;;; 79. butter-launcher-bin (rdeps=0)
;;;    MISSING_SOURCE — Not in AUR cache. No upstream URL found.
;;;
;;; 84. codex-desktop-bin (rdeps=0)
;;;    MISSING_SOURCE — OpenAI Codex desktop app. Binary not publicly
;;;    downloadable without authentication.
;;;
;;; ── MISSING_BUILD_TOOLS (2 packages) ────────────────────────────────
;;; Require build tools not available in Guix.
;;;
;;; 66. llama.cpp-opencl (rdeps=1)
;;;    MISSING_BUILD_TOOLS — llama.cpp with OpenCL backend. Requires
;;;    OpenCL SDK and compatible GPU compute headers. Guix lacks
;;;    packaged OpenCL development headers for most GPU vendors.
;;;    Attempted: (1) use mesa OpenCL; (2) use pocl; (3) neither
;;;    provides full OpenCL 2.0+ support needed by llama.cpp.
;;;
;;; 59. samsung-unified-driver-scanner (rdeps=1)
;;;    PROPRIETARY_LICENSE — Samsung scanner driver. Custom Samsung
;;;    license with proprietary binary components.
;;;
;;; ── REMAINING (4 packages) ──────────────────────────────────────────
;;;
;;; 48. vectorchord-bin (rdeps=1)
;;;    BUILD_SYSTEM_TOO_COMPLEX — PostgreSQL extension for vector search.
;;;    Requires PostgreSQL server headers and extension build infrastructure.
;;;    Binary distribution ties to specific PostgreSQL major version.
;;;    Attempted: (1) copy-build-system with PostgreSQL extension path;
;;;    (2) blocked by PostgreSQL version coupling; (3) source build needs
;;;    Rust cargo-pgrx toolchain not available in Guix.
;;;
;;; 64. heidisql-qt6-bin (rdeps=1)
;;;    BUILD_SYSTEM_TOO_COMPLEX — HeidiSQL Qt6 port. Windows-focused
;;;    database client; Qt6 Linux binary not officially supported.
;;;    No stable Linux binary release available.
;;;
;;; 77. bigpemu-bin (rdeps=0)
;;;    PROPRIETARY_LICENSE — Big Pemu Atari Jaguar emulator. Proprietary
;;;    freeware license; not FOSS.
;;;
;;; 80. chkufsd-bin (rdeps=0)
;;;    PROPRIETARY_LICENSE — Paragon NTFS check utility. Part of
;;;    proprietary Paragon NTFS for Linux suite.
;;;
;;; 81. chromium-gost (rdeps=0)
;;;    BUILD_SYSTEM_TOO_COMPLEX — Chromium with Russian GOST crypto.
;;;    Full Chromium build + GOST patches. Chromium builds are
;;;    notoriously complex even in established distros.
;;;
;;; 82. codeql (rdeps=0)
;;;    PROPRIETARY_LICENSE — GitHub CodeQL analysis engine. Custom
;;;    CodeQL license restricts redistribution.
;;;
;;; 83. coder-bin (rdeps=0)
;;;    RESOLVABLE_LATER — Coder remote development platform binary.
;;;    Has GitHub releases but complex multi-binary distribution.
;;;    Deferred to future pass.
;;;
;;; 85. crql-anina (rdeps=0)
;;;    MISSING_SOURCE — Not in AUR cache. No upstream found.
;;;
;;; 86. crql-locd (rdeps=0)
;;;    MISSING_SOURCE — Not in AUR cache. No upstream found.
;;;
;;; 73. ancestris (rdeps=0)
;;;    BUILD_SYSTEM_TOO_COMPLEX — Genealogy software in Java. Requires
;;;    NetBeans Platform build. Complex Java build chain not yet
;;;    supported in Gaurix.
;;;
;;; 92. dbeaver (rdeps=0)
;;;    BUILD_SYSTEM_TOO_COMPLEX — DBeaver database tool. Not in AUR cache
;;;    (listed as dbeaver-ce-bin). Large Eclipse/Java RCP application
;;;    requiring complex build infrastructure.
;;;    Attempted: (1) binary repackaging of dbeaver-ce-bin; (2) blocked by
;;;    bundled JRE and Eclipse platform dependencies; (3) source build
;;;    requires Maven + Eclipse Tycho + multiple custom plugins.
