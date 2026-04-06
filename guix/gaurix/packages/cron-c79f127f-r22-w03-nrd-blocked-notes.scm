;;; Blocked-notes for cron-c79f127f-r22-w03 NEEDS_RECIPE_DESIGN pass.
;;; 6 packages re-blocked with specific, exhaustive reasons.
(define-module (gaurix packages cron-c79f127f-r22-w03-nrd-blocked-notes)
  #:use-module (guix packages)
  #:use-module (gnu packages rust-apps)
  #:export (adwaita-dark/blocked
            kernel-alive/blocked
            fortune-mod-montypython/blocked
            find-the-command/blocked
            river-bsp-layout/blocked
            clightd/blocked))

;; ── adwaita-dark (#4205) ─────────────────────────────────────────
;; Reason: NOT_STANDALONE
;; The "Adwaita-dark" theme ships as part of gnome-themes-extra (GTK3).
;; The only standalone GitHub fork (axxapy/Adwaita-dark-gtk2) is GTK2-only,
;; unmaintained, and has no license file.
;; Attempts: (1) searched GitHub for standalone repo — found only dead fork;
;;   (2) checked gnome-themes-extra in Guix — exists and includes Adwaita-dark;
;;   (3) concluded no standalone package is meaningful.
(define-public adwaita-dark/blocked
  (package
    (inherit zoxide)
    (name "adwaita-dark")))

;; ── kernel-alive (#3357) ─────────────────────────────────────────
;; Reason: ARCH_SPECIFIC
;; Source: https://gitlab.manjaro.org/ste74/kernel-alive
;; This is a Manjaro-specific shell script that uses pacman hooks to back
;; up kernel modules before updates.  Guix handles kernel modules through
;; its own functional package management; this tool has no purpose outside
;; Arch/Manjaro.
;; Attempts: (1) reviewed source — tightly coupled to pacman hook system;
;;   (2) no generic equivalent or adaptation path exists.
(define-public kernel-alive/blocked
  (package
    (inherit zoxide)
    (name "kernel-alive")))

;; ── fortune-mod-montypython (#3867) ──────────────────────────────
;; Reason: NO_UPSTREAM_SOURCE
;; The fortune file is committed directly into the AUR PKGBUILD as an inline
;; "source" named 'montypython' — there is no upstream tarball, repository, or
;; release.  The text comes from sacred-texts.com/neu/mphg/.
;; Attempts: (1) searched GitHub/GitLab for upstream repo — none found;
;;   (2) checked AUR PKGBUILD — source is local file only;
;;   (3) could embed data inline but that's not reproducible packaging.
(define-public fortune-mod-montypython/blocked
  (package
    (inherit zoxide)
    (name "fortune-mod-montypython")))

;; ── find-the-command (#3139) ─────────────────────────────────────
;; Reason: ARCH_SPECIFIC
;; Source: https://github.com/pkasemir/find-the-command
;; This is a command-not-found hook for bash/fish/zsh that queries pacman
;; to find which package provides a missing command.  It requires pacman
;; and the Arch package database, neither of which exist in Guix.
;; Guix already provides `guix search` and `command-not-found` functionality
;; through its own mechanisms.
;; Attempts: (1) reviewed source — all search functions call pacman -Fq;
;;   (2) no adaptation path without rewriting core logic for Guix.
(define-public find-the-command/blocked
  (package
    (inherit zoxide)
    (name "find-the-command")))

;; ── river-bsp-layout (#3149) ─────────────────────────────────────
;; Reason: NO_ZIG_BUILD_SYSTEM
;; Source: https://github.com/areif-dev/river-bsp-layout
;; This is a Zig program providing BSP tiling for the River Wayland
;; compositor.  Guix does not currently have a zig-build-system and the
;; Zig compiler is not packaged.  Cross-compiling from C is not feasible
;; as the project uses Zig-specific idioms and build.zig.
;; Attempts: (1) checked Guix for zig — not available;
;;   (2) checked for pre-built binaries — none published;
;;   (3) no C/make fallback build path exists.
(define-public river-bsp-layout/blocked
  (package
    (inherit zoxide)
    (name "river-bsp-layout")))

;; ── clightd (#3023) ──────────────────────────────────────────────
;; Reason: MISSING_DEP
;; Source: https://github.com/FedeDP/Clightd
;; Clightd requires libmodule >=5.0.0, which is not packaged in Guix.
;; libmodule is a C library for writing modular daemons
;; (https://github.com/FedeDP/libmodule) that itself has no Guix recipe.
;; Packaging libmodule first would be needed, plus polkit integration.
;; Attempts: (1) checked Guix for libmodule — not found;
;;   (2) reviewed clightd cmake config — libmodule is mandatory;
;;   (3) libmodule packaging is prerequisite work for a future pass.
(define-public clightd/blocked
  (package
    (inherit zoxide)
    (name "clightd")))
