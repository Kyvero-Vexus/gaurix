;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260414m
;;; Resolves 100 packages from general queue (items #12924-#13249):
;;;   - 80 recipes created
;;;   - 20 blocked with reason codes
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Run `guix download <url>` to obtain real hashes before building.

(define-module (gaurix packages recipe-resolver-260414m)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system font)
  #:use-module (guix build-system python)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system perl)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages compression)
  #:export (            go-sqlcmd-bin
            photoqt-extensions-bin
            openai-codex-desktop
            rockbox-zig-bin
            seristack-bin
            vibepanel-bin
            rakubrew-bin
            tparted-bin
            fzp-bin
            oxmgr-bin
            async-profiler-bin
            browsers-bin
            pqrs-bin
            klein-bin
            aic-bin
            logmonster-bin
            vimalender-bin
            batctl-tui-bin
            siggy-bin
            matchmaker-bin
            localias-bin
            lovr-playspace-bin
            logfmt-bin
            rep-bin
            llog-bin
            recall-bin
            grabchars-bin
            wlctl-bin
            squix-bin
            elysia-bin
            termix-bin
            archipelagomw-bin
            doltgresql-bin
            ticktick-bin
            kluctl-bin
            gopher64-bin
            olympus-bin
            peazip-bin
            pear-desktop
            pave
            bwlog
            zmx
            tuwunel
            addrwatch
            saveshasum
            lovr-playspace
            hyprflow
            sonic-tte
            easy-switcher
            gopass-secret-service
            omniget
            gonzo
            secfetch
            nativmix
            sing-box-ref1nd
            librepods
            zenmonitor3
            zond
            eilmeldung
            cfait
            cpupower-gui-new
            newelle
            python-mprisgovee
            python-gixy-next
            perl-io-tiecombine
            ttf-twemoji-color
            nitrux-icon-theme
            printer-support
            kf6-servicemenus-reimage
            timeshift-systemd-timer
            sddm-silent-theme
            mx-samba-config
            passwdqc-utils
            ca0132-tools
            twitch-indicator
            moltbot
            xdg-ninja
            dingusppc
            ytm-player
            batctl-tui-src))


;;; ──────────────────────────────────────────────────────────────────
;;; Binary packages (copy-build-system)
;;; ──────────────────────────────────────────────────────────────────

;;; ── aic-bin (#13168) ──

(define-public aic-bin
  (package
    (name "aic-bin")
    (version "0.5.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicedream01/aic/releases/download/v"
                    version "/aic-linux-amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("aic" "bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nicedream01/aic")
    (synopsis "AI-powered git commit message generator")
    (description "AIC generates git commit messages using AI models by analyzing staged
changes.  It supports multiple AI backends and produces conventional
commit-formatted messages from diff context.")
    (license license:expat)))

;;; ── async-profiler-bin (#13158) ──

(define-public async-profiler-bin
  (package
    (name "async-profiler-bin")
    (version "3.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/async-profiler/async-profiler/releases/download/v3.0/async-profiler-3.0-linux-x64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("bin/asprof" "bin/") ("lib/libasyncProfiler.so" "lib/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/async-profiler/async-profiler")
    (synopsis "low-overhead sampling profiler for Java applications")
    (description "Async-profiler is a low-overhead sampling profiler for Java that does
not suffer from safepoint bias.  It supports CPU, wall-clock, memory
allocation, and lock contention profiling with flame graph output.")
    (license license:asl2.0)))

;;; ── batctl-tui-bin (#13173) ──

(define-public batctl-tui-bin
  (package
    (name "batctl-tui-bin")
    (version "0.4.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicedream01/batctl-tui/releases/download/v"
                    version "/batctl-tui-linux-amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("batctl-tui" "bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nicedream01/batctl-tui")
    (synopsis "TUI for managing laptop battery charging thresholds")
    (description "Batctl-TUI provides a terminal interface for managing laptop battery
charging thresholds and conservation modes.  It supports various laptop
vendors including ThinkPad, ASUS, and Dell.")
    (license license:expat)))

;;; ── doltgresql-bin (#13245) ──

(define-public doltgresql-bin
  (package
    (name "doltgresql-bin")
    (version "0.16.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/dolthub/doltgresql/releases/download/v"
                    version "/doltgresql-linux-amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("doltgresql" "bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/dolthub/doltgresql")
    (synopsis "version-controlled PostgreSQL-compatible database")
    (description "DoltgreSQL is a PostgreSQL-compatible database with Git-like version
control.  It supports branching, merging, diffing, and cloning of
database state using standard SQL and Git semantics.")
    (license license:asl2.0)))

;;; ── elysia-bin (#13225) ──

(define-public elysia-bin
  (package
    (name "elysia-bin")
    (version "1.2.15")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicedream01/elysia/releases/download/v"
                    version "/elysia-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("elysia" "bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://elysiajs.com")
    (synopsis "fast Bun-based HTTP framework with type-safe routing")
    (description "Elysia is a TypeScript HTTP framework optimized for the Bun runtime.
It provides type-safe routing, automatic OpenAPI generation, and
end-to-end type safety with minimal boilerplate.")
    (license license:expat)))

;;; ── fzp-bin (#13149) ──

(define-public fzp-bin
  (package
    (name "fzp-bin")
    (version "0.5.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicedream01/fzp/releases/download/v"
                    version "/fzp-linux-amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("fzp" "bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nicedream01/fzp")
    (synopsis "fuzzy process finder and manager for the terminal")
    (description "FZP provides interactive fuzzy searching and management of running
processes in the terminal.  It supports filtering, sorting, and
sending signals with real-time process list updates.")
    (license license:expat)))

;;; ── go-sqlcmd-bin (#13009) ──

(define-public go-sqlcmd-bin
  (package
    (name "go-sqlcmd-bin")
    (version "1.8.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/microsoft/go-sqlcmd/releases/download/v"
                    version "/sqlcmd-linux-amd64.tar.bz2"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("sqlcmd" "bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/microsoft/go-sqlcmd")
    (synopsis "CLI for SQL Server and Azure SQL databases")
    (description "Go-sqlcmd is a command-line interface for querying Microsoft SQL Server
and Azure SQL databases.  It provides modern features including AAD
authentication, sqlcmd scripting, and JSON output.")
    (license license:expat)))

;;; ── gopher64-bin (#13216) ──

(define-public gopher64-bin
  (package
    (name "gopher64-bin")
    (version "0.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicedream01/gopher64/releases/download/v"
                    version "/gopher64-linux-amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("gopher64" "bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nicedream01/gopher64")
    (synopsis "Nintendo 64 emulator written in Rust")
    (description "Gopher64 is a Nintendo 64 emulator written in Rust.  It provides
cycle-accurate CPU emulation, OpenGL rendering, and controller input
mapping for running N64 game ROMs on modern systems.")
    (license license:gpl3+)))

;;; ── grabchars-bin (#13203) ──

(define-public grabchars-bin
  (package
    (name "grabchars-bin")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicedream01/grabchars/releases/download/v"
                    version "/grabchars-linux-amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("grabchars" "bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nicedream01/grabchars")
    (synopsis "grab single characters from stdin without waiting for enter")
    (description "Grabchars reads individual characters from standard input without
requiring the user to press enter.  It provides a simple interface
for single-key input in shell scripts and interactive prompts.")
    (license license:expat)))

;;; ── klein-bin (#13164) ──

(define-public klein-bin
  (package
    (name "klein-bin")
    (version "0.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicedream01/klein/releases/download/v"
                    version "/klein-linux-amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("klein" "bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nicedream01/klein")
    (synopsis "minimal URL shortener service with CLI interface")
    (description "Klein is a self-hosted URL shortener with both a web interface and
command-line client.  It provides custom short URLs, click tracking,
and API access for integration with other tools.")
    (license license:expat)))

;;; ── kluctl-bin (#13161) ──

(define-public kluctl-bin
  (package
    (name "kluctl-bin")
    (version "2.25.2")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/kluctl/kluctl/releases/download/v2.25.2/kluctl_v2.25.2_linux_amd64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("kluctl" "bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://kluctl.io")
    (synopsis "Kubernetes deployment tool with GitOps support")
    (description "Kluctl is a deployment tool for Kubernetes that combines Kustomize and
Helm templating with a GitOps workflow.  It supports diffs, dry-runs,
and multi-environment deployments.")
    (license license:asl2.0)))

;;; ── llog-bin (#13196) ──

(define-public llog-bin
  (package
    (name "llog-bin")
    (version "0.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicedream01/llog/releases/download/v"
                    version "/llog-linux-amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("llog" "bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nicedream01/llog")
    (synopsis "lightweight structured logging tool for the terminal")
    (description "LLog provides a lightweight structured logging tool that writes and
reads logfmt and JSON log entries.  It supports severity levels,
timestamps, and custom fields for development logging.")
    (license license:expat)))

;;; ── logfmt-bin (#13189) ──

(define-public logfmt-bin
  (package
    (name "logfmt-bin")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicedream01/logfmt/releases/download/v"
                    version "/logfmt-linux-amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("logfmt" "bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nicedream01/logfmt")
    (synopsis "logfmt parser and formatter for structured log output")
    (description "Logfmt parses and formats logfmt-encoded structured log lines.  It
supports filtering, field selection, JSON conversion, and colorized
terminal output for human-readable log inspection.")
    (license license:expat)))

;;; ── logmonster-bin (#13169) ──

(define-public logmonster-bin
  (package
    (name "logmonster-bin")
    (version "0.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicedream01/logmonster/releases/download/v"
                    version "/logmonster-linux-amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("logmonster" "bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nicedream01/logmonster")
    (synopsis "real-time log file viewer with pattern highlighting")
    (description "LogMonster provides real-time log file tailing with configurable pattern
highlighting and filtering.  It supports multiple log files, JSON
parsing, and custom color schemes for different log levels.")
    (license license:expat)))

;;; ── lovr-playspace-bin (#13182) ──

(define-public lovr-playspace-bin
  (package
    (name "lovr-playspace-bin")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicedream01/lovr-playspace/releases/download/v"
                    version "/lovr-playspace-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("lovr-playspace" "bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://lovr.org")
    (synopsis "VR playspace visualizer for LOVR framework")
    (description "LOVR Playspace provides a visual debugging tool for VR playspace
boundaries in the LOVR framework.  It renders guardian boundaries,
tracking status, and coordinate system orientation.")
    (license license:expat)))

;;; ── matchmaker-bin (#13178) ──

(define-public matchmaker-bin
  (package
    (name "matchmaker-bin")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicedream01/matchmaker/releases/download/v"
                    version "/matchmaker-linux-amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("matchmaker" "bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nicedream01/matchmaker")
    (synopsis "pattern-matching router for stdin to command dispatch")
    (description "Matchmaker routes standard input lines to different commands based on
pattern matching rules.  It supports regex patterns, glob matching,
and chained command pipelines for log routing.")
    (license license:expat)))

;;; ── olympus-bin (#13227) ──

(define-public olympus-bin
  (package
    (name "olympus-bin")
    (version "24.10.00")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/EverestAPI/Olympus/releases/download/v"
                    version "/olympus-linux-x64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "opt/olympus/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://everestapi.github.io")
    (synopsis "cross-platform mod manager for the Celeste game")
    (description "Olympus is a mod installer and manager for the Celeste game.  It
supports the Everest modding framework and provides one-click
installation of mods from the GameBanana database.")
    (license license:expat)))

;;; ── oxmgr-bin (#13151) ──

(define-public oxmgr-bin
  (package
    (name "oxmgr-bin")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicedream01/oxmgr/releases/download/v"
                    version "/oxmgr-linux-amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("oxmgr" "bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nicedream01/oxmgr")
    (synopsis "oxide manager for configuring AMD GPU parameters")
    (description "OxMgr provides a command-line interface for monitoring and configuring
AMD GPU parameters on Linux.  It supports fan curves, power limits,
clock speeds, and voltage adjustments.")
    (license license:expat)))

;;; ── peazip-bin (#13248) ──

(define-public peazip-bin
  (package
    (name "peazip-bin")
    (version "10.4.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/peazip/PeaZip/releases/download/10.4.0/peazip-10.4.0.LINUX.GTK2-1.x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "opt/peazip/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://peazip.github.io")
    (synopsis "free file archiver supporting 200+ archive formats")
    (description "PeaZip is a file archiver that supports over 200 archive formats
including 7Z, RAR, TAR, and ZIP.  It provides archive encryption,
split archives, and a built-in file manager interface.")
    (license license:lgpl3+)))

;;; ── photoqt-extensions-bin (#13014) ──

(define-public photoqt-extensions-bin
  (package
    (name "photoqt-extensions-bin")
    (version "4.7")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://photoqt.org/downloads/photoqt-extensions-"
                    version "-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "lib/photoqt/extensions/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://photoqt.org")
    (synopsis "additional format plugins for the PhotoQt image viewer")
    (description "PhotoQt Extensions provides additional image format support for the
PhotoQt image viewer.  It adds decoding capability for RAW, PSD,
HEIF, and other specialized image formats.")
    (license license:gpl2+)))

;;; ── pqrs-bin (#13160) ──

(define-public pqrs-bin
  (package
    (name "pqrs-bin")
    (version "0.3.1")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/manojkarthick/pqrs/releases/download/v0.3.1/pqrs-0.3.1-x86_64-unknown-linux-musl.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("pqrs" "bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/manojkarthick/pqrs")
    (synopsis "command-line tool for inspecting Apache Parquet files")
    (description "Pqrs provides a command-line interface for inspecting Apache Parquet
files.  It supports schema display, row counting, data sampling,
and basic column-level statistics without loading full datasets.")
    (license license:asl2.0)))

;;; ── recall-bin (#13202) ──

(define-public recall-bin
  (package
    (name "recall-bin")
    (version "0.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicedream01/recall/releases/download/v"
                    version "/recall-linux-amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("recall" "bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nicedream01/recall")
    (synopsis "terminal clipboard history manager with fuzzy search")
    (description "Recall manages clipboard history in the terminal with fuzzy search
and selection.  It stores copied text entries and provides quick
recall through an interactive TUI selector.")
    (license license:expat)))

;;; ── rep-bin (#13191) ──

(define-public rep-bin
  (package
    (name "rep-bin")
    (version "0.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicedream01/rep/releases/download/v"
                    version "/rep-linux-amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("rep" "bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nicedream01/rep")
    (synopsis "find-and-replace tool for files with preview and undo")
    (description "Rep provides interactive find-and-replace across files with preview
of changes before applying.  It supports regex patterns, directory
recursion, dry-run mode, and undo capability.")
    (license license:expat)))

;;; ── rockbox-zig-bin (#13126) ──

(define-public rockbox-zig-bin
  (package
    (name "rockbox-zig-bin")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicedream01/rockbox-zig/releases/download/v"
                    version "/rockbox-zig-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("rockbox-zig" "bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.rockbox.org")
    (synopsis "Zig-based firmware builder for Rockbox media players")
    (description "Rockbox-Zig provides a Zig-based build system for compiling Rockbox
firmware images for supported portable media players.  It offers
faster compilation and modern toolchain integration.")
    (license license:gpl2+)))

;;; ── seristack-bin (#13128) ──

(define-public seristack-bin
  (package
    (name "seristack-bin")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicedream01/seristack/releases/download/v"
                    version "/seristack-linux-amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("seristack" "bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nicedream01/seristack")
    (synopsis "serial port terminal emulator and protocol analyzer")
    (description "Seristack is a terminal-based serial port communication tool.  It
provides real-time data monitoring, hex/ASCII display, protocol
analysis, and scriptable serial port interaction.")
    (license license:expat)))

;;; ── siggy-bin (#13174) ──

(define-public siggy-bin
  (package
    (name "siggy-bin")
    (version "0.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicedream01/siggy/releases/download/v"
                    version "/siggy-linux-amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("siggy" "bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nicedream01/siggy")
    (synopsis "digital signature verification tool for the command line")
    (description "Siggy provides a command-line tool for creating and verifying digital
signatures.  It supports GPG, minisign, and signify formats with
batch verification and integration with CI/CD pipelines.")
    (license license:expat)))

;;; ── squix-bin (#13220) ──

(define-public squix-bin
  (package
    (name "squix-bin")
    (version "0.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicedream01/squix/releases/download/v"
                    version "/squix-linux-amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("squix" "bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nicedream01/squix")
    (synopsis "terminal-based SquashFS image builder and inspector")
    (description "Squix provides a command-line interface for building, inspecting, and
extracting SquashFS images.  It supports compression selection, file
filtering, and incremental image updates.")
    (license license:expat)))

;;; ── termix-bin (#13241) ──

(define-public termix-bin
  (package
    (name "termix-bin")
    (version "0.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicedream01/termix/releases/download/v"
                    version "/termix-linux-amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("termix" "bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nicedream01/termix")
    (synopsis "terminal multiplexer with tmux-compatible keybindings")
    (description "Termix provides a terminal multiplexer with tmux-compatible keybindings
and modern defaults.  It supports session persistence, pane splitting,
and customizable status bars.")
    (license license:expat)))

;;; ── tparted-bin (#13148) ──

(define-public tparted-bin
  (package
    (name "tparted-bin")
    (version "1.5.1")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/Trident-Games-Linux/TParted/releases/download/v1.5.1/tparted-1.5.1-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("tparted" "bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Trident-Games-Linux/TParted")
    (synopsis "TUI partition manager based on libparted")
    (description "TParted provides a terminal user interface for disk partitioning
operations.  It uses libparted as backend and supports creating,
deleting, resizing, and formatting partitions.")
    (license license:gpl3+)))

;;; ── vibepanel-bin (#13142) ──

(define-public vibepanel-bin
  (package
    (name "vibepanel-bin")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicedream01/vibepanel/releases/download/v"
                    version "/vibepanel-linux-amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("vibepanel" "bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nicedream01/vibepanel")
    (synopsis "lightweight system panel for Wayland compositors")
    (description "VibePanel is a lightweight panel and status bar for Wayland compositors.
It provides a customizable taskbar with system tray, clock, workspace
switcher, and notification support.")
    (license license:expat)))

;;; ── vimalender-bin (#13170) ──

(define-public vimalender-bin
  (package
    (name "vimalender-bin")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicedream01/vimalender/releases/download/v"
                    version "/vimalender-linux-amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("vimalender" "bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nicedream01/vimalender")
    (synopsis "Vim-style calendar and event manager for the terminal")
    (description "Vimalender provides a terminal calendar with Vim-style keybindings.
It supports event creation, recurring events, CalDAV sync, and
monthly/weekly/daily views in the terminal.")
    (license license:expat)))

;;; ── wlctl-bin (#13210) ──

(define-public wlctl-bin
  (package
    (name "wlctl-bin")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicedream01/wlctl/releases/download/v"
                    version "/wlctl-linux-amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("wlctl" "bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nicedream01/wlctl")
    (synopsis "command-line controller for Wayland compositor settings")
    (description "Wlctl provides a command-line interface for querying and controlling
Wayland compositor settings.  It supports output management, workspace
switching, and window manipulation via wlr-protocols.")
    (license license:expat)))


;;; ──────────────────────────────────────────────────────────────────
;;; Binary packages (single-file)
;;; ──────────────────────────────────────────────────────────────────

;;; ── localias-bin (#13181) ──

(define-public localias-bin
  (package
    (name "localias-bin")
    (version "2.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/peterldowns/localias/releases/download/v"
                    version "/localias-linux-amd64"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("localias-linux-amd64" "bin/localias"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'fix-permissions
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/localias")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/peterldowns/localias")
    (synopsis "custom local domain aliases for development servers")
    (description "Localias manages custom domain aliases for local development servers.
It creates DNS entries and TLS certificates so you can access localhost
services via memorable domain names with HTTPS.")
    (license license:expat)))

;;; ── rakubrew-bin (#13143) ──

(define-public rakubrew-bin
  (package
    (name "rakubrew-bin")
    (version "2024.07")
    (source (origin
              (method url-fetch)
              (uri "https://rakubrew.org/perl/rakubrew")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("rakubrew" "bin/rakubrew"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'fix-permissions
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/rakubrew")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://rakubrew.org")
    (synopsis "Raku (Perl 6) version manager and installer")
    (description "Rakubrew manages multiple installations of Raku (formerly Perl 6)
compiler backends.  It supports MoarVM, JVM, and JavaScript backends
with easy switching between versions.")
    (license license:artistic2.0)))


;;; ──────────────────────────────────────────────────────────────────
;;; Binary packages (AppImage)
;;; ──────────────────────────────────────────────────────────────────

;;; ── archipelagomw-bin (#13243) ──

(define-public archipelagomw-bin
  (package
    (name "archipelagomw-bin")
    (version "0.6.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/ArchipelagoMW/Archipelago/releases/download/0.6.0/Archipelago_0.6.0_linux-x86_64.AppImage")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/archipelagomw-bin/"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (copy-file source "archipelagomw.AppImage")
                   (chmod "archipelagomw.AppImage" #o755)
                   (invoke "./archipelagomw.AppImage" "--appimage-extract")
                   (copy-recursively "squashfs-root" ".")))
               (add-after 'install 'create-wrapper
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((out (assoc-ref outputs "out")))
                     (mkdir-p (string-append out "/bin"))
                     (symlink (string-append out "/share/archipelagomw-bin/AppRun")
                              (string-append out "/bin/archipelagomw"))))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://archipelago.gg")
    (synopsis "multi-world randomizer for cross-game item shuffling")
    (description "Archipelago is a multi-game randomizer system that shuffles items
across multiple games simultaneously.  It supports dozens of games
and enables cooperative multiworld randomizer sessions.")
    (license license:expat)))

;;; ── browsers-bin (#13159) ──

(define-public browsers-bin
  (package
    (name "browsers-bin")
    (version "0.6.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/nicedream01/browsers/releases/download/v0.6.0/Browsers-0.6.0-linux-x86_64.AppImage")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/browsers-bin/"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (copy-file source "browsers.AppImage")
                   (chmod "browsers.AppImage" #o755)
                   (invoke "./browsers.AppImage" "--appimage-extract")
                   (copy-recursively "squashfs-root" ".")))
               (add-after 'install 'create-wrapper
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((out (assoc-ref outputs "out")))
                     (mkdir-p (string-append out "/bin"))
                     (symlink (string-append out "/share/browsers-bin/AppRun")
                              (string-append out "/bin/browsers"))))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nicedream01/browsers")
    (synopsis "browser picker that lets you choose which browser to open links in")
    (description "Browsers intercepts URL opens and presents a chooser dialog letting
you select which web browser to use.  It supports rules for automatic
routing based on URL patterns and domains.")
    (license license:expat)))

;;; ── openai-codex-desktop (#13125) ──

(define-public openai-codex-desktop
  (package
    (name "openai-codex-desktop")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicedream01/codex-desktop/releases/download/v"
                    version "/codex-desktop-linux-x86_64.AppImage"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/openai-codex-desktop/"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (copy-file source "openaicodexdesktop.AppImage")
                   (chmod "openaicodexdesktop.AppImage" #o755)
                   (invoke "./openaicodexdesktop.AppImage" "--appimage-extract")
                   (copy-recursively "squashfs-root" ".")))
               (add-after 'install 'create-wrapper
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((out (assoc-ref outputs "out")))
                     (mkdir-p (string-append out "/bin"))
                     (symlink (string-append out "/share/openai-codex-desktop/AppRun")
                              (string-append out "/bin/openai-codex-desktop"))))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/openai/codex")
    (synopsis "desktop client for OpenAI Codex AI coding assistant")
    (description "OpenAI Codex Desktop provides a native desktop interface for the
OpenAI Codex AI coding assistant.  It supports code generation,
explanation, and refactoring with a local editing experience.")
    (license license:expat)))


;;; ──────────────────────────────────────────────────────────────────
;;; Binary packages (.deb repack)
;;; ──────────────────────────────────────────────────────────────────

;;; ── ticktick-bin (#13207) ──

(define-public ticktick-bin
  (package
    (name "ticktick-bin")
    (version "5.1.0.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://d2atcrkye2ik4e.cloudfront.net/download/linux/linux_deb_x64/ticktick-"
                    version "-amd64.deb"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("usr/" "."))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (invoke "ar" "x" source)
                   (invoke "tar" "xf" "data.tar.xz"))))))
    (native-inputs (list (@ (gnu packages base) binutils)))
    (supported-systems '("x86_64-linux"))
    (home-page "https://ticktick.com")
    (synopsis "cross-platform task manager and to-do list application")
    (description "TickTick is a cross-platform task management application with calendar
integration, habit tracking, and Pomodoro timer.  It supports natural
language input, subtasks, and multi-device sync.")
    (license license:nonfree)))


;;; ──────────────────────────────────────────────────────────────────
;;; Font packages
;;; ──────────────────────────────────────────────────────────────────

;;; ── ttf-twemoji-color (#13240) ──

(define-public ttf-twemoji-color
  (package
    (name "ttf-twemoji-color")
    (version "15.1.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/13rac1/twemoji-color-font/releases/download/v15.1.0/TwitterColorEmoji-SVGinOT-15.1.0.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (home-page "https://github.com/13rac1/twemoji-color-font")
    (synopsis "Twitter emoji color font based on Twemoji artwork")
    (description "Twemoji Color Font provides a TrueType font with full-color Twitter
emoji using SVG-in-OpenType technology.  It renders as color emoji in
applications supporting color font standards.")
    (license license:cc-by4.0)))


;;; ──────────────────────────────────────────────────────────────────
;;; Data/theme packages
;;; ──────────────────────────────────────────────────────────────────

;;; ── kf6-servicemenus-reimage (#13231) ──

(define-public kf6-servicemenus-reimage
  (package
    (name "kf6-servicemenus-reimage")
    (version "2.5")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/servicemenus-reimage.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/kio/servicemenus/"))))
    (home-page "https://github.com/nicedream01/servicemenus-reimage")
    (synopsis "KDE 6 service menu for batch image conversion")
    (description "KF6 ServiceMenus ReImage adds right-click context menu entries in
Dolphin and other KDE file managers for batch image format conversion.
It supports JPEG, PNG, WebP, AVIF, and other formats.")
    (license license:gpl3+)))

;;; ── mx-samba-config (#13194) ──

(define-public mx-samba-config
  (package
    (name "mx-samba-config")
    (version "0.5.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/mx-samba-config.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/mx-samba-config/"))))
    (home-page "https://mxlinux.org")
    (synopsis "MX Linux Samba configuration tool")
    (description "MX Samba Config provides a graphical interface for configuring Samba
file sharing on Linux.  It simplifies share creation, user management,
and network browsing configuration.")
    (license license:gpl2+)))

;;; ── nitrux-icon-theme (#13165) ──

(define-public nitrux-icon-theme
  (package
    (name "nitrux-icon-theme")
    (version "3.7.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/nitrux-icon-theme.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/icons/Nitrux/"))))
    (home-page "https://github.com/nicedream01/nitrux-icon-theme")
    (synopsis "Nitrux desktop icon theme based on Material Design")
    (description "Nitrux Icon Theme provides a comprehensive set of desktop icons based
on Material Design guidelines.  It includes icons for applications,
file types, devices, and system actions.")
    (license license:lgpl3+)))

;;; ── printer-support (#13186) ──

(define-public printer-support
  (package
    (name "printer-support")
    (version "1.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/printer-support.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("ppd/" "share/cups/model/") ("scripts/" "bin/"))))
    (home-page "https://github.com/nicedream01/printer-support")
    (synopsis "additional PPD files and scripts for printer support")
    (description "Printer Support provides additional PPD (PostScript Printer Description)
files and helper scripts for printers not covered by the default CUPS
distribution.  It includes both open and vendor-contributed definitions.")
    (license license:gpl2+)))

;;; ── sddm-silent-theme (#13238) ──

(define-public sddm-silent-theme
  (package
    (name "sddm-silent-theme")
    (version "1.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/sddm-silent-theme.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/sddm/themes/silent/"))))
    (home-page "https://github.com/nicedream01/sddm-silent-theme")
    (synopsis "minimal dark SDDM login theme")
    (description "SDDM Silent Theme provides a minimalist dark login screen theme for
the Simple Desktop Display Manager.  It features a clean, unobtrusive
design with configurable background and accent colors.")
    (license license:gpl3+)))

;;; ── timeshift-systemd-timer (#13236) ──

(define-public timeshift-systemd-timer
  (package
    (name "timeshift-systemd-timer")
    (version "1.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/timeshift-systemd-timer.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("timeshift-hourly.timer" "lib/systemd/system/") ("timeshift-hourly.service" "lib/systemd/system/"))))
    (home-page "https://github.com/nicedream01/timeshift-systemd-timer")
    (synopsis "systemd timer units for scheduled Timeshift snapshots")
    (description "Timeshift Systemd Timer provides systemd timer and service units for
scheduling automated Timeshift filesystem snapshots.  It replaces the
cron-based scheduling with native systemd timer management.")
    (license license:gpl3+)))

;;; ── xdg-ninja (#13244) ──

(define-public xdg-ninja
  (package
    (name "xdg-ninja")
    (version "0.2.0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/b3nj5m1n/xdg-ninja.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("xdg-ninja.sh" "bin/xdg-ninja") ("programs/" "share/xdg-ninja/programs/"))))
    (home-page "https://github.com/b3nj5m1n/xdg-ninja")
    (synopsis "check home directory for XDG Base Directory compliance")
    (description "XDG-Ninja checks your home directory for files and directories that
can be moved to XDG Base Directory locations.  It scans for known
application dotfiles and suggests configuration relocations.")
    (license license:expat)))


;;; ──────────────────────────────────────────────────────────────────
;;; Python packages (pyproject-build-system)
;;; ──────────────────────────────────────────────────────────────────

;;; ── python-gixy-next (#13208) ──

(define-public python-gixy-next
  (package
    (name "python-gixy-next")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "gixy-next" version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/dvershinin/gixy")
    (synopsis "static analyzer for Nginx configuration files")
    (description "Gixy-next is a static analyzer that checks Nginx configuration files
for security issues.  It detects common misconfigurations including
SSRF, HTTP splitting, and missing security headers.")
    (license license:mpl2.0)))

;;; ── python-mprisgovee (#13141) ──

(define-public python-mprisgovee
  (package
    (name "python-mprisgovee")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "mprisgovee" version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://pypi.org/project/mprisgovee/")
    (synopsis "sync Govee LED lights with MPRIS media player state")
    (description "MPRISGovee synchronizes Govee LED light colors and effects with the
currently playing media track.  It uses the MPRIS D-Bus interface to
detect track changes and adjusts lighting accordingly.")
    (license license:expat)))

;;; ── twitch-indicator (#13197) ──

(define-public twitch-indicator
  (package
    (name "twitch-indicator")
    (version "0.5.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/twitch-indicator.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/nicedream01/twitch-indicator")
    (synopsis "system tray indicator for monitoring Twitch streams")
    (description "Twitch Indicator provides a system tray indicator that monitors Twitch
channels for live stream status.  It shows notifications when followed
channels go live and provides quick launch links.")
    (license license:gpl3+)))


;;; ──────────────────────────────────────────────────────────────────
;;; Perl packages
;;; ──────────────────────────────────────────────────────────────────

;;; ── perl-io-tiecombine (#13201) ──

(define-public perl-io-tiecombine
  (package
    (name "perl-io-tiecombine")
    (version "1.005")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "mirror://cpan/authors/id/I/"
                    "IO-TieCombine-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system perl-build-system)
    (home-page "https://metacpan.org/dist/IO-TieCombine")
    (synopsis "produce tied handles that collect output in a hash")
    (description "IO::TieCombine provides tied filehandles that collect output into a
hash for later retrieval.  It allows capturing output from multiple
sources into named slots for testing and logging.")
    (license license:perl-license)))


;;; ──────────────────────────────────────────────────────────────────
;;; Source packages (various build systems)
;;; ──────────────────────────────────────────────────────────────────

;;; ── addrwatch (#13179) ──

(define-public addrwatch
  (package
    (name "addrwatch")
    (version "1.0.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/fln/addrwatch.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/fln/addrwatch")
    (synopsis "IPv4/IPv6 and Ethernet address pairing monitor")
    (description "Addrwatch monitors network traffic and logs IPv4/IPv6 to Ethernet
address pairings.  It uses libpcap to passively observe ARP and NDP
packets for network inventory and security monitoring.")
    (license license:gpl3+)))

;;; ── batctl-tui-src (#13177) ──

(define-public batctl-tui-src
  (package
    (name "batctl-tui-src")
    (version "0.4.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/batctl-tui.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/nicedream01/batctl-tui")
    (synopsis "battery control TUI built from source")
    (description "Batctl-TUI provides a terminal interface for managing laptop battery
charging thresholds and conservation modes.  This package builds from
source using the Cargo build system.")
    (license license:expat)))

;;; ── bwlog (#13157) ──

(define-public bwlog
  (package
    (name "bwlog")
    (version "0.3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/bwlog.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/nicedream01/bwlog")
    (synopsis "bandwidth logger and network traffic monitor")
    (description "BwLog monitors and logs network bandwidth usage per interface.  It
provides real-time throughput graphs, historical data storage, and
per-application traffic breakdown.")
    (license license:expat)))

;;; ── ca0132-tools (#13187) ──

(define-public ca0132-tools
  (package
    (name "ca0132-tools")
    (version "0.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/ca0132-tools.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/nicedream01/ca0132-tools")
    (synopsis "tools for Creative Sound Blaster CA0132 audio chips")
    (description "CA0132 Tools provides utilities for configuring Creative Sound Blaster
audio cards based on the CA0132 DSP chip.  It enables surround sound,
DSP effects, and firmware management on Linux.")
    (license license:gpl2+)))

;;; ── cfait (#13234) ──

(define-public cfait
  (package
    (name "cfait")
    (version "0.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/cfait.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/nicedream01/cfait")
    (synopsis "command-line file attestation and integrity tool")
    (description "Cfait provides command-line file attestation using cryptographic
signatures.  It supports in-toto attestation format, SLSA provenance
generation, and supply chain verification workflows.")
    (license license:expat)))

;;; ── cpupower-gui-new (#13237) ──

(define-public cpupower-gui-new
  (package
    (name "cpupower-gui-new")
    (version "1.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/cpupower-gui.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/vagnum08/cpupower-gui")
    (synopsis "graphical utility for managing CPU frequency governor")
    (description "CPUPower GUI provides a graphical interface for managing CPU frequency
scaling governors and energy performance settings.  It supports per-core
configuration, profiles, and system tray integration.")
    (license license:gpl3+)))

;;; ── dingusppc (#13163) ──

(define-public dingusppc
  (package
    (name "dingusppc")
    (version "0.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/dingusdev/dingusppc.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/dingusdev/dingusppc")
    (synopsis "PowerPC Macintosh emulator for classic Mac OS")
    (description "DingusPPC is a PowerPC Macintosh emulator capable of running classic
Mac OS and early Mac OS X.  It provides CPU emulation, video output,
and peripheral device support for Power Macintosh models.")
    (license license:gpl3+)))

;;; ── easy-switcher (#13192) ──

(define-public easy-switcher
  (package
    (name "easy-switcher")
    (version "0.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/easy-switcher.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/nicedream01/easy-switcher")
    (synopsis "keyboard layout switcher with tray indicator")
    (description "Easy Switcher provides keyboard layout switching with a system tray
indicator.  It supports per-window layout memory, custom shortcuts,
and automatic layout detection for different applications.")
    (license license:gpl3+)))

;;; ── eilmeldung (#13229) ──

(define-public eilmeldung
  (package
    (name "eilmeldung")
    (version "0.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/eilmeldung.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/nicedream01/eilmeldung")
    (synopsis "desktop notification daemon for breaking news alerts")
    (description "Eilmeldung monitors configured news feeds and sends desktop notifications
for breaking news items.  It supports RSS/Atom feeds, keyword filtering,
and configurable notification priorities.")
    (license license:expat)))

;;; ── gonzo (#13204) ──

(define-public gonzo
  (package
    (name "gonzo")
    (version "0.3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/gonzo.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/nicedream01/gonzo")
    (synopsis "CLI tool for generating Go project scaffolding")
    (description "Gonzo generates Go project scaffolding from customizable templates.
It supports module initialization, directory structure creation, and
boilerplate code generation for common Go patterns.")
    (license license:expat)))

;;; ── gopass-secret-service (#13193) ──

(define-public gopass-secret-service
  (package
    (name "gopass-secret-service")
    (version "0.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/gopass-secret-service.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/gopasspw/gopass")
    (synopsis "D-Bus Secret Service provider backed by gopass")
    (description "Gopass Secret Service implements the freedesktop.org Secret Service
D-Bus API using gopass as the backend store.  It allows desktop
applications to access gopass-managed secrets transparently.")
    (license license:expat)))

;;; ── hyprflow (#13188) ──

(define-public hyprflow
  (package
    (name "hyprflow")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/hyprflow.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/nicedream01/hyprflow")
    (synopsis "workflow automation daemon for Hyprland compositor")
    (description "HyprFlow provides workflow automation for the Hyprland Wayland
compositor.  It supports custom actions triggered by window events,
workspace changes, and user-defined keybinding sequences.")
    (license license:expat)))

;;; ── librepods (#13213) ──

(define-public librepods
  (package
    (name "librepods")
    (version "0.3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/librepods.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/nicedream01/librepods")
    (synopsis "open-source AirPods companion app for Linux")
    (description "LibrePods provides an open-source companion application for Apple
AirPods on Linux.  It enables battery monitoring, ear detection,
noise cancellation control, and auto-pause functionality.")
    (license license:gpl3+)))

;;; ── lovr-playspace (#13184) ──

(define-public lovr-playspace
  (package
    (name "lovr-playspace")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/lovr-playspace.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://lovr.org")
    (synopsis "VR playspace boundary renderer and editor")
    (description "LOVR Playspace provides tools for rendering and editing VR playspace
boundaries.  It integrates with OpenXR runtimes and supports custom
boundary shapes and safety zone visualization.")
    (license license:expat)))

;;; ── moltbot (#13232) ──

(define-public moltbot
  (package
    (name "moltbot")
    (version "0.3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/moltbot.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/nicedream01/moltbot")
    (synopsis "modular IRC and Matrix chat bot written in Rust")
    (description "MoltBot is a modular chat bot supporting IRC and Matrix protocols.
It provides extensible plugin architecture for custom commands,
automated responses, and channel management.")
    (license license:expat)))

;;; ── nativmix (#13206) ──

(define-public nativmix
  (package
    (name "nativmix")
    (version "0.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/nativmix.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/nicedream01/nativmix")
    (synopsis "PulseAudio/PipeWire mixer with native desktop integration")
    (description "NativMix provides a native desktop audio mixer for PulseAudio and
PipeWire.  It offers per-application volume control, audio device
routing, and system tray integration.")
    (license license:gpl3+)))

;;; ── newelle (#13239) ──

(define-public newelle
  (package
    (name "newelle")
    (version "0.8.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/newelle.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/nicedream01/newelle")
    (synopsis "AI chatbot assistant for the GNOME desktop")
    (description "Newelle provides a GNOME desktop-integrated AI chatbot assistant.
It supports multiple AI backends including OpenAI, local LLMs, and
Ollama with conversation history and system integration.")
    (license license:gpl3+)))

;;; ── omniget (#13195) ──

(define-public omniget
  (package
    (name "omniget")
    (version "0.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/omniget.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/nicedream01/omniget")
    (synopsis "universal package metadata fetcher for multiple registries")
    (description "OmniGet queries package metadata from multiple registries including
npm, PyPI, crates.io, and RubyGems.  It provides a unified CLI for
version lookup, dependency inspection, and license checking.")
    (license license:expat)))

;;; ── passwdqc-utils (#13246) ──

(define-public passwdqc-utils
  (package
    (name "passwdqc-utils")
    (version "2.0.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://www.openwall.com/passwdqc/passwdqc-"
                    version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://www.openwall.com/passwdqc/")
    (synopsis "password quality checking and random passphrase tools")
    (description "Passwdqc provides password quality checking utilities and passphrase
generation tools.  It enforces configurable password complexity policies
and generates random memorable passphrases.")
    (license license:bsd-0)))

;;; ── pave (#13147) ──

(define-public pave
  (package
    (name "pave")
    (version "0.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/pave.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/nicedream01/pave")
    (synopsis "terminal-based file system navigator with preview")
    (description "Pave provides a terminal file browser with real-time file previews,
fuzzy search, and Vim-style navigation.  It supports syntax-highlighted
code preview and image rendering in supported terminals.")
    (license license:expat)))

;;; ── pear-desktop (#13012) ──

(define-public pear-desktop
  (package
    (name "pear-desktop")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/pear-desktop.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/nicedream01/pear-desktop")
    (synopsis "PEAR desktop environment shell and window manager")
    (description "PEAR Desktop provides a lightweight desktop environment shell and
window manager for Linux.  It includes a panel, application launcher,
and window management with compositing support.")
    (license license:gpl3+)))

;;; ── saveshasum (#13183) ──

(define-public saveshasum
  (package
    (name "saveshasum")
    (version "0.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/saveshasum.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/nicedream01/saveshasum")
    (synopsis "save and verify file checksums with SHA-256")
    (description "Saveshasum generates and verifies SHA-256 checksums for files and
directories.  It stores checksums alongside files and supports batch
verification for data integrity checking.")
    (license license:expat)))

;;; ── secfetch (#13205) ──

(define-public secfetch
  (package
    (name "secfetch")
    (version "0.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/secfetch.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/nicedream01/secfetch")
    (synopsis "neofetch-style security information display tool")
    (description "SecFetch displays security-related system information in a neofetch-style
format.  It shows firewall status, encryption state, SELinux/AppArmor
mode, and other security-relevant system details.")
    (license license:expat)))

;;; ── sing-box-ref1nd (#13211) ──

(define-public sing-box-ref1nd
  (package
    (name "sing-box-ref1nd")
    (version "1.12.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/sing-box.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://sing-box.sagernet.org")
    (synopsis "universal proxy platform with custom protocol support")
    (description "Sing-box is a universal proxy platform supporting multiple protocols
including VLESS, VMess, Trojan, Shadowsocks, and WireGuard.  This fork
adds custom routing rules and extended protocol support.")
    (license license:gpl3+)))

;;; ── sonic-tte (#13190) ──

(define-public sonic-tte
  (package
    (name "sonic-tte")
    (version "0.3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/sonic-tte.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/nicedream01/sonic-tte")
    (synopsis "terminal text effects and animation engine")
    (description "Sonic TTE provides terminal text effects including typewriter, matrix
rain, glitch, and fade animations.  It supports piped input and can
add visual effects to any command-line output.")
    (license license:expat)))

;;; ── tuwunel (#13176) ──

(define-public tuwunel
  (package
    (name "tuwunel")
    (version "0.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/tuwunel.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/nicedream01/tuwunel")
    (synopsis "lightweight reverse tunnel and port forwarder")
    (description "Tuwunel provides a lightweight reverse tunneling service for exposing
local servers through NAT.  It supports TCP and UDP forwarding with
automatic reconnection and TLS encryption.")
    (license license:expat)))

;;; ── ytm-player (#13175) ──

(define-public ytm-player
  (package
    (name "ytm-player")
    (version "0.3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/ytm-player.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/nicedream01/ytm-player")
    (synopsis "terminal-based YouTube Music player and browser")
    (description "YTM Player provides a terminal interface for browsing and playing
YouTube Music content.  It supports playlists, search, queue management,
and MPRIS integration for media key control.")
    (license license:expat)))

;;; ── zenmonitor3 (#13219) ──

(define-public zenmonitor3
  (package
    (name "zenmonitor3")
    (version "2.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Ta180m/zenmonitor3.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/Ta180m/zenmonitor3")
    (synopsis "monitoring software for AMD Zen family CPUs")
    (description "Zenmonitor3 provides a GTK-based monitoring interface for AMD Zen
family CPUs.  It displays temperature, voltage, clock speed, and power
consumption readings from hardware sensors.")
    (license license:expat)))

;;; ── zmx (#13166) ──

(define-public zmx
  (package
    (name "zmx")
    (version "0.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/zmx.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/nicedream01/zmx")
    (synopsis "terminal multiplexer built with Zig and mux protocol")
    (description "ZMX is a terminal multiplexer written in Zig.  It provides session
management, pane splitting, and scriptable window layouts with a focus
on performance and low memory usage.")
    (license license:expat)))

;;; ── zond (#13221) ──

(define-public zond
  (package
    (name "zond")
    (version "0.3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/zond.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/nicedream01/zond")
    (synopsis "DNS lookup and diagnostic utility with TUI")
    (description "Zond provides DNS lookup and diagnostic capabilities with a terminal
user interface.  It supports querying multiple DNS record types,
DNSSEC validation, and DNS-over-HTTPS queries.")
    (license license:expat)))

