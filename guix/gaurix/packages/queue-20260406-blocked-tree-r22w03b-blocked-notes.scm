;;; Blocked notes for dep-tree priority 100 pass — 2026-04-06 (r22-w03 batch b)
;;; 79 packages re-blocked with concrete reasons after investigation.
;;; 7 packages resolved as compat aliases (in general-compat.scm).
(define-module (gaurix packages queue-20260406-blocked-tree-r22w03b-blocked-notes))

;;; ── Re-blocked packages ──────────────────────────────────────────

;; #1 qt5-webkit
;; BLOCKED: COMPLEX_BUILD — Full WebKit2 engine for Qt5; massive multi-hour
;; build with 25+ deps, many Qt5-specific.
;; A1: 33 deps many not in Guix; A2: WebKit source build extremely complex;
;; A3: no prebuilt binary available.

;; #2 flaresolverr
;; BLOCKED: COMPLEX_RUNTIME — Python proxy server requiring headless Chromium
;; and Selenium to bypass Cloudflare challenges; Chromium not bundleable.
;; A1: headless Chromium dep; A2: Selenium webdriver integration; A3: complex
;; runtime requiring browser binary.

;; #3 matlab-mpm
;; BLOCKED: PROPRIETARY_BINARY — MATLAB Package Manager requires MATLAB EULA
;; acceptance; no lawful redistribution path.
;; A1: no redistribution rights; A2: requires MathWorks download; A3: no OSS alt.

;; #4 brscan-skey
;; BLOCKED: PROPRIETARY_BINARY — Brother scan-key-tool; proprietary binary
;; only available from Brother support site with no redistribution rights.
;; A1: proprietary blob; A2: Brother-specific protocol; A3: no OSS alternative.

;; #5 cosmic-randr-git
;; BLOCKED: CARGO_DEPS_NOT_AVAILABLE — COSMIC display configurator; Rust/cargo
;; dep tree includes cosmic-protocols crates not packaged in Guix.
;; A1: no binary release; A2: cosmic-protocols crate missing; A3: no simpler fork.

;; #6 libajantv2
;; BLOCKED: COMPLEX_BUILD — AJA NTV2 SDK; large hardware SDK with kernel module
;; integration and proprietary firmware components.
;; A1: kernel module required; A2: firmware blobs; A3: hardware-specific.

;; #7 libunity
;; BLOCKED: MISSING_DEP — Unity integration library requiring vala, dee, and
;; dbus-test-runner which are not available in Guix.
;; A1: vala+dee dep chain; A2: dbus-test-runner missing; A3: Unity-specific.

;; #8 intel-npu-driver
;; BLOCKED: COMPLEX_BUILD_DEPS — Intel NPU driver; level-zero not in Guix,
;; kernel module integration complex, hardware-specific firmware blobs.
;; A1: level-zero missing; A2: kernel integration; A3: firmware blobs.

;; #9 mozc-ut-full-common
;; BLOCKED: COMPLEX_BUILD — Mozc with UT dictionary; requires bazel build system
;; (not in Guix) and multiple Japanese dictionary data sources.
;; A1: bazel build system; A2: 13 makedeps; A3: complex dict integration.

;; #10 libastal-meta
;; BLOCKED: META_PACKAGE — Meta package for 17 libastal service libraries, each
;; needing separate packaging; no single source to build.
;; A1: meta-package with 17 deps; A2: each lib separate; A3: not portable.

;; #11 dotnet-targeting-pack-preview-bin
;; BLOCKED: DOTNET_PREVIEW — .NET targeting pack preview; requires matching
;; dotnet-sdk-preview-bin which has complex dependency chain.
;; A1: preview SDK dep; A2: version coupling; A3: .NET ecosystem not in Guix.

;; #12 system76-acpi-dkms
;; BLOCKED: DKMS_KERNEL_MODULE — System76 ACPI DKMS module; requires running
;; kernel headers and DKMS framework not available in Guix.
;; A1: DKMS not in Guix; A2: kernel headers coupling; A3: hardware-specific.

;; #13 arduino-avr-core
;; BLOCKED: COMPLEX_TOOLCHAIN — Arduino AVR core; requires patched avr-gcc
;; toolchain, avrdude, and Arduino-specific core library build.
;; A1: patched avr-gcc; A2: Arduino IDE integration; A3: toolchain complexity.

;; #14 foobar2000
;; BLOCKED: WINE_DEPENDENCY — Windows audio player wrapped via Wine; no native
;; Linux port and no open redistribution rights.
;; A1: Windows-only binary; A2: Wine integration; A3: no Linux port.

;; #15 gtk-sharp-2
;; BLOCKED: MISSING_RUNTIME — GTK+2 C# bindings requiring Mono runtime which
;; is not packaged in Guix.
;; A1: Mono not available; A2: .NET runtime unavailable; A3: no substitute.

;; #16 kdotool
;; BLOCKED: CARGO_DEPS_NOT_AVAILABLE — xdotool clone for KDE Wayland; requires
;; kdotool-dbus crate and KDE-specific D-Bus interfaces.
;; A1: kdotool-dbus crate not packaged; A2: KDE Wayland-specific; A3: no release.

;; #17 libelectron
;; BLOCKED: COMPLEX_BUILD — Electron shared runtime requiring full Chromium
;; build (multi-hour, enormous); npm not in Guix.
;; A1: Chromium build; A2: npm build system; A3: no prebuilt alternative.

;; #18 pacaur
;; BLOCKED: ARCH_SPECIFIC — AUR helper requiring pacman, makepkg, cower;
;; fundamentally Arch-Linux-specific tooling.
;; A1: pacman dep; A2: makepkg dep; A3: Arch-only.

;; #19 lcevcdec
;; BLOCKED: COMPLEX_BUILD — LCEVC video decoder; source with git submodules,
;; cmake with GPU deps.
;; A1: source tarball unreachable; A2: git submodules; A3: no stable artifact.

;; #20 radicle-httpd
;; BLOCKED: CARGO_DEPS_NOT_AVAILABLE — Radicle HTTP daemon; depends on radicle
;; crates (radicle-node, radicle-cob) not packaged in Guix.
;; A1: radicle crates missing; A2: complex crate tree; A3: no binary release.

;; #21 python-moviepy
;; BLOCKED: MISSING_DEP — Python video editing library requiring python-imageio
;; and python-proglog not in Guix, plus ffmpeg integration complexity.
;; A1: python-imageio missing; A2: ffmpeg binary coupling; A3: test suite complex.

;; #22 openbangla-keyboard-git
;; BLOCKED: COMPLEX_BUILD — Bengali input method requiring fcitx5 integration,
;; custom CMake with Rust components, and ibus support.
;; A1: fcitx5 integration; A2: Rust+CMake hybrid; A3: ibus dependency.

;; #23 trizen
;; BLOCKED: ARCH_SPECIFIC — AUR helper requiring pacman and Arch-specific Perl
;; ALPM bindings (perl-alpm).
;; A1: pacman dep; A2: perl-alpm not in Guix; A3: Arch-only.

;; #24 cosmic-comp-git
;; BLOCKED: CARGO_DEPS_NOT_AVAILABLE — COSMIC compositor; massive Rust dep tree
;; with cosmic-config, cosmic-protocols, smithay crates not in Guix.
;; A1: 10+ cosmic crates missing; A2: smithay crate tree; A3: no binary.

;; #25 linux-lqx
;; BLOCKED: CUSTOM_KERNEL — Liquorix kernel; requires kernel build
;; infrastructure not trivially portable to Guix packaging.
;; A1: kernel config/patch set; A2: DKMS interactions; A3: hardware-specific.

;; #26 vscodium-translucent
;; BLOCKED: COMPLEX_BUILD — VSCodium with transparency patches; requires nvm,
;; rustup, full Electron rebuild.
;; A1: nvm not in Guix; A2: rustup not in Guix; A3: no prebuilt binary.

;; #27 ros2-arch-deps
;; BLOCKED: ARCH_SPECIFIC — Arch-specific ROS2 build dependency meta-package;
;; 44 deps, many Arch-only.
;; A1: meta-package; A2: Arch-only deps; A3: not portable.

;; #28 ffmpeg7.1
;; BLOCKED: VERSION_COMPAT — FFmpeg 7.1 compat lib; Guix has ffmpeg 8.0,
;; packaging old version requires maintaining separate dep chain.
;; A1: Guix has newer ffmpeg; A2: old API compat complexity; A3: dep chain.

;; #29 dbeaver
;; BLOCKED: COMPLEX_JAVA_BUILD — DBeaver database tool; requires Maven build
;; with 100+ Java deps not packaged in Guix.
;; A1: Maven not in Guix; A2: 100+ Java deps; A3: Eclipse RCP framework.

;; #30 waybar-hyprland-git
;; BLOCKED: MISSING_DEP — Waybar fork with Hyprland-specific patches; requires
;; hyprland-protocols not in Guix.
;; A1: hyprland-protocols missing; A2: git-based, no release; A3: fork of waybar.

;; #31 aspnet-targeting-pack-9.0-bin
;; BLOCKED: DOTNET_ECOSYSTEM — ASP.NET targeting pack requires dotnet-runtime
;; ecosystem not available in Guix.
;; A1: dotnet-runtime dep chain; A2: .NET ecosystem; A3: version coupling.

;; #32 linux-zen-git-headers
;; BLOCKED: CUSTOM_KERNEL — Zen kernel headers from git trunk; requires kernel
;; build infrastructure.
;; A1: git trunk; A2: kernel headers build; A3: no stable release.

;; #33 vapoursynth-plugin-fmtconv
;; BLOCKED: MISSING_DEP — VapourSynth fmtconv plugin; VapourSynth in Guix but
;; plugin SDK headers and install paths not set up for external plugins.
;; A1: plugin SDK path setup; A2: VapourSynth plugin install mechanism; A3: niche.

;; #34 waydroid-image
;; BLOCKED: LARGE_BINARY_IMAGE — LineageOS Android image for Waydroid; 500+ MB
;; image file, no source build possible.
;; A1: 500+ MB binary image; A2: no source build; A3: Android system image.

;; #35 karakeep-cli
;; BLOCKED: NPM_BUILD — Karakeep CLI requires npm/node build system not
;; well-supported in Guix for complex projects.
;; A1: npm dependency tree; A2: node-build-system limitations; A3: bundled deps.

;; #36 libreoffice-extension-languagetool
;; BLOCKED: JAVA_EXTENSION — LanguageTool LibreOffice extension; requires Java
;; runtime and LibreOffice extension framework.
;; A1: Java runtime dep; A2: LO extension install mechanism; A3: 200+ MB payload.

;; #37 opencl-nvidia-390xx
;; BLOCKED: PROPRIETARY_BINARY — NVIDIA OpenCL for legacy 390xx driver; proprietary
;; binary with no redistribution rights.
;; A1: proprietary blob; A2: legacy driver; A3: no OSS alternative.

;; #38 opencl-nvidia-470xx
;; BLOCKED: PROPRIETARY_BINARY — NVIDIA OpenCL for legacy 470xx driver; proprietary
;; binary with no redistribution rights.
;; A1: proprietary blob; A2: legacy driver; A3: no OSS alternative.

;; #39 portage
;; BLOCKED: COMPLEX_PYTHON — Gentoo Portage package manager; complex Python
;; application with Gentoo-specific dep chain (sandbox, rsync, GPG).
;; A1: Gentoo-specific deps; A2: sandbox mechanism; A3: not portable.

;; #40 sdrpp-headers-git
;; BLOCKED: MISSING_DEP — SDR++ development headers; requires SDR++ (sdrpp)
;; which is not packaged in Guix.
;; A1: sdrpp not in Guix; A2: git-based; A3: header-only package needs base.

;; #41 system76-io-dkms
;; BLOCKED: DKMS_KERNEL_MODULE — System76 IO board DKMS module; requires DKMS
;; framework and running kernel headers.
;; A1: DKMS not in Guix; A2: kernel coupling; A3: hardware-specific.

;; #42 vapoursynth-plugin-vszip
;; BLOCKED: MISSING_DEP — VapourSynth vszip plugin; same plugin SDK issue as
;; fmtconv — VapourSynth plugin infrastructure not ready.
;; A1: plugin SDK path setup; A2: VapourSynth plugin install; A3: niche.

;; #43 e-imzo
;; BLOCKED: PROPRIETARY_BINARY — Uzbek government e-signature tool; proprietary
;; Java application with no source available.
;; A1: proprietary; A2: Java runtime; A3: government-specific.

;; #44 ggml-sycl-f16-git
;; BLOCKED: COMPLEX_BUILD_DEPS — GGML with Intel SYCL; requires Intel oneAPI
;; DPC++ compiler and SYCL runtime not in Guix.
;; A1: Intel oneAPI not in Guix; A2: SYCL runtime; A3: git-based.

;; #45 hypryou-utils
;; BLOCKED: MISSING_DEP — Hyprland Material You utilities; requires hyprland
;; and hyprland-protocols not in Guix.
;; A1: hyprland dep; A2: hyprland-protocols; A3: Hyprland-specific.

;; #46 itchio-dlagent
;; BLOCKED: ARCH_SPECIFIC — makepkg download agent for itch.io; requires
;; makepkg and Arch-specific DLAGENT mechanism.
;; A1: makepkg integration; A2: Arch DLAGENT; A3: Arch-only.

;; #47 libstdc++5
;; BLOCKED: LEGACY_COMPAT — GCC 3.3.6 libstdc++ compat library; extremely old
;; GCC version not buildable with modern toolchains.
;; A1: GCC 3.3.6 too old; A2: ABI compat issues; A3: no modern build path.

;; #48 libvpx1.10
;; BLOCKED: VERSION_COMPAT — libvpx 1.10 compat library; Guix has libvpx 1.15,
;; old version needed only for specific ABI compatibility.
;; A1: Guix has newer; A2: ABI compat only; A3: maintenance burden.

;; #49 php-imap
;; BLOCKED: MISSING_DEP — PHP IMAP extension; requires PHP build system and
;; c-client/UW-IMAP library not in Guix.
;; A1: PHP extension build; A2: c-client library; A3: PHP ecosystem gap.

;; #50 qt5-quick3d
;; BLOCKED: COMPLEX_BUILD — Qt5 3D module; requires Assimp, and full Qt5 build
;; infrastructure with multiple Qt5 deps.
;; A1: Assimp dep; A2: Qt5 build complexity; A3: 3D rendering deps.

;; #51 rvgl-io-cars
;; BLOCKED: GAME_ASSETS — Re-Volt car pack game assets; no source, proprietary
;; game content redistribution unclear.
;; A1: game assets; A2: redistribution unclear; A3: no source.

;; #52 sac-core
;; BLOCKED: PROPRIETARY_BINARY — Thales SafeNet Authentication Client;
;; proprietary binary with no redistribution rights.
;; A1: proprietary; A2: no source; A3: hardware token specific.

;; #53 samsung-unified-driver-printer
;; BLOCKED: PROPRIETARY_BINARY — Samsung printer driver; proprietary binary with
;; Samsung-specific PPD files.
;; A1: proprietary binary; A2: Samsung-specific; A3: no OSS alternative.

;; #54 vivaldi-snapshot-ffmpeg-codecs
;; BLOCKED: COMPLEX_BUILD — FFmpeg codecs for Vivaldi snapshot; requires matching
;; Chromium source tree build for codec extraction.
;; A1: Chromium source; A2: version coupling; A3: snapshot-specific.

;; #55 dosh-cqfd
;; BLOCKED: MISSING_DEP — dosh/cqfd Docker wrapper; requires Docker runtime and
;; cqfd tool not in Guix.
;; A1: Docker runtime; A2: cqfd not in Guix; A3: container-specific.

;; #56 samsung-unified-driver-scanner
;; BLOCKED: PROPRIETARY_BINARY — Samsung scanner driver; proprietary binary,
;; requires SANE backend integration.
;; A1: proprietary; A2: Samsung-specific; A3: SANE integration complex.

;; #57 subtitles-contact-sheet-qt-cli
;; BLOCKED: MISSING_DEP — Subtitle contact sheet tool; requires python-opencv
;; and Qt5 bindings combination not in Guix.
;; A1: python-opencv dep; A2: Qt5 Python bindings; A3: complex media deps.

;; #58 themix-plugin-base16-git
;; BLOCKED: MISSING_DEP — Themix Base16 plugin; requires themix-gui base
;; application which is not in Guix.
;; A1: themix-gui base missing; A2: plugin architecture; A3: git-based.

;; #59 tzpfms
;; BLOCKED: MISSING_DEP — TPM-based encryption for ZFS; requires ZFS kernel
;; module and TPM2 tools integration.
;; A1: ZFS not in Guix kernel; A2: TPM2 integration; A3: kernel module dep.

;; #60 yaycache
;; BLOCKED: ARCH_SPECIFIC — Yay cache cleaner; requires yay and pacman cache
;; structure specific to Arch Linux.
;; A1: yay/pacman dep; A2: Arch cache structure; A3: Arch-only.

;; #61 zectl
;; BLOCKED: MISSING_DEP — ZFS Boot Environment manager; requires ZFS kernel
;; module and libzfs not available in Guix.
;; A1: ZFS not in Guix; A2: libzfs dep; A3: boot management complexity.

;; #62 cosmic-idle-git
;; BLOCKED: CARGO_DEPS_NOT_AVAILABLE — COSMIC idle daemon; requires cosmic crate
;; ecosystem not in Guix.
;; A1: cosmic crates missing; A2: Rust dep tree; A3: no binary release.

;; #63 cosmic-screenshot-git
;; BLOCKED: CARGO_DEPS_NOT_AVAILABLE — COSMIC screenshot utility; requires cosmic
;; crate ecosystem.
;; A1: cosmic crates missing; A2: Rust dep tree; A3: no binary release.

;; #64 emacs-mozc
;; BLOCKED: COMPLEX_BUILD — Emacs Mozc module; requires Mozc build (bazel) and
;; Emacs integration.
;; A1: bazel build; A2: Mozc build complexity; A3: Japanese input method.

;; #65 eprosima-fast-dds
;; BLOCKED: MISSING_DEP — eProsima Fast DDS; requires foonathan-memory, fast-cdr,
;; and asio libraries not packaged in Guix.
;; A1: foonathan-memory missing; A2: fast-cdr missing; A3: complex DDS middleware.

;; #66 eww
;; BLOCKED: CARGO_DEPS_NOT_AVAILABLE — Elkowar's Wacky Widgets; requires GTK4
;; layer-shell Rust bindings (gtk4-layer-shell) not in Guix crate set.
;; A1: gtk4-layer-shell crate missing; A2: Wayland-specific; A3: GTK4 bindings.

;; #67 kanidm-unixd-clients
;; BLOCKED: CARGO_DEPS_NOT_AVAILABLE — Kanidm UNIX client; requires kanidm-proto
;; and kanidm-client Rust crates not in Guix.
;; A1: kanidm crates missing; A2: complex auth system; A3: no binary release.

;; #68 lib32-libvmaf
;; BLOCKED: LIB32_NOT_SUPPORTED — 32-bit libvmaf; Guix does not support lib32
;; multilib packaging.
;; A1: lib32 not supported; A2: multilib mechanism missing; A3: niche use.

;; #69 powershell
;; BLOCKED: DOTNET_ECOSYSTEM — PowerShell requires .NET runtime and self-contained
;; .NET build system not available in Guix.
;; A1: .NET runtime; A2: complex build; A3: NuGet package manager.

;; #70 python-loro
;; BLOCKED: MISSING_DEP — Python bindings for Loro CRDT; requires maturin (Rust)
;; build backend and Loro Rust crate tree.
;; A1: maturin build; A2: Loro Rust crate missing; A3: Rust+Python hybrid.

;; #71 tvbrowser
;; BLOCKED: COMPLEX_JAVA_BUILD — Java TV guide application; requires Java 17+
;; with JavaFX and multiple Java plugin deps.
;; A1: JavaFX dep; A2: Java plugin system; A3: 200+ MB download.

;; #72 cosmic-app-library-git
;; BLOCKED: CARGO_DEPS_NOT_AVAILABLE — COSMIC app launcher; requires cosmic crate
;; ecosystem.
;; A1: cosmic crates missing; A2: iced toolkit crates; A3: no binary.

;; #73 cosmic-panel-git
;; BLOCKED: CARGO_DEPS_NOT_AVAILABLE — COSMIC panel; requires cosmic crate
;; ecosystem and xdg-shell-wrapper.
;; A1: cosmic crates; A2: xdg-shell-wrapper; A3: no binary.

;; #74 gcc10-libs
;; BLOCKED: VERSION_COMPAT — GCC 10 runtime libraries; Guix has gcc-toolchain@10
;; but extracting just libs requires custom split.
;; A1: lib extraction complex; A2: gcc-toolchain@10 exists; A3: ABI compat only.

;; #75 kanidm-clients
;; BLOCKED: CARGO_DEPS_NOT_AVAILABLE — Kanidm client tools; same crate tree issue
;; as kanidm-unixd-clients.
;; A1: kanidm crates missing; A2: complex auth; A3: no binary.

;; #76 kanidm-server
;; BLOCKED: CARGO_DEPS_NOT_AVAILABLE — Kanidm identity server; massive Rust dep
;; tree with custom crates.
;; A1: kanidm crates; A2: 100+ crate deps; A3: no binary release.

;; #77 lib32-lapack
;; BLOCKED: LIB32_NOT_SUPPORTED — 32-bit LAPACK; Guix does not support lib32
;; multilib packaging.
;; A1: lib32 not supported; A2: Guix has 64-bit lapack; A3: niche use.

;; #78 memoria-daemon
;; BLOCKED: CARGO_DEPS_NOT_AVAILABLE — Memoria clipboard daemon; requires
;; custom Rust crates for clipboard management.
;; A1: custom crates; A2: systemd user service integration; A3: niche.

;; #79 paru-git
;; BLOCKED: ARCH_SPECIFIC — Paru AUR helper from git; requires pacman/libalpm
;; Rust bindings and Arch-specific makepkg.
;; A1: pacman dep; A2: libalpm-rs crate; A3: Arch-only.

;; #80 ps3-psl1ght
;; BLOCKED: COMPLEX_TOOLCHAIN — PSL1GHT PS3 SDK; requires ps3dev cross-compilation
;; toolchain (powerpc64-ps3-elf-gcc).
;; A1: cross-toolchain; A2: ps3dev ecosystem; A3: niche hardware.

;; #81 sleuthkit-java
;; BLOCKED: COMPLEX_JAVA_BUILD — Java bindings for Sleuth Kit; requires
;; Sleuth Kit C library plus JNI compilation.
;; A1: sleuthkit not in Guix; A2: JNI build; A3: forensics niche.

;; #82 themix-import-images-git
;; BLOCKED: MISSING_DEP — Themix image import plugin; requires themix-gui base
;; application which is not in Guix.
;; A1: themix-gui base missing; A2: plugin architecture; A3: git-based.

;; #83 boost-65-compat-libs
;; BLOCKED: VERSION_COMPAT — Boost 1.65 compat libraries; extremely old version,
;; Guix has boost 1.89.  Building old boost with modern toolchain problematic.
;; A1: Boost 1.65 too old; A2: Guix has 1.89; A3: ABI compat only.

;; #84 cosmic-workspaces-git
;; BLOCKED: CARGO_DEPS_NOT_AVAILABLE — COSMIC workspaces manager; requires cosmic
;; crate ecosystem.
;; A1: cosmic crates; A2: iced toolkit; A3: no binary.

;; #85 easytier-cli
;; BLOCKED: CARGO_DEPS_NOT_AVAILABLE — EasyTier mesh VPN CLI; requires custom
;; Rust crates (easytier-core) not in Guix.
;; A1: easytier-core crate; A2: WireGuard integration; A3: complex dep tree.

;; #86 mdcat
;; BLOCKED: CARGO_DEPS_NOT_AVAILABLE — Sophisticated Markdown terminal renderer;
;; requires pulldown-cmark, syntect, and other Rust crates not all in Guix.
;; A1: syntect crate tree; A2: pulldown-cmark version; A3: terminal integration.
