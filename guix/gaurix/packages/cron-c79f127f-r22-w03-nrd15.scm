;;; Round-22 worker-03 NEEDS_RECIPE_DESIGN resolution pass #15.
;;; 12 new recipes: 3 C/Make source packages (ninvaders, cvbasic, nvimpager),
;;; 6 binary packages (gitarbor-bin, restman-bin, jsongrep-bin, oxicord-bin,
;;; cpx-copy-bin, reflector-rs-bin),
;;; 2 binary-with-assets packages (sudoku-simple, alacritty-use-theme-with-redshift),
;;; 1 compat alias (mingw-w64-libmicrohttpd).
;;; 18 re-blocked with specific reasons.

(define-module (gaurix packages cron-c79f127f-r22-w03-nrd15)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system copy)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages ncurses)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages vim)
  #:use-module (gnu packages web)
  #:use-module (gnu packages gnunet)
  #:export (ninvaders
            cvbasic
            nvimpager
            gitarbor-bin
            restman-bin
            jsongrep-bin
            oxicord-bin
            sudoku-simple
            cpx-copy-bin
            reflector-rs-bin
            alacritty-use-theme-with-redshift
            mingw-w64-libmicrohttpd))

;; ═══════════════════════════════════════════════════════════════════
;; 1. ninvaders — ncurses space invaders clone
;; ═══════════════════════════════════════════════════════════════════

(define-public ninvaders
  (package
    (name "ninvaders")
    (version "0.1.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "http://downloads.sourceforge.net/sourceforge/ninvaders/"
                    "ninvaders-" version ".tar.gz"))
              (sha256
               (base32 "02yk3yv11lsrawbm027dwnz4k4c5i2n8sa7dgxgczn84hwvmrg5z"))))
    (build-system gnu-build-system)
    (inputs (list ncurses))
    (arguments
     (list #:tests? #f  ;; no test suite
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)  ;; no configure script
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((bin (string-append (assoc-ref outputs "out") "/bin")))
                     (mkdir-p bin)
                     (install-file "nInvaders" bin)))))))
    (home-page "http://ninvaders.sourceforge.net/")
    (synopsis "Terminal-based space invaders clone using ncurses")
    (description
     "nInvaders is a Space Invaders clone for the terminal, rendered
using ncurses.  Guide your ship and shoot the aliens before they reach
the bottom of the screen.")
    (license license:gpl2+)))

;; ═══════════════════════════════════════════════════════════════════
;; 2. cvbasic — BASIC cross-compiler for retro consoles
;; ═══════════════════════════════════════════════════════════════════

(define-public cvbasic
  (package
    (name "cvbasic")
    (version "0.9.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nanochess/CVBasic/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32 "0nzr118x8rbi1an0c36jd7pjjp52s4zb9fgs9m98an8rxw1lwbis"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f  ;; tests need assembled ROM comparison
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)  ;; no configure script
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((bin (string-append (assoc-ref outputs "out") "/bin")))
                     (mkdir-p bin)
                     (install-file "cvbasic" bin)))))))
    (home-page "https://nanochess.org/cvbasic.html")
    (synopsis "BASIC cross-compiler for ColecoVision, MSX, and other retro consoles")
    (description
     "CVBasic is a BASIC cross-compiler targeting ColecoVision, MSX,
SG-1000, Sega Master System, NES, and TI-99/4A game consoles.  It
compiles a subset of BASIC to Z80 or 6502 assembly.")
    (license license:bsd-2)))

;; ═══════════════════════════════════════════════════════════════════
;; 3. nvimpager — use neovim as a pager
;; ═══════════════════════════════════════════════════════════════════

(define-public nvimpager
  (package
    (name "nvimpager")
    (version "0.13.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/lucc/nvimpager/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32 "0haja8z32zvfxx0gc4ja1lc62zyv4w6djwymvwscn4xjjybc6mc2"))))
    (build-system gnu-build-system)
    (inputs (list bash-minimal neovim))
    (arguments
     (list #:tests? #f  ;; needs busted test framework
           #:make-flags
           #~(list (string-append "PREFIX=" #$output))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)  ;; no configure script
               (replace 'build
                 (lambda _
                   ;; The Makefile generates nvimpager.configured via sed;
                   ;; we just need the install target which does that.
                   #t))
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin"))
                          (runtime (string-append out "/share/nvimpager/runtime/lua/nvimpager"))
                          (zsh (string-append out "/share/zsh/site-functions")))
                     (mkdir-p bin)
                     (mkdir-p runtime)
                     (mkdir-p zsh)
                     ;; Install nvimpager script with runtime path set
                     (let ((script (string-append bin "/nvimpager")))
                       (copy-file "nvimpager" script)
                       (substitute* script
                         (("^RUNTIME=.*$")
                          (string-append "RUNTIME='" out "/share/nvimpager/runtime'\n"))
                         (("^version=.*$")
                          (string-append "version=" #$version "\n")))
                       (chmod script #o755))
                     ;; Install lua modules
                     (for-each (lambda (f)
                                 (install-file f runtime))
                               (find-files "lua/nvimpager" "\\.lua$"))
                     ;; Install zsh completion
                     (install-file "_nvimpager" zsh)))))))
    (home-page "https://github.com/lucc/nvimpager")
    (synopsis "Use neovim as a pager with syntax highlighting")
    (description
     "Nvimpager uses neovim to display files and command output in
the terminal with full syntax highlighting.  It can replace @code{less}
or @code{cat} while providing rich highlighting via neovim's built-in
filetype detection.")
    (license license:bsd-2)))

;; ═══════════════════════════════════════════════════════════════════
;; 4. gitarbor-bin — TUI for browsing git branches
;; ═══════════════════════════════════════════════════════════════════

(define-public gitarbor-bin
  (package
    (name "gitarbor-bin")
    (version "0.0.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/cadamsdev/gitarbor-tui/releases/download/v"
                    version "/gitarbor-linux-x64.tar.gz"))
              (sha256
               (base32 "1alb4fg7y7v8ldiv57w6y9mgqv3si2fvd3b5ffihpmmb3vg4mbid"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~`(("gitarbor" "bin/gitarbor"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'chmod-binary
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/gitarbor")
                          #o755))))))
    (home-page "https://github.com/cadamsdev/gitarbor-tui")
    (synopsis "TUI for browsing and managing git branches")
    (description
     "Gitarbor is a terminal user interface for browsing, filtering,
and switching between git branches.  Pre-built binary for x86_64 Linux.")
    (license license:expat)))

;; ═══════════════════════════════════════════════════════════════════
;; 5. restman-bin — REST API client TUI
;; ═══════════════════════════════════════════════════════════════════

(define-public restman-bin
  (package
    (name "restman-bin")
    (version "0.0.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/cadamsdev/restman/releases/download/v"
                    version "/restman-linux-x64.tar.gz"))
              (sha256
               (base32 "16wp8xqssh9348f58vwdgc34dwi2jkv8rcsrcgmn6ar4jy3vq0dv"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~`(("restman" "bin/restman"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'chmod-binary
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/restman")
                          #o755))))))
    (home-page "https://github.com/cadamsdev/restman")
    (synopsis "Terminal REST API client for testing endpoints")
    (description
     "Restman is a terminal user interface for making HTTP requests
and testing REST APIs.  Pre-built binary for x86_64 Linux.")
    (license license:expat)))

;; ═══════════════════════════════════════════════════════════════════
;; 6. jsongrep-bin — JSON search tool (jg)
;; ═══════════════════════════════════════════════════════════════════

(define-public jsongrep-bin
  (package
    (name "jsongrep-bin")
    (version "0.7.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/micahkepe/jsongrep/releases/download/v"
                    version "/jsongrep-" version
                    "-x86_64-unknown-linux-musl.tar.gz"))
              (sha256
               (base32 "1a5wid98nphdqx7f5mh002vakgsmd02kxxjj6a41sx8z1fvj8n1q"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~`(("jg" "bin/jg")
               ("man/" "share/man/man1/" #:include-regexp (".*\\.1$"))
               ("completions/jg.bash"
                "share/bash-completion/completions/jg")
               ("completions/jg.zsh"
                "share/zsh/site-functions/_jg")
               ("completions/jg.fish"
                "share/fish/vendor_completions.d/jg.fish"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'chmod-binary
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/jg")
                          #o755))))))
    (home-page "https://github.com/micahkepe/jsongrep")
    (synopsis "JSON search and filter tool inspired by grep")
    (description
     "Jsongrep (jg) searches and filters JSON data using patterns,
similar to how grep works for text.  Includes shell completions and
man pages.  Statically linked musl binary for x86_64 Linux.")
    (license license:expat)))

;; ═══════════════════════════════════════════════════════════════════
;; 7. oxicord-bin — Discord TUI client
;; ═══════════════════════════════════════════════════════════════════

(define-public oxicord-bin
  (package
    (name "oxicord-bin")
    (version "0.1.9")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/linuxmobile/oxicord/releases/download/v"
                    version "/oxicord-x86_64-unknown-linux-gnu"))
              (sha256
               (base32 "1bxc5392sjrza34z47vgm1bxaqh1vbvny6fz9s8dlbp21mx8cd3d"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~`(("oxicord-x86_64-unknown-linux-gnu" "bin/oxicord"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'chmod-binary
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/oxicord")
                          #o755))))))
    (home-page "https://github.com/linuxmobile/oxicord")
    (synopsis "Terminal user interface client for Discord")
    (description
     "Oxicord is a TUI client for Discord built in Rust.  Pre-built
binary for x86_64 Linux.")
    (license license:expat)))

;; ═══════════════════════════════════════════════════════════════════
;; 8. sudoku-simple — minimal sudoku game with GUI
;; ═══════════════════════════════════════════════════════════════════

(define-public sudoku-simple
  (package
    (name "sudoku-simple")
    (version "1.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/uwiwiow/sudoku-simple/releases/download/"
                    version "/sudoku-simple-" version "-x86_64.tar.gz"))
              (sha256
               (base32 "17p9j3kiqr987w82bwjbrsi6s1hwnddpadz08syddkdjr3lbdka1"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~`(("Sudoku-simple/sudoku-simple" "bin/sudoku-simple")
               ("Sudoku-simple/assets" "share/sudoku-simple/assets"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'chmod-binary
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/sudoku-simple")
                          #o755))))))
    (home-page "https://github.com/uwiwiow/sudoku-simple")
    (synopsis "Minimal sudoku puzzle game")
    (description
     "Sudoku-simple is a clean, minimal sudoku puzzle game with a
graphical interface.  Pre-built binary with bundled assets for x86_64
Linux.")
    (license license:expat)))

;; ═══════════════════════════════════════════════════════════════════
;; 9. cpx-copy-bin — fast file copy tool
;; ═══════════════════════════════════════════════════════════════════

(define-public cpx-copy-bin
  (package
    (name "cpx-copy-bin")
    (version "0.1.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/11happy/cpx/releases/download/v"
                    version "/cpx-linux-x86_64-musl.tar.gz"))
              (sha256
               (base32 "1h9mzx1sfbd2gfwv421j5bc2mvx941d7dpzzvqc43ia0clqahypr"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~`(("cpx" "bin/cpx"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'chmod-binary
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/cpx")
                          #o755))))))
    (home-page "https://github.com/11happy/cpx")
    (synopsis "Fast file and directory copy tool written in Rust")
    (description
     "Cpx is a fast file and directory copy tool built in Rust with
progress indicators and parallel copying support.  Statically linked
musl binary for x86_64 Linux.")
    (license license:expat)))

;; ═══════════════════════════════════════════════════════════════════
;; 10. reflector-rs-bin — Arch Linux mirror list manager in Rust
;; ═══════════════════════════════════════════════════════════════════

(define-public reflector-rs-bin
  (package
    (name "reflector-rs-bin")
    (version "1.1.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/james7132/reflector-rs/releases/download/v"
                    version "/reflector-rs-v" version
                    "-x86_64-unknown-linux-gnu.tar.xz"))
              (sha256
               (base32 "19m0qz1pk2bhp5krf5ga3bfdfqi1blkivqbgqbdcgpxm9ml525w7"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~`(("reflector" "bin/reflector-rs")
               ("man/reflector.1.gz" "share/man/man1/reflector-rs.1.gz")
               ("reflector.conf" "etc/reflector-rs/reflector.conf"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'chmod-binary
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/reflector-rs")
                          #o755))))))
    (home-page "https://github.com/james7132/reflector-rs")
    (synopsis "Arch Linux mirror list manager written in Rust")
    (description
     "Reflector-rs retrieves, filters, and sorts the latest Arch
Linux mirror list.  It is a Rust reimplementation of the Python
reflector tool.  Pre-built binary for x86_64 Linux.")
    (license license:gpl2+)))

;; ═══════════════════════════════════════════════════════════════════
;; 11. alacritty-use-theme-with-redshift — redshift-based theme switcher
;; ═══════════════════════════════════════════════════════════════════

(define-public alacritty-use-theme-with-redshift
  (package
    (name "alacritty-use-theme-with-redshift")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/alacritty-use-theme/"
                    "alacritty-use-theme-with-redshift/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32 "18db26j54pmhn1wnsv6369vmk8x0k71jhjd545im26lsz4c4wk8q"))))
    (build-system copy-build-system)
    (inputs (list bash-minimal))
    (arguments
     (list #:install-plan
           #~`(("app/home/local/share/theme-switcher/" "share/theme-switcher/")
               ("app/home/config/theme-switcher/" "etc/theme-switcher/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'chmod-scripts
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((share (string-append (assoc-ref outputs "out")
                                               "/share/theme-switcher")))
                     (for-each (lambda (f) (chmod f #o755))
                               (find-files share "\\.sh$"))))))))
    (home-page "https://github.com/alacritty-use-theme/alacritty-use-theme-with-redshift")
    (synopsis "Automatic Alacritty theme switching based on redshift")
    (description
     "Alacritty-use-theme-with-redshift provides shell scripts and
configuration for automatically switching Alacritty terminal themes
based on the time of day using redshift's brightness hooks.")
    (license license:gpl1+)))

;; ═══════════════════════════════════════════════════════════════════
;; 12. mingw-w64-libmicrohttpd — compat alias for libmicrohttpd
;; ═══════════════════════════════════════════════════════════════════

(define-public mingw-w64-libmicrohttpd
  (package
    (inherit libmicrohttpd)
    (name "mingw-w64-libmicrohttpd")))
