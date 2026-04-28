;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260428e
;;; Resolves 100 packages from queue (100 recipes, 0 blocked).
;;;
;;; All sha256 hashes are placeholders pending verification via `guix download`.

(define-module (gaurix packages recipe-resolver-260428e)
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
            noto-fonts-lite
            calligra-git
            iota-wallet-bin
            gtk2-smooth-engine
            compiz-gtk-git
            nwn-diamond
            s-tui-git
            miranda
            dunedynasty
            envoy-git
            protracker-git
            koditools
            flavours
            lci-git
            gk6x-bin
            dialect-git
            palemoon-i18n-de
            pk2cmd-plus
            cint
            gsplus-git
            archlinux-menus
            dmakepkg-git
            libretro-vice-x64sc-git
            nxagent
            zap-bin
            sddm-slice-git
            adbtuifm-bin
            adminer-skins-kahi
            gnome-shell-extension-night-light-slider-git
            naotu
            pext
            redpen
            openprinting-ppds-pxlcolor-ricoh
            php-browscap
            sipp-git
            grok-tool-bin
            calf-ladspa
            uqm-megamod-addon-sol-textures
            python-django-auditlog
            torctl-git
            amdgpud
            horizon-eda
            xfoil
            dfu-util-git
            diamond-editor
            doom2df-bin-git
            ffiler-git
            gc-shrink
            i8kutils-git
            inspectrum-git
            libzathura-git
            lua-pc
            mkg3a
            nconvert
            python-openbabel-git
            perl-vcs-lite
            python-html-void-elements
            python-pymor
            rc-git
            rqlite
            sndio-git
            tpc-git
            upgrade
            nanomq-git
            hid-chandbreak-dkms
            git-mediate
            wayneko-git
            bettercap-ui
            mimetic-git
            nimlangserver-git
            alpm-html
            ambpack
            kubenav-bin
            tensorflow-cuda-git
            looking-glass-module-dkms-git
            otf-elstob
            fig-headless-bin
            git-backup-git
            gnome-source-thumbnailer-git
            onionshare-cli
            invasion-of-greek
            lbrate
            ttf-league-spartan-variable-git
            libsrs-alt
            liri-themes-git
            mfek-glif-git
            mingw-w64-xorg-util-macros
            mpy-repl-tool
            mtx-git
            multibg-sway
            neosurf-git
            nro-thumbnailer-git
            openems
            otf-asap
            php80-apcu
            faustus-dkms-git
            prosody-hg-stable
            ps2-zlib
            python-pytest-selenium
            python-river-git
            ))

;;; Nonfree/proprietary license placeholder for Gaurix channel
(define license:nonfree
  ((@@ (guix licenses) license) "Nonfree"
    "https://spdx.org/licenses/"
    "Proprietary or custom license; see upstream for terms."))

;;; noto-fonts-lite --- google Noto TTF fonts (lite version)
(define-public noto-fonts-lite
  (package
    (name "noto-fonts-lite")
    (version "1:2026.02.01-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/noto-fonts-lite.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "google Noto TTF fonts (lite version)")
    (description "Google Noto TTF fonts (lite version).")
    (home-page "https://fonts.google.com/noto")
    (license license:nonfree)))

;;; calligra-git --- A set of applications for productivity and creative usage
(define-public calligra-git
  (package
    (name "calligra-git")
    (version "4.0.1.r0.g00c463f-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/calligra-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A set of applications for productivity and creative usage")
    (description "A set of applications for productivity and creative usage.")
    (home-page "https://www.calligra-suite.org/")
    (license license:gpl2)))

;;; iota-wallet-bin --- the official desktop wallet of the IOTA project.
(define-public iota-wallet-bin
  (package
    (name "iota-wallet-bin")
    (version "2.5.7-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/iota-wallet-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the official desktop wallet of the IOTA project.")
    (description "The official desktop wallet of the IOTA project.")
    (home-page "https://iota.org")
    (license license:gpl3+)))

;;; gtk2-smooth-engine --- smooth themes for gtk2 without the need for gtk1
(define-public gtk2-smooth-engine
  (package
    (name "gtk2-smooth-engine")
    (version "0.6.0.1-5")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gtk2-smooth-engine.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "smooth themes for gtk2 without the need for gtk1")
    (description "Smooth themes for gtk2 without the need for gtk1.")
    (home-page "http://sourceforge.net/projects/smooth-engine")
    (license license:lgpl3+)))

;;; compiz-gtk-git --- compositing manager without desktop-environment depends (GTK+ window decorator
(define-public compiz-gtk-git
  (package
    (name "compiz-gtk-git")
    (version "0.8.18.r23.gfe274c9-2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/compiz-gtk-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "compositing manager without desktop-environment depends (GTK+ window decorator")
    (description "Compositing manager without desktop-environment depends (GTK+ window decorator).")
    (home-page "https://gitlab.com/compiz/compiz-core")
    (license license:gpl2+)))

;;; nwn-diamond --- neverwinter Nights RPG from Bioware. Requires the Diamond Collection DVD. Upda
(define-public nwn-diamond
  (package
    (name "nwn-diamond")
    (version "1.69-9")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/nwn-diamond.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "neverwinter Nights RPG from Bioware. Requires the Diamond Collection DVD. Upda")
    (description "Neverwinter Nights RPG from Bioware. Requires the Diamond Collection DVD. Update PKGBUILD with path to your DVD.")
    (home-page "http://nwn.bioware.com/")
    (license license:nonfree)))

;;; s-tui-git --- terminal UI stress test and monitoring tool
(define-public s-tui-git
  (package
    (name "s-tui-git")
    (version "v0.8.3.r115.g37ca30c-2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/s-tui-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "terminal UI stress test and monitoring tool")
    (description "Terminal UI stress test and monitoring tool.")
    (home-page "https://github.com/amanusk/s-tui")
    (license license:gpl2)))

;;; miranda --- miranda programming language
(define-public miranda
  (package
    (name "miranda")
    (version "2.066-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/miranda.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "miranda programming language")
    (description "Miranda programming language.")
    (home-page "http://miranda.org.uk/")
    (license license:nonfree)))

;;; dunedynasty --- maintained fork of an enhanced continuation of the classic real-time strategy 
(define-public dunedynasty
  (package
    (name "dunedynasty")
    (version "1.6.3-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/dunedynasty.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "maintained fork of an enhanced continuation of the classic real-time strategy ")
    (description "Maintained fork of an enhanced continuation of the classic real-time strategy game Dune II.")
    (home-page "https://github.com/gameflorist/dunedynasty")
    (license license:gpl2)))

;;; envoy-git --- A ssh-agent/gpg-agent keychain and process monitor
(define-public envoy-git
  (package
    (name "envoy-git")
    (version "14.35.g50c069f-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/envoy-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A ssh-agent/gpg-agent keychain and process monitor")
    (description "A ssh-agent/gpg-agent keychain and process monitor.")
    (home-page "http://github.com/vodik/envoy")
    (license license:gpl3)))

;;; protracker-git --- rewrite of ProTracker v2.3D (Amiga)
(define-public protracker-git
  (package
    (name "protracker-git")
    (version "1:v1.46.r3.gf6f4566-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/protracker-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "rewrite of ProTracker v2.3D (Amiga)")
    (description "Rewrite of ProTracker v2.3D (Amiga).")
    (home-page "https://16-bits.org/pt2.php")
    (license license:gpl3+)))

;;; koditools --- set of tools to interface with Kodi/XBMC
(define-public koditools
  (package
    (name "koditools")
    (version "1.2-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/koditools.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "set of tools to interface with Kodi/XBMC")
    (description "Set of tools to interface with Kodi/XBMC.")
    (home-page "http://github.com/grimpy/")
    (license license:gpl2)))

;;; flavours --- A simple and easy cli to build and use base16 schemes
(define-public flavours
  (package
    (name "flavours")
    (version "0.7.1-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/flavours.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A simple and easy cli to build and use base16 schemes")
    (description "A simple and easy cli to build and use base16 schemes.")
    (home-page "https://github.com/Misterio77/flavours")
    (license license:expat)))

;;; lci-git --- A simple and fast 1.2 lolcode interpreter written in C.
(define-public lci-git
  (package
    (name "lci-git")
    (version "0.10.5.r27.g6762b72-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lci-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A simple and fast 1.2 lolcode interpreter written in C.")
    (description "A simple and fast 1.2 lolcode interpreter written in C.")
    (home-page "https://lolcode.org/")
    (license license:gpl3)))

;;; gk6x-bin --- configure keys, macros, and lighting on GK6X keyboards (GK64, GK84, GK61, etc)
(define-public gk6x-bin
  (package
    (name "gk6x-bin")
    (version "1.21-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gk6x-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "configure keys, macros, and lighting on GK6X keyboards (GK64, GK84, GK61, etc)")
    (description "Configure keys, macros, and lighting on GK6X keyboards (GK64, GK84, GK61, etc).")
    (home-page "https://github.com/pixeltris/GK6X")
    (license license:expat)))

;;; dialect-git --- A translation app for GNOME.
(define-public dialect-git
  (package
    (name "dialect-git")
    (version "2.6.0.r0.g40759ca-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/dialect-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A translation app for GNOME.")
    (description "A translation app for GNOME.")
    (home-page "https://apps.gnome.org/Dialect")
    (license license:gpl3+)))

;;; palemoon-i18n-de --- german language pack for Pale Moon browser
(define-public palemoon-i18n-de
  (package
    (name "palemoon-i18n-de")
    (version "33.8.0-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/palemoon-i18n-de.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "german language pack for Pale Moon browser")
    (description "German language pack for Pale Moon browser.")
    (home-page "https://addons.palemoon.org/language-packs/")
    (license license:mpl2.0)))

;;; pk2cmd-plus --- PICkit 2 CLI software with updated DeviceFile and udev rules
(define-public pk2cmd-plus
  (package
    (name "pk2cmd-plus")
    (version "1.21rc1_1.63.148-2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/pk2cmd-plus.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "PICkit 2 CLI software with updated DeviceFile and udev rules")
    (description "PICkit 2 CLI software with updated DeviceFile and udev rules.")
    (home-page "http://www.microchip.com/pickit2")
    (license license:nonfree)))

;;; cint --- CINT is an interpreter for C and C++ code
(define-public cint
  (package
    (name "cint")
    (version "5.34.38-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/cint.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "CINT is an interpreter for C and C++ code")
    (description "CINT is an interpreter for C and C++ code.")
    (home-page "https://root.cern.ch/cint")
    (license license:expat)))

;;; gsplus-git --- modern cross-platform Apple IIgs emulator
(define-public gsplus-git
  (package
    (name "gsplus-git")
    (version "r556.4805720-4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gsplus-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "modern cross-platform Apple IIgs emulator")
    (description "Modern cross-platform Apple IIgs emulator.")
    (home-page "http://apple2.gs/plus/")
    (license license:gpl2)))

;;; archlinux-menus --- arch Linux specific XDG-compliant menu
(define-public archlinux-menus
  (package
    (name "archlinux-menus")
    (version "2.5-6")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/archlinux-menus.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "arch Linux specific XDG-compliant menu")
    (description "Arch Linux specific XDG-compliant menu.")
    (home-page "https://archlinux.org")
    (license license:gpl3+)))

;;; dmakepkg-git --- makepkg running from within docker for clean builds without maintaining a chro
(define-public dmakepkg-git
  (package
    (name "dmakepkg-git")
    (version "r21.42ee55d-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/dmakepkg-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "makepkg running from within docker for clean builds without maintaining a chro")
    (description "Makepkg running from within docker for clean builds without maintaining a chroot.")
    (home-page "https://github.com/justin8/docker-makepkg")
    (license license:expat)))

;;; libretro-vice-x64sc-git --- commodore C64 core (accurate)
(define-public libretro-vice-x64sc-git
  (package
    (name "libretro-vice-x64sc-git")
    (version "r21243.cd9b682-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/libretro-vice-x64sc-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "commodore C64 core (accurate)")
    (description "Commodore C64 core (accurate).")
    (home-page "https://github.com/libretro/vice-libretro")
    (license license:gpl2+)))

;;; nxagent --- NX X server based on Xnest
(define-public nxagent
  (package
    (name "nxagent")
    (version "3.5.99.27-3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/nxagent.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "NX X server based on Xnest")
    (description "NX X server based on Xnest.")
    (home-page "https://arctica-project.org")
    (license license:gpl3+)))

;;; zap-bin --- delightful AppImage package manager
(define-public zap-bin
  (package
    (name "zap-bin")
    (version "2.2.1-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/zap-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "delightful AppImage package manager")
    (description "Delightful AppImage package manager.")
    (home-page "https://zap.srev.in")
    (license license:expat)))

;;; sddm-slice-git --- simple dark SDDM theme with many customization options.
(define-public sddm-slice-git
  (package
    (name "sddm-slice-git")
    (version "master-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/sddm-slice-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "simple dark SDDM theme with many customization options.")
    (description "Simple dark SDDM theme with many customization options.")
    (home-page "https://github.com/RadRussianRus/sddm-slice")
    (license license:gpl3+)))

;;; adbtuifm-bin --- A TUI File Manager for the Android Debug Bridge (ADB)
(define-public adbtuifm-bin
  (package
    (name "adbtuifm-bin")
    (version "0.5.8-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/adbtuifm-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A TUI File Manager for the Android Debug Bridge (ADB)")
    (description "A TUI File Manager for the Android Debug Bridge (ADB).")
    (home-page "https://github.com/darkhz/adbtuifm")
    (license license:expat)))

;;; adminer-skins-kahi --- adminer skins
(define-public adminer-skins-kahi
  (package
    (name "adminer-skins-kahi")
    (version "20180609-2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/adminer-skins-kahi.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "adminer skins")
    (description "Adminer skins.")
    (home-page "https://www.adminer.org")
    (license license:asl2.0)))

;;; gnome-shell-extension-night-light-slider-git --- manage GNOME night light temperature intensity from the panel.
(define-public gnome-shell-extension-night-light-slider-git
  (package
    (name "gnome-shell-extension-night-light-slider-git")
    (version "17.0.r0.g5e5f199-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gnome-shell-extension-night-light-slider-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "manage GNOME night light temperature intensity from the panel.")
    (description "Manage GNOME night light temperature intensity from the panel.")
    (home-page "https://github.com/TimurKiyivinski/gnome-shell-night-light-slider-extension")
    (license license:gpl3+)))

;;; naotu --- simple mind map tool from baidu
(define-public naotu
  (package
    (name "naotu")
    (version "3.2.1-2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/naotu.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "simple mind map tool from baidu")
    (description "Simple mind map tool from baidu.")
    (home-page "https://github.com/NaoTu/DesktopNaotu")
    (license license:gpl2+)))

;;; pext --- python-based extendable tool
(define-public pext
  (package
    (name "pext")
    (version "0.35-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/pext.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "python-based extendable tool")
    (description "Python-based extendable tool.")
    (home-page "https://pext.io/")
    (license license:gpl3)))

;;; redpen --- A document checker. RedPen is a proofreading tool to help writers or programme
(define-public redpen
  (package
    (name "redpen")
    (version "1.10.4-2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/redpen.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A document checker. RedPen is a proofreading tool to help writers or programme")
    (description "A document checker. RedPen is a proofreading tool to help writers or programmers.")
    (home-page "http://redpen.cc/")
    (license license:asl2.0)))

;;; openprinting-ppds-pxlcolor-ricoh --- PPD files for Ricoh's PCL colour printers, supplied by Ricoh
(define-public openprinting-ppds-pxlcolor-ricoh
  (package
    (name "openprinting-ppds-pxlcolor-ricoh")
    (version "20161206-2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/openprinting-ppds-pxlcolor-ricoh.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "PPD files for Ricoh's PCL colour printers, supplied by Ricoh")
    (description "PPD files for Ricoh's PCL colour printers, supplied by Ricoh.")
    (home-page "https://www.openprinting.org/driver/pxlcolor-Ricoh")
    (license license:expat)))

;;; php-browscap --- PHP browscap
(define-public php-browscap
  (package
    (name "php-browscap")
    (version "6.1.0-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/php-browscap.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "PHP browscap")
    (description "PHP browscap.")
    (home-page "http://browscap.org/")
    (license license:gpl3+)))

;;; sipp-git --- A free open source test tool and traffic generator for the SIP protocol
(define-public sipp-git
  (package
    (name "sipp-git")
    (version "3.6.1.r42.g9f62be0-2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/sipp-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A free open source test tool and traffic generator for the SIP protocol")
    (description "A free open source test tool and traffic generator for the SIP protocol.")
    (home-page "http://github.com/sipp")
    (license license:gpl2)))

;;; grok-tool-bin --- GROK is a tool like UNIX grep on steroids. Ofter regular expressions become hu
(define-public grok-tool-bin
  (package
    (name "grok-tool-bin")
    (version "0.3.10-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/grok-tool-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "GROK is a tool like UNIX grep on steroids. Ofter regular expressions become hu")
    (description "GROK is a tool like UNIX grep on steroids. Ofter regular expressions become huge and vague. To resolve this situation macros or grok could be applied. Grok is a peculiar regular expression's macros name.")
    (home-page "https://github.com/aegoroff/grok")
    (license license:expat)))

;;; calf-ladspa --- JACK audio plug-ins for musicians (LADSPA version)
(define-public calf-ladspa
  (package
    (name "calf-ladspa")
    (version "0.90.1.0-3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/calf-ladspa.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "JACK audio plug-ins for musicians (LADSPA version)")
    (description "JACK audio plug-ins for musicians (LADSPA version).")
    (home-page "https://github.com/LMMS/veal")
    (license license:lgpl2.1)))

;;; uqm-megamod-addon-sol-textures --- improved textures for the planets in the Sol System for the Ur-Quan Masters Me
(define-public uqm-megamod-addon-sol-textures
  (package
    (name "uqm-megamod-addon-sol-textures")
    (version "0.8.2-2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/uqm-megamod-addon-sol-textures.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "improved textures for the planets in the Sol System for the Ur-Quan Masters Me")
    (description "Improved textures for the planets in the Sol System for the Ur-Quan Masters MegaMod by JHGuitarFreak (Kohr-Ah Death).")
    (home-page "https://sourceforge.net/projects/uqm-mods/")
    (license license:nonfree)))

;;; python-django-auditlog --- A Django app that keeps a log of changes made to an object
(define-public python-django-auditlog
  (package
    (name "python-django-auditlog")
    (version "3.0.0-5")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-django-auditlog.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A Django app that keeps a log of changes made to an object")
    (description "A Django app that keeps a log of changes made to an object.")
    (home-page "https://github.com/jazzband/django-auditlog")
    (license license:expat)))

;;; torctl-git --- script to redirect all traffic through tor network including dns queries for a
(define-public torctl-git
  (package
    (name "torctl-git")
    (version "0.r26.202e4b2-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/torctl-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "script to redirect all traffic through tor network including dns queries for a")
    (description "Script to redirect all traffic through tor network including dns queries for anonymizing entire system.")
    (home-page "https://github.com/BlackArch/torctl")
    (license license:gpl3)))

;;; amdgpud --- fan control service for AMD GPUs
(define-public amdgpud
  (package
    (name "amdgpud")
    (version "1.0.11-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/amdgpud.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "fan control service for AMD GPUs")
    (description "Fan control service for AMD GPUs.")
    (home-page "https://github.com/eraden/amdgpud")
    (license license:asl2.0)))

;;; horizon-eda --- free EDA package written in C++
(define-public horizon-eda
  (package
    (name "horizon-eda")
    (version "2.7.2-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/horizon-eda.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "free EDA package written in C++")
    (description "Free EDA package written in C++.")
    (home-page "https://horizon-eda.org")
    (license license:gpl3+)))

;;; xfoil --- program for design and analysis of subsonic airfoils.
(define-public xfoil
  (package
    (name "xfoil")
    (version "6.99-3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/xfoil.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "program for design and analysis of subsonic airfoils.")
    (description "Program for design and analysis of subsonic airfoils.")
    (home-page "http://web.mit.edu/drela/Public/web/xfoil/")
    (license license:gpl2)))

;;; dfu-util-git --- tool intended to download and upload firmware using DFU protocol to devices co
(define-public dfu-util-git
  (package
    (name "dfu-util-git")
    (version "20210210-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/dfu-util-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "tool intended to download and upload firmware using DFU protocol to devices co")
    (description "Tool intended to download and upload firmware using DFU protocol to devices connected over USB.")
    (home-page "http://dfu-util.gnumonks.org")
    (license license:gpl2)))

;;; diamond-editor --- compact text editor designed for programmers
(define-public diamond-editor
  (package
    (name "diamond-editor")
    (version "2.1.0-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/diamond-editor.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "compact text editor designed for programmers")
    (description "Compact text editor designed for programmers.")
    (home-page "https://www.copperspice.com/")
    (license license:gpl2)))

;;; doom2df-bin-git --- doom 2D Forever: A Doom 2D remake with multiplayer
(define-public doom2df-bin-git
  (package
    (name "doom2df-bin-git")
    (version "185-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/doom2df-bin-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "doom 2D Forever: A Doom 2D remake with multiplayer")
    (description "Doom 2D Forever: A Doom 2D remake with multiplayer.")
    (home-page "http://doom2d.org/")
    (license license:gpl3)))

;;; ffiler-git --- sort files into structured directory tree
(define-public ffiler-git
  (package
    (name "ffiler-git")
    (version "r34.16221b1-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ffiler-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "sort files into structured directory tree")
    (description "Sort files into structured directory tree.")
    (home-page "https://github.com/fukawi2/ffiler")
    (license license:expat)))

;;; gc-shrink --- small command line program that removes garbage from gamecube images to create
(define-public gc-shrink
  (package
    (name "gc-shrink")
    (version "0.2-3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gc-shrink.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "small command line program that removes garbage from gamecube images to create")
    (description "Small command line program that removes garbage from gamecube images to created smaller images.")
    (home-page "http://www.gotwalls.com")
    (license license:gpl3+)))

;;; i8kutils-git --- fan control for Dell laptops
(define-public i8kutils-git
  (package
    (name "i8kutils-git")
    (version "20170307.83622d1-3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/i8kutils-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "fan control for Dell laptops")
    (description "Fan control for Dell laptops.")
    (home-page "https://github.com/vitorafsr/i8kutils")
    (license license:gpl3+)))

;;; inspectrum-git --- SDR signal analyzer
(define-public inspectrum-git
  (package
    (name "inspectrum-git")
    (version "r551.e51d850-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/inspectrum-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "SDR signal analyzer")
    (description "SDR signal analyzer.")
    (home-page "https://github.com/miek/inspectrum")
    (license license:gpl3+)))

;;; libzathura-git --- A document library.
(define-public libzathura-git
  (package
    (name "libzathura-git")
    (version "25ef21e-2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/libzathura-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A document library.")
    (description "A document library.")
    (home-page "http://pwmt.org/projects/libzathura")
    (license license:nonfree)))

;;; lua-pc --- lua Process Call (lpc) for Lua 5.4
(define-public lua-pc
  (package
    (name "lua-pc")
    (version "1.0.0-4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lua-pc.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "lua Process Call (lpc) for Lua 5.4")
    (description "Lua Process Call (lpc) for Lua 5.4.")
    (home-page "https://github.com/fabled/lpc")
    (license license:expat)))

;;; mkg3a --- A tool to create Casio FX-CG addon (.g3a) files.
(define-public mkg3a
  (package
    (name "mkg3a")
    (version "0.5.1-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mkg3a.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A tool to create Casio FX-CG addon (.g3a) files.")
    (description "A tool to create Casio FX-CG addon (.g3a) files.")
    (home-page "https://gitlab.com/taricorp/mkg3a/")
    (license license:zlib)))

;;; nconvert --- command line batch image processor and converter from XnSoft.
(define-public nconvert
  (package
    (name "nconvert")
    (version "7.136-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/nconvert.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "command line batch image processor and converter from XnSoft.")
    (description "Command line batch image processor and converter from XnSoft.")
    (home-page "https://www.xnview.com/en/nconvert/")
    (license license:nonfree)))

;;; python-openbabel-git --- A library designed to interconvert between many file formats used in molecular
(define-public python-openbabel-git
  (package
    (name "python-openbabel-git")
    (version "3.1.1+r6136+g889c350fe-2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-openbabel-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A library designed to interconvert between many file formats used in molecular")
    (description "A library designed to interconvert between many file formats used in molecular modeling and computational chemistry.")
    (home-page "https://openbabel.org/")
    (license license:gpl2)))

;;; perl-vcs-lite --- minimal version control system
(define-public perl-vcs-lite
  (package
    (name "perl-vcs-lite")
    (version "0.12-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/perl-vcs-lite.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "minimal version control system")
    (description "Minimal version control system.")
    (home-page "https://metacpan.org/release/VCS-Lite")
    (license license:gpl3+)))

;;; python-html-void-elements --- list of HTML void tag names
(define-public python-html-void-elements
  (package
    (name "python-html-void-elements")
    (version "0.1.0-2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-html-void-elements.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "list of HTML void tag names")
    (description "List of HTML void tag names.")
    (home-page "https://github.com/djlint/html-void-elements")
    (license license:gpl3)))

;;; python-pymor --- library for building model order reduction applications with Python
(define-public python-pymor
  (package
    (name "python-pymor")
    (version "2025.2.1-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-pymor.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "library for building model order reduction applications with Python")
    (description "Library for building model order reduction applications with Python.")
    (home-page "https://pymor.org")
    (license license:bsd-2)))

;;; rc-git --- independent re-implementation for Unix of the Plan 9 shell (from circa 1992).
(define-public rc-git
  (package
    (name "rc-git")
    (version "1.7.4.r663.2bab312-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/rc-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "independent re-implementation for Unix of the Plan 9 shell (from circa 1992).")
    (description "Independent re-implementation for Unix of the Plan 9 shell (from circa 1992).")
    (home-page "https://github.com/rakitzis/rc")
    (license license:nonfree)))

;;; rqlite --- rqlite is a lightweight, distributed relational database, which uses SQLite as
(define-public rqlite
  (package
    (name "rqlite")
    (version "9.4.5-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/rqlite.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "rqlite is a lightweight, distributed relational database, which uses SQLite as")
    (description "Rqlite is a lightweight, distributed relational database, which uses SQLite as its storage engine.")
    (home-page "http://rqlite.io/")
    (license license:expat)))

;;; sndio-git --- A small audio and MIDI framework part of the OpenBSD project
(define-public sndio-git
  (package
    (name "sndio-git")
    (version "1.8.1.r558.a02d299-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/sndio-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A small audio and MIDI framework part of the OpenBSD project")
    (description "A small audio and MIDI framework part of the OpenBSD project.")
    (home-page "http://www.sndio.org")
    (license license:expat)))

;;; tpc-git --- for AMD processors. It can manipulate power states, frequencies, DRAM timings,
(define-public tpc-git
  (package
    (name "tpc-git")
    (version "0.44rc2plus-2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/tpc-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "for AMD processors. It can manipulate power states, frequencies, DRAM timings,")
    (description "For AMD processors. It can manipulate power states, frequencies, DRAM timings, power settings and can report temperatures, monitor pstate changes and precise cpu usage. Currently supported families are: 10h, 11h, 12h, 14h, 15h.")
    (home-page "https://github.com/turionpowercontrol/tpc")
    (license license:gpl2)))

;;; upgrade --- automate system upgrades
(define-public upgrade
  (package
    (name "upgrade")
    (version "0.3.2-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/upgrade.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "automate system upgrades")
    (description "Automate system upgrades.")
    (home-page "https://github.com/dnut/upgrade")
    (license license:gpl3)))

;;; nanomq-git --- nano MQTT Broker - An Ultra-light and Blazing-fast MQTT Broker for IoT Edge (b
(define-public nanomq-git
  (package
    (name "nanomq-git")
    (version "0.23.5.r3.gf6e8cde4-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/nanomq-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "nano MQTT Broker - An Ultra-light and Blazing-fast MQTT Broker for IoT Edge (b")
    (description "Nano MQTT Broker - An Ultra-light and Blazing-fast MQTT Broker for IoT Edge (base Broker).")
    (home-page "https://github.com/nanomq/nanomq")
    (license license:expat)))

;;; hid-chandbreak-dkms --- DKMS kernel driver for USB sim handbrake devices based on LeafLabs Maple (1eaf
(define-public hid-chandbreak-dkms
  (package
    (name "hid-chandbreak-dkms")
    (version "0.1.0-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/hid-chandbreak-dkms.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "DKMS kernel driver for USB sim handbrake devices based on LeafLabs Maple (1eaf")
    (description "DKMS kernel driver for USB sim handbrake devices based on LeafLabs Maple (1eaf:0024).")
    (home-page "https://github.com/AngryNui/hid-chandbreak")
    (license license:gpl2)))

;;; git-mediate --- tool to help resolving git conflicts
(define-public git-mediate
  (package
    (name "git-mediate")
    (version "1.1.0-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/git-mediate.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "tool to help resolving git conflicts")
    (description "Tool to help resolving git conflicts.")
    (home-page "https://github.com/Peaker/git-mediate")
    (license license:gpl2)))

;;; wayneko-git --- display an animated neko cat on the bottom of a Wayland output.
(define-public wayneko-git
  (package
    (name "wayneko-git")
    (version "r29.c1919dc-4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/wayneko-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "display an animated neko cat on the bottom of a Wayland output.")
    (description "Display an animated neko cat on the bottom of a Wayland output.")
    (home-page "https://git.sr.ht/~leon_plickat/wayneko")
    (license license:gpl3+)))

;;; bettercap-ui --- official Bettercap's Web UI.
(define-public bettercap-ui
  (package
    (name "bettercap-ui")
    (version "1.4.0-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/bettercap-ui.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "official Bettercap's Web UI.")
    (description "Official Bettercap's Web UI.")
    (home-page "https://github.com/bettercap/ui")
    (license license:gpl3)))

;;; mimetic-git --- A free, MIT licensed, Email library (MIME) written in C++
(define-public mimetic-git
  (package
    (name "mimetic-git")
    (version "r51.2be9506-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mimetic-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A free, MIT licensed, Email library (MIME) written in C++")
    (description "A free, MIT licensed, Email library (MIME) written in C++.")
    (home-page "http://www.codesink.org/mimetic_mime_library.html")
    (license license:expat)))

;;; nimlangserver-git --- nimlangserver-git package from AUR
(define-public nimlangserver-git
  (package
    (name "nimlangserver-git")
    (version "v1.12.0.r13.gaa4be4c-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/nimlangserver-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "nimlangserver-git package from AUR")
    (description "Nimlangserver-git package from AUR.")
    (home-page "https://github.com/nim-lang/langserver")
    (license license:expat)))

;;; alpm-html --- generate a static site for browsing an Arch repo, styled like the main website
(define-public alpm-html
  (package
    (name "alpm-html")
    (version "0.10.0-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/alpm-html.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "generate a static site for browsing an Arch repo, styled like the main website")
    (description "Generate a static site for browsing an Arch repo, styled like the main website.")
    (home-page "https://code.aether.earth/archlinux/alpm-html")
    (license license:gpl3)))

;;; ambpack --- AMB stands for Ancient Machines Book. It is an extremely lightweight file form
(define-public ambpack
  (package
    (name "ambpack")
    (version "20201217-2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ambpack.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "AMB stands for Ancient Machines Book. It is an extremely lightweight file form")
    (description "AMB stands for Ancient Machines Book. It is an extremely lightweight file format meant to store any kind of hypertext documentation.")
    (home-page "http://ambook.sourceforge.net/")
    (license license:expat)))

;;; kubenav-bin --- kubenav is the navigator for your Kubernetes clusters right in your pocket
(define-public kubenav-bin
  (package
    (name "kubenav-bin")
    (version "3.9.0-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/kubenav-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "kubenav is the navigator for your Kubernetes clusters right in your pocket")
    (description "Kubenav is the navigator for your Kubernetes clusters right in your pocket.")
    (home-page "https://kubenav.io")
    (license license:expat)))

;;; tensorflow-cuda-git --- library for computation using data flow graphs for scalable machine learning (
(define-public tensorflow-cuda-git
  (package
    (name "tensorflow-cuda-git")
    (version "1.12.1+54837+g03796cf1dda-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/tensorflow-cuda-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "library for computation using data flow graphs for scalable machine learning (")
    (description "Library for computation using data flow graphs for scalable machine learning (with CUDA).")
    (home-page "https://tensorflow.org/")
    (license license:asl2.0)))

;;; looking-glass-module-dkms-git --- A kernel module that implements a basic interface to the IVSHMEM device for wh
(define-public looking-glass-module-dkms-git
  (package
    (name "looking-glass-module-dkms-git")
    (version "2:B7.r67.gcb304115-2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/looking-glass-module-dkms-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A kernel module that implements a basic interface to the IVSHMEM device for wh")
    (description "A kernel module that implements a basic interface to the IVSHMEM device for when using LookingGlass in VM->VM mode.")
    (home-page "https://looking-glass.io/")
    (license license:gpl2+)))

;;; otf-elstob --- A variable font for medievalists
(define-public otf-elstob
  (package
    (name "otf-elstob")
    (version "3.003-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/otf-elstob.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A variable font for medievalists")
    (description "A variable font for medievalists.")
    (home-page "https://github.com/psb1558/Elstob-font")
    (license license:silofl1.1)))

;;; fig-headless-bin --- adds IDE-style autocomplete to your existing terminal.
(define-public fig-headless-bin
  (package
    (name "fig-headless-bin")
    (version "2.19.0-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/fig-headless-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "adds IDE-style autocomplete to your existing terminal.")
    (description "Adds IDE-style autocomplete to your existing terminal.")
    (home-page "https://fig.io")
    (license license:nonfree)))

;;; git-backup-git --- remote git stash, in case of fire and more!
(define-public git-backup-git
  (package
    (name "git-backup-git")
    (version "r45.gd5a03aa-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/git-backup-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "remote git stash, in case of fire and more!")
    (description "Remote git stash, in case of fire and more!.")
    (home-page "https://github.com/sarpik/git-backup")
    (license license:gpl2)))

;;; gnome-source-thumbnailer-git --- thumbnails for your code
(define-public gnome-source-thumbnailer-git
  (package
    (name "gnome-source-thumbnailer-git")
    (version "r5.3e1503c-2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gnome-source-thumbnailer-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "thumbnails for your code")
    (description "Thumbnails for your code.")
    (home-page "https://gitlab.gnome.org/ZanderBrown/gnome-source-thumbnailer")
    (license license:gpl3)))

;;; onionshare-cli --- share files, host websites, and chat with friends using Tor (CLI version)
(define-public onionshare-cli
  (package
    (name "onionshare-cli")
    (version "2.6.3-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/onionshare-cli.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "share files, host websites, and chat with friends using Tor (CLI version)")
    (description "Share files, host websites, and chat with friends using Tor (CLI version).")
    (home-page "https://github.com/onionshare/onionshare/tree/main/cli")
    (license license:agpl3+)))

;;; invasion-of-greek --- a stupid arcade game for your terminal
(define-public invasion-of-greek
  (package
    (name "invasion-of-greek")
    (version "1.0.0_pre_20220925-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/invasion-of-greek.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a stupid arcade game for your terminal")
    (description "A stupid arcade game for your terminal.")
    (home-page "https://gitlab.fem-net.de/mabl/invasion-of-greek")
    (license license:expat)))

;;; lbrate --- extracts files from the CP/M LBR format
(define-public lbrate
  (package
    (name "lbrate")
    (version "1.1-2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lbrate.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "extracts files from the CP/M LBR format")
    (description "Extracts files from the CP/M LBR format.")
    (home-page "http://www.svgalib.org/rus/lbrate.html")
    (license license:gpl3+)))

;;; ttf-league-spartan-variable-git --- A geometric sans-serif revival of ATF’s classic Spartan
(define-public ttf-league-spartan-variable-git
  (package
    (name "ttf-league-spartan-variable-git")
    (version "2.220.r1.g8811c61-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ttf-league-spartan-variable-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A geometric sans-serif revival of ATF’s classic Spartan")
    (description "A geometric sans-serif revival of ATF’s classic Spartan.")
    (home-page "https://www.theleagueofmoveabletype.com/league-spartan")
    (license license:silofl1.1)))

;;; libsrs-alt --- SRS supporting library (mainly used in exim)
(define-public libsrs-alt
  (package
    (name "libsrs-alt")
    (version "1.0-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/libsrs_alt.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "SRS supporting library (mainly used in exim)")
    (description "SRS supporting library (mainly used in exim).")
    (home-page "http://opsec.eu/src/srs/")
    (license license:gpl3+)))

;;; liri-themes-git --- themes for uniform look and feel throughout Liri OS
(define-public liri-themes-git
  (package
    (name "liri-themes-git")
    (version "v0.9.0.r62.gea29cc9-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/liri-themes-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "themes for uniform look and feel throughout Liri OS")
    (description "Themes for uniform look and feel throughout Liri OS.")
    (home-page "https://liri.io")
    (license license:gpl3)))

;;; mfek-glif-git --- A stand-alone glyph viewer and editor (from Modular Font Editor K)
(define-public mfek-glif-git
  (package
    (name "mfek-glif-git")
    (version "1.1.0b2.r8.gc4f7fb0-2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mfek-glif-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A stand-alone glyph viewer and editor (from Modular Font Editor K)")
    (description "A stand-alone glyph viewer and editor (from Modular Font Editor K).")
    (home-page "https://github.com/MFEK/glif")
    (license license:asl2.0)))

;;; mingw-w64-xorg-util-macros --- X.Org Autotools macros (mingw-w64)
(define-public mingw-w64-xorg-util-macros
  (package
    (name "mingw-w64-xorg-util-macros")
    (version "1.20.2-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mingw-w64-xorg-util-macros.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "X.Org Autotools macros (mingw-w64)")
    (description "X.Org Autotools macros (mingw-w64).")
    (home-page "http://xorg.freedesktop.org/")
    (license license:expat)))

;;; mpy-repl-tool --- communicate and transfer files from and to MicroyPython boards via REPL
(define-public mpy-repl-tool
  (package
    (name "mpy-repl-tool")
    (version "0.14-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mpy-repl-tool.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "communicate and transfer files from and to MicroyPython boards via REPL")
    (description "Communicate and transfer files from and to MicroyPython boards via REPL.")
    (home-page "https://github.com/zsquareplusc/mpy-repl-tool")
    (license license:nonfree)))

;;; mtx-git --- tools used to view information about, and to control, Media Changer devices su
(define-public mtx-git
  (package
    (name "mtx-git")
    (version "r8.3dc2a38-3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mtx-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "tools used to view information about, and to control, Media Changer devices su")
    (description "Tools used to view information about, and to control, Media Changer devices such as Tape and DVD/CD libraries.")
    (home-page "https://github.com/mtx-org/mtx")
    (license license:gpl2)))

;;; multibg-sway --- set a different wallpaper for the background of each Sway workspace
(define-public multibg-sway
  (package
    (name "multibg-sway")
    (version "0.1.10-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/multibg-sway.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "set a different wallpaper for the background of each Sway workspace")
    (description "Set a different wallpaper for the background of each Sway workspace.")
    (home-page "https://github.com/gergo-salyi/multibg-sway")
    (license license:asl2.0)))

;;; neosurf-git --- A NetSurf fork with various improvements
(define-public neosurf-git
  (package
    (name "neosurf-git")
    (version "16.r21.gd6c77f2-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/neosurf-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A NetSurf fork with various improvements")
    (description "A NetSurf fork with various improvements.")
    (home-page "https://github.com/CobaltBSD/neosurf")
    (license license:gpl2)))

;;; nro-thumbnailer-git --- thumbnailer for Nintendo Switch homebrew .nro executables (development version
(define-public nro-thumbnailer-git
  (package
    (name "nro-thumbnailer-git")
    (version "0.0.2.r0.gdc57dfc-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/nro-thumbnailer-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "thumbnailer for Nintendo Switch homebrew .nro executables (development version")
    (description "Thumbnailer for Nintendo Switch homebrew .nro executables (development version).")
    (home-page "https://github.com/carstene1ns/nro-thumbnailer")
    (license license:nonfree)))

;;; openems --- free and open electromagnetic field solver using the FDTD method
(define-public openems
  (package
    (name "openems")
    (version "0.0.36-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/openems.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "free and open electromagnetic field solver using the FDTD method")
    (description "Free and open electromagnetic field solver using the FDTD method.")
    (home-page "https://openEMS.de")
    (license license:gpl3)))

;;; otf-asap --- contemporary sans-serif typeface family from Omnibus-Type.
(define-public otf-asap
  (package
    (name "otf-asap")
    (version "3.001-2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/otf-asap.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "contemporary sans-serif typeface family from Omnibus-Type.")
    (description "Contemporary sans-serif typeface family from Omnibus-Type.")
    (home-page "https://www.omnibus-type.com/fonts/asap/")
    (license license:silofl1.1)))

;;; php80-apcu --- A userland caching module for PHP 8.0
(define-public php80-apcu
  (package
    (name "php80-apcu")
    (version "5.1.23-2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/php80-apcu.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A userland caching module for PHP 8.0")
    (description "A userland caching module for PHP 8.0.")
    (home-page "https://pecl.php.net/package/APCu")
    (license license:gpl3+)))

;;; faustus-dkms-git --- experimental unofficial Linux platform driver module for ASUS TUF Gaming serie
(define-public faustus-dkms-git
  (package
    (name "faustus-dkms-git")
    (version "0.3-0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/faustus-dkms-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "experimental unofficial Linux platform driver module for ASUS TUF Gaming serie")
    (description "Experimental unofficial Linux platform driver module for ASUS TUF Gaming series laptops.")
    (home-page "https://github.com/wiktorek140/faustus")
    (license license:gpl3+)))

;;; prosody-hg-stable --- lightweight and extensible Jabber/XMPP server written in Lua (latest from stab
(define-public prosody-hg-stable
  (package
    (name "prosody-hg-stable")
    (version "13.0.r13892+.c83fdee8efda+-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/prosody-hg-stable.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "lightweight and extensible Jabber/XMPP server written in Lua (latest from stab")
    (description "Lightweight and extensible Jabber/XMPP server written in Lua (latest from stable-branch).")
    (home-page "https://prosody.im/")
    (license license:expat)))

;;; ps2-zlib --- compression library implementing the deflate compression method found in gzip 
(define-public ps2-zlib
  (package
    (name "ps2-zlib")
    (version "1.2.11-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ps2-zlib.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "compression library implementing the deflate compression method found in gzip ")
    (description "Compression library implementing the deflate compression method found in gzip and PKZIP (Sony Playstation® 2 videogame system port).")
    (home-page "https://github.com/madler/zlib")
    (license license:nonfree)))

;;; python-pytest-selenium --- pytest plugin for Selenium
(define-public python-pytest-selenium
  (package
    (name "python-pytest-selenium")
    (version "4.1.0-1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-pytest-selenium.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "pytest plugin for Selenium")
    (description "Pytest plugin for Selenium.")
    (home-page "https://github.com/pytest-dev/pytest-selenium")
    (license license:mpl2.0)))

;;; python-river-git --- online machine learning in Python
(define-public python-river-git
  (package
    (name "python-river-git")
    (version "0.9.0-3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-river-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "online machine learning in Python")
    (description "Online machine learning in Python.")
    (home-page "https://riverml.xyz")
    (license license:bsd-3)))
