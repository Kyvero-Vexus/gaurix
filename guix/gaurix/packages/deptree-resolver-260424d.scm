;;; deptree-resolver-260424d.scm — Dependency-tree priority resolver pass
;;; 70 packages resolved, 30 blocked
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Use `guix download` or `guix hash` to obtain real hashes.

(define-module (gaurix packages deptree-resolver-260424d)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system ant)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system perl)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system r)
  #:use-module ((guix licenses) #:prefix license:)
  #:export (
            ace
            aegir-provision
            beagle-lib
            boost-python2-libs
            ca-certificates-cacert
            ccrtp
            ccsh-git
            cling-git
            coin-or-ipopt
            dawn
            fann
            fishui-git
            flutter
            frobby
            gcc11
            gcc12
            glslang-git
            gnome-icon-theme-symbolic
            i3lock-color
            ignition-msgs
            jameica
            libclut
            libcommuni
            libcprime-git
            libcutefish-git
            libcxml
            libffi6
            libgda
            libnetctlgui
            libqglviewer-qt5
            libsodium-static
            llvm19-libs
            lua-cd
            lua51-cd
            lua51-lsqlite3
            lua52-cd
            lua53-cd
            ocamlfuse
            oorexx
            osl
            pam-selinux
            perl-uuid
            php56-cli
            pure-avahi
            pure-lilv
            python-arabic-reshaper
            python-jax
            python-matrix-nio
            python-mbstrdecoder
            python-music-tag
            python-posix_ipc
            python-rasterio
            python-ratelimit
            python-rosinstall_generator
            python-sphinxcontrib-httpdomain
            python-terminaltables3
            python-token-bucket
            r-r-oo
            selinux-python
            semodule-utils
            sh-elf-gcc-casio
            soci
            steamcmd
            tpm-tools
            ttfautohint
            vapoursynth-plugin-mvsfunc-git
            wxparaver
            xbae
            xcftools
            xlibre-xserver-common-beta
            ))

(define-public steamcmd
  (package
    (name "steamcmd")
    (version "latest")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://developer.valvesoftware.com/wiki/SteamCMD/releases/download/v" version "/steamcmd-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "steam Command Line Tools")
    (description "Steam Command Line Tools.")
    (home-page "http://developer.valvesoftware.com/wiki/SteamCMD")
    (license license:non-copyleft)))

(define-public pam-selinux
  (package
    (name "pam-selinux")
    (version "1.7.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://linux-pam.org/releases/download/v" version "/pam-selinux-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "sELinux aware PAM (Pluggable Authentication Modules) library")
    (description "SELinux aware PAM (Pluggable Authentication Modules) library.")
    (home-page "http://linux-pam.org")
    (license license:gpl2)))

(define-public coin-or-ipopt
  (package
    (name "coin-or-ipopt")
    (version "3.14.19")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/coin-or/Ipopt/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "interior Point OPTimizer")
    (description "Interior Point OPTimizer.")
    (home-page "https://github.com/coin-or/Ipopt")
    (license license:non-copyleft)))

(define-public vapoursynth-plugin-mvsfunc-git
  (package
    (name "vapoursynth-plugin-mvsfunc-git")
    (version "11.r86.865c748")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://forum.doom9.org/showthread.php?t=172564/releases/download/v" version "/vapoursynth-plugin-mvsfunc-git-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "plugin for Vapoursynth: mvsfunc (GIT version)")
    (description "Plugin for Vapoursynth: mvsfunc (GIT version).")
    (home-page "http://forum.doom9.org/showthread.php?t=172564")
    (license license:gpl3+)))

(define-public python-rasterio
  (package
    (name "python-rasterio")
    (version "1.5.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/rasterio/rasterio/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "fast and direct raster I/O for use with NumPy")
    (description "Fast and direct raster I/O for use with NumPy.")
    (home-page "https://github.com/rasterio/rasterio")
    (license license:bsd-3)))

(define-public beagle-lib
  (package
    (name "beagle-lib")
    (version "4.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/beagle-dev/beagle-lib/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "general purpose library for evaluating the likelihood of sequence evolution o...")
    (description "General purpose library for evaluating the likelihood of sequence evolution on trees.")
    (home-page "https://github.com/beagle-dev/beagle-lib")
    (license license:gpl3)))

(define-public python-jax
  (package
    (name "python-jax")
    (version "0.9.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/jax-ml/jax/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "composable transformations of Python+NumPy programs")
    (description "Composable transformations of Python+NumPy programs.")
    (home-page "https://github.com/jax-ml/jax/")
    (license license:asl2.0)))

(define-public gcc12
  (package
    (name "gcc12")
    (version "12.5.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://gcc.gnu.org/releases/download/v" version "/gcc12-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the GNU Compiler Collection - C and C++ frontends (12.x.x)")
    (description "The GNU Compiler Collection - C and C++ frontends (12.x.x).")
    (home-page "https://gcc.gnu.org")
    (license (list license:non-copyleft license:gpl3 license:lgpl3+))))

(define-public libgda
  (package
    (name "libgda")
    (version "5.2.10")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.gnome-db.org//releases/download/v" version "/libgda-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system ant-build-system)
    (arguments (list #:tests? #f))
    (synopsis "database access library")
    (description "Database access library.")
    (home-page "https://www.gnome-db.org/")
    (license license:gpl3+)))

(define-public fishui-git
  (package
    (name "fishui-git")
    (version "0.8.r0.gc88702a")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                (url "https://github.com/cutefishos/fishui")
                (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "gUI library based on QQC2 for Cutefish applications")
    (description "GUI library based on QQC2 for Cutefish applications.")
    (home-page "https://github.com/cutefishos/fishui")
    (license license:gpl3+)))

(define-public i3lock-color
  (package
    (name "i3lock-color")
    (version "2.13.c.5")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/Raymo111/i3lock-color/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the world's most popular non-default computer lockscreen")
    (description "The world's most popular non-default computer lockscreen.")
    (home-page "https://github.com/Raymo111/i3lock-color")
    (license license:expat)))

(define-public flutter
  (package
    (name "flutter")
    (version "3.41.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://flutter.dev/releases/download/v" version "/flutter-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "flutter SDK component - full installation of development tool and runtime")
    (description "Flutter SDK component - full installation of development tool and runtime.")
    (home-page "https://flutter.dev")
    (license (list license:bsd-3 license:non-copyleft))))

(define-public libcutefish-git
  (package
    (name "libcutefish-git")
    (version "0.7.r0.g7a1f2fa")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                (url "https://github.com/cutefishos/libcutefish")
                (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "system library for Cutefish applications")
    (description "System library for Cutefish applications.")
    (home-page "https://github.com/cutefishos/libcutefish")
    (license license:gpl3+)))

(define-public lua-cd
  (package
    (name "lua-cd")
    (version "5.14")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.tecgraf.puc-rio.br/cd//releases/download/v" version "/lua-cd-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "lua (5.4) bindings for Canvas Draw library")
    (description "Lua (5.4) bindings for Canvas Draw library.")
    (home-page "https://www.tecgraf.puc-rio.br/cd/")
    (license license:expat)))

(define-public lua51-cd
  (package
    (name "lua51-cd")
    (version "5.14")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.tecgraf.puc-rio.br/cd//releases/download/v" version "/lua51-cd-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "lua (5.1) bindings for Canvas Draw library")
    (description "Lua (5.1) bindings for Canvas Draw library.")
    (home-page "https://www.tecgraf.puc-rio.br/cd/")
    (license license:expat)))

(define-public lua52-cd
  (package
    (name "lua52-cd")
    (version "5.14")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.tecgraf.puc-rio.br/cd//releases/download/v" version "/lua52-cd-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "lua (5.2) bindings for Canvas Draw library")
    (description "Lua (5.2) bindings for Canvas Draw library.")
    (home-page "https://www.tecgraf.puc-rio.br/cd/")
    (license license:expat)))

(define-public lua53-cd
  (package
    (name "lua53-cd")
    (version "5.14")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.tecgraf.puc-rio.br/cd//releases/download/v" version "/lua53-cd-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "lua (5.3) bindings for Canvas Draw library")
    (description "Lua (5.3) bindings for Canvas Draw library.")
    (home-page "https://www.tecgraf.puc-rio.br/cd/")
    (license license:expat)))

(define-public llvm19-libs
  (package
    (name "llvm19-libs")
    (version "19.1.7")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://llvm.org//releases/download/v" version "/llvm19-libs-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "lLVM 19 runtime libraries")
    (description "LLVM 19 runtime libraries.")
    (home-page "https://llvm.org/")
    (license license:non-copyleft)))

(define-public python-matrix-nio
  (package
    (name "python-matrix-nio")
    (version "0.25.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/matrix-nio/matrix-nio/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "python Matrix client library, designed according to sans I/O principles")
    (description "Python Matrix client library, designed according to sans I/O principles.")
    (home-page "https://github.com/matrix-nio/matrix-nio")
    (license license:isc)))

(define-public xlibre-xserver-common-beta
  (package
    (name "xlibre-xserver-common-beta")
    (version "25.1.4")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/X11Libre/xserver/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "xLibre fork of X.Org Xorg server common files")
    (description "XLibre fork of X.Org Xorg server common files.")
    (home-page "https://github.com/X11Libre/xserver")
    (license (list license:bsd-3 license:non-copyleft license:isc license:expat))))

(define-public oorexx
  (package
    (name "oorexx")
    (version "5.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://sourceforge.net/projects/oorexx//releases/download/v" version "/oorexx-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "open source implementation of Object Rexx")
    (description "Open source implementation of Object Rexx.")
    (home-page "https://sourceforge.net/projects/oorexx/")
    (license license:non-copyleft)))

(define-public xcftools
  (package
    (name "xcftools")
    (version "1.0.7")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://henning.makholm.net/software/releases/download/v" version "/xcftools-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "command line tools for use with the open XCF image format (includes xcf2png)")
    (description "Command line tools for use with the open XCF image format (includes xcf2png).")
    (home-page "http://henning.makholm.net/software")
    (license license:non-copyleft)))

(define-public ccsh-git
  (package
    (name "ccsh-git")
    (version "r154.7c8b4cd")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                (url "https://github.com/cpp-ftw/ccsh")
                (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "c++ shell")
    (description "C++ shell.")
    (home-page "https://github.com/cpp-ftw/ccsh")
    (license license:gpl3)))

(define-public lua51-lsqlite3
  (package
    (name "lua51-lsqlite3")
    (version "0.9.6")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://lua.sqlite.org/releases/download/v" version "/lua51-lsqlite3-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a binding for Lua to the SQLite3 database library")
    (description "A binding for Lua to the SQLite3 database library.")
    (home-page "http://lua.sqlite.org")
    (license license:expat)))

(define-public python-rosinstall_generator
  (package
    (name "python-rosinstall_generator")
    (version "0.1.23")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/ros-infrastructure/rosinstall_generator/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a tool for generating rosinstall files")
    (description "A tool for generating rosinstall files.")
    (home-page "https://github.com/ros-infrastructure/rosinstall_generator")
    (license license:bsd-3)))

(define-public selinux-python
  (package
    (name "selinux-python")
    (version "3.10")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/SELinuxProject/selinux/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "sELinux python tools and libraries")
    (description "SELinux python tools and libraries.")
    (home-page "https://github.com/SELinuxProject/selinux/wiki")
    (license license:gpl2)))

(define-public soci
  (package
    (name "soci")
    (version "4.1.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/SOCI/soci/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "c++ database access library")
    (description "C++ database access library.")
    (home-page "https://github.com/SOCI/soci")
    (license license:boost1.0)))

(define-public boost-python2-libs
  (package
    (name "boost-python2-libs")
    (version "1.83.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.boost.org//releases/download/v" version "/boost-python2-libs-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "free peer-reviewed portable C++ source libraries - runtime libraries")
    (description "Free peer-reviewed portable C++ source libraries - runtime libraries.")
    (home-page "https://www.boost.org/")
    (license license:non-copyleft)))

(define-public ignition-msgs
  (package
    (name "ignition-msgs")
    (version "10.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://gazebosim.org/libs/msgs/releases/download/v" version "/ignition-msgs-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "messages for Gazebo robot simulation")
    (description "Messages for Gazebo robot simulation.")
    (home-page "https://gazebosim.org/libs/msgs")
    (license license:asl2.0)))

(define-public php56-cli
  (package
    (name "php56-cli")
    (version "5.6.40")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://www.php.net/releases/download/v" version "/php56-cli-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "cli (command-line executable) version for php56")
    (description "Cli (command-line executable) version for php56.")
    (home-page "http://www.php.net")
    (license license:non-copyleft)))

(define-public libclut
  (package
    (name "libclut")
    (version "1.2.3")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://codeberg.org/maandree/libclut/releases/download/v" version "/libclut-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "c library for manipulating colour lookup tables")
    (description "C library for manipulating colour lookup tables.")
    (home-page "https://codeberg.org/maandree/libclut")
    (license license:non-copyleft)))

(define-public libsodium-static
  (package
    (name "libsodium-static")
    (version "1.0.21")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/jedisct1/libsodium/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "p(ortable|ackageable) NaCl-based crypto library (static library)")
    (description "P(ortable|ackageable) NaCl-based crypto library (static library).")
    (home-page "https://github.com/jedisct1/libsodium")
    (license license:non-copyleft)))

(define-public aegir-provision
  (package
    (name "aegir-provision")
    (version "7.x_3.10")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://aegirproject.org/releases/download/v" version "/aegir-provision-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "mass Drupal hosting system - backend")
    (description "Mass Drupal hosting system - backend.")
    (home-page "http://aegirproject.org")
    (license license:gpl3+)))

(define-public ca-certificates-cacert
  (package
    (name "ca-certificates-cacert")
    (version "20250125")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.cacert.org/index.php?id=3/releases/download/v" version "/ca-certificates-cacert-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "cAcert.org root certificates")
    (description "CAcert.org root certificates.")
    (home-page "https://www.cacert.org/index.php?id=3")
    (license license:non-copyleft)))

(define-public frobby
  (package
    (name "frobby")
    (version "0.9.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/Macaulay2/frobby/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "computations With Monomial Ideals")
    (description "Computations With Monomial Ideals.")
    (home-page "https://github.com/Macaulay2/frobby")
    (license license:gpl3+)))

(define-public libffi6
  (package
    (name "libffi6")
    (version "3.2.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://sourceware.org/libffi/releases/download/v" version "/libffi6-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a portable, high level programming interface to various calling conventions (...")
    (description "A portable, high level programming interface to various calling conventions (ABI version 6).")
    (home-page "http://sourceware.org/libffi")
    (license license:expat)))

(define-public osl
  (package
    (name "osl")
    (version "0.9.7")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://icps.u-strasbg.fr/people/bastoul/public_html/development/openscop/index.html/releases/download/v" version "/osl-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "openScop Library")
    (description "OpenScop Library.")
    (home-page "http://icps.u-strasbg.fr/people/bastoul/public_html/development/openscop/index.html")
    (license license:bsd-3)))

(define-public r-r-oo
  (package
    (name "r-r.oo")
    (version "1.27.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://cran.r-project.org/src/contrib/r.oo_" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system r-build-system)
    (arguments (list #:tests? #f))
    (synopsis "r Object-Oriented Programming with or without References")
    (description "R Object-Oriented Programming with or without References.")
    (home-page "https://cran.r-project.org/package=R.oo")
    (license license:lgpl2.1+)))

(define-public semodule-utils
  (package
    (name "semodule-utils")
    (version "3.10")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/SELinuxProject/selinux/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "sELinux module tools")
    (description "SELinux module tools.")
    (home-page "https://github.com/SELinuxProject/selinux/wiki")
    (license license:gpl2)))

(define-public ccrtp
  (package
    (name "ccrtp")
    (version "2.1.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.gnu.org/software/ccrtp//releases/download/v" version "/ccrtp-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "an implementation of RTP, the real-time transport protocol from the IETF")
    (description "An implementation of RTP, the real-time transport protocol from the IETF.")
    (home-page "https://www.gnu.org/software/ccrtp/")
    (license (list license:non-copyleft license:gpl3+))))

(define-public fann
  (package
    (name "fann")
    (version "2.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://leenissen.dk/fann//releases/download/v" version "/fann-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "fast Artificial Neural Network Library")
    (description "Fast Artificial Neural Network Library.")
    (home-page "https://leenissen.dk/fann/")
    (license license:lgpl2.1+)))

(define-public libcommuni
  (package
    (name "libcommuni")
    (version "3.6.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://communi.github.io//releases/download/v" version "/libcommuni-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a cross-platform IRC framework written with Qt")
    (description "A cross-platform IRC framework written with Qt.")
    (home-page "https://communi.github.io/")
    (license license:bsd-3)))

(define-public pure-avahi
  (package
    (name "pure-avahi")
    (version "0.4")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://purelang.bitbucket.org//releases/download/v" version "/pure-avahi-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "an Avahi/Zeroconf interface for Pure")
    (description "An Avahi/Zeroconf interface for Pure.")
    (home-page "http://purelang.bitbucket.org/")
    (license license:lgpl3+)))

(define-public python-music-tag
  (package
    (name "python-music-tag")
    (version "0.4.3")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/KristoforMaynard/music-tag/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "simple interface to edit audio file metadata")
    (description "Simple interface to edit audio file metadata.")
    (home-page "https://github.com/KristoforMaynard/music-tag")
    (license license:expat)))

(define-public python-posix_ipc
  (package
    (name "python-posix_ipc")
    (version "1.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/osvenskan/posix_ipc/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "pOSIX IPC primitives (semaphores, shared memory and message queues) for Python")
    (description "POSIX IPC primitives (semaphores, shared memory and message queues) for Python.")
    (home-page "https://github.com/osvenskan/posix_ipc")
    (license license:bsd-3)))

(define-public python-ratelimit
  (package
    (name "python-ratelimit")
    (version "2.2.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/tomasbasham/ratelimit/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "aPI rate limit decorator")
    (description "API rate limit decorator.")
    (home-page "https://github.com/tomasbasham/ratelimit")
    (license license:expat)))

(define-public python-sphinxcontrib-httpdomain
  (package
    (name "python-sphinxcontrib-httpdomain")
    (version "1.8.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/sphinx-contrib/httpdomain/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "hTTP domain extension for sphinx")
    (description "HTTP domain extension for sphinx.")
    (home-page "https://github.com/sphinx-contrib/httpdomain")
    (license license:bsd-3)))

(define-public python-token-bucket
  (package
    (name "python-token-bucket")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/falconry/token-bucket/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "very fast implementation of the token bucket algorithm")
    (description "Very fast implementation of the token bucket algorithm.")
    (home-page "https://github.com/falconry/token-bucket")
    (license license:bsd-3)))

(define-public tpm-tools
  (package
    (name "tpm-tools")
    (version "1.3.9.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://sourceforge.net/projects/trousers/releases/download/v" version "/tpm-tools-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "tools to manage and diagnose a TPM")
    (description "Tools to manage and diagnose a TPM.")
    (home-page "https://sourceforge.net/projects/trousers")
    (license license:non-copyleft)))

(define-public ace
  (package
    (name "ace")
    (version "8.0.5")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.dre.vanderbilt.edu/~schmidt/ACE.html/releases/download/v" version "/ace-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "framework that provides many components and patterns for developing high-perf...")
    (description "Framework that provides many components and patterns for developing high-performance, distributed real-time and embedded systems.")
    (home-page "https://www.dre.vanderbilt.edu/~schmidt/ACE.html")
    (license license:non-copyleft)))

(define-public jameica
  (package
    (name "jameica")
    (version "2.12.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.willuhn.de/products/jameica//releases/download/v" version "/jameica-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system ant-build-system)
    (arguments (list #:tests? #f))
    (synopsis "free runtime environment for java applications")
    (description "Free runtime environment for java applications.")
    (home-page "https://www.willuhn.de/products/jameica/")
    (license license:gpl2)))

(define-public libcprime-git
  (package
    (name "libcprime-git")
    (version "4.5.0.r2.gbc990a2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://gitlab.com/cubocore/libcprime/-/archive/v" version "/" (basename "cubocore/libcprime") "-v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a library for bookmarking, saving recent activites, managing settings of C-Suite")
    (description "A library for bookmarking, saving recent activites, managing settings of C-Suite.")
    (home-page "https://gitlab.com/cubocore/libcprime")
    (license license:gpl3)))

(define-public perl-uuid
  (package
    (name "perl-uuid")
    (version "0.37")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://cpan.metacpan.org/authors/id/.../uuid-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system perl-build-system)
    (arguments (list #:tests? #f))
    (synopsis "universally Unique Identifier library for Perl")
    (description "Universally Unique Identifier library for Perl.")
    (home-page "https://metacpan.org/release/UUID")
    (license license:artistic2.0)))

(define-public pure-lilv
  (package
    (name "pure-lilv")
    (version "0.5")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://purelang.bitbucket.org//releases/download/v" version "/pure-lilv-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "lV2 plugin host interface for Pure (lilv bindings)")
    (description "LV2 plugin host interface for Pure (lilv bindings).")
    (home-page "http://purelang.bitbucket.org/")
    (license license:bsd-3)))

(define-public xbae
  (package
    (name "xbae")
    (version "4.60.4")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://xbae.sourceforge.net//releases/download/v" version "/xbae-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a Motif widget set containing the XbaeMatrix, XbaeCaption, and XbaeInput exte...")
    (description "A Motif widget set containing the XbaeMatrix, XbaeCaption, and XbaeInput extensions.")
    (home-page "http://xbae.sourceforge.net/")
    (license license:expat)))

(define-public python-mbstrdecoder
  (package
    (name "python-mbstrdecoder")
    (version "1.1.4")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/thombashi/mbstrdecoder/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "multi-byte character string decoder")
    (description "Multi-byte character string decoder.")
    (home-page "https://github.com/thombashi/mbstrdecoder")
    (license license:expat)))

(define-public python-terminaltables3
  (package
    (name "python-terminaltables3")
    (version "4.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/matthewdeanmartin/terminaltables3/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "easily draw tables in terminal/console applications from a list of lists of s...")
    (description "Easily draw tables in terminal/console applications from a list of lists of strings.")
    (home-page "https://github.com/matthewdeanmartin/terminaltables3")
    (license license:expat)))

(define-public dawn
  (package
    (name "dawn")
    (version "3.91a")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://geant4.kek.jp/~tanaka/DAWN/About_DAWN.html/releases/download/v" version "/dawn-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "3D geometrical postscript renderer")
    (description "3D geometrical postscript renderer.")
    (home-page "http://geant4.kek.jp/~tanaka/DAWN/About_DAWN.html")
    (license license:non-copyleft)))

(define-public glslang-git
  (package
    (name "glslang-git")
    (version "13.0.0.r15.g323836e4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                (url "https://github.com/KhronosGroup/glslang")
                (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "openGL and OpenGL ES shader front end and validator, git version")
    (description "OpenGL and OpenGL ES shader front end and validator, git version.")
    (home-page "https://github.com/KhronosGroup/glslang")
    (license license:bsd-3)))

(define-public gnome-icon-theme-symbolic
  (package
    (name "gnome-icon-theme-symbolic")
    (version "3.12.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://www.gnome.org/releases/download/v" version "/gnome-icon-theme-symbolic-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "gNOME icon theme, symbolic icons")
    (description "GNOME icon theme, symbolic icons.")
    (home-page "http://www.gnome.org")
    (license license:gpl3+)))

(define-public ocamlfuse
  (package
    (name "ocamlfuse")
    (version "2.7.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/astrada/ocamlfuse/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "an ocaml binding for fuse")
    (description "An ocaml binding for fuse.")
    (home-page "https://github.com/astrada/ocamlfuse/")
    (license license:gpl2)))

(define-public python-arabic-reshaper
  (package
    (name "python-arabic-reshaper")
    (version "3.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/mpcabd/python-arabic-reshaper/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "reconstruct Arabic sentences to be used in applications that do not support A...")
    (description "Reconstruct Arabic sentences to be used in applications that do not support Arabic.")
    (home-page "https://github.com/mpcabd/python-arabic-reshaper")
    (license license:expat)))

(define-public sh-elf-gcc-casio
  (package
    (name "sh-elf-gcc-casio")
    (version "11.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://gcc.gnu.org/releases/download/v" version "/sh-elf-gcc-casio-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the GNU Compiler Collection for the Casio calculators SuperH processors")
    (description "The GNU Compiler Collection for the Casio calculators SuperH processors.")
    (home-page "http://gcc.gnu.org")
    (license (list license:gpl3+ license:lgpl3+))))

(define-public ttfautohint
  (package
    (name "ttfautohint")
    (version "1.8.4")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://www.freetype.org/ttfautohint/releases/download/v" version "/ttfautohint-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "provides automated hinting process for web fonts")
    (description "Provides automated hinting process for web fonts.")
    (home-page "http://www.freetype.org/ttfautohint")
    (license (list license:non-copyleft license:gpl2))))

(define-public wxparaver
  (package
    (name "wxparaver")
    (version "4.12.0.20241204")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.bsc.es/discover-bsc/organisation/scientific-structure/performance-tools/releases/download/v" version "/wxparaver-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "expressive powerful and flexible trace visualizer for post-mortem trace analy...")
    (description "Expressive powerful and flexible trace visualizer for post-mortem trace analysis (from BSC).")
    (home-page "https://www.bsc.es/discover-bsc/organisation/scientific-structure/performance-tools")
    (license license:lgpl2.1+)))

(define-public cling-git
  (package
    (name "cling-git")
    (version "r5123.45318c5a")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://root.cern.ch/cling/releases/download/v" version "/cling-git-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "interactive C++ interpreter built on the top of LLVM and Clang libraries")
    (description "Interactive C++ interpreter built on the top of LLVM and Clang libraries.")
    (home-page "https://root.cern.ch/cling")
    (license license:non-copyleft)))

(define-public gcc11
  (package
    (name "gcc11")
    (version "11.5.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://gcc.gnu.org/releases/download/v" version "/gcc11-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the GNU Compiler Collection - C and C++ frontends (11.x.x)")
    (description "The GNU Compiler Collection - C and C++ frontends (11.x.x).")
    (home-page "https://gcc.gnu.org")
    (license (list license:non-copyleft license:gpl3+ license:lgpl3+))))

(define-public libcxml
  (package
    (name "libcxml")
    (version "0.17.15")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://carlh.net/libcxml/releases/download/v" version "/libcxml-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a small C++ library which makes it marginally neater to parse XML using libxml++")
    (description "A small C++ library which makes it marginally neater to parse XML using libxml++.")
    (home-page "https://carlh.net/libcxml")
    (license license:gpl3+)))

(define-public libnetctlgui
  (package
    (name "libnetctlgui")
    (version "1.4.9")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://arcanis.me/projects/netctl-gui/releases/download/v" version "/libnetctlgui-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "qt5 library which interacts with netctl. A part of netctl-gui")
    (description "Qt5 library which interacts with netctl. A part of netctl-gui.")
    (home-page "https://arcanis.me/projects/netctl-gui")
    (license license:gpl3)))

(define-public libqglviewer-qt5
  (package
    (name "libqglviewer-qt5")
    (version "2.9.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/GillesDebunne/libQGLViewer/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "c++ library based on Qt that eases the creation of OpenGL 3D viewers, qt5 ver...")
    (description "C++ library based on Qt that eases the creation of OpenGL 3D viewers, qt5 version.")
    (home-page "https://github.com/GillesDebunne/libQGLViewer")
    (license (list license:gpl2 license:gpl3 license:non-copyleft))))
