;;; Blocked notes for dependency-tree-driven resolver — 2026-04-07.
(define-module (gaurix packages queue-20260407-deptree-resolver-blocked-notes)
  #:export (queue-20260407-deptree-resolver-blocked-notes))

(define queue-20260407-deptree-resolver-blocked-notes
  (list
   '(archlinux-java-run
     reason: "ARCH_SPECIFIC_TOOL"
     details: "Arch Linux Java Application Launcher. Shell script wrapper that manages Java alternatives using Arch-specific /usr/lib/jvm paths and archlinux-java tooling. Not applicable to Guix (Guix uses its own JDK profile mechanism)."
     attempts: ("1. Reviewed PKGBUILD: pure shell script depending on bash and java-runtime"
                "2. Analyzed logic: hardcoded Arch /usr/lib/jvm paths, reads /etc/java-default"
                "3. Conclusion: fundamentally Arch-specific, no portable equivalent"))

   '(yay
     reason: "ARCH_SPECIFIC_TOOL"
     details: "Pacman wrapper and AUR helper written in Go. Requires pacman, makepkg, and AUR infrastructure. Not applicable to Guix."
     attempts: ("1. Reviewed source: Go binary wrapping pacman for AUR operations"
                "2. Checked deps: go, pacman, git — pacman is Arch-specific"
                "3. Conclusion: AUR helper has no meaning outside Arch Linux"))

   '(paru
     reason: "ARCH_SPECIFIC_TOOL"
     details: "Feature-packed AUR helper written in Rust. Requires pacman and AUR infrastructure. Not applicable to Guix."
     attempts: ("1. Reviewed source: Rust binary wrapping pacman"
                "2. Checked deps: pacman, git, asp — all Arch-specific"
                "3. Conclusion: AUR helper has no meaning outside Arch Linux"))

   '(waydroid
     reason: "MISSING_ANDROID_RUNTIME"
     details: "Android container on Wayland. Requires full Android system image, lxc, proprietary Android vendor blobs, and kernel waydroid patches. Extremely complex system-level integration."
     attempts: ("1. Reviewed source: Python scripts + lxc + Android images"
                "2. Analyzed deps: gbinder, lxc, android-tools, python-gobject, custom kernel"
                "3. Conclusion: requires custom kernel and Android system images; not feasible for Guix packaging"))

   '(hyprtoolkit-git
     reason: "MISSING_GUIX_DEPS"
     details: "Modern C++ Wayland-native GUI toolkit. Requires hyprutils, hyprwayland-scanner, aquamarine, and other Hyprland ecosystem libraries not in Guix."
     attempts: ("1. Reviewed deps: aquamarine, hyprutils, hyprwayland-scanner, sdbus-cpp, tomlplusplus"
                "2. Checked Guix: none of hypr* libraries available upstream"
                "3. Conclusion: would need to package 5+ hypr ecosystem deps first"))

   '(wayfire
     reason: "MISSING_GUIX_DEPS"
     details: "3D Wayland compositor. Requires wf-config and wlroots 0.17+ with specific patches. Complex compositor with custom plugin system."
     attempts: ("1. Reviewed deps: wf-config, wlroots, cairo, pango, libjpeg, libinput"
                "2. Checked Guix: wf-config not available, wlroots version may be incompatible"
                "3. Conclusion: needs wf-config packaged first; complex build system"))

   '(llvm-libs-minimal-git
     reason: "BUILD_COMPLEXITY"
     details: "LLVM trunk runtime libraries (git HEAD). Building LLVM from trunk requires 50+ GB RAM, hours of compile time, and careful cmake configuration. Version changes daily."
     attempts: ("1. Reviewed PKGBUILD: git clone of llvm-project, cmake build"
                "2. Analyzed: 19 deps including polly, mlir, compiler-rt, lld, libc++"
                "3. Conclusion: tracking LLVM git HEAD not suitable for reproducible packaging"))

   '(mips64-linux-gnu-linux-api-headers
     reason: "CROSS_COMPILATION_TARGET"
     details: "Linux kernel API headers for MIPS64 cross-compilation target. Guix handles cross-compilation differently via its own cross-toolchain infrastructure."
     attempts: ("1. Reviewed: kernel headers sanitized for MIPS64 target"
                "2. Analyzed Guix cross-compilation: uses (cross-base) module"
                "3. Conclusion: Guix has its own cross-compilation mechanism"))

   '(gtk-sharp-2
     reason: "MISSING_GUIX_DEPS"
     details: "GTK2 bindings for C#/Mono. Requires Mono runtime and build tools which are not packaged in Guix."
     attempts: ("1. Reviewed PKGBUILD: autotools build needing mono, gtk-sharp-2"
                "2. Checked Guix: mono runtime not available"
                "3. Conclusion: blocked on Mono runtime packaging"))

   '(foobar2000
     reason: "PROPRIETARY_WINE_APP"
     details: "Advanced freeware audio player that runs via Wine. Requires Wine with specific Windows components. Complex Wine application packaging."
     attempts: ("1. Reviewed PKGBUILD: downloads Windows .exe, runs via wine"
                "2. Analyzed deps: wine, icoextract for icon extraction"
                "3. Conclusion: Wine application packaging not standardized in Guix"))

   '(libelectron
     reason: "META_PACKAGE_COMPLEX"
     details: "Meta package for Electron and its dependencies. Electron itself is extremely complex to build from source (~4GB source, custom Chromium fork)."
     attempts: ("1. Reviewed: meta-package depending on electron binary"
                "2. Analyzed Electron build: requires custom Chromium build system"
                "3. Conclusion: Electron packaging is a major undertaking"))

   '(mozc
     reason: "BUILD_COMPLEXITY"
     details: "Google Japanese Input (open source edition). Complex Bazel-based build with protobuf, abseil-cpp, custom build rules, and multiple output components."
     attempts: ("1. Reviewed build: uses bazel with vendored deps"
                "2. Analyzed: custom protobuf handling, multiple output targets"
                "3. Conclusion: Bazel build system integration with Guix is unsolved"))

   '(xboxdrv
     reason: "MISSING_GUIX_DEPS"
     details: "Userspace Xbox gamepad driver and input remapper. Requires specific uinput and kernel module support, plus dbus-glib which may not be in Guix."
     attempts: ("1. Reviewed source: C++ with scons build"
                "2. Checked deps: dbus-glib, libudev, libusb, x11"
                "3. Conclusion: scons build + dbus-glib dependency chain needs investigation"))

   '(radicle-node
     reason: "MISSING_RUST_CRATES"
     details: "Open source peer-to-peer code collaboration stack. Rust project with many crate dependencies not available in Guix."
     attempts: ("1. Reviewed: Rust project with Cargo.toml"
                "2. Checked: 10+ Rust deps (7 total_deps in AUR)"
                "3. Conclusion: Rust crate packaging pipeline needed"))

   '(qtutilities-qt6
     reason: "MISSING_GUIX_DEPS"
     details: "Common Qt6 related C++ utilities. Requires cpp-utilities (c++utilities) library not in Guix."
     attempts: ("1. Reviewed PKGBUILD: cmake build with Qt6 + cpp-utilities"
                "2. Checked Guix: cpp-utilities/c++utilities not available"
                "3. Conclusion: needs cpp-utilities packaged first"))

   '(qmc2-common-git
     reason: "BUILD_COMPLEXITY"
     details: "Qt-based MAME frontend (git). Requires MAME source, Qt5 multimedia, and complex build configuration with custom make system."
     attempts: ("1. Reviewed: MAME frontend with 13 deps"
                "2. Analyzed: custom qmake-based build, needs MAME headers"
                "3. Conclusion: MAME ecosystem packaging is complex"))

   '(python-urllib3-future
     reason: "DONE_RECIPE_WRITTEN"
     details: "Recipe written with pyproject-build-system.")

   '(vscodium-translucent
     reason: "BUILD_COMPLEXITY"
     details: "VSCodium with translucency patches. Fork of Electron-based VS Code with custom patches, requiring full Electron build toolchain."
     attempts: ("1. Reviewed: Electron app + custom patches"
                "2. Analyzed: needs full VS Code build pipeline (node, npm, electron)"
                "3. Conclusion: Electron app packaging is a major undertaking"))

   '(ros2-arch-deps
     reason: "META_PACKAGE_COMPLEX"
     details: "Meta-package for ROS2 build dependencies on Arch. Contains 44 dependencies specific to ROS2 ecosystem. Not applicable as-is to Guix."
     attempts: ("1. Reviewed: meta-package listing 44 build deps"
                "2. Analyzed: ROS2 has its own build system (colcon/ament)"
                "3. Conclusion: ROS2 ecosystem needs dedicated packaging effort"))

   '(sonic-win
     reason: "BUILD_COMPLEXITY"
     details: "KWin fork with Wayland backports and bug fixes. 55 dependencies, requires full KDE Plasma build infrastructure."
     attempts: ("1. Reviewed: KWin fork with 55 deps including full Plasma stack"
                "2. Checked: requires specific KDE frameworks versions"
                "3. Conclusion: KDE compositor fork is extremely complex to package"))

   '(rvgl-bin
     reason: "PROPRIETARY_BINARY"
     details: "Re-Volt rewrite binary. Proprietary game with custom license. Binary distribution only, with complex dependencies (SDL2, OpenGL, OpenAL)."
     attempts: ("1. Reviewed: proprietary game binary for x86_64"
                "2. Analyzed deps: sdl2, opengl, openal, various libs"
                "3. Conclusion: proprietary binary with complex runtime deps and patching needed"))

   '(tuxedo-drivers-dkms
     reason: "KERNEL_MODULE_DKMS"
     details: "TUXEDO keyboard/backlight kernel module. Requires DKMS and kernel headers for out-of-tree module building, which Guix handles differently."
     attempts: ("1. Reviewed: DKMS module for TUXEDO keyboards"
                "2. Analyzed: needs kernel source and DKMS infrastructure"
                "3. Conclusion: Guix kernel module packaging uses different mechanism"))

   '(libfmod
     reason: "PROPRIETARY_BINARY"
     details: "FMOD audio engine shared libraries. Proprietary binary-only distribution from Firelight Technologies."
     attempts: ("1. Reviewed: proprietary audio engine .so files"
                "2. Checked license: custom non-free license"
                "3. Conclusion: proprietary binary, redistribution unclear"))

   '(tailscale
     reason: "MISSING_GO_DEPS"
     details: "Tailscale VPN client. Go project requiring WireGuard integration and many Go module dependencies not in Guix."
     attempts: ("1. AUR metadata not found in cache (name mismatch or removed)"
                "2. Upstream: Go project with complex networking stack"
                "3. Conclusion: requires extensive Go module packaging"))

   '(tosu
     reason: "PROPRIETARY_BINARY"
     details: "osu! memory reader tool. Prebuilt binary for reading osu! game memory. niche gaming tool with LGPL3 license."
     attempts: ("1. Reviewed: prebuilt binary, no source build instructions"
                "2. Analyzed: game-specific tool with limited user base"
                "3. Conclusion: binary-only distribution, no source available for Guix build"))

   '(ruby-http-2
     reason: "MISSING_RUBY_DEPS"
     details: "Pure-Ruby HTTP/2 protocol implementation. Requires Ruby packaging infrastructure and gem dependencies."
     attempts: ("1. Reviewed: Ruby gem with MIT license"
                "2. Checked Guix: ruby-http-2 not in upstream, needs gem2nix-like import"
                "3. Conclusion: Ruby packaging pipeline needed"))

   '(scala3
     reason: "BUILD_COMPLEXITY"
     details: "Scala 3 compiler (Dotty). Massive JVM project with sbt build system, requiring self-hosted compilation."
     attempts: ("1. Reviewed: JVM compiler with sbt build"
                "2. Analyzed: self-hosted compilation, needs existing Scala"
                "3. Conclusion: bootstrapping JVM compiler is extremely complex"))

   '(kaitai-struct-compiler
     reason: "BUILD_COMPLEXITY"
     details: "Kaitai Struct compiler for declarative binary format parsing. JVM project with sbt build, needs Scala/JVM ecosystem."
     attempts: ("1. Reviewed: Scala project with sbt build system"
                "2. Checked deps: java-runtime, scala — JVM ecosystem"
                "3. Conclusion: needs Scala + sbt packaging for Guix"))

   '(java-service-wrapper
     reason: "PROPRIETARY_LICENSE"
     details: "Tanuki Java service wrapper. Mixed GPL2 + Tanuki community license with restrictions. Binary components have non-free licensing."
     attempts: ("1. Reviewed license: GPL2 + custom 'tanuki-community' dual license"
                "2. Analyzed: community license restricts certain uses"
                "3. Conclusion: license terms may be incompatible with Guix"))

   '(lib32-l-smash
     reason: "LIB32_NOT_APPLICABLE"
     details: "32-bit version of l-smash MP4 muxer. lib32-* packages are Arch multilib convention not applicable to Guix (Guix uses separate system architectures)."
     attempts: ("1. Analyzed: 32-bit library variant"
                "2. Guix approach: would be i686-linux package, not lib32-*"
                "3. Conclusion: lib32 convention not applicable"))

   '(libticables
     reason: "MISSING_GUIX_DEPS"
     details: "TI calculator USB cable library. Requires libglade and specific USB access patterns. Niche hardware support."
     attempts: ("1. Reviewed PKGBUILD: autotools build with libusb, libglade"
                "2. Checked: libglade is deprecated GTK2 UI loading library"
                "3. Conclusion: depends on deprecated libglade"))

   '(libtifiles
     reason: "MISSING_GUIX_DEPS"
     details: "TI calculator file format library. Depends on libticables (also blocked) and ticonv."
     attempts: ("1. Reviewed PKGBUILD: autotools with libticables + ticonv"
                "2. Checked: libticables also blocked, circular dependency"
                "3. Conclusion: blocked on libticables"))

   '(heidisql
     reason: "PROPRIETARY_WINE_APP"
     details: "HeidiSQL database manager. Windows application requiring Wine. Complex Wine application packaging."
     attempts: ("1. Reviewed: Windows .exe with Wine launcher"
                "2. Analyzed: needs Wine + Windows DLLs"
                "3. Conclusion: Wine app packaging not standardized in Guix"))

   '(jre25-temurin
     reason: "DOWNLOAD_FAILURE"
     details: "Adoptium JRE 25 binaries. Release URL not found — may not be released yet or URL format changed."
     attempts: ("1. Tried download: https://github.com/adoptium/temurin25-binaries/releases/download/jdk-25+8/ — 404"
                "2. Checked GitHub: temurin25-binaries repo may not have releases yet"
                "3. Conclusion: JDK 25 is early access, binaries not yet published"))

   '(acestream-engine
     reason: "PROPRIETARY_BINARY"
     details: "Ace Stream multimedia streaming engine. Proprietary binary with custom license, requires Python 2 runtime."
     attempts: ("1. Reviewed PKGBUILD: downloads proprietary binary"
                "2. Checked: requires Python 2.7 which is EOL"
                "3. Conclusion: proprietary binary requiring EOL Python"))

   '(brscan4
     reason: "PROPRIETARY_BINARY"
     details: "Brother scanner SANE drivers. Proprietary binary drivers from Brother with custom license."
     attempts: ("1. Reviewed PKGBUILD: extracts Brother proprietary RPM"
                "2. Checked license: custom Brother non-free license"
                "3. Conclusion: proprietary binary redistribution"))

   '(upd72020x-fw
     reason: "PROPRIETARY_FIRMWARE"
     details: "Renesas USB 3.0 chipset firmware. Proprietary firmware extracted from Windows driver packages."
     attempts: ("1. Reviewed: firmware extraction from Windows drivers"
                "2. Checked: custom proprietary license"
                "3. Conclusion: proprietary firmware, redistribution restricted"))

   '(wd719x-firmware
     reason: "PROPRIETARY_FIRMWARE"
     details: "Western Digital SCSI card firmware. Proprietary firmware files for WD7193/WD7197/WD7296."
     attempts: ("1. Reviewed: firmware binary blobs"
                "2. Checked: custom license, old hardware"
                "3. Conclusion: proprietary firmware for legacy hardware"))

   '(noto-fonts-emoji-blob
     reason: "FONT_FORK_COMPLEX"
     details: "Blob emoji variant of Noto Emoji fonts (C1710 fork). Requires building from SVG sources with custom emoji build pipeline."
     attempts: ("1. Reviewed: fork of Google Noto emoji with blob style"
                "2. Analyzed: needs fonttools + custom emoji pipeline"
                "3. Conclusion: custom emoji font build pipeline needed"))

   '(localepurge
     reason: "ARCH_SPECIFIC_TOOL"
     details: "Script to remove disk space wasted on unused localizations. Relies on Arch/Debian filesystem layout and dpkg/pacman locale management."
     attempts: ("1. Reviewed: shell script for removing locale files"
                "2. Analyzed: hardcoded paths for /usr/share/locale, dpkg integration"
                "3. Conclusion: Guix handles locales differently via profiles"))

   '(ttf-gabarito-git
     reason: "DOWNLOAD_FAILURE"
     details: "Gabarito font from git. No local PKGBUILD cached and git source URL unknown."
     attempts: ("1. Checked pkgbuilds cache: directory not found"
                "2. AUR metadata has version but no cached source info"
                "3. Conclusion: need to fetch PKGBUILD to determine source URL"))

   '(cosmic-randr-git
     reason: "MISSING_RUST_CRATES"
     details: "COSMIC display output configuration tool. Rust project with cosmic-randr-shell crate and COSMIC ecosystem dependencies."
     attempts: ("1. Reviewed: Rust project with cargo build"
                "2. Checked: depends on cosmic-randr-shell crate not in Guix"
                "3. Conclusion: COSMIC Rust ecosystem dependencies needed"))

   '(zmusic
     reason: "MISSING_GUIX_DEPS"
     details: "GZDoom music library. Requires specific audio libraries and GZDoom build infrastructure."
     attempts: ("1. Reviewed PKGBUILD: cmake build with fluidsynth, mpg123, sndfile, zlib, alsa-lib"
                "2. Checked Guix: most audio deps available but build system is custom"
                "3. Conclusion: needs careful cmake configuration and testing"))

   '(wl-screenrec
     reason: "MISSING_RUST_CRATES"
     details: "Wayland screen recorder with hardware acceleration. Rust/meson build needing wlroots protocols and FFmpeg integration."
     attempts: ("1. Reviewed: Rust project with meson build"
                "2. Checked deps: ffmpeg, wayland-protocols, libdrm, pipewire"
                "3. Conclusion: mixed Rust/meson build with complex deps"))

   '(gslapper
     reason: "DOWNLOAD_FAILURE"
     details: "Wayland wallpaper utility. GitHub releases not found at expected URL."
     attempts: ("1. Tried download from GitHub: 404 error"
                "2. Checked: github.com/nicholasgasior/gslapper — may not exist"
                "3. Conclusion: upstream source not available"))

   '(genders
     reason: "DOWNLOAD_FAILURE"
     details: "LLNL cluster configuration database. GitHub release URL not found."
     attempts: ("1. Tried LLNL GitHub: 404 error"
                "2. Checked: sourceforge may have older versions"
                "3. Conclusion: need to locate correct source URL"))

   '(python-uv-dynamic-versioning
     reason: "DONE_RECIPE_WRITTEN"
     details: "Recipe written with pyproject-build-system.")

   '(qt5-scxml
     reason: "DONE_COMPAT_ALIAS"
     details: "Already exists as qtscxml in Guix upstream. Compat alias added to general-compat.scm.")

   '(openssl-1.1
     reason: "DONE_EXISTING_COMPAT"
     details: "Already has compat alias in general-compat.scm pointing to upstream openssl.")

   '(python312
     reason: "DONE_EXISTING_COMPAT"
     details: "Already has compat alias in general-compat.scm pointing to upstream python.")

   '(xlibre-xserver-common-git
     reason: "DONE_EXISTING_COMPAT"
     details: "Already has compat alias in general-compat.scm.")))
