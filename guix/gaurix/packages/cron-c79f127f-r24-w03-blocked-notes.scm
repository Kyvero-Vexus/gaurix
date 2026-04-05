;;; Blocked notes for cron-c79f127f-r24-w03 run.
;;; Packages from the selected 100 that remain BLOCKED with reasons.
(define-module (gaurix packages cron-c79f127f-r24-w03-blocked-notes))

;; ════════════════════════════════════════════════════════════════════
;; BLOCKED packages with detailed reason codes
;; ════════════════════════════════════════════════════════════════════

;; 1. qt5-doc — BLOCKED:COMPLEX_BUILD
;;    Qt5 documentation requires the full Qt5 build infrastructure.
;;    The documentation module needs qmake, qdoc, and the complete Qt5
;;    source tree to generate docs. Guix has qt but not the standalone
;;    doc package. Would need to add an output to the existing qt package.
;;    Attempts: (1) standalone build - needs full Qt sources
;;              (2) extract from qt build - not available as separate tarball
;;              (3) copy pre-built docs - no upstream binary docs available

;; 2. openvino — BLOCKED:COMPLEX_DEPS
;;    OpenVINO requires TBB, OpenCL, protobuf, flatbuffers, onnx, and
;;    extensive CMake configuration. Build matrix is very large with
;;    optional GPU/NPU plugin dependencies.
;;    Attempts: (1) cmake build from source - too many missing deps
;;              (2) pre-built binary - binary uses system libs not in Guix
;;              (3) minimal build - still needs TBB+protobuf+flatbuffers

;; 3. waydroid — BLOCKED:NO_AUR_DATA
;;    Package not found in AUR metadata cache. May have been removed
;;    or renamed. Cannot determine source, version, or dependencies.

;; 4. tailscale — BLOCKED:NO_AUR_DATA
;;    Package not found in AUR metadata cache. Tailscale is available
;;    upstream but the AUR version may have been removed.

;; 5. wayfire — BLOCKED:COMPLEX_DEPS
;;    Wayfire requires wlroots 0.19, wf-config, yyjson, and other
;;    Wayland compositor dependencies. wlroots 0.19 is not yet in Guix
;;    upstream (Guix has wlroots 0.17).
;;    Attempts: (1) meson build - missing wlroots 0.19
;;              (2) use Guix wlroots - version mismatch (0.17 vs 0.19)
;;              (3) package wlroots 0.19 first - cascading dep chain too deep

;; 6. hyprtoolkit-git — BLOCKED:COMPLEX_DEPS
;;    Requires Hyprland ecosystem libraries (hyprutils, hyprlang, etc.)
;;    which are not in Guix. Would need to package 5+ Hyprland deps first.

;; 7. llvm-libs-minimal-git — BLOCKED:COMPLEX_BUILD
;;    Building LLVM from git trunk requires extensive build time and
;;    infrastructure. The "minimal" variant strips unused components but
;;    still needs full LLVM source checkout and build.

;; 8. logmein-hamachi — BLOCKED:PROPRIETARY_NO_SOURCE
;;    LogMeIn Hamachi is a proprietary VPN service with no source code.
;;    The Linux binary distribution has been discontinued since 2023.
;;    No reliable download URL available.

;; 9. foobar2000 — BLOCKED:WINE_DEP
;;    foobar2000 on Linux runs via Wine. Packaging requires Wine as a
;;    dependency and wrapping the Windows executable. Complex setup.

;; 10. gtk-sharp-2 — BLOCKED:MONO_DEP
;;     GTK# 2 requires Mono runtime and build tools which are not
;;     available in Guix. Mono is a complex ecosystem to package.

;; 11. asf (ArchiSteamFarm) — BLOCKED:DOTNET_BUILD
;;     ASF is a .NET application that requires the .NET SDK to build
;;     from source. Pre-built binaries need .NET runtime which we
;;     packaged (dotnet-runtime-9.0-bin) but ASF needs specific version.

;; 12. linux-lqx — BLOCKED:KERNEL_PACKAGE
;;     Linux kernel packages require DKMS or full kernel build
;;     infrastructure. Guix handles kernels differently than Arch.

;; 13. tuxedo-drivers-dkms — BLOCKED:DKMS_MODULE
;;     DKMS kernel modules need kernel headers and build infrastructure.
;;     Not suitable for simple package recipe.

;; 14. new-lg4ff-dkms-git — BLOCKED:DKMS_MODULE
;;     Same as tuxedo-drivers-dkms: DKMS kernel module.

;; 15. vscodium-translucent — BLOCKED:ELECTRON_PATCH
;;     Requires building VSCodium with a translucency patch applied to
;;     Electron. Complex build that needs the full Electron build chain.

;; 16. ros2-arch-deps — BLOCKED:META_PACKAGE
;;     This is a meta-package for ROS2 build dependencies on Arch.
;;     The actual ROS2 packages it depends on are not in Guix.

;; 17. sonic-win — BLOCKED:KDE_FORK
;;     Fork of KWin that requires full KDE Plasma build infrastructure.
;;     Would need to rebuild/patch kwin from KDE sources.

;; 18. openbangla-keyboard-git — BLOCKED:COMPLEX_DEPS
;;     Requires fcitx5, libibus, and specific Qt5 modules that need
;;     careful configuration. Build uses CMake with many Qt5 components.

;; 19. mips64-linux-gnu-linux-api-headers — BLOCKED:CROSS_COMPILE
;;     Cross-compilation kernel headers for MIPS64. Guix has its own
;;     cross-compilation infrastructure; this Arch-specific package
;;     doesn't map well.

;; 20. mips64-linux-gnu-binutils — BLOCKED:CROSS_COMPILE
;;     Cross-compilation binutils for MIPS64. Same issue as above.

;; 21. sh-elf-binutils — BLOCKED:CROSS_COMPILE
;;     Cross-compilation binutils for SuperH. Same issue.

;; 22. qt5-connectivity — BLOCKED:QT5_MODULE
;;     Requires Qt5 build infrastructure to build as a standalone module.
;;     Guix packages Qt5 as a monolithic package; individual modules
;;     would need extraction from the main Qt5 build.

;; 23. qt5-serialbus — BLOCKED:QT5_MODULE
;;     Same as qt5-connectivity.

;; 24. libelectron — BLOCKED:META_PACKAGE
;;     Meta-package for Electron and dependencies. Electron itself is
;;     extremely complex to build (Chromium-based).

;; 25. cosmic-randr-git — BLOCKED:COSMIC_DEPS
;;     Requires cosmic-comp, cosmic-protocols, and other COSMIC desktop
;;     Rust libraries not in Guix.

;; 26. python-mcp — BLOCKED:UPSTREAM_EXISTS
;;     python-mcp 1.25.0 already exists in Guix upstream.
;;     The AUR version (1.26.0) is newer but the upstream package
;;     should be used. Marking as DONE (upstream).

;; 27. piper-voices-common — BLOCKED:LARGE_DATA
;;     Piper voice models are large binary data files (~100MB+).
;;     Requires downloading from Hugging Face and the piper-tts
;;     runtime which is not in Guix.

;; 28. sac-core — BLOCKED:PROPRIETARY_NO_SOURCE
;;     Thales/Gemalto SafeNet Authentication Client is proprietary
;;     with no public download URL. Requires customer portal access.

;; 29. libtifiles — BLOCKED:BUILD_FAILURE
;;     Source URL pattern for tilibs is unclear; the repository
;;     structure has changed. The last release tag format doesn't
;;     match expected patterns.
;;     Attempts: (1) github tag - URL 404
;;              (2) sourceforge mirror - outdated
;;              (3) git checkout - needs autotools bootstrap

;; 30. jre25-temurin — BLOCKED:NO_STABLE_URL
;;     JRE 25 is an early-access release with frequently changing
;;     download URLs. The Adoptium API would be needed for stable
;;     downloads.

;; 31. dotnet-runtime-9.0-bin — RESOLVED (see main recipe file)
;;     Note: aspnet-runtime-bin and aspnet-targeting-pack-bin remain
;;     BLOCKED because their download URLs are version-specific and
;;     the v10.0 preview URLs are unstable.

;; 32. aspnet-runtime-bin — BLOCKED:UNSTABLE_URL
;;     ASP.NET 10.0 preview URLs change frequently. Need stable
;;     release URL.

;; 33. aspnet-targeting-pack-bin — BLOCKED:UNSTABLE_URL
;;     Same as aspnet-runtime-bin.

;; 34. xone-dongle-firmware — BLOCKED:COMPLEX_EXTRACTION
;;     Firmware must be extracted from Microsoft Windows Update .cab
;;     files using specific tools. The extraction process involves
;;     downloading from Microsoft Update Catalog.

;; 35. stardust-xr-black-hole — BLOCKED:BUILD_FAILURE
;;     Source URL returns 404. The release tags may have been removed
;;     or renamed in the StardustXR GitHub organization.

;; 36. stardust-xr-flatland — BLOCKED:BUILD_FAILURE
;;     Same as stardust-xr-black-hole.

;; 37. stardust-xr-gravity — BLOCKED:BUILD_FAILURE
;;     Same as stardust-xr-black-hole.

;; 38. stardust-xr-protostar — BLOCKED:BUILD_FAILURE
;;     Same as stardust-xr-black-hole.

;; 39. stardust-xr-solar-sailer — BLOCKED:BUILD_FAILURE
;;     Same as stardust-xr-black-hole.

;; 40. bms-shell — BLOCKED:COMPLEX_DEPS
;;     Requires Quickshell (a QML shell framework) which is not in Guix.

;; 41. lib32-l-smash — BLOCKED:32BIT_BUILD
;;     32-bit variant of l-smash. Guix doesn't typically provide
;;     lib32 variants; the 64-bit l-smash is packaged above.
;;     l-smash (64-bit) is RESOLVED.
