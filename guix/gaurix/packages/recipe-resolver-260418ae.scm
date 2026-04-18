;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260418ae
;;; Resolves 100 TODO packages.
;;;
;;; New recipes (100):
;;;        1.  mendeleydesktop-bundled (gnu-build-system, v1.19.8, custom:mendeley_eula)
;;;        2.  arc-solid-gtk-theme-git (meson-build-system, v20220405.r43.ga76102bb, GPL3)
;;;        3.  xen-docs (pyproject-build-system, v4.21.1, GPL2)
;;;        4.  paper-gtk-theme-git (gnu-build-system, v302.770aba4, GPL3)
;;;        5.  ttf-inconsolata-g (font-build-system, v20090213, OFL-1.1)
;;;        6.  aurget (gnu-build-system, v4.8.0, GPL)
;;;        7.  db4.5 (gnu-build-system, v4.5.20, custom:db4.5)
;;;        8.  anaconda (gnu-build-system, v2025.12.2, custom)
;;;        9.  lastpass (gnu-build-system, v4.147.2, custom)
;;;       10.  ttf-envy-code-r (font-build-system, vpreview7, Freeware)
;;;       11.  crafty (gnu-build-system, v25.2, custom)
;;;       12.  qt-installer-framework-docs (cmake-build-system, v4.11.0, GFDL-1.3-no-invariants-only)
;;;       13.  amdapp-sdk-docs (gnu-build-system, v3.0, custom)
;;;       14.  kodi-git-eventclients (pyproject-build-system, vr70801.c23cbf3705b, GPL-2.0-or-later)
;;;       15.  kodi-git-dev (pyproject-build-system, vr70801.c23cbf3705b, GPL-2.0-or-later)
;;;       16.  ttf-aller (font-build-system, v1.0, custom)
;;;       17.  ttf-monaco (font-build-system, v6.1, unknown)
;;;       18.  kindlegen (gnu-build-system, v2.9, custom)
;;;       19.  ttf-droid-monovar (font-build-system, v1.0, Apache)
;;;       20.  mutter-performance-docs (pyproject-build-system, v49.0, GPL-2.0-or-later)
;;;       21.  libavutil-52 (gnu-build-system, v2.3.6, GPL)
;;;       22.  clarity-icon-theme (gnu-build-system, v0.5.1, CCPL:by-sa)
;;;       23.  flat-remix-git (gnu-build-system, v20211214.r0.g5711425af, GPL3)
;;;       24.  wayland-docs-git (meson-build-system, v1.24.91.r8.g25da99a, MIT)
;;;       25.  ttf-impallari-cantora (font-build-system, v1.002, OFL)
;;;       26.  arc-kde-git (gnu-build-system, v20220908.r3.g5573d0e, GPL3)
;;;       27.  virtualbox-bin-guest-iso (pyproject-build-system, v7.2.6, GPL-3.0-only)
;;;       28.  archlinux-themes-balou (gnu-build-system, v1.0, GPL)
;;;       29.  vibrancy-colors (gnu-build-system, v2.7, CCPL:by-sa)
;;;       30.  gtk-theme-elementary-git (meson-build-system, v6.1.1.r4.g87bfed67, GPL3)
;;;       31.  imdb-thumbnailer (gnu-build-system, v0.8.9, GPL)
;;;       32.  eigen2 (cmake-build-system, v2.0.17, GPL)
;;;       33.  icc-adobe (gnu-build-system, vCS4, custom)
;;;       34.  decklink-sdk (gnu-build-system, v16.0, LicenseRef-custom)
;;;       35.  magicrescue (gnu-build-system, v1.1.10, GPL-2.0-or-later)
;;;       36.  unknown-horizons-git (gnu-build-system, vr201.300b9c3, CCPL)
;;;       37.  uefi-shell-git (pyproject-build-system, v32718.edk2.stable202405.156.g3b2025969e, BSD)
;;;       38.  minetest-common-git (cmake-build-system, v5.10.0.rc1.r6.g9982c5637, LGPLv2.1)
;;;       39.  logkeys-git (gnu-build-system, vr74.5c36832, GPLv3)
;;;       40.  glib2-docs-git (pyproject-build-system, v2.86.0.r146.gd54816d, LGPL-2.1-or-later)
;;;       41.  ttf-monapo (font-build-system, v20170722, IPA)
;;;       42.  xcursor-neutralplus (gnu-build-system, v1.2, PerlArtistic)
;;;       43.  rofi-greenclip (gnu-build-system, v4.2, GPL)
;;;       44.  jquery (gnu-build-system, v3.7.1, MIT)
;;;       45.  ttf-ancient-fonts (font-build-system, v2.60, custom)
;;;       46.  ppsspp-assets-git (pyproject-build-system, v1.19.2.r189.1f2b4de6c1, GPL-2.0-or-later)
;;;       47.  ttf-brill (font-build-system, v4.000.073, custom)
;;;       48.  ttf-arabeyes-fonts (font-build-system, v20150617, GPL)
;;;       49.  scrub (gnu-build-system, v2.6.1, GPL)
;;;       50.  gdrive (cargo-build-system, v3.9.1, MIT)
;;;       51.  af9015-firmware (gnu-build-system, v5.24.0.0, unknown)
;;;       52.  linpack (gnu-build-system, v2025.3.0, LicenseRef-Intel-SmpL-2022)
;;;       53.  gtk-theme-iris-dark-git (gnu-build-system, v107.3468e91, GPL3)
;;;       54.  fiddler-appimage (copy-build-system, v7.5.0, custom)
;;;       55.  humanity-icon-theme (gnu-build-system, v0.6.16, GPL2)
;;;       56.  safecopy (gnu-build-system, v1.7, GPL)
;;;       57.  ttf-andika (font-build-system, v7.000, OFL-1.1-RFN)
;;;       58.  vertex-icons-git (gnu-build-system, vr16.f27e47e, GPL)
;;;       59.  balz (gnu-build-system, v1.20, custom: public domain)
;;;       60.  steinberg-asio-sdk (gnu-build-system, v2.3.4, GPL-3.0-only)
;;;       61.  terminus-cyrillic (pyproject-build-system, v4.49.1, custom:OFL)
;;;       62.  java32-runtime-common (gnu-build-system, v2, GPL)
;;;       63.  ttf-mona (font-build-system, v2.90, custom)
;;;       64.  poweriso (gnu-build-system, v1.6, Freeware)
;;;       65.  materia-theme-git (meson-build-system, v20210322.r53.gd7f59a37, GPL-2.0-or-later)
;;;       66.  doom1-wad (gnu-build-system, v1.9, custom)
;;;       67.  chef-dk (gnu-build-system, v4.13.3, Apache)
;;;       68.  fruit (gnu-build-system, v2.1, GPL)
;;;       69.  sfnt2woff (gnu-build-system, v20091003, GPL)
;;;       70.  vte-notification-docs (meson-build-system, v0.76.4, LGPL)
;;;       71.  soundfont-unison (gnu-build-system, v1.00, custom)
;;;       72.  hunspell-sv (gnu-build-system, v2.42, LGPL-3.0-only)
;;;       73.  gnome-shell-performance-docs (pyproject-build-system, v49.0, GPL-3.0-or-later)
;;;       74.  ttf-material-design-icons-git (font-build-system, vv5.3.45.r0.gcb85f87, unknown)
;;;       75.  paq8o (gnu-build-system, v9, unknown)
;;;       76.  cntlm (gnu-build-system, v0.92.3, GPL2)
;;;       77.  srecord (cmake-build-system, v1.65.0, GPL3)
;;;       78.  otf-cm-unicode (font-build-system, v0.7.0, custom:OFL)
;;;       79.  pycharm-eap (pyproject-build-system, v261.23567.35_2026.1.1, custom)
;;;       80.  gtk-theme-iris-light-git (gnu-build-system, v105.aca7c34, GPL3)
;;;       81.  otf-hasklig (font-build-system, v1.2, OFL)
;;;       82.  ttf-hasklig (font-build-system, v1.2, OFL)
;;;       83.  python-theano-pymc-doc (pyproject-build-system, v1.1.2, BSD-3-Clause)
;;;       84.  ttf-clear-sans (font-build-system, v1.00, Apache-2.0)
;;;       85.  qgnomeplatform-common-git (cmake-build-system, v0.7.0.r99.gd86d6ba, LGPL2.1)
;;;       86.  edk2-armvirt-git (pyproject-build-system, vr34315.93aeaa0812, BSD)
;;;       87.  edk2-shell-git (pyproject-build-system, vr34315.93aeaa0812, BSD)
;;;       88.  edk2-ovmf-git (pyproject-build-system, vr34315.93aeaa0812, BSD)
;;;       89.  flashbench-git (gnu-build-system, vr62.2e30b19, GPL2)
;;;       90.  dracula-gtk-theme (gnu-build-system, vv4.0.0, GPL)
;;;       91.  vazirmatn-fonts (font-build-system, v33.003, OFL)
;;;       92.  otf-powerline-symbols-git (font-build-system, v20130118, MIT)
;;;       93.  libcdk (gnu-build-system, v5.0.20240619, custom:BSD-like)
;;;       94.  ethminer-bin (copy-build-system, v0.18.0, GPL3)
;;;       95.  rot13 (gnu-build-system, v3, MIT)
;;;       96.  ttf-tw (font-build-system, v5.0, CC-BY-ND 3.0)
;;;       97.  ttf-roboto-slab (font-build-system, v2.002, Apache)
;;;       98.  poster (gnu-build-system, v20060221, GPL)
;;;       99.  inform7 (gnu-build-system, v10.1.2, Artistic2.0)
;;;      100.  toggldesktop-bin (copy-build-system, v7.5.363, unknown)
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Use `guix download` to obtain real hashes.

(define-module (gaurix packages recipe-resolver-260418ae)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system cargo)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system font)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:export (
            mendeleydesktop-bundled
            arc-solid-gtk-theme-git
            xen-docs
            paper-gtk-theme-git
            ttf-inconsolata-g
            aurget
            db4-5
            anaconda
            lastpass
            ttf-envy-code-r
            crafty
            qt-installer-framework-docs
            amdapp-sdk-docs
            kodi-git-eventclients
            kodi-git-dev
            ttf-aller
            ttf-monaco
            kindlegen
            ttf-droid-monovar
            mutter-performance-docs
            libavutil-52
            clarity-icon-theme
            flat-remix-git
            wayland-docs-git
            ttf-impallari-cantora
            arc-kde-git
            virtualbox-bin-guest-iso
            archlinux-themes-balou
            vibrancy-colors
            gtk-theme-elementary-git
            imdb-thumbnailer
            eigen2
            icc-adobe
            decklink-sdk
            magicrescue
            unknown-horizons-git
            uefi-shell-git
            minetest-common-git
            logkeys-git
            glib2-docs-git
            ttf-monapo
            xcursor-neutralplus
            rofi-greenclip
            jquery
            ttf-ancient-fonts
            ppsspp-assets-git
            ttf-brill
            ttf-arabeyes-fonts
            scrub
            gdrive
            af9015-firmware
            linpack
            gtk-theme-iris-dark-git
            fiddler-appimage
            humanity-icon-theme
            safecopy
            ttf-andika
            vertex-icons-git
            balz
            steinberg-asio-sdk
            terminus-cyrillic
            java32-runtime-common
            ttf-mona
            poweriso
            materia-theme-git
            doom1-wad
            chef-dk
            fruit
            sfnt2woff
            vte-notification-docs
            soundfont-unison
            hunspell-sv
            gnome-shell-performance-docs
            ttf-material-design-icons-git
            paq8o
            cntlm
            srecord
            otf-cm-unicode
            pycharm-eap
            gtk-theme-iris-light-git
            otf-hasklig
            ttf-hasklig
            python-theano-pymc-doc
            ttf-clear-sans
            qgnomeplatform-common-git
            edk2-armvirt-git
            edk2-shell-git
            edk2-ovmf-git
            flashbench-git
            dracula-gtk-theme
            vazirmatn-fonts
            otf-powerline-symbols-git
            libcdk
            ethminer-bin
            rot13
            ttf-tw
            ttf-roboto-slab
            poster
            inform7
            toggldesktop-bin
            ))

;;; -------------------------------------------------------------------
;;; 1. mendeleydesktop-bundled --- academic software for managing and sharing research papers
;;; -------------------------------------------------------------------
(define-public mendeleydesktop-bundled
  (package
    (name "mendeleydesktop-bundled")
    (version "1.19.8")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://www.mendeley.com/release-notes//archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "academic software for managing and sharing research papers")
    (description "Academic software for managing and sharing research papers.")
    (home-page "http://www.mendeley.com/release-notes/")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 2. arc-solid-gtk-theme-git --- a flat theme suite without transparent elements
;;; -------------------------------------------------------------------
(define-public arc-solid-gtk-theme-git
  (package
    (name "arc-solid-gtk-theme-git")
    (version "20220405.r43.ga76102bb")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/jnsh/arc-theme")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a flat theme suite without transparent elements")
    (description "A flat theme suite without transparent elements.")
    (home-page "https://github.com/jnsh/arc-theme")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 3. xen-docs --- xen hypervisor documentation and man pages
;;; -------------------------------------------------------------------
(define-public xen-docs
  (package
    (name "xen-docs")
    (version "4.21.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://xenproject.org//archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "xen hypervisor documentation and man pages")
    (description "Xen hypervisor documentation and man pages.")
    (home-page "https://xenproject.org/")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 4. paper-gtk-theme-git --- a modern desktop theme suite. Its design is mostly flat with a minimal us...
;;; -------------------------------------------------------------------
(define-public paper-gtk-theme-git
  (package
    (name "paper-gtk-theme-git")
    (version "302.770aba4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://snwh.org/paper")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a modern desktop theme suite. Its design is mostly flat with a minimal us...")
    (description "A modern desktop theme suite. Its design is mostly flat with a minimal use of shadows for depth.")
    (home-page "https://snwh.org/paper")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 5. ttf-inconsolata-g --- monospace font for pretty code listings and for the terminal modified by ...
;;; -------------------------------------------------------------------
(define-public ttf-inconsolata-g
  (package
    (name "ttf-inconsolata-g")
    (version "20090213")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://www.fantascienza.net/leonardo//archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (synopsis "monospace font for pretty code listings and for the terminal modified by ...")
    (description "Monospace font for pretty code listings and for the terminal modified by Leonardo Maffi http://www.fantascienza.net/leonardo/).")
    (home-page "http://www.fantascienza.net/leonardo/")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 6. aurget --- a simple, Pacman-like AUR helper
;;; -------------------------------------------------------------------
(define-public aurget
  (package
    (name "aurget")
    (version "4.8.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://codeberg.org/pbrisbin/aurget/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a simple, Pacman-like AUR helper")
    (description "A simple, Pacman-like AUR helper.")
    (home-page "https://codeberg.org/pbrisbin/aurget")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 7. db4.5 --- the Berkeley DB embedded database system 4.5
;;; -------------------------------------------------------------------
(define-public db4-5
  (package
    (name "db4-5")
    (version "4.5.20")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://www.oracle.com/technology/software/products/berkeley-db/index.html/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the Berkeley DB embedded database system 4.5")
    (description "The Berkeley DB embedded database system 4.5.")
    (home-page "http://www.oracle.com/technology/software/products/berkeley-db/index.html")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 8. anaconda --- simplifies package management and deployment of Anaconda
;;; -------------------------------------------------------------------
(define-public anaconda
  (package
    (name "anaconda")
    (version "2025.12.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://anaconda.com/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "simplifies package management and deployment of Anaconda")
    (description "Simplifies package management and deployment of Anaconda.")
    (home-page "https://anaconda.com")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 9. lastpass --- the Universal LastPass installer for Firefox, Chrome, and Opera
;;; -------------------------------------------------------------------
(define-public lastpass
  (package
    (name "lastpass")
    (version "4.147.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://lastpass.com/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the Universal LastPass installer for Firefox, Chrome, and Opera")
    (description "The Universal LastPass installer for Firefox, Chrome, and Opera.")
    (home-page "https://lastpass.com")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 10. ttf-envy-code-r --- free scalable coding font by DamienG
;;; -------------------------------------------------------------------
(define-public ttf-envy-code-r
  (package
    (name "ttf-envy-code-r")
    (version "preview7")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://damieng.com/envy-code-r/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (synopsis "free scalable coding font by DamienG")
    (description "Free scalable coding font by DamienG.")
    (home-page "https://damieng.com/envy-code-r")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 11. crafty --- a free, open-source computer chess program developed by Dr. Robert M. (Bo...
;;; -------------------------------------------------------------------
(define-public crafty
  (package
    (name "crafty")
    (version "25.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://www.craftychess.com//archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a free, open-source computer chess program developed by Dr. Robert M. (Bo...")
    (description "A free, open-source computer chess program developed by Dr. Robert M. (Bob) Hyatt.")
    (home-page "http://www.craftychess.com/")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 12. qt-installer-framework-docs --- the Qt Installer Framework used for the Qt SDK installer (examples and do...
;;; -------------------------------------------------------------------
(define-public qt-installer-framework-docs
  (package
    (name "qt-installer-framework-docs")
    (version "4.11.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://qt-project.org/wiki/Qt-Installer-Framework/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the Qt Installer Framework used for the Qt SDK installer (examples and do...")
    (description "The Qt Installer Framework used for the Qt SDK installer (examples and documentation).")
    (home-page "http://qt-project.org/wiki/Qt-Installer-Framework")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 13. amdapp-sdk-docs --- AMD Accelerated Parallel Processing (APP) SDK, 3.0 with OpenCL 2.0 suppor...
;;; -------------------------------------------------------------------
(define-public amdapp-sdk-docs
  (package
    (name "amdapp-sdk-docs")
    (version "3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://developer.amd.com/amd-accelerated-parallel-processing-app-sdk//archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "AMD Accelerated Parallel Processing (APP) SDK, 3.0 with OpenCL 2.0 suppor...")
    (description "AMD Accelerated Parallel Processing (APP) SDK, 3.0 with OpenCL 2.0 support. Documentation.")
    (home-page "https://developer.amd.com/amd-accelerated-parallel-processing-app-sdk/")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 14. kodi-git-eventclients --- kodi Event Clients (master branch)
;;; -------------------------------------------------------------------
(define-public kodi-git-eventclients
  (package
    (name "kodi-git-eventclients")
    (version "r70801.c23cbf3705b")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://kodi.tv/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "kodi Event Clients (master branch)")
    (description "Kodi Event Clients (master branch).")
    (home-page "https://kodi.tv")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 15. kodi-git-dev --- kodi dev files (master branch)
;;; -------------------------------------------------------------------
(define-public kodi-git-dev
  (package
    (name "kodi-git-dev")
    (version "r70801.c23cbf3705b")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://kodi.tv/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "kodi dev files (master branch)")
    (description "Kodi dev files (master branch).")
    (home-page "https://kodi.tv")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 16. ttf-aller --- an excellent sans serif font for screen legibility
;;; -------------------------------------------------------------------
(define-public ttf-aller
  (package
    (name "ttf-aller")
    (version "1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://www.daltonmaag.com//archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (synopsis "an excellent sans serif font for screen legibility")
    (description "An excellent sans serif font for screen legibility.")
    (home-page "http://www.daltonmaag.com/")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 17. ttf-monaco --- the Monaco monospaced sans-serif typeface with special characters added
;;; -------------------------------------------------------------------
(define-public ttf-monaco
  (package
    (name "ttf-monaco")
    (version "6.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/taodongl/monaco.ttf")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (synopsis "the Monaco monospaced sans-serif typeface with special characters added")
    (description "The Monaco monospaced sans-serif typeface with special characters added.")
    (home-page "https://github.com/taodongl/monaco.ttf")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 18. kindlegen --- cli tool to build eBooks that can be used on Amazon’s Kindle platform (bi...
;;; -------------------------------------------------------------------
(define-public kindlegen
  (package
    (name "kindlegen")
    (version "2.9")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.amazon.com/gp/feature.html?ie=UTF8&docId=1000765211/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "cli tool to build eBooks that can be used on Amazon’s Kindle platform (bi...")
    (description "Cli tool to build eBooks that can be used on Amazon’s Kindle platform (binary).")
    (home-page "https://www.amazon.com/gp/feature.html?ie=UTF8&docId=1000765211")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 19. ttf-droid-monovar --- a monospacedfont created by Ascender Corporation with dotted and slashed ...
;;; -------------------------------------------------------------------
(define-public ttf-droid-monovar
  (package
    (name "ttf-droid-monovar")
    (version "1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://www.cosmix.org/software//archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (synopsis "a monospacedfont created by Ascender Corporation with dotted and slashed ...")
    (description "A monospacedfont created by Ascender Corporation with dotted and slashed zeros.")
    (home-page "http://www.cosmix.org/software/")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 20. mutter-performance-docs --- window manager and compositor for GNOME (documentation)
;;; -------------------------------------------------------------------
(define-public mutter-performance-docs
  (package
    (name "mutter-performance-docs")
    (version "49.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://gitlab.gnome.org/GNOME/mutter/-/archive/v" version "/mutter-performance-docs-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "window manager and compositor for GNOME (documentation)")
    (description "Window manager and compositor for GNOME (documentation).")
    (home-page "https://gitlab.gnome.org/GNOME/mutter")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 21. libavutil-52 --- compatibility package for ffmpeg to provide versions 52 of libavutil not ...
;;; -------------------------------------------------------------------
(define-public libavutil-52
  (package
    (name "libavutil-52")
    (version "2.3.6")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://ffmpeg.org//archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "compatibility package for ffmpeg to provide versions 52 of libavutil not ...")
    (description "Compatibility package for ffmpeg to provide versions 52 of libavutil not anymore provided by the ffmpeg package.")
    (home-page "http://ffmpeg.org/")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 22. clarity-icon-theme --- vector icons in 9 colourthemes for GTK
;;; -------------------------------------------------------------------
(define-public clarity-icon-theme
  (package
    (name "clarity-icon-theme")
    (version "0.5.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.gnome-look.org/p/1012535/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "vector icons in 9 colourthemes for GTK")
    (description "Vector icons in 9 colourthemes for GTK.")
    (home-page "https://www.gnome-look.org/p/1012535")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 23. flat-remix-git --- an icon theme inspired by material design
;;; -------------------------------------------------------------------
(define-public flat-remix-git
  (package
    (name "flat-remix-git")
    (version "20211214.r0.g5711425af")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://drasite.com/flat-remix")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "an icon theme inspired by material design")
    (description "An icon theme inspired by material design.")
    (home-page "https://drasite.com/flat-remix")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 24. wayland-docs-git --- a computer display server protocol (git version) (documentation)
;;; -------------------------------------------------------------------
(define-public wayland-docs-git
  (package
    (name "wayland-docs-git")
    (version "1.24.91.r8.g25da99a")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://wayland.freedesktop.org/")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a computer display server protocol (git version) (documentation)")
    (description "A computer display server protocol (git version) (documentation).")
    (home-page "https://wayland.freedesktop.org/")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 25. ttf-impallari-cantora --- cantora ('Singer' in Spanish) is a friendly semi-formal, semi-condensed, ...
;;; -------------------------------------------------------------------
(define-public ttf-impallari-cantora
  (package
    (name "ttf-impallari-cantora")
    (version "1.002")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://fonts.google.com/specimen/Cantora+One/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (synopsis "cantora ('Singer' in Spanish) is a friendly semi-formal, semi-condensed, ...")
    (description "Cantora ('Singer' in Spanish) is a friendly semi-formal, semi-condensed, semi-sans-serif font, from Pablo Impallari.")
    (home-page "https://fonts.google.com/specimen/Cantora+One")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 26. arc-kde-git --- arc theme for KDE Plasma 5
;;; -------------------------------------------------------------------
(define-public arc-kde-git
  (package
    (name "arc-kde-git")
    (version "20220908.r3.g5573d0e")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/PapirusDevelopmentTeam/arc-kde")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "arc theme for KDE Plasma 5")
    (description "Arc theme for KDE Plasma 5.")
    (home-page "https://github.com/PapirusDevelopmentTeam/arc-kde")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 27. virtualbox-bin-guest-iso --- virtualBox guest additions ISO image for use with virtualbox-bin package
;;; -------------------------------------------------------------------
(define-public virtualbox-bin-guest-iso
  (package
    (name "virtualbox-bin-guest-iso")
    (version "7.2.6")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.virtualbox.org//archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "virtualBox guest additions ISO image for use with virtualbox-bin package")
    (description "VirtualBox guest additions ISO image for use with virtualbox-bin package.")
    (home-page "https://www.virtualbox.org/")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 28. archlinux-themes-balou --- theme for the Balou splash screen (xfce4)
;;; -------------------------------------------------------------------
(define-public archlinux-themes-balou
  (package
    (name "archlinux-themes-balou")
    (version "1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://www.xfce.org/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "theme for the Balou splash screen (xfce4)")
    (description "Theme for the Balou splash screen (xfce4).")
    (home-page "http://www.xfce.org")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 29. vibrancy-colors --- modern, clean and customizable flat icon theme
;;; -------------------------------------------------------------------
(define-public vibrancy-colors
  (package
    (name "vibrancy-colors")
    (version "2.7")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://www.ravefinity.com/p/vibrancy-colors-gtk-icon-theme.html/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "modern, clean and customizable flat icon theme")
    (description "Modern, clean and customizable flat icon theme.")
    (home-page "http://www.ravefinity.com/p/vibrancy-colors-gtk-icon-theme.html")
    (license (list license:non-copyleft license:gpl2))))

;;; -------------------------------------------------------------------
;;; 30. gtk-theme-elementary-git --- elementary GTK theme
;;; -------------------------------------------------------------------
(define-public gtk-theme-elementary-git
  (package
    (name "gtk-theme-elementary-git")
    (version "6.1.1.r4.g87bfed67")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/elementary/stylesheet")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "elementary GTK theme")
    (description "Elementary GTK theme.")
    (home-page "https://github.com/elementary/stylesheet")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 31. imdb-thumbnailer --- a nautilus / thunar video thumbnailer that sets film covers as thumbnails
;;; -------------------------------------------------------------------
(define-public imdb-thumbnailer
  (package
    (name "imdb-thumbnailer")
    (version "0.8.9")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://launchpad.net/imdb-thumbnailer/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a nautilus / thunar video thumbnailer that sets film covers as thumbnails")
    (description "A nautilus / thunar video thumbnailer that sets film covers as thumbnails.")
    (home-page "https://launchpad.net/imdb-thumbnailer")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 32. eigen2 --- a lightweight C++ template library for vector and matrix math, a.k.a. lin...
;;; -------------------------------------------------------------------
(define-public eigen2
  (package
    (name "eigen2")
    (version "2.0.17")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://eigen.tuxfamily.org/index.php?title=Main_Page/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a lightweight C++ template library for vector and matrix math, a.k.a. lin...")
    (description "A lightweight C++ template library for vector and matrix math, a.k.a. linear algebra.")
    (home-page "http://eigen.tuxfamily.org/index.php?title=Main_Page")
    (license (list license:gpl3+ license:lgpl3+))))

;;; -------------------------------------------------------------------
;;; 33. icc-adobe --- adobe ICC profiles
;;; -------------------------------------------------------------------
(define-public icc-adobe
  (package
    (name "icc-adobe")
    (version "CS4")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.adobe.com/support/downloads/iccprofiles/iccprofiles_mac.html/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "adobe ICC profiles")
    (description "Adobe ICC profiles.")
    (home-page "https://www.adobe.com/support/downloads/iccprofiles/iccprofiles_mac.html")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 34. decklink-sdk --- blackmagic DeckLink SDK
;;; -------------------------------------------------------------------
(define-public decklink-sdk
  (package
    (name "decklink-sdk")
    (version "16.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.blackmagicdesign.com/support/family/capture-and-playback/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "blackmagic DeckLink SDK")
    (description "Blackmagic DeckLink SDK.")
    (home-page "https://www.blackmagicdesign.com/support/family/capture-and-playback")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 35. magicrescue --- find and recover deleted files on block devices
;;; -------------------------------------------------------------------
(define-public magicrescue
  (package
    (name "magicrescue")
    (version "1.1.10")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/jbj/magicrescue")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "find and recover deleted files on block devices")
    (description "Find and recover deleted files on block devices.")
    (home-page "https://github.com/jbj/magicrescue")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 36. unknown-horizons-git --- open source real-time strategy game with the comfy Anno1602 feeling
;;; -------------------------------------------------------------------
(define-public unknown-horizons-git
  (package
    (name "unknown-horizons-git")
    (version "r201.300b9c3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://unknown-horizons.org/")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "open source real-time strategy game with the comfy Anno1602 feeling")
    (description "Open source real-time strategy game with the comfy Anno1602 feeling.")
    (home-page "https://unknown-horizons.org/")
    (license (list license:non-copyleft license:gpl3+))))

;;; -------------------------------------------------------------------
;;; 37. uefi-shell-git --- UEFI Shell v2 - from Tianocore EDK2 - GIT Version
;;; -------------------------------------------------------------------
(define-public uefi-shell-git
  (package
    (name "uefi-shell-git")
    (version "32718.edk2.stable202405.156.g3b2025969e")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/tianocore/edk2")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "UEFI Shell v2 - from Tianocore EDK2 - GIT Version")
    (description "UEFI Shell v2 - from Tianocore EDK2 - GIT Version.")
    (home-page "https://github.com/tianocore/edk2")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; 38. minetest-common-git --- free and open source voxel-based game engine (common data files) (git)
;;; -------------------------------------------------------------------
(define-public minetest-common-git
  (package
    (name "minetest-common-git")
    (version "5.10.0.rc1.r6.g9982c5637")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://www.luanti.org")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "free and open source voxel-based game engine (common data files) (git)")
    (description "Free and open source voxel-based game engine (common data files) (git).")
    (home-page "https://www.luanti.org")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 39. logkeys-git --- simple keylogger supporting also USB keyboards
;;; -------------------------------------------------------------------
(define-public logkeys-git
  (package
    (name "logkeys-git")
    (version "r74.5c36832")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/kernc/logkeys")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "simple keylogger supporting also USB keyboards")
    (description "Simple keylogger supporting also USB keyboards.")
    (home-page "https://github.com/kernc/logkeys")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 40. glib2-docs-git --- low Level Core Library - documentation
;;; -------------------------------------------------------------------
(define-public glib2-docs-git
  (package
    (name "glib2-docs-git")
    (version "2.86.0.r146.gd54816d")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.gnome.org/GNOME/glib")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "low Level Core Library - documentation")
    (description "Low Level Core Library - documentation.")
    (home-page "https://gitlab.gnome.org/GNOME/glib")
    (license (list license:lgpl2.1+ license:non-copyleft))))

;;; -------------------------------------------------------------------
;;; 41. ttf-monapo --- a Japanese font for viewing Japanese ascii arts properly. Combined font t...
;;; -------------------------------------------------------------------
(define-public ttf-monapo
  (package
    (name "ttf-monapo")
    (version "20170722")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/utuhiro78/modified-fonts")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (synopsis "a Japanese font for viewing Japanese ascii arts properly. Combined font t...")
    (description "A Japanese font for viewing Japanese ascii arts properly. Combined font that uses ipagp.ttf and mona.ttf.")
    (home-page "https://github.com/utuhiro78/modified-fonts")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 42. xcursor-neutralplus --- nice mod of the Neutral X11 cursor theme
;;; -------------------------------------------------------------------
(define-public xcursor-neutralplus
  (package
    (name "xcursor-neutralplus")
    (version "1.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.kde-look.org/p/999928//archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "nice mod of the Neutral X11 cursor theme")
    (description "Nice mod of the Neutral X11 cursor theme.")
    (home-page "https://www.kde-look.org/p/999928/")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 43. rofi-greenclip --- clipboard manager to use with rofi - Image support and blacklist
;;; -------------------------------------------------------------------
(define-public rofi-greenclip
  (package
    (name "rofi-greenclip")
    (version "4.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/erebe/greenclip")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "clipboard manager to use with rofi - Image support and blacklist")
    (description "Clipboard manager to use with rofi - Image support and blacklist.")
    (home-page "https://github.com/erebe/greenclip")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 44. jquery --- cross-platform JavaScript library designed to simplify the client-side sc...
;;; -------------------------------------------------------------------
(define-public jquery
  (package
    (name "jquery")
    (version "3.7.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://jquery.com/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "cross-platform JavaScript library designed to simplify the client-side sc...")
    (description "Cross-platform JavaScript library designed to simplify the client-side scripting of HTML.")
    (home-page "https://jquery.com")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 45. ttf-ancient-fonts --- unicode Fonts for Ancient Scripts
;;; -------------------------------------------------------------------
(define-public ttf-ancient-fonts
  (package
    (name "ttf-ancient-fonts")
    (version "2.60")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://dn-works.com/ufas//archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (synopsis "unicode Fonts for Ancient Scripts")
    (description "Unicode Fonts for Ancient Scripts.")
    (home-page "https://dn-works.com/ufas/")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 46. ppsspp-assets-git --- a PSP emulator written in C++
;;; -------------------------------------------------------------------
(define-public ppsspp-assets-git
  (package
    (name "ppsspp-assets-git")
    (version "1.19.2.r189.1f2b4de6c1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://www.ppsspp.org/")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "a PSP emulator written in C++")
    (description "A PSP emulator written in C++.")
    (home-page "https://www.ppsspp.org/")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 47. ttf-brill --- brill Typeface by John Hudson for Brill Publishing House
;;; -------------------------------------------------------------------
(define-public ttf-brill
  (package
    (name "ttf-brill")
    (version "4.000.073")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://brill.com/page/BrillFont/brill-typeface/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (synopsis "brill Typeface by John Hudson for Brill Publishing House")
    (description "Brill Typeface by John Hudson for Brill Publishing House.")
    (home-page "https://brill.com/page/BrillFont/brill-typeface")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 48. ttf-arabeyes-fonts --- a collection of free Arabic and Farsi TrueType fonts
;;; -------------------------------------------------------------------
(define-public ttf-arabeyes-fonts
  (package
    (name "ttf-arabeyes-fonts")
    (version "20150617")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://arabeyes.org/%D8%A7%D9%84%D8%B5%D9%81%D8%AD%D8%A9_%D8%A7%D9%84%D8%B1%D8%A6%D9%8A%D8%B3%D9%8A%D8%A9/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (synopsis "a collection of free Arabic and Farsi TrueType fonts")
    (description "A collection of free Arabic and Farsi TrueType fonts.")
    (home-page "https://arabeyes.org/%D8%A7%D9%84%D8%B5%D9%81%D8%AD%D8%A9_%D8%A7%D9%84%D8%B1%D8%A6%D9%8A%D8%B3%D9%8A%D8%A9")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 49. scrub --- iteratively writes patterns on files or disk devices to make retreiving t...
;;; -------------------------------------------------------------------
(define-public scrub
  (package
    (name "scrub")
    (version "2.6.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://code.google.com/p/diskscrub//archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "iteratively writes patterns on files or disk devices to make retreiving t...")
    (description "Iteratively writes patterns on files or disk devices to make retreiving the data more difficult.")
    (home-page "http://code.google.com/p/diskscrub/")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 50. gdrive --- google Drive CLI Client (Rust rewrite)
;;; -------------------------------------------------------------------
(define-public gdrive
  (package
    (name "gdrive")
    (version "3.9.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/glotlabs/gdrive")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "google Drive CLI Client (Rust rewrite)")
    (description "Google Drive CLI Client (Rust rewrite).")
    (home-page "https://github.com/glotlabs/gdrive")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 51. af9015-firmware --- firmware for Afatech af9015 based USB dvb devices
;;; -------------------------------------------------------------------
(define-public af9015-firmware
  (package
    (name "af9015-firmware")
    (version "5.24.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://linuxtv.org/wiki/index.php/Afatech_AF9015/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "firmware for Afatech af9015 based USB dvb devices")
    (description "Firmware for Afatech af9015 based USB dvb devices.")
    (home-page "http://linuxtv.org/wiki/index.php/Afatech_AF9015")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 52. linpack --- benchmark that measures a system's floating-point rate of execution by so...
;;; -------------------------------------------------------------------
(define-public linpack
  (package
    (name "linpack")
    (version "2025.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://software.intel.com/en-us/articles/intel-math-kernel-library-linpack-download/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "benchmark that measures a system's floating-point rate of execution by so...")
    (description "Benchmark that measures a system's floating-point rate of execution by solving dense linear equations.")
    (home-page "https://software.intel.com/en-us/articles/intel-math-kernel-library-linpack-download")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 53. gtk-theme-iris-dark-git --- a flat theme that uses varying shades and tones to create distinction and...
;;; -------------------------------------------------------------------
(define-public gtk-theme-iris-dark-git
  (package
    (name "gtk-theme-iris-dark-git")
    (version "107.3468e91")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://thevirtualdragon.deviantart.com/art/Iris-Dark-Gtk-Theme-v1-10-429628194")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a flat theme that uses varying shades and tones to create distinction and...")
    (description "A flat theme that uses varying shades and tones to create distinction and a modern experience.")
    (home-page "https://thevirtualdragon.deviantart.com/art/Iris-Dark-Gtk-Theme-v1-10-429628194")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 54. fiddler-appimage --- the free web debugging proxy by Telerik
;;; -------------------------------------------------------------------
(define-public fiddler-appimage
  (package
    (name "fiddler-appimage")
    (version "7.5.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.telerik.com/fiddler/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("fiddler-appimage" "bin/fiddler-appimage"))))
    (synopsis "the free web debugging proxy by Telerik")
    (description "The free web debugging proxy by Telerik.")
    (home-page "https://www.telerik.com/fiddler")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 55. humanity-icon-theme --- humanity icons from Ubuntu without modification
;;; -------------------------------------------------------------------
(define-public humanity-icon-theme
  (package
    (name "humanity-icon-theme")
    (version "0.6.16")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://launchpad.net/humanity/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "humanity icons from Ubuntu without modification")
    (description "Humanity icons from Ubuntu without modification.")
    (home-page "https://launchpad.net/humanity")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 56. safecopy --- a disk data recovery tool to extract data from damaged media
;;; -------------------------------------------------------------------
(define-public safecopy
  (package
    (name "safecopy")
    (version "1.7")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://safecopy.sourceforge.net//archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a disk data recovery tool to extract data from damaged media")
    (description "A disk data recovery tool to extract data from damaged media.")
    (home-page "http://safecopy.sourceforge.net/")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 57. ttf-andika --- a sans serif, Unicode-compliant font designed especially for literacy use
;;; -------------------------------------------------------------------
(define-public ttf-andika
  (package
    (name "ttf-andika")
    (version "7.000")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://software.sil.org/andika/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (synopsis "a sans serif, Unicode-compliant font designed especially for literacy use")
    (description "A sans serif, Unicode-compliant font designed especially for literacy use.")
    (home-page "https://software.sil.org/andika")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 58. vertex-icons-git --- a Gnome icon theme to match the Vertex Gtk theme
;;; -------------------------------------------------------------------
(define-public vertex-icons-git
  (package
    (name "vertex-icons-git")
    (version "r16.f27e47e")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/horst3180/Vertex-Icons")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a Gnome icon theme to match the Vertex Gtk theme")
    (description "A Gnome icon theme to match the Vertex Gtk theme.")
    (home-page "https://github.com/horst3180/Vertex-Icons")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 59. balz --- command-line file compressor with a high compression ratio and fast decom...
;;; -------------------------------------------------------------------
(define-public balz
  (package
    (name "balz")
    (version "1.20")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://balz.sourceforge.net/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "command-line file compressor with a high compression ratio and fast decom...")
    (description "Command-line file compressor with a high compression ratio and fast decompression.")
    (home-page "http://balz.sourceforge.net")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 60. steinberg-asio-sdk --- steinberg's ASIO SDK
;;; -------------------------------------------------------------------
(define-public steinberg-asio-sdk
  (package
    (name "steinberg-asio-sdk")
    (version "2.3.4")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.steinberg.net/en/company/developers.html/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "steinberg's ASIO SDK")
    (description "Steinberg's ASIO SDK.")
    (home-page "https://www.steinberg.net/en/company/developers.html")
    (license (list license:gpl3 license:non-copyleft))))

;;; -------------------------------------------------------------------
;;; 61. terminus-cyrillic --- terminus monospace bitmap font (for X11 and console) with patches dv1 and...
;;; -------------------------------------------------------------------
(define-public terminus-cyrillic
  (package
    (name "terminus-cyrillic")
    (version "4.49.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://sourceforge.net/projects/terminus-font//archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "terminus monospace bitmap font (for X11 and console) with patches dv1 and...")
    (description "Terminus monospace bitmap font (for X11 and console) with patches dv1 and ij1 applied.")
    (home-page "http://sourceforge.net/projects/terminus-font/")
    (license (list license:non-copyleft license:gpl2))))

;;; -------------------------------------------------------------------
;;; 62. java32-runtime-common --- common files for 32-bit Java Runtime Environments
;;; -------------------------------------------------------------------
(define-public java32-runtime-common
  (package
    (name "java32-runtime-common")
    (version "2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.archlinux.org/packages/extra/any/java-runtime-common//archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "common files for 32-bit Java Runtime Environments")
    (description "Common files for 32-bit Java Runtime Environments.")
    (home-page "https://www.archlinux.org/packages/extra/any/java-runtime-common/")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 63. ttf-mona --- a Japanese proportional font which allows you to view Japanese text arts ...
;;; -------------------------------------------------------------------
(define-public ttf-mona
  (package
    (name "ttf-mona")
    (version "2.90")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://monafont.sourceforge.net//archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (synopsis "a Japanese proportional font which allows you to view Japanese text arts ...")
    (description "A Japanese proportional font which allows you to view Japanese text arts correctly.")
    (home-page "http://monafont.sourceforge.net/")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 64. poweriso --- a powerful CD/DVD image file processing tool
;;; -------------------------------------------------------------------
(define-public poweriso
  (package
    (name "poweriso")
    (version "1.6")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://www.poweriso.com//archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a powerful CD/DVD image file processing tool")
    (description "A powerful CD/DVD image file processing tool.")
    (home-page "http://www.poweriso.com/")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 65. materia-theme-git --- a Material Design theme for GNOME/GTK+ based desktop environments
;;; -------------------------------------------------------------------
(define-public materia-theme-git
  (package
    (name "materia-theme-git")
    (version "20210322.r53.gd7f59a37")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nana-4/materia-theme")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a Material Design theme for GNOME/GTK+ based desktop environments")
    (description "A Material Design theme for GNOME/GTK+ based desktop environments.")
    (home-page "https://github.com/nana-4/materia-theme")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 66. doom1-wad --- the Doom shareware IWAD (game data)
;;; -------------------------------------------------------------------
(define-public doom1-wad
  (package
    (name "doom1-wad")
    (version "1.9")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://web.archive.org/web/20100920205115/http://www.idsoftware.com/games/doom/doom-ultimate/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the Doom shareware IWAD (game data)")
    (description "The Doom shareware IWAD (game data).")
    (home-page "https://web.archive.org/web/20100920205115/http://www.idsoftware.com/games/doom/doom-ultimate")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 67. chef-dk --- the Chef development kit contains all the tools you need to develop and t...
;;; -------------------------------------------------------------------
(define-public chef-dk
  (package
    (name "chef-dk")
    (version "4.13.3")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://downloads.chef.io/chef-dk//archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the Chef development kit contains all the tools you need to develop and t...")
    (description "The Chef development kit contains all the tools you need to develop and test your infrastructure, built by the awesome Chef community.")
    (home-page "https://downloads.chef.io/chef-dk/")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 68. fruit --- UCI chess engine developed by Fabien Letouzey
;;; -------------------------------------------------------------------
(define-public fruit
  (package
    (name "fruit")
    (version "2.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://arctrix.com/nas/chess/fruit//archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "UCI chess engine developed by Fabien Letouzey")
    (description "UCI chess engine developed by Fabien Letouzey.")
    (home-page "http://arctrix.com/nas/chess/fruit/")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 69. sfnt2woff --- tools to convert existing TrueType/OpenType fonts to WOFF and inversely (...
;;; -------------------------------------------------------------------
(define-public sfnt2woff
  (package
    (name "sfnt2woff")
    (version "20091003")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://people.mozilla.org/~jkew/woff//archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "tools to convert existing TrueType/OpenType fonts to WOFF and inversely (...")
    (description "Tools to convert existing TrueType/OpenType fonts to WOFF and inversely (sfnt2woff and woff2sfnt).")
    (home-page "https://people.mozilla.org/~jkew/woff/")
    (license (list license:gpl3+ license:lgpl3+ license:mpl2.0))))

;;; -------------------------------------------------------------------
;;; 70. vte-notification-docs --- virtual Terminal Emulator widget documentation
;;; -------------------------------------------------------------------
(define-public vte-notification-docs
  (package
    (name "vte-notification-docs")
    (version "0.76.4")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://wiki.gnome.org/Apps/Terminal/VTE/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "virtual Terminal Emulator widget documentation")
    (description "Virtual Terminal Emulator widget documentation.")
    (home-page "https://wiki.gnome.org/Apps/Terminal/VTE")
    (license license:lgpl3+)))

;;; -------------------------------------------------------------------
;;; 71. soundfont-unison --- lean and clean GM/GS soundbank, by Peter Jevnisek
;;; -------------------------------------------------------------------
(define-public soundfont-unison
  (package
    (name "soundfont-unison")
    (version "1.00")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://musical-artifacts.com/artifacts/659/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "lean and clean GM/GS soundbank, by Peter Jevnisek")
    (description "Lean and clean GM/GS soundbank, by Peter Jevnisek.")
    (home-page "https://musical-artifacts.com/artifacts/659")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 72. hunspell-sv --- swedish dictionaries for Hunspell
;;; -------------------------------------------------------------------
(define-public hunspell-sv
  (package
    (name "hunspell-sv")
    (version "2.42")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://extensions.libreoffice.org/en/extensions/show/swedish-spelling-dictionary-den-stora-svenska-ordlistan/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "swedish dictionaries for Hunspell")
    (description "Swedish dictionaries for Hunspell.")
    (home-page "https://extensions.libreoffice.org/en/extensions/show/swedish-spelling-dictionary-den-stora-svenska-ordlistan")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 73. gnome-shell-performance-docs --- next generation desktop shell (API documentation)
;;; -------------------------------------------------------------------
(define-public gnome-shell-performance-docs
  (package
    (name "gnome-shell-performance-docs")
    (version "49.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://gitlab.gnome.org/GNOME/gnome-shell/-/archive/v" version "/gnome-shell-performance-docs-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "next generation desktop shell (API documentation)")
    (description "Next generation desktop shell (API documentation).")
    (home-page "https://gitlab.gnome.org/GNOME/gnome-shell")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 74. ttf-material-design-icons-git --- material Design Icons Web Font
;;; -------------------------------------------------------------------
(define-public ttf-material-design-icons-git
  (package
    (name "ttf-material-design-icons-git")
    (version "v5.3.45.r0.gcb85f87")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://materialdesignicons.com")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (synopsis "material Design Icons Web Font")
    (description "Material Design Icons Web Font.")
    (home-page "https://materialdesignicons.com")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 75. paq8o --- PAQ8 series of archivers, resurrected by new maintainers
;;; -------------------------------------------------------------------
(define-public paq8o
  (package
    (name "paq8o")
    (version "9")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://cs.fit.edu/~mmahoney/compression/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "PAQ8 series of archivers, resurrected by new maintainers")
    (description "PAQ8 series of archivers, resurrected by new maintainers.")
    (home-page "http://cs.fit.edu/~mmahoney/compression")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 76. cntlm --- an NTLM, NTLM2SR, and NTLMv2 authenticating HTTP proxy
;;; -------------------------------------------------------------------
(define-public cntlm
  (package
    (name "cntlm")
    (version "0.92.3")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://cntlm.sourceforge.net//archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "an NTLM, NTLM2SR, and NTLMv2 authenticating HTTP proxy")
    (description "An NTLM, NTLM2SR, and NTLMv2 authenticating HTTP proxy.")
    (home-page "http://cntlm.sourceforge.net/")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 77. srecord --- the SRecord package is a collection of powerful tools for manipulating EP...
;;; -------------------------------------------------------------------
(define-public srecord
  (package
    (name "srecord")
    (version "1.65.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://srecord.sourceforge.net/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the SRecord package is a collection of powerful tools for manipulating EP...")
    (description "The SRecord package is a collection of powerful tools for manipulating EPROM load files.")
    (home-page "https://srecord.sourceforge.net")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 78. otf-cm-unicode --- a font family converted from D. Knuth's Computer Modern metafont
;;; -------------------------------------------------------------------
(define-public otf-cm-unicode
  (package
    (name "otf-cm-unicode")
    (version "0.7.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://canopus.iacp.dvo.ru/~panov/cm-unicode//archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (synopsis "a font family converted from D. Knuth's Computer Modern metafont")
    (description "A font family converted from D. Knuth's Computer Modern metafont.")
    (home-page "http://canopus.iacp.dvo.ru/~panov/cm-unicode/")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 79. pycharm-eap --- powerful Python and Django IDE, Early Access Program (EAP) build. Profess...
;;; -------------------------------------------------------------------
(define-public pycharm-eap
  (package
    (name "pycharm-eap")
    (version "261.23567.35_2026.1.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.jetbrains.com/pycharm/nextversion//archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "powerful Python and Django IDE, Early Access Program (EAP) build. Profess...")
    (description "Powerful Python and Django IDE, Early Access Program (EAP) build. Professional edition.")
    (home-page "https://www.jetbrains.com/pycharm/nextversion/")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 80. gtk-theme-iris-light-git --- a flat theme that uses varying shades and tones to create distinction and...
;;; -------------------------------------------------------------------
(define-public gtk-theme-iris-light-git
  (package
    (name "gtk-theme-iris-light-git")
    (version "105.aca7c34")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://thevirtualdragon.deviantart.com/art/Iris-Light-Gtk-Theme-v1-7-5-428948909")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a flat theme that uses varying shades and tones to create distinction and...")
    (description "A flat theme that uses varying shades and tones to create distinction and a modern experience.")
    (home-page "https://thevirtualdragon.deviantart.com/art/Iris-Light-Gtk-Theme-v1-7-5-428948909")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 81. otf-hasklig --- a font with symbol ligatures, intended for Haskell code
;;; -------------------------------------------------------------------
(define-public otf-hasklig
  (package
    (name "otf-hasklig")
    (version "1.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/i-tu/Hasklig")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (synopsis "a font with symbol ligatures, intended for Haskell code")
    (description "A font with symbol ligatures, intended for Haskell code.")
    (home-page "https://github.com/i-tu/Hasklig")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 82. ttf-hasklig --- a font with symbol ligatures, intended for Haskell code
;;; -------------------------------------------------------------------
(define-public ttf-hasklig
  (package
    (name "ttf-hasklig")
    (version "1.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/i-tu/Hasklig")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (synopsis "a font with symbol ligatures, intended for Haskell code")
    (description "A font with symbol ligatures, intended for Haskell code.")
    (home-page "https://github.com/i-tu/Hasklig")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 83. python-theano-pymc-doc --- documentation for Python Theano-PyMC
;;; -------------------------------------------------------------------
(define-public python-theano-pymc-doc
  (package
    (name "python-theano-pymc-doc")
    (version "1.1.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://pypi.org/project/Theano-PyMC/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "documentation for Python Theano-PyMC")
    (description "Documentation for Python Theano-PyMC.")
    (home-page "https://pypi.org/project/Theano-PyMC")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; 84. ttf-clear-sans --- a versatile OpenType font for screen, print and Web
;;; -------------------------------------------------------------------
(define-public ttf-clear-sans
  (package
    (name "ttf-clear-sans")
    (version "1.00")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/intel/clear-sans")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (synopsis "a versatile OpenType font for screen, print and Web")
    (description "A versatile OpenType font for screen, print and Web.")
    (home-page "https://github.com/intel/clear-sans")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 85. qgnomeplatform-common-git --- qPlatformTheme for a better Qt application inclusion in GNOME (common files)
;;; -------------------------------------------------------------------
(define-public qgnomeplatform-common-git
  (package
    (name "qgnomeplatform-common-git")
    (version "0.7.0.r99.gd86d6ba")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/FedoraQt/QGnomePlatform")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "qPlatformTheme for a better Qt application inclusion in GNOME (common files)")
    (description "QPlatformTheme for a better Qt application inclusion in GNOME (common files).")
    (home-page "https://github.com/FedoraQt/QGnomePlatform")
    (license license:lgpl2.1)))

;;; -------------------------------------------------------------------
;;; 86. edk2-armvirt-git --- firmware for Virtual Machines (aarch64)
;;; -------------------------------------------------------------------
(define-public edk2-armvirt-git
  (package
    (name "edk2-armvirt-git")
    (version "r34315.93aeaa0812")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/tianocore/tianocore.github.io")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "firmware for Virtual Machines (aarch64)")
    (description "Firmware for Virtual Machines (aarch64).")
    (home-page "https://github.com/tianocore/tianocore.github.io")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; 87. edk2-shell-git --- EDK2 UEFI Shell
;;; -------------------------------------------------------------------
(define-public edk2-shell-git
  (package
    (name "edk2-shell-git")
    (version "r34315.93aeaa0812")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/tianocore/edk2")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "EDK2 UEFI Shell")
    (description "EDK2 UEFI Shell.")
    (home-page "https://github.com/tianocore/edk2")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; 88. edk2-ovmf-git --- firmware for Virtual Machines (x86_64, i686)
;;; -------------------------------------------------------------------
(define-public edk2-ovmf-git
  (package
    (name "edk2-ovmf-git")
    (version "r34315.93aeaa0812")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/tianocore/tianocore.github.io")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "firmware for Virtual Machines (x86_64, i686)")
    (description "Firmware for Virtual Machines (x86_64, i686).")
    (home-page "https://github.com/tianocore/tianocore.github.io")
    (license (list license:bsd-3 license:expat))))

;;; -------------------------------------------------------------------
;;; 89. flashbench-git --- tool for benchmarking and classifying flash memory drives
;;; -------------------------------------------------------------------
(define-public flashbench-git
  (package
    (name "flashbench-git")
    (version "r62.2e30b19")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://lwn.net/SubscriberLink/428584/354d16fe00c90072/")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "tool for benchmarking and classifying flash memory drives")
    (description "Tool for benchmarking and classifying flash memory drives.")
    (home-page "https://lwn.net/SubscriberLink/428584/354d16fe00c90072/")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 90. dracula-gtk-theme --- dark theme for GTK
;;; -------------------------------------------------------------------
(define-public dracula-gtk-theme
  (package
    (name "dracula-gtk-theme")
    (version "v4.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/dracula/gtk")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "dark theme for GTK")
    (description "Dark theme for GTK.")
    (home-page "https://github.com/dracula/gtk")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 91. vazirmatn-fonts --- a beautiful Persian font based on DejaVu font
;;; -------------------------------------------------------------------
(define-public vazirmatn-fonts
  (package
    (name "vazirmatn-fonts")
    (version "33.003")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/rastikerdar/vazirmatn")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (synopsis "a beautiful Persian font based on DejaVu font")
    (description "A beautiful Persian font based on DejaVu font.")
    (home-page "https://github.com/rastikerdar/vazirmatn")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 92. otf-powerline-symbols-git --- fallback font for the Powerline symbols
;;; -------------------------------------------------------------------
(define-public otf-powerline-symbols-git
  (package
    (name "otf-powerline-symbols-git")
    (version "20130118")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/powerline/powerline")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (synopsis "fallback font for the Powerline symbols")
    (description "Fallback font for the Powerline symbols.")
    (home-page "https://github.com/powerline/powerline")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 93. libcdk --- curses Development Kit - widget library, enhanced version
;;; -------------------------------------------------------------------
(define-public libcdk
  (package
    (name "libcdk")
    (version "5.0.20240619")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://invisible-island.net/cdk//archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "curses Development Kit - widget library, enhanced version")
    (description "Curses Development Kit - widget library, enhanced version.")
    (home-page "https://invisible-island.net/cdk/")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 94. ethminer-bin --- ethereum miner with OpenCL, CUDA and stratum support (precompiled binary)
;;; -------------------------------------------------------------------
(define-public ethminer-bin
  (package
    (name "ethminer-bin")
    (version "0.18.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/ethereum-mining/ethminer/releases/download/v" version "/ethminer-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("ethminer-bin" "bin/ethminer-bin"))))
    (synopsis "ethereum miner with OpenCL, CUDA and stratum support (precompiled binary)")
    (description "Ethereum miner with OpenCL, CUDA and stratum support (precompiled binary).")
    (home-page "https://github.com/ethereum-mining/ethminer")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 95. rot13 --- converts text with ROT13 from STDIN to STDOUT or text given as arguments
;;; -------------------------------------------------------------------
(define-public rot13
  (package
    (name "rot13")
    (version "3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/packages/rot13")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "converts text with ROT13 from STDIN to STDOUT or text given as arguments")
    (description "Converts text with ROT13 from STDIN to STDOUT or text given as arguments.")
    (home-page "None")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 96. ttf-tw --- set of KAI and SONG fonts from the Ministry of Education of Taiwan. These...
;;; -------------------------------------------------------------------
(define-public ttf-tw
  (package
    (name "ttf-tw")
    (version "5.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://www.moe.gov.tw//archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (synopsis "set of KAI and SONG fonts from the Ministry of Education of Taiwan. These...")
    (description "Set of KAI and SONG fonts from the Ministry of Education of Taiwan. These fonts follow all the official recommendations and their shapes are calligraphically correct. (TTF/UTF-8).")
    (home-page "http://www.moe.gov.tw/")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 97. ttf-roboto-slab --- roboto Slab is a slab serif addition to the Roboto type family
;;; -------------------------------------------------------------------
(define-public ttf-roboto-slab
  (package
    (name "ttf-roboto-slab")
    (version "2.002")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.google.com/fonts/specimen/Roboto+Slab/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (synopsis "roboto Slab is a slab serif addition to the Roboto type family")
    (description "Roboto Slab is a slab serif addition to the Roboto type family.")
    (home-page "https://www.google.com/fonts/specimen/Roboto+Slab")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 98. poster --- scales or tiles a postscript image to print on multiple pages
;;; -------------------------------------------------------------------
(define-public poster
  (package
    (name "poster")
    (version "20060221")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://directory.fsf.org/wiki/Poster/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "scales or tiles a postscript image to print on multiple pages")
    (description "Scales or tiles a postscript image to print on multiple pages.")
    (home-page "http://directory.fsf.org/wiki/Poster")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 99. inform7 --- a design system for interactive fiction based on natural language
;;; -------------------------------------------------------------------
(define-public inform7
  (package
    (name "inform7")
    (version "10.1.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://ganelson.github.io/inform/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a design system for interactive fiction based on natural language")
    (description "A design system for interactive fiction based on natural language.")
    (home-page "https://ganelson.github.io/inform")
    (license license:artistic2.0)))

;;; -------------------------------------------------------------------
;;; 100. toggldesktop-bin --- toggl time tracking software
;;; -------------------------------------------------------------------
(define-public toggldesktop-bin
  (package
    (name "toggldesktop-bin")
    (version "7.5.363")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/toggl-open-source/toggldesktop/releases/download/v" version "/toggldesktop-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("toggldesktop-bin" "bin/toggldesktop-bin"))))
    (synopsis "toggl time tracking software")
    (description "Toggl time tracking software.")
    (home-page "https://github.com/toggl-open-source/toggldesktop")
    (license license:non-copyleft)))
