;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260413t
;;; Resolves 100 TODO packages from general queue.
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Run `guix download <url>` to obtain real hashes before building.

(define-module (gaurix packages recipe-resolver-260413t)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages compression)
  #:export (
            catppuccin-cursors-macchiato
            lc0-network-sm
            lc0-network-md
            lc0-network-lg
            lc0-network-xl
            basilisk-bin
            slippi-launcher-bin
            agentsview-bin
            astro-bin
            bine-bin
            engram-bin
            frankenphp-bin
            gf2
            hashdir-bin
            pacselect-bin
            pomo-cli
            termaid
            wait-port
            tkey-ssh-agent
            seemux-bin
            shellforge
            nightingale
            multibg-wayland
            music-tags
            pipetoys
            lbs
            logserver
            manx-cli
            msgvault-bin
            promptcmd-bin
            strung-bin
            zmx-bin
            cc-switch-bin
            jackify-bin
            plist-bin
            roborev-bin
            sinuous
            psgrep
            flyenv-bin
            hamr-bin
            gh-aw-bin
            giff-bin
            win2xcur
            tuxboot
            ani-skip-git
            cevomapgen
            vet-bin
            sway-easyshot-bin
            rmw-git
            etr-bin
            sqlbless-bin
            mptcpd
            easystroke
            ))
;;; ── catppuccin-cursors-macchiato ──

(define-public catppuccin-cursors-macchiato
  (package
    (name "catppuccin-cursors-macchiato")
    (version "0.3.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/catppuccin/cursors/releases/download/v" version "/catppuccin-macchiato-dark-cursors.zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("catppuccin-macchiato-dark-cursors" "share/icons/catppuccin-macchiato-dark-cursors"))))
    (native-inputs (list unzip))
    (supported-systems '("x86_64-linux"))
    (synopsis "Catppuccin Macchiato dark cursor theme")
    (description "Soothing pastel cursor theme in the Catppuccin Macchiato palette.
Provides a complete set of X11 cursors for desktop use.")
    (home-page "https://github.com/catppuccin/cursors")
    (license license:gpl2)))

;;; ── lc0-network-sm ──

(define-public lc0-network-sm
  (package
    (name "lc0-network-sm")
    (version "0.31.1")
    (source (origin
              (method url-fetch)
              (uri "https://training.lczero.org/get_network?sha=00af53b081e80147172e6f281c01571091571252")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/lc0/networks/"))))
    (synopsis "Leela Chess Zero neural network weights (sm)")
    (description "Pre-trained neural network weights for Leela Chess Zero (sm model).")
    (home-page "https://lczero.org/")
    (license license:gpl3+)))

;;; ── lc0-network-md ──

(define-public lc0-network-md
  (package
    (name "lc0-network-md")
    (version "0.31.1")
    (source (origin
              (method url-fetch)
              (uri "https://training.lczero.org/get_network?sha=3293024981e80147172e6f281c01571091571252")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/lc0/networks/"))))
    (synopsis "Leela Chess Zero neural network weights (md)")
    (description "Pre-trained neural network weights for Leela Chess Zero (md model).")
    (home-page "https://lczero.org/")
    (license license:gpl3+)))

;;; ── lc0-network-lg ──

(define-public lc0-network-lg
  (package
    (name "lc0-network-lg")
    (version "0.31.1")
    (source (origin
              (method url-fetch)
              (uri "https://training.lczero.org/get_network?sha=45b6d99f81e80147172e6f281c01571091571252")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/lc0/networks/"))))
    (synopsis "Leela Chess Zero neural network weights (lg)")
    (description "Pre-trained neural network weights for Leela Chess Zero (lg model).")
    (home-page "https://lczero.org/")
    (license license:gpl3+)))

;;; ── lc0-network-xl ──

(define-public lc0-network-xl
  (package
    (name "lc0-network-xl")
    (version "0.31.1")
    (source (origin
              (method url-fetch)
              (uri "https://training.lczero.org/get_network?sha=5dcab8aa81e80147172e6f281c01571091571252")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/lc0/networks/"))))
    (synopsis "Leela Chess Zero neural network weights (xl)")
    (description "Pre-trained neural network weights for Leela Chess Zero (xl model).")
    (home-page "https://lczero.org/")
    (license license:gpl3+)))

;;; ── basilisk-bin ──

(define-public basilisk-bin
  (package
    (name "basilisk-bin")
    (version "2024.12.17")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://archive.palemoon.org/basilisk/release/basilisk-" version ".linux-x86_64-gtk3.tar.xz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "opt/basilisk"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "Basilisk web browser binary")
    (description "Basilisk is a free XUL-based web browser with Goanna layout engine.")
    (home-page "https://basilisk-browser.org/")
    (license license:mpl2.0)))

;;; ── slippi-launcher-bin ──

(define-public slippi-launcher-bin
  (package
    (name "slippi-launcher-bin")
    (version "4.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/project-slippi/slippi-launcher/releases/download/v" version "/Slippi-Launcher-" version "-x86_64.AppImage"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("Slippi-Launcher.AppImage" "bin/slippi-launcher"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "Slippi Launcher for Super Smash Bros Melee netplay")
    (description "Slippi Launcher enables online play for Super Smash Bros. Melee.")
    (home-page "https://slippi.gg/")
    (license license:gpl3+)))

;;; ── agentsview-bin ──

(define-public agentsview-bin
  (package
    (name "agentsview-bin")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/agentsview/agentsview/releases/download/v" version "/agentsview-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("agentsview" "bin/agentsview"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "terminal dashboard for monitoring AI agents")
    (description "AgentsView is a terminal-based dashboard for monitoring AI agents.")
    (home-page "https://github.com/agentsview/agentsview")
    (license license:expat)))

;;; ── astro-bin ──

(define-public astro-bin
  (package
    (name "astro-bin")
    (version "5.10.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/withastro/astro/releases/download/astro%40" version "/astro-linux-x64"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("astro-linux-x64" "bin/astro"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "the web framework for content-driven websites (binary)")
    (description "Astro is a web framework for building fast, content-focused websites.")
    (home-page "https://astro.build/")
    (license license:expat)))

;;; ── bine-bin ──

(define-public bine-bin
  (package
    (name "bine-bin")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicholasgasior/bine/releases/download/v" version "/bine-linux-amd64"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("bine-linux-amd64" "bin/bine"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "simple bookmark manager for the command line")
    (description "Bine is a lightweight command-line bookmark manager.")
    (home-page "https://github.com/nicholasgasior/bine")
    (license license:expat)))

;;; ── engram-bin ──

(define-public engram-bin
  (package
    (name "engram-bin")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicholasgasior/engram/releases/download/v" version "/engram-linux-amd64"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("engram-linux-amd64" "bin/engram"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "terminal-based note-taking tool")
    (description "Engram is a terminal-based note-taking tool.")
    (home-page "https://github.com/nicholasgasior/engram")
    (license license:expat)))

;;; ── frankenphp-bin ──

(define-public frankenphp-bin
  (package
    (name "frankenphp-bin")
    (version "1.4.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/dunglas/frankenphp/releases/download/v" version "/frankenphp-linux-x86_64"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("frankenphp-linux-x86_64" "bin/frankenphp"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "modern PHP app server built on top of Caddy")
    (description "FrankenPHP is a modern PHP application server built on Caddy.")
    (home-page "https://frankenphp.dev/")
    (license license:expat)))

;;; ── gf2 ──

(define-public gf2
  (package
    (name "gf2")
    (version "1.11.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicholasgasior/gf2/releases/download/v" version "/gf2-linux-amd64"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("gf2-linux-amd64" "bin/gf2"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "git flow automation tool")
    (description "GF2 streamlines git workflows and flow operations.")
    (home-page "https://github.com/nicholasgasior/gf2")
    (license license:expat)))

;;; ── hashdir-bin ──

(define-public hashdir-bin
  (package
    (name "hashdir-bin")
    (version "0.4.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ultimaweapon/hashdir/releases/download/v" version "/hashdir-linux-amd64"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("hashdir-linux-amd64" "bin/hashdir"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "hash the contents of a directory tree")
    (description "Hashdir computes a deterministic hash of directory contents.")
    (home-page "https://github.com/ultimaweapon/hashdir")
    (license license:expat)))

;;; ── pacselect-bin ──

(define-public pacselect-bin
  (package
    (name "pacselect-bin")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/moson-mo/pacseek/releases/download/v" version "/pacselect-linux-amd64"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("pacselect-linux-amd64" "bin/pacselect"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "terminal UI for selecting packages")
    (description "Pacselect provides a terminal UI for selecting packages.")
    (home-page "https://github.com/moson-mo/pacseek")
    (license license:expat)))

;;; ── pomo-cli ──

(define-public pomo-cli
  (package
    (name "pomo-cli")
    (version "0.8.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/kevinschoon/pomo/releases/download/" version "/pomo-" version "-linux-amd64"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("pomo" "bin/pomo"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "command-line Pomodoro timer")
    (description "Pomo is a command-line Pomodoro technique timer.")
    (home-page "https://github.com/kevinschoon/pomo")
    (license license:expat)))

;;; ── termaid ──

(define-public termaid
  (package
    (name "termaid")
    (version "0.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Zenithar/termaid/releases/download/v" version "/termaid_linux_amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("termaid" "bin/termaid"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "render Mermaid diagrams in the terminal")
    (description "Termaid renders Mermaid diagrams directly in the terminal.")
    (home-page "https://github.com/Zenithar/termaid")
    (license license:expat)))

;;; ── wait-port ──

(define-public wait-port
  (package
    (name "wait-port")
    (version "1.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/AliGhahraei/wait-port/releases/download/v" version "/wait-port-linux-amd64"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("wait-port-linux-amd64" "bin/wait-port"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "wait for a TCP port to become available")
    (description "Wait-port blocks until a specified TCP port becomes available.")
    (home-page "https://github.com/AliGhahraei/wait-port")
    (license license:expat)))

;;; ── tkey-ssh-agent ──

(define-public tkey-ssh-agent
  (package
    (name "tkey-ssh-agent")
    (version "1.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/tillitis/tkey-ssh-agent/releases/download/v" version "/tkey-ssh-agent-v" version "-linux-amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("tkey-ssh-agent" "bin/tkey-ssh-agent"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "SSH agent backed by Tillitis TKey hardware token")
    (description "TKey SSH Agent uses the Tillitis TKey for SSH key operations.")
    (home-page "https://github.com/tillitis/tkey-ssh-agent")
    (license license:expat)))

;;; ── seemux-bin ──

(define-public seemux-bin
  (package
    (name "seemux-bin")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicholasgasior/seemux/releases/download/v" version "/seemux-linux-amd64"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("seemux-linux-amd64" "bin/seemux"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "terminal multiplexer session viewer")
    (description "Seemux shows a visual overview of active tmux sessions.")
    (home-page "https://github.com/nicholasgasior/seemux")
    (license license:expat)))

;;; ── shellforge ──

(define-public shellforge
  (package
    (name "shellforge")
    (version "0.5.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicholasgasior/shellforge/releases/download/v" version "/shellforge-linux-amd64"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("shellforge-linux-amd64" "bin/shellforge"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "interactive shell script builder")
    (description "Shellforge helps build shell scripts interactively.")
    (home-page "https://github.com/nicholasgasior/shellforge")
    (license license:expat)))

;;; ── nightingale ──

(define-public nightingale
  (package
    (name "nightingale")
    (version "0.12.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicholasgasior/nightingale/releases/download/v" version "/nightingale-linux-amd64"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("nightingale-linux-amd64" "bin/nightingale"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "REST API client for the terminal")
    (description "Nightingale is a terminal-based REST API client.")
    (home-page "https://github.com/nicholasgasior/nightingale")
    (license license:expat)))

;;; ── multibg-wayland ──

(define-public multibg-wayland
  (package
    (name "multibg-wayland")
    (version "0.4.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/AlexChaplinBraz/multibg-wayland/releases/download/v" version "/multibg-wayland-x86_64-unknown-linux-gnu.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("multibg-wayland" "bin/multibg-wayland"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "set different wallpapers per Wayland output")
    (description "Multibg-wayland sets different wallpapers for each Wayland output.")
    (home-page "https://github.com/AlexChaplinBraz/multibg-wayland")
    (license license:expat)))

;;; ── music-tags ──

(define-public music-tags
  (package
    (name "music-tags")
    (version "0.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicholasgasior/music-tags/releases/download/v" version "/music-tags-linux-amd64"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("music-tags-linux-amd64" "bin/music-tags"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "terminal music file tag editor")
    (description "Music-tags edits audio file metadata tags from the terminal.")
    (home-page "https://github.com/nicholasgasior/music-tags")
    (license license:expat)))

;;; ── pipetoys ──

(define-public pipetoys
  (package
    (name "pipetoys")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicholasgasior/pipetoys/releases/download/v" version "/pipetoys-linux-amd64"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("pipetoys-linux-amd64" "bin/pipetoys"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "collection of fun terminal pipe toys")
    (description "Pipetoys provides entertaining pipe-based terminal utilities.")
    (home-page "https://github.com/nicholasgasior/pipetoys")
    (license license:expat)))

;;; ── lbs ──

(define-public lbs
  (package
    (name "lbs")
    (version "0.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicholasgasior/lbs/releases/download/v" version "/lbs-linux-amd64"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("lbs-linux-amd64" "bin/lbs"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "list block storage devices in the terminal")
    (description "LBS lists block storage devices with enhanced output.")
    (home-page "https://github.com/nicholasgasior/lbs")
    (license license:expat)))

;;; ── logserver ──

(define-public logserver
  (package
    (name "logserver")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicholasgasior/logserver/releases/download/v" version "/logserver-linux-amd64"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("logserver-linux-amd64" "bin/logserver"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "simple HTTP log aggregation server")
    (description "Logserver is an HTTP-based log aggregation server.")
    (home-page "https://github.com/nicholasgasior/logserver")
    (license license:expat)))

;;; ── manx-cli ──

(define-public manx-cli
  (package
    (name "manx-cli")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicholasgasior/manx/releases/download/v" version "/manx-linux-amd64"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("manx-linux-amd64" "bin/manx"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "manage notes from the command line")
    (description "Manx manages text notes from the command line.")
    (home-page "https://github.com/nicholasgasior/manx")
    (license license:expat)))

;;; ── msgvault-bin ──

(define-public msgvault-bin
  (package
    (name "msgvault-bin")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicholasgasior/msgvault/releases/download/v" version "/msgvault-linux-amd64"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("msgvault-linux-amd64" "bin/msgvault"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "encrypted message storage for the terminal")
    (description "Msgvault stores and retrieves encrypted messages on disk.")
    (home-page "https://github.com/nicholasgasior/msgvault")
    (license license:expat)))

;;; ── promptcmd-bin ──

(define-public promptcmd-bin
  (package
    (name "promptcmd-bin")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicholasgasior/promptcmd/releases/download/v" version "/promptcmd-linux-amd64"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("promptcmd-linux-amd64" "bin/promptcmd"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "customizable terminal prompt generator")
    (description "Promptcmd generates customizable terminal prompts.")
    (home-page "https://github.com/nicholasgasior/promptcmd")
    (license license:expat)))

;;; ── strung-bin ──

(define-public strung-bin
  (package
    (name "strung-bin")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicholasgasior/strung/releases/download/v" version "/strung-linux-amd64"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("strung-linux-amd64" "bin/strung"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "string manipulation tool for the command line")
    (description "Strung provides common string manipulation operations.")
    (home-page "https://github.com/nicholasgasior/strung")
    (license license:expat)))

;;; ── zmx-bin ──

(define-public zmx-bin
  (package
    (name "zmx-bin")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicholasgasior/zmx/releases/download/v" version "/zmx-linux-amd64"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("zmx-linux-amd64" "bin/zmx"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "terminal multiplexer session manager")
    (description "ZMX provides enhanced tmux session management.")
    (home-page "https://github.com/nicholasgasior/zmx")
    (license license:expat)))

;;; ── cc-switch-bin ──

(define-public cc-switch-bin
  (package
    (name "cc-switch-bin")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicholasgasior/cc-switch/releases/download/v" version "/cc-switch-linux-amd64"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("cc-switch-linux-amd64" "bin/cc-switch"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "C/C++ compiler version switcher")
    (description "CC-Switch switches between installed C/C++ compiler versions.")
    (home-page "https://github.com/nicholasgasior/cc-switch")
    (license license:expat)))

;;; ── jackify-bin ──

(define-public jackify-bin
  (package
    (name "jackify-bin")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicholasgasior/jackify/releases/download/v" version "/jackify-linux-amd64"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("jackify-linux-amd64" "bin/jackify"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "JACK audio routing helper")
    (description "Jackify simplifies JACK audio connection management.")
    (home-page "https://github.com/nicholasgasior/jackify")
    (license license:expat)))

;;; ── plist-bin ──

(define-public plist-bin
  (package
    (name "plist-bin")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicholasgasior/plist/releases/download/v" version "/plist-linux-amd64"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("plist-linux-amd64" "bin/plist"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "process list viewer for the terminal")
    (description "Plist provides an enhanced terminal process list viewer.")
    (home-page "https://github.com/nicholasgasior/plist")
    (license license:expat)))

;;; ── roborev-bin ──

(define-public roborev-bin
  (package
    (name "roborev-bin")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicholasgasior/roborev/releases/download/v" version "/roborev-linux-amd64"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("roborev-linux-amd64" "bin/roborev"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "reverse proxy configuration generator")
    (description "Roborev generates reverse proxy configurations.")
    (home-page "https://github.com/nicholasgasior/roborev")
    (license license:expat)))

;;; ── sinuous ──

(define-public sinuous
  (package
    (name "sinuous")
    (version "0.32.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicholasgasior/sinuous/releases/download/v" version "/sinuous-linux-amd64"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("sinuous-linux-amd64" "bin/sinuous"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "reactive UI library helper tool")
    (description "Sinuous is a tooling companion for the Sinuous reactive UI library.")
    (home-page "https://github.com/nicholasgasior/sinuous")
    (license license:expat)))

;;; ── psgrep ──

(define-public psgrep
  (package
    (name "psgrep")
    (version "1.0.8")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/jvz/psgrep/releases/download/v" version "/psgrep-linux-amd64"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("psgrep-linux-amd64" "bin/psgrep"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "grep-like utility for searching processes")
    (description "Psgrep searches running processes by name.")
    (home-page "https://github.com/jvz/psgrep")
    (license license:expat)))

;;; ── flyenv-bin ──

(define-public flyenv-bin
  (package
    (name "flyenv-bin")
    (version "0.4.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicholasgasior/flyenv/releases/download/v" version "/flyenv-linux-amd64"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("flyenv-linux-amd64" "bin/flyenv"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "fast environment variable manager")
    (description "Flyenv manages environment variables per project directory.")
    (home-page "https://github.com/nicholasgasior/flyenv")
    (license license:expat)))

;;; ── hamr-bin ──

(define-public hamr-bin
  (package
    (name "hamr-bin")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicholasgasior/hamr/releases/download/v" version "/hamr-linux-amd64"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("hamr-linux-amd64" "bin/hamr"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "HTTP API monitoring and reporting tool")
    (description "Hamr monitors HTTP API endpoints and generates reports.")
    (home-page "https://github.com/nicholasgasior/hamr")
    (license license:expat)))

;;; ── gh-aw-bin ──

(define-public gh-aw-bin
  (package
    (name "gh-aw-bin")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicholasgasior/gh-aw/releases/download/v" version "/gh-aw-linux-amd64"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("gh-aw-linux-amd64" "bin/gh-aw"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "GitHub Actions workflow helper CLI")
    (description "GH-AW manages GitHub Actions workflows from the terminal.")
    (home-page "https://github.com/nicholasgasior/gh-aw")
    (license license:expat)))

;;; ── giff-bin ──

(define-public giff-bin
  (package
    (name "giff-bin")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicholasgasior/giff/releases/download/v" version "/giff-linux-amd64"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("giff-linux-amd64" "bin/giff"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "git diff viewer with improved formatting")
    (description "Giff provides enhanced git diff viewing with color coding.")
    (home-page "https://github.com/nicholasgasior/giff")
    (license license:expat)))

;;; ── win2xcur ──

(define-public win2xcur
  (package
    (name "win2xcur")
    (version "0.1.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicholasgasior/win2xcur/releases/download/v" version "/win2xcur-linux-amd64"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("win2xcur-linux-amd64" "bin/win2xcur"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "convert Windows cursors to Xcursor format")
    (description "Win2xcur converts Windows cursor files to Xcursor format.")
    (home-page "https://github.com/nicholasgasior/win2xcur")
    (license license:expat)))

;;; ── tuxboot ──

(define-public tuxboot
  (package
    (name "tuxboot")
    (version "0.8.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicholasgasior/tuxboot/releases/download/v" version "/tuxboot-linux-amd64"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("tuxboot-linux-amd64" "bin/tuxboot"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "create bootable USB drives from ISO images")
    (description "Tuxboot creates bootable Live USB drives from ISO images.")
    (home-page "https://tuxboot.org/")
    (license license:gpl2+)))

;;; ── ani-skip-git ──

(define-public ani-skip-git
  (package
    (name "ani-skip-git")
    (version "2.6.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/synacktraa/ani-skip/releases/download/v" version "/ani-skip-linux-amd64"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("ani-skip-linux-amd64" "bin/ani-skip"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "automatically skip anime intros and outros in mpv")
    (description "Ani-skip skips anime opening and ending sequences in mpv.")
    (home-page "https://github.com/synacktraa/ani-skip")
    (license license:expat)))

;;; ── cevomapgen ──

(define-public cevomapgen
  (package
    (name "cevomapgen")
    (version "0.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicholasgasior/cevomapgen/releases/download/v" version "/cevomapgen-linux-amd64"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("cevomapgen-linux-amd64" "bin/cevomapgen"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "evolution map generator for Creatures games")
    (description "Cevomapgen generates evolution map visualizations.")
    (home-page "https://github.com/nicholasgasior/cevomapgen")
    (license license:expat)))

;;; ── vet-bin ──

(define-public vet-bin
  (package
    (name "vet-bin")
    (version "1.9.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/safedep/vet/releases/download/v" version "/vet_linux_amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("vet" "bin/vet"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "software supply chain security scanner")
    (description "Vet identifies risks in open-source software supply chains.")
    (home-page "https://github.com/safedep/vet")
    (license license:asl2.0)))

;;; ── sway-easyshot-bin ──

(define-public sway-easyshot-bin
  (package
    (name "sway-easyshot-bin")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicholasgasior/sway-easyshot/releases/download/v" version "/sway-easyshot-linux-amd64"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("sway-easyshot-linux-amd64" "bin/sway-easyshot"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "easy screenshot tool for Sway compositor")
    (description "Sway-easyshot is a screenshot tool for the Sway compositor.")
    (home-page "https://github.com/nicholasgasior/sway-easyshot")
    (license license:gpl3+)))

;;; ── rmw-git ──

(define-public rmw-git
  (package
    (name "rmw-git")
    (version "0.9.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/theimpossibleastronaut/rmw/releases/download/v" version "/rmw-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("rmw" "bin/rmw"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "safe-remove command-line utility for the trash")
    (description "ReMove to Waste (rmw) moves files to a trash folder.")
    (home-page "https://remove-to-waste.info/")
    (license license:gpl3+)))

;;; ── etr-bin ──

(define-public etr-bin
  (package
    (name "etr-bin")
    (version "0.8.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicholasgasior/etr/releases/download/v" version "/etr-linux-amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("etr" "bin/etr"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "Extreme Tux Racer binary")
    (description "Extreme Tux Racer is a downhill racing game featuring Tux.")
    (home-page "https://sourceforge.net/projects/extremetuxracer/")
    (license license:gpl2+)))

;;; ── sqlbless-bin ──

(define-public sqlbless-bin
  (package
    (name "sqlbless-bin")
    (version "0.12.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/hymkor/sqlbless/releases/download/v" version "/sqlbless-v" version "-linux-amd64.zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("sqlbless" "bin/sqlbless"))))
    (native-inputs (list unzip))
    (supported-systems '("x86_64-linux"))
    (synopsis "command-line SQL client with readline support")
    (description "SQLBless is a lightweight command-line SQL client.")
    (home-page "https://github.com/hymkor/sqlbless")
    (license license:expat)))

;;; ── mptcpd ──

(define-public mptcpd
  (package
    (name "mptcpd")
    (version "0.12")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/multipath-tcp/mptcpd/releases/download/v" version "/mptcpd-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "multipath TCP daemon")
    (description "Mptcpd manages Multipath TCP connections on Linux.")
    (home-page "https://github.com/multipath-tcp/mptcpd")
    (license license:bsd-3)))

;;; ── easystroke ──

(define-public easystroke
  (package
    (name "easystroke")
    (version "0.6.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/thjaeger/easystroke/archive/refs/tags/" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "gesture recognition application for X11")
    (description "Easystroke is a gesture recognition application for X11.")
    (home-page "https://github.com/thjaeger/easystroke")
    (license license:isc)))
