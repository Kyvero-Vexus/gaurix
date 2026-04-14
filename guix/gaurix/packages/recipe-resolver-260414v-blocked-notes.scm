;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Blocked notes for recipe-resolver-260414v
;;; 22 packages marked NEEDS_RECIPE_DESIGN_EXHAUSTED
;;;
;;; Packages with detailed blocking reasons:

;;; 1. backintime-git (#7008, line 53774)
;;;    COMPLEX_DEPS: Python/Qt6 backup tool
;;;    (github.com/bit-team/backintime, GPL-2.0);
;;;    requires python-pyqt6 integration with qt6-svg, qt6-wayland;
;;;    custom Makefile-based build splits into cli + gui sub-packages.
;;;    A1: pyproject build fails — custom Makefile approach needed;
;;;    A2: Qt6 SVG/Wayland integration not well-tested in Guix;
;;;    A3: split cli/gui packaging adds complexity.

;;; 2. perplexity (#7019, line 53859)
;;;    ELECTRON_SAAS: Electron wrapper for Perplexity AI web service
;;;    (github.com/mazixs/perplexity, Apache-2.0 + custom:UNLICENSED);
;;;    npm/Electron build; wraps a proprietary SaaS with no offline mode;
;;;    partially unlicensed upstream code.
;;;    A1: Electron build system not supported in Guix;
;;;    A2: wraps proprietary web service — no standalone utility;
;;;    A3: upstream license partially UNLICENSED.

;;; 3. serproid (#7030, line 53947)
;;;    PROPRIETARY_LICENSE: Serpro PKCS#11 driver
;;;    (serproid.serpro.gov.br, custom proprietary);
;;;    Brazilian government closed-source digital certificate driver;
;;;    requires Java 25+ and java-openjfx; non-free license.
;;;    A1: custom proprietary license — ineligible for Guix;
;;;    A2: binary-only Java application with specific JFX requirements;
;;;    A3: government-specific, no FOSS alternative.

;;; 4. mytimer (#7309, line 56014)
;;;    MISSING_PYTHON_DEPS: terminal timer with ASCII art
;;;    (github.com/sepandhaghighi/mytimer, MIT);
;;;    requires python-nava (audio playback), python-art (ASCII art),
;;;    python-jdatetime (Jalali calendar) — none in Guix.
;;;    A1: 3+ missing Python deps need packaging first;
;;;    A2: python-nava uses platform-specific audio APIs;
;;;    A3: python-art has 700+ font dependencies.

;;; 5. gnome-system-tools (#7365, line 56370)
;;;    DEAD_PROJECT: GNOME system admin tools
;;;    (gitlab.gnome.org/Archive/gnome-system-tools, GPL-2.0);
;;;    last release 3.0.0 in 2011; depends on liboobs (abandoned);
;;;    archived by GNOME, no development for 15+ years.
;;;    A1: project archived and unmaintained since 2011;
;;;    A2: liboobs dependency is abandoned;
;;;    A3: functionality replaced by GNOME Settings/systemd.

;;; 6. bobcat-terminal (#7284, line 55828)
;;;    MISSING_FRAMEWORK: terminal emulator using U++ framework
;;;    (github.com/ismail-yilmaz/Bobcat, GPL-3.0);
;;;    requires U++ (Ultimate++) C++ framework with custom build system
;;;    (umk/BLITZ); U++ not in Guix.
;;;    A1: U++ framework is a major packaging effort (custom build system);
;;;    A2: umk build tool not compatible with standard Guix build systems;
;;;    A3: better terminal emulators already available in Guix.

;;; 7. yauri (#3687, line 28914)
;;;    ARCH_SPECIFIC: AUR helper in Python
;;;    (gitlab.com/PieyIsAPie/yauri, GPL);
;;;    depends on pacman, pacman-contrib; interacts with AUR;
;;;    zero utility on Guix.
;;;    A1: depends on pacman/libalpm — Arch-specific;
;;;    A2: queries AUR — irrelevant on non-Arch systems;
;;;    A3: Guix has its own package management.

;;; 8. lamco-rdp-server (#3758, line 29500)
;;;    NON_FREE_LICENSE: Wayland RDP server
;;;    (github.com/lamco-admin/lamco-rdp-server, BUSL-1.1);
;;;    Business Source License 1.1 is not a free software license
;;;    (converts to open source after delay, but proprietary until then).
;;;    A1: BUSL-1.1 is non-free — ineligible for Guix;
;;;    A2: Rust/Cargo + CMake hybrid build would be complex;
;;;    A3: alternative Wayland RDP solutions exist (gnome-remote-desktop).

;;; 9. openwork (#4371, line 34385)
;;;    TAURI_COMPLEX: AI coding assistant (Tauri app)
;;;    (github.com/different-ai/openwork, MIT);
;;;    Tauri (Rust + WebKit + TypeScript) build;
;;;    requires webkit2gtk-4.1, npm/yarn frontend build.
;;;    A1: Tauri build system not supported in Guix;
;;;    A2: npm/yarn frontend build adds deep dependency tree;
;;;    A3: webkit2gtk integration is complex.

;;; 10. river-creek (#4409, line 34674)
;;;     ZIG_BUILD_SYSTEM: status bar for River Wayland compositor
;;;     (github.com/nmeum/creek, MIT);
;;;     requires Zig 0.14 build system; Guix zig-build-system is
;;;     experimental; version mismatch (Guix has 0.15, creek needs 0.14).
;;;     A1: Zig 0.14 specifically required — version incompatible;
;;;     A2: zig-build-system experimental in Guix;
;;;     A3: River compositor not packaged in Guix.

;;; 11. happy-cli (#4412, line 34695)
;;;     NPM_ECOSYSTEM: Node.js/yarn application
;;;     (github.com/slopus/happy, MIT);
;;;     deep npm dependency tree with yarn build;
;;;     Guix node-build-system is immature.
;;;     A1: yarn/npm build requires full dependency resolution;
;;;     A2: node-build-system lacks feature parity;
;;;     A3: 18k deps typical for Node.js projects.

;;; 12. lution (#4431, line 34836)
;;;     MISSING_PYTHON_DEPS: Roblox bootstrapper (Python/PySide6)
;;;     (github.com/Wookhq/Lution, MIT);
;;;     depends on python-pyside6, python-streamlit (heavy web framework),
;;;     qt6-webengine — none in Guix.
;;;     A1: python-pyside6 not packaged in Guix;
;;;     A2: python-streamlit brings massive dep tree;
;;;     A3: qt6-webengine not available in Guix.

;;; 13. vm-curator (#4444, line 34938)
;;;     CARGO_DEPS_NEEDED: Rust TUI VM manager
;;;     (github.com/mroboff/vm-curator, MIT);
;;;     Rust project with multiple cargo crate dependencies;
;;;     needs full crate enumeration for cargo-build-system.
;;;     A1: cargo-build-system requires individually packaged crates;
;;;     A2: no pre-built binary releases with x86_64-linux;
;;;     A3: guix import crate produces incomplete results.

;;; 14. pnana (#4446, line 34952)
;;;     COMPLEX_BUILD: C++/FTXUI + Go hybrid text editor
;;;     (github.com/Cyxuan0311/pnana, MIT);
;;;     CMake + Go hybrid build; Go helper component adds complexity;
;;;     no tagged releases.
;;;     A1: hybrid CMake+Go build requires two build systems;
;;;     A2: no tagged releases — cannot pin version;
;;;     A3: Go vendor dependencies need enumeration.

;;; 15. mov-watch (#4472, line 35153)
;;;     ETHICALLY_PROBLEMATIC: streaming/piracy tool
;;;     (github.com/leoallday/mov-watch, MIT);
;;;     scrapes copyrighted streaming content; depends on
;;;     python-pypresence, python-pycryptodome (partial in Guix).
;;;     A1: scrapes copyrighted content — ethically problematic;
;;;     A2: missing Python deps (python-pypresence);
;;;     A3: yt-dlp interaction for streaming raises legal concerns.

;;; 16. blinky (#4527, line 35553)
;;;     ARCH_SPECIFIC: AUR helper in Python
;;;     (github.com/cherti/blinky, GPL-3.0);
;;;     depends on pyalpm (Python bindings for pacman/libalpm);
;;;     queries AUR; zero utility on Guix.
;;;     A1: pyalpm requires libalpm (pacman) — not in Guix;
;;;     A2: queries AUR — irrelevant on Guix;
;;;     A3: Guix has its own package management.

;;; 17. zombie (#4540, line 35661)
;;;     CARGO_DEPS_NEEDED: Rust TUI process manager
;;;     (github.com/NVSRahul/zombie, MIT);
;;;     Rust project requiring full crate enumeration;
;;;     single release v1.0.0 has no binary assets.
;;;     A1: cargo-build-system requires individually packaged crates;
;;;     A2: no pre-built binaries available;
;;;     A3: guix import crate may produce incomplete results.

;;; 18. casual-pre-loader-git (#4705, line 36909)
;;;     NON_FREE_LICENSE: TF2 particle modification tool
;;;     (github.com/cueki/casual-pre-loader, CC-BY-NC-ND-4.0 + GPL-3.0);
;;;     CC-BY-NC-ND-4.0 is non-free (no derivatives, non-commercial);
;;;     depends on python-valve-parsers (not in Guix).
;;;     A1: CC-BY-NC-ND-4.0 is non-free — ineligible for Guix;
;;;     A2: python-valve-parsers not packaged;
;;;     A3: game-specific tool with limited audience.

;;; 19. aurscan-git (#4227, line 33326)
;;;     ARCH_SPECIFIC: ClamAV scanner for AUR packages
;;;     (gitlab.com/MayESchaefer/aurscan, GPL-3.0);
;;;     depends on paru (AUR helper), pacman; scans AUR packages
;;;     with ClamAV before building; Arch-specific workflow.
;;;     A1: depends on paru/pacman — Arch-specific;
;;;     A2: AUR scanning irrelevant on Guix;
;;;     A3: Bash script with Arch-specific paths.

;;; 20. tabaur (#6843, line 52572)
;;;     ARCH_SPECIFIC: C++ AUR helper
;;;     (github.com/BurntRanch/TabAUR, GPL-2.0);
;;;     depends on pacman, uses libalpm C++ APIs;
;;;     queries AUR; zero utility on Guix.
;;;     A1: depends on pacman/libalpm — Arch-specific;
;;;     A2: queries AUR — irrelevant on Guix;
;;;     A3: C++ AUR helper with no portability.

;;; 21. ollamacode (#7216, line 55309)
;;;     IMMATURE_PROJECT: AI coding assistant for Ollama
;;;     (github.com/r3dg0d/ollamacode, MIT);
;;;     5 GitHub stars; depends on pip at runtime (listed as runtime dep);
;;;     requires ollama service; very early-stage project.
;;;     A1: pip as runtime dependency is anti-pattern for Guix;
;;;     A2: 5 stars — insufficient maturity;
;;;     A3: many better alternatives (aider-chat, etc.).

;;; 22. foobard-git (#6834, line 52496)
;;;     NO_RELEASES: MPRIS client for Foobar2000
;;;     (git.sr.ht/~dropbear/foobard, BSD-3-Clause);
;;;     no tagged releases or versions on Sourcehut;
;;;     cannot pin a stable version for packaging.
;;;     A1: no tags or releases — cannot determine version;
;;;     A2: requires systemd/D-Bus for MPRIS — integration unclear;
;;;     A3: niche use case (controlling Windows Foobar2000 via MPRIS).
