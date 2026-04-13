;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Blocked notes for recipe-resolver-260413r
;;; 24 packages blocked with specific reason codes.

(define-module (gaurix packages recipe-resolver-260413r-blocked-notes))

;;; ── Blocked package notes ──────────────────────────────────────────

;;; 1. lib32-xrizer (#256)
;;;    Status: BLOCKED: MULTILIB_UNSUPPORTED
;;;    Reason: 32-bit OpenVR-to-OpenXR translation layer requiring multilib Rust.
;;;    Guix does not natively support multilib/32-bit builds on x86_64.
;;;    Approaches: A1: cross-compile for i686 — Guix lacks lib32 Rust toolchain.
;;;    A2: 64-bit only build — breaks 32-bit VR apps.
;;;    A3: Guix multilib support — not available, would require upstream changes.
;;;    Verdict: PERMANENTLY_BLOCKED — requires multilib infrastructure Guix does not provide.

;;; 2. chromium-gost (#757)
;;;    Status: BLOCKED: INFEASIBLE_BUILD
;;;    Reason: Full Chromium fork with Russian GOST crypto patches.
;;;    Chromium requires ~40GB build, 16GB+ RAM, hours of compile time.
;;;    Approaches: A1: Build from source — infeasible in batch, needs dedicated
;;;    Chromium packaging infrastructure (electron-like).
;;;    A2: Binary repackage — proprietary/redistribution unclear for patched Chromium.
;;;    A3: Patch upstream chromium — Guix chromium not maintained in main repo.
;;;    Verdict: INFEASIBLE — full Chromium build infrastructure required.

;;; 3. csharpier (#925)
;;;    Status: BLOCKED: DOTNET_UNSUPPORTED
;;;    Reason: C# code formatter requiring .NET SDK/runtime.
;;;    Guix lacks .NET/dotnet build system, SDK, and runtime packages.
;;;    Approaches: A1: dotnet-build-system — does not exist in Guix.
;;;    A2: Package dotnet-sdk first — massive undertaking (bootstrapping .NET).
;;;    A3: Pre-built binary — dotnet self-contained builds are ~80MB, need
;;;    patchelf for glibc/openssl/icu.
;;;    Verdict: BLOCKED until .NET ecosystem is bootstrapped in Guix.

;;; 4. qt6-base-hifps (#939)
;;;    Status: BLOCKED: INFEASIBLE_BUILD
;;;    Reason: Qt6 base variant patched for high-FPS rendering.
;;;    Requires full Qt6 build from source (~2h compile) with custom patches.
;;;    Approaches: A1: Inherit from qt6-base, apply patches — qt6-base build
;;;    infrastructure in Guix exists but patches are version-specific.
;;;    A2: Package as qt6-base variant — version sync with Guix qt6-base
;;;    is fragile across updates.
;;;    A3: Skip — niche use case (high refresh rate monitors).
;;;    Verdict: INFEASIBLE in batch — requires dedicated Qt6 patching pass.

;;; 5. python-opentelemetry-exporter-zipkin-proto-http (#2144)
;;;    Status: BLOCKED: OTEL_CHAIN_NEEDED
;;;    Reason: Part of OpenTelemetry Python ecosystem.  Depends on
;;;    python-opentelemetry-api, python-opentelemetry-sdk,
;;;    python-opentelemetry-exporter-zipkin-json, python-protobuf.
;;;    Approaches: A1: pyproject-build-system — blocked by 4+ missing OTel deps.
;;;    A2: Package entire OTel chain first — 15+ packages needed
;;;    (api, sdk, semantic-conventions, proto, exporters).
;;;    A3: Vendor deps — API compatibility issues across OTel versions.
;;;    Verdict: BLOCKED — needs dedicated OpenTelemetry Python packaging pass.

;;; 6. ccase (#2499)
;;;    Status: BLOCKED: CARGO_DEPS_NEEDED
;;;    Reason: Rust CLI for string case conversion (MIT, github.com/rutrum/ccase).
;;;    No pre-built binary releases for v0.5.1.  Old v0.4.1 had .deb but outdated.
;;;    Approaches: A1: cargo-build-system — needs full cargo-inputs enumeration
;;;    (30+ transitive crate deps).
;;;    A2: guix import crate ccase — may bootstrap partial definition.
;;;    A3: Binary from old release — v0.4.1 .deb exists but 2 major versions behind.
;;;    Verdict: BLOCKED — needs dedicated Rust crate enumeration pass.

;;; 7. claude-agent-acp (#2533)
;;;    Status: BLOCKED: NPM_COMPLEX
;;;    Reason: Node.js/npm package for Claude Agent ACP protocol
;;;    (github.com/zed-industries/claude-agent-acp).
;;;    Approaches: A1: node-build-system — npm dependency tree too deep for batch.
;;;    A2: Bundle node_modules — reproducibility concerns.
;;;    A3: Binary wrapper — no standalone binary releases.
;;;    Verdict: BLOCKED — Guix npm packaging requires manual dep enumeration.

;;; 8. lib32-zix (#2584)
;;;    Status: BLOCKED: MULTILIB_UNSUPPORTED
;;;    Reason: 32-bit zix C library (lightweight data structures).
;;;    Guix does not natively support multilib/32-bit builds.
;;;    Approaches: A1: Cross-compile for i686 — meson cross-file needed.
;;;    A2: 64-bit only — breaks lib32 dependents.
;;;    A3: Guix multilib — not available.
;;;    Verdict: PERMANENTLY_BLOCKED — requires multilib infrastructure.

;;; 9. brother-mfc-l2710dw (#2714)
;;;    Status: BLOCKED: PROPRIETARY_LICENSE
;;;    Reason: Brother MFC-L2710DW printer driver.
;;;    License: custom:brother commercial license.  Depends on lib32-glibc
;;;    (binary blob driver).
;;;    Approaches: A1: Package proprietary binary — violates Guix FSDG.
;;;    A2: Open-source driver alternative — none exists for this model.
;;;    A3: Generic CUPS/IPP driver — may work for basic printing without
;;;    this package.
;;;    Verdict: PERMANENTLY_BLOCKED — proprietary license incompatible with Guix FSDG.

;;; 10. plasma-workspace-povd (#2890)
;;;     Status: BLOCKED: INFEASIBLE_BUILD
;;;     Reason: KDE Plasma Workspace fork with per-output virtual desktop patches.
;;;     Requires full KDE Plasma 6 stack (~100+ packages).
;;;     Approaches: A1: cmake-build-system — needs full Plasma 6 stack.
;;;     A2: Patch existing plasma-workspace — version sync issues.
;;;     A3: Binary — none available.
;;;     Verdict: INFEASIBLE — massive KDE dependency tree.

;;; 11. youtube-music-desktop (#3192)
;;;     Status: BLOCKED: MISSING_GUIX_DEPS
;;;     Reason: YouTube Music web-app wrapper depending on qtws-base
;;;     (Qt Web Shell, not in Guix).
;;;     Approaches: A1: Package qtws-base first — Qt5 WebEngine wrapper, complex.
;;;     A2: Electron alternative — different project entirely.
;;;     A3: Browser bookmark — not a package.
;;;     Verdict: BLOCKED — needs qtws-base packaged first.

;;; 12. oopz (#3480)
;;;     Status: BLOCKED: PROPRIETARY_LICENSE + MISSING_GUIX_DEPS
;;;     Reason: OOPZ desktop client (Electron wrapper).
;;;     License: LicenseRef-Proprietary.  Source hosted on private Gitea.
;;;     Depends on electron39 (not in Guix).
;;;     Approaches: A1: Package electron39 — massive undertaking (Chromium-based).
;;;     A2: System electron — version mismatch.
;;;     A3: AppImage — none available.
;;;     Verdict: PERMANENTLY_BLOCKED — proprietary license + electron dependency.

;;; 13. critique (#4383)
;;;     Status: BLOCKED: MISSING_GUIX_DEPS
;;;     Reason: Terminal UI for reviewing git diffs (MIT, github.com/remorses/critique).
;;;     Depends on Bun JavaScript runtime (not packaged in Guix).
;;;     Approaches: A1: Package Bun first — Bun is a large Zig+C++ project,
;;;     complex build, Zig compiler not in Guix.
;;;     A2: Port to Node.js — upstream is Bun-only.
;;;     A3: Pre-built binary — none published.
;;;     Verdict: BLOCKED — Bun runtime not available in Guix.

;;; 14. ccusage (#4690)
;;;     Status: BLOCKED: NPM_COMPLEX
;;;     Reason: CLI for analyzing Claude Code token usage (MIT,
;;;     github.com/ryoppippi/ccusage).  Node.js/npm package.
;;;     Approaches: A1: node-build-system — npm dep tree too deep for batch.
;;;     A2: Bundle node_modules — reproducibility concerns.
;;;     A3: Binary — no standalone binaries published.
;;;     Verdict: BLOCKED — needs npm dependency enumeration.

;;; 15. brother-cups-wrapper-common (#9816)
;;;     Status: BLOCKED: PROPRIETARY_LICENSE
;;;     Reason: Common files for Brother CUPS wrapper packages.
;;;     License: custom:brother commercial license + GPL (dual).
;;;     Depends on brother-lpr-drivers-common (also proprietary).
;;;     Approaches: A1: Package proprietary bits — violates Guix FSDG.
;;;     A2: GPL-only subset — unclear what is GPL vs proprietary.
;;;     A3: Skip — use generic CUPS/IPP drivers instead.
;;;     Verdict: PERMANENTLY_BLOCKED — proprietary license.

;;; 16. linux-zen-versioned-headers-bin (#9954)
;;;     Status: BLOCKED: ARCH_SPECIFIC
;;;     Reason: Arch Linux metapackage for binary Zen kernel headers.
;;;     Guix uses its own kernel build infrastructure; binary kernel headers
;;;     from Arch are not meaningful.
;;;     Verdict: PERMANENTLY_BLOCKED — Arch-specific kernel metapackage.

;;; 17. linux-zen-versioned-docs-bin (#9955)
;;;     Status: BLOCKED: ARCH_SPECIFIC
;;;     Reason: Arch Linux metapackage for binary Zen kernel docs.
;;;     Same as linux-zen-versioned-headers-bin.
;;;     Verdict: PERMANENTLY_BLOCKED — Arch-specific kernel metapackage.

;;; 18. lib32-libtxc_dxtn (#10703)
;;;     Status: BLOCKED: MULTILIB_UNSUPPORTED
;;;     Reason: 32-bit S3TC texture compression library.
;;;     Guix does not support multilib/32-bit builds.
;;;     Modern Mesa includes S3TC support natively.
;;;     Verdict: PERMANENTLY_BLOCKED — multilib + obsolete (Mesa includes S3TC).

;;; 19. yabridgectl-wine10-git (#11948)
;;;     Status: BLOCKED: WINE_BRIDGE_COMPLEX
;;;     Reason: Yabridge controller for Wine 10 VST bridging
;;;     (GPL-3.0, github.com/robbert-vdh/yabridge).
;;;     Build requires: asio, bitsery, clap, cmake, function2, ghc-filesystem,
;;;     git, libxcb, meson, rust, tomlplusplus, wine.
;;;     Approaches: A1: Meson build — many missing deps (bitsery, clap VST SDK,
;;;     function2, ghc-filesystem, tomlplusplus).
;;;     A2: Package deps first — 6+ missing libraries.
;;;     A3: Wine integration — requires functional Wine in Guix.
;;;     Verdict: BLOCKED — deep dependency chain + Wine integration complexity.

;;; 20. lib32-libudev0-shim (#11976)
;;;     Status: BLOCKED: MULTILIB_UNSUPPORTED
;;;     Reason: 32-bit libudev.so.0 compatibility shim.
;;;     Guix does not support multilib/32-bit builds.
;;;     Approaches: A1: Cross-compile for i686 — complex ABI compat.
;;;     A2: Skip — limited 64-bit use case.
;;;     Verdict: PERMANENTLY_BLOCKED — multilib infrastructure not available.

;;; 21. sonic-win (#11979)
;;;     Status: BLOCKED: WINDOWS_SPECIFIC
;;;     Reason: Windows-specific build of Sonic Visualiser.
;;;     No utility on Linux/Guix systems.
;;;     Verdict: PERMANENTLY_BLOCKED — Windows-only package.

;;; 22. nvidia-utils-beta (#12012)
;;;     Status: BLOCKED: PROPRIETARY_LICENSE
;;;     Reason: NVIDIA beta driver utilities.
;;;     License: LicenseRef-custom (proprietary NVIDIA license).
;;;     Depends on proprietary NVIDIA driver stack (egl-gbm, egl-wayland,
;;;     libglvnd with NVIDIA patches).
;;;     Approaches: A1: Package proprietary binary — violates Guix FSDG.
;;;     A2: Nouveau — open-source alternative exists, different package.
;;;     A3: Nonguix channel — appropriate home for proprietary drivers.
;;;     Verdict: PERMANENTLY_BLOCKED — proprietary license.

;;; 23. python-opentelemetry-exporter-otlp-proto-common (#12066)
;;;     Status: BLOCKED: OTEL_CHAIN_NEEDED
;;;     Reason: OpenTelemetry OTLP protobuf encoding.
;;;     Same OpenTelemetry dependency chain as #5 above.
;;;     Depends on python-opentelemetry-api, python-opentelemetry-proto,
;;;     python-opentelemetry-sdk (none in Guix).
;;;     Verdict: BLOCKED — needs dedicated OpenTelemetry Python packaging pass.

;;; 24. mkinitcpio-sd-numlock (#12123)
;;;     Status: BLOCKED: ARCH_SPECIFIC
;;;     Reason: mkinitcpio hook for enabling numlock via systemd in early boot.
;;;     Guix uses Shepherd (not systemd) and its own boot system (not mkinitcpio).
;;;     Verdict: PERMANENTLY_BLOCKED — Arch/systemd-specific boot hook.

;;; 25. lib32-l-smash (#12171)
;;;     Status: BLOCKED: MULTILIB_UNSUPPORTED
;;;     Reason: 32-bit L-SMASH MP4 muxer library.
;;;     Guix does not support multilib/32-bit builds.
;;;     Verdict: PERMANENTLY_BLOCKED — multilib infrastructure not available.

;;; --- Additional re-evaluated packages ---

;;; 26. ttime-bin (#1366)
;;;     Status: BLOCKED: PYTHON_DEPS_NEEDED
;;;     Reason: Terminal countdown timer (GPL-3.0, github.com/Techsmith404/ttime).
;;;     Depends on python-pyfiglet and python-playsound3, neither in Guix.
;;;     Approaches: A1: pyproject-build-system — 2 missing Python deps.
;;;     A2: Package python-pyfiglet first — feasible but python-playsound3
;;;     has complex audio backend requirements (GStreamer or platform audio).
;;;     A3: Skip playsound3 — timer loses audio notification feature.
;;;     Verdict: BLOCKED — needs python-pyfiglet + python-playsound3 packaged.

;;; 27. d1x-rebirth (#10230) — RESOLVED: recipe created (gnu-build-system + scons).

;;; 28. energygraph (#10244) — RESOLVED: recipe created (gnu-build-system).

;;; 29. mindustry-server-bin (#10015) — RESOLVED: recipe created (copy-build-system, Java JAR).

;;; 30. cutieascii (#4549) — RESOLVED: recipe created as cutieascii-bin (copy-build-system).
