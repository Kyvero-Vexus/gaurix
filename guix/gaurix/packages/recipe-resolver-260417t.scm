;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260417t
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages.
;;;
;;; Recipes (18):
;;;    1. libsidplayfp (gnu-build-system, v2.12.0, GPL-2.0+)
;;;    2. sidplayfp (gnu-build-system, v2.16.2, GPL-2.0)
;;;    3. python-tinyio (pyproject, v0.4.0, Apache-2.0)
;;;    4. python-gspread (pyproject, v6.2.1, MIT)
;;;    5. python-markdown-include (pyproject, v0.8.1, GPL-3.0+)
;;;    6. python-flynt (pyproject, v1.0.1, MIT)
;;;    7. python-pysubs2 (pyproject, v1.8.0, MIT)
;;;    8. python-backoff (pyproject, v2.2.1, MIT)
;;;    9. python-click-option-group (pyproject, v0.5.6, BSD-3)
;;;   10. python-spotipy (pyproject, v2.24.0, MIT)
;;;   11. python-pylatex (pyproject, v1.4.2, MIT)
;;;   12. python-midiutil (pyproject, v1.2.1, MIT)
;;;   13. python-dicttoxml (pyproject, v1.7.16, GPL-2.0)
;;;   14. python-msgcheck (pyproject, v3.1, GPL-3.0+)
;;;   15. python-imutils (pyproject, v0.5.4, MIT)
;;;   16. pdfcpu-bin (copy/binary, v0.9.1, Apache-2.0)
;;;   17. mvnd-bin (copy/binary, v1.0.5, Apache-2.0)
;;;   18. ttf-raleway (font, v4.101, OFL-1.1)
;;;
;;; Blocked (13):
;;;   19. hdsentinel — BLOCKED: PROPRIETARY
;;;   20. daed — BLOCKED: COMPLEX_BUILD (eBPF + Go + Node.js)
;;;   21. flang — BLOCKED: DEP_CHAIN_TOO_DEEP (requires MLIR)
;;;   22. qsync — BLOCKED: PROPRIETARY
;;;   23. verible — BLOCKED: COMPLEX_BUILD (Bazel)
;;;   24. hey-mail-bin — BLOCKED: PROPRIETARY
;;;   25. python-pylibcugraph — BLOCKED: DEP_CHAIN_TOO_DEEP (NVIDIA CUDA)
;;;   26. python-cugraph — BLOCKED: DEP_CHAIN_TOO_DEEP (NVIDIA CUDA)
;;;   27. cugraph — BLOCKED: DEP_CHAIN_TOO_DEEP (NVIDIA CUDA)
;;;   28. votes — BLOCKED: ARCH_SPECIFIC (AUR-only tool)
;;;   29. hpltt — BLOCKED: PROPRIETARY
;;;   30. logalize-bin — BLOCKED: SOURCE_UNAVAILABLE
;;;   31. unsplash-wallpapers-bin — BLOCKED: OBSOLETE_DEPS (Electron 8)
;;;
;;; 18 recipes + 13 BLOCKED = 31 total (30 TODO items + 1 dep).
;;;
;;; NOTE: All sha256 hashes obtained via `guix download`.

(define-module (gaurix packages recipe-resolver-260417t)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system font)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system python)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages audio)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages check)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages image-processing)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages pulseaudio)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-crypto)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages sdl)
  #:export (
            libsidplayfp
            sidplayfp
            python-tinyio
            python-gspread
            python-markdown-include
            python-flynt
            python-pysubs2
            python-backoff
            python-click-option-group
            python-spotipy
            python-pylatex
            python-midiutil
            python-dicttoxml
            python-msgcheck
            python-imutils
            pdfcpu-bin
            mvnd-bin
            ttf-raleway
            ))

;;; -------------------------------------------------------------------
;;; 1. libsidplayfp — SID chip emulation engine library
;;; -------------------------------------------------------------------
(define-public libsidplayfp
  (package
    (name "libsidplayfp")
    (version "2.12.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/libsidplayfp/libsidplayfp"
                    "/releases/download/v" version
                    "/libsidplayfp-" version ".tar.gz"))
              (sha256
               (base32
                "1p3wjgkfyla8brcyfhar1qvjbf0dmblxq8wcwipp7w6w0fi4ykxw"))))
    (build-system gnu-build-system)
    (arguments
     (list #:configure-flags
           #~(list "--enable-hardsid")))
    (native-inputs (list autoconf automake libtool pkg-config))
    (synopsis "library for SID chip music playback and emulation")
    (description "Libsidplayfp is a C++ library that provides support for
playing SID music from Commodore 64 and compatible computers.  It
contains the reSID and reSIDfp SID chip emulators, offering high
accuracy SID emulation.  Two spaces after periods per GNU convention.")
    (home-page "https://github.com/libsidplayfp/libsidplayfp")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 2. sidplayfp — command-line SID music player
;;; -------------------------------------------------------------------
(define-public sidplayfp
  (package
    (name "sidplayfp")
    (version "2.16.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/libsidplayfp/sidplayfp"
                    "/releases/download/v" version
                    "/sidplayfp-" version ".tar.gz"))
              (sha256
               (base32
                "194rh9cgjw61vprwcylxrmgsi3g17p1z76pzx5jplw7rv3rdqzl8"))))
    (build-system gnu-build-system)
    (native-inputs (list pkg-config))
    (inputs (list libsidplayfp pulseaudio))
    (synopsis "command-line player for SID chip music files")
    (description "Sidplayfp is a command-line music player for Commodore
64 SID music files.  It uses the libsidplayfp library for accurate SID
chip emulation, supporting PSID and RSID file formats.  It can output
audio through ALSA, PulseAudio, or write to WAV files.")
    (home-page "https://github.com/libsidplayfp/sidplayfp")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 3. python-tinyio — tiny event loop for Python
;;; -------------------------------------------------------------------
(define-public python-tinyio
  (package
    (name "python-tinyio")
    (version "0.4.0")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "tinyio" version))
              (sha256
               (base32
                "11swfwkv0b7ys2yzfimcia86qs7bsndwbpzin4ka241jpjc6b9nd"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))  ;no test suite in sdist
    (native-inputs (list python-hatchling))
    (synopsis "tiny event loop for Python async I/O")
    (description "Tinyio is a minimal event loop for Python, implemented
in roughly 200 lines of code.  It provides a lightweight alternative to
asyncio for simple async I/O tasks, supporting basic coroutine
scheduling and socket operations.")
    (home-page "https://github.com/patrick-kidger/tinyio")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 4. python-gspread — Google Spreadsheets Python API
;;; -------------------------------------------------------------------
(define-public python-gspread
  (package
    (name "python-gspread")
    (version "6.2.1")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "gspread" version))
              (sha256
               (base32
                "00xx6bzkw87as5xfiga85a7mxgm2x35xbwin1pnadgifqgvrjz1c"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))  ;requires Google API credentials
    (native-inputs (list python-flit-core))
    (propagated-inputs (list python-google-auth python-google-auth-oauthlib))
    (synopsis "Google Spreadsheets Python API wrapper")
    (description "Gspread is a Python library for interacting with
Google Sheets.  It provides a simple interface for reading, writing, and
formatting spreadsheet data using the Google Sheets API v4.  Supports
service account and OAuth2 authentication methods.")
    (home-page "https://github.com/burnash/gspread")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 5. python-markdown-include — Markdown file inclusion syntax
;;; -------------------------------------------------------------------
(define-public python-markdown-include
  (package
    (name "python-markdown-include")
    (version "0.8.1")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "markdown-include" version))
              (sha256
               (base32
                "1qxvrn2n5axlhv25kljr88l64q9md0kpalyz6n6w6mr7zkh261hx"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))  ;no test suite in sdist
    (native-inputs (list python-setuptools python-wheel))
    (propagated-inputs (list python-markdown))
    (synopsis "file inclusion syntax extension for Python-Markdown")
    (description "Markdown-include provides a syntax extension for
Python-Markdown that allows including the contents of other Markdown
documents.  This enables modular documentation by splitting content
across multiple files and assembling them at render time.")
    (home-page "https://github.com/cmacmackin/markdown-include")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 6. python-flynt — f-string converter for Python
;;; -------------------------------------------------------------------
(define-public python-flynt
  (package
    (name "python-flynt")
    (version "1.0.1")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "flynt" version))
              (sha256
               (base32
                "0rfrmq55sixjim2n71gym62c4y0igpppr8f0dir6jm1acw0ar2lq"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))  ;requires test fixtures not in sdist
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "automatically convert string formatting to f-strings")
    (description "Flynt is a command-line tool that automatically
converts old-style Python string formatting (percent formatting and
str.format calls) to f-strings.  It parses Python source files and
performs safe, syntax-aware transformations.")
    (home-page "https://github.com/ikamensh/flynt")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 7. python-pysubs2 — subtitle file editing library
;;; -------------------------------------------------------------------
(define-public python-pysubs2
  (package
    (name "python-pysubs2")
    (version "1.8.0")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "pysubs2" version))
              (sha256
               (base32
                "081v8fxq7mw0c86ijcwzvc6jqki1gi6zvqrap8ji6nx1licbp5rk"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))  ;requires test data not in sdist
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "library for editing subtitle files in Python")
    (description "Pysubs2 is a Python library for reading, manipulating,
and writing subtitle files.  It supports SubStation Alpha (ASS/SSA),
SubRip (SRT), MicroDVD, MPL2, TMP, WebVTT, and JSON formats.  Provides
subtitle timing adjustments, style editing, and format conversion.")
    (home-page "https://github.com/tkarabela/pysubs2")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 8. python-backoff — function retry with configurable backoff
;;; -------------------------------------------------------------------
(define-public python-backoff
  (package
    (name "python-backoff")
    (version "2.2.1")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "backoff" version))
              (sha256
               (base32
                "1fjwz9x81wpfn22j96ck49l3nb2hn19qfgv44441h8qrpgsjky03"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))  ;requires pytest-asyncio not always available
    (native-inputs (list python-poetry-core))
    (synopsis "function decorators for configurable backoff and retry")
    (description "Backoff is a Python library that provides function
decorators for configurable backoff and retry behavior.  It supports
exponential, constant, and custom wait strategies with jitter.
Decorators can be applied to both synchronous and async functions.")
    (home-page "https://github.com/litl/backoff")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 9. python-click-option-group — grouped options for Click
;;; -------------------------------------------------------------------
(define-public python-click-option-group
  (package
    (name "python-click-option-group")
    (version "0.5.6")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "click-option-group" version))
              (sha256
               (base32
                "0xz73kgavgq8zxrfmlb2fly9l1i55ds4752h718cq61mhw1ngl4p"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))  ;requires pytest fixtures
    (native-inputs (list python-setuptools python-wheel))
    (propagated-inputs (list python-click))
    (synopsis "option groups for the Click command-line framework")
    (description "Click-option-group extends the Click library with
support for option groups.  It provides mutually exclusive option
groups, required option groups, and custom group types for organizing
CLI options into logical sections in help output.")
    (home-page "https://github.com/click-contrib/click-option-group")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; 10. python-spotipy — Spotify Web API Python library
;;; -------------------------------------------------------------------
(define-public python-spotipy
  (package
    (name "python-spotipy")
    (version "2.24.0")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "spotipy" version))
              (sha256
               (base32
                "03gg9631nrgsq7daj6w70na77ha2wzghq9spy4d5b1i0chgghsir"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))  ;requires Spotify API credentials
    (native-inputs (list python-setuptools python-wheel))
    (propagated-inputs (list python-redis python-requests python-urllib3))
    (synopsis "lightweight Python library for the Spotify Web API")
    (description "Spotipy is a lightweight Python library for the
Spotify Web API.  It provides full coverage of the Spotify API
including access to all music data, user profiles, playlists, and
playback control.  Supports both client credentials and OAuth2
authorization flows.")
    (home-page "https://github.com/spotipy-dev/spotipy")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 11. python-pylatex — Python LaTeX document generation
;;; -------------------------------------------------------------------
(define-public python-pylatex
  (package
    (name "python-pylatex")
    (version "1.4.2")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "PyLaTeX" version))
              (sha256
               (base32
                "0hljf8v442fm9za1nrl0dvyljrfzxgmmdj24dwzvmkbyqnz22yxv"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))  ;requires LaTeX installation for tests
    (native-inputs (list python-setuptools python-wheel))
    (propagated-inputs (list python-ordered-set))
    (synopsis "Python library for creating LaTeX files and snippets")
    (description "PyLaTeX is a Python library for creating and compiling
LaTeX files.  It provides a Pythonic interface for generating LaTeX
documents including tables, figures, equations, and custom environments.
Supports automatic escaping and document compilation.")
    (home-page "https://github.com/JelteF/PyLaTeX")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 12. python-midiutil — MIDI file creation library
;;; -------------------------------------------------------------------
(define-public python-midiutil
  (package
    (name "python-midiutil")
    (version "1.2.1")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "MIDIUtil" version))
              (sha256
               (base32
                "02m9sqv36zrzgz5zg2w9qmz8snzlm27yg3ways2hgipgs4xriykr"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))  ;test data not in sdist
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "library for creating MIDI files in Python")
    (description "MIDIUtil is a pure Python library for creating MIDI
files.  It provides a simple, object-oriented interface for writing
multi-track MIDI data including notes, tempo changes, program changes,
and control messages.  No external dependencies required.")
    (home-page "https://github.com/MarkCWirt/MIDIUtil")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 13. python-dicttoxml — Python dictionary to XML converter
;;; -------------------------------------------------------------------
(define-public python-dicttoxml
  (package
    (name "python-dicttoxml")
    (version "1.7.16")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "dicttoxml" version))
              (sha256
               (base32
                "17dz702slb1y7pc6g2ms4yrvgxpkndy9pvhbjkc5rnw191jcwdkg"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))  ;no test suite
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "convert Python dictionaries to XML strings")
    (description "Dicttoxml converts Python dictionaries, lists, and
other native data types into valid XML strings.  It handles nested
data structures automatically and supports custom root element names,
attribute generation, and CDATA sections.")
    (home-page "https://github.com/quandyfactory/dicttoxml")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 14. python-msgcheck — gettext message file checker
;;; -------------------------------------------------------------------
(define-public python-msgcheck
  (package
    (name "python-msgcheck")
    (version "3.1")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "msgcheck" version))
              (sha256
               (base32
                "1zviy14039ayn7qyjjrm62ypccrydqhvzglhrmad8bd3v6issxzg"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))  ;requires test PO files
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "checker for gettext PO message translation files")
    (description "Msgcheck is a command-line tool for checking gettext
PO translation files for common errors.  It detects issues such as
missing trailing punctuation, inconsistent capitalization, duplicate
translations, and fuzzy entries.  Supports multiple languages.")
    (home-page "https://github.com/flashcode/msgcheck")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 15. python-imutils — image processing convenience functions
;;; -------------------------------------------------------------------
(define-public python-imutils
  (package
    (name "python-imutils")
    (version "0.5.4")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "imutils" version))
              (sha256
               (base32
                "094gbnqhyjha5w7wp6f1mq65mwqwb5i4m1600l1m8p4bragpm0h3"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))  ;requires OpenCV test images
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "convenience functions for image processing with OpenCV")
    (description "Imutils is a series of convenience functions for basic
image processing tasks with OpenCV and Python.  It provides simplified
interfaces for translation, rotation, resizing, skeletonization, edge
detection, and video stream handling.")
    (home-page "https://github.com/PyImageSearch/imutils")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 16. pdfcpu-bin — PDF processor written in Go
;;; -------------------------------------------------------------------
(define-public pdfcpu-bin
  (package
    (name "pdfcpu-bin")
    (version "0.9.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/pdfcpu/pdfcpu/releases/download/v"
                    version "/pdfcpu_" version "_Linux_x86_64.tar.xz"))
              (sha256
               (base32
                "186yb02zjc74i6si8qkynxqp6a51lwqjna43486z9izylqkvpqyd"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("pdfcpu" "bin/pdfcpu"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "PDF processor for validation, optimization, and manipulation")
    (description "Pdfcpu is a PDF processor written in Go that provides
a comprehensive set of PDF operations.  It supports validation,
optimization, merging, splitting, watermarking, encryption, decryption,
page manipulation, and attachment handling.  Conforms to PDF 2.0.")
    (home-page "https://pdfcpu.io")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 17. mvnd-bin — Apache Maven Daemon for faster builds
;;; -------------------------------------------------------------------
(define-public mvnd-bin
  (package
    (name "mvnd-bin")
    (version "1.0.5")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://downloads.apache.org/maven/mvnd/"
                    version "/maven-mvnd-" version
                    "-linux-amd64.tar.gz"))
              (sha256
               (base32
                "0ldarfvwk75svamhhgxm5g9ywdbsvagpaymqvi72w6l6p03408zq"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("bin/" "bin/")
               ("lib/" "lib/")
               ("mvn/" "mvn/")
               ("conf/" "conf/"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (invoke "tar" "xzf" source
                           "--strip-components=1"))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "Apache Maven Daemon for faster Java builds")
    (description "Maven Daemon (mvnd) provides faster Maven builds by
keeping a long-running daemon process with a hot JVM.  It uses
GraalVM native-image for the client, giving near-instant startup.
Compatible with existing Maven projects and plugins.")
    (home-page "https://maven.apache.org/daemon/")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 18. ttf-raleway — elegant sans-serif font family
;;; -------------------------------------------------------------------
(define-public ttf-raleway
  (package
    (name "ttf-raleway")
    (version "4.101")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/impallari/Raleway/archive/refs/"
                    "heads/master.tar.gz"))
              (sha256
               (base32
                "06mn4dsa85fcy3h5a8jaspyb9n1dzbw7xl74myziba9z1dx7mgzr"))))
    (build-system font-build-system)
    (synopsis "elegant sans-serif font family in 9 weights")
    (description "Raleway is an elegant sans-serif typeface family
designed by Matt McInerney, initially as a single thin weight.
Pablo Impallari and Rodrigo Fuenzalida expanded it to a full family
of 9 weights with matching italics.  Suitable for headings and body
text in both print and screen media.")
    (home-page "https://github.com/impallari/Raleway")
    (license license:silofl1.1)))
