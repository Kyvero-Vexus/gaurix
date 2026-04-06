;;; Round-22 worker-03 NEEDS_RECIPE_DESIGN resolution pass #14.
;;; 14 new recipes: 9 binary packages (iwmenu-bin, bzmenu-bin, pwmenu-bin,
;;; wrkflw-bin, ferris-scan-bin, wo-bin, oken-bin, lazytail-bin, funzzy-bin),
;;; 2 binary single-file packages (mezzotone-bin, claude-code-seccomp),
;;; 1 C library (libmodule), 1 shell script (lobster),
;;; 1 Python library (python-aiohttp-jinja2).
;;; 16 re-blocked with specific reasons.

(define-module (gaurix packages cron-c79f127f-r22-w03-nrd14)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system python)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages python-xyz)
  #:export (libmodule
            iwmenu-bin
            bzmenu-bin
            pwmenu-bin
            wrkflw-bin
            claude-code-seccomp
            ferris-scan-bin
            wo-bin
            oken-bin
            lazytail-bin
            funzzy-bin
            mezzotone-bin
            lobster
            python-aiohttp-jinja2))

;; ═══════════════════════════════════════════════════════════════════
;; 1. libmodule — C library for building modular Linux programs
;; ═══════════════════════════════════════════════════════════════════

(define-public libmodule
  (package
    (name "libmodule")
    (version "5.0.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/FedeDP/libmodule/archive/refs/tags/"
                    version ".tar.gz"))
              (sha256
               (base32 "1zpp46jly4sqb7gbffxajv72i6rh60cacc7sfrsr65mym9liw43j"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))  ;; tests require running modules
    (home-page "https://github.com/FedeDP/libmodule")
    (synopsis "C library for building modular Linux programs")
    (description
     "Libmodule provides a small C library to build simple and modular
Linux programs.  It encourages event-driven, module-oriented design
with clean startup/teardown lifecycles and a pub/sub message bus.")
    (license license:expat)))

;; ═══════════════════════════════════════════════════════════════════
;; 2. iwmenu-bin — launcher-driven Wi-Fi manager
;; ═══════════════════════════════════════════════════════════════════

(define-public iwmenu-bin
  (package
    (name "iwmenu-bin")
    (version "0.4.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/e-tho/iwmenu/releases/download/v"
                    version "/iwmenu-x86_64-linux-gnu"))
              (sha256
               (base32 "1pwkv6a8h5kx82dn7wpd9n701i510v2zwjzykd66r9rpm9pkc2rf"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~`(("iwmenu-x86_64-linux-gnu" "bin/iwmenu"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'set-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/iwmenu")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/e-tho/iwmenu")
    (synopsis "launcher-driven Wi-Fi manager for Linux")
    (description
     "Iwmenu is a launcher-driven Wi-Fi manager for Linux that integrates
with iwd.  It provides a simple interface for scanning, connecting, and
managing wireless networks through launcher menus like fuzzel, rofi,
or dmenu.")
    (license license:gpl3)))

;; ═══════════════════════════════════════════════════════════════════
;; 3. bzmenu-bin — launcher-driven Bluetooth manager
;; ═══════════════════════════════════════════════════════════════════

(define-public bzmenu-bin
  (package
    (name "bzmenu-bin")
    (version "0.4.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/e-tho/bzmenu/releases/download/v"
                    version "/bzmenu-x86_64-linux-gnu"))
              (sha256
               (base32 "0ggnand2ih6s1si6amp0mnl9r6d4gjj65vx03kysmzdvggxy71a2"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~`(("bzmenu-x86_64-linux-gnu" "bin/bzmenu"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'set-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/bzmenu")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/e-tho/bzmenu")
    (synopsis "launcher-driven Bluetooth manager for Linux")
    (description
     "Bzmenu is a launcher-driven Bluetooth manager for Linux.  It
integrates with BlueZ and provides a menu interface for pairing,
connecting, and managing Bluetooth devices through launchers like
fuzzel, rofi, or dmenu.")
    (license license:gpl3)))

;; ═══════════════════════════════════════════════════════════════════
;; 4. pwmenu-bin — launcher-driven audio manager
;; ═══════════════════════════════════════════════════════════════════

(define-public pwmenu-bin
  (package
    (name "pwmenu-bin")
    (version "0.4.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/e-tho/pwmenu/releases/download/v"
                    version "/pwmenu-x86_64-linux-gnu"))
              (sha256
               (base32 "0gj12lpwx6zw3p6gcda1gq7cr5frsvzzq1plra2sm511m0lg3rbj"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~`(("pwmenu-x86_64-linux-gnu" "bin/pwmenu"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'set-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/pwmenu")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/e-tho/pwmenu")
    (synopsis "launcher-driven audio manager for PipeWire")
    (description
     "Pwmenu is a launcher-driven audio manager for PipeWire on Linux.
It lets you switch audio sinks and sources, adjust volume, and manage
audio devices through launcher menus like fuzzel, rofi, or dmenu.")
    (license license:gpl3)))

;; ═══════════════════════════════════════════════════════════════════
;; 5. wrkflw-bin — validate and run GitHub Actions locally
;; ═══════════════════════════════════════════════════════════════════

(define-public wrkflw-bin
  (package
    (name "wrkflw-bin")
    (version "0.7.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/bahdotsh/wrkflw/releases/download/v"
                    version "/wrkflw-v" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32 "1bkqs48ph0b0m96p6v6kgrkh3kbhaqfcc5vvs4lsw5bfk3fizyxy"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~`(("wrkflw" "bin/wrkflw"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'set-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/wrkflw")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/bahdotsh/wrkflw")
    (synopsis "validate and execute GitHub Actions workflows locally")
    (description
     "Wrkflw validates and executes GitHub Actions workflow files locally.
It parses YAML workflow definitions, checks for syntax and structural
errors, and can run workflow steps in a local environment for testing
before pushing to CI.")
    (license license:expat)))

;; ═══════════════════════════════════════════════════════════════════
;; 6. claude-code-seccomp — seccomp filter for Claude Code sandbox
;; ═══════════════════════════════════════════════════════════════════

(define-public claude-code-seccomp
  (let ((commit "4fad8fa35db3f09958db1df401b30bd00402b611"))
    (package
      (name "claude-code-seccomp")
      (version "0.0.35")
      (source (origin
                (method url-fetch)
                (uri (string-append
                      "https://raw.githubusercontent.com/"
                      "anthropic-experimental/sandbox-runtime/"
                      commit "/vendor/seccomp/x64/apply-seccomp"))
                (sha256
                 (base32 "1zcq1gc1p9nqyda8g9fi3xrfxapqy3j238sxhg4xprwp6yv4c0z7"))))
      (build-system copy-build-system)
      (arguments
       (list #:install-plan
             #~`(("apply-seccomp" "lib/claude-code-seccomp/apply-seccomp"))
             #:phases
             #~(modify-phases %standard-phases
                 (add-after 'install 'set-executable
                   (lambda* (#:key outputs #:allow-other-keys)
                     (let ((lib (string-append (assoc-ref outputs "out")
                                               "/lib/claude-code-seccomp")))
                       (chmod (string-append lib "/apply-seccomp") #o755)))))))
      (supported-systems '("x86_64-linux"))
      (home-page "https://github.com/anthropic-experimental/sandbox-runtime")
      (synopsis "seccomp filter for Claude Code sandbox mode")
      (description
       "Claude-code-seccomp provides the @code{apply-seccomp} binary and
@code{unix-block.bpf} filter used by Claude Code's @code{/sandbox} feature
to restrict system calls in sandboxed shell sessions.")
      (license license:asl2.0))))

;; ═══════════════════════════════════════════════════════════════════
;; 7. ferris-scan-bin — Rust-based file scanner TUI
;; ═══════════════════════════════════════════════════════════════════

(define-public ferris-scan-bin
  (package
    (name "ferris-scan-bin")
    (version "0.25")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Vnilabean/ferris-scan/releases/download/v"
                    version "/ferris-scan-tui-v" version "-linux"))
              (sha256
               (base32 "1a2sb0w04a3qnxdbjg7nf74zab949wpsj5yfgbx5v9yfgws8fbq4"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~`((,(string-append "ferris-scan-tui-v" #$version "-linux")
                "bin/ferris-scan"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'set-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/ferris-scan")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Vnilabean/ferris-scan")
    (synopsis "lightweight terminal-based file scanner")
    (description
     "Ferris Scan is a lightweight, Rust-based TUI file scanner.  It
provides fast file searching with an interactive terminal interface,
supporting both TUI and GUI modes for locating files across
directories.")
    (license license:expat)))

;; ═══════════════════════════════════════════════════════════════════
;; 8. wo-bin — workspace shell manager
;; ═══════════════════════════════════════════════════════════════════

(define-public wo-bin
  (package
    (name "wo-bin")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/antham/wo/releases/download/"
                    version "/wo_" version "_linux_amd64.tar.gz"))
              (sha256
               (base32 "1p2ny73avwylp1vg1syfrqi2mx2a5xqv1n2v2pp4g835xgr0igy9"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~`(("wo" "bin/wo"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'set-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/wo")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/antham/wo")
    (synopsis "workspace shell manager for project directories")
    (description
     "Wo is a workspace shell manager that helps organize project
directories.  It provides commands for quickly navigating between
workspaces and launching shells pre-configured for each project
environment.")
    (license license:expat)))

;; ═══════════════════════════════════════════════════════════════════
;; 9. oken-bin — smarter SSH CLI with fuzzy host picker
;; ═══════════════════════════════════════════════════════════════════

(define-public oken-bin
  (package
    (name "oken-bin")
    (version "0.3.8")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/linkwithjoydeep/oken/releases/download/v"
                    version "/oken-x86_64-unknown-linux-gnu.tar.xz"))
              (sha256
               (base32 "0dljijbx2n9514rbfwgxl0s4p0n1kbwp4pdi85kzl3zpg5lk3djc"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~`(("oken" "bin/oken"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'set-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/oken")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/linkwithjoydeep/oken")
    (synopsis "SSH CLI with host management and fuzzy picker")
    (description
     "Oken is a smarter SSH command-line tool with built-in host
management and a fuzzy picker.  It lets you quickly search, select,
and connect to SSH hosts without manually editing config files.")
    (license license:expat)))

;; ═══════════════════════════════════════════════════════════════════
;; 10. lazytail-bin — terminal log viewer with live filtering
;; ═══════════════════════════════════════════════════════════════════

(define-public lazytail-bin
  (package
    (name "lazytail-bin")
    (version "0.9.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/raaymax/lazytail/releases/download/v"
                    version "/lazytail-linux-x86_64.tar.gz"))
              (sha256
               (base32 "1fycd87x4idp7va9j7fxldkmqm1c20v3qxymk3j4x85061006lmn"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~`(("lazytail" "bin/lazytail"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'set-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/lazytail")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/raaymax/lazytail")
    (synopsis "terminal log viewer with live filtering and follow mode")
    (description
     "Lazytail is a fast, universal terminal-based log viewer with live
filtering and follow mode.  It supports tailing multiple log files
simultaneously, regex-based filtering, and an interactive TUI for
exploring log output.")
    (license license:expat)))

;; ═══════════════════════════════════════════════════════════════════
;; 11. funzzy-bin — lightweight file watcher
;; ═══════════════════════════════════════════════════════════════════

(define-public funzzy-bin
  (package
    (name "funzzy-bin")
    (version "1.5.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/cristianoliveira/funzzy/releases/download/v"
                    version "/funzzy-v" version
                    "-x86_64-unknown-linux-gnu.tar.gz"))
              (sha256
               (base32 "1fd6f3j40f33wk4d7wymaia08gi7hax59dif4zda7h5qchpf9z3g"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~`(("funzzy" "bin/funzzy"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'set-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/funzzy")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/cristianoliveira/funzzy")
    (synopsis "lightweight configurable file watcher")
    (description
     "Funzzy is a lightweight, configurable file watcher.  It monitors
file system changes and runs user-defined commands when modifications
are detected, using a simple YAML configuration file for defining
watch rules.")
    (license license:expat)))

;; ═══════════════════════════════════════════════════════════════════
;; 12. mezzotone-bin — image-to-ASCII/Unicode art converter
;; ═══════════════════════════════════════════════════════════════════

(define-public mezzotone-bin
  (package
    (name "mezzotone-bin")
    (version "1.1.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/joaoheitorgarcia/Mezzotone/"
                    "releases/download/v" version "/app-linux-amd64"))
              (sha256
               (base32 "0gb1ivviybc7zbailqsbmyw3dx80jizkqkzmhypr05r2rdy3fqy9"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~`(("app-linux-amd64" "bin/mezzotone"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'set-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/mezzotone")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/joaoheitorgarcia/Mezzotone")
    (synopsis "convert images and GIFs to ASCII or Unicode art")
    (description
     "Mezzotone is a TUI application that converts images and GIFs
into ASCII or Unicode art.  It renders graphics directly in the
terminal using customizable character sets and supports animated
GIF playback.")
    (license license:expat)))

;; ═══════════════════════════════════════════════════════════════════
;; 13. lobster — terminal movie/series streaming script
;; ═══════════════════════════════════════════════════════════════════

(define-public lobster
  (package
    (name "lobster")
    (version "4.6.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/justchokingaround/lobster/archive/"
                    "refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "12rizglhm1snlmwnh6cdp492f178kqmyamw8qm6rw8j4c6jk6ff8"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~`(("lobster.sh" "bin/lobster"))))
    (inputs (list bash))
    (home-page "https://github.com/justchokingaround/lobster")
    (synopsis "shell script to stream movies and series from the terminal")
    (description
     "Lobster is a POSIX shell script that lets you browse and stream
movies, web series, and TV shows directly from the terminal.  It uses
fzf for interactive selection and mpv for playback, with support for
multiple streaming providers.")
    (license license:gpl2)))

;; ═══════════════════════════════════════════════════════════════════
;; 14. python-aiohttp-jinja2 — Jinja2 template renderer for aiohttp
;; ═══════════════════════════════════════════════════════════════════

(define-public python-aiohttp-jinja2
  (package
    (name "python-aiohttp-jinja2")
    (version "1.6")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "aiohttp-jinja2" version))
              (sha256
               (base32 "1qmh37k5p4f0nq2qshqd4faj9dv10zyvniz5i8pabg75ci9gz9x3"))))
    (build-system python-build-system)
    (propagated-inputs (list python-aiohttp python-jinja2))
    (arguments
     (list #:tests? #f))  ;; tests require network and aiohttp test fixtures
    (home-page "https://github.com/aio-libs/aiohttp-jinja2")
    (synopsis "Jinja2 template renderer for aiohttp.web")
    (description
     "Aiohttp-jinja2 adds Jinja2 template rendering support to
aiohttp.web applications.  It provides decorators and helpers for
rendering templates in request handlers, with support for template
inheritance, context processors, and asynchronous rendering.")
    (license license:asl2.0)))
