;;; recipe-resolver-260414x — blocked notes
;;;
;;; 25 packages marked NEEDS_RECIPE_DESIGN_EXHAUSTED with specific reasons.
;;; 5 packages resolved (3 recipes + 2 compat aliases).
;;;
;;; ── Resolved ──
;;;
;;; #13171 calculix-ccx → DONE: recipe (gnu-build-system, Fortran/C FEA solver v2.23)
;;;   + spooles 2.2 packaged as new dependency
;;; #13343 qbittorrent-enhanced-ua-nox → DONE: compat alias to upstream qbittorrent-enhanced-no-x
;;; #13344 qbittorrent-enhanced-ua → DONE: compat alias to upstream qbittorrent-enhanced
;;; #13373 iso-commander → DONE: recipe (gnu-build-system, C++20 ISO manager v6.4.7)
;;;
;;; ── NEEDS_RECIPE_DESIGN_EXHAUSTED ──
;;;
;;; #13138 java11-openjfx
;;;   GRADLE_BUILD: OpenJFX 11 requires Gradle 7 build system with 100+ Java
;;;   modules; Gradle not in Guix; complex multi-module Java build with
;;;   webkit/media native deps;
;;;   A1: guix import — no Java 11 importer for OpenJFX modules
;;;   A2: manual Gradle build — Gradle requires bootstrapping, not in Guix
;;;   A3: binary repack — no prebuilt JFX jars for Linux x86_64 standalone
;;;
;;; #13162 portage-manifest
;;;   ARCH_SPECIFIC + NON_FREE_LICENSE: Arch package browser (not Gentoo Portage);
;;;   depends on pacman/yay; CC-BY-NC license is non-free;
;;;   A1: pacman deps not portable
;;;   A2: non-free license blocks packaging
;;;   A3: Electron/npm build adds complexity
;;;
;;; #13185 simracing-essentials
;;;   HARDWARE_SPECIFIC: SimRacing tool bundle targeting USB HID sim racing
;;;   hardware; unclear upstream source; may require proprietary firmware;
;;;   A1: no clear upstream repo found
;;;   A2: hardware-specific USB HID integration
;;;   A3: bundle nature makes individual packaging unclear
;;;
;;; #13199 scx-scheds-git
;;;   KERNEL_BPF: sched_ext schedulers require Linux kernel 6.12+ with
;;;   CONFIG_SCHED_CLASS_EXT; Rust/BPF toolchain for eBPF programs;
;;;   A1: needs kernel headers + BPF linker/loader
;;;   A2: Rust cargo-build-system with 50+ crate deps for scx_utils
;;;   A3: runtime requires custom kernel config not standard on Guix
;;;
;;; #13214 zephyr-sdk
;;;   CROSS_COMPILATION_SDK: massive multi-arch toolchain bundle (ARM, RISC-V,
;;;   x86, Xtensa, etc.); 2+ GB binary SDK with prebuilt GCC cross-compilers;
;;;   A1: binary repack — too large, too many arch targets
;;;   A2: source build — would need to build 12+ GCC cross-compilers
;;;   A3: Guix handles cross-compilation natively via --target flag
;;;
;;; #13223 xmcl-launcher
;;;   ELECTRON_NPM: Minecraft launcher built with Electron/Vue.js; deep npm
;;;   dependency tree (1000+ packages); no prebuilt AppImage for Linux;
;;;   A1: npm/Electron build — npm ecosystem not viable in Guix
;;;   A2: no binary releases for Linux
;;;   A3: game-specific launcher with Microsoft auth integration
;;;
;;; #13288 reboot-arch-btw
;;;   ARCH_SPECIFIC: checks if kernel update requires reboot by querying
;;;   pacman database; depends on pacman, Arch kernel naming conventions;
;;;   A1: pacman dependency not available in Guix
;;;   A2: logic tied to Arch kernel package versioning
;;;   A3: Guix handles kernel updates differently (declarative config)
;;;
;;; #13304 organicmaps
;;;   MASSIVE_DEPS: offline mapping app with 100+ native C++/Qt dependencies;
;;;   custom map rendering engine (drape); OpenGL/Vulkan graphics;
;;;   A1: 100+ deps including custom Boost.Geometry extensions
;;;   A2: Qt5/Qt6 mobile-first UI with platform-specific code
;;;   A3: map data processing pipeline adds build complexity
;;;
;;; #13305 penpot
;;;   CLOJURE_MULTISERVICE: multi-container design tool (Clojure backend +
;;;   ClojureScript frontend + Node.js exporter + PostgreSQL + Redis);
;;;   A1: Clojure build needs leiningen/deps.edn ecosystem
;;;   A2: multi-service architecture (not a single binary)
;;;   A3: ClojureScript frontend requires npm/shadow-cljs build
;;;
;;; #13306 penpot-exporter
;;;   CLOJURE_MULTISERVICE: Penpot SVG/PDF exporter service; part of penpot
;;;   ecosystem; requires same Clojure/Node.js build infrastructure;
;;;   A1: depends on penpot backend (not packaged)
;;;   A2: Node.js service with Playwright for rendering
;;;   A3: cannot function standalone without penpot stack
;;;
;;; #13314 collabora-office
;;;   LIBREOFFICE_FORK: massive LibreOffice fork with 10M+ LOC; requires
;;;   full LibreOffice build infrastructure plus Collabora Online additions;
;;;   A1: LibreOffice build already takes hours; fork adds more
;;;   A2: Collabora Online integration needs custom WebSocket server
;;;   A3: Qt6 desktop wrapper adds another build layer
;;;
;;; #13316 rust-aarch64-musl-git
;;;   GUIX_NATIVE_CROSS: Arch-specific package providing Rust cross-compilation
;;;   target for aarch64-linux-musl; Guix handles this natively via
;;;   --target=aarch64-linux-gnu or cross-compilation infrastructure;
;;;   A1: Guix cross-compilation makes this unnecessary
;;;   A2: Arch-specific rustup target management
;;;   A3: musl target needs musl-cross-toolchain not in scope
;;;
;;; #13317 rust-aarch64-gnu-git
;;;   GUIX_NATIVE_CROSS: same as rust-aarch64-musl-git but for GNU target;
;;;   Guix cross-compilation handles this natively;
;;;   A1: Guix cross-compilation makes this unnecessary
;;;   A2: Arch-specific rustup integration
;;;   A3: no standalone use case outside Arch rust toolchain
;;;
;;; #13318 lib32-rust-libs-git
;;;   MULTILIB_UNSUPPORTED: Rust 32-bit libraries for multilib; Guix does not
;;;   support multilib (i686 is a separate system, not a lib32 addon);
;;;   A1: Guix i686-linux is a separate build, not multilib
;;;   A2: no lib32 infrastructure in Guix
;;;   A3: Arch-specific package management pattern
;;;
;;; #13328 sulis-git
;;;   COMPLEX_RUST: tactical RPG with custom 2D rendering engine; massive Rust
;;;   codebase with 100+ cargo dependencies; game assets embedded;
;;;   A1: cargo-build-system with 100+ crate deps not individually packaged
;;;   A2: custom OpenGL 2D engine with game-specific shaders
;;;   A3: game data/assets embedded in binary, large download
;;;
;;; #13329 optimus-manager-git
;;;   NVIDIA_PROPRIETARY + HARDCODED_PATHS: GPU switching manager requiring
;;;   NVIDIA proprietary drivers; no git tags (rolling release); extensive
;;;   hardcoded /usr/lib, /etc/X11 paths needing patching;
;;;   A1: depends on nvidia proprietary kernel modules
;;;   A2: 20+ hardcoded system paths need substitute*
;;;   A3: systemd service needs Shepherd replacement; X11-only (no Wayland)
;;;
;;; #13376 mdbook-epub
;;;   CARGO_DEPS_NEEDED: Rust mdbook EPUB backend; 30+ transitive crate
;;;   dependencies not individually packaged in Guix;
;;;   A1: cargo-build-system — need to package 30+ crates
;;;   A2: depends on mdbook (also not in Guix)
;;;   A3: no prebuilt binaries available
;;;
;;; #13377 pat-aur-host-git
;;;   ARCH_SPECIFIC: AUR build helper depending on pacman/makepkg/
;;;   arch-install-scripts; fundamentally Arch Linux tooling;
;;;   A1: depends on pacman (not in Guix)
;;;   A2: depends on makepkg (Arch build tool)
;;;   A3: not portable outside Arch Linux
;;;
;;; #13383 frame
;;;   ABANDONED_UPSTREAM: libframe touch input library by Canonical; last
;;;   release v2.5.0 in February 2013; deprecated in favor of libinput;
;;;   A1: no development in 13+ years
;;;   A2: source in Bazaar VCS (not Git), complicates packaging
;;;   A3: superseded by libinput, no modern use case
;;;
;;; #13388 maint
;;;   ARCH_SPECIFIC: Arch Linux system maintenance utility (ArchSystemMaintenance);
;;;   automates pacman upgrades, mirrorlist ranking, .pacnew handling;
;;;   A1: depends on pacman and Arch-specific tools
;;;   A2: shell scripts tied to Arch filesystem layout
;;;   A3: not portable to any non-Arch distribution
;;;
;;; #13417 tuimer
;;;   SOURCE_NOT_FOUND: described as "minimal terminal timer in Go" but no
;;;   matching project found on GitHub/pkg.go.dev; closest match (work-tuimer)
;;;   is Rust, not Go;
;;;   A1: no upstream repository found at expected URL
;;;   A2: no Go project with this name exists
;;;   A3: cannot package without source
;;;
;;; #13448 pardf
;;;   UNCLEAR_UPSTREAM: described as "PDF editor" by "Word-Sys"; no clear
;;;   open-source repository found; may be proprietary;
;;;   A1: no clear source repository found
;;;   A2: may be proprietary/commercial software
;;;   A3: cannot determine license or build system
;;;
;;; #13456 muzak
;;;   NO_LICENSE: Rust command-line music compilation suite at
;;;   github.com/The0x539/muzak; repository has no LICENSE file;
;;;   A1: missing license is a hard blocker for Guix
;;;   A2: small project (87 commits, 9 stars)
;;;   A3: would need author to add license before packaging
;;;
;;; #13467 llama-cpp-clblast
;;;   SYSTEM_GGML_DEPENDENCY: llama.cpp with CLBlast GPU backend; upstream
;;;   Guix llama-cpp uses LLAMA_USE_SYSTEM_GGML=ON so CLBlast must be enabled
;;;   in ggml package, not llama-cpp directly; requires ggml-clblast variant;
;;;   A1: CLBlast flag belongs in ggml, not llama-cpp
;;;   A2: would need to fork ggml package with -DGGML_CLBLAST=ON
;;;   A3: ggml build has complex Vulkan/shader dependencies already
;;;
;;; #13477 incplot
;;;   COMPLEX_DEPS: C++/CMake CLI plotting tool using CPM package manager;
;;;   9 custom C++ dependencies from same author (InCom-0); dependencies
;;;   not in Guix and use non-standard build;
;;;   A1: CPM (CMake Package Manager) downloads deps at build time
;;;   A2: 5+ custom libraries by same author need packaging first
;;;   A3: sqlpp23, cpr, libarchive superbuild add complexity
