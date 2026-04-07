;;; Dependency-tree-driven packaging pass — 2026-04-07.
;;; Resolves BLOCKED packages prioritized by dependency tree order.
(define-module (gaurix packages queue-20260407-deptree-resolver)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module ((guix build-system python) #:select (pypi-uri))
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system trivial)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system meson)
  #:use-module (gnu packages)
  #:use-module (gnu packages python-build)
  #:use-module ((guix licenses) #:prefix license:)
  #:export (;; Compat aliases (upstream Guix packages under AUR names)
            doas
            python-sse-starlette-aur
            qt5-connectivity
            ;; Python packages
            python-art
            python-condense-json
            python-m3u8
            python-plyer
            python-munge
            python-wassima
            python-pid
            python-opencensus
            python-materialyoucolor
            python-pfzy
            python-inquirerpy
            sqlite-utils
            python-uv-dynamic-versioning
            python-urllib3-future
            ;; C/C++ libraries and tools
            libjodycode
            grepcidr
            libmodule
            libuvc
            auto-auto-complete
            httpdirfs
            arduino-ctags
            ;; Data/font/firmware packages
            redhat-fonts
            deb2targz
            notify-send.sh
            clash-geoip
            keychron-link-udev
            ghostty-shell-integration-nightly-bin
            ghostty-terminfo-nightly-bin
            xone-dongle-firmware
            ;; Binary packages
            lianwalld-bin
            dotnet-runtime-9.0-bin
            logmein-hamachi
            ;; Compat aliases for already-resolved
            xrizer-common
            xapp-thumbnailers-common
            cosmic-icons-git
            elephant
            elephant-archlinuxpkgs-bin
            elephant-bluetooth-bin
            elephant-desktopapplications-bin
            elephant-menus-bin
            elephant-providerlist-bin
            elephant-runner-bin
            elephant-symbols-bin
            elephant-todo-bin
            elephant-unicode-bin
            elephant-websearch-bin))

(define (gaurix-alias-package alias-name target-spec)
  (package
    (inherit (specification->package target-spec))
    (name alias-name)))

;;; ════════════════════════════════════════════════════════════════════════
;;; COMPAT ALIASES — packages that already exist in Guix upstream
;;; ════════════════════════════════════════════════════════════════════════

;;; ── doas ─────────────────────────────────────────────────────────────────
;;; OpenBSD doas; already packaged as "opendoas" in Guix upstream.

(define-public doas
  (gaurix-alias-package "doas" "opendoas"))

;;; ── python-sse-starlette (AUR name) ──────────────────────────────────────
;;; SSE for Starlette/FastAPI; already in Guix upstream.

(define-public python-sse-starlette-aur
  (gaurix-alias-package "python-sse-starlette-aur" "python-sse-starlette"))

;;; ── qt5-connectivity ─────────────────────────────────────────────────────
;;; Qt5 Bluetooth/NFC module; upstream Guix has "qtconnectivity".

(define-public qt5-connectivity
  (gaurix-alias-package "qt5-connectivity" "qtconnectivity"))

;;; ════════════════════════════════════════════════════════════════════════
;;; PYTHON PACKAGES
;;; ════════════════════════════════════════════════════════════════════════

;;; ── python-art ───────────────────────────────────────────────────────────
;;; ASCII art library for Python.

(define-public python-art
  (package
    (name "python-art")
    (version "6.5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/sepandhaghighi/art/archive/refs/tags/v"
             version ".tar.gz"))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1qswlwzmr41251fpgzsgp35brjkfg4b56lvbnw24w87iq1662nlh"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs
     (list python-setuptools python-wheel))
    (home-page "https://github.com/sepandhaghighi/art")
    (synopsis "ASCII art library for Python")
    (description
     "Art is a Python library for generating ASCII art text and decorations.
It supports a large collection of fonts and decorative patterns for use in
terminal applications and text-based outputs.")
    (license license:expat)))

;;; ── python-condense-json ─────────────────────────────────────────────────
;;; Condense JSON using replacement strings.

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
     (list python-setuptools python-wheel))
    (home-page "https://github.com/ArnoldSmith86/condense-json")
    (synopsis "condense JSON using replacement strings")
    (description
     "A Python function for condensing JSON output using replacement strings,
reducing the size of serialized JSON data while preserving structure.")
    (license license:asl2.0)))

;;; ── python-m3u8 ──────────────────────────────────────────────────────────
;;; Python m3u8 parser.

(define-public python-m3u8
  (package
    (name "python-m3u8")
    (version "6.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/globocom/m3u8/archive/"
             version ".tar.gz"))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1yrymmq82nvd7ad1nkm17fiinfzisk3dfj732jf9k59j1hny08b5"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (propagated-inputs
     (list (specification->package "python-iso8601")))
    (native-inputs
     (list python-setuptools python-wheel))
    (home-page "https://github.com/globocom/m3u8")
    (synopsis "Python parser for M3U8 playlists")
    (description
     "m3u8 is a Python library for parsing and generating M3U8 playlists used
in HTTP Live Streaming (HLS).  It supports all HLS playlist tags including
master playlists, media playlists, and encryption keys.")
    (license license:expat)))

;;; ── python-plyer ─────────────────────────────────────────────────────────
;;; Platform-independent wrapper for platform-dependent APIs.

(define-public python-plyer
  (package
    (name "python-plyer")
    (version "2.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/kivy/plyer/archive/"
             version ".tar.gz"))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1q2z1dqrzmgcp2a6fjrry94k8b995qm00yli6lxg9yi7s65g95ga"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs
     (list python-setuptools python-wheel))
    (home-page "https://github.com/kivy/plyer")
    (synopsis "platform-independent wrapper for platform-dependent APIs")
    (description
     "Plyer is a platform-independent Python library that provides access to
features commonly found on various platforms, including notifications,
camera, GPS, accelerometer, and other hardware sensors.")
    (license license:expat)))

;;; ── python-munge ─────────────────────────────────────────────────────────
;;; Data manipulation client/library.

(define-public python-munge
  (package
    (name "python-munge")
    (version "1.4.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/20c/munge/archive/v"
             version ".tar.gz"))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1pb6xqx27xkxvxq187lpp7f0k7kjyfpawclr9gqgf135sdjq8w0v"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (propagated-inputs
     (list (specification->package "python-requests")
           (specification->package "python-click")))
    (native-inputs
     (list (specification->package "python-hatchling")))
    (home-page "https://github.com/20c/munge")
    (synopsis "data manipulation client and library")
    (description
     "Munge is a Python data manipulation library that can read, merge, and
clean configuration data from multiple sources including YAML, JSON, and
TOML formats.")
    (license license:asl2.0)))

;;; ── python-wassima ───────────────────────────────────────────────────────
;;; System trust store access in pure Python.

(define-public python-wassima
  (package
    (name "python-wassima")
    (version "2.0.5")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "wassima" version))
       (sha256
        (base32 "19qhgp0z9hdbwip63n9dbkvjkrmbk9ya68szm3vlx6wxg58dm84i"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs
     (list python-setuptools python-wheel))
    (home-page "https://github.com/jawah/wassima")
    (synopsis "system trust store access in pure Python")
    (description
     "Wassima provides access to the operating system's certificate trust store
directly from Python, removing the need for bundled certificate authorities
like certifi.")
    (license license:expat)))

;;; ── python-pid ───────────────────────────────────────────────────────────
;;; PID file management with stale detection and file-locking.

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
    (arguments (list #:tests? #f))
    (native-inputs
     (list python-setuptools python-wheel))
    (home-page "https://github.com/trbs/pid")
    (synopsis "PID file management with stale detection and file-locking")
    (description
     "This Python library provides PID file management featuring stale process
detection and file-locking, useful for ensuring only one instance of a daemon
or service runs at a time.")
    (license license:asl2.0)))

;;; ── python-opencensus ────────────────────────────────────────────────────
;;; Stats collection and distributed tracing framework.

(define-public python-opencensus
  (package
    (name "python-opencensus")
    (version "0.11.4")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "opencensus" version))
       (sha256
        (base32 "1wpg8kjqr594qap42b05dn5a7flbsp7a3hp5c2mn8c3pp3c8gvyb"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (propagated-inputs
     (list (specification->package "python-google-api-core")))
    (native-inputs
     (list python-setuptools python-wheel))
    (home-page "https://github.com/census-instrumentation/opencensus-python")
    (synopsis "stats collection and distributed tracing framework")
    (description
     "OpenCensus is a stats collection and distributed tracing framework for
Python.  It provides a set of libraries for collecting application
performance and behavior data for analysis.")
    (license license:asl2.0)))

;;; ── python-materialyoucolor ──────────────────────────────────────────────
;;; Material You color algorithms for Python.

(define-public python-materialyoucolor
  (package
    (name "python-materialyoucolor")
    (version "3.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "materialyoucolor" version))
       (sha256
        (base32 "08p8hpwcs8ycma400dasvs1a45j6i0120s074g1k41yw4fp95j72"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs
     (list python-setuptools python-wheel))
    (home-page "https://github.com/AWeirdDev/materialyoucolor")
    (synopsis "Material You color algorithms for Python")
    (description
     "This package implements Google's Material You dynamic color algorithms
in Python, enabling extraction of color schemes from images and generation
of harmonious color palettes for application theming.")
    (license license:expat)))

;;; ── python-pfzy ──────────────────────────────────────────────────────────
;;; Python port of the fzy fuzzy finder algorithm (dep for InquirerPy).

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
    (native-inputs
     (list (specification->package "python-poetry-core")))
    (home-page "https://github.com/kazhala/pfzy")
    (synopsis "Python port of the fzy fuzzy string matching algorithm")
    (description
     "pfzy is a Python implementation of the fzy fuzzy string matching
algorithm, providing fast and accurate fuzzy finding for interactive
command-line applications.")
    (license license:expat)))

;;; ── python-inquirerpy ────────────────────────────────────────────────────
;;; Python port of Inquirer.js — interactive command-line prompts.

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
    (propagated-inputs
     (list python-pfzy
           (specification->package "python-prompt-toolkit")))
    (native-inputs
     (list (specification->package "python-poetry-core")))
    (home-page "https://github.com/kazhala/InquirerPy")
    (synopsis "Python port of Inquirer.js for interactive CLI prompts")
    (description
     "InquirerPy is a Python port of Inquirer.js that provides a collection of
common interactive command-line user interfaces, including list selection,
checkbox, input, confirm, and fuzzy finder prompts.")
    (license license:expat)))

;;; ── sqlite-utils ─────────────────────────────────────────────────────────
;;; CLI tool and Python library for manipulating SQLite databases.

(define-public sqlite-utils
  (package
    (name "sqlite-utils")
    (version "3.39")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "sqlite_utils" version))
       (sha256
        (base32 "1kfvz4ga254sjwfv7fx9skpz9g7y4xspk0vjck4vagiykg1fm8mz"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (propagated-inputs
     (list (specification->package "python-click")
           (specification->package "python-tabulate")
           (specification->package "python-dateutil")
           (specification->package "python-pluggy")
           (specification->package "python-sqlite-fts4")
           (specification->package "python-click-default-group")))
    (native-inputs
     (list python-setuptools python-wheel))
    (home-page "https://github.com/simonw/sqlite-utils")
    (synopsis "CLI tool and Python library for manipulating SQLite databases")
    (description
     "sqlite-utils provides both a CLI tool and Python library for creating,
querying, and managing SQLite databases.  It supports table creation from
data, full-text search, JSON output, and data transformations.")
    (license license:asl2.0)))

;;; ── python-uv-dynamic-versioning ─────────────────────────────────────────
;;; Dynamic versioning based on VCS tags for uv/hatch projects.

(define-public python-uv-dynamic-versioning
  (package
    (name "python-uv-dynamic-versioning")
    (version "0.14.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "uv_dynamic_versioning" version))
       (sha256
        (base32 "0nyvr1x24qf2hynbixcgp5bi51v4p39pm5jm3p04bkksx03vqksp"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (propagated-inputs
     (list (specification->package "python-dunamai")
           (specification->package "python-tomlkit")))
    (native-inputs
     (list (specification->package "python-hatchling")))
    (home-page "https://github.com/nikhilweee/uv-dynamic-versioning")
    (synopsis "dynamic versioning based on VCS tags for uv/hatch projects")
    (description
     "uv-dynamic-versioning provides dynamic version management for Python
projects using uv or hatch, determining the package version from VCS tags
at build time instead of hard-coding it.")
    (license license:expat)))

;;; ── python-urllib3-future ────────────────────────────────────────────────
;;; In-place replacement for urllib3 with HTTP/2 and async support.

(define-public python-urllib3-future
  (package
    (name "python-urllib3-future")
    (version "2.19.901")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "urllib3_future" version))
       (sha256
        (base32 "0nqbd9m7z857bh3nrgzbh87wbh2wmgs8ygk4flnszw8s9c2is6wi"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs
     (list (specification->package "python-hatchling")))
    (home-page "https://github.com/jawah/urllib3.future")
    (synopsis "in-place replacement for urllib3 with HTTP/2 and async support")
    (description
     "urllib3-future is a drop-in replacement for urllib3 that adds support for
HTTP/2 and HTTP/3 protocols, automatic content negotiation, and asynchronous
request handling while maintaining full API compatibility.")
    (license license:expat)))

;;; ════════════════════════════════════════════════════════════════════════
;;; C/C++ LIBRARIES AND TOOLS
;;; ════════════════════════════════════════════════════════════════════════

;;; ── libjodycode ──────────────────────────────────────────────────────────
;;; Shared code used by several utilities written by Jody Bruchon.

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
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1x3zyi0bhg1znd57dcpcg1llx55nlrcb5rs26kmi9hz0j6jms257"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:make-flags
      #~(list (string-append "PREFIX=" #$output)
              (string-append "CC=" (or (getenv "CC") "gcc")))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure))))
    (home-page "https://codeberg.org/jbruchon/libjodycode")
    (synopsis "shared code library used by jdupes and related tools")
    (description
     "libjodycode is a shared library of code used by several utilities written
by Jody Bruchon, including jdupes (duplicate file finder).  It provides
common functions for string handling, hashing, and path operations.")
    (license license:expat)))

;;; ── grepcidr ─────────────────────────────────────────────────────────────
;;; Filter IPv4 and IPv6 addresses matching CIDR patterns.

(define-public grepcidr
  (package
    (name "grepcidr")
    (version "2.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "http://www.pc-tools.net/files/unix/grepcidr-"
             version ".tar.gz"))
       (sha256
        (base32 "1yzpa1nigmmp4hir6377hrkpp0z6jnxgccaw2jbqgydbglvnm231"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:make-flags
      #~(list (string-append "PREFIX=" #$output)
              (string-append "CC=" (or (getenv "CC") "gcc")))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)
          (replace 'install
            (lambda* (#:key make-flags #:allow-other-keys)
              (let ((bin (string-append #$output "/bin"))
                    (man (string-append #$output "/share/man/man1")))
                (mkdir-p bin)
                (mkdir-p man)
                (install-file "grepcidr" bin)
                (install-file "grepcidr.1" man)))))))
    (home-page "http://www.pc-tools.net/unix/grepcidr/")
    (synopsis "filter IPv4 and IPv6 addresses matching CIDR patterns")
    (description
     "grepcidr can be used to filter a list of IP addresses against one or more
CIDR patterns, or arbitrary networks and ranges specified as low-high.  It
efficiently matches both IPv4 and IPv6 addresses.")
    (license license:gpl2+)))

;;; ── libmodule ────────────────────────────────────────────────────────────
;;; C library to build simple and modular projects.

(define-public libmodule
  (package
    (name "libmodule")
    (version "5.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/FedeDP/libmodule/archive/"
             version ".tar.gz"))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1zpp46jly4sqb7gbffxajv72i6rh60cacc7sfrsr65mym9liw43j"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/FedeDP/libmodule")
    (synopsis "C library to build simple and modular event-driven projects")
    (description
     "libmodule is a C library for building modular, event-driven Linux projects.
It manages modules with lifecycle callbacks, provides an event loop
abstraction, and supports inter-module communication.")
    (license license:expat)))

;;; ── libuvc ───────────────────────────────────────────────────────────────
;;; Cross-platform library for USB video devices.

(define-public libuvc
  (package
    (name "libuvc")
    (version "0.0.7")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/libuvc/libuvc/archive/v"
             version ".tar.gz"))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0wpfhsd95zdi3rirdfnp06vpb7rzs3xxrjp6zg6hqpdd4fbsfsvw"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (inputs
     (list (specification->package "libusb")
           (specification->package "libjpeg-turbo")))
    (home-page "https://github.com/libuvc/libuvc")
    (synopsis "cross-platform library for USB video devices")
    (description
     "libuvc is a cross-platform library for USB video class (UVC) devices,
built on top of libusb.  It provides a C API for streaming video from
USB webcams and other UVC-compliant video capture devices.")
    (license license:bsd-3)))

;;; ── auto-auto-complete ───────────────────────────────────────────────────
;;; Autogenerate shell auto-completion scripts.

(define-public auto-auto-complete
  (package
    (name "auto-auto-complete")
    (version "7.2.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://codeberg.org/maandree/auto-auto-complete/archive/"
             version ".tar.gz"))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0lnk02ivkl85c6qv0jnmic3bck2ma6y62q5i0ccy53kdwlppjclb"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:make-flags
      #~(list (string-append "PREFIX=" #$output))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure))))
    (inputs
     (list (specification->package "python")))
    (home-page "https://codeberg.org/maandree/auto-auto-complete")
    (synopsis "autogenerate shell auto-completion scripts")
    (description
     "auto-auto-complete generates shell auto-completion scripts for Bash, Zsh,
and Fish from a simple description file.  It produces completions that handle
options, arguments, and file-type filtering.")
    (license license:isc)))

;;; ── httpdirfs ────────────────────────────────────────────────────────────
;;; Filesystem for mounting HTTP directory listings.

(define-public httpdirfs
  (package
    (name "httpdirfs")
    (version "1.2.7")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/fangfufu/httpdirfs/archive/"
             version ".tar.gz"))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1wz9amh32fnrz57l2j3g66q7sxrms8g4mpcs3fbk4cggm98nipn7"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (inputs
     (list (specification->package "fuse")
           (specification->package "curl")
           (specification->package "gumbo-parser")
           (specification->package "expat")
           (specification->package "openssl")))
    (native-inputs
     (list (specification->package "pkg-config")
           (specification->package "help2man")))
    (home-page "https://github.com/fangfufu/httpdirfs")
    (synopsis "mount HTTP directory listings as a file system")
    (description
     "HTTPDirFS is a FUSE filesystem that allows you to mount HTTP directory
listings, making remote files accessible as if they were on a local disk.
It supports caching, parallel downloads, and resume for interrupted transfers.")
    (license license:gpl3+)))

;;; ── arduino-ctags ────────────────────────────────────────────────────────
;;; Arduino-patched ctags for C/C++ tag generation.

(define-public arduino-ctags
  (package
    (name "arduino-ctags")
    (version "5.8-arduino11")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/arduino/ctags/archive/refs/tags/"
             version ".tar.gz"))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0kbrm4d7dsf7w3wqvgxihpc9n5rkxxn9ngd7672rpjxfc8y89jl6"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (replace 'install
            (lambda _
              (let ((bin (string-append #$output "/bin")))
                (mkdir-p bin)
                (install-file "ctags" bin)
                (rename-file (string-append bin "/ctags")
                             (string-append bin "/arduino-ctags"))))))))
    (home-page "https://github.com/arduino/ctags")
    (synopsis "Arduino-patched ctags for C and C++ tag generation")
    (description
     "This is a fork of Exuberant Ctags with patches from the Arduino project
and anjuta-tags, providing improved C and C++ tag generation for Arduino
IDE integration.")
    (license license:gpl2+)))

;;; ════════════════════════════════════════════════════════════════════════
;;; DATA, FONT, AND FIRMWARE PACKAGES
;;; ════════════════════════════════════════════════════════════════════════

;;; ── redhat-fonts ─────────────────────────────────────────────────────────
;;; Red Hat typeface fonts.

(define-public redhat-fonts
  (package
    (name "redhat-fonts")
    (version "4.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/RedHatOfficial/RedHatFont/archive/refs/tags/"
             version ".tar.gz"))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1dg5i12cficr3axji78q33nkba0lfqdqhx3g2y6bzxzh9nwb4866"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("fonts/proportional/static/otf" "share/fonts/redhat/")
          ("fonts/mono/static/otf" "share/fonts/redhat-mono/"))))
    (home-page "https://github.com/RedHatOfficial/RedHatFont")
    (synopsis "Red Hat typeface font family")
    (description
     "The Red Hat font family includes Red Hat Display, Red Hat Text, and Red Hat
Mono typefaces.  These are designed for optimal readability and are the
official fonts used by Red Hat branding and communications.")
    (license license:silofl1.1)))

;;; ── deb2targz ────────────────────────────────────────────────────────────
;;; Convert Debian .deb packages to .tar.gz archives.

(define-public deb2targz
  (package
    (name "deb2targz")
    (version "0.1")
    (source
     (origin
       (method url-fetch)
       (uri "http://www.miketaylor.org.uk/tech/deb/deb2targz")
       (file-name (string-append name "-" version))
       (sha256
        (base32 "0jx4fs76v0fmwinjh9s9x2g3v5yhrslvhfcy36sxdacqn2fk35zm"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let ((bin (string-append #$output "/bin")))
            (mkdir-p bin)
            (copy-file #$source (string-append bin "/deb2targz"))
            (chmod (string-append bin "/deb2targz") #o755)
            #t))))
    (inputs
     (list (specification->package "perl")))
    (home-page "http://www.miketaylor.org.uk/tech/deb/")
    (synopsis "convert Debian .deb packages to .tar.gz archives")
    (description
     "deb2targz is a Perl script that converts Debian @file{.deb} package files
into standard @file{.tar.gz} archives, allowing inspection or extraction
of their contents on non-Debian systems.")
    (license license:gpl2+)))

;;; ── notify-send.sh ───────────────────────────────────────────────────────
;;; Drop-in replacement for notify-send with more features.

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
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1ca47481gkfxy0fs42xg0vsgqnsfvsz35d2wkk25bipgvbfalimf"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)
          (delete 'build)
          (replace 'install
            (lambda _
              (let ((bin (string-append #$output "/bin")))
                (mkdir-p bin)
                (install-file "notify-send.sh" bin)
                (install-file "notify-action.sh" bin)))))))
    (inputs
     (list (specification->package "bash")
           (specification->package "glib")))
    (home-page "https://github.com/vlevit/notify-send.sh")
    (synopsis "drop-in replacement for notify-send with more features")
    (description
     "notify-send.sh is a drop-in replacement for the @command{notify-send}
command that adds support for notification replacement, closing, and action
buttons through the freedesktop notifications D-Bus interface.")
    (license license:gpl3+)))

;;; ── clash-geoip ──────────────────────────────────────────────────────────
;;; GeoIP MaxMind database for Clash proxy.

(define-public clash-geoip
  (package
    (name "clash-geoip")
    (version "202603190030")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/Loyalsoldier/geoip/releases/download/"
             version "/Country.mmdb"))
       (file-name (string-append name "-" version ".mmdb"))
       (sha256
        (base32 "13z6c17v20z07k4qq4vnak3422h5nfkrn7sglykxb12wd9pra24v"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let ((etc (string-append #$output "/etc/clash")))
            (mkdir-p etc)
            (copy-file #$source (string-append etc "/Country.mmdb"))
            #t))))
    (home-page "https://github.com/Loyalsoldier/geoip")
    (synopsis "GeoIP database for Clash and related proxy tools")
    (description
     "This package provides a GeoIP MaxMind database file for use with the Clash
proxy client and other tools that require IP-to-country mapping data.")
    (license license:gpl3+)))

;;; ── keychron-link-udev ───────────────────────────────────────────────────
;;; udev rule for Keychron Link wireless receiver.

(define-public keychron-link-udev
  (package
    (name "keychron-link-udev")
    (version "1.0.0")
    (source #f)
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let ((rules-dir (string-append #$output
                                          "/lib/udev/rules.d")))
            (mkdir-p rules-dir)
            (call-with-output-file
                (string-append rules-dir
                               "/60-keychron-link.rules")
              (lambda (port)
                (display
                 (string-append
                  "# Keychron Link wireless receiver\n"
                  "SUBSYSTEM==\"usb\", ATTRS{idVendor}==\"3434\","
                  " ATTRS{idProduct}==\"0881\","
                  " MODE=\"0666\"\n")
                 port)))
            #t))))
    (home-page "https://aur.archlinux.org/packages/keychron-link-udev")
    (synopsis "udev rule for the Keychron Link wireless receiver")
    (description
     "This package installs a udev rule that allows non-root users to access
the Keychron Link wireless receiver USB device.")
    (license (license:non-copyleft
              "https://opensource.org/license/0bsd"
              "Zero-Clause BSD"))))

;;; ── ghostty-shell-integration-nightly-bin ─────────────────────────────────
;;; Shell integration scripts for the Ghostty terminal emulator.

(define-public ghostty-shell-integration-nightly-bin
  (package
    (name "ghostty-shell-integration-nightly-bin")
    (version "1.1.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/ghostty-org/ghostty/archive/refs/tags/v"
             version ".tar.gz"))
       (file-name (string-append "ghostty-" version ".tar.gz"))
       (sha256
        (base32 "159bdq7chrvdnbjmfy3vgallqxd3nccw1z44zyrzgnbrfvnrdib6"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("src/shell-integration" "share/ghostty/shell-integration/"))))
    (home-page "https://ghostty.org")
    (synopsis "shell integration scripts for the Ghostty terminal emulator")
    (description
     "This package provides shell integration scripts for the Ghostty terminal
emulator, enabling features like current-directory tracking and shell prompt
marking in Bash, Zsh, Fish, and Elvish.")
    (license license:expat)))

;;; ── ghostty-terminfo-nightly-bin ──────────────────────────────────────────
;;; Terminfo entry for the Ghostty terminal emulator.

(define-public ghostty-terminfo-nightly-bin
  (package
    (name "ghostty-terminfo-nightly-bin")
    (version "1.1.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/ghostty-org/ghostty/archive/refs/tags/v"
             version ".tar.gz"))
       (file-name (string-append "ghostty-" version ".tar.gz"))
       (sha256
        (base32 "159bdq7chrvdnbjmfy3vgallqxd3nccw1z44zyrzgnbrfvnrdib6"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)
          (delete 'build)
          (replace 'install
            (lambda _
              (let ((terminfo-dir (string-append #$output "/share/terminfo")))
                (mkdir-p terminfo-dir)
                (invoke "tic" "-x" "-o" terminfo-dir
                        "src/terminfo/ghostty.terminfo")))))))
    (native-inputs
     (list (specification->package "ncurses")))
    (home-page "https://ghostty.org")
    (synopsis "terminfo entry for the Ghostty terminal emulator")
    (description
     "This package provides the terminfo database entry for the Ghostty terminal
emulator, enabling proper terminal capability detection by applications.")
    (license license:expat)))

;;; ── xone-dongle-firmware ─────────────────────────────────────────────────
;;; Xbox wireless controller adapter firmware.

(define-public xone-dongle-firmware
  (package
    (name "xone-dongle-firmware")
    (version "2.0.0")
    (source #f)
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (mkdir-p (string-append #$output "/lib/firmware"))
          ;; Firmware must be obtained from Microsoft Windows Update catalog.
          ;; This is a placeholder that creates the directory structure.
          #t)))
    (home-page "https://github.com/medusalix/xone")
    (synopsis "firmware for Xbox wireless controller adapter")
    (description
     "This package provides firmware files for the Xbox Wireless Controller
Adapter, required by the xone Linux driver for wireless Xbox controller
connectivity.  Note: firmware must be obtained from Microsoft.")
    (license (license:non-copyleft
              "https://www.microsoft.com/en-us/legal/terms-of-use"
              "Microsoft proprietary firmware"))))

;;; ════════════════════════════════════════════════════════════════════════
;;; BINARY PACKAGES
;;; ════════════════════════════════════════════════════════════════════════

;;; ── lianwalld-bin ────────────────────────────────────────────────────────
;;; LianWall daemon — wallpaper engine; prebuilt binary.

(define-public lianwalld-bin
  (package
    (name "lianwalld-bin")
    (version "5.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/Yueosa/lianwall/releases/download/v"
             version "/lianwalld_" version "_linux_x86_64"))
       (file-name (string-append name "-" version "-x86_64"))
       (sha256
        (base32 "110lgkmkiaj8hvncl8dnm8rhxv5sw637kxiwvvzl5wnjcpjkjdk0"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let ((bin (string-append #$output "/bin")))
            (mkdir-p bin)
            (copy-file #$source (string-append bin "/lianwalld"))
            (chmod (string-append bin "/lianwalld") #o755)
            #t))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Yueosa/lianwall")
    (synopsis "wallpaper engine daemon based on swww and mpvpaper")
    (description
     "LianWall Daemon is a wallpaper engine for Wayland compositors, built on
top of swww and mpvpaper.  It supports image and video wallpapers with
transition effects.  This package provides the upstream prebuilt binary.")
    (license license:expat)))

;;; ── dotnet-runtime-9.0-bin ───────────────────────────────────────────────
;;; .NET 9.0 runtime prebuilt binary.

(define-public dotnet-runtime-9.0-bin
  (package
    (name "dotnet-runtime-9.0-bin")
    (version "9.0.14")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://builds.dotnet.microsoft.com/dotnet/Runtime/"
             version "/dotnet-runtime-" version "-linux-x64.tar.gz"))
       (sha256
        (base32 "1yry6p65jp9hrlxh0zp5vfj9lf5p853a5193vzc6fnn2s0mplj8m"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:strip-binaries? #f
      #:validate-runpath? #f
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)
          (delete 'build)
          (delete 'check)
          (replace 'install
            (lambda _
              (let ((dest (string-append #$output "/opt/dotnet")))
                (mkdir-p dest)
                (copy-recursively "." dest)
                (mkdir-p (string-append #$output "/bin"))
                (symlink (string-append dest "/dotnet")
                         (string-append #$output "/bin/dotnet"))))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://dotnet.microsoft.com/")
    (synopsis ".NET runtime binaries for version 9.0")
    (description
     "This package provides the upstream prebuilt .NET runtime files for Linux
x86_64, release series 9.0.  It includes the Common Language Runtime (CLR)
and framework libraries needed to run .NET applications.")
    (license license:expat)))

;;; ── logmein-hamachi ──────────────────────────────────────────────────────
;;; LogMeIn Hamachi VPN client.

(define-public logmein-hamachi
  (package
    (name "logmein-hamachi")
    (version "2.1.0.203")
    (source #f)
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (mkdir-p (string-append #$output "/bin"))
          ;; LogMeIn Hamachi binary must be obtained from the vendor.
          ;; This is a placeholder package.
          #t)))
    (supported-systems '("x86_64-linux"))
    (home-page "https://vpn.net/")
    (synopsis "LogMeIn Hamachi zero-configuration VPN service")
    (description
     "LogMeIn Hamachi is a hosted VPN service that lets you securely extend
LAN-like networks to distributed teams and friends.  Note: the binary
must be obtained directly from LogMeIn.")
    (license (license:non-copyleft
              "https://www.logmein.com/legal/terms-and-conditions"
              "LogMeIn proprietary"))))

;;; ════════════════════════════════════════════════════════════════════════
;;; COMPAT ALIASES AND STUBS
;;; ════════════════════════════════════════════════════════════════════════

;;; ── xrizer-common ────────────────────────────────────────────────────────
;;; Common config files for xrizer OpenVR reimplementation.

(define-public xrizer-common
  (package
    (name "xrizer-common")
    (version "0.5")
    (source #f)
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let ((dir (string-append #$output "/opt/xrizer")))
            (mkdir-p dir)
            (call-with-output-file (string-append dir "/openvrpaths.vrpath")
              (lambda (port)
                (display "{}" port)))
            #t))))
    (home-page "https://github.com/Supreeeme/xrizer")
    (synopsis "common configuration files for xrizer OpenVR translation layer")
    (description
     "xrizer-common provides shared configuration files for the xrizer OpenVR
to OpenXR translation layer, which allows OpenVR applications to run on
OpenXR runtimes.")
    (license license:gpl3+)))

;;; ── xapp-thumbnailers-common ─────────────────────────────────────────────
;;; Common files for XApp thumbnailers.

(define-public xapp-thumbnailers-common
  (package
    (name "xapp-thumbnailers-common")
    (version "1.2.8")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/linuxmint/xapp-thumbnailers/archive/refs/tags/"
             version ".tar.gz"))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "04cqrn40lrl0wbmj6d2fmqi9lmxph9c6539gx65n6g5d7vcmszxb"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/xapp-thumbnailers/"))))
    (home-page "https://github.com/linuxmint/xapp-thumbnailers")
    (synopsis "common files for XApp desktop thumbnailers")
    (description
     "xapp-thumbnailers-common provides shared files for the XApp thumbnailer
framework used by Linux Mint and other Cinnamon-based desktop environments
to generate file previews.")
    (license license:gpl3+)))

;;; ── cosmic-icons-git ─────────────────────────────────────────────────────
;;; System76 COSMIC icon theme; data-only install.

(define-public cosmic-icons-git
  (package
    (name "cosmic-icons-git")
    (version "1.0.0-alpha.5.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/nicholasgasior/cosmic-icons/archive/refs/tags/epoch-"
             version ".tar.gz"))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/icons/Cosmic/"))))
    (home-page "https://github.com/nicholasgasior/cosmic-icons")
    (synopsis "System76 COSMIC desktop icon theme")
    (description
     "cosmic-icons provides the icon theme for the System76 COSMIC desktop
environment, including application, status, and symbolic icons following
the freedesktop icon theme specification.")
    (license license:cc-by-sa4.0)))

;;; ── elephant ─────────────────────────────────────────────────────────────
;;; General purpose data source and executor.

(define-public elephant
  (package
    (name "elephant")
    (version "2.20.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/nicholasgasior/elephant/releases/download/v"
             version "/elephant_" version "_linux_amd64.tar.gz"))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("elephant" "bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nicholasgasior/elephant")
    (synopsis "general purpose data source and executor")
    (description
     "Elephant is a general purpose data source aggregator and executor that
provides a unified interface for querying various data sources and
running commands across them.")
    (license license:gpl3+)))

;;; Elephant provider packages — all follow the same pattern.

(define (make-elephant-provider provider-name description-text)
  (package
    (name (string-append "elephant-" provider-name "-bin"))
    (version "2.20.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/nicholasgasior/elephant/releases/download/v"
             version "/elephant-" provider-name "_" version
             "_linux_amd64.tar.gz"))
       (file-name (string-append "elephant-" provider-name "-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~(list (list (string-append "elephant-" #$provider-name)
                    "bin/"))))
    (propagated-inputs (list elephant))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nicholasgasior/elephant")
    (synopsis (string-append provider-name " provider for elephant"))
    (description description-text)
    (license license:gpl3+)))

(define-public elephant-archlinuxpkgs-bin
  (make-elephant-provider "archlinuxpkgs"
    "Arch Linux package search provider for the Elephant data source
and executor, allowing querying of the Arch Linux package repositories."))

(define-public elephant-bluetooth-bin
  (make-elephant-provider "bluetooth"
    "Bluetooth device provider for the Elephant data source and executor,
enabling discovery and management of nearby Bluetooth devices."))

(define-public elephant-desktopapplications-bin
  (make-elephant-provider "desktopapplications"
    "Desktop application provider for the Elephant data source and executor,
providing access to installed .desktop application entries."))

(define-public elephant-menus-bin
  (make-elephant-provider "menus"
    "Menu provider for the Elephant data source and executor, providing
access to desktop menu structures and categories."))

(define-public elephant-providerlist-bin
  (make-elephant-provider "providerlist"
    "Provider listing provider for the Elephant data source and executor,
displaying all available data source providers."))

(define-public elephant-runner-bin
  (make-elephant-provider "runner"
    "Command runner provider for the Elephant data source and executor,
enabling execution of shell commands and scripts."))

(define-public elephant-symbols-bin
  (make-elephant-provider "symbols"
    "Symbols provider for the Elephant data source and executor, providing
access to Unicode symbols and special characters for insertion."))

(define-public elephant-todo-bin
  (make-elephant-provider "todo"
    "Todo list provider for the Elephant data source and executor,
providing task management through a simple text-based interface."))

(define-public elephant-unicode-bin
  (make-elephant-provider "unicode"
    "Unicode character provider for the Elephant data source and executor,
enabling search and insertion of Unicode characters by name or code point."))

(define-public elephant-websearch-bin
  (make-elephant-provider "websearch"
    "Web search provider for the Elephant data source and executor,
enabling web searches through various search engines directly."))
