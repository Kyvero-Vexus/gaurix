;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260423m
;;; Resolves 30 TODO packages from queue.
;;;
;;; New recipes (30):
;;;        1.  dbus-docs-selinux (pyproject-build-system, v1.16.2, AFL-2.1 OR GPL-2.0-or-later)
;;;        2.  fatattr (gnu-build-system, v1.0.1, GPL2)
;;;        3.  fnfx (gnu-build-system, v0.3, GPL2)
;;;        4.  fvwm-icons (gnu-build-system, v20070101, GPL)
;;;        5.  geekcode (gnu-build-system, v1.7.3, GPL)
;;;        6.  gfxtablet-git (gnu-build-system, v51.7bd5181, MIT)
;;;        7.  gtk-theme-windows10-dark (gnu-build-system, v3.2, GPL)
;;;        8.  helm-synth-common-git (gnu-build-system, v0.9.0.r21.gabdedd52, GPL3)
;;;        9.  jotta-cli (gnu-build-system, v0.17.159692, custom: Copyright Jotta AS)
;;;       10.  kmod-roccat (gnu-build-system, v1.0.0, GPL)
;;;       11.  libserialport-git (gnu-build-system, vr410.21b3dfe, GPL3)
;;;       12.  memstat (gnu-build-system, v1.1, GPL)
;;;       13.  mint-themes-git (pyproject-build-system, v2.1.6.r1.gb1dfbc54, GPL3)
;;;       14.  mobile-broadband-provider-info-git (gnu-build-system, v20190618.r16.g402655a, custom)
;;;       15.  num-utils (gnu-build-system, v0.5, GPL)
;;;       16.  osgearth-docs (pyproject-build-system, v3.8, LGPL-3.0-only)
;;;       17.  otf-fira-code-git (pyproject-build-system, v5.2.r54.g4e04092, OFL)
;;;       18.  otf-openbaskerville (font-build-system, v0.1.0, custom:OFL)
;;;       19.  python-pyexiftool (pyproject-build-system, v0.5.5, GPL3)
;;;       20.  selinux-refpolicy-src (pyproject-build-system, v20250923, GPL)
;;;       21.  smartsim-git (gnu-build-system, vr73.20aa4bd, GPL3)
;;;       22.  xcursor-neutral++ (gnu-build-system, v1.0.3, Artistic 2.0)
;;;       23.  xgboost-git (pyproject-build-system, vr6119.b05abfc49, Apache)
;;;       24.  can-utils (cmake-build-system, v2025.01, GPL-2.0-only)
;;;       25.  weex (gnu-build-system, v2.8.3, GPL)
;;;       26.  udpcast (gnu-build-system, v20250223, GPL)
;;;       27.  firefox-extension-keepassxc-browser (gnu-build-system, v1.10.1, GPL-3.0-only)
;;;       28.  act-bin (copy-build-system, v0.2.87, MIT)
;;;       29.  duckdns (gnu-build-system, v1.1.1, unknown)
;;;       30.  numix-icon-theme-pack-git (pyproject-build-system, vr6086, GPL3)
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Use `guix download` or `guix hash` to obtain real hashes.

(define-module (gaurix packages recipe-resolver-260423m)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system font)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:export (
            dbus-docs-selinux
            fatattr
            fnfx
            fvwm-icons
            geekcode
            gfxtablet-git
            gtk-theme-windows10-dark
            helm-synth-common-git
            jotta-cli
            kmod-roccat
            libserialport-git
            memstat
            mint-themes-git
            mobile-broadband-provider-info-git
            num-utils
            osgearth-docs
            otf-fira-code-git
            otf-openbaskerville
            python-pyexiftool
            selinux-refpolicy-src
            smartsim-git
            xcursor-neutral++
            xgboost-git
            can-utils
            weex
            udpcast
            firefox-extension-keepassxc-browser
            act-bin
            duckdns
            numix-icon-theme-pack-git
            ))

;;; -------------------------------------------------------------------
;;; 1. dbus-docs-selinux --- freedesktop.org message bus system with SELinux support - Documentation
;;; -------------------------------------------------------------------
(define-public dbus-docs-selinux
  (package
    (name "dbus-docs-selinux")
    (version "1.16.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.freedesktop.org/wiki/Software/dbus//archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "freedesktop.org message bus system with SELinux support - Documentation")
    (description "Freedesktop.org message bus system with SELinux support - Documentation.")
    (home-page "https://www.freedesktop.org/wiki/Software/dbus/")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 2. fatattr --- display or change attributes on a FAT filesystem
;;; -------------------------------------------------------------------
(define-public fatattr
  (package
    (name "fatattr")
    (version "1.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://kernel.org/pub/linux/utils/fs/fat/fatattr//archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "display or change attributes on a FAT filesystem")
    (description "Display or change attributes on a FAT filesystem.")
    (home-page "http://kernel.org/pub/linux/utils/fs/fat/fatattr/")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 3. fnfx --- enables owners of Toshiba laptops to change the LCD brightness, control t...
;;; -------------------------------------------------------------------
(define-public fnfx
  (package
    (name "fnfx")
    (version "0.3")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://fnfx.sourceforge.net//archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "enables owners of Toshiba laptops to change the LCD brightness, control t...")
    (description "Enables owners of Toshiba laptops to change the LCD brightness, control the internal fan and use the special keys on their keyboard (Fn-x combinations, hotkeys).")
    (home-page "http://fnfx.sourceforge.net/")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 4. fvwm-icons --- old icons of the FVWM-Project
;;; -------------------------------------------------------------------
(define-public fvwm-icons
  (package
    (name "fvwm-icons")
    (version "20070101")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://www.fvwm.org/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "old icons of the FVWM-Project")
    (description "Old icons of the FVWM-Project.")
    (home-page "http://www.fvwm.org")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 5. geekcode --- classic self-classification code generator
;;; -------------------------------------------------------------------
(define-public geekcode
  (package
    (name "geekcode")
    (version "1.7.3")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://www.geekcode.com//archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "classic self-classification code generator")
    (description "Classic self-classification code generator.")
    (home-page "http://www.geekcode.com/")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 6. gfxtablet-git --- android app to control a virtual Network Tablet on Linux
;;; -------------------------------------------------------------------
(define-public gfxtablet-git
  (package
    (name "gfxtablet-git")
    (version "51.7bd5181")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/rfc2822/GfxTablet")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "android app to control a virtual Network Tablet on Linux")
    (description "Android app to control a virtual Network Tablet on Linux.")
    (home-page "https://github.com/rfc2822/GfxTablet")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 7. gtk-theme-windows10-dark --- GTK 3.x Theme made to emulate a Windows 10 environment on Linux machines
;;; -------------------------------------------------------------------
(define-public gtk-theme-windows10-dark
  (package
    (name "gtk-theme-windows10-dark")
    (version "3.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/B00merang-Project/Windows-10-Dark")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "GTK 3.x Theme made to emulate a Windows 10 environment on Linux machines")
    (description "GTK 3.x Theme made to emulate a Windows 10 environment on Linux machines.")
    (home-page "https://github.com/B00merang-Project/Windows-10-Dark")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 8. helm-synth-common-git --- a virtual analog poly synth LV2 and VST2 plugin and standalone applicatio...
;;; -------------------------------------------------------------------
(define-public helm-synth-common-git
  (package
    (name "helm-synth-common-git")
    (version "0.9.0.r21.gabdedd52")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://tytel.org/helm/")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a virtual analog poly synth LV2 and VST2 plugin and standalone applicatio...")
    (description "A virtual analog poly synth LV2 and VST2 plugin and standalone application (git version) - common files.")
    (home-page "https://tytel.org/helm/")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 9. jotta-cli --- jottacloud backup and sync. Whether you are an individual, family or busi...
;;; -------------------------------------------------------------------
(define-public jotta-cli
  (package
    (name "jotta-cli")
    (version "0.17.159692")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.jottacloud.com//archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "jottacloud backup and sync. Whether you are an individual, family or busi...")
    (description "Jottacloud backup and sync. Whether you are an individual, family or business, Jottacloud lets you store, share and be productive wherever you are.")
    (home-page "https://www.jottacloud.com/")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 10. kmod-roccat --- kernel module for the old kone ROCCAT device
;;; -------------------------------------------------------------------
(define-public kmod-roccat
  (package
    (name "kmod-roccat")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://roccat.sourceforge.net/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "kernel module for the old kone ROCCAT device")
    (description "Kernel module for the old kone ROCCAT device.")
    (home-page "http://roccat.sourceforge.net")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 11. libserialport-git --- a minimal, cross-platform shared library for sigrok, intended to take car...
;;; -------------------------------------------------------------------
(define-public libserialport-git
  (package
    (name "libserialport-git")
    (version "r410.21b3dfe")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "http://sigrok.org/wiki/Libserialport")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a minimal, cross-platform shared library for sigrok, intended to take car...")
    (description "A minimal, cross-platform shared library for sigrok, intended to take care of the OS-specific details when writing software that uses serial ports (git version).")
    (home-page "http://sigrok.org/wiki/Libserialport")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 12. memstat --- identify what's using up virtual memory
;;; -------------------------------------------------------------------
(define-public memstat
  (package
    (name "memstat")
    (version "1.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://packages.debian.org/source/sid/memstat/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "identify what's using up virtual memory")
    (description "Identify what's using up virtual memory.")
    (home-page "https://packages.debian.org/source/sid/memstat")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 13. mint-themes-git --- linux Mint themes
;;; -------------------------------------------------------------------
(define-public mint-themes-git
  (package
    (name "mint-themes-git")
    (version "2.1.6.r1.gb1dfbc54")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/linuxmint/mint-themes")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "linux Mint themes")
    (description "Linux Mint themes.")
    (home-page "https://github.com/linuxmint/mint-themes")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 14. mobile-broadband-provider-info-git --- mobile broadband provider database
;;; -------------------------------------------------------------------
(define-public mobile-broadband-provider-info-git
  (package
    (name "mobile-broadband-provider-info-git")
    (version "20190618.r16.g402655a")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "http://gitlab.gnome.org/GNOME/mobile-broadband-provider-info/")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "mobile broadband provider database")
    (description "Mobile broadband provider database.")
    (home-page "http://gitlab.gnome.org/GNOME/mobile-broadband-provider-info/")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 15. num-utils --- set of programs for dealing with numbers from the command line
;;; -------------------------------------------------------------------
(define-public num-utils
  (package
    (name "num-utils")
    (version "0.5")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://suso.suso.org/programs/num-utils/index.phtml/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "set of programs for dealing with numbers from the command line")
    (description "Set of programs for dealing with numbers from the command line.")
    (home-page "http://suso.suso.org/programs/num-utils/index.phtml")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 16. osgearth-docs --- a terrain rendering toolkit for OpenSceneGraph (documentation)
;;; -------------------------------------------------------------------
(define-public osgearth-docs
  (package
    (name "osgearth-docs")
    (version "3.8")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.pelicanmapping.com/home-1/opensource/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "a terrain rendering toolkit for OpenSceneGraph (documentation)")
    (description "A terrain rendering toolkit for OpenSceneGraph (documentation).")
    (home-page "https://www.pelicanmapping.com/home-1/opensource")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 17. otf-fira-code-git --- monospaced font with programming ligatures
;;; -------------------------------------------------------------------
(define-public otf-fira-code-git
  (package
    (name "otf-fira-code-git")
    (version "5.2.r54.g4e04092")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/tonsky/FiraCode")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "monospaced font with programming ligatures")
    (description "Monospaced font with programming ligatures.")
    (home-page "https://github.com/tonsky/FiraCode")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 18. otf-openbaskerville --- an open source implementation of Fry's Baskerville, a Baskerville derivat...
;;; -------------------------------------------------------------------
(define-public otf-openbaskerville
  (package
    (name "otf-openbaskerville")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://klepas.org/openbaskerville//archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (synopsis "an open source implementation of Fry's Baskerville, a Baskerville derivat...")
    (description "An open source implementation of Fry's Baskerville, a Baskerville derivative by Isaac Moore.")
    (home-page "http://klepas.org/openbaskerville/")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 19. python-pyexiftool --- library to communicate with an instance of ExifTool command-line application
;;; -------------------------------------------------------------------
(define-public python-pyexiftool
  (package
    (name "python-pyexiftool")
    (version "0.5.5")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/sylikc/pyexiftool")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "library to communicate with an instance of ExifTool command-line application")
    (description "Library to communicate with an instance of ExifTool command-line application.")
    (home-page "https://github.com/sylikc/pyexiftool")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 20. selinux-refpolicy-src --- sELinux reference policy sources
;;; -------------------------------------------------------------------
(define-public selinux-refpolicy-src
  (package
    (name "selinux-refpolicy-src")
    (version "20250923")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/SELinuxProject/refpolicy")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "sELinux reference policy sources")
    (description "SELinux reference policy sources.")
    (home-page "https://github.com/SELinuxProject/refpolicy")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 21. smartsim-git --- smartSim is a digital logic circuit design and simulation package
;;; -------------------------------------------------------------------
(define-public smartsim-git
  (package
    (name "smartsim-git")
    (version "r73.20aa4bd")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ashleynewson/SmartSim")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "smartSim is a digital logic circuit design and simulation package")
    (description "SmartSim is a digital logic circuit design and simulation package.")
    (home-page "https://github.com/ashleynewson/SmartSim")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 22. xcursor-neutral++ --- icon set based on Neutral and jaguarx themes
;;; -------------------------------------------------------------------
(define-public xcursor-neutral++
  (package
    (name "xcursor-neutral++")
    (version "1.0.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ducakar/xcursor-neutralxx")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "icon set based on Neutral and jaguarx themes")
    (description "Icon set based on Neutral and jaguarx themes.")
    (home-page "https://github.com/ducakar/xcursor-neutralxx")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 23. xgboost-git --- an optimized distributed gradient boosting library designed to be highly ...
;;; -------------------------------------------------------------------
(define-public xgboost-git
  (package
    (name "xgboost-git")
    (version "r6119.b05abfc49")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/dmlc/xgboost")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "an optimized distributed gradient boosting library designed to be highly ...")
    (description "An optimized distributed gradient boosting library designed to be highly efficient, flexible and portable.")
    (home-page "https://github.com/dmlc/xgboost")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 24. can-utils --- linux-CAN / SocketCAN user space applications
;;; -------------------------------------------------------------------
(define-public can-utils
  (package
    (name "can-utils")
    (version "2025.01")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/linux-can/can-utils")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "linux-CAN / SocketCAN user space applications")
    (description "Linux-CAN / SocketCAN user space applications.")
    (home-page "https://github.com/linux-can/can-utils")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 25. weex --- non-interactive FTP client for updating web pages
;;; -------------------------------------------------------------------
(define-public weex
  (package
    (name "weex")
    (version "2.8.3")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://weex.sourceforge.net//archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "non-interactive FTP client for updating web pages")
    (description "Non-interactive FTP client for updating web pages.")
    (home-page "http://weex.sourceforge.net/")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 26. udpcast --- network multicasting tool
;;; -------------------------------------------------------------------
(define-public udpcast
  (package
    (name "udpcast")
    (version "20250223")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://udpcast.linux.lu//archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "network multicasting tool")
    (description "Network multicasting tool.")
    (home-page "https://udpcast.linux.lu/")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 27. firefox-extension-keepassxc-browser --- official browser plugin for the KeePassXC password manager
;;; -------------------------------------------------------------------
(define-public firefox-extension-keepassxc-browser
  (package
    (name "firefox-extension-keepassxc-browser")
    (version "1.10.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://addons.mozilla.org/en-US/firefox/addon/keepassxc-browser//archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "official browser plugin for the KeePassXC password manager")
    (description "Official browser plugin for the KeePassXC password manager.")
    (home-page "https://addons.mozilla.org/en-US/firefox/addon/keepassxc-browser/")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 28. act-bin --- run your GitHub Actions locally
;;; -------------------------------------------------------------------
(define-public act-bin
  (package
    (name "act-bin")
    (version "0.2.87")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nektos/act/releases/download/v" version "/act-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("act-bin" "bin/act-bin"))))
    (synopsis "run your GitHub Actions locally")
    (description "Run your GitHub Actions locally.")
    (home-page "https://github.com/nektos/act")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 29. duckdns --- update your DuckDNS.org entries from your computer without setting up any...
;;; -------------------------------------------------------------------
(define-public duckdns
  (package
    (name "duckdns")
    (version "1.1.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.duckdns.org/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "update your DuckDNS.org entries from your computer without setting up any...")
    (description "Update your DuckDNS.org entries from your computer without setting up any cronjob. You just need to create config files for your domains.")
    (home-page "https://www.duckdns.org")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 30. numix-icon-theme-pack-git --- numix project Icon Themes - Updated with Numix Core
;;; -------------------------------------------------------------------
(define-public numix-icon-theme-pack-git
  (package
    (name "numix-icon-theme-pack-git")
    (version "r6086")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "http://numixproject.org/")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "numix project Icon Themes - Updated with Numix Core")
    (description "Numix project Icon Themes - Updated with Numix Core.")
    (home-page "http://numixproject.org/")
    (license license:gpl3)))
