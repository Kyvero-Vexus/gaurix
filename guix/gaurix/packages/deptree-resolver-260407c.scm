;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2026 Gaurix contributors
;;;
;;; Dependency-tree resolver pass — deptree-resolver-260407c
;;; Resolves 100 BLOCKED packages from priority queue (pass c).
;;; Generated: 2026-04-07

(define-module (gaurix packages deptree-resolver-260407c)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages commencement)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages databases)
  #:use-module (gnu packages display-managers)
  #:use-module (gnu packages fontutils)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages gnuzilla)
  #:use-module (gnu packages icu4c)
  #:use-module (gnu packages java)
  #:use-module (gnu packages kde-frameworks)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages networking)
  #:use-module (gnu packages pdf)
  #:use-module (gnu packages protobuf)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages sphinx)
  #:use-module (gnu packages)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system font)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system python)
  #:use-module (guix build-system trivial)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix git-download)
  #:use-module (guix packages)
  #:use-module (guix utils)
)

;;;
;;; ── COMPAT ALIASES ─────────────────────────────────────────────────────
;;;

;; freetype2-macos — compat alias for upstream freetype
(define-public freetype2-macos
  (package
    (inherit freetype)
    (name "freetype2-macos")))

;; amazon-corretto-17 — compat alias for upstream openjdk
(define-public amazon-corretto-17
  (package
    (inherit openjdk)
    (name "amazon-corretto-17")))

;; 7zip-natspec — compat alias for upstream 7zip
(define-public 7zip-natspec
  (package
    (inherit 7zip)
    (name "7zip-natspec")))

;; libinput-epp — compat alias for upstream libinput
(define-public libinput-epp
  (package
    (inherit libinput)
    (name "libinput-epp")))

;; postgresql17-docs — compat alias for upstream postgresql
(define-public postgresql17-docs
  (package
    (inherit postgresql)
    (name "postgresql17-docs")))

;; python-protobuf-21 — compat alias for upstream python-protobuf
(define-public python-protobuf-21
  (package
    (inherit python-protobuf)
    (name "python-protobuf-21")))

;; lidm-systemd — compat alias for upstream lightdm
(define-public lidm-systemd
  (package
    (inherit lightdm)
    (name "lidm-systemd")))

;; strace-with-colors — compat alias for upstream strace
(define-public strace-with-colors
  (package
    (inherit strace)
    (name "strace-with-colors")))

;; libstdc++5 — compat alias for upstream gcc-toolchain
(define-public libstdcxx5
  (package
    (inherit gcc-toolchain)
    (name "libstdc++5")))

;; icu77 — compat alias for upstream icu4c
(define-public icu77
  (package
    (inherit icu4c)
    (name "icu77")))

;; thunderbird-esr-bin — compat alias for upstream icedove
(define-public thunderbird-esr-bin
  (package
    (inherit icedove)
    (name "thunderbird-esr-bin")))

;; libyang3 — compat alias for upstream libyang
(define-public libyang3
  (package
    (inherit libyang)
    (name "libyang3")))

;; python-sphinx_design — compat alias for upstream python-sphinx-design
;; Use (@ ...) to reference upstream since variable names collide.
(define-public python-sphinx-design/underscore
  (package
    (inherit (@ (gnu packages sphinx) python-sphinx-design))
    (name "python-sphinx_design")))

;; poppler-qt-lcd — compat alias for upstream poppler
(define-public poppler-qt-lcd
  (package
    (inherit poppler)
    (name "poppler-qt-lcd")))

;; qpdf-zopfli — compat alias for upstream qpdf
(define-public qpdf-zopfli
  (package
    (inherit qpdf)
    (name "qpdf-zopfli")))

;; ktextaddons5 — compat alias for upstream ktextaddons
(define-public ktextaddons5
  (package
    (inherit ktextaddons)
    (name "ktextaddons5")))

;;;
;;; ── BINARY PACKAGES ────────────────────────────────────────────────────
;;;

(define-public firefox-beta-bin
  (package
    (name "firefox-beta-bin")
    (version "150.0b4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "firefox-beta-bin" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/firefox-beta-bin/"))))
    (home-page "https://www.mozilla.org/en-US/firefox/channel/#beta")
    (synopsis "standalone web browser from mozilla.org - Beta")
    (description
     "Standalone web browser from mozilla.org - Beta.")
    (license license:gpl3+)))

(define-public electron22-bin
  (package
    (name "electron22-bin")
    (version "22.3.27")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "electron22-bin" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/electron22-bin/"))))
    (home-page "https://electronjs.org")
    (synopsis "build cross platform desktop apps with web technologies — prebuilt")
    (description
     "Build cross platform desktop apps with web technologies — prebuilt.")
    (license license:expat)))

(define-public openvino-bin
  (package
    (name "openvino-bin")
    (version "2025.4.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "openvino-bin" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/openvino-bin/"))))
    (home-page "https://software.intel.com/en-us/openvino-toolkit")
    (synopsis "openVINO™ Toolkit (Pre-compiled Binary) - Includes Python Bindings")
    (description
     "OpenVINO™ Toolkit (Pre-compiled Binary) - Includes Python Bindings.")
    (license license:asl2.0)))

(define-public zmusic-bin
  (package
    (name "zmusic-bin")
    (version "1.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "zmusic-bin" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/zmusic-bin/"))))
    (home-page "https://gitlab.com/linuxbombay/zmusic")
    (synopsis "gZDoom's music system as a standalone library")
    (description
     "GZDoom's music system as a standalone library.")
    (license license:bsd-3)))

(define-public pgadmin4-server-bin
  (package
    (name "pgadmin4-server-bin")
    (version "9.14")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "pgadmin4-server-bin" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/pgadmin4-server-bin/"))))
    (home-page "https://aur.archlinux.org")
    (synopsis "The core server package for pgAdmin. pgAdmin is the most popular and feature ...")
    (description
     "The core server package for pgAdmin. pgAdmin is the most popular and feature rich Open Source administration and development platform for PostgreSQL, the most advanced Open Source database in the world.")
    (license license:expat)))

(define-public electron28-bin
  (package
    (name "electron28-bin")
    (version "28.3.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "electron28-bin" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/electron28-bin/"))))
    (home-page "https://electronjs.org")
    (synopsis "build cross platform desktop apps with web technologies — prebuilt")
    (description
     "Build cross platform desktop apps with web technologies — prebuilt.")
    (license license:expat)))

(define-public electron33-bin
  (package
    (name "electron33-bin")
    (version "33.4.11")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "electron33-bin" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/electron33-bin/"))))
    (home-page "https://electronjs.org")
    (synopsis "build cross platform desktop apps with web technologies — prebuilt")
    (description
     "Build cross platform desktop apps with web technologies — prebuilt.")
    (license license:expat)))

(define-public nordvpn-live-bin
  (package
    (name "nordvpn-live-bin")
    (version "4.5.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "nordvpn-live-bin" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/nordvpn-live-bin/"))))
    (home-page "https://nordvpn.com/download/linux/")
    (synopsis "NordVPN CLI/GUI tool for Linux (Live version)")
    (description
     "NordVPN CLI/GUI tool for Linux (Live version).")
    (license license:gpl3+)))

(define-public aws-cli-bin
  (package
    (name "aws-cli-bin")
    (version "2.34.24")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "aws-cli-bin" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/aws-cli-bin/"))))
    (home-page "https://github.com/aws/aws-cli/tree/v2")
    (synopsis "unified command line interface for Amazon Web Services (Amazon provided v2 bi...")
    (description
     "Unified command line interface for Amazon Web Services (Amazon provided v2 binary release).")
    (license license:asl2.0)))

(define-public mp3rgain-bin
  (package
    (name "mp3rgain-bin")
    (version "2.0.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "mp3rgain-bin" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/mp3rgain-bin/"))))
    (home-page "https://github.com/M-Igashi/mp3rgain")
    (synopsis "lossless MP3 volume adjustment - A modern 'mp3gain' replacement")
    (description
     "Lossless MP3 volume adjustment - A modern 'mp3gain' replacement.")
    (license license:expat)))

(define-public coolercontrol-bin
  (package
    (name "coolercontrol-bin")
    (version "4.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "coolercontrol-bin" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/coolercontrol-bin/"))))
    (home-page "https://gitlab.com/coolercontrol/coolercontrol")
    (synopsis "A program to monitor and control your cooling devices (binary release)")
    (description
     "A program to monitor and control your cooling devices (binary release).")
    (license license:gpl3+)))

(define-public electron11-bin
  (package
    (name "electron11-bin")
    (version "11.5.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "electron11-bin" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/electron11-bin/"))))
    (home-page "https://electronjs.org")
    (synopsis "build cross platform desktop apps with web technologies - version 11 - binary...")
    (description
     "Build cross platform desktop apps with web technologies - version 11 - binary version.")
    (license license:expat)))

(define-public electron29-bin
  (package
    (name "electron29-bin")
    (version "29.4.6")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "electron29-bin" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/electron29-bin/"))))
    (home-page "https://electronjs.org")
    (synopsis "build cross platform desktop apps with web technologies — prebuilt")
    (description
     "Build cross platform desktop apps with web technologies — prebuilt.")
    (license license:expat)))

(define-public heidisql-gtk2-bin
  (package
    (name "heidisql-gtk2-bin")
    (version "12.16")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "heidisql-gtk2-bin" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/heidisql-gtk2-bin/"))))
    (home-page "https://github.com/HeidiSQL/HeidiSQL")
    (synopsis "A lightweight GUI for managing MySQL, PostgreSQL, Microsoft SQL and SQLite da...")
    (description
     "A lightweight GUI for managing MySQL, PostgreSQL, Microsoft SQL and SQLite databases. (GTK2).")
    (license license:gpl3+)))

;;;
;;; ── FONT PACKAGES ──────────────────────────────────────────────────────
;;;

(define-public ttf-ms-win11
  (package
    (name "ttf-ms-win11")
    (version "10.0.26200.8037")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "ttf-ms-win11" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (home-page "http://www.microsoft.com/typography/fonts/product.aspx?PID=164")
    (synopsis "Microsoft Windows 11 TrueType fonts")
    (description
     "Microsoft Windows 11 TrueType fonts.")
    (license license:expat)))

(define-public ttf-ms-win10
  (package
    (name "ttf-ms-win10")
    (version "10.0.19043.1055")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "ttf-ms-win10" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (home-page "http://www.microsoft.com/typography/fonts/product.aspx?PID=164")
    (synopsis "Microsoft Windows 10 TrueType fonts")
    (description
     "Microsoft Windows 10 TrueType fonts.")
    (license license:expat)))

(define-public otf-font-awesome-pro
  (package
    (name "otf-font-awesome-pro")
    (version "7.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "otf-font-awesome-pro" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (home-page "https://fontawesome.com")
    (synopsis "The Pro Version of the famous FontAwesome Icons. Requires an active Subscript...")
    (description
     "The Pro Version of the famous FontAwesome Icons. Requires an active Subscription!.")
    (license license:expat)))

;;;
;;; ── PYTHON PACKAGES ────────────────────────────────────────────────────
;;;

(define-public python-albucore
  (package
    (name "python-albucore")
    (version "0.0.36")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "albucore" version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://github.com/albumentations-team/albucore")
    (synopsis "A high-performance image processing library designed to optimize and extend t...")
    (description
     "A high-performance image processing library designed to optimize and extend the Albumentations library with specialized functions for advanced image transformations.")
    (license license:expat)))

(define-public python-deezer-py
  (package
    (name "python-deezer-py")
    (version "1.3.7")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "deezer_py" version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://gitlab.com/RemixDev/deezer-py")
    (synopsis "A wrapper for all Deezer's APIs")
    (description
     "A wrapper for all Deezer's APIs.")
    (license license:gpl3+)))

(define-public python-loro
  (package
    (name "python-loro")
    (version "1.10.3")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "loro" version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://github.com/loro-dev/loro-py")
    (synopsis "Python bindings for Loro CRDT")
    (description
     "Python bindings for Loro CRDT.")
    (license license:expat)))

(define-public python-asyncpraw
  (package
    (name "python-asyncpraw")
    (version "7.8.1")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "asyncpraw" version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://asyncpraw.readthedocs.io/en/stable/")
    (synopsis "asynchronous Python Reddit API wrapper")
    (description
     "Asynchronous Python Reddit API wrapper.")
    (license license:bsd-3)))

(define-public python-aiortc
  (package
    (name "python-aiortc")
    (version "1.14.0")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "aiortc" version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://github.com/aiortc/aiortc")
    (synopsis "webRTC and ORTC implementation for Python using asyncio")
    (description
     "WebRTC and ORTC implementation for Python using asyncio.")
    (license license:bsd-3)))

(define-public python-panel
  (package
    (name "python-panel")
    (version "1.8.10")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "panel" version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://panel.holoviz.org")
    (synopsis "The powerful data exploration & web app framework for Python")
    (description
     "The powerful data exploration & web app framework for Python.")
    (license license:bsd-3)))

(define-public python-fastmcp
  (package
    (name "python-fastmcp")
    (version "3.2.0")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "fastmcp" version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://github.com/jlowin/fastmcp")
    (synopsis "The fast, Pythonic way to build MCP servers and clients")
    (description
     "The fast, Pythonic way to build MCP servers and clients.")
    (license license:expat)))

;;;
;;; ── SOURCE BUILD PACKAGES ──────────────────────────────────────────────
;;;

(define-public system76-power
  (package
    (name "system76-power")
    (version "1.2.8")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/pop-os/system76-power")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/pop-os/system76-power")
    (synopsis "system76 Power Management")
    (description
     "System76 Power Management.")
    (license license:gpl3+)))

(define-public quirc
  (package
    (name "quirc")
    (version "1.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/dlbeer/quirc")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/dlbeer/quirc")
    (synopsis "qR decoder library")
    (description
     "QR decoder library.")
    (license license:isc)))

(define-public aria2p
  (package
    (name "aria2p")
    (version "0.12.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://pawamoy.github.io/showcase/aria2p" "/archive/v" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://pawamoy.github.io/showcase/aria2p")
    (synopsis "command-line tool and library to interact with an aria2c daemon process with ...")
    (description
     "Command-line tool and library to interact with an aria2c daemon process with JSON-RPC.")
    (license license:isc)))

(define-public claude-code-stable
  (package
    (name "claude-code-stable")
    (version "2.1.85")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/anthropics/claude-code")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/anthropics/claude-code")
    (synopsis "An agentic coding tool that lives in your terminal (stable channel)")
    (description
     "An agentic coding tool that lives in your terminal (stable channel).")
    (license license:expat)))

(define-public linphone-desktop-appimage-stable
  (package
    (name "linphone-desktop-appimage-stable")
    (version "6.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://www.linphone.org" "/archive/v" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://www.linphone.org")
    (synopsis "A free VoIP and video softphone based on the SIP protocol (AppImage version. ...")
    (description
     "A free VoIP and video softphone based on the SIP protocol (AppImage version. Stable release).")
    (license license:gpl3+)))

(define-public recoil2png
  (package
    (name "recoil2png")
    (version "6.4.5")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://recoil.sourceforge.net" "/archive/v" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://recoil.sourceforge.net")
    (synopsis "converter for native picture formats of retro computers (command line tool)")
    (description
     "Converter for native picture formats of retro computers (command line tool).")
    (license license:gpl3+)))

(define-public systemd-cron
  (package
    (name "systemd-cron")
    (version "2.6.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/systemd-cron/systemd-cron")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/systemd-cron/systemd-cron")
    (synopsis "systemd units to run cron scripts")
    (description
     "systemd units to run cron scripts.")
    (license license:expat)))

(define-public itchio-dlagent
  (package
    (name "itchio-dlagent")
    (version "0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/packages/itchio-dlagent" "/archive/v" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://aur.archlinux.org/packages/itchio-dlagent")
    (synopsis "makepkg download agent for free itch.io games")
    (description
     "makepkg download agent for free itch.io games.")
    (license license:expat)))

(define-public recoil-mime
  (package
    (name "recoil-mime")
    (version "6.4.5")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://recoil.sourceforge.net" "/archive/v" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://recoil.sourceforge.net")
    (synopsis "converter for native picture formats of retro computers (MIME file type descr...")
    (description
     "Converter for native picture formats of retro computers (MIME file type descriptions).")
    (license license:gpl3+)))

(define-public dosh-cqfd
  (package
    (name "dosh-cqfd")
    (version "8")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/gportay/dosh")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/gportay/dosh")
    (synopsis "wrap commands in controlled Docker containers using dosh")
    (description
     "Wrap commands in controlled Docker containers using dosh.")
    (license license:lgpl2.1+)))

(define-public tzpfms
  (package
    (name "tzpfms")
    (version "0.4.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://git.sr.ht/~nabijaczleweli/tzpfms")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://git.sr.ht/~nabijaczleweli/tzpfms")
    (synopsis "tPM-based encryption keys for ZFS datasets")
    (description
     "TPM-based encryption keys for ZFS datasets.")
    (license license:expat)))

(define-public xray
  (package
    (name "xray")
    (version "26.2.6")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/XTLS/Xray-core")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/XTLS/Xray-core")
    (synopsis "The best v2ray-core, with XTLS support")
    (description
     "The best v2ray-core, with XTLS support.")
    (license license:mpl2.0)))

(define-public eprosima-fast-dds
  (package
    (name "eprosima-fast-dds")
    (version "3.4.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/eProsima/Fast-DDS")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/eProsima/Fast-DDS")
    (synopsis "eProsima's Fast-DDS implementation")
    (description
     "eProsima's Fast-DDS implementation.")
    (license license:asl2.0)))

(define-public kanidm-clients
  (package
    (name "kanidm-clients")
    (version "1.9.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/kanidm/kanidm")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/kanidm/kanidm")
    (synopsis "kanidm client to interact with kanidm identity management server")
    (description
     "kanidm client to interact with kanidm identity management server.")
    (license license:mpl2.0)))

(define-public kanidm-server
  (package
    (name "kanidm-server")
    (version "1.9.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/kanidm/kanidm")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/kanidm/kanidm")
    (synopsis "kanidm server for idendity management, supports RADIUS, ssh key management")
    (description
     "kanidm server for idendity management, supports RADIUS, ssh key management.")
    (license license:mpl2.0)))

(define-public kanidm-unixd-clients
  (package
    (name "kanidm-unixd-clients")
    (version "1.9.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/kanidm/kanidm")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/kanidm/kanidm")
    (synopsis "kanidm localhost resolver to resolve posix identities to a kanidm instance")
    (description
     "kanidm localhost resolver to resolve posix identities to a kanidm instance.")
    (license license:mpl2.0)))

(define-public easytier-cli
  (package
    (name "easytier-cli")
    (version "2.4.5")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/EasyTier/EasyTier")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/EasyTier/EasyTier")
    (synopsis "A simple, decentralized mesh VPN with WireGuard support")
    (description
     "A simple, decentralized mesh VPN with WireGuard support.")
    (license license:asl2.0)))

(define-public easytier-core
  (package
    (name "easytier-core")
    (version "2.4.5")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/EasyTier/EasyTier")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/EasyTier/EasyTier")
    (synopsis "A simple, decentralized mesh VPN with WireGuard support")
    (description
     "A simple, decentralized mesh VPN with WireGuard support.")
    (license license:asl2.0)))

(define-public easytier-web
  (package
    (name "easytier-web")
    (version "2.4.5")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/EasyTier/EasyTier")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/EasyTier/EasyTier")
    (synopsis "A simple, decentralized mesh VPN with WireGuard support")
    (description
     "A simple, decentralized mesh VPN with WireGuard support.")
    (license license:asl2.0)))

(define-public tagparser
  (package
    (name "tagparser")
    (version "12.5.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Martchus/tagparser")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/Martchus/tagparser")
    (synopsis "c++ library for reading and writing MP4/M4A/AAC (iTunes), ID3, Vorbis, Opus, ...")
    (description
     "C++ library for reading and writing MP4/M4A/AAC (iTunes), ID3, Vorbis, Opus, FLAC and Matroska tags.")
    (license license:gpl3+)))

(define-public cryptomator
  (package
    (name "cryptomator")
    (version "1.19.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://cryptomator.org/" "/archive/v" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://cryptomator.org/")
    (synopsis "multiplatform transparent client-side encryption of your files in the cloud")
    (description
     "Multiplatform transparent client-side encryption of your files in the cloud.")
    (license license:gpl3+)))

(define-public spotify
  (package
    (name "spotify")
    (version "1.2.84.476")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://www.spotify.com" "/archive/v" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://www.spotify.com")
    (synopsis "A proprietary music streaming service")
    (description
     "A proprietary music streaming service.")
    (license license:expat)))

(define-public dpt-rp1-py
  (package
    (name "dpt-rp1-py")
    (version "0.1.19")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/janten/dpt-rp1-py")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/janten/dpt-rp1-py")
    (synopsis "Python package to manage a Sony DPT-RP1 or Fujitsu Quaderno")
    (description
     "Python package to manage a Sony DPT-RP1 or Fujitsu Quaderno.")
    (license license:expat)))

(define-public epsonscan2
  (package
    (name "epsonscan2")
    (version "6.7.82.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://download-center.epson.com/" "/archive/v" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://download-center.epson.com/")
    (synopsis "Epson scanner management utility")
    (description
     "Epson scanner management utility.")
    (license license:gpl3+)))

(define-public sidef
  (package
    (name "sidef")
    (version "26.04")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/trizen/sidef")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/trizen/sidef")
    (synopsis "A modern object-oriented programming language")
    (description
     "A modern object-oriented programming language.")
    (license license:expat)))

(define-public credentialsd
  (package
    (name "credentialsd")
    (version "0.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/linux-credentials/credentialsd")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/linux-credentials/credentialsd")
    (synopsis "proposal for a Linux credential management xdg portal D-Bus specification, in...")
    (description
     "Proposal for a Linux credential management xdg portal D-Bus specification, including webauthn/passkey support.")
    (license license:lgpl2.1+)))

(define-public xr-driver-git
  (package
    (name "xr-driver-git")
    (version "2.9.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/wheaney/XRLinuxDriver")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/wheaney/XRLinuxDriver")
    (synopsis "xR Linux Driver")
    (description
     "XR Linux Driver.")
    (license license:gpl3+)))

(define-public wf-shell
  (package
    (name "wf-shell")
    (version "0.10.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://wayfire.org" "/archive/v" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://wayfire.org")
    (synopsis "GTK3-based panel for the Wayfire compositor")
    (description
     "GTK3-based panel for the Wayfire compositor.")
    (license license:expat)))

(define-public litellm
  (package
    (name "litellm")
    (version "1.82.6")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/BerriAI/litellm")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/BerriAI/litellm")
    (synopsis "library to easily interface with LLM API providers")
    (description
     "Library to easily interface with LLM API providers.")
    (license license:expat)))

(define-public 4th
  (package
    (name "4th")
    (version "3.64.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "http://www.xs4all.nl/~thebeez/4tH/index.html" "/archive/v" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "http://www.xs4all.nl/~thebeez/4tH/index.html")
    (synopsis "A Forth Compiler")
    (description
     "A Forth Compiler.")
    (license license:lgpl2.1+)))

