;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency-tree resolver pass --- deptree-resolver-260427r
;;; Resolves 100 BLOCKED packages from priority queue.
;;; 1 resolved (xeme-hg, plus birb dependency).
;;; 99 remain BLOCKED (intractable categories).
;;; Generated: 2026-04-27

(define-module (gaurix packages deptree-resolver-260427r)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix hg-download)
  #:use-module (guix gexp)
  #:use-module (guix build-system meson)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages pkg-config)
  #:export (birb
            xeme))

;;; ============================================================
;;; 1. birb --- GLib utility library (Pidgin ecosystem)
;;; ============================================================
;;; New dependency: required by xeme-hg.
;;; Release tarball from SourceForge (v0.7.1, 2026-03-13).
;;; Deps: glib, gio, gobject, pango --- all in upstream Guix.

(define-public birb
  (package
    (name "birb")
    (version "0.7.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "mirror://sourceforge/pidgin/birb/"
                    version "/birb-" version ".tar.xz"))
              (sha256
               (base32
                "16yi43kw8r7xl21dcp8ch9ddnrs0p8yiss4qgxsinkl7wa5mh7xc"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list "-Ddoc=false"
                   "-Dintrospection=false")))
    (native-inputs
     (list pkg-config `(,glib "bin")))
    (inputs
     (list glib pango))
    (home-page "https://keep.imfreedom.org/birb/birb/")
    (synopsis "GLib-based utility library for IM applications")
    (description "Birb is a GLib-based utility library created for the Pidgin
instant messaging ecosystem.  It provides reusable components such as queued
output streams, action menus, date and time utilities, string functions,
timezone helpers, and Pango formatters that multiple projects can share.")
    (license license:lgpl2.1+)))

;;; ============================================================
;;; 2. xeme --- XMPP parsing library (resolves xeme-hg)
;;; ============================================================
;;; Previously BLOCKED: SOURCE_UNAVAILABLE (Mercurial-only repo).
;;; Source IS accessible via hg-fetch from keep.imfreedom.org.
;;; Deps: birb (packaged above), glib, gio, gobject --- all available.
;;; No tagged releases; pinned to tip changeset 764c17cc3362 (2025-11-30).

(define-public xeme
  (package
    (name "xeme")
    (version "0.1.0pre1")
    (source (origin
              (method hg-fetch)
              (uri (hg-reference
                    (url "https://keep.imfreedom.org/xeme/xeme")
                    (changeset "764c17cc3362")))
              (file-name (string-append name "-" version "-checkout"))
              (sha256
               (base32
                "1mq099zzaygplkbd4q9n627z1vg512kn0frq1is5g3nbp7xpq1pr"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list "-Ddoc=false"
                   "-Dintrospection=false")))
    (native-inputs
     (list pkg-config `(,glib "bin")))
    (inputs
     (list birb glib))
    (home-page "https://keep.imfreedom.org/xeme/xeme/")
    (synopsis "high-level XMPP parsing library based on GObjects")
    (description "Xeme is a high-level XMPP parsing library based on GObjects.
It handles marshaling and unmarshaling of XMPP data, providing developers with
high-level stanza objects rather than low-level XML.  Xeme is part of the Pidgin
instant messaging ecosystem.")
    (license license:lgpl2.1+)))
