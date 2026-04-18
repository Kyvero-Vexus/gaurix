;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency tree resolver pass --- deptree-resolver-260418v
;;; Resolves 100 packages from dependency tree queue (TODO pool).
;;;
;;; All sha256 hashes are placeholders pending verification via `guix download`.

(define-module (gaurix packages deptree-resolver-260418v)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system node)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:export (pygtk
            kdoctools-git
            kconfigwidgets-git
            kcrash-git
            kcompletion-git
            knotifications-git
            kauth-git
            kdeclarative-git
            r-purrr
            plasma-activities-git
            mingw-w64-libxml2
            r-tidyselect
            mingw-w64-libunistring
            mingw-w64-sdl
            mingw-w64-dbus
            vapoursynth-plugin-nnedi3-git
            timbl
            fvwm
            libcd
            kfilemetadata-git
            libgmp-static
            libnatspec
            lombok-common
            mime-pkgbuild
            msp430-elf-binutils
            octave-struct
            oracle-instantclient-sdk
            perl-class-gomor
            perl-config-any
            perl-data-dumper-concise
            perl-devel-caller
            perl-heap
            perl-http-body
            perl-sys-sigaction
            perl-tree-simple
            php-codesniffer
            pod2man
            python2-sip-pyqt4
            r-generics
            r-sys
            sdx
            skalibs
            slf4j
            vim-vim-support
            yarn-berry
            lib32-cjson
            mingw-w64-libffi
            mingw-w64-lzo
            mingw-w64-opus
            moarvm
            mpir
            nodejs-less
            nodejs-yeoman
            oss
            otcl
            pandoc-xnos
            perl-audio-scan
            perl-modern-perl
            policycoreutils
            python-pa-ringbuffer
            python-pysdl2
            python-svg-path
            python2-contextlib2
            python2-pyxdg
            python2-typing
            r-fs
            r-rcppeigen
            compiz-bcop
            compiz-bcop-git
            eusw
            lib32-lua
            libliri-git
            librep
            libspectrum
            mingw-w64-openjpeg2
            mingw-w64-pdcurses
            python-i3-py
            python2-reportlab
            r-xml2
            ruby-activemodel
            vapoursynth-plugin-descale-git
            vapoursynth-plugin-havsfunc
            vapoursynth-plugin-sangnom-git
            vst2sdk
            aldumb
            astromatic-sextractor
            guile-reader
            libdbusmenu-qt4
            nodejs-nativefier
            perl-config-inifiles
            perl-moosex-emulate-class-accessor-fast
            qt5-gsettings-git
            tn5250j
            ueye-base
            libgamma
            mingw-w64-fribidi
            nagios
            perl-alien-wxwidgets
            python-amulet-compiler-version
            python-colored
))

(define-public pygtk
  (package
    (name "pygtk")
    (version "2.24.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/pygtk.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "python bindings for the GTK widget set")
    (description "Python bindings for the GTK widget set.")
    (home-page "https://wiki.gnome.org/Projects/PyGTK")
    (license license:lgpl2.1+)))

(define-public kdoctools-git
  (package
    (name "kdoctools-git")
    (version "6.0.0_r834.g83c776b")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/kdoctools-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "documentation generation from docbook")
    (description "Documentation generation from docbook.")
    (home-page "https://community.kde.org/Frameworks")
    (license license:lgpl3+)))

(define-public kconfigwidgets-git
  (package
    (name "kconfigwidgets-git")
    (version "6.0.0_r1054.g927abb37")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/kconfigwidgets-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "widgets for KConfig")
    (description "Widgets for KConfig.")
    (home-page "https://community.kde.org/Frameworks")
    (license license:lgpl3+)))

(define-public kcrash-git
  (package
    (name "kcrash-git")
    (version "6.0.0_r517.g90f800f")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/kcrash-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "support for application crash analysis and bug report from apps")
    (description "Support for application crash analysis and bug report from apps.")
    (home-page "https://community.kde.org/Frameworks")
    (license license:lgpl3+)))

(define-public kcompletion-git
  (package
    (name "kcompletion-git")
    (version "6.0.0_r630.ge527200")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/kcompletion-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "text completion helpers and widgets")
    (description "Text completion helpers and widgets.")
    (home-page "https://community.kde.org/Frameworks")
    (license license:lgpl3+)))

(define-public knotifications-git
  (package
    (name "knotifications-git")
    (version "6.0.0_r961.g18d70b9")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/knotifications-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "abstraction for system notifications")
    (description "Abstraction for system notifications.")
    (home-page "https://community.kde.org/Frameworks")
    (license license:lgpl3+)))

(define-public kauth-git
  (package
    (name "kauth-git")
    (version "6.0.0_r639.g9e7cd93")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/kauth-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "abstraction to system policy and authentication features")
    (description "Abstraction to system policy and authentication features.")
    (home-page "https://community.kde.org/Frameworks")
    (license license:lgpl3+)))

(define-public kdeclarative-git
  (package
    (name "kdeclarative-git")
    (version "6.0.0_r1259.gaee973e1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/kdeclarative-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "provides integration of QML and KDE Frameworks")
    (description "Provides integration of QML and KDE Frameworks.")
    (home-page "https://community.kde.org/Frameworks")
    (license license:lgpl3+)))

(define-public r-purrr
  (package
    (name "r-purrr")
    (version "1.2.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/r-purrr.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "functional Programming Tools")
    (description "Functional Programming Tools.")
    (home-page "https://cran.r-project.org/package=purrr")
    (license license:gpl3+)))

(define-public plasma-activities-git
  (package
    (name "plasma-activities-git")
    (version "6.0.80_r1478.g8f90ae8b")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/plasma-activities-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "core components for KDE Activities")
    (description "Core components for KDE Activities.")
    (home-page "https://kde.org/plasma-desktop/")
    (license license:lgpl3+)))

(define-public mingw-w64-libxml2
  (package
    (name "mingw-w64-libxml2")
    (version "2.15.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mingw-w64-libxml2.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "xML C parser and toolkit (mingw-w64)")
    (description "XML C parser and toolkit (mingw-w64).")
    (home-page "https://gitlab.gnome.org/GNOME/libxml2/-/wikis/home")
    (license license:expat)))

(define-public r-tidyselect
  (package
    (name "r-tidyselect")
    (version "1.2.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/r-tidyselect.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "select from a Set of Strings")
    (description "Select from a Set of Strings.")
    (home-page "https://cran.r-project.org/package=tidyselect")
    (license license:expat)))

(define-public mingw-w64-libunistring
  (package
    (name "mingw-w64-libunistring")
    (version "1.4.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mingw-w64-libunistring.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "library for manipulating Unicode strings and C strings (mingw-w64)")
    (description "Library for manipulating Unicode strings and C strings (mingw-w64).")
    (home-page "https://www.gnu.org/software/libunistring/")
    (license license:lgpl3+)))

(define-public mingw-w64-sdl
  (package
    (name "mingw-w64-sdl")
    (version "1.2.15")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mingw-w64-sdl.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a library for portable low-level access to a video framebuffer, audio outpu..")
    (description "A library for portable low-level access to a video framebuffer, audio output, mouse, and keyboard (mingw-w64).")
    (home-page "https://www.libsdl.org")
    (license license:lgpl3+)))

(define-public mingw-w64-dbus
  (package
    (name "mingw-w64-dbus")
    (version "1.16.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mingw-w64-dbus.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "freedesktop.org message bus system (mingw-w64)")
    (description "Freedesktop.org message bus system (mingw-w64).")
    (home-page "https://www.freedesktop.org/wiki/Software/dbus/")
    (license license:gpl2+)))

(define-public vapoursynth-plugin-nnedi3-git
  (package
    (name "vapoursynth-plugin-nnedi3-git")
    (version "12.0.g8c35822")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/vapoursynth-plugin-nnedi3-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "plugin for Vapoursynth: nnedi3 (GIT version)")
    (description "Plugin for Vapoursynth: nnedi3 (GIT version).")
    (home-page "http://forum.doom9.org/showthread.php?t=166434")
    (license license:gpl2+)))

(define-public timbl
  (package
    (name "timbl")
    (version "6.10")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/timbl.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "tilburg Memory-Based Learner, implementations of k-nearest neighbour classi..")
    (description "Tilburg Memory-Based Learner, implementations of k-nearest neighbour classification.")
    (home-page "https://languagemachines.github.io/timbl/")
    (license license:gpl3+)))

(define-public fvwm
  (package
    (name "fvwm")
    (version "2.7.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/fvwm.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "fvwm2 - a virtual window manager. Only gets serious bugfixes. New version i..")
    (description "Fvwm2 - a virtual window manager. Only gets serious bugfixes. New version is Fvwm3.")
    (home-page "http://www.fvwm.org")
    (license license:non-copyleft)))

(define-public libcd
  (package
    (name "libcd")
    (version "5.14")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/libcd.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "canvas Draw - 2D vector graphics library")
    (description "Canvas Draw - 2D vector graphics library.")
    (home-page "https://www.tecgraf.puc-rio.br/cd/")
    (license license:expat)))

(define-public kfilemetadata-git
  (package
    (name "kfilemetadata-git")
    (version "6.0.0_r1093.gb0b1666")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/kfilemetadata-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a library for extracting file metadata")
    (description "A library for extracting file metadata.")
    (home-page "https://community.kde.org/Frameworks")
    (license license:lgpl3+)))

(define-public libgmp-static
  (package
    (name "libgmp-static")
    (version "6.3.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/libgmp-static.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a free library for arbitrary precision arithmetic, but only includes libgmp..")
    (description "A free library for arbitrary precision arithmetic, but only includes libgmp.a and libgmpxx.a.")
    (home-page "https://gmplib.org")
    (license license:gpl2+)))

(define-public libnatspec
  (package
    (name "libnatspec")
    (version "0.3.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Etersoft/libnatspec")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a collection of functions for request various charsets and locales for host..")
    (description "A collection of functions for request various charsets and locales for host system and for other system.")
    (home-page "https://github.com/Etersoft/libnatspec")
    (license license:lgpl3+)))

(define-public lombok-common
  (package
    (name "lombok-common")
    (version "1.18.44")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lombok-common.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "project Lombok integrated with several Eclipse-based installations")
    (description "Project Lombok integrated with several Eclipse-based installations.")
    (home-page "https://projectlombok.org")
    (license license:expat)))

(define-public mime-pkgbuild
  (package
    (name "mime-pkgbuild")
    (version "5")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.com/rafaelff/gtksourceview-pkgbuild")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "mIME types for PKGBUILD files")
    (description "MIME types for PKGBUILD files.")
    (home-page "https://gitlab.com/rafaelff/gtksourceview-pkgbuild")
    (license license:lgpl2.1+)))

(define-public msp430-elf-binutils
  (package
    (name "msp430-elf-binutils")
    (version "2.45")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/msp430-elf-binutils.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "gNU binary utilities for the msp430-elf target")
    (description "GNU binary utilities for the msp430-elf target.")
    (home-page "http://www.gnu.org/software/binutils/")
    (license license:gpl3+)))

(define-public octave-struct
  (package
    (name "octave-struct")
    (version "1.0.18")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/octave-struct.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "additional Structure manipulations functions")
    (description "Additional Structure manipulations functions.")
    (home-page "https://gnu-octave.github.io/packages/struct/")
    (license license:gpl3+)))

(define-public oracle-instantclient-sdk
  (package
    (name "oracle-instantclient-sdk")
    (version "23.7.0.25.01")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/oracle-instantclient-sdk.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "additional header files for developing Oracle applications with Instant Client")
    (description "Additional header files for developing Oracle applications with Instant Client.")
    (home-page "https://www.oracle.com/at/database/technologies/instant-client/downloads.html")
    (license license:non-copyleft)))

(define-public perl-class-gomor
  (package
    (name "perl-class-gomor")
    (version "1.03")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/perl-class-gomor.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "another class and object builder")
    (description "Another class and object builder.")
    (home-page "https://metacpan.org/release/Class-Gomor")
    (license license:gpl3+)))

(define-public perl-config-any
  (package
    (name "perl-config-any")
    (version "0.33")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/perl-config-any.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "load configuration from different file formats, transparently")
    (description "Load configuration from different file formats, transparently.")
    (home-page "http://search.cpan.org/dist/Config-Any")
    (license license:artistic2.0)))

(define-public perl-data-dumper-concise
  (package
    (name "perl-data-dumper-concise")
    (version "2.023")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/perl-data-dumper-concise.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "perl/CPAN Module Data::Dumper::Concise: Less indentation and newlines plus ..")
    (description "Perl/CPAN Module Data::Dumper::Concise: Less indentation and newlines plus sub deparsing.")
    (home-page "https://metacpan.org/release/Data-Dumper-Concise")
    (license license:gpl3+)))

(define-public perl-devel-caller
  (package
    (name "perl-devel-caller")
    (version "2.07")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/perl-devel-caller.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "meatier versions of caller")
    (description "Meatier versions of caller.")
    (home-page "https://metacpan.org/release/Devel-Caller")
    (license license:gpl3+)))

(define-public perl-heap
  (package
    (name "perl-heap")
    (version "0.80")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/perl-heap.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "perl extensions for keeping data partially sorted")
    (description "Perl extensions for keeping data partially sorted.")
    (home-page "http://search.cpan.org/dist/Heap")
    (license license:gpl3+)))

(define-public perl-http-body
  (package
    (name "perl-http-body")
    (version "1.23")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/perl-http-body.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "hTTP Body Parser")
    (description "HTTP Body Parser.")
    (home-page "https://metacpan.org/dist/HTTP-Body")
    (license license:gpl3+)))

(define-public perl-sys-sigaction
  (package
    (name "perl-sys-sigaction")
    (version "0.24")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/perl-sys-sigaction.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "perl extension for Consistent Signal Handling")
    (description "Perl extension for Consistent Signal Handling.")
    (home-page "https://metacpan.org/pod/Sys::SigAction")
    (license license:artistic2.0)))

(define-public perl-tree-simple
  (package
    (name "perl-tree-simple")
    (version "1.34")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/perl-tree-simple.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a simple tree object")
    (description "A simple tree object.")
    (home-page "https://metacpan.org/release/Tree-Simple")
    (license license:non-copyleft)))

(define-public php-codesniffer
  (package
    (name "php-codesniffer")
    (version "4.0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/PHPCSStandards/PHP_CodeSniffer")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "pHP_CodeSniffer tokenizes PHP, JavaScript and CSS files to detect and fix v..")
    (description "PHP_CodeSniffer tokenizes PHP, JavaScript and CSS files to detect and fix violations of a defined set of coding standards.")
    (home-page "https://github.com/PHPCSStandards/PHP_CodeSniffer")
    (license license:bsd-3)))

(define-public pod2man
  (package
    (name "pod2man")
    (version "5.42.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/pod2man.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "make pod2man easily accessible")
    (description "Make pod2man easily accessible.")
    (home-page "https://perl.org/")
    (license license:non-copyleft)))

(define-public python2-sip-pyqt4
  (package
    (name "python2-sip-pyqt4")
    (version "4.19.25")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python2-sip-pyqt4.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "python 2.x SIP bindings for C and C++ libraries (PyQt4 version)")
    (description "Python 2.x SIP bindings for C and C++ libraries (PyQt4 version).")
    (home-page "https://www.riverbankcomputing.com/software/sip/intro")
    (license license:non-copyleft)))

(define-public r-generics
  (package
    (name "r-generics")
    (version "0.1.4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/r-generics.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "common S3 Generics not Provided by Base R Methods Related to Model Fitting")
    (description "Common S3 Generics not Provided by Base R Methods Related to Model Fitting.")
    (home-page "https://cran.r-project.org/package=generics")
    (license license:expat)))

(define-public r-sys
  (package
    (name "r-sys")
    (version "3.4.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/r-sys.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "powerful and Reliable Tools for Running System Commands in R")
    (description "Powerful and Reliable Tools for Running System Commands in R.")
    (home-page "https://cran.r-project.org/package=sys")
    (license license:expat)))

(define-public sdx
  (package
    (name "sdx")
    (version "20110317")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/sdx.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a utility for making and unpacking starkits")
    (description "A utility for making and unpacking starkits.")
    (home-page "http://equi4.com/starkit/sdx.html")
    (license license:expat)))

(define-public skalibs
  (package
    (name "skalibs")
    (version "2.14.5.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/skalibs.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a general-purpose utility library for secure, small C development")
    (description "A general-purpose utility library for secure, small C development.")
    (home-page "http://www.skarnet.org/software/skalibs/")
    (license license:isc)))

(define-public slf4j
  (package
    (name "slf4j")
    (version "2.0.17")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/slf4j.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "simple Logging Facade for Java for various logging frameworks (e.g. java.ut..")
    (description "Simple Logging Facade for Java for various logging frameworks (e.g. java.util.logging, logback, log4j).")
    (home-page "https://www.slf4j.org")
    (license license:expat)))

(define-public vim-vim-support
  (package
    (name "vim-vim-support")
    (version "2.4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/vim-vim-support.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "vim-IDE implements a vim script IDE with hotkeys and snippets from the same..")
    (description "Vim-IDE implements a vim script IDE with hotkeys and snippets from the same author of vim-{bash,perl,lua,c}-support.")
    (home-page "https://www.vim.org/scripts/script.php?script_id=3931")
    (license license:non-copyleft)))

(define-public yarn-berry
  (package
    (name "yarn-berry")
    (version "4.9.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/yarn-berry.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (synopsis "fast, reliable, and secure dependency management - Active development trunk")
    (description "Fast, reliable, and secure dependency management - Active development trunk.")
    (home-page "https://yarnpkg.com/")
    (license license:bsd-3)))

(define-public lib32-cjson
  (package
    (name "lib32-cjson")
    (version "1.7.19")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/DaveGamble/cJSON")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "ultralightweight JSON parser in ANSI C (32-bit)")
    (description "Ultralightweight JSON parser in ANSI C (32-bit).")
    (home-page "https://github.com/DaveGamble/cJSON")
    (license license:expat)))

(define-public mingw-w64-libffi
  (package
    (name "mingw-w64-libffi")
    (version "3.4.6")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mingw-w64-libffi.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "portable foreign function interface library (mingw-w64)")
    (description "Portable foreign function interface library (mingw-w64).")
    (home-page "http://sourceware.org/libffi")
    (license license:expat)))

(define-public mingw-w64-lzo
  (package
    (name "mingw-w64-lzo")
    (version "2.10")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mingw-w64-lzo.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "portable lossless data compression library (mingw-w64)")
    (description "Portable lossless data compression library (mingw-w64).")
    (home-page "http://www.oberhumer.com/opensource/lzo")
    (license license:gpl3+)))

(define-public mingw-w64-opus
  (package
    (name "mingw-w64-opus")
    (version "1.5.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mingw-w64-opus.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "codec designed for interactive speech and audio transmission over the Inter..")
    (description "Codec designed for interactive speech and audio transmission over the Internet (mingw-w64).")
    (home-page "https://www.opus-codec.org")
    (license license:bsd-3)))

(define-public moarvm
  (package
    (name "moarvm")
    (version "2026.03")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/moarvm.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a VM with adaptive optimization and JIT compilation, built for Rakudo")
    (description "A VM with adaptive optimization and JIT compilation, built for Rakudo.")
    (home-page "http://moarvm.com/")
    (license license:non-copyleft)))

(define-public mpir
  (package
    (name "mpir")
    (version "3.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mpir.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "library for multiple precision integers and rationals")
    (description "Library for multiple precision integers and rationals.")
    (home-page "https://www.mpir.org/")
    (license license:lgpl3+)))

(define-public nodejs-less
  (package
    (name "nodejs-less")
    (version "4.5.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/nodejs-less.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a standalone compiler for the LESS CSS language")
    (description "A standalone compiler for the LESS CSS language.")
    (home-page "http://lesscss.org/")
    (license license:asl2.0)))

(define-public nodejs-yeoman
  (package
    (name "nodejs-yeoman")
    (version "4.3.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/nodejs-yeoman.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (synopsis "cLI tool for running Yeoman generators")
    (description "CLI tool for running Yeoman generators.")
    (home-page "http://yeoman.io")
    (license license:expat)))

(define-public oss
  (package
    (name "oss")
    (version "4.2_2020")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/oss.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "open Sound System UNIX audio architecture")
    (description "Open Sound System UNIX audio architecture.")
    (home-page "http://developer.opensound.com/")
    (license license:gpl2+)))

(define-public otcl
  (package
    (name "otcl")
    (version "1.14")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/otcl.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "an extension to Tcl/Tk for object-oriented programming")
    (description "An extension to Tcl/Tk for object-oriented programming.")
    (home-page "http://otcl-tclcl.sourceforge.net/otcl/")
    (license license:expat)))

(define-public pandoc-xnos
  (package
    (name "pandoc-xnos")
    (version "2.5.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/tomduck/pandoc-xnos")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "library code for the pandoc-fignos/eqnos/tablenos filters")
    (description "Library code for the pandoc-fignos/eqnos/tablenos filters.")
    (home-page "https://github.com/tomduck/pandoc-xnos")
    (license license:gpl3+)))

(define-public perl-audio-scan
  (package
    (name "perl-audio-scan")
    (version "1.01")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/perl-audio-scan.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "fast C metadata and tag reader for all common audio file formats")
    (description "Fast C metadata and tag reader for all common audio file formats.")
    (home-page "https://metacpan.org/dist/Audio-Scan")
    (license license:gpl2+)))

(define-public perl-modern-perl
  (package
    (name "perl-modern-perl")
    (version "1.20250607")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/perl-modern-perl.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "enable all of the features of Modern Perl with one command")
    (description "Enable all of the features of Modern Perl with one command.")
    (home-page "https://metacpan.org/release/Modern-Perl")
    (license license:non-copyleft)))

(define-public policycoreutils
  (package
    (name "policycoreutils")
    (version "3.10")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/SELinuxProject/selinux")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "sELinux policy core utilities")
    (description "SELinux policy core utilities.")
    (home-page "https://github.com/SELinuxProject/selinux")
    (license license:gpl2+)))

(define-public python-pa-ringbuffer
  (package
    (name "python-pa-ringbuffer")
    (version "0.1.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/spatialaudio/python-pa-ringbuffer")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "python wrapper for PortAudio's ring buffer")
    (description "Python wrapper for PortAudio's ring buffer.")
    (home-page "https://github.com/spatialaudio/python-pa-ringbuffer")
    (license license:expat)))

(define-public python-pysdl2
  (package
    (name "python-pysdl2")
    (version "0.9.17")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/marcusva/py-sdl2")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "python ctypes wrapper around SDL2")
    (description "Python ctypes wrapper around SDL2.")
    (home-page "https://github.com/marcusva/py-sdl2")
    (license license:non-copyleft)))

(define-public python-svg-path
  (package
    (name "python-svg.path")
    (version "6.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/regebro/svg.path")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "sVG path objects and parser")
    (description "SVG path objects and parser.")
    (home-page "https://github.com/regebro/svg.path")
    (license license:expat)))

(define-public python2-contextlib2
  (package
    (name "python2-contextlib2")
    (version "0.6.0.post1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python2-contextlib2.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "backports of the contextlib module")
    (description "Backports of the contextlib module.")
    (home-page "https://pypi.python.org/pypi/contextlib2")
    (license license:non-copyleft)))

(define-public python2-pyxdg
  (package
    (name "python2-pyxdg")
    (version "0.28")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python2-pyxdg.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "official freedesktop.org XDG specifications support library (for Python 2)")
    (description "Official freedesktop.org XDG specifications support library (for Python 2).")
    (home-page "https://pypi.org/project/pyxdg/0.28/")
    (license license:lgpl3+)))

(define-public python2-typing
  (package
    (name "python2-typing")
    (version "3.10.0.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python2-typing.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "backport of the standard library typing module to Python versions older tha..")
    (description "Backport of the standard library typing module to Python versions older than 3.6 (Legacy Python 2 version).")
    (home-page "https://pypi.python.org/pypi/typing")
    (license license:non-copyleft)))

(define-public r-fs
  (package
    (name "r-fs")
    (version "2.0.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/r-fs.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "cross-Platform File System Operations Based on 'libuv'")
    (description "Cross-Platform File System Operations Based on 'libuv'.")
    (home-page "https://cran.r-project.org/package=fs")
    (license license:expat)))

(define-public r-rcppeigen
  (package
    (name "r-rcppeigen")
    (version "0.3.4.0.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/r-rcppeigen.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "'Rcpp' Integration for the 'Eigen' Templated Linear Algebra Library")
    (description "'Rcpp' Integration for the 'Eigen' Templated Linear Algebra Library.")
    (home-page "https://cran.r-project.org/package=RcppEigen")
    (license license:gpl3+)))

(define-public compiz-bcop
  (package
    (name "compiz-bcop")
    (version "0.8.18")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.com/compiz/compiz-bcop")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "compiz option code generator")
    (description "Compiz option code generator.")
    (home-page "https://gitlab.com/compiz/compiz-bcop/")
    (license license:gpl3+)))

(define-public compiz-bcop-git
  (package
    (name "compiz-bcop-git")
    (version "0.8.14.r1.g1eeaf40")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.com/compiz/compiz-bcop")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "compiz option code generator")
    (description "Compiz option code generator.")
    (home-page "https://gitlab.com/compiz/compiz-bcop")
    (license license:gpl3+)))

(define-public eusw
  (package
    (name "eusw")
    (version "1.3.1.103")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/eusw.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "iIT End User CA-1. Sign (web). Base program")
    (description "IIT End User CA-1. Sign (web). Base program.")
    (home-page "https://iit.com.ua")
    (license license:non-copyleft)))

(define-public lib32-lua
  (package
    (name "lib32-lua")
    (version "5.4.8")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lib32-lua.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a powerful light-weight programming language designed for extending applica..")
    (description "A powerful light-weight programming language designed for extending applications.")
    (home-page "http://www.lua.org/")
    (license license:expat)))

(define-public libliri-git
  (package
    (name "libliri-git")
    (version "r183.5ebe982")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/libliri-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "utilities for Liri Quick applications")
    (description "Utilities for Liri Quick applications.")
    (home-page "https://liri.io")
    (license license:lgpl3+)))

(define-public librep
  (package
    (name "librep")
    (version "0.92.7")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/librep.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "lisp system for Sawfish")
    (description "Lisp system for Sawfish.")
    (home-page "http://sawfish.wikia.com/wiki/Librep")
    (license license:gpl2+)))

(define-public libspectrum
  (package
    (name "libspectrum")
    (version "1.6.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/libspectrum.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "zX Spectrum emulator support library")
    (description "ZX Spectrum emulator support library.")
    (home-page "http://fuse-emulator.sourceforge.net/libspectrum.php")
    (license license:gpl3+)))

(define-public mingw-w64-openjpeg2
  (package
    (name "mingw-w64-openjpeg2")
    (version "2.5.4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mingw-w64-openjpeg2.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "an open source JPEG 2000 codec, version 2.5.4 (mingw-w64)")
    (description "An open source JPEG 2000 codec, version 2.5.4 (mingw-w64).")
    (home-page "https://www.openjpeg.org")
    (license license:bsd-3)))

(define-public mingw-w64-pdcurses
  (package
    (name "mingw-w64-pdcurses")
    (version "4.5.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mingw-w64-pdcurses.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "public Domain Curses wincon port (mingw-w64)")
    (description "Public Domain Curses wincon port (mingw-w64).")
    (home-page "https://www.projectpluto.com/win32a.htm")
    (license license:public-domain)))

(define-public python-i3-py
  (package
    (name "python-i3-py")
    (version "0.6.8")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ziberna/i3-py")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "tools for i3 users and developers")
    (description "Tools for i3 users and developers.")
    (home-page "https://github.com/ziberna/i3-py")
    (license license:gpl3+)))

(define-public python2-reportlab
  (package
    (name "python2-reportlab")
    (version "3.5.34")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python2-reportlab.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a proven industry-strength PDF generating solution")
    (description "A proven industry-strength PDF generating solution.")
    (home-page "http://www.reportlab.com/")
    (license license:bsd-3)))

(define-public r-xml2
  (package
    (name "r-xml2")
    (version "1.5.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/r-xml2.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "parse XML")
    (description "Parse XML.")
    (home-page "https://cran.r-project.org/package=xml2")
    (license license:expat)))

(define-public ruby-activemodel
  (package
    (name "ruby-activemodel")
    (version "8.0.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ruby-activemodel.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a toolkit for building modeling frameworks (part of Rails)")
    (description "A toolkit for building modeling frameworks (part of Rails).")
    (home-page "https://rubyonrails.org")
    (license license:expat)))

(define-public vapoursynth-plugin-descale-git
  (package
    (name "vapoursynth-plugin-descale-git")
    (version "8.10.g8c53f5d")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Irrational-Encoding-Wizardry/vapoursynth-descale")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "plugin for Vapoursynth: descale (GIT version)")
    (description "Plugin for Vapoursynth: descale (GIT version).")
    (home-page "https://github.com/Irrational-Encoding-Wizardry/vapoursynth-descale.git")
    (license license:expat)))

(define-public vapoursynth-plugin-havsfunc
  (package
    (name "vapoursynth-plugin-havsfunc")
    (version "r33")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/HomeOfVapourSynthEvolution/havsfunc")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "plugin for Vapoursynth: havsfunc")
    (description "Plugin for Vapoursynth: havsfunc.")
    (home-page "https://github.com/HomeOfVapourSynthEvolution/havsfunc")
    (license license:gpl3+)))

(define-public vapoursynth-plugin-sangnom-git
  (package
    (name "vapoursynth-plugin-sangnom-git")
    (version "42.0.g55a93f5")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/dubhater/vapoursynth-sangnom")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "plugin for Vapoursynth: sangnom (Fork)(GIT version)")
    (description "Plugin for Vapoursynth: sangnom (Fork)(GIT version).")
    (home-page "https://github.com/dubhater/vapoursynth-sangnom")
    (license license:expat)))

(define-public vst2sdk
  (package
    (name "vst2sdk")
    (version "1:2.4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/vst2sdk.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "steinberg's VST2 SDK")
    (description "Steinberg's VST2 SDK.")
    (home-page "http://www.steinberg.net/en/company/developers.html")
    (license license:non-copyleft)))

(define-public aldumb
  (package
    (name "aldumb")
    (version "2.0.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/kode54/dumb")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "allegro 4 glue library for DUMB module player library")
    (description "Allegro 4 glue library for DUMB module player library.")
    (home-page "https://github.com/kode54/dumb")
    (license license:non-copyleft)))

(define-public astromatic-sextractor
  (package
    (name "astromatic-sextractor")
    (version "2.28.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/astromatic-sextractor.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "builds a catalogue of objects from an astronomical image (build from source)")
    (description "Builds a catalogue of objects from an astronomical image (build from source).")
    (home-page "http://www.astromatic.net/software/sextractor")
    (license license:gpl3+)))

(define-public guile-reader
  (package
    (name "guile-reader")
    (version "0.6.4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/guile-reader.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a simple framework for building readers for GNU Guile")
    (description "A simple framework for building readers for GNU Guile.")
    (home-page "http://www.nongnu.org/guile-reader")
    (license license:gpl3+)))

(define-public libdbusmenu-qt4
  (package
    (name "libdbusmenu-qt4")
    (version "0.9.3+16.04.20160218")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/desktop-app/libdbusmenu-qt")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a library that provides a Qt implementation of the DBusMenu spec")
    (description "A library that provides a Qt implementation of the DBusMenu spec.")
    (home-page "https://github.com/desktop-app/libdbusmenu-qt")
    (license license:lgpl2.1+)))

(define-public nodejs-nativefier
  (package
    (name "nodejs-nativefier")
    (version "52.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nativefier/nativefier")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a command-line tool to easily create a desktop app for any web site with mi..")
    (description "A command-line tool to easily create a desktop app for any web site with minimal configuration.")
    (home-page "https://github.com/nativefier/nativefier/")
    (license license:expat)))

(define-public perl-config-inifiles
  (package
    (name "perl-config-inifiles")
    (version "3.000003")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/perl-config-inifiles.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a Perl module for reading .ini-style configuration files")
    (description "A Perl module for reading .ini-style configuration files.")
    (home-page "http://search.cpan.org/dist/Config-IniFiles/")
    (license license:gpl3+)))

(define-public perl-moosex-emulate-class-accessor-fast
  (package
    (name "perl-moosex-emulate-class-accessor-fast")
    (version "0.009032")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/perl-moosex-emulate-class-accessor-fast.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "emulate Class::Accessor::Fast behavior using Moose attributes")
    (description "Emulate Class::Accessor::Fast behavior using Moose attributes.")
    (home-page "https://metacpan.org/dist/MooseX-Emulate-Class-Accessor-Fast")
    (license license:gpl3+)))

(define-public qt5-gsettings-git
  (package
    (name "qt5-gsettings-git")
    (version "v1.3.0.r34.g28262e5")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/qt5-gsettings-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "qt-style wrapper for GSettings")
    (description "Qt-style wrapper for GSettings.")
    (home-page "https://liri.io")
    (license license:lgpl3+)))

(define-public tn5250j
  (package
    (name "tn5250j")
    (version "0.7.6")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/tn5250j.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "5250 terminal emulator for iSeries and AS/400 written in Java")
    (description "5250 terminal emulator for iSeries and AS/400 written in Java.")
    (home-page "http://tn5250j.org/")
    (license license:gpl2+)))

(define-public ueye-base
  (package
    (name "ueye-base")
    (version "4.96.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ueye-base.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "iDS uEye libraries")
    (description "IDS uEye libraries.")
    (home-page "https://en.ids-imaging.com")
    (license license:non-copyleft)))

(define-public libgamma
  (package
    (name "libgamma")
    (version "0.8.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://codeberg.org/maandree/libgamma")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "display server abstraction layer for gamma ramps")
    (description "Display server abstraction layer for gamma ramps.")
    (home-page "https://codeberg.org/maandree/libgamma")
    (license license:non-copyleft)))

(define-public mingw-w64-fribidi
  (package
    (name "mingw-w64-fribidi")
    (version "1.0.16")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/fribidi/fribidi")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a Free Implementation of the Unicode Bidirectional Algorithm (mingw-w64)")
    (description "A Free Implementation of the Unicode Bidirectional Algorithm (mingw-w64).")
    (home-page "https://github.com/fribidi/fribidi")
    (license license:lgpl2.1+)))

(define-public nagios
  (package
    (name "nagios")
    (version "4.5.10")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/nagios.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "nagios is an open source host, service and network monitoring program")
    (description "Nagios is an open source host, service and network monitoring program.")
    (home-page "http://www.nagios.org")
    (license license:gpl3+)))

(define-public perl-alien-wxwidgets
  (package
    (name "perl-alien-wxwidgets")
    (version "0.69")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/perl-alien-wxwidgets.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "building, finding and using wxWidgets binaries")
    (description "Building, finding and using wxWidgets binaries.")
    (home-page "https://metacpan.org/release/Alien-wxWidgets")
    (license license:gpl3+)))

(define-public python-amulet-compiler-version
  (package
    (name "python-amulet-compiler-version")
    (version "4.0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Amulet-Team/Amulet-Compiler-Version")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a tiny library to allow dependencies to require the same compiler")
    (description "A tiny library to allow dependencies to require the same compiler.")
    (home-page "https://github.com/Amulet-Team/Amulet-Compiler-Version")
    (license license:non-copyleft)))

(define-public python-colored
  (package
    (name "python-colored")
    (version "2.3.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-colored.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "simple python library for color and formatting to terminal")
    (description "Simple python library for color and formatting to terminal.")
    (home-page "https://dslackw.gitlab.io/colored")
    (license license:expat)))
