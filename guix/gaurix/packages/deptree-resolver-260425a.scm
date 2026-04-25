;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Dep-tree resolver pass --- deptree-resolver-260425a
;;; Resolves 100 BLOCKED packages via dependency-tree priority.
;;;
;;; New recipes (6): secho, openjlc-bin, roon-tui-bin,
;;;   openstack-tui-bin, blahaj-bin, cosu-trainer-bin
;;; Already resolved (2): quickenv-bin (recipe-resolver-260418e),
;;;   playit-bin (recipe-resolver-260408o)
;;; AUR repo deleted: 10 (re-confirmed from prior pass)
;;; Remaining BLOCKED: 82 packages (see blocked-notes)

(define-module (gaurix packages deptree-resolver-260425a)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system trivial)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages elf)
  #:use-module (gnu packages gcc)
  #:export (secho
            openjlc-bin
            roon-tui-bin
            openstack-tui-bin
            blahaj-bin
            cosu-trainer-bin))


;;; ---- 1. secho ----
;;; AUR #26 -- A dramatic, colorful, emotionally unstable replacement for echo.
;;; Source: GitHub tarball, simple Makefile (gcc + make).
;;; License: GPL-3.0+

(define-public secho
  (package
    (name "secho")
    (version "1.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/CodeFlowShai/secho/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "1ixvqn69mx84ibcbq73l7vg4zziinqabfch8a120q3zaq4n39mgm"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:make-flags
      #~(list (string-append "DESTDIR=" #$output)
              "CC=gcc")
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (let ((bin (string-append (assoc-ref outputs "out") "/bin")))
                (install-file "secho" bin)))))))
    (synopsis "colorful, emotionally unstable replacement for echo")
    (description
     "Secho is a dramatic, colorful, emotionally unstable replacement for
@command{echo}.  It outputs text with random colors and emotional flair.")
    (home-page "https://github.com/CodeFlowShai/secho")
    (license license:gpl3+)))


;;; ---- 2. openjlc-bin ----
;;; AUR #34 -- Ultra-fast Gerber conversion tool written in Rust.
;;; Prebuilt x86_64 Linux binary from GitHub releases.
;;; License: MIT

(define-public openjlc-bin
  (package
    (name "openjlc-bin")
    (version "2.23.7")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nextjlc/openjlc/releases/download/v"
                    version "/openjlc-x86_64-unknown-linux-gnu"))
              (sha256
               (base32
                "0v24qsbnlqcy7h6scm57lc41sg5h05m6k29i9hw4pygl3jpl7c77"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out #$output)
                 (bin (string-append out "/bin"))
                 (patchelf (search-input-file %build-inputs "/bin/patchelf"))
                 (ld-so (search-input-file %build-inputs
                                           "/lib/ld-linux-x86-64.so.2"))
                 (rpath (string-join
                         (list (dirname ld-so)
                               (dirname
                                (search-input-file %build-inputs
                                                   "/lib/libgcc_s.so.1"))
                               (dirname
                                (search-input-file %build-inputs
                                                   "/lib/libzstd.so.1"))
                               (dirname
                                (search-input-file %build-inputs
                                                   "/lib/libz.so.1")))
                         ":")))
            (mkdir-p bin)
            (copy-file (assoc-ref %build-inputs "source")
                       (string-append bin "/openjlc"))
            (chmod (string-append bin "/openjlc") #o755)
            (invoke patchelf "--set-interpreter" ld-so
                    (string-append bin "/openjlc"))
            (invoke patchelf "--set-rpath" rpath
                    (string-append bin "/openjlc"))))))
    (native-inputs (list patchelf))
    (inputs (list `(,gcc "lib") glibc `(,zstd "lib") zlib))
    (supported-systems '("x86_64-linux"))
    (synopsis "ultra-fast Gerber conversion tool")
    (description
     "OpenJLC is an ultra-fast Gerber conversion tool written in Rust.
It converts PCB Gerber files for manufacturing services.")
    (home-page "https://github.com/canmi21/openjlc")
    (license license:expat)))


;;; ---- quickenv-bin ----
;;; ALREADY_RESOLVED: recipe exists in recipe-resolver-260418e.scm


;;; ---- 4. roon-tui-bin ----
;;; AUR #25 -- A Roon Remote for the terminal.
;;; Prebuilt x86_64 Linux binary from GitHub releases.
;;; License: MIT

(define-public roon-tui-bin
  (package
    (name "roon-tui-bin")
    (version "0.3.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/TheAppgineer/roon-tui/releases/download/"
                    version "/stable-x86_64-unknown-linux-gnu.tar.gz"))
              (sha256
               (base32
                "0k3z7r2mw3s7bsri16x718c6adbvm5a072smc7cxg2awbnlgikih"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out #$output)
                 (bin (string-append out "/bin"))
                 (tar (search-input-file %build-inputs "/bin/tar"))
                 (gzip (search-input-file %build-inputs "/bin/gzip"))
                 (patchelf (search-input-file %build-inputs "/bin/patchelf"))
                 (ld-so (search-input-file %build-inputs
                                           "/lib/ld-linux-x86-64.so.2"))
                 (rpath (string-join
                         (list (dirname ld-so)
                               (dirname
                                (search-input-file %build-inputs
                                                   "/lib/libgcc_s.so.1")))
                         ":")))
            (setenv "PATH" (string-append (dirname tar) ":"
                                          (dirname gzip)))
            (invoke tar "xf" (assoc-ref %build-inputs "source"))
            (mkdir-p bin)
            (copy-file "roon-tui" (string-append bin "/roon-tui"))
            (chmod (string-append bin "/roon-tui") #o755)
            (invoke patchelf "--set-interpreter" ld-so
                    (string-append bin "/roon-tui"))
            (invoke patchelf "--set-rpath" rpath
                    (string-append bin "/roon-tui"))))))
    (native-inputs (list patchelf tar gzip))
    (inputs (list `(,gcc "lib") glibc))
    (supported-systems '("x86_64-linux"))
    (synopsis "roon remote for the terminal")
    (description
     "Roon TUI is a terminal user interface for controlling Roon music
players.  It provides a text-based remote control for managing your Roon
audio system.")
    (home-page "https://github.com/TheAppgineer/roon-tui")
    (license license:expat)))


;;; ---- 5. openstack-tui-bin ----
;;; AUR #49 -- Terminal User Interface for OpenStack.
;;; Prebuilt x86_64 Linux binary from GitHub releases.
;;; License: Apache-2.0

(define-public openstack-tui-bin
  (package
    (name "openstack-tui-bin")
    (version "0.13.5")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/gtema/openstack/releases/download/"
                    "openstack_tui-v" version
                    "/openstack_tui-x86_64-unknown-linux-gnu.tar.xz"))
              (sha256
               (base32
                "195yw0jwragy6wqqv558i05l37b370jfck51g851v7h9fmbbkjd3"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out #$output)
                 (bin (string-append out "/bin"))
                 (tar (search-input-file %build-inputs "/bin/tar"))
                 (xz (search-input-file %build-inputs "/bin/xz"))
                 (patchelf (search-input-file %build-inputs "/bin/patchelf"))
                 (ld-so (search-input-file %build-inputs
                                           "/lib/ld-linux-x86-64.so.2"))
                 (rpath (string-join
                         (list (dirname ld-so)
                               (dirname
                                (search-input-file %build-inputs
                                                   "/lib/libgcc_s.so.1")))
                         ":")))
            (setenv "PATH" (string-append (dirname tar) ":"
                                          (dirname xz)))
            (invoke tar "xf" (assoc-ref %build-inputs "source"))
            (mkdir-p bin)
            (copy-file "openstack_tui-x86_64-unknown-linux-gnu/ostui"
                       (string-append bin "/ostui"))
            (chmod (string-append bin "/ostui") #o755)
            (invoke patchelf "--set-interpreter" ld-so
                    (string-append bin "/ostui"))
            (invoke patchelf "--set-rpath" rpath
                    (string-append bin "/ostui"))))))
    (native-inputs (list patchelf tar xz))
    (inputs (list `(,gcc "lib") glibc))
    (supported-systems '("x86_64-linux"))
    (synopsis "terminal user interface for OpenStack")
    (description
     "OpenStack TUI is a terminal user interface for managing OpenStack cloud
infrastructure.  It provides an interactive text-based interface for common
OpenStack operations.")
    (home-page "https://github.com/gtema/openstack")
    (license license:asl2.0)))


;;; ---- playit-bin ----
;;; ALREADY_RESOLVED: recipe exists in recipe-resolver-260408o.scm


;;; ---- 7. blahaj-bin ----
;;; AUR #29 -- Gay sharks at your local terminal (lolcat-like CLI tool).
;;; Prebuilt statically-linked x86_64 Linux binary from GitHub releases.
;;; License: BSD-2-Clause

(define-public blahaj-bin
  (package
    (name "blahaj-bin")
    (version "2.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/GeopJr/BLAHAJ/releases/download/v"
                    version "/blahaj-" version
                    "-linux-x86_64-static.zip"))
              (sha256
               (base32
                "1bmrn5wcw2vhvmdi6l213mhc80v48kg7rcqwkq363aqngcs2in9y"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("blahaj" "bin/blahaj"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (native-inputs (list unzip))
    (supported-systems '("x86_64-linux"))
    (synopsis "gay sharks at your terminal, a lolcat-like CLI tool")
    (description
     "BLAHAJ is a lolcat-like CLI tool that colorizes text with pride flag
colors.  It pipes text through rainbow gradients inspired by IKEA's BLAHAJ
shark plushie.")
    (home-page "https://blahaj.geopjr.dev")
    (license license:bsd-2)))


;;; ---- 8. cosu-trainer-bin ----
;;; AUR #7 -- Change various parameters of an osu! map easily.
;;; Prebuilt AppImage from GitHub releases.
;;; License: GPL-3.0-only

(define-public cosu-trainer-bin
  (package
    (name "cosu-trainer-bin")
    (version "0.15")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/hwsmm/cosutrainer/releases/download/"
                    version "/cosu-trainer-bin.tar.zst"))
              (sha256
               (base32
                "1mbja62q5fykg0s4cvpwz6p9rxknghh6xjzkhh53lb9h9jfi876v"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out #$output)
                 (bin (string-append out "/bin"))
                 (tar (search-input-file %build-inputs "/bin/tar"))
                 (zstd-bin (search-input-file %build-inputs "/bin/zstd")))
            (setenv "PATH" (string-append (dirname tar) ":"
                                          (dirname zstd-bin)))
            (invoke tar "--use-compress-program=zstd" "-xf"
                    (assoc-ref %build-inputs "source"))
            (mkdir-p bin)
            (for-each
             (lambda (f)
               (when (file-exists? f)
                 (copy-file f (string-append bin "/" (basename f)))
                 (chmod (string-append bin "/" (basename f)) #o755)))
             (list "cosu-trainer-x86_64.AppImage"
                   "cosu-cleanup"
                   "osumem"))))))
    (native-inputs (list tar zstd))
    (supported-systems '("x86_64-linux"))
    (synopsis "change various parameters of an osu! map easily")
    (description
     "Cosu Trainer is a tool for changing various parameters of osu! beatmaps.
It provides utilities for modifying map difficulty settings and other
parameters.")
    (home-page "https://github.com/hwsmm/cosutrainer")
    (license license:gpl3)))
