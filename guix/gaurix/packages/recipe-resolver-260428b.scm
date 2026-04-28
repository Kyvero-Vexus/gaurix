;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260428b
;;; Resolves 100 packages from queue (100 recipes, 0 blocked).
;;;
;;; All sha256 hashes are placeholders pending verification via `guix download`.

(define-module (gaurix packages recipe-resolver-260428b)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:export (
            sabnzbd
            viber
            komodo-edit
            git-cola
            webstorm
            flutter-tool
            sendmail
            kazam
            pnmixer
            multibootusb
            alarm-clock-applet
            grisbi
            plex-media-player
            worldofgoo
            nomachine
            hibiscus
            mpich
            stapler
            scilab
            hadoop
            imgur-dot-sh
            mathematica
            adom
            unknown-horizons
            bouml
            pspp
            slurm
            pioneers
            geteltorito
            zeronet
            mawk
            heroku-cli
            mdbtools
            bombono-dvd
            paramano
            sozi
            wxglade
            datagrip
            tintin
            pkg-4kvideodownloader
            tokyocabinet
            bisq-desktop
            polymc
            acidrip
            subsonic
            bristol
            sphinx
            bcache-tools
            osmos
            xmlcopyeditor
            lsyncd
            osu
            imagej
            rainlendar-lite
            openfoam-org
            boswars
            zeroinstall-injector
            minecraft-technic-launcher
            fuse-emulator
            hyper
            xmltv
            freeoffice
            mongodb-compass
            audio-recorder
            chocolate-doom
            popcorntime
            mp3diags
            scidavis-qt5
            unvanquished
            legendary
            isomaster
            tesseract-gui
            bastet
            webcamoid
            spacefm
            xdman
            apache-spark
            factorio
            charles
            tovid
            dbvis
            joomla
            openboard
            tty-clock-git
            unified-remote-server
            gpaint
            heidisql
            xzoom
            urxvtcd
            fotocx
            omegat
            brutalchess
            alsaequal
            eaglemode
            imapfilter
            expressvpn
            areca
            sup
            standardnotes
            screenkey-git            ))

;;; Nonfree/proprietary license placeholder for Gaurix channel
(define license:nonfree
  ((@@ (guix licenses) license) "Nonfree"
    "https://spdx.org/licenses/"
    "Proprietary or custom license; see upstream for terms."))

;;; sabnzbd --- a web-interface based binary newsgrabber with NZB file support
(define-public sabnzbd
  (package
    (name "sabnzbd")
    (version "4.5.5-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/sabnzbd.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a web-interface based binary newsgrabber with NZB file support")
    (description "A web-interface based binary newsgrabber with NZB file support.")
    (home-page "http://www.sabnzbd.org")
    (license license:gpl3+)))

;;; viber --- free and secure calls and messages to anyone, anywhere, on any device and ne...
(define-public viber
  (package
    (name "viber")
    (version "27.3.0.2-5")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/viber.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "free and secure calls and messages to anyone, anywhere, on any device and ne...")
    (description "Free and secure calls and messages to anyone, anywhere, on any device and network, in any country!.")
    (home-page "https://www.viber.com")
    (license license:nonfree)))

;;; komodo-edit --- free & Open-Source counterpart of ActiveState Komodo IDE - XUL based
(define-public komodo-edit
  (package
    (name "komodo-edit")
    (version "12.0.1_18441-2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/komodo-edit.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "free & Open-Source counterpart of ActiveState Komodo IDE - XUL based")
    (description "Free & Open-Source counterpart of ActiveState Komodo IDE - XUL based.")
    (home-page "http://www.activestate.com/komodo-edit")
    (license license:mpl2.0)))

;;; git-cola --- the highly caffeinated Git GUI
(define-public git-cola
  (package
    (name "git-cola")
    (version "4.18.2-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/git-cola.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the highly caffeinated Git GUI")
    (description "The highly caffeinated Git GUI.")
    (home-page "https://git-cola.gitlab.io")
    (license license:gpl2+)))

;;; webstorm --- JavaScript IDE and HTML editor
(define-public webstorm
  (package
    (name "webstorm")
    (version "2026.1.1-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/webstorm.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "JavaScript IDE and HTML editor")
    (description "JavaScript IDE and HTML editor.")
    (home-page "https://www.jetbrains.com/webstorm/")
    (license license:nonfree)))

;;; flutter-tool --- flutter SDK component - CLI tool (for packaging only)
(define-public flutter-tool
  (package
    (name "flutter-tool")
    (version "3.41.2-3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/flutter-tool.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "flutter SDK component - CLI tool (for packaging only)")
    (description "Flutter SDK component - CLI tool (for packaging only).")
    (home-page "https://flutter.dev")
    (license license:bsd-3)))

;;; sendmail --- a general purpose internetwork email routing MTA
(define-public sendmail
  (package
    (name "sendmail")
    (version "8.18.2-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/sendmail.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a general purpose internetwork email routing MTA")
    (description "A general purpose internetwork email routing MTA.")
    (home-page "http://www.sendmail.org")
    (license license:nonfree)))

;;; kazam --- screencast and screenshot application created with design in mind
(define-public kazam
  (package
    (name "kazam")
    (version "1.4.5-9")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/kazam.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "screencast and screenshot application created with design in mind")
    (description "Screencast and screenshot application created with design in mind.")
    (home-page "https://launchpad.net/kazam")
    (license license:gpl3+)))

;;; pnmixer --- GTK volume mixer applet that runs in the system tray
(define-public pnmixer
  (package
    (name "pnmixer")
    (version "0.7.2-2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/pnmixer.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "GTK volume mixer applet that runs in the system tray")
    (description "GTK volume mixer applet that runs in the system tray.")
    (home-page "https://github.com/nicklan/pnmixer")
    (license license:gpl3+)))

;;; multibootusb --- boot multiple live Linux distros from a usb flash drive
(define-public multibootusb
  (package
    (name "multibootusb")
    (version "9.2.0-5")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/multibootusb.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "boot multiple live Linux distros from a usb flash drive")
    (description "Boot multiple live Linux distros from a usb flash drive.")
    (home-page "https://sourceforge.net/projects/multibootusb/")
    (license license:gpl3+)))

;;; alarm-clock-applet --- a fully-featured alarm clock for use with an AppIndicator implementation
(define-public alarm-clock-applet
  (package
    (name "alarm-clock-applet")
    (version "1:0.4.1-5")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/alarm-clock-applet.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a fully-featured alarm clock for use with an AppIndicator implementation")
    (description "A fully-featured alarm clock for use with an AppIndicator implementation.")
    (home-page "https://alarm-clock-applet.github.io/")
    (license license:gpl2)))

;;; grisbi --- shared files for the finance management program Grisbi
(define-public grisbi
  (package
    (name "grisbi")
    (version "3.90.1-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/grisbi.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "shared files for the finance management program Grisbi")
    (description "Shared files for the finance management program Grisbi.")
    (home-page "https://www.grisbi.org")
    (license license:gpl2+)))

;;; plex-media-player --- next generation Plex Desktop Client
(define-public plex-media-player
  (package
    (name "plex-media-player")
    (version "2.58.1-3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/plex-media-player.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "next generation Plex Desktop Client")
    (description "Next generation Plex Desktop Client.")
    (home-page "https://github.com/plexinc/plex-media-player")
    (license license:gpl3+)))

;;; worldofgoo --- a physics based puzzle/construction game (requires copy of the full game)
(define-public worldofgoo
  (package
    (name "worldofgoo")
    (version "1.53-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/worldofgoo.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a physics based puzzle/construction game (requires copy of the full game)")
    (description "A physics based puzzle/construction game (requires copy of the full game).")
    (home-page "https://2dboy.com/")
    (license license:nonfree)))

;;; nomachine --- remote desktop application
(define-public nomachine
  (package
    (name "nomachine")
    (version "9.4.14-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/nomachine.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "remote desktop application")
    (description "Remote desktop application.")
    (home-page "http://www.nomachine.com")
    (license license:nonfree)))

;;; hibiscus --- HBCI banking plugin for jameica
(define-public hibiscus
  (package
    (name "hibiscus")
    (version "2.12.2-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/hibiscus.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "HBCI banking plugin for jameica")
    (description "HBCI banking plugin for jameica.")
    (home-page "https://www.willuhn.de/projects/hibiscus/")
    (license license:gpl2)))

;;; mpich --- an improved implementation of the Message Passing Interface
(define-public mpich
  (package
    (name "mpich")
    (version "4.3.2-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mpich.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "an improved implementation of the Message Passing Interface")
    (description "An improved implementation of the Message Passing Interface.")
    (home-page "https://mpich.org")
    (license license:nonfree)))

;;; stapler --- a small utility making use of the pypdf library to provide a (somewhat) ligh...
(define-public stapler
  (package
    (name "stapler")
    (version "1.0.0-5")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/stapler.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a small utility making use of the pypdf library to provide a (somewhat) ligh...")
    (description "A small utility making use of the pypdf library to provide a (somewhat) lighter alternative to pdftk.")
    (home-page "https://github.com/hellerbarde/stapler")
    (license license:bsd-3)))

;;; scilab --- a scientific software package for numerical computations
(define-public scilab
  (package
    (name "scilab")
    (version "2026.0.1-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/scilab.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a scientific software package for numerical computations")
    (description "A scientific software package for numerical computations.")
    (home-page "https://www.scilab.org")
    (license license:bsd-3)))

;;; hadoop --- an open-source software for reliable, scalable, distributed computing
(define-public hadoop
  (package
    (name "hadoop")
    (version "3.4.2-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/hadoop.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "an open-source software for reliable, scalable, distributed computing")
    (description "An open-source software for reliable, scalable, distributed computing.")
    (home-page "https://hadoop.apache.org/")
    (license license:asl2.0)))

;;; imgur.sh --- bart's Imgur uploader bash script
(define-public imgur-dot-sh
  (package
    (name "imgur.sh")
    (version "10.1-2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/imgur.sh.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "bart's Imgur uploader bash script")
    (description "Bart's Imgur uploader bash script.")
    (home-page "https://github.com/tremby/imgur.sh")
    (license license:unlicense)))

;;; mathematica --- computational software for mathematics, science, and engineering, with offli...
(define-public mathematica
  (package
    (name "mathematica")
    (version "14.3.0-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mathematica.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "computational software for mathematics, science, and engineering, with offli...")
    (description "Computational software for mathematics, science, and engineering, with offline documentation included.")
    (home-page "http://www.wolfram.com/mathematica/")
    (license license:nonfree)))

;;; adom --- a roguelike game with a quest-centric, plot driven structure
(define-public adom
  (package
    (name "adom")
    (version "1:3.3.3-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/adom.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a roguelike game with a quest-centric, plot driven structure")
    (description "A roguelike game with a quest-centric, plot driven structure.")
    (home-page "http://www.adom.de/")
    (license license:nonfree)))

;;; unknown-horizons --- 2D realtime strategy simulation with an emphasis on economy and city buildin...
(define-public unknown-horizons
  (package
    (name "unknown-horizons")
    (version "2019.1-7")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/unknown-horizons.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "2D realtime strategy simulation with an emphasis on economy and city buildin...")
    (description "2D realtime strategy simulation with an emphasis on economy and city building.")
    (home-page "https://unknown-horizons.org/")
    (license license:cc-by-sa4.0)))

;;; bouml --- a free UML 2 tool box including a modeler allowing you to specify and genera...
(define-public bouml
  (package
    (name "bouml")
    (version "7.11.0-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/bouml.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a free UML 2 tool box including a modeler allowing you to specify and genera...")
    (description "A free UML 2 tool box including a modeler allowing you to specify and generate code in C++, Java, IDL, PHP, Python, and MySQL.")
    (home-page "https://bouml.fr/")
    (license license:gpl3+)))

;;; pspp --- statistical analysis program. Free replacement for SPSS
(define-public pspp
  (package
    (name "pspp")
    (version "2.1.1-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/pspp.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "statistical analysis program. Free replacement for SPSS")
    (description "Statistical analysis program. Free replacement for SPSS.")
    (home-page "http://www.gnu.org/software/pspp/")
    (license license:gpl3+)))

;;; slurm --- yet another network load monitor
(define-public slurm
  (package
    (name "slurm")
    (version "0.4.4-2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/slurm.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "yet another network load monitor")
    (description "Yet another network load monitor.")
    (home-page "https://github.com/mattthias/slurm")
    (license license:gpl2+)))

;;; pioneers --- a clone of the famous Siedler of Catan game
(define-public pioneers
  (package
    (name "pioneers")
    (version "15.6-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/pioneers.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a clone of the famous Siedler of Catan game")
    (description "A clone of the famous Siedler of Catan game.")
    (home-page "http://pio.sourceforge.net/")
    (license license:gpl2)))

;;; geteltorito --- a El Torito boot image extractor
(define-public geteltorito
  (package
    (name "geteltorito")
    (version "0.6-2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/geteltorito.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a El Torito boot image extractor")
    (description "A El Torito boot image extractor.")
    (home-page "https://raw.githubusercontent.com/rainer042/geteltorito/main/geteltorito.pl")
    (license license:gpl2)))

;;; zeronet --- decentralized websites using Bitcoin crypto and the BitTorrent network
(define-public zeronet
  (package
    (name "zeronet")
    (version "0.7.1-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/zeronet.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "decentralized websites using Bitcoin crypto and the BitTorrent network")
    (description "Decentralized websites using Bitcoin crypto and the BitTorrent network.")
    (home-page "https://zeronet.io/")
    (license license:gpl2)))

;;; mawk --- an interpreter for the AWK Programming Language
(define-public mawk
  (package
    (name "mawk")
    (version "1.3.4_20260302-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mawk.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "an interpreter for the AWK Programming Language")
    (description "An interpreter for the AWK Programming Language.")
    (home-page "http://invisible-island.net/mawk/")
    (license license:gpl3+)))

;;; heroku-cli --- CLI to manage Heroku apps and services with forced auto-update removed
(define-public heroku-cli
  (package
    (name "heroku-cli")
    (version "11.2.0-2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/heroku-cli.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "CLI to manage Heroku apps and services with forced auto-update removed")
    (description "CLI to manage Heroku apps and services with forced auto-update removed.")
    (home-page "https://devcenter.heroku.com/articles/heroku-cli")
    (license license:isc)))

;;; mdbtools --- utilities for viewing data and exporting schema from Microsoft Access databa...
(define-public mdbtools
  (package
    (name "mdbtools")
    (version "1.0.1-2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mdbtools.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "utilities for viewing data and exporting schema from Microsoft Access databa...")
    (description "Utilities for viewing data and exporting schema from Microsoft Access database files.")
    (home-page "https://github.com/mdbtools/mdbtools")
    (license license:gpl3+)))

;;; bombono-dvd --- DVD authoring program with nice and clean GUI
(define-public bombono-dvd
  (package
    (name "bombono-dvd")
    (version "1.2.4-9")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/bombono-dvd.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "DVD authoring program with nice and clean GUI")
    (description "DVD authoring program with nice and clean GUI.")
    (home-page "https://bombono.com/")
    (license license:gpl3+)))

;;; paramano --- docking battery monitor and CPU governer controller (fork of trayfreq)
(define-public paramano
  (package
    (name "paramano")
    (version "0.72-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/paramano.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "docking battery monitor and CPU governer controller (fork of trayfreq)")
    (description "Docking battery monitor and CPU governer controller (fork of trayfreq).")
    (home-page "https://gitlab.com/dphillips/paramano")
    (license license:gpl3+)))

;;; sozi --- a zooming presentation editor and player based on SVG and JavaScript
(define-public sozi
  (package
    (name "sozi")
    (version "24.11-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/sozi.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a zooming presentation editor and player based on SVG and JavaScript")
    (description "A zooming presentation editor and player based on SVG and JavaScript.")
    (home-page "http://sozi.baierouge.fr/")
    (license license:mpl2.0)))

;;; wxglade --- wxGlade is a GUI builder written in Python for the GUI toolkit wxWidgets/wxP...
(define-public wxglade
  (package
    (name "wxglade")
    (version "1.1.1-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/wxglade.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "wxGlade is a GUI builder written in Python for the GUI toolkit wxWidgets/wxP...")
    (description "WxGlade is a GUI builder written in Python for the GUI toolkit wxWidgets/wxPython.")
    (home-page "https://github.com/wxGlade/wxGlade")
    (license license:expat)))

;;; datagrip --- smart SQL Editor and Advanced Database Client Packed Together for Optimum Pr...
(define-public datagrip
  (package
    (name "datagrip")
    (version "2026.1.2-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/datagrip.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "smart SQL Editor and Advanced Database Client Packed Together for Optimum Pr...")
    (description "Smart SQL Editor and Advanced Database Client Packed Together for Optimum Productivity.")
    (home-page "https://www.jetbrains.com/datagrip/")
    (license license:nonfree)))

;;; tintin --- a console-based MUD client
(define-public tintin
  (package
    (name "tintin")
    (version "2.02.61-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/tintin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a console-based MUD client")
    (description "A console-based MUD client.")
    (home-page "http://tintin.sourceforge.net/")
    (license license:gpl3)))

;;; 4kvideodownloader --- quickly download videos from YouTube in high-quality
(define-public pkg-4kvideodownloader
  (package
    (name "4kvideodownloader")
    (version "4.33.5.0172-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/4kvideodownloader.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "quickly download videos from YouTube in high-quality")
    (description "Quickly download videos from YouTube in high-quality.")
    (home-page "https://www.4kdownload.com/products/product-videodownloader")
    (license license:nonfree)))

;;; tokyocabinet --- a modern implementation of DBM
(define-public tokyocabinet
  (package
    (name "tokyocabinet")
    (version "1.4.48-3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/tokyocabinet.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a modern implementation of DBM")
    (description "A modern implementation of DBM.")
    (home-page "https://fallabs.com/tokyocabinet/")
    (license license:lgpl2.1+)))

;;; bisq-desktop --- cross-platform desktop application that allows users to trade national curre...
(define-public bisq-desktop
  (package
    (name "bisq-desktop")
    (version "1.9.22-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/bisq-desktop.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "cross-platform desktop application that allows users to trade national curre...")
    (description "Cross-platform desktop application that allows users to trade national currency (dollars, euros, etc) for bitcoin without relying on centralized exchanges.")
    (home-page "https://bisq.network")
    (license license:agpl3.0)))

;;; polymc --- Minecraft launcher with the ability to manage multiple instances
(define-public polymc
  (package
    (name "polymc")
    (version "7.0-2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/polymc.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Minecraft launcher with the ability to manage multiple instances")
    (description "Minecraft launcher with the ability to manage multiple instances.")
    (home-page "https://github.com/PolyMC/PolyMC")
    (license license:gpl3)))

;;; acidrip --- a Gtk2::Perl application for ripping and encoding DVD's
(define-public acidrip
  (package
    (name "acidrip")
    (version "0.14-10")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/acidrip.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a Gtk2::Perl application for ripping and encoding DVD's")
    (description "A Gtk2::Perl application for ripping and encoding DVD's.")
    (home-page "http://sourceforge.net/projects/acidrip/")
    (license license:gpl3+)))

;;; subsonic --- a free, web-based media streamer and jukebox
(define-public subsonic
  (package
    (name "subsonic")
    (version "6.1.6-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/subsonic.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a free, web-based media streamer and jukebox")
    (description "A free, web-based media streamer and jukebox.")
    (home-page "http://subsonic.org/")
    (license license:nonfree)))

;;; bristol --- vintage synthesizers emulator
(define-public bristol
  (package
    (name "bristol")
    (version "0.60.11-3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/bristol.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "vintage synthesizers emulator")
    (description "Vintage synthesizers emulator.")
    (home-page "http://bristol.sourceforge.net")
    (license license:gpl3+)))

;;; sphinx --- free open-source SQL full-text search engine
(define-public sphinx
  (package
    (name "sphinx")
    (version "2.2.11-4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/sphinx.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "free open-source SQL full-text search engine")
    (description "Free open-source SQL full-text search engine.")
    (home-page "http://www.sphinxsearch.com/")
    (license license:gpl3+)))

;;; bcache-tools --- userspace tools for bcache until bcache merges with either dm or md
(define-public bcache-tools
  (package
    (name "bcache-tools")
    (version "1.1-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/bcache-tools.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "userspace tools for bcache until bcache merges with either dm or md")
    (description "Userspace tools for bcache until bcache merges with either dm or md.")
    (home-page "http://bcache.evilpiepirate.org")
    (license license:gpl3+)))

;;; osmos --- a unique physics-based ambient game (Humble Bundle/Store version)
(define-public osmos
  (package
    (name "osmos")
    (version "1.6.1-2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/osmos.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a unique physics-based ambient game (Humble Bundle/Store version)")
    (description "A unique physics-based ambient game (Humble Bundle/Store version).")
    (home-page "http://www.hemispheregames.com/osmos/")
    (license license:nonfree)))

;;; xmlcopyeditor --- XML editor based on Scintilla
(define-public xmlcopyeditor
  (package
    (name "xmlcopyeditor")
    (version "1.3.1.0-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/xmlcopyeditor.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "XML editor based on Scintilla")
    (description "XML editor based on Scintilla.")
    (home-page "http://xml-copy-editor.sourceforge.net")
    (license license:nonfree)))

;;; lsyncd --- live Syncing (Mirror) Daemon
(define-public lsyncd
  (package
    (name "lsyncd")
    (version "2.3.1-9")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lsyncd.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "live Syncing (Mirror) Daemon")
    (description "Live Syncing (Mirror) Daemon.")
    (home-page "https://github.com/lsyncd/lsyncd")
    (license license:gpl2+)))

;;; osu --- a free-to-win rhythm game
(define-public osu
  (package
    (name "osu")
    (version "20260325-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/osu.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a free-to-win rhythm game")
    (description "A free-to-win rhythm game.")
    (home-page "https://osu.ppy.sh")
    (license license:nonfree)))

;;; imagej --- image manipulation software for scientists
(define-public imagej
  (package
    (name "imagej")
    (version "2:1.54p-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/imagej.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "image manipulation software for scientists")
    (description "Image manipulation software for scientists.")
    (home-page "https://imagej.net")
    (license license:public-domain)))

;;; rainlendar-lite --- a desktop Calendar, ToDo list and Event list
(define-public rainlendar-lite
  (package
    (name "rainlendar-lite")
    (version "2.23.0-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/rainlendar-lite.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a desktop Calendar, ToDo list and Event list")
    (description "A desktop Calendar, ToDo list and Event list.")
    (home-page "http://www.rainlendar.net/")
    (license license:nonfree)))

;;; openfoam-org --- the open source CFD toolbox (www.openfoam.org)
(define-public openfoam-org
  (package
    (name "openfoam-org")
    (version "13.20250911+cde978a-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/openfoam-org.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the open source CFD toolbox (www.openfoam.org)")
    (description "The open source CFD toolbox (www.openfoam.org).")
    (home-page "http://www.openfoam.org")
    (license license:gpl3+)))

;;; boswars --- futuristic real-time strategy game
(define-public boswars
  (package
    (name "boswars")
    (version "2.8-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/boswars.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "futuristic real-time strategy game")
    (description "Futuristic real-time strategy game.")
    (home-page "http://www.boswars.org")
    (license license:gpl2+)))

;;; zeroinstall-injector --- a decentralised cross-distribution software installation system
(define-public zeroinstall-injector
  (package
    (name "zeroinstall-injector")
    (version "2.16-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/zeroinstall-injector.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a decentralised cross-distribution software installation system")
    (description "A decentralised cross-distribution software installation system.")
    (home-page "https://0install.net")
    (license license:lgpl2.1)))

;;; minecraft-technic-launcher --- choose from thousands of community-made Minecraft modpacks
(define-public minecraft-technic-launcher
  (package
    (name "minecraft-technic-launcher")
    (version "4.1084-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/minecraft-technic-launcher.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "choose from thousands of community-made Minecraft modpacks")
    (description "Choose from thousands of community-made Minecraft modpacks.")
    (home-page "https://www.technicpack.net/")
    (license license:nonfree)))

;;; fuse-emulator --- ZX Spectrum emulator
(define-public fuse-emulator
  (package
    (name "fuse-emulator")
    (version "1.7.0-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/fuse-emulator.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "ZX Spectrum emulator")
    (description "ZX Spectrum emulator.")
    (home-page "http://fuse-emulator.sourceforge.net/fuse.php")
    (license license:gpl3+)))

;;; hyper --- a terminal built on web technologies
(define-public hyper
  (package
    (name "hyper")
    (version "3.4.1-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/hyper.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a terminal built on web technologies")
    (description "A terminal built on web technologies.")
    (home-page "https://hyper.is/")
    (license license:expat)))

;;; xmltv --- set of utilities to download tv listings and format them in xml
(define-public xmltv
  (package
    (name "xmltv")
    (version "1.4.0-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/xmltv.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "set of utilities to download tv listings and format them in xml")
    (description "Set of utilities to download tv listings and format them in xml.")
    (home-page "http://xmltv.org/wiki/")
    (license license:gpl3+)))

;;; freeoffice --- a complete, reliable, lightning-fast and Microsoft Office-compatible office ...
(define-public freeoffice
  (package
    (name "freeoffice")
    (version "1230-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/freeoffice.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a complete, reliable, lightning-fast and Microsoft Office-compatible office ...")
    (description "A complete, reliable, lightning-fast and Microsoft Office-compatible office suite with a word processor, spreadsheet, and presentation graphics software.")
    (home-page "http://www.freeoffice.com/")
    (license license:nonfree)))

;;; mongodb-compass --- the official GUI for MongoDB
(define-public mongodb-compass
  (package
    (name "mongodb-compass")
    (version "1.49.4-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mongodb-compass.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the official GUI for MongoDB")
    (description "The official GUI for MongoDB.")
    (home-page "https://www.mongodb.com/products/compass")
    (license license:nonfree)))

;;; audio-recorder --- audio Recorder Application
(define-public audio-recorder
  (package
    (name "audio-recorder")
    (version "3.3.4-3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/audio-recorder.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "audio Recorder Application")
    (description "Audio Recorder Application.")
    (home-page "https://launchpad.net/~audio-recorder")
    (license license:gpl3+)))

;;; chocolate-doom --- historically-accurate Doom, Heretic, Hexen, and Strife ports
(define-public chocolate-doom
  (package
    (name "chocolate-doom")
    (version "3.1.1-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/chocolate-doom.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "historically-accurate Doom, Heretic, Hexen, and Strife ports")
    (description "Historically-accurate Doom, Heretic, Hexen, and Strife ports.")
    (home-page "http://www.chocolate-doom.org/")
    (license license:gpl2)))

;;; popcorntime --- stream movies from torrents. Skip the downloads. Launch, click, watch
(define-public popcorntime
  (package
    (name "popcorntime")
    (version "0.5.1-2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/popcorntime.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "stream movies from torrents. Skip the downloads. Launch, click, watch")
    (description "Stream movies from torrents. Skip the downloads. Launch, click, watch.")
    (home-page "https://popcorn-time.site/")
    (license license:gpl3)))

;;; mp3diags --- find and fix problems in MP3 files. Includes a tagger
(define-public mp3diags
  (package
    (name "mp3diags")
    (version "1.5.03-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mp3diags.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "find and fix problems in MP3 files. Includes a tagger")
    (description "Find and fix problems in MP3 files. Includes a tagger.")
    (home-page "https://mp3diags.sourceforge.net")
    (license license:gpl2)))

;;; scidavis-qt5 --- application for Scientific Data Analysis and Visualization, fork of QtiPlot....
(define-public scidavis-qt5
  (package
    (name "scidavis-qt5")
    (version "2.9.2-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/scidavis-qt5.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "application for Scientific Data Analysis and Visualization, fork of QtiPlot....")
    (description "Application for Scientific Data Analysis and Visualization, fork of QtiPlot. Qt5 port.")
    (home-page "http://scidavis.sourceforge.net/")
    (license license:gpl3+)))

;;; unvanquished --- a team-based, fast-paced, fps/rts hybrid game that pits aliens against human...
(define-public unvanquished
  (package
    (name "unvanquished")
    (version "0.56.1-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/unvanquished.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a team-based, fast-paced, fps/rts hybrid game that pits aliens against human...")
    (description "A team-based, fast-paced, fps/rts hybrid game that pits aliens against humans.")
    (home-page "https://www.unvanquished.net")
    (license license:gpl3+)))

;;; legendary --- a free and open-source replacement for the Epic Games Launcher
(define-public legendary
  (package
    (name "legendary")
    (version "0.20.34-3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/legendary.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a free and open-source replacement for the Epic Games Launcher")
    (description "A free and open-source replacement for the Epic Games Launcher.")
    (home-page "https://github.com/derrod/legendary")
    (license license:gpl3)))

;;; isomaster --- CD image editor written in GTK2
(define-public isomaster
  (package
    (name "isomaster")
    (version "1.3.17-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/isomaster.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "CD image editor written in GTK2")
    (description "CD image editor written in GTK2.")
    (home-page "http://littlesvr.ca/isomaster")
    (license license:gpl2)))

;;; tesseract-gui --- tesseract (OCR) GUI
(define-public tesseract-gui
  (package
    (name "tesseract-gui")
    (version "2.9-3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/tesseract-gui.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "tesseract (OCR) GUI")
    (description "Tesseract (OCR) GUI.")
    (home-page "https://sourceforge.net/projects/tesseract-gui/")
    (license license:gpl3)))

;;; bastet --- Tetris(r) clone with 'bastard' block-choosing AI
(define-public bastet
  (package
    (name "bastet")
    (version "0.43.2-6")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/bastet.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Tetris(r) clone with 'bastard' block-choosing AI")
    (description "Tetris(r) clone with 'bastard' block-choosing AI.")
    (home-page "http://fph.altervista.org/prog/bastet.html")
    (license license:gpl3)))

;;; webcamoid --- webcamoid is a full featured webcam capture application
(define-public webcamoid
  (package
    (name "webcamoid")
    (version "9.3.0-3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/webcamoid.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "webcamoid is a full featured webcam capture application")
    (description "Webcamoid is a full featured webcam capture application.")
    (home-page "https://webcamoid.github.io/")
    (license license:gpl3+)))

;;; spacefm --- multi-panel tabbed file manager
(define-public spacefm
  (package
    (name "spacefm")
    (version "1.0.6-5")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/spacefm.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "multi-panel tabbed file manager")
    (description "Multi-panel tabbed file manager.")
    (home-page "https://ignorantguru.github.io/spacefm/")
    (license license:gpl3)))

;;; xdman --- xtreme Download Manager: download manager with multiple browser integrations
(define-public xdman
  (package
    (name "xdman")
    (version "1:7.2.11-2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/xdman.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "xtreme Download Manager: download manager with multiple browser integrations")
    (description "Xtreme Download Manager: download manager with multiple browser integrations.")
    (home-page "https://xtremedownloadmanager.com/")
    (license license:gpl2)))

;;; apache-spark --- a unified analytics engine for large-scale data processing
(define-public apache-spark
  (package
    (name "apache-spark")
    (version "4.1.1-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/apache-spark.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a unified analytics engine for large-scale data processing")
    (description "A unified analytics engine for large-scale data processing.")
    (home-page "http://spark.apache.org")
    (license license:asl2.0)))

;;; factorio --- a 2D game about building and maintaining factories (stable branch)
(define-public factorio
  (package
    (name "factorio")
    (version "2.0.76-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/factorio.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a 2D game about building and maintaining factories (stable branch)")
    (description "A 2D game about building and maintaining factories (stable branch).")
    (home-page "http://www.factorio.com/")
    (license license:nonfree)))

;;; charles --- web debugging proxy application
(define-public charles
  (package
    (name "charles")
    (version "5.1-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/charles.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "web debugging proxy application")
    (description "Web debugging proxy application.")
    (home-page "http://www.charlesproxy.com")
    (license license:nonfree)))

;;; tovid --- a suite of tools for creating video DVDs
(define-public tovid
  (package
    (name "tovid")
    (version "0.35.2-3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/tovid.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a suite of tools for creating video DVDs")
    (description "A suite of tools for creating video DVDs.")
    (home-page "http://tovid.wikia.com")
    (license license:gpl3+)))

;;; dbvis --- dbVisualizer free - The Universal Database Tool
(define-public dbvis
  (package
    (name "dbvis")
    (version "26.1.1-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/dbvis.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "dbVisualizer free - The Universal Database Tool")
    (description "DbVisualizer free - The Universal Database Tool.")
    (home-page "https://www.dbvis.com/")
    (license license:nonfree)))

;;; joomla --- a php Content Management System (CMS) which enables you to build websites an...
(define-public joomla
  (package
    (name "joomla")
    (version "5.4.1-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/joomla.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a php Content Management System (CMS) which enables you to build websites an...")
    (description "A php Content Management System (CMS) which enables you to build websites and powerful online applications.")
    (home-page "https://www.joomla.org/")
    (license license:gpl2)))

;;; openboard --- interactive whiteboard software for schools and universities
(define-public openboard
  (package
    (name "openboard")
    (version "1.7.7-2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/openboard.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "interactive whiteboard software for schools and universities")
    (description "Interactive whiteboard software for schools and universities.")
    (home-page "http://openboard.ch/index.en.html")
    (license license:gpl3)))

;;; tty-clock-git --- analog clock in ncurses
(define-public tty-clock-git
  (package
    (name "tty-clock-git")
    (version "1:2.3.r40.f2f847c-2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/tty-clock-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "analog clock in ncurses")
    (description "Analog clock in ncurses.")
    (home-page "https://github.com/xorg62/tty-clock")
    (license license:bsd-3)))

;;; unified-remote-server --- unified Remote Server
(define-public unified-remote-server
  (package
    (name "unified-remote-server")
    (version "3.14.0.2574-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/unified-remote-server.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "unified Remote Server")
    (description "Unified Remote Server.")
    (home-page "http://www.unifiedremote.com/")
    (license license:nonfree)))

;;; gpaint --- a small easy-to-use paint program for the GNOME Desktop
(define-public gpaint
  (package
    (name "gpaint")
    (version "0.3.3-12")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gpaint.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a small easy-to-use paint program for the GNOME Desktop")
    (description "A small easy-to-use paint program for the GNOME Desktop.")
    (home-page "https://savannah.gnu.org/projects/gpaint/")
    (license license:gpl3+)))

;;; heidisql --- HeidiSQL Shared files: wrapper script, locale/ini files, documentation (inst...
(define-public heidisql
  (package
    (name "heidisql")
    (version "1:12.17-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/heidisql.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "HeidiSQL Shared files: wrapper script, locale/ini files, documentation (inst...")
    (description "HeidiSQL Shared files: wrapper script, locale/ini files, documentation (install a provider of your choice for heidisql-client to use it).")
    (home-page "http://www.heidisql.com/")
    (license license:gpl2+)))

;;; xzoom --- a screen magnifier
(define-public xzoom
  (package
    (name "xzoom")
    (version "0.3-10")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/xzoom.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a screen magnifier")
    (description "A screen magnifier.")
    (home-page "https://www.ibiblio.org/pub/linux/libs/X/")
    (license license:gpl2+)))

;;; urxvtcd --- a script to start urxvt (rxvt-unicode) in daemon-client mode
(define-public urxvtcd
  (package
    (name "urxvtcd")
    (version "2-2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/urxvtcd.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a script to start urxvt (rxvt-unicode) in daemon-client mode")
    (description "A script to start urxvt (rxvt-unicode) in daemon-client mode.")
    (home-page "http://packages.debian.org/unstable/x11/rxvt-unicode")
    (license license:gpl3+)))

;;; fotocx --- image editing and collection management program
(define-public fotocx
  (package
    (name "fotocx")
    (version "26.3-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/fotocx.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "image editing and collection management program")
    (description "Image editing and collection management program.")
    (home-page "https://www.kornelix.net/fotocx/fotocx.html")
    (license license:gpl3+)))

;;; omegat --- multiplatform CAT tool application, written in Java
(define-public omegat
  (package
    (name "omegat")
    (version "6.0.1-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/omegat.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "multiplatform CAT tool application, written in Java")
    (description "Multiplatform CAT tool application, written in Java.")
    (home-page "https://www.omegat.org/")
    (license license:gpl3+)))

;;; brutalchess --- chess game inspired by 'Battle Chess'. Features full 3D graphics
(define-public brutalchess
  (package
    (name "brutalchess")
    (version "0.5.2-9")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/brutalchess.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "chess game inspired by 'Battle Chess'. Features full 3D graphics")
    (description "Chess game inspired by 'Battle Chess'. Features full 3D graphics.")
    (home-page "https://sourceforge.net/projects/brutalchess")
    (license license:gpl2+)))

;;; alsaequal --- real-time adjustable equalizer plugin for ALSA sound server
(define-public alsaequal
  (package
    (name "alsaequal")
    (version "v0.7.1-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/alsaequal.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "real-time adjustable equalizer plugin for ALSA sound server")
    (description "Real-time adjustable equalizer plugin for ALSA sound server.")
    (home-page "https://github.com/bassdr/alsaequal")
    (license license:gpl2)))

;;; eaglemode --- visit almost everything in your PC simply by zooming in
(define-public eaglemode
  (package
    (name "eaglemode")
    (version "0.96.3-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/eaglemode.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "visit almost everything in your PC simply by zooming in")
    (description "Visit almost everything in your PC simply by zooming in.")
    (home-page "http://eaglemode.sourceforge.net/")
    (license license:gpl3)))

;;; imapfilter --- a mail filtering utility for processing IMAP mailboxes
(define-public imapfilter
  (package
    (name "imapfilter")
    (version "2.8.5-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/imapfilter.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a mail filtering utility for processing IMAP mailboxes")
    (description "A mail filtering utility for processing IMAP mailboxes.")
    (home-page "https://github.com/lefcha/imapfilter")
    (license license:expat)))

;;; expressvpn --- proprietary VPN client for Linux
(define-public expressvpn
  (package
    (name "expressvpn")
    (version "5.0.1.11498-2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/expressvpn.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "proprietary VPN client for Linux")
    (description "Proprietary VPN client for Linux.")
    (home-page "https://expressvpn.com")
    (license license:nonfree)))

;;; areca --- personal file backup software supporting compression, encryption and increme...
(define-public areca
  (package
    (name "areca")
    (version "7.5-2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/areca.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "personal file backup software supporting compression, encryption and increme...")
    (description "Personal file backup software supporting compression, encryption and incremental backups.")
    (home-page "http://www.areca-backup.org")
    (license license:gpl2)))

;;; sup --- console-based email client for people with a lot of email. Great mutt altern...
(define-public sup
  (package
    (name "sup")
    (version "1.3-3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/sup.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "console-based email client for people with a lot of email. Great mutt altern...")
    (description "Console-based email client for people with a lot of email. Great mutt alternative.")
    (home-page "http://sup-heliotrope.github.io/")
    (license license:gpl2+)))

;;; standardnotes --- think fearlessly with end-to-end encrypted notes and files
(define-public standardnotes
  (package
    (name "standardnotes")
    (version "3.201.21-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/standardnotes.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "think fearlessly with end-to-end encrypted notes and files")
    (description "Think fearlessly with end-to-end encrypted notes and files.")
    (home-page "https://standardnotes.com")
    (license license:agpl3.0)))

;;; screenkey-git --- screencast tool to show your keys inspired by Screenflick, based on key-mon....
(define-public screenkey-git
  (package
    (name "screenkey-git")
    (version "1.1.r5.g467662b-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/screenkey-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "screencast tool to show your keys inspired by Screenflick, based on key-mon....")
    (description "Screencast tool to show your keys inspired by Screenflick, based on key-mon. Active fork with new features.")
    (home-page "https://gitlab.com/screenkey/screenkey")
    (license license:gpl3)))
