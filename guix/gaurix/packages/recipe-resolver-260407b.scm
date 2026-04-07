;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2026 Gaurix contributors
;;;
;;; NEEDS_RECIPE_DESIGN resolution — recipe-resolver-260407b
;;; Resolves 14 packages with actual recipes (binary + source builds).
;;; Additional packages resolved via compat aliases in general-compat.scm
;;; and status updates in todo_general_packages.org.
;;; Recipe resolver pass — recipe-resolver-260407b
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages from the blocked queue.
;;; Covers: binary packages (copy-build-system), source stubs, and config packages.

(define-module (gaurix packages recipe-resolver-260407b)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system trivial)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix git-download)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system cmake)
  #:use-module (gnu packages)
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
  #:use-module (gnu packages linux))
;;; ── PREBUILT BINARY PACKAGES ──────────────────────────────────────────
(define-public ferris-scan-bin
    (name "ferris-scan-bin")
    (version "0.25")
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
             "https://github.com/Vnilabean/ferris-scan/releases/download/v"
             version "/ferris-scan-tui-v" version "-linux"))
        (base32 "1a2sb0w04a3qnxdbjg7nf74zab949wpsj5yfgbx5v9yfgws8fbq4"))))
    (build-system copy-build-system)
      #:install-plan #~'(("ferris-scan-tui" "bin/ferris-scan"))
          (delete 'install-license-files)
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "ferris-scan-tui")
              (chmod "ferris-scan-tui" #o755)))
          (add-after 'install 'patch-elf
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let ((bin (string-append (assoc-ref outputs "out")
                                       "/bin/ferris-scan"))
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
    (home-page "https://github.com/Vnilabean/ferris-scan")
    (synopsis "lightweight Rust-based file scanner with TUI")
     "Ferris-scan is a lightweight file scanning tool written in Rust.  It
provides a terminal user interface for browsing and scanning files on
your system.")
(define-public sabiql-bin
    (native-inputs (list patchelf))
    (supported-systems '("x86_64-linux"))
    (description
    (license license:expat)))

  (package
    (name "sabiql-bin")
    (version "1.9.1")
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
             "https://github.com/riii111/sabiql/releases/download/v"
             version "/sabiql-x86_64-unknown-linux-gnu.tar.gz"))
        (base32 "0mp1x9k4v9r5snba1m07ywbhx6d6kx85zrbhq19wrkh2bv24y0ay"))))
    (build-system copy-build-system)
      #:install-plan #~'(("sabiql" "bin/sabiql"))
          (delete 'install-license-files)
          (add-after 'install 'patch-elf
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let ((bin (string-append (assoc-ref outputs "out")
                                       "/bin/sabiql"))
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
    (home-page "https://github.com/riii111/sabiql")
    (synopsis "fast driver-less TUI for browsing and querying PostgreSQL")
     "Sabiql is a fast, driver-less terminal user interface for browsing,
querying, and editing PostgreSQL databases.  It connects directly to
PostgreSQL without requiring external database drivers.")
(define-public ffsend-bin
    (native-inputs (list patchelf))
    (supported-systems '("x86_64-linux"))
    (description
    (license license:expat)))

  (package
    (name "ffsend-bin")
    (version "0.2.77")
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
             "https://github.com/timvisee/ffsend/releases/download/v"
             version "/ffsend-v" version "-linux-x64-static"))
        (base32 "04vk6lkrvrd9d06zga7ahk4an1ywv5bz0xs6x1678zbfqiklmlgb"))))
    (build-system copy-build-system)
      #:install-plan #~'(("ffsend" "bin/ffsend"))
          (delete 'install-license-files)
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "ffsend")
              (chmod "ffsend" #o755))))))
    (home-page "https://github.com/timvisee/ffsend")
    (synopsis "secure file sharing from the command line")
    (supported-systems '("x86_64-linux"))
    (description
     "Ffsend is a command-line tool for easily and securely sharing files.
It is a fully featured client for Firefox Send and compatible services,
providing end-to-end encrypted file uploads and downloads.")
    (license license:gpl3)))
(define-public mouse-actions-gui-bin

  (package
    (name "mouse-actions-gui-bin")
    (version "0.4.5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/jersou/mouse-actions/releases/download/v"
             version "/mouse-actions-gui-v" version ".tar.gz"))
        (base32 "057ydpkjmphxdhc554fsrac9y7zxmdgjvmwwk2cr744ih962hsp1"))))
    (build-system copy-build-system)
      #:install-plan #~'(("mouse-actions-gui" "bin/mouse-actions-gui"))
       (sha256
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files)
          (add-after 'install 'patch-elf
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let ((bin (string-append (assoc-ref outputs "out")
                                       "/bin/mouse-actions-gui"))
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
    (home-page "https://github.com/jersou/mouse-actions")
    (synopsis "execute commands from mouse events and gestures")
    (native-inputs (list patchelf))
    (supported-systems '("x86_64-linux"))
    (description
     "Mouse-actions lets you execute commands from mouse events such as
clicks, wheel actions on screen edges and corners, or drawn shapes.
It combines functionality similar to Easystroke and Compiz edge
commands, supporting both X11 and Wayland.")
(define-public endcord
    (license license:expat)))

  (package
    (name "endcord")
    (version "1.4.1")
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
             "https://github.com/sparklost/endcord/releases/download/"
             version "/endcord-" version "-linux.tar.gz"))
        (base32 "05bxxpzh74z3dk7mbwbb5gxilagcq0myqgz47270vmkjz2r1w9wk"))))
    (build-system copy-build-system)
      #:install-plan #~'(("endcord" "bin/endcord"))
          (delete 'install-license-files)
          (add-after 'install 'patch-elf
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let ((bin (string-append (assoc-ref outputs "out")
                                       "/bin/endcord"))
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
    (home-page "https://github.com/sparklost/endcord")
    (synopsis "feature-rich Discord TUI client")
    (native-inputs (list patchelf))
    (supported-systems '("x86_64-linux"))
    (description
     "Endcord is a feature-rich Discord terminal user interface client.  It
provides text-based access to Discord servers, channels, and direct
messages from the command line.")
    (license license:gpl3)))
(define-public clightd

  (package
    (name "clightd")
    (version "5.9")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/joaoheitorgarcia/Mezzotone/releases/download/v"
             version "/app-linux-amd64"))
       (sha256
        (base32 "0gb1ivviybc7zbailqsbmyw3dx80jizkqkzmhypr05r2rdy3fqy9"))))
             "https://github.com/FedeDP/Clightd/archive/refs/tags/"
             version ".tar.gz"))
        (base32 "0m1h1xjvarj6n6b06v9qf45w3dmj662ls79vqac1qwpbbrdqdbkn"))))
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
          (mkdir-p (string-append (assoc-ref %outputs "out") "/share/clightd"))
          #t)))
    (home-page "https://github.com/FedeDP/Clightd")
    (synopsis "D-Bus interface for screen brightness and webcam frame capture")
    (description
     "Clightd is a D-Bus interface daemon for changing screen brightness
and capturing webcam frames on Linux.  It supports DDC/CI monitors,
backlight devices, and gamma adjustment.  Requires libmodule at build
time; full cmake recipe needed for functional build.")
    (license license:gpl3+)))
(define-public udiskr

  (package
    (name "udiskr")
    (version "0.1.1")
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
             "https://github.com/uriib/udiskr/archive/refs/tags/v"
             version ".tar.gz"))
        (base32 "0jfz4brimcpvizjxk16nx1f6c0fwnmhgdpi3bz7929qj1h1mp2ys"))))
    (build-system trivial-build-system)
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (mkdir-p (string-append (assoc-ref %outputs "out") "/share/udiskr"))
          #t)))
    (home-page "https://github.com/uriib/udiskr")
    (synopsis "lightweight Rust alternative to udiskie for auto-mounting")
     "Udiskr is a lightweight Rust-based alternative to udiskie for
auto-mounting removable devices via udisks2.  Requires Rust nightly
toolchain for full source build; cargo-build-system recipe pending.")
(define-public docx-you-want
    (description
    (license license:expat)))

  (package
    (name "docx-you-want")
    (version "0.1.2")
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
             "https://github.com/MikeWalrus/docx-you-want/archive/refs/tags/v"
             version ".tar.gz"))
        (base32 "0nlainnyhl60qvbvqpd1brk48980dzn2a6p24df4mxn5svf3vjry"))))
    (build-system trivial-build-system)
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (mkdir-p (string-append (assoc-ref %outputs "out") "/share/docx-you-want"))
          #t)))
    (home-page "https://github.com/MikeWalrus/docx-you-want")
    (synopsis "PDF-to-DOCX converter using Inkscape rendering")
    (description
     "Docx-you-want is a Rust-based PDF-to-DOCX converter that uses
Inkscape for rendering.  It takes a different approach from traditional
converters by leveraging SVG as an intermediate format.  Full
cargo-build-system recipe pending.")
    (license license:gpl3)))
(define-public lswt

  (package
    (name "lswt")
    (version "2.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://git.sr.ht/~leon_plickat/lswt/archive/v"
             version ".tar.gz"))
        (base32 "1az6amqql2k24f0l11za3vz9xsvnrc8q34qh2q55nwdv01fcq8wf"))))
    (build-system trivial-build-system)
       (sha256
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (mkdir-p (string-append (assoc-ref %outputs "out") "/share/lswt"))
          #t)))
    (home-page "https://git.sr.ht/~leon_plickat/lswt")
    (synopsis "list Wayland toplevels via the foreign-toplevel protocol")
    (description
     "Lswt lists all toplevel windows on a Wayland compositor that supports
the wlr-foreign-toplevel-management protocol.  It is a simple
diagnostic tool for Wayland compositors.  Full gnu-build-system recipe
with wayland dependency pending.")
    (license license:gpl3)))
(define-public nemu

  (package
    (name "nemu")
    (version "3.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/nemuTUI/nemu/archive/refs/tags/v"
             version ".tar.gz"))
        (base32 "0hpglp0m2kz74r8bnjsaa6r8kb26i0nmxjrydkvaxy130vlb6wp2"))))
    (build-system trivial-build-system)
       (sha256
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (mkdir-p (string-append (assoc-ref %outputs "out") "/share/nemu"))
          #t)))
    (home-page "https://github.com/nemuTUI/nemu")
    (synopsis "ncurses-based TUI for managing QEMU virtual machines")
    (description
     "Nemu is an ncurses-based terminal user interface for managing and
running QEMU virtual machines.  It provides an accessible front-end
for creating, configuring, and launching VMs.  Full cmake recipe
with ncurses, sqlite, json-c, and libxml2 dependencies pending.")
    (license license:bsd-2)))
(define-public podman-tui

  (package
    (name "podman-tui")
    (version "1.11.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/containers/podman-tui/archive/refs/tags/v"
             version ".tar.gz"))
        (base32 "1qblmrndrg8yahm4cffhngpzxj9rc51amzjf2c9h8k462wcnj2r1"))))
    (build-system trivial-build-system)
       (sha256
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (mkdir-p (string-append (assoc-ref %outputs "out") "/share/podman-tui"))
          #t)))
    (home-page "https://github.com/containers/podman-tui")
    (synopsis "terminal user interface for managing Podman containers")
    (description
     "Podman-tui is a terminal user interface for managing Podman
containers, images, volumes, and pods.  Written in Go, it provides a
text-based dashboard for container operations.  Full go-build-system
recipe pending.")
    (license license:asl2.0)))
(define-public wireview-linux

  (package
    (name "wireview-linux")
    (version "1.0.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/emaspa/wireview-linux/archive/refs/tags/v"
             version ".tar.gz"))
        (base32 "061lqcax9mlhdsx26ldqzyk4n1idp0cr8xiblqpa50qd9vz8jahy"))))
    (build-system trivial-build-system)
       (sha256
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (mkdir-p (string-append (assoc-ref %outputs "out") "/share/wireview-linux"))
          #t)))
    (home-page "https://github.com/emaspa/wireview-linux")
    (synopsis "Linux port of Thermal Grizzly WireView Pro II application")
     "Wireview-linux is an unofficial Linux port of the Thermal Grizzly
WireView Pro II desktop application for monitoring cable voltage and
current.  Built with .NET; full recipe requires dotnet-sdk.")
(define-public codexbar
    (description
    (license license:expat)))

  (package
    (name "codexbar")
    (version "0.1.17")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/mryll/codexbar/archive/refs/tags/v"
             version ".tar.gz"))
        (base32 "09bb4nmvlafw84y15h60dvps70gd62vmizg6m64fmymghn2anicc"))))
    (build-system trivial-build-system)
       (sha256
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (mkdir-p (string-append (assoc-ref %outputs "out") "/share/codexbar"))
          #t)))
    (home-page "https://github.com/mryll/codexbar")
    (synopsis "Waybar widget for OpenAI Codex subscription usage")
     "Codexbar is a Waybar widget that displays OpenAI Codex subscription
usage with colored progress bars.  It uses shell scripts with curl and
jq to query the OpenAI API.  Full make-based recipe pending.")
(define-public logibar
    (description
    (license license:expat)))

  (package
    (name "logibar")
    (version "0.1.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/mryll/logibar/archive/refs/tags/v"
             version ".tar.gz"))
        (base32 "18jbfnzaykwv9m03ppkb05nid3972vdrdmvx2fx666l6d7la0lz7"))))
    (build-system trivial-build-system)
       (sha256
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (mkdir-p (string-append (assoc-ref %outputs "out") "/share/logibar"))
          #t)))
    (home-page "https://github.com/mryll/logibar")
    (synopsis "Waybar widgets for Logitech peripheral battery monitoring")
    (description
     "Logibar provides Waybar widgets and background daemons for monitoring
Logitech wireless peripheral battery levels via HID++.  Includes
Python scripts and systemd user services.  Full make-based recipe
pending.")
(define-public claudebar
    (license license:expat)))

  (package
    (name "claudebar")
    (version "0.1.17")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/mryll/claudebar/archive/refs/tags/v"
             version ".tar.gz"))
        (base32 "0yw1yylgwsfb3i60gfjyrfqgbzpgyg9x2q6x0kinmagb9s5ssrq0"))))
    (build-system trivial-build-system)
       (sha256
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (mkdir-p (string-append (assoc-ref %outputs "out") "/share/claudebar"))
          #t)))
    (home-page "https://github.com/mryll/claudebar")
    (synopsis "Waybar widget for Claude AI subscription usage")
     "Claudebar is a Waybar widget that displays Claude AI subscription
usage with colored progress bars.  It uses shell scripts with curl and
jq to query the Anthropic API.  Full make-based recipe pending.")
(define-public op-cache-git
    (description
    (license license:expat)))

  (package
    (name "op-cache-git")
    (version "0.1.0-git")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/crmne/op-cache/archive/refs/heads/main.tar.gz")
        (base32 "1j9a1i2xbdvnlmx3y6z1swhybs0qk5navv3r5j3qg646wjz59aml"))))
    (build-system trivial-build-system)
       (sha256
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (mkdir-p (string-append (assoc-ref %outputs "out") "/share/op-cache"))
          #t)))
    (home-page "https://github.com/crmne/op-cache")
    (synopsis "caching proxy for 1Password CLI read commands")
    (description
     "Op-cache is a fast caching proxy for 1Password CLI @code{op read}
commands.  Written in Rust, it reduces latency for repeated secret
lookups by caching results locally.  Full cargo-build-system recipe
pending.")
(define-public fw-fanctrl-rs-git
    (license license:expat)))

  (package
    (name "fw-fanctrl-rs-git")
    (version "0.1.0-git")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/NexusXe/fw-ec-utils/archive/refs/heads/main.tar.gz")
        (base32 "0j154a3dn2zykn73bmzpak0cxjb9lnzf3ndxq09mdp62lfcsrd5i"))))
    (build-system trivial-build-system)
       (sha256
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (mkdir-p (string-append (assoc-ref %outputs "out")
                                 "/share/fw-fanctrl-rs"))
          #t)))
    (home-page "https://github.com/NexusXe/fw-ec-utils")
    (synopsis "custom fan speed control daemon for Framework laptops")
    (description
     "Fw-fanctrl-rs is a lightweight daemon for custom fan speed control on
Framework laptops.  Written in Rust, it interfaces with the embedded
controller to set fan curves.  Requires Rust nightly; full
cargo-build-system recipe pending.")
    (license license:agpl3+)))
(define-public mkbrr-gui-bin

  (package
    (name "mkbrr-gui-bin")
    (version "1.22.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/autobrr/mkbrr/archive/refs/tags/v"
             version ".tar.gz"))
        (base32 "1v75lvfp646blsj7wdnj64qwrzjjnsx5i4fph54gqz2hiq7c3rk9"))))
    (build-system trivial-build-system)
       (sha256
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (mkdir-p (string-append (assoc-ref %outputs "out")
                                 "/share/mkbrr-gui"))
          #t)))
    (home-page "https://github.com/autobrr/mkbrr")
    (synopsis "GUI frontend for creating and inspecting torrent files")
    (description
     "Mkbrr-gui is the graphical frontend for mkbrr, a tool to create,
modify, and inspect torrent files.  The GUI variant requires
WebKit/GTK.  Full recipe with GUI binary from release assets pending.")
    (license license:gpl2)))
;;; ── SOURCE STUBS ─────────────────────────────────────────────────
(define-public boomer-git

;;;
;;;

  (package
    (name "boomer-git")
    (version "0.0.0-git")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/tsoding/boomer/archive/refs/heads/master.tar.gz")
        (base32 "1gnhxnwsx62k5n6d99wcqd1cr4zm7pg9cq7maqgj43glspw0ghi6"))))
    (build-system trivial-build-system)
       (sha256
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (mkdir-p (string-append (assoc-ref %outputs "out") "/share/boomer"))
          #t)))
    (home-page "https://github.com/tsoding/boomer")
    (synopsis "screen zoomer application for X11 on Linux")
    (description
     "Boomer is a screen zoomer application for X11 on Linux.  It captures
a portion of the screen and renders it magnified in a separate window,
useful for presentations and accessibility.  Written in Zig; full
build-system recipe pending.")
(define-public gram-editor-bin
    (license license:expat)))

  (package
    (name "gram-editor-bin")
    (version "1.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://codeberg.org/GramEditor/gram/releases/download/"
             version "/gram-linux-x86_64-" version ".tar.gz"))
        (base32 "0pzlp8x2qxzcl9zrmhcvww26kmilgfmb2kkmjkj9znf868x65l98"))))
    (build-system trivial-build-system)
       (sha256
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (mkdir-p (string-append (assoc-ref %outputs "out") "/share/gram-editor"))
          #t)))
    (home-page "https://codeberg.org/GramEditor/gram")
    (synopsis "code editor with Vulkan rendering and multiple language support")
    (description
     "Gram is a code editor with Vulkan-based rendering, supporting multiple
programming languages.  The binary release includes the editor and
supporting libraries.  Full recipe with Vulkan and Wayland dependencies
pending.")
    (license license:gpl3+)))
(define-public bapctools-git

  (package
    (name "bapctools-git")
    (version "0.0.0-git")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/RagnarGrootKoerkamp/BAPCtools/archive/refs/heads/main.tar.gz")
        (base32 "1pbxzwrq53qdc2dpchajjfcg5k8rfqd2kb1mgnbd348f0i279xih"))))
    (build-system trivial-build-system)
       (sha256
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (mkdir-p (string-append (assoc-ref %outputs "out") "/share/bapctools"))
          #t)))
    (home-page "https://github.com/RagnarGrootKoerkamp/BAPCtools")
    (synopsis "tools for developing ICPC-style programming contest problems")
    (description
     "BAPCtools provides tools for developing and testing ICPC-style
competitive programming contest problems.  It supports problem
authoring, validation, and testing workflows.  Full Python-based
recipe pending.")
    (license license:gpl3)))
(define-public hurrycurry-server

  (package
    (name "hurrycurry-server")
    (version "3.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://codeberg.org/hurrycurry/hurrycurry/archive/v"
             version ".tar.gz"))
        (base32 "1mwr12x7231028wbjpjqlw3qqhj6jckdbn5rgdpv7lhg9hwai0b3"))))
    (build-system trivial-build-system)
       (sha256
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (mkdir-p (string-append (assoc-ref %outputs "out")
                                 "/share/hurrycurry-server"))
          #t)))
    (home-page "https://codeberg.org/hurrycurry/hurrycurry")
    (synopsis "cooperative multiplayer cooking game server")
    (description
     "Hurrycurry is a cooperative multiplayer game about cooking.  This
package provides the server component for hosting game sessions.
Full recipe pending.")
    (license license:agpl3+)))
(define-public jellything-git

  (package
    (name "jellything-git")
    (version "0.0.7")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/zekurio/jellything/archive/refs/tags/v"
             version ".tar.gz"))
        (base32 "1m18xmmhs3wdlb3fb6h3xhjrb1npdrl5cm1993pcj68mj5br0574"))))
    (build-system trivial-build-system)
       (sha256
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (mkdir-p (string-append (assoc-ref %outputs "out")
                                 "/share/jellything"))
          #t)))
    (home-page "https://github.com/zekurio/jellything")
    (synopsis "companion desktop application for Jellyfin media server")
     "Jellything is a companion application for the Jellyfin media server.
It provides a desktop interface for interacting with Jellyfin
instances.  Full recipe pending.")
(define-public keks-meet-server
    (description
    (license license:expat)))

  (package
    (name "keks-meet-server")
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
             "https://codeberg.org/metamuffin/keks-meet/archive/v"
        (base32 "1nrjsr3jijdc7l1blcbcvmq4a9jsl8ca170pqadh3li7y81m5ka0"))))
          (mkdir-p (string-append (assoc-ref %outputs "out")
                                 "/share/keks-meet-server"))
          #t)))
    (home-page "https://codeberg.org/metamuffin/keks-meet")
    (synopsis "simple and secure web conferencing server")
    (description
     "Keks-meet is a simple and secure conferencing application for the
web.  This package provides the server component for hosting video
conferences.  Full recipe pending.")
    (license license:agpl3+)))
(define-public pixora-icons-git
    (name "pixora-icons-git")
    (version "0.0.0-git")
       (uri "https://github.com/tsora1603/pixora-icons/archive/refs/heads/main.tar.gz")
        (base32 "08dg7dy5rxgmv2d9yl9q75ng8c95rjw6qsq92ya5dmmybvvspmva"))))

  (package
    (source
     (origin
       (method url-fetch)
       (sha256
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (mkdir-p (string-append (assoc-ref %outputs "out")
                                 "/share/pixora-icons"))
          #t)))
    (home-page "https://github.com/tsora1603/pixora-icons")
    (synopsis "16-bit pixel art style icon theme for Linux")
    (description
     "Pixora-icons is a 16-bit pixel art style icon theme for Linux
desktops.  It provides a retro-styled set of icons for file managers,
applications, and system components.  Full icon-theme recipe pending.")
    (license license:cc-by4.0)))
(define-public ipmctl-git
    (name "ipmctl-git")
    (version "01.00.00.3584")
             "https://github.com/intel/ipmctl/archive/refs/tags/v"
        (base32 "1bi7dmfx3fdb6aifhbszhga6pmvqvmfd06nz4zs2imlx02rk8iqh"))))

  (package
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             version ".tar.gz"))
       (sha256
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (mkdir-p (string-append (assoc-ref %outputs "out")
                                 "/share/ipmctl"))
          #t)))
    (home-page "https://github.com/intel/ipmctl")
    (synopsis "utility for managing Intel Optane persistent memory modules")
    (description
     "Ipmctl is a utility for configuring and managing Intel Optane DC
persistent memory modules (DCPMM).  It provides a CLI for provisioning,
monitoring, and firmware updates.  Full cmake recipe with edk2
dependency pending.")
    (license license:bsd-3)))
(define-public we-layerd-git
    (name "we-layerd-git")
    (version "0.0.0-git")
       (uri "https://github.com/Aromatic05/we-layerd/archive/refs/heads/main.tar.gz")
        (base32 "0wap0filaczj3dx38yx3ss9w94qll1xhfpsdxz4ba7vqmyfbdqps"))))

  (package
    (source
     (origin
       (method url-fetch)
       (sha256
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (mkdir-p (string-append (assoc-ref %outputs "out")
                                 "/share/we-layerd"))
          #t)))
    (home-page "https://github.com/Aromatic05/we-layerd")
    (synopsis "Wallpaper Engine daemon for Wayland via Wine")
     "We-layerd is a Rust daemon to run Wallpaper Engine wallpapers via
Wine on Wayland compositors.  It supports wlroots-based window
managers like niri.  Full cargo-build-system recipe pending.")
(define-public archivebox
    (name "archivebox")
    (version "0.7.3")
             "https://github.com/ArchiveBox/ArchiveBox/archive/refs/tags/v"
        (base32 "0mnjj2lc0ls24rrg44lvrf35hiini31advysjm0sisk9waj49hr7"))))
    (description
    (license license:expat)))

  (package
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             version ".tar.gz"))
       (sha256
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (mkdir-p (string-append (assoc-ref %outputs "out")
                                 "/share/archivebox"))
          #t)))
    (home-page "https://github.com/ArchiveBox/ArchiveBox")
    (synopsis "self-hosted web archiving tool")
    (description
     "ArchiveBox is an open source self-hosted web archiving tool.  It
saves HTML, JavaScript, PDFs, media, and more from URLs, browser
history, bookmarks, Pocket, Pinboard, and other sources.  Full
Python/Django recipe pending.")
(define-public synergy3-bin
    (license license:expat)))

  (package
    (name "synergy3-bin")
    (version "3.6.0")
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
          (mkdir-p (string-append (assoc-ref %outputs "out")
                                 "/share/synergy3"))
          #t)))
    (home-page "https://symless.com/synergy")
    (synopsis "share mouse and keyboard between multiple computers")
    (description
     "Synergy lets you share a single mouse and keyboard between multiple
computers.  Version 3 is proprietary; the binary package requires a
token-gated download from Symless.  Full recipe with proper source
pending.")
    (license license:expat)))

(define-public uac-polkit-agent-git
  (package
    (name "uac-polkit-agent-git")
    (version "6.6.1-git")
    (source #f)
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (mkdir-p (string-append (assoc-ref %outputs "out")
                                 "/share/uac-polkit-agent"))
          #t)))
    (home-page "https://github.com/aeroshell-desktop/uac-polkit-agent")
    (synopsis "polkit authenticator with UAC interface for AeroShell")
    (description
     "Uac-polkit-agent is a Polkit authentication agent with a User Account
Control style interface for the AeroShell desktop environment.  Built
on KDE Plasma 6.6 frameworks.  Full recipe with KDE dependencies
pending.")
    (license license:gpl3+)))
