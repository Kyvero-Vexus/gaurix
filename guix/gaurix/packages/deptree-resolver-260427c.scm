;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency-tree resolver pass — deptree-resolver-260427c
;;; Resolves 100 BLOCKED packages from priority queue.
;;; 1 ALREADY_RESOLVED (logstash as logstash-bin), 2 new recipes, 97 remain BLOCKED.
;;; 2 new recipes created this pass (libnspire + nfuspire).
;;; Generated: 2026-04-27

(define-module (gaurix packages deptree-resolver-260427c)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix build-system gnu)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (gnu packages libusb)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages linux)
  #:export (libnspire
            nfuspire))

;;; ====================================================================
;;; PACKAGE DEFINITIONS (2 new packages)
;;; ====================================================================

;;;
;;; ── libnspire ──────────────────────────────────────────────────────────
;;; Lightweight library for communicating with TI-Nspire calculators
;;; https://github.com/Vogtinator/libnspire
;;;
(define-public libnspire
  (package
    (name "libnspire")
    (version "0.0.0-1.7d7d962")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/Vogtinator/libnspire/archive/"
             "7d7d962ca49f.tar.gz"))
       (sha256
        (base32 "1iincs9q7zm8qcj1gjrxv71988z05i0c0mfz9x9ch21b9hxyrq9b"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f))
    (native-inputs (list pkg-config))
    (propagated-inputs (list libusb))
    (home-page "https://github.com/Vogtinator/libnspire")
    (synopsis "Library for communicating with TI-Nspire calculators")
    (description
     "Libnspire is a lightweight alternative to the Nspire-specific parts
of TiLP, built with a simple API and minimal dependencies.  It provides
functions for file transfer, screenshot capture, and device management
for Texas Instruments Nspire calculators over USB.")
    (license license:lgpl3+)))

;;;
;;; ── nfuspire ───────────────────────────────────────────────────────────
;;; FUSE filesystem for TI-Nspire calculators
;;; https://github.com/EmilyCSh/nfuspire
;;;
(define-public nfuspire
  (package
    (name "nfuspire")
    (version "0.0.0-1.9d5b53e")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/EmilyCSh/nfuspire/archive/"
             "9d5b53efbbb0.tar.gz"))
       (sha256
        (base32 "0flxd0v5bwy1gmhwslr0sq9kiglrqa1cxja575dnqssgwz283zc7"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:make-flags
      #~(list (string-append "CC=" #$(cc-for-target))
              (string-append "PREFIX=" #$output))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)
          (replace 'build
            (lambda* (#:key make-flags #:allow-other-keys)
              (apply invoke "make" "nfuspire" make-flags))))))
    (native-inputs (list pkg-config))
    (inputs (list fuse libnspire))
    (home-page "https://github.com/EmilyCSh/nfuspire")
    (synopsis "FUSE filesystem for TI-Nspire calculators")
    (description
     "Nfuspire is a FUSE filesystem that allows mounting a Texas Instruments
Nspire calculator as a local directory.  It uses libnspire to communicate
with the device over USB, providing transparent file access to the
calculator's storage.")
    (license license:gpl3)))
