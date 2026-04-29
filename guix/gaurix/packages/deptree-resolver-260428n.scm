;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Dependency-tree resolver pass --- deptree-resolver-260428n
;;; 100 BLOCKED evaluated, 1 resolved to DONE, 1 new dependency package.
;;; 2 new recipes total:
;;;   xapp (libxapp) → new dependency package for xviewer
;;;   xviewer → DONE (image viewer from Linux Mint X-Apps project)
;;; 99 remain BLOCKED (intractable categories confirmed).
;;;
;;; Key findings this pass:
;;; - xviewer (#21839): was BLOCKED as SOURCE_UNAVAILABLE because the
;;;   non-git package was removed from AUR. However, upstream source
;;;   (https://github.com/linuxmint/xviewer) is active and healthy.
;;;   Packaged v3.4.16 using meson-build-system. Required packaging
;;;   xapp (libxapp v3.2.2) as a dependency first, since it was not
;;;   in Guix. All other deps (cinnamon-desktop, libpeas, libexif,
;;;   lcms, exempi, librsvg) are available in upstream Guix.
;;; - xapp (libxapp v3.2.2): Linux Mint common widgets library.
;;;   Built with app_lib_only=true to avoid libgnomekbdui dependency.
;;;   Meson build, LGPL-3.0+.
;;; - All other 99 packages re-evaluated: categories stable, no new
;;;   resolution paths found. Key blockers remain: proprietary binaries,
;;;   DKMS kernel modules, distro-specific tools, MinGW cross-compilation,
;;;   multilib, abandoned upstream, non-distributable licenses.
;;;
;;; Verification: AUR cache (110883 packages) and upstream Guix checked.
;;; See deptree-resolver-260428n-blocked-notes.scm for detailed evaluation.
;;;
;;; Generated: 2026-04-28

(define-module (gaurix packages deptree-resolver-260428n)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix build-system meson)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages cinnamon)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages ghostscript)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages image)
  #:use-module (gnu packages photo)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages gettext)
  #:use-module (gnu packages python)
  #:use-module (gnu packages xml)
  #:use-module (gnu packages xorg)
  #:export (xapp xviewer))

;;; ========================================================================
;;; NEW DEPENDENCY: xapp (libxapp)
;;; ========================================================================
;;; Linux Mint X-Apps common library providing widgets and utilities
;;; shared across X-Apps (xviewer, xreader, xed, etc.).
;;; Built with app_lib_only=true to skip libgnomekbdui dependency
;;; (keyboard layout controller not needed for library consumers).

(define-public xapp
  (package
    (name "xapp")
    (version "3.2.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/linuxmint/xapp/archive/refs/tags/"
             version ".tar.gz"))
       (sha256
        (base32 "14am8k7kg2pvs9r3fiwm0qyz012hj1hv2q70av2mrwz6ad06dsnh"))))
    (build-system meson-build-system)
    (arguments
     (list
      #:configure-flags
      #~(list "-Dapp-lib-only=true"
              "-Dintrospection=true"
              "-Dvapi=true"
              "-Dstatus-notifier=false"
              "-Dmate=false"
              "-Dxfce=false"
              "-Ddocs=false"
              (string-append "-Dpy-overrides-dir="
                             #$output
                             "/lib/python3.11/site-packages/gi/overrides"))
      #:tests? #f))
    (native-inputs
     (list `(,glib "bin")
           gettext-minimal
           gobject-introspection
           pkg-config
           python
           python-pygobject
           vala))
    (inputs
     (list cairo
           dbus
           gdk-pixbuf
           glib
           gtk+
           libx11
           libxkbfile))
    (synopsis "common library for Linux Mint X-Apps")
    (description
     "Xapp provides a common set of widgets and utilities for the Linux
Mint X-Apps project.  It includes a status icon implementation, a
favorites manager, keyboard layout support, and other shared
components used across X-Apps applications like Xviewer, Xreader,
and Xed.")
    (home-page "https://github.com/linuxmint/xapp")
    (license license:lgpl3+)))

;;; ========================================================================
;;; RESOLVED: xviewer (#21839)
;;; ========================================================================
;;; Previously BLOCKED (SOURCE_UNAVAILABLE: not in AUR cache).
;;; Upstream source is active at https://github.com/linuxmint/xviewer.
;;; Simple GTK3 image viewer from Linux Mint X-Apps project, based on
;;; Eye of GNOME.  Meson build, all deps available in Guix (xapp newly
;;; packaged above).

(define-public xviewer
  (package
    (name "xviewer")
    (version "3.4.16")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/linuxmint/xviewer/archive/refs/tags/"
             version ".tar.gz"))
       (sha256
        (base32 "0rlq3mqdiaafspgin8fc3z0pyv3vm92zjw0rrrcf2b03ikc3ncj1"))))
    (build-system meson-build-system)
    (arguments
     (list
      #:configure-flags
      #~(list "-Dexempi=enabled"
              "-Dexif=enabled"
              "-Djpeg=enabled"
              "-Dlcms=enabled"
              "-Drsvg=enabled"
              "-Ddocs=false")
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'unpack 'disable-post-install-scripts
            (lambda _
              ;; These post-install scripts try to update icon caches and
              ;; GSettings schemas which Guix handles at profile time.
              (substitute* "install-scripts/meson_update_icon_cache.py"
                (("subprocess\\.call.*") "pass\n"))
              (substitute* "install-scripts/meson_install_schemas.py"
                (("subprocess\\.call.*") "pass\n")))))))
    (native-inputs
     (list `(,glib "bin")
           gettext-minimal
           gobject-introspection
           itstool
           pkg-config
           yelp-tools))
    (inputs
     (list cinnamon-desktop
           exempi
           gdk-pixbuf
           glib
           gtk+
           lcms
           libexif
           libjpeg-turbo
           libpeas
           librsvg
           libxkbfile
           xapp))
    (synopsis "simple and easy to use image viewer")
    (description
     "Xviewer is a simple image viewer for the Linux Mint desktop.  It is
part of the X-Apps project and is based on Eye of GNOME.  It supports
a wide range of image formats including JPEG, PNG, GIF, SVG, TIFF,
and RAW.  Features include EXIF metadata display, basic image
operations, and a plugin system via libpeas.")
    (home-page "https://github.com/linuxmint/xviewer")
    (license license:gpl2+)))
