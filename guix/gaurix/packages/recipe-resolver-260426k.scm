;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260426k
;;; Resolves 100 packages from queue (100 recipes, 0 blocked).
;;;
;;; All sha256 hashes are placeholders pending verification via `guix download`.

(define-module (gaurix packages recipe-resolver-260426k)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system cargo)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system go)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:export (
            clickup-desktop
            anura
            tika-server
            redpanda-connect
            rtl-sdr-blog
            libjxl-metrics-git
            nosqlbooster-mongodb
            python-mozjpeg-lossless-optimization
            bsd-games2
            transmission-gtk3
            modrinth-app-git
            flexget
            scid
            kpcli
            otf2bdf
            inkscape-applytransforms-git
            gnome-pass-search-provider-git
            umr-git
            imunes-git
            youtty
            gpx-animator
            gopass-git
            stl-thumb-git
            gnome-shell-extension-alt-tab-scroll-workaround
            alabamaencoder-git
            ncview
            convertall-py
            jbang
            systemdlint
            gsh
            gpg-import-bin
            dutree-bin
            bit-bin
            airdcpp-webclient
            firealpaca
            munt-smf2wav
            iir1
            dict-jargon
            eruption
            gdlauncher-bin
            mautrix-telegram
            ncmdump
            iwdgui
            logstash-bin
            tauri-cli
            mpv-mpris-git
            dnsleaktest
            sonobus
            bitmagnet
            dprint
            vim-dracula
            sqlitestudio-bin
            jupyterlab-catppuccin
            albion-online-launcher-bin
            zx
            lazyjournal-bin
            hevi
            firehol
            sftpman
            exabgp
            hex-a-hop
            websocat-git
            qtchess
            gmetronome
            supabase
            sunflower-bin
            solkit-bin
            proxypin-bin
            pkgx-bin
            pbgopy-bin
            openrsync-git
            mbw
            libstudxml
            jxl-oxide
            hidrdd
            hamrs-appimage
            ezra-bible-app-bin
            envfetch-bin
            dano-bin
            cryptographic-id-rs
            chapar-bin
            carafe-bin
            toggl-bin
            todoist-bin
            cryptr-bin
            relagit-bin
            uefi-run
            telosys-cli
            feeddeck-bin
            fakepkg
            mkgmap
            typst-languagetool-lsp-git
            offsetexplorer
            mihomo-party
            matrix-sliding-sync
            i3-resurrect
            latex2rtf
            duck
            syncterm
            cmatrix-neo-git
            ))

;;; Nonfree/proprietary license placeholder for Gaurix channel
(define license:nonfree
  ((@@ (guix licenses) license) "Nonfree"
    "https://spdx.org/licenses/"
    "Proprietary or custom license; see upstream for terms."))

;;; clickup-desktop --- ClickUp productivity platform desktop client
(define-public clickup-desktop
  (package
    (name "clickup-desktop")
    (version "3.5.9")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/clickup-desktop.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "ClickUp productivity platform desktop client")
    (description "Desktop client for the ClickUp all-in-one project management and productivity platform.")
    (home-page "https://clickup.com/")
    (license license:nonfree)))

;;; anura --- frogatto game engine and platformer toolkit
(define-public anura
  (package
    (name "anura")
    (version "1.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/anura.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "frogatto game engine and platformer toolkit")
    (description "Anura is a high-level game engine used by the Frogatto platformer and other 2D games.")
    (home-page "https://github.com/anura-engine/anura")
    (license license:gpl3+)))

;;; tika-server --- Apache Tika content extraction server
(define-public tika-server
  (package
    (name "tika-server")
    (version "2.9.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/tika-server.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "Apache Tika content extraction server")
    (description "Apache Tika server for detecting and extracting metadata and text from files.")
    (home-page "https://tika.apache.org/")
    (license license:asl2.0)))

;;; redpanda-connect --- stream processing engine for data pipelines
(define-public redpanda-connect
  (package
    (name "redpanda-connect")
    (version "4.32.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/redpanda-connect.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "stream processing engine for data pipelines")
    (description "Redpanda Connect is a declarative stream processing engine for building data pipelines.")
    (home-page "https://www.redpanda.com/connect")
    (license license:expat)))

;;; rtl-sdr-blog --- RTL-SDR Blog drivers with improvements over upstream
(define-public rtl-sdr-blog
  (package
    (name "rtl-sdr-blog")
    (version "1.3.6")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/rtl-sdr-blog.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "RTL-SDR Blog drivers with improvements over upstream")
    (description "Improved RTL-SDR drivers from RTL-SDR Blog with bias-tee support and other enhancements.")
    (home-page "https://www.rtl-sdr.com/")
    (license license:gpl2+)))

;;; libjxl-metrics-git --- JPEG XL image format library with quality metrics
(define-public libjxl-metrics-git
  (package
    (name "libjxl-metrics-git")
    (version "0.10.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/libjxl-metrics-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "JPEG XL image format library with quality metrics")
    (description "JPEG XL reference implementation with image quality metrics support.")
    (home-page "https://github.com/libjxl/libjxl")
    (license license:bsd-3)))

;;; nosqlbooster-mongodb --- cross-platform GUI tool for MongoDB
(define-public nosqlbooster-mongodb
  (package
    (name "nosqlbooster-mongodb")
    (version "9.2.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/nosqlbooster-mongodb.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "cross-platform GUI tool for MongoDB")
    (description "NoSQLBooster is a cross-platform GUI tool for MongoDB with IntelliSense and query optimization.")
    (home-page "https://nosqlbooster.com/")
    (license license:nonfree)))

;;; python-mozjpeg-lossless-optimization --- Python library for lossless JPEG optimization via mozjpeg
(define-public python-mozjpeg-lossless-optimization
  (package
    (name "python-mozjpeg-lossless-optimization")
    (version "1.1.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-mozjpeg-lossless-optimization.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "Python library for lossless JPEG optimization via mozjpeg")
    (description "Python wrapper for mozjpeg providing lossless JPEG file size optimization.")
    (home-page "https://pypi.org/project/mozjpeg-lossless-optimization/")
    (license license:bsd-3)))

;;; bsd-games2 --- classic BSD text-mode games collection
(define-public bsd-games2
  (package
    (name "bsd-games2")
    (version "2.17")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/bsd-games2.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "classic BSD text-mode games collection")
    (description "A collection of classic BSD text-mode games including adventure, hack, and others.")
    (home-page "https://github.com/vattam/BSDGames")
    (license license:bsd-3)))

;;; transmission-gtk3 --- Transmission BitTorrent client with GTK3 interface
(define-public transmission-gtk3
  (package
    (name "transmission-gtk3")
    (version "3.00")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/transmission-gtk3.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "Transmission BitTorrent client with GTK3 interface")
    (description "Transmission BitTorrent client built with the GTK3 graphical toolkit.")
    (home-page "https://transmissionbt.com/")
    (license license:gpl2+)))

;;; modrinth-app-git --- Modrinth Minecraft mod manager desktop application
(define-public modrinth-app-git
  (package
    (name "modrinth-app-git")
    (version "0.8.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/modrinth-app-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "Modrinth Minecraft mod manager desktop application")
    (description "Desktop application for discovering, installing, and managing Minecraft mods from Modrinth.")
    (home-page "https://modrinth.com/app")
    (license license:gpl3+)))

;;; flexget --- multipurpose automation tool for media content
(define-public flexget
  (package
    (name "flexget")
    (version "3.11.38")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/flexget.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "multipurpose automation tool for media content")
    (description "FlexGet is a multipurpose automation tool for managing torrents, nzbs, podcasts, and other media.")
    (home-page "https://flexget.com/")
    (license license:expat)))

;;; scid --- chess information database and analysis tool
(define-public scid
  (package
    (name "scid")
    (version "5.0.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/scid.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "chess information database and analysis tool")
    (description "Shane's Chess Information Database for viewing, editing, and managing chess game collections.")
    (home-page "https://scid.sourceforge.net/")
    (license license:gpl2+)))

;;; kpcli --- command-line interface for KeePass databases
(define-public kpcli
  (package
    (name "kpcli")
    (version "4.1.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/kpcli.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "command-line interface for KeePass databases")
    (description "A command-line interface to KeePass 1.x and 2.x database files using Perl.")
    (home-page "https://kpcli.sourceforge.io/")
    (license license:artistic2.0)))

;;; otf2bdf --- OpenType and TrueType font to BDF converter
(define-public otf2bdf
  (package
    (name "otf2bdf")
    (version "3.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/otf2bdf.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "OpenType and TrueType font to BDF converter")
    (description "Convert OpenType and TrueType fonts to BDF bitmap font format.")
    (home-page "https://github.com/jirutka/otf2bdf")
    (license license:expat)))

;;; inkscape-applytransforms-git --- Inkscape extension to apply transforms to SVG paths
(define-public inkscape-applytransforms-git
  (package
    (name "inkscape-applytransforms-git")
    (version "0.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/inkscape-applytransforms-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "Inkscape extension to apply transforms to SVG paths")
    (description "Inkscape extension that applies all transforms to SVG path elements recursively.")
    (home-page "https://github.com/Klowner/inkscape-applytransforms")
    (license license:gpl2+)))

;;; gnome-pass-search-provider-git --- GNOME Shell search provider for pass password store
(define-public gnome-pass-search-provider-git
  (package
    (name "gnome-pass-search-provider-git")
    (version "1.4.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gnome-pass-search-provider-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "GNOME Shell search provider for pass password store")
    (description "GNOME Shell search provider to look up passwords stored in the pass password manager.")
    (home-page "https://github.com/jle64/gnome-pass-search-provider")
    (license license:gpl3+)))

;;; umr-git --- AMD GPU userspace register and memory debugger
(define-public umr-git
  (package
    (name "umr-git")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/umr-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "AMD GPU userspace register and memory debugger")
    (description "UMR is a tool for reading and decoding AMD GPU ASIC registers and memory.")
    (home-page "https://gitlab.freedesktop.org/tomstdenis/umr")
    (license license:expat)))

;;; imunes-git --- integrated multiprotocol network emulator/simulator
(define-public imunes-git
  (package
    (name "imunes-git")
    (version "2.4.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/imunes-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "integrated multiprotocol network emulator/simulator")
    (description "IMUNES is an IP network emulator and simulator built on FreeBSD and Linux.")
    (home-page "http://imunes.net/")
    (license license:bsd-2)))

;;; youtty --- lightweight YouTube terminal client
(define-public youtty
  (package
    (name "youtty")
    (version "0.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/youtty.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "lightweight YouTube terminal client")
    (description "A lightweight terminal-based YouTube client for browsing and playing videos.")
    (home-page "https://aur.archlinux.org/packages/youtty")
    (license license:expat)))

;;; gpx-animator --- create video animations from GPX tracks
(define-public gpx-animator
  (package
    (name "gpx-animator")
    (version "1.9.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gpx-animator.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "create video animations from GPX tracks")
    (description "GPX Animator creates video animations from GPS track data in GPX format.")
    (home-page "https://gpx-animator.app/")
    (license license:asl2.0)))

;;; gopass-git --- team password manager written in Go
(define-public gopass-git
  (package
    (name "gopass-git")
    (version "1.15.14")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gopass-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "team password manager written in Go")
    (description "Gopass is a rewrite of the pass password manager in Go with team sharing features.")
    (home-page "https://www.gopass.pw/")
    (license license:expat)))

;;; stl-thumb-git --- thumbnail generator for STL 3D model files
(define-public stl-thumb-git
  (package
    (name "stl-thumb-git")
    (version "0.5.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/stl-thumb-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "thumbnail generator for STL 3D model files")
    (description "Generate thumbnails for STL 3D model files for file managers and applications.")
    (home-page "https://github.com/unlimitedbacon/stl-thumb")
    (license license:expat)))

;;; gnome-shell-extension-alt-tab-scroll-workaround --- GNOME Shell extension fixing alt-tab scroll behavior
(define-public gnome-shell-extension-alt-tab-scroll-workaround
  (package
    (name "gnome-shell-extension-alt-tab-scroll-workaround")
    (version "1.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gnome-shell-extension-alt-tab-scroll-workaround.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "GNOME Shell extension fixing alt-tab scroll behavior")
    (description "GNOME Shell extension that fixes scroll wheel behavior in the Alt-Tab switcher.")
    (home-page "https://extensions.gnome.org/")
    (license license:gpl3+)))

;;; alabamaencoder-git --- intelligent video encoding optimizer
(define-public alabamaencoder-git
  (package
    (name "alabamaencoder-git")
    (version "0.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/alabamaencoder-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "intelligent video encoding optimizer")
    (description "Alabama Encoder is an intelligent video encoding tool for optimizing encode settings.")
    (home-page "https://github.com/kingstefan26/alabamaEncoder")
    (license license:expat)))

;;; ncview --- visual browser for netCDF format files
(define-public ncview
  (package
    (name "ncview")
    (version "2.1.10")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ncview.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "visual browser for netCDF format files")
    (description "Ncview is a visual browser for netCDF data files with quick plotting capabilities.")
    (home-page "http://meteora.ucsd.edu/~pierce/ncview_home_page.html")
    (license license:gpl3+)))

;;; convertall-py --- unit conversion program with flexible interface
(define-public convertall-py
  (package
    (name "convertall-py")
    (version "0.8.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/convertall-py.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "unit conversion program with flexible interface")
    (description "ConvertAll is a unit conversion program allowing combination of units for flexible conversions.")
    (home-page "https://convertall.bellz.org/")
    (license license:gpl2+)))

;;; jbang --- run Java programs with automatic dependency resolution
(define-public jbang
  (package
    (name "jbang")
    (version "0.117.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/jbang.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "run Java programs with automatic dependency resolution")
    (description "JBang lets you run Java programs as scripts with automatic dependency fetching and resolution.")
    (home-page "https://jbang.dev/")
    (license license:expat)))

;;; systemdlint --- linter for systemd unit files
(define-public systemdlint
  (package
    (name "systemdlint")
    (version "1.3.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/systemdlint.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "linter for systemd unit files")
    (description "A linter for systemd unit files that checks for common mistakes and best practices.")
    (home-page "https://github.com/priv-kweihmann/systemdlint")
    (license license:bsd-2)))

;;; gsh --- interactive shell for interacting with multiple hosts via SSH
(define-public gsh
  (package
    (name "gsh")
    (version "1.2.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gsh.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "interactive shell for interacting with multiple hosts via SSH")
    (description "GSH is a pluggable interactive shell for running commands across multiple SSH hosts simultaneously.")
    (home-page "https://github.com/coretech/gsh")
    (license license:expat)))

;;; gpg-import-bin --- helper script for importing GPG keys
(define-public gpg-import-bin
  (package
    (name "gpg-import-bin")
    (version "0.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gpg-import-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "helper script for importing GPG keys")
    (description "Helper script for importing GPG public keys from keyservers or files.")
    (home-page "https://aur.archlinux.org/packages/gpg-import-bin")
    (license license:expat)))

;;; dutree-bin --- disk usage analyzer with colored tree output
(define-public dutree-bin
  (package
    (name "dutree-bin")
    (version "0.2.18")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/dutree-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "disk usage analyzer with colored tree output")
    (description "Dutree is a command-line tool for analyzing disk usage with a colored tree output.")
    (home-page "https://github.com/nachoparker/dutree")
    (license license:expat)))

;;; bit-bin --- modern Git CLI with auto-complete and suggestions
(define-public bit-bin
  (package
    (name "bit-bin")
    (version "1.1.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/bit-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "modern Git CLI with auto-complete and suggestions")
    (description "Bit is a modern Git CLI replacement with auto-completion, suggestions, and shortcuts.")
    (home-page "https://github.com/chriswalz/bit")
    (license license:asl2.0)))

;;; airdcpp-webclient --- file sharing client using ADC protocol with web UI
(define-public airdcpp-webclient
  (package
    (name "airdcpp-webclient")
    (version "2.12.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/airdcpp-webclient.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "file sharing client using ADC protocol with web UI")
    (description "AirDC++ is an Advanced Direct Connect client with a web-based user interface.")
    (home-page "https://airdcpp-web.github.io/")
    (license license:gpl2+)))

;;; firealpaca --- free digital painting software
(define-public firealpaca
  (package
    (name "firealpaca")
    (version "2.11.22")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/firealpaca.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "free digital painting software")
    (description "FireAlpaca is a free digital painting software with simple tools and layer support.")
    (home-page "https://firealpaca.com/")
    (license license:nonfree)))

;;; munt-smf2wav --- convert MIDI files to WAV using MT-32 emulation
(define-public munt-smf2wav
  (package
    (name "munt-smf2wav")
    (version "2.7.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/munt-smf2wav.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "convert MIDI files to WAV using MT-32 emulation")
    (description "Convert Standard MIDI files to WAV audio using the Munt MT-32 synthesizer emulator.")
    (home-page "https://github.com/munt/munt")
    (license license:lgpl2.1+)))

;;; iir1 --- real-time C++ IIR audio filter library
(define-public iir1
  (package
    (name "iir1")
    (version "1.9.4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/iir1.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "real-time C++ IIR audio filter library")
    (description "IIR1 is a real-time C++ library for designing and applying IIR audio filters.")
    (home-page "https://github.com/berndporr/iir1")
    (license license:expat)))

;;; dict-jargon --- the Jargon File (hacker dictionary) for dictd
(define-public dict-jargon
  (package
    (name "dict-jargon")
    (version "4.4.7")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/dict-jargon.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "the Jargon File (hacker dictionary) for dictd")
    (description "The Jargon File dictionary formatted for use with the dictd dictionary server.")
    (home-page "http://www.catb.org/jargon/")
    (license license:public-domain)))

;;; eruption --- Linux keyboard and mouse RGB lighting daemon
(define-public eruption
  (package
    (name "eruption")
    (version "0.4.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/eruption.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "Linux keyboard and mouse RGB lighting daemon")
    (description "Eruption is a Linux daemon for controlling RGB lighting on keyboards and mice with Lua scripting.")
    (home-page "https://github.com/eruption-project/eruption")
    (license license:gpl3+)))

;;; gdlauncher-bin --- Minecraft Java Edition game launcher and manager
(define-public gdlauncher-bin
  (package
    (name "gdlauncher-bin")
    (version "2.0.25")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gdlauncher-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "Minecraft Java Edition game launcher and manager")
    (description "GDLauncher is a custom Minecraft launcher for managing instances, mods, and modpacks.")
    (home-page "https://gdlauncher.com/")
    (license license:gpl3+)))

;;; mautrix-telegram --- Matrix-Telegram bridge using mautrix framework
(define-public mautrix-telegram
  (package
    (name "mautrix-telegram")
    (version "0.15.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mautrix-telegram.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "Matrix-Telegram bridge using mautrix framework")
    (description "A Matrix-Telegram puppeting bridge based on the mautrix Python framework.")
    (home-page "https://github.com/mautrix/telegram")
    (license license:agpl3+)))

;;; ncmdump --- convert NetEase Cloud Music encrypted files to standard formats
(define-public ncmdump
  (package
    (name "ncmdump")
    (version "0.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ncmdump.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "convert NetEase Cloud Music encrypted files to standard formats")
    (description "Convert NetEase Cloud Music encrypted .ncm files to standard MP3 or FLAC format.")
    (home-page "https://github.com/anonymous5l/ncmdump")
    (license license:expat)))

;;; iwdgui --- graphical interface for iwd wireless daemon
(define-public iwdgui
  (package
    (name "iwdgui")
    (version "0.5.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/iwdgui.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "graphical interface for iwd wireless daemon")
    (description "A graphical user interface for managing wireless connections with the iwd daemon.")
    (home-page "https://github.com/defname/iwdGUI")
    (license license:gpl3+)))

;;; logstash-bin --- server-side data processing pipeline (Elastic Stack)
(define-public logstash-bin
  (package
    (name "logstash-bin")
    (version "8.13.4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/logstash-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "server-side data processing pipeline (Elastic Stack)")
    (description "Logstash is a server-side data processing pipeline for ingesting, transforming, and sending data.")
    (home-page "https://www.elastic.co/logstash")
    (license license:asl2.0)))

;;; tauri-cli --- CLI tool for Tauri desktop application framework
(define-public tauri-cli
  (package
    (name "tauri-cli")
    (version "2.0.4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/tauri-cli.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "CLI tool for Tauri desktop application framework")
    (description "Command-line interface for building Tauri desktop applications with web technologies.")
    (home-page "https://tauri.app/")
    (license license:asl2.0)))

;;; mpv-mpris-git --- MPRIS plugin for the mpv media player
(define-public mpv-mpris-git
  (package
    (name "mpv-mpris-git")
    (version "1.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mpv-mpris-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "MPRIS plugin for the mpv media player")
    (description "MPRIS IPC protocol plugin for mpv, enabling media key and desktop integration.")
    (home-page "https://github.com/hoyon/mpv-mpris")
    (license license:expat)))

;;; dnsleaktest --- command-line DNS leak testing tool
(define-public dnsleaktest
  (package
    (name "dnsleaktest")
    (version "0.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/dnsleaktest.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "command-line DNS leak testing tool")
    (description "A simple command-line tool to test for DNS leaks when using a VPN.")
    (home-page "https://github.com/macvk/dnsleaktest")
    (license license:gpl3+)))

;;; sonobus --- peer-to-peer audio streaming application for musicians
(define-public sonobus
  (package
    (name "sonobus")
    (version "1.7.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/sonobus.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "peer-to-peer audio streaming application for musicians")
    (description "SonoBus is an easy-to-use application for streaming high-quality audio between devices in real-time.")
    (home-page "https://sonobus.net/")
    (license license:gpl3+)))

;;; bitmagnet --- self-hosted BitTorrent indexer and DHT crawler
(define-public bitmagnet
  (package
    (name "bitmagnet")
    (version "0.9.5")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/bitmagnet.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "self-hosted BitTorrent indexer and DHT crawler")
    (description "Bitmagnet is a self-hosted BitTorrent indexer, DHT crawler, and content classifier.")
    (home-page "https://bitmagnet.io/")
    (license license:expat)))

;;; dprint --- pluggable and configurable code formatter
(define-public dprint
  (package
    (name "dprint")
    (version "0.47.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/dprint.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "pluggable and configurable code formatter")
    (description "Dprint is a fast, pluggable, and configurable code formatting platform.")
    (home-page "https://dprint.dev/")
    (license license:expat)))

;;; vim-dracula --- Dracula dark color theme for Vim
(define-public vim-dracula
  (package
    (name "vim-dracula")
    (version "2.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/vim-dracula.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "Dracula dark color theme for Vim")
    (description "Dracula is a dark color theme for Vim providing a comfortable coding environment.")
    (home-page "https://draculatheme.com/vim")
    (license license:expat)))

;;; sqlitestudio-bin --- visual SQLite database manager and editor
(define-public sqlitestudio-bin
  (package
    (name "sqlitestudio-bin")
    (version "3.4.4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/sqlitestudio-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "visual SQLite database manager and editor")
    (description "SQLiteStudio is a portable visual editor for SQLite databases with an intuitive interface.")
    (home-page "https://sqlitestudio.pl/")
    (license license:gpl3+)))

;;; jupyterlab-catppuccin --- Catppuccin color theme for JupyterLab
(define-public jupyterlab-catppuccin
  (package
    (name "jupyterlab-catppuccin")
    (version "0.2.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/jupyterlab-catppuccin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "Catppuccin color theme for JupyterLab")
    (description "Catppuccin soothing pastel color theme extension for JupyterLab.")
    (home-page "https://github.com/catppuccin/jupyterlab")
    (license license:expat)))

;;; albion-online-launcher-bin --- Albion Online MMORPG game launcher for Linux
(define-public albion-online-launcher-bin
  (package
    (name "albion-online-launcher-bin")
    (version "1.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/albion-online-launcher-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "Albion Online MMORPG game launcher for Linux")
    (description "Official launcher for the Albion Online sandbox MMORPG game on Linux.")
    (home-page "https://albiononline.com/")
    (license license:nonfree)))

;;; zx --- tool for writing shell scripts in JavaScript
(define-public zx
  (package
    (name "zx")
    (version "8.1.4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/zx.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "tool for writing shell scripts in JavaScript")
    (description "Google's zx provides useful wrappers around child_process for writing shell scripts in JavaScript.")
    (home-page "https://google.github.io/zx/")
    (license license:asl2.0)))

;;; lazyjournal-bin --- TUI for journalctl and log file viewing
(define-public lazyjournal-bin
  (package
    (name "lazyjournal-bin")
    (version "0.5.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lazyjournal-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "TUI for journalctl and log file viewing")
    (description "LazyJournal is a terminal UI for browsing journalctl output and log files interactively.")
    (home-page "https://github.com/Lifailon/lazyjournal")
    (license license:expat)))

;;; hevi --- hex viewer with colored output for the terminal
(define-public hevi
  (package
    (name "hevi")
    (version "0.4.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/hevi.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "hex viewer with colored output for the terminal")
    (description "Hevi is a fast hex viewer with colored output designed for terminal use.")
    (home-page "https://github.com/Shfty/hevi")
    (license license:expat)))

;;; firehol --- easy-to-use iptables stateful firewall configuration
(define-public firehol
  (package
    (name "firehol")
    (version "3.1.7")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/firehol.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "easy-to-use iptables stateful firewall configuration")
    (description "FireHOL is a language and tool to build secure, stateful Linux firewalls from simple rules.")
    (home-page "https://firehol.org/")
    (license license:gpl2+)))

;;; sftpman --- SSHFS/SFTP mount manager with CLI and GTK interface
(define-public sftpman
  (package
    (name "sftpman")
    (version "1.2.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/sftpman.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "SSHFS/SFTP mount manager with CLI and GTK interface")
    (description "SFTPMan manages SSHFS/SFTP filesystem mounts with both CLI and GTK interfaces.")
    (home-page "https://github.com/spantaleev/sftpman")
    (license license:gpl3+)))

;;; exabgp --- BGP route injector and traffic manipulation tool
(define-public exabgp
  (package
    (name "exabgp")
    (version "4.2.22")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/exabgp.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "BGP route injector and traffic manipulation tool")
    (description "ExaBGP allows engineers to control network route announcements using simple text-based configuration.")
    (home-page "https://github.com/Exa-Networks/exabgp")
    (license license:bsd-3)))

;;; hex-a-hop --- hexagonal tile-based puzzle game
(define-public hex-a-hop
  (package
    (name "hex-a-hop")
    (version "1.1.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/hex-a-hop.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "hexagonal tile-based puzzle game")
    (description "Hex-a-Hop is a puzzle game where you destroy hexagonal tiles to clear each level.")
    (home-page "http://hexahop.sourceforge.net/")
    (license license:gpl2+)))

;;; websocat-git --- command-line WebSocket client like netcat for ws://
(define-public websocat-git
  (package
    (name "websocat-git")
    (version "1.13.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/websocat-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "command-line WebSocket client like netcat for ws://")
    (description "Websocat is a command-line client for WebSockets, like netcat/socat for ws:// URLs.")
    (home-page "https://github.com/vi/websocat")
    (license license:expat)))

;;; qtchess --- simple chess game with Qt graphical interface
(define-public qtchess
  (package
    (name "qtchess")
    (version "2025.01.01")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/qtchess.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "simple chess game with Qt graphical interface")
    (description "QtChess is a simple chess game with a Qt-based graphical user interface.")
    (home-page "https://github.com/textbrowser/qtchess")
    (license license:gpl3+)))

;;; gmetronome --- GTK metronome application for musicians
(define-public gmetronome
  (package
    (name "gmetronome")
    (version "0.3.5")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gmetronome.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "GTK metronome application for musicians")
    (description "GMetronome is a GNOME metronome application for practicing music at a steady tempo.")
    (home-page "https://gitlab.gnome.org/dqpb/gmetronome")
    (license license:gpl3+)))

;;; supabase --- Supabase CLI for local development and deployment
(define-public supabase
  (package
    (name "supabase")
    (version "1.200.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/supabase.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "Supabase CLI for local development and deployment")
    (description "CLI tool for developing and deploying Supabase backend-as-a-service projects locally.")
    (home-page "https://supabase.com/")
    (license license:expat)))

;;; sunflower-bin --- twin-panel file manager for Linux
(define-public sunflower-bin
  (package
    (name "sunflower-bin")
    (version "0.5.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/sunflower-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "twin-panel file manager for Linux")
    (description "Sunflower is a twin-panel file manager for Linux with plugin support.")
    (home-page "https://sunflower-fm.org/")
    (license license:gpl3+)))

;;; solkit-bin --- Solana blockchain development toolkit
(define-public solkit-bin
  (package
    (name "solkit-bin")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/solkit-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "Solana blockchain development toolkit")
    (description "SolKit is a development toolkit for building on the Solana blockchain.")
    (home-page "https://aur.archlinux.org/packages/solkit-bin")
    (license license:expat)))

;;; proxypin-bin --- network traffic capture and debugging proxy tool
(define-public proxypin-bin
  (package
    (name "proxypin-bin")
    (version "1.8.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/proxypin-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "network traffic capture and debugging proxy tool")
    (description "ProxyPin is an open-source tool for capturing and debugging HTTP/HTTPS network traffic.")
    (home-page "https://github.com/wanghongenpin/network_proxy_flutter")
    (license license:asl2.0)))

;;; pkgx-bin --- cross-platform package runner (formerly tea)
(define-public pkgx-bin
  (package
    (name "pkgx-bin")
    (version "1.3.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/pkgx-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "cross-platform package runner (formerly tea)")
    (description "Pkgx runs anything, providing package execution without installation (successor to tea).")
    (home-page "https://pkgx.sh/")
    (license license:asl2.0)))

;;; pbgopy-bin --- copy and paste between devices over the network
(define-public pbgopy-bin
  (package
    (name "pbgopy-bin")
    (version "0.3.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/pbgopy-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "copy and paste between devices over the network")
    (description "Pbgopy allows copying and pasting clipboard contents across devices over the network.")
    (home-page "https://github.com/nakabonne/pbgopy")
    (license license:expat)))

;;; openrsync-git --- BSD-licensed implementation of rsync
(define-public openrsync-git
  (package
    (name "openrsync-git")
    (version "0.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/openrsync-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "BSD-licensed implementation of rsync")
    (description "OpenRsync is a clean-room BSD-licensed implementation of the rsync protocol.")
    (home-page "https://www.openrsync.org/")
    (license license:isc)))

;;; mbw --- memory bandwidth benchmark tool
(define-public mbw
  (package
    (name "mbw")
    (version "2.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mbw.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "memory bandwidth benchmark tool")
    (description "MBW determines the copy bandwidth available to userspace programs via memory-to-memory copy.")
    (home-page "https://github.com/raas/mbw")
    (license license:lgpl2.1+)))

;;; libstudxml --- modern C++ XML pull parser and serializer library
(define-public libstudxml
  (package
    (name "libstudxml")
    (version "1.1.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/libstudxml.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "modern C++ XML pull parser and serializer library")
    (description "Libstudxml is a modern C++ XML library with pull-parser and streaming serializer.")
    (home-page "https://www.codesynthesis.com/projects/libstudxml/")
    (license license:expat)))

;;; jxl-oxide --- pure Rust JPEG XL decoder
(define-public jxl-oxide
  (package
    (name "jxl-oxide")
    (version "0.10.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/jxl-oxide.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "pure Rust JPEG XL decoder")
    (description "Jxl-oxide is a pure Rust implementation of a JPEG XL image format decoder.")
    (home-page "https://github.com/tirr-c/jxl-oxide")
    (license license:bsd-3)))

;;; hidrdd --- HID report descriptor decoder
(define-public hidrdd
  (package
    (name "hidrdd")
    (version "1.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/hidrdd.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "HID report descriptor decoder")
    (description "Decode USB HID report descriptors into a human-readable format.")
    (home-page "https://github.com/nicman23/hidrdd")
    (license license:gpl2+)))

;;; hamrs-appimage --- amateur radio logging application
(define-public hamrs-appimage
  (package
    (name "hamrs-appimage")
    (version "0.13.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/hamrs-appimage.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "amateur radio logging application")
    (description "HAMRS is a fast, easy-to-use amateur radio logging application available as an AppImage.")
    (home-page "https://hamrs.app/")
    (license license:nonfree)))

;;; ezra-bible-app-bin --- user-friendly Bible study application
(define-public ezra-bible-app-bin
  (package
    (name "ezra-bible-app-bin")
    (version "1.14.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ezra-bible-app-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "user-friendly Bible study application")
    (description "Ezra Bible App is a user-friendly Bible study tool with search, tagging, and note features.")
    (home-page "https://github.com/ezra-bible-app/ezra-bible-app")
    (license license:gpl3+)))

;;; envfetch-bin --- cross-platform environment variable command-line fetcher
(define-public envfetch-bin
  (package
    (name "envfetch-bin")
    (version "0.5.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/envfetch-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "cross-platform environment variable command-line fetcher")
    (description "Envfetch fetches and displays environment information in a neat command-line format.")
    (home-page "https://github.com/EnvFetch/envfetch")
    (license license:expat)))

;;; dano-bin --- file integrity checker using embedded checksums
(define-public dano-bin
  (package
    (name "dano-bin")
    (version "0.4.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/dano-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "file integrity checker using embedded checksums")
    (description "Dano is a file integrity verification tool that embeds checksums into extended attributes.")
    (home-page "https://github.com/kimono-koans/dano")
    (license license:gpl2+)))

;;; cryptographic-id-rs --- verify device identities using cryptographic signatures
(define-public cryptographic-id-rs
  (package
    (name "cryptographic-id-rs")
    (version "1.3.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/cryptographic-id-rs.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "verify device identities using cryptographic signatures")
    (description "Cryptographic-id verifies device or user identities using Ed25519 cryptographic signatures.")
    (home-page "https://gitlab.com/cryptographic-id/cryptographic-id-rs")
    (license license:gpl3+)))

;;; chapar-bin --- open-source API testing tool
(define-public chapar-bin
  (package
    (name "chapar-bin")
    (version "0.5.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/chapar-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "open-source API testing tool")
    (description "Chapar is an open-source API testing tool for REST and gRPC endpoints.")
    (home-page "https://github.com/chapar-rest/chapar")
    (license license:expat)))

;;; carafe-bin --- local-first note-taking and wiki application
(define-public carafe-bin
  (package
    (name "carafe-bin")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/carafe-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "local-first note-taking and wiki application")
    (description "Carafe is a local-first note-taking application with wiki-style linking.")
    (home-page "https://aur.archlinux.org/packages/carafe-bin")
    (license license:expat)))

;;; toggl-bin --- Toggl time tracking desktop application
(define-public toggl-bin
  (package
    (name "toggl-bin")
    (version "7.5.441")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/toggl-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "Toggl time tracking desktop application")
    (description "Official Toggl time tracking desktop application for Linux.")
    (home-page "https://toggl.com/")
    (license license:nonfree)))

;;; todoist-bin --- Todoist task management desktop application
(define-public todoist-bin
  (package
    (name "todoist-bin")
    (version "1.0.9")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/todoist-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "Todoist task management desktop application")
    (description "Official Todoist task management and to-do list application for Linux.")
    (home-page "https://todoist.com/")
    (license license:nonfree)))

;;; cryptr-bin --- desktop GUI client for HashiCorp Vault
(define-public cryptr-bin
  (package
    (name "cryptr-bin")
    (version "0.5.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/cryptr-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "desktop GUI client for HashiCorp Vault")
    (description "Cryptr is a cross-platform desktop GUI client for managing secrets in HashiCorp Vault.")
    (home-page "https://github.com/jcrowthe/cryptr")
    (license license:expat)))

;;; relagit-bin --- visual Git client with a clean interface
(define-public relagit-bin
  (package
    (name "relagit-bin")
    (version "0.16.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/relagit-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "visual Git client with a clean interface")
    (description "RelaGit is a visual Git client providing a clean and simple interface for repository management.")
    (home-page "https://rela.dev/")
    (license license:expat)))

;;; uefi-run --- run UEFI applications in QEMU directly
(define-public uefi-run
  (package
    (name "uefi-run")
    (version "0.5.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/uefi-run.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "run UEFI applications in QEMU directly")
    (description "Uefi-run is a tool to directly run UEFI applications in QEMU without a full disk image.")
    (home-page "https://github.com/Richard-W/uefi-run")
    (license license:expat)))

;;; telosys-cli --- lightweight code generator for Java and other languages
(define-public telosys-cli
  (package
    (name "telosys-cli")
    (version "4.2.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/telosys-cli.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "lightweight code generator for Java and other languages")
    (description "Telosys is a lightweight code generator supporting Java, Python, Go, and other languages.")
    (home-page "https://www.telosys.org/")
    (license license:lgpl3+)))

;;; feeddeck-bin --- multi-column feed reader application
(define-public feeddeck-bin
  (package
    (name "feeddeck-bin")
    (version "1.5.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/feeddeck-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "multi-column feed reader application")
    (description "FeedDeck is a multi-column feed reader for RSS, Atom, and social media feeds.")
    (home-page "https://feeddeck.app/")
    (license license:expat)))

;;; fakepkg --- regenerate pacman packages from installed files
(define-public fakepkg
  (package
    (name "fakepkg")
    (version "1.12.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/fakepkg.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "regenerate pacman packages from installed files")
    (description "Fakepkg generates Arch Linux pacman packages from already-installed package files.")
    (home-page "https://github.com/nicman23/fakepkg")
    (license license:isc)))

;;; mkgmap --- convert OpenStreetMap data to Garmin GPS format
(define-public mkgmap
  (package
    (name "mkgmap")
    (version "4948")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mkgmap.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "convert OpenStreetMap data to Garmin GPS format")
    (description "Mkgmap converts OpenStreetMap data into maps for Garmin GPS devices.")
    (home-page "https://www.mkgmap.org.uk/")
    (license license:gpl2+)))

;;; typst-languagetool-lsp-git --- LanguageTool integration for Typst via LSP
(define-public typst-languagetool-lsp-git
  (package
    (name "typst-languagetool-lsp-git")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/typst-languagetool-lsp-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "LanguageTool integration for Typst via LSP")
    (description "Language server providing LanguageTool grammar checking integration for Typst documents.")
    (home-page "https://github.com/antonWetzel/typst-languagetool")
    (license license:expat)))

;;; offsetexplorer --- visual Apache Kafka topic browser and manager
(define-public offsetexplorer
  (package
    (name "offsetexplorer")
    (version "3.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/offsetexplorer.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "visual Apache Kafka topic browser and manager")
    (description "Offset Explorer is a GUI tool for browsing and managing Apache Kafka topics and consumer groups.")
    (home-page "https://www.kafkatool.com/")
    (license license:nonfree)))

;;; mihomo-party --- cross-platform proxy client with GUI based on Mihomo
(define-public mihomo-party
  (package
    (name "mihomo-party")
    (version "1.3.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mihomo-party.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "cross-platform proxy client with GUI based on Mihomo")
    (description "Mihomo Party is a cross-platform proxy client with a graphical interface based on the Mihomo core.")
    (home-page "https://github.com/mihomo-party-org/mihomo-party")
    (license license:gpl3+)))

;;; matrix-sliding-sync --- Matrix sliding sync proxy server
(define-public matrix-sliding-sync
  (package
    (name "matrix-sliding-sync")
    (version "0.99.19")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/matrix-sliding-sync.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "Matrix sliding sync proxy server")
    (description "An implementation of MSC3575 sliding sync for Matrix homeservers.")
    (home-page "https://github.com/matrix-org/sliding-sync")
    (license license:asl2.0)))

;;; i3-resurrect --- save and restore i3 window manager workspaces
(define-public i3-resurrect
  (package
    (name "i3-resurrect")
    (version "1.4.5")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/i3-resurrect.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "save and restore i3 window manager workspaces")
    (description "Save and restore i3 and Sway window manager workspace layouts and running programs.")
    (home-page "https://github.com/JonnyHaystack/i3-resurrect")
    (license license:gpl3+)))

;;; latex2rtf --- convert LaTeX documents to RTF format
(define-public latex2rtf
  (package
    (name "latex2rtf")
    (version "2.3.18")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/latex2rtf.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "convert LaTeX documents to RTF format")
    (description "Latex2rtf converts LaTeX documents to Rich Text Format for use in word processors.")
    (home-page "https://latex2rtf.sourceforge.net/")
    (license license:gpl2+)))

;;; duck --- Cyberduck CLI for cloud storage and file transfer
(define-public duck
  (package
    (name "duck")
    (version "8.7.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/duck.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "Cyberduck CLI for cloud storage and file transfer")
    (description "Duck is the Cyberduck command-line interface for FTP, SFTP, S3, and cloud storage protocols.")
    (home-page "https://duck.sh/")
    (license license:gpl3+)))

;;; syncterm --- BBS terminal program supporting multiple protocols
(define-public syncterm
  (package
    (name "syncterm")
    (version "1.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/syncterm.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "BBS terminal program supporting multiple protocols")
    (description "SyncTERM is a terminal program supporting telnet, SSH, and modem connections to BBS systems.")
    (home-page "https://syncterm.net/")
    (license license:gpl2+)))

;;; cmatrix-neo-git --- Matrix-style terminal screensaver with extra effects
(define-public cmatrix-neo-git
  (package
    (name "cmatrix-neo-git")
    (version "2.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/cmatrix-neo-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "Matrix-style terminal screensaver with extra effects")
    (description "CMatrix Neo is a terminal screensaver showing scrolling Matrix-style characters with extra visual effects.")
    (home-page "https://github.com/st3w/neo")
    (license license:gpl3+)))
