;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260415q
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages from general queue.
;;; 17 confirmed as already resolved (recipes exist from prior passes);
;;; 13 marked NEEDS_RECIPE_DESIGN_EXHAUSTED (approaches documented).
;;;
;;; ALREADY_RESOLVED packages (17):
;;;   - insomnia-bin: recipe in deptree-resolver-260415i.scm
;;;   - elephant: recipe in deptree-resolver-260414q.scm (v2.21.0, Go)
;;;   - html2markdown: recipe in queue-20260402t2015z-blocked-tree-p100-w01.scm
;;;   - dasel: recipe in recipe-resolver-260413m.scm (v3.4.1, Go CLI)
;;;   - dust-git: recipe in recipe-resolver-260413u.scm (v1.2.4, Rust)
;;;   - python-opencensus: recipe in queue-20260407-deptree-resolver.scm
;;;   - elephant-files: recipe in deptree-resolver-260413n.scm (v2.21.0)
;;;   - elephant-calc: recipe in deptree-resolver-260413n.scm (v2.21.0)
;;;   - elephant-bitwarden: recipe in recipe-resolver-260413u.scm (v2.21.0)
;;;   - deezer-enhanced: recipe in general-compat.scm
;;;   - safe-rm: recipe in deptree-resolver-260413e.scm (v1.1.0, Rust)
;;;   - wl-screenrec: recipe in recipe-resolver-260413m.scm (v0.2.0, Rust)
;;;   - tailscale: recipe in recipe-resolver-260414ab.scm (Go mesh VPN)
;;;   - wayfire: recipe in deptree-resolver-260414q.scm (v0.10.1, Meson)
;;;   - xrizer-common: recipe in recipe-resolver-260413m.scm (v0.5)
;;;   - dinit-edit-git: recipe in deptree-resolver-260413l.scm (Go)
;;;   - elephant-niriactions: recipe in recipe-resolver-260413u.scm (v2.21.0)
;;;
;;; NEEDS_RECIPE_DESIGN_EXHAUSTED packages (13):
;;;   - syncthingtray: COMPLEX_DEPS — needs 3 custom Martchus libs
;;;   - waydroid: INFEASIBLE_SANDBOX — needs LXC + binder kernel module
;;;   - grub-customizer: INCOMPATIBLE_GUIX — conflicts with declarative boot
;;;   - gtk-sharp-2: MONO_UNSUPPORTED — Mono not in Guix
;;;   - chromium-gost: FULL_BROWSER_REBUILD — impractical scope
;;;   - mdcat: CARGO_100_CRATES — 100+ individually packaged crates needed
;;;   - csharpier: DOTNET_UNSUPPORTED — .NET SDK not in Guix
;;;   - qt6-base-hifps: FULL_QT6_REBUILD — single patch on 50+ dep base
;;;   - procexp: PYQT6_MISSING — PyQt6 stack not in Guix
;;;   - obexftp: MISSING_DEPS — openobex unmaintained, not in Guix
;;;   - xapp-thumbnailers-common: ECOSYSTEM_DEPS — Linux Mint xapp/cinnamon
;;;   - calculix-ccx: MISSING_SPOOLES — SPOOLES sparse solver not in Guix
;;;   - python-hatch-dynamic-versioning: SOURCE_UNAVAILABLE — AUR 404, PyPI 404
;;;
;;; This pass is a status-resolution pass: no new package definitions are
;;; created.  All 17 confirmed packages already have working recipes in
;;; the gaurix channel from prior resolver passes.  The 13 exhausted
;;; packages each have 3 materially different approaches documented in
;;; todo_general_packages.org.

(define-module (gaurix packages recipe-resolver-260415q)
  #:use-module (guix packages)
  #:use-module ((guix licenses) #:prefix license:))

;;; No new package definitions — this is a bookkeeping-only resolver pass.
;;; See header comment for resolution details.
