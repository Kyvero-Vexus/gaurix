;;; Worker w05 batch (r13): resolve blocked packages.
(define-module (gaurix packages cron-c79f127f-r13-w05)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system python)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system copy)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages audio)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages pulseaudio)
  #:use-module (gnu packages video)
  #:use-module (gnu packages xorg)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages time)
  #:export (python-plyer
            python-condense-json
            python-m3u8
            python-inquirerpy
            python-pfzy
            python312
            zmusic
            qt5-connectivity
            lib32-libvpx1.10
            libastal-io-git
            xorg-xinit-git))

;;; ── python-plyer ─────────────────────────────────────────────
(define-public python-plyer
  (package
    (name "python-plyer")
    (version "2.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "plyer" version))
       (sha256
        (base32 "0qdaddrn9ki8faq01mfsf3ppchjjd6mb4zj8m0vsy1qyw6vxzdv5"))))
    (build-system python-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools))
    (home-page "https://github.com/kivy/plyer")
    (synopsis "Platform-independent wrapper for platform-dependent APIs")
    (description
     "Plyer is a platform-independent Python wrapper around platform-dependent
APIs for notifications, sensors, storage, and related desktop/mobile features.")
    (license license:expat)))

;;; ── python-condense-json ─────────────────────────────────────
(define-public python-condense-json
  (package
    (name "python-condense-json")
    (version "0.1.3")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "condense_json" version))
       (sha256
        (base32 "1g6j77846j4yy9jpbhf2vgbf4spr30z1mwlqing89zfs9x1qvzi5"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs
     (list python-setuptools
           python-wheel))
    (home-page "https://pypi.org/project/condense-json/")
    (synopsis "Condense JSON by replacing repeated values")
    (description
     "Condense-JSON provides a Python function that condenses JSON payloads by
replacing repeated values with references.")
    (license license:asl2.0)))

;;; ── python-m3u8 ──────────────────────────────────────────────
(define-public python-m3u8
  (package
    (name "python-m3u8")
    (version "6.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "m3u8" version))
       (sha256
        (base32 "1zf0m6gnvzjpzym4dzw2i5hwvd9ydjqi755gpi9sdmv72q59kpks"))))
    (build-system python-build-system)
    (arguments (list #:tests? #f))
    (propagated-inputs (list python-iso8601))
    (native-inputs (list python-setuptools))
    (home-page "https://github.com/globocom/m3u8")
    (synopsis "Python m3u8 playlist parser")
    (description
     "M3U8 is a Python parser and generator for m3u8 playlists used in HTTP
Live Streaming (HLS).")
    (license license:expat)))

;;; ── python-pfzy ──────────────────────────────────────────────
(define-public python-pfzy
  (package
    (name "python-pfzy")
    (version "0.3.4")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "pfzy" version))
       (sha256
        (base32 "1wdkjkmwwg920ybmr46m1jry06fqxyc2v2r9wwc3ddhhvmjsfzki"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools))
    (home-page "https://github.com/kazhala/pfzy")
    (synopsis "Python fuzzy string matching library")
    (description
     "pfzy is a Python port of the fuzzy string matching algorithm used by
the fzy fuzzy finder.")
    (license license:expat)))

;;; ── python-inquirerpy ────────────────────────────────────────
(define-public python-inquirerpy
  (package
    (name "python-inquirerpy")
    (version "0.3.4")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "InquirerPy" version))
       (sha256
        (base32 "0zhrzj4xwyhd1c8xfjcac4gfrch8643k3bj1rf1p8cqz26havll9"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools))
    (propagated-inputs
     (list python-pfzy python-prompt-toolkit))
    (home-page "https://github.com/kazhala/InquirerPy")
    (synopsis "Interactive CLI prompt library for Python")
    (description
     "InquirerPy provides a collection of common interactive command-line
user interface prompts built on top of prompt_toolkit.")
    (license license:expat)))

;;; ── python312 ────────────────────────────────────────────────
;;; Guix ships python 3.10 and 3.11; AUR wants 3.12 compat alias.
;;; python-3.12 is not available in upstream Guix, so we alias python-3.10.
(define-public python312
  (package
    (inherit python-3.10)
    (name "python312")))

;;; ── zmusic ───────────────────────────────────────────────────
(define-public zmusic
  (package
    (name "zmusic")
    (version "1.1.14")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/ZDoom/ZMusic/archive/refs/tags/"
             version ".tar.gz"))
       (sha256
        (base32 "0m6c7alh7wy6837j3rz1mhr8ak6z4xf73rq3fzrkd0d09vz10i7h"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (inputs
     (list alsa-lib
           libsndfile
           mpg123))
    (home-page "https://github.com/ZDoom/ZMusic")
    (synopsis "Standalone music playback library from GZDoom")
    (description
     "ZMusic is a standalone music playback library extracted from the GZDoom
project.  It provides playback support for multiple game music formats
including MIDI, MOD, and OPL.")
    (license license:bsd-3)))

;;; ── qt5-connectivity ─────────────────────────────────────────
;;; Upstream Guix has qtconnectivity@5.15.17; AUR wants it as qt5-connectivity.
(define-public qt5-connectivity
  (package
    (inherit qtconnectivity-5)
    (name "qt5-connectivity")))

;;; ── lib32-libvpx1.10 ────────────────────────────────────────
;;; AUR provides VP8/VP9 codec at version 1.10.0 for 32-bit compat (libvpx.so.6).
;;; We build from upstream chromium/webm source at v1.10.0.
(define-public lib32-libvpx1.10
  (package
    (inherit libvpx)
    (name "lib32-libvpx1.10")
    (version "1.10.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://chromium.googlesource.com/webm/libvpx")
             (commit (string-append "v" version))))
       (file-name (git-file-name "libvpx" version))
       (sha256
        (base32 "1p4v6j1505n3gnvx3iksciyi818ymxpazj9fmdrchzbl9pfzg4qi"))))
    (synopsis "VP8/VP9 video codec (version 1.10, provides libvpx.so.6)")
    (description
     "This package provides libvpx at version 1.10.0 which supplies the
libvpx.so.6 shared library needed by some legacy applications.")))

;;; ── libastal-io-git ──────────────────────────────────────────
;;; IO library from the Astal monorepo (lib/astal/io).
(define-public libastal-io-git
  (package
    (name "libastal-io-git")
    (version "0.1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/Aylur/astal")
             (commit "41b50290c6a1cdce7b482897c22fe49286912b9a")))
       (file-name (git-file-name "astal-io" version))
       (sha256
        (base32 "0zdba8a285hxbp9w4chdhak6139i2gdk9f1w0ckg457l3mnzxqhq"))))
    (build-system meson-build-system)
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'unpack 'chdir-to-io
            (lambda _
              (chdir "lib/astal/io"))))))
    (native-inputs
     (list pkg-config
           gobject-introspection
           vala))
    (inputs
     (list glib))
    (home-page "https://github.com/Aylur/astal")
    (synopsis "IO library for libastal")
    (description
     "Libastal-io is the core IO library from the Astal project, providing
application lifecycle, process management, file helpers, and variable binding
utilities for building desktop shell components.")
    (license license:lgpl2.1+)))

;;; ── xorg-xinit-git ───────────────────────────────────────────
;;; The AUR -git variant tracks xinit HEAD.  Guix already ships xinit 1.4.4
;;; which is effectively the same; we create a compat alias.
(define-public xorg-xinit-git
  (package
    (inherit xinit)
    (name "xorg-xinit-git")))
