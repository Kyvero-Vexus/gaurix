;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency-tree resolver pass --- deptree-resolver-260427q
;;; Resolves 100 BLOCKED packages from priority queue.
;;; 2 resolved (emerald, plank-reloaded-docklet-picky-git).
;;; 98 remain BLOCKED (intractable categories).
;;; Generated: 2026-04-27

(define-module (gaurix packages deptree-resolver-260427q)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system meson)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages gettext)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages xorg)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages vala)
  #:use-module (gaurix packages deptree-resolver-260418p)
  #:use-module (gaurix packages recipe-resolver-260418l)
  #:export (emerald
            plank-reloaded-docklet-picky-git))

;;; ============================================================
;;; 1. emerald --- window decorator for Compiz
;;; ============================================================
;;; Previously BLOCKED: COMPLEX_DEPS (missing compiz-core).
;;; compiz-core was packaged in deptree-resolver-260418p.
;;; All other deps (libwnck, libxres, xdg-utils, hicolor-icon-theme)
;;; are in upstream Guix.

(define-public emerald
  (package
    (name "emerald")
    (version "0.8.18")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.com/compiz/emerald")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs
     (list intltool pkg-config gnu-gettext))
    (inputs
     (list compiz-core libwnck libxres xdg-utils hicolor-icon-theme))
    (home-page "https://gitlab.com/compiz/emerald/")
    (synopsis "window decorator for Compiz")
    (description "Emerald is a window decorator for the Compiz compositing
window manager.  It provides themeable window borders and title bars with
support for transparency and shadows.")
    (license license:gpl2+)))

;;; ============================================================
;;; 2. plank-reloaded-docklet-picky-git --- color picker docklet
;;; ============================================================
;;; Previously BLOCKED: COMPLEX_DEPS (missing Plank Reloaded dev libs).
;;; plank-reloaded was packaged in recipe-resolver-260418l.
;;; All build deps (gnome-common, intltool, vala, meson) are in upstream Guix.

(define-public plank-reloaded-docklet-picky-git
  (package
    (name "plank-reloaded-docklet-picky-git")
    (version "0.1.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/zquestz/picky")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs
     (list gnome-common intltool vala pkg-config))
    (inputs
     (list plank-reloaded))
    (home-page "https://github.com/zquestz/picky")
    (synopsis "color picker docklet for Plank Reloaded")
    (description "Picky is a color picker docklet for Plank Reloaded.  It
provides a convenient way to pick colors from the screen directly from the
dock.")
    (license license:gpl3+)))
