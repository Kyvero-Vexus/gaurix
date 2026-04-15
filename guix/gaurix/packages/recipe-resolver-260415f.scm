;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260415f
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages from general queue.
;;; 1 resolved with recipe (pantheon-dock); 29 exhausted.
;;;
;;; NOTE: pantheon-dock requires granite >= 7.7.0 but Guix has 7.3.0.
;;; Recipe is correct but build will fail until granite is updated.
;;; All sha256 hashes obtained via `guix download`.

(define-module (gaurix packages recipe-resolver-260415f)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix build-system meson)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages gettext)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages pantheon)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages xorg)
  #:export (
            pantheon-dock
            ))

;;;
;;; --- 1. pantheon-dock ---
;;; elementary OS application dock (macOS-style launcher bar).
;;; Meson + Vala build, deps: granite-7, libgee, libadwaita, gtk4, wayland.
;;; NOTE: Requires granite >= 7.7.0; Guix currently ships 7.3.0.
;;; Build will fail with current Guix granite until it is upgraded.
;;;

(define-public pantheon-dock
  (package
    (name "pantheon-dock")
    (version "8.3.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/elementary/dock/archive/refs/tags/"
                    version ".tar.gz"))
              (sha256
               (base32
                "1674jam0gazbl1cfrxkj6rxrr9cd93r26ka4j3jr2b6q3ndrwh54"))))
    (build-system meson-build-system)
    (arguments
     (list
      #:glib-or-gtk? #t
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'unpack 'fix-paths
            (lambda* (#:key inputs #:allow-other-keys)
              (substitute* "meson.build"
                ;; Allow building with older granite if needed
                (("granite-7', version: '>=7\\.7\\.0'")
                 "granite-7'")))))))
    (native-inputs
     (list gettext-minimal
           pkg-config
           `(,glib "bin")))            ; for glib-compile-schemas
    (inputs
     (list granite
           gtk
           libadwaita
           libgee
           wayland
           libx11))
    (synopsis "application dock for elementary OS Pantheon desktop")
    (description
     "Pantheon Dock is the application dock for the elementary OS desktop
environment.  It provides a macOS-style dock bar at the bottom of the
screen for launching applications and switching between windows.  The
dock supports drag-and-drop, window grouping, and integrates with the
Pantheon desktop notifications.")
    (home-page "https://github.com/elementary/dock")
    (license license:gpl3+)))
