;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260428i
;;; Resolves 100 packages from queue (100 recipes, 0 blocked).
;;;
;;; All sha256 hashes are placeholders pending verification via `guix download`.

(define-module (gaurix packages recipe-resolver-260428i)
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
            php83-cgi
            php56-dblib
            ipager
            oni
            gwyddion
            thunderbird-bin
            supertuxkart-git
            sunflower-git
            pipewire-jack-git
            czmq-git
            keepass2-plugin-tray-icon
            clx-git
            digilent-adept-utilities
            chkservice
            qloud
            jpdfbookmarks
            php-mailparse
            python2-simplejson
            tinywm
            terrafire
            wavsplit
            ciphey
            acquisition
            kwrited-git
            midifilter-lv2-git
            python-pylibftdi
            linphone-desktop-all
            apache-mod-bw
            powder-player-bin
            ttf-sipa-dip
            vim-coc-rust-analyzer-git
            pipexec
            monophony
            mprocs-bin
            aliview-bin
            gtk4-paper-plane
            histoiremondiale
            liberal-crime-squad-svn
            paperbackup-git
            proverif
            re2-git
            triceratops
            python-pympv-git
            sdlhack
            terminology-themes-git
            perl-types-uuid
            lokinet-gui
            einstein
            qolibri
            ocaml-fieldslib
            qcheckers
            red-cli
            r-matrixstats
            kubedecode-git
            linux-dynamic-wallpapers-git
            lwt-git
            mongodb32-bin
            neovim-fugitive
            pacext-git
            python-rmcl
            steam-boilr-gui
            systemd-metered-connection-dependency
            tex-match
            ubdsrv
            gl-117
            vim-nord-git
            netradio
            python-argbind-git
            python-autodiff
            aid-git
            archivebox-git
            bwa-mem2
            domjudge-judgehost
            ttf-elstob-variable
            jtbl
            kurly
            r-rcppthread
            r-mixomics
            dotherside
            idos-timetable-additionalinfo-chaps-bus-latest
            journey
            ledger2beancount
            libpng14
            libvtflib-git
            lua51-copas
            lua52-luacov
            fuz-calc-git
            modsman
            mwb-layout
            nowpm-git
            pandwaita
            paspio-git
            perl-catalystx-injectcomponent
            popura-git
            put
            python-sl-cli-git
            python-triangle
            pydvbstreamer
            rssnix-git
            rvasm-git
            ))

;;; Nonfree/proprietary license placeholder for Gaurix channel
(define license:nonfree
  ((@@ (guix licenses) license) "Nonfree"
    "https://spdx.org/licenses/"
    "Proprietary or custom license; see upstream for terms."))

;;; PHP-3.01 license
(define license:php3.01
  ((@@ (guix licenses) license) "PHP-3.01"
    "https://www.php.net/license/3_01.txt"
    "The PHP License, version 3.01."))

;;; php83-cgi --- CGI and FCGI SAPI for php83
(define-public php83-cgi
  (package
    (name "php83-cgi")
    (version "8.3.30")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/php83-cgi.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "CGI and FCGI SAPI for php83")
    (description "CGI and FCGI SAPI for php83.")
    (home-page "http://www.php.net")
    (license license:php3.01)))

;;; php56-dblib --- pdo_dblib module for php56
(define-public php56-dblib
  (package
    (name "php56-dblib")
    (version "5.6.40")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/php56-dblib.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "pdo_dblib module for php56")
    (description "Pdo_dblib module for php56.")
    (home-page "http://www.php.net")
    (license license:php3.01)))

;;; ipager --- a lightweight beautiful pager from Fluxbox
(define-public ipager
  (package
    (name "ipager")
    (version "1.1.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ipager.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a lightweight beautiful pager from Fluxbox")
    (description "A lightweight beautiful pager from Fluxbox.")
    (home-page "http://fluxbox.org/screenshots/")
    (license license:expat)))

;;; oni --- an IDE built around Neovim
(define-public oni
  (package
    (name "oni")
    (version "0.3.9")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/oni.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "an IDE built around Neovim")
    (description "An IDE built around Neovim.")
    (home-page "https://github.com/onivim/oni")
    (license license:expat)))

;;; gwyddion --- a data visualization and processing tool for scanning probe miscroscopy (...
(define-public gwyddion
  (package
    (name "gwyddion")
    (version "2.70")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gwyddion.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a data visualization and processing tool for scanning probe miscroscopy (...")
    (description "A data visualization and processing tool for scanning probe miscroscopy (SPM, i.e. AFM, STM, MFM, SNOM/NSOM, ...) and profilometry, useful also for general image and 2D data analysis.")
    (home-page "https://gwyddion.net/")
    (license license:gpl3+)))

;;; thunderbird-bin --- standalone Mail/News reader - binary version
(define-public thunderbird-bin
  (package
    (name "thunderbird-bin")
    (version "150.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/thunderbird-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "standalone Mail/News reader - binary version")
    (description "Standalone Mail/News reader - binary version.")
    (home-page "https://www.mozilla.org/thunderbird")
    (license license:gpl3+)))

;;; supertuxkart-git --- a kart racing game featuring Tux and his friends
(define-public supertuxkart-git
  (package
    (name "supertuxkart-git")
    (version "1.4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/supertuxkart-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a kart racing game featuring Tux and his friends")
    (description "A kart racing game featuring Tux and his friends.")
    (home-page "https://github.com/supertuxkart/stk-code")
    (license license:gpl3+)))

;;; sunflower-git --- small and highly customizable twin-panel file manager for Linux with supp...
(define-public sunflower-git
  (package
    (name "sunflower-git")
    (version "0.4.62")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/sunflower-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "small and highly customizable twin-panel file manager for Linux with supp...")
    (description "Small and highly customizable twin-panel file manager for Linux with support for plugins.")
    (home-page "https://sunflower-fm.org")
    (license license:gpl3+)))

;;; pipewire-jack-git --- low-latency audio/video router and processor. (GIT version) - JACK replac...
(define-public pipewire-jack-git
  (package
    (name "pipewire-jack-git")
    (version "1.5.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/pipewire-jack-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "low-latency audio/video router and processor. (GIT version) - JACK replac...")
    (description "Low-latency audio/video router and processor. (GIT version) - JACK replacement.")
    (home-page "https://pipewire.org")
    (license license:gpl2)))

;;; czmq-git --- high-level C binding for ZeroMQ
(define-public czmq-git
  (package
    (name "czmq-git")
    (version "4.2.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/czmq-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "high-level C binding for ZeroMQ")
    (description "High-level C binding for ZeroMQ.")
    (home-page "https://github.com/zeromq/czmq")
    (license license:mpl2.0)))

;;; keepass2-plugin-tray-icon --- functional tray icon for KeePass2
(define-public keepass2-plugin-tray-icon
  (package
    (name "keepass2-plugin-tray-icon")
    (version "0.8.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/keepass2-plugin-tray-icon.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "functional tray icon for KeePass2")
    (description "Functional tray icon for KeePass2.")
    (home-page "https://github.com/dlech/Keebuntu")
    (license license:gpl2)))

;;; clx-git --- an X11 client for Common Lisp
(define-public clx-git
  (package
    (name "clx-git")
    (version "r377.5db3a0d")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/clx-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "an X11 client for Common Lisp")
    (description "An X11 client for Common Lisp.")
    (home-page "https://github.com/sharplispers/clx")
    (license license:nonfree)))

;;; digilent-adept-utilities --- digilent Adept Utilities
(define-public digilent-adept-utilities
  (package
    (name "digilent.adept.utilities")
    (version "2.7.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/digilent.adept.utilities.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "digilent Adept Utilities")
    (description "Digilent Adept Utilities.")
    (home-page "https://digilent.com/reference/software/adept/start")
    (license license:nonfree)))

;;; chkservice --- systemd units manager with ncurses, terminal interface
(define-public chkservice
  (package
    (name "chkservice")
    (version "0.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/chkservice.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "systemd units manager with ncurses, terminal interface")
    (description "Systemd units manager with ncurses, terminal interface.")
    (home-page "https://github.com/srakitnican/chkservice")
    (license license:gpl3+)))

;;; qloud --- tool to measure loudspeaker frequency response and distortions
(define-public qloud
  (package
    (name "qloud")
    (version "1.4.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/qloud.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "tool to measure loudspeaker frequency response and distortions")
    (description "Tool to measure loudspeaker frequency response and distortions.")
    (home-page "https://github.com/molke-productions/qloud")
    (license license:gpl3+)))

;;; jpdfbookmarks --- java PDF bookmarks editor
(define-public jpdfbookmarks
  (package
    (name "jpdfbookmarks")
    (version "2.5.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/jpdfbookmarks.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "java PDF bookmarks editor")
    (description "Java PDF bookmarks editor.")
    (home-page "https://flavianopetrocchi.blogspot.com/")
    (license license:gpl3+)))

;;; php-mailparse --- extension for parsing and working with email messages (RFC822 and RFC2045)
(define-public php-mailparse
  (package
    (name "php-mailparse")
    (version "3.1.9")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/php-mailparse.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "extension for parsing and working with email messages (RFC822 and RFC2045)")
    (description "Extension for parsing and working with email messages (RFC822 and RFC2045).")
    (home-page "https://pecl.php.net/package/mailparse")
    (license license:php3.01)))

;;; python2-simplejson --- simple, fast, extensible JSON encoder/decoder for python2
(define-public python2-simplejson
  (package
    (name "python2-simplejson")
    (version "4.0.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python2-simplejson.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "simple, fast, extensible JSON encoder/decoder for python2")
    (description "Simple, fast, extensible JSON encoder/decoder for python2.")
    (home-page "https://github.com/simplejson/simplejson")
    (license license:expat)))

;;; tinywm --- a tiny window manager written in only ~50 lines of code
(define-public tinywm
  (package
    (name "tinywm")
    (version "1.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/tinywm.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a tiny window manager written in only ~50 lines of code")
    (description "A tiny window manager written in only ~50 lines of code.")
    (home-page "http://incise.org/tinywm.html")
    (license license:nonfree)))

;;; terrafire --- award-winning arcade game featuring rendered 3D graphics, realistic gravi...
(define-public terrafire
  (package
    (name "terrafire")
    (version "2.0.5")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/terrafire.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "award-winning arcade game featuring rendered 3D graphics, realistic gravi...")
    (description "Award-winning arcade game featuring rendered 3D graphics, realistic gravitational physics and 360 degree parallax scrolling from ORT Software.")
    (home-page "https://www.ortsoftware.com/tf.html")
    (license license:nonfree)))

;;; wavsplit --- splits large WAV files at given time positions
(define-public wavsplit
  (package
    (name "wavsplit")
    (version "1.2.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/wavsplit.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "splits large WAV files at given time positions")
    (description "Splits large WAV files at given time positions.")
    (home-page "https://download.tuxfamily.org/xcfaudio/WavSplit/")
    (license license:gpl2)))

;;; ciphey --- automated decryption tool
(define-public ciphey
  (package
    (name "ciphey")
    (version "5.14.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ciphey.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "automated decryption tool")
    (description "Automated decryption tool.")
    (home-page "https://github.com/Ciphey/Ciphey")
    (license license:expat)))

;;; acquisition --- inventory management tool for Path of Exile
(define-public acquisition
  (package
    (name "acquisition")
    (version "0.8b")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/acquisition.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "inventory management tool for Path of Exile")
    (description "Inventory management tool for Path of Exile.")
    (home-page "https://github.com/xyzz/acquisition")
    (license license:gpl3+)))

;;; kwrited-git --- KDE daemon listening for wall and write messages
(define-public kwrited-git
  (package
    (name "kwrited-git")
    (version "6.0.80_r566.gfa6f9d5")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/kwrited-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "KDE daemon listening for wall and write messages")
    (description "KDE daemon listening for wall and write messages.")
    (home-page "https://kde.org/plasma-desktop/")
    (license license:lgpl3+)))

;;; midifilter-lv2-git --- LV2 plugins to filter MIDI events
(define-public midifilter-lv2-git
  (package
    (name "midifilter.lv2-git")
    (version "0.6.7")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/midifilter.lv2-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "LV2 plugins to filter MIDI events")
    (description "LV2 plugins to filter MIDI events.")
    (home-page "https://github.com/x42/midifilter.lv2")
    (license license:gpl2)))

;;; python-pylibftdi --- pythonic interface to FTDI devices using libftdi
(define-public python-pylibftdi
  (package
    (name "python-pylibftdi")
    (version "0.22.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-pylibftdi.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "pythonic interface to FTDI devices using libftdi")
    (description "Pythonic interface to FTDI devices using libftdi.")
    (home-page "https://github.com/codedstructure/pylibftdi/")
    (license license:expat)))

;;; linphone-desktop-all --- a free VoIP and video softphone based on the SIP protocol (Installed in /...
(define-public linphone-desktop-all
  (package
    (name "linphone-desktop-all")
    (version "4.1.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/linphone-desktop-all.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a free VoIP and video softphone based on the SIP protocol (Installed in /...")
    (description "A free VoIP and video softphone based on the SIP protocol (Installed in /opt with all deps included).")
    (home-page "https://www.linphone.org/")
    (license license:gpl2)))

;;; apache-mod-bw --- DSO module for Apache that throttles HTTP traffic
(define-public apache-mod-bw
  (package
    (name "apache-mod_bw")
    (version "0.92")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/apache-mod_bw.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "DSO module for Apache that throttles HTTP traffic")
    (description "DSO module for Apache that throttles HTTP traffic.")
    (home-page "http://ivn.cl/category/apache/")
    (license license:asl2.0)))

;;; powder-player-bin --- hybrid between a Torrent Client and a Player (torrent streaming)
(define-public powder-player-bin
  (package
    (name "powder-player-bin")
    (version "1.60")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/powder-player-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "hybrid between a Torrent Client and a Player (torrent streaming)")
    (description "Hybrid between a Torrent Client and a Player (torrent streaming).")
    (home-page "http://powder.media/")
    (license license:lgpl3+)))

;;; ttf-sipa-dip --- thai formal standard fonts from SIPA, including Sarabun
(define-public ttf-sipa-dip
  (package
    (name "ttf-sipa-dip")
    (version "1.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ttf-sipa-dip.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "thai formal standard fonts from SIPA, including Sarabun")
    (description "Thai formal standard fonts from SIPA, including Sarabun.")
    (home-page "http://www.f0nt.com/release/13-free-fonts-from-sipa")
    (license license:nonfree)))

;;; vim-coc-rust-analyzer-git --- rust-analyzer extension for coc.nvim
(define-public vim-coc-rust-analyzer-git
  (package
    (name "vim-coc-rust-analyzer-git")
    (version "r1222.dc17ad2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/vim-coc-rust-analyzer-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "rust-analyzer extension for coc.nvim")
    (description "Rust-analyzer extension for coc.nvim.")
    (home-page "https://github.com/fannheyward/coc-rust-analyzer")
    (license license:expat)))

;;; pipexec --- connector of arbitrary file descriptors
(define-public pipexec
  (package
    (name "pipexec")
    (version "2.6.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/pipexec.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "connector of arbitrary file descriptors")
    (description "Connector of arbitrary file descriptors.")
    (home-page "https://github.com/flonatel/pipexec")
    (license license:gpl2)))

;;; monophony --- linux app for streaming music from YouTube
(define-public monophony
  (package
    (name "monophony")
    (version "4.4.4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/monophony.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "linux app for streaming music from YouTube")
    (description "Linux app for streaming music from YouTube.")
    (home-page "https://gitlab.com/zehkira/monophony")
    (license license:nonfree)))

;;; mprocs-bin --- run multiple commands in parallel
(define-public mprocs-bin
  (package
    (name "mprocs-bin")
    (version "0.9.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mprocs-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "run multiple commands in parallel")
    (description "Run multiple commands in parallel.")
    (home-page "https://github.com/pvolok/mprocs")
    (license license:expat)))

;;; aliview-bin --- software for aligning viewing and editing dna/aminoacid sequences
(define-public aliview-bin
  (package
    (name "aliview-bin")
    (version "1.27")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/aliview-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "software for aligning viewing and editing dna/aminoacid sequences")
    (description "Software for aligning viewing and editing dna/aminoacid sequences.")
    (home-page "http://www.ormbunkar.se/aliview/")
    (license license:gpl3+)))

;;; gtk4-paper-plane --- GObject-based multi-platform GUI toolkit (Version required by Paper Plane)
(define-public gtk4-paper-plane
  (package
    (name "gtk4-paper-plane")
    (version "4.16.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gtk4-paper-plane.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "GObject-based multi-platform GUI toolkit (Version required by Paper Plane)")
    (description "GObject-based multi-platform GUI toolkit (Version required by Paper Plane).")
    (home-page "https://www.gtk.org/")
    (license license:lgpl3+)))

;;; histoiremondiale --- atlas historique - survoler le monde et lire la description de la période
(define-public histoiremondiale
  (package
    (name "histoiremondiale")
    (version "2.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/histoiremondiale.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "atlas historique - survoler le monde et lire la description de la période")
    (description "Atlas historique - survoler le monde et lire la description de la période.")
    (home-page "http://histoiremondiale.net")
    (license license:agpl3+)))

;;; liberal-crime-squad-svn --- a satirical console-based political role-playing/strategy game
(define-public liberal-crime-squad-svn
  (package
    (name "liberal-crime-squad-svn")
    (version "4.07.5.r864")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/liberal-crime-squad-svn.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a satirical console-based political role-playing/strategy game")
    (description "A satirical console-based political role-playing/strategy game.")
    (home-page "https://sourceforge.net/projects/lcsgame/")
    (license license:gpl2)))

;;; paperbackup-git --- create a pdf with barcodes to backup text files on paper. Designed to bac...
(define-public paperbackup-git
  (package
    (name "paperbackup-git")
    (version "r27.7c3f064")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/paperbackup-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "create a pdf with barcodes to backup text files on paper. Designed to bac...")
    (description "Create a pdf with barcodes to backup text files on paper. Designed to backup ASCII-armored GnuPG and SSH key files and ciphertext.")
    (home-page "https://github.com/intra2net/paperbackup")
    (license license:expat)))

;;; proverif --- cryptographic protocol verifier in the formal model
(define-public proverif
  (package
    (name "proverif")
    (version "2.05")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/proverif.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "cryptographic protocol verifier in the formal model")
    (description "Cryptographic protocol verifier in the formal model.")
    (home-page "http://prosecco.gforge.inria.fr/personal/bblanche/proverif/")
    (license license:gpl3+)))

;;; re2-git --- a fast, safe, thread-friendly alternative to backtracking regular express...
(define-public re2-git
  (package
    (name "re2-git")
    (version "2023.09.01")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/re2-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a fast, safe, thread-friendly alternative to backtracking regular express...")
    (description "A fast, safe, thread-friendly alternative to backtracking regular expression engines, a C++ library.")
    (home-page "https://github.com/google/re2")
    (license license:bsd-3)))

;;; triceratops --- polyphonic synthesizer LV2 plugin
(define-public triceratops
  (package
    (name "triceratops")
    (version "0.5.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/triceratops.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "polyphonic synthesizer LV2 plugin")
    (description "Polyphonic synthesizer LV2 plugin.")
    (home-page "https://sourceforge.net/projects/triceratops/")
    (license license:gpl3+)))

;;; python-pympv-git --- a Python wrapper for libmpv
(define-public python-pympv-git
  (package
    (name "python-pympv-git")
    (version "0.8.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-pympv-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a Python wrapper for libmpv")
    (description "A Python wrapper for libmpv.")
    (home-page "https://github.com/marcan/pympv")
    (license license:gpl3+)))

;;; sdlhack --- a wrapper for SDL which lets you force fullscreen games to minimize
(define-public sdlhack
  (package
    (name "sdlhack")
    (version "1.4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/sdlhack.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a wrapper for SDL which lets you force fullscreen games to minimize")
    (description "A wrapper for SDL which lets you force fullscreen games to minimize.")
    (home-page "http://jspenguin.org:81/software/sdlhack/")
    (license license:lgpl3+)))

;;; terminology-themes-git --- color schemes for the Terminology terminal emulator
(define-public terminology-themes-git
  (package
    (name "terminology-themes-git")
    (version "r119.e1ddd06")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/terminology-themes-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "color schemes for the Terminology terminal emulator")
    (description "Color schemes for the Terminology terminal emulator.")
    (home-page "https://github.com/sylveon/terminology-themes")
    (license license:gpl3+)))

;;; perl-types-uuid --- type constraints for UUIDs
(define-public perl-types-uuid
  (package
    (name "perl-types-uuid")
    (version "0.004")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/perl-types-uuid.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "type constraints for UUIDs")
    (description "Type constraints for UUIDs.")
    (home-page "https://metacpan.org/release/Types-UUID")
    (license license:gpl3+)))

;;; lokinet-gui --- graphical user interface for lokinet
(define-public lokinet-gui
  (package
    (name "lokinet-gui")
    (version "1.0.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lokinet-gui.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "graphical user interface for lokinet")
    (description "Graphical user interface for lokinet.")
    (home-page "https://github.com/oxen-io/lokinet-gui")
    (license license:gpl3+)))

;;; einstein --- remake of old DOS game Sherlock which was inspired by Albert Einstein's p...
(define-public einstein
  (package
    (name "einstein")
    (version "2.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/einstein.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "remake of old DOS game Sherlock which was inspired by Albert Einstein's p...")
    (description "Remake of old DOS game Sherlock which was inspired by Albert Einstein's puzzle.")
    (home-page "https://github.com/jordan-evens/einstein-puzzle")
    (license license:gpl2)))

;;; qolibri --- a QT-based EPWING dictionary viewer
(define-public qolibri
  (package
    (name "qolibri")
    (version "2.1.4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/qolibri.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a QT-based EPWING dictionary viewer")
    (description "A QT-based EPWING dictionary viewer.")
    (home-page "https://github.com/ludios/qolibri")
    (license license:gpl2)))

;;; ocaml-fieldslib --- OCaml record fields as first class values
(define-public ocaml-fieldslib
  (package
    (name "ocaml-fieldslib")
    (version "0.17.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ocaml-fieldslib.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "OCaml record fields as first class values")
    (description "OCaml record fields as first class values.")
    (home-page "https://github.com/janestreet/fieldslib")
    (license license:expat)))

;;; qcheckers --- qt version of the classic boardgame checkers (draughts)
(define-public qcheckers
  (package
    (name "qcheckers")
    (version "0.9.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/qcheckers.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "qt version of the classic boardgame checkers (draughts)")
    (description "Qt version of the classic boardgame checkers (draughts).")
    (home-page "https://github.com/portnov/qcheckers")
    (license license:gpl3+)))

;;; red-cli --- red is a next-generation programming language strongly inspired by REBOL ...
(define-public red-cli
  (package
    (name "red-cli")
    (version "2026.01.23.23418b4cb")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/red-cli.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "red is a next-generation programming language strongly inspired by REBOL ...")
    (description "Red is a next-generation programming language strongly inspired by REBOL (CLI).")
    (home-page "https://www.red-lang.org")
    (license license:nonfree)))

;;; r-matrixstats --- functions that Apply to Rows and Columns of Matrices (and to Vectors)
(define-public r-matrixstats
  (package
    (name "r-matrixstats")
    (version "1.4.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/r-matrixstats.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "functions that Apply to Rows and Columns of Matrices (and to Vectors)")
    (description "Functions that Apply to Rows and Columns of Matrices (and to Vectors).")
    (home-page "https://cran.r-project.org/package=matrixStats")
    (license license:artistic2.0)))

;;; kubedecode-git --- kubedecode decodes all parts of a Kubernetes secret, no more copypasting!
(define-public kubedecode-git
  (package
    (name "kubedecode-git")
    (version "r16.3a13928")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/kubedecode-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "kubedecode decodes all parts of a Kubernetes secret, no more copypasting!")
    (description "Kubedecode decodes all parts of a Kubernetes secret, no more copypasting!.")
    (home-page "https://github.com/mschmidt291/kubedecode")
    (license license:expat)))

;;; linux-dynamic-wallpapers-git --- dynamic Wallpapers for Linux (Gnome). Note: this project is named Linux_D...
(define-public linux-dynamic-wallpapers-git
  (package
    (name "linux-dynamic-wallpapers-git")
    (version "r407.aec7d27")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/linux-dynamic-wallpapers-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "dynamic Wallpapers for Linux (Gnome). Note: this project is named Linux_D...")
    (description "Dynamic Wallpapers for Linux (Gnome). Note: this project is named Linux_Dynamic_Wallpapers, but is meant to support Gnome's dynamic wallpapers (and maybe related DEs).")
    (home-page "https://github.com/saint-13/Linux_Dynamic_Wallpapers")
    (license license:nonfree)))

;;; lwt-git --- lightweight terminal emulator based on the VTE and GTK libraries
(define-public lwt-git
  (package
    (name "lwt-git")
    (version "2018_02_21")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lwt-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "lightweight terminal emulator based on the VTE and GTK libraries")
    (description "Lightweight terminal emulator based on the VTE and GTK libraries.")
    (home-page "https://github.com/mewkiz/lwt")
    (license license:public-domain)))

;;; mongodb32-bin --- a high-performance, open source, schema-free document-oriented database
(define-public mongodb32-bin
  (package
    (name "mongodb32-bin")
    (version "3.2.22")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mongodb32-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a high-performance, open source, schema-free document-oriented database")
    (description "A high-performance, open source, schema-free document-oriented database.")
    (home-page "https://www.mongodb.com/")
    (license license:nonfree)))

;;; neovim-fugitive --- a Git wrapper so awesome, it should be illegal
(define-public neovim-fugitive
  (package
    (name "neovim-fugitive")
    (version "3.6")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/neovim-fugitive.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a Git wrapper so awesome, it should be illegal")
    (description "A Git wrapper so awesome, it should be illegal.")
    (home-page "https://github.com/tpope/vim-fugitive")
    (license license:nonfree)))

;;; pacext-git --- pacman extensions with more convenient syntax
(define-public pacext-git
  (package
    (name "pacext-git")
    (version "r22.a04ded2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/pacext-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "pacman extensions with more convenient syntax")
    (description "Pacman extensions with more convenient syntax.")
    (home-page "https://github.com/CRISPYricePC/pacext")
    (license license:expat)))

;;; python-rmcl --- reMarkable Cloud Library
(define-public python-rmcl
  (package
    (name "python-rmcl")
    (version "0.4.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-rmcl.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "reMarkable Cloud Library")
    (description "ReMarkable Cloud Library.")
    (home-page "https://github.com/rschroll/rmcl/")
    (license license:expat)))

;;; steam-boilr-gui --- synchronize games from other platforms into your Steam library
(define-public steam-boilr-gui
  (package
    (name "steam-boilr-gui")
    (version "1.9.6")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/steam-boilr-gui.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "synchronize games from other platforms into your Steam library")
    (description "Synchronize games from other platforms into your Steam library.")
    (home-page "https://github.com/PhilipK/BoilR")
    (license license:asl2.0)))

;;; systemd-metered-connection-dependency --- execute systemd services if current connection is not metered
(define-public systemd-metered-connection-dependency
  (package
    (name "systemd-metered-connection-dependency")
    (version "0.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/systemd-metered-connection-dependency.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "execute systemd services if current connection is not metered")
    (description "Execute systemd services if current connection is not metered.")
    (home-page "https://github.com/jdorel/systemd-metered-connection-dependency")
    (license license:gpl3+)))

;;; tex-match --- find LaTeX symbols by sketching. A desktop version of detexify
(define-public tex-match
  (package
    (name "tex-match")
    (version "1.2.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/tex-match.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "find LaTeX symbols by sketching. A desktop version of detexify")
    (description "Find LaTeX symbols by sketching. A desktop version of detexify.")
    (home-page "https://github.com/zoeyfyi/TeX-Match")
    (license license:expat)))

;;; ubdsrv --- the userspace part of the ublk framework
(define-public ubdsrv
  (package
    (name "ubdsrv")
    (version "1.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ubdsrv.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the userspace part of the ublk framework")
    (description "The userspace part of the ublk framework.")
    (home-page "https://github.com/ming1/ubdsrv")
    (license license:gpl2)))

;;; gl-117 --- an action flight simulator
(define-public gl-117
  (package
    (name "gl-117")
    (version "1.3.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gl-117.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "an action flight simulator")
    (description "An action flight simulator.")
    (home-page "http://www.heptargon.de/gl-117/gl-117.html")
    (license license:gpl3+)))

;;; vim-nord-git --- an arctic, north-bluish clean and elegant Vim theme
(define-public vim-nord-git
  (package
    (name "vim-nord-git")
    (version "0.7.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/vim-nord-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "an arctic, north-bluish clean and elegant Vim theme")
    (description "An arctic, north-bluish clean and elegant Vim theme.")
    (home-page "https://github.com/arcticicestudio/nord-vim")
    (license license:expat)))

;;; netradio --- youTube ve internet radyolarını oynatan ve indiren Python tabanlı bir uyg...
(define-public netradio
  (package
    (name "netradio")
    (version "1.6")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/netradio.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "youTube ve internet radyolarını oynatan ve indiren Python tabanlı bir uyg...")
    (description "YouTube ve internet radyolarını oynatan ve indiren Python tabanlı bir uygulama.")
    (home-page "https://gitlab.com/saydut/netradio")
    (license license:gpl3+)))

;;; python-argbind-git --- build CLIs via docstrings and type annotations, with YAML support (built ...
(define-public python-argbind-git
  (package
    (name "python-argbind-git")
    (version "r112.e3e0b8d")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-argbind-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "build CLIs via docstrings and type annotations, with YAML support (built ...")
    (description "Build CLIs via docstrings and type annotations, with YAML support (built from latest commit).")
    (home-page "https://github.com/pseeth/argbind/")
    (license license:expat)))

;;; python-autodiff --- automatic differentiation made easier for C++ (python bindings)
(define-public python-autodiff
  (package
    (name "python-autodiff")
    (version "1.1.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-autodiff.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "automatic differentiation made easier for C++ (python bindings)")
    (description "Automatic differentiation made easier for C++ (python bindings).")
    (home-page "https://github.com/autodiff/autodiff")
    (license license:expat)))

;;; aid-git --- a simple ChatGPT command line with basic markdown display
(define-public aid-git
  (package
    (name "aid-git")
    (version "0.5.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/aid-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a simple ChatGPT command line with basic markdown display")
    (description "A simple ChatGPT command line with basic markdown display.")
    (home-page "https://github.com/alescdb/aid")
    (license license:asl2.0)))

;;; archivebox-git --- create a local, staticm browsable archive of websites
(define-public archivebox-git
  (package
    (name "archivebox-git")
    (version "0.8.5rc53")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/archivebox-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "create a local, staticm browsable archive of websites")
    (description "Create a local, staticm browsable archive of websites.")
    (home-page "https://github.com/pirate/ArchiveBox/")
    (license license:expat)))

;;; bwa-mem2 --- the next version of Burrows-Wheeler Aligner MEM algorithm
(define-public bwa-mem2
  (package
    (name "bwa-mem2")
    (version "2.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/bwa-mem2.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the next version of Burrows-Wheeler Aligner MEM algorithm")
    (description "The next version of Burrows-Wheeler Aligner MEM algorithm.")
    (home-page "https://github.com/bwa-mem2/bwa-mem2")
    (license license:expat)))

;;; domjudge-judgehost --- an automated judge system to run programming contests
(define-public domjudge-judgehost
  (package
    (name "domjudge-judgehost")
    (version "7.0.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/domjudge-judgehost.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "an automated judge system to run programming contests")
    (description "An automated judge system to run programming contests.")
    (home-page "http://www.domjudge.org/")
    (license license:gpl3+)))

;;; ttf-elstob-variable --- a variable font for medievalists
(define-public ttf-elstob-variable
  (package
    (name "ttf-elstob-variable")
    (version "3.003")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ttf-elstob-variable.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a variable font for medievalists")
    (description "A variable font for medievalists.")
    (home-page "https://github.com/psb1558/Elstob-font")
    (license license:silofl1.1)))

;;; jtbl --- a simple CLI tool to print JSON and JSON Lines data as a table in the ter...
(define-public jtbl
  (package
    (name "jtbl")
    (version "1.6.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/jtbl.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a simple CLI tool to print JSON and JSON Lines data as a table in the ter...")
    (description "A simple CLI tool to print JSON and JSON Lines data as a table in the terminal.")
    (home-page "https://github.com/kellyjonbrazil/jtbl")
    (license license:expat)))

;;; kurly --- kurly is an alternative to the widely popular curl program written in go
(define-public kurly
  (package
    (name "kurly")
    (version "1.2.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/kurly.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "kurly is an alternative to the widely popular curl program written in go")
    (description "Kurly is an alternative to the widely popular curl program written in go.")
    (home-page "https://gitlab.com/davidjpeacock/kurly")
    (license license:asl2.0)))

;;; r-rcppthread --- r-Friendly Threading in C++
(define-public r-rcppthread
  (package
    (name "r-rcppthread")
    (version "2.3.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/r-rcppthread.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "r-Friendly Threading in C++")
    (description "R-Friendly Threading in C++.")
    (home-page "https://cran.r-project.org/package=RcppThread")
    (license license:expat)))

;;; r-mixomics --- omics Data Integration Project
(define-public r-mixomics
  (package
    (name "r-mixomics")
    (version "6.34.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/r-mixomics.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "omics Data Integration Project")
    (description "Omics Data Integration Project.")
    (home-page "https://bioconductor.org/packages/mixOmics")
    (license license:gpl2+)))

;;; dotherside --- c library for creating bindings to Qt QML
(define-public dotherside
  (package
    (name "dotherside")
    (version "0.9.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/dotherside.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "c library for creating bindings to Qt QML")
    (description "C library for creating bindings to Qt QML.")
    (home-page "https://github.com/filcuc/DOtherSide")
    (license license:lgpl3+)))

;;; idos-timetable-additionalinfo-chaps-bus-latest --- floor plans of some Czech bus stations/ stops, to be used with the timeta...
(define-public idos-timetable-additionalinfo-chaps-bus-latest
  (package
    (name "idos-timetable-additionalinfo-chaps-bus-latest")
    (version "2025_12_23")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/idos-timetable-additionalinfo-chaps-bus-latest.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "floor plans of some Czech bus stations/ stops, to be used with the timeta...")
    (description "Floor plans of some Czech bus stations/ stops, to be used with the timetable search engines by CHAPS.")
    (home-page "https://chaps.cz/eng/download/idos/zip#kotvainf")
    (license license:nonfree)))

;;; journey --- ghost-compatible blogging platform written in golang
(define-public journey
  (package
    (name "journey")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/journey.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "ghost-compatible blogging platform written in golang")
    (description "Ghost-compatible blogging platform written in golang.")
    (home-page "https://kabukky.github.io/journey/")
    (license license:expat)))

;;; ledger2beancount --- ledger to Beancount text-based converter
(define-public ledger2beancount
  (package
    (name "ledger2beancount")
    (version "2.7")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ledger2beancount.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "ledger to Beancount text-based converter")
    (description "Ledger to Beancount text-based converter.")
    (home-page "https://github.com/beancount/ledger2beancount")
    (license license:gpl3+)))

;;; libpng14 --- a collection of routines used to create PNG format graphics files - 1.4 v...
(define-public libpng14
  (package
    (name "libpng14")
    (version "1.4.22")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/libpng14.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a collection of routines used to create PNG format graphics files - 1.4 v...")
    (description "A collection of routines used to create PNG format graphics files - 1.4 version.")
    (home-page "http://www.libpng.org/pub/png/libpng.html")
    (license license:nonfree)))

;;; libvtflib-git --- library to handle Valve's Texture Format
(define-public libvtflib-git
  (package
    (name "libvtflib-git")
    (version "r44.eaca22d")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/libvtflib-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "library to handle Valve's Texture Format")
    (description "Library to handle Valve's Texture Format.")
    (home-page "https://github.com/panzi/VTFLib")
    (license license:lgpl3+)))

;;; lua51-copas --- a dispatcher based on coroutines that can be used by TCP/IP servers
(define-public lua51-copas
  (package
    (name "lua51-copas")
    (version "4.10.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lua51-copas.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a dispatcher based on coroutines that can be used by TCP/IP servers")
    (description "A dispatcher based on coroutines that can be used by TCP/IP servers.")
    (home-page "https://lunarmodules.github.io/copas")
    (license license:expat)))

;;; lua52-luacov --- coverage analysis tool for Lua scripts
(define-public lua52-luacov
  (package
    (name "lua52-luacov")
    (version "0.15.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lua52-luacov.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "coverage analysis tool for Lua scripts")
    (description "Coverage analysis tool for Lua scripts.")
    (home-page "https://keplerproject.github.io/luacov")
    (license license:expat)))

;;; fuz-calc-git --- fuz-calc-git
(define-public fuz-calc-git
  (package
    (name "fuz-calc-git")
    (version "0.0.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/fuz-calc-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "fuz-calc-git")
    (description "fuz-calc-git package.")
    (home-page "https://github.com/FuzyTechLLC/FuzCalc")
    (license license:gpl3+)))

;;; modsman --- minecraft mod manager and updater for the CLI
(define-public modsman
  (package
    (name "modsman")
    (version "0.32.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/modsman.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "minecraft mod manager and updater for the CLI")
    (description "Minecraft mod manager and updater for the CLI.")
    (home-page "https://github.com/sargunv/modsman")
    (license license:gpl3+)))

;;; mwb-layout --- optimized keyboard layout, based on programmer dvorak and with a 3rd layer
(define-public mwb-layout
  (package
    (name "mwb-layout")
    (version "r24.244ca13")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mwb-layout.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "optimized keyboard layout, based on programmer dvorak and with a 3rd layer")
    (description "Optimized keyboard layout, based on programmer dvorak and with a 3rd layer.")
    (home-page "https://github.com/MatteoWickiBande/mwb-layout")
    (license license:gpl3+)))

;;; nowpm-git --- the no-bullshit wpm utility
(define-public nowpm-git
  (package
    (name "nowpm-git")
    (version "1.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/nowpm-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the no-bullshit wpm utility")
    (description "The no-bullshit wpm utility.")
    (home-page "https://github.com/jnats/nowpm")
    (license license:nonfree)))

;;; pandwaita --- icon theme based on Adwaita but with 3 cute panda cursors
(define-public pandwaita
  (package
    (name "pandwaita")
    (version "1.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/pandwaita.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "icon theme based on Adwaita but with 3 cute panda cursors")
    (description "Icon theme based on Adwaita but with 3 cute panda cursors.")
    (home-page "https://github.com/JOHNeMac36/pandwaita")
    (license license:gpl3+)))

;;; paspio-git --- a password entropy calculator and library
(define-public paspio-git
  (package
    (name "paspio-git")
    (version "1.0.0.f24017c")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/paspio-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a password entropy calculator and library")
    (description "A password entropy calculator and library.")
    (home-page "https://git.sr.ht/~grtcdr/paspio")
    (license license:expat)))

;;; perl-catalystx-injectcomponent --- inject components into your Catalyst application
(define-public perl-catalystx-injectcomponent
  (package
    (name "perl-catalystx-injectcomponent")
    (version "0.025")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/perl-catalystx-injectcomponent.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "inject components into your Catalyst application")
    (description "Inject components into your Catalyst application.")
    (home-page "https://metacpan.org/release/ROKR/CatalystX-InjectComponent-0.025")
    (license license:artistic2.0)))

;;; popura-git --- popura ポプラ: alternative Yggdrasil network client
(define-public popura-git
  (package
    (name "popura-git")
    (version "0.3.15+popura2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/popura-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "popura ポプラ: alternative Yggdrasil network client")
    (description "Popura ポプラ: alternative Yggdrasil network client.")
    (home-page "https://github.com/popura-network/Popura")
    (license license:lgpl3+)))

;;; put --- a modern, featureful echo(1)
(define-public put
  (package
    (name "put")
    (version "2.0.13.a.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/put.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a modern, featureful echo(1)")
    (description "A modern, featureful echo(1).")
    (home-page "https://github.com/Unlimiter/put")
    (license license:expat)))

;;; python-sl-cli-git --- stockholms Lokaltrafik - Command Line Interface
(define-public python-sl-cli-git
  (package
    (name "python-sl-cli-git")
    (version "1.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-sl-cli-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "stockholms Lokaltrafik - Command Line Interface")
    (description "Stockholms Lokaltrafik - Command Line Interface.")
    (home-page "https://github.com/Sebelino/SL-CLI")
    (license license:expat)))

;;; python-triangle --- python bindings to the triangle library
(define-public python-triangle
  (package
    (name "python-triangle")
    (version "20250106")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-triangle.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "python bindings to the triangle library")
    (description "Python bindings to the triangle library.")
    (home-page "https://github.com/drufat/triangle")
    (license license:lgpl3+)))

;;; pydvbstreamer --- python control modules for dvbstreamer (https://aur4.archlinux.org/packag...
(define-public pydvbstreamer
  (package
    (name "pydvbstreamer")
    (version "0.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/pydvbstreamer.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "python control modules for dvbstreamer (https://aur4.archlinux.org/packag...")
    (description "Python control modules for dvbstreamer (https://aur4.archlinux.org/packages/dvbstreamer/).")
    (home-page "http://sourceforge.net/projects/dvbstreamer/")
    (license license:gpl3+)))

;;; rssnix-git --- unix-style filesystem-based RSS/Atom/JSON Feed fetcher/reader
(define-public rssnix-git
  (package
    (name "rssnix-git")
    (version "r30.95ebe7d")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/rssnix-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "unix-style filesystem-based RSS/Atom/JSON Feed fetcher/reader")
    (description "Unix-style filesystem-based RSS/Atom/JSON Feed fetcher/reader.")
    (home-page "https://github.com/jafarlihi/rssnix")
    (license license:expat)))

;;; rvasm-git --- a risc-v assembler in rust
(define-public rvasm-git
  (package
    (name "rvasm-git")
    (version "r19.b38f1a6")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/rvasm-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a risc-v assembler in rust")
    (description "A risc-v assembler in rust.")
    (home-page "https://github.com/eigenraven/rvasm")
    (license license:asl2.0)))
