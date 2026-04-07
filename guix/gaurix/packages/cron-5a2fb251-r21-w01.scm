;;; NEEDS_RECIPE_DESIGN resolution — round 21, worker 01
;;; 17 new recipes: 10 binary repacks (funzzy-bin, lazytail-bin,
;;; pandoc-crossref-bin, omp-manager-bin, tmux-plugin-panel-bin,
;;; workz-bin, console2svg-bin, ferris-scan-bin, sabiql-bin,
;;; compendium), 2 Go binary repacks (tufw-git, mezzotone-bin),
;;; 1 Go binary repack with libpcap (netwatch-tui),
;;; 1 Python pyproject (python-aiohttp-jinja2),
;;; 2 shell script installs (codexbar, claudebar),
;;; 1 shell script install (lobster).
;;; 13 re-blocked with specific reasons.
(define-module (gaurix packages cron-5a2fb251-r21-w01)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system trivial)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system gnu)
  #:use-module (guix utils)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages elf)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages networking)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages terminals)
  #:use-module (gnu packages web)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages xml)
  #:use-module (gnu packages video)
  #:use-module ((guix licenses) #:prefix license:)
  #:export (funzzy-bin
            lazytail-bin
            pandoc-crossref-bin
            lobster
            python-aiohttp-jinja2
            codexbar
            claudebar
            omp-manager-bin
            tmux-plugin-panel-bin
            tufw-git
            mezzotone-bin
            workz-bin
            console2svg-bin
            ferris-scan-bin
            sabiql-bin
            netwatch-tui
            compendium))

;;; ─────────────────────────────────────────────
;;; 1. funzzy-bin (3071) — Lightweight file watcher (binary)
;;; ─────────────────────────────────────────────
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
                 (libc-lib (dirname (dirname ld-so)))
                 (gcc-lib  (assoc-ref %build-inputs "gcc:lib"))
                 (rpath    (string-append libc-lib "/lib:" gcc-lib "/lib"))
                 (bin-dir  (string-append out "/bin")))
            (mkdir-p bin-dir)
            (setenv "PATH"
                    (string-append (dirname tar) ":"
                                   (dirname gzip)))
            (invoke tar "xzf" src)
            (install-file "funzzy" bin-dir)
            (let ((exe (string-append bin-dir "/funzzy")))
              (chmod exe #o755)
              (invoke patchelf "--set-interpreter" ld-so exe)
              (invoke patchelf "--set-rpath" rpath exe))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/cristianoliveira/funzzy")
    (synopsis "lightweight blazingly fast file watcher")
    (description
     "Funzzy is a lightweight file watcher that executes configured commands
when files change.  It uses a YAML configuration file to specify watch rules
and supports glob patterns for matching files.")
    (license license:expat)))

;;; ─────────────────────────────────────────────
;;; 2. lazytail-bin (3070) — TUI log viewer (binary)
;;; ─────────────────────────────────────────────
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
                 (libc-lib (dirname (dirname ld-so)))
                 (gcc-lib  (assoc-ref %build-inputs "gcc:lib"))
                 (rpath    (string-append libc-lib "/lib:" gcc-lib "/lib"))
                 (bin-dir  (string-append out "/bin")))
            (mkdir-p bin-dir)
            (setenv "PATH"
                    (string-append (dirname tar) ":"
                                   (dirname gzip)))
            (invoke tar "xzf" src)
            (install-file "lazytail" bin-dir)
            (let ((exe (string-append bin-dir "/lazytail")))
              (chmod exe #o755)
              (invoke patchelf "--set-interpreter" ld-so exe)
              (invoke patchelf "--set-rpath" rpath exe))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/raaymax/lazytail")
    (synopsis "fast universal terminal-based log viewer")
    (description
     "Lazytail is a terminal-based log viewer with live filtering and follow
mode.  It provides a TUI for reading, searching, and monitoring log files
in real time.")
    (license license:expat)))

;;; ─────────────────────────────────────────────
;;; 3. pandoc-crossref-bin (3092) — Pandoc cross-reference filter (binary)
;;; ─────────────────────────────────────────────
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
    (build-system trivial-build-system)
    (native-inputs (list tar xz patchelf))
    (inputs (list bash-minimal glibc `(,gcc "lib") zlib gmp))
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
                 (zlib-lib (assoc-ref %build-inputs "zlib"))
                 (gmp-lib  (assoc-ref %build-inputs "gmp"))
                 (rpath    (string-append libc-lib "/lib:"
                                          gcc-lib "/lib:"
                                          zlib-lib "/lib:"
                                          gmp-lib "/lib"))
                 (bin-dir  (string-append out "/bin")))
            (mkdir-p bin-dir)
            (setenv "PATH"
                    (string-append (dirname tar) ":"
                                   (dirname xz)))
            (invoke tar "xJf" src)
            (install-file "pandoc-crossref" bin-dir)
            (let ((exe (string-append bin-dir "/pandoc-crossref")))
              (chmod exe #o755)
              (invoke patchelf "--set-interpreter" ld-so exe)
              (invoke patchelf "--set-rpath" rpath exe))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/lierdakil/pandoc-crossref")
    (synopsis "pandoc filter for cross-references in documents")
    (description
     "Pandoc-crossref is a pandoc filter for numbering figures, equations,
tables, and cross-references to them.  It processes pandoc's internal
document representation to add automatic numbering and reference links.")
    (license license:gpl2+)))

;;; ─────────────────────────────────────────────
;;; 4. lobster (3076) — Shell script for streaming media
;;; ─────────────────────────────────────────────
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
    (inputs (list bash-minimal curl fzf mpv html-xml-utils))
    (home-page "https://github.com/justchokingaround/lobster")
    (synopsis "shell script for streaming movies and shows from the terminal")
    (description
     "Lobster is a POSIX shell script for streaming movies, web series, and
shows directly in the terminal.  It uses @command{fzf} for selection,
@command{mpv} for playback, and @command{curl} for fetching metadata.")
    (license license:gpl2)))

;;; ─────────────────────────────────────────────
;;; 5. python-aiohttp-jinja2 (3082) — Jinja2 for aiohttp.web
;;; ─────────────────────────────────────────────
(define-public python-aiohttp-jinja2
  (package
    (name "python-aiohttp-jinja2")
    (version "1.6")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://files.pythonhosted.org/packages/e6/39/"
             "da5a94dd89b1af7241fb7fc99ae4e73505b5f898b540b6aba6dc7afe600e/"
             "aiohttp-jinja2-" version ".tar.gz"))
       (sha256
        (base32 "1qmh37k5p4f0nq2qshqd4faj9dv10zyvniz5i8pabg75ci9gz9x3"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))  ;; tests require running aiohttp server
    (propagated-inputs (list python-aiohttp python-jinja2))
    (home-page "https://github.com/aio-libs/aiohttp-jinja2")
    (synopsis "jinja2 template renderer for aiohttp.web")
    (description
     "Aiohttp-jinja2 integrates the Jinja2 template engine with the aiohttp
web framework.  It provides decorators and helpers for rendering Jinja2
templates in aiohttp request handlers.")
    (license license:asl2.0)))

;;; ─────────────────────────────────────────────
;;; 6. codexbar (3093) — Waybar widget for Codex usage
;;; ─────────────────────────────────────────────
(define-public codexbar
  (package
    (name "codexbar")
    (version "0.1.17")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/mryll/codexbar/archive/refs/tags/v"
             version ".tar.gz"))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "09bb4nmvlafw84y15h60dvps70gd62vmizg6m64fmymghn2anicc"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:make-flags
      #~(list (string-append "PREFIX=" #$output))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure))))
    (inputs (list bash-minimal curl jq))
    (home-page "https://github.com/mryll/codexbar")
    (synopsis "waybar widget showing OpenAI Codex subscription usage")
    (description
     "Codexbar is a Waybar widget that displays OpenAI Codex subscription
usage with progress bars.  It uses @command{curl} and @command{jq} to
fetch and format API usage data for display in the Waybar status bar.")
    (license license:expat)))

;;; ─────────────────────────────────────────────
;;; 7. claudebar (3096) — Waybar widget for Claude usage
;;; ─────────────────────────────────────────────
(define-public claudebar
  (package
    (name "claudebar")
    (version "0.1.17")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/mryll/claudebar/archive/refs/tags/v"
             version ".tar.gz"))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0yw1yylgwsfb3i60gfjyrfqgbzpgyg9x2q6x0kinmagb9s5ssrq0"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:make-flags
      #~(list (string-append "PREFIX=" #$output))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure))))
    (inputs (list bash-minimal curl jq))
    (home-page "https://github.com/mryll/claudebar")
    (synopsis "waybar widget showing Claude AI subscription usage")
    (description
     "Claudebar is a Waybar widget that displays Anthropic Claude subscription
usage with progress bars.  It uses @command{curl} and @command{jq} to
fetch and format API usage data for display in the Waybar status bar.")
    (license license:expat)))

;;; ─────────────────────────────────────────────
;;; 8. omp-manager-bin (3087) — TUI for Oh My Posh (binary)
;;; ─────────────────────────────────────────────
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
                 (libc-lib (dirname (dirname ld-so)))
                 (gcc-lib  (assoc-ref %build-inputs "gcc:lib"))
                 (rpath    (string-append libc-lib "/lib:" gcc-lib "/lib"))
                 (bin-dir  (string-append out "/bin")))
            (mkdir-p bin-dir)
            (setenv "PATH"
                    (string-append (dirname tar) ":"
                                   (dirname gzip)))
            (invoke tar "xzf" src)
            (install-file "omp-manager" bin-dir)
            (let ((exe (string-append bin-dir "/omp-manager")))
              (chmod exe #o755)
              (invoke patchelf "--set-interpreter" ld-so exe)
              (invoke patchelf "--set-rpath" rpath exe))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/psmux/omp-manager")
    (synopsis "TUI manager for Oh My Posh themes and fonts")
    (description
     "Omp-manager is a terminal user interface for managing Oh My Posh.
It lets you browse themes, install Nerd Fonts, and configure shell
prompt settings interactively.")
    (license license:expat)))

;;; ─────────────────────────────────────────────
;;; 9. tmux-plugin-panel-bin (3088) — TUI plugin manager for tmux (binary)
;;; ─────────────────────────────────────────────
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
                 (libc-lib (dirname (dirname ld-so)))
                 (gcc-lib  (assoc-ref %build-inputs "gcc:lib"))
                 (rpath    (string-append libc-lib "/lib:" gcc-lib "/lib"))
                 (bin-dir  (string-append out "/bin")))
            (mkdir-p bin-dir)
            (setenv "PATH"
                    (string-append (dirname tar) ":"
                                   (dirname gzip)))
            (invoke tar "xzf" src)
            (for-each
             (lambda (exe-name)
               (when (file-exists? exe-name)
                 (install-file exe-name bin-dir)
                 (let ((exe (string-append bin-dir "/" exe-name)))
                   (chmod exe #o755)
                   (invoke patchelf "--set-interpreter" ld-so exe)
                   (invoke patchelf "--set-rpath" rpath exe))))
             '("tmuxpanel" "tmuxthemes" "tmuxplugins"))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/psmux/Tmux-Plugin-Panel")
    (synopsis "TUI plugin manager for tmux")
    (description
     "Tmux-Plugin-Panel is a terminal user interface for managing tmux plugins.
It provides three tools: @command{tmuxpanel} for plugin management,
@command{tmuxthemes} for theme browsing, and @command{tmuxplugins} for
plugin discovery and installation.")
    (license license:expat)))

;;; ─────────────────────────────────────────────
;;; 10. tufw-git (3099) — TUI for ufw firewall (binary)
;;; ─────────────────────────────────────────────
(define-public tufw-git
  (package
    (name "tufw-git")
    (version "0.2.7")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/peltho/tufw/releases/download/v"
             version "/tufw_" version "_linux_amd64.tar.gz"))
       (sha256
        (base32 "0gsgc7akdb29qxcg53ca70zszwfk46l88xz65m4b0a69di9r38gv"))))
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
            (install-file "tufw" bin-dir)
            (chmod (string-append bin-dir "/tufw") #o755)))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/peltho/tufw")
    (synopsis "terminal UI for the ufw firewall")
    (description
     "Tufw is a terminal user interface for managing the Uncomplicated
Firewall (ufw).  It provides an interactive TUI for adding, removing,
and viewing firewall rules without memorizing command syntax.")
    (license license:expat)))

;;; ─────────────────────────────────────────────
;;; 11. mezzotone-bin (3079) — Image-to-ASCII converter (binary)
;;; ─────────────────────────────────────────────
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
       (file-name (string-append "mezzotone-" version "-linux-amd64"))
       (sha256
        (base32 "0gb1ivviybc7zbailqsbmyw3dx80jizkqkzmhypr05r2rdy3fqy9"))))
    (build-system trivial-build-system)
    (inputs (list bash-minimal))
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
            ;; Go static binary — direct single-file download
            (copy-file src (string-append bin-dir "/mezzotone"))
            (chmod (string-append bin-dir "/mezzotone") #o755)))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/joaoheitorgarcia/Mezzotone")
    (synopsis "convert images and GIFs into ASCII or Unicode art in the terminal")
    (description
     "Mezzotone is a TUI application that converts images and GIFs into
ASCII or Unicode art.  It provides an interactive Bubble Tea interface
for browsing files and rendering image previews in the terminal.")
    (license license:expat)))

;;; ─────────────────────────────────────────────
;;; 12. workz-bin (3086) — Git worktree manager (binary)
;;; ─────────────────────────────────────────────
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
                 (libc-lib (dirname (dirname ld-so)))
                 (gcc-lib  (assoc-ref %build-inputs "gcc:lib"))
                 (rpath    (string-append libc-lib "/lib:" gcc-lib "/lib"))
                 (bin-dir  (string-append out "/bin")))
            (mkdir-p bin-dir)
            (setenv "PATH"
                    (string-append (dirname tar) ":"
                                   (dirname gzip)))
            (invoke tar "xzf" src)
            (install-file "workz" bin-dir)
            (let ((exe (string-append bin-dir "/workz")))
              (chmod exe #o755)
              (invoke patchelf "--set-interpreter" ld-so exe)
              (invoke patchelf "--set-rpath" rpath exe))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/rohansx/workz")
    (synopsis "git worktree manager with parallel AI agent support")
    (description
     "Workz is a git worktree manager with zero-config dependency sync and
fleet mode for parallel AI coding agents.  It simplifies creating,
switching, and managing worktrees with automatic dependency management.")
    (license license:expat)))

;;; ─────────────────────────────────────────────
;;; 13. console2svg-bin (3048) — Terminal output to SVG (binary)
;;; ─────────────────────────────────────────────
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
        (base32 "17yi3cccyxlsxxmbqb254v36lbk0d7cv59mnsclcs72jkq65yk26"))))
    (build-system trivial-build-system)
    (native-inputs (list patchelf))
    (inputs (list bash-minimal glibc `(,gcc "lib")))
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
                 (rpath    (string-append libc-lib "/lib:" gcc-lib "/lib"))
                 (bin-dir  (string-append out "/bin")))
            (mkdir-p bin-dir)
            (copy-file src (string-append bin-dir "/console2svg"))
            (let ((exe (string-append bin-dir "/console2svg")))
              (chmod exe #o755)
              (invoke patchelf "--set-interpreter" ld-so exe)
              (invoke patchelf "--set-rpath" rpath exe))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/arika0093/console2svg")
    (synopsis "convert terminal output into SVG images")
    (description
     "Console2svg converts terminal output (including ANSI escape codes) into
SVG images.  It preserves colors, formatting, and layout to produce
shareable vector graphics from command-line output.")
    (license license:asl2.0)))

;;; ─────────────────────────────────────────────
;;; 14. ferris-scan-bin (3032) — Rust port scanner TUI (binary)
;;; ─────────────────────────────────────────────
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
       (file-name (string-append "ferris-scan-tui-" version "-linux"))
       (sha256
        (base32 "1a2sb0w04a3qnxdbjg7nf74zab949wpsj5yfgbx5v9yfgws8fbq4"))))
    (build-system trivial-build-system)
    (native-inputs (list patchelf))
    (inputs (list bash-minimal glibc `(,gcc "lib")))
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
                 (rpath    (string-append libc-lib "/lib:" gcc-lib "/lib"))
                 (bin-dir  (string-append out "/bin")))
            (mkdir-p bin-dir)
            (copy-file src (string-append bin-dir "/ferris-scan"))
            (let ((exe (string-append bin-dir "/ferris-scan")))
              (chmod exe #o755)
              (invoke patchelf "--set-interpreter" ld-so exe)
              (invoke patchelf "--set-rpath" rpath exe))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Vnilabean/ferris-scan")
    (synopsis "network port scanner with a terminal UI")
    (description
     "Ferris-scan is a network port scanner with a terminal user interface.
It provides a TUI for scanning network ports and displaying results
interactively.")
    (license license:expat)))

;;; ─────────────────────────────────────────────
;;; 15. sabiql-bin (3036) — PostgreSQL TUI client (binary)
;;; ─────────────────────────────────────────────
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
                 (libc-lib (dirname (dirname ld-so)))
                 (gcc-lib  (assoc-ref %build-inputs "gcc:lib"))
                 (rpath    (string-append libc-lib "/lib:" gcc-lib "/lib"))
                 (bin-dir  (string-append out "/bin")))
            (mkdir-p bin-dir)
            (setenv "PATH"
                    (string-append (dirname tar) ":"
                                   (dirname gzip)))
            (invoke tar "xzf" src)
            (install-file "sabiql" bin-dir)
            (let ((exe (string-append bin-dir "/sabiql")))
              (chmod exe #o755)
              (invoke patchelf "--set-interpreter" ld-so exe)
              (invoke patchelf "--set-rpath" rpath exe))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/riii111/sabiql")
    (synopsis "terminal UI client for PostgreSQL databases")
    (description
     "Sabiql is a terminal user interface client for PostgreSQL.  It provides
an interactive TUI for browsing database schemas, running queries, and
inspecting results directly from the terminal.")
    (license license:expat)))

;;; ─────────────────────────────────────────────
;;; 16. netwatch-tui (3038) — Network monitoring TUI (binary)
;;; ─────────────────────────────────────────────
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
    (native-inputs (list tar gzip patchelf))
    (inputs (list bash-minimal glibc `(,gcc "lib") libpcap))
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
                 (libc-lib (dirname (dirname ld-so)))
                 (gcc-lib  (assoc-ref %build-inputs "gcc:lib"))
                 (pcap-lib (assoc-ref %build-inputs "libpcap"))
                 (rpath    (string-append libc-lib "/lib:"
                                          gcc-lib "/lib:"
                                          pcap-lib "/lib"))
                 (bin-dir  (string-append out "/bin")))
            (mkdir-p bin-dir)
            (setenv "PATH"
                    (string-append (dirname tar) ":"
                                   (dirname gzip)))
            (invoke tar "xzf" src)
            (install-file "netwatch" bin-dir)
            (let ((exe (string-append bin-dir "/netwatch")))
              (chmod exe #o755)
              (invoke patchelf "--set-interpreter" ld-so exe)
              (invoke patchelf "--set-rpath" rpath exe))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/matthart1983/netwatch")
    (synopsis "network monitoring tool with a terminal UI")
    (description
     "Netwatch is a network monitoring tool with a terminal user interface.
It captures and displays network traffic in real time, providing packet
counts, bandwidth usage, and connection statistics per process.")
    (license license:expat)))

;;; ─────────────────────────────────────────────
;;; 17. compendium (3090) — User-friendly strace (binary)
;;; ─────────────────────────────────────────────
(define-public compendium
  (package
    (name "compendium")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/louisboilard/compendium/releases/download/v"
             version "/compendium-linux-x86_64"))
       (file-name (string-append "compendium-" version "-linux-x86_64"))
       (sha256
        (base32 "1849frwfgyk63jvwlsa8mc3rmrqv5874cqkr9kfmf2jb5gb229jb"))))
    (build-system trivial-build-system)
    (native-inputs (list patchelf))
    (inputs (list bash-minimal glibc `(,gcc "lib")))
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
                 (rpath    (string-append libc-lib "/lib:" gcc-lib "/lib"))
                 (bin-dir  (string-append out "/bin")))
            (mkdir-p bin-dir)
            (copy-file src (string-append bin-dir "/compendium"))
            (let ((exe (string-append bin-dir "/compendium")))
              (chmod exe #o755)
              (invoke patchelf "--set-interpreter" ld-so exe)
              (invoke patchelf "--set-rpath" rpath exe))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/louisboilard/compendium")
    (synopsis "user-friendly strace for x86 Linux with HTML reports")
    (description
     "Compendium is a user-friendly alternative to strace for x86 Linux.  It
traces system calls and generates HTML reports with categorized output,
making it easier to understand program behavior.")
    (license license:expat)))
