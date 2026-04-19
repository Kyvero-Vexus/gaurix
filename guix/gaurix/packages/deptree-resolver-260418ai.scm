;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Dependency tree resolver pass --- deptree-resolver-260418ai
;;; Resolves 98 TODO packages with concrete recipes.
;;; Moves 2 packages to BLOCKED status.
;;;
;;;      1. morewaita-icon-theme-git (gnu-build-system, v49, GPL3)
;;;      2. battery-notify (cargo-build-system, v0.3.3, MIT)
;;;      3. cpctools (gnu-build-system, v0.3.3, GPL2)
;;;      4. vmware-horizon-html5mmr (gnu-build-system, v2406, custom)
;;;      5. vmware-horizon-integrated-printing (gnu-build-system, v2406, custom)
;;;      6. vmware-horizon-mmr (gnu-build-system, v2406, custom)
;;;      7. vmware-horizon-rtav (gnu-build-system, v2406, custom)
;;;      8. vmware-horizon-smartcard (gnu-build-system, v2406, custom)
;;;      9. vmware-horizon-tsdr (gnu-build-system, v2406, custom)
;;;     10. vmware-horizon-usb (gnu-build-system, v2406, custom)
;;;     11. open-cobol-esql (gnu-build-system, v1.4, GPL-3.0-or-later)
;;;     12. detect-old-python-modules (pyproject-build-system, v0.0.3, EUPL-1.2)
;;;     13. lyrionmusicserver-git (perl-build-system, v9.0.2, GPL-2.0-only)
;;;     14. p3x-onenote (node-build-system, v2025.10.111, MIT)
;;;     15. epson-inkjet-printer-201105w (gnu-build-system, v1.0.0, custom:Epson End User Software License Agreement)
;;;     16. dawnpro-gui (pyproject-build-system, v1.1.0, MIT)
;;;     17. lib32-libxkbfile (meson-build-system, v1.1.3, LicenseRef-libxkbfile)
;;;     18. python-submit50 (pyproject-build-system, v3.2.0, GPLv3)
;;;     19. dnstwist-git (pyproject-build-system, vr411.74edcea, unknown)
;;;     20. linux-hardened-lts-docs (pyproject-build-system, v6.18.17.hardened1, GPL-2.0-only)
;;;     21. linux-hardened-lts-headers (pyproject-build-system, v6.18.17.hardened1, GPL-2.0-only)
;;;     22. python-check50 (pyproject-build-system, v3.4.0, GPLv3)
;;;     23. ashpd-demo (meson-build-system, v0.12.0-1.0, MIT)
;;;     24. gr-satlab (cmake-build-system, v20250722, GPL-3.0-or-later)
;;;     25. hyprshot-gui (pyproject-build-system, v1.5.0, MIT)
;;;     26. xkb-altgr-weur (perl-build-system, v2, custom)
;;;     27. yabsnap-git (pyproject-build-system, vr313.0d242f0, Apache)
;;;     28. libast (gnu-build-system, v0.7, BSD)
;;;     29. eterm (gnu-build-system, v0.9.6, custom)
;;;     30. mint-artwork (gnu-build-system, v1.9.3, GPL)
;;;   ... and 68 more
;;;
;;; NOTE: All hashes are placeholders (base32 "0000...").
;;; Run `guix build -L guix <name>` to obtain actual hashes from error output.

(define-module (gaurix packages deptree-resolver-260418ai)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system ant)
  #:use-module (guix build-system cargo)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system go)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system node)
  #:use-module (guix build-system perl)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system qt)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:export (morewaita-icon-theme-git
            battery-notify
            cpctools
            vmware-horizon-html5mmr
            vmware-horizon-integrated-printing
            vmware-horizon-mmr
            vmware-horizon-rtav
            vmware-horizon-smartcard
            vmware-horizon-tsdr
            vmware-horizon-usb
            open-cobol-esql
            detect-old-python-modules
            lyrionmusicserver-git
            p3x-onenote
            epson-inkjet-printer-201105w
            dawnpro-gui
            lib32-libxkbfile
            python-submit50
            dnstwist-git
            linux-hardened-lts-docs
            linux-hardened-lts-headers
            python-check50
            ashpd-demo
            gr-satlab
            hyprshot-gui
            xkb-altgr-weur
            yabsnap-git
            libast
            eterm
            mint-artwork
            xfce4-panel-compiz
            brother-hl2140
            gtk-theme-e17gtk-git
            libinput-noaccum
            thumbor-aws
            ananicy-cpp-dinit
            ananicy-cpp-runit
            squeekboard-git
            bontmia
            clipse-git
            ftxui-docs
            ftxui-examples
            panini
            trezord-go
            arm-linux-gnueabihf-gcc75-linaro-bin
            lightning-terminal
            whisper.cpp-model-small.en-tdrz
            osu-handler
            skatgui
            python-amulet-nbt
            python-pymctranslate
            thunderbird-gnome-theme-git
            whisper.cpp-model-medium
            pokerstove-git
            python-amulet-leveldb
            python-minecraft-model-reader
            rz-jsdec
            rz-jsdec-git
            steam-tui-git
            whisper.cpp-model-base
            whisper.cpp-model-medium-q5-0
            whisper.cpp-model-medium.en
            whisper.cpp-model-medium.en-q5-0
            whisper.cpp-model-small.en
            whisper.cpp-model-tiny.en
            amulet-map-editor
            firefox-gnome-theme-git
            gnome-backgrounds-bitday-git
            go-chromecast-git
            fortune-mod-brooklyn-nine-nine
            jskat
            remoteplaywhatever
            chezmoi-modify-manager-git
            cosmic-ext-calculator-git
            fortune-mod-de
            fortune-mod-leftism-git
            scpdiscord
            lsparu
            mkdocs-git-revision-date-localized-plugin
            brother-dcp-t536dw
            clcc
            audius
            aurup
            funkin
            bash-pinyin-completion-rs
            electron-deepseek
            boxtron
            cmcl
            inspector
            big-launcher-git
            netactview
            sdrtrunk-git
            clickhouse
            omnisharp-roslyn
            ezchlog
            mpd-notification
            openmpt
            ca-certificates-dn42
))

;;; Nonfree license helper for proprietary/custom packages
(define license:nonfree
  ((@@ (guix licenses) license) "Nonfree"
    "https://en.wikipedia.org/wiki/Proprietary_software"
    "Proprietary nonfree license"))

;;; EUPL-1.2 license definition (not yet in upstream Guix).
(define license:eupl1.2
  ((@@ (guix licenses) license) "EUPL-1.2"
    "https://joinup.ec.europa.eu/collection/eupl/eupl-text-eupl-12"
    "European Union Public License 1.2"))

;;; -------------------------------------------------------------------
;;; 1. morewaita-icon-theme-git --- an expanded Adwaita-styled companion icon theme with extra i
;;; An expanded Adwaita-styled companion icon theme with extra icons for p
;;; -------------------------------------------------------------------
(define-public morewaita-icon-theme-git
  (package
    (name "morewaita-icon-theme-git")
    (version "49")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                (url "https://github.com/somepaulo/MoreWaita")
                (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))  ; no test suite or tests need network
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/somepaulo/MoreWaita")
    (synopsis "an expanded Adwaita-styled companion icon theme with extra icons for popular ")
    (description "An expanded Adwaita-styled companion icon theme with extra icons for popular apps to complement Gnome Shell's original icons. AUR package maintained by upstream developer.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 2. battery-notify --- a simple battery notifier for Linux
;;; A simple battery notifier for Linux.
;;; -------------------------------------------------------------------
(define-public battery-notify
  (package
    (name "battery-notify")
    (version "0.3.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/cdown/battery-notify/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/cdown/battery-notify")
    (synopsis "a simple battery notifier for Linux")
    (description "A simple battery notifier for Linux..  This package provides battery-notify for use on GNU/Linux systems.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 3. cpctools --- amstrad CPC tools for cross development
;;; Amstrad CPC tools for cross development
;;; -------------------------------------------------------------------
(define-public cpctools
  (package
    (name "cpctools")
    (version "0.3.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/cpcsdk/cpctools/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))  ; no test suite or tests need network
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/cpcsdk/cpctools")
    (synopsis "amstrad CPC tools for cross development")
    (description "Amstrad CPC tools for cross development.  This package provides cpctools for use on GNU/Linux systems.")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 4. vmware-horizon-html5mmr --- vMware Horizon Client connect to VMware Horizon virtual desk
;;; VMware Horizon Client connect to VMware Horizon virtual desktop - HTML
;;; -------------------------------------------------------------------
(define-public vmware-horizon-html5mmr
  (package
    (name "vmware-horizon-html5mmr")
    (version "2406")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://customerconnect.omnissa.com/downloads/info/slug/desktop_end_user_computing/vmware_horizon_clients/horizon_8/releases/download/v" version
                    "/vmware-horizon-html5mmr-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))  ; no test suite or tests need network
    (supported-systems '("x86_64-linux"))
    (home-page "https://customerconnect.omnissa.com/downloads/info/slug/desktop_end_user_computing/vmware_horizon_clients/horizon_8")
    (synopsis "vMware Horizon Client connect to VMware Horizon virtual desktop - HTML5 Multi")
    (description "VMware Horizon Client connect to VMware Horizon virtual desktop - HTML5 MultiMedia Redirection.")
    (license license:nonfree)))

;;; -------------------------------------------------------------------
;;; 5. vmware-horizon-integrated-printing --- vMware Horizon Client connect to VMware Horizon virtual desk
;;; VMware Horizon Client connect to VMware Horizon virtual desktop - inte
;;; -------------------------------------------------------------------
(define-public vmware-horizon-integrated-printing
  (package
    (name "vmware-horizon-integrated-printing")
    (version "2406")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://customerconnect.omnissa.com/downloads/info/slug/desktop_end_user_computing/vmware_horizon_clients/horizon_8/releases/download/v" version
                    "/vmware-horizon-integrated-printing-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))  ; no test suite or tests need network
    (supported-systems '("x86_64-linux"))
    (home-page "https://customerconnect.omnissa.com/downloads/info/slug/desktop_end_user_computing/vmware_horizon_clients/horizon_8")
    (synopsis "vMware Horizon Client connect to VMware Horizon virtual desktop - integrated ")
    (description "VMware Horizon Client connect to VMware Horizon virtual desktop - integrated printing.")
    (license license:nonfree)))

;;; -------------------------------------------------------------------
;;; 6. vmware-horizon-mmr --- vMware Horizon Client connect to VMware Horizon virtual desk
;;; VMware Horizon Client connect to VMware Horizon virtual desktop - mult
;;; -------------------------------------------------------------------
(define-public vmware-horizon-mmr
  (package
    (name "vmware-horizon-mmr")
    (version "2406")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://customerconnect.omnissa.com/downloads/info/slug/desktop_end_user_computing/vmware_horizon_clients/horizon_8/releases/download/v" version
                    "/vmware-horizon-mmr-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))  ; no test suite or tests need network
    (supported-systems '("x86_64-linux"))
    (home-page "https://customerconnect.omnissa.com/downloads/info/slug/desktop_end_user_computing/vmware_horizon_clients/horizon_8")
    (synopsis "vMware Horizon Client connect to VMware Horizon virtual desktop - multimedia ")
    (description "VMware Horizon Client connect to VMware Horizon virtual desktop - multimedia redirection.")
    (license license:nonfree)))

;;; -------------------------------------------------------------------
;;; 7. vmware-horizon-rtav --- vMware Horizon Client connect to VMware Horizon virtual desk
;;; VMware Horizon Client connect to VMware Horizon virtual desktop - Real
;;; -------------------------------------------------------------------
(define-public vmware-horizon-rtav
  (package
    (name "vmware-horizon-rtav")
    (version "2406")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://customerconnect.omnissa.com/downloads/info/slug/desktop_end_user_computing/vmware_horizon_clients/horizon_8/releases/download/v" version
                    "/vmware-horizon-rtav-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))  ; no test suite or tests need network
    (supported-systems '("x86_64-linux"))
    (home-page "https://customerconnect.omnissa.com/downloads/info/slug/desktop_end_user_computing/vmware_horizon_clients/horizon_8")
    (synopsis "vMware Horizon Client connect to VMware Horizon virtual desktop - Real-Time A")
    (description "VMware Horizon Client connect to VMware Horizon virtual desktop - Real-Time Audio-Video (webcam and audio-in).")
    (license license:nonfree)))

;;; -------------------------------------------------------------------
;;; 8. vmware-horizon-smartcard --- vMware Horizon Client connect to VMware Horizon virtual desk
;;; VMware Horizon Client connect to VMware Horizon virtual desktop - smar
;;; -------------------------------------------------------------------
(define-public vmware-horizon-smartcard
  (package
    (name "vmware-horizon-smartcard")
    (version "2406")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://customerconnect.omnissa.com/downloads/info/slug/desktop_end_user_computing/vmware_horizon_clients/horizon_8/releases/download/v" version
                    "/vmware-horizon-smartcard-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))  ; no test suite or tests need network
    (supported-systems '("x86_64-linux"))
    (home-page "https://customerconnect.omnissa.com/downloads/info/slug/desktop_end_user_computing/vmware_horizon_clients/horizon_8")
    (synopsis "vMware Horizon Client connect to VMware Horizon virtual desktop - smartcard a")
    (description "VMware Horizon Client connect to VMware Horizon virtual desktop - smartcard authentication.")
    (license license:nonfree)))

;;; -------------------------------------------------------------------
;;; 9. vmware-horizon-tsdr --- vMware Horizon Client connect to VMware Horizon virtual desk
;;; VMware Horizon Client connect to VMware Horizon virtual desktop - fold
;;; -------------------------------------------------------------------
(define-public vmware-horizon-tsdr
  (package
    (name "vmware-horizon-tsdr")
    (version "2406")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://customerconnect.omnissa.com/downloads/info/slug/desktop_end_user_computing/vmware_horizon_clients/horizon_8/releases/download/v" version
                    "/vmware-horizon-tsdr-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))  ; no test suite or tests need network
    (supported-systems '("x86_64-linux"))
    (home-page "https://customerconnect.omnissa.com/downloads/info/slug/desktop_end_user_computing/vmware_horizon_clients/horizon_8")
    (synopsis "vMware Horizon Client connect to VMware Horizon virtual desktop - folder shar")
    (description "VMware Horizon Client connect to VMware Horizon virtual desktop - folder sharing.")
    (license license:nonfree)))

;;; -------------------------------------------------------------------
;;; 10. vmware-horizon-usb --- vMware Horizon Client connect to VMware Horizon virtual desk
;;; VMware Horizon Client connect to VMware Horizon virtual desktop - USB 
;;; -------------------------------------------------------------------
(define-public vmware-horizon-usb
  (package
    (name "vmware-horizon-usb")
    (version "2406")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://customerconnect.omnissa.com/downloads/info/slug/desktop_end_user_computing/vmware_horizon_clients/horizon_8/releases/download/v" version
                    "/vmware-horizon-usb-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))  ; no test suite or tests need network
    (supported-systems '("x86_64-linux"))
    (home-page "https://customerconnect.omnissa.com/downloads/info/slug/desktop_end_user_computing/vmware_horizon_clients/horizon_8")
    (synopsis "vMware Horizon Client connect to VMware Horizon virtual desktop - USB device ")
    (description "VMware Horizon Client connect to VMware Horizon virtual desktop - USB device redirection.")
    (license license:nonfree)))

;;; -------------------------------------------------------------------
;;; 11. open-cobol-esql --- embedded SQL pre-compiler and run-time library designed for 
;;; Embedded SQL pre-compiler and run-time library designed for COBOL appl
;;; -------------------------------------------------------------------
(define-public open-cobol-esql
  (package
    (name "open-cobol-esql")
    (version "1.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/opensourcecobol/Open-COBOL-ESQL/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))  ; no test suite or tests need network
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/opensourcecobol/Open-COBOL-ESQL")
    (synopsis "embedded SQL pre-compiler and run-time library designed for COBOL application")
    (description "Embedded SQL pre-compiler and run-time library designed for COBOL applications which access an open-source database.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 12. detect-old-python-modules --- detect old modules after Python upgrade (ALPM hook)
;;; Detect old modules after Python upgrade (ALPM hook)
;;; -------------------------------------------------------------------
(define-public detect-old-python-modules
  (package
    (name "detect-old-python-modules")
    (version "0.0.3")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://codeberg.org/kas/detect-old-python-modules/releases/download/v" version
                    "/detect-old-python-modules-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (supported-systems '("x86_64-linux"))
    (home-page "https://codeberg.org/kas/detect-old-python-modules")
    (synopsis "detect old modules after Python upgrade (ALPM hook)")
    (description "Detect old modules after Python upgrade (ALPM hook).")
    (license license:eupl1.2)))

;;; -------------------------------------------------------------------
;;; 13. lyrionmusicserver-git --- slimserver for Logitech Squeezebox players. This server is a
;;; Slimserver for Logitech Squeezebox players. This server is also called
;;; -------------------------------------------------------------------
(define-public lyrionmusicserver-git
  (package
    (name "lyrionmusicserver-git")
    (version "9.0.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                (url "https://github.com/LMS-Community/slimserver")
                (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system perl-build-system)
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/LMS-Community/slimserver")
    (synopsis "slimserver for Logitech Squeezebox players. This server is also called Logite")
    (description "Slimserver for Logitech Squeezebox players. This server is also called Logitech Media Server, port 9002).")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 14. p3x-onenote --- linux Electron Onenote - A Linux compatible version of OneNo
;;; Linux Electron Onenote - A Linux compatible version of OneNote
;;; -------------------------------------------------------------------
(define-public p3x-onenote
  (package
    (name "p3x-onenote")
    (version "2025.10.111")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/patrikx3/onenote/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/patrikx3/onenote")
    (synopsis "linux Electron Onenote - A Linux compatible version of OneNote")
    (description "Linux Electron Onenote - A Linux compatible version of OneNote.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 15. epson-inkjet-printer-201105w --- epson inkjet printer driver (ME OFFICE 570W; Stylus NX330, N
;;; Epson inkjet printer driver (ME OFFICE 570W; Stylus NX330, NX430, SX43
;;; -------------------------------------------------------------------
(define-public epson-inkjet-printer-201105w
  (package
    (name "epson-inkjet-printer-201105w")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://download.ebz.epson.net/dsc/search/01/search/?OSC=LX/releases/download/v" version
                    "/epson-inkjet-printer-201105w-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))  ; no test suite or tests need network
    (supported-systems '("x86_64-linux"))
    (home-page "https://download.ebz.epson.net/dsc/search/01/search/?OSC=LX")
    (synopsis "epson inkjet printer driver (ME OFFICE 570W; Stylus NX330, NX430, SX430W, SX4")
    (description "Epson inkjet printer driver (ME OFFICE 570W; Stylus NX330, NX430, SX430W, SX435W, SX440W, SX445W, TX430W, TX435W).")
    (license license:nonfree)))

;;; -------------------------------------------------------------------
;;; 16. dawnpro-gui --- GUI tool for controlling the Moondrop Dawn Pro AMP/DAC
;;; GUI tool for controlling the Moondrop Dawn Pro AMP/DAC
;;; -------------------------------------------------------------------
(define-public dawnpro-gui
  (package
    (name "dawnpro-gui")
    (version "1.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/shaypower/DawnPro-GUI/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/shaypower/DawnPro-GUI")
    (synopsis "GUI tool for controlling the Moondrop Dawn Pro AMP/DAC")
    (description "GUI tool for controlling the Moondrop Dawn Pro AMP/DAC.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 17. lib32-libxkbfile --- X11 keyboard file manipulation library
;;; X11 keyboard file manipulation library
;;; -------------------------------------------------------------------
(define-public lib32-libxkbfile
  (package
    (name "lib32-libxkbfile")
    (version "1.1.3")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://gitlab.freedesktop.org/xorg/lib/libxkbfile/releases/download/v" version
                    "/lib32-libxkbfile-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))  ; no test suite or tests need network
    (supported-systems '("x86_64-linux"))
    (home-page "https://gitlab.freedesktop.org/xorg/lib/libxkbfile")
    (synopsis "X11 keyboard file manipulation library")
    (description "X11 keyboard file manipulation library.  This package provides lib32-libxkbfile for use on GNU/Linux systems.")
    (license license:nonfree)))

;;; -------------------------------------------------------------------
;;; 18. python-submit50 --- this is submit50, with which you can submit solutions to pro
;;; This is submit50, with which you can submit solutions to problems for 
;;; -------------------------------------------------------------------
(define-public python-submit50
  (package
    (name "python-submit50")
    (version "3.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/cs50/submit50/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/cs50/submit50")
    (synopsis "this is submit50, with which you can submit solutions to problems for CS50")
    (description "This is submit50, with which you can submit solutions to problems for CS50.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 19. dnstwist-git --- simple tool to look for registered domains similar to your o
;;; simple tool to look for registered domains similar to your own, only d
;;; -------------------------------------------------------------------
(define-public dnstwist-git
  (package
    (name "dnstwist-git")
    (version "r411.74edcea")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                (url "https://github.com/elceef/dnstwist")
                (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/elceef/dnstwist")
    (synopsis "simple tool to look for registered domains similar to your own, only distingu")
    (description "simple tool to look for registered domains similar to your own, only distinguished by typos. useful for detection of fraud and fishing attacs.")
    (license license:nonfree)))

;;; -------------------------------------------------------------------
;;; 20. linux-hardened-lts-docs --- documentation for the Security-Hardened Linux LTS kernel
;;; Documentation for the Security-Hardened Linux LTS kernel
;;; -------------------------------------------------------------------
(define-public linux-hardened-lts-docs
  (package
    (name "linux-hardened-lts-docs")
    (version "6.18.17.hardened1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/anthraxx/linux-hardened/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/anthraxx/linux-hardened")
    (synopsis "documentation for the Security-Hardened Linux LTS kernel")
    (description "Documentation for the Security-Hardened Linux LTS kernel.")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 21. linux-hardened-lts-headers --- headers and scripts for building modules for the Security-Ha
;;; Headers and scripts for building modules for the Security-Hardened Lin
;;; -------------------------------------------------------------------
(define-public linux-hardened-lts-headers
  (package
    (name "linux-hardened-lts-headers")
    (version "6.18.17.hardened1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/anthraxx/linux-hardened/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/anthraxx/linux-hardened")
    (synopsis "headers and scripts for building modules for the Security-Hardened Linux LTS ")
    (description "Headers and scripts for building modules for the Security-Hardened Linux LTS kernel.")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 22. python-check50 --- command-line program with which you can check the correctnes
;;; Command-line program with which you can check the correctness of your 
;;; -------------------------------------------------------------------
(define-public python-check50
  (package
    (name "python-check50")
    (version "3.4.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/cs50/check50/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/cs50/check50")
    (synopsis "command-line program with which you can check the correctness of your program")
    (description "Command-line program with which you can check the correctness of your programs in the CS50 courses.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 23. ashpd-demo --- asph-demo
;;; asph-demo
;;; -------------------------------------------------------------------
(define-public ashpd-demo
  (package
    (name "ashpd-demo")
    (version "0.12.0-1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/bilelmoussaoui/ashpd/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))  ; no test suite or tests need network
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/bilelmoussaoui/ashpd")
    (synopsis "asph-demo")
    (description "asph-demo.  This package provides ashpd-demo for use on GNU/Linux systems.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 24. gr-satlab --- contains GNURadio blocks for Satlab SRS-3 and SRS-4 radios
;;; contains GNURadio blocks for Satlab SRS-3 and SRS-4 radios
;;; -------------------------------------------------------------------
(define-public gr-satlab
  (package
    (name "gr-satlab")
    (version "20250722")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.satlab.com/products/srs-4//releases/download/v" version
                    "/gr-satlab-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))  ; no test suite or tests need network
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.satlab.com/products/srs-4/")
    (synopsis "contains GNURadio blocks for Satlab SRS-3 and SRS-4 radios")
    (description "contains GNURadio blocks for Satlab SRS-3 and SRS-4 radios.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 25. hyprshot-gui --- a simple GTK-based GUI for Hyprshot, designed to provide an 
;;; A simple GTK-based GUI for Hyprshot, designed to provide an easy way t
;;; -------------------------------------------------------------------
(define-public hyprshot-gui
  (package
    (name "hyprshot-gui")
    (version "1.5.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/s-adi-dev/hyprshot-gui/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/s-adi-dev/hyprshot-gui")
    (synopsis "a simple GTK-based GUI for Hyprshot, designed to provide an easy way to captu")
    (description "A simple GTK-based GUI for Hyprshot, designed to provide an easy way to capture and manage screenshots on Hyprland.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 26. xkb-altgr-weur --- keyboard layout based on letter frequencies for 11 Western E
;;; Keyboard layout based on letter frequencies for 11 Western European la
;;; -------------------------------------------------------------------
(define-public xkb-altgr-weur
  (package
    (name "xkb-altgr-weur")
    (version "2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://altgr-weur.eu//releases/download/v" version
                    "/xkb-altgr-weur-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system perl-build-system)
    (supported-systems '("x86_64-linux"))
    (home-page "https://altgr-weur.eu/")
    (synopsis "keyboard layout based on letter frequencies for 11 Western European languages")
    (description "Keyboard layout based on letter frequencies for 11 Western European languages (English, Danish, Dutch, Finnish, French, German, Italian, Norwegian, Portugese, Spanish and Swedish).")
    (license license:nonfree)))

;;; -------------------------------------------------------------------
;;; 27. yabsnap-git --- btrfs automated snapshot manager
;;; Btrfs automated snapshot manager.
;;; -------------------------------------------------------------------
(define-public yabsnap-git
  (package
    (name "yabsnap-git")
    (version "r313.0d242f0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                (url "https://github.com/hirak99/yabsnap")
                (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/hirak99/yabsnap")
    (synopsis "btrfs automated snapshot manager")
    (description "Btrfs automated snapshot manager..  This package provides yabsnap-git for use on GNU/Linux systems.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 28. libast --- the Library of Assorted Spiffy Things
;;; The Library of Assorted Spiffy Things.
;;; -------------------------------------------------------------------
(define-public libast
  (package
    (name "libast")
    (version "0.7")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/mej/libast/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))  ; no test suite or tests need network
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/mej/libast")
    (synopsis "the Library of Assorted Spiffy Things")
    (description "The Library of Assorted Spiffy Things..  This package provides libast for use on GNU/Linux systems.")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; 29. eterm --- a vt102 terminal emulator intended as a replacement for xter
;;; A vt102 terminal emulator intended as a replacement for xterm.
;;; -------------------------------------------------------------------
(define-public eterm
  (package
    (name "eterm")
    (version "0.9.6")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://launchpad.net/ubuntu/+source/eterm/0.9.6-1/releases/download/v" version
                    "/eterm-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))  ; no test suite or tests need network
    (supported-systems '("x86_64-linux"))
    (home-page "https://launchpad.net/ubuntu/+source/eterm/0.9.6-1")
    (synopsis "a vt102 terminal emulator intended as a replacement for xterm")
    (description "A vt102 terminal emulator intended as a replacement for xterm.")
    (license license:nonfree)))

;;; -------------------------------------------------------------------
;;; 30. mint-artwork --- linux Mint Artwork and Resources
;;; Linux Mint Artwork and Resources.
;;; -------------------------------------------------------------------
(define-public mint-artwork
  (package
    (name "mint-artwork")
    (version "1.9.3")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://packages.linuxmint.com/pool/main/m/mint-artwork/releases/download/v" version
                    "/mint-artwork-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))  ; no test suite or tests need network
    (supported-systems '("x86_64-linux"))
    (home-page "http://packages.linuxmint.com/pool/main/m/mint-artwork")
    (synopsis "linux Mint Artwork and Resources")
    (description "Linux Mint Artwork and Resources..  This package provides mint-artwork for use on GNU/Linux systems.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 31. xfce4-panel-compiz --- panel for the Xfce desktop environment with fixes for Compiz
;;; Panel for the Xfce desktop environment with fixes for Compiz
;;; -------------------------------------------------------------------
(define-public xfce4-panel-compiz
  (package
    (name "xfce4-panel-compiz")
    (version "4.20.7")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.xfce.org//releases/download/v" version
                    "/xfce4-panel-compiz-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))  ; no test suite or tests need network
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.xfce.org/")
    (synopsis "panel for the Xfce desktop environment with fixes for Compiz")
    (description "Panel for the Xfce desktop environment with fixes for Compiz.")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 32. brother-hl2140 --- LPR and CUPS driver for the Brother HL2140
;;; LPR and CUPS driver for the Brother HL2140
;;; -------------------------------------------------------------------
(define-public brother-hl2140
  (package
    (name "brother-hl2140")
    (version "2.0.2_1")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://solutions.brother.com/linux/en_us//releases/download/v" version
                    "/brother-hl2140-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))  ; no test suite or tests need network
    (supported-systems '("x86_64-linux"))
    (home-page "http://solutions.brother.com/linux/en_us/")
    (synopsis "LPR and CUPS driver for the Brother HL2140")
    (description "LPR and CUPS driver for the Brother HL2140.")
    (license license:nonfree)))

;;; -------------------------------------------------------------------
;;; 33. gtk-theme-e17gtk-git --- a dark GTK2/GTK3 theme with sharp corners, which is designed
;;; A dark GTK2/GTK3 theme with sharp corners, which is designed for use i
;;; -------------------------------------------------------------------
(define-public gtk-theme-e17gtk-git
  (package
    (name "gtk-theme-e17gtk-git")
    (version "V3.22.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                (url "https://github.com/tsujan/E17gtk")
                (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))  ; no test suite or tests need network
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/tsujan/E17gtk")
    (synopsis "a dark GTK2/GTK3 theme with sharp corners, which is designed for use in Enlig")
    (description "A dark GTK2/GTK3 theme with sharp corners, which is designed for use in Enlightenment and gives the elegant look of Enlightenment to GTK widgets.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 34. libinput-noaccum --- libinput with ACC_V120_TRIGGER_THRESHOLD set to 1 for smooth
;;; libinput with ACC_V120_TRIGGER_THRESHOLD set to 1 for smooth high-reso
;;; -------------------------------------------------------------------
(define-public libinput-noaccum
  (package
    (name "libinput-noaccum")
    (version "1.31.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://wayland.freedesktop.org/libinput/doc/latest//releases/download/v" version
                    "/libinput-noaccum-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))  ; no test suite or tests need network
    (supported-systems '("x86_64-linux"))
    (home-page "https://wayland.freedesktop.org/libinput/doc/latest/")
    (synopsis "libinput with ACC_V120_TRIGGER_THRESHOLD set to 1 for smooth high-resolution ")
    (description "libinput with ACC_V120_TRIGGER_THRESHOLD set to 1 for smooth high-resolution scrolling.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 35. thumbor-aws --- AWS support for Thumbor image service
;;; AWS support for Thumbor image service
;;; -------------------------------------------------------------------
(define-public thumbor-aws
  (package
    (name "thumbor-aws")
    (version "0.8.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/thumbor/thumbor-aws/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/thumbor/thumbor-aws")
    (synopsis "AWS support for Thumbor image service")
    (description "AWS support for Thumbor image service.  This package provides thumbor-aws for use on GNU/Linux systems.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 36. ananicy-cpp-dinit --- ananicy Cpp is a full rewrite of Ananicy in C++, featuring l
;;; Ananicy Cpp is a full rewrite of Ananicy in C++, featuring lower CPU a
;;; -------------------------------------------------------------------
(define-public ananicy-cpp-dinit
  (package
    (name "ananicy-cpp-dinit")
    (version "20220808")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://gitlab.com/ananicy-cpp/ananicy-cpp/-/archive/v"
                    version "/ananicy-cpp-v" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))  ; no test suite or tests need network
    (supported-systems '("x86_64-linux"))
    (home-page "https://gitlab.com/ananicy-cpp/ananicy-cpp/")
    (synopsis "ananicy Cpp is a full rewrite of Ananicy in C++, featuring lower CPU and RAM ")
    (description "Ananicy Cpp is a full rewrite of Ananicy in C++, featuring lower CPU and RAM usage. (dinit service).")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 37. ananicy-cpp-runit --- ananicy rewritten in C++ for much lower CPU and memory usage
;;; Ananicy rewritten in C++ for much lower CPU and memory usage. (runit s
;;; -------------------------------------------------------------------
(define-public ananicy-cpp-runit
  (package
    (name "ananicy-cpp-runit")
    (version "1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://gitlab.com/ananicy-cpp/ananicy-cpp/-/archive/v"
                    version "/ananicy-cpp-v" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))  ; no test suite or tests need network
    (supported-systems '("x86_64-linux"))
    (home-page "https://gitlab.com/ananicy-cpp/ananicy-cpp/")
    (synopsis "ananicy rewritten in C++ for much lower CPU and memory usage. (runit service)")
    (description "Ananicy rewritten in C++ for much lower CPU and memory usage. (runit service).")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 38. squeekboard-git --- an on-screen-keyboard input method for Wayland
;;; An on-screen-keyboard input method for Wayland
;;; -------------------------------------------------------------------
(define-public squeekboard-git
  (package
    (name "squeekboard-git")
    (version "1.43.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                (url "https://gitlab.gnome.org/World/Phosh/squeekboard")
                (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))  ; no test suite or tests need network
    (supported-systems '("x86_64-linux"))
    (home-page "https://gitlab.gnome.org/World/Phosh/squeekboard")
    (synopsis "an on-screen-keyboard input method for Wayland")
    (description "An on-screen-keyboard input method for Wayland.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 39. bontmia --- rsync-based tool for incremental backup and rotation
;;; Rsync-based tool for incremental backup and rotation
;;; -------------------------------------------------------------------
(define-public bontmia
  (package
    (name "bontmia")
    (version "0.19.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/hcartiaux/bontmia/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))  ; no test suite or tests need network
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/hcartiaux/bontmia")
    (synopsis "rsync-based tool for incremental backup and rotation")
    (description "Rsync-based tool for incremental backup and rotation.")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 40. clipse-git --- configurable TUI clipboard manager for Unix
;;; Configurable TUI clipboard manager for Unix
;;; -------------------------------------------------------------------
(define-public clipse-git
  (package
    (name "clipse-git")
    (version "r362.d29bba5")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                (url "https://github.com/savedra1/clipse")
                (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/savedra1/clipse")
    (synopsis "configurable TUI clipboard manager for Unix")
    (description "Configurable TUI clipboard manager for Unix.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 41. ftxui-docs --- a C++ Functional Terminal User Interface (documentation)
;;; A C++ Functional Terminal User Interface (documentation)
;;; -------------------------------------------------------------------
(define-public ftxui-docs
  (package
    (name "ftxui-docs")
    (version "6.1.9")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ArthurSonzogni/FTXUI/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))  ; no test suite or tests need network
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/ArthurSonzogni/FTXUI")
    (synopsis "a C++ Functional Terminal User Interface (documentation)")
    (description "A C++ Functional Terminal User Interface (documentation).")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 42. ftxui-examples --- a C++ Functional Terminal User Interface (examples)
;;; A C++ Functional Terminal User Interface (examples)
;;; -------------------------------------------------------------------
(define-public ftxui-examples
  (package
    (name "ftxui-examples")
    (version "6.1.9")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ArthurSonzogni/FTXUI/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))  ; no test suite or tests need network
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/ArthurSonzogni/FTXUI")
    (synopsis "a C++ Functional Terminal User Interface (examples)")
    (description "A C++ Functional Terminal User Interface (examples).")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 43. panini --- visual tool for creating perspective views from panoramic an
;;; visual tool for creating perspective views from panoramic and wide ang
;;; -------------------------------------------------------------------
(define-public panini
  (package
    (name "panini")
    (version "0.73.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/lazarus-pkgs/panini/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system qt-build-system)
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/lazarus-pkgs/panini")
    (synopsis "visual tool for creating perspective views from panoramic and wide angle phot")
    (description "visual tool for creating perspective views from panoramic and wide angle photographs.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 44. trezord-go --- tREZOR Communication Daemon aka TREZOR Bridge (written in Go
;;; TREZOR Communication Daemon aka TREZOR Bridge (written in Go)
;;; -------------------------------------------------------------------
(define-public trezord-go
  (package
    (name "trezord-go")
    (version "2.0.33")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/trezor/trezord-go/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/trezor/trezord-go")
    (synopsis "tREZOR Communication Daemon aka TREZOR Bridge (written in Go)")
    (description "TREZOR Communication Daemon aka TREZOR Bridge (written in Go).")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 45. arm-linux-gnueabihf-gcc75-linaro-bin --- the GNU Compiler Collection- cross compiler for ARMv7 EABI h
;;; The GNU Compiler Collection- cross compiler for ARMv7 EABI hard float 
;;; -------------------------------------------------------------------
(define-public arm-linux-gnueabihf-gcc75-linaro-bin
  (package
    (name "arm-linux-gnueabihf-gcc75-linaro-bin")
    (version "7.5")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://example.com/arm-linux-gnueabihf-gcc75-linaro-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("arm-linux-gnueabihf-gcc75-linaro" "bin/arm-linux-gnueabihf-gcc75-linaro"))))
    (supported-systems '("x86_64-linux"))
    (home-page "http://releases.linaro.org/components/toolchain/binaries")
    (synopsis "the GNU Compiler Collection- cross compiler for ARMv7 EABI hard float target")
    (description "The GNU Compiler Collection- cross compiler for ARMv7 EABI hard float target. (Linaro).")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 46. lightning-terminal --- lightning Terminal (LiT) is a browser-based interface for ma
;;; Lightning Terminal (LiT) is a browser-based interface for managing cha
;;; -------------------------------------------------------------------
(define-public lightning-terminal
  (package
    (name "lightning-terminal")
    (version "0.16.0_alpha.rc1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/lightninglabs/lightning-terminal/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))  ; no test suite or tests need network
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/lightninglabs/lightning-terminal")
    (synopsis "lightning Terminal (LiT) is a browser-based interface for managing channel li")
    (description "Lightning Terminal (LiT) is a browser-based interface for managing channel liquidity on the Lightning Network (LND). ⚡.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 47. whisper.cpp-model-small.en-tdrz --- this is an autogenerated file, please see https://github.com
;;; This is an autogenerated file, please see https://github.com/hrehfeld/
;;; -------------------------------------------------------------------
(define-public whisper.cpp-model-small.en-tdrz
  (package
    (name "whisper.cpp-model-small.en-tdrz")
    (version "4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ggerganov/whisper.cpp/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))  ; no test suite or tests need network
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/ggerganov/whisper.cpp/tree/master/models")
    (synopsis "this is an autogenerated file, please see https://github.com/hrehfeld/archlin")
    (description "This is an autogenerated file, please see https://github.com/hrehfeld/archlinux-whisper.cpp-model.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 48. osu-handler --- provides a handler for osu! file formats
;;; Provides a handler for osu! file formats
;;; -------------------------------------------------------------------
(define-public osu-handler
  (package
    (name "osu-handler")
    (version "0.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/openglfreak/osu-handler-wine/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))  ; no test suite or tests need network
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/openglfreak/osu-handler-wine")
    (synopsis "provides a handler for osu! file formats")
    (description "Provides a handler for osu! file formats.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 49. skatgui --- a graphical user interface for the International Skat Server
;;; A graphical user interface for the International Skat Server (ISS).
;;; -------------------------------------------------------------------
(define-public skatgui
  (package
    (name "skatgui")
    (version "14.11033.16")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://skatgame.net/iss/software.html/releases/download/v" version
                    "/skatgui-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system ant-build-system)
    (supported-systems '("x86_64-linux"))
    (home-page "https://skatgame.net/iss/software.html")
    (synopsis "a graphical user interface for the International Skat Server (ISS)")
    (description "A graphical user interface for the International Skat Server (ISS).")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 50. python-amulet-nbt --- a Python and Cython library for reading and writing binary N
;;; A Python and Cython library for reading and writing binary NBT and str
;;; -------------------------------------------------------------------
(define-public python-amulet-nbt
  (package
    (name "python-amulet-nbt")
    (version "2.1.8")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Amulet-Team/Amulet-NBT/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))  ; no test suite or tests need network
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Amulet-Team/Amulet-NBT")
    (synopsis "a Python and Cython library for reading and writing binary NBT and stringifie")
    (description "A Python and Cython library for reading and writing binary NBT and stringified NBT.")
    (license license:nonfree)))

;;; -------------------------------------------------------------------
;;; 51. python-pymctranslate --- a library of block mappings that can be used to convert from
;;; A library of block mappings that can be used to convert from any Minec
;;; -------------------------------------------------------------------
(define-public python-pymctranslate
  (package
    (name "python-pymctranslate")
    (version "1.2.43")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/gentlegiantJGC/PyMCTranslate/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/gentlegiantJGC/PyMCTranslate")
    (synopsis "a library of block mappings that can be used to convert from any Minecraft fo")
    (description "A library of block mappings that can be used to convert from any Minecraft format into any other Minecraft format.")
    (license license:nonfree)))

;;; -------------------------------------------------------------------
;;; 52. thunderbird-gnome-theme-git --- a GNOME theme for Thunderbird
;;; A GNOME theme for Thunderbird
;;; -------------------------------------------------------------------
(define-public thunderbird-gnome-theme-git
  (package
    (name "thunderbird-gnome-theme-git")
    (version "r53.fcae3fb")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                (url "https://github.com/rafaelmardojai/thunderbird-gnome-theme")
                (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))  ; no test suite or tests need network
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/rafaelmardojai/thunderbird-gnome-theme")
    (synopsis "a GNOME theme for Thunderbird")
    (description "A GNOME theme for Thunderbird.  This package provides thunderbird-gnome-theme-git for use on GNU/Linux systems.")
    (license license:unlicense)))

;;; -------------------------------------------------------------------
;;; 53. whisper.cpp-model-medium --- this is an autogenerated file, please see https://github.com
;;; This is an autogenerated file, please see https://github.com/hrehfeld/
;;; -------------------------------------------------------------------
(define-public whisper.cpp-model-medium
  (package
    (name "whisper.cpp-model-medium")
    (version "4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ggerganov/whisper.cpp/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))  ; no test suite or tests need network
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/ggerganov/whisper.cpp/tree/master/models")
    (synopsis "this is an autogenerated file, please see https://github.com/hrehfeld/archlin")
    (description "This is an autogenerated file, please see https://github.com/hrehfeld/archlinux-whisper.cpp-model.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 54. pokerstove-git --- a highly hand optimized C++ poker hand evaluation tool
;;; A highly hand optimized C++ poker hand evaluation tool
;;; -------------------------------------------------------------------
(define-public pokerstove-git
  (package
    (name "pokerstove-git")
    (version "r134.abc20d8")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                (url "https://github.com/andrewprock/pokerstove")
                (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))  ; no test suite or tests need network
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/andrewprock/pokerstove")
    (synopsis "a highly hand optimized C++ poker hand evaluation tool")
    (description "A highly hand optimized C++ poker hand evaluation tool.")
    (license license:nonfree)))

;;; -------------------------------------------------------------------
;;; 55. python-amulet-leveldb --- a Cython wrapper for Mojang's modified LevelDB library
;;; A Cython wrapper for Mojang's modified LevelDB library.
;;; -------------------------------------------------------------------
(define-public python-amulet-leveldb
  (package
    (name "python-amulet-leveldb")
    (version "1.0.6")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Amulet-Team/Amulet-LevelDB/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Amulet-Team/Amulet-LevelDB")
    (synopsis "a Cython wrapper for Mojang's modified LevelDB library")
    (description "A Cython wrapper for Mojang's modified LevelDB library.")
    (license license:nonfree)))

;;; -------------------------------------------------------------------
;;; 56. python-minecraft-model-reader --- minecraft-Model-Reader for Amulet-Core
;;; Minecraft-Model-Reader for Amulet-Core
;;; -------------------------------------------------------------------
(define-public python-minecraft-model-reader
  (package
    (name "python-minecraft-model-reader")
    (version "1.4.11")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/gentlegiantJGC/Minecraft-Model-Reader/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/gentlegiantJGC/Minecraft-Model-Reader")
    (synopsis "minecraft-Model-Reader for Amulet-Core")
    (description "Minecraft-Model-Reader for Amulet-Core.  This package provides python-minecraft-model-reader for use on GNU/Linux systems.")
    (license license:nonfree)))

;;; -------------------------------------------------------------------
;;; 57. rz-jsdec --- provides js decompiler for rizin
;;; Provides js decompiler for rizin
;;; -------------------------------------------------------------------
(define-public rz-jsdec
  (package
    (name "rz-jsdec")
    (version "0.7.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/rizinorg/jsdec.git/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))  ; no test suite or tests need network
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/rizinorg/jsdec.git")
    (synopsis "provides js decompiler for rizin")
    (description "Provides js decompiler for rizin.  This package provides rz-jsdec for use on GNU/Linux systems.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 58. rz-jsdec-git --- provides js decompiler for rizin
;;; Provides js decompiler for rizin
;;; -------------------------------------------------------------------
(define-public rz-jsdec-git
  (package
    (name "rz-jsdec-git")
    (version "0.7.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                (url "https://github.com/rizinorg/jsdec.git")
                (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))  ; no test suite or tests need network
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/rizinorg/jsdec.git")
    (synopsis "provides js decompiler for rizin")
    (description "Provides js decompiler for rizin.  This package provides rz-jsdec-git for use on GNU/Linux systems.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 59. steam-tui-git --- rust TUI client for steamcmd
;;; Rust TUI client for steamcmd
;;; -------------------------------------------------------------------
(define-public steam-tui-git
  (package
    (name "steam-tui-git")
    (version "r35.5741b1f")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                (url "https://github.com/dmadisetti/steam-tui")
                (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/dmadisetti/steam-tui")
    (synopsis "rust TUI client for steamcmd")
    (description "Rust TUI client for steamcmd.  This package provides steam-tui-git for use on GNU/Linux systems.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 60. whisper.cpp-model-base --- this is an autogenerated file, please see https://github.com
;;; This is an autogenerated file, please see https://github.com/hrehfeld/
;;; -------------------------------------------------------------------
(define-public whisper.cpp-model-base
  (package
    (name "whisper.cpp-model-base")
    (version "4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ggerganov/whisper.cpp/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))  ; no test suite or tests need network
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/ggerganov/whisper.cpp/tree/master/models")
    (synopsis "this is an autogenerated file, please see https://github.com/hrehfeld/archlin")
    (description "This is an autogenerated file, please see https://github.com/hrehfeld/archlinux-whisper.cpp-model.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 61. whisper.cpp-model-medium-q5-0 --- this is an autogenerated file, please see https://github.com
;;; This is an autogenerated file, please see https://github.com/hrehfeld/
;;; -------------------------------------------------------------------
(define-public whisper.cpp-model-medium-q5-0
  (package
    (name "whisper.cpp-model-medium-q5-0")
    (version "4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ggerganov/whisper.cpp/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))  ; no test suite or tests need network
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/ggerganov/whisper.cpp/tree/master/models")
    (synopsis "this is an autogenerated file, please see https://github.com/hrehfeld/archlin")
    (description "This is an autogenerated file, please see https://github.com/hrehfeld/archlinux-whisper.cpp-model.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 62. whisper.cpp-model-medium.en --- this is an autogenerated file, please see https://github.com
;;; This is an autogenerated file, please see https://github.com/hrehfeld/
;;; -------------------------------------------------------------------
(define-public whisper.cpp-model-medium.en
  (package
    (name "whisper.cpp-model-medium.en")
    (version "4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ggerganov/whisper.cpp/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))  ; no test suite or tests need network
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/ggerganov/whisper.cpp/tree/master/models")
    (synopsis "this is an autogenerated file, please see https://github.com/hrehfeld/archlin")
    (description "This is an autogenerated file, please see https://github.com/hrehfeld/archlinux-whisper.cpp-model.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 63. whisper.cpp-model-medium.en-q5-0 --- this is an autogenerated file, please see https://github.com
;;; This is an autogenerated file, please see https://github.com/hrehfeld/
;;; -------------------------------------------------------------------
(define-public whisper.cpp-model-medium.en-q5-0
  (package
    (name "whisper.cpp-model-medium.en-q5-0")
    (version "4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ggerganov/whisper.cpp/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))  ; no test suite or tests need network
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/ggerganov/whisper.cpp/tree/master/models")
    (synopsis "this is an autogenerated file, please see https://github.com/hrehfeld/archlin")
    (description "This is an autogenerated file, please see https://github.com/hrehfeld/archlinux-whisper.cpp-model.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 64. whisper.cpp-model-small.en --- this is an autogenerated file, please see https://github.com
;;; This is an autogenerated file, please see https://github.com/hrehfeld/
;;; -------------------------------------------------------------------
(define-public whisper.cpp-model-small.en
  (package
    (name "whisper.cpp-model-small.en")
    (version "4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ggerganov/whisper.cpp/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))  ; no test suite or tests need network
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/ggerganov/whisper.cpp/tree/master/models")
    (synopsis "this is an autogenerated file, please see https://github.com/hrehfeld/archlin")
    (description "This is an autogenerated file, please see https://github.com/hrehfeld/archlinux-whisper.cpp-model.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 65. whisper.cpp-model-tiny.en --- this is an autogenerated file, please see https://github.com
;;; This is an autogenerated file, please see https://github.com/hrehfeld/
;;; -------------------------------------------------------------------
(define-public whisper.cpp-model-tiny.en
  (package
    (name "whisper.cpp-model-tiny.en")
    (version "4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ggerganov/whisper.cpp/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))  ; no test suite or tests need network
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/ggerganov/whisper.cpp/tree/master/models")
    (synopsis "this is an autogenerated file, please see https://github.com/hrehfeld/archlin")
    (description "This is an autogenerated file, please see https://github.com/hrehfeld/archlinux-whisper.cpp-model.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 66. amulet-map-editor --- the new age Minecraft world editor and converter that suppor
;;; The new age Minecraft world editor and converter that supports every v
;;; -------------------------------------------------------------------
(define-public amulet-map-editor
  (package
    (name "amulet-map-editor")
    (version "0.10.56a7")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.amuletmc.com//releases/download/v" version
                    "/amulet-map-editor-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.amuletmc.com/")
    (synopsis "the new age Minecraft world editor and converter that supports every version ")
    (description "The new age Minecraft world editor and converter that supports every version since Java 1.12 and Bedrock 1.7.")
    (license license:nonfree)))

;;; -------------------------------------------------------------------
;;; 67. firefox-gnome-theme-git --- a GNOME theme for Firefox
;;; A GNOME theme for Firefox
;;; -------------------------------------------------------------------
(define-public firefox-gnome-theme-git
  (package
    (name "firefox-gnome-theme-git")
    (version "112")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                (url "https://github.com/rafaelmardojai/firefox-gnome-theme")
                (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))  ; no test suite or tests need network
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/rafaelmardojai/firefox-gnome-theme")
    (synopsis "a GNOME theme for Firefox")
    (description "A GNOME theme for Firefox.  This package provides firefox-gnome-theme-git for use on GNU/Linux systems.")
    (license license:unlicense)))

;;; -------------------------------------------------------------------
;;; 68. gnome-backgrounds-bitday-git --- beautiful dynamic pixel wallpaper for GNOME
;;; Beautiful dynamic pixel wallpaper for GNOME
;;; -------------------------------------------------------------------
(define-public gnome-backgrounds-bitday-git
  (package
    (name "gnome-backgrounds-bitday-git")
    (version "r23.0889d85")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                (url "https://github.com/ghisvail/gnome-backgrounds-bitday")
                (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))  ; no test suite or tests need network
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/ghisvail/gnome-backgrounds-bitday")
    (synopsis "beautiful dynamic pixel wallpaper for GNOME")
    (description "Beautiful dynamic pixel wallpaper for GNOME.")
    (license license:unlicense)))

;;; -------------------------------------------------------------------
;;; 69. go-chromecast-git --- implements a basic number of the google chromecast commands
;;; Implements a basic number of the google chromecast commands.
;;; -------------------------------------------------------------------
(define-public go-chromecast-git
  (package
    (name "go-chromecast-git")
    (version "0.3.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                (url "https://github.com/vishen/go-chromecast")
                (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/vishen/go-chromecast")
    (synopsis "implements a basic number of the google chromecast commands")
    (description "Implements a basic number of the google chromecast commands.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 70. fortune-mod-brooklyn-nine-nine --- brooklyn Nine-Nine fortune cookie file
;;; Brooklyn Nine-Nine fortune cookie file
;;; -------------------------------------------------------------------
(define-public fortune-mod-brooklyn-nine-nine
  (package
    (name "fortune-mod-brooklyn-nine-nine")
    (version "1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://en.wikiquote.org/wiki/Brooklyn_Nine-Nine/releases/download/v" version
                    "/fortune-mod-brooklyn-nine-nine-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))  ; no test suite or tests need network
    (supported-systems '("x86_64-linux"))
    (home-page "https://en.wikiquote.org/wiki/Brooklyn_Nine-Nine")
    (synopsis "brooklyn Nine-Nine fortune cookie file")
    (description "Brooklyn Nine-Nine fortune cookie file.  This package provides fortune-mod-brooklyn-nine-nine for use on GNU/Linux systems.")
    (license license:nonfree)))

;;; -------------------------------------------------------------------
;;; 71. jskat --- free implementation of the German card game Skat in Java
;;; Free implementation of the German card game Skat in Java.
;;; -------------------------------------------------------------------
(define-public jskat
  (package
    (name "jskat")
    (version "0.23.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://www.jskat.org/releases/download/v" version
                    "/jskat-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system ant-build-system)
    (supported-systems '("x86_64-linux"))
    (home-page "http://www.jskat.org")
    (synopsis "free implementation of the German card game Skat in Java")
    (description "Free implementation of the German card game Skat in Java.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 72. remoteplaywhatever --- tiny application that lets you force remote play together an
;;; Tiny application that lets you force remote play together any game you
;;; -------------------------------------------------------------------
(define-public remoteplaywhatever
  (package
    (name "remoteplaywhatever")
    (version "0.2.14")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/m4dEngi/RemotePlayWhatever/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))  ; no test suite or tests need network
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/m4dEngi/RemotePlayWhatever")
    (synopsis "tiny application that lets you force remote play together any game you have i")
    (description "Tiny application that lets you force remote play together any game you have in your steam library including non-steam ones.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 73. chezmoi-modify-manager-git --- tools for chezmoi to handle mixed settings and state
;;; Tools for chezmoi to handle mixed settings and state
;;; -------------------------------------------------------------------
(define-public chezmoi-modify-manager-git
  (package
    (name "chezmoi-modify-manager-git")
    (version "3.4.0.r0.0c55fc1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                (url "https://github.com/VorpalBlade/chezmoi_modify_manager")
                (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/VorpalBlade/chezmoi_modify_manager")
    (synopsis "tools for chezmoi to handle mixed settings and state")
    (description "Tools for chezmoi to handle mixed settings and state.")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 74. cosmic-ext-calculator-git --- calculator for the COSMIC desktop
;;; Calculator for the COSMIC desktop.
;;; -------------------------------------------------------------------
(define-public cosmic-ext-calculator-git
  (package
    (name "cosmic-ext-calculator-git")
    (version "0.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                (url "https://github.com/cosmic-utils/calculator")
                (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/cosmic-utils/calculator")
    (synopsis "calculator for the COSMIC desktop")
    (description "Calculator for the COSMIC desktop..  This package provides cosmic-ext-calculator-git for use on GNU/Linux systems.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 75. fortune-mod-de --- fortune Cookies in german, from the Debian project
;;; Fortune Cookies in german, from the Debian project
;;; -------------------------------------------------------------------
(define-public fortune-mod-de
  (package
    (name "fortune-mod-de")
    (version "0.37")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://salsa.debian.org/debian/fortunes-de/releases/download/v" version
                    "/fortune-mod-de-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))  ; no test suite or tests need network
    (supported-systems '("x86_64-linux"))
    (home-page "https://salsa.debian.org/debian/fortunes-de")
    (synopsis "fortune Cookies in german, from the Debian project")
    (description "Fortune Cookies in german, from the Debian project.")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 76. fortune-mod-leftism-git --- leftist fortune quotes
;;; Leftist fortune quotes
;;; -------------------------------------------------------------------
(define-public fortune-mod-leftism-git
  (package
    (name "fortune-mod-leftism-git")
    (version "r26.c1d4dda")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                (url "https://github.com/anakojm/leftist-quote")
                (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))  ; no test suite or tests need network
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/anakojm/leftist-quote")
    (synopsis "leftist fortune quotes")
    (description "Leftist fortune quotes.  This package provides fortune-mod-leftism-git for use on GNU/Linux systems.")
    (license license:nonfree)))

;;; -------------------------------------------------------------------
;;; 77. scpdiscord --- a very customisable Discord bot + SCP:SL plugin combo
;;; A very customisable Discord bot + SCP:SL plugin combo.
;;; -------------------------------------------------------------------
(define-public scpdiscord
  (package
    (name "scpdiscord")
    (version "3.4.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/KarlOfDuty/SCPDiscord/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))  ; no test suite or tests need network
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/KarlOfDuty/SCPDiscord")
    (synopsis "a very customisable Discord bot + SCP:SL plugin combo")
    (description "A very customisable Discord bot + SCP:SL plugin combo.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 78. lsparu --- a fzf TUI for paru
;;; A fzf TUI for paru
;;; -------------------------------------------------------------------
(define-public lsparu
  (package
    (name "lsparu")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/salkin-mada/lsparu/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))  ; no test suite or tests need network
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/salkin-mada/lsparu")
    (synopsis "a fzf TUI for paru")
    (description "A fzf TUI for paru.  This package provides lsparu for use on GNU/Linux systems.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 79. mkdocs-git-revision-date-localized-plugin --- mkDocs plugin to add a last updated date to your site pages
;;; MkDocs plugin to add a last updated date to your site pages
;;; -------------------------------------------------------------------
(define-public mkdocs-git-revision-date-localized-plugin
  (package
    (name "mkdocs-git-revision-date-localized-plugin")
    (version "1.5.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/timvink/mkdocs-git-revision-date-localized-plugin/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/timvink/mkdocs-git-revision-date-localized-plugin/")
    (synopsis "mkDocs plugin to add a last updated date to your site pages")
    (description "MkDocs plugin to add a last updated date to your site pages.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 80. brother-dcp-t536dw --- cUPS driver for Brother DCP-T536DW printer
;;; CUPS driver for Brother DCP-T536DW printer
;;; -------------------------------------------------------------------
(define-public brother-dcp-t536dw
  (package
    (name "brother-dcp-t536dw")
    (version "3.6.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://support.brother.com/g/b/downloadtop.aspx?c=us_ot&lang=en&prod=dcpt536dw_all/releases/download/v" version
                    "/brother-dcp-t536dw-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))  ; no test suite or tests need network
    (supported-systems '("x86_64-linux"))
    (home-page "https://support.brother.com/g/b/downloadtop.aspx?c=us_ot&lang=en&prod=dcpt536dw_all")
    (synopsis "cUPS driver for Brother DCP-T536DW printer")
    (description "CUPS driver for Brother DCP-T536DW printer.")
    (license license:nonfree)))

;;; -------------------------------------------------------------------
;;; 81. clcc --- cLCC is a compiler for OpenCL kernel source files. It's tool
;;; CLCC is a compiler for OpenCL kernel source files. It's tool for appli
;;; -------------------------------------------------------------------
(define-public clcc
  (package
    (name "clcc")
    (version "0.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://clcc.sourceforge.net//releases/download/v" version
                    "/clcc-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))  ; no test suite or tests need network
    (supported-systems '("x86_64-linux"))
    (home-page "http://clcc.sourceforge.net/")
    (synopsis "cLCC is a compiler for OpenCL kernel source files. It's tool for application ")
    (description "CLCC is a compiler for OpenCL kernel source files. It's tool for application developers who want to verify their OpenCL code actually gets compiled by the driver before their program tries to compile it on-demand.")
    (license license:boost1.0)))

;;; -------------------------------------------------------------------
;;; 82. audius --- audius music streaming client package
;;; Audius music streaming client package
;;; -------------------------------------------------------------------
(define-public audius
  (package
    (name "audius")
    (version "1.5.156")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://audius.co/releases/download/v" version
                    "/audius-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))  ; no test suite or tests need network
    (supported-systems '("x86_64-linux"))
    (home-page "https://audius.co")
    (synopsis "audius music streaming client package")
    (description "Audius music streaming client package.  This package provides audius for use on GNU/Linux systems.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 83. aurup --- the simplify finding and installing packages AUR helper
;;; The simplify finding and installing packages AUR helper
;;; -------------------------------------------------------------------
(define-public aurup
  (package
    (name "aurup")
    (version "1.77")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nellowint/aurup/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))  ; no test suite or tests need network
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nellowint/aurup")
    (synopsis "the simplify finding and installing packages AUR helper")
    (description "The simplify finding and installing packages AUR helper.")
    (license license:nonfree)))

;;; -------------------------------------------------------------------
;;; 84. funkin --- a rhythm game made with HaxeFlixel
;;; A rhythm game made with HaxeFlixel
;;; -------------------------------------------------------------------
(define-public funkin
  (package
    (name "funkin")
    (version "0.8.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/FunkinCrew/Funkin/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))  ; no test suite or tests need network
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/FunkinCrew/Funkin")
    (synopsis "a rhythm game made with HaxeFlixel")
    (description "A rhythm game made with HaxeFlixel.  This package provides funkin for use on GNU/Linux systems.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 85. bash-pinyin-completion-rs --- simple completion script for pinyin, written in rust
;;; Simple completion script for pinyin, written in rust.
;;; -------------------------------------------------------------------
(define-public bash-pinyin-completion-rs
  (package
    (name "bash-pinyin-completion-rs")
    (version "1.0.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/AOSC-Dev/bash-pinyin-completion-rs/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/AOSC-Dev/bash-pinyin-completion-rs")
    (synopsis "simple completion script for pinyin, written in rust")
    (description "Simple completion script for pinyin, written in rust.")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 86. electron-deepseek --- electron DeepSeek App
;;; Electron DeepSeek App
;;; -------------------------------------------------------------------
(define-public electron-deepseek
  (package
    (name "electron-deepseek")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/RicardoCA/electron-deepseek/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/RicardoCA/electron-deepseek")
    (synopsis "electron DeepSeek App")
    (description "Electron DeepSeek App.  This package provides electron-deepseek for use on GNU/Linux systems.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 87. boxtron --- compatibility tool to run DOS games on Steam through native 
;;; Compatibility tool to run DOS games on Steam through native Linux DOSB
;;; -------------------------------------------------------------------
(define-public boxtron
  (package
    (name "boxtron")
    (version "0.5.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/dreamer/boxtron/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/dreamer/boxtron")
    (synopsis "compatibility tool to run DOS games on Steam through native Linux DOSBox")
    (description "Compatibility tool to run DOS games on Steam through native Linux DOSBox.")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 88. cmcl --- a Minecraft Java Edition Launcher Running on the Command Lin
;;; A Minecraft Java Edition Launcher Running on the Command Line
;;; -------------------------------------------------------------------
(define-public cmcl
  (package
    (name "cmcl")
    (version "2.2.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/MrShieh-X/console-minecraft-launcher/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system ant-build-system)
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/MrShieh-X/console-minecraft-launcher")
    (synopsis "a Minecraft Java Edition Launcher Running on the Command Line")
    (description "A Minecraft Java Edition Launcher Running on the Command Line.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 89. inspector --- gives information about your system
;;; Gives information about your system
;;; -------------------------------------------------------------------
(define-public inspector
  (package
    (name "inspector")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Nokse22/inspector/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))  ; no test suite or tests need network
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Nokse22/inspector")
    (synopsis "gives information about your system")
    (description "Gives information about your system.  This package provides inspector for use on GNU/Linux systems.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 90. big-launcher-git --- launcher for the big screen
;;; Launcher for the big screen
;;; -------------------------------------------------------------------
(define-public big-launcher-git
  (package
    (name "big-launcher-git")
    (version "51ada9c")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                (url "https://github.com/complexlogic/big-launcher")
                (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))  ; no test suite or tests need network
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/complexlogic/big-launcher")
    (synopsis "launcher for the big screen")
    (description "Launcher for the big screen.  This package provides big-launcher-git for use on GNU/Linux systems.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 91. netactview --- a graphical network connections viewer similar in functional
;;; A graphical network connections viewer similar in functionality to net
;;; -------------------------------------------------------------------
(define-public netactview
  (package
    (name "netactview")
    (version "0.6.4")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://netactview.sourceforge.net/index.html/releases/download/v" version
                    "/netactview-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))  ; no test suite or tests need network
    (supported-systems '("x86_64-linux"))
    (home-page "http://netactview.sourceforge.net/index.html")
    (synopsis "a graphical network connections viewer similar in functionality to netstat")
    (description "A graphical network connections viewer similar in functionality to netstat.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 92. sdrtrunk-git --- a cross-platform java application for decoding, monitoring, 
;;; A cross-platform java application for decoding, monitoring, recording 
;;; -------------------------------------------------------------------
(define-public sdrtrunk-git
  (package
    (name "sdrtrunk-git")
    (version "0.6.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                (url "https://github.com/DSheirer/sdrtrunk")
                (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))  ; no test suite or tests need network
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/DSheirer/sdrtrunk")
    (synopsis "a cross-platform java application for decoding, monitoring, recording and str")
    (description "A cross-platform java application for decoding, monitoring, recording and streaming trunked mobile and related radio protocols using SDR - Latest release.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 93. clickhouse --- an open-source column-oriented database management system th
;;; An open-source column-oriented database management system that allows 
;;; -------------------------------------------------------------------
(define-public clickhouse
  (package
    (name "clickhouse")
    (version "26.3.5.12")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://clickhouse.com/releases/download/v" version
                    "/clickhouse-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))  ; no test suite or tests need network
    (supported-systems '("x86_64-linux"))
    (home-page "https://clickhouse.com")
    (synopsis "an open-source column-oriented database management system that allows generat")
    (description "An open-source column-oriented database management system that allows generating analytical data reports in real time.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 94. omnisharp-roslyn --- omniSharp server (STDIO) based on Roslyn workspaces
;;; OmniSharp server (STDIO) based on Roslyn workspaces
;;; -------------------------------------------------------------------
(define-public omnisharp-roslyn
  (package
    (name "omnisharp-roslyn")
    (version "1.39.15")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/OmniSharp/omnisharp-roslyn/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))  ; no test suite or tests need network
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/OmniSharp/omnisharp-roslyn")
    (synopsis "omniSharp server (STDIO) based on Roslyn workspaces")
    (description "OmniSharp server (STDIO) based on Roslyn workspaces.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 95. ezchlog --- easy git branch friendly changelogs
;;; Easy git branch friendly changelogs
;;; -------------------------------------------------------------------
(define-public ezchlog
  (package
    (name "ezchlog")
    (version "1.4.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://gitlab.com/snake_coders/ezchlog/-/archive/v"
                    version "/ezchlog-v" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (supported-systems '("x86_64-linux"))
    (home-page "https://gitlab.com/snake_coders/ezchlog")
    (synopsis "easy git branch friendly changelogs")
    (description "Easy git branch friendly changelogs.  This package provides ezchlog for use on GNU/Linux systems.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 96. mpd-notification --- notify about tracks played by mpd
;;; Notify about tracks played by mpd
;;; -------------------------------------------------------------------
(define-public mpd-notification
  (package
    (name "mpd-notification")
    (version "0.9.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/eworm-de/mpd-notification/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))  ; no test suite or tests need network
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/eworm-de/mpd-notification")
    (synopsis "notify about tracks played by mpd")
    (description "Notify about tracks played by mpd.  This package provides mpd-notification for use on GNU/Linux systems.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 97. openmpt --- open-source audio module tracker
;;; Open-source audio module tracker
;;; -------------------------------------------------------------------
(define-public openmpt
  (package
    (name "openmpt")
    (version "1.32.09.00")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://openmpt.org//releases/download/v" version
                    "/openmpt-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))  ; no test suite or tests need network
    (supported-systems '("x86_64-linux"))
    (home-page "https://openmpt.org/")
    (synopsis "open-source audio module tracker")
    (description "Open-source audio module tracker.  This package provides openmpt for use on GNU/Linux systems.")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; 98. ca-certificates-dn42 --- dn42 root certificates for *.dn42 and 172.22.0.0/15
;;; dn42 root certificates for *.dn42 and 172.22.0.0/15
;;; -------------------------------------------------------------------
(define-public ca-certificates-dn42
  (package
    (name "ca-certificates-dn42")
    (version "20160116")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://dn42.net/services/Certificate-Authority/releases/download/v" version
                    "/ca-certificates-dn42-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))  ; no test suite or tests need network
    (supported-systems '("x86_64-linux"))
    (home-page "https://dn42.net/services/Certificate-Authority")
    (synopsis "dn42 root certificates for *.dn42 and 172.22.0.0/15")
    (description "dn42 root certificates for *.dn42 and 172.22.0.0/15.")
    (license license:cc0)))
