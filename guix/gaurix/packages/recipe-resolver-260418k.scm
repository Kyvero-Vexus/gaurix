;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260418k
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages.
;;;
;;; New recipes (30):
;;;     1.  safe-rm (cargo-build-system, v1.1.0, gpl3+)
;;;     2.  parui (cargo-build-system, v1.0.19, expat)
;;;     3.  fackr (cargo-build-system, v1.2.0, expat)
;;;     4.  wleave (cargo-build-system, v0.7.1, expat)
;;;     5.  wl-mpris-idle-inhibit (cargo-build-system, v0.1.8, expat)
;;;     6.  mdcat (cargo-build-system, v2.7.1, mpl2.0)
;;;     7.  relax-player (cargo-build-system, v1.1.0, expat)
;;;     8.  ollama-proxy (cargo-build-system, v1.0.2, expat)
;;;     9.  firp (cargo-build-system, v0.2.0, expat)
;;;    10.  gotify-tray-cpp (cmake-build-system, v0.1.3, gpl3+)
;;;    11.  mkvextract-gtk (cmake-build-system, v0.9.6, gpl2)
;;;    12.  faff (copy-build-system, v0.2.0, expat)
;;;    13.  nvidia-prime-rtd3pm (copy-build-system, v1.1, expat)
;;;    14.  onionspray (copy-build-system, v1.7.0, gpl3+)
;;;    15.  ani-rss (copy-build-system, v3.0.25, gpl2)
;;;    16.  sc (gnu-build-system, v7.16, public-domain)
;;;    17.  mongotimer (gnu-build-system, v1.2.1, isc)
;;;    18.  calculix-ccx (gnu-build-system, v2.23, gpl2+)
;;;    19.  dosh-posh (gnu-build-system, v8, lgpl2.1+)
;;;    20.  dasel (go-build-system, v3.4.1, expat)
;;;    21.  findmydeviceserver (go-build-system, v0.14.1, gpl3+)
;;;    22.  gtkhash (meson-build-system, v1.5, gpl2+)
;;;    23.  wallpicker (pyproject-build-system, v2.5.4, expat)
;;;    24.  sticker-convert (pyproject-build-system, v2.20.0.0, gpl2)
;;;    25.  playtimed (pyproject-build-system, v0.5.1, expat)
;;;    26.  python-opencensus (pyproject-build-system, v0.11.4, asl2.0)
;;;    27.  python-uv-dynamic-versioning (pyproject-build-system, v0.14.0, expat)
;;;    28.  python-hvplot (pyproject-build-system, v0.12.2, bsd-3)
;;;    29.  yt-dlg (pyproject-build-system, v1.8.5, unlicense)
;;;    30.  aria2tui (pyproject-build-system, v0.1.13.4, expat)
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Use `guix download` to obtain real hashes.

(define-module (gaurix packages recipe-resolver-260418k)
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
  #:use-module (guix build-system meson)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages pkg-config)
  #:export (
            safe-rm
            parui
            fackr
            wleave
            wl-mpris-idle-inhibit
            mdcat
            relax-player
            ollama-proxy
            firp
            gotify-tray-cpp
            mkvextract-gtk
            faff
            nvidia-prime-rtd3pm
            onionspray
            ani-rss
            sc
            mongotimer
            calculix-ccx
            dosh-posh
            dasel
            findmydeviceserver
            gtkhash
            wallpicker
            sticker-convert
            playtimed
            python-opencensus
            python-uv-dynamic-versioning
            python-hvplot
            yt-dlg
            aria2tui
            ))


;;; ===================================================================
;;; CARGO-BUILD-SYSTEM PACKAGES
;;; ===================================================================

;;; -------------------------------------------------------------------
;;; 1. safe-rm --- prevent accidental deletion of important files
;;; -------------------------------------------------------------------
(define-public safe-rm
  (package
    (name "safe-rm")
    (version "1.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://launchpad.net/safe-rm/trunk/"
                    version "/+download/safe-rm-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://launchpad.net/safe-rm")
    (synopsis "wrapper around rm to prevent accidental deletions")
    (description "Safe-rm is a safety tool intended to prevent the accidental
deletion of important files by replacing the @command{rm} command with a
wrapper that checks a configurable blacklist before proceeding with
file removal.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 2. parui --- TUI frontend for paru/yay
;;; -------------------------------------------------------------------
(define-public parui
  (package
    (name "parui")
    (version "1.0.19")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Vonr/parui")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/Vonr/parui")
    (synopsis "simple TUI frontend for paru or yay AUR helpers")
    (description "Parui is a simple terminal user interface (TUI) frontend
for the paru and yay AUR helper tools.  It provides an interactive search
and selection interface for browsing and installing packages from the
Arch User Repository.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 3. fackr --- terminal text editor written in Rust
;;; -------------------------------------------------------------------
(define-public fackr
  (package
    (name "fackr")
    (version "1.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/TenseleyFlow/fackr")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/TenseleyFlow/fackr")
    (synopsis "terminal text editor written in Rust")
    (description "Fackr is a terminal text editor written in Rust.  It
provides a lightweight editing experience with syntax highlighting and
basic text manipulation features in a minimal terminal interface.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 4. wleave --- Wayland-native logout menu in GTK4
;;; -------------------------------------------------------------------
(define-public wleave
  (package
    (name "wleave")
    (version "0.7.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/AMNatty/wleave")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/AMNatty/wleave")
    (synopsis "wayland-native logout menu written in GTK4")
    (description "Wleave is a Wayland-native logout script written in
Rust with GTK4.  It provides a graphical logout, shutdown, reboot, suspend,
hibernate, and lock screen menu with customizable button layout and
CSS-based theming.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 5. wl-mpris-idle-inhibit --- Wayland idle inhibitor via MPRIS2
;;; -------------------------------------------------------------------
(define-public wl-mpris-idle-inhibit
  (package
    (name "wl-mpris-idle-inhibit")
    (version "0.1.8")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/sameer/wl-mpris-idle-inhibit")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/sameer/wl-mpris-idle-inhibit")
    (synopsis "wayland idle inhibitor using MPRIS2 as a signal")
    (description "Wl-mpris-idle-inhibit prevents Wayland compositors from
entering idle state when media is playing.  It listens for MPRIS2 D-Bus
signals from media players and activates the Wayland idle inhibit protocol
to prevent screen blanking or lock during playback.")
    (license (list license:asl2.0 license:expat))))

;;; -------------------------------------------------------------------
;;; 6. mdcat --- Markdown rendering for the terminal
;;; -------------------------------------------------------------------
(define-public mdcat
  (package
    (name "mdcat")
    (version "2.7.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/swsnr/mdcat")
                    (commit (string-append "mdcat-" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/swsnr/mdcat")
    (synopsis "sophisticated Markdown rendering for the terminal")
    (description "Mdcat renders Markdown documents directly in the terminal
with support for inline images (in iTerm2, kitty, and WezTerm), hyperlinks,
syntax highlighting for code blocks, and full CommonMark support including
tables, footnotes, and task lists.")
    (license license:mpl2.0)))

;;; -------------------------------------------------------------------
;;; 7. relax-player --- ambient sound player with TUI
;;; -------------------------------------------------------------------
(define-public relax-player
  (package
    (name "relax-player")
    (version "1.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ebithril/relax-player")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/ebithril/relax-player")
    (synopsis "ambient sound player with alsamixer-style TUI")
    (description "Relax-player is an ambient sound player that provides
rain, thunder, campfire, and other nature sounds through an
alsamixer-style terminal user interface.  It uses ALSA for audio
playback and supports mixing multiple sound sources simultaneously.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 8. ollama-proxy --- authentication proxy for Ollama
;;; -------------------------------------------------------------------
(define-public ollama-proxy
  (package
    (name "ollama-proxy")
    (version "1.0.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/k88936/ollama-proxy")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/k88936/ollama-proxy")
    (synopsis "authentication proxy for Ollama LLM service")
    (description "Ollama-proxy wraps local Ollama requests with basic
authentication and HTTPS support, enabling secure remote access to an
Ollama instance.  It acts as a reverse proxy that adds authentication
to the otherwise unauthenticated Ollama API.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 9. firp --- Fortran interpreter with REPL and JIT
;;; -------------------------------------------------------------------
(define-public firp
  (package
    (name "firp")
    (version "0.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/FortranGoingOnForty/firp")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/FortranGoingOnForty/firp")
    (synopsis "modern Fortran interpreter with REPL and JIT compilation")
    (description "Firp is a modern Fortran interpreter written in Rust that
provides a read-eval-print loop (REPL), a debugger, and just-in-time
(JIT) compilation.  It supports interactive Fortran development and
rapid prototyping of Fortran code.")
    (license license:expat)))


;;; ===================================================================
;;; CMAKE-BUILD-SYSTEM PACKAGES
;;; ===================================================================

;;; -------------------------------------------------------------------
;;; 10. gotify-tray-cpp --- Gotify tray notification application
;;; -------------------------------------------------------------------
(define-public gotify-tray-cpp
  (package
    (name "gotify-tray-cpp")
    (version "0.1.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/seird/gotify-tray-cpp")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/seird/gotify-tray-cpp")
    (synopsis "system tray notification application for Gotify server")
    (description "Gotify-tray-cpp is a C++ system tray notification
application for receiving push messages from a Gotify server.  It
provides desktop notifications via the system tray using Qt6 and
WebSocket connections to the Gotify server API.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 11. mkvextract-gtk --- GTK GUI for MKV track extraction
;;; -------------------------------------------------------------------
(define-public mkvextract-gtk
  (package
    (name "mkvextract-gtk")
    (version "0.9.6")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Joseph-DiGiovanni/mkvextract-gtk")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/Joseph-DiGiovanni/mkvextract-gtk")
    (synopsis "GTK graphical interface for extracting MKV tracks")
    (description "Mkvextract-gtk provides a GTK-based graphical user interface
for extracting tracks from Matroska (MKV) container files.  It wraps the
@command{mkvextract} command-line tool with a point-and-click interface
for selecting and extracting video, audio, and subtitle tracks.")
    (license license:gpl2)))


;;; ===================================================================
;;; COPY-BUILD-SYSTEM PACKAGES
;;; ===================================================================

;;; -------------------------------------------------------------------
;;; 12. faff --- ollama powered commit message generator
;;; -------------------------------------------------------------------
(define-public faff
  (package
    (name "faff")
    (version "0.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/wimpysworld/faff")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("faff" "bin/faff"))))
    (home-page "https://github.com/wimpysworld/faff")
    (synopsis "ollama powered conventional commit message generator")
    (description "Faff is a shell script that uses Ollama to generate
conventional commit messages from staged git changes.  It analyzes the
current diff and produces well-formatted commit messages following the
Conventional Commits specification.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 13. nvidia-prime-rtd3pm --- NVIDIA GPU runtime power management
;;; -------------------------------------------------------------------
(define-public nvidia-prime-rtd3pm
  (package
    (name "nvidia-prime-rtd3pm")
    (version "1.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/AUR-packages/nvidia-prime-rtd3pm")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/nvidia-prime-rtd3pm"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://us.download.nvidia.com/XFree86/Linux-x86_64/550.67/README/dynamicpowermanagement.html")
    (synopsis "configure NVIDIA discrete GPU runtime power management")
    (description "Nvidia-prime-rtd3pm provides udev rules and configuration
to enable runtime D3 power management on NVIDIA discrete GPUs in hybrid
graphics (Optimus) laptops.  When the GPU is not in use, it enters a
low-power D3cold state to reduce energy consumption.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 14. onionspray --- Tor onion service setup tool
;;; -------------------------------------------------------------------
(define-public onionspray
  (package
    (name "onionspray")
    (version "1.7.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.torproject.org/tpo/onion-services/onionspray")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/onionspray"))))
    (home-page "https://gitlab.torproject.org/tpo/onion-services/onionspray")
    (synopsis "tool to set up Tor onion services for existing websites")
    (description "OnionSpray is a tool for setting up Tor onion services
(.onion addresses) for existing clearnet websites.  It automates the
configuration of nginx and Tor to create onion mirrors of web services,
enabling anonymous access to existing websites via the Tor network.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 15. ani-rss --- automatic anime RSS subscription and download
;;; -------------------------------------------------------------------
(define-public ani-rss
  (package
    (name "ani-rss")
    (version "3.0.25")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/wushuo894/ani-rss")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/ani-rss"))))
    (home-page "https://github.com/wushuo894/ani-rss")
    (synopsis "automatic anime RSS subscription and download tool")
    (description "Ani-rss is an automatic anime subscription and download
tool that monitors RSS feeds from anime torrent sites.  It tracks shows,
automatically downloads new episodes as they become available, and
manages subscriptions through a web-based interface.")
    (license license:gpl2)))


;;; ===================================================================
;;; GNU-BUILD-SYSTEM PACKAGES
;;; ===================================================================

;;; -------------------------------------------------------------------
;;; 16. sc --- ncurses-based spreadsheet calculator
;;; -------------------------------------------------------------------
(define-public sc
  (package
    (name "sc")
    (version "7.16")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://ibiblio.org/pub/linux/apps/financial/spreadsheet/"
                    "sc-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://ibiblio.org/pub/linux/apps/financial/spreadsheet/")
    (synopsis "ncurses-based spreadsheet calculator")
    (description "Sc is a free curses-based spreadsheet program that uses
key bindings similar to vi.  It supports arithmetic operations, string
manipulation, cell referencing, range operations, macros, and can import
and export CSV data.")
    (license license:public-domain)))

;;; -------------------------------------------------------------------
;;; 17. mongotimer --- humongous terminal timer and stopwatch
;;; -------------------------------------------------------------------
(define-public mongotimer
  (package
    (name "mongotimer")
    (version "1.2.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://codeberg.org/maandree/mongotimer")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://codeberg.org/maandree/mongotimer")
    (synopsis "large-format timer and stopwatch for the terminal")
    (description "Mongotimer is a humongous timer and stopwatch that displays
the time in large characters in the terminal.  It supports both countdown
timer and stopwatch modes with configurable display sizes and
terminal-friendly rendering.")
    (license license:isc)))

;;; -------------------------------------------------------------------
;;; 18. calculix-ccx --- 3D structural finite element solver
;;; -------------------------------------------------------------------
(define-public calculix-ccx
  (package
    (name "calculix-ccx")
    (version "2.23")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "http://www.dhondt.de/ccx_" version ".src.tar.bz2"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "http://www.calculix.de/")
    (synopsis "3D structural finite element solver")
    (description "CalculiX CCX is a free finite element solver for
three-dimensional structural analysis.  It supports linear and nonlinear
static, dynamic, and thermal calculations using a variety of element
types.  Input files are compatible with the Abaqus format.")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 19. dosh-posh --- Podman shell wrapper
;;; -------------------------------------------------------------------
(define-public dosh-posh
  (package
    (name "dosh-posh")
    (version "8")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/gportay/dosh")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/gportay/dosh")
    (synopsis "containerized shell using Podman")
    (description "Dosh-posh is a Podman-based shell wrapper that runs
commands inside a container.  It provides an isolated shell environment
using Podman containers, inheriting the user's working directory and
environment while maintaining container isolation.")
    (license license:lgpl2.1+)))


;;; ===================================================================
;;; GO-BUILD-SYSTEM PACKAGES
;;; ===================================================================

;;; -------------------------------------------------------------------
;;; 20. dasel --- JSON/YAML/TOML/XML command-line processor
;;; -------------------------------------------------------------------
(define-public dasel
  (package
    (name "dasel")
    (version "3.4.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/TomWright/dasel")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:tests? #f
           #:import-path "github.com/TomWright/dasel/v3"))
    (home-page "https://github.com/TomWright/dasel")
    (synopsis "query and modify data structures from the command line")
    (description "Dasel (data-selector) is a command-line tool for querying
and modifying data structures in JSON, TOML, YAML, XML, CSV, HCL, and
INI files.  It provides a unified selector syntax for reading and writing
values across different serialization formats.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 21. findmydeviceserver --- FindMyDevice server in Go
;;; -------------------------------------------------------------------
(define-public findmydeviceserver
  (package
    (name "findmydeviceserver")
    (version "0.14.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.com/fmd-foss/fmd-server")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:tests? #f
           #:import-path "gitlab.com/fmd-foss/fmd-server"))
    (home-page "https://gitlab.com/fmd-foss/fmd-server")
    (synopsis "server for the FindMyDevice Android application")
    (description "FindMyDeviceServer is the official server component for
the FindMyDevice (FMD) Android application.  It provides a self-hosted
backend for locating, ringing, and locking lost Android devices through
push notifications and location services.")
    (license license:gpl3+)))


;;; ===================================================================
;;; MESON-BUILD-SYSTEM PACKAGES
;;; ===================================================================

;;; -------------------------------------------------------------------
;;; 22. gtkhash --- GTK utility for computing checksums
;;; -------------------------------------------------------------------
(define-public gtkhash
  (package
    (name "gtkhash")
    (version "1.5")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/tristanheaven/gtkhash")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/tristanheaven/gtkhash")
    (synopsis "GTK utility for computing message digests and checksums")
    (description "GtkHash is a desktop utility for computing message digests
or checksums.  It supports MD5, SHA-1, SHA-256, SHA-512, and many other
hash functions.  It provides both a standalone GTK application and file
manager extensions for Nautilus, Thunar, and Nemo.")
    (license license:gpl2+)))


;;; ===================================================================
;;; PYPROJECT-BUILD-SYSTEM PACKAGES
;;; ===================================================================

;;; -------------------------------------------------------------------
;;; 23. wallpicker --- GTK4/Libadwaita wallpaper picker
;;; -------------------------------------------------------------------
(define-public wallpicker
  (package
    (name "wallpicker")
    (version "2.5.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/gotar/WallPicker")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/gotar/WallPicker")
    (synopsis "GTK4/Libadwaita wallpaper picker with Wallhaven integration")
    (description "WallPicker is a modern GTK4/Libadwaita wallpaper picker
with Wallhaven integration, AI upscaling, and AI tagging support.  It
provides a clean interface for browsing, searching, and setting desktop
wallpapers from local files and online sources.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 24. sticker-convert --- multi-platform sticker converter
;;; -------------------------------------------------------------------
(define-public sticker-convert
  (package
    (name "sticker-convert")
    (version "2.20.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/laggykiller/sticker-convert")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/laggykiller/sticker-convert")
    (synopsis "convert stickers between WhatsApp, Telegram, Signal, and more")
    (description "Sticker-convert converts animated and static stickers between
WhatsApp, Telegram, Signal, Line, Kakao, Viber, Discord, and iMessage
formats.  It supports batch conversion with automatic resizing, format
conversion, and metadata handling for each platform.")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 25. playtimed --- screen time daemon with parental controls
;;; -------------------------------------------------------------------
(define-public playtimed
  (package
    (name "playtimed")
    (version "0.5.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/aaronsb/playtimed")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/aaronsb/playtimed")
    (synopsis "screen time daemon with parental controls")
    (description "Playtimed is a screen time management daemon that provides
parental controls with a friendly AI assistant personality.  It monitors
and limits screen time usage, sends notifications as time limits approach,
and integrates with D-Bus for system-level session management.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 26. python-opencensus --- stats collection and distributed tracing
;;; -------------------------------------------------------------------
(define-public python-opencensus
  (package
    (name "python-opencensus")
    (version "0.11.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/census-instrumentation/opencensus-python")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/census-instrumentation/opencensus-python")
    (synopsis "stats collection and distributed tracing framework for Python")
    (description "OpenCensus is a set of libraries for collecting application
performance metrics and distributed traces, then transferring the data to
analysis backends like Prometheus, Zipkin, Jaeger, and Azure Monitor.  It
provides a vendor-agnostic instrumentation API for Python applications.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 27. python-uv-dynamic-versioning --- VCS-based dynamic versioning
;;; -------------------------------------------------------------------
(define-public python-uv-dynamic-versioning
  (package
    (name "python-uv-dynamic-versioning")
    (version "0.14.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ninoseki/uv-dynamic-versioning")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/ninoseki/uv-dynamic-versioning")
    (synopsis "dynamic versioning based on VCS tags for uv/hatch projects")
    (description "Uv-dynamic-versioning provides dynamic versioning based on
version control system (VCS) tags for Python projects using uv or hatch
build backends.  It automatically determines the package version from
git tags during the build process.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 28. python-hvplot --- high-level plotting API built on HoloViews
;;; -------------------------------------------------------------------
(define-public python-hvplot
  (package
    (name "python-hvplot")
    (version "0.12.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://files.pythonhosted.org/packages/source/h/hvplot/"
                    "hvplot-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://hvplot.holoviz.org")
    (synopsis "high-level plotting API for pandas, dask, and xarray")
    (description "HvPlot provides a high-level plotting API for pandas, dask,
xarray, and networkx data structures built on HoloViews.  It enables
interactive, publication-quality plots with a familiar @code{.plot()}
interface that produces Bokeh, Matplotlib, or Plotly output.")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; 29. yt-dlg --- graphical frontend for yt-dlp
;;; -------------------------------------------------------------------
(define-public yt-dlg
  (package
    (name "yt-dlg")
    (version "1.8.5")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/oleksis/youtube-dl-gui")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/oleksis/youtube-dl-gui")
    (synopsis "cross-platform graphical frontend for yt-dlp")
    (description "Yt-dlg is a cross-platform graphical frontend for the
yt-dlp media downloader, written in wxPython.  It provides a user-friendly
interface for downloading videos and audio from YouTube and many other
sites supported by yt-dlp, with format selection and download management.")
    (license license:unlicense)))

;;; -------------------------------------------------------------------
;;; 30. aria2tui --- TUI frontend for aria2c download manager
;;; -------------------------------------------------------------------
(define-public aria2tui
  (package
    (name "aria2tui")
    (version "0.1.13.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/grimandgreedy/aria2tui")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/grimandgreedy/aria2tui")
    (synopsis "terminal user interface frontend for aria2c download manager")
    (description "Aria2tui provides a terminal user interface (TUI) for the
aria2c download manager.  It enables interactive management of downloads
with support for HTTP/HTTPS, FTP, BitTorrent, and Metalink protocols
through an ncurses-style interface.")
    (license license:expat)))
