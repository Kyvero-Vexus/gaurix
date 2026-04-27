;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260427j
;;; Resolves 100 packages from queue (100 recipes, 0 blocked).
;;;
;;; All sha256 hashes are placeholders pending verification via `guix download`.

(define-module (gaurix packages recipe-resolver-260427j)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:export (
            libxnvctrl-470xx
            python-linux-gpib
            mingw-w64-quazip-qt6
            mingw-w64-quazip-qt5
            mingw-w64-curl
            i686-elf-gcc
            i686-elf-binutils
            bin32-jre
            woff2-suit-variable
            woff2-suit
            shadowsocks-go-geolite2-country-git
            gnu-slash-grub-git
            arm-linux-gnueabihf-gcc
            qt5-quicktimeline
            qt5-webglplugin
            qt5-lottie
            rlr-git
            uget-integrator-opera
            uget-integrator-libreworlf
            uget-integrator-firefox
            uget-integrator-chromium
            uget-integrator-chrome
            modelsim-intel-starter
            youplay-qt6
            youplay-pyqt6
            youplay-gtk4
            youplay-gtk3
            wacom-settings-git
            psource-git
            kpeoplevcard-git
            dbeaver-ue
            xdroid
            rstmcpp-git
            python-pyqcc
            python-bbpb-git
            lsvkdev-bin
            kame-tools-git
            isextract-git
            importenv-bin
            gotepad-bin
            goskyr
            electron17-bin
            eldev-git
            ebookinfo
            dora-ssr
            devtools-loong64
            cvm
            cro-mag-rally-net
            cloudip
            buchable-bin
            bsky-desktop
            awtfdb
            aqua-bin
            aces-container
            acast-bin
            acdcontrol-git
            xdg-desktop-portal-cosmic-git
            run-reduce-deb
            libfprint-2-tod1-elan
            csbooks-bin
            copybara-git
            spideroak-one
            st-community-git
            mtplayer
            msty-bin
            libpdfium-nojs
            gnome-pomodoro-git
            readarr-develop
            art-rawconverter-bin
            nuitka
            octave-symbolic
            creality-print-appimage
            spotify-edge
            timekpr-next
            read-cat-insiders
            angryoxide
            thelounge
            codon-bin
            liteloader-qqnt-mspring-theme-bin
            liteloader-qqnt-lite-tools-bin
            nocodb-bin
            private-internet-access-vpn
            gameshell
            fcitx5-sogou
            liteloader-qqnt-markdown-bin
            liblast-bin
            pop-sound-theme-git
            cpp-taskflow
            betterbird-it-bin
            liteloader-qqnt-markdown-git
            liteloader-qqnt-chii-devtools-bin
            hsh
            mssql-server-fts
            mpd-discord-rpc-git
            logitechmediaserver-bin
            carapace-bridge-bin
            savage2
            etqw
            ut2004-steam
            rhythmbox-plugin-alternative-toolbar
            ))

;;; Nonfree/proprietary license placeholder for Gaurix channel
(define license:nonfree
  ((@@ (guix licenses) license) "Nonfree"
    "https://spdx.org/licenses/"
    "Proprietary or custom license; see upstream for terms."))

;;; libxnvctrl-470xx --- NVIDIA NV-CONTROL X extension
(define-public libxnvctrl-470xx
  (package
    (name "libxnvctrl-470xx")
    (version "470.256.02")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/libxnvctrl-470xx.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "NVIDIA NV-CONTROL X extension")
    (description "NVIDIA NV-CONTROL X extension.")
    (home-page "https://github.com/NVIDIA/nvidia-settings")
    (license license:gpl2)))

;;; python-linux-gpib --- A support package for GPIB (IEEE 488) hardware - Python 3 bindings
(define-public python-linux-gpib
  (package
    (name "python-linux-gpib")
    (version "4.3.7")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-linux-gpib.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "A support package for GPIB (IEEE 488) hardware - Python 3 bindings")
    (description "A support package for GPIB (IEEE 488) hardware - Python 3 bindings.")
    (home-page "http://linux-gpib.sourceforge.net/")
    (license license:gpl3+)))

;;; mingw-w64-quazip-qt6 --- C++ wrapper for the ZIP/UNZIP C package, Qt6 version (mingw-w64)
(define-public mingw-w64-quazip-qt6
  (package
    (name "mingw-w64-quazip-qt6")
    (version "1.4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mingw-w64-quazip-qt6.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "C++ wrapper for the ZIP/UNZIP C package, Qt6 version (mingw-w64)")
    (description "C++ wrapper for the ZIP/UNZIP C package, Qt6 version (mingw-w64).")
    (home-page "https://stachenov.github.io/quazip/")
    (license license:lgpl3+)))

;;; mingw-w64-quazip-qt5 --- C++ wrapper for the ZIP/UNZIP C package, Qt5 version (mingw-w64)
(define-public mingw-w64-quazip-qt5
  (package
    (name "mingw-w64-quazip-qt5")
    (version "1.4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mingw-w64-quazip-qt5.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "C++ wrapper for the ZIP/UNZIP C package, Qt5 version (mingw-w64)")
    (description "C++ wrapper for the ZIP/UNZIP C package, Qt5 version (mingw-w64).")
    (home-page "https://stachenov.github.io/quazip/")
    (license license:lgpl3+)))

;;; mingw-w64-curl --- an URL retrival utility and library (mingw-w64)
(define-public mingw-w64-curl
  (package
    (name "mingw-w64-curl")
    (version "8.11.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mingw-w64-curl.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "an URL retrival utility and library (mingw-w64)")
    (description "An URL retrival utility and library (mingw-w64).")
    (home-page "https://curl.haxx.se")
    (license license:expat)))

;;; i686-elf-gcc --- GNU gcc for the i686 toolchain
(define-public i686-elf-gcc
  (package
    (name "i686-elf-gcc")
    (version "15.2.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/i686-elf-gcc.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "GNU gcc for the i686 toolchain")
    (description "GNU gcc for the i686 toolchain.")
    (home-page "https://www.gnu.org/software/gcc")
    (license license:gpl3+)))

;;; i686-elf-binutils --- A set of programs to assemble and manipulate binary and object files f
(define-public i686-elf-binutils
  (package
    (name "i686-elf-binutils")
    (version "2.45")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/i686-elf-binutils.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "A set of programs to assemble and manipulate binary and object files for ")
    (description "A set of programs to assemble and manipulate binary and object files for the i686-elf target.")
    (home-page "https://www.gnu.org/software/binutils/")
    (license license:gpl3+)))

;;; bin32-jre --- Oracle Java 8 Runtime Enviroment (32-bit) with desktop integration (GU
(define-public bin32-jre
  (package
    (name "bin32-jre")
    (version "8.u333")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/bin32-jre.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "Oracle Java 8 Runtime Enviroment (32-bit) with desktop integration (GUI, ")
    (description "Oracle Java 8 Runtime Enviroment (32-bit) with desktop integration (GUI, sound).")
    (home-page "https://www.java.com/en/download/linux_manual.jsp")
    (license license:nonfree)))

;;; woff2-suit-variable --- A Korean UI body typeface focused on clarity
(define-public woff2-suit-variable
  (package
    (name "woff2-suit-variable")
    (version "2.0.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/woff2-suit-variable.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "A Korean UI body typeface focused on clarity")
    (description "A Korean UI body typeface focused on clarity.")
    (home-page "https://github.com/sunn-us/SUIT")
    (license license:silofl1.1)))

;;; woff2-suit --- A Korean UI body typeface focused on clarity
(define-public woff2-suit
  (package
    (name "woff2-suit")
    (version "2.0.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/woff2-suit.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "A Korean UI body typeface focused on clarity")
    (description "A Korean UI body typeface focused on clarity.")
    (home-page "https://github.com/sunn-us/SUIT")
    (license license:silofl1.1)))

;;; shadowsocks-go-geolite2-country-git --- MaxMind GeoLite2 country database for shadowsocks-go
(define-public shadowsocks-go-geolite2-country-git
  (package
    (name "shadowsocks-go-geolite2-country-git")
    (version "20220912012541")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/shadowsocks-go-geolite2-country-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "MaxMind GeoLite2 country database for shadowsocks-go")
    (description "MaxMind GeoLite2 country database for shadowsocks-go.")
    (home-page "https://github.com/Dreamacro/maxmind-geoip")
    (license license:nonfree)))

;;; gnu-slash-grub-git --- fix GRUB boot menu nonsense
(define-public gnu-slash-grub-git
  (package
    (name "gnu-slash-grub-git")
    (version "1.2.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gnu-slash-grub-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "fix GRUB boot menu nonsense")
    (description "Fix GRUB boot menu nonsense.")
    (home-page "https://codeberg.org/midnightmaniac/gnu-slash-grub")
    (license license:gpl3)))

;;; arm-linux-gnueabihf-gcc --- the GNU Compiler Collection
(define-public arm-linux-gnueabihf-gcc
  (package
    (name "arm-linux-gnueabihf-gcc")
    (version "15.2.1+r19+g76aeacb436df")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/arm-linux-gnueabihf-gcc.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "the GNU Compiler Collection")
    (description "The GNU Compiler Collection.")
    (home-page "https://gcc.gnu.org")
    (license license:nonfree)))

;;; qt5-quicktimeline --- Qt module for keyframe-based timeline construction
(define-public qt5-quicktimeline
  (package
    (name "qt5-quicktimeline")
    (version "5.15.18")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/qt5-quicktimeline.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "Qt module for keyframe-based timeline construction")
    (description "Qt module for keyframe-based timeline construction.")
    (home-page "https://www.qt.io")
    (license license:nonfree)))

;;; qt5-webglplugin --- qPA plugin for running an application via a browser using streamed Web
(define-public qt5-webglplugin
  (package
    (name "qt5-webglplugin")
    (version "5.15.15")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/qt5-webglplugin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "qPA plugin for running an application via a browser using streamed WebGL ")
    (description "QPA plugin for running an application via a browser using streamed WebGL commands.")
    (home-page "https://www.qt.io")
    (license license:nonfree)))

;;; qt5-lottie --- A family of player software for a certain json-based file format for d
(define-public qt5-lottie
  (package
    (name "qt5-lottie")
    (version "5.15.18")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/qt5-lottie.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "A family of player software for a certain json-based file format for desc")
    (description "A family of player software for a certain json-based file format for describing 2d vector graphics animations.")
    (home-page "https://www.qt.io")
    (license license:nonfree)))

;;; rlr-git --- interactive pixel screen ruler and protractor
(define-public rlr-git
  (package
    (name "rlr-git")
    (version "r64.7bed0f3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/rlr-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "interactive pixel screen ruler and protractor")
    (description "Interactive pixel screen ruler and protractor.")
    (home-page "https://github.com/epilys/rlr")
    (license license:gpl3+)))

;;; uget-integrator-opera --- configuration to connect Opera with uget-integrator
(define-public uget-integrator-opera
  (package
    (name "uget-integrator-opera")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/uget-integrator-opera.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "configuration to connect Opera with uget-integrator")
    (description "Configuration to connect Opera with uget-integrator.")
    (home-page "https://github.com/ugetdm/uget-integrator")
    (license license:gpl3+)))

;;; uget-integrator-libreworlf --- configuration to connect LibreWolf with uget-integrator
(define-public uget-integrator-libreworlf
  (package
    (name "uget-integrator-libreworlf")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/uget-integrator-libreworlf.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "configuration to connect LibreWolf with uget-integrator")
    (description "Configuration to connect LibreWolf with uget-integrator.")
    (home-page "https://github.com/ugetdm/uget-integrator")
    (license license:gpl3+)))

;;; uget-integrator-firefox --- configuration to connect Firefox with uget-integrator
(define-public uget-integrator-firefox
  (package
    (name "uget-integrator-firefox")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/uget-integrator-firefox.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "configuration to connect Firefox with uget-integrator")
    (description "Configuration to connect Firefox with uget-integrator.")
    (home-page "https://github.com/ugetdm/uget-integrator")
    (license license:gpl3+)))

;;; uget-integrator-chromium --- configuration to connect Chromium with uget-integrator
(define-public uget-integrator-chromium
  (package
    (name "uget-integrator-chromium")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/uget-integrator-chromium.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "configuration to connect Chromium with uget-integrator")
    (description "Configuration to connect Chromium with uget-integrator.")
    (home-page "https://github.com/ugetdm/uget-integrator")
    (license license:gpl3+)))

;;; uget-integrator-chrome --- configuration to connect Google Chrome with uget-integrator
(define-public uget-integrator-chrome
  (package
    (name "uget-integrator-chrome")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/uget-integrator-chrome.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "configuration to connect Google Chrome with uget-integrator")
    (description "Configuration to connect Google Chrome with uget-integrator.")
    (home-page "https://github.com/ugetdm/uget-integrator")
    (license license:gpl3+)))

;;; modelsim-intel-starter --- modelSim-Intel FPGA Starter Edition - last version
(define-public modelsim-intel-starter
  (package
    (name "modelsim-intel-starter")
    (version "20.1.1.720")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/modelsim-intel-starter.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "modelSim-Intel FPGA Starter Edition - last version")
    (description "ModelSim-Intel FPGA Starter Edition - last version.")
    (home-page "http://fpgasoftware.intel.com")
    (license license:nonfree)))

;;; youplay-qt6 --- search, download and play music from YouTube
(define-public youplay-qt6
  (package
    (name "youplay-qt6")
    (version "0.46")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/youplay-qt6.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "search, download and play music from YouTube")
    (description "Search, download and play music from YouTube.")
    (home-page "https://codeberg.org/ralfhersel/youplay")
    (license license:gpl3+)))

;;; youplay-pyqt6 --- search, download and play music from YouTube
(define-public youplay-pyqt6
  (package
    (name "youplay-pyqt6")
    (version "0.46")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/youplay-pyqt6.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "search, download and play music from YouTube")
    (description "Search, download and play music from YouTube.")
    (home-page "https://codeberg.org/ralfhersel/youplay")
    (license license:gpl3+)))

;;; youplay-gtk4 --- search, download and play music from YouTube
(define-public youplay-gtk4
  (package
    (name "youplay-gtk4")
    (version "0.46")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/youplay-gtk4.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "search, download and play music from YouTube")
    (description "Search, download and play music from YouTube.")
    (home-page "https://codeberg.org/ralfhersel/youplay")
    (license license:gpl3+)))

;;; youplay-gtk3 --- search, download and play music from YouTube
(define-public youplay-gtk3
  (package
    (name "youplay-gtk3")
    (version "0.46")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/youplay-gtk3.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "search, download and play music from YouTube")
    (description "Search, download and play music from YouTube.")
    (home-page "https://codeberg.org/ralfhersel/youplay")
    (license license:gpl3+)))

;;; wacom-settings-git --- gUI for calibrating the wacom tablet to a screen or window
(define-public wacom-settings-git
  (package
    (name "wacom-settings-git")
    (version "r4.7a95404")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/wacom-settings-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "gUI for calibrating the wacom tablet to a screen or window")
    (description "GUI for calibrating the wacom tablet to a screen or window.")
    (home-page "https://github.com/avargas05/wacom-settings")
    (license license:gpl3+)))

;;; psource-git --- CLI tool to pretty print source code to stdout or directly to the clip
(define-public psource-git
  (package
    (name "psource-git")
    (version "0.4.3.f2eae02")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/psource-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "CLI tool to pretty print source code to stdout or directly to the clipboard")
    (description "CLI tool to pretty print source code to stdout or directly to the clipboard.")
    (home-page "https://github.com/frederikstroem/psource")
    (license license:expat)))

;;; kpeoplevcard-git --- expose VCard contacts to KPeople
(define-public kpeoplevcard-git
  (package
    (name "kpeoplevcard-git")
    (version "0.1.r164.g6d9178d")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/kpeoplevcard-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "expose VCard contacts to KPeople")
    (description "Expose VCard contacts to KPeople.")
    (home-page "https://kde.org")
    (license license:gpl3+)))

;;; dbeaver-ue --- A universal database tool for developers and database administrators. 
(define-public dbeaver-ue
  (package
    (name "dbeaver-ue")
    (version "25.2.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/dbeaver-ue.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "A universal database tool for developers and database administrators. Mul")
    (description "A universal database tool for developers and database administrators. Multifunctional database tool with native AWS, Azure, and Google Cloud support.")
    (home-page "http://dbeaver.com/")
    (license license:nonfree)))

;;; xdroid --- 卓懿,让安卓应用融入Linux平台应用生态体系，卓懿 x86_64 版（个人免费下载使用，不得用于商业用途）。
(define-public xdroid
  (package
    (name "xdroid")
    (version "13.1.333")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/xdroid.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "卓懿,让安卓应用融入Linux平台应用生态体系，卓懿 x86_64 版（个人免费下载使用，不得用于商业用途）。")
    (description "卓懿,让安卓应用融入Linux平台应用生态体系，卓懿 x86_64 版（个人免费下载使用，不得用于商业用途）。.")
    (home-page "https://www.linzhuotech.com/Product/download")
    (license license:nonfree)))

;;; rstmcpp-git --- A tool that converts wav files to .bcstm or .bcwav
(define-public rstmcpp-git
  (package
    (name "rstmcpp-git")
    (version "1640486611.536830f")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/rstmcpp-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "A tool that converts wav files to .bcstm or .bcwav")
    (description "A tool that converts wav files to .bcstm or .bcwav.")
    (home-page "https://gitlab.com/beelzy/rstmcpp")
    (license license:isc)))

;;; python-pyqcc --- Python package to communicate with Crypta Labs QRNG devices
(define-public python-pyqcc
  (package
    (name "python-pyqcc")
    (version "0.1.4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-pyqcc.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "Python package to communicate with Crypta Labs QRNG devices")
    (description "Python package to communicate with Crypta Labs QRNG devices.")
    (home-page "https://cryptalabs.com/qrng-driver-downloads/")
    (license license:nonfree)))

;;; python-bbpb-git --- A set of tools for working with encoded Protocol Buffers
(define-public python-bbpb-git
  (package
    (name "python-bbpb-git")
    (version "r175.0eabe49")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-bbpb-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "A set of tools for working with encoded Protocol Buffers")
    (description "A set of tools for working with encoded Protocol Buffers.")
    (home-page "https://github.com/nccgroup/blackboxprotobuf")
    (license license:expat)))

;;; lsvkdev-bin --- show Vulkan deviceName and driverName on Rust
(define-public lsvkdev-bin
  (package
    (name "lsvkdev-bin")
    (version "0.0.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lsvkdev-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "show Vulkan deviceName and driverName on Rust")
    (description "Show Vulkan deviceName and driverName on Rust.")
    (home-page "https://github.com/VHSgunzo/lsvkdev")
    (license license:nonfree)))

;;; kame-tools-git --- A tool for bundling 3DS theme files
(define-public kame-tools-git
  (package
    (name "kame-tools-git")
    (version "a1fe47c")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/kame-tools-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "A tool for bundling 3DS theme files")
    (description "A tool for bundling 3DS theme files.")
    (home-page "https://gitlab.com/beelzy/kame-tools")
    (license license:expat)))

;;; isextract-git --- command line tool to extract from *.z InstallShield v3 packages
(define-public isextract-git
  (package
    (name "isextract-git")
    (version "r12.d9350da")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/isextract-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "command line tool to extract from *.z InstallShield v3 packages")
    (description "Command line tool to extract from *.z InstallShield v3 packages.")
    (home-page "https://github.com/OmniBlade/isextract")
    (license license:nonfree)))

;;; importenv-bin --- launching an executable file with environment variables from a specifi
(define-public importenv-bin
  (package
    (name "importenv-bin")
    (version "0.0.7")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/importenv-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "launching an executable file with environment variables from a specific p")
    (description "Launching an executable file with environment variables from a specific process id.")
    (home-page "https://github.com/VHSgunzo/importenv")
    (license license:nonfree)))

;;; gotepad-bin --- A simple text editor built with Wails.(Prebuilt version)
(define-public gotepad-bin
  (package
    (name "gotepad-bin")
    (version "2.7.7")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gotepad-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "A simple text editor built with Wails.(Prebuilt version)")
    (description "A simple text editor built with Wails.(Prebuilt version).")
    (home-page "https://github.com/Sammy-T/gotepad")
    (license license:expat)))

;;; goskyr --- configurable command-line web scraper
(define-public goskyr
  (package
    (name "goskyr")
    (version "0.5.46")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/goskyr.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "configurable command-line web scraper")
    (description "Configurable command-line web scraper.")
    (home-page "https://github.com/jakopako/goskyr")
    (license license:gpl3+)))

;;; electron17-bin --- build cross platform desktop apps with web technologies — prebuilt
(define-public electron17-bin
  (package
    (name "electron17-bin")
    (version "17.4.11")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/electron17-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "build cross platform desktop apps with web technologies — prebuilt")
    (description "Build cross platform desktop apps with web technologies — prebuilt.")
    (home-page "https://electronjs.org")
    (license license:nonfree)))

;;; eldev-git --- emacs-based build tool, targeted solely at Elisp projects
(define-public eldev-git
  (package
    (name "eldev-git")
    (version "1.4.1.r6.g586cf08")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/eldev-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "emacs-based build tool, targeted solely at Elisp projects")
    (description "Emacs-based build tool, targeted solely at Elisp projects.")
    (home-page "https://github.com/doublep/eldev")
    (license license:gpl3+)))

;;; ebookinfo --- library and utility for extracting meta-data from certain e-book files
(define-public ebookinfo
  (package
    (name "ebookinfo")
    (version "0.0.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ebookinfo.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "library and utility for extracting meta-data from certain e-book files")
    (description "Library and utility for extracting meta-data from certain e-book files.")
    (home-page "https://github.com/kevinboone/ebookinfo")
    (license license:gpl3+)))

;;; dora-ssr --- A game engine for rapid development across devices, featuring a built-
(define-public dora-ssr
  (package
    (name "dora-ssr")
    (version "1.6.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/dora-ssr.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "A game engine for rapid development across devices, featuring a built-in ")
    (description "A game engine for rapid development across devices, featuring a built-in Web IDE with intuitive toolchain.")
    (home-page "https://github.com/IppClub/Dora-SSR")
    (license license:expat)))

;;; devtools-loong64 --- tools for Arch Linux LoongArch package maintainers
(define-public devtools-loong64
  (package
    (name "devtools-loong64")
    (version "1.5.0.patch1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/devtools-loong64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "tools for Arch Linux LoongArch package maintainers")
    (description "Tools for Arch Linux LoongArch package maintainers.")
    (home-page "https://gitlab.archlinux.org/archlinux/devtools")
    (license license:gpl3+)))

;;; cvm --- stack-based virtual machine
(define-public cvm
  (package
    (name "cvm")
    (version "1.0.10")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/cvm.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "stack-based virtual machine")
    (description "Stack-based virtual machine.")
    (home-page "https://github.com/number571/cvm")
    (license license:expat)))

;;; cro-mag-rally-net --- the wildest racing game since man invented the wheel! Experimental LAN
(define-public cro-mag-rally-net
  (package
    (name "cro-mag-rally-net")
    (version "3.0.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/cro-mag-rally-net.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "the wildest racing game since man invented the wheel! Experimental LAN bu")
    (description "The wildest racing game since man invented the wheel! Experimental LAN build.")
    (home-page "https://github.com/jm2/CroMagRally")
    (license license:nonfree)))

;;; cloudip --- CLI tool for identifying cloud providers
(define-public cloudip
  (package
    (name "cloudip")
    (version "0.6.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/cloudip.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "CLI tool for identifying cloud providers")
    (description "CLI tool for identifying cloud providers.")
    (home-page "https://github.com/jongwoo328/cloudip")
    (license license:asl2.0)))

;;; buchable-bin --- the unofficial cross-platform app for Audiobookshelf
(define-public buchable-bin
  (package
    (name "buchable-bin")
    (version "1.8.5")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/buchable-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "the unofficial cross-platform app for Audiobookshelf")
    (description "The unofficial cross-platform app for Audiobookshelf.")
    (home-page "https://github.com/Vito0912/abs_flutter")
    (license license:bsd-3)))

;;; bsky-desktop --- an unofficial desktop client for Bluesky
(define-public bsky-desktop
  (package
    (name "bsky-desktop")
    (version "1.0.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/bsky-desktop.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "an unofficial desktop client for Bluesky")
    (description "An unofficial desktop client for Bluesky.")
    (home-page "https://github.com/enderfoxbg/bsky")
    (license license:gpl3+)))

;;; awtfdb --- anime Woman's Tagged File Data Base
(define-public awtfdb
  (package
    (name "awtfdb")
    (version "0.4.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/awtfdb.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "anime Woman's Tagged File Data Base")
    (description "Anime Woman's Tagged File Data Base.")
    (home-page "https://github.com/lun-4/awtfdb")
    (license license:expat)))

;;; aqua-bin --- declarative CLI version manager
(define-public aqua-bin
  (package
    (name "aqua-bin")
    (version "2.57.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/aqua-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "declarative CLI version manager")
    (description "Declarative CLI version manager.")
    (home-page "https://aquaproj.github.io")
    (license license:expat)))

;;; aces-container --- ACES Container Reference Implementation
(define-public aces-container
  (package
    (name "aces-container")
    (version "1.0.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/aces-container.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "ACES Container Reference Implementation")
    (description "ACES Container Reference Implementation.")
    (home-page "https://github.com/ampas/aces_container")
    (license license:nonfree)))

;;; acast-bin --- A free and open source solution for recording terminal sessions and sh
(define-public acast-bin
  (package
    (name "acast-bin")
    (version "0.4.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/acast-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "A free and open source solution for recording terminal sessions and shari")
    (description "A free and open source solution for recording terminal sessions and sharing them on the web.(Prebuilt version)一个免费开源的终端会话录制和分享工具.")
    (home-page "https://asciinema.org/")
    (license license:expat)))

;;; acdcontrol-git --- Apple Cinema Display Control Utility for Linux
(define-public acdcontrol-git
  (package
    (name "acdcontrol-git")
    (version "17.cc6315f")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/acdcontrol-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "Apple Cinema Display Control Utility for Linux")
    (description "Apple Cinema Display Control Utility for Linux.")
    (home-page "https://github.com/jenrik/acdcontrol.git")
    (license license:gpl3+)))

;;; xdg-desktop-portal-cosmic-git --- A backend implementation for xdg-desktop-portal for the COSMIC desktop
(define-public xdg-desktop-portal-cosmic-git
  (package
    (name "xdg-desktop-portal-cosmic-git")
    (version "1.0.0.alpha.6.r3.ga515c19")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/xdg-desktop-portal-cosmic-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "A backend implementation for xdg-desktop-portal for the COSMIC desktop en")
    (description "A backend implementation for xdg-desktop-portal for the COSMIC desktop environment.")
    (home-page "https://github.com/pop-os/xdg-desktop-portal-cosmic")
    (license license:gpl3)))

;;; run-reduce-deb --- A Java GUI frontend for REDUCE
(define-public run-reduce-deb
  (package
    (name "run-reduce-deb")
    (version "3.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/run-reduce-deb.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "A Java GUI frontend for REDUCE")
    (description "A Java GUI frontend for REDUCE.")
    (home-page "https://github.com/fjwright/Run-REDUCE")
    (license license:gpl3+)))

;;; libfprint-2-tod1-elan --- proprietary driver for the Elan/Lenovo 04fe:0c4b fingerprint reader, f
(define-public libfprint-2-tod1-elan
  (package
    (name "libfprint-2-tod1-elan")
    (version "0.0.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/libfprint-2-tod1-elan.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "proprietary driver for the Elan/Lenovo 04fe:0c4b fingerprint reader, from")
    (description "Proprietary driver for the Elan/Lenovo 04fe:0c4b fingerprint reader, from Lenovo E14 Gen 4 Ubuntu driver.")
    (home-page "https://download.lenovo.com/pccbbs/mobiles/r1sle01w.zip")
    (license license:nonfree)))

;;; csbooks-bin --- A smart book management and reading software,also a PDF reader, EPUB r
(define-public csbooks-bin
  (package
    (name "csbooks-bin")
    (version "8.5.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/csbooks-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "A smart book management and reading software,also a PDF reader, EPUB read")
    (description "A smart book management and reading software,also a PDF reader, EPUB reader, MOBI reader and DJVU file reader.(Prebuilt version.Use system-wide electron).")
    (home-page "https://caesiumstudio.com/csbooks/")
    (license license:nonfree)))

;;; copybara-git --- A tool for transforming and moving code between repositories
(define-public copybara-git
  (package
    (name "copybara-git")
    (version "0.0.0.r2390.g44ca710c")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/copybara-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "A tool for transforming and moving code between repositories")
    (description "A tool for transforming and moving code between repositories.")
    (home-page "https://github.com/google/copybara")
    (license license:asl2.0)))

;;; spideroak-one --- secure file backup, sync and sharing client. SpiderOak One client
(define-public spideroak-one
  (package
    (name "spideroak-one")
    (version "7.5.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/spideroak-one.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "secure file backup, sync and sharing client. SpiderOak One client")
    (description "Secure file backup, sync and sharing client. SpiderOak One client.")
    (home-page "https://crossclave.com/")
    (license license:nonfree)))

;;; st-community-git --- A simple virtual terminal emulator for X, with community patches inclu
(define-public st-community-git
  (package
    (name "st-community-git")
    (version "0.9+9846a56")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/st-community-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "A simple virtual terminal emulator for X, with community patches included")
    (description "A simple virtual terminal emulator for X, with community patches included.")
    (home-page "https://github.com/dc138/st-community/")
    (license license:expat)))

;;; mtplayer --- offers access to the Mediathek of several public tv stations from DE/A
(define-public mtplayer
  (package
    (name "mtplayer")
    (version "21__2026.01.23")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mtplayer.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "offers access to the Mediathek of several public tv stations from DE/AT/CH")
    (description "Offers access to the Mediathek of several public tv stations from DE/AT/CH.")
    (home-page "https://www.p2tools.de/mtplayer/")
    (license license:gpl3+)))

;;; msty-bin --- the easiest way to use local and online AI models
(define-public msty-bin
  (package
    (name "msty-bin")
    (version "1.9")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/msty-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "the easiest way to use local and online AI models")
    (description "The easiest way to use local and online AI models.")
    (home-page "https://msty.app")
    (license license:nonfree)))

;;; libpdfium-nojs --- open-source PDF rendering engine
(define-public libpdfium-nojs
  (package
    (name "libpdfium-nojs")
    (version "7727.r1.b34626f5fd")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/libpdfium-nojs.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "open-source PDF rendering engine")
    (description "Open-source PDF rendering engine.")
    (home-page "https://pdfium.googlesource.com/pdfium/")
    (license license:bsd-3)))

;;; gnome-pomodoro-git --- A time management utility for GNOME based on the pomodoro technique
(define-public gnome-pomodoro-git
  (package
    (name "gnome-pomodoro-git")
    (version "r1161.ddfe240")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gnome-pomodoro-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "A time management utility for GNOME based on the pomodoro technique")
    (description "A time management utility for GNOME based on the pomodoro technique.")
    (home-page "https://github.com/gnome-pomodoro/gnome-pomodoro")
    (license license:gpl3+)))

;;; readarr-develop --- ebook and audiobook collection manager for newsgroup and torrent users
(define-public readarr-develop
  (package
    (name "readarr-develop")
    (version "0.4.18.2805")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/readarr-develop.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "ebook and audiobook collection manager for newsgroup and torrent users (d")
    (description "Ebook and audiobook collection manager for newsgroup and torrent users (develop branch).")
    (home-page "https://readarr.com")
    (license license:gpl3+)))

;;; art-rawconverter-bin --- raw image converter forked from RawTherapee with ease of use in mind
(define-public art-rawconverter-bin
  (package
    (name "art-rawconverter-bin")
    (version "1.26.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/art-rawconverter-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "raw image converter forked from RawTherapee with ease of use in mind")
    (description "Raw image converter forked from RawTherapee with ease of use in mind.")
    (home-page "https://github.com/artraweditor/ART")
    (license license:gpl3+)))

;;; nuitka --- Python compiler with full language support and CPython compatibility
(define-public nuitka
  (package
    (name "nuitka")
    (version "4.0.8")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/nuitka.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "Python compiler with full language support and CPython compatibility")
    (description "Python compiler with full language support and CPython compatibility.")
    (home-page "https://nuitka.net")
    (license license:asl2.0)))

;;; octave-symbolic --- adds symbolic calculation features to GNU Octave. These include common
(define-public octave-symbolic
  (package
    (name "octave-symbolic")
    (version "3.2.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/octave-symbolic.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "adds symbolic calculation features to GNU Octave. These include common Co")
    (description "Adds symbolic calculation features to GNU Octave. These include common Computer Algebra System tools such as algebraic operations, calculus, equation solving, Fourier and Laplace transforms, variable precision arithmetic and other features. Interna [...].")
    (home-page "https://gnu-octave.github.io/packages/symbolic/")
    (license license:gpl3+)))

;;; creality-print-appimage --- Creality Print is a slicer dedicated to FDM printers
(define-public creality-print-appimage
  (package
    (name "creality-print-appimage")
    (version "7.1.0.4414")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/creality-print-appimage.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "Creality Print is a slicer dedicated to FDM printers")
    (description "Creality Print is a slicer dedicated to FDM printers.")
    (home-page "https://github.com/CrealityOfficial/CrealityPrint")
    (license license:agpl3+)))

;;; spotify-edge --- A proprietary music streaming service. Edge version
(define-public spotify-edge
  (package
    (name "spotify-edge")
    (version "1.2.86.502")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/spotify-edge.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "A proprietary music streaming service. Edge version")
    (description "A proprietary music streaming service. Edge version.")
    (home-page "https://www.spotify.com")
    (license license:nonfree)))

;;; timekpr-next --- control the computer usage of users. You can limit daily usage based o
(define-public timekpr-next
  (package
    (name "timekpr-next")
    (version "0.5.9")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/timekpr-next.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "control the computer usage of users. You can limit daily usage based on a")
    (description "Control the computer usage of users. You can limit daily usage based on a timed access duration and configure periods of day when they can log in.")
    (home-page "https://launchpad.net/timekpr-next")
    (license license:gpl3+)))

;;; read-cat-insiders --- 一款免费、开源、简洁、纯净、无广告的小说阅读器
(define-public read-cat-insiders
  (package
    (name "read-cat-insiders")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/read-cat-insiders.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "一款免费、开源、简洁、纯净、无广告的小说阅读器")
    (description "一款免费、开源、简洁、纯净、无广告的小说阅读器.")
    (home-page "https://read-cat.top/")
    (license license:gpl3+)))

;;; angryoxide --- 802.11 Attack Tool
(define-public angryoxide
  (package
    (name "angryoxide")
    (version "0.9.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/angryoxide.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "802.11 Attack Tool")
    (description "802.11 Attack Tool.")
    (home-page "https://github.com/Ragnt/AngryOxide")
    (license license:gpl3)))

;;; thelounge --- modern self-hosted web IRC client
(define-public thelounge
  (package
    (name "thelounge")
    (version "4.4.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/thelounge.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "modern self-hosted web IRC client")
    (description "Modern self-hosted web IRC client.")
    (home-page "https://thelounge.chat/")
    (license license:expat)))

;;; codon-bin --- high-performance, zero-overhead, extensible Python compiler using LLVM
(define-public codon-bin
  (package
    (name "codon-bin")
    (version "0.19.6")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/codon-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "high-performance, zero-overhead, extensible Python compiler using LLVM")
    (description "High-performance, zero-overhead, extensible Python compiler using LLVM.")
    (home-page "https://github.com/exaloop/codon")
    (license license:asl2.0)))

;;; liteloader-qqnt-mspring-theme-bin --- liteLoaderQQNT主题，优雅、粉粉、细致
(define-public liteloader-qqnt-mspring-theme-bin
  (package
    (name "liteloader-qqnt-mspring-theme-bin")
    (version "1.3.7")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/liteloader-qqnt-mspring-theme-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "liteLoaderQQNT主题，优雅、粉粉、细致")
    (description "LiteLoaderQQNT主题，优雅、粉粉、细致.")
    (home-page "https://github.com/MUKAPP/LiteLoaderQQNT-MSpring-Theme")
    (license license:expat)))

;;; liteloader-qqnt-lite-tools-bin --- liteLoaderQQNT插件，轻量工具箱，轻量、优雅、高效
(define-public liteloader-qqnt-lite-tools-bin
  (package
    (name "liteloader-qqnt-lite-tools-bin")
    (version "2.33.9")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/liteloader-qqnt-lite-tools-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "liteLoaderQQNT插件，轻量工具箱，轻量、优雅、高效")
    (description "LiteLoaderQQNT插件，轻量工具箱，轻量、优雅、高效.")
    (home-page "https://github.com/xiyuesaves/LiteLoaderQQNT-lite_tools")
    (license license:expat)))

;;; nocodb-bin --- open Source Airtable Alternative: Turns any MySQL, PostgreSQL, SQL Ser
(define-public nocodb-bin
  (package
    (name "nocodb-bin")
    (version "2026.04.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/nocodb-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "open Source Airtable Alternative: Turns any MySQL, PostgreSQL, SQL Server")
    (description "Open Source Airtable Alternative: Turns any MySQL, PostgreSQL, SQL Server, SQLite & MariaDB into a smart spreadsheet.")
    (home-page "https://nocodb.com")
    (license license:agpl3+)))

;;; private-internet-access-vpn --- installs VPN profiles for Private Internet Access Service
(define-public private-internet-access-vpn
  (package
    (name "private-internet-access-vpn")
    (version "3.4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/private-internet-access-vpn.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "installs VPN profiles for Private Internet Access Service")
    (description "Installs VPN profiles for Private Internet Access Service.")
    (home-page "https://www.privateinternetaccess.com/")
    (license license:gpl3+)))

;;; gameshell --- A game to learn (or teach) how to use standard commands in a Unix shel
(define-public gameshell
  (package
    (name "gameshell")
    (version "0.6.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gameshell.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "A game to learn (or teach) how to use standard commands in a Unix shell")
    (description "A game to learn (or teach) how to use standard commands in a Unix shell.")
    (home-page "https://github.com/phyver/GameShell")
    (license license:gpl3)))

;;; fcitx5-sogou --- Sogou Pinyin for Linux
(define-public fcitx5-sogou
  (package
    (name "fcitx5-sogou")
    (version "10.0.9.0.6")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/fcitx5-sogou.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "Sogou Pinyin for Linux")
    (description "Sogou Pinyin for Linux.")
    (home-page "https://shurufa.sogou.com/linux")
    (license license:nonfree)))

;;; liteloader-qqnt-markdown-bin --- liteLoaderQQNT插件，为QQ添加Markdown支持
(define-public liteloader-qqnt-markdown-bin
  (package
    (name "liteloader-qqnt-markdown-bin")
    (version "2.4.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/liteloader-qqnt-markdown-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "liteLoaderQQNT插件，为QQ添加Markdown支持")
    (description "LiteLoaderQQNT插件，为QQ添加Markdown支持.")
    (home-page "https://github.com/d0j1a1701/LiteLoaderQQNT-Markdown")
    (license license:nonfree)))

;;; liblast-bin --- A libre multiplayer FPS game and framework built using Godot game engi
(define-public liblast-bin
  (package
    (name "liblast-bin")
    (version "2023.12.30")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/liblast-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "A libre multiplayer FPS game and framework built using Godot game engine ")
    (description "A libre multiplayer FPS game and framework built using Godot game engine and a fully open-source tool chain (PREVIEW) (binary release).")
    (home-page "https://codeberg.org/Liblast/Liblast")
    (license license:expat)))

;;; pop-sound-theme-git --- system76 Pop sound theme
(define-public pop-sound-theme-git
  (package
    (name "pop-sound-theme-git")
    (version "5.5.1.r7.g25ea85d")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/pop-sound-theme-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "system76 Pop sound theme")
    (description "System76 Pop sound theme.")
    (home-page "https://github.com/pop-os/gtk-theme")
    (license license:gpl3+)))

;;; cpp-taskflow --- modern C++ Parallel Task Programming Library
(define-public cpp-taskflow
  (package
    (name "cpp-taskflow")
    (version "4.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/cpp-taskflow.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "modern C++ Parallel Task Programming Library")
    (description "Modern C++ Parallel Task Programming Library.")
    (home-page "https://github.com/taskflow/taskflow")
    (license license:expat)))

;;; betterbird-it-bin --- ITALIAN // Betterbird is a fine-tuned version of Mozilla Thunderbird, 
(define-public betterbird-it-bin
  (package
    (name "betterbird-it-bin")
    (version "140.10.0esr")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/betterbird-it-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "ITALIAN // Betterbird is a fine-tuned version of Mozilla Thunderbird, Thu")
    (description "ITALIAN // Betterbird is a fine-tuned version of Mozilla Thunderbird, Thunderbird on steroids, if you will.")
    (home-page "https://www.betterbird.eu/index.html")
    (license license:mpl2.0)))

;;; liteloader-qqnt-markdown-git --- liteLoaderQQNT插件，为QQ添加Markdown支持
(define-public liteloader-qqnt-markdown-git
  (package
    (name "liteloader-qqnt-markdown-git")
    (version "2.4.1.r0.g3af0cdb")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/liteloader-qqnt-markdown-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "liteLoaderQQNT插件，为QQ添加Markdown支持")
    (description "LiteLoaderQQNT插件，为QQ添加Markdown支持.")
    (home-page "https://github.com/d0j1a1701/LiteLoaderQQNT-Markdown")
    (license license:nonfree)))

;;; liteloader-qqnt-chii-devtools-bin --- liteLoaderQQNT插件，使用Chii进行远程调试
(define-public liteloader-qqnt-chii-devtools-bin
  (package
    (name "liteloader-qqnt-chii-devtools-bin")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/liteloader-qqnt-chii-devtools-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "liteLoaderQQNT插件，使用Chii进行远程调试")
    (description "LiteLoaderQQNT插件，使用Chii进行远程调试.")
    (home-page "https://github.com/mo-jinran/chii-devtools")
    (license license:gpl3+)))

;;; hsh --- better shell
(define-public hsh
  (package
    (name "hsh")
    (version "0.0.3.31.gffa3c16")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/hsh.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "better shell")
    (description "Better shell.")
    (home-page "https://github.com/GrayHatter/hsh")
    (license license:bsd-2)))

;;; mssql-server-fts --- Microsoft SQL Server Full Text Search
(define-public mssql-server-fts
  (package
    (name "mssql-server-fts")
    (version "16.0.4225.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mssql-server-fts.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "Microsoft SQL Server Full Text Search")
    (description "Microsoft SQL Server Full Text Search.")
    (home-page "https://learn.microsoft.com/en-us/sql/linux/sql-server-linux-overview?view=sql-server-ver16")
    (license license:nonfree)))

;;; mpd-discord-rpc-git --- displays metadata of currently playing song from MPD in Discord using 
(define-public mpd-discord-rpc-git
  (package
    (name "mpd-discord-rpc-git")
    (version "1.11.0.r5.g36eacd3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mpd-discord-rpc-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "displays metadata of currently playing song from MPD in Discord using Ric")
    (description "Displays metadata of currently playing song from MPD in Discord using Rich Presence.")
    (home-page "https://github.com/JakeStanger/mpd-discord-rpc")
    (license license:expat)))

;;; logitechmediaserver-bin --- slimserver for Logitech Squeezebox players. This server is also called
(define-public logitechmediaserver-bin
  (package
    (name "logitechmediaserver-bin")
    (version "9.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/logitechmediaserver-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "slimserver for Logitech Squeezebox players. This server is also called Lo")
    (description "Slimserver for Logitech Squeezebox players. This server is also called Logitech Media Server).")
    (home-page "https://github.com/Logitech/slimserver")
    (license license:nonfree)))

;;; carapace-bridge-bin --- A multi-shell completion bridge
(define-public carapace-bridge-bin
  (package
    (name "carapace-bridge-bin")
    (version "1.5.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/carapace-bridge-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "A multi-shell completion bridge")
    (description "A multi-shell completion bridge.")
    (home-page "https://github.com/carapace-sh/carapace-bridge")
    (license license:expat)))

;;; savage2 --- savage 2: A Tortured Soul is an fantasy themed online multiplayer team
(define-public savage2
  (package
    (name "savage2")
    (version "2.1.1.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/savage2.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "savage 2: A Tortured Soul is an fantasy themed online multiplayer team-ba")
    (description "Savage 2: A Tortured Soul is an fantasy themed online multiplayer team-based FPS/RTS/RPG hybrid. Completely free as of December 2008.")
    (home-page "https://savage2.com/")
    (license license:nonfree)))

;;; etqw --- enemy Territory: Quake Wars is a commercial team and class-based multi
(define-public etqw
  (package
    (name "etqw")
    (version "1.5")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/etqw.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "enemy Territory: Quake Wars is a commercial team and class-based multipla")
    (description "Enemy Territory: Quake Wars is a commercial team and class-based multiplayer game. You need the retail DVD to play.")
    (home-page "https://www.splashdamage.com/games/enemy-territory-quake-wars/")
    (license license:nonfree)))

;;; ut2004-steam --- popular first person shooter, native Linux version, installing data fi
(define-public ut2004-steam
  (package
    (name "ut2004-steam")
    (version "3369_2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ut2004-steam.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "popular first person shooter, native Linux version, installing data files")
    (description "Popular first person shooter, native Linux version, installing data files from Steam (requires you having had purchased the Steam version).")
    (home-page "https://store.steampowered.com/app/13230/")
    (license license:nonfree)))

;;; rhythmbox-plugin-alternative-toolbar --- modern, minimal and music-focused interface for Rhythmbox
(define-public rhythmbox-plugin-alternative-toolbar
  (package
    (name "rhythmbox-plugin-alternative-toolbar")
    (version "0.20.4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/rhythmbox-plugin-alternative-toolbar.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "modern, minimal and music-focused interface for Rhythmbox")
    (description "Modern, minimal and music-focused interface for Rhythmbox.")
    (home-page "https://github.com/fossfreedom/alternative-toolbar")
    (license license:gpl3+)))
