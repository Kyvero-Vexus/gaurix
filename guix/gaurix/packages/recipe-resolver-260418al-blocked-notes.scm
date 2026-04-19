;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Blocked/exhausted notes for recipe-resolver-260418al
;;; 18 packages marked NEEDS_RECIPE_DESIGN_EXHAUSTED.

;;; 13. orca-slicer
;;; COMPLEX_BUILD: OrcaSlicer is a massive C++ 3D printer slicer forked
;;; from PrusaSlicer/BambuStudio.  Source at github.com/OrcaSlicer/OrcaSlicer.
;;; AGPL-3.0 license (FOSS).
;;; A1: cmake-build-system with full source build — requires webkit2gtk,
;;;     libigl, CGAL, OpenVDB, Boost, wxWidgets, many bundled/patched
;;;     libraries.  Build exceeds batch scope (~200 source files).
;;; A2: AppImage binary repack — upstream provides AppImage but AppImage
;;;     extraction in Guix is fragile and not idiomatic.
;;; A3: Flatpak reference — Flathub has OrcaSlicer but Guix cannot
;;;     consume Flatpak manifests directly.
;;; Conclusion: needs dedicated multi-session packaging effort.

;;; 14. vcvrack
;;; NON_FOSS: VCV Rack core engine is GPL-3.0 but the Component Library
;;; graphical assets are licensed CC BY-NC 4.0 (NonCommercial).
;;; Source at github.com/VCVRack/Rack.
;;; A1: Build from source excluding NC assets — not practical as the UI
;;;     is unusable without the Component Library graphics.
;;; A2: Package only the engine library — no standalone use case.
;;; A3: Use Rack-SDK for headless — still links NC asset code paths.
;;; Conclusion: NC license on essential assets blocks FOSS distribution.

;;; 15. sway-scroll
;;; COMPLEX_BUILD: Scrollable tiling Wayland compositor (fork of sway).
;;; Source at github.com/dawsers/scroll.  MIT license.
;;; A1: meson-build-system — project bundles a modified wlroots internally,
;;;     cannot use system wlroots.  30+ wayland/X11 dependencies needed.
;;; A2: Package modified wlroots separately — modifications are tightly
;;;     coupled, not split into a separate repo.
;;; A3: Use upstream sway + patches — scroll's changes are too extensive
;;;     (scrolling layout, Lua scripting) for a simple patch set.
;;; Conclusion: needs dedicated packaging session with wlroots bundling.

;;; 16. lutris-live-bin
;;; UNNECESSARY: Lutris is already packaged in upstream Guix as 'lutris'.
;;; The -live-bin variant tracks git master which is not meaningfully
;;; different from the released version.
;;; A1: Inherit from upstream lutris with git source — fragile, master
;;;     moves constantly.
;;; A2: Pin to a specific commit — duplicates upstream work.
;;; A3: Add as channel package — no clear benefit over upstream.
;;; Conclusion: use upstream 'lutris' package instead.

;;; 17. jetbrains-toolbox
;;; PROPRIETARY: JetBrains Toolbox App is distributed under the JetBrains
;;; proprietary license.  No source code available.
;;; A1: Binary repack — proprietary license prohibits redistribution in
;;;     package managers without JetBrains agreement.
;;; A2: Build from source — no source code available.
;;; A3: Use open-source alternatives — IntelliJ Community Edition is
;;;     available but Toolbox itself has no FOSS equivalent.
;;; Conclusion: proprietary license, cannot be distributed.

;;; 18. flaresolverr-bin
;;; COMPLEX_DEPS: FlareSolverr is a proxy server for bypassing Cloudflare
;;; challenges.  MIT license, source at github.com/FlareSolverr/FlareSolverr.
;;; A1: Python/pyproject build — requires Chromium browser + selenium +
;;;     undetected-chromedriver at runtime.  Chromium is not packaged for
;;;     general use in Guix (only ungoogled-chromium).
;;; A2: Docker container — intended deployment is Docker, not native.
;;; A3: Binary repack from Docker image — extraction is fragile and
;;;     Chromium bundling creates a massive closure.
;;; Conclusion: Chromium runtime dependency makes native packaging impractical.

;;; 19. renamemytvseries-gtk-bin
;;; PROPRIETARY: RenameMYTVSeries is closed-source freeware.  The developer
;;; has explicitly declined to release source code.
;;; A1: Binary repack — no license for redistribution.
;;; A2: Build from source — no source code available.
;;; A3: Use open-source alternative — filebot (also proprietary) or
;;;     tvnamer (Python, MIT) is a FOSS alternative.
;;; Conclusion: closed source, cannot be packaged.

;;; 20. sysbox-ce
;;; COMPLEX_BUILD: Sysbox is a next-generation container runtime by Nestybox
;;; (acquired by Docker).  Apache-2.0 license, source at github.com/nestybox/sysbox.
;;; A1: go-build-system — multi-component build (sysbox-runc, sysbox-fs,
;;;     sysbox-mgr) each with separate Go modules and CGO dependencies.
;;; A2: Build individual components — tight coupling between components
;;;     requires coordinated versioning.
;;; A3: Binary repack — no official prebuilt binaries for standalone use.
;;; Conclusion: complex multi-component Go build exceeds batch scope.

;;; 21. gram-editor-bin
;;; COMPLEX_BUILD: Gram is a fork of the Zed editor.  Source at
;;; codeberg.org/GramEditor/gram.  GPL-3.0/AGPL-3.0/Apache-2.0 (FOSS).
;;; A1: cargo-build-system — requires 100+ Rust crate dependencies to be
;;;     individually packaged.  Also needs Vulkan SDK + Node.js at build time.
;;; A2: Binary repack — prebuilt binaries available but depend on system
;;;     Vulkan and GPU drivers which vary by system.
;;; A3: Flatpak — available on Flathub but not consumable by Guix.
;;; Conclusion: massive crate dependency tree exceeds batch scope.

;;; 22. libjxl-noglycin-doc
;;; UNNECESSARY: libjxl (JPEG XL reference implementation) is already
;;; packaged in upstream Guix.  The -noglycin variant is an Arch Linux
;;; workaround for a glycin/loaders conflict.  Documentation can be added
;;; as an output to the existing package.
;;; A1: Inherit from upstream libjxl with doc output — possible but the
;;;     -noglycin naming is Arch-specific and misleading.
;;; A2: Separate doc-only package — duplicates upstream work.
;;; A3: Patch upstream to add docs — better done in Guix proper.
;;; Conclusion: use upstream 'libjxl' package; docs belong upstream.

;;; 23. console2svg-bin
;;; DOTNET: Console2Svg is a .NET/C# application for converting terminal
;;; recordings to SVG.  Apache-2.0 license, source at github.com/arika0093/Console2Svg.
;;; A1: dotnet-build-system — Guix has no mature .NET build system.
;;; A2: Binary repack of self-contained publish — .NET self-contained
;;;     binaries are ~80MB and bundle the entire runtime.
;;; A3: Use alternative tool — asciinema + svg-term achieve similar results
;;;     and are already packageable.
;;; Conclusion: .NET ecosystem not supported in Guix.

;;; 24. framework-control-bin
;;; COMPLEX_BUILD: Framework Laptop control utility.  MIT license,
;;; Rust + Svelte hybrid build.
;;; A1: cargo-build-system — Rust backend embeds a Svelte web UI,
;;;     requiring both cargo and npm build steps.
;;; A2: Binary repack — available but requires framework-system (ectool)
;;;     at runtime, which is hardware-specific and not in Guix.
;;; A3: Package ectool first — Framework's ectool fork has custom
;;;     firmware-coupled features.
;;; Conclusion: hybrid build + hardware-specific deps exceed batch scope.

;;; 25. ferris-scan-bin
;;; NO_BINARY: ferris-scan is a Rust CLI tool but has no prebuilt Linux
;;; binaries on GitHub releases.
;;; A1: cargo-build-system from source — requires enumerating all crate
;;;     dependencies individually.
;;; A2: Build binary in CI and repack — no existing CI artifacts.
;;; A3: Use guix import crate — produces incomplete dependency list for
;;;     projects with many transitive deps.
;;; Conclusion: no prebuilt binary; crate enumeration needed.

;;; 26. pwmenu-bin
;;; NO_BINARY: pwmenu is a Rust password menu utility but has no prebuilt
;;; Linux binaries on GitHub releases.
;;; A1: cargo-build-system — requires crate dependency enumeration.
;;; A2: Binary from AUR build — AUR builds are not reproducible artifacts.
;;; A3: guix import crate — incomplete for transitive deps.
;;; Conclusion: no prebuilt binary; crate enumeration needed.

;;; 27. sabiql-bin
;;; NO_BINARY: sabiql is a Rust PostgreSQL client but has no prebuilt
;;; Linux binaries on GitHub releases.
;;; A1: cargo-build-system — requires crate dependency enumeration.
;;; A2: Binary from crates.io — crates.io only distributes source.
;;; A3: guix import crate — incomplete for transitive deps.
;;; Conclusion: no prebuilt binary; crate enumeration needed.

;;; 28. netwatch-tui
;;; CARGO_DEPS: netwatch-tui is a Rust network monitoring TUI.  MIT license.
;;; Source on crates.io.  No prebuilt binaries available.
;;; A1: cargo-build-system — needs libpcap + nasm + many crate deps.
;;; A2: guix import crate --recursive — produces incomplete results.
;;; A3: Vendor all deps — vendoring not supported by cargo-build-system.
;;; Conclusion: Rust crate dependency enumeration exceeds batch scope.

;;; 29. swhook
;;; CARGO_DEPS: swhook is a small Rust webhook server.  GPL-3.0+ license.
;;; Source at github (inferred).  No prebuilt binaries.
;;; A1: cargo-build-system — requires crate enumeration.
;;; A2: guix import crate — incomplete output.
;;; A3: Build statically with musl — still needs crate inputs listed.
;;; Conclusion: Rust crate dependency enumeration needed.

;;; 30. szsol-rs
;;; CARGO_DEPS: szsol-rs is a Rust solitaire solver.  GPL-3.0 license.
;;; No prebuilt binaries.
;;; A1: cargo-build-system — requires crate enumeration.
;;; A2: guix import crate — incomplete output.
;;; A3: Manual crate listing — time-intensive for batch pass.
;;; Conclusion: Rust crate dependency enumeration needed.
