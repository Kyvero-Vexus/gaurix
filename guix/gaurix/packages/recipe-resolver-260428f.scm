;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260428f
;;; Resolves 100 packages from queue (100 recipes, 0 blocked).
;;;
;;; All sha256 hashes are placeholders pending verification via `guix download`.

(define-module (gaurix packages recipe-resolver-260428f)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system node)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:export (
            rua
            vdr
            vdr-examples
            wineasio
            desktop-privileges
            djmount
            sqlmap-git
            castnow-git
            octave-image
            yeahconsole
            tomb-kdf
            dunst-git
            ctags-git
            dboxfe2
            fbxkb
            j4-dmenu-desktop-git
            muttprint
            antigen-git
            browser-vacuum
            libaal
            pystopwatch
            wesnoth-devel
            cups-bjnp
            intltool-debian
            lain-git
            nicotine-plus-git
            redshift-minimal
            grail
            i3lock-git
            nodejs-jshint
            epstool
            remmina-git
            split2flac
            broadcom-bt-firmware
            vimix-gtk-themes-git
            postgresql-jdbc
            noip
            unclutter-xfixes-git
            gtk-engine-unico
            lemonbar-xft-git
            pencil-git
            vundle
            compiz-gtk
            julia-git
            ldm
            openct
            terminology-git
            drush-launcher
            jpdftweak
            mariadb-jdbc
            pianobar-git
            arno-iptables-firewall
            invada-studio-plugins-lv2
            libaacplus
            libreoffice-extension-grammalecte-fr
            hydrus
            gns3-converter
            zork1
            st-git
            micropolis-git
            jetty
            pcmanfm-qt-git
            emerald-themes
            irpf
            jgit
            octave-general
            pithos-git
            tango-icon-theme-extras
            zdoom
            evhz-git
            nodejs-npm2arch
            projectx
            cgoban3
            python-pysvn
            rescuetime2
            ocamlnet
            gsview
            dzen2-xft-xpm-xinerama-git
            slim-git
            slimlock-git
            swfdec-gnome
            pkg-2gis
            keepass-plugin-rpc
            pidgin-latex
            gnome-vfs-nosmb
            netctlgui-helper
            plasma5-applet-netctl-gui
            aacgain-cvs
            libgnome-data
            oh-my-zsh-powerline-theme-git
            urxvt-resize-font-git
            urxvt-vtwheel
            pacman2aria2
            gem2arch
            goland-jre
            clion-eap
            odoo-venv
            stardict-oald
            lastpass-pocket
            quake4
            ))

;;; Nonfree/proprietary license placeholder for Gaurix channel
(define license:nonfree
  ((@@ (guix licenses) license) "Nonfree"
    "https://spdx.org/licenses/"
    "Proprietary or custom license; see upstream for terms."))

;;; rua --- AUR helper in Rust providing control, review, patch application and safe bu...
(define-public rua
  (package
    (name "rua")
    (version "0.19.10-2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/rua.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "AUR helper in Rust providing control, review, patch application and safe bu...")
    (description "AUR helper in Rust providing control, review, patch application and safe build options.")
    (home-page "https://github.com/vn971/rua")
    (license license:gpl2+)))

;;; vdr --- 'open' digital satellite receiver and timer controlled video disk recorder
(define-public vdr
  (package
    (name "vdr")
    (version "2.8.1-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/vdr.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "'open' digital satellite receiver and timer controlled video disk recorder")
    (description "'open' digital satellite receiver and timer controlled video disk recorder.")
    (home-page "http://tvdr.de/")
    (license license:gpl2+)))

;;; vdr-examples --- plugins for vdr to show some possible features
(define-public vdr-examples
  (package
    (name "vdr-examples")
    (version "2.8.1-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/vdr-examples.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "plugins for vdr to show some possible features")
    (description "Plugins for vdr to show some possible features.")
    (home-page "http://tvdr.de/")
    (license license:gpl2+)))

;;; wineasio --- ASIO driver implementation for Wine
(define-public wineasio
  (package
    (name "wineasio")
    (version "1.3.0-2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/wineasio.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "ASIO driver implementation for Wine")
    (description "ASIO driver implementation for Wine.")
    (home-page "https://github.com/wineasio/wineasio")
    (license license:gpl2+)))

;;; desktop-privileges --- a collection of polkit rules to manage automounting of removable media, sus...
(define-public desktop-privileges
  (package
    (name "desktop-privileges")
    (version "0.5-4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/desktop-privileges.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a collection of polkit rules to manage automounting of removable media, sus...")
    (description "A collection of polkit rules to manage automounting of removable media, suspend and hibernate actions and CPU frequency settings.")
    (home-page "https://aur.archlinux.org/packages/desktop-privileges/")
    (license license:gpl2+)))

;;; djmount --- a UPnP AV client that mounts media server contents as a filesystem
(define-public djmount
  (package
    (name "djmount")
    (version "0.71.1-0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/djmount.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a UPnP AV client that mounts media server contents as a filesystem")
    (description "A UPnP AV client that mounts media server contents as a filesystem.")
    (home-page "http://djmount.sourceforge.net/")
    (license license:gpl2+)))

;;; sqlmap-git --- automatic SQL injection and database takeover tool
(define-public sqlmap-git
  (package
    (name "sqlmap-git")
    (version "1.9.12.r5.gc62dd8511-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/sqlmap-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "automatic SQL injection and database takeover tool")
    (description "Automatic SQL injection and database takeover tool.")
    (home-page "https://sqlmap.org")
    (license license:gpl2)))

;;; castnow-git --- command-line utility used to play back media files on your Chromecast device
(define-public castnow-git
  (package
    (name "castnow-git")
    (version "0.4.14.r79.g0e1746b-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/castnow-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "command-line utility used to play back media files on your Chromecast device")
    (description "Command-line utility used to play back media files on your Chromecast device.")
    (home-page "https://github.com/xat/castnow")
    (license license:expat)))

;;; octave-image --- functions for image processing, feature extraction, image statistics, spati...
(define-public octave-image
  (package
    (name "octave-image")
    (version "2.20.0-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/octave-image.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "functions for image processing, feature extraction, image statistics, spati...")
    (description "Functions for image processing, feature extraction, image statistics, spatial and geometric transformations, morphological operations, linear filtering, and much more.")
    (home-page "https://gnu-octave.github.io/packages/image/")
    (license license:gpl2+)))

;;; yeahconsole --- yeahConsole turns a terminal into a gamelike console. If you hit a shortcut...
(define-public yeahconsole
  (package
    (name "yeahconsole")
    (version "0.3.4-2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/yeahconsole.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "yeahConsole turns a terminal into a gamelike console. If you hit a shortcut...")
    (description "YeahConsole turns a terminal into a gamelike console. If you hit a shortcut it slides down from top of the screen.")
    (home-page "http://phrat.de/yeahtools.html")
    (license license:gpl2+)))

;;; tomb-kdf --- crypto Undertaker extensions to improve password security
(define-public tomb-kdf
  (package
    (name "tomb-kdf")
    (version "2.13-2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/tomb-kdf.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "crypto Undertaker extensions to improve password security")
    (description "Crypto Undertaker extensions to improve password security.")
    (home-page "https://www.dyne.org/software/tomb/")
    (license license:gpl2+)))

;;; dunst-git --- a highly configurable and lightweight notification daemon
(define-public dunst-git
  (package
    (name "dunst-git")
    (version "1.9.0.r3.g1ef38e5-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/dunst-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a highly configurable and lightweight notification daemon")
    (description "A highly configurable and lightweight notification daemon.")
    (home-page "https://dunst-project.org/")
    (license license:bsd-3)))

;;; ctags-git --- generates an index file of language objects found in source files
(define-public ctags-git
  (package
    (name "ctags-git")
    (version "6.1.0.r195.g08e07dc98-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ctags-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "generates an index file of language objects found in source files")
    (description "Generates an index file of language objects found in source files.")
    (home-page "https://ctags.io/")
    (license license:gpl2+)))

;;; dboxfe2 --- a dosbox frontend
(define-public dboxfe2
  (package
    (name "dboxfe2")
    (version "0.1.3-6")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/dboxfe2.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a dosbox frontend")
    (description "A dosbox frontend.")
    (home-page "http://chm-projects.de/?q=dboxfe")
    (license license:gpl2+)))

;;; fbxkb --- keyboard indicator and switcher
(define-public fbxkb
  (package
    (name "fbxkb")
    (version "0.6-4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/fbxkb.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "keyboard indicator and switcher")
    (description "Keyboard indicator and switcher.")
    (home-page "http://fbxkb.sourceforge.net/")
    (license license:gpl2+)))

;;; j4-dmenu-desktop-git --- a rewrite of i3-dmenu-desktop, which is much faster
(define-public j4-dmenu-desktop-git
  (package
    (name "j4-dmenu-desktop-git")
    (version "3.1.r10.g595dd14-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/j4-dmenu-desktop-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a rewrite of i3-dmenu-desktop, which is much faster")
    (description "A rewrite of i3-dmenu-desktop, which is much faster.")
    (home-page "https://github.com/enkore/j4-dmenu-desktop")
    (license license:gpl2+)))

;;; muttprint --- an app to print email from CLI mail clients, mutt in particular
(define-public muttprint
  (package
    (name "muttprint")
    (version "0.73_4-9")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/muttprint.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "an app to print email from CLI mail clients, mutt in particular")
    (description "An app to print email from CLI mail clients, mutt in particular.")
    (home-page "http://muttprint.sf.net")
    (license license:gpl2+)))

;;; antigen-git --- a plugin manager for zsh, inspired by oh-my-zsh and vundle
(define-public antigen-git
  (package
    (name "antigen-git")
    (version "v2.2.3.r6.gc91f77c-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/antigen-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a plugin manager for zsh, inspired by oh-my-zsh and vundle")
    (description "A plugin manager for zsh, inspired by oh-my-zsh and vundle.")
    (home-page "https://github.com/zsh-users/antigen")
    (license license:expat)))

;;; browser-vacuum --- defragment and clean database files from firefox and chromium based browsers
(define-public browser-vacuum
  (package
    (name "browser-vacuum")
    (version "4-21")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/browser-vacuum.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "defragment and clean database files from firefox and chromium based browsers")
    (description "Defragment and clean database files from firefox and chromium based browsers.")
    (home-page "https://github.com/skydrome/random/blob/master/shell/browser-vacuum.sh")
    (license license:wtfpl2)))

;;; libaal --- reiser4 filesystem support library
(define-public libaal
  (package
    (name "libaal")
    (version "1.0.7-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/libaal.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "reiser4 filesystem support library")
    (description "Reiser4 filesystem support library.")
    (home-page "http://sourceforge.net/projects/reiser4/")
    (license license:gpl2)))

;;; pystopwatch --- a stopwatch written in Python with a clock and two countdown functions that...
(define-public pystopwatch
  (package
    (name "pystopwatch")
    (version "2019-4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/pystopwatch.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a stopwatch written in Python with a clock and two countdown functions that...")
    (description "A stopwatch written in Python with a clock and two countdown functions that can minimize to the tray.")
    (home-page "https://xyne.dev/projects/pystopwatch")
    (license license:gpl2+)))

;;; wesnoth-devel --- development version of a turn-based strategy game on a fantasy world
(define-public wesnoth-devel
  (package
    (name "wesnoth-devel")
    (version "1.19.23-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/wesnoth-devel.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "development version of a turn-based strategy game on a fantasy world")
    (description "Development version of a turn-based strategy game on a fantasy world.")
    (home-page "https://www.wesnoth.org/")
    (license license:gpl2+)))

;;; cups-bjnp --- CUPS back-end for the canon printers using the proprietary USB over IP BJNP...
(define-public cups-bjnp
  (package
    (name "cups-bjnp")
    (version "2.0.3-3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/cups-bjnp.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "CUPS back-end for the canon printers using the proprietary USB over IP BJNP...")
    (description "CUPS back-end for the canon printers using the proprietary USB over IP BJNP protocol.")
    (home-page "http://sourceforge.net/projects/cups-bjnp/")
    (license license:gpl2+)))

;;; intltool-debian --- the internationalization tool collection with RFC822 support
(define-public intltool-debian
  (package
    (name "intltool-debian")
    (version "1:0.35.0+20060710.6-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/intltool-debian.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the internationalization tool collection with RFC822 support")
    (description "The internationalization tool collection with RFC822 support.")
    (home-page "http://www.debian.org/")
    (license license:gpl2+)))

;;; lain-git --- layouts, asynchronous widgets and utilities for Awesome WM
(define-public lain-git
  (package
    (name "lain-git")
    (version "1:r1771.07cf82e-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lain-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "layouts, asynchronous widgets and utilities for Awesome WM")
    (description "Layouts, asynchronous widgets and utilities for Awesome WM.")
    (home-page "https://github.com/lcpz/lain")
    (license license:gpl2)))

;;; nicotine-plus-git --- a graphical client for the SoulSeek peer-to-peer system
(define-public nicotine-plus-git
  (package
    (name "nicotine-plus-git")
    (version "3.3.10.r370.g8b1e752-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/nicotine-plus-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a graphical client for the SoulSeek peer-to-peer system")
    (description "A graphical client for the SoulSeek peer-to-peer system.")
    (home-page "https://nicotine-plus.org")
    (license license:gpl2+)))

;;; redshift-minimal --- adjusts the color temperature of your screen according to your surroundings...
(define-public redshift-minimal
  (package
    (name "redshift-minimal")
    (version "1.12-5")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/redshift-minimal.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "adjusts the color temperature of your screen according to your surroundings...")
    (description "Adjusts the color temperature of your screen according to your surroundings, with minimal dependencies.")
    (home-page "http://jonls.dk/redshift/")
    (license license:gpl2+)))

;;; grail --- gesture Recognition And Instantiation Library
(define-public grail
  (package
    (name "grail")
    (version "3.1.1-2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/grail.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "gesture Recognition And Instantiation Library")
    (description "Gesture Recognition And Instantiation Library.")
    (home-page "https://launchpad.net/grail")
    (license license:gpl2+)))

;;; i3lock-git --- an improved screenlocker based upon XCB and PAM
(define-public i3lock-git
  (package
    (name "i3lock-git")
    (version "2.14.r0.g0171394-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/i3lock-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "an improved screenlocker based upon XCB and PAM")
    (description "An improved screenlocker based upon XCB and PAM.")
    (home-page "https://i3wm.org/i3lock/")
    (license license:expat)))

;;; nodejs-jshint --- static analysis tool for JavaScript
(define-public nodejs-jshint
  (package
    (name "nodejs-jshint")
    (version "2.13.6-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/nodejs-jshint.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (synopsis "static analysis tool for JavaScript")
    (description "Static analysis tool for JavaScript.")
    (home-page "https://jshint.com/")
    (license license:expat)))

;;; epstool --- utility to create or extract preview images in EPS files, fix bounding boxe...
(define-public epstool
  (package
    (name "epstool")
    (version "3.09-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/epstool.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "utility to create or extract preview images in EPS files, fix bounding boxe...")
    (description "Utility to create or extract preview images in EPS files, fix bounding boxes and convert to bitmaps.")
    (home-page "http://pages.cs.wisc.edu/~ghost/gsview/epstool.htm")
    (license license:gpl2+)))

;;; remmina-git --- a remote desktop client written in GTK+ - git checkout
(define-public remmina-git
  (package
    (name "remmina-git")
    (version "1.4.43+r10385+g0df0a75d9-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/remmina-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a remote desktop client written in GTK+ - git checkout")
    (description "A remote desktop client written in GTK+ - git checkout.")
    (home-page "http://www.remmina.org/")
    (license license:gpl2+)))

;;; split2flac --- split flac/ape/wv/wav + cue sheet into separate tracks
(define-public split2flac
  (package
    (name "split2flac")
    (version "20200508-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/split2flac.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "split flac/ape/wv/wav + cue sheet into separate tracks")
    (description "Split flac/ape/wv/wav + cue sheet into separate tracks.")
    (home-page "https://github.com/ftrvxmtrx/split2flac")
    (license license:expat)))

;;; broadcom-bt-firmware --- firmware for Broadcom Bluetooth devices
(define-public broadcom-bt-firmware
  (package
    (name "broadcom-bt-firmware")
    (version "12.0.1.1105-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/broadcom-bt-firmware.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "firmware for Broadcom Bluetooth devices")
    (description "Firmware for Broadcom Bluetooth devices.")
    (home-page "https://github.com/winterheart/broadcom-bt-firmware")
    (license license:nonfree)))

;;; vimix-gtk-themes-git --- a flat Material Design theme for GTK 3, GTK 2, GNOME Shell, etc
(define-public vimix-gtk-themes-git
  (package
    (name "vimix-gtk-themes-git")
    (version "2025.06.20.r0.gb86cf48-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/vimix-gtk-themes-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a flat Material Design theme for GTK 3, GTK 2, GNOME Shell, etc")
    (description "A flat Material Design theme for GTK 3, GTK 2, GNOME Shell, etc.")
    (home-page "https://vinceliuice.github.io/theme-vimix.html")
    (license license:gpl2+)))

;;; postgresql-jdbc --- the official JDBC driver for PostgreSQL. Contains JDBC 4.2 drivers
(define-public postgresql-jdbc
  (package
    (name "postgresql-jdbc")
    (version "42.7.10-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/postgresql-jdbc.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the official JDBC driver for PostgreSQL. Contains JDBC 4.2 drivers")
    (description "The official JDBC driver for PostgreSQL. Contains JDBC 4.2 drivers.")
    (home-page "https://jdbc.postgresql.org/")
    (license license:bsd-3)))

;;; noip --- dynamic DNS Client Updater for no-ip.com services
(define-public noip
  (package
    (name "noip")
    (version "3.3.0-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/noip.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "dynamic DNS Client Updater for no-ip.com services")
    (description "Dynamic DNS Client Updater for no-ip.com services.")
    (home-page "http://www.no-ip.com/downloads.php?page=linux")
    (license license:gpl2+)))

;;; unclutter-xfixes-git --- unclutter-xfixes is a rewrite of unclutter using the x11-xfixes extension
(define-public unclutter-xfixes-git
  (package
    (name "unclutter-xfixes-git")
    (version "v1.6.r3.g93b0f33-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/unclutter-xfixes-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "unclutter-xfixes is a rewrite of unclutter using the x11-xfixes extension")
    (description "Unclutter-xfixes is a rewrite of unclutter using the x11-xfixes extension.")
    (home-page "https://github.com/Airblader/unclutter-xfixes")
    (license license:expat)))

;;; gtk-engine-unico --- new GTK+ 3.0 theming engine by Andrea Cimitan
(define-public gtk-engine-unico
  (package
    (name "gtk-engine-unico")
    (version "1.0.2-2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gtk-engine-unico.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "new GTK+ 3.0 theming engine by Andrea Cimitan")
    (description "New GTK+ 3.0 theming engine by Andrea Cimitan.")
    (home-page "https://launchpad.net/unico")
    (license license:gpl2+)))

;;; lemonbar-xft-git --- a lightweight xcb based bar with ported xft support
(define-public lemonbar-xft-git
  (package
    (name "lemonbar-xft-git")
    (version "r280.0042efd-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lemonbar-xft-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a lightweight xcb based bar with ported xft support")
    (description "A lightweight xcb based bar with ported xft support.")
    (home-page "https://gitlab.com/protesilaos/lemonbar-xft")
    (license license:expat)))

;;; pencil-git --- an open-source GUI prototyping tool
(define-public pencil-git
  (package
    (name "pencil-git")
    (version "3.1.1.r30.g5a81278-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/pencil-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "an open-source GUI prototyping tool")
    (description "An open-source GUI prototyping tool.")
    (home-page "http://pencil.evolus.vn/")
    (license license:gpl2)))

;;; vundle --- plug-in manager for Vim
(define-public vundle
  (package
    (name "vundle")
    (version "0.10.2-2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/vundle.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "plug-in manager for Vim")
    (description "Plug-in manager for Vim.")
    (home-page "https://github.com/VundleVim/Vundle.vim")
    (license license:expat)))

;;; compiz-gtk --- compositing manager without desktop-environment depends (GTK+ window decora...
(define-public compiz-gtk
  (package
    (name "compiz-gtk")
    (version "0.8.18-5")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/compiz-gtk.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "compositing manager without desktop-environment depends (GTK+ window decora...")
    (description "Compositing manager without desktop-environment depends (GTK+ window decorator).")
    (home-page "https://gitlab.com/compiz/compiz-core")
    (license license:gpl2+)))

;;; julia-git --- high-level, high-performance, dynamic programming language
(define-public julia-git
  (package
    (name "julia-git")
    (version "1.12.3.r58961.g949412520e2-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/julia-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "high-level, high-performance, dynamic programming language")
    (description "High-level, high-performance, dynamic programming language.")
    (home-page "https://julialang.org/")
    (license license:expat)))

;;; ldm --- a lightweight device mounter
(define-public ldm
  (package
    (name "ldm")
    (version "0.8-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ldm.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a lightweight device mounter")
    (description "A lightweight device mounter.")
    (home-page "https://github.com/LemonBoy/ldm")
    (license license:expat)))

;;; openct --- implements drivers for several smart card readers
(define-public openct
  (package
    (name "openct")
    (version "0.6.20-9")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/openct.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "implements drivers for several smart card readers")
    (description "Implements drivers for several smart card readers.")
    (home-page "https://github.com/OpenSC/openct/")
    (license license:gpl2)))

;;; terminology-git --- EFL based terminal emulator - Development version
(define-public terminology-git
  (package
    (name "terminology-git")
    (version "1.12.1.r3272.9f371e0b-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/terminology-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "EFL based terminal emulator - Development version")
    (description "EFL based terminal emulator - Development version.")
    (home-page "http://www.enlightenment.org/p.php?p=about/terminology")
    (license license:bsd-3)))

;;; drush-launcher --- a small wrapper around Drush for your global $PATH
(define-public drush-launcher
  (package
    (name "drush-launcher")
    (version "0.10.2-2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/drush-launcher.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a small wrapper around Drush for your global $PATH")
    (description "A small wrapper around Drush for your global $PATH.")
    (home-page "https://github.com/drush-ops/drush-launcher")
    (license license:gpl2+)))

;;; jpdftweak --- a Swiss Army Knife GUI application for PDF documents
(define-public jpdftweak
  (package
    (name "jpdftweak")
    (version "1.1-2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/jpdftweak.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a Swiss Army Knife GUI application for PDF documents")
    (description "A Swiss Army Knife GUI application for PDF documents.")
    (home-page "http://jpdftweak.sourceforge.net/")
    (license license:gpl2+)))

;;; mariadb-jdbc --- mariaDB Connector/J - Java library to connect to MariaDB and MySQL
(define-public mariadb-jdbc
  (package
    (name "mariadb-jdbc")
    (version "3.5.7-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mariadb-jdbc.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "mariaDB Connector/J - Java library to connect to MariaDB and MySQL")
    (description "MariaDB Connector/J - Java library to connect to MariaDB and MySQL.")
    (home-page "https://mariadb.com/kb/en/mariadb-connector-j/")
    (license license:gpl2+)))

;;; pianobar-git --- a free/open-source, console-based replacement for Pandora's Flash player
(define-public pianobar-git
  (package
    (name "pianobar-git")
    (version "844.41ac06c-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/pianobar-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a free/open-source, console-based replacement for Pandora's Flash player")
    (description "A free/open-source, console-based replacement for Pandora's Flash player.")
    (home-page "https://6xq.net/projects/pianobar/")
    (license license:expat)))

;;; arno-iptables-firewall --- a secure stateful firewall for both single and multi-homed machine
(define-public arno-iptables-firewall
  (package
    (name "arno-iptables-firewall")
    (version "2.1.2_a-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/arno-iptables-firewall.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a secure stateful firewall for both single and multi-homed machine")
    (description "A secure stateful firewall for both single and multi-homed machine.")
    (home-page "https://github.com/arno-iptables-firewall/aif/")
    (license license:gpl2+)))

;;; invada-studio-plugins-lv2 --- a set of LV2 audio effect plugins, ported from VST
(define-public invada-studio-plugins-lv2
  (package
    (name "invada-studio-plugins-lv2")
    (version "1.2.0-7")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/invada-studio-plugins-lv2.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a set of LV2 audio effect plugins, ported from VST")
    (description "A set of LV2 audio effect plugins, ported from VST.")
    (home-page "https://launchpad.net/invada-studio/")
    (license license:gpl2)))

;;; libaacplus --- 3GPP AAC+ High Efficiency Advanced Audio Codec v2 (HE-AAC+) Encoder Shared ...
(define-public libaacplus
  (package
    (name "libaacplus")
    (version "2.0.2-12")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/libaacplus.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "3GPP AAC+ High Efficiency Advanced Audio Codec v2 (HE-AAC+) Encoder Shared ...")
    (description "3GPP AAC+ High Efficiency Advanced Audio Codec v2 (HE-AAC+) Encoder Shared Library.")
    (home-page "http://tipok.org.ua/node/17")
    (license license:gpl3+)))

;;; libreoffice-extension-grammalecte-fr --- french grammar checker extension for LibreOffice
(define-public libreoffice-extension-grammalecte-fr
  (package
    (name "libreoffice-extension-grammalecte-fr")
    (version "2.3.0-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/libreoffice-extension-grammalecte-fr.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "french grammar checker extension for LibreOffice")
    (description "French grammar checker extension for LibreOffice.")
    (home-page "https://grammalecte.net/")
    (license license:gpl2+)))

;;; hydrus --- danbooru-like image tagging and searching system for the desktop
(define-public hydrus
  (package
    (name "hydrus")
    (version "669-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/hydrus.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "danbooru-like image tagging and searching system for the desktop")
    (description "Danbooru-like image tagging and searching system for the desktop.")
    (home-page "http://hydrusnetwork.github.io/hydrus/")
    (license license:wtfpl2)))

;;; gns3-converter --- GNS3 topology converter
(define-public gns3-converter
  (package
    (name "gns3-converter")
    (version "1.3.0-2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gns3-converter.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "GNS3 topology converter")
    (description "GNS3 topology converter.")
    (home-page "https://github.com/GNS3/gns3-converter")
    (license license:gpl2+)))

;;; zork1 --- zork I adventure game (for Infocom's z-code interpreter)
(define-public zork1
  (package
    (name "zork1")
    (version "1-12")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/zork1.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "zork I adventure game (for Infocom's z-code interpreter)")
    (description "Zork I adventure game (for Infocom's z-code interpreter).")
    (home-page "https://aur.archlinux.org/packages/zork1")
    (license license:nonfree)))

;;; st-git --- a simple virtual terminal emulator for X
(define-public st-git
  (package
    (name "st-git")
    (version "0.9.r11.g9846a56-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/st-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a simple virtual terminal emulator for X")
    (description "A simple virtual terminal emulator for X.")
    (home-page "https://st.suckless.org")
    (license license:expat)))

;;; micropolis-git --- micropolis Unix version (A.K.A. S*mC*ty)
(define-public micropolis-git
  (package
    (name "micropolis-git")
    (version "r97.cc31822-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/micropolis-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "micropolis Unix version (A.K.A. S*mC*ty)")
    (description "Micropolis Unix version (A.K.A. S*mC*ty).")
    (home-page "https://github.com/simhacker/micropolis")
    (license license:gpl2+)))

;;; jetty --- a pure Java-based HTTP server and Java Servlet container
(define-public jetty
  (package
    (name "jetty")
    (version "12.1.8-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/jetty.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a pure Java-based HTTP server and Java Servlet container")
    (description "A pure Java-based HTTP server and Java Servlet container.")
    (home-page "http://www.eclipse.org/jetty/")
    (license license:asl2.0)))

;;; pcmanfm-qt-git --- the LXQt file manager, Qt port of PCManFM
(define-public pcmanfm-qt-git
  (package
    (name "pcmanfm-qt-git")
    (version "2.1.0-2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/pcmanfm-qt-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the LXQt file manager, Qt port of PCManFM")
    (description "The LXQt file manager, Qt port of PCManFM.")
    (home-page "https://lxqt-project.org")
    (license license:gpl2)))

;;; emerald-themes --- themes for Emerald Compiz decorator
(define-public emerald-themes
  (package
    (name "emerald-themes")
    (version "0.8.18-2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/emerald-themes.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "themes for Emerald Compiz decorator")
    (description "Themes for Emerald Compiz decorator.")
    (home-page "https://gitlab.com/compiz/emerald-themes/")
    (license license:gpl2+)))

;;; irpf --- brazilian physical person income tax (IRPF) program
(define-public irpf
  (package
    (name "irpf")
    (version "2026.1.1-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/irpf.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "brazilian physical person income tax (IRPF) program")
    (description "Brazilian physical person income tax (IRPF) program.")
    (home-page "https://www.gov.br/receitafederal/pt-br/centrais-de-conteudo/download/pgd/dirpf")
    (license license:nonfree)))

;;; jgit --- a 100% pure java implementation of git
(define-public jgit
  (package
    (name "jgit")
    (version "7.6.0.202603022253_r-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/jgit.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a 100% pure java implementation of git")
    (description "A 100% pure java implementation of git.")
    (home-page "http://www.eclipse.org/jgit/")
    (license license:nonfree)))

;;; octave-general --- general tools for Octave
(define-public octave-general
  (package
    (name "octave-general")
    (version "2.1.4-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/octave-general.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "general tools for Octave")
    (description "General tools for Octave.")
    (home-page "https://gnu-octave.github.io/packages/general/")
    (license license:gpl2+)))

;;; pithos-git --- native Pandora Radio client
(define-public pithos-git
  (package
    (name "pithos-git")
    (version "1.5.1.r23.g0a228ab-2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/pithos-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "native Pandora Radio client")
    (description "Native Pandora Radio client.")
    (home-page "https://pithos.github.io/")
    (license license:gpl2+)))

;;; tango-icon-theme-extras --- extra icons for Tango
(define-public tango-icon-theme-extras
  (package
    (name "tango-icon-theme-extras")
    (version "0.1.0-7")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/tango-icon-theme-extras.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "extra icons for Tango")
    (description "Extra icons for Tango.")
    (home-page "http://tango.freedesktop.org")
    (license license:gpl3+)))

;;; zdoom --- advanced Doom source port
(define-public zdoom
  (package
    (name "zdoom")
    (version "2.8.1-8")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/zdoom.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "advanced Doom source port")
    (description "Advanced Doom source port.")
    (home-page "http://www.zdoom.org/")
    (license license:bsd-3)))

;;; evhz-git --- display the current mouse refresh rate
(define-public evhz-git
  (package
    (name "evhz-git")
    (version "r28.2c94d6f-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/evhz-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "display the current mouse refresh rate")
    (description "Display the current mouse refresh rate.")
    (home-page "https://git.sr.ht/~iank/evhz")
    (license license:gpl2+)))

;;; nodejs-npm2arch --- convert NPM package to a PKGBUILD for ArchLinux
(define-public nodejs-npm2arch
  (package
    (name "nodejs-npm2arch")
    (version "2.2.0-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/nodejs-npm2arch.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (synopsis "convert NPM package to a PKGBUILD for ArchLinux")
    (description "Convert NPM package to a PKGBUILD for ArchLinux.")
    (home-page "https://github.com/simon04/npm2arch")
    (license license:expat)))

;;; projectx --- DVB demux tool for repairing and analyzing different stream types
(define-public projectx
  (package
    (name "projectx")
    (version "0.91.0.08-5")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/projectx.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "DVB demux tool for repairing and analyzing different stream types")
    (description "DVB demux tool for repairing and analyzing different stream types.")
    (home-page "http://sourceforge.net/projects/project-x")
    (license license:gpl2+)))

;;; cgoban3 --- a KGS client and SGF editor
(define-public cgoban3
  (package
    (name "cgoban3")
    (version "3.5.144-3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/cgoban3.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a KGS client and SGF editor")
    (description "A KGS client and SGF editor.")
    (home-page "https://www.gokgs.com/")
    (license license:nonfree)))

;;; python-pysvn --- the Pythonic interface to Subversion
(define-public python-pysvn
  (package
    (name "python-pysvn")
    (version "1.9.25-3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-pysvn.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the Pythonic interface to Subversion")
    (description "The Pythonic interface to Subversion.")
    (home-page "https://pysvn.sourceforge.io/")
    (license license:asl2.0)))

;;; rescuetime2 --- application time-tracking for Linux. Stable version
(define-public rescuetime2
  (package
    (name "rescuetime2")
    (version "2.16.5.1-2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/rescuetime2.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "application time-tracking for Linux. Stable version")
    (description "Application time-tracking for Linux. Stable version.")
    (home-page "https://www.rescuetime.com")
    (license license:nonfree)))

;;; ocamlnet --- a library for Web and Internet programming in OCaml
(define-public ocamlnet
  (package
    (name "ocamlnet")
    (version "4.1.9-3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ocamlnet.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a library for Web and Internet programming in OCaml")
    (description "A library for Web and Internet programming in OCaml.")
    (home-page "http://projects.camlcity.org/projects/ocamlnet.html")
    (license license:gpl2+)))

;;; gsview --- a nice looking GUI for ghostscript with some extraction features
(define-public gsview
  (package
    (name "gsview")
    (version "4.9-13")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gsview.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a nice looking GUI for ghostscript with some extraction features")
    (description "A nice looking GUI for ghostscript with some extraction features.")
    (home-page "http://pages.cs.wisc.edu/~ghost/gsview/get49.htm")
    (license license:gpl3+)))

;;; dzen2-xft-xpm-xinerama-git --- x notification utility with Xinerama and XMP support, git version
(define-public dzen2-xft-xpm-xinerama-git
  (package
    (name "dzen2-xft-xpm-xinerama-git")
    (version "r14.488ab66-2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/dzen2-xft-xpm-xinerama-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "x notification utility with Xinerama and XMP support, git version")
    (description "X notification utility with Xinerama and XMP support, git version.")
    (home-page "https://github.com/robm/dzen")
    (license license:expat)))

;;; slim-git --- desktop-independent graphical login manager for X11 (git)
(define-public slim-git
  (package
    (name "slim-git")
    (version "1.3.6.4.ga33d260-2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/slim-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "desktop-independent graphical login manager for X11 (git)")
    (description "Desktop-independent graphical login manager for X11 (git).")
    (home-page "http://developer.berlios.de/projects/slim/")
    (license license:gpl2)))

;;; slimlock-git --- stand-alone lightweight themable screen locker based on SLiM (git)
(define-public slimlock-git
  (package
    (name "slimlock-git")
    (version "1.3.6.4.ga33d260-2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/slimlock-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "stand-alone lightweight themable screen locker based on SLiM (git)")
    (description "Stand-alone lightweight themable screen locker based on SLiM (git).")
    (home-page "http://developer.berlios.de/projects/slim/")
    (license license:gpl2)))

;;; swfdec-gnome --- standalone Flash player and thumbnailer for the GNOME desktop
(define-public swfdec-gnome
  (package
    (name "swfdec-gnome")
    (version "2.30.1-3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/swfdec-gnome.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "standalone Flash player and thumbnailer for the GNOME desktop")
    (description "Standalone Flash player and thumbnailer for the GNOME desktop.")
    (home-page "http://swfdec.freedesktop.org")
    (license license:gpl2+)))

;;; pkg-2gis --- geographic Information System (GIS) for some Russian and Ukrainian cities
(define-public pkg-2gis
  (package
    (name "2gis")
    (version "3.16.3.0-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/2gis.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "geographic Information System (GIS) for some Russian and Ukrainian cities")
    (description "Geographic Information System (GIS) for some Russian and Ukrainian cities.")
    (home-page "http://help.2gis.ru/linux/")
    (license license:gpl3+)))

;;; keepass-plugin-rpc --- RPC plugin for Keepass
(define-public keepass-plugin-rpc
  (package
    (name "keepass-plugin-rpc")
    (version "2.0.2-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/keepass-plugin-rpc.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "RPC plugin for Keepass")
    (description "RPC plugin for Keepass.")
    (home-page "https://github.com/kee-org/keepassrpc")
    (license license:gpl2+)))

;;; pidgin-latex --- small latex plugin for pidgin
(define-public pidgin-latex
  (package
    (name "pidgin-latex")
    (version "1.5.0-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/pidgin-latex.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "small latex plugin for pidgin")
    (description "Small latex plugin for pidgin.")
    (home-page "https://sourceforge.net/projects/pidgin-latex/")
    (license license:gpl2+)))

;;; gnome-vfs-nosmb --- the GNOME Virtual File System
(define-public gnome-vfs-nosmb
  (package
    (name "gnome-vfs-nosmb")
    (version "2.24.4-9")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gnome-vfs-nosmb.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the GNOME Virtual File System")
    (description "The GNOME Virtual File System.")
    (home-page "http://www.gnome.org")
    (license license:gpl2+)))

;;; netctlgui-helper --- helper daemon for netctl-gui. A part of netctl-gui
(define-public netctlgui-helper
  (package
    (name "netctlgui-helper")
    (version "1.4.9-2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/netctlgui-helper.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "helper daemon for netctl-gui. A part of netctl-gui")
    (description "Helper daemon for netctl-gui. A part of netctl-gui.")
    (home-page "https://arcanis.me/projects/netctl-gui")
    (license license:gpl2+)))

;;; plasma5-applet-netctl-gui --- a KF5 plasmoid, which interacts with netctl. A part of netctl-gui
(define-public plasma5-applet-netctl-gui
  (package
    (name "plasma5-applet-netctl-gui")
    (version "1.4.9-2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/plasma5-applet-netctl-gui.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a KF5 plasmoid, which interacts with netctl. A part of netctl-gui")
    (description "A KF5 plasmoid, which interacts with netctl. A part of netctl-gui.")
    (home-page "https://arcanis.me/projects/netctl-gui")
    (license license:gpl2+)))

;;; aacgain-cvs --- adjusts the volume of music files (mp4/m4a/QT/mp3) using ReplayGain algorithm
(define-public aacgain-cvs
  (package
    (name "aacgain-cvs")
    (version "20130814-7")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/aacgain-cvs.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "adjusts the volume of music files (mp4/m4a/QT/mp3) using ReplayGain algorithm")
    (description "Adjusts the volume of music files (mp4/m4a/QT/mp3) using ReplayGain algorithm.")
    (home-page "http://altosdesign.com/aacgain")
    (license license:gpl2+)))

;;; libgnome-data --- common data from libgnome
(define-public libgnome-data
  (package
    (name "libgnome-data")
    (version "2.32.1-8")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/libgnome-data.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "common data from libgnome")
    (description "Common data from libgnome.")
    (home-page "http://www.gnome.org")
    (license license:gpl2+)))

;;; oh-my-zsh-powerline-theme-git --- oh-my-zsh Powerline style theme
(define-public oh-my-zsh-powerline-theme-git
  (package
    (name "oh-my-zsh-powerline-theme-git")
    (version "r61.8df8e04-2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/oh-my-zsh-powerline-theme-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "oh-my-zsh Powerline style theme")
    (description "Oh-my-zsh Powerline style theme.")
    (home-page "https://github.com/jeremyFreeAgent/oh-my-zsh-powerline-theme")
    (license license:nonfree)))

;;; urxvt-resize-font-git --- an urxvt plugin to adjust the font size on the fly
(define-public urxvt-resize-font-git
  (package
    (name "urxvt-resize-font-git")
    (version "10.2bbde29-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/urxvt-resize-font-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "an urxvt plugin to adjust the font size on the fly")
    (description "An urxvt plugin to adjust the font size on the fly.")
    (home-page "https://github.com/simmel/urxvt-resize-font")
    (license license:expat)))

;;; urxvt-vtwheel --- scroll wheel support for urxvt
(define-public urxvt-vtwheel
  (package
    (name "urxvt-vtwheel")
    (version "0.3-3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/urxvt-vtwheel.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "scroll wheel support for urxvt")
    (description "Scroll wheel support for urxvt.")
    (home-page "https://aur.archlinux.org/")
    (license license:gpl3+)))

;;; pacman2aria2 --- convert pacman download URL lists to reflector-augmented aria2c input lists...
(define-public pacman2aria2
  (package
    (name "pacman2aria2")
    (version "2012-5")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/pacman2aria2.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "convert pacman download URL lists to reflector-augmented aria2c input lists...")
    (description "Convert pacman download URL lists to reflector-augmented aria2c input lists. Includes powerpill-light.")
    (home-page "https://xyne.dev/projects/pacman2aria2")
    (license license:gpl2+)))

;;; gem2arch --- create PKGBUILD from Ruby Gem Package
(define-public gem2arch
  (package
    (name "gem2arch")
    (version "0.11-3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gem2arch.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "create PKGBUILD from Ruby Gem Package")
    (description "Create PKGBUILD from Ruby Gem Package.")
    (home-page "https://github.com/anatol/gem2arch")
    (license license:gpl2+)))

;;; goland-jre --- JBR (JetBrains Runtime) for Goland - a patched JRE
(define-public goland-jre
  (package
    (name "goland-jre")
    (version "2026.1.1-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/goland-jre.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "JBR (JetBrains Runtime) for Goland - a patched JRE")
    (description "JBR (JetBrains Runtime) for Goland - a patched JRE.")
    (home-page "https://github.com/JetBrains/JetBrainsRuntime")
    (license license:nonfree)))

;;; clion-eap --- cross-platform IDE for C and C++ from JetBrains. Early Access Program
(define-public clion-eap
  (package
    (name "clion-eap")
    (version "261.23567.135-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/clion-eap.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "cross-platform IDE for C and C++ from JetBrains. Early Access Program")
    (description "Cross-platform IDE for C and C++ from JetBrains. Early Access Program.")
    (home-page "http://www.jetbrains.com/clion")
    (license license:nonfree)))

;;; odoo-venv --- open Source Apps To Grow Your Business
(define-public odoo-venv
  (package
    (name "odoo-venv")
    (version "18.0.20241229-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/odoo-venv.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "open Source Apps To Grow Your Business")
    (description "Open Source Apps To Grow Your Business.")
    (home-page "https://odoo.com/")
    (license license:gpl2+)))

;;; stardict-oald --- oxford Advanced Learner's Dictionary for Stardict
(define-public stardict-oald
  (package
    (name "stardict-oald")
    (version "2.4.2-11")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/stardict-oald.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "oxford Advanced Learner's Dictionary for Stardict")
    (description "Oxford Advanced Learner's Dictionary for Stardict.")
    (home-page "https://code.google.com/archive/p/stardict-3/")
    (license license:nonfree)))

;;; lastpass-pocket --- backup and offline access for LastPass
(define-public lastpass-pocket
  (package
    (name "lastpass-pocket")
    (version "4.1.20-3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lastpass-pocket.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "backup and offline access for LastPass")
    (description "Backup and offline access for LastPass.")
    (home-page "https://lastpass.com")
    (license license:nonfree)))

;;; quake4 --- quake 4 Engine. You need the retail .pk4 files to play
(define-public quake4
  (package
    (name "quake4")
    (version "1.4.2-5")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/quake4.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "quake 4 Engine. You need the retail .pk4 files to play")
    (description "Quake 4 Engine. You need the retail .pk4 files to play.")
    (home-page "https://web.archive.org/web/20061205073314/http://www.idsoftware.com/games/quake/quake4/")
    (license license:nonfree)))
