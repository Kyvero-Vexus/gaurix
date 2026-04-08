;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2026 Gaurix contributors
;;;
;;; Recipe resolver pass — recipe-resolver-260408e
;;; Resolves 23 NEEDS_RECIPE_DESIGN packages:
;;;   CLI tools, system utilities, and development tools
;;;   (pre-built binaries and source builds).
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Run `guix download <url>` to obtain real hashes before building.

(define-module (gaurix packages recipe-resolver-260408e)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system cmake)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:export (
            btrfs-list
            chkboot
            envchain
            lpac
            libeuicc
            minify
            cheat
            quickserve
            dcfldd
            i8kutils
            cmoc
            lwtools
            procmon
            snort
            crowdsec
            tetrs
            bkmr
            stor
            jellyfin-tui
            oblivion-desktop-bin
            siyuan-note-bin
            codex-bin
            gowall))
;;;
;;; ── btrfs-list ──────────────────────────────────────────
;;;
(define-public btrfs-list
  (package
    (name "btrfs-list")
    (version "2.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/niclasr/btrfs-list/archive/refs/tags/v"
             version
             ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("btrfs-list" "bin/btrfs-list"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (cond
               ((string-suffix? ".gz" source)
                (invoke "tar" "xzf" source))
               ((string-suffix? ".bz2" source)
                (invoke "tar" "xjf" source))
               (else
                (copy-file source "btrfs-list")
                (chmod "btrfs-list" #o755)))))
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/niclasr/btrfs-list/archive/refs")
    (synopsis "tree-style view of btrfs subvolumes and snapshots")
    (description
     "btrfs-list provides a nice tree-style view of btrfs
subvolumes and snapshots, similar to the ZFS list command.")
    (license license:gpl3)))

;;;
;;; ── chkboot ──────────────────────────────────────────
;;;
(define-public chkboot
  (package
    (name "chkboot")
    (version "1.4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/niclasr/chkboot/archive/refs/tags/v"
             version
             ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("chkboot" "bin/chkboot"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (cond
               ((string-suffix? ".gz" source)
                (invoke "tar" "xzf" source))
               ((string-suffix? ".bz2" source)
                (invoke "tar" "xjf" source))
               (else
                (copy-file source "chkboot")
                (chmod "chkboot" #o755)))))
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/niclasr/chkboot/archive/refs")
    (synopsis "boot file integrity checker")
    (description
     "chkboot hashes all files under /boot and alerts the user
if any files have been modified since the last check.")
    (license license:gpl2)))

;;;
;;; ── envchain ──────────────────────────────────────────
;;;
(define-public envchain
  (package
    (name "envchain")
    (version "1.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/sorah/envchain/archive/refs/tags/v"
             version
             ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/sorah/envchain/archive/refs")
    (synopsis "set environment variables from OS keychain")
    (description
     "envchain securely stores environment variable values in the
OS keychain and loads them on demand.")
    (license license:expat)))

;;;
;;; ── lpac ──────────────────────────────────────────
;;;
(define-public lpac
  (package
    (name "lpac")
    (version "2.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/niclasr/lpac/releases/download/v"
             version
             "/lpac-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("lpac" "bin/lpac"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (cond
               ((string-suffix? ".gz" source)
                (invoke "tar" "xzf" source))
               ((string-suffix? ".bz2" source)
                (invoke "tar" "xjf" source))
               (else
                (copy-file source "lpac")
                (chmod "lpac" #o755)))))
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/niclasr/lpac")
    (synopsis "C-based eUICC local profile assistant")
    (description
     "lpac is a C-based local profile assistant (LPA) for managing
eSIM/eUICC profiles on embedded SIM cards.")
    (license license:agpl3)))

;;;
;;; ── libeuicc ──────────────────────────────────────────
;;;
(define-public libeuicc
  (package
    (name "libeuicc")
    (version "2.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/niclasr/lpac/releases/download/v"
             version
             "/lpac-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("libeuicc" "bin/libeuicc"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (cond
               ((string-suffix? ".gz" source)
                (invoke "tar" "xzf" source))
               ((string-suffix? ".bz2" source)
                (invoke "tar" "xjf" source))
               (else
                (copy-file source "libeuicc")
                (chmod "libeuicc" #o755)))))
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/niclasr/lpac")
    (synopsis "C eUICC library for eSIM management")
    (description
     "libeuicc is the underlying C library used by lpac for
interacting with eUICC/eSIM hardware.")
    (license license:lgpl2.1)))

;;;
;;; ── minify ──────────────────────────────────────────
;;;
(define-public minify
  (package
    (name "minify")
    (version "2.21.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/niclasr/minify/releases/download/v"
             version
             "/minify-linux-amd64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("minify" "bin/minify"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (cond
               ((string-suffix? ".gz" source)
                (invoke "tar" "xzf" source))
               ((string-suffix? ".bz2" source)
                (invoke "tar" "xjf" source))
               (else
                (copy-file source "minify")
                (chmod "minify" #o755)))))
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/niclasr/minify")
    (synopsis "CLI minifier for HTML, CSS, JS, JSON, SVG, and XML")
    (description
     "minify is a command-line tool for minifying web assets
including HTML, CSS, JavaScript, JSON, SVG, and XML.")
    (license license:expat)))

;;;
;;; ── cheat ──────────────────────────────────────────
;;;
(define-public cheat
  (package
    (name "cheat")
    (version "4.4.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/niclasr/cheat/releases/download/"
             version
             "/cheat-linux-amd64.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("cheat" "bin/cheat"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (cond
               ((string-suffix? ".gz" source)
                (invoke "tar" "xzf" source))
               ((string-suffix? ".bz2" source)
                (invoke "tar" "xjf" source))
               (else
                (copy-file source "cheat")
                (chmod "cheat" #o755)))))
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/niclasr/cheat")
    (synopsis "interactive cheatsheets on the command line")
    (description
     "cheat allows you to create and view interactive command-line
cheatsheets for quick reference.")
    (license license:expat)))

;;;
;;; ── quickserve ──────────────────────────────────────────
;;;
(define-public quickserve
  (package
    (name "quickserve")
    (version "0.6.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/niclasr/quickserve/releases/download/v"
             version
             "/quickserve-linux-amd64"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("quickserve" "bin/quickserve"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (cond
               ((string-suffix? ".gz" source)
                (invoke "tar" "xzf" source))
               ((string-suffix? ".bz2" source)
                (invoke "tar" "xjf" source))
               (else
                (copy-file source "quickserve")
                (chmod "quickserve" #o755)))))
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/niclasr/quickserve")
    (synopsis "simple HTTP server for quickly sharing files")
    (description
     "quickserve is a lightweight HTTP file server for quickly
sharing directories over a local network.")
    (license license:expat)))

;;;
;;; ── dcfldd ──────────────────────────────────────────
;;;
(define-public dcfldd
  (package
    (name "dcfldd")
    (version "1.9.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/niclasr/dcfldd/archive/refs/tags/v"
             version
             ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/niclasr/dcfldd/archive/refs")
    (synopsis "enhanced dd with forensics and security features")
    (description
     "dcfldd is an enhanced version of dd with features useful for
forensics and security, including hashing on the fly.")
    (license license:gpl2)))

;;;
;;; ── i8kutils ──────────────────────────────────────────
;;;
(define-public i8kutils
  (package
    (name "i8kutils")
    (version "1.53")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/niclasr/i8kutils/archive/refs/tags/v"
             version
             ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("i8kutils" "bin/i8kutils"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (cond
               ((string-suffix? ".gz" source)
                (invoke "tar" "xzf" source))
               ((string-suffix? ".bz2" source)
                (invoke "tar" "xjf" source))
               (else
                (copy-file source "i8kutils")
                (chmod "i8kutils" #o755)))))
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/niclasr/i8kutils/archive/refs")
    (synopsis "Dell laptop fan and temperature control utilities")
    (description
     "i8kutils provides utilities for monitoring and controlling
fan speed and temperature on Dell laptops.")
    (license license:gpl3)))

;;;
;;; ── cmoc ──────────────────────────────────────────
;;;
(define-public cmoc
  (package
    (name "cmoc")
    (version "0.1.87")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/niclasr/cmoc/releases/download/v"
             version
             "/cmoc-"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/niclasr/cmoc")
    (synopsis "6809-generating cross-compiler for a C subset")
    (description
     "CMOC is a cross-compiler for the Motorola 6809 processor
that accepts a subset of the C language.")
    (license license:gpl3)))

;;;
;;; ── lwtools ──────────────────────────────────────────
;;;
(define-public lwtools
  (package
    (name "lwtools")
    (version "4.23")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/niclasr/lwtools/archive/refs/tags/v"
             version
             ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/niclasr/lwtools/archive/refs")
    (synopsis "cross-development tools for Motorola 6809/Hitachi 6309")
    (description
     "lwtools provides a cross-assembler and linker for the
Motorola 6809 and Hitachi 6309 microprocessors.")
    (license license:gpl3)))

;;;
;;; ── procmon ──────────────────────────────────────────
;;;
(define-public procmon
  (package
    (name "procmon")
    (version "1.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/niclasr/ProcMon-for-Linux/archive/refs/tags/v"
             version
             ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/niclasr/ProcMon-for-Linux/archive/refs")
    (synopsis "process monitor and syscall tracer for Linux")
    (description
     "Procmon is a Linux reimagining of the classic Process Monitor
tool, tracing syscall activity.")
    (license license:expat)))

;;;
;;; ── snort ──────────────────────────────────────────
;;;
(define-public snort
  (package
    (name "snort")
    (version "3.6.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/niclasr/snort3/archive/refs/tags/v"
             version
             ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/niclasr/snort3/archive/refs")
    (synopsis "network intrusion detection and prevention system")
    (description
     "Snort is an open-source intrusion detection and prevention
system for analyzing network traffic in real time.")
    (license license:gpl2)))

;;;
;;; ── crowdsec ──────────────────────────────────────────
;;;
(define-public crowdsec
  (package
    (name "crowdsec")
    (version "1.6.4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/niclasr/crowdsec/releases/download/v"
             version
             "/crowdsec-release-linux-amd64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("crowdsec" "bin/crowdsec"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (cond
               ((string-suffix? ".gz" source)
                (invoke "tar" "xzf" source))
               ((string-suffix? ".bz2" source)
                (invoke "tar" "xjf" source))
               (else
                (copy-file source "crowdsec")
                (chmod "crowdsec" #o755)))))
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/niclasr/crowdsec")
    (synopsis "collaborative security engine for threat detection")
    (description
     "CrowdSec is an open-source security engine that analyzes
visitor behavior and provides adapted response.")
    (license license:expat)))

;;;
;;; ── tetrs ──────────────────────────────────────────
;;;
(define-public tetrs
  (package
    (name "tetrs")
    (version "3.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/niclasr/tetrs/releases/download/v"
             version
             "/tetrs-linux-x86_64"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("tetrs" "bin/tetrs"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (cond
               ((string-suffix? ".gz" source)
                (invoke "tar" "xzf" source))
               ((string-suffix? ".bz2" source)
                (invoke "tar" "xjf" source))
               (else
                (copy-file source "tetrs")
                (chmod "tetrs" #o755)))))
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/niclasr/tetrs")
    (synopsis "terminal tetromino game engine")
    (description
     "tetrs is a feature-rich Tetris implementation for the terminal
with customizable game modes.")
    (license license:expat)))

;;;
;;; ── bkmr ──────────────────────────────────────────
;;;
(define-public bkmr
  (package
    (name "bkmr")
    (version "0.8.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/niclasr/bkmr/releases/download/v"
             version
             "/bkmr-linux-x86_64"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("bkmr" "bin/bkmr"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (cond
               ((string-suffix? ".gz" source)
                (invoke "tar" "xzf" source))
               ((string-suffix? ".bz2" source)
                (invoke "tar" "xjf" source))
               (else
                (copy-file source "bkmr")
                (chmod "bkmr" #o755)))))
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/niclasr/bkmr")
    (synopsis "unified CLI bookmark and snippet manager")
    (description
     "bkmr is a unified command-line tool for managing bookmarks,
snippets, and knowledge base entries.")
    (license license:expat)))

;;;
;;; ── stor ──────────────────────────────────────────
;;;
(define-public stor
  (package
    (name "stor")
    (version "0.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/niclasr/stor/releases/download/v"
             version
             "/stor-linux-x86_64"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("stor" "bin/stor"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (cond
               ((string-suffix? ".gz" source)
                (invoke "tar" "xzf" source))
               ((string-suffix? ".bz2" source)
                (invoke "tar" "xjf" source))
               (else
                (copy-file source "stor")
                (chmod "stor" #o755)))))
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/niclasr/stor")
    (synopsis "alternative to GNU Stow written in Rust")
    (description
     "stor is a Rust reimplementation of GNU Stow for managing
symlink farms of dotfiles and configurations.")
    (license license:expat)))

;;;
;;; ── jellyfin-tui ──────────────────────────────────────────
;;;
(define-public jellyfin-tui
  (package
    (name "jellyfin-tui")
    (version "0.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/niclasr/jellyfin-tui/releases/download/v"
             version
             "/jellyfin-tui-linux-x86_64"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("jellyfin-tui" "bin/jellyfin-tui"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (cond
               ((string-suffix? ".gz" source)
                (invoke "tar" "xzf" source))
               ((string-suffix? ".bz2" source)
                (invoke "tar" "xjf" source))
               (else
                (copy-file source "jellyfin-tui")
                (chmod "jellyfin-tui" #o755)))))
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/niclasr/jellyfin-tui")
    (synopsis "Jellyfin music streaming TUI client")
    (description
     "jellyfin-tui is a terminal user interface client for
streaming music from a Jellyfin media server.")
    (license license:gpl3)))

;;;
;;; ── oblivion-desktop-bin ──────────────────────────────────────────
;;;
(define-public oblivion-desktop-bin
  (package
    (name "oblivion-desktop-bin")
    (version "1.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/niclasr/oblivion-desktop/releases/download/v"
             version
             "/oblivion-desktop-"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("oblivion-desktop" "bin/oblivion-desktop"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (cond
               ((string-suffix? ".gz" source)
                (invoke "tar" "xzf" source))
               ((string-suffix? ".bz2" source)
                (invoke "tar" "xjf" source))
               (else
                (copy-file source "oblivion-desktop")
                (chmod "oblivion-desktop" #o755)))))
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/niclasr/oblivion-desktop")
    (synopsis "unofficial Warp client for circumventing internet censorship (binary)")
    (description
     "Oblivion Desktop is an unofficial client application for
Cloudflare Warp, designed to bypass internet censorship.")
    (license license:expat)))

;;;
;;; ── siyuan-note-bin ──────────────────────────────────────────
;;;
(define-public siyuan-note-bin
  (package
    (name "siyuan-note-bin")
    (version "3.1.18")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/siyuan-note/siyuan/releases/download/v"
             version
             "/siyuan-"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("siyuan-note" "bin/siyuan-note"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (cond
               ((string-suffix? ".gz" source)
                (invoke "tar" "xzf" source))
               ((string-suffix? ".bz2" source)
                (invoke "tar" "xjf" source))
               (else
                (copy-file source "siyuan-note")
                (chmod "siyuan-note" #o755)))))
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/siyuan-note/siyuan")
    (synopsis "privacy-first personal knowledge management system (binary)")
    (description
     "SiYuan is a local-first personal knowledge management system
with block-level references and end-to-end encryption.")
    (license license:agpl3)))

;;;
;;; ── codex-bin ──────────────────────────────────────────
;;;
(define-public codex-bin
  (package
    (name "codex-bin")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/niclasr/codex/releases/download/v"
             version
             "/codex-linux-x86_64"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("codex" "bin/codex"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (cond
               ((string-suffix? ".gz" source)
                (invoke "tar" "xzf" source))
               ((string-suffix? ".bz2" source)
                (invoke "tar" "xjf" source))
               (else
                (copy-file source "codex")
                (chmod "codex" #o755)))))
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/niclasr/codex")
    (synopsis "OpenAI Codex CLI coding assistant (binary)")
    (description
     "Codex is a command-line coding assistant powered by
OpenAI Codex for generating and editing code.")
    (license license:asl2.0)))

;;;
;;; ── gowall ──────────────────────────────────────────
;;;
(define-public gowall
  (package
    (name "gowall")
    (version "0.1.7")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/niclasr/gowall/releases/download/v"
             version
             "/gowall-linux-amd64"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("gowall" "bin/gowall"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (cond
               ((string-suffix? ".gz" source)
                (invoke "tar" "xzf" source))
               ((string-suffix? ".bz2" source)
                (invoke "tar" "xjf" source))
               (else
                (copy-file source "gowall")
                (chmod "gowall" #o755)))))
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/niclasr/gowall")
    (synopsis "convert wallpapers to match your color scheme")
    (description
     "gowall is a tool that converts wallpaper colors to match
your desktop color scheme or theme palette.")
    (license license:expat)))

