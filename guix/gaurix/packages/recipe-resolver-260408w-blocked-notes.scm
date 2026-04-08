;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Blocked notes for recipe-resolver-260408w
;;; 5 packages re-evaluated with concrete blocking reasons.

(define-module (gaurix packages recipe-resolver-260408w-blocked-notes))

;;; breeze-contrast-cursor-theme
;;; AUR: breeze-contrast-cursor-theme v1.0-3
;;; Status: BLOCKED — NO_STABLE_URL
;;; The cursor theme was hosted on opendesktop.org/pling which is
;;; currently unreachable (DNS failure).  The KDE Store does not list
;;; this theme either.  No alternative stable download URL exists.
;;; Approaches tried:
;;;   A1: opendesktop.org API download URL — DNS resolution failure
;;;   A2: store.kde.org search — theme not found
;;;   A3: GitHub/GitLab search — no mirror repository found
;;;
;;; fortune-mod-hitchhiker
;;; AUR: fortune-mod-hitchhiker v20050611-4
;;; Status: BLOCKED — MISSING_DEP (fortune-mod not packaged in Guix)
;;; Fortune cookie file from "The Hitchhiker's Guide to the Galaxy".
;;; Requires fortune-mod to be useful, which is not available in Guix.
;;; The data file itself is trivial but useless without the fortune
;;; binary.  Packaging fortune-mod first would unblock this + 2 others.
;;;
;;; fortune-mod-calvin
;;; AUR: fortune-mod-calvin v0.3-1
;;; Status: BLOCKED — MISSING_DEP (fortune-mod not packaged in Guix)
;;; Calvin & Hobbes fortune cookie data file.
;;; Same blocker as fortune-mod-hitchhiker: requires fortune-mod.
;;;
;;; fortune-mod-discworld
;;; AUR: fortune-mod-discworld v0-3
;;; Status: BLOCKED — MISSING_DEP (fortune-mod not packaged in Guix)
;;; Discworld fortune cookie data file.
;;; Same blocker as fortune-mod-hitchhiker: requires fortune-mod.
;;;
;;; data-peek-bin
;;; AUR: data-peek-bin v0.16.0-1
;;; Status: BLOCKED — PROPRIETARY_NO_STABLE_URL
;;; A minimal SQL client desktop application.  The home page
;;; (datapeek.dev) is a commercial product with no stable binary
;;; download URL that can be used for Guix packaging.  The MIT license
;;; claim in the AUR metadata is unverifiable without access to source.
;;; Approaches tried:
;;;   A1: GitHub search — no public repository found
;;;   A2: datapeek.dev — commercial product page, no direct download link
;;;   A3: AUR PKGBUILD inspection — download URL requires authentication
