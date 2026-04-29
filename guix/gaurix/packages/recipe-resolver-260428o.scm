;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260428o
;;; Resolves 100 packages from queue (100 recipes, 0 blocked).
;;; Groups: cursor themes (7), GTK/icon themes (4), CLI tools (25),
;;;         audio/music (9), desktop apps (15), games (8),
;;;         development tools (11), plugins/extensions (9),
;;;         misc utilities (12).
;;;
;;; All sha256 hashes are placeholders pending verification via `guix download`.
;;;
;;; Generated: 2026-04-28

(define-module (gaurix packages recipe-resolver-260428o)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system python)
  #:use-module (guix build-system trivial)
  #:use-module ((guix licenses) #:prefix license:)
  #:export (
            xcursor-arch-simple
            xcursor-breeze5
            xcursor-pro-cursor-theme
            xcursor-red-dot
            xcursor-terranove
            xcursor-we10xos
            xcursor-alkano-default
            vertex-themes-git
            zuki-themes-git
            zukitwo-themes-git
            elementary-icon-theme-git
            gtk-clearlooks-compact
            x-arc-plus
            docbook-to-man
            mkclean
            outguess
            whdd
            bashish
            sux
            unzip-natspec
            powerstat-git
            tin
            createtorrent
            sshmnt
            ssvnc
            evrouter
            fim
            xautoclick
            expac-git
            ponymix-git
            soundcloud-dl-git
            enhanced-ctorrent
            urlscan-git
            whatmp3
            xcape-git
            xsettingsd-git
            imgur-screenshot
            audiothumbnailer
            cmusfm
            mopidy-scrobbler
            uade
            anoise
            anoise-media
            pyradio-git
            dr14-t-meter-git
            qwinff
            redshift-qt
            volnoti
            qjoypad
            cozy-audiobooks
            haroopad
            sanoid
            anamnesis
            xplayer
            grun
            textroom
            extcalc
            pacman4console
            nethack-x11
            quake2
            ardentryst-git
            ezquake
            powder
            zsxd
            wolf
            gitahead
            dbus-cpp
            process-cpp
            libxspf
            logstalgia
            angular-cli
            nodejs-tldr
            xbindkeys-git
            gimp-plugin-bimp
            gimp-plugin-refocusit
            urxvt-fullscreen
            urxvt-font-size-git
            vim-nginx
            gnome-shell-extension-pixel-saver
            kodi-addon-pvr-iptvsimple
            pidgin-indicator
            briss
            vassal
            scid-vs-pc
            htop-solarized
            obfilebrowser
            conkywx
            gkrellweather
            hasciicam
            xxdiff
            xdcc-git
            xcfun-git
            xbps-static-bin
            xanalyser
            mbpfan-git
            betterdiscordctl-git
            pymetar
            dockbarx-git
            vim-fugitive-git
            pkgbuilder
            ))

;;; xcursor-arch-simple
(define-public xcursor-arch-simple
  (package
    (name "xcursor-arch-simple")
    (version "1.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/xcursor-arch-simple.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan #~'(("." "share/icons/"))))
    (synopsis "simple blue Arch Linux cursor theme")
    (description "Simple blue Arch Linux cursor theme.")
    (home-page "http://gnome-look.org/content/show.php/Arch+Cursor+Theme+(simple)?content=135902")
    (license license:gpl3+)))

;;; xcursor-breeze5
(define-public xcursor-breeze5
  (package
    (name "xcursor-breeze5")
    (version "5.27.6")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/xcursor-breeze5.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan #~'(("." "share/icons/"))))
    (synopsis "KDE Plasma 5 'Breeze' cursor theme")
    (description "KDE Plasma 5 'Breeze' cursor theme.")
    (home-page "https://kde.org/plasma-desktop")
    (license license:gpl3+)))

;;; xcursor-pro-cursor-theme
(define-public xcursor-pro-cursor-theme
  (package
    (name "xcursor-pro-cursor-theme")
    (version "2.0.2")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/xcursor-pro-cursor-theme.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan #~'(("." "share/icons/"))))
    (synopsis "modern X11 Cursor Theme")
    (description "Modern X11 Cursor Theme.")
    (home-page "https://github.com/ful1e5/XCursor-pro")
    (license license:gpl3+)))

;;; xcursor-red-dot
(define-public xcursor-red-dot
  (package
    (name "xcursor-red-dot")
    (version "2016.11.11")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/xcursor-red-dot.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan #~'(("." "share/icons/"))))
    (synopsis "red Dot cursor theme")
    (description "Red Dot cursor theme.")
    (home-page "https://store.kde.org/p/999529/")
    (license license:gpl3+)))

;;; xcursor-terranove
(define-public xcursor-terranove
  (package
    (name "xcursor-terranove")
    (version "2016.11.14")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/xcursor-terranove.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan #~'(("." "share/icons/"))))
    (synopsis "terranove cursor theme")
    (description "Terranove cursor theme.")
    (home-page "https://store.kde.org/p/999987/")
    (license license:lgpl3+)))

;;; xcursor-we10xos
(define-public xcursor-we10xos
  (package
    (name "xcursor-we10xos")
    (version "20201103")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/xcursor-we10xos.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan #~'(("." "share/icons/"))))
    (synopsis "cursor theme inspired by Windows 10")
    (description "Cursor theme inspired by Windows 10.")
    (home-page "https://github.com/yeyushengfan258/We10XOS-cursors")
    (license license:gpl3+)))

;;; xcursor-alkano-default
(define-public xcursor-alkano-default
  (package
    (name "xcursor-alkano-default")
    (version "3.2.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/xcursor-alkano-default.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan #~'(("." "share/icons/"))))
    (synopsis "alkano cursor - default variant")
    (description "Alkano cursor - default variant.")
    (home-page "https://www.gnome-look.org/p/999965/")
    (license license:gpl3+)))

;;; vertex-themes-git
(define-public vertex-themes-git
  (package
    (name "vertex-themes-git")
    (version "r589.20161009")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/vertex-themes-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan #~'(("." "share/themes/"))))
    (synopsis "vertex Gtk2, Gtk3, Metacity, Xfwm, Cinnamon and GNOME Shell themes (GNOME 3.2...")
    (description "Vertex Gtk2, Gtk3, Metacity, Xfwm, Cinnamon and GNOME Shell themes (GNOME 3.22 version).")
    (home-page "http://horst3180.deviantart.com/art/Vertex-Theme-470663601")
    (license license:gpl3+)))

;;; zuki-themes-git
(define-public zuki-themes-git
  (package
    (name "zuki-themes-git")
    (version "r316.460cabb")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/zuki-themes-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan #~'(("." "share/themes/"))))
    (synopsis "A selection of themes for GTK3, gnome-shell and more")
    (description "A selection of themes for GTK3, gnome-shell and more.")
    (home-page "https://github.com/lassekongo83/zuki-themes")
    (license license:gpl3+)))

;;; zukitwo-themes-git
(define-public zukitwo-themes-git
  (package
    (name "zukitwo-themes-git")
    (version "v4.0.r2.g38920a8")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/zukitwo-themes-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan #~'(("." "share/themes/"))))
    (synopsis "A theme for GTK3, GTK2, Metacity, xfwm4, Gnome Shell and Unity - git version")
    (description "A theme for GTK3, GTK2, Metacity, xfwm4, Gnome Shell and Unity - git version.")
    (home-page "https://github.com/lassekongo83/zuki-themes")
    (license license:gpl3+)))

;;; elementary-icon-theme-git
(define-public elementary-icon-theme-git
  (package
    (name "elementary-icon-theme-git")
    (version "6.0.0.r4.g9c8e5b0f")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/elementary-icon-theme-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan #~'(("." "share/icons/"))))
    (synopsis "named, vector icons for elementary OS")
    (description "Named, vector icons for elementary OS.")
    (home-page "https://github.com/elementary/icons")
    (license license:gpl3+)))

;;; gtk-clearlooks-compact
(define-public gtk-clearlooks-compact
  (package
    (name "gtk-clearlooks-compact")
    (version "1.5")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gtk-clearlooks-compact.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "theme for Clearlooks GTK+ engine")
    (description "Theme for Clearlooks GTK+ engine.")
    (home-page "http://www.gnome-look.org/content/show.php/Clearlooks+Compact?content=69357")
    (license license:gpl3+)))

;;; x-arc-plus
(define-public x-arc-plus
  (package
    (name "x-arc-plus")
    (version "1.4.9")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/x-arc-plus.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "X-Arc-Plus Theme for GTK 3.x")
    (description "X-Arc-Plus Theme for GTK 3.x.")
    (home-page "https://www.gnome-look.org/p/1167049/")
    (license license:gpl3+)))

;;; docbook-to-man
(define-public docbook-to-man
  (package
    (name "docbook-to-man")
    (version "2.0.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/docbook-to-man.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "batch converter from DocBook SGML to nroff/troff man macros")
    (description "Batch converter from DocBook SGML to nroff/troff man macros.")
    (home-page "http://www.oasis-open.org/docbook/tools/dtm/")
    (license license:gpl3+)))

;;; mkclean
(define-public mkclean
  (package
    (name "mkclean")
    (version "0.9.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mkclean.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "clean up and optimize MKV files")
    (description "Clean up and optimize MKV files.")
    (home-page "https://www.matroska.org/downloads/mkclean.html")
    (license license:bsd-3)))

;;; outguess
(define-public outguess
  (package
    (name "outguess")
    (version "0.4")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/outguess.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A universal steganographic tool")
    (description "A universal steganographic tool.")
    (home-page "https://github.com/resurrecting-open-source-projects/outguess")
    (license license:bsd-3)))

;;; whdd
(define-public whdd
  (package
    (name "whdd")
    (version "3.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/whdd.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "diagnostic and recovery tool for block devices (near to replace MHDD for Linux)")
    (description "Diagnostic and recovery tool for block devices (near to replace MHDD for Linux).")
    (home-page "https://github.com/whdd/whdd")
    (license license:gpl3+)))

;;; bashish
(define-public bashish
  (package
    (name "bashish")
    (version "2.2.4")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/bashish.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A theme enviroment for text terminals. It can change colors, font, transparen...")
    (description "A theme enviroment for text terminals. It can change colors, font, transparency and background image on a per-application basis.")
    (home-page "http://bashish.sourceforge.net/")
    (license license:gpl3+)))

;;; sux
(define-public sux
  (package
    (name "sux")
    (version "1.0.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/sux.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "wrapper around su which will transfer your X credentials")
    (description "Wrapper around su which will transfer your X credentials.")
    (home-page "http://sourceforge.net/projects/sux/")
    (license license:gpl3+)))

;;; unzip-natspec
(define-public unzip-natspec
  (package
    (name "unzip-natspec")
    (version "6.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/unzip-natspec.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "unpacks .zip archives with non-latin filenames, using libnatspec patch from A...")
    (description "Unpacks .zip archives with non-latin filenames, using libnatspec patch from AltLinux.")
    (home-page "https://www.info-zip.org/")
    (license license:gpl3+)))

;;; powerstat-git
(define-public powerstat-git
  (package
    (name "powerstat-git")
    (version "0.02.27.r2.g72056da")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/powerstat-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A tool for measuring a laptops power usage via the battery")
    (description "A tool for measuring a laptops power usage via the battery.")
    (home-page "https://github.com/ColinIanKing/powerstat")
    (license license:gpl2)))

;;; tin
(define-public tin
  (package
    (name "tin")
    (version "2.6.5")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/tin.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A threaded NNTP and spool based UseNet newsreader")
    (description "A threaded NNTP and spool based UseNet newsreader.")
    (home-page "http://www.tin.org")
    (license license:bsd-3)))

;;; createtorrent
(define-public createtorrent
  (package
    (name "createtorrent")
    (version "1.1.4")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/createtorrent.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A small and fast command line utility for all Linux and Unix operating system...")
    (description "A small and fast command line utility for all Linux and Unix operating systems to create BitTorrent files easily.")
    (home-page "https://createtorrent.sourceforge.net")
    (license license:gpl3+)))

;;; sshmnt
(define-public sshmnt
  (package
    (name "sshmnt")
    (version "1.6.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/sshmnt.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A utility for managing multiple sshfs profiles from the commandline")
    (description "A utility for managing multiple sshfs profiles from the commandline.")
    (home-page "https://github.com/prurigro/sshmnt")
    (license license:gpl3+)))

;;; ssvnc
(define-public ssvnc
  (package
    (name "ssvnc")
    (version "1.0.29")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ssvnc.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "SSL/SSH VNC viewer")
    (description "SSL/SSH VNC viewer.")
    (home-page "http://www.karlrunge.com/x11vnc/ssvnc.html")
    (license license:gpl3+)))

;;; evrouter
(define-public evrouter
  (package
    (name "evrouter")
    (version "0.4")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/evrouter.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "an Input Event Router for Linux")
    (description "An Input Event Router for Linux.")
    (home-page "http://www.bedroomlan.org/projects/evrouter")
    (license license:gpl2+)))

;;; fim
(define-public fim
  (package
    (name "fim")
    (version "0.7.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/fim.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "FIM (Fbi IMproved) is a highly customizable and scriptable image viewer")
    (description "FIM (Fbi IMproved) is a highly customizable and scriptable image viewer.")
    (home-page "https://www.nongnu.org/fbi-improved/")
    (license license:gpl2+)))

;;; xautoclick
(define-public xautoclick
  (package
    (name "xautoclick")
    (version "0.34")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/xautoclick.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "automates repetitive mouse clicking to reduce RSI")
    (description "Automates repetitive mouse clicking to reduce RSI.")
    (home-page "https://github.com/qarkai/xautoclick")
    (license license:gpl2)))

;;; expac-git
(define-public expac-git
  (package
    (name "expac-git")
    (version "10.r1.gab14fef")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/expac-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "pacman database extraction utility")
    (description "pacman database extraction utility.")
    (home-page "https://github.com/falconindy/expac")
    (license license:expat)))

;;; ponymix-git
(define-public ponymix-git
  (package
    (name "ponymix-git")
    (version "5.r6.g242e97f")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ponymix-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "CLI PulseAudio Volume Control")
    (description "CLI PulseAudio Volume Control.")
    (home-page "http://github.com/falconindy/ponymix")
    (license license:expat)))

;;; soundcloud-dl-git
(define-public soundcloud-dl-git
  (package
    (name "soundcloud-dl-git")
    (version "2.12.1.r0.g9732b53")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/soundcloud-dl-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system python-build-system)
    (arguments (list #:tests? #f))
    (synopsis "souncloud music downloader")
    (description "Souncloud music downloader.")
    (home-page "https://github.com/flyingrub/scdl")
    (license license:gpl2)))

;;; enhanced-ctorrent
(define-public enhanced-ctorrent
  (package
    (name "enhanced-ctorrent")
    (version "dnh3.3.2")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/enhanced-ctorrent.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A BitTorrent client implemented in C++, with bugfixes and performance enhance...")
    (description "A BitTorrent client implemented in C++, with bugfixes and performance enhancements.")
    (home-page "http://www.rahul.net/dholmes/ctorrent/")
    (license license:gpl3+)))

;;; urlscan-git
(define-public urlscan-git
  (package
    (name "urlscan-git")
    (version "r207.133f77f")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/urlscan-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "replacement for urlview with html context and other improvements")
    (description "Replacement for urlview with html context and other improvements.")
    (home-page "https://github.com/firecat53/urlscan")
    (license license:gpl2)))

;;; whatmp3
(define-public whatmp3
  (package
    (name "whatmp3")
    (version "3.9")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/whatmp3.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "convert a list of directories containing FLAC files into MP3")
    (description "Convert a list of directories containing FLAC files into MP3.")
    (home-page "https://github.com/RecursiveForest/whatmp3")
    (license license:expat)))

;;; xcape-git
(define-public xcape-git
  (package
    (name "xcape-git")
    (version "1.1.r9.gf3802fc")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/xcape-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "use modifier pressed/released solo as another key/chord, e.g. CapsLock > Escape")
    (description "Use modifier pressed/released solo as another key/chord, e.g. CapsLock > Escape.")
    (home-page "https://github.com/alols/xcape")
    (license license:gpl3+)))

;;; xsettingsd-git
(define-public xsettingsd-git
  (package
    (name "xsettingsd-git")
    (version "1.0.2.r7.g86ce25f")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/xsettingsd-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "provides settings to X11 applications via the XSETTINGS specification")
    (description "Provides settings to X11 applications via the XSETTINGS specification.")
    (home-page "https://codeberg.org/derat/xsettingsd")
    (license license:bsd-3)))

;;; imgur-screenshot
(define-public imgur-screenshot
  (package
    (name "imgur-screenshot")
    (version "2.0.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/imgur-screenshot.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "take screenshot selection, upload to imgur + more cool things")
    (description "Take screenshot selection, upload to imgur + more cool things.")
    (home-page "https://github.com/jomo/imgur-screenshot")
    (license license:expat)))

;;; audiothumbnailer
(define-public audiothumbnailer
  (package
    (name "audiothumbnailer")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/audiothumbnailer.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "lightweight audio thumbnailer that can be used by file managers")
    (description "Lightweight audio thumbnailer that can be used by file managers.")
    (home-page "http://code.google.com/p/audiothumbnailer/")
    (license license:gpl2)))

;;; cmusfm
(define-public cmusfm
  (package
    (name "cmusfm")
    (version "0.5.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/cmusfm.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "last.fm scrobbler for cmus music player")
    (description "Last.fm scrobbler for cmus music player.")
    (home-page "https://github.com/Arkq/cmusfm")
    (license license:gpl3+)))

;;; mopidy-scrobbler
(define-public mopidy-scrobbler
  (package
    (name "mopidy-scrobbler")
    (version "2.0.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mopidy-scrobbler.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system python-build-system)
    (arguments (list #:tests? #f))
    (synopsis "mopidy extension for scrobbling played tracks to Last.fm")
    (description "Mopidy extension for scrobbling played tracks to Last.fm.")
    (home-page "https://github.com/mopidy/mopidy-scrobbler")
    (license license:asl2.0)))

;;; uade
(define-public uade
  (package
    (name "uade")
    (version "3.05")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/uade.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "unix Amiga Delitracker Emulator")
    (description "Unix Amiga Delitracker Emulator.")
    (home-page "https://zakalwe.fi/uade")
    (license license:gpl3+)))

;;; anoise
(define-public anoise
  (package
    (name "anoise")
    (version "0.0.36")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/anoise.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "ambient Noise Player. Relax or concentrate with a noise")
    (description "Ambient Noise Player. Relax or concentrate with a noise.")
    (home-page "https://costales.github.io/projects/anoise")
    (license license:gpl3+)))

;;; anoise-media
(define-public anoise-media
  (package
    (name "anoise-media")
    (version "0.0.17")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/anoise-media.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "ambient Noise Library. Sounds and icons for Anoise Player")
    (description "Ambient Noise Library. Sounds and icons for Anoise Player.")
    (home-page "https://launchpad.net/~costales/+archive/ubuntu/anoise")
    (license license:gpl3+)))

;;; pyradio-git
(define-public pyradio-git
  (package
    (name "pyradio-git")
    (version "0.9.3.11.28")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/pyradio-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system python-build-system)
    (arguments (list #:tests? #f))
    (synopsis "internet radio player for the command line")
    (description "Internet radio player for the command line.")
    (home-page "https://github.com/coderholic/pyradio")
    (license license:expat)))

;;; dr14-t-meter-git
(define-public dr14-t-meter-git
  (package
    (name "dr14_t.meter-git")
    (version "v1.0.15.r201.g1124015")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/dr14_t.meter-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "DR14 T.meter is a command line tool for computing the Dynamic Range of your m...")
    (description "DR14 T.meter is a command line tool for computing the Dynamic Range of your music.")
    (home-page "https://github.com/hboetes/dr14_t.meter")
    (license license:gpl3+)))

;;; qwinff
(define-public qwinff
  (package
    (name "qwinff")
    (version "0.2.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/qwinff.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A Qt4/5 GUI frontend for ffmpeg")
    (description "A Qt4/5 GUI frontend for ffmpeg.")
    (home-page "http://qwinff.github.io/downloads.html")
    (license license:gpl3+)))

;;; redshift-qt
(define-public redshift-qt
  (package
    (name "redshift-qt")
    (version "0.6")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/redshift-qt.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "redshift-gtk rewrite with C++/Qt")
    (description "redshift-gtk rewrite with C++/Qt.")
    (home-page "https://github.com/Chemrat/redshift-qt")
    (license license:expat)))

;;; volnoti
(define-public volnoti
  (package
    (name "volnoti")
    (version "0.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/volnoti.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "lightweight volume notification")
    (description "Lightweight volume notification.")
    (home-page "https://github.com/davidbrazdil/volnoti")
    (license license:gpl3+)))

;;; qjoypad
(define-public qjoypad
  (package
    (name "qjoypad")
    (version "4.3.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/qjoypad.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "program with a QT interface that converts gamepad/joystick events into key st...")
    (description "Program with a QT interface that converts gamepad/joystick events into key strokes and mouse actions in XWindows.")
    (home-page "https://github.com/panzi/qjoypad")
    (license license:gpl3+)))

;;; cozy-audiobooks
(define-public cozy-audiobooks
  (package
    (name "cozy-audiobooks")
    (version "1.3.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/cozy-audiobooks.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A modern audio book player for Linux and macOS using GTK+ 3")
    (description "A modern audio book player for Linux and macOS using GTK+ 3.")
    (home-page "https://github.com/geigi/cozy")
    (license license:gpl3+)))

;;; haroopad
(define-public haroopad
  (package
    (name "haroopad")
    (version "0.13.2")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/haroopad.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan #~'(("." "share/haroopad/"))))
    (synopsis "A markdown enabled document processor")
    (description "A markdown enabled document processor.")
    (home-page "http://pad.haroopress.com/")
    (license license:gpl3+)))

;;; sanoid
(define-public sanoid
  (package
    (name "sanoid")
    (version "2.3.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/sanoid.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "policy-driven snapshot management (sanoid), dataset sending/receiving (syncoi...")
    (description "Policy-driven snapshot management (sanoid), dataset sending/receiving (syncoid) and snapshot searching (findoid) tools for ZFS.")
    (home-page "https://github.com/jimsalterjrs/sanoid")
    (license license:gpl3+)))

;;; anamnesis
(define-public anamnesis
  (package
    (name "anamnesis")
    (version "1.0.4")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/anamnesis.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "clipboard manager that stores all clipboard history and offers an interface t...")
    (description "Clipboard manager that stores all clipboard history and offers an interface to do a full-text search.")
    (home-page "http://anamnesis.sourceforge.net/")
    (license license:gpl3+)))

;;; xplayer
(define-public xplayer
  (package
    (name "xplayer")
    (version "2.4.4")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/xplayer.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "simple media player. X-Apps Project")
    (description "Simple media player. X-Apps Project.")
    (home-page "https://github.com/linuxmint/xplayer")
    (license license:gpl3+)))

;;; grun
(define-public grun
  (package
    (name "grun")
    (version "0.9.3")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/grun.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "GTK run dialog")
    (description "GTK run dialog.")
    (home-page "https://github.com/lrgc/grun")
    (license license:gpl2)))

;;; textroom
(define-public textroom
  (package
    (name "textroom")
    (version "0.8.2")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/textroom.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "full Screen text editor heavily inspired by Q10 and JDarkRoom")
    (description "Full Screen text editor heavily inspired by Q10 and JDarkRoom.")
    (home-page "http://code.google.com/p/textroom/")
    (license license:gpl3+)))

;;; extcalc
(define-public extcalc
  (package
    (name "extcalc")
    (version "0.9.3_1")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/extcalc.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A multifunctional scientific graphic calculator")
    (description "A multifunctional scientific graphic calculator.")
    (home-page "http://extcalc-linux.sourceforge.net")
    (license license:gpl3+)))

;;; pacman4console
(define-public pacman4console
  (package
    (name "pacman4console")
    (version "1.3")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/pacman4console.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A 9 level ncurses pacman game with editor, patched not to disturb our package...")
    (description "A 9 level ncurses pacman game with editor, patched not to disturb our package manager and to have nice ghosts.")
    (home-page "http://sites.google.com/site/doctormike/pacman.html")
    (license license:gpl3+)))

;;; nethack-x11
(define-public nethack-x11
  (package
    (name "nethack-x11")
    (version "3.6.7")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/nethack-x11.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "single-player roguelike dungeon exploration game (X11 version)")
    (description "Single-player roguelike dungeon exploration game (X11 version).")
    (home-page "http://nethack.org/")
    (license license:gpl3+)))

;;; quake2
(define-public quake2
  (package
    (name "quake2")
    (version "r0.16.2")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/quake2.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "quake 2 engine. You need the retail .pak files to play")
    (description "Quake 2 engine. You need the retail .pak files to play.")
    (home-page "http://www.icculus.org/quake2/")
    (license license:gpl3+)))

;;; ardentryst-git
(define-public ardentryst-git
  (package
    (name "ardentryst-git")
    (version "r48.a135dba")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ardentryst-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "an action/RPG sidescoller with a focus on story and character development")
    (description "An action/RPG sidescoller with a focus on story and character development.")
    (home-page "https://github.com/ardentryst/ardentryst")
    (license license:cc-by-sa4.0)))

;;; ezquake
(define-public ezquake
  (package
    (name "ezquake")
    (version "3.6.6")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ezquake.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "one of the most Popular QuakeWorld clients for Linux/BSD/OSX/Win32. You need ...")
    (description "One of the most Popular QuakeWorld clients for Linux/BSD/OSX/Win32. You need the retail pak files to play.")
    (home-page "https://www.ezquake.com/")
    (license license:gpl2)))

;;; powder
(define-public powder
  (package
    (name "powder")
    (version "118")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/powder.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A graphical roguelike, originally designed for the Game Boy Advance")
    (description "A graphical roguelike, originally designed for the Game Boy Advance.")
    (home-page "http://www.zincland.com/powder/")
    (license license:gpl3+)))

;;; zsxd
(define-public zsxd
  (package
    (name "zsxd")
    (version "1.12.2")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/zsxd.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "zelda: Mystery of Solarus XD - an open-source parodic fangame")
    (description "Zelda: Mystery of Solarus XD - an open-source parodic fangame.")
    (home-page "https://gitlab.com/solarus-games/games/zsxd")
    (license license:gpl3+)))

;;; wolf
(define-public wolf
  (package
    (name "wolf")
    (version "1.41b")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/wolf.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan #~'(("." "share/wolf/"))))
    (synopsis "return to Castle Wolfenstein is a single and multiplayer first person shooter...")
    (description "Return to Castle Wolfenstein is a single and multiplayer first person shooter. You need the retail game files to play.")
    (home-page "https://web.archive.org/web/20190805003933/http://zerowing.idsoftware.com/linux/wolf/")
    (license license:gpl3+)))

;;; gitahead
(define-public gitahead
  (package
    (name "gitahead")
    (version "2.7.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gitahead.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "understand your Git history!")
    (description "Understand your Git history!.")
    (home-page "https://www.gitahead.com/")
    (license license:expat)))

;;; dbus-cpp
(define-public dbus-cpp
  (package
    (name "dbus-cpp")
    (version "5.0.3")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/dbus-cpp.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A header-only dbus-binding leveraging C++-11")
    (description "A header-only dbus-binding leveraging C++-11.")
    (home-page "https://gitlab.com/ubports/core/lib-cpp/dbus-cpp")
    (license license:lgpl3+)))

;;; process-cpp
(define-public process-cpp
  (package
    (name "process-cpp")
    (version "3.0.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/process-cpp.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A simple convenience library for handling processes in C++11")
    (description "A simple convenience library for handling processes in C++11.")
    (home-page "https://gitlab.com/ubports/core/lib-cpp/process-cpp/")
    (license license:lgpl3+)))

;;; libxspf
(define-public libxspf
  (package
    (name "libxspf")
    (version "1.2.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/libxspf.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "library that helps applications to read and write XSPF playlists")
    (description "Library that helps applications to read and write XSPF playlists.")
    (home-page "http://libspiff.sourceforge.net/")
    (license license:gpl3+)))

;;; logstalgia
(define-public logstalgia
  (package
    (name "logstalgia")
    (version "1.1.5")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/logstalgia.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "replay or stream website access logs as a retro arcade game")
    (description "replay or stream website access logs as a retro arcade game.")
    (home-page "https://github.com/acaudwell/Logstalgia")
    (license license:gpl3+)))

;;; angular-cli
(define-public angular-cli
  (package
    (name "angular-cli")
    (version "21.2.8")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/angular-cli.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan #~'(("." "lib/node_modules/"))))
    (synopsis "CLI tool for Angular")
    (description "CLI tool for Angular.")
    (home-page "https://github.com/angular/angular-cli")
    (license license:expat)))

;;; nodejs-tldr
(define-public nodejs-tldr
  (package
    (name "nodejs-tldr")
    (version "3.3.2")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/nodejs-tldr.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan #~'(("." "lib/node_modules/"))))
    (synopsis "simplified and community-driven man pages")
    (description "Simplified and community-driven man pages.")
    (home-page "https://github.com/tldr-pages/tldr")
    (license license:expat)))

;;; xbindkeys-git
(define-public xbindkeys-git
  (package
    (name "xbindkeys-git")
    (version "v1.8.7.r1.g75909d9")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/xbindkeys-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "xbindkeys is a program that allows you to launch shell commands with your key...")
    (description "xbindkeys is a program that allows you to launch shell commands with your keyboard or your mouse under X Windows.")
    (home-page "https://www.nongnu.org/xbindkeys/xbindkeys.html")
    (license license:gpl2)))

;;; gimp-plugin-bimp
(define-public gimp-plugin-bimp
  (package
    (name "gimp-plugin-bimp")
    (version "2.6")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gimp-plugin-bimp.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "batch Image Manipulation Plugin for GIMP")
    (description "Batch Image Manipulation Plugin for GIMP.")
    (home-page "http://www.alessandrofrancesconi.it/projects/bimp/")
    (license license:gpl3+)))

;;; gimp-plugin-refocusit
(define-public gimp-plugin-refocusit
  (package
    (name "gimp-plugin-refocusit")
    (version "2.0.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gimp-plugin-refocusit.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "iterative refocus plug-in for GIMP")
    (description "Iterative refocus plug-in for GIMP.")
    (home-page "http://refocus-it.sourceforge.net/")
    (license license:gpl3+)))

;;; urxvt-fullscreen
(define-public urxvt-fullscreen
  (package
    (name "urxvt-fullscreen")
    (version "1")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/urxvt-fullscreen.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan #~'(("." "lib/urxvt/perl/"))))
    (synopsis "script to switch fullscreen and above-other-windows on urxvt")
    (description "script to switch fullscreen and above-other-windows on urxvt.")
    (home-page "http://wiki.archlinux.org/index.php/Rxvt-unicode")
    (license license:gpl3+)))

;;; urxvt-font-size-git
(define-public urxvt-font-size-git
  (package
    (name "urxvt-font-size-git")
    (version "r32.0984499")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/urxvt-font-size-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan #~'(("." "lib/urxvt/perl/"))))
    (synopsis "on-the-fly URxvt font size adjustments")
    (description "On-the-fly URxvt font size adjustments.")
    (home-page "https://github.com/majutsushi/urxvt-font-size")
    (license license:expat)))

;;; vim-nginx
(define-public vim-nginx
  (package
    (name "vim-nginx")
    (version "1.6.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/vim-nginx.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan #~'(("." "share/vim/vimfiles/"))))
    (synopsis "nginx syntax highlight for vim (now included in extra/nginx)")
    (description "Nginx syntax highlight for vim (now included in extra/nginx).")
    (home-page "http://nginx.org")
    (license license:gpl3+)))

;;; gnome-shell-extension-pixel-saver
(define-public gnome-shell-extension-pixel-saver
  (package
    (name "gnome-shell-extension-pixel-saver")
    (version "1.32")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gnome-shell-extension-pixel-saver.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan #~'(("." "share/gnome-shell/extensions/"))))
    (synopsis "saves pixels by fusing activity bar and title bar in a natural way")
    (description "Saves pixels by fusing activity bar and title bar in a natural way.")
    (home-page "https://github.com/pixel-saver/pixel-saver")
    (license license:expat)))

;;; kodi-addon-pvr-iptvsimple
(define-public kodi-addon-pvr-iptvsimple
  (package
    (name "kodi-addon-pvr-iptvsimple")
    (version "21.11.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/kodi-addon-pvr-iptvsimple.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "IPTV Simple PVR client addon for Kodi")
    (description "IPTV Simple PVR client addon for Kodi.")
    (home-page "https://github.com/kodi-pvr/pvr.iptvsimple")
    (license license:gpl3+)))

;;; pidgin-indicator
(define-public pidgin-indicator
  (package
    (name "pidgin-indicator")
    (version "1.0.2")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/pidgin-indicator.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "appIndicator/KStatusNotifierItem Plugin for Pidgin")
    (description "AppIndicator/KStatusNotifierItem Plugin for Pidgin.")
    (home-page "https://github.com/philipl/pidgin-indicator")
    (license license:gpl2+)))

;;; briss
(define-public briss
  (package
    (name "briss")
    (version "0.9")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/briss.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan #~'(("." "share/java/"))))
    (synopsis "java tool to crop pages of PDF documents to one or more regions selected with...")
    (description "Java tool to crop pages of PDF documents to one or more regions selected with a GUI.")
    (home-page "http://sourceforge.net/projects/briss/")
    (license license:gpl3+)))

;;; vassal
(define-public vassal
  (package
    (name "vassal")
    (version "3.7.19")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/vassal.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan #~'(("." "share/java/"))))
    (synopsis "game engine for building and playing online adaptations of board games and ca...")
    (description "Game engine for building and playing online adaptations of board games and card games.")
    (home-page "http://www.vassalengine.org/")
    (license license:lgpl3+)))

;;; scid-vs-pc
(define-public scid-vs-pc
  (package
    (name "scid_vs_pc")
    (version "4.26")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/scid_vs_pc.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "shane's Chess Information Database")
    (description "Shane's Chess Information Database.")
    (home-page "http://scidvspc.sourceforge.net/")
    (license license:gpl2+)))

;;; htop-solarized
(define-public htop-solarized
  (package
    (name "htop-solarized")
    (version "3.4.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/htop-solarized.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "interactive process viewer with solarized colorscheme patch")
    (description "Interactive process viewer with solarized colorscheme patch.")
    (home-page "https://htop.dev/")
    (license license:gpl3+)))

;;; obfilebrowser
(define-public obfilebrowser
  (package
    (name "obfilebrowser")
    (version "2021")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/obfilebrowser.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "an Openbox pipe menu application and file browser")
    (description "An Openbox pipe menu application and file browser.")
    (home-page "https://xyne.dev/projects/obfilebrowser")
    (license license:gpl3+)))

;;; conkywx
(define-public conkywx
  (package
    (name "conkywx")
    (version "200730")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/conkywx.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "to display weather from multiple sources using conky")
    (description "To display weather from multiple sources using conky.")
    (home-page "https://bitbucket.org/plikhari/conkywx_pub/downloads")
    (license license:gpl3+)))

;;; gkrellweather
(define-public gkrellweather
  (package
    (name "gkrellweather")
    (version "2.0.8")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gkrellweather.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A weather monitor plugin for gkrellm2")
    (description "A weather monitor plugin for gkrellm2.")
    (home-page "http://gkrellm.srcbox.net/")
    (license license:gpl3+)))

;;; hasciicam
(define-public hasciicam
  (package
    (name "hasciicam")
    (version "1.3")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/hasciicam.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "renders video input as ascii (to the terminal, textfile, or live webpage)")
    (description "Renders video input as ascii (to the terminal, textfile, or live webpage).")
    (home-page "http://ascii.dyne.org/")
    (license license:gpl3)))

;;; xxdiff
(define-public xxdiff
  (package
    (name "xxdiff")
    (version "5.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/xxdiff.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A graphical browser for file and directory differences")
    (description "A graphical browser for file and directory differences.")
    (home-page "https://github.com/blais/xxdiff")
    (license license:gpl2)))

;;; xdcc-git
(define-public xdcc-git
  (package
    (name "xdcc-git")
    (version "0.3.1.r1.g3a5ea97")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/xdcc-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "xdcc file downloader")
    (description "xdcc file downloader.")
    (home-page "https://git.sr.ht/~dax/xdcc")
    (license license:isc)))

;;; xcfun-git
(define-public xcfun-git
  (package
    (name "xcfun-git")
    (version "2.1.1.r1.gf87ca0e")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/xcfun-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "exchange-Correlation functionals with arbitrary order derivatives")
    (description "Exchange-Correlation functionals with arbitrary order derivatives.")
    (home-page "http://dftlibs.org/xcfun/")
    (license license:gpl3+)))

;;; xbps-static-bin
(define-public xbps-static-bin
  (package
    (name "xbps-static-bin")
    (version "0.59.2_1")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/xbps-static-bin.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan #~'(("." "share/xbps-static-bin/"))))
    (synopsis "the X Binary Package System (XBPS) -- Static Binaries")
    (description "The X Binary Package System (XBPS) -- Static Binaries.")
    (home-page "https://github.com/void-linux/xbps")
    (license license:bsd-3)))

;;; xanalyser
(define-public xanalyser
  (package
    (name "xanalyser")
    (version "1.32")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/xanalyser.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A program to analyse a stereo audio signal")
    (description "A program to analyse a stereo audio signal.")
    (home-page "http://arvin.schnell-web.net/xanalyser")
    (license license:gpl3+)))

;;; mbpfan-git
(define-public mbpfan-git
  (package
    (name "mbpfan-git")
    (version "2.4.0.r3.g0cb3c5a6")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mbpfan-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A simple daemon to control fan speed on all MacBook/MacBook Pros")
    (description "A simple daemon to control fan speed on all MacBook/MacBook Pros.")
    (home-page "https://github.com/linux-on-mac/mbpfan")
    (license license:gpl3+)))

;;; betterdiscordctl-git
(define-public betterdiscordctl-git
  (package
    (name "betterdiscordctl-git")
    (version "2.0.0.r0.g57f483a")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/betterdiscordctl-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A utility for managing BetterDiscord on Linux")
    (description "A utility for managing BetterDiscord on Linux.")
    (home-page "https://github.com/bb010g/betterdiscordctl")
    (license license:expat)))

;;; pymetar
(define-public pymetar
  (package
    (name "pymetar")
    (version "1.4")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/pymetar.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system python-build-system)
    (arguments (list #:tests? #f))
    (synopsis "downloads the weather report for a given station ID and decodes it")
    (description "Downloads the weather report for a given station ID and decodes it.")
    (home-page "https://www.schwarzvogel.de/software/pymetar/")
    (license license:gpl2)))

;;; dockbarx-git
(define-public dockbarx-git
  (package
    (name "dockbarx-git")
    (version "1.0beta4+0+g3c5e6b3")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/dockbarx-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "taskBar with grouping and group manipulation")
    (description "TaskBar with grouping and group manipulation.")
    (home-page "https://github.com/xuzhen/dockbarx")
    (license license:gpl3+)))

;;; vim-fugitive-git
(define-public vim-fugitive-git
  (package
    (name "vim-fugitive-git")
    (version "3.4.115.g142a0dc")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/vim-fugitive-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan #~'(("." "share/vim/vimfiles/"))))
    (synopsis "git wrapper so awesome, it should be illegal")
    (description "Git wrapper so awesome, it should be illegal.")
    (home-page "https://github.com/tpope/vim-fugitive")
    (license license:vim)))

;;; pkgbuilder
(define-public pkgbuilder
  (package
    (name "pkgbuilder")
    (version "4.3.2")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/pkgbuilder.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system python-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A Python AUR helper/library")
    (description "A Python AUR helper/library.")
    (home-page "https://github.com/Kwpolska/pkgbuilder")
    (license license:bsd-3)))
