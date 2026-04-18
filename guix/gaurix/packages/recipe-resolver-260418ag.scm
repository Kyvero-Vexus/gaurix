;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260418ag
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages.
;;;
;;; New recipes (24):
;;;        1.  wormhole-william-bin (copy-build-system, v1.0.8, MIT)
;;;        2.  wait4x-bin (copy-build-system, v3.2.0, Apache-2.0)
;;;        3.  dnscontrol-bin (copy-build-system, v4.36.1, MIT)
;;;        4.  wrkflw-bin (copy-build-system, v0.7.3, MIT)
;;;        5.  patchy-bin (copy-build-system, v0.0.27, MIT)
;;;        6.  orbit-bin (copy-build-system, v3.3.0, MIT)
;;;        7.  cnote-bin (copy-build-system, v1.1.2, MIT)
;;;        8.  hyprmon-bin (copy-build-system, v0.0.15, Apache-2.0)
;;;        9.  suiup-bin (copy-build-system, v0.0.10, Apache-2.0)
;;;       10.  ffdash-bin (copy-build-system, v0.3.2, MIT)
;;;       11.  omp-manager-bin (copy-build-system, v0.1.2, MIT)
;;;       12.  comp-scan-bin (copy-build-system, v0.1.0, MIT)
;;;       13.  youtube-tui-full-bin (copy-build-system, v0.9.4, GPL-3.0)
;;;       14.  chough-bin (copy-build-system, v1.0.0, MIT)
;;;       15.  radicle-httpd-bin (copy-build-system, v0.24.0, Apache-2.0/MIT)
;;;       16.  materialgram-bin (copy-build-system, v6.4.0.1, GPL-3.0)
;;;       17.  framework-control-bin (copy-build-system, v0.5.2, MIT)
;;;       18.  weylus-bin (copy-build-system, v0.11.4, AGPL-3.0)
;;;       19.  gaffer-bin (copy-build-system, v1.4.13.0, BSD-3-Clause)
;;;       20.  neohtop-bin (copy-build-system, v1.2.0, MIT)
;;;       21.  briar-desktop-bin (copy-build-system, v0.6.5-beta, GPL-3.0+)
;;;       22.  iloader-appimage (copy-build-system, v2.2.4, MIT)
;;;       23.  r47-bin (copy-build-system, v00.109.03.01b1, GPL-3.0+)
;;;       24.  spacestation14-launcher-bin (copy-build-system, v0.37.1, MIT)
;;;
;;; BLOCKED EXHAUSTED (6):
;;;       25.  archium-bin -> ARCH_SPECIFIC: wraps AUR helpers (yay/paru); no utility on Guix
;;;       26.  dupeguru -> SOURCE_BUILD: requires pyqt5 + source build; not a binary package
;;;       27.  fchat-horizon-bin -> ELECTRON_COMPLEX: requires system electron + complex resource extraction
;;;       28.  elecwhat-bin -> ELECTRON_COMPLEX: .pacman format, requires system electron37
;;;       29.  ytdownloader-gui-bin -> ELECTRON_COMPLEX: .rpm format, requires system electron30
;;;       30.  mkbrr-gui-bin -> RELEASE_CANDIDATE: v1.19.0-rc.1 is not a stable release; Tauri app needs webkit2gtk
;;;
;;; NOTE: All hashes are placeholders (base32 "0000...").
;;; Run `guix build -L guix <name>` to obtain actual hashes from error output.

(define-module (gaurix packages recipe-resolver-260418ag)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module ((guix licenses) #:prefix license:))

;;; -------------------------------------------------------------------
;;; 1. wormhole-william-bin --- Magic wormhole in Go
;;; Secure file transfer using the magic wormhole protocol.
;;; -------------------------------------------------------------------
(define-public wormhole-william-bin
  (package
    (name "wormhole-william-bin")
    (version "1.0.8")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/psanford/wormhole-william/releases/download/v"
                    version "/wormhole-william-linux-amd64"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("wormhole-william-linux-amd64" "bin/wormhole-william"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (mkdir-p ".")
                   (copy-file source "wormhole-william-linux-amd64")
                   (chmod "wormhole-william-linux-amd64" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/psanford/wormhole-william")
    (synopsis "secure file transfer using the magic wormhole protocol")
    (description "Wormhole-william is a Go implementation of magic wormhole,
a tool for securely transferring files and text between computers.  It provides
end-to-end encrypted transfers using PAKE (password-authenticated key exchange).")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 2. wait4x-bin --- Wait for services to be ready
;;; Wait for ports/services before starting dependent processes.
;;; -------------------------------------------------------------------
(define-public wait4x-bin
  (package
    (name "wait4x-bin")
    (version "3.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/wait4x/wait4x/releases/download/v"
                    version "/wait4x-linux-amd64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("wait4x" "bin/wait4x"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://wait4x.dev")
    (synopsis "wait for a port or service to enter the requested state")
    (description "Wait4X allows waiting for a port or a service to enter the
requested state, with support for TCP, HTTP, Redis, MySQL, PostgreSQL,
and more.  Useful for CI/CD pipelines and container orchestration.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 3. dnscontrol-bin --- DNS management tool
;;; Synchronize DNS records across multiple providers.
;;; -------------------------------------------------------------------
(define-public dnscontrol-bin
  (package
    (name "dnscontrol-bin")
    (version "4.36.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/StackExchange/dnscontrol/releases/download/v"
                    version "/dnscontrol_" version "_linux_amd64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("dnscontrol" "bin/dnscontrol"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://stackexchange.github.io/dnscontrol/")
    (synopsis "synchronize dns to multiple providers from a simple dsl")
    (description "DNSControl is a tool from StackExchange for managing DNS
records across multiple providers (Cloudflare, AWS Route53, etc.) using a
JavaScript-based DSL.  It provides a single source of truth for DNS
configuration with preview and push workflows.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 4. wrkflw-bin --- GitHub Actions local runner
;;; Validate and execute GitHub Actions workflows locally.
;;; -------------------------------------------------------------------
(define-public wrkflw-bin
  (package
    (name "wrkflw-bin")
    (version "0.7.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/bahdotsh/wrkflw/releases/download/v"
                    version "/wrkflw-v" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("wrkflw" "bin/wrkflw"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/bahdotsh/wrkflw")
    (synopsis "validate and execute github actions workflows locally")
    (description "A CLI tool that validates and runs GitHub Actions workflow
files locally, allowing developers to test their CI/CD pipelines without
pushing to GitHub.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 5. patchy-bin --- Git patch utility
;;; CLI for generating and applying patches to git repositories.
;;; -------------------------------------------------------------------
(define-public patchy-bin
  (package
    (name "patchy-bin")
    (version "0.0.27")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/richardgill/patchy/releases/download/v"
                    version "/patchy-linux-x64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("patchy-linux-x64" "bin/patchy"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/richardgill/patchy")
    (synopsis "cli for generating and applying patches to git repositories")
    (description "Patchy is a command-line tool for generating and applying
patches to git repositories.  It simplifies the workflow of creating,
managing, and applying diffs across codebases.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 6. orbit-bin --- Task runner from templates
;;; Cross-platform task runner for commands and file generation.
;;; -------------------------------------------------------------------
(define-public orbit-bin
  (package
    (name "orbit-bin")
    (version "3.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/gulien/orbit/releases/download/v"
                    version "/orbit_Linux_x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("orbit" "bin/orbit"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/gulien/orbit")
    (synopsis "cross-platform task runner for commands and file generation")
    (description "Orbit is a cross-platform task runner for executing commands
and generating files from templates.  It supports Go templates with Sprig
functions for configuration file generation and task automation.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 7. cnote-bin --- Ephemeral CLI notes
;;; Minimalist ephemeral CLI note-taking tool.
;;; -------------------------------------------------------------------
(define-public cnote-bin
  (package
    (name "cnote-bin")
    (version "1.1.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/amirfarzamnia/cnote/releases/download/v"
                    version "/cnote_" version "_linux_amd64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("cnote" "bin/cnote"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/amirfarzamnia/cnote")
    (synopsis "minimalist ephemeral cli note-taking tool")
    (description "Casual Note (cnote) is a minimalist, ephemeral CLI
note-taking tool.  Notes are stored temporarily and designed for quick
capture of transient thoughts and reminders.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 8. hyprmon-bin --- Hyprland monitor profile manager
;;; Multi-monitor profile manager for Hyprland.
;;; -------------------------------------------------------------------
(define-public hyprmon-bin
  (package
    (name "hyprmon-bin")
    (version "0.0.15")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/erans/hyprmon/releases/download/v"
                    version "/hyprmon-linux-amd64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("hyprmon-linux-amd64" "bin/hyprmon"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/erans/hyprmon")
    (synopsis "multi-monitor profile manager for hyprland")
    (description "Hyprmon is a multi-monitor profile manager for Hyprland.
It allows saving and restoring monitor configurations (resolution, position,
scale, transform) as named profiles for quick switching between different
display setups.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 9. suiup-bin --- Sui toolchain manager
;;; Installer and version manager for the Sui blockchain toolchain.
;;; -------------------------------------------------------------------
(define-public suiup-bin
  (package
    (name "suiup-bin")
    (version "0.0.10")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/MystenLabs/suiup/releases/download/v"
                    version "/suiup-Linux-musl-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("suiup" "bin/suiup"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/MystenLabs/suiup")
    (synopsis "installer and version manager for the sui toolchain")
    (description "Suiup is a toolchain installer and version manager for the
Sui blockchain development tools, similar to rustup for Rust.  Made by
MystenLabs, the creators of the Sui blockchain.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 10. ffdash-bin --- VP9 encoder dashboard
;;; VP9 video encoder with live TUI dashboard.
;;; -------------------------------------------------------------------
(define-public ffdash-bin
  (package
    (name "ffdash-bin")
    (version "0.3.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/bcherb2/ffdash/releases/download/v"
                    version "/ffdash-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("ffdash" "bin/ffdash"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/bcherb2/ffdash")
    (synopsis "vp9 video encoder with live tui dashboard")
    (description "FFdash is a VP9 video encoder with a live terminal dashboard
and hardware acceleration support.  Depends on ffmpeg at runtime.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 11. omp-manager-bin --- Oh My Posh manager
;;; Installation and manager for Oh My Posh.
;;; -------------------------------------------------------------------
(define-public omp-manager-bin
  (package
    (name "omp-manager-bin")
    (version "0.1.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/marlocarlo/omp-manager/releases/download/v"
                    version "/omp-manager-x86_64-unknown-linux-gnu.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("omp-manager" "bin/omp-manager"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/marlocarlo/omp-manager")
    (synopsis "installation and manager for oh my posh")
    (description "A tool for managing the installation and configuration of
Oh My Posh, a cross-platform prompt theme engine for any shell.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 12. comp-scan-bin --- System improvement scanner
;;; Local AI agent that scans your system and suggests improvements.
;;; -------------------------------------------------------------------
(define-public comp-scan-bin
  (package
    (name "comp-scan-bin")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/vvk147/comp-scan/releases/download/v"
                    version "/compscan-x86_64-unknown-linux-gnu.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("compscan" "bin/compscan"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/vvk147/comp-scan")
    (synopsis "local ai agent that scans your system and suggests improvements")
    (description "Comp-scan is a fully local AI agent that scans your system,
observes usage patterns, and suggests one-click improvements.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 13. youtube-tui-full-bin --- YouTube terminal interface
;;; Terminal user interface for browsing YouTube.
;;; -------------------------------------------------------------------
(define-public youtube-tui-full-bin
  (package
    (name "youtube-tui-full-bin")
    (version "0.9.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Siriusmart/youtube-tui/releases/download/v"
                    version "/youtube-tui-full_arch-x86_64"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("youtube-tui-full_arch-x86_64" "bin/youtube-tui"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (mkdir-p ".")
                   (copy-file source "youtube-tui-full_arch-x86_64")
                   (chmod "youtube-tui-full_arch-x86_64" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Siriusmart/youtube-tui")
    (synopsis "terminal user interface for browsing youtube")
    (description "An aesthetically pleasing TUI frontend for browsing YouTube,
written in Rust.  The full variant includes libsixel support for image
rendering in the terminal.")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 14. chough-bin --- Fast speech recognition CLI
;;; Fast automatic speech recognition using Parakeet TDT.
;;; -------------------------------------------------------------------
(define-public chough-bin
  (package
    (name "chough-bin")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/hyperpuncher/chough/releases/download/v"
                    version "/chough_v" version "_linux_x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("chough" "bin/chough"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'install-libs
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((lib (string-append (assoc-ref outputs "out")
                                             "/lib/chough")))
                     (mkdir-p lib)
                     (for-each (lambda (f)
                                 (when (string-suffix? ".so" f)
                                   (install-file f lib)))
                               (find-files "." "\\.so$"))))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/hyperpuncher/chough")
    (synopsis "fast automatic speech recognition cli using parakeet tdt")
    (description "Chough is a fast ASR (Automatic Speech Recognition) CLI tool
that uses NVIDIA's Parakeet TDT model for speech-to-text transcription.
Bundles necessary shared libraries for inference.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 15. radicle-httpd-bin --- Radicle web explorer
;;; HTTP daemon for the Radicle peer-to-peer code collaboration stack.
;;; -------------------------------------------------------------------
(define-public radicle-httpd-bin
  (package
    (name "radicle-httpd-bin")
    (version "0.24.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://files.radicle.xyz/releases/radicle-httpd/"
                    version "/radicle-httpd-" version
                    "-x86_64-unknown-linux-musl.tar.xz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list (string-append "radicle-httpd-" #$version
                                        "-x86_64-unknown-linux-musl/bin/radicle-httpd")
                         "bin/radicle-httpd"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://radicle.xyz")
    (synopsis "web explorer for the radicle peer-to-peer code collaboration stack")
    (description "Radicle-httpd is the HTTP daemon and web explorer component
of Radicle, an open source peer-to-peer code collaboration stack built on
Git.  It serves a web interface for browsing repositories, issues, and
patches hosted on Radicle nodes.")
    (license (list license:asl2.0 license:expat))))

;;; -------------------------------------------------------------------
;;; 16. materialgram-bin --- Material Design Telegram client
;;; Telegram desktop client with Material Design UI.
;;; -------------------------------------------------------------------
(define-public materialgram-bin
  (package
    (name "materialgram-bin")
    (version "6.4.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicegram/nicegram-desktop/releases/download/v"
                    version "/materialgram-v" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("usr/bin/materialgram" "bin/materialgram"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/kukuruzka165/materialgram")
    (synopsis "telegram desktop client with material design")
    (description "Materialgram is a Telegram Desktop-based messenger featuring
Material Design UI and additional customization options.  It provides the full
Telegram desktop experience with an alternate visual style.")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 17. framework-control-bin --- Framework Laptop control
;;; Tool for Framework Laptop fan, battery, and LED control.
;;; -------------------------------------------------------------------
(define-public framework-control-bin
  (package
    (name "framework-control-bin")
    (version "0.5.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ozturkkl/framework-control/releases/download/"
                    version "/framework-control-service-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("framework-control" "bin/framework-control"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/ozturkkl/framework-control")
    (synopsis "tool for framework laptop fan, battery, and led control")
    (description "A control tool for Framework Laptop hardware features
including fan speed, battery charge limits, and LED configuration.  Runs as
a service with a web UI on port 30912.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 18. weylus-bin --- Tablet as input device
;;; Use your tablet as a graphic tablet or touch screen.
;;; -------------------------------------------------------------------
(define-public weylus-bin
  (package
    (name "weylus-bin")
    (version "0.11.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/H-M-H/Weylus/releases/download/v"
                    version "/linux.zip"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("weylus" "bin/weylus"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/H-M-H/Weylus")
    (synopsis "use your tablet as a graphic tablet or touch screen")
    (description "Weylus lets you use your tablet as a graphic tablet or touch
screen on your computer.  It works by streaming the desktop to the tablet
browser and capturing touch/stylus input.")
    (license license:agpl3)))

;;; -------------------------------------------------------------------
;;; 19. gaffer-bin --- VFX node graph application
;;; Node-based VFX application for look development and compositing.
;;; -------------------------------------------------------------------
(define-public gaffer-bin
  (package
    (name "gaffer-bin")
    (version "1.4.13.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/GafferHQ/gaffer/releases/download/"
                    version "/gaffer-" version "-linux-gcc11.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(let ((ver #$version))
               (list (list (string-append "gaffer-" ver "-linux-gcc11/bin/")
                           "bin/")
                     (list (string-append "gaffer-" ver "-linux-gcc11/lib/")
                           "lib/")
                     (list (string-append "gaffer-" ver "-linux-gcc11/python/")
                           "share/gaffer/python/")
                     (list (string-append "gaffer-" ver "-linux-gcc11/resources/")
                           "share/gaffer/resources/")
                     (list (string-append "gaffer-" ver "-linux-gcc11/shaders/")
                           "share/gaffer/shaders/")
                     (list (string-append "gaffer-" ver "-linux-gcc11/startup/")
                           "share/gaffer/startup/")))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.gafferhq.org/")
    (synopsis "vfx application for look development, lighting, and compositing")
    (description "Gaffer is a node-based VFX application that enables look
developers, lighters, and compositors to easily build, tweak, iterate, and
render scenes.  It supports Arnold, 3Delight, and Cycles renderers.")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; 20. neohtop-bin --- Modern system monitor
;;; Modern system monitor with a graphical interface.
;;; -------------------------------------------------------------------
(define-public neohtop-bin
  (package
    (name "neohtop-bin")
    (version "1.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Abdenasser/neohtop/releases/download/v"
                    version "/NeoHtop_" version "_x86_64.deb"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
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
                   (invoke "tar" "xf" "data.tar.gz"))))))
    (native-inputs (list))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Abdenasser/neohtop")
    (synopsis "modern system monitor with a graphical interface")
    (description "NeoHtop is a modern, cross-platform system monitor built
with Tauri (Rust + web frontend).  It provides an enhanced htop-like
experience with a graphical interface showing process information, resource
usage, and system metrics.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 21. briar-desktop-bin --- Secure P2P messenger
;;; Encrypted peer-to-peer messaging for desktop.
;;; -------------------------------------------------------------------
(define-public briar-desktop-bin
  (package
    (name "briar-desktop-bin")
    (version "0.6.5-beta")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://desktop.briarproject.org/jars/linux/"
                    version "/briar-desktop-linux-" version ".jar"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("briar-desktop.jar" "share/java/briar-desktop.jar"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (mkdir-p ".")
                   (copy-file source "briar-desktop.jar")))
               (add-after 'install 'create-wrapper
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin"))
                          (jar (string-append out "/share/java/briar-desktop.jar")))
                     (mkdir-p bin)
                     (with-output-to-file (string-append bin "/briar-desktop")
                       (lambda ()
                         (format #t "#!/bin/sh~%exec java -jar ~a \"$@\"~%" jar)))
                     (chmod (string-append bin "/briar-desktop") #o755)))))))
    (home-page "https://code.briarproject.org/briar/briar-desktop")
    (synopsis "encrypted peer-to-peer messaging for desktop")
    (description "Briar Desktop is a secure, decentralized messaging
application that communicates through the Tor network, local Wi-Fi, or
Bluetooth.  Messages are stored securely on device, not in the cloud.
Requires Java 17 runtime.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 22. iloader-appimage --- iOS sideloading desktop app
;;; Desktop app for sideloading apps onto iOS devices.
;;; -------------------------------------------------------------------
(define-public iloader-appimage
  (package
    (name "iloader-appimage")
    (version "2.2.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nab138/iloader/releases/download/v"
                    version "/iloader-linux-amd64.AppImage"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("iloader" "bin/iloader"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (mkdir-p ".")
                   (copy-file source "iloader")
                   (chmod "iloader" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nab138/iloader")
    (synopsis "desktop app for sideloading apps onto ios devices")
    (description "iloader is a user-friendly desktop application that
simplifies sideloading apps onto iOS devices.  It enables users to install
applications, manage pairing files, import IPAs, and handle development
certificates.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 23. r47-bin --- R47 calculator emulator
;;; Emulator for the R47 pocket calculator.
;;; -------------------------------------------------------------------
(define-public r47-bin
  (package
    (name "r47-bin")
    (version "00.109.03.01b1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://gitlab.com/api/v4/projects/14055190"
                    "/packages/generic/c47/" version
                    "/c47-linux-" version ".zip"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("r47" "bin/r47")
               ("C47__StandardFont.ttf" "share/r47/C47__StandardFont.ttf")
               ("res/" "share/r47/res/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://47calc.com")
    (synopsis "emulator for the r47 pocket calculator")
    (description "R47-bin provides an emulator for the SwissMicros R47 pocket
calculator.  The R47 runs the same software as the C47 scientific calculator
but with an alternate keyboard layout.  This is a GTK3-based desktop
simulator.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 24. spacestation14-launcher-bin --- SS14 game launcher
;;; Launcher for the Space Station 14 multiplayer game.
;;; -------------------------------------------------------------------
(define-public spacestation14-launcher-bin
  (package
    (name "spacestation14-launcher-bin")
    (version "0.37.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/space-wizards/SS14.Launcher/"
                    "releases/download/v" version
                    "/SS14.Launcher_Linux.zip"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("SS14.Launcher" "bin/spacestation14-launcher"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'chmod-binary
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/spacestation14-launcher")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://spacestation14.io/")
    (synopsis "launcher for the space station 14 multiplayer game")
    (description "Space Station 14 launcher application that downloads,
updates, and launches the open-source remake of Space Station 13, a
multiplayer role-playing game set on a space station.")
    (license license:expat)))
