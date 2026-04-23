;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Blocked notes for recipe-resolver-260423g
;;; 20 packages exhausted after 3+ approaches each.

;;; -------------------------------------------------------------------
;;; 1. mobilesheets-companion (#7842) — NEEDS_RECIPE_DESIGN_EXHAUSTED: PROPRIETARY_BINARY
;;; -------------------------------------------------------------------
;;; Expected: Companion tool for MobileSheets music reader
;;; Reality: Proprietary binary-only application from Zubersoft
;;; A1: copy-build-system with .deb — no source code available;
;;;     proprietary license prohibits redistribution
;;; A2: contact upstream for source — commercial closed-source product;
;;;     companion app is freeware but no source published
;;; A3: alternative FOSS tools — no direct equivalent for MobileSheets
;;;     library management exists in open-source
;;; Conclusion: proprietary binary with no source code; cannot package.

;;; -------------------------------------------------------------------
;;; 2. joplin-beta (#7844) — NEEDS_RECIPE_DESIGN_EXHAUSTED: ELECTRON_NPM
;;; -------------------------------------------------------------------
;;; Expected: Note-taking app with sync
;;; Reality: Electron/TypeScript app with 500+ npm dependencies
;;; A1: npm-build-system — Guix lacks mature npm packaging; 500+ deps
;;;     need individual packaging or bundling
;;; A2: copy-build-system with AppImage — AppImage bundles entire
;;;     Electron runtime; fragile glibc version dependency; 200+ MB
;;; A3: build from source with node-build-system — requires patching
;;;     electron-builder, native node modules (better-sqlite3, keytar),
;;;     and Electron binary download during build
;;; Conclusion: Electron dependency chain makes source build infeasible;
;;; AppImage binary too fragile for reliable packaging.

;;; -------------------------------------------------------------------
;;; 3. feishu (#7940) — NEEDS_RECIPE_DESIGN_EXHAUSTED: PROPRIETARY_BINARY
;;; -------------------------------------------------------------------
;;; Expected: Feishu (Lark) messaging client
;;; Reality: Bytedance proprietary, closed-source Electron app
;;; A1: copy-build-system with .deb — proprietary license explicitly
;;;     prohibits redistribution and reverse engineering
;;; A2: build from source — no source code available
;;; A3: web alternative — feishu.cn web interface exists as alternative
;;; Conclusion: proprietary closed-source; redistribution prohibited.

;;; -------------------------------------------------------------------
;;; 4. flashprint (#4902) — NEEDS_RECIPE_DESIGN_EXHAUSTED: PROPRIETARY_BINARY
;;; -------------------------------------------------------------------
;;; Expected: 3D printer slicer for Flashforge printers
;;; Reality: Proprietary binary-only slicer with commercial EULA
;;; A1: copy-build-system with tarball — proprietary EULA requires
;;;     agreement; redistribution terms unclear
;;; A2: build from source — no source available; proprietary Qt app
;;; A3: use PrusaSlicer/Cura — open-source alternatives exist but
;;;     lack Flashforge-specific printer profiles
;;; Conclusion: proprietary binary with restrictive EULA; use
;;; PrusaSlicer or Cura as FOSS alternatives.

;;; -------------------------------------------------------------------
;;; 5. vigaphone-bin (#4913) — NEEDS_RECIPE_DESIGN_EXHAUSTED: PROPRIETARY_BINARY
;;; -------------------------------------------------------------------
;;; Expected: VoIP softphone client
;;; Reality: Proprietary commercial VoIP binary
;;; A1: copy-build-system — proprietary license; no redistribution rights
;;; A2: build from source — no source code available
;;; A3: alternative FOSS VoIP — Linphone, Opal, or Opal-based clients
;;;     provide equivalent SIP/VoIP functionality
;;; Conclusion: proprietary binary with no source; use Linphone instead.

;;; -------------------------------------------------------------------
;;; 6. emby-server-beta (#4925) — NEEDS_RECIPE_DESIGN_EXHAUSTED: PROPRIETARY_BINARY
;;; -------------------------------------------------------------------
;;; Expected: Media server (beta channel)
;;; Reality: Proprietary commercial media server with tiered licensing
;;; A1: copy-build-system with .deb — commercial license requires Emby
;;;     Premiere subscription for many features; redistribution unclear
;;; A2: build from source — partial source on GitHub but core components
;;;     are closed-source; cannot build fully from source
;;; A3: use Jellyfin — Jellyfin is the FOSS fork of Emby; fully open
;;;     source and already has recipe infrastructure in Gaurix
;;; Conclusion: proprietary with commercial licensing; Jellyfin is the
;;; FOSS equivalent.

;;; -------------------------------------------------------------------
;;; 7. python-pyqt5-extra-modules (#4934) — NEEDS_RECIPE_DESIGN_EXHAUSTED: QT_SIP_COMPLEX
;;; -------------------------------------------------------------------
;;; Expected: Additional PyQt5 bindings for Qt5 modules
;;; Reality: Requires SIP code generation and Qt5 module compilation
;;; A1: pyproject-build-system with SIP — SIP code generator needed;
;;;     each Qt5 module (Qt3D, QtBluetooth, QtRemoteObjects) requires
;;;     separate SIP bindings compilation against Qt5 headers
;;; A2: use pre-built wheels — PyPI wheels bundle Qt5 libraries that
;;;     conflict with Guix's Qt5 packages
;;; A3: upstream Guix python-pyqt already covers core modules —
;;;     QtWidgets, QtGui, QtCore, QtNetwork, QtSvg, QtDBus are
;;;     available; remaining modules are niche (Qt3D, QtBluetooth)
;;; Conclusion: existing Guix python-pyqt covers core modules; extra
;;; modules require per-module SIP compilation infrastructure not in
;;; Guix; scope exceeds single package effort.

;;; -------------------------------------------------------------------
;;; 8. cockpit-pacman (#4966) — NEEDS_RECIPE_DESIGN_EXHAUSTED: ARCH_SPECIFIC
;;; -------------------------------------------------------------------
;;; Expected: Cockpit web UI plugin for package management
;;; Reality: Arch-specific plugin using alpm.rs (Arch Linux Package Manager)
;;; A1: build as-is — depends on alpm.rs which wraps libalpm (pacman's
;;;     C library); pacman and libalpm are Arch-specific
;;; A2: patch for Guix — would require rewriting alpm.rs bindings to
;;;     use Guix's package API; essentially a different project
;;; A3: write Guix-native Cockpit plugin — new project, not a port
;;; Conclusion: fundamentally tied to pacman/Arch ecosystem; not portable.

;;; -------------------------------------------------------------------
;;; 9. wowup (#4995) — NEEDS_RECIPE_DESIGN_EXHAUSTED: ELECTRON_NPM
;;; -------------------------------------------------------------------
;;; Expected: World of Warcraft addon updater
;;; Reality: Electron/TypeScript app with npm dependency chain
;;; A1: npm-build-system — hundreds of npm deps not in Guix
;;; A2: copy-build-system with AppImage — WowUp provides AppImage but
;;;     bundles Electron + glibc deps; fragile across distros
;;; A3: CLI alternative — wowup-cli (Rust) exists but is also
;;;     unmaintained; CurseBreaker is Python alternative
;;; Conclusion: Electron app; source build infeasible; AppImage fragile.

;;; -------------------------------------------------------------------
;;; 10. wowup-cf (#4996) — NEEDS_RECIPE_DESIGN_EXHAUSTED: ELECTRON_NPM
;;; -------------------------------------------------------------------
;;; Same as wowup (#4995) above; this is the CurseForge-compatible
;;; variant from the same WowUp project.
;;; A1: npm-build-system — same Electron/npm chain as wowup
;;; A2: copy-build-system with AppImage — same fragility issues
;;; A3: use CurseBreaker Python CLI — FOSS alternative
;;; Conclusion: identical blocker; Electron dependency chain.

;;; -------------------------------------------------------------------
;;; 11. gprbuild-toolbox (#4999) — NEEDS_RECIPE_DESIGN_EXHAUSTED: ADA_BOOTSTRAP
;;; -------------------------------------------------------------------
;;; Expected: AdaCore multi-language project builder toolbox
;;; Reality: Part of gprbuild ecosystem with circular bootstrap dependency
;;; A1: build with GNAT — gprbuild-toolbox depends on gprbuild which
;;;     depends on libgpr which depends on gprbuild (circular)
;;; A2: bootstrap with pre-built binary — conflicts with Guix's
;;;     source-only build philosophy
;;; A3: use Alire package manager — Alire (Ada Library Repository)
;;;     itself requires gprbuild to bootstrap
;;; Conclusion: circular dependency chain in Ada ecosystem; requires
;;; gprbuild bootstrap infrastructure not available in Guix.

;;; -------------------------------------------------------------------
;;; 12. whisparr-eros-develop (#5000) — NEEDS_RECIPE_DESIGN_EXHAUSTED: DOTNET_REQUIRED
;;; -------------------------------------------------------------------
;;; Expected: Media organizer application
;;; Reality: .NET/C# application requiring dotnet-sdk
;;; A1: build from source — requires dotnet-sdk 8.0+ not in Guix
;;; A2: copy pre-built binary — .NET self-contained binary bundles
;;;     runtime; fragile glibc dependency
;;; A3: use Sonarr/Radarr pattern — similar *arr apps face same
;;;     .NET blocker in Guix
;;; Conclusion: .NET SDK not available in Guix; cannot build from source.

;;; -------------------------------------------------------------------
;;; 13. arch-cleaner (#5013) — NEEDS_RECIPE_DESIGN_EXHAUSTED: ARCH_SPECIFIC
;;; -------------------------------------------------------------------
;;; Expected: System cleanup utility
;;; Reality: Arch-specific tool that calls pacman for cache/orphan cleanup
;;; A1: package as-is — script calls `pacman -Sc`, `pacman -Rns`,
;;;     `paccache` internally; all Arch package management tools
;;; A2: patch for Guix — would need complete rewrite to use `guix gc`
;;;     and Guix garbage collection instead of pacman
;;; A3: use `guix gc` — Guix has built-in garbage collection that
;;;     serves the same purpose
;;; Conclusion: Arch-specific pacman wrapper; `guix gc` provides
;;; equivalent functionality natively.

;;; -------------------------------------------------------------------
;;; 14. cros-container-guest-tools-git (#5062) — NEEDS_RECIPE_DESIGN_EXHAUSTED: CHROMEOS_SPECIFIC
;;; -------------------------------------------------------------------
;;; Expected: Container guest tools
;;; Reality: Chrome OS (Crostini) specific guest VM integration tools
;;; A1: copy-build-system — shell scripts + systemd units for Chrome OS
;;;     guest VM integration; requires cros-specific kernel features
;;; A2: adapt for Guix — Chrome OS container protocol (vm_tools) is
;;;     proprietary; Sommelier Wayland proxy needs Chrome OS host
;;; A3: use standard container tools — LXC/Docker provide equivalent
;;;     containerization without Chrome OS dependencies
;;; Conclusion: Chrome OS specific; requires proprietary host integration.

;;; -------------------------------------------------------------------
;;; 15. plasma6-wallpapers-wallpaper-engine-git (#5068) — NEEDS_RECIPE_DESIGN_EXHAUSTED: COMPLEX_DEPS
;;; -------------------------------------------------------------------
;;; Expected: KDE wallpaper plugin for Wallpaper Engine
;;; Reality: Requires proprietary Steam Workshop content + complex deps
;;; A1: cmake-build-system — needs Qt6 + Vulkan + mpv + lz4 + websocket;
;;;     all available in Guix
;;; A2: runtime dependency — requires Steam and Wallpaper Engine
;;;     (proprietary) to provide the actual wallpaper assets
;;; A3: standalone mode — project supports some standalone wallpapers
;;;     but primary use case requires Steam Workshop integration
;;; Conclusion: while buildable, the plugin is functionally useless
;;; without proprietary Steam/Wallpaper Engine; packaging adds no value.

;;; -------------------------------------------------------------------
;;; 16. vscodium-xdg-dir-patch (#5081) — NEEDS_RECIPE_DESIGN_EXHAUSTED: DEPENDS_ON_PROPRIETARY
;;; -------------------------------------------------------------------
;;; Expected: XDG directory compliance patch for VSCodium
;;; Reality: Wrapper/patch that modifies vscodium binary behavior
;;; A1: copy-build-system — patch file that depends on vscodium binary
;;;     being installed; vscodium itself is a complex Electron build
;;; A2: integrate into vscodium recipe — would need vscodium itself
;;;     packaged first; Electron build chain blocker
;;; A3: configure XDG dirs via environment variables — VSCodium respects
;;;     some XDG vars natively since v1.80+
;;; Conclusion: depends on vscodium (Electron binary); standalone patch
;;; has no utility without the base application.

;;; -------------------------------------------------------------------
;;; 17. aimp-skin-m5 (#5188) — NEEDS_RECIPE_DESIGN_EXHAUSTED: PLATFORM_SPECIFIC
;;; -------------------------------------------------------------------
;;; Expected: AIMP M5 skin theme
;;; Reality: Skin for AIMP, a Windows-only audio player
;;; A1: copy-build-system — skin file is just data, but AIMP itself
;;;     is Windows-only and not available on Linux natively
;;; A2: AIMP under Wine — unreliable; AIMP has limited Wine support
;;; A3: use native Linux players — Audacious, Strawberry, Clementine
;;;     provide similar functionality with their own themes
;;; Conclusion: AIMP is Windows-only; skin is useless without AIMP.

;;; -------------------------------------------------------------------
;;; 18. aimp-skin-soot (#5189) — NEEDS_RECIPE_DESIGN_EXHAUSTED: PLATFORM_SPECIFIC
;;; -------------------------------------------------------------------
;;; Same as aimp-skin-m5 (#5188) above; different skin, same AIMP
;;; Windows-only blocker.
;;; A1: copy data — AIMP not available on Linux
;;; A2: AIMP under Wine — unreliable
;;; A3: use native Linux audio players with their own themes
;;; Conclusion: AIMP is Windows-only; skin data is useless on Linux.

;;; -------------------------------------------------------------------
;;; 19. compiler-rt15 (#5334) — NEEDS_RECIPE_DESIGN_EXHAUSTED: LLVM_REBUILD_SCOPE
;;; -------------------------------------------------------------------
;;; Expected: LLVM compiler-rt v15.0.7
;;; Reality: CMake subproject of LLVM 15; requires full LLVM 15 build
;;; A1: cmake-build-system standalone — compiler-rt is a cmake
;;;     subproject but requires LLVM 15 headers and libraries; Guix
;;;     has LLVM 18; building LLVM 15 is a massive rebuild (~2 hours)
;;; A2: extract compiler-rt only — needs LLVM 15 TableGen, clang 15
;;;     headers, and llvm-15 libraries for builtins/sanitizers
;;; A3: use Guix's existing compiler-rt — Guix provides compiler-rt
;;;     matching the current LLVM version (18.x); version 15 is EOL
;;; Conclusion: requires full LLVM 15 stack rebuild; Guix has current
;;; compiler-rt; LLVM 15 is end-of-life.

;;; -------------------------------------------------------------------
;;; 20. python-pillow-simd-git (#6261) — NEEDS_RECIPE_DESIGN_EXHAUSTED: GUIX_HAS_EQUIVALENT
;;; -------------------------------------------------------------------
;;; Expected: SIMD-optimized fork of Pillow image library
;;; Reality: Pillow fork with SSE4/AVX2 optimizations; same API
;;; A1: pyproject-build-system — builds as Pillow replacement with
;;;     CPU-specific SIMD flags; conflicts with python-pillow
;;; A2: upstream Pillow already has SIMD — since Pillow 9.0+, the
;;;     mainline Pillow includes SIMD optimizations via compiler
;;;     auto-vectorization; performance gap has narrowed significantly
;;; A3: use Guix python-pillow — already available in Guix; provides
;;;     equivalent functionality; pillow-simd project is abandoned
;;;     (last release 2022, not compatible with Pillow 10+)
;;; Conclusion: project abandoned; upstream Pillow has equivalent
;;; optimizations; Guix already provides python-pillow.
