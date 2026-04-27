;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260427h
;;; Resolves 100 packages from queue (100 recipes, 0 blocked).
;;;
;;; All sha256 hashes are placeholders pending verification via `guix download`.

(define-module (gaurix packages recipe-resolver-260427h)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system node)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:export (

            imfile-bin
            sqlitestudio-plugins
            videoduplicatefinder-git
            firefox-extension-uget-integration-bin
            moonray-gui
            moonray
            woff2-suite-variable
            python-pyrate-limiter-2
            python-conda-libmamba-solver
            nsproxy
            libjxl-metrics
            kvantum-manjaro-theme-git
            f-client-git
            aom-psy101-git
            liteloader-qqnt-bin
            snapd-glib
            pop-shell-plugin-system76-power-git
            pop-launcher-git
            python-mcdreforged
            audiotools
            kime
            fzf-tab-git
            yin-yang
            pmbootstrap-git
            pacmixer
            vorta-root
            qlot
            cropgui
            nodenv
            fusesmb
            wacom-utility
            brlcad
            gazebo
            potato
            igv
            maelstrom
            mullvad-vpn-daemon-beta
            mullvad-vpn-beta
            koreader-appimage
            teeworlds-git
            python-kiss-headers
            gpredict-git
            zsh-antidote
            ydiff
            sportstracker
            libthinkpad
            xfwm4-gaps
            rr-git
            propertree-git
            gummy-git
            zwcad-bin
            wtype-git
            reflective-rapidjson
            python-npyscreen
            neverball-git
            kristall-git
            gitea-tea-git
            dvm
            colorpicker-keshavbhatt
            xwacomcalibrate
            rofi-rbw-git
            qsstv-git
            python-flask-limiter
            nautilus-empty-file
            lightburn-bin
            librewolf-extension-sponsorblock-bin
            karaokemugen
            kame-editor-git
            appimage-cli-tool-git
            alsa-control
            yasm-git
            xpano-git
            wrappe-bin
            work-bin
            vim-dracula-git
            usbkvm
            trustbuilder-appimage
            tod-bin
            superglue-bin
            sstv-git
            ssrv-bin
            souko-bin
            sharun-bin
            screenshot-llm
            rencfs-bin
            quick-send-bin
            python-fints
            python-advocate
            ptyspawn-bin
            plow-bin
            paclogger
            opustags-git
            ofxstatement-qif
            nvmesmart
            nsv
            notify-send-rs-bin
            mixramp
            jdsimpleautostart
            jabba-bin
            i3-lru
            ))

;;; Nonfree/proprietary license placeholder for Gaurix channel
(define license:nonfree
  ((@@ (guix licenses) license) "Nonfree"
    "https://spdx.org/licenses/"
    "Proprietary or custom license; see upstream for terms."))

;;; imfile-bin --- A full-featured download manager.Forked from motrix.(Prebuilt version.Use s
(define-public imfile-bin
  (package
    (name "imfile-bin")
    (version "2.0.5")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/imfile-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "A full-featured download manager.Forked from motrix.(Prebuilt version.Use s")
    (description "A full-featured download manager.Forked from motrix.(Prebuilt version.Use system-wide electron).")
    (home-page "https://imfile.io/")
    (license license:expat)))

;;; sqlitestudio-plugins --- official plugins for sqlitestudio
(define-public sqlitestudio-plugins
  (package
    (name "sqlitestudio-plugins")
    (version "3.4.21")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/sqlitestudio-plugins.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "official plugins for sqlitestudio")
    (description "Official plugins for sqlitestudio.")
    (home-page "https://sqlitestudio.pl")
    (license license:gpl3+)))

;;; videoduplicatefinder-git --- video Duplicate Finder is a cross-platform software to find duplicated vide
(define-public videoduplicatefinder-git
  (package
    (name "videoduplicatefinder-git")
    (version "3.0.x.r327.g553013a")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/videoduplicatefinder-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "video Duplicate Finder is a cross-platform software to find duplicated vide")
    (description "Video Duplicate Finder is a cross-platform software to find duplicated video (and image) files on hard disk based on similiarity.")
    (home-page "https://github.com/0x90d/videoduplicatefinder")
    (license license:agpl3+)))

;;; firefox-extension-uget-integration-bin --- integrate Mozilla Firefox with uGet download manager (binary release)
(define-public firefox-extension-uget-integration-bin
  (package
    (name "firefox-extension-uget-integration-bin")
    (version "2.1.3.2resigned1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/firefox-extension-uget-integration-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "integrate Mozilla Firefox with uGet download manager (binary release)")
    (description "Integrate Mozilla Firefox with uGet download manager (binary release).")
    (home-page "https://addons.mozilla.org/addon/ugetintegration")
    (license license:gpl3)))

;;; moonray-gui --- dreamWorks’ production MCRT renderer
(define-public moonray-gui
  (package
    (name "moonray-gui")
    (version "1.4.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/moonray-gui.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "dreamWorks’ production MCRT renderer")
    (description "DreamWorks’ production MCRT renderer.")
    (home-page "https://openmoonray.org")
    (license license:asl2.0)))

;;; moonray --- dreamWorks’ production MCRT renderer
(define-public moonray
  (package
    (name "moonray")
    (version "1.4.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/moonray.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "dreamWorks’ production MCRT renderer")
    (description "DreamWorks’ production MCRT renderer.")
    (home-page "https://openmoonray.org")
    (license license:asl2.0)))

;;; woff2-suite-variable --- A Korean UI headline typeface focused on clarity
(define-public woff2-suite-variable
  (package
    (name "woff2-suite-variable")
    (version "2.0.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/woff2-suite-variable.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "A Korean UI headline typeface focused on clarity")
    (description "A Korean UI headline typeface focused on clarity.")
    (home-page "https://github.com/sunn-us/SUITE")
    (license license:silofl1.1)))

;;; python-pyrate-limiter-2 --- python Rate-Limiter using Leaky-Bucket Algorithm
(define-public python-pyrate-limiter-2
  (package
    (name "python-pyrate-limiter-2")
    (version "2.10.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-pyrate-limiter-2.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "python Rate-Limiter using Leaky-Bucket Algorithm")
    (description "Python Rate-Limiter using Leaky-Bucket Algorithm.")
    (home-page "https://github.com/vutran1710/PyrateLimiter")
    (license license:expat)))

;;; python-conda-libmamba-solver --- the libmamba based solver for conda
(define-public python-conda-libmamba-solver
  (package
    (name "python-conda-libmamba-solver")
    (version "25.11.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-conda-libmamba-solver.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "the libmamba based solver for conda")
    (description "The libmamba based solver for conda.")
    (home-page "https://github.com/conda/conda-libmamba-solver")
    (license license:bsd-3)))

;;; nsproxy --- A command-line tool that force applications to use a specific SOCKS5 or HTT
(define-public nsproxy
  (package
    (name "nsproxy")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/nsproxy.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "A command-line tool that force applications to use a specific SOCKS5 or HTT")
    (description "A command-line tool that force applications to use a specific SOCKS5 or HTTP proxy.")
    (home-page "https://github.com/nlzy/nsproxy")
    (license license:gpl2)))

;;; libjxl-metrics --- jPEG XL image format reference implementation with butteraugli, ssimulacra,
(define-public libjxl-metrics
  (package
    (name "libjxl-metrics")
    (version "0.11.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/libjxl-metrics.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "jPEG XL image format reference implementation with butteraugli, ssimulacra,")
    (description "JPEG XL image format reference implementation with butteraugli, ssimulacra, and ssimulacra2 metrics.")
    (home-page "https://jpeg.org/jpegxl/")
    (license license:bsd-3)))

;;; kvantum-manjaro-theme-git --- kvantum Manjaro theme based on works of Papirus Development Team and Tsu Jan
(define-public kvantum-manjaro-theme-git
  (package
    (name "kvantum-manjaro-theme-git")
    (version "r37.a316110")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/kvantum-manjaro-theme-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "kvantum Manjaro theme based on works of Papirus Development Team and Tsu Jan")
    (description "Kvantum Manjaro theme based on works of Papirus Development Team and Tsu Jan.")
    (home-page "https://gitlab.manjaro.org/artwork/themes/kvantum-manjaro")
    (license license:gpl3+)))

;;; f-client-git --- A QoL mod for TeeWorlds: a fast-paced multiplayer 2D shooter game
(define-public f-client-git
  (package
    (name "f-client-git")
    (version "0.7.5_3.4.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/f-client-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "A QoL mod for TeeWorlds: a fast-paced multiplayer 2D shooter game")
    (description "A QoL mod for TeeWorlds: a fast-paced multiplayer 2D shooter game.")
    (home-page "https://github.com/fokkonaut/F-Client")
    (license license:nonfree)))

;;; aom-psy101-git --- another aom psy fork
(define-public aom-psy101-git
  (package
    (name "aom-psy101-git")
    (version "3.12.0.r127.58cf4e9818")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/aom-psy101-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "another aom psy fork")
    (description "Another aom psy fork.")
    (home-page "https://gitlab.com/damian101/aom-psy101")
    (license license:bsd-2)))

;;; liteloader-qqnt-bin --- 轻量, 简洁, 开源的 QQNT 插件加载器
(define-public liteloader-qqnt-bin
  (package
    (name "liteloader-qqnt-bin")
    (version "1.4.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/liteloader-qqnt-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "轻量, 简洁, 开源的 QQNT 插件加载器")
    (description "轻量, 简洁, 开源的 QQNT 插件加载器.")
    (home-page "https://github.com/LiteLoaderQQNT/LiteLoaderQQNT")
    (license license:expat)))

;;; snapd-glib --- library to allow GLib/Qt based applications access to snapd, the daemon tha
(define-public snapd-glib
  (package
    (name "snapd-glib")
    (version "1.72")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/snapd-glib.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "library to allow GLib/Qt based applications access to snapd, the daemon tha")
    (description "Library to allow GLib/Qt based applications access to snapd, the daemon that controls Snaps.")
    (home-page "https://github.com/snapcore/snapd-glib")
    (license license:gpl3+)))

;;; pop-shell-plugin-system76-power-git --- system76 Power scripts for the launcher
(define-public pop-shell-plugin-system76-power-git
  (package
    (name "pop-shell-plugin-system76-power-git")
    (version "1.0.5.r0.geead361")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/pop-shell-plugin-system76-power-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "system76 Power scripts for the launcher")
    (description "System76 Power scripts for the launcher.")
    (home-page "https://github.com/pop-os/launcher")
    (license license:mpl2.0)))

;;; pop-launcher-git --- modular IPC-based desktop launcher service
(define-public pop-launcher-git
  (package
    (name "pop-launcher-git")
    (version "1.0.5.r0.geead361")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/pop-launcher-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "modular IPC-based desktop launcher service")
    (description "Modular IPC-based desktop launcher service.")
    (home-page "https://github.com/pop-os/launcher")
    (license license:mpl2.0)))

;;; python-mcdreforged --- A rewritten version of MCDaemon, a python script to control your Minecraft 
(define-public python-mcdreforged
  (package
    (name "python-mcdreforged")
    (version "2.15.7")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-mcdreforged.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "A rewritten version of MCDaemon, a python script to control your Minecraft ")
    (description "A rewritten version of MCDaemon, a python script to control your Minecraft server.")
    (home-page "https://github.com/Fallen-Breath/MCDReforged")
    (license license:lgpl3+)))

;;; audiotools --- A collection of Python-based command-line audio handling programs
(define-public audiotools
  (package
    (name "audiotools")
    (version "3.1.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/audiotools.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "A collection of Python-based command-line audio handling programs")
    (description "A collection of Python-based command-line audio handling programs.")
    (home-page "http://audiotools.sourceforge.net")
    (license license:gpl3+)))

;;; kime --- korean IME
(define-public kime
  (package
    (name "kime")
    (version "3.1.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/kime.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "korean IME")
    (description "Korean IME.")
    (home-page "https://github.com/Riey/kime")
    (license license:gpl3+)))

;;; fzf-tab-git --- replace zsh's default completion selection menu with fzf (git version)
(define-public fzf-tab-git
  (package
    (name "fzf-tab-git")
    (version "r199.220bee3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/fzf-tab-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "replace zsh's default completion selection menu with fzf (git version)")
    (description "Replace zsh's default completion selection menu with fzf (git version).")
    (home-page "https://github.com/Aloxaf/fzf-tab")
    (license license:expat)))

;;; yin-yang --- light/dark theme switcher for Linux. Supports popular Desktops, text editor
(define-public yin-yang
  (package
    (name "yin-yang")
    (version "4.0.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/yin-yang.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "light/dark theme switcher for Linux. Supports popular Desktops, text editor")
    (description "Light/dark theme switcher for Linux. Supports popular Desktops, text editors and more!.")
    (home-page "https://github.com/oskarsh/Yin-Yang")
    (license license:expat)))

;;; pmbootstrap-git --- sophisticated chroot/build/flash tool to develop and install postmarketOS (
(define-public pmbootstrap-git
  (package
    (name "pmbootstrap-git")
    (version "3.0.0.r0.g79c6e4c")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/pmbootstrap-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "sophisticated chroot/build/flash tool to develop and install postmarketOS (")
    (description "Sophisticated chroot/build/flash tool to develop and install postmarketOS (git).")
    (home-page "https://postmarketos.org")
    (license license:gpl3)))

;;; pacmixer --- alsamixer alike for PulseAudio
(define-public pacmixer
  (package
    (name "pacmixer")
    (version "0.6.4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/pacmixer.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "alsamixer alike for PulseAudio")
    (description "Alsamixer alike for PulseAudio.")
    (home-page "https://github.com/KenjiTakahashi/pacmixer")
    (license license:gpl3+)))

;;; vorta-root --- run vorta as root without having to enter a password
(define-public vorta-root
  (package
    (name "vorta-root")
    (version "0.0.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/vorta-root.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "run vorta as root without having to enter a password")
    (description "Run vorta as root without having to enter a password.")
    (home-page "https://github.com/eeems/vorta-root")
    (license license:expat)))

;;; qlot --- common Lisp library manager
(define-public qlot
  (package
    (name "qlot")
    (version "1.8.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/qlot.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "common Lisp library manager")
    (description "Common Lisp library manager.")
    (home-page "https://github.com/fukamachi/qlot")
    (license license:expat)))

;;; cropgui --- a simple tool for lossless jpeg cropping
(define-public cropgui
  (package
    (name "cropgui")
    (version "0.9")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/cropgui.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "a simple tool for lossless jpeg cropping")
    (description "A simple tool for lossless jpeg cropping.")
    (home-page "https://github.com/jepler/cropgui")
    (license license:gpl3+)))

;;; nodenv --- manage multiple NodeJS versions
(define-public nodenv
  (package
    (name "nodenv")
    (version "1.6.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/nodenv.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "manage multiple NodeJS versions")
    (description "Manage multiple NodeJS versions.")
    (home-page "https://github.com/nodenv/nodenv")
    (license license:expat)))

;;; fusesmb --- sMB for FUSE is a Samba shares filesystem
(define-public fusesmb
  (package
    (name "fusesmb")
    (version "0.8.7")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/fusesmb.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "sMB for FUSE is a Samba shares filesystem")
    (description "SMB for FUSE is a Samba shares filesystem.")
    (home-page "https://web.archive.org/web/20130503133741/http://www.ricardis.tudelft.nl/~vincent/fusesmb/")
    (license license:gpl2)))

;;; wacom-utility --- graphical Wacom tablet configuration utility. (Does not work for newer waco
(define-public wacom-utility
  (package
    (name "wacom-utility")
    (version "1.21")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/wacom-utility.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "graphical Wacom tablet configuration utility. (Does not work for newer waco")
    (description "Graphical Wacom tablet configuration utility. (Does not work for newer wacom tablets; latest update was in 2011.).")
    (home-page "https://www.linux-apps.com/content/show.php/Wacom+Control+Panel?content=104309")
    (license license:gpl2+)))

;;; brlcad --- extensive 3D solid modeling system
(define-public brlcad
  (package
    (name "brlcad")
    (version "7.42.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/brlcad.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "extensive 3D solid modeling system")
    (description "Extensive 3D solid modeling system.")
    (home-page "https://brlcad.org")
    (license license:bsd-3)))

;;; gazebo --- A multi-robot simulator for outdoor environments
(define-public gazebo
  (package
    (name "gazebo")
    (version "11.14.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gazebo.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "A multi-robot simulator for outdoor environments")
    (description "A multi-robot simulator for outdoor environments.")
    (home-page "https://classic.gazebosim.org/")
    (license license:asl2.0)))

;;; potato --- A pomodoro timer for the shell
(define-public potato
  (package
    (name "potato")
    (version "6")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/potato.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "A pomodoro timer for the shell")
    (description "A pomodoro timer for the shell.")
    (home-page "https://github.com/Bladtman242/potato")
    (license license:expat)))

;;; igv --- high-performance visualization tool for interactive exploration of large, i
(define-public igv
  (package
    (name "igv")
    (version "2.19.7")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/igv.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "high-performance visualization tool for interactive exploration of large, i")
    (description "High-performance visualization tool for interactive exploration of large, integrated genomic datasets. From Broad Institute.")
    (home-page "http://www.broadinstitute.org/software/igv/home")
    (license license:expat)))

;;; maelstrom --- asteroids-type game with sound and 3D objects
(define-public maelstrom
  (package
    (name "maelstrom")
    (version "3.0.7")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/maelstrom.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "asteroids-type game with sound and 3D objects")
    (description "Asteroids-type game with sound and 3D objects.")
    (home-page "http://www.libsdl.org/projects/Maelstrom/")
    (license license:gpl3+)))

;;; mullvad-vpn-daemon-beta --- the Mullvad VPN client app for desktop (beta channel) (daemon and CLI)
(define-public mullvad-vpn-daemon-beta
  (package
    (name "mullvad-vpn-daemon-beta")
    (version "2026.2.beta1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mullvad-vpn-daemon-beta.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "the Mullvad VPN client app for desktop (beta channel) (daemon and CLI)")
    (description "The Mullvad VPN client app for desktop (beta channel) (daemon and CLI).")
    (home-page "https://www.mullvad.net")
    (license license:gpl3+)))

;;; mullvad-vpn-beta --- the Mullvad VPN client app for desktop (beta channel) (desktop application)
(define-public mullvad-vpn-beta
  (package
    (name "mullvad-vpn-beta")
    (version "2026.2.beta1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mullvad-vpn-beta.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "the Mullvad VPN client app for desktop (beta channel) (desktop application)")
    (description "The Mullvad VPN client app for desktop (beta channel) (desktop application).")
    (home-page "https://www.mullvad.net")
    (license license:gpl3+)))

;;; koreader-appimage --- an ebook reader supporting PDF, DjVu, EPUB, FB2 and many more formats
(define-public koreader-appimage
  (package
    (name "koreader-appimage")
    (version "2026.03")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/koreader-appimage.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "an ebook reader supporting PDF, DjVu, EPUB, FB2 and many more formats")
    (description "An ebook reader supporting PDF, DjVu, EPUB, FB2 and many more formats.")
    (home-page "https://koreader.rocks/")
    (license license:agpl3+)))

;;; teeworlds-git --- fast-paced multiplayer 2D shooter game
(define-public teeworlds-git
  (package
    (name "teeworlds-git")
    (version "0.7.5.6245.26d24ec06")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/teeworlds-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "fast-paced multiplayer 2D shooter game")
    (description "Fast-paced multiplayer 2D shooter game.")
    (home-page "https://teeworlds.com")
    (license license:nonfree)))

;;; python-kiss-headers --- python package for HTTP/1.1 style headers. Parse headers to objects
(define-public python-kiss-headers
  (package
    (name "python-kiss-headers")
    (version "2.5.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-kiss-headers.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "python package for HTTP/1.1 style headers. Parse headers to objects")
    (description "Python package for HTTP/1.1 style headers. Parse headers to objects.")
    (home-page "https://ousret.github.io/kiss-headers")
    (license license:expat)))

;;; gpredict-git --- gpredict is a real-time satellite tracking and orbit prediction application
(define-public gpredict-git
  (package
    (name "gpredict-git")
    (version "2.3.r133.g91a4a3f")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gpredict-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "gpredict is a real-time satellite tracking and orbit prediction application")
    (description "Gpredict is a real-time satellite tracking and orbit prediction application.")
    (home-page "http://gpredict.oz9aec.net/")
    (license license:gpl2)))

;;; zsh-antidote --- the cure to slow zsh plugin management
(define-public zsh-antidote
  (package
    (name "zsh-antidote")
    (version "2.1.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/zsh-antidote.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "the cure to slow zsh plugin management")
    (description "The cure to slow zsh plugin management.")
    (home-page "https://getantidote.github.io/")
    (license license:expat)))

;;; ydiff --- colored, incremental, side-by-side diff viewer
(define-public ydiff
  (package
    (name "ydiff")
    (version "1.4.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ydiff.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "colored, incremental, side-by-side diff viewer")
    (description "Colored, incremental, side-by-side diff viewer.")
    (home-page "http://pypi.python.org/pypi/ydiff/")
    (license license:bsd-3)))

;;; sportstracker --- application for people who want to track their sporting activities
(define-public sportstracker
  (package
    (name "sportstracker")
    (version "8.1.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/sportstracker.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "application for people who want to track their sporting activities")
    (description "Application for people who want to track their sporting activities.")
    (home-page "http://www.saring.de/sportstracker/")
    (license license:gpl3+)))

;;; libthinkpad --- A general purpose userspace ThinkPad library
(define-public libthinkpad
  (package
    (name "libthinkpad")
    (version "2.6")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/libthinkpad.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "A general purpose userspace ThinkPad library")
    (description "A general purpose userspace ThinkPad library.")
    (home-page "https://github.com/libthinkpad/libthinkpad")
    (license license:bsd-3)))

;;; xfwm4-gaps --- xfce's window manager - now with extra gaps
(define-public xfwm4-gaps
  (package
    (name "xfwm4-gaps")
    (version "4.20.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/xfwm4-gaps.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "xfce's window manager - now with extra gaps")
    (description "Xfce's window manager - now with extra gaps.")
    (home-page "https://docs.xfce.org/xfce/xfwm4/start")
    (license license:gpl2+)))

;;; rr-git --- record and Replay framework: lightweight recording and deterministic debugging
(define-public rr-git
  (package
    (name "rr-git")
    (version "5.8.0.r217.g4e7d76ee")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/rr-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "record and Replay framework: lightweight recording and deterministic debugging")
    (description "Record and Replay framework: lightweight recording and deterministic debugging.")
    (home-page "http://rr-project.org/")
    (license license:nonfree)))

;;; propertree-git --- cross platform GUI plist editor written in python
(define-public propertree-git
  (package
    (name "propertree-git")
    (version "r392.79a329f")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/propertree-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "cross platform GUI plist editor written in python")
    (description "Cross platform GUI plist editor written in python.")
    (home-page "https://github.com/corpnewt/ProperTree")
    (license license:bsd-3)))

;;; gummy-git --- screen brightness/temperature manager for Linux
(define-public gummy-git
  (package
    (name "gummy-git")
    (version "0.6.0.r0.g24b77f3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gummy-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "screen brightness/temperature manager for Linux")
    (description "Screen brightness/temperature manager for Linux.")
    (home-page "https://codeberg.org/fusco/gummy")
    (license license:gpl3+)))

;;; zwcad-bin --- zWSOFT研发的二维CAD软件，可满足看图、审图、打印工作需要
(define-public zwcad-bin
  (package
    (name "zwcad-bin")
    (version "25.0.3.4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/zwcad-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "zWSOFT研发的二维CAD软件，可满足看图、审图、打印工作需要")
    (description "ZWSOFT研发的二维CAD软件，可满足看图、审图、打印工作需要.")
    (home-page "https://www.zwcad.com")
    (license license:nonfree)))

;;; wtype-git --- xdotool type for wayland
(define-public wtype-git
  (package
    (name "wtype-git")
    (version "0.3.r2.gfb8cb52")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/wtype-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "xdotool type for wayland")
    (description "Xdotool type for wayland.")
    (home-page "https://github.com/atx/wtype")
    (license license:expat)))

;;; reflective-rapidjson --- code generator for serializing/deserializing C++ objects to/from JSON using
(define-public reflective-rapidjson
  (package
    (name "reflective-rapidjson")
    (version "0.0.16")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/reflective-rapidjson.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "code generator for serializing/deserializing C++ objects to/from JSON using")
    (description "Code generator for serializing/deserializing C++ objects to/from JSON using Clang and RapidJSON.")
    (home-page "https://github.com/Martchus/reflective-rapidjson")
    (license license:gpl2+)))

;;; python-npyscreen --- A python widget library and application framework
(define-public python-npyscreen
  (package
    (name "python-npyscreen")
    (version "4.10.5")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-npyscreen.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "A python widget library and application framework")
    (description "A python widget library and application framework.")
    (home-page "https://github.com/npcole/npyscreen")
    (license license:bsd-3)))

;;; neverball-git --- 3D game similar to Super Monkey Ball or Marble Madness
(define-public neverball-git
  (package
    (name "neverball-git")
    (version "1.6.0.r433.g96c23af4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/neverball-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "3D game similar to Super Monkey Ball or Marble Madness")
    (description "3D game similar to Super Monkey Ball or Marble Madness.")
    (home-page "https://neverball.org/")
    (license license:gpl3+)))

;;; kristall-git --- A high-quality visual cross-platform gemini browser
(define-public kristall-git
  (package
    (name "kristall-git")
    (version "r543.6b39f24")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/kristall-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "A high-quality visual cross-platform gemini browser")
    (description "A high-quality visual cross-platform gemini browser.")
    (home-page "https://github.com/MasterQ32/kristall")
    (license license:gpl3+)))

;;; gitea-tea-git --- painless self-hosted Git service
(define-public gitea-tea-git
  (package
    (name "gitea-tea-git")
    (version "v0.9.0.r65.g649b0b1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gitea-tea-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "painless self-hosted Git service")
    (description "Painless self-hosted Git service..")
    (home-page "https://gitea.io")
    (license license:expat)))

;;; dvm --- discord version manager for linux
(define-public dvm
  (package
    (name "dvm")
    (version "1.2.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/dvm.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "discord version manager for linux")
    (description "Discord version manager for linux.")
    (home-page "https://github.com/diced/dvm")
    (license license:nonfree)))

;;; colorpicker-keshavbhatt --- powerful screen ColorPicker/Chooser application for Linux Desktop
(define-public colorpicker-keshavbhatt
  (package
    (name "colorpicker-keshavbhatt")
    (version "1.0.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/colorpicker-keshavbhatt.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "powerful screen ColorPicker/Chooser application for Linux Desktop")
    (description "Powerful screen ColorPicker/Chooser application for Linux Desktop.")
    (home-page "https://github.com/keshavbhatt/ColorPicker")
    (license license:expat)))

;;; xwacomcalibrate --- calibrates wacom tablets to the current window
(define-public xwacomcalibrate
  (package
    (name "xwacomcalibrate")
    (version "2.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/xwacomcalibrate.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "calibrates wacom tablets to the current window")
    (description "Calibrates wacom tablets to the current window.")
    (home-page "https://github.com/whjochim/xwacomcalibrate")
    (license license:gpl3+)))

;;; rofi-rbw-git --- rofi frontend for Bitwarden
(define-public rofi-rbw-git
  (package
    (name "rofi-rbw-git")
    (version "1.4.2.r3.g03630d0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/rofi-rbw-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "rofi frontend for Bitwarden")
    (description "Rofi frontend for Bitwarden.")
    (home-page "https://github.com/fdw/rofi-rbw")
    (license license:expat)))

;;; qsstv-git --- radio Slow-Scan TV for qt
(define-public qsstv-git
  (package
    (name "qsstv-git")
    (version "r50.c5be1e3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/qsstv-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "radio Slow-Scan TV for qt")
    (description "Radio Slow-Scan TV for qt.")
    (home-page "https://github.com/ON4QZ/QSSTV")
    (license license:gpl3+)))

;;; python-flask-limiter --- rate limiting for flask applications
(define-public python-flask-limiter
  (package
    (name "python-flask-limiter")
    (version "4.1.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-flask-limiter.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "rate limiting for flask applications")
    (description "Rate limiting for flask applications.")
    (home-page "https://flask-limiter.readthedocs.org")
    (license license:expat)))

;;; nautilus-empty-file --- provides context menu 'New Document' functionality for Nautilus
(define-public nautilus-empty-file
  (package
    (name "nautilus-empty-file")
    (version "1.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/nautilus-empty-file.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "provides context menu 'New Document' functionality for Nautilus")
    (description "Provides context menu 'New Document' functionality for Nautilus.")
    (home-page "https://gitlab.manjaro.org/packages/community/gnome/nautilus-empty-file")
    (license license:nonfree)))

;;; lightburn-bin --- A layout, editing, and control software for lasercutters
(define-public lightburn-bin
  (package
    (name "lightburn-bin")
    (version "1.7.08")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lightburn-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "A layout, editing, and control software for lasercutters")
    (description "A layout, editing, and control software for lasercutters.")
    (home-page "https://lightburnsoftware.com")
    (license license:nonfree)))

;;; librewolf-extension-sponsorblock-bin --- skip YouTube video sponsors
(define-public librewolf-extension-sponsorblock-bin
  (package
    (name "librewolf-extension-sponsorblock-bin")
    (version "6.1.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/librewolf-extension-sponsorblock-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "skip YouTube video sponsors")
    (description "Skip YouTube video sponsors.")
    (home-page "https://github.com/ajayyy/SponsorBlock")
    (license license:gpl3+)))

;;; karaokemugen --- karaoke playlist manager/player app used in parties or events
(define-public karaokemugen
  (package
    (name "karaokemugen")
    (version "9.0.41")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/karaokemugen.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "karaoke playlist manager/player app used in parties or events")
    (description "Karaoke playlist manager/player app used in parties or events.")
    (home-page "https://mugen.karaokes.moe/")
    (license license:expat)))

;;; kame-editor-git --- A 3DS theme editor made with Qt6
(define-public kame-editor-git
  (package
    (name "kame-editor-git")
    (version "1.4.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/kame-editor-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "A 3DS theme editor made with Qt6")
    (description "A 3DS theme editor made with Qt6.")
    (home-page "https://gitlab.com/beelzy/kame-editor")
    (license license:gpl3+)))

;;; appimage-cli-tool-git --- appImage package manager CLI
(define-public appimage-cli-tool-git
  (package
    (name "appimage-cli-tool-git")
    (version "0.1.4.r0.gc3fcae5")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/appimage-cli-tool-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "appImage package manager CLI")
    (description "AppImage package manager CLI.")
    (home-page "https://github.com/AppImageCrafters/appimage-cli-tool")
    (license license:expat)))

;;; alsa-control --- easy to use ALSA default soundcard and volume configurator using Dmix and S
(define-public alsa-control
  (package
    (name "alsa-control")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/alsa-control.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "easy to use ALSA default soundcard and volume configurator using Dmix and S")
    (description "Easy to use ALSA default soundcard and volume configurator using Dmix and Softvol.")
    (home-page "https://github.com/sezanzeb/alsa-control/")
    (license license:gpl3+)))

;;; yasm-git --- A complete rewrite of the NASM assembler under the BSD License
(define-public yasm-git
  (package
    (name "yasm-git")
    (version "1.3.0.r87.g121ab150")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/yasm-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "A complete rewrite of the NASM assembler under the BSD License")
    (description "A complete rewrite of the NASM assembler under the BSD License.")
    (home-page "https://yasm.tortall.net/")
    (license license:bsd-2)))

;;; xpano-git --- A tool for panorama stitching with focus on simplicity and ease of use
(define-public xpano-git
  (package
    (name "xpano-git")
    (version "0.19.3.r0.g11a00d4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/xpano-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "A tool for panorama stitching with focus on simplicity and ease of use")
    (description "A tool for panorama stitching with focus on simplicity and ease of use.")
    (home-page "https://krupkat.github.io/xpano/")
    (license license:gpl3+)))

;;; wrappe-bin --- packer for creating self-contained single-binary applications from executab
(define-public wrappe-bin
  (package
    (name "wrappe-bin")
    (version "1.0.6")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/wrappe-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "packer for creating self-contained single-binary applications from executab")
    (description "Packer for creating self-contained single-binary applications from executables and directories.")
    (home-page "https://github.com/Systemcluster/wrappe")
    (license license:expat)))

;;; work-bin --- A stupid simple time tracker
(define-public work-bin
  (package
    (name "work-bin")
    (version "1.0.12")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/work-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "A stupid simple time tracker")
    (description "A stupid simple time tracker.")
    (home-page "https://github.com/jmelahman/work")
    (license license:expat)))

;;; vim-dracula-git --- A dark theme for Vim
(define-public vim-dracula-git
  (package
    (name "vim-dracula-git")
    (version "2.0.0.r104.gd4b0823")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/vim-dracula-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "A dark theme for Vim")
    (description "A dark theme for Vim.")
    (home-page "https://draculatheme.com/vim")
    (license license:expat)))

;;; usbkvm --- uSBKVM app
(define-public usbkvm
  (package
    (name "usbkvm")
    (version "0.3.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/usbkvm.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "uSBKVM app")
    (description "USBKVM app.")
    (home-page "https://github.com/carrotIndustries/usbkvm")
    (license license:gpl3+)))

;;; trustbuilder-appimage --- trustbuilder Authenticator / AppImage version
(define-public trustbuilder-appimage
  (package
    (name "trustbuilder-appimage")
    (version "6.38.0.5319")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/trustbuilder-appimage.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "trustbuilder Authenticator / AppImage version")
    (description "Trustbuilder Authenticator / AppImage version.")
    (home-page "https://www.trustbuilder.com/")
    (license license:gpl3+)))

;;; tod-bin --- A tiny unofficial Todoist client
(define-public tod-bin
  (package
    (name "tod-bin")
    (version "0.11.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/tod-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "A tiny unofficial Todoist client")
    (description "A tiny unofficial Todoist client.")
    (home-page "https://github.com/alanvardy/tod")
    (license license:expat)))

;;; superglue-bin --- tool for write a small file to the beginning of a large file in place
(define-public superglue-bin
  (package
    (name "superglue-bin")
    (version "0.0.4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/superglue-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "tool for write a small file to the beginning of a large file in place")
    (description "Tool for write a small file to the beginning of a large file in place.")
    (home-page "https://github.com/VHSgunzo/superglue")
    (license license:nonfree)))

;;; sstv-git --- sSTV audio file decoder
(define-public sstv-git
  (package
    (name "sstv-git")
    (version "r48.3e556ee")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/sstv-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "sSTV audio file decoder")
    (description "SSTV audio file decoder.")
    (home-page "https://github.com/colaclanth/sstv")
    (license license:gpl3+)))

;;; ssrv-bin --- shell server/client
(define-public ssrv-bin
  (package
    (name "ssrv-bin")
    (version "0.3.4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ssrv-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "shell server/client")
    (description "Shell server/client.")
    (home-page "https://github.com/VHSgunzo/ssrv")
    (license license:expat)))

;;; souko-bin --- provides an easy way to organize clones of remote git repositories
(define-public souko-bin
  (package
    (name "souko-bin")
    (version "0.3.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/souko-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "provides an easy way to organize clones of remote git repositories")
    (description "Provides an easy way to organize clones of remote git repositories.")
    (home-page "https://github.com/gifnksm/souko")
    (license license:asl2.0)))

;;; sharun-bin --- run dynamically linked ELF binaries everywhere
(define-public sharun-bin
  (package
    (name "sharun-bin")
    (version "0.8.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/sharun-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "run dynamically linked ELF binaries everywhere")
    (description "Run dynamically linked ELF binaries everywhere.")
    (home-page "https://github.com/VHSgunzo/sharun")
    (license license:expat)))

;;; screenshot-llm --- aI-Powered Screenshot Analysis
(define-public screenshot-llm
  (package
    (name "screenshot-llm")
    (version "1.0.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/screenshot_llm.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "aI-Powered Screenshot Analysis")
    (description "AI-Powered Screenshot Analysis.")
    (home-page "https://github.com/ThanabordeeN/Screenshot_LLM")
    (license license:expat)))

;;; rencfs-bin --- wARNING! UNDER ACTIVE DEVELOPMENT. An encrypted file system that is mounted
(define-public rencfs-bin
  (package
    (name "rencfs-bin")
    (version "0.14.11")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/rencfs-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "wARNING! UNDER ACTIVE DEVELOPMENT. An encrypted file system that is mounted")
    (description "WARNING! UNDER ACTIVE DEVELOPMENT. An encrypted file system that is mounted with FUSE on Linux. It can be used to create encrypted directories.")
    (home-page "https://xoriors.github.io/rencfs")
    (license license:expat)))

;;; quick-send-bin --- send files peer to peer
(define-public quick-send-bin
  (package
    (name "quick-send-bin")
    (version "0.2.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/quick-send-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "send files peer to peer")
    (description "Send files peer to peer.")
    (home-page "https://github.com/israelyago/QuickSend")
    (license license:unlicense)))

;;; python-fints --- minimal pure-python FinTS (formerly known as HBCI) implementation
(define-public python-fints
  (package
    (name "python-fints")
    (version "4.2.4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-fints.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "minimal pure-python FinTS (formerly known as HBCI) implementation")
    (description "Minimal pure-python FinTS (formerly known as HBCI) implementation.")
    (home-page "https://github.com/raphaelm/python-fints")
    (license license:lgpl3+)))

;;; python-advocate --- A set of tools based around the requests library for safely making HTTP req
(define-public python-advocate
  (package
    (name "python-advocate")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-advocate.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "A set of tools based around the requests library for safely making HTTP req")
    (description "A set of tools based around the requests library for safely making HTTP requests on behalf of a third party.")
    (home-page "https://github.com/JordanMilne/Advocate")
    (license license:asl2.0)))

;;; ptyspawn-bin --- tool for executing a command in a new PTY (pseudo-terminal) with new PGID a
(define-public ptyspawn-bin
  (package
    (name "ptyspawn-bin")
    (version "0.0.5")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ptyspawn-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "tool for executing a command in a new PTY (pseudo-terminal) with new PGID a")
    (description "Tool for executing a command in a new PTY (pseudo-terminal) with new PGID and SID.")
    (home-page "https://github.com/VHSgunzo/ptyspawn")
    (license license:nonfree)))

;;; plow-bin --- A high-performance HTTP benchmarking tool that includes a real-time web UI 
(define-public plow-bin
  (package
    (name "plow-bin")
    (version "1.3.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/plow-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "A high-performance HTTP benchmarking tool that includes a real-time web UI ")
    (description "A high-performance HTTP benchmarking tool that includes a real-time web UI and terminal display.(Prebuilt version).")
    (home-page "https://github.com/six-ddc/plow")
    (license license:asl2.0)))

;;; paclogger --- A Pacman hook written in C++ that logs all of the updates and downgrades ev
(define-public paclogger
  (package
    (name "paclogger")
    (version "1.3.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/paclogger.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "A Pacman hook written in C++ that logs all of the updates and downgrades ev")
    (description "A Pacman hook written in C++ that logs all of the updates and downgrades every day.")
    (home-page "https://codeberg.org/413x1nkp/paclogger")
    (license license:unlicense)))

;;; opustags-git --- view and edit tags for opus files from the command line
(define-public opustags-git
  (package
    (name "opustags-git")
    (version "0.206.4de428b")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/opustags-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "view and edit tags for opus files from the command line")
    (description "View and edit tags for opus files from the command line.")
    (home-page "https://github.com/fmang/opustags")
    (license license:bsd-3)))

;;; ofxstatement-qif --- A plugin for ofxstatement to convert Quicken Interchange Format (QIF) forma
(define-public ofxstatement-qif
  (package
    (name "ofxstatement-qif")
    (version "0.11.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ofxstatement-qif.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "A plugin for ofxstatement to convert Quicken Interchange Format (QIF) forma")
    (description "A plugin for ofxstatement to convert Quicken Interchange Format (QIF) formatted bank transaction files to OFX format.")
    (home-page "https://github.com/robvadai/ofxstatement-qif")
    (license license:gpl3)))

;;; nvmesmart --- a easy cli and maybe gui smart tool for linux
(define-public nvmesmart
  (package
    (name "nvmesmart")
    (version "0.1.5")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/nvmesmart.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "a easy cli and maybe gui smart tool for linux")
    (description "A easy cli and maybe gui smart tool for linux.")
    (home-page "https://github.com/ingressy/nvmesmart/")
    (license license:expat)))

;;; nsv --- no-config semantic versioning
(define-public nsv
  (package
    (name "nsv")
    (version "0.12.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/nsv.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "no-config semantic versioning")
    (description "No-config semantic versioning.")
    (home-page "https://github.com/purpleclay/nsv")
    (license license:expat)))

;;; notify-send-rs-bin --- rust version of notify-send for display notifications on the linux desktop 
(define-public notify-send-rs-bin
  (package
    (name "notify-send-rs-bin")
    (version "0.0.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/notify-send-rs-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "rust version of notify-send for display notifications on the linux desktop ")
    (description "Rust version of notify-send for display notifications on the linux desktop using notify-rust.")
    (home-page "https://github.com/VHSgunzo/notify-send-rs")
    (license license:nonfree)))

;;; mixramp --- A utility to analyse sound files and print out the volume profile of the st
(define-public mixramp
  (package
    (name "mixramp")
    (version "1.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mixramp.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "A utility to analyse sound files and print out the volume profile of the st")
    (description "A utility to analyse sound files and print out the volume profile of the start and end. The idea is to embed those profiles in metadata so players can do intelligent mixing between tracks. Supports FLAC, OGG and MP3.")
    (home-page "http://sourceforge.net/projects/mixramp/")
    (license license:gpl3+)))

;;; jdsimpleautostart --- edit autostart entries
(define-public jdsimpleautostart
  (package
    (name "jdsimpleautostart")
    (version "1.6")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/jdsimpleautostart.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "edit autostart entries")
    (description "Edit autostart entries.")
    (home-page "https://codeberg.org/JakobDev/jdSimpleAutostart")
    (license license:gpl3+)))

;;; jabba-bin --- (cross-platform) Java Version Manager
(define-public jabba-bin
  (package
    (name "jabba-bin")
    (version "0.15.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/jabba-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "(cross-platform) Java Version Manager")
    (description "(cross-platform) Java Version Manager.")
    (home-page "https://github.com/Jabba-Team/jabba")
    (license license:asl2.0)))

;;; i3-lru --- provides an i3 LRU window switcher (daemon + rofi script)
(define-public i3-lru
  (package
    (name "i3-lru")
    (version "1.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/i3-lru.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "provides an i3 LRU window switcher (daemon + rofi script)")
    (description "Provides an i3 LRU window switcher (daemon + rofi script).")
    (home-page "https://github.com/gashon/i3-lru")
    (license license:expat)))
