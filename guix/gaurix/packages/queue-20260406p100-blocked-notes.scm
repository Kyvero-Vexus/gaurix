;;; Blocked notes for dep-tree priority 100 pass — 2026-04-06
;;; 80 packages re-blocked with concrete reasons after investigation.
(define-module (gaurix packages queue-20260406p100-blocked-notes))

;;; ── Re-blocked packages ──────────────────────────────────────────

;; #1 qt5-webkit
;; BLOCKED: COMPLEX_BUILD — Full WebKit2 engine for Qt5; massive multi-hour
;; build, 25+ deps.  A1: 33 deps many Qt5-specific; A2: WebKit source build
;; extremely complex; A3: no prebuilt binary available for Guix.

;; #2 matlab-mpm
;; BLOCKED: PROPRIETARY_BINARY — MATLAB Package Manager; requires MATLAB EULA
;; acceptance.  A1: no lawful redistribution path; A2: requires manual
;; MathWorks download; A3: no open-source alternative for same functionality.

;; #3 cosmic-randr-git
;; BLOCKED: CARGO_DEPS_NOT_AVAILABLE — COSMIC display configurator; Rust/cargo
;; dep tree includes cosmic-protocols crates not in Guix.
;; A1: no binary release; A2: cargo deps not available; A3: no simpler fork.

;; #4 intel-npu-driver
;; BLOCKED: COMPLEX_BUILD_DEPS — Intel NPU driver; level-zero not in Guix,
;; kernel module integration complex, hardware-specific firmware blobs.
;; A1: level-zero headers/loader missing; A2: kernel integration required;
;; A3: no prebuilt for non-Arch.

;; #5 gtk-sharp-2
;; BLOCKED: MISSING_RUNTIME — GTK+2 C# bindings requiring Mono; Mono is not
;; packaged in Guix and is a massive undertaking.
;; A1: Mono not available; A2: .NET runtime alternative also unavailable;
;; A3: no substitute for Mono-based C# binding.

;; #6 foobar2000
;; BLOCKED: WINE_DEPENDENCY — Windows audio player wrapped via Wine; also
;; lacks open redistribution rights.
;; A1: Windows-only binary; A2: Wine integration; A3: no native Linux port.

;; #7 libelectron
;; BLOCKED: COMPLEX_BUILD — Electron shared runtime; requires full Chromium
;; build (multi-hour, enormous); npm not in Guix.
;; A1: npm build system; A2: Chromium build; A3: no prebuilt alternative.

;; #8 lcevcdec
;; BLOCKED: COMPLEX_BUILD — LCEVC video decoder; source with submodules,
;; cmake with many optional GPU deps.
;; A1: source tarball unreachable; A2: git submodules; A3: no stable artifact.

;; #9 clang-libs-minimal-git
;; BLOCKED: COMPLEX_BUILD — Clang from LLVM trunk; requires matching
;; llvm-libs-minimal-git not in Guix; hours to build.
;; A1: git trunk build; A2: matching LLVM dep; A3: no release artifacts.

;; #10 gradle8
;; BLOCKED: COMPLEX_JAVA_BUILD — Self-hosting Gradle build requiring existing
;; Gradle plus multiple JDK versions simultaneously.
;; A1: circular bootstrap; A2: multiple JDKs; A3: binary dist too complex.

;; #11 vscodium-translucent
;; BLOCKED: COMPLEX_BUILD — VSCodium with transparency patches; requires nvm,
;; rustup, full Electron rebuild.
;; A1: nvm not in Guix; A2: rustup not in Guix; A3: no prebuilt binary.

;; #12 ros2-arch-deps
;; BLOCKED: ARCH_SPECIFIC — Arch-specific ROS2 build dependency meta-package;
;; 44 deps, many Arch-only (python-bloom, python-colcon).
;; A1: meta-package concept; A2: Arch-only deps; A3: not portable.

;; #13 libtifiles
;; BLOCKED: MISSING_DEP — TI calculator file format library; depends on
;; libticonv which is not in Guix.
;; A1: libticonv missing; A2: both need packaging; A3: niche use case.

;; #14 openhab5
;; BLOCKED: COMPLEX_JAVA_BUILD — openHAB 5 home automation; large Java
;; platform (200+ MB), archlinux-java-run is Arch-specific.
;; A1: Arch-specific launcher; A2: Gradle upstream build; A3: binary 200+ MB.

;; #15 sac-core
;; BLOCKED: PROPRIETARY_BINARY — Thales SafeNet Authentication Client;
;; commercial product requiring vendor license agreement.
;; A1: vendor account required; A2: no public download; A3: proprietary.

;; #16 sdrpp-headers-git
;; BLOCKED: MISSING_DEP — SDR++ headers needing sdrpp-git (SDR++) which is
;; not packaged in Guix; headers alone insufficient.
;; A1: sdrpp missing; A2: headers useless alone; A3: no alternative.

;; #17 vapoursynth-plugin-vszip
;; BLOCKED: MISSING_BUILD_TOOL — VapourSynth zip plugin; requires Zig
;; compiler not packaged in Guix.
;; A1: Zig not in Guix; A2: Zig bootstrapping complex; A3: no C fallback.

;; #18 e-imzo
;; BLOCKED: PROPRIETARY_BINARY — Uzbek government digital identity software;
;; closed-source, manual download from e-imzo.soliq.uz required.
;; A1: no stable URL; A2: redistribution not permitted; A3: govt-issued only.

;; #19 electron22-bin
;; BLOCKED: EOL_BINARY — Electron 22 end-of-life; prebuilt binary needs
;; extensive patchelf for 50+ libs; no Guix electron v22.
;; A1: EOL version; A2: 50+ lib patching; A3: Guix has v34+.

;; #20 ggml-sycl-f16-git
;; BLOCKED: MISSING_RUNTIME — ggml with Intel SYCL GPU; requires Intel
;; oneAPI Base Toolkit (proprietary SDK).
;; A1: oneAPI proprietary; A2: SYCL compiler missing; A3: no open alternative.

;; #21 itchio-dlagent
;; BLOCKED: ARCH_SPECIFIC — makepkg download agent for itch.io; tightly
;; coupled to Arch makepkg protocol.
;; A1: Arch-specific tool; A2: no value outside makepkg; A3: ruby deps.

;; #22 libstdc++5
;; BLOCKED: LEGACY_TOOLCHAIN — GCC 3.3 C++ stdlib (2004); requires GCC 3.3
;; to build.
;; A1: GCC 3.3 unavailable; A2: binary copy non-reproducible; A3: legacy.

;; #23 nvidia-390xx-utils
;; BLOCKED: PROPRIETARY_BINARY — NVIDIA 390.xx legacy driver; proprietary,
;; no source available.
;; A1: proprietary driver; A2: legacy 390.xx series; A3: no source.

;; #24 nvidia-470xx-utils
;; BLOCKED: PROPRIETARY_BINARY — NVIDIA 470.xx legacy driver; proprietary,
;; kernel-version-specific binary.
;; A1: proprietary driver; A2: legacy 470.xx; A3: no source.

;; #25 qt5-quick3d
;; BLOCKED: VERSION_MISMATCH — Qt5 Quick 3D (5.15.x KDE fork); Guix only
;; has Qt6 variant; full Qt5 build chain needed.
;; A1: Qt5-specific codebase; A2: Qt6 variant exists in Guix; A3: no port.

;; #26 samsung-unified-driver-printer
;; BLOCKED: PROPRIETARY_BINARY — Samsung closed-source printer driver;
;; samsung-unified-driver-common itself has no canonical upstream.
;; A1: closed binary; A2: common driver missing; A3: proprietary license.

;; #27 subtitles-contact-sheet-qt-cli
;; BLOCKED: MISSING_BUILD_TOOL — Video subtitle contact sheet; uses qmake,
;; Guix has no qmake build system.
;; A1: qmake not supported; A2: no cmake alternative; A3: no prebuilt.

;; #28 themix-import-images-git
;; BLOCKED: MISSING_DEP — Image-to-palette plugin for Themix; useless without
;; themix-gui which is blocked on 5+ missing Python deps.
;; A1: themix-gui missing; A2: python-colorcet missing; A3: chain blocked.

;; #29 yaycache
;; BLOCKED: ARCH_SPECIFIC — yay/AUR cache cleaner; depends on pacman-contrib
;; and yay cache layout.
;; A1: pacman dependency; A2: AUR-specific; A3: no meaning on Guix.

;; #30 arduino-builder
;; BLOCKED: MISSING_DEP — CLI Arduino sketch compiler; arduino-ctags and
;; Arduino SDK ecosystem not in Guix; upstream archived 2019.
;; A1: arduino-ctags missing; A2: upstream archived; A3: Go build deps.

;; #31 paru-git
;; BLOCKED: ARCH_SPECIFIC — AUR helper (Rust/cargo); hard runtime dependency
;; on libalpm/pacman.
;; A1: libalpm dependency; A2: meaningless outside Arch; A3: cargo deps.

;; #32 samsung-unified-driver-scanner
;; BLOCKED: PROPRIETARY_BINARY — Samsung closed-source scanner driver;
;; libxml2-legacy and libusb-compat not in Guix.
;; A1: closed binary; A2: compat libs missing; A3: proprietary license.

;; #33 themix-gui-git
;; BLOCKED: MISSING_DEP — GTK3/Python theme designer (oomox); python-colorcet,
;; python-colorz, python-pylint missing in Guix.
;; A1: python-colorcet missing; A2: python-colorz missing; A3: dep chain.

;; #34 themix-plugin-base16-git
;; BLOCKED: MISSING_DEP — Base16 plugin for Themix; depends on themix-gui
;; which is itself blocked.
;; A1: themix-gui blocked; A2: chain dependency; A3: cannot standalone.

;; #35 tzpfms
;; BLOCKED: MISSING_DEP — TPM2-based ZFS encryption key manager; ZFS (CDDL
;; license) not in Guix due to GPL incompatibility.
;; A1: ZFS missing; A2: CDDL/GPL conflict; A3: no alternative filesystem.

;; #36 zectl
;; BLOCKED: MISSING_DEP — ZFS Boot Environment manager; depends on ZFS;
;; CDDL license incompatibility with Guix.
;; A1: ZFS missing; A2: CDDL/GPL conflict; A3: ZFS-only tool.

;; #37 cosmic-idle-git
;; BLOCKED: CARGO_DEPS_NOT_AVAILABLE — COSMIC desktop idle daemon; COSMIC
;; ecosystem crates (wayland-rs, etc.) not packaged in Guix.
;; A1: COSMIC crates missing; A2: no binary release; A3: no simpler fork.

;; #38 cosmic-screenshot-git
;; BLOCKED: CARGO_DEPS_NOT_AVAILABLE — COSMIC screenshot utility; COSMIC
;; crates not in Guix; hard dep on xdg-desktop-portal-cosmic-git.
;; A1: COSMIC crates missing; A2: portal dep missing; A3: no binary.

;; #39 dosh-cqfd
;; BLOCKED: MISSING_DEP — Docker container build wrapper; dosh requires
;; Docker daemon which is not packaged in Guix.
;; A1: Docker missing; A2: runtime Docker dependency; A3: no podman fallback.

;; #40 eprosima-fast-dds
;; BLOCKED: MISSING_DEP — eProsima Fast-DDS middleware (ROS2); foonathan_memory
;; and eprosima-fast-cdr not in Guix.
;; A1: foonathan_memory missing; A2: fast-cdr missing; A3: both need packaging.

;; #41 eww
;; BLOCKED: CARGO_DEPS_NOT_AVAILABLE — Elkowar's Wacky Widgets; large Rust/GTK
;; crate tree (gtk-layer-shell-rs, tokio) not in Guix.
;; A1: cargo dep tree massive; A2: gtk-layer-shell-rs missing; A3: no binary.

;; #42 lib32-libvmaf
;; BLOCKED: LIB32_NOT_SUPPORTED — Netflix VMAF 32-bit; Guix does not support
;; multilib (32-bit libs on x86_64).
;; A1: no multilib; A2: 64-bit version available; A3: Guix architecture.

;; #43 opencl-amd
;; BLOCKED: PROPRIETARY_BINARY — AMD ROCm OpenCL runtime; extracts AMD
;; proprietary blobs from Ubuntu .deb; custom AMD license.
;; A1: proprietary blobs; A2: repackaged Ubuntu .deb; A3: not redistributable.

;; #44 python-loro
;; BLOCKED: MISSING_BUILD_TOOL — Python Loro CRDT bindings; maturin not
;; sufficient — extensive Rust crate deps for CRDT backend.
;; A1: massive cargo dep tree; A2: pre-built wheels platform-specific;
;; A3: Rust backend crates unavailable.

;; #45 sleuthkit-java
;; BLOCKED: MISSING_DEP — Java JNI bindings for The Sleuth Kit; java-openjfx=17
;; and forensic libs (afflib, libewf) incomplete in Guix.
;; A1: java-openjfx missing; A2: afflib/libewf missing; A3: complex JNI.

;; #46 tvbrowser
;; BLOCKED: ARCH_SPECIFIC — Java TV guide; depends on archlinux-java-run
;; wrapper; 100+ MB app with complex plugin framework.
;; A1: Arch-specific launcher; A2: plugin framework; A3: no standalone.

;; #47 aurutils
;; BLOCKED: ARCH_SPECIFIC — AUR helper scripts; tightly coupled to
;; pacman/makepkg/AUR infrastructure.
;; A1: pacman dependency; A2: makepkg dependency; A3: no value outside Arch.

;; #48 boost-65-compat-libs
;; BLOCKED: LEGACY_TOOLCHAIN — Boost 1.65.1 (2017) compat runtime libs;
;; requires older b2/bjam toolset; SONAME differences.
;; A1: old b2/bjam; A2: SONAME incompatible; A3: complex GCC bootstrap.

;; #49 cosmic-app-library-git
;; BLOCKED: CARGO_DEPS_NOT_AVAILABLE — COSMIC application launcher; COSMIC
;; ecosystem Rust crates not packaged in Guix.
;; A1: COSMIC crates missing; A2: no binary release; A3: no simpler fork.

;; #50 cosmic-panel-git
;; BLOCKED: CARGO_DEPS_NOT_AVAILABLE — COSMIC desktop panel; COSMIC crate
;; ecosystem (cosmic-iced, smithay forks) not in Guix.
;; A1: COSMIC crates missing; A2: no binary; A3: smithay forks unavailable.

;; #51 kanidm-clients
;; BLOCKED: CARGO_DEPS_NOT_AVAILABLE — Kanidm identity client tools; large
;; Rust dep tree; libgit2-rs and tpm2-tss-rs crates not vendored.
;; A1: massive cargo tree; A2: tpm2-tss-rs missing; A3: no prebuilt.

;; #52 kanidm-server
;; BLOCKED: CARGO_DEPS_NOT_AVAILABLE — Kanidm identity management server;
;; massive Rust tree; tpm2-tss-rs, tokio, ldap3 crates.
;; A1: massive cargo tree; A2: tpm2-tss bindings; A3: complex server.

;; #53 kanidm-unixd-clients
;; BLOCKED: CARGO_DEPS_NOT_AVAILABLE — Kanidm POSIX identity resolver;
;; tpm2-tss-rs binding + clap/tokio crates.
;; A1: tpm2-tss-rs missing; A2: cargo deps; A3: no prebuilt.

;; #54 lib32-lapack
;; BLOCKED: LIB32_NOT_SUPPORTED — LAPACK 32-bit multilib; Guix does not
;; support multilib.
;; A1: no multilib support; A2: 64-bit available; A3: Guix architecture.

;; #55 ps3-psl1ght
;; BLOCKED: COMPLEX_TOOLCHAIN — PS3 GameOS lightweight SDK; requires
;; ps3-ppu-gcc, ps3-spu-gcc, ps3-env — none in Guix.
;; A1: PS3 cross-compiler; A2: ps3-env toolchain; A3: niche use case.

;; #56 cosmic-workspaces-git
;; BLOCKED: CARGO_DEPS_NOT_AVAILABLE — COSMIC workspace overview; COSMIC
;; crate ecosystem; no binary release.
;; A1: COSMIC crates missing; A2: smithay deps; A3: no binary.

;; #57 easytier-cli
;; BLOCKED: MIXED_BUILD_SYSTEM — EasyTier mesh VPN CLI; Cargo + nodejs/pnpm
;; hybrid build; pnpm not in Guix.
;; A1: pnpm missing; A2: rust-bindgen deps; A3: 50+ crates.

;; #58 easytier-core
;; BLOCKED: MIXED_BUILD_SYSTEM — EasyTier mesh VPN daemon; same as
;; easytier-cli (cargo + pnpm hybrid).
;; A1: pnpm missing; A2: protobuf binding; A3: shared source.

;; #59 easytier-web
;; BLOCKED: MIXED_BUILD_SYSTEM — EasyTier web management; same as
;; easytier-cli/core (cargo + pnpm + web framework).
;; A1: pnpm missing; A2: web framework crates; A3: shared source.

;; #60 fw-ectool-git
;; BLOCKED: COMPLEX_BUILD — Framework laptop EC tool; uses Chrome OS EC
;; build environment (full chromium-ec source), not standalone cmake.
;; A1: chromium-ec source tree; A2: internal Makefile; A3: not standalone.

;; #61 libgksu
;; BLOCKED: MISSING_DEP — gksu authorization library (GNOME 2 era);
;; libgnome/libgnomeui absent; also deprecated upstream.
;; A1: GNOME 2 libs missing; A2: upstream abandoned; A3: deprecated.

;; #62 pgadmin4-web
;; BLOCKED: MISSING_DEP — pgAdmin 4 Apache WSGI frontend; depends on
;; pgadmin4-server which is blocked on 50+ Python deps.
;; A1: pgadmin4-server blocked; A2: Flask ecosystem deps; A3: Azure/Google SDKs.

;; #63 qtforkawesome-qt6
;; BLOCKED: MISSING_DEP — ForkAwesome icon font for Qt6; makedep
;; qtutilities-qt6 not in Guix (AUR-only, same author Martchus).
;; A1: qtutilities-qt6 missing; A2: author's private dep chain; A3: AUR-only.

;; #64 cosmic-bg-git
;; BLOCKED: CARGO_DEPS_NOT_AVAILABLE — COSMIC background service; depends on
;; cosmic-icons-git and COSMIC crate ecosystem.
;; A1: cosmic-icons missing; A2: COSMIC crates missing; A3: no binary.

;; #65 cosmic-notifications-git
;; BLOCKED: CARGO_DEPS_NOT_AVAILABLE — COSMIC notifications daemon; COSMIC
;; crate ecosystem + smithay.
;; A1: COSMIC crates missing; A2: smithay deps; A3: no binary.

;; #66 cryptomator
;; BLOCKED: COMPLEX_BUILD — Client-side cloud encryption (Java/JavaFX); Maven
;; build downloads artifacts at build time (violates Guix offline build).
;; A1: Maven internet deps; A2: JavaFX/OpenJFX bundles missing; A3: vendoring.

;; #67 gcc10-libs
;; BLOCKED: LEGACY_TOOLCHAIN — GCC 10.x runtime shared libraries; building
;; GCC 10 is a multi-hour bootstrap; current gcc-libs backwards-compatible.
;; A1: multi-hour build; A2: backwards-compatible current libs; A3: legacy.

;; #68 intel-graphics-compiler-legacy
;; BLOCKED: COMPLEX_BUILD — Intel OpenCL compiler for legacy GPU; very large
;; C++/LLVM cmake project; SPIRV-Tools + pinned LLVM version.
;; A1: pinned LLVM version; A2: SPIRV-Tools; A3: multi-hour build.

;; #69 lib32-nvidia-utils-beta
;; BLOCKED: NONFREE_LICENSE — NVIDIA 32-bit beta driver utilities; proprietary
;; NVIDIA EULA; binary-only.
;; A1: proprietary license; A2: binary-only; A3: no libre alternative.

;; #70 plasticscm-client-core
;; BLOCKED: NONFREE_LICENSE — Unity Version Control (Plastic SCM) CLI;
;; proprietary Unity/Codice Software license; binary-only commercial VCS.
;; A1: proprietary license; A2: binary-only; A3: commercial tool.

;; #71 python-albucore
;; BLOCKED: MISSING_DEP — Image processing for Albumentations; python-simsimd,
;; python-stringzilla, python-opencv not in Guix.
;; A1: python-simsimd missing; A2: python-stringzilla missing;
;; A3: python-opencv missing.

;; #72 python-frida
;; BLOCKED: BUILD_COMPLEXITY — Dynamic instrumentation Python bindings;
;; build requires live npm/nodejs at build time.
;; A1: npm at build time; A2: wxWindows license unusual; A3: binary wheels only.

;; #73 aylurs-gtk-shell-git
;; BLOCKED: MIXED_BUILD_SYSTEM — AGS GTK4 widget system; npm runtime
;; dependency + Go/meson hybrid build conflicts with Guix reproducibility.
;; A1: npm runtime; A2: Go + meson hybrid; A3: libastal deps chain.

;; #74 cosmic-files-git
;; BLOCKED: CARGO_DEPS_NOT_AVAILABLE — COSMIC desktop file manager (Rust);
;; COSMIC ecosystem crates not available; requires vendoring large tree.
;; A1: COSMIC crates missing; A2: cosmic-icons dep; A3: no binary.

;; #75 git-credential-manager
;; BLOCKED: DOTNET_BUILD — .NET Git credential helper; requires dotnet-sdk-8.0
;; at build time; Guix .NET support limited.
;; A1: dotnet-sdk-8.0 missing; A2: .NET build system; A3: reproducibility.

;; #76 lib32-bluez-libs
;; BLOCKED: LIB32_NOT_SUPPORTED — 32-bit BlueZ Bluetooth libraries; Guix
;; does not support lib32/multilib; also deprecated upstream.
;; A1: no multilib; A2: deprecated API; A3: Guix architecture.

;; #77 memoria-daemon
;; BLOCKED: CARGO_DEPS_NOT_AVAILABLE — Wayland clipboard history daemon;
;; Rust/cargo dep tree (tokio, rusqlite, etc.) not vendored in Guix.
;; A1: cargo dep tree large; A2: cmake + cargo hybrid; A3: no binary dist.

;; #78 stardust-xr-non-spatial-input
;; BLOCKED: CARGO_DEPS_NOT_AVAILABLE — 2D input bridge for Stardust XR;
;; Rust/cargo dep tree (libinput-sys, xkbcommon-rs) not vendored.
;; A1: cargo dep tree; A2: xkbcommon-rs crate missing; A3: niche use case.

;; #79 ivpn
;; BLOCKED: GO_DEPS_NOT_VENDORED — IVPN VPN client CLI; Go + cmake hybrid
;; build; Go module deps need vendoring; cmake/ninja for native components.
;; A1: Go module deps; A2: cmake/ninja hybrid; A3: complex build system.
