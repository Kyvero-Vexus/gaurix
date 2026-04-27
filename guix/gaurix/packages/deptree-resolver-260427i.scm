;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency-tree resolver pass --- deptree-resolver-260427i
;;; Resolves 100 BLOCKED packages from priority queue.
;;; 2 resolved (illogical-impulse-pymyc-aur, system-age),
;;; 98 remain BLOCKED.
;;; Generated: 2026-04-27

(define-module (gaurix packages deptree-resolver-260427i)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix build-system cargo)
  #:use-module (guix build-system trivial)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages python-xyz)
  #:use-module (gaurix packages deptree-resolver-260427h)
  #:use-module (gaurix packages cron-c79f127f-r22-w00)
  #:use-module (gaurix packages recipe-resolver-260417af)
  #:export (illogical-impulse-pymyc-aur
            system-age))

;;; ============================================================
;;; 1. illogical-impulse-pymyc-aur (#18594)
;;; ============================================================
;;;
;;; Meta-package that pulls in Python Material You Color
;;; dependencies for the Illogical Impulse desktop configuration.
;;; All 4 AUR dependencies are now available:
;;; - gradience (resolved in deptree-resolver-260427h)
;;; - python-libsass (in Guix upstream)
;;; - python-materialyoucolor (in general-compat, from cron-c79f127f-r22-w00)
;;; - python-material-color-utilities (in general-compat, from recipe-resolver-260417af)
;;;
;;; The AUR package has no source, no URL, no build steps — it
;;; is purely a dependency bundle.  We model it as a trivial
;;; meta-package that propagates all four deps.

(define-public illogical-impulse-pymyc-aur
  (package
    (name "illogical-impulse-pymyc-aur")
    (version "1.0")
    (source #f)
    (build-system trivial-build-system)
    (arguments
     (list #:modules '((guix build utils))
           #:builder
           #~(begin
               (use-modules (guix build utils))
               (mkdir-p #$output)
               #t)))
    (propagated-inputs
     (list gradience
           python-libsass
           python-materialyoucolor
           python-material-color-utilities))
    (synopsis "Python Material You Color dependencies for Illogical Impulse")
    (description "Meta-package providing the Python Material You Color
dependencies needed by the Illogical Impulse desktop configuration.
Propagates gradience, python-libsass, python-materialyoucolor, and
python-material-color-utilities.")
    (home-page "https://github.com/end-4/dots-hyprland")
    (license license:gpl3+)))

;;; ============================================================
;;; 2. system-age (#18453)
;;; ============================================================
;;;
;;; Simple Rust CLI that displays the age of the operating
;;; system installation by reading the birth time of the root
;;; filesystem.  Uses only the chrono crate.
;;;
;;; Prior passes incorrectly classified this as relying on
;;; /var/log/pacman.log.  The actual code reads statx() birth
;;; time of "/" which works on any Linux with ext4/btrfs/xfs.
;;; The output contains hardcoded "Archlinux@" branding which
;;; is cosmetic and does not affect functionality.
;;;
;;; v1.0.0 from GitHub tag.  MIT license.
;;; cargo-build-system; single crate dep: chrono 0.4

(define-public system-age
  (package
    (name "system-age")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/canmi21/age/archive/refs/tags/v"
                    version ".tar.gz"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "04n7s6zdhb03ax9zg0m0nmgxq29znanzn700xyn4027z63nbgq7f"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/canmi21/age")
    (synopsis "Display the age of the operating system installation")
    (description "System-age is a command-line utility that displays the age
of the operating system installation by reading the birth time of the root
filesystem.  It shows elapsed time since the root directory was created,
along with the current user and kernel version.")
    (license license:expat)))
