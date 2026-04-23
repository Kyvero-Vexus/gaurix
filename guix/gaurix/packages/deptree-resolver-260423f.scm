;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Dep-tree resolver pass --- deptree-resolver-260423f
;;; Resolves 100 BLOCKED/FAILED packages via dependency-tree priority.
;;;
;;; New recipes (100):
;;;      1.  mailhog (go-build-system, v1.0.1, license:expat)
;;;      2.  mingw-w64-dlfcn (copy-build-system, v1.4.2, license:expat)
;;;      3.  mingw-w64-extra-cmake-modules (copy-build-system, v6.19.0, license:lgpl3+)
;;;      4.  mingw-w64-libtasn1 (copy-build-system, v4.19.0, license:non-copyleft)
;;;      5.  mingw-w64-mpfr (copy-build-system, v4.2.2, license:lgpl3+)
;;;      6.  mingw-w64-nettle (copy-build-system, v3.10.2, license:non-copyleft)
;;;      7.  mingw-w64-pkg-config (copy-build-system, v2, license:zlib)
;;;      8.  mingw-w64-termcap (copy-build-system, v1.3.1, (list license:gpl3+ license:lgpl3+))
;;;      9.  mobilesheets-companion (copy-build-system, v4.1.9, license:non-copyleft)
;;;     10.  moo (copy-build-system, v0.0.10, license:expat)
;;;     11.  nerd-fonts-cozette-ttf (font-build-system, v1.28.0_3.3.0, license:non-copyleft)
;;;     12.  nhaccuatui (copy-build-system, v2.0.0, license:non-copyleft)
;;;     13.  ntfsplus-dkms-git (copy-build-system, v2026.02.07+e6e7478, license:gpl2)
;;;     14.  ntfsplus-udev (copy-build-system, v2026.02.07+e6e7478, license:gpl2)
;;;     15.  ntsync-dkms (copy-build-system, v6.14, license:non-copyleft)
;;;     16.  obs-cmd (cargo-build-system, v1.0.0, license:expat)
;;;     17.  odoo18-nightly (copy-build-system, v18.0, license:lgpl3)
;;;     18.  oh-my-zsh-git (gnu-build-system, vr7424.c690f7316, license:expat)
;;;     19.  openhardwaremonitor (copy-build-system, v0.9.6, license:non-copyleft)
;;;     20.  openspec (copy-build-system, v1.3.1, license:expat)
;;;     21.  openttd-openmsx (copy-build-system, v0.4.2, license:gpl3+)
;;;     22.  outfieldr-git (copy-build-system, v1.1.1.r3.gfb5ee22, license:expat)
;;;     23.  pacman-systemd-inhibit (copy-build-system, v1.0, license:gpl3+)
;;;     24.  pacserve (copy-build-system, v2021, license:gpl3+)
;;;     25.  perl-poe-component-syndicator (copy-build-system, v0.06, (list license:gpl3+ license:non-copyleft))
;;;     26.  perl-spreadsheet-writeexcel (copy-build-system, v2.40, (list license:gpl3+ license:non-copyleft))
;;;     27.  perl-test-perl-critic (copy-build-system, v1.04, (list license:gpl3+ license:non-copyleft))
;;;     28.  pickdate (go-build-system, v0.0.1, license:expat)
;;;     29.  piper-voices-ru-ru (copy-build-system, v1.0.0, license:expat)
;;;     30.  plasma-mobile-sounds (cmake-build-system, v0.1, license:cc-by4.0)
;;;     31.  plymouth-zfs (copy-build-system, v2.3.4, license:expat)
;;;     32.  pms-git (go-build-system, vr980.628d497, license:expat)
;;;     33.  python2-attrs (copy-build-system, v21.4.0, license:expat)
;;;     34.  python2-funcsigs (copy-build-system, v1.0.2, license:asl2.0)
;;;     35.  python2-idna (copy-build-system, v2.10, license:bsd-3)
;;;     36.  python2-mutagen (copy-build-system, v1.43.1, license:gpl2)
;;;     37.  python2-opengl (copy-build-system, v3.1.6, license:bsd-3)
;;;     38.  python2-py (copy-build-system, v1.11.0, license:expat)
;;;     39.  python2-toml (copy-build-system, v0.10.2, license:expat)
;;;     40.  python2-wheel (copy-build-system, v0.37.1, license:expat)
;;;     41.  python2-zipp (copy-build-system, v1.2.0, license:expat)
;;;     42.  r-data.table (copy-build-system, v1.18.2.1, license:mpl2.0)
;;;     43.  radar-omega (copy-build-system, v5.5.2, license:non-copyleft)
;;;     44.  rate-mirrors-git (cargo-build-system, v0.28.3, license:non-copyleft)
;;;     45.  rawbit (cargo-build-system, v0.1.17, license:expat)
;;;     46.  realvnc-vnc-viewer (copy-build-system, v7.15.1, license:non-copyleft)
;;;     47.  rice-switcher (copy-build-system, v1.3, license:expat)
;;;     48.  rollup (node-build-system, v4.53.3, license:expat)
;;;     49.  rtl8852cu-dkms-morrownr-git (copy-build-system, v20250701, license:expat)
;;;     50.  scx-openrc (copy-build-system, v0.2, license:gpl2)
;;;     51.  sing-box-ref1nd (go-build-system, v1.13.2, license:non-copyleft)
;;;     52.  smithery-cli (node-build-system, v1.6.3, license:agpl3+)
;;;     53.  snap-pac-grub (copy-build-system, v2.1.0, license:expat)
;;;     54.  sql-workbench (copy-build-system, v132, license:non-copyleft)
;;;     55.  sqlite-jdbc (copy-build-system, v3.51.0.0, license:asl2.0)
;;;     56.  steam-cloud-file-manager-bin (copy-build-system, v1.3.3, license:gpl3)
;;;     57.  storageexplorer (copy-build-system, v1.43.0, license:non-copyleft)
;;;     58.  systemd-suspend-modules (copy-build-system, v1.2, license:gpl3+)
;;;     59.  tauno-serial-plotter-bin (copy-build-system, v1.20.2, license:gpl3)
;;;     60.  tfenv (copy-build-system, v3.0.0, license:expat)
;;;     61.  ufw-docker (copy-build-system, v251123, license:non-copyleft)
;;;     62.  usrgrp-manager-bin (copy-build-system, v0.3.0, license:expat)
;;;     63.  vencord-bin (copy-build-system, v1.14.9, license:gpl3)
;;;     64.  vesktop-bin (copy-build-system, v1.6.5, license:gpl3)
;;;     65.  visual-paradigm-163 (copy-build-system, v16.3, license:non-copyleft)
;;;     66.  vrrtest-git (gnu-build-system, vr33.79bd724, license:zlib)
;;;     67.  vscodium-all-marketplace (copy-build-system, v1.0.1, license:non-copyleft)
;;;     68.  vuze (copy-build-system, v5.7.6.0, license:gpl3+)
;;;     69.  wsl-hello-sudo-bin (copy-build-system, v3.0.0, license:expat)
;;;     70.  xerox-spl-driver-common (copy-build-system, v1.00.39.3, license:non-copyleft)
;;;     71.  zsh-fast-syntax-highlighting (copy-build-system, v1.56, license:bsd-3)
;;;     72.  0xtools (copy-build-system, v2.0.3, license:gpl2+)
;;;     73.  8192eu-dkms-git (copy-build-system, vr315.d53a23d, license:gpl3+)
;;;     74.  advcpmv (copy-build-system, v9.5, license:non-copyleft)
;;;     75.  adwaita-qt5 (cmake-build-system, v1.4.2, license:gpl3+)
;;;     76.  adwaita-qt6 (cmake-build-system, v1.4.2, license:gpl3+)
;;;     77.  alacritty-use-theme-git (gnu-build-system, vr18.ffd401b, license:non-copyleft)
;;;     78.  android-apktool (copy-build-system, v3.0.1, license:asl2.0)
;;;     79.  apk-mitm (node-build-system, v1.3.0, license:gpl3)
;;;     80.  apulse (cmake-build-system, v0.1.14, license:non-copyleft)
;;;     81.  arch-shell (copy-build-system, v1.0, license:expat)
;;;     82.  arm-linux-gnueabihf-glibc (copy-build-system, v2.42, (list license:gpl2 license:lgpl2.1+))
;;;     83.  aurvote-utils (copy-build-system, v1.2.0, license:expat)
;;;     84.  beatoraja-modernchic (copy-build-system, v0.8.8, (list license:gpl3 license:non-copyleft))
;;;     85.  bitbox-wallet-app-rpm (copy-build-system, v4.50.1, license:non-copyleft)
;;;     86.  bitburner (node-build-system, v2.8.1, license:asl2.0)
;;;     87.  brother-dcp1610w (copy-build-system, v3.0.1, license:gpl2)
;;;     88.  btrustbiss (copy-build-system, v3.44, license:gpl3+)
;;;     89.  cairo-clock (copy-build-system, v0.3.4, license:gpl3+)
;;;     90.  clp (copy-build-system, v0.4.0, license:non-copyleft)
;;;     91.  dbmodel-qt5 (copy-build-system, v0.3, license:gpl3+)
;;;     92.  deeplx-git (go-build-system, v1.0.1.r1.gf2fa902, license:expat)
;;;     93.  drinfo-git (gnu-build-system, vV.1.2.0.r1.g9b947d2, license:expat)
;;;     94.  dude-bin (copy-build-system, v0.1.1, (list license:asl2.0 license:expat))
;;;     95.  eask-cli-git (node-build-system, vr0.11.2.f2ea3b25, license:gpl3)
;;;     96.  electron39-bin (copy-build-system, v39.8.9, (list license:non-copyleft license:expat))
;;;     97.  eqonomize (copy-build-system, v1.5.12, license:gpl3+)
;;;     98.  flite1 (copy-build-system, v1.4, license:non-copyleft)
;;;     99.  fluent-icon-theme-git (gnu-build-system, v2025.02.10.r1.g7d20e2d, license:gpl3+)
;;;    100.  flutter-dart-google-bin (copy-build-system, v3.35.7, (list license:bsd-3 license:non-copyleft))
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros) unless obtained from PKGBUILD.
;;; Use `guix download` or `guix hash` to obtain real hashes.

(define-module (gaurix packages deptree-resolver-260423f)
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
  #:use-module (guix build-system go)
  #:use-module (guix build-system node)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages pkg-config)
  #:export (
            mailhog
            mingw-w64-dlfcn
            mingw-w64-extra-cmake-modules
            mingw-w64-libtasn1
            mingw-w64-mpfr
            mingw-w64-nettle
            mingw-w64-pkg-config
            mingw-w64-termcap
            mobilesheets-companion
            moo
            nerd-fonts-cozette-ttf
            nhaccuatui
            ntfsplus-dkms-git
            ntfsplus-udev
            ntsync-dkms
            obs-cmd
            odoo18-nightly
            oh-my-zsh-git
            openhardwaremonitor
            openspec
            openttd-openmsx
            outfieldr-git
            pacman-systemd-inhibit
            pacserve
            perl-poe-component-syndicator
            perl-spreadsheet-writeexcel
            perl-test-perl-critic
            pickdate
            piper-voices-ru-ru
            plasma-mobile-sounds
            plymouth-zfs
            pms-git
            python2-attrs
            python2-funcsigs
            python2-idna
            python2-mutagen
            python2-opengl
            python2-py
            python2-toml
            python2-wheel
            python2-zipp
            r-data.table
            radar-omega
            rate-mirrors-git
            rawbit
            realvnc-vnc-viewer
            rice-switcher
            rollup
            rtl8852cu-dkms-morrownr-git
            scx-openrc
            sing-box-ref1nd
            smithery-cli
            snap-pac-grub
            sql-workbench
            sqlite-jdbc
            steam-cloud-file-manager-bin
            storageexplorer
            systemd-suspend-modules
            tauno-serial-plotter-bin
            tfenv
            ufw-docker
            usrgrp-manager-bin
            vencord-bin
            vesktop-bin
            visual-paradigm-163
            vrrtest-git
            vscodium-all-marketplace
            vuze
            wsl-hello-sudo-bin
            xerox-spl-driver-common
            zsh-fast-syntax-highlighting
            pkg-0xtools
            pkg-8192eu-dkms-git
            advcpmv
            adwaita-qt5
            adwaita-qt6
            alacritty-use-theme-git
            android-apktool
            apk-mitm
            apulse
            arch-shell
            arm-linux-gnueabihf-glibc
            aurvote-utils
            beatoraja-modernchic
            bitbox-wallet-app-rpm
            bitburner
            brother-dcp1610w
            btrustbiss
            cairo-clock
            clp
            dbmodel-qt5
            deeplx-git
            drinfo-git
            dude-bin
            eask-cli-git
            electron39-bin
            eqonomize
            flite1
            fluent-icon-theme-git
            flutter-dart-google-bin
            ))

;;; -------------------------------------------------------------------
;;; 7129. mailhog --- web and API based SMTP testing
;;; -------------------------------------------------------------------
(define-public mailhog
  (package
    (name "mailhog")
    (version "1.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/mailhog/MailHog/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments (list #:tests? #f #:import-path "github.com/mailhog/MailHog"))
    (synopsis "web and API based SMTP testing")
    (description "Web and API based SMTP testing.")
    (home-page "https://github.com/mailhog/MailHog")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 29082. mingw-w64-dlfcn --- a wrapper for dlfcn to the Win32 API (mingw-w64)
;;; -------------------------------------------------------------------
(define-public mingw-w64-dlfcn
  (package
    (name "mingw-w64-dlfcn")
    (version "1.4.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/dlfcn-win32/dlfcn-win32/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a wrapper for dlfcn to the Win32 API (mingw-w64)")
    (description "A wrapper for dlfcn to the Win32 API (mingw-w64).")
    (home-page "https://github.com/dlfcn-win32/dlfcn-win32")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 26799. mingw-w64-extra-cmake-modules --- extra modules and scripts for CMake (mingw-w64)
;;; -------------------------------------------------------------------
(define-public mingw-w64-extra-cmake-modules
  (package
    (name "mingw-w64-extra-cmake-modules")
    (version "6.19.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://community.kde.org/Frameworks/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "extra modules and scripts for CMake (mingw-w64)")
    (description "Extra modules and scripts for CMake (mingw-w64).")
    (home-page "https://community.kde.org/Frameworks")
    (license license:lgpl3+)))

;;; -------------------------------------------------------------------
;;; 25524. mingw-w64-libtasn1 --- the ASN.1 library used in GNUTLS (mingw-w64)
;;; -------------------------------------------------------------------
(define-public mingw-w64-libtasn1
  (package
    (name "mingw-w64-libtasn1")
    (version "4.19.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://www.gnu.org/software/libtasn1/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the ASN.1 library used in GNUTLS (mingw-w64)")
    (description "The ASN.1 library used in GNUTLS (mingw-w64).")
    (home-page "http://www.gnu.org/software/libtasn1")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 27096. mingw-w64-mpfr --- multiple-precision floating-point library (mingw-w64)
;;; -------------------------------------------------------------------
(define-public mingw-w64-mpfr
  (package
    (name "mingw-w64-mpfr")
    (version "4.2.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://www.mpfr.org/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "multiple-precision floating-point library (mingw-w64)")
    (description "Multiple-precision floating-point library (mingw-w64).")
    (home-page "http://www.mpfr.org")
    (license license:lgpl3+)))

;;; -------------------------------------------------------------------
;;; 26282. mingw-w64-nettle --- a low-level cryptographic library (mingw-w64)
;;; -------------------------------------------------------------------
(define-public mingw-w64-nettle
  (package
    (name "mingw-w64-nettle")
    (version "3.10.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://www.lysator.liu.se/~nisse/nettle/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a low-level cryptographic library (mingw-w64)")
    (description "A low-level cryptographic library (mingw-w64).")
    (home-page "http://www.lysator.liu.se/~nisse/nettle")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 11159. mingw-w64-pkg-config --- support pkg-config script (does not depend on any particular version o...
;;; -------------------------------------------------------------------
(define-public mingw-w64-pkg-config
  (package
    (name "mingw-w64-pkg-config")
    (version "2")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://pkg-config.freedesktop.org/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "support pkg-config script (does not depend on any particular version of pkg-c...")
    (description "Support pkg-config script (does not depend on any particular version of pkg-config). Useful for pkg-config powered cross-compiling with mingw-w64, see http://tinyurl.com/pkg-config-cross for more info.")
    (home-page "http://pkg-config.freedesktop.org/")
    (license license:zlib)))

;;; -------------------------------------------------------------------
;;; 23052. mingw-w64-termcap --- terminal feature database (mingw-w64)
;;; -------------------------------------------------------------------
(define-public mingw-w64-termcap
  (package
    (name "mingw-w64-termcap")
    (version "1.3.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://ftp.gnu.org/gnu/termcap/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "terminal feature database (mingw-w64)")
    (description "Terminal feature database (mingw-w64).")
    (home-page "https://ftp.gnu.org/gnu/termcap/")
    (license (list license:gpl3+ license:lgpl3+))))

;;; -------------------------------------------------------------------
;;; 7842. mobilesheets-companion --- companion app for MobileSheets to remotely manage sheet libraries
;;; -------------------------------------------------------------------
(define-public mobilesheets-companion
  (package
    (name "mobilesheets-companion")
    (version "4.1.9")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.zubersoft.com/mobilesheets/companion/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "companion app for MobileSheets to remotely manage sheet libraries")
    (description "Companion app for MobileSheets to remotely manage sheet libraries.")
    (home-page "https://www.zubersoft.com/mobilesheets/companion/")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 5986. moo --- sick terminal music player with smart playlists
;;; -------------------------------------------------------------------
(define-public moo
  (package
    (name "moo")
    (version "0.0.10")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/vdawg-git/moo/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "sick terminal music player with smart playlists")
    (description "Sick terminal music player with smart playlists.")
    (home-page "https://github.com/vdawg-git/moo/")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 7109. nerd-fonts-cozette-ttf --- cozette Font, patched with the Nerd Fonts Patcher
;;; -------------------------------------------------------------------
(define-public nerd-fonts-cozette-ttf
  (package
    (name "nerd-fonts-cozette-ttf")
    (version "1.28.0_3.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/slavfox/cozette/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (arguments (list #:tests? #f))
    (synopsis "cozette Font, patched with the Nerd Fonts Patcher")
    (description "Cozette Font, patched with the Nerd Fonts Patcher.")
    (home-page "https://github.com/slavfox/cozette/")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 5914. nhaccuatui --- nghe nhạc mọi lúc mọi nơi
;;; -------------------------------------------------------------------
(define-public nhaccuatui
  (package
    (name "nhaccuatui")
    (version "2.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://apps.nhaccuatui.com/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "nghe nhạc mọi lúc mọi nơi")
    (description "Nghe nhạc mọi lúc mọi nơi.")
    (home-page "https://apps.nhaccuatui.com")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 333. ntfsplus-dkms-git --- dKMS module for ntfs (with aliases)
;;; -------------------------------------------------------------------
(define-public ntfsplus-dkms-git
  (package
    (name "ntfsplus-dkms-git")
    (version "2026.02.07+e6e7478")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/namjaejeon/linux-ntfs")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "dKMS module for ntfs (with aliases)")
    (description "DKMS module for ntfs (with aliases).")
    (home-page "https://github.com/namjaejeon/linux-ntfs")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 332. ntfsplus-udev --- udev rules for ntfsplus
;;; -------------------------------------------------------------------
(define-public ntfsplus-udev
  (package
    (name "ntfsplus-udev")
    (version "2026.02.07+e6e7478")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/namjaejeon/linux-ntfs/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "udev rules for ntfsplus")
    (description "Udev rules for ntfsplus.")
    (home-page "https://github.com/namjaejeon/linux-ntfs")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 15010. ntsync-dkms --- nT synchronization primitive driver - out-of-tree module
;;; -------------------------------------------------------------------
(define-public ntsync-dkms
  (package
    (name "ntsync-dkms")
    (version "6.14")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://lore.kernel.org/lkml/20240519202454.1192826-1-zfigura@codeweavers.com/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "nT synchronization primitive driver - out-of-tree module")
    (description "NT synchronization primitive driver - out-of-tree module.")
    (home-page "https://lore.kernel.org/lkml/20240519202454.1192826-1-zfigura@codeweavers.com/")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 1669. obs-cmd --- a minimal OBS CLI for obs-websocket v5
;;; -------------------------------------------------------------------
(define-public obs-cmd
  (package
    (name "obs-cmd")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/grigio/obs-cmd/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a minimal OBS CLI for obs-websocket v5")
    (description "A minimal OBS CLI for obs-websocket v5.")
    (home-page "https://github.com/grigio/obs-cmd")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 14669. odoo18-nightly --- odoo. Open Source Apps To Grow Your Business
;;; -------------------------------------------------------------------
(define-public odoo18-nightly
  (package
    (name "odoo18-nightly")
    (version "18.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://odoo.com/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "odoo. Open Source Apps To Grow Your Business")
    (description "Odoo. Open Source Apps To Grow Your Business.")
    (home-page "https://odoo.com/")
    (license license:lgpl3)))

;;; -------------------------------------------------------------------
;;; 1864. oh-my-zsh-git --- a community-driven framework for managing your zsh configuration. Incl...
;;; -------------------------------------------------------------------
(define-public oh-my-zsh-git
  (package
    (name "oh-my-zsh-git")
    (version "r7424.c690f7316")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ohmyzsh/ohmyzsh")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (synopsis "a community-driven framework for managing your zsh configuration. Includes 18...")
    (description "A community-driven framework for managing your zsh configuration. Includes 180+ optional plugins and over 120 themes to spice up your morning, and an auto-update tool so that makes it easy to keep up with the latest updates from the community.")
    (home-page "https://github.com/ohmyzsh/ohmyzsh")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 8475. openhardwaremonitor --- an open source program that monitors temperature sensors, fan speeds, ...
;;; -------------------------------------------------------------------
(define-public openhardwaremonitor
  (package
    (name "openhardwaremonitor")
    (version "0.9.6")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://openhardwaremonitor.org/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "an open source program that monitors temperature sensors, fan speeds, voltage...")
    (description "An open source program that monitors temperature sensors, fan speeds, voltages, load and clock speeds of a computer.")
    (home-page "http://openhardwaremonitor.org/")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 157. openspec --- aI-native system for spec-driven development
;;; -------------------------------------------------------------------
(define-public openspec
  (package
    (name "openspec")
    (version "1.3.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/Fission-AI/OpenSpec/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "aI-native system for spec-driven development")
    (description "AI-native system for spec-driven development.")
    (home-page "https://github.com/Fission-AI/OpenSpec")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 7121. openttd-openmsx --- free music set for openttd
;;; -------------------------------------------------------------------
(define-public openttd-openmsx
  (package
    (name "openttd-openmsx")
    (version "0.4.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://www.openttd.org/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "free music set for openttd")
    (description "Free music set for openttd.")
    (home-page "http://www.openttd.org")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 5775. outfieldr-git --- tLDR client in zig
;;; -------------------------------------------------------------------
(define-public outfieldr-git
  (package
    (name "outfieldr-git")
    (version "1.1.1.r3.gfb5ee22")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.com/ve-nt/outfieldr")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "tLDR client in zig")
    (description "TLDR client in zig.")
    (home-page "https://gitlab.com/ve-nt/outfieldr")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 8653. pacman-systemd-inhibit --- inhibit system shutdown, reboot etc. when pacman is upgrading the syst...
;;; -------------------------------------------------------------------
(define-public pacman-systemd-inhibit
  (package
    (name "pacman-systemd-inhibit")
    (version "1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/amishmm/pacman-systemd-inhibit/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "inhibit system shutdown, reboot etc. when pacman is upgrading the system")
    (description "Inhibit system shutdown, reboot etc. when pacman is upgrading the system.")
    (home-page "https://github.com/amishmm/pacman-systemd-inhibit")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 8090. pacserve --- easily share Pacman packages between computers. A replacement for PkgD
;;; -------------------------------------------------------------------
(define-public pacserve
  (package
    (name "pacserve")
    (version "2021")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://xyne.dev/projects/pacserve/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "easily share Pacman packages between computers. A replacement for PkgD")
    (description "Easily share Pacman packages between computers. A replacement for PkgD.")
    (home-page "https://xyne.dev/projects/pacserve")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 869. perl-poe-component-syndicator --- a POE component base class which implements the Observer pattern
;;; -------------------------------------------------------------------
(define-public perl-poe-component-syndicator
  (package
    (name "perl-poe-component-syndicator")
    (version "0.06")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://metacpan.org/release/POE-Component-Syndicator/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a POE component base class which implements the Observer pattern")
    (description "A POE component base class which implements the Observer pattern.")
    (home-page "https://metacpan.org/release/POE-Component-Syndicator")
    (license (list license:gpl3+ license:non-copyleft))))

;;; -------------------------------------------------------------------
;;; 1084. perl-spreadsheet-writeexcel --- write to a cross-platform Excel binary file
;;; -------------------------------------------------------------------
(define-public perl-spreadsheet-writeexcel
  (package
    (name "perl-spreadsheet-writeexcel")
    (version "2.40")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://metacpan.org/release/Spreadsheet-WriteExcel/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "write to a cross-platform Excel binary file")
    (description "Write to a cross-platform Excel binary file.")
    (home-page "https://metacpan.org/release/Spreadsheet-WriteExcel")
    (license (list license:gpl3+ license:non-copyleft))))

;;; -------------------------------------------------------------------
;;; 762. perl-test-perl-critic --- use Perl::Critic in test programs
;;; -------------------------------------------------------------------
(define-public perl-test-perl-critic
  (package
    (name "perl-test-perl-critic")
    (version "1.04")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://metacpan.org/release/Test-Perl-Critic/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "use Perl::Critic in test programs")
    (description "Use Perl::Critic in test programs.")
    (home-page "https://metacpan.org/release/Test-Perl-Critic")
    (license (list license:gpl3+ license:non-copyleft))))

;;; -------------------------------------------------------------------
;;; 7853. pickdate --- datepicker for terminal
;;; -------------------------------------------------------------------
(define-public pickdate
  (package
    (name "pickdate")
    (version "0.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/maraloon/pickdate/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments (list #:tests? #f #:import-path "github.com/maraloon/pickdate"))
    (synopsis "datepicker for terminal")
    (description "Datepicker for terminal.")
    (home-page "https://github.com/maraloon/pickdate")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 5897. piper-voices-ru-ru --- voices for Piper text to speech system (ru_RU)
;;; -------------------------------------------------------------------
(define-public piper-voices-ru-ru
  (package
    (name "piper-voices-ru-ru")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://huggingface.co/rhasspy/piper-voices/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "voices for Piper text to speech system (ru_RU)")
    (description "Voices for Piper text to speech system (ru_RU).")
    (home-page "https://huggingface.co/rhasspy/piper-voices")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 9440. plasma-mobile-sounds --- sounds for Plasma Mobile
;;; -------------------------------------------------------------------
(define-public plasma-mobile-sounds
  (package
    (name "plasma-mobile-sounds")
    (version "0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://invent.kde.org/plasma-mobile/plasma-mobile-sounds/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (synopsis "sounds for Plasma Mobile")
    (description "Sounds for Plasma Mobile.")
    (home-page "https://invent.kde.org/plasma-mobile/plasma-mobile-sounds")
    (license license:cc-by4.0)))

;;; -------------------------------------------------------------------
;;; 7176. plymouth-zfs --- initcpio hook to support native zfs encryption for plymouth
;;; -------------------------------------------------------------------
(define-public plymouth-zfs
  (package
    (name "plymouth-zfs")
    (version "2.3.4")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://unknown/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "initcpio hook to support native zfs encryption for plymouth")
    (description "Initcpio hook to support native zfs encryption for plymouth.")
    (home-page "https://aur.archlinux.org/packages/plymouth-zfs")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 7931. pms-git --- practical Music Search is an interactive Vim-like console client for t...
;;; -------------------------------------------------------------------
(define-public pms-git
  (package
    (name "pms-git")
    (version "r980.628d497")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ambientsound/pms")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments (list #:tests? #f #:import-path "github.com/ambientsound/pms"))
    (synopsis "practical Music Search is an interactive Vim-like console client for the Musi...")
    (description "Practical Music Search is an interactive Vim-like console client for the Music Player Daemon.")
    (home-page "https://github.com/ambientsound/pms")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 34666. python2-attrs --- attributes without boilerplate. (Python 2)
;;; -------------------------------------------------------------------
(define-public python2-attrs
  (package
    (name "python2-attrs")
    (version "21.4.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://attrs.readthedocs.org/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "attributes without boilerplate. (Python 2)")
    (description "Attributes without boilerplate. (Python 2).")
    (home-page "https://attrs.readthedocs.org/")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 34668. python2-funcsigs --- python function signatures from PEP362
;;; -------------------------------------------------------------------
(define-public python2-funcsigs
  (package
    (name "python2-funcsigs")
    (version "1.0.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://pypi.python.org/pypi/funcsigs/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "python function signatures from PEP362")
    (description "Python function signatures from PEP362.")
    (home-page "https://pypi.python.org/pypi/funcsigs")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 42812. python2-idna --- internationalized Domain Names in Applications (IDNA)
;;; -------------------------------------------------------------------
(define-public python2-idna
  (package
    (name "python2-idna")
    (version "2.10")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/kjd/idna/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "internationalized Domain Names in Applications (IDNA)")
    (description "Internationalized Domain Names in Applications (IDNA).")
    (home-page "https://github.com/kjd/idna")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; 24893. python2-mutagen --- an audio metadata tag reader and writer (python2 library)
;;; -------------------------------------------------------------------
(define-public python2-mutagen
  (package
    (name "python2-mutagen")
    (version "1.43.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/quodlibet/mutagen/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "an audio metadata tag reader and writer (python2 library)")
    (description "An audio metadata tag reader and writer (python2 library).")
    (home-page "https://github.com/quodlibet/mutagen")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 36754. python2-opengl --- the most common cross platform Python binding to OpenGL and related AP...
;;; -------------------------------------------------------------------
(define-public python2-opengl
  (package
    (name "python2-opengl")
    (version "3.1.6")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://pyopengl.sourceforge.net/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the most common cross platform Python binding to OpenGL and related APIs (for...")
    (description "The most common cross platform Python binding to OpenGL and related APIs (for Python 2.7).")
    (home-page "http://pyopengl.sourceforge.net")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; 34676. python2-py --- i/O facilities including logging, local/SVN paths, INI parsing, API co...
;;; -------------------------------------------------------------------
(define-public python2-py
  (package
    (name "python2-py")
    (version "1.11.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://pypi.python.org/pypi/py/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "i/O facilities including logging, local/SVN paths, INI parsing, API control, ...")
    (description "I/O facilities including logging, local/SVN paths, INI parsing, API control, lazy importing and Python code generation/introspection.")
    (home-page "https://pypi.python.org/pypi/py")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 32797. python2-toml --- a Python library for parsing and creating TOML
;;; -------------------------------------------------------------------
(define-public python2-toml
  (package
    (name "python2-toml")
    (version "0.10.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/uiri/toml/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a Python library for parsing and creating TOML")
    (description "A Python library for parsing and creating TOML.")
    (home-page "https://github.com/uiri/toml")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 41435. python2-wheel --- a built-package format for Python, version for Python 2.7
;;; -------------------------------------------------------------------
(define-public python2-wheel
  (package
    (name "python2-wheel")
    (version "0.37.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/pypa/wheel/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a built-package format for Python, version for Python 2.7")
    (description "A built-package format for Python, version for Python 2.7.")
    (home-page "https://github.com/pypa/wheel")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 30849. python2-zipp --- backport of pathlib-compatible object wrapper for zip files
;;; -------------------------------------------------------------------
(define-public python2-zipp
  (package
    (name "python2-zipp")
    (version "1.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/jaraco/zipp/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "backport of pathlib-compatible object wrapper for zip files")
    (description "Backport of pathlib-compatible object wrapper for zip files.")
    (home-page "https://github.com/jaraco/zipp")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 17274. r-data.table --- extension of ‘data.frame’
;;; -------------------------------------------------------------------
(define-public r-data.table
  (package
    (name "r-data.table")
    (version "1.18.2.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://cran.r-project.org/package=data.table/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "extension of ‘data.frame’")
    (description "Extension of ‘data.frame’.")
    (home-page "https://cran.r-project.org/package=data.table")
    (license license:mpl2.0)))

;;; -------------------------------------------------------------------
;;; 8132. radar-omega --- radar Omega - Advanced weather radar application (AppImage)
;;; -------------------------------------------------------------------
(define-public radar-omega
  (package
    (name "radar-omega")
    (version "5.5.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://radaromega.com/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "radar Omega - Advanced weather radar application (AppImage)")
    (description "Radar Omega - Advanced weather radar application (AppImage).")
    (home-page "https://radaromega.com")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 1869. rate-mirrors-git --- everyday-use client-side map-aware mirror ranking tool
;;; -------------------------------------------------------------------
(define-public rate-mirrors-git
  (package
    (name "rate-mirrors-git")
    (version "0.28.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/westandskif/rate-mirrors")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "everyday-use client-side map-aware mirror ranking tool")
    (description "Everyday-use client-side map-aware mirror ranking tool.")
    (home-page "https://github.com/westandskif/rate-mirrors")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 8466. rawbit --- a camera RAW photo preprocessor and importer
;;; -------------------------------------------------------------------
(define-public rawbit
  (package
    (name "rawbit")
    (version "0.1.17")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/cartercanedy/rawbit/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a camera RAW photo preprocessor and importer")
    (description "A camera RAW photo preprocessor and importer.")
    (home-page "https://github.com/cartercanedy/rawbit")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 8061. realvnc-vnc-viewer --- vNC remote desktop client software by RealVNC
;;; -------------------------------------------------------------------
(define-public realvnc-vnc-viewer
  (package
    (name "realvnc-vnc-viewer")
    (version "7.15.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.realvnc.com/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "vNC remote desktop client software by RealVNC")
    (description "VNC remote desktop client software by RealVNC.")
    (home-page "https://www.realvnc.com/")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 6000. rice-switcher --- cLI tool for managing and switching between Linux config sets
;;; -------------------------------------------------------------------
(define-public rice-switcher
  (package
    (name "rice-switcher")
    (version "1.3")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/S1rEx1/Rice-Switcher/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "cLI tool for managing and switching between Linux config sets")
    (description "CLI tool for managing and switching between Linux config sets.")
    (home-page "https://github.com/S1rEx1/Rice-Switcher")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 8025. rollup --- next-generation ES6 module bundler
;;; -------------------------------------------------------------------
(define-public rollup
  (package
    (name "rollup")
    (version "4.53.3")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://rollupjs.org/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (synopsis "next-generation ES6 module bundler")
    (description "Next-generation ES6 module bundler.")
    (home-page "https://rollupjs.org/")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 8480. rtl8852cu-dkms-morrownr-git --- realtek RTL8852CU WiFi driver (DKMS, morrownr's fork, git version)
;;; -------------------------------------------------------------------
(define-public rtl8852cu-dkms-morrownr-git
  (package
    (name "rtl8852cu-dkms-morrownr-git")
    (version "20250701")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/9M2PJU/rtl8852cu-20240510-aur")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "realtek RTL8852CU WiFi driver (DKMS, morrownr's fork, git version)")
    (description "Realtek RTL8852CU WiFi driver (DKMS, morrownr's fork, git version).")
    (home-page "https://github.com/9M2PJU/rtl8852cu-20240510-aur")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 5903. scx-openrc --- openRC init script for scx-scheds
;;; -------------------------------------------------------------------
(define-public scx-openrc
  (package
    (name "scx-openrc")
    (version "0.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/pkgbase/scx-openrc/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "openRC init script for scx-scheds")
    (description "OpenRC init script for scx-scheds.")
    (home-page "https://aur.archlinux.org/pkgbase/scx-openrc")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 1651. sing-box-ref1nd --- the universal proxy platform
;;; -------------------------------------------------------------------
(define-public sing-box-ref1nd
  (package
    (name "sing-box-ref1nd")
    (version "1.13.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/reF1nd/sing-box/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments (list #:tests? #f #:import-path "github.com/reF1nd/sing-box"))
    (synopsis "the universal proxy platform")
    (description "The universal proxy platform.")
    (home-page "https://github.com/reF1nd/sing-box")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 8481. smithery-cli --- registry installer and manager for Model Context Protocol (MCP) server...
;;; -------------------------------------------------------------------
(define-public smithery-cli
  (package
    (name "smithery-cli")
    (version "1.6.3")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://smithery.ai/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (synopsis "registry installer and manager for Model Context Protocol (MCP) servers")
    (description "Registry installer and manager for Model Context Protocol (MCP) servers.")
    (home-page "https://smithery.ai/")
    (license license:agpl3+)))

;;; -------------------------------------------------------------------
;;; 6005. snap-pac-grub --- pacman hook to update GRUB entries for grub-btrfs after snap-pac made ...
;;; -------------------------------------------------------------------
(define-public snap-pac-grub
  (package
    (name "snap-pac-grub")
    (version "2.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/maximbaz/snap-pac-grub/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "pacman hook to update GRUB entries for grub-btrfs after snap-pac made snapshots")
    (description "Pacman hook to update GRUB entries for grub-btrfs after snap-pac made snapshots.")
    (home-page "https://github.com/maximbaz/snap-pac-grub")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 7935. sql-workbench --- sQL Workbench/J is a free, DBMS-independent, cross-platform SQL query ...
;;; -------------------------------------------------------------------
(define-public sql-workbench
  (package
    (name "sql-workbench")
    (version "132")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.sql-workbench.eu/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "sQL Workbench/J is a free, DBMS-independent, cross-platform SQL query tool")
    (description "SQL Workbench/J is a free, DBMS-independent, cross-platform SQL query tool.")
    (home-page "https://www.sql-workbench.eu/")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 7862. sqlite-jdbc --- jDBC driver for SQLite
;;; -------------------------------------------------------------------
(define-public sqlite-jdbc
  (package
    (name "sqlite-jdbc")
    (version "3.51.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/xerial/sqlite-jdbc/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "jDBC driver for SQLite")
    (description "JDBC driver for SQLite.")
    (home-page "https://github.com/xerial/sqlite-jdbc")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 5813. steam-cloud-file-manager-bin --- steam Cloud File Manager - 管理和查看 Steam 云存档文件的实用工具
;;; -------------------------------------------------------------------
(define-public steam-cloud-file-manager-bin
  (package
    (name "steam-cloud-file-manager-bin")
    (version "1.3.3")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/Fldicoahkiin/SteamCloudFileManager/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "steam Cloud File Manager - 管理和查看 Steam 云存档文件的实用工具")
    (description "Steam Cloud File Manager - 管理和查看 Steam 云存档文件的实用工具.")
    (home-page "https://github.com/Fldicoahkiin/SteamCloudFileManager")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 8741. storageexplorer --- microsoft Azure Storage Explorer is a standalone app from Microsoft th...
;;; -------------------------------------------------------------------
(define-public storageexplorer
  (package
    (name "storageexplorer")
    (version "1.43.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/microsoft/AzureStorageExplorer/releases/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "microsoft Azure Storage Explorer is a standalone app from Microsoft that allo...")
    (description "Microsoft Azure Storage Explorer is a standalone app from Microsoft that allows you to easily work with Azure Storage data on Windows, macOS and Linux.")
    (home-page "https://github.com/microsoft/AzureStorageExplorer/releases")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 3006. systemd-suspend-modules --- reload modules on suspend/hibernate with systemd
;;; -------------------------------------------------------------------
(define-public systemd-suspend-modules
  (package
    (name "systemd-suspend-modules")
    (version "1.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/packages/systemd-suspend-modules/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "reload modules on suspend/hibernate with systemd")
    (description "Reload modules on suspend/hibernate with systemd.")
    (home-page "https://aur.archlinux.org/packages/systemd-suspend-modules")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 5902. tauno-serial-plotter-bin --- serial Plotter for Arduino and other embedded devices
;;; -------------------------------------------------------------------
(define-public tauno-serial-plotter-bin
  (package
    (name "tauno-serial-plotter-bin")
    (version "1.20.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/taunoe/tauno-serial-plotter/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "serial Plotter for Arduino and other embedded devices")
    (description "Serial Plotter for Arduino and other embedded devices.")
    (home-page "https://github.com/taunoe/tauno-serial-plotter")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 7156. tfenv --- terraform version manager inspired by rbenv
;;; -------------------------------------------------------------------
(define-public tfenv
  (package
    (name "tfenv")
    (version "3.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/tfutils/tfenv/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "terraform version manager inspired by rbenv")
    (description "Terraform version manager inspired by rbenv.")
    (home-page "https://github.com/tfutils/tfenv")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 327. ufw-docker --- to fix the Docker and UFW security flaw without disabling iptables
;;; -------------------------------------------------------------------
(define-public ufw-docker
  (package
    (name "ufw-docker")
    (version "251123")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/chaifeng/ufw-docker/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "to fix the Docker and UFW security flaw without disabling iptables")
    (description "To fix the Docker and UFW security flaw without disabling iptables.")
    (home-page "https://github.com/chaifeng/ufw-docker")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 8080. usrgrp-manager-bin --- keyboard-driven TUI to view and manage UNIX users and groups (prebuilt...
;;; -------------------------------------------------------------------
(define-public usrgrp-manager-bin
  (package
    (name "usrgrp-manager-bin")
    (version "0.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/Firstp1ck/UsrGrp-Manager-TUI/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "keyboard-driven TUI to view and manage UNIX users and groups (prebuilt binary)")
    (description "Keyboard-driven TUI to view and manage UNIX users and groups (prebuilt binary).")
    (home-page "https://github.com/Firstp1ck/UsrGrp-Manager-TUI")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 8436. vencord-bin --- the cutest Discord client mod (replaces Vesktop's built-in Vencord)
;;; -------------------------------------------------------------------
(define-public vencord-bin
  (package
    (name "vencord-bin")
    (version "1.14.9")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://vencord.dev/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the cutest Discord client mod (replaces Vesktop's built-in Vencord)")
    (description "The cutest Discord client mod (replaces Vesktop's built-in Vencord).")
    (home-page "https://vencord.dev")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 11341. vesktop-bin --- a cross platform electron-based desktop app aiming to give you a snapp...
;;; -------------------------------------------------------------------
(define-public vesktop-bin
  (package
    (name "vesktop-bin")
    (version "1.6.5")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/Vencord/Vesktop/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a cross platform electron-based desktop app aiming to give you a snappier Dis...")
    (description "A cross platform electron-based desktop app aiming to give you a snappier Discord experience with Vencord pre-installed.(Prebuilt version.Use system-wide electron).")
    (home-page "https://github.com/Vencord/Vesktop")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 8723. visual-paradigm-163 --- visual Paradigm version 16.3
;;; -------------------------------------------------------------------
(define-public visual-paradigm-163
  (package
    (name "visual-paradigm-163")
    (version "16.3")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.visual-paradigm.com/download/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "visual Paradigm version 16.3")
    (description "Visual Paradigm version 16.3.")
    (home-page "https://www.visual-paradigm.com/download/")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 2189. vrrtest-git --- a very small utility to test variable refresh rate
;;; -------------------------------------------------------------------
(define-public vrrtest-git
  (package
    (name "vrrtest-git")
    (version "r33.79bd724")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Nixola/VRRTest")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (synopsis "a very small utility to test variable refresh rate")
    (description "A very small utility to test variable refresh rate.")
    (home-page "https://github.com/Nixola/VRRTest")
    (license license:zlib)))

;;; -------------------------------------------------------------------
;;; 5943. vscodium-all-marketplace --- enable vscode marketplace in all vscodium versions
;;; -------------------------------------------------------------------
(define-public vscodium-all-marketplace
  (package
    (name "vscodium-all-marketplace")
    (version "1.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://marketplace.visualstudio.com/vscode/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "enable vscode marketplace in all vscodium versions")
    (description "Enable vscode marketplace in all vscodium versions.")
    (home-page "https://marketplace.visualstudio.com/vscode")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 23315. vuze --- a feature-rich Java-based BitTorrent client (previously called 'Azureu...
;;; -------------------------------------------------------------------
(define-public vuze
  (package
    (name "vuze")
    (version "5.7.6.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://sourceforge.net/projects/azureus/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a feature-rich Java-based BitTorrent client (previously called 'Azureus')")
    (description "A feature-rich Java-based BitTorrent client (previously called 'Azureus').")
    (home-page "https://sourceforge.net/projects/azureus/")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 8051. wsl-hello-sudo-bin --- linux PAM module to utilise Windows Hello authentication on WSL
;;; -------------------------------------------------------------------
(define-public wsl-hello-sudo-bin
  (package
    (name "wsl-hello-sudo-bin")
    (version "3.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/lzlrd/wsl-hello-sudo/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "linux PAM module to utilise Windows Hello authentication on WSL")
    (description "Linux PAM module to utilise Windows Hello authentication on WSL.")
    (home-page "https://github.com/lzlrd/wsl-hello-sudo")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 20634. xerox-spl-driver-common --- license Xerox SPL Linux Driver for printers and scanners
;;; -------------------------------------------------------------------
(define-public xerox-spl-driver-common
  (package
    (name "xerox-spl-driver-common")
    (version "1.00.39.3")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.support.xerox.com/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "license Xerox SPL Linux Driver for printers and scanners")
    (description "License Xerox SPL Linux Driver for printers and scanners.")
    (home-page "https://www.support.xerox.com")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 2198. zsh-fast-syntax-highlighting --- optimized and extended zsh-syntax-highlighting
;;; -------------------------------------------------------------------
(define-public zsh-fast-syntax-highlighting
  (package
    (name "zsh-fast-syntax-highlighting")
    (version "1.56")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/zdharma-continuum/fast-syntax-highlighting/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "optimized and extended zsh-syntax-highlighting")
    (description "Optimized and extended zsh-syntax-highlighting.")
    (home-page "https://github.com/zdharma-continuum/fast-syntax-highlighting")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; 8753. 0xtools --- 0x.Tools: X-Ray vision for Linux systems
;;; -------------------------------------------------------------------
(define-public pkg-0xtools
  (package
    (name "0xtools")
    (version "2.0.3")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/tanelpoder/0xtools/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "0x.Tools: X-Ray vision for Linux systems")
    (description "0x.Tools: X-Ray vision for Linux systems.")
    (home-page "https://github.com/tanelpoder/0xtools")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 15373. 8192eu-dkms-git --- driver for the Realtek 8192eu chipset (DKMS)
;;; -------------------------------------------------------------------
(define-public pkg-8192eu-dkms-git
  (package
    (name "8192eu-dkms-git")
    (version "r315.d53a23d")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Mange/rtl8192eu-linux-driver")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "driver for the Realtek 8192eu chipset (DKMS)")
    (description "Driver for the Realtek 8192eu chipset (DKMS).")
    (home-page "https://github.com/Mange/rtl8192eu-linux-driver")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 1661. advcpmv --- 'cp' and 'mv' utilities with progress bar patches
;;; -------------------------------------------------------------------
(define-public advcpmv
  (package
    (name "advcpmv")
    (version "9.5")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/jarun/advcpmv/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "'cp' and 'mv' utilities with progress bar patches")
    (description "'cp' and 'mv' utilities with progress bar patches.")
    (home-page "https://github.com/jarun/advcpmv")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 2180. adwaita-qt5 --- a style to bend Qt5 applications to look like they belong into GNOME S...
;;; -------------------------------------------------------------------
(define-public adwaita-qt5
  (package
    (name "adwaita-qt5")
    (version "1.4.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/FedoraQt/adwaita-qt/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (synopsis "a style to bend Qt5 applications to look like they belong into GNOME Shell")
    (description "A style to bend Qt5 applications to look like they belong into GNOME Shell.")
    (home-page "https://github.com/FedoraQt/adwaita-qt")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 2179. adwaita-qt6 --- a style to bend Qt6 applications to look like they belong into GNOME S...
;;; -------------------------------------------------------------------
(define-public adwaita-qt6
  (package
    (name "adwaita-qt6")
    (version "1.4.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/FedoraQt/adwaita-qt/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (synopsis "a style to bend Qt6 applications to look like they belong into GNOME Shell")
    (description "A style to bend Qt6 applications to look like they belong into GNOME Shell.")
    (home-page "https://github.com/FedoraQt/adwaita-qt")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 5940. alacritty-use-theme-git --- ::Rolling release:: A Small utility to switch the selected theme used ...
;;; -------------------------------------------------------------------
(define-public alacritty-use-theme-git
  (package
    (name "alacritty-use-theme-git")
    (version "r18.ffd401b")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/alacritty-use-theme/alacritty-use-theme")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (synopsis "::Rolling release:: A Small utility to switch the selected theme used by alac...")
    (description "::Rolling release:: A Small utility to switch the selected theme used by alacritty terminal.")
    (home-page "https://github.com/alacritty-use-theme/alacritty-use-theme")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 1876. android-apktool --- a tool for reengineering Android apk files
;;; -------------------------------------------------------------------
(define-public android-apktool
  (package
    (name "android-apktool")
    (version "3.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/iBotPeaches/Apktool/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a tool for reengineering Android apk files")
    (description "A tool for reengineering Android apk files.")
    (home-page "https://github.com/iBotPeaches/Apktool")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 17279. apk-mitm --- a CLI application that automatically prepares Android APK files for HT...
;;; -------------------------------------------------------------------
(define-public apk-mitm
  (package
    (name "apk-mitm")
    (version "1.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.npmjs.com/package/apk-mitm/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a CLI application that automatically prepares Android APK files for HTTPS ins...")
    (description "A CLI application that automatically prepares Android APK files for HTTPS inspection.")
    (home-page "https://www.npmjs.com/package/apk-mitm")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 9511. apulse --- pulseAudio emulation for ALSA
;;; -------------------------------------------------------------------
(define-public apulse
  (package
    (name "apulse")
    (version "0.1.14")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/i-rinat/apulse/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (synopsis "pulseAudio emulation for ALSA")
    (description "PulseAudio emulation for ALSA.")
    (home-page "https://github.com/i-rinat/apulse")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 14726. arch-shell --- outil pour créer des environnements chroot Arch jetables, façon nix-sh...
;;; -------------------------------------------------------------------
(define-public arch-shell
  (package
    (name "arch-shell")
    (version "1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/0xbbuddha/arch-shell/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "outil pour créer des environnements chroot Arch jetables, façon nix-shell, ba...")
    (description "Outil pour créer des environnements chroot Arch jetables, façon nix-shell, basé sur devtools.")
    (home-page "https://github.com/0xbbuddha/arch-shell")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 8452. arm-linux-gnueabihf-glibc --- gNU C Library
;;; -------------------------------------------------------------------
(define-public arm-linux-gnueabihf-glibc
  (package
    (name "arm-linux-gnueabihf-glibc")
    (version "2.42")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.gnu.org/software/libc/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "gNU C Library")
    (description "GNU C Library.")
    (home-page "https://www.gnu.org/software/libc/")
    (license (list license:gpl2 license:lgpl2.1+))))

;;; -------------------------------------------------------------------
;;; 11352. aurvote-utils --- a set of utilities for managing AUR votes
;;; -------------------------------------------------------------------
(define-public aurvote-utils
  (package
    (name "aurvote-utils")
    (version "1.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/gwuen/aurvote-utils/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a set of utilities for managing AUR votes")
    (description "A set of utilities for managing AUR votes.")
    (home-page "https://github.com/gwuen/aurvote-utils")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 7915. beatoraja-modernchic --- cross-platform rhythm game based on Java and libGDX
;;; -------------------------------------------------------------------
(define-public beatoraja-modernchic
  (package
    (name "beatoraja-modernchic")
    (version "0.8.8")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/exch-bms2/beatoraja/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "cross-platform rhythm game based on Java and libGDX")
    (description "Cross-platform rhythm game based on Java and libGDX.")
    (home-page "https://github.com/exch-bms2/beatoraja")
    (license (list license:gpl3 license:non-copyleft))))

;;; -------------------------------------------------------------------
;;; 5865. bitbox-wallet-app-rpm --- bitBox Wallet App for managing digital assets
;;; -------------------------------------------------------------------
(define-public bitbox-wallet-app-rpm
  (package
    (name "bitbox-wallet-app-rpm")
    (version "4.50.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://bitbox.swiss/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "bitBox Wallet App for managing digital assets")
    (description "BitBox Wallet App for managing digital assets.")
    (home-page "https://bitbox.swiss/")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 7871. bitburner --- bitburner is a programming-based incremental game
;;; -------------------------------------------------------------------
(define-public bitburner
  (package
    (name "bitburner")
    (version "2.8.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/bitburner-official/bitburner-src/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (synopsis "bitburner is a programming-based incremental game")
    (description "Bitburner is a programming-based incremental game.")
    (home-page "https://github.com/bitburner-official/bitburner-src")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 8649. brother-dcp1610w --- lPR and CUPS driver for the Brother DCP-1610W and DCP-1612W printers
;;; -------------------------------------------------------------------
(define-public brother-dcp1610w
  (package
    (name "brother-dcp1610w")
    (version "3.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://support.brother.com/g/b/producttop.aspx?c=as_ot&lang=en&prod=dcp1610w_eu_as/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "lPR and CUPS driver for the Brother DCP-1610W and DCP-1612W printers")
    (description "LPR and CUPS driver for the Brother DCP-1610W and DCP-1612W printers.")
    (home-page "http://support.brother.com/g/b/producttop.aspx?c=as_ot&lang=en&prod=dcp1610w_eu_as")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 7958. btrustbiss --- browser independent signing service
;;; -------------------------------------------------------------------
(define-public btrustbiss
  (package
    (name "btrustbiss")
    (version "3.44")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.b-trust.org/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "browser independent signing service")
    (description "Browser independent signing service.")
    (home-page "https://www.b-trust.org")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 2163. cairo-clock --- an analog clock displaying the system-time
;;; -------------------------------------------------------------------
(define-public cairo-clock
  (package
    (name "cairo-clock")
    (version "0.3.4")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://launchpad.net/cairo-clock/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "an analog clock displaying the system-time")
    (description "An analog clock displaying the system-time.")
    (home-page "https://launchpad.net/cairo-clock")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 9530. clp --- writes input files to stdout with syntax highlighting
;;; -------------------------------------------------------------------
(define-public clp
  (package
    (name "clp")
    (version "0.4.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://git.sr.ht/~eskin/clp/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "writes input files to stdout with syntax highlighting")
    (description "Writes input files to stdout with syntax highlighting.")
    (home-page "https://git.sr.ht/~eskin/clp")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 8490. dbmodel-qt5 --- a qt tool for drawing entity-relationship diagrams (Qt5 version)
;;; -------------------------------------------------------------------
(define-public dbmodel-qt5
  (package
    (name "dbmodel-qt5")
    (version "0.3")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://oxygene.sk/lukas/dbmodel/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a qt tool for drawing entity-relationship diagrams (Qt5 version)")
    (description "A qt tool for drawing entity-relationship diagrams (Qt5 version).")
    (home-page "http://oxygene.sk/lukas/dbmodel/")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 7117. deeplx-git --- deepL Free API (No TOKEN required)
;;; -------------------------------------------------------------------
(define-public deeplx-git
  (package
    (name "deeplx-git")
    (version "1.0.1.r1.gf2fa902")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/OwO-Network/DeepLX")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments (list #:tests? #f #:import-path "github.com/OwO-Network/DeepLX"))
    (synopsis "deepL Free API (No TOKEN required)")
    (description "DeepL Free API (No TOKEN required).")
    (home-page "https://github.com/OwO-Network/DeepLX")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 7157. drinfo-git --- linux system information tool written in C
;;; -------------------------------------------------------------------
(define-public drinfo-git
  (package
    (name "drinfo-git")
    (version "V.1.2.0.r1.g9b947d2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Lennart1978/drinfo")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (synopsis "linux system information tool written in C")
    (description "Linux system information tool written in C.")
    (home-page "https://github.com/Lennart1978/drinfo")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 14699. dude-bin --- a single-binary helper that discovers, previews and removes pacman orp...
;;; -------------------------------------------------------------------
(define-public dude-bin
  (package
    (name "dude-bin")
    (version "0.1.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/seeyebe/dude/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a single-binary helper that discovers, previews and removes pacman orphans")
    (description "A single-binary helper that discovers, previews and removes pacman orphans.")
    (home-page "https://github.com/seeyebe/dude")
    (license (list license:asl2.0 license:expat))))

;;; -------------------------------------------------------------------
;;; 7175. eask-cli-git --- cLI for building, running, testing, and managing your Emacs Lisp depen...
;;; -------------------------------------------------------------------
(define-public eask-cli-git
  (package
    (name "eask-cli-git")
    (version "r0.11.2.f2ea3b25")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/emacs-eask/cli")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (synopsis "cLI for building, running, testing, and managing your Emacs Lisp dependencies")
    (description "CLI for building, running, testing, and managing your Emacs Lisp dependencies.")
    (home-page "https://github.com/emacs-eask/cli")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 2262. electron39-bin --- build cross platform desktop apps with web technologies — prebuilt
;;; -------------------------------------------------------------------
(define-public electron39-bin
  (package
    (name "electron39-bin")
    (version "39.8.9")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://electronjs.org/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "build cross platform desktop apps with web technologies — prebuilt")
    (description "Build cross platform desktop apps with web technologies — prebuilt.")
    (home-page "https://electronjs.org")
    (license (list license:non-copyleft license:expat))))

;;; -------------------------------------------------------------------
;;; 734. eqonomize --- efficient and easy accounting for the small household economy
;;; -------------------------------------------------------------------
(define-public eqonomize
  (package
    (name "eqonomize")
    (version "1.5.12")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/Eqonomize/Eqonomize/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "efficient and easy accounting for the small household economy")
    (description "Efficient and easy accounting for the small household economy.")
    (home-page "https://github.com/Eqonomize/Eqonomize")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 8023. flite1 --- a lighweight speech synthesis engine (version 1.x)
;;; -------------------------------------------------------------------
(define-public flite1
  (package
    (name "flite1")
    (version "1.4")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://www.speech.cs.cmu.edu/flite/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a lighweight speech synthesis engine (version 1.x)")
    (description "A lighweight speech synthesis engine (version 1.x).")
    (home-page "http://www.speech.cs.cmu.edu/flite/")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 8823. fluent-icon-theme-git --- a Fluent design icon theme
;;; -------------------------------------------------------------------
(define-public fluent-icon-theme-git
  (package
    (name "fluent-icon-theme-git")
    (version "2025.02.10.r1.g7d20e2d")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/vinceliuice/Fluent-icon-theme")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (synopsis "a Fluent design icon theme")
    (description "A Fluent design icon theme.")
    (home-page "https://github.com/vinceliuice/Fluent-icon-theme")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 8155. flutter-dart-google-bin --- flutter SDK artifacts (binary from Google) - Dart SDK
;;; -------------------------------------------------------------------
(define-public flutter-dart-google-bin
  (package
    (name "flutter-dart-google-bin")
    (version "3.35.7")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://flutter.dev/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "flutter SDK artifacts (binary from Google) - Dart SDK")
    (description "Flutter SDK artifacts (binary from Google) - Dart SDK.")
    (home-page "https://flutter.dev")
    (license (list license:bsd-3 license:non-copyleft))))
