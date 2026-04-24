;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Blocked/exhausted notes for recipe-resolver-260423t
;;;
;;; This file documents packages that could not be resolved in this pass.

;;; ====================================================================
;;; ALREADY PACKAGED PRIOR (8 packages)
;;; These were found to have existing recipes in earlier resolver passes.
;;; Org entries updated to reference the existing recipe.
;;; ====================================================================
;;;
;;; 15. python-types-waitress (#5994)
;;;     Recipe: recipe-resolver-260408w.scm
;;;     Typing stubs for waitress; pyproject-build-system.
;;;
;;; 16. python-cyclopts (#5920)
;;;     Recipe: recipe-resolver-260416e.scm
;;;     Python CLI framework; pyproject-build-system.
;;;
;;; 17. python-myvaillant (#5572)
;;;     Recipe: recipe-resolver-260415r.scm
;;;     Vaillant IoT API client; pyproject-build-system.
;;;
;;; 18. wl-mpris-idle-inhibit (#3005)
;;;     Recipe: recipe-resolver-260418k.scm
;;;     Wayland idle inhibitor via MPRIS; cargo-build-system.
;;;
;;; 19. terminal-rain-lightning (#8687)
;;;     Recipe: recipe-resolver-260407m.scm
;;;     Terminal rain/lightning visual effect.
;;;
;;; 20. smpeg0 (#5638)
;;;     Recipe: recipe-resolver-260415d.scm
;;;     Legacy SDL MPEG playback library.
;;;
;;; 21. nutty-git (#26836)
;;;     Recipe: recipe-resolver-260419e.scm (as "nutty")
;;;     Network utility GUI; Vala/meson.
;;;
;;; 22. gh-dash (#18201)
;;;     Recipe: deptree-resolver-260418ab.scm (as "gh-dash-bin")
;;;     GitHub CLI dashboard extension; Go binary.

;;; ====================================================================
;;; BLOCKED — RUST/CARGO (3 packages)
;;; Rust packages without pre-built binaries.  cargo-build-system in
;;; Guix requires enumerating all crate dependencies as #:cargo-inputs,
;;; which is extensive work for each package.
;;; ====================================================================
;;;
;;; 23. sigi (#20407)
;;;     Upstream: https://github.com/sigi-cli/sigi v3.7.1
;;;     Stack-based TODO CLI in Rust.  No pre-built x86_64-linux binaries
;;;     on GitHub releases.  A1: cargo-build-system — requires listing
;;;     all crate deps.  A2: check for static musl binary — none found.
;;;     A3: vendor tarball — not provided by upstream.
;;;
;;; 24. rofi-games (#8016)
;;;     Upstream: https://github.com/Rolv-Apneseth/rofi-games v1.17.3
;;;     Rofi game launcher plugin in Rust.  Requires Rofi plugin API +
;;;     Rust crate deps.  A1: cargo-build-system — needs all crate deps.
;;;     A2: pre-built binary — none on releases.  A3: Nix derivation
;;;     reference — not portable to Guix cargo-build-system directly.
;;;
;;; 25. greetd-tuigreet-fork-git (#38496)
;;;     Upstream: https://github.com/NotAShelf/tuigreet v0.10.2
;;;     TUI login greeter for greetd in Rust.  Fork of apognu/tuigreet.
;;;     A1: cargo-build-system — needs all crate deps.  A2: pre-built
;;;     binary — none found on fork releases.  A3: use upstream tuigreet
;;;     instead — different feature set.

;;; ====================================================================
;;; BLOCKED — ECOSYSTEM (1 package)
;;; ====================================================================
;;;
;;; 26. phpactor (#18339)
;;;     Upstream: https://github.com/phpactor/phpactor v2025.12.21.1
;;;     PHP language server.  PHP/Composer project with 50+ Composer
;;;     dependencies.  A1: .phar binary — not published on releases.
;;;     A2: composer-build-system — does not exist in Guix.  A3: copy
;;;     vendor directory — would need manual dependency vendoring.

;;; ====================================================================
;;; EXHAUSTED (4 packages)
;;; All practical approaches attempted; packaging infeasible.
;;; ====================================================================
;;;
;;; 27. gprname (#4787)
;;;     Upstream: Part of GPRbuild (AdaCore)
;;;     Ada multi-language builder with circular bootstrap: gprbuild
;;;     requires itself (or xmlada) to build.  A1: bootstrap with
;;;     minimal gprbuild — requires Ada compiler + manual bootstrap
;;;     sequence.  A2: pre-built binary — not available for Guix
;;;     platforms.  A3: skip gprbuild, use gnat directly — gprname
;;;     is specifically a gprbuild component and cannot be separated.
;;;
;;; 28. adblock2privoxy (#7866)
;;;     Upstream: https://github.com/nicosoresm/adblock2privoxy v2.3.1
;;;     Haskell/Cabal project, orphaned on AUR.  Requires 20+ Haskell
;;;     library packages (parsec, network, http-conduit, etc.) each
;;;     needing individual Guix packaging.  A1: haskell-build-system
;;;     with cabal — blocked by missing deps.  A2: static binary from
;;;     Hackage — not available.  A3: alternative tool (privoxy-blocklist)
;;;     — different approach entirely.
;;;
;;; 29. thunar-extended (#18980)
;;;     Upstream: Xfce Thunar v4.18.11 + custom patches
;;;     Requires maintaining a patch set against upstream Thunar for
;;;     extended features.  A1: inherit from Guix thunar + patches —
;;;     patches not published, AUR builds from modified source.  A2:
;;;     package from AUR PKGBUILD patches — patches are version-specific
;;;     and break on Thunar updates.  A3: contribute patches upstream —
;;;     out of scope for packaging.
;;;
;;; 30. cassette (#8104)
;;;     Upstream: https://gitlab.gnome.org/Rirusha/Cassette v0.2.1
;;;     GNOME music streaming app in Vala.  Requires GNOME 46+ libs
;;;     (libadwaita >=1.5, blueprint-compiler) and unpublished Vala
;;;     bindings.  A1: meson-build-system — blocked by missing GNOME
;;;     46+ deps in Guix.  A2: flatpak-based — not suitable for Guix.
;;;     A3: wait for GNOME 46 in Guix — dependency on upstream Guix
;;;     timeline.
