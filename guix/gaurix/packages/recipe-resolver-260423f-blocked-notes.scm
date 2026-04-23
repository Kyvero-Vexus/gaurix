;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Blocked notes for recipe-resolver-260423f
;;; 18 packages exhausted after 3+ approaches each.

;;; -------------------------------------------------------------------
;;; 1. checkpac (#7843) — NEEDS_RECIPE_DESIGN_EXHAUSTED: ARCH_SPECIFIC
;;; -------------------------------------------------------------------
;;; Expected: Package checker tool; generic utility
;;; Reality: Depends on pacman, expac, and other Arch Linux-specific tools
;;; A1: copy-build-system (bash script) — script calls `pacman`, `expac`,
;;;     `checkupdates` internally; all Arch-only package management tools
;;; A2: patch to use Guix equivalents — no Guix equivalents exist for
;;;     pacman/expac functionality; tool is inherently Arch-specific
;;; A3: rewrite as generic tool — would be a different project entirely;
;;;     the entire purpose is Arch package checking
;;; Conclusion: tool is fundamentally tied to Arch Linux package
;;; management; cannot function without pacman ecosystem.

;;; -------------------------------------------------------------------
;;; 2. mkinitcpio-ykfde (#7847) — NEEDS_RECIPE_DESIGN_EXHAUSTED: ARCH_SPECIFIC
;;; -------------------------------------------------------------------
;;; Expected: Yubikey FDE integration
;;; Reality: mkinitcpio hook for Arch Linux initramfs generation
;;; A1: copy-build-system — installs hooks for mkinitcpio, which is
;;;     Arch-specific; Guix uses a different initramfs mechanism
;;; A2: adapt for Guix initrd — would require complete rewrite for
;;;     Guix System's initrd generation (different API and tooling)
;;; A3: extract Yubikey logic only — the LUKS+Yubikey logic is tightly
;;;     coupled to mkinitcpio's hook interface
;;; Conclusion: mkinitcpio is Arch-specific; Guix System uses its own
;;; initrd generation; tool cannot be ported without full rewrite.

;;; -------------------------------------------------------------------
;;; 3. mkinitcpio-ykfde-git (#7849) — NEEDS_RECIPE_DESIGN_EXHAUSTED: ARCH_SPECIFIC
;;; -------------------------------------------------------------------
;;; Same as mkinitcpio-ykfde (#7847) above; this is the git checkout
;;; variant of the same Arch-specific mkinitcpio hook.
;;; A1: copy-build-system — same mkinitcpio dependency as stable version
;;; A2: adapt for Guix initrd — same rewrite required
;;; A3: extract Yubikey logic — same tight coupling to mkinitcpio API
;;; Conclusion: identical blocker as stable version; Arch-specific.

;;; -------------------------------------------------------------------
;;; 4. n-m3u8dl-re-git (#7850) — NEEDS_RECIPE_DESIGN_EXHAUSTED: DOTNET_REQUIRED
;;; -------------------------------------------------------------------
;;; Expected: Stream downloader binary
;;; Reality: .NET 9+ C# application requiring dotnet-sdk
;;; A1: dotnet-build-system — Guix has no dotnet-sdk or dotnet-build-system
;;; A2: self-contained binary — AUR builds with `dotnet publish
;;;     --self-contained`; requires dotnet-sdk at build time
;;; A3: prebuilt release binary — GitHub releases provide
;;;     self-contained Linux binary; however it bundles .NET runtime
;;;     (100+ MB) and is tied to specific glibc version
;;; Conclusion: requires .NET SDK for building; no dotnet-sdk in Guix;
;;; prebuilt binary too fragile for packaging.

;;; -------------------------------------------------------------------
;;; 5. uptimekit (#7865) — NEEDS_RECIPE_DESIGN_EXHAUSTED: NPM_ECOSYSTEM
;;; -------------------------------------------------------------------
;;; Expected: Terminal uptime monitor
;;; Reality: npm package installed via `npm install -g`
;;; A1: node-build-system — package has npm dependency chain;
;;;     node-build-system in Guix requires all deps to be packaged
;;; A2: bundle with esbuild — not idiomatic for Guix; npm bundling
;;;     bypasses reproducibility guarantees
;;; A3: copy-build-system with npm artifact — npm produces
;;;     platform-specific node_modules; not reproducible
;;; Conclusion: npm-only distribution with no standalone build path;
;;; Guix Node.js packaging is immature for this scope.

;;; -------------------------------------------------------------------
;;; 6. adblock2privoxy (#7866) — NEEDS_RECIPE_DESIGN_EXHAUSTED: HASKELL_DEPS_CHAIN
;;; -------------------------------------------------------------------
;;; Expected: Haskell tool convertible via `guix import hackage`
;;; Reality: Requires 8+ Haskell packages not in Guix
;;; A1: guix import hackage adblock2privoxy — import works but pulls
;;;     missing deps: parsec-permutation, missingh, http-conduit,
;;;     case-insensitive, strict (not all in Guix)
;;; A2: package missing Haskell deps first — each dep has its own
;;;     dependency chain; parsec-permutation alone needs 3 sub-deps
;;; A3: use older version with fewer deps — all versions since 1.0
;;;     require the same core Haskell dependency set
;;; Conclusion: requires packaging 8+ Haskell libraries with their
;;; own dependency trees; out of scope for batch pass.

;;; -------------------------------------------------------------------
;;; 7. nekoray-qt6 (#7876) — NEEDS_RECIPE_DESIGN_EXHAUSTED: COMPLEX_DEPS
;;; -------------------------------------------------------------------
;;; Expected: Qt6 proxy GUI
;;; Reality: Complex C++/Qt6 + Go (sing-box) + multiple proxy backends
;;; A1: cmake-build-system with Qt6 — requires sing-box (Go proxy
;;;     framework with 100+ Go module deps), plus custom gRPC interface
;;; A2: package sing-box first, then nekoray — sing-box itself needs
;;;     100+ Go modules packaged individually for Guix
;;; A3: prebuilt binary — no official prebuilt releases; AppImage
;;;     would need custom wrapper; Qt6 runtime deps complex
;;; Conclusion: dual-language build (C++/Go) with massive dependency
;;; trees in both ecosystems; infeasible for batch pass.

;;; -------------------------------------------------------------------
;;; 8. raven-reader (#7877) — NEEDS_RECIPE_DESIGN_EXHAUSTED: ELECTRON_NPM
;;; -------------------------------------------------------------------
;;; Expected: RSS reader app
;;; Reality: Electron/Vue.js application with npm dependencies
;;; A1: node-build-system — requires full Electron build environment
;;;     plus npm dependency tree (vue, vuex, electron-builder, etc.)
;;; A2: copy-build-system with AppImage — no official AppImage release
;;; A3: repackage from .deb — no official .deb release; npm-only
;;;     distribution
;;; Conclusion: Electron app with npm build chain; Guix lacks mature
;;; Electron packaging support.

;;; -------------------------------------------------------------------
;;; 9. vcpkg-git (#7890) — NEEDS_RECIPE_DESIGN_EXHAUSTED: COMPLEX_DEPS
;;; -------------------------------------------------------------------
;;; Expected: C++ package manager installable via cmake
;;; Reality: Complex cmake build with massive bootstrap and internal deps
;;; A1: cmake-build-system — builds but produces a tool that downloads
;;;     binaries at runtime; incompatible with Guix's sandbox model
;;; A2: copy-build-system with prebuilt — no standalone prebuilt binary;
;;;     tool is designed to be bootstrapped from source
;;; A3: minimal build without download functionality — tool's core
;;;     purpose is downloading and building C++ libraries; stripping
;;;     that makes it useless
;;; Conclusion: vcpkg's design (runtime downloads) is fundamentally
;;; incompatible with Guix's reproducible build model.

;;; -------------------------------------------------------------------
;;; 10. brother-hll2445dw-lpr-bin (#7893) — NEEDS_RECIPE_DESIGN_EXHAUSTED: PROPRIETARY_BINARY
;;; -------------------------------------------------------------------
;;; Expected: Printer driver installable from .deb
;;; Reality: Proprietary binary blobs from Brother for i386 architecture
;;; A1: copy-build-system from .deb — extracts i386 binaries
;;;     (brprintconflsr3, rawtobr3); architecture-specific; proprietary
;;; A2: use CUPS generic driver — Brother HL-L2445DW not supported by
;;;     generic CUPS drivers; requires proprietary filter binaries
;;; A3: open-source alternative (brlaser) — brlaser project does not
;;;     list HL-L2445DW as supported model
;;; Conclusion: proprietary i386 binary blobs; no open-source driver
;;; alternative for this specific printer model.

;;; -------------------------------------------------------------------
;;; 11. libisl-git (#7900) — NEEDS_RECIPE_DESIGN_EXHAUSTED: UPSTREAM_DELETED
;;; -------------------------------------------------------------------
;;; Expected: Development version of isl math library
;;; Reality: AUR git repository is completely empty
;;; A1: git-fetch from AUR source — cloned repo has no commits, no
;;;     PKGBUILD, no source references
;;; A2: find upstream git repo — isl upstream is at
;;;     repo.or.cz/isl.git; but Guix already packages isl (stable)
;;; A3: package from upstream git — isl is already in Guix as a stable
;;;     package; the -git variant adds no value
;;; Conclusion: AUR package repo is empty/abandoned; upstream isl is
;;; already available in Guix.

;;; -------------------------------------------------------------------
;;; 12. github-desktop-plus (#7910) — NEEDS_RECIPE_DESIGN_EXHAUSTED: ELECTRON_NPM
;;; -------------------------------------------------------------------
;;; Expected: Desktop Git GUI
;;; Reality: Electron app built with yarn/npm + TypeScript
;;; A1: node-build-system — requires Electron, yarn, hundreds of npm
;;;     deps; full Electron build pipeline
;;; A2: copy-build-system with prebuilt .deb — bin release exists but
;;;     bundles Electron runtime (200+ MB); fragile glibc/nss deps
;;; A3: repackage AppImage — no official AppImage; only .deb and
;;;     rpm binaries available
;;; Conclusion: Electron app with full npm build chain; same blocker
;;; as all Electron apps in Guix.

;;; -------------------------------------------------------------------
;;; 13. mingw-w64-minizip-ng (#7912) — NEEDS_RECIPE_DESIGN_EXHAUSTED: CROSS_TOOLCHAIN
;;; -------------------------------------------------------------------
;;; Expected: Minizip library for MinGW
;;; Reality: Cross-compilation target for Windows using MinGW-w64 toolchain
;;; A1: cmake-build-system with cross flags — requires complete
;;;     MinGW-w64 cross-compilation toolchain (gcc, binutils, headers)
;;; A2: use Guix cross-compilation — Guix has different cross-compile
;;;     model (--target=); would not produce mingw-w64 compatible output
;;; A3: package natively (not cross) — defeats the purpose; this is
;;;     specifically the Windows cross-compiled variant
;;; Conclusion: MinGW-w64 cross-compilation targets are not applicable
;;; to Guix's build model.

;;; -------------------------------------------------------------------
;;; 14. brother-dcpt300 (#7916) — NEEDS_RECIPE_DESIGN_EXHAUSTED: PROPRIETARY_BINARY
;;; -------------------------------------------------------------------
;;; Expected: Printer driver
;;; Reality: Proprietary Brother printer driver binaries
;;; A1: copy-build-system from .deb — requires proprietary Brother
;;;     binary filter programs; closed-source LPR/CUPS components
;;; A2: generic CUPS driver — DCP-T300 not supported by open-source
;;;     drivers; requires Brother's proprietary filter chain
;;; A3: brlaser alternative — brlaser does not support DCP-T300 model
;;;     (ink tank printer, not laser)
;;; Conclusion: proprietary binary driver; no open-source alternative
;;; for this ink tank printer model.

;;; -------------------------------------------------------------------
;;; 15. python-pyqt5-webengine (#7918) — NEEDS_RECIPE_DESIGN_EXHAUSTED: QT_WEBENGINE_COMPLEX
;;; -------------------------------------------------------------------
;;; Expected: Python bindings installable via pip/pyproject
;;; Reality: Requires building QtWebEngine (Chromium-based) from source
;;; A1: pyproject-build-system — requires PyQt5 sip bindings + built
;;;     QtWebEngine; QtWebEngine is essentially Chromium (~2GB source)
;;; A2: use existing Guix qtwebengine — Guix packages qtwebengine but
;;;     PyQt5 WebEngine bindings need matching SIP-generated wrappers
;;;     compiled against the exact Qt version
;;; A3: binary wheel from PyPI — binary wheels are platform-specific
;;;     and link against system Qt; not reproducible
;;; Conclusion: building PyQt5-WebEngine requires deep Qt/SIP toolchain
;;; integration; complex enough to warrant dedicated packaging effort.

;;; -------------------------------------------------------------------
;;; 16. borked3ds (#7925) — NEEDS_RECIPE_DESIGN_EXHAUSTED: COMPLEX_DEPS
;;; -------------------------------------------------------------------
;;; Expected: 3DS emulator buildable with cmake
;;; Reality: 51 git submodules with deeply nested dependency trees
;;; A1: cmake-build-system with bundled deps — 51 submodule sources
;;;     including boost, SDL, vulkan, cryptopp, ffmpeg, libusb, etc.;
;;;     each needs individual source origin in Guix
;;; A2: system deps where possible — many vendored libs are modified
;;;     forks (dynarmic, sirit, cubeb) incompatible with system versions
;;; A3: binary release — no prebuilt Linux binary releases; only
;;;     AppImage builds from CI which bundle all deps
;;; Conclusion: 51 submodules with custom forks make source build
;;; infeasible for batch pass; requires dedicated packaging effort.

;;; -------------------------------------------------------------------
;;; 17. grub-git (#7926) — NEEDS_RECIPE_DESIGN_EXHAUSTED: ALREADY_IN_GUIX
;;; -------------------------------------------------------------------
;;; Expected: GRUB bootloader (development version)
;;; Reality: Guix already packages grub (stable v2.06/2.12)
;;; A1: inherit from Guix grub + update source — grub-git requires
;;;     gnulib and grub-extras submodules; multi-platform build
;;;     (i386-pc, x86_64-efi, i386-efi); Arch patches for color
;;;     variables and initramfs detection
;;; A2: package as separate grub-git variant — adds maintenance burden
;;;     for a development snapshot with no stability guarantees
;;; A3: use stable grub from Guix — upstream Guix grub package already
;;;     provides full GRUB functionality
;;; Conclusion: stable grub already in Guix; -git development version
;;; adds complexity without clear user benefit for this channel.

;;; -------------------------------------------------------------------
;;; 18. twitter (#7939) — NEEDS_RECIPE_DESIGN_EXHAUSTED: ELECTRON_NPM
;;; -------------------------------------------------------------------
;;; Expected: Desktop Twitter client
;;; Reality: Electron wrapper depending on Arch-specific libelectron
;;; A1: copy-build-system — depends on `libelectron` and
;;;     `libelectron-electron-meta`, which are Arch-specific Electron
;;;     runtime packages; no equivalent in Guix
;;; A2: bundle with system Electron — would need Guix's electron
;;;     package; but electron is not packaged in Guix upstream
;;; A3: build from source with npm — project is a thin Electron wrapper;
;;;     still needs full Electron build chain
;;; Conclusion: Arch-specific Electron wrapper; depends on libelectron
;;; package ecosystem not available in Guix.
