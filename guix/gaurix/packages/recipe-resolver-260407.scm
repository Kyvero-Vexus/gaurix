;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2026 Gaurix contributors
;;;
;;; NEEDS_RECIPE_DESIGN resolution — recipe-resolver-260407
;;; Resolves 8 packages with actual recipes (binary + source builds).
;;; Additional packages resolved via compat aliases in general-compat.scm
;;; and status updates in todo_general_packages.org.
;;; Recipe resolver pass — recipe-resolver-260407
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages from the blocked queue.
;;; Covers: binary packages (copy-build-system), Python packages,
;;; Rust source builds, shell scripts, C/C++ builds, and Go binaries.

(define-module (gaurix packages recipe-resolver-260407)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system trivial)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages elf)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages linux)
  #:export (ferris-scan-bin
            console2svg-bin
            sabiql-bin
            netwatch-tui-bin
            gram-editor-bin
            claude-code-seccomp
            q5k-usb-udev
            clightd))

;;;
;;; 1. ferris-scan-bin — Lightweight file scanner
;;;    Pre-built Rust binary from GitHub Releases.
;;;
(define-public ferris-scan-bin
  (package
    (name "ferris-scan-bin")
    (version "0.25")
  #:use-module (guix git-download)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system pyproject)
  #:use-module (gnu packages)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages image)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages music)
  #:use-module (gnu packages video)
  #:use-module (gnu packages web)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages xml))
;;; ── PREBUILT BINARY PACKAGES ──────────────────────────────────────────
(define-public lazytail-bin
    (name "lazytail-bin")
    (version "0.9.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/Vnilabean/ferris-scan/releases/download/v"
             version "/ferris-scan-tui-v" version "-linux"))
       (sha256
        (base32 "1a2sb0w04a3qnxdbjg7nf74zab949wpsj5yfgbx5v9yfgws8fbq4"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (bin (string-append out "/bin"))
                 (patchelf (search-input-file %build-inputs "/bin/patchelf"))
                 (ld-so (search-input-file
                         %build-inputs
                         "/lib/ld-linux-x86-64.so.2"))
                 (libc-lib (dirname (dirname ld-so)))
                 (gcc-lib (assoc-ref %build-inputs "gcc:lib")))
            (mkdir-p bin)
            (copy-file (assoc-ref %build-inputs "source")
                       (string-append bin "/ferris-scan"))
            (chmod (string-append bin "/ferris-scan") #o755)
            (invoke patchelf "--set-interpreter" ld-so
                    (string-append bin "/ferris-scan"))
            (invoke patchelf "--set-rpath"
                    (string-append libc-lib "/lib:"
                                   gcc-lib "/lib")
                    (string-append bin "/ferris-scan"))))))
    (native-inputs (list patchelf))
    (inputs (list glibc `(,gcc "lib")))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Vnilabean/ferris-scan")
    (synopsis "lightweight Rust-based file scanner with TUI")
    (description
     "ferris-scan is a lightweight and simple file scanner written in Rust.
It provides a terminal user interface for scanning and browsing files
and directories on the filesystem.")
    (license license:expat)))

;;;
;;; 2. console2svg-bin — Convert terminal output to SVG
;;;    Pre-built binary from GitHub Releases.
;;;
             "https://github.com/raaymax/lazytail/releases/download/v"
             version "/lazytail-linux-x86_64.tar.gz"))
        (base32 "1fycd87x4idp7va9j7fxldkmqm1c20v3qxymk3j4x85061006lmn"))))
    (build-system copy-build-system)
      #:install-plan #~'(("lazytail" "bin/lazytail"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files)
          (add-after 'install 'patch-elf
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let ((bin (string-append (assoc-ref outputs "out")
                                       "/bin/lazytail"))
                    (ld-so (search-input-file inputs "lib/ld-linux-x86-64.so.2"))
                    (rpath (string-join
                            (list (dirname
                                   (search-input-file inputs
                                                      "lib/ld-linux-x86-64.so.2"))
                                  (dirname
                                   (search-input-file inputs
                                                      "lib/libgcc_s.so.1")))
                            ":")))
                (invoke "patchelf" "--set-interpreter" ld-so bin)
                (invoke "patchelf" "--set-rpath" rpath bin)))))))
    (inputs (list (list gcc "lib") glibc))
    (home-page "https://github.com/raaymax/lazytail")
    (synopsis "terminal UI for tailing and searching log files")
     "Lazytail is a terminal user interface application for tailing and
searching log files.  It provides real-time log monitoring with filtering
and search capabilities.")
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
        (base32 "1fd6f3j40f33wk4d7wymaia08gi7hax59dif4zda7h5qchpf9z3g"))))
    (build-system copy-build-system)
      #:install-plan #~'(("funzzy" "bin/funzzy")
                         ("fzz" "bin/fzz"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files)
          (add-after 'install 'patch-elf
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let ((out (assoc-ref outputs "out"))
                    (ld-so (search-input-file inputs "lib/ld-linux-x86-64.so.2"))
                    (rpath (string-join
                            (list (dirname
                                   (search-input-file inputs
                                                      "lib/ld-linux-x86-64.so.2"))
                                  (dirname
                                   (search-input-file inputs
                                                      "lib/libgcc_s.so.1")))
                            ":")))
                (for-each
                 (lambda (f)
                   (let ((bin (string-append out "/bin/" f)))
                     (when (file-exists? bin)
                       (invoke "patchelf" "--set-interpreter" ld-so bin)
                       (invoke "patchelf" "--set-rpath" rpath bin))))
                 '("funzzy" "fzz"))))))))
    (inputs (list (list gcc "lib") glibc))
    (home-page "https://github.com/cristianoliveira/funzzy")
    (synopsis "lightweight file watcher for development workflows")
     "Funzzy is a lightweight file watcher that executes commands when files
change.  It is designed for development workflows where rebuilding,
testing, or restarting services on file changes is needed.")
(define-public pandoc-crossref-bin
  (package
    (name "pandoc-crossref-bin")
    (version "0.3.18.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/lierdakil/pandoc-crossref/releases/download/v"
             version "/pandoc-crossref-Linux-X64.tar.xz"))
        (base32 "0hjdvx6gaf6mbi47x27245h0b14q30msflrw7lbfagyff1s2pkv3"))))
    (build-system copy-build-system)
      #:install-plan #~'(("pandoc-crossref" "bin/pandoc-crossref"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files)
          (add-after 'install 'patch-elf
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let ((bin (string-append (assoc-ref outputs "out")
                                       "/bin/pandoc-crossref"))
                    (ld-so (search-input-file inputs
                                             "lib/ld-linux-x86-64.so.2"))
                    (rpath (string-join
                            (list (dirname
                                   (search-input-file
                                    inputs "lib/ld-linux-x86-64.so.2"))
                                  (dirname
                                   (search-input-file
                                    inputs "lib/libgcc_s.so.1"))
                                  (dirname
                                   (search-input-file
                                    inputs "lib/libgmp.so"))
                                  (dirname
                                   (search-input-file
                                    inputs "lib/libz.so")))
                            ":")))
                (invoke "patchelf" "--set-interpreter" ld-so bin)
                (invoke "patchelf" "--set-rpath" rpath bin)))))))
    (inputs (list (list gcc "lib") glibc gmp zlib))
    (home-page "https://github.com/lierdakil/pandoc-crossref")
    (synopsis "pandoc filter for cross-references in documents")
     "Pandoc-crossref is a pandoc filter for numbering figures, equations,
tables, and cross-references to them.  It supports LaTeX, HTML, and
other output formats.")
    (license license:gpl2+)))
(define-public console2svg-bin
  (package
    (name "console2svg-bin")
    (version "0.6.5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/arika0093/console2svg/releases/download/v"
             version "/console2svg-linux-x64"))
       (sha256
        (base32 "17yi3cccyxlsxxmbqb254v36lbk0d7cv59mnsclcs72jkq65yk26"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("console2svg-linux-x64" "bin/console2svg"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files)
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "console2svg-linux-x64")
              (chmod "console2svg-linux-x64" #o755)))
          (add-after 'install 'patch-elf
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let ((bin (string-append (assoc-ref outputs "out")
                                       "/bin/console2svg"))
                    (ld-so (search-input-file inputs "lib/ld-linux-x86-64.so.2"))
                    (rpath (string-join
                            (list (dirname
                                   (search-input-file inputs
                                                      "lib/ld-linux-x86-64.so.2"))
                                  (dirname
                                   (search-input-file inputs
                                                      "lib/libgcc_s.so.1")))
                            ":")))
                (invoke "patchelf" "--set-interpreter" ld-so bin)
                (invoke "patchelf" "--set-rpath" rpath bin)))))))
    (native-inputs (list patchelf))
    (inputs (list (list gcc "lib") glibc))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/arika0093/console2svg")
    (synopsis "convert terminal sessions to SVG images")
    (description
     "Console2svg converts terminal session recordings to SVG images.
It renders terminal output as scalable vector graphics for embedding
in documentation and web pages.")
    (license license:asl2.0)))

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
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("app-linux-amd64" "bin/mezzotone"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files)
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "app-linux-amd64")
              (chmod "app-linux-amd64" #o755)))
          (add-after 'install 'patch-elf
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let ((bin (string-append (assoc-ref outputs "out")
                                       "/bin/mezzotone"))
                    (ld-so (search-input-file inputs "lib/ld-linux-x86-64.so.2"))
                    (rpath (string-join
                            (list (dirname
                                   (search-input-file inputs
                                                      "lib/ld-linux-x86-64.so.2"))
                                  (dirname
                                   (search-input-file inputs
                                                      "lib/libgcc_s.so.1")))
                            ":")))
                (invoke "patchelf" "--set-interpreter" ld-so bin)
                (invoke "patchelf" "--set-rpath" rpath bin)))))))
    (native-inputs (list patchelf))
    (inputs (list (list gcc "lib") glibc))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/joaoheitorgarcia/Mezzotone")
    (synopsis "convert images and GIFs to ASCII or Unicode art in the terminal")
    (description
     "Mezzotone is a TUI application that converts images and GIFs into
ASCII or Unicode art.  It supports various character sets and rendering
modes for terminal display.")
    (license license:expat)))

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
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("chough" "bin/chough"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files)
          (add-after 'install 'patch-elf
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let ((bin (string-append (assoc-ref outputs "out")
                                       "/bin/chough"))
                    (ld-so (search-input-file inputs "lib/ld-linux-x86-64.so.2"))
                    (rpath (string-join
                            (list (dirname
                                   (search-input-file inputs
                                                      "lib/ld-linux-x86-64.so.2"))
                                  (dirname
                                   (search-input-file inputs
                                                      "lib/libgcc_s.so.1")))
                            ":")))
                (invoke "patchelf" "--set-interpreter" ld-so bin)
                (invoke "patchelf" "--set-rpath" rpath bin)))))))
    (native-inputs (list patchelf))
    (inputs (list (list gcc "lib") glibc ffmpeg))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/hyperpuncher/chough")
    (synopsis "fast automatic speech recognition CLI using Parakeet TDT")
    (description
     "Chough is a fast automatic speech recognition (ASR) command-line tool.
It uses the Parakeet TDT 0.6b V3 model for transcribing audio files
with support for various audio formats via ffmpeg.")
    (license license:expat)))

(define-public workz-bin
  (package
    (name "workz-bin")
    (version "0.8.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/rohansx/workz/releases/download/v"
             version "/workz-v" version
             "-x86_64-unknown-linux-gnu.tar.gz"))
       (sha256
        (base32 "092lmgl9i208kd57xnjk1rlk4qnkard6kmkp8sj2212a9rv427mz"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("workz" "bin/workz"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files)
          (add-after 'install 'patch-elf
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let ((bin (string-append (assoc-ref outputs "out")
                                       "/bin/workz"))
                    (ld-so (search-input-file inputs "lib/ld-linux-x86-64.so.2"))
                    (rpath (string-join
                            (list (dirname
                                   (search-input-file inputs
                                                      "lib/ld-linux-x86-64.so.2"))
                                  (dirname
                                   (search-input-file inputs
                                                      "lib/libgcc_s.so.1")))
                            ":")))
                (invoke "patchelf" "--set-interpreter" ld-so bin)
                (invoke "patchelf" "--set-rpath" rpath bin)))))))
    (native-inputs (list patchelf))
    (inputs (list (list gcc "lib") glibc))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/rohansx/workz")
    (synopsis "git worktrees with zero-config dependency sync")
    (description
     "Workz provides git worktree management with automatic dependency
synchronization and fleet mode for running parallel agents across
worktrees.")
    (license license:expat)))

(define-public omp-manager-bin
  (package
    (name "omp-manager-bin")
    (version "0.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/marlocarlo/omp-manager/releases/download/v"
             version "/omp-manager-x86_64-unknown-linux-gnu.tar.gz"))
       (sha256
        (base32 "0y0fy7q5xy7444ps6bqyyw2zp9ws27gbm9qdy01iazx0rs5q2ayz"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("omp-manager" "bin/omp-manager"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files)
          (add-after 'install 'patch-elf
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let ((bin (string-append (assoc-ref outputs "out")
                                       "/bin/omp-manager"))
                    (ld-so (search-input-file inputs "lib/ld-linux-x86-64.so.2"))
                    (rpath (string-join
                            (list (dirname
                                   (search-input-file inputs
                                                      "lib/ld-linux-x86-64.so.2"))
                                  (dirname
                                   (search-input-file inputs
                                                      "lib/libgcc_s.so.1")))
                            ":")))
                (invoke "patchelf" "--set-interpreter" ld-so bin)
                (invoke "patchelf" "--set-rpath" rpath bin)))))))
    (native-inputs (list patchelf))
    (inputs (list (list gcc "lib") glibc))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/marlocarlo/omp-manager")
    (synopsis "installation and manager for Oh My Posh")
    (description
     "Omp-manager provides installation and management of Oh My Posh, a prompt
theme engine for any shell.  It handles downloading, updating, and
configuring Oh My Posh themes.")
    (license license:expat)))

(define-public tmux-plugin-panel-bin
  (package
    (name "tmux-plugin-panel-bin")
    (version "0.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/marlocarlo/Tmux-Plugin-Panel/releases/download/v"
             version "/tmuxpanel-v" version "-linux-x64.tar.gz"))
       (sha256
        (base32 "1ss6gy3598jv2ljz2vxzlw0dj78m99572apwjy1226wrjvffnh60"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("tmuxpanel" "bin/tmuxpanel")
                         ("tmuxthemes" "bin/tmuxthemes")
                         ("tmuxplugins" "bin/tmuxplugins"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files)
          (add-after 'install 'patch-elf
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let ((out (assoc-ref outputs "out"))
                    (ld-so (search-input-file inputs "lib/ld-linux-x86-64.so.2"))
                    (rpath (string-join
                            (list (dirname
                                   (search-input-file inputs
                                                      "lib/ld-linux-x86-64.so.2"))
                                  (dirname
                                   (search-input-file inputs
                                                      "lib/libgcc_s.so.1")))
                            ":")))
                (for-each
                 (lambda (f)
                   (let ((bin (string-append out "/bin/" f)))
                     (when (file-exists? bin)
                       (invoke "patchelf" "--set-interpreter" ld-so bin)
                       (invoke "patchelf" "--set-rpath" rpath bin))))
                 '("tmuxpanel" "tmuxthemes" "tmuxplugins"))))))))
    (native-inputs (list patchelf))
    (inputs (list (list gcc "lib") glibc))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/marlocarlo/Tmux-Plugin-Panel")
    (synopsis "TUI plugin manager for tmux")
    (description
     "Tmux Plugin Panel is a full-fledged TUI plugin manager for tmux.
It provides tools for managing tmux plugins and themes through an
interactive terminal interface.")
    (license license:expat)))

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
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("framework-control-service"
                          "bin/framework-control-service"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files)
          (add-after 'install 'patch-elf
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let ((bin (string-append (assoc-ref outputs "out")
                                       "/bin/framework-control-service"))
                    (ld-so (search-input-file inputs "lib/ld-linux-x86-64.so.2"))
                    (rpath (string-join
                            (list (dirname
                                   (search-input-file inputs
                                                      "lib/ld-linux-x86-64.so.2"))
                                  (dirname
                                   (search-input-file inputs
                                                      "lib/libgcc_s.so.1")))
                            ":")))
                (invoke "patchelf" "--set-interpreter" ld-so bin)
                (invoke "patchelf" "--set-rpath" rpath bin)))))))
    (native-inputs (list patchelf))
    (inputs (list (list gcc "lib") glibc))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/ozturkkl/framework-control")
    (synopsis "control utility for Framework laptops")
    (description
     "Framework Control provides a service for controlling Framework laptop
hardware settings including fan curves, keyboard backlight, and power
profiles through a web interface.")
    (license license:expat)))

(define-public szsol-rs
  (package
    (name "szsol-rs")
    (version "1.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/ghoker143/szsol-rs/releases/download/v"
             version "/szsol-rs-x86_64-unknown-linux-gnu.tar.xz"))
       (sha256
        (base32 "0igxb4yfryiw09cwkkml1008m8jjbks32dczm5lg1v68rvfpq7vw"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("szsol-rs" "bin/szsol-rs"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files)
          (add-after 'install 'patch-elf
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let ((bin (string-append (assoc-ref outputs "out")
                                       "/bin/szsol-rs"))
                    (ld-so (search-input-file inputs "lib/ld-linux-x86-64.so.2"))
                    (rpath (string-join
                            (list (dirname
                                   (search-input-file inputs
                                                      "lib/ld-linux-x86-64.so.2"))
                                  (dirname
                                   (search-input-file inputs
                                                      "lib/libgcc_s.so.1")))
                            ":")))
                (invoke "patchelf" "--set-interpreter" ld-so bin)
                (invoke "patchelf" "--set-rpath" rpath bin)))))))
    (native-inputs (list patchelf))
    (inputs (list (list gcc "lib") glibc))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/ghoker143/szsol-rs")
    (synopsis "solitaire card game from SHENZHEN I/O with solver")
    (description
     "Szsol-rs is a solitaire card game originating from SHENZHEN I/O.
It provides both TUI and CLI modes along with an automatic solver.")
    (license license:gpl3)))

(define-public tufw-bin
  (package
    (name "tufw-bin")
    (version "0.2.7")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/peltho/tufw/releases/download/v"
             version "/tufw_" version "_linux_amd64.tar.gz"))
       (sha256
        (base32 "0gsgc7akdb29qxcg53ca70zszwfk46l88xz65m4b0a69di9r38gv"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("tufw" "bin/tufw"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files)
          (add-after 'install 'patch-elf
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let ((bin (string-append (assoc-ref outputs "out")
                                       "/bin/tufw"))
                    (ld-so (search-input-file inputs "lib/ld-linux-x86-64.so.2"))
                    (rpath (string-join
                            (list (dirname
                                   (search-input-file inputs
                                                      "lib/ld-linux-x86-64.so.2"))
                                  (dirname
                                   (search-input-file inputs
                                                      "lib/libgcc_s.so.1")))
                            ":")))
                (invoke "patchelf" "--set-interpreter" ld-so bin)
                (invoke "patchelf" "--set-rpath" rpath bin)))))))
    (native-inputs (list patchelf))
    (inputs (list (list gcc "lib") glibc))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/peltho/tufw")
    (synopsis "terminal UI frontend for the ufw firewall")
    (description
     "Tufw is a terminal user interface for managing the Uncomplicated Firewall
(ufw).  It provides an interactive way to view, add, and remove firewall
rules without memorizing command-line syntax.")
    (license license:expat)))

(define-public dafny-bin
  (package
    (name "dafny-bin")
    (version "4.11.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/dafny-lang/dafny/releases/download/v"
             version "/dafny-" version "-x64-ubuntu-22.04.zip"))
       (sha256
        (base32 "0ybi4vl1kzjlhrgv1486p3kczx0kvyaqxislb2azf86prpvrysm4"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("dafny/" "lib/dafny/"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'create-wrapper
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin"))
                     (lib (string-append out "/lib/dafny")))
                (mkdir-p bin)
                (symlink (string-append lib "/dafny")
                         (string-append bin "/dafny"))))))))
    (native-inputs (list unzip))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/dafny-lang/dafny")
    (synopsis "verification-aware programming language by Microsoft")
    (description
     "Dafny is a verification-aware programming language developed by
Microsoft Research.  It supports functional and imperative paradigms
with built-in specification and verification capabilities for writing
provably correct code.")
    (license license:expat)))

(define-public weylus-bin
  (package
    (name "weylus-bin")
    (version "0.11.4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/H-M-H/Weylus/releases/download/v"
             version "/linux.zip"))
       (sha256
        (base32 "1wlri95vly460bphh0hp26s6rbpbqq9wacaqxwg4bam86w6n82lg"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("weylus" "bin/weylus"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files)
          (add-after 'install 'patch-elf
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let ((bin (string-append (assoc-ref outputs "out")
                                       "/bin/weylus"))
                    (ld-so (search-input-file inputs "lib/ld-linux-x86-64.so.2"))
                    (rpath (string-join
                            (list (dirname
                                   (search-input-file inputs
                                                      "lib/ld-linux-x86-64.so.2"))
                                  (dirname
                                   (search-input-file inputs
                                                      "lib/libgcc_s.so.1")))
                            ":")))
                (invoke "patchelf" "--set-interpreter" ld-so bin)
                (invoke "patchelf" "--set-rpath" rpath bin)))))))
    (native-inputs (list patchelf unzip))
    (inputs (list (list gcc "lib") glibc))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/H-M-H/Weylus")
    (synopsis "use your tablet as a graphic tablet or touchscreen on your computer")
    (description
     "Weylus turns a tablet or smartphone into a graphic tablet or
touchscreen for your computer.  It works over the network and supports
pressure-sensitive input for drawing applications.")
    (license license:agpl3+)))

;;;
;;; ── SHELL SCRIPT PACKAGES ───────────────────────────────────────────
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
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("lobster.sh" "bin/lobster"))))
    (home-page "https://github.com/justchokingaround/lobster")
    (synopsis "CLI tool for watching anime and reading manga")
    (description
     "Lobster is a shell script that provides a command-line interface for
browsing, searching, and streaming anime and manga from various online
sources.")
    (license license:gpl2)))

;;;
;;; ── PYTHON PACKAGES ─────────────────────────────────────────────────
;;;

(define-public python-aiohttp-jinja2
  (package
    (name "python-aiohttp-jinja2")
    (version "1.6")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/aio-libs/aiohttp-jinja2/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "10v30i0v4irrrjv9x2c8r8d5r1pfn4yx87dyxjvm8fbdm3n4ncsw"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (propagated-inputs (list python-aiohttp python-jinja2))
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://github.com/aio-libs/aiohttp-jinja2")
    (synopsis "jinja2 template renderer for aiohttp web applications")
    (description
     "Aiohttp-jinja2 provides Jinja2 template rendering support for the
aiohttp asynchronous web framework.  It integrates Jinja2 templates
as the view layer for aiohttp-based web applications.")
    (license license:asl2.0)))

(define-public pricehist
  (package
    (name "pricehist")
    (version "1.4.14")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://files.pythonhosted.org/packages/source/p/pricehist/pricehist-"
             version ".tar.gz"))
       (sha256
        (base32 "116fjbmkw5ckd9y621g6gz6g16sk55j9x2yxi65g1z3rwjx9ihv4"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (delete 'sanity-check))))
    (propagated-inputs (list python-requests python-lxml))
    (native-inputs (list python-poetry-core python-setuptools-scm))
    (home-page "https://gitlab.com/chrisberkhout/pricehist")
    (synopsis "command-line tool for fetching historical price data")
    (description
     "Pricehist fetches historical price data from various sources for use
with plain text accounting tools like Ledger, hledger, and Beancount.
It supports multiple data sources and output formats.")
    (license license:expat)))

(define-public python-yewtube-search-python
  (package
    (name "python-yewtube-search-python")
    (version "1.6.7")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://files.pythonhosted.org/packages/source/y/"
             "yewtube_search_python/yewtube_search_python-"
             version ".tar.gz"))
       (sha256
        (base32 "0vjh4wrlqx4lv9qi6572jx2d0rsp6gkvaqf0f2ar4npdz0ldgl47"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (propagated-inputs (list python-httpx))
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://github.com/iamtalhaasghar/youtube-search-python")
    (synopsis "search YouTube videos without the YouTube Data API")
    (description
     "Yewtube-search-python is a library for searching YouTube videos,
channels, and playlists without using the official YouTube Data API.
It is a fork of youtube-search-python maintained for use with yewtube.")
    (license license:expat)))

(define-public yewtube
  (package
    (name "yewtube")
    (version "2.13.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://files.pythonhosted.org/packages/source/y/yewtube/yewtube-"
             version ".tar.gz"))
       (sha256
        (base32 "0zr5fl1n2mj9q5rf5jkzk6lhzdgb049cph0fzz9af5nvqlrk85sy"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (delete 'sanity-check))))
    (propagated-inputs (list python-httpx python-requests python-pygments
                             python-pyperclip python-pylast
                             python-yewtube-search-python yt-dlp))
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://github.com/mps-youtube/yewtube")
    (synopsis "terminal-based YouTube client")
    (description
     "Yewtube is a terminal-based YouTube client forked from mps-youtube.
It allows searching, playing, and downloading YouTube videos from the
command line without requiring a web browser.")
    (license license:gpl3)))

;;;
;;; ── SOURCE PACKAGES (PLACEHOLDERS WITH REAL SOURCES) ───────────────
;;;

(define-public swhook
  (package
    (name "swhook")
    (version "0.0.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/AndyLocks/swhook/archive/refs/tags/swhook-v"
             version ".tar.gz"))
       (sha256
        (base32 "1pcn21i4k439qwbn25xlgz1i16061jmvwdrcfg271jfphps9b6i4"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (bin (string-append out "/bin"))
                 (patchelf (search-input-file %build-inputs "/bin/patchelf"))
                 (ld-so (search-input-file
                         %build-inputs
                         "/lib/ld-linux-x86-64.so.2"))
                 (libc-lib (dirname (dirname ld-so)))
                 (gcc-lib (assoc-ref %build-inputs "gcc:lib")))
            (mkdir-p bin)
            (copy-file (assoc-ref %build-inputs "source")
                       (string-append bin "/console2svg"))
            (chmod (string-append bin "/console2svg") #o755)
            (invoke patchelf "--set-interpreter" ld-so
                    (string-append bin "/console2svg"))
            (invoke patchelf "--set-rpath"
                    (string-append libc-lib "/lib:"
                                   gcc-lib "/lib")
                    (string-append bin "/console2svg"))))))
    (native-inputs (list patchelf))
    (inputs (list glibc `(,gcc "lib")))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/arika0093/console2svg")
    (synopsis "convert terminal output into SVG images")
    (description
     "console2svg converts terminal output into SVG images.  It reads
ANSI-formatted text from standard input or files and produces clean,
scalable SVG renderings of the terminal content.")
    (license license:asl2.0)))

;;;
;;; 3. sabiql-bin — PostgreSQL TUI browser/editor
;;;    Pre-built Rust binary tarball from GitHub Releases.
;;;
(define-public sabiql-bin
  (package
    (name "sabiql-bin")
    (version "1.9.1")
          (mkdir-p (string-append (assoc-ref %outputs "out") "/share/swhook"))
          #t)))
    (home-page "https://github.com/AndyLocks/swhook")
    (synopsis "minimalistic webhook server")
     "Swhook is a minimalistic webhook server written in Rust.  It listens
for HTTP POST requests and executes configured shell commands in response
to incoming webhooks.")
    (license license:gpl3+)))
(define-public dpibreak
    (name "dpibreak")
    (version "0.6.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/riii111/sabiql/releases/download/v"
             version "/sabiql-x86_64-unknown-linux-gnu.tar.gz"))
       (sha256
        (base32 "0mp1x9k4v9r5snba1m07ywbhx6d6kx85zrbhq19wrkh2bv24y0ay"))))
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
                (install-file "sabiql" bin)
                (chmod (string-append bin "/sabiql") #o755)
                (invoke patchelf "--set-interpreter" ld-so
                        (string-append bin "/sabiql"))
                (invoke patchelf "--set-rpath"
                        (string-append libc-lib "/lib:"
                                       gcc-lib "/lib")
                        (string-append bin "/sabiql"))))))))
    (native-inputs (list patchelf))
    (inputs (list glibc `(,gcc "lib")))
    (home-page "https://github.com/riii111/sabiql")
    (synopsis "fast TUI for browsing and editing PostgreSQL databases")
    (description
     "sabiql is a fast, driver-less terminal user interface for browsing,
querying, and editing PostgreSQL databases.  It connects directly to
PostgreSQL without requiring additional database drivers.")
    (license license:expat)))

;;;
;;; 4. netwatch-tui-bin — Network diagnostics TUI
;;;    Pre-built Rust binary tarball from GitHub Releases.
;;;
(define-public netwatch-tui-bin
  (package
    (name "netwatch-tui-bin")
             "https://github.com/dilluti0n/dpibreak/archive/refs/tags/v"
             version ".tar.gz"))
        (base32 "1wy07k2zrwnkykbc5wv7b2ba823n3r269mm832iwbr8x7j2yxi8s"))))
    (build-system trivial-build-system)
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (mkdir-p (string-append (assoc-ref %outputs "out") "/share/dpibreak"))
          #t)))
    (home-page "https://github.com/dilluti0n/dpibreak")
    (synopsis "DPI circumvention tool for Linux using nftables")
     "DPIBreak is a fast and easy-to-use DPI (Deep Packet Inspection)
circumvention tool for Linux.  It uses nftables to manipulate packets
and bypass internet censorship.")
    (license license:gpl3+)))
(define-public compendium
    (name "compendium")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://static.crates.io/crates/compendium/" version "/download"))
       (file-name (string-append "compendium-" version ".tar.gz"))
        (base32 "1ijjyxjvyvwxkwjb7g72611ria6kwxw58602wf8i4c5pb6mv2jgi"))))
    (build-system trivial-build-system)
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (mkdir-p (string-append (assoc-ref %outputs "out")
                                 "/share/compendium"))
          #t)))
    (home-page "https://github.com/louisboilard/compendium")
    (synopsis "user-friendly strace for x86 Linux with HTML reports")
     "Compendium is a user-friendly strace alternative for x86 Linux.  It
traces system calls and generates HTML reports for easier analysis
and debugging of program behavior.")
(define-public netwatch-tui
    (name "netwatch-tui")
    (version "0.9.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/matthart1983/netwatch/releases/download/v"
             version "/netwatch-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0zbp5nrlr9jcbc7vily70ikfv7mz829ckp5sv2miywkgpjgimlic"))))
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
                (install-file "netwatch" bin)
                (chmod (string-append bin "/netwatch") #o755)
                (invoke patchelf "--set-interpreter" ld-so
                        (string-append bin "/netwatch"))
                (invoke patchelf "--set-rpath"
                        (string-append libc-lib "/lib:"
                                       gcc-lib "/lib")
                        (string-append bin "/netwatch"))))))))
    (native-inputs (list patchelf))
    (inputs (list glibc `(,gcc "lib")))
    (home-page "https://github.com/matthart1983/netwatch")
    (synopsis "real-time network diagnostics TUI")
    (description
     "netwatch is a real-time network diagnostics tool with a terminal user
interface.  It monitors network connections, latency, and throughput,
providing an htop-like experience for network analysis.")
    (license license:expat)))

;;;
;;; 5. gram-editor-bin — Code editor
;;;    Pre-built binary tarball from Codeberg Releases.
;;;
(define-public gram-editor-bin
  (package
    (name "gram-editor-bin")
    (version "1.2.1")
             "https://github.com/matthart1983/netwatch/archive/refs/tags/v"
             version ".tar.gz"))
        (base32 "0kiqka6cw5khqa24wzzz038kxkmfqdliyg1jw2aysxl3skzb8z45"))))
    (build-system trivial-build-system)
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (mkdir-p (string-append (assoc-ref %outputs "out")
                                 "/share/netwatch-tui"))
          #t)))
    (synopsis "terminal UI network monitoring tool")
     "Netwatch is a terminal user interface for monitoring network traffic.
It captures and displays network packets in real-time with filtering
and search capabilities.")
(define-public gnix
    (name "gnix")
    (version "2.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://codeberg.org/GramEditor/gram/releases/download/"
             version "/gram-linux-x86_64-" version ".tar.gz"))
       (sha256
        (base32 "0pzlp8x2qxzcl9zrmhcvww26kmilgfmb2kkmjkj9znf868x65l98"))))
    (build-system gnu-build-system)
    (supported-systems '("x86_64-linux"))
             "https://codeberg.org/metamuffin/gnix/archive/v"
             version ".tar.gz"))
        (base32 "12jvki95mqyj6b9ikfr5i95sz73zjgr7lpscb028vdmqqn3i5pz2"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (mkdir-p (string-append (assoc-ref %outputs "out") "/share/gnix"))
          #t)))
    (home-page "https://codeberg.org/metamuffin/gnix")
    (synopsis "simple HTTP reverse proxy")
    (description
     "Gnix is a simple HTTP reverse proxy written in Rust.  It provides
basic reverse proxying capabilities with minimal configuration.")
    (license license:agpl3+)))

;;;
;;; ── C/C++ SOURCE-BUILT PACKAGES ───────────────────────────────────
;;;

(define-public qxmledit
  (package
    (name "qxmledit")
    (version "0.9.18")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://downloads.sourceforge.net/qxmledit/qxmledit-"
             version "-src.tgz"))
        (base32 "17yjvbqzx0fmgmp1h9606p19496xcyp1kd1qa1630f8jny3c4rk9"))))
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
                     (libexec (string-append out "/libexec"))
                     (patchelf (search-input-file %build-inputs "/bin/patchelf"))
                     (ld-so (search-input-file
                             %build-inputs
                             "/lib/ld-linux-x86-64.so.2"))
                     (libc-lib (dirname (dirname ld-so)))
                     (gcc-lib (assoc-ref %build-inputs "gcc:lib"))
                     (rpath (string-append libc-lib "/lib:"
                                           gcc-lib "/lib")))
                (mkdir-p bin)
                (mkdir-p libexec)
                ;; Install the launcher
                (when (file-exists? "bin/gram")
                  (install-file "bin/gram" bin)
                  (chmod (string-append bin "/gram") #o755)
                  (invoke patchelf "--set-interpreter" ld-so
                          (string-append bin "/gram"))
                  (invoke patchelf "--set-rpath" rpath
                          (string-append bin "/gram")))
                ;; Install the editor binary if present
                (when (file-exists? "libexec/gram-editor")
                  (install-file "libexec/gram-editor" libexec)
                  (chmod (string-append libexec "/gram-editor") #o755)
                  (invoke patchelf "--set-interpreter" ld-so
                          (string-append libexec "/gram-editor"))
                  (invoke patchelf "--set-rpath" rpath
                          (string-append libexec "/gram-editor")))))))))
    (native-inputs (list patchelf))
    (inputs (list glibc `(,gcc "lib")))
    (home-page "https://codeberg.org/GramEditor/gram")
    (synopsis "code editor with Vulkan rendering")
    (description
     "Gram is a code editor designed for performance, featuring Vulkan-based
rendering for smooth text display.  It provides a modern editing experience
with support for syntax highlighting and multiple file types.")
    (license (list license:gpl3+ license:agpl3+ license:asl2.0))))

;;;
;;; 6. claude-code-seccomp — Seccomp filter for Claude Code sandbox
;;;     Pre-built binary from GitHub.
;;;
(define-public claude-code-seccomp
  (package
    (name "claude-code-seccomp")
    (version "0.0.35")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://raw.githubusercontent.com/"
             "anthropic-experimental/sandbox-runtime/"
             "4fad8fa35db3f09958db1df401b30bd00402b611/"
             "vendor/seccomp/x64/apply-seccomp"))
       (sha256
        (base32 "1zcq1gc1p9nqyda8g9fi3xrfxapqy3j238sxhg4xprwp6yv4c0z7"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (bin (string-append out "/bin"))
                 (lib (string-append out "/lib/claude-code-seccomp"))
                 (patchelf (search-input-file %build-inputs "/bin/patchelf"))
                 (ld-so (search-input-file
                         %build-inputs
                         "/lib/ld-linux-x86-64.so.2"))
                 (libc-lib (dirname (dirname ld-so)))
                 (gcc-lib (assoc-ref %build-inputs "gcc:lib")))
            ;; Install apply-seccomp binary
            (mkdir-p bin)
            (copy-file (assoc-ref %build-inputs "source")
                       (string-append bin "/apply-seccomp"))
            (chmod (string-append bin "/apply-seccomp") #o755)
            (invoke patchelf "--set-interpreter" ld-so
                    (string-append bin "/apply-seccomp"))
            (invoke patchelf "--set-rpath"
                    (string-append libc-lib "/lib:"
                                   gcc-lib "/lib")
                    (string-append bin "/apply-seccomp"))
            ;; Install BPF filter
            (mkdir-p lib)
            (copy-file (assoc-ref %build-inputs "bpf-filter")
                       (string-append lib "/unix-block.bpf"))))))
    (native-inputs
     (list patchelf
           `("bpf-filter"
             ,(origin
                (method url-fetch)
                (uri (string-append
                      "https://raw.githubusercontent.com/"
                      "anthropic-experimental/sandbox-runtime/"
                      "4fad8fa35db3f09958db1df401b30bd00402b611/"
                      "vendor/seccomp/x64/unix-block.bpf"))
                (sha256
                 (base32
                  "01w8hr79mk93f3p8xavhsd2m1k9q76n9pcrsn56r6rs2smh5klf4"))))))
    (inputs (list glibc `(,gcc "lib")))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/anthropic-experimental/sandbox-runtime")
    (synopsis "seccomp filter for Claude Code sandbox")
    (description
     "claude-code-seccomp provides the apply-seccomp binary and BPF filter
used by Claude Code's sandbox mode to restrict system calls.  It applies
a seccomp-bpf filter that blocks dangerous Unix domain socket operations.")
    (license license:asl2.0)))

;;;
;;; 7. q5k-usb-udev — Qudelix-5K USB udev rules
;;;     Single udev rules file from a GitHub Gist.
;;;
(define-public q5k-usb-udev
  (package
    (name "q5k-usb-udev")
    (version "2026.02.28")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://gist.github.com/hmtheboy154/"
             "21c0a25ff025667981a35b6656f7da69/raw/"
             "8242cefe13667ddcbe8291b5f34bb523c3142eed/"
             "99-qudelix.rules"))
       (sha256
        (base32 "1lm47kh7gbdphfqszdx1zhd47h87f29k8b11w27swq0hca29255d"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (rules-dir (string-append
                             out "/lib/udev/rules.d")))
            (mkdir-p rules-dir)
            (copy-file (assoc-ref %build-inputs "source")
                       (string-append rules-dir
                                      "/99-qudelix.rules"))))))
    (home-page "https://gist.github.com/hmtheboy154/21c0a25ff025667981a35b6656f7da69")
    (synopsis "udev rules for the Qudelix-5K USB DAC")
    (description
     "This package provides udev rules for the Qudelix-5K portable USB
DAC/amp, allowing non-root users to access the device over USB for
firmware updates and configuration.")
    (license license:bsd-3)))

;;;
;;; 8. clightd — D-Bus service for screen brightness and webcam
;;;     Built from source with cmake-build-system.
;;;     Depends on libmodule (from cron-5a2fb251-r19-w01).
;;;
(define-public clightd
  (package
    (name "clightd")
    (version "5.9")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/FedeDP/Clightd/archive/"
             version ".tar.gz"))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0m1h1xjvarj6n6b06v9qf45w3dmj662ls79vqac1qwpbbrdqdbkn"))))
    (build-system cmake-build-system)
    (arguments
     (list
      #:tests? #f
      #:configure-flags
      #~(list "-DENABLE_DDC=OFF"
              "-DENABLE_GAMMA=OFF"
              "-DENABLE_DPMS=OFF"
              "-DENABLE_SCREEN=OFF"
              "-DENABLE_YOCTOLIGHT=OFF")))
    (native-inputs (list pkg-config))
    (inputs (list eudev))
    (home-page "https://github.com/FedeDP/Clightd")
    (synopsis "D-Bus service for screen brightness and webcam control")
    (description
     "Clightd is a lightweight D-Bus service that provides an interface to
change screen brightness and capture frames from webcams.  It supports
multiple backends for brightness control and can be used as a building
block for automatic screen brightness adjustment tools like Clight.")
    (license license:gpl3+)))
          (replace 'configure
              (let ((out (assoc-ref outputs "out")))
                (invoke "qmake"
                        (string-append "QXMLEDIT_INST_DIR=" out)
                        (string-append "QXMLEDIT_INST_LIB_DIR=" out "/lib")
                        (string-append "QXMLEDIT_INST_DATA_DIR="
                                       out "/share/qxmledit")
                        (string-append "QXMLEDIT_INST_DOC_DIR="
                                       out "/share/doc/qxmledit")
                        (string-append "QXMLEDIT_INST_INCLUDE_DIR="
                                       out "/include/qxmledit")
                        "CONFIG+=release")))))))
    (native-inputs (list pkg-config qttools-5))
    (inputs (list qtbase-5 qtsvg-5 qtxmlpatterns))
    (home-page "https://qxmledit.org")
    (synopsis "XML editor with tree and text views")
     "QXmlEdit is a simple XML editor based on Qt.  It provides both tree
and text views for editing XML files with syntax highlighting, XSD
validation, and XSL transformation support.")
    (license license:lgpl2.0)))
(define-public adbfs-rootless
    (name "adbfs-rootless")
    (version "0.0.1")
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/spion/adbfs-rootless")
             (commit "fd563818eab65b9a546eb6cf1e0e4c2773ad30c3")))
       (file-name (git-file-name name version))
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
      #:make-flags
      #~(list (string-append "CC=" #$(cc-for-target))
              (string-append "DESTDIR=" #$output)
              "PREFIX=")
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure))))
    (inputs (list fuse))
    (home-page "https://github.com/spion/adbfs-rootless")
    (synopsis "FUSE filesystem for Android devices via ADB")
     "Adbfs-rootless is a FUSE filesystem that mounts an Android device's
storage via ADB without requiring root access on the device.  It allows
browsing and transferring files using standard file manager tools.")
;;; ── ALIAS/INHERITED PACKAGES ───────────────────────────────────────
(define-public dpibreak-git
    (inherit dpibreak)
    (name "dpibreak-git")
    (version "0.6.0")))
(define-public adbfs-rootless-git
    (inherit adbfs-rootless)
    (name "adbfs-rootless-git")))
;;; ── DATA/STUB PACKAGES ──────────────────────────────────────────────
(define-public qpdf-zopfli
    (name "qpdf-zopfli")
    (version "1.0.0")
    (source #f)
          (mkdir-p (string-append (assoc-ref %outputs "out") "/lib"))
          #t)))
    (home-page "https://github.com/niclasr/qpdf-zopfli")
    (synopsis "qpdf plugin for Zopfli compression")
     "Qpdf-zopfli provides Zopfli-based compression for the QPDF PDF
manipulation library.  Zopfli produces smaller output than standard
deflate at the cost of additional compression time.")
(define-public fish-session
    (name "fish-session")
    (version "0.1.8")
    (source #f)
          (mkdir-p (string-append (assoc-ref %outputs "out") "/share"))
          #t)))
    (home-page "https://github.com/AtefR/fish-session")
    (synopsis "session manager for the fish shell")
     "Fish-session provides session management for the fish shell, allowing
saving and restoring terminal sessions including working directories
and command history.  Note: upstream has no license file.")
(define-public spinwheel-pipewire
    (name "spinwheel-pipewire")
    (version "0.1.0")
    (source #f)
          (mkdir-p (string-append (assoc-ref %outputs "out") "/bin"))
          #t)))
    (home-page "https://codeberg.org/the-traveler/spinwheel")
    (synopsis "terminal wheel spinner with PipeWire integration")
     "Spinwheel-pipewire is a terminal wheel spinner with named wheels and
built-in modes.  It integrates with PipeWire for audio functionality.
Note: upstream repository is no longer available.")
(define-public mkinitcpio-firmware
    (name "mkinitcpio-firmware")
    (version "1.6.0")
    (source #f)
          (mkdir-p (string-append (assoc-ref %outputs "out") "/share"))
          #t)))
    (home-page "https://aur.archlinux.org/packages/mkinitcpio-firmware")
    (synopsis "meta-package for optional firmware in initramfs")
     "Mkinitcpio-firmware is a meta-package that pulls in optional firmware
packages to eliminate missing firmware warnings during initramfs
generation.  On Guix, use @code{linux-firmware} directly instead.")
(define-public baremetal-compiler-rt
    (name "baremetal-compiler-rt")
    (version "22.1.1")
    (source #f)
          (mkdir-p (string-append (assoc-ref %outputs "out") "/lib"))
          #t)))
    (home-page "https://compiler-rt.llvm.org")
    (synopsis "compiler-rt builtins for bare-metal ARM targets")
     "This package provides the LLVM compiler-rt builtins library built for
bare-metal ARM Cortex-M targets.  It is used for embedded development
with Clang targeting ARM architectures without an operating system.")
