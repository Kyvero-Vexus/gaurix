;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Dep-tree resolver pass --- deptree-resolver-260425l
;;; Resolves 100 BLOCKED packages via dependency-tree priority.
;;;
;;; New recipes (1): tilp-xdg
;;; Remaining BLOCKED: 99 packages (see blocked-notes)

(define-module (gaurix packages deptree-resolver-260425l)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system gnu)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages backup)
  #:use-module (gnu packages emulators)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages pkg-config)
  #:export (tilp-xdg))


;;; ---- 1. tilp-xdg ----
;;; AUR: tilp-xdg (#18666)
;;; TI graphing calculator link/transfer program with XDG Base Directory support.
;;; Patched variant of tilp2 with XDG config path and KDE removal.
;;; All TI calculator library dependencies (libticalcs2, libticables2,
;;; libtifiles2, libticonv) are available in upstream Guix.
;;; License: GPL-2.0-or-later

(define-public tilp-xdg
  (package
    (name "tilp-xdg")
    (version "1.18")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "mirror://sourceforge/tilp/tilp2-linux/tilp2-"
             version "/tilp2-" version ".tar.bz2"))
       (sha256
        (base32 "0isf73bjwk06baz2gm3vpdh600gqck9ca4aqxzb089dmxriv6fkv"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'unpack 'patch-sources
            (lambda _
              ;; Remove broken KDE support from configure.ac.
              ;; The KDE integration references AC_PATH_KDE which is
              ;; unavailable and causes autoreconf to fail.
              (invoke "sed" "-i"
                      ;; Replace the KDE detection block (two if-fi blocks)
                      ;; with just kde=no, up to but not including
                      ;; AM_CONDITIONAL.
                      "-e" "/AC_ARG_WITH(kde/,/AM_CONDITIONAL(USE_KDE/{/AM_CONDITIONAL/b\n/AC_ARG_WITH(kde/c\\kde=no\nd\n}"
                      "configure.ac")
              ;; Remove KDE variable references from Makefile.am.
              (invoke "sed" "-i"
                      ;; Delete the KDE_INCLUDES line entirely.
                      "-e" "/@KDE_INCLUDES@ @QT_INCLUDES@/d"
                      ;; Delete the LIB_KDECORE line.
                      "-e" "/@LIB_KDECORE@.*@KDE_LDFLAGS@/d"
                      ;; Replace the QT_LDFLAGS line with just @LIBZ@.
                      "-e" "s/.*@QT_LDFLAGS@ @X_LDFLAGS@ @LIBZ@/\t@LIBZ@/"
                      "src/Makefile.am")
              ;; Apply XDG Base Directory Specification support.
              ;; Store config in ~/.config/tilp/ instead of ~/.tilp.
              (substitute* "src/tilp_paths.h"
                (("# define INI_FILE  \"/\\.tilp\"")
                 "# define INI_FILE  \"/.config/tilp/config\""))))
          (add-after 'patch-sources 'run-autoreconf
            (lambda _
              (invoke "autoreconf" "-vif"))))))
    (native-inputs
     (list autoconf automake libtool intltool pkg-config))
    (inputs
     (list gtk+-2 libarchive libticonv libticables2 libtifiles2 libticalcs2
           zlib))
    (home-page "http://lpg.ticalc.org/prj_tilp/")
    (synopsis "TI graphing calculator link/transfer program with XDG support")
    (description "Tilp-xdg is a variant of TiLP (TI Linking Program) with support
for the XDG Base Directory Specification.  It allows transferring data between a
computer and Texas Instruments graphing calculators.  It supports direct cable
connection, virtual linking between calculator emulators, and browsing calculator
contents including programs, variables, and applications.")
    (license license:gpl2+)))
