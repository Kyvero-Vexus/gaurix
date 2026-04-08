;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2026 Gaurix contributors
;;;
;;; Recipe resolver pass — recipe-resolver-260407n
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages:
;;;   CLI tools, TUI applications, and developer utilities distributed
;;;   as pre-built binaries (Go, Rust, C) from GitHub releases and
;;;   distribution packages (.deb).
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Run `guix download <url>` to obtain real hashes before building.

(define-module (gaurix packages recipe-resolver-260407n)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system trivial)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages video)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages kerberos)
  #:export (torrserver-bin
            ov-bin
            tgcp-bin
            tredis-bin
            rjq-bin
            superdb-bin
            pomo-bin
            sq-bin
            plenti-bin
            code-minimap-bin
            terraformer-bin
            kubeshark-bin
            git-brunch-bin
            memtui-bin
            goplaying-bin
            lazyactions-bin
            mmdr-bin
            goful-bin
            tsql-bin
            go-prism-bin
            r-quick-share-bin
            stash-bin
            crush-bin
            mongodb-tools-bin
            open-tv-bin
            querycat-bin
            mods-bin
            zvm-bin
            kyanos-bin
            crab-bin))

;;;
;;; ── 1. torrserver-bin ──────────────────────────────────────────────────
;;; Torrent-to-HTTP streaming server (Go binary)
;;;
(define-public torrserver-bin
  (package
    (name "torrserver-bin")
    (version "141")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/YouROK/TorrServer/releases/download/MatriX."
             version "/TorrServer-linux-amd64"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (bin (string-append out "/bin"))
                 (src (assoc-ref %build-inputs "source")))
            (mkdir-p bin)
            (copy-file src (string-append bin "/torrserver"))
            (chmod (string-append bin "/torrserver") #o755)
            #t))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/YouROK/TorrServer")
    (synopsis "torrent to HTTP streaming server")
    (description
     "TorrServer streams media from torrent files as HTTP media streams
without fully downloading the content.  It acts as a bridge between
torrent sources and media players.")
    (license license:gpl3)))

;;;
;;; ── 2. ov-bin ──────────────────────────────────────────────────────────
;;; Feature-rich terminal pager (Go binary)
;;;
(define-public ov-bin
  (package
    (name "ov-bin")
    (version "0.51.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/noborus/ov/releases/download/v"
             version "/ov_" version "_linux_amd64.zip"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("ov" "bin/ov"))))
    (native-inputs (list unzip))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/noborus/ov")
    (synopsis "feature-rich terminal-based text pager")
    (description
     "Ov is a feature-rich terminal-based text viewer and pager.  It
supports syntax highlighting, regular expression search, and multiple
document viewing in a single terminal session.")
    (license license:expat)))

;;;
;;; ── 3. tgcp-bin ────────────────────────────────────────────────────────
;;; Terminal GCP resource viewer (Rust binary)
;;;
(define-public tgcp-bin
  (package
    (name "tgcp-bin")
    (version "1.0.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/huseyinbabal/tgcp/releases/download/v"
             version "/tgcp-x86_64-unknown-linux-musl.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("tgcp" "bin/tgcp"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/huseyinbabal/tgcp")
    (synopsis "terminal-based GCP resource viewer and manager")
    (description
     "Tgcp is a terminal-based Google Cloud Platform resource viewer and
manager.  It provides a TUI interface for browsing and managing GCP
resources directly from the command line.")
    (license license:expat)))

;;;
;;; ── 4. tredis-bin ──────────────────────────────────────────────────────
;;; Terminal Redis client (Rust binary)
;;;
(define-public tredis-bin
  (package
    (name "tredis-bin")
    (version "1.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/huseyinbabal/tredis/releases/download/v"
             version "/tredis-x86_64-unknown-linux-musl.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("tredis" "bin/tredis"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/huseyinbabal/tredis")
    (synopsis "terminal-based Redis data viewer and manager")
    (description
     "Tredis is a terminal-based Redis data viewer and manager.  It provides
a TUI interface for browsing keys, viewing values, and managing Redis
databases interactively.")
    (license license:expat)))

;;;
;;; ── 5. rjq-bin ─────────────────────────────────────────────────────────
;;; Fast JSON filtering tool (Rust binary)
;;;
(define-public rjq-bin
  (package
    (name "rjq-bin")
    (version "0.1.13")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/mainak55512/rjq/releases/download/v"
             version "/rjq_linux_x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("rjq" "bin/rjq"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/mainak55512/rjq")
    (synopsis "simple and fast JSON filtering tool")
    (description
     "Rjq is a simple and fast JSON filtering tool written in Rust.  It
provides a lightweight alternative for querying and filtering JSON
data from the command line.")
    (license license:expat)))

;;;
;;; ── 6. superdb-bin ─────────────────────────────────────────────────────
;;; Analytics database for JSON and relational data (Go binary)
;;;
(define-public superdb-bin
  (package
    (name "superdb-bin")
    (version "0.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/brimdata/super/releases/download/v"
             version "/super-v" version ".linux-amd64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("super" "bin/super"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/brimdata/super")
    (synopsis "analytics database for JSON and relational data")
    (description
     "Super is an analytics database that puts JSON and relational tables
on equal footing.  It provides a unified query language for processing
structured and semi-structured data.")
    (license license:bsd-3)))

;;;
;;; ── 7. pomo-bin ────────────────────────────────────────────────────────
;;; TUI Pomodoro timer (Go binary)
;;;
(define-public pomo-bin
  (package
    (name "pomo-bin")
    (version "1.0.5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/Bahaaio/pomo/releases/download/v"
             version "/pomo_Linux_x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("pomo" "bin/pomo"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Bahaaio/pomo")
    (synopsis "customizable TUI Pomodoro timer with ASCII art")
    (description
     "Pomo is a customizable TUI Pomodoro timer with ASCII art display,
progress bar, and desktop notifications.  It helps manage focused work
sessions using the Pomodoro technique.")
    (license license:expat)))

;;;
;;; ── 8. sq-bin ──────────────────────────────────────────────────────────
;;; Data wrangler for databases and files (Go binary)
;;;
(define-public sq-bin
  (package
    (name "sq-bin")
    (version "0.50.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/neilotoole/sq/releases/download/v"
             version "/sq-" version "-linux-amd64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("sq" "bin/sq"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://sq.io")
    (synopsis "data wrangler for databases and structured files")
    (description
     "Sq is a data wrangler that provides a unified interface for querying
databases and structured data files such as CSV, JSON, and Excel.  It
supports multiple database backends including PostgreSQL, MySQL, and
SQLite.")
    (license license:expat)))

;;;
;;; ── 9. plenti-bin ──────────────────────────────────────────────────────
;;; Static site generator with Go backend (Go binary)
;;;
(define-public plenti-bin
  (package
    (name "plenti-bin")
    (version "0.7.25")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/plentico/plenti/releases/download/v"
             version "/plenti_" version "_Linux_64-bit.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("plenti" "bin/plenti"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/plentico/plenti")
    (synopsis "static site generator with Go backend and Svelte frontend")
    (description
     "Plenti is a static site generator that uses Go for the backend and
Svelte for the frontend.  It provides a fast development workflow with
hot reloading and an integrated build system.")
    (license license:asl2.0)))

;;;
;;; ── 10. code-minimap-bin ───────────────────────────────────────────────
;;; High-performance code minimap renderer (Rust binary)
;;;
(define-public code-minimap-bin
  (package
    (name "code-minimap-bin")
    (version "0.6.8")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/wfxr/code-minimap/releases/download/v"
             version "/code-minimap-v" version
             "-x86_64-unknown-linux-gnu.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("code-minimap" "bin/code-minimap"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/wfxr/code-minimap")
    (synopsis "high-performance code minimap renderer for the terminal")
    (description
     "Code-minimap is a high-performance code minimap renderer for the
terminal.  It generates compact visual overviews of source code files,
similar to the minimap feature in modern code editors.")
    (license license:expat)))

;;;
;;; ── 11. terraformer-bin ────────────────────────────────────────────────
;;; Reverse Terraform from existing infrastructure (Go binary)
;;;
(define-public terraformer-bin
  (package
    (name "terraformer-bin")
    (version "0.8.24")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/GoogleCloudPlatform/terraformer"
             "/releases/download/" version
             "/terraformer-all-linux-amd64"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (bin (string-append out "/bin"))
                 (src (assoc-ref %build-inputs "source")))
            (mkdir-p bin)
            (copy-file src (string-append bin "/terraformer"))
            (chmod (string-append bin "/terraformer") #o755)
            #t))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/GoogleCloudPlatform/terraformer")
    (synopsis "generate Terraform files from existing infrastructure")
    (description
     "Terraformer is a CLI tool that generates Terraform files from existing
cloud infrastructure.  It supports multiple cloud providers and enables
importing existing resources into Terraform management.")
    (license license:asl2.0)))

;;;
;;; ── 12. kubeshark-bin ──────────────────────────────────────────────────
;;; API traffic analyzer for Kubernetes (Go binary)
;;;
(define-public kubeshark-bin
  (package
    (name "kubeshark-bin")
    (version "52.3.62")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/kubeshark/kubeshark/releases/download/v"
             version "/kubeshark_linux_amd64"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (bin (string-append out "/bin"))
                 (src (assoc-ref %build-inputs "source")))
            (mkdir-p bin)
            (copy-file src (string-append bin "/kubeshark"))
            (chmod (string-append bin "/kubeshark") #o755)
            #t))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/kubeshark/kubeshark")
    (synopsis "API traffic analyzer for Kubernetes")
    (description
     "Kubeshark is an API traffic analyzer for Kubernetes.  It captures
and displays real-time API traffic between microservices, providing
visibility into service-to-service communication.")
    (license license:asl2.0)))

;;;
;;; ── 13. git-brunch-bin ─────────────────────────────────────────────────
;;; Git branch management TUI (Haskell binary)
;;;
(define-public git-brunch-bin
  (package
    (name "git-brunch-bin")
    (version "1.8.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/andys8/git-brunch/releases/download/v"
             version "/git-brunch-Linux"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (bin (string-append out "/bin"))
                 (src (assoc-ref %build-inputs "source")))
            (mkdir-p bin)
            (copy-file src (string-append bin "/git-brunch"))
            (chmod (string-append bin "/git-brunch") #o755)
            #t))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/andys8/git-brunch")
    (synopsis "git command-line tool to work with branches")
    (description
     "Git-brunch is a command-line tool that provides an interactive TUI
for working with git branches.  It allows quick switching, creating,
and deleting branches with a keyboard-driven interface.")
    (license license:bsd-3)))

;;;
;;; ── 14. memtui-bin ─────────────────────────────────────────────────────
;;; TUI client for Memcached (Go binary)
;;;
(define-public memtui-bin
  (package
    (name "memtui-bin")
    (version "0.0.6")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/nnnkkk7/memtui/releases/download/v"
             version "/memtui_" version "_Linux_x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("memtui" "bin/memtui"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nnnkkk7/memtui")
    (synopsis "modern TUI client for Memcached")
    (description
     "Memtui is a modern TUI client for Memcached with tree-structured key
navigation, smart JSON and binary formatting, and Vim keybindings.  It
provides an interactive interface for browsing and managing cached data.")
    (license license:expat)))

;;;
;;; ── 15. goplaying-bin ──────────────────────────────────────────────────
;;; Now Playing TUI (Go binary)
;;;
(define-public goplaying-bin
  (package
    (name "goplaying-bin")
    (version "0.3.6")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/justinmdickey/goplaying/releases/download/v"
             version "/goplaying_" version "_Linux_x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("goplaying" "bin/goplaying"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/justinmdickey/goplaying")
    (synopsis "now-playing TUI written in Go")
    (description
     "Goplaying is a terminal user interface that displays currently playing
media information.  It integrates with media players via playerctl to
show track metadata in a visually appealing format.")
    (license license:expat)))

;;;
;;; ── 16. lazyactions-bin ────────────────────────────────────────────────
;;; GitHub Actions TUI (Go binary)
;;;
(define-public lazyactions-bin
  (package
    (name "lazyactions-bin")
    (version "0.0.13")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/nnnkkk7/lazyactions/releases/download/v"
             version "/lazyactions_" version "_Linux_x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("lazyactions" "bin/lazyactions"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nnnkkk7/lazyactions")
    (synopsis "lazygit-style TUI for GitHub Actions")
    (description
     "Lazyactions is a lazygit-style TUI for GitHub Actions.  It provides
a terminal interface for monitoring, triggering, and managing GitHub
Actions workflows directly from the command line.")
    (license license:expat)))

;;;
;;; ── 17. mmdr-bin ───────────────────────────────────────────────────────
;;; Fast Mermaid diagram renderer (Rust binary)
;;;
(define-public mmdr-bin
  (package
    (name "mmdr-bin")
    (version "0.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/1jehuang/mermaid-rs-renderer"
             "/releases/download/v" version
             "/mmdr-x86_64-unknown-linux-gnu.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("mmdr" "bin/mmdr"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/1jehuang/mermaid-rs-renderer")
    (synopsis "fast Mermaid diagram renderer in pure Rust")
    (description
     "Mmdr is a fast Mermaid diagram renderer written in pure Rust.  It
supports 23 diagram types and is 100 to 1400 times faster than the
standard mermaid-cli Node.js renderer.")
    (license license:expat)))

;;;
;;; ── 18. goful-bin ──────────────────────────────────────────────────────
;;; CUI file manager (Go binary)
;;;
(define-public goful-bin
  (package
    (name "goful-bin")
    (version "1.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/fareedst/goful/releases/download/v"
             version "/goful_linux_amd64"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (bin (string-append out "/bin"))
                 (src (assoc-ref %build-inputs "source")))
            (mkdir-p bin)
            (copy-file src (string-append bin "/goful"))
            (chmod (string-append bin "/goful") #o755)
            #t))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/fareedst/goful")
    (synopsis "CUI file manager written in Go")
    (description
     "Goful is a CUI file manager written in Go.  It provides a dual-pane
interface for navigating and managing files with keyboard shortcuts,
bulk operations, and a command-line shell integration.")
    (license license:expat)))

;;;
;;; ── 19. tsql-bin ───────────────────────────────────────────────────────
;;; Modern PostgreSQL manager TUI (Rust binary)
;;;
(define-public tsql-bin
  (package
    (name "tsql-bin")
    (version "0.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/fcoury/tsql/releases/download/v"
             version "/tsql-x86_64-unknown-linux-gnu.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("tsql" "bin/tsql"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/fcoury/tsql")
    (synopsis "modern PostgreSQL manager TUI")
    (description
     "Tsql is a modern PostgreSQL manager with a terminal user interface.
It provides an interactive way to browse databases, execute queries,
and manage PostgreSQL instances from the command line.")
    (license license:expat)))

;;;
;;; ── 20. go-prism-bin ───────────────────────────────────────────────────
;;; Test output visualizer (Go binary)
;;;
(define-public go-prism-bin
  (package
    (name "go-prism-bin")
    (version "1.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/DaltonSW/prism/releases/download/v"
             version "/prism_Linux_x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("prism" "bin/go-prism"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/DaltonSW/prism")
    (synopsis "turn raw test output into formatted data")
    (description
     "Prism transforms raw test output into beautifully formatted and
structured data.  It parses test results from various frameworks and
presents them in a clear, readable format.")
    (license license:expat)))

;;;
;;; ── 21. r-quick-share-bin ──────────────────────────────────────────────
;;; Quick Share for Linux (Rust/Tauri binary via .deb)
;;;
(define-public r-quick-share-bin
  (package
    (name "r-quick-share-bin")
    (version "0.11.5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/Martichou/rquickshare/releases/download/v"
             version "/r-quick-share-main_v" version
             "_glibc-2.39_amd64.deb"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (ar  (search-input-file %build-inputs "bin/ar"))
                 (tar (search-input-file %build-inputs "bin/tar"))
                 (xz  (search-input-file %build-inputs "bin/xz")))
            (setenv "PATH"
                    (string-append (dirname ar) ":"
                                   (dirname tar) ":"
                                   (dirname xz)))
            (invoke ar "x" src)
            (invoke tar "xf" "data.tar.gz")
            (copy-recursively "usr" out)
            #t))))
    (native-inputs (list binutils tar xz))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Martichou/rquickshare")
    (synopsis "Quick Share from Android for Linux")
    (description
     "R-quick-share is a Rust implementation of NearbyShare/QuickShare from
Android for Linux.  It enables file sharing between Android devices and
Linux desktops using the Quick Share protocol.")
    (license license:gpl3+)))

;;;
;;; ── 22. stash-bin ──────────────────────────────────────────────────────
;;; Media organizer (Go binary)
;;;
(define-public stash-bin
  (package
    (name "stash-bin")
    (version "0.31.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/stashapp/stash/releases/download/v"
             version "/stash-linux"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (bin (string-append out "/bin"))
                 (src (assoc-ref %build-inputs "source")))
            (mkdir-p bin)
            (copy-file src (string-append bin "/stash"))
            (chmod (string-append bin "/stash") #o755)
            #t))))
    (inputs (list ffmpeg))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/stashapp/stash")
    (synopsis "media organizer with web interface")
    (description
     "Stash is a self-hosted media organizer written in Go.  It provides
a web-based interface for organizing, tagging, and browsing media files
with automatic metadata detection powered by FFmpeg.")
    (license license:agpl3+)))

;;;
;;; ── 23. crush-bin ──────────────────────────────────────────────────────
;;; Terminal AI coding assistant (Go binary)
;;;
(define-public crush-bin
  (package
    (name "crush-bin")
    (version "0.55.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/charmbracelet/crush/releases/download/v"
             version "/crush_" version "_Linux_x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("crush" "bin/crush"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://charm.sh/crush")
    (synopsis "terminal-based AI coding assistant")
    (description
     "Crush is a powerful terminal-based AI assistant for developers.  It
provides intelligent coding assistance directly in the terminal,
supporting code generation, explanation, and debugging workflows.")
    (license license:expat)))

;;;
;;; ── 24. mongodb-tools-bin ──────────────────────────────────────────────
;;; MongoDB import, export, and diagnostic utilities (binary bundle)
;;;
(define-public mongodb-tools-bin
  (package
    (name "mongodb-tools-bin")
    (version "100.13.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://repo.mongodb.org/apt/ubuntu/dists/noble"
             "/mongodb-org/8.2/multiverse/binary-amd64"
             "/mongodb-database-tools_" version "_amd64.deb"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (bin (string-append out "/bin"))
                 (src (assoc-ref %build-inputs "source"))
                 (ar  (search-input-file %build-inputs "bin/ar"))
                 (tar (search-input-file %build-inputs "bin/tar"))
                 (xz  (search-input-file %build-inputs "bin/xz")))
            (setenv "PATH"
                    (string-append (dirname ar) ":"
                                   (dirname tar) ":"
                                   (dirname xz)))
            (invoke ar "x" src)
            (invoke tar "xf" "data.tar.xz")
            (mkdir-p bin)
            (for-each
             (lambda (f)
               (install-file f bin))
             (find-files "usr/bin" ".*"))
            #t))))
    (native-inputs (list binutils tar xz))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/mongodb/mongo-tools")
    (synopsis "MongoDB import, export, and diagnostic tools")
    (description
     "MongoDB Database Tools provide import, export, and diagnostic
capabilities for MongoDB.  The bundle includes mongodump, mongorestore,
mongoexport, mongoimport, mongostat, and mongotop utilities.")
    (license license:asl2.0)))

;;;
;;; ── 25. open-tv-bin ────────────────────────────────────────────────────
;;; IPTV player application (Tauri/Rust binary via .deb)
;;;
(define-public open-tv-bin
  (package
    (name "open-tv-bin")
    (version "1.9.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/Fredolx/open-tv/releases/download/v"
             version "/Fred.TV_" version "_amd64.deb"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (ar  (search-input-file %build-inputs "bin/ar"))
                 (tar (search-input-file %build-inputs "bin/tar"))
                 (gzip (search-input-file %build-inputs "bin/gzip")))
            (setenv "PATH"
                    (string-append (dirname ar) ":"
                                   (dirname tar) ":"
                                   (dirname gzip)))
            (invoke ar "x" src)
            (invoke tar "xf" "data.tar.gz")
            (copy-recursively "usr" out)
            #t))))
    (native-inputs (list binutils tar gzip))
    (inputs (list ffmpeg))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/fredolx/open-tv")
    (synopsis "fast and powerful IPTV application")
    (description
     "Open TV is a fast and powerful IPTV application built with Tauri.
It supports playlist management, EPG guides, and integrates with mpv
and yt-dlp for media playback.")
    (license license:gpl2)))

;;;
;;; ── 26. querycat-bin ───────────────────────────────────────────────────
;;; SQL query tool for diverse data sources (binary)
;;;
(define-public querycat-bin
  (package
    (name "querycat-bin")
    (version "0.17.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/krasninja/querycat/releases/download/v"
             version "/qcat-" version "-linux-x64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("qcat" "bin/qcat"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/krasninja/querycat")
    (synopsis "use SQL to query logs, JSON, CSV, and XML files")
    (description
     "Querycat allows querying different data sources like logs, JSON, CSV,
and XML files using standard SQL syntax.  It provides a unified interface
for ad-hoc data analysis without specialized tools.")
    (license license:expat)))

;;;
;;; ── 27. mods-bin ───────────────────────────────────────────────────────
;;; AI on the command line (Go binary)
;;;
(define-public mods-bin
  (package
    (name "mods-bin")
    (version "1.8.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/charmbracelet/mods/releases/download/v"
             version "/mods_" version "_Linux_x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("mods" "bin/mods"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://charm.sh/")
    (synopsis "AI on the command line")
    (description
     "Mods is a command-line tool that brings AI to the terminal.  It
supports piping data to various AI models for code review, commit
message generation, data analysis, and general-purpose queries.")
    (license license:expat)))

;;;
;;; ── 28. zvm-bin ────────────────────────────────────────────────────────
;;; Zig version manager (Go binary)
;;;
(define-public zvm-bin
  (package
    (name "zvm-bin")
    (version "0.8.14")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/tristanisham/zvm/releases/download/v"
             version "/zvm-linux-amd64.tar"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("zvm" "bin/zvm"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/tristanisham/zvm")
    (synopsis "version manager for Zig compilers")
    (description
     "Zvm is a version manager for Zig compilers.  It simplifies installing,
switching between, and managing multiple versions of the Zig programming
language toolchain.")
    (license license:expat)))

;;;
;;; ── 29. kyanos-bin ─────────────────────────────────────────────────────
;;; Network packet analysis TUI (Go/eBPF binary)
;;;
(define-public kyanos-bin
  (package
    (name "kyanos-bin")
    (version "1.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/hengyoush/kyanos/releases/download/v"
             version "/kyanos_" version "_linux_amd64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("kyanos" "bin/kyanos"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://kyanos.io")
    (synopsis "visualize kernel packet timing from the command line")
    (description
     "Kyanos visualizes the time packets spend in the kernel and provides
command-line analysis tools.  It uses eBPF for efficient kernel-level
tracing of network packet paths and latency.")
    (license license:asl2.0)))

;;;
;;; ── 30. crab-bin ───────────────────────────────────────────────────────
;;; URL crawler tool (Go binary)
;;;
(define-public crab-bin
  (package
    (name "crab-bin")
    (version "1.4.4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/atomicptr/crab/releases/download/v"
             version "/crab_" version "_linux_amd64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("crab" "bin/crab"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/atomicptr/crab")
    (synopsis "versatile URL crawler for sitemaps and URL lists")
    (description
     "Crab is a versatile tool for crawling dozens of URLs from a given
source, such as a sitemap or a URL list.  It supports concurrent
requests and various output formats for web scraping tasks.")
    (license license:expat)))
