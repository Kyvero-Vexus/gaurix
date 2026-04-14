;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260414y
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages from general queue:
;;;   - 1 recipe created (KDE diff/merge tool via cmake-build-system)
;;;   - 3 compat aliases (upstream Guix and gaurix re-exports)
;;;   - 26 marked NEEDS_RECIPE_DESIGN_EXHAUSTED with specific reasons
;;;
;;; Recipes (1):
;;;   kdiff3 v1.12.0 (cmake-build-system, KDE diff/merge tool)
;;;
;;; Compat aliases (3):
;;;   xdg-desktop-portal-minimal-git -> xdg-desktop-portal (upstream Guix)
;;;   swaystatus-git -> swaystatus (gaurix recipe-resolver-260413h)
;;;   patchy -> patchy-bin (gaurix deptree-resolver-260413d)
;;;
;;; All sha256 hashes verified via `guix download`.

(define-module (gaurix packages recipe-resolver-260414y)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system cmake)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages boost)
  #:use-module (gnu packages kde-frameworks)
  #:use-module (gnu packages freedesktop)
  #:use-module (gaurix packages recipe-resolver-260413h)
  #:use-module (gaurix packages deptree-resolver-260413d)
  #:export (kdiff3
            xdg-desktop-portal-minimal-git
            swaystatus-git
            patchy))

;;;
;;; --- 1. kdiff3 (cmake-build-system, KDE diff/merge tool) ---
;;; KDiff3 is a diff and merge program that compares two or three files
;;; or directories, showing differences line by line and character by
;;; character, with automatic merge and an integrated editor.
;;; Source: https://download.kde.org/stable/kdiff3/
;;; Resolves: #7379 kdiff3-git
;;;

(define-public kdiff3
  (package
    (name "kdiff3")
    (version "1.12.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://download.kde.org/stable/kdiff3/"
                    "kdiff3-" version ".tar.xz"))
              (sha256
               (base32
                "1mmc3dvm5d7bns792ypk841wfxfrmazjsg27xci0zmxjz1fhcfpr"))))
    (build-system cmake-build-system)
    (native-inputs (list extra-cmake-modules kdoctools))
    (inputs (list boost
                  ki18n
                  kio
                  kcrash
                  kparts
                  kiconthemes))
    (arguments
     (list #:tests? #f))  ;; no test suite
    (synopsis "file comparator and merge tool for KDE")
    (description "KDiff3 is a diff and merge program that compares or merges
two or three text input files or directories.  It shows the differences
line by line and character by character, provides automatic merge and
an integrated editor for comfortable solving of merge conflicts.")
    (home-page "https://apps.kde.org/kdiff3/")
    (license license:gpl2+)))

;;;
;;; --- 2. xdg-desktop-portal-minimal-git (compat alias) ---
;;; The AUR "xdg-desktop-portal-minimal-git" is a minimal build of
;;; xdg-desktop-portal with fewer optional dependencies.  Upstream Guix
;;; already packages xdg-desktop-portal; the minimal variant is
;;; functionally equivalent for packaging purposes.
;;; Resolves: #7382 xdg-desktop-portal-minimal-git
;;;

(define-public xdg-desktop-portal-minimal-git
  (package
    (inherit xdg-desktop-portal)
    (name "xdg-desktop-portal-minimal-git")
    (properties '((hidden? . #t)))))

;;;
;;; --- 3. swaystatus-git (compat alias) ---
;;; The AUR "swaystatus-git" tracks the git development version of
;;; swaystatus.  The gaurix channel already has swaystatus packaged
;;; from PyPI releases.
;;; Resolves: #7406 swaystatus-git
;;;

(define-public swaystatus-git
  (package
    (inherit swaystatus)
    (name "swaystatus-git")
    (properties '((hidden? . #t)))))

;;;
;;; --- 4. patchy (compat alias) ---
;;; The AUR "patchy" builds from source using bun (not in Guix).
;;; The gaurix channel already has patchy-bin (prebuilt binary).
;;; Resolves: #7402 patchy
;;;

(define-public patchy
  (package
    (inherit patchy-bin)
    (name "patchy")
    (properties '((hidden? . #t)))))
