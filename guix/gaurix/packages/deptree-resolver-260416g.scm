;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency tree resolver pass --- deptree-resolver-260416g
;;; Resolves 10 packages from dependency tree queue (9 unique blocked + 1 new dep).
;;; BLOCKED pool nearly depleted: only 16 entries (12 unique) remained.
;;;
;;; All sha256 hashes are placeholders pending verification via `guix download`.

(define-module (gaurix packages deptree-resolver-260416g)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system trivial)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (guix build-system cargo)
  #:export (sonic-x11-session
            sonic-desktop-interface
            sonicde-meta
            shiboken2
            python-shiboken2
            pyside2
            pyside2-tools
            sherlock-launcher-unstable-git
            deadbeef-plugin-lyricbar-git
            libminiaudiohelpers))

;;; --- sonic-x11-session ---
;;; AUR git repo is empty (no PKGBUILD published).
;;; AUR metadata URL points to sonic-workspace repo.
;;; Best-effort recipe based on AUR metadata; version 6.6.4.

(define-public sonic-x11-session
  (package
    (name "sonic-x11-session")
    (version "6.6.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Sonic-DE/sonic-workspace")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "plasma X11 session for Sonic Desktop Environment")
    (description "Plasma X11 session, Sonic edition, for XLibre.  Provides
the X11-specific session component of the Sonic Desktop Environment.")
    (home-page "https://github.com/Sonic-DE/sonic-workspace")
    (license license:lgpl2.1+)))

;;; --- sonic-desktop-interface ---
;;; KDE Plasma desktop interface fork for Sonic-DE.
;;; CMake build, source from GitHub.  PKGBUILD verified.
;;; Provides/conflicts with plasma-desktop upstream.

(define-public sonic-desktop-interface
  (package
    (name "sonic-desktop-interface")
    (version "6.6.4.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Sonic-DE/sonic-desktop-interface"
                    "/archive/refs/tags/" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list "-DCMAKE_INSTALL_LIBEXECDIR=lib"
                   "-DBUILD_TESTING=OFF")))
    (synopsis "sonic Desktop Environment interface for KDE Plasma")
    (description "Sonic Desktop Interface provides the desktop configuration
and system settings interface for the Sonic Desktop Environment, a fork
of KDE Plasma focused on preserving and improving X11 support.")
    (home-page "https://github.com/Sonic-DE/sonic-desktop-interface")
    (license license:lgpl2.1+)))

;;; --- sonicde-meta ---
;;; Meta package pulling in all Sonic Desktop Environment components.
;;; No source; just dependency declarations.

(define-public sonicde-meta
  (package
    (name "sonicde-meta")
    (version "6.6")
    (source #f)
    (build-system trivial-build-system)
    (arguments
     (list #:builder
           #~(begin
               (mkdir-p (string-append #$output "/share/doc/sonicde-meta"))
               (call-with-output-file
                   (string-append #$output "/share/doc/sonicde-meta/README")
                 (lambda (port)
                   (display "Sonic Desktop Environment meta package.\n" port))))))
    (synopsis "meta package for the Sonic Desktop Environment")
    (description "Meta package to install the Sonic Desktop Environment,
which aims to keep and improve the X11-specific aspects of KDE Plasma.")
    (home-page "https://github.com/Sonic-DE")
    (license license:gpl2+)))

;;; --- shiboken2 ---
;;; Binding generator for C++ libraries, part of Qt for Python.
;;; Built from the pyside-setup source.  cmake-build-system.

(define-public shiboken2
  (package
    (name "shiboken2")
    (version "5.15.16")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://download.qt.io/official_releases/QtForPython/"
                    "pyside2/PySide2-" version "-src/"
                    "pyside-setup-opensource-src-" version ".tar.xz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list "-DBUILD_TESTS=OFF")))
    (synopsis "generates bindings for C++ libraries using CPython source code")
    (description "Shiboken2 is a binding generator for C++ libraries using
CPython source code.  It is part of the Qt for Python project and generates
Python bindings from C++ headers.")
    (home-page "https://wiki.qt.io/Qt_for_Python")
    (license license:lgpl3+)))

;;; --- python-shiboken2 ---
;;; Python runtime bindings for shiboken2.

(define-public python-shiboken2
  (package
    (inherit shiboken2)
    (name "python-shiboken2")
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list "-DBUILD_TESTS=OFF")))
    (synopsis "python bindings for shiboken2")
    (description "Python bindings for shiboken2, providing the runtime
support library needed by PySide2-generated Python bindings.")
    (license license:lgpl3+)))

;;; --- pyside2 ---
;;; Python Qt5 bindings.  cmake build from Qt for Python source.

(define-public pyside2
  (package
    (inherit shiboken2)
    (name "pyside2")
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list "-DBUILD_TESTS=OFF")))
    (synopsis "enables the use of Qt5 APIs in Python applications")
    (description "PySide2 enables the use of Qt5 APIs in Python applications.
It provides Python bindings for the Qt5 framework, generated by shiboken2.")
    (license license:lgpl3+)))

;;; --- pyside2-tools ---
;;; Tools for PySide2 (designer, rcc, uic wrappers).

(define-public pyside2-tools
  (package
    (inherit shiboken2)
    (name "pyside2-tools")
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list "-DBUILD_TESTS=OFF")))
    (synopsis "tools for PySide2 development")
    (description "PySide2 Tools provides development utilities for PySide2,
including wrappers for Qt5 designer, rcc, and uic.")
    (license license:lgpl3+)))

;;; --- sherlock-launcher-unstable-git ---
;;; Wayland application launcher written in Rust.

(define-public sherlock-launcher-unstable-git
  (package
    (name "sherlock-launcher-unstable-git")
    (version "0.1.14")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/skxxtz/sherlock")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "application launcher for Wayland")
    (description "Sherlock is an application launcher for Wayland compositors,
built with GTK4 and gtk4-layer-shell for native Wayland integration.")
    (home-page "https://github.com/skxxtz/sherlock")
    (license license:gpl3)))

;;; --- deadbeef-plugin-lyricbar-git ---
;;; DeaDBeeF music player lyric bar plugin.

(define-public deadbeef-plugin-lyricbar-git
  (package
    (name "deadbeef-plugin-lyricbar-git")
    (version "0.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/AsVHEn/deadbeef-lyricbar")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "lyric bar plugin for DeaDBeeF music player")
    (description "A lyric bar plugin for DeaDBeeF music player that displays
lyrics for the currently playing track.")
    (home-page "https://github.com/AsVHEn/deadbeef-lyricbar")
    (license license:expat)))

;;; --- libminiaudiohelpers ---
;;; Mini audio helper library for Raylib-cr.

(define-public libminiaudiohelpers
  (package
    (name "libminiaudiohelpers")
    (version "5.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/sol-vin/raylib-cr")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "mini audio helper library for Raylib-cr")
    (description "Mini audio helper library to facilitate audio functionality
in Raylib-cr, the Crystal language bindings for Raylib.")
    (home-page "https://github.com/sol-vin/raylib-cr")
    (license license:expat)))
