;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260413f
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages:
;;;   - 23 recipes created
;;;   - 7 blocked with specific reason codes
;;;
;;; Recipes (23):
;;;   - seija (copy, gpl3+)
;;;   - sizeof-tool (copy, gpl3+)
;;;   - teevee (copy, expat)
;;;   - wl-kaomoji (copy, expat)
;;;   - nextdns-bin (copy, expat)
;;;   - intermodal-bin (copy, cc0)
;;;   - ov-bin (copy, expat)
;;;   - torrserver-bin (copy, gpl3+)
;;;   - rjq-bin (copy, expat)
;;;   - tmpo-bin (copy, expat)
;;;   - dol-bin (copy, expat)
;;;   - sq-bin (copy, expat)
;;;   - mynav-bin (copy, expat)
;;;   - solv-bin (copy, expat)
;;;   - superdb-bin (copy, bsd-3)
;;;   - whosthere-bin (copy, expat)
;;;   - timeprefix (gnu, isc)
;;;   - vtchs (gnu, isc)
;;;   - passcheck (gnu, agpl3+)
;;;   - sleep-until (gnu, isc)
;;;   - srm (gnu, non-copyleft)
;;;   - python-pybufrkit (python, expat)
;;;   - python-face-recognition-models (python, cc0)
;;;
;;; Blocked (7):
;;;   - python-influxdb-client (NEEDS_RECIPE_DESIGN)
;;;   - extramaus (NEEDS_RECIPE_DESIGN)
;;;   - monika-after-story (NEEDS_RECIPE_DESIGN)
;;;   - xattrvi (NEEDS_RECIPE_DESIGN)
;;;   - kfr (NEEDS_RECIPE_DESIGN)
;;;   - lavacli (NEEDS_RECIPE_DESIGN)
;;;   - dmscripts-git (NEEDS_RECIPE_DESIGN)
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros) unless noted.
;;; Run `guix download <url>` to obtain real hashes before building.

(define-module (gaurix packages recipe-resolver-260413f)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system python)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages check)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages xdisorg)
  #:export (
            seija
            sizeof-tool
            teevee
            wl-kaomoji
            nextdns-bin
            intermodal-bin
            ov-bin
            torrserver-bin
            rjq-bin
            tmpo-bin
            dol-bin
            sq-bin
            mynav-bin
            solv-bin
            superdb-bin
            whosthere-bin
            timeprefix
            vtchs
            passcheck
            sleep-until
            srm
            python-pybufrkit
            python-face-recognition-models
            ))

;;; ── seija ─────────────────────────────────────────────────────────────
;;; Prints text flipped and reversed (upside-down text)
;;; AUR: seija  →  Guix: seija
;;; Upstream: https://github.com/0xraincandy/seija
;;;
(define-public seija
  (package
    (name "seija")
    (version "1.0.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/0xraincandy/seija")
             (commit (string-append "version" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("seija" "bin/seija"))))
    (inputs (list python-3))
    (synopsis "print text flipped and reversed (upside-down)")
    (description
     "Seija is a small script that prints text flipped and reversed,
producing upside-down text output.  It can be used for fun text
transformations in the terminal.")
    (home-page "https://github.com/0xraincandy/seija")
    (license license:gpl3+)))

;;; ── sizeof-tool ───────────────────────────────────────────────────────
;;; Find the size of files and directories
;;; AUR: sizeof  →  Guix: sizeof-tool
;;; Upstream: https://github.com/ASHWIN990/sizeof
;;;
(define-public sizeof-tool
  (package
    (name "sizeof-tool")
    (version "0.37")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/ASHWIN990/sizeof")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("sizeof" "bin/sizeof"))))
    (inputs (list python-3))
    (synopsis "find the size of files and directories")
    (description
     "Sizeof is a command-line tool written in Python that displays file
and directory sizes in a human-readable format.  It provides a simple
interface for quickly checking disk usage.")
    (home-page "https://github.com/ASHWIN990/sizeof")
    (license license:gpl3+)))

;;; ── teevee ────────────────────────────────────────────────────────────
;;; Single-button cyclic launcher using dunst notifications
;;; AUR: teevee  →  Guix: teevee
;;; Upstream: https://github.com/ThomasB3143/teevee
;;;
(define-public teevee
  (package
    (name "teevee")
    (version "1.0.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/ThomasB3143/teevee")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("teevee" "bin/teevee"))))
    (inputs (list bash))
    (synopsis "single-button cyclic launcher using dunst notifications")
    (description
     "Teevee is a minimal bash script that implements a single-button
cyclic launcher using dunst desktop notifications.  It cycles through
a configurable list of applications on each invocation.")
    (home-page "https://github.com/ThomasB3143/teevee")
    (license license:expat)))

;;; ── wl-kaomoji ────────────────────────────────────────────────────────
;;; Wayland kaomoji picker using wofi
;;; AUR: wl-kaomoji  →  Guix: wl-kaomoji
;;; Upstream: https://github.com/xo-xo-xo-xo/wl-kaomoji
;;;
(define-public wl-kaomoji
  (package
    (name "wl-kaomoji")
    (version "1.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/xo-xo-xo-xo/wl-kaomoji")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("wl-kaomoji" "bin/wl-kaomoji")
               ("emoticons.json" "share/wl-kaomoji/emoticons.json"))))
    (inputs (list bash wofi wl-clipboard))
    (synopsis "wayland kaomoji picker using wofi")
    (description
     "Wl-kaomoji is a kaomoji picker for Wayland compositors.  It uses
wofi as a menu interface and wl-clipboard for copying the selected
kaomoji to the clipboard.")
    (home-page "https://github.com/xo-xo-xo-xo/wl-kaomoji")
    (license license:expat)))

;;; ── nextdns-bin ───────────────────────────────────────────────────────
;;; NextDNS DNS/53 to DoH proxy (prebuilt binary)
;;; AUR: nextdns-bin  →  Guix: nextdns-bin
;;; Upstream: https://github.com/nextdns/nextdns
;;;
(define-public nextdns-bin
  (package
    (name "nextdns-bin")
    (version "1.47.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/nextdns/nextdns/releases/download/v"
             version "/nextdns_" version "_linux_amd64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("nextdns" "bin/nextdns"))))
    (synopsis "DNS/53 to DNS-over-HTTPS proxy for NextDNS")
    (description
     "NextDNS is a DNS/53 to DNS-over-HTTPS (DoH) proxy that routes DNS
queries through the NextDNS service.  It provides ad blocking, analytics,
and security features at the DNS level.")
    (home-page "https://github.com/nextdns/nextdns")
    (license license:expat)))

;;; ── intermodal-bin ────────────────────────────────────────────────────
;;; BitTorrent metainfo utility (prebuilt binary)
;;; AUR: intermodal-bin  →  Guix: intermodal-bin
;;; Upstream: https://github.com/casey/intermodal
;;;
(define-public intermodal-bin
  (package
    (name "intermodal-bin")
    (version "0.1.16")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/casey/intermodal/releases/download/v"
             version "/imdl-v" version
             "-x86_64-unknown-linux-musl.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("imdl" "bin/imdl"))))
    (synopsis "user-friendly BitTorrent metainfo utility")
    (description
     "Intermodal is a user-friendly and featureful command-line BitTorrent
metainfo utility.  It can create, display, and verify @file{.torrent} files
with an intuitive interface.")
    (home-page "https://github.com/casey/intermodal")
    (license license:cc0)))

;;; ── ov-bin ────────────────────────────────────────────────────────────
;;; Feature-rich terminal-based text viewer (prebuilt binary)
;;; AUR: ov-bin  →  Guix: ov-bin
;;; Upstream: https://github.com/noborus/ov
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
     (list #:install-plan
           #~'(("ov" "bin/ov"))))
    (native-inputs (list unzip))
    (synopsis "feature-rich terminal-based text viewer")
    (description
     "Ov is a feature-rich terminal pager that supports features like
section-based navigation, word wrapping, column mode, and multi-color
highlighting.  It is an alternative to less with enhanced capabilities.")
    (home-page "https://github.com/noborus/ov")
    (license license:expat)))

;;; ── torrserver-bin ────────────────────────────────────────────────────
;;; Torrent to HTTP streamer (prebuilt binary)
;;; AUR: torrserver-bin  →  Guix: torrserver-bin
;;; Upstream: https://github.com/YouROK/TorrServer
;;;
(define-public torrserver-bin
  (package
    (name "torrserver-bin")
    (version "141")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/YouROK/TorrServer/releases/download/"
             "MatriX." version "/TorrServer-linux-amd64"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("TorrServer-linux-amd64" "bin/torrserver"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'unpack 'make-executable
                 (lambda _
                   (chmod "TorrServer-linux-amd64" #o755))))))
    (synopsis "stream media from torrents via HTTP")
    (description
     "TorrServer is a torrent-to-HTTP streaming server that allows streaming
media content from torrent files without needing to download them fully
first.  It provides an HTTP API for media player integration.")
    (home-page "https://github.com/YouROK/TorrServer")
    (license license:gpl3+)))

;;; ── rjq-bin ───────────────────────────────────────────────────────────
;;; Simple and fast JSON filtering tool (prebuilt binary)
;;; AUR: rjq-bin  →  Guix: rjq-bin
;;; Upstream: https://github.com/mainak55512/rjq
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
     (list #:install-plan
           #~'(("rjq" "bin/rjq"))))
    (synopsis "simple and fast JSON filtering tool")
    (description
     "Rjq is a lightweight command-line JSON filtering tool written in Rust.
It provides a simple query syntax for extracting values from JSON data,
similar to jq but with a smaller footprint.")
    (home-page "https://github.com/mainak55512/rjq")
    (license license:expat)))

;;; ── tmpo-bin ──────────────────────────────────────────────────────────
;;; Minimal CLI time tracker (prebuilt binary)
;;; AUR: tmpo-bin  →  Guix: tmpo-bin
;;; Upstream: https://github.com/DylanDevelops/tmpo
;;;
(define-public tmpo-bin
  (package
    (name "tmpo-bin")
    (version "0.6.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/DylanDevelops/tmpo/releases/download/v"
             version "/tmpo_" version "_Linux_x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("tmpo" "bin/tmpo"))))
    (synopsis "minimal CLI time tracker for developers")
    (description
     "Tmpo is a minimal command-line time tracker designed for developers.
It provides simple start, stop, and reporting commands for tracking time
spent on tasks directly from the terminal.")
    (home-page "https://github.com/DylanDevelops/tmpo")
    (license license:expat)))

;;; ── dol-bin ───────────────────────────────────────────────────────────
;;; Detect dark/light mode on the CLI (prebuilt binary)
;;; AUR: dol-bin  →  Guix: dol-bin
;;; Upstream: https://github.com/netmute/dol
;;;
(define-public dol-bin
  (package
    (name "dol-bin")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/netmute/dol/releases/download/v"
             version "/dol_Linux_x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("dol" "bin/dol"))))
    (synopsis "detect dark or light mode on the command line")
    (description
     "Dol is a command-line utility that detects whether the current terminal
or desktop environment is using dark or light mode.  It can be used in
shell scripts to adapt output styling to the current theme.")
    (home-page "https://github.com/netmute/dol")
    (license license:expat)))

;;; ── sq-bin ────────────────────────────────────────────────────────────
;;; Data wrangler CLI (prebuilt binary)
;;; AUR: sq-bin  →  Guix: sq-bin
;;; Upstream: https://sq.io
;;;
(define-public sq-bin
  (package
    (name "sq-bin")
    (version "0.48.5")
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
     (list #:install-plan
           #~'(("sq" "bin/sq"))))
    (synopsis "data wrangler for databases and document formats")
    (description
     "Sq is a command-line data wrangler that provides a unified interface
for querying databases (Postgres, MySQL, SQLite, SQL Server) and document
formats (CSV, TSV, JSON, Excel) using a jq-like syntax.")
    (home-page "https://sq.io")
    (license license:expat)))

;;; ── mynav-bin ─────────────────────────────────────────────────────────
;;; Workspace and session management TUI (prebuilt binary)
;;; AUR: mynav-bin  →  Guix: mynav-bin
;;; Upstream: https://github.com/GianlucaP106/mynav
;;;
(define-public mynav-bin
  (package
    (name "mynav-bin")
    (version "2.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/GianlucaP106/mynav/releases/download/v"
             version "/mynav_Linux_x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("mynav" "bin/mynav"))))
    (synopsis "workspace and session management TUI")
    (description
     "Mynav is a terminal user interface for managing workspaces and sessions.
It provides fast navigation between projects, integrated tmux session
management, and workspace organization features.")
    (home-page "https://github.com/GianlucaP106/mynav")
    (license license:expat)))

;;; ── solv-bin ──────────────────────────────────────────────────────────
;;; Solution validation tool (prebuilt binary)
;;; AUR: solv-bin  →  Guix: solv-bin
;;; Upstream: https://github.com/aegoroff/solv
;;;
(define-public solv-bin
  (package
    (name "solv-bin")
    (version "0.18.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/aegoroff/solv/releases/download/"
             version "/solv-" version
             "-x86_64-unknown-linux-musl.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("solv" "bin/solv"))))
    (synopsis "solution validation tool for Visual Studio files")
    (description
     "Solv is a command-line tool that analyzes Microsoft Visual Studio
solution (.sln) files and project files.  It validates structure, detects
issues, and provides diagnostic information about solution configurations.")
    (home-page "https://github.com/aegoroff/solv")
    (license license:expat)))

;;; ── superdb-bin ───────────────────────────────────────────────────────
;;; Analytics database for JSON and relational data (prebuilt binary)
;;; AUR: superdb-bin  →  Guix: superdb-bin
;;; Upstream: https://github.com/brimdata/super
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
     (list #:install-plan
           #~'(("super" "bin/super")
               ("superdb" "bin/superdb"))))
    (synopsis "analytics database for JSON and relational data")
    (description
     "Super is an analytics database that combines JSON and relational data
models.  It provides a command-line interface for querying, transforming,
and analyzing data from various sources using the Super data model.")
    (home-page "https://github.com/brimdata/super")
    (license license:bsd-3)))

;;; ── whosthere-bin ─────────────────────────────────────────────────────
;;; LAN discovery tool with modern TUI (prebuilt binary)
;;; AUR: whosthere-bin  →  Guix: whosthere-bin
;;; Upstream: https://github.com/ramonvermeulen/whosthere
;;;
(define-public whosthere-bin
  (package
    (name "whosthere-bin")
    (version "0.7.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/ramonvermeulen/whosthere/releases/download/v"
             version "/whosthere_" version "_linux_amd64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("whosthere" "bin/whosthere"))))
    (synopsis "local area network discovery tool with modern TUI")
    (description
     "Whosthere is a local area network discovery tool that provides a modern
terminal user interface.  It scans the local network to identify connected
devices and displays their information in an interactive view.")
    (home-page "https://github.com/ramonvermeulen/whosthere")
    (license license:expat)))

;;; ── timeprefix ────────────────────────────────────────────────────────
;;; Prefix each line with the time it was written
;;; AUR: timeprefix  →  Guix: timeprefix
;;; Upstream: https://codeberg.org/maandree/timeprefix
;;;
(define-public timeprefix
  (package
    (name "timeprefix")
    (version "3.1.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://codeberg.org/maandree/timeprefix")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "PREFIX=" #$output)
                   (string-append "CC=" (or (getenv "CC") "gcc")))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (synopsis "prefix each line with the time it was written")
    (description
     "Timeprefix reads lines from standard input and prints each line
prefixed with the timestamp of when it was received.  It is useful for
adding timing information to the output of long-running processes.")
    (home-page "https://codeberg.org/maandree/timeprefix")
    (license license:isc)))

;;; ── vtchs ─────────────────────────────────────────────────────────────
;;; Listen for VT (virtual terminal) switches
;;; AUR: vtchs  →  Guix: vtchs
;;; Upstream: https://codeberg.org/maandree/vtchs
;;;
(define-public vtchs
  (package
    (name "vtchs")
    (version "1.1.4")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://codeberg.org/maandree/vtchs")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "PREFIX=" #$output)
                   (string-append "CC=" (or (getenv "CC") "gcc")))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (synopsis "listen for virtual terminal switches")
    (description
     "Vtchs listens for Linux virtual terminal (VT) switches and executes
a command when a switch occurs.  It is useful for triggering actions when
the user switches between virtual consoles.")
    (home-page "https://codeberg.org/maandree/vtchs")
    (license license:isc)))

;;; ── passcheck ─────────────────────────────────────────────────────────
;;; Passphrase strength evaluator
;;; AUR: passcheck  →  Guix: passcheck
;;; Upstream: https://github.com/maandree/passcheck
;;;
(define-public passcheck
  (package
    (name "passcheck")
    (version "1.6")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/maandree/passcheck")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "PREFIX=" #$output)
                   (string-append "CC=" (or (getenv "CC") "gcc")))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (synopsis "passphrase strength evaluator")
    (description
     "Passcheck is a command-line tool for evaluating the strength of
passphrases.  It analyzes the entropy and patterns in passwords to provide
a strength assessment.")
    (home-page "https://github.com/maandree/passcheck")
    (license license:agpl3+)))

;;; ── sleep-until ───────────────────────────────────────────────────────
;;; Sleep until a specified time
;;; AUR: sleep-until  →  Guix: sleep-until
;;; Upstream: https://codeberg.org/maandree/sleep-until
;;;
(define-public sleep-until
  (package
    (name "sleep-until")
    (version "2.0.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://codeberg.org/maandree/sleep-until")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "PREFIX=" #$output)
                   (string-append "CC=" (or (getenv "CC") "gcc")))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (synopsis "sleep until a specified time")
    (description
     "Sleep-until is a command-line utility that sleeps until a specified
date and time.  Unlike @command{sleep} which takes a duration, this tool
takes an absolute time specification as its argument.")
    (home-page "https://codeberg.org/maandree/sleep-until")
    (license license:isc)))

;;; ── srm ───────────────────────────────────────────────────────────────
;;; Secure replacement for rm(1)
;;; AUR: srm  →  Guix: srm
;;; Upstream: http://srm.sourceforge.net/
;;;
(define-public srm
  (package
    (name "srm")
    (version "1.2.15")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "mirror://sourceforge/srm/" version
             "/srm-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (synopsis "secure replacement for rm that overwrites data")
    (description
     "Srm is a command-line tool that provides a secure replacement for
@command{rm}.  It overwrites the contents of files before unlinking them,
making recovery of deleted data significantly more difficult.  It supports
multiple overwrite patterns based on established data destruction standards.")
    (home-page "http://srm.sourceforge.net/")
    (license (license:non-copyleft
              "file://COPYING"
              "Custom permissive license"))))

;;; ── python-pybufrkit ──────────────────────────────────────────────────
;;; Pure Python toolkit for WMO BUFR messages
;;; AUR: python-pybufrkit  →  Guix: python-pybufrkit
;;; Upstream: https://github.com/ywangd/pybufrkit
;;;
(define-public python-pybufrkit
  (package
    (name "python-pybufrkit")
    (version "0.2.25")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/ywangd/pybufrkit")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system python-build-system)
    (arguments
     (list #:tests? #f))
    (propagated-inputs (list python-bitstring python-six))
    (synopsis "pure Python toolkit for WMO BUFR messages")
    (description
     "Pybufrkit is a pure Python toolkit for working with WMO BUFR
(Binary Universal Form for the Representation of meteorological data)
messages.  It can decode, encode, and manipulate BUFR data used in
meteorological and environmental data exchange.")
    (home-page "https://github.com/ywangd/pybufrkit")
    (license license:expat)))

;;; ── python-face-recognition-models ────────────────────────────────────
;;; Trained models for the face_recognition Python library
;;; AUR: python-face_recognition_models  →  Guix: python-face-recognition-models
;;; Upstream: https://github.com/ageitgey/face_recognition_models
;;;
(define-public python-face-recognition-models
  (package
    (name "python-face-recognition-models")
    (version "0.3.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/ageitgey/face_recognition_models")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system python-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "trained models for the face_recognition Python library")
    (description
     "This package provides pre-trained models for the face_recognition
Python library.  The models are used for face detection, face encoding,
and face landmark detection.")
    (home-page "https://github.com/ageitgey/face_recognition_models")
    (license license:cc0)))
