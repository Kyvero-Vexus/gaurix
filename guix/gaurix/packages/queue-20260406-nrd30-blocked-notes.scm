;;; Blocked notes for queue-20260406-nrd30 — 10 packages re-blocked with
;;; detailed reasons after evaluation.
(define-module (gaurix packages queue-20260406-nrd30-blocked-notes))

;; ── Re-blocked packages with exhausted approaches ──────────────────
;;
;; 1. cyx (3354)
;;    Status: BLOCKED (NEEDS_RECIPE_DESIGN)
;;    Reason: Rust/Cargo package requires vendored dependency tree via
;;    cargo-build-system cargo-inputs.  crates.io lists 80+ transitive deps.
;;    Approaches tried: (a) cargo-build-system — needs all deps listed as
;;    cargo-inputs, infeasible in batch; (b) pre-built binary — no GitHub
;;    Releases with Linux binaries; (c) copy-build from crates.io — still
;;    needs cargo at build time.
;;    Next: Dedicated Rust packaging pass with cargo-build-system scaffolding.
;;
;; 2. shellforge (3376)
;;    Status: BLOCKED (NEEDS_RECIPE_DESIGN)
;;    Reason: Rust/Cargo package, same cargo-inputs issue as cyx.
;;    Source: https://github.com/minosariane/Shellforge v1.0.1
;;    Approaches tried: (a) cargo-build-system — needs vendored deps;
;;    (b) no pre-built binary releases on GitHub.
;;    Next: Dedicated Rust packaging pass.
;;
;; 3. manx-cli (3362)
;;    Status: BLOCKED (NEEDS_RECIPE_DESIGN)
;;    Reason: Rust/Cargo package with openssl dependency.  crates.io tarball
;;    requires full cargo-inputs specification.
;;    Source: https://github.com/neur0map/manx-cli v0.5.9
;;    Approaches tried: (a) cargo-build-system — complex dep tree;
;;    (b) no static binary releases available.
;;    Next: Dedicated Rust packaging pass.
;;
;; 4. kimaki (3359)
;;    Status: BLOCKED (NEEDS_RECIPE_DESIGN)
;;    Reason: npm/Node.js package distributed via npmjs.org.  Guix lacks
;;    comprehensive npm packaging infrastructure for complex dependency trees.
;;    Package is also flagged out-of-date on AUR.
;;    Source: https://github.com/remorses/kimaki v0.4.79
;;    Approaches tried: (a) node-build-system — requires npm dep vendoring;
;;    (b) no standalone binary releases.
;;    Next: Evaluate when Guix npm packaging matures or upstream provides binaries.
;;
;; 5. brewtarget (3401)
;;    Status: BLOCKED (NEEDS_RECIPE_DESIGN)
;;    Reason: Meson build with heavy Qt6 dependency chain (qt6-base,
;;    qt6-multimedia, qt6-svg, qt6-tools) plus boost, pandoc, xalan-c, xerces-c.
;;    Many deps may not be in Guix or at required versions.
;;    Source: https://github.com/Brewtarget/brewtarget v5.0.4
;;    Approaches tried: (a) meson-build-system — dep chain too deep for batch;
;;    (b) no AppImage or binary releases available.
;;    Next: Dedicated Qt6 packaging pass once Qt6 deps stabilize in Guix.
;;
;; 6. flowtime (3403)
;;    Status: BLOCKED (NEEDS_RECIPE_DESIGN)
;;    Reason: Meson + Vala app requiring libadwaita, libportal-gtk4,
;;    blueprint-compiler.  blueprint-compiler not packaged in Guix.
;;    Source: https://github.com/Diego-Ivan/Flowtime v6.5
;;    Approaches tried: (a) meson-build-system — blueprint-compiler missing;
;;    (b) no Flatpak-to-Guix conversion path.
;;    Next: Package blueprint-compiler first, then Flowtime.
;;
;; 7. seemux-bin (3375)
;;    Status: BLOCKED (NEEDS_RECIPE_DESIGN)
;;    Reason: Pre-built binary with unknown/unlicensed status upstream.
;;    No recognized SPDX license declared in repository or AUR metadata.
;;    Cannot distribute without clear license.
;;    Source: https://github.com/asermax/seemux v0.34.4
;;    Approaches tried: (a) copy-build-system — blocked by license ambiguity;
;;    (b) checked repo for LICENSE file — none found.
;;    Next: Contact upstream to clarify license before packaging.
;;
;; 8. epub2pdf (3382)
;;    Status: BLOCKED (NEEDS_RECIPE_DESIGN)
;;    Reason: Java JAR application.  Homepage (epub2pdf.com) is dead/offline.
;;    Source hosted on openpkg.org mirror.  Last upstream activity 2017.
;;    Effectively abandonware.
;;    Source: http://epub2pdf.com v0.5 (dead)
;;    Approaches tried: (a) copy-build with JRE wrapper — source URL unreliable;
;;    (b) checked for forks or mirrors — no active maintenance found.
;;    Next: Consider alternative epub-to-pdf tools (e.g., calibre).
;;
;; 9. river-bedload-git (3209)
;;    Status: BLOCKED (NEEDS_RECIPE_DESIGN)
;;    Reason: Built with Zig build system.  Guix does not have a zig-build-system
;;    and the Zig compiler is not packaged.
;;    Source: https://git.sr.ht/~novakane/river-bedload (Zig)
;;    Approaches tried: (a) zig-build — no Zig in Guix; (b) cross-compile
;;    outside Guix — defeats purpose; (c) no pre-built binaries available.
;;    Next: Requires Zig compiler package in Guix first.
;;
;; 10. tdocker (3389)
;;     Status: BLOCKED (NEEDS_RECIPE_DESIGN)
;;     Reason: Go TUI application.  go-build-system requires all Go module
;;     dependencies listed as go-inputs.  tdocker imports multiple Go packages
;;     (tview, tcell, docker SDK) with deep transitive deps.
;;     Source: https://github.com/pivovarit/tdocker v0.5.2
;;     Approaches tried: (a) go-build-system — needs extensive go-inputs list;
;;     (b) no pre-built binary releases on GitHub.
;;     Next: Dedicated Go packaging pass with go-inputs scaffolding.
