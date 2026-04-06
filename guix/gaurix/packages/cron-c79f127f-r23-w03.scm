;;; Round-23 resolution for blocked-tree run cron-c79f127f worker w03.
;;; 30 new recipes: all Python packages resolved from NEEDS_RECIPE_DESIGN stubs.
;;; +1 dependency (python-jdatetime) packaged to support python-clox.
(define-module (gaurix packages cron-c79f127f-r23-w03)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix build-system python)
  #:use-module (guix build-system pyproject)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages time)
  #:use-module (gaurix packages cron-c79f127f-r22-w03)
  #:use-module ((guix licenses) #:prefix license:)
  #:export (python-pipe
            python-simple-term-menu
            python-cmapy
            python-fleep
            python-uploadserver
            python-isocodes
            python-types-mock
            python-questionary
            python-requirements-parser
            python-frontmatter
            python-deepl
            python-javalang
            psrecord
            coccigrep
            git-delete-merged-branches
            python-rich-rst
            python-pyrgg
            python-samila
            python-polyfactory
            cmake-format
            ndeftool
            python-pybeam
            python-kajson
            python-niquests
            python-clox
            python-findlibs
            python-ensurepath
            python-zipremove
            python-iterfzf
            python-xxh
            python-jdatetime))

;; ── dependency: python-jdatetime ─────────────────────────────────────
;; Needed by python-clox.

(define-public python-jdatetime
  (package
    (name "python-jdatetime")
    (version "5.2.0")
    (source (origin (method url-fetch) (uri (pypi-uri "jdatetime" version))
       (sha256 (base32 "0lgm4k1gvb5isvlhsp3yfl60n8ykp3w76anflc4vd0kvf6c5h7f8"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://github.com/slashmili/python-jalali")
    (synopsis "Jalali (Persian/Iranian) date and datetime for Python")
    (description "jdatetime provides Jalali (Persian) calendar date and datetime
objects compatible with Python's standard datetime module.")
    (license license:psfl)))

;; ── 1. python-pipe ──────────────────────────────────────────────────

(define-public python-pipe
  (package
    (name "python-pipe")
    (version "2.2")
    (source (origin (method url-fetch) (uri (pypi-uri "pipe" version))
       (sha256 (base32 "0393970599dsrz1dp7bsna1qbkkbb1v268m4y3x2ym5wwfc329ba"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://github.com/JulienPalard/Pipe")
    (synopsis "Infix programming toolkit using shell-like pipe syntax")
    (description "Pipe enables a shell-like infix syntax in Python using the @code{|}
operator, allowing functional-style chaining of itertools operations.")
    (license license:expat)))

;; ── 2. python-simple-term-menu ──────────────────────────────────────

(define-public python-simple-term-menu
  (package
    (name "python-simple-term-menu")
    (version "1.6.6")
    (source (origin (method url-fetch) (uri (pypi-uri "simple-term-menu" version))
       (sha256 (base32 "14rq72xvy00cq22c1b8jhcvp3726i3nb36am18h2vmj9axpx64wq"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://github.com/IngoMeyer441/simple-term-menu")
    (synopsis "Simple interactive terminal menu for Python")
    (description "simple-term-menu creates interactive menus in the terminal with
keyboard navigation, search, and multi-select support.")
    (license license:expat)))

;; ── 3. python-cmapy ────────────────────────────────────────────────

(define-public python-cmapy
  (package
    (name "python-cmapy")
    (version "0.6.6")
    (source (origin (method url-fetch) (uri (pypi-uri "cmapy" version))
       (sha256 (base32 "0majh37aldmnk0ddxrkazqfxddrg5wqbhr09zd3a2jbw0nrsclnb"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://gitlab.com/cvejarano-oss/cmapy/")
    (synopsis "Access Matplotlib colormaps as simple NumPy arrays")
    (description "cmapy provides easy access to Matplotlib colormaps as RGB arrays,
useful for applying colormaps to images and visualizations.")
    (license license:expat)))

;; ── 4. python-fleep ────────────────────────────────────────────────

(define-public python-fleep
  (package
    (name "python-fleep")
    (version "1.0.1")
    (source (origin (method url-fetch) (uri (pypi-uri "fleep" version))
       (sha256 (base32 "0k0h3pilc271s55a4q0a7zy21479g3rg7l8ydizlsdp5iqjjpxn8"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://github.com/floyernick/fleep")
    (synopsis "File format identification library for Python")
    (description "fleep identifies file types by examining magic bytes in file headers,
supporting over 100 file formats without external dependencies.")
    (license license:expat)))

;; ── 5. python-uploadserver ─────────────────────────────────────────

(define-public python-uploadserver
  (package
    (name "python-uploadserver")
    (version "6.0.1")
    (source (origin (method url-fetch) (uri (pypi-uri "uploadserver" version))
       (sha256 (base32 "153fy2y99n9bbkbfdd1zya4bs0r9idzf2sswyrw2i976d5iv4nxh"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://github.com/Densaugeo/uploadserver")
    (synopsis "Python HTTP server with file upload support")
    (description "uploadserver extends Python's built-in HTTP server with file upload
functionality via POST requests and a web-based upload form.")
    (license license:expat)))

;; ── 6. python-isocodes ─────────────────────────────────────────────

(define-public python-isocodes
  (package
    (name "python-isocodes")
    (version "2025.8.25")
    (source (origin (method url-fetch) (uri (pypi-uri "isocodes" version))
       (sha256 (base32 "18llvgwh12iw4qn1h97971fr0w0gdiyz30apkdzymm55d5d8bb65"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://github.com/Atem18/isocodes")
    (synopsis "Python interface to ISO standard codes (countries, languages, currencies)")
    (description "isocodes provides access to ISO 639 (languages), ISO 3166 (countries),
ISO 4217 (currencies), and other ISO standard code databases.")
    (license license:expat)))

;; ── 7. python-types-mock ───────────────────────────────────────────

(define-public python-types-mock
  (package
    (name "python-types-mock")
    (version "5.2.0.20260402")
    (source (origin (method url-fetch) (uri (pypi-uri "types_mock" version))
       (sha256 (base32 "06r9lq0z32rv93qlsp28iqkqaqlp48k7ni06cxmmmrn65s82rsrs"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://github.com/python/typeshed")
    (synopsis "Type stubs for the mock library")
    (description "types-mock provides PEP 561 type stubs for the mock library, enabling
static type checking with mypy and other type checkers.")
    (license license:asl2.0)))

;; ── 8. python-questionary ──────────────────────────────────────────

(define-public python-questionary
  (package
    (name "python-questionary")
    (version "2.1.1")
    (source (origin (method url-fetch) (uri (pypi-uri "questionary" version))
       (sha256 (base32 "0ba1pp483cb0514ax28g7aw63ig3xv9qvikrmamhf0dvj819hzix"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (propagated-inputs (list python-prompt-toolkit))
    (home-page "https://github.com/tmbo/questionary")
    (synopsis "Interactive command-line user prompts for Python")
    (description "questionary builds interactive command-line prompts including text,
password, confirmation, select, checkbox, and autocomplete inputs.")
    (license license:expat)))

;; ── 9. python-requirements-parser ──────────────────────────────────

(define-public python-requirements-parser
  (package
    (name "python-requirements-parser")
    (version "0.13.0")
    (source (origin (method url-fetch) (uri (pypi-uri "requirements_parser" version))
       (sha256 (base32 "062438qd4iy22nln1mlgd779mqv20kbi06xk9vg328yblaf12hq8"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (propagated-inputs (list python-packaging))
    (home-page "https://github.com/madpah/requirements-parser/")
    (synopsis "Parser for pip requirements files")
    (description "requirements-parser is a Python library for parsing pip requirements
files (requirements.txt) into structured package specification objects.")
    (license license:asl2.0)))

;; ── 10. python-frontmatter ─────────────────────────────────────────

(define-public python-frontmatter
  (package
    (name "python-frontmatter")
    (version "1.1.0")
    (source (origin (method url-fetch) (uri (pypi-uri "python-frontmatter" version))
       (sha256 (base32 "0vazdv1p5p5gdmwpc32a578yhrzva6dqria5axi4k4dgasyx463i"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (propagated-inputs (list python-pyyaml))
    (home-page "https://github.com/eyeseast/python-frontmatter")
    (synopsis "Parse and manage YAML front matter in text files")
    (description "python-frontmatter parses and serializes YAML, JSON, or TOML front
matter from text files such as Markdown and reStructuredText documents.")
    (license license:expat)))

;; ── 11. python-deepl ───────────────────────────────────────────────

(define-public python-deepl
  (package
    (name "python-deepl")
    (version "1.29.0")
    (source (origin (method url-fetch) (uri (pypi-uri "deepl" version))
       (sha256 (base32 "1v15w616gq1cgwa5kcfn4yyf44jwhqbaakzkw6lahnl8qh31cjs9"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (propagated-inputs (list python-requests))
    (home-page "https://github.com/DeepLcom/deepl-python")
    (synopsis "Python client library for the DeepL translation API")
    (description "python-deepl provides a Python interface to the DeepL language
translation API, supporting text and document translation.")
    (license license:expat)))

;; ── 12. python-javalang ────────────────────────────────────────────

(define-public python-javalang
  (package
    (name "python-javalang")
    (version "0.13.0")
    (source (origin (method url-fetch) (uri (pypi-uri "javalang" version))
       (sha256 (base32 "0k22ldm4xn0sb26qclp5zz0fc9dy589zvvby5ba1d0d5h2jab08n"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (propagated-inputs (list python-six))
    (home-page "https://github.com/c2nes/javalang")
    (synopsis "Pure Python Java source code parser and AST library")
    (description "javalang is a pure Python library for parsing Java source code into
an abstract syntax tree, supporting Java language analysis tools.")
    (license license:expat)))

;; ── 13. psrecord ───────────────────────────────────────────────────

(define-public psrecord
  (package
    (name "psrecord")
    (version "1.4")
    (source (origin (method url-fetch) (uri (pypi-uri "psrecord" version))
       (sha256 (base32 "1cal2j3qv2a5whvgy7qhy7flv46bhk51k59qqwwh4rxmi1a1hxsr"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (propagated-inputs (list python-psutil))
    (home-page "https://github.com/astrofrog/psrecord")
    (synopsis "Record CPU and memory usage of a process over time")
    (description "psrecord monitors and records the CPU and memory usage of a process
over time, optionally generating plots of resource consumption.")
    (license license:bsd-2)))

;; ── 14. coccigrep ──────────────────────────────────────────────────

(define-public coccigrep
  (package
    (name "coccigrep")
    (version "1.21")
    (source (origin (method url-fetch) (uri (pypi-uri "coccigrep" version))
       (sha256 (base32 "0kvl0qaqkmb23c9drgpddm62k6bp6ai61i319h254v3n6xpvp2sf"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (propagated-inputs (list python-pygments))
    (home-page "http://home.regit.org/software/coccigrep/")
    (synopsis "Semantic grep for C using Coccinelle engine patterns")
    (description "coccigrep is a semantic grep for the C language that uses Coccinelle
to search for code patterns based on structure rather than text matching.")
    (license license:gpl3)))

;; ── 15. git-delete-merged-branches ─────────────────────────────────

(define-public git-delete-merged-branches
  (package
    (name "git-delete-merged-branches")
    (version "7.5.1")
    (source (origin (method url-fetch)
       (uri (pypi-uri "git_delete_merged_branches" version))
       (sha256 (base32 "0ms392ddb7p2g6vix9468bv33w9z679rnig17q6ixjpqpdl7l9i1"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (propagated-inputs (list python-colorama python-prompt-toolkit))
    (home-page "https://github.com/hartwork/git-delete-merged-branches")
    (synopsis "Command-line tool to delete merged Git branches")
    (description "git-delete-merged-branches is a convenient tool that finds and deletes
Git branches that have been merged into a target branch, both locally and remotely.")
    (license license:gpl3+)))

;; ── 16. python-rich-rst ────────────────────────────────────────────

(define-public python-rich-rst
  (package
    (name "python-rich-rst")
    (version "1.3.2")
    (source (origin (method url-fetch) (uri (pypi-uri "rich_rst" version))
       (sha256 (base32 "1m581nxndw9mcxmjxjpv23p4z4gnz27mx838xh14ndhyvzfny6d1"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (propagated-inputs (list python-docutils python-rich))
    (home-page "https://github.com/wasi-master/rich-rst")
    (synopsis "Render reStructuredText in the terminal using Rich")
    (description "rich-rst renders reStructuredText documents in the terminal with
full formatting using the Rich library for syntax highlighting and layout.")
    (license license:expat)))

;; ── 17. python-pyrgg ───────────────────────────────────────────────

(define-public python-pyrgg
  (package
    (name "python-pyrgg")
    (version "2.0")
    (source (origin (method url-fetch) (uri (pypi-uri "pyrgg" version))
       (sha256 (base32 "1ljfx6nxn55q1vddd49n0cvh4mx4p788sz3mds6ymn5xv9lf54zi"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (propagated-inputs (list python-pyyaml python-art))
    (home-page "https://github.com/sepandhaghighi/pyrgg")
    (synopsis "Random graph generator for various graph formats")
    (description "pyrgg generates random graphs in formats including DIMACS, CSV, TSV,
JSON, YAML, and others for use in graph algorithm research and testing.")
    (license license:expat)))

;; ── 18. python-samila ──────────────────────────────────────────────

(define-public python-samila
  (package
    (name "python-samila")
    (version "1.6")
    (source (origin (method url-fetch) (uri (pypi-uri "samila" version))
       (sha256 (base32 "1p409an0y508imdrgy3v27rdrvkkk0m02bdf9xxnfsik4b0l8281"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (propagated-inputs (list python-matplotlib python-art python-pillow))
    (home-page "https://www.samila.site")
    (synopsis "Generative art creation using mathematical transformations")
    (description "Samila generates generative art by applying random mathematical
transformations to point fields, producing unique artistic visualizations.")
    (license license:expat)))

;; ── 19. python-polyfactory ─────────────────────────────────────────

(define-public python-polyfactory
  (package
    (name "python-polyfactory")
    (version "3.3.0")
    (source (origin (method url-fetch) (uri (pypi-uri "polyfactory" version))
       (sha256 (base32 "16kf4krdnmn218mh1ymdhvvncr3rpf381xnizxig7va3zyv5hwi3"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (propagated-inputs (list python-faker python-typing-extensions))
    (home-page "https://github.com/litestar-org/polyfactory")
    (synopsis "Mock data generation factories for Python data models")
    (description "polyfactory creates mock data factories for Pydantic, dataclasses,
attrs, and other Python data model types for use in testing.")
    (license license:expat)))

;; ── 20. cmake-format ───────────────────────────────────────────────

(define-public cmake-format
  (package
    (name "cmake-format")
    (version "0.6.13")
    (source (origin (method url-fetch) (uri (pypi-uri "cmakelang" version))
       (sha256 (base32 "0zz6g1ignqanl4ja9f5nrlk5f3mvv7cp5y9yswjd0m06n23jx603"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (propagated-inputs (list python-six))
    (home-page "https://github.com/cheshirekow/cmakelang")
    (synopsis "Source code formatter and linter for CMake files")
    (description "cmakelang provides cmake-format for auto-formatting CMakeLists.txt
files and cmake-lint for checking CMake coding style and conventions.")
    (license license:gpl3)))

;; ── 21. ndeftool ───────────────────────────────────────────────────

(define-public ndeftool
  (package
    (name "ndeftool")
    (version "0.1.3")
    (source (origin (method url-fetch) (uri (pypi-uri "ndeftool" version))
       (sha256 (base32 "04z10aimbq8njdplyk0ac6vz5mr24j2cqz9qhs1dqhlpqlliidwv"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (propagated-inputs (list python-ndeflib python-click python-magic))
    (home-page "https://github.com/nfcpy/ndeftool/")
    (synopsis "Command-line tool for creating and inspecting NFC NDEF messages")
    (description "ndeftool creates, inspects, and manipulates NFC Data Exchange Format
(NDEF) messages used for NFC tag programming and communication.")
    (license license:isc)))

;; ── 22. python-pybeam ──────────────────────────────────────────────

(define-public python-pybeam
  (package
    (name "python-pybeam")
    (version "0.8.1")
    (source (origin (method url-fetch) (uri (pypi-uri "pybeam" version))
       (sha256 (base32 "1cdh536znq1qib1w5ld0qm7i78zn3lgmcba4qa8g99qbr755k824"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (propagated-inputs (list python-construct))
    (home-page "https://github.com/matwey/pybeam")
    (synopsis "Parser for compiled Erlang BEAM files in Python")
    (description "pybeam parses compiled Erlang BEAM bytecode files, providing access
to module metadata, function definitions, and beam file internals.")
    (license license:expat)))

;; ── 23. python-kajson ──────────────────────────────────────────────

(define-public python-kajson
  (package
    (name "python-kajson")
    (version "0.4.2")
    (source (origin (method url-fetch) (uri (pypi-uri "kajson" version))
       (sha256 (base32 "0797bir5qx272b4pzi5gv08g8xz4xsx9ksgjnj78cv0f1l19gnx8"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (propagated-inputs (list python-pydantic))
    (home-page "https://github.com/pipelex/kajson")
    (synopsis "JSON serialization for Pydantic models with custom encoders")
    (description "kajson extends JSON serialization for Pydantic models with support for
custom type encoders, enabling clean round-trip serialization.")
    (license license:asl2.0)))

;; ── 24. python-niquests ────────────────────────────────────────────

(define-public python-niquests
  (package
    (name "python-niquests")
    (version "3.18.4")
    (source (origin (method url-fetch) (uri (pypi-uri "niquests" version))
       (sha256 (base32 "1v72rdfjgvcdpbijyr3wif3rkfgnq241rirajb0rpkjq7hb75xnj"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (propagated-inputs (list python-charset-normalizer
                             python-urllib3-future
                             python-wassima))
    (home-page "https://github.com/jawah/niquests")
    (synopsis "HTTP library with HTTP/2 and HTTP/3 support for Python")
    (description "niquests is a modern HTTP library for Python built on urllib3-future,
providing HTTP/2, HTTP/3, and multiplexed connection support.")
    (license license:asl2.0)))

;; ── 25. python-clox ────────────────────────────────────────────────

(define-public python-clox
  (package
    (name "python-clox")
    (version "1.6")
    (source (origin (method url-fetch) (uri (pypi-uri "clox" version))
       (sha256 (base32 "0fg49saglw6r0wmv288znm6z2523ayqdnyhlaiknjwfpxdz1j0c5"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (propagated-inputs (list python-art python-jdatetime python-pytz
                             python-colorama))
    (home-page "https://github.com/sepandhaghighi/clox")
    (synopsis "Terminal clock with multiple time zone and calendar support")
    (description "clox is a terminal clock application supporting multiple time zones,
Jalali and Gregorian calendars, and colorful ASCII art display.")
    (license license:expat)))

;; ── 26. python-findlibs ────────────────────────────────────────────

(define-public python-findlibs
  (package
    (name "python-findlibs")
    (version "0.1.2")
    (source (origin (method url-fetch) (uri (pypi-uri "findlibs" version))
       (sha256 (base32 "08l1fb8mfaarjy63lr1klsy1hj1lxqr5pin4plp3k1lnqqhd4mhz"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://github.com/ecmwf/findlibs")
    (synopsis "Locate shared libraries on the system from Python")
    (description "findlibs helps Python packages find shared libraries installed on the
system by searching standard library paths and environment variables.")
    (license license:asl2.0)))

;; ── 27. python-ensurepath ──────────────────────────────────────────

(define-public python-ensurepath
  (package
    (name "python-ensurepath")
    (version "1.9.2")
    (source (origin (method url-fetch) (uri (pypi-uri "userpath" version))
       (sha256 (base32 "05fqxzdi27vqm5lywxs6bm2j4d8k91fx2ihqhg65g4h6mf6jhlkc"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (propagated-inputs (list python-click))
    (home-page "https://github.com/ofek/userpath")
    (synopsis "Cross-platform tool for adding directories to user PATH")
    (description "userpath (python-ensurepath) provides a cross-platform way to add
directories to the user PATH environment variable persistently.")
    (license license:expat)))

;; ── 28. python-zipremove ───────────────────────────────────────────

(define-public python-zipremove
  (package
    (name "python-zipremove")
    (version "0.8.0")
    (source (origin (method url-fetch) (uri (pypi-uri "zipremove" version))
       (sha256 (base32 "1a4yqzhv77jkzcmvgjv3m6jfp470lv92qhxd0cfcxax5q6mwn7gf"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://github.com/danny0838/zipremove")
    (synopsis "Remove entries from ZIP archives in-place")
    (description "zipremove removes files and directories from ZIP archives without
full re-compression, preserving the original archive structure.")
    (license license:asl2.0)))

;; ── 29. python-iterfzf ────────────────────────────────────────────

(define-public python-iterfzf
  (package
    (name "python-iterfzf")
    (version "1.9.0.67.0")
    (source (origin (method url-fetch) (uri (pypi-uri "iterfzf" version))
       (sha256 (base32 "1b25kr989jvfwzwn7vw6rrmv7hiha3nx2cv0dxwgfssa6axdx7cy"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://github.com/dahlia/iterfzf")
    (synopsis "Pythonic interface to the fzf fuzzy finder")
    (description "iterfzf provides a Pythonic interface to fzf, allowing interactive
fuzzy selection from Python iterables in the terminal.")
    (license license:gpl3+)))

;; ── 30. python-xxh ─────────────────────────────────────────────────

(define-public python-xxh
  (package
    (name "python-xxh")
    (version "0.8.14")
    (source (origin (method url-fetch) (uri (pypi-uri "xxh-xxh" version))
       (sha256 (base32 "1bnz7z01jbxb0q9pmd2xfv62drxz7yfqfc3byx86y2pzzmgc613r"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (propagated-inputs (list python-pexpect python-pyyaml))
    (home-page "https://github.com/xxh/xxh")
    (synopsis "Bring your shell environment to remote SSH sessions")
    (description "xxh transfers your local shell configuration (zsh, fish, bash plugins)
to remote hosts via SSH, providing a familiar environment everywhere.")
    (license license:bsd-2)))
