;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260414c
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages from general queue:
;;;   - 30 recipes created (gnu, cmake, meson, pyproject, perl, font, copy)
;;;
;;; Recipes (30):
;;;   ttf-tahoma, ttf-profont-iix,
;;;   perl-test-refcount, perl-datetime-format-dateparse, perl-future-io,
;;;   python-setuptools-reproducible, python-yappi, python-logfire-api,
;;;   python-asynctest, python-dashing, python-ldraw-to-scad,
;;;   python-pyborgeous,
;;;   princeprocessor, openseachest, evenmoreutils, libkcapi, onvif-util,
;;;   colloid-icon-theme, colloid-nord-icon-theme, colloid-gruvbox-icon-theme,
;;;   colloid-everforest-icon-theme, colloid-dracula-icon-theme,
;;;   colloid-catppuccin-icon-theme,
;;;   adg-gtk-theme, qogir-gtk-theme,
;;;   xapp-ora-thumbnailer, xapp-gimp-thumbnailer, xapp-epub-thumbnailer,
;;;   xapp-mp3-thumbnailer, xapp-aiff-thumbnailer
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Run `guix download <url>` to obtain real hashes before building.

(define-module (gaurix packages recipe-resolver-260414c)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system font)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system perl)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system python)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages perl-check)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages gnome)
  #:export (ttf-tahoma
            ttf-profont-iix
            perl-test-refcount
            perl-datetime-format-dateparse
            perl-future-io
            python-setuptools-reproducible
            python-yappi
            python-logfire-api
            python-asynctest
            python-dashing
            python-ldraw-to-scad
            python-pyborgeous
            princeprocessor
            openseachest
            evenmoreutils
            libkcapi
            onvif-util
            colloid-icon-theme
            colloid-nord-icon-theme
            colloid-gruvbox-icon-theme
            colloid-everforest-icon-theme
            colloid-dracula-icon-theme
            colloid-catppuccin-icon-theme
            adg-gtk-theme
            qogir-gtk-theme
            xapp-ora-thumbnailer
            xapp-gimp-thumbnailer
            xapp-epub-thumbnailer
            xapp-mp3-thumbnailer
            xapp-aiff-thumbnailer))

;;; ──────────────────────────────────────────────────────────────────
;;; Fonts
;;; ──────────────────────────────────────────────────────────────────

;;; ── ttf-tahoma (#1777) ──

(define-public ttf-tahoma
  (package
    (name "ttf-tahoma")
    (version "9.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/ttf-tahoma")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (home-page "https://www.winehq.org/")
    (synopsis "tahoma and Tahoma Bold TrueType fonts from the Wine project")
    (description "This package provides the Tahoma and Tahoma Bold TrueType
fonts, extracted from the Wine project.  Tahoma is a humanist sans-serif
typeface commonly used in user interfaces.")
    (license license:lgpl2.1+)))

;;; ── ttf-profont-iix (#2496) ──

(define-public ttf-profont-iix
  (package
    (name "ttf-profont-iix")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri "http://tobiasjung.name/downloadfile.php?file=ProFontIIx.zip")
              (file-name (string-append name "-" version ".zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (native-inputs (list unzip))
    (home-page "http://tobiasjung.name/profont/")
    (synopsis "ProFont IIx variant as a TrueType font")
    (description "ProFont IIx is a variant of the ProFont monospaced bitmap
font, provided as a TrueType outline font.  It is designed for use in
programming editors and terminal emulators.")
    (license license:expat)))

;;; ──────────────────────────────────────────────────────────────────
;;; Perl packages
;;; ──────────────────────────────────────────────────────────────────

;;; ── perl-test-refcount (#2495) ──

(define-public perl-test-refcount
  (package
    (name "perl-test-refcount")
    (version "0.10")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "mirror://cpan/authors/id/P/PE/PEVANS/"
                    "Test-Refcount-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system perl-build-system)
    (native-inputs (list perl-module-build))
    (home-page "https://metacpan.org/release/Test-Refcount")
    (synopsis "assert reference counts on objects")
    (description "Test::Refcount provides test functions to check the reference
count of a variable.  This is useful for verifying that objects are being
properly freed and do not have circular references preventing garbage
collection.")
    (license (list license:gpl1+ license:artistic2.0))))

;;; ── perl-datetime-format-dateparse (#2926) ──

(define-public perl-datetime-format-dateparse
  (package
    (name "perl-datetime-format-dateparse")
    (version "0.05")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "mirror://cpan/authors/id/J/JH/JHOBLITT/"
                    "DateTime-Format-DateParse-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system perl-build-system)
    (native-inputs (list perl-module-build))
    (home-page "https://metacpan.org/release/DateTime-Format-DateParse")
    (synopsis "parse Date::Parse compatible formats into DateTime objects")
    (description "DateTime::Format::DateParse parses date and time strings using
the same heuristics as Date::Parse and returns DateTime objects.  It provides
a bridge between the Date::Parse and DateTime ecosystems.")
    (license (list license:gpl1+ license:artistic2.0))))

;;; ── perl-future-io (#2612) ──

(define-public perl-future-io
  (package
    (name "perl-future-io")
    (version "0.17")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "mirror://cpan/authors/id/P/PE/PEVANS/"
                    "Future-IO-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system perl-build-system)
    (native-inputs (list perl-module-build))
    (propagated-inputs (list perl-future perl-struct-dumb))
    (home-page "https://metacpan.org/release/Future-IO")
    (synopsis "future-returning IO methods for asynchronous Perl programs")
    (description "Future::IO provides an API of IO methods that return
Future instances, allowing them to be easily integrated into larger
asynchronous or event-driven programs using various event loops.")
    (license (list license:gpl1+ license:artistic2.0))))

;;; ──────────────────────────────────────────────────────────────────
;;; Python packages
;;; ──────────────────────────────────────────────────────────────────

;;; ── python-setuptools-reproducible (#329) ──

(define-public python-setuptools-reproducible
  (package
    (name "python-setuptools-reproducible")
    (version "0.1")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "setuptools-reproducible" version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))  ;no test suite
    (propagated-inputs (list python-setuptools))
    (home-page "https://github.com/wimglenn/setuptools-reproducible")
    (synopsis "extension of setuptools to support reproducible builds")
    (description "This package extends setuptools to produce reproducible
builds by ensuring deterministic metadata ordering and timestamps in
distribution packages.")
    (license license:expat)))

;;; ── python-yappi (#2472) ──

(define-public python-yappi
  (package
    (name "python-yappi")
    (version "1.7.6")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "yappi" version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))  ;tests require threading setup
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://github.com/sumerc/yappi")
    (synopsis "tracing profiler that is multithreading and asyncio aware")
    (description "Yappi is a tracing profiler for Python that supports
profiling multithreaded, asyncio, and gevent-based applications.  It provides
wall-time and CPU-time profiling with per-thread and per-coroutine
granularity.")
    (license license:expat)))

;;; ── python-logfire-api (#2976) ──

(define-public python-logfire-api
  (package
    (name "python-logfire-api")
    (version "4.25.0")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "logfire_api" version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))  ;no test suite
    (native-inputs (list python-hatchling))
    (home-page "https://github.com/pydantic/logfire")
    (synopsis "shim for the Logfire SDK which does nothing unless Logfire is installed")
    (description "Logfire API provides a no-op shim for the Logfire observability
SDK.  When Logfire is not installed, all instrumentation calls become
silent no-ops, allowing libraries to optionally support Logfire without
adding a hard dependency.")
    (license license:expat)))

;;; ── python-asynctest (#6809) ──

(define-public python-asynctest
  (package
    (name "python-asynctest")
    (version "0.13.0")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "asynctest" version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))  ;circular with test runner
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://github.com/Martiusweb/asynctest")
    (synopsis "enhance the standard unittest package for testing asyncio libraries")
    (description "Asynctest extends the standard library's @code{unittest}
package with features for testing asyncio-based code.  It provides mock
classes for coroutines, event loop stubs, and selectors that simplify
writing tests for asynchronous Python code.")
    (license license:asl2.0)))

;;; ── python-dashing (#7218) ──

(define-public python-dashing
  (package
    (name "python-dashing")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "dashing" version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))  ;no test suite
    (native-inputs (list python-setuptools python-wheel))
    (propagated-inputs (list python-blessed))
    (home-page "https://github.com/FedericoCeratto/dashing")
    (synopsis "terminal dashboards for Python")
    (description "Dashing provides a library for creating text-based dashboards
in the terminal.  It supports tiles, charts, gauges, and logs arranged in
split layouts, rendering via the @code{blessed} terminal library.")
    (license license:lgpl3+)))

;;; ── python-ldraw-to-scad (#2621) ──

(define-public python-ldraw-to-scad
  (package
    (name "python-ldraw-to-scad")
    (version "0.5.0")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "ldraw-to-scad" version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))  ;no test suite in sdist
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://github.com/orionrobots/ldraw-to-scad/")
    (synopsis "LDraw to OpenSCAD converter library")
    (description "This package converts LDraw 3D model files to OpenSCAD
source code, allowing LEGO and compatible brick models to be rendered and
modified in the OpenSCAD parametric CAD environment.")
    (license license:asl2.0)))

;;; ── python-pyborgeous (#2888) ──

(define-public python-pyborgeous
  (package
    (name "python-pyborgeous")
    (version "0.5.0")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "pyborgeous" version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))  ;no test suite
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://github.com/Spacehug-zz/pyborgeous")
    (synopsis "implementation of Jorge Luis Borges' Library of Babel")
    (description "Pyborgeous implements the concept of Jorge Luis Borges'
Library of Babel in Python.  It provides deterministic generation and
retrieval of pages from the universal library containing every possible
combination of characters.")
    (license license:expat)))

;;; ──────────────────────────────────────────────────────────────────
;;; C/C++ builds (gnu-build-system, cmake, meson)
;;; ──────────────────────────────────────────────────────────────────

;;; ── princeprocessor (#844) ──

(define-public princeprocessor
  (package
    (name "princeprocessor")
    (version "0.22")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/hashcat/princeprocessor")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f  ;no test suite
           #:make-flags
           #~(list (string-append "CC=" #$(cc-for-target))
                   (string-append "PREFIX=" #$output))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((bin (string-append (assoc-ref outputs "out") "/bin")))
                     (mkdir-p bin)
                     (install-file "src/pp64.bin" bin)))))))
    (home-page "https://github.com/hashcat/princeprocessor")
    (synopsis "password candidate generator using the PRINCE algorithm")
    (description "Princeprocessor is a standalone password candidate generator
using the PRINCE (PRobability INfinite Chained Elements) algorithm.  It
generates password candidates by combining words from a dictionary in
probability-ordered fashion for use with password recovery tools.")
    (license license:expat)))

;;; ── openseachest (#680) ──

(define-public openseachest
  (package
    (name "openseachest")
    (version "26.03.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Seagate/openSeaChest")
                    (commit (string-append "v" version))
                    (recursive? #t)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (home-page "https://github.com/Seagate/openSeaChest")
    (synopsis "Seagate utilities for SATA, SAS, NVMe, and USB storage devices")
    (description "OpenSeaChest provides cross-platform command-line diagnostic
and configuration utilities for SATA, SAS, NVMe, and USB storage devices.
It includes tools for firmware updates, SMART data retrieval, secure erase,
and drive health assessment.")
    (license license:mpl2.0)))

;;; ── evenmoreutils (#691) ──

(define-public evenmoreutils
  (package
    (name "evenmoreutils")
    (version "0.6.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/rudymatela/evenmoreutils")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f  ;no test suite
           #:make-flags
           #~(list (string-append "CC=" #$(cc-for-target))
                   (string-append "PREFIX=" #$output))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (home-page "https://github.com/rudymatela/evenmoreutils/")
    (synopsis "collection of command line tools to extend the shell environment")
    (description "Evenmoreutils provides a collection of small command-line
utilities that complement standard Unix tools and the moreutils package.
It includes tools for text processing, file manipulation, and shell
scripting convenience.")
    (license license:gpl2)))

;;; ── libkcapi (#2491) ──

(define-public libkcapi
  (package
    (name "libkcapi")
    (version "1.5.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://www.chronox.de/libkcapi/libkcapi-"
                    version ".tar.xz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (native-inputs (list autoconf automake pkg-config))
    (home-page "http://www.chronox.de/libkcapi.html")
    (synopsis "Linux kernel crypto API user space interface library")
    (description "Libkcapi provides a user space interface to the Linux
kernel Crypto API.  It allows applications to use kernel-provided
cryptographic algorithms for symmetric ciphers, message digests, MAC,
AEAD, and random number generation without requiring user space crypto
library implementations.")
    (license (list license:bsd-3 license:gpl2))))

;;; ── onvif-util (#10278) ──

(define-public onvif-util
  (package
    (name "onvif-util")
    (version "1.4.9")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/sr99622/libonvif")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))  ;no test suite
    (home-page "https://github.com/sr99622/libonvif")
    (synopsis "client-side implementation of the ONVIF specification")
    (description "Onvif-util is a command-line client implementing the ONVIF
network video interface specification for IP cameras.  It supports device
discovery, PTZ control, media profile queries, and video streaming
configuration for ONVIF-compliant cameras.")
    (license license:lgpl2.1+)))

;;; ──────────────────────────────────────────────────────────────────
;;; Icon themes (Colloid — all from same upstream repo)
;;; ──────────────────────────────────────────────────────────────────

;;; ── colloid-icon-theme (#727) ──

(define-public colloid-icon-theme
  (package
    (name "colloid-icon-theme")
    (version "2025.02.09")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/vinceliuice/Colloid-icon-theme")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/icons/Colloid"
                #:include-regexp (".*\\.svg$" ".*\\.png$" "index\\.theme"
                                  "cursors/")))))
    (native-inputs (list bash-minimal gtk+ hicolor-icon-theme))
    (home-page "https://github.com/vinceliuice/Colloid-icon-theme")
    (synopsis "icon theme for Linux desktops")
    (description "Colloid is a colorful and well-designed icon theme for
Linux desktops.  It provides icons for applications, file types, folders,
and system actions in multiple color variants.")
    (license license:gpl3+)))

;;; ── colloid-nord-icon-theme (#726) ──

(define-public colloid-nord-icon-theme
  (package
    (inherit colloid-icon-theme)
    (name "colloid-nord-icon-theme")
    (arguments
     (list #:install-plan
           #~'(("." "share/icons/Colloid-Nord"
                #:include-regexp (".*\\.svg$" ".*\\.png$" "index\\.theme"
                                  "cursors/")))))
    (synopsis "Nord color variant of the Colloid icon theme")
    (description "Colloid Nord is the Nord color variant of the Colloid icon
theme for Linux desktops.  It uses the Nord color palette for folder icons
and accents.")))

;;; ── colloid-gruvbox-icon-theme (#728) ──

(define-public colloid-gruvbox-icon-theme
  (package
    (inherit colloid-icon-theme)
    (name "colloid-gruvbox-icon-theme")
    (arguments
     (list #:install-plan
           #~'(("." "share/icons/Colloid-Gruvbox"
                #:include-regexp (".*\\.svg$" ".*\\.png$" "index\\.theme"
                                  "cursors/")))))
    (synopsis "Gruvbox color variant of the Colloid icon theme")
    (description "Colloid Gruvbox is the Gruvbox color variant of the Colloid
icon theme for Linux desktops.  It uses the Gruvbox color palette for folder
icons and accents.")))

;;; ── colloid-everforest-icon-theme (#729) ──

(define-public colloid-everforest-icon-theme
  (package
    (inherit colloid-icon-theme)
    (name "colloid-everforest-icon-theme")
    (arguments
     (list #:install-plan
           #~'(("." "share/icons/Colloid-Everforest"
                #:include-regexp (".*\\.svg$" ".*\\.png$" "index\\.theme"
                                  "cursors/")))))
    (synopsis "Everforest color variant of the Colloid icon theme")
    (description "Colloid Everforest is the Everforest color variant of the
Colloid icon theme for Linux desktops.  It uses the Everforest color palette
for folder icons and accents.")))

;;; ── colloid-dracula-icon-theme (#730) ──

(define-public colloid-dracula-icon-theme
  (package
    (inherit colloid-icon-theme)
    (name "colloid-dracula-icon-theme")
    (arguments
     (list #:install-plan
           #~'(("." "share/icons/Colloid-Dracula"
                #:include-regexp (".*\\.svg$" ".*\\.png$" "index\\.theme"
                                  "cursors/")))))
    (synopsis "Dracula color variant of the Colloid icon theme")
    (description "Colloid Dracula is the Dracula color variant of the Colloid
icon theme for Linux desktops.  It uses the Dracula color palette for folder
icons and accents.")))

;;; ── colloid-catppuccin-icon-theme (#732) ──

(define-public colloid-catppuccin-icon-theme
  (package
    (inherit colloid-icon-theme)
    (name "colloid-catppuccin-icon-theme")
    (arguments
     (list #:install-plan
           #~'(("." "share/icons/Colloid-Catppuccin"
                #:include-regexp (".*\\.svg$" ".*\\.png$" "index\\.theme"
                                  "cursors/")))))
    (synopsis "Catppuccin color variant of the Colloid icon theme")
    (description "Colloid Catppuccin is the Catppuccin color variant of the
Colloid icon theme for Linux desktops.  It uses the Catppuccin color palette
for folder icons and accents.")))

;;; ──────────────────────────────────────────────────────────────────
;;; GTK themes
;;; ──────────────────────────────────────────────────────────────────

;;; ── adg-gtk-theme (#10447) ──

(define-public adg-gtk-theme
  (package
    (name "adg-gtk-theme")
    (version "3.22.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/leipero/adg-gtk-theme")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/themes/Adg"
                #:include-regexp ("gtk-2\\.0/" "gtk-3\\.0/" "gtk-3\\.20/"
                                  "index\\.theme")))))
    (home-page "https://github.com/leipero/adg-gtk-theme")
    (synopsis "slight gray modification of the Adwaita GTK theme")
    (description "ADG is a GTK theme that provides a slight gray color
modification of the GNOME Adwaita theme.  It offers a softer visual
appearance while maintaining compatibility with GTK 2 and GTK 3
applications.")
    (license license:gpl3+)))

;;; ── qogir-gtk-theme (#18016) ──

(define-public qogir-gtk-theme
  (package
    (name "qogir-gtk-theme")
    (version "2025.02.17")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/vinceliuice/Qogir-theme")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("src" "share/themes/Qogir/gtk-3.0"
                #:include-regexp (".*\\.css$"))
               ("src" "share/themes/Qogir/gtk-4.0"
                #:include-regexp (".*\\.css$")))))
    (home-page "https://github.com/vinceliuice/Qogir-theme")
    (synopsis "flat design theme for GTK")
    (description "Qogir is a flat design theme for GTK-based Linux desktop
environments.  It provides clean, modern styling for GTK 3 and GTK 4
applications with support for light and dark variants.")
    (license license:gpl3+)))

;;; ──────────────────────────────────────────────────────────────────
;;; XApp thumbnailers (all from github.com/linuxmint/xapp-thumbnailers)
;;; ──────────────────────────────────────────────────────────────────

;;; ── xapp-ora-thumbnailer (#1097) ──

(define-public xapp-ora-thumbnailer
  (package
    (name "xapp-ora-thumbnailer")
    (version "1.2.8")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/linuxmint/xapp-thumbnailers")
                    (commit version)))
              (file-name (git-file-name "xapp-thumbnailers" version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:configure-flags
           #~(list "-Dora=true"
                   "-Dgimp=false"
                   "-Depub=false"
                   "-Dmp3=false"
                   "-Daiff=false"
                   "-Djxl=false"
                   "-Draw=false"
                   "-Dwebp=false")))
    (home-page "https://github.com/linuxmint/xapp-thumbnailers")
    (synopsis "OpenRaster format thumbnailer")
    (description "This thumbnailer generates preview thumbnails for
OpenRaster (.ora) image files used by painting applications such as
GIMP and Krita.")
    (license license:gpl3+)))

;;; ── xapp-gimp-thumbnailer (#1100) ──

(define-public xapp-gimp-thumbnailer
  (package
    (inherit xapp-ora-thumbnailer)
    (name "xapp-gimp-thumbnailer")
    (arguments
     (list #:configure-flags
           #~(list "-Dora=false"
                   "-Dgimp=true"
                   "-Depub=false"
                   "-Dmp3=false"
                   "-Daiff=false"
                   "-Djxl=false"
                   "-Draw=false"
                   "-Dwebp=false")))
    (synopsis "GIMP format thumbnailer")
    (description "This thumbnailer generates preview thumbnails for GIMP
(.xcf) image files, allowing file managers to display previews of GIMP
projects.")))

;;; ── xapp-epub-thumbnailer (#1101) ──

(define-public xapp-epub-thumbnailer
  (package
    (inherit xapp-ora-thumbnailer)
    (name "xapp-epub-thumbnailer")
    (arguments
     (list #:configure-flags
           #~(list "-Dora=false"
                   "-Dgimp=false"
                   "-Depub=true"
                   "-Dmp3=false"
                   "-Daiff=false"
                   "-Djxl=false"
                   "-Draw=false"
                   "-Dwebp=false")))
    (synopsis "ePub format thumbnailer")
    (description "This thumbnailer generates preview thumbnails for ePub
e-book files, extracting cover images for display in file managers.")))

;;; ── xapp-mp3-thumbnailer (#1098) ──

(define-public xapp-mp3-thumbnailer
  (package
    (inherit xapp-ora-thumbnailer)
    (name "xapp-mp3-thumbnailer")
    (arguments
     (list #:configure-flags
           #~(list "-Dora=false"
                   "-Dgimp=false"
                   "-Depub=false"
                   "-Dmp3=true"
                   "-Daiff=false"
                   "-Djxl=false"
                   "-Draw=false"
                   "-Dwebp=false")))
    (synopsis "MP3 album art thumbnailer")
    (description "This thumbnailer extracts embedded album art from MP3
files and generates preview thumbnails for display in file managers.")))

;;; ── xapp-aiff-thumbnailer (#1102) ──

(define-public xapp-aiff-thumbnailer
  (package
    (inherit xapp-ora-thumbnailer)
    (name "xapp-aiff-thumbnailer")
    (arguments
     (list #:configure-flags
           #~(list "-Dora=false"
                   "-Dgimp=false"
                   "-Depub=false"
                   "-Dmp3=false"
                   "-Daiff=true"
                   "-Djxl=false"
                   "-Draw=false"
                   "-Dwebp=false")))
    (synopsis "AIFF audio file thumbnailer")
    (description "This thumbnailer extracts embedded artwork from AIFF
audio files and generates preview thumbnails for display in file
managers.")))
