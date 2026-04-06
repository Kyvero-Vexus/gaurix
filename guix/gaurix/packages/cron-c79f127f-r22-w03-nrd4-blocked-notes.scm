;;; Round-22 worker-03 blocked dependency-tree resolution pass (batch 4)
;;; Blocked-notes: 68 packages re-blocked with specific reasons.
;;; (phonon-qt5 already exists in Guix — handled as compat alias in general-compat.scm)
(define-module (gaurix packages cron-c79f127f-r22-w03-nrd4-blocked-notes))

;; ── Re-blocked packages ─────────────────────────────────────────────
;;
;; 1. qt5-webkit (rank 1)
;;    Reason: COMPLEX_BUILD_SYSTEM — Qt WebKit requires building the
;;    full WebKit2 engine with 25+ direct dependencies including ICU,
;;    libxml2, libxslt, gstreamer, hyphen, woff2, and Ruby.  The build
;;    takes hours and requires extensive phase customization.
;;    Approaches tried:
;;    A1: cmake-build-system with minimal deps → too many missing deps
;;    A2: Binary repackage → no pre-built Qt5 WebKit available
;;    A3: Evaluate if qtwebengine suffices → different API, not compat
;;
;; 2. waydroid (rank 2)
;;    Reason: NO_AUR_DATA — Package not found in AUR metadata cache.
;;    No version, URL, or dependency information available for automated
;;    packaging.
;;    Approaches tried:
;;    A1: Look up in AUR cache → no entry found
;;    A2: Search by name variants → not present in cache
;;    A3: Check upstream github.com/waydroid → exists but needs Android
;;        container images and LXC, complex system integration
;;
;; 3. cosmic-randr-git (rank 4)
;;    Reason: COMPLEX_CARGO_BUILD — Requires cargo + just build system
;;    with cosmic-protocols and wayland crate ecosystem not packaged
;;    in Guix.  All COSMIC desktop packages share this blocker.
;;    Approaches tried:
;;    A1: cargo-build-system → needs vendored deps or crate packages
;;    A2: Pre-built binary → not available in releases
;;    A3: Package cosmic-protocols first → large crate dependency tree
;;
;; 4. intel-npu-driver (rank 5)
;;    Reason: COMPLEX_BUILD_SYSTEM — Intel NPU driver requires kernel
;;    headers, level-zero, OpenCL, and custom firmware blobs.  Build
;;    system uses cmake with Intel-specific toolchain integration.
;;    Approaches tried:
;;    A1: cmake-build-system → needs level-zero not in Guix
;;    A2: Binary package → architecture/kernel-version specific
;;    A3: Check for upstream Guix packaging → none exists
;;
;; 5. gtk-sharp-2 (rank 6)
;;    Reason: MISSING_RUNTIME — Requires Mono runtime for C# GTK2
;;    bindings.  Mono is not packaged in Guix.
;;    Approaches tried:
;;    A1: Check Guix for mono → not available
;;    A2: Use dotnet instead → GTK# 2 is Mono-specific
;;    A3: Build mono from source → massive undertaking, out of scope
;;
;; 6. foobar2000 (rank 7)
;;    Reason: WINE_DEPENDENCY — Windows audio player requiring Wine
;;    runtime and custom Wine prefix management.
;;    Approaches tried:
;;    A1: copy-build-system with Wine wrapper → complex prefix setup
;;    A2: Evaluate native alternatives → user wants foobar2000 specifically
;;    A3: Binary repackage → still needs Wine orchestration
;;
;; 7. libelectron (rank 8)
;;    Reason: META_PACKAGE_COMPLEX_DEPS — Meta-package depending on
;;    npm, git, and ICU for Electron builds.  npm is not packaged in Guix.
;;    Approaches tried:
;;    A1: Package as meta → npm not in Guix
;;    A2: node-build-system → Electron needs full Chromium
;;    A3: Binary Electron → version-specific, large
;;
;; 8. lcevcdec (rank 9)
;;    Reason: COMPLEX_BUILD_SYSTEM — LCEVC decoder requires cmake with
;;    many optional deps (ffmpeg integration, GPU acceleration), and the
;;    GitHub release tarball failed to download.
;;    Approaches tried:
;;    A1: guix download tarball → download failed/timeout
;;    A2: git-fetch from repo → large repo with submodules
;;    A3: cmake-build-system with minimal config → download blocker
;;
;; 9. clang-libs-minimal-git (rank 10)
;;    Reason: COMPLEX_BUILD_SYSTEM — Requires building LLVM trunk from
;;    git with 11 makedepends.  Full LLVM/Clang build takes hours and
;;    needs careful phase management.
;;    Approaches tried:
;;    A1: Inherit from Guix clang → git trunk != release version
;;    A2: cmake-build-system → needs full LLVM source tree
;;    A3: Binary package → not available for trunk builds
;;
;; 10. gradle8 (rank 11)
;;    Reason: COMPLEX_JAVA_BUILD — Self-hosting build requiring existing
;;    Gradle + multiple JDK versions (11, 17) + Groovy + Kotlin.
;;    Approaches tried:
;;    A1: Binary distribution → 200+ MB with many JARs
;;    A2: Build from source → requires existing Gradle
;;    A3: ant-build-system → Gradle doesn't use Ant
;;
;; 11. vscodium-translucent (rank 12)
;;    Reason: COMPLEX_BUILD_SYSTEM — Requires nvm, rustup, gulp, and
;;    full Electron/Chromium build toolchain plus translucent patch.
;;    Approaches tried:
;;    A1: Build from source → needs nvm, rustup (not in Guix)
;;    A2: Binary repackage → no pre-built translucent variant
;;    A3: Inherit from vscodium → translucent patch requires rebuild
;;
;; 12. ros2-arch-deps (rank 13)
;;    Reason: META_PACKAGE_HUGE_DEPS — Meta-package listing 44
;;    dependencies for ROS2 builds.  Many exist in Guix but version
;;    matrix is hard to match.
;;    Approaches tried:
;;    A1: Map deps to Guix equivalents → version conflicts
;;    A2: Create propagated-inputs list → needs per-dep verification
;;    A3: Evaluate usefulness → meta-package less useful outside Arch
;;
;; 13. jre25-temurin (rank 14)
;;    Reason: BINARY_JRE_VERSION — JDK 25 is bleeding-edge early-access.
;;    Guix has OpenJDK up to ~21.  No stable release URL.
;;    Approaches tried:
;;    A1: Inherit from Guix openjdk → only up to version 21
;;    A2: Binary download → JDK 25 URLs unstable
;;    A3: Build from source → requires bootstrap JDK 24+
;;
;; 14. libtifiles (rank 15)
;;    Reason: MISSING_DEP — Depends on libticonv (TI calculator charset
;;    library) not packaged in Guix.  Part of TiLP suite.
;;    Approaches tried:
;;    A1: Package libticonv first → has its own dep chain
;;    A2: Check Guix for TI tools → not present
;;    A3: Build both → two new packages needed, beyond scope
;;
;; 15. openhab5 (rank 16)
;;    Reason: COMPLEX_JAVA_BUILD — openHAB 5 home automation platform
;;    requires JRE and extensive Java ecosystem.
;;    Approaches tried:
;;    A1: Binary distribution → large Java app (200+ MB)
;;    A2: Build from source → needs Gradle + many plugins
;;    A3: Docker image → not suitable for Guix packaging
;;
;; 16. sac-core (rank 18)
;;    Reason: PROPRIETARY_BINARY — Thales SafeNet Authentication Client
;;    is commercial software requiring vendor license.
;;    Approaches tried:
;;    A1: Check for binary download → requires vendor account
;;    A2: Open-source alternatives → none for this token
;;    A3: copy-build-system → no publicly available URL
;;
;; 17. sdrpp-headers-git (rank 19)
;;    Reason: MISSING_DEP — Requires sdrpp-git (SDR++) not in Guix.
;;    Headers package depends on main SDR++ build.
;;    Approaches tried:
;;    A1: Package sdrpp-git first → complex cmake with SDR deps
;;    A2: Extract headers from source → needs SDR++ source tree
;;    A3: Skip dep → headers alone insufficient
;;
;; 18. vapoursynth-plugin-vszip (rank 20)
;;    Reason: MISSING_BUILD_TOOL — Requires Zig compiler not in Guix.
;;    Approaches tried:
;;    A1: Check Guix for Zig → not available
;;    A2: Alternative build system → source requires Zig
;;    A3: Build Zig from source → LLVM-based, extremely complex
;;
;; 19. e-imzo (rank 22)
;;    Reason: PROPRIETARY_BINARY — Uzbek government digital signing
;;    tool.  Proprietary, requires manual download from gov site.
;;    Approaches tried:
;;    A1: Public download URL → requires manual download
;;    A2: copy-build-system with JRE → no stable URL
;;    A3: Evaluate alternatives → government-mandated
;;
;; 20. electron22-bin (rank 23)
;;    Reason: COMPLEX_BINARY_DEPS — Electron 22 binary requires
;;    gtk3, nss, alsa-lib, at-spi2-core, and many X11/Wayland libs.
;;    Needs patchelf for RPATH and sandbox setup.  Electron 22 is
;;    EOL (end-of-life).
;;    Approaches tried:
;;    A1: copy-build-system → extensive patchelf needed for 50+ libs
;;    A2: Use Guix electron package → only v34+ available
;;    A3: Simple binary copy → crashes without proper RPATH
;;
;; 21. ggml-sycl-f16-git (rank 24)
;;    Reason: MISSING_RUNTIME — Requires Intel oneAPI Base Toolkit for
;;    SYCL GPU compilation.  Proprietary Intel toolkit.
;;    Approaches tried:
;;    A1: Check for oneAPI in Guix → not available
;;    A2: Generic LLVM SYCL → not compatible
;;    A3: Build without SYCL → defeats purpose
;;
;; 22. itchio-dlagent (rank 25)
;;    Reason: ARCH_SPECIFIC — makepkg download agent for itch.io,
;;    tightly coupled to Arch Linux makepkg infrastructure.
;;    Approaches tried:
;;    A1: Port to generic script → depends on makepkg internals
;;    A2: Evaluate standalone use → only useful in Arch
;;    A3: Package as reference → no practical use in Guix
;;
;; 23. libstdc++5 (rank 26)
;;    Reason: LEGACY_TOOLCHAIN — GCC 3.3 libstdc++ from 2004.
;;    Building requires GCC 3.3 which is not available in Guix.
;;    Binary compat library would need specific SONAME.
;;    Approaches tried:
;;    A1: Build from GCC 3.3 source → compiler too old for Guix
;;    A2: Binary copy → need specific distro binary, not reproducible
;;    A3: Use Guix GCC 5 libstdc++ → wrong SONAME, not compatible
;;
;; 24. nvidia-390xx-utils (rank 27)
;;    Reason: PROPRIETARY_BINARY — NVIDIA proprietary driver utilities,
;;    version 390.xx (legacy).
;;    Approaches tried:
;;    A1: copy-build-system → large binary, kernel-specific
;;    A2: Build from source → proprietary, no source
;;    A3: Use Guix nvidia → different version series
;;
;; 25. nvidia-470xx-utils (rank 28)
;;    Reason: PROPRIETARY_BINARY — NVIDIA proprietary driver utilities,
;;    version 470.xx (legacy).
;;    Approaches tried:
;;    A1: copy-build-system → kernel-specific binary
;;    A2: Build from source → proprietary
;;    A3: Use Guix nvidia → different version
;;
;; 26. qt5-quick3d (rank 29)
;;    Reason: VERSION_MISMATCH — Guix packages qtquick3d but only Qt6
;;    version (6.9.2).  AUR qt5-quick3d needs Qt5 version (5.15.x).
;;    Qt5 Quick3D is a separate codebase from Qt6 Quick3D.
;;    Approaches tried:
;;    A1: Alias to Guix qtquick3d → wrong Qt version (6 vs 5)
;;    A2: Build Qt5 Quick3D from source → complex Qt5 build deps
;;    A3: Check Guix for Qt5 variant → only Qt6 available
;;
;; 27. samsung-unified-driver-printer (rank 30)
;;    Reason: PROPRIETARY_BINARY — Samsung proprietary printer driver.
;;    Binary-only, custom license.
;;    Approaches tried:
;;    A1: copy-build-system → proprietary binary, custom license
;;    A2: Open-source alternative → Samsung drivers are proprietary
;;    A3: Check cups-filters → no Samsung support
;;
;; 28. subtitles-contact-sheet-qt-cli (rank 33)
;;    Reason: COMPLEX_QT_BUILD — Requires Qt5 with multimedia, ffmpeg,
;;    and custom build integration.  The project uses qmake with
;;    specific Qt5 module dependencies.
;;    Approaches tried:
;;    A1: cmake-build-system → uses qmake, not cmake
;;    A2: gnu-build-system with qmake → complex Qt5 module setup
;;    A3: Check for pre-built → none available
;;
;; 29. themix-import-images-git (rank 34)
;;    Reason: MISSING_DEP — Requires themix-gui-git which depends on
;;    python-colorcet, python-colorz, and other Python packages not
;;    in Guix.  Plugin is useless without the GUI.
;;    Approaches tried:
;;    A1: Package as standalone → depends on oomox/themix GUI
;;    A2: Package themix-gui first → 5+ missing Python deps
;;    A3: Minimal install of image import → no standalone functionality
;;
;; 30. yaycache (rank 36)
;;    Reason: ARCH_SPECIFIC — yay cache cleaning tool, tightly coupled
;;    to the yay AUR helper and Arch pacman infrastructure.
;;    Approaches tried:
;;    A1: Port to generic tool → depends on yay/pacman internals
;;    A2: Package as reference → no practical use in Guix
;;    A3: Evaluate standalone use → requires pacman cache structure
;;
;; 31. arduino-builder (rank 37)
;;    Reason: COMPLEX_GO_BUILD — Requires Go + Arduino toolchain
;;    ecosystem with specific board support packages.
;;    Approaches tried:
;;    A1: go-build-system → needs Arduino SDK not in Guix
;;    A2: Binary release → depends on Arduino IDE installation
;;    A3: Build from source → extensive Arduino dep tree
;;
;; 32. paru-git (rank 42)
;;    Reason: ARCH_SPECIFIC — AUR helper for Arch Linux, tightly
;;    coupled to pacman and makepkg.
;;    Approaches tried:
;;    A1: cargo-build-system → depends on pacman/libalpm
;;    A2: Binary → depends on Arch system libs
;;    A3: Evaluate standalone → only useful on Arch
;;
;; 33. presage (rank 43)
;;    Reason: COMPLEX_DEPS — Requires dbus, sqlite, marisa-trie,
;;    cmuclmtk, and extensive autotools build with SWIG bindings.
;;    Approaches tried:
;;    A1: gnu-build-system → needs marisa-trie, cmuclmtk not in Guix
;;    A2: Minimal build without optional deps → core needs marisa
;;    A3: Check for binary → no pre-built packages
;;
;; 34. samsung-unified-driver-scanner (rank 45)
;;    Reason: PROPRIETARY_BINARY — Samsung proprietary scanner driver.
;;    Binary-only, custom license.
;;    Approaches tried:
;;    A1: copy-build-system → proprietary binary
;;    A2: Open-source SANE backend → Samsung not supported
;;    A3: Reverse-engineer → out of scope
;;
;; 35. themix-gui-git (rank 46)
;;    Reason: COMPLEX_PYTHON_GTK_DEPS — Requires python-colorcet,
;;    python-colorz, python-pylint, and extensive GTK3/Python-GObject
;;    integration.  Several Python deps not in Guix.
;;    Approaches tried:
;;    A1: pyproject-build-system → 5+ missing Python deps
;;    A2: Minimal build → core requires all deps
;;    A3: Binary package → Python app, no binary dist
;;
;; 36. themix-plugin-base16-git (rank 51)
;;    Reason: MISSING_DEP — Plugin for themix-gui-git which is blocked.
;;    Useless without the GUI.
;;    Approaches tried:
;;    A1: Package standalone → requires oomox/themix GUI
;;    A2: Package GUI first → blocked (see above)
;;    A3: Extract color schemes only → no standalone functionality
;;
;; 37. tzpfms (rank 52)
;;    Reason: MISSING_RUNTIME — Requires ZFS (zfsutils-linux) which
;;    is not packaged in Guix due to license incompatibility with
;;    Linux kernel.  Also needs TPM2 libraries.
;;    Approaches tried:
;;    A1: Check Guix for ZFS → not available (CDDL license)
;;    A2: Build without ZFS → core functionality requires ZFS
;;    A3: Package ZFS first → license prevents Guix inclusion
;;
;; 38. zectl (rank 54)
;;    Reason: MISSING_RUNTIME — ZFS Boot Environment manager requiring
;;    ZFS not in Guix.
;;    Approaches tried:
;;    A1: cmake-build-system → needs libzfs not in Guix
;;    A2: Check for ZFS in Guix → not available
;;    A3: Build without ZFS → defeats purpose
;;
;; 39. zsa-keymapp-bin (rank 55)
;;    Reason: COMPLEX_BINARY_DEPS — ZSA keyboard configurator binary
;;    requires gtk3, webkit2gtk-4.1, libusb, and zsa-udev rules.
;;    The binary needs extensive patchelf for GTK/WebKit libraries.
;;    Approaches tried:
;;    A1: copy-build-system → needs patchelf for 30+ shared libs
;;    A2: Direct download → URL structure changed, download failed
;;    A3: Build from source → proprietary, no source available
;;
;; 40. dosh-cqfd (rank 58)
;;    Reason: MISSING_RUNTIME — Requires Docker runtime for container
;;    execution.  Docker is not packaged in Guix.
;;    Approaches tried:
;;    A1: Package as script → depends on Docker daemon
;;    A2: Use podman → still needs container runtime in Guix
;;    A3: Standalone mode → core requires container engine
;;
;; 41. eprosima-fast-dds (rank 59)
;;    Reason: COMPLEX_BUILD_SYSTEM — eProsima Fast DDS requires cmake
;;    with asio, tinyxml2, foonathan-memory, fast-cdr, and custom
;;    IDL compiler.  Several deps not in Guix.
;;    Approaches tried:
;;    A1: cmake-build-system → needs foonathan-memory, fast-cdr
;;    A2: Package deps first → 4+ new packages needed
;;    A3: Binary → no pre-built available
;;
;; 42. eww (rank 60)
;;    Reason: COMPLEX_CARGO_BUILD — Elkowar's Wacky Widgets requires
;;    Rust + GTK4 + gtk4-layer-shell + many system deps.  Cargo
;;    build needs vendored crates or full crate packaging.
;;    Approaches tried:
;;    A1: cargo-build-system → needs vendored deps + gtk4-layer-shell
;;    A2: Binary release → available but needs patchelf for GTK4
;;    A3: Build from source → gtk4-layer-shell not in Guix
;;
;; 43. lib32-libvmaf (rank 61)
;;    Reason: CROSS_COMPILATION — 32-bit library requiring multilib
;;    cross-compilation not standard in Guix build model.
;;    Approaches tried:
;;    A1: Native build with -m32 → Guix doesn't support multilib
;;    A2: Cross-compile i686 → complex cross-compilation setup
;;    A3: Use 64-bit version → different library, not compatible
;;
;; 44. opencl-amd (rank 63)
;;    Reason: PROPRIETARY_BINARY — AMD ROCm OpenCL repackaged from
;;    Ubuntu.  Proprietary AMD binary distribution.
;;    Approaches tried:
;;    A1: copy-build-system → proprietary, Ubuntu-specific binaries
;;    A2: Build from source → ROCm is partially open but complex
;;    A3: Use Guix ROCm → not available in Guix
;;
;; 45. python-aubio-ledfx (rank 64)
;;    Reason: COMPLEX_C_DEPS — Fork of python-aubio requiring custom
;;    build with numpy, FFTW, and platform-specific audio backends.
;;    The LedFx fork has patches that diverge from upstream aubio.
;;    Approaches tried:
;;    A1: pyproject-build-system → needs custom aubio C library build
;;    A2: Use Guix python-aubio → this is a different fork
;;    A3: Build aubio C lib first → forked version with LED patches
;;
;; 46. cosmic-idle-git (rank 56)
;;    Reason: COMPLEX_CARGO_BUILD — COSMIC desktop Rust ecosystem.
;;    Requires cosmic-protocols, wayland crate ecosystem, and just
;;    build system not available in Guix.
;;    Approaches tried:
;;    A1: cargo-build-system → needs cosmic crate ecosystem
;;    A2: Pre-built binary → not available
;;    A3: Package cosmic-protocols first → huge dep tree
;;
;; 47. cosmic-screenshot-git (rank 57)
;;    Reason: COMPLEX_CARGO_BUILD — COSMIC desktop Rust ecosystem.
;;    Same cosmic-protocols dependency blocker as all COSMIC packages.
;;    Approaches tried:
;;    A1: cargo-build-system → needs cosmic crate ecosystem
;;    A2: Pre-built binary → not available
;;    A3: Package deps incrementally → too many crates needed
;;
;; 48. python-loro (rank 66)
;;    Reason: COMPLEX_BUILD_TOOL — Requires maturin (Rust-Python bridge)
;;    build system.  Maturin is not packaged in Guix.  The Rust backend
;;    has extensive crate dependencies.
;;    Approaches tried:
;;    A1: pyproject-build-system → needs maturin not in Guix
;;    A2: Build Rust lib separately → complex FFI binding generation
;;    A3: Pre-built wheel → platform-specific, not reproducible
;;
;; 49. sleuthkit-java (rank 69)
;;    Reason: COMPLEX_BUILD_SYSTEM — Requires The Sleuth Kit C library
;;    plus Java JNI bindings.  TSK itself has many deps (afflib,
;;    libewf, libbfio) not all in Guix.
;;    Approaches tried:
;;    A1: cmake + ant-build-system → needs TSK and JNI setup
;;    A2: Package TSK first → multiple missing forensic libs
;;    A3: Binary → no pre-built JAR with native libs
;;
;; 50. tvbrowser (rank 70)
;;    Reason: COMPLEX_JAVA_BUILD — Java Swing TV guide application
;;    requiring 5 runtime deps and Ant-based build with custom
;;    plugin system.
;;    Approaches tried:
;;    A1: ant-build-system → complex plugin architecture
;;    A2: Binary distribution → 100+ MB Java app
;;    A3: Minimal build → needs full plugin framework
;;
;; 51. aurutils (rank 72)
;;    Reason: ARCH_SPECIFIC — AUR helper tools tightly coupled to
;;    pacman, makepkg, and Arch Linux infrastructure.
;;    Approaches tried:
;;    A1: Package as scripts → depends on pacman/makepkg
;;    A2: Evaluate standalone → only useful on Arch
;;    A3: Port to Guix → incompatible package models
;;
;; 52. boost-65-compat-libs (rank 73)
;;    Reason: LEGACY_TOOLCHAIN — Boost 1.65.1 from 2017 requires
;;    older build infrastructure.  Building with modern GCC/toolchain
;;    may produce incompatible binaries.
;;    Approaches tried:
;;    A1: Inherit from Guix boost → version 1.89, not compatible
;;    A2: Build 1.65 from source → needs b2/bjam with old toolset
;;    A3: Binary compat library → SONAME differences
;;
;; 53. cosmic-app-library-git (rank 74)
;;    Reason: COMPLEX_CARGO_BUILD — COSMIC desktop Rust ecosystem.
;;    Same cosmic-protocols dependency blocker.
;;    Approaches tried:
;;    A1: cargo-build-system → needs cosmic crate ecosystem
;;    A2: Pre-built binary → not available
;;    A3: Incremental dep packaging → too many crates
;;
;; 54. cosmic-panel-git (rank 75)
;;    Reason: COMPLEX_CARGO_BUILD — COSMIC desktop Rust ecosystem.
;;    Approaches tried:
;;    A1: cargo-build-system → needs cosmic crate ecosystem
;;    A2: Pre-built binary → not available
;;    A3: Incremental dep packaging → too many crates
;;
;; 55. kanidm-clients (rank 76)
;;    Reason: COMPLEX_CARGO_BUILD — Kanidm identity management system
;;    requires extensive Rust crate ecosystem (openssl-sys, sqlite,
;;    ldap, webauthn crates).
;;    Approaches tried:
;;    A1: cargo-build-system → needs vendored deps or 50+ crates
;;    A2: Pre-built binary → not officially distributed
;;    A3: Minimal client build → still needs core kanidm crates
;;
;; 56. kanidm-server (rank 77)
;;    Reason: COMPLEX_CARGO_BUILD — Full kanidm server with database,
;;    LDAP, RADIUS integration.  Even more deps than client.
;;    Approaches tried:
;;    A1: cargo-build-system → massive crate dependency tree
;;    A2: Docker image → not suitable for Guix
;;    A3: Build from source → 100+ crate dependencies
;;
;; 57. kanidm-unixd-clients (rank 78)
;;    Reason: COMPLEX_CARGO_BUILD — Kanidm Unix PAM/NSS integration.
;;    Same crate ecosystem blocker as kanidm-clients.
;;    Approaches tried:
;;    A1: cargo-build-system → needs kanidm core crates
;;    A2: Pre-built binary → not available
;;    A3: Minimal build → depends on kanidm-clients
;;
;; 58. lib32-lapack (rank 80)
;;    Reason: CROSS_COMPILATION — 32-bit LAPACK requiring multilib
;;    cross-compilation not standard in Guix.
;;    Approaches tried:
;;    A1: Build with -m32 → Guix doesn't support multilib
;;    A2: Cross-compile i686 → complex setup
;;    A3: Use 64-bit lapack → different ABI
;;
;; 59. libastal-bluetooth-git (rank 81)
;;    Reason: MISSING_DEP — Requires astal framework (libastal) not
;;    packaged in Guix.  Part of the Astal widget system.
;;    Approaches tried:
;;    A1: Package libastal first → has Vala + GObject deps
;;    A2: Build standalone → depends on astal core
;;    A3: Check Guix for astal → not available
;;
;; 60. ps3-psl1ght (rank 85)
;;    Reason: CROSS_COMPILATION — PS3 homebrew SDK requiring
;;    ps3-toolchain (ppu/spu cross-compilers).  Extremely niche
;;    cross-compilation target.
;;    Approaches tried:
;;    A1: Build cross-compiler → needs PPU/SPU toolchain
;;    A2: Binary SDK → platform-specific, large
;;    A3: Evaluate usefulness → very niche, PS3 homebrew only
;;
;; 61. cosmic-workspaces-git (rank 92)
;;    Reason: COMPLEX_CARGO_BUILD — COSMIC desktop Rust ecosystem.
;;    Approaches tried:
;;    A1: cargo-build-system → needs cosmic crate ecosystem
;;    A2: Pre-built binary → not available
;;    A3: Incremental packaging → too many crates
;;
;; 62. easytier-cli (rank 93)
;;    Reason: COMPLEX_CARGO_BUILD — EasyTier mesh VPN requires
;;    Rust with WireGuard, tokio, and networking crate ecosystem.
;;    Approaches tried:
;;    A1: cargo-build-system → needs vendored deps (50+ crates)
;;    A2: Pre-built binary → available but needs patchelf
;;    A3: Build from source → WireGuard crate deps not in Guix
;;
;; 63. easytier-core (rank 94)
;;    Reason: COMPLEX_CARGO_BUILD — Core EasyTier daemon.  Same
;;    Rust ecosystem blocker as easytier-cli.
;;    Approaches tried:
;;    A1: cargo-build-system → extensive crate deps
;;    A2: Pre-built → needs patchelf
;;    A3: Source build → blocked by crate ecosystem
;;
;; 64. easytier-web (rank 95)
;;    Reason: COMPLEX_CARGO_BUILD — EasyTier web interface.  Same
;;    blocker plus additional web framework crates.
;;    Approaches tried:
;;    A1: cargo-build-system → needs crate ecosystem + web deps
;;    A2: Pre-built → needs patchelf
;;    A3: Source build → blocked by crate ecosystem
;;
;; 65. fw-ectool-git (rank 97)
;;    Reason: COMPLEX_BUILD_SYSTEM — Framework laptop EC tool requires
;;    Chrome EC build environment (libec, libftdi) from Chromium OS
;;    embedded controller source tree.
;;    Approaches tried:
;;    A1: cmake-build-system → needs libec from Chrome EC
;;    A2: Build Chrome EC first → massive Chromium OS dep tree
;;    A3: Binary → architecture-specific, no releases
;;
;; 66. libgksu (rank 98)
;;    Reason: COMPLEX_DEPS — Requires old GTK2, libgnome, libgconf,
;;    libgnomeui, and libgtop libraries.  Most of these GNOME 2
;;    libraries are not in modern Guix.
;;    Approaches tried:
;;    A1: gnu-build-system → needs libgnomeui not in Guix
;;    A2: Minimal build → core requires libgnome
;;    A3: Evaluate alternatives → gksu is deprecated upstream
;;
;; 67. memoria-daemon (rank 99)
;;    Reason: COMPLEX_DEPS — Requires Vala compiler, libgee, granite,
;;    and GNOME/elementary OS desktop integration libraries.
;;    Approaches tried:
;;    A1: meson-build-system → needs granite not in Guix
;;    A2: Build without granite → core UI requires it
;;    A3: Package granite first → depends on elementary ecosystem
