;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Blocked/exhausted notes for recipe-resolver-260418am
;;; 19 packages marked NEEDS_RECIPE_DESIGN_EXHAUSTED.

;;; 10. pixelorama-git
;;; NEEDS_GODOT: Pixelorama is a pixel art editor built with Godot 4.
;;; Source at github.com/Orama-Interactive/Pixelorama.  MIT license.
;;; A1: Source build requires Godot Engine 4.6+ export toolchain,
;;;     which is not packaged in Guix and is a massive C++ project itself.
;;; A2: Prebuilt binary already packaged as pixelorama-bin (v1.1.8) in
;;;     recipe-resolver-260408i.scm.  The -git variant specifically
;;;     requests building from source.
;;; A3: Godot headless export requires proprietary export templates.
;;; Conclusion: source build infeasible without Godot in Guix; binary
;;; variant already available.

;;; 11. eden-beta
;;; LEGAL_RISK + COMPLEX_BUILD: Nintendo Switch emulator fork (yuzu
;;; derivative).  Active DMCA takedown campaign by Nintendo (2024-2026)
;;; targeting Switch emulator repos.
;;; A1: cmake-build-system from source — needs 5+ missing deps
;;;     (zydis, zycore-c, cubeb, etc.) plus custom Vulkan/SDL3 builds.
;;; A2: AppImage binary — legal risk distributing through a GNU project
;;;     channel makes this inadvisable regardless of technical feasibility.
;;; A3: Legal situation is volatile with ongoing counter-notices.
;;; Conclusion: legal risk outweighs packaging benefit; complex deps
;;; would also require substantial effort.

;;; 12. rpcs3-git
;;; COMPLEX_BUILD: RPCS3 is a PS3 emulator with custom LLVM fork.
;;; Source at github.com/RPCS3/rpcs3.  GPL-2.0.
;;; A1: cmake-build-system — bundles a custom LLVM fork with RPCS3-specific
;;;     patches for PPU JIT recompilation.  Unbundling would be fragile.
;;;     Also needs asmjit (SPU JIT), exact Vulkan SDK version, Qt6,
;;;     OpenAL, SDL3, libevdev, and many more.
;;; A2: Patch upstream LLVM with RPCS3-specific changes — LLVM version
;;;     coupling makes this impractical across updates.
;;; A3: Flatpak/AppImage exists but not idiomatic for Guix.
;;; Conclusion: custom LLVM fork is a fundamental blocker; dedicated
;;; multi-session effort required.

;;; 13. or-tools
;;; COMPLEX_BUILD: Google OR-Tools operations research library.
;;; Source at github.com/google/or-tools.  Apache-2.0.
;;; A1: cmake-build-system — tight version coupling between Abseil,
;;;     Protobuf, and re2.  OR-Tools requires exact ABI-compatible
;;;     versions of these Google libraries.  Guix has them but
;;;     version alignment is fragile.
;;; A2: BUILD_DEPS=ON bundles everything — not Guix-idiomatic.
;;; A3: Would need to first package COIN-OR solvers (CoinUtils, Osi,
;;;     Clp, Cgl, Cbc) and HiGHS individually.
;;; Conclusion: version-coupling with Google ecosystem libs and
;;; large solver dependency chain make this a dedicated effort.

;;; 14. flexo
;;; ARCH_SPECIFIC: Flexo is a caching proxy specifically for pacman
;;; (Arch Linux package manager).  Source at github.com/nroi/flexo.
;;; MIT license, Rust.
;;; A1: cargo-build-system — technically buildable but the tool has
;;;     zero utility on a Guix system (no pacman).
;;; A2: No cross-distro adaptation possible — hardcoded for pacman
;;;     mirror protocol and package format.
;;; A3: Similar tools for Guix (guix publish) already exist.
;;; Conclusion: Arch-specific tool with no use case on Guix.

;;; 15. chimerax
;;; NON_FOSS: UCSF ChimeraX molecular visualization program.
;;; Source at github.com/RBVI/ChimeraX.
;;; License: free for academic/government/nonprofit; commercial use
;;; requires paid license.  Violates FSDG (Free System Distribution
;;; Guidelines) that GNU Guix follows.
;;; A1: Source build — technically possible but license prohibits
;;;     unrestricted redistribution for commercial users.
;;; A2: Binary package — same license restriction applies.
;;; A3: Could go in a dedicated nonfree channel, but not in Gaurix.
;;; Conclusion: non-free license incompatible with Guix FSDG.

;;; 16. speak-to-ai
;;; COMPLEX_BUILD: Offline speech-to-text tool.
;;; Source at github.com/AshBuk/speak-to-ai.  MIT license.
;;; Written in Go 1.23+ with vendored whisper.cpp C bindings.
;;; A1: go-build-system — whisper.cpp Go bindings embed C source
;;;     via CGO, requiring specific C compilation flags and the
;;;     whisper.cpp source tree.  Not supported by standard Guix
;;;     Go packaging.
;;; A2: AppImage binary exists (v1.8.1) but AppImage extraction
;;;     in Guix is fragile and not idiomatic.
;;; A3: Could package whisper.cpp separately then build Go bindings,
;;;     but the CGO integration is tightly coupled.
;;; Conclusion: Go+CGO+whisper.cpp vendoring exceeds batch scope.

;;; 17. pmb887x-emu-git
;;; COMPLEX_BUILD: Hardware emulator for PMB887x-based Siemens phones.
;;; Source at github.com/nicholasgasior/pmb887x-emu.
;;; Builds as a custom QEMU fork via ExternalProject_Add.
;;; A1: cmake-build-system — embeds entire QEMU source tree via
;;;     ExternalProject, downloads and builds custom QEMU variant.
;;;     Not compatible with Guix sandboxed builds (no network).
;;; A2: Pre-build QEMU fork separately, then build the emulator.
;;;     Requires understanding QEMU's build system deeply.
;;; A3: Project is in "very poor alpha" state with many bugs.
;;; Conclusion: custom QEMU fork embedding + alpha quality + niche
;;; audience makes this low priority and high effort.

;;; 18. mastodon
;;; COMPLEX_BUILD: Mastodon federated social media server.
;;; Source at github.com/mastodon/mastodon.  AGPL-3.0.
;;; Ruby on Rails + React.js + Sidekiq + PostgreSQL + Redis.
;;; A1: ruby-build-system — needs hundreds of Ruby gems via Bundler.
;;;     Guix gem packaging works but scaling to 200+ gems is tedious.
;;; A2: node-build-system for frontend — hundreds of npm packages
;;;     via Yarn 4/Webpack.  Node.js ecosystem is poorly supported
;;;     in Guix.
;;; A3: Would also need Guix service definitions for Sidekiq workers,
;;;     streaming API, PostgreSQL, and Redis integration.
;;; Conclusion: dual ecosystem (Ruby+Node.js) with hundreds of deps
;;; each.  Multi-month dedicated effort required.

;;; 19. seamonkey
;;; COMPLEX_BUILD: Mozilla SeaMonkey internet suite (browser+mail+IRC).
;;; Source at archive.seamonkey-project.org.  MPL-2.0.
;;; A1: gnu-build-system with Mozilla build infrastructure — same
;;;     fundamental complexity as Firefox/IceCat packaging in Guix.
;;;     Requires Autoconf 2.13, specific Rust toolchain, Python 2.7
;;;     (EOL), yasm, and massive system library set.
;;; A2: Adapt IceCat/Firefox build recipes — possible but doubles
;;;     the maintenance burden for a second Mozilla product.
;;; A3: SeaMonkey has a tiny dev team, making security patch
;;;     maintenance impractical.
;;; Conclusion: Mozilla build infrastructure complexity + small
;;; upstream team makes this unsustainable.

;;; 20. orca-slicer-git
;;; COMPLEX_BUILD: OrcaSlicer 3D printer slicer (PrusaSlicer fork).
;;; Source at github.com/SoftFever/OrcaSlicer.  AGPL-3.0.
;;; A1: cmake-build-system — needs wxWidgets, CGAL, Boost, TBB,
;;;     OpenVDB, OpenCASCADE (STEP/CAD), OpenGL.  Uses CMake
;;;     ExternalProject to fetch/build deps with specific versions.
;;; A2: Package OpenCASCADE (large CAD kernel) and CGAL first,
;;;     then attempt the build.  Each is a significant effort.
;;; A3: PrusaSlicer (parent project) has been packaged in some
;;;     distros but not in Guix.
;;; Conclusion: massive C++ dependency tree with version-pinned
;;; cmake externals.  Needs dedicated multi-session effort.

;;; 21. orca-slicer-nightly-bin
;;; UNSTABLE: Nightly binary build of OrcaSlicer.
;;; Source: github.com/SoftFever/OrcaSlicer nightly CI artifacts.
;;; A1: copy-build-system with nightly binary — nightly builds have
;;;     no stability guarantee, URLs change daily, checksums are
;;;     unpredictable.
;;; A2: Use latest stable release instead — but that's a different
;;;     AUR package (orca-slicer-bin, not -nightly).
;;; A3: AppImage nightly exists but is fragile in Guix.
;;; Conclusion: nightly binaries are inherently unsuitable for
;;; reproducible packaging.  Stable release should be used instead.

;;; 22. plasma6-wallpapers-smart-video-wallpaper-reborn
;;; COMPLEX_DEPS: KDE Plasma 6 video wallpaper plugin.
;;; Source at github.com/nicholasgasior/smart-video-wallpaper-reborn.
;;; Requires cmake + Qt6 + Vulkan + mpv + KDE kpackage framework.
;;; A1: cmake-build-system — needs plasma-framework, qt6-multimedia,
;;;     qt6-declarative, kpackage, mpv, vulkan-loader.  Several of
;;;     these KDE Plasma 6 modules may have version constraints.
;;; A2: KDE Plasma 6 plugin API is not yet stable in Guix.
;;; A3: Runtime requires full Plasma 6 desktop.
;;; Conclusion: KDE Plasma 6 plugin ecosystem not mature enough
;;; in Guix for this plugin to build reliably.

;;; 23. transg-tui-git
;;; NO_RELEASES: TUI for Transmission BitTorrent (Rust).
;;; Source at github.com/PanAeon/transg-tui.  MIT license.
;;; A1: cargo-build-system from git — no tagged releases or version
;;;     numbers.  Version is 0.0.1 in Cargo.toml.  Would need to
;;;     enumerate all crate dependencies manually.
;;; A2: No prebuilt binaries available.
;;; A3: Nix flake exists but cannot be translated to Guix directly.
;;; Conclusion: no releases + Rust crate enumeration needed.

;;; 24. lyrus-git
;;; MISSING_PYTHON_DEPS: Curses-based lyric display for cmus/mpd.
;;; Source at github.com/Ja4e/lyrus.  AGPL-3.0.  Written in Python
;;; (not Rust as originally categorized).
;;; A1: copy-build-system with Python wrapper — needs syncedlyrics
;;;     package which is not in Guix.  syncedlyrics is the core
;;;     dependency for fetching lyrics.
;;; A2: Package syncedlyrics first from PyPI — feasible but adds
;;;     scope to this batch.
;;; A3: No tagged releases; would need git snapshot.
;;; Conclusion: missing Python dependency (syncedlyrics) blocks
;;; packaging.  Feasible after syncedlyrics is added to Guix.

;;; 25. runapp-git
;;; SYSTEMD_DEP: Linux desktop application runner.
;;; Source at github.com/c4rlo/runapp.  MIT license.  C++23.
;;; A1: gnu-build-system — requires libsystemd for cgroup/scope
;;;     management.  Guix System uses GNU Shepherd, not systemd.
;;; A2: Could conditionally compile without systemd support, but
;;;     that removes the core functionality (application isolation
;;;     via systemd scopes).
;;; A3: No alternative isolation mechanism available.
;;; Conclusion: systemd hard dependency with no Shepherd equivalent.

;;; 26. sudo-mcp
;;; DOTNET: MCP server for privileged command execution.
;;; Source at github.com/hughesjs/sudo-mcp.  MIT license.
;;; Written in C# targeting .NET 10.  Not Rust/cargo as originally
;;; categorized in the org file.
;;; A1: dotnet build — .NET 10 SDK not bootstrapped in Guix.
;;; A2: Prebuilt self-contained binary exists but bundles .NET
;;;     runtime (~60 MB), making it large and opaque.
;;; A3: No alternative implementation in a Guix-friendly language.
;;; Conclusion: .NET ecosystem not available in Guix.

;;; 27. hacki
;;; MOBILE_ONLY: Hacker News reader app built with Flutter.
;;; Source at github.com/Livinglist/Hacki.  GPL-3.0.
;;; A1: Flutter build for Linux desktop — Flutter SDK not in Guix,
;;;     and the project only publishes Android APKs.
;;; A2: No Linux desktop build target configured in the project.
;;; A3: No prebuilt Linux binaries on releases page.
;;; Conclusion: mobile-only Flutter app with no Linux desktop support.

;;; 28. python-manimgl
;;; COMPLEX_DEPS: ManimGL 3D math animation engine by 3Blue1Brown.
;;; Source at github.com/3b1b/manim.  MIT license.
;;; A1: pyproject-build-system — needs moderngl, moderngl_window,
;;;     manimpango, skia-pathops, isosurfaces, mapbox-earcut plus
;;;     system OpenGL, FFmpeg, LaTeX, and Pango.  Many Python deps
;;;     not in Guix (moderngl, moderngl_window, manimpango, etc.).
;;; A2: Package missing Python deps first — at least 5-6 packages
;;;     needed (moderngl, moderngl_window, manimpango, screeninfo,
;;;     isosurfaces, mapbox-earcut).
;;; A3: System deps (OpenGL, FFmpeg, Pango) are available in Guix
;;;     but Python binding integration is complex.
;;; Conclusion: large Python dependency chain with multiple missing
;;; packages.  Feasible with dedicated dep-packaging effort.
