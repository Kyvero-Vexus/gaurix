;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Blocked notes for recipe-resolver-260418ad
;;; Documents exhausted approaches for packages that could not be resolved.

;;; -------------------------------------------------------------------
;;; 15. gpa-git (#5979) -> ALREADY_PACKAGED_PRIOR
;;;
;;; gpa (GNU Privacy Assistant) is already packaged in Guix at
;;; gnu/packages/gnupg.scm as 'gpa' version 0.11.0.
;;; No separate package needed.
;;; -------------------------------------------------------------------

;;; -------------------------------------------------------------------
;;; 16. greetd-tuigreet-git (#5975) -> ALREADY_PACKAGED_PRIOR
;;;
;;; tuigreet is already packaged in Guix at gnu/packages/admin.scm
;;; as 'tuigreet' version 0.9.1.
;;; No separate package needed.
;;; -------------------------------------------------------------------

;;; -------------------------------------------------------------------
;;; 17. dstl (#5963) -> NEEDS_RECIPE_DESIGN_EXHAUSTED: CARGO_DEPS_NEEDED
;;;
;;; Rust TUI application launcher (github.com/saltnpepper97/dstl).
;;; A1: cargo-build-system requires individually packaging ~30 crate
;;;     dependencies (clap, crossterm, fuzzy-matcher, etc.).
;;; A2: No pre-built binary releases on GitHub.
;;; A3: Niche TUI launcher with very few GitHub stars; effort/benefit
;;;     ratio too high for the crate dependency chain.
;;; -------------------------------------------------------------------

;;; -------------------------------------------------------------------
;;; 18. kohighlights (#5973) -> NEEDS_RECIPE_DESIGN_EXHAUSTED: PYSIDE6_COMPLEX
;;;
;;; KOReader highlights viewer (github.com/noembryo/KoHighlights).
;;; A1: Requires PySide6 (Qt6 Python bindings) which is not available
;;;     in Guix and extremely complex to package (Qt6 + shiboken6).
;;; A2: Upstream distributes as pre-packaged PySide6 zip with custom
;;;     patch scripts; no standard pyproject.toml build.
;;; A3: Uses 'uv' runtime which is also not in Guix.
;;; -------------------------------------------------------------------

;;; -------------------------------------------------------------------
;;; 19. rsenv (#5974) -> NEEDS_RECIPE_DESIGN_EXHAUSTED: CARGO_DEPS_NEEDED
;;;
;;; Hierarchical environment manager (github.com/sysid/rs-env).
;;; A1: Rust/cargo project requiring ~50 crate dependencies.
;;; A2: Runtime depends on sops (not in Guix) for secret management.
;;; A3: direnv (in Guix) provides similar env management without the
;;;     Rust dependency chain.
;;; -------------------------------------------------------------------

;;; -------------------------------------------------------------------
;;; 20. thorium-reader (#5717) -> NEEDS_RECIPE_DESIGN_EXHAUSTED: ELECTRON_COMPLEX
;;;
;;; EPUB/PDF reader (github.com/edrlab/thorium-reader).
;;; A1: Electron app with 200+ npm dependencies; npm ecosystem not
;;;     supported in Guix for builds of this scale.
;;; A2: Build requires nvm + specific Node.js version + electron-builder.
;;; A3: No pre-built Linux binary releases that could be repacked.
;;; -------------------------------------------------------------------

;;; -------------------------------------------------------------------
;;; 21. data-peek-bin (#5583) -> NEEDS_RECIPE_DESIGN_EXHAUSTED: PROPRIETARY_NO_STABLE_URL
;;;
;;; Commercial database GUI (datapeek.dev).
;;; A1: No public download URL; requires account/license.
;;; A2: Proprietary license prohibits redistribution.
;;; A3: No source code available.
;;; -------------------------------------------------------------------

;;; -------------------------------------------------------------------
;;; 22. crosvm-git (#5580) -> NEEDS_RECIPE_DESIGN_EXHAUSTED: CHROMIUM_COMPLEX
;;;
;;; Chrome OS virtual machine monitor (chromium.googlesource.com/crosvm).
;;; A1: Rust project with massive Chromium-ecosystem dependency chain
;;;     (100+ crates + system deps).
;;; A2: Build system uses Chrome OS-specific tooling (cros_sdk).
;;; A3: Depends on minijail, virglrenderer, and other Chrome OS
;;;     components not available in Guix.
;;; -------------------------------------------------------------------

;;; -------------------------------------------------------------------
;;; 23. roleboi-git (#5811) -> NEEDS_RECIPE_DESIGN_EXHAUSTED: DOTNET_UNSUPPORTED
;;;
;;; Discord bot for role management (github.com/KarlOfDuty/RoleBoi).
;;; A1: C#/.NET project requiring dotnet-sdk which is not in Guix.
;;; A2: .NET ecosystem bootstrapping not feasible in Guix.
;;; A3: Discord bot with very niche use case; many alternatives exist.
;;; -------------------------------------------------------------------

;;; -------------------------------------------------------------------
;;; 24. mcp-router-bin (#5726) -> NEEDS_RECIPE_DESIGN_EXHAUSTED: CUSTOM_LICENSE
;;;
;;; MCP routing tool (github.com/mcp-router/mcp-router).
;;; A1: Licensed under "Sustainable-Use" license which is not
;;;     recognized as free software by FSF/Guix standards.
;;; A2: Electron-based binary with 27 system dependencies.
;;; A3: Non-free license makes it incompatible with Guix channel policy.
;;; -------------------------------------------------------------------

;;; -------------------------------------------------------------------
;;; 25. music-presence-bin (#5735) -> NEEDS_RECIPE_DESIGN_EXHAUSTED: CUSTOM_LICENSE
;;;
;;; Discord music presence tool (github.com/ungive/discord-music-presence).
;;; A1: Custom proprietary license; source available but not free software.
;;; A2: Binary depends on 23 system libraries; complex linking.
;;; A3: Non-free license makes it incompatible with Guix channel policy.
;;; -------------------------------------------------------------------

;;; -------------------------------------------------------------------
;;; 26. sneemok (#6007) -> NEEDS_RECIPE_DESIGN_EXHAUSTED: ZIG_NOT_IN_GUIX
;;;
;;; Wayland screenshot annotation tool (codeberg.org/fn3x/sneemok).
;;; A1: Built with Zig build system; Zig compiler not available in Guix.
;;; A2: No pre-built binary releases.
;;; A3: Zig-build-system is experimental/nonexistent in Guix; would
;;;     require bootstrapping the entire Zig toolchain first.
;;; -------------------------------------------------------------------

;;; -------------------------------------------------------------------
;;; 27. moo (#5986) -> NEEDS_RECIPE_DESIGN_EXHAUSTED: BUN_NOT_IN_GUIX
;;;
;;; Terminal music player (github.com/vdawg-git/moo).
;;; A1: Built with Bun runtime (not Node.js); Bun not in Guix.
;;; A2: Uses 'bun compile' to create standalone binary; no standard
;;;     Node.js build alternative.
;;; A3: Bun is a Zig-built runtime, creating a circular dependency
;;;     on Zig which is also not in Guix.
;;; -------------------------------------------------------------------

;;; -------------------------------------------------------------------
;;; 28. pixelpantry-git (#8134) -> NEEDS_RECIPE_DESIGN_EXHAUSTED: ELECTRON_COMPLEX
;;;
;;; Pixel art inventory tracker (github.com/AlfEspadero/PixelPantry).
;;; A1: Electron app requiring npm + electron-builder; 200+ npm deps.
;;; A2: No pre-built binary releases.
;;; A3: Very niche application (gamified pantry tracker) with minimal
;;;     community adoption.
;;; -------------------------------------------------------------------

;;; -------------------------------------------------------------------
;;; 29. anytype-bin (#2242) -> NEEDS_RECIPE_DESIGN_EXHAUSTED: APPIMAGE_COMPLEX
;;;
;;; Local-first note-taking tool (anytype.io).
;;; A1: Distributed only as AppImage; requires FUSE mount/extraction
;;;     and runtime patching for /tmp execution.
;;; A2: Bundled Electron libraries conflict with Guix store linker.
;;; A3: Custom proprietary license ("Any Source Available License")
;;;     is not recognized as free software.
;;; -------------------------------------------------------------------

;;; -------------------------------------------------------------------
;;; 30. arduino-ide-bin (#2247) -> NEEDS_RECIPE_DESIGN_EXHAUSTED: ELECTRON_COMPLEX
;;;
;;; Arduino IDE v2 (github.com/arduino/arduino-ide).
;;; A1: Electron app with 200+ bundled node_modules and native addons
;;;     (serialport, usb); requires complex wrapping.
;;; A2: Serial port access needs udev rules and sandbox exceptions.
;;; A3: Bundled Electron version pinning conflicts with system Electron;
;;;     building from source requires the full Theia IDE framework.
;;; -------------------------------------------------------------------
