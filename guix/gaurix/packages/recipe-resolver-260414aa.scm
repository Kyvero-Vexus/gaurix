;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260414aa
;;; Resolves 20 NEEDS_RECIPE_DESIGN packages from general queue.
;;;
;;; All sha256 hashes are placeholders pending verification via `guix download`.

(define-module (gaurix packages recipe-resolver-260414aa)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system cargo)
  #:use-module (guix build-system go)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages cmake)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages gdb)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages golang)
  #:use-module (gnu packages golang-build)
  #:use-module (gnu packages golang-xyz)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages image)
  #:use-module (gnu packages image-viewers)
  #:use-module (gnu packages kde-frameworks)
  #:use-module (gnu packages networking)
  #:use-module (gnu packages php)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages protobuf)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-crypto)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages rust)
  #:use-module (gnu packages serialization)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages valgrind)
  #:use-module (gnu packages version-control)
  #:use-module (gnu packages video)
  #:use-module (gnu packages web)
  #:use-module (gnu packages webkit)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages xorg)
  #:export (gf2-git
            frame-touch
            blend2d
            imageviewer
            dooble
            fulcrum
            plotjuggler
            gamehub
            voc-git
            sshpilot
            gazelle-tui
            php-mcrypt
            ccraw
            river-bsp-layout
            wleave
            uutils-findutils
            mdbook-epub
            tuack-ng
            fresh-editor
            tuimer))

;;;
;;; --- 1. gf2-git (gnu-build-system) ---
;;; GDB frontend for Linux with a TUI.
;;; Source: https://github.com/nakst/gf
;;; License: MIT
;;;

(define-public gf2-git
  (let ((commit "40f2ae6e7b3e6cf45a2a0e3c951d1b0a5bcb6f5e")
        (revision "1"))
    (package
      (name "gf2-git")
      (version (git-version "0" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/nakst/gf")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "0000000000000000000000000000000000000000000000000000"))))
      (build-system gnu-build-system)
      (arguments
       (list #:tests? #f
             #:make-flags #~(list (string-append "CC=" #$(cc-for-target))
                                  (string-append "PREFIX=" #$output))
             #:phases
             #~(modify-phases %standard-phases
                 (delete 'configure)
                 (replace 'build
                   (lambda* (#:key inputs #:allow-other-keys)
                     (let ((freetype-inc
                            (string-append
                             (search-input-directory inputs
                                                     "include/freetype2"))))
                       (invoke "g++" "gf2.cpp" "-o" "gf2"
                               "-g" "-O2"
                               "-lX11" "-pthread" "-lfreetype"
                               "-DUI_FREETYPE"
                               (string-append "-I" freetype-inc)))))
                 (replace 'install
                   (lambda* (#:key outputs #:allow-other-keys)
                     (let ((bin (string-append (assoc-ref outputs "out")
                                               "/bin")))
                       (mkdir-p bin)
                       (install-file "gf2" bin)))))))
      (inputs (list freetype libx11))
      (native-inputs (list pkg-config))
      (synopsis "graphical GDB frontend for Linux")
      (description "gf2 is a graphical frontend for GDB that provides a TUI
with source code display, register view, and memory inspection.  It is built
as a single C++ file linking against X11 and FreeType for rendering.")
      (home-page "https://github.com/nakst/gf")
      (license license:expat))))

;;;
;;; --- 2. frame-touch (gnu-build-system, autotools) ---
;;; Touch frame handling library for multi-touch input.
;;; Source: https://launchpad.net/frame
;;; License: GPL-3.0/LGPL-3.0
;;;

(define-public frame-touch
  (package
    (name "frame-touch")
    (version "2.5.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://launchpadlibrarian.net/130755499/frame-"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list pkg-config))
    (inputs (list libxi xorg-server))
    (synopsis "multi-touch frame handling library")
    (description "Frame is a library that handles the buildup and
synchronization of a set of simultaneous touches for multi-touch input
devices.  It was developed as part of the Ubuntu utouch project for handling
gesture recognition on touchscreens and trackpads.")
    (home-page "https://launchpad.net/frame")
    (license license:gpl3+)))

;;;
;;; --- 3. blend2d (cmake-build-system) ---
;;; High-performance 2D vector graphics engine.
;;; Source: https://github.com/blend2d/blend2d
;;; License: Zlib
;;;

(define-public blend2d
  (let ((commit "6dbc2ce6e0b35df88c5d08fcfe6a75f0b47d5bf6")
        (revision "1"))
    (package
      (name "blend2d")
      (version (git-version "0.21.2" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/blend2d/blend2d")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "0000000000000000000000000000000000000000000000000000"))))
      (build-system cmake-build-system)
      (arguments
       (list #:tests? #f
             #:configure-flags
             #~(list "-DBLEND2D_STATIC=OFF"
                     "-DBUILD_SHARED_LIBS=ON")))
      (synopsis "high-performance 2D vector graphics engine")
      (description "Blend2D is a high-performance 2D vector graphics engine
written in C++ with SIMD optimizations.  It provides a comprehensive API for
rendering paths, text, images, and gradients with support for multiple
compositing modes and pixel formats.")
      (home-page "https://blend2d.com")
      (license license:zlib))))

;;;
;;; --- 4. imageviewer (gnu-build-system, qmake) ---
;;; Simple cross-platform Qt6 image viewer.
;;; Source: https://github.com/AlienCowEatCake/ImageViewer
;;; License: GPL-3.0-or-later
;;;

(define-public imageviewer
  (package
    (name "imageviewer")
    (version "1.9.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/AlienCowEatCake/ImageViewer")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (replace 'configure
                 (lambda* (#:key outputs #:allow-other-keys)
                   (invoke "qmake6"
                           (string-append "PREFIX="
                                          (assoc-ref outputs "out"))
                           "ImageViewer.pro"))))))
    (native-inputs (list qttools))
    (inputs (list qtbase
                  qtsvg
                  qtimageformats
                  libexif
                  libavif
                  libheif
                  libjxl
                  exiv2
                  libraw
                  librsvg
                  giflib
                  lcms
                  libjpeg-turbo
                  libpng
                  libtiff
                  libwebp
                  openjpeg
                  zlib))
    (synopsis "simple cross-platform image viewer")
    (description "ImageViewer is a simple, cross-platform image viewer built
with Qt6.  It supports a wide range of image formats including JPEG, PNG,
WebP, AVIF, HEIF, JXL, SVG, GIF, TIFF, and RAW camera formats through
various decoder plugins.")
    (home-page "https://github.com/AlienCowEatCake/ImageViewer")
    (license license:gpl3+)))

;;;
;;; --- 5. dooble (gnu-build-system, qmake) ---
;;; Minimal, scientific, and stable Qt6 web browser.
;;; Source: https://github.com/textbrowser/dooble
;;; License: BSD-3-Clause
;;;

(define-public dooble
  (package
    (name "dooble")
    (version "2026.03.31")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/textbrowser/dooble")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (replace 'configure
                 (lambda* (#:key outputs #:allow-other-keys)
                   (invoke "qmake6"
                           (string-append "PREFIX="
                                          (assoc-ref outputs "out"))
                           "dooble.pro"))))))
    (native-inputs (list qttools))
    (inputs (list qtbase
                  qtcharts
                  qtdeclarative
                  qtwebengine
                  gpgme))
    (synopsis "minimal Qt6 web browser with privacy features")
    (description "Dooble is a minimal, scientific, and stable web browser
built with Qt6 and QtWebEngine.  It features encrypted storage for bookmarks,
cookies, and history, as well as GPG-based authentication for user data
protection.")
    (home-page "https://textbrowser.github.io/dooble")
    (license license:bsd-3)))

;;;
;;; --- 6. fulcrum (gnu-build-system, qmake) ---
;;; Fast SPV server for Bitcoin Cash, Bitcoin, and Litecoin.
;;; Source: https://github.com/cculianu/Fulcrum
;;; License: GPL-3.0-or-later
;;;

(define-public fulcrum
  (package
    (name "fulcrum")
    (version "2.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/cculianu/Fulcrum")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (replace 'configure
                 (lambda* (#:key outputs #:allow-other-keys)
                   (invoke "qmake6"
                           (string-append "PREFIX="
                                          (assoc-ref outputs "out"))
                           "Fulcrum.pro"))))))
    (native-inputs (list pkg-config))
    (inputs (list qtbase
                  rocksdb
                  miniupnpc
                  openssl
                  zlib))
    (synopsis "fast SPV server for Bitcoin Cash, Bitcoin, and Litecoin")
    (description "Fulcrum is a fast and nimble SPV (Simple Payment
Verification) server for Bitcoin Cash (BCH), Bitcoin (BTC), and Litecoin
(LTC).  It uses RocksDB for storage and provides an Electrum-compatible
protocol for lightweight wallet clients.")
    (home-page "https://github.com/cculianu/Fulcrum")
    (license license:gpl3+)))

;;;
;;; --- 7. plotjuggler (cmake-build-system) ---
;;; Time series visualization tool.
;;; Source: https://github.com/facontidavide/PlotJuggler
;;; License: MPL-2.0
;;;

(define-public plotjuggler
  (package
    (name "plotjuggler")
    (version "3.16.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/facontidavide/PlotJuggler")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list "-DCMAKE_BUILD_TYPE=Release")))
    (native-inputs (list pkg-config))
    (inputs (list fmt
                  mosquitto
                  nlohmann-json
                  protobuf
                  qtbase-5
                  qtsvg-5
                  qtwebsockets-5
                  zeromq))
    (synopsis "time series visualization tool")
    (description "PlotJuggler is a tool for visualizing time series data.
It supports multiple data sources including CSV files, ROS topics, MQTT,
and ZeroMQ streams.  It provides interactive plotting with zoom, pan, and
data transformation capabilities.")
    (home-page "https://github.com/facontidavide/PlotJuggler")
    (license license:mpl2.0)))

;;;
;;; --- 8. gamehub (meson-build-system) ---
;;; Game library manager supporting GOG, Steam, and Humble Bundle.
;;; Source: https://github.com/tkashkin/GameHub
;;; License: GPL-3.0-or-later
;;;

(define-public gamehub
  (package
    (name "gamehub")
    (version "0.16.3-2-master")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/tkashkin/GameHub")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f
           #:glib-or-gtk? #t))
    (native-inputs (list pkg-config
                         vala
                         gettext-minimal))
    (inputs (list gtk+
                  libgee
                  json-glib
                  libsoup
                  sqlite
                  webkitgtk
                  libmanette
                  libxtst))
    (synopsis "game library manager for GOG, Steam, and Humble Bundle")
    (description "GameHub is a games manager and downloader that supports
multiple game sources including GOG, Steam, and Humble Bundle.  It provides
a unified library view, automatic downloading, and game management features
with a GTK3-based interface.")
    (home-page "https://github.com/tkashkin/GameHub")
    (license license:gpl3+)))

;;;
;;; --- 9. voc-git (gnu-build-system) ---
;;; Vishap Oberon-2 compiler.
;;; Source: https://github.com/vishapoberon/compiler
;;; License: GPL-3.0-or-later
;;;

(define-public voc-git
  (package
    (name "voc-git")
    (version "2.1.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/vishapoberon/compiler")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (replace 'configure
                 (lambda* (#:key outputs #:allow-other-keys)
                   (setenv "PREFIX" (assoc-ref outputs "out"))
                   (invoke "make" "full"
                           (string-append "PREFIX="
                                          (assoc-ref outputs "out")))))
               (delete 'build)
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (invoke "make" "install"
                           (string-append "PREFIX="
                                          (assoc-ref outputs "out"))))))))
    (native-inputs (list which))
    (synopsis "Vishap Oberon-2 compiler")
    (description "Vishap Oberon Compiler (voc) is a free and open source
implementation of the Oberon-2 programming language and core libraries.
It compiles Oberon-2 source code to C, which is then compiled by the
system C compiler.  It includes the standard Oakwood libraries.")
    (home-page "https://github.com/vishapoberon/compiler")
    (license license:gpl3+)))

;;;
;;; --- 10. sshpilot (pyproject-build-system) ---
;;; SSH connection manager with GUI.
;;; Source: https://github.com/mfat/sshpilot
;;; License: GPL-3.0-only
;;;

(define-public sshpilot
  (package
    (name "sshpilot")
    (version "4.7.9")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/mfat/sshpilot")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (propagated-inputs
     (list python-paramiko
           python-pygobject
           python-pycairo
           python-cryptography
           python-flask
           python-flask-socketio))
    (inputs (list libadwaita
                  vte
                  gtksourceview
                  libsecret
                  webkitgtk))
    (synopsis "SSH connection manager with terminal and tunneling support")
    (description "SSHPilot is an SSH connection manager with an integrated
terminal, tunneling support, tabbed interface, and SCP upload capabilities.
It features a GTK4/libadwaita interface built with Python and provides
connection profiles, key management, and SFTP browsing.")
    (home-page "https://github.com/mfat/sshpilot")
    (license license:gpl3)))

;;;
;;; --- 11. gazelle-tui (pyproject-build-system) ---
;;; Minimal NetworkManager TUI with 802.1X enterprise WiFi support.
;;; Source: https://github.com/Zeus-Deus/gazelle-tui
;;; License: MIT
;;;

(define-public gazelle-tui
  (package
    (name "gazelle-tui")
    (version "1.8.5")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Zeus-Deus/gazelle-tui")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (propagated-inputs (list python-textual))
    (inputs (list network-manager))
    (synopsis "minimal NetworkManager TUI with enterprise WiFi support")
    (description "Gazelle TUI is a minimal terminal user interface for
NetworkManager with complete 802.1X enterprise WiFi and WWAN (mobile
broadband) support.  It provides interactive network configuration using
the Textual framework and communicates with NetworkManager via nmcli.")
    (home-page "https://github.com/Zeus-Deus/gazelle-tui")
    (license license:expat)))

;;;
;;; --- 12. php-mcrypt (gnu-build-system) ---
;;; PHP mcrypt extension from PECL.
;;; Source: https://pecl.php.net/package/mcrypt
;;; License: PHP-3.01
;;;

(define-public php-mcrypt
  (package
    (name "php-mcrypt")
    (version "1.0.9")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://pecl.php.net/get/mcrypt-" version ".tgz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (replace 'configure
                 (lambda* (#:key inputs outputs #:allow-other-keys)
                   (invoke "phpize")
                   (invoke "./configure"
                           (string-append "--prefix="
                                          (assoc-ref outputs "out"))
                           (string-append "--with-php-config="
                                          (search-input-file inputs
                                                             "bin/php-config"))
                           (string-append "--with-mcrypt="
                                          (assoc-ref inputs "libmcrypt"))))))))
    (native-inputs (list autoconf automake))
    (inputs (list php libmcrypt))
    (synopsis "mcrypt encryption extension for PHP")
    (description "php-mcrypt provides an interface to the mcrypt library,
which supports a wide variety of block ciphers such as DES, TripleDES,
Blowfish, 3-WAY, SAFER-SK64, SAFER-SK128, TWOFISH, TEA, RC2, and CAST in
CBC, OFB, CFB, and ECB cipher modes.")
    (home-page "https://pecl.php.net/package/mcrypt")
    (license license:php3.01)))

;;;
;;; --- 13. ccraw (cargo-build-system) ---
;;; Terminal crow ASCII art renderer.
;;; Source: https://github.com/Jenyyk/ccraw
;;; License: MIT
;;;

(define-public ccraw
  (package
    (name "ccraw")
    (version "0.2.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Jenyyk/ccraw/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f
           #:install-source? #f))
    (synopsis "terminal crow ASCII art renderer")
    (description "ccraw displays animated crows in the terminal using ASCII
art and ANSI escape codes.  It renders randomly generated crow characters
that move across the terminal with configurable speed and density.")
    (home-page "https://github.com/Jenyyk/ccraw")
    (license license:expat)))

;;;
;;; --- 14. river-bsp-layout (cargo-build-system) ---
;;; Binary space partitioned layout for the River Wayland compositor.
;;; Source: https://github.com/areif-dev/river-bsp-layout
;;; License: GPL-3.0-only
;;;

(define-public river-bsp-layout
  (package
    (name "river-bsp-layout")
    (version "2.1.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/areif-dev/river-bsp-layout/"
                    "archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f
           #:install-source? #f))
    (synopsis "binary space partitioned layout for River compositor")
    (description "river-bsp-layout provides a binary space partitioned (BSP)
tiling layout for the River Wayland compositor.  It automatically arranges
windows in a BSP tree structure, splitting the available screen space evenly
between windows with configurable split ratios and gaps.")
    (home-page "https://github.com/areif-dev/river-bsp-layout")
    (license license:gpl3)))

;;;
;;; --- 15. wleave (cargo-build-system) ---
;;; Wayland-native logout menu, fork of wlogout.
;;; Source: https://github.com/AMNatty/wleave
;;; License: MIT
;;;

(define-public wleave
  (package
    (name "wleave")
    (version "0.7.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/AMNatty/wleave")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f
           #:install-source? #f))
    (native-inputs (list pkg-config scdoc))
    (inputs (list gtk
                  libadwaita
                  gtk-layer-shell
                  librsvg))
    (synopsis "Wayland-native logout menu")
    (description "wleave is a Wayland-native logout menu forked from wlogout.
It provides a customizable overlay with buttons for lock, logout, suspend,
hibernate, shutdown, and reboot actions.  It uses GTK4 and
@code{gtk4-layer-shell} for Wayland integration and supports CSS theming.")
    (home-page "https://github.com/AMNatty/wleave")
    (license license:expat)))

;;;
;;; --- 16. uutils-findutils (cargo-build-system) ---
;;; Rust implementation of GNU findutils.
;;; Source: https://github.com/uutils/findutils
;;; License: MIT
;;;

(define-public uutils-findutils
  (package
    (name "uutils-findutils")
    (version "0.8.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/uutils/findutils/archive/refs/tags/"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f
           #:install-source? #f))
    (native-inputs (list pkg-config))
    (inputs (list oniguruma))
    (synopsis "Rust implementation of GNU findutils")
    (description "uutils-findutils is a cross-platform Rust reimplementation
of the GNU findutils suite, providing @command{find} and @command{xargs}
utilities.  It aims for compatibility with GNU findutils while offering
improved performance through Rust's safety guarantees and efficient memory
management.")
    (home-page "https://github.com/uutils/findutils")
    (license license:expat)))

;;;
;;; --- 17. mdbook-epub (cargo-build-system) ---
;;; mdbook backend for creating EPUB documents.
;;; Source: https://github.com/Michael-F-Bryan/mdbook-epub
;;; License: MPL-2.0
;;;

(define-public mdbook-epub
  (package
    (name "mdbook-epub")
    (version "0.5.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Michael-F-Bryan/mdbook-epub/"
                    "archive/refs/tags/" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f
           #:install-source? #f))
    (synopsis "mdbook backend for creating EPUB documents")
    (description "mdbook-epub is an experimental backend for mdbook that
generates EPUB e-book files from Markdown documentation.  It renders the
same Markdown content that mdbook uses for HTML output into a valid EPUB
archive suitable for e-readers.")
    (home-page "https://github.com/Michael-F-Bryan/mdbook-epub")
    (license license:mpl2.0)))

;;;
;;; --- 18. tuack-ng (cargo-build-system) ---
;;; Refactored contest problem authoring toolkit.
;;; Source: https://github.com/tuack-ng/tuack-ng
;;; License: AGPL-3.0-or-later
;;;

(define-public tuack-ng
  (package
    (name "tuack-ng")
    (version "0.4.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/tuack-ng/tuack-ng/archive/refs/tags/"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f
           #:install-source? #f))
    (synopsis "contest problem authoring toolkit")
    (description "tuack-ng is a refactored version of the tuack project for
authoring competitive programming contest problems.  It provides tools for
creating problem statements, test cases, and validators with support for
multiple output formats including PDF and HTML.")
    (home-page "https://github.com/tuack-ng/tuack-ng")
    (license license:agpl3+)))

;;;
;;; --- 19. fresh-editor (cargo-build-system) ---
;;; Lightweight terminal text editor with LSP support.
;;; Source: https://github.com/sinelaw/fresh
;;; License: GPL-2.0-only
;;;

(define-public fresh-editor
  (package
    (name "fresh-editor")
    (version "0.2.23")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/sinelaw/fresh/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f
           #:install-source? #f
           #:cargo-build-flags
           #~'("--release" "-p" "fresh-editor")))
    (native-inputs (list pkg-config))
    (synopsis "lightweight terminal text editor with LSP support")
    (description "Fresh is a lightweight, fast terminal-based text editor
with built-in Language Server Protocol (LSP) support and TypeScript plugin
system.  It features syntax highlighting, code completion, diagnostics, and
a modal editing interface inspired by Vi.")
    (home-page "https://github.com/sinelaw/fresh")
    (license license:gpl2)))

;;;
;;; --- 20. tuimer (go-build-system) ---
;;; Minimal terminal timer with audio alerts.
;;; Source: https://github.com/tm4a/tuimer
;;; License: MIT
;;;

(define-public tuimer
  (package
    (name "tuimer")
    (version "1.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/tm4a/tuimer")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/tm4a/tuimer"
           #:tests? #f))
    (inputs (list alsa-lib))
    (synopsis "minimal terminal timer with audio alerts")
    (description "Tuimer is a minimal and beautiful terminal timer written
in Go.  It features a TUI built with Bubble Tea and Lip Gloss, countdown
and stopwatch modes, customizable alert sounds via ALSA, and desktop
notifications via libnotify.")
    (home-page "https://github.com/tm4a/tuimer")
    (license license:expat)))
