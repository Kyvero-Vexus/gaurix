;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency tree resolver pass --- deptree-resolver-260418p
;;; Resolves 100 packages from dependency tree queue (TODO pool).
;;;
;;; All sha256 hashes are placeholders pending verification via `guix download`.

(define-module (gaurix packages deptree-resolver-260418p)
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
  #:export (extra-cmake-modules-git
            python2-setuptools
            mingw-w64-configure
            php56
            php74
            php80
            php81
            php82
            mbrola
            pzl-common
            pure
            r-lifecycle
            mingw-w64-meson
            rockchip-mpp
            vo-aacenc
            libtremor-git
            lxqt-build-tools-git
            lib32-sdl2
            linux-firmware-whence-uncompressed
            lib32-libusb-compat
            lib32-libstdc++5
            r-withr
            gnustep-gui
            compiz-core
            liri-cmake-shared-git
            r-cpp11
            mingw-w64-wine
            quake3
            mingw-w64-openssl
            termcap
            mingw-w64-vulkan-headers
            jlink-software-and-documentation
            python-thefuzz
            petsc
            idris2
            python-boltons
            python-pynput
            solid-git
            ogmrip
            python2-cairo
            libobjfwrt
            libxc
            libdockapp
            libayatana-common
            solarus
            freedict-tools
            netsurf-buildsystem-git
            trousers
            oracle-instantclient-basic
            mingw-w64-zstd
            plasma-wayland-protocols-git
            protoc-gen-go-grpc
            nginx-unitd
            gnome-vfs
            gstreamer0-10-base
            vmware-horizon-client
            lib32-gimp
            electron22
            contemporary-icons
            ttf-contemporary
            enemy-territory-data
            android-platform
            automoc4
            libucd-git
            ocaml-menhir
            ignition-cmake
            contemporary-widgets
            scalapack
            scangearmp-common
            quassel-common-git
            python-qiskit
            vcvrack
            darling-core-git
            brltty-git
            php83-xml
            plex-media-server
            courier-unicode
            db4-8
            nvidia-340xx-utils
            r-xfun
            r-yaml
            aften
            r-curl
            uget-integrator
            vapoursynth-plugin-fmtconv-git
            htslib
            python-efl
            qtws-base
            tclkit
            lib32-minizip
            bacula-common
            python-portalocker
            libim
            vala-panel
            eccodes
            compiz-core-git
            java8-openjfx
            php83-pdo
            dcaenc
            libbass
))

(define-public extra-cmake-modules-git
  (package
    (name "extra-cmake-modules-git")
    (version "6.16.0.r3803.d42a5482")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/extra-cmake-modules-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "extra modules and scripts for CMake. (GIT version)")
    (description "Extra modules and scripts for CMake. (GIT version).")
    (home-page "https://projects.kde.org/projects/kdesupport/extra-cmake-modules")
    (license license:lgpl3+)))

(define-public python2-setuptools
  (package
    (name "python2-setuptools")
    (version "2:44.1.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python2-setuptools.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "easily download, build, install, upgrade, and uninstall Python packages")
    (description "Easily download, build, install, upgrade, and uninstall Python packages.")
    (home-page "https://pypi.org/project/setuptools")
    (license license:non-copyleft)))

(define-public mingw-w64-configure
  (package
    (name "mingw-w64-configure")
    (version "0.1.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mingw-w64-configure.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "configure wrapper for MinGW (mingw-w64)")
    (description "Configure wrapper for MinGW (mingw-w64).")
    (home-page "http://fedoraproject.org/wiki/MinGW")
    (license license:gpl3+)))

(define-public php56
  (package
    (name "php56")
    (version "5.6.40")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/php56.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "pHP. A general-purpose scripting language that is especially suited to web ..")
    (description "PHP. A general-purpose scripting language that is especially suited to web development.")
    (home-page "http://www.php.net")
    (license license:non-copyleft)))

(define-public php74
  (package
    (name "php74")
    (version "7.4.33")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/php74.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "pHP. A general-purpose scripting language that is especially suited to web ..")
    (description "PHP. A general-purpose scripting language that is especially suited to web development.")
    (home-page "http://www.php.net")
    (license license:non-copyleft)))

(define-public php80
  (package
    (name "php80")
    (version "8.0.30")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/php80.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "pHP. A general-purpose scripting language that is especially suited to web ..")
    (description "PHP. A general-purpose scripting language that is especially suited to web development.")
    (home-page "http://www.php.net")
    (license license:non-copyleft)))

(define-public php81
  (package
    (name "php81")
    (version "8.1.34")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/php81.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "pHP. A general-purpose scripting language that is especially suited to web ..")
    (description "PHP. A general-purpose scripting language that is especially suited to web development.")
    (home-page "http://www.php.net")
    (license license:non-copyleft)))

(define-public php82
  (package
    (name "php82")
    (version "8.2.30")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/php82.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "pHP. A general-purpose scripting language that is especially suited to web ..")
    (description "PHP. A general-purpose scripting language that is especially suited to web development.")
    (home-page "http://www.php.net")
    (license license:non-copyleft)))

(define-public mbrola
  (package
    (name "mbrola")
    (version "1:3.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/numediart/MBROLA")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a phoneme-to-audio converter used by many TTS (Text-to-speech) programs")
    (description "A phoneme-to-audio converter used by many TTS (Text-to-speech) programs.")
    (home-page "https://github.com/numediart/MBROLA")
    (license license:agpl3+)))

(define-public pzl-common
  (package
    (name "pzl_common")
    (version "35.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/pzl_common.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "common files for pzl games")
    (description "Common files for pzl games.")
    (home-page "http://pzl.org.uk/")
    (license license:gpl3+)))

(define-public pure
  (package
    (name "pure")
    (version "0.68")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "http://purelang.bitbucket.org")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "pure is a modern-style functional programming language based on term rewrit..")
    (description "Pure is a modern-style functional programming language based on term rewriting.")
    (home-page "http://purelang.bitbucket.org/")
    (license license:gpl3+)))

(define-public r-lifecycle
  (package
    (name "r-lifecycle")
    (version "1.0.5")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/r-lifecycle.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "manage the Life Cycle of your Package Functions")
    (description "Manage the Life Cycle of your Package Functions.")
    (home-page "https://cran.r-project.org/package=lifecycle")
    (license license:expat)))

(define-public mingw-w64-meson
  (package
    (name "mingw-w64-meson")
    (version "1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mingw-w64-meson.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "meson wrapper for MinGW (mingw-w64)")
    (description "Meson wrapper for MinGW (mingw-w64).")
    (home-page "http://fedoraproject.org/wiki/MinGW")
    (license license:gpl3+)))

(define-public rockchip-mpp
  (package
    (name "rockchip-mpp")
    (version "1:1.0.11")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/HermanChen/mpp")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "rockchip Media Process Platform (MPP)")
    (description "Rockchip Media Process Platform (MPP).")
    (home-page "https://github.com/HermanChen/mpp/")
    (license license:asl2.0)))

(define-public vo-aacenc
  (package
    (name "vo-aacenc")
    (version "1:0.1.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/vo-aacenc.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "visualOn Advanced Audio Coding (AAC) encoder")
    (description "VisualOn Advanced Audio Coding (AAC) encoder.")
    (home-page "https://sourceforge.net/projects/opencore-amr/")
    (license license:asl2.0)))

(define-public libtremor-git
  (package
    (name "libtremor-git")
    (version "2:r127.7c30a66")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/libtremor-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "integer-only, fully Ogg Vorbis compliant software decoder library")
    (description "Integer-only, fully Ogg Vorbis compliant software decoder library.")
    (home-page "https://www.xiph.org/vorbis/")
    (license license:bsd-3)))

(define-public lxqt-build-tools-git
  (package
    (name "lxqt-build-tools-git")
    (version "0.13.0.r3.g7e1175e")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/lxqt/lxqt-build-tools")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "tools to build LXQt and components maintained by the project")
    (description "Tools to build LXQt and components maintained by the project.")
    (home-page "https://github.com/lxqt/lxqt-build-tools")
    (license license:bsd-3)))

(define-public lib32-sdl2
  (package
    (name "lib32-sdl2")
    (version "2.32.10")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lib32-sdl2.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a library for portable low-level access to a video framebuffer, audio outpu..")
    (description "A library for portable low-level access to a video framebuffer, audio output, mouse, and keyboard.")
    (home-page "https://www.libsdl.org")
    (license license:zlib)))

(define-public linux-firmware-whence-uncompressed
  (package
    (name "linux-firmware-whence-uncompressed")
    (version "20260110")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.com/kernel-firmware/linux-firmware")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "firmware files for Linux (without firmware compression for linux<5.19) - WH..")
    (description "Firmware files for Linux (without firmware compression for linux<5.19) - WHENCE file (vendor licenses).")
    (home-page "https://gitlab.com/kernel-firmware/linux-firmware")
    (license license:non-copyleft)))

(define-public lib32-libusb-compat
  (package
    (name "lib32-libusb-compat")
    (version "0.1.8")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lib32-libusb-compat.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "c library that provides generic access to USB devices (32-bit)")
    (description "C library that provides generic access to USB devices (32-bit).")
    (home-page "https://libusb.info/")
    (license license:lgpl3+)))

(define-public lib32-libstdc++5
  (package
    (name "lib32-libstdc++5")
    (version "3.3.6")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lib32-libstdc++5.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "legacy GNU Standard C++ library version 3 (32 bit)")
    (description "Legacy GNU Standard C++ library version 3 (32 bit).")
    (home-page "http://gcc.gnu.org")
    (license license:gpl2+)))

(define-public r-withr
  (package
    (name "r-withr")
    (version "3.0.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/r-withr.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "lightweight Well-Known Geometry Parsing")
    (description "Lightweight Well-Known Geometry Parsing.")
    (home-page "https://cran.r-project.org/package=withr")
    (license license:expat)))

(define-public gnustep-gui
  (package
    (name "gnustep-gui")
    (version "0.32.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/gnustep/libs-gui")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the GNUstep GUI class library")
    (description "The GNUstep GUI class library.")
    (home-page "https://github.com/gnustep/libs-gui")
    (license license:lgpl3+)))

(define-public compiz-core
  (package
    (name "compiz-core")
    (version "0.8.18")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.com/compiz/compiz-core")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "compositing manager without desktop-environment depends (Core w/o decorator)")
    (description "Compositing manager without desktop-environment depends (Core w/o decorator).")
    (home-page "https://gitlab.com/compiz/compiz-core")
    (license license:gpl2+)))

(define-public liri-cmake-shared-git
  (package
    (name "liri-cmake-shared-git")
    (version "v1.1.0.r91.ge633ba7")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/lirios/cmake-shared")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "additional macros and functions for CMake")
    (description "Additional macros and functions for CMake.")
    (home-page "https://github.com/lirios/cmake-shared")
    (license license:gpl3+)))

(define-public r-cpp11
  (package
    (name "r-cpp11")
    (version "0.5.4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/r-cpp11.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a C++11 Interface for R's C Interface")
    (description "A C++11 Interface for R's C Interface.")
    (home-page "https://cran.r-project.org/package=cpp11")
    (license license:expat)))

(define-public mingw-w64-wine
  (package
    (name "mingw-w64-wine")
    (version "1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mingw-w64-wine.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "wine wrapper for MinGW (mingw-w64)")
    (description "Wine wrapper for MinGW (mingw-w64).")
    (home-page "http://fedoraproject.org/wiki/MinGW")
    (license license:expat)))

(define-public quake3
  (package
    (name "quake3")
    (version "1.32c")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/quake3.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the stock Quake 3 Arena binaries. PunkBuster Compatible")
    (description "The stock Quake 3 Arena binaries. PunkBuster Compatible.")
    (home-page "https://web.archive.org/web/20000620090654/http://www.quake3arena.com/")
    (license license:gpl3+)))

(define-public mingw-w64-openssl
  (package
    (name "mingw-w64-openssl")
    (version "3.6.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mingw-w64-openssl.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the Open Source toolkit for Secure Sockets Layer and Transport Layer Securi..")
    (description "The Open Source toolkit for Secure Sockets Layer and Transport Layer Security (mingw-w64).")
    (home-page "https://www.openssl.org")
    (license license:asl2.0)))

(define-public termcap
  (package
    (name "termcap")
    (version "1.3.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/termcap.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "enables programs to use display computer terminals in a device-independent ..")
    (description "Enables programs to use display computer terminals in a device-independent manner.")
    (home-page "http://www.catb.org/~esr/terminfo/")
    (license license:gpl3+)))

(define-public mingw-w64-vulkan-headers
  (package
    (name "mingw-w64-vulkan-headers")
    (version "1.4.341")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mingw-w64-vulkan-headers.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "vulkan header files (mingw-w64)")
    (description "Vulkan header files (mingw-w64).")
    (home-page "https://www.khronos.org/vulkan/")
    (license license:asl2.0)))

(define-public jlink-software-and-documentation
  (package
    (name "jlink-software-and-documentation")
    (version "65:9.36")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/jlink-software-and-documentation.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "segger JLink software & documentation pack for Linux")
    (description "Segger JLink software & documentation pack for Linux.")
    (home-page "https://www.segger.com/jlink-software.html")
    (license license:non-copyleft)))

(define-public python-thefuzz
  (package
    (name "python-thefuzz")
    (version "0.22.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/seatgeek/thefuzz")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "fuzzy string matching in Python")
    (description "Fuzzy string matching in Python.")
    (home-page "https://github.com/seatgeek/thefuzz")
    (license license:expat)))

(define-public petsc
  (package
    (name "petsc")
    (version "3.25.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/petsc.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "portable, extensible toolkit for scientific computation")
    (description "Portable, extensible toolkit for scientific computation.")
    (home-page "https://petsc.org")
    (license license:bsd-3)))

(define-public idris2
  (package
    (name "idris2")
    (version "0.8.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/idris2.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "functional Programming Language with Dependent Types")
    (description "Functional Programming Language with Dependent Types.")
    (home-page "https://idris-lang.github.io/")
    (license license:bsd-3)))

(define-public python-boltons
  (package
    (name "python-boltons")
    (version "25.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/mahmoud/boltons")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "functionality that should be in the standard library. Like builtins, but Bo..")
    (description "Functionality that should be in the standard library. Like builtins, but Boltons.")
    (home-page "https://github.com/mahmoud/boltons")
    (license license:bsd-3)))

(define-public python-pynput
  (package
    (name "python-pynput")
    (version "1.8.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/moses-palmer/pynput")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "python library to monitor and control user input devices")
    (description "Python library to monitor and control user input devices.")
    (home-page "https://github.com/moses-palmer/pynput")
    (license license:lgpl3+)))

(define-public solid-git
  (package
    (name "solid-git")
    (version "6.1.0_r1000.g45b1cc23")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/solid-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "hardware integration and detection")
    (description "Hardware integration and detection.")
    (home-page "https://community.kde.org/Frameworks")
    (license license:lgpl3+)))

(define-public ogmrip
  (package
    (name "ogmrip")
    (version "1.0.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ogmrip.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "libraries and GTK2 interface for DVD ripping using mencoder")
    (description "Libraries and GTK2 interface for DVD ripping using mencoder.")
    (home-page "http://ogmrip.sourceforge.net/")
    (license license:gpl3+)))

(define-public python2-cairo
  (package
    (name "python2-cairo")
    (version "1.19.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python2-cairo.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "python bindings for the cairo graphics library")
    (description "Python bindings for the cairo graphics library.")
    (home-page "https://pycairo.readthedocs.io/en/latest/")
    (license license:lgpl2.1+)))

(define-public libobjfwrt
  (package
    (name "libobjfwrt")
    (version "1.4.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/libobjfwrt.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "objFW Objective-C runtime library")
    (description "ObjFW Objective-C runtime library.")
    (home-page "https://objfw.nil.im/")
    (license license:lgpl3+)))

(define-public libxc
  (package
    (name "libxc")
    (version "7.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/libxc.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a library of exchange-correlation functionals for density-functional theory")
    (description "A library of exchange-correlation functionals for density-functional theory.")
    (home-page "https://libxc.gitlab.io")
    (license license:mpl2.0)))

(define-public libdockapp
  (package
    (name "libdockapp")
    (version "0.7.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/libdockapp.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "library that provides a framework for developing dockapps")
    (description "Library that provides a framework for developing dockapps.")
    (home-page "http://www.dockapps.net/libdockapp")
    (license license:gpl3+)))

(define-public libayatana-common
  (package
    (name "libayatana-common")
    (version "0.9.11")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/AyatanaIndicators/libayatana-common")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "ayatana System Indicators' common API functions")
    (description "Ayatana System Indicators' common API functions.")
    (home-page "https://github.com/AyatanaIndicators/libayatana-common")
    (license license:gpl3+)))

(define-public solarus
  (package
    (name "solarus")
    (version "2.0.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/solarus.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a lightweight, free and open-source 2D game engine for Action-RPGs")
    (description "A lightweight, free and open-source 2D game engine for Action-RPGs.")
    (home-page "https://www.solarus-games.org/")
    (license license:gpl3+)))

(define-public freedict-tools
  (package
    (name "freedict-tools")
    (version "1:0.7.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/freedict-tools.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "tools to compile the FreeDict dictionaries")
    (description "Tools to compile the FreeDict dictionaries.")
    (home-page "https://freedict.org/")
    (license license:agpl3+)))

(define-public netsurf-buildsystem-git
  (package
    (name "netsurf-buildsystem-git")
    (version "1.9.r1.g1fbac2b")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/netsurf-buildsystem-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the Netsurf buildsystem")
    (description "The Netsurf buildsystem.")
    (home-page "http://source.netsurf-browser.org/buildsystem.git/")
    (license license:expat)))

(define-public trousers
  (package
    (name "trousers")
    (version "0.3.15")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/trousers.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "open-source TCG Software Stack implementation for use with a TPM")
    (description "Open-source TCG Software Stack implementation for use with a TPM.")
    (home-page "https://sourceforge.net/projects/trousers")
    (license license:non-copyleft)))

(define-public oracle-instantclient-basic
  (package
    (name "oracle-instantclient-basic")
    (version "23.7.0.25.01")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/oracle-instantclient-basic.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "light replacement for the Oracle client (files to run OCI, OCCI and JDBC-OC..")
    (description "Light replacement for the Oracle client (files to run OCI, OCCI and JDBC-OCI programs).")
    (home-page "https://www.oracle.com/at/database/technologies/instant-client/downloads.html")
    (license license:non-copyleft)))

(define-public mingw-w64-zstd
  (package
    (name "mingw-w64-zstd")
    (version "1.5.7")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mingw-w64-zstd.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "zstandard - Fast real-time compression algorithm (mingw-w64)")
    (description "Zstandard - Fast real-time compression algorithm (mingw-w64).")
    (home-page "https://facebook.github.io/zstd/")
    (license license:bsd-3)))

(define-public plasma-wayland-protocols-git
  (package
    (name "plasma-wayland-protocols-git")
    (version "1.11.1.r6.gb3c1826")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/plasma-wayland-protocols-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "plasma Specific Protocols for Wayland (git build)")
    (description "Plasma Specific Protocols for Wayland (git build).")
    (home-page "https://invent.kde.org/libraries/plasma-wayland-protocols")
    (license license:bsd-3)))

(define-public protoc-gen-go-grpc
  (package
    (name "protoc-gen-go-grpc")
    (version "1:1.6.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/grpc/grpc-go")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/grpc/grpc-go"
           #:tests? #f))
    (synopsis "gRPC bindings generator for Go language")
    (description "GRPC bindings generator for Go language.")
    (home-page "https://github.com/grpc/grpc-go")
    (license license:asl2.0)))

(define-public nginx-unitd
  (package
    (name "nginx-unitd")
    (version "1.31.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/nginx-unitd.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "nginx-unitd"
           #:tests? #f))
    (synopsis "lightweight, dynamic, open-source server for diverse web applications")
    (description "Lightweight, dynamic, open-source server for diverse web applications.")
    (home-page "https://unit.nginx.org/")
    (license license:asl2.0)))

(define-public gnome-vfs
  (package
    (name "gnome-vfs")
    (version "2.24.4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gnome-vfs.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the GNOME Virtual File System")
    (description "The GNOME Virtual File System.")
    (home-page "https://developer.gnome.org/gnome-vfs/")
    (license license:lgpl3+)))

(define-public gstreamer0-10-base
  (package
    (name "gstreamer0.10-base")
    (version "0.10.36")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gstreamer0.10-base.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "gStreamer Multimedia Framework Base plugin libraries")
    (description "GStreamer Multimedia Framework Base plugin libraries.")
    (home-page "http://gstreamer.freedesktop.org/")
    (license license:lgpl3+)))

(define-public vmware-horizon-client
  (package
    (name "vmware-horizon-client")
    (version "2406")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/vmware-horizon-client.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "vMware Horizon Client connect to VMware Horizon virtual desktop")
    (description "VMware Horizon Client connect to VMware Horizon virtual desktop.")
    (home-page "https://customerconnect.omnissa.com/downloads/info/slug/desktop_end_user_computing/vmware_horizon_clients/horizon_8")
    (license license:non-copyleft)))

(define-public lib32-gimp
  (package
    (name "lib32-gimp")
    (version "2.10.36")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lib32-gimp.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "gNU Image Manipulation Program (32-bit)")
    (description "GNU Image Manipulation Program (32-bit).")
    (home-page "https://www.gimp.org/")
    (license license:gpl3+)))

(define-public electron22
  (package
    (name "electron22")
    (version "22.3.27")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/electron22.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (synopsis "build cross platform desktop apps with web technologies")
    (description "Build cross platform desktop apps with web technologies.")
    (home-page "https://electronjs.org")
    (license license:bsd-3)))

(define-public contemporary-icons
  (package
    (name "contemporary-icons")
    (version "1.11")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/contemporary-icons.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "contemporary Icons")
    (description "Contemporary Icons.")
    (home-page "https://vicr123.com/projects/contemporary/")
    (license license:non-copyleft)))

(define-public ttf-contemporary
  (package
    (name "ttf-contemporary")
    (version "2.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ttf-contemporary.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"))))
    (synopsis "contemporary Typeface")
    (description "Contemporary Typeface.")
    (home-page "http://vicr123.com/projects/contemporary")
    (license license:non-copyleft)))

(define-public enemy-territory-data
  (package
    (name "enemy-territory-data")
    (version "2.60b")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/enemy-territory-data.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "wolfenstein: Enemy Territory is a completely free, standalone, team-based, ..")
    (description "Wolfenstein: Enemy Territory is a completely free, standalone, team-based, multiplayer FPS (data).")
    (home-page "http://www.splashdamage.com/wolfet")
    (license license:non-copyleft)))

(define-public android-platform
  (package
    (name "android-platform")
    (version "37.0_r01")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/android-platform.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "android SDK Platform, latest API")
    (description "Android SDK Platform, latest API.")
    (home-page "http://developer.android.com/sdk/index.html")
    (license license:non-copyleft)))

(define-public automoc4
  (package
    (name "automoc4")
    (version "0.9.88")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/automoc4.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "automatic moc for Qt4")
    (description "Automatic moc for Qt4.")
    (home-page "http://www.kde.org/")
    (license license:non-copyleft)))

(define-public libucd-git
  (package
    (name "libucd-git")
    (version "r110.6e122a1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/yhfudev/cpp-libucd")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "universal Charset Detector C/C++ API")
    (description "Universal Charset Detector C/C++ API.")
    (home-page "https://github.com/yhfudev/cpp-libucd.git")
    (license license:gpl3+)))

(define-public ocaml-menhir
  (package
    (name "ocaml-menhir")
    (version "20260209")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ocaml-menhir.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "menhir is a LR(1) parser generator for the OCaml")
    (description "Menhir is a LR(1) parser generator for the OCaml.")
    (home-page "http://cristal.inria.fr/~fpottier/menhir/")
    (license license:gpl2+)))

(define-public ignition-cmake
  (package
    (name "ignition-cmake")
    (version "3.4.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ignition-cmake.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a set of CMake modules that are used by the C++-based Gazebo projects")
    (description "A set of CMake modules that are used by the C++-based Gazebo projects.")
    (home-page "https://gazebosim.org/libs/cmake")
    (license license:asl2.0)))

(define-public contemporary-widgets
  (package
    (name "contemporary-widgets")
    (version "2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/theCheeseboard/contemporary-theme")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "contemporary Widget Theme")
    (description "Contemporary Widget Theme.")
    (home-page "https://github.com/theCheeseboard/contemporary-theme")
    (license license:gpl3+)))

(define-public scalapack
  (package
    (name "scalapack")
    (version "2.2.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/scalapack.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "subset of scalable LAPACK routines redesigned for distributed memory computers")
    (description "Subset of scalable LAPACK routines redesigned for distributed memory computers.")
    (home-page "http://www.netlib.org/scalapack")
    (license license:bsd-3)))

(define-public scangearmp-common
  (package
    (name "scangearmp-common")
    (version "2.30")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/scangearmp-common.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "canon IJ Scanner Driver (Common package)")
    (description "Canon IJ Scanner Driver (Common package).")
    (home-page "http://support-asia.canon-asia.com/contents/ASIA/EN/0100588302.html")
    (license license:non-copyleft)))

(define-public quassel-common-git
  (package
    (name "quassel-common-git")
    (version "0.14.0.r8.g020c1634")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/quassel-common-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "common files for Quassel")
    (description "Common files for Quassel.")
    (home-page "http://quassel-irc.org")
    (license license:gpl3+)))

(define-public python-qiskit
  (package
    (name "python-qiskit")
    (version "1:2.4.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Qiskit/qiskit")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "an open-source SDK for working with (IBM) quantum computers")
    (description "An open-source SDK for working with (IBM) quantum computers.")
    (home-page "https://github.com/Qiskit/qiskit")
    (license license:asl2.0)))

(define-public vcvrack
  (package
    (name "vcvrack")
    (version "2.6.6")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/vcvrack.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "open-source Eurorack modular synthesizer simulator")
    (description "Open-source Eurorack modular synthesizer simulator.")
    (home-page "https://vcvrack.com/")
    (license license:gpl3+)))

(define-public darling-core-git
  (package
    (name "darling-core-git")
    (version "r4302.c431326ef")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/darling-core-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "core components of Darling")
    (description "Core components of Darling.")
    (home-page "https://www.darlinghq.org")
    (license license:gpl3+)))

(define-public brltty-git
  (package
    (name "brltty-git")
    (version "6.9.r81.g83dbe770e")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/brltty-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "braille display driver for Linux/Unix (development version)")
    (description "Braille display driver for Linux/Unix (development version).")
    (home-page "https://brltty.app")
    (license license:lgpl2.1+)))

(define-public php83-xml
  (package
    (name "php83-xml")
    (version "8.3.30")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/php83-xml.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "xml modules for php83")
    (description "Xml modules for php83.")
    (home-page "http://www.php.net")
    (license license:non-copyleft)))

(define-public plex-media-server
  (package
    (name "plex-media-server")
    (version "1.43.1.10611")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/plex-media-server.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the back-end media server component of Plex")
    (description "The back-end media server component of Plex.")
    (home-page "https://plex.tv/")
    (license license:non-copyleft)))

(define-public courier-unicode
  (package
    (name "courier-unicode")
    (version "2.5.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/courier-unicode.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "courier Unicode Library")
    (description "Courier Unicode Library.")
    (home-page "http://www.courier-mta.org/unicode/")
    (license license:gpl3+)))

(define-public db4-8
  (package
    (name "db4.8")
    (version "4.8.30")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/db4.8.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the Berkeley DB embedded database system 4.8")
    (description "The Berkeley DB embedded database system 4.8.")
    (home-page "http://www.oracle.com/technology/software/products/berkeley-db/index.html")
    (license license:non-copyleft)))

(define-public nvidia-340xx-utils
  (package
    (name "nvidia-340xx-utils")
    (version "340.108")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/nvidia-340xx-utils.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "nVIDIA drivers utilities")
    (description "NVIDIA drivers utilities.")
    (home-page "http://www.nvidia.com/")
    (license license:non-copyleft)))

(define-public r-xfun
  (package
    (name "r-xfun")
    (version "0.56")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/r-xfun.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "supporting Functions for Packages Maintained by 'Yihui Xie'")
    (description "Supporting Functions for Packages Maintained by 'Yihui Xie'.")
    (home-page "https://cran.r-project.org/package=xfun")
    (license license:expat)))

(define-public r-yaml
  (package
    (name "r-yaml")
    (version "2.3.12")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/r-yaml.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "methods to Convert R Data to YAML and Back")
    (description "Methods to Convert R Data to YAML and Back.")
    (home-page "https://cran.r-project.org/package=yaml")
    (license license:bsd-3)))

(define-public aften
  (package
    (name "aften")
    (version "0.0.8")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/aften.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "audio encoder which generates compressed audio streams based on ATSC A/52 s..")
    (description "Audio encoder which generates compressed audio streams based on ATSC A/52 specification.")
    (home-page "http://aften.sourceforge.net")
    (license license:gpl3+)))

(define-public r-curl
  (package
    (name "r-curl")
    (version "7.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/r-curl.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a Modern and Flexible Web Client for R")
    (description "A Modern and Flexible Web Client for R.")
    (home-page "https://cran.r-project.org/package=curl")
    (license license:expat)))

(define-public uget-integrator
  (package
    (name "uget-integrator")
    (version "1.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ugetdm/uget-integrator")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "integrate uGet Download Manager with Google Chrome, Chromium, Vivaldi, Oper..")
    (description "Integrate uGet Download Manager with Google Chrome, Chromium, Vivaldi, Opera and Firefox.")
    (home-page "https://github.com/ugetdm/uget-integrator")
    (license license:gpl3+)))

(define-public vapoursynth-plugin-fmtconv-git
  (package
    (name "vapoursynth-plugin-fmtconv-git")
    (version "30.29.gf2d8f82")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/vapoursynth-plugin-fmtconv-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "plugin for Vapoursynth: fmtconv (GIT version)")
    (description "Plugin for Vapoursynth: fmtconv (GIT version).")
    (home-page "https://forum.doom9.org/showthread.php?t=166504")
    (license license:non-copyleft)))

(define-public htslib
  (package
    (name "htslib")
    (version "1.23.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/samtools/htslib")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a C library for high-throughput sequencing data formats")
    (description "A C library for high-throughput sequencing data formats.")
    (home-page "https://github.com/samtools/htslib")
    (license license:expat)))

(define-public python-efl
  (package
    (name "python-efl")
    (version "1.26.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-efl.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "python bindings for the Enlightenment Foundation Libraries")
    (description "Python bindings for the Enlightenment Foundation Libraries.")
    (home-page "http://www.enlightenment.org")
    (license license:gpl3+)))

(define-public qtws-base
  (package
    (name "qtws-base")
    (version "0.92")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/intersimone999/qtws")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "standalone web-app container based on qt5-webengine")
    (description "Standalone web-app container based on qt5-webengine.")
    (home-page "https://github.com/intersimone999/qtws")
    (license license:gpl3+)))

(define-public tclkit
  (package
    (name "tclkit")
    (version "8.6.14")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/stiefel40k/kitgen")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "single-file executable that provides a complete Tcl and Tk runtime")
    (description "Single-file executable that provides a complete Tcl and Tk runtime.")
    (home-page "https://github.com/stiefel40k/kitgen")
    (license license:non-copyleft)))

(define-public lib32-minizip
  (package
    (name "lib32-minizip")
    (version "1.3.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lib32-minizip.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "zIP file extraction library (32-bit)")
    (description "ZIP file extraction library (32-bit).")
    (home-page "http://www.winimage.com/zLibDll/minizip.html")
    (license license:non-copyleft)))

(define-public bacula-common
  (package
    (name "bacula-common")
    (version "15.0.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/bacula-common.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "bacula - A Network Backup Tool (common files)")
    (description "Bacula - A Network Backup Tool (common files).")
    (home-page "https://www.bacula.org")
    (license license:agpl3+)))

(define-public python-portalocker
  (package
    (name "python-portalocker")
    (version "3.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/WoLpH/portalocker")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "easy, portable file locking API")
    (description "Easy, portable file locking API.")
    (home-page "https://github.com/WoLpH/portalocker")
    (license license:bsd-3)))

(define-public libim
  (package
    (name "libim")
    (version "3.15")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/libim.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "imaging toolkit library")
    (description "Imaging toolkit library.")
    (home-page "https://www.tecgraf.puc-rio.br/im/")
    (license license:expat)))

(define-public vala-panel
  (package
    (name "vala-panel")
    (version "24.05")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.com/vala-panel-project/vala-panel")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "panel for compositing window managers")
    (description "Panel for compositing window managers.")
    (home-page "https://gitlab.com/vala-panel-project/vala-panel")
    (license license:lgpl3+)))

(define-public eccodes
  (package
    (name "eccodes")
    (version "2.46.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/eccodes.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "eCMWF decoding library for GRIB, BUFR and GTS")
    (description "ECMWF decoding library for GRIB, BUFR and GTS.")
    (home-page "https://confluence.ecmwf.int/display/ECC/ecCodes+Home")
    (license license:asl2.0)))

(define-public compiz-core-git
  (package
    (name "compiz-core-git")
    (version "0.8.18.r23.gfe274c9")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.com/compiz/compiz-core")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "compositing manager without desktop-environment depends (Core w/o decorator)")
    (description "Compositing manager without desktop-environment depends (Core w/o decorator).")
    (home-page "https://gitlab.com/compiz/compiz-core")
    (license license:gpl2+)))

(define-public java8-openjfx
  (package
    (name "java8-openjfx")
    (version "8.u202")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/java8-openjfx.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "java OpenJFX 8 client application platform (open-source implementation of J..")
    (description "Java OpenJFX 8 client application platform (open-source implementation of JavaFX).")
    (home-page "https://wiki.openjdk.java.net/display/OpenJFX/Main")
    (license license:gpl3+)))

(define-public php83-pdo
  (package
    (name "php83-pdo")
    (version "8.3.30")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/php83-pdo.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "pdo module for php83")
    (description "Pdo module for php83.")
    (home-page "http://www.php.net")
    (license license:non-copyleft)))

(define-public dcaenc
  (package
    (name "dcaenc")
    (version "3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.com/patrakov/dcaenc")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "an open-source implementation of the DTS Coherent Acoustics lossy audio codec")
    (description "An open-source implementation of the DTS Coherent Acoustics lossy audio codec.")
    (home-page "https://gitlab.com/patrakov/dcaenc")
    (license license:lgpl3+)))

(define-public libbass
  (package
    (name "libbass")
    (version "2.4.18.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/libbass.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "bASS audio library")
    (description "BASS audio library.")
    (home-page "https://www.un4seen.com/")
    (license license:non-copyleft)))
