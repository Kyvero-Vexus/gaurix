;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260423h
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages.
;;;
;;; New recipes (12):
;;;        1.  font-barlow (font-build-system, v1.422, OFL-1.1)
;;;        2.  font-et-book-otf (font-build-system, v20151005, MIT)
;;;        3.  font-et-book-ttf (font-build-system, v20151005, MIT)
;;;        4.  font-et-book-type1 (font-build-system, v20151005, MIT)
;;;        5.  python-jsonpath-python (pyproject-build-system, v1.1.5, MIT)
;;;        6.  python-pyfzf (python-build-system, v0.3.1, MIT)
;;;        7.  python-pdf2image (python-build-system, v1.17.0, MIT)
;;;        8.  python-sqlglot (pyproject-build-system, v28.6.0, MIT)
;;;        9.  python-decouple (python-build-system, v3.8, MIT)
;;;       10.  args-cpp (cmake-build-system, v6.4.8, MIT)
;;;       11.  logiops (cmake-build-system, v0.3.5, GPL-3.0+)
;;;       12.  clipboard-cli (cmake-build-system, v0.10.0, GPL-3.0+)
;;;
;;; ALREADY_IN_GUIX (9):
;;;        1.  ttf-iosevka (#21408) -> font-iosevka v33.3.0
;;;        2.  python-docx (#37907) -> python-docx v1.2.0
;;;        3.  lzfse (#38024) -> lzfse v1.0
;;;        4.  extundelete (#37577) -> extundelete v0.2.4
;;;        5.  powerstat (#37539) -> powerstat v0.04.03
;;;        6.  cpulimit (#37559) -> cpulimit v0.2
;;;        7.  scc (#37592) -> scc v3.3.5
;;;        8.  exercism (#37558) -> exercism v3.5.7
;;;        9.  tree-sitter-json (#38535) -> tree-sitter-json v0.24.8
;;;
;;; BLOCKED EXHAUSTED (9):
;;;        1.  ttf-joypixels -> CUSTOM_LICENSE: proprietary commercial emoji set
;;;        2.  python-virtualenvwrapper -> GUIX_MODEL_CONFLICT: conflicts with Guix profile model
;;;        3.  noti -> GO_VENDORED_DEPS: Go module with vendored dependency tree
;;;        4.  wofi-emoji -> ARCH_SPECIFIC: depends on pacman-style package detection
;;;        5.  lsdesktopf -> DISTRO_SPECIFIC: depends on pacman
;;;        6.  dnsperf -> DEP_MISSING: requires libck (Concurrency Kit) not in Guix
;;;        7.  dosage-tracker -> FLATPAK_ORIENTED: GNOME app designed for Flatpak with org.gnome runtime
;;;        8.  unetbootin -> COMPLEX_DEPS: Qt5 app depending on syslinux/mtools with distro-specific paths
;;;        9.  rapidyaml -> COMPLEX_SUBMODULES: 4 recursive git submodules (c4core/c4fs/cmake/debugbreak)
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Use `guix download` or `guix hash` to obtain real hashes.

(define-module (gaurix packages recipe-resolver-260423h)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system font)
  #:use-module (guix build-system python)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages check)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages image)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages pdf)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages terminals)
  #:use-module (gnu packages textutils)
  #:use-module (gnu packages xorg)
  #:export (
            font-barlow
            font-et-book-otf
            font-et-book-ttf
            font-et-book-type1
            python-jsonpath-python
            python-pyfzf
            python-pdf2image
            python-sqlglot
            python-decouple
            args-cpp
            logiops
            clipboard-cli
            ))

;;; -------------------------------------------------------------------
;;; 1. font-barlow — Barlow grotesk font family
;;; -------------------------------------------------------------------
(define-public font-barlow
  (package
    (name "font-barlow")
    (version "1.422")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/jpt/barlow")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (synopsis "grotesk variable font inspired by California road signs")
    (description
     "Barlow is a slightly rounded, low-contrast, grotesk font superfamily
designed as a tribute to the California road signage and car plate
lettering.  It includes 54 styles across normal, condensed, and
semi-condensed widths in weights from Thin to Black with italics.")
    (home-page "https://tribby.com/fonts/barlow/")
    (license license:silofl1.1)))

;;; -------------------------------------------------------------------
;;; 2. font-et-book-otf — ET Book typeface (OpenType)
;;; -------------------------------------------------------------------
(define-public font-et-book-otf
  (package
    (name "font-et-book-otf")
    (version "20151005")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/edwardtufte/et-book")
                    (commit "2f7de498d0f29d5e2aba8e9f9caa95e64d7b63d7")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((font-dir (string-append (assoc-ref outputs "out")
                                                  "/share/fonts/opentype")))
                     (mkdir-p font-dir)
                     (for-each (lambda (f)
                                 (install-file f font-dir))
                               (find-files "source/otf" "\\.otf$"))))))))
    (synopsis "typeface from Edward Tufte's books (OpenType format)")
    (description
     "ET Book is the typeface used in Edward Tufte's books.  It is a
Bembo-like serif designed for both screen and print reading.  This
package provides the OpenType format files.")
    (home-page "https://edwardtufte.github.io/et-book/")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 3. font-et-book-ttf — ET Book typeface (TrueType)
;;; -------------------------------------------------------------------
(define-public font-et-book-ttf
  (package
    (inherit font-et-book-otf)
    (name "font-et-book-ttf")
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((font-dir (string-append (assoc-ref outputs "out")
                                                  "/share/fonts/truetype")))
                     (mkdir-p font-dir)
                     (for-each (lambda (f)
                                 (install-file f font-dir))
                               (find-files "source/ttf" "\\.ttf$"))))))))
    (synopsis "typeface from Edward Tufte's books (TrueType format)")
    (description
     "ET Book is the typeface used in Edward Tufte's books.  It is a
Bembo-like serif designed for both screen and print reading.  This
package provides the TrueType format files.")))

;;; -------------------------------------------------------------------
;;; 4. font-et-book-type1 — ET Book typeface (Type1/PostScript)
;;; -------------------------------------------------------------------
(define-public font-et-book-type1
  (package
    (inherit font-et-book-otf)
    (name "font-et-book-type1")
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((font-dir (string-append (assoc-ref outputs "out")
                                                  "/share/fonts/type1")))
                     (mkdir-p font-dir)
                     (for-each (lambda (f)
                                 (install-file f font-dir))
                               (find-files "." "\\.(pfb|pfm)$"))))))))
    (synopsis "typeface from Edward Tufte's books (Type1/PostScript format)")
    (description
     "ET Book is the typeface used in Edward Tufte's books.  It is a
Bembo-like serif designed for both screen and print reading.  This
package provides the Type1 PostScript format files.")))

;;; -------------------------------------------------------------------
;;; 5. python-jsonpath-python — JSONPath implementation for Python
;;; -------------------------------------------------------------------
(define-public python-jsonpath-python
  (package
    (name "python-jsonpath-python")
    (version "1.1.5")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "jsonpath-python" version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list python-hatchling))
    (synopsis "JSONPath implementation in modern Python")
    (description
     "jsonpath-python is a more powerful JSONPath implementation that
supports standard JSONPath syntax for querying and extracting data from
JSON documents.  It provides both a Python API and a command-line
interface.")
    (home-page "https://github.com/sean2077/jsonpath-python")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 6. python-pyfzf — Python wrapper for fzf
;;; -------------------------------------------------------------------
(define-public python-pyfzf
  (package
    (name "python-pyfzf")
    (version "0.3.1")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "pyfzf" version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system python-build-system)
    (arguments
     (list #:tests? #f))
    (propagated-inputs (list fzf))
    (synopsis "Python wrapper for the fzf fuzzy finder")
    (description
     "pyfzf is a thin Python wrapper around the fzf command-line fuzzy
finder.  It allows Python programs to present interactive fuzzy selection
menus by invoking fzf as a subprocess.")
    (home-page "https://github.com/nk412/pyfzf")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 7. python-pdf2image — convert PDF pages to images
;;; -------------------------------------------------------------------
(define-public python-pdf2image
  (package
    (name "python-pdf2image")
    (version "1.17.0")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "pdf2image" version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system python-build-system)
    (arguments
     (list #:tests? #f))
    (propagated-inputs (list python-pillow poppler))
    (synopsis "convert PDF pages to PIL image objects")
    (description
     "pdf2image is a Python wrapper around the pdftoppm and pdftocairo
command-line tools from Poppler.  It converts PDF document pages into
PIL Image objects for further processing, display, or saving in various
image formats.")
    (home-page "https://github.com/Belval/pdf2image")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 8. python-sqlglot — SQL parser and transpiler
;;; -------------------------------------------------------------------
(define-public python-sqlglot
  (package
    (name "python-sqlglot")
    (version "28.6.0")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "sqlglot" version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list python-setuptools python-setuptools-scm python-wheel))
    (synopsis "SQL parser, transpiler, optimizer, and engine")
    (description
     "SQLGlot is a no-dependency SQL parser, transpiler, optimizer, and
engine.  It can be used to format SQL or translate between 22 different
dialects like DuckDB, Presto/Trino, Spark/Databricks, Snowflake, and
BigQuery.  It aims to read a wide variety of SQL inputs and output
syntactically and semantically correct SQL in the targeted dialects.")
    (home-page "https://github.com/tobymao/sqlglot")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 9. python-decouple — strict config/code separation
;;; -------------------------------------------------------------------
(define-public python-decouple
  (package
    (name "python-decouple")
    (version "3.8")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "python-decouple" version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system python-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "strict separation of settings from code")
    (description
     "Python Decouple helps you organize your settings so that you can
change parameters without having to redeploy your application.  It
reads configuration from environment variables, @file{.env} files, or
@file{settings.ini} with a unified API and automatic type casting.")
    (home-page "https://github.com/HBNetwork/python-decouple")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 10. args-cpp — header-only C++ argument parser
;;; -------------------------------------------------------------------
(define-public args-cpp
  (package
    (name "args-cpp")
    (version "6.4.8")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Taywee/args")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:configure-flags #~(list "-DARGS_BUILD_EXAMPLE=OFF")))
    (synopsis "simple single-header C++ argument parser library")
    (description
     "args is a simple, small, flexible, single-header C++ argument
parsing library.  It supports positional arguments, flags, value
arguments, subcommands, and argument groups.  The library is
header-only and requires no external dependencies beyond a C++11
compiler.")
    (home-page "https://github.com/Taywee/args")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 11. logiops — unofficial Logitech HID++ driver
;;; -------------------------------------------------------------------
(define-public logiops
  (package
    (name "logiops")
    (version "0.3.5")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/PixlOne/logiops")
                    (commit (string-append "v" version))
                    (recursive? #t)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list (string-append "-DCMAKE_INSTALL_SYSCONFDIR="
                                  #$output "/etc"))))
    (native-inputs (list pkg-config))
    (inputs (list eudev
                  glib
                  libconfig
                  libevdev))
    (synopsis "unofficial userspace driver for Logitech HID++ devices")
    (description
     "LogiOps is an unofficial userspace driver for Logitech mice and
keyboards that use the HID++ protocol (version 2.0 and above).  It
allows configuring buttons, DPI, scroll behavior, and gesture
controls.  It runs as a background daemon and communicates with
devices through hidraw.")
    (home-page "https://github.com/PixlOne/logiops")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 12. clipboard-cli — terminal clipboard manager
;;; -------------------------------------------------------------------
(define-public clipboard-cli
  (package
    (name "clipboard-cli")
    (version "0.10.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Slackadays/Clipboard")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list "-DNO_X11=OFF"
                   "-DNO_WAYLAND=OFF")))
    (native-inputs (list pkg-config))
    (inputs (list alsa-lib
                  libx11
                  wayland
                  wayland-protocols))
    (synopsis "cut, copy, and paste anything in the terminal")
    (description
     "Clipboard (cb) is a versatile clipboard manager for the terminal.
It lets you cut, copy, and paste files, text, and piped data using
simple commands.  It integrates with both X11 and Wayland clipboard
systems and supports persistent clipboard history, multiple named
clipboards, and scriptable pipelines.")
    (home-page "https://getclipboard.app")
    (license license:gpl3+)))
