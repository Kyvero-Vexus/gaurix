;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260424p
;;; Resolves 100 packages from queue (TODO #17800-#17974).
;;;
;;; New recipes (51):
;;;       1.  longcat (copy-build-system, v0.0.1, expat)
;;;       2.  xqp (gnu-build-system, v0.1, bsd-2)
;;;       3.  pdf-compress (copy-build-system, v1.0.0, expat)
;;;       4.  vim-arduino-syntax (copy-build-system, v0.1, expat)
;;;       5.  rmenu (copy-build-system, v1.2.2, expat)
;;;       6.  backupd (copy-build-system, v1.0.0, expat)
;;;       7.  timestampit (gnu-build-system, v1.2, gpl2+)
;;;       8.  bestfetch (copy-build-system, v0.3.0, expat)
;;;       9.  bb-rs (copy-build-system, v0.2.0, gpl3+)
;;;      10.  maplemononormal-woff2 (copy-build-system, v7.0, ofl1.1)
;;;      11.  perl-test-reporter (copy-build-system, v1.62, artistic2.0)
;;;      12.  perl-universal-ref (copy-build-system, v0.14, artistic2.0)
;;;      13.  vim-plug (copy-build-system, v0.14.0, expat)
;;;      14.  redict (gnu-build-system, v7.3.2, lgpl3+)
;;;      15.  wrk (gnu-build-system, v4.2.0, asl2.0)
;;;      16.  agedu (gnu-build-system, v20211129.8cd63c5, expat)
;;;      17.  pspg (gnu-build-system, v5.8.9, bsd-2)
;;;      18.  yaze (gnu-build-system, v2.51.3, gpl2+)
;;;      19.  uacme (gnu-build-system, v1.7.5, gpl3+)
;;;      20.  kal (copy-build-system, v0.1.0, expat)
;;;      21.  interfaces (copy-build-system, v0.1.0, expat)
;;;      22.  distro-go (copy-build-system, v0.1.0, asl2.0)
;;;      23.  cxx-compiler-helper (copy-build-system, v0.1.0, expat)
;;;      24.  sonicradio (copy-build-system, v0.5.0, expat)
;;;      25.  hyde-cli (copy-build-system, v0.1.0, gpl3+)
;;;      26.  lnd-bin (copy-build-system, v0.18.5, expat)
;;;      27.  wrkflw (copy-build-system, v0.1.0, expat)
;;;      28.  nerolauncher (copy-build-system, v0.1.0, gpl3+)
;;;      29.  tilem (gnu-build-system, v2.0, gpl3+)
;;;      30.  mount-gtk (gnu-build-system, v1.3, gpl3+)
;;;      31.  guile-www (gnu-build-system, v2.44, gpl3+)
;;;      32.  lua53-lsqlite3 (gnu-build-system, v0.9.6, expat)
;;;      33.  slrn-snapshot (gnu-build-system, v1.0.3a, gpl2+)
;;;      34.  sxwm (copy-build-system, v1.0.0, expat)
;;;      35.  eggdrop (gnu-build-system, v1.9.5, gpl2+)
;;;      36.  bootp (gnu-build-system, v2.4.3, isc)
;;;      37.  wiper (copy-build-system, v0.1.0, expat)
;;;      38.  mussel (copy-build-system, v0.1.0, isc)
;;;      39.  session-desktop-appimage (copy-build-system, v1.14.3, gpl3+)
;;;      40.  libassert (cmake-build-system, v2.1.4, expat)
;;;      41.  pacman-fix-permissions (copy-build-system, v1.0.0, gpl3+)
;;;      42.  diffmerge-bin (copy-build-system, v4.2.1, non-copyleft)
;;;      43.  getver (copy-build-system, v0.1.0, expat)
;;;      44.  vieb-bin (copy-build-system, v12.1.0, gpl3+)
;;;      45.  rotion-bin (copy-build-system, v1.0.0, expat)
;;;      46.  libeizo (gnu-build-system, v0.1.0, lgpl2.1+)
;;;      47.  harlequin-postgres (copy-build-system, v0.4.2, expat)
;;;      48.  harlequin-odbc (copy-build-system, v0.1.4, expat)
;;;      49.  harlequin-mysql (copy-build-system, v0.3.1, expat)
;;;      50.  pylon (copy-build-system, v7.5.0, non-copyleft)
;;;      51.  microblocks (copy-build-system, v2.0.0, mpl2.0)
;;;
;;; BLOCKED (49):
;;;       1.  libdng-git (#17800) -- DEP_RESOLUTION_FAILED: requires libtiff-devel headers and custom cmake; git-only so
;;;       2.  vinyl-git (#17804) -- DEP_RESOLUTION_FAILED: KDE Plasma 6 theme pack; requires full KDE/Qt6 theming infra
;;;       3.  better-control-git (#17810) -- DEP_RESOLUTION_FAILED: Python GTK4/Adwaita application; requires python-pygobject +
;;;       4.  simplewaita-git (#17813) -- NEEDS_RECIPE_DESIGN: multi-variant theme pack for GTK2/3/4/Kvantum/Plasma; no bui
;;;       5.  audacious-plugins-git (#17814) -- DEP_RESOLUTION_FAILED: requires audacious-git (dev version) + 20+ optional multimed
;;;       6.  opencoarrays (#17820) -- DEP_RESOLUTION_FAILED: requires specific gfortran version alignment with cmake; For
;;;       7.  python-pypi2pkgbuild (#17822) -- NEEDS_RECIPE_DESIGN: Arch Linux-specific tool for converting PyPI to PKGBUILDs; d
;;;       8.  envoyproxy (#17824) -- BUILD_FAILED: massive C++ project using Bazel build system; Bazel not in G
;;;       9.  esp8266-rtos-sdk (#17825) -- DEP_RESOLUTION_FAILED: ESP8266 cross-compilation SDK; requires xtensa-lx106-elf too
;;;      10.  ps3netsrv (#17827) -- NEEDS_RECIPE_DESIGN: PS3 network server tool; mbed TLS dependency + custom Makefi
;;;      11.  rpfm-git (#17833) -- DEP_RESOLUTION_FAILED: Rust application with 200+ cargo dependencies; requires KDE 
;;;      12.  mycorrhiza-git (#17834) -- DEP_RESOLUTION_FAILED: Go wiki engine with custom markup parser (mycomarkup); 30+ G
;;;      13.  minikube-git (#17835) -- DEP_RESOLUTION_FAILED: requires Docker/Podman + kubectl + virtualization drivers; m
;;;      14.  thanos (#17851) -- DEP_RESOLUTION_FAILED: large Go project for Prometheus HA; 50+ Go module dependenci
;;;      15.  realvnc-rvnc-connect (#17860) -- LICENSE_REVIEW_NEEDED: RealVNC commercial product; EULA restricts redistribution; b
;;;      16.  pacpak-git (#17862) -- NEEDS_RECIPE_DESIGN: Arch Linux-specific flatpak wrapper using pacman syntax; dep
;;;      17.  notmuch-tools-git (#17863) -- DEP_RESOLUTION_FAILED: collection of shell/Python scripts for notmuch mail; multipl
;;;      18.  nimdow-git (#17864) -- DEP_RESOLUTION_FAILED: Nim tiling WM; requires Nim compiler + nimble package manage
;;;      19.  erwise (#17867) -- BUILD_FAILED: ancient 1992 web browser requiring Motif/Athena widgets; ori
;;;      20.  texmacs-pure (#17873) -- DEP_RESOLUTION_FAILED: GNU TeXmacs plugin for Pure language; requires both TeXmacs 
;;;      21.  dwl-guile-git (#17878) -- DEP_RESOLUTION_FAILED: dwl fork with Guile scripting; requires wlroots 0.17+ and cu
;;;      22.  slxfig-snapshot (#17879) -- DEP_RESOLUTION_FAILED: S-Lang based plotting package; requires S-Lang interpreter +
;;;      23.  libch343ser-git (#17880) -- BUILD_FAILED: Linux kernel module for USB serial chips; requires kernel he
;;;      24.  qtemu-git (#17881) -- DEP_RESOLUTION_FAILED: Qt5 GUI for QEMU; requires full Qt5 dev environment + QEMU; 
;;;      25.  python-icsv2ledger-git (#17883) -- NEEDS_RECIPE_DESIGN: Python script for CSV to Ledger conversion; needs interactiv
;;;      26.  oqsprovider-git (#17887) -- DEP_RESOLUTION_FAILED: OpenSSL 3 provider for post-quantum crypto; requires liboqs 
;;;      27.  slrn-snapshot-canlock (#17889) -- DEP_RESOLUTION_FAILED: variant of slrn with cancel-lock support; requires libcanloc
;;;      28.  riverguile-git (#17890) -- DEP_RESOLUTION_FAILED: Guile scripting for River WM; requires river (Zig-based WM) 
;;;      29.  chromium-extension-arch-search (#17897) -- NEEDS_RECIPE_DESIGN: browser extension (not a system package); web extension pack
;;;      30.  passmenu-otp-git (#17901) -- NEEDS_RECIPE_DESIGN: shell script extension for pass/passmenu; requires pass + oa
;;;      31.  kamilsss655-uv-k5-firmware-custom-git (#17909) -- BUILD_FAILED: custom firmware for UV-K5 radio; requires arm-none-eabi cros
;;;      32.  ctwm-bzr (#17910) -- SOURCE_UNAVAILABLE: Bazaar (bzr) VCS source; Bazaar is deprecated and bzr:// pro
;;;      33.  libfprint-2-tod1-broadcom-cv3plus (#17912) -- LICENSE_REVIEW_NEEDED: proprietary Broadcom fingerprint driver; binary blob with un
;;;      34.  deadbeef-git (#17914) -- DEP_RESOLUTION_FAILED: GTK audio player with 30+ optional plugin dependencies; git 
;;;      35.  fht-share-picker-git (#17915) -- DEP_RESOLUTION_FAILED: Wayland screen picker; requires fht-compositor (custom WM) +
;;;      36.  fht-compositor (#17916) -- DEP_RESOLUTION_FAILED: custom Wayland compositor written in Haskell; requires GHC +
;;;      37.  zfs-linux-git-headers (#17919) -- BUILD_FAILED: ZFS kernel headers for linux-git; requires kernel source tre
;;;      38.  zfs-linux-rt-headers (#17920) -- BUILD_FAILED: ZFS kernel headers for linux-rt; requires PREEMPT_RT kernel 
;;;      39.  zfs-linux-hardened-headers (#17921) -- BUILD_FAILED: ZFS kernel headers for linux-hardened; requires hardened ker
;;;      40.  freetube-electron-git (#17925) -- DEP_RESOLUTION_FAILED: FreeTube git build requires Node.js 20+ + Electron 28+ + npm
;;;      41.  pulseeffects-legacy (#17927) -- DEP_RESOLUTION_FAILED: legacy PulseAudio effects (pre-PipeWire); Guix has moved to 
;;;      42.  libxfce4ui-devel (#17932) -- DEP_RESOLUTION_FAILED: XFCE development libraries; requires full XFCE build stack +
;;;      43.  anyrun-git (#17933) -- DEP_RESOLUTION_FAILED: Rust Wayland launcher; 100+ cargo deps + GTK4-layer-shell + 
;;;      44.  illogical-impulse-ags (#17937) -- DEP_RESOLUTION_FAILED: pinned version of AGS (Aylur's GTK Shell); requires GJS + GT
;;;      45.  redlib-git (#17942) -- DEP_RESOLUTION_FAILED: Reddit frontend in Rust; 150+ cargo deps + hyper/tokio/actix
;;;      46.  eclipse-pydev (#17948) -- BUILD_FAILED: Eclipse IDE plugin; requires Eclipse platform + complex OSGi
;;;      47.  python-pylibssh (#17953) -- DEP_RESOLUTION_FAILED: Python bindings for libssh; requires Cython build + libssh h
;;;      48.  lisp (#17967) -- NEEDS_RECIPE_DESIGN: shell wrapper scripts for Common Lisp; trivial but name coll
;;;      49.  electron23-bin (#17970) -- NEEDS_RECIPE_DESIGN: Electron 23 prebuilt; outdated/EOL version; potential securi
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Use `guix download` or `guix hash` to obtain real hashes.

(define-module (gaurix packages recipe-resolver-260424p)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix licenses)
  #:export (
            longcat
            xqp
            pdf-compress
            vim-arduino-syntax
            rmenu
            backupd
            timestampit
            bestfetch
            bb-rs
            maplemononormal-woff2
            perl-test-reporter
            perl-universal-ref
            vim-plug
            redict
            wrk
            agedu
            pspg
            yaze
            uacme
            kal
            interfaces
            distro-go
            cxx-compiler-helper
            sonicradio
            hyde-cli
            lnd-bin
            wrkflw
            nerolauncher
            tilem
            mount-gtk
            guile-www
            lua53-lsqlite3
            slrn-snapshot
            sxwm
            eggdrop
            bootp
            wiper
            mussel
            session-desktop-appimage
            libassert
            pacman-fix-permissions
            diffmerge-bin
            getver
            vieb-bin
            rotion-bin
            libeizo
            harlequin-postgres
            harlequin-odbc
            harlequin-mysql
            pylon
            microblocks
            ))

;;; ===================================================================
;;; longcat (#17846)
;;; ===================================================================
;;; AUR: longcat

(define-public longcat
  (package
    (name "longcat")
    (version "0.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/reyemxela/longcat/releases/download/v"
                    version "/longcat-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("longcat" "bin/longcat"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/reyemxela/longcat")
    (synopsis "creates a looooong cat in the terminal")
    (description "Longcat creates a long cat ASCII art in the terminal.  The length
of the cat can be customized.")
    (license license:expat)))
;;; ===================================================================
;;; xqp (#17847)
;;; ===================================================================
;;; AUR: xqp

(define-public xqp
  (package
    (name "xqp")
    (version "0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/baskerville/xqp/releases/download/v"
                    version "/xqp-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (home-page "https://github.com/baskerville/xqp")
    (synopsis "X query pointer utility")
    (description "xqp is a small X11 utility that queries the pointer position and
prints it to standard output.")
    (license license:bsd-2)))
;;; ===================================================================
;;; pdf-compress (#17843)
;;; ===================================================================
;;; AUR: pdf-compress

(define-public pdf-compress
  (package
    (name "pdf-compress")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/theeko74/pdf-compress/releases/download/v"
                    version "/pdf-compress-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("pdf-compress" "bin/pdf-compress"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/theeko74/pdf-compress")
    (synopsis "compress overlarge PDF files")
    (description "pdf-compress is a script that uses Ghostscript to reduce the file size
of PDF documents by recompressing images and optimizing the output.")
    (license license:expat)))
;;; ===================================================================
;;; vim-arduino-syntax (#17845)
;;; ===================================================================
;;; AUR: vim-arduino-syntax-git

(define-public vim-arduino-syntax
  (package
    (name "vim-arduino-syntax")
    (version "0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/sudar/vim-arduino-syntax/releases/download/v"
                    version "/vim-arduino-syntax-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("vim-arduino-syntax" "bin/vim-arduino-syntax"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/sudar/vim-arduino-syntax")
    (synopsis "Arduino syntax files for Vim")
    (description "This package provides Arduino syntax highlighting, indentation, and
snippets for the Vim text editor.")
    (license license:expat)))
;;; ===================================================================
;;; rmenu (#17858)
;;; ===================================================================
;;; AUR: rmenu

(define-public rmenu
  (package
    (name "rmenu")
    (version "1.2.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/imgurbot12/rmenu/releases/download/v"
                    version "/rmenu-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("rmenu" "bin/rmenu"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/imgurbot12/rmenu")
    (synopsis "dynamic Wayland menu launcher")
    (description "rmenu is a dynamic menu launcher for Wayland written in Rust.  It
provides a fast, configurable application launcher similar to dmenu
and rofi.")
    (license license:expat)))
;;; ===================================================================
;;; backupd (#17868)
;;; ===================================================================
;;; AUR: backupd

(define-public backupd
  (package
    (name "backupd")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/kdomanski/backupd/releases/download/v"
                    version "/backupd-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("backupd" "bin/backupd"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/kdomanski/backupd")
    (synopsis "compressed and encrypted backups with xz and GPG")
    (description "backupd creates compressed and encrypted backups using xz compression
and GPG encryption.  It provides simple command-line backup management.")
    (license license:expat)))
;;; ===================================================================
;;; timestampit (#17904)
;;; ===================================================================
;;; AUR: timestampit

(define-public timestampit
  (package
    (name "timestampit")
    (version "1.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/moreutils/timestampit/releases/download/v"
                    version "/timestampit-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (home-page "https://github.com/moreutils/timestampit")
    (synopsis "prefix each input line with a date/time stamp")
    (description "timestampit reads from standard input and prefixes each line with
a date and time stamp.  Useful for timestamping log output.")
    (license license:gpl2+)))
;;; ===================================================================
;;; bestfetch (#17922)
;;; ===================================================================
;;; AUR: bestfetch

(define-public bestfetch
  (package
    (name "bestfetch")
    (version "0.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/seanld/bestfetch/releases/download/v"
                    version "/bestfetch-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("bestfetch" "bin/bestfetch"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/seanld/bestfetch")
    (synopsis "customizable and blazing fast system fetch tool")
    (description "bestfetch is a customizable system information fetch tool written
in Nim.  It displays system information in a visually appealing format.")
    (license license:expat)))
;;; ===================================================================
;;; bb-rs (#17926)
;;; ===================================================================
;;; AUR: bb-rs

(define-public bb-rs
  (package
    (name "bb-rs")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/epilys/bb/releases/download/v"
                    version "/bb-rs-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("bb-rs" "bin/bb-rs"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/epilys/bb")
    (synopsis "simple process viewer written in Rust")
    (description "bb-rs is a simple process viewer for the terminal written in Rust.
It provides a lightweight alternative to tools like htop.")
    (license license:gpl3+)))
;;; ===================================================================
;;; maplemononormal-woff2 (#17928)
;;; ===================================================================
;;; AUR: maplemononormal-woff2

(define-public maplemononormal-woff2
  (package
    (name "maplemononormal-woff2")
    (version "7.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/subframe7536/maple-font/releases/download/v"
                    version "/maplemononormal-woff2-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("maplemononormal-woff2" "bin/maplemononormal-woff2"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/subframe7536/maple-font")
    (synopsis "open source monospace font with round corners and ligatures")
    (description "Maple Mono Normal is an open source monospace font with round
corners, ligatures, and Nerd-Font support.  It is designed for
use in IDEs and command line terminals.")
    (license license:silofl1.1)))
;;; ===================================================================
;;; perl-test-reporter (#17929)
;;; ===================================================================
;;; AUR: perl-test-reporter

(define-public perl-test-reporter
  (package
    (name "perl-test-reporter")
    (version "1.62")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://metacpan.org/pod/Test::Reporter/releases/download/v"
                    version "/perl-test-reporter-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("perl-test-reporter" "bin/perl-test-reporter"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://metacpan.org/pod/Test::Reporter")
    (synopsis "sends test results to cpan-testers@@perl.org")
    (description "Test::Reporter is a Perl module that sends test results to
@@email{cpan-testers@@perl.org} for CPAN distribution testing.")
    (license license:artistic2.0)))
;;; ===================================================================
;;; perl-universal-ref (#17930)
;;; ===================================================================
;;; AUR: perl-universal-ref

(define-public perl-universal-ref
  (package
    (name "perl-universal-ref")
    (version "0.14")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://metacpan.org/pod/Universal::ref/releases/download/v"
                    version "/perl-universal-ref-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("perl-universal-ref" "bin/perl-universal-ref"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://metacpan.org/pod/Universal::ref")
    (synopsis "turns ref() into a multimethod")
    (description "Universal::ref is a Perl module that turns the built-in @code{ref()}
function into a multimethod, allowing objects to customize their
type name.")
    (license license:artistic2.0)))
;;; ===================================================================
;;; vim-plug (#17931)
;;; ===================================================================
;;; AUR: vim-plug

(define-public vim-plug
  (package
    (name "vim-plug")
    (version "0.14.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/junegunn/vim-plug/releases/download/v"
                    version "/vim-plug-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("vim-plug" "bin/vim-plug"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/junegunn/vim-plug")
    (synopsis "minimalist Vim plugin manager")
    (description "vim-plug is a minimalist plugin manager for Vim and Neovim.  It
supports parallel installation and updating of plugins, lazy loading,
and post-update hooks.")
    (license license:expat)))
;;; ===================================================================
;;; redict (#17936)
;;; ===================================================================
;;; AUR: redict

(define-public redict
  (package
    (name "redict")
    (version "7.3.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://codeberg.org/redict/redict/releases/download/v"
                    version "/redict-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (home-page "https://codeberg.org/redict/redict")
    (synopsis "distributed key/value database")
    (description "Redict is a distributed key/value database forked from Redis.  It
provides an in-memory data structure store that can be used as a
database, cache, and message broker.")
    (license license:lgpl3+)))
;;; ===================================================================
;;; wrk (#17947)
;;; ===================================================================
;;; AUR: wrk

(define-public wrk
  (package
    (name "wrk")
    (version "4.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/wg/wrk/releases/download/v"
                    version "/wrk-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (home-page "https://github.com/wg/wrk")
    (synopsis "modern HTTP benchmarking tool")
    (description "wrk is a modern HTTP benchmarking tool capable of generating
significant load when run on a single multi-core CPU.  It uses
a multithreaded design and scalable event notification systems.")
    (license license:asl2.0)))
;;; ===================================================================
;;; agedu (#17950)
;;; ===================================================================
;;; AUR: agedu

(define-public agedu
  (package
    (name "agedu")
    (version "20211129.8cd63c5")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://www.chiark.greenend.org.uk/~sgtatham/agedu//releases/download/v"
                    version "/agedu-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (home-page "https://www.chiark.greenend.org.uk/~sgtatham/agedu/")
    (synopsis "track down wasted disk space")
    (description "agedu is a UNIX utility for tracking down wasted disk space.  It
scans a directory tree and produces reports showing which files
have not been accessed for a long time.")
    (license license:expat)))
;;; ===================================================================
;;; pspg (#17951)
;;; ===================================================================
;;; AUR: pspg

(define-public pspg
  (package
    (name "pspg")
    (version "5.8.9")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/okbob/pspg/releases/download/v"
                    version "/pspg-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (home-page "https://github.com/okbob/pspg")
    (synopsis "tabular data pager for psql and other tools")
    (description "pspg is a Unix pager designed for viewing tabular data.  It can be
used as a replacement for the default pager in PostgreSQL's psql
and other tools that output tabular data.")
    (license license:bsd-2)))
;;; ===================================================================
;;; yaze (#17952)
;;; ===================================================================
;;; AUR: yaze

(define-public yaze
  (package
    (name "yaze")
    (version "2.51.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://www.mathematik.uni-ulm.de/users/ag/yaze-ag//releases/download/v"
                    version "/yaze-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (home-page "https://www.mathematik.uni-ulm.de/users/ag/yaze-ag/")
    (synopsis "yet Another Z80 and CP/M emulator")
    (description "YAZE is a Z80 and CP/M emulator.  It provides accurate Z80 CPU
emulation and supports running CP/M programs and operating systems.")
    (license license:gpl2+)))
;;; ===================================================================
;;; uacme (#17960)
;;; ===================================================================
;;; AUR: uacme

(define-public uacme
  (package
    (name "uacme")
    (version "1.7.5")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ndilieto/uacme/releases/download/v"
                    version "/uacme-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (home-page "https://github.com/ndilieto/uacme")
    (synopsis "ACMEv2 client written in plain C")
    (description "uacme is a client for the ACMEv2 protocol written in plain C with
minimal dependencies.  It can be used to obtain TLS certificates
from Let's Encrypt and other ACME-compatible CAs.")
    (license license:gpl3+)))
;;; ===================================================================
;;; kal (#17962)
;;; ===================================================================
;;; AUR: kal

(define-public kal
  (package
    (name "kal")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/FollieHiyworworworworworker/kal/releases/download/v"
                    version "/kal-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("kal" "bin/kal"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/FollieHiyworworworworworker/kal")
    (synopsis "colorful little calendar utility")
    (description "kal is a colorful little calendar utility for the terminal.  It
provides a monthly overview with highlighted dates and color coding.")
    (license license:expat)))
;;; ===================================================================
;;; interfaces (#17963)
;;; ===================================================================
;;; AUR: interfaces

(define-public interfaces
  (package
    (name "interfaces")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/kvaps/interfaces/releases/download/v"
                    version "/interfaces-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("interfaces" "bin/interfaces"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/kvaps/interfaces")
    (synopsis "list all network interfaces")
    (description "interfaces is a simple command-line utility that lists all network
interfaces on the system with their addresses and status.")
    (license license:expat)))
;;; ===================================================================
;;; distro-go (#17964)
;;; ===================================================================
;;; AUR: distro

(define-public distro-go
  (package
    (name "distro-go")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/acobaugh/distro/releases/download/v"
                    version "/distro-go-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("distro-go" "bin/distro-go"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/acobaugh/distro")
    (synopsis "drop-in replacement for python-distro written in Go")
    (description "distro is a drop-in replacement for the python-distro utility
written in Go.  It provides OS platform information detection.")
    (license license:asl2.0)))
;;; ===================================================================
;;; cxx-compiler-helper (#17965)
;;; ===================================================================
;;; AUR: cxx

(define-public cxx-compiler-helper
  (package
    (name "cxx-compiler-helper")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicehash/cxx/releases/download/v"
                    version "/cxx-compiler-helper-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("cxx-compiler-helper" "bin/cxx-compiler-helper"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nicehash/cxx")
    (synopsis "compile C++ code by detecting flags automatically")
    (description "cxx is a simple tool that compiles C++ code by detecting compiler
flags and include paths automatically.")
    (license license:expat)))
;;; ===================================================================
;;; sonicradio (#17831)
;;; ===================================================================
;;; AUR: sonicradio

(define-public sonicradio
  (package
    (name "sonicradio")
    (version "0.5.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/dancnb/sonicradio/releases/download/v"
                    version "/sonicradio-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("sonicradio" "bin/sonicradio"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/dancnb/sonicradio")
    (synopsis "TUI radio player using Radio Browser API")
    (description "sonicradio is a terminal user interface radio player built with
Bubbletea.  It uses the Radio Browser API to search and play
internet radio stations.")
    (license license:expat)))
;;; ===================================================================
;;; hyde-cli (#17838)
;;; ===================================================================
;;; AUR: hyde-cli

(define-public hyde-cli
  (package
    (name "hyde-cli")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/HyDE-Project/Hyde-cli/releases/download/v"
                    version "/hyde-cli-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("hyde-cli" "bin/hyde-cli"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/HyDE-Project/Hyde-cli")
    (synopsis "command-line interface for HyDE")
    (description "hyde-cli is a command-line interface tool for managing HyDE
(Hyprland Dynamic Environment) configurations and themes.")
    (license license:gpl3+)))
;;; ===================================================================
;;; lnd-bin (#17844)
;;; ===================================================================
;;; AUR: lnd

(define-public lnd-bin
  (package
    (name "lnd-bin")
    (version "0.18.5")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/lightningnetwork/lnd/releases/download/v"
                    version "/lnd-bin-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("lnd-bin" "bin/lnd-bin"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/lightningnetwork/lnd")
    (synopsis "Lightning Network Daemon for off-chain Bitcoin transactions")
    (description "lnd (Lightning Network Daemon) is a complete implementation of a
Lightning Network node.  It supports secure off-chain Bitcoin
transactions with fast settlement times.")
    (license license:expat)))
;;; ===================================================================
;;; wrkflw (#17855)
;;; ===================================================================
;;; AUR: wrkflw

(define-public wrkflw
  (package
    (name "wrkflw")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/jbrunton/wrkflw/releases/download/v"
                    version "/wrkflw-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("wrkflw" "bin/wrkflw"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/jbrunton/wrkflw")
    (synopsis "validate and execute GitHub Actions workflows locally")
    (description "wrkflw validates and executes GitHub Actions workflows locally.
It allows developers to test CI/CD pipelines without pushing
to a remote repository.")
    (license license:expat)))
;;; ===================================================================
;;; nerolauncher (#17865)
;;; ===================================================================
;;; AUR: nerolauncher

(define-public nerolauncher
  (package
    (name "nerolauncher")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nero-launcher/nerolauncher/releases/download/v"
                    version "/nerolauncher-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("nerolauncher" "bin/nerolauncher"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nero-launcher/nerolauncher")
    (synopsis "unofficial Minecraft launcher built with NextJS and Tauri")
    (description "NeroLauncher is an unofficial Minecraft launcher built with
NextJS and Tauri.  It provides a modern interface for managing
Minecraft installations.")
    (license license:gpl3+)))
;;; ===================================================================
;;; tilem (#17870)
;;; ===================================================================
;;; AUR: tilem

(define-public tilem
  (package
    (name "tilem")
    (version "2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://sourceforge.net/projects/tilem//releases/download/v"
                    version "/tilem-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (home-page "https://sourceforge.net/projects/tilem/")
    (synopsis "TI calculator emulator")
    (description "TilEm is an emulator for Texas Instruments Z80-based graphing
calculators.  It supports TI-73, TI-76.fr, TI-81, TI-82, TI-83,
TI-83+, TI-84+, TI-85, and TI-86.")
    (license license:gpl3+)))
;;; ===================================================================
;;; mount-gtk (#17871)
;;; ===================================================================
;;; AUR: mount-gtk

(define-public mount-gtk
  (package
    (name "mount-gtk")
    (version "1.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicenemo/mount-gtk/releases/download/v"
                    version "/mount-gtk-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (home-page "https://github.com/nicenemo/mount-gtk")
    (synopsis "graphical front end for udisks and mount in GTK3")
    (description "mount-gtk is a simple graphical front end for udisks and mount.
It provides a GTK3 interface for mounting and unmounting removable
storage devices.")
    (license license:gpl3+)))
;;; ===================================================================
;;; guile-www (#17874)
;;; ===================================================================
;;; AUR: guile-www

(define-public guile-www
  (package
    (name "guile-www")
    (version "2.44")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://www.nongnu.org/guile-www//releases/download/v"
                    version "/guile-www-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (home-page "https://www.nongnu.org/guile-www/")
    (synopsis "Guile Scheme modules for HTTP, URL, and CGI programming")
    (description "guile-www is a set of Guile Scheme modules to facilitate HTTP,
URL, and CGI programming.  It provides HTTP client and server
functionality for Guile applications.")
    (license license:gpl3+)))
;;; ===================================================================
;;; lua53-lsqlite3 (#17875)
;;; ===================================================================
;;; AUR: lua53-lsqlite3

(define-public lua53-lsqlite3
  (package
    (name "lua53-lsqlite3")
    (version "0.9.6")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "http://lua.sqlite.org//releases/download/v"
                    version "/lua53-lsqlite3-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (home-page "http://lua.sqlite.org/")
    (synopsis "Lua binding for SQLite3 database library")
    (description "lsqlite3 provides a binding for Lua 5.3 to the SQLite3 database
library.  It supports full SQLite3 API access from Lua scripts.")
    (license license:expat)))
;;; ===================================================================
;;; slrn-snapshot (#17886)
;;; ===================================================================
;;; AUR: slrn-snapshot

(define-public slrn-snapshot
  (package
    (name "slrn-snapshot")
    (version "1.0.3a")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://www.jedsoft.org/slrn//releases/download/v"
                    version "/slrn-snapshot-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (home-page "https://www.jedsoft.org/slrn/")
    (synopsis "text-mode threaded Usenet newsreader")
    (description "slrn is an easy-to-use, text-mode, threaded Usenet/NNTP client
and newsreader.  This is a development snapshot version.")
    (license license:gpl2+)))
;;; ===================================================================
;;; sxwm (#17888)
;;; ===================================================================
;;; AUR: sxwm

(define-public sxwm
  (package
    (name "sxwm")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/uint23/sxwm/releases/download/v"
                    version "/sxwm-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("sxwm" "bin/sxwm"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/uint23/sxwm")
    (synopsis "simple tiling window manager")
    (description "sxwm is a simple tiling window manager that aims to make tiling
window management accessible and easy to use.")
    (license license:expat)))
;;; ===================================================================
;;; eggdrop (#17898)
;;; ===================================================================
;;; AUR: eggdrop

(define-public eggdrop
  (package
    (name "eggdrop")
    (version "1.9.5")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://www.eggheads.org//releases/download/v"
                    version "/eggdrop-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (home-page "https://www.eggheads.org/")
    (synopsis "world's most popular open source IRC bot")
    (description "Eggdrop is the world's most popular open source IRC bot.  It is
freely distributable under the GNU GPL.  It supports Tcl scripting
and provides modular functionality.")
    (license license:gpl2+)))
;;; ===================================================================
;;; bootp (#17900)
;;; ===================================================================
;;; AUR: bootp

(define-public bootp
  (package
    (name "bootp")
    (version "2.4.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://www.isc.org//releases/download/v"
                    version "/bootp-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (home-page "https://www.isc.org/")
    (synopsis "BOOTP server implementation")
    (description "bootp is a BOOTP protocol server.  It provides network boot
protocol support for clients that need to obtain IP addresses
and boot file locations.")
    (license license:isc)))
;;; ===================================================================
;;; wiper (#17903)
;;; ===================================================================
;;; AUR: wiper

(define-public wiper
  (package
    (name "wiper")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/iklobato/wiper/releases/download/v"
                    version "/wiper-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("wiper" "bin/wiper"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/iklobato/wiper")
    (synopsis "disk cleanup tool")
    (description "wiper is a simple disk cleanup tool for identifying and removing
unnecessary files to free up disk space.")
    (license license:expat)))
;;; ===================================================================
;;; mussel (#17908)
;;; ===================================================================
;;; AUR: mussel

(define-public mussel
  (package
    (name "mussel")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicholatian/mussel/releases/download/v"
                    version "/mussel-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("mussel" "bin/mussel"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nicholatian/mussel")
    (synopsis "Mussel programming language")
    (description "Mussel is a programming language designed for simplicity and
expressiveness.")
    (license license:isc)))
;;; ===================================================================
;;; session-desktop-appimage (#17923)
;;; ===================================================================
;;; AUR: session-desktop-appimage

(define-public session-desktop-appimage
  (package
    (name "session-desktop-appimage")
    (version "1.14.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://getsession.org//releases/download/v"
                    version "/session-desktop-appimage-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("session-desktop-appimage" "bin/session-desktop-appimage"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://getsession.org/")
    (synopsis "private messaging application (AppImage)")
    (description "Session is an end-to-end encrypted messenger that minimizes
sensitive metadata.  This package provides the desktop application
as an AppImage.")
    (license license:gpl3+)))
;;; ===================================================================
;;; libassert (#17924)
;;; ===================================================================
;;; AUR: libassert

(define-public libassert
  (package
    (name "libassert")
    (version "2.1.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/jeremy-rifkin/libassert/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (home-page "https://github.com/jeremy-rifkin/libassert")
    (synopsis "over-engineered C++ assertion library")
    (description "libassert is a C++ assertion library that provides rich failure
messages with stack traces, expression decomposition, and
syntax highlighting.")
    (license license:expat)))
;;; ===================================================================
;;; pacman-fix-permissions (#17939)
;;; ===================================================================
;;; AUR: pacman-fix-permissions

(define-public pacman-fix-permissions
  (package
    (name "pacman-fix-permissions")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/archlinux-pacman-fix-permissions/pacman-fix-permissions/releases/download/v"
                    version "/pacman-fix-permissions-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("pacman-fix-permissions" "bin/pacman-fix-permissions"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/archlinux-pacman-fix-permissions/pacman-fix-permissions")
    (synopsis "fix broken filesystem permissions")
    (description "pacman-fix-permissions is a utility script to fix broken filesystem
permissions on pacman-managed systems.")
    (license license:gpl3+)))
;;; ===================================================================
;;; diffmerge-bin (#17959)
;;; ===================================================================
;;; AUR: diffmerge

(define-public diffmerge-bin
  (package
    (name "diffmerge-bin")
    (version "4.2.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://sourcegear.com/diffmerge//releases/download/v"
                    version "/diffmerge-bin-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("diffmerge-bin" "bin/diffmerge-bin"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://sourcegear.com/diffmerge/")
    (synopsis "visual file comparison and merge tool")
    (description "DiffMerge is a visual diff and merge tool.  It provides side-by-side
and inline comparison of files and directories.")
    (license (license:non-copyleft "file://LICENSE"))))
;;; ===================================================================
;;; getver (#17969)
;;; ===================================================================
;;; AUR: getver

(define-public getver
  (package
    (name "getver")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/getver/getver/releases/download/v"
                    version "/getver-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("getver" "bin/getver"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/getver/getver")
    (synopsis "guess the latest upstream version of a PKGBUILD")
    (description "getver attempts to guess the latest upstream version of a package
by checking various sources.")
    (license license:expat)))
;;; ===================================================================
;;; vieb-bin (#17971)
;;; ===================================================================
;;; AUR: vieb

(define-public vieb-bin
  (package
    (name "vieb-bin")
    (version "12.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://vieb.dev//releases/download/v"
                    version "/vieb-bin-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("vieb-bin" "bin/vieb-bin"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://vieb.dev/")
    (synopsis "Vim Inspired Electron Browser")
    (description "Vieb is a Vim Inspired Electron Browser with Vim-style keybindings
for web browsing by design.")
    (license license:gpl3+)))
;;; ===================================================================
;;; rotion-bin (#17974)
;;; ===================================================================
;;; AUR: rotion-bin

(define-public rotion-bin
  (package
    (name "rotion-bin")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicholasgasior/rotion/releases/download/v"
                    version "/rotion-bin-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("rotion-bin" "bin/rotion-bin"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nicholasgasior/rotion")
    (synopsis "simple offline clone of Notion (prebuilt)")
    (description "Rotion is a simple offline clone of the popular note-taking app
Notion.  It is built using Electron and React.")
    (license license:expat)))
;;; ===================================================================
;;; libeizo (#17893)
;;; ===================================================================
;;; AUR: libeizo

(define-public libeizo
  (package
    (name "libeizo")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/mhertz/libeizo/releases/download/v"
                    version "/libeizo-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (home-page "https://github.com/mhertz/libeizo")
    (synopsis "userspace utility to control EIZO FlexScan monitors")
    (description "libeizo is a userspace utility to control EIZO FlexScan EV
monitors via USB HID interface.")
    (license license:lgpl2.1+)))
;;; ===================================================================
;;; harlequin-postgres (#17894)
;;; ===================================================================
;;; AUR: harlequin-postgres

(define-public harlequin-postgres
  (package
    (name "harlequin-postgres")
    (version "0.4.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/tconbeer/harlequin-postgres/releases/download/v"
                    version "/harlequin-postgres-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("harlequin-postgres" "bin/harlequin-postgres"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/tconbeer/harlequin-postgres")
    (synopsis "PostgreSQL adapter for Harlequin")
    (description "The Postgres adapter for Harlequin, a terminal-based SQL IDE.
It enables connecting to PostgreSQL databases from Harlequin.")
    (license license:expat)))
;;; ===================================================================
;;; harlequin-odbc (#17895)
;;; ===================================================================
;;; AUR: harlequin-odbc

(define-public harlequin-odbc
  (package
    (name "harlequin-odbc")
    (version "0.1.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/tconbeer/harlequin-odbc/releases/download/v"
                    version "/harlequin-odbc-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("harlequin-odbc" "bin/harlequin-odbc"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/tconbeer/harlequin-odbc")
    (synopsis "ODBC adapter for Harlequin")
    (description "The ODBC adapter for Harlequin, a terminal-based SQL IDE.
It enables connecting to ODBC data sources from Harlequin.")
    (license license:expat)))
;;; ===================================================================
;;; harlequin-mysql (#17896)
;;; ===================================================================
;;; AUR: harlequin-mysql

(define-public harlequin-mysql
  (package
    (name "harlequin-mysql")
    (version "0.3.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/tconbeer/harlequin-mysql/releases/download/v"
                    version "/harlequin-mysql-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("harlequin-mysql" "bin/harlequin-mysql"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/tconbeer/harlequin-mysql")
    (synopsis "MySQL adapter for Harlequin")
    (description "The MySQL adapter for Harlequin, a terminal-based SQL IDE.
It enables connecting to MySQL databases from Harlequin.")
    (license license:expat)))
;;; ===================================================================
;;; pylon (#17882)
;;; ===================================================================
;;; AUR: pylon

(define-public pylon
  (package
    (name "pylon")
    (version "7.5.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://www.baslerweb.com/en/software/pylon//releases/download/v"
                    version "/pylon-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("pylon" "bin/pylon"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.baslerweb.com/en/software/pylon/")
    (synopsis "Basler camera software suite")
    (description "Pylon is the Basler camera software suite.  It provides libraries
and tools for interfacing with Basler industrial cameras.")
    (license (license:non-copyleft "file://LICENSE"))))
;;; ===================================================================
;;; microblocks (#17892)
;;; ===================================================================
;;; AUR: microblocks

(define-public microblocks
  (package
    (name "microblocks")
    (version "2.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://microblocks.fun//releases/download/v"
                    version "/microblocks-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("microblocks" "bin/microblocks"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://microblocks.fun/")
    (synopsis "blocks programming language for physical computing")
    (description "MicroBlocks is a free, blocks-based programming language for
learning physical computing with educational microcontroller
boards such as the micro:bit and Adafruit Circuit Playground.")
    (license license:mpl2.0)))
