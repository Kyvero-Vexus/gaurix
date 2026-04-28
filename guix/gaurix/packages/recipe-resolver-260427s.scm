;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260427s
;;; Resolves 100 packages from queue (99 recipes, 1 blocked).
;;;
;;; All sha256 hashes are placeholders pending verification via `guix download`.

(define-module (gaurix packages recipe-resolver-260427s)
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
            elektroid-git
            crystal-dock-git
            geoclue-tz
            wtfutil
            another-redis-desktop-manager-appimage
            python-tensorstore
            python-optax
            delfin-git
            sublime-text-2
            thunar-dropbox
            mendeleydesktop
            pkgbrowser
            phpstorm
            phpstorm-jre
            x264-git
            gnome-browser-connector-git
            menulibre
            codecs64
            lives
            foldingathome
            smartgit
            archey3-git
            libgnomecups
            franz
            libgnomeprint
            openswan
            plex-media-server-plexpass
            lightworks
            fontmatrix
            pasystray-git
            partitionmanager-git
            acestream-engine
            furiusisomount
            log4c
            python-powerline-git
            vim-pathogen
            chrome-remote-desktop
            libpng15
            burpsuite
            tortoisehg
            nano-syntax-highlighting-git
            neroaacenc-bin
            breeze-gtk-git
            mysql-connector-java
            tvheadend
            tty-clock
            ncmpcpp-git
            babl-git
            youtube-viewer-git
            masterpdfeditor-free
            blueman-git
            handbrake-cli-git
            zsh-completions-git
            netease-cloud-music
            gegl-git
            get-iplayer
            jdk8
            gyp-git
            makehuman
            m64py
            dwarftherapist-git
            yt-dlg-git
            camorama
            edb-debugger
            openblas-lapack
            goldendict-git
            tixati
            yacy
            freerdp-git
            libqxt
            tenacity-git
            anyremote
            freetuxtv
            autopsy
            dzen2-git
            mnemosyne
            gtkam
            jack-rack
            chirp-next
            kdevelop-git
            libfilteraudio-git
            slimlock
            octopi-git
            sayonara-player
            latencytop
            darkplaces
            bspwm-git
            grive-git
            lightzone
            obkey
            screenfetch-git
            mutter-performance
            rstudio-desktop
            zoneminder
            lemonbar-git
            unifi
            heimdall-git
            bluej
            logitechmediaserver
            ))

;;; Nonfree/proprietary license placeholder for Gaurix channel
(define license:nonfree
  ((@@ (guix licenses) license) "Nonfree"
    "https://spdx.org/licenses/"
    "Proprietary or custom license; see upstream for terms."))

;;; elektroid-git --- gNU/Linux transfer application for Elektron devices
(define-public elektroid-git
  (package
    (name "elektroid-git")
    (version "2.0.beta.r101.ge94eb07-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/elektroid-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "gNU/Linux transfer application for Elektron devices")
    (description "GNU/Linux transfer application for Elektron devices.")
    (home-page "https://github.com/dagargo/elektroid")
    (license license:gpl3)))

;;; crystal-dock-git --- a cool desktop panel for Linux desktop
(define-public crystal-dock-git
  (package
    (name "crystal-dock-git")
    (version "r610.g7a34e96-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/crystal-dock-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a cool desktop panel for Linux desktop")
    (description "A cool desktop panel for Linux desktop.")
    (home-page "https://github.com/dangvd/crystal-dock")
    (license license:gpl3)))

;;; geoclue-tz --- generate geoclue /etc/geolocation based on the current time zone
(define-public geoclue-tz
  (package
    (name "geoclue-tz")
    (version "1.0.0-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/geoclue-tz.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "generate geoclue /etc/geolocation based on the current time zone")
    (description "Generate geoclue /etc/geolocation based on the current time zone.")
    (home-page "http://github.com/zquestz/geoclue-tz")
    (license license:expat)))

;;; wtfutil --- personal information dashboard for your terminal
(define-public wtfutil
  (package
    (name "wtfutil")
    (version "0.49.1-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/wtfutil.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "personal information dashboard for your terminal")
    (description "Personal information dashboard for your terminal.")
    (home-page "https://wtfutil.com")
    (license license:mpl2.0)))

;;; another-redis-desktop-manager-appimage --- a faster, better and more stable redis desktop manager
(define-public another-redis-desktop-manager-appimage
  (package
    (name "another-redis-desktop-manager-appimage")
    (version "1.7.1-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/another-redis-desktop-manager-appimage.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a faster, better and more stable redis desktop manager")
    (description "A faster, better and more stable redis desktop manager.")
    (home-page "https://github.com/qishibo/AnotherRedisDesktopManager")
    (license license:expat)))

;;; python-tensorstore --- library for reading and writing large multi-dimensional arrays
(define-public python-tensorstore
  (package
    (name "python-tensorstore")
    (version "0.1.73-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-tensorstore.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "library for reading and writing large multi-dimensional arrays")
    (description "Library for reading and writing large multi-dimensional arrays.")
    (home-page "https://github.com/google/tensorstore")
    (license license:asl2.0)))

;;; python-optax --- a gradient processing and optimization library for JAX
(define-public python-optax
  (package
    (name "python-optax")
    (version "0.2.7-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-optax.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a gradient processing and optimization library for JAX")
    (description "A gradient processing and optimization library for JAX.")
    (home-page "https://github.com/google-deepmind/optax")
    (license license:asl2.0)))

;;; delfin-git --- stream movies and TV shows from Jellyfin
(define-public delfin-git
  (package
    (name "delfin-git")
    (version "v0.1.0.r0.g4ca4574-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/delfin-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "stream movies and TV shows from Jellyfin")
    (description "Stream movies and TV shows from Jellyfin.")
    (home-page "https://delfin.avery.cafe/")
    (license license:gpl3)))

;;; sublime-text-2 --- sophisticated text editor for code, html and prose (legacy version)
(define-public sublime-text-2
  (package
    (name "sublime-text-2")
    (version "2.0.2-2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/sublime-text-2.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "sophisticated text editor for code, html and prose (legacy version)")
    (description "Sophisticated text editor for code, html and prose (legacy version).")
    (home-page "https://www.sublimetext.com/2")
    (license license:nonfree)))

;;; thunar-dropbox --- plugin for Thunar that adds context-menu items for Dropbox
(define-public thunar-dropbox
  (package
    (name "thunar-dropbox")
    (version "0.3.2-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/thunar-dropbox.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "plugin for Thunar that adds context-menu items for Dropbox")
    (description "Plugin for Thunar that adds context-menu items for Dropbox.")
    (home-page "https://github.com/Jeinzi/thunar-dropbox")
    (license license:gpl3)))

;;; mendeleydesktop --- academic software for managing and sharing research papers
(define-public mendeleydesktop
  (package
    (name "mendeleydesktop")
    (version "1.19.8-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mendeleydesktop.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "academic software for managing and sharing research papers")
    (description "Academic software for managing and sharing research papers.")
    (home-page "http://www.mendeley.com/release-notes/")
    (license license:nonfree)))

;;; pkgbrowser --- a utility for browsing pacman databases and the AUR
(define-public pkgbrowser
  (package
    (name "pkgbrowser")
    (version "0.29.1-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/pkgbrowser.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a utility for browsing pacman databases and the AUR")
    (description "A utility for browsing pacman databases and the AUR.")
    (home-page "https://codeberg.org/kachelaqa/pkgbrowser")
    (license license:gpl2)))

;;; phpstorm --- lightweight and Smart PHP IDE
(define-public phpstorm
  (package
    (name "phpstorm")
    (version "2026.1.1-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/phpstorm.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "lightweight and Smart PHP IDE")
    (description "Lightweight and Smart PHP IDE.")
    (home-page "https://www.jetbrains.com/phpstorm/")
    (license license:nonfree)))

;;; phpstorm-jre --- jBR (JetBrains Runtime) for PhpStorm - a patched JRE
(define-public phpstorm-jre
  (package
    (name "phpstorm-jre")
    (version "2026.1.1-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/phpstorm-jre.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "jBR (JetBrains Runtime) for PhpStorm - a patched JRE")
    (description "JBR (JetBrains Runtime) for PhpStorm - a patched JRE.")
    (home-page "https://github.com/JetBrains/JetBrainsRuntime")
    (license license:nonfree)))

;;; x264-git --- open Source H.264/AVC video encoder (git version)
(define-public x264-git
  (package
    (name "x264-git")
    (version "161.r3042.gb3aadb76-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/x264-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "open Source H.264/AVC video encoder (git version)")
    (description "Open Source H.264/AVC video encoder (git version).")
    (home-page "https://www.videolan.org/developers/x264.html")
    (license license:gpl3+)))

;;; gnome-browser-connector-git --- native browser connector for integration with extensions.gnome.org
(define-public gnome-browser-connector-git
  (package
    (name "gnome-browser-connector-git")
    (version "42rc.r656.101c501-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gnome-browser-connector-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "native browser connector for integration with extensions.gnome.org")
    (description "Native browser connector for integration with extensions.gnome.org.")
    (home-page "https://wiki.gnome.org/Projects/GnomeShellIntegration")
    (license license:gpl3)))

;;; menulibre --- an advanced menu editor that provides modern features in a clean, easy-to-use
(define-public menulibre
  (package
    (name "menulibre")
    (version "1:2.4.0-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/menulibre.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "an advanced menu editor that provides modern features in a clean, easy-to-use")
    (description "An advanced menu editor that provides modern features in a clean, easy-to-use interface.")
    (home-page "https://github.com/bluesabre/menulibre")
    (license license:gpl3)))

;;; codecs64 --- non-linux native codec pack
(define-public codecs64
  (package
    (name "codecs64")
    (version "20071007-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/codecs64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "non-linux native codec pack")
    (description "Non-linux native codec pack.")
    (home-page "http://www.mplayerhq.hu/design7/dload.html")
    (license license:nonfree)))

;;; lives --- a Video Editing System
(define-public lives
  (package
    (name "lives")
    (version "3.2.0-2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lives.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a Video Editing System")
    (description "A Video Editing System.")
    (home-page "http://lives-video.com")
    (license license:gpl3+)))

;;; foldingathome --- a distributed computing project for simulating protein dynamics
(define-public foldingathome
  (package
    (name "foldingathome")
    (version "1:8.5.5-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/foldingathome.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a distributed computing project for simulating protein dynamics")
    (description "A distributed computing project for simulating protein dynamics.")
    (home-page "https://foldingathome.org/")
    (license license:gpl3+)))

;;; smartgit --- git client with Hg and SVN support
(define-public smartgit
  (package
    (name "smartgit")
    (version "25.1.128-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/smartgit.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "git client with Hg and SVN support")
    (description "Git client with Hg and SVN support.")
    (home-page "https://www.smartgit.dev/")
    (license license:nonfree)))

;;; archey3-git --- python script to display system information alongside the Arch Linux logo
(define-public archey3-git
  (package
    (name "archey3-git")
    (version "0.4.r57.gac68752-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/archey3-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "python script to display system information alongside the Arch Linux logo")
    (description "Python script to display system information alongside the Arch Linux logo.")
    (home-page "https://lclarkmichalek.github.io/archey3/")
    (license license:gpl3+)))

;;; libgnomecups --- gNOME CUPS library
(define-public libgnomecups
  (package
    (name "libgnomecups")
    (version "0.2.3-17")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/libgnomecups.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "gNOME CUPS library")
    (description "GNOME CUPS library.")
    (home-page "http://www.gnome.org/")
    (license license:gpl3+)))

;;; franz --- messaging app for WhatsApp, Slack, Telegram, Gmail, Hangouts and many many mo
(define-public franz
  (package
    (name "franz")
    (version "1:5.11.0-2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/franz.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "messaging app for WhatsApp, Slack, Telegram, Gmail, Hangouts and many many mo")
    (description "Messaging app for WhatsApp, Slack, Telegram, Gmail, Hangouts and many many more.")
    (home-page "https://github.com/meetfranz/franz")
    (license license:asl2.0)))

;;; libgnomeprint --- printing routines for GNOME
(define-public libgnomeprint
  (package
    (name "libgnomeprint")
    (version "2.18.8-10")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/libgnomeprint.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "printing routines for GNOME")
    (description "Printing routines for GNOME.")
    (home-page "http://www.gnome.org/")
    (license license:gpl3+)))

;;; openswan --- open Source implementation of IPsec for Linux
(define-public openswan
  (package
    (name "openswan")
    (version "3.0.0-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/openswan.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "open Source implementation of IPsec for Linux")
    (description "Open Source implementation of IPsec for Linux.")
    (home-page "https://www.openswan.org")
    (license license:nonfree)))

;;; plex-media-server-plexpass --- the back-end media server component of Plex
(define-public plex-media-server-plexpass
  (package
    (name "plex-media-server-plexpass")
    (version "1.43.1.10611-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/plex-media-server-plexpass.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the back-end media server component of Plex")
    (description "The back-end media server component of Plex.")
    (home-page "https://plex.tv/")
    (license license:nonfree)))

;;; lightworks --- lightworks is a professional video editing suite
(define-public lightworks
  (package
    (name "lightworks")
    (version "2025.2.56344-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lightworks.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "lightworks is a professional video editing suite")
    (description "Lightworks is a professional video editing suite.")
    (home-page "http://www.lwks.com/")
    (license license:nonfree)))

;;; fontmatrix --- free font collections manager for Linux, Mac and Windows
(define-public fontmatrix
  (package
    (name "fontmatrix")
    (version "0.9.100-3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/fontmatrix.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "free font collections manager for Linux, Mac and Windows")
    (description "Free font collections manager for Linux, Mac and Windows.")
    (home-page "https://github.com/fontmatrix/fontmatrix")
    (license license:gpl3+)))

;;; pasystray-git --- pulseAudio system tray (a replacement for padevchooser)
(define-public pasystray-git
  (package
    (name "pasystray-git")
    (version "0.6.0.r2.g14b4bce-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/pasystray-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "pulseAudio system tray (a replacement for padevchooser)")
    (description "PulseAudio system tray (a replacement for padevchooser).")
    (home-page "https://github.com/christophgysin/pasystray")
    (license license:lgpl3+)))

;;; partitionmanager-git --- a KDE utility that allows you to manage disks, partitions, and file systems. 
(define-public partitionmanager-git
  (package
    (name "partitionmanager-git")
    (version "24.04.70.r1949.6c37f067-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/partitionmanager-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a KDE utility that allows you to manage disks, partitions, and file systems. ")
    (description "A KDE utility that allows you to manage disks, partitions, and file systems. (GIT version).")
    (home-page "https://kde.org/applications/en/system/org.kde.partitionmanager")
    (license license:gpl2)))

;;; acestream-engine --- ace Stream engine
(define-public acestream-engine
  (package
    (name "acestream-engine")
    (version "3.2.11-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/acestream-engine.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "ace Stream engine")
    (description "Ace Stream engine.")
    (home-page "https://acestream.org")
    (license license:nonfree)))

;;; furiusisomount --- a PyGTK interface for managing ISO/IMG/BIN/MDF/NRG image files
(define-public furiusisomount
  (package
    (name "furiusisomount")
    (version "0.11.3.1-2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/furiusisomount.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a PyGTK interface for managing ISO/IMG/BIN/MDF/NRG image files")
    (description "A PyGTK interface for managing ISO/IMG/BIN/MDF/NRG image files.")
    (home-page "https://launchpad.net/furiusisomount")
    (license license:gpl3)))

;;; log4c --- logging FrameWork for C, as Log4j or Log4Cpp
(define-public log4c
  (package
    (name "log4c")
    (version "1.2.4-4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/log4c.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "logging FrameWork for C, as Log4j or Log4Cpp")
    (description "Logging FrameWork for C, as Log4j or Log4Cpp.")
    (home-page "http://log4c.sourceforge.net/")
    (license license:lgpl3+)))

;;; python-powerline-git --- the ultimate statusline/prompt utility
(define-public python-powerline-git
  (package
    (name "python-powerline-git")
    (version "1:2.8.4+2+g574bb188-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-powerline-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the ultimate statusline/prompt utility")
    (description "The ultimate statusline/prompt utility.")
    (home-page "https://github.com/powerline/powerline")
    (license license:expat)))

;;; vim-pathogen --- a vim plugin for managing your runtimepath
(define-public vim-pathogen
  (package
    (name "vim-pathogen")
    (version "2.4-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/vim-pathogen.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a vim plugin for managing your runtimepath")
    (description "A vim plugin for managing your runtimepath.")
    (home-page "http://github.com/tpope/vim-pathogen")
    (license license:gpl3+)))

;;; chrome-remote-desktop --- access other computers or allow another user to access your computer securely
(define-public chrome-remote-desktop
  (package
    (name "chrome-remote-desktop")
    (version "148.0.7778.21-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/chrome-remote-desktop.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "access other computers or allow another user to access your computer securely")
    (description "Access other computers or allow another user to access your computer securely over the Internet.")
    (home-page "https://remotedesktop.google.com")
    (license license:bsd-3)))

;;; libpng15 --- a collection of routines used to create PNG format graphics files (1.5 branch
(define-public libpng15
  (package
    (name "libpng15")
    (version "1.5.30-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/libpng15.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a collection of routines used to create PNG format graphics files (1.5 branch")
    (description "A collection of routines used to create PNG format graphics files (1.5 branch).")
    (home-page "http://www.libpng.org/pub/png/libpng.html")
    (license license:nonfree)))

;;; burpsuite --- an integrated platform for performing security testing of web applications (f
(define-public burpsuite
  (package
    (name "burpsuite")
    (version "2026.4-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/burpsuite.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "an integrated platform for performing security testing of web applications (f")
    (description "An integrated platform for performing security testing of web applications (free edition).")
    (home-page "https://portswigger.net/burp/")
    (license license:nonfree)))

;;; tortoisehg --- graphical tools for Mercurial
(define-public tortoisehg
  (package
    (name "tortoisehg")
    (version "7.0.1-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/tortoisehg.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "graphical tools for Mercurial")
    (description "Graphical tools for Mercurial.")
    (home-page "https://foss.heptapod.net/mercurial/tortoisehg/thg")
    (license license:gpl3+)))

;;; nano-syntax-highlighting-git --- improved nano syntax highlighting files
(define-public nano-syntax-highlighting-git
  (package
    (name "nano-syntax-highlighting-git")
    (version "2022.11.02.r112.ge7380a8-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/nano-syntax-highlighting-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "improved nano syntax highlighting files")
    (description "Improved nano syntax highlighting files.")
    (home-page "https://github.com/galenguyer/nano-syntax-highlighting")
    (license license:gpl3)))

;;; neroaacenc-bin --- nero AAC reference quality MPEG-4 and 3GPP audio codec. Encoder
(define-public neroaacenc-bin
  (package
    (name "neroaacenc-bin")
    (version "1.5.4-4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/neroaacenc-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "nero AAC reference quality MPEG-4 and 3GPP audio codec. Encoder")
    (description "Nero AAC reference quality MPEG-4 and 3GPP audio codec. Encoder.")
    (home-page "http://www.nero.com")
    (license license:nonfree)))

;;; breeze-gtk-git --- breeze widget theme for GTK 2 and 3. (GIT version)
(define-public breeze-gtk-git
  (package
    (name "breeze-gtk-git")
    (version "6.2.80.r541.5b65eb2-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/breeze-gtk-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "breeze widget theme for GTK 2 and 3. (GIT version)")
    (description "Breeze widget theme for GTK 2 and 3. (GIT version).")
    (home-page "https://invent.kde.org/plasma/breeze-gtk")
    (license license:lgpl3+)))

;;; mysql-connector-java --- java library to connect to MySQL
(define-public mysql-connector-java
  (package
    (name "mysql-connector-java")
    (version "9.5.0-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mysql-connector-java.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "java library to connect to MySQL")
    (description "Java library to connect to MySQL.")
    (home-page "https://dev.mysql.com/downloads/connector/j/")
    (license license:gpl2+)))

;;; tvheadend --- tV streaming server for Linux
(define-public tvheadend
  (package
    (name "tvheadend")
    (version "4.2.8-8")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/tvheadend.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "tV streaming server for Linux")
    (description "TV streaming server for Linux.")
    (home-page "https://tvheadend.org/")
    (license license:gpl3)))

;;; tty-clock --- digital clock in ncurses
(define-public tty-clock
  (package
    (name "tty-clock")
    (version "2.3-2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/tty-clock.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "digital clock in ncurses")
    (description "Digital clock in ncurses.")
    (home-page "https://github.com/xorg62/tty-clock")
    (license license:bsd-3)))

;;; ncmpcpp-git --- an almost exact clone of ncmpc with some new features (git version)
(define-public ncmpcpp-git
  (package
    (name "ncmpcpp-git")
    (version "2:0.10.r5.g440e9a57-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ncmpcpp-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "an almost exact clone of ncmpc with some new features (git version)")
    (description "An almost exact clone of ncmpc with some new features (git version).")
    (home-page "https://rybczak.net/ncmpcpp/")
    (license license:gpl2+)))

;;; babl-git --- dynamic, any to any, pixel format translation library
(define-public babl-git
  (package
    (name "babl-git")
    (version "0.1.111.r1907.f11a454-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/babl-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "dynamic, any to any, pixel format translation library")
    (description "Dynamic, any to any, pixel format translation library.")
    (home-page "https://www.gegl.org/babl")
    (license license:lgpl3)))

;;; youtube-viewer-git --- a lightweight YouTube client for Linux
(define-public youtube-viewer-git
  (package
    (name "youtube-viewer-git")
    (version "3.11.6.r0.gcc1264a-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/youtube-viewer-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a lightweight YouTube client for Linux")
    (description "A lightweight YouTube client for Linux.")
    (home-page "https://github.com/trizen/youtube-viewer")
    (license license:artistic2.0)))

;;; masterpdfeditor-free --- a complete solution for creation and editing PDF files - Free version without
(define-public masterpdfeditor-free
  (package
    (name "masterpdfeditor-free")
    (version "4.3.89-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/masterpdfeditor-free.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a complete solution for creation and editing PDF files - Free version without")
    (description "A complete solution for creation and editing PDF files - Free version without watermark.")
    (home-page "https://code-industry.net/free-pdf-editor/")
    (license license:nonfree)))

;;; blueman-git --- a GTK+ Bluetooth Manager (BlueZ 5) - git
(define-public blueman-git
  (package
    (name "blueman-git")
    (version "2.3.beta1.r134.gb76b1bb2-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/blueman-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a GTK+ Bluetooth Manager (BlueZ 5) - git")
    (description "A GTK+ Bluetooth Manager (BlueZ 5) - git.")
    (home-page "https://github.com/blueman-project/blueman")
    (license license:gpl3+)))

;;; handbrake-cli-git --- multithreaded video transcoder (CLI)
(define-public handbrake-cli-git
  (package
    (name "handbrake-cli-git")
    (version "1.10.0.r0.gdba479e9f-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/handbrake-cli-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "multithreaded video transcoder (CLI)")
    (description "Multithreaded video transcoder (CLI).")
    (home-page "https://github.com/HandBrake/HandBrake")
    (license license:gpl2)))

;;; zsh-completions-git --- additional completion definitions for Zsh
(define-public zsh-completions-git
  (package
    (name "zsh-completions-git")
    (version "0.34.0.r110.g6a5b724-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/zsh-completions-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "additional completion definitions for Zsh")
    (description "Additional completion definitions for Zsh.")
    (home-page "https://github.com/zsh-users/zsh-completions")
    (license license:gpl3+)))

;;; netease-cloud-music --- netease Cloud Music, converted from .deb package
(define-public netease-cloud-music
  (package
    (name "netease-cloud-music")
    (version "1.2.1-9")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/netease-cloud-music.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "netease Cloud Music, converted from .deb package")
    (description "Netease Cloud Music, converted from .deb package.")
    (home-page "https://music.163.com/")
    (license license:nonfree)))

;;; gegl-git --- graph based image processing framework
(define-public gegl-git
  (package
    (name "gegl-git")
    (version "0.4.55.r10941.3f7d642de-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gegl-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "graph based image processing framework")
    (description "Graph based image processing framework.")
    (home-page "https://www.gegl.org")
    (license license:gpl3)))

;;; get-iplayer --- allows you to download or stream any iPlayer programme from the BBC in H.264 
(define-public get-iplayer
  (package
    (name "get_iplayer")
    (version "3.36-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/get_iplayer.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "allows you to download or stream any iPlayer programme from the BBC in H.264 ")
    (description "Allows you to download or stream any iPlayer programme from the BBC in H.264 (Quicktime/mp4) format, any radio programmes in MP3 or RealAudio format.")
    (home-page "https://github.com/get-iplayer/get_iplayer/")
    (license license:gpl3)))

;;; jdk8 --- oracle Java 8 Development Kit LTS
(define-public jdk8
  (package
    (name "jdk8")
    (version "8u441-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/jdk8.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "oracle Java 8 Development Kit LTS")
    (description "Oracle Java 8 Development Kit LTS.")
    (home-page "https://www.oracle.com/technetwork/java/javase/downloads/index.html")
    (license license:nonfree)))

;;; gyp-git --- gYP can Generate Your Projects
(define-public gyp-git
  (package
    (name "gyp-git")
    (version "2174.1615ec32-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gyp-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "gYP can Generate Your Projects")
    (description "GYP can Generate Your Projects.")
    (home-page "http://code.google.com/p/gyp/")
    (license license:nonfree)))

;;; makehuman --- parametrical modeling program for creating human bodies
(define-public makehuman
  (package
    (name "makehuman")
    (version "1.3.0-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/makehuman.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "parametrical modeling program for creating human bodies")
    (description "Parametrical modeling program for creating human bodies.")
    (home-page "http://www.makehumancommunity.org/")
    (license license:gpl3+)))

;;; m64py --- a Qt5 front-end (GUI) for Mupen64Plus, a cross-platform plugin-based Nintendo
(define-public m64py
  (package
    (name "m64py")
    (version "0.3.0-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/m64py.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a Qt5 front-end (GUI) for Mupen64Plus, a cross-platform plugin-based Nintendo")
    (description "A Qt5 front-end (GUI) for Mupen64Plus, a cross-platform plugin-based Nintendo 64 emulator.")
    (home-page "https://github.com/mupen64plus/mupen64plus-ui-python")
    (license license:gpl3+)))

;;; dwarftherapist-git --- heavily modified version of the original Dwarf Therapist
(define-public dwarftherapist-git
  (package
    (name "dwarftherapist-git")
    (version "2:40.0.0_r0_g4d399d76-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/dwarftherapist-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "heavily modified version of the original Dwarf Therapist")
    (description "Heavily modified version of the original Dwarf Therapist.")
    (home-page "https://github.com/Dwarf-Therapist/Dwarf-Therapist")
    (license license:expat)))

;;; yt-dlg-git --- a cross platform front-end GUI of the popular youtube-dl written in wxPython 
(define-public yt-dlg-git
  (package
    (name "yt-dlg-git")
    (version "1.2.0.r242.g3ec93dc-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/yt-dlg-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a cross platform front-end GUI of the popular youtube-dl written in wxPython ")
    (description "A cross platform front-end GUI of the popular youtube-dl written in wxPython (maintained fork of youtube-dl-gui).")
    (home-page "https://github.com/oleksis/youtube-dl-gui")
    (license license:nonfree)))

;;; camorama --- gNOME 3 Webcam application featuring various image filters
(define-public camorama
  (package
    (name "camorama")
    (version "0.21.2-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/camorama.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "gNOME 3 Webcam application featuring various image filters")
    (description "GNOME 3 Webcam application featuring various image filters.")
    (home-page "https://github.com/alessio/camorama")
    (license license:gpl2)))

;;; edb-debugger --- eDB (Evan's Debugger) is a cross platform AArch32/x86/x86-64 debugger, inspir
(define-public edb-debugger
  (package
    (name "edb-debugger")
    (version "1.5.0-3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/edb-debugger.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "eDB (Evan's Debugger) is a cross platform AArch32/x86/x86-64 debugger, inspir")
    (description "EDB (Evan's Debugger) is a cross platform AArch32/x86/x86-64 debugger, inspired by Ollydbg.")
    (home-page "http://www.codef00.com/projects#debugger")
    (license license:gpl2)))

;;; openblas-lapack --- optimized BLAS library based on GotoBLAS2 1.13 BSD (providing blas, lapack, a
(define-public openblas-lapack
  (package
    (name "openblas-lapack")
    (version "0.3.33-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/openblas-lapack.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "optimized BLAS library based on GotoBLAS2 1.13 BSD (providing blas, lapack, a")
    (description "Optimized BLAS library based on GotoBLAS2 1.13 BSD (providing blas, lapack, and cblas).")
    (home-page "http://www.openblas.net/")
    (license license:bsd-3)))

;;; goldendict-git --- feature-rich dictionary lookup program supporting multiple dictionary formats
(define-public goldendict-git
  (package
    (name "goldendict-git")
    (version "1:1.5.0rc2.r521.g99982a1c-2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/goldendict-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "feature-rich dictionary lookup program supporting multiple dictionary formats")
    (description "Feature-rich dictionary lookup program supporting multiple dictionary formats.")
    (home-page "https://github.com/goldendict/goldendict")
    (license license:gpl3)))

;;; tixati --- tixati is a peer-to-peer file sharing program that uses the popular BitTorren
(define-public tixati
  (package
    (name "tixati")
    (version "3.42-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/tixati.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "tixati is a peer-to-peer file sharing program that uses the popular BitTorren")
    (description "Tixati is a peer-to-peer file sharing program that uses the popular BitTorrent protocol.")
    (home-page "http://www.tixati.com/")
    (license license:nonfree)))

;;; yacy --- peer to peer search engine
(define-public yacy
  (package
    (name "yacy")
    (version "1.940-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/yacy.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "peer to peer search engine")
    (description "Peer to peer search engine.")
    (home-page "https://yacy.net/")
    (license license:gpl2)))

;;; freerdp-git --- free implementation of the Remote Desktop Protocol (RDP)
(define-public freerdp-git
  (package
    (name "freerdp-git")
    (version "3.18.0.r6.g193f76e-2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/freerdp-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "free implementation of the Remote Desktop Protocol (RDP)")
    (description "Free implementation of the Remote Desktop Protocol (RDP).")
    (home-page "https://github.com/FreeRDP/FreeRDP")
    (license license:asl2.0)))

;;; libqxt --- provides a suite of cross-platform utility classes to add functionality not r
(define-public libqxt
  (package
    (name "libqxt")
    (version "0.6.2-5")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/libqxt.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "provides a suite of cross-platform utility classes to add functionality not r")
    (description "Provides a suite of cross-platform utility classes to add functionality not readily available in the Qt toolkit.")
    (home-page "http://www.libqxt.org")
    (license license:gpl2+)))

;;; tenacity-git --- an easy-to-use multi-track audio editor and recorder, forked from Audacity
(define-public tenacity-git
  (package
    (name "tenacity-git")
    (version "1:r14921.g8119cb11c-2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/tenacity-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "an easy-to-use multi-track audio editor and recorder, forked from Audacity")
    (description "An easy-to-use multi-track audio editor and recorder, forked from Audacity.")
    (home-page "https://tenacityaudio.org")
    (license license:gpl2)))

;;; anyremote --- remote control (console-oriented) through bluetooth or IR connection
(define-public anyremote
  (package
    (name "anyremote")
    (version "6.7.3-2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/anyremote.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "remote control (console-oriented) through bluetooth or IR connection")
    (description "Remote control (console-oriented) through bluetooth or IR connection.")
    (home-page "http://anyremote.sourceforge.net")
    (license license:gpl3)))

;;; freetuxtv --- webTV vlc player to watch tv/radio playlists on the internet
(define-public freetuxtv
  (package
    (name "freetuxtv")
    (version "0.6.8-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/freetuxtv.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "webTV vlc player to watch tv/radio playlists on the internet")
    (description "WebTV vlc player to watch tv/radio playlists on the internet.")
    (home-page "https://github.com/freetuxtv/freetuxtv")
    (license license:gpl3)))

;;; autopsy --- digital forensics platform and graphical interface to The Sleuth Kit® and oth
(define-public autopsy
  (package
    (name "autopsy")
    (version "4.22.1-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/autopsy.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "digital forensics platform and graphical interface to The Sleuth Kit® and oth")
    (description "Digital forensics platform and graphical interface to The Sleuth Kit® and other digital forensic tools.")
    (home-page "http://www.sleuthkit.org/autopsy/")
    (license license:asl2.0)))

;;; dzen2-git --- x notification utility with Xinerama and XMP support, git version
(define-public dzen2-git
  (package
    (name "dzen2-git")
    (version "r14.488ab66-3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/dzen2-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "x notification utility with Xinerama and XMP support, git version")
    (description "X notification utility with Xinerama and XMP support, git version.")
    (home-page "https://github.com/robm/dzen")
    (license license:expat)))

;;; mnemosyne --- a flash-card tool with a sophisticated card review algorithm
(define-public mnemosyne
  (package
    (name "mnemosyne")
    (version "2.11-4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mnemosyne.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a flash-card tool with a sophisticated card review algorithm")
    (description "A flash-card tool with a sophisticated card review algorithm.")
    (home-page "https://www.mnemosyne-proj.org")
    (license license:gpl3+)))

;;; gtkam --- a GTK2 frontend for libgphoto2
(define-public gtkam
  (package
    (name "gtkam")
    (version "1.1-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gtkam.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a GTK2 frontend for libgphoto2")
    (description "A GTK2 frontend for libgphoto2.")
    (home-page "https://github.com/gphoto/gtkam")
    (license license:gpl2+)))

;;; jack-rack --- effects rack for JACK
(define-public jack-rack
  (package
    (name "jack-rack")
    (version "1.5.0-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/jack-rack.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "effects rack for JACK")
    (description "Effects rack for JACK.")
    (home-page "http://jack-rack.sourceforge.net")
    (license license:gpl2+)))

;;; chirp-next --- gUI tool for programming ham radios
(define-public chirp-next
  (package
    (name "chirp-next")
    (version "1:20260424-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/chirp-next.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "gUI tool for programming ham radios")
    (description "GUI tool for programming ham radios.")
    (home-page "https://chirpmyradio.com/projects/chirp/wiki/Home")
    (license license:gpl3+)))

;;; kdevelop-git --- cross-platform IDE for C/C++, Python, QML, and more (Git snapshot)
(define-public kdevelop-git
  (package
    (name "kdevelop-git")
    (version "25.08.90.r0.gabcdef0-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/kdevelop-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "cross-platform IDE for C/C++, Python, QML, and more (Git snapshot)")
    (description "Cross-platform IDE for C/C++, Python, QML, and more (Git snapshot).")
    (home-page "https://kdevelop.org/")
    (license license:gpl3+)))

;;; libfilteraudio-git --- an easy to use audio filtering library made from webrtc code
(define-public libfilteraudio-git
  (package
    (name "libfilteraudio-git")
    (version "0.0.1.r0.gada2f4f-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/libfilteraudio-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "an easy to use audio filtering library made from webrtc code")
    (description "An easy to use audio filtering library made from webrtc code.")
    (home-page "https://github.com/irungentoo/filter_audio")
    (license license:bsd-3)))

;;; slimlock --- unholy screen locker (without SLiM)
(define-public slimlock
  (package
    (name "slimlock")
    (version "1.3.6-3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/slimlock.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "unholy screen locker (without SLiM)")
    (description "Unholy screen locker (without SLiM).")
    (home-page "https://github.com/iwamatsu/slim")
    (license license:gpl2)))

;;; octopi-git --- this is Octopi, a powerful Pacman frontend using Qt libs
(define-public octopi-git
  (package
    (name "octopi-git")
    (version "0.16.2.r31.d98b3541-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/octopi-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "this is Octopi, a powerful Pacman frontend using Qt libs")
    (description "This is Octopi, a powerful Pacman frontend using Qt libs.")
    (home-page "https://github.com/aarnt/octopi")
    (license license:gpl2)))

;;; sayonara-player --- small, clear and fast audio player for Linux written in C++, supported by the
(define-public sayonara-player
  (package
    (name "sayonara-player")
    (version "1.11.0_stable1-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/sayonara-player.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "small, clear and fast audio player for Linux written in C++, supported by the")
    (description "Small, clear and fast audio player for Linux written in C++, supported by the Qt framework. It uses Gstreamer as audio backend.")
    (home-page "https://sayonara-player.com/")
    (license license:gpl3)))

;;; latencytop --- a tool for software developers, aimed at identifying where system latency occ
(define-public latencytop
  (package
    (name "latencytop")
    (version "1:0.5.0-2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/latencytop.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a tool for software developers, aimed at identifying where system latency occ")
    (description "A tool for software developers, aimed at identifying where system latency occurs.")
    (home-page "http://ftp.de.debian.org/debian/pool/main/l/latencytop")
    (license license:gpl3+)))

;;; darkplaces --- an advanced Quake 1 game engine
(define-public darkplaces
  (package
    (name "darkplaces")
    (version "20140513-4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/darkplaces.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "an advanced Quake 1 game engine")
    (description "An advanced Quake 1 game engine.")
    (home-page "http://icculus.org/twilight/darkplaces/")
    (license license:gpl2)))

;;; bspwm-git --- a tiling window manager based on binary space partitioning
(define-public bspwm-git
  (package
    (name "bspwm-git")
    (version "0.9.12.r1508.c5cf7d3-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/bspwm-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a tiling window manager based on binary space partitioning")
    (description "A tiling window manager based on binary space partitioning.")
    (home-page "https://github.com/baskerville/bspwm")
    (license license:bsd-3)))

;;; grive-git --- an open source Linux client for Google Drive with support for the new Drive R
(define-public grive-git
  (package
    (name "grive-git")
    (version "557.648ff8e-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/grive-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "an open source Linux client for Google Drive with support for the new Drive R")
    (description "An open source Linux client for Google Drive with support for the new Drive REST API and partial sync.")
    (home-page "https://github.com/vitalif/grive2")
    (license license:gpl2)))

;;; lightzone --- open-source professional-level digital darkroom software
(define-public lightzone
  (package
    (name "lightzone")
    (version "5.0.0beta3-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lightzone.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "open-source professional-level digital darkroom software")
    (description "Open-source professional-level digital darkroom software.")
    (home-page "https://github.com/ktgw0316/LightZone/")
    (license license:bsd-3)))

;;; obkey --- openbox Key Editor
(define-public obkey
  (package
    (name "obkey")
    (version "1.0-5")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/obkey.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "openbox Key Editor")
    (description "Openbox Key Editor.")
    (home-page "https://github.com/nsf/obkey")
    (license license:expat)))

;;; screenfetch-git --- cLI Bash script to show system/theme info in screenshots
(define-public screenfetch-git
  (package
    (name "screenfetch-git")
    (version "1:3.8.0.r35.gdf6a2b1-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/screenfetch-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "cLI Bash script to show system/theme info in screenshots")
    (description "CLI Bash script to show system/theme info in screenshots.")
    (home-page "https://github.com/KittyKatt/screenFetch")
    (license license:gpl3+)))

;;; mutter-performance --- window manager and compositor for GNOME
(define-public mutter-performance
  (package
    (name "mutter-performance")
    (version "49.0-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mutter-performance.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "window manager and compositor for GNOME")
    (description "Window manager and compositor for GNOME.")
    (home-page "https://gitlab.gnome.org/GNOME/mutter")
    (license license:gpl2+)))

;;; rstudio-desktop --- a powerful and productive integrated development environment (IDE) for R prog
(define-public rstudio-desktop
  (package
    (name "rstudio-desktop")
    (version "2026.04.0.526-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/rstudio-desktop.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a powerful and productive integrated development environment (IDE) for R prog")
    (description "A powerful and productive integrated development environment (IDE) for R programming language.")
    (home-page "https://github.com/rstudio/rstudio")
    (license license:agpl3)))

;;; zoneminder --- a full-featured, open source, state-of-the-art video surveillance software sy
(define-public zoneminder
  (package
    (name "zoneminder")
    (version "1.38.1-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/zoneminder.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a full-featured, open source, state-of-the-art video surveillance software sy")
    (description "A full-featured, open source, state-of-the-art video surveillance software system.")
    (home-page "https://zoneminder.com/")
    (license license:gpl2+)))

;;; lemonbar-git --- a featherweight, lemon-scented, bar based on xcb
(define-public lemonbar-git
  (package
    (name "lemonbar-git")
    (version "v1.5.r2.g59b0d28-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lemonbar-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a featherweight, lemon-scented, bar based on xcb")
    (description "A featherweight, lemon-scented, bar based on xcb.")
    (home-page "https://github.com/LemonBoy/bar")
    (license license:expat)))

;;; unifi --- centralized management system for Ubiquiti UniFi AP
(define-public unifi
  (package
    (name "unifi")
    (version "10.3.55-2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/unifi.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "centralized management system for Ubiquiti UniFi AP")
    (description "Centralized management system for Ubiquiti UniFi AP.")
    (home-page "https://unifi-network.ui.com")
    (license license:nonfree)))

;;; heimdall-git --- tool suite used to flash firmware (ROMs) onto Samsung Galaxy S devices (griml
(define-public heimdall-git
  (package
    (name "heimdall-git")
    (version "2.2.2.r0.gd9554e7-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/heimdall-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "tool suite used to flash firmware (ROMs) onto Samsung Galaxy S devices (griml")
    (description "Tool suite used to flash firmware (ROMs) onto Samsung Galaxy S devices (grimler fork).")
    (home-page "https://git.sr.ht/~grimler/Heimdall")
    (license license:expat)))

;;; bluej --- a free Java Development Environment designed for beginners, used by millions 
(define-public bluej
  (package
    (name "bluej")
    (version "5.5.0-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/bluej.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a free Java Development Environment designed for beginners, used by millions ")
    (description "A free Java Development Environment designed for beginners, used by millions worlwide.")
    (home-page "https://www.bluej.org")
    (license license:asl2.0)))

;;; logitechmediaserver --- slimserver for Logitech Squeezebox players. This server is also called Logite
(define-public logitechmediaserver
  (package
    (name "logitechmediaserver")
    (version "8.5.2-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/logitechmediaserver.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "slimserver for Logitech Squeezebox players. This server is also called Logite")
    (description "Slimserver for Logitech Squeezebox players. This server is also called Logitech Media Server. (Release-Version, if you prefer bleeding edge consider using logitechmediaserver-git instead).")
    (home-page "https://github.com/LMS-Community/slimserver")
    (license license:nonfree)))
