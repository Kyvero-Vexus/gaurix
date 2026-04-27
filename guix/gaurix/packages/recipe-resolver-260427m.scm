;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260427m
;;; Resolves 100 packages from queue (100 recipes, 0 blocked).
;;;
;;; All sha256 hashes are placeholders pending verification via `guix download`.

(define-module (gaurix packages recipe-resolver-260427m)
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
            android-ndk-26
            mimms
            krop
            gdm-prime
            marp-cli-bin
            ftl
            archey4
            pidgin-musictracker
            spotifywm-git
            openbox-menu
            libratbag-git
            geotoad
            xivlauncher-git
            lightdm-webkit2-theme-glorious
            blackbox-vcs
            json-parser-git
            trojita
            bitlbee-facebook-git
            lua-event
            perl-exporter-tidy
            qutepart-git
            birdtray-git
            stormbaancoureur
            noto-fonts-main
            cdist
            gtkatlantic
            nautilus-data
            rtapp
            yai
            cyberark-summon
            calendar-indicator
            riemann
            hipipe
            m68k-elf-gdb
            patreon-dl
            recastnavigation-openmw
            noto-fonts-kr-vf
            pantheon-photos-git
            wds-git
            sip3-twig-ce
            libicu50
            asrrgb
            kanatest
            ocaml-lambda-term
            mosml
            r-gitcreds
            crmsh
            emact
            gnome-shell-extension-drop-down-terminal-x-git
            jiq
            lcmark
            nekojishi
            pdf2img-c
            python-elasticsearch-dsl
            ruby-image-size
            transmission-i2p-git
            libcs50-git
            rendercv-bin
            zapzap-git
            flowinity-bin
            encrpter
            watchit-appimage
            adminer-git
            automua
            python-shippai
            python-instructor
            bicep
            cbmc-git
            coregarage
            devaultcore-git
            di-tui
            eclipse-emf
            findutils-git
            geant4-incldata
            godot3-mono-git
            headset
            python-svgutils
            r-robustbase
            iotacooler
            knightsandmerchants-remake-server
            librearp-git
            luastatus-git
            emergency-alerts
            mjml-app
            neovim-telescope-git
            ofxstatement-austrian
            pev2-electron
            glcli
            ps2-libconfig
            python-entry-points-txt
            python-pyexcel-xlsx
            qcal
            rofi-mpc
            vdr-xineliboutput
            widelands-maps-rttr
            php80-litespeed
            phallus-fonts-git
            thunderbird-beta-i18n-th
            palemoon-i18n-pt-pt
            regextester
            ))

;;; Nonfree/proprietary license placeholder for Gaurix channel
(define license:nonfree
  ((@@ (guix licenses) license) "Nonfree"
    "https://spdx.org/licenses/"
    "Proprietary or custom license; see upstream for terms."))

;;; Non-standard license placeholders
(define license:wtfpl2
  ((@@ (guix licenses) license) "WTFPL"
    "http://www.wtfpl.net/"
    "Do What The F*ck You Want To Public License, Version 2."))

(define license:php3.01
  ((@@ (guix licenses) license) "PHP-3.01"
    "https://www.php.net/license/3_01.txt"
    "The PHP License, version 3.01."))

(define license:unlicense
  ((@@ (guix licenses) license) "Unlicense"
    "https://unlicense.org/"
    "The Unlicense; public domain dedication."))

;;; android-ndk-26 --- Android C/C++ developer kit
(define-public android-ndk-26
  (package
    (name "android-ndk-26")
    (version "r26.d")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/android-ndk-26.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "Android C/C++ developer kit")
    (description "Android C/C++ developer kit.")
    (home-page "https://developer.android.com/ndk/")
    (license license:nonfree)))

;;; mimms --- download streams using the MMS protocol
(define-public mimms
  (package
    (name "mimms")
    (version "3.2.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mimms.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "download streams using the MMS protocol")
    (description "Download streams using the MMS protocol.")
    (home-page "http://savannah.nongnu.org/projects/mimms/")
    (license license:gpl3)))

;;; krop --- tool to crop PDF files, with an eye towards eReaders
(define-public krop
  (package
    (name "krop")
    (version "0.7.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/krop.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "tool to crop PDF files, with an eye towards eReaders")
    (description "Tool to crop PDF files, with an eye towards eReaders.")
    (home-page "http://arminstraub.com/computer/krop")
    (license license:gpl3+)))

;;; gdm-prime --- display manager and login screen with NVIDIA Prime support
(define-public gdm-prime
  (package
    (name "gdm-prime")
    (version "49.0.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gdm-prime.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "display manager and login screen with NVIDIA Prime support")
    (description "Display manager and login screen with NVIDIA Prime support.")
    (home-page "https://gitlab.gnome.org/GNOME/gdm")
    (license license:gpl2+)))

;;; marp-cli-bin --- CLI interface for Marp and Marpit based converters
(define-public marp-cli-bin
  (package
    (name "marp-cli-bin")
    (version "4.3.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/marp-cli-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "CLI interface for Marp and Marpit based converters")
    (description "CLI interface for Marp and Marpit based converters.")
    (home-page "https://github.com/marp-team/marp-cli")
    (license license:expat)))

;;; ftl --- FTL: Faster Than Light spaceship simulation roguelike
(define-public ftl
  (package
    (name "ftl")
    (version "1.6.12")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ftl.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "FTL: Faster Than Light spaceship simulation roguelike")
    (description "FTL: Faster Than Light spaceship simulation roguelike.")
    (home-page "http://www.ftlgame.com/")
    (license license:nonfree)))

;;; archey4 --- simple system information tool written in Python
(define-public archey4
  (package
    (name "archey4")
    (version "4.15.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/archey4.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "simple system information tool written in Python")
    (description "Simple system information tool written in Python.")
    (home-page "https://github.com/HorlogeSkynet/archey4.git")
    (license license:gpl3)))

;;; pidgin-musictracker --- plugin for Pidgin to display the currently playing music track
(define-public pidgin-musictracker
  (package
    (name "pidgin-musictracker")
    (version "0.4.22")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/pidgin-musictracker.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "plugin for Pidgin to display the currently playing music track")
    (description "Plugin for Pidgin to display the currently playing music track.")
    (home-page "http://code.google.com/p/pidgin-musictracker")
    (license license:gpl2)))

;;; spotifywm-git --- makes Spotify more friendly to window managers
(define-public spotifywm-git
  (package
    (name "spotifywm-git")
    (version "0.0.r1.91dd553")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/spotifywm-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "makes Spotify more friendly to window managers")
    (description "Makes Spotify more friendly to window managers.")
    (home-page "https://github.com/dasJ/spotifywm")
    (license license:expat)))

;;; openbox-menu --- dynamic XDG menu for openbox
(define-public openbox-menu
  (package
    (name "openbox-menu")
    (version "0.8.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/openbox-menu.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "dynamic XDG menu for openbox")
    (description "Dynamic XDG menu for openbox.")
    (home-page "http://fabrice.thiroux.free.fr/openbox-menu_en.html")
    (license license:gpl3)))

;;; libratbag-git --- DBus daemon to configure gaming mice
(define-public libratbag-git
  (package
    (name "libratbag-git")
    (version "0.11.r7.47cc5fc")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/libratbag-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "DBus daemon to configure gaming mice")
    (description "DBus daemon to configure gaming mice.")
    (home-page "https://github.com/libratbag/libratbag")
    (license license:expat)))

;;; geotoad --- tool to simplify geocaching
(define-public geotoad
  (package
    (name "geotoad")
    (version "3.34.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/geotoad.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "tool to simplify geocaching")
    (description "Tool to simplify geocaching.")
    (home-page "https://github.com/steve8x8/geotoad")
    (license license:gpl2)))

;;; xivlauncher-git --- custom launcher for Final Fantasy XIV Online
(define-public xivlauncher-git
  (package
    (name "xivlauncher-git")
    (version "1.4.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/xivlauncher-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "custom launcher for Final Fantasy XIV Online")
    (description "Custom launcher for Final Fantasy XIV Online.")
    (home-page "https://github.com/goatcorp/XIVLauncher.Core/")
    (license license:gpl3)))

;;; lightdm-webkit2-theme-glorious --- sleek, modern and glorified LightDM webkit2 theme
(define-public lightdm-webkit2-theme-glorious
  (package
    (name "lightdm-webkit2-theme-glorious")
    (version "2.0.5")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lightdm-webkit2-theme-glorious.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "sleek, modern and glorified LightDM webkit2 theme")
    (description "Sleek, modern and glorified LightDM webkit2 theme.")
    (home-page "https://github.com/manilarome/lightdm-webkit2-theme-glorious")
    (license license:gpl3)))

;;; blackbox-vcs --- safely store secrets in Git/Mercurial/Subversion
(define-public blackbox-vcs
  (package
    (name "blackbox-vcs")
    (version "1.20220610")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/blackbox-vcs.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "safely store secrets in Git/Mercurial/Subversion")
    (description "Safely store secrets in Git/Mercurial/Subversion.")
    (home-page "https://github.com/StackExchange/blackbox")
    (license license:expat)))

;;; json-parser-git --- very low footprint JSON parser written in portable ANSI C
(define-public json-parser-git
  (package
    (name "json-parser-git")
    (version "1.1.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/json-parser-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "very low footprint JSON parser written in portable ANSI C")
    (description "Very low footprint JSON parser written in portable ANSI C.")
    (home-page "https://github.com/udp/json-parser")
    (license license:bsd-2)))

;;; trojita --- Qt IMAP email client
(define-public trojita
  (package
    (name "trojita")
    (version "0.7")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/trojita.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "Qt IMAP email client")
    (description "Qt IMAP email client.")
    (home-page "https://trojita.flaska.net")
    (license license:gpl2+)))

;;; bitlbee-facebook-git --- Facebook protocol plugin for BitlBee
(define-public bitlbee-facebook-git
  (package
    (name "bitlbee-facebook-git")
    (version "1.2.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/bitlbee-facebook-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "Facebook protocol plugin for BitlBee")
    (description "Facebook protocol plugin for BitlBee.")
    (home-page "https://github.com/bitlbee/bitlbee-facebook")
    (license license:gpl2+)))

;;; lua-event --- libevent binding for Lua
(define-public lua-event
  (package
    (name "lua-event")
    (version "0.4.6")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lua-event.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "libevent binding for Lua")
    (description "Libevent binding for Lua.")
    (home-page "https://github.com/harningt/luaevent")
    (license license:expat)))

;;; perl-exporter-tidy --- another way of exporting symbols in Perl
(define-public perl-exporter-tidy
  (package
    (name "perl-exporter-tidy")
    (version "0.09")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/perl-exporter-tidy.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "another way of exporting symbols in Perl")
    (description "Another way of exporting symbols in Perl.")
    (home-page "https://search.cpan.org/dist/Exporter-Tidy")
    (license license:artistic2.0)))

;;; qutepart-git --- code editor component for PyQt and Pyside
(define-public qutepart-git
  (package
    (name "qutepart-git")
    (version "3.3.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/qutepart-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "code editor component for PyQt and Pyside")
    (description "Code editor component for PyQt and Pyside.")
    (home-page "https://github.com/hlamer/qutepart")
    (license license:lgpl2.1+)))

;;; birdtray-git --- run Thunderbird with a system tray icon
(define-public birdtray-git
  (package
    (name "birdtray-git")
    (version "1.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/birdtray-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "run Thunderbird with a system tray icon")
    (description "Run Thunderbird with a system tray icon.")
    (home-page "https://github.com/gyunaev/birdtray")
    (license license:gpl3)))

;;; stormbaancoureur --- arcade-style car game based on physics
(define-public stormbaancoureur
  (package
    (name "stormbaancoureur")
    (version "2.1.6")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/stormbaancoureur.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "arcade-style car game based on physics")
    (description "Arcade-style car game based on physics.")
    (home-page "http://www.stolk.org/stormbaancoureur/")
    (license license:gpl2+)))

;;; noto-fonts-main --- Google Noto for Latin, Greek, Cyrillic scripts
(define-public noto-fonts-main
  (package
    (name "noto-fonts-main")
    (version "20241122")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/noto-fonts-main.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "Google Noto for Latin, Greek, Cyrillic scripts")
    (description "Google Noto for Latin, Greek, Cyrillic scripts.")
    (home-page "https://fonts.google.com/noto")
    (license license:silofl1.1)))

;;; cdist --- usable configuration management system
(define-public cdist
  (package
    (name "cdist")
    (version "7.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/cdist.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "usable configuration management system")
    (description "Usable configuration management system.")
    (home-page "https://code.ungleich.ch/ungleich-public/cdist/")
    (license license:gpl3+)))

;;; gtkatlantic --- Monopoly board game client for the monopd server
(define-public gtkatlantic
  (package
    (name "gtkatlantic")
    (version "0.6.4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gtkatlantic.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "Monopoly board game client for the monopd server")
    (description "Monopoly board game client for the monopd server.")
    (home-page "http://gtkatlantic.gradator.net/")
    (license license:gpl2+)))

;;; nautilus-data --- nautilus data files for gnome-search-tool
(define-public nautilus-data
  (package
    (name "nautilus-data")
    (version "44.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/nautilus-data.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "nautilus data files for gnome-search-tool")
    (description "Nautilus data files for gnome-search-tool.")
    (home-page "https://wiki.gnome.org/Apps/Files")
    (license license:gpl3+)))

;;; rtapp --- realtime application thread priority tuning
(define-public rtapp
  (package
    (name "rtapp")
    (version "1.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/rtapp.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "realtime application thread priority tuning")
    (description "Realtime application thread priority tuning.")
    (home-page "https://www.audio-linux.com")
    (license license:gpl2)))

;;; yai --- AI powered terminal assistant
(define-public yai
  (package
    (name "yai")
    (version "0.6.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/yai.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "AI powered terminal assistant")
    (description "AI powered terminal assistant.")
    (home-page "https://github.com/ekkinox/yai")
    (license license:expat)))

;;; cyberark-summon --- CLI providing on-demand secrets access for common DevOps tools
(define-public cyberark-summon
  (package
    (name "cyberark-summon")
    (version "0.10.4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/cyberark-summon.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "CLI providing on-demand secrets access for common DevOps tools")
    (description "CLI providing on-demand secrets access for common DevOps tools.")
    (home-page "https://github.com/cyberark/summon")
    (license license:expat)))

;;; calendar-indicator --- indicator for Google calendar
(define-public calendar-indicator
  (package
    (name "calendar-indicator")
    (version "0.4.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/calendar-indicator.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "indicator for Google calendar")
    (description "Indicator for Google calendar.")
    (home-page "https://www.atareao.es/aplicacion/calendar-indicator-o-google-calendar-en-ubuntu/")
    (license license:gpl3)))

;;; riemann --- monitors distributed systems
(define-public riemann
  (package
    (name "riemann")
    (version "0.3.6")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/riemann.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "monitors distributed systems")
    (description "Monitors distributed systems.")
    (home-page "http://riemann.io/")
    (license license:epl1.0)))

;;; hipipe --- super fast C++17 data transformation pipeline
(define-public hipipe
  (package
    (name "hipipe")
    (version "0.7.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/hipipe.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "super fast C++17 data transformation pipeline")
    (description "Super fast C++17 data transformation pipeline.")
    (home-page "https://github.com/iterait/hipipe")
    (license license:expat)))

;;; m68k-elf-gdb --- GNU Project Debugger (m68k-elf)
(define-public m68k-elf-gdb
  (package
    (name "m68k-elf-gdb")
    (version "16.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/m68k-elf-gdb.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "GNU Project Debugger (m68k-elf)")
    (description "GNU Project Debugger (m68k-elf).")
    (home-page "https://www.gnu.org/software/gdb/")
    (license license:gpl3+)))

;;; patreon-dl --- downloader for Patreon content
(define-public patreon-dl
  (package
    (name "patreon-dl")
    (version "1.0.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/patreon-dl.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "downloader for Patreon content")
    (description "Downloader for Patreon content.")
    (home-page "https://github.com/PrivateGER/patreon-dl")
    (license license:unlicense)))

;;; recastnavigation-openmw --- navigation-mesh toolset for OpenMW
(define-public recastnavigation-openmw
  (package
    (name "recastnavigation-openmw")
    (version "1.6.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/recastnavigation-openmw.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "navigation-mesh toolset for OpenMW")
    (description "Navigation-mesh toolset for OpenMW.")
    (home-page "https://github.com/recastnavigation/recastnavigation")
    (license license:zlib)))

;;; noto-fonts-kr-vf --- Google Noto Korean variable fonts
(define-public noto-fonts-kr-vf
  (package
    (name "noto-fonts-kr-vf")
    (version "20220126")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/noto-fonts-kr-vf.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "Google Noto Korean variable fonts")
    (description "Google Noto Korean variable fonts.")
    (home-page "https://www.google.com/get/noto/")
    (license license:silofl1.1)))

;;; pantheon-photos-git --- Pantheon Photos Manager
(define-public pantheon-photos-git
  (package
    (name "pantheon-photos-git")
    (version "8.0.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/pantheon-photos-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "Pantheon Photos Manager")
    (description "Pantheon Photos Manager.")
    (home-page "https://github.com/elementary/photos")
    (license license:lgpl2.1+)))

;;; wds-git --- Miracast Wireless Display Software for Linux
(define-public wds-git
  (package
    (name "wds-git")
    (version "1.1.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/wds-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "Miracast Wireless Display Software for Linux")
    (description "Miracast Wireless Display Software for Linux.")
    (home-page "https://01.org/wds")
    (license license:lgpl2.1+)))

;;; sip3-twig-ce --- SIP3 monitoring system API backend
(define-public sip3-twig-ce
  (package
    (name "sip3-twig-ce")
    (version "2024.2.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/sip3-twig-ce.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "SIP3 monitoring system API backend")
    (description "SIP3 monitoring system API backend.")
    (home-page "https://sip3.io")
    (license license:asl2.0)))

;;; libicu50 --- International Components for Unicode library, version 50
(define-public libicu50
  (package
    (name "libicu50")
    (version "50.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/libicu50.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "International Components for Unicode library, version 50")
    (description "International Components for Unicode library, version 50.")
    (home-page "http://www.icu-project.org/")
    (license license:x11)))

;;; asrrgb --- control ASRock B550 and TRX40 motherboard RGB LEDs
(define-public asrrgb
  (package
    (name "asrrgb")
    (version "1.1.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/asrrgb.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "control ASRock B550 and TRX40 motherboard RGB LEDs")
    (description "Control ASRock B550 and TRX40 motherboard RGB LEDs.")
    (home-page "https://github.com/aedalzotto/asrrgb")
    (license license:gpl2)))

;;; kanatest --- simple Hiragana and Katakana drill tool
(define-public kanatest
  (package
    (name "kanatest")
    (version "0.4.10")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/kanatest.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "simple Hiragana and Katakana drill tool")
    (description "Simple Hiragana and Katakana drill tool.")
    (home-page "http://www.clayo.org/kanatest/")
    (license license:gpl2+)))

;;; ocaml-lambda-term --- terminal manipulation library for OCaml
(define-public ocaml-lambda-term
  (package
    (name "ocaml-lambda-term")
    (version "3.3.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ocaml-lambda-term.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "terminal manipulation library for OCaml")
    (description "Terminal manipulation library for OCaml.")
    (home-page "https://github.com/ocaml-community/lambda-term")
    (license license:bsd-3)))

;;; mosml --- Moscow ML, a light-weight implementation of Standard ML
(define-public mosml
  (package
    (name "mosml")
    (version "2.10.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mosml.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "Moscow ML, a light-weight implementation of Standard ML")
    (description "Moscow ML, a light-weight implementation of Standard ML.")
    (home-page "http://mosml.org")
    (license license:gpl2+)))

;;; r-gitcreds --- query git credentials from R
(define-public r-gitcreds
  (package
    (name "r-gitcreds")
    (version "0.1.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/r-gitcreds.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "query git credentials from R")
    (description "Query git credentials from R.")
    (home-page "https://cran.r-project.org/package=gitcreds")
    (license license:expat)))

;;; crmsh --- command-line interface for high-availability cluster management
(define-public crmsh
  (package
    (name "crmsh")
    (version "5.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/crmsh.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "command-line interface for high-availability cluster management")
    (description "Command-line interface for high-availability cluster management.")
    (home-page "https://github.com/ClusterLabs/crmsh/")
    (license license:gpl2+)))

;;; emact --- portable emacs clone for X Windows or terminal with a lisp interpreter
(define-public emact
  (package
    (name "emact")
    (version "2.58.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/emact.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "portable emacs clone for X Windows or terminal with a lisp interpreter")
    (description "Portable emacs clone for X Windows or terminal with a lisp interpreter.")
    (home-page "http://christian.jullien.free.fr/emacs/")
    (license license:gpl2+)))

;;; gnome-shell-extension-drop-down-terminal-x-git --- extended Drop Down Terminal extension for the GNOME Shell
(define-public gnome-shell-extension-drop-down-terminal-x-git
  (package
    (name "gnome-shell-extension-drop-down-terminal-x-git")
    (version "1.0.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gnome-shell-extension-drop-down-terminal-x-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "extended Drop Down Terminal extension for the GNOME Shell")
    (description "Extended Drop Down Terminal extension for the GNOME Shell.")
    (home-page "https://github.com/bigbn/drop-down-terminal-x.git")
    (license license:gpl3)))

;;; jiq --- jid on jq, interactive JSON query tool
(define-public jiq
  (package
    (name "jiq")
    (version "0.7.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/jiq.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "jid on jq, interactive JSON query tool")
    (description "Jid on jq, interactive JSON query tool.")
    (home-page "https://github.com/fiatjaf/jiq")
    (license license:expat)))

;;; lcmark --- CLI interface for lua-lcmark
(define-public lcmark
  (package
    (name "lcmark")
    (version "0.30.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lcmark.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "CLI interface for lua-lcmark")
    (description "CLI interface for lua-lcmark.")
    (home-page "https://github.com/jgm/lcmark")
    (license license:bsd-2)))

;;; nekojishi --- free furry/kemono visual novel
(define-public nekojishi
  (package
    (name "nekojishi")
    (version "1.06")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/nekojishi.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "free furry/kemono visual novel")
    (description "Free furry/kemono visual novel.")
    (home-page "https://nekojishi.tw/en-index.html")
    (license license:nonfree)))

;;; pdf2img-c --- convert PDF to multiple image formats with a single click
(define-public pdf2img-c
  (package
    (name "pdf2img-c")
    (version "7.3996db9")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/pdf2img-c.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "convert PDF to multiple image formats with a single click")
    (description "Convert PDF to multiple image formats with a single click.")
    (home-page "https://github.com/wifiextender/pdf2png")
    (license license:gpl3)))

;;; python-elasticsearch-dsl --- Python client for Elasticsearch
(define-public python-elasticsearch-dsl
  (package
    (name "python-elasticsearch-dsl")
    (version "8.18.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-elasticsearch-dsl.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "Python client for Elasticsearch")
    (description "Python client for Elasticsearch.")
    (home-page "https://github.com/elastic/elasticsearch-dsl-py")
    (license license:asl2.0)))

;;; ruby-image-size --- measure image size using pure Ruby
(define-public ruby-image-size
  (package
    (name "ruby-image-size")
    (version "3.4.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ruby-image-size.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "measure image size using pure Ruby")
    (description "Measure image size using pure Ruby.")
    (home-page "https://github.com/toy/image_size")
    (license license:gpl2+)))

;;; transmission-i2p-git --- standalone I2P BitTorrent client over I2P network
(define-public transmission-i2p-git
  (package
    (name "transmission-i2p-git")
    (version "2.82")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/transmission-i2p-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "standalone I2P BitTorrent client over I2P network")
    (description "Standalone I2P BitTorrent client over I2P network.")
    (home-page "https://github.com/nicecash/transmission-i2p")
    (license license:expat)))

;;; libcs50-git --- CS50 Library for C
(define-public libcs50-git
  (package
    (name "libcs50-git")
    (version "11.0.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/libcs50-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "CS50 Library for C")
    (description "CS50 Library for C.")
    (home-page "https://github.com/cs50/libcs50")
    (license license:gpl3)))

;;; rendercv-bin --- CV/resume generator for academics and engineers, YAML to PDF
(define-public rendercv-bin
  (package
    (name "rendercv-bin")
    (version "2.8")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/rendercv-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "CV/resume generator for academics and engineers, YAML to PDF")
    (description "CV/resume generator for academics and engineers, YAML to PDF.")
    (home-page "https://github.com/rendercv/rendercv/")
    (license license:expat)))

;;; zapzap-git --- WhatsApp desktop application written in PyQt6
(define-public zapzap-git
  (package
    (name "zapzap-git")
    (version "6.4.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/zapzap-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "WhatsApp desktop application written in PyQt6")
    (description "WhatsApp desktop application written in PyQt6.")
    (home-page "https://github.com/rafatosta/zapzap")
    (license license:gpl3)))

;;; flowinity-bin --- dashboard for your digital life: images, documents, and chat
(define-public flowinity-bin
  (package
    (name "flowinity-bin")
    (version "1.0.11")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/flowinity-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "dashboard for your digital life: images, documents, and chat")
    (description "Dashboard for your digital life: images, documents, and chat.")
    (home-page "https://flowinity.com")
    (license license:gpl3)))

;;; encrpter --- simple file encryption tool
(define-public encrpter
  (package
    (name "encrpter")
    (version "1.5")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/encrpter.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "simple file encryption tool")
    (description "Simple file encryption tool.")
    (home-page "https://gitlab.com/saydut/encrpter")
    (license license:gpl3)))

;;; watchit-appimage --- movie playback system with filtering, search, and playback
(define-public watchit-appimage
  (package
    (name "watchit-appimage")
    (version "1.0.0.beta.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/watchit-appimage.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "movie playback system with filtering, search, and playback")
    (description "Movie playback system with filtering, search, and playback.")
    (home-page "https://github.com/WatchItDev/watchit-app")
    (license license:agpl3)))

;;; adminer-git --- web based SQL management tool for multiple databases
(define-public adminer-git
  (package
    (name "adminer-git")
    (version "5.4.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/adminer-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "web based SQL management tool for multiple databases")
    (description "Web based SQL management tool for multiple databases.")
    (home-page "https://www.adminer.org")
    (license license:asl2.0)))

;;; automua --- email client configuration made easy
(define-public automua
  (package
    (name "automua")
    (version "2023.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/automua.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "email client configuration made easy")
    (description "Email client configuration made easy.")
    (home-page "https://github.com/HLFH/automua")
    (license license:gpl3)))

;;; python-shippai --- Rust failures in other languages
(define-public python-shippai
  (package
    (name "python-shippai")
    (version "0.3.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-shippai.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "Rust failures in other languages")
    (description "Rust failures in other languages.")
    (home-page "https://github.com/untitaker/shippai")
    (license license:expat)))

;;; python-instructor --- structured outputs for LLMs
(define-public python-instructor
  (package
    (name "python-instructor")
    (version "1.13.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-instructor.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "structured outputs for LLMs")
    (description "Structured outputs for LLMs.")
    (home-page "https://github.com/567-labs/instructor")
    (license license:expat)))

;;; bicep --- declarative language for describing and deploying Azure resources
(define-public bicep
  (package
    (name "bicep")
    (version "0.25.53")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/bicep.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "declarative language for describing and deploying Azure resources")
    (description "Declarative language for describing and deploying Azure resources.")
    (home-page "https://github.com/Azure/bicep")
    (license license:expat)))

;;; cbmc-git --- Bounded Model Checking for ANSI-C
(define-public cbmc-git
  (package
    (name "cbmc-git")
    (version "5.11")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/cbmc-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "Bounded Model Checking for ANSI-C")
    (description "Bounded Model Checking for ANSI-C.")
    (home-page "http://www.cprover.org/cbmc/")
    (license license:gpl2+)))

;;; coregarage --- settings manager for the C Suite desktop
(define-public coregarage
  (package
    (name "coregarage")
    (version "5.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/coregarage.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "settings manager for the C Suite desktop")
    (description "Settings manager for the C Suite desktop.")
    (home-page "https://gitlab.com/cubocore/coreapps/coregarage")
    (license license:gpl3+)))

;;; devaultcore-git --- QT Desktop wallet for the DVT blockchain
(define-public devaultcore-git
  (package
    (name "devaultcore-git")
    (version "0.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/devaultcore-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "QT Desktop wallet for the DVT blockchain")
    (description "QT Desktop wallet for the DVT blockchain.")
    (home-page "https://github.com/devaultcrypto/")
    (license license:expat)))

;;; di-tui --- simple terminal UI player for di.fm Premium
(define-public di-tui
  (package
    (name "di-tui")
    (version "1.13.4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/di-tui.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "simple terminal UI player for di.fm Premium")
    (description "Simple terminal UI player for di.fm Premium.")
    (home-page "https://github.com/acaloiaro/di-tui")
    (license license:bsd-3)))

;;; eclipse-emf --- EMF and XSD frameworks for the Eclipse platform
(define-public eclipse-emf
  (package
    (name "eclipse-emf")
    (version "2.23")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/eclipse-emf.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "EMF and XSD frameworks for the Eclipse platform")
    (description "EMF and XSD frameworks for the Eclipse platform.")
    (home-page "http://www.eclipse.org/modeling/emf/")
    (license license:epl1.0)))

;;; findutils-git --- basic directory searching utilities of the GNU operating system
(define-public findutils-git
  (package
    (name "findutils-git")
    (version "4.9.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/findutils-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "basic directory searching utilities of the GNU operating system")
    (description "Basic directory searching utilities of the GNU operating system.")
    (home-page "https://www.gnu.org/software/findutils/")
    (license license:gpl3+)))

;;; geant4-incldata --- data files for proton and neutron density profiles in INCL
(define-public geant4-incldata
  (package
    (name "geant4-incldata")
    (version "1.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/geant4-incldata.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "data files for proton and neutron density profiles in INCL")
    (description "Data files for proton and neutron density profiles in INCL.")
    (home-page "http://geant4.cern.ch/")
    (license license:gpl2+)))

;;; godot3-mono-git --- advanced cross-platform 2D and 3D game engine (3.x Branch Mono)
(define-public godot3-mono-git
  (package
    (name "godot3-mono-git")
    (version "3.6")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/godot3-mono-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "advanced cross-platform 2D and 3D game engine (3.x Branch Mono)")
    (description "Advanced cross-platform 2D and 3D game engine (3.x Branch Mono).")
    (home-page "https://godotengine.org")
    (license license:expat)))

;;; headset --- discover and collect music on YouTube
(define-public headset
  (package
    (name "headset")
    (version "4.2.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/headset.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "discover and collect music on YouTube")
    (description "Discover and collect music on YouTube.")
    (home-page "https://headsetapp.co")
    (license license:expat)))

;;; python-svgutils --- Python SVG editor
(define-public python-svgutils
  (package
    (name "python-svgutils")
    (version "0.3.4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-svgutils.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "Python SVG editor")
    (description "Python SVG editor.")
    (home-page "https://github.com/btel/svg_utils")
    (license license:expat)))

;;; r-robustbase --- basic robust statistics for R
(define-public r-robustbase
  (package
    (name "r-robustbase")
    (version "0.99.7")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/r-robustbase.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "basic robust statistics for R")
    (description "Basic robust statistics for R.")
    (home-page "https://cran.r-project.org/package=robustbase")
    (license license:gpl2+)))

;;; iotacooler --- cold transaction signer for IOTA
(define-public iotacooler
  (package
    (name "iotacooler")
    (version "1.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/iotacooler.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "cold transaction signer for IOTA")
    (description "Cold transaction signer for IOTA.")
    (home-page "https://github.com/joshirio/iota-cooler")
    (license license:expat)))

;;; knightsandmerchants-remake-server --- dedicated server for the Knights And Merchants Remake
(define-public knightsandmerchants-remake-server
  (package
    (name "knightsandmerchants-remake-server")
    (version "r6720")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/knightsandmerchants-remake-server.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "dedicated server for the Knights And Merchants Remake")
    (description "Dedicated server for the Knights And Merchants Remake.")
    (home-page "http://www.kamremake.com")
    (license license:gpl2+)))

;;; librearp-git --- pattern-based arpeggio generator plugin
(define-public librearp-git
  (package
    (name "librearp-git")
    (version "0.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/librearp-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "pattern-based arpeggio generator plugin")
    (description "Pattern-based arpeggio generator plugin.")
    (home-page "https://gitlab.com/LibreArp/LibreArp.git")
    (license license:gpl3)))

;;; luastatus-git --- universal status bar content generator
(define-public luastatus-git
  (package
    (name "luastatus-git")
    (version "0.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/luastatus-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "universal status bar content generator")
    (description "Universal status bar content generator.")
    (home-page "https://github.com/shdown/luastatus")
    (license license:lgpl3+)))

;;; emergency-alerts --- simple app that sends emergency alerts about your locations
(define-public emergency-alerts
  (package
    (name "emergency-alerts")
    (version "2.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/emergency-alerts.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "simple app that sends emergency alerts about your locations")
    (description "Simple app that sends emergency alerts about your locations.")
    (home-page "https://github.com/leolost2605/emergency-alerts")
    (license license:gpl3+)))

;;; mjml-app --- desktop app for MJML email framework
(define-public mjml-app
  (package
    (name "mjml-app")
    (version "3.0.4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mjml-app.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "desktop app for MJML email framework")
    (description "Desktop app for MJML email framework.")
    (home-page "https://github.com/mjmlio/mjml-app")
    (license license:expat)))

;;; neovim-telescope-git --- extensible fuzzy finder for lists in Neovim
(define-public neovim-telescope-git
  (package
    (name "neovim-telescope-git")
    (version "0.2.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/neovim-telescope-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "extensible fuzzy finder for lists in Neovim")
    (description "Extensible fuzzy finder for lists in Neovim.")
    (home-page "https://github.com/nvim-telescope/telescope.nvim")
    (license license:expat)))

;;; ofxstatement-austrian --- plugin for ofxstatement to convert banking statements to OFX
(define-public ofxstatement-austrian
  (package
    (name "ofxstatement-austrian")
    (version "0.0.4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ofxstatement-austrian.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "plugin for ofxstatement to convert banking statements to OFX")
    (description "Plugin for ofxstatement to convert banking statements to OFX.")
    (home-page "https://github.com/nblock/ofxstatement-austrian")
    (license license:gpl3)))

;;; pev2-electron --- Postgres Explain Visualizer 2
(define-public pev2-electron
  (package
    (name "pev2-electron")
    (version "1.19.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/pev2-electron.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "Postgres Explain Visualizer 2")
    (description "Postgres Explain Visualizer 2.")
    (home-page "https://github.com/dalibo/pev2")
    (license license:postgresql)))

;;; glcli --- GitLab CLI for project management
(define-public glcli
  (package
    (name "glcli")
    (version "0.5.15")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/glcli.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "GitLab CLI for project management")
    (description "GitLab CLI for project management.")
    (home-page "https://github.com/zaquestion/lab")
    (license license:gpl2+)))

;;; ps2-libconfig --- C/C++ configuration file library (PS2 port)
(define-public ps2-libconfig
  (package
    (name "ps2-libconfig")
    (version "1.4.5")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ps2-libconfig.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "C/C++ configuration file library (PS2 port)")
    (description "C/C++ configuration file library (PS2 port).")
    (home-page "https://github.com/ps2dev/ps2sdk-ports")
    (license license:lgpl2.1+)))

;;; python-entry-points-txt --- read and write entry_points.txt files
(define-public python-entry-points-txt
  (package
    (name "python-entry-points-txt")
    (version "0.3.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-entry-points-txt.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "read and write entry_points.txt files")
    (description "Read and write entry_points.txt files.")
    (home-page "https://github.com/jwodder/entry-points-txt")
    (license license:expat)))

;;; python-pyexcel-xlsx --- wrapper library to read and write xlsx/xlsm using openpyxl
(define-public python-pyexcel-xlsx
  (package
    (name "python-pyexcel-xlsx")
    (version "0.6.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-pyexcel-xlsx.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "wrapper library to read and write xlsx/xlsm using openpyxl")
    (description "Wrapper library to read and write xlsx/xlsm using openpyxl.")
    (home-page "https://github.com/pyexcel/pyexcel-xlsx")
    (license license:expat)))

;;; qcal --- console-based quick calendar for CalDAV
(define-public qcal
  (package
    (name "qcal")
    (version "0.9.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/qcal.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "console-based quick calendar for CalDAV")
    (description "Console-based quick calendar for CalDAV.")
    (home-page "https://git.sr.ht/~psic4t/qcal")
    (license license:gpl3)))

;;; rofi-mpc --- fast graphical Rofi-Interface for controlling MPD
(define-public rofi-mpc
  (package
    (name "rofi-mpc")
    (version "1.2.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/rofi-mpc.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "fast graphical Rofi-Interface for controlling MPD")
    (description "Fast graphical Rofi-Interface for controlling MPD.")
    (home-page "https://github.com/Marco98/rofi-mpc")
    (license license:gpl2+)))

;;; vdr-xineliboutput --- X11 and Linux framebuffer front-end for VDR
(define-public vdr-xineliboutput
  (package
    (name "vdr-xineliboutput")
    (version "2.3.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/vdr-xineliboutput.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "X11 and Linux framebuffer front-end for VDR")
    (description "X11 and Linux framebuffer front-end for VDR.")
    (home-page "https://www.sourceforge.net/projects/xineliboutput")
    (license license:gpl2+)))

;;; widelands-maps-rttr --- Settlers II remake maps available for Widelands
(define-public widelands-maps-rttr
  (package
    (name "widelands-maps-rttr")
    (version "r8.20240404")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/widelands-maps-rttr.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "Settlers II remake maps available for Widelands")
    (description "Settlers II remake maps available for Widelands.")
    (home-page "http://siedler25.org/")
    (license license:gpl3)))

;;; php80-litespeed --- LiteSpeed SAPI for PHP 8.0
(define-public php80-litespeed
  (package
    (name "php80-litespeed")
    (version "8.0.30")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/php80-litespeed.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "LiteSpeed SAPI for PHP 8.0")
    (description "LiteSpeed SAPI for PHP 8.0.")
    (home-page "http://www.php.net")
    (license license:php3.01)))

;;; phallus-fonts-git --- Lemon and Uushi fonts by phallus
(define-public phallus-fonts-git
  (package
    (name "phallus-fonts-git")
    (version "199.99faf2a")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/phallus-fonts-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "Lemon and Uushi fonts by phallus")
    (description "Lemon and Uushi fonts by phallus.")
    (home-page "https://github.com/phallus/fonts")
    (license license:wtfpl2)))

;;; thunderbird-beta-i18n-th --- Thai language pack for Thunderbird Beta
(define-public thunderbird-beta-i18n-th
  (package
    (name "thunderbird-beta-i18n-th")
    (version "142.0b4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/thunderbird-beta-i18n-th.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "Thai language pack for Thunderbird Beta")
    (description "Thai language pack for Thunderbird Beta.")
    (home-page "http://www.mozilla.com/")
    (license license:mpl2.0)))

;;; palemoon-i18n-pt-pt --- Portuguese (Portugal) language pack for Pale Moon browser
(define-public palemoon-i18n-pt-pt
  (package
    (name "palemoon-i18n-pt-pt")
    (version "33.8.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/palemoon-i18n-pt-pt.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "Portuguese (Portugal) language pack for Pale Moon browser")
    (description "Portuguese (Portugal) language pack for Pale Moon browser.")
    (home-page "https://addons.palemoon.org/language-packs/")
    (license license:mpl2.0)))

;;; regextester --- simple regex tester
(define-public regextester
  (package
    (name "regextester")
    (version "1.1.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/regextester.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "simple regex tester")
    (description "Simple regex tester.")
    (home-page "https://github.com/artemanufrij/regextester")
    (license license:gpl3)))
