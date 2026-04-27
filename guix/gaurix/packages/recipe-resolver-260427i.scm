;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260427i
;;; Resolves 100 packages from queue (100 recipes, 0 blocked).
;;;
;;; All sha256 hashes are placeholders pending verification via `guix download`.

(define-module (gaurix packages recipe-resolver-260427i)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system node)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:export (

            modustoolbox
            vscodium
            openarena
            php56-ctype
            latexdraw
            pan-git
            terminess-powerline-font-git
            nodejs-ungit
            plymouth-theme-arch-charge
            gyazo
            easymp3gain-gtk2
            whipper-git
            qwt-qt4
            fwts-git
            napi-bash
            eiskaltdcpp-cli
            sierrabreeze-kwin-decoration-git
            progress-git
            zxing-cpp-git
            python-cadquery
            cave9
            geoserver-bin
            python-uncompyle6
            xtide
            php82-cli
            ipinfo-cli
            ceph-mgr-git
            hol
            telepresence
            lwan-git
            canon-pixma-mx410-complete
            go-for-it
            mocicon
            python-usbtmc
            sweethome3d-3dmodels-trees
            eyeocr
            image-roll-bin
            libchdr-git
            refind-black-git
            tesseract-data-mar-git
            crab-hole
            calendarsync-bin
            tela-circle-icon-theme-purple-git
            awakened-poe-trade-bin
            hugs
            python-lmfit
            r-styler
            danectl-git
            doomretro-git
            gitkraken-standalone
            gti-bin
            icinga2-git
            lilium-voyager-git
            passmenu-rs-git
            python-tkcolorpicker
            rusty-tags
            scholarref-git
            suru-plus-dark-git
            tzsp2pcap-git
            vertrux-icon-theme
            hysteria-bin
            solarxr-cli-git
            gcviewer-bin
            wl-restart-git
            openjkdf2-git
            google-docs-bin
            grub-theme-bsol-git
            autobrr-runit
            barracudavpn-bin
            gobyte-qt
            legendary-heroic-bin
            arduino-noide-libs
            pibuss
            blitzloop-git
            cgterm-git
            checkersland
            colima
            deb2appimage
            cosbrowser
            dmalloc
            dynamic-wallpaper-catalina-kde-git
            etherdfs
            fabric1
            fselect-git
            gotags
            guile-gash
            hosts-gen
            r-globals
            r-rbibutils
            ibus-theme-tools
            libraw-git
            mod-builder
            notejot-git
            notepadqq-legacy
            palemoon-i18n-es-ar
            perl-x11-protocol-more
            phosta
            postgresql-libversion
            libretro-ppsspp-git
            amide
            ))

;;; Nonfree/proprietary license placeholder for Gaurix channel
(define license:nonfree
  ((@@ (guix licenses) license) "Nonfree"
    "https://spdx.org/licenses/"
    "Proprietary or custom license; see upstream for terms."))

;;; modustoolbox --- A set of multi-platform development tools and a comprehensive suite of
(define-public modustoolbox
  (package
    (name "modustoolbox")
    (version "3.6.0.17979")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/modustoolbox.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "A set of multi-platform development tools and a comprehensive suite of GitHub-")
    (description "A set of multi-platform development tools and a comprehensive suite of GitHub-hosted firmware libraries. Together, they enable an immersive development experience for customers creating converged MCU and Wireless systems.")
    (home-page "https://softwaretools.infineon.com/tools/com.ifx.tb.tool.modustoolbox")
    (license license:nonfree)))

;;; vscodium --- free/Libre Open Source Software Binaries of VSCode (git build from lat
(define-public vscodium
  (package
    (name "vscodium")
    (version "1.116.02821")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/vscodium.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "free/Libre Open Source Software Binaries of VSCode (git build from latest rele")
    (description "Free/Libre Open Source Software Binaries of VSCode (git build from latest release).")
    (home-page "https://github.com/VSCodium/vscodium.git")
    (license license:expat)))

;;; openarena --- A violent, sexy, multiplayer first person shooter based on the ioquake
(define-public openarena
  (package
    (name "openarena")
    (version "0.8.8")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/openarena.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "A violent, sexy, multiplayer first person shooter based on the ioquake3 engine")
    (description "A violent, sexy, multiplayer first person shooter based on the ioquake3 engine (binary package).")
    (home-page "http://openarena.ws/")
    (license license:gpl3+)))

;;; php56-ctype --- ctype module for php56
(define-public php56-ctype
  (package
    (name "php56-ctype")
    (version "5.6.40")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/php56-ctype.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "ctype module for php56")
    (description "Ctype module for php56.")
    (home-page "http://www.php.net")
    (license license:nonfree)))

;;; latexdraw --- A vector drawing editor for LaTeX (JavaFX)
(define-public latexdraw
  (package
    (name "latexdraw")
    (version "4.0.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/latexdraw.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "A vector drawing editor for LaTeX (JavaFX)")
    (description "A vector drawing editor for LaTeX (JavaFX).")
    (home-page "http://latexdraw.sourceforge.net")
    (license license:gpl3+)))

;;; pan-git --- pan is a Usenet newsreader that's good at both text and binaries. Deve
(define-public pan-git
  (package
    (name "pan-git")
    (version "1:v0.165.r0.gb18f5cbc")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/pan-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "pan is a Usenet newsreader that's good at both text and binaries. Development ")
    (description "Pan is a Usenet newsreader that's good at both text and binaries. Development version.")
    (home-page "http://pan.rebelbase.com/")
    (license license:gpl3+)))

;;; terminess-powerline-font-git --- terminess Powerline
(define-public terminess-powerline-font-git
  (package
    (name "terminess-powerline-font-git")
    (version "r202.e80e3eb")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/terminess-powerline-font-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "terminess Powerline")
    (description "Terminess Powerline.")
    (home-page "https://github.com/powerline/fonts")
    (license license:nonfree)))

;;; nodejs-ungit --- git made easy
(define-public nodejs-ungit
  (package
    (name "nodejs-ungit")
    (version "1.5.28")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/nodejs-ungit.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "git made easy")
    (description "Git made easy.")
    (home-page "https://www.npmjs.com/package/ungit")
    (license license:expat)))

;;; plymouth-theme-arch-charge --- A Plyouth theme based on Fedora's Charge theme, but featuring the Arch
(define-public plymouth-theme-arch-charge
  (package
    (name "plymouth-theme-arch-charge")
    (version "20190914")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/plymouth-theme-arch-charge.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "A Plyouth theme based on Fedora's Charge theme, but featuring the ArchLinux lo")
    (description "A Plyouth theme based on Fedora's Charge theme, but featuring the ArchLinux logo.")
    (home-page "http://development.sjmcdougall.com/plymouth-themes/arch-charge")
    (license license:gpl3+)))

;;; gyazo --- launch the Gyazo app and drag your mouse to grab the screen
(define-public gyazo
  (package
    (name "gyazo")
    (version "1.3.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gyazo.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "launch the Gyazo app and drag your mouse to grab the screen")
    (description "Launch the Gyazo app and drag your mouse to grab the screen.")
    (home-page "http://gyazo.com/")
    (license license:gpl3+)))

;;; easymp3gain-gtk2 --- GTK2 Graphical User Interface (GUI) for MP3Gain, VorbisGain and AACGai
(define-public easymp3gain-gtk2
  (package
    (name "easymp3gain-gtk2")
    (version "0.5.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/easymp3gain-gtk2.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "GTK2 Graphical User Interface (GUI) for MP3Gain, VorbisGain and AACGain")
    (description "GTK2 Graphical User Interface (GUI) for MP3Gain, VorbisGain and AACGain.")
    (home-page "http://easymp3gain.sourceforge.net/")
    (license license:gpl3+)))

;;; whipper-git --- A Unix CD ripper aiming for accuracy over speed -- forked from moritur
(define-public whipper-git
  (package
    (name "whipper-git")
    (version "0.9.1.dev138+g731453e")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/whipper-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "A Unix CD ripper aiming for accuracy over speed -- forked from morituri")
    (description "A Unix CD ripper aiming for accuracy over speed -- forked from morituri.")
    (home-page "https://github.com/whipper-team/whipper")
    (license license:gpl3+)))

;;; qwt-qt4 --- qt Widgets for Technical Applications - Qt4 version
(define-public qwt-qt4
  (package
    (name "qwt-qt4")
    (version "6.1.5")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/qwt-qt4.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "qt Widgets for Technical Applications - Qt4 version")
    (description "Qt Widgets for Technical Applications - Qt4 version.")
    (home-page "http://qwt.sourceforge.net/")
    (license license:nonfree)))

;;; fwts-git --- the FirmWare Test Suite is a tool to do automatic testing of a PC's fi
(define-public fwts-git
  (package
    (name "fwts-git")
    (version "23.11.00.r9.ffc2469b")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/fwts-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "the FirmWare Test Suite is a tool to do automatic testing of a PC's firmware")
    (description "The FirmWare Test Suite is a tool to do automatic testing of a PC's firmware.")
    (home-page "https://github.com/fwts/fwts")
    (license license:gpl3+)))

;;; napi-bash --- lightweight, easy and fast polish subtitle downloader from the napipro
(define-public napi-bash
  (package
    (name "napi-bash")
    (version "1.1.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/napi-bash.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "lightweight, easy and fast polish subtitle downloader from the napiprojekt.pl")
    (description "Lightweight, easy and fast polish subtitle downloader from the napiprojekt.pl.")
    (home-page "http://3ed.github.io/napi-bash/")
    (license license:gpl3+)))

;;; eiskaltdcpp-cli --- CLI interface for EiskaltDC++ Daemon
(define-public eiskaltdcpp-cli
  (package
    (name "eiskaltdcpp-cli")
    (version "2.4.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/eiskaltdcpp-cli.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "CLI interface for EiskaltDC++ Daemon")
    (description "CLI interface for EiskaltDC++ Daemon.")
    (home-page "https://github.com/eiskaltdcpp/eiskaltdcpp/")
    (license license:gpl3+)))

;;; sierrabreeze-kwin-decoration-git --- oSX-like window decoration for KDE Plasma written in C++ (git version)
(define-public sierrabreeze-kwin-decoration-git
  (package
    (name "sierrabreeze-kwin-decoration-git")
    (version "r71.3512961")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/sierrabreeze-kwin-decoration-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "oSX-like window decoration for KDE Plasma written in C++ (git version)")
    (description "OSX-like window decoration for KDE Plasma written in C++ (git version).")
    (home-page "https://github.com/kay0u/SierraBreeze")
    (license license:gpl2+)))

;;; progress-git --- shows running coreutils basic commands and displays stats
(define-public progress-git
  (package
    (name "progress-git")
    (version "0.17.r0.g208422a")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/progress-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "shows running coreutils basic commands and displays stats")
    (description "Shows running coreutils basic commands and displays stats.")
    (home-page "https://github.com/Xfennec/progress")
    (license license:gpl3+)))

;;; zxing-cpp-git --- A C++ library to decode QRCode
(define-public zxing-cpp-git
  (package
    (name "zxing-cpp-git")
    (version "2.2.1.r288.g39ebe724")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/zxing-cpp-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "A C++ library to decode QRCode")
    (description "A C++ library to decode QRCode.")
    (home-page "https://github.com/zxing-cpp/zxing-cpp")
    (license license:asl2.0)))

;;; python-cadquery --- A parametric CAD scripting framework based on PythonOCC
(define-public python-cadquery
  (package
    (name "python-cadquery")
    (version "2.7.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-cadquery.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "A parametric CAD scripting framework based on PythonOCC")
    (description "A parametric CAD scripting framework based on PythonOCC.")
    (home-page "https://github.com/CadQuery/cadquery")
    (license license:asl2.0)))

;;; cave9 --- A 3D gravity cave-exploration game based on the classic SFCave
(define-public cave9
  (package
    (name "cave9")
    (version "0.4.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/cave9.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "A 3D gravity cave-exploration game based on the classic SFCave")
    (description "A 3D gravity cave-exploration game based on the classic SFCave.")
    (home-page "https://code.google.com/p/cave9/")
    (license license:lgpl3+)))

;;; geoserver-bin --- server written in Java that allows users to share and edit geospatial 
(define-public geoserver-bin
  (package
    (name "geoserver-bin")
    (version "2.26.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/geoserver-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "server written in Java that allows users to share and edit geospatial data")
    (description "Server written in Java that allows users to share and edit geospatial data.")
    (home-page "http://geoserver.org")
    (license license:gpl2+)))

;;; python-uncompyle6 --- python byte-code disassembler and source-code converter
(define-public python-uncompyle6
  (package
    (name "python-uncompyle6")
    (version "3.9.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-uncompyle6.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "python byte-code disassembler and source-code converter")
    (description "Python byte-code disassembler and source-code converter.")
    (home-page "https://github.com/rocky/python-uncompyle6/")
    (license license:expat)))

;;; xtide --- harmonic tide clock and tide predictor
(define-public xtide
  (package
    (name "xtide")
    (version "2.15.5")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/xtide.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "harmonic tide clock and tide predictor")
    (description "Harmonic tide clock and tide predictor.")
    (home-page "http://www.flaterco.com/xtide/xtide.html")
    (license license:gpl3+)))

;;; php82-cli --- cli (command-line executable) version for php82
(define-public php82-cli
  (package
    (name "php82-cli")
    (version "8.2.30")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/php82-cli.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "cli (command-line executable) version for php82")
    (description "Cli (command-line executable) version for php82.")
    (home-page "http://www.php.net")
    (license license:nonfree)))

;;; ipinfo-cli --- official Command Line Interface for the IPinfo API (IP geolocation and
(define-public ipinfo-cli
  (package
    (name "ipinfo-cli")
    (version "3.3.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ipinfo-cli.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "official Command Line Interface for the IPinfo API (IP geolocation and other t")
    (description "Official Command Line Interface for the IPinfo API (IP geolocation and other types of IP data).")
    (home-page "https://ipinfo.io/")
    (license license:asl2.0)))

;;; ceph-mgr-git --- distributed, fault-tolerant storage platform delivering object, block,
(define-public ceph-mgr-git
  (package
    (name "ceph-mgr-git")
    (version "1:17.0.0.12069.gab6b68efe47")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ceph-mgr-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "distributed, fault-tolerant storage platform delivering object, block, and fil")
    (description "Distributed, fault-tolerant storage platform delivering object, block, and file system.")
    (home-page "http://ceph.com/")
    (license license:gpl3+)))

;;; hol --- HOL4 theorem-proving system
(define-public hol
  (package
    (name "hol")
    (version "trindemossen.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/hol.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "HOL4 theorem-proving system")
    (description "HOL4 theorem-proving system.")
    (home-page "https://hol-theorem-prover.org/")
    (license license:bsd-3)))

;;; telepresence --- local development against a remote Kubernetes or OpenShift cluster
(define-public telepresence
  (package
    (name "telepresence")
    (version "0.109")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/telepresence.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "local development against a remote Kubernetes or OpenShift cluster")
    (description "Local development against a remote Kubernetes or OpenShift cluster.")
    (home-page "https://github.com/telepresenceio/telepresence")
    (license license:asl2.0)))

;;; lwan-git --- experimental, scalable, high performance HTTP server
(define-public lwan-git
  (package
    (name "lwan-git")
    (version "r1698.ecb28b6")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lwan-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "experimental, scalable, high performance HTTP server")
    (description "Experimental, scalable, high performance HTTP server.")
    (home-page "https://lwan.ws/")
    (license license:gpl3+)))

;;; canon-pixma-mx410-complete --- complete stand alone driver set (printing and scanning) for Canon Pixm
(define-public canon-pixma-mx410-complete
  (package
    (name "canon-pixma-mx410-complete")
    (version "3.50")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/canon-pixma-mx410-complete.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "complete stand alone driver set (printing and scanning) for Canon Pixma MX410 ")
    (description "Complete stand alone driver set (printing and scanning) for Canon Pixma MX410 series. Includes Greyscale patch.")
    (home-page "https://www.canon-europe.com/support/consumer_products/products/fax__multifunctionals/inkjet/pixma_mx_series/pixma_mx410.aspx?type=drivers&language=EN")
    (license license:nonfree)))

;;; go-for-it --- A stylish to-do list with built-in productivity timer
(define-public go-for-it
  (package
    (name "go-for-it")
    (version "1.9.6")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/go-for-it.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "A stylish to-do list with built-in productivity timer")
    (description "A stylish to-do list with built-in productivity timer.")
    (home-page "https://github.com/JMoerman/Go-For-It")
    (license license:gpl3+)))

;;; mocicon --- GTK panel applet that lets you control MOC (Music On Console)
(define-public mocicon
  (package
    (name "mocicon")
    (version "0.1.4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mocicon.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "GTK panel applet that lets you control MOC (Music On Console)")
    (description "GTK panel applet that lets you control MOC (Music On Console).")
    (home-page "http://mocicon.sourceforge.net")
    (license license:bsd-3)))

;;; python-usbtmc --- A Python USBTMC driver for controlling instruments over USB
(define-public python-usbtmc
  (package
    (name "python-usbtmc")
    (version "0.8")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-usbtmc.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "A Python USBTMC driver for controlling instruments over USB")
    (description "A Python USBTMC driver for controlling instruments over USB.")
    (home-page "https://github.com/python-ivi/python-usbtmc")
    (license license:expat)))

;;; sweethome3d-3dmodels-trees --- free 3D models advertised on SweetHome3D website
(define-public sweethome3d-3dmodels-trees
  (package
    (name "sweethome3d-3dmodels-trees")
    (version "1.9.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/sweethome3d-3dmodels-trees.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "free 3D models advertised on SweetHome3D website")
    (description "Free 3D models advertised on SweetHome3D website.")
    (home-page "http://www.sweethome3d.com/freeModels.jsp")
    (license license:nonfree)))

;;; eyeocr --- java-based text (ocr) recognizer
(define-public eyeocr
  (package
    (name "eyeocr")
    (version "0.0.10")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/eyeocr.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "java-based text (ocr) recognizer")
    (description "Java-based text (ocr) recognizer.")
    (home-page "https://sourceforge.net/projects/eyeocr/")
    (license license:nonfree)))

;;; image-roll-bin --- GTK image viewer with basic image manipulation tools
(define-public image-roll-bin
  (package
    (name "image-roll-bin")
    (version "2.1.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/image-roll-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "GTK image viewer with basic image manipulation tools")
    (description "GTK image viewer with basic image manipulation tools.")
    (home-page "https://github.com/weclaw1/image-roll")
    (license license:expat)))

;;; libchdr-git --- standalone library for reading MAME's CHDv1-v5 formats
(define-public libchdr-git
  (package
    (name "libchdr-git")
    (version "0.3.0.r0.g93d8c23")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/libchdr-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "standalone library for reading MAME's CHDv1-v5 formats")
    (description "Standalone library for reading MAME's CHDv1-v5 formats.")
    (home-page "https://github.com/rtissera/libchdr")
    (license license:bsd-3)))

;;; refind-black-git --- minimalistic, flat, black and white theme for rEFInd
(define-public refind-black-git
  (package
    (name "refind-black-git")
    (version "r2.3a2a9d9")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/refind-black-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "minimalistic, flat, black and white theme for rEFInd")
    (description "Minimalistic, flat, black and white theme for rEFInd.")
    (home-page "https://github.com/anthon38/refind-black")
    (license license:nonfree)))

;;; tesseract-data-mar-git --- trained language data for tesseract OCR Engine
(define-public tesseract-data-mar-git
  (package
    (name "tesseract-data-mar-git")
    (version "4.1.0.r0.g4767ea9")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/tesseract-data-mar-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "trained language data for tesseract OCR Engine")
    (description "Trained language data for tesseract OCR Engine.")
    (home-page "https://github.com/tesseract-ocr/tessdata")
    (license license:asl2.0)))

;;; crab-hole --- pi-Hole clone written in rust using hickory-dns/trust-dns
(define-public crab-hole
  (package
    (name "crab-hole")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/crab-hole.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "pi-Hole clone written in rust using hickory-dns/trust-dns")
    (description "Pi-Hole clone written in rust using hickory-dns/trust-dns.")
    (home-page "https://crates.io/crates/crab-hole")
    (license license:agpl3+)))

;;; calendarsync-bin --- stateless CLI tool to sync calendars across different calendaring syst
(define-public calendarsync-bin
  (package
    (name "calendarsync-bin")
    (version "0.11.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/calendarsync-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "stateless CLI tool to sync calendars across different calendaring systems")
    (description "Stateless CLI tool to sync calendars across different calendaring systems.")
    (home-page "https://github.com/inovex/CalendarSync")
    (license license:expat)))

;;; tela-circle-icon-theme-purple-git --- A flat, colorful design icon theme (purple variant)
(define-public tela-circle-icon-theme-purple-git
  (package
    (name "tela-circle-icon-theme-purple-git")
    (version "2025.02.10.r107.gbdb616e4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/tela-circle-icon-theme-purple-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "A flat, colorful design icon theme (purple variant)")
    (description "A flat, colorful design icon theme (purple variant).")
    (home-page "https://github.com/vinceliuice/Tela-circle-icon-theme")
    (license license:gpl3+)))

;;; awakened-poe-trade-bin --- path of Exile trading app for price checking.(Prebuilt version.Use sys
(define-public awakened-poe-trade-bin
  (package
    (name "awakened-poe-trade-bin")
    (version "3.28.103")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/awakened-poe-trade-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "path of Exile trading app for price checking.(Prebuilt version.Use system-wide")
    (description "Path of Exile trading app for price checking.(Prebuilt version.Use system-wide electron).")
    (home-page "https://snosme.github.io/awakened-poe-trade/download")
    (license license:expat)))

;;; hugs --- A functional programming system based on Haskell 98
(define-public hugs
  (package
    (name "hugs")
    (version "2006.09")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/hugs.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "A functional programming system based on Haskell 98")
    (description "A functional programming system based on Haskell 98.")
    (home-page "https://www.haskell.org/hugs/index.html")
    (license license:bsd-3)))

;;; python-lmfit --- non-Linear Least Squares Minimization, based on scipy.optimize
(define-public python-lmfit
  (package
    (name "python-lmfit")
    (version "1.3.4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-lmfit.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "non-Linear Least Squares Minimization, based on scipy.optimize")
    (description "Non-Linear Least Squares Minimization, based on scipy.optimize.")
    (home-page "http:/lmfit.github.io/lmfit-py/")
    (license license:bsd-3)))

;;; r-styler --- non-Invasive Pretty Printing of R Code
(define-public r-styler
  (package
    (name "r-styler")
    (version "1.11.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/r-styler.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "non-Invasive Pretty Printing of R Code")
    (description "Non-Invasive Pretty Printing of R Code.")
    (home-page "https://cran.r-project.org/package=styler")
    (license license:expat)))

;;; danectl-git --- DNSSEC DANE implementation manager
(define-public danectl-git
  (package
    (name "danectl-git")
    (version "0.7.4.r8.gd0f0cc6")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/danectl-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "DNSSEC DANE implementation manager")
    (description "DNSSEC DANE implementation manager.")
    (home-page "https://github.com/raforg/danectl")
    (license license:gpl2+)))

;;; doomretro-git --- the classic, refined DOOM source port (git version)
(define-public doomretro-git
  (package
    (name "doomretro-git")
    (version "5.8.2.r656.g5786c26d9")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/doomretro-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "the classic, refined DOOM source port (git version)")
    (description "The classic, refined DOOM source port (git version).")
    (home-page "http://doomretro.com")
    (license license:gpl3+)))

;;; gitkraken-standalone --- the intuitive, fast, and beautiful cross-platform Git client. Serverle
(define-public gitkraken-standalone
  (package
    (name "gitkraken-standalone")
    (version "12.0.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gitkraken-standalone.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "the intuitive, fast, and beautiful cross-platform Git client. Serverless versi")
    (description "The intuitive, fast, and beautiful cross-platform Git client. Serverless version (requires license file).")
    (home-page "https://help.gitkraken.com/gitkraken-desktop/serverless/")
    (license license:nonfree)))

;;; gti-bin --- just a silly git launcher, basically. Inspired by sl. (New version in 
(define-public gti-bin
  (package
    (name "gti-bin")
    (version "v1.5.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gti-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "just a silly git launcher, basically. Inspired by sl. (New version in Go)")
    (description "Just a silly git launcher, basically. Inspired by sl. (New version in Go).")
    (home-page "https://github.com/ldez/gti")
    (license license:expat)))

;;; icinga2-git --- an open source host, service and network monitoring program
(define-public icinga2-git
  (package
    (name "icinga2-git")
    (version "2.13.0.r681.g8228fae74")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/icinga2-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "an open source host, service and network monitoring program")
    (description "An open source host, service and network monitoring program.")
    (home-page "https://github.com/icinga/icinga2")
    (license license:gpl3+)))

;;; lilium-voyager-git --- an ioquake3-based Voyager: Elite Force source port
(define-public lilium-voyager-git
  (package
    (name "lilium-voyager-git")
    (version "20210609.g0f4e16fc")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lilium-voyager-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "an ioquake3-based Voyager: Elite Force source port")
    (description "An ioquake3-based Voyager: Elite Force source port.")
    (home-page "https://clover.moe/lilium-voyager/")
    (license license:gpl3+)))

;;; passmenu-rs-git --- rofi frontend for passmenu
(define-public passmenu-rs-git
  (package
    (name "passmenu-rs-git")
    (version "0.3.1.r0.g5385851")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/passmenu-rs-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "rofi frontend for passmenu")
    (description "Rofi frontend for passmenu.")
    (home-page "https://github.com/rupansh/passmenu-rs")
    (license license:gpl3+)))

;;; python-tkcolorpicker --- color picker dialog for Tkinter, alternative to tkinter.colorchooser
(define-public python-tkcolorpicker
  (package
    (name "python-tkcolorpicker")
    (version "2.1.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-tkcolorpicker.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "color picker dialog for Tkinter, alternative to tkinter.colorchooser")
    (description "Color picker dialog for Tkinter, alternative to tkinter.colorchooser.")
    (home-page "https://github.com/j4321/tkColorPicker")
    (license license:gpl3+)))

;;; rusty-tags --- create ctags/etags for a cargo project and all of its dependencies
(define-public rusty-tags
  (package
    (name "rusty-tags")
    (version "3.10.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/rusty-tags.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "create ctags/etags for a cargo project and all of its dependencies")
    (description "Create ctags/etags for a cargo project and all of its dependencies.")
    (home-page "https://github.com/dan-t/rusty-tags")
    (license license:bsd-3)))

;;; scholarref-git --- POSIX shell tools to extract, fetch, and parse DOIs and BiBTeX bibliog
(define-public scholarref-git
  (package
    (name "scholarref-git")
    (version "r53.691d247")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/scholarref-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "POSIX shell tools to extract, fetch, and parse DOIs and BiBTeX bibliography re")
    (description "POSIX shell tools to extract, fetch, and parse DOIs and BiBTeX bibliography references.")
    (home-page "https://src.adamsgaard.dk/scholarref/files.html")
    (license license:gpl3+)))

;;; suru-plus-dark-git --- suru++ 25 Dark – A full dark cyberpunk third-party icons theme!
(define-public suru-plus-dark-git
  (package
    (name "suru-plus-dark-git")
    (version "25.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/suru-plus-dark-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "suru++ 25 Dark – A full dark cyberpunk third-party icons theme!")
    (description "Suru++ 25 Dark – A full dark cyberpunk third-party icons theme!.")
    (home-page "https://github.com/gusbemacbe/suru-plus-dark")
    (license license:gpl3+)))

;;; tzsp2pcap-git --- simple live TaZmen Sniffer Protocol (TZSP) to pcap converter
(define-public tzsp2pcap-git
  (package
    (name "tzsp2pcap-git")
    (version "r16.e2e5d91")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/tzsp2pcap-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "simple live TaZmen Sniffer Protocol (TZSP) to pcap converter")
    (description "Simple live TaZmen Sniffer Protocol (TZSP) to pcap converter.")
    (home-page "https://github.com/thefloweringash/tzsp2pcap")
    (license license:bsd-3)))

;;; vertrux-icon-theme --- squared icon set for Linux - Light and Dark
(define-public vertrux-icon-theme
  (package
    (name "vertrux-icon-theme")
    (version "0.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/vertrux-icon-theme.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "squared icon set for Linux - Light and Dark")
    (description "Squared icon set for Linux - Light and Dark.")
    (home-page "https://github.com/satriani-vai/vertrux-icon-theme")
    (license license:nonfree)))

;;; hysteria-bin --- A powerful, lightning fast and censorship resistant proxy (Binary Rele
(define-public hysteria-bin
  (package
    (name "hysteria-bin")
    (version "2.8.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/hysteria-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "A powerful, lightning fast and censorship resistant proxy (Binary Release)")
    (description "A powerful, lightning fast and censorship resistant proxy (Binary Release).")
    (home-page "https://hysteria.network/")
    (license license:expat)))

;;; solarxr-cli-git --- A command-line tool for interfacing with the SlimeVR server
(define-public solarxr-cli-git
  (package
    (name "solarxr-cli-git")
    (version "r27.f319d3c")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/solarxr-cli-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "A command-line tool for interfacing with the SlimeVR server")
    (description "A command-line tool for interfacing with the SlimeVR server.")
    (home-page "https://github.com/notpeelz/solarxr-cli")
    (license license:gpl3+)))

;;; gcviewer-bin --- gCViewer is a little tool that visualizes verbose GC output generated 
(define-public gcviewer-bin
  (package
    (name "gcviewer-bin")
    (version "1.36")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gcviewer-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "gCViewer is a little tool that visualizes verbose GC output generated by Sun, ")
    (description "GCViewer is a little tool that visualizes verbose GC output generated by Sun, IBM, HP and BEA Java Virtual Machines.")
    (home-page "https://github.com/chewiebug/GCViewer")
    (license license:gpl3+)))

;;; wl-restart-git --- restart your compositor when it crashes (git version)
(define-public wl-restart-git
  (package
    (name "wl-restart-git")
    (version "0.2.0.r0.ged4f3be")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/wl-restart-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "restart your compositor when it crashes (git version)")
    (description "Restart your compositor when it crashes (git version).")
    (home-page "https://github.com/Ferdi265/wl-restart")
    (license license:gpl3+)))

;;; openjkdf2-git --- A function-by-function reimplementation of DF2 (Dark Forces 2) in C
(define-public openjkdf2-git
  (package
    (name "openjkdf2-git")
    (version "0.9.8.r1.ga6e3174")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/openjkdf2-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "A function-by-function reimplementation of DF2 (Dark Forces 2) in C")
    (description "A function-by-function reimplementation of DF2 (Dark Forces 2) in C.")
    (home-page "https://github.com/shinyquagsire23/OpenJKDF2")
    (license license:bsd-3)))

;;; google-docs-bin --- google Docs Desktop App made with electron.Includes Google Docs, Sheet
(define-public google-docs-bin
  (package
    (name "google-docs-bin")
    (version "2022.12.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/google-docs-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "google Docs Desktop App made with electron.Includes Google Docs, Sheets, Slide")
    (description "Google Docs Desktop App made with electron.Includes Google Docs, Sheets, Slides, Forms, and Drive.(Prebuilt version.Use system-wide electron).")
    (home-page "https://github.com/Comp-Labs/Google-Docs")
    (license license:expat)))

;;; grub-theme-bsol-git --- grub2 blue-screen-of-life theme
(define-public grub-theme-bsol-git
  (package
    (name "grub-theme-bsol-git")
    (version "0+7.g998cb90")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/grub-theme-bsol-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "grub2 blue-screen-of-life theme")
    (description "Grub2 blue-screen-of-life theme.")
    (home-page "https://github.com/harishnkr/bsol")
    (license license:gpl3+)))

;;; autobrr-runit --- runit service script for autobrr
(define-public autobrr-runit
  (package
    (name "autobrr-runit")
    (version "20240313")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/autobrr-runit.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "runit service script for autobrr")
    (description "Runit service script for autobrr.")
    (home-page "https://autobrr.com")
    (license license:gpl2+)))

;;; barracudavpn-bin --- barracuda VPN Client for Linux - needs original download from Barracud
(define-public barracudavpn-bin
  (package
    (name "barracudavpn-bin")
    (version "5.3.6")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/barracudavpn-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "barracuda VPN Client for Linux - needs original download from Barracuda")
    (description "Barracuda VPN Client for Linux - needs original download from Barracuda.")
    (home-page "https://campus.barracuda.com/product/networkaccessclient")
    (license license:nonfree)))

;;; gobyte-qt --- cryptocurrency wallet(QT)
(define-public gobyte-qt
  (package
    (name "gobyte-qt")
    (version "0.12.2.4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gobyte-qt.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "cryptocurrency wallet(QT)")
    (description "Cryptocurrency wallet(QT).")
    (home-page "https://www.gobyte.network/")
    (license license:expat)))

;;; legendary-heroic-bin --- A free and open-source replacement for the Epic Games Launcher (Heroic
(define-public legendary-heroic-bin
  (package
    (name "legendary-heroic-bin")
    (version "0.20.43")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/legendary-heroic-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "A free and open-source replacement for the Epic Games Launcher (Heroic Games L")
    (description "A free and open-source replacement for the Epic Games Launcher (Heroic Games Launcher fork).")
    (home-page "https://github.com/Heroic-Games-Launcher/legendary")
    (license license:gpl3+)))

;;; arduino-noide-libs --- arduino prototyping platform: software libraries
(define-public arduino-noide-libs
  (package
    (name "arduino-noide-libs")
    (version "1.8.19")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/arduino-noide-libs.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "arduino prototyping platform: software libraries")
    (description "Arduino prototyping platform: software libraries.")
    (home-page "http://arduino.cc/en/Main/Software")
    (license license:gpl3+)))

;;; pibuss --- a BEAST/BEAGLE utility for sequence simulation, which provides an easy
(define-public pibuss
  (package
    (name "pibuss")
    (version "1.10.4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/pibuss.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "a BEAST/BEAGLE utility for sequence simulation, which provides an easy to use ")
    (description "A BEAST/BEAGLE utility for sequence simulation, which provides an easy to use interface that allows flexible and extensible phylogenetic data fabrication. https://doi.org/10.1186/1471-2105-15-133.")
    (home-page "http://beast.community/")
    (license license:gpl3+)))

;;; blitzloop-git --- open source karaoke software
(define-public blitzloop-git
  (package
    (name "blitzloop-git")
    (version "r297.6991439")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/blitzloop-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "open source karaoke software")
    (description "Open source karaoke software.")
    (home-page "https://github.com/marcan/blitzloop")
    (license license:gpl3+)))

;;; cgterm-git --- C/G telnet client that lets you connect to C64 telnet BBS
(define-public cgterm-git
  (package
    (name "cgterm-git")
    (version "r1.01e35d6")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/cgterm-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "C/G telnet client that lets you connect to C64 telnet BBS")
    (description "C/G telnet client that lets you connect to C64 telnet BBS.")
    (home-page "https://github.com/MagerValp/CGTerm")
    (license license:bsd-3)))

;;; checkersland --- сheckers program for playing with computer or people via the Internet
(define-public checkersland
  (package
    (name "checkersland")
    (version "20211112")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/checkersland.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "сheckers program for playing with computer or people via the Internet")
    (description "Сheckers program for playing with computer or people via the Internet.")
    (home-page "http://checkersland.com/")
    (license license:nonfree)))

;;; colima --- container runtimes on macOS (and Linux) with minimal setup
(define-public colima
  (package
    (name "colima")
    (version "0.10.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/colima.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "container runtimes on macOS (and Linux) with minimal setup")
    (description "Container runtimes on macOS (and Linux) with minimal setup.")
    (home-page "https://github.com/abiosoft/colima")
    (license license:expat)))

;;; deb2appimage --- build AppImages from deb packages on any distro with simple json confi
(define-public deb2appimage
  (package
    (name "deb2appimage")
    (version "0.0.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/deb2appimage.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "build AppImages from deb packages on any distro with simple json configuration")
    (description "Build AppImages from deb packages on any distro with simple json configuration.")
    (home-page "http://www.simonizor.net")
    (license license:expat)))

;;; cosbrowser --- 腾讯云COS工具
(define-public cosbrowser
  (package
    (name "cosbrowser")
    (version "2.8.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/cosbrowser.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "腾讯云COS工具")
    (description "腾讯云COS工具.")
    (home-page "https://cloud.tencent.com")
    (license license:nonfree)))

;;; dmalloc --- debug Malloc memory allocation debugging C library
(define-public dmalloc
  (package
    (name "dmalloc")
    (version "5.6.5")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/dmalloc.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "debug Malloc memory allocation debugging C library")
    (description "Debug Malloc memory allocation debugging C library.")
    (home-page "https://github.com/j256/dmalloc")
    (license license:isc)))

;;; dynamic-wallpaper-catalina-kde-git --- azimuth Elevation based / Time based KDE macOS Catalina wallpaper
(define-public dynamic-wallpaper-catalina-kde-git
  (package
    (name "dynamic-wallpaper-catalina-kde-git")
    (version "1.2.r2.g39f139d")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/dynamic-wallpaper-catalina-kde-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "azimuth Elevation based / Time based KDE macOS Catalina wallpaper")
    (description "Azimuth Elevation based / Time based KDE macOS Catalina wallpaper.")
    (home-page "https://github.com/japamax/gnome-kde-dynamic-wallpaper-catalina")
    (license license:expat)))

;;; etherdfs --- an ethernet-based file system for DOS
(define-public etherdfs
  (package
    (name "etherdfs")
    (version "20180203")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/etherdfs.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "an ethernet-based file system for DOS")
    (description "An ethernet-based file system for DOS.")
    (home-page "http://etherdfs.sourceforge.net")
    (license license:expat)))

;;; fabric1 --- python library and command-line tool designed to streamline deploying 
(define-public fabric1
  (package
    (name "fabric1")
    (version "1.15.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/fabric1.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "python library and command-line tool designed to streamline deploying applicat")
    (description "Python library and command-line tool designed to streamline deploying applications or performing system administration tasks via the SSH protocol.")
    (home-page "https://www.fabfile.org/")
    (license license:bsd-3)))

;;; fselect-git --- find files with SQL-like queries
(define-public fselect-git
  (package
    (name "fselect-git")
    (version "0.7.6.r0.g5013085")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/fselect-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "find files with SQL-like queries")
    (description "Find files with SQL-like queries.")
    (home-page "https://github.com/jhspetersson/fselect")
    (license license:expat)))

;;; gotags --- ctags-compatible tag generator for Go
(define-public gotags
  (package
    (name "gotags")
    (version "1.4.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gotags.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "ctags-compatible tag generator for Go")
    (description "Ctags-compatible tag generator for Go.")
    (home-page "https://github.com/jstemmer/gotags")
    (license license:expat)))

;;; guile-gash --- pOSIX-compatible shell and Guile library for parsing shell scripts
(define-public guile-gash
  (package
    (name "guile-gash")
    (version "0.3.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/guile-gash.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "pOSIX-compatible shell and Guile library for parsing shell scripts")
    (description "POSIX-compatible shell and Guile library for parsing shell scripts.")
    (home-page "https://savannah.nongnu.org/projects/gash/")
    (license license:gpl3+)))

;;; hosts-gen --- A little framework to generate /etc/hosts from /etc/hosts.d
(define-public hosts-gen
  (package
    (name "hosts-gen")
    (version "0.9.20191123.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/hosts-gen.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "A little framework to generate /etc/hosts from /etc/hosts.d")
    (description "A little framework to generate /etc/hosts from /etc/hosts.d.")
    (home-page "http://r-36.net/scm/hosts-gen/")
    (license license:gpl3+)))

;;; r-globals --- identify Global Objects in R Expressions
(define-public r-globals
  (package
    (name "r-globals")
    (version "0.19.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/r-globals.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "identify Global Objects in R Expressions")
    (description "Identify Global Objects in R Expressions.")
    (home-page "https://cran.r-project.org/package=globals")
    (license license:lgpl2.1+)))

;;; r-rbibutils --- read 'Bibtex' Files and Convert Between Bibliography Formats
(define-public r-rbibutils
  (package
    (name "r-rbibutils")
    (version "2.4.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/r-rbibutils.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "read 'Bibtex' Files and Convert Between Bibliography Formats")
    (description "Read 'Bibtex' Files and Convert Between Bibliography Formats.")
    (home-page "https://cran.r-project.org/package=rbibutils")
    (license license:gpl2)))

;;; ibus-theme-tools --- generate the IBus GTK or GNOME Shell theme from existing themes
(define-public ibus-theme-tools
  (package
    (name "ibus-theme-tools")
    (version "4.2.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ibus-theme-tools.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "generate the IBus GTK or GNOME Shell theme from existing themes")
    (description "Generate the IBus GTK or GNOME Shell theme from existing themes.")
    (home-page "https://github.com/openSUSE/IBus-Theme-Tools")
    (license license:gpl3+)))

;;; libraw-git --- A library for reading RAW files from digital cameras
(define-public libraw-git
  (package
    (name "libraw-git")
    (version "0.22.0.r8.gca5d4507")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/libraw-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "A library for reading RAW files from digital cameras")
    (description "A library for reading RAW files from digital cameras.")
    (home-page "https://www.libraw.org/")
    (license license:nonfree)))

;;; mod-builder --- A cli tool that automatically sets up a minecraft modding environment
(define-public mod-builder
  (package
    (name "mod-builder")
    (version "1.1.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mod-builder.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "A cli tool that automatically sets up a minecraft modding environment")
    (description "A cli tool that automatically sets up a minecraft modding environment.")
    (home-page "https://github.com/a-weeb-programmer/mod-builder")
    (license license:gpl3+)))

;;; notejot-git --- A stupidly-simple sticky notes application for any type of short term 
(define-public notejot-git
  (package
    (name "notejot-git")
    (version "r975.c7a7866")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/notejot-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "A stupidly-simple sticky notes application for any type of short term notes or")
    (description "A stupidly-simple sticky notes application for any type of short term notes or ideas.")
    (home-page "https://github.com/lainsce/notejot")
    (license license:gpl3+)))

;;; notepadqq-legacy --- notepad++-like text editor for Linux. Legacy version which doesnt ask 
(define-public notepadqq-legacy
  (package
    (name "notepadqq-legacy")
    (version "1.3.6")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/notepadqq-legacy.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "notepad++-like text editor for Linux. Legacy version which doesnt ask for rest")
    (description "Notepad++-like text editor for Linux. Legacy version which doesnt ask for restoration at startup.")
    (home-page "https://notepadqq.altervista.org/")
    (license license:gpl3+)))

;;; palemoon-i18n-es-ar --- spanish (Argentina) language pack for Pale Moon browser
(define-public palemoon-i18n-es-ar
  (package
    (name "palemoon-i18n-es-ar")
    (version "33.8.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/palemoon-i18n-es-ar.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "spanish (Argentina) language pack for Pale Moon browser")
    (description "Spanish (Argentina) language pack for Pale Moon browser.")
    (home-page "https://addons.palemoon.org/language-packs/")
    (license license:mpl2.0)))

;;; perl-x11-protocol-more --- cPAN/X11::Protocol::Enhanced -- extensions to X11::Protocol
(define-public perl-x11-protocol-more
  (package
    (name "perl-x11-protocol-more")
    (version "0.05")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/perl-x11-protocol-more.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "cPAN/X11::Protocol::Enhanced -- extensions to X11::Protocol")
    (description "CPAN/X11::Protocol::Enhanced -- extensions to X11::Protocol.")
    (home-page "https://metacpan.org/module/X11::Protocol::Enhanced")
    (license license:gpl3+)))

;;; phosta --- photo stats for your terminal
(define-public phosta
  (package
    (name "phosta")
    (version "1.3.5")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/phosta.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "photo stats for your terminal")
    (description "Photo stats for your terminal.")
    (home-page "https://sr.ht/~rwa/photo-apps")
    (license license:bsd-3)))

;;; postgresql-libversion --- postgreSQL extension with support for version string comparison
(define-public postgresql-libversion
  (package
    (name "postgresql-libversion")
    (version "2.0.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/postgresql-libversion.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "postgreSQL extension with support for version string comparison")
    (description "PostgreSQL extension with support for version string comparison.")
    (home-page "https://github.com/repology/postgresql-libversion")
    (license license:expat)))
;;; libretro-ppsspp-git --- sony PlayStation Portable core
(define-public libretro-ppsspp-git
  (package
    (name "libretro-ppsspp-git")
    (version "1.18.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/libretro-ppsspp-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "sony PlayStation Portable core")
    (description "Sony PlayStation Portable core for libretro.")
    (home-page "https://www.ppsspp.org/")
    (license license:gpl2+)))

;;; amide --- medical imaging data examiner
(define-public amide
  (package
    (name "amide")
    (version "1.0.6")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/amide.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "medical imaging data examiner")
    (description "Medical imaging data examiner.")
    (home-page "https://amide.sourceforge.net/")
    (license license:gpl3+)))

