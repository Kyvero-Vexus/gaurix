;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Dep-tree resolver pass --- deptree-resolver-260424u
;;; Resolves 98 BLOCKED packages via dependency-tree priority.
;;;
;;; New recipes (11): liboqs, oqs-provider, libcanlock, slrn-canlock,
;;;   better-control, erwise, gtk-theme-config, slxfig-snapshot,
;;;   d2vsource, pulseeffects-legacy, vinyl-theme
;;; (liboqs, libcanlock are new dependency packages)
;;; Already in Guix: 3 (gcc8, boost1.86-libs, boost183-libs)
;;; Remaining BLOCKED: 86 packages (see blocked-notes)

(define-module (gaurix packages deptree-resolver-260424u)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system copy)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages boost)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gstreamer)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages kde-frameworks)
  #:use-module (gnu packages kde-plasma)
  #:use-module (gnu packages mp3)
  #:use-module (gnu packages music)
  #:use-module (gnu packages ninja)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages slang)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages video)
  #:use-module (gnu packages xorg)
  #:export (liboqs
            oqs-provider
            libcanlock-usenet
            slrn-canlock
            better-control
            erwise
            gtk-theme-config
            slxfig-snapshot
            d2vsource
            pulseeffects-legacy
            vinyl-theme))


;;; ---- 1. liboqs ----
;;; Open Quantum Safe library for post-quantum cryptography.
;;; Source: https://github.com/open-quantum-safe/liboqs
;;; License: MIT

(define-public liboqs
  (package
    (name "liboqs")
    (version "0.15.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/open-quantum-safe/liboqs/archive/refs/tags/"
             version ".tar.gz"))
       (sha256
        (base32 "0p2bd0b356smj3dzpp7c9jl48kc9hkb6y3h4davpzws72b6zg0rr"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f  ;; tests require test vectors download
           #:configure-flags
           #~(list "-DBUILD_SHARED_LIBS=ON"
                   "-DOQS_BUILD_ONLY_LIB=ON")))
    (native-inputs (list pkg-config))
    (synopsis "Post-quantum cryptography library")
    (description
     "liboqs is an open source C library for quantum-safe cryptographic
algorithms.  It provides implementations of post-quantum key encapsulation
mechanisms (KEMs) and digital signature schemes, including those selected
by NIST for standardization.")
    (home-page "https://openquantumsafe.org/")
    (license license:expat)))


;;; ---- 2. oqs-provider ----
;;; OpenSSL 3 provider for post-quantum cryptography via liboqs.
;;; Source: https://github.com/open-quantum-safe/oqs-provider
;;; License: MIT

(define-public oqs-provider
  (package
    (name "oqs-provider")
    (version "0.11.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/open-quantum-safe/oqs-provider/archive/refs/tags/"
             version ".tar.gz"))
       (sha256
        (base32 "0b1304lazj681x72vmx6c986pj07dx3y7kjg7p0wjbq4hk0pbdh8"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f  ;; tests require OpenSSL test infrastructure setup
           #:configure-flags
           #~(list (string-append "-Dliboqs_DIR="
                                  #$(this-package-input "liboqs")
                                  "/lib/cmake/liboqs"))))
    (inputs (list liboqs openssl))
    (native-inputs (list pkg-config))
    (synopsis "OpenSSL 3 provider for post-quantum cryptography")
    (description
     "oqs-provider is an OpenSSL 3 provider that integrates post-quantum
cryptographic algorithms from liboqs into OpenSSL.  It enables TLS 1.3
connections using quantum-safe key exchange and authentication algorithms.")
    (home-page "https://openquantumsafe.org/")
    (license license:expat)))


;;; ---- 3. libcanlock ----
;;; Cancel-Lock implementation for Usenet (RFC 8315).
;;; Source: https://micha.freeshell.org/libcanlock/
;;; License: MIT

(define-public libcanlock-usenet
  (package
    (name "libcanlock")
    (version "3.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://micha.freeshell.org/libcanlock/src/libcanlock-"
             version ".tar.bz2"))
       (sha256
        (base32 "1nc1x01vz2h6lyxpkh0wqb0gwqp8ygvpq4w7g18aiwpxw5cnvkas"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #t))
    (synopsis "Cancel-Lock and Cancel-Key implementation for Usenet")
    (description
     "libcanlock is a library implementing the Cancel-Lock and Cancel-Key
mechanisms defined in RFC 8315 for Usenet news articles.  It provides
routines to generate and verify cancel locks, preventing unauthorized
article cancellation.")
    (home-page "https://micha.freeshell.org/libcanlock/")
    (license license:expat)))


;;; ---- 4. slrn-canlock ----
;;; NNTP newsreader with cancel-lock support (development snapshot).
;;; Source: https://jedsoft.org/snapshots/
;;; License: GPL-2.0+

(define-public slrn-canlock
  (package
    (name "slrn-canlock")
    (version "1.0.4.9")
    (source
     (origin
       (method url-fetch)
       (uri "https://jedsoft.org/snapshots/slrn-pre1.0.4-9.tar.gz")
       (sha256
        (base32 "1y6gy4jjl1phyryj13hypvbd0cm9jnabjxm38lp4jn66572h2zc2"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f  ;; no test suite
           #:configure-flags
           #~(list (string-append "--with-slang="
                                  #$(this-package-input "slang"))
                   "--with-ssl"
                   "--enable-canlock")))
    (inputs (list slang openssl libcanlock-usenet))
    (native-inputs (list pkg-config))
    (synopsis "NNTP newsreader with cancel-lock support")
    (description
     "slrn is a text-based STRSTRSTR news reader.  This development snapshot adds
cancel-lock support per RFC 8315, allowing users to prove authorship of
articles when issuing cancel or supersede requests.  It supports threading,
scoring, MIME, and SSL/TLS connections.")
    (home-page "https://jedsoft.org/slrn/")
    (license license:gpl2+)))


;;; ---- 5. better-control ----
;;; Quick settings panel for Linux desktops.
;;; Source: https://github.com/better-ecosystem/better-control
;;; License: GPL-3.0

(define-public better-control
  (package
    (name "better-control")
    (version "6.12.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/better-ecosystem/better-control/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "1dawjgyj7y22qg98k0wpxiawxm9x2ssgnckppjks6hdqpvgm6gb3"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("src/" "share/better-control/src/")
               ("data/" "share/better-control/data/")
               ("better-control" "bin/better-control"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'wrap-program
                 (lambda* (#:key inputs outputs #:allow-other-keys)
                   (let ((out (assoc-ref outputs "out")))
                     (wrap-program (string-append out "/bin/better-control")
                       `("GUIX_PYTHONPATH" prefix
                         (,(getenv "GUIX_PYTHONPATH")))
                       `("GI_TYPELIB_PATH" prefix
                         (,(getenv "GI_TYPELIB_PATH"))))))))))
    (inputs (list python
                  python-pygobject
                  python-dbus
                  python-psutil
                  python-qrcode
                  python-pydbus
                  python-setproctitle
                  python-requests
                  python-pillow
                  gtk+
                  brightnessctl
                  power-profiles-daemon))
    (synopsis "Quick settings panel for Linux desktops")
    (description
     "Better Control provides a unified quick settings panel for Linux desktop
environments.  It offers controls for display brightness, audio, Bluetooth,
Wi-Fi, and power profiles through a GTK3 interface, similar to the quick
settings panels found in mobile operating systems.")
    (home-page "https://github.com/better-ecosystem/better-control")
    (license license:gpl3)))


;;; ---- 6. erwise ----
;;; One of the first graphical web browsers (1992, historical).
;;; Source: https://ftp.funet.fi/pub/networking/services/www/erwisE/
;;; License: Public domain (historical academic software)

(define-public erwise
  (package
    (name "erwise")
    (version "0.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://ftp.funet.fi/pub/networking/services/www/erwisE/erwise-"
             version ".tar.Z"))
       (sha256
        (base32 "14b2d09wkyiigxh48j067rgz3ikl935gg5aqx65vn42nb0vdvn9h"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f  ;; no test suite (1992 software)
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)  ;; no configure script
               (replace 'build
                 (lambda* (#:key inputs #:allow-other-keys)
                   (invoke "make"
                           (string-append "MOTIFDIR="
                                          (assoc-ref inputs "motif"))
                           (string-append "X11DIR="
                                          (assoc-ref inputs "libx11")))))
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((bin (string-append (assoc-ref outputs "out") "/bin")))
                     (mkdir-p bin)
                     (when (file-exists? "erwise")
                       (install-file "erwise" bin))))))))
    (inputs (list motif libx11 libxmu libxext libxt))
    (synopsis "Historical graphical web browser from 1992")
    (description
     "Erwise is one of the first graphical web browsers, developed in 1992 at
Helsinki University of Technology.  It was written for the X Window System
using the Motif toolkit.  This package preserves a piece of web history;
the browser predates Mosaic and can display basic HTML documents.")
    (home-page "https://www.w3.org/People/Berners-Lee/WorldWideWeb.html")
    (license license:public-domain)))


;;; ---- 7. gtk-theme-config ----
;;; GTK theme configuration tool.
;;; Source: https://github.com/satya164/gtk-theme-config
;;; License: GPL-3.0

(define-public gtk-theme-config
  (package
    (name "gtk-theme-config")
    (version "1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/satya164/gtk-theme-config/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0j44xbyv0n9d8wrczc71bq4hv46p4c7rxg8d2a6icrirlhzaqjhp"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f  ;; no test suite
           #:make-flags
           #~(list (string-append "PREFIX=" #$output))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))  ;; uses plain Makefile
    (inputs (list gtk+ gconf gsettings-desktop-schemas
                  hicolor-icon-theme))
    (native-inputs (list vala pkg-config))
    (synopsis "GTK theme configuration utility")
    (description
     "GTK Theme Config is a tool for changing GTK theme colors.  It allows
modifying selected, background, and text colors of the current GTK theme
through a graphical interface, with the ability to preview changes before
applying them.")
    (home-page "https://github.com/satya164/gtk-theme-config")
    (license license:gpl3)))


;;; ---- 8. slxfig-snapshot ----
;;; Xfig-style plotting for S-Lang.
;;; Source: https://jedsoft.org/snapshots/
;;; License: GPL-2.0+

(define-public slxfig-snapshot
  (package
    (name "slxfig-snapshot")
    (version "0.2.0.138")
    (source
     (origin
       (method url-fetch)
       (uri "https://jedsoft.org/snapshots/slxfig-pre0.2.0-138.tar.gz")
       (sha256
        (base32 "1wghx85m300jprcsg5figggppqyly8s9jcghkihzc7lnnmz4a83q"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f  ;; no test suite
           #:configure-flags
           #~(list (string-append "--with-slang="
                                  #$(this-package-input "slang")))))
    (inputs (list slang))
    (native-inputs (list pkg-config))
    (synopsis "Xfig-style plotting library for S-Lang")
    (description
     "SLxfig is a plotting package for the S-Lang scripting language that
produces publication-quality figures.  It provides a programmatic interface
for creating vector graphics, including plots, diagrams, and technical
illustrations, with output to formats like PostScript and PDF.")
    (home-page "https://jedsoft.org/fun/slxfig/")
    (license license:gpl2+)))


;;; ---- 9. d2vsource ----
;;; VapourSynth plugin for D2V index file reading.
;;; Source: https://github.com/dwbuiten/d2vsource
;;; License: LGPL-2.1+

(define-public d2vsource
  (package
    (name "d2vsource")
    (version "1.4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/dwbuiten/d2vsource/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "1mcz7qbbspkm6csnvb0c6gg3ip87q41nszf1lhlymszjfm42nzxm"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f  ;; no test suite
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)  ;; uses plain Makefile
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((lib (string-append (assoc-ref outputs "out")
                                             "/lib/vapoursynth")))
                     (mkdir-p lib)
                     (for-each (lambda (f) (install-file f lib))
                               (find-files "." "\\.so$"))))))))
    (inputs (list vapoursynth ffmpeg))
    (native-inputs (list pkg-config))
    (synopsis "VapourSynth plugin for D2V index files")
    (description
     "d2vsource is a VapourSynth plugin that reads D2V index files created by
DGIndex or D2VWitch.  It provides frame-accurate MPEG-1/2 decoding for
video processing workflows using VapourSynth's scripting interface.")
    (home-page "https://github.com/dwbuiten/d2vsource")
    (license license:lgpl2.1+)))


;;; ---- 10. pulseeffects-legacy ----
;;; Audio effects for PulseAudio (legacy version).
;;; Source: https://github.com/wwmm/pulseeffects
;;; License: GPL-3.0+

(define-public pulseeffects-legacy
  (package
    (name "pulseeffects-legacy")
    (version "4.8.7")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/wwmm/pulseeffects/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "16c0g91r15gkh5xbbz08k4v2450k5pk8ssxy95rp96bvz1yz4hfq"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))  ;; no test suite
    (inputs (list boost
                  glibmm
                  gstreamer
                  gst-plugins-base
                  gst-plugins-bad
                  gst-plugins-good
                  gtkmm
                  libebur128
                  pulseaudio
                  libsamplerate
                  libsndfile
                  lilv
                  zita-convolver
                  rnnoise))
    (native-inputs (list pkg-config
                         `(,glib "bin")))  ;; for glib-compile-schemas
    (synopsis "Audio effects for PulseAudio applications")
    (description
     "PulseEffects (legacy) provides audio effects for PulseAudio applications.
It includes equalizer, compressor, reverb, limiter, and other audio
processing capabilities accessible through a GTK interface.  This is the
final PulseAudio-based release; the successor EasyEffects requires
PipeWire.")
    (home-page "https://github.com/wwmm/pulseeffects")
    (license license:gpl3+)))


;;; ---- 11. vinyl-theme ----
;;; KDE Plasma 6 theme.
;;; Source: https://github.com/ekaaty/vinyl-theme
;;; License: GPL-2.0+

(define-public vinyl-theme
  (package
    (name "vinyl-theme")
    (version "6.5.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/ekaaty/vinyl-theme/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "064sdf8xh7ajv4yf4q9155k9q6q4ga4jkb95w6y52kybmhhxn41n"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f  ;; no test suite
           #:configure-flags
           #~(list "-DBUILD_TESTING=OFF")))
    (inputs (list frameworkintegration
                  kcmutils
                  kcolorscheme
                  kconfig
                  kcoreaddons
                  kdecoration
                  kguiaddons
                  kiconthemes
                  kirigami
                  kwindowsystem
                  libplasma
                  qtdeclarative))
    (native-inputs (list extra-cmake-modules pkg-config))
    (synopsis "KDE Plasma 6 desktop theme")
    (description
     "Vinyl is a desktop theme for KDE Plasma 6 that provides a cohesive visual
experience including window decorations, color schemes, and Plasma style
components.  It offers a modern, flat appearance with customizable accent
colors.")
    (home-page "https://github.com/ekaaty/vinyl-theme")
    (license license:gpl2+)))
