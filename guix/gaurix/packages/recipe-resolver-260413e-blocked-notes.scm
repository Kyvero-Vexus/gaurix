;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Blocked notes for recipe-resolver-260413e
;;; 12 packages evaluated with concrete blocking reasons.
;;; Each entry documents the primary blocker and next action.

(define-module (gaurix packages recipe-resolver-260413e-blocked-notes))

;;; ── nerd-fonts-sf-mono (#5266) ───────────────────────
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED re-evaluated in recipe-resolver-260413e
;;; Upstream: https://github.com/epk/SF-Mono-Nerd-Font
;;; Description: Apple's SF Mono font patched with Nerd Fonts glyphs
;;; License: PROPRIETARY (Apple font license prohibits redistribution)
;;; Blocker: Apple's SF Mono font license explicitly prohibits redistribution; no LICENSE file in repo; legally risky for any distribution channel.
;;; Approaches considered:
;;;   A1: Package as font-build-system — blocked by proprietary license
;;;   A2: Create download-only recipe — redistribution still violates Apple license
;;;   A3: Package only the Nerd Font patcher script — SF Mono base font not redistributable
;;; Conclusion: INFEASIBLE — proprietary license prevents packaging

;;; ── oopz (#3480) ────────────────────────────────────
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED re-evaluated in recipe-resolver-260413e
;;; Upstream: https://git.pysio.online/pysio/linux_oopz.git
;;; Description: Third-party Electron client for OOPZ voice platform
;;; License: Proprietary/unclear (self-hosted Gitea requires authentication)
;;; Blocker: Source hosted on private Gitea instance requiring authentication; Electron app; proprietary license.
;;; Approaches considered:
;;;   A1: Clone from Gitea — requires authentication, source not publicly accessible
;;;   A2: Mirror source elsewhere — license unclear, may violate terms
;;;   A3: Contact upstream for public release — niche project, unlikely to respond
;;; Conclusion: INFEASIBLE — private source hosting + unclear license

;;; ── cleanupdate-git (#5220) ─────────────────────────
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED re-evaluated in recipe-resolver-260413e
;;; Upstream: https://github.com/cubanpit/cleanupdate (NOT nicholasgasior/cleanupdate)
;;; Description: Arch Linux system update/cleanup script
;;; License: GPL-3.0-only
;;; Blocker: Arch Linux-specific tool (depends on pacman, pacman-contrib, yay/trizen); author states "moved to NixOS, no longer actively using"; not applicable to Guix.
;;; Approaches considered:
;;;   A1: Port to Guix — script is fundamentally tied to pacman/AUR ecosystem
;;;   A2: Adapt for guix gc/pull — would be a complete rewrite, not the same tool
;;;   A3: Package as-is — runtime deps (pacman) not available on Guix
;;; Conclusion: INFEASIBLE — Arch-specific, unmaintained, no Guix utility

;;; ── selectdefaultapplication-git (#4687) ─────────────
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED re-evaluated in recipe-resolver-260413e
;;; Upstream: https://github.com/sandsmark/selectdefaultapplication
;;; Description: Qt5 GUI for setting default applications on Linux
;;; License: GPL-2.0-only
;;; Blocker: Uses qmake build system (not cmake as previously noted); no tagged releases (last commit Aug 2021); would need qt5-base with qmake. Effectively abandoned.
;;; Approaches considered:
;;;   A1: Package with qmake — qmake feasible but no stable version to target, project stale 3+ years
;;;   A2: Port to cmake — excessive effort for unmaintained project
;;;   A3: Use xdg-mime or alternatives — Guix already has xdg-utils for this purpose
;;; Conclusion: EXHAUSTED — unmaintained (3+ years), no releases, better alternatives exist in Guix

;;; ── portablemc (#4834) ──────────────────────────────
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260413e
;;; Upstream: https://github.com/mindstorm38/portablemc
;;; Description: CLI Minecraft launcher (rewritten from Python to Rust in v5.x)
;;; License: Apache-2.0
;;; Blocker: Project rewritten from Python to Rust/Cargo as of v5.0.0; requires Rust edition 2024 (rust-version 1.88.0) which is newer than Guix's current Rust; complex Cargo workspace with multiple crates.
;;; Approaches considered:
;;;   A1: cargo-build-system — needs Rust 1.88.0+, Guix Rust may be too old
;;;   A2: Package older Python version (v4.x) — would be outdated, v4.x branch unmaintained
;;;   A3: Binary release — no pre-built Linux binaries published for v5.x yet
;;; Next: revisit when Guix Rust version catches up to 1.88.0+

;;; ── ego (#4983) ─────────────────────────────────────
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260413e
;;; Upstream: https://github.com/intgr/ego
;;; Description: Run Linux desktop apps under a different local user
;;; License: MIT
;;; Blocker: Rust/Cargo with 8+ crate dependencies (clap, nix, posix-acl, xcb, etc.); requires Rust edition 2024 (rust-version 1.85.0); needs XCB libraries at runtime.
;;; Approaches considered:
;;;   A1: cargo-build-system — would need all crate deps individually packaged
;;;   A2: Pre-built binary — no binary releases published
;;;   A3: guix import crate — may produce incomplete results for non-crates.io deps
;;; Next: attempt cargo-build-system when Rust 1.85.0+ available in Guix

;;; ── embellish-git (#4936) ───────────────────────────
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260413e
;;; Upstream: https://github.com/getnf/embellish
;;; Description: GTK4/libadwaita Nerd Font installer GUI (Vala)
;;; License: GPL-3.0-or-later
;;; Blocker: Requires blueprint-compiler (not in Guix) for GTK4 Blueprint UI compilation; also needs libgee-0.8, gtksourceview-5, and Vala compiler.
;;; Approaches considered:
;;;   A1: Package blueprint-compiler first — adds dep chain (Python + GTK introspection)
;;;   A2: Pre-compile blueprints and patch build — fragile, version-dependent
;;;   A3: Use Flatpak manifest as reference — still needs blueprint-compiler
;;; Next: package blueprint-compiler first, then revisit

;;; ── emergency-alerts (#5171) ────────────────────────
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260413e
;;; Upstream: https://github.com/leolost2605/emergency-alerts (NOT JasonLG1979)
;;; Description: GTK4/libadwaita emergency alert app (Vala)
;;; License: GPL-3.0-only
;;; Blocker: Requires shumate-1.0 (map library, not in Guix), granite-7 (elementary OS library, not in Guix), libportal, and Vala compiler. Heavy GTK4 ecosystem deps.
;;; Approaches considered:
;;;   A1: Package missing deps (shumate, granite-7) — significant dep chain work
;;;   A2: Find alternative with fewer deps — no equivalent exists
;;;   A3: Flatpak reference — still needs missing libraries
;;; Next: package libshumate and granite-7 first, then revisit

;;; ── plann (#5417) ───────────────────────────────────
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260413e
;;; Upstream: https://github.com/tobixen/plann
;;; Description: Command-line CalDAV client and planner
;;; License: GPL-3.0-or-later
;;; Blocker: Requires poetry-dynamic-versioning build backend (not in Guix) and python-caldav runtime dep (not in Guix). python-caldav itself has a chain of deps.
;;; Approaches considered:
;;;   A1: pyproject-build-system with poetry-core — poetry-dynamic-versioning needed for version injection
;;;   A2: Patch out dynamic versioning — feasible but needs python-caldav packaged first
;;;   A3: Use setup.cfg fallback — project uses poetry exclusively
;;; Next: package python-caldav and poetry-dynamic-versioning first

;;; ── vaping (#4323) ──────────────────────────────────
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260413e
;;; Upstream: https://github.com/20c/vaping
;;; Description: Network probing daemon (SmokePing alternative)
;;; License: Apache-2.0
;;; Blocker: Multiple missing Python deps: pluginmgr, munge, confu (all from 20c ecosystem, not in Guix); also needs pid and python-daemon packages.
;;; Approaches considered:
;;;   A1: Package all 20c ecosystem deps — 5+ packages needed (pluginmgr, munge, confu, etc.)
;;;   A2: Vendor deps — not idiomatic for Python in Guix
;;;   A3: Use PyPI wheels — Guix doesn't support wheel-only installs
;;; Next: package pluginmgr, munge, confu from 20c ecosystem first

;;; ── python-gdbgui (#5368) ───────────────────────────
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260413e
;;; Upstream: https://github.com/cs01/gdbgui
;;; Description: Browser-based frontend to GDB
;;; License: GPL-3.0-only
;;; Blocker: Requires Python >=3.13 per setup.py (Guix may not have this version yet); also needs Flask-SocketIO, Flask-Compress, pygdbmi, eventlet — some not in Guix; JS frontend pre-built but webpack/yarn build artifacts needed.
;;; Approaches considered:
;;;   A1: python-build-system with current Python — version constraint may fail
;;;   A2: Relax Python version constraint with patch — risky, may have actual 3.13 deps
;;;   A3: Older version with lower Python req — would need to find compatible version
;;; Next: check if Guix Python version satisfies >=3.13 requirement

;;; ── nodejs-http-server (#3438) ──────────────────────
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260413e
;;; Upstream: https://github.com/http-party/http-server (npm: http-server)
;;; Description: Simple zero-configuration command-line HTTP server
;;; License: MIT
;;; Blocker: npm package with transitive dependency tree; node-build-system in Guix requires individual packaging of each npm dep; limited utility as `python3 -m http.server` provides equivalent functionality.
;;; Approaches considered:
;;;   A1: node-build-system — need to enumerate and package all npm deps
;;;   A2: Bundle node_modules — not idiomatic for Guix
;;;   A3: Suggest python3 http.server as alternative — already available in Guix
;;; Next: low priority given built-in Python alternative; revisit if specific node features needed
