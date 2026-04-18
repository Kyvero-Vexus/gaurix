;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260418g
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages.
;;;
;;; New recipes (30):
;;;    1.  whosthere-bin (copy-build-system, v0.7.1, MIT)
;;;    2.  httpx-bin (copy-build-system, v1.9.0, MIT)
;;;    3.  kumono-bin (copy-build-system, v0.77.0, MIT-0)
;;;    4.  gohome-bin (copy-build-system, v1.3.1, MIT)
;;;    5.  dmenu-emoji (copy-build-system, git, MIT)
;;;    6.  foxicons-theme (copy-build-system, v1.0, Unlicense)
;;;    7.  nodenv-node-build (copy-build-system, v5.4.34, MIT)
;;;    8.  zenity-rs-bin (copy-build-system, v0.2.6, MIT)
;;;    9.  cachyos-ananicy-rules (copy-build-system, v1.1.34, GPL-3.0)
;;;   10.  go-live-server-bin (copy-build-system, v1.0.2, MIT)
;;;   11.  gozen-bin (copy-build-system, v0.9.2-alpha, GPL-3.0)
;;;   12.  gpth-bin (copy-build-system, v3.4.3, Apache-2.0)
;;;   13.  gpk-bin (copy-build-system, v0.3.29, GPL-3.0)
;;;   14.  claude-code-seccomp (copy-build-system, v0.0.49, Apache-2.0)
;;;   15.  mezzotone-bin (copy-build-system, v1.1.1, MIT)
;;;   16.  tufw-bin (copy-build-system, v0.2.7, MIT)
;;;   17.  font-lxgw-fasmart-gothic (font-build-system, v1.201, IPA)
;;;   18.  furtherance-bin (copy-build-system, v26.7.0, GPL-3.0)
;;;   19.  ironbar-script-net-bin (copy-build-system, v0.2.0, MIT)
;;;   20.  mullvad-socks-bin (copy-build-system, v1.4.1, MIT-0)
;;;   21.  lazykiq-bin (copy-build-system, v0.1.0, MIT)
;;;   22.  html2data-bin (copy-build-system, v1.2.3, MIT)
;;;   23.  font-blobmoji (font-build-system, v15.0, Apache-2.0)
;;;   24.  kloak (gnu-build-system, v0.2, BSD-3)
;;;   25.  taierspeed-cli-bin (copy-build-system, v1.7.2, LGPL-3.0)
;;;   26.  git-scope-bin (copy-build-system, v1.3.1, MIT)
;;;   27.  fnm-bin (copy-build-system, v1.39.0, GPL-3.0)
;;;   28.  hyprdynamicmonitors-bin (copy-build-system, v1.4.0, MIT)
;;;   29.  font-ioskeley-mono (font-build-system, v2026.03.19-7, OFL-1.1)
;;;   30.  stil-bin (copy-build-system, v0.4.3, WTFPL)
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Use `guix download` to obtain real hashes.

(define-module (gaurix packages recipe-resolver-260418g)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system font)
  #:use-module (guix build-system gnu)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages xorg)
  #:export (
            whosthere-bin
            httpx-bin
            kumono-bin
            gohome-bin
            dmenu-emoji
            foxicons-theme
            nodenv-node-build
            zenity-rs-bin
            cachyos-ananicy-rules
            go-live-server-bin
            gozen-bin
            gpth-bin
            gpk-bin
            claude-code-seccomp
            mezzotone-bin
            tufw-bin
            font-lxgw-fasmart-gothic
            furtherance-bin
            ironbar-script-net-bin
            mullvad-socks-bin
            lazykiq-bin
            html2data-bin
            font-blobmoji
            kloak
            taierspeed-cli-bin
            git-scope-bin
            fnm-bin
            hyprdynamicmonitors-bin
            font-ioskeley-mono
            stil-bin
            ))


;;; ===================================================================
;;; COPY-BUILD-SYSTEM PACKAGES (prebuilt binaries)
;;; ===================================================================

;;; -------------------------------------------------------------------
;;; 1. whosthere-bin --- network device discovery tool
;;; -------------------------------------------------------------------
(define-public whosthere-bin
  (package
    (name "whosthere-bin")
    (version "0.7.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ramonvermeulen/whosthere/releases/download/v"
                    version "/whosthere_" version "_linux_amd64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("whosthere" "bin/whosthere"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/ramonvermeulen/whosthere")
    (synopsis "network device discovery tool")
    (description "Whosthere is a command-line tool for discovering devices on
your local network.  It scans the network and displays information about
connected devices including their IP addresses and hostnames.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 2. httpx-bin --- fast multi-purpose HTTP toolkit
;;; -------------------------------------------------------------------
(define-public httpx-bin
  (package
    (name "httpx-bin")
    (version "1.9.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/projectdiscovery/httpx/releases/download/v"
                    version "/httpx_" version "_linux_amd64.zip"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("httpx" "bin/httpx"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/projectdiscovery/httpx")
    (synopsis "fast and multi-purpose HTTP toolkit")
    (description "httpx is a fast and multi-purpose HTTP toolkit that allows
running multiple probes using the retryablehttp library.  It is designed
to maintain result reliability with an increased number of threads.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 3. kumono-bin --- command-line cloud resource manager
;;; -------------------------------------------------------------------
(define-public kumono-bin
  (package
    (name "kumono-bin")
    (version "0.77.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/APT37/kumono/releases/download/"
                    version "/kumono-linux-x64"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("kumono-linux-x64" "bin/kumono"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'make-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/kumono")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/APT37/kumono")
    (synopsis "command-line cloud resource manager")
    (description "Kumono is a command-line tool for managing cloud resources.
It provides a unified interface for interacting with cloud services and
managing infrastructure from the terminal.")
    (license license:x11)))

;;; -------------------------------------------------------------------
;;; 4. gohome-bin --- directory bookmark manager for the terminal
;;; -------------------------------------------------------------------
(define-public gohome-bin
  (package
    (name "gohome-bin")
    (version "1.3.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/anIcedAntFA/gohome/releases/download/v"
                    version "/gohome_" version "_linux_x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("gohome" "bin/gohome"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/anIcedAntFA/gohome")
    (synopsis "directory bookmark manager for the terminal")
    (description "Gohome is a command-line tool for bookmarking and quickly
navigating to frequently used directories.  It allows you to save directory
paths with short aliases and jump to them instantly.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 8. zenity-rs-bin --- zenity-compatible dialog tool written in Rust
;;; -------------------------------------------------------------------
(define-public zenity-rs-bin
  (package
    (name "zenity-rs-bin")
    (version "0.2.6")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/QaidVoid/zenity-rs/releases/download/v"
                    version "/zenity-rs-x86_64-linux.tar.xz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("zenity-rs" "bin/zenity-rs"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/QaidVoid/zenity-rs")
    (synopsis "zenity-compatible dialog tool written in Rust")
    (description "Zenity-rs is a Rust reimplementation of zenity, providing
a command-line interface for displaying GTK dialog boxes from shell scripts.
It aims for compatibility with the original zenity command-line interface.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 10. go-live-server-bin --- live-reloading development server
;;; -------------------------------------------------------------------
(define-public go-live-server-bin
  (package
    (name "go-live-server-bin")
    (version "1.0.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/coolapso/go-live-server/releases/download/v"
                    version "/go-live-server_" version "_linux_amd64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("go-live-server" "bin/go-live-server"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/coolapso/go-live-server")
    (synopsis "live-reloading development web server")
    (description "Go-live-server is a lightweight development web server
with live reload capability.  It watches for file changes and automatically
refreshes the browser, useful for front-end web development.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 11. gozen-bin --- video editor built with Godot
;;; -------------------------------------------------------------------
(define-public gozen-bin
  (package
    (name "gozen-bin")
    (version "0.9.2-alpha")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/VoylinsGamedevJourney/gozen/releases/download/v"
                    version "/GoZen_Linux_v" version ".zip"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("gozen" "bin/gozen")
               ("gozen.pck" "share/gozen/gozen.pck"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/VoylinsGamedevJourney/GoZen")
    (synopsis "video editor built with Godot engine")
    (description "GoZen is a video editor built with the Godot game engine.
It provides a graphical interface for editing video files with features
like cutting, trimming, and basic effects processing.")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 12. gpth-bin --- Google Photos Takeout helper
;;; -------------------------------------------------------------------
(define-public gpth-bin
  (package
    (name "gpth-bin")
    (version "3.4.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/TheLastGimbus/GooglePhotosTakeoutHelper"
                    "/releases/download/v" version "/gpth-linux"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("gpth-linux" "bin/gpth"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'make-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/gpth")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/TheLastGimbus/GooglePhotosTakeoutHelper")
    (synopsis "tool for organizing Google Photos takeout exports")
    (description "Google Photos Takeout Helper (gpth) is a command-line tool
that helps organize photos exported from Google Photos using Google Takeout.
It fixes file dates, removes duplicates, and organizes files into proper
directory structures based on album names.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 13. gpk-bin --- Glaze package manager helper
;;; -------------------------------------------------------------------
(define-public gpk-bin
  (package
    (name "gpk-bin")
    (version "0.3.29")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/neur0map/glazepkg/releases/download/v"
                    version "/gpk-linux-amd64"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("gpk-linux-amd64" "bin/gpk"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'make-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/gpk")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/neur0map/glazepkg")
    (synopsis "Glaze window manager package helper")
    (description "GPK (GlazePKG) is a command-line utility for managing
packages and configurations for the Glaze window manager.  It simplifies
the process of installing and managing Glaze extensions and themes.")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 14. claude-code-seccomp --- seccomp sandbox for Claude Code
;;; -------------------------------------------------------------------
(define-public claude-code-seccomp
  (package
    (name "claude-code-seccomp")
    (version "0.0.49")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/anthropic-experimental/sandbox-runtime")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/claude-code-seccomp/"
                #:exclude ("node_modules" ".git")))))
    (home-page "https://github.com/anthropic-experimental/sandbox-runtime")
    (synopsis "seccomp sandbox runtime for Claude Code")
    (description "Claude Code Seccomp provides a seccomp-based sandbox
runtime for Claude Code.  It restricts system calls available to child
processes, providing an additional layer of security when executing
untrusted code.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 15. mezzotone-bin --- audio dithering tool
;;; -------------------------------------------------------------------
(define-public mezzotone-bin
  (package
    (name "mezzotone-bin")
    (version "1.1.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/joaoheitorgarcia/Mezzotone/releases/download/v"
                    version "/app-linux-amd64"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("app-linux-amd64" "bin/mezzotone"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'make-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/mezzotone")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/joaoheitorgarcia/Mezzotone")
    (synopsis "audio dithering and processing tool")
    (description "Mezzotone is a terminal-based audio dithering and processing
tool.  It provides a text user interface for applying various dithering
algorithms to audio files, useful for audio mastering workflows.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 16. tufw-bin --- terminal UI for UFW firewall
;;; -------------------------------------------------------------------
(define-public tufw-bin
  (package
    (name "tufw-bin")
    (version "0.2.7")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/peltho/tufw/releases/download/v"
                    version "/tufw_" version "_linux_amd64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("tufw" "bin/tufw"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/peltho/tufw")
    (synopsis "terminal user interface for UFW firewall")
    (description "TUFW is a terminal user interface for managing UFW (Uncomplicated
Firewall) rules.  It provides an interactive TUI for adding, removing, and
viewing firewall rules without memorizing UFW command-line syntax.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 18. furtherance-bin --- time tracking application
;;; -------------------------------------------------------------------
(define-public furtherance-bin
  (package
    (name "furtherance-bin")
    (version "26.7.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/unobserved-io/Furtherance/releases/download/"
                    version "/furtherance-" version "-x86_64-linux.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("furtherance" "bin/furtherance"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/unobserved-io/Furtherance")
    (synopsis "time tracking application")
    (description "Furtherance is a time tracking application that helps you
track how much time you spend on various tasks.  It provides a simple
interface for starting and stopping timers, with reporting capabilities
to analyze how your time is spent.")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 19. ironbar-script-net-bin --- network status script for Ironbar
;;; -------------------------------------------------------------------
(define-public ironbar-script-net-bin
  (package
    (name "ironbar-script-net-bin")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/liuhq/ironbar-script-net/releases/download/"
                    version "/ironbar-script-net_" version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(let ((src (string-append "ironbar-script-net_" #$version)))
               (list (list src "bin/ironbar-script-net")))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'make-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/ironbar-script-net")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/liuhq/ironbar-script-net")
    (synopsis "network status script for Ironbar panel")
    (description "Ironbar-script-net is a network status monitor script
for the Ironbar Wayland panel.  It displays current network connection
information including interface name, IP address, and connection status.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 20. mullvad-socks-bin --- Mullvad VPN SOCKS5 proxy helper
;;; -------------------------------------------------------------------
(define-public mullvad-socks-bin
  (package
    (name "mullvad-socks-bin")
    (version "1.4.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/APT37/mullvad-socks/releases/download/"
                    version "/mvs-cli"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("mvs-cli" "bin/mvs-cli"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'make-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/mvs-cli")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/APT37/mullvad-socks")
    (synopsis "Mullvad VPN SOCKS5 proxy helper")
    (description "Mullvad-socks provides a command-line interface for
managing SOCKS5 proxy connections through Mullvad VPN servers.  It
simplifies the process of routing traffic through Mullvad's proxy
infrastructure.")
    (license license:x11)))

;;; -------------------------------------------------------------------
;;; 21. lazykiq-bin --- terminal UI for Sidekiq job monitoring
;;; -------------------------------------------------------------------
(define-public lazykiq-bin
  (package
    (name "lazykiq-bin")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/kpumuk/lazykiq/releases/download/v"
                    version "/lazykiq-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("lazykiq" "bin/lazykiq"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/kpumuk/lazykiq")
    (synopsis "terminal user interface for Sidekiq job monitoring")
    (description "Lazykiq is a terminal user interface for monitoring Sidekiq
background jobs.  It provides a real-time view of queues, workers, and job
statistics, similar to the Sidekiq web UI but accessible from the terminal.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 22. html2data-bin --- HTML to structured data extractor
;;; -------------------------------------------------------------------
(define-public html2data-bin
  (package
    (name "html2data-bin")
    (version "1.2.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/msoap/html2data/releases/download/v"
                    version "/html2data_" version "_linux_amd64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("html2data" "bin/html2data"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/msoap/html2data")
    (synopsis "extract data from HTML using CSS selectors")
    (description "html2data is a command-line tool for extracting structured
data from HTML documents using CSS selectors.  It outputs results in various
formats including JSON, making it useful for web scraping and data extraction
pipelines.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 25. taierspeed-cli-bin --- China Telecom speed test tool
;;; -------------------------------------------------------------------
(define-public taierspeed-cli-bin
  (package
    (name "taierspeed-cli-bin")
    (version "1.7.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ztelliot/taierspeed-cli/releases/download/v"
                    version "/taierspeed-cli_" version "_linux_amd64"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(let ((src (string-append "taierspeed-cli_" #$version "_linux_amd64")))
               (list (list src "bin/taierspeed-cli")))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'make-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/taierspeed-cli")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/ztelliot/taierspeed-cli")
    (synopsis "internet speed test tool for China Telecom networks")
    (description "Taierspeed-cli is a command-line internet speed testing tool
optimized for China Telecom networks.  It provides download and upload speed
measurements using China Telecom's speed test infrastructure.")
    (license license:lgpl3)))

;;; -------------------------------------------------------------------
;;; 26. git-scope-bin --- Git repository statistics viewer
;;; -------------------------------------------------------------------
(define-public git-scope-bin
  (package
    (name "git-scope-bin")
    (version "1.3.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Bharath-code/git-scope/releases/download/v"
                    version "/git-scope_" version "_linux_amd64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("git-scope" "bin/git-scope"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Bharath-code/git-scope")
    (synopsis "git repository statistics and insights viewer")
    (description "Git-scope is a command-line tool for viewing statistics and
insights about Git repositories.  It analyzes commit history, contributor
activity, and code changes to provide a comprehensive overview of repository
health and development patterns.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 27. fnm-bin --- fast Node.js version manager
;;; -------------------------------------------------------------------
(define-public fnm-bin
  (package
    (name "fnm-bin")
    (version "1.39.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Schniz/fnm/releases/download/v"
                    version "/fnm-linux.zip"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("fnm" "bin/fnm"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Schniz/fnm")
    (synopsis "fast and simple Node.js version manager")
    (description "FNM (Fast Node Manager) is a fast and simple Node.js version
manager built in Rust.  It allows installing and switching between multiple
Node.js versions with minimal overhead, supporting @.nvmrc@ and
@.node-version@ files for automatic version switching.")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 28. hyprdynamicmonitors-bin --- dynamic monitor management for Hyprland
;;; -------------------------------------------------------------------
(define-public hyprdynamicmonitors-bin
  (package
    (name "hyprdynamicmonitors-bin")
    (version "1.4.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/fiffeek/hyprdynamicmonitors/releases/download/v"
                    version "/hyprdynamicmonitors_Linux_x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("hyprdynamicmonitors" "bin/hyprdynamicmonitors"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/fiffeek/hyprdynamicmonitors")
    (synopsis "dynamic monitor management for Hyprland")
    (description "Hyprdynamicmonitors is a tool for dynamically managing
monitor configurations in the Hyprland Wayland compositor.  It automatically
detects monitor hotplug events and applies saved configurations, making it
easy to work with docking stations and external displays.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 30. stil-bin --- simple text insertion tool
;;; -------------------------------------------------------------------
(define-public stil-bin
  (package
    (name "stil-bin")
    (version "0.4.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/sermuns/stil/releases/download/v"
                    version "/stil-v" version
                    "-x86_64-unknown-linux-gnu.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("stil" "bin/stil"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/sermuns/stil")
    (synopsis "simple text insertion and templating tool")
    (description "Stil is a command-line tool for simple text insertion and
templating.  It reads template files with placeholder markers and replaces
them with provided values, useful for generating configuration files and
text documents from templates.")
    (license license:wtfpl2)))


;;; ===================================================================
;;; COPY-BUILD-SYSTEM PACKAGES (scripts and data)
;;; ===================================================================

;;; -------------------------------------------------------------------
;;; 5. dmenu-emoji --- emoji picker using dmenu
;;; -------------------------------------------------------------------
(define-public dmenu-emoji
  (package
    (name "dmenu-emoji")
    (version "0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/shasherazi/dmenuEmoji")
                    (commit "21babf5bbebfe09cce4d4cee4d0e3fe94e99eecc")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("dmenuEmoji.sh" "bin/dmenu-emoji")
               ("emoji.txt" "share/dmenu-emoji/emoji.txt"))))
    (home-page "https://github.com/shasherazi/dmenuEmoji")
    (synopsis "emoji picker using dmenu")
    (description "Dmenu-emoji is a shell script that provides an emoji picker
using dmenu.  It displays a searchable list of emoji characters and copies
the selected emoji to the clipboard using xdotool or xclip.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 6. foxicons-theme --- icon theme for GTK desktops
;;; -------------------------------------------------------------------
(define-public foxicons-theme
  (package
    (name "foxicons-theme")
    (version "1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/SzponerZoli/foxicons-theme")
                    (commit "1.0")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/icons/Foxicons/"
                #:exclude (".git" "README.md" "LICENSE")))))
    (home-page "https://github.com/SzponerZoli/foxicons-theme")
    (synopsis "icon theme for GTK desktop environments")
    (description "Foxicons is an icon theme for GTK-based desktop environments.
It provides a cohesive set of application, file type, and system icons
designed for a modern desktop appearance.")
    (license license:unlicense)))

;;; -------------------------------------------------------------------
;;; 7. nodenv-node-build --- node-build plugin for nodenv
;;; -------------------------------------------------------------------
(define-public nodenv-node-build
  (package
    (name "nodenv-node-build")
    (version "5.4.34")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nodenv/node-build")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("bin/" "bin/")
               ("share/" "share/"))))
    (inputs (list bash-minimal))
    (home-page "https://github.com/nodenv/node-build")
    (synopsis "node-build plugin for installing Node.js versions via nodenv")
    (description "Node-build is a plugin for nodenv that provides the
@code{nodenv install} command.  It compiles and installs different versions
of Node.js from source or prebuilt binaries, supporting all major Node.js
release lines.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 9. cachyos-ananicy-rules --- CachyOS process priority rules
;;; -------------------------------------------------------------------
(define-public cachyos-ananicy-rules
  (package
    (name "cachyos-ananicy-rules")
    (version "1.1.34")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/CachyOS/ananicy-rules")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "etc/ananicy.d/"
                #:exclude (".git" "README.md" "LICENSE")))))
    (home-page "https://github.com/CachyOS/ananicy-rules")
    (synopsis "CachyOS process scheduling and priority rules for ananicy")
    (description "CachyOS ananicy-rules provides a comprehensive set of
process scheduling rules for ananicy-cpp.  These rules automatically adjust
CPU scheduling priorities, I/O classes, and OOM scores for commonly used
applications to improve desktop responsiveness.")
    (license license:gpl3)))


;;; ===================================================================
;;; FONT PACKAGES (font-build-system)
;;; ===================================================================

;;; -------------------------------------------------------------------
;;; 17. font-lxgw-fasmart-gothic --- LXGW FasmartGothic CJK font
;;; -------------------------------------------------------------------
(define-public font-lxgw-fasmart-gothic
  (package
    (name "font-lxgw-fasmart-gothic")
    (version "1.201")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/lxgw/LxgwFasmartGothic/releases/download/v"
                    version "/LXGWFasmartGothic.ttf"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (home-page "https://github.com/lxgw/LxgwFasmartGothic")
    (synopsis "LXGW FasmartGothic CJK font")
    (description "LXGW FasmartGothic is a sans-serif CJK font based on Klee
One and other open-source fonts.  It provides comprehensive coverage of
Chinese, Japanese, and Korean characters in a clean, modern gothic style
suitable for both display and body text.")
    (license (license:non-copyleft
              "https://opensource.org/licenses/IPA"
              "IPA Font License"))))

;;; -------------------------------------------------------------------
;;; 23. font-blobmoji --- blob-style emoji font
;;; -------------------------------------------------------------------
(define-public font-blobmoji
  (package
    (name "font-blobmoji")
    (version "15.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/C1710/blobmoji/releases/download/v"
                    version "/Blobmoji.ttf"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (home-page "https://github.com/C1710/blobmoji")
    (synopsis "blob-style emoji font based on Noto Emoji")
    (description "Blobmoji is a blob-style emoji font based on Google's Noto
Emoji.  It brings back the classic blob emoji design that was used in
older versions of Android, providing a rounder, friendlier alternative
to the current Noto Emoji style.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 29. font-ioskeley-mono --- monospace coding font
;;; -------------------------------------------------------------------
(define-public font-ioskeley-mono
  (package
    (name "font-ioskeley-mono")
    (version "2026.03.19-7")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ahatem/IoskeleyMono/releases/download/"
                    version "/IoskeleyMono-TTF-Unhinted.zip"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (home-page "https://github.com/ahatem/IoskeleyMono")
    (synopsis "monospace programming font based on Iosevka")
    (description "Ioskeley Mono is a monospace programming font derived from
Iosevka.  It provides a clean, readable typeface optimized for code editing
with distinctive character shapes to improve legibility at small sizes.")
    (license license:silofl1.1)))


;;; ===================================================================
;;; GNU-BUILD-SYSTEM PACKAGES (source builds)
;;; ===================================================================

;;; -------------------------------------------------------------------
;;; 24. kloak --- keystroke-level online anonymization kernel module
;;; -------------------------------------------------------------------
(define-public kloak
  (package
    (name "kloak")
    (version "0.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/vmonaco/kloak")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:make-flags #~(list (string-append "CC=" #$(cc-for-target))
                           (string-append "PREFIX=" #$output))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure))))
    (inputs (list libevdev))
    (native-inputs (list pkg-config))
    (home-page "https://github.com/vmonaco/kloak")
    (synopsis "keystroke-level online anonymization kernel-level tool")
    (description "Kloak is a privacy tool that anonymizes keystroke timings
to prevent keystroke-based identification.  It works by intercepting keyboard
events at the evdev level and releasing them with randomized delays, making
it harder to identify users based on their typing patterns.")
    (license license:bsd-3)))
