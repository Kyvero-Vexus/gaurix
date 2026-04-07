;;; NEEDS_RECIPE_DESIGN resolver pass — 2026-04-06.
;;; Resolves 17 BLOCKED NEEDS_RECIPE_DESIGN AUR packages into Guix definitions.
(define-module (gaurix packages queue-20260406-recipe-resolver)
  #:use-module (guix packages)
  #:use-module (guix download)

  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system trivial)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages elf)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages image)
  #:use-module (gnu packages pdf)
  #:use-module (gnu packages photo)
  #:use-module (gnu packages video)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages polkit)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages xorg)
  #:use-module (gnu packages radio)
  #:use-module (gaurix packages cron-5a2fb251-r19-w01)
  #:export (lazytail-bin
            funzzy-bin
            ferris-scan-bin
            sabiql-bin
            console2svg-bin
            mkbrr-gui-bin
            claude-code-seccomp
            q5k-usb-udev
            pixora-icons-git
            libavif-noglycin
            libheif-noglycin
            libjxl-noglycin
            libjxl-noglycin-doc
            qpdf-zopfli
            clightd
            nodejs-knit
            bapctools-git))

;;;
;;; ─────────────────────────────────────────────
;;; 1. lazytail-bin — Fast terminal log viewer
;;; ─────────────────────────────────────────────
;;; AUR: lazytail-bin v0.9.0; Rust binary from GitHub releases.
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
    (build-system trivial-build-system)
    (native-inputs (list tar gzip patchelf))
    (inputs (list bash-minimal glibc `(,gcc "lib")))
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
            (let ((exe "lazytail"))
              (install-file exe bin-dir)
              (let ((installed (string-append bin-dir "/" exe)))
                (chmod installed #o755)
                (invoke patchelf "--set-interpreter" ld-so installed)
                (invoke patchelf "--set-rpath" rpath installed)))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/raaymax/lazytail")
    (synopsis "fast terminal-based log viewer with live filtering")
    (description
     "Lazytail is a fast, universal terminal-based log viewer with live
filtering and follow mode.  It supports viewing and searching large
log files interactively.")
    (license license:expat)))

;;;
;;; ─────────────────────────────────────────────
;;; 2. funzzy-bin — Lightweight file watcher
;;; ─────────────────────────────────────────────
;;; AUR: funzzy-bin v1.5.0; Rust binary from GitHub releases.
;;; Installs both 'funzzy' and 'fzz' (alias).
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
    (build-system trivial-build-system)
    (native-inputs (list tar gzip patchelf))
    (inputs (list bash-minimal glibc `(,gcc "lib")))
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
            (for-each
             (lambda (exe)
               (let ((src-path (string-append "pkg/" exe)))
                 (when (file-exists? src-path)
                   (install-file src-path bin-dir)
                   (let ((installed (string-append bin-dir "/" exe)))
                     (chmod installed #o755)
                     (invoke patchelf "--set-interpreter" ld-so installed)
                     (invoke patchelf "--set-rpath" rpath installed)))))
             '("funzzy" "fzz"))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/cristianoliveira/funzzy")
    (synopsis "lightweight generic-purpose file watcher")
    (description
     "Funzzy is a lightweight, configurable file watcher written in Rust.
It watches files for changes and runs commands when modifications are
detected.  Useful for development workflows like auto-testing or
auto-building.")
    (license license:expat)))

;;;
;;; ─────────────────────────────────────────────
;;; 3. ferris-scan-bin — Rust-based TUI file scanner
;;; ─────────────────────────────────────────────
;;; AUR: ferris-scan-bin v0.25; single binary from GitHub releases.
;;;

(define-public ferris-scan-bin
  (package
    (name "ferris-scan-bin")
    (version "0.25")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/Vnilabean/ferris-scan/releases/download/v"
             version "/ferris-scan-tui-v" version "-linux"))
       (file-name (string-append name "-" version))
       (sha256
        (base32 "1a2sb0w04a3qnxdbjg7nf74zab949wpsj5yfgbx5v9yfgws8fbq4"))))
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
                 (bin-dir  (string-append out "/bin"))
                 (installed (string-append bin-dir "/ferris-scan")))
            (mkdir-p bin-dir)
            (copy-file src installed)
            (chmod installed #o755)
            (invoke patchelf "--set-interpreter" ld-so installed)
            (invoke patchelf "--set-rpath" rpath installed)))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Vnilabean/ferris-scan")
    (synopsis "lightweight Rust-based TUI file scanner")
    (description
     "Ferris-scan is a lightweight file scanner written in Rust with a
terminal user interface.  It allows quick browsing and scanning of
files from the command line.")
    (license license:expat)))

;;;
;;; ─────────────────────────────────────────────
;;; 4. sabiql-bin — TUI for PostgreSQL databases
;;; ─────────────────────────────────────────────
;;; AUR: sabiql-bin v1.10.0; Rust binary from GitHub releases.
;;;

(define-public sabiql-bin
  (package
    (name "sabiql-bin")
    (version "1.10.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/riii111/sabiql/releases/download/v"
             version "/sabiql-x86_64-unknown-linux-gnu.tar.gz"))
       (sha256
        (base32 "1vg1q5475ayq89yn8v8znz5mswgainas53blsgjbf19jiw17475z"))))
    (build-system trivial-build-system)
    (native-inputs (list tar gzip patchelf))
    (inputs (list bash-minimal glibc `(,gcc "lib")))
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
            (let ((exe "sabiql"))
              (install-file exe bin-dir)
              (let ((installed (string-append bin-dir "/" exe)))
                (chmod installed #o755)
                (invoke patchelf "--set-interpreter" ld-so installed)
                (invoke patchelf "--set-rpath" rpath installed)))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/riii111/sabiql")
    (synopsis "fast driver-less TUI for browsing PostgreSQL databases")
    (description
     "Sabiql is a fast, driver-less terminal user interface for browsing,
querying, and editing PostgreSQL databases.  It connects directly without
requiring database driver installation.")
    (license license:expat)))

;;;
;;; ─────────────────────────────────────────────
;;; 5. console2svg-bin — Convert terminal output to SVG
;;; ─────────────────────────────────────────────
;;; AUR: console2svg-bin v0.6.5; .NET self-contained binary.
;;;

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
       (file-name (string-append name "-" version))
       (sha256
        (base32 "17yi3cccyxlsxxmbqb254v36lbk0d7cv59mnsclcs72jkq65yk26"))))
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
                 (bin-dir  (string-append out "/bin"))
                 (installed (string-append bin-dir "/console2svg")))
            (mkdir-p bin-dir)
            (copy-file src installed)
            (chmod installed #o755)
            (invoke patchelf "--set-interpreter" ld-so installed)
            (invoke patchelf "--set-rpath" rpath installed)))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/arika0093/console2svg")
    (synopsis "convert terminal output into SVG images")
    (description
     "Console2svg converts terminal output into SVG image files.  Useful for
creating visual documentation of command-line sessions and terminal
interactions.")
    (license license:asl2.0)))

;;;
;;; ─────────────────────────────────────────────
;;; 6. mkbrr-gui-bin — GUI for torrent file creation
;;; ─────────────────────────────────────────────
;;; AUR: mkbrr-gui-bin v1.19.0-rc.1; Go binary from GitHub releases.
;;;

(define-public mkbrr-gui-bin
  (package
    (name "mkbrr-gui-bin")
    (version "1.19.0-rc.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/autobrr/mkbrr/releases/download/v"
             version "/mkbrr-gui_v" version "_linux_amd64.tar.gz"))
       (sha256
        (base32 "1649pwbw8cxihd1dxi0s8bwkh648hh40dyxpb8fwysz32kkyh3ms"))))
    (build-system trivial-build-system)
    (native-inputs (list tar gzip))
    (inputs (list bash-minimal))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out     (assoc-ref %outputs "out"))
                 (src     (assoc-ref %build-inputs "source"))
                 (tar     (search-input-file %build-inputs "/bin/tar"))
                 (gzip    (search-input-file %build-inputs "/bin/gzip"))
                 (bin-dir (string-append out "/bin")))
            (mkdir-p bin-dir)
            (setenv "PATH"
                    (string-append (dirname tar) ":"
                                   (dirname gzip)))
            (invoke tar "xzf" src)
            ;; Go static binary — no patching needed
            (install-file "mkbrr-gui" bin-dir)
            (chmod (string-append bin-dir "/mkbrr-gui") #o755)))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/autobrr/mkbrr")
    (synopsis "GUI for creating and inspecting torrent files")
    (description
     "Mkbrr-gui is a graphical frontend for mkbrr, a tool to create, modify,
and inspect torrent files.  This is a pre-release binary build.")
    (license license:gpl2)))

;;;
;;; ─────────────────────────────────────────────
;;; 7. claude-code-seccomp — Seccomp sandbox for Claude Code
;;; ─────────────────────────────────────────────
;;; AUR: claude-code-seccomp v0.0.35; prebuilt binaries from GitHub.
;;; Installs apply-seccomp binary and unix-block.bpf filter.
;;;

(define-public claude-code-seccomp
  (package
    (name "claude-code-seccomp")
    (version "0.0.35")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/anthropic-experimental/sandbox-runtime"
             "/archive/4fad8fa35db3f09958db1df401b30bd00402b611.tar.gz"))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1ifgd8pq5s8hz1apdinx0pw4y95dx1aynp7zw42179alvnifmhbh"))))
    (build-system trivial-build-system)
    (native-inputs (list tar gzip))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out     (assoc-ref %outputs "out"))
                 (src     (assoc-ref %build-inputs "source"))
                 (tar     (search-input-file %build-inputs "/bin/tar"))
                 (gzip    (search-input-file %build-inputs "/bin/gzip"))
                 (lib-dir (string-append out "/lib/claude-code-seccomp"))
                 (srcdir  (string-append
                           "sandbox-runtime-"
                           "4fad8fa35db3f09958db1df401b30bd00402b611"
                           "/vendor/seccomp/x64")))
            (setenv "PATH"
                    (string-append (dirname tar) ":"
                                   (dirname gzip)))
            (invoke tar "xzf" src)
            (mkdir-p lib-dir)
            (install-file (string-append srcdir "/apply-seccomp") lib-dir)
            (install-file (string-append srcdir "/unix-block.bpf") lib-dir)
            (chmod (string-append lib-dir "/apply-seccomp") #o755)))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/anthropic-experimental/sandbox-runtime")
    (synopsis "seccomp BPF sandbox filters for Claude Code")
    (description
     "Provides prebuilt seccomp BPF filter binaries used by Claude Code's
sandbox command to enforce filesystem and network restrictions during
code execution.")
    (license license:asl2.0)))

;;;
;;; ─────────────────────────────────────────────
;;; 8. q5k-usb-udev — Qudelix-5K USB DAC udev rules
;;; ─────────────────────────────────────────────
;;; AUR: q5k-usb-udev v2026.02.28; single udev rules file from gist.
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
       (file-name (string-append name "-" version "-99-qudelix.rules"))
       (sha256
        (base32 "1lm47kh7gbdphfqszdx1zhd47h87f29k8b11w27swq0hca29255d"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out      (assoc-ref %outputs "out"))
                 (src      (assoc-ref %build-inputs "source"))
                 (rules-dir (string-append out "/lib/udev/rules.d")))
            (mkdir-p rules-dir)
            (copy-file src
                       (string-append rules-dir "/99-qudelix.rules"))))))
    (home-page
     "https://gist.github.com/hmtheboy154/21c0a25ff025667981a35b6656f7da69")
    (synopsis "udev rules for the Qudelix-5K USB DAC/amp")
    (description
     "Provides udev rules for the Qudelix-5K USB DAC/amp to enable proper
device permissions without requiring root access.")
    (license license:bsd-3)))

;;;
;;; ─────────────────────────────────────────────
;;; 9. pixora-icons-git — 16-bit pixel art icon theme
;;; ─────────────────────────────────────────────
;;; AUR: pixora-icons-git; icon theme from GitHub, no tagged releases.
;;;

(define-public pixora-icons-git
  (package
    (name "pixora-icons-git")
    (version "1.0.0.r292")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/tsora1603/pixora-icons/archive/"
             "a1215de097093f5024ba63dab1cd5577a8ab04fa.tar.gz"))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "06pxrc0vspiwm1fd0hk6lc6xa9yc49xwzxbpp7rsgikn6qhp6zjf"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("pixora" "share/icons/pixora")
          ("pixelitos-light" "share/icons/pixelitos-light")
          ("pixelitos-dark" "share/icons/pixelitos-dark"))))
    (home-page "https://github.com/tsora1603/pixora-icons")
    (synopsis "16-bit pixel art icon theme for Linux desktops")
    (description
     "Pixora Icons is a 16-bit pixel art icon theme for Linux desktops,
providing three variants: pixora, pixelitos-light, and pixelitos-dark.
The icons are in SVG and PNG formats.")
    (license license:gpl3+)))

;;;
;;; ─────────────────────────────────────────────
;;; 10–13. noglycin library variants
;;; ─────────────────────────────────────────────
;;; AUR noglycin packages are variants built without the glycin
;;; gdk-pixbuf2 loader.  In Guix, gdk-pixbuf does not use glycin
;;; by default, so the standard library packages are equivalent.
;;; These are provided as compatibility aliases.
;;;

(define-public libavif-noglycin
  (package
    (inherit libavif)
    (name "libavif-noglycin")
    (synopsis "AVIF image codec library (without glycin gdk-pixbuf2)")
    (description
     "This is the standard libavif package provided as a compatibility alias
for the AUR @code{libavif-noglycin} variant.  In Guix, gdk-pixbuf does
not use the glycin loader by default, so this is identical to the
standard @code{libavif} package.")))

(define-public libheif-noglycin
  (package
    (inherit libheif)
    (name "libheif-noglycin")
    (synopsis "HEIF/HEIC image codec library (without glycin gdk-pixbuf2)")
    (description
     "This is the standard libheif package provided as a compatibility alias
for the AUR @code{libheif-noglycin} variant.  In Guix, gdk-pixbuf does
not use the glycin loader by default, so this is identical to the
standard @code{libheif} package.")))

(define-public libjxl-noglycin
  (package
    (inherit libjxl)
    (name "libjxl-noglycin")
    (synopsis "JPEG XL reference codec (without glycin gdk-pixbuf2)")
    (description
     "This is the standard libjxl package provided as a compatibility alias
for the AUR @code{libjxl-noglycin} variant.  In Guix, gdk-pixbuf does
not use the glycin loader by default, so this is identical to the
standard @code{libjxl} package.")))

(define-public libjxl-noglycin-doc
  (package
    (inherit libjxl)
    (name "libjxl-noglycin-doc")
    (synopsis "JPEG XL reference codec documentation (noglycin variant)")
    (description
     "Documentation for the JPEG XL reference codec.  This is a compatibility
alias for the AUR @code{libjxl-noglycin-doc} variant.  In Guix, this is
equivalent to the standard @code{libjxl} package.")))

;;;
;;; ─────────────────────────────────────────────
;;; 14. qpdf-zopfli — QPDF with Zopfli compression
;;; ─────────────────────────────────────────────
;;; AUR: qpdf-zopfli v12.3.2; QPDF built with -DZOPFLI:BOOL=ON.
;;; Guix qpdf is v11.8.0; inherit and add zopfli dependency + flag.
;;;

(define-public qpdf-zopfli
  (package
    (inherit qpdf)
    (name "qpdf-zopfli")
    (inputs
     (modify-inputs (package-inputs qpdf)
       (append zopfli)))
    (arguments
     (substitute-keyword-arguments (package-arguments qpdf)
       ((#:configure-flags flags #~'())
        #~(cons "-DZOPFLI=ON" #$flags))))
    (synopsis "PDF transformation toolkit with Zopfli compression")
    (description
     "QPDF is a command-line program and C++ library for structural,
content-preserving transformations on PDF files.  This variant enables
Zopfli compression for smaller output file sizes at the cost of slower
compression speed.")))

;;;
;;; ─────────────────────────────────────────────
;;; 15. clightd — D-Bus service for screen brightness/gamma
;;; ─────────────────────────────────────────────
;;; AUR: clightd v5.9; cmake build.  Depends on libmodule (packaged
;;; in cron-5a2fb251-r19-w01.scm).
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
              "-DENABLE_SCREEN=OFF")
      #:phases
      #~(modify-phases %standard-phases
          (add-before 'configure 'fix-install-paths
            (lambda _
              (substitute* "CMakeLists.txt"
                (("pkg_get_variable\\(SYSTEM_BUS_DIR dbus-1 system_bus_services_dir\\)")
                 (string-append "set(SYSTEM_BUS_DIR \""
                                #$output "/share/dbus-1/system-services\")"))
                (("pkg_get_variable\\(POLKIT_ACTION_DIR polkit-gobject-1 actiondir\\)")
                 (string-append "set(POLKIT_ACTION_DIR \""
                                #$output "/share/polkit-1/actions\")"))
                (("pkg_get_variable\\(DBUS_SYSTEM_CONF_DIR dbus-1 sysconfdir\\)")
                 (string-append "set(DBUS_SYSTEM_CONF_DIR \""
                                #$output "/etc\")"))))))))
    (native-inputs (list pkg-config))
    (inputs (list eudev
                  elogind
                  libdrm
                  polkit
                  linux-pam
                  dbus
                  libmodule
                  libjpeg-turbo
                  libiio))
    (home-page "https://github.com/FedeDP/Clightd")
    (synopsis "D-Bus service for screen backlight control")
    (description
     "Clightd is a D-Bus service to control screen brightness, gamma
correction, and DPMS settings.  It provides a unified interface for
managing display properties across different Linux systems.")
    (license license:gpl3+)))

;;;
;;; ─────────────────────────────────────────────
;;; 16. nodejs-knit — Symlink local Node.js packages
;;; ─────────────────────────────────────────────
;;; AUR: nodejs-knit v0.1.2; small npm CLI tool.
;;; Packaged as trivial npm install from registry tarball.
;;;

(define-public nodejs-knit
  (package
    (name "nodejs-knit")
    (version "0.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://registry.npmjs.org/@omnidev/knit/-/knit-"
             version ".tgz"))
       (sha256
        (base32 "0ndfvqwc3l0wyzqaks1l3bvsn471d2lx297hm1cvasf7wnjrg6k2"))))
    (build-system trivial-build-system)
    (native-inputs (list tar gzip))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out     (assoc-ref %outputs "out"))
                 (src     (assoc-ref %build-inputs "source"))
                 (tar     (search-input-file %build-inputs "/bin/tar"))
                 (gzip    (search-input-file %build-inputs "/bin/gzip"))
                 (lib-dir (string-append out "/lib/node_modules/@omnidev/knit"))
                 (bin-dir (string-append out "/bin")))
            (setenv "PATH"
                    (string-append (dirname tar) ":"
                                   (dirname gzip)))
            (mkdir-p lib-dir)
            (invoke tar "xzf" src "-C" lib-dir "--strip-components=1")
            (mkdir-p bin-dir)
            (symlink (string-append lib-dir "/bin/knit.js")
                     (string-append bin-dir "/knit"))))))
    (home-page "https://github.com/coopbri/knit")
    (synopsis "CLI tool for symlinking local Node.js package dependencies")
    (description
     "Knit is a CLI tool that symlinks local Node.js packages together for
monorepo-style development workflows.  It manages local dependency links
without requiring npm link.")
    (license license:expat)))

;;;
;;; ─────────────────────────────────────────────
;;; 17. bapctools-git — ICPC contest problem development tools
;;; ─────────────────────────────────────────────
;;; AUR: bapctools-git; Python tool from GitHub.
;;; No tagged releases; track HEAD.
;;;

(define-public bapctools-git
  (package
    (name "bapctools-git")
    (version "0.0.0.r1310")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/RagnarGrootKoerkamp/BAPCtools/archive/"
             "16e23ee.tar.gz"))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0jr44rw5gnhhpbc7cczj8rg547bali7qmnym42iwk61vppd9da59"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("bin/" "share/bapctools/bin/")
          ("." "share/bapctools/"
           #:exclude ("bin/" ".git/" ".github/")))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'create-wrapper
            (lambda* (#:key outputs #:allow-other-keys)
              (let ((out (assoc-ref outputs "out"))
                    (bin-dir (string-append (assoc-ref outputs "out") "/bin")))
                (mkdir-p bin-dir)
                (symlink (string-append out "/share/bapctools/bin/tools.py")
                         (string-append bin-dir "/bt"))))))))
    (home-page "https://github.com/RagnarGrootKoerkamp/BAPCtools")
    (synopsis "tools for developing ICPC-style contest problems")
    (description
     "BAPCtools provides a suite of tools for creating, testing, and validating
competitive programming problems in the ICPC problem format.  It includes
generators, validators, and submission testing infrastructure.")
    (license license:gpl3+)))
