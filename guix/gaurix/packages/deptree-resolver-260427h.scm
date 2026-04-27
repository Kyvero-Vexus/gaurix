;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency-tree resolver pass --- deptree-resolver-260427h
;;; Resolves 100 BLOCKED packages from priority queue.
;;; 1 resolved (gradience), 99 remain BLOCKED.
;;; Generated: 2026-04-27

(define-module (gaurix packages deptree-resolver-260427h)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system meson)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages gettext)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages xml)
  #:use-module (gnu packages web)
  #:export (gradience))

;;; ============================================================
;;; 1. gradience (#18644)
;;; ============================================================
;;;
;;; Gradience is a tool for customizing Libadwaita applications
;;; and the adw-gtk3 theme.  It provides a GUI to change Adwaita
;;; colors, roundness, and other appearance properties.
;;;
;;; Prior passes blocked on missing blueprint-compiler and
;;; libadwaita in Guix.  Both are now available upstream:
;;; - blueprint-compiler 0.16.0
;;; - libadwaita 1.6.0
;;; v0.4.1 uses Blueprint files in data/ui/ which are compiled
;;; to .ui by blueprint-compiler.  blueprint-compiler 0.16.0 is
;;; now available in Guix upstream.
;;;
;;; Approach: meson-build-system, wrap Python executable with
;;; GI_TYPELIB_PATH like gnome-tweaks.
;;;
;;; The project is archived (June 2024) but functionally complete.

(define-public gradience
  (package
    (name "gradience")
    (version "0.4.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/GradienceTeam/Gradience"
                    "/archive/refs/tags/0.4.1-patch1.tar.gz"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "054x9dyicdsqfwffim5m8z5sc146g6xy2h0xfpwnbsl1yp70bq00"))))
    (build-system meson-build-system)
    (arguments
     (list
      #:glib-or-gtk? #t
      #:imported-modules `((guix build python-build-system)
                           ,@%meson-build-system-modules)
      #:modules '((guix build meson-build-system)
                  ((guix build python-build-system) #:prefix python:)
                  (guix build utils))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'unpack 'skip-postinstall
            (lambda _
              (substitute* "meson.build"
                (("gtk_update_icon_cache:\\s*true")
                 "gtk_update_icon_cache: false")
                (("update_desktop_database:\\s*true")
                 "update_desktop_database: false"))))
          (add-after 'install 'wrap
            (assoc-ref python:%standard-phases 'wrap))
          (add-after 'wrap 'wrap-gi-typelib
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let ((prog (search-input-file outputs "bin/gradience")))
                (wrap-program prog
                  `("GI_TYPELIB_PATH" ":" prefix
                    (,(getenv "GI_TYPELIB_PATH")))
                  `("GUIX_PYTHONPATH" ":" prefix
                    (,(python:site-packages inputs outputs))))))))))
    (native-inputs
     (list `(,glib "bin")
           blueprint-compiler
           desktop-file-utils
           gettext-minimal
           gobject-introspection
           pkg-config))
    (inputs
     (list bash-minimal
           gtk
           libadwaita
           libsoup
           python
           python-pygobject
           python-lxml))
    (synopsis "Customize Libadwaita and GTK4 application appearance")
    (description "Gradience is a tool for customizing Libadwaita applications
and the adw-gtk3 theme.  It provides a graphical interface to change colors,
roundness, and other appearance properties of GNOME applications that use
Libadwaita or adw-gtk3.  Users can create, share, and apply color presets.")
    (home-page "https://github.com/GradienceTeam/Gradience")
    (license license:gpl3+)))
