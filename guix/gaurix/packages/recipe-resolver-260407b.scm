;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2026 Gaurix contributors
;;;
;;; NEEDS_RECIPE_DESIGN resolution — recipe-resolver-260407b
;;; Resolves 14 packages with actual recipes (binary + source builds).
;;; Additional packages resolved via compat aliases in general-compat.scm
;;; and status updates in todo_general_packages.org.

(define-module (gaurix packages recipe-resolver-260407b)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system trivial)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages elf)
  #:use-module (gnu packages gcc)
  #:export (funzzy-bin
            lazytail-bin
            comp-scan-bin
            wo-bin
            oken-bin
            mezzotone-bin
            chough-bin
            framework-control-bin
            szsol-rs-bin
            cliamp-bin
            dpibreak-bin
            bililive-recorder-bin
            lobster
            noto-fonts-cjk-fontconfig))

;;;
;;; 1. funzzy-bin — Lightweight file watcher
;;;    Pre-built Rust binary from GitHub Releases.
;;;
(define-public funzzy-bin
  (package
    (name "funzzy-bin")
    (version "1.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/cristianoliveira/funzzy/releases/download/v"
             version "/funzzy-v" version
             "-x86_64-unknown-linux-gnu.tar.gz"))
       (sha256
        (base32 "1fd6f3j40f33wk4d7wymaia08gi7hax59dif4zda7h5qchpf9z3g"))))
    (build-system gnu-build-system)
    (supported-systems '("x86_64-linux"))
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)
          (delete 'build)
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin"))
                     (patchelf (search-input-file %build-inputs "/bin/patchelf"))
                     (ld-so (search-input-file
                             %build-inputs
                             "/lib/ld-linux-x86-64.so.2"))
                     (libc-lib (dirname (dirname ld-so)))
                     (gcc-lib (assoc-ref %build-inputs "gcc:lib")))
                (mkdir-p bin)
                (install-file "funzzy" bin)
                (chmod (string-append bin "/funzzy") #o755)
                (invoke patchelf "--set-interpreter" ld-so
                        (string-append bin "/funzzy"))
                (invoke patchelf "--set-rpath"
                        (string-append libc-lib "/lib:"
                                       gcc-lib "/lib")
                        (string-append bin "/funzzy"))))))))
    (native-inputs (list patchelf))
    (inputs (list glibc `(,gcc "lib")))
    (home-page "https://github.com/cristianoliveira/funzzy")
    (synopsis "lightweight blazingly fast file watcher")
    (description
     "funzzy is a lightweight, configurable, generic-purpose file watcher
written in Rust.  It watches files and directories for changes and runs
user-defined commands in response, making it useful for development
workflows like auto-reloading and continuous testing.")
    (license license:expat)))

;;;
;;; 2. lazytail-bin — Universal terminal log viewer
;;;    Pre-built Rust binary from GitHub Releases.
;;;
(define-public lazytail-bin
  (package
    (name "lazytail-bin")
    (version "0.9.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/raaymax/lazytail/releases/download/v"
             version "/lazytail-linux-x86_64.tar.gz"))
       (sha256
        (base32 "1fycd87x4idp7va9j7fxldkmqm1c20v3qxymk3j4x85061006lmn"))))
    (build-system gnu-build-system)
    (supported-systems '("x86_64-linux"))
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)
          (delete 'build)
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin"))
                     (patchelf (search-input-file %build-inputs "/bin/patchelf"))
                     (ld-so (search-input-file
                             %build-inputs
                             "/lib/ld-linux-x86-64.so.2"))
                     (libc-lib (dirname (dirname ld-so)))
                     (gcc-lib (assoc-ref %build-inputs "gcc:lib")))
                (mkdir-p bin)
                (install-file "lazytail" bin)
                (chmod (string-append bin "/lazytail") #o755)
                (invoke patchelf "--set-interpreter" ld-so
                        (string-append bin "/lazytail"))
                (invoke patchelf "--set-rpath"
                        (string-append libc-lib "/lib:"
                                       gcc-lib "/lib")
                        (string-append bin "/lazytail"))))))))
    (native-inputs (list patchelf))
    (inputs (list glibc `(,gcc "lib")))
    (home-page "https://github.com/raaymax/lazytail")
    (synopsis "fast universal terminal log viewer with live filtering")
    (description
     "lazytail is a fast, universal terminal-based log viewer written in Rust.
It provides live filtering, follow mode, and an intuitive TUI for
browsing and searching log files in real time.")
    (license license:expat)))

;;;
;;; 3. comp-scan-bin — Local AI system scanner
;;;    Pre-built Rust binary from GitHub Releases.
;;;
(define-public comp-scan-bin
  (package
    (name "comp-scan-bin")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/vvk147/comp-scan/releases/download/v"
             version "/compscan-x86_64-unknown-linux-gnu.tar.gz"))
       (sha256
        (base32 "142iwz4y69c5d0if1rfr3x8az047n3nn7pmwazifb287qlpjmswi"))))
    (build-system gnu-build-system)
    (supported-systems '("x86_64-linux"))
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)
          (delete 'build)
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin"))
                     (patchelf (search-input-file %build-inputs "/bin/patchelf"))
                     (ld-so (search-input-file
                             %build-inputs
                             "/lib/ld-linux-x86-64.so.2"))
                     (libc-lib (dirname (dirname ld-so)))
                     (gcc-lib (assoc-ref %build-inputs "gcc:lib")))
                (mkdir-p bin)
                (install-file "compscan" bin)
                (chmod (string-append bin "/compscan") #o755)
                (invoke patchelf "--set-interpreter" ld-so
                        (string-append bin "/compscan"))
                (invoke patchelf "--set-rpath"
                        (string-append libc-lib "/lib:"
                                       gcc-lib "/lib")
                        (string-append bin "/compscan"))))))))
    (native-inputs (list patchelf))
    (inputs (list glibc `(,gcc "lib")))
    (home-page "https://github.com/vvk147/comp-scan")
    (synopsis "local AI agent that scans and optimizes your system")
    (description
     "comp-scan is a fully local AI agent that scans your system, observes
usage patterns, and suggests one-click improvements.  It uses Ollama
locally for AI inference with zero telemetry or cloud dependencies.")
    (license license:expat)))

;;;
;;; 4. wo-bin — Workspace shell manager
;;;    Pre-built Go binary from GitHub Releases (statically linked).
;;;
(define-public wo-bin
  (package
    (name "wo-bin")
    (version "1.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/antham/wo/releases/download/"
             version "/wo_" version "_linux_amd64.tar.gz"))
       (sha256
        (base32 "1p2ny73avwylp1vg1syfrqi2mx2a5xqv1n2v2pp4g835xgr0igy9"))))
    (build-system gnu-build-system)
    (supported-systems '("x86_64-linux"))
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)
          (delete 'build)
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin")))
                (mkdir-p bin)
                (install-file "wo" bin)
                (chmod (string-append bin "/wo") #o755)))))))
    (home-page "https://github.com/antham/wo")
    (synopsis "workspace shell manager for project directories")
    (description
     "wo is a workspace manager for the shell.  It helps organize and switch
between project directories, providing quick access to workspaces from
the command line.")
    (license license:expat)))

;;;
;;; 5. oken-bin — Smarter SSH CLI with fuzzy host picker
;;;    Pre-built Rust binary from GitHub Releases.
;;;
(define-public oken-bin
  (package
    (name "oken-bin")
    (version "0.3.8")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/linkwithjoydeep/oken/releases/download/v"
             version "/oken-x86_64-unknown-linux-gnu.tar.xz"))
       (sha256
        (base32 "0dljijbx2n9514rbfwgxl0s4p0n1kbwp4pdi85kzl3zpg5lk3djc"))))
    (build-system gnu-build-system)
    (supported-systems '("x86_64-linux"))
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)
          (delete 'build)
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin"))
                     (patchelf (search-input-file %build-inputs "/bin/patchelf"))
                     (ld-so (search-input-file
                             %build-inputs
                             "/lib/ld-linux-x86-64.so.2"))
                     (libc-lib (dirname (dirname ld-so)))
                     (gcc-lib (assoc-ref %build-inputs "gcc:lib")))
                (mkdir-p bin)
                (install-file "oken" bin)
                (chmod (string-append bin "/oken") #o755)
                (invoke patchelf "--set-interpreter" ld-so
                        (string-append bin "/oken"))
                (invoke patchelf "--set-rpath"
                        (string-append libc-lib "/lib:"
                                       gcc-lib "/lib")
                        (string-append bin "/oken"))))))))
    (native-inputs (list patchelf))
    (inputs (list glibc `(,gcc "lib")))
    (home-page "https://github.com/linkwithjoydeep/oken")
    (synopsis "smarter SSH CLI with host management and fuzzy picker")
    (description
     "oken is a smarter SSH command-line interface with better host management
and a fuzzy host picker.  It works standalone or as an optional drop-in
replacement for ssh, providing quick access to configured hosts.")
    (license license:expat)))

;;;
;;; 6. mezzotone-bin — Image/GIF to ASCII art converter
;;;    Pre-built Go binary from GitHub Releases (raw binary, statically linked).
;;;
(define-public mezzotone-bin
  (package
    (name "mezzotone-bin")
    (version "1.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/joaoheitorgarcia/Mezzotone/releases/download/v"
             version "/app-linux-amd64"))
       (sha256
        (base32 "0gb1ivviybc7zbailqsbmyw3dx80jizkqkzmhypr05r2rdy3fqy9"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (bin (string-append out "/bin")))
            (mkdir-p bin)
            (copy-file (assoc-ref %build-inputs "source")
                       (string-append bin "/mezzotone"))
            (chmod (string-append bin "/mezzotone") #o755)))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/joaoheitorgarcia/Mezzotone")
    (synopsis "convert images and GIFs to ASCII or Unicode art")
    (description
     "Mezzotone is a TUI application that converts images and GIFs into ASCII
or Unicode art.  Built with the BubbleTea framework, it provides an
interactive terminal interface for rendering visual content as text.")
    (license license:expat)))

;;;
;;; 7. chough-bin — Fast speech recognition CLI
;;;    Pre-built Go binary from GitHub Releases (statically linked).
;;;
(define-public chough-bin
  (package
    (name "chough-bin")
    (version "1.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/hyperpuncher/chough/releases/download/v"
             version "/chough_v" version "_linux_x86_64.tar.gz"))
       (sha256
        (base32 "05rfaihzcqwaxv75cn3j7lqfvap7lfdbpccql8mqcj158jbsagcq"))))
    (build-system gnu-build-system)
    (supported-systems '("x86_64-linux"))
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)
          (delete 'build)
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin")))
                (mkdir-p bin)
                (install-file "chough" bin)
                (chmod (string-append bin "/chough") #o755)))))))
    (home-page "https://github.com/hyperpuncher/chough")
    (synopsis "fast automatic speech recognition CLI tool")
    (description
     "chough is a fast automatic speech recognition (ASR) command-line tool.
It uses the Parakeet TDT model via sherpa-onnx to transcribe audio files
to text directly from the terminal.")
    (license license:expat)))

;;;
;;; 8. framework-control-bin — Framework Laptop control service
;;;    Pre-built Rust binary from GitHub Releases.
;;;
(define-public framework-control-bin
  (package
    (name "framework-control-bin")
    (version "0.5.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/ozturkkl/framework-control/releases/download/"
             version "/framework-control-service-x86_64.tar.gz"))
       (sha256
        (base32 "01743ds2qdr7x1y5hbv84chdhja9i56dgq9n4sgr8xnhi8xyqbyq"))))
    (build-system gnu-build-system)
    (supported-systems '("x86_64-linux"))
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)
          (delete 'build)
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin"))
                     (patchelf (search-input-file %build-inputs "/bin/patchelf"))
                     (ld-so (search-input-file
                             %build-inputs
                             "/lib/ld-linux-x86-64.so.2"))
                     (libc-lib (dirname (dirname ld-so)))
                     (gcc-lib (assoc-ref %build-inputs "gcc:lib")))
                (mkdir-p bin)
                (install-file "framework-control-service" bin)
                (chmod (string-append bin "/framework-control-service") #o755)
                (invoke patchelf "--set-interpreter" ld-so
                        (string-append bin "/framework-control-service"))
                (invoke patchelf "--set-rpath"
                        (string-append libc-lib "/lib:"
                                       gcc-lib "/lib")
                        (string-append bin "/framework-control-service"))))))))
    (native-inputs (list patchelf))
    (inputs (list glibc `(,gcc "lib")))
    (home-page "https://github.com/ozturkkl/framework-control")
    (synopsis "control service for Framework Laptop features")
    (description
     "framework-control provides a service for controlling Framework Laptop
features such as fan control, battery charging thresholds, and LED input
modules.  It runs as a background service with a web-based user
interface for configuration.")
    (license license:expat)))

;;;
;;; 9. szsol-rs-bin — Shenzhen I/O Solitaire clone with TUI
;;;    Pre-built Rust binary from GitHub Releases.
;;;
(define-public szsol-rs-bin
  (package
    (name "szsol-rs-bin")
    (version "1.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/ghoker143/szsol-rs/releases/download/v"
             version "/szsol-rs-x86_64-unknown-linux-gnu.tar.xz"))
       (sha256
        (base32 "0igxb4yfryiw09cwkkml1008m8jjbks32dczm5lg1v68rvfpq7vw"))))
    (build-system gnu-build-system)
    (supported-systems '("x86_64-linux"))
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)
          (delete 'build)
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin"))
                     (patchelf (search-input-file %build-inputs "/bin/patchelf"))
                     (ld-so (search-input-file
                             %build-inputs
                             "/lib/ld-linux-x86-64.so.2"))
                     (libc-lib (dirname (dirname ld-so)))
                     (gcc-lib (assoc-ref %build-inputs "gcc:lib")))
                (mkdir-p bin)
                (install-file "szsol-rs" bin)
                (chmod (string-append bin "/szsol-rs") #o755)
                (invoke patchelf "--set-interpreter" ld-so
                        (string-append bin "/szsol-rs"))
                (invoke patchelf "--set-rpath"
                        (string-append libc-lib "/lib:"
                                       gcc-lib "/lib")
                        (string-append bin "/szsol-rs"))))))))
    (native-inputs (list patchelf))
    (inputs (list glibc `(,gcc "lib")))
    (home-page "https://github.com/ghoker143/szsol-rs")
    (synopsis "Shenzhen I/O Solitaire clone with TUI")
    (description
     "szsol-rs is a Shenzhen I/O Solitaire clone with a terminal user
interface.  It features keyboard and mouse support, undo history,
reproducible games via seed, an A* solver, auto-save, and a persistent
win counter.")
    (license license:gpl3+)))

;;;
;;; 10. cliamp-bin — Retro terminal music player
;;;     Pre-built Go binary from GitHub Releases (raw binary, statically linked).
;;;
(define-public cliamp-bin
  (package
    (name "cliamp-bin")
    (version "1.34.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/bjarneo/cliamp/releases/download/v"
             version "/cliamp-linux-amd64"))
       (sha256
        (base32 "0x6jcd7fmg7xyk3jiym0c5hingwpcckr9pam8g5mifkl9hf5ky7w"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (bin (string-append out "/bin")))
            (mkdir-p bin)
            (copy-file (assoc-ref %build-inputs "source")
                       (string-append bin "/cliamp"))
            (chmod (string-append bin "/cliamp") #o755)))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/bjarneo/cliamp")
    (synopsis "retro terminal music player inspired by Winamp")
    (description
     "cliamp is a retro terminal music player inspired by Winamp 2.x.  It
supports local audio files and YouTube URLs via yt-dlp and ffmpeg,
providing a nostalgic Winamp-style interface in the terminal.")
    (license license:expat)))

;;;
;;; 11. dpibreak-bin — DPI circumvention tool
;;;     Pre-built Rust binary (musl, statically linked) from GitHub Releases.
;;;
(define-public dpibreak-bin
  (package
    (name "dpibreak-bin")
    (version "0.6.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/dilluti0n/dpibreak/releases/download/v"
             version "/DPIBreak-" version
             "-x86_64-unknown-linux-musl.tar.gz"))
       (sha256
        (base32 "18l2dzbpcsw3yr2i5psj7mhsqygdddwaggji7d7b0m0l1p8ms7c5"))))
    (build-system gnu-build-system)
    (supported-systems '("x86_64-linux"))
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)
          (delete 'build)
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin")))
                (mkdir-p bin)
                (install-file "dpibreak" bin)
                (chmod (string-append bin "/dpibreak") #o755)))))))
    (home-page "https://github.com/dilluti0n/dpibreak")
    (synopsis "fast DPI circumvention tool for Linux")
    (description
     "DPIBreak is a fast Deep Packet Inspection circumvention tool for Linux.
It splits TLS ClientHello messages into smaller fragments so ISP DPI
equipment cannot read the Server Name Indication, enabling access to
sites blocked by DPI-based filtering at near-unrestricted speed.")
    (license license:gpl3+)))

;;;
;;; 12. bililive-recorder-bin — Bilibili live stream recorder
;;;     Pre-built .NET self-contained binary from GitHub Releases.
;;;
(define-public bililive-recorder-bin
  (package
    (name "bililive-recorder-bin")
    (version "2.18.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/Bililive/BililiveRecorder/releases/download/v"
             version "/BililiveRecorder-CLI-linux-musl-x64.zip"))
       (sha256
        (base32 "0g9lk11m7csrx5k0w6xyqgy4rdyglpwd02w5m9cp3yphpqvryimf"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (lib (string-append out "/lib/bililive-recorder"))
                 (bin (string-append out "/bin"))
                 (unzip (search-input-file %build-inputs "/bin/unzip"))
                 (bash (search-input-file %build-inputs "/bin/sh")))
            (mkdir-p lib)
            (mkdir-p bin)
            ;; Extract the zip archive
            (invoke unzip (assoc-ref %build-inputs "source") "-d" lib)
            ;; Make the CLI binary executable
            (chmod (string-append lib "/BililiveRecorder.Cli") #o755)
            ;; Create a wrapper script
            (call-with-output-file (string-append bin "/bililive-recorder")
              (lambda (port)
                (format port "#!~a\nexec ~a/BililiveRecorder.Cli \"$@\"\n"
                        bash lib)))
            (chmod (string-append bin "/bililive-recorder") #o755)))))
    (native-inputs (list unzip))
    (inputs (list bash-minimal))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Bililive/BililiveRecorder")
    (synopsis "Bilibili live stream recorder")
    (description
     "BililiveRecorder is a live stream recording tool for the Bilibili
streaming platform.  This CLI version runs on Linux and supports
automated recording, stream monitoring, and FLV file repair.")
    (license license:gpl3)))

;;;
;;; 13. lobster — POSIX shell script for streaming movies and TV shows
;;;     Installed from source tarball.
;;;
(define-public lobster
  (package
    (name "lobster")
    (version "4.6.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/justchokingaround/lobster/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "12rizglhm1snlmwnh6cdp492f178kqmyamw8qm6rw8j4c6jk6ff8"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)
          (delete 'build)
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin")))
                (mkdir-p bin)
                (install-file "lobster.sh" bin)
                (rename-file (string-append bin "/lobster.sh")
                             (string-append bin "/lobster"))
                (chmod (string-append bin "/lobster") #o755)))))))
    (home-page "https://github.com/justchokingaround/lobster")
    (synopsis "POSIX shell script for streaming movies and TV shows")
    (description
     "lobster is a POSIX shell script that allows searching, streaming, and
downloading movies and TV shows from the terminal.  It supports history
tracking, subtitle selection, Discord rich presence, and mpv integration
for playback.")
    (license license:gpl2)))

;;;
;;; 14. noto-fonts-cjk-fontconfig — Fontconfig configuration for Noto CJK
;;;     Installs a fontconfig rule for Noto CJK font preference.
;;;
(define-public noto-fonts-cjk-fontconfig
  (package
    (name "noto-fonts-cjk-fontconfig")
    (version "1")
    (source #f)
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (conf-dir (string-append
                            out "/share/fontconfig/conf.avail")))
            (mkdir-p conf-dir)
            (call-with-output-file
                (string-append conf-dir "/70-noto-cjk.conf")
              (lambda (port)
                (display
                 "<?xml version=\"1.0\"?>
<!DOCTYPE fontconfig SYSTEM \"urn:fontconfig:fonts.dtd\">
<fontconfig>
  <alias>
    <family>sans-serif</family>
    <prefer>
      <family>Noto Sans CJK SC</family>
      <family>Noto Sans CJK TC</family>
      <family>Noto Sans CJK JP</family>
      <family>Noto Sans CJK KR</family>
    </prefer>
  </alias>
  <alias>
    <family>serif</family>
    <prefer>
      <family>Noto Serif CJK SC</family>
      <family>Noto Serif CJK TC</family>
      <family>Noto Serif CJK JP</family>
      <family>Noto Serif CJK KR</family>
    </prefer>
  </alias>
  <alias>
    <family>monospace</family>
    <prefer>
      <family>Noto Sans Mono CJK SC</family>
      <family>Noto Sans Mono CJK TC</family>
      <family>Noto Sans Mono CJK JP</family>
      <family>Noto Sans Mono CJK KR</family>
    </prefer>
  </alias>
</fontconfig>\n" port)))))))
    (home-page "https://github.com/notofonts/noto-cjk")
    (synopsis "fontconfig configuration for Noto CJK fonts")
    (description
     "This package provides fontconfig configuration that sets Noto CJK fonts
as preferred fallback fonts for sans-serif, serif, and monospace font
families.  It ensures CJK characters are rendered using Google Noto CJK
fonts when available.")
    (license license:gpl3+)))
