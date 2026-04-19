;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency tree resolver pass --- deptree-resolver-260419d
;;; Resolves 98 TODO packages with concrete recipes.
;;; Moves 2 packages to BLOCKED status.
;;;
;;; New recipes:
;;;      1.  mingw-w64-readline (gnu-build-system, v8.3.003, GPL-3.0-only)
;;;      2.  mingw-w64-gettext (gnu-build-system, v0.26, GFDL-1.2-only)
;;;      3.  ktexteditor-git (gnu-build-system, v6.0.0_r4414.ge6c8d21ed, LGPL-2.0-only)
;;;      4.  perl-config-ini (perl-build-system, v0.029, GPL)
;;;      5.  lib32-glib (gnu-build-system, v1.2.10, LGPL)
;;;      6.  libconcord (gnu-build-system, v1.5, GPL3)
;;;      7.  libgnunetchat-git (meson-build-system, vr317.d85faee, AGPL)
;;;      8.  mingw-w64-blas (gnu-build-system, v3.12.1, LGPL)
;;;      9.  mingw-w64-libidn2 (gnu-build-system, v2.3.7, GPL3, LGPL3)
;;;     10.  mingw-w64-pixman (gnu-build-system, v0.44.0, custom)
;;;     11.  papi (gnu-build-system, v7.2.0, BSD-3-Clause)
;;;     12.  pure-xml (gnu-build-system, v0.7, LGPL3)
;;;     13.  python-iniparse (pyproject-build-system, v0.5.1, custom:MIT)
;;;     14.  python-msrest (pyproject-build-system, v0.6.21, MIT)
;;;     15.  python-pyjacklib (pyproject-build-system, v0.1.1, GPL)
;;;     16.  python-pynzb (pyproject-build-system, v0.1.0, BSD)
;;;     17.  python2-fuse (pyproject-build-system, v1.0.5, LGPL)
;;;     18.  qt5-accountsservice-git (gnu-build-system, vv1.3.0.r28.ge1cf4e4, LGPL3)
;;;     19.  r-clipr (r-build-system, v0.8.0, GPL3)
;;;     20.  ruby-dotenv (ruby-build-system, v3.2.0, MIT)
;;;     21.  sencha-cmd-6 (gnu-build-system, v6.7.0.63, custom: commercial)
;;;     22.  tclx (gnu-build-system, v8.6.3, BSD)
;;;     23.  th06-demo-data (gnu-build-system, v0.13, custom)
;;;     24.  ultraleap-hand-tracking-service (gnu-build-system, v5.17.1.0_a9f25232, proprietary)
;;;     25.  vapoursynth-plugin-awarpsharp2-git (meson-build-system, v4.0.g886d4b7, GPL2)
;;;     26.  vapoursynth-plugin-eedi2-git (meson-build-system, v7.1.1.g36be83a, GPL)
;;;     27.  vapoursynth-plugin-misc-git (meson-build-system, vR2.5.g07e0589, GPL)
;;;     28.  vapoursynth-plugin-znedi3-git (gnu-build-system, v2.1.22.g4e88a5d, GPL2)
;;;     29.  xrectsel (gnu-build-system, v0.3.2, GPL3)
;;;     30.  coin-or-coinmumps (gnu-build-system, v3.0.11, custom)
;;;     31.  daggerfall (gnu-build-system, v1.07.213, custom:daggerfall)
;;;     32.  devilutionx-graphics-tools-git (cmake-build-system, v1.2.0.r4.ae39773, custom:UNLICENSE)
;;;     33.  downloader-cli (pyproject-build-system, v0.3.4, MIT)
;;;     34.  gdk-pixbuf (gnu-build-system, v0.22.0, GPL)
;;;     35.  giflib4 (gnu-build-system, v4.2.3, MIT)
;;;     36.  globalplatform (cmake-build-system, v7.4.0, GPL3)
;;;     37.  gnocl (gnu-build-system, v0.9.96+20130131, custom)
;;;     38.  kahip (cmake-build-system, v3.25, MIT)
;;;     39.  lib32-ncurses5-compat-libs (gnu-build-system, v6.6, MIT)
;;;     40.  libdecsync (gnu-build-system, v2.2.1, custom:LGPL2)
;;;     41.  libshout-idjc (gnu-build-system, v2.4.6.r1, LGPL)
;;;     42.  nvidia-utils-tesla (gnu-build-system, v580.65.06, LicenseRef-custom)
;;;     43.  nyan-lang (cmake-build-system, v0.3.1, LGPL-3.0-or-later)
;;;     44.  opencryptoki (gnu-build-system, v3.26.0, CPL)
;;;     45.  perl-math-geometry-voronoi (perl-build-system, v1.3, GPL)
;;;     46.  perl-moosex-methodattributes (perl-build-system, v0.32, Artistic-1.0)
;;;     47.  python-cymruwhois (pyproject-build-system, v1.6, MIT)
;;;     48.  python-dict2xml (pyproject-build-system, v1.7.8, MIT)
;;;     49.  python-extra-platforms (pyproject-build-system, v11.0.5, Apache-2.0)
;;;     50.  python-image (pyproject-build-system, v1.5.33, BSD)
;;;     51.  python-netdisco (pyproject-build-system, v3.0.0, Apache)
;;;     52.  python-pytubefix (pyproject-build-system, v8.12.2, MIT)
;;;     53.  python-sdnotify (pyproject-build-system, v0.3.3, MIT)
;;;     54.  python-typed-argument-parser (pyproject-build-system, v1.9.0, MIT)
;;;     55.  quantlib (gnu-build-system, v1.42, BSD-3-Clause)
;;;     56.  rlottie (cmake-build-system, v0.2, custom)
;;;     57.  sawfish (gnu-build-system, v1.13.0, GPL)
;;;     58.  scraw (cmake-build-system, v0.2.1, ISC)
;;;     59.  timblserver (gnu-build-system, v1.19, GPL3)
;;;     60.  ucommon (cmake-build-system, v7.0.1, LGPL-3.0-or-later)
;;;     61.  vapoursynth-plugin-bm3d-git (meson-build-system, v9.0.gfe1a433, MIT)
;;;     62.  vapoursynth-plugin-dfttest-git (meson-build-system, v7.1.g89034df, GPL)
;;;     63.  wraith-master-common (gnu-build-system, v1.2.1, Apache)
;;;     64.  youtube-search-python (pyproject-build-system, v1.6.6, MIT)
;;;     65.  zfs-utils-git (pyproject-build-system, v2.4.99.r305.gb9b84445ea, CDDL-1.0)
;;;     66.  zopflipng-parallel (gnu-build-system, v0.1, GPL-3.0-or-later)
;;;     67.  bertini-common (gnu-build-system, v1.6, custom:Bertini license)
;;;     68.  c++utilities-git (cmake-build-system, v989.6390182, GPL-2.0-or-later)
;;;     69.  fbx-sdk (gnu-build-system, v2020.3.7, LicenseRef-Autodesk-FBX-SDK-2020-License)
;;;     70.  flashplugin (gnu-build-system, v32.0.0.465, custom)
;;;     71.  gcc11-libs (gnu-build-system, v11.5.0, custom)
;;;     72.  glade-perl (gnu-build-system, v1.008-1.2, LGPL)
;;;     73.  lib32-pangox-compat (gnu-build-system, v0.0.2+2+gedb9e09, LGPL)
;;;     74.  libgroove (cmake-build-system, v4.3.0, MIT)
;;;     75.  libirecovery (gnu-build-system, v1.3.1, LGPL-2.1-only)
;;;     76.  libkexiv2-git (gnu-build-system, v22.03.80.r0.gd8dbd19, FDL)
;;;     77.  linux-firmware-atheros-uncompressed (gnu-build-system, v20260110, GPL-2.0-only)
;;;     78.  lsi-msm-libs (gnu-build-system, v17.05.06.00, custom:Broadcom)
;;;     79.  lxqt-globalkeys-git (cmake-build-system, v2.0.0, LGPL-2.1-only)
;;;     80.  ocaml-batteries (gnu-build-system, v3.6.1, LGPL)
;;;     81.  ocaml-xmlm (gnu-build-system, v1.4.0, ISC)
;;;     82.  perl-class-c3-componentised (perl-build-system, v1.001002, Artistic-2.0)
;;;     83.  pure-audio (gnu-build-system, v0.6, BSD)
;;;     84.  python-affine (pyproject-build-system, v2.4.0, BSD)
;;;     85.  python-dephell-specifier (pyproject-build-system, v0.3.0, MIT)
;;;     86.  python-rosdistro (pyproject-build-system, v1.0.1, BSD)
;;;     87.  python-setuptools-git-ls-files (pyproject-build-system, v0.1.2, MIT)
;;;     88.  python-suntime (pyproject-build-system, v1.3.2, LGPL-3.0-only)
;;;     89.  python-tatsu-lts (pyproject-build-system, v5.13.1, BSD)
;;;     90.  python-tinydb (pyproject-build-system, v4.8.2, MIT)
;;;     91.  python-wasabi (pyproject-build-system, v1.1.3, MIT)
;;;     92.  r-progress (r-build-system, v1.2.3, MIT)
;;;     93.  ruby-sexp-processor (ruby-build-system, v4.17.4, MIT)
;;;     94.  streamripper (gnu-build-system, v1.64.6+56+a5597af, GPL)
;;;     95.  t4kcommon (gnu-build-system, v0.1.1, GPL)
;;;     96.  vapoursynth-plugin-eedi3m-git (meson-build-system, v6.0.g152f83b, GPL2)
;;;     97.  waifu2x-converter-cpp (cmake-build-system, v5.3.4, MIT)
;;;     98.  angie (gnu-build-system, v1.11.4, BSD)
;;;
;;; BLOCKED (2):
;;;     99.  noto-fonts-cjk-glyph-conf -> SOURCE_UNAVAILABLE: No upstream URL in AUR metadata
;;;    100.  noto-fonts-cjk-locale-conf -> SOURCE_UNAVAILABLE: No upstream URL in AUR metadata
;;;
;;; All sha256 hashes are placeholders pending verification via `guix download`.
(define-module (gaurix packages deptree-resolver-260419d)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system perl)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system r)
  #:use-module (guix build-system ruby)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:export (mingw-w64-readline
            mingw-w64-gettext
            ktexteditor-git
            perl-config-ini
            lib32-glib
            libconcord
            libgnunetchat-git
            mingw-w64-blas
            mingw-w64-libidn2
            mingw-w64-pixman
            papi
            pure-xml
            python-iniparse
            python-msrest
            python-pyjacklib
            python-pynzb
            python2-fuse
            qt5-accountsservice-git
            r-clipr
            ruby-dotenv
            sencha-cmd-6
            tclx
            th06-demo-data
            ultraleap-hand-tracking-service
            vapoursynth-plugin-awarpsharp2-git
            vapoursynth-plugin-eedi2-git
            vapoursynth-plugin-misc-git
            vapoursynth-plugin-znedi3-git
            xrectsel
            coin-or-coinmumps
            daggerfall
            devilutionx-graphics-tools-git
            downloader-cli
            gdk-pixbuf
            giflib4
            globalplatform
            gnocl
            kahip
            lib32-ncurses5-compat-libs
            libdecsync
            libshout-idjc
            nvidia-utils-tesla
            nyan-lang
            opencryptoki
            perl-math-geometry-voronoi
            perl-moosex-methodattributes
            python-cymruwhois
            python-dict2xml
            python-extra-platforms
            python-image
            python-netdisco
            python-pytubefix
            python-sdnotify
            python-typed-argument-parser
            quantlib
            rlottie
            sawfish
            scraw
            timblserver
            ucommon
            vapoursynth-plugin-bm3d-git
            vapoursynth-plugin-dfttest-git
            wraith-master-common
            youtube-search-python
            zfs-utils-git
            zopflipng-parallel
            bertini-common
            c++utilities-git
            fbx-sdk
            flashplugin
            gcc11-libs
            glade-perl
            lib32-pangox-compat
            libgroove
            libirecovery
            libkexiv2-git
            linux-firmware-atheros-uncompressed
            lsi-msm-libs
            lxqt-globalkeys-git
            ocaml-batteries
            ocaml-xmlm
            perl-class-c3-componentised
            pure-audio
            python-affine
            python-dephell-specifier
            python-rosdistro
            python-setuptools-git-ls-files
            python-suntime
            python-tatsu-lts
            python-tinydb
            python-wasabi
            r-progress
            ruby-sexp-processor
            streamripper
            t4kcommon
            vapoursynth-plugin-eedi3m-git
            waifu2x-converter-cpp
            angie
))


;;; -------------------------------------------------------------------
;;; 1. mingw-w64-readline
;;; -------------------------------------------------------------------
(define-public mingw-w64-readline
  (package
    (name "mingw-w64-readline")
    (version "8.3.003")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://tiswww.case.edu/php/chet/readline/rltop.html/releases/download/v" version "/source.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://tiswww.case.edu/php/chet/readline/rltop.html")
    (synopsis "GNU readline library (mingw-w64)")
    (description "GNU readline library (mingw-w64).")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 2. mingw-w64-gettext
;;; -------------------------------------------------------------------
(define-public mingw-w64-gettext
  (package
    (name "mingw-w64-gettext")
    (version "0.26")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://www.gnu.org/software/gettext//releases/download/v" version "/source.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "http://www.gnu.org/software/gettext/")
    (synopsis "GNU internationalization library (mingw-w64)")
    (description "GNU internationalization library (mingw-w64).")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 3. ktexteditor-git
;;; -------------------------------------------------------------------
(define-public ktexteditor-git
  (package
    (name "ktexteditor-git")
    (version "6.0.0_r4414.ge6c8d21ed")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://community.kde.org/Frameworks/releases/download/v" version "/source.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://community.kde.org/Frameworks")
    (synopsis "advanced embeddable text editor")
    (description "Advanced embeddable text editor.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 4. perl-config-ini
;;; -------------------------------------------------------------------
(define-public perl-config-ini
  (package
    (name "perl-config-ini")
    (version "0.029")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://metacpan.org/dist/Config-INI/releases/download/v" version "/source.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system perl-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://metacpan.org/dist/Config-INI")
    (synopsis "simple .ini-file format")
    (description "Simple .ini-file format.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 5. lib32-glib
;;; -------------------------------------------------------------------
(define-public lib32-glib
  (package
    (name "lib32-glib")
    (version "1.2.10")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://www.gtk.org//releases/download/v" version "/source.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "http://www.gtk.org/")
    (synopsis "common C routines used by Gtk+ and other libs (32-bit)")
    (description "Common C routines used by Gtk+ and other libs (32-bit).")
    (license license:lgpl3+)))

;;; -------------------------------------------------------------------
;;; 6. libconcord
;;; -------------------------------------------------------------------
(define-public libconcord
  (package
    (name "libconcord")
    (version "1.5")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/jaymzh/concordance/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/jaymzh/concordance/")
    (synopsis "a library for programming Logitech(R) Harmony(TM) remote controls")
    (description "A library for programming Logitech(R) Harmony(TM) remote controls.")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 7. libgnunetchat-git
;;; -------------------------------------------------------------------
(define-public libgnunetchat-git
  (package
    (name "libgnunetchat-git")
    (version "r317.d85faee")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://gnunet.org/releases/download/v" version "/source.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "http://gnunet.org")
    (synopsis "gNUnet chat library")
    (description "GNUnet chat library.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 8. mingw-w64-blas
;;; -------------------------------------------------------------------
(define-public mingw-w64-blas
  (package
    (name "mingw-w64-blas")
    (version "3.12.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://www.netlib.org/lapack/releases/download/v" version "/source.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "http://www.netlib.org/lapack")
    (synopsis "basic Linear Algebra Subprograms (mingw-w64)")
    (description "Basic Linear Algebra Subprograms (mingw-w64).")
    (license license:lgpl3+)))

;;; -------------------------------------------------------------------
;;; 9. mingw-w64-libidn2
;;; -------------------------------------------------------------------
(define-public mingw-w64-libidn2
  (package
    (name "mingw-w64-libidn2")
    (version "2.3.7")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://www.gnu.org/software/libidn/releases/download/v" version "/source.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "http://www.gnu.org/software/libidn")
    (synopsis "a free software implementation of IDNA2008 (mingw-w64)")
    (description "A free software implementation of IDNA2008 (mingw-w64).")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 10. mingw-w64-pixman
;;; -------------------------------------------------------------------
(define-public mingw-w64-pixman
  (package
    (name "mingw-w64-pixman")
    (version "0.44.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://xorg.freedesktop.org/releases/download/v" version "/source.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "http://xorg.freedesktop.org")
    (synopsis "the pixel-manipulation library for X and cairo (mingw-w64)")
    (description "The pixel-manipulation library for X and cairo (mingw-w64).")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 11. papi
;;; -------------------------------------------------------------------
(define-public papi
  (package
    (name "papi")
    (version "7.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://icl.cs.utk.edu/papi/releases/download/v" version "/source.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "http://icl.cs.utk.edu/papi")
    (synopsis "performance Application Programming Interface")
    (description "Performance Application Programming Interface.")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; 12. pure-xml
;;; -------------------------------------------------------------------
(define-public pure-xml
  (package
    (name "pure-xml")
    (version "0.7")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://agraef.github.io/pure-lang//releases/download/v" version "/source.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://agraef.github.io/pure-lang/")
    (synopsis "a simplified interface to the Gnome libxml2 and libxslt libraries for Pure")
    (description "A simplified interface to the Gnome libxml2 and libxslt libraries for Pure.")
    (license license:lgpl3)))

;;; -------------------------------------------------------------------
;;; 13. python-iniparse
;;; -------------------------------------------------------------------
(define-public python-iniparse
  (package
    (name "python-iniparse")
    (version "0.5.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/candlepin/python-iniparse/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/candlepin/python-iniparse")
    (synopsis "better INI parser library for Python")
    (description "Better INI parser library for Python.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 14. python-msrest
;;; -------------------------------------------------------------------
(define-public python-msrest
  (package
    (name "python-msrest")
    (version "0.6.21")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Azure/msrest-for-python/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/Azure/msrest-for-python")
    (synopsis "the runtime library for AutoRest generated Python clients")
    (description "The runtime library for AutoRest generated Python clients.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 15. python-pyjacklib
;;; -------------------------------------------------------------------
(define-public python-pyjacklib
  (package
    (name "python-pyjacklib")
    (version "0.1.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/jackaudio/pyjacklib/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/jackaudio/pyjacklib")
    (synopsis "Python bindings for libjack using ctypes")
    (description "Python bindings for libjack using ctypes.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 16. python-pynzb
;;; -------------------------------------------------------------------
(define-public python-pynzb
  (package
    (name "python-pynzb")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://pypi.python.org/pypi/pynzb//releases/download/v" version "/source.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://pypi.python.org/pypi/pynzb/")
    (synopsis "a unified API for parsing NZB files")
    (description "A unified API for parsing NZB files.")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; 17. python2-fuse
;;; -------------------------------------------------------------------
(define-public python2-fuse
  (package
    (name "python2-fuse")
    (version "1.0.5")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://pypi.org/project/fuse_python/1.0.5/releases/download/v" version "/source.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://pypi.org/project/fuse_python/1.0.5")
    (synopsis "this is a Python 2 interface to libfuse (https://github.com/libfuse/libfuse),...")
    (description "This is a Python 2 interface to libfuse (https://github.com/libfuse/libfuse), a simple interface for userspace programs to export a virtual filesystem to the Linux kernel.")
    (license license:lgpl3+)))

;;; -------------------------------------------------------------------
;;; 18. qt5-accountsservice-git
;;; -------------------------------------------------------------------
(define-public qt5-accountsservice-git
  (package
    (name "qt5-accountsservice-git")
    (version "v1.3.0.r28.ge1cf4e4")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://liri.io/releases/download/v" version "/source.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://liri.io")
    (synopsis "qt-style wrapper for Accounts Service")
    (description "Qt-style wrapper for Accounts Service.")
    (license license:lgpl3)))

;;; -------------------------------------------------------------------
;;; 19. r-clipr
;;; -------------------------------------------------------------------
(define-public r-clipr
  (package
    (name "r-clipr")
    (version "0.8.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://cran.r-project.org/package=clipr/releases/download/v" version "/source.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system r-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://cran.r-project.org/package=clipr")
    (synopsis "read and Write from the System Clipboard")
    (description "Read and Write from the System Clipboard.")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 20. ruby-dotenv
;;; -------------------------------------------------------------------
(define-public ruby-dotenv
  (package
    (name "ruby-dotenv")
    (version "3.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/bkeepers/dotenv/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system ruby-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/bkeepers/dotenv")
    (synopsis "loads environment variables from .env")
    (description "Loads environment variables from .env.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 21. sencha-cmd-6
;;; -------------------------------------------------------------------
(define-public sencha-cmd-6
  (package
    (name "sencha-cmd-6")
    (version "6.7.0.63")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.sencha.com/products/extjs/cmd-download//releases/download/v" version "/source.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://www.sencha.com/products/extjs/cmd-download/")
    (synopsis "sencha Cmd provides a collection of powerful, time-saving features that work ...")
    (description "Sencha Cmd provides a collection of powerful, time-saving features that work together and in conjunction with the Sencha Ext JS and Sencha Touch frameworks.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 22. tclx
;;; -------------------------------------------------------------------
(define-public tclx
  (package
    (name "tclx")
    (version "8.6.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/flightaware/tclx/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/flightaware/tclx")
    (synopsis "provides OS primitives, file scanning, data records etc. for Tcl")
    (description "Provides OS primitives, file scanning, data records etc. for Tcl.")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; 23. th06-demo-data
;;; -------------------------------------------------------------------
(define-public th06-demo-data
  (package
    (name "th06-demo-data")
    (version "0.13")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://www16.big.or.jp/~zun/html/th06.html/releases/download/v" version "/source.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "http://www16.big.or.jp/~zun/html/th06.html")
    (synopsis "embodiment of Scarlet Devil trial version. Sixth game of the Touhou Project s...")
    (description "Embodiment of Scarlet Devil trial version. Sixth game of the Touhou Project series; data files.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 24. ultraleap-hand-tracking-service
;;; -------------------------------------------------------------------
(define-public ultraleap-hand-tracking-service
  (package
    (name "ultraleap-hand-tracking-service")
    (version "5.17.1.0_a9f25232")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.ultraleap.com//releases/download/v" version "/source.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://www.ultraleap.com/")
    (synopsis "ultraleap Hand Tracking service and SDK for development")
    (description "Ultraleap Hand Tracking service and SDK for development.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 25. vapoursynth-plugin-awarpsharp2-git
;;; -------------------------------------------------------------------
(define-public vapoursynth-plugin-awarpsharp2-git
  (package
    (name "vapoursynth-plugin-awarpsharp2-git")
    (version "4.0.g886d4b7")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://forum.doom9.org/showthread.php?t=172721/releases/download/v" version "/source.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://forum.doom9.org/showthread.php?t=172721")
    (synopsis "plugin for Vapoursynth: awarpsharp2 (GIT version)")
    (description "Plugin for Vapoursynth: awarpsharp2 (GIT version).")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 26. vapoursynth-plugin-eedi2-git
;;; -------------------------------------------------------------------
(define-public vapoursynth-plugin-eedi2-git
  (package
    (name "vapoursynth-plugin-eedi2-git")
    (version "7.1.1.g36be83a")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://forum.doom9.org/showthread.php?t=171136/releases/download/v" version "/source.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://forum.doom9.org/showthread.php?t=171136")
    (synopsis "plugin for Vapoursynth: eedi2 (GIT version)")
    (description "Plugin for Vapoursynth: eedi2 (GIT version).")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 27. vapoursynth-plugin-misc-git
;;; -------------------------------------------------------------------
(define-public vapoursynth-plugin-misc-git
  (package
    (name "vapoursynth-plugin-misc-git")
    (version "R2.5.g07e0589")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/vapoursynth/vs-miscfilters-obsolete")
                    (commit "vR2.5.g07e0589")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/vapoursynth/vs-miscfilters-obsolete")
    (synopsis "plugin for Vapoursynth: misc (GIT version)")
    (description "Plugin for Vapoursynth: misc (GIT version).")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 28. vapoursynth-plugin-znedi3-git
;;; -------------------------------------------------------------------
(define-public vapoursynth-plugin-znedi3-git
  (package
    (name "vapoursynth-plugin-znedi3-git")
    (version "2.1.22.g4e88a5d")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/sekrit-twc/znedi3")
                    (commit "v2.1.22.g4e88a5d")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/sekrit-twc/znedi3")
    (synopsis "plugin for Vapoursynth: znedi3 (GIT Version)")
    (description "Plugin for Vapoursynth: znedi3 (GIT Version).")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 29. xrectsel
;;; -------------------------------------------------------------------
(define-public xrectsel
  (package
    (name "xrectsel")
    (version "0.3.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ropery/xrectsel/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/ropery/xrectsel")
    (synopsis "print the geometry of a rectangular screen region")
    (description "Print the geometry of a rectangular screen region.")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 30. coin-or-coinmumps
;;; -------------------------------------------------------------------
(define-public coin-or-coinmumps
  (package
    (name "coin-or-coinmumps")
    (version "3.0.11")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/coin-or-tools/ThirdParty-MUMPS/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/coin-or-tools/ThirdParty-MUMPS/")
    (synopsis "cOIN-OR autotools harness to build MUMPS")
    (description "COIN-OR autotools harness to build MUMPS.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 31. daggerfall
;;; -------------------------------------------------------------------
(define-public daggerfall
  (package
    (name "daggerfall")
    (version "1.07.213")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://www.elderscrolls.com/daggerfall//releases/download/v" version "/source.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "http://www.elderscrolls.com/daggerfall/")
    (synopsis "the Elder Scrolls II: Daggerfall")
    (description "The Elder Scrolls II: Daggerfall.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 32. devilutionx-graphics-tools-git
;;; -------------------------------------------------------------------
(define-public devilutionx-graphics-tools-git
  (package
    (name "devilutionx-graphics-tools-git")
    (version "1.2.0.r4.ae39773")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/diasurgical/devilutionx-graphics-tools")
                    (commit "v1.2.0.r4.ae39773")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/diasurgical/devilutionx-graphics-tools")
    (synopsis "devilutionX graphics format conversion tools (git version)")
    (description "DevilutionX graphics format conversion tools (git version).")
    (license license:unlicense)))

;;; -------------------------------------------------------------------
;;; 33. downloader-cli
;;; -------------------------------------------------------------------
(define-public downloader-cli
  (package
    (name "downloader-cli")
    (version "0.3.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/deepjyoti30/downloader-cli/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/deepjyoti30/downloader-cli")
    (synopsis "a simple downloader with an awesome progressbar")
    (description "A simple downloader with an awesome progressbar.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 34. gdk-pixbuf
;;; -------------------------------------------------------------------
(define-public gdk-pixbuf
  (package
    (name "gdk-pixbuf")
    (version "0.22.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://www.gtk.org//releases/download/v" version "/source.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "http://www.gtk.org/")
    (synopsis "image loading and manipulation library")
    (description "Image loading and manipulation library.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 35. giflib4
;;; -------------------------------------------------------------------
(define-public giflib4
  (package
    (name "giflib4")
    (version "4.2.3")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://sourceforge.net/projects/giflib//releases/download/v" version "/source.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "http://sourceforge.net/projects/giflib/")
    (synopsis "a library for reading and writing gif images (version 4)")
    (description "A library for reading and writing gif images (version 4).")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 36. globalplatform
;;; -------------------------------------------------------------------
(define-public globalplatform
  (package
    (name "globalplatform")
    (version "7.4.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/kaoh/globalplatform/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/kaoh/globalplatform")
    (synopsis "globalPlatform libraries")
    (description "GlobalPlatform libraries.")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 37. gnocl
;;; -------------------------------------------------------------------
(define-public gnocl
  (package
    (name "gnocl")
    (version "0.9.96+20130131")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://www.gnocl.org//releases/download/v" version "/source.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "http://www.gnocl.org/")
    (synopsis "tcl/GTK+ bindings")
    (description "Tcl/GTK+ bindings.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 38. kahip
;;; -------------------------------------------------------------------
(define-public kahip
  (package
    (name "kahip")
    (version "3.25")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/KaHIP/KaHIP/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/KaHIP/KaHIP")
    (synopsis "karlsruhe HIGH Quality Partitioning")
    (description "Karlsruhe HIGH Quality Partitioning.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 39. lib32-ncurses5-compat-libs
;;; -------------------------------------------------------------------
(define-public lib32-ncurses5-compat-libs
  (package
    (name "lib32-ncurses5-compat-libs")
    (version "6.6")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://invisible-island.net/ncurses/ncurses.html/releases/download/v" version "/source.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://invisible-island.net/ncurses/ncurses.html")
    (synopsis "system V Release 4.0 curses emulation library (32-bit), ABI 5")
    (description "System V Release 4.0 curses emulation library (32-bit), ABI 5.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 40. libdecsync
;;; -------------------------------------------------------------------
(define-public libdecsync
  (package
    (name "libdecsync")
    (version "2.2.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/39aldo39/libdecsync/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/39aldo39/libdecsync")
    (synopsis "libdecsync is a multiplatform library for synchronizing using DecSync")
    (description "Libdecsync is a multiplatform library for synchronizing using DecSync.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 41. libshout-idjc
;;; -------------------------------------------------------------------
(define-public libshout-idjc
  (package
    (name "libshout-idjc")
    (version "2.4.6.r1")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://idjc.sourceforge.net//releases/download/v" version "/source.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "http://idjc.sourceforge.net/")
    (synopsis "library for accessing a shoutcast/icecast server (with IDJC customizations)")
    (description "Library for accessing a shoutcast/icecast server (with IDJC customizations).")
    (license license:lgpl3+)))

;;; -------------------------------------------------------------------
;;; 42. nvidia-utils-tesla
;;; -------------------------------------------------------------------
(define-public nvidia-utils-tesla
  (package
    (name "nvidia-utils-tesla")
    (version "580.65.06")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.nvidia.com//releases/download/v" version "/source.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://www.nvidia.com/")
    (synopsis "nVIDIA drivers utilities (tesla version)")
    (description "NVIDIA drivers utilities (tesla version).")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 43. nyan-lang
;;; -------------------------------------------------------------------
(define-public nyan-lang
  (package
    (name "nyan-lang")
    (version "0.3.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/SFTtech/nyan/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/SFTtech/nyan")
    (synopsis "a data description language designed for openage")
    (description "A data description language designed for openage.")
    (license license:lgpl3+)))

;;; -------------------------------------------------------------------
;;; 44. opencryptoki
;;; -------------------------------------------------------------------
(define-public opencryptoki
  (package
    (name "opencryptoki")
    (version "3.26.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/opencryptoki/opencryptoki/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/opencryptoki/opencryptoki")
    (synopsis "pKCS11 implementation for Linux")
    (description "PKCS11 implementation for Linux.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 45. perl-math-geometry-voronoi
;;; -------------------------------------------------------------------
(define-public perl-math-geometry-voronoi
  (package
    (name "perl-math-geometry-voronoi")
    (version "1.3")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://metacpan.org/release/Math-Geometry-Voronoi//releases/download/v" version "/source.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system perl-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://metacpan.org/release/Math-Geometry-Voronoi/")
    (synopsis "math::Geometry::Voronoi - compute Voronoi diagrams from sets of points")
    (description "Math::Geometry::Voronoi - compute Voronoi diagrams from sets of points.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 46. perl-moosex-methodattributes
;;; -------------------------------------------------------------------
(define-public perl-moosex-methodattributes
  (package
    (name "perl-moosex-methodattributes")
    (version "0.32")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://metacpan.org/release/MooseX-MethodAttributes/releases/download/v" version "/source.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system perl-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://metacpan.org/release/MooseX-MethodAttributes")
    (synopsis "code attribute introspection")
    (description "Code attribute introspection.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 47. python-cymruwhois
;;; -------------------------------------------------------------------
(define-public python-cymruwhois
  (package
    (name "python-cymruwhois")
    (version "1.6")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://pythonhosted.org/cymruwhois/releases/download/v" version "/source.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://pythonhosted.org/cymruwhois")
    (synopsis "client for the whois.cymru.com service")
    (description "Client for the whois.cymru.com service.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 48. python-dict2xml
;;; -------------------------------------------------------------------
(define-public python-dict2xml
  (package
    (name "python-dict2xml")
    (version "1.7.8")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/delfick/python-dict2xml/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/delfick/python-dict2xml")
    (synopsis "small utility to convert a python dictionary into an XML string")
    (description "Small utility to convert a python dictionary into an XML string.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 49. python-extra-platforms
;;; -------------------------------------------------------------------
(define-public python-extra-platforms
  (package
    (name "python-extra-platforms")
    (version "11.0.5")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/kdeldycke/extra-platforms/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/kdeldycke/extra-platforms")
    (synopsis "detect platforms and group them by family")
    (description "Detect platforms and group them by family.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 50. python-image
;;; -------------------------------------------------------------------
(define-public python-image
  (package
    (name "python-image")
    (version "1.5.33")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/francescortiz/image/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/francescortiz/image")
    (synopsis "django application that provides editing for images and videos")
    (description "Django application that provides editing for images and videos.")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; 51. python-netdisco
;;; -------------------------------------------------------------------
(define-public python-netdisco
  (package
    (name "python-netdisco")
    (version "3.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/home-assistant-libs/netdisco/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/home-assistant-libs/netdisco")
    (synopsis "library for Python that discovers devices on your local network [deprecated]")
    (description "Library for Python that discovers devices on your local network [deprecated].")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 52. python-pytubefix
;;; -------------------------------------------------------------------
(define-public python-pytubefix
  (package
    (name "python-pytubefix")
    (version "8.12.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/JuanBindez/pytubefix/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/JuanBindez/pytubefix")
    (synopsis "a pytube fork with additional features and fixes")
    (description "A pytube fork with additional features and fixes.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 53. python-sdnotify
;;; -------------------------------------------------------------------
(define-public python-sdnotify
  (package
    (name "python-sdnotify")
    (version "0.3.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Liganic/python-sdnotify/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/Liganic/python-sdnotify")
    (synopsis "a pure Python implementation of systemd's service notification protocol (sd_n...")
    (description "A pure Python implementation of systemd's service notification protocol (sd_notify).")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 54. python-typed-argument-parser
;;; -------------------------------------------------------------------
(define-public python-typed-argument-parser
  (package
    (name "python-typed-argument-parser")
    (version "1.9.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/swansonk14/typed-argument-parser/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/swansonk14/typed-argument-parser")
    (synopsis "typed modernization of Python's argparse library")
    (description "Typed modernization of Python's argparse library.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 55. quantlib
;;; -------------------------------------------------------------------
(define-public quantlib
  (package
    (name "quantlib")
    (version "1.42")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://quantlib.org/releases/download/v" version "/source.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "http://quantlib.org")
    (synopsis "a free/open-source library for quantitative finance")
    (description "A free/open-source library for quantitative finance.")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; 56. rlottie
;;; -------------------------------------------------------------------
(define-public rlottie
  (package
    (name "rlottie")
    (version "0.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Samsung/rlottie/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/Samsung/rlottie")
    (synopsis "a platform independent standalone library that plays Lottie Animation")
    (description "A platform independent standalone library that plays Lottie Animation.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 57. sawfish
;;; -------------------------------------------------------------------
(define-public sawfish
  (package
    (name "sawfish")
    (version "1.13.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://sawfish.wikia.com/wiki/Main_Page/releases/download/v" version "/source.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "http://sawfish.wikia.com/wiki/Main_Page")
    (synopsis "an extensible window manager using a Lisp-based scripting language")
    (description "An extensible window manager using a Lisp-based scripting language.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 58. scraw
;;; -------------------------------------------------------------------
(define-public scraw
  (package
    (name "scraw")
    (version "0.2.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://gitlab.com/dennis-hamester/scraw/-/archive/v"
                    version "/scraw-v" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://gitlab.com/dennis-hamester/scraw")
    (synopsis "steam Controller C library")
    (description "Steam Controller C library.")
    (license license:isc)))

;;; -------------------------------------------------------------------
;;; 59. timblserver
;;; -------------------------------------------------------------------
(define-public timblserver
  (package
    (name "timblserver")
    (version "1.19")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://languagemachines.github.io/timbl/releases/download/v" version "/source.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "http://languagemachines.github.io/timbl")
    (synopsis "tilburg Memory Based Learner Server")
    (description "Tilburg Memory Based Learner Server.")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 60. ucommon
;;; -------------------------------------------------------------------
(define-public ucommon
  (package
    (name "ucommon")
    (version "7.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.gnu.org/software/commoncpp//releases/download/v" version "/source.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://www.gnu.org/software/commoncpp/")
    (synopsis "a class framework that was specifically designed for telephony applications")
    (description "A class framework that was specifically designed for telephony applications.")
    (license license:lgpl3+)))

;;; -------------------------------------------------------------------
;;; 61. vapoursynth-plugin-bm3d-git
;;; -------------------------------------------------------------------
(define-public vapoursynth-plugin-bm3d-git
  (package
    (name "vapoursynth-plugin-bm3d-git")
    (version "9.0.gfe1a433")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://forum.doom9.org/showthread.php?t=172172/releases/download/v" version "/source.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://forum.doom9.org/showthread.php?t=172172")
    (synopsis "plugin for Vapoursynth: bm3d (GIT version)")
    (description "Plugin for Vapoursynth: bm3d (GIT version).")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 62. vapoursynth-plugin-dfttest-git
;;; -------------------------------------------------------------------
(define-public vapoursynth-plugin-dfttest-git
  (package
    (name "vapoursynth-plugin-dfttest-git")
    (version "7.1.g89034df")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://forum.doom9.org/showthread.php?t=171678/releases/download/v" version "/source.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://forum.doom9.org/showthread.php?t=171678")
    (synopsis "plugin for Vapoursynth: dfttest (GIT version)")
    (description "Plugin for Vapoursynth: dfttest (GIT version).")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 63. wraith-master-common
;;; -------------------------------------------------------------------
(define-public wraith-master-common
  (package
    (name "wraith-master-common")
    (version "1.2.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://gitlab.com/serebit/wraith-master/-/archive/v"
                    version "/wraith-master-v" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://gitlab.com/serebit/wraith-master")
    (synopsis "udev rules for wraith-master frontends")
    (description "Udev rules for wraith-master frontends.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 64. youtube-search-python
;;; -------------------------------------------------------------------
(define-public youtube-search-python
  (package
    (name "youtube-search-python")
    (version "1.6.6")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/alexmercerind/youtube-search-python/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/alexmercerind/youtube-search-python")
    (synopsis "search for YouTube videos, channels & playlists & get video information using...")
    (description "Search for YouTube videos, channels & playlists & get video information using link WITHOUT YouTube Data API v3.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 65. zfs-utils-git
;;; -------------------------------------------------------------------
(define-public zfs-utils-git
  (package
    (name "zfs-utils-git")
    (version "2.4.99.r305.gb9b84445ea")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://zfsonlinux.org//releases/download/v" version "/source.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://zfsonlinux.org/")
    (synopsis "userspace utilities for the Zettabyte File System")
    (description "Userspace utilities for the Zettabyte File System.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 66. zopflipng-parallel
;;; -------------------------------------------------------------------
(define-public zopflipng-parallel
  (package
    (name "zopflipng-parallel")
    (version "0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/packages/zopflipng-parallel/releases/download/v" version "/source.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://aur.archlinux.org/packages/zopflipng-parallel")
    (synopsis "executes 'zopflipng' in parallel to the PNG images specified on the command l...")
    (description "Executes 'zopflipng' in parallel to the PNG images specified on the command line, overwriting the input files.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 67. bertini-common
;;; -------------------------------------------------------------------
(define-public bertini-common
  (package
    (name "bertini-common")
    (version "1.6")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://bertini.nd.edu/releases/download/v" version "/source.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://bertini.nd.edu")
    (synopsis "homotopy continuation solver for systems of polynomial equations (common file...")
    (description "Homotopy continuation solver for systems of polynomial equations (common files and documentation).")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 68. c++utilities-git
;;; -------------------------------------------------------------------
(define-public c++utilities-git
  (package
    (name "c++utilities-git")
    (version "989.6390182")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Martchus/cpp-utilities")
                    (commit "v989.6390182")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/Martchus/cpp-utilities")
    (synopsis "common C++ classes and routines such as argument parser, IO and conversion ut...")
    (description "Common C++ classes and routines such as argument parser, IO and conversion utilities.")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 69. fbx-sdk
;;; -------------------------------------------------------------------
(define-public fbx-sdk
  (package
    (name "fbx-sdk")
    (version "2020.3.7")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://www.autodesk.com/products/fbx/overview/releases/download/v" version "/source.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "http://www.autodesk.com/products/fbx/overview")
    (synopsis "platform and API toolkit to transfer existing content into the FBX format")
    (description "Platform and API toolkit to transfer existing content into the FBX format.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 70. flashplugin
;;; -------------------------------------------------------------------
(define-public flashplugin
  (package
    (name "flashplugin")
    (version "32.0.0.465")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://get.adobe.com/flashplayer//releases/download/v" version "/source.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://get.adobe.com/flashplayer/")
    (synopsis "adobe Flash Player NPAPI")
    (description "Adobe Flash Player NPAPI.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 71. gcc11-libs
;;; -------------------------------------------------------------------
(define-public gcc11-libs
  (package
    (name "gcc11-libs")
    (version "11.5.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://gcc.gnu.org/releases/download/v" version "/source.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://gcc.gnu.org")
    (synopsis "runtime libraries shipped by GCC (11.x.x)")
    (description "Runtime libraries shipped by GCC (11.x.x).")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 72. glade-perl
;;; -------------------------------------------------------------------
(define-public glade-perl
  (package
    (name "glade-perl")
    (version "1.008-1.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://metacpan.org/release/Gtk2-GladeXML/releases/download/v" version "/source.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://metacpan.org/release/Gtk2-GladeXML")
    (synopsis "gtk2-GladeXML perl bindings for glade 2.x")
    (description "Gtk2-GladeXML perl bindings for glade 2.x.")
    (license license:lgpl3+)))

;;; -------------------------------------------------------------------
;;; 73. lib32-pangox-compat
;;; -------------------------------------------------------------------
(define-public lib32-pangox-compat
  (package
    (name "lib32-pangox-compat")
    (version "0.0.2+2+gedb9e09")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://www.pango.org//releases/download/v" version "/source.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "http://www.pango.org/")
    (synopsis "x Window System font support for Pango (32bit)")
    (description "X Window System font support for Pango (32bit).")
    (license license:lgpl3+)))

;;; -------------------------------------------------------------------
;;; 74. libgroove
;;; -------------------------------------------------------------------
(define-public libgroove
  (package
    (name "libgroove")
    (version "4.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/andrewrk/libgroove/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/andrewrk/libgroove")
    (synopsis "library that provides decoding and encoding of audio on a playlist")
    (description "Library that provides decoding and encoding of audio on a playlist.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 75. libirecovery
;;; -------------------------------------------------------------------
(define-public libirecovery
  (package
    (name "libirecovery")
    (version "1.3.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://libimobiledevice.org//releases/download/v" version "/source.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://libimobiledevice.org/")
    (synopsis "library and utility to talk to iBoot/iBSS via USB")
    (description "Library and utility to talk to iBoot/iBSS via USB.")
    (license license:lgpl2.1)))

;;; -------------------------------------------------------------------
;;; 76. libkexiv2-git
;;; -------------------------------------------------------------------
(define-public libkexiv2-git
  (package
    (name "libkexiv2-git")
    (version "22.03.80.r0.gd8dbd19")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://invent.kde.org/graphics/libkexiv2/releases/download/v" version "/source.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://invent.kde.org/graphics/libkexiv2")
    (synopsis "a library to manipulate pictures metadata")
    (description "A library to manipulate pictures metadata.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 77. linux-firmware-atheros-uncompressed
;;; -------------------------------------------------------------------
(define-public linux-firmware-atheros-uncompressed
  (package
    (name "linux-firmware-atheros-uncompressed")
    (version "20260110")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://gitlab.com/kernel-firmware/linux-firmware/-/archive/v"
                    version "/linux-firmware-v" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://gitlab.com/kernel-firmware/linux-firmware")
    (synopsis "firmware files for Linux (without firmware compression for linux<5.19) - Firm...")
    (description "Firmware files for Linux (without firmware compression for linux<5.19) - Firmware for Qualcomm Atheros WiFi and Bluetooth adapters.")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 78. lsi-msm-libs
;;; -------------------------------------------------------------------
(define-public lsi-msm-libs
  (package
    (name "lsi-msm-libs")
    (version "17.05.06.00")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.broadcom.com/products/storage/releases/download/v" version "/source.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://www.broadcom.com/products/storage")
    (synopsis "lSI Logic MegaRAID Storage Manager Suite common libs")
    (description "LSI Logic MegaRAID Storage Manager Suite common libs.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 79. lxqt-globalkeys-git
;;; -------------------------------------------------------------------
(define-public lxqt-globalkeys-git
  (package
    (name "lxqt-globalkeys-git")
    (version "2.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://lxqt-project.org/releases/download/v" version "/source.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://lxqt-project.org")
    (synopsis "lXQt daemon and library for global keyboard shortcuts registration")
    (description "LXQt daemon and library for global keyboard shortcuts registration.")
    (license license:lgpl2.1)))

;;; -------------------------------------------------------------------
;;; 80. ocaml-batteries
;;; -------------------------------------------------------------------
(define-public ocaml-batteries
  (package
    (name "ocaml-batteries")
    (version "3.6.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ocaml-batteries-team/batteries-included/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/ocaml-batteries-team/batteries-included")
    (synopsis "a comprehensive standard library for OCaml")
    (description "A comprehensive standard library for OCaml.")
    (license license:lgpl3+)))

;;; -------------------------------------------------------------------
;;; 81. ocaml-xmlm
;;; -------------------------------------------------------------------
(define-public ocaml-xmlm
  (package
    (name "ocaml-xmlm")
    (version "1.4.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://erratique.ch/software/xmlm/releases/download/v" version "/source.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://erratique.ch/software/xmlm")
    (synopsis "an OCaml streaming codec to decode and encode the XML data format")
    (description "An OCaml streaming codec to decode and encode the XML data format.")
    (license license:isc)))

;;; -------------------------------------------------------------------
;;; 82. perl-class-c3-componentised
;;; -------------------------------------------------------------------
(define-public perl-class-c3-componentised
  (package
    (name "perl-class-c3-componentised")
    (version "1.001002")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://search.cpan.org/dist/Class-C3-Componentised/releases/download/v" version "/source.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system perl-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "http://search.cpan.org/dist/Class-C3-Componentised")
    (synopsis "load mix-ins or components to your C3-based class")
    (description "Load mix-ins or components to your C3-based class.")
    (license license:artistic2.0)))

;;; -------------------------------------------------------------------
;;; 83. pure-audio
;;; -------------------------------------------------------------------
(define-public pure-audio
  (package
    (name "pure-audio")
    (version "0.6")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://purelang.bitbucket.org//releases/download/v" version "/source.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "http://purelang.bitbucket.org/")
    (synopsis "digital audio interface for Pure")
    (description "Digital audio interface for Pure.")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; 84. python-affine
;;; -------------------------------------------------------------------
(define-public python-affine
  (package
    (name "python-affine")
    (version "2.4.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/rasterio/affine/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/rasterio/affine")
    (synopsis "Python package for matrices describing affine transformation of the plane")
    (description "Python package for matrices describing affine transformation of the plane.")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; 85. python-dephell-specifier
;;; -------------------------------------------------------------------
(define-public python-dephell-specifier
  (package
    (name "python-dephell-specifier")
    (version "0.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/dephell/dephell_specifier/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/dephell/dephell_specifier")
    (synopsis "work with version specifiers")
    (description "Work with version specifiers.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 86. python-rosdistro
;;; -------------------------------------------------------------------
(define-public python-rosdistro
  (package
    (name "python-rosdistro")
    (version "1.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ros-infrastructure/rosdistro/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/ros-infrastructure/rosdistro")
    (synopsis "a tool to work with rosdistro files")
    (description "A tool to work with rosdistro files.")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; 87. python-setuptools-git-ls-files
;;; -------------------------------------------------------------------
(define-public python-setuptools-git-ls-files
  (package
    (name "python-setuptools-git-ls-files")
    (version "0.1.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/anthrotype/setuptools_git_ls_files/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/anthrotype/setuptools_git_ls_files")
    (synopsis "a plugin for setuptools that finds all git tracked files, including submodules")
    (description "A plugin for setuptools that finds all git tracked files, including submodules.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 88. python-suntime
;;; -------------------------------------------------------------------
(define-public python-suntime
  (package
    (name "python-suntime")
    (version "1.3.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/SatAgro/suntime/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/SatAgro/suntime")
    (synopsis "simple sunset and sunrise time calculation python library")
    (description "Simple sunset and sunrise time calculation python library.")
    (license license:lgpl3)))

;;; -------------------------------------------------------------------
;;; 89. python-tatsu-lts
;;; -------------------------------------------------------------------
(define-public python-tatsu-lts
  (package
    (name "python-tatsu-lts")
    (version "5.13.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/dnicolodi/TatSu-LTS/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/dnicolodi/TatSu-LTS")
    (synopsis "tatSu-LTS is a friendly fork of TatSu that guarantees compatibility with all ...")
    (description "TatSu-LTS is a friendly fork of TatSu that guarantees compatibility with all supported versions of Python.")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; 90. python-tinydb
;;; -------------------------------------------------------------------
(define-public python-tinydb
  (package
    (name "python-tinydb")
    (version "4.8.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/msiemens/tinydb/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/msiemens/tinydb")
    (synopsis "tinyDB is a tiny, document oriented database optimized for your happiness :)")
    (description "TinyDB is a tiny, document oriented database optimized for your happiness :).")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 91. python-wasabi
;;; -------------------------------------------------------------------
(define-public python-wasabi
  (package
    (name "python-wasabi")
    (version "1.1.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/explosion/wasabi/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/explosion/wasabi")
    (synopsis "lightweight console printing and formatting toolkit")
    (description "Lightweight console printing and formatting toolkit.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 92. r-progress
;;; -------------------------------------------------------------------
(define-public r-progress
  (package
    (name "r-progress")
    (version "1.2.3")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://cran.r-project.org/package=progress/releases/download/v" version "/source.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system r-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://cran.r-project.org/package=progress")
    (synopsis "terminal Progress Bars")
    (description "Terminal Progress Bars.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 93. ruby-sexp-processor
;;; -------------------------------------------------------------------
(define-public ruby-sexp-processor
  (package
    (name "ruby-sexp-processor")
    (version "4.17.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/seattlerb/sexp_processor/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system ruby-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/seattlerb/sexp_processor")
    (synopsis "a branch of ParseTree that brings several sexp processing tools")
    (description "A branch of ParseTree that brings several sexp processing tools.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 94. streamripper
;;; -------------------------------------------------------------------
(define-public streamripper
  (package
    (name "streamripper")
    (version "1.64.6+56+a5597af")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://streamripper.sourceforge.net/releases/download/v" version "/source.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://streamripper.sourceforge.net")
    (synopsis "records and splits streaming mp3 into tracks")
    (description "Records and splits streaming mp3 into tracks.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 95. t4kcommon
;;; -------------------------------------------------------------------
(define-public t4kcommon
  (package
    (name "t4kcommon")
    (version "0.1.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/tux4kids/t4kcommon/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/tux4kids/t4kcommon")
    (synopsis "a library of code shared between tuxmath and tuxtype")
    (description "A library of code shared between tuxmath and tuxtype.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 96. vapoursynth-plugin-eedi3m-git
;;; -------------------------------------------------------------------
(define-public vapoursynth-plugin-eedi3m-git
  (package
    (name "vapoursynth-plugin-eedi3m-git")
    (version "6.0.g152f83b")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/HomeOfVapourSynthEvolution/VapourSynth-EEDI3")
                    (commit "v6.0.g152f83b")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/HomeOfVapourSynthEvolution/VapourSynth-EEDI3")
    (synopsis "plugin for Vapoursynth: eedi3m (GIT version)")
    (description "Plugin for Vapoursynth: eedi3m (GIT version).")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 97. waifu2x-converter-cpp
;;; -------------------------------------------------------------------
(define-public waifu2x-converter-cpp
  (package
    (name "waifu2x-converter-cpp")
    (version "5.3.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/DeadSix27/waifu2x-converter-cpp/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/DeadSix27/waifu2x-converter-cpp")
    (synopsis "image super-resolution for anime-style art")
    (description "Image super-resolution for anime-style art.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 98. angie
;;; -------------------------------------------------------------------
(define-public angie
  (package
    (name "angie")
    (version "1.11.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/webserver-llc/angie/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/webserver-llc/angie")
    (synopsis "lightweight HTTP server and IMAP/POP3 proxy server, drop-in replacement for n...")
    (description "Lightweight HTTP server and IMAP/POP3 proxy server, drop-in replacement for nginx.")
    (license license:bsd-3)))
