;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260423c
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages.
;;;
;;; New recipes (21):
;;;        1.  tuckr (cargo-build-system, v0.13.1, GPL-3.0-or-later)
;;;        2.  gede (gnu-build-system, v2.22.1, BSD-2-Clause)
;;;        3.  ytui-music (cargo-build-system, v2.0.0-rc1, GPL-2.0)
;;;        4.  python-gdbgui (pyproject-build-system, v0.15.1.0, GPL-3.0)
;;;        5.  themix-icons-numix-git (copy-build-system, v1.15.1, GPL-3.0)
;;;        6.  themix-icons-papirus-git (copy-build-system, v1.15.1, GPL-3.0)
;;;        7.  themix-icons-archdroid-git (copy-build-system, v1.0.3, GPL-3.0)
;;;        8.  plann (pyproject-build-system, v1.0.0, GPL-3.0)
;;;        9.  python-influxdb-client (pyproject-build-system, v1.50.0, MIT)
;;;       10.  lavacli (pyproject-build-system, v2.7, AGPL-3.0-or-later)
;;;       11.  stax (cargo-build-system, v0.56.0, MIT)
;;;       12.  elan-lean (cargo-build-system, v4.2.1, Apache-2.0)
;;;       13.  ty (cargo-build-system, v0.0.32, MIT)
;;;       14.  rbonsai (cargo-build-system, v0.1.5, GPL-3.0-or-later)
;;;       15.  clock-rs (cargo-build-system, v0.2.0, Apache-2.0)
;;;       16.  passly (pyproject-build-system, v0.2.2, MIT)
;;;       17.  ytsub (cargo-build-system, v0.8.0, GPL-3.0)
;;;       18.  runal (go-build-system, v0.10.0, MIT)
;;;       19.  ifrextractor-rs (cargo-build-system, v1.6.1, BSD-2-Clause)
;;;       20.  hyprland-preview-share-picker-git (cargo-build-system, v0.1.0, GPL-3.0-or-later)
;;;       21.  elyprismlauncher (cmake-build-system, v9.1, GPL-3.0)
;;;
;;; BLOCKED EXHAUSTED (9):
;;;        1.  webapp-creator -> NO_LICENSE: trivial script with no license file; not packageable
;;;        2.  agent-cli -> AI_SERVICE_DEP: requires external AI services (Ollama/Whisper/OpenAI); not self-contained
;;;        3.  terminal-ai -> AI_SERVICE_DEP: Node.js/TypeScript app requiring OpenAI API key; external dep
;;;        4.  spotiflac-bin -> PIRACY_TOOL: downloads copyrighted music from streaming services without authorization
;;;        5.  synergy3-bin -> PROPRIETARY: Synergy 3 is proprietary paid software; no source available
;;;        6.  paper-muncher-git -> CUSTOM_BUILD_SYSTEM: uses cutekit (non-standard build system); early alpha
;;;        7.  pkl -> JVM_GRADLE_COMPLEX: Apple Pkl configuration language; complex Kotlin/Gradle/GraalVM build
;;;        8.  footfetch-git -> SOURCE_UNAVAILABLE: GitHub repository deleted or made private; no source
;;;        9.  googlemaps -> ABANDONED: Qt/QML Google Maps plugin abandoned; requires Google Maps API key
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Use `guix download` or `guix hash` to obtain real hashes.

(define-module (gaurix packages recipe-resolver-260423c)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system cargo)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system go)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages gdb)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages kde-frameworks)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages mpv)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages sqlite)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages video)
  #:use-module (gnu packages version-control)
  #:use-module (gnu packages xorg)
  #:export (
            tuckr
            gede
            ytui-music
            python-gdbgui
            themix-icons-numix-git
            themix-icons-papirus-git
            themix-icons-archdroid-git
            plann
            python-influxdb-client
            lavacli
            stax
            elan-lean
            ty
            rbonsai
            clock-rs
            passly
            ytsub
            runal
            ifrextractor-rs
            hyprland-preview-share-picker-git
            elyprismlauncher
            ))

;;; -------------------------------------------------------------------
;;; 1. tuckr --- dotfile manager, a super-powered replacement for GNU Stow
;;; -------------------------------------------------------------------
(define-public tuckr
  (package
    (name "tuckr")
    (version "0.13.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/RaphGL/Tuckr/archive/refs/tags/"
                    version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "super-powered replacement for GNU Stow for dotfile management")
    (description "Tuckr is a dotfile manager inspired by GNU Stow.  It links
dotfiles from a central directory to their expected locations, supporting
grouping, encryption, and hooks.")
    (home-page "https://github.com/RaphGL/Tuckr")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 2. gede --- graphical frontend to GDB
;;; -------------------------------------------------------------------
(define-public gede
  (package
    (name "gede")
    (version "2.22.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/jhn98032/gede")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (replace 'configure
            (lambda* (#:key outputs #:allow-other-keys)
              (invoke "python3" "build.py"
                      (string-append "--prefix=" (assoc-ref outputs "out")))))
          (replace 'build
            (lambda _
              (invoke "make" "-C" "build")))
          (replace 'install
            (lambda _
              (invoke "make" "-C" "build" "install"))))))
    (inputs (list qtbase-5 gdb))
    (native-inputs (list python))
    (synopsis "graphical frontend to GDB written in Qt")
    (description "Gede is a graphical debugger frontend for GDB.  It provides
a source-level debugging experience with variable inspection, breakpoint
management, and stack navigation in a Qt-based interface.")
    (home-page "https://github.com/jhn98032/gede")
    (license license:bsd-2)))

;;; -------------------------------------------------------------------
;;; 3. ytui-music --- lightweight YouTube music client for the terminal
;;; -------------------------------------------------------------------
(define-public ytui-music
  (package
    (name "ytui-music")
    (version "2.0.0-rc1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/sudipghimire533/ytui-music")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (inputs (list mpv sqlite))
    (synopsis "lightweight YouTube music client for the terminal")
    (description "Ytui-music is a terminal-based YouTube music player built
with Rust.  It uses mpv for audio playback and provides a TUI for browsing
and playing music from YouTube without a web browser.")
    (home-page "https://github.com/sudipghimire533/ytui-music")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 4. python-gdbgui --- browser-based frontend to GDB
;;; -------------------------------------------------------------------
(define-public python-gdbgui
  (package
    (name "python-gdbgui")
    (version "0.15.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/cs01/gdbgui/archive/refs/tags/"
                    version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (propagated-inputs (list python-flask
                             python-pygments
                             gdb))
    (synopsis "browser-based frontend to GDB for C, C++, Go, and Rust")
    (description "Gdbgui is a browser-based frontend to the GNU Debugger
(GDB).  It provides a modern web interface for setting breakpoints, stepping
through code, and inspecting variables in C, C++, Go, and Rust programs.")
    (home-page "https://github.com/cs01/gdbgui")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 5. themix-icons-numix-git --- Numix icon theme plugin for Themix
;;; -------------------------------------------------------------------
(define-public themix-icons-numix-git
  (package
    (name "themix-icons-numix-git")
    (version "1.15.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/themix-project/themix-gui")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("plugins/icons_numix" "share/oomox/plugins/icons_numix"))))
    (synopsis "Numix icon theme plugin for Themix/Oomox theme designer")
    (description "This package provides the Numix icon theme plugin for the
Themix (Oomox) desktop theme designer, allowing customization and generation
of Numix-based icon themes.")
    (home-page "https://github.com/themix-project/themix-gui")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 6. themix-icons-papirus-git --- Papirus icon theme plugin for Themix
;;; -------------------------------------------------------------------
(define-public themix-icons-papirus-git
  (package
    (name "themix-icons-papirus-git")
    (version "1.15.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/themix-project/themix-gui")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("plugins/icons_papirus" "share/oomox/plugins/icons_papirus"))))
    (synopsis "Papirus icon theme plugin for Themix/Oomox theme designer")
    (description "This package provides the Papirus icon theme plugin for the
Themix (Oomox) desktop theme designer, allowing customization and generation
of Papirus-based icon themes.")
    (home-page "https://github.com/themix-project/themix-gui")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 7. themix-icons-archdroid-git --- Archdroid icon theme plugin for Themix
;;; -------------------------------------------------------------------
(define-public themix-icons-archdroid-git
  (package
    (name "themix-icons-archdroid-git")
    (version "1.0.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/themix-project/archdroid-icon-theme")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/icons/archdroid/"))))
    (synopsis "Archdroid material design icon theme plugin for Themix")
    (description "This package provides the Archdroid material design icon
theme, a plugin for the Themix (Oomox) desktop theme designer.  It offers
material-design-inspired icons for Linux desktops.")
    (home-page "https://github.com/themix-project/archdroid-icon-theme")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 8. plann --- command-line CalDAV client for calendars and todo lists
;;; -------------------------------------------------------------------
(define-public plann
  (package
    (name "plann")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/tobixen/plann/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (propagated-inputs (list python-click
                             python-pyyaml
                             python-dateutil
                             python-tzlocal))
    (synopsis "command-line CalDAV client for calendars and todo lists")
    (description "Plann is a command-line client for CalDAV servers.  It
allows managing calendar events and todo items from the terminal, supporting
multiple CalDAV backends including Nextcloud, Radicale, and others.")
    (home-page "https://github.com/tobixen/plann")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 9. python-influxdb-client --- InfluxDB 2.0 Python client library
;;; -------------------------------------------------------------------
(define-public python-influxdb-client
  (package
    (name "python-influxdb-client")
    (version "1.50.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/influxdata/influxdb-client-python/"
                    "archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (propagated-inputs (list python-certifi
                             python-urllib3
                             python-dateutil))
    (synopsis "InfluxDB 2.0 Python client library")
    (description "The InfluxDB Python client library provides a convenient
interface for interacting with InfluxDB 2.0 time-series databases.  It
supports writing, querying, and managing data through both synchronous and
asynchronous APIs.")
    (home-page "https://github.com/influxdata/influxdb-client-python")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 10. lavacli --- command-line interface for LAVA CI test framework
;;; -------------------------------------------------------------------
(define-public lavacli
  (package
    (name "lavacli")
    (version "2.7")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://gitlab.com/lava/lavacli/-/archive/v"
                    version "/lavacli-v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (propagated-inputs (list python-pyyaml))
    (synopsis "command-line interface for LAVA CI test framework")
    (description "Lavacli provides a command-line interface for interacting
with LAVA (Linaro Automated Validation Architecture) CI test framework
servers.  It allows submitting jobs, monitoring test results, and managing
devices from the terminal.")
    (home-page "https://gitlab.com/lava/lavacli")
    (license license:agpl3+)))

;;; -------------------------------------------------------------------
;;; 11. stax --- fast stacked-branch workflow manager for Git
;;; -------------------------------------------------------------------
(define-public stax
  (package
    (name "stax")
    (version "0.56.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/cesarferreira/stax/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (inputs (list git))
    (synopsis "fast stacked-branch workflow manager for Git")
    (description "Stax is a Git workflow tool for managing stacked branches.
It provides an interactive TUI for creating, rebasing, and merging branch
stacks, making code review workflows more efficient.")
    (home-page "https://github.com/cesarferreira/stax")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 12. elan-lean --- version manager for the Lean theorem prover
;;; -------------------------------------------------------------------
(define-public elan-lean
  (package
    (name "elan-lean")
    (version "4.2.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/leanprover/elan/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (inputs (list openssl curl))
    (synopsis "version manager for the Lean theorem prover")
    (description "Elan is a version manager for the Lean theorem prover,
similar to rustup for Rust.  It manages multiple Lean toolchain installations
and allows switching between versions on a per-project basis.")
    (home-page "https://github.com/leanprover/elan")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 13. ty --- extremely fast Python type checker written in Rust
;;; -------------------------------------------------------------------
(define-public ty
  (package
    (name "ty")
    (version "0.0.32")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/astral-sh/ty/archive/refs/tags/"
                    version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "extremely fast Python type checker written in Rust")
    (description "Ty is an extremely fast Python type checker and language
server written in Rust by the creators of Ruff.  It performs static type
analysis of Python code with minimal configuration.")
    (home-page "https://github.com/astral-sh/ty")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 14. rbonsai --- terminal bonsai tree generator written in Rust
;;; -------------------------------------------------------------------
(define-public rbonsai
  (package
    (name "rbonsai")
    (version "0.1.5")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/roberte777/rbonsai/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "terminal bonsai tree generator written in Rust")
    (description "Rbonsai is a Rust reimplementation of cbonsai, generating
procedural bonsai trees in the terminal.  It supports various display modes
and customizable growth parameters.")
    (home-page "https://github.com/roberte777/rbonsai")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 15. clock-rs --- modern terminal-based digital clock
;;; -------------------------------------------------------------------
(define-public clock-rs
  (package
    (name "clock-rs")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Oughie/clock-rs/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "modern terminal-based digital clock")
    (description "Clock-rs is a modern terminal-based digital clock written in
Rust, offering an alternative to tty-clock.  It supports customizable fonts,
colors, date display, and configuration via a TOML file.")
    (home-page "https://github.com/Oughie/clock-rs")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 16. passly --- CLI toolkit for auditing exported password manager data
;;; -------------------------------------------------------------------
(define-public passly
  (package
    (name "passly")
    (version "0.2.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nikooozzz/passly")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (propagated-inputs (list python-tldextract))
    (synopsis "CLI toolkit for auditing exported password manager data")
    (description "Passly is a command-line toolkit for auditing and cleaning
password data exported from password managers.  It analyzes exported CSV or
JSON files to identify duplicates, weak passwords, and potential security
issues.")
    (home-page "https://github.com/nikooozzz/passly")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 17. ytsub --- subscriptions-only TUI YouTube client
;;; -------------------------------------------------------------------
(define-public ytsub
  (package
    (name "ytsub")
    (version "0.8.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/sarowish/ytsub/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (inputs (list openssl sqlite))
    (synopsis "subscriptions-only TUI YouTube client")
    (description "Ytsub is a terminal user interface for managing YouTube
subscriptions without using Google accounts.  It fetches subscription feeds
via RSS, displays video lists, and can launch videos in external players
like mpv.")
    (home-page "https://github.com/sarowish/ytsub")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 18. runal --- text-based creative coding environment for the terminal
;;; -------------------------------------------------------------------
(define-public runal
  (package
    (name "runal")
    (version "0.10.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/emprcl/runal")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/emprcl/runal"
      #:tests? #f))
    (synopsis "text-based creative coding environment for the terminal")
    (description "Runal is a text-based creative coding environment for the
terminal, inspired by Processing.  It uses JavaScript (via the Goja engine)
to generate text-art animations and visualizations directly in the console.")
    (home-page "https://github.com/emprcl/runal")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 19. ifrextractor-rs --- UEFI IFR data extractor written in Rust
;;; -------------------------------------------------------------------
(define-public ifrextractor-rs
  (package
    (name "ifrextractor-rs")
    (version "1.6.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/LongSoft/IFRExtractor-RS")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "utility to extract UEFI IFR data into human-readable text")
    (description "IFRExtractor-RS is a Rust utility that extracts UEFI
Internal Forms Representation (IFR) data from BIOS/UEFI firmware dumps and
converts it into human-readable text for analysis and modification.")
    (home-page "https://github.com/LongSoft/IFRExtractor-RS")
    (license license:bsd-2)))

;;; -------------------------------------------------------------------
;;; 20. hyprland-preview-share-picker-git --- Hyprland screen share picker
;;; -------------------------------------------------------------------
(define-public hyprland-preview-share-picker-git
  (package
    (name "hyprland-preview-share-picker-git")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/WhySoBad/hyprland-preview-share-picker")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "screen share picker with preview for Hyprland")
    (description "A screen share picker for the Hyprland Wayland compositor
that shows a visual preview of available windows and screens before sharing.
It integrates with xdg-desktop-portal-hyprland for screen capture.")
    (home-page "https://github.com/WhySoBad/hyprland-preview-share-picker")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 21. elyprismlauncher --- Minecraft launcher with ely.by auth support
;;; -------------------------------------------------------------------
(define-public elyprismlauncher
  (package
    (name "elyprismlauncher")
    (version "9.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Elytra-Launcher/ElyPrismLauncher")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list
      #:tests? #f
      #:configure-flags
      #~(list "-DLauncher_QT_VERSION_MAJOR=5")))
    (inputs (list qtbase-5 zlib))
    (native-inputs (list extra-cmake-modules))
    (synopsis "Minecraft launcher with ely.by authentication support")
    (description "ElyPrismLauncher is a fork of PrismLauncher, a Minecraft
launcher that supports ely.by authentication as an alternative to Microsoft
accounts.  It manages Minecraft instances, mods, and resource packs.")
    (home-page "https://github.com/Elytra-Launcher/ElyPrismLauncher")
    (license license:gpl3)))
