;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency tree resolver pass --- deptree-resolver-260418s
;;; Resolves 100 packages from dependency tree queue (TODO pool).
;;;
;;; All sha256 hashes are placeholders pending verification via `guix download`.

(define-module (gaurix packages deptree-resolver-260418s)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:export (kcoreaddons-git
            ki18n-git
            kconfig-git
            kwidgetsaddons-git
            kwindowsystem-git
            kdbusaddons-git
            r-vctrs
            karchive-git
            kguiaddons-git
            kcodecs-git
            python2-six
            kglobalaccel-git
            kitemviews-git
            liblxqt-git
            kitemmodels-git
            gnustep-back
            mingw-w64-bzip2
            python2-pillow
            darling-system-git
            libobjfw
            sonnet-git
            php56-xml
            syntax-highlighting-git
            php74-xml
            php80-xml
            php81-xml
            php82-xml
            mingw-w64-expat
            mingw-w64-icu
            lua-im
            lua51-im
            lua52-im
            lua53-im
            fluid-git
            kirigami2-git
            ocaml-atd
            kidletime-git
            php56-pdo
            php74-pdo
            php80-pdo
            php81-pdo
            php82-pdo
            python2-pbr
            umodunpack
            zinnia
            celestia-addon-tatooine-endor-deathstar
            libstroke
            m68k-elf-binutils
            mingw-w64-gmp
            mingw-w64-libiconv
            multiload-ng-common
            notify-sharp
            python-mediainfodll
            ruby-fusuma
            advancecomp
            flif
            libusrsctp
            mingw-w64-lcms2
            munt
            nvidia-510xx-utils
            phonon-qt4
            fxload
            libcsys
            libxxf86dga
            mafft
            perl-module-build-withxspp
            php-box
            python2-gobject2
            ananicy-cpp-nosystemd
            mingw-w64-vulkan-icd-loader
            ntk-git
            python-catkin-pkg
            python-multipledispatch
            pyconcurrent
            python2-numpy
            yamagi-quake2
            elpa
            libkml-git
            libsvg-cairo
            ticcutils
            winff-common
            sfcgal
            youplay-base
            python-cloudscraper
            python-livekit
            vala-panel-appmenu-common-git
            epsxe
            purpose-git
            libmagick6
            xorg-server-common-git
            fmodex
            libbulletml
            lwjgl2
            vapoursynth-plugin-nnedi3-weights-bin
            capsimage
            cddb-get
            g15daemon
            libax25
            libccd
            libdvbcsa
))

(define-public kcoreaddons-git
  (package
    (name "kcoreaddons-git")
    (version "6.0.0_r2010.g9460614c")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/kcoreaddons-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "addons to QtCore")
    (description "Addons to QtCore.")
    (home-page "https://community.kde.org/Frameworks")
    (license license:lgpl3+)))

(define-public ki18n-git
  (package
    (name "ki18n-git")
    (version "6.0.0_r723.ga0839c4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ki18n-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "advanced internationalization framework")
    (description "Advanced internationalization framework.")
    (home-page "https://community.kde.org/Frameworks")
    (license license:lgpl3+)))

(define-public kconfig-git
  (package
    (name "kconfig-git")
    (version "6.0.0_r1291.gdba356d6")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/kconfig-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "configuration system")
    (description "Configuration system.")
    (home-page "https://community.kde.org/Frameworks")
    (license license:lgpl3+)))

(define-public kwidgetsaddons-git
  (package
    (name "kwidgetsaddons-git")
    (version "6.0.0_r1303.g557e18ec")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/kwidgetsaddons-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "addons to QtWidgets")
    (description "Addons to QtWidgets.")
    (home-page "https://community.kde.org/Frameworks")
    (license license:lgpl3+)))

(define-public kwindowsystem-git
  (package
    (name "kwindowsystem-git")
    (version "6.0.0_r1009.g827ff06")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/kwindowsystem-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "access to the windowing system")
    (description "Access to the windowing system.")
    (home-page "https://community.kde.org/Frameworks")
    (license license:lgpl3+)))

(define-public kdbusaddons-git
  (package
    (name "kdbusaddons-git")
    (version "6.0.0_r537.g66b69f5")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/kdbusaddons-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "addons to QtDBus")
    (description "Addons to QtDBus.")
    (home-page "https://community.kde.org/Frameworks")
    (license license:lgpl3+)))

(define-public r-vctrs
  (package
    (name "r-vctrs")
    (version "0.6.5")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/r-vctrs.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "vector Helpers")
    (description "Vector Helpers.")
    (home-page "https://cran.r-project.org/package=vctrs")
    (license license:expat)))

(define-public karchive-git
  (package
    (name "karchive-git")
    (version "6.0.0_r743.g7706b34")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/karchive-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "qt 5 addon providing access to numerous types of archives")
    (description "Qt 5 addon providing access to numerous types of archives.")
    (home-page "https://community.kde.org/Frameworks")
    (license license:lgpl3+)))

(define-public kguiaddons-git
  (package
    (name "kguiaddons-git")
    (version "6.0.0_r592.gb92d00d")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/kguiaddons-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "addons to QtGui")
    (description "Addons to QtGui.")
    (home-page "https://community.kde.org/Frameworks")
    (license license:lgpl3+)))

(define-public kcodecs-git
  (package
    (name "kcodecs-git")
    (version "5.240.0_r491.g49a2729")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/kcodecs-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "plugins allowing Qt applications to access further types of images")
    (description "Plugins allowing Qt applications to access further types of images.")
    (home-page "https://community.kde.org/Frameworks")
    (license license:lgpl3+)))

(define-public python2-six
  (package
    (name "python2-six")
    (version "1.17.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python2-six.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "python 2 and 3 compatibility utilities")
    (description "Python 2 and 3 compatibility utilities.")
    (home-page "https://pypi.org/project/six/")
    (license license:expat)))

(define-public kglobalaccel-git
  (package
    (name "kglobalaccel-git")
    (version "6.0.0_r733.g40463a9")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/kglobalaccel-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "add support for global workspace shortcuts")
    (description "Add support for global workspace shortcuts.")
    (home-page "https://community.kde.org/Frameworks")
    (license license:lgpl3+)))

(define-public kitemviews-git
  (package
    (name "kitemviews-git")
    (version "6.0.0_r498.gb1b4a01")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/kitemviews-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "widget addons for Qt Model/View")
    (description "Widget addons for Qt Model/View.")
    (home-page "https://community.kde.org/Frameworks")
    (license license:lgpl3+)))

(define-public liblxqt-git
  (package
    (name "liblxqt-git")
    (version "2.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/liblxqt-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "common base library for LXQt components")
    (description "Common base library for LXQt components.")
    (home-page "https://lxqt-project.org")
    (license license:lgpl2.1+)))

(define-public kitemmodels-git
  (package
    (name "kitemmodels-git")
    (version "6.0.0_r703.g9020498")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/kitemmodels-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "models for Qt Model/View system")
    (description "Models for Qt Model/View system.")
    (home-page "https://community.kde.org/Frameworks")
    (license license:lgpl3+)))

(define-public gnustep-back
  (package
    (name "gnustep-back")
    (version "0.32.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/gnustep/libs-back")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the GNUstep GUI Backend")
    (description "The GNUstep GUI Backend.")
    (home-page "https://github.com/gnustep/libs-back")
    (license license:lgpl3+)))

(define-public mingw-w64-bzip2
  (package
    (name "mingw-w64-bzip2")
    (version "1.0.8")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mingw-w64-bzip2.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a high-quality data compression program (mingw-w64)")
    (description "A high-quality data compression program (mingw-w64).")
    (home-page "http://www.sourceware.org/bzip2/")
    (license license:non-copyleft)))

(define-public python2-pillow
  (package
    (name "python2-pillow")
    (version "6.2.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python2-pillow.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "python Imaging Library (PIL) fork")
    (description "Python Imaging Library (PIL) fork.")
    (home-page "https://python-pillow.github.io/")
    (license license:bsd-3)))

(define-public darling-system-git
  (package
    (name "darling-system-git")
    (version "r4302.c431326ef")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/darling-system-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "system components of Darling")
    (description "System components of Darling.")
    (home-page "https://www.darlinghq.org")
    (license license:gpl3+)))

(define-public libobjfw
  (package
    (name "libobjfw")
    (version "1.4.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/libobjfw.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "objFW library")
    (description "ObjFW library.")
    (home-page "https://objfw.nil.im/")
    (license license:lgpl3+)))

(define-public sonnet-git
  (package
    (name "sonnet-git")
    (version "6.0.0_r899.g184e686")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/sonnet-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "spelling framework for Qt6")
    (description "Spelling framework for Qt6.")
    (home-page "https://community.kde.org/Frameworks")
    (license license:lgpl3+)))

(define-public php56-xml
  (package
    (name "php56-xml")
    (version "5.6.40")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/php56-xml.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "xml modules for php56")
    (description "Xml modules for php56.")
    (home-page "http://www.php.net")
    (license license:non-copyleft)))

(define-public syntax-highlighting-git
  (package
    (name "syntax-highlighting-git")
    (version "6.0.0_r2540.gdb7282d9")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/syntax-highlighting-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "syntax highlighting engine for structured text and code")
    (description "Syntax highlighting engine for structured text and code.")
    (home-page "https://community.kde.org/Frameworks")
    (license license:expat)))

(define-public php74-xml
  (package
    (name "php74-xml")
    (version "7.4.33")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/php74-xml.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "xml modules for php74")
    (description "Xml modules for php74.")
    (home-page "http://www.php.net")
    (license license:non-copyleft)))

(define-public php80-xml
  (package
    (name "php80-xml")
    (version "8.0.30")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/php80-xml.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "xml modules for php80")
    (description "Xml modules for php80.")
    (home-page "http://www.php.net")
    (license license:non-copyleft)))

(define-public php81-xml
  (package
    (name "php81-xml")
    (version "8.1.34")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/php81-xml.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "xml modules for php81")
    (description "Xml modules for php81.")
    (home-page "http://www.php.net")
    (license license:non-copyleft)))

(define-public php82-xml
  (package
    (name "php82-xml")
    (version "8.2.30")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/php82-xml.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "xml modules for php82")
    (description "Xml modules for php82.")
    (home-page "http://www.php.net")
    (license license:non-copyleft)))

(define-public mingw-w64-expat
  (package
    (name "mingw-w64-expat")
    (version "2.7.4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mingw-w64-expat.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "an XML parser library (mingw-w64)")
    (description "An XML parser library (mingw-w64).")
    (home-page "http://expat.sourceforge.net")
    (license license:expat)))

(define-public mingw-w64-icu
  (package
    (name "mingw-w64-icu")
    (version "78.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mingw-w64-icu.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "international Components for Unicode library (mingw-w64)")
    (description "International Components for Unicode library (mingw-w64).")
    (home-page "https://icu.unicode.org/")
    (license license:bsd-3)))

(define-public lua-im
  (package
    (name "lua-im")
    (version "3.15")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lua-im.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "lua (5.4) bindings for IM toolkit")
    (description "Lua (5.4) bindings for IM toolkit.")
    (home-page "https://www.tecgraf.puc-rio.br/im/")
    (license license:expat)))

(define-public lua51-im
  (package
    (name "lua51-im")
    (version "3.15")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lua51-im.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "lua (5.1) bindings for IM toolkit")
    (description "Lua (5.1) bindings for IM toolkit.")
    (home-page "https://www.tecgraf.puc-rio.br/im/")
    (license license:expat)))

(define-public lua52-im
  (package
    (name "lua52-im")
    (version "3.15")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lua52-im.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "lua (5.2) bindings for IM toolkit")
    (description "Lua (5.2) bindings for IM toolkit.")
    (home-page "https://www.tecgraf.puc-rio.br/im/")
    (license license:expat)))

(define-public lua53-im
  (package
    (name "lua53-im")
    (version "3.15")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lua53-im.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "lua (5.3) bindings for IM toolkit")
    (description "Lua (5.3) bindings for IM toolkit.")
    (home-page "https://www.tecgraf.puc-rio.br/im/")
    (license license:expat)))

(define-public fluid-git
  (package
    (name "fluid-git")
    (version "v1.2.0.r50.g27417d4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/fluid-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "components for Qt Quick applications with Material Design")
    (description "Components for Qt Quick applications with Material Design.")
    (home-page "https://liri.io")
    (license license:mpl2.0)))

(define-public kirigami2-git
  (package
    (name "kirigami2-git")
    (version "5.116.0_r3814.gbff8d7e3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/kirigami2-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a QtQuick based components set")
    (description "A QtQuick based components set.")
    (home-page "https://community.kde.org/Frameworks")
    (license license:lgpl3+)))

(define-public ocaml-atd
  (package
    (name "ocaml-atd")
    (version "2.16.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ahrefs/atd")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "adaptable type definitions for OCaml")
    (description "Adaptable type definitions for OCaml.")
    (home-page "https://github.com/ahrefs/atd")
    (license license:bsd-3)))

(define-public kidletime-git
  (package
    (name "kidletime-git")
    (version "6.0.0_r424.gec86623")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/kidletime-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "monitoring user activity")
    (description "Monitoring user activity.")
    (home-page "https://community.kde.org/Frameworks")
    (license license:lgpl3+)))

(define-public php56-pdo
  (package
    (name "php56-pdo")
    (version "5.6.40")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/php56-pdo.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "pdo module for php56")
    (description "Pdo module for php56.")
    (home-page "http://www.php.net")
    (license license:non-copyleft)))

(define-public php74-pdo
  (package
    (name "php74-pdo")
    (version "7.4.33")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/php74-pdo.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "pdo module for php74")
    (description "Pdo module for php74.")
    (home-page "http://www.php.net")
    (license license:non-copyleft)))

(define-public php80-pdo
  (package
    (name "php80-pdo")
    (version "8.0.30")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/php80-pdo.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "pdo module for php80")
    (description "Pdo module for php80.")
    (home-page "http://www.php.net")
    (license license:non-copyleft)))

(define-public php81-pdo
  (package
    (name "php81-pdo")
    (version "8.1.34")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/php81-pdo.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "pdo module for php81")
    (description "Pdo module for php81.")
    (home-page "http://www.php.net")
    (license license:non-copyleft)))

(define-public php82-pdo
  (package
    (name "php82-pdo")
    (version "8.2.30")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/php82-pdo.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "pdo module for php82")
    (description "Pdo module for php82.")
    (home-page "http://www.php.net")
    (license license:non-copyleft)))

(define-public python2-pbr
  (package
    (name "python2-pbr")
    (version "6.1.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python2-pbr.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "python Build Reasonableness (for Python 2)")
    (description "Python Build Reasonableness (for Python 2).")
    (home-page "https://pypi.python.org/pypi/pbr")
    (license license:asl2.0)))

(define-public umodunpack
  (package
    (name "umodunpack")
    (version "1.11")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/umodunpack.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a small script for extracting files from Unreal Tournament Umod intallers")
    (description "A small script for extracting files from Unreal Tournament Umod intallers.")
    (home-page "http://www.deepsky.com/~misaka/")
    (license license:non-copyleft)))

(define-public zinnia
  (package
    (name "zinnia")
    (version "0.07")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/silverhikari/zinnia")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "simple, customizable and portable online hand recognition system based on S..")
    (description "Simple, customizable and portable online hand recognition system based on Support Vector Machines.")
    (home-page "https://github.com/silverhikari/zinnia")
    (license license:bsd-3)))

(define-public celestia-addon-tatooine-endor-deathstar
  (package
    (name "celestia-addon-tatooine_endor_deathstar")
    (version "1.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/celestia-addon-tatooine_endor_deathstar.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "celestia addon: Fictional: Star Wars: Tatooine, Endor and Death Star")
    (description "Celestia addon: Fictional: Star Wars: Tatooine, Endor and Death Star.")
    (home-page "https://www.celestiamotherlode.net/addon/addon_1625.html")
    (license license:non-copyleft)))

(define-public libstroke
  (package
    (name "libstroke")
    (version "0.5.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/libstroke.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a stroke (mouse gesture) translation library")
    (description "A stroke (mouse gesture) translation library.")
    (home-page "https://sources.archlinux.org/other/packages/libstroke/")
    (license license:gpl2+)))

(define-public m68k-elf-binutils
  (package
    (name "m68k-elf-binutils")
    (version "2.45")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/m68k-elf-binutils.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a set of programs to assemble and manipulate binary and object files (m68k-..")
    (description "A set of programs to assemble and manipulate binary and object files (m68k-elf).")
    (home-page "http://www.gnu.org/software/binutils/")
    (license license:gpl3+)))

(define-public mingw-w64-gmp
  (package
    (name "mingw-w64-gmp")
    (version "6.3.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mingw-w64-gmp.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a free library for arbitrary precision arithmetic (mingw-w64)")
    (description "A free library for arbitrary precision arithmetic (mingw-w64).")
    (home-page "http://gmplib.org")
    (license license:lgpl3+)))

(define-public mingw-w64-libiconv
  (package
    (name "mingw-w64-libiconv")
    (version "1.18")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mingw-w64-libiconv.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "provides GNU libiconv.so and libcharset.so (mingw-w64)")
    (description "Provides GNU libiconv.so and libcharset.so (mingw-w64).")
    (home-page "http://www.gnu.org/software/libiconv/")
    (license license:lgpl3+)))

(define-public multiload-ng-common
  (package
    (name "multiload-ng-common")
    (version "1.5.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/multiload-ng-common.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "modern graphical system monitor, common files")
    (description "Modern graphical system monitor, common files.")
    (home-page "https://udda.github.io/multiload-ng/")
    (license license:gpl2+)))

(define-public notify-sharp
  (package
    (name "notify-sharp")
    (version "0.4.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/notify-sharp.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "c Sharp D-Bus client library for desktop notifications")
    (description "C Sharp D-Bus client library for desktop notifications.")
    (home-page "https://www.meebey.net/projects/notify-sharp/")
    (license license:expat)))

(define-public python-mediainfodll
  (package
    (name "python-mediainfodll")
    (version "1:25.10")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/MediaArea/MediaInfoLib")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "python shared library for reading metadata from media files")
    (description "Python shared library for reading metadata from media files.")
    (home-page "https://github.com/MediaArea/MediaInfoLib")
    (license license:bsd-3)))

(define-public ruby-fusuma
  (package
    (name "ruby-fusuma")
    (version "3.10.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/iberianpig/fusuma")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "fusuma is multitouch gesture recognizer")
    (description "Fusuma is multitouch gesture recognizer.")
    (home-page "https://github.com/iberianpig/fusuma")
    (license license:expat)))

(define-public advancecomp
  (package
    (name "advancecomp")
    (version "2.6")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/amadvance/advancecomp")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "recompression utilities for .zip .png .mng and .gz files using the 7-zip al..")
    (description "Recompression utilities for .zip .png .mng and .gz files using the 7-zip algorithm.")
    (home-page "https://github.com/amadvance/advancecomp")
    (license license:gpl3+)))

(define-public flif
  (package
    (name "flif")
    (version "0.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/FLIF-hub/FLIF")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "free Lossless Image Format")
    (description "Free Lossless Image Format.")
    (home-page "https://github.com/FLIF-hub/FLIF/")
    (license license:asl2.0)))

(define-public libusrsctp
  (package
    (name "libusrsctp")
    (version "0.9.5.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/sctplab/usrsctp")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a portable SCTP userland stack")
    (description "A portable SCTP userland stack.")
    (home-page "https://github.com/sctplab/usrsctp")
    (license license:non-copyleft)))

(define-public mingw-w64-lcms2
  (package
    (name "mingw-w64-lcms2")
    (version "2.18")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mingw-w64-lcms2.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "small-footprint color management engine, version 2 (mingw-w64)")
    (description "Small-footprint color management engine, version 2 (mingw-w64).")
    (home-page "https://littlecms.com/color-engine/")
    (license license:expat)))

(define-public munt
  (package
    (name "munt")
    (version "2.7.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/munt.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "software synthesizer emulating pre-GM MIDI devices such as the Roland MT-32..")
    (description "Software synthesizer emulating pre-GM MIDI devices such as the Roland MT-32, CM-32L, CM-64 and LAPC-I (library).")
    (home-page "http://munt.sourceforge.net")
    (license license:gpl2+)))

(define-public nvidia-510xx-utils
  (package
    (name "nvidia-510xx-utils")
    (version "510.108.03")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/nvidia-510xx-utils.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "nVIDIA drivers utilities, 510 branch")
    (description "NVIDIA drivers utilities, 510 branch.")
    (home-page "http://www.nvidia.com/")
    (license license:non-copyleft)))

(define-public phonon-qt4
  (package
    (name "phonon-qt4")
    (version "4.10.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/phonon-qt4.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the multimedia framework for KDE4")
    (description "The multimedia framework for KDE4.")
    (home-page "https://community.kde.org/Phonon")
    (license license:lgpl3+)))

(define-public fxload
  (package
    (name "fxload")
    (version "1.0.29")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/fxload.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "fxload firmware loader. Used with udev or devfs/hotplug")
    (description "Fxload firmware loader. Used with udev or devfs/hotplug.")
    (home-page "http://libusb.info/")
    (license license:lgpl3+)))

(define-public libcsys
  (package
    (name "libcsys")
    (version "5.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.com/cubocore/libcsys")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "library for managing drive and getting system resource information in real ..")
    (description "Library for managing drive and getting system resource information in real time.")
    (home-page "https://gitlab.com/cubocore/libcsys")
    (license license:gpl3+)))

(define-public libxxf86dga
  (package
    (name "libxxf86dga")
    (version "1.1.7")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/libxxf86dga.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "x11 Direct Graphics Access extension library")
    (description "X11 Direct Graphics Access extension library.")
    (home-page "http://xorg.freedesktop.org/")
    (license license:non-copyleft)))

(define-public mafft
  (package
    (name "mafft")
    (version "7.526")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mafft.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "multiple alignment program for amino acid or nucleotide sequences. https://..")
    (description "Multiple alignment program for amino acid or nucleotide sequences. https://doi.org/10.1093/molbev/mst010.")
    (home-page "https://mafft.cbrc.jp/alignment/software")
    (license license:bsd-3)))

(define-public perl-module-build-withxspp
  (package
    (name "perl-module-build-withxspp")
    (version "0.14")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/perl-module-build-withxspp.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "module::Build::WithXSpp - XS++ enhanced flavour of Module::Build")
    (description "Module::Build::WithXSpp - XS++ enhanced flavour of Module::Build.")
    (home-page "https://metacpan.org/release/Module-Build-WithXSpp/")
    (license license:gpl3+)))

(define-public php-box
  (package
    (name "php-box")
    (version "4.6.8")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/box-project/box")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "an application for building and managing Phars")
    (description "An application for building and managing Phars.")
    (home-page "https://github.com/box-project/box")
    (license license:expat)))

(define-public python2-gobject2
  (package
    (name "python2-gobject2")
    (version "2.28.7")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python2-gobject2.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "legacy Python 2 bindings for GObject")
    (description "Legacy Python 2 bindings for GObject.")
    (home-page "https://wiki.gnome.org/Projects/PyGObject")
    (license license:lgpl3+)))

(define-public ananicy-cpp-nosystemd
  (package
    (name "ananicy-cpp-nosystemd")
    (version "1.1.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.com/ananicy-cpp/ananicy-cpp")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "ananicy rewritten in C++ for much lower CPU and memory usage")
    (description "Ananicy rewritten in C++ for much lower CPU and memory usage.")
    (home-page "https://gitlab.com/ananicy-cpp/ananicy-cpp/")
    (license license:gpl3+)))

(define-public mingw-w64-vulkan-icd-loader
  (package
    (name "mingw-w64-vulkan-icd-loader")
    (version "1.4.341")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mingw-w64-vulkan-icd-loader.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "vulkan Installable Client Driver (ICD) Loader (mingw-w64)")
    (description "Vulkan Installable Client Driver (ICD) Loader (mingw-w64).")
    (home-page "https://www.khronos.org/vulkan/")
    (license license:asl2.0)))

(define-public ntk-git
  (package
    (name "ntk-git")
    (version "0.r166.720d8d3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ntk-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "fork of FLTK 1.3.0 with additional functionality")
    (description "Fork of FLTK 1.3.0 with additional functionality.")
    (home-page "http://non.tuxfamily.org/")
    (license license:non-copyleft)))

(define-public python-catkin-pkg
  (package
    (name "python-catkin_pkg")
    (version "1.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ros-infrastructure/catkin_pkg")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "standalone Python library for the catkin package system")
    (description "Standalone Python library for the catkin package system.")
    (home-page "https://github.com/ros-infrastructure/catkin_pkg")
    (license license:bsd-3)))

(define-public python-multipledispatch
  (package
    (name "python-multipledispatch")
    (version "1.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/mrocklin/multipledispatch")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "multiple dispatch implementation in Python")
    (description "Multiple dispatch implementation in Python.")
    (home-page "https://github.com/mrocklin/multipledispatch")
    (license license:bsd-3)))

(define-public pyconcurrent
  (package
    (name "pyconcurrent")
    (version "2.14.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/gene-git/pyconcurrent")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "python module to simplify asyncio/multiprocessing")
    (description "Python module to simplify asyncio/multiprocessing.")
    (home-page "https://github.com/gene-git/pyconcurrent")
    (license license:gpl2+)))

(define-public python2-numpy
  (package
    (name "python2-numpy")
    (version "1.16.6")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python2-numpy.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "scientific tools for Python 2")
    (description "Scientific tools for Python 2.")
    (home-page "https://www.numpy.org/")
    (license license:non-copyleft)))

(define-public yamagi-quake2
  (package
    (name "yamagi-quake2")
    (version "8.60")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/yamagi-quake2.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "enhanced Quake II engine optimized for modern systems")
    (description "Enhanced Quake II engine optimized for modern systems.")
    (home-page "https://www.yamagi.org/quake2/")
    (license license:gpl2+)))

(define-public elpa
  (package
    (name "elpa")
    (version "2025.06.002")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/elpa.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "eigenvalue SoLvers for Petaflop-Applications")
    (description "Eigenvalue SoLvers for Petaflop-Applications.")
    (home-page "https://elpa.mpcdf.mpg.de")
    (license license:lgpl3+)))

(define-public libkml-git
  (package
    (name "libkml-git")
    (version "1.3.0.r130.g878abd1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/libkml/libkml")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a KML library written in C++ with bindings to other languages")
    (description "A KML library written in C++ with bindings to other languages.")
    (home-page "https://github.com/libkml/libkml")
    (license license:bsd-3)))

(define-public libsvg-cairo
  (package
    (name "libsvg-cairo")
    (version "0.1.6")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/libsvg-cairo.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a library for rendering SVG documents")
    (description "A library for rendering SVG documents.")
    (home-page "https://cairographics.org/")
    (license license:lgpl2.1+)))

(define-public ticcutils
  (package
    (name "ticcutils")
    (version "0.36")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/LanguageMachines/ticcutils")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "common library with functions for tools developed at Tilburg Centre for Cog..")
    (description "Common library with functions for tools developed at Tilburg Centre for Cognition and Communication (Tilburg University) and Centre for Language and Speech Technology (Radboud University Nijmegen).")
    (home-page "https://github.com/LanguageMachines/ticcutils")
    (license license:gpl3+)))

(define-public winff-common
  (package
    (name "winff-common")
    (version "1.6.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/WinFF/winff")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "gUI for ffmpeg written in Lazarus")
    (description "GUI for ffmpeg written in Lazarus.")
    (home-page "https://github.com/WinFF/winff/")
    (license license:gpl3+)))

(define-public sfcgal
  (package
    (name "sfcgal")
    (version "2.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.com/Oslandia/SFCGAL")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "wrapper around the CGAL library that intents to implement 2D and 3D operati..")
    (description "Wrapper around the CGAL library that intents to implement 2D and 3D operations on OGC standards models.")
    (home-page "https://gitlab.com/Oslandia/SFCGAL")
    (license license:gpl3+)))

(define-public youplay-base
  (package
    (name "youplay-base")
    (version "0.46")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://codeberg.org/ralfhersel/youplay")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "search, download and play music from YouTube")
    (description "Search, download and play music from YouTube.")
    (home-page "https://codeberg.org/ralfhersel/youplay")
    (license license:gpl3+)))

(define-public python-cloudscraper
  (package
    (name "python-cloudscraper")
    (version "1.2.71")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/VeNoMouS/cloudscraper")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "python module to bypass Cloudflare's anti-bot page")
    (description "Python module to bypass Cloudflare's anti-bot page.")
    (home-page "https://github.com/VeNoMouS/cloudscraper")
    (license license:expat)))

(define-public python-livekit
  (package
    (name "python-livekit")
    (version "1.1.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/livekit/python-sdks/tree/main/livekit-rtc")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "python Real-time SDK for LiveKit")
    (description "Python Real-time SDK for LiveKit.")
    (home-page "https://github.com/livekit/python-sdks/tree/main/livekit-rtc")
    (license license:asl2.0)))

(define-public vala-panel-appmenu-common-git
  (package
    (name "vala-panel-appmenu-common-git")
    (version "24.05.r2.g7631683")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.com/vala-panel-project/vala-panel-appmenu")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "translations and common files for Global Menu")
    (description "Translations and common files for Global Menu.")
    (home-page "https://gitlab.com/vala-panel-project/vala-panel-appmenu")
    (license license:lgpl3+)))

(define-public epsxe
  (package
    (name "epsxe")
    (version "2.0.5")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/epsxe.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "enhanced PSX emulator")
    (description "Enhanced PSX emulator.")
    (home-page "https://epsxe.com")
    (license license:non-copyleft)))

(define-public purpose-git
  (package
    (name "purpose-git")
    (version "r1238.ef7dace8")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/purpose-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "framework for providing abstractions to get the developer's purposes fulfilled")
    (description "Framework for providing abstractions to get the developer's purposes fulfilled.")
    (home-page "https://projects.kde.org/projects/playground/libs/purpose")
    (license license:lgpl3+)))

(define-public libmagick6
  (package
    (name "libmagick6")
    (version "6.9.13.35")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/libmagick6.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "an image viewing/manipulation program (legacy 6.9.13-* series; library)")
    (description "An image viewing/manipulation program (legacy 6.9.13-* series; library).")
    (home-page "https://legacy.imagemagick.org/")
    (license license:non-copyleft)))

(define-public xorg-server-common-git
  (package
    (name "xorg-server-common-git")
    (version "21.1.99.1.r1061.ge61bd1e5f")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/xorg-server-common-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "xorg server common files (git version)")
    (description "Xorg server common files (git version).")
    (home-page "https://xorg.freedesktop.org")
    (license license:non-copyleft)))

(define-public fmodex
  (package
    (name "fmodex")
    (version "4.44.64")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/fmodex.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "an advanced audio engine")
    (description "An advanced audio engine.")
    (home-page "http://www.fmod.org/")
    (license license:non-copyleft)))

(define-public libbulletml
  (package
    (name "libbulletml")
    (version "0.0.6")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/libbulletml.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "c++ library to handle BulletML, a markup language to describe bullets in sh..")
    (description "C++ library to handle BulletML, a markup language to describe bullets in shooting games.")
    (home-page "http://shinh.skr.jp/libbulletml/index_en.html")
    (license license:non-copyleft)))

(define-public lwjgl2
  (package
    (name "lwjgl2")
    (version "2.9.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lwjgl2.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "lightweight Java Game Library - for use in game projects in Java. Legacy ve..")
    (description "Lightweight Java Game Library - for use in game projects in Java. Legacy version.")
    (home-page "http://legacy.lwjgl.org/")
    (license license:bsd-3)))

(define-public vapoursynth-plugin-nnedi3-weights-bin
  (package
    (name "vapoursynth-plugin-nnedi3_weights_bin")
    (version "r1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/jpsdr/NNEDI3")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "plugin for Vapoursynth: nnedi3_weights_bin")
    (description "Plugin for Vapoursynth: nnedi3_weights_bin.")
    (home-page "https://github.com/jpsdr/NNEDI3")
    (license license:gpl3+)))

(define-public capsimage
  (package
    (name "capsimage")
    (version "5.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/capsimage.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "library to access IPF and CTR files")
    (description "Library to access IPF and CTR files.")
    (home-page "https://www.kryoflux.com/")
    (license license:non-copyleft)))

(define-public cddb-get
  (package
    (name "cddb_get")
    (version "2.28")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/cddb_get.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "fetches CDDB info for an audio cd")
    (description "Fetches CDDB info for an audio cd.")
    (home-page "https://web.archive.org/web/20190628161057/http://armin.emx.at/cddb/")
    (license license:gpl3+)))

(define-public g15daemon
  (package
    (name "g15daemon")
    (version "3.0.4a")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.com/menelkir/g15daemon")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a daemon that makes it possible to use the G-Buttons and draw on the G15 LCD")
    (description "A daemon that makes it possible to use the G-Buttons and draw on the G15 LCD.")
    (home-page "https://gitlab.com/menelkir/g15daemon")
    (license license:gpl3+)))

(define-public libax25
  (package
    (name "libax25")
    (version "0.0.12_rc5")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/libax25.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "ham Radio - library for AX.25, ROSE, 6PACK, KISS and NETROM protocols")
    (description "Ham Radio - library for AX.25, ROSE, 6PACK, KISS and NETROM protocols.")
    (home-page "https://linux-ax25.in-berlin.de")
    (license license:lgpl2.1+)))

(define-public libccd
  (package
    (name "libccd")
    (version "2.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/danfis/libccd")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "library for collision detection between two convex shapes")
    (description "Library for collision detection between two convex shapes.")
    (home-page "https://github.com/danfis/libccd")
    (license license:bsd-3)))

(define-public libdvbcsa
  (package
    (name "libdvbcsa")
    (version "1.1.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/libdvbcsa.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a free implementation of the DVB Common Scrambling Algorithm")
    (description "A free implementation of the DVB Common Scrambling Algorithm.")
    (home-page "http://www.videolan.org/developers/libdvbcsa.html")
    (license license:gpl3+)))
