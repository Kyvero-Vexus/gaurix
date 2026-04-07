;;; NEEDS_RECIPE_DESIGN resolver pass 2 — 2026-04-06.
;;; Resolves 14 BLOCKED NEEDS_RECIPE_DESIGN AUR packages into Guix definitions.
;;; 16 additional packages evaluated and left BLOCKED with concrete reasons.
;;; 3 packages (libmodule, noto-fonts-cjk-fontconfig, wo-bin) already resolved
;;; in cron-5a2fb251-r19-w01.scm / cron-5a2fb251-r20-w03.scm.
(define-module (gaurix packages queue-20260406-recipe-resolver-p2)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix build-system trivial)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system python)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages elf)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages multiprecision)
  #:use-module (gnu packages pulseaudio)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages video)
  #:use-module (gnu packages xml)
  #:use-module (gnu packages curl)
  #:export (iwmenu-bin
            bzmenu-bin
            pwmenu-bin
            wrkflw-bin
            comp-scan-bin
            framework-control-bin
            mezzotone-bin
            chough-bin
            oken-bin
            python-aiohttp-jinja2
            pricehist
            lobster
            c47-bin
            r47-bin))

;;;
;;; ─────────────────────────────────────────────
;;; 1. iwmenu-bin — Wi-Fi manager launcher
;;; ─────────────────────────────────────────────
;;; AUR: iwmenu-bin v0.4.0; Rust binary from GitHub releases.
;;;

(define-public iwmenu-bin
  (package
    (name "iwmenu-bin")
    (version "0.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/e-tho/iwmenu/releases/download/v"
             version "/iwmenu-x86_64-linux-gnu"))
       (file-name (string-append "iwmenu-" version))
       (sha256
        (base32 "1pwkv6a8h5kx82dn7wpd9n701i510v2zwjzykd66r9rpm9pkc2rf"))))
    (build-system trivial-build-system)
    (native-inputs (list patchelf))
    (inputs (list glibc `(,gcc "lib")))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out      (assoc-ref %outputs "out"))
                 (src      (assoc-ref %build-inputs "source"))
                 (patchelf (search-input-file %build-inputs "/bin/patchelf"))
                 (ld-so    (search-input-file %build-inputs
                                              "/lib/ld-linux-x86-64.so.2"))
                 (rpath    (string-join
                            (list (dirname ld-so)
                                  (dirname (search-input-file
                                            %build-inputs
                                            "/lib/libgcc_s.so.1")))
                            ":"))
                 (bin-dir  (string-append out "/bin")))
            (mkdir-p bin-dir)
            (copy-file src (string-append bin-dir "/iwmenu"))
            (chmod (string-append bin-dir "/iwmenu") #o755)
            (invoke patchelf "--set-interpreter" ld-so
                    (string-append bin-dir "/iwmenu"))
            (invoke patchelf "--set-rpath" rpath
                    (string-append bin-dir "/iwmenu"))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/e-tho/iwmenu")
    (synopsis "Launcher-driven Wi-Fi manager for Linux")
    (description
     "Iwmenu is a launcher-driven Wi-Fi network manager for Linux that
integrates with iwd for wireless network management through
interactive launcher menus.")
    (license license:gpl3)))

;;;
;;; ─────────────────────────────────────────────
;;; 2. bzmenu-bin — Bluetooth manager launcher
;;; ─────────────────────────────────────────────
;;; AUR: bzmenu-bin v0.4.0; Rust binary from GitHub releases.
;;;

(define-public bzmenu-bin
  (package
    (name "bzmenu-bin")
    (version "0.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/e-tho/bzmenu/releases/download/v"
             version "/bzmenu-x86_64-linux-gnu"))
       (file-name (string-append "bzmenu-" version))
       (sha256
        (base32 "0ggnand2ih6s1si6amp0mnl9r6d4gjj65vx03kysmzdvggxy71a2"))))
    (build-system trivial-build-system)
    (native-inputs (list patchelf))
    (inputs (list glibc `(,gcc "lib")))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out      (assoc-ref %outputs "out"))
                 (src      (assoc-ref %build-inputs "source"))
                 (patchelf (search-input-file %build-inputs "/bin/patchelf"))
                 (ld-so    (search-input-file %build-inputs
                                              "/lib/ld-linux-x86-64.so.2"))
                 (rpath    (string-join
                            (list (dirname ld-so)
                                  (dirname (search-input-file
                                            %build-inputs
                                            "/lib/libgcc_s.so.1")))
                            ":"))
                 (bin-dir  (string-append out "/bin")))
            (mkdir-p bin-dir)
            (copy-file src (string-append bin-dir "/bzmenu"))
            (chmod (string-append bin-dir "/bzmenu") #o755)
            (invoke patchelf "--set-interpreter" ld-so
                    (string-append bin-dir "/bzmenu"))
            (invoke patchelf "--set-rpath" rpath
                    (string-append bin-dir "/bzmenu"))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/e-tho/bzmenu")
    (synopsis "Launcher-driven Bluetooth manager for Linux")
    (description
     "Bzmenu is a launcher-driven Bluetooth device manager for Linux that
provides interactive pairing, connecting, and disconnecting through
launcher menus.")
    (license license:gpl3)))

;;;
;;; ─────────────────────────────────────────────
;;; 3. pwmenu-bin — PipeWire audio manager launcher
;;; ─────────────────────────────────────────────
;;; AUR: pwmenu-bin v0.4.0; Rust binary from GitHub releases.
;;;

(define-public pwmenu-bin
  (package
    (name "pwmenu-bin")
    (version "0.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/e-tho/pwmenu/releases/download/v"
             version "/pwmenu-x86_64-linux-gnu"))
       (file-name (string-append "pwmenu-" version))
       (sha256
        (base32 "0gj12lpwx6zw3p6gcda1gq7cr5frsvzzq1plra2sm511m0lg3rbj"))))
    (build-system trivial-build-system)
    (native-inputs (list patchelf))
    (inputs (list glibc `(,gcc "lib")))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out      (assoc-ref %outputs "out"))
                 (src      (assoc-ref %build-inputs "source"))
                 (patchelf (search-input-file %build-inputs "/bin/patchelf"))
                 (ld-so    (search-input-file %build-inputs
                                              "/lib/ld-linux-x86-64.so.2"))
                 (rpath    (string-join
                            (list (dirname ld-so)
                                  (dirname (search-input-file
                                            %build-inputs
                                            "/lib/libgcc_s.so.1")))
                            ":"))
                 (bin-dir  (string-append out "/bin")))
            (mkdir-p bin-dir)
            (copy-file src (string-append bin-dir "/pwmenu"))
            (chmod (string-append bin-dir "/pwmenu") #o755)
            (invoke patchelf "--set-interpreter" ld-so
                    (string-append bin-dir "/pwmenu"))
            (invoke patchelf "--set-rpath" rpath
                    (string-append bin-dir "/pwmenu"))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/e-tho/pwmenu")
    (synopsis "Launcher-driven PipeWire audio manager for Linux")
    (description
     "Pwmenu is a launcher-driven PipeWire audio device manager for Linux
that provides interactive volume control and device switching through
launcher menus.")
    (license license:gpl3)))

;;;
;;; ─────────────────────────────────────────────
;;; 4. wrkflw-bin — GitHub Actions local runner
;;; ─────────────────────────────────────────────
;;; AUR: wrkflw-bin v0.7.3; Rust binary tarball from GitHub releases.
;;;

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
    (build-system trivial-build-system)
    (native-inputs (list tar gzip patchelf))
    (inputs (list glibc `(,gcc "lib")))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out      (assoc-ref %outputs "out"))
                 (src      (assoc-ref %build-inputs "source"))
                 (tar      (search-input-file %build-inputs "/bin/tar"))
                 (gzip     (search-input-file %build-inputs "/bin/gzip"))
                 (patchelf (search-input-file %build-inputs "/bin/patchelf"))
                 (ld-so    (search-input-file %build-inputs
                                              "/lib/ld-linux-x86-64.so.2"))
                 (rpath    (string-join
                            (list (dirname ld-so)
                                  (dirname (search-input-file
                                            %build-inputs
                                            "/lib/libgcc_s.so.1")))
                            ":"))
                 (bin-dir  (string-append out "/bin")))
            (mkdir-p bin-dir)
            (setenv "PATH"
                    (string-append (dirname tar) ":"
                                   (dirname gzip)))
            (invoke tar "xzf" src)
            (install-file "wrkflw" bin-dir)
            (let ((exe (string-append bin-dir "/wrkflw")))
              (chmod exe #o755)
              (invoke patchelf "--set-interpreter" ld-so exe)
              (invoke patchelf "--set-rpath" rpath exe))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/bahdotsh/wrkflw")
    (synopsis "Validate and execute GitHub Actions workflows locally")
    (description
     "Wrkflw validates and executes GitHub Actions workflow files locally,
allowing developers to test CI/CD pipelines without pushing to
a remote repository.")
    (license license:expat)))

;;;
;;; ─────────────────────────────────────────────
;;; 5. comp-scan-bin — System component scanner
;;; ─────────────────────────────────────────────
;;; AUR: comp-scan-bin v0.1.0; Rust binary tarball from GitHub releases.
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
    (build-system trivial-build-system)
    (native-inputs (list tar gzip patchelf))
    (inputs (list glibc `(,gcc "lib")))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out      (assoc-ref %outputs "out"))
                 (src      (assoc-ref %build-inputs "source"))
                 (tar      (search-input-file %build-inputs "/bin/tar"))
                 (gzip     (search-input-file %build-inputs "/bin/gzip"))
                 (patchelf (search-input-file %build-inputs "/bin/patchelf"))
                 (ld-so    (search-input-file %build-inputs
                                              "/lib/ld-linux-x86-64.so.2"))
                 (rpath    (string-join
                            (list (dirname ld-so)
                                  (dirname (search-input-file
                                            %build-inputs
                                            "/lib/libgcc_s.so.1")))
                            ":"))
                 (bin-dir  (string-append out "/bin")))
            (mkdir-p bin-dir)
            (setenv "PATH"
                    (string-append (dirname tar) ":"
                                   (dirname gzip)))
            (invoke tar "xzf" src)
            (install-file "compscan" bin-dir)
            (let ((exe (string-append bin-dir "/compscan")))
              (chmod exe #o755)
              (invoke patchelf "--set-interpreter" ld-so exe)
              (invoke patchelf "--set-rpath" rpath exe))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/vvk147/comp-scan")
    (synopsis "Local system scanner with improvement suggestions")
    (description
     "Comp-scan scans your system configuration and usage patterns, then
suggests targeted improvements.  It runs entirely locally without
sending data externally.")
    (license license:expat)))

;;;
;;; ─────────────────────────────────────────────
;;; 6. framework-control-bin — Framework laptop control
;;; ─────────────────────────────────────────────
;;; AUR: framework-control-bin v0.5.2; binary tarball from GitHub releases.
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
    (build-system trivial-build-system)
    (native-inputs (list tar gzip patchelf))
    (inputs (list glibc `(,gcc "lib")))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out      (assoc-ref %outputs "out"))
                 (src      (assoc-ref %build-inputs "source"))
                 (tar      (search-input-file %build-inputs "/bin/tar"))
                 (gzip     (search-input-file %build-inputs "/bin/gzip"))
                 (patchelf (search-input-file %build-inputs "/bin/patchelf"))
                 (ld-so    (search-input-file %build-inputs
                                              "/lib/ld-linux-x86-64.so.2"))
                 (rpath    (string-join
                            (list (dirname ld-so)
                                  (dirname (search-input-file
                                            %build-inputs
                                            "/lib/libgcc_s.so.1")))
                            ":"))
                 (bin-dir  (string-append out "/bin")))
            (mkdir-p bin-dir)
            (setenv "PATH"
                    (string-append (dirname tar) ":"
                                   (dirname gzip)))
            (invoke tar "xzf" src)
            (install-file "framework-control" bin-dir)
            (let ((exe (string-append bin-dir "/framework-control")))
              (chmod exe #o755)
              (invoke patchelf "--set-interpreter" ld-so exe)
              (invoke patchelf "--set-rpath" rpath exe))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/ozturkkl/framework-control")
    (synopsis "Control tool for Framework laptop features")
    (description
     "Framework-control provides a web-based interface to manage
Framework Laptop hardware features including fan control, battery
charge limits, and keyboard LED settings.")
    (license license:expat)))

;;;
;;; ─────────────────────────────────────────────
;;; 7. mezzotone-bin — ASCII/Unicode art converter
;;; ─────────────────────────────────────────────
;;; AUR: mezzotone-bin v1.1.1; Go binary from GitHub releases.
;;; Statically linked — no patchelf needed.
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
       (file-name (string-append "mezzotone-" version))
       (sha256
        (base32 "0gb1ivviybc7zbailqsbmyw3dx80jizkqkzmhypr05r2rdy3fqy9"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out     (assoc-ref %outputs "out"))
                 (src     (assoc-ref %build-inputs "source"))
                 (bin-dir (string-append out "/bin")))
            (mkdir-p bin-dir)
            (copy-file src (string-append bin-dir "/mezzotone"))
            (chmod (string-append bin-dir "/mezzotone") #o755)))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/joaoheitorgarcia/Mezzotone")
    (synopsis "Convert images and GIFs to ASCII or Unicode art in the terminal")
    (description
     "Mezzotone is a terminal UI application that converts images and
GIFs into ASCII or Unicode art using various halftoning and dithering
algorithms with real-time preview.")
    (license license:expat)))

;;;
;;; ─────────────────────────────────────────────
;;; 8. chough-bin — Automatic speech recognition CLI
;;; ─────────────────────────────────────────────
;;; AUR: chough-bin v1.0.0; Go/C++ binary tarball with bundled inference libs.
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
    (build-system trivial-build-system)
    (native-inputs (list tar gzip patchelf))
    (inputs (list glibc `(,gcc "lib")))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out      (assoc-ref %outputs "out"))
                 (src      (assoc-ref %build-inputs "source"))
                 (tar      (search-input-file %build-inputs "/bin/tar"))
                 (gzip     (search-input-file %build-inputs "/bin/gzip"))
                 (patchelf (search-input-file %build-inputs "/bin/patchelf"))
                 (ld-so    (search-input-file %build-inputs
                                              "/lib/ld-linux-x86-64.so.2"))
                 (opt-dir  (string-append out "/opt/chough"))
                 (bin-dir  (string-append out "/bin"))
                 (rpath    (string-join
                            (list opt-dir
                                  (dirname ld-so)
                                  (dirname (search-input-file
                                            %build-inputs
                                            "/lib/libgcc_s.so.1"))
                                  (dirname (search-input-file
                                            %build-inputs
                                            "/lib/libstdc++.so.6")))
                            ":")))
            (setenv "PATH"
                    (string-append (dirname tar) ":"
                                   (dirname gzip)))
            (mkdir-p opt-dir)
            (mkdir-p bin-dir)
            (invoke tar "xzf" src)
            ;; Install bundled inference libs
            (for-each
             (lambda (f) (install-file f opt-dir))
             '("libonnxruntime.so"
               "libsherpa-onnx-c-api.so"
               "libsherpa-onnx-cxx-api.so"))
            ;; Install and patch main binary
            (install-file "chough" opt-dir)
            (let ((exe (string-append opt-dir "/chough")))
              (chmod exe #o755)
              (invoke patchelf "--set-interpreter" ld-so exe)
              (invoke patchelf "--set-rpath" rpath exe))
            (symlink (string-append opt-dir "/chough")
                     (string-append bin-dir "/chough"))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/hyperpuncher/chough")
    (synopsis "Fast automatic speech recognition CLI")
    (description
     "Chough is a fast automatic speech recognition (ASR) command-line
tool using the Parakeet TDT neural model.  It converts audio files
to text with bundled ONNX Runtime inference libraries.")
    (license license:expat)))

;;;
;;; ─────────────────────────────────────────────
;;; 9. oken-bin — SSH CLI with fuzzy host picker
;;; ─────────────────────────────────────────────
;;; AUR: oken-bin v0.3.8; Rust binary tar.xz from GitHub releases.
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
    (build-system trivial-build-system)
    (native-inputs (list tar xz patchelf))
    (inputs (list glibc `(,gcc "lib")))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out      (assoc-ref %outputs "out"))
                 (src      (assoc-ref %build-inputs "source"))
                 (tar      (search-input-file %build-inputs "/bin/tar"))
                 (xz       (search-input-file %build-inputs "/bin/xz"))
                 (patchelf (search-input-file %build-inputs "/bin/patchelf"))
                 (ld-so    (search-input-file %build-inputs
                                              "/lib/ld-linux-x86-64.so.2"))
                 (rpath    (string-join
                            (list (dirname ld-so)
                                  (dirname (search-input-file
                                            %build-inputs
                                            "/lib/libgcc_s.so.1")))
                            ":"))
                 (bin-dir  (string-append out "/bin")))
            (mkdir-p bin-dir)
            (setenv "PATH"
                    (string-append (dirname tar) ":"
                                   (dirname xz)))
            (invoke tar "xJf" src)
            (install-file "oken-x86_64-unknown-linux-gnu/oken" bin-dir)
            (let ((exe (string-append bin-dir "/oken")))
              (chmod exe #o755)
              (invoke patchelf "--set-interpreter" ld-so exe)
              (invoke patchelf "--set-rpath" rpath exe))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/linkwithjoydeep/oken")
    (synopsis "SSH CLI with better host management and fuzzy picker")
    (description
     "Oken is an SSH command-line tool with better host management,
fuzzy host picking, and optional drop-in replacement for the
standard ssh client.")
    (license license:expat)))

;;;
;;; ─────────────────────────────────────────────
;;; 11. python-aiohttp-jinja2 — Jinja2 for aiohttp
;;; ─────────────────────────────────────────────
;;; AUR: python-aiohttp-jinja2 v1.6; Python package from PyPI.
;;;

(define-public python-aiohttp-jinja2
  (package
    (name "python-aiohttp-jinja2")
    (version "1.6")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "aiohttp-jinja2" version))
       (sha256
        (base32 "1qmh37k5p4f0nq2qshqd4faj9dv10zyvniz5i8pabg75ci9gz9x3"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))  ;; needs pytest-aiohttp
    (propagated-inputs (list python-aiohttp python-jinja2))
    (home-page "https://github.com/aio-libs/aiohttp-jinja2")
    (synopsis "Jinja2 template renderer for aiohttp.web")
    (description
     "Aiohttp-jinja2 integrates the Jinja2 template engine with
aiohttp.web, providing decorators and helper functions for rendering
Jinja2 templates in aiohttp web applications.")
    (license license:asl2.0)))

;;;
;;; ─────────────────────────────────────────────
;;; 12. pricehist — Historical price data fetcher
;;; ─────────────────────────────────────────────
;;; AUR: pricehist v1.4.14; Python package from PyPI.
;;;

(define-public pricehist
  (package
    (name "pricehist")
    (version "1.4.14")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "pricehist" version))
       (sha256
        (base32 "116fjbmkw5ckd9y621g6gz6g16sk55j9x2yxi65g1z3rwjx9ihv4"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))  ;; needs network access
    (native-inputs (list python-poetry-core python-setuptools-scm))
    (propagated-inputs
     (list python-cssselect python-lxml python-requests))
    (home-page "https://gitlab.com/chrisberkhout/pricehist")
    (synopsis "Command-line tool for fetching historical price data")
    (description
     "Pricehist is a command-line tool for fetching and formatting
historical price data from multiple sources.  It supports output
formats including Ledger, Beancount, and CSV.")
    (license license:expat)))

;;;
;;; ─────────────────────────────────────────────
;;; 11. lobster — Shell-based movie/TV streaming CLI
;;; ─────────────────────────────────────────────
;;; AUR: lobster v4.6.2; shell script from GitHub.
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
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "12rizglhm1snlmwnh6cdp492f178kqmyamw8qm6rw8j4c6jk6ff8"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("lobster.sh" "bin/lobster"))))
    (inputs (list curl mpv fzf))
    (home-page "https://github.com/justchokingaround/lobster")
    (synopsis "Shell-based CLI for searching and streaming movies and TV shows")
    (description
     "Lobster is a shell-based command-line tool for searching and
streaming movies and TV shows with history tracking, multiple
provider support, and interactive selection menus.")
    (license license:gpl2)))

;;;
;;; ─────────────────────────────────────────────
;;; 16. c47-bin — C47 RPN calculator simulator
;;; ─────────────────────────────────────────────
;;; AUR: c47-bin v00.109.03.01b1; prebuilt binary from GitLab.
;;; Depends on GTK3, cairo, glib, GMP, PulseAudio.
;;;

(define-public c47-bin
  (package
    (name "c47-bin")
    (version "00.109.03.01b1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://gitlab.com/api/v4/projects/14055190"
             "/packages/generic/c47/" version
             "/c47-linux-" version ".zip"))
       (sha256
        (base32 "1aqzjnwm9b6bns2j36lskbva67id7y1k3v54s0w27y9smf4hc7ra"))))
    (build-system trivial-build-system)
    (native-inputs (list unzip patchelf))
    (inputs (list glibc `(,gcc "lib") gtk+ cairo glib gmp pulseaudio))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out      (assoc-ref %outputs "out"))
                 (src      (assoc-ref %build-inputs "source"))
                 (unzip    (search-input-file %build-inputs "/bin/unzip"))
                 (patchelf (search-input-file %build-inputs "/bin/patchelf"))
                 (ld-so    (search-input-file %build-inputs
                                              "/lib/ld-linux-x86-64.so.2"))
                 (lib-dirs (filter file-exists?
                                   (map (lambda (pair)
                                          (string-append (cdr pair) "/lib"))
                                        %build-inputs)))
                 (rpath    (string-join lib-dirs ":"))
                 (opt-dir  (string-append out "/opt/c47"))
                 (bin-dir  (string-append out "/bin"))
                 (font-dir (string-append out "/share/fonts/truetype"))
                 (subdir   (string-append "c47-linux-" #$version)))
            (invoke unzip src)
            (mkdir-p opt-dir)
            (mkdir-p bin-dir)
            (mkdir-p font-dir)
            ;; Install the c47 binary
            (install-file (string-append subdir "/c47") opt-dir)
            (let ((exe (string-append opt-dir "/c47")))
              (chmod exe #o755)
              (invoke patchelf "--set-interpreter" ld-so exe)
              (invoke patchelf "--set-rpath" rpath exe))
            ;; Install resources
            (when (file-exists? (string-append subdir "/C47__StandardFont.ttf"))
              (install-file (string-append subdir "/C47__StandardFont.ttf")
                            font-dir))
            (when (file-exists? (string-append subdir "/res"))
              (copy-recursively (string-append subdir "/res")
                                (string-append opt-dir "/res")))
            (symlink (string-append opt-dir "/c47")
                     (string-append bin-dir "/c47"))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://47calc.com")
    (synopsis "C47 high-precision RPN scientific calculator simulator")
    (description
     "C47-bin is a prebuilt simulator for the C47 pocket calculator,
a high-precision RPN scientific calculator with 34-digit precision.
It emulates the Z80-based SwissMicros hardware calculator.")
    (license license:gpl3+)))

;;;
;;; ─────────────────────────────────────────────
;;; 17. r47-bin — R47 RPN calculator simulator
;;; ─────────────────────────────────────────────
;;; AUR: r47-bin v00.109.03.01b1; same archive as c47-bin.
;;;

(define-public r47-bin
  (package
    (inherit c47-bin)
    (name "r47-bin")
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out      (assoc-ref %outputs "out"))
                 (src      (assoc-ref %build-inputs "source"))
                 (unzip    (search-input-file %build-inputs "/bin/unzip"))
                 (patchelf (search-input-file %build-inputs "/bin/patchelf"))
                 (ld-so    (search-input-file %build-inputs
                                              "/lib/ld-linux-x86-64.so.2"))
                 (lib-dirs (filter file-exists?
                                   (map (lambda (pair)
                                          (string-append (cdr pair) "/lib"))
                                        %build-inputs)))
                 (rpath    (string-join lib-dirs ":"))
                 (opt-dir  (string-append out "/opt/r47"))
                 (bin-dir  (string-append out "/bin"))
                 (font-dir (string-append out "/share/fonts/truetype"))
                 (subdir   (string-append "c47-linux-"
                                          #$(package-version c47-bin))))
            (invoke unzip src)
            (mkdir-p opt-dir)
            (mkdir-p bin-dir)
            (mkdir-p font-dir)
            ;; Install the r47 binary
            (install-file (string-append subdir "/r47") opt-dir)
            (let ((exe (string-append opt-dir "/r47")))
              (chmod exe #o755)
              (invoke patchelf "--set-interpreter" ld-so exe)
              (invoke patchelf "--set-rpath" rpath exe))
            ;; Install shared resources
            (when (file-exists? (string-append subdir "/C47__StandardFont.ttf"))
              (install-file (string-append subdir "/C47__StandardFont.ttf")
                            font-dir))
            (when (file-exists? (string-append subdir "/res"))
              (copy-recursively (string-append subdir "/res")
                                (string-append opt-dir "/res")))
            (symlink (string-append opt-dir "/r47")
                     (string-append bin-dir "/r47"))))))
    (synopsis "R47 high-precision RPN scientific calculator simulator")
    (description
     "R47-bin is a prebuilt simulator for the R47 pocket calculator,
sharing firmware with the C47 but featuring the SwissMicros R47
keyboard layout for the high-precision RPN scientific calculator.")))
