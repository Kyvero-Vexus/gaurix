;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260417q
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages (BLOCKED items).
;;;
;;; Recipes (30):
;;;   1. hush-bin (copy/binary, v0.1.4, MIT)
;;;   2. k3s-bin (copy/binary, v1.34.4+k3s1, Apache-2.0)
;;;   3. localstack-cli-bin (copy/binary, v4.10.0, Apache-2.0)
;;;   4. vector-bin (copy/binary, v0.51.0, MPL-2.0)
;;;   5. leaf-bin (copy/binary, v0.14.2, Apache-2.0)
;;;   6. rdrop-bin (copy/binary, v0.1.3, GPL-3.0)
;;;   7. random-rs-bin (copy/binary, v0.2.4, GPL-3.0)
;;;   8. mediaharbor-bin (copy/binary, v1.1.0, GPL-3.0)
;;;   9. youtube-music-for-desktop-bin (copy/binary, v0.18.9, CC0-1.0)
;;;  10. devtoys-bin (copy/binary, v2.0.9.0, MIT)
;;;  11. python-quantities (pyproject, v0.16.4, BSD-3)
;;;  12. python-keyboard (pyproject, v0.13.5, MIT)
;;;  13. python-readchar (pyproject, v4.2.2, MIT)
;;;  14. python-smart-open (pyproject, v7.6.0, MIT)
;;;  15. python-duet (pyproject, v0.2.9, Apache-2.0)
;;;  16. python-nanoid (pyproject, v2.0.0, MIT)
;;;  17. python-untokenize (pyproject, v0.1.1, MIT)
;;;  18. python-bsdiff4 (pyproject, v1.2.6, BSD-3)
;;;  19. python-proto-plus (pyproject, v1.27.2, Apache-2.0)
;;;  20. python-huey (pyproject, v3.0.0, MIT)
;;;  21. python-uritools (pyproject, v6.0.1, MIT)
;;;  22. python-neo4j (pyproject, v6.1.0, GPL-3.0)
;;;  23. python-pae (pyproject, v1.0.0, MIT)
;;;  24. python-opr (pyproject, v0.6, MIT)
;;;  25. python-memor (pyproject, v1.1, MIT)
;;;  26. xapp-symbolic-icons (meson, v1.0.9, LGPL-3.0)
;;;  27. ansiweather (copy/script, v1.19.0, BSD-2)
;;;  28. libayatana-appindicator-glib (cmake, v2.0.1, GPL-3.0+)
;;;  29. python-chromaterm (pyproject, v0.10.7, MIT)
;;;  30. python-qbittorrent-api (pyproject, v2025.11.1, MIT)
;;;
;;; 30 recipes written. 0 BLOCKED.
;;;
;;; NOTE: All sha256 hashes obtained via `guix download`.

(define-module (gaurix packages recipe-resolver-260417q)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system python)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages protobuf)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages web)
  #:export (
            hush-bin
            k3s-bin
            localstack-cli-bin
            vector-bin
            leaf-bin
            rdrop-bin
            random-rs-bin
            mediaharbor-bin
            youtube-music-for-desktop-bin
            devtoys-bin
            python-quantities
            python-keyboard
            python-readchar
            python-smart-open
            python-duet
            python-nanoid
            python-untokenize
            python-bsdiff4
            python-proto-plus
            python-huey
            python-uritools
            python-neo4j
            python-pae
            python-opr
            python-memor
            xapp-symbolic-icons
            ansiweather
            libayatana-appindicator-glib
            python-chromaterm
            python-qbittorrent-api
            ))

;;; -------------------------------------------------------------------
;;; 1. hush-bin — Unix shell scripting language based on Lua
;;; -------------------------------------------------------------------
(define-public hush-bin
  (package
    (name "hush-bin")
    (version "0.1.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/hush-shell/hush/releases/download/v"
                    version "-alpha/hush-" version "-x86_64.tar.gz"))
              (sha256
               (base32
                "0l3x1dz9g3cb4bf26qiy092aaq5qnkkkp7c71gmm3blwb9a3bhb6"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("hush" "bin/hush"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "unix shell scripting language based on Lua")
    (description "Hush is a Unix shell scripting language that combines
the power of Lua's expression system with shell-like command invocation.
It provides a familiar syntax for shell operations while offering
structured data types and proper error handling.")
    (home-page "https://github.com/hush-shell/hush")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 2. k3s-bin — lightweight Kubernetes distribution
;;; -------------------------------------------------------------------
(define-public k3s-bin
  (package
    (name "k3s-bin")
    (version "1.34.4+k3s1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/k3s-io/k3s/releases/download/v"
                    (string-replace-substring version "+" "%2B")
                    "/k3s"))
              (sha256
               (base32
                "015mdl9nw73y6ag9nwy3zgvag8vyhigl6ll60pmgas1lm214nh4l"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("k3s" "bin/k3s"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (copy-file source "k3s")
                   (chmod "k3s" #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "lightweight Kubernetes distribution")
    (description "K3s is a lightweight, certified Kubernetes distribution
designed for production workloads in resource-constrained environments.
It packages the Kubernetes control plane, container runtime, and networking
into a single binary under 100MB.")
    (home-page "https://k3s.io")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 3. localstack-cli-bin — LocalStack CLI for AWS local testing
;;; -------------------------------------------------------------------
(define-public localstack-cli-bin
  (package
    (name "localstack-cli-bin")
    (version "4.10.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/localstack/localstack-cli"
                    "/releases/download/v" version
                    "/localstack-cli-" version
                    "-linux-amd64-onefile.tar.gz"))
              (sha256
               (base32
                "067gafbc5ss65dad7ar2g6gncwpwcc3yca2hqinzwaxjdkw6vf4s"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("localstack" "bin/localstack"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "command-line interface for LocalStack")
    (description "LocalStack CLI provides a command-line interface
for managing LocalStack, a fully functional local cloud stack that
emulates AWS services for development and testing.  This package
installs the pre-built single-file binary.")
    (home-page "https://localstack.cloud")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 4. vector-bin — high-performance observability data pipeline
;;; -------------------------------------------------------------------
(define-public vector-bin
  (package
    (name "vector-bin")
    (version "0.51.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/vectordotdev/vector/releases/download/v"
                    version "/vector-" version
                    "-x86_64-unknown-linux-gnu.tar.gz"))
              (sha256
               (base32
                "1hrmr5if0g5z6c80rf9fzqabwc9v8icz94017ip7cww8my5rlf10"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("bin/vector" "bin/vector")
               ("etc/vector/" "etc/vector/"
                #:include-regexp ("\\.toml$" "\\.yaml$")))))
    (supported-systems '("x86_64-linux"))
    (synopsis "high-performance observability data pipeline")
    (description "Vector is a high-performance observability data pipeline
that collects, transforms, and routes logs, metrics, and traces.  It is
written in Rust and designed as a lightweight alternative to heavyweight
agents like Logstash or Fluentd.")
    (home-page "https://vector.dev")
    (license license:mpl2.0)))

;;; -------------------------------------------------------------------
;;; 5. leaf-bin — versatile proxy framework
;;; -------------------------------------------------------------------
(define-public leaf-bin
  (package
    (name "leaf-bin")
    (version "0.14.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/eycorsican/leaf/releases/download/v"
                    version "/leaf-x86_64-unknown-linux-musl.gz"))
              (sha256
               (base32
                "0wlp5dn9kz4a2v967ayw0kj3fa5hh1487y1qbzwqmllh3gxprscf"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("leaf" "bin/leaf"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (copy-file source "leaf.gz")
                   (invoke "gzip" "-d" "leaf.gz")
                   (chmod "leaf" #o755))))))
    (native-inputs (list gzip))
    (supported-systems '("x86_64-linux"))
    (synopsis "versatile and efficient proxy framework")
    (description "Leaf is a versatile and efficient proxy framework
written in Rust.  It supports multiple proxy protocols including
Trojan, VMess, VLESS, Shadowsocks, and SOCKS5 with traffic routing
and load balancing capabilities.")
    (home-page "https://github.com/eycorsican/leaf")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 6. rdrop-bin — terminal dropdown utilities for Hyprland
;;; -------------------------------------------------------------------
(define-public rdrop-bin
  (package
    (name "rdrop-bin")
    (version "0.1.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/lucafulgenzi/rdrop/releases/download/"
                    version "/rdrop-x86_64-unknown-linux-gnu.tar.gz"))
              (sha256
               (base32
                "0aa9iy8li2r3qphf55ns112kj4rm3krmrhd7xki5npih1n4yxlmi"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("rdrop" "bin/rdrop"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "terminal dropdown utilities for Hyprland")
    (description "Rdrop provides terminal dropdown utilities for the
Hyprland Wayland compositor.  It allows toggling terminal windows as
dropdown overlays using hyprctl, similar to Quake-style consoles.")
    (home-page "https://github.com/lucafulgenzi/rdrop")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 7. random-rs-bin — generate random numbers from CLI
;;; -------------------------------------------------------------------
(define-public random-rs-bin
  (package
    (name "random-rs-bin")
    (version "0.2.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/one-d-wide/random-rs/releases/download/v"
                    version "/random-rs-linux-x86_64"))
              (sha256
               (base32
                "07il35wk3k496dfnrhj9gl68xci3rbnvykzfmhbabys1n90pvfqh"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("random-rs" "bin/random-rs"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (copy-file source "random-rs")
                   (chmod "random-rs" #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "generate random numbers from the command line")
    (description "Random-rs is a command-line tool for generating random
numbers with configurable distributions, ranges, and output formats.
It supports integer and floating-point generation with various
probability distributions.")
    (home-page "https://github.com/one-d-wide/random-rs")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 8. mediaharbor-bin — all-in-one media downloader
;;; -------------------------------------------------------------------
(define-public mediaharbor-bin
  (package
    (name "mediaharbor-bin")
    (version "1.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/MediaHarbor/mediaharbor/releases"
                    "/download/v" version
                    "/MediaHarbor-" version ".deb"))
              (sha256
               (base32
                "1ahkki3xir2pfqprsnpm0lxvm068caqwh1355gd08ssw0almn2s7"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("usr/lib" "lib")
               ("usr/share" "share"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (invoke "ar" "x" source)
                   (invoke "tar" "xf" "data.tar.xz"))))))
    (native-inputs (list tar))
    (supported-systems '("x86_64-linux"))
    (synopsis "all-in-one media downloader")
    (description "MediaHarbor is an all-in-one media downloader application
that provides a graphical interface for downloading media from various
online sources.  It integrates with yt-dlp and supports multiple
platforms and formats.")
    (home-page "https://github.com/MediaHarbor/mediaharbor")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 9. youtube-music-for-desktop-bin — unofficial YouTube Music desktop app
;;; -------------------------------------------------------------------
(define-public youtube-music-for-desktop-bin
  (package
    (name "youtube-music-for-desktop-bin")
    (version "0.18.9")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Venipa/ytmdesktop2/releases/download/v"
                    version "/YouTube-Music-for-Desktop-" version ".AppImage"))
              (sha256
               (base32
                "18gb080hg9rmkqlajmsa4jnybh3sckknh4w4f062cn2v708ip7l9"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("ytmdesktop.AppImage" "bin/youtube-music-for-desktop"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (copy-file source "ytmdesktop.AppImage")
                   (chmod "ytmdesktop.AppImage" #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "unofficial YouTube Music desktop application")
    (description "YouTube Music for Desktop is an unofficial Electron-based
desktop application for YouTube Music.  It provides Last.fm scrobbling,
media key support, Discord Rich Presence, and a system tray interface.")
    (home-page "https://youtube-music.app")
    (license license:cc0)))

;;; -------------------------------------------------------------------
;;; 10. devtoys-bin — Swiss Army knife for developers
;;; -------------------------------------------------------------------
(define-public devtoys-bin
  (package
    (name "devtoys-bin")
    (version "2.0.9.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/DevToys-app/DevToys/releases/download/v"
                    version "/devtoys_linux_x64.deb"))
              (sha256
               (base32
                "1x9b8nbnmf1146hl31m69kg0dml51kazgirvgds2b2kxnyb2ip9n"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("usr/lib" "lib")
               ("usr/bin" "bin")
               ("usr/share" "share"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (invoke "ar" "x" source)
                   (invoke "tar" "xf" "data.tar.xz"))))))
    (native-inputs (list tar))
    (supported-systems '("x86_64-linux"))
    (synopsis "Swiss Army knife for developers")
    (description "DevToys is a collection of developer utilities packaged
into a single application.  It includes JSON formatters, Base64
encoders/decoders, hash generators, UUID generators, regex testers,
color pickers, and many other tools commonly needed during development.")
    (home-page "https://devtoys.app")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 11. python-quantities — physical quantities with units
;;; -------------------------------------------------------------------
(define-public python-quantities
  (package
    (name "python-quantities")
    (version "0.16.4")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "quantities" version))
              (sha256
               (base32
                "0dmzk17hd0c6lzjlipjpc52jdifknpvxq15javn19n3f9yvxxdpm"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (propagated-inputs (list python-numpy))
    (native-inputs (list python-setuptools python-setuptools-scm python-wheel))
    (synopsis "support for physical quantities with units")
    (description "Quantities is a Python library for arithmetic and
conversion of physical quantities with units.  It is built on top
of NumPy and supports dimensional analysis, unit conversion, and
uncertainty propagation.")
    (home-page "https://github.com/python-quantities/python-quantities")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; 12. python-keyboard — global keyboard hooks and hotkeys
;;; -------------------------------------------------------------------
(define-public python-keyboard
  (package
    (name "python-keyboard")
    (version "0.13.5")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "keyboard" version ".zip"))
              (sha256
               (base32
                "12rh7lph62vypg9mzbgmcci29s23rkjmadx7r6jrr4smb4q87vb3"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel unzip))
    (synopsis "hook and simulate global keyboard events")
    (description "Python-keyboard allows hooking global keyboard events,
registering hotkeys, simulating key presses, and much more.  It provides
a cross-platform API for keyboard input handling with support for complex
hotkey combinations and key recording.")
    (home-page "https://github.com/boppreh/keyboard")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 13. python-readchar — read single characters from stdin
;;; -------------------------------------------------------------------
(define-public python-readchar
  (package
    (name "python-readchar")
    (version "4.2.2")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "readchar" version))
              (sha256
               (base32
                "1n2x9mb28krvn3skjafjcd6dscx1601p01wiqw5cb47w2vz71cp3"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "library to read single characters and key strokes")
    (description "Readchar is a Python library that reads single
characters and key strokes from standard input.  It works without
requiring the user to press Enter, making it suitable for interactive
command-line applications and menus.")
    (home-page "https://github.com/magmax/python-readchar")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 14. python-smart-open — streaming large files from cloud storage
;;; -------------------------------------------------------------------
(define-public python-smart-open
  (package
    (name "python-smart-open")
    (version "7.6.0")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "smart_open" version))
              (sha256
               (base32
                "0zmx0j88ia0g3cw83c5pydjg05n4s49mv3mq0fn6y9zznm37ywa4"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (propagated-inputs (list python-wrapt))
    (native-inputs (list python-setuptools python-setuptools-scm python-wheel))
    (synopsis "streaming large files from various storage backends")
    (description "Smart-open is a Python library for efficient streaming
of very large files from and to various storage backends including S3,
GCS, Azure Blob Storage, HDFS, HTTP, and local filesystem.  It provides
a drop-in replacement for Python's built-in @code{open()} function.")
    (home-page "https://github.com/piskvorky/smart_open")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 15. python-duet — simple future-based async library
;;; -------------------------------------------------------------------
(define-public python-duet
  (package
    (name "python-duet")
    (version "0.2.9")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "duet" version))
              (sha256
               (base32
                "1ww74px2lrk87sa3hjnrxqrscj56pny5yzn4jq8cwgba5rc3kynn"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "simple future-based async library for Python")
    (description "Duet is a simple async library for Python developed
by Google.  It provides a future-based programming model that is simpler
than asyncio, designed for use in quantum computing libraries like Cirq.")
    (home-page "https://github.com/google/duet")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 16. python-nanoid — URL-friendly unique ID generator
;;; -------------------------------------------------------------------
(define-public python-nanoid
  (package
    (name "python-nanoid")
    (version "2.0.0")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "nanoid" version))
              (sha256
               (base32
                "0s7s9rp4c8wxpn18yp9a1d1cpxw9w55b6bzs84xaxsf6x7awm02s"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "URL-friendly unique string ID generator")
    (description "Nanoid is a tiny, secure, URL-friendly unique string ID
generator for Python.  It uses cryptographically strong random values and
generates compact IDs suitable for use in URLs and database keys.")
    (home-page "https://github.com/puyuan/py-nanoid")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 17. python-untokenize — transform tokens back to source code
;;; -------------------------------------------------------------------
(define-public python-untokenize
  (package
    (name "python-untokenize")
    (version "0.1.1")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "untokenize" version))
              (sha256
               (base32
                "18ipdy9dlpqzpnfcc9ginyl0xq0b7rzvxwbjm9gbpd7gp2xxnr9q"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "transform tokens back into original source code")
    (description "Untokenize transforms Python tokens back into the
original source code while preserving whitespace.  Unlike the standard
library's @code{tokenize.untokenize}, this version faithfully reproduces
the original formatting.")
    (home-page "https://github.com/myint/untokenize")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 18. python-bsdiff4 — binary diff and patch using BSDIFF4 format
;;; -------------------------------------------------------------------
(define-public python-bsdiff4
  (package
    (name "python-bsdiff4")
    (version "1.2.6")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "bsdiff4" version))
              (sha256
               (base32
                "07bmdcfwbsfh3ckc9jywv7g8428kskmczjfcbagf4fcblw0pvd9a"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "binary diff and patch using BSDIFF4 format")
    (description "Bsdiff4 provides binary diff and patch functionality
using the BSDIFF4 format.  It includes both a Python interface and
C extension for efficient binary delta generation and application.")
    (home-page "https://github.com/ilanschnell/bsdiff4")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; 19. python-proto-plus — beautiful, Pythonic protocol buffers
;;; -------------------------------------------------------------------
(define-public python-proto-plus
  (package
    (name "python-proto-plus")
    (version "1.27.2")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "proto_plus" version))
              (sha256
               (base32
                "093a9dbkxamld28xafn8vx855rpx0h0wngadqhvmgxxdmm9xxbdj"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (propagated-inputs (list python-protobuf))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "beautiful, Pythonic protocol buffers wrapper")
    (description "Proto-plus provides a clean, Pythonic interface to
protocol buffers.  It wraps protobuf-generated classes with Pythonic
dataclass-like access patterns, making protocol buffer messages feel
like native Python objects.")
    (home-page "https://github.com/googleapis/proto-plus-python")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 20. python-huey — lightweight task queue for Python
;;; -------------------------------------------------------------------
(define-public python-huey
  (package
    (name "python-huey")
    (version "3.0.0")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "huey" version))
              (sha256
               (base32
                "1xgs19iy551skgvjmqbs3r3csqvjm8k3ffjs6w6jn4whgdhq7z0c"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "lightweight task queue for Python")
    (description "Huey is a lightweight task queue for Python.  It supports
Redis, SQLite, and in-memory storage backends with features including
task scheduling, periodic tasks, retries, task pipelines, and result
storage.  It is designed to be simple yet powerful.")
    (home-page "https://github.com/coleifer/huey")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 21. python-uritools — URI parsing, classification and composition
;;; -------------------------------------------------------------------
(define-public python-uritools
  (package
    (name "python-uritools")
    (version "6.0.1")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "uritools" version))
              (sha256
               (base32
                "1y4lgd4fjxj8j5lxvsy7v6cfn1jalhjgfqy8n8r751z7ajwrr7ig"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "URI parsing, classification and composition")
    (description "Uritools provides RFC 3986 compliant functions for
parsing, classifying, and composing URIs and URI references.  It can
split URIs into components, resolve relative references, and normalize
URI strings.")
    (home-page "https://github.com/tkem/uritools")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 22. python-neo4j — Neo4j Bolt driver for Python
;;; -------------------------------------------------------------------
(define-public python-neo4j
  (package
    (name "python-neo4j")
    (version "6.1.0")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "neo4j" version))
              (sha256
               (base32
                "110ba39lx26i399jyiaxvkpmngnxj3cnjdbkwdm7n7j8v30fipdm"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "Neo4j Bolt driver for Python")
    (description "This package provides the official Neo4j driver for
Python, implementing the Bolt protocol for communicating with Neo4j
graph databases.  It supports synchronous and asynchronous operations,
transactions, and connection pooling.")
    (home-page "https://neo4j.com")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 23. python-pae — pre-authentication encoding
;;; -------------------------------------------------------------------
(define-public python-pae
  (package
    (name "python-pae")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "pae" version))
              (sha256
               (base32
                "0flanarp5awmp1fxi69s2y24s011sv4dqs2p6x7q2b85y01ajlnj"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "pre-authentication encoding for cryptographic protocols")
    (description "PAE implements Pre-Authentication Encoding as specified
in the PASETO (Platform-Agnostic Security Tokens) standard.  It provides
a canonical encoding for multi-part messages used in authenticated
encryption schemes.")
    (home-page "https://github.com/MatthiasValvekens/python-pae")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 24. python-opr — Optimized Primer tool
;;; -------------------------------------------------------------------
(define-public python-opr
  (package
    (name "python-opr")
    (version "0.6")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "opr" version))
              (sha256
               (base32
                "0gb9q922ypln7a82illrmkq2pi5i6wgf1082nbhjpq766ikrw5a6"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "optimized primer design tool")
    (description "OPR is an optimized primer design tool for molecular
biology.  It assists in designing PCR primers with optimal melting
temperatures, GC content, and minimal secondary structure formation.")
    (home-page "https://github.com/openscilab/opr")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 25. python-memor — structured memory for LLMs
;;; -------------------------------------------------------------------
(define-public python-memor
  (package
    (name "python-memor")
    (version "1.1")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "memor" version))
              (sha256
               (base32
                "0k1bi6kyhghq1hywy5w9s6cc2wcml0x9iyap2gqz9mqapcb5d293"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "reproducible structured memory for LLMs")
    (description "Memor provides reproducible structured memory management
for large language models.  It offers a framework for storing, retrieving,
and managing context that can be used across LLM sessions.")
    (home-page "https://github.com/openscilab/memor")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 26. xapp-symbolic-icons — symbolic icons for XApp projects
;;; -------------------------------------------------------------------
(define-public xapp-symbolic-icons
  (package
    (name "xapp-symbolic-icons")
    (version "1.0.9")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/xapp-project/xapp-symbolic-icons"
                    "/archive/refs/tags/" version ".tar.gz"))
              (sha256
               (base32
                "1fvf5v6akzm7v8mav8i91spmqy4ibicik4a1pi24vwrlm8z61fqf"))))
    (build-system meson-build-system)
    (native-inputs (list pkg-config))
    (propagated-inputs (list hicolor-icon-theme))
    (synopsis "symbolic icons for Linux Mint XApp projects")
    (description "This package provides symbolic icons used by Linux
Mint's XApp project libraries and applications.  The icons follow
the freedesktop icon naming specification and integrate with the
hicolor icon theme.")
    (home-page "https://github.com/xapp-project/xapp-symbolic-icons")
    (license license:lgpl3)))

;;; -------------------------------------------------------------------
;;; 27. ansiweather — weather in terminal with ANSI colors
;;; -------------------------------------------------------------------
(define-public ansiweather
  (package
    (name "ansiweather")
    (version "1.19.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/fcambus/ansiweather/archive/refs/tags/"
                    version ".tar.gz"))
              (sha256
               (base32
                "0kbgqj6h0g2lhjrm7s79r1r7swb0lpad55sxd9y773fi0i32v42w"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("ansiweather" "bin/ansiweather")
               ("ansiweather.1" "share/man/man1/ansiweather.1"))))
    (inputs (list curl jq))
    (synopsis "weather in your terminal with ANSI colors and Unicode symbols")
    (description "Ansiweather is a shell script for displaying the current
weather conditions in your terminal using ANSI colors and Unicode symbols.
It fetches data from the OpenWeatherMap API and presents temperature,
humidity, wind, and forecast information in a compact format.")
    (home-page "https://github.com/fcambus/ansiweather")
    (license license:bsd-2)))

;;; -------------------------------------------------------------------
;;; 28. libayatana-appindicator-glib — app indicator library (pure GLib)
;;; -------------------------------------------------------------------
(define-public libayatana-appindicator-glib
  (package
    (name "libayatana-appindicator-glib")
    (version "2.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/AyatanaIndicators"
                    "/libayatana-appindicator-glib/archive/refs/tags/"
                    version ".tar.gz"))
              (sha256
               (base32
                "01n4fpmvf7x9d4gh8c5q7l7xk3yasz1nx6254x9x18w95px5h3k7"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config gobject-introspection))
    (inputs (list glib))
    (synopsis "app indicator shared library using pure GLib")
    (description "Libayatana-appindicator-glib is a pure GLib-2.0
reimplementation of the application indicator shared library.  It
provides system tray icon functionality without depending on GTK
or dbusmenu, making it suitable for lightweight applications.")
    (home-page
     "https://github.com/AyatanaIndicators/libayatana-appindicator-glib")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 29. python-chromaterm — colorize terminal output with regex
;;; -------------------------------------------------------------------
(define-public python-chromaterm
  (package
    (name "python-chromaterm")
    (version "0.10.7")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "chromaterm" version))
              (sha256
               (base32
                "0slc5d5yns6rh5931x7r3pfagljbh1nrsnpdn9kw1aa5yb0386d3"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (propagated-inputs (list python-psutil python-pyyaml))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "colorize terminal output with regular expressions")
    (description "ChromaTerm reads from standard input and colorizes
the output based on user-defined regular expression rules.  It can
be used to highlight log files, command output, and any other text
streams with ANSI color codes.")
    (home-page "https://github.com/hSaria/ChromaTerm")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 30. python-qbittorrent-api — qBittorrent Web API client
;;; -------------------------------------------------------------------
(define-public python-qbittorrent-api
  (package
    (name "python-qbittorrent-api")
    (version "2025.11.1")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "qbittorrent_api" version))
              (sha256
               (base32
                "1i14jzsv02a3qh89km7h7mf0mrjbiffjbl1vw0bgd5dwz1ls9cjw"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (propagated-inputs (list python-requests python-urllib3 python-packaging))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "Python client for qBittorrent v4.1+ Web API")
    (description "This package provides a complete Python client for the
qBittorrent Web API.  It supports all API endpoints for managing torrents,
categories, tags, RSS feeds, search, and application settings in
qBittorrent v4.1 and later.")
    (home-page "https://github.com/rmartin16/qbittorrent-api")
    (license license:expat)))
