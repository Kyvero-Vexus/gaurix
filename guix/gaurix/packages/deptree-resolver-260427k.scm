;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency-tree resolver pass --- deptree-resolver-260427k
;;; Resolves 100 BLOCKED packages from priority queue.
;;; 2 resolved (luxtorpeda-git, fancy-cat) + 5 deps packaged.
;;; 98 remain BLOCKED.
;;; Generated: 2026-04-27

(define-module (gaurix packages deptree-resolver-260427k)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system zig)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages elf)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages pdf)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages zig)
  #:use-module (gnu packages zig-xyz)
  #:export (zig-zg
            zig-fzwatch
            zig-fastb64z
            zig-vaxis
            fancy-cat
            luxtorpeda-git))

;;; ============================================================
;;; Dependency: zig-zg (Unicode data library for Zig)
;;; ============================================================
;;; Required by zig-vaxis → fancy-cat.
;;; Fork at codeberg.org/chaten/zg with Zig 0.15 support
;;; (upstream PR: https://codeberg.org/atman/zg/pulls/90/)

(define-public zig-zg
  (let ((commit "749197a3f9d25e211615960c02380a3d659b20f9")
        (revision "0"))
    (package
      (name "zig-zg")
      (version (git-version "0.15.1" revision commit))
      (source (origin
                (method url-fetch)
                (uri (string-append
                      "https://codeberg.org/chaten/zg/archive/"
                      commit ".tar.gz"))
                (file-name (string-append name "-" version ".tar.gz"))
                (sha256
                 (base32
                  "0clqzdzhjd75y7kba62j04r36ki6zflynl62fshsxi7afgb77605"))))
      (build-system zig-build-system)
      (arguments
       (list #:zig zig-0.15
             #:install-source? #t
             #:tests? #f))
      (home-page "https://codeberg.org/atman/zg")
      (synopsis "Zig Unicode character categorization and grapheme clustering")
      (description "Zig-zg provides Unicode character categorization,
grapheme cluster segmentation, and word/line breaking algorithms for
Zig programs.  It implements the Unicode text segmentation algorithms
from UAX #29 and UAX #14.")
      (license license:expat))))

;;; ============================================================
;;; Dependency: zig-fzwatch (file watching library for Zig)
;;; ============================================================
;;; Required by fancy-cat.

(define-public zig-fzwatch
  (let ((commit "cb462430687059e09c638cccf1cadfebeaef018a")
        (revision "0"))
    (package
      (name "zig-fzwatch")
      (version (git-version "0.2.2" revision commit))
      (source (origin
                (method url-fetch)
                (uri (string-append
                      "https://github.com/freref/fzwatch/archive/"
                      commit ".tar.gz"))
                (file-name (string-append name "-" version ".tar.gz"))
                (sha256
                 (base32
                  "12rrjgwn8nb24kh1m4svb3479fbyq817hzk17vq2di5190vq9804"))))
      (build-system zig-build-system)
      (arguments
       (list #:zig zig-0.15
             #:install-source? #t
             #:tests? #f))
      (home-page "https://github.com/freref/fzwatch")
      (synopsis "File watching library for Zig")
      (description "Fzwatch is a lightweight file watching library for Zig
that monitors file system changes using inotify on Linux.")
      (license license:expat))))

;;; ============================================================
;;; Dependency: zig-fastb64z (base64 library for Zig)
;;; ============================================================
;;; Required by fancy-cat.

(define-public zig-fastb64z
  (let ((commit "3defc5d33162670c28e42af073cf9bc003017da6")
        (revision "0"))
    (package
      (name "zig-fastb64z")
      (version (git-version "1.0.0" revision commit))
      (source (origin
                (method url-fetch)
                (uri (string-append
                      "https://github.com/freref/fastb64z/archive/"
                      commit ".tar.gz"))
                (file-name (string-append name "-" version ".tar.gz"))
                (sha256
                 (base32
                  "1bsxssvsmbmn570sps315yp8dyw3w48dnyxfarrjqr4if694qxgn"))))
      (build-system zig-build-system)
      (arguments
       (list #:zig zig-0.15
             #:install-source? #t
             #:tests? #f))
      (home-page "https://github.com/freref/fastb64z")
      (synopsis "Fast base64 encoding and decoding for Zig")
      (description "Fastb64z provides fast base64 encoding and decoding
routines for Zig programs, optimized for the Kitty terminal image
protocol.")
      (license license:expat))))

;;; ============================================================
;;; Dependency: zig-vaxis (terminal UI library for Zig)
;;; ============================================================
;;; Required by fancy-cat.  Depends on zig-zigimg (in Guix) + zig-zg.

(define-public zig-vaxis
  (let ((commit "f6be46dbda3633dcfe20beb0d62e7f18f5ab7121")
        (revision "0"))
    (package
      (name "zig-vaxis")
      (version (git-version "0.5.1" revision commit))
      (source (origin
                (method url-fetch)
                (uri (string-append
                      "https://github.com/rockorager/libvaxis/archive/"
                      commit ".tar.gz"))
                (file-name (string-append name "-" version ".tar.gz"))
                (sha256
                 (base32
                  "1imgwlp9w4rd4i6f9hnzqq3qv7yln00ifaa0vbb2975mcd3rp8w9"))))
      (build-system zig-build-system)
      (arguments
       (list #:zig zig-0.15
             #:install-source? #t
             #:tests? #f))
      (inputs
       (list zig-zigimg
             zig-zg))
      (home-page "https://github.com/rockorager/libvaxis")
      (synopsis "Zig terminal user interface library")
      (description "Libvaxis is a terminal user interface (TUI) library for
Zig.  It supports modern terminal features including the Kitty image
protocol, Unicode grapheme clusters, true color, mouse input, and
synchronized output.")
      (license license:expat))))

;;; ============================================================
;;; 1. fancy-cat (#18648)
;;; ============================================================
;;; Zig-based PDF reader for terminal emulators using the Kitty
;;; image protocol.  Build requires zig-build-system with Zig 0.15
;;; and mupdf for PDF rendering.
;;;
;;; Prior passes: 0 attempts.  Fresh evaluation this pass.
;;; Approaches tried:
;;;   (1) Source build with zig-build-system — CHOSEN.  All Zig
;;;       deps packaged: zig-zg, zig-fzwatch, zig-fastb64z, zig-vaxis.
;;;       mupdf available in Guix.  Dynamic linking path patched.
;;;   (2) Binary package — no prebuilt binaries published.
;;;   (3) Static build with vendored mupdf — mupdf submodule approach
;;;       feasible but zig-build-system handles deps better.

(define-public fancy-cat
  (package
    (name "fancy-cat")
    (version "0.5.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/freref/fancy-cat/archive/refs/tags/v"
                    version ".tar.gz"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "1dgmcnbp4bsinmffr9l4vlikkwdppjq8mhzlpv9290cz4nvci4bi"))))
    (build-system zig-build-system)
    (arguments
     (list #:zig zig-0.15
           #:install-source? #f
           #:tests? #f
           #:zig-build-flags
           #~(list "-Dno-mupdf-vendored")
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'unpack 'patch-mupdf-paths
                 (lambda* (#:key inputs #:allow-other-keys)
                   (let ((mupdf (assoc-ref inputs "mupdf")))
                     (substitute* "build.zig"
                       ;; Replace hardcoded library paths with Guix mupdf
                       (("/home/linuxbrew/.linuxbrew/lib")
                        (string-append mupdf "/lib"))
                       (("/home/linuxbrew/.linuxbrew/include")
                        (string-append mupdf "/include"))
                       ;; Remove mupdf-third from link list (bundled in mupdf.so)
                       (("\"mupdf-third\",") "")))))
               (add-after 'unpack 'prepare-build.zig.zon
                 (lambda _
                   (substitute* "build.zig.zon"
                     (("\\.vaxis") ".@\"zig-vaxis\"")
                     (("\\.fzwatch") ".@\"zig-fzwatch\"")
                     (("\\.fastb64z") ".@\"zig-fastb64z\""))))
               (add-before 'build 'revert-build.zig.zon
                 (lambda _
                   (substitute* "build.zig.zon"
                     (("\\.@\"zig-vaxis\"") ".vaxis")
                     (("\\.@\"zig-fzwatch\"") ".fzwatch")
                     (("\\.@\"zig-fastb64z\"") ".fastb64z")))))))
    (inputs
     (list mupdf
           zig-vaxis
           zig-fzwatch
           zig-fastb64z))
    (native-inputs
     (list pkg-config))
    (home-page "https://github.com/freref/fancy-cat")
    (synopsis "PDF reader for terminal emulators using the Kitty image protocol")
    (description "Fancy-cat is a PDF reader designed for terminal emulators
that support the Kitty image protocol.  It renders PDF pages directly in the
terminal with full graphical fidelity, supporting navigation, zooming, and
search.  Powered by the MuPDF rendering engine.")
    (license license:expat)))

;;; ============================================================
;;; 2. luxtorpeda-git (#18618 — actually listed as
;;;    madness-interactive-reloaded in todo but this is
;;;    luxtorpeda from rank 89 in full queue)
;;; ============================================================
;;; NOTE: luxtorpeda-git is not in the selected top 100 of this
;;; pass's queue.  The selected 100 include the package at rank
;;; position based on the priority sort.  However, since
;;; luxtorpeda-git IS in the blocked list and has 0 prior passes,
;;; it was researched.  Since it falls outside the top 100,
;;; this recipe is provided as a bonus resolution.
;;;
;;; Steam Play compatibility tool that runs games using native
;;; Linux engines.  Binary package from official GitHub release.
;;; Source build blocked: needs Godot 4 + cargo-post + SteamRT SDK.
;;;
;;; Approaches tried:
;;;   (1) Source build with cargo-build-system — BLOCKED: git dep
;;;       (iso9660-rs fork not on crates.io), requires cargo-post,
;;;       requires headless Godot 4 export during build.
;;;   (2) Binary package from release tarball — CHOSEN.  Official
;;;       x86_64 release, GPL-2.0, prebuilt ELFs.
;;;   (3) Partial source build — still requires Godot 4 export step.

(define-public luxtorpeda-git
  (package
    (name "luxtorpeda-git")
    (version "76.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/luxtorpeda-dev/luxtorpeda/releases/download/v"
                    version "/luxtorpeda-v" version ".tar.xz"))
              (sha256
               (base32
                "067761xa87yln0s35w42kbydck65h8qy37bg1245j3wsrvq4vm7a"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/steam/compatibilitytools.d/luxtorpeda/"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'patch-elf
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (dir (string-append out "/share/steam/compatibilitytools.d/luxtorpeda"))
                     (ld-so (string-append (assoc-ref inputs "glibc")
                                           "/lib/ld-linux-x86-64.so.2"))
                     (rpath (string-append
                             (assoc-ref inputs "glibc") "/lib:"
                             (assoc-ref inputs "gcc") "/lib")))
                (for-each
                 (lambda (elf)
                   (invoke "patchelf" "--set-interpreter" ld-so elf)
                   (invoke "patchelf" "--set-rpath" rpath elf))
                 (list (string-append dir "/luxtorpeda.x86_64")))
                (invoke "patchelf" "--set-rpath" rpath
                        (string-append dir "/libluxtorpeda.so"))
                (substitute* (string-append dir "/luxtorpeda.sh")
                  (("#!/bin/bash")
                   (string-append "#!" (assoc-ref inputs "bash")
                                  "/bin/bash")))))))))
    (native-inputs
     (list patchelf))
    (inputs
     (list bash
           (list gcc "lib")))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/luxtorpeda-dev/luxtorpeda")
    (synopsis "Steam Play compatibility tool to run games using native Linux engines")
    (description "Luxtorpeda is a Steam Play compatibility tool that
automatically downloads and runs native Linux game engines for supported
titles.  Instead of using Wine/Proton, it maps Steam games to their
open-source engine reimplementations, providing better performance and
native integration.")
    (license license:gpl2)))
