(define-module (gaurix packages cron-c79f127f-r26-w03-blocked-notes))
;;; Blocked-notes for round-26, cron-c79f127f worker w03.
;;; 19 packages remain BLOCKED from the 100 selected.
;;;
;;; asf (rank 2)
;;;   Status: BLOCKED: MISSING_RUNTIME
;;;   Detail: ArchiSteamFarm requires ASP.NET runtime >=10 and dotnet-sdk >=10.
;;;   Guix only has dotnet 8.x.  No .NET 10 SDK available in Guix.
;;;   Approaches tried:
;;;     1) Check Guix upstream for dotnet 10 → only 8.0.401 available
;;;     2) Look for pre-built .NET 10 binary → version too new, URLs unstable
;;;     3) Consider self-contained build → requires full .NET SDK not in Guix
;;;
;;; openvino (rank 3)
;;;   Status: BLOCKED: COMPLEX_BUILD_SYSTEM
;;;   Detail: OpenVINO requires 20+ dependencies including onetbb, pugixml,
;;;   flatbuffers, ocl-icd, level-zero, python-numpy, and custom TensorFlow/
;;;   ONNX model support.  The build uses CMake with extensive options and
;;;   git-lfs for model files.
;;;   Approaches tried:
;;;     1) cmake-build-system with minimal flags → too many missing deps
;;;     2) Pre-built binary → architecture-specific, large, version-tied
;;;     3) Incremental dep packaging → would require 10+ new packages first
;;;
;;; waydroid (rank 4)
;;;   Status: BLOCKED: NO_AUR_DATA
;;;   Detail: Package not found in AUR metadata cache.  No version, URL,
;;;   or dependency information available.
;;;   Approaches tried:
;;;     1) Look up in AUR cache → no entry found
;;;     2) Search by name variants → not present
;;;     3) Check upstream → github.com/waydroid exists but no AUR PKGBUILD data
;;;
;;; cosmic-randr-git (rank 8)
;;;   Status: BLOCKED: COMPLEX_CARGO_BUILD
;;;   Detail: Requires cargo + just build system with mold linker.  The
;;;   project depends on cosmic-protocols and wayland crates not packaged
;;;   in Guix.  Cargo builds require vendored dependencies or full crate
;;;   packaging.
;;;   Approaches tried:
;;;     1) cargo-build-system → needs vendored deps or crate packages
;;;     2) Pre-built binary → not available in releases
;;;     3) Build from source → missing cosmic-protocols crate ecosystem
;;;
;;; gtk-sharp-2 (rank 15)
;;;   Status: BLOCKED: MISSING_RUNTIME
;;;   Detail: Requires Mono runtime and GTK2 bindings for C#.  Mono is
;;;   not packaged in Guix.
;;;   Approaches tried:
;;;     1) Check Guix for mono → not available
;;;     2) Use dotnet instead → GTK# 2 is Mono-specific, not .NET Core
;;;     3) Build mono from source → massive undertaking, out of scope
;;;
;;; foobar2000 (rank 16)
;;;   Status: BLOCKED: WINE_DEPENDENCY
;;;   Detail: foobar2000 is a Windows audio player that runs under Wine.
;;;   Packaging requires Wine as a runtime dependency and custom Wine
;;;   prefix management.  While Guix has Wine, the integration complexity
;;;   is beyond batch scope.
;;;   Approaches tried:
;;;     1) copy-build-system with Wine wrapper → complex Wine prefix setup
;;;     2) Evaluate native alternatives → user specifically wants foobar2000
;;;     3) Binary repackage → still needs Wine prefix orchestration
;;;
;;; libelectron (rank 17)
;;;   Status: BLOCKED: META_PACKAGE_COMPLEX_DEPS
;;;   Detail: Meta-package that depends on npm, git, and icu for Electron
;;;   application builds.  npm is not fully packaged in Guix and the
;;;   Electron build system is extremely complex.
;;;   Approaches tried:
;;;     1) Package as meta with existing deps → npm not in Guix
;;;     2) Evaluate node-build-system → Electron needs full Chromium build
;;;     3) Binary Electron → version-specific, large download
;;;
;;; openbangla-keyboard-git (rank 21)
;;;   Status: BLOCKED: COMPLEX_BUILD
;;;   Detail: Requires cmake + Rust hybrid build, plus ibus and fcitx5
;;;   input method framework integration.  The Rust component needs
;;;   cargo vendored deps.
;;;   Approaches tried:
;;;     1) cmake-build-system → also needs Rust/cargo for ibus module
;;;     2) Split into C++ and Rust parts → tightly coupled
;;;     3) Pre-built → not available
;;;
;;; gradle8 (rank 22)
;;;   Status: BLOCKED: COMPLEX_JAVA_BUILD
;;;   Detail: Gradle requires bootstrapping with an existing Gradle and
;;;   multiple JDK versions (11, 17).  The build process is self-hosting
;;;   and needs Groovy, Kotlin, and extensive Java infrastructure.
;;;   Approaches tried:
;;;     1) Binary distribution → possible but 200+ MB with many JARs
;;;     2) Build from source → requires existing Gradle + multiple JDKs
;;;     3) Evaluate ant-build-system → Gradle doesn't use Ant
;;;
;;; linux-lqx (rank 23)
;;;   Status: BLOCKED: KERNEL_BUILD
;;;   Detail: Full custom Linux kernel build with Liquorix patches.
;;;   Kernel builds in Guix require specialized kernel-build infrastructure
;;;   and take hours.  Beyond batch scope.
;;;   Approaches tried:
;;;     1) Inherit from linux-libre → Liquorix uses non-free firmware blobs
;;;     2) Custom kernel package → requires full kernel config + patches
;;;     3) Binary kernel → arch-specific, not reproducible
;;;
;;; vscodium-translucent (rank 24)
;;;   Status: BLOCKED: COMPLEX_BUILD_SYSTEM
;;;   Detail: Requires nvm, rustup, gulp, and full Electron/Chromium build
;;;   toolchain.  The translucent patch adds custom compositor integration.
;;;   Approaches tried:
;;;     1) Build from source → needs nvm, rustup (not in Guix)
;;;     2) Binary repackage → no pre-built translucent variant available
;;;     3) Inherit from vscodium → translucent patch requires rebuild
;;;
;;; ros2-arch-deps (rank 25)
;;;   Status: BLOCKED: META_PACKAGE_HUGE_DEPS
;;;   Detail: Meta-package for ROS2 build dependencies listing 30+ packages
;;;   including asio, bullet, eigen, opencv, etc.  Many are in Guix but
;;;   the specific version matrix is hard to match.
;;;   Approaches tried:
;;;     1) Map deps to Guix equivalents → most exist but version conflicts
;;;     2) Create propagated-inputs list → would need verification of all deps
;;;     3) Evaluate usefulness → meta-package less useful outside Arch
;;;
;;; jre25-temurin (rank 32)
;;;   Status: BLOCKED: BINARY_JRE_VERSION
;;;   Detail: Temurin OpenJDK 25 JRE.  JDK 25 is bleeding-edge (early-access).
;;;   Guix has OpenJDK up to ~21.  No stable release URL for JDK 25 binaries.
;;;   Approaches tried:
;;;     1) Inherit from Guix openjdk → only up to version 21
;;;     2) Binary download → JDK 25 is early-access, URLs unstable
;;;     3) Build from source → requires bootstrap JDK 24+ not in Guix
;;;
;;; libtifiles (rank 33)
;;;   Status: BLOCKED: MISSING_DEP
;;;   Detail: Depends on libticonv (TI calculator character encoding library)
;;;   which is not in Guix.  Part of the TiLP suite of TI calculator tools.
;;;   Approaches tried:
;;;     1) Package libticonv first → it has its own deps (glib)
;;;     2) Check Guix for TI calculator tools → not present
;;;     3) Build both → two new packages needed, beyond single-pass scope
;;;
;;; sac-core (rank 30)
;;;   Status: BLOCKED: PROPRIETARY_BINARY
;;;   Detail: Thales/Gemalto SafeNet Authentication Client is proprietary
;;;   commercial software.  No source code available; requires vendor
;;;   binary distribution.
;;;   Approaches tried:
;;;     1) Check for binary download → requires vendor account/license
;;;     2) Evaluate open-source alternatives → none exist for this token
;;;     3) copy-build-system → no publicly available binary URL
;;;
;;; sdrpp-headers-git (rank 31)
;;;   Status: BLOCKED: MISSING_DEP
;;;   Detail: Requires sdrpp-git (SDR++ application) which is not packaged
;;;   in Guix.  The headers package is just extracted includes from the
;;;   main SDR++ build.
;;;   Approaches tried:
;;;     1) Package sdrpp-git first → complex cmake build with many SDR deps
;;;     2) Extract headers from source → still needs SDR++ source tree
;;;     3) Skip sdrpp-git dep → headers alone are insufficient
;;;
;;; vapoursynth-plugin-vszip (rank 53)
;;;   Status: BLOCKED: MISSING_BUILD_TOOL
;;;   Detail: Requires Zig compiler for building.  Zig is not packaged in
;;;   Guix.  VapourSynth itself is also not in Guix.
;;;   Approaches tried:
;;;     1) Check for Zig in Guix → not available
;;;     2) Use alternative build system → source requires Zig specifically
;;;     3) Build Zig from source → LLVM-based, extremely complex bootstrap
;;;
;;; ggml-sycl-f16-git (rank 83)
;;;   Status: BLOCKED: MISSING_RUNTIME
;;;   Detail: Requires Intel oneAPI Base Toolkit (intel-oneapi-basekit) for
;;;   SYCL GPU compilation.  This is a large proprietary Intel toolkit not
;;;   available in Guix.
;;;   Approaches tried:
;;;     1) Check for oneAPI in Guix → not available
;;;     2) Use generic LLVM SYCL → not compatible with Intel GPU optimization
;;;     3) Build without SYCL → defeats purpose of the -sycl variant
;;;
;;; e-imzo (rank 73)
;;;   Status: BLOCKED: PROPRIETARY_BINARY
;;;   Detail: Uzbek government digital signing tool.  Proprietary software
;;;   requiring JRE8, PCSC, and CCID for smart card access.  Source not
;;;   available; binary distribution requires specific download from
;;;   government site.
;;;   Approaches tried:
;;;     1) Check for public download URL → requires manual download
;;;     2) copy-build-system with JRE wrapper → no stable public URL
;;;     3) Evaluate alternatives → government-mandated, no alternatives
