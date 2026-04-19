;;; Blocked notes for recipe-resolver-260419f
;;;
;;; BLOCKED EXHAUSTED (17):
;;;
;;; 1. podserv-b-git (#5460) — RUST_VENDORED_DEPS
;;;    Minimalist podcast server written in Rust (Apache-2.0).
;;;    Source: https://github.com/l5yth/podserv-b
;;;    A1: cargo-build-system requires individually packaging all crate
;;;        dependencies — project has 60+ transitive crates.
;;;    A2: No pre-built binary releases on GitHub.
;;;    A3: guix import crate incomplete — many transitive crates missing
;;;        from Guix.
;;;    Conclusion: Rust vendored dependency chain too large without
;;;    pre-built binary fallback.
;;;
;;; 2. swhook (#5465) — RUST_VENDORED_DEPS
;;;    Minimalistic webhook server written in Rust (GPL-3.0+).
;;;    Source: https://github.com/AndyLocks/swhook
;;;    A1: cargo-build-system requires 40+ crate deps individually packaged.
;;;    A2: No pre-built binary releases available.
;;;    A3: guix import crate produces incomplete dependency chain.
;;;    Conclusion: Rust vendored dependency chain blocks packaging.
;;;
;;; 3. baremetal-compiler-rt (#5487) — COMPLEX_BUILD
;;;    compiler-rt builtins for bare-metal ARM Cortex-M targets (Apache-2.0).
;;;    Source: https://github.com/llvm/llvm-project
;;;    A1: Requires cross-compilation toolchain (clang targeting armv7m,
;;;        armv7em, armv8m) — Guix cross-compilation for bare-metal
;;;        ARM targets not well supported.
;;;    A2: Needs specific LLVM version pinning and CMake cross-compile
;;;        configuration for multiple ARM architectures simultaneously.
;;;    A3: No pre-built binary releases in a portable format.
;;;    Conclusion: bare-metal cross-compiler toolchain requirements
;;;    exceed current Guix cross-compilation support.
;;;
;;; 4. qxmledit (#5505) — MISSING_GUIX_DEPS
;;;    Simple XML editor and XSD viewer (LGPL).
;;;    Source: https://qxmledit.org/
;;;    A1: Depends on qt5-scxml — not packaged in Guix.
;;;    A2: Depends on qt5-xmlpatterns — not packaged in Guix.
;;;    A3: Both missing Qt5 modules are substantial packages requiring
;;;        their own dependency chains to be packaged first.
;;;    Conclusion: two missing Qt5 module dependencies block packaging.
;;;
;;; 5. adbfs-rootless-git (#5507) — MISSING_GUIX_DEPS
;;;    FUSE filesystem over ADB for Android devices (BSD-3).
;;;    Source: https://github.com/spion/adbfs-rootless
;;;    A1: Depends on android-tools (specifically adb) — not packaged
;;;        in Guix; android-tools is a complex package requiring
;;;        protobuf, boringssl, and Android-specific libraries.
;;;    A2: FUSE dependency available (fuse in Guix) but adb is the
;;;        hard blocker.
;;;    A3: No alternative ADB implementation available in Guix.
;;;    Conclusion: android-tools (adb) not in Guix blocks packaging.
;;;
;;; 6. dafny-bin (#5508) — DOTNET_REQUIRED
;;;    Dafny verification-aware programming language (MIT).
;;;    Source: https://github.com/dafny-lang/dafny
;;;    A1: Binary distribution requires dotnet-runtime — .NET runtime
;;;        not bootstrapped in Guix.
;;;    A2: Building from source requires dotnet-sdk (also not in Guix).
;;;    A3: No alternative implementation exists outside .NET ecosystem.
;;;    Conclusion: .NET ecosystem not available in Guix.
;;;
;;; 7. zerx-lab-fluxdown-bin (#5510) — PROPRIETARY
;;;    FluxDown multi-protocol download manager (Proprietary license).
;;;    Source: https://fluxdown.zerx.dev
;;;    A1: License is "LicenseRef-Proprietary" — blocks redistribution.
;;;    A2: No source code available.
;;;    A3: Closed-source binary with proprietary license terms.
;;;    Conclusion: proprietary license blocks Guix packaging.
;;;
;;; 8. lenovo-print-driver-lj2400-m7400-bin (#5512) — PROPRIETARY_DRIVER
;;;    Lenovo printer driver for LJ2400/M7400 series (custom Lenovo license).
;;;    Source: https://www.lenovo.com
;;;    A1: Proprietary binary driver with custom Lenovo license terms.
;;;    A2: Contains binary filter components that cannot be rebuilt.
;;;    A3: No open-source alternative driver for these printer models.
;;;    Conclusion: proprietary commercial driver license blocks packaging.
;;;
;;; 9. fw-fanctrl-rs-git (#5514) — NIGHTLY_RUST_REQUIRED
;;;    Framework laptop fan control daemon written in Rust (AGPL-3.0+).
;;;    Source: https://github.com/NexusXe/fw-ec-utils
;;;    A1: Build requires cargo-nightly — Guix only provides stable Rust.
;;;    A2: Nightly-specific features (unstable Rust APIs) used in source.
;;;    A3: No pre-built binary releases available.
;;;    Conclusion: nightly Rust toolchain requirement blocks packaging.
;;;
;;; 10. aerothemeplasma-desktop-x11-git (#5515) — MISSING_DEP_CHAIN
;;;     Windows Aero theme for KDE Plasma X11 session (AGPL-3.0+).
;;;     Source: https://github.com/aeroshell-desktop/aerothemeplasma
;;;     A1: Depends on aerothemeplasma-desktop, aeroshell-kwin-components-x11,
;;;         aeroshell-smodglow-x11, aeroshell-libplasma — none in Guix.
;;;     A2: Entire aeroshell-desktop ecosystem (6+ packages) would need
;;;         to be packaged first, each with their own dep chains.
;;;     A3: aeroshell-libplasma is a forked KDE Plasma library requiring
;;;         deep KDE framework integration.
;;;     Conclusion: missing aeroshell ecosystem dependency chain (6+ pkgs).
;;;
;;; 11. aeroshell-workspace-git (#5516) — MISSING_DEP_CHAIN
;;;     AeroShell workspace components for KDE (AGPL-3.0+).
;;;     Source: https://github.com/aeroshell-desktop/aeroshell-workspace
;;;     A1: Depends on aeroshell-libplasma — a forked KDE Plasma library
;;;         not in Guix.
;;;     A2: Requires extra-cmake-modules and full KDE framework stack.
;;;     A3: Part of aeroshell ecosystem; all components interdependent.
;;;     Conclusion: aeroshell-libplasma dependency not in Guix.
;;;
;;; 12. aeroshell-kwin-components-git (#5518) — MISSING_DEP_CHAIN
;;;     KWin effects and plugins for AeroShell desktops (AGPL-3.0+).
;;;     Source: https://github.com/aeroshell-desktop/aeroshell-kwin-components
;;;     A1: Depends on kwin and full KDE desktop framework — partially
;;;         in Guix but tight coupling with aeroshell ecosystem.
;;;     A2: Requires plasma-wayland-protocols and wayland-protocols
;;;         for build.
;;;     A3: Part of aeroshell ecosystem; cannot function independently.
;;;     Conclusion: aeroshell ecosystem interdependency blocks packaging.
;;;
;;; 13. keks-meet-server (#5519) — RUST_VENDORED_DEPS + JS_BUILD
;;;     Simple and secure video conferencing server (AGPL-3.0).
;;;     Source: https://codeberg.org/metamuffin/keks-meet
;;;     A1: Rust backend requires rustup and vendored crate chain.
;;;     A2: Frontend requires esbuild (JavaScript bundler) — not in Guix.
;;;     A3: Dual Rust + JS build pipeline both unavailable in Guix.
;;;     Conclusion: Rust vendored deps + JS build tooling both block.
;;;
;;; 14. jellything-git (#5520) — COMPLEX_BUILD
;;;     Jellything media streaming server (AGPL-3.0).
;;;     Source: https://codeberg.org/metamuffin/jellything
;;;     A1: Rust backend requires rustup with vendored crate chain.
;;;     A2: Build requires esbuild + nasm + meson + ninja — complex
;;;         multi-tool build pipeline.
;;;     A3: Depends on dav1d, libavif, zstd — some in Guix but Rust
;;;         core blocks the build.
;;;     Conclusion: complex multi-language build (Rust + JS + C) blocks.
;;;
;;; 15. hurrycurry-server (#5521) — COMPLEX_BUILD
;;;     Game server for HurryCurry cooking game (AGPL-3.0).
;;;     Source: https://codeberg.org/hurrycurry/hurrycurry
;;;     A1: Rust backend requires rustup with vendored crate chain.
;;;     A2: Frontend requires Deno runtime — not in Guix.
;;;     A3: Build also requires Godot game engine and graphviz for
;;;         asset generation.
;;;     Conclusion: Rust + Deno + Godot build requirements all block.
;;;
;;; 16. gnix (#5522) — RUST_VENDORED_DEPS
;;;     Simple HTTP reverse proxy written in Rust (AGPL-3.0).
;;;     Source: https://codeberg.org/metamuffin/gnix
;;;     A1: Requires rustup for build — Guix provides stable rust but
;;;         project may need nightly features.
;;;     A2: cargo-build-system requires individually packaging all
;;;         crate dependencies.
;;;     A3: No pre-built binary releases available.
;;;     Conclusion: Rust vendored dependency chain blocks packaging.
;;;
;;; 17. wireview-linux (#5524) — DOTNET_REQUIRED + PROPRIETARY_LICENSE
;;;     Unofficial Linux port of Thermal Grizzly WireView Pro II app.
;;;     Source: https://github.com/emaspa/wireview-linux
;;;     A1: Build requires dotnet-sdk — .NET SDK not in Guix.
;;;     A2: License is "custom" — terms unclear for redistribution.
;;;     A3: Runtime likely requires dotnet-runtime (also not in Guix).
;;;     Conclusion: .NET SDK required + unclear custom license block.
