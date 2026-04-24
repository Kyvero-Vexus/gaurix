;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Dep-tree resolver pass --- deptree-resolver-260424v
;;; Resolves 86 BLOCKED packages via dependency-tree priority.
;;;
;;; New recipes (5): perl-math-clipper, python-soundcard,
;;;   plasma6-applets-panon, shadow-selinux, esp8266-rtos-sdk
;;; (python-soundcard is a new dependency package)
;;; Already in Guix: 1 (reduce-common -> reduce in (gnu packages algebra))
;;; Remaining BLOCKED: 81 packages (see blocked-notes)

(define-module (gaurix packages deptree-resolver-260424v)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix build-system perl)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system copy)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages admin)
  #:use-module (gnu packages audio)
  #:use-module (gnu packages check)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages kde-frameworks)
  #:use-module (gnu packages kde-plasma)
  #:use-module (gnu packages ncurses)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages perl-check)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-crypto)
  #:use-module (gnu packages python-science)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages selinux)
  #:use-module (gnu packages serialization)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages web)
  #:export (perl-math-clipper
            python-soundcard
            plasma6-applets-panon
            shadow-selinux
            esp8266-rtos-sdk))


;;; ---- 1. perl-math-clipper ----
;;; AUR #22584 -- Polygon clipping in 2D using the Clipper library.
;;; Source: CPAN (Math-Clipper-1.29)
;;; License: GPL / Artistic (Perl)
;;; All dependencies already in Guix: perl-extutils-typemaps-default,
;;;   perl-extutils-xspp, perl-module-build, perl-module-build-withxspp,
;;;   perl-test-deep.
;;; Hash verified via guix download.

(define-public perl-math-clipper
  (package
    (name "perl-math-clipper")
    (version "1.29")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "mirror://cpan/authors/id/S/SH/SHELDRAKE/Math-Clipper-"
             version ".tar.gz"))
       (sha256
        (base32 "14vmz1x8hwnlk239dcsh0n39kd7cd7v5g1iikgbyjvc66gqw89sk"))))
    (build-system perl-build-system)
    (native-inputs
     (list perl-extutils-cppguess
           perl-extutils-typemaps-default
           perl-extutils-xspp
           perl-module-build
           perl-module-build-withxspp
           perl-test-deep))
    (home-page "https://metacpan.org/release/Math-Clipper")
    (synopsis "Polygon clipping in 2D")
    (description
     "Math::Clipper is a Perl module that performs polygon clipping operations
(intersection, union, difference, xor) in two dimensions.  It wraps the
Clipper C++ library by Angus Johnson, providing fast boolean operations on
arbitrary polygons including those with holes.")
    (license license:perl-license)))


;;; ---- 2. python-soundcard ----
;;; Dependency package for plasma6-applets-panon.
;;; Pure-Python real-time audio library using PulseAudio/CoreAudio/WASAPI.
;;; Source: PyPI (soundcard-0.4.6)
;;; License: BSD-3-Clause
;;; Hash verified via guix download.

(define-public python-soundcard
  (package
    (name "python-soundcard")
    (version "0.4.6")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://files.pythonhosted.org/packages/source/s/soundcard/"
             "soundcard-" version ".tar.gz"))
       (sha256
        (base32 "0yzlij55jw9pqbky811lxk2rg7q6gk4qbhygigcdfz7r4r5dcilv"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))  ;; tests require audio hardware
    (propagated-inputs
     (list python-cffi python-numpy))
    (home-page "https://github.com/bastibe/SoundCard")
    (synopsis "Pure-Python real-time audio library")
    (description
     "SoundCard is a library for playing and recording audio without
resorting to a CPython extension.  Instead, it uses the foreign function
interface and the native audio libraries of Linux (PulseAudio), macOS
(Core Audio), and Windows (WASAPI) to play and record audio.")
    (license license:bsd-3)))


;;; ---- 3. plasma6-applets-panon ----
;;; AUR #17808 -- Audio visualizer applet for KDE Plasma 6.
;;; Source: https://github.com/flafflar/panon (v6.0.1)
;;; License: GPL-3.0-or-later
;;; Dependencies: plasma-workspace, python-docopt, python-numpy,
;;;   python-pyaudio, python-soundcard (new), python-websockets,
;;;   qtwebsockets, qtshadertools, kpackage.
;;; Hash verified via guix download.

(define-public plasma6-applets-panon
  (package
    (name "plasma6-applets-panon")
    (version "6.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/flafflar/panon/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0shicqmj6v3nrd2hwjb905mra5aijfv1k30cwjcyi509aknyw0h9"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f  ;; no test suite
           #:configure-flags
           #~(list (string-append "-DCMAKE_INSTALL_PREFIX=" #$output)
                   "-DKDE_INSTALL_USE_QT_SYS_PATHS=ON")
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'wrap-python
                 (lambda* (#:key inputs outputs #:allow-other-keys)
                   (let ((out (assoc-ref outputs "out"))
                         (python-path (getenv "GUIX_PYTHONPATH")))
                     (when python-path
                       (for-each
                        (lambda (script)
                          (wrap-program script
                            `("GUIX_PYTHONPATH" ":" prefix (,python-path))))
                        (find-files (string-append out "/share") "\\.py$")))))))))
    (native-inputs
     (list extra-cmake-modules pkg-config))
    (inputs
     (list plasma-workspace
           qtwebsockets
           qtshadertools
           kpackage))
    (propagated-inputs
     (list python-soundcard
           python-docopt
           python-numpy
           python-pyaudio
           python-websockets))
    (home-page "https://github.com/flafflar/panon")
    (synopsis "Audio visualizer applet for KDE Plasma 6")
    (description
     "Panon is a KDE Plasma 6 desktop widget that provides real-time audio
spectrum visualization.  It supports multiple visualization effects via
shader-based rendering and receives audio data through PulseAudio or
PipeWire.  Panon uses WebSocket communication between its Python audio
backend and the QML visualization frontend.")
    (license license:gpl3+)))


;;; ---- 4. shadow-selinux ----
;;; AUR #24418 -- shadow-utils with SELinux support.
;;; Source: https://github.com/shadow-maint/shadow (v4.18.0)
;;; License: BSD-3-Clause
;;; This is a variant of the standard shadow package with --with-selinux
;;; enabled, adding libselinux and libsemanage as dependencies.
;;; Hash verified via guix download.

(define-public shadow-selinux
  (package
    (name "shadow-selinux")
    (version "4.18.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/shadow-maint/shadow/releases/download/"
             version "/shadow-" version ".tar.xz"))
       (sha256
        (base32 "023nq0vyc5q4qsc6598nhgfpjjqmwjg82ahj6d2384647d6n1m5d"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f  ;; tests require root privileges
           #:configure-flags
           #~(list "--with-selinux"
                   "--with-audit"
                   "--with-libpam"
                   "--with-acl"
                   "--with-attr"
                   "--enable-subordinate-ids"
                   (string-append "--with-group-name-max-length=32")
                   (string-append "--sysconfdir=" #$output "/etc"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'unpack 'fix-paths
                 (lambda _
                   ;; Don't try to install to /etc during build
                   (substitute* "Makefile.in"
                     (("/etc/login\\.defs") "$(sysconfdir)/login.defs")
                     (("/etc/pam\\.d") "$(sysconfdir)/pam.d")))))))
    (native-inputs
     (list pkg-config))
    (inputs
     (list linux-pam
           libselinux
           libsemanage
           libsepol
           acl
           openssl))
    (home-page "https://github.com/shadow-maint/shadow")
    (synopsis "User and group account administration with SELinux support")
    (description
     "Shadow is a suite of programs for managing user and group accounts
on a GNU/Linux system, including @command{useradd}, @command{usermod},
@command{userdel}, @command{groupadd}, @command{passwd}, @command{login},
@command{su}, and related utilities.  This variant is compiled with SELinux
support, enabling security context management for user sessions and file
operations in SELinux-enabled environments.")
    (license license:bsd-3)))


;;; ---- 5. esp8266-rtos-sdk ----
;;; AUR #17825 -- Espressif IoT Development Framework for ESP8266.
;;; Source: https://github.com/espressif/ESP8266_RTOS_SDK (v3.4)
;;; License: MIT (Espressif MIT)
;;; This is an SDK installation -- copies development files to the
;;; output directory.  The Xtensa cross-compiler is a separate concern.
;;; Hash verified via guix download.

(define-public esp8266-rtos-sdk
  (package
    (name "esp8266-rtos-sdk")
    (version "3.4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/espressif/ESP8266_RTOS_SDK/"
             "archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0hbx4k4c76hfsnb08fjpi5xwq43qx3yk53xvvq9b2qdv5s0wpbk4"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/esp8266-rtos-sdk/"
                #:exclude ("Makefile" ".github")))))
    (propagated-inputs
     (list python
           python-click
           python-pyserial
           python-cryptography
           python-pyparsing
           python-pyelftools))
    (home-page "https://github.com/espressif/ESP8266_RTOS_SDK")
    (synopsis "Espressif IoT development framework for ESP8266")
    (description
     "ESP8266 RTOS SDK is the official development framework for the
ESP8266 chip by Espressif Systems.  It provides APIs for Wi-Fi, TCP/IP
networking, GPIO, SPI, I2C, UART, and other peripherals.  The SDK is
based on FreeRTOS and follows the same framework structure as ESP-IDF.
A separate Xtensa lx106 cross-compiler toolchain is required to build
firmware for the ESP8266.")
    (license license:expat)))
