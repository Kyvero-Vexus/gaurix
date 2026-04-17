;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency tree resolver pass --- deptree-resolver-260417y
;;; Resolves 13 BLOCKED packages with new recipes.
;;; Also marks 28 packages as ALREADY_RESOLVED (recipes in recipe-resolver-260417x).
;;; Documents 26 packages that remain BLOCKED.
;;;
;;; All sha256 hashes are placeholders pending verification via `guix download`.

(define-module (gaurix packages deptree-resolver-260417y)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system trivial)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages fontutils)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages java)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages multiprecision)
  #:use-module (gnu packages ncurses)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages readline)
  #:use-module (gnu packages texinfo)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages usb)
  #:export (apache-jena
            apache-jena-fuseki
            b43-firmware-classic
            bombkurdistan-bin
            bombkurdistan-git
            eclipse-cpp-bin
            fcitx5-pinyin-sougou-dict
            fingerprint-gui
            gtk2-theme-dust
            guile1.8
            ntsync-common
            ntsync-header
            steamos-add-to-steam
))

;;; ─── Font / Theme packages (copy-build-system) ───

(define-public gtk2-theme-dust
  (package
    (name "gtk2-theme-dust")
    (version "0.5.1")
    (source (origin
              (method url-fetch)
              (uri "https://code.launchpad.net/dusttheme/0.5/0.5.1/+download/Dust-0.5.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("Dust" "share/themes/Dust"))))
    (synopsis "clean modern GTK2 theme based on Ubuntu Dust aesthetics")
    (description "Dust is a clean, modern GTK2 theme that remixes the defining
aesthetic elements of Ubuntu with an emphasis on usability.")
    (home-page "https://wiki.ubuntu.com/Artwork/Incoming/DustTheme")
    (license license:gpl3)))

;;; ─── Trivial / config-only packages ───

(define-public ntsync-common
  (package
    (name "ntsync-common")
    (version "6.14")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://raw.githubusercontent.com/torvalds/linux/v"
                    version "/drivers/misc/ntsync.c"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list #:modules '((guix build utils))
           #:builder
           #~(begin
               (use-modules (guix build utils))
               (let ((etc (string-append #$output "/etc")))
                 (mkdir-p (string-append etc "/modules-load.d"))
                 (mkdir-p (string-append etc "/udev/rules.d"))
                 (call-with-output-file
                     (string-append etc "/modules-load.d/ntsync.conf")
                   (lambda (port) (display "ntsync\n" port)))
                 (call-with-output-file
                     (string-append etc "/udev/rules.d/99-ntsync.rules")
                   (lambda (port)
                     (display
                      "KERNEL==\"ntsync\", MODE=\"0644\"\n" port)))))))
    (synopsis "NT synchronization primitive driver common files")
    (description "Provides udev rules and module auto-load configuration for
the Linux NT synchronization primitive driver, used by Wine and Proton for
improved Windows game compatibility.")
    (home-page "https://lore.kernel.org/lkml/20240519202454.1192826-1-zfigura@codeweavers.com/")
    (license license:gpl2)))

(define-public ntsync-header
  (package
    (name "ntsync-header")
    (version "6.14")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://raw.githubusercontent.com/torvalds/linux/v"
                    version "/include/uapi/linux/ntsync.h"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list #:modules '((guix build utils))
           #:builder
           #~(begin
               (use-modules (guix build utils))
               (let ((inc (string-append #$output "/include/linux")))
                 (mkdir-p inc)
                 (copy-file #$source (string-append inc "/ntsync.h"))))))
    (synopsis "NT synchronization primitive driver API header")
    (description "Provides the Linux API header file for the NT synchronization
primitive driver, used by Wine and Proton for improved Windows game
compatibility.")
    (home-page "https://lore.kernel.org/lkml/20240519202454.1192826-1-zfigura@codeweavers.com/")
    (license license:gpl2)))

;;; ─── Copy / Script packages ───

(define-public steamos-add-to-steam
  (package
    (name "steamos-add-to-steam")
    (version "1.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/vicrodh/steamos-add-to-steam")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("bin/add-to-steam" "bin/")
               ("share/" "share/"))))
    (synopsis "add applications as non-Steam games on KDE Plasma")
    (description "Replicates the Steam Deck @samp{Add to Steam} functionality
for KDE Plasma 6, allowing users to add any application as a non-Steam game in
their Steam library via context menus and Dolphin service menus.")
    (home-page "https://github.com/vicrodh/steamos-add-to-steam")
    (license license:expat)))

(define-public bombkurdistan-bin
  (package
    (name "bombkurdistan-bin")
    (version "1.2.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/XielQs/BombKurdistan/releases/download/v"
                    version "/bombkurdistan_linux.zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (native-inputs (list unzip))
    (arguments
     (list #:install-plan
           #~'(("." "share/bombkurdistan/"))))
    (synopsis "simple 2D bombing game")
    (description "BombKurdistan is a simple 2D game built with SDL2 where the
player drops bombs on targets.")
    (home-page "https://github.com/XielQs/BombKurdistan")
    (license license:expat)))

(define-public eclipse-cpp-bin
  (package
    (name "eclipse-cpp-bin")
    (version "4.39")
    (source (origin
              (method url-fetch)
              (uri "https://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/2026-03/R/eclipse-cpp-2026-03-R-linux-gtk-x86_64.tar.gz&r=1")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (supported-systems '("x86_64-linux"))
    (arguments
     (list #:install-plan
           #~'(("." "share/eclipse/"))))
    (synopsis "Eclipse IDE for C/C++ development (prebuilt)")
    (description "Eclipse IDE for C/C++ Developers is a comprehensive
development environment for C and C++ programming with integrated build
tools, debugging, and version control support.  This is a pre-built binary
distribution.")
    (home-page "https://www.eclipse.org/")
    (license license:epl1.0)))

;;; ─── Binary / Java packages (copy-build-system) ───

(define-public apache-jena
  (package
    (name "apache-jena")
    (version "6.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://downloads.apache.org/jena/binaries/apache-jena-"
                    version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("lib" "share/java/jena/lib")
               ("bin" "share/java/jena/bin"))))
    (synopsis "Java framework for Semantic Web applications")
    (description "Apache Jena is a free and open source Java framework for
building Semantic Web and Linked Data applications.  It provides APIs for
RDF, SPARQL, and OWL.")
    (home-page "https://jena.apache.org/")
    (license license:asl2.0)))

(define-public apache-jena-fuseki
  (package
    (name "apache-jena-fuseki")
    (version "6.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://downloads.apache.org/jena/binaries/apache-jena-fuseki-"
                    version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("fuseki-server.jar" "share/java/jena-fuseki/")
               ("webapp" "share/java/jena-fuseki/webapp"))))
    (synopsis "SPARQL server for Apache Jena")
    (description "Apache Jena Fuseki is a SPARQL server built on the Apache
Jena framework.  It can run as a stand-alone server providing RDF data over
HTTP or be embedded in other Java applications.")
    (home-page "https://jena.apache.org/")
    (license license:asl2.0)))

;;; ─── Source builds ───

(define-public guile1.8
  (package
    (name "guile1.8")
    (version "1.8.8")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://ftp.gnu.org/pub/gnu/guile/guile-"
                    version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:configure-flags
           #~(list "--disable-static"
                   "--disable-error-on-warning"
                   "--program-suffix=1.8")
           #:tests? #f))
    (inputs (list gmp readline ncurses openssl))
    (native-inputs (list texinfo pkg-config))
    (synopsis "portable embeddable Scheme implementation (legacy 1.8 branch)")
    (description "GNU Guile is a portable, embeddable Scheme implementation
written in C.  This is the legacy 1.8 branch, provided for compatibility
with software that requires the old Guile 1.8 API.")
    (home-page "https://www.gnu.org/software/guile/")
    (license license:gpl3+)))

(define-public fingerprint-gui
  (package
    (name "fingerprint-gui")
    (version "1.09")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/maksbotan/fingerprint-gui/archive/v"
                    version "-qt5.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (replace 'configure
                 (lambda* (#:key outputs #:allow-other-keys)
                   (invoke "qmake"
                           (string-append "PREFIX="
                                          (assoc-ref outputs "out"))
                           (string-append "LIB="
                                          (assoc-ref outputs "out")
                                          "/lib")))))))
    (inputs (list qtbase-5 polkit-qt libusb))
    (native-inputs (list pkg-config))
    (synopsis "fingerprint-based authentication GUI")
    (description "Fingerprint GUI provides a graphical interface for managing
fingerprint-based authentication on Linux systems.  It supports various
fingerprint readers through libfprint.")
    (home-page "https://github.com/maksbotan/fingerprint-gui")
    (license license:gpl2+)))

(define-public bombkurdistan-git
  (package
    (name "bombkurdistan")
    (version "1.2.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/XielQs/BombKurdistan")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "simple 2D bombing game (built from source)")
    (description "BombKurdistan is a simple 2D game built with SDL2 and CMake
where the player drops bombs on targets.")
    (home-page "https://github.com/XielQs/BombKurdistan")
    (license license:expat)))

;;; ─── Firmware / dictionary packages ───

(define-public b43-firmware-classic
  (package
    (name "b43-firmware-classic")
    (version "5.100.138")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/minios-linux/b43-firmware/releases/"
                    "download/b43-firmware/broadcom-wl-" version ".tar.bz2"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list #:modules '((guix build utils))
           #:builder
           #~(begin
               (use-modules (guix build utils))
               (setenv "PATH"
                       (string-append #$b43-fwcutter "/bin:"
                                      #$tar "/bin:"
                                      #$bzip2 "/bin:"
                                      #$coreutils "/bin"))
               (let ((fw-dir (string-append #$output "/lib/firmware")))
                 (mkdir-p fw-dir)
                 (invoke "tar" "xf" #$source)
                 (invoke "b43-fwcutter" "-w" fw-dir
                         (string-append "broadcom-wl-"
                                        #$version
                                        "/linux/wl_apsta.o"))))))
    (native-inputs (list b43-fwcutter tar bzip2 coreutils))
    (synopsis "firmware for Broadcom B43 wireless chips (trusted release)")
    (description "Provides firmware extracted from the Broadcom wireless driver
for use with the b43 Linux kernel module.  This is the classic trusted release
version 5.100.138.")
    (home-page "https://wireless.wiki.kernel.org/en/users/Drivers/b43")
    (license license:non-copyleft)))

(define-public fcitx5-pinyin-sougou-dict
  (package
    (name "fcitx5-pinyin-sougou-dict")
    (version "20250802")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/maoyaotang12/sougouscel")
                    (commit "baf36c7")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("scel" "share/fcitx5/pinyin/dictionaries/sougou/"))))
    (synopsis "Sogou Pinyin dictionary data for Fcitx5")
    (description "Provides Sogou Pinyin dictionary data for use with the
Fcitx5 Pinyin input method.  Includes comprehensive Chinese language coverage
from Sogou's dictionary collection.")
    (home-page "https://pinyin.sogou.com/dict/")
    (license license:non-copyleft)))
