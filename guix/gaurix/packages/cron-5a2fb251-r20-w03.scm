;;; NEEDS_RECIPE_DESIGN resolution — round 20, worker 03
;;; Resolved: comp-scan-bin, wo-bin, oken-bin, cliamp, c47-bin, r47-bin
;;; BLOCKED: udiskr (nightly Rust), docx-you-want (Rust crate deps),
;;;   tilem-gtk3-git (autotools source build with complex deps),
;;;   mkbrr-gui-bin (100+ webkit/gtk shared-lib deps)
(define-module (gaurix packages cron-5a2fb251-r20-w03)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix build-system trivial)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages elf)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages multiprecision)
  #:use-module (gnu packages pulseaudio))

;;; ─────────────────────────────────────────────
;;; 1. comp-scan-bin — Local AI agent for system scanning
;;; ─────────────────────────────────────────────
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
                 (bash     (search-input-file %build-inputs "/bin/bash"))
                 (ld-so    (search-input-file %build-inputs
                                              "/lib/ld-linux-x86-64.so.2"))
                 (libc-lib (dirname (dirname ld-so)))
                 (gcc-lib  (assoc-ref %build-inputs "gcc:lib"))
                 (rpath    (string-append libc-lib "/lib:" gcc-lib "/lib"))
                 (bin-dir  (string-append out "/bin")))
            (mkdir-p bin-dir)
            (setenv "PATH"
                    (string-append (dirname tar) ":"
                                   (dirname gzip)))
            (invoke tar "xzf" src)
            (let ((exe "compscan"))
              (install-file exe bin-dir)
              (let ((installed (string-append bin-dir "/compscan")))
                (chmod installed #o755)
                (invoke patchelf "--set-interpreter" ld-so installed)
                (invoke patchelf "--set-rpath" rpath installed)))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/vvk147/comp-scan")
    (synopsis
     "Local AI agent that scans your system and suggests improvements")
    (description
     "Comp-scan is a fully local AI agent that scans your system, observes
usage patterns, and suggests one-click improvements.  It runs entirely on
the local machine without sending data externally.")
    (license license:expat)))

;;; ─────────────────────────────────────────────
;;; 2. wo-bin — Workspace shell manager
;;; ─────────────────────────────────────────────
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
            (install-file "wo" bin-dir)
            (chmod (string-append bin-dir "/wo") #o755)))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/antham/wo")
    (synopsis "Workspace shell manager")
    (description
     "Wo is a workspace shell manager that helps you organise and switch
between project workspaces from the command line.")
    (license license:expat)))

;;; ─────────────────────────────────────────────
;;; 3. oken-bin — Smarter SSH CLI with fuzzy host picker
;;; ─────────────────────────────────────────────
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
                 (xz       (search-input-file %build-inputs "/bin/xz"))
                 (patchelf (search-input-file %build-inputs "/bin/patchelf"))
                 (ld-so    (search-input-file %build-inputs
                                              "/lib/ld-linux-x86-64.so.2"))
                 (libc-lib (dirname (dirname ld-so)))
                 (gcc-lib  (assoc-ref %build-inputs "gcc:lib"))
                 (rpath    (string-append libc-lib "/lib:" gcc-lib "/lib"))
                 (bin-dir  (string-append out "/bin")))
            (mkdir-p bin-dir)
            (setenv "PATH"
                    (string-append (dirname tar) ":"
                                   (dirname xz)))
            (invoke tar "xf" src)
            (let ((exe "oken-x86_64-unknown-linux-gnu/oken"))
              (install-file exe bin-dir)
              (let ((installed (string-append bin-dir "/oken")))
                (chmod installed #o755)
                (invoke patchelf "--set-interpreter" ld-so installed)
                (invoke patchelf "--set-rpath" rpath installed)))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/linkwithjoydeep/oken")
    (synopsis "Smarter SSH CLI with host management and fuzzy picker")
    (description
     "Oken is a smarter SSH CLI with better host management and a fuzzy host
picker.  It works standalone or as an optional drop-in replacement for the
@command{ssh} command.")
    (license license:expat)))

;;; ─────────────────────────────────────────────
;;; 4. cliamp — Retro terminal music player (binary)
;;; ─────────────────────────────────────────────
(define-public cliamp
  (package
    (name "cliamp")
    (version "1.34.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/bjarneo/cliamp/releases/download/v"
             version "/cliamp-linux-amd64"))
       (sha256
        (base32 "0gn01pbvs0db871a6v58vwim5yibsk3yjmy5907z9gm467fh9c8a"))))
    (build-system trivial-build-system)
    (native-inputs (list patchelf))
    (inputs (list bash-minimal glibc `(,gcc "lib") alsa-lib))
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
                 (libc-lib (dirname (dirname ld-so)))
                 (gcc-lib  (assoc-ref %build-inputs "gcc:lib"))
                 (alsa     (assoc-ref %build-inputs "alsa-lib"))
                 (rpath    (string-append libc-lib "/lib:"
                                          gcc-lib "/lib:"
                                          alsa "/lib"))
                 (bin-dir  (string-append out "/bin")))
            (mkdir-p bin-dir)
            (copy-file src (string-append bin-dir "/cliamp"))
            (chmod (string-append bin-dir "/cliamp") #o755)
            (invoke patchelf "--set-interpreter" ld-so
                    (string-append bin-dir "/cliamp"))
            (invoke patchelf "--set-rpath" rpath
                    (string-append bin-dir "/cliamp"))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/bjarneo/cliamp")
    (synopsis "Retro terminal music player inspired by Winamp 2.x")
    (description
     "Cliamp is a retro terminal music player inspired by Winamp 2.x.  It
plays audio files from the command line with a nostalgic Winamp-style
text interface.")
    (license license:expat)))

;;; ─────────────────────────────────────────────
;;; 5. c47-bin — Emulator for the C47 pocket calculator
;;; ─────────────────────────────────────────────
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
    (inputs (list bash-minimal glibc `(,gcc "lib")
                  gtk+ cairo glib gmp pulseaudio))
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
                 (bash     (search-input-file %build-inputs "/bin/bash"))
                 (ld-so    (search-input-file %build-inputs
                                              "/lib/ld-linux-x86-64.so.2"))
                 (libc-lib (dirname (dirname ld-so)))
                 (gcc-lib  (assoc-ref %build-inputs "gcc:lib"))
                 (gtk      (assoc-ref %build-inputs "gtk+"))
                 (cairo-in (assoc-ref %build-inputs "cairo"))
                 (glib-in  (assoc-ref %build-inputs "glib"))
                 (gmp-in   (assoc-ref %build-inputs "gmp"))
                 (pulse    (assoc-ref %build-inputs "pulseaudio"))
                 (rpath    (string-append libc-lib "/lib:"
                                          gcc-lib "/lib:"
                                          gtk "/lib:"
                                          cairo-in "/lib:"
                                          glib-in "/lib:"
                                          gmp-in "/lib:"
                                          pulse "/lib"))
                 (lib-dir  (string-append out "/lib/c47"))
                 (share    (string-append out "/share/c47"))
                 (bin-dir  (string-append out "/bin")))
            (invoke unzip "-q" src)
            (let ((srcdir (string-append "c47-linux-" #$version)))
              (mkdir-p lib-dir)
              (mkdir-p share)
              (mkdir-p bin-dir)
              ;; Install binary
              (let ((exe (string-append srcdir "/c47")))
                (install-file exe lib-dir)
                (chmod (string-append lib-dir "/c47") #o755)
                (invoke patchelf "--set-interpreter" ld-so
                        (string-append lib-dir "/c47"))
                (invoke patchelf "--set-rpath" rpath
                        (string-append lib-dir "/c47")))
              ;; Install font and resources
              (copy-file (string-append srcdir "/C47__StandardFont.ttf")
                         (string-append share "/C47__StandardFont.ttf"))
              (copy-recursively (string-append srcdir "/res")
                                (string-append share "/res"))
              ;; Wrapper script
              (call-with-output-file (string-append bin-dir "/c47")
                (lambda (port)
                  (format port "#!~a
mkdir -p \"$HOME/.config/c47\"
cd \"$HOME/.config/c47\" || exit 1
ln -sf ~a/res ./res
ln -sf ~a/c47 ./c47
ln -sf ~a/C47__StandardFont.ttf ./C47__StandardFont.ttf
./c47 \"$@\"
rm -f res c47 C47__StandardFont.ttf
" bash share lib-dir share)))
              (chmod (string-append bin-dir "/c47") #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://47calc.com")
    (synopsis "Emulator for the C47 pocket calculator")
    (description
     "C47 is an emulator for the C47 pocket calculator, a programmable
scientific calculator with a rich set of mathematical functions.")
    (license license:gpl3+)))

;;; ─────────────────────────────────────────────
;;; 6. r47-bin — Emulator for the R47 pocket calculator
;;; ─────────────────────────────────────────────
(define-public r47-bin
  (package
    (name "r47-bin")
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
    (inputs (list bash-minimal glibc `(,gcc "lib")
                  gtk+ cairo glib gmp pulseaudio))
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
                 (bash     (search-input-file %build-inputs "/bin/bash"))
                 (ld-so    (search-input-file %build-inputs
                                              "/lib/ld-linux-x86-64.so.2"))
                 (libc-lib (dirname (dirname ld-so)))
                 (gcc-lib  (assoc-ref %build-inputs "gcc:lib"))
                 (gtk      (assoc-ref %build-inputs "gtk+"))
                 (cairo-in (assoc-ref %build-inputs "cairo"))
                 (glib-in  (assoc-ref %build-inputs "glib"))
                 (gmp-in   (assoc-ref %build-inputs "gmp"))
                 (pulse    (assoc-ref %build-inputs "pulseaudio"))
                 (rpath    (string-append libc-lib "/lib:"
                                          gcc-lib "/lib:"
                                          gtk "/lib:"
                                          cairo-in "/lib:"
                                          glib-in "/lib:"
                                          gmp-in "/lib:"
                                          pulse "/lib"))
                 (lib-dir  (string-append out "/lib/r47"))
                 (share    (string-append out "/share/r47"))
                 (bin-dir  (string-append out "/bin")))
            (invoke unzip "-q" src)
            (let ((srcdir (string-append "c47-linux-" #$version)))
              (mkdir-p lib-dir)
              (mkdir-p share)
              (mkdir-p bin-dir)
              ;; Install binary
              (let ((exe (string-append srcdir "/r47")))
                (install-file exe lib-dir)
                (chmod (string-append lib-dir "/r47") #o755)
                (invoke patchelf "--set-interpreter" ld-so
                        (string-append lib-dir "/r47"))
                (invoke patchelf "--set-rpath" rpath
                        (string-append lib-dir "/r47")))
              ;; Install font and resources
              (copy-file (string-append srcdir "/C47__StandardFont.ttf")
                         (string-append share "/C47__StandardFont.ttf"))
              (copy-recursively (string-append srcdir "/res")
                                (string-append share "/res"))
              ;; Wrapper script
              (call-with-output-file (string-append bin-dir "/r47")
                (lambda (port)
                  (format port "#!~a
mkdir -p \"$HOME/.config/r47\"
cd \"$HOME/.config/r47\" || exit 1
ln -sf ~a/res ./res
ln -sf ~a/r47 ./r47
ln -sf ~a/C47__StandardFont.ttf ./C47__StandardFont.ttf
./r47 \"$@\"
rm -f res r47 C47__StandardFont.ttf
" bash share lib-dir share)))
              (chmod (string-append bin-dir "/r47") #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://47calc.com")
    (synopsis "Emulator for the R47 pocket calculator")
    (description
     "R47 is an emulator for the R47 pocket calculator, a reverse-Polish
notation (RPN) scientific calculator with programmable functions.")
    (license license:gpl3+)))
