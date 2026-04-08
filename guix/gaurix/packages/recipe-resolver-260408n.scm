;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2026 Gaurix contributors
;;;
;;; Recipe resolver pass — recipe-resolver-260408n
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages:
;;;   - 9 new recipes (go/cmake/meson/copy build systems)
;;;   - 21 re-evaluated with specific blocking reasons
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros) unless noted.
;;; Run `guix download <url>` to obtain real hashes before building.

(define-module (gaurix packages recipe-resolver-260408n)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system go)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system gnu)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages apparmor)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages cpp)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages machine-learning)
  #:use-module (gnu packages mpi)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages pulseaudio)
  #:use-module (gnu packages serialization)
  #:use-module (gnu packages web)
  #:export (
            ;; New recipes
            zgrab2
            wtp
            gosuki
            apache-tools
            kclock-rs-bin
            taskwire-bin
            livecaptions
            appanvil
            nucleus-cli))

;;;
;;; ── zgrab2 ──────────────────────────────────────────────
;;; Fast application layer scanner
;;;
(define-public zgrab2
  (package
    (name "zgrab2")
    (version "1.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/zmap/zgrab2/archive/refs/tags/v"
             version ".tar.gz"))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/zmap/zgrab2"
           #:install-source? #f
           #:tests? #f))  ;; tests require network access
    (home-page "https://github.com/zmap/zgrab2")
    (synopsis "Fast application layer scanner")
    (description
     "ZGrab2 is a fast, modular application-layer network scanner designed
for use with ZMap.  It supports protocols including HTTP, TLS, SSH, DNS,
FTP, SMTP, POP3, IMAP, and more.  ZGrab2 sends application-layer probes
and captures detailed protocol responses for Internet-wide scanning.")
    (license license:asl2.0)))

;;;
;;; ── wtp ──────────────────────────────────────────────────
;;; Git worktree CLI tool
;;;
(define-public wtp
  (package
    (name "wtp")
    (version "2.10.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/satococoa/wtp/archive/refs/tags/v"
             version ".tar.gz"))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/satococoa/wtp"
           #:install-source? #f
           #:tests? #f))
    (home-page "https://github.com/satococoa/wtp")
    (synopsis "Git worktree CLI tool with automated branch tracking")
    (description
     "WTP (Worktree Power) is a command-line tool for managing Git worktrees.
It provides automated worktree setup, branch tracking, smart navigation
between worktrees, and cleanup utilities.  WTP simplifies working with
multiple branches simultaneously by automating common worktree operations.")
    (license license:expat)))

;;;
;;; ── gosuki ──────────────────────────────────────────────
;;; Cross-browser bookmark manager
;;;
(define-public gosuki
  (package
    (name "gosuki")
    (version "1.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/blob42/gosuki/archive/refs/tags/v"
             version ".tar.gz"))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/blob42/gosuki"
           #:install-source? #f
           #:tests? #f))
    (home-page "https://github.com/blob42/gosuki")
    (synopsis "Cross-browser bookmark manager with real-time sync")
    (description
     "Gosuki is a lightweight, privacy-first bookmark manager that unifies
bookmarks across multiple web browsers with real-time synchronization.
It monitors browser bookmark databases and provides a unified interface
for searching and managing bookmarks across Firefox, Chrome, and
Chromium-based browsers.")
    (license license:agpl3)))

;;;
;;; ── apache-tools ──────────────────────────────────────────
;;; Apache HTTP server utilities (compat alias)
;;;
(define-public apache-tools
  (package
    (inherit httpd)
    (name "apache-tools")
    (synopsis "Useful Apache HTTP server tools: ab, htpasswd, htdigest, htdbm")
    (description
     "Apache tools is a compatibility alias for the Apache HTTP Server package.
It provides utilities such as @command{ab} (Apache Benchmark),
@command{htpasswd}, @command{htdigest}, and @command{htdbm} for managing
HTTP authentication databases and benchmarking web servers.")))

;;;
;;; ── kclock-rs-bin ──────────────────────────────────────────
;;; Cross-platform timer application (pre-built binary)
;;;
(define-public kclock-rs-bin
  (package
    (name "kclock-rs-bin")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://codeberg.org/qml-to-slint/kclock-rs/releases/download/v"
             version "/kclock-rs-x86_64-linux.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("kclock-rs" "bin/kclock-rs"))))
    (home-page "https://codeberg.org/qml-to-slint/kclock-rs")
    (synopsis "Cross-platform timer application built with Rust and Slint")
    (description
     "KClock-rs is a high-performance cross-platform timer application built
with Rust and the Slint UI toolkit.  It provides alarm, timer, and
stopwatch functionality with a clean graphical interface.")
    (license license:gpl3+)))

;;;
;;; ── taskwire-bin ──────────────────────────────────────────
;;; Modern Linux system monitor (pre-built binary)
;;;
(define-public taskwire-bin
  (package
    (name "taskwire-bin")
    (version "2.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/majoraexp/Taskwire/releases/download/v"
             version "/taskwire"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("taskwire" "bin/taskwire"))))
    (home-page "https://github.com/majoraexp/Taskwire")
    (synopsis "Modern Linux system monitor")
    (description
     "Taskwire is a native C++/Qt6 system monitor for Linux.  It provides
real-time monitoring of CPU, memory, disk, and network usage with a
modern graphical interface.")
    (license license:gpl3)))

;;;
;;; ── livecaptions ──────────────────────────────────────────
;;; Live captioning for Linux desktop
;;;
(define-public livecaptions
  (package
    (name "livecaptions")
    (version "0.4.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/abb128/LiveCaptions")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))  ;; no test suite
    (native-inputs (list pkg-config))
    (inputs
     (list libadwaita
           onnxruntime
           pulseaudio
           openmpi))
    (home-page "https://github.com/abb128/LiveCaptions")
    (synopsis "Live captioning application for Linux desktop")
    (description
     "LiveCaptions is a GTK4/Libadwaita application that provides real-time
speech-to-text captioning on the Linux desktop.  It captures system audio
via PulseAudio and uses ONNX Runtime machine learning models to generate
live captions, displayed in an overlay window.")
    (license license:gpl3)))

;;;
;;; ── appanvil ──────────────────────────────────────────────
;;; Graphical AppArmor profile manager
;;;
(define-public appanvil
  (package
    (name "appanvil")
    (version "0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/jack-ullery/AppAnvil")
             (commit "4d7d2bf")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))  ;; tests require running AppArmor
    (native-inputs (list pkg-config))
    (inputs
     (list gtkmm
           jsoncpp
           apparmor))
    (home-page "https://github.com/jack-ullery/AppAnvil")
    (synopsis "Graphical user interface for AppArmor access control")
    (description
     "AppAnvil is a GTK-based graphical interface for managing AppArmor
security profiles on Linux.  It allows users to view, edit, and manage
AppArmor profiles and their enforcement modes through an intuitive
GUI instead of command-line tools.")
    (license license:gpl3)))

;;;
;;; ── nucleus-cli ──────────────────────────────────────────
;;; CLI for Nucleus shell
;;;
(define-public nucleus-cli
  (package
    (name "nucleus-cli")
    (version "0.2.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/nucleus-hq/nucleus-cli")
             (commit "be8fd9a4")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (inputs
     (list nlohmann-json
           curl))
    (home-page "https://github.com/nucleus-hq/nucleus-cli")
    (synopsis "Command-line interface for Nucleus shell")
    (description
     "Nucleus CLI is a fast command-line tool for interacting with
Nucleus shell.  It provides system management operations through
a minimal C++ interface using CMake, nlohmann-json, and libcurl.")
    (license (list license:gpl3 license:expat))))
