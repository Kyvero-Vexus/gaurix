;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260427e
;;; Resolves 100 packages from queue (100 recipes, 0 blocked).
;;;
;;; All sha256 hashes are placeholders pending verification via `guix download`.

(define-module (gaurix packages recipe-resolver-260427e)
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
  #:use-module (guix build-system node)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:export (

            4nec2-bin
            angie-src
            arnis
            arrowdl
            bazarr
            blender-breezedark-theme-git
            blipnblup-git
            boost183
            brim
            buildit-git
            calibre-plugin-dedrm
            celeste64-bin
            configurator
            crapto1
            ctf-ynetd
            dcmfx
            defold-bin
            deja-file
            dogecoin-qt
            drawio-desktop-git
            dsnote-git
            dunst-timer
            encore
            fcd-bin
            feroxbuster-bin
            file-share-bin
            footswitch-git
            fortune-mod-metalfairytale-git
            gdpm-git
            ghidra-extension-kaiju-bin
            ghidra-fidb-repo
            gnome-shell-extension-useless-gaps-git
            golines
            i3ipc-glib-git
            katharsis
            kd-bin
            keepmenu
            l5p-keyboard-rgb-bin
            lampa
            leetgo-bin
            lgeneral
            libatrac9-git
            libfprint-fpcmoh-git
            lightnovel-crawler-bin
            lime3ds-appimage
            livi
            magellan-bin
            maia-gtk-theme
            mcfetch-git
            memos-git
            mmtui-bin
            mpris-miniplayer
            myoffice-standard-home-edition-bin
            netease-cloud-music-gtk4
            netexec
            nginx_passwd
            nsproxy-git
            onetagger-bin
            openbgpd
            openglide-git
            openmsx
            openttd-git
            papirus-maia-icon-theme-git
            parrot-bin
            pince-git
            playwright
            plymouth-theme-arch-charge-big
            python-ansi
            python-bdfr
            python-comicfn2dict
            python-flake8-rst-docstrings
            python-pagelabels
            python-reader
            python-restructuredtext_lint
            python-settngs
            qqmusic-electron
            rn-bin
            rogauracore-git
            rosepad
            sfbrename-cli
            sfbrename-gtk
            sonycardscanner
            sqlfuse-git
            squiid
            swaylock-clock
            sysbox-ce-bin
            tageditor-qt6
            termpdf.py-git
            termsonic-git
            tiny-rdm
            treesheets-git
            tsukimi-bin
            wmbusmeters
            woff2-suite
            xcursor-chicago95-git
            xfce-superkey-git
            xournalpp-git
            xremap-gnome-bin
            xsnow-bin
            ydpdict
            ))

;;; Nonfree/proprietary license placeholder for Gaurix channel
(define license:nonfree
  ((@@ (guix licenses) license) "Nonfree"
    "https://spdx.org/licenses/"
    "Proprietary or custom license; see upstream for terms."))

;;; xournalpp-git --- handwriting notetaking software with PDF annotation support
(define-public xournalpp-git
  (package
    (name "xournalpp-git")
    (version "1.2.8.r544.g3aeb44b7b")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/xournalpp/xournalpp/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "handwriting notetaking software with PDF annotation support")
    (description "Xournal++ is a handwriting notetaking software with PDF annotation
support.  Supports pen input like Wacom tablets.")
    (home-page "https://github.com/xournalpp/xournalpp")
    (license license:gpl2)))

;;; openmsx --- the MSX emulator that aims for perfection
(define-public openmsx
  (package
    (name "openmsx")
    (version "21.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/openMSX/openMSX/releases/download/RELEASE_"
                                  (string-replace-substring version "." "_")
                                  "/openmsx-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "the MSX emulator that aims for perfection")
    (description "OpenMSX is an MSX emulator that aims for perfection.")
    (home-page "http://openmsx.org/")
    (license license:gpl2)))

;;; tsukimi-bin --- a simple third-party Jellyfin client for Linux
(define-public tsukimi-bin
  (package
    (name "tsukimi-bin")
    (version "0.21.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/tsukinaha/tsukimi/releases/download/v"
                                  version "/tsukimi-x86_64-linux.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "a simple third-party Jellyfin client for Linux")
    (description "Tsukimi is a simple third-party Jellyfin client for Linux.")
    (home-page "https://github.com/tsukinaha/tsukimi")
    (license license:gpl3+)))

;;; dsnote-git --- note taking with offline speech-to-text and translation
(define-public dsnote-git
  (package
    (name "dsnote-git")
    (version "r1586.acec0c1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/dsnote-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "note taking with offline speech-to-text and translation")
    (description "Note taking, reading and translating with offline Speech to Text,
Text to Speech and Machine Translation.")
    (home-page "https://github.com/mkiol/dsnote")
    (license license:mpl2.0)))

;;; treesheets-git --- a hierarchical spreadsheet and organizer
(define-public treesheets-git
  (package
    (name "treesheets-git")
    (version "r1055.8b58c10")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/treesheets-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "a hierarchical spreadsheet and organizer")
    (description "A hierarchical spreadsheet as a replacement for spreadsheets, mind
mappers, outliners, PIMs, text editors and small databases.")
    (home-page "https://strlen.com/treesheets/")
    (license license:zlib)))

;;; encore --- a lightweight TUI music player
(define-public encore
  (package
    (name "encore")
    (version "0.2.0.canary.4")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/WilliamAnimate/encore/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "a lightweight TUI music player")
    (description "A lightweight TUI music player written in Rust.")
    (home-page "https://github.com/WilliamAnimate/encore")
    (license license:expat)))

;;; tageditor-qt6 --- tag editor with Qt6 GUI supporting MP4, ID3, Vorbis, FLAC
(define-public tageditor-qt6
  (package
    (name "tageditor-qt6")
    (version "3.9.9")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/Martchus/tageditor/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "tag editor with Qt6 GUI supporting MP4, ID3, Vorbis, FLAC")
    (description "A tag editor with Qt GUI and command-line interface supporting
MP4/M4A/AAC (iTunes), ID3, Vorbis, Opus, FLAC and Matroska (using Qt 6).")
    (home-page "https://github.com/Martchus/tageditor")
    (license license:gpl2+)))

;;; nginx_passwd --- basic auth password file manager for nginx
(define-public nginx_passwd
  (package
    (name "nginx_passwd")
    (version "3.3.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/gene-git/nginx_passwd/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "basic auth password file manager for nginx")
    (description "Basic Auth Password File Manager for nginx.")
    (home-page "https://github.com/gene-git/nginx_passwd")
    (license license:gpl2+)))

;;; memos-git --- a privacy-first lightweight note-taking service
(define-public memos-git
  (package
    (name "memos-git")
    (version "0.23.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/usememos/memos/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments (list #:tests? #f
                     #:import-path "github.com/usememos/memos"))
    (supported-systems '("x86_64-linux"))
    (synopsis "a privacy-first lightweight note-taking service")
    (description "A privacy-first, lightweight note-taking service.  Easily capture
and share your great thoughts.")
    (home-page "https://github.com/usememos/memos")
    (license license:expat)))

;;; xcursor-chicago95-git --- Windows 95 inspired cursors
(define-public xcursor-chicago95-git
  (package
    (name "xcursor-chicago95-git")
    (version "3.0.1.r107.g9d9f9bc")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/xcursor-chicago95-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "Windows 95 inspired cursors")
    (description "Windows 95 inspired cursors from the Chicago95 theme project.")
    (home-page "https://github.com/grassmunk/Chicago95")
    (license license:gpl3+)))

;;; python-restructuredtext_lint --- reStructuredText linter
(define-public python-restructuredtext_lint
  (package
    (name "python-restructuredtext_lint")
    (version "1.4.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/twolfson/restructuredtext-lint/archive/refs/tags/" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "reStructuredText linter")
    (description "reStructuredText linter.")
    (home-page "https://github.com/twolfson/restructuredtext-lint")
    (license license:public-domain)))

;;; bazarr --- subtitle management and download automation
(define-public bazarr
  (package
    (name "bazarr")
    (version "1.5.6")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/morpheus65535/bazarr/releases/download/v" version "/bazarr.zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "subtitle management and download automation")
    (description "Subtitle management and download automation for Sonarr and Radarr.")
    (home-page "https://www.bazarr.media")
    (license license:gpl3+)))

;;; xremap-gnome-bin --- dynamic key remapper for X11 and Wayland (GNOME)
(define-public xremap-gnome-bin
  (package
    (name "xremap-gnome-bin")
    (version "0.15.3")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/k0kubun/xremap/releases/download/v"
                                  version "/xremap-linux-x86_64-gnome.zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "dynamic key remapper for X11 and Wayland (GNOME)")
    (description "Dynamic key remapper for X11 and Wayland (GNOME Wayland version).")
    (home-page "https://github.com/k0kubun/xremap")
    (license license:expat)))

;;; libatrac9-git --- library for decoding audio in Sony's ATRAC9 format
(define-public libatrac9-git
  (package
    (name "libatrac9-git")
    (version "r19.6a9e00f")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/libatrac9-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "library for decoding audio in Sony's ATRAC9 format")
    (description "A library for decoding audio in Sony's ATRAC9 format.")
    (home-page "https://github.com/Thealexbarney/LibAtrac9")
    (license license:expat)))

;;; golines --- a golang formatter that fixes long lines
(define-public golines
  (package
    (name "golines")
    (version "0.12.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/segmentio/golines/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments (list #:tests? #f
                     #:import-path "github.com/segmentio/golines"))
    (supported-systems '("x86_64-linux"))
    (synopsis "a golang formatter that fixes long lines")
    (description "A golang formatter that fixes long lines.")
    (home-page "https://github.com/segmentio/golines")
    (license license:expat)))

;;; mmtui-bin --- terminal user interface disk mount manager
(define-public mmtui-bin
  (package
    (name "mmtui-bin")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/SL-RU/mmtui/releases/download/v" version
                                  "/mmtui-x86_64-unknown-linux-gnu"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "terminal user interface disk mount manager")
    (description "Terminal User Interface disk mount manager for TUI file managers.")
    (home-page "https://github.com/SL-RU/mmtui")
    (license license:expat)))

;;; netease-cloud-music-gtk4 --- Netease Cloud Music player based on Rust + GTK4
(define-public netease-cloud-music-gtk4
  (package
    (name "netease-cloud-music-gtk4")
    (version "2.5.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/gmg137/netease-cloud-music-gtk/archive/refs/tags/"
                                  version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "Netease Cloud Music player based on Rust + GTK4")
    (description "Netease Cloud Music player based on Rust + GTK4 for Linux.")
    (home-page "https://github.com/gmg137/netease-cloud-music-gtk")
    (license license:gpl3+)))

;;; openglide-git --- Glide wrapper useful for DOSBox with Glide support
(define-public openglide-git
  (package
    (name "openglide-git")
    (version "last.cvs.r50.g1ecc60a")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/openglide-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "Glide wrapper useful for DOSBox with Glide support")
    (description "Glide wrapper, useful for DOSBox with Glide support.")
    (home-page "https://github.com/voyageur/openglide")
    (license license:gpl2)))

;;; footswitch-git --- command-line utility for PCsensor foot switch
(define-public footswitch-git
  (package
    (name "footswitch-git")
    (version "11.f2bfaa2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/footswitch-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "command-line utility for PCsensor foot switch")
    (description "Command-line utility for PCsensor foot switch.")
    (home-page "https://github.com/rgerganov/footswitch")
    (license license:gpl3+)))

;;; wmbusmeters --- read wired or wireless mbus protocol for utility meters
(define-public wmbusmeters
  (package
    (name "wmbusmeters")
    (version "2.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/wmbusmeters/wmbusmeters/archive/refs/tags/"
                                  version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "read wired or wireless mbus protocol for utility meters")
    (description "Read the wired or wireless mbus protocol to acquire utility meter
readings.")
    (home-page "https://github.com/wmbusmeters/wmbusmeters")
    (license license:gpl3+)))

;;; netexec --- a swiss army knife for pentesting Windows/AD environments
(define-public netexec
  (package
    (name "netexec")
    (version "1.5.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/Pennyw0rth/NetExec/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "a swiss army knife for pentesting Windows/AD environments")
    (description "A swiss army knife for pentesting Windows/Active Directory
environments.")
    (home-page "https://github.com/Pennyw0rth/NetExec")
    (license license:bsd-2)))

;;; blender-breezedark-theme-git --- Blender theme mimicking Breeze Dark KDE
(define-public blender-breezedark-theme-git
  (package
    (name "blender-breezedark-theme-git")
    (version "r19.0e49f3d")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/blender-breezedark-theme-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "Blender theme mimicking Breeze Dark KDE")
    (description "A Blender theme that mimics the color scheme of the Breeze Dark KDE
theme.")
    (home-page "https://codeberg.org/Nesakko/blender-breezedark-theme")
    (license license:public-domain)))

;;; libfprint-fpcmoh-git --- libfprint with proprietary FPC match-on-host driver
(define-public libfprint-fpcmoh-git
  (package
    (name "libfprint-fpcmoh-git")
    (version "1.94.6")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/libfprint-fpcmoh-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "libfprint with proprietary FPC match-on-host driver")
    (description "libfprint with proprietary FPC match on host device 10a5:9800 driver.")
    (home-page "https://fprint.freedesktop.org/")
    (license license:lgpl2.1+)))

;;; lgeneral --- a turn-based strategy engine inspired by Panzer General
(define-public lgeneral
  (package
    (name "lgeneral")
    (version "1.4.4")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://sourceforge.net/projects/lgeneral/files/lgeneral/lgeneral-"
                                  version "/lgeneral-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "a turn-based strategy engine inspired by Panzer General")
    (description "A turn-based strategy engine heavily inspired by Panzer General.")
    (home-page "https://lgames.sourceforge.net/LGeneral/")
    (license license:gpl2)))

;;; lime3ds-appimage --- experimental Nintendo 3DS emulator (AppImage)
(define-public lime3ds-appimage
  (package
    (name "lime3ds-appimage")
    (version "2119.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/Lime3DS/Lime3DS/releases/download/"
                                  version "/lime3ds-" version "-linux-appimage.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "experimental Nintendo 3DS emulator (AppImage)")
    (description "An experimental open-source Nintendo 3DS emulator/debugger,
AppImage version.")
    (home-page "https://lime3ds.github.io/")
    (license license:gpl2)))

;;; calibre-plugin-dedrm --- DeDRM tools for ebooks (Calibre plugin)
(define-public calibre-plugin-dedrm
  (package
    (name "calibre-plugin-dedrm")
    (version "10.0.3")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/noDRM/DeDRM_tools/releases/download/v"
                                  version "/DeDRM_tools-" version ".zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "DeDRM tools for ebooks (Calibre plugin)")
    (description "DeDRM tools for ebooks - Calibre plugin.")
    (home-page "https://github.com/noDRM/DeDRM_tools/")
    (license license:gpl3)))

;;; pince-git --- a Linux reverse engineering tool inspired by Cheat Engine
(define-public pince-git
  (package
    (name "pince-git")
    (version "r1680.668fc15")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/pince-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "a Linux reverse engineering tool inspired by Cheat Engine")
    (description "A Linux reverse engineering tool inspired by Cheat Engine.")
    (home-page "https://github.com/korcankaraokcu/PINCE")
    (license license:gpl3+)))

;;; myoffice-standard-home-edition-bin --- office applications for text and spreadsheets
(define-public myoffice-standard-home-edition-bin
  (package
    (name "myoffice-standard-home-edition-bin")
    (version "3.5.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/myoffice-standard-home-edition-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "office applications for text and spreadsheets (home edition)")
    (description "A set of office applications for creating text and spreadsheet
documents.  Home edition.")
    (home-page "https://myoffice.ru/products/standard-home-edition/")
    (license license:nonfree)))

;;; feroxbuster-bin --- fast recursive content discovery tool written in Rust
(define-public feroxbuster-bin
  (package
    (name "feroxbuster-bin")
    (version "2.13.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/epi052/feroxbuster/releases/download/v"
                                  version "/x86_64-linux-feroxbuster.zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "fast recursive content discovery tool written in Rust")
    (description "A fast, simple, recursive content discovery tool written in Rust.")
    (home-page "https://github.com/epi052/feroxbuster")
    (license license:expat)))

;;; playwright --- Node.js library to automate Chromium, Firefox and WebKit
(define-public playwright
  (package
    (name "playwright")
    (version "1.59.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nicedoc/playwright/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "Node.js library to automate Chromium, Firefox and WebKit")
    (description "Node.js library to automate Chromium, Firefox and WebKit with a
single API.")
    (home-page "https://playwright.dev")
    (license license:asl2.0)))

;;; l5p-keyboard-rgb-bin --- RGB keyboard control for Legion 5 Pro laptops
(define-public l5p-keyboard-rgb-bin
  (package
    (name "l5p-keyboard-rgb-bin")
    (version "0.20.7")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/4JX/L5P-Keyboard-RGB/releases/download/v"
                                  version "/l5p-keyboard-rgb-x86_64-unknown-linux-gnu.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "RGB keyboard control for Legion 5 Pro laptops")
    (description "RGB Keyboard control for Legion 5 (Pro) 2020-2022 and Ideapad
Gaming 3 2021.")
    (home-page "https://github.com/4JX/L5P-Keyboard-RGB")
    (license license:gpl3+)))

;;; kd-bin --- a crystal clean command-line dictionary
(define-public kd-bin
  (package
    (name "kd-bin")
    (version "0.0.14")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/Karmenzind/kd/releases/download/v" version
                                  "/kd-linux-amd64"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "a crystal clean command-line dictionary")
    (description "A crystal clean command-line dictionary.")
    (home-page "https://github.com/Karmenzind/kd")
    (license license:expat)))

;;; onetagger-bin --- the ultimate cross-platform tagger for DJs
(define-public onetagger-bin
  (package
    (name "onetagger-bin")
    (version "1.7.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/Marekkon5/onetagger/releases/download/"
                                  version "/OneTagger-linux.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "the ultimate cross-platform tagger for DJs")
    (description "The ultimate cross-platform tagger for DJs.")
    (home-page "https://onetagger.github.io/")
    (license license:gpl3)))

;;; mcfetch-git --- lightweight fetching program with color options
(define-public mcfetch-git
  (package
    (name "mcfetch-git")
    (version "0.1.0.r18.gecd4d11")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mcfetch-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "lightweight fetching program with color options")
    (description "Lightweight fetching program with color options.")
    (home-page "https://github.com/dybdeskarphet/mcfetch")
    (license license:gpl3+)))

;;; crapto1 --- utilities to extract keys from Mifare authentication nonces
(define-public crapto1
  (package
    (name "crapto1")
    (version "0.1.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/li0ard/crapto1/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "utilities to extract keys from Mifare authentication nonces")
    (description "Utilities extract keys from nonces collected during the
authentication process.")
    (home-page "https://github.com/li0ard/crapto1/")
    (license license:gpl3)))

;;; plymouth-theme-arch-charge-big --- Plymouth theme featuring the Arch Linux logo
(define-public plymouth-theme-arch-charge-big
  (package
    (name "plymouth-theme-arch-charge-big")
    (version "20190914")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/plymouth-theme-arch-charge-big.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "Plymouth theme featuring the Arch Linux logo")
    (description "A Plymouth theme based on Fedora's Charge theme, but featuring the
Arch Linux logo.  This version has a larger logo than the regular variant.")
    (home-page "http://development.sjmcdougall.com/plymouth-themes/arch-charge")
    (license license:gpl3+)))

;;; i3ipc-glib-git --- a C interface library to i3wm
(define-public i3ipc-glib-git
  (package
    (name "i3ipc-glib-git")
    (version "r174.1610403323.00790b4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/i3ipc-glib-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "a C interface library to i3wm")
    (description "A C interface library to i3wm.")
    (home-page "https://github.com/acrisci/i3ipc-glib")
    (license license:gpl3)))

;;; maia-gtk-theme --- Maia GTK theme
(define-public maia-gtk-theme
  (package
    (name "maia-gtk-theme")
    (version "9f2c31c")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/maia-gtk-theme.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "Maia GTK theme")
    (description "Maia GTK theme.")
    (home-page "https://gitlab.manjaro.org/artwork/themes/maia-gtk")
    (license license:lgpl2.1+)))

;;; papirus-maia-icon-theme-git --- Manjaro variation of Papirus icon theme
(define-public papirus-maia-icon-theme-git
  (package
    (name "papirus-maia-icon-theme-git")
    (version "20200417.7338bf0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/papirus-maia-icon-theme-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "Manjaro variation of Papirus icon theme")
    (description "Manjaro variation of Papirus icon theme (git version).")
    (home-page "https://github.com/Ste74/papirus-maia-icon-theme")
    (license license:lgpl3+)))

;;; xsnow-bin --- let it snow on your desktop
(define-public xsnow-bin
  (package
    (name "xsnow-bin")
    (version "3.8.6")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.ratrabbit.nl/downloads/xsnow/xsnow-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "let it snow on your desktop")
    (description "Let it snow on your desktop.")
    (home-page "https://www.ratrabbit.nl/ratrabbit/xsnow/")
    (license license:gpl3)))

;;; fortune-mod-metalfairytale-git --- metal fairy tale fortune cookies
(define-public fortune-mod-metalfairytale-git
  (package
    (name "fortune-mod-metalfairytale-git")
    (version "39474bb")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/fortune-mod-metalfairytale-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "metal fairy tale fortune cookies")
    (description "A fairy tale whose hero belongs to one of the many Metal
sub-genres, served in the marvelous form of fortune cookies.")
    (home-page "https://github.com/virtualtam/fortune-metal-fairy-tale")
    (license license:public-domain)))

;;; termpdf.py-git --- graphical PDF reader that works inside the kitty terminal
(define-public termpdf.py-git
  (package
    (name "termpdf.py-git")
    (version "r0.ge7bd082")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/termpdf.py-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "graphical PDF reader that works inside the kitty terminal")
    (description "A graphical PDF (and epub, cbz, ...) reader that works inside the
kitty terminal.")
    (home-page "https://github.com/dsanson/termpdf.py")
    (license license:expat)))

;;; python-pagelabels --- Python library to manipulate PDF page numbers and labels
(define-public python-pagelabels
  (package
    (name "python-pagelabels")
    (version "1.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/lovasoa/pagelabels-py/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "Python library to manipulate PDF page numbers and labels")
    (description "Python library to manipulate PDF page numbers and labels.")
    (home-page "https://github.com/lovasoa/pagelabels-py")
    (license license:gpl3)))

;;; python-bdfr --- bulk downloader for Reddit
(define-public python-bdfr
  (package
    (name "python-bdfr")
    (version "2.6.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/aliparlakci/bulk-downloader-for-reddit/archive/refs/tags/v"
                                  version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "bulk downloader for Reddit")
    (description "Bulk downloader for Reddit.")
    (home-page "https://github.com/aliparlakci/bulk-downloader-for-reddit")
    (license license:gpl3)))

;;; arrowdl --- mass download manager with beautiful web-based GUI
(define-public arrowdl
  (package
    (name "arrowdl")
    (version "4.2.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nicedoc/arrowdl/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "mass download manager with beautiful web-based GUI")
    (description "A mass download manager that helps you to select, organize,
prioritize and run your downloads in parallel.")
    (home-page "https://www.arrow-dl.com")
    (license license:lgpl3+)))

;;; angie-src --- source code of Angie web server (nginx fork)
(define-public angie-src
  (package
    (name "angie-src")
    (version "1.11.4")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/webserver-llc/angie/archive/refs/tags/"
                                  version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "source code of Angie web server (nginx fork)")
    (description "Source code of Angie web server, useful for building modules.")
    (home-page "https://github.com/webserver-llc/angie")
    (license license:bsd-2)))

;;; rogauracore-git --- RGB keyboard control for Asus ROG laptops
(define-public rogauracore-git
  (package
    (name "rogauracore-git")
    (version "1.6.2.r0.g5f68958")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/rogauracore-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "RGB keyboard control for Asus ROG laptops")
    (description "RGB keyboard control for Asus ROG laptops.")
    (home-page "https://github.com/Syndelis/rogauracore")
    (license license:expat)))

;;; openttd-git --- engine for running Transport Tycoon Deluxe (latest git)
(define-public openttd-git
  (package
    (name "openttd-git")
    (version "26406.c482f05616")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/openttd-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "engine for running Transport Tycoon Deluxe (latest git)")
    (description "An engine for running Transport Tycoon Deluxe (latest git build).")
    (home-page "http://openttd.org")
    (license license:gpl2)))

;;; ghidra-extension-kaiju-bin --- CERT Kaiju binary analysis for Ghidra
(define-public ghidra-extension-kaiju-bin
  (package
    (name "ghidra-extension-kaiju-bin")
    (version "260309_12.0.4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ghidra-extension-kaiju-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "CERT Kaiju binary analysis for Ghidra")
    (description "CERT Kaiju binary analysis improvements for Ghidra (OOAnalyzer,
CERT function hashing, GhiHorn).")
    (home-page "https://github.com/CERTCC/kaiju")
    (license license:bsd-3)))

;;; ydpdict --- interface for Polish-English Collins Dictionary
(define-public ydpdict
  (package
    (name "ydpdict")
    (version "1.0.5")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/wojtekka/ydpdict/archive/refs/tags/"
                                  version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "interface for Polish-English Collins Dictionary")
    (description "Interface for Polish-English Collins Dictionary.")
    (home-page "https://github.com/wojtekka/ydpdict")
    (license license:gpl2)))

;;; xfce-superkey-git --- open the whisker menu in XFCE using the Super key
(define-public xfce-superkey-git
  (package
    (name "xfce-superkey-git")
    (version "v0.5.r0.4115c97")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/xfce-superkey-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "open the whisker menu in XFCE using the Super key")
    (description "Open the whisker menu launcher in XFCE using the Super key.")
    (home-page "https://github.com/JixunMoe/xfce-superkey")
    (license license:gpl3+)))

;;; sysbox-ce-bin --- container runtime with VM-like isolation
(define-public sysbox-ce-bin
  (package
    (name "sysbox-ce-bin")
    (version "0.6.7")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/sysbox-ce-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "container runtime with VM-like isolation")
    (description "Container runtime with VM-like isolation (run Systemd, Docker, K8s
in containers).")
    (home-page "https://github.com/nestybox/sysbox")
    (license license:asl2.0)))

;;; squiid --- advanced calculator written in Rust with TUI
(define-public squiid
  (package
    (name "squiid")
    (version "1.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://gitlab.com/ImaginaryInfinity/squiid-calculator/squiid/-/archive/v"
                                  version "/squiid-v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "advanced calculator written in Rust with TUI")
    (description "Advanced calculator written in Rust, featuring a terminal user
interface supporting both RPN and algebraic input.")
    (home-page "https://gitlab.com/ImaginaryInfinity/squiid-calculator/squiid")
    (license license:gpl3)))

;;; sqlfuse-git --- encrypted user-space filesystem using SQLite3/SQLCipher/FUSE
(define-public sqlfuse-git
  (package
    (name "sqlfuse-git")
    (version "r179.a2f60b6")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/sqlfuse-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "encrypted user-space filesystem using SQLite3/SQLCipher/FUSE")
    (description "Encrypted user-space filesystem using SQLite3+SQLCipher+FUSE.")
    (home-page "https://github.com/maksverver/sqlfuse")
    (license license:nonfree)))

;;; parrot-bin --- GUI wrapper in Tauri for the Arch Linux package manager
(define-public parrot-bin
  (package
    (name "parrot-bin")
    (version "1.0.6")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/dan-online/parrot/releases/download/v"
                                  version "/parrot_" version "_amd64.deb"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "GUI wrapper in Tauri for the Arch Linux package manager")
    (description "GUI wrapper in Tauri for the Arch Linux package manager, pacman
using the wrapper paru.  Designed to be intuitive, powerful and user-friendly.")
    (home-page "https://github.com/dan-online/parrot")
    (license license:expat)))

;;; openbgpd --- a free implementation of the Border Gateway Protocol v4
(define-public openbgpd
  (package
    (name "openbgpd")
    (version "8.8")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://ftp.openbsd.org/pub/OpenBSD/OpenBGPD/openbgpd-"
                                  version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "a free implementation of the Border Gateway Protocol v4")
    (description "A free implementation of the Border Gateway Protocol, Version 4.")
    (home-page "https://www.openbgpd.org")
    (license license:isc)))

;;; livi --- a simple GTK4 based video player for mobile phones
(define-public livi
  (package
    (name "livi")
    (version "0.4.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://gitlab.gnome.org/guidog/livi/-/archive/v"
                                  version "/livi-v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "a simple GTK4 based video player for mobile phones")
    (description "A simple GTK4 based video player for mobile phones.")
    (home-page "https://gitlab.gnome.org/guidog/livi")
    (license license:gpl3)))

;;; lightnovel-crawler-bin --- download novels from online sources (standalone)
(define-public lightnovel-crawler-bin
  (package
    (name "lightnovel-crawler-bin")
    (version "3.10.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/dipu-bd/lightnovel-crawler/releases/download/v"
                                  version "/lncrawl-linux"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "download novels from online sources (standalone)")
    (description "An app to download novels from online sources and generate e-books
(standalone bundle).")
    (home-page "https://github.com/dipu-bd/lightnovel-crawler")
    (license license:asl2.0)))

;;; lampa --- movies and serials tracker, indexer and player
(define-public lampa
  (package
    (name "lampa")
    (version "1.4.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lampa.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "movies and serials tracker, indexer and player")
    (description "Lampa - movies and serials tracker, indexer and player.")
    (home-page "http://lampa.mx")
    (license license:nonfree)))

;;; gnome-shell-extension-useless-gaps-git --- adds aesthetic gaps around windows
(define-public gnome-shell-extension-useless-gaps-git
  (package
    (name "gnome-shell-extension-useless-gaps-git")
    (version "8.r35.g8968946")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gnome-shell-extension-useless-gaps-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "adds aesthetic gaps around windows in GNOME Shell")
    (description "Useless Gaps is a GNOME Shell Extension which for aesthetic purposes
adds useless gaps around windows.")
    (home-page "https://github.com/mipmip/gnome-shell-extensions-useless-gaps")
    (license license:gpl3+)))

;;; 4nec2-bin --- NEC based antenna modeler and optimizer (using Wine)
(define-public 4nec2-bin
  (package
    (name "4nec2-bin")
    (version "5.9.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/4nec2-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "NEC based antenna modeler and optimizer (using Wine)")
    (description "NEC based antenna modeler and optimizer (using Wine).")
    (home-page "https://www.qsl.net/4nec2")
    (license license:nonfree)))

;;; woff2-suite --- a Korean UI headline typeface focused on clarity
(define-public woff2-suite
  (package
    (name "woff2-suite")
    (version "2.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/sunn-us/SUITE/releases/download/v" version
                                  "/SUITE-variable.woff2"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "a Korean UI headline typeface focused on clarity")
    (description "A Korean UI headline typeface focused on clarity.")
    (home-page "https://github.com/sunn-us/SUITE")
    (license license:silofl1.1)))

;;; termsonic-git --- terminal-based TUI client for Subsonic-compatible servers
(define-public termsonic-git
  (package
    (name "termsonic-git")
    (version "0.2.r2.gf6f61fd")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/termsonic-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments (list #:tests? #f
                     #:import-path "git.sixfoisneuf.fr/termsonic"))
    (supported-systems '("x86_64-linux"))
    (synopsis "terminal-based TUI client for Subsonic-compatible servers")
    (description "A terminal-based (TUI) client for any Subsonic-compatible server.")
    (home-page "https://git.sixfoisneuf.fr/termsonic")
    (license license:gpl3)))

;;; swaylock-clock --- screen locker for Wayland with clock functionality
(define-public swaylock-clock
  (package
    (name "swaylock-clock")
    (version "1.8.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://git.sr.ht/~mvforell/swaylock/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "screen locker for Wayland with clock functionality")
    (description "Screen locker for Wayland, with extra clock functionality.")
    (home-page "https://git.sr.ht/~mvforell/swaylock")
    (license license:expat)))

;;; sonycardscanner --- utility for working with Sony cameras
(define-public sonycardscanner
  (package
    (name "sonycardscanner")
    (version "0.0.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/sonycardscanner.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "utility for working with Sony cameras")
    (description "Utility for working with Sony cameras.")
    (home-page "https://git.alexavr.ru/ZAvrikDinozavrik/SonyCardScanner")
    (license license:gpl3)))

;;; sfbrename-gtk --- simple bulk rename utility (GTK+ GUI)
(define-public sfbrename-gtk
  (package
    (name "sfbrename-gtk")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/karwler/sfbrename/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "simple bulk rename utility (GTK+ GUI)")
    (description "Simple bulk rename utility (GTK+ GUI and CLI tool).")
    (home-page "https://github.com/karwler/sfbrename")
    (license license:nonfree)))

;;; sfbrename-cli --- simple bulk rename utility (CLI)
(define-public sfbrename-cli
  (package
    (name "sfbrename-cli")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/karwler/sfbrename/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "simple bulk rename utility (CLI)")
    (description "Simple bulk rename utility (CLI tool).")
    (home-page "https://github.com/karwler/sfbrename")
    (license license:nonfree)))

;;; rosepad --- simple cross-platform text editor with beautiful UI
(define-public rosepad
  (package
    (name "rosepad")
    (version "0.1.3")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/TMG8047KG/RosePad/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "simple cross-platform text editor with beautiful UI")
    (description "A simple cross-platform text editor made for writing notes, letters,
poems, and such with ease with a beautiful UI.")
    (home-page "https://github.com/TMG8047KG/RosePad")
    (license license:gpl3+)))

;;; rn-bin --- rename files and directories
(define-public rn-bin
  (package
    (name "rn-bin")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/thled/rn/releases/download/v" version
                                  "/rn-linux-amd64"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "rename files and directories")
    (description "Rename files and directories.")
    (home-page "https://github.com/thled/rn")
    (license license:expat)))

;;; python-settngs --- a library for managing settings
(define-public python-settngs
  (package
    (name "python-settngs")
    (version "0.11.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/lordwelch/settngs/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "a library for managing settings")
    (description "A library for managing settings.")
    (home-page "https://github.com/lordwelch/settngs")
    (license license:expat)))

;;; python-reader --- Python feed reader library for RSS, Atom, and JSON feeds
(define-public python-reader
  (package
    (name "python-reader")
    (version "3.16")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/lemon24/reader/archive/refs/tags/" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "Python feed reader library for RSS, Atom, and JSON feeds")
    (description "Python feed reader library for RSS, Atom, and JSON feeds.")
    (home-page "https://github.com/lemon24/reader")
    (license license:bsd-3)))

;;; python-comicfn2dict --- parse comic filenames into metadata attributes
(define-public python-comicfn2dict
  (package
    (name "python-comicfn2dict")
    (version "0.2.5")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/ajslater/comicfn2dict/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "parse comic filenames into metadata attributes")
    (description "Parse common comic filenames and return a dict of metadata
attributes.")
    (home-page "https://github.com/ajslater/comicfn2dict")
    (license license:gpl3)))

;;; nsproxy-git --- tool to force applications to use a specific SOCKS5/HTTP proxy
(define-public nsproxy-git
  (package
    (name "nsproxy-git")
    (version "0.2.0.3.g7306d12")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/nsproxy-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "tool to force applications to use a specific SOCKS5/HTTP proxy")
    (description "A tool to force applications to use a specific SOCKS5 or HTTP proxy.")
    (home-page "https://github.com/nlzy/nsproxy")
    (license license:gpl2+)))

;;; mpris-miniplayer --- MPRIS miniplayer
(define-public mpris-miniplayer
  (package
    (name "mpris-miniplayer")
    (version "1.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mpris-miniplayer.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "MPRIS miniplayer")
    (description "MPRIS Miniplayer.")
    (home-page "https://git.dummkopf.live/InventorX/mpris-miniplayer")
    (license license:zlib)))

;;; magellan-bin --- Redfish-based BMC discovery tool written in Go
(define-public magellan-bin
  (package
    (name "magellan-bin")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/OpenCHAMI/magellan/releases/download/v"
                                  version "/magellan_" version "_linux_amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "Redfish-based BMC discovery tool written in Go")
    (description "Redfish-based BMC discovery tool written in Go.")
    (home-page "https://github.com/OpenCHAMI/magellan")
    (license license:expat)))

;;; katharsis --- CLI tool for generating RSS feeds
(define-public katharsis
  (package
    (name "katharsis")
    (version "1.0.0.30")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/arghena/katharsis/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "CLI tool for generating RSS feeds")
    (description "CLI tool for generating RSS feeds.")
    (home-page "https://github.com/arghena/katharsis")
    (license license:expat)))

;;; ghidra-fidb-repo --- Ghidra Function ID dataset repository
(define-public ghidra-fidb-repo
  (package
    (name "ghidra-fidb-repo")
    (version "20200530")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ghidra-fidb-repo.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "Ghidra Function ID dataset repository")
    (description "Ghidra Function ID dataset repository.")
    (home-page "https://github.com/threatrack/ghidra-fidb-repo")
    (license license:expat)))

;;; gdpm-git --- CLI tool to manage Godot game engine assets
(define-public gdpm-git
  (package
    (name "gdpm-git")
    (version "r99.13487a1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gdpm-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "CLI tool to manage Godot game engine assets")
    (description "CLI tool to automate managing Godot game engine assets from the
command-line.")
    (home-page "https://github.com/davidallendj/gdpm")
    (license license:expat)))

;;; file-share-bin --- Rust powered HTTP file-server with beautiful web GUI
(define-public file-share-bin
  (package
    (name "file-share-bin")
    (version "1.5.4")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/Maneren/file-share-rs/releases/download/v"
                                  version "/file-share-rs-x86_64-unknown-linux-gnu.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "Rust powered HTTP file-server with beautiful web GUI")
    (description "Rust powered HTTP file-server with beautiful web-based GUI.")
    (home-page "https://github.com/Maneren/file-share-rs")
    (license license:expat)))

;;; fcd-bin --- text mode file manager combining ranger and mc features
(define-public fcd-bin
  (package
    (name "fcd-bin")
    (version "1.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/bugnano/fcd/releases/download/v" version
                                  "/fcd-linux-x86_64"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "text mode file manager combining ranger and mc features")
    (description "Text mode file manager combining the best features of ranger and mc.")
    (home-page "https://github.com/bugnano/fcd")
    (license license:gpl3+)))

;;; drawio-desktop-git --- diagramming and whiteboarding desktop app (Electron)
(define-public drawio-desktop-git
  (package
    (name "drawio-desktop-git")
    (version "29.6.6")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/jgraph/drawio-desktop/releases/download/v"
                                  version "/drawio-x86_64-" version ".AppImage"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "diagramming and whiteboarding desktop app (Electron)")
    (description "A diagramming and whiteboarding desktop app based on Electron that
wraps the core draw.io editor.")
    (home-page "https://www.diagrams.net/")
    (license license:asl2.0)))

;;; deja-file --- CLI tool to detect and delete duplicate files by MD5 hash
(define-public deja-file
  (package
    (name "deja-file")
    (version "1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/KartikJain14/deja-file/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "CLI tool to detect and delete duplicate files by MD5 hash")
    (description "CLI tool to detect and delete duplicate files by MD5 hash.")
    (home-page "https://github.com/KartikJain14/deja-file")
    (license license:expat)))

;;; dcmfx --- CLI tool for working with DICOM and DICOM JSON
(define-public dcmfx
  (package
    (name "dcmfx")
    (version "0.45.4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/dcmfx.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "CLI tool for working with DICOM and DICOM JSON")
    (description "CLI tool for working with DICOM and DICOM JSON.")
    (home-page "https://dcmfx.github.io")
    (license license:agpl3)))

;;; ctf-ynetd --- a fork of ynetd hardened for CTFs
(define-public ctf-ynetd
  (package
    (name "ctf-ynetd")
    (version "2024.12.31")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ctf-ynetd.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "a fork of ynetd hardened for CTFs")
    (description "A fork of ynetd hardened for CTFs.  Supports isolation using PID
namespaces, minimal overhead proof-of-work checking, and strict resource limits
via cgroups.")
    (home-page "https://hxp.io/code/")
    (license license:expat)))

;;; configurator --- extensible tool to generate config files with Jinja 2
(define-public configurator
  (package
    (name "configurator")
    (version "0.2.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/OpenCHAMI/configurator/archive/refs/tags/v"
                                  version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments (list #:tests? #f
                     #:import-path "github.com/OpenCHAMI/configurator"))
    (supported-systems '("x86_64-linux"))
    (synopsis "extensible tool to generate config files with Jinja 2")
    (description "An extensible tool to dynamically generate config files from SMD
with Jinja 2 templating support.")
    (home-page "https://github.com/OpenCHAMI/configurator")
    (license license:expat)))

;;; celeste64-bin --- a game made for Celeste's 6th Anniversary
(define-public celeste64-bin
  (package
    (name "celeste64-bin")
    (version "1.1.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/celeste64-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "a game made for Celeste's 6th Anniversary")
    (description "A game made in under 2 weeks for Celeste's 6th Anniversary.")
    (home-page "https://maddymakesgamesinc.itch.io/celeste64")
    (license license:nonfree)))

;;; buildit-git --- a user-friendly fast Make alternative written in Rust
(define-public buildit-git
  (package
    (name "buildit-git")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/neoapps-dev/buildit/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "a user-friendly fast Make alternative written in Rust")
    (description "A user-friendly, fast Make alternative for all programming languages
written in Rust.")
    (home-page "https://github.com/neoapps-dev/buildit")
    (license license:gpl3+)))

;;; brim --- grab screenshots and blur them as JPGs (Wayland)
(define-public brim
  (package
    (name "brim")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://git.sr.ht/~mvforell/brim/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "grab screenshots and blur them as JPGs (Wayland)")
    (description "Grab screenshots of all outputs and then blur and save them as JPGs.")
    (home-page "https://git.sr.ht/~mvforell/brim")
    (license license:expat)))

;;; boost183 --- free peer-reviewed portable C++ source libraries (v1.83)
(define-public boost183
  (package
    (name "boost183")
    (version "1.83.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://boostorg.jfrog.io/artifactory/main/release/"
                                  version "/source/boost_"
                                  (string-replace-substring version "." "_") ".tar.bz2"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "free peer-reviewed portable C++ source libraries (v1.83)")
    (description "Free peer-reviewed portable C++ source libraries (development
headers, version 1.83).")
    (home-page "https://www.boost.org/")
    (license license:boost1.0)))

;;; blipnblup-git --- a Bubble Bobble inspired platform game
(define-public blipnblup-git
  (package
    (name "blipnblup-git")
    (version "r524.7918802")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/blipnblup-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "a Bubble Bobble inspired platform game")
    (description "A Bubble Bobble inspired platform game.")
    (home-page "https://gitlab.com/luckeyproductions/games/blipnblup")
    (license license:gpl2+)))

;;; keepmenu --- dmenu/rofi frontend for KeePass databases
(define-public keepmenu
  (package
    (name "keepmenu")
    (version "1.4.4")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/firecat53/keepmenu/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "dmenu/rofi frontend for KeePass databases")
    (description "dmenu/rofi frontend for KeePass databases.")
    (home-page "https://github.com/firecat53/keepmenu")
    (license license:gpl3)))

;;; defold-bin --- free game engine for desktop, mobile and web games
(define-public defold-bin
  (package
    (name "defold-bin")
    (version "1.12.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/defold-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "free game engine for desktop, mobile and web games")
    (description "Defold is a completely free to use game engine for development of
desktop, mobile and web games.")
    (home-page "https://defold.com/")
    (license license:nonfree)))

;;; python-ansi --- ANSI cursor movement and graphics
(define-public python-ansi
  (package
    (name "python-ansi")
    (version "0.3.7")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/tehmaze/ansi/archive/refs/tags/" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "ANSI cursor movement and graphics")
    (description "ANSI cursor movement and graphics.")
    (home-page "https://github.com/tehmaze/ansi")
    (license license:expat)))

;;; qqmusic-electron --- Tencent QQMusic running with system Electron
(define-public qqmusic-electron
  (package
    (name "qqmusic-electron")
    (version "1.1.8")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/qqmusic-electron.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "Tencent QQMusic running with system Electron")
    (description "Tencent QQMusic, run with system Electron.")
    (home-page "https://y.qq.com/")
    (license license:cc0)))

;;; dogecoin-qt --- Dogecoin cryptocurrency client (Qt GUI)
(define-public dogecoin-qt
  (package
    (name "dogecoin-qt")
    (version "1.14.9")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/dogecoin/dogecoin/archive/refs/tags/v"
                                  version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "Dogecoin cryptocurrency client (Qt GUI)")
    (description "Dogecoin cryptocurrency client.")
    (home-page "http://dogecoin.com/")
    (license license:expat)))

;;; dunst-timer --- Python script for timer notifications in Dunst
(define-public dunst-timer
  (package
    (name "dunst-timer")
    (version "1.00.08")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/bitSheriff/dunst-timer/archive/refs/tags/v"
                                  version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "Python script for timer notifications in Dunst")
    (description "A Python script for setting timers with progress bar notifications
in Dunst.")
    (home-page "https://github.com/bitSheriff/dunst-timer")
    (license license:expat)))

;;; python-flake8-rst-docstrings --- flake8 plugin to validate Python docstrings as RST
(define-public python-flake8-rst-docstrings
  (package
    (name "python-flake8-rst-docstrings")
    (version "0.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/peterjc/flake8-rst-docstrings/archive/refs/tags/v"
                                  version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "flake8 plugin to validate Python docstrings as RST")
    (description "flake8 plugin to validate Python docstrings as reStructuredText
(RST).")
    (home-page "https://github.com/peterjc/flake8-rst-docstrings")
    (license license:expat)))

;;; leetgo-bin --- command-line tool for leetcode.com
(define-public leetgo-bin
  (package
    (name "leetgo-bin")
    (version "1.4.17")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/j178/leetgo/releases/download/v" version
                                  "/leetgo_" version "_linux_amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "command-line tool for leetcode.com")
    (description "leetgo is a command line tool for leetcode.com.  It can help you to
login, submit, test, and view your submissions.")
    (home-page "https://github.com/j178/leetgo")
    (license license:expat)))

;;; arnis --- generate any real-world location in Minecraft
(define-public arnis
  (package
    (name "arnis")
    (version "2.6.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/louis-e/arnis/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "generate any real-world location in Minecraft")
    (description "Generate any location from the real world in Minecraft.")
    (home-page "https://github.com/louis-e/arnis")
    (license license:asl2.0)))

;;; tiny-rdm --- modern lightweight cross-platform Redis desktop manager
(define-public tiny-rdm
  (package
    (name "tiny-rdm")
    (version "1.2.7")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/tiny-rdm.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "modern lightweight cross-platform Redis desktop manager")
    (description "A modern lightweight cross-platform Redis desktop manager.")
    (home-page "https://redis.tinycraft.cc/")
    (license license:gpl3)))
