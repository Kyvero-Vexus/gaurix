;;; Round-22 worker-03 NEEDS_RECIPE_DESIGN pass #30d.
;;; 7 new recipes: 3 binary (rockhopper-bin, tinct-bin, onscripter-yuri-bin),
;;; 1 Python (python-automx2),
;;; 1 GNOME extension (gnome-shell-extension-all-in-one-clipboard-bin),
;;; 1 Makefile/shell (eve-ng-integration),
;;; 1 C/autotools library (libtar-twrp-git).
;;; 23 re-blocked with specific reasons.

(define-module (gaurix packages queue-20260406-nrd30d)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system pyproject)
  ;; eve-ng-integration deps
  #:use-module (gnu packages freedesktop)
  ;; libtar-twrp deps
  #:use-module (gnu packages compression)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages selinux)
  ;; python-automx2 deps
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages bash)
  #:use-module ((guix licenses) #:prefix license:)
  #:export (rockhopper-bin
            tinct-bin
            onscripter-yuri-bin
            gnome-shell-extension-all-in-one-clipboard-bin
            python-automx2
            eve-ng-integration
            libtar-twrp-git))

;; ═══════════════════════════════════════════════════════════════════
;; Binary packages (copy-build-system)
;; ═══════════════════════════════════════════════════════════════════

(define-public rockhopper-bin
  (package
    (name "rockhopper-bin")
    (version "0.0.23")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/mcandre/rockhopper/releases/download/v"
                    version "/rockhopper-x86_64-unknown-linux-musl.tgz"))
              (sha256
               (base32
                "0kjg0b2mzjy41zvq5n1zqn49jwdvd66fkmrhmng202fmy54xhxnz"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("rockhopper" "bin/rockhopper"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "metapackage generator for system package managers")
    (description "Rockhopper generates metapackages that bundle groups of
other packages together.  It supports multiple package manager formats
including APT, Homebrew, and others.")
    (home-page "https://github.com/mcandre/rockhopper")
    (license license:bsd-2)))

(define-public tinct-bin
  (package
    (name "tinct-bin")
    (version "0.2.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/jmylchreest/tinct/releases/download/v"
                    version "/tinct_" version "_Linux_x86_64.tar.gz"))
              (sha256
               (base32
                "1882a70iyfgyg47y85nccbwgizgv1v85nawpr84ns4mjv6hypw5i"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("tinct" "bin/tinct"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "extensible color palette generator and theme manager")
    (description "Tinct is a color palette generator and theme manager that
generates palettes from images, AI, or remote themes and applies them
uniformly to 25+ applications.  It supports plugins for various editors
and notification systems.")
    (home-page "https://github.com/jmylchreest/tinct")
    (license license:expat)))

(define-public onscripter-yuri-bin
  (package
    (name "onscripter-yuri-bin")
    (version "0.7.6")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/YuriSizuku/OnscripterYuri/releases/download/v"
                    version "/onsyuri_v" version "_x64_linux"))
              (sha256
               (base32
                "1bqjh32nz4fzdd76dsr292vy4p1gqi2n8r4f28l4hnwrg43rxfbv"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("onsyuri" "bin/onsyuri"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (mkdir-p "src")
                   (copy-file source "src/onsyuri")
                   (chmod "src/onsyuri" #o755)
                   (chdir "src"))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "enhanced ONScripter visual novel engine")
    (description "ONScripter-Yuri is an enhanced port of ONScripter, a visual
novel engine compatible with NScripter scripts.  It supports multiple
platforms and provides improvements over the original ONScripter engine
for running visual novel games.")
    (home-page "https://github.com/YuriSizuku/OnscripterYuri")
    (license license:gpl2)))

;; ═══════════════════════════════════════════════════════════════════
;; GNOME Shell extension
;; ═══════════════════════════════════════════════════════════════════

(define-public gnome-shell-extension-all-in-one-clipboard-bin
  (package
    (name "gnome-shell-extension-all-in-one-clipboard-bin")
    (version "20")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/NiffirgkcaJ/all-in-one-clipboard/"
                    "releases/download/v" version
                    "/all-in-one-clipboard%40NiffirgkcaJ.github.com.zip"))
              (file-name (string-append name "-" version ".zip"))
              (sha256
               (base32
                "1739hlmrx1aw67an16202dsp89pdnbshzii0b2lfahnbm1fa2z5y"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/gnome-shell/extensions/all-in-one-clipboard@NiffirgkcaJ.github.com/"))))
    (synopsis "integrated clipboard manager for GNOME Shell")
    (description "All-in-One Clipboard is a GNOME Shell extension that
provides an integrated clipboard manager with history, search, and pinning
features.  It sits in the system tray and gives quick access to clipboard
history.")
    (home-page "https://github.com/NiffirgkcaJ/all-in-one-clipboard")
    (license license:gpl3+)))

;; ═══════════════════════════════════════════════════════════════════
;; Python packages
;; ═══════════════════════════════════════════════════════════════════

(define-public python-automx2
  (package
    (name "python-automx2")
    (version "2026.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/rseichter/automx2")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "019dlix8xxxys5ps6aqa2q44487jci1ksbj12va8cvflvhk7b2wb"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))  ;; tests require running LDAP server
    (propagated-inputs (list python-flask python-flask-migrate
                             python-flask-sqlalchemy python-ldap3))
    (native-inputs (list python-setuptools))
    (synopsis "mail User Agent auto-configuration service")
    (description "automx2 provides mail client auto-configuration via
the protocols used by Apple (mobileconfig), Microsoft (autodiscover),
and Mozilla (autoconfig).  Mail clients can automatically discover
server settings when users set up their email accounts.")
    (home-page "https://github.com/rseichter/automx2")
    (license license:gpl3+)))

;; ═══════════════════════════════════════════════════════════════════
;; Shell / Makefile packages
;; ═══════════════════════════════════════════════════════════════════

(define-public eve-ng-integration
  (package
    (name "eve-ng-integration")
    (version "0.6.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/SmartFinn/eve-ng-integration/"
                    "archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32
                "1z271agqnvxv3jmasi7b8im4243824lbgx2zidsar515my5aqccn"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "DESTDIR=" #$output)
                   "PREFIX=/")
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)
               (delete 'build))))
    (inputs (list desktop-file-utils))
    (synopsis "integrate EVE-NG network emulator with the Linux desktop")
    (description "eve-ng-integration provides URL scheme handlers for
@code{telnet://}, @code{capture://}, @code{docker://} and @file{.rdp} file
handling, integrating the EVE-NG (UNetLab) network emulator with the
Linux desktop environment.")
    (home-page "https://github.com/SmartFinn/eve-ng-integration")
    (license license:expat)))

;; ═══════════════════════════════════════════════════════════════════
;; C library (autotools)
;; ═══════════════════════════════════════════════════════════════════

(define-public libtar-twrp-git
  (package
    (name "libtar-twrp-git")
    (version "0.0.0-1.1333a38")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/simon816/libtar-twrp")
                    (commit "1333a3869e0a12cf02d021331c3090920324c459")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0dgjy3y0304yx53n5n1ingwmv463m6z65c18c69ygr12g3vr7glh"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f  ;; no test suite
           #:phases
           #~(modify-phases %standard-phases
               (replace 'bootstrap
                 (lambda _
                   (invoke "autoreconf" "-fi"))))))
    (native-inputs (list autoconf automake libtool))
    (inputs (list zlib libselinux))
    (synopsis "C library for manipulating POSIX tar files with TWRP support")
    (description "libtar-twrp is a fork of libtar that adds support for the
TWRP (Team Win Recovery Project) backup format.  It provides a C library for
reading and writing POSIX-compliant tar archives, extended with TWRP-specific
features for Android device backup and recovery.")
    (home-page "https://github.com/simon816/libtar-twrp")
    (license license:bsd-3)))
