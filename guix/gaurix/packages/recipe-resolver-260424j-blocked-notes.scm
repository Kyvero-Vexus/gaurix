;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Blocked notes for recipe-resolver-260424j
;;; 5 packages could not be resolved in this pass.

(define-module (gaurix packages recipe-resolver-260424j-blocked-notes))

;;; faenza-cupertino-icon-theme (21477)
;;; BLOCKED: NEEDS_RECIPE_DESIGN: MISSING_DEP: depends on faenza-icon-theme
;;; which is not available in Guix or Gaurix channel.
;;; A1: Package faenza-icon-theme first — large icon theme with complex install scripts.
;;; A2: Use standalone install without base theme — icons reference base theme assets.
;;; A3: Recommend alternative icon themes already in Guix (e.g., papirus, hicolor).

;;; faba-mono-icons-git (21538)
;;; BLOCKED: NEEDS_RECIPE_DESIGN: MISSING_DEP: depends on faba-icon-theme
;;; which is not available in Guix or Gaurix channel.
;;; A1: Package faba-icon-theme first — part of Moka icon theme project.
;;; A2: Install mono icons without base theme — may work for panel use.
;;; A3: Recommend alternative monochrome icon themes already in Guix.

;;; python-pocketsphinx (21481)
;;; BLOCKED: NEEDS_RECIPE_DESIGN: COMPLEX_BUILD: requires scikit-build-core,
;;; cmake, cython, and custom C library compilation.  The scikit-build-core
;;; dependency chain is not well-established in Guix.
;;; A1: Build with scikit-build-core — needs packaging scikit-build-core first.
;;; A2: Use pre-built wheel — wheels contain platform-specific C extensions.
;;; A3: Build C library separately and link — requires deep build system knowledge.

;;; grive (19300)
;;; BLOCKED: NEEDS_RECIPE_DESIGN: COMPLEX_DEPS: requires yajl (Yet Another
;;; JSON Library) and json-c which may not be in Guix, plus boost.
;;; A1: Package yajl first, then grive — yajl is unmaintained upstream.
;;; A2: Use json-c instead of yajl — requires patching grive source.
;;; A3: Use alternative Google Drive clients already available.

;;; gtk-theme-config (21782)
;;; BLOCKED: NEEDS_RECIPE_DESIGN: COMPLEX_DEPS: requires gconf (deprecated
;;; GNOME configuration system) and Vala compiler.  GConf is not well-supported
;;; in modern Guix and the project appears unmaintained.
;;; A1: Build with gconf from Guix — gconf is deprecated and may cause issues.
;;; A2: Patch to use gsettings instead of gconf — significant code changes.
;;; A3: Skip — tool is obsolete for modern GTK3/4 environments.
