;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260417ae
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages.
;;;
;;; Recipes (27):
;;;    1. q-bin (copy/binary, v3.1.6, GPL-3.0)
;;;    2. lowfi-bin (copy/binary, v2.0.6, MIT)
;;;    3. gollama-bin (copy/zip, v2.0.4, MIT)
;;;    4. wstunnel-bin (copy/tarball, v10.5.2, BSD-3)
;;;    5. dprint-bin (copy/zip, v0.54.0, MIT)
;;;    6. zigup-bin (copy/tarball, v2025_05_24, MIT-0)
;;;    7. naabu-bin (copy/zip, v2.5.0, MIT)
;;;    8. punfetch-bin (copy/tarball, v0.3.6, MIT)
;;;    9. loki-bin (copy/zip, v3.7.1, AGPL-3.0)
;;;   10. skeema-bin (copy/tarball, v1.13.2, Apache-2.0)
;;;   11. bibiman-bin (copy/binary, v0.15.0, GPL-3.0)
;;;   12. wofi-power-menu-bin (copy/binary, v0.3.3, MIT)
;;;   13. lima-bin (copy/tarball, v2.1.1, Apache-2.0)
;;;   14. pindock-bin (copy/tarball, v1.0.0, MIT)
;;;   15. sitegen-bin (copy/binary, v1.0.35, MIT)
;;;   16. okapi-bin (copy/tarball, v0.5.0, Apache-2.0)
;;;   17. gitcredits-bin (copy/tarball, v0.1.3, MIT)
;;;   18. nnd-bin (copy/binary, v0.71, Apache-2.0)
;;;   19. jjui-bin (copy/zip, v0.10.2, MIT)
;;;   20. tatuin-bin (copy/tarball, v0.26.0, MIT)
;;;   21. cobalt-lang-bin (copy/tarball, v0.10.2, GPL-3.0)
;;;   22. lidm-bin (copy/binary, v2.0.2, GPL-3.0)
;;;   23. axiocnc-bin (copy/deb, v0.0.89, MIT)
;;;   24. ipinfo-cli-bin (copy/tarball, v3.3.1, Apache-2.0)
;;;   25. windscribe-cli-v2-bin (copy/deb, v2.21.7, GPL-2.0)
;;;   26. sharik-bin (copy/zip, v3.1, MIT)
;;;   27. xfsrtray-bin (copy/binary, v1.1.0, GPL-3.0)
;;;
;;; Blocked (3):
;;;   28. pyrefly-bin — BLOCKED: COMPLEX_PACKAGING (PyPI-only distribution, no GitHub release binaries)
;;;   29. ftop-bin — BLOCKED: NO_X86_64_RELEASE (only linux-386 and linux-arm binaries in releases)
;;;   30. spacecadetpinball-bin — BLOCKED: NO_LINUX_BINARY (main repo only provides Mac/Windows binaries)
;;;
;;; 27 recipes + 3 BLOCKED = 30 total.
;;;
;;; NOTE: All sha256 hashes obtained via `guix download`.

(define-module (gaurix packages recipe-resolver-260417ae)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages compression)
  #:export (
            q-bin
            lowfi-bin
            gollama-bin
            wstunnel-bin
            dprint-bin
            zigup-bin
            naabu-bin
            punfetch-bin
            loki-bin
            skeema-bin
            bibiman-bin
            wofi-power-menu-bin
            lima-bin
            pindock-bin
            sitegen-bin
            okapi-bin
            gitcredits-bin
            nnd-bin
            jjui-bin
            tatuin-bin
            cobalt-lang-bin
            lidm-bin
            axiocnc-bin
            ipinfo-cli-bin
            windscribe-cli-v2-bin
            sharik-bin
            xfsrtray-bin
            ))

;;; ===================================================================
;;; STANDALONE BINARY PACKAGES
;;; ===================================================================

;;; -------------------------------------------------------------------
;;; 1. q-bin — SQL-like queries on tabular text data
;;; -------------------------------------------------------------------
(define-public q-bin
  (package
    (name "q-bin")
    (version "3.1.6")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/harelba/q/releases/download/v"
                    version "/linux-q"))
              (sha256
               (base32
                "16291y9319mxmrc17qi5p7rs164j348hvry26sll6h0sp7y6jsif"))))
    (build-system copy-build-system)
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (mkdir-p "src")
                   (copy-file source "src/q")
                   (chmod "src/q" #o755)
                   (chdir "src"))))
           #:install-plan #~'(("q" "bin/q"))))
    (synopsis "run SQL-like queries on tabular text data")
    (description "Q is a command-line tool that allows running SQL queries
directly on tabular text data such as CSV and TSV files.  It supports joins,
subqueries, and aggregation without requiring a database server.")
    (home-page "https://github.com/harelba/q")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 2. lowfi-bin — extremely simple lofi player
;;; -------------------------------------------------------------------
(define-public lowfi-bin
  (package
    (name "lowfi-bin")
    (version "2.0.6")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/talwat/lowfi/releases/download/"
                    version "/lowfi-linux-x86_64"))
              (sha256
               (base32
                "05c2l1f5jxwrfqr8ypp2x4lb4mzdmifpvl8ayggaaj0xrllsv0hx"))))
    (build-system copy-build-system)
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (mkdir-p "src")
                   (copy-file source "src/lowfi")
                   (chmod "src/lowfi" #o755)
                   (chdir "src"))))
           #:install-plan #~'(("lowfi" "bin/lowfi"))))
    (synopsis "extremely simple terminal-based lofi music player")
    (description "Lowfi is a minimal terminal-based lofi music player written
in Rust.  It streams lofi beats directly in the terminal with a simple
text-based interface and minimal resource usage.")
    (home-page "https://github.com/talwat/lowfi")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 3. bibiman-bin — TUI for BibLaTeX databases
;;; -------------------------------------------------------------------
(define-public bibiman-bin
  (package
    (name "bibiman-bin")
    (version "0.15.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://codeberg.org/lukeflo/bibiman/releases/download/v"
                    version "/bibiman-x86_64-gnu"))
              (sha256
               (base32
                "0n7bl675lx2yrsvbapbcyvssfk8b85x2a13gl3l3q9s4xwdz78f6"))))
    (build-system copy-build-system)
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (mkdir-p "src")
                   (copy-file source "src/bibiman")
                   (chmod "src/bibiman" #o755)
                   (chdir "src"))))
           #:install-plan #~'(("bibiman" "bin/bibiman"))))
    (synopsis "terminal user interface for BibLaTeX databases")
    (description "Bibiman is a fast TUI for interacting with BibLaTeX
bibliography databases.  It provides searching, filtering, editing, and
managing bibliographic entries directly from the terminal.")
    (home-page "https://codeberg.org/lukeflo/bibiman")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 4. wofi-power-menu-bin — configurable power menu for Wofi
;;; -------------------------------------------------------------------
(define-public wofi-power-menu-bin
  (package
    (name "wofi-power-menu-bin")
    (version "0.3.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/szaffarano/wofi-power-menu"
                    "/releases/download/v" version
                    "/wofi-power-menu-linux-x64"))
              (sha256
               (base32
                "1yrzh7wv3jrhs5p1z0xkcxxkc26q0s9b9si63yi3jz77bd6ipz46"))))
    (build-system copy-build-system)
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (mkdir-p "src")
                   (copy-file source "src/wofi-power-menu")
                   (chmod "src/wofi-power-menu" #o755)
                   (chdir "src"))))
           #:install-plan #~'(("wofi-power-menu" "bin/wofi-power-menu"))))
    (synopsis "highly configurable power menu using the wofi launcher")
    (description "Wofi-power-menu is a configurable power menu that uses
the Wofi launcher on Wayland.  It provides shutdown, reboot, suspend,
lock, and logout options with customizable appearance and behavior.")
    (home-page "https://github.com/szaffarano/wofi-power-menu")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 5. sitegen-bin — simple static site generator
;;; -------------------------------------------------------------------
(define-public sitegen-bin
  (package
    (name "sitegen-bin")
    (version "1.0.35")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/altlimit/sitegen/releases/download/v"
                    version "/sitegen_linux_amd64"))
              (sha256
               (base32
                "0majcj64ayakfaryl8m45bq7958scxqaqmshdm1j39rd9l5iw439"))))
    (build-system copy-build-system)
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (mkdir-p "src")
                   (copy-file source "src/sitegen")
                   (chmod "src/sitegen" #o755)
                   (chdir "src"))))
           #:install-plan #~'(("sitegen" "bin/sitegen"))))
    (synopsis "simple and flexible static site generator")
    (description "Sitegen is a simple but flexible static site generator
written in Go.  It supports templates, markdown content, and live reload
for rapid development of static websites.")
    (home-page "https://github.com/altlimit/sitegen")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 6. nnd-bin — debugger for Linux
;;; -------------------------------------------------------------------
(define-public nnd-bin
  (package
    (name "nnd-bin")
    (version "0.71")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/al13n321/nnd/releases/download/v"
                    version "/nnd"))
              (sha256
               (base32
                "1icqs8ir6y3dyv0mbklvmqcp3wyvn84sx4l8jdsiqqsw0ylbyx1p"))))
    (build-system copy-build-system)
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (mkdir-p "src")
                   (copy-file source "src/nnd")
                   (chmod "src/nnd" #o755)
                   (chdir "src"))))
           #:install-plan #~'(("nnd" "bin/nnd"))))
    (synopsis "debugger for Linux with a TUI interface")
    (description "NND is a Linux debugger written in C++ with a terminal
user interface.  It supports breakpoints, watchpoints, stepping,
disassembly, and DWARF debug information parsing.")
    (home-page "https://github.com/al13n321/nnd")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 7. lidm-bin — colorful TUI display manager
;;; -------------------------------------------------------------------
(define-public lidm-bin
  (package
    (name "lidm-bin")
    (version "2.0.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/javalsai/lidm/releases/download/v"
                    version "/lidm-amd64"))
              (sha256
               (base32
                "0dmw78asj9xy01iwwlpszv55rdl4md799zvh9sail5aq78jd7mw4"))))
    (build-system copy-build-system)
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (mkdir-p "src")
                   (copy-file source "src/lidm")
                   (chmod "src/lidm" #o755)
                   (chdir "src"))))
           #:install-plan #~'(("lidm" "bin/lidm"))))
    (synopsis "colorful TUI display manager for Linux")
    (description "Lidm is a fully customizable TUI display manager written
in C.  It provides a colorful terminal-based login screen for selecting
sessions and users on Linux systems.")
    (home-page "https://github.com/javalsai/lidm")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 8. xfsrtray-bin — floating customizable system tray
;;; -------------------------------------------------------------------
(define-public xfsrtray-bin
  (package
    (name "xfsrtray-bin")
    (version "1.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Byson94/xfsrtray/releases/download/v"
                    version "/xfsrtray"))
              (sha256
               (base32
                "1lqdanpz6vvb6g56rxqi6szvimg680g1qcci1cgbbwdg3jpr8kzv"))))
    (build-system copy-build-system)
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (mkdir-p "src")
                   (copy-file source "src/xfsrtray")
                   (chmod "src/xfsrtray" #o755)
                   (chdir "src"))))
           #:install-plan #~'(("xfsrtray" "bin/xfsrtray"))))
    (synopsis "floating and customizable system tray for Linux")
    (description "Xfsrtray is a floating, customizable system tray for Linux
desktops written in Rust.  It provides a standalone system tray that can be
positioned and styled independently of the desktop environment.")
    (home-page "https://github.com/Byson94/xfsrtray")
    (license license:gpl3)))

;;; ===================================================================
;;; TARBALL / ZIP BINARY PACKAGES
;;; ===================================================================

;;; -------------------------------------------------------------------
;;; 9. gollama-bin — manage Ollama models from the terminal
;;; -------------------------------------------------------------------
(define-public gollama-bin
  (package
    (name "gollama-bin")
    (version "2.0.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/sammcj/gollama/releases/download/v"
                    version "/gollama-linux-amd64.zip"))
              (sha256
               (base32
                "1xqg9qglm9pqdbxidvnj26fxbv451r5l0i8hhwqlhc84isq1arik"))))
    (build-system copy-build-system)
    (native-inputs (list unzip))
    (arguments
     (list #:install-plan #~'(("gollama" "bin/gollama"))))
    (synopsis "TUI for managing Ollama models")
    (description "Gollama is a terminal user interface for managing Ollama
language models.  It provides listing, pulling, pushing, copying, and
removing models, as well as displaying model metadata and sizes.")
    (home-page "https://github.com/sammcj/gollama")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 10. wstunnel-bin — tunnel traffic over WebSocket protocol
;;; -------------------------------------------------------------------
(define-public wstunnel-bin
  (package
    (name "wstunnel-bin")
    (version "10.5.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/erebe/wstunnel/releases/download/v"
                    version "/wstunnel_" version "_linux_amd64.tar.gz"))
              (sha256
               (base32
                "1y0w3745f6zjs7b9lqxyabvlq3wrdzwbplyip2z5ds4i9qsy91vn"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("wstunnel" "bin/wstunnel"))))
    (synopsis "tunnel all your traffic over WebSocket protocol")
    (description "Wstunnel tunnels TCP and UDP traffic through WebSocket
connections, allowing bypass of restrictive firewalls and deep packet
inspection.  It supports both client and server modes with TLS encryption.")
    (home-page "https://github.com/erebe/wstunnel")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; 11. dprint-bin — pluggable code formatting platform
;;; -------------------------------------------------------------------
(define-public dprint-bin
  (package
    (name "dprint-bin")
    (version "0.54.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/dprint/dprint/releases/download/"
                    version "/dprint-x86_64-unknown-linux-gnu.zip"))
              (sha256
               (base32
                "1mycdbh4za31q8brbnhyz8nmjxs5fdv0z8429jkql3bd1md95dcc"))))
    (build-system copy-build-system)
    (native-inputs (list unzip))
    (arguments
     (list #:install-plan #~'(("dprint" "bin/dprint"))))
    (synopsis "pluggable and configurable code formatting platform")
    (description "Dprint is a pluggable and configurable code formatting
platform written in Rust.  It supports formatting TypeScript, JavaScript,
JSON, Markdown, TOML, and more through a plugin system, and is significantly
faster than Prettier.")
    (home-page "https://github.com/dprint/dprint")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 12. zigup-bin — download and manage Zig compilers
;;; -------------------------------------------------------------------
(define-public zigup-bin
  (package
    (name "zigup-bin")
    (version "2025_05_24")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/marler8997/zigup/releases/download/v"
                    version "/zigup-x86_64-linux.tar.gz"))
              (sha256
               (base32
                "1x74rdmaajn5pb2xbkb7250g69wljb8k0z5rnrz9dqw3ipxmkm0w"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("zigup" "bin/zigup"))))
    (synopsis "download and manage Zig compiler versions")
    (description "Zigup is a tool for downloading and managing multiple
versions of the Zig programming language compiler.  It allows switching
between Zig versions and keeps them organized in a central location.")
    (home-page "https://github.com/marler8997/zigup")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 13. naabu-bin — fast port scanner
;;; -------------------------------------------------------------------
(define-public naabu-bin
  (package
    (name "naabu-bin")
    (version "2.5.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/projectdiscovery/naabu"
                    "/releases/download/v" version
                    "/naabu_" version "_linux_amd64.zip"))
              (sha256
               (base32
                "0rmk53ixfrzb11ny7h682i3g76szcbh65ln308wb13w6clsfl0d4"))))
    (build-system copy-build-system)
    (native-inputs (list unzip))
    (arguments
     (list #:install-plan #~'(("naabu" "bin/naabu"))))
    (synopsis "fast port scanner with focus on reliability")
    (description "Naabu is a fast port scanner written in Go by
ProjectDiscovery.  It focuses on reliability and simplicity, supporting SYN,
CONNECT, and UDP scan types with configurable rate limiting and host
discovery.")
    (home-page "https://github.com/projectdiscovery/naabu")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 14. punfetch-bin — system fetch program with puns
;;; -------------------------------------------------------------------
(define-public punfetch-bin
  (package
    (name "punfetch-bin")
    (version "0.3.6")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ozwaldorf/punfetch/releases/download/"
                    version "/punfetch-" version "-x86_64.tar.gz"))
              (sha256
               (base32
                "0xbsmr7c1f8jqz7dgpr0wr6gnj8595zl6yhjxi9wnlgsmbfg66ap"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("punfetch" "bin/punfetch"))))
    (synopsis "system fetch program to pair with onefetch")
    (description "Punfetch is a fast system information fetch program written
in Rust.  It displays system details like OS, kernel, uptime, memory, and
CPU in the terminal, designed to complement onefetch for repository info.")
    (home-page "https://github.com/ozwaldorf/punfetch")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 15. loki-bin — log aggregation system
;;; -------------------------------------------------------------------
(define-public loki-bin
  (package
    (name "loki-bin")
    (version "3.7.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/grafana/loki/releases/download/v"
                    version "/loki-linux-amd64.zip"))
              (sha256
               (base32
                "0w5aarm1vbyn2l2mzqbd90g1azqq5y1swwkvj57bgm95lrips0pg"))))
    (build-system copy-build-system)
    (native-inputs (list unzip))
    (arguments
     (list #:install-plan #~'(("loki-linux-amd64" "bin/loki"))))
    (synopsis "log aggregation system inspired by Prometheus")
    (description "Loki is a horizontally scalable, highly available log
aggregation system inspired by Prometheus.  It indexes metadata about log
streams rather than log content, making it cost-effective and easy to
operate.")
    (home-page "https://github.com/grafana/loki")
    (license license:agpl3)))

;;; -------------------------------------------------------------------
;;; 16. skeema-bin — declarative SQL schema management
;;; -------------------------------------------------------------------
(define-public skeema-bin
  (package
    (name "skeema-bin")
    (version "1.13.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/skeema/skeema/releases/download/v"
                    version "/skeema_" version "_linux_amd64.tar.gz"))
              (sha256
               (base32
                "1mi14wdshb35gjqr228n6z7iyw5g8ikl9h9mvjz1mnjpbldf1xsd"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("skeema" "bin/skeema"))))
    (synopsis "declarative pure-SQL schema management for MySQL and MariaDB")
    (description "Skeema is a CLI tool for managing MySQL and MariaDB schemas
declaratively using pure SQL files.  It supports diff, push, pull, and lint
operations for database schemas, integrating with version control workflows.")
    (home-page "https://github.com/skeema/skeema")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 17. lima-bin — Linux virtual machines for containers
;;; -------------------------------------------------------------------
(define-public lima-bin
  (package
    (name "lima-bin")
    (version "2.1.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/lima-vm/lima/releases/download/v"
                    version "/lima-" version "-Linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0g1dvfhzx7d9g3bda1ds2j54pky7gbrzwg46inc6sry3x1fj728g"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("bin/limactl" "bin/limactl")
               ("share/" "share/"))))
    (synopsis "Linux virtual machines for running containerd")
    (description "Lima launches Linux virtual machines with automatic file
sharing and port forwarding, similar to WSL2.  It is primarily designed for
running containerd on macOS and Linux, supporting multiple VM types and
architectures.")
    (home-page "https://github.com/lima-vm/lima")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 18. pindock-bin — pin Docker image digests
;;; -------------------------------------------------------------------
(define-public pindock-bin
  (package
    (name "pindock-bin")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/deadnews/pindock/releases/download/v"
                    version "/pindock_" version "_linux_amd64.tar.gz"))
              (sha256
               (base32
                "02bhq3i5bn0rzaiamj7vr3qxklri6zcsm1sqpib0ci5gqdd37a5p"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("pindock" "bin/pindock"))))
    (synopsis "pin and update Docker image digests in Dockerfiles")
    (description "Pindock pins and updates Docker image digests in
Dockerfiles and Docker Compose files.  It replaces mutable tags with
immutable content-addressable digests for reproducible container builds.")
    (home-page "https://github.com/deadnews/pindock")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 19. okapi-bin — find and edit lines across files by regex
;;; -------------------------------------------------------------------
(define-public okapi-bin
  (package
    (name "okapi-bin")
    (version "0.5.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nk9/okapi/releases/download/v"
                    version "/okapi-v" version
                    "-x86_64-unknown-linux-gnu.tar.gz"))
              (sha256
               (base32
                "0hk8f8ila6cc0h1gaj0ifymjn4sawiamgc8vpssx6z2gw1vf8c75"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("okapi" "bin/okapi"))))
    (synopsis "find lines across files by regex and edit them interactively")
    (description "Okapi finds lines matching a regex pattern across multiple
files and opens them all at once in your editor for batch editing.  It is
written in Rust and designed for fast interactive multi-file search and
replace workflows.")
    (home-page "https://github.com/nk9/okapi")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 20. gitcredits-bin — generate movie-style git contributor credits
;;; -------------------------------------------------------------------
(define-public gitcredits-bin
  (package
    (name "gitcredits-bin")
    (version "0.1.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Higangssh/gitcredits"
                    "/releases/download/v" version
                    "/gitcredits_" version "_linux_amd64.tar.gz"))
              (sha256
               (base32
                "0phqaq0w52c3y4yk87n0yzb1hw0ajvwi6wr5gbhg1na24gzzsy8m"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("gitcredits" "bin/gitcredits"))))
    (synopsis "generate movie-style credits from git contributors")
    (description "Gitcredits generates movie-style scrolling credits from
git repository contributor data.  It parses the git log and displays
contributor names and statistics in a visually appealing format.")
    (home-page "https://github.com/Higangssh/gitcredits")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 21. jjui-bin — TUI for Jujutsu version control
;;; -------------------------------------------------------------------
(define-public jjui-bin
  (package
    (name "jjui-bin")
    (version "0.10.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/idursun/jjui/releases/download/v"
                    version "/jjui-" version "-linux-amd64.zip"))
              (sha256
               (base32
                "11rln2z70hq4g39ahwg15k15ms908lqim9gn7jdihc9lvy0czji4"))))
    (build-system copy-build-system)
    (native-inputs (list unzip))
    (arguments
     (list #:install-plan #~'(("jjui" "bin/jjui"))))
    (synopsis "terminal user interface for Jujutsu version control")
    (description "Jjui is a TUI for interacting with the Jujutsu (jj)
version control system.  It provides an interactive interface for browsing
revisions, creating bookmarks, rebasing, splitting, and squashing changes.")
    (home-page "https://github.com/idursun/jjui")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 22. tatuin-bin — task aggregator TUI
;;; -------------------------------------------------------------------
(define-public tatuin-bin
  (package
    (name "tatuin-bin")
    (version "0.26.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/panter-dsd/tatuin/releases/download/v"
                    version "/tatuin-Linux-gnu-x86_64.tar.gz"))
              (sha256
               (base32
                "1gqqs12zg415m4rxl5chs74jy5d9q0d3xixrw2nidx8dwrjx92wh"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("tatuin" "bin/tatuin"))))
    (synopsis "task aggregator TUI for Obsidian, Todoist, and GitLab")
    (description "Tatuin is a terminal user interface that aggregates tasks
from multiple sources including Obsidian vaults, Todoist, GitLab TODO
comments, and GitHub issues into a single unified view.")
    (home-page "https://github.com/panter-dsd/tatuin")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 23. cobalt-lang-bin — minimal interpreted programming language
;;; -------------------------------------------------------------------
(define-public cobalt-lang-bin
  (package
    (name "cobalt-lang-bin")
    (version "0.10.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/cobalt-lang/cobalt-lang"
                    "/releases/download/v" version
                    "/cobalt-v" version "-linux-x86_64.tar.xz"))
              (sha256
               (base32
                "1djw93441bjwsyyxwssfx5gr4biyczp21n1x864xx1bxzbanf8w3"))))
    (build-system copy-build-system)
    (native-inputs (list xz))
    (arguments
     (list #:install-plan #~'(("co" "bin/cobalt"))))
    (synopsis "minimal fast interpreted programming language")
    (description "Cobalt is a minimal, fast interpreted programming language
implemented in Rust.  It features a clean syntax, first-class functions,
pattern matching, and a focus on simplicity and performance.")
    (home-page "https://github.com/cobalt-lang/cobalt-lang")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 24. ipinfo-cli-bin — official CLI for the IPinfo API
;;; -------------------------------------------------------------------
(define-public ipinfo-cli-bin
  (package
    (name "ipinfo-cli-bin")
    (version "3.3.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ipinfo/cli/releases/download/ipinfo-"
                    version "/ipinfo_" version "_linux_amd64.tar.gz"))
              (sha256
               (base32
                "02l475h9y1x3hqp4q39d8c6ldwbd923hiwfh0ff9f7xrzic2krl1"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("ipinfo_3.3.1_linux_amd64" "bin/ipinfo"))))
    (synopsis "official command-line interface for the IPinfo API")
    (description "IPinfo CLI is the official command-line tool for the IPinfo
IP geolocation and other data API.  It provides IP lookups, bulk processing,
ASN queries, and CIDR calculations directly from the terminal.")
    (home-page "https://github.com/ipinfo/cli")
    (license license:asl2.0)))

;;; ===================================================================
;;; .DEB BINARY PACKAGES
;;; ===================================================================

;;; -------------------------------------------------------------------
;;; 25. axiocnc-bin — G-Code sender for CNC machines
;;; -------------------------------------------------------------------
(define-public axiocnc-bin
  (package
    (name "axiocnc-bin")
    (version "0.0.89")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/rsteckler/AxioCNC/releases/download/v"
                    version "/axiocnc-desktop_" version "_amd64.deb"))
              (sha256
               (base32
                "1s6hd44srp9r3rhj5icmlxkq3j4x871kfs9ig0sh05b3lw9zcn33"))))
    (build-system copy-build-system)
    (native-inputs (list tar gzip))
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (invoke "ar" "x" source)
                   (invoke "tar" "xf" "data.tar.gz")
                   ;; Some debs use data.tar.xz
                   #t)))
           #:install-plan
           #~'(("usr/bin/" "bin/")
               ("usr/share/" "share/"))))
    (synopsis "G-code sender built for stable CNC machine runs")
    (description "AxioCNC is a web-based G-code sender designed for
stable, predictable CNC machine runs.  It provides a desktop application
for controlling CNC routers and mills with real-time visualization and
job management.")
    (home-page "https://github.com/rsteckler/AxioCNC")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 26. windscribe-cli-v2-bin — Windscribe VPN CLI
;;; -------------------------------------------------------------------
(define-public windscribe-cli-v2-bin
  (package
    (name "windscribe-cli-v2-bin")
    (version "2.21.7")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Windscribe/Desktop-App"
                    "/releases/download/v" version
                    "/windscribe-cli_" version "_amd64.deb"))
              (sha256
               (base32
                "04z9f41wdycs8q3nmxz8j5r17vkzh9849vrxy6ckl5aaysfazd49"))))
    (build-system copy-build-system)
    (native-inputs (list tar gzip))
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (invoke "ar" "x" source)
                   (invoke "tar" "xf" "data.tar.gz")
                   #t)))
           #:install-plan
           #~'(("usr/bin/" "bin/")
               ("usr/share/" "share/"))))
    (synopsis "Windscribe VPN command-line client for Linux")
    (description "Windscribe CLI is the official command-line VPN client for
Windscribe on Linux.  It provides connecting to VPN servers, managing
preferences, and controlling the firewall from the terminal.")
    (home-page "https://github.com/Windscribe/Desktop-App")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 27. sharik-bin — cross-platform file sharing via Wi-Fi
;;; -------------------------------------------------------------------
(define-public sharik-bin
  (package
    (name "sharik-bin")
    (version "3.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/marchellodev/sharik/releases/download/v"
                    version "/sharik_v" version "_linux.zip"))
              (sha256
               (base32
                "1hmf8lkws30mp9wphn4x0nn8kxv2rq2afpd344z3v3xx7nrw4f5h"))))
    (build-system copy-build-system)
    (native-inputs (list unzip))
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (add-after 'unpack 'make-executable
                 (lambda _
                   (chmod "sharik" #o755))))
           #:install-plan #~'(("sharik" "bin/sharik"))))
    (synopsis "cross-platform file sharing solution via Wi-Fi or mobile")
    (description "Sharik is an open-source, cross-platform solution for
sharing files via Wi-Fi or mobile hotspot.  It works without an internet
connection and supports sharing between any devices on the same local
network.")
    (home-page "https://github.com/marchellodev/sharik")
    (license license:expat)))
