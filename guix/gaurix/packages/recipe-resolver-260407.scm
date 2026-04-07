;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2026 Gaurix contributors
;;;
;;; NEEDS_RECIPE_DESIGN resolution — recipe-resolver-260407
;;; Resolves 8 packages with actual recipes (binary + source builds).
;;; Additional packages resolved via compat aliases in general-compat.scm
;;; and status updates in todo_general_packages.org.

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
