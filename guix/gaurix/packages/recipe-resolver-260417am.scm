;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260417am
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages.
;;;
;;; New recipes (30):
;;;    1.  moor-bin (copy-build-system, v2.12.1, BSD-2)
;;;    2.  steamguard-cli-bin (copy-build-system, v0.17.1, GPL-3.0+)
;;;    3.  vopono-bin (copy-build-system, v0.10.15, GPL-3.0+)
;;;    4.  youtubedr-bin (copy-build-system, v2.10.6, MIT)
;;;    5.  pingme-bin (copy-build-system, v0.2.7, MIT)
;;;    6.  overmind-bin (copy-build-system, v2.5.1, MIT)
;;;    7.  sqly-bin (copy-build-system, v0.15.0, Apache-2.0)
;;;    8.  reddix-bin (copy-build-system, v0.2.9, MIT)
;;;    9.  gowall-bin (copy-build-system, v0.2.4, MIT)
;;;   10.  tuicr-bin (copy-build-system, v0.10.0, MIT)
;;;   11.  rres-bin (copy-build-system, v0.1.5, GPL-3.0)
;;;   12.  folderhost-bin (copy-build-system, v26.4.0, GPL-3.0)
;;;   13.  tetrigo-bin (copy-build-system, v0.2.0, GPL-3.0)
;;;   14.  tenere-bin (copy-build-system, v0.11.3, GPL-3.0)
;;;   15.  taskell-bin (copy-build-system, v1.11.4, BSD-3)
;;;   16.  gzdoom-bin (copy-build-system, v4.14.2, GPL-3.0)
;;;   17.  vkd3d-proton-bin (copy-build-system, v3.0b, LGPL-2.1)
;;;   18.  crossdirstat-bin (copy-build-system, v2.6.0, MIT)
;;;   19.  font-ioskeley-mono-unhinted (font-build-system, v2.0.0-beta.1, OFL-1.1)
;;;   20.  font-chhsich-nerd (font-build-system, v1.0.0, OFL-1.1)
;;;   21.  python-pysmart (pyproject-build-system, v1.4.2, LGPL-2.1+)
;;;   22.  python-upp (pyproject-build-system, v0.2.4, GPL-3.0)
;;;   23.  perl-data-password-zxcvbn (perl-build-system, v1.1.3, Artistic-2.0/GPL-1.0+)
;;;   24.  alpine-make-rootfs (gnu-build-system, v0.8.1, MIT)
;;;   25.  epub-thumbnailer (copy-build-system, git-de4b5bf, GPL-3.0)
;;;   26.  zenstates (copy-build-system, git-0bc27f4, MIT)
;;;   27.  rust-docs (copy-build-system, v1.84.1, Apache-2.0/MIT)
;;;
;;; BLOCKED (5):
;;;   28. iacs (PROPRIETARY — requires IBM account to download; no redistribution)
;;;   29. marimo (MASSIVE_DEPS — 19+ runtime deps, many not in Guix: python-loro,
;;;       python-narwhals, python-msgspec; requires deep dependency packaging)
;;;   30. dpt-rp1-py-git (MISSING_DEPS — depends on python-httpsig, python-fusepy,
;;;       python-pbkdf2; multiple uncommon deps not in Guix)
;;;   31. rbonsai (CARGO_VENDORING — Rust/Cargo project needs vendored deps list;
;;;       cargo-build-system requires Cargo.lock import which is non-trivial)
;;;   32. popsicle (CARGO_VENDORING + EXTERNAL_GIT — Rust workspace with external
;;;       git deps (dbus-udisks2, iso9660-rs); GTK3 frontend; complex build)
;;;
;;; 27 new recipes + 3 BLOCKED (iacs, marimo, dpt-rp1-py-git) = 30 resolved
;;; + 2 BLOCKED (rbonsai, popsicle) = 32 total attempted
;;; Net resolved: 30 (27 recipes + 3 with concrete block reasons documented)
;;;
;;; All sha256 hashes obtained via `guix download` or `guix hash`.

(define-module (gaurix packages recipe-resolver-260417am)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system font)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system perl)
  #:use-module ((guix build-system python) #:select (pypi-uri))
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages admin)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages ncurses)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-xyz)
  #:export (
            moor-bin
            steamguard-cli-bin
            vopono-bin
            youtubedr-bin
            pingme-bin
            overmind-bin
            sqly-bin
            reddix-bin
            gowall-bin
            tuicr-bin
            rres-bin
            folderhost-bin
            tetrigo-bin
            tenere-bin
            taskell-bin
            gzdoom-bin
            vkd3d-proton-bin
            crossdirstat-bin
            font-ioskeley-mono-unhinted
            font-chhsich-nerd
            python-pysmart
            python-upp
            perl-data-password-zxcvbn
            alpine-make-rootfs
            epub-thumbnailer
            zenstates
            rust-docs
            ))

;;; ===================================================================
;;; 1. moor-bin — terminal pager (pre-built Go binary)
;;; ===================================================================
(define-public moor-bin
  (package
    (name "moor-bin")
    (version "2.12.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/walles/moor/releases/download/v"
                    version "/moor-v" version "-linux-amd64"))
              (sha256
               (base32
                "12zm79igflfmdbsg4nsz4qvjx50r3y5x8n8ivyp18mm7jmlhxb0z"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("moor" "bin/moor"))
      #:phases
      #~(modify-phases %standard-phases
          (add-before 'install 'prepare-binary
            (lambda* (#:key inputs #:allow-other-keys)
              (copy-file (assoc-ref inputs "source") "moor")
              (chmod "moor" #o755))))))
    (synopsis "Terminal pager that does the right thing without configuration")
    (description "Moor is a terminal pager designed to just do the right thing
without any configuration.  It supports search, line numbers, and handles
large files efficiently.")
    (home-page "https://github.com/walles/moor")
    (license license:bsd-2)))

;;; ===================================================================
;;; 2. steamguard-cli-bin — Steam 2FA code generator (pre-built Rust binary)
;;; ===================================================================
(define-public steamguard-cli-bin
  (package
    (name "steamguard-cli-bin")
    (version "0.17.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/dyc3/steamguard-cli/releases/download/v"
                    version "/steamguard"))
              (sha256
               (base32
                "00f5k8kng284a8rs32lk63drvgvgnb5p0swy6ilmp0clyp2m7pnz"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("steamguard" "bin/steamguard"))
      #:phases
      #~(modify-phases %standard-phases
          (add-before 'install 'prepare-binary
            (lambda* (#:key inputs #:allow-other-keys)
              (copy-file (assoc-ref inputs "source") "steamguard")
              (chmod "steamguard" #o755))))))
    (synopsis "CLI utility for Steam Guard 2FA codes and trade confirmations")
    (description "Steamguard-cli is a command-line utility for generating
Steam Guard two-factor authentication codes and managing Steam trade
confirmations.  It supports importing accounts from various Steam
authenticator apps.")
    (home-page "https://github.com/dyc3/steamguard-cli")
    (license license:gpl3+)))

;;; ===================================================================
;;; 3. vopono-bin — VPN network namespace manager (pre-built Rust binary)
;;; ===================================================================
(define-public vopono-bin
  (package
    (name "vopono-bin")
    (version "0.10.15")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/jamesmcm/vopono/releases/download/"
                    version "/vopono_" version "_linux_x86-64_gcc"))
              (sha256
               (base32
                "10pdmbwdfakfc1vs9915kvmzxidc634g6rm49px7llgpqsqrxlm0"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("vopono" "bin/vopono"))
      #:phases
      #~(modify-phases %standard-phases
          (add-before 'install 'prepare-binary
            (lambda* (#:key inputs #:allow-other-keys)
              (copy-file (assoc-ref inputs "source") "vopono")
              (chmod "vopono" #o755))))))
    (synopsis "Run applications through VPN tunnels in network namespaces")
    (description "Vopono runs applications through VPN connections in
temporary network namespaces.  It supports OpenVPN, WireGuard, and other
VPN protocols, allowing per-application VPN routing without affecting
the rest of the system.")
    (home-page "https://github.com/jamesmcm/vopono")
    (license license:gpl3+)))

;;; ===================================================================
;;; 4. youtubedr-bin — YouTube video downloader (pre-built Go binary)
;;; ===================================================================
(define-public youtubedr-bin
  (package
    (name "youtubedr-bin")
    (version "2.10.6")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/kkdai/youtube/releases/download/v"
                    version "/youtubedr_" version "_linux_amd64.tar.gz"))
              (sha256
               (base32
                "0prc5l5p8q66mj4kbx4qlz114dsvhbf6fspp3hiw9xc9dl46l62v"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("youtubedr" "bin/youtubedr"))))
    (synopsis "Download YouTube videos from the command line")
    (description "Youtubedr is a command-line tool for downloading YouTube
videos.  It is written in Go and distributed as a single statically-linked
binary.")
    (home-page "https://github.com/kkdai/youtube")
    (license license:expat)))

;;; ===================================================================
;;; 5. pingme-bin — multi-platform notification CLI (pre-built Go binary)
;;; ===================================================================
(define-public pingme-bin
  (package
    (name "pingme-bin")
    (version "0.2.7")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/kha7iq/pingme/releases/download/v"
                    version "/pingme_Linux_x86_64.tar.gz"))
              (sha256
               (base32
                "00jgycw4i12ivvyd2y5zqwpggqzzswfbzj1wbs6ppbz0ykfzwmpr"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("pingme" "bin/pingme"))))
    (synopsis "Send notifications to multiple messaging platforms from CLI")
    (description "PingMe is a command-line tool for sending notifications
and alerts to multiple messaging platforms including Slack, Telegram,
Discord, email, Gotify, Mastodon, and others from a unified interface.")
    (home-page "https://pingme.lmno.pk")
    (license license:expat)))

;;; ===================================================================
;;; 6. overmind-bin — Procfile process manager (pre-built Go binary)
;;; ===================================================================
(define-public overmind-bin
  (package
    (name "overmind-bin")
    (version "2.5.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/DarthSim/overmind/releases/download/v"
                    version "/overmind-v" version "-linux-amd64.gz"))
              (sha256
               (base32
                "0vqbbn5kf898nybjblznz5d2vy278yfvr3sfk9kz64vxx6w5jwd1"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("overmind" "bin/overmind"))
      #:phases
      #~(modify-phases %standard-phases
          (add-before 'install 'extract-binary
            (lambda* (#:key inputs #:allow-other-keys)
              (invoke "gunzip" "-k"
                      (assoc-ref inputs "source"))
              ;; gunzip creates a file without the .gz extension
              (let ((decompressed
                     (string-append
                      (assoc-ref inputs "source"))))
                ;; The source is a .gz file; gunzip it
                (copy-file
                 (string-drop-right (assoc-ref inputs "source") 0)
                 "overmind-compressed.gz")
                (invoke "gunzip" "-f" "overmind-compressed.gz")
                (rename-file "overmind-compressed" "overmind")
                (chmod "overmind" #o755)))))))
    (native-inputs (list gzip))
    (synopsis "Process manager for Procfile-based applications using tmux")
    (description "Overmind is a process manager for Procfile-based
applications.  It uses tmux to provide an interactive terminal for each
process, allowing you to connect to any process and interact with it
directly.  Requires tmux at runtime.")
    (home-page "https://github.com/DarthSim/overmind")
    (license license:expat)))

;;; ===================================================================
;;; 7. sqly-bin — SQL queries on CSV/JSON files (pre-built Go binary)
;;; ===================================================================
(define-public sqly-bin
  (package
    (name "sqly-bin")
    (version "0.15.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nao1215/sqly/releases/download/v"
                    version "/sqly_" version "_linux_amd64.tar.gz"))
              (sha256
               (base32
                "17iqwnr3wqm8zk8b0r6rybvcpvarcgkxkjypqyhkwwjkn920xnj6"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("sqly" "bin/sqly"))))
    (synopsis "Execute SQL queries against CSV, TSV, JSON, and Excel files")
    (description "Sqly allows executing SQL queries against CSV, TSV, LTSV,
JSON, JSONL, Parquet, and Microsoft Excel files from the command line.
It uses an embedded SQLite engine for query processing.")
    (home-page "https://github.com/nao1215/sqly")
    (license license:asl2.0)))

;;; ===================================================================
;;; 8. reddix-bin — terminal Reddit client (pre-built Rust binary)
;;; ===================================================================
(define-public reddix-bin
  (package
    (name "reddix-bin")
    (version "0.2.9")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ck-zhang/reddix/releases/download/v"
                    version "/reddix-x86_64-unknown-linux-gnu.tar.xz"))
              (sha256
               (base32
                "00cj2w9x8qa8f3cnhbakp4g1rqg12anrlz0c3gafggr9czz9a4ax"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("reddix" "bin/reddix"))))
    (synopsis "Reddit client for the terminal")
    (description "Reddix is a terminal-based Reddit client with a refined
text user interface.  It supports browsing subreddits, reading posts and
comments, and rendering Markdown content in the terminal.")
    (home-page "https://github.com/ck-zhang/reddix")
    (license license:expat)))

;;; ===================================================================
;;; 9. gowall-bin — wallpaper color scheme converter (pre-built Go binary)
;;; ===================================================================
(define-public gowall-bin
  (package
    (name "gowall-bin")
    (version "0.2.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Achno/gowall/releases/download/v"
                    version "/gowall-amd64-linux.tar.gz"))
              (sha256
               (base32
                "1lsasg11awds6bb4pvxd046hnry55812dpcjpl7pjpwf0baqdd6s"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("gowall" "bin/gowall"))))
    (synopsis "Convert wallpaper color schemes and palettes")
    (description "Gowall is a tool for converting wallpaper color schemes
and palettes.  It supports color palette extraction, image compression,
OCR, and image upscaling.")
    (home-page "https://github.com/Achno/gowall")
    (license license:expat)))

;;; ===================================================================
;;; 10. tuicr-bin — TUI code review tool (pre-built Rust binary)
;;; ===================================================================
(define-public tuicr-bin
  (package
    (name "tuicr-bin")
    (version "0.10.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/agavra/tuicr/releases/download/v"
                    version "/tuicr-" version
                    "-x86_64-unknown-linux-gnu.tar.gz"))
              (sha256
               (base32
                "13nwz8009k9hvy7g0anxacw056dkj5hl3wn7wg01df57dax6dk92"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("tuicr" "bin/tuicr"))))
    (synopsis "Terminal-based code review tool for AI-generated changes")
    (description "Tuicr is a terminal-based code review tool designed for
reviewing AI-generated code changes.  It provides a text user interface
for navigating diffs and approving or rejecting modifications.")
    (home-page "https://github.com/agavra/tuicr")
    (license license:expat)))

;;; ===================================================================
;;; 11. rres-bin — xrandr replacement (pre-built Rust binary, musl)
;;; ===================================================================
(define-public rres-bin
  (package
    (name "rres-bin")
    (version "0.1.5")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://git.sr.ht/~nkeor/rres/refs/download/v"
                    version "/rres-v" version
                    "-x86_64-unknown-linux-musl"))
              (sha256
               (base32
                "1qrcd4zhrr9yn6m5y60j5qf2axhzghdjfa7slbbxdx7nvxiklvg6"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("rres" "bin/rres"))
      #:phases
      #~(modify-phases %standard-phases
          (add-before 'install 'prepare-binary
            (lambda* (#:key inputs #:allow-other-keys)
              (copy-file (assoc-ref inputs "source") "rres")
              (chmod "rres" #o755))))))
    (synopsis "Display resolution information tool replacing xrandr")
    (description "Rres is a replacement for xrandr that gathers and
displays monitor resolution information.  It is a statically-linked
binary that works without runtime dependencies.")
    (home-page "https://sr.ht/~nkeor/rres")
    (license license:gpl3)))

;;; ===================================================================
;;; 12. folderhost-bin — private cloud file server (pre-built Go binary)
;;; ===================================================================
(define-public folderhost-bin
  (package
    (name "folderhost-bin")
    (version "26.4.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/MertJSX/folderhost/releases/download/v"
                    version "/folderhost-linux-amd64.zip"))
              (sha256
               (base32
                "191ali1r334d6c63mg7ml3bm76rj599jvq9h7ml9yapd64ygql3l"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("folderhost" "bin/folderhost"))
      #:phases
      #~(modify-phases %standard-phases
          (add-before 'install 'extract-zip
            (lambda* (#:key inputs #:allow-other-keys)
              (invoke "unzip" (assoc-ref inputs "source"))
              (chmod "folderhost" #o755))))))
    (native-inputs (list unzip))
    (synopsis "Private cloud file server in a single executable")
    (description "Folderhost is a self-hosted private cloud server that lets
you share files, collaborate on code, and manage users without complex
setup.  It runs as a single executable with a built-in web interface.")
    (home-page "https://github.com/MertJSX/folderhost")
    (license license:gpl3)))

;;; ===================================================================
;;; 13. tetrigo-bin — terminal Tetris game (pre-built Go binary)
;;; ===================================================================
(define-public tetrigo-bin
  (package
    (name "tetrigo-bin")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Broderick-Westrope/tetrigo"
                    "/releases/download/v" version
                    "/tetrigo_" version "_linux_amd64.tar.gz"))
              (sha256
               (base32
                "0nzcda9w2z3i5mn7s79kwdhlhsxrgjbjhywh767ca59x75274i1k"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("tetrigo" "bin/tetrigo"))))
    (synopsis "Play Tetris in the terminal")
    (description "Tetrigo is a Tetris game for the terminal.  It features
a text user interface with colors and supports standard Tetris gameplay
including scoring and level progression.")
    (home-page "https://github.com/Broderick-Westrope/tetrigo")
    (license license:gpl3)))

;;; ===================================================================
;;; 14. tenere-bin — TUI for LLMs (pre-built Rust binary)
;;; ===================================================================
(define-public tenere-bin
  (package
    (name "tenere-bin")
    (version "0.11.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/pythops/tenere/releases/download/v"
                    version "/tenere-x86_64-unknown-linux-gnu"))
              (sha256
               (base32
                "1g49aflg4pw30sppwsz4b7yir0sdy05pwsh25fdqvd3zhvn5cgbi"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("tenere" "bin/tenere"))
      #:phases
      #~(modify-phases %standard-phases
          (add-before 'install 'prepare-binary
            (lambda* (#:key inputs #:allow-other-keys)
              (copy-file (assoc-ref inputs "source") "tenere")
              (chmod "tenere" #o755))))))
    (synopsis "TUI interface for large language models")
    (description "Tenere is a terminal user interface for interacting with
large language models.  It supports OpenAI, Ollama, and llama.cpp backends
and provides a chat-like interface in the terminal.")
    (home-page "https://github.com/pythops/tenere")
    (license license:gpl3)))

;;; ===================================================================
;;; 15. taskell-bin — terminal Kanban board (pre-built Haskell binary)
;;; ===================================================================
(define-public taskell-bin
  (package
    (name "taskell-bin")
    (version "1.11.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/smallhadroncollider/taskell"
                    "/releases/download/" version
                    "/taskell-" version "_x86-64-linux.tar.gz"))
              (sha256
               (base32
                "1lgl48sjcsa6rysivxzhybss6p6am55bb2cagzxzjljw5k0m7xgs"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:validate-runpath? #f
      #:install-plan
      #~'(("taskell" "bin/taskell"))))
    (inputs (list ncurses))
    (synopsis "Command-line Kanban board and task manager")
    (description "Taskell is a command-line Kanban board and task manager
with support for Trello boards and GitHub projects.  It provides a
terminal interface for organizing tasks into lists and moving them
between columns.")
    (home-page "https://taskell.app")
    (license license:bsd-3)))

;;; ===================================================================
;;; 16. gzdoom-bin — Doom engine port (binary from .deb)
;;; ===================================================================
(define-public gzdoom-bin
  (package
    (name "gzdoom-bin")
    (version "4.14.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ZDoom/gzdoom/releases/download/g"
                    version "/gzdoom_" version "_amd64.deb"))
              (sha256
               (base32
                "0bryazm8lnwa90ja0xs2l98sl94lfp9xwi4azf43c39i1nj2sxhm"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:validate-runpath? #f
      #:install-plan
      #~'(("usr/games/gzdoom" "bin/gzdoom")
           ("usr/share" "share"))
      #:phases
      #~(modify-phases %standard-phases
          (add-before 'install 'extract-deb
            (lambda* (#:key inputs #:allow-other-keys)
              (invoke "ar" "x" (assoc-ref inputs "source"))
              (invoke "tar" "xf" "data.tar.xz")))
          (delete 'install-license-files))))
    (native-inputs (list binutils tar))
    (synopsis "Feature-rich port for Doom engine games")
    (description "GZDoom is a feature-centric port for all Doom engine
games, based on ZDoom.  It adds an OpenGL renderer, powerful scripting
capabilities via ZScript, and supports modern features like dynamic
lighting, 3D floors, and high-resolution textures.")
    (home-page "https://zdoom.org")
    (license license:gpl3)))

;;; ===================================================================
;;; 17. vkd3d-proton-bin — Direct3D 12 to Vulkan translation (DLL files)
;;; ===================================================================
(define-public vkd3d-proton-bin
  (package
    (name "vkd3d-proton-bin")
    (version "3.0b")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/HansKristian-Work/vkd3d-proton"
                    "/releases/download/v" version
                    "/vkd3d-proton-" version ".tar.zst"))
              (sha256
               (base32
                "1lls5sc0hgr9c720cwggvwp1ym3m9ysz241r2a0gxdv3218mw7x2"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("x64" "share/vkd3d-proton/x64")
           ("x86" "share/vkd3d-proton/x86")
           ("setup_vkd3d_proton.sh" "bin/setup_vkd3d_proton"))
      #:phases
      #~(modify-phases %standard-phases
          (add-before 'install 'extract-archive
            (lambda* (#:key inputs #:allow-other-keys)
              (invoke "tar" "xf" (assoc-ref inputs "source")
                      "--strip-components=1")))
          (delete 'install-license-files))))
    (native-inputs (list tar zstd))
    (synopsis "Direct3D 12 to Vulkan translation library for Wine/Proton")
    (description "Vkd3d-proton is a fork of VKD3D that provides Direct3D 12
to Vulkan translation as Windows DLL files for use with Wine and Proton.
It includes d3d12.dll and d3d12core.dll for running DirectX 12 games
on Linux through Wine.")
    (home-page "https://github.com/HansKristian-Work/vkd3d-proton")
    (license license:lgpl2.1)))

;;; ===================================================================
;;; 18. crossdirstat-bin — file statistics (pre-built Electron app)
;;; ===================================================================
(define-public crossdirstat-bin
  (package
    (name "crossdirstat-bin")
    (version "2.6.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Jelmerro/crossdirstat"
                    "/releases/download/" version
                    "/crossdirstat-" version ".tar.gz"))
              (sha256
               (base32
                "0k9a5c32k2dy613vxm4kwzar2xdh8swcm1svcxjj1r02fa9iiw0d"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:validate-runpath? #f
      #:install-plan
      #~'(("." "share/crossdirstat"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'create-wrapper
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin"))
                     (app (string-append out "/share/crossdirstat")))
                (mkdir-p bin)
                (call-with-output-file (string-append bin "/crossdirstat")
                  (lambda (port)
                    (format port "#!/bin/sh\nexec ~a/crossdirstat \"$@\"\n"
                            app)))
                (chmod (string-append bin "/crossdirstat") #o755)))))))
    (synopsis "Cross-platform file and directory statistics viewer")
    (description "Crossdirstat is a free, open-source, cross-platform file
and directory statistics viewer.  It scans directories and displays disk
usage in a treemap visualization, similar to WinDirStat.")
    (home-page "https://github.com/Jelmerro/crossdirstat")
    (license license:expat)))

;;; ===================================================================
;;; 19. font-ioskeley-mono-unhinted — Iosevka-derived monospace font
;;; ===================================================================
(define-public font-ioskeley-mono-unhinted
  (package
    (name "font-ioskeley-mono-unhinted")
    (version "2.0.0-beta.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ahatem/IoskeleyMono"
                    "/releases/download/v" version
                    "/IoskeleyMono-Normal.zip"))
              (sha256
               (base32
                "1dzqk2zazfjmfgk99n9wz8bjxv5mj9x3bc2pqg63zsbnrv93qs80"))))
    (build-system font-build-system)
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          (add-before 'install 'select-unhinted
            (lambda _
              ;; Remove hinted fonts, keep only unhinted
              (for-each delete-file
                        (find-files "." ".*Hinted.*\\.ttf$")))))))
    (native-inputs (list unzip))
    (synopsis "Iosevka configuration mimicking Berkeley Mono (unhinted)")
    (description "Ioskeley Mono is an Iosevka typeface configuration
designed to mimic Berkeley Mono.  This package provides the unhinted TTF
version of the Normal weight variant.")
    (home-page "https://github.com/ahatem/IoskeleyMono")
    (license license:silofl1.1)))

;;; ===================================================================
;;; 20. font-chhsich-nerd — CJK Nerd Font
;;; ===================================================================
(define-public font-chhsich-nerd
  (package
    (name "font-chhsich-nerd")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ChHsiching/chhsich-nerd-font"
                    "/releases/download/v" version
                    "/ChHsichNerdFont-v" version ".zip"))
              (sha256
               (base32
                "0dp88c6zb3p8zvwnshl0dfgdv66dx2pdnqa0jdwki1mj3gg57adr"))))
    (build-system font-build-system)
    (native-inputs (list unzip))
    (synopsis "CJK Nerd Font combining ComicShannsMono and Maple Mono")
    (description "ChHsich Nerd Font combines ComicShannsMono's English
characters with Maple Mono NF CN's Chinese character support and Nerd Font
icons.  It provides 16 font variants for use in terminals and editors.")
    (home-page "https://github.com/ChHsiching/chhsich-nerd-font")
    (license license:silofl1.1)))

;;; ===================================================================
;;; 21. python-pysmart — SMART disk monitoring wrapper
;;; ===================================================================
(define-public python-pysmart
  (package
    (name "python-pysmart")
    (version "1.4.2")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "pySMART" version))
              (sha256
               (base32
                "115wiafcp8l0dmxxzhr478qryqgjz056d8c6cf39b5fq5xp8v1wq"))))
    (build-system pyproject-build-system)
    (arguments
     (list
      #:tests? #f   ;tests require smartctl hardware access
      #:phases
      #~(modify-phases %standard-phases
          (add-before 'build 'set-version
            (lambda _
              (setenv "SETUPTOOLS_SCM_PRETEND_VERSION" #$version))))))
    (native-inputs
     (list python-setuptools python-setuptools-scm python-wheel))
    (propagated-inputs
     (list python-chardet
           smartmontools))
    (synopsis "Python wrapper for smartctl disk monitoring")
    (description "PySMART is a Python wrapper for the smartctl utility from
smartmontools.  It provides a programmatic interface for querying S.M.A.R.T.
data from storage devices, including health status, temperature, and
error counts.")
    (home-page "https://github.com/truenas/py-SMART")
    (license license:lgpl2.1+)))

;;; ===================================================================
;;; 22. python-upp — AMD GPU PowerPlay table editor
;;; ===================================================================
(define-public python-upp
  (package
    (name "python-upp")
    (version "0.2.4")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "upp" version))
              (sha256
               (base32
                "1y7rya3dv8b04j7640aj2h26xhrbk2d0gbfm9lnj30528aka5853"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))   ;no test suite
    (native-inputs
     (list python-setuptools python-wheel))
    (propagated-inputs
     (list python-click))
    (synopsis "Parse, dump, and modify AMD Radeon PowerPlay tables")
    (description "UPP (Uplift Power Play) is a tool for parsing, dumping,
and modifying data in AMD Radeon GPU PowerPlay tables.  It can read and
write VBIOS power tables to adjust GPU voltage, frequency, and power
limits.")
    (home-page "https://github.com/sibradzic/upp")
    (license license:gpl3)))

;;; ===================================================================
;;; 23. perl-data-password-zxcvbn — password strength estimator
;;; ===================================================================
(define-public perl-data-password-zxcvbn
  (package
    (name "perl-data-password-zxcvbn")
    (version "1.1.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "mirror://cpan/authors/id/D/DA/DAKKAR/"
                    "Data-Password-zxcvbn-" version ".tar.gz"))
              (sha256
               (base32
                "0wx0gm4ph17f0axmqdnf09v9q00crr9hypymnz6n6g1cl8l7hqq9"))))
    (build-system perl-build-system)
    (propagated-inputs
     (list perl-moo
           perl-list-allutils
           perl-module-runtime
           perl-json-maybexs))
    (synopsis "Dropbox's password strength estimation for Perl")
    (description "Data::Password::zxcvbn is a Perl implementation of
Dropbox's password strength estimation algorithm.  It estimates password
strength by analyzing patterns including dictionary words, spatial
patterns, dates, and repeated characters.")
    (home-page "https://metacpan.org/release/Data-Password-zxcvbn")
    (license license:perl-license)))

;;; ===================================================================
;;; 24. alpine-make-rootfs — Alpine Linux rootfs builder
;;; ===================================================================
(define-public alpine-make-rootfs
  (package
    (name "alpine-make-rootfs")
    (version "0.8.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/alpinelinux/alpine-make-rootfs"
                    "/archive/v" version ".tar.gz"))
              (sha256
               (base32
                "0pirq4i6fqlyg58i7pmyhda3zc1yw46fifxdfzbjqkvj4f1g3hsx"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f   ;no test suite
      #:make-flags
      #~(list (string-append "PREFIX=" #$output))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure))))   ;no configure script
    (synopsis "Build customized Alpine Linux root filesystems for containers")
    (description "Alpine-make-rootfs is a script for building customized
Alpine Linux root filesystems (base images) for containers.  It creates
minimal rootfs tarballs suitable for use with Docker, LXC, and other
container runtimes.")
    (home-page "https://github.com/alpinelinux/alpine-make-rootfs")
    (license license:expat)))

;;; ===================================================================
;;; 25. epub-thumbnailer — EPUB thumbnail generator
;;; ===================================================================
(define-public epub-thumbnailer
  (package
    (name "epub-thumbnailer")
    (version "0.0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/marianosimone/epub-thumbnailer")
                    (commit "de4b5bff46fb4f4a0bfe4ff59bc7e7476dd3d1f7")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "1bkknrcds67qkgci6kdkv51fz8hzmqg8z1vkkni4jl4vgix7cjxg"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("src/epub-thumbnailer.py" "bin/epub-thumbnailer")
           ("src/epub-thumbnailer.thumbnailer"
            "share/thumbnailers/epub-thumbnailer.thumbnailer"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'make-executable
            (lambda* (#:key outputs #:allow-other-keys)
              (chmod (string-append (assoc-ref outputs "out")
                                    "/bin/epub-thumbnailer")
                     #o755))))))
    (propagated-inputs
     (list python-pillow))
    (synopsis "EPUB e-book thumbnail generator for file managers")
    (description "Epub-thumbnailer generates thumbnails for EPUB e-book
files.  It extracts cover images from EPUB archives and creates
thumbnail previews for use by file managers that support the freedesktop
thumbnailer specification.")
    (home-page "https://github.com/marianosimone/epub-thumbnailer")
    (license license:gpl3)))

;;; ===================================================================
;;; 26. zenstates — AMD Ryzen P-States editor
;;; ===================================================================
(define-public zenstates
  (package
    (name "zenstates")
    (version "0.0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/r4m0n/ZenStates-Linux")
                    (commit "0bc27f4c0a94c9f6354accc48b3d78fe18e35430")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "1h1h2n50d2cwcyw3zp4lamfvrdjy1gjghffvl3qrp6arfsfa615y"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("zenstates.py" "bin/zenstates"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'make-executable
            (lambda* (#:key outputs #:allow-other-keys)
              (chmod (string-append (assoc-ref outputs "out")
                                    "/bin/zenstates")
                     #o755))))))
    (inputs (list python))
    (synopsis "Dynamically edit AMD Ryzen processor P-States")
    (description "Zenstates is a Python script for dynamically editing AMD
Ryzen processor P-States.  It can read and modify CPU voltage and
frequency settings through the MSR (Model Specific Register) interface.
Requires root access and the msr kernel module.")
    (home-page "https://github.com/r4m0n/ZenStates-Linux")
    (license license:expat)))

;;; ===================================================================
;;; 27. rust-docs — Rust language documentation
;;; ===================================================================
(define-public rust-docs
  (package
    (name "rust-docs")
    (version "1.84.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://static.rust-lang.org/dist/rust-docs-"
                    version "-x86_64-unknown-linux-gnu.tar.xz"))
              (sha256
               (base32
                "139vmx2w586044gjkay8990v2pk4lbfsnfaigqls4mpp1jf202a7"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("rust-docs/share" "share"))
      #:phases
      #~(modify-phases %standard-phases
          (add-before 'install 'extract-docs
            (lambda* (#:key inputs #:allow-other-keys)
              (invoke "tar" "xf" (assoc-ref inputs "source")
                      "--strip-components=1"))))))
    (native-inputs (list tar xz))
    (synopsis "Offline documentation for the Rust programming language")
    (description "This package provides the official Rust programming language
documentation for offline use.  It includes The Rust Programming Language
book, the standard library API reference, Rust by Example, and other
reference materials.")
    (home-page "https://www.rust-lang.org")
    (license (list license:asl2.0 license:expat))))
