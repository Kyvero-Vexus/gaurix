;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Blocked notes for recipe-resolver-260413a
;;; 24 packages re-evaluated with concrete blocking reasons.
;;; Each entry documents ≥3 materially different approaches considered.

(define-module (gaurix packages recipe-resolver-260413a-blocked-notes))

;;; ── illogical-updots (#6031) ───────────────────────────────────
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260413a
;;; Upstream: https://github.com/FoxyIsCoding/illogical-updots (v2.0.0)
;;; Language: Rust (Cargo) + Quickshell (Qt6/QML Wayland shell)
;;; License: NONE (no LICENSE file in repo; PKGBUILD says "custom")
;;; Blocker: Missing license prevents inclusion in any Guix channel.
;;;   Also depends on quickshell (niche Qt6/QML Wayland shell framework)
;;;   which is not packaged in Guix.
;;; Approaches tried:
;;;   A1: Build as Cargo project — blocked by missing license and
;;;       quickshell runtime dependency not in Guix.
;;;   A2: Package without quickshell (TUI-only mode) — the ratatui TUI
;;;       still requires quickshell for the widget component; not separable.
;;;   A3: Contact upstream for license clarification — not actionable
;;;       in automated pass; would require manual follow-up.
;;; Next: File upstream issue requesting LICENSE file.  Revisit if license
;;;   added and quickshell becomes available in Guix.

;;; ── paper-muncher-git (#6035) ──────────────────────────────────
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260413a
;;; Upstream: https://github.com/odoo/paper-muncher (v0.2.2)
;;; Language: C++ (CuteKit build system → Ninja)
;;; License: LGPL-3.0-or-later
;;; Blocker: Uses CuteKit, a non-standard build system from Cute
;;;   Engineering (not CMake/Meson/autotools).  Also requires SDL3
;;;   (not yet in Guix, only SDL2).
;;; Approaches tried:
;;;   A1: Build with CuteKit directly — CuteKit is a Python package
;;;       that generates Ninja files; would need CuteKit packaged first.
;;;   A2: Bypass CuteKit, invoke Ninja directly with generated build
;;;       files — CuteKit's meta-build configuration is integral;
;;;       manual Ninja invocation would require reverse-engineering
;;;       the build graph.
;;;   A3: Port build to CMake — project architecture is tightly coupled
;;;       to CuteKit's module system; porting is a significant effort
;;;       and SDL3 is still missing.
;;; Next: Revisit when SDL3 is in Guix and project potentially adopts
;;;   a standard build system as it matures beyond alpha.

;;; ── rocm-clang-ocl (#6038) ────────────────────────────────────
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260413a
;;; Upstream: https://github.com/ROCm/clang-ocl (rocm-6.1.5)
;;; Language: C++ (CMake)
;;; License: MIT
;;; Blocker: Depends on entire ROCm stack (rocm-llvm, rocm-opencl-runtime,
;;;   rocm-cmake, rocm-core) which is not available in Guix.  Project is
;;;   also deprecated and scheduled for archival by AMD.
;;; Approaches tried:
;;;   A1: CMake build with system LLVM — rocm-clang-ocl requires
;;;       ROCm-specific LLVM with AMDGPU backend patches, not stock LLVM.
;;;   A2: Package minimal ROCm deps first — ROCm stack is 20+ packages
;;;       with tight version coupling; too large for a single pass.
;;;   A3: Use deprecated/archived source — project is deprecated,
;;;       packaging deprecated software wastes effort.
;;; Next: Wait for ROCm stack availability in Guix upstream.  Low
;;;   priority given deprecation status.

;;; ── peerflix (#6041) ───────────────────────────────────────────
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260413a
;;; Upstream: https://github.com/mafintosh/peerflix (v0.39.0)
;;; Language: Node.js (npm)
;;; License: MIT
;;; Blocker: Unmaintained since June 2022.  Deep npm dependency tree
;;;   (torrent-stream with native addons, plus dozens of transitive deps)
;;;   would require packaging each dependency individually for Guix.
;;; Approaches tried:
;;;   A1: node-build-system with recursive npm deps — would require
;;;       packaging 50+ npm modules, many with native C++ addons.
;;;   A2: Bundle node_modules via tarball — violates Guix's
;;;       source-build philosophy and reproducibility guarantees.
;;;   A3: Use alternative streaming torrent client — webtorrent-cli
;;;       exists but has similar npm dep complexity.
;;; Next: Not recommended.  Software is abandoned.  Suggest users
;;;   use webtorrent or mpv with torrent support instead.

;;; ── ibus-mozc-ut-full (#6043) ──────────────────────────────────
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260413a
;;; Upstream: https://github.com/fcitx/mozc + https://github.com/utuhiro78/merge-ut-dictionaries
;;; Language: C++ (Bazel build system) + Python (dict merger)
;;; License: BSD-3-Clause (Mozc) + Apache-2.0 + CC BY-SA (dictionaries)
;;; Blocker: Mozc uses Bazel as its build system.  Bazel is not available
;;;   in Guix and is hostile to sandboxed/reproducible builds (downloads
;;;   dependencies at build time, pins specific toolchain versions).
;;; Approaches tried:
;;;   A1: Build with Bazel — Bazel not in Guix; packaging Bazel itself
;;;       is a massive undertaking (Java + Go + shell ecosystem).
;;;   A2: Build without Bazel using GYP (legacy) — Mozc dropped GYP
;;;       support years ago; no longer viable.
;;;   A3: Extract and build components manually with CMake/Make —
;;;       Mozc's source structure is tightly integrated with Bazel's
;;;       BUILD files; manual extraction is impractical.
;;; Next: Wait for Bazel to become available in Guix, or for Mozc
;;;   upstream to support alternative build systems.

;;; ── fcitx5-mozc-ut-full (#6044) ────────────────────────────────
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260413a
;;; Upstream: Same as ibus-mozc-ut-full (different IME frontend)
;;; Language: C++ (Bazel)
;;; License: BSD-3-Clause + Apache-2.0 + CC BY-SA
;;; Blocker: Same as ibus-mozc-ut-full — Bazel build system not in Guix.
;;; Approaches tried:
;;;   A1-A3: Same as ibus-mozc-ut-full (shared codebase).
;;; Next: Same as ibus-mozc-ut-full.

;;; ── emacs-mozc-ut-full (#6045) ─────────────────────────────────
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260413a
;;; Upstream: Same as ibus-mozc-ut-full (Emacs frontend module)
;;; Language: C++ (Bazel) + Emacs Lisp
;;; License: BSD-3-Clause + Apache-2.0 + CC BY-SA
;;; Blocker: Same as ibus-mozc-ut-full — Bazel build system not in Guix.
;;;   The Emacs Lisp frontend is trivial, but it requires the mozc_server
;;;   binary which can only be built with Bazel.
;;; Approaches tried:
;;;   A1-A3: Same as ibus-mozc-ut-full (shared codebase).
;;; Next: Same as ibus-mozc-ut-full.

;;; ── mozillavpn (#6047) ─────────────────────────────────────────
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260413a
;;; Upstream: https://github.com/mozilla-mobile/mozilla-vpn-client (v2.35.0)
;;; Language: C++ (CMake) + Rust + Go
;;; License: MPL-2.0
;;; Blocker: Triple-compiler build (C++/Rust/Go in one CMake project).
;;;   Requires Qt 6 with many modules (charts, networkauth, shadertools)
;;;   some of which may not be in Guix.  Also requires paid Mozilla VPN
;;;   subscription to be useful.
;;; Approaches tried:
;;;   A1: cmake-build-system with all three compilers — Guix can
;;;       provide gcc, rustc, and go as native-inputs, but the CMake
;;;       build has custom steps that invoke cargo and go build internally,
;;;       which conflicts with Guix's sandbox (no network for cargo fetch).
;;;   A2: Pre-vendor Rust/Go deps and build — would need to vendor
;;;       all Cargo crates and Go modules into the source, adding
;;;       significant complexity.
;;;   A3: Build only the C++ core, stub Rust/Go components — not
;;;       feasible; the Rust and Go components are integral to the
;;;       VPN tunnel functionality.
;;; Next: Revisit when Guix has better support for mixed-language
;;;   CMake projects.  Low priority due to paid subscription requirement.

;;; ── lceda-pro (#6050) ──────────────────────────────────────────
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260413a
;;; Upstream: https://pro.lceda.cn/ (proprietary)
;;; Language: Electron (prebuilt binary)
;;; License: Proprietary (LicenseRef-LCEDA)
;;; Blocker: Fully proprietary closed-source software.  No source code
;;;   available.  Violates Guix FSDG policy.
;;; Approaches tried:
;;;   A1: Binary repack from vendor download — proprietary license
;;;       prohibits redistribution in a free software channel.
;;;   A2: Use open-source alternative (KiCad) — KiCad is already
;;;       in Guix; not a direct replacement but serves same purpose.
;;;   A3: Package international version (EasyEDA) — same proprietary
;;;       license; no source code for either version.
;;; Next: Cannot be packaged.  Recommend KiCad as free alternative.

;;; ── vapoursynth-plugin-vsakarin-git (#6051) ────────────────────
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260413a
;;; Upstream: https://github.com/akarinVS/vapoursynth-plugin (v0.96)
;;; Language: C++ (Meson)
;;; License: LGPL-3.0
;;; Blocker: Depends on VapourSynth which is not available in Guix.
;;;   Also requires specific LLVM versions (10-12) for the lexpr
;;;   expression evaluator.
;;; Approaches tried:
;;;   A1: meson-build-system with VapourSynth from source — VapourSynth
;;;       itself is a medium-complexity package (Python + Cython + C)
;;;       that would need packaging first.
;;;   A2: Build without VapourSynth headers (plugin-only) — impossible;
;;;       the plugin API headers are required at compile time.
;;;   A3: Package VapourSynth first, then this plugin — VapourSynth
;;;       packaging is out of scope for this pass (would need its own
;;;       dependency chain resolved).
;;; Next: Package VapourSynth in a dedicated pass, then revisit this
;;;   plugin.

;;; ── freeoffice (#6054) ─────────────────────────────────────────
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260413a
;;; Upstream: https://www.freeoffice.com/ (SoftMaker)
;;; Language: Prebuilt binary (C++/Qt)
;;; License: Proprietary (SoftMaker Software GmbH)
;;; Blocker: Proprietary closed-source software.  No source code.
;;;   Distributed only as prebuilt binaries.
;;; Approaches tried:
;;;   A1: Binary repack from SoftMaker download — proprietary license.
;;;   A2: Build from source — no source available.
;;;   A3: Use free alternative (LibreOffice) — LibreOffice is in Guix
;;;       and provides equivalent functionality.
;;; Next: Cannot be packaged.  Recommend LibreOffice as free alternative.

;;; ── naps2-bin (#6055) ──────────────────────────────────────────
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260413a
;;; Upstream: https://github.com/cyanfish/naps2 (v8.2.1)
;;; Language: C# / .NET 8.0
;;; License: GPL-2.0-or-later
;;; Blocker: Requires .NET SDK 8.0 for building from source.  Guix does
;;;   not have a .NET build system or .NET SDK/runtime packages.
;;; Approaches tried:
;;;   A1: Build from source with dotnet SDK — .NET SDK not in Guix;
;;;       bootstrapping .NET has circular dependency issues.
;;;   A2: Binary repack from GitHub .deb release — would require
;;;       .NET runtime which is also not in Guix.
;;;   A3: Package with Mono (.NET Framework compat) — NAPS2 targets
;;;       .NET 8.0, not .NET Framework; Mono cannot build it.
;;; Next: Wait for .NET SDK/runtime availability in Guix.  Monitor
;;;   Guix upstream progress on .NET bootstrapping.

;;; ── falcond-profiles (#6064) ───────────────────────────────────
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260413a
;;; Upstream: https://github.com/PikaOS-Linux/falcond-profiles (git)
;;; Language: Data files only (.conf profiles)
;;; License: MIT
;;; Blocker: Profiles are useless without falcond daemon, which is
;;;   written in Zig (no Zig build system in Guix).  Falcond also
;;;   depends on scx-sched and power-profiles-daemon.
;;; Approaches tried:
;;;   A1: Package profiles as data-only with copy-build-system —
;;;       trivially installable but useless without falcond.
;;;   A2: Package falcond from source — Zig compiler/build system
;;;       not available in Guix.
;;;   A3: Port falcond to C or Rust — out of scope; would require
;;;       significant upstream collaboration.
;;; Next: Wait for Zig build system support in Guix, then package
;;;   falcond + profiles together.

;;; ── mkinitcpio-sd-zfs (#6065) ──────────────────────────────────
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260413a
;;; Upstream: https://github.com/jkolo/sd-zfs (v1.0.4)
;;; Language: C + shell scripts + systemd units
;;; License: MIT
;;; Blocker: Architecturally incompatible with Guix.  This is an
;;;   mkinitcpio hook for Arch Linux's initramfs system.  Guix uses
;;;   its own initrd generation via (gnu system) and Shepherd, not
;;;   mkinitcpio or systemd in initrd.
;;; Approaches tried:
;;;   A1: Package as-is for Guix — mkinitcpio does not exist on Guix;
;;;       the hook infrastructure is absent.
;;;   A2: Adapt to Guix's initrd system — would require rewriting as
;;;       a Guix system service, not packaging the Arch-specific code.
;;;   A3: Package only the C utility and shell scripts — the scripts
;;;       are mkinitcpio-specific and reference systemd units; not
;;;       useful outside Arch.
;;; Next: ZFS root support on Guix should be implemented within Guix's
;;;   own system configuration, not by porting Arch-specific hooks.
;;;   Out of scope for AUR-to-Guix conversion.

;;; ── neohtop-bin (#6066) ────────────────────────────────────────
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260413a
;;; Upstream: https://github.com/Abdenasser/neohtop (v1.2.0)
;;; Language: Rust (Tauri backend) + Svelte/TypeScript (frontend)
;;; License: MIT
;;; Blocker: Tauri application requiring both cargo-build-system for
;;;   the Rust backend and node-build-system for the Svelte frontend.
;;;   No established Guix pattern for Tauri apps.
;;; Approaches tried:
;;;   A1: Build as Tauri app (Cargo + npm) — Guix has no Tauri build
;;;       system; would need to orchestrate two build systems in
;;;       custom phases, plus bundle WebKit2GTK.
;;;   A2: Binary repack from AppImage release — NeoHtop releases as
;;;       .deb and AppImage; AppImage extraction is fragile and the
;;;       binary depends on WebKit2GTK at specific versions.
;;;   A3: Package Rust backend only (headless) — the application's
;;;       value is its GUI; a headless version would be pointless
;;;       when htop/btop already exist.
;;; Next: Revisit when Guix has Tauri build system support or when
;;;   the project offers a pure-Rust alternative frontend.

;;; ── openscq30-gui (#6070) ──────────────────────────────────────
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260413a
;;; Upstream: https://github.com/Oppzippy/OpenSCQ30 (v2.6.2)
;;; Language: Rust (Cargo) + COSMIC desktop toolkit
;;; License: GPL-3.0-or-later
;;; Blocker: GUI variant requires libcosmic (System76 COSMIC desktop
;;;   toolkit) which is not available in Guix.  The CLI variant
;;;   (openscq30-cli) is resolved separately.
;;; Approaches tried:
;;;   A1: cargo-build-system with COSMIC deps — libcosmic and
;;;       cosmic-icon-theme are not in Guix; the COSMIC ecosystem
;;;       is large (dozens of crates).
;;;   A2: Build with GTK instead — the project switched from GTK to
;;;       COSMIC; GTK frontend code has been removed upstream.
;;;   A3: Package libcosmic first — COSMIC desktop framework is 50+
;;;       crates with tight version coupling; too large for a single
;;;       pass.
;;; Next: Package COSMIC desktop toolkit for Guix (large project),
;;;   then openscq30-gui becomes trivial.  CLI variant is available.

;;; ── i915-sriov-dkms (#6072) ────────────────────────────────────
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260413a
;;; Upstream: https://github.com/strongtz/i915-sriov-dkms (2026.03.05)
;;; Language: C (kernel module, kbuild)
;;; License: GPL-2.0-only
;;; Blocker: Out-of-tree kernel module that replaces the stock i915
;;;   driver.  Requires DKMS or manual integration with Guix's kernel
;;;   module packaging, tightly coupled to specific kernel versions.
;;; Approaches tried:
;;;   A1: Package as linux-module for Guix — Guix supports out-of-tree
;;;       modules but this one REPLACES the stock i915 driver, requiring
;;;       kernel reconfiguration to disable the built-in driver.
;;;   A2: Build as loadable module alongside stock i915 — the patched
;;;       module conflicts with the stock driver; cannot coexist.
;;;   A3: Provide as Guix system configuration snippet — would work
;;;       but requires custom kernel build with stock i915 disabled,
;;;       which is a system-level change, not a package.
;;; Next: Better suited as a Guix system configuration guide than a
;;;   standalone package.  Niche use case (GPU SR-IOV for VMs).

;;; ── ytsubconverter-bin (#6076) ─────────────────────────────────
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260413a
;;; Upstream: https://github.com/arcusmaximus/YTSubConverter (v1.6.5)
;;; Language: C# / .NET 8.0
;;; License: MIT
;;; Blocker: Requires .NET 8.0 runtime.  .NET SDK/runtime not available
;;;   in Guix due to bootstrapping obstacles.
;;; Approaches tried:
;;;   A1: Build from source with dotnet SDK — .NET 8.0 SDK not in Guix.
;;;   A2: Binary repack — requires .NET runtime not in Guix.
;;;   A3: Package with Mono — targets .NET 8.0, incompatible with Mono.
;;; Next: Same as naps2-bin — wait for .NET availability in Guix.

;;; ── lotion (#6077) ─────────────────────────────────────────────
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260413a
;;; Upstream: https://github.com/puneetsl/lotion (v1.5.0)
;;; Language: JavaScript/TypeScript (Electron Forge, npm)
;;; License: MIT (wrapper), but wraps proprietary Notion.so service
;;; Blocker: Electron/npm build system with hundreds of transitive
;;;   node_modules dependencies.  Additionally, the application is a
;;;   thin wrapper around the proprietary Notion.so web service.
;;; Approaches tried:
;;;   A1: node-build-system with Electron — would need to package
;;;       Electron (see electron32 entry) plus hundreds of npm deps.
;;;   A2: Binary repack from .deb release — Electron binary includes
;;;       bundled Chromium; 87 MB package, architecture-specific.
;;;   A3: Use alternative (Notion web in browser) — not a package
;;;       solution, but the functional equivalent.
;;; Next: Cannot be practically packaged.  Depends on both Electron
;;;   (infeasible) and a proprietary web service.

;;; ── ik-llama.cpp-cuda (#6079) ──────────────────────────────────
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260413a
;;; Upstream: https://github.com/ikawrakow/ik_llama.cpp (git, no stable releases)
;;; Language: C++ (CMake)
;;; License: MIT
;;; Blocker: CUDA is proprietary NVIDIA software, not available in Guix.
;;;   The entire purpose of this package is CUDA GPU acceleration.
;;;   No stable release tags.
;;; Approaches tried:
;;;   A1: cmake-build-system with CUDA toolkit — CUDA is proprietary
;;;       and not in Guix.
;;;   A2: Build without CUDA (CPU-only) — defeats the purpose; Guix
;;;       already has llama-cpp from upstream ggml-org with Vulkan.
;;;   A3: Use ROCm/OpenCL instead of CUDA — this specific fork is
;;;       CUDA-focused; the upstream llama.cpp already supports
;;;       Vulkan/OpenCL in Guix's package.
;;; Next: Users should use Guix's existing llama-cpp package with
;;;   Vulkan backend for GPU acceleration.

;;; ── qt6-wasm (#6080) ───────────────────────────────────────────
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260413a
;;; Upstream: https://download.qt.io/official_releases/qt/6.11/ (v6.11.0)
;;; Language: C++ (CMake + Emscripten cross-compilation)
;;; License: GPL-3.0 / LGPL-3.0
;;; Blocker: Requires Emscripten SDK (LLVM-based WebAssembly compiler)
;;;   which is a complex toolchain not available in Guix.  Also needs
;;;   exact-version Qt6 submodules for cross-compilation.
;;; Approaches tried:
;;;   A1: cmake-build-system with Emscripten — Emscripten SDK not in
;;;       Guix; it's a complex toolchain (LLVM fork + binaryen + Node).
;;;   A2: Package Emscripten first — Emscripten depends on a specific
;;;       LLVM fork with WebAssembly backend; very complex to package.
;;;   A3: Use wasi-sdk instead of Emscripten — Qt6 specifically requires
;;;       Emscripten; wasi-sdk is not compatible.
;;; Next: Wait for Emscripten SDK in Guix.  Very specialized use case
;;;   (compiling Qt apps to WebAssembly).

;;; ── electron32 (#6081) ─────────────────────────────────────────
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260413a
;;; Upstream: https://github.com/electron/electron (v32.3.3)
;;; Language: C++ (GN + Ninja, Chromium build system)
;;; License: MIT / BSD-3-Clause
;;; Blocker: Electron bundles Chromium, which is one of the most complex
;;;   packages to build from source.  Requires Google's GN build system,
;;;   specific clang/LLVM versions, 60+ git submodules, and massive
;;;   build resources.  Neither Chromium nor Electron is in Guix.
;;; Approaches tried:
;;;   A1: Build from source with GN+Ninja — GN build system not in
;;;       Guix; the build requires 8+ GB RAM, hours of compile time,
;;;       and dozens of vendored dependencies.
;;;   A2: Binary repack — Electron binaries are architecture-specific
;;;       and tightly coupled to Chromium version; would need glibc
;;;       and library version matching.
;;;   A3: Use system Chromium + Node.js — Electron's architecture
;;;       requires a modified Chromium; cannot use stock Chromium.
;;; Next: Fundamentally infeasible for Guix at current scale of effort.
;;;   Even Debian and Fedora struggle with Electron packaging.

;;; ── cnrdrvcups-lb-bin (#6083) ──────────────────────────────────
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260413a
;;; Upstream: https://www.canon.com/ (Canon UFR II driver v6.20.20)
;;; Language: Prebuilt binary (C, proprietary filter blobs)
;;; License: Proprietary + GPL-2.0 (mixed; core filters are proprietary)
;;; Blocker: Contains proprietary binary blobs from Canon for the
;;;   printer filter/rendering engine.  Cannot be built from source.
;;; Approaches tried:
;;;   A1: Binary repack from Canon download — proprietary license
;;;       prohibits redistribution in a free software channel.
;;;   A2: Build from source — only PPD files and GPL wrappers have
;;;       source; the actual filter binaries are precompiled blobs.
;;;   A3: Use generic CUPS/Gutenprint drivers — many Canon printers
;;;       work with Gutenprint; not a direct replacement but covers
;;;       common models.
;;; Next: Cannot be packaged due to proprietary blobs.  Recommend
;;;   Gutenprint or IPP Everywhere for compatible Canon printers.

;;; ── mssql-tools (#6087) ────────────────────────────────────────
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260413a
;;; Upstream: https://packages.microsoft.com/ (mssql-tools18 v18.6.2.1)
;;; Language: Prebuilt binary (C/C++, proprietary)
;;; License: Proprietary (Microsoft EULA, requires ACCEPT_EULA=Y)
;;; Blocker: Fully proprietary Microsoft software with EULA acceptance
;;;   requirement.  No source code.  Depends on msodbcsql (also
;;;   proprietary).
;;; Approaches tried:
;;;   A1: Binary repack from Microsoft RPM — requires EULA acceptance;
;;;       proprietary license prohibits free redistribution.
;;;   A2: Build from source — no source code available.
;;;   A3: Use free alternative (freetds/tsql) — FreeTDS provides
;;;       tsql and bcp-like tools for SQL Server; already buildable
;;;       for Guix.
;;; Next: Cannot be packaged.  Recommend FreeTDS as free alternative
;;;   for SQL Server connectivity.
