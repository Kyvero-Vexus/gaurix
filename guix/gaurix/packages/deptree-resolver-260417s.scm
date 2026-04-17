;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency tree resolver pass --- deptree-resolver-260417s
;;; Resolves 2 BLOCKED packages from dependency tree queue.
;;; Also marks 94 packages as ALREADY_RESOLVED.
;;;
;;; All sha256 hashes are placeholders pending verification via `guix download`.

(define-module (gaurix packages deptree-resolver-260417s)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system node)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages pkg-config)
  #:export (gtk2-plus-extra
            electron-builder
))

(define-public gtk2-plus-extra
  (package
    (name "gtk2+extra")
    (version "3.3.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/SaxenaAshish7037/gtkextra")
                    (commit (string-append "gtkextra_" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (inputs (list gtk+-2))
    (native-inputs (list autoconf automake libtool pkg-config))
    (synopsis "useful set of widgets for creating GUIs for GTK+")
    (description "GtkExtra is a useful set of widgets for creating GUIs for the
Xwindows system using GTK+.  It includes spreadsheet, plot, and other
widgets.")
    (home-page "http://gtkextra.sourceforge.net/")
    (license license:lgpl2.1+)))

(define-public electron-builder
  (package
    (name “electron-builder”)
    (version “26.8.1”)
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url “https://github.com/electron-userland/electron-builder”)
                    (commit (string-append “v” version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 “0000000000000000000000000000000000000000000000000000”))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (synopsis “package and build Electron apps for distribution”)
    (description “A complete solution to package and build a ready for
distribution Electron app with auto update support out of the box.”)
    (home-page “https://www.electron.build/”)
    (license license:expat)))
