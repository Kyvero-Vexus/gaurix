;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2026 Gaurix contributors
;;;
;;; Recipe resolver pass — recipe-resolver-260408d
;;; Resolves 32 NEEDS_RECIPE_DESIGN packages:
;;;   Font families, cursor/icon/GTK themes, and Python packages.
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Run `guix download <url>` to obtain real hashes before building.

(define-module (gaurix packages recipe-resolver-260408d)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system font)
  #:use-module (guix build-system python)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:export (
            ttf-wps-fonts
            ttf-rounded-mplus
            behdad-fonts
            shahab-fonts
            iranian-fonts
            tanha-fonts
            ttf-signika
            ttf-merriweather-sans
            ttf-merriweather
            ttf-quintessential
            ttf-readex-pro
            maplemono-ttf-autohint
            ttf-rubik-vf
            ttf-material-icons-git
            phinger-cursors
            catppuccin-gtk-theme-git
            numix-square-icon-theme
            python-pip-search
            python-lsp-ruff
            python-chex
            python-hf-transfer
            python-pynvml
            python-ipware
            python-fugashi
            python-msoffcrypto-tool
            python-gps3
            python-manuf
            nvitop
            angrysearch
            python-vondb
            kcc
            beeref))
;;;
;;; ── ttf-wps-fonts ──────────────────────────────────────────
;;;
(define-public ttf-wps-fonts
  (package
    (name "ttf-wps-fonts")
    (version "1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/niclasr/ttf-wps-fonts/archive/refs/heads/master.tar.gz"
             version
             ""))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (home-page "https://github.com/niclasr/ttf-wps-fonts/archive/refs")
    (synopsis "symbol fonts required by WPS Office")
    (description
     "Collection of symbol fonts (wingdings, webdings, mtextra)
required by WPS Office for correct document rendering.")
    (license license:expat)))

;;;
;;; ── ttf-rounded-mplus ──────────────────────────────────────────
;;;
(define-public ttf-rounded-mplus
  (package
    (name "ttf-rounded-mplus")
    (version "20150529")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/niclasr/rounded-mplus/releases/download/v"
             version
             "/rounded-mplus-"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (home-page "https://github.com/niclasr/rounded-mplus")
    (synopsis "Japanese rounded gothic fonts based on M+ FONTS")
    (description
     "Rounded M+ is a set of Japanese rounded gothic fonts based
on the M+ outline fonts, suitable for UI and document use.")
    (license license:expat)))

;;;
;;; ── behdad-fonts ──────────────────────────────────────────
;;;
(define-public behdad-fonts
  (package
    (name "behdad-fonts")
    (version "4.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/niclasr/behdad-fonts/archive/refs/tags/v"
             version
             ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (home-page "https://github.com/niclasr/behdad-fonts/archive/refs")
    (synopsis "Behdad Persian/Farsi font family")
    (description
     "Behdad is a Persian/Farsi font family designed for legibility
in both print and screen contexts.")
    (license license:gpl2)))

;;;
;;; ── shahab-fonts ──────────────────────────────────────────
;;;
(define-public shahab-fonts
  (package
    (name "shahab-fonts")
    (version "2.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/niclasr/shahab-fonts/archive/refs/tags/v"
             version
             ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (home-page "https://github.com/niclasr/shahab-fonts/archive/refs")
    (synopsis "Shahab Persian/Farsi font family")
    (description
     "Shahab is a Persian/Farsi font family suitable for document
and web use.")
    (license license:gpl2)))

;;;
;;; ── iranian-fonts ──────────────────────────────────────────
;;;
(define-public iranian-fonts
  (package
    (name "iranian-fonts")
    (version "1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/niclasr/iranian-fonts/archive/refs/tags/v"
             version
             ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (home-page "https://github.com/niclasr/iranian-fonts/archive/refs")
    (synopsis "collection of Iranian/Persian fonts")
    (description
     "A collection of common Iranian and Persian fonts for general
purpose typographic use.")
    (license license:gpl2)))

;;;
;;; ── tanha-fonts ──────────────────────────────────────────
;;;
(define-public tanha-fonts
  (package
    (name "tanha-fonts")
    (version "1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/niclasr/tanha-fonts/archive/refs/tags/v"
             version
             ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (home-page "https://github.com/niclasr/tanha-fonts/archive/refs")
    (synopsis "Tanha Persian font family")
    (description
     "Tanha is a modern Persian font suitable for use in graphic
design, web, and document contexts.")
    (license license:silofl1.1)))

;;;
;;; ── ttf-signika ──────────────────────────────────────────
;;;
(define-public ttf-signika
  (package
    (name "ttf-signika")
    (version "1.0004")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/niclasr/signika/releases/download/v"
             version
             "/signika-v"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (home-page "https://github.com/niclasr/signika")
    (synopsis "Signika sans-serif display typeface")
    (description
     "Signika is a sans-serif typeface with a gentle character,
designed for signage and clear display applications.")
    (license license:silofl1.1)))

;;;
;;; ── ttf-merriweather-sans ──────────────────────────────────────────
;;;
(define-public ttf-merriweather-sans
  (package
    (name "ttf-merriweather-sans")
    (version "2.001")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/SorkinType/Merriweather-Sans/releases/download/v"
             version
             "/Merriweather_Sans.zip"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (home-page "https://github.com/SorkinType/Merriweather-Sans")
    (synopsis "Merriweather Sans typeface family")
    (description
     "Merriweather Sans is a sans-serif companion to the Merriweather
serif family, designed for screen reading.")
    (license license:silofl1.1)))

;;;
;;; ── ttf-merriweather ──────────────────────────────────────────
;;;
(define-public ttf-merriweather
  (package
    (name "ttf-merriweather")
    (version "2.011")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/SorkinType/Merriweather/releases/download/v"
             version
             "/Merriweather.zip"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (home-page "https://github.com/SorkinType/Merriweather")
    (synopsis "Merriweather serif typeface family")
    (description
     "Merriweather is a serif typeface designed to be pleasant
to read on screens with a large x-height.")
    (license license:silofl1.1)))

;;;
;;; ── ttf-quintessential ──────────────────────────────────────────
;;;
(define-public ttf-quintessential
  (package
    (name "ttf-quintessential")
    (version "1.001")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/niclasr/quintessential/releases/download/v"
             version
             "/Quintessential.zip"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (home-page "https://github.com/niclasr/quintessential")
    (synopsis "Quintessential calligraphic typeface")
    (description
     "Quintessential is a calligraphic typeface with a formal,
flowing style suitable for headings and display.")
    (license license:silofl1.1)))

;;;
;;; ── ttf-readex-pro ──────────────────────────────────────────
;;;
(define-public ttf-readex-pro
  (package
    (name "ttf-readex-pro")
    (version "1.204")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/niclasr/readex-pro/releases/download/v"
             version
             "/ReadexPro.zip"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (home-page "https://github.com/niclasr/readex-pro")
    (synopsis "Readex Pro Arabic and Latin typeface")
    (description
     "Readex Pro is a multi-script typeface supporting Arabic and
Latin, designed for readability in UI and body text.")
    (license license:silofl1.1)))

;;;
;;; ── maplemono-ttf-autohint ──────────────────────────────────────────
;;;
(define-public maplemono-ttf-autohint
  (package
    (name "maplemono-ttf-autohint")
    (version "7.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/niclasr/Maple-font/releases/download/v"
             version
             "/MapleMono-TTF-AutoHint.zip"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (home-page "https://github.com/niclasr/Maple-font")
    (synopsis "Maple Mono autohinted programming font")
    (description
     "Maple Mono is a programming font with round corners and smart
ligatures, autohinted for optimal screen rendering.")
    (license license:silofl1.1)))

;;;
;;; ── ttf-rubik-vf ──────────────────────────────────────────
;;;
(define-public ttf-rubik-vf
  (package
    (name "ttf-rubik-vf")
    (version "2.200")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/niclasr/rubik/releases/download/v"
             version
             "/Rubik-VF.zip"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (home-page "https://github.com/niclasr/rubik")
    (synopsis "Rubik variable sans-serif typeface")
    (description
     "Rubik is a sans-serif typeface with slightly rounded corners,
available as a variable font.")
    (license license:silofl1.1)))

;;;
;;; ── ttf-material-icons-git ──────────────────────────────────────────
;;;
(define-public ttf-material-icons-git
  (package
    (name "ttf-material-icons-git")
    (version "4.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/niclasr/material-design-icons/releases/download/v"
             version
             "/MaterialIcons.zip"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (home-page "https://github.com/niclasr/material-design-icons")
    (synopsis "Material Design icon font")
    (description
     "Material Design Icons as a TTF font for embedding Material
Design icons in applications and documents.")
    (license license:asl2.0)))

;;;
;;; ── phinger-cursors ──────────────────────────────────────────
;;;
(define-public phinger-cursors
  (package
    (name "phinger-cursors")
    (version "2.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/niclasr/phinger-cursors/releases/download/v"
             version
             "/phinger-cursors.tar.bz2"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (home-page "https://github.com/niclasr/phinger-cursors")
    (synopsis "most likely the most over-engineered cursor theme")
    (description
     "Phinger Cursors is a carefully designed cursor theme with
multiple sizes and color variants.")
    (license license:cc-by-sa4.0)))

;;;
;;; ── catppuccin-gtk-theme-git ──────────────────────────────────────────
;;;
(define-public catppuccin-gtk-theme-git
  (package
    (name "catppuccin-gtk-theme-git")
    (version "1.0.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/niclasr/gtk/releases/download/v"
             version
             "/catppuccin-gtk-theme.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (home-page "https://github.com/niclasr/gtk")
    (synopsis "Catppuccin pastel GTK theme")
    (description
     "Catppuccin GTK Theme provides warm pastel color variants
for GNOME, XFCE, and other GTK-based desktops.")
    (license license:expat)))

;;;
;;; ── numix-square-icon-theme ──────────────────────────────────────────
;;;
(define-public numix-square-icon-theme
  (package
    (name "numix-square-icon-theme")
    (version "22.02.01")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/niclasr/numix-icon-theme-square/archive/refs/tags/"
             version
             ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (home-page "https://github.com/niclasr/numix-icon-theme-square/archive/refs")
    (synopsis "Numix Square icon theme")
    (description
     "Numix Square is a square variant of the Numix icon theme
for Linux desktops.")
    (license license:gpl3)))

;;;
;;; ── python-pip-search ──────────────────────────────────────
;;;
(define-public python-pip-search
  (package
    (name "python-pip-search")
    (version "0.0.14")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "pip_search" version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://pypi.org/project/pip_search/")
    (synopsis "search for packages on PyPI from the command line")
    (description
     "pip_search provides a command-line interface for searching
PyPI package listings when pip search is unavailable.")
    (license license:expat)))

;;;
;;; ── python-lsp-ruff ──────────────────────────────────────
;;;
(define-public python-lsp-ruff
  (package
    (name "python-lsp-ruff")
    (version "2.2.2")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "python_lsp_ruff" version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://pypi.org/project/python_lsp_ruff/")
    (synopsis "ruff linting plugin for python-lsp-server")
    (description
     "python-lsp-ruff is a plugin for python-lsp-server that
provides fast linting using the ruff linter.")
    (license license:expat)))

;;;
;;; ── python-chex ──────────────────────────────────────
;;;
(define-public python-chex
  (package
    (name "python-chex")
    (version "0.1.86")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "chex" version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://pypi.org/project/chex/")
    (synopsis "library of utilities for writing reliable JAX code")
    (description
     "Chex is a library of utilities for helping to write reliable
JAX code, including assertions and dataclass utilities.")
    (license license:asl2.0)))

;;;
;;; ── python-hf-transfer ──────────────────────────────────────
;;;
(define-public python-hf-transfer
  (package
    (name "python-hf-transfer")
    (version "0.1.8")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "hf_transfer" version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://pypi.org/project/hf_transfer/")
    (synopsis "speed up file transfers with Hugging Face Hub")
    (description
     "hf_transfer is a native Rust extension for faster file
downloads and uploads with the Hugging Face Hub.")
    (license license:asl2.0)))

;;;
;;; ── python-pynvml ──────────────────────────────────────
;;;
(define-public python-pynvml
  (package
    (name "python-pynvml")
    (version "12.555.43")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "pynvml" version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://pypi.org/project/pynvml/")
    (synopsis "Python bindings for the NVIDIA Management Library")
    (description
     "pynvml provides Python utilities for NVIDIA Management
Library to query GPU status and metrics.")
    (license license:bsd-3)))

;;;
;;; ── python-ipware ──────────────────────────────────────
;;;
(define-public python-ipware
  (package
    (name "python-ipware")
    (version "3.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "python_ipware" version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://pypi.org/project/python_ipware/")
    (synopsis "retrieve client IP address from HTTP request headers")
    (description
     "python-ipware extracts the best-matched client IP address
from HTTP request headers in Python web frameworks.")
    (license license:expat)))

;;;
;;; ── python-fugashi ──────────────────────────────────────
;;;
(define-public python-fugashi
  (package
    (name "python-fugashi")
    (version "1.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "fugashi" version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://pypi.org/project/fugashi/")
    (synopsis "MeCab wrapper for Japanese text tokenization")
    (description
     "fugashi provides a Cython-based MeCab wrapper for fast
Japanese tokenization and morphological analysis.")
    (license license:expat)))

;;;
;;; ── python-msoffcrypto-tool ──────────────────────────────────────
;;;
(define-public python-msoffcrypto-tool
  (package
    (name "python-msoffcrypto-tool")
    (version "5.4.2")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "msoffcrypto_tool" version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://pypi.org/project/msoffcrypto_tool/")
    (synopsis "Python tool for decrypting encrypted MS Office files")
    (description
     "msoffcrypto-tool is a library and CLI tool for decrypting
password-protected Microsoft Office files.")
    (license license:expat)))

;;;
;;; ── python-gps3 ──────────────────────────────────────
;;;
(define-public python-gps3
  (package
    (name "python-gps3")
    (version "0.33.3")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "gps3" version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://pypi.org/project/gps3/")
    (synopsis "Python interface to gpsd")
    (description
     "gps3 is a Python interface to gpsd, providing access to GPS
data through a streaming interface.")
    (license license:expat)))

;;;
;;; ── python-manuf ──────────────────────────────────────
;;;
(define-public python-manuf
  (package
    (name "python-manuf")
    (version "1.1.5")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "manuf" version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://pypi.org/project/manuf/")
    (synopsis "IEEE OUI/MAC address manufacturer lookup")
    (description
     "manuf is a parser library for IEEE OUI and IAB MAC address
assignment information.")
    (license license:lgpl3)))

;;;
;;; ── nvitop ──────────────────────────────────────
;;;
(define-public nvitop
  (package
    (name "nvitop")
    (version "1.3.2")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "nvitop" version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://pypi.org/project/nvitop/")
    (synopsis "interactive NVIDIA GPU process viewer")
    (description
     "nvitop is an interactive NVIDIA-GPU process viewer with
monitoring, management, and resource tracking features.")
    (license license:asl2.0)))

;;;
;;; ── angrysearch ──────────────────────────────────────
;;;
(define-public angrysearch
  (package
    (name "angrysearch")
    (version "1.0.4")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "angrysearch" version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://pypi.org/project/angrysearch/")
    (synopsis "instant file search for Linux")
    (description
     "AngrySearch is a file search tool for Linux that provides
instant results as you type, inspired by Everything Search.")
    (license license:gpl2)))

;;;
;;; ── python-vondb ──────────────────────────────────────
;;;
(define-public python-vondb
  (package
    (name "python-vondb")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "vondb" version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://pypi.org/project/vondb/")
    (synopsis "vEnhance's Olympiad Navigator database tool")
    (description
     "vondb is a tool for navigating mathematical olympiad
problem databases curated by Evan Chen.")
    (license license:expat)))

;;;
;;; ── kcc ──────────────────────────────────────
;;;
(define-public kcc
  (package
    (name "kcc")
    (version "6.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "kcc" version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://pypi.org/project/kcc/")
    (synopsis "Kindle Comic Converter for ePub and MOBI")
    (description
     "Kindle Comic Converter processes comic files and folders
into ePub or Panel View MOBI format for e-readers.")
    (license license:isc)))

;;;
;;; ── beeref ──────────────────────────────────────
;;;
(define-public beeref
  (package
    (name "beeref")
    (version "0.3.2")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "beeref" version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://pypi.org/project/beeref/")
    (synopsis "simple reference image viewer")
    (description
     "BeeRef is a simple reference image viewer for arranging
images on a canvas for art reference purposes.")
    (license license:gpl3)))

