;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2026 Gaurix contributors
;;;
;;; Recipe resolver pass — recipe-resolver-260408k
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages:
;;;   - 10 new recipes (font/copy/cmake/gnu/meson build systems)
;;;   - 20 re-evaluated with specific blocking reasons
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros) unless noted.
;;; Run `guix download <url>` to obtain real hashes before building.

(define-module (gaurix packages recipe-resolver-260408k)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system font)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system meson)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages assembly)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages boost)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages ninja)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages tls)
  #:export (
            ;; New recipes
            font-b612
            crabdrop-bin
            matcha-client-bin
            github-account-switch-bin
            odzip
            lolcatpp
            vatomic
            qatlib
            pipewire-audio-idle-inhibit
            xc-bin))

;;;
;;; ── font-b612 ──────────────────────────────────────────
;;; Highly legible font designed for aircraft cockpit screens
;;;
(define-public font-b612
  (package
    (name "font-b612")
    (version "1.008")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/polarsys/b612/archive/"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (home-page "https://b612-font.com")
    (synopsis "highly legible font designed for aircraft cockpit screens")
    (description
     "B612 is an open-source font family designed by Airbus and tested to
improve legibility and comfort of reading on aircraft cockpit screens.
It includes regular, italic, bold, and bold-italic weights in both
proportional and monospaced variants.")
    (license license:epl2.0)))

;;;
;;; ── crabdrop-bin ──────────────────────────────────────────
;;; Simple, fast file manager for S3-compatible storage
;;;
(define-public crabdrop-bin
  (package
    (name "crabdrop-bin")
    (version "0.3.5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/alsofelix/crabdrop/releases/download/v"
             version "/crabdrop_" version "_amd64.deb"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("usr/bin/crabdrop" "bin/crabdrop")
           ("usr/share/" "share/"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (invoke "ar" "x" source)
              (invoke "tar" "xf" "data.tar.gz")))
          (delete 'install-license-files))))
    (native-inputs (list tar))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/alsofelix/crabdrop")
    (synopsis "fast file manager for S3-compatible storage")
    (description
     "Crabdrop is a simple, fast file manager for S3-compatible storage
built with Tauri and Rust.  It supports browsing, uploading,
downloading, and managing files across S3-compatible cloud storage
providers.  This package provides the pre-built binary.")
    (license license:expat)))

;;;
;;; ── matcha-client-bin ──────────────────────────────────────────
;;; Terminal email client with TUI interface
;;;
(define-public matcha-client-bin
  (package
    (name "matcha-client-bin")
    (version "0.30.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/floatpane/matcha/releases/download/v"
             version "/matcha_" version "_linux_amd64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("matcha" "bin/matcha"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/floatpane/matcha")
    (synopsis "powerful terminal email client with TUI interface")
    (description
     "Matcha is a feature-rich terminal email client built with Go and
the Bubble Tea TUI framework.  It supports IMAP and SMTP, provides
a modern text-based interface for reading, composing, and managing
email.  This package provides the pre-built binary.")
    (license license:expat)))

;;;
;;; ── github-account-switch-bin ──────────────────────────────────────────
;;; CLI tool for managing multiple GitHub accounts
;;;
(define-public github-account-switch-bin
  (package
    (name "github-account-switch-bin")
    (version "1.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/TheDevOpsBlueprint/github-account-switch-cli")
             (commit "bdc3962")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("bin/gh-switch-standalone" "bin/gh-switch"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'wrap-program
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let ((out (assoc-ref outputs "out")))
                (wrap-program (string-append out "/bin/gh-switch")
                  `("PATH" prefix
                    ,(map (lambda (input)
                            (string-append (assoc-ref inputs input) "/bin"))
                          '("bash" "git")))))))
          (delete 'install-license-files))))
    (inputs (list bash git-minimal))
    (home-page "https://github.com/TheDevOpsBlueprint/github-account-switch-cli")
    (synopsis "CLI tool for switching between multiple GitHub accounts")
    (description
     "GitHub Account Switch CLI provides a fast, reliable way to manage
and switch between multiple GitHub accounts.  It handles SSH key
switching and git configuration updates for seamless multi-account
workflows.")
    (license license:expat)))

;;;
;;; ── odzip ──────────────────────────────────────────
;;; Minimal file compression using LZ77 and Huffman coding
;;;
(define-public odzip
  (package
    (name "odzip")
    (version "1.0.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/odpay/odzip/archive/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list
      #:configure-flags #~(list "-DODZ_PORTABLE=ON")
      #:tests? #f))  ;; no test suite
    (home-page "https://github.com/odpay/odzip")
    (synopsis "minimal file compression with LZ77 and Huffman coding")
    (description
     "Odzip is a minimal file compression tool implementing LZ77
hash-chain matching and Huffman coding.  It provides a standalone
@command{odz} binary for compressing and decompressing files with
a custom format.")
    (license license:expat)))

;;;
;;; ── lolcatpp ──────────────────────────────────────────
;;; C++ reimplementation of lolcat for rainbow terminal output
;;;
(define-public lolcatpp
  (package
    (name "lolcatpp")
    (version "2.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/lolcatpp/lolcatpp/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))  ;; no test suite
    (inputs (list boost))
    (home-page "https://github.com/lolcatpp/lolcatpp")
    (synopsis "rainbow-colored terminal output in C++")
    (description
     "Lolcat++ is a high-performance C++ reimplementation of lolcat that
adds rainbow coloring to terminal output.  It reads from standard
input or files and outputs text with smooth rainbow gradient colors
using ANSI escape codes.")
    (license license:bsd-3)))

;;;
;;; ── vatomic ──────────────────────────────────────────
;;; Formally-verified atomic operations library
;;;
(define-public vatomic
  (package
    (name "vatomic")
    (version "2.4.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/open-s4c/vatomic/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))  ;; tests require specialized hardware verification
    (home-page "https://github.com/open-s4c/vatomic")
    (synopsis "formally-verified C atomic operations library")
    (description
     "VSync Atomics (vatomic) is a header-only C library providing
formally-verified atomic operations.  It offers memory-model-aware
atomic primitives that have been verified using formal methods to
ensure correctness under various memory ordering guarantees.")
    (license license:expat)))

;;;
;;; ── qatlib ──────────────────────────────────────────
;;; Intel QuickAssist Technology user space library
;;;
(define-public qatlib
  (package
    (name "qatlib")
    (version "26.02.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/intel/qatlib/archive/"
             version "/qatlib-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          (replace 'bootstrap
            (lambda _
              (invoke "autoreconf" "-fiv"))))))
    (native-inputs (list autoconf automake libtool autoconf-archive
                         nasm pkg-config))
    (inputs (list openssl numactl))
    (home-page "https://github.com/intel/qatlib")
    (synopsis "user space library for Intel QuickAssist Technology")
    (description
     "QATlib is the user space library for Intel QuickAssist Technology
(QAT).  It provides cryptographic acceleration and data compression
offloading to Intel QAT hardware.  QAT accelerates symmetric and
asymmetric cryptography as well as lossless data compression.")
    (license license:bsd-3)))

;;;
;;; ── pipewire-audio-idle-inhibit ──────────────────────────────────────────
;;; Prevents screen sleep while audio plays through PipeWire
;;;
(define-public pipewire-audio-idle-inhibit
  (package
    (name "pipewire-audio-idle-inhibit")
    (version "0.4.4")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/The1fEst/PipewireAudioIdleInhibit")
             (commit "0c0a328")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))  ;; no test suite
    (native-inputs (list pkg-config ninja))
    (inputs (list pipewire))
    (home-page "https://github.com/The1fEst/PipewireAudioIdleInhibit")
    (synopsis "prevents screen sleep while PipeWire audio is active")
    (description
     "PipeWire Audio Idle Inhibit prevents the screen from sleeping or
the screensaver from activating while audio is actively playing or
being recorded through PipeWire.  It listens to PipeWire stream
events and inhibits idle when audio streams are running.")
    (license license:gpl3+)))

;;;
;;; ── xc-bin ──────────────────────────────────────────
;;; Markdown-defined task runner
;;;
(define-public xc-bin
  (package
    (name "xc-bin")
    (version "0.9.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/joerdav/xc/releases/download/v"
             version "/xc_" version "_linux_amd64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("xc" "bin/xc"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/joerdav/xc")
    (synopsis "markdown-defined task runner")
    (description
     "Xc is a task runner that uses Markdown files to define tasks.
Tasks are written as code blocks in Markdown with headers as task
names, allowing documentation and task definitions to coexist in
README files.  This package provides the pre-built binary.")
    (license license:expat)))
