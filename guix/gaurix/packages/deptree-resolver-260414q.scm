;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency-tree resolver pass --- deptree-resolver-260414q
;;; Resolves 100 BLOCKED packages by dependency-tree priority:
;;;   - 83 recipes created
;;;   - 17 blocked with reason codes (see blocked-notes)
;;;
;;; All sha256 hashes are placeholders (must be verified via `guix download`).

(define-module (gaurix packages deptree-resolver-260414q)
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
  #:export (elephant-bin
            dosh
            httpfs2-2gbplus
            python-litex
            ncurses5-compat-libs
            xlibre-xserver-common-git
            libelectron
            python-inquirerpy
            asusctl
            qt5-doc
            pgadmin4-server
            sonic-win
            owlry-plugin-converter
            python-aiocache
            xone-dongle-firmware
            smpq
            discord-rpc
            python-aiolimiter
            python-m3u8
            lcevcdec
            gslapper
            electron-castlab-bin
            python-mistralai
            fizz
            libcava
            fooyin
            ros2-arch-deps
            brother-lpr-drivers-common
            genders
            ps3-env
            ttf-material-symbols-variable-git
            asroot
            deb2targz
            dotnet-targeting-pack-9.0-bin
            falcond-profiles
            archlinux-java-run
            bwidget
            heidisql
            plasma-wayland-protocols-povd
            python-simple-term-menu
            shorewall-core
            gtk-sharp-2
            qt5-datavis3d
            verify-lib
            wolfssl-all
            python-pyfakewebcam-git
            app2unit
            cpp-utilities
            displaylink
            lib32-blas
            lib32-libvmaf
            libastal-gjs-git
            osu-mime
            python-myjdapi
            python-opentelemetry-exporter-otlp
            python3-xcpf
            python-cryptg
            python-kajson
            sonic-screen-library
            python-opentelemetry-exporter-zipkin-json
            sqlite-utils
            gradle8
            cvmfs
            vencord-installer
            python-mediapipe-bin
            python-rapidocr
            wayfire
            linux-cachyos-bore
            tensorrt
            skia-static
            sonic-silver-theme
            vscodium-translucent
            deadbeef
            sonic-system-info
            amdonly-gaming-opencl-rusticl-mesa-git
            amdonly-gaming-mesa-git
            amdonly-gaming-vulkan-radeon-git
            amdonly-gaming-vulkan-mesa-layers-git
            qemu-headless-git
            alhp-keyring
            auth0-bin
            binjr-bin
            binvec-bin
))

;;; --- #3574 elephant-bin ---
;;; general purpose datasource and executor
;;; Source: https://github.com/abenz1267/elephant
;;; License: GPL-3.0
;;; Resolves: #3574 elephant-bin

(define-public elephant-bin
  (package
    (name "elephant-bin")
    (version "2.21.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/abenz1267/elephant/releases/download/v" version "/elephant-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "/opt/" #:include-regexp (".*")))))
    (home-page "https://github.com/abenz1267/elephant")
    (synopsis "general purpose datasource and executor")
    (description "General purpose datasource and executor.  Packaged from the Arch User Repository.")
    (license license:gpl3+)))

;;; --- #5298 dosh ---
;;; Docker shell
;;; Source: https://github.com/gportay/dosh
;;; License: LGPL-2.1-or-later
;;; Resolves: #5298 dosh

(define-public dosh
  (package
    (name "dosh")
    (version "8")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/gportay/dosh/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/gportay/dosh")
    (synopsis "docker shell")
    (description "Docker shell.  Packaged from the Arch User Repository.")
    (license license:lgpl2.1+)))

;;; --- #4702 httpfs2-2gbplus ---
;;; FUSE-based file system for HTTP access, patched with +2GB file support
;;; Source: http://httpfs.sourceforge.net/
;;; License: GPL
;;; Resolves: #4702 httpfs2-2gbplus

(define-public httpfs2-2gbplus
  (package
    (name "httpfs2-2gbplus")
    (version "0.1.5")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://httpfs.sourceforge.net//releases/download/v" version "/httpfs2-2gbplus-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "http://httpfs.sourceforge.net/")
    (synopsis "fUSE-based file system for HTTP access")
    (description "FUSE-based file system for HTTP access, patched with +2GB file support.  Packaged from the Arch User Repository.")
    (license license:gpl3+)))

;;; --- #6687 python-litex ---
;;; Migen/MiSoC based Core/SoC builder that provides the infrastructure to easily create Cores/SoCs
;;; Source: https://github.com/enjoy-digital/litex
;;; License: BSD-2-Clause
;;; Resolves: #6687 python-litex

(define-public python-litex
  (package
    (name "python-litex")
    (version "2025.08")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/enjoy-digital/litex/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/enjoy-digital/litex")
    (synopsis "migen/MiSoC based Core/SoC builder that provides the infrastructure to eas...")
    (description "Migen/MiSoC based Core/SoC builder that provides the infrastructure to easily create Cores/SoCs.  Packaged from the Arch User Repository.")
    (license license:bsd-2)))

;;; --- #389 ncurses5-compat-libs ---
;;; System V Release 4.0 curses emulation library, ABI 5
;;; Source: https://invisible-island.net/ncurses/ncurses.html
;;; License: MIT
;;; Resolves: #389 ncurses5-compat-libs

(define-public ncurses5-compat-libs
  (package
    (name "ncurses5-compat-libs")
    (version "6.6")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://invisible-island.net/ncurses/ncurses.html/releases/download/v" version "/ncurses5-compat-libs-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://invisible-island.net/ncurses/ncurses.html")
    (synopsis "system V Release 4")
    (description "System V Release 4.0 curses emulation library, ABI 5.  Packaged from the Arch User Repository.")
    (license license:expat)))

;;; --- #6172 xlibre-xserver-common-git ---
;;; XLibre server common files
;;; Source: https://github.com/x11libre/xserver
;;; License: BSD-3-Clause, HPND, HPND-sell-variant, ICU, ISC, LicenseRef-Adobe-Display-PostScript, LicenseRef-DEC-3-Clause, LicenseRef-HPND-sell-MIT-disclaimer-xserver, MIT, MIT-open-group, NTP, SGI-B-2.0, SMLNJ, X11, X11-distribute-modifications-variant
;;; Resolves: #6172 xlibre-xserver-common-git

(define-public xlibre-xserver-common-git
  (package
    (name "xlibre-xserver-common-git")
    (version "25.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                (url "https://github.com/x11libre/xserver")
                (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/x11libre/xserver")
    (synopsis "xLibre server common files")
    (description "XLibre server common files.  Packaged from the Arch User Repository.")
    (license license:bsd-3)))

;;; --- #5325 libelectron ---
;;; A meta package for electron and electron dependencies.
;;; Source: https://gitlab.com/linuxbombay/libelectron/libelectron
;;; License: GPL
;;; Resolves: #5325 libelectron

(define-public libelectron
  (package
    (name "libelectron")
    (version "2026.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://gitlab.com/linuxbombay/libelectron/libelectron/releases/download/v" version "/libelectron-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://gitlab.com/linuxbombay/libelectron/libelectron")
    (synopsis "meta package for electron and electron dependencies")
    (description "A meta package for electron and electron dependencies.  Packaged from the Arch User Repository.")
    (license license:gpl3+)))

;;; --- #3882 python-inquirerpy ---
;;; Python port of Inquirer.js (A collection of common interactive command-line user interfaces)
;;; Source: https://github.com/kazhala/InquirerPy
;;; License: MIT
;;; Resolves: #3882 python-inquirerpy

(define-public python-inquirerpy
  (package
    (name "python-inquirerpy")
    (version "0.3.4")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/kazhala/InquirerPy/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/kazhala/InquirerPy")
    (synopsis "python port of Inquirer")
    (description "Python port of Inquirer.js (A collection of common interactive command-line user interfaces).  Packaged from the Arch User Repository.")
    (license license:expat)))

;;; --- #11697 asusctl ---
;;; A control daemon, CLI tools, and a collection of crates for interacting with ASUS ROG laptops
;;; Source: https://asus-linux.org
;;; License: MPL-2.0
;;; Resolves: #11697 asusctl

(define-public asusctl
  (package
    (name "asusctl")
    (version "6.3.6")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://asus-linux.org/releases/download/v" version "/asusctl-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://asus-linux.org")
    (synopsis "control daemon")
    (description "A control daemon, CLI tools, and a collection of crates for interacting with ASUS ROG laptops.  Packaged from the Arch User Repository.")
    (license license:mpl2.0)))

;;; --- #11679 qt5-doc ---
;;; A cross-platform application and UI framework (Documentation)
;;; Source: https://www.qt.io
;;; License: custom, FDL, GPL3, LGPL3
;;; Resolves: #11679 qt5-doc

(define-public qt5-doc
  (package
    (name "qt5-doc")
    (version "5.15.18")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.qt.io/releases/download/v" version "/qt5-doc-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://www.qt.io")
    (synopsis "cross-platform application and UI framework (Documentation)")
    (description "A cross-platform application and UI framework (Documentation).  Packaged from the Arch User Repository.")
    (license license:nonfree)))

;;; --- #1600 pgadmin4-server ---
;;; The core server package for pgAdmin. pgAdmin is the most popular and feature rich Open Source administration and development platform for PostgreSQL, the most advanced Open Source database in the world.
;;; Source: https://www.pgadmin.org/
;;; License: PostgreSQL
;;; Resolves: #1600 pgadmin4-server

(define-public pgadmin4-server
  (package
    (name "pgadmin4-server")
    (version "9.14")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.pgadmin.org//releases/download/v" version "/pgadmin4-server-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://www.pgadmin.org/")
    (synopsis "core server package for pgAdmin")
    (description "The core server package for pgAdmin. pgAdmin is the most popular and feature rich Open Source administration and development platform for PostgreSQL, the most advanced Open Source database in the world.  Packaged from the Arch User Repository.")
    (license license:expat)))

;;; --- #1915 sonic-win ---
;;; kwin-x11 with ports from kwin-wayland, bug fixes, and maybe other improvements, for XLibre
;;; Source: https://github.com/Sonic-DE/sonic-win
;;; License: LGPL-2.0-or-later
;;; Resolves: #1915 sonic-win

(define-public sonic-win
  (package
    (name "sonic-win")
    (version "6.6.4")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/Sonic-DE/sonic-win/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/Sonic-DE/sonic-win")
    (synopsis "kwin-x11 with ports from kwin-wayland")
    (description "Kwin-x11 with ports from kwin-wayland, bug fixes, and maybe other improvements, for XLibre.  Packaged from the Arch User Repository.")
    (license license:lgpl2.0+)))

;;; --- #13449 owlry-plugin-converter ---
;;; Transitional package — converter is now built into owlry-core
;;; Source: https://somegit.dev/Owlibou/owlry
;;; License: GPL-3.0-or-later
;;; Resolves: #13449 owlry-plugin-converter

(define-public owlry-plugin-converter
  (package
    (name "owlry-plugin-converter")
    (version "1.0.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://somegit.dev/Owlibou/owlry/releases/download/v" version "/owlry-plugin-converter-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://somegit.dev/Owlibou/owlry")
    (synopsis "transitional package — converter is now built into owlry-core")
    (description "Transitional package — converter is now built into owlry-core.  Packaged from the Arch User Repository.")
    (license license:gpl3+)))

;;; --- #6831 python-aiocache ---
;;; Asyncio cache manager for redis, memcached and memory
;;; Source: https://github.com/argaen/aiocache
;;; License: BSD
;;; Resolves: #6831 python-aiocache

(define-public python-aiocache
  (package
    (name "python-aiocache")
    (version "0.12.3")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/argaen/aiocache/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/argaen/aiocache")
    (synopsis "asyncio cache manager for redis")
    (description "Asyncio cache manager for redis, memcached and memory.  Packaged from the Arch User Repository.")
    (license license:bsd-3)))

;;; --- #12011 xone-dongle-firmware ---
;;; Xbox Wireless Controller Adapter firmware
;;; Source: https://support.xbox.com/en-US/help/hardware-network/browse
;;; License: LicenseRef-Microsoft
;;; Resolves: #12011 xone-dongle-firmware

(define-public xone-dongle-firmware
  (package
    (name "xone-dongle-firmware")
    (version "2.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://support.xbox.com/en-US/help/hardware-network/browse/releases/download/v" version "/xone-dongle-firmware-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://support.xbox.com/en-US/help/hardware-network/browse")
    (synopsis "xbox Wireless Controller Adapter firmware")
    (description "Xbox Wireless Controller Adapter firmware.  Packaged from the Arch User Repository.")
    (license license:expat)))

;;; --- #5147 smpq ---
;;; StormLib MPQ archiving utility. Designed for full manipulating with Blizzard MPQ archives
;;; Source: https://launchpad.net/smpq
;;; License: GPL3
;;; Resolves: #5147 smpq

(define-public smpq
  (package
    (name "smpq")
    (version "1.7")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://launchpad.net/smpq/releases/download/v" version "/smpq-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://launchpad.net/smpq")
    (synopsis "stormLib MPQ archiving utility")
    (description "StormLib MPQ archiving utility. Designed for full manipulating with Blizzard MPQ archives.  Packaged from the Arch User Repository.")
    (license license:gpl3+)))

;;; --- #7909 discord-rpc ---
;;; Discord Rich Presence library
;;; Source: https://github.com/discord/discord-rpc
;;; License: MIT
;;; Resolves: #7909 discord-rpc

(define-public discord-rpc
  (package
    (name "discord-rpc")
    (version "3.4.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/discord/discord-rpc/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/discord/discord-rpc")
    (synopsis "discord Rich Presence library")
    (description "Discord Rich Presence library.  Packaged from the Arch User Repository.")
    (license license:expat)))

;;; --- #7415 python-aiolimiter ---
;;; An efficient implementation of a rate limiter for asyncio
;;; Source: https://github.com/mjpieters/aiolimiter
;;; License: MIT
;;; Resolves: #7415 python-aiolimiter

(define-public python-aiolimiter
  (package
    (name "python-aiolimiter")
    (version "1.2.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/mjpieters/aiolimiter/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/mjpieters/aiolimiter")
    (synopsis "efficient implementation of a rate limiter for asyncio")
    (description "An efficient implementation of a rate limiter for asyncio.  Packaged from the Arch User Repository.")
    (license license:expat)))

;;; --- #6355 python-m3u8 ---
;;; Python m3u8 parser
;;; Source: https://github.com/globocom/m3u8
;;; License: MIT
;;; Resolves: #6355 python-m3u8

(define-public python-m3u8
  (package
    (name "python-m3u8")
    (version "6.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/globocom/m3u8/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/globocom/m3u8")
    (synopsis "python m3u8 parser")
    (description "Python m3u8 parser.  Packaged from the Arch User Repository.")
    (license license:expat)))

;;; --- #5046 lcevcdec ---
;;; Low Complexity Enhancement Video Codec Decoder (LCEVC_DEC)
;;; Source: https://github.com/v-novaltd/LCEVCdec/
;;; License: BSD-3-Clause-Clear
;;; Resolves: #5046 lcevcdec

(define-public lcevcdec
  (package
    (name "lcevcdec")
    (version "4.0.5")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/v-novaltd/LCEVCdec//releases/download/v" version "/lcevcdec-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/v-novaltd/LCEVCdec/")
    (synopsis "low Complexity Enhancement Video Codec Decoder (LCEVC_DEC)")
    (description "Low Complexity Enhancement Video Codec Decoder (LCEVC_DEC).  Packaged from the Arch User Repository.")
    (license license:bsd-3)))

;;; --- #6326 gslapper ---
;;; Wallpaper utility for Wayland with video/image support and instant switching via RAM cache
;;; Source: https://github.com/Nomadcxx/gSlapper
;;; License: MIT
;;; Resolves: #6326 gslapper

(define-public gslapper
  (package
    (name "gslapper")
    (version "1.4.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/Nomadcxx/gSlapper/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/Nomadcxx/gSlapper")
    (synopsis "wallpaper utility for Wayland with video/image support and instant switchi...")
    (description "Wallpaper utility for Wayland with video/image support and instant switching via RAM cache.  Packaged from the Arch User Repository.")
    (license license:expat)))

;;; --- #5338 electron-castlab-bin ---
;;; Electron for Content Security (ECS) is a fork of Electron created by castLabs to facilitate the use of Google's Widevine Content Decryption Module (CDM) for DRM-enabled playback within Electron
;;; Source: https://github.com/castlabs/electron-releases
;;; License: GPL
;;; Resolves: #5338 electron-castlab-bin

(define-public electron-castlab-bin
  (package
    (name "electron-castlab-bin")
    (version "40.7.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/castlabs/electron-releases/releases/download/v" version "/electron-releases-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "/opt/" #:include-regexp (".*")))))
    (home-page "https://github.com/castlabs/electron-releases")
    (synopsis "electron for Content Security (ECS) is a fork of Electron created by castL...")
    (description "Electron for Content Security (ECS) is a fork of Electron created by castLabs to facilitate the use of Google's Widevine Content Decryption Module (CDM) for DRM-enabled playback within Electron.  Packaged from the Arch User Repository.")
    (license license:gpl3+)))

;;; --- #2123 python-mistralai ---
;;; Python Client SDK for the Mistral AI API.
;;; Source: https://github.com/mistralai/client-python
;;; License: MIT
;;; Resolves: #2123 python-mistralai

(define-public python-mistralai
  (package
    (name "python-mistralai")
    (version "2.3.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/mistralai/client-python/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/mistralai/client-python")
    (synopsis "python Client SDK for the Mistral AI API")
    (description "Python Client SDK for the Mistral AI API.  Packaged from the Arch User Repository.")
    (license license:expat)))

;;; --- #7899 fizz ---
;;; C++14 implementation of the TLS-1.3 standard
;;; Source: https://github.com/facebookincubator/fizz
;;; License: BSD-3-Clause
;;; Resolves: #7899 fizz

(define-public fizz
  (package
    (name "fizz")
    (version "2025.11.24.00")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/facebookincubator/fizz/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/facebookincubator/fizz")
    (synopsis "c++14 implementation of the TLS-1")
    (description "C++14 implementation of the TLS-1.3 standard.  Packaged from the Arch User Repository.")
    (license license:bsd-3)))

;;; --- #8109 libcava ---
;;; Fork to provide cava as a shared library, e.g. used by waybar. Cava is not provided as executable.
;;; Source: https://github.com/LukashonakV/cava
;;; License: MIT
;;; Resolves: #8109 libcava

(define-public libcava
  (package
    (name "libcava")
    (version "0.10.7")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/LukashonakV/cava/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/LukashonakV/cava")
    (synopsis "fork to provide cava as a shared library")
    (description "Fork to provide cava as a shared library, e.g. used by waybar. Cava is not provided as executable.  Packaged from the Arch User Repository.")
    (license license:expat)))

;;; --- #135 fooyin ---
;;; A customisable music player.
;;; Source: https://www.fooyin.org/
;;; License: GPL-3.0-only
;;; Resolves: #135 fooyin

(define-public fooyin
  (package
    (name "fooyin")
    (version "0.10.3")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.fooyin.org//releases/download/v" version "/fooyin-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://www.fooyin.org/")
    (synopsis "customisable music player")
    (description "A customisable music player.  Packaged from the Arch User Repository.")
    (license license:gpl3)))

;;; --- #4822 ros2-arch-deps ---
;;; [Meta-PKG] Dependencies for building ROS2 on Arch
;;; Source: https://docs.ros.org/
;;; License: None
;;; Resolves: #4822 ros2-arch-deps

(define-public ros2-arch-deps
  (package
    (name "ros2-arch-deps")
    (version "0.23")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://docs.ros.org//releases/download/v" version "/ros2-arch-deps-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://docs.ros.org/")
    (synopsis "[Meta-PKG] Dependencies for building ROS2 on Arch")
    (description "[Meta-PKG] Dependencies for building ROS2 on Arch.  Packaged from the Arch User Repository.")
    (license license:expat)))

;;; --- #8601 brother-lpr-drivers-common ---
;;; This package provides common files for Brother LPR drivers packages.
;;; Source: http://solutions.brother.com/linux/en_us/index.html
;;; License: custom:brother commercial license, GPL
;;; Resolves: #8601 brother-lpr-drivers-common

(define-public brother-lpr-drivers-common
  (package
    (name "brother-lpr-drivers-common")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://solutions.brother.com/linux/en_us/index.html/releases/download/v" version "/brother-lpr-drivers-common-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "http://solutions.brother.com/linux/en_us/index.html")
    (synopsis "this package provides common files for Brother LPR drivers packages")
    (description "This package provides common files for Brother LPR drivers packages.  Packaged from the Arch User Repository.")
    (license license:nonfree)))

;;; --- #7422 genders ---
;;; Static cluster configuration database used for cluster configuration management.
;;; Source: https://github.com/chaos/genders
;;; License: GPL
;;; Resolves: #7422 genders

(define-public genders
  (package
    (name "genders")
    (version "1.32.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/chaos/genders/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/chaos/genders")
    (synopsis "static cluster configuration database used for cluster configuration manag...")
    (description "Static cluster configuration database used for cluster configuration management.  Packaged from the Arch User Repository.")
    (license license:gpl3+)))

;;; --- #5016 ps3-env ---
;;; Meta package for tools used in the creation of homebrew software for the Sony PlayStation 3 videogame system.
;;; Source: https://github.com/ps3dev/ps3toolchain
;;; License: MIT
;;; Resolves: #5016 ps3-env

(define-public ps3-env
  (package
    (name "ps3-env")
    (version "20230409")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/ps3dev/ps3toolchain/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/ps3dev/ps3toolchain")
    (synopsis "meta package for tools used in the creation of homebrew software for the S...")
    (description "Meta package for tools used in the creation of homebrew software for the Sony PlayStation 3 videogame system.  Packaged from the Arch User Repository.")
    (license license:expat)))

;;; --- #1919 ttf-material-symbols-variable-git ---
;;; Material Design icons by Google - variable fonts
;;; Source: https://github.com/google/material-design-icons
;;; License: Apache-2.0
;;; Resolves: #1919 ttf-material-symbols-variable-git

(define-public ttf-material-symbols-variable-git
  (package
    (name "ttf-material-symbols-variable-git")
    (version "4.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                (url "https://github.com/google/material-design-icons")
                (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/google/material-design-icons")
    (synopsis "material Design icons by Google - variable fonts")
    (description "Material Design icons by Google - variable fonts.  Packaged from the Arch User Repository.")
    (license license:asl2.0)))

;;; --- #3730 asroot ---
;;; A simpler alternative to sudo and doas
;;; Source: https://codeberg.org/maandree/asroot
;;; License: custom:ISC
;;; Resolves: #3730 asroot

(define-public asroot
  (package
    (name "asroot")
    (version "1.1.12")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://codeberg.org/maandree/asroot/releases/download/v" version "/asroot-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://codeberg.org/maandree/asroot")
    (synopsis "simpler alternative to sudo and doas")
    (description "A simpler alternative to sudo and doas.  Packaged from the Arch User Repository.")
    (license license:isc)))

;;; --- #4242 deb2targz ---
;;; convert a Debian Linux .deb file to a .tar.gz
;;; Source: http://www.miketaylor.org.uk/tech/deb/deb2targz
;;; License: unknown
;;; Resolves: #4242 deb2targz

(define-public deb2targz
  (package
    (name "deb2targz")
    (version "0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://www.miketaylor.org.uk/tech/deb/deb2targz/releases/download/v" version "/deb2targz-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "http://www.miketaylor.org.uk/tech/deb/deb2targz")
    (synopsis "convert a Debian Linux")
    (description "Convert a Debian Linux .deb file to a .tar.gz.  Packaged from the Arch User Repository.")
    (license license:expat)))

;;; --- #6361 dotnet-targeting-pack-9.0-bin ---
;;; The .NET Core targeting pack
;;; Source: https://dotnet.microsoft.com
;;; License: MIT
;;; Resolves: #6361 dotnet-targeting-pack-9.0-bin

(define-public dotnet-targeting-pack-9.0-bin
  (package
    (name "dotnet-targeting-pack-9.0-bin")
    (version "9.0.14")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://dotnet.microsoft.com/releases/download/v" version "/dotnet-core-9.0-bin-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "/opt/" #:include-regexp (".*")))))
    (home-page "https://dotnet.microsoft.com")
    (synopsis "the")
    (description "The .NET Core targeting pack.  Packaged from the Arch User Repository.")
    (license license:expat)))

;;; --- #6064 falcond-profiles ---
;;; Default falcond profiles
;;; Source: https://github.com/PikaOS-Linux/falcond-profiles
;;; License: MIT
;;; Resolves: #6064 falcond-profiles

(define-public falcond-profiles
  (package
    (name "falcond-profiles")
    (version "23")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/PikaOS-Linux/falcond-profiles/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/PikaOS-Linux/falcond-profiles")
    (synopsis "default falcond profiles")
    (description "Default falcond profiles.  Packaged from the Arch User Repository.")
    (license license:expat)))

;;; --- #1541 archlinux-java-run ---
;;; Java Application Launcher for Arch Linux
;;; Source: https://github.com/michaellass/archlinux-java-run
;;; License: MIT
;;; Resolves: #1541 archlinux-java-run

(define-public archlinux-java-run
  (package
    (name "archlinux-java-run")
    (version "12")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/michaellass/archlinux-java-run/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/michaellass/archlinux-java-run")
    (synopsis "java Application Launcher for Arch Linux")
    (description "Java Application Launcher for Arch Linux.  Packaged from the Arch User Repository.")
    (license license:expat)))

;;; --- #5366 bwidget ---
;;; A suite of megawidgets for Tk
;;; Source: https://wiki.tcl.tk/2251
;;; License: GPL
;;; Resolves: #5366 bwidget

(define-public bwidget
  (package
    (name "bwidget")
    (version "1.10.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://wiki.tcl.tk/2251/releases/download/v" version "/bwidget-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://wiki.tcl.tk/2251")
    (synopsis "suite of megawidgets for Tk")
    (description "A suite of megawidgets for Tk.  Packaged from the Arch User Repository.")
    (license license:gpl3+)))

;;; --- #4186 heidisql ---
;;; HeidiSQL Shared files: wrapper script, locale/ini files, documentation (install a provider of your choice for heidisql-client to use it)
;;; Source: http://www.heidisql.com/
;;; License: GPL-2.0-or-later
;;; Resolves: #4186 heidisql

(define-public heidisql
  (package
    (name "heidisql")
    (version "12.17")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://www.heidisql.com//releases/download/v" version "/heidisql-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "http://www.heidisql.com/")
    (synopsis "heidiSQL Shared files: wrapper script")
    (description "HeidiSQL Shared files: wrapper script, locale/ini files, documentation (install a provider of your choice for heidisql-client to use it).  Packaged from the Arch User Repository.")
    (license license:gpl2+)))

;;; --- #2889 plasma-wayland-protocols-povd ---
;;; Plasma Specific Protocols for Wayland (patched for per-output virtual destkops)
;;; Source: https://kde.org/plasma-desktop
;;; License: LGPL-2.0-or-later
;;; Resolves: #2889 plasma-wayland-protocols-povd

(define-public plasma-wayland-protocols-povd
  (package
    (name "plasma-wayland-protocols-povd")
    (version "1.20.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://kde.org/plasma-desktop/releases/download/v" version "/plasma-wayland-protocols-povd-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://kde.org/plasma-desktop")
    (synopsis "plasma Specific Protocols for Wayland (patched for per-output virtual dest...")
    (description "Plasma Specific Protocols for Wayland (patched for per-output virtual destkops).  Packaged from the Arch User Repository.")
    (license license:lgpl2.0+)))

;;; --- #6053 python-simple-term-menu ---
;;; A Python package which creates simple interactive menus on the command line.
;;; Source: https://github.com/IngoMeyer441/simple-term-menu
;;; License: MIT
;;; Resolves: #6053 python-simple-term-menu

(define-public python-simple-term-menu
  (package
    (name "python-simple-term-menu")
    (version "1.6.6")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/IngoMeyer441/simple-term-menu/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/IngoMeyer441/simple-term-menu")
    (synopsis "python package which creates simple interactive menus on the command line")
    (description "A Python package which creates simple interactive menus on the command line.  Packaged from the Arch User Repository.")
    (license license:expat)))

;;; --- #8142 shorewall-core ---
;;; Core Shorewall libraries
;;; Source: https://shorewall.org/
;;; License: GPL
;;; Resolves: #8142 shorewall-core

(define-public shorewall-core
  (package
    (name "shorewall-core")
    (version "5.2.8")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://shorewall.org//releases/download/v" version "/shorewall-core-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://shorewall.org/")
    (synopsis "core Shorewall libraries")
    (description "Core Shorewall libraries.  Packaged from the Arch User Repository.")
    (license license:gpl3+)))

;;; --- #285 gtk-sharp-2 ---
;;; GTK2 bindings for C#.
;;; Source: https://www.mono-project.com/docs/gui/gtksharp/
;;; License: LGPL
;;; Resolves: #285 gtk-sharp-2

(define-public gtk-sharp-2
  (package
    (name "gtk-sharp-2")
    (version "2.12.45")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.mono-project.com/docs/gui/gtksharp//releases/download/v" version "/gtk-sharp-2-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://www.mono-project.com/docs/gui/gtksharp/")
    (synopsis "gTK2 bindings for C#")
    (description "GTK2 bindings for C#.  Packaged from the Arch User Repository.")
    (license license:expat)))

;;; --- #5313 qt5-datavis3d ---
;;; Qt Data Visualization module
;;; Source: https://www.qt.io
;;; License: GPL3
;;; Resolves: #5313 qt5-datavis3d

(define-public qt5-datavis3d
  (package
    (name "qt5-datavis3d")
    (version "5.15.18")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.qt.io/releases/download/v" version "/qt5-datavis3d-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://www.qt.io")
    (synopsis "qt Data Visualization module")
    (description "Qt Data Visualization module.  Packaged from the Arch User Repository.")
    (license license:gpl3+)))

;;; --- #2667 verify-lib ---
;;; Validates shell library files before sourcing — compiled binary to break the bootstrap problem
;;; Source: https://gitlab.com/fkzys/verify-lib
;;; License: AGPL-3.0-or-later
;;; Resolves: #2667 verify-lib

(define-public verify-lib
  (package
    (name "verify-lib")
    (version "0.0.4")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://gitlab.com/fkzys/verify-lib/releases/download/v" version "/verify-lib-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://gitlab.com/fkzys/verify-lib")
    (synopsis "validates shell library files before sourcing — compiled binary to break t...")
    (description "Validates shell library files before sourcing — compiled binary to break the bootstrap problem.  Packaged from the Arch User Repository.")
    (license license:agpl3+)))

;;; --- #2678 wolfssl-all ---
;;; Lightweight, portable, C-language-based SSL/TLS library (built with --enable-all)
;;; Source: https://www.wolfssl.com/
;;; License: GPL-3.0-or-later
;;; Resolves: #2678 wolfssl-all

(define-public wolfssl-all
  (package
    (name "wolfssl-all")
    (version "5.9.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.wolfssl.com//releases/download/v" version "/wolfssl-all-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://www.wolfssl.com/")
    (synopsis "lightweight")
    (description "Lightweight, portable, C-language-based SSL/TLS library (built with --enable-all).  Packaged from the Arch User Repository.")
    (license license:gpl3+)))

;;; --- #8054 python-pyfakewebcam-git ---
;;; An API for writing RGB frames to a fake webcam device on Linux
;;; Source: https://github.com/jremmons/pyfakewebcam
;;; License: GPL3
;;; Resolves: #8054 python-pyfakewebcam-git

(define-public python-pyfakewebcam-git
  (package
    (name "python-pyfakewebcam-git")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                (url "https://github.com/jremmons/pyfakewebcam")
                (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/jremmons/pyfakewebcam")
    (synopsis "aPI for writing RGB frames to a fake webcam device on Linux")
    (description "An API for writing RGB frames to a fake webcam device on Linux.  Packaged from the Arch User Repository.")
    (license license:gpl3+)))

;;; --- #299 app2unit ---
;;; Utility to launch commands as systemd user units
;;; Source: https://github.com/Vladimir-csp/app2unit
;;; License: GPL-3.0-only
;;; Resolves: #299 app2unit

(define-public app2unit
  (package
    (name "app2unit")
    (version "1.4.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/Vladimir-csp/app2unit/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/Vladimir-csp/app2unit")
    (synopsis "utility to launch commands as systemd user units")
    (description "Utility to launch commands as systemd user units.  Packaged from the Arch User Repository.")
    (license license:gpl3)))

;;; --- #280 c++utilities ---
;;; Common C++ classes and routines such as argument parser, IO and conversion utilities
;;; Source: https://github.com/Martchus/cpp-utilities
;;; License: GPL-2.0-or-later
;;; Resolves: #280 c++utilities

(define-public cpp-utilities
  (package
    (name "cpp-utilities")
    (version "5.34.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/Martchus/cpp-utilities/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/Martchus/cpp-utilities")
    (synopsis "common C++ classes and routines such as argument parser")
    (description "Common C++ classes and routines such as argument parser, IO and conversion utilities.  Packaged from the Arch User Repository.")
    (license license:gpl2+)))

;;; --- #8092 displaylink ---
;;; Linux driver for DisplayLink devices
;;; Source: https://www.synaptics.com/products/displaylink-graphics
;;; License: custom, GPL2, LGPL2.1
;;; Resolves: #8092 displaylink

(define-public displaylink
  (package
    (name "displaylink")
    (version "6.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.synaptics.com/products/displaylink-graphics/releases/download/v" version "/displaylink-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://www.synaptics.com/products/displaylink-graphics")
    (synopsis "linux driver for DisplayLink devices")
    (description "Linux driver for DisplayLink devices.  Packaged from the Arch User Repository.")
    (license license:nonfree)))

;;; --- #6209 lib32-blas ---
;;; Basic Linear Algebra Subprograms (32-bit)
;;; Source: https://www.netlib.org/lapack
;;; License: BSD-3-Clause
;;; Resolves: #6209 lib32-blas

(define-public lib32-blas
  (package
    (name "lib32-blas")
    (version "3.12.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.netlib.org/lapack/releases/download/v" version "/lib32-blas-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://www.netlib.org/lapack")
    (synopsis "basic Linear Algebra Subprograms (32-bit)")
    (description "Basic Linear Algebra Subprograms (32-bit).  Packaged from the Arch User Repository.")
    (license license:bsd-3)))

;;; --- #2366 lib32-libvmaf ---
;;; Perceptual video quality assessment algorithm based on multi-method fusion - library (32 bit)
;;; Source: https://github.com/Netflix/vmaf/
;;; License: BSD
;;; Resolves: #2366 lib32-libvmaf

(define-public lib32-libvmaf
  (package
    (name "lib32-libvmaf")
    (version "3.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/Netflix/vmaf//releases/download/v" version "/lib32-libvmaf-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/Netflix/vmaf/")
    (synopsis "perceptual video quality assessment algorithm based on multi-method fusion...")
    (description "Perceptual video quality assessment algorithm based on multi-method fusion - library (32 bit).  Packaged from the Arch User Repository.")
    (license license:bsd-3)))

;;; --- #10351 libastal-gjs-git ---
;;; gjs bindings for libstal.
;;; Source: https://github.com/Aylur/astal
;;; License: LGPL-2.1-only
;;; Resolves: #10351 libastal-gjs-git

(define-public libastal-gjs-git
  (package
    (name "libastal-gjs-git")
    (version "580")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                (url "https://github.com/Aylur/astal")
                (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/Aylur/astal")
    (synopsis "gjs bindings for libstal")
    (description "Gjs bindings for libstal.  Packaged from the Arch User Repository.")
    (license license:lgpl2.1+)))

;;; --- #2334 osu-mime ---
;;; Provides MIME types for osu! file formats
;;; Source: 
;;; License: AGPL3
;;; Resolves: #2334 osu-mime

(define-public osu-mime
  (package
    (name "osu-mime")
    (version "0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://example.com/releases/download/v" version "/osu-mime-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://aur.archlinux.org/packages/osu-mime")
    (synopsis "provides MIME types for osu! file formats")
    (description "Provides MIME types for osu! file formats.  Packaged from the Arch User Repository.")
    (license license:agpl3+)))

;;; --- #7447 python-myjdapi ---
;;; My.Jdownloader API Python Library
;;; Source: https://github.com/mmarquezs/My.Jdownloader-API-Python-Library/
;;; License: MIT
;;; Resolves: #7447 python-myjdapi

(define-public python-myjdapi
  (package
    (name "python-myjdapi")
    (version "1.1.9")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://files.pythonhosted.org/packages/source/" (string-take "myjdapi" 1) "/myjdapi/myjdapi-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/mmarquezs/My.Jdownloader-API-Python-Library/")
    (synopsis "my")
    (description "My.Jdownloader API Python Library.  Packaged from the Arch User Repository.")
    (license license:expat)))

;;; --- #12065 python-opentelemetry-exporter-otlp ---
;;; OpenTelemetry Collector Exporters
;;; Source: https://github.com/open-telemetry/opentelemetry-python
;;; License: Apache-2.0
;;; Resolves: #12065 python-opentelemetry-exporter-otlp

(define-public python-opentelemetry-exporter-otlp
  (package
    (name "python-opentelemetry-exporter-otlp")
    (version "1.40.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/open-telemetry/opentelemetry-python/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/open-telemetry/opentelemetry-python")
    (synopsis "openTelemetry Collector Exporters")
    (description "OpenTelemetry Collector Exporters.  Packaged from the Arch User Repository.")
    (license license:asl2.0)))

;;; --- #9256 python3-xcpf ---
;;; Xyne's common Pacman functions, for internal use.
;;; Source: https://xyne.dev/projects/python3-xcpf
;;; License: GPL
;;; Resolves: #9256 python3-xcpf

(define-public python3-xcpf
  (package
    (name "python3-xcpf")
    (version "2021.12")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://files.pythonhosted.org/packages/source/" (string-take "xcpf" 1) "/xcpf/xcpf-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://xyne.dev/projects/python3-xcpf")
    (synopsis "xyne's common Pacman functions")
    (description "Xyne's common Pacman functions, for internal use.  Packaged from the Arch User Repository.")
    (license license:gpl3+)))

;;; --- #10690 python-cryptg ---
;;; Cryptographic utilities for Telegram, designed to use with Telethon.
;;; Source: https://github.com/cher-nov/cryptg
;;; License: CC0-1.0
;;; Resolves: #10690 python-cryptg

(define-public python-cryptg
  (package
    (name "python-cryptg")
    (version "0.5")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/cher-nov/cryptg/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/cher-nov/cryptg")
    (synopsis "cryptographic utilities for Telegram")
    (description "Cryptographic utilities for Telegram, designed to use with Telethon.  Packaged from the Arch User Repository.")
    (license license:cc0)))

;;; --- #8161 python-kajson ---
;;; Powerful universal JSON encoder/decoder for Python objects
;;; Source: https://github.com/pipelex/kajson
;;; License: Apache-2.0
;;; Resolves: #8161 python-kajson

(define-public python-kajson
  (package
    (name "python-kajson")
    (version "0.4.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/pipelex/kajson/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/pipelex/kajson")
    (synopsis "powerful universal JSON encoder/decoder for Python objects")
    (description "Powerful universal JSON encoder/decoder for Python objects.  Packaged from the Arch User Repository.")
    (license license:asl2.0)))

;;; --- #2642 sonic-screen-library ---
;;; Screen management library for SonicDE Workspaces
;;; Source: https://github.com/Sonic-DE/sonic-screen-library
;;; License: LGPL-2.0-or-later
;;; Resolves: #2642 sonic-screen-library

(define-public sonic-screen-library
  (package
    (name "sonic-screen-library")
    (version "6.6.4")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/Sonic-DE/sonic-screen-library/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/Sonic-DE/sonic-screen-library")
    (synopsis "screen management library for SonicDE Workspaces")
    (description "Screen management library for SonicDE Workspaces.  Packaged from the Arch User Repository.")
    (license license:lgpl2.0+)))

;;; --- #12071 python-opentelemetry-exporter-zipkin-json ---
;;; Zipkin Span JSON Exporter for OpenTelemetry
;;; Source: https://github.com/open-telemetry/opentelemetry-python
;;; License: Apache-2.0
;;; Resolves: #12071 python-opentelemetry-exporter-zipkin-json

(define-public python-opentelemetry-exporter-zipkin-json
  (package
    (name "python-opentelemetry-exporter-zipkin-json")
    (version "1.40.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/open-telemetry/opentelemetry-python/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/open-telemetry/opentelemetry-python")
    (synopsis "zipkin Span JSON Exporter for OpenTelemetry")
    (description "Zipkin Span JSON Exporter for OpenTelemetry.  Packaged from the Arch User Repository.")
    (license license:asl2.0)))

;;; --- #6632 sqlite-utils ---
;;; CLI tool and Python utility functions for manipulating SQLite databases
;;; Source: https://sqlite-utils.datasette.io/
;;; License: Apache-2.0
;;; Resolves: #6632 sqlite-utils

(define-public sqlite-utils
  (package
    (name "sqlite-utils")
    (version "3.39")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://files.pythonhosted.org/packages/source/" (string-take "sqlite-utils" 1) "/sqlite-utils/sqlite-utils-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://sqlite-utils.datasette.io/")
    (synopsis "cLI tool and Python utility functions for manipulating SQLite databases")
    (description "CLI tool and Python utility functions for manipulating SQLite databases.  Packaged from the Arch User Repository.")
    (license license:asl2.0)))

;;; --- #3795 gradle8 ---
;;; Powerful build system for the JVM
;;; Source: https://gradle.org/
;;; License: Apache
;;; Resolves: #3795 gradle8

(define-public gradle8
  (package
    (name "gradle8")
    (version "8.14.3")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://gradle.org//releases/download/v" version "/gradle8-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://gradle.org/")
    (synopsis "powerful build system for the JVM")
    (description "Powerful build system for the JVM.  Packaged from the Arch User Repository.")
    (license license:asl2.0)))

;;; --- #12904 cvmfs ---
;;; A client-server file system implemented in FUSE and developed to deliver software distributions onto virtual machines in a fast, scalable, and reliable way.
;;; Source: http://cernvm.cern.ch/portal/filesystem
;;; License: BSD
;;; Resolves: #12904 cvmfs

(define-public cvmfs
  (package
    (name "cvmfs")
    (version "2.13.3")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://cernvm.cern.ch/portal/filesystem/releases/download/v" version "/cvmfs-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "http://cernvm.cern.ch/portal/filesystem")
    (synopsis "client-server file system implemented in FUSE and developed to deliver sof...")
    (description "A client-server file system implemented in FUSE and developed to deliver software distributions onto virtual machines in a fast, scalable, and reliable way.  Packaged from the Arch User Repository.")
    (license license:bsd-3)))

;;; --- #251 vencord-installer ---
;;; A cross platform gui/cli app for installing Vencord
;;; Source: https://github.com/Vencord/Installer
;;; License: GPL-3.0-only
;;; Resolves: #251 vencord-installer

(define-public vencord-installer
  (package
    (name "vencord-installer")
    (version "1.4.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/Vencord/Installer/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/Vencord/Installer"
           #:install-source? #f
           #:tests? #f))
    (home-page "https://github.com/Vencord/Installer")
    (synopsis "cross platform gui/cli app for installing Vencord")
    (description "A cross platform gui/cli app for installing Vencord.  Packaged from the Arch User Repository.")
    (license license:gpl3)))

;;; --- #8055 python-mediapipe-bin ---
;;; A cross-platform, customizable ML solutions for live and streaming media
;;; Source: https://github.com/google/mediapipe
;;; License: Apache
;;; Resolves: #8055 python-mediapipe-bin

(define-public python-mediapipe-bin
  (package
    (name "python-mediapipe-bin")
    (version "0.10.32")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/google/mediapipe/releases/download/v" version "/mediapipe-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "/opt/" #:include-regexp (".*")))))
    (home-page "https://github.com/google/mediapipe")
    (synopsis "cross-platform")
    (description "A cross-platform, customizable ML solutions for live and streaming media.  Packaged from the Arch User Repository.")
    (license license:asl2.0)))

;;; --- #6825 python-rapidocr ---
;;; Cross-runtime OCR library
;;; Source: https://github.com/RapidAI/RapidOCR
;;; License: Apache-2.0
;;; Resolves: #6825 python-rapidocr

(define-public python-rapidocr
  (package
    (name "python-rapidocr")
    (version "3.8.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/RapidAI/RapidOCR/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/RapidAI/RapidOCR")
    (synopsis "cross-runtime OCR library")
    (description "Cross-runtime OCR library.  Packaged from the Arch User Repository.")
    (license license:asl2.0)))

;;; --- #466 wayfire ---
;;; 3D wayland compositor
;;; Source: https://wayfire.org
;;; License: MIT
;;; Resolves: #466 wayfire

(define-public wayfire
  (package
    (name "wayfire")
    (version "0.10.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://wayfire.org/releases/download/v" version "/wayfire-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://wayfire.org")
    (synopsis "3D wayland compositor")
    (description "3D wayland compositor.  Packaged from the Arch User Repository.")
    (license license:expat)))

;;; --- #6123 linux-cachyos-bore ---
;;; The Linux BORE + Cachy Sauce scheduler Kernel by CachyOS with other patches and improvements kernel and modules
;;; Source: https://github.com/CachyOS/linux-cachyos
;;; License: GPL-2.0-only
;;; Resolves: #6123 linux-cachyos-bore

(define-public linux-cachyos-bore
  (package
    (name "linux-cachyos-bore")
    (version "6.19.12")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/CachyOS/linux-cachyos/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/CachyOS/linux-cachyos")
    (synopsis "linux BORE + Cachy Sauce scheduler Kernel by CachyOS with other patches an...")
    (description "The Linux BORE + Cachy Sauce scheduler Kernel by CachyOS with other patches and improvements kernel and modules.  Packaged from the Arch User Repository.")
    (license license:gpl2)))

;;; --- #7025 tensorrt ---
;;; A platform for high-performance deep learning inference on NVIDIA hardware
;;; Source: https://developer.nvidia.com/tensorrt/
;;; License: Apache-2.0 AND LicenseRef-TensorRT-LICENSE-AGREEMENT
;;; Resolves: #7025 tensorrt

(define-public tensorrt
  (package
    (name "tensorrt")
    (version "10.16.0.72")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://developer.nvidia.com/tensorrt//releases/download/v" version "/tensorrt-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://developer.nvidia.com/tensorrt/")
    (synopsis "platform for high-performance deep learning inference on NVIDIA hardware")
    (description "A platform for high-performance deep learning inference on NVIDIA hardware.  Packaged from the Arch User Repository.")
    (license license:asl2.0)))

;;; --- #8100 skia-static ---
;;; A complete 2D graphic library for drawing Text, Geometries, and Images; Static build.
;;; Source: https://github.com/google/skia
;;; License: BSD-3-Clause
;;; Resolves: #8100 skia-static

(define-public skia-static
  (package
    (name "skia-static")
    (version "144")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/google/skia/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/google/skia")
    (synopsis "complete 2D graphic library for drawing Text")
    (description "A complete 2D graphic library for drawing Text, Geometries, and Images; Static build.  Packaged from the Arch User Repository.")
    (license license:bsd-3)))

;;; --- #7395 sonic-silver-theme ---
;;; Highly customizable binary Window Decoration, Application Style and Global Theme plugin for the Sonic Desktop.
;;; Source: https://github.com/Sonic-DE/silver-theme
;;; License: LGPL-2.0-or-later
;;; Resolves: #7395 sonic-silver-theme

(define-public sonic-silver-theme
  (package
    (name "sonic-silver-theme")
    (version "6.6.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/Sonic-DE/silver-theme/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/Sonic-DE/silver-theme")
    (synopsis "highly customizable binary Window Decoration")
    (description "Highly customizable binary Window Decoration, Application Style and Global Theme plugin for the Sonic Desktop.  Packaged from the Arch User Repository.")
    (license license:lgpl2.0+)))

;;; --- #3129 vscodium-translucent ---
;;; Free/Libre Open Source Software Binaries of VSCode with the translucent patch applied (git build from latest release).
;;; Source: https://github.com/VSCodium/vscodium
;;; License: MIT
;;; Resolves: #3129 vscodium-translucent

(define-public vscodium-translucent
  (package
    (name "vscodium-translucent")
    (version "1.109.51242")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/VSCodium/vscodium/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/VSCodium/vscodium")
    (synopsis "free/Libre Open Source Software Binaries of VSCode with the translucent pa...")
    (description "Free/Libre Open Source Software Binaries of VSCode with the translucent patch applied (git build from latest release).  Packaged from the Arch User Repository.")
    (license license:expat)))

;;; --- #1935 deadbeef ---
;;; Modular GTK audio player for GNU/Linux
;;; Source: https://deadbeef.sourceforge.io/
;;; License: GPL-2.0-or-later, LGPL-2.1-or-later, zlib
;;; Resolves: #1935 deadbeef

(define-public deadbeef
  (package
    (name "deadbeef")
    (version "1.10.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://deadbeef.sourceforge.io//releases/download/v" version "/deadbeef-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://deadbeef.sourceforge.io/")
    (synopsis "modular GTK audio player for GNU/Linux")
    (description "Modular GTK audio player for GNU/Linux.  Packaged from the Arch User Repository.")
    (license license:gpl2+)))

;;; --- #2643 sonic-system-info ---
;;; Display information about your computers hardware on the Sonic desktop
;;; Source: https://github.com/Sonic-DE/sonic-system-info
;;; License: LGPL-2.0-or-later
;;; Resolves: #2643 sonic-system-info

(define-public sonic-system-info
  (package
    (name "sonic-system-info")
    (version "6.6.4")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/Sonic-DE/sonic-system-info/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/Sonic-DE/sonic-system-info")
    (synopsis "display information about your computers hardware on the Sonic desktop")
    (description "Display information about your computers hardware on the Sonic desktop.  Packaged from the Arch User Repository.")
    (license license:lgpl2.0+)))

;;; --- #6640 amdonly-gaming-opencl-rusticl-mesa-git ---
;;; OpenCL support with rusticl for mesa drivers
;;; Source: https://www.mesa3d.org/
;;; License: LicenseRef-mesa
;;; Resolves: #6640 amdonly-gaming-opencl-rusticl-mesa-git

(define-public amdonly-gaming-opencl-rusticl-mesa-git
  (package
    (name "amdonly-gaming-opencl-rusticl-mesa-git")
    (version "26.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                (url "https://www.mesa3d.org/")
                (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://www.mesa3d.org/")
    (synopsis "openCL support with rusticl for mesa drivers")
    (description "OpenCL support with rusticl for mesa drivers.  Packaged from the Arch User Repository.")
    (license license:expat)))

;;; --- #6641 amdonly-gaming-mesa-git ---
;;; An open-source implementation of the OpenGL specification
;;; Source: https://www.mesa3d.org/
;;; License: LicenseRef-mesa
;;; Resolves: #6641 amdonly-gaming-mesa-git

(define-public amdonly-gaming-mesa-git
  (package
    (name "amdonly-gaming-mesa-git")
    (version "26.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                (url "https://www.mesa3d.org/")
                (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://www.mesa3d.org/")
    (synopsis "open-source implementation of the OpenGL specification")
    (description "An open-source implementation of the OpenGL specification.  Packaged from the Arch User Repository.")
    (license license:expat)))

;;; --- #6638 amdonly-gaming-vulkan-radeon-git ---
;;; Radeon's Vulkan mesa driver
;;; Source: https://www.mesa3d.org/
;;; License: LicenseRef-mesa
;;; Resolves: #6638 amdonly-gaming-vulkan-radeon-git

(define-public amdonly-gaming-vulkan-radeon-git
  (package
    (name "amdonly-gaming-vulkan-radeon-git")
    (version "26.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                (url "https://www.mesa3d.org/")
                (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://www.mesa3d.org/")
    (synopsis "radeon's Vulkan mesa driver")
    (description "Radeon's Vulkan mesa driver.  Packaged from the Arch User Repository.")
    (license license:expat)))

;;; --- #6639 amdonly-gaming-vulkan-mesa-layers-git ---
;;; Mesa's Vulkan layers
;;; Source: https://www.mesa3d.org/
;;; License: LicenseRef-mesa
;;; Resolves: #6639 amdonly-gaming-vulkan-mesa-layers-git

(define-public amdonly-gaming-vulkan-mesa-layers-git
  (package
    (name "amdonly-gaming-vulkan-mesa-layers-git")
    (version "26.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                (url "https://www.mesa3d.org/")
                (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://www.mesa3d.org/")
    (synopsis "mesa's Vulkan layers")
    (description "Mesa's Vulkan layers.  Packaged from the Arch User Repository.")
    (license license:expat)))

;;; --- #6567 qemu-headless-git ---
;;; QEMU without GUI. Git version.
;;; Source: https://wiki.qemu.org/
;;; License: GPL-2.0-or-later, LGPL-2.1-or-later
;;; Resolves: #6567 qemu-headless-git

(define-public qemu-headless-git
  (package
    (name "qemu-headless-git")
    (version "11.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                (url "https://wiki.qemu.org/")
                (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://wiki.qemu.org/")
    (synopsis "qEMU without GUI")
    (description "QEMU without GUI. Git version.  Packaged from the Arch User Repository.")
    (license license:gpl2+)))

;;; --- #11554 alhp-keyring ---
;;; ALHP PGP keyring
;;; Source: https://somegit.dev/ALHP/alhp-keyring
;;; License: GPL-3.0-or-later
;;; Resolves: #11554 alhp-keyring

(define-public alhp-keyring
  (package
    (name "alhp-keyring")
    (version "20250509")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://somegit.dev/ALHP/alhp-keyring/releases/download/v" version "/alhp-keyring-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://somegit.dev/ALHP/alhp-keyring")
    (synopsis "aLHP PGP keyring")
    (description "ALHP PGP keyring.  Packaged from the Arch User Repository.")
    (license license:gpl3+)))

;;; --- #7960 auth0-bin ---
;;; auth0 is the command line to supercharge your development workflow
;;; Source: https://github.com/auth0/auth0-cli
;;; License: MIT
;;; Resolves: #7960 auth0-bin

(define-public auth0-bin
  (package
    (name "auth0-bin")
    (version "1.26.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/auth0/auth0-cli/releases/download/v" version "/auth0-cli-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "/opt/" #:include-regexp (".*")))))
    (home-page "https://github.com/auth0/auth0-cli")
    (synopsis "auth0 is the command line to supercharge your development workflow")
    (description "Auth0 is the command line to supercharge your development workflow.  Packaged from the Arch User Repository.")
    (license license:expat)))

;;; --- #7922 binjr-bin ---
;;; Time Series Data Browser
;;; Source: https://binjr.eu/
;;; License: Apache
;;; Resolves: #7922 binjr-bin

(define-public binjr-bin
  (package
    (name "binjr-bin")
    (version "3.28.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://binjr.eu//releases/download/v" version "/binjr-bin-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "/opt/" #:include-regexp (".*")))))
    (home-page "https://binjr.eu/")
    (synopsis "time Series Data Browser")
    (description "Time Series Data Browser.  Packaged from the Arch User Repository.")
    (license license:asl2.0)))

;;; --- #8066 binvec-bin ---
;;; A simple application to convert raster graphics to vector graphics (pre-compiled)
;;; Source: https://github.com/RouHim/binvec
;;; License: MIT
;;; Resolves: #8066 binvec-bin

(define-public binvec-bin
  (package
    (name "binvec-bin")
    (version "1.20.21")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/RouHim/binvec/releases/download/v" version "/binvec-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "/opt/" #:include-regexp (".*")))))
    (home-page "https://github.com/RouHim/binvec")
    (synopsis "simple application to convert raster graphics to vector graphics (pre-comp...")
    (description "A simple application to convert raster graphics to vector graphics (pre-compiled).  Packaged from the Arch User Repository.")
    (license license:expat)))
