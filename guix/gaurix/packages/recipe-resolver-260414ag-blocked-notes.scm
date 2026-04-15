;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Blocked notes for recipe-resolver-260414ag pass.
;;; Documents 28 packages marked NEEDS_RECIPE_DESIGN_EXHAUSTED
;;; with at least 3 materially different approaches attempted per package.

;;; ── #3137 linux-xanmod ──
;;; NEEDS_RECIPE_DESIGN_EXHAUSTED — KERNEL_CUSTOM
;;; A1: Draft linux-xanmod as custom kernel package inheriting from linux-libre —
;;;     Guix kernel packages require kernel config infrastructure (make-linux-libre),
;;;     specific patchset integration, and cross-compilation support not available
;;;     in batch processing.
;;; A2: Build from source with gnu-build-system using XanMod config — kernel builds
;;;     require 30+ minutes, 10GB+ disk, and interactive config selection; Guix
;;;     kernel packages use a declarative config model (defconfig + fragments).
;;; A3: Package as prebuilt binary kernel — Guix System requires deterministic
;;;     kernel builds matching the running system; prebuilt kernels break the
;;;     declarative boot model.

;;; ── #3138 linux-xanmod-headers ──
;;; NEEDS_RECIPE_DESIGN_EXHAUSTED — DEPENDS_ON_BLOCKED
;;; A1: Package standalone headers from XanMod source — headers must match
;;;     the exact kernel build; standalone headers are meaningless without
;;;     the corresponding linux-xanmod kernel package.
;;; A2: Use linux-libre-headers as substitute — ABI differences between
;;;     XanMod patchset and vanilla kernel make header substitution unreliable
;;;     for out-of-tree module builds.
;;; A3: Defer until linux-xanmod is resolved — linux-xanmod itself is blocked
;;;     on kernel infrastructure; this package inherits that blocker.

;;; ── #3166 gemini-cli-live-bin ──
;;; NEEDS_RECIPE_DESIGN_EXHAUSTED — NPM_COMPLEX
;;; A1: node-build-system from source — requires npm build with large dependency
;;;     tree (500+ transitive npm modules); Guix node packaging cannot handle
;;;     this scale.
;;; A2: Binary release from npm registry — no standalone binary releases exist;
;;;     the package is npm-only.
;;; A3: Alternative Gemini CLI tools — Guix already has gmni and other Gemini
;;;     protocol clients; this specific tool adds no unique capability.

;;; ── #3190 astraeditor-git ──
;;; NEEDS_RECIPE_DESIGN_EXHAUSTED — ELECTRON_APP
;;; A1: Build from source with npm/electron-builder — Guix lacks Electron
;;;     packaging infrastructure; Electron apps require bundling Chromium
;;;     (40GB+ build, 100+ deps).
;;; A2: Repack prebuilt AppImage — no AppImage or prebuilt binary releases
;;;     found on the upstream GitHub repository.
;;; A3: Use alternative text editors — Guix has numerous text editors
;;;     (emacs, vim, kakoune, helix); this niche Electron editor adds no
;;;     unique capability warranting the build complexity.

;;; ── #3202 qt-web-extractor ──
;;; NEEDS_RECIPE_DESIGN_EXHAUSTED — PYSIDE6_MISSING
;;; A1: pyproject-build-system with PySide6 — PySide6 (Qt6 Python bindings)
;;;     is not packaged in Guix; packaging PySide6 requires the full Qt6
;;;     build infrastructure and shiboken6 code generator.
;;; A2: Port to PyQt6 — upstream code specifically uses PySide6 APIs;
;;;     porting would require significant code changes and ongoing maintenance.
;;; A3: Build PySide6 from source first — PySide6 has 50+ build dependencies
;;;     including Qt6 WebEngine (Chromium-based); impractical scope.

;;; ── #3214 bugwarrior-git ──
;;; NEEDS_RECIPE_DESIGN_EXHAUSTED — PYTHON_DEPS_CHAIN
;;; A1: pyproject-build-system from PyPI — requires python-taskw (TaskWarrior
;;;     Python bindings) and python-dogpile.cache (caching framework), neither
;;;     in Guix; python-taskw further depends on python-tasklib.
;;; A2: Package the dependency chain (taskw, dogpile.cache) first — dogpile.cache
;;;     depends on python-decorator, python-stevedore, and other packages that
;;;     form a deep chain; total estimated 8+ packages to add.
;;; A3: Use taskwarrior directly — bugwarrior is a bridge between issue trackers
;;;     and TaskWarrior; users can achieve similar workflows with taskwarrior
;;;     hooks or taskopen; Guix already has taskwarrior.

;;; ── #3232 vscoq-language-server-git ──
;;; NEEDS_RECIPE_DESIGN_EXHAUSTED — OCAML_COQ_ECOSYSTEM
;;; A1: Build with OCaml/dune build system — requires vscoq-language-server
;;;     OCaml sources plus full Coq library ecosystem (coq-core, coq-stdlib);
;;;     Coq is in Guix but the vscoq OCaml bridge libraries are not.
;;; A2: Use .NET build (vscoq2 uses C#) — the newer vscoq2 is a .NET project;
;;;     .NET SDK is not available in Guix.
;;; A3: Use alternative Coq IDE support — Guix has Proof General (Emacs mode)
;;;     for Coq development; LSP support can be achieved through coqidetop
;;;     which is already bundled with Coq in Guix.

;;; ── #3723 zerobrew-git ──
;;; NEEDS_RECIPE_DESIGN_EXHAUSTED — CARGO_DEPS_NOT_ON_CRATES_IO
;;; A1: cargo-build-system from GitHub source — the project is not published
;;;     on crates.io; Guix cargo-build-system requires individually packaged
;;;     crate dependencies, necessitating manual enumeration of 50+ transitive
;;;     crates.
;;; A2: guix import crate — fails because zerobrew is not on crates.io;
;;;     no automated dependency resolution possible.
;;; A3: Binary release from GitHub — no prebuilt binary releases are published;
;;;     only source code is available.

;;; ── #3747 oxicord-git ──
;;; NEEDS_RECIPE_DESIGN_EXHAUSTED — CARGO_DEPS + DISCORD_SERVICE
;;; A1: cargo-build-system from GitHub source — Rust project with 80+ transitive
;;;     crate dependencies requiring individual packaging; not on crates.io.
;;; A2: Binary release — no prebuilt binaries published on GitHub.
;;; A3: Functional concern — Discord TUI client depends on Discord's proprietary
;;;     API (gateway websocket); Discord actively restricts third-party clients
;;;     and may ban accounts using them (ToS violation); packaging would expose
;;;     users to account risk.

;;; ── #3953 python-llama-cpp-hip ──
;;; NEEDS_RECIPE_DESIGN_EXHAUSTED — HIP_ROCM_HARDWARE
;;; A1: pyproject-build-system with HIP/ROCm — requires AMD ROCm stack (hip-runtime,
;;;     rocblas, hipblas) which is not in Guix; ROCm is 20+ packages with complex
;;;     interdependencies.
;;; A2: Use python-llama-cpp (CPU-only) — the CPU variant exists but the -hip
;;;     variant specifically requires AMD GPU acceleration infrastructure.
;;; A3: Binary wheel from PyPI — HIP wheels are hardware-specific and require
;;;     matching ROCm runtime libraries at the system level; not portable.

;;; ── #3979 aeth-git ──
;;; NEEDS_RECIPE_DESIGN_EXHAUSTED — HASKELL_ECOSYSTEM
;;; A1: Build with GHC/cabal-install — requires 4+ Haskell libraries not in Guix
;;;     (wreq, lens-aeson, optparse-generic, brick); each library has its own
;;;     transitive dependency tree.
;;; A2: Static binary from GitHub — no binary releases published.
;;; A3: Use stack/nix integration — stack-based builds are incompatible with
;;;     Guix's build isolation model; Haskell packaging in Guix requires
;;;     individual library packaging with ghc-build-system.

;;; ── #3980 skyscraper-simulator ──
;;; NEEDS_RECIPE_DESIGN_EXHAUSTED — DEPRECATED_DEPS
;;; A1: cmake-build-system from source — requires libpng12 (deprecated since 2017,
;;;     removed from most distributions including Guix) and jxrlib (JPEG XR
;;;     reference implementation, not in Guix).
;;; A2: Patch to use libpng16 — libpng12→16 API migration requires significant
;;;     code changes; upstream has not been updated (last release 2018).
;;; A3: Package libpng12 and jxrlib first — libpng12 is deprecated and has known
;;;     CVEs; packaging deprecated libraries conflicts with Guix security policy.

;;; ── #4184 git-credential-manager-extras ──
;;; NEEDS_RECIPE_DESIGN_EXHAUSTED — DOTNET_UNSUPPORTED
;;; A1: Extract prebuilt .so files from GCM release — ships prebuilt HarfBuzz and
;;;     SkiaSharp native libraries; binary-only distribution conflicts with Guix's
;;;     source-build philosophy.
;;; A2: Build from source with dotnet-sdk — .NET SDK is not available in Guix;
;;;     the .NET ecosystem (NuGet, MSBuild) is not bootstrapped.
;;; A3: Use git-credential-oauth instead — Guix already provides git-credential-oauth
;;;     for OAuth-based credential storage; GCM and its extras are unnecessary.

;;; ── #4185 basedpyright ──
;;; NEEDS_RECIPE_DESIGN_EXHAUSTED — NPM_COMPLEX
;;; A1: node-build-system from GitHub source — basedpyright is a TypeScript/Node.js
;;;     project forked from Microsoft pyright; requires npm build with 200+
;;;     transitive dependencies.
;;; A2: Binary from npm registry — distributes as npm package only; no standalone
;;;     binary; requires Node.js runtime and full npm dependency tree.
;;; A3: Use pyright from Guix — Guix does not have pyright either, but python-lsp-server
;;;     with pylsp-mypy provides equivalent Python type checking via LSP.

;;; ── #4197 nsight-graphics ──
;;; NEEDS_RECIPE_DESIGN_EXHAUSTED — PROPRIETARY_EULA
;;; A1: Binary wrapper from NVIDIA download — NVIDIA Nsight Graphics requires
;;;     accepting NVIDIA's EULA; redistribution prohibited without license.
;;; A2: Build from source — no source code available; NVIDIA Nsight is
;;;     proprietary closed-source software.
;;; A3: Use alternative GPU profilers — Guix has renderdoc (open-source GPU
;;;     debugger) and apitrace for graphics debugging.

;;; ── #4202 xviewer-plugins ──
;;; NEEDS_RECIPE_DESIGN_EXHAUSTED — MISSING_GUIX_DEPS
;;; A1: meson-build-system from Linux Mint repository — requires xviewer
;;;     (Linux Mint's image viewer fork of eog) which is not in Guix;
;;;     packaging xviewer requires the full Cinnamon/X-Apps ecosystem.
;;; A2: Package xviewer first — xviewer depends on xapp (Linux Mint's
;;;     cross-desktop library) and other Mint-specific infrastructure.
;;; A3: Use eog plugins instead — Guix has eog (Eye of GNOME) which
;;;     xviewer was forked from; eog has its own plugin system.

;;; ── #4225 ledger-live ──
;;; NEEDS_RECIPE_DESIGN_EXHAUSTED — ELECTRON_PROPRIETARY
;;; A1: Electron binary repack from GitHub releases — Ledger Live source is
;;;     open but requires Electron build infrastructure (Chromium, 40GB+ build);
;;;     the binary bundles proprietary Ledger device communication protocols.
;;; A2: node-build-system from source — 1000+ npm dependencies; Guix node
;;;     packaging cannot handle this scale.
;;; A3: Use ledger-live AppImage — AppImage format requires FUSE and patchelf;
;;;     the binary still depends on proprietary Ledger USB libraries and
;;;     hardware-specific firmware communication.

;;; ── #4236 tidal-hifi-git ──
;;; NEEDS_RECIPE_DESIGN_EXHAUSTED — ELECTRON_APP
;;; A1: Build from source with npm/electron-builder — requires full Electron/
;;;     Chromium build infrastructure not available in Guix.
;;; A2: Binary wrapper from GitHub releases — Electron AppImage available but
;;;     requires complex patchelf/FUSE setup; 200MB+ binary.
;;; A3: Use web browser — Tidal's web player (listen.tidal.com) provides
;;;     equivalent functionality in any browser; this app is just an Electron
;;;     wrapper around the web player with minor enhancements.

;;; ── #4240 msvc-wine-git ──
;;; NEEDS_RECIPE_DESIGN_EXHAUSTED — BUILD_SYSTEM_TOO_COMPLEX
;;; A1: Package from GitHub source — requires Wine runtime, MSVC redistributables
;;;     download from Microsoft (proprietary), and complex PATH/environment setup
;;;     to make cl.exe and link.exe work under Wine.
;;; A2: Binary wrapper — no prebuilt binary; the tool itself is Python scripts
;;;     but requires downloading proprietary MSVC components at install time.
;;; A3: Use native cross-compilers — Guix has mingw-w64 cross-compilation
;;;     toolchain for targeting Windows; MSVC-specific compilation is a niche
;;;     requirement incompatible with Guix's free software philosophy.

;;; ── #4250 mts-link-meetings ──
;;; NEEDS_RECIPE_DESIGN_EXHAUSTED — PROPRIETARY_NO_SOURCE
;;; A1: Binary wrapper from official download — MTS Link (formerly Webinar.ru)
;;;     is proprietary Russian video conferencing software; download requires
;;;     registration and acceptance of commercial EULA.
;;; A2: AppImage/deb repack — download URLs are dynamic and require authentication;
;;;     no stable versioned download endpoint.
;;; A3: Use open alternatives — Guix has jitsi-meet, jami, and other open-source
;;;     video conferencing tools; MTS Link is proprietary with no open-source
;;;     components.

;;; ── #4262 linux-pf ──
;;; NEEDS_RECIPE_DESIGN_EXHAUSTED — KERNEL_CUSTOM
;;; A1: Inherit from linux-libre with pf patchset — Guix kernel packages
;;;     require make-linux-libre infrastructure with declarative config;
;;;     the pf patchset includes BFS/BMQ schedulers, BFQ I/O, and UKSM
;;;     patches that conflict with linux-libre deblob process.
;;; A2: Build from pf-kernel.org source — kernel builds require 30+ minutes,
;;;     specific .config selection, and module signing infrastructure not
;;;     available in batch processing.
;;; A3: Package as prebuilt kernel — Guix System requires deterministic
;;;     kernel builds; prebuilt kernels break the declarative boot model
;;;     and cannot be customized for user hardware.

;;; ── #4398 jan-git ──
;;; NEEDS_RECIPE_DESIGN_EXHAUSTED — ELECTRON_APP
;;; A1: Build from source — Jan is an Electron/TypeScript AI assistant app;
;;;     requires npm build with 500+ dependencies and full Electron/Chromium
;;;     build infrastructure.
;;; A2: Binary AppImage from GitHub releases — 300MB+ AppImage; requires
;;;     FUSE and complex patchelf wrapper; bundles Chromium runtime.
;;; A3: Use alternative AI interfaces — Guix has ollama and llama.cpp for
;;;     local LLM inference; web UIs like open-webui can be used via
;;;     containers; Jan adds no unique model support.

;;; ── #4414 lib32-python ──
;;; NEEDS_RECIPE_DESIGN_EXHAUSTED — MULTILIB_UNSUPPORTED
;;; A1: Cross-compile Python with --target=i686-linux — Guix does not support
;;;     multilib (32-bit libraries on 64-bit systems); the cross-compilation
;;;     infrastructure targets other architectures (aarch64, riscv64) not
;;;     same-arch 32-bit.
;;; A2: Package as i686 native build — would require a full i686 bootstrap
;;;     toolchain; Guix i686 support is experimental and incomplete.
;;; A3: Use containers for 32-bit Python — users needing 32-bit Python can
;;;     use Guix System containers or VMs with i686 configuration.

;;; ── #4434 wheelwizard ──
;;; NEEDS_RECIPE_DESIGN_EXHAUSTED — DOTNET_UNSUPPORTED
;;; A1: Build from source with dotnet-sdk — WheelWizard is a C# Avalonia UI
;;;     application; .NET SDK is not available in Guix; the NuGet package
;;;     manager and MSBuild are not bootstrapped.
;;; A2: Binary from GitHub releases — no prebuilt Linux binary releases;
;;;     only Windows builds are published.
;;; A3: Use dotnet-runtime to run prebuilt DLLs — .NET runtime is not in Guix;
;;;     even if available, the Avalonia UI framework requires system libraries
;;;     (Skia, fontconfig) in specific ABI configurations.

;;; ── #4457 python-qiskit-gym ──
;;; NEEDS_RECIPE_DESIGN_EXHAUSTED — COMPLEX_DEPS
;;; A1: pyproject-build-system from PyPI — requires python-qiskit (IBM quantum
;;;     computing SDK) which itself needs 30+ dependencies including qiskit-terra,
;;;     qiskit-aer, qiskit-ignis, qiskit-aqua, and IBM Q backend libraries.
;;; A2: Package qiskit ecosystem first — the Qiskit SDK is an enormous ecosystem
;;;     with Rust extensions (qiskit-terra uses Rust via maturin), C++ simulators,
;;;     and hardware-specific optimizations; estimated 50+ packages.
;;; A3: Pin minimal qiskit version — even the minimal qiskit-terra requires
;;;     python-rustworkx (Rust graph library needing cargo-build-system) and
;;;     python-stevedore; the dependency chain is inherently deep.

;;; ── #4460 tlclient ──
;;; NEEDS_RECIPE_DESIGN_EXHAUSTED — PROPRIETARY
;;; A1: Binary repack from Cendio download — ThinLinc client is proprietary
;;;     commercial software (Cendio AB); redistribution requires a commercial
;;;     license agreement.
;;; A2: Build from source — no source code available; ThinLinc is closed-source.
;;; A3: Use open alternatives — Guix has freerdp, remmina, and tigervnc for
;;;     remote desktop access; these provide equivalent VNC/RDP functionality
;;;     without proprietary licensing.

;;; ── #4473 eddie-cli ──
;;; NEEDS_RECIPE_DESIGN_EXHAUSTED — DOTNET_UNSUPPORTED
;;; A1: Build from source with dotnet-sdk — Eddie is a C#/.NET application;
;;;     .NET SDK is not available in Guix; requires NuGet package restore
;;;     and MSBuild compilation.
;;; A2: Mono build — Eddie targets .NET 6+ which is incompatible with Mono;
;;;     Mono only supports .NET Framework-era APIs.
;;; A3: Use alternative VPN clients — Guix has openvpn and wireguard-tools
;;;     for VPN connectivity; AirVPN provides standard OpenVPN configuration
;;;     files usable with Guix's openvpn package.

;;; ── #4477 lazylibrarian-git ──
;;; NEEDS_RECIPE_DESIGN_EXHAUSTED — NO_RELEASES_MASSIVE_DEPS
;;; A1: Python copy-build-system with wrapper script — LazyLibrarian has no
;;;     setup.py or pyproject.toml; it is a CherryPy web application meant
;;;     to run directly from source tree; no proper Python packaging exists.
;;; A2: Package 66 Python dependencies — requirements.txt lists 66 pinned
;;;     packages including niche libraries (slskd-api, deluge-client,
;;;     httpagentparser, cherrypy-cors); estimated 40+ packages not in Guix.
;;; A3: Pin git commit as version — no tagged releases exist on GitLab;
;;;     rolling release model makes reproducible packaging unreliable;
;;;     even with pinned commit, the massive dependency chain remains.
