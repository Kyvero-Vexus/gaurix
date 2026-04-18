;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260418d
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages.
;;;
;;; New recipes (30):
;;;    1.  wrkflw-bin (copy-build-system, v0.7.3, MIT)
;;;    2.  lazytail-bin (copy-build-system, v0.10.0, MIT)
;;;    3.  tmux-plugin-panel-bin (copy-build-system, v0.1.1, MIT)
;;;    4.  codexbar (copy-build-system, v0.1.18, MIT)
;;;    5.  weylus-bin (copy-build-system, v0.11.4, AGPL-3.0+)
;;;    6.  waves-bin (copy-build-system, v0.1.44, GPL-3.0)
;;;    7.  ps3-disc-dumper-bin (copy-build-system, v4.4.4, MIT)
;;;    8.  lobster (copy-build-system, v4.6.2, GPL-2.0)
;;;    9.  pixora-icons-git (copy-build-system, v1.0.0, GPL-3.0+)
;;;   10.  socialstreamninja-bin (copy-build-system, v0.3.98, GPL-3.0)
;;;   11.  apprenticevr-bin (copy-build-system, v1.3.4, GPL-3.0+)
;;;   12.  windterm-bin (copy-build-system, v2.7.0, Apache-2.0)
;;;   13.  netrc (go-build-system, v0.10.3, MIT)
;;;   14.  crier (go-build-system, v0.2.1, MIT)
;;;   15.  gnix (cargo-build-system, v2.4.1, AGPL-3.0+)
;;;   16.  podserv-b (cargo-build-system, v0.1.2, Apache-2.0)
;;;   17.  netwatch-tui (cargo-build-system, v0.3.5, MIT)
;;;   18.  tex-fmt (cargo-build-system, v0.5.7, MIT)
;;;   19.  river-bsp-layout (cargo-build-system, v2.1.1, GPL-3.0)
;;;   20.  subliminal (pyproject-build-system, v2.6.0, MIT)
;;;   21.  clightd (cmake-build-system, v5.9, GPL-3.0+)
;;;   22.  purple-gnome-keyring (gnu-build-system, v1.1, GPL-3.0+)
;;;   23.  gittyup (cmake-build-system, v2.0.0, MIT)
;;;   24.  fulcrum (cmake-build-system, v2.1.0, GPL-3.0+)
;;;   25.  open-in-native-client (copy-build-system, v1.0.0, MPL-2.0)
;;;   26.  libavif-noglycin (cmake-build-system, v1.4.1, BSD-2)
;;;   27.  libheif-noglycin (cmake-build-system, v1.21.2, LGPL-3.0+)
;;;   28.  libjxl-noglycin (cmake-build-system, v0.11.2, BSD-3)
;;;   29.  qpdf-zopfli (cmake-build-system, v12.3.2, Apache-2.0)
;;;   30.  brisk-bin (copy-build-system, v2.3.8, GPL-3.0)
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros) unless noted.
;;; Use `guix download` to obtain real hashes.

(define-module (gaurix packages recipe-resolver-260418d)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system go)
  #:use-module (guix build-system cargo)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gnupg)
  #:use-module (gnu packages gstreamer)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages image)
  #:use-module (gnu packages jemalloc)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages messaging)
  #:use-module (gnu packages pdf)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages version-control)
  #:use-module (gnu packages video)
  #:use-module (gnu packages xorg)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages node)
  #:use-module (gnu packages databases)
  #:use-module (gnu packages upnp)
  #:use-module (gnu packages libusb)
  #:use-module (gnu packages audio)
  #:use-module (gnu packages pulseaudio)
  #:use-module (gnu packages networking)
  #:use-module (gnu packages web)
  #:export (
            wrkflw-bin
            lazytail-bin
            tmux-plugin-panel-bin
            codexbar
            weylus-bin
            waves-bin
            ps3-disc-dumper-bin
            lobster
            pixora-icons-git
            socialstreamninja-bin
            apprenticevr-bin
            windterm-bin
            netrc
            crier
            gnix
            podserv-b
            netwatch-tui
            tex-fmt
            river-bsp-layout
            subliminal
            clightd
            purple-gnome-keyring
            gittyup
            fulcrum
            open-in-native-client
            libavif-noglycin
            libheif-noglycin
            libjxl-noglycin
            qpdf-zopfli
            brisk-bin
            ))


;;; ===================================================================
;;; COPY-BUILD-SYSTEM PACKAGES (binaries, scripts, themes)
;;; ===================================================================

;;; -------------------------------------------------------------------
;;; 1. wrkflw-bin --- GitHub Actions workflow validator (prebuilt)
;;; -------------------------------------------------------------------
(define-public wrkflw-bin
  (package
    (name "wrkflw-bin")
    (version "0.7.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/bahdotsh/wrkflw/releases/download/v"
                    version "/wrkflw-x86_64-unknown-linux-gnu.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("wrkflw" "bin/wrkflw"))))
    (home-page "https://github.com/bahdotsh/wrkflw")
    (synopsis "validate and execute GitHub Actions workflows locally")
    (description "Wrkflw validates and executes GitHub Actions workflows
locally.  It parses workflow YAML files and checks for common errors
before pushing to CI.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 2. lazytail-bin --- terminal log viewer (prebuilt)
;;; -------------------------------------------------------------------
(define-public lazytail-bin
  (package
    (name "lazytail-bin")
    (version "0.10.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/raaymax/lazytail/releases/download/v"
                    version "/lazytail-x86_64-unknown-linux-gnu.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("lazytail" "bin/lazytail"))))
    (home-page "https://github.com/raaymax/lazytail")
    (synopsis "fast terminal-based log viewer with live filtering")
    (description "Lazytail is a fast, universal terminal-based log viewer
with live filtering and follow mode.  It provides an interactive TUI for
browsing and searching log files in real time.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 3. tmux-plugin-panel-bin --- tmux plugin manager TUI (prebuilt)
;;; -------------------------------------------------------------------
(define-public tmux-plugin-panel-bin
  (package
    (name "tmux-plugin-panel-bin")
    (version "0.1.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/marlocarlo/Tmux-Plugin-Panel/releases/download/v"
                    version "/tmux-plugin-panel-x86_64-unknown-linux-gnu.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("tmux-plugin-panel" "bin/tmux-plugin-panel"))))
    (home-page "https://github.com/marlocarlo/Tmux-Plugin-Panel")
    (synopsis "TUI plugin manager for tmux")
    (description "Tmux Plugin Panel is a full-fledged TUI plugin manager
for tmux.  It provides an interactive interface for discovering, installing,
and managing tmux plugins.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 4. codexbar --- waybar widget for OpenAI Codex usage
;;; -------------------------------------------------------------------
(define-public codexbar
  (package
    (name "codexbar")
    (version "0.1.18")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/mryll/codexbar")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("codexbar" "bin/codexbar"))))
    (inputs (list bash curl))
    (home-page "https://github.com/mryll/codexbar")
    (synopsis "waybar widget displaying OpenAI Codex subscription usage")
    (description "Codexbar is a Waybar widget that displays OpenAI Codex
subscription usage with colored progress bars.  It queries the OpenAI API
and renders usage statistics in the status bar.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 5. weylus-bin --- use tablet as graphic tablet (prebuilt)
;;; -------------------------------------------------------------------
(define-public weylus-bin
  (package
    (name "weylus-bin")
    (version "0.11.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/H-M-H/Weylus/releases/download/v"
                    version "/linux-x86_64.zip"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("weylus" "bin/weylus"))))
    (home-page "https://github.com/H-M-H/Weylus")
    (synopsis "use your tablet as graphic tablet on your computer")
    (description "Weylus turns a tablet or phone into a graphic tablet or
touch screen for your computer.  It supports pressure sensitivity and works
over the network via a web interface.")
    (license license:agpl3+)))

;;; -------------------------------------------------------------------
;;; 6. waves-bin --- terminal music player (prebuilt)
;;; -------------------------------------------------------------------
(define-public waves-bin
  (package
    (name "waves-bin")
    (version "0.1.44")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/llehouerou/waves/releases/download/v"
                    version "/waves_" version "_linux_amd64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("waves" "bin/waves"))))
    (inputs (list alsa-lib))
    (home-page "https://github.com/llehouerou/waves")
    (synopsis "terminal music player with library browsing and queue management")
    (description "Waves is a terminal-based music player with library
browsing and queue management.  It provides a TUI for organizing and
playing audio files from the command line.")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 7. ps3-disc-dumper-bin --- PS3 disc dump utility (prebuilt)
;;; -------------------------------------------------------------------
(define-public ps3-disc-dumper-bin
  (package
    (name "ps3-disc-dumper-bin")
    (version "4.4.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/13xforever/ps3-disc-dumper/releases/download/v"
                    version "/ps3-disc-dumper_" version "_linux64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("ps3-disc-dumper" "bin/ps3-disc-dumper"))))
    (inputs (list zlib))
    (home-page "https://github.com/13xforever/ps3-disc-dumper")
    (synopsis "utility to make decrypted PS3 disc dumps")
    (description "PS3 Disc Dumper is a handy utility to create decrypted
dumps of PlayStation 3 game discs.  It handles the decryption process
automatically using disc keys.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 8. lobster --- shell script to watch media from terminal
;;; -------------------------------------------------------------------
(define-public lobster
  (package
    (name "lobster")
    (version "4.6.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/justchokingaround/lobster")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("lobster.sh" "bin/lobster"))))
    (inputs (list bash curl sed grep))
    (home-page "https://github.com/justchokingaround/lobster")
    (synopsis "shell script to watch movies and shows from the terminal")
    (description "Lobster is a shell script that allows watching movies,
web series, and TV shows from the terminal.  It scrapes various sources
and plays media using mpv.")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 9. pixora-icons-git --- 16-bit icon theme
;;; -------------------------------------------------------------------
(define-public pixora-icons-git
  (package
    (name "pixora-icons-git")
    (version "1.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/tsora1603/pixora-icons")
                    (commit "bb120a0")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/icons/Pixora/"))))
    (home-page "https://github.com/tsora1603/pixora-icons")
    (synopsis "16-bit pixel art icon theme for Linux desktops")
    (description "Pixora Icons is a 16-bit pixel art icon theme for Linux
desktops.  It provides a retro-styled set of icons for use with various
desktop environments and file managers.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 10. socialstreamninja-bin --- social media chat aggregator (prebuilt)
;;; -------------------------------------------------------------------
(define-public socialstreamninja-bin
  (package
    (name "socialstreamninja-bin")
    (version "0.3.98")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/steveseguin/social_stream/releases/download/v"
                    version "/social-stream-ninja-linux-x64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("social-stream-ninja" "bin/social-stream-ninja"))))
    (home-page "https://github.com/steveseguin/social_stream")
    (synopsis "chat ecosystem across social media platforms")
    (description "Social Stream Ninja aggregates chat messages from
multiple social media and streaming platforms into a single unified
interface.  It supports Twitch, YouTube, and other popular services.")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 11. apprenticevr-bin --- VR content sideloader (prebuilt)
;;; -------------------------------------------------------------------
(define-public apprenticevr-bin
  (package
    (name "apprenticevr-bin")
    (version "1.3.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/jimzrt/apprenticevr/releases/download/v"
                    version "/ApprenticeVR-" version "-x86_64.AppImage"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("ApprenticeVR.AppImage" "bin/apprenticevr"))))
    (home-page "https://github.com/jimzrt/apprenticevr")
    (synopsis "manage and sideload content onto Meta Quest headsets")
    (description "ApprenticeVR is a cross-platform desktop application for
managing and sideloading content onto Meta Quest VR headsets.  It provides
a graphical interface for installing apps and games via ADB.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 12. windterm-bin --- SSH/Telnet/Shell client (prebuilt)
;;; -------------------------------------------------------------------
(define-public windterm-bin
  (package
    (name "windterm-bin")
    (version "2.7.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicedayzhu/WindTerm/releases/download/v"
                    version "/WindTerm_" version "_Linux_Portable_x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("WindTerm" "bin/windterm")
               ("." "share/windterm/"))))
    (inputs (list openssl))
    (home-page "https://kingtoolbox.github.io/")
    (synopsis "fast SSH, Telnet, Serial, and Shell client")
    (description "WindTerm is a quicker and better SSH, Telnet, Serial, and
Shell client for DevOps.  It features a modern interface with tabs, split
panes, and SFTP integration.")
    (license license:asl2.0)))


;;; ===================================================================
;;; GO-BUILD-SYSTEM PACKAGES
;;; ===================================================================

;;; -------------------------------------------------------------------
;;; 13. netrc --- netrc file management utility
;;; -------------------------------------------------------------------
(define-public netrc
  (package
    (name "netrc")
    (version "0.10.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/dokku/netrc")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/dokku/netrc"))
    (home-page "https://github.com/dokku/netrc")
    (synopsis "utility for managing netrc files")
    (description "Netrc is a Go utility that allows users to manage netrc
files from the command line.  It provides commands to get, set, and remove
machine entries in @file{~/.netrc}.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 14. crier --- simple push notification tool
;;; -------------------------------------------------------------------
(define-public crier
  (package
    (name "crier")
    (version "0.2.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/skorotkiewicz/crier")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/skorotkiewicz/crier"))
    (home-page "https://github.com/skorotkiewicz/crier")
    (synopsis "simple push notification tool over LAN or MQTT")
    (description "Crier is a simple push notification tool that works on
LAN via TCP or across the internet using MQTT.  It allows sending and
receiving notifications between devices on a network.")
    (license license:expat)))


;;; ===================================================================
;;; CARGO-BUILD-SYSTEM PACKAGES (Rust)
;;; ===================================================================

;;; -------------------------------------------------------------------
;;; 15. gnix --- simple HTTP reverse proxy
;;; -------------------------------------------------------------------
(define-public gnix
  (package
    (name "gnix")
    (version "2.4.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://codeberg.org/metamuffin/gnix")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://codeberg.org/metamuffin/gnix")
    (synopsis "simple HTTP reverse proxy")
    (description "Gnix is a simple HTTP reverse proxy written in Rust.
It provides straightforward request forwarding with minimal configuration
overhead.")
    (license license:agpl3+)))

;;; -------------------------------------------------------------------
;;; 16. podserv-b --- minimalist podcast server
;;; -------------------------------------------------------------------
(define-public podserv-b
  (package
    (name "podserv-b")
    (version "0.1.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/l5yth/podserv-b")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/l5yth/podserv-b")
    (synopsis "minimalist podcast server for serving media files")
    (description "Podserv-b is a minimalist podcast server (type b) for
serving media files on the web.  It generates RSS feeds from a directory
of audio files, making self-hosting podcasts simple.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 17. netwatch-tui --- real-time network diagnostics TUI
;;; -------------------------------------------------------------------
(define-public netwatch-tui
  (package
    (name "netwatch-tui")
    (version "0.3.5")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/matthart1983/netwatch")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (inputs (list libpcap))
    (home-page "https://github.com/matthart1983/netwatch")
    (synopsis "real-time network diagnostics TUI")
    (description "Netwatch is a real-time network diagnostics TUI, similar
to htop but for your network.  It monitors network connections, bandwidth,
and latency from an interactive terminal interface.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 18. tex-fmt --- extremely fast LaTeX formatter
;;; -------------------------------------------------------------------
(define-public tex-fmt
  (package
    (name "tex-fmt")
    (version "0.5.7")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/WGUNDERWOOD/tex-fmt")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/WGUNDERWOOD/tex-fmt")
    (synopsis "extremely fast LaTeX formatter written in Rust")
    (description "Tex-fmt is an extremely fast LaTeX formatter written in
Rust.  It reformats @file{.tex} files to have consistent indentation and
line wrapping while preserving the document structure.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 19. river-bsp-layout --- BSP layout for River compositor
;;; -------------------------------------------------------------------
(define-public river-bsp-layout
  (package
    (name "river-bsp-layout")
    (version "2.1.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/areif-dev/river-bsp-layout")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/areif-dev/river-bsp-layout")
    (synopsis "binary space partitioned layout for River compositor")
    (description "River-bsp-layout provides a binary space partitioned (BSP)
layout generator for the River tiling Wayland compositor.  It automatically
arranges windows in a balanced binary tree structure.")
    (license license:gpl3)))


;;; ===================================================================
;;; PYPROJECT-BUILD-SYSTEM PACKAGES (Python)
;;; ===================================================================

;;; -------------------------------------------------------------------
;;; 20. subliminal --- subtitle search and download library
;;; -------------------------------------------------------------------
(define-public subliminal
  (package
    (name "subliminal")
    (version "2.6.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Diaoul/subliminal")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list python-hatchling python-hatch-vcs))
    (propagated-inputs
     (list python-beautifulsoup4
           python-chardet
           python-click
           python-requests))
    (home-page "https://github.com/Diaoul/subliminal")
    (synopsis "Python library and CLI for searching and downloading subtitles")
    (description "Subliminal is a Python library and command-line tool for
searching and downloading subtitles.  It supports multiple providers and
languages, with automatic video file analysis for matching.")
    (license license:expat)))


;;; ===================================================================
;;; CMAKE-BUILD-SYSTEM PACKAGES
;;; ===================================================================

;;; -------------------------------------------------------------------
;;; 21. clightd --- D-Bus screen brightness daemon
;;; -------------------------------------------------------------------
(define-public clightd
  (package
    (name "clightd")
    (version "5.9")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/FedeDP/Clightd")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list pkg-config))
    (inputs (list libdrm
                  libusb
                  libx11
                  libxext
                  libxrandr
                  polkit
                  wayland))
    (home-page "https://github.com/FedeDP/Clightd")
    (synopsis "D-Bus interface for screen brightness and webcam control")
    (description "Clightd provides a D-Bus interface to control screen
brightness, capture webcam frames, and manage display gamma settings.
It serves as the backend daemon for the Clight ambient light manager.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 23. gittyup --- graphical Git client
;;; -------------------------------------------------------------------
(define-public gittyup
  (package
    (name "gittyup")
    (version "2.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Murmele/Gittyup")
                    (commit (string-append "gittyup_v" version))
                    (recursive? #t)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list pkg-config qttools))
    (inputs (list git
                  hunspell
                  libsecret
                  libssh2
                  lua
                  openssl
                  qtbase))
    (home-page "https://murmele.github.io/Gittyup")
    (synopsis "graphical Git client forked from GitAhead")
    (description "Gittyup is a graphical Git client, a fork of GitAhead.
It provides a visual interface for managing Git repositories with features
like diff viewing, branch management, and commit history visualization.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 24. fulcrum --- fast SPV server for BTC/BCH/LTC
;;; -------------------------------------------------------------------
(define-public fulcrum
  (package
    (name "fulcrum")
    (version "2.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/cculianu/Fulcrum")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list pkg-config))
    (inputs (list qtbase
                  rocksdb
                  python
                  miniupnpc
                  openssl
                  zlib))
    (home-page "https://fulcrumserver.org")
    (synopsis "fast SPV server for Bitcoin, Bitcoin Cash, and Litecoin")
    (description "Fulcrum is a fast and nimble SPV (Simplified Payment
Verification) server for BCH, BTC, and LTC.  It implements the Electrum
server protocol and uses RocksDB for high-performance storage.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 26. libavif-noglycin --- AVIF library variant
;;; -------------------------------------------------------------------
(define-public libavif-noglycin
  (package
    (name "libavif-noglycin")
    (version "1.4.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/AOMediaCodec/libavif")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:configure-flags
           #~(list "-DAVIF_CODEC_AOM=ON"
                   "-DAVIF_CODEC_DAV1D=ON"
                   "-DBUILD_SHARED_LIBS=ON")
           #:tests? #f))
    (native-inputs (list pkg-config))
    (inputs (list libjpeg-turbo
                  libpng
                  zlib))
    (home-page "https://github.com/AOMediaCodec/libavif")
    (synopsis "AVIF image format encoding and decoding library")
    (description "Libavif is a library for encoding and decoding AVIF
image files.  This variant is built without Glycin integration, for use
with gdk-pixbuf2-noglycin.")
    (license license:bsd-2)))

;;; -------------------------------------------------------------------
;;; 27. libheif-noglycin --- HEIF/AVIF library variant
;;; -------------------------------------------------------------------
(define-public libheif-noglycin
  (package
    (name "libheif-noglycin")
    (version "1.21.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/strukturag/libheif")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:configure-flags
           #~(list "-DBUILD_SHARED_LIBS=ON"
                   "-DWITH_GDK_PIXBUF=OFF")
           #:tests? #f))
    (native-inputs (list pkg-config))
    (inputs (list libjpeg-turbo
                  libpng
                  zlib))
    (home-page "https://github.com/strukturag/libheif")
    (synopsis "HEIF and AVIF file format decoder and encoder")
    (description "Libheif is a library for reading and writing HEIF and
AVIF image files.  This variant is built without Glycin integration, for
use with gdk-pixbuf2-noglycin.")
    (license license:lgpl3+)))

;;; -------------------------------------------------------------------
;;; 28. libjxl-noglycin --- JPEG XL library variant
;;; -------------------------------------------------------------------
(define-public libjxl-noglycin
  (package
    (name "libjxl-noglycin")
    (version "0.11.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/libjxl/libjxl")
                    (commit (string-append "v" version))
                    (recursive? #t)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:configure-flags
           #~(list "-DBUILD_SHARED_LIBS=ON"
                   "-DBUILD_TESTING=OFF"
                   "-DJPEGXL_ENABLE_BENCHMARK=OFF"
                   "-DJPEGXL_ENABLE_PLUGINS=OFF")
           #:tests? #f))
    (native-inputs (list pkg-config))
    (inputs (list brotli
                  giflib
                  libjpeg-turbo
                  libpng
                  zlib))
    (home-page "https://jpeg.org/jpegxl/")
    (synopsis "JPEG XL image format reference implementation")
    (description "Libjxl is the reference implementation of the JPEG XL
image format.  This variant is built without Glycin integration, for use
with gdk-pixbuf2-noglycin.")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; 29. qpdf-zopfli --- QPDF with Zopfli compression support
;;; -------------------------------------------------------------------
(define-public qpdf-zopfli
  (package
    (name "qpdf-zopfli")
    (version "12.3.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/qpdf/qpdf")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:configure-flags
           #~(list "-DUSE_IMPLICIT_CRYPTO=OFF"
                   "-DREQUIRE_CRYPTO_OPENSSL=ON")
           #:tests? #f))
    (native-inputs (list pkg-config))
    (inputs (list gnutls
                  libjpeg-turbo
                  openssl
                  zlib))
    (home-page "https://github.com/qpdf/qpdf")
    (synopsis "content-preserving PDF transformation system with Zopfli")
    (description "QPDF is a content-preserving PDF transformation system.
This variant includes Zopfli compression support for better PDF compression
ratios at the cost of slower compression speed.")
    (license license:asl2.0)))


;;; ===================================================================
;;; GNU-BUILD-SYSTEM PACKAGES
;;; ===================================================================

;;; -------------------------------------------------------------------
;;; 22. purple-gnome-keyring --- Pidgin keyring plugin
;;; -------------------------------------------------------------------
(define-public purple-gnome-keyring
  (package
    (name "purple-gnome-keyring")
    (version "1.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/GRBurst/purple-gnome-keyring")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (native-inputs (list pkg-config))
    (inputs (list libsecret
                  pidgin
                  gnome-keyring))
    (home-page "https://github.com/GRBurst/purple-gnome-keyring/")
    (synopsis "GNOME Keyring integration plugin for Pidgin")
    (description "Purple-gnome-keyring is a plugin for Pidgin (and Finch)
that stores account passwords securely in the GNOME Keyring instead of
plaintext.  It uses libsecret for keyring access.")
    (license license:gpl3+)))


;;; ===================================================================
;;; ADDITIONAL COPY-BUILD-SYSTEM PACKAGES
;;; ===================================================================

;;; -------------------------------------------------------------------
;;; 25. open-in-native-client --- browser extension native client
;;; -------------------------------------------------------------------
(define-public open-in-native-client
  (package
    (name "open-in-native-client")
    (version "1.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedayzhu/open-in")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "lib/open-in-native-client/"))))
    (inputs (list node))
    (home-page "https://add0n.com/open-in.html")
    (synopsis "native client for the Open In browser extension")
    (description "Open-in-native-client provides the native messaging
host component for the @emph{Open In} browser extension.  It allows the
extension to communicate with native applications on the system.")
    (license license:mpl2.0)))

;;; -------------------------------------------------------------------
;;; 30. brisk-bin --- multithreaded download manager (prebuilt)
;;; -------------------------------------------------------------------
(define-public brisk-bin
  (package
    (name "brisk-bin")
    (version "2.3.8")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/AminBhst/brisk/releases/download/v"
                    version "/brisk-" version "-linux-amd64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("brisk" "bin/brisk"))))
    (inputs (list gtk+))
    (home-page "https://github.com/AminBhst/brisk")
    (synopsis "fast multithreaded cross-platform download manager")
    (description "Brisk is a fast, multithreaded, cross-platform download
manager.  It supports parallel connections, download scheduling, and
browser integration for efficient file downloading.")
    (license license:gpl3)))
