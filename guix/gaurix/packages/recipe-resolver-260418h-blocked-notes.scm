;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Blocked notes for recipe-resolver-260418h
;;; 2 packages could not be resolved after exhausting approaches.
;;;
;;; 29. gde-creator-bin
;;;     Status: BLOCKED
;;;     Reason: NO_LICENSE
;;;     Details: The upstream repository github.com/gmzr0/gde-creator has no
;;;       LICENSE file, no license field in pyproject.toml, and no license
;;;       declaration in the README.  GitHub reports licenseInfo as null.
;;;     Approaches tried:
;;;       1. Checked GitHub repo metadata for license field -- null.
;;;       2. Read README.md and pyproject.toml -- no license declaration.
;;;       3. Checked AUR PKGBUILD -- declares MIT, but this appears to be
;;;          incorrect as no upstream evidence supports it.
;;;     Resolution: Cannot package without a clear license from upstream.
;;;       Consider opening an issue requesting license clarification.
;;;
;;; 30. rice-switcher
;;;     Status: BLOCKED
;;;     Reason: UPSTREAM_DELETED
;;;     Details: The upstream repository github.com/S1rEx1/Rice-Switcher
;;;       returns HTTP 404.  The repository has been deleted or made private.
;;;     Approaches tried:
;;;       1. Checked GitHub URL -- returns 404 Not Found.
;;;       2. Searched for forks -- no forks of the original repository found.
;;;       3. Searched for alternative repos named "rice-switcher" on GitHub --
;;;          only unrelated projects found (e.g., Kanapech/rice-switcher is a
;;;          different Fish-shell tool).
;;;     Resolution: Cannot package without source code.  Package should be
;;;       removed from tracking or revisited if upstream reappears.

(define-module (gaurix packages recipe-resolver-260418h-blocked-notes))
