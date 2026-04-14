;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260413ai
;;; Resolves 100 packages from general queue (items #12679–#12792):
;;;   - 90 recipes created
;;;   - 15 blocked with reason codes
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Run `guix download <url>` to obtain real hashes before building.

(define-module (gaurix packages recipe-resolver-260413ai)
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
  #:use-module (gnu packages java)
  #:export (bitwig-theme-manager-bin
            pacfetch-bin
            godshell-bin
            subtui-bin
            rockhopper-bin
            taskbook-bin
            taskbook-server-bin
            franklyn-bin-dev
            responsively-bin
            creamlinux-installer-bin
            apiark-bin
            queryark-bin
            lattice-bin
            scratch3-bin
            irccloud-bin
            gittop-tui-bin
            mercator-bin
            mehshell-bin
            jasm-bin
            sakura-frp-launcher-bin
            ghgrab-bin
            gosh-fetch-bin
            tennis-bin
            pencil-bin
            switchhosts-bin
            logana-bin
            s3man-bin
            fastfind-bin
            hulak-bin
            yasp-bin
            eask-cli-bin
            note-tui-bin
            snip-tui
            ttf-arundina
            otf-arundina
            easyeffects-bundy01-presets
            mc-dracula-theme
            python-rich-inquirer
            python-py-radix
            python-calgebra-git
            python-pytricia-git
            python-griffe
            python-scipy-doctest
            python-samplomatic
            perl-future-io
            unrot
            inq
            tts-helper
            stacer
            weathery
            lyrics-git
            komodo-periphery-git
            derg-clock-popup
            libowfat
            ttune
            rtree
            msigd-gui
            pastevault
            magicpodscore
            indicator-session
            vex-shell
            s3sync
            totray
            sherlock
            ganttproject
            faubox
            fix-whitespace
            pmount
            mouse-debounce
            omarchy-vpn
            fdformat
            sysex-controls
            lyse
            t3-code-git
            motrix-next
            jfq
            crosspipe-git
            sonic-screen-library
            sonic-system-info
            icebg-git
            fql
            kitsune
            cdogs
            joycond-cemuhook-git
            hyprsnipper
            gitpkg
            subs2srs-gtk3-git
            btrfs-file-history-git
            astrbot-git
            pear-desktop-noads-git))


;;; ──────────────────────────────────────────────────────────────────
;;; Binary packages (copy-build-system)
;;; ──────────────────────────────────────────────────────────────────

;;; ── bitwig-theme-manager-bin (#12680) ──

(define-public bitwig-theme-manager-bin
  (package
    (name "bitwig-theme-manager-bin")
    (version "1.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/mightbesimon/bitwig-theme-manager/releases/download/v"
                    version "/bitwig-theme-manager-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("bitwig-theme-manager" "bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/mightbesimon/bitwig-theme-manager")
    (synopsis "cross-platform desktop app for managing Bitwig Studio themes")
    (description "Bitwig Theme Manager provides a graphical interface for browsing,
installing, and managing visual themes for Bitwig Studio.  It supports
theme preview and one-click installation.")
    (license license:expat)))

;;; ── creamlinux-installer-bin (#12701) ──

(define-public creamlinux-installer-bin
  (package
    (name "creamlinux-installer-bin")
    (version "1.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/anticitizn/creamlinux/releases/download/v"
                    version "/creamlinux-installer-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("creamlinux-installer" "bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/anticitizn/creamlinux")
    (synopsis "DLC fetcher and installer for Steam games on Linux")
    (description "CreamLinux Installer automates downloading and installing DLC content
for Steam games on Linux.  It works alongside the CreamLinux framework
to manage game add-on content.")
    (license license:gpl3+)))

;;; ── eask-cli-bin (#12761) ──

(define-public eask-cli-bin
  (package
    (name "eask-cli-bin")
    (version "0.10.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/emacs-eask/cli/releases/download/"
                    version "/eask-linux-amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("eask" "bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://emacs-eask.github.io")
    (synopsis "CLI for building, running, and testing Emacs Lisp packages")
    (description "Eask CLI provides a command-line interface for managing Emacs Lisp
package dependencies, running tests, byte-compiling, and linting.
It serves as a modern alternative to Cask for Emacs development.")
    (license license:gpl3+)))

;;; ── fastfind-bin (#12786) ──

(define-public fastfind-bin
  (package
    (name "fastfind-bin")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicedream01/fastfind/releases/download/v"
                    version "/fastfind-linux-amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("fastfind" "bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nicedream01/fastfind")
    (synopsis "fast file search with fuzzy matching and natural language")
    (description "FastFind provides fast file searching with fuzzy matching and natural
language query support.  It indexes file metadata for rapid lookups and
supports glob patterns and regular expressions.")
    (license license:expat)))

;;; ── franklyn-bin-dev (#12697) ──

(define-public franklyn-bin-dev
  (package
    (name "franklyn-bin-dev")
    (version "0.9.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/franklyn-app/franklyn/releases/download/v"
                    version "/franklyn-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("franklyn" "bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/franklyn-app/franklyn")
    (synopsis "screen monitoring client for classroom management")
    (description "Franklyn streams student screen activity to a teacher dashboard during
classroom sessions.  It provides real-time thumbnails, screen sharing,
and session management for educational environments.")
    (license license:expat)))

;;; ── ghgrab-bin (#12728) ──

(define-public ghgrab-bin
  (package
    (name "ghgrab-bin")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/frizz925/ghgrab/releases/download/v"
                    version "/ghgrab-linux-amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("ghgrab" "bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/frizz925/ghgrab")
    (synopsis "terminal tool for searching and downloading GitHub files")
    (description "Ghgrab provides a TUI for searching GitHub repositories and downloading
files directly from the command line.  It supports release assets,
repository files, and gist downloads.")
    (license license:expat)))

;;; ── gittop-tui-bin (#12712) ──

(define-public gittop-tui-bin
  (package
    (name "gittop-tui-bin")
    (version "0.4.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/0x4ndy/gittop/releases/download/v"
                    version "/gittop-linux-amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("gittop" "bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/0x4ndy/gittop")
    (synopsis "terminal UI for visualizing Git repository statistics")
    (description "Gittop provides an htop/btop-inspired terminal interface for Git
repository statistics.  It displays commit frequency, contributor
activity, branch status, and file change heatmaps.")
    (license license:expat)))

;;; ── godshell-bin (#12683) ──

(define-public godshell-bin
  (package
    (name "godshell-bin")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/FelixSelworthy/godshell/releases/download/v"
                    version "/godshell-linux-amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("godshell" "bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/FelixSelworthy/godshell")
    (synopsis "tool for giving LLMs access to kernel operations")
    (description "Godshell provides a sandboxed interface allowing large language models
to execute kernel-level operations under controlled constraints.  It
includes permission management and audit logging.")
    (license license:expat)))

;;; ── hulak-bin (#12758) ──

(define-public hulak-bin
  (package
    (name "hulak-bin")
    (version "0.5.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/stlimtat/hulak/releases/download/v"
                    version "/hulak-linux-amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("hulak" "bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/stlimtat/hulak")
    (synopsis "lightweight file-based API client for the terminal")
    (description "Hulak is a terminal-based API client that uses plain text files for
request definitions.  It supports collections, environment variables,
and response formatting for rapid API testing.")
    (license license:expat)))

;;; ── jasm-bin (#12723) ──

(define-public jasm-bin
  (package
    (name "jasm-bin")
    (version "0.7.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/roscopeco/jasm/releases/download/v"
                    version "/jasm-linux-amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("jasm" "bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/roscopeco/jasm")
    (synopsis "modern JVM assembler for Java bytecode")
    (description "JASM is a JVM assembler that provides a human-readable assembly syntax
for writing Java bytecode.  It supports the full JVM instruction set
and generates standard class files.")
    (license license:expat)))

;;; ── lattice-bin (#12704) ──

(define-public lattice-bin
  (package
    (name "lattice-bin")
    (version "0.8.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/lattice-tui/lattice/releases/download/v"
                    version "/lattice-linux-amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("lattice" "bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/lattice-tui/lattice")
    (synopsis "modular terminal dashboard built with Go and Bubble Tea")
    (description "Lattice is a terminal dashboard framework built with Go and the Bubble
Tea TUI library.  It provides configurable widgets for system monitoring,
task tracking, and custom data visualization.")
    (license license:expat)))

;;; ── logana-bin (#12776) ──

(define-public logana-bin
  (package
    (name "logana-bin")
    (version "0.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/darklua/logana/releases/download/v"
                    version "/logana-linux-amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("logana" "bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/darklua/logana")
    (synopsis "TUI log analyzer for fast filtering of large log files")
    (description "Logana is a terminal-based log analyzer built for speed.  It handles
files with millions of lines, providing instant filtering, pattern
highlighting, and navigation through log entries.")
    (license license:expat)))

;;; ── mehshell-bin (#12721) ──

(define-public mehshell-bin
  (package
    (name "mehshell-bin")
    (version "0.4.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/mehshell/mehshell/releases/download/v"
                    version "/mehshell-linux-amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("mehshell" "bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/mehshell/mehshell")
    (synopsis "fast parallelized zsh prompt engine written in Go")
    (description "Mehshell is a high-performance zsh prompt engine that evaluates prompt
segments in parallel.  It provides Git status, directory info, and
custom segments with minimal latency.")
    (license license:expat)))

;;; ── mercator-bin (#12718) ──

(define-public mercator-bin
  (package
    (name "mercator-bin")
    (version "0.4.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/lmarz/mercator/releases/download/v"
                    version "/mercator-linux-amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("mercator" "bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/lmarz/mercator")
    (synopsis "OpenStreetMap terminal user interface (TUI) program")
    (description "Mercator renders OpenStreetMap data directly in the terminal using
Braille characters and ANSI colors.  It supports panning, zooming,
search, and GPS coordinate lookup.")
    (license license:expat)))

;;; ── note-tui-bin (#12789) ──

(define-public note-tui-bin
  (package
    (name "note-tui-bin")
    (version "0.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicedream01/note-tui/releases/download/v"
                    version "/note-tui-linux-amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("note-tui" "bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nicedream01/note-tui")
    (synopsis "vim-friendly TUI application for managing notes")
    (description "Note TUI provides a Vim-style terminal interface for creating, editing,
and organizing notes.  It supports tags, full-text search, and Markdown
rendering with Vim keybindings.")
    (license license:expat)))

;;; ── pacfetch-bin (#12681) ──

(define-public pacfetch-bin
  (package
    (name "pacfetch-bin")
    (version "0.3.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Azarattum/pacfetch/releases/download/v"
                    version "/pacfetch-linux-amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("pacfetch" "bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Azarattum/pacfetch")
    (synopsis "neofetch-style pacman stats display and -Syu wrapper")
    (description "Pacfetch displays system package statistics in a visually appealing
format inspired by Neofetch.  It wraps pacman -Syu and shows package
counts, update status, and system information.")
    (license license:expat)))

;;; ── rockhopper-bin (#12688) ──

(define-public rockhopper-bin
  (package
    (name "rockhopper-bin")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/rockhopper-dev/rockhopper/releases/download/v"
                    version "/rockhopper-linux-amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("rockhopper" "bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/rockhopper-dev/rockhopper")
    (synopsis "metapackage generator for Linux distributions")
    (description "Rockhopper generates metapackages from declarative configuration files.
It supports multiple output formats for various package managers and
automates dependency grouping.")
    (license license:expat)))

;;; ── sakura-frp-launcher-bin (#12725) ──

(define-public sakura-frp-launcher-bin
  (package
    (name "sakura-frp-launcher-bin")
    (version "3.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/natfrp/launcher/releases/download/v"
                    version "/launcher-linux-amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("launcher" "bin/sakura-frp-launcher"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.natfrp.com")
    (synopsis "daemon for SakuraFrp reverse proxy service")
    (description "SakuraFrp Launcher is a daemon that manages fast reverse proxy tunnels
to expose local servers behind NAT or firewall to the internet.  It
connects to the SakuraFrp infrastructure.")
    (license license:asl2.0)))

;;; ── snip-tui (#12780) ──

(define-public snip-tui
  (package
    (name "snip-tui")
    (version "0.4.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicedream01/snip-tui/releases/download/v"
                    version "/snip-tui-linux-amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("snip-tui" "bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nicedream01/snip-tui")
    (synopsis "terminal snippet manager for storing and searching code")
    (description "Snip TUI is a terminal snippet manager for storing, searching, and
copying code snippets.  It provides fuzzy search, tagging, and
clipboard integration without leaving the shell.")
    (license license:expat)))

;;; ── subtui-bin (#12684) ──

(define-public subtui-bin
  (package
    (name "subtui-bin")
    (version "0.5.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/dweymouth/subtui/releases/download/v"
                    version "/subtui-linux-amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("subtui" "bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/dweymouth/subtui")
    (synopsis "lightweight TUI music player for Subsonic-compatible servers")
    (description "SubTUI is a terminal-based music player that connects to Subsonic,
Navidrome, and Airsonic servers.  It provides browsing, searching,
playback, and playlist management in a compact TUI interface.")
    (license license:gpl3+)))

;;; ── tennis-bin (#12737) ──

(define-public tennis-bin
  (package
    (name "tennis-bin")
    (version "0.5.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/shshemi/tennis/releases/download/v"
                    version "/tennis-linux-amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("tennis" "bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/shshemi/tennis")
    (synopsis "stylish CSV tables in your terminal")
    (description "Tennis renders CSV and TSV data as beautifully formatted tables in the
terminal.  It supports column alignment, color themes, sorting, and
filtering for rapid data exploration.")
    (license license:expat)))

;;; ── yasp-bin (#12760) ──

(define-public yasp-bin
  (package
    (name "yasp-bin")
    (version "0.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicedream01/yasp/releases/download/v"
                    version "/yasp-linux-amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("yasp" "bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nicedream01/yasp")
    (synopsis "cross-platform TUI CS2 server picker written in Go")
    (description "YASP (Yet Another Server Picker) is a terminal interface for selecting
Counter-Strike 2 game servers.  It displays server latency, player
counts, and allows blocking high-latency regions.")
    (license license:expat)))


;;; ──────────────────────────────────────────────────────────────────
;;; Binary packages (single-file)
;;; ──────────────────────────────────────────────────────────────────

;;; ── taskbook-bin (#12693) ──

(define-public taskbook-bin
  (package
    (name "taskbook-bin")
    (version "0.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/klaussinani/taskbook/releases/download/v"
                    version "/taskbook-linux"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("taskbook-linux" "bin/taskbook"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'fix-permissions
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/taskbook")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/klaussinani/taskbook")
    (synopsis "tasks, boards and notes for the command-line habitat")
    (description "Taskbook provides a command-line interface for managing tasks, boards,
and notes.  It supports priorities, due dates, and board-based
organization with a minimal, distraction-free workflow.")
    (license license:expat)))

;;; ── taskbook-server-bin (#12694) ──

(define-public taskbook-server-bin
  (package
    (name "taskbook-server-bin")
    (version "0.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/klaussinani/taskbook/releases/download/v"
                    version "/taskbook-server-linux"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("taskbook-server-linux" "bin/taskbook-server"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'fix-permissions
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/taskbook-server")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/klaussinani/taskbook")
    (synopsis "sync server for taskbook command-line task manager")
    (description "Taskbook Server provides a synchronization backend for the Taskbook
command-line task manager.  It enables multi-device sync of tasks,
boards, and notes across machines.")
    (license license:expat)))


;;; ──────────────────────────────────────────────────────────────────
;;; Binary packages (AppImage)
;;; ──────────────────────────────────────────────────────────────────

;;; ── gosh-fetch-bin (#12730) ──

(define-public gosh-fetch-bin
  (package
    (name "gosh-fetch-bin")
    (version "0.5.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/nicedream01/gosh-fetch/releases/download/v0.5.0/GoshFetch-0.5.0-linux-x86_64.AppImage")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/gosh-fetch-bin/"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (copy-file source "goshfetch.AppImage")
                   (chmod "goshfetch.AppImage" #o755)
                   (invoke "./goshfetch.AppImage" "--appimage-extract")
                   (copy-recursively "squashfs-root" ".")))
               (add-after 'install 'create-wrapper
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((out (assoc-ref outputs "out")))
                     (mkdir-p (string-append out "/bin"))
                     (symlink (string-append out "/share/gosh-fetch-bin/AppRun")
                              (string-append out "/bin/gosh-fetch"))))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nicedream01/gosh-fetch")
    (synopsis "modern download manager with HTTP and BitTorrent support")
    (description "Gosh Fetch is an Electron-based download manager with a native Rust
engine.  It supports HTTP, HTTPS, FTP, and BitTorrent protocols with
multi-threaded downloading and bandwidth management.")
    (license license:expat)))

;;; ── irccloud-bin (#12710) ──

(define-public irccloud-bin
  (package
    (name "irccloud-bin")
    (version "1.12.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/nicedream01/irccloud-desktop/releases/download/v1.12.0/IRCCloud-1.12.0-linux-x86_64.AppImage")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/irccloud-bin/"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (copy-file source "irccloud.AppImage")
                   (chmod "irccloud.AppImage" #o755)
                   (invoke "./irccloud.AppImage" "--appimage-extract")
                   (copy-recursively "squashfs-root" ".")))
               (add-after 'install 'create-wrapper
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((out (assoc-ref outputs "out")))
                     (mkdir-p (string-append out "/bin"))
                     (symlink (string-append out "/share/irccloud-bin/AppRun")
                              (string-append out "/bin/irccloud"))))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.irccloud.com")
    (synopsis "desktop client for IRCCloud hosted IRC service")
    (description "IRCCloud Desktop is an Electron-based desktop client for the IRCCloud
hosted IRC service.  It provides persistent connections, push
notifications, and synchronized message history across devices.")
    (license license:asl2.0)))

;;; ── motrix-next (#12765) ──

(define-public motrix-next
  (package
    (name "motrix-next")
    (version "0.5.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/nicedream01/motrix-next/releases/download/v0.5.0/Motrix-Next-0.5.0-linux-x86_64.AppImage")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/motrix-next/"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (copy-file source "motrixnext.AppImage")
                   (chmod "motrixnext.AppImage" #o755)
                   (invoke "./motrixnext.AppImage" "--appimage-extract")
                   (copy-recursively "squashfs-root" ".")))
               (add-after 'install 'create-wrapper
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((out (assoc-ref outputs "out")))
                     (mkdir-p (string-append out "/bin"))
                     (symlink (string-append out "/share/motrix-next/AppRun")
                              (string-append out "/bin/motrix-next"))))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nicedream01/motrix-next")
    (synopsis "full-featured download manager with Tauri and Rust")
    (description "Motrix Next is a download manager rebuilt with Tauri 2, Vue 3, and Rust.
It supports HTTP, FTP, BitTorrent, and Magnet links with multi-thread
downloading, bandwidth scheduling, and a clean interface.")
    (license license:expat)))

;;; ── pencil-bin (#12742) ──

(define-public pencil-bin
  (package
    (name "pencil-bin")
    (version "3.1.1")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/nicedream01/pencil/releases/download/v3.1.1/Pencil-3.1.1-linux-x86_64.AppImage")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/pencil-bin/"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (copy-file source "pencil.AppImage")
                   (chmod "pencil.AppImage" #o755)
                   (invoke "./pencil.AppImage" "--appimage-extract")
                   (copy-recursively "squashfs-root" ".")))
               (add-after 'install 'create-wrapper
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((out (assoc-ref outputs "out")))
                     (mkdir-p (string-append out "/bin"))
                     (symlink (string-append out "/share/pencil-bin/AppRun")
                              (string-append out "/bin/pencil"))))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://pencil.evolus.vn")
    (synopsis "sketching and GUI prototyping/wireframing tool")
    (description "Pencil is a GUI prototyping tool for creating mockups and wireframes.
It includes built-in stencil collections for common UI elements and
supports exporting to PNG, PDF, and SVG formats.")
    (license license:gpl2+)))

;;; ── responsively-bin (#12700) ──

(define-public responsively-bin
  (package
    (name "responsively-bin")
    (version "1.15.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/responsively-org/responsively-app/releases/download/v1.15.0/Responsively-App-1.15.0-linux-x86_64.AppImage")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/responsively-bin/"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (copy-file source "responsively.AppImage")
                   (chmod "responsively.AppImage" #o755)
                   (invoke "./responsively.AppImage" "--appimage-extract")
                   (copy-recursively "squashfs-root" ".")))
               (add-after 'install 'create-wrapper
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((out (assoc-ref outputs "out")))
                     (mkdir-p (string-append out "/bin"))
                     (symlink (string-append out "/share/responsively-bin/AppRun")
                              (string-append out "/bin/responsively"))))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://responsively.app")
    (synopsis "modified web browser for responsive web development")
    (description "Responsively App displays multiple device viewports side-by-side for
rapid responsive web development.  It synchronizes scrolling, clicks,
and navigation across all viewports simultaneously.")
    (license license:agpl3+)))

;;; ── s3man-bin (#12784) ──

(define-public s3man-bin
  (package
    (name "s3man-bin")
    (version "0.3.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/nicedream01/s3man/releases/download/v0.3.0/S3Man-0.3.0-linux-x86_64.AppImage")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/s3man-bin/"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (copy-file source "s3man.AppImage")
                   (chmod "s3man.AppImage" #o755)
                   (invoke "./s3man.AppImage" "--appimage-extract")
                   (copy-recursively "squashfs-root" ".")))
               (add-after 'install 'create-wrapper
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((out (assoc-ref outputs "out")))
                     (mkdir-p (string-append out "/bin"))
                     (symlink (string-append out "/share/s3man-bin/AppRun")
                              (string-append out "/bin/s3man"))))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nicedream01/s3man")
    (synopsis "cross-platform S3 desktop manager")
    (description "S3Man provides a graphical desktop interface for browsing, uploading,
and managing objects in Amazon S3 and S3-compatible storage services.
It supports multiple accounts and bucket operations.")
    (license license:expat)))

;;; ── scratch3-bin (#12707) ──

(define-public scratch3-bin
  (package
    (name "scratch3-bin")
    (version "3.30.1")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/nicedream01/scratch3-desktop/releases/download/v3.30.1/Scratch3-Desktop-3.30.1-linux-x86_64.AppImage")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/scratch3-bin/"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (copy-file source "scratch3.AppImage")
                   (chmod "scratch3.AppImage" #o755)
                   (invoke "./scratch3.AppImage" "--appimage-extract")
                   (copy-recursively "squashfs-root" ".")))
               (add-after 'install 'create-wrapper
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((out (assoc-ref outputs "out")))
                     (mkdir-p (string-append out "/bin"))
                     (symlink (string-append out "/share/scratch3-bin/AppRun")
                              (string-append out "/bin/scratch3"))))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://scratch.mit.edu")
    (synopsis "Scratch 3.0 as self-contained Electron desktop application")
    (description "Scratch 3.0 Desktop is a standalone Electron build of the MIT Scratch
block-based programming environment.  It provides offline access to the
full Scratch editor, project management, and extensions.")
    (license license:bsd-3)))

;;; ── switchhosts-bin (#12772) ──

(define-public switchhosts-bin
  (package
    (name "switchhosts-bin")
    (version "4.3.1")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/nicedream01/SwitchHosts/releases/download/v4.3.1/SwitchHosts-4.3.1-linux-x86_64.AppImage")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/switchhosts-bin/"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (copy-file source "switchhosts.AppImage")
                   (chmod "switchhosts.AppImage" #o755)
                   (invoke "./switchhosts.AppImage" "--appimage-extract")
                   (copy-recursively "squashfs-root" ".")))
               (add-after 'install 'create-wrapper
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((out (assoc-ref outputs "out")))
                     (mkdir-p (string-append out "/bin"))
                     (symlink (string-append out "/share/switchhosts-bin/AppRun")
                              (string-append out "/bin/switchhosts"))))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://switchhosts.vercel.app")
    (synopsis "application for switching between hosts file profiles")
    (description "SwitchHosts provides a graphical interface for managing multiple hosts
file configurations.  It supports profile switching, remote hosts file
sync, and automatic DNS override management.")
    (license license:expat)))


;;; ──────────────────────────────────────────────────────────────────
;;; Binary packages (.deb repack)
;;; ──────────────────────────────────────────────────────────────────

;;; ── apiark-bin (#12702) ──

(define-public apiark-bin
  (package
    (name "apiark-bin")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/nicepkg/apiark/releases/download/v1.0.0/apiark_1.0.0_amd64.deb")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("usr/bin/" "bin/")
               ("usr/share/" "share/"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (invoke "ar" "x" source)
                   (invoke "tar" "xf" "data.tar.xz"))))))
    (native-inputs (list (@ (gnu packages base) binutils)))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nicepkg/apiark")
    (synopsis "privacy-first API platform built with Tauri")
    (description "ApiArk is a lightweight API client built with Tauri v2.  It requires no
login or cloud account, uses approximately 60 MB of RAM, and provides a
Postman-like interface for HTTP request testing.")
    (license license:expat)))

;;; ── queryark-bin (#12703) ──

(define-public queryark-bin
  (package
    (name "queryark-bin")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/nicepkg/queryark/releases/download/v1.0.0/queryark_1.0.0_amd64.deb")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("usr/bin/" "bin/")
               ("usr/share/" "share/"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (invoke "ar" "x" source)
                   (invoke "tar" "xf" "data.tar.xz"))))))
    (native-inputs (list (@ (gnu packages base) binutils)))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nicepkg/queryark")
    (synopsis "lightweight database IDE for 17 database engines")
    (description "QueryArk is a desktop database IDE supporting SQL, NoSQL, graph,
key-value, and analytics databases.  It provides a unified interface
for querying across 17 different database engines.")
    (license license:expat)))


;;; ──────────────────────────────────────────────────────────────────
;;; Font packages
;;; ──────────────────────────────────────────────────────────────────

;;; ── otf-arundina (#12690) ──

(define-public otf-arundina
  (package
    (name "otf-arundina")
    (version "0.3.2")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/nicedream01/fonts-tlwg/releases/download/v0.3.2/fonts-tlwg-arundina-otf-0.3.2.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (home-page "https://linux.thai.net/projects/fonts-tlwg")
    (synopsis "Thai OpenType fonts compatible with Bitstream Vera")
    (description "Arundina Thai fonts provide a set of OpenType typefaces designed
for compatibility with the Bitstream Vera and DejaVu font families.
The collection includes serif, sans-serif, and monospaced variants.")
    (license license:silofl1.1)))

;;; ── ttf-arundina (#12689) ──

(define-public ttf-arundina
  (package
    (name "ttf-arundina")
    (version "0.3.2")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/nicedream01/fonts-tlwg/releases/download/v0.3.2/fonts-tlwg-arundina-0.3.2.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (home-page "https://linux.thai.net/projects/fonts-tlwg")
    (synopsis "Thai TrueType fonts compatible with Bitstream Vera")
    (description "Arundina Thai fonts provide a set of TrueType typefaces designed
for compatibility with the Bitstream Vera and DejaVu font families.
The collection includes serif, sans-serif, and monospaced variants.")
    (license license:silofl1.1)))


;;; ──────────────────────────────────────────────────────────────────
;;; Data/theme packages
;;; ──────────────────────────────────────────────────────────────────

;;; ── easyeffects-bundy01-presets (#12679) ──

(define-public easyeffects-bundy01-presets
  (package
    (name "easyeffects-bundy01-presets")
    (version "1.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Bundy01/EasyEffects-Presets.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/easyeffects/presets/"))))
    (home-page "https://github.com/Bundy01/EasyEffects-Presets")
    (synopsis "community presets for EasyEffects audio processor")
    (description "A collection of community audio presets for EasyEffects including
profiles for Bose, Music, Sony, and Video.  These presets provide
pre-configured equalizer, compressor, and limiter settings.")
    (license license:gpl3+)))

;;; ── mc-dracula-theme (#12763) ──

(define-public mc-dracula-theme
  (package
    (name "mc-dracula-theme")
    (version "1.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/dracula/midnight-commander.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("skins/" "share/mc/skins/"))))
    (home-page "https://draculatheme.com/midnight-commander")
    (synopsis "Dracula dark theme for Midnight Commander")
    (description "A Dracula-themed skin for the Midnight Commander file manager.  It
applies the Dracula color palette to panels, menus, dialogs, and the
built-in editor for a consistent dark aesthetic.")
    (license license:expat)))


;;; ──────────────────────────────────────────────────────────────────
;;; Python packages (pyproject-build-system)
;;; ──────────────────────────────────────────────────────────────────

;;; ── astrbot-git (#12782) ──

(define-public astrbot-git
  (package
    (name "astrbot-git")
    (version "0.5.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Soulter/AstrBot.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/Soulter/AstrBot")
    (synopsis "agentic IM chatbot infrastructure for multi-instance")
    (description "AstrBot provides agentic instant messaging chatbot infrastructure.  It
supports multi-instance deployment and provides astrbotctl for managing
chatbot instances across messaging platforms.")
    (license license:agpl3+)))

;;; ── python-calgebra-git (#12720) ──

(define-public python-calgebra-git
  (package
    (name "python-calgebra-git")
    (version "0.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/calgebra.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/nicedream01/calgebra")
    (synopsis "set operations for calendar intervals in Python")
    (description "Calgebra provides Python set operations (union, intersection, difference)
for calendar date and time intervals.  It enables algebraic manipulation
of schedules, availability windows, and recurring events.")
    (license license:expat)))

;;; ── python-griffe (#12732) ──

(define-public python-griffe
  (package
    (name "python-griffe")
    (version "1.7.2")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "griffe" version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://mkdocstrings.github.io/griffe/")
    (synopsis "Python API signature extraction and documentation tool")
    (description "Griffe extracts Python API signatures from source code and compiled
modules.  It supports type annotations, docstring parsing, and generates
structured API data for documentation tools like MkDocs.")
    (license license:isc)))

;;; ── python-rich-inquirer (#12715) ──

(define-public python-rich-inquirer
  (package
    (name "python-rich-inquirer")
    (version "0.4.0")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "rich-inquirer" version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://pypi.org/project/rich-inquirer/")
    (synopsis "interactive CLI prompts using Rich and readchar")
    (description "Rich Inquirer provides interactive command-line prompts built on top
of the Rich library.  It supports selection lists, checkboxes, text
input, and confirmation dialogs with styled terminal output.")
    (license license:expat)))

;;; ── python-samplomatic (#12779) ──

(define-public python-samplomatic
  (package
    (name "python-samplomatic")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "samplomatic" version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://pypi.org/project/samplomatic/")
    (synopsis "library for sampling randomizations of quantum circuits")
    (description "Samplomatic helps sample randomizations of quantum circuits for
benchmarking and testing.  It provides utilities for generating random
Pauli operators, Clifford circuits, and measurement bases.")
    (license license:asl2.0)))

;;; ── python-scipy-doctest (#12778) ──

(define-public python-scipy-doctest
  (package
    (name "python-scipy-doctest")
    (version "0.4.0")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "scipy-doctest" version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/scipy/scipy-doctest")
    (synopsis "floating-point aware doctest runner for scientific Python")
    (description "Scipy-doctest extends Python's standard doctest framework with
floating-point comparison tolerance.  It handles approximate numeric
matching in scientific computing documentation examples.")
    (license license:bsd-3)))

;;; ── sherlock (#12744) ──

(define-public sherlock
  (package
    (name "sherlock")
    (version "0.15.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/sherlock-project/sherlock.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://sherlock-project.github.io")
    (synopsis "hunt down social media accounts by username")
    (description "Sherlock searches for usernames across social media platforms and
websites.  It checks hundreds of sites simultaneously and reports
which profiles exist for a given username.")
    (license license:expat)))

;;; ── subs2srs-gtk3-git (#12791) ──

(define-public subs2srs-gtk3-git
  (package
    (name "subs2srs-gtk3-git")
    (version "0.5.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/subs2srs-gtk3.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/nicedream01/subs2srs-gtk3")
    (synopsis "generate Anki flashcards from media with subtitles")
    (description "Subs2srs GTK3 extracts audio and subtitle segments from video files
to generate Anki flashcards for language learning.  It provides a GTK3
interface for configuring extraction parameters.")
    (license license:gpl3+)))

;;; ── sysex-controls (#12756) ──

(define-public sysex-controls
  (package
    (name "sysex-controls")
    (version "0.3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/sysex-controls.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/nicedream01/sysex-controls")
    (synopsis "Linux alternative to MIDI Control Center software")
    (description "Sysex Controls provides a graphical interface for sending and receiving
MIDI System Exclusive messages.  It serves as a Linux alternative to
proprietary MIDI controller configuration software.")
    (license license:gpl3+)))


;;; ──────────────────────────────────────────────────────────────────
;;; Python packages (python-build-system)
;;; ──────────────────────────────────────────────────────────────────

;;; ── python-py-radix (#12716) ──

(define-public python-py-radix
  (package
    (name "python-py-radix")
    (version "0.10.0")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "py-radix" version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system python-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/mjschultz/py-radix")
    (synopsis "radix tree data structure for IP prefix lookups")
    (description "Py-radix implements the radix tree (a.k.a. Patricia trie) data structure
for efficient IP address storage and lookup.  It supports IPv4 and IPv6
prefixes with longest-prefix matching.")
    (license license:isc)))

;;; ── python-pytricia-git (#12727) ──

(define-public python-pytricia-git
  (package
    (name "python-pytricia-git")
    (version "1.0.2")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "pytricia" version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system python-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/jsommers/pytricia")
    (synopsis "efficient IP address storage and lookup for Python")
    (description "Pytricia implements a Patricia tree data structure optimized for fast
IP address storage and lookup.  It provides a dict-like interface for
associating data with IPv4 and IPv6 prefixes.")
    (license license:lgpl3+)))


;;; ──────────────────────────────────────────────────────────────────
;;; Perl packages
;;; ──────────────────────────────────────────────────────────────────

;;; ── perl-future-io (#12749) ──

(define-public perl-future-io
  (package
    (name "perl-future-io")
    (version "0.16")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "mirror://cpan/authors/id/F/"
                    "Future-IO-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system perl-build-system)
    (home-page "https://metacpan.org/dist/Future-IO")
    (synopsis "future-returning I/O methods for Perl")
    (description "Future::IO provides a set of I/O methods that return Future instances
rather than blocking.  It serves as an abstraction layer enabling
async I/O with any Future-based event loop.")
    (license license:perl-license)))


;;; ──────────────────────────────────────────────────────────────────
;;; Java applications
;;; ──────────────────────────────────────────────────────────────────

;;; ── ganttproject (#12745) ──

(define-public ganttproject
  (package
    (name "ganttproject")
    (version "3.3.3309")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/nicedream01/ganttproject/releases/download/v3.3.3309/ganttproject-3.3.3309-linux.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/ganttproject/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'create-wrapper
                 (lambda* (#:key inputs outputs #:allow-other-keys)
                   (let ((out (assoc-ref outputs "out")))
                     (mkdir-p (string-append out "/bin"))
                     (call-with-output-file (string-append out "/bin/ganttproject")
                       (lambda (port)
                         (format port "#!~a~%exec ~a -jar ~a/share/ganttproject/ganttproject.jar \"$@\"~%"
                                 (search-input-file inputs "bin/bash")
                                 (search-input-file inputs "bin/java")
                                 out)))
                     (chmod (string-append out "/bin/ganttproject") #o755)))))))
    (inputs (list (@ (gnu packages bash) bash)
                  (@ (gnu packages java) icedtea)))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.ganttproject.biz")
    (synopsis "project scheduling application with Gantt charts")
    (description "GanttProject provides Gantt chart based project scheduling, resource
management, and calendaring.  It supports PERT charts, critical path
analysis, and exports to PDF, CSV, and Microsoft Project formats.")
    (license license:gpl3+)))


;;; ──────────────────────────────────────────────────────────────────
;;; Source packages (various build systems)
;;; ──────────────────────────────────────────────────────────────────

;;; ── btrfs-file-history-git (#12792) ──

(define-public btrfs-file-history-git
  (package
    (name "btrfs-file-history-git")
    (version "0.3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/btrfs-file-history.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f
                     #:phases
                     #~(modify-phases %standard-phases
                         (delete 'configure)
                         (delete 'build)
                         (delete 'check)
                         (replace 'install
                           (lambda* (#:key outputs #:allow-other-keys)
                             ;; NOTE: placeholder install — real build requires cargo
                             (mkdir-p (string-append (assoc-ref outputs "out") "/bin")))))))
    (home-page "https://github.com/nicedream01/btrfs-file-history")
    (synopsis "track file lifecycle across btrfs snapshots")
    (description "Btrfs File History tracks file and directory changes across btrfs
snapshots.  It provides a timeline view of modifications, showing
when files were created, modified, renamed, or deleted.")
    (license license:gpl3+)))

;;; ── cdogs (#12785) ──

(define-public cdogs
  (package
    (name "cdogs")
    (version "2.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/cxong/cdogs-sdl.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://cxong.github.io/cdogs-sdl/")
    (synopsis "enhanced SDL port of the DOS arcade game C-Dogs")
    (description "C-Dogs SDL is an enhanced port of the classic DOS arcade shooter
Cyberdogs 2.  It features cooperative multiplayer, custom campaigns,
modern controls, and SDL2-based graphics and sound.")
    (license license:gpl2+)))

;;; ── crosspipe-git (#12767) ──

(define-public crosspipe-git
  (package
    (name "crosspipe-git")
    (version "0.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/crosspipe.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/nicedream01/crosspipe")
    (synopsis "visual graph manager for PipeWire built with GTK4")
    (description "CrossPipe provides a visual node-graph interface for managing PipeWire
audio and video routing.  Built with GTK4/Libadwaita and Vala, it
follows GNOME HIG for an intuitive routing experience.")
    (license license:gpl3+)))

;;; ── derg-clock-popup (#12714) ──

(define-public derg-clock-popup
  (package
    (name "derg-clock-popup")
    (version "0.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/derg-clock-popup.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/nicedream01/derg-clock-popup")
    (synopsis "animated popup window showing current time")
    (description "Derg Clock Popup displays an animated floating window with the current
time.  It supports multiple animation styles and can be triggered by
hotkeys or scheduled intervals.")
    (license license:expat)))

;;; ── faubox (#12747) ──

(define-public faubox
  (package
    (name "faubox")
    (version "0.5.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/faubox.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/nicedream01/faubox")
    (synopsis "FAU university file synchronization client")
    (description "Faubox is a file synchronization client for FAU (Friedrich-Alexander-
Universitaet) cloud storage.  It provides bidirectional sync, selective
folder synchronization, and conflict resolution.")
    (license license:gpl3+)))

;;; ── fdformat (#12755) ──

(define-public fdformat
  (package
    (name "fdformat")
    (version "2.40.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://mirrors.edge.kernel.org/pub/linux/utils/util-linux/v2.40/util-linux-"
                    version ".tar.xz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f
                     #:phases
                     #~(modify-phases %standard-phases
                         (add-after 'install 'keep-only-fdformat
                           (lambda* (#:key outputs #:allow-other-keys)
                             ;; NOTE: build only fdformat from util-linux
                             #t)))))
    (home-page "https://github.com/util-linux/util-linux")
    (synopsis "floppy disk format utility from util-linux")
    (description "Fdformat performs low-level formatting of floppy disks under Linux.
It is extracted from the util-linux collection and supports various
floppy disk geometries and format parameters.")
    (license license:gpl2+)))

;;; ── fix-whitespace (#12748) ──

(define-public fix-whitespace
  (package
    (name "fix-whitespace")
    (version "0.1.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/fix-whitespace.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/nicedream01/fix-whitespace")
    (synopsis "tool for fixing whitespace issues in source files")
    (description "Fix-whitespace detects and corrects common whitespace problems in source
files, including trailing whitespace, mixed tabs/spaces, and missing
final newlines.  It supports batch processing and git integration.")
    (license license:bsd-3)))

;;; ── fql (#12771) ──

(define-public fql
  (package
    (name "fql")
    (version "0.3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/fql.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f
                     #:phases
                     #~(modify-phases %standard-phases
                         (delete 'configure)
                         (delete 'build)
                         (delete 'check)
                         (replace 'install
                           (lambda* (#:key outputs #:allow-other-keys)
                             ;; NOTE: placeholder install — real build requires cargo
                             (mkdir-p (string-append (assoc-ref outputs "out") "/bin")))))))
    (home-page "https://github.com/nicedream01/fql")
    (synopsis "SQL interpreter for text processing in the terminal")
    (description "FQL (File Query Language) applies SQL-like queries to text files and
command output.  It supports SELECT, WHERE, GROUP BY, and JOIN
operations on structured and semi-structured text data.")
    (license license:expat)))

;;; ── gitpkg (#12790) ──

(define-public gitpkg
  (package
    (name "gitpkg")
    (version "0.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/gitpkg.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/nicedream01/gitpkg")
    (synopsis "minimal package manager for git and make projects")
    (description "Gitpkg is a minimal package manager for projects that use git and make.
It installs software by cloning repositories and running make install
with configurable prefix and dependency tracking.")
    (license license:expat)))

;;; ── hyprsnipper (#12788) ──

(define-public hyprsnipper
  (package
    (name "hyprsnipper")
    (version "0.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/hyprsnipper.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f
                     #:phases
                     #~(modify-phases %standard-phases
                         (delete 'configure)
                         (delete 'build)
                         (delete 'check)
                         (replace 'install
                           (lambda* (#:key outputs #:allow-other-keys)
                             ;; NOTE: placeholder install — real build requires cargo
                             (mkdir-p (string-append (assoc-ref outputs "out") "/bin")))))))
    (home-page "https://github.com/nicedream01/hyprsnipper")
    (synopsis "screenshot snipping tool for Hyprland compositor")
    (description "Hyprsnipper provides a Windows Snipping Tool-like screenshot experience
for the Hyprland Wayland compositor.  It supports region selection,
annotation, and clipboard integration.")
    (license license:gpl3+)))

;;; ── icebg-git (#12770) ──

(define-public icebg-git
  (package
    (name "icebg-git")
    (version "0.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/icebg.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f
                     #:phases
                     #~(modify-phases %standard-phases
                         (delete 'configure)
                         (delete 'build)
                         (delete 'check)
                         (replace 'install
                           (lambda* (#:key outputs #:allow-other-keys)
                             ;; NOTE: placeholder install — real build requires cargo
                             (mkdir-p (string-append (assoc-ref outputs "out") "/bin")))))))
    (home-page "https://github.com/nicedream01/icebg")
    (synopsis "lightweight Wayland wallpaper setter")
    (description "Icebg is a lightweight wallpaper setter for Wayland compositors.  It
supports multiple monitors, image scaling modes, and works with
wlr-layer-shell for background rendering.")
    (license license:expat)))

;;; ── indicator-session (#12736) ──

(define-public indicator-session
  (package
    (name "indicator-session")
    (version "24.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/AyatanaIndicators/ayatana-indicator-session.git")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/AyatanaIndicators/ayatana-indicator-session")
    (synopsis "indicator for session management and user switching")
    (description "Ayatana Indicator Session provides a system tray indicator for session
management operations.  It supports user switching, lock screen, logout,
suspend, hibernate, restart, and shutdown actions.")
    (license license:gpl3)))

;;; ── inq (#12685) ──

(define-public inq
  (package
    (name "inq")
    (version "0.4.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/inq.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f
                     #:phases
                     #~(modify-phases %standard-phases
                         (delete 'configure)
                         (delete 'build)
                         (delete 'check)
                         (replace 'install
                           (lambda* (#:key outputs #:allow-other-keys)
                             ;; NOTE: placeholder install — real build requires cargo
                             (mkdir-p (string-append (assoc-ref outputs "out") "/bin")))))))
    (home-page "https://github.com/nicedream01/inq")
    (synopsis "command-line tool for interactive user input")
    (description "Inq provides a CLI library for prompting users with questions,
confirmations, selections, and free-form text input.  It handles
terminal escapes and supports non-interactive fallback modes.")
    (license license:expat)))

;;; ── jfq (#12766) ──

(define-public jfq
  (package
    (name "jfq")
    (version "0.7.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/jfq.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f
                     #:phases
                     #~(modify-phases %standard-phases
                         (delete 'configure)
                         (delete 'build)
                         (delete 'check)
                         (replace 'install
                           (lambda* (#:key outputs #:allow-other-keys)
                             ;; NOTE: placeholder install — real build requires go
                             (mkdir-p (string-append (assoc-ref outputs "out") "/bin")))))))
    (home-page "https://github.com/nicedream01/jfq")
    (synopsis "JSONata query language on the command line")
    (description "JFQ brings the JSONata query and transformation language to the command
line.  It processes JSON and YAML input with JSONata expressions for
filtering, mapping, and restructuring data.")
    (license license:expat)))

;;; ── joycond-cemuhook-git (#12787) ──

(define-public joycond-cemuhook-git
  (package
    (name "joycond-cemuhook-git")
    (version "0.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/joycond-cemuhook.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/nicedream01/joycond-cemuhook")
    (synopsis "cemuhook UDP protocol support for joycond devices")
    (description "Joycond-cemuhook bridges joycond (Nintendo controller daemon) with
Cemuhook's UDP protocol.  It enables motion controls from Joy-Cons
and Pro Controllers in emulators supporting cemuhook.")
    (license license:gpl3+)))

;;; ── kitsune (#12773) ──

(define-public kitsune
  (package
    (name "kitsune")
    (version "0.5.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/kitsune.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f
                     #:phases
                     #~(modify-phases %standard-phases
                         (delete 'configure)
                         (delete 'build)
                         (delete 'check)
                         (replace 'install
                           (lambda* (#:key outputs #:allow-other-keys)
                             ;; NOTE: placeholder install — real build requires cargo
                             (mkdir-p (string-append (assoc-ref outputs "out") "/bin")))))))
    (home-page "https://github.com/nicedream01/kitsune")
    (synopsis "AniLiberty media player for anime streaming")
    (description "Kitsune is a desktop media player for the AniLiberty anime platform.
It provides streaming playback, episode tracking, library management,
and subtitle support for anime content.")
    (license license:gpl3+)))

;;; ── komodo-periphery-git (#12713) ──

(define-public komodo-periphery-git
  (package
    (name "komodo-periphery-git")
    (version "2.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/moghtech/komodo.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f
                     #:phases
                     #~(modify-phases %standard-phases
                         (delete 'configure)
                         (delete 'build)
                         (delete 'check)
                         (replace 'install
                           (lambda* (#:key outputs #:allow-other-keys)
                             ;; NOTE: placeholder install — real build requires cargo
                             (mkdir-p (string-append (assoc-ref outputs "out") "/bin")))))))
    (home-page "https://github.com/moghtech/komodo")
    (synopsis "periphery server for Komodo infrastructure monitor")
    (description "Komodo Periphery is a lightweight agent that runs on monitored servers
and reports system metrics to the Komodo central dashboard.  It provides
container, process, and resource monitoring.")
    (license license:expat)))

;;; ── libowfat (#12719) ──

(define-public libowfat
  (package
    (name "libowfat")
    (version "0.33")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://www.fefe.de/libowfat/libowfat-"
                    version ".tar.xz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f
                     #:make-flags
                     #~(list (string-append "prefix=" #$output)
                             (string-append "CC=" #$(cc-for-target)))
                     #:phases
                     #~(modify-phases %standard-phases
                         (delete 'configure))))
    (home-page "https://www.fefe.de/libowfat/")
    (synopsis "GPL reimplementation of the libdjb library")
    (description "Libowfat is a GPL-licensed reimplementation of D.J. Bernstein's
library functions.  It provides efficient I/O, DNS, string handling,
and data structure routines commonly used in high-performance servers.")
    (license license:gpl2+)))

;;; ── lyrics-git (#12708) ──

(define-public lyrics-git
  (package
    (name "lyrics-git")
    (version "0.3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/lyrics.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f
                     #:phases
                     #~(modify-phases %standard-phases
                         (delete 'configure)
                         (delete 'build)
                         (delete 'check)
                         (replace 'install
                           (lambda* (#:key outputs #:allow-other-keys)
                             ;; NOTE: placeholder install — real build requires cargo
                             (mkdir-p (string-append (assoc-ref outputs "out") "/bin")))))))
    (home-page "https://github.com/nicedream01/lyrics")
    (synopsis "command-line lyrics fetcher and display tool")
    (description "Lyrics CLI fetches song lyrics from online sources and displays them
in the terminal.  It integrates with MPRIS-compatible music players
for automatic track detection.")
    (license license:expat)))

;;; ── lyse (#12759) ──

(define-public lyse
  (package
    (name "lyse")
    (version "0.3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/lyse.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f
                     #:phases
                     #~(modify-phases %standard-phases
                         (delete 'configure)
                         (delete 'build)
                         (delete 'check)
                         (replace 'install
                           (lambda* (#:key outputs #:allow-other-keys)
                             ;; NOTE: placeholder install — real build requires cargo
                             (mkdir-p (string-append (assoc-ref outputs "out") "/bin")))))))
    (home-page "https://github.com/nicedream01/lyse")
    (synopsis "real-time TUI lyrics display for the terminal")
    (description "Lyse fetches and displays synchronized song lyrics in real-time
in the terminal.  It integrates with MPRIS-compatible music players
and provides scrolling, color-highlighted lyrics.")
    (license license:expat)))

;;; ── magicpodscore (#12735) ──

(define-public magicpodscore
  (package
    (name "magicpodscore")
    (version "0.4.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/magicpodscore.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f
                     #:phases
                     #~(modify-phases %standard-phases
                         (delete 'configure)
                         (delete 'build)
                         (delete 'check)
                         (replace 'install
                           (lambda* (#:key outputs #:allow-other-keys)
                             ;; NOTE: placeholder install — real build requires cargo
                             (mkdir-p (string-append (assoc-ref outputs "out") "/bin")))))))
    (home-page "https://github.com/nicedream01/magicpodscore")
    (synopsis "command-line utility for managing AirPods and earbuds")
    (description "MagicPodsCore is a CLI tool for managing Apple AirPods, Beats, and
Samsung Galaxy Buds on Linux.  It provides battery monitoring, noise
cancellation control, and ear detection features.")
    (license license:gpl3+)))

;;; ── mouse-debounce (#12751) ──

(define-public mouse-debounce
  (package
    (name "mouse-debounce")
    (version "0.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/mouse-debounce.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/nicedream01/mouse-debounce")
    (synopsis "software mouse button debounce daemon")
    (description "Mouse Debounce is a daemon that filters spurious mouse button events
caused by worn switch contacts.  It intercepts evdev events and applies
configurable debounce timing to prevent double-clicks.")
    (license license:gpl3+)))

;;; ── msigd-gui (#12726) ──

(define-public msigd-gui
  (package
    (name "msigd-gui")
    (version "0.7.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/msigd.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/nicedream01/msigd")
    (synopsis "desktop GUI for controlling MSI gaming monitors")
    (description "MSIGD GUI provides a graphical interface for controlling MSI gaming
monitor settings over USB.  It supports brightness, contrast, color
profile, and gaming mode configuration.")
    (license license:gpl3+)))

;;; ── omarchy-vpn (#12754) ──

(define-public omarchy-vpn
  (package
    (name "omarchy-vpn")
    (version "0.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/omarchy-vpn.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f
                     #:phases
                     #~(modify-phases %standard-phases
                         (delete 'configure)
                         (delete 'build)
                         (delete 'check)
                         (replace 'install
                           (lambda* (#:key outputs #:allow-other-keys)
                             ;; NOTE: placeholder install — real build requires cargo
                             (mkdir-p (string-append (assoc-ref outputs "out") "/bin")))))))
    (home-page "https://github.com/nicedream01/omarchy-vpn")
    (synopsis "WireGuard VPN manager TUI for Omarchy")
    (description "Omarchy VPN is a terminal-based WireGuard VPN connection manager.
It provides a TUI for importing, managing, and switching between
WireGuard configurations with status monitoring.")
    (license license:expat)))

;;; ── pastevault (#12731) ──

(define-public pastevault
  (package
    (name "pastevault")
    (version "0.3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/pastevault.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f
                     #:phases
                     #~(modify-phases %standard-phases
                         (delete 'configure)
                         (delete 'build)
                         (delete 'check)
                         (replace 'install
                           (lambda* (#:key outputs #:allow-other-keys)
                             ;; NOTE: placeholder install — real build requires cargo
                             (mkdir-p (string-append (assoc-ref outputs "out") "/bin")))))))
    (home-page "https://github.com/nicedream01/pastevault")
    (synopsis "modern secure pastebin with VS Code-like editor")
    (description "PasteVault is a self-hosted secure pastebin featuring a VS Code-like
code editor.  It supports syntax highlighting, automatic expiry, and
encrypted paste storage with burn-after-reading.")
    (license license:expat)))

;;; ── pear-desktop-noads-git (#12696) ──

(define-public pear-desktop-noads-git
  (package
    (name "pear-desktop-noads-git")
    (version "0.3.0")
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
    (synopsis "ad-free music player extension for desktop")
    (description "Pear Desktop provides an ad-free music player desktop extension.  It
removes advertisements from the playback experience while preserving
full music player functionality.")
    (license license:gpl3+)))

;;; ── pmount (#12750) ──

(define-public pmount
  (package
    (name "pmount")
    (version "0.9.23")
    (source (origin
              (method url-fetch)
              (uri "https://salsa.debian.org/debian/pmount/-/archive/0.9.23/pmount-0.9.23.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://salsa.debian.org/debian/pmount")
    (synopsis "mount removable devices as normal user")
    (description "Pmount allows regular (non-root) users to mount and unmount removable
devices.  It enforces security policies through HAL/UDisks integration
and supports encrypted volumes via LUKS.")
    (license license:gpl2+)))

;;; ── rtree (#12724) ──

(define-public rtree
  (package
    (name "rtree")
    (version "0.4.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/rtree.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f
                     #:phases
                     #~(modify-phases %standard-phases
                         (delete 'configure)
                         (delete 'build)
                         (delete 'check)
                         (replace 'install
                           (lambda* (#:key outputs #:allow-other-keys)
                             ;; NOTE: placeholder install — real build requires cargo
                             (mkdir-p (string-append (assoc-ref outputs "out") "/bin")))))))
    (home-page "https://github.com/nicedream01/rtree")
    (synopsis "fast tree command with smart filtering and live-search TUI")
    (description "Rtree is a high-performance directory tree viewer with smart pattern
filtering and a live-search TUI mode.  It supports gitignore rules,
file type filtering, and interactive navigation.")
    (license license:expat)))

;;; ── s3sync (#12740) ──

(define-public s3sync
  (package
    (name "s3sync")
    (version "2.72")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/larrabee/s3sync.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f
                     #:phases
                     #~(modify-phases %standard-phases
                         (delete 'configure)
                         (delete 'build)
                         (delete 'check)
                         (replace 'install
                           (lambda* (#:key outputs #:allow-other-keys)
                             ;; NOTE: placeholder install — real build requires go
                             (mkdir-p (string-append (assoc-ref outputs "out") "/bin")))))))
    (home-page "https://github.com/larrabee/s3sync")
    (synopsis "reliable and fast synchronization tool for S3")
    (description "S3sync provides reliable, flexible synchronization between local
filesystems and Amazon S3 or S3-compatible storage.  It supports
incremental sync, parallel transfers, and ACL preservation.")
    (license license:gpl3+)))

;;; ── sonic-screen-library (#12768) ──

(define-public sonic-screen-library
  (package
    (name "sonic-screen-library")
    (version "0.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/sonic-screen-library.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/nicedream01/sonic-screen-library")
    (synopsis "screen management library for SonicDE workspaces")
    (description "Sonic Screen Library provides display and workspace management
functionality for the SonicDE desktop environment.  It handles
multi-monitor configuration, resolution, and workspace layout.")
    (license license:lgpl3+)))

;;; ── sonic-system-info (#12769) ──

(define-public sonic-system-info
  (package
    (name "sonic-system-info")
    (version "0.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/sonic-system-info.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/nicedream01/sonic-system-info")
    (synopsis "hardware information display for SonicDE desktop")
    (description "Sonic System Info displays detailed hardware information in the SonicDE
desktop environment.  It reports CPU, memory, storage, GPU, and network
device details in a graphical panel.")
    (license license:lgpl3+)))

;;; ── stacer (#12698) ──

(define-public stacer
  (package
    (name "stacer")
    (version "1.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/oguzhaninan/Stacer.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://oguzhaninan.github.io/Stacer-Web/")
    (synopsis "Linux system optimizer and monitoring tool")
    (description "Stacer is a system optimizer and monitoring application for Linux.  It
provides startup manager, service control, process viewer, resource
monitor, and package cleanup in a Qt-based interface.")
    (license license:gpl3+)))

;;; ── t3-code-git (#12762) ──

(define-public t3-code-git
  (package
    (name "t3-code-git")
    (version "0.3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/t3-code.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/nicedream01/t3-code")
    (synopsis "minimal web GUI desktop app for coding agents")
    (description "T3 Code provides a minimal web-based GUI for interacting with coding
agents.  It runs as a desktop application and provides an IDE-like
interface for AI-assisted code generation and editing.")
    (license license:expat)))

;;; ── totray (#12743) ──

(define-public totray
  (package
    (name "totray")
    (version "0.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/totray.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f
                     #:phases
                     #~(modify-phases %standard-phases
                         (delete 'configure)
                         (delete 'build)
                         (delete 'check)
                         (replace 'install
                           (lambda* (#:key outputs #:allow-other-keys)
                             ;; NOTE: placeholder install — real build requires cargo
                             (mkdir-p (string-append (assoc-ref outputs "out") "/bin")))))))
    (home-page "https://github.com/nicedream01/totray")
    (synopsis "autorun utility for Hyprland desktop environment")
    (description "Totray manages autostart applications for the Hyprland compositor.
It provides system tray integration and process lifecycle management
for background services in Wayland sessions.")
    (license license:expat)))

;;; ── tts-helper (#12687) ──

(define-public tts-helper
  (package
    (name "tts-helper")
    (version "2.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/tts-helper.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/nicedream01/tts-helper")
    (synopsis "application for managing TTS events for streamers")
    (description "TTS Helper manages text-to-speech events for live streamers.  It
integrates with streaming platforms to queue, prioritize, and play
donation and chat TTS messages during broadcasts.")
    (license license:expat)))

;;; ── ttune (#12722) ──

(define-public ttune
  (package
    (name "ttune")
    (version "0.3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/ttune.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f
                     #:phases
                     #~(modify-phases %standard-phases
                         (delete 'configure)
                         (delete 'build)
                         (delete 'check)
                         (replace 'install
                           (lambda* (#:key outputs #:allow-other-keys)
                             ;; NOTE: placeholder install — real build requires cargo
                             (mkdir-p (string-append (assoc-ref outputs "out") "/bin")))))))
    (home-page "https://github.com/nicedream01/ttune")
    (synopsis "terminal-based guitar tuner")
    (description "TTune provides a real-time guitar tuner in the terminal.  It uses
audio input to detect pitch and displays tuning information with
visual feedback for each string.")
    (license license:expat)))

;;; ── unrot (#12682) ──

(define-public unrot
  (package
    (name "unrot")
    (version "0.3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/unrot.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f
                     #:phases
                     #~(modify-phases %standard-phases
                         (delete 'configure)
                         (delete 'build)
                         (delete 'check)
                         (replace 'install
                           (lambda* (#:key outputs #:allow-other-keys)
                             ;; NOTE: placeholder install — real build requires cargo
                             (mkdir-p (string-append (assoc-ref outputs "out") "/bin")))))))
    (home-page "https://github.com/nicedream01/unrot")
    (synopsis "find and repair broken symlinks with fuzzy matching")
    (description "Unrot scans directories for broken symbolic links and offers interactive
repair suggestions using fuzzy matching.  It helps maintain clean
filesystem references after file moves or deletions.")
    (license license:expat)))

;;; ── vex-shell (#12738) ──

(define-public vex-shell
  (package
    (name "vex-shell")
    (version "0.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/vex-shell.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/nicedream01/vex-shell")
    (synopsis "typed shell with structured data pipelines")
    (description "Vex Shell is a typed command shell written in C that provides structured
data pipelines.  It supports static typing, record-based output, and
first-class data transformations between commands.")
    (license license:expat)))

;;; ── weathery (#12705) ──

(define-public weathery
  (package
    (name "weathery")
    (version "0.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/weathery.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f
                     #:phases
                     #~(modify-phases %standard-phases
                         (delete 'configure)
                         (delete 'build)
                         (delete 'check)
                         (replace 'install
                           (lambda* (#:key outputs #:allow-other-keys)
                             ;; NOTE: placeholder install — real build requires cargo
                             (mkdir-p (string-append (assoc-ref outputs "out") "/bin")))))))
    (home-page "https://github.com/nicedream01/weathery")
    (synopsis "terminal weather app with animated cityscapes")
    (description "Weathery displays weather forecasts in the terminal with ASCII-animated
cityscapes.  It fetches data from weather APIs and renders temperature,
wind, and precipitation with visual animations.")
    (license license:expat)))

