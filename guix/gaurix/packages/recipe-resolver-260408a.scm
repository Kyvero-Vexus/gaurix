;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2026 Gaurix contributors
;;;
;;; Recipe resolver pass — recipe-resolver-260408a
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages:
;;;   Fortune cookie data files, icon/cursor themes, shell/bash scripts,
;;;   C/C++ builds (cmake/meson/make/autotools), and pre-built CLI binaries.
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Run `guix download <url>` to obtain real hashes before building.

(define-module (gaurix packages recipe-resolver-260408a)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system trivial)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system meson)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages bison)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages databases)
  #:use-module (gnu packages file)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages man)
  #:use-module (gnu packages ncurses)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages slang)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages version-control)
  #:use-module (gnu packages xorg)
  #:export (fortune-mod-futurama
            fortune-mod-firefly
            fortune-mod-matrix
            fortune-mod-archer
            fortune-mod-hackers
            fortune-mod-iasip
            gruvbox-dark-icons-gtk
            posy-improved-cursors
            zaread-git
            kfr
            namefix-git
            osslsigncode
            3dstool
            signalbackup-tools-git
            xclicker
            xbindkeys-config-gtk2
            cls
            nb
            most-snapshot
            rpcapd
            scrapfetch-git
            ctpv-git
            mcbash
            air-bin
            meta-package-manager-bin
            xremap-niri-bin
            continuwuity-bin
            twitch-downloader-bin
            maretf-bin
            kopia-ui-bin))

;;;
;;; ── 1. fortune-mod-futurama ──────────────────────────────────────────
;;; Futurama fortune cookie files
;;;
(define-public fortune-mod-futurama
  (package
    (name "fortune-mod-futurama")
    (version "0.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "http://www.netmeister.org/apps/fortune-mod-futurama-"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("futurama" "share/fortune/futurama"))))
    (home-page "http://www.netmeister.org/misc.html")
    (synopsis "Futurama fortune cookie files")
    (description
     "A collection of quotes from the animated series Futurama,
formatted as fortune cookie files for use with @command{fortune}.")
    (license license:public-domain)))

;;;
;;; ── 2. fortune-mod-firefly ───────────────────────────────────────────
;;; Firefly TV series fortune cookies
;;;
(define-public fortune-mod-firefly
  (package
    (name "fortune-mod-firefly")
    (version "3.0.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://hashhar.github.io/blobs/fortune-mod-firefly.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("fortune-mod-firefly/firefly" "share/fortune/firefly")
               ("fortune-mod-firefly/firefly.dat" "share/fortune/firefly.dat"))))
    (home-page "https://en.wikiquote.org/wiki/Firefly_(TV_series)")
    (synopsis "Firefly TV series fortune cookie files")
    (description
     "A collection of quotes from Joss Whedon's Firefly TV series,
formatted as fortune cookie files for use with @command{fortune}.")
    (license license:cc-by-sa3.0)))

;;;
;;; ── 3. fortune-mod-matrix ────────────────────────────────────────────
;;; The Matrix trilogy fortune cookies
;;;
(define-public fortune-mod-matrix
  (package
    (name "fortune-mod-matrix")
    (version "20160822")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://aur.archlinux.org/fortune-mod-matrix.git")
             (commit "05bfadbd2cb6005a3444b6f4b0b612139896cde5")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("fortunes.txt" "share/fortune/matrix"))))
    (home-page "https://en.wikiquote.org/wiki/The_Matrix_%28franchise%29")
    (synopsis "fortune cookies from the Matrix trilogy")
    (description
     "A collection of quotes from the Matrix film trilogy,
formatted as a fortune cookie file for use with @command{fortune}.")
    (license license:public-domain)))

;;;
;;; ── 4. fortune-mod-archer ────────────────────────────────────────────
;;; Archer TV series fortune cookies
;;;
(define-public fortune-mod-archer
  (package
    (name "fortune-mod-archer")
    (version "4.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://aur.archlinux.org/fortune-mod-archer.git")
             (commit "8de952774c087882e0936739a5ae06d329285525")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("archer" "share/fortune/archer"))))
    (home-page "http://www.tvfanatic.com/quotes/shows/archer/")
    (synopsis "Archer TV series fortune cookie file")
    (description
     "A collection of quotes from the Archer animated TV series,
formatted as a fortune cookie file for use with @command{fortune}.")
    (license license:public-domain)))

;;;
;;; ── 5. fortune-mod-hackers ───────────────────────────────────────────
;;; Hackers movie fortune cookies
;;;
(define-public fortune-mod-hackers
  (package
    (name "fortune-mod-hackers")
    (version "1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://aur.archlinux.org/fortune-mod-hackers.git")
             (commit "8829b494709c97720a3d9353d88fafadb3c8623a")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("hackers" "share/fortune/hackers"))))
    (home-page "https://github.com/free-city-of-ulm")
    (synopsis "quotes from the movie Hackers as fortune cookies")
    (description
     "A collection of quotes from the 1995 movie Hackers,
formatted as a fortune cookie file for use with @command{fortune}.")
    (license license:gpl2+)))

;;;
;;; ── 6. fortune-mod-iasip ─────────────────────────────────────────────
;;; It's Always Sunny In Philadelphia fortune cookies
;;;
(define-public fortune-mod-iasip
  (package
    (name "fortune-mod-iasip")
    (version "1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://aur.archlinux.org/fortune-mod-iasip.git")
             (commit "f7599b9d0b6fba71f417a217a6aca7a8c7d67c0a")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("iasip" "share/fortune/iasip"))))
    (home-page "https://en.wikipedia.org/wiki/It%27s_Always_Sunny_in_Philadelphia")
    (synopsis "It's Always Sunny In Philadelphia fortune cookies")
    (description
     "A collection of quotes from the TV series It's Always Sunny In
Philadelphia, formatted as a fortune cookie file for use with
@command{fortune}.")
    (license license:public-domain)))

;;;
;;; ── 7. gruvbox-dark-icons-gtk ────────────────────────────────────────
;;; Gruvbox dark icon theme for GTK
;;;
(define-public gruvbox-dark-icons-gtk
  (package
    (name "gruvbox-dark-icons-gtk")
    (version "1.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/jmattheis/gruvbox-dark-icons-gtk/archive/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/icons/gruvbox-dark-icons-gtk"
                #:exclude ("README.md" ".gitignore")))))
    (home-page "https://github.com/jmattheis/gruvbox-dark-icons-gtk")
    (synopsis "Gruvbox dark icon theme for GTK desktops")
    (description
     "An icon theme for GTK desktop environments using the Gruvbox dark
color palette.  It provides icons for applications, folders, and system
elements in the warm Gruvbox style.")
    (license license:gpl3)))

;;;
;;; ── 8. posy-improved-cursors ─────────────────────────────────────────
;;; Posy's improved cursor themes
;;;
(define-public posy-improved-cursors
  (package
    (name "posy-improved-cursors")
    (version "1.6")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/simtrami/posy-improved-cursor-linux"
             "/archive/refs/tags/" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("Posy_Cursor" "share/icons/Posy_Cursor")
               ("Posy_Cursor_Black" "share/icons/Posy_Cursor_Black")
               ("Posy_Cursor_Black_125" "share/icons/Posy_Cursor_Black_125")
               ("Posy_Cursor_Black_150" "share/icons/Posy_Cursor_Black_150")
               ("Posy_Cursor_Black_175" "share/icons/Posy_Cursor_Black_175"))))
    (home-page "https://github.com/simtrami/posy-improved-cursor-linux")
    (synopsis "Posy's improved cursor themes for Linux")
    (description
     "A set of cursor themes based on Michiel de Boer's Posy cursor
designs, ported to Linux.  Includes multiple size variants and both
standard and black color schemes.")
    (license license:gpl2)))

;;;
;;; ── 9. zaread-git ────────────────────────────────────────────────────
;;; Lightweight ebook and Office document reader (bash script)
;;;
(define-public zaread-git
  (package
    (name "zaread-git")
    (version "0.0.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/paoloap/zaread")
             (commit "c2d45e14e80c13129b460deef19f11e76b38a3e3")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("zaread" "bin/zaread"))))
    (inputs (list bash))
    (home-page "https://github.com/paoloap/zaread")
    (synopsis "lightweight ebook and Office document reader")
    (description
     "Zaread is a lightweight ebook and Office document reader that uses
@command{zathura} as its rendering backend.  It converts various document
formats (EPUB, DOCX, ODT, Markdown) to PDF on the fly for viewing.")
    (license license:gpl3+)))

;;;
;;; ── 10. kfr ──────────────────────────────────────────────────────────
;;; Fast C++ DSP framework (FFT, filters, sample rate conversion)
;;;
(define-public kfr
  (package
    (name "kfr")
    (version "7.0.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/kfrlib/kfr")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list
      #:configure-flags
      #~(list "-DCMAKE_BUILD_TYPE=Release"
              "-DKFR_ENABLE_DFT=ON"
              "-DKFR_ENABLE_CAPI_BUILD=ON"
              "-DCMAKE_POSITION_INDEPENDENT_CODE=ON")
      #:tests? #f))
    (native-inputs (list gcc-toolchain))
    (home-page "https://www.kfrlib.com/")
    (synopsis "fast C++ DSP framework for FFT and digital filters")
    (description
     "KFR is a C++ DSP framework providing high-performance FFT, FIR/IIR
filters, biquad filters, sample rate conversion, and other signal processing
operations.  It uses SIMD instructions (SSE, AVX, AVX-512, ARM NEON)
for maximum throughput.")
    (license license:gpl2)))

;;;
;;; ── 11. namefix-git ──────────────────────────────────────────────────
;;; Cross-platform filename validator and sanitizer (bash script)
;;;
(define-public namefix-git
  (package
    (name "namefix-git")
    (version "1.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/pinkorca/namefix/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("namefix.sh" "bin/namefix")
               ("namefix.1" "share/man/man1/namefix.1")
               ("completions/namefix.bash"
                "share/bash-completion/completions/namefix"))))
    (inputs (list bash))
    (home-page "https://github.com/pinkorca/namefix")
    (synopsis "cross-platform filename validator and sanitizer")
    (description
     "Namefix validates and sanitizes filenames to ensure they are
compatible across different operating systems and filesystems.  It can
detect and fix problematic characters, trailing dots, and reserved names.")
    (license license:gpl3)))

;;;
;;; ── 12. osslsigncode ─────────────────────────────────────────────────
;;; OpenSSL-based Authenticode signing for PE/MSI/CAB files
;;;
(define-public osslsigncode
  (package
    (name "osslsigncode")
    (version "2.12")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/mtrojnar/osslsigncode/archive/"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list
      #:configure-flags
      #~(list "-DCMAKE_BUILD_TYPE=Release")
      #:tests? #f))
    (native-inputs (list perl python))
    (inputs (list curl openssl))
    (home-page "https://github.com/mtrojnar/osslsigncode")
    (synopsis "OpenSSL-based Authenticode signing for PE/MSI/CAB files")
    (description
     "Osslsigncode is a tool for Authenticode signing and timestamping of
PE (EXE/DLL), MSI, and Java CAB files using OpenSSL and libcurl.  It can
sign, verify, and add nested signatures to Windows executables from Linux.")
    (license license:gpl3+)))

;;;
;;; ── 13. 3dstool ──────────────────────────────────────────────────────
;;; Tool for extracting/creating 3DS ROM images
;;;
(define-public 3dstool
  (package
    (name "3dstool")
    (version "1.2.6")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/dnasdw/3dstool/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list
      #:configure-flags
      #~(list "-DCMAKE_BUILD_TYPE=Release"
              "-DUSE_DEP=OFF"
              "-DCMAKE_SKIP_RPATH=ON")
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin")))
                (mkdir-p bin)
                (install-file "bin/Release/3dstool" bin)))))))
    (inputs (list curl openssl))
    (home-page "https://github.com/dnasdw/3dstool")
    (synopsis "tool for extracting and creating Nintendo 3DS ROM images")
    (description
     "3dstool is a command-line utility for extracting and creating
Nintendo 3DS ROM images.  It supports CCI, CXI, EXEFS, and ROMFS
formats, providing tools for 3DS homebrew development and ROM analysis.")
    (license license:expat)))

;;;
;;; ── 14. signalbackup-tools-git ───────────────────────────────────────
;;; Tool to work with Signal Backup files
;;;
(define-public signalbackup-tools-git
  (package
    (name "signalbackup-tools-git")
    (version "20241106.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/bepaald/signalbackup-tools")
             (commit "242c983")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list
      #:configure-flags
      #~(list "-DCMAKE_BUILD_TYPE=Release")
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin")))
                (mkdir-p bin)
                (install-file "output/signalbackup-tools" bin)))))))
    (native-inputs (list pkg-config))
    (inputs (list openssl sqlite dbus))
    (home-page "https://github.com/bepaald/signalbackup-tools")
    (synopsis "tool to work with Signal Backup files")
    (description
     "Signalbackup-tools is a C++ utility for working with Signal
Messenger backup files.  It can decrypt, export, merge, and manipulate
Signal backup data including messages, attachments, and conversation
history.")
    (license license:gpl3)))

;;;
;;; ── 15. xclicker ─────────────────────────────────────────────────────
;;; Fast GUI autoclicker for Linux (X11)
;;;
(define-public xclicker
  (package
    (name "xclicker")
    (version "1.5.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/robiot/xclicker/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (native-inputs (list pkg-config))
    (inputs (list gtk+ libx11 libxi libxtst))
    (home-page "https://github.com/robiot/xclicker")
    (synopsis "fast GUI autoclicker for Linux")
    (description
     "XClicker is a lightweight autoclicker application for Linux with
a GTK-based graphical interface.  It supports configurable click intervals,
button selection, and hotkey activation for automated clicking tasks.")
    (license license:gpl3)))

;;;
;;; ── 16. xbindkeys-config-gtk2 ───────────────────────────────────────
;;; GUI to configure Xbindkeys (GTK2)
;;;
(define-public xbindkeys-config-gtk2
  (package
    (name "xbindkeys-config-gtk2")
    (version "0.1.4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/rgeorgiev583/xbindkeys_config/archive/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (native-inputs (list pkg-config))
    (inputs (list gtk+-2))
    (home-page "https://github.com/rgeorgiev583/xbindkeys_config")
    (synopsis "GUI to configure Xbindkeys key bindings")
    (description
     "Xbindkeys_config is a graphical GTK2-based configuration tool for
Xbindkeys.  It provides a user-friendly interface for creating, editing,
and managing keyboard shortcut bindings without manually editing
configuration files.")
    (license license:gpl2)))

;;;
;;; ── 17. cls ──────────────────────────────────────────────────────────
;;; Clear the terminal screen (simple C utility)
;;;
(define-public cls
  (package
    (name "cls")
    (version "1.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://gist.githubusercontent.com/ASHWIN990/0c7223cd5b6ffcd657ff9ae008612dde/raw/181aa0291617188416b2cce50553076734568bc0/cls.c")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (bin (string-append out "/bin"))
                 (src (assoc-ref %build-inputs "source"))
                 (gcc (string-append (assoc-ref %build-inputs "gcc")
                                    "/bin/gcc")))
            (mkdir-p bin)
            (invoke gcc src "-o" (string-append bin "/cls"))
            #t))))
    (native-inputs (list gcc-toolchain))
    (supported-systems '("x86_64-linux"))
    (home-page "https://gist.github.com/ASHWIN990/0c7223cd5b6ffcd657ff9ae008612dde")
    (synopsis "clear the terminal screen")
    (description
     "Cls is a minimal C program that clears the terminal screen, providing
a simple @command{cls} command similar to the Windows equivalent.")
    (license license:gpl3)))

;;;
;;; ── 18. nb ───────────────────────────────────────────────────────────
;;; Command-line note-taking, bookmarking, and knowledge base app
;;;
(define-public nb
  (package
    (name "nb")
    (version "7.25.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/xwmx/nb/archive/" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("nb" "bin/nb")
               ("etc/nb-completion.bash"
                "share/bash-completion/completions/nb"))))
    (inputs (list bash git))
    (home-page "https://github.com/xwmx/nb")
    (synopsis "command-line note-taking and knowledge base application")
    (description
     "Nb is a command-line note-taking, bookmarking, archiving, and
knowledge base application with encryption, full-text search, Git-backed
versioning, and many other features.  Notes are stored as plain text files
and managed through Git.")
    (license license:agpl3+)))

;;;
;;; ── 19. most-snapshot ────────────────────────────────────────────────
;;; Terminal pager (development snapshot)
;;;
(define-public most-snapshot
  (package
    (name "most-snapshot")
    (version "5.3.0.8")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://www.jedsoft.org/snapshots/most-pre5.3.0-8.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:make-flags #~'()
      #:phases
      #~(modify-phases %standard-phases
          (replace 'configure
            (lambda* (#:key outputs #:allow-other-keys)
              (invoke "./configure"
                      (string-append "--prefix=" (assoc-ref outputs "out"))
                      "--sysconfdir=/etc"))))))
    (inputs (list slang))
    (home-page "https://www.jedsoft.org/most/")
    (synopsis "terminal pager similar to more and less")
    (description
     "Most is a terminal pager similar to @command{more} and @command{less},
with additional features like multiple windows, horizontal scrolling,
and the ability to display text in both left-to-right and right-to-left
modes.  This is the latest development snapshot.")
    (license license:gpl2+)))

;;;
;;; ── 20. rpcapd ───────────────────────────────────────────────────────
;;; Remote packet capture daemon (from libpcap)
;;;
(define-public rpcapd
  (package
    (name "rpcapd")
    (version "1.10.5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "http://www.tcpdump.org/release/libpcap-" version ".tar.xz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:configure-flags
      #~(list "--enable-remote"
              (string-append "--prefix=" (assoc-ref %outputs "out")))
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin")))
                (with-directory-excursion "rpcapd"
                  (invoke "make"
                          (string-append "DESTDIR=" out)
                          "install")
                  ;; Move sbin to bin
                  (when (file-exists? (string-append out "/usr/sbin/rpcapd"))
                    (mkdir-p bin)
                    (rename-file (string-append out "/usr/sbin/rpcapd")
                                 (string-append bin "/rpcapd"))))))))))
    (native-inputs (list bison))
    (home-page "http://www.tcpdump.org/")
    (synopsis "remote packet capture daemon")
    (description
     "Rpcapd is a daemon for remote packet capture, built from the
libpcap source.  It allows capturing network traffic on a remote machine
and transmitting it to a local analysis tool over the RPCAP protocol.")
    (license license:bsd-3)))

;;;
;;; ── 21. scrapfetch-git ───────────────────────────────────────────────
;;; System information fetcher written in C
;;;
(define-public scrapfetch-git
  (package
    (name "scrapfetch-git")
    (version "0.0.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/amodi444/scrapfetch")
             (commit "9650db3")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:make-flags
      #~(list (string-append "DESTDIR=" (assoc-ref %outputs "out"))
              "PREFIX=/")
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure))))
    (home-page "https://github.com/amodi444/scrapfetch")
    (synopsis "system information fetcher written in C")
    (description
     "Scrapfetch is a lightweight system information fetcher written in C
for Linux.  It displays system details like OS, kernel version, uptime,
shell, and memory usage in a compact terminal output.")
    (license license:gpl3+)))

;;;
;;; ── 22. ctpv-git ─────────────────────────────────────────────────────
;;; Fast terminal previews for lf file manager
;;;
(define-public ctpv-git
  (package
    (name "ctpv-git")
    (version "0.0.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/NikitaIvanovV/ctpv")
             (commit "4efa0f9")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:make-flags
      #~(list (string-append "PREFIX=" (assoc-ref %outputs "out")))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure))))
    (inputs (list file openssl))
    (home-page "https://github.com/NikitaIvanovV/ctpv")
    (synopsis "fast image previews for the lf file manager")
    (description
     "Ctpv is a fast terminal file previewer designed for the lf file
manager.  It supports previewing images, PDFs, archives, audio, video,
fonts, and many other file types directly in the terminal.")
    (license license:expat)))

;;;
;;; ── 23. mcbash ───────────────────────────────────────────────────────
;;; MAC address scanner for IPTV platforms
;;;
(define-public mcbash
  (package
    (name "mcbash")
    (version "0.8.6")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/dougy147/mcbash")
             (commit "v0.8.6")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("bin/mcbash" "bin/mcbash")
               ("mcbash.1" "share/man/man1/mcbash.1"))))
    (inputs (list bash))
    (home-page "https://github.com/dougy147/mcbash")
    (synopsis "scan for valid MAC addresses on IPTV platforms")
    (description
     "Mcbash scans for valid MAC addresses on some IPTV platforms.
It provides a command-line interface for testing MAC address validity
against IPTV service providers.")
    (license license:gpl3)))

;;;
;;; ── 24. air-bin ──────────────────────────────────────────────────────
;;; Live reload for Go applications (pre-built binary)
;;;
(define-public air-bin
  (package
    (name "air-bin")
    (version "1.65.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/air-verse/air/releases/download/v"
             version "/air_" version "_linux_amd64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("air" "bin/air"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/air-verse/air")
    (synopsis "live reload for Go applications")
    (description
     "Air is a live-reloading tool for Go applications.  It watches for
file changes in your Go project and automatically rebuilds and restarts
the application, providing a faster development workflow.")
    (license license:gpl3+)))

;;;
;;; ── 25. meta-package-manager-bin ─────────────────────────────────────
;;; Wrapper around all package managers (pre-built binary)
;;;
(define-public meta-package-manager-bin
  (package
    (name "meta-package-manager-bin")
    (version "6.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/kdeldycke/meta-package-manager"
             "/releases/download/v" version
             "/meta-package-manager-" version "-linux-x64.bin"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (bin (string-append out "/bin"))
                 (src (assoc-ref %build-inputs "source")))
            (mkdir-p bin)
            (copy-file src (string-append bin "/mpm"))
            (chmod (string-append bin "/mpm") #o755)
            #t))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/kdeldycke/meta-package-manager")
    (synopsis "wrapper around all package managers")
    (description
     "Meta Package Manager (mpm) is a CLI that wraps all available
system package managers.  It provides unified commands for searching,
installing, upgrading, and removing packages across different package
managers like apt, brew, npm, pip, and others.")
    (license license:gpl2+)))

;;;
;;; ── 26. xremap-niri-bin ──────────────────────────────────────────────
;;; Dynamic key remapper for Niri compositor (pre-built binary)
;;;
(define-public xremap-niri-bin
  (package
    (name "xremap-niri-bin")
    (version "0.15.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/xremap/xremap/releases/download/v"
             version "/xremap-linux-x86_64-niri.zip"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (bin (string-append out "/bin"))
                 (src (assoc-ref %build-inputs "source"))
                 (unzip (string-append (assoc-ref %build-inputs "unzip")
                                       "/bin/unzip")))
            (mkdir-p bin)
            (invoke unzip src "-d" bin)
            (chmod (string-append bin "/xremap") #o755)
            #t))))
    (native-inputs (list unzip))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/xremap/xremap")
    (synopsis "dynamic key remapper for X11 and Wayland")
    (description
     "Xremap is a key remapper for Linux supporting both X11 and Wayland
compositors.  This variant is built specifically for the Niri Wayland
compositor, providing dynamic key remapping with support for application-
specific bindings.")
    (license license:expat)))

;;;
;;; ── 27. continuwuity-bin ─────────────────────────────────────────────
;;; Matrix homeserver (community continuation of conduwuit)
;;;
(define-public continuwuity-bin
  (package
    (name "continuwuity-bin")
    (version "0.5.6")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://forgejo.ellis.link/continuwuation/continuwuity"
             "/releases/download/v" version "/conduwuit-linux-amd64"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (bin (string-append out "/bin"))
                 (src (assoc-ref %build-inputs "source")))
            (mkdir-p bin)
            (copy-file src (string-append bin "/conduwuit"))
            (chmod (string-append bin "/conduwuit") #o755)
            #t))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://forgejo.ellis.link/continuwuation/continuwuity")
    (synopsis "community-driven Matrix homeserver")
    (description
     "Continuwuity is a community-driven continuation of conduwuit and
Conduit Matrix homeservers, focusing on user experience and new features.
It provides a lightweight, high-performance Matrix server implementation
written in Rust.")
    (license license:asl2.0)))

;;;
;;; ── 28. twitch-downloader-bin ────────────────────────────────────────
;;; Twitch VOD/Clip downloader (pre-built binary)
;;;
(define-public twitch-downloader-bin
  (package
    (name "twitch-downloader-bin")
    (version "1.56.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/lay295/TwitchDownloader/releases/download/"
             version "/TwitchDownloaderCLI-" version "-Linux-x64.zip"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (bin (string-append out "/bin"))
                 (src (assoc-ref %build-inputs "source"))
                 (unzip (string-append (assoc-ref %build-inputs "unzip")
                                       "/bin/unzip")))
            (mkdir-p bin)
            (invoke unzip src "-d" bin)
            (chmod (string-append bin "/TwitchDownloaderCLI") #o755)
            #t))))
    (native-inputs (list unzip))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/lay295/TwitchDownloader")
    (synopsis "Twitch VOD and clip downloader")
    (description
     "TwitchDownloader is a CLI tool for downloading Twitch VODs, clips,
and chat logs.  It supports chat rendering and replay functionality,
allowing users to save and view Twitch content offline.")
    (license license:expat)))

;;;
;;; ── 29. maretf-bin ───────────────────────────────────────────────────
;;; VTF file utility (pre-built binary)
;;;
(define-public maretf-bin
  (package
    (name "maretf-bin")
    (version "0.10.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/craftablescience/MareTF/releases/download/v"
             version "/MareTF-Linux-Standalone-gcc-release.zip"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (bin (string-append out "/bin"))
                 (src (assoc-ref %build-inputs "source"))
                 (unzip (string-append (assoc-ref %build-inputs "unzip")
                                       "/bin/unzip")))
            (mkdir-p bin)
            (invoke unzip src "-d" (string-append out "/tmp"))
            (install-file (string-append out "/tmp/MareTF") bin)
            (install-file (string-append out "/tmp/MareTF_gui") bin)
            (chmod (string-append bin "/MareTF") #o755)
            (chmod (string-append bin "/MareTF_gui") #o755)
            (delete-file-recursively (string-append out "/tmp"))
            #t))))
    (native-inputs (list unzip))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/craftablescience/MareTF")
    (synopsis "command-line utility for working with VTF files")
    (description
     "MareTF is a tool for working with Valve Texture Format (VTF) files
used in Source Engine games.  It can convert, inspect, and manipulate VTF
textures from the command line or through a Qt-based GUI.")
    (license license:expat)))

;;;
;;; ── 30. kopia-ui-bin ─────────────────────────────────────────────────
;;; Cross-platform backup tool (pre-built binary from .deb)
;;;
(define-public kopia-ui-bin
  (package
    (name "kopia-ui-bin")
    (version "0.22.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/kopia/kopia/releases/download/v"
             version "/kopia-ui_" version "_amd64.deb"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (ar  (string-append (assoc-ref %build-inputs "binutils")
                                     "/bin/ar"))
                 (tar (string-append (assoc-ref %build-inputs "tar")
                                     "/bin/tar"))
                 (xz  (string-append (assoc-ref %build-inputs "xz")
                                     "/bin/xz")))
            (setenv "PATH"
                    (string-append (assoc-ref %build-inputs "xz") "/bin:"
                                   (assoc-ref %build-inputs "tar") "/bin"))
            (invoke ar "x" src)
            (invoke tar "xf" "data.tar.xz")
            (copy-recursively "opt" (string-append out "/opt"))
            (mkdir-p (string-append out "/bin"))
            (symlink (string-append out "/opt/KopiaUI/kopia-ui")
                     (string-append out "/bin/kopia-ui"))
            #t))))
    (native-inputs (list binutils tar xz))
    (supported-systems '("x86_64-linux"))
    (home-page "https://kopia.io/")
    (synopsis "cross-platform backup tool with encryption and deduplication")
    (description
     "Kopia is a backup tool supporting encryption, deduplication, and
compression with cloud storage backends (S3, GCS, Azure, B2, SFTP).
Kopia UI provides a graphical interface for managing backup repositories,
snapshots, and policies.")
    (license license:asl2.0)))
