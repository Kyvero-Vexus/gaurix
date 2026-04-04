;;; Queue drain 2026-04-04 daily run batch 1.
;;; Attempted 100 TODO-status entries from todo_general_packages.org.
;;; Status: 6 new package recipes validated; 94 blocked with reason codes.
(define-module (gaurix packages queue-20260404-daily1)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix build-system python)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages xml)
  #:export (
            python-bidi
            python-cobble
            python-mammoth
            python-youtube-transcript-api
            crudini
            python-vapor-steam
            ))

(define-public python-bidi
  (package
    (name "python-bidi")
    (version "0.6.7")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "python_bidi" version))
       (sha256
        (base32 "0hcv4dbci1zcb96nsn0cbsznsa064gzs56sxvrspj4qf3h46a061"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))  ; requires Rust build tooling (maturin)
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://github.com/MichaReiser/python-bidi")
    (synopsis "Python Bidi layout wrapping the Rust unicode-bidi crate")
    (description
     "Python-bidi provides bidirectional text layout support by wrapping
the Rust unicode-bidi crate.")
    (license license:lgpl3+)))

(define-public python-cobble
  (package
    (name "python-cobble")
    (version "0.1.4")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "cobble" version))
       (sha256
        (base32 "1akqz9yn085jl8g4cb0rw8dzk9c5qhbhfqv9wl38lb4r74avwf6y"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))  ; no test suite in sdist
    (native-inputs (list python-setuptools python-wheel))
    (home-page "http://github.com/mwilliamson/python-cobble")
    (synopsis "Create data objects in Python")
    (description
     "Cobble provides utilities for creating simple data objects in Python.")
    (license license:bsd-2)))

(define-public python-mammoth
  (package
    (name "python-mammoth")
    (version "1.12.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "mammoth" version))
       (sha256
        (base32 "1m9xldhqdxxjas0kfrpxaq3l52yl5s7ynfnya2snfc8pv5amm58h"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))  ; test suite requires test fixtures not in sdist
    (propagated-inputs (list python-cobble))
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://github.com/mwilliamson/python-mammoth")
    (synopsis "Convert Word documents from docx to HTML and Markdown")
    (description
     "Mammoth converts Word documents (.docx) into simple, clean HTML and
Markdown, focusing on semantic content rather than exact visual reproduction.")
    (license license:bsd-2)))

(define-public python-youtube-transcript-api
  (package
    (name "python-youtube-transcript-api")
    (version "1.2.4")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "youtube_transcript_api" version))
       (sha256
        (base32 "1kfx0cb2jlgz0b1azg44bgsg9ks3w54ivrffcyfmkprmlfb0wbdp"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))  ; tests require network access
    (propagated-inputs (list python-requests python-defusedxml))
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://github.com/jdepoix/youtube-transcript-api")
    (synopsis "Python API to get YouTube video transcripts")
    (description
     "This package provides a Python API to retrieve transcripts and subtitles
for YouTube videos, including automatically generated subtitles and
translated subtitles, without requiring a headless browser.")
    (license license:expat)))

(define-public crudini
  (package
    (name "crudini")
    (version "0.9.6")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "crudini" version))
       (sha256
        (base32 "053bbsq7cjlm5mndg0bd5l69y466xl9a68fq94a7m19k10d33by2"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))  ; tests require iniparse which is vendored
    (propagated-inputs (list python-iniparse))
    (native-inputs (list python-setuptools python-wheel))
    (home-page "http://github.com/pixelb/crudini")
    (synopsis "Utility for manipulating ini files")
    (description
     "Crudini is a command-line utility for manipulating ini files, allowing
get, set, delete, and merge operations on ini file sections and parameters.")
    (license license:gpl2)))

(define-public python-vapor-steam
  (package
    (name "python-vapor-steam")
    (version "1.7.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "vapor_steam" version))
       (sha256
        (base32 "1fwnk2pgkb0p96k4awhjvkazvnhcg45gqk6y677ri35ap7s3ikgl"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))  ; no test suite in sdist
    (propagated-inputs (list python-aiohttp python-platformdirs python-textual))
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://github.com/TabulateJarl8/vapor-steam")
    (synopsis "TUI program to check ProtonDB compatibility of Steam games")
    (description
     "Vapor is a TUI program that checks the ProtonDB compatibility rating
of all the games in a Steam user's library.")
    (license license:gpl3)))
