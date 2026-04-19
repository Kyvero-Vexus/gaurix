;;; Blocked notes for recipe-resolver-260419g
;;;
;;; BLOCKED EXHAUSTED (10):
;;;
;;; 1. boscaceoil-blue-bin (#3011) — GODOT_RUNTIME_DEPS
;;;    A simple and beginner-friendly app for making music (MIT).
;;;    Source: https://yurisizov.itch.io/boscaceoil-blue
;;;    GitHub: https://github.com/YuriSizov/boscaceoil-blue
;;;    A1: copy-build-system with prebuilt Godot 4 binary — binary bundles
;;;        libgdsion.linux.so and has implicit runtime deps on X11/Wayland,
;;;        PulseAudio, OpenGL, etc.  that are not enumerable without testing.
;;;    A2: Build from source — requires Godot 4 export templates which are
;;;        not packaged in Guix.  Godot engine itself is a massive build.
;;;    A3: The PKGBUILD uses !strip option, suggesting the binary may break
;;;        if stripped.  Desktop file and icon are AUR-maintained, not upstream.
;;;    Conclusion: Godot 4 runtime dependency chain too complex to resolve
;;;    without Godot engine packaging infrastructure.
;;;
;;; 2. openhue-cli (#3010) — GO_VENDORED_DEPS
;;;    CLI for interacting with Philips Hue smart lighting systems (Apache-2.0).
;;;    Source: https://github.com/openhue/openhue-cli
;;;    A1: go-build-system with source tarball — project uses Go modules
;;;        with 30+ transitive dependencies not individually packaged in Guix.
;;;    A2: guix import go incomplete — many transitive modules missing
;;;        from Guix package collection.
;;;    A3: No pre-built binary releases published on GitHub — only source
;;;        distribution available.
;;;    Conclusion: Go module vendoring requires individually packaging all
;;;    transitive dependencies.
;;;
;;; 3. framework-control-bin (#3072) — MISSING_GUIX_DEPS
;;;    Tool for Framework Laptop features (Fan, Battery, LEDs) (MIT).
;;;    Source: https://github.com/ozturkkl/framework-control
;;;    A1: copy-build-system with prebuilt binary — depends on
;;;        framework-system (AUR-only hardware-specific package) which
;;;        provides the embedded controller interface.
;;;    A2: The package installs a systemd service unit — Guix uses Shepherd,
;;;        not systemd, requiring a service rewrite.
;;;    A3: Hardware-specific to Framework Laptops only; generates a .desktop
;;;        file for a web-based localhost control panel.
;;;    Conclusion: Blocked by framework-system dependency (not in Guix) and
;;;    systemd service model incompatibility.
;;;
;;; 4. tufw-git (#3099) — RUST_VENDORED_DEPS
;;;    Terminal UI for ufw firewall (MIT).
;;;    Source: https://github.com/peltho/tufw
;;;    A1: cargo-build-system from source — Rust project with cargo deps
;;;        that need individual packaging in Guix.
;;;    A2: No pre-built binary releases on GitHub — only source available.
;;;    A3: guix import crate incomplete — missing transitive crate deps.
;;;    Conclusion: Rust vendored dependency chain requires individual crate
;;;    packaging.
;;;
;;; 5. mas (#3025) — SOURCE_UNAVAILABLE
;;;    Macro cross-assembler (asl) for various processors (GPL-2.0).
;;;    Source: http://john.ccac.rwth-aachen.de:8000/as/
;;;    A1: gnu-build-system — upstream hosted on non-standard academic
;;;        server (RWTH Aachen personal page) with unreliable availability.
;;;    A2: No GitHub/GitLab mirror available for stable source fetching.
;;;    A3: Download URL uses non-standard port 8000 which may be blocked
;;;        by institutional firewalls during Guix builds.
;;;    Conclusion: Source hosted on unreliable personal academic server;
;;;    no mirror available for reproducible builds.
;;;
;;; 6. pandoc-crossref-bin (#3092) — MISSING_GUIX_DEPS
;;;    Pandoc filter for cross-references (GPL-2.0+).
;;;    Source: https://github.com/lierdakil/pandoc-crossref
;;;    A1: copy-build-system with prebuilt binary — requires pandoc >= 3.9
;;;        at runtime; Guix pandoc version may not match.
;;;    A2: Pandoc version coupling is strict — binary linked against
;;;        specific pandoc-types version; mismatch causes runtime failures.
;;;    A3: Building from source requires full Haskell/Cabal toolchain with
;;;        version-matched pandoc development libraries.
;;;    Conclusion: Strict pandoc version coupling makes binary distribution
;;;    fragile; source build requires Haskell ecosystem alignment.
;;;
;;; 7. noto-fonts-cjk-fontconfig (#3019) — ALREADY_PACKAGED_PRIOR
;;;    Fontconfig for Noto CJK fonts locale ordering (GPL-3.0+).
;;;    Source: AUR
;;;    A1: Recipe already exists in recipe-resolver-260407b.scm
;;;        (noto-fonts-cjk-fontconfig v1, fontconfig XML).
;;;    A2: Also handled in cron-c79f127f-r22-w03-nrd2.scm.
;;;    A3: No additional work needed — package is already defined.
;;;    Conclusion: Already packaged in prior resolver pass.
;;;
;;; 8. fish-session (#3084) — LICENSE_MISSING + RUST_VENDORED_DEPS
;;;    UI-first session manager for Fish shell (UNLICENSED).
;;;    Source: https://github.com/AtefR/fish-session
;;;    A1: License is "LicenseRef-UNLICENSED" — cannot redistribute
;;;        without explicit license grant from author.
;;;    A2: Rust/Cargo source requires individually packaging crate deps.
;;;    A3: Even if license were resolved, cargo-build-system dependency
;;;        chain is significant.
;;;    Conclusion: Missing open-source license prevents redistribution;
;;;    Rust vendored deps compound the issue.
;;;
;;; 9. reqable-bin (#3013) — PROPRIETARY
;;;    Professional HTTP development and debugging tool (custom license).
;;;    Source: https://reqable.com
;;;    A1: Closed-source commercial software — "LicenseRef-custom" blocks
;;;        free redistribution.
;;;    A2: Binary requires 7 runtime deps including GTK3, NSS, and
;;;        libayatana-appindicator (not all in Guix).
;;;    A3: No source code available — only proprietary binary download.
;;;    Conclusion: Proprietary license incompatible with Guix free software
;;;    policy; no source available.
;;;
;;; 10. tmux-plugin-panel-bin (#3088) — NO_RELEASE_PATTERN
;;;     Full-fledged TUI plugin manager for tmux (MIT).
;;;     Source: https://github.com/marlocarlo/Tmux-Plugin-Panel
;;;     A1: No cached PKGBUILD available — cannot determine release binary
;;;         URL pattern or archive structure.
;;;     A2: GitHub releases page structure unknown — multiple URL patterns
;;;         possible (tar.gz, raw binary, platform-specific naming).
;;;     A3: Same author as omp-manager-bin, but release naming conventions
;;;         may differ between repositories.
;;;     Conclusion: Cannot construct reliable download URL without PKGBUILD
;;;     or release page verification.
