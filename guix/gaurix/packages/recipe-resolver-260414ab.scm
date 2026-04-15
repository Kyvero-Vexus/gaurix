;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260414ab
;;; Resolves 7 NEEDS_RECIPE_DESIGN packages from general queue,
;;; plus 2 new dependency packages (openobex, spooles).
;;;
;;; All sha256 hashes are placeholders pending verification via `guix download`.

(define-module (gaurix packages recipe-resolver-260414ab)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages audio)
  #:use-module (gnu packages mp3)
  #:use-module (gnu packages bittorrent)
  #:use-module (gnu packages boost)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages icu4c)
  #:use-module (gnu packages libusb)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages maths)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages video)
  #:export (openobex
            obexftp
            spooles
            calculix-ccx
            qbittorrent-enhanced-ua-nox
            qbittorrent-enhanced-ua
            tailscale-bin
            mdcat-bin
            fooyin-git))

;;;
;;; --- 1. openobex (cmake-build-system) ---
;;; OBEX protocol implementation library.
;;; Dependency for obexftp (#1080).
;;; Source: https://sourceforge.net/projects/openobex/
;;;

(define-public openobex
  (package
    (name "openobex")
    (version "1.7.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "mirror://sourceforge/openobex/openobex/"
                    version "/openobex-" version "-Source.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))  ;; no test suite
    (native-inputs (list pkg-config))
    (inputs (list libusb bluez))
    (synopsis "implementation of the Object Exchange protocol")
    (description "OpenOBEX is an open source implementation of the Object
Exchange (OBEX) protocol.  OBEX is a session-level protocol for the
exchange of arbitrary objects, providing a model for representing objects
and operations on them.  It is commonly used for file transfer over
Bluetooth, IrDA, and USB connections.")
    (home-page "http://openobex.sourceforge.net/")
    (license license:lgpl2.1+)))

;;;
;;; --- 2. obexftp (cmake-build-system) ---
;;; File transfer over OBEX protocol.
;;; Resolves #1080 obexftp.
;;; Source: https://sourceforge.net/projects/openobex/files/obexftp/
;;;

(define-public obexftp
  (package
    (name "obexftp")
    (version "0.24.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "mirror://sourceforge/openobex/obexftp/"
                    version "/obexftp-" version "-Source.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))  ;; no test suite
    (native-inputs (list pkg-config))
    (inputs (list openobex bluez))
    (synopsis "file transfer over the OBEX protocol")
    (description "ObexFTP implements file transfer over the Object Exchange
(OBEX) protocol.  It provides command-line tools and a C library for
transferring files to and from devices that support OBEX, such as mobile
phones and PDAs via Bluetooth, IrDA, or USB.")
    (home-page "http://dev.zuckschwerdt.org/openobex/wiki/ObexFtp")
    (license license:gpl2+)))

;;;
;;; --- 3. spooles (gnu-build-system) ---
;;; Sparse matrix solver library.
;;; Dependency for calculix-ccx (#13171).
;;; Source: https://www.netlib.org/linalg/spooles/
;;;

(define-public spooles
  (package
    (name "spooles")
    (version "2.2")
    (source (origin
              (method url-fetch)
              (uri "https://www.netlib.org/linalg/spooles/spooles.2.2.tgz")
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)
          (add-after 'unpack 'patch-make-inc
            (lambda _
              (substitute* "Make.inc"
                (("  CC = /usr/lang-4.0/bin/cc")
                 "  CC = gcc")
                ;; Remove profiling flag that breaks build
                (("-pg") ""))))
          (replace 'build
            (lambda _
              (invoke "make" "lib")))
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (lib (string-append out "/lib"))
                     (inc (string-append out "/include/spooles")))
                (mkdir-p lib)
                (mkdir-p inc)
                ;; Install static library
                (copy-file "spooles.a"
                           (string-append lib "/libspooles.a"))
                ;; Install headers preserving directory structure
                (for-each
                 (lambda (hdr)
                   (let* ((rel (if (string-prefix? "./" hdr)
                                   (substring hdr 2)
                                   hdr))
                          (dest (string-append inc "/" rel)))
                     (mkdir-p (dirname dest))
                     (copy-file hdr dest)))
                 (find-files "." "\\.h$"))))))))
    (synopsis "sparse object-oriented linear equations solver")
    (description "SPOOLES (SParse Object Oriented Linear Equations Solver) is
a library for solving sparse real and complex linear systems of equations.
It provides serial and multi-threaded LDLT, LDLH, and LDU factorizations
with a variety of pivoting strategies for symmetric, Hermitian, and
nonsymmetric matrices.")
    (home-page "https://www.netlib.org/linalg/spooles/spooles.2.2.html")
    (license license:public-domain)))

;;;
;;; --- 4. calculix-ccx (gnu-build-system) ---
;;; CalculiX CrunchiX finite element solver.
;;; Resolves #13171 calculix-ccx.
;;; Source: http://www.dhondt.de/
;;;

(define-public calculix-ccx
  (package
    (name "calculix-ccx")
    (version "2.23")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://www.dhondt.de/ccx_"
                                 version ".src.tar.bz2"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)
          (add-after 'unpack 'chdir-to-src
            (lambda _
              (chdir (string-append "CalculiX/ccx_" #$version "/src"))))
          (replace 'build
            (lambda* (#:key inputs #:allow-other-keys)
              (let ((spooles-inc
                     (search-input-directory inputs "include/spooles"))
                    (spooles-lib
                     (search-input-directory inputs "lib"))
                    (arpack-lib
                     (string-append (assoc-ref inputs "arpack-ng") "/lib"))
                    (blas-lib
                     (string-append (assoc-ref inputs "openblas") "/lib")))
                ;; Patch the Makefile for our dependency locations
                (substitute* "Makefile"
                  (("../../../SPOOLES\\.2\\.2")
                   spooles-inc)
                  (("-lspooles")
                   (string-append "-L" spooles-lib " -lspooles"))
                  (("-L\\$\\(ARPACK_DIR\\)")
                   (string-append "-L" arpack-lib))
                  (("-L\\$\\(BLAS_DIR\\)")
                   (string-append "-L" blas-lib)))
                (invoke "make" "-j" (number->string (parallel-job-count))
                        (string-append "CC=gcc")
                        (string-append "FC=gfortran")))))
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (let ((bin (string-append (assoc-ref outputs "out") "/bin")))
                (mkdir-p bin)
                (install-file (string-append "ccx_" #$version) bin)
                ;; Create a convenience symlink
                (symlink (string-append "ccx_" #$version)
                         (string-append bin "/ccx"))))))))
    (native-inputs (list gfortran))
    (inputs (list spooles arpack-ng openblas))
    (synopsis "three-dimensional structural finite element solver")
    (description "CalculiX CrunchiX (CCX) is a free finite element solver for
three-dimensional structural calculations.  It can handle linear and
nonlinear static, dynamic, and thermal analysis.  The input format is
compatible with Abaqus, a widely used commercial FEA program.")
    (home-page "https://www.calculix.de/")
    (license license:gpl2+)))

;;;
;;; --- 5. qbittorrent-enhanced-ua-nox (cmake-build-system) ---
;;; qBittorrent Enhanced Edition without GUI.
;;; Resolves #13343 qbittorrent-enhanced-ua-nox.
;;; Source: https://github.com/c0re100/qBittorrent-Enhanced-Edition
;;;

(define-public qbittorrent-enhanced-ua-nox
  (package
    (name "qbittorrent-enhanced-ua-nox")
    (version "5.1.3.10")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/c0re100/qBittorrent-Enhanced-Edition")
                    (commit (string-append "release-" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:configure-flags
           #~(list "-DGUI=OFF"
                   "-DSYSTEMD=OFF"
                   "-DSTACKTRACE=OFF")
           #:tests? #f))
    (native-inputs (list pkg-config qttools))
    (inputs (list boost libtorrent-rasterbar openssl qtbase zlib))
    (synopsis "enhanced qBittorrent client without GUI")
    (description "qBittorrent Enhanced Edition is a fork of qBittorrent with
additional features such as auto-banning of misbehaving BitTorrent
clients (Xunlei, QQ, Baidu) and peer filtering.  This package provides
the headless (no GUI) variant suitable for server deployments.")
    (home-page
     "https://github.com/c0re100/qBittorrent-Enhanced-Edition")
    (license license:gpl2+)))

;;;
;;; --- 6. qbittorrent-enhanced-ua (cmake-build-system) ---
;;; qBittorrent Enhanced Edition with GUI.
;;; Resolves #13344 qbittorrent-enhanced-ua.
;;;

(define-public qbittorrent-enhanced-ua
  (package
    (inherit qbittorrent-enhanced-ua-nox)
    (name "qbittorrent-enhanced-ua")
    (arguments
     (list #:configure-flags
           #~(list "-DGUI=ON"
                   "-DSYSTEMD=OFF"
                   "-DSTACKTRACE=OFF")
           #:tests? #f))
    (inputs (list boost libtorrent-rasterbar openssl
                  qtbase qtsvg zlib))
    (synopsis "enhanced qBittorrent client with GUI")
    (description "qBittorrent Enhanced Edition is a fork of qBittorrent with
additional features such as auto-banning of misbehaving BitTorrent
clients (Xunlei, QQ, Baidu) and peer filtering.  This package provides
the full graphical user interface variant.")))

;;;
;;; --- 7. tailscale-bin (copy-build-system) ---
;;; Tailscale VPN client prebuilt binary.
;;; Resolves #52 tailscale.
;;; Source: https://pkgs.tailscale.com/stable/
;;;

(define-public tailscale-bin
  (package
    (name "tailscale-bin")
    (version "1.82.5")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://pkgs.tailscale.com/stable/tailscale_"
                    version "_amd64.tgz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(let ((prefix (string-append "tailscale_" #$version "_amd64")))
               (list (list (string-append prefix "/tailscale") "bin/")
                     (list (string-append prefix "/tailscaled") "bin/")))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'wrap-program
                 (lambda* (#:key inputs outputs #:allow-other-keys)
                   (let ((bin (string-append (assoc-ref outputs "out")
                                            "/bin")))
                     (wrap-program (string-append bin "/tailscaled")
                       `("PATH" prefix
                         ,(list (string-append
                                (assoc-ref inputs "iptables")
                                "/sbin"))))))))))
    (inputs (list iptables))
    (supported-systems '("x86_64-linux"))
    (synopsis "mesh VPN built on WireGuard")
    (description "Tailscale is a mesh VPN that creates encrypted point-to-point
connections between your devices using WireGuard.  It handles key management,
identity-based access control, NAT traversal, and DNS automatically.  This
package provides prebuilt static binaries for x86_64 Linux.")
    (home-page "https://tailscale.com")
    (license license:bsd-3)))

;;;
;;; --- 8. mdcat-bin (copy-build-system) ---
;;; Terminal Markdown renderer prebuilt binary.
;;; Resolves #889 mdcat.
;;; Source: https://github.com/swsnr/mdcat
;;;

(define-public mdcat-bin
  (package
    (name "mdcat-bin")
    (version "2.7.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/swsnr/mdcat/releases/download/mdcat-"
                    version "/mdcat-" version
                    "-x86_64-unknown-linux-gnu.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(let ((prefix (string-append "mdcat-" #$version
                                          "-x86_64-unknown-linux-gnu")))
               (list (list (string-append prefix "/mdcat") "bin/")))))
    (supported-systems '("x86_64-linux"))
    (synopsis "terminal Markdown rendering tool")
    (description "mdcat renders Markdown documents directly in the terminal
with rich formatting including bold, italic, colors, hyperlinks, and
inline images in supported terminals such as iTerm2, Kitty, and WezTerm.
It also provides syntax highlighting for fenced code blocks.")
    (home-page "https://github.com/swsnr/mdcat")
    (license license:mpl2.0)))

;;;
;;; --- 9. fooyin-git (cmake-build-system) ---
;;; Customizable C++/Qt6 music player.
;;; Resolves #3819 fooyin-git.
;;; Source: https://github.com/fooyin/fooyin
;;;

(define-public fooyin-git
  (package
    (name "fooyin-git")
    (version "0.10.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/fooyin/fooyin")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:configure-flags
           #~(list "-DBUILD_TESTING=OFF")
           #:tests? #f))
    (native-inputs (list pkg-config))
    (inputs (list qtbase
                  qtsvg
                  qttools
                  taglib
                  ffmpeg
                  icu4c
                  alsa-lib
                  pipewire))
    (synopsis "customizable music player inspired by foobar2000")
    (description "Fooyin is a music player built around customization.  It
offers a layout editing mode allowing users to create their own interface
with widgets like playlists, artwork panels, spectrum visualizers, and
waveform seekbars.  It supports many audio formats through FFmpeg and
reads metadata via TagLib.")
    (home-page "https://github.com/fooyin/fooyin")
    (license license:gpl3)))
