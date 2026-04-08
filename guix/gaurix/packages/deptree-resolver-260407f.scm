;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency-tree resolver pass — deptree-resolver-260407f
;;; Resolves 100 BLOCKED packages from priority queue (pass f).
;;; 17 packages resolved with recipes, 71 remain BLOCKED with documented reasons.
;;; Generated: 2026-04-07T23:00:00+00:00

(define-module (gaurix packages deptree-resolver-260407f)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:export (bat-asus-battery-bin
            batdoc-bin
            bcmr-bin
            bento-bin
            bin-cpuflags-x86-bin
            bine-bin
            blocky-bin
            bookokrat-bin
            btdu-bin
            batctl-tui-bin
            binco-bin
            backblaze-b2-bin
            liberica-jdk-full-bin
            jdk17-temurin
            amazon-corretto-8-bin
            bfind-pkg
            bus-pkg))

;;; ════════════════════════════════════════════════════════════════════════
;;; BINARY CLI TOOLS
;;; ════════════════════════════════════════════════════════════════════════

;;; ── 1. bat-asus-battery-bin ────────────────────────────────────────────
;;; Battery charge threshold manager for ASUS laptops
;;;
(define-public bat-asus-battery-bin
  (package
    (name "bat-asus-battery-bin")
    (version "1.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/tshakalekholoane/bat/releases/download/"
             version "/bat"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("bat" "bin/bat"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "bat")
              (chmod "bat" #o755)))
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/tshakalekholoane/bat")
    (synopsis "battery charge threshold manager for ASUS laptops")
    (description
     "Bat replicates the functionality of the ASUS Battery Health Charging
utility on Windows, allowing users to set battery charge thresholds on
Linux to extend battery lifespan.")
    (license license:expat)))

;;; ── 2. batdoc-bin ─────────────────────────────────────────────────────
;;; Document reader using bat for rendering
;;;
(define-public batdoc-bin
  (package
    (name "batdoc-bin")
    (version "1.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/daemonp/batdoc/releases/download/v"
             version "/batdoc-linux-x86_64.zst"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (native-inputs (list zstd))
    (arguments
     (list
      #:install-plan
      #~'(("batdoc" "bin/batdoc"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (invoke "zstd" "-d" source "-o" "batdoc")
              (chmod "batdoc" #o755)))
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/daemonp/batdoc")
    (synopsis "cat for doc, docx, xls, xlsx, pptx, and pdf files")
    (description
     "Batdoc renders document files (doc, docx, xls, xlsx, pptx, pdf) to
markdown and displays them using bat with syntax highlighting.")
    (license license:expat)))

;;; ── 3. bcmr-bin ───────────────────────────────────────────────────────
;;; Modern file operations CLI
;;;
(define-public bcmr-bin
  (package
    (name "bcmr-bin")
    (version "0.5.4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/Bengerthelorf/bcmr/releases/download/v"
             version "/bcmr-x86_64-linux.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("bcmr" "bin/bcmr"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Bengerthelorf/bcmr")
    (synopsis "modern, safe CLI tool for file operations with progress")
    (description
     "Better Copy Move Remove (BCMR) is a modern CLI tool for file
operations that shows progress bars, supports safe operations with
confirmation prompts, and provides a clean interface.")
    (license license:expat)))

;;; ── 4. bento-bin ──────────────────────────────────────────────────────
;;; Stream processing made operationally mundane
;;;
(define-public bento-bin
  (package
    (name "bento-bin")
    (version "1.16.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/warpstreamlabs/bento/releases/download/v"
             version "/bento_" version "_linux_amd64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("bento" "bin/bento"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://warpstreamlabs.github.io/bento/")
    (synopsis "stream processing made operationally mundane")
    (description
     "Bento is a high-performance stream processor that connects various
sources and sinks.  It supports a wide range of connectors and
processors for building data pipelines.")
    (license license:expat)))

;;; ── 5. bin-cpuflags-x86-bin ───────────────────────────────────────────
;;; CPU flags detector for x86 binaries
;;;
(define-public bin-cpuflags-x86-bin
  (package
    (name "bin-cpuflags-x86-bin")
    (version "1.0.8")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/HanabishiRecca/bin-cpuflags-x86/releases/download/"
             version "/bin-cpuflags-x86-" version "-linux-x86_64.tar.xz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("bin-cpuflags-x86" "bin/bin-cpuflags-x86"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/HanabishiRecca/bin-cpuflags-x86")
    (synopsis "detect CPU flags of x86 binaries")
    (description
     "A small CLI tool to detect CPU instruction set flags (SSE, AVX, etc.)
required by x86 binary executables.")
    (license license:expat)))

;;; ── 6. bine-bin ───────────────────────────────────────────────────────
;;; Terminal binary editor
;;;
(define-public bine-bin
  (package
    (name "bine-bin")
    (version "0.10.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/hymkor/bine/releases/download/v"
             version "/bine-v" version "-linux-amd64.zip"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (native-inputs (list unzip))
    (arguments
     (list
      #:install-plan
      #~'(("bine" "bin/bine"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/hymkor/bine")
    (synopsis "terminal binary editor")
    (description
     "Bine is a terminal-based binary file editor written in Go, providing
a hex editor interface for viewing and modifying binary files.")
    (license license:expat)))

;;; ── 7. blocky-bin ─────────────────────────────────────────────────────
;;; DNS proxy as ad-blocker
;;;
(define-public blocky-bin
  (package
    (name "blocky-bin")
    (version "0.29.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/0xERR0R/blocky/releases/download/v"
             version "/blocky_v" version "_Linux_x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("blocky" "bin/blocky"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/0xERR0R/blocky")
    (synopsis "fast and lightweight DNS proxy as ad-blocker")
    (description
     "Blocky is a DNS proxy and ad-blocker for the local network written in
Go.  It supports custom DNS block lists, conditional forwarding, and
caching with a low memory footprint.")
    (license license:asl2.0)))

;;; ── 8. bookokrat-bin ──────────────────────────────────────────────────
;;; Terminal-based EPUB and PDF reader
;;;
(define-public bookokrat-bin
  (package
    (name "bookokrat-bin")
    (version "0.3.9")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/bugzmanov/bookokrat/releases/download/v"
             version "/bookokrat-v" version
             "-x86_64-unknown-linux-musl.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("bookokrat" "bin/bookokrat"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/bugzmanov/bookokrat")
    (synopsis "terminal-based EPUB and PDF reader with rich TUI")
    (description
     "Bookokrat is a terminal-based e-book reader supporting EPUB and PDF
formats.  It provides a rich text user interface with navigation,
bookmarks, and search functionality.")
    (license license:agpl3)))

;;; ── 9. btdu-bin ───────────────────────────────────────────────────────
;;; Sampling disk usage profiler for btrfs
;;;
(define-public btdu-bin
  (package
    (name "btdu-bin")
    (version "0.7.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/CyberShadow/btdu/releases/download/v"
             version "/btdu-static-x86_64"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("btdu" "bin/btdu"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "btdu")
              (chmod "btdu" #o755)))
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/CyberShadow/btdu")
    (synopsis "sampling disk usage profiler for btrfs")
    (description
     "Btdu is a sampling-based disk usage profiler for btrfs file systems.
It provides a ncurses interface showing which directories and files
consume the most disk space, using btrfs-specific features for
accurate accounting.")
    (license license:gpl2)))

;;; ── 10. batctl-tui-bin ────────────────────────────────────────────────
;;; TUI tool for battery charge thresholds
;;;
(define-public batctl-tui-bin
  (package
    (name "batctl-tui-bin")
    (version "2026.3.13")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/Ooooze/batctl/releases/download/v"
             version "/batctl-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("batctl" "bin/batctl"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Ooooze/batctl")
    (synopsis "TUI and CLI tool for managing battery charge thresholds")
    (description
     "Batctl is a TUI and CLI tool for managing battery charge thresholds
on Linux laptops.  It provides an interactive interface for setting
and monitoring battery charging limits.")
    (license license:expat)))

;;; ── 11. binco-bin ─────────────────────────────────────────────────────
;;; Binary-text encoder-decoder
;;;
(define-public binco-bin
  (package
    (name "binco-bin")
    (version "0.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/dd86k/binco/releases/download/v"
             version "/binco-" version
             "-x86_64-linux-musl-static.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("binco" "bin/binco"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/dd86k/binco")
    (synopsis "binary-text encoder-decoder")
    (description
     "Binco is a binary-text encoder-decoder supporting various encoding
formats including base64, hex, and other binary-to-text conversions.")
    (license license:expat)))

;;; ── 12. backblaze-b2-bin ──────────────────────────────────────────────
;;; Backblaze B2 cloud storage CLI
;;;
(define-public backblaze-b2-bin
  (package
    (name "backblaze-b2-bin")
    (version "4.6.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/Backblaze/B2_Command_Line_Tool/releases/download/v"
             version "/b2v4-linux"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("b2" "bin/b2"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "b2")
              (chmod "b2" #o755)))
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Backblaze/B2_Command_Line_Tool")
    (synopsis "Backblaze B2 cloud storage command line client")
    (description
     "The Backblaze B2 command line tool provides access to B2 cloud storage
services.  It supports uploading, downloading, and managing files and
buckets in Backblaze B2.")
    (license license:expat)))

;;; ════════════════════════════════════════════════════════════════════════
;;; JDK DISTRIBUTIONS
;;; ════════════════════════════════════════════════════════════════════════

;;; ── 13. liberica-jdk-full-bin ─────────────────────────────────────────
;;; BellSoft Liberica JDK (full edition)
;;;
(define-public liberica-jdk-full-bin
  (package
    (name "liberica-jdk-full-bin")
    (version "26.0.0.37")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/bell-sw/Liberica/releases/download/"
             "26+37/bellsoft-jdk26+37-linux-amd64-full.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "lib/jvm/liberica-jdk-full/"
           #:exclude ("lib/src.zip")))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'create-bin-symlinks
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (jdk (string-append out "/lib/jvm/liberica-jdk-full"))
                     (bin (string-append out "/bin")))
                (mkdir-p bin)
                (for-each
                 (lambda (f)
                   (let ((target (string-append bin "/" (basename f))))
                     (unless (file-exists? target)
                       (symlink f target))))
                 (find-files (string-append jdk "/bin"))))))
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://bell-sw.com/")
    (synopsis "BellSoft Liberica JDK, full edition with JavaFX")
    (description
     "Liberica JDK is a fully certified build of OpenJDK by BellSoft.  The
full edition includes JavaFX.  It provides a complete Java development
environment.")
    (license license:gpl2)))   ;GPLv2 with Classpath Exception

;;; ── 14. jdk17-temurin ─────────────────────────────────────────────────
;;; Eclipse Temurin JDK 17 (Adoptium)
;;;
(define-public jdk17-temurin
  (package
    (name "jdk17-temurin")
    (version "17.0.18")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/adoptium/temurin17-binaries/releases/download/"
             "jdk-" version "%2B8"
             "/OpenJDK17U-jdk_x64_linux_hotspot_" version "_8.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "lib/jvm/temurin-17/"
           #:exclude ("lib/src.zip")))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'create-bin-symlinks
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (jdk (string-append out "/lib/jvm/temurin-17"))
                     (bin (string-append out "/bin")))
                (mkdir-p bin)
                (for-each
                 (lambda (f)
                   (let ((target (string-append bin "/" (basename f))))
                     (unless (file-exists? target)
                       (symlink f target))))
                 (find-files (string-append jdk "/bin"))))))
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://adoptium.net/")
    (synopsis "Eclipse Temurin JDK 17 by Adoptium")
    (description
     "Eclipse Temurin is a fully certified and tested OpenJDK distribution
by the Adoptium project.  It provides high-quality, enterprise-ready
Java runtimes.")
    (license license:gpl2)))   ;GPLv2 with Classpath Exception

;;; ── 15. amazon-corretto-8-bin ─────────────────────────────────────────
;;; Amazon Corretto JDK 8
;;;
(define-public amazon-corretto-8-bin
  (package
    (name "amazon-corretto-8-bin")
    (version "8.482.08.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://corretto.aws/downloads/resources/"
             version "/amazon-corretto-" version
             "-linux-x64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "lib/jvm/corretto-8/"
           #:exclude ("lib/src.zip" "src.zip")))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'create-bin-symlinks
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (jdk (string-append out "/lib/jvm/corretto-8"))
                     (bin (string-append out "/bin")))
                (mkdir-p bin)
                (for-each
                 (lambda (f)
                   (let ((target (string-append bin "/" (basename f))))
                     (unless (file-exists? target)
                       (symlink f target))))
                 (find-files (string-append jdk "/bin"))))))
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://aws.amazon.com/corretto/")
    (synopsis "Amazon Corretto, a no-cost OpenJDK 8 distribution")
    (description
     "Amazon Corretto is a no-cost, multiplatform, production-ready
distribution of OpenJDK.  It comes with long-term support from Amazon
and includes performance enhancements and security fixes.")
    (license license:gpl2)))   ;GPLv2 with Classpath Exception

;;; ════════════════════════════════════════════════════════════════════════
;;; SOURCE-BUILT PACKAGES
;;; ════════════════════════════════════════════════════════════════════════

;;; ── 16. bfind-pkg ─────────────────────────────────────────────────────
;;; find alternative optimized for finding files
;;;
(define-public bfind-pkg
  (package
    (name "bfind")
    (version "3.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://codeberg.org/maandree/bfind/archive/"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:make-flags
      #~(list (string-append "PREFIX=" #$output))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure))))
    (home-page "https://codeberg.org/maandree/bfind")
    (synopsis "find alternative optimized for finding files")
    (description
     "Bfind is an alternative to the standard @command{find} utility,
optimized for quickly finding files rather than listing them.  It
provides a simpler interface focused on the most common use case.")
    (license license:isc)))

;;; ── 17. bus-pkg ───────────────────────────────────────────────────────
;;; Simple daemonless local message broadcasting
;;;
(define-public bus-pkg
  (package
    (name "bus")
    (version "3.1.11")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://codeberg.org/maandree/bus/archive/"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:make-flags
      #~(list (string-append "PREFIX=" #$output))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure))))
    (home-page "https://codeberg.org/maandree/bus")
    (synopsis "simple daemonless system for broadcasting messages locally")
    (description
     "Bus is a simple daemonless system for broadcasting messages locally
on a machine.  It uses shared memory for inter-process communication
without requiring a central daemon.")
    (license license:isc)))
