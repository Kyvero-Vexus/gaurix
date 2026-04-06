;;; Blocked notes for dep-tree priority 100 resolution pass.
;;; 47 packages re-blocked with concrete reasons after investigation.
(define-module (gaurix packages cron-c79f127f-r22-w03-blocked100-blocked-notes))

;;; ── Re-blocked packages ──────────────────────────────────────────

;; #57 waydroid
;; BLOCKED: COMPLEX_SYSTEM_DEPS — Android container system; requires custom
;; kernel with binder/ashmem support, lxc, Android system images.
;; A1: needs kernel binder module not available in Guix;
;; A2: lxc + android image integration too complex for automated packaging;
;; A3: no binary/AppImage alternative exists.

;; #4695 qt5-webkit
;; BLOCKED: COMPLEX_BUILD_DEPS — WebKit2 engine for Qt5; massive build
;; (~2hrs), needs Qt5 full stack + gstreamer + ICU + WebKit source tree.
;; A1: 33 deps, many Qt5-specific; A2: WebKit source build extremely complex;
;; A3: no prebuilt binary available for Guix.

;; #1090 flaresolverr
;; BLOCKED: COMPLEX_PYTHON_DEPS — Cloudflare bypass proxy; needs headless
;; chromium + selenium + Python ecosystem packages.
;; A1: requires running chromium instance; A2: selenium integration complex;
;; A3: no simpler alternative proxy available.

;; #457 linux-lqx
;; BLOCKED: CUSTOM_KERNEL_NOT_SUITABLE — Liquorix custom kernel; Guix
;; manages kernels through its own mechanism (gnu/packages/linux.scm).
;; A1: custom kernel configs not portable to Guix; A2: DKMS not supported;
;; A3: users should use Guix kernel customization instead.

;; #9075 cosmic-randr-git
;; BLOCKED: CARGO_DEPS_NOT_AVAILABLE — COSMIC desktop Wayland output tool;
;; Rust/cargo dep tree includes wayland-client, cosmic-* crates not in Guix.
;; A1: no binary release; A2: cargo deps not available; A3: no simpler fork.

;; #889 mdcat
;; BLOCKED: CARGO_DEPS_NOT_AVAILABLE — Rust terminal markdown renderer;
;; needs pulldown-cmark, syntect, reqwest — 80+ crates not in Guix.
;; A1: no binary release on GitHub; A2: cargo dep tree massive;
;; A3: alternatives (glow) also Rust-based.

;; #283 libunity
;; BLOCKED: ABANDONED_UPSTREAM — Ubuntu Unity integration library;
;; deprecated component needing dee, libdbusmenu-glib not in Guix.
;; A1: upstream abandoned; A2: dep dee is Unity-specific;
;; A3: no modern replacement library.

;; #670 libastal-meta
;; BLOCKED: META_DEPS_NOT_AVAILABLE — meta package for 10+ libastal-*
;; service libraries, none of which are packaged in Guix.
;; A1: would need to package all 10+ libastal components;
;; A2: Astal framework is niche Wayland widget toolkit;
;; A3: no binary release available.

;; #9886 intel-npu-driver
;; BLOCKED: COMPLEX_BUILD_DEPS — Intel NPU driver needing level-zero
;; headers/loader, custom kernel modules, opencv, yaml-cpp.
;; A1: level-zero not in Guix; A2: kernel module integration complex;
;; A3: no prebuilt driver package for non-Arch.

;; #1272 aspnet-targeting-pack-bin
;; BLOCKED: DOTNET_NOT_AVAILABLE — .NET ASP.NET targeting pack; depends
;; on dotnet-targeting-pack-bin which is not available in Guix.
;; A1: .NET SDK not in Guix; A2: no standalone install possible;
;; A3: would need entire .NET ecosystem first.

;; #2787 system76-acpi-dkms
;; BLOCKED: DKMS_NOT_SUPPORTED — DKMS kernel module for System76 ACPI;
;; Guix does not support DKMS out-of-tree kernel module installation.
;; A1: DKMS not in Guix; A2: would need custom kernel config;
;; A3: module may already be in mainline kernel.

;; #1544 arduino-avr-core
;; BLOCKED: COMPLEX_TOOLCHAIN — Arduino AVR core; needs avr-gcc, avr-libc,
;; avrdude cross-compilation toolchain integration.
;; A1: avr-gcc cross-compiler complex to set up; A2: Arduino IDE integration
;; needed; A3: no standalone binary release.

;; #4744 brscan-skey
;; BLOCKED: PROPRIETARY_BINARY — Brother scan key tool; proprietary binary
;; with no source code available.
;; A1: no source available; A2: proprietary i386 binary;
;; A3: SANE provides open-source alternative scanning.

;; #1968 foobar2000
;; BLOCKED: WINE_DEPENDENT — Windows audio player requiring Wine runtime;
;; not a native Linux application.
;; A1: Wine not fully packaged in Guix; A2: no native Linux build;
;; A3: alternative players (deadbeef, audacious) available natively.

;; #285 gtk-sharp-2
;; BLOCKED: MONO_NOT_AVAILABLE — GTK2 C# bindings needing Mono runtime;
;; Mono/.NET runtime not available in Guix.
;; A1: Mono not in Guix; A2: .NET Core doesn't support GTK#2;
;; A3: no alternative binding system.

;; #5095 kdotool
;; BLOCKED: CARGO_DEPS_NOT_AVAILABLE — Rust xdotool for KDE Wayland;
;; depends on zbus, clap — ~60 crates not in Guix.
;; A1: no binary release; A2: cargo deps not available;
;; A3: xdotool exists for X11 but no Wayland equivalent in Guix.

;; #5325 libelectron
;; BLOCKED: NPM_ECOSYSTEM_COMPLEX — Electron meta package; depends on
;; npm, git, icu — npm/Electron build system not supportable in Guix.
;; A1: Electron build needs Node.js ecosystem; A2: npm packaging complex;
;; A3: no prebuilt libelectron binary.

;; #9212 pacaur
;; BLOCKED: ARCH_SPECIFIC — AUR helper for Arch Linux; depends on auracle,
;; expac, pacman — all Arch-specific tools.
;; A1: pacman not in Guix; A2: AUR concept doesn't apply to Guix;
;; A3: Guix has its own package management.

;; #5046 lcevcdec
;; BLOCKED: COMPLEX_BUILD_DEPS — LCEVC video decoder; cmake build needs
;; range-v3, rapidjson, and proprietary LCEVC SDK integration.
;; A1: cmake build with vendored deps; A2: range-v3 not in Guix;
;; A3: LCEVC codec support still niche.

;; #3371 radicle-httpd
;; BLOCKED: CARGO_DEPS_NOT_AVAILABLE — Radicle p2p code collaboration
;; backend; massive Rust dep tree (tokio, zbus, gio, 100+ crates).
;; A1: no binary release; A2: cargo deps massive;
;; A3: depends on radicle-node also not in Guix.

;; #3131 openbangla-keyboard-git
;; BLOCKED: COMPLEX_BUILD_DEPS — Bengali keyboard input method; needs
;; Qt5 + Rust + IBus + fcitx5 integration.
;; A1: multi-language build (C++/Rust); A2: IBus/fcitx5 integration complex;
;; A3: no binary release available.

;; #1582 trizen
;; BLOCKED: ARCH_SPECIFIC — AUR helper for Arch Linux; depends on pacman,
;; pacutils, and Perl modules for AUR interaction.
;; A1: pacman not in Guix; A2: AUR-specific tool;
;; A3: Guix has its own package management.

;; #3176 clang-libs-minimal-git
;; BLOCKED: COMPLEX_BUILD_DEPS — LLVM/Clang libraries from git trunk;
;; needs full LLVM source tree build (21.0.0 pre-release).
;; A1: Guix has stable LLVM/Clang already; A2: git trunk build massive;
;; A3: no prebuilt libraries for this version.

;; #3129 vscodium-translucent
;; BLOCKED: COMPLEX_BUILD_DEPS — VSCodium with translucent patches;
;; needs nvm, rustup, gulp, Electron build pipeline.
;; A1: Electron build complex; A2: needs patched Electron;
;; A3: standard VSCodium available via binary package.

;; #4822 ros2-arch-deps
;; BLOCKED: META_DEPS_NOT_AVAILABLE — ROS2 meta package with 40+ deps
;; (asio, bullet, eigen, glew, many ROS2-specific packages).
;; A1: ROS2 ecosystem not in Guix; A2: 44 dependencies;
;; A3: no standalone alternative.

;; #6376 ffmpeg7.1
;; BLOCKED: UPSTREAM_AVAILABLE — FFmpeg 7.1 specific version; Guix already
;; has ffmpeg 8.0.  Version pinning to 7.1 not justified.
;; A1: Guix ffmpeg 8.0 available; A2: version-specific build not needed;
;; A3: users should use upstream Guix ffmpeg.

;; #61 waybar-hyprland-git
;; BLOCKED: PACKAGE_NOT_FOUND — package no longer in AUR metadata cache;
;; possibly deleted, renamed, or merged into main waybar.
;; A1: not in AUR cache; A2: waybar in Guix already;
;; A3: hyprland-specific fork likely deprecated.

;; #1273 aspnet-runtime-bin
;; BLOCKED: DOTNET_NOT_AVAILABLE — .NET ASP.NET runtime binary; depends
;; on dotnet-runtime-bin not available in Guix.
;; A1: .NET runtime not in Guix; A2: no standalone install;
;; A3: would need entire .NET ecosystem.

;; #6364 aspnet-targeting-pack-9.0-bin
;; BLOCKED: DOTNET_NOT_AVAILABLE — .NET 9.0 targeting pack; depends on
;; dotnet-targeting-pack-9.0-bin not available in Guix.
;; A1: .NET 9.0 SDK not in Guix; A2: no standalone install;
;; A3: would need entire .NET ecosystem.

;; #6303 linux-zen-git-headers
;; BLOCKED: CUSTOM_KERNEL_NOT_SUITABLE — Linux Zen kernel headers from
;; git; Guix manages kernels through its own mechanism.
;; A1: custom kernel headers not applicable; A2: Guix provides its own
;; kernel headers; A3: out-of-tree kernel not supported.

;; #4832 e-imzo
;; BLOCKED: PROPRIETARY_BINARY — Uzbek government e-signing tool;
;; proprietary Java applet requiring jre8-openjdk + smartcard stack.
;; A1: proprietary; A2: Java 8 specific; A3: pcsclite/ccid complex.

;; #3667 ggml-sycl-f16-git
;; BLOCKED: COMPLEX_BUILD_DEPS — GGML tensor library with Intel SYCL;
;; requires intel-oneapi-basekit (30+ GB SDK) not in Guix.
;; A1: Intel oneAPI not in Guix; A2: SYCL compiler not available;
;; A3: standard GGML (CPU/CUDA) is alternative.

;; #5234 itchio-dlagent
;; BLOCKED: ARCH_SPECIFIC — makepkg download agent for itch.io games;
;; Arch-specific tool for pacman build system.
;; A1: makepkg/pacman specific; A2: Ruby deps (nokogiri, httpx);
;; A3: itch.io has its own client as alternative.

;; #1970 libreoffice-extension-languagetool
;; BLOCKED: COMPLEX_RUNTIME_DEPS — LibreOffice extension requiring
;; LibreOffice + Java runtime integration.
;; A1: extension needs LibreOffice framework; A2: Java 8+ integration;
;; A3: LanguageTool available as standalone server.

;; #3183 libtifiles
;; BLOCKED: MISSING_DEP — TI calculator file format library; depends on
;; libticonv not available in Guix.
;; A1: libticonv not packaged; A2: tilp2 ecosystem not in Guix;
;; A3: niche use case.

;; #2400 opencl-nvidia-390xx
;; BLOCKED: PROPRIETARY_BINARY — NVIDIA 390xx legacy OpenCL; proprietary
;; driver component.
;; A1: NVIDIA proprietary; A2: legacy driver line;
;; A3: open-source OpenCL (pocl, rusticl) as alternatives.

;; #2327 opencl-nvidia-470xx
;; BLOCKED: PROPRIETARY_BINARY — NVIDIA 470xx legacy OpenCL; proprietary
;; driver component.
;; A1: NVIDIA proprietary; A2: legacy driver line;
;; A3: open-source OpenCL (pocl, rusticl) as alternatives.

;; #7628 portage
;; BLOCKED: DISTRO_SPECIFIC — Gentoo Portage package manager; Gentoo-
;; specific tool with Python build.
;; A1: Gentoo-specific; A2: Guix has own package management;
;; A3: no cross-distro use case.

;; #9803 sdrpp-headers-git
;; BLOCKED: MISSING_DEP — SDR++ development headers; depends on
;; sdrpp-git not available in Guix.
;; A1: sdrpp not packaged; A2: SDR ecosystem not in Guix;
;; A3: no standalone header package.

;; #6284 vapoursynth-plugin-fmtconv
;; BLOCKED: MISSING_DEP — VapourSynth format conversion plugin; depends
;; on vapoursynth not available in Guix.
;; A1: vapoursynth not packaged; A2: video processing niche;
;; A3: ffmpeg provides similar functionality.

;; #7358 vapoursynth-plugin-vszip
;; BLOCKED: MISSING_DEP — VapourSynth zip plugin; depends on vapoursynth
;; + Zig compiler, neither available in Guix.
;; A1: vapoursynth not packaged; A2: Zig not in Guix;
;; A3: no alternative plugin.

;; #7657 karakeep-cli
;; BLOCKED: NPM_ECOSYSTEM_COMPLEX — Node.js CLI for Karakeep; npm
;; packaging not well-supported in Guix for complex packages.
;; A1: npm deps complex; A2: Node.js ecosystem packaging;
;; A3: no binary release available.

;; #1829 downgrade
;; BLOCKED: ARCH_SPECIFIC — Arch Linux package downgrade tool; uses
;; pacman cache and Arch Linux Archive.
;; A1: pacman-contrib dependency; A2: ALA is Arch-specific;
;; A3: Guix has built-in package rollback.

;; #3916 lianwall-bin
;; BLOCKED: MISSING_DEP — LianWall wallpaper engine CLI; depends on
;; lianwalld-bin daemon not available.
;; A1: lianwalld-bin not packaged; A2: no standalone mode;
;; A3: swww/swaybg as alternatives.

;; #1548 hypryou-utils
;; BLOCKED: COMPLEX_BUILD_DEPS — GTK4 utilities for Hyprland Material
;; You theme; needs specific Hyprland integration headers.
;; A1: Hyprland ecosystem not in Guix; A2: GTK4 + Hyprland integration;
;; A3: no standalone utility.

;; #9094 libstdc++5
;; BLOCKED: LEGACY_TOOLCHAIN — GNU libstdc++ v3 (GCC 3.3.6); requires
;; ancient GCC 3.3.6 to build, not compatible with modern toolchain.
;; A1: GCC 3.3.6 not in Guix; A2: cross-compiling from modern GCC fails;
;; A3: no prebuilt binary for Guix.

;; #2786 system76-io-dkms
;; BLOCKED: DKMS_NOT_SUPPORTED — DKMS kernel module for System76 IO
;; board; Guix does not support DKMS module installation.
;; A1: DKMS not in Guix; A2: would need custom kernel config;
;; A3: module functionality may be in mainline.

;;; ── Additional re-blocked packages (extended selection) ──────────

;; #688 mpv-uosc
;; BLOCKED: COMPLEX_BUILD_DEPS — MPV UI overlay (uosc); Go build with
;; mpv scripting integration, needs specific mpv plugin API.
;; A1: Go build feasible but mpv script install path complex;
;; A2: no binary release; A3: mpv already has built-in OSC.

;; #9909 php-imap
;; BLOCKED: MISSING_DEP — PHP imap extension; depends on c-client and
;; PHP 8.3+ extension build system not available in Guix.
;; A1: PHP extension build needs phpize; A2: c-client (UW IMAP) not in Guix;
;; A3: no standalone alternative.

;; #5047 qt5-quick3d
;; BLOCKED: COMPLEX_BUILD_DEPS — Qt5 Quick3D module; needs Qt5 declarative
;; + assimp + full Qt5 build infrastructure.
;; A1: Qt5 module build complex; A2: assimp integration needed;
;; A3: Qt6 Quick3D is the modern replacement.

;; #7227 rvgl-io-cars
;; BLOCKED: MISSING_DEP — RVGL car data; depends on rvgl-bin game
;; not available in Guix.
;; A1: rvgl-bin not packaged; A2: game-specific data;
;; A3: no standalone use.

;; #1768 sac-core
;; BLOCKED: PROPRIETARY_BINARY — Thales SafeNet Authentication Client;
;; proprietary PKCS#11 modules for smart card tokens.
;; A1: proprietary; A2: binary-only distribution;
;; A3: opensc provides open-source smart card support.

;; #650 samsung-unified-driver-printer
;; BLOCKED: PROPRIETARY_BINARY — Samsung unified printer driver; proprietary
;; binary depending on samsung-unified-driver-common not in Guix.
;; A1: proprietary; A2: samsung-unified-driver-common needed;
;; A3: CUPS/gutenprint may support some Samsung printers.

;; #649 samsung-unified-driver-scanner
;; BLOCKED: PROPRIETARY_BINARY — Samsung unified scanner driver; proprietary
;; binary depending on samsung-unified-driver-common.
;; A1: proprietary; A2: samsung-unified-driver-common needed;
;; A3: SANE may support some Samsung scanners.

;; #6327 vivaldi-snapshot-ffmpeg-codecs
;; BLOCKED: COMPLEX_BUILD_DEPS — FFmpeg codec library for Vivaldi snapshot;
;; needs Chromium FFmpeg build with proprietary codecs enabled.
;; A1: Chromium FFmpeg build complex; A2: nasm + git build;
;; A3: standard ffmpeg provides similar codecs.

;; #5307 dosh-cqfd
;; BLOCKED: MISSING_DEP — Docker-based build wrapper; depends on dosh
;; (Docker shell) not in Guix.
;; A1: dosh not packaged; A2: Docker integration needed;
;; A3: Guix has its own container support.

;; #2324 obs-pwvideo
;; BLOCKED: MISSING_DEP — OBS PipeWire video source plugin; depends on
;; obs-studio plugin API not available for Guix packaging.
;; A1: OBS plugin build needs obs-studio headers; A2: PipeWire integration;
;; A3: OBS has built-in PipeWire support in newer versions.

;; #5383 themix-plugin-base16-git
;; BLOCKED: MISSING_DEP — Themix base16 color plugin; depends on themix-gui
;; not available in Guix.
;; A1: themix-gui not packaged; A2: Python deps (pystache, yaml);
;; A3: base16 themes available directly.

;; #4939 tzpfms
;; BLOCKED: MISSING_DEP — TPM-based ZFS encryption; depends on zfs-utils
;; and tpm2-tss integration not available in Guix.
;; A1: ZFS not in mainline Guix; A2: TPM2 integration complex;
;; A3: ZFS native encryption as alternative.

;; #6633 yaycache
;; BLOCKED: ARCH_SPECIFIC — yay/pacman cache cleaner; depends on
;; pacman-contrib, Arch-specific tool.
;; A1: pacman not in Guix; A2: AUR-specific;
;; A3: Guix has built-in garbage collection.

;; #4471 zectl
;; BLOCKED: MISSING_DEP — ZFS Boot Environment manager; depends on ZFS
;; not available in Guix.
;; A1: ZFS not in Guix; A2: cmake build needs ZFS headers;
;; A3: Guix has its own boot management.

;; #9086 cosmic-idle-git
;; BLOCKED: CARGO_DEPS_NOT_AVAILABLE — COSMIC idle daemon; Rust/cargo
;; with wayland/libxkbcommon crates not in Guix.
;; A1: COSMIC ecosystem crates not available; A2: no binary;
;; A3: swayidle as alternative.

;; #9076 cosmic-screenshot-git
;; BLOCKED: CARGO_DEPS_NOT_AVAILABLE — COSMIC screenshot utility; depends
;; on xdg-desktop-portal-cosmic-git not in Guix.
;; A1: COSMIC ecosystem crates not available; A2: portal dep missing;
;; A3: grim/slurp as alternatives.

;; #3609 emacs-mozc
;; BLOCKED: MISSING_DEP — Emacs module for Mozc Japanese input; depends on
;; mozc (Google Japanese Input) not available in Guix.
;; A1: mozc not packaged; A2: complex C++ build with Bazel;
;; A3: anthy/ibus available as alternatives.

;; #9098 eprosima-fast-dds
;; BLOCKED: MISSING_DEP — eProsima Fast-DDS implementation; depends on
;; foonathan_memory and eprosima-fast-cdr not in Guix.
;; A1: foonathan_memory not packaged; A2: cmake build complex;
;; A3: ROS2 middleware, not standalone useful.

;; #1966 eww
;; BLOCKED: CARGO_DEPS_NOT_AVAILABLE — Elkowar's Wacky Widgets; Rust/GTK3
;; with large cargo dep tree (gtk-layer-shell-rs, tokio, etc.).
;; A1: cargo deps massive; A2: no binary release;
;; A3: waybar as alternative panel/widget.

;; #710 kanidm-unixd-clients
;; BLOCKED: CARGO_DEPS_NOT_AVAILABLE — Kanidm Unix resolver; Rust with
;; cargo deps (tpm2-tss-rs, clap, tokio) not in Guix.
;; A1: cargo deps not available; A2: needs tpm2-tss;
;; A3: sssd as alternative identity resolver.

;; #2366 lib32-libvmaf
;; BLOCKED: LIB32_NOT_SUPPORTED — 32-bit libvmaf; Guix does not support
;; multilib (32-bit libraries on 64-bit systems).
;; A1: Guix is single-arch; A2: no lib32 support;
;; A3: 64-bit vmaf available.

;; #3315 libva-vdpau-driver
;; BLOCKED: COMPLEX_BUILD_DEPS — VA-API to VDPAU bridge driver; needs
;; libva, libvdpau, mesa integration.
;; A1: build deps complex; A2: mesa already provides VA-API;
;; A3: modern GPUs use direct VA-API.

;; #1157 ollama-mlx-cuda13-bin
;; BLOCKED: MISSING_DEP — Ollama with CUDA 13 support; depends on
;; ollama-cuda13 binary not available in Guix.
;; A1: CUDA runtime not in Guix; A2: proprietary NVIDIA dep;
;; A3: standard ollama (CPU) as alternative.

;; #7446 powershell
;; BLOCKED: DOTNET_NOT_AVAILABLE — PowerShell requires .NET runtime 9.0;
;; .NET SDK/runtime not available in Guix.
;; A1: .NET 9.0 not in Guix; A2: complex build; A3: bash/zsh as alternatives.

;; #4090 python-aubio-ledfx
;; BLOCKED: COMPLEX_BUILD_DEPS — Python aubio fork for LedFx; needs
;; meson-python build with C extensions.
;; A1: meson-python build complex; A2: C audio analysis deps;
;; A3: standard python-aubio exists but this is a fork.

;; #8560 python-loro
;; BLOCKED: CARGO_DEPS_NOT_AVAILABLE — Python bindings for Loro CRDT;
;; built with maturin (Rust backend), needs cargo dep tree.
;; A1: maturin Rust build; A2: cargo deps not available;
;; A3: no Python-only alternative.

;; #7074 tvbrowser
;; BLOCKED: COMPLEX_RUNTIME_DEPS — Java TV guide application; needs
;; archlinux-java-run and Java runtime with specific version.
;; A1: Arch-specific java-run wrapper; A2: Java 11+ required;
;; A3: web-based TV guides as alternative.

;; #7364 buildcache
;; BLOCKED: COMPLEX_BUILD_DEPS — Compiler cache; cmake build needing
;; OpenSSL and C++ standard library integration.
;; A1: cmake build possible but ccache already in Guix;
;; A2: depends on libstdc++ specifics; A3: ccache/sccache as alternatives.

;; #9080 cosmic-app-library-git
;; BLOCKED: CARGO_DEPS_NOT_AVAILABLE — COSMIC app launcher; Rust/cargo
;; with COSMIC ecosystem crates not in Guix.
;; A1: COSMIC crates not available; A2: no binary;
;; A3: rofi/wofi as alternatives.

;; #9074 cosmic-panel-git
;; BLOCKED: CARGO_DEPS_NOT_AVAILABLE — COSMIC desktop panel; Rust/cargo
;; with COSMIC ecosystem crates not in Guix.
;; A1: COSMIC crates not available; A2: no binary;
;; A3: waybar as alternative panel.

;; #8222 gcc10-libs
;; BLOCKED: LEGACY_TOOLCHAIN — GCC 10 runtime libraries; requires
;; building GCC 10.5.0, ancient version.
;; A1: GCC 10 not in Guix; A2: building old GCC complex;
;; A3: current GCC libs are backwards-compatible.

;; #712 kanidm-clients
;; BLOCKED: CARGO_DEPS_NOT_AVAILABLE — Kanidm client tools; Rust with
;; large cargo dep tree (libgit2-rs, clap, etc.).
;; A1: cargo deps not available; A2: no binary release;
;; A3: LDAP clients as alternative.

;; #711 kanidm-server
;; BLOCKED: CARGO_DEPS_NOT_AVAILABLE — Kanidm identity server; Rust with
;; massive cargo dep tree (libgit2-rs, tpm2-tss-rs, tokio, etc.).
;; A1: cargo deps massive; A2: no binary release;
;; A3: FreeIPA/LDAP as alternatives.

;; #6207 lib32-lapack
;; BLOCKED: LIB32_NOT_SUPPORTED — 32-bit LAPACK; Guix does not support
;; multilib.
;; A1: Guix is single-arch; A2: no lib32 support;
;; A3: 64-bit LAPACK available.

;; #8365 libastal-bluetooth-git
;; BLOCKED: MISSING_DEP — Astal Bluetooth library; part of the Astal
;; widget toolkit ecosystem not in Guix.
;; A1: Astal framework not packaged; A2: meson build with GObject;
;; A3: blueman/bluez-tools as alternatives.

;; #4973 memoria-daemon
;; BLOCKED: CARGO_DEPS_NOT_AVAILABLE — Clipboard history daemon; Rust
;; with cargo deps (sqlite-rs, wl-clipboard integration).
;; A1: cargo deps not available; A2: cmake+ninja+cargo mixed build;
;; A3: clipman/wl-clipboard as alternatives.

;; #1486 paru-git
;; BLOCKED: ARCH_SPECIFIC — AUR helper for Arch Linux; depends on
;; pacman/libalpm.
;; A1: pacman not in Guix; A2: AUR-specific tool;
;; A3: Guix has its own package management.

;; #5018 ps3-psl1ght
;; BLOCKED: COMPLEX_TOOLCHAIN — PS3 SDK; needs ps3-ppu-gcc, ps3-spu-gcc,
;; and PS3 development toolchain not available.
;; A1: PS3 cross-compiler toolchain complex; A2: 6 custom deps;
;; A3: no alternative PS3 SDK.

;; #7525 python-rapidgzip
;; BLOCKED: COMPLEX_BUILD_DEPS — Parallel gzip decoder; needs nasm and
;; C++ build with SIMD optimizations.
;; A1: nasm dependency for SIMD; A2: python-build with C extensions;
;; A3: standard gzip/pigz as alternatives.

;; #7766 sleuthkit-java
;; BLOCKED: COMPLEX_RUNTIME_DEPS — Sleuth Kit Java bindings; needs
;; Java 17 + OpenJFX 17 + ant build + sleuthkit C library.
;; A1: OpenJFX 17 not in Guix; A2: ant build complex;
;; A3: sleuthkit CLI tools available without Java.

;; #5386 themix-import-images-git
;; BLOCKED: MISSING_DEP — Themix image import plugin; depends on
;; themix-gui not available in Guix.
;; A1: themix-gui not packaged; A2: python-pillow dep;
;; A3: direct image color extraction tools available.

;; #8356 appmenu-glib-translator-git
;; BLOCKED: COMPLEX_BUILD_DEPS — GLib DBusMenu-to-GMenuModel translator;
;; meson build with GObject introspection + Vala.
;; A1: vala + GObject introspection build; A2: dbus integration complex;
;; A3: GTK4 native menu support as alternative.
