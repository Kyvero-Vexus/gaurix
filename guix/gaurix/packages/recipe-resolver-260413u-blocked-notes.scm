;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Blocked notes for recipe-resolver-260413u
;;; 14 packages blocked with specific reason codes.

(define-module (gaurix packages recipe-resolver-260413u-blocked-notes))

;;; ── Blocked package notes ──────────────────────────────────────────

;;; 1. csharpier (#925)
;;;    Status: BLOCKED: DOTNET_SDK_MISSING
;;;    Reason: C# code formatter (github.com/belav/csharpier, MIT, v1.2.6).
;;;    Requires .NET SDK 10.0 / ASP.NET runtime which are not available in Guix.
;;;    Approaches: A1: dotnet publish from source — needs dotnet-sdk not in Guix.
;;;    A2: Pre-built NuGet tool — requires dotnet runtime, also not in Guix.
;;;    A3: Binary from CI artifacts — no standalone binary releases on GitHub.
;;;    Verdict: BLOCKED — .NET SDK/runtime not available in Guix.

;;; 2. qt6-base-hifps (#939)
;;;    Status: BLOCKED: FULL_QT6_REBUILD
;;;    Reason: Qt6 base library with high-FPS animation patch applied.
;;;    This is a full Qt6 rebuild (60+ deps) with a single patch changing
;;;    animation frame rate.  Described by AUR maintainer as "just a hack."
;;;    Approaches: A1: Rebuild qt6-base with patch — requires entire Qt6 build
;;;    infrastructure (50+ deps, multi-hour build).
;;;    A2: Package as patch-only overlay — Guix doesn't support binary patching.
;;;    A3: Skip — functionality is a minor cosmetic tweak.
;;;    Verdict: BLOCKED — full Qt6 rebuild impractical for single animation FPS patch.

;;; 3. ttime-bin (#1366)
;;;    Status: BLOCKED: PYTHON_DEPS_NEEDED
;;;    Reason: Terminal time tracker (github.com/Techsmith404/ttime, GPL-3.0).
;;;    Python app requiring python-pyfiglet (now packaged above) and
;;;    python-playsound3 (audio playback library with complex backend deps
;;;    including GStreamer/PulseAudio/ALSA integration).
;;;    Approaches: A1: Package python-playsound3 — needs GStreamer Python bindings
;;;    and audio backend wiring.
;;;    A2: Patch out audio notifications — loses core timer feature.
;;;    A3: Use python-pyfiglet recipe above and defer playsound3 to next pass.
;;;    Verdict: BLOCKED — python-playsound3 audio backend complexity; pyfiglet
;;;    now packaged as dependency for future resolution.

;;; 4. lib32-zix (#2584)
;;;    Status: BLOCKED: MULTILIB_UNSUPPORTED
;;;    Reason: 32-bit build of zix library.  Guix does not natively support
;;;    multilib/32-bit builds on x86_64.
;;;    Approaches: A1: Cross-compile for i686 — Guix cross-compilation doesn't
;;;    produce lib32 packages compatible with native x86_64 systems.
;;;    A2: Native i686 build — only useful on 32-bit systems.
;;;    A3: Skip — lib32 packages are Arch Linux multilib-specific.
;;;    Verdict: BLOCKED — Guix lacks multilib support.

;;; 5. brother-mfc-l2710dw (#2714)
;;;    Status: BLOCKED: PROPRIETARY_BINARY_REPACK
;;;    Reason: Brother printer driver (proprietary, binary-only i386 RPM).
;;;    Requires 32-bit glibc and cups integration.
;;;    Approaches: A1: Repack RPM with patchelf — needs lib32-glibc for i386
;;;    binaries, not available in Guix.
;;;    A2: Use Brother's .deb package — same 32-bit dependency issue.
;;;    A3: Open-source alternative — no FOSS driver for this model.
;;;    Verdict: BLOCKED — proprietary 32-bit binary; Guix lacks lib32 support.

;;; 6. plasma-workspace-povd (#2890)
;;;    Status: BLOCKED: FULL_KDE_REBUILD
;;;    Reason: KDE Plasma workspace with POVD (persistent OSD volume display)
;;;    patches applied to 4 separate KDE packages (plasma-wayland-protocols,
;;;    kwin, plasma-workspace, plasma-desktop).  60+ dependencies.
;;;    Approaches: A1: Rebuild all 4 patched KDE packages — massive dep tree,
;;;    multi-hour build, maintenance burden.
;;;    A2: Package as patch overlay — Guix doesn't support binary patching.
;;;    A3: Submit patches upstream — out of scope for packaging.
;;;    Verdict: BLOCKED — requires patching 4 KDE packages; impractical.

;;; 7. i2p-bin (#3141)
;;;    Status: BLOCKED: JAVA_INTERACTIVE_INSTALLER
;;;    Reason: I2P anonymous network router binary (Java).  Distributed as
;;;    IzPack installer JAR that requires interactive GUI installation.
;;;    Approaches: A1: Run IzPack headless — requires java-izpack-installer
;;;    and auto-install XML, complex setup.
;;;    A2: Extract JAR contents manually — installer is not a simple archive.
;;;    A3: Build i2p from source — complex Java/Ant build with 30+ deps.
;;;    Verdict: BLOCKED — interactive Java installer; build-from-source too complex.

;;; 8. linux-show-player (#3172)
;;;    Status: BLOCKED: PYTHON_DEPS_CHAIN
;;;    Reason: Python cue player for live shows.  Needs 6+ missing Python
;;;    packages: python-falcon, python-mido, python-jack-client,
;;;    python-rtmidi, python-sortedcontainers, python-pyliblo.
;;;    Approaches: A1: Package all 6 deps first — feasible but deep chain,
;;;    some deps have C extensions (python-rtmidi, python-jack-client).
;;;    A2: Use AppImage/Flatpak — neither available for this app.
;;;    A3: Defer to dedicated Python packaging pass.
;;;    Verdict: BLOCKED — 6+ missing Python deps with C extensions.

;;; 9. youtube-music-desktop (#3192)
;;;    Status: BLOCKED: QTWS_NOT_IN_GUIX
;;;    Reason: QtWS (Qt Web Shell) wrapper around YouTube Music website.
;;;    Depends on qtws-base package which is not in Guix.  qtws-base itself
;;;    is a Qt6/WebEngine wrapper framework.
;;;    Approaches: A1: Package qtws-base first — requires Qt6WebEngine which
;;;    is a very heavy dependency.
;;;    A2: Create standalone QtWebEngine wrapper — still needs Qt6WebEngine.
;;;    A3: Use electron alternative — different upstream, not this package.
;;;    Verdict: BLOCKED — depends on qtws-base (not in Guix).

;;; 10. dropdeck-git (#3260)
;;;     Status: BLOCKED: QUICKSHELL_NOT_IN_GUIX
;;;     Reason: Presentation tool using Quickshell framework.
;;;     Depends on quickshell which is not available as a runtime in Guix
;;;     (only as a compat alias).
;;;     Approaches: A1: Package with quickshell as input — quickshell compat
;;;     alias may not provide needed runtime features.
;;;     A2: Build from source with quickshell — requires full Quickshell dev
;;;     environment and Qt6 stack.
;;;     A3: Skip — niche presentation tool.
;;;     Verdict: BLOCKED — depends on Quickshell runtime not fully available.

;;; 11. meteobar (#3272)
;;;     Status: BLOCKED: CARGO_DEPS_NEEDED
;;;     Reason: Weather status bar app (github.com/mryll/meteobar, MIT, v0.1.8).
;;;     Rust/Cargo project requiring full crate dependency enumeration.
;;;     Approaches: A1: cargo-build-system — needs all crate deps individually
;;;     packaged (reqwest, serde, tokio, and many transitive deps).
;;;     A2: guix import crate — produces incomplete results for this project.
;;;     A3: Pre-built binary — no binary releases on GitHub.
;;;     Verdict: BLOCKED — Rust/Cargo with extensive crate dependency tree.

;;; 12. radicle-node (#3344)
;;;     Status: BLOCKED: CARGO_DEPS_NEEDED
;;;     Reason: P2P code collaboration node (radicle-dev/heartwood, Apache-2.0/MIT).
;;;     Large Rust/Cargo project with 80+ transitive crate dependencies.
;;;     Approaches: A1: cargo-build-system — massive crate dep tree (80+).
;;;     A2: Pre-built static binary from files.radicle.xyz — requires trust
;;;     in external binary distribution, non-standard URL scheme.
;;;     A3: guix import crate recursive — too many missing crates.
;;;     Verdict: BLOCKED — Rust/Cargo with 80+ transitive crate deps.

;;; 13. ccase (#2499)
;;;     Status: BLOCKED: CARGO_DEPS_NEEDED
;;;     Reason: Case conversion CLI (github.com/rutrum/ccase, MIT, v0.5.1).
;;;     Rust/Cargo project.  Small dep count (~5 direct) but clap brings
;;;     ~30 transitive crate deps.
;;;     Approaches: A1: cargo-build-system — needs clap ecosystem (~30 crates).
;;;     A2: guix import crate — may bootstrap but won't resolve all transitive.
;;;     A3: Pre-built binary — no releases on GitHub.
;;;     Verdict: BLOCKED — Rust/Cargo; clap dependency tree (~30 crates).

;;; 14. sentinelagent (#3411)
;;;     Status: BLOCKED: PROPRIETARY_CLOSED_SOURCE
;;;     Reason: SentinelOne endpoint security agent.  Proprietary closed-source
;;;     binary with enterprise license.  No public download URL without
;;;     customer authentication.
;;;     Approaches: A1: Binary repack — no public download URL.
;;;     A2: Build from source — proprietary, no source available.
;;;     A3: Skip — enterprise security product, not distributable.
;;;     Verdict: BLOCKED — proprietary closed-source; no public download.

;;; 15. claude-agent-acp (#2533)
;;;     Status: BLOCKED: NPM_DEPS_NEEDED
;;;     Reason: Node.js application for Claude agent protocol.
;;;     Requires npm dependency tree resolution and bundling.
;;;     Approaches: A1: node-build-system — Guix node packaging is immature,
;;;     npm dependency trees are difficult to vendor.
;;;     A2: Binary from releases — check if standalone binary exists.
;;;     A3: Bundle with node_modules — reproducibility concerns.
;;;     Verdict: BLOCKED — npm/Node.js dependency management not resolved.
