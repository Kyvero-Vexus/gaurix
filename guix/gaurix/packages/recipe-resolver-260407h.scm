;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2026 Gaurix contributors
;;;
;;; Recipe resolver pass — recipe-resolver-260407h
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages:
;;;   pre-built binary CLI tools and desktop applications.

(define-module (gaurix packages recipe-resolver-260407h)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system trivial)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:export (fishnet-bin
            pkl-bin
            struct-bin
            termflix-bin
            jn-bin
            resterm-bin
            fitui-bin
            gh-enhance-bin
            lolcatpp-bin
            grab-bin
            meteobar-bin
            proc-bin
            mcp-cli-bin
            zerobrew-bin
            beatmapexporter-bin
            byedpi-bin
            rt-bin
            runa-bin
            gryph-bin
            treekei-bin
            xfr-bin
            ttl-bin
            xc-bin
            pj-bin
            openlist-bin
            bbdown-bin
            geoclue-tz-bin
            buck2-bin
            libdeep-filter-ladspa-bin
            cli-proxy-api-bin))

;;;
;;; ── 1. fishnet-bin ────────────────────────────────────────────────────
;;; Distributed Stockfish analysis for lichess.org
;;;
(define-public fishnet-bin
  (package
    (name "fishnet-bin")
    (version "2.13.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/lichess-org/fishnet/releases/download/v"
             version "/fishnet-x86_64-unknown-linux-musl"))
       (sha256
        (base32 "1hlqz0jm5rjfawq8vg1zsp5v3a0830pqwvay8k2fsgzv4ijxh2j7"))))
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
            (copy-file src (string-append bin "/fishnet"))
            (chmod (string-append bin "/fishnet") #o755)
            #t))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/lichess-org/fishnet")
    (synopsis "distributed Stockfish analysis for lichess.org")
    (description
     "Fishnet is a distributed computing framework for running Stockfish
chess engine analysis on behalf of lichess.org.  It connects volunteer
CPUs to help analyze games on the platform.")
    (license license:gpl3)))

;;;
;;; ── 2. pkl-bin ────────────────────────────────────────────────────────
;;; Configuration as code language from Apple
;;;
(define-public pkl-bin
  (package
    (name "pkl-bin")
    (version "0.31.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/apple/pkl/releases/download/"
             version "/pkl-linux-amd64"))
       (sha256
        (base32 "1dkh12i04hjnyyp7s1gmzs6vj4i4z5vx5yaq8bzr5jk8kf42lp2s"))))
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
            (copy-file src (string-append bin "/pkl"))
            (chmod (string-append bin "/pkl") #o755)
            #t))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://pkl-lang.org")
    (synopsis "configuration as code language with rich validation and tooling")
    (description
     "Pkl is a configuration as code language from Apple with rich validation
and tooling.  It provides type safety, IDE support, and code generation
for producing configuration in JSON, YAML, Property Lists, and other formats.")
    (license license:asl2.0)))

;;;
;;; ── 3. struct-bin ─────────────────────────────────────────────────────
;;; Rust-based tree alternative
;;;
(define-public struct-bin
  (package
    (name "struct-bin")
    (version "0.5.4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/caffienerd/struct-cli/releases/download/v"
             version "/struct"))
       (sha256
        (base32 "1gg3g2q100mgicphzrzgs1bylq4ygg924m3yb3hlllvfy80b9702"))))
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
            (copy-file src (string-append bin "/struct"))
            (chmod (string-append bin "/struct") #o755)
            #t))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/caffienerd/struct-cli")
    (synopsis "tree alternative that respects .gitignore and hidden files")
    (description
     "Struct is a Rust-based alternative to the @command{tree} command
that respects @file{.gitignore} rules and hidden files by default.  It
provides a clean directory tree view with smart filtering.")
    (license license:expat)))

;;;
;;; ── 4. termflix-bin ───────────────────────────────────────────────────
;;; Terminal animation player
;;;
(define-public termflix-bin
  (package
    (name "termflix-bin")
    (version "0.4.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/paulrobello/termflix/releases/download/v"
             version "/termflix-linux-x86_64"))
       (sha256
        (base32 "1vx7j6kfldy8lgrjy47wll8v04khhk1lhq013gf7wncpx9vc7snx"))))
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
            (copy-file src (string-append bin "/termflix"))
            (chmod (string-append bin "/termflix") #o755)
            #t))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/paulrobello/termflix")
    (synopsis "terminal animation player with procedurally generated animations")
    (description
     "Termflix is a terminal animation player with many procedurally
generated animations, multiple render modes, and true color support.")
    (license license:expat)))

;;;
;;; ── 5. jn-bin ─────────────────────────────────────────────────────────
;;; File-based CLI notetaker
;;;
(define-public jn-bin
  (package
    (name "jn-bin")
    (version "1.1.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/joereynolds/jn/releases/download/v"
             version "/jn-linux"))
       (sha256
        (base32 "0hdbhk23zc229lp9sg7ick6600y1pqzkh6d0slhsfn4xxgmiink9"))))
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
            (copy-file src (string-append bin "/jn"))
            (chmod (string-append bin "/jn") #o755)
            #t))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/joereynolds/jn")
    (synopsis "file-based CLI notetaker")
    (description
     "Jn is a minimal, file-based command-line notetaker.  Notes are stored
as plain text files, making them easy to search, sync, and version control.")
    (license license:expat)))

;;;
;;; ── 6. resterm-bin ────────────────────────────────────────────────────
;;; Terminal REST client for .http/.rest files
;;;
(define-public resterm-bin
  (package
    (name "resterm-bin")
    (version "0.24.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/unkn0wn-root/resterm/releases/download/v"
             version "/resterm_Linux_x86_64"))
       (sha256
        (base32 "1m3kbpxg7mfn90d2dz2abwjvwbrwjqy213cyj5z1rk943fv46jjp"))))
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
            (copy-file src (string-append bin "/resterm"))
            (chmod (string-append bin "/resterm") #o755)
            #t))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/unkn0wn-root/resterm")
    (synopsis "terminal REST client for .http/.rest files")
    (description
     "Resterm is a terminal-based REST client that supports @file{.http}
and @file{.rest} files with HTTP, GraphQL, and gRPC support.")
    (license license:asl2.0)))

;;;
;;; ── 7. fitui-bin ──────────────────────────────────────────────────────
;;; Terminal-based personal finance tracker
;;;
(define-public fitui-bin
  (package
    (name "fitui-bin")
    (version "0.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/ayanchavand/FiTui/releases/download/v"
             version "/fitui"))
       (sha256
        (base32 "01nd9pkxnz6xmd144sn8jaxfs9yad1146h9ssa1zaksf1jn6xa51"))))
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
            (copy-file src (string-append bin "/fitui"))
            (chmod (string-append bin "/fitui") #o755)
            #t))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/ayanchavand/FiTui")
    (synopsis "terminal-based personal finance tracker")
    (description
     "FiTui is a terminal-based personal finance tracker that helps you
manage expenses and budgets from the command line.")
    (license license:expat)))

;;;
;;; ── 8. gh-enhance-bin ─────────────────────────────────────────────────
;;; Terminal UI for GitHub Actions
;;;
(define-public gh-enhance-bin
  (package
    (name "gh-enhance-bin")
    (version "0.5.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/dlvhdr/gh-enhance/releases/download/v"
             version "/gh-enhance_v" version "_linux-amd64"))
       (sha256
        (base32 "0rn6fiqjvlq695w8g6nbgx6jq2cpck8gl8k8q8f2cqybh6jcjhwi"))))
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
            (copy-file src (string-append bin "/gh-enhance"))
            (chmod (string-append bin "/gh-enhance") #o755)
            #t))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/dlvhdr/gh-enhance")
    (synopsis "terminal UI for GitHub Actions")
    (description
     "Gh-enhance is a fast terminal UI for interacting with GitHub Actions.
It provides real-time workflow monitoring and log viewing.")
    (license license:expat)))

;;;
;;; ── 9. lolcatpp-bin ───────────────────────────────────────────────────
;;; lolcat reimplementation in C++
;;;
(define-public lolcatpp-bin
  (package
    (name "lolcatpp-bin")
    (version "2.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/lolcatpp/lolcatpp/releases/download/v"
             version "/lolcat-linux-amd64"))
       (sha256
        (base32 "1vlg5nisg5j7sqww2n6dyjzsf14kxqhyjd48240vl0ihckpy0z0x"))))
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
            (copy-file src (string-append bin "/lolcat"))
            (chmod (string-append bin "/lolcat") #o755)
            #t))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/lolcatpp/lolcatpp")
    (synopsis "rainbow text colorizer for terminal output")
    (description
     "Lolcat++ is a C++ reimplementation of lolcat that adds rainbow
coloring to terminal output.  It reads from standard input and prints
each character in a different color of the rainbow spectrum.")
    (license license:bsd-3)))

;;;
;;; ── 10. grab-bin ──────────────────────────────────────────────────────
;;; Asynchronous file downloader
;;;
(define-public grab-bin
  (package
    (name "grab-bin")
    (version "2.1.5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/skorotkiewicz/grab/releases/download/v"
             version "/grab-linux-x86_64"))
       (sha256
        (base32 "01ld2xl4ywh7wrzx80qahwpsa6llmffp6xglzm9s7yv5xqkld6y0"))))
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
            (copy-file src (string-append bin "/grab"))
            (chmod (string-append bin "/grab") #o755)
            #t))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/skorotkiewicz/grab")
    (synopsis "asynchronous file downloader")
    (description
     "Grab is a fast asynchronous file downloader that supports parallel
connections for accelerated downloads.")
    (license license:expat)))

;;;
;;; ── 11. meteobar-bin ──────────────────────────────────────────────────
;;; Weather widget for Waybar
;;;
(define-public meteobar-bin
  (package
    (name "meteobar-bin")
    (version "0.1.8")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/mryll/meteobar/releases/download/v"
             version "/meteobar-" version "-x86_64-linux"))
       (sha256
        (base32 "0abynsgm7h5ayri2vh3gy0b5zzbfwyrcl1xlx1drpvxwx7i8w58g"))))
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
            (copy-file src (string-append bin "/meteobar"))
            (chmod (string-append bin "/meteobar") #o755)
            #t))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/mryll/meteobar")
    (synopsis "weather widget for Waybar using Open-Meteo")
    (description
     "Meteobar is a weather widget for Waybar that uses the Open-Meteo
API.  It requires no API key and displays current weather conditions
in the status bar.")
    (license license:expat)))

;;;
;;; ── 12. proc-bin ──────────────────────────────────────────────────────
;;; Semantic CLI tool for process management
;;;
(define-public proc-bin
  (package
    (name "proc-bin")
    (version "1.12.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/yazeed/proc/releases/download/v"
             version "/proc-linux-x86_64"))
       (sha256
        (base32 "1zivl3gsal3nfsq0k5y6jj4vnpzhr8nx0sdygf619mh0m760cknb"))))
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
            (copy-file src (string-append bin "/proc"))
            (chmod (string-append bin "/proc") #o755)
            #t))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/yazeed/proc")
    (synopsis "semantic CLI tool for process management")
    (description
     "Proc is a semantic command-line tool for process management.
It provides intuitive commands for listing, filtering, and managing
system processes.")
    (license license:expat)))

;;;
;;; ── 13. mcp-cli-bin ───────────────────────────────────────────────────
;;; Lightweight CLI for Model Context Protocol
;;;
(define-public mcp-cli-bin
  (package
    (name "mcp-cli-bin")
    (version "0.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/philschmid/mcp-cli/releases/download/v"
             version "/mcp-cli-linux-x64"))
       (sha256
        (base32 "0z41f24wyia2s0q5mx8ly37lkgxr7k1i4zcnxk5mda6s1qljyxvn"))))
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
            (copy-file src (string-append bin "/mcp-cli"))
            (chmod (string-append bin "/mcp-cli") #o755)
            #t))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/philschmid/mcp-cli")
    (synopsis "lightweight CLI for interacting with MCP servers")
    (description
     "MCP CLI is a lightweight command-line interface for interacting
with Model Context Protocol (MCP) servers.  It supports tool listing,
resource browsing, and prompt management.")
    (license license:expat)))

;;;
;;; ── 14. zerobrew-bin ──────────────────────────────────────────────────
;;; Faster experimental Homebrew alternative
;;;
(define-public zerobrew-bin
  (package
    (name "zerobrew-bin")
    (version "0.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/lucasgelfond/zerobrew/releases/download/v"
             version "/zb-linux-x64"))
       (sha256
        (base32 "10ghhfchpavb15nr3zizj0yb1avvbw34hirznbzqhxrnxhszdjw2"))))
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
            (copy-file src (string-append bin "/zb"))
            (chmod (string-append bin "/zb") #o755)
            #t))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/lucasgelfond/zerobrew")
    (synopsis "drop-in faster experimental Homebrew alternative")
    (description
     "Zerobrew is a drop-in, faster experimental alternative to Homebrew
for package management.  It aims for 5-20x speedup over standard Homebrew.")
    (license (list license:asl2.0 license:expat))))

;;;
;;; ── 15. beatmapexporter-bin ───────────────────────────────────────────
;;; osu!lazer Beatmap Exporter utility
;;;
(define-public beatmapexporter-bin
  (package
    (name "beatmapexporter-bin")
    (version "2.7.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/kabiiQ/BeatmapExporter/releases/download/v"
             version "/linux-BeatmapExporterCLI"))
       (sha256
        (base32 "0v5a9rn8xg5jw1xal1lwv94fxlm3yqczigd6s7pm4jyraw3v3004"))))
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
            (copy-file src (string-append bin "/beatmapexporter"))
            (chmod (string-append bin "/beatmapexporter") #o755)
            #t))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/kabiiQ/BeatmapExporter")
    (synopsis "osu!lazer beatmap exporter utility")
    (description
     "BeatmapExporter is a CLI utility for exporting beatmaps from
osu!lazer's internal database format to standard @file{.osz} files.")
    (license license:expat)))

;;;
;;; ── 16. byedpi-bin ────────────────────────────────────────────────────
;;; Bypass DPI
;;;
(define-public byedpi-bin
  (package
    (name "byedpi-bin")
    (version "0.17.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/hufrea/byedpi/releases/download/v"
             version "/byedpi-"
             (substring version 2) "-x86_64.tar.gz"))
       (sha256
        (base32 "0z8isxfagkif8xifh7scsh10zryrdqvzd46pi2yiwmybx8r3rxwq"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("ciadpi-x86_64" "bin/ciadpi"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/hufrea/byedpi")
    (synopsis "local SOCKS proxy for bypassing deep packet inspection")
    (description
     "ByeDPI is a local SOCKS proxy server that helps bypass deep packet
inspection (DPI) systems.  It works by modifying TCP connection parameters
to evade protocol fingerprinting.")
    (license license:expat)))

;;;
;;; ── 17. rt-bin ────────────────────────────────────────────────────────
;;; One command to run tasks across task runners
;;;
(define-public rt-bin
  (package
    (name "rt-bin")
    (version "0.1.9")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/unvalley/rt/releases/download/v"
             version "/rt-cli-x86_64-unknown-linux-gnu-v" version ".tgz"))
       (sha256
        (base32 "1812mpa23ssfabn22jcg5hxcssrx31d49mqmrlilv63a256czbdc"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~(list (list (string-append "rt-cli-x86_64-unknown-linux-gnu-v"
                                    #$(package-version this-package)
                                    "/rt")
                    "bin/rt"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/unvalley/rt")
    (synopsis "one command to run tasks across task runners")
    (description
     "Rt is a unified task runner that detects and delegates to the
appropriate underlying task runner (Make, npm, cargo, etc.) with
a single command.")
    (license license:expat)))

;;;
;;; ── 18. runa-bin ──────────────────────────────────────────────────────
;;; Fast and lightweight console file browser
;;;
(define-public runa-bin
  (package
    (name "runa-bin")
    (version "0.10.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/alexm-dev/runa/releases/download/v"
             version "/runa-linux-x86_64-gnu.tar.gz"))
       (sha256
        (base32 "06kki822srbl2h60b3msdipqgxbbzxfbmmq18vpnb1vrky1jrf4c"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("runa-linux-x86_64-gnu/rn" "bin/rn"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/alexm-dev/runa")
    (synopsis "fast and lightweight console file browser written in Rust")
    (description
     "Runa is a fast and lightweight console file browser written in Rust.
It provides a TUI for navigating the filesystem with vim-like keybindings.")
    (license (list license:asl2.0 license:expat))))

;;;
;;; ── 19. gryph-bin ─────────────────────────────────────────────────────
;;; AI coding agent audit trail tool
;;;
(define-public gryph-bin
  (package
    (name "gryph-bin")
    (version "0.6.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/safedep/gryph/releases/download/v"
             version "/gryph_Linux_x86_64.tar.gz"))
       (sha256
        (base32 "10cmayflrjxady9277zady8qmhi1z1j9dpx69my11jvh8gqrdi83"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("gryph" "bin/gryph"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/safedep/gryph")
    (synopsis "AI coding agent audit trail tool")
    (description
     "Gryph is a tool for auditing AI coding agent activity.  It tracks
changes made by AI agents and provides an audit trail for code review
and compliance purposes.")
    (license license:asl2.0)))

;;;
;;; ── 20. treekei-bin ───────────────────────────────────────────────────
;;; File tree with line counts
;;;
(define-public treekei-bin
  (package
    (name "treekei-bin")
    (version "0.2.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/zihao-liu-qs/treekei/releases/download/v"
             version "/treekei_linux_amd64.tar.gz"))
       (sha256
        (base32 "12pdv0fip2ypphq8aicvwczkzss8arrr1cslhshfk72qcmxaxp6q"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("treekei" "bin/treekei"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/zihao-liu-qs/treekei")
    (synopsis "file tree display with line counts")
    (description
     "Treekei displays a file tree with line counts for each file,
providing a quick overview of code size distribution across a project.")
    (license license:expat)))

;;;
;;; ── 21. xfr-bin ───────────────────────────────────────────────────────
;;; Modern iperf3 alternative with live TUI
;;;
(define-public xfr-bin
  (package
    (name "xfr-bin")
    (version "0.9.6")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/lance0/xfr/releases/download/v"
             version "/xfr-x86_64-unknown-linux-musl.tar.gz"))
       (sha256
        (base32 "1icla7y3l089vmfyi3ajjh7kv82aw0jp1ndb3ymjm9cx493isfi7"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("xfr" "bin/xfr"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/lance0/xfr")
    (synopsis "modern iperf3 alternative with a live TUI")
    (description
     "Xfr is a modern alternative to iperf3 for network throughput testing.
It features a live terminal UI, multi-client sessions, and ASN lookups.")
    (license (list license:asl2.0 license:expat))))

;;;
;;; ── 22. ttl-bin ───────────────────────────────────────────────────────
;;; Fast, modern traceroute with real-time TUI
;;;
(define-public ttl-bin
  (package
    (name "ttl-bin")
    (version "0.19.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/lance0/ttl/releases/download/v"
             version "/ttl-x86_64-unknown-linux-musl.tar.gz"))
       (sha256
        (base32 "1zfwglwkh51vdqsh1n0x34970l1zwb98r3zxs9rnw1mhcg8vyhr5"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("ttl" "bin/ttl"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/lance0/ttl")
    (synopsis "fast modern traceroute with real-time TUI")
    (description
     "TTL is a fast, modern traceroute tool with a real-time terminal UI,
per-hop statistics, and ASN lookups.  It provides a visual representation
of network paths and latency.")
    (license (list license:asl2.0 license:expat))))

;;;
;;; ── 23. xc-bin ────────────────────────────────────────────────────────
;;; Markdown defined task runner
;;;
(define-public xc-bin
  (package
    (name "xc-bin")
    (version "0.9.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/joerdav/xc/releases/download/v"
             version "/xc_" version "_linux_amd64.tar.gz"))
       (sha256
        (base32 "12bkzgy86f1wyansna94zjl50hdyzsaiw23wm1b7ymzpm3mwr6ka"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("xc" "bin/xc"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/joerdav/xc")
    (synopsis "markdown defined task runner")
    (description
     "Xc is a task runner that reads task definitions from Markdown files.
Tasks are defined as code blocks in @file{README.md} or any Markdown file,
making documentation and automation the same thing.")
    (license license:expat)))

;;;
;;; ── 24. pj-bin ────────────────────────────────────────────────────────
;;; Project Finder CLI
;;;
(define-public pj-bin
  (package
    (name "pj-bin")
    (version "1.14.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/josephschmitt/pj/releases/download/v"
             version "/pj_" version "_linux_amd64.tar.gz"))
       (sha256
        (base32 "0nyv9gmqq3kksmfpj6war46w8d588kpg8vvhq7d854r9sb1l9d5a"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("pj" "bin/pj"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/josephschmitt/pj")
    (synopsis "project finder CLI for quick directory navigation")
    (description
     "Pj is a project finder CLI that lets you quickly navigate to project
directories.  It indexes your workspace and provides fuzzy matching to
jump between projects.")
    (license license:expat)))

;;;
;;; ── 25. openlist-bin ──────────────────────────────────────────────────
;;; AList fork file listing server
;;;
(define-public openlist-bin
  (package
    (name "openlist-bin")
    (version "4.1.10")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/OpenListTeam/OpenList/releases/download/v"
             version "/openlist-linux-amd64.tar.gz"))
       (sha256
        (base32 "1qrnssw49q4mi5pyimb8qvmp31f0w8z7ladgpvm56a79d2s0lr58"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("openlist" "bin/openlist"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/OpenListTeam/OpenList")
    (synopsis "file listing and sharing server supporting multiple storage backends")
    (description
     "OpenList is a file listing and sharing server that supports multiple
storage backends including local disk, S3, WebDAV, and many cloud
providers.  It provides a web-based file manager interface.")
    (license license:agpl3)))

;;;
;;; ── 26. bbdown-bin ────────────────────────────────────────────────────
;;; Bilibili video downloader
;;;
(define-public bbdown-bin
  (package
    (name "bbdown-bin")
    (version "1.6.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/nilaoda/BBDown/releases/download/"
             version "/BBDown_" version "_20240814_linux-x64.zip"))
       (sha256
        (base32 "03niwnbqxamb1243lx05qrypafpm8gimph6s8x2crca0imykn8zc"))))
    (build-system copy-build-system)
    (native-inputs (list unzip))
    (arguments
     (list
      #:install-plan
      #~'(("BBDown" "bin/bbdown"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nilaoda/BBDown")
    (synopsis "command-line Bilibili video downloader")
    (description
     "BBDown is a command-line tool for downloading videos from Bilibili
(bilibili.com).  It supports multiple quality options, batch downloads,
and subtitle extraction.")
    (license license:expat)))

;;;
;;; ── 27. geoclue-tz-bin ───────────────────────────────────────────────
;;; Generate geoclue location from timezone
;;;
(define-public geoclue-tz-bin
  (package
    (name "geoclue-tz-bin")
    (version "1.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/zquestz/geoclue-tz/releases/download/v"
             version "/geoclue-tz-linux_amd64.zip"))
       (sha256
        (base32 "1bvy22cjwl1dv6vnni1xbd501rzvsr2damxqq390xsw9150dry52"))))
    (build-system copy-build-system)
    (native-inputs (list unzip))
    (arguments
     (list
      #:install-plan
      #~'(("geoclue-tz" "bin/geoclue-tz"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/zquestz/geoclue-tz")
    (synopsis "generate geoclue location based on current timezone")
    (description
     "Geoclue-tz generates a geoclue-compatible @file{/etc/geolocation}
file based on the current system timezone.  Useful for systems that need
location data without a GPS or network-based geolocation service.")
    (license license:expat)))

;;;
;;; ── 28. buck2-bin ─────────────────────────────────────────────────────
;;; Large-scale build system from Meta
;;;
(define-public buck2-bin
  (package
    (name "buck2-bin")
    (version "2026.03.15")
    (source
     (origin
       (method url-fetch)
       (uri (let ((formatted (string-join
                              (string-split version #\.) "-")))
              (string-append
               "https://github.com/facebook/buck2/releases/download/"
               formatted "/buck2-x86_64-unknown-linux-gnu.zst")))
       (sha256
        (base32 "0ppw86g31v6n1ww50c3iljzbxc5p82bzk9spkx3ygni3w6v86qrl"))))
    (build-system trivial-build-system)
    (native-inputs (list zstd))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (bin (string-append out "/bin"))
                 (src (assoc-ref %build-inputs "source"))
                 (zstd (string-append
                        (assoc-ref %build-inputs "zstd") "/bin/zstd")))
            (mkdir-p bin)
            (invoke zstd "-d" src "-o" (string-append bin "/buck2"))
            (chmod (string-append bin "/buck2") #o755)
            #t))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/facebook/buck2")
    (synopsis "large-scale build system from Meta")
    (description
     "Buck2 is a large-scale build system developed by Meta.  Written in
Rust, it supports remote execution, fine-grained parallelism, and
language-agnostic build rules.  It is designed for monorepos with
millions of files.")
    (license (list license:asl2.0 license:expat))))

;;;
;;; ── 29. libdeep-filter-ladspa-bin ─────────────────────────────────────
;;; LADSPA plugin for deep noise filtering
;;;
(define-public libdeep-filter-ladspa-bin
  (package
    (name "libdeep-filter-ladspa-bin")
    (version "0.5.6")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/Rikorose/DeepFilterNet/releases/download/v"
             version "/libdeep_filter_ladspa-" version
             "-x86_64-unknown-linux-gnu.so"))
       (sha256
        (base32 "0di2bqrjn9a8h8fbijmma81db5smfh728sl299h8klqi55f218rc"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (lib (string-append out "/lib/ladspa"))
                 (src (assoc-ref %build-inputs "source")))
            (mkdir-p lib)
            (copy-file src (string-append lib "/libdeep_filter_ladspa.so"))
            (chmod (string-append lib "/libdeep_filter_ladspa.so") #o644)
            #t))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Rikorose/DeepFilterNet")
    (synopsis "LADSPA plugin for real-time deep noise suppression")
    (description
     "DeepFilterNet LADSPA plugin provides real-time noise suppression for
full-band audio (48 kHz) using deep filtering.  It can be used with
PipeWire, PulseAudio, or any LADSPA-compatible audio host to remove
background noise from microphone input.")
    (license license:expat)))

;;;
;;; ── 30. cli-proxy-api-bin ─────────────────────────────────────────────
;;; Proxy server with OpenAI/Gemini/Claude compatible API
;;;
(define-public cli-proxy-api-bin
  (package
    (name "cli-proxy-api-bin")
    (version "6.9.16")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/router-for-me/CLIProxyAPI/releases/download/v"
             version "/CLIProxyAPI_" version "_linux_amd64.tar.gz"))
       (sha256
        (base32 "03sh3rd9ar4hbfbarivjxxn8v8z0w77xvj69bqja3yscqm28pars"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("CLIProxyAPI" "bin/cliproxyapi"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/router-for-me/CLIProxyAPI")
    (synopsis "proxy server providing OpenAI/Gemini/Claude compatible API")
    (description
     "CLIProxyAPI is a proxy server that provides API interfaces compatible
with OpenAI, Google Gemini, and Anthropic Claude.  It enables routing
requests between different LLM providers through a unified interface.")
    (license license:expat)))
