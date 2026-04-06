;;; Guix package definitions for cron-5a2fb251-r16 worker w02.
;;; Packages: claude-code-seccomp, ferris-scan-bin, gram-editor-bin,
;;; sabiql-bin, netwatch-tui, console2svg-bin, nodejs-knit
(define-module (gaurix packages cron-5a2fb251-r16-w02)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix build-system trivial)
  #:use-module (guix gexp)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages node))

;;; ---- 1. claude-code-seccomp ----
;;; Prebuilt seccomp filter binary + BPF for Claude Code /sandbox.
;;; Two separate origin downloads, assembled by trivial-build-system.

(define-public claude-code-seccomp
  (package
    (name "claude-code-seccomp")
    (version "0.0.49")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://raw.githubusercontent.com/"
             "anthropic-experimental/sandbox-runtime/"
             "4fad8fa35db3f09958db1df401b30bd00402b611"
             "/vendor/seccomp/x64/apply-seccomp"))
       (file-name (string-append "apply-seccomp-" version))
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
                 (lib (string-append out "/lib/claude-code-seccomp"))
                 (bpf-src (assoc-ref %build-inputs "unix-block-bpf")))
            (mkdir-p lib)
            (copy-file (assoc-ref %build-inputs "source")
                       (string-append lib "/apply-seccomp"))
            (chmod (string-append lib "/apply-seccomp") #o755)
            (copy-file bpf-src (string-append lib "/unix-block.bpf"))
            #t))))
    (native-inputs
     `(("unix-block-bpf"
        ,(origin
           (method url-fetch)
           (uri (string-append
                 "https://raw.githubusercontent.com/"
                 "anthropic-experimental/sandbox-runtime/"
                 "4fad8fa35db3f09958db1df401b30bd00402b611"
                 "/vendor/seccomp/x64/unix-block.bpf"))
           (file-name (string-append "unix-block-" version ".bpf"))
           (sha256
            (base32 "01w8hr79mk93f3p8xavhsd2m1k9q76n9pcrsn56r6rs2smh5klf4"))))))
    (home-page "https://github.com/anthropic-experimental/sandbox-runtime")
    (synopsis "Seccomp filter for Claude Code sandbox")
    (description
     "Prebuilt seccomp filter binary and BPF program used by Claude Code's
@code{/sandbox} feature to apply Linux seccomp-bpf restrictions.")
    (license license:asl2.0)))


;;; ---- 2. ferris-scan-bin ----
;;; Prebuilt Rust TUI file scanner binary.

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
       (file-name (string-append "ferris-scan-tui-" version))
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
                 (bin (string-append out "/bin")))
            (mkdir-p bin)
            (copy-file (assoc-ref %build-inputs "source")
                       (string-append bin "/ferris-scan"))
            (chmod (string-append bin "/ferris-scan") #o755)
            #t))))
    (home-page "https://github.com/Vnilabean/ferris-scan")
    (synopsis "Lightweight Rust-based file scanner (prebuilt binary)")
    (description
     "Ferris Scan is a lightweight and simple Rust-based file scanner
providing a TUI interface.  This package installs the prebuilt Linux
x86_64 binary from upstream releases.")
    (license license:expat)))


;;; ---- 3. gram-editor-bin ----
;;; Prebuilt code editor, repackaged from upstream tarball.

(define-public gram-editor-bin
  (package
    (name "gram-editor-bin")
    (version "1.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://codeberg.org/GramEditor/gram/releases/download/"
             version "/gram-linux-x86_64-" version ".tar.gz"))
       (sha256
        (base32 "0pzlp8x2qxzcl9zrmhcvww26kmilgfmb2kkmjkj9znf868x65l98"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (tmp (string-append (getcwd) "/src"))
                 (opt (string-append out "/opt/gram"))
                 (bin (string-append out "/bin"))
                 (apps (string-append out "/share/applications"))
                 (icons (string-append out "/share/icons")))
            (mkdir-p tmp)
            (invoke #$(file-append tar "/bin/tar")
                    "--use-compress-program" #$(file-append gzip "/bin/gzip")
                    "-xf" src "-C" tmp)
            (let ((appdir (string-append tmp "/gram.app")))
              (mkdir-p opt)
              (copy-recursively (string-append appdir "/bin") (string-append opt "/bin"))
              (copy-recursively (string-append appdir "/lib") (string-append opt "/lib"))
              (when (file-exists? (string-append appdir "/libexec"))
                (copy-recursively (string-append appdir "/libexec")
                                  (string-append opt "/libexec")))
              (mkdir-p bin)
              (symlink (string-append opt "/bin/gram")
                       (string-append bin "/gram"))
              (when (file-exists? (string-append appdir "/share/icons"))
                (mkdir-p icons)
                (copy-recursively (string-append appdir "/share/icons") icons))
              (mkdir-p apps)
              (when (file-exists? (string-append appdir "/share/applications"))
                (copy-recursively (string-append appdir "/share/applications") apps)))
            #t))))
    (native-inputs (list tar gzip))
    (home-page "https://codeberg.org/GramEditor/gram")
    (synopsis "Code editor (prebuilt binary)")
    (description
     "Gram is a code editor.  This package repackages the upstream
x86_64 Linux tarball release.")
    (license license:agpl3+)))


;;; ---- 4. sabiql-bin ----
;;; Fast TUI for PostgreSQL, prebuilt binary tarball.

(define-public sabiql-bin
  (package
    (name "sabiql-bin")
    (version "1.9.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/riii111/sabiql/releases/download/v"
             version "/sabiql-x86_64-unknown-linux-gnu.tar.gz"))
       (sha256
        (base32 "0mp1x9k4v9r5snba1m07ywbhx6d6kx85zrbhq19wrkh2bv24y0ay"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (bin (string-append out "/bin"))
                 (tmp (string-append (getcwd) "/src")))
            (mkdir-p tmp)
            (invoke #$(file-append tar "/bin/tar")
                    "--use-compress-program" #$(file-append gzip "/bin/gzip")
                    "-xf" src "-C" tmp)
            (mkdir-p bin)
            (copy-file (string-append tmp "/sabiql")
                       (string-append bin "/sabiql"))
            (chmod (string-append bin "/sabiql") #o755)
            #t))))
    (native-inputs (list tar gzip))
    (home-page "https://github.com/riii111/sabiql")
    (synopsis "Fast TUI for PostgreSQL databases (prebuilt binary)")
    (description
     "SabiQL is a fast, driver-less TUI to browse, query, and edit PostgreSQL
databases.  This package installs the prebuilt x86_64 Linux binary.")
    (license license:expat)))


;;; ---- 5. netwatch-tui ----
;;; Real-time network diagnostics TUI, prebuilt binary tarball.

(define-public netwatch-tui
  (package
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
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (bin (string-append out "/bin"))
                 (tmp (string-append (getcwd) "/src")))
            (mkdir-p tmp)
            (invoke #$(file-append tar "/bin/tar")
                    "--use-compress-program" #$(file-append gzip "/bin/gzip")
                    "-xf" src "-C" tmp)
            (mkdir-p bin)
            (copy-file (string-append tmp "/netwatch-linux-x86_64")
                       (string-append bin "/netwatch"))
            (chmod (string-append bin "/netwatch") #o755)
            #t))))
    (native-inputs (list tar gzip))
    (home-page "https://github.com/matthart1983/netwatch")
    (synopsis "Real-time network diagnostics TUI (prebuilt binary)")
    (description
     "NetWatch is a real-time network diagnostics TUI, like htop for your
network.  This package installs the prebuilt x86_64 Linux binary.")
    (license license:expat)))


;;; ---- 6. console2svg-bin ----
;;; Convert terminal output to SVG, prebuilt binary.

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
       (file-name (string-append "console2svg-" version "-linux-x64"))
       (sha256
        (base32 "0cwbq60zw4dx5gg2xkd5qny22yg9cjkyfrcnznl4rmkicxas8mal"))))
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
                       (string-append bin "/console2svg"))
            (chmod (string-append bin "/console2svg") #o755)
            #t))))
    (home-page "https://github.com/arika0093/console2svg")
    (synopsis "Convert terminal output to SVG (prebuilt binary)")
    (description
     "Console2svg converts terminal output into SVG images.  This package
installs the prebuilt x86_64 Linux binary.")
    (license license:asl2.0)))


;;; ---- 7. nodejs-knit ----
;;; Node.js tool to knit local dependencies together.
;;; Trivial repackaging of the source tarball with a wrapper script.

(define-public nodejs-knit
  (package
    (name "nodejs-knit")
    (version "0.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/coopbri/knit/archive/refs/tags/v"
             version ".tar.gz"))
       (file-name (string-append "knit-" version ".tar.gz"))
       (sha256
        (base32 "16bbjlafc6ky7z0p0hx3gvvdy9yrijb55dyz3w82s62w3a7k13hj"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (lib (string-append out "/lib/node_modules/knit"))
                 (bin (string-append out "/bin")))
            (setenv "PATH" (string-append #$tar "/bin:" #$gzip "/bin"))
            (invoke (string-append #$tar "/bin/tar") "xzf" src)
            (mkdir-p lib)
            (copy-recursively (string-append "knit-" #$version) lib)
            (mkdir-p bin)
            (let ((wrapper (string-append bin "/knit")))
              (call-with-output-file wrapper
                (lambda (port)
                  (format port "#!~a~%exec ~a ~a/bin/knit.js \"$@\"~%"
                          (string-append #$bash-minimal "/bin/bash")
                          (string-append #$node "/bin/node")
                          lib)))
              (chmod wrapper #o755))
            #t))))
    (native-inputs (list tar gzip))
    (inputs (list bash-minimal node))
    (home-page "https://github.com/coopbri/knit")
    (synopsis "Knit local Node.js dependencies together")
    (description
     "Knit is a Node.js tool that links local packages together for
development, similar to @code{npm link} but with better support for
monorepo workflows.")
    (license license:expat)))
