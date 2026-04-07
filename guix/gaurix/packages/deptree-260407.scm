;;; Blocked dependency-tree priority pass 2026-04-07 (deptree-260407).
;;; Selected 100 packages from dep-tree priority queue (blocked_dep_count ASC,
;;; reverse_dep_count DESC, total_dep_count ASC, name ASC).
;;; Status: 7 recipes + 6 compat aliases + 87 re-blocked.
(define-module (gaurix packages deptree-260407)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system trivial)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages fontutils)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages web)
  #:use-module (gnu packages xml)
  #:export (
            ;; recipes
            ttf-vt323
            ttf-xenia
            deno-stable-bin
            rosec-bin
            auto-auto-complete
            fortune-mod-off
            httpdirfs
            ))


;;; ---------- RECIPES ----------

;; ttf-vt323: Monospaced typeface modeled after the VT320 terminal glyphs
(define-public ttf-vt323
  (package
    (name "ttf-vt323")
    (version "2.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/phoikoi/VT323/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0p7j6svas0jbm77pc5sdxl7bcinbicjc1aky7fgz69pmzb3mjl8p"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("fonts/" "share/fonts/truetype/vt323/"
           #:include-regexp (".*\\.ttf$")))))
    (home-page "https://github.com/phoikoi/VT323/")
    (synopsis "Monospaced typeface based on the VT320 text terminal glyphs")
    (description "VT323 is a monospaced TrueType font designed to emulate
the character shapes from the DEC VT320 text terminal.  It provides a
nostalgic terminal aesthetic suitable for code editors and retro-themed
applications.")
    (license license:silofl1.1)))


;; ttf-xenia: Monospaced font family
(define-public ttf-xenia
  (package
    (name "ttf-xenia")
    (version "1.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/Loretta1982/xenia/releases/download/v"
             version "/xenia_family.zip"))
       (sha256
        (base32 "0xcdjd0ip5bp068plnng0sfiv90i36vgi45p66c6mh2cpb7scqvd"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/fonts/truetype/xenia/"
           #:include-regexp (".*\\.ttf$")))))
    (native-inputs (list unzip))
    (home-page "https://github.com/Loretta1982/xenia")
    (synopsis "Monospaced font designed with legibility in mind")
    (description "Xenia is a monospaced font family designed for readability
and aesthetics.  The family includes regular, bold, italic, and bold-italic
variants.")
    (license (license:non-copyleft
              "https://github.com/Loretta1982/xenia/blob/main/LICENSE"
              "Xenia Monofont license"))))


;; deno-stable-bin: Deno JavaScript/TypeScript runtime (prebuilt binary)
(define-public deno-stable-bin
  (package
    (name "deno-stable-bin")
    (version "2.6.4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/denoland/deno/releases/download/v"
             version "/deno-x86_64-unknown-linux-gnu.zip"))
       (sha256
        (base32 "1xm7xi141aiddrc3prh6cng3r5g1wyw8p56k08hbh5qc8p8bn04i"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("deno" "bin/deno"))))
    (native-inputs (list unzip))
    (home-page "https://deno.com/")
    (synopsis "Modern JavaScript and TypeScript runtime (prebuilt binary)")
    (description "Deno is a modern runtime for JavaScript and TypeScript that
uses V8 and is built in Rust.  It ships as a single executable with built-in
tooling including a formatter, linter, test runner, and TypeScript compiler.
This package provides the prebuilt binary for x86_64 GNU/Linux.")
    (license license:expat)))


;; rosec-bin: Multi-provider Secret Service daemon with SSH agent
(define-public rosec-bin
  (package
    (name "rosec-bin")
    (version "0.0.25")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/jmylchreest/rosec/releases/download/v"
             version "/rosec-" version
             "-x86_64-unknown-linux-gnu.tar.gz"))
       (sha256
        (base32 "0ddv1d5xcvri1f2sg83gakhjbv5is0d1b6y5xldpv9pkxpva5f8w"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("rosec" "bin/rosec"))))
    (home-page "https://github.com/jmylchreest/rosec")
    (synopsis "Secret service daemon with SSH agent and FUSE mount support")
    (description "Rosec is a multi-provider Secret Service daemon that
supports SSH agent functionality, FUSE mount, and PAM unlock integration.
It provides a D-Bus Secret Service API-compatible secrets manager.")
    (license license:expat)))


;; auto-auto-complete: Shell auto-completion script generator
(define-public auto-auto-complete
  (package
    (name "auto-auto-complete")
    (version "7.2.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://codeberg.org/maandree/auto-auto-complete/archive/"
             version ".tar.gz"))
       (sha256
        (base32 "0lnk02ivkl85c6qv0jnmic3bck2ma6y62q5i0ccy53kdwlppjclb"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:make-flags
      #~(list (string-append "PREFIX=" #$output))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure))))
    (inputs (list python))
    (home-page "https://codeberg.org/maandree/auto-auto-complete")
    (synopsis "Autogenerate shell auto-completion scripts")
    (description "Auto-auto-complete generates shell auto-completion scripts
from a simple description format.  It supports Bash, Zsh, and Fish shells.")
    (license license:isc)))


;; fortune-mod-off: Fortune cookie program with offensive quotes
(define-public fortune-mod-off
  (package
    (name "fortune-mod-off")
    (version "3.24.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/shlomif/fortune-mod/archive/refs/tags/"
             "fortune-mod-" version ".tar.gz"))
       (sha256
        (base32 "1bc5ik9kc6grf1smv9cbkh292ir5y86dgch010cpfhwr4jhqkf0c"))))
    (build-system cmake-build-system)
    (arguments
     (list
      #:tests? #f
      #:configure-flags
      #~(list (string-append "-DLOCALDIR=" #$output "/share/fortune"))))
    (native-inputs (list pkg-config))
    (inputs (list bash-minimal))
    (home-page "https://www.shlomifish.org/open-source/projects/fortune-mod/")
    (synopsis "Fortune cookie program including offensive quotes")
    (description "Fortune-mod displays random quotes (fortune cookies) from a
database of quotation files.  This version includes the offensive quotes that
were removed from some distributions.")
    (license license:bsd-4)))


;; httpdirfs: FUSE filesystem for HTTP directory listings
(define-public httpdirfs
  (package
    (name "httpdirfs")
    (version "1.2.7")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/fangfufu/httpdirfs/archive/refs/tags/"
             version ".tar.gz"))
       (sha256
        (base32 "1wz9amh32fnrz57l2j3g66q7sxrms8g4mpcs3fbk4cggm98nipn7"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:make-flags
      #~(list (string-append "prefix=" #$output))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure))))
    (native-inputs (list pkg-config))
    (inputs (list curl expat fuse gumbo-parser openssl util-linux))
    (home-page "https://github.com/fangfufu/httpdirfs")
    (synopsis "FUSE filesystem for mounting HTTP directory listings")
    (description "HTTPDirFS is a FUSE-based filesystem that allows mounting
HTTP directory listings as a local filesystem.  It supports caching, partial
downloads, and works with Apache, Nginx, and other web servers that provide
directory listings.")
    (license license:gpl3+)))
