;;; Worker 02 batch (r14): resolve NEEDS_RECIPE_DESIGN packages.
;;; 5 new recipes: rom-properties, cursor-ide-bin, verify-lib, blogr-bin, charliecloud
;;; 1 DONE via existing alias: wolfssl-all
;;; 4 BLOCKED: paru (ARCH_SPECIFIC_TOOL), nvidia-utils-beta (PROPRIETARY_DRIVER_COMPLEX),
;;;            wl-mpris-idle-inhibit (CARGO_GIT_DEPS), systemd-suspend-modules (SYSTEMD_SPECIFIC)
(define-module (gaurix packages cron-5a2fb251-r14-w02)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix build-system trivial)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system cmake)
  #:use-module (guix gexp)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages commencement)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages elf))

;; ──────────────────────────────────────────────
;; 1. rom-properties — ROM file browser / thumbnailer (cmake)
;; ──────────────────────────────────────────────
(define-public rom-properties
  (package
    (name "rom-properties")
    (version "2.7.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/GerbilSoft/rom-properties/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "16f35f56hvjsxqq2355xvy6myq2i1i6cdjigx1qha3bji2ny6mk8"))))
    (build-system cmake-build-system)
    (native-inputs (list pkg-config))
    (inputs (list curl gcc-toolchain zlib))
    (arguments
     (list
      #:configure-flags #~(list "-DBUILD_KDE5=OFF"
                                "-DBUILD_KDE6=OFF"
                                "-DBUILD_XFCE=OFF"
                                "-DBUILD_GTK3=OFF"
                                "-DBUILD_GTK4=OFF"
                                "-DENABLE_DECRYPTION=OFF"
                                "-DENABLE_UNICE68=OFF")
      #:tests? #f))
    (home-page "https://github.com/GerbilSoft/rom-properties")
    (synopsis "ROM file browser and thumbnailer with metadata extraction")
    (description
     "rom-properties is a shell extension for browsing ROM images and
disc images.  It scans ROM headers and displays useful metadata such as
title, region, publisher, and more.  Supports NES, SNES, Mega Drive,
Game Boy, N64, GameCube, Wii, Nintendo DS/3DS, PlayStation, and many
other systems.")
    (license license:gpl2+)))

;; ──────────────────────────────────────────────
;; 2. cursor-ide-bin — Cursor IDE (proprietary AppImage binary)
;; ──────────────────────────────────────────────
(define-public cursor-ide-bin
  (package
    (name "cursor-ide-bin")
    (version "3.0.12")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://downloads.cursor.com/production/"
             "a80ff7dfcaa45d7750f6e30be457261379c29b06"
             "/linux/x64/Cursor-" version "-x86_64.AppImage"))
       (sha256
        (base32 "0v6rzgahn3vbrh8pmf7s1njiqvvgf70f57zi6k5nk3d9508mrna9"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out  (assoc-ref %outputs "out"))
                 (src  (assoc-ref %build-inputs "source"))
                 (bin  (string-append out "/bin"))
                 (opt  (string-append out "/opt/cursor")))
            (mkdir-p opt)
            (mkdir-p bin)
            ;; Install the AppImage
            (copy-file src (string-append opt "/cursor.AppImage"))
            (chmod (string-append opt "/cursor.AppImage") #o755)
            ;; Create wrapper script
            (call-with-output-file (string-append bin "/cursor")
              (lambda (port)
                (format port "#!/bin/sh~%exec ~a/cursor.AppImage --no-sandbox \"$@\"~%"
                        opt)))
            (chmod (string-append bin "/cursor") #o755)
            #t))))
    (home-page "https://www.cursor.com")
    (synopsis "Cursor AI-powered code editor (binary AppImage)")
    (description
     "Cursor is an AI-powered code editor built on top of VS Code.  It
provides intelligent code completion, chat-based editing, and other
AI-assisted programming features.  This package provides the pre-built
AppImage binary.")
    ;; Proprietary license
    (license #f)))

;; ──────────────────────────────────────────────
;; 3. verify-lib — small C verification library
;; ──────────────────────────────────────────────
(define-public verify-lib
  (package
    (name "verify-lib")
    (version "0.0.4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://gitlab.com/fkzys/verify-lib/-/archive/v"
             version "/verify-lib-v" version ".tar.gz"))
       (sha256
        (base32 "0kg9w023v439vy6in4q21la56ann9npydn00ny45sbfx9mkh8pm9"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:make-flags #~(list (string-append "PREFIX=" %output)
                           (string-append "DESTDIR="))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure))))
    (home-page "https://gitlab.com/fkzys/verify-lib")
    (synopsis "Small C library for verification tasks")
    (description
     "verify-lib is a minimal C tool for library verification.  It
provides a simple command-line interface for checking library
installations and dependencies.")
    (license license:expat)))

;; ──────────────────────────────────────────────
;; 4. blogr-bin — Blog CLI tool (binary)
;; ──────────────────────────────────────────────
(define-public blogr-bin
  (package
    (name "blogr-bin")
    (version "0.4.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/bahdotsh/blogr/releases/download/v"
             version "/blogr-linux-x86_64.tar.gz"))
       (sha256
        (base32 "1zxpq0a9injyay8pnnv2mipisv0bssjz4s2wk2f3kic5f2x439bz"))))
    (build-system trivial-build-system)
    (native-inputs (list tar gzip))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (tar-bin (search-input-file %build-inputs "/bin/tar"))
                 (bin (string-append out "/bin"))
                 (tmp (string-append (or (getenv "TMPDIR") "/tmp")
                                     "/blogr-extract")))
            (mkdir-p tmp)
            (invoke tar-bin "xzf" src "-C" tmp)
            (mkdir-p bin)
            ;; Find and install the blogr binary
            (let ((blogr (car (find-files tmp "^blogr$" #:directories? #f))))
              (install-file blogr bin)
              (chmod (string-append bin "/blogr") #o755))
            #t))))
    (home-page "https://github.com/bahdotsh/blogr")
    (synopsis "CLI tool for writing and publishing blog posts")
    (description
     "blogr is a command-line tool for creating, managing, and
publishing blog posts.  It supports Markdown formatting and provides a
streamlined workflow for content creation.")
    (license license:expat)))

;; ──────────────────────────────────────────────
;; 5. charliecloud — Lightweight container runtime for HPC
;; ──────────────────────────────────────────────
(define-public charliecloud
  (package
    (name "charliecloud")
    (version "0.38")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/hpc/charliecloud/releases/download/v"
             version "/charliecloud-" version ".tar.gz"))
       (sha256
        (base32 "0ylv881jm4ch85aw247s36d6qisjmjx1nmjwzmjrrnzlgzancdqs"))))
    (build-system gnu-build-system)
    (inputs (list python))
    (arguments
     (list
      #:tests? #f
      #:configure-flags #~(list "--disable-html")))
    (home-page "https://hpc.github.io/charliecloud/")
    (synopsis "Lightweight user-defined software stacks for HPC")
    (description
     "Charliecloud provides user-defined software stacks (UDSS) for
high-performance computing (HPC) centers.  It uses Linux user namespaces
to run containers with no privileged operations or daemons, making it
suitable for shared HPC environments.  Charliecloud supports OCI/Docker
images and provides tools for building, managing, and running container
images.")
    (license license:asl2.0)))
