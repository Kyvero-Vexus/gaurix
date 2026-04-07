;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2026 Gaurix contributors
;;;
;;; Recipe resolver pass — recipe-resolver-260407c
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages from the blocked queue.
;;; Covers: binary packages (copy-build-system), source packages, and stubs.

(define-module (gaurix packages recipe-resolver-260407c)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system trivial)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages elf)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages gettext)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages xml))

;;;
;;; ── STATIC BINARY PACKAGES ──────────────────────────────────────────
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
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("mezzotone" "bin/mezzotone"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files)
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "mezzotone")
              (chmod "mezzotone" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/joaoheitorgarcia/Mezzotone")
    (synopsis "convert images and GIFs to ASCII or Unicode art in the terminal")
    (description
     "Mezzotone is a TUI application written in Go that converts images and
GIFs into ASCII or Unicode art.  It supports various character sets and
output modes for terminal display.")
    (license license:expat)))

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
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/peltho/tufw")
    (synopsis "terminal user interface for ufw firewall")
    (description
     "Tufw is a terminal user interface for managing ufw (Uncomplicated
Firewall).  It provides a text-based interface for viewing and managing
firewall rules without memorizing ufw command syntax.")
    (license license:expat)))

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
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~`((,(string-append "DPIBreak-" #$version
                           "-x86_64-unknown-linux-musl/dpibreak")
           "bin/dpibreak")
          (,(string-append "DPIBreak-" #$version
                           "-x86_64-unknown-linux-musl/dpibreak.1")
           "share/man/man1/dpibreak.1"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/dilluti0n/dpibreak")
    (synopsis "fast DPI circumvention tool written in Rust")
    (description
     "DPIBreak is a fast and easy-to-use DPI (Deep Packet Inspection)
circumvention tool written in Rust.  It uses packet fragmentation to
bypass DPI-based network filtering, compiled with musl for static
linking.")
    (license license:gpl3+)))

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
      #:install-plan #~'(("framework-control" "bin/framework-control"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/ozturkkl/framework-control")
    (synopsis "control tool for Framework Laptop features")
    (description
     "Framework-control is a tool for controlling Framework Laptop features
including fan speed, battery charge limits, and LED input modules.  It
communicates with framework-system and inputmodule-rs services.")
    (license license:expat)))

(define-public pandoc-crossref-bin
  (package
    (name "pandoc-crossref-bin")
    (version "0.3.23a")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/lierdakil/pandoc-crossref/releases/download/v"
             version "/pandoc-crossref-Linux-X64.tar.xz"))
       (sha256
        (base32 "116yr5nnm7ffn2ii8alzsx0aan29cyv0blwzwbq9fyjlf7if8xzs"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("pandoc-crossref" "bin/pandoc-crossref")
                         ("pandoc-crossref.1" "share/man/man1/pandoc-crossref.1"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/lierdakil/pandoc-crossref")
    (synopsis "pandoc filter for cross-references in documents")
    (description
     "Pandoc-crossref is a pandoc filter for numbering figures, equations,
tables and cross-references to them.  It works with pandoc's native
Markdown extensions and supports LaTeX, HTML, and other output formats.")
    (license license:gpl2+)))

;;;
;;; ── DYNAMIC BINARY PACKAGES (patchelf) ─────────────────────────────
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
    (build-system copy-build-system)
    (arguments
     (list
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
    (native-inputs (list patchelf))
    (inputs (list (list gcc "lib") glibc))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/raaymax/lazytail")
    (synopsis "fast terminal-based log viewer with live filtering")
    (description
     "Lazytail is a fast, universal terminal-based log viewer with live
filtering and follow mode.  It provides real-time log file monitoring
with interactive search and filtering capabilities.")
    (license license:expat)))

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
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("pkg/funzzy" "bin/funzzy")
                         ("pkg/fzz" "bin/fzz"))
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
                (for-each (lambda (name)
                            (let ((bin (string-append out "/bin/" name)))
                              (invoke "patchelf" "--set-interpreter" ld-so bin)
                              (invoke "patchelf" "--set-rpath" rpath bin)))
                          '("funzzy" "fzz"))))))))
    (native-inputs (list patchelf))
    (inputs (list (list gcc "lib") glibc))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/cristianoliveira/funzzy")
    (synopsis "lightweight blazingly fast file watcher")
    (description
     "Funzzy is a lightweight file watcher written in Rust.  It watches for
file changes and executes configured commands automatically, useful for
development workflows that need automatic rebuilds or test runs.")
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
    (synopsis "git worktree manager with zero-config dependency sync")
    (description
     "Workz is a git worktree manager that provides zero-config dependency
sync and fleet mode for parallel development agents.  It simplifies
working with multiple git worktrees simultaneously.")
    (license license:expat)))

(define-public omp-manager-bin
  (package
    (name "omp-manager-bin")
    (version "0.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/psmux/omp-manager/releases/download/v"
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
    (home-page "https://github.com/psmux/omp-manager")
    (synopsis "installation and theme manager for Oh My Posh")
    (description
     "Omp-manager is a TUI tool for managing Oh My Posh prompt themes.
It lets you browse themes, install Nerd Fonts, and configure shell
prompt integration.")
    (license license:expat)))

(define-public wrkflw-bin
  (package
    (name "wrkflw-bin")
    (version "0.7.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/bahdotsh/wrkflw/releases/download/v"
             version "/wrkflw-v" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "1bkqs48ph0b0m96p6v6kgrkh3kbhaqfcc5vvs4lsw5bfk3fizyxy"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("wrkflw" "bin/wrkflw"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files)
          (add-after 'install 'patch-elf
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let ((bin (string-append (assoc-ref outputs "out")
                                       "/bin/wrkflw"))
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
    (home-page "https://github.com/bahdotsh/wrkflw")
    (synopsis "validate and run GitHub Actions workflows locally")
    (description
     "Wrkflw validates and executes GitHub Actions workflows locally.
It parses workflow YAML files and runs them in a local environment,
useful for testing CI pipelines without pushing to GitHub.")
    (license license:expat)))

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
      #:install-plan #~'(("console2svg" "bin/console2svg"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files)
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "console2svg")
              (chmod "console2svg" #o755)))
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
    (synopsis "convert terminal output into SVG images")
    (description
     "Console2svg converts terminal output into SVG images.  It captures
ANSI-colored console output and produces clean SVG files suitable for
documentation, presentations, and sharing.")
    (license license:asl2.0)))

(define-public tmux-plugin-panel-bin
  (package
    (name "tmux-plugin-panel-bin")
    (version "0.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/psmux/Tmux-Plugin-Panel/releases/download/v"
             version "/tmuxpanel-v" version "-linux-x64.tar.gz"))
       (sha256
        (base32 "1ss6gy3598jv2ljz2vxzlw0dj78m99572apwjy1226wrjvffnh60"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~`((,(string-append "tmuxpanel-v" #$version "-linux-x64/tmuxpanel")
           "bin/tmuxpanel")
          (,(string-append "tmuxpanel-v" #$version "-linux-x64/tmuxthemes")
           "bin/tmuxthemes")
          (,(string-append "tmuxpanel-v" #$version "-linux-x64/tmuxplugins")
           "bin/tmuxplugins"))
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
                (for-each (lambda (name)
                            (let ((bin (string-append out "/bin/" name)))
                              (invoke "patchelf" "--set-interpreter" ld-so bin)
                              (invoke "patchelf" "--set-rpath" rpath bin)))
                          '("tmuxpanel" "tmuxthemes" "tmuxplugins"))))))))
    (native-inputs (list patchelf))
    (inputs (list (list gcc "lib") glibc))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/psmux/Tmux-Plugin-Panel")
    (synopsis "TUI plugin and theme manager for tmux")
    (description
     "Tmux-Plugin-Panel provides a full-featured TUI for managing tmux
plugins and themes.  It includes three tools: tmuxpanel for general
management, tmuxthemes for theme browsing, and tmuxplugins for plugin
installation and removal.")
    (license license:expat)))

;;;
;;; ── COMPLEX BINARY PACKAGES ────────────────────────────────────────
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
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("chough" "opt/chough/bin/chough")
                         ("libonnxruntime.so" "opt/chough/lib/libonnxruntime.so")
                         ("libsherpa-onnx-c-api.so"
                          "opt/chough/lib/libsherpa-onnx-c-api.so")
                         ("libsherpa-onnx-cxx-api.so"
                          "opt/chough/lib/libsherpa-onnx-cxx-api.so"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files)
          (add-after 'install 'create-wrapper
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (opt-bin (string-append out "/opt/chough/bin/chough"))
                     (opt-lib (string-append out "/opt/chough/lib"))
                     (bin-dir (string-append out "/bin")))
                (mkdir-p bin-dir)
                (call-with-output-file (string-append bin-dir "/chough")
                  (lambda (port)
                    (format port "#!/bin/sh~%exec env LD_LIBRARY_PATH=~a ~a \"$@\"~%"
                            opt-lib opt-bin)))
                (chmod (string-append bin-dir "/chough") #o755)))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/hyperpuncher/chough")
    (synopsis "fast automatic speech recognition CLI using ONNX models")
    (description
     "Chough is a fast CLI tool for automatic speech recognition (ASR)
using the Parakeet TDT model via ONNX Runtime.  It processes audio
files and outputs transcribed text, bundling the required shared
libraries for inference.")
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
    (synopsis "use your tablet as a graphics tablet on your computer")
    (description
     "Weylus turns a tablet or phone into a graphics tablet or touch screen
for your computer.  It streams the desktop to the tablet's browser and
sends back stylus and touch input, supporting pressure sensitivity.")
    (license license:agpl3+)))

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
      #:install-plan #~'(("dafny" "opt/dafny"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files)
          (add-after 'install 'create-wrapper
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin-dir (string-append out "/bin"))
                     (dafny (string-append out "/opt/dafny/dafny")))
                (mkdir-p bin-dir)
                (call-with-output-file (string-append bin-dir "/dafny")
                  (lambda (port)
                    (format port "#!/bin/sh~%exec ~a \"$@\"~%" dafny)))
                (chmod (string-append bin-dir "/dafny") #o755)))))))
    (native-inputs (list unzip))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/dafny-lang/dafny")
    (synopsis "verification-aware programming language")
    (description
     "Dafny is a verification-aware programming language.  It includes a
static program verifier that can prove correctness of code with respect
to specifications.  This package provides the prebuilt binary
distribution including the Dafny compiler and Z3 solver.")
    (license license:expat)))

;;;
;;; ── SOURCE PACKAGES ────────────────────────────────────────────────
;;;

(define-public lobster
  (package
    (name "lobster")
    (version "4.6.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/justchokingaround/lobster/archive/v"
             version ".tar.gz"))
       (sha256
        (base32 "12rizglhm1snlmwnh6cdp492f178kqmyamw8qm6rw8j4c6jk6ff8"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~`((,(string-append "lobster-" #$version "/lobster.sh")
           "bin/lobster"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files)
          (add-after 'install 'make-executable
            (lambda* (#:key outputs #:allow-other-keys)
              (chmod (string-append (assoc-ref outputs "out")
                                   "/bin/lobster") #o755))))))
    (home-page "https://github.com/justchokingaround/lobster")
    (synopsis "shell script to watch movies and shows from the terminal")
    (description
     "Lobster is a shell script for watching movies, web series, and TV shows
from the terminal.  It scrapes streaming sources and plays content
using mpv or other configured media players.")
    (license license:gpl2)))

(define-public q5k-usb-udev
  (package
    (name "q5k-usb-udev")
    (version "2026.02.28")
    (source
     (origin
       (method url-fetch)
       (uri "https://gist.github.com/hmtheboy154/21c0a25ff025667981a35b6656f7da69/raw/8242cefe13667ddcbe8291b5f34bb523c3142eed/99-qudelix.rules")
       (sha256
        (base32 "1lm47kh7gbdphfqszdx1zhd47h87f29k8b11w27swq0hca29255d"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let ((rules-dir (string-append (assoc-ref %outputs "out")
                                         "/lib/udev/rules.d")))
            (mkdir-p rules-dir)
            (copy-file (assoc-ref %build-inputs "source")
                       (string-append rules-dir "/99-qudelix.rules"))
            #t))))
    (home-page "https://gist.github.com/hmtheboy154/21c0a25ff025667981a35b6656f7da69")
    (synopsis "udev rules for Qudelix-5K USB DAC")
    (description
     "This package provides udev rules for the Qudelix-5K USB DAC/amplifier.
The rules enable proper device permissions for non-root users to access
the Qudelix-5K over USB.")
    (license license:bsd-3)))

(define-public libmodule
  (package
    (name "libmodule")
    (version "5.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/FedeDP/libmodule/archive/"
             version ".tar.gz"))
       (sha256
        (base32 "1zpp46jly4sqb7gbffxajv72i6rh60cacc7sfrsr65mym9liw43j"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/FedeDP/libmodule")
    (synopsis "C library for building modular event-driven projects")
    (description
     "Libmodule is a C library providing a simple and elegant implementation
of an actor-based model for building modular, event-driven projects on
Linux.  It handles module lifecycle, event loops, and inter-module
communication.")
    (license license:expat)))

(define-public python-aiohttp-jinja2
  (package
    (name "python-aiohttp-jinja2")
    (version "1.6")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://files.pythonhosted.org/packages/source/a/"
             "aiohttp-jinja2/aiohttp-jinja2-" version ".tar.gz"))
       (sha256
        (base32 "1qmh37k5p4f0nq2qshqd4faj9dv10zyvniz5i8pabg75ci9gz9x3"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (propagated-inputs (list python-aiohttp python-jinja2))
    (home-page "https://github.com/aio-libs/aiohttp-jinja2")
    (synopsis "jinja2 template renderer for aiohttp.web")
    (description
     "Aiohttp-jinja2 is a Jinja2 template renderer for aiohttp.web
applications.  It integrates the Jinja2 templating engine with
aiohttp's web framework, providing convenient decorators and helpers
for rendering templates in async web handlers.")
    (license license:asl2.0)))

(define-public pricehist
  (package
    (name "pricehist")
    (version "1.4.14")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://files.pythonhosted.org/packages/source/p/"
             "pricehist/pricehist-" version ".tar.gz"))
       (sha256
        (base32 "116fjbmkw5ckd9y621g6gz6g16sk55j9x2yxi65g1z3rwjx9ihv4"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (propagated-inputs
     (list python-cssselect python-lxml python-requests))
    (native-inputs (list python-poetry-core))
    (home-page "https://gitlab.com/chrisberkhout/pricehist")
    (synopsis "fetch historical price data for plain text accounting")
    (description
     "Pricehist is a command-line tool for fetching and formatting
historical price data from multiple sources.  It supports various
output formats including Beancount, Ledger, and CSV, making it useful
for plain text accounting workflows.")
    (license license:expat)))

(define-public ddccontrol-db
  (package
    (name "ddccontrol-db")
    (version "20260120")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/ddccontrol/ddccontrol-db/archive/refs/tags/"
             version ".tar.gz"))
       (sha256
        (base32 "07jqg00l7kihd3hf2wppj8c9qfi1zixgsbwpw9qmhi4dxi3mxyqi"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (replace 'bootstrap
            (lambda _
              (invoke "sh" "autogen.sh"))))))
    (native-inputs (list autoconf automake intltool))
    (home-page "https://github.com/ddccontrol/ddccontrol-db")
    (synopsis "monitor database for DDC/CI control")
    (description
     "Ddccontrol-db is a database of monitor profiles for DDCcontrol.  It
contains device definitions and capability descriptions that allow
DDCcontrol to properly communicate with monitors via DDC/CI protocol
for brightness, contrast, and other display adjustments.")
    (license license:gpl2+)))

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
       (sha256
        (base32 "17yjvbqzx0fmgmp1h9606p19496xcyp1kd1qa1630f8jny3c4rk9"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (mkdir-p (string-append (assoc-ref %outputs "out")
                                 "/share/qxmledit"))
          #t)))
    (home-page "https://qxmledit.org/")
    (synopsis "simple XML editor and XSD viewer based on Qt")
    (description
     "QXmlEdit is a simple XML editor and XSD viewer built with Qt.  It
supports XML editing with syntax highlighting, XSD schema viewing,
SCXML editing, XML comparison, and file splitting.  Requires Qt5 with
qmake; full build recipe needs Qt5 tools and modules.")
    (license license:lgpl2.1+)))

(define-public spinwheel-pipewire
  (package
    (name "spinwheel-pipewire")
    (version "0.1.0")
    (source #f)
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (mkdir-p (string-append (assoc-ref %outputs "out")
                                 "/share/spinwheel-pipewire"))
          #t)))
    (home-page "https://codeberg.org/the-traveler/spinwheel")
    (synopsis "terminal wheel spinner with PipeWire audio support")
    (description
     "Spinwheel-pipewire is a terminal-based wheel spinner with named
wheels and built-in modes.  It uses LuaJIT and PipeWire for audio
playback features including a metronome/BPM mode.  Upstream
Codeberg repository is currently inaccessible; source is vendored
in the AUR package.")
    (license license:gpl3+)))

(define-public yewtube-bin
  (package
    (name "yewtube-bin")
    (version "2.13.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/mps-youtube/yewtube/releases/download/v"
             version "/yewtube-" version "-py3-none-any.whl"))
       (sha256
        (base32 "0h39x915jf0ahac3pl3gw3cbrswb1imhxabg0ny5ipfcrazm1c4c"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (mkdir-p (string-append (assoc-ref %outputs "out")
                                 "/share/yewtube"))
          #t)))
    (home-page "https://github.com/mps-youtube/yewtube")
    (synopsis "terminal-based YouTube player and downloader")
    (description
     "Yewtube is a terminal-based YouTube player and downloader, forked from
mps-youtube.  It requires no API key and supports searching, playing,
and downloading YouTube content from the command line.  Distributed as
a Python wheel; full recipe needs Python packaging with yt-dlp and
other dependencies.")
    (license license:gpl3)))

;;;
;;; ── COMPANION / INHERIT PACKAGES ───────────────────────────────────
;;;

(define-public dpibreak-git
  (package
    (inherit dpibreak-bin)
    (name "dpibreak-git")
    (home-page "https://github.com/dilluti0n/dpibreak")
    (synopsis "fast DPI circumvention tool written in Rust (git version)")
    (description
     "DPIBreak is a fast and easy-to-use DPI (Deep Packet Inspection)
circumvention tool written in Rust.  This -git variant tracks the
latest release of the prebuilt musl binary.")))

;;;
;;; ── RUST SOURCE STUBS ──────────────────────────────────────────────
;;; These packages have correct metadata and source hashes but use
;;; trivial-build-system as stubs.  Full builds require packaging all
;;; Rust crate dependencies for cargo-build-system.
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
          (mkdir-p (string-append (assoc-ref %outputs "out")
                                 "/share/swhook"))
          #t)))
    (home-page "https://github.com/AndyLocks/swhook")
    (synopsis "minimalistic webhook server written in Rust")
    (description
     "Swhook is a minimalistic webhook server written in Rust.  It listens
for incoming HTTP requests and executes configured shell commands.
Full build requires cargo-build-system with all Rust crate
dependencies packaged.")
    (license license:gpl3+)))

(define-public compendium
  (package
    (name "compendium")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://static.crates.io/crates/compendium/"
             version "/download"))
       (sha256
        (base32 "1ijjyxjvyvwxkwjb7g72611ria6kwxw58602wf8i4c5pb6mv2jgi"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (mkdir-p (string-append (assoc-ref %outputs "out")
                                 "/share/compendium"))
          #t)))
    (home-page "https://github.com/louisboilard/compendium")
    (synopsis "user-friendly syscall tracer for x86 Linux with HTML reports")
    (description
     "Compendium is a powerful and easy-to-use syscall tracer for x86 Linux.
It generates HTML reports and provides a user-friendly alternative to
strace using eBPF.  Full build requires cargo-build-system with Rust
crate dependencies and libbpf for eBPF support.")
    (license license:expat)))

(define-public gnix
  (package
    (name "gnix")
    (version "2.4.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://codeberg.org/metamuffin/gnix/archive/v"
             version ".tar.gz"))
       (sha256
        (base32 "16qj0hjjyxz9p1y8lr5xaiyd89nw013hxwvad3k8shav6knf1br8"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (mkdir-p (string-append (assoc-ref %outputs "out")
                                 "/share/gnix"))
          #t)))
    (home-page "https://codeberg.org/metamuffin/gnix")
    (synopsis "simple HTTP reverse proxy written in Rust")
    (description
     "Gnix is a simple HTTP reverse proxy written in Rust.  It supports
YAML configuration and systemd integration.  Full build requires Rust
nightly toolchain via cargo-build-system with all crate dependencies
packaged.")
    (license license:agpl3+)))

(define-public szsol-rs
  (package
    (name "szsol-rs")
    (version "1.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/ghoker143/szsol-rs/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "1apcry4awiw8mrwx7mx0h0f7iaadk53ms9r54fsxfnqn6vx40qzz"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (mkdir-p (string-append (assoc-ref %outputs "out")
                                 "/share/szsol-rs"))
          #t)))
    (home-page "https://github.com/ghoker143/szsol-rs")
    (synopsis "solitaire card game with TUI and solver")
    (description
     "Szsol-rs is a solitaire card game originating from SHENZHEN I/O,
implemented in Rust with TUI/CLI mode and an automated solver.
Full build requires cargo-build-system with all Rust crate
dependencies packaged.")
    (license license:gpl3)))

(define-public adbfs-rootless
  (package
    (name "adbfs-rootless")
    (version "0.0.0-git.277c088")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/spion/adbfs-rootless")
             (commit "277c088")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "07khdxgn6yxwjcij46k5aq6vr9dgcahaxsvhwld3hfsqwvjfwksk"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (mkdir-p (string-append (assoc-ref %outputs "out")
                                 "/share/adbfs-rootless"))
          #t)))
    (home-page "https://github.com/spion/adbfs-rootless")
    (synopsis "FUSE filesystem for Android devices over ADB without root")
    (description
     "Adbfs-rootless provides a FUSE filesystem for accessing Android device
storage over ADB (Android Debug Bridge) without requiring root access
on the device.  Full build requires a C++ compiler, FUSE libraries,
and android-tools.")
    (license license:bsd-3)))
