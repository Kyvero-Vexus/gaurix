;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency-tree resolver pass --- deptree-resolver-260418g
;;; Resolves BLOCKED packages from dependency tree analysis.
;;;
;;; Recipes (8):
;;;   1. gpufetch-nocuda-git (git-source, v0.25)
;;;   2. libgksu (url-fetch, v2.0.12)
;;;   3. gksu (url-fetch, v2.0.2)
;;;   4. trilinos (url-fetch, v17.0.0)
;;;   5. cdesktopenv (url-fetch, v2.5.3)
;;;   6. sope (git-source, v5.12.7)
;;;   7. sogo (git-source, v5.12.7)
;;;   8. ladybird-git (git-source, v0.1.0)
;;;
;;; 8 recipes written. 42 remain BLOCKED.
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Run `guix download <url>` to obtain real hashes before building.

(define-module (gaurix packages deptree-resolver-260418g)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system gnu)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages databases)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages gettext)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gnustep)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages icu4c)
  #:use-module (gnu packages image)
  #:use-module (gnu packages libffi)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages maths)
  #:use-module (gnu packages multiprecision)
  #:use-module (gnu packages ncurses)
  #:use-module (gnu packages ninja)
  #:use-module (gnu packages pciutils)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages shells)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages tcl)
  #:use-module (gnu packages video)
  #:use-module (gnu packages web)
  #:use-module (gnu packages xorg)
  #:export (
            gpufetch-nocuda-git
            libgksu
            gksu
            trilinos-git
            cdesktopenv
            sope
            sogo
            ladybird-git
))

;;; gpufetch-nocuda-git — GPU architecture information fetcher (no CUDA/ROCm)
(define-public gpufetch-nocuda-git
  (package
    (name "gpufetch-nocuda-git")
    (version "0.25")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Dr-Noob/gpufetch")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list "-DENABLE_CUDA_BACKEND=OFF"
                   "-DENABLE_HSA_BACKEND=OFF"
                   "-DENABLE_INTEL_BACKEND=OFF")))
    (inputs (list pciutils))
    (synopsis "command-line tool to display GPU architecture information")
    (description "Gpufetch is a command-line tool to display GPU architecture
information, similar to cpufetch but for graphics processing units.  It reads
GPU data via PCI bus queries.")
    (home-page "https://github.com/Dr-Noob/gpufetch")
    (license license:gpl2)))

;;; libgksu — authorization library for privilege escalation dialogs
(define-public libgksu
  (package
    (name "libgksu")
    (version "2.0.12")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://people.debian.org/~kov/gksu/libgksu-"
                    version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list "--disable-gtk-doc")))
    (native-inputs (list intltool pkg-config))
    (inputs (list gtk+-2 gconf libgnome-keyring libgtop
                 startup-notification sudo))
    (synopsis "authorization library for privilege escalation")
    (description "Libgksu is a library that provides a GTK+ dialog for requesting
a user's password for privilege escalation.  It supports both su and sudo
backends for running commands as another user.")
    (home-page "https://github.com/nicoulaj/libgksu")
    (license license:lgpl2.0+)))

;;; gksu — graphical frontend for privilege escalation (su/sudo)
(define-public gksu
  (package
    (name "gksu")
    (version "2.0.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://people.debian.org/~kov/gksu/gksu-"
                    version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list "--disable-gtk-doc"
                   "--disable-nautilus-extension")))
    (native-inputs (list intltool pkg-config))
    (inputs (list libgksu gtk+-2 xauth))
    (synopsis "graphical frontend for privilege escalation via su or sudo")
    (description "Gksu is a GTK+ frontend for running programs as root or another
user.  It provides a graphical password dialog, supporting both su and sudo as
authentication backends.  Note: this project is unmaintained; consider using
polkit/pkexec as a modern alternative.")
    (home-page "https://github.com/nicoulaj/gksu")
    (license license:gpl2)))

;;; trilinos-git — framework for large-scale scientific computing
(define-public trilinos-git
  (package
    (name "trilinos-git")
    (version "17.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/trilinos/Trilinos/archive/refs/tags/"
                    "trilinos-release-"
                    (string-join (string-split version #\.) "-")
                    ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f
           #:build-type "Release"
           #:configure-flags
           #~(list "-DTrilinos_ENABLE_ALL_PACKAGES=OFF"
                   "-DTrilinos_ENABLE_Teuchos=ON"
                   "-DTrilinos_ENABLE_Epetra=ON"
                   "-DTrilinos_ENABLE_Tpetra=ON"
                   "-DTrilinos_ENABLE_AztecOO=ON"
                   "-DTrilinos_ENABLE_Ifpack=ON"
                   "-DTrilinos_ENABLE_ML=ON"
                   "-DTrilinos_ENABLE_Amesos=ON"
                   "-DTrilinos_ENABLE_Belos=ON"
                   "-DTrilinos_ENABLE_Anasazi=ON"
                   "-DTrilinos_ENABLE_Zoltan=ON"
                   "-DTrilinos_ENABLE_Fortran=OFF"
                   "-DTPL_ENABLE_BLAS=ON"
                   "-DTPL_ENABLE_LAPACK=ON"
                   "-DTPL_ENABLE_Boost=ON"
                   "-DBUILD_SHARED_LIBS=ON"
                   (string-append "-DCMAKE_INSTALL_PREFIX="
                                  #$output))))
    (native-inputs (list pkg-config))
    (inputs (list openblas lapack boost))
    (synopsis "collection of reusable scientific computing libraries")
    (description "Trilinos is a framework of reusable scientific computing
libraries from Sandia National Laboratories.  It provides algorithms for
linear and nonlinear solvers, eigensolvers, partitioning, optimization, and
more.  This package builds a minimal subset of the Trilinos libraries.")
    (home-page "https://trilinos.github.io/")
    (license license:bsd-3)))

;;; cdesktopenv — Common Desktop Environment (classic UNIX desktop)
(define-public cdesktopenv
  (package
    (name "cdesktopenv")
    (version "2.5.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://downloads.sourceforge.net/project/cdesktopenv/src/"
                    "cde-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (replace 'bootstrap
                 (lambda _
                   (invoke "sh" "autogen.sh")))
               (add-after 'unpack 'patch-ksh-paths
                 (lambda* (#:key inputs #:allow-other-keys)
                   (let ((mksh (search-input-file inputs "bin/mksh")))
                     (substitute* (find-files "." "\\.(sh|src|dt)$")
                       (("/bin/ksh") mksh)
                       (("/usr/bin/ksh") mksh))))))))
    (native-inputs (list autoconf automake libtool bison pkg-config))
    (inputs
     (list bash-minimal libx11 libxau libxext libxinerama libxmu libxpm
           libxrender libxscrnsaver libxt ncurses motif tcl mksh
           libjpeg-turbo libtirpc linux-pam openssl freetype))
    (synopsis "classic UNIX desktop environment")
    (description "The Common Desktop Environment (CDE) is the classic commercial
UNIX desktop, originally developed by HP, IBM, Novell, and Sun.  It provides
a complete desktop with file manager, text editor, terminal emulator, calendar,
and other productivity tools in a traditional Motif-based interface.")
    (home-page "https://sourceforge.net/projects/cdesktopenv/")
    (license license:lgpl2.1+)))

;;; sope — GNUstep-based web application framework
(define-public sope
  (package
    (name "sope")
    (version "5.12.7")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Alinto/sope")
                    (commit (string-append "SOPE-" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "CC=" #$(cc-for-target)))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'configure
                 (lambda* (#:key inputs outputs #:allow-other-keys)
                   (invoke "./configure"
                           "--with-gnustep"
                           (string-append "--prefix=" #$output)))))))
    (native-inputs (list gnustep-make pkg-config))
    (inputs (list gnustep-base libxml2 openssl openldap
                 postgresql libmemcached))
    (synopsis "GNUstep-based web application framework")
    (description "SOPE is an application server framework for building web
applications and groupware servers.  It provides foundation classes for HTTP,
XML, WebDAV, LDAP, IMAP, and database access, all built on the GNUstep
Objective-C runtime.")
    (home-page "https://github.com/Alinto/sope")
    (license license:lgpl2.0+)))

;;; sogo — groupware server (calendars, contacts, email via web/CalDAV/CardDAV)
(define-public sogo
  (package
    (name "sogo")
    (version "5.12.7")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Alinto/sogo")
                    (commit (string-append "SOGo-" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (replace 'configure
                 (lambda* (#:key inputs outputs #:allow-other-keys)
                   (invoke "./configure"
                           "--disable-strip"
                           (string-append "--prefix=" #$output)))))))
    (native-inputs (list gnustep-make pkg-config))
    (inputs (list sope gnustep-base libxml2 openssl openldap
                 postgresql curl libsodium libzip libmemcached))
    (synopsis "groupware server with CalDAV, CardDAV, and ActiveSync")
    (description "SOGo is a groupware server providing shared calendars, address
books, and email access via a web interface, CalDAV, CardDAV, and Microsoft
ActiveSync protocols.  It integrates with LDAP, SQL, and SMTP backends.")
    (home-page "https://www.sogo.nu/")
    (license license:gpl2)))

;;; ladybird-git — truly independent web browser from the SerenityOS project
(define-public ladybird-git
  (package
    (name "ladybird-git")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/LadybirdBrowser/ladybird")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list "-DENABLE_QT=ON"
                   "-DCMAKE_BUILD_TYPE=Release")))
    (native-inputs (list ninja pkg-config))
    (inputs (list qtbase ffmpeg icu4c harfbuzz libavif
                 curl openssl zlib))
    (synopsis "truly independent web browser")
    (description "Ladybird is a web browser built from scratch with its own
rendering engine (LibWeb) and JavaScript engine (LibJS).  It originated from
the SerenityOS project and aims to be a fully independent browser.")
    (home-page "https://ladybird.org/")
    (license license:bsd-2)))
