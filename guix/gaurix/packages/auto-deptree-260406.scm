;;; Automated dependency-tree-driven packaging pass — 2026-04-06.
;;; 2 new recipes from top-100 BLOCKED priority queue:
;;;   1. xviewer — Linux Mint image viewer (Meson, GTK3)
;;;   2. radiotray-ng — Internet radio player (CMake, GTK3/GStreamer)
;;; 98 packages re-blocked with updated reason codes.

(define-module (gaurix packages auto-deptree-260406)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system cmake)
  #:use-module (guix utils)
  ;; xviewer deps
  #:use-module (gnu packages cinnamon)       ; libxapp, cinnamon-desktop
  #:use-module (gnu packages gnome)          ; libpeas, libnotify
  #:use-module (gnu packages gtk)            ; gtk+, gtk-doc
  #:use-module (gnu packages photo)          ; libexif
  #:use-module (gnu packages freedesktop)    ; exempi, libappindicator, libxdg-basedir
  #:use-module (gnu packages ghostscript)    ; lcms
  #:use-module (gnu packages image)          ; libjpeg-turbo
  #:use-module (gnu packages glib)           ; gobject-introspection, glib, glibmm-2.66
  #:use-module (gnu packages xorg)           ; libxkbfile
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages gettext)
  ;; radiotray-ng deps
  #:use-module (gnu packages boost)          ; boost
  #:use-module (gnu packages curl)           ; curl
  #:use-module (gnu packages gstreamer)      ; gst-plugins-good, gst-plugins-base
  #:use-module (gnu packages serialization)  ; jsoncpp
  #:use-module (gnu packages libbsd)         ; libbsd
  #:use-module (gnu packages wxwidgets)      ; wxwidgets
  #:use-module ((guix licenses) #:prefix license:)
  #:export (xviewer
            radiotray-ng))

;; ═══════════════════════════════════════════════════════════════════
;; GTK3 image viewer (Linux Mint / X-Apps)
;; ═══════════════════════════════════════════════════════════════════

(define-public xviewer
  (package
    (name "xviewer")
    (version "3.2.12")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/linuxmint/xviewer/archive/refs/tags/"
                    version ".tar.gz"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "15441fi8d4gcv70vc8g9d74lgyzyfnd0z8h9ir9g99whvfsiqbv2"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f   ;; no test suite in upstream
           #:glib-or-gtk? #t
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'unpack 'relax-xapp-version
                 (lambda _
                   (substitute* "meson.build"
                     (("xapp', version: '>= [0-9]+\\.[0-9]+\\.[0-9]+'")
                      "xapp', version: '>= 2.4.0'"))))
               (add-after 'unpack 'skip-post-install-scripts
                 (lambda _
                   ;; These scripts try to update icon/schema caches
                   ;; which is not appropriate in Guix builds.
                   (for-each (lambda (script)
                               (let ((path (string-append
                                            "install-scripts/" script)))
                                 (when (file-exists? path)
                                   (call-with-output-file path
                                     (lambda (port)
                                       (display "#!/usr/bin/env python3\n" port)
                                       (display "import sys; sys.exit(0)\n" port))))))
                             '("meson_update_icon_cache.py"
                               "meson_install_schemas.py")))))))
    (native-inputs
     (list `(,glib "bin")    ;; for glib-mkenums
           gobject-introspection
           itstool
           gettext-minimal
           gtk-doc
           pkg-config))
    (inputs
     (list cinnamon-desktop
           exempi
           gtk+
           lcms
           libexif
           libgnomekbd
           libjpeg-turbo
           libpeas
           librsvg
           libxapp
           libxkbfile))
    (synopsis "Simple and easy to use image viewer")
    (description
     "Xviewer is the default image viewer for the Linux Mint Cinnamon
desktop.  It supports a wide range of image formats including JPEG, PNG,
BMP, GIF, and TIFF.  It offers basic editing features like rotation and
flipping, and integrates with the X-Apps ecosystem through libxapp.")
    (home-page "https://github.com/linuxmint/xviewer")
    (license license:gpl2+)))

;; ═══════════════════════════════════════════════════════════════════
;; Internet radio player
;; ═══════════════════════════════════════════════════════════════════

(define-public radiotray-ng
  (package
    (name "radiotray-ng")
    (version "0.2.10.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ebruck/radiotray-ng/archive/refs/tags/v"
                    version ".tar.gz"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0r4n4allkw564dwc1m34b3cyy2cl9zd87wkp7552y5fc1ihzrzg3"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f   ;; tests require network access and Google Test
           #:configure-flags
           #~(list (string-append "-DCMAKE_INSTALL_PREFIX=" #$output))))
    (native-inputs
     (list pkg-config))
    (inputs
     (list boost
           curl
           glibmm-2.66
           gst-plugins-base
           gst-plugins-good
           jsoncpp
           libappindicator
           libbsd
           libnotify
           libxdg-basedir
           wxwidgets))
    (synopsis "Internet radio player for Linux")
    (description
     "RadioTray-NG is a lightweight internet radio player that sits in
the system tray.  It supports PLS, M3U, ASX, RAM, and XSPF playlists,
and uses GStreamer for audio playback.  Features include bookmarks,
media key support, and notifications.")
    (home-page "https://github.com/ebruck/radiotray-ng")
    (license license:gpl3+)))
