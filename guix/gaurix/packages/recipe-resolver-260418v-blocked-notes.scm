;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Blocked notes for recipe-resolver-260418v
;;;
;;; This file documents the 26 packages that could not be resolved
;;; after exhausting all viable approaches.

;;; 5. gamescope-session-git
;;; NEEDS_RECIPE_DESIGN_EXHAUSTED: DEP_BLOCKED
;;; Session shell scripts for gamescope (MIT)
;;; A1: copy-build-system can install the scripts, but gamescope itself
;;;     is not in Guix — session files non-functional without it
;;; A2: packaging gamescope requires Mesa/Vulkan/X11/wlroots pipeline;
;;;     60+ deps including proprietary shader compilers
;;; A3: session scripts only have value with gamescope installed;
;;;     cannot be tested or used standalone

;;; 6. falcond
;;; NEEDS_RECIPE_DESIGN_EXHAUSTED: ZIG_UNSUPPORTED
;;; Advanced Linux gaming performance daemon (MIT)
;;; A1: built with Zig compiler which is not available in Guix
;;; A2: no C/Makefile build alternative exists in upstream source
;;; A3: Zig's build model (vendored deps, cross-compilation) is
;;;     incompatible with Guix build stratum isolation

;;; 7. kx-aspe-git
;;; NEEDS_RECIPE_DESIGN_EXHAUSTED: RUST_CARGO_DEPS
;;; Keyoxide ASPE profile generator CLI in Rust (Apache-2.0)
;;; A1: cargo-build-system requires individual crate packaging;
;;;     depends on openssl + clap + serde crate trees (~40 transitive)
;;; A2: guix import crate produces incomplete dependency chain
;;; A3: no prebuilt static binaries available from upstream

;;; 8. contextpilot-git
;;; NEEDS_RECIPE_DESIGN_EXHAUSTED: RUST_CARGO_DEPS
;;; Git blame analyzer and code indexer in Rust (MIT)
;;; A1: cargo dep tree includes tokio, clap, serde (~50 crates)
;;; A2: guix import crate only resolves direct deps, not transitive
;;; A3: no prebuilt binary releases available from upstream

;;; 9. codanna
;;; NEEDS_RECIPE_DESIGN_EXHAUSTED: RUST_CARGO_DEPS
;;; Code assistant tool in Rust (Apache-2.0)
;;; A1: requires openssl crate + ~30 transitive deps
;;; A2: guix import crate leaves transitive deps unresolved
;;; A3: niche tool with 1 AUR vote; low packaging priority

;;; 10. streampager
;;; NEEDS_RECIPE_DESIGN_EXHAUSTED: RUST_CARGO_DEPS
;;; Terminal pager for command output in Rust (MIT)
;;; A1: depends on crossterm, tokio, serde (~40 crates)
;;; A2: guix import crate cannot fully resolve the dep tree
;;; A3: existing alternatives (less, most) already available in Guix

;;; 11. mbtiles
;;; NEEDS_RECIPE_DESIGN_EXHAUSTED: RUST_CARGO_DEPS
;;; Vector tile set examination tool in Rust (Apache-2.0/MIT)
;;; A1: cargo dep tree includes actix, tokio, serde (~60 crates)
;;; A2: also requires npm for part of the build (dual build system)
;;; A3: dual Rust + Node build system compounds packaging complexity

;;; 12. sqlite-dist
;;; NEEDS_RECIPE_DESIGN_EXHAUSTED: RUST_CARGO_DEPS
;;; SQLite extension distribution CLI in Rust (unknown license)
;;; A1: cargo deps include zstd, bzip2, clap (~30 crates)
;;; A2: alpha-quality software (v0.0.1-alpha.19); unstable API
;;; A3: no license file in repository; redistribution rights unclear

;;; 13. sequoia-octopus-librnp
;;; NEEDS_RECIPE_DESIGN_EXHAUSTED: RUST_CARGO_DEPS
;;; Sequoia PGP backend for Thunderbird in Rust (GPL-2.0)
;;; A1: massive cargo dep tree (sequoia-openpgp alone ~80 crates)
;;; A2: requires Thunderbird for integration testing and runtime
;;; A3: clang needed for C FFI bindings compilation

;;; 14. halloy-git
;;; NEEDS_RECIPE_DESIGN_EXHAUSTED: RUST_CARGO_DEPS
;;; IRC client with Iced GUI framework in Rust (GPL-3.0+)
;;; A1: Iced GUI framework requires ~100 crates (wgpu, winit, etc.)
;;; A2: GPU rendering deps (wgpu/Vulkan) add significant complexity
;;; A3: guix import crate cannot handle dependency trees at this scale

;;; 15. airshipper
;;; NEEDS_RECIPE_DESIGN_EXHAUSTED: RUST_CARGO_DEPS
;;; Veloren game launcher in Rust (GPL-3.0)
;;; A1: GUI app with reqwest, tokio, iced framework (~80 crates)
;;; A2: no prebuilt static binary available for Linux
;;; A3: Veloren itself not in Guix; launcher alone not useful

;;; 16. twitter-media-downloader-git
;;; NEEDS_RECIPE_DESIGN_EXHAUSTED: LICENSE_UNCLEAR
;;; Twitter media downloader in Go (unknown license)
;;; A1: no LICENSE file in repository; AUR license field is "unknown"
;;; A2: Go module deps need individual packaging for go-build-system
;;; A3: redistribution rights uncertain without explicit license grant

;;; 17. nvm-fish
;;; NEEDS_RECIPE_DESIGN_EXHAUSTED: ECOSYSTEM_MISMATCH
;;; Fish shell wrapper for Node Version Manager (MIT)
;;; A1: depends on nvm (Node Version Manager) which is not in Guix
;;; A2: nvm's shell-level version switching conflicts with Guix
;;;     profile-based package management model
;;; A3: Guix manages Node.js versions via packages/manifests; nvm
;;;     is fundamentally unnecessary in the Guix ecosystem

;;; 18. remmina-plugin-teamviewer
;;; NEEDS_RECIPE_DESIGN_EXHAUSTED: PROPRIETARY_DEP
;;; Remmina plugin for TeamViewer connections (GPL-2.0+)
;;; A1: requires TeamViewer (proprietary) at runtime; non-functional
;;;     without it
;;; A2: plugin source is GPL but serves solely as a launcher for
;;;     the proprietary TeamViewer binary
;;; A3: Remmina already supports VNC/RDP/SSH natively without plugins

;;; 19. golden-cheetah-git
;;; NEEDS_RECIPE_DESIGN_EXHAUSTED: EXTREME_DEPS
;;; Fitness analysis application (GPL-2.0+)
;;; A1: requires 12+ Qt6 modules including Qt6 WebEngine (Chromium-based)
;;; A2: needs SIP Python bindings, Qt6 Charts, Sensors, Serial, etc.
;;; A3: 13 makedeps (bison, flex, clang, etc.); impractical for batch

;;; 20. hmcl-dev
;;; NEEDS_RECIPE_DESIGN_EXHAUSTED: GRADLE_COMPLEX
;;; Java Minecraft launcher using Gradle build system (GPL-3.0)
;;; A1: Guix lacks Gradle build system support
;;; A2: Gradle downloads dependencies at build time, incompatible
;;;     with Guix sandbox/deterministic builds
;;; A3: requires JDK 21 + specific Gradle version pinning

;;; 21. omniorbpy
;;; NEEDS_RECIPE_DESIGN_EXHAUSTED: DEP_MISSING
;;; Python bindings for omniORB CORBA broker (LGPL-2.0+)
;;; A1: omniorb (C++ CORBA implementation) is not in Guix
;;; A2: packaging omniorb itself is significant effort (IDL compiler,
;;;     threading model, service daemon)
;;; A3: CORBA is legacy technology with minimal current demand

;;; 22. ibus-lotus
;;; NEEDS_RECIPE_DESIGN_EXHAUSTED: GO_MODULE_DEPS
;;; Vietnamese input method engine for IBus, in Go (GPL-3.0)
;;; A1: Go module deps (gotk3, dbus, ibus bindings) need packaging
;;; A2: CGO bridges to GTK3 and X11 complicate go-build-system usage
;;; A3: upstream ibus-bamboo (which this forks) also not in Guix

;;; 23. terraform-local
;;; NEEDS_RECIPE_DESIGN_EXHAUSTED: PYTHON_DEPS_MISSING
;;; Thin wrapper for Terraform against LocalStack (Apache-2.0)
;;; A1: needs python-localstack-client (not in Guix)
;;; A2: needs python-hcl2 (not in Guix)
;;; A3: LocalStack itself not in Guix; tool non-functional without it

;;; 24. galaxy-flasher
;;; NEEDS_RECIPE_DESIGN_EXHAUSTED: RUNTIME_DEPS_MISSING
;;; Samsung device flashing GUI in Python/GTK4 (GPL-3.0)
;;; A1: needs odin4-cli or thor-flash-utility (neither in Guix)
;;; A2: needs python-i18n, python-langcodes, python-language-data
;;; A3: Samsung device flashing is niche; runtime deps unavailable

;;; 25. git-gl
;;; NEEDS_RECIPE_DESIGN_EXHAUSTED: IMPRACTICAL_FORK
;;; GitLab's fork of Git with vendor patches (GPL-2.0)
;;; A1: Guix already has git; maintaining a separate fork impractical
;;; A2: GitLab-specific patches are mostly for GitLab server, not users
;;; A3: git-gl rapidly diverges from upstream; version tracking burden

;;; 26. hypr-dock
;;; NEEDS_RECIPE_DESIGN_EXHAUSTED: GO_MODULE_DEPS
;;; Dock panel for Hyprland in Go with GTK3 (GPL-3.0)
;;; A1: Go module deps (gotk3, go-gtk-layer-shell) need packaging
;;; A2: CGO + GTK layer shell bridge requires careful build flags
;;; A3: go-build-system + GTK3 CGO combination not well tested in Guix

;;; 27. diskm8
;;; NEEDS_RECIPE_DESIGN_EXHAUSTED: GO_MODULE_DEPS
;;; Apple II disk image manipulation tool in Go (GPL-3.0)
;;; A1: Go module deps need individual packaging for go-build-system
;;; A2: niche tool (1 AUR vote) for retro computing
;;; A3: no prebuilt binaries available from upstream

;;; 28. gprofng-gui
;;; NEEDS_RECIPE_DESIGN_EXHAUSTED: JAVA_BUILD_COMPLEX
;;; GNU profiling GUI using autotools + Java/Ant (GPL-3.0+)
;;; A1: autotools configure.ac invokes ant/javac for Java compilation;
;;;     Java classpath management complex in Guix build stratum
;;; A2: needs gprofng data collector (part of binutils) built with
;;;     specific options for data file compatibility
;;; A3: Java GUI requires JAR manifest assembly and resource bundling

;;; 29. musique111-qt5
;;; NEEDS_RECIPE_DESIGN_EXHAUSTED: GIT_SUBMODULES
;;; Qt5 music player with 8 git submodules (GPL-3.0)
;;; A1: depends on 8 submodules (http, idle, media, updater, js,
;;;     sharedcache, SingleApplication, qt-reusable-widgets)
;;; A2: each submodule would need separate packaging or recursive
;;;     git-fetch with qmake subproject integration
;;; A3: recursive git-fetch unreliable for qmake .pro subproject builds

;;; 30. python-pjproject
;;; NEEDS_RECIPE_DESIGN_EXHAUSTED: BUILD_INTEGRATION
;;; Python bindings for pjproject SIP stack (GPL-2.0)
;;; A1: bindings are built as part of pjproject source tree via SWIG,
;;;     not as a standalone Python package
;;; A2: SWIG code generation needs pjproject headers at exact version
;;;     match; Guix has 2.15.1 but AUR ships 2.16
;;; A3: build process modifies pjproject source in-place, incompatible
;;;     with using pre-built pjproject from Guix store
