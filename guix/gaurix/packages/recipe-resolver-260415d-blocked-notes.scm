;;; recipe-resolver-260415d --- blocked notes
;;; 16 packages exhausted after investigation (3 approaches each).

;;; 15. plezy-git (#5529)
;;; NEEDS_RECIPE_DESIGN_EXHAUSTED — UNSTABLE_VCS: C++/CMake/GTK3/MPV Plex client tracks git HEAD
;;; A1: cmake build — all deps in Guix but no tagged stable releases, only git HEAD
;;; A2: pin to specific commit — rapidly changing, hash invalidation between builds
;;; A3: project has minimal community (2 GitHub stars), unstable API — impractical for reproducible builds

;;; 16. listpick (#5530)
;;; NEEDS_RECIPE_DESIGN_EXHAUSTED — PYTHON_DEEP_DEPS: 13+ Python deps not in Guix
;;; A1: python-build-system — needs aria2tui, python-textual-autocomplete, python-odfpy, python-dill (all absent)
;;; A2: pip install — blocked by Guix network isolation during build
;;; A3: too many missing transitive deps for batch scope; needs dedicated Python packaging pass

;;; 17. high-voltage-ring (#5531)
;;; NEEDS_RECIPE_DESIGN_EXHAUSTED — MONO_WINE_REQUIRED: C#/Mono level editor requiring Wine at runtime
;;; A1: Mono MSBuild build system not available in Guix
;;; A2: Wine runtime dependency adds massive complexity
;;; A3: C#/Mono ecosystem entirely absent from Guix; no bootstrapping path

;;; 18. nexus-client-git (#5532)
;;; NEEDS_RECIPE_DESIGN_EXHAUSTED — CARGO_DEPS_NEEDED: Rust BBS client requires 100+ crate deps
;;; A1: cargo-build-system — hundreds of crate dependencies need individual packaging
;;; A2: no pre-built binary releases on GitHub
;;; A3: prefer stable nexus-client if crate ecosystem matures; defer to Rust packaging pass

;;; 19. nexus-client (#5537)
;;; NEEDS_RECIPE_DESIGN_EXHAUSTED — CARGO_DEPS_NEEDED: Rust BBS client requires 100+ crate deps
;;; A1: cargo-build-system — hundreds of crate dependencies need individual packaging
;;; A2: guix import crate produces incomplete dependency graphs for this project
;;; A3: many transitive crates missing from Guix; needs dedicated Rust crate packaging pass

;;; 20. jitsi-videobridge (#5534)
;;; NEEDS_RECIPE_DESIGN_EXHAUSTED — MAVEN_INFEASIBLE: Java/Maven build incompatible with Guix
;;; A1: Maven dependency resolution requires network access during build — blocked by Guix isolation
;;; A2: 100+ Maven artifacts would need individual packaging as Guix Java packages
;;; A3: OpenJDK 11 version pinning adds constraint; full Jitsi stack not feasible in batch

;;; 21. jicofo (#5536)
;;; NEEDS_RECIPE_DESIGN_EXHAUSTED — MAVEN_INFEASIBLE: same Java/Maven blockers as jitsi-videobridge
;;; A1: Maven build system — same network isolation issue
;;; A2: part of Jitsi suite; no standalone utility without videobridge
;;; A3: conference focus component requires full Jitsi stack which is unpackageable

;;; 22. jitsi-meet-turnserver (#5535)
;;; NEEDS_RECIPE_DESIGN_EXHAUSTED — JITSI_STACK_REQUIRED: config files only, no standalone utility
;;; A1: packaging config files alone — non-functional without jitsi-videobridge and jicofo
;;; A2: full Jitsi stack unpackageable (see jitsi-videobridge, jicofo notes)
;;; A3: coturn (TURN server) already available in Guix for standalone TURN needs

;;; 23. vesktop-wayafknext-bin (#5539)
;;; NEEDS_RECIPE_DESIGN_EXHAUSTED — ELECTRON_UNSUPPORTED: Electron 40 not available in Guix
;;; A1: Electron 40 (Chromium-based) not packaged in Guix — 40GB+ build infeasible
;;; A2: no source build path exists without full Electron framework
;;; A3: Vencord/Vesktop Electron packaging blocked by same Chromium limitation affecting all Electron apps

;;; 24. astra (#5568)
;;; NEEDS_RECIPE_DESIGN_EXHAUSTED — ARCH_SPECIFIC: AUR helper depending on pacman ecosystem
;;; A1: depends on pacman, base-devel (Arch-specific) — zero Guix utility
;;; A2: Ruby AUR helper — functionally useless outside Arch Linux
;;; A3: no portable upstream; designed exclusively for Arch package management

;;; 25. tkginstaller-git (#5621)
;;; NEEDS_RECIPE_DESIGN_EXHAUSTED — ARCH_SPECIFIC: Arch-specific TKG build wrapper
;;; A1: Bash wrapper for Frogging-Family builds — depends on makepkg (Arch-only)
;;; A2: depends on onefetch + git; TKG kernel/wine builds are Arch-specific
;;; A3: no portable upstream; designed for Arch PKGBUILD workflow

;;; 26. wine-gaming-dependencies (#5630)
;;; NEEDS_RECIPE_DESIGN_EXHAUSTED — MULTILIB_METAPKG: Arch multilib meta-package
;;; A1: 40+ lib32 dependencies — Guix lacks multilib/32-bit library support
;;; A2: meta-package concept — individual 64-bit libraries already available in Guix
;;; A3: wine-staging dependency with multilib not portable; Guix handles Wine differently

;;; 27. mqtt-explorer (#5625)
;;; NEEDS_RECIPE_DESIGN_EXHAUSTED — NONFREE_LICENSE: CC BY-ND license prohibits derivatives
;;; A1: Creative Commons BY-ND license — non-free by FSDG/Guix standards (no derivatives)
;;; A2: Node.js/Yarn/npm build chain — complex even if license were free
;;; A3: non-free license makes package ineligible for Guix channel distribution

;;; 28. playtorrio-bin (#5629)
;;; NEEDS_RECIPE_DESIGN_EXHAUSTED — ELECTRON_BINARY: prebuilt Electron binary with 15+ deps
;;; A1: Electron binary — conflicts with Guix source-build model
;;; A2: no source build without full Electron framework (unpackageable)
;;; A3: torrent streaming app with Electron packaging infeasibility

;;; 29. libre-trainsim-bin (#5636)
;;; NEEDS_RECIPE_DESIGN_EXHAUSTED — GODOT_STALE: Godot engine binary, project stale
;;; A1: prebuilt Godot engine binary — no Godot export templates in Guix for source build
;;; A2: flagged out-of-date in AUR (v0.8 from 2022); project appears abandoned
;;; A3: building Godot games from source requires Godot editor/build pipeline not in Guix

;;; 30. netpad-vnext-bin (#5637)
;;; NEEDS_RECIPE_DESIGN_EXHAUSTED — DOTNET_RUNTIME_MISSING: requires .NET 9.0 runtime
;;; A1: .NET 9.0 runtime required — not available in Guix
;;; A2: prebuilt binary conflicts with Guix source-build reproducibility model
;;; A3: .NET ecosystem not bootstrapped in Guix; no path to .NET runtime packaging
