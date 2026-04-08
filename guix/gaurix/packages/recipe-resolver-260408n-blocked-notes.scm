;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2026 Gaurix contributors
;;;
;;; Blocked notes for recipe-resolver-260408n pass
;;; These packages could not be completed in this pass.

(define-module (gaurix packages recipe-resolver-260408n-blocked-notes)
  #:use-module (guix packages))

;;; Blocked package notes:
;;;
;;; === WASM_CROSS_BUILD ===
;;; 3457. omnidotdev-terminal: GPU-accelerated terminal emulator requiring Rust wasm32-unknown-unknown cross-compilation (wasm-bindgen + rustup). Guix's cargo-build-system does not support multi-target wasm cross-compilation. Next: blocked until Guix adds wasm32 Rust target support.
;;;
;;; === ALREADY_IN_GUIX ===
;;; 3509. neovim-later: Arbitrary monthly snapshot of Neovim dev branch. Guix already has neovim upstream (gnu/packages/vim.scm). Custom versioning scheme (v0.12.0.xlater.2603) adds no value over tracking upstream. Next: not applicable; use Guix neovim.
;;;
;;; === ELECTRON_APP ===
;;; 3530. stremio-enhanced-bin: Prebuilt Electron AppImage for Stremio with plugins/themes. Guix lacks Electron packaging infrastructure. Primary URL is Discord invite, suggesting early/unstable project. Next: blocked on Electron ecosystem support in Guix.
;;;
;;; === PROPRIETARY_DEP ===
;;; 3545. distroav: NDI integration plugin for OBS Studio (cmake/GPL-2.0). Depends on libndi, the proprietary NDI SDK from Vizrt/NewTek. Cannot build or distribute without proprietary binary blob. Next: permanently blocked on proprietary dependency.
;;; 3673. ride-bin: RIDE IDE for Dyalog APL. Depends on dyalog-bin, the proprietary Dyalog APL interpreter (commercial license). Next: blocked on proprietary runtime dependency.
;;;
;;; === COMPLEX_DEPS ===
;;; 3633. ladybird-git: Truly independent web browser (BSD-2-Clause). Massive dependency tree including AUR-only packages (angle, simdutf-git v7, cpptrace, libpng-apng). No stable release tags — git-only (r75513+). Complex CMake/Ninja build with patchelf post-processing. Next: not feasible for batch; requires dedicated multi-package effort.
;;;
;;; === PERL_VERSION_PINNING ===
;;; 3645. lyrionmusicserver: Logitech Media Server (Perl). Requires Perl >=5.40 <5.43 (tight version pin). Bundles architecture-specific precompiled platform binaries. Uses custom CPAN build script (buildme.sh) incompatible with Guix's reproducibility model. Next: blocked on Perl version constraint and bundled binaries.
;;;
;;; === QT_WEBENGINE_COMPLEX ===
;;; 3684. dooble-git: Qt5-based web browser using QtWebEngine. Custom license (LicenseRef-custom, not clearly FOSS). Depends on qt5-webengine (Chromium-based, extremely heavy build). Next: blocked on QtWebEngine complexity and unclear licensing.
;;;
;;; === MISSING_GUIX_DEPS ===
;;; 3698. valent: KDE Connect alternative for GNOME (Meson/GPL-3.0). Depends on glycin (image decoder library), tinysparql (SPARQL database), evolution-data-server (contacts/calendar), libpeas-2. Multiple critical dependencies not available in Guix. Next: blocked on glycin, tinysparql, libpeas-2 packaging.
;;; 3704. rime-nushu: Nushu script input method for RIME. Depends on librime, rime-luna-pinyin, rime-prelude — none available in Guix. RIME input method ecosystem not packaged. Next: blocked on RIME ecosystem packaging.
;;;
;;; === CARGO_DEPS ===
;;; 3699. reef: Bash compatibility layer for fish shell (Rust/Cargo, MIT). Requires full cargo-inputs enumeration for Guix cargo-build-system. Also depends on fish shell. Next: blocked on Rust crate dependency enumeration.
;;; 3700. reef-tools: CLI tool wrappers for fish shell (Rust/Cargo, MIT). Same codebase as reef. Requires full cargo-inputs enumeration. Next: blocked on Rust crate dependency enumeration.
;;; 3711. crier: Push notification tool for LAN/MQTT (Rust/Cargo, MIT, v0.2.3). Requires full cargo-inputs enumeration for Guix cargo-build-system packaging. Next: blocked on Rust crate dependency enumeration; investigate pre-built binary availability.
;;; 3716. fsid: Self-contained file/directory identifier (Rust/Cargo, MIT, v0.1.1). Requires full cargo-inputs enumeration. Next: blocked on Rust crate dependency enumeration.
;;;
;;; === BINARY_TOO_COMPLEX ===
;;; 3705. thorium-browser-avx-bin: Chromium fork binary (200MB+ RPM repack). Requires extensive patchelf for ~20 shared library deps. AVX-specific build complicates portability. Redistribution of Chromium fork binaries has unclear legal standing. Next: blocked on binary size, patchelf complexity, and redistribution concerns.
;;; 3713. hardbore-bin: HardBore file manager (Tauri binary). Depends on webkit2gtk-4.1, libayatana-appindicator, librsvg, sqlite, dbus. Complex shared library mapping needed for pre-built Tauri binary. Next: blocked on Tauri binary patchelf complexity.
;;;
;;; === NO_TAGGED_RELEASES ===
;;; 3708. hfdownloader-git: HuggingFace model downloader (Go, Apache-2.0). Rolling git version only (r87.fd209ac). No stable release tags for reproducible builds. Go module dependencies need enumeration. Next: blocked on absence of tagged releases; revisit when upstream cuts a release.
;;;
;;; === TAURI_APP ===
;;; 3712. hardbore: HardBore file manager (Tauri/AGPL-3.0). Source build requires both npm (for frontend) and Rust/Cargo (for backend), dual-ecosystem build. Guix lacks Tauri build infrastructure. Next: blocked on Tauri (npm+Rust) build system support.
;;;
;;; === JAVA_BUILD_CHAIN ===
;;; 3709. tomcat8: Apache Tomcat 8 servlet container (Apache-2.0). Requires Ant + Eclipse ECJ compiler + java-commons-daemon + java-jsvc dependency chain. Complex Java build with specific JDK 11 requirement. Next: blocked on Java/Ant ecosystem build complexity.
;;;
;;; === QT6_MISSING_MODULES ===
;;; 4217. stacer-git: Linux system optimizer GUI (Qt6/CMake, GPL-3.0). Requires qt6-charts and qt6-svg which are not packaged in Guix. Next: blocked on qt6-charts and qt6-svg packaging.
;;;
;;; === SOURCEFORGE_NICHE ===
;;; 3731. pseint: Educational pseudocode interpreter (SourceForge, GPL-2.0). Spanish-only pseudocode IDE for programming education. Requires wxWidgets-GTK3. SourceForge hosting with non-standard download URLs. Niche tool with limited audience outside Spanish-speaking educational contexts. Next: low priority; feasible but niche.
