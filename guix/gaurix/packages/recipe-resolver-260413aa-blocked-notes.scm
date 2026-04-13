;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Blocked notes for recipe-resolver-260413aa
;;; 30 packages re-evaluated with specific reason codes.

(define-module (gaurix packages recipe-resolver-260413aa-blocked-notes))

;;; ── Blocked package notes ──────────────────────────────────────────

;;; 1. lib32-xrizer (#256)
;;;    Status: BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — MULTILIB_UNSUPPORTED
;;;    Reason: 32-bit build of xrizer (OpenVR/OpenXR translation layer).
;;;    Requires lib32-glibc, lib32-gcc-libs, lib32-rust-libs — all 32-bit
;;;    multilib libraries that Guix does not support.
;;;    Approaches: A1: Cross-compile for i686 — Guix cross-compilation does not
;;;    produce lib32 packages compatible with native x86_64 systems.
;;;    A2: Build natively on i686 — only useful on 32-bit systems, not a
;;;    replacement for multilib.
;;;    A3: Package the 64-bit xrizer instead — that's a separate package (xrizer).
;;;    Verdict: BLOCKED — Guix lacks multilib support; 32-bit variant infeasible.

;;; 2. chromium-gost (#757)
;;;    Status: BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — INFEASIBLE_BUILD
;;;    Reason: Chromium fork with Russian GOST cryptographic extensions
;;;    (github.com/deemru/Chromium-Gost, MIT, v142.0.7444.176).
;;;    Full Chromium source build requires ~40GB disk, hours of compilation,
;;;    and a complex build system (GN/Ninja) with hundreds of dependencies.
;;;    Approaches: A1: Build from source — requires full Chromium build infra
;;;    (~40GB, 100+ deps, GN build system not available in Guix).
;;;    A2: Package prebuilt binary — no official binary releases for Linux.
;;;    A3: Patch existing Guix Chromium — Guix does not package Chromium at all
;;;    (only ungoogled-chromium via Flatpak, not a native package).
;;;    Verdict: BLOCKED — full Chromium build infeasible; no binary releases.

;;; 3. qt6-base-hifps (#939)
;;;    Status: BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — FULL_QT6_REBUILD
;;;    Reason: Qt6 base library patched for high-FPS animations
;;;    (single animation tick patch, described as "just a hack" by AUR maintainer).
;;;    Requires rebuilding entire Qt6 base (50+ deps, multi-hour build) for a
;;;    cosmetic change.
;;;    Approaches: A1: Full Qt6 rebuild with patch — impractical for channel
;;;    maintenance (50+ transitive deps, hours of build time per update).
;;;    A2: Binary patch overlay — not supported by Guix's functional model.
;;;    A3: Propose patch upstream to Qt project — not our scope.
;;;    Verdict: BLOCKED — full Qt6 rebuild impractical for single animation patch.

;;; 4. plasma-workspace-povd (#2890)
;;;    Status: BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — FULL_KDE_REBUILD
;;;    Reason: KDE Plasma workspace with POVD (Persistent On-screen Virtual
;;;    Desktop) patches requiring rebuilding kwin-povd, plasma-wayland-protocols-
;;;    povd, and 4+ core KDE packages (60+ transitive deps).
;;;    Approaches: A1: Rebuild KDE stack with POVD patches — requires packaging
;;;    the entire KDE Plasma stack (not in Guix) plus custom patches.
;;;    A2: Overlay/patch approach — Guix has no KDE Plasma base to patch.
;;;    A3: Extract POVD feature as standalone — tightly integrated into kwin.
;;;    Verdict: BLOCKED — KDE Plasma not in Guix; full rebuild impractical.

;;; 5. csharpier (#925)
;;;    Status: BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — DOTNET_ECOSYSTEM
;;;    Reason: C# code formatter (github.com/belav/csharpier, MIT, v1.2.6).
;;;    Requires .NET SDK 10.0 / ASP.NET runtime not available in Guix.
;;;    Approaches: A1: dotnet publish — needs dotnet-sdk not in Guix.
;;;    A2: NuGet tool — needs dotnet runtime not in Guix.
;;;    A3: Standalone binary from CI — no standalone releases on GitHub.
;;;    Verdict: BLOCKED — .NET SDK/runtime ecosystem not available in Guix.

;;; 6. discord-chat-exporter-plus-cli (#3117)
;;;    Status: BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — DOTNET_ECOSYSTEM
;;;    Reason: Discord chat export tool (github.com/nulldg/DiscordChatExporterPlus,
;;;    MIT, v2.47.1).  Requires dotnet-sdk-10.0 to build and dotnet-runtime-10.0
;;;    to run.
;;;    Approaches: A1: dotnet publish — needs dotnet-sdk not in Guix.
;;;    A2: Self-contained binary — project releases are .NET-dependent, not
;;;    standalone.
;;;    A3: Package dotnet-sdk first — massive bootstrap effort, not in scope.
;;;    Verdict: BLOCKED — .NET ecosystem not bootstrapped in Guix.

;;; 7. opentabletdriver-git (#3233)
;;;    Status: BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — DOTNET_ECOSYSTEM
;;;    Reason: Open-source tablet driver (opentabletdriver.net, LGPL-3.0).
;;;    Requires dotnet-sdk >= 8.0 to build.  C# project with GTK3 frontend.
;;;    Approaches: A1: dotnet build — needs dotnet-sdk not in Guix.
;;;    A2: Pre-built tarball — releases are .NET-dependent, not standalone.
;;;    A3: Port to non-.NET language — not feasible.
;;;    Verdict: BLOCKED — .NET ecosystem not bootstrapped in Guix.

;;; 8. obs-scrab (#3244)
;;;    Status: BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — OBS_NOT_IN_GUIX
;;;    Reason: OBS Studio screenshot plugin (obsproject.com/forum, GPL-2.0).
;;;    Requires OBS Studio >= 28 which is not packaged in Guix.
;;;    Approaches: A1: Package OBS Studio first — complex CMake build with
;;;    Qt6, FFmpeg, and dozens of media deps; major undertaking.
;;;    A2: Package plugin without OBS — useless without the host application.
;;;    A3: Use Flatpak OBS with plugin — Flatpak plugins don't work this way.
;;;    Verdict: BLOCKED — OBS Studio not available in Guix.

;;; 9. obs-vnc (#3245)
;;;    Status: BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — OBS_NOT_IN_GUIX
;;;    Reason: OBS Studio VNC source plugin (GPL-2.0, v0.6.2).
;;;    Requires OBS Studio >= 28 which is not packaged in Guix.
;;;    Approaches: same as obs-scrab above.
;;;    Verdict: BLOCKED — OBS Studio not available in Guix.

;;; 10. yay-sys-tray-git (#3259)
;;;    Status: BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — ARCH_SPECIFIC
;;;    Reason: System tray indicator for yay (AUR helper) update notifications.
;;;    Depends on yay and pacman-contrib which are Arch Linux package manager
;;;    tools with no Guix equivalent or utility.
;;;    Approaches: A1: Port to Guix update checking — different tool entirely.
;;;    A2: Package without pacman deps — core functionality is pacman-based.
;;;    A3: Skip — no utility outside Arch ecosystem.
;;;    Verdict: BLOCKED — Arch-specific tool with pacman/yay dependencies.

;;; 11. scap-security-guide (#3239)
;;;    Status: BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — DISTRO_SPECIFIC
;;;    Reason: SCAP security compliance content for Fedora, RHEL, Debian, Ubuntu,
;;;    SUSE, etc. (BSD-3-Clause, v0.1.78).  Contains distro-specific security
;;;    policies and benchmarks.  No Guix System profile exists.
;;;    Approaches: A1: Package as-is — content is useless without Guix-specific
;;;    SCAP profiles (none exist).
;;;    A2: Create Guix SCAP profile — massive effort, out of scope.
;;;    A3: Skip — not applicable to Guix System.
;;;    Verdict: BLOCKED — distro-specific compliance content, not applicable to Guix.

;;; 12. mingw-w64-zlib-ng (#3363)
;;;    Status: BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — CROSS_COMPILATION_TARGET
;;;    Reason: zlib-ng built for mingw-w64 (Windows cross-compilation target).
;;;    Depends on mingw-w64-crt and mingw-w64-cmake, both Windows toolchain
;;;    components.
;;;    Approaches: A1: Use Guix cross-compilation to Windows — Guix supports
;;;    mingw-w64 cross-compilation natively, no special package needed.
;;;    A2: Package for Linux — that's just zlib-ng (already exists or trivial).
;;;    A3: Skip — niche Windows cross-compilation package.
;;;    Verdict: BLOCKED — Windows cross-compilation target; Guix handles this
;;;    natively via its cross-compilation infrastructure.

;;; 13. archforge (#3419)
;;;    Status: BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — ARCH_SPECIFIC
;;;    Reason: Arch Linux system setup/configuration tool
;;;    (github.com/Scqxd/archforge, MIT, v0.2.5).  Rust/Cargo tool that
;;;    automates Arch Linux system configuration.
;;;    Approaches: A1: Package for Guix — tool is Arch-specific (PKGBUILD
;;;    generation, pacman integration), no utility on Guix.
;;;    A2: Fork/adapt for Guix — different tool entirely.
;;;    A3: Skip — Arch-specific utility.
;;;    Verdict: BLOCKED — Arch Linux-specific tool, no utility on Guix.

;;; 14. mx-samba-config (#3429)
;;;    Status: BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — DISTRO_SPECIFIC
;;;    Reason: MX Linux Samba configuration GUI (github.com/MX-Linux/mx-samba-config,
;;;    GPL-3.0, v26.03).  Qt6/CMake application designed specifically for MX Linux
;;;    system administration.
;;;    Approaches: A1: Package as generic Samba GUI — MX-specific paths and
;;;    integration, would require significant patching.
;;;    A2: Use existing Guix Samba tools — samba package already in Guix.
;;;    A3: Skip — distro-specific GUI tool.
;;;    Verdict: BLOCKED — MX Linux-specific system administration tool.

;;; 15. river-bedload-git (#3209)
;;;    Status: BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — ZIG_NOT_IN_GUIX
;;;    Reason: River Wayland compositor configuration/bar tool
;;;    (git.sr.ht/~novakane/river-bedload, GPL-3.0).  Requires Zig compiler
;;;    to build (zig build system, not cmake/meson/cargo).
;;;    Approaches: A1: Build with Zig — Zig compiler not available in Guix.
;;;    A2: Pre-built binary — no binary releases provided.
;;;    A3: Port to C/Rust — not feasible, different language entirely.
;;;    Verdict: BLOCKED — Zig build system not available in Guix.

;;; 16. rockbox-zig-bin (#3413)
;;;    Status: BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — ZIG_NOT_IN_GUIX
;;;    Reason: Rockbox media player built with Zig
;;;    (github.com/tsirysndr/rockbox-zig, GPL-2.0, v2025.02.16).
;;;    Requires Zig compiler not available in Guix.
;;;    Approaches: A1: Build from source — needs Zig compiler.
;;;    A2: Pre-built binary — GitHub releases exist but are Zig-compiled
;;;    binaries that may have Zig runtime requirements.
;;;    A3: Use original Rockbox (C) — different project with different features.
;;;    Verdict: BLOCKED — Zig toolchain not available in Guix.

;;; 17. xlibre-video-intel-bin (#3227)
;;;    Status: BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — NO_BUILDABLE_SOURCE
;;;    Reason: Intel video driver from x11libre.net (MIT, v3.0.0.6).
;;;    Distributed as binary-only Arch .pkg.tar.zst with no buildable source
;;;    code available.  x11libre.net provides only pre-built packages.
;;;    Approaches: A1: Repackage binary — Arch .pkg.tar.zst format, architecture
;;;    and libc-version dependent, not portable to Guix.
;;;    A2: Build from source — no source code available.
;;;    A3: Use xf86-video-intel from Guix — already available in Guix as
;;;    xf86-video-intel.
;;;    Verdict: BLOCKED — binary-only distribution, no source to build from.

;;; 18. wiznoteplus-bin (#3213)
;;;    Status: BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — STALE_DEPRECATED_DEPS
;;;    Reason: WizNote Plus note-taking app (GPL-3.0, v2.12.0).  C++/Qt5 app
;;;    that depends on OpenSSL 1.1 which is deprecated and being removed from
;;;    distributions.  Project stale since 2023 (no commits in 3+ years).
;;;    Approaches: A1: Package with openssl-1.1 — deprecated, security risk.
;;;    A2: Patch to use OpenSSL 3.x — significant API changes, unmaintained
;;;    upstream won't merge.
;;;    A3: AppImage binary — uses FUSE2 and bundles old OpenSSL 1.1.
;;;    Verdict: BLOCKED — stale project depending on deprecated OpenSSL 1.1.

;;; 19. fluidplug-git (#3352)
;;;    Status: BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — LICENSE_UNCLEAR
;;;    Reason: FluidPlug LV2 audio plugins (github.com/falkTX/FluidPlug).
;;;    The repository has no LICENSE file.  AUR claims "CCPL" (Creative Commons)
;;;    but the actual license terms are unclear.  SoundFont files used by
;;;    the plugins have their own various licenses.
;;;    Approaches: A1: Package assuming CCPL — license unclear, risky.
;;;    A2: Contact upstream for clarification — out of scope for packaging pass.
;;;    A3: Package without SoundFonts — plugins are useless without them.
;;;    Verdict: BLOCKED — no LICENSE file in repository; actual license unclear.

;;; 20. python-anchor-kr-git (#3246)
;;;    Status: BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — ABANDONED_UNCLEAR_LICENSE
;;;    Reason: Niche Python web scraping utility (github.com/justfoolingaround/anchor,
;;;    "custom" license).  6 commits, 2 stars, no releases, no clear license text.
;;;    Pure Python with zero dependencies.
;;;    Approaches: A1: Package with python-build-system — trivial to build, but
;;;    "custom" license has no SPDX identifier and no LICENSE file in repo.
;;;    A2: Contact upstream — repo appears abandoned (no activity since creation).
;;;    A3: Skip — extremely niche, unclear license, likely abandoned.
;;;    Verdict: BLOCKED — custom/unclear license; abandoned repository.

;;; 21. conky-colors-git (#3249)
;;;    Status: BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — DEPRECATED_DEPS
;;;    Reason: Conky Colors theme collection (github.com/helmuthdu/conky_colors,
;;;    GPL-3.0).  Depends on hddtemp (deprecated, removed from most distros in
;;;    2022) and pystatgrab (Python bindings for libstatgrab, not in Guix).
;;;    Approaches: A1: Package hddtemp + pystatgrab — hddtemp is officially
;;;    deprecated and unmaintained, security risk.
;;;    A2: Patch out hddtemp dependency — loses disk temperature monitoring.
;;;    A3: Use drivetemp kernel module instead — requires rewriting conky-colors
;;;    scripts, not just packaging.
;;;    Verdict: BLOCKED — depends on deprecated hddtemp and missing pystatgrab.

;;; 22. oopz (#3480)
;;;    Status: BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — ELECTRON_PROPRIETARY
;;;    Reason: Electron app from git.pysio.online/pysio/linux_oopz.
;;;    Depends on electron39, has "LicenseRef-Proprietary" license.
;;;    Approaches: A1: Electron packaging — Guix lacks Electron infrastructure.
;;;    A2: Binary packaging — proprietary license restricts redistribution.
;;;    A3: Skip — proprietary + Electron double-blocker.
;;;    Verdict: BLOCKED — proprietary license and Electron dependency.

;;; 23. dropdeck-git (#3260)
;;;    Status: BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — QUICKSHELL_NOT_IN_GUIX
;;;    Reason: Desktop widget deck (github.com/maria-rcks/dropdeck, Apache-2.0).
;;;    Depends on Quickshell runtime (Qt6/QML shell framework) which is not
;;;    available in Guix.
;;;    Approaches: A1: Package Quickshell first — complex Qt6/QML framework
;;;    requiring Qt6 WebEngine and custom QML modules.
;;;    A2: Port to different framework — not feasible.
;;;    A3: Skip — blocked on Quickshell ecosystem.
;;;    Verdict: BLOCKED — Quickshell runtime dependency not available in Guix.

;;; 24. qtarcan-git (#3269)
;;;    Status: BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — ARCAN_NOT_IN_GUIX
;;;    Reason: Qt bindings for Arcan display server
;;;    (codeberg.org/vimpostor/qtarcan, GPL-2.0/3.0/LGPL-3.0).
;;;    Requires Arcan display server which is a complex multimedia framework
;;;    not available in Guix.
;;;    Approaches: A1: Package Arcan first — massive multimedia framework with
;;;    custom build system, Lua scripting, hardware acceleration, etc.
;;;    A2: Package Qt bindings without Arcan — useless without the server.
;;;    A3: Skip — niche display server ecosystem.
;;;    Verdict: BLOCKED — Arcan display server not available in Guix.

;;; 25. radicle-explorer (#3370)
;;;    Status: BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — NPM_ECOSYSTEM
;;;    Reason: Radicle web UI (GPL-3.0, v0.24.0).  TypeScript/pnpm/Vite web
;;;    application with large npm dependency tree.
;;;    Approaches: A1: Package with node-build-system — Guix node packaging is
;;;    immature; pnpm/Vite not supported.
;;;    A2: Pre-built static assets — no pre-built releases.
;;;    A3: Skip — npm ecosystem packaging not viable in Guix.
;;;    Verdict: BLOCKED — pnpm/npm/Vite build chain not supported in Guix.

;;; 26. radicle-explorer-git (#3372)
;;;    Status: BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — NPM_ECOSYSTEM
;;;    Reason: Git version of radicle-explorer (same as #3370).
;;;    Same npm/pnpm/Vite build chain issues.
;;;    Verdict: BLOCKED — same as radicle-explorer; npm ecosystem.

;;; 27. rofi-polkit-agent-git (#3237)
;;;    Status: BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — MISSING_DEP_CHAIN
;;;    Reason: Polkit authentication agent using rofi (github.com/czaplicki/
;;;    rofi-polkit-agent, MIT).  Single POSIX shell script, but depends on
;;;    cmd-polkit-git (github.com/OmarCastro/cmd-polkit) — a C/Meson program
;;;    not in Guix.  Additionally, the author notes security concerns in the README.
;;;    Approaches: A1: Package cmd-polkit first, then this script — cmd-polkit
;;;    is a C/Meson build with glib/json-glib/polkit/gtk deps (feasible but
;;;    requires separate packaging effort).  The shell script itself has no
;;;    tagged releases (git-only, 2 commits).
;;;    A2: Skip cmd-polkit and use polkit directly — loses the command-line
;;;    agent abstraction that this script wraps.
;;;    A3: Skip — security concerns noted by author, extremely minimal (2 commits).
;;;    Verdict: BLOCKED — requires cmd-polkit (not in Guix); author notes
;;;    security concerns; minimal 2-commit project.

;;; 28. kimaki (#3359)
;;;    Status: BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — NPM_ECOSYSTEM_STALE
;;;    Reason: Node.js/npm tool (github.com/remorses/kimaki, MIT, v0.4.79).
;;;    Flagged out-of-date on AUR, no standalone binary releases.
;;;    Approaches: A1: Package with node-build-system — npm dep tree resolution
;;;    immature in Guix.
;;;    A2: Bundle as binary — no pre-built binaries available.
;;;    A3: Skip — stale npm package, flagged out-of-date.
;;;    Verdict: BLOCKED — npm ecosystem + stale/out-of-date upstream.

;;; 29. nodejs-markdown-toc (#3385)
;;;    Status: BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — NPM_ECOSYSTEM_STALE
;;;    Reason: Node.js markdown TOC generator (github.com/jonschlinkert/markdown-toc,
;;;    custom license, v1.2.0).  npm package with complex dep tree, stale upstream.
;;;    Approaches: A1: Package with node-build-system — npm dep tree immature
;;;    in Guix; custom license complicates redistribution.
;;;    A2: Use alternative — many markdown TOC generators exist in other languages.
;;;    A3: Skip — stale, custom license, npm ecosystem.
;;;    Verdict: BLOCKED — npm ecosystem + stale + custom license.

;;; 30. llvm-cbe-git (#3258)
;;;    Status: BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — LLVM_VERSION_MISMATCH
;;;    Reason: LLVM C Backend — converts LLVM IR to C code
;;;    (github.com/JuliaComputing/llvm-cbe, Apache-2.0 with LLVM exception).
;;;    CMake project requiring LLVM 20.1 specifically.  Guix currently ships
;;;    LLVM 18; LLVM 20 is not yet available.
;;;    Approaches: A1: Build against LLVM 18 — incompatible, requires LLVM 20.1
;;;    API specifically (find_package(LLVM 20.1 REQUIRED)).
;;;    A2: Package LLVM 20 first — major undertaking requiring LLVM 20 bootstrap.
;;;    A3: Wait for LLVM 20 in Guix upstream — passive; will unblock when Guix
;;;    updates LLVM.
;;;    Verdict: BLOCKED — requires LLVM 20.1; Guix has LLVM 18.
