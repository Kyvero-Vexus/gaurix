;;; Round-22 resolution for blocked-tree run cron-c79f127f worker w03.
;;; 37 total recipes (6 original + 31 new NEEDS_RECIPE_DESIGN Python packages).
;;; Original: python-pid, deb2targz, libjodycode, notify-send.sh, ttf-gabarito,
;;;   libticables.
;;; New NEEDS_RECIPE_DESIGN: python-confu, python-tmpl, python-pluginmgr,
;;;   python-vodka, python-graphsrv, python-pytest-filedata, python-bencode-py,
;;;   python-desktop-entry-lib, python-htmlgenerator, python-stupidartnet,
;;;   python-aiolifx, python-markovify, python-eyed3, python-openrgb,
;;;   python-vdf, python-cinemagoer, python-soco, python-powerline-gitstatus,
;;;   python-exa-py, python-aiohttp-jinja2, python-materialyoucolor3,
;;;   python-zftools, python-xeddsa, python-glean-parser, python-diwire,
;;;   python-samplerate, python-imagebackup, python-pricehist,
;;;   python-discord-py, python-fleep, python-condense-json.
;;; Helper deps packaged: python-curlify.
(define-module (gaurix packages cron-c79f127f-r22-w03)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system python)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system font)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-crypto)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages python-science)
  #:use-module (gnu packages python-check)
  #:use-module (gnu packages xml)
  #:use-module (gnu packages databases)
  #:use-module (gnu packages image)
  #:use-module (gnu packages check)
  #:use-module (gnu packages libffi)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages web)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages libusb)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages pkg-config)
  #:use-module (gaurix packages cron-c79f127f-r8-w02)
  #:export (python-pid
            deb2targz
            libjodycode
            notify-send.sh
            ttf-gabarito
            libticables
            python-confu
            python-tmpl
            python-pluginmgr
            python-vodka
            python-graphsrv
            python-pytest-filedata
            python-bencode-py
            python-desktop-entry-lib
            python-htmlgenerator
            python-stupidartnet
            python-aiolifx
            python-markovify
            python-eyed3
            python-openrgb
            python-vdf
            python-cinemagoer
            python-soco
            python-powerline-gitstatus
            python-exa-py
            python-aiohttp-jinja2
            python-materialyoucolor3
            python-zftools
            python-xeddsa
            python-glean-parser
            python-diwire
            python-samplerate
            python-imagebackup
            python-curlify
            python-pricehist
            python-discord-py
            python-fleep
            python-condense-json))

;;; ================================================================
;;; Original round-22 w03 packages (6)
;;; ================================================================

;;;
;;; 1. python-pid — PID file management with stale detection
;;;
(define-public python-pid
  (package
    (name "python-pid")
    (version "3.0.4")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "pid" version))
       (sha256
        (base32 "0rpbagc6dql98q5gaprp9a6ifirjkih3mr1212xkx8znhc76fcqf"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))                  ;no test suite in sdist
    (native-inputs
     (list python-setuptools python-wheel))
    (home-page "https://github.com/trbs/pid")
    (synopsis "PID file management with stale detection and locking")
    (description
     "The pid library provides a decorator and context manager for managing PID
files.  It features automatic stale PID detection and file-level locking to
prevent multiple instances of the same process from running simultaneously.")
    (license license:asl2.0)))

;;;
;;; 2. deb2targz — Convert Debian .deb packages to .tar.gz
;;;
(define-public deb2targz
  (package
    (name "deb2targz")
    (version "0.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://www.miketaylor.org.uk/tech/deb/deb2targz")
       (sha256
        (base32 "0jx4fs76v0fmwinjh9s9x2g3v5yhrslvhfcy36sxdacqn2fk35zm"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("deb2targz" "bin/deb2targz"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'unpack 'unpack-source
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "deb2targz")
              (chmod "deb2targz" #o755)))
          (add-after 'unpack-source 'patch-shebang
            (lambda* (#:key inputs #:allow-other-keys)
              (substitute* "deb2targz"
                (("#!/usr/bin/perl")
                 (string-append "#!" (search-input-file inputs "bin/perl")))))))))
    (inputs (list perl))
    (home-page "https://www.miketaylor.org.uk/tech/deb/")
    (synopsis "Convert Debian .deb packages to .tar.gz archives")
    (description
     "deb2targz is a Perl script that converts Debian Linux @file{.deb} package
files into standard @file{.tar.gz} archives, making their contents accessible
on non-Debian systems.")
    (license license:public-domain)))

;;;
;;; 3. libjodycode — Shared library used by jdupes and other Jody Bruchon tools
;;;
(define-public libjodycode
  (package
    (name "libjodycode")
    (version "4.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://codeberg.org/jbruchon/libjodycode/archive/v"
             version ".tar.gz"))
       (sha256
        (base32 "1x3zyi0bhg1znd57dcpcg1llx55nlrcb5rs26kmi9hz0j6jms257"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f                         ;no test suite
      #:make-flags
      #~(list (string-append "PREFIX=" #$output)
              (string-append "CC=" #$(cc-for-target)))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure))))          ;no configure script
    (home-page "https://codeberg.org/jbruchon/libjodycode")
    (synopsis "Shared code library used by jdupes and related utilities")
    (description
     "libjodycode is a shared library that provides common code used by several
utilities written by Jody Bruchon, including jdupes (duplicate file finder),
jc_calcsize, and winregfs.  It provides string handling, path operations, and
other utility functions.")
    (license license:expat)))

;;;
;;; 4. notify-send.sh — Drop-in replacement for notify-send
;;;
(define-public notify-send.sh
  (package
    (name "notify-send.sh")
    (version "1.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/vlevit/notify-send.sh/archive/v"
             version ".tar.gz"))
       (sha256
        (base32 "1ca47481gkfxy0fs42xg0vsgqnsfvsz35d2wkk25bipgvbfalimf"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("notify-send.sh" "bin/notify-send.sh")
          ("notify-action.sh" "bin/notify-action.sh"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'wrap-scripts
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let ((bin (string-append (assoc-ref outputs "out") "/bin"))
                    (gdbus (search-input-file inputs "bin/gdbus")))
                (for-each
                 (lambda (script)
                   (wrap-program (string-append bin "/" script)
                     `("PATH" prefix
                       (,(dirname gdbus)))))
                 '("notify-send.sh" "notify-action.sh"))))))))
    (inputs (list glib))
    (home-page "https://github.com/vlevit/notify-send.sh")
    (synopsis "Drop-in replacement for notify-send with more features")
    (description
     "notify-send.sh is a drop-in replacement for @command{notify-send} that
uses @command{gdbus} to communicate with the notification daemon.  It supports
replacing and closing existing notifications by ID, and executing actions via
the companion @command{notify-action.sh} script.")
    (license license:gpl3+)))

;;;
;;; 5. ttf-gabarito — Geometric sans typeface
;;;
(define-public ttf-gabarito
  (package
    (name "ttf-gabarito")
    (version "1.000")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/naipefoundry/gabarito/archive/v"
             version ".tar.gz"))
       (sha256
        (base32 "1vkmibgj8fpsz68kd1x2z2w9n49dhn6zlglhc1dqw5ic3sfpi04a"))))
    (build-system font-build-system)
    (home-page "https://github.com/naipefoundry/gabarito")
    (synopsis "Light-hearted geometric sans typeface")
    (description
     "Gabarito is a geometric sans-serif typeface designed by Naipe Foundry,
featuring 6 weights from regular to extra-bold.  It is well-suited for
headlines and display text with its friendly, approachable character.")
    (license license:silofl1.1)))

;;;
;;; 6. libticables — TI calculator link cable library
;;;
(define-public libticables
  (package
    (name "libticables")
    (version "1.3.5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "mirror://sourceforge/tilp/tilp2-linux/tilp2-1.18/"
             "libticables2-" version ".tar.bz2"))
       (sha256
        (base32 "08j5di0cgix9vcpdv7b8xhxdjkk9zz7fqfnv3l4apk3jdr8vcvqc"))))
    (build-system gnu-build-system)
    (arguments
     (list #:configure-flags
           #~(list "--enable-libusb10")))
    (native-inputs
     (list autoconf automake libtool pkg-config))
    (inputs
     (list libusb glib))
    (home-page "http://lpg.ticalc.org/prj_tilp/")
    (synopsis "Communication library for TI calculator link cables")
    (description
     "libticables is a library that provides support for operations on TI
calculator link cables.  It is part of the TILP (TI Linking Program) suite and
handles low-level USB and serial communication with Texas Instruments graphing
calculators through various cable types.")
    (license license:gpl2+)))

;;; ================================================================
;;; New NEEDS_RECIPE_DESIGN resolutions — Python/PyPI packages (31)
;;; ================================================================

;;;
;;; 7. python-confu — Configuration validation and generation
;;;
(define-public python-confu
  (package
    (name "python-confu")
    (version "1.9.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "confu" version))
       (sha256
        (base32 "11rbrllpsdksr0qygbv5flc21lymhm4m3rril7ybzk2fy4n1v4mw"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (propagated-inputs (list python-munge))
    (home-page "https://github.com/20c/confu")
    (synopsis "Configuration file validation and generation")
    (description
     "confu provides tools for validating and generating configuration files
from schemas.  It supports multiple formats and integrates with the munge
data-munging library.")
    (license license:asl2.0)))

;;;
;;; 8. python-tmpl — Template engine abstraction
;;;
(define-public python-tmpl
  (package
    (name "python-tmpl")
    (version "1.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "tmpl" version))
       (sha256
        (base32 "0jmsrxi5s0mgk4ckxl25fghhvvkhsfqkrfclwhd377lwccrlw5ll"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://github.com/20c/tmpl")
    (synopsis "Template abstraction for multiple template engines")
    (description
     "tmpl provides a unified abstraction layer for using multiple template
engine backends (such as Jinja2 or Django templates) within the same
codebase.")
    (license license:asl2.0)))

;;;
;;; 9. python-pluginmgr — Lightweight plugin system
;;;
(define-public python-pluginmgr
  (package
    (name "python-pluginmgr")
    (version "1.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "pluginmgr" version))
       (sha256
        (base32 "1m14l16dmb0n8zj6jvjyjmxk8sm0zybnyph4rrwlw8k13197hkzb"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (propagated-inputs (list python-munge))
    (home-page "https://github.com/20c/pluginmgr")
    (synopsis "Lightweight Python plugin system with config inheritance")
    (description
     "pluginmgr is a lightweight Python plugin framework that supports
configuration inheritance.  It simplifies loading and managing plugins in
applications.")
    (license license:asl2.0)))

;;;
;;; 10. python-vodka — Plugin-based web service daemon
;;;
(define-public python-vodka
  (package
    (name "python-vodka")
    (version "3.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "vodka" version))
       (sha256
        (base32 "17k2axpwnnwxrgaciad1qsd5a5llin1j941vkigqz3fzw2nr4x9n"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (propagated-inputs
     (list python-click python-munge python-pluginmgr python-tmpl))
    (home-page "https://github.com/20c/vodka")
    (synopsis "Plugin based real-time web service daemon")
    (description
     "vodka is a plugin-based framework for building real-time web service
daemons.  It integrates with the 20c ecosystem (munge, pluginmgr, tmpl)
for configuration and templating.")
    (license license:asl2.0)))

;;;
;;; 11. python-graphsrv — Embeddable graph server
;;;
(define-public python-graphsrv
  (package
    (name "python-graphsrv")
    (version "2.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "graphsrv" version))
       (sha256
        (base32 "0c5pq9fgygvdjpd0j5v7hix1qvl3zdbgb2lmrw8f5fyv5azmid0i"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (propagated-inputs (list python-vodka python-jinja2 python-flask))
    (home-page "https://github.com/20c/graphsrv")
    (synopsis "Serve embeddable graphs")
    (description
     "graphsrv is a web service for serving embeddable graphs, built on top of
Flask, Jinja2, and the vodka plugin framework.")
    (license license:asl2.0)))

;;;
;;; 12. python-pytest-filedata — Load test data from files
;;;
(define-public python-pytest-filedata
  (package
    (name "python-pytest-filedata")
    (version "1.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "pytest-filedata" version))
       (sha256
        (base32 "00qd2z9iq9pd1yn9gqjsvpgk9iklra88b031b5r9g5z25s1n4bmr"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (propagated-inputs (list python-decorator))
    (home-page "https://github.com/20c/pytest-filedata")
    (synopsis "Pytest plugin to easily load test data from files")
    (description
     "pytest-filedata is a pytest plugin that provides fixtures for loading
test data from external files, simplifying data-driven tests.")
    (license license:asl2.0)))

;;;
;;; 13. python-bencode-py — Bencode parser
;;;
(define-public python-bencode-py
  (package
    (name "python-bencode-py")
    (version "4.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "bencode.py" version))
       (sha256
        (base32 "0p70lsi504wn15x6xfwrlbm5k0qkc0rbdl4k11jim9952zdcq91a"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://github.com/fuzeman/bencode.py")
    (synopsis "Simple bencode parser for Python")
    (description
     "bencode.py is a simple, pure-Python bencode encoder and decoder.  Bencode
is the encoding used by the BitTorrent protocol for storing and
transmitting loosely structured data.")
    (license license:bsd-3)))

;;;
;;; 14. python-desktop-entry-lib — Library for .desktop files
;;;
(define-public python-desktop-entry-lib
  (package
    (name "python-desktop-entry-lib")
    (version "5.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "desktop_entry_lib" version))
       (sha256
        (base32 "0r5q2i4nbn4wcghcypgbwrbfv5n01bn1zr2n2c123zhr32n1nqls"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://codeberg.org/JakobDev/desktop-entry-lib")
    (synopsis "Library for working with .desktop files")
    (description
     "desktop-entry-lib is a Python library for reading, writing, and
manipulating freedesktop.org @file{.desktop} entry files as used by
Linux desktop environments.")
    (license license:bsd-2)))

;;;
;;; 15. python-htmlgenerator — Declarative HTML templating
;;;
(define-public python-htmlgenerator
  (package
    (name "python-htmlgenerator")
    (version "1.2.32")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "htmlgenerator" version))
       (sha256
        (base32 "14r77ha9p1nq3raz9d9g6a0lqlxk3rqnzqmly3mvz040r411g6zw"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://github.com/basxsoftwareassociation/htmlgenerator")
    (synopsis "Declarative HTML templating with lazy rendering")
    (description
     "htmlgenerator provides a declarative, composable API for generating HTML
in Python.  It supports lazy rendering, allowing the construction of
reusable UI component trees.")
    (license license:bsd-3)))

;;;
;;; 16. python-stupidartnet — Art-Net protocol implementation
;;;
(define-public python-stupidartnet
  (package
    (name "python-stupidartnet")
    (version "1.6.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "stupidArtnet" version))
       (sha256
        (base32 "0i8qq9w8svg9cc42643wmmv1bsds1ncnyz9rw0y6dhk2nv80qk0f"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://github.com/cpvalente/stupidArtnet")
    (synopsis "Simple implementation of the Art-Net protocol")
    (description
     "stupidArtnet is a lightweight Python implementation of the Art-Net DMX
protocol.  It allows sending DMX data over a network to control lighting
fixtures and other Art-Net devices.")
    (license license:expat)))

;;;
;;; 17. python-aiolifx — Async LIFX device control
;;;
(define-public python-aiolifx
  (package
    (name "python-aiolifx")
    (version "1.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "aiolifx" version))
       (sha256
        (base32 "1irjr8cwsyhjfr4k3q2s1qa906g8v1vwp32w80mlanfwn4z8mkc7"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (propagated-inputs
     (list python-async-timeout python-bitstring python-ifaddr))
    (home-page "http://github.com/aiolifx/aiolifx")
    (synopsis "Async API for LIFX smart lights over LAN")
    (description
     "aiolifx provides an asyncio-based API for local communication with LIFX
smart lights.  It supports device discovery, state querying, and control
over a local network without cloud services.")
    (license license:expat)))

;;;
;;; 18. python-markovify — Markov chain text generator
;;;
(define-public python-markovify
  (package
    (name "python-markovify")
    (version "0.9.4")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "markovify" version))
       (sha256
        (base32 "0fgydnhqg22dggayl5dmf3dwkgizh4qh3wifwgnnpfslxmba3h7a"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (home-page "http://github.com/jsvine/markovify")
    (synopsis "Simple, extensible Markov chain text generator")
    (description
     "markovify is a simple, extensible Markov chain generator for building
text models from corpora and generating random, semi-plausible sentences.
It supports combining models and custom text processing.")
    (license license:expat)))

;;;
;;; 19. python-eyed3 — MP3 ID3 tag library
;;;
(define-public python-eyed3
  (package
    (name "python-eyed3")
    (version "0.9.9")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "eyed3" version))
       (sha256
        (base32 "0fraqqd6ja2zdy48xw26wmv2l105symkpvzgyrkcljiq36pgmbx8"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (propagated-inputs (list python-filetype python-deprecation))
    (home-page "https://eyed3.readthedocs.io")
    (synopsis "Python audio data toolkit for ID3 and MP3")
    (description
     "eyeD3 is a Python tool for working with audio files, specifically MP3
files containing ID3 metadata (i.e.@: song info).  It provides both a
command-line tool and a Python library for reading and writing ID3 tags.")
    (license license:gpl3+)))

;;;
;;; 20. python-openrgb — Python client for OpenRGB
;;;
(define-public python-openrgb
  (package
    (name "python-openrgb")
    (version "0.3.6")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "openrgb-python" version))
       (sha256
        (base32 "16sniljjk52y6wfdjnyk3wmlzvqlj4vad6i7fhf0m08f3brg5a7k"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://github.com/jath03/openrgb-python")
    (synopsis "Python client for the OpenRGB SDK")
    (description
     "openrgb-python is a Python client for the OpenRGB SDK, allowing
programmatic control of RGB lighting devices managed by OpenRGB.")
    (license license:gpl3)))

;;;
;;; 21. python-vdf — Valve Data Format parser
;;;
(define-public python-vdf
  (package
    (name "python-vdf")
    (version "3.4")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "vdf" version))
       (sha256
        (base32 "1bz2gn04pl6rj2mawlzlirz1ygg4rdypq0pxbyg018873vs1jm7x"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://github.com/ValvePython/vdf")
    (synopsis "Library for Valve's VDF text format")
    (description
     "vdf is a Python library for reading and writing Valve's KeyValues
(VDF/VMT) text format used across Valve products including Steam and
Source engine games.")
    (license license:expat)))

;;;
;;; 22. python-cinemagoer — IMDb database access
;;;
(define-public python-cinemagoer
  (package
    (name "python-cinemagoer")
    (version "2023.5.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "cinemagoer" version))
       (sha256
        (base32 "1whq3fa39v3kd7cxgdnirbg8xl8rd9av3r8iixhh2rslwrxdgqaw"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (propagated-inputs (list python-sqlalchemy python-lxml))
    (home-page "https://cinemagoer.github.io/")
    (synopsis "Python package to access the IMDb database")
    (description
     "Cinemagoer (formerly IMDbPY) is a Python package for retrieving and
managing data from the IMDb movie database.  It can fetch data from both
the IMDb web pages and a local database copy.")
    (license license:gpl2+)))

;;;
;;; 23. python-soco — Sonos controller library
;;;
(define-public python-soco
  (package
    (name "python-soco")
    (version "0.31.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "soco" version))
       (sha256
        (base32 "17yqkyqpglzj42bm75j0w1fakakfglix7j23k0svji2x7gmpj8np"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (propagated-inputs
     (list python-requests python-xmltodict python-ifaddr python-appdirs
           python-lxml))
    (home-page "https://github.com/SoCo/SoCo")
    (synopsis "Sonos Controller library for Python")
    (description
     "SoCo (Sonos Controller) is a library for controlling Sonos speakers from
Python.  It supports device discovery, playback control, queue management,
and access to music services.")
    (license license:expat)))

;;;
;;; 24. python-powerline-gitstatus — Git status for Powerline
;;;
(define-public python-powerline-gitstatus
  (package
    (name "python-powerline-gitstatus")
    (version "1.3.3")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "powerline_gitstatus" version))
       (sha256
        (base32 "05hfkav10zzqax3nq685ks63jym8pf1q5nj6g2yhjjk5gna4wi0y"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://github.com/jaspernbrouwer/powerline-gitstatus")
    (synopsis "Powerline segment for Git working copy status")
    (description
     "powerline-gitstatus is a Powerline segment that shows the status of the
current Git working copy in your shell prompt, including branch name,
staged/unstaged changes, and untracked files.")
    (license license:expat)))

;;;
;;; 25. python-exa-py — Exa search API client
;;;
(define-public python-exa-py
  (package
    (name "python-exa-py")
    (version "2.11.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "exa_py" version))
       (sha256
        (base32 "14zw87d24y9skrjvhm6vdw10dfx448ay2w6bi2z6vbisv35h74cq"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (propagated-inputs (list python-httpx python-requests))
    (home-page "https://github.com/exa-labs/exa-py")
    (synopsis "Python SDK for the Exa search API")
    (description
     "exa-py is the official Python SDK for the Exa API, a neural search engine.
It provides methods for searching, finding similar content, and retrieving
web page contents.")
    (license license:expat)))

;;;
;;; 26. python-aiohttp-jinja2 — Jinja2 for aiohttp
;;;
(define-public python-aiohttp-jinja2
  (package
    (name "python-aiohttp-jinja2")
    (version "1.6")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "aiohttp-jinja2" version))
       (sha256
        (base32 "1qmh37k5p4f0nq2qshqd4faj9dv10zyvniz5i8pabg75ci9gz9x3"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (propagated-inputs (list python-aiohttp python-jinja2))
    (home-page "https://github.com/aio-libs/aiohttp_jinja2/")
    (synopsis "Jinja2 template renderer for aiohttp.web")
    (description
     "aiohttp-jinja2 integrates Jinja2 templates with aiohttp.web, providing
template rendering support for aiohttp web applications.")
    (license license:asl2.0)))

;;;
;;; 27. python-materialyoucolor3 — Material You color algorithms
;;;
(define-public python-materialyoucolor3
  (package
    (name "python-materialyoucolor3")
    (version "3.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "materialyoucolor" version))
       (sha256
        (base32 "08p8hpwcs8ycma400dasvs1a45j6i0120s074g1k41yw4fp95j72"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (propagated-inputs (list python-pillow))
    (home-page "https://github.com/T-Dynamos/materialyoucolor-python")
    (synopsis "Material You color generation in pure Python")
    (description
     "materialyoucolor implements Google's Material You dynamic color
generation algorithms in pure Python.  It extracts dominant colors from
images and generates full Material You color palettes.")
    (license license:expat)))

;;;
;;; 28. python-zftools — Zero forcing set computation
;;;
(define-public python-zftools
  (package
    (name "python-zftools")
    (version "1.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "zftools" version))
       (sha256
        (base32 "0a1mv2xnjlgw0jli3i25f4dprjxx8wwvn8kg61cmqadsfd18vqcq"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://github.com/alexhutman/zftools")
    (synopsis "Find the zero forcing set of graphs")
    (description
     "zftools provides algorithms for computing zero forcing sets and zero
forcing numbers of graphs, a concept from combinatorial graph theory.")
    (license license:expat)))

;;;
;;; 29. python-xeddsa — XEdDSA signature bindings
;;;
(define-public python-xeddsa
  (package
    (name "python-xeddsa")
    (version "1.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "XEdDSA" version))
       (sha256
        (base32 "0f3vzvwmck16q3ywxbj7d9axm37yicmgy24blq6r0ciqmgvas7ms"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (propagated-inputs (list python-cffi))
    (home-page "https://github.com/Syndace/python-xeddsa")
    (synopsis "Python bindings to libxeddsa")
    (description
     "XEdDSA provides Python bindings to the XEdDSA signature scheme, which
allows creating EdDSA-compatible signatures using X25519/X448 keys.  This
is used in the Signal protocol.")
    (license license:expat)))

;;;
;;; 30. python-glean-parser — Mozilla Glean telemetry parser
;;;
(define-public python-glean-parser
  (package
    (name "python-glean-parser")
    (version "19.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "glean_parser" version))
       (sha256
        (base32 "1czlrg5igab6ag2cdpviba20y0m26jg4wkaff2m0szmynr50lbmv"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (propagated-inputs
     (list python-click python-diskcache python-jinja2 python-jsonschema
           python-platformdirs python-pyyaml))
    (home-page "https://mozilla.github.io/glean")
    (synopsis "Parser tools for Mozilla's Glean telemetry")
    (description
     "glean-parser provides command-line tools and a Python library for parsing
and validating Mozilla Glean telemetry metric definitions, and for
generating code to collect those metrics.")
    (license license:mpl2.0)))

;;;
;;; 31. python-diwire — Dependency injection container
;;;
(define-public python-diwire
  (package
    (name "python-diwire")
    (version "1.3.2")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "diwire" version))
       (sha256
        (base32 "0dbqgm4cmshmx3f4qb8ziiqhzqjwpwap8sbx7kvx4x0zbzci1d11"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://github.com/maksimzayats/diwire")
    (synopsis "Lightweight type-safe dependency injection container")
    (description
     "diwire is a lightweight, type-safe dependency injection container for
Python with automatic wiring and support for scopes.")
    (license license:expat)))

;;;
;;; 32. python-samplerate — libsamplerate wrapper
;;;
(define-public python-samplerate
  (package
    (name "python-samplerate")
    (version "0.2.4")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "samplerate" version))
       (sha256
        (base32 "0zdc7668xn0j72dmxb8hwyy5y33szkqa32sq6s7ny940wrpwnkf4"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (propagated-inputs (list python-numpy))
    (home-page "https://github.com/tuxu/python-samplerate")
    (synopsis "Python wrapper for libsamplerate")
    (description
     "python-samplerate provides a monolithic Python wrapper for libsamplerate,
a high-quality sample rate conversion library, based on pybind11 and
NumPy.")
    (license license:expat)))

;;;
;;; 33. python-imagebackup — Backup image reader
;;;
(define-public python-imagebackup
  (package
    (name "python-imagebackup")
    (version "0.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "imagebackup" version))
       (sha256
        (base32 "1j0aqyvjk9y6vqplchyza6vpcdp574wd12maq0b6c18km162h3sd"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (propagated-inputs (list python-lz4 python-tqdm))
    (home-page "https://github.com/joergmlpts/imagebackup")
    (synopsis "Read partclone and partimage backup images")
    (description
     "imagebackup is a Python package for reading partclone, partimage, and
ntfsclone backup images.  It provides utilities for extracting and
mounting backup images.")
    (license license:expat)))

;;;
;;; 34. python-curlify — Convert requests to curl commands (helper dep)
;;;
(define-public python-curlify
  (package
    (name "python-curlify")
    (version "3.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "curlify" version))
       (sha256
        (base32 "04m41ijbl6c32g1jdylp18gs4bclq1241iqw791s7nr4r7rqyj3v"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (propagated-inputs (list python-requests))
    (home-page "https://github.com/ofw/curlify")
    (synopsis "Convert Python requests to cURL commands")
    (description
     "curlify converts Python @code{requests} prepared request objects to
equivalent cURL command strings, useful for debugging HTTP requests.")
    (license license:expat)))

;;;
;;; 35. python-pricehist — Historical price data fetcher
;;;
(define-public python-pricehist
  (package
    (name "python-pricehist")
    (version "1.4.14")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "pricehist" version))
       (sha256
        (base32 "116fjbmkw5ckd9y621g6gz6g16sk55j9x2yxi65g1z3rwjx9ihv4"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (propagated-inputs
     (list python-requests python-lxml python-cssselect python-curlify))
    (home-page "https://gitlab.com/chrisberkhout/pricehist")
    (synopsis "Fetch and format historical price data")
    (description
     "pricehist fetches historical price data from multiple sources and formats
it for use with plain text accounting tools like Beancount and Ledger.")
    (license license:expat)))

;;;
;;; 36. python-discord-py — Discord API wrapper
;;;
(define-public python-discord-py
  (package
    (name "python-discord-py")
    (version "2.7.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "discord_py" version))
       (sha256
        (base32 "1nj929j1351if3bbchgvr715vljhnpb9v2hlk15jw59manjfdm94"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (propagated-inputs (list python-aiohttp))
    (home-page "https://github.com/Rapptz/discord.py")
    (synopsis "Python wrapper for the Discord API")
    (description
     "discord.py is a modern, easy-to-use, feature-rich, and async-ready API
wrapper for the Discord API, written in Python.")
    (license license:expat)))

;;;
;;; 37. python-fleep — File format determination
;;;
(define-public python-fleep
  (package
    (name "python-fleep")
    (version "1.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "fleep" version))
       (sha256
        (base32 "0k0h3pilc271s55a4q0a7zy21479g3rg7l8ydizlsdp5iqjjpxn8"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://github.com/floyernick/fleep")
    (synopsis "File format determination library")
    (description
     "fleep is a Python library for determining file types by examining
their magic bytes (file signatures).  It supports recognition of over
100 file formats.")
    (license license:expat)))

;;;
;;; 38. python-condense-json — JSON condensing utility
;;;
(define-public python-condense-json
  (package
    (name "python-condense-json")
    (version "0.1.3")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "condense-json" version))
       (sha256
        (base32 "1g6j77846j4yy9jpbhf2vgbf4spr30z1mwlqing89zfs9x1qvzi5"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://github.com/simonw/condense-json")
    (synopsis "Condense JSON using replacement strings")
    (description
     "condense-json provides a Python function for condensing JSON data by
replacing repeated structures with shorter placeholder strings, useful
for reducing token usage with large language models.")
    (license license:asl2.0)))
