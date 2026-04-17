;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260417ah
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages.
;;;
;;; New recipes (8):
;;;    1. ruby-xxhash (ruby-build-system, v0.7.0, Expat)
;;;    2. matrixbrandy (cmake-build-system, v1.23.6, GPL-2.0+)
;;;    3. tsmuxer (cmake-build-system, v2.7.0, Apache-2.0)
;;;    4. firefox-tridactyl-native-bin (copy/binary, v0.5.0, BSD-2)
;;;    5. overmask-bin (copy/binary, v0.1.4, LGPL-3.0)
;;;    6. vdhcoapp-bin (copy/tarball, v2.0.20, GPL-2.0)
;;;    7. openterface-qt-bin (copy/deb, v0.5.21, AGPL-3.0)
;;;    8. foliate (meson-build-system, v3.3.0, GPL-3.0+)
;;;
;;; ALREADY_IN_GUIX (22):
;;;    9. perl-pod-markdown (gnu/packages/perl.scm v3.400)
;;;   10. perl-path-iterator-rule (gnu/packages/perl.scm v1.014)
;;;   11. perl-software-license (gnu/packages/license.scm v0.103014)
;;;   12. perl-class-unload (gnu/packages/perl.scm v0.11)
;;;   13. perl-date-range (gnu/packages/perl.scm v1.41)
;;;   14. ngircd (gnu/packages/messaging.scm v27)
;;;   15. csmith (gnu/packages/linux.scm v2.3.0)
;;;   16. rogue (gnu/packages/games.scm v5.4.4)
;;;   17. gkrellm (gnu/packages/gkrellm.scm v2.3.11)
;;;   18. i7z (gnu/packages/hardware.scm v0.28)
;;;   19. lunasvg (gnu/packages/cpp.scm v3.5.0)
;;;   20. sameboy (gnu/packages/emulators.scm v1.0.2)
;;;   21. fogpad (gnu/packages/music.scm v1.0.0)
;;;   22. obs-move-transition (gnu/packages/video.scm v3.2.0)
;;;   23. openboardview (gnu/packages/electronics.scm v9.95.2)
;;;   24. uefitool (gnu/packages/firmware.scm v0.28.0)
;;;   25. hikari (gnu/packages/wm.scm v2.3.3)
;;;   26. mecab-ipadic (gnu/packages/language.scm v2.7.0)
;;;   27. eid-mw (gnu/packages/security-token.scm v5.1.19)
;;;   28. openorienteering-mapper (gnu/packages/geo.scm v0.9.5)
;;;   29. python-tokenizers (gnu/packages/machine-learning.scm v0.19.1)
;;;   30. hashcat-utils (gnu/packages/password-utils.scm v1.9)
;;;
;;; 8 new recipes + 22 ALREADY_IN_GUIX = 30 total.
;;;
;;; NOTE: All sha256 hashes obtained via `guix download`.

(define-module (gaurix packages recipe-resolver-260417ah)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system ruby)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages sdl)
  #:use-module (gnu packages video)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gettext)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages webkit)
  #:use-module (gnu packages ruby)
  #:export (
            ruby-xxhash
            matrixbrandy
            tsmuxer
            firefox-tridactyl-native-bin
            overmask-bin
            vdhcoapp-bin
            openterface-qt-bin
            foliate
            ))

;;; ===================================================================
;;; 1. ruby-xxhash — Ruby wrapper for xxHash lib
;;; ===================================================================
(define-public ruby-xxhash
  (package
    (name "ruby-xxhash")
    (version "0.7.0")
    (source
     (origin
       (method url-fetch)
       (uri (rubygems-uri "xxhash" version))
       (sha256
        (base32 "1hwznkvvzq20h5z6b09fyfmb89dvqhn0c39b0bwf5vd4699fcxqi"))))
    (build-system ruby-build-system)
    (synopsis "Ruby wrapper for xxHash lib")
    (description "Ruby wrapper for @code{xxHash}, a fast non-cryptographic
hash algorithm.  It provides a simple interface for computing 32-bit and
64-bit xxHash digests from Ruby strings and IO objects.")
    (home-page "https://github.com/nashby/xxhash")
    (license license:expat)))

;;; ===================================================================
;;; 2. matrixbrandy — BBC BASIC VI interpreter with SDL graphics
;;; ===================================================================
(define-public matrixbrandy
  (package
    (name "matrixbrandy")
    (version "1.23.6")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/stardot/MatrixBrandy/archive/V"
                    version ".tar.gz"))
              (sha256
               (base32
                "0pa0gfh4irznclyl0apcn0h89078ipp3pdn0g8l08i89ihnywhxa"))))
    (build-system cmake-build-system)
    (inputs (list sdl sdl2))
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list (string-append "-DSDL2_DIR="
                                  #$(this-package-input "sdl2")))))
    (synopsis "BBC BASIC VI interpreter for Linux with SDL graphics")
    (description "Matrix Brandy is a fork of Brandy, a portable BBC BASIC VI
interpreter.  It provides a text-mode and SDL graphical interface for running
BBC BASIC programs on modern systems, with support for the full BBC BASIC VI
language including inline assembler.")
    (home-page "https://github.com/stardot/MatrixBrandy")
    (license license:gpl2+)))

;;; ===================================================================
;;; 3. tsmuxer — transport stream muxer for TS/M2TS
;;; ===================================================================
(define-public tsmuxer
  (package
    (name "tsmuxer")
    (version "2.7.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/justdan96/tsMuxer/archive/refs/tags/"
                    version ".tar.gz"))
              (sha256
               (base32
                "19ryijy6bj9anivnsihmwablznmm52v8maph40vhiqnmbqr83hly"))))
    (build-system cmake-build-system)
    (inputs (list zlib ffmpeg))
    (native-inputs (list pkg-config))
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list "-DTSMUXER_STATIC_BUILD=OFF")))
    (synopsis "transport stream muxer/remuxer for TS and M2TS containers")
    (description "TsMuxeR is a transport stream muxer that supports remuxing
and muxing elementary streams, EVO/VOB/MPG, MKV/MKA, MP4/MOV, TS, and M2TS
to TS and M2TS files.  It handles H.264, H.265, H.266, VC-1, and MPEG2 video
codecs, and AAC, AC3, and DTS audio codecs.")
    (home-page "https://github.com/justdan96/tsMuxer")
    (license license:asl2.0)))

;;; ===================================================================
;;; 4. firefox-tridactyl-native-bin — native messaging host for Tridactyl
;;; ===================================================================
(define-public firefox-tridactyl-native-bin
  (package
    (name "firefox-tridactyl-native-bin")
    (version "0.5.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/tridactyl/native_messenger"
                    "/releases/download/" version "/native_main-Linux"))
              (sha256
               (base32
                "0spx9j6269jbxwdbgjk2prxpa33dig4zax5q1wgqfywlr183li86"))))
    (build-system copy-build-system)
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (mkdir-p "src")
                   (copy-file source "src/native_main")
                   (chmod "src/native_main" #o755)
                   (chdir "src"))))
           #:install-plan #~'(("native_main"
                               "lib/mozilla/native-messaging-hosts/tridactyl"))))
    (synopsis "native messaging host for the Tridactyl Firefox extension")
    (description "Tridactyl native messenger is the companion application for
the Tridactyl vim-like Firefox extension.  It enables features that require
native filesystem access, such as editing text in an external editor, sourcing
configuration files, and running shell commands.")
    (home-page "https://github.com/tridactyl/native_messenger")
    (license license:bsd-2)))

;;; ===================================================================
;;; 5. overmask-bin — writable overlay on read-only files
;;; ===================================================================
(define-public overmask-bin
  (package
    (name "overmask-bin")
    (version "0.1.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ErrorNoInternet/overmask"
                    "/releases/download/v" version
                    "/overmask_linux-x86_64"))
              (sha256
               (base32
                "0yf5kvlh227nm0406wy9nl8wyrxqc8kdh17i634d3xk03an1vbrk"))))
    (build-system copy-build-system)
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (mkdir-p "src")
                   (copy-file source "src/overmask")
                   (chmod "src/overmask" #o755)
                   (chdir "src"))))
           #:install-plan #~'(("overmask" "bin/overmask"))))
    (synopsis "add a writable overlay on top of read-only files")
    (description "Overmask creates writable virtual block device overlays on
top of read-only files using the NBD (Network Block Device) kernel interface.
It allows modifications to files without changing the original, useful for
testing and development workflows.")
    (home-page "https://github.com/ErrorNoInternet/overmask")
    (license license:lgpl3+)))

;;; ===================================================================
;;; 6. vdhcoapp-bin — companion app for Video DownloadHelper
;;; ===================================================================
(define-public vdhcoapp-bin
  (package
    (name "vdhcoapp-bin")
    (version "2.0.20")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/aclap-dev/vdhcoapp"
                    "/releases/download/v" version
                    "/vdhcoapp-linux-x86_64.tar.bz2"))
              (sha256
               (base32
                "1y2hzc6sz6fgd9vivf38jzr9vg8dj9g62ynayslwvvvc5swmkisg"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("vdhcoapp" "bin/vdhcoapp"))))
    (synopsis "companion application for Video DownloadHelper browser add-on")
    (description "VdhCoApp is the companion application for the Video
DownloadHelper browser extension.  It provides native messaging support for
downloading and converting video files from the browser, using ffmpeg for
media processing.")
    (home-page "https://github.com/aclap-dev/vdhcoapp")
    (license license:gpl2)))

;;; ===================================================================
;;; 7. openterface-qt-bin — Openterface Mini-KVM host app
;;; ===================================================================
(define-public openterface-qt-bin
  (package
    (name "openterface-qt-bin")
    (version "0.5.21")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/TechxArtisanStudio/Openterface_QT"
                    "/releases/download/" version
                    "/openterfaceQT_linux_amd64.deb"))
              (sha256
               (base32
                "0n7hwjqdyghq8779lx2cmjknh4z9sp1fdsyrnilwrw7lzzmqx0q5"))))
    (build-system copy-build-system)
    (native-inputs (list tar gzip))
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (invoke "ar" "x" source)
                   (if (file-exists? "data.tar.xz")
                       (invoke "tar" "xf" "data.tar.xz")
                       (invoke "tar" "xf" "data.tar.gz"))
                   #t)))
           #:install-plan
           #~'(("usr/bin/" "bin/")
               ("usr/share/" "share/"))))
    (synopsis "Openterface Mini-KVM host application for remote control")
    (description "Openterface QT is the desktop host application for the
Openterface Mini-KVM device.  It provides keyboard, video, and mouse control
of a target computer through a USB connection, enabling headless server
management and BIOS-level access without network configuration.")
    (home-page "https://github.com/TechxArtisanStudio/Openterface_QT")
    (license license:agpl3)))

;;; ===================================================================
;;; 8. foliate — GTK4 eBook reader
;;; ===================================================================
(define-public foliate
  (package
    (name "foliate")
    (version "3.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/johnfactotum/foliate"
                    "/releases/download/" version
                    "/com.github.johnfactotum.Foliate-" version ".tar.xz"))
              (sha256
               (base32
                "0wmn9nf4jhjwkwdh8nlacfzpxdz9vx3p3mi5mxbjwsj26h5crl09"))))
    (build-system meson-build-system)
    (native-inputs (list gettext-minimal
                         `(,glib "bin")
                         pkg-config
                         desktop-file-utils))
    (inputs (list gjs
                  gtk
                  libadwaita
                  webkitgtk))
    (arguments
     (list #:glib-or-gtk? #t
           #:tests? #f))
    (synopsis "simple and modern GTK eBook reader")
    (description "Foliate is a GTK eBook reader for EPUB, MOBI, AZW, FB2,
CBZ, and other formats.  It features customizable fonts and colors, a
built-in dictionary, annotation and bookmark support, text-to-speech, and
reading progress tracking in a clean, modern interface.")
    (home-page "https://johnfactotum.github.io/foliate/")
    (license license:gpl3+)))
