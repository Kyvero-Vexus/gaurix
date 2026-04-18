;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260418w
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages.
;;;
;;; New recipes (18):
;;;     NOTE: python-dashtable already in recipe-resolver-260417af.scm
;;;     2.  python-certbot-pkcs12 (pyproject-build-system, v0.3.1, asl2.0)
;;;     3.  python-spitch (pyproject-build-system, v1.49.0, asl2.0)
;;;     4.  python-invocation-tree (pyproject-build-system, v0.0.35, bsd-2)
;;;     5.  python-dukpy (python-build-system, v0.5.1, expat)
;;;     6.  python-pyexcel-ezodf (pyproject-build-system, v0.3.4, expat)
;;;     7.  wallman (pyproject-build-system, v1.5.2.8, expat)
;;;     8.  ttf-piazzolla (font-build-system, v2.005, silofl1.1)
;;;     9.  stardict-full-eng-rus (copy-build-system, v2.4.2, gpl2)
;;;    10.  xdg-sound (gnu-build-system, v1.0, gpl2+)
;;;    11.  alttab (gnu-build-system, v1.7.1, gpl3+)
;;;    12.  gekkfetch (gnu-build-system, v0.1, gpl3+)
;;;    13.  jellyfetch (gnu-build-system, v0.1, expat)
;;;    14.  tombl-bin (copy-build-system, v0.2.3, gpl3+)
;;;    15.  klog-time-tracker-bin (copy-build-system, v7.1, expat)
;;;    16.  opkssh-bin (copy-build-system, v0.13.0, asl2.0)
;;;    17.  puma-dev-bin (copy-build-system, v0.18.3, bsd-3)
;;;    18.  rqlite-bin (copy-build-system, v9.4.5, expat)
;;;    19.  wdisplays-persistent (meson-build-system, v1.1.1, gpl3+)
;;;
;;; BLOCKED EXHAUSTED (11):
;;;    20.  python-opcua-asyncio -> NEEDS_RECIPE_DESIGN_EXHAUSTED: DEEP_DEPENDENCY_TREE:
;;;         OPC-UA library; needs python-aiofiles, python-aiosqlite, python-sortedcontainers
;;;         and 10+ other deps not in Guix;
;;;         A1: recursive import generates 15+ missing Python packages;
;;;         A2: opcua protocol handling requires all deps present;
;;;         A3: no lighter alternative available
;;;    21.  python-system_hotkey -> NEEDS_RECIPE_DESIGN_EXHAUSTED: DEP_MISSING:
;;;         system hotkey library; needs python-xcffib and python-xpybutil not in Guix;
;;;         A1: python-xcffib requires cffi bindings to X11 not packaged;
;;;         A2: only works on X11 (not Wayland);
;;;         A3: PyPI package last updated 2021, likely abandoned
;;;    22.  hyprcap -> NEEDS_RECIPE_DESIGN_EXHAUSTED: DEP_MISSING:
;;;         Hyprland screenshot/recording utility;
;;;         A1: requires hyprland, grim, slurp, wf-recorder ecosystem;
;;;         A2: hyprland itself not in Guix (massive C++ Wayland compositor);
;;;         A3: shell wrapper with no standalone value without hyprland
;;;    23.  dict-ozhegov -> NEEDS_RECIPE_DESIGN_EXHAUSTED: DEP_MISSING:
;;;         Russian dictionary data; needs dictfmt (from dictd package) to build;
;;;         A1: source is raw text needing conversion to DICT format;
;;;         A2: dictfmt/dictd not in Guix;
;;;         A3: build script is Python 2 specific
;;;    24.  niripwmenu -> NEEDS_RECIPE_DESIGN_EXHAUSTED: DEP_MISSING:
;;;         powermenu for Niri compositor;
;;;         A1: needs python-confz, gtk4-layer-shell not in Guix;
;;;         A2: Niri compositor itself not in Guix;
;;;         A3: no standalone value without Niri
;;;    25.  brightness-controller-git -> NEEDS_RECIPE_DESIGN_EXHAUSTED: ORPHANED_ABANDONED:
;;;         brightness control GUI;
;;;         A1: AUR package orphaned; upstream last commit 2023;
;;;         A2: requires python-qt5 (PyQt5) which has complex SIP build;
;;;         A3: xrandr CLI or wlr-randr serve same purpose
;;;    26.  box -> NEEDS_RECIPE_DESIGN_EXHAUSTED: GO_MODULE_DEPS:
;;;         CLI tool for drawing frames around text;
;;;         A1: Go CLI on Codeberg; module deps need individual packaging;
;;;         A2: no pre-built binary releases available;
;;;         A3: trivial functionality achievable with shell printf
;;;    27.  backlight-sync-git -> NEEDS_RECIPE_DESIGN_EXHAUSTED: RUST_CARGO_DEPS:
;;;         backlight synchronization daemon;
;;;         A1: Rust project with no tagged releases;
;;;         A2: cargo dep tree includes inotify, clap (~15 crates);
;;;         A3: shell script with inotifywait achieves same result
;;;    28.  xcursor-openzone -> NEEDS_RECIPE_DESIGN_EXHAUSTED: DEP_MISSING:
;;;         X11 cursor theme requiring build from SVG;
;;;         A1: needs icon-slicer tool not in Guix;
;;;         A2: no pre-built cursor theme in releases;
;;;         A3: many cursor themes already available in Guix
;;;    29.  krillinai-bin -> NEEDS_RECIPE_DESIGN_EXHAUSTED: RAPIDLY_CHANGING:
;;;         AI video translation tool recently renamed to KlicStudio;
;;;         A1: project renamed; old releases may disappear;
;;;         A2: Go binary with AI service API dependencies;
;;;         A3: requires external API keys to function
;;;    30.  profile-sync-daemon-git -> NEEDS_RECIPE_DESIGN_EXHAUSTED: SYSTEMD_DEPENDENT:
;;;         browser profile sync daemon;
;;;         A1: shell scripts hardcoded for systemd unit files;
;;;         A2: uses systemd-specific paths and service management;
;;;         A3: Guix uses Shepherd; would need complete rewrite
;;;
;;; NOTE: All sha256 hashes obtained via `guix download`.

(define-module (gaurix packages recipe-resolver-260418w)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system font)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system python)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages check)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages gettext)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages image)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages man)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-crypto)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages xml)
  #:use-module (gnu packages xorg)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages web)
  #:export (
            python-certbot-pkcs12
            python-spitch
            python-invocation-tree
            python-dukpy
            python-pyexcel-ezodf
            wallman
            ttf-piazzolla
            stardict-full-eng-rus
            xdg-sound
            alttab
            gekkfetch
            jellyfetch
            tombl-bin
            klog-time-tracker-bin
            opkssh-bin
            puma-dev-bin
            rqlite-bin
            wdisplays-persistent))

;;; python-dashtable already exists in recipe-resolver-260417af.scm

;;; -------------------------------------------------------------------
;;; 2. python-certbot-pkcs12 --- PKCS#12 installer plugin for Certbot
;;; Outputs certificates in PKCS#12 format for Java/IIS servers.
;;; -------------------------------------------------------------------
(define-public python-certbot-pkcs12
  (package
    (name "python-certbot-pkcs12")
    (version "0.3.1")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "certbot_pkcs12" version))
              (sha256
               (base32
                "07gd0ipiyf6yb243liywdd1yj5312g3gfbk2y8r83776ypf9q2sl"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))  ;needs running certbot
    (native-inputs (list python-setuptools python-setuptools-scm python-wheel))
    (propagated-inputs (list python-cryptography))
    (home-page "https://github.com/icing/certbot-pkcs12")
    (synopsis "PKCS#12 installer plugin for Certbot")
    (description "This Certbot plugin converts Let's Encrypt certificates
into PKCS#12 format (.p12/.pfx files).  This is useful for Java
application servers, Microsoft IIS, and other systems that require
certificates in PKCS#12 format rather than PEM.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 3. python-spitch --- official Python library for the Spitch API
;;; Cloud speech recognition API client.
;;; -------------------------------------------------------------------
(define-public python-spitch
  (package
    (name "python-spitch")
    (version "1.49.0")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "spitch" version))
              (sha256
               (base32
                "08663y75gmp2flmv5nmrc5i323g589p4grq5r5qqikbhsj1kzc0k"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))  ;needs API credentials
    (native-inputs (list python-hatchling))
    (propagated-inputs (list python-httpx python-pydantic))
    (home-page "https://github.com/spitch-gmbh/spitch-python")
    (synopsis "official Python library for the Spitch API")
    (description "This package provides the official Python client library
for the Spitch speech recognition and natural language processing API.
It provides typed request and response models for interacting with
Spitch cloud services from Python applications.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 4. python-invocation-tree --- visualize function call trees
;;; Generates invocation trees from traced function calls.
;;; -------------------------------------------------------------------
(define-public python-invocation-tree
  (package
    (name "python-invocation-tree")
    (version "0.0.35")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "invocation_tree" version))
              (sha256
               (base32
                "0vwbdxi70n9cjsz80z5djxpisd45j6qd56kgm4ihndwpr0qh7qla"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))  ;no test suite in sdist
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://pypi.org/project/invocation-tree/")
    (synopsis "generate invocation trees of function calls")
    (description "Invocation Tree is a Python library for generating
and visualizing trees of function call invocations.  It traces the
execution flow of Python functions and produces tree-structured output
that helps in understanding complex call hierarchies.")
    (license license:bsd-2)))

;;; -------------------------------------------------------------------
;;; 5. python-dukpy --- JavaScript interpreter for Python
;;; Embeds the Duktape JavaScript engine as a C extension.
;;; -------------------------------------------------------------------
(define-public python-dukpy
  (package
    (name "python-dukpy")
    (version "0.5.1")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "dukpy" version))
              (sha256
               (base32
                "0zml50lmnxcl7rngf0fvzdb68yk0jwprbfwjp3vv2rmivv0a9shz"))))
    (build-system python-build-system)
    (arguments (list #:tests? #f))  ;tests require node.js fixtures
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://github.com/niccokunzmann/dukpy")
    (synopsis "simple JavaScript interpreter for Python")
    (description "Dukpy is a Python library that embeds the Duktape
JavaScript engine, allowing Python programs to evaluate JavaScript
code.  It supports calling JavaScript functions from Python, passing
data between the two runtimes, and running CoffeeScript, TypeScript,
and Babel transpilers.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 6. python-pyexcel-ezodf --- manipulate OpenDocument Format files
;;; Python library for creating and editing ODF spreadsheets.
;;; -------------------------------------------------------------------
(define-public python-pyexcel-ezodf
  (package
    (name "python-pyexcel-ezodf")
    (version "0.3.4")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "pyexcel-ezodf" version))
              (sha256
               (base32
                "1w8z07gcb0h1dis84whb183mxfn7ihvvgp2wzh6vdfp4n2lywblp"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))  ;tests need ODF test fixtures
    (native-inputs (list python-setuptools python-wheel))
    (propagated-inputs (list python-lxml))
    (home-page "https://github.com/pyexcel/pyexcel-ezodf")
    (synopsis "Python library for manipulating OpenDocument Format files")
    (description "Pyexcel-ezodf is a Python package for creating and
manipulating OpenDocument Format (ODF) files, particularly spreadsheets.
It provides an API for reading and writing ODS files and is used as a
backend for the pyexcel framework.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 7. wallman --- dynamic wallpaper manager for X11
;;; Sets wallpapers on a schedule using feh.
;;; -------------------------------------------------------------------
(define-public wallman
  (package
    (name "wallman")
    (version "1.5.2.8")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "wallman" version))
              (sha256
               (base32
                "18f98v49cca9h0fx5fmxxszf4c1j7dacj6wv5ldlq54az2zrd4sv"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))  ;no test suite
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://git.entheuer.de/emma/wallman")
    (synopsis "dynamic wallpaper manager for X11 window managers")
    (description "Wallman is a simple program to set dynamic wallpapers on
standalone X11 window managers.  It supports time-based wallpaper
switching using configurable schedules, integrating with feh for
wallpaper display.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 8. ttf-piazzolla --- serif typeface for long-form text
;;; Variable-weight serif font from Huerta Tipografica.
;;; -------------------------------------------------------------------
(define-public ttf-piazzolla
  (package
    (name "ttf-piazzolla")
    (version "2.005")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/huertatipografica/piazzolla"
                    "/releases/download/v" version "/Piazzolla.zip"))
              (sha256
               (base32
                "1n8cbdfxkib16603k69cknvmqv0sbvizgqs80lw1ylf9jnjn2md4"))))
    (build-system font-build-system)
    (home-page "https://github.com/huertatipografica/piazzolla")
    (synopsis "serif typeface for long-form reading")
    (description "Piazzolla is a serif variable font designed for optimal
reading in long-form text.  It features a compact appearance with
generous x-height and open counters.  The font supports Latin, Cyrillic,
and Greek scripts with multiple weights from Thin to Black.")
    (license license:silofl1.1)))

;;; -------------------------------------------------------------------
;;; 9. stardict-full-eng-rus --- English-Russian dictionary for StarDict
;;; Large dictionary data files from the XDXF project.
;;; -------------------------------------------------------------------
(define-public stardict-full-eng-rus
  (package
    (name "stardict-full-eng-rus")
    (version "2.4.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://downloads.sourceforge.net/project/xdxf"
                    "/dicts-stardict-form-xdxf/002c"
                    "/stardict-comn_sdict05_eng_rus_full-" version
                    ".tar.bz2"))
              (sha256
               (base32
                "1fywhkrbfwn6zgnf4d75ajg7w9kkf5ikhjcgzkwgk565mfk0lv8s"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/stardict/dic/eng-rus-full/"
           #:include-regexp ("\\.dict\\.dz$" "\\.idx$" "\\.ifo$")))))
    (home-page "https://sourceforge.net/projects/xdxf/")
    (synopsis "large English-Russian dictionary for StarDict")
    (description "This package provides a large English-Russian dictionary
in StarDict format, compiled from the XDXF project.  It contains
comprehensive translations suitable for use with StarDict-compatible
dictionary applications.")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 10. xdg-sound --- XDG sound theme utilities
;;; Command-line tools for managing XDG sound themes.
;;; -------------------------------------------------------------------
(define-public xdg-sound
  (package
    (name "xdg-sound")
    (version "1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/bbidulock/xdg-sound"
                    "/releases/download/" version
                    "/xdg-sound-" version ".tar.lz"))
              (sha256
               (base32
                "1ryydsr8g73wy4a77c0d4jc6m1w7yfic1pw9zq5k19lyh5idkjk2"))))
    (build-system gnu-build-system)
    (native-inputs (list pkg-config))
    (inputs (list glib libcanberra))
    (home-page "https://github.com/bbidulock/xdg-sound")
    (synopsis "command-line XDG sound theme utilities")
    (description "XDG Sound provides command-line utilities for playing
sound events from XDG sound themes.  It implements the freedesktop.org
sound theme specification, allowing desktop environments and
applications to play standardized notification and event sounds.")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 11. alttab --- X11 task switcher for minimalist window managers
;;; Alt-Tab window switcher that works with any EWMH-compliant WM.
;;; -------------------------------------------------------------------
(define-public alttab
  (package
    (name "alttab")
    (version "1.7.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/sagb/alttab/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "00zk67svdgsmvx00f1fb3kv30vxfkh7kppif4jk677xdq0nb29h9"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'unpack 'bootstrap
            (lambda _
              (invoke "autoreconf" "-fiv"))))))
    (native-inputs
     (list autoconf automake pkg-config))
    (inputs
     (list libx11 libxft libxrender libxrandr
           libxpm libpng libwnck))
    (home-page "https://github.com/sagb/alttab")
    (synopsis "task switcher for minimalistic X11 window managers")
    (description "Alttab is an X11 task switcher that provides Alt-Tab
functionality for minimalist window managers or standalone X11 sessions.
It displays window thumbnails and titles in a popup, working with any
EWMH-compliant window manager including i3, dwm, Openbox, and Fluxbox.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 12. gekkfetch --- minimalist system info tool
;;; Simple neofetch-like system information display written in C.
;;; -------------------------------------------------------------------
(define-public gekkfetch
  (package
    (name "gekkfetch")
    (version "0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/gekklee/gekkfetch")
                    (commit "5893a0a5023f14f0a27f71e2ecf0b1ed1a42f4b1")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "14p8vf7xhm260phabg4liniy2zrb114ax0h3f2wkd75a01rlcwqc"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f  ;no test suite
      #:make-flags
      #~(list (string-append "PREFIX=" #$output)
              (string-append "CC=" (or (getenv "CC") "gcc"))
              "CFLAGS=-Wno-format-security")
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure))))  ;no configure script
    (home-page "https://github.com/gekklee/gekkfetch")
    (synopsis "minimalist system information tool written in C")
    (description "Gekkfetch is a minimalist system information tool
similar to Neofetch, written in C for speed.  It displays basic system
information such as OS, kernel, uptime, shell, and memory usage in
the terminal.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 13. jellyfetch --- jelly-themed system info display
;;; Minimal neofetch-inspired tool written in C.
;;; -------------------------------------------------------------------
(define-public jellyfetch
  (package
    (name "jellyfetch")
    (version "0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/jffops/jfetch")
                    (commit "904224e65b8c8e4f05c3f4c5b2bbba7f89a9fd6c")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0ff3jgml767bc526xiqgwdgpzv0qq11ifyj65r1hw2w2b2dq9hhw"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f  ;no test suite
      #:make-flags
      #~(list (string-append "PREFIX=" #$output)
              (string-append "CC=" (or (getenv "CC") "gcc"))
              "CFLAGS=-Wno-format-security")
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure))))  ;no configure script
    (home-page "https://github.com/jffops/jfetch")
    (synopsis "minimal system information display tool")
    (description "Jellyfetch is a minimal system information display tool
inspired by Neofetch, written in C.  It shows basic system information
like OS, kernel version, uptime, and memory usage with a jelly-themed
ASCII art logo.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 14. tombl-bin --- query TOML files from the command line
;;; Pre-built Rust binary for TOML querying.
;;; -------------------------------------------------------------------
(define-public tombl-bin
  (package
    (name "tombl-bin")
    (version "0.2.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/snyball/tombl/releases/download/v"
                    version "/tombl-v" version ".tar.gz"))
              (sha256
               (base32
                "101xii8w8i86nm56j3iy2hvgr4hcqbhsi2dq4zdx081m951kqlzj"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("tombl" "bin/tombl"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/snyball/tombl")
    (synopsis "query TOML files from the command line")
    (description "Tombl is a command-line tool for querying TOML files.
It allows extracting specific values, keys, or sections from TOML
configuration files, making it easy to use TOML data in shell scripts
and pipelines.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 15. klog-time-tracker-bin --- plain-text time tracking tool
;;; Pre-built Go binary for time tracking with a plain-text format.
;;; -------------------------------------------------------------------
(define-public klog-time-tracker-bin
  (package
    (name "klog-time-tracker-bin")
    (version "7.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/jotaen/klog/releases/download/v"
                    version "/klog-linux.zip"))
              (sha256
               (base32
                "00h7jrdy558lshxpcdavgm62nq2746rqsj981i40m618ajykha7g"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("klog" "bin/klog"))))
    (native-inputs (list unzip))
    (supported-systems '("x86_64-linux"))
    (home-page "https://klog.jotaen.net")
    (synopsis "plain-text file format and CLI for time tracking")
    (description "Klog is a command-line time-tracking tool that uses a
plain-text file format.  It supports tracking work hours, breaks, and
tasks with a human-readable syntax.  The tool provides commands for
starting, stopping, and summarizing time entries.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 16. opkssh-bin --- OpenPubkey SSH authentication
;;; Pre-built binary for SSH authentication via OpenID Connect.
;;; -------------------------------------------------------------------
(define-public opkssh-bin
  (package
    (name "opkssh-bin")
    (version "0.13.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/openpubkey/opkssh/releases/download/v"
                    version "/opkssh-linux-amd64"))
              (sha256
               (base32
                "1af2yjacinixfrqz64if7n3zdv9l3v11zmznd3mkngcbk4v95x8b"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("opkssh-linux-amd64" "bin/opkssh"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'make-executable
            (lambda* (#:key outputs #:allow-other-keys)
              (chmod (string-append (assoc-ref outputs "out")
                                    "/bin/opkssh")
                     #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/openpubkey/opkssh")
    (synopsis "SSH authentication via OpenID Connect with OpenPubkey")
    (description "Opkssh enables SSH authentication using OpenID Connect
identity providers such as Google and GitHub.  It uses the OpenPubkey
protocol to bind SSH keys to OIDC tokens, allowing passwordless SSH
access using existing identity provider accounts.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 17. puma-dev-bin --- zero-config development server
;;; Pre-built binary for local development HTTP proxy.
;;; -------------------------------------------------------------------
(define-public puma-dev-bin
  (package
    (name "puma-dev-bin")
    (version "0.18.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/puma/puma-dev/releases/download/v"
                    version "/puma-dev-" version
                    "-linux-amd64.tar.gz"))
              (sha256
               (base32
                "1lksnjbbhqdnw25z0mcpwranw3pdpl94d69zj84013hkny7s65zq"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("puma-dev" "bin/puma-dev"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/puma/puma-dev")
    (synopsis "zero-configuration development server for macOS and Linux")
    (description "Puma-dev is a fast, zero-configuration development server
for web applications.  It automatically routes @code{.test} domains to
local application servers, supports automatic HTTPS via self-signed
certificates, and provides seamless integration with Rack-based and
other web frameworks.")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; 18. rqlite-bin --- lightweight distributed relational database
;;; Pre-built binary for rqlite distributed SQLite.
;;; -------------------------------------------------------------------
(define-public rqlite-bin
  (package
    (name "rqlite-bin")
    (version "9.4.5")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/rqlite/rqlite/releases/download/v"
                    version "/rqlite-v" version
                    "-linux-amd64.tar.gz"))
              (sha256
               (base32
                "0fwzbx7az45vm4jywzmycg80a8d0j54d3j7bs54sz1chj992dj4n"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~(let ((ver #$(package-version this-package)))
          (list (list (string-append "rqlite-v" ver "-linux-amd64/rqlited")
                      "bin/rqlited")
                (list (string-append "rqlite-v" ver "-linux-amd64/rqlite")
                      "bin/rqlite")
                (list (string-append "rqlite-v" ver "-linux-amd64/rqbench")
                      "bin/rqbench")))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://rqlite.io")
    (synopsis "lightweight distributed relational database built on SQLite")
    (description "Rqlite is a lightweight, distributed relational database
that uses SQLite as its storage engine.  It provides a simple HTTP API
for data operations, automatic leader election via the Raft consensus
protocol, and read consistency options.  It is designed for reliable
storage of relational data in distributed systems.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 19. wdisplays-persistent --- Wayland display configurator with
;;;     persistent configuration saving via kanshi.
;;; -------------------------------------------------------------------
(define-public wdisplays-persistent
  (package
    (name "wdisplays-persistent")
    (version "1.1.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/zipproth/wdisplays")
                    (commit "402b3fc6689de28abed518425a0a41526890c185")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0ybzmd8wz567c45zdzj0wpiq2q9z256zazhhkjqpya3z1c78dmmb"))))
    (build-system meson-build-system)
    (native-inputs (list pkg-config))
    (inputs (list gtk+ wayland wayland-protocols))
    (home-page "https://github.com/zipproth/wdisplays")
    (synopsis "GUI display configurator for wlroots Wayland compositors")
    (description "WDisplays is a graphical application for configuring
displays in wlroots-based Wayland compositors such as Sway.  This fork
adds persistent configuration saving via kanshi, allowing display
settings to be remembered across sessions.")
    (license license:gpl3+)))
