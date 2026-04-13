;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Blocked notes for recipe-resolver-260413s
;;; 14 packages blocked with specific reason codes.

(define-module (gaurix packages recipe-resolver-260413s-blocked-notes))

;;; ── Blocked package notes ──────────────────────────────────────────

;;; 1. aaaaxy (#6841)
;;;    Status: BLOCKED: CGO_GAME_COMPLEX
;;;    Reason: Nonlinear puzzle platformer (Go + CGo + Ebitengine game engine).
;;;    Requires OpenGL, X11, ALSA via CGo.  Makefile build with asset generation,
;;;    git submodules, and embedded game data.
;;;    Approaches: A1: go-build-system — CGo requires explicit C library inputs
;;;    plus Makefile-based asset pipeline (graphviz, imagemagick, pandoc).
;;;    A2: Binary from release — no prebuilt Linux binaries on GitHub releases.
;;;    A3: Simplified build without assets — game is non-functional without
;;;    embedded assets.
;;;    Verdict: BLOCKED — complex CGo game build with asset pipeline; needs
;;;    dedicated game packaging pass.

;;; 2. dinit-edit-git (#923)
;;;    Status: BLOCKED: UPSTREAM_NOT_FOUND
;;;    Reason: Cannot locate upstream source for dinit-edit-git.
;;;    Approaches: A1: Search GitHub/GitLab/Codeberg — no matching project found
;;;    for "dinit-edit" as a Go tool for editing dinit service files.
;;;    A2: Check AUR PKGBUILD — no cached PKGBUILD available.
;;;    A3: Contact AUR maintainer — out of scope for batch pass.
;;;    Verdict: BLOCKED — upstream source cannot be located.

;;; 3. doasedit-nhk (#6753)
;;;    Status: BLOCKED: CARGO_DEPS_NEEDED
;;;    Reason: Rust implementation of doasedit (github.com/nhktmdzhg/doasedit,
;;;    MIT, v1.1.0).  Only 5 direct deps (tempfile, clap, nix, libc, anyhow)
;;;    but no prebuilt Linux binaries.
;;;    Approaches: A1: cargo-build-system — needs all 5 crate deps individually
;;;    packaged in Guix (plus transitive deps from clap ~30 crates).
;;;    A2: guix import crate doasedit — may bootstrap partial definition but
;;;    clap pulls heavy transitive tree.
;;;    A3: Build static binary externally — not reproducible in Guix model.
;;;    Verdict: BLOCKED — low direct dep count but clap transitive tree is large;
;;;    needs dedicated Rust crate enumeration pass.

;;; 4. iamb-git (#6760)
;;;    Status: BLOCKED: CARGO_DEPS_MASSIVE
;;;    Reason: Matrix chat client TUI in Rust (github.com/ulyssa/iamb, Apache-2.0).
;;;    44 direct crate dependencies including matrix-sdk (with e2e encryption),
;;;    tokio, ratatui, html5ever, image processing.
;;;    Approaches: A1: cargo-build-system — needs 44+ direct deps plus massive
;;;    transitive tree (matrix-sdk alone pulls 200+ crates).
;;;    A2: Binary from release — no prebuilt binaries on GitHub.
;;;    A3: guix import crate — would generate hundreds of crate definitions.
;;;    Verdict: BLOCKED — massive Rust dependency tree; matrix-sdk ecosystem
;;;    not available in Guix.

;;; 5. nirinit-git (#4510)
;;;    Status: BLOCKED: CARGO_DEPS_NEEDED
;;;    Reason: Session manager for Niri compositor in Rust
;;;    (github.com/amaanq/nirinit, MPL-2.0, v0.2.2).  12 direct deps including
;;;    niri-ipc which is niche and not in Guix.
;;;    Approaches: A1: cargo-build-system — 12 direct deps, niri-ipc likely
;;;    needs packaging first.
;;;    A2: Binary from release — no prebuilt binaries on GitHub releases.
;;;    A3: guix import crate nirinit — partial, niri-ipc will be missing.
;;;    Verdict: BLOCKED — moderate dep count but niri-ipc ecosystem not in Guix.

;;; 6. ovn (#4397)
;;;    Status: BLOCKED: INFRASTRUCTURE_DEP
;;;    Reason: Open Virtual Network (github.com/ovn-org/ovn, Apache-2.0,
;;;    v26.03.0).  Network virtualization layer built on Open vSwitch.
;;;    Approaches: A1: gnu-build-system (autotools) — requires Open vSwitch
;;;    as hard dependency, which itself is a significant package not in Guix.
;;;    A2: Package OVS first — large undertaking (kernel module + userspace).
;;;    A3: Container/binary approach — OVN is a daemon, not suited for binary
;;;    repackaging.
;;;    Verdict: BLOCKED — needs Open vSwitch packaged first; both are large
;;;    networking infrastructure packages.

;;; 7. atari++ (#6758)
;;;    Status: BLOCKED: CUSTOM_LICENSE
;;;    Reason: Atari emulator (xl-project.com, v1.85).  Uses THOR Public
;;;    Licence (TPL), a modified Mozilla Public License with German law
;;;    governing clauses and author-specific modifications.
;;;    Approaches: A1: gnu-build-system (autotools) — build is standard, but
;;;    TPL license needs to be added as custom license in Guix and verified
;;;    for FSDG compliance.
;;;    A2: Verify TPL is FSF-approved — not listed in FSF license list.
;;;    A3: Contact upstream about relicensing — out of scope.
;;;    Verdict: BLOCKED — custom license needs FSDG compliance review.

;;; 8. foobard-git (#6834)
;;;    Status: BLOCKED: NO_VERSIONED_RELEASES
;;;    Reason: Foobar2000 MPRIS client (git.sr.ht/~dropbear/foobard, BSD-3).
;;;    Only 5 commits, no tags or releases.  Requires foobar2000 (proprietary
;;;    Windows software under Wine) at runtime.
;;;    Approaches: A1: Pin to git commit — unstable, only 5 commits total.
;;;    A2: gnu-build-system with Make — simple C build but no version stability.
;;;    A3: Skip — niche use case (foobar2000 MPRIS under Wine).
;;;    Verdict: BLOCKED — no versioned releases; niche proprietary software
;;;    dependency.

;;; 9. pulsecontrol-git (#6781)
;;;    Status: BLOCKED: DEPS_UNAVAILABLE
;;;    Reason: Fork of pavucontrol with UX improvements (gitlab.freedesktop.org,
;;;    GPL-2.0, v0.9).  Requires gtkmm-4.0 (C++ GTK4 bindings).
;;;    Approaches: A1: meson-build-system — build straightforward but gtkmm-4.0
;;;    may not be available in Guix (Guix has gtkmm@3 but gtkmm@4 status unclear).
;;;    A2: Inherit from pavucontrol and patch — fork has diverged significantly.
;;;    A3: Package gtkmm-4.0 first — additional dependency packaging needed.
;;;    Verdict: BLOCKED — gtkmm-4.0 availability in Guix needs verification;
;;;    if missing, needs dedicated GTK4 C++ bindings packaging.

;;; 10. dput (#6986)
;;;     Status: BLOCKED: ECOSYSTEM_SPECIFIC
;;;     Reason: Debian package upload tool (salsa.debian.org, GPL-2+).
;;;     Tightly coupled to Debian infrastructure (uploading .changes/.deb files
;;;     to Debian archive servers).
;;;     Approaches: A1: python-build-system — technically buildable but depends
;;;     on python-debian, python-paramiko, and Debian-specific configuration.
;;;     A2: Package as utility — useless without Debian archive access.
;;;     A3: Skip — no value for Guix users who don't maintain Debian packages.
;;;     Verdict: BLOCKED — Debian-specific tool with no Guix use case.

;;; 11. python-pyebsdindex (#6842)
;;;     Status: BLOCKED: DEPS_UNAVAILABLE
;;;     Reason: EBSD orientation indexing tool (US NRL, custom public domain
;;;     license, v0.3.9.2).  Requires python-numba (JIT compiler) which
;;;     depends on LLVM and is complex to package.
;;;     Approaches: A1: pyproject-build-system — blocked by python-numba
;;;     (requires LLVM JIT infrastructure, not trivially packaged).
;;;     A2: Skip numba — core functionality depends on numba for performance.
;;;     A3: Package numba first — significant LLVM packaging effort.
;;;     Verdict: BLOCKED — python-numba dependency chain too deep for batch.

;;; 12. ruby-neovim (#4228)
;;;     Status: BLOCKED: DEPS_UNAVAILABLE
;;;     Reason: Ruby bindings for Neovim (github.com/neovim/neovim-ruby, MIT,
;;;     v0.10.0).  Requires ruby-msgpack and ruby-multi-json gems.
;;;     Approaches: A1: ruby-build-system — needs ruby-msgpack (native C ext
;;;     with MessagePack C library) and ruby-multi-json packaged first.
;;;     A2: guix import gem neovim — may bootstrap but deps still needed.
;;;     A3: Package ruby-msgpack first — has native C extension complexity.
;;;     Verdict: BLOCKED — needs ruby-msgpack and ruby-multi-json in Guix.

;;; 13. git-backdate-git (#6972)
;;;     Status: BLOCKED: NO_VERSIONED_RELEASES
;;;     Reason: Git commit backdating script (github.com/rixx/git-backdate).
;;;     No tags, no releases, single Python script.  License: WTFPL.
;;;     Approaches: A1: Pin to commit — no version stability guarantees.
;;;     A2: trivial-build-system — simple install but WTFPL license acceptance
;;;     in Guix should be verified (FSF considers it free but not copyleft).
;;;     A3: Fork with version tag — maintenance burden.
;;;     Verdict: BLOCKED — no versioned releases; needs version pinning strategy.

;;; 14. doublecmd-admin (#6793)
;;;     Status: BLOCKED: SECURITY_ANTIPATTERN
;;;     Reason: Polkit wrapper to run Double Commander as root.
;;;     Approaches: A1: copy-build-system — trivially packageable as shell
;;;     script + polkit policy + desktop file.
;;;     A2: Integrate with doublecmd package — adds root execution path.
;;;     A3: Skip — running file managers as root is a well-known security
;;;     anti-pattern; Guix system design discourages privilege escalation
;;;     for GUI applications.
;;;     Verdict: BLOCKED — security anti-pattern; packaging a root-file-manager
;;;     wrapper contradicts Guix security principles.
