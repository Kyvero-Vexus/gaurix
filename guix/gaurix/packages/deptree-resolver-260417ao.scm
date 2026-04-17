;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency tree resolver pass --- deptree-resolver-260417ao
;;; Resolves 2 BLOCKED packages from dependency tree queue.
;;; 24 packages remain BLOCKED after evaluation.
;;;
;;; New recipes (2):
;;;    1. opera-gx-bin (copy-build-system, v130.0.5847.58, nonfree)
;;;    2. raidrivecli (copy-build-system, v2025.12.0, nonfree)
;;;
;;; NOTE: All sha256 hashes obtained via `guix download`.

(define-module (gaurix packages deptree-resolver-260417ao)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:export (opera-gx-bin
            raidrivecli))

;;; Nonfree license for proprietary packages
(define license:nonfree
  ((@@ (guix licenses) license) "Nonfree"
    "https://en.wikipedia.org/wiki/Proprietary_software"
    "Proprietary nonfree license"))

;;; ===================================================================
;;; 1. opera-gx-bin --- Opera GX gaming browser (pre-built binary)
;;; ===================================================================
;;; Previously BLOCKED (SOURCE_UNAVAILABLE: not found in AUR cache).
;;; Re-evaluated: Opera GX launched for Linux in March 2026.  Official
;;; .deb package available from get.opera.com.  Proprietary freeware
;;; under Opera EULA; packaged as nonfree binary.
(define-public opera-gx-bin
  (package
    (name "opera-gx-bin")
    (version "130.0.5847.58")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://get.opera.com/ftp/pub/opera_gx/"
                    version "/linux/opera-gx-stable_"
                    version "_amd64.deb"))
              (sha256
               (base32
                "05blrxh5js15sizml44h07plfwn5kfx6d2vkbl7zbzssa2d9fa84"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("usr/lib/x86_64-linux-gnu/opera-gx-stable"
                "lib/opera-gx-stable/")
                ("usr/share" "share/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-before 'install 'extract-deb
                 (lambda* (#:key inputs #:allow-other-keys)
                   (invoke "ar" "x" (assoc-ref inputs "source"))
                   (invoke "tar" "xf" "data.tar.xz"))))))
    (native-inputs
     (list binutils tar xz))
    (supported-systems '("x86_64-linux"))
    (synopsis "gaming browser with GX features by Opera")
    (description
     "Opera GX is a gaming browser built on Chromium with features
like CPU/RAM/network limiters, Twitch and Discord integrations,
custom themes, and a gaming-oriented interface.  This package
installs the prebuilt Linux x64 binary.")
    (home-page "https://www.opera.com/gx")
    (license license:nonfree)))

;;; ===================================================================
;;; 2. raidrivecli --- cloud storage CLI for mounting drives
;;; ===================================================================
;;; Previously BLOCKED (MISSING_SOURCE: not in AUR cache).
;;; Re-evaluated: RaiDrive CLI has Linux .deb packages at
;;; app.raidrive.com.  Proprietary freeware with a free tier.
;;; Supports Google Drive, OneDrive, Dropbox, S3, WebDAV, SFTP.
(define-public raidrivecli
  (package
    (name "raidrivecli")
    (version "2025.12.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://app.raidrive.com/deb/pool/main/r/raidrive/"
                    "raidrive_" version "-linux_amd64.deb"))
              (sha256
               (base32
                "005zqnpzjk8pf6dbsg06c97zawc4yy92xwxrab9aqrvfx749vm1m"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("usr/bin/raidrivecli" "bin/raidrivecli")
                ("usr/sbin/raidrived" "sbin/raidrived"))
           #:phases
           #~(modify-phases %standard-phases
               (add-before 'install 'extract-deb
                 (lambda* (#:key inputs #:allow-other-keys)
                   (invoke "ar" "x" (assoc-ref inputs "source"))
                   (invoke "tar" "xf" "data.tar.gz"))))))
    (native-inputs
     (list binutils tar gzip))
    (supported-systems '("x86_64-linux"))
    (synopsis "cloud storage CLI for mounting remote drives via FUSE")
    (description
     "RaiDrive CLI mounts cloud storage services as local drives using
FUSE.  It supports Google Drive, OneDrive, Dropbox, AWS S3, WebDAV,
SFTP, and FTP.  This package installs the prebuilt CLI and daemon.")
    (home-page "https://www.raidrive.com")
    (license license:nonfree)))
