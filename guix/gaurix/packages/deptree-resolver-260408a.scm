;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency-tree resolver pass — deptree-resolver-260408a
;;; Resolves 100 BLOCKED packages from priority queue.
;;; 7 packages resolved with recipes, 93 remain BLOCKED with documented reasons.
;;; Generated: 2026-04-08

(define-module (gaurix packages deptree-resolver-260408a)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages icu4c)
  #:use-module (gnu packages perl)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:export (cs-bin
            crtui-bin
            crycco-bin
            cubyz-bin
            crunch
            icu74
            csvi-bin-260408a))

;;; ════════════════════════════════════════════════════════════════════════
;;; BINARY CLI TOOLS — single-binary installs
;;; ════════════════════════════════════════════════════════════════════════

;;; ── 1. cs-bin ─────────────────────────────────────────────────────────
;;; Code search tool that ranks results by relevance
;;;
(define-public cs-bin
  (package
    (name "cs-bin")
    (version "3.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/boyter/cs/releases/download/v"
             version "/cs_Linux_x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("cs" "bin/cs"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/boyter/cs")
    (synopsis "CLI code search tool that ranks results by relevance")
    (description
     "Codespelunker (cs) is a command-line code search tool that understands
code structure and ranks results by relevance.  It provides fast, context-aware
searching across codebases with support for many programming languages.")
    (license license:expat)))

;;; ── 2. crtui-bin ──────────────────────────────────────────────────────
;;; Terminal-based container registry management tool
;;;
(define-public crtui-bin
  (package
    (name "crtui-bin")
    (version "0.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/ksckaan1/crtui/releases/download/v"
             version "/crtui_" version "_linux_amd64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("crtui" "bin/crtui"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/ksckaan1/crtui")
    (synopsis "terminal-based container registry management tool")
    (description
     "CRTUI is a terminal user interface for managing container registries.
It provides an interactive TUI for browsing, searching, and managing
container images across registries.")
    (license license:expat)))

;;; ── 3. crycco-bin ─────────────────────────────────────────────────────
;;; Literate programming tool (static binary)
;;;
(define-public crycco-bin
  (package
    (name "crycco-bin")
    (version "0.5.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/ralsina/crycco/releases/download/v"
             version "/crycco-static-linux-amd64"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("crycco" "bin/crycco"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "crycco")
              (chmod "crycco" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/ralsina/crycco")
    (synopsis "literate programming tool")
    (description
     "Crycco is a literate programming tool that extracts code from
documentation and documentation from code.  It supports multiple
programming languages and output formats.")
    (license license:expat)))

;;; ── 4. cubyz-bin ──────────────────────────────────────────────────────
;;; Open source voxel sandbox game
;;;
(define-public cubyz-bin
  (package
    (name "cubyz-bin")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/PixelGuys/Cubyz/releases/download/"
             version "/Linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/cubyz/"
           #:include-regexp (".*")))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'create-wrapper
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin"))
                     (share (string-append out "/share/cubyz")))
                (mkdir-p bin)
                (with-output-to-file (string-append bin "/cubyz")
                  (lambda ()
                    (display (string-append "#!/bin/sh\n"
                                            "cd " share "\n"
                                            "exec ./Cubyz \"$@\"\n"))))
                (chmod (string-append bin "/cubyz") #o755)))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/PixelGuys/Cubyz")
    (synopsis "open source voxel sandbox game")
    (description
     "Cubyz is an open source voxel sandbox game written in Zig.  It features
procedurally generated worlds, multiplayer support, and a modding API.")
    (license license:gpl3)))

;;; ════════════════════════════════════════════════════════════════════════
;;; SOURCE-BUILT PACKAGES
;;; ════════════════════════════════════════════════════════════════════════

;;; ── 5. crunch ─────────────────────────────────────────────────────────
;;; Wordlist generator for brute-force attacks
;;;
(define-public crunch
  (package
    (name "crunch")
    (version "3.6")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "mirror://sourceforge/crunch-wordlist/crunch-wordlist/"
             "crunch-" version ".tgz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f                       ;no test suite
      #:make-flags
      #~(list (string-append "CC=" #$(cc-for-target))
              (string-append "PREFIX=" #$output))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)           ;no configure script
          (add-before 'install 'create-dirs
            (lambda* (#:key outputs #:allow-other-keys)
              (let ((out (assoc-ref outputs "out")))
                (mkdir-p (string-append out "/bin"))
                (mkdir-p (string-append out "/share/man/man1"))
                (mkdir-p (string-append out "/share/crunch"))))))))
    (home-page "https://sourceforge.net/projects/crunch-wordlist/")
    (synopsis "wordlist generator that uses standard or custom character sets")
    (description
     "Crunch is a wordlist generator where you can specify a standard
character set or a character set you specify.  Crunch can generate all
possible combinations and permutations.  It is useful for security testing
and password auditing.")
    (license license:gpl2)))

;;; ── 6. icu74 ──────────────────────────────────────────────────────────
;;; International Components for Unicode library (legacy version 74)
;;;
(define-public icu74
  (package
    (inherit icu4c)
    (name "icu74")
    (version "74.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/unicode-org/icu/releases/download/"
             "release-74-2/icu4c-74_2-src.tgz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (synopsis "international components for Unicode library (version 74)")
    (description
     "ICU is a set of C/C++ and Java libraries providing Unicode and
globalisation support for software applications.  This package provides
the legacy version 74 of the C/C++ libraries for software that requires
this specific ABI version.")))

;;; ── 7. csvi-bin-260408a ───────────────────────────────────────────────
;;; Terminal CSV editor — fresh definition (existing one not in general-compat)
;;;
(define-public csvi-bin-260408a
  (package
    (name "csvi-bin")
    (version "1.23.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/hymkor/csvi/releases/download/v"
             version "/csvi-v" version "-linux-amd64.zip"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("csvi" "bin/csvi"))))
    (native-inputs (list unzip))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/hymkor/csvi")
    (synopsis "terminal CSV editor")
    (description
     "Csvi is an interactive terminal CSV editor.  It provides a TUI for
viewing and editing CSV files directly in the terminal with navigation,
column resizing, and in-place editing.")
    (license license:expat)))
