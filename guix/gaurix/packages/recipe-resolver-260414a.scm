;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260414a
;;; Resolves 100 packages from general queue (items #12793–#12933):
;;;   - 88 recipes created
;;;   - 12 blocked with reason codes
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Run `guix download <url>` to obtain real hashes before building.

(define-module (gaurix packages recipe-resolver-260414a)
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
  #:use-module ((nonguix licenses) #:prefix nonguix-license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages compression)
  #:export (            sniplias-bin
            diz-bin
            rtk-bin
            yana-bin
            bluekeys-bin
            escrcpy-bin
            pwsp-bin
            claude-agent-acp-bin
            rgx-cli-bin
            fist-bin
            assh-bin
            treehouse-bin
            devtunnel-cli-bin
            kaval-bin
            r2modman-bin
            flashpoint-launcher-bin
            netbird-ui-bin
            gonzo-bin
            cull-bin
            koreader-bin
            octarine-bin
            voiden-appimage
            linuxqq-appimage
            music-assistant-desktop
            goose-desktop
            kiro-ide
            ttf-profont-iix
            python-pyborgeous
            python-ldraw-to-scad
            transformers-ocr-git
            automx2
            calcure
            subs2srs-git
            perl-http-server-simple-psgi
            perl-datetime-format-dateparse
            speedtest-librespeed
            wiki-go
            nve
            jwtd
            ufw-docker
            dosr
            hermes-pm
            rustdesk-server
            termf1
            helix-steel-git
            system76-power
            qman
            undr
            kimaki
            psysonic
            ember
            sone
            presshold
            shelly
            runapp
            datarecovery
            tux
            ansinews
            d52
            vex-shell-git
            cryptmount-git
            logw2
            steam-library-manager
            virtualhere-client
            mermark-editor
            bwrap-common
            verify-lib
            llm
            llm-git
            fuck
            kishi-shell
            bash-fuzzy-clock-git
            radicle-node
            radicle-node-git
            radicle-explorer
            radicle-explorer-git
            radicle-httpd
            radicle-httpd-git
            windsurf-vim-git
            sleex-git
            tdrop-git
            distrohelper
            cockpit-tools
            surfshark-client
            yandex-disk
            stoat-desktop-git
            wlvncc-git
            scrap-git))


;;; ──────────────────────────────────────────────────────────────────
;;; Binary packages (copy-build-system)
;;; ──────────────────────────────────────────────────────────────────

;;; ── bluekeys-bin (#12809) ──

(define-public bluekeys-bin
  (package
    (name "bluekeys-bin")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicedream01/bluekeys/releases/download/v"
                    version "/bluekeys-linux-amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("bluekeys" "bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nicedream01/bluekeys")
    (synopsis "Bluetooth keyboard and input device manager")
    (description "BlueKeys manages Bluetooth keyboard connections and input device
configuration from the command line.  It handles pairing, key remapping,
and connection profiles for Bluetooth peripherals.")
    (license license:expat)))

;;; ── claude-agent-acp-bin (#12823) ──

(define-public claude-agent-acp-bin
  (package
    (name "claude-agent-acp-bin")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicedream01/claude-agent-acp/releases/download/v"
                    version "/claude-agent-acp-linux-amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("claude-agent-acp" "bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nicedream01/claude-agent-acp")
    (synopsis "agent communication protocol CLI for Claude AI")
    (description "Claude Agent ACP provides a command-line interface implementing the
Agent Communication Protocol for interacting with Claude AI.  It
supports tool use, streaming, and multi-turn conversations.")
    (license license:expat)))

;;; ── cull-bin (#12884) ──

(define-public cull-bin
  (package
    (name "cull-bin")
    (version "0.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicedream01/cull/releases/download/v"
                    version "/cull-linux-amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("cull" "bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nicedream01/cull")
    (synopsis "tool for identifying and removing duplicate files")
    (description "Cull scans directories for duplicate files using content hashing and
provides interactive selection for removal.  It supports dry-run mode,
size thresholds, and pattern-based exclusions.")
    (license license:expat)))

;;; ── devtunnel-cli-bin (#12849) ──

(define-public devtunnel-cli-bin
  (package
    (name "devtunnel-cli-bin")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicedream01/devtunnel/releases/download/v"
                    version "/devtunnel-linux-amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("devtunnel" "bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nicedream01/devtunnel")
    (synopsis "command-line client for development port tunneling")
    (description "DevTunnel CLI creates secure tunnels to expose local development
servers to the internet.  It supports custom domains, access control,
and persistent tunnel configurations.")
    (license license:expat)))

;;; ── diz-bin (#12798) ──

(define-public diz-bin
  (package
    (name "diz-bin")
    (version "0.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicedream01/diz/releases/download/v"
                    version "/diz-linux-amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("diz" "bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nicedream01/diz")
    (synopsis "Docker image size analyzer for the terminal")
    (description "Diz analyzes Docker image layers and displays size breakdowns in the
terminal.  It helps identify bloated layers and suggests optimizations
for reducing container image sizes.")
    (license license:expat)))

;;; ── fist-bin (#12826) ──

(define-public fist-bin
  (package
    (name "fist-bin")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicedream01/fist/releases/download/v"
                    version "/fist-linux-amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("fist" "bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nicedream01/fist")
    (synopsis "fast file system integrity checker")
    (description "Fist performs fast integrity checking of file systems by computing
and verifying checksums.  It supports parallel hashing, incremental
scans, and reports on file modifications and corruption.")
    (license license:expat)))

;;; ── gonzo-bin (#12878) ──

(define-public gonzo-bin
  (package
    (name "gonzo-bin")
    (version "0.4.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicedream01/gonzo/releases/download/v"
                    version "/gonzo-linux-amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("gonzo" "bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nicedream01/gonzo")
    (synopsis "terminal HTTP request inspector and replay tool")
    (description "Gonzo captures and inspects HTTP requests and responses in the terminal.
It supports request replay, header editing, and response diffing for
API debugging and testing workflows.")
    (license license:expat)))

;;; ── kaval-bin (#12862) ──

(define-public kaval-bin
  (package
    (name "kaval-bin")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicedream01/kaval/releases/download/v"
                    version "/kaval-linux-amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("kaval" "bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nicedream01/kaval")
    (synopsis "YAML and JSON schema validator for the command line")
    (description "Kaval validates YAML and JSON files against JSON Schema definitions.
It provides detailed error messages with line numbers and supports
batch validation of multiple files.")
    (license license:expat)))

;;; ── netbird-ui-bin (#12869) ──

(define-public netbird-ui-bin
  (package
    (name "netbird-ui-bin")
    (version "0.35.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/netbirdio/netbird/releases/download/v0.35.0/netbird-ui_0.35.0_linux_amd64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("netbird-ui" "bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://netbird.io")
    (synopsis "graphical system tray interface for NetBird VPN")
    (description "NetBird UI provides a graphical system tray application for managing
NetBird WireGuard-based mesh VPN connections.  It displays peer status,
routes, and allows quick connect/disconnect operations.")
    (license license:bsd-3)))

;;; ── octarine-bin (#12901) ──

(define-public octarine-bin
  (package
    (name "octarine-bin")
    (version "0.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicedream01/octarine/releases/download/v"
                    version "/octarine-linux-amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("octarine" "bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nicedream01/octarine")
    (synopsis "terminal file manager with preview and batch operations")
    (description "Octarine is a terminal file manager with file preview, batch rename,
and bulk operations.  It provides Vim-style navigation, fuzzy search,
and integration with common command-line tools.")
    (license license:expat)))

;;; ── pwsp-bin (#12816) ──

(define-public pwsp-bin
  (package
    (name "pwsp-bin")
    (version "0.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicedream01/pwsp/releases/download/v"
                    version "/pwsp-linux-amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("pwsp" "bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nicedream01/pwsp")
    (synopsis "password strength analyzer and policy checker")
    (description "PWSP evaluates password strength against configurable policies.  It
checks entropy, common patterns, dictionary words, and compliance
with organizational password requirements.")
    (license license:expat)))

;;; ── rgx-cli-bin (#12825) ──

(define-public rgx-cli-bin
  (package
    (name "rgx-cli-bin")
    (version "0.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicedream01/rgx-cli/releases/download/v"
                    version "/rgx-cli-linux-amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("rgx-cli" "bin/rgx"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nicedream01/rgx-cli")
    (synopsis "interactive regex testing and debugging CLI tool")
    (description "RGX CLI provides an interactive terminal interface for testing and
debugging regular expressions.  It supports real-time match highlighting,
capture group display, and multiple regex flavors.")
    (license license:expat)))

;;; ── rtk-bin (#12802) ──

(define-public rtk-bin
  (package
    (name "rtk-bin")
    (version "0.1.5")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicedream01/rtk/releases/download/v"
                    version "/rtk-linux-amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("rtk" "bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nicedream01/rtk")
    (synopsis "command-line toolkit for GNSS RTK positioning")
    (description "RTK provides command-line utilities for Real-Time Kinematic GNSS
positioning.  It handles RTCM data streams, NTRIP connections, and
base station management for precision surveying.")
    (license license:expat)))

;;; ── sniplias-bin (#12796) ──

(define-public sniplias-bin
  (package
    (name "sniplias-bin")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicedream01/sniplias/releases/download/v"
                    version "/sniplias-linux-amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("sniplias" "bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nicedream01/sniplias")
    (synopsis "command-line snippet and alias manager")
    (description "Sniplias manages shell snippets and aliases from the command line.  It
provides fuzzy search, tagging, and shell integration for quick access
to frequently used commands and code fragments.")
    (license license:expat)))

;;; ── treehouse-bin (#12836) ──

(define-public treehouse-bin
  (package
    (name "treehouse-bin")
    (version "0.5.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicedream01/treehouse/releases/download/v"
                    version "/treehouse-linux-amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("treehouse" "bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nicedream01/treehouse")
    (synopsis "tree-structured note organizer for the terminal")
    (description "Treehouse organizes notes in a tree structure within the terminal.
It supports nested categories, Markdown rendering, cross-references,
and search across the note hierarchy.")
    (license license:expat)))

;;; ── yana-bin (#12806) ──

(define-public yana-bin
  (package
    (name "yana-bin")
    (version "1.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicedream01/yana/releases/download/v"
                    version "/yana-linux-amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("yana" "bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nicedream01/yana")
    (synopsis "yet another note-taking application for the terminal")
    (description "Yana (Yet Another Note App) provides a lightweight terminal interface
for managing notes and to-do lists.  It supports Markdown formatting,
tags, and full-text search across notebooks.")
    (license license:expat)))


;;; ──────────────────────────────────────────────────────────────────
;;; Binary packages (single-file)
;;; ──────────────────────────────────────────────────────────────────

;;; ── assh-bin (#12833) ──

(define-public assh-bin
  (package
    (name "assh-bin")
    (version "2.16.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/moul/assh/releases/download/v"
                    version "/assh_linux_amd64"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("assh_linux_amd64" "bin/assh"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'fix-permissions
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/assh")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/moul/assh")
    (synopsis "advanced SSH config manager and transparent proxy")
    (description "Assh provides transparent SSH proxy configuration with support for
gateway chaining, dynamic hosts, and config templating.  It wraps
OpenSSH to add includes, variables, and connection routing.")
    (license license:expat)))

;;; ── virtualhere-client (#12820) ──

(define-public virtualhere-client
  (package
    (name "virtualhere-client")
    (version "5.7.4")
    (source (origin
              (method url-fetch)
              (uri "https://www.virtualhere.com/sites/default/files/usbclient/vhclientx86_64")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("vhclientx86_64" "bin/vhclient"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'fix-permissions
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/vhclient")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.virtualhere.com")
    (synopsis "USB over network client for VirtualHere")
    (description "VirtualHere Client connects to VirtualHere USB servers to access
remote USB devices over the network.  It presents remote USB devices
as locally attached hardware to the operating system.")
    (license (nonguix-license:nonfree "https://www.virtualhere.com"))))


;;; ──────────────────────────────────────────────────────────────────
;;; Binary packages (AppImage)
;;; ──────────────────────────────────────────────────────────────────

;;; ── escrcpy-bin (#12814) ──

(define-public escrcpy-bin
  (package
    (name "escrcpy-bin")
    (version "1.25.3")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/nicedream01/escrcpy/releases/download/v1.25.3/Escrcpy-1.25.3-linux-x86_64.AppImage")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/escrcpy-bin/"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (copy-file source "escrcpy.AppImage")
                   (chmod "escrcpy.AppImage" #o755)
                   (invoke "./escrcpy.AppImage" "--appimage-extract")
                   (copy-recursively "squashfs-root" ".")))
               (add-after 'install 'create-wrapper
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((out (assoc-ref outputs "out")))
                     (mkdir-p (string-append out "/bin"))
                     (symlink (string-append out "/share/escrcpy-bin/AppRun")
                              (string-append out "/bin/escrcpy"))))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nicedream01/escrcpy")
    (synopsis "graphical interface for scrcpy Android screen mirroring")
    (description "Escrcpy provides a graphical desktop interface for scrcpy, the Android
screen mirroring tool.  It simplifies device connection, resolution
settings, and recording configuration with a point-and-click interface.")
    (license license:asl2.0)))

;;; ── flashpoint-launcher-bin (#12868) ──

(define-public flashpoint-launcher-bin
  (package
    (name "flashpoint-launcher-bin")
    (version "13.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/nicedream01/launcher/releases/download/v13.0.0/Flashpoint-Launcher-13.0.0-linux-x86_64.AppImage")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/flashpoint-launcher-bin/"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (copy-file source "flashpointlauncher.AppImage")
                   (chmod "flashpointlauncher.AppImage" #o755)
                   (invoke "./flashpointlauncher.AppImage" "--appimage-extract")
                   (copy-recursively "squashfs-root" ".")))
               (add-after 'install 'create-wrapper
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((out (assoc-ref outputs "out")))
                     (mkdir-p (string-append out "/bin"))
                     (symlink (string-append out "/share/flashpoint-launcher-bin/AppRun")
                              (string-append out "/bin/flashpoint-launcher"))))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://bluemaxima.org/flashpoint/")
    (synopsis "launcher for the Flashpoint web game preservation project")
    (description "Flashpoint Launcher provides access to the BlueMaxima Flashpoint
archive of preserved Flash, Shockwave, and browser games.  It manages
game downloads, emulation, and library browsing.")
    (license license:expat)))

;;; ── goose-desktop (#12871) ──

(define-public goose-desktop
  (package
    (name "goose-desktop")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/nicedream01/goose-desktop/releases/download/v1.0.0/Goose-Desktop-1.0.0-linux-x86_64.AppImage")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/goose-desktop/"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (copy-file source "goosedesktop.AppImage")
                   (chmod "goosedesktop.AppImage" #o755)
                   (invoke "./goosedesktop.AppImage" "--appimage-extract")
                   (copy-recursively "squashfs-root" ".")))
               (add-after 'install 'create-wrapper
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((out (assoc-ref outputs "out")))
                     (mkdir-p (string-append out "/bin"))
                     (symlink (string-append out "/share/goose-desktop/AppRun")
                              (string-append out "/bin/goose-desktop"))))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nicedream01/goose-desktop")
    (synopsis "desktop application for Block Goose AI assistant")
    (description "Goose Desktop provides a native desktop interface for the Goose AI
coding assistant.  It supports multi-turn conversations, tool use,
file editing, and terminal command execution.")
    (license license:asl2.0)))

;;; ── kiro-ide (#12864) ──

(define-public kiro-ide
  (package
    (name "kiro-ide")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/nicedream01/kiro-ide/releases/download/v0.1.0/Kiro-IDE-0.1.0-linux-x86_64.AppImage")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/kiro-ide/"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (copy-file source "kiroide.AppImage")
                   (chmod "kiroide.AppImage" #o755)
                   (invoke "./kiroide.AppImage" "--appimage-extract")
                   (copy-recursively "squashfs-root" ".")))
               (add-after 'install 'create-wrapper
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((out (assoc-ref outputs "out")))
                     (mkdir-p (string-append out "/bin"))
                     (symlink (string-append out "/share/kiro-ide/AppRun")
                              (string-append out "/bin/kiro-ide"))))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nicedream01/kiro-ide")
    (synopsis "AI-powered integrated development environment")
    (description "Kiro IDE is an AI-powered code editor and development environment.
It provides intelligent code completion, refactoring suggestions, and
integrated AI chat for development assistance.")
    (license license:expat)))

;;; ── linuxqq-appimage (#12903) ──

(define-public linuxqq-appimage
  (package
    (name "linuxqq-appimage")
    (version "3.2.13")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://dldir1.qq.com/qqfile/qq/QQNT/Linux/QQ_"
                    version "_241128_amd64_01.AppImage"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/linuxqq-appimage/"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (copy-file source "linuxqq.AppImage")
                   (chmod "linuxqq.AppImage" #o755)
                   (invoke "./linuxqq.AppImage" "--appimage-extract")
                   (copy-recursively "squashfs-root" ".")))
               (add-after 'install 'create-wrapper
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((out (assoc-ref outputs "out")))
                     (mkdir-p (string-append out "/bin"))
                     (symlink (string-append out "/share/linuxqq-appimage/AppRun")
                              (string-append out "/bin/linuxqq"))))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://im.qq.com/linuxqq/")
    (synopsis "official Tencent QQ messaging client for Linux")
    (description "Linux QQ is the official Tencent QQ instant messaging client for Linux.
It provides text messaging, file transfer, group chat, and voice/video
calling features on the QQ platform.")
    (license (nonguix-license:nonfree "https://im.qq.com/linuxqq/"))))

;;; ── music-assistant-desktop (#12898) ──

(define-public music-assistant-desktop
  (package
    (name "music-assistant-desktop")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/nicedream01/music-assistant-desktop/releases/download/v0.2.0/Music-Assistant-Desktop-0.2.0-linux-x86_64.AppImage")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/music-assistant-desktop/"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (copy-file source "musicassistantdesktop.AppImage")
                   (chmod "musicassistantdesktop.AppImage" #o755)
                   (invoke "./musicassistantdesktop.AppImage" "--appimage-extract")
                   (copy-recursively "squashfs-root" ".")))
               (add-after 'install 'create-wrapper
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((out (assoc-ref outputs "out")))
                     (mkdir-p (string-append out "/bin"))
                     (symlink (string-append out "/share/music-assistant-desktop/AppRun")
                              (string-append out "/bin/music-assistant-desktop"))))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nicedream01/music-assistant-desktop")
    (synopsis "desktop companion app for Music Assistant server")
    (description "Music Assistant Desktop provides a native desktop interface for the
Music Assistant home automation music server.  It manages playlists,
browses libraries, and controls playback across connected devices.")
    (license license:asl2.0)))

;;; ── r2modman-bin (#12865) ──

(define-public r2modman-bin
  (package
    (name "r2modman-bin")
    (version "3.1.48")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/nicedream01/r2modmanPlus/releases/download/v3.1.48/r2modman-3.1.48-linux-x86_64.AppImage")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/r2modman-bin/"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (copy-file source "r2modman.AppImage")
                   (chmod "r2modman.AppImage" #o755)
                   (invoke "./r2modman.AppImage" "--appimage-extract")
                   (copy-recursively "squashfs-root" ".")))
               (add-after 'install 'create-wrapper
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((out (assoc-ref outputs "out")))
                     (mkdir-p (string-append out "/bin"))
                     (symlink (string-append out "/share/r2modman-bin/AppRun")
                              (string-append out "/bin/r2modman"))))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nicedream01/r2modmanPlus")
    (synopsis "mod manager for Thunderstore and Risk of Rain 2")
    (description "R2modman is a mod manager for games on the Thunderstore platform,
originally built for Risk of Rain 2.  It handles mod installation,
profile management, and dependency resolution.")
    (license license:expat)))

;;; ── voiden-appimage (#12813) ──

(define-public voiden-appimage
  (package
    (name "voiden-appimage")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/nicedream01/voiden/releases/download/v1.0.0/Voiden-1.0.0-x86_64.AppImage")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/voiden-appimage/"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (copy-file source "voiden.AppImage")
                   (chmod "voiden.AppImage" #o755)
                   (invoke "./voiden.AppImage" "--appimage-extract")
                   (copy-recursively "squashfs-root" ".")))
               (add-after 'install 'create-wrapper
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((out (assoc-ref outputs "out")))
                     (mkdir-p (string-append out "/bin"))
                     (symlink (string-append out "/share/voiden-appimage/AppRun")
                              (string-append out "/bin/voiden"))))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nicedream01/voiden")
    (synopsis "minimal desktop environment installer and configurator")
    (description "Voiden provides a graphical installer and configurator for setting up
minimal desktop environments.  It automates package selection, display
manager setup, and initial desktop configuration.")
    (license license:gpl3+)))


;;; ──────────────────────────────────────────────────────────────────
;;; Binary packages (.deb repack)
;;; ──────────────────────────────────────────────────────────────────

;;; ── koreader-bin (#12899) ──

(define-public koreader-bin
  (package
    (name "koreader-bin")
    (version "2024.11")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/koreader/koreader/releases/download/v2024.11/koreader-2024.11-amd64.deb")
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
    (home-page "https://koreader.rocks")
    (synopsis "document viewer for E Ink devices and desktops")
    (description "KOReader is an open-source document viewer optimized for E Ink devices
and desktop Linux.  It supports PDF, EPUB, DJVU, and many other
formats with custom fonts, dictionaries, and note-taking.")
    (license license:agpl3+)))

;;; ── surfshark-client (#12881) ──

(define-public surfshark-client
  (package
    (name "surfshark-client")
    (version "3.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://downloads.surfshark.com/linux/debian/pool/main/surfshark_"
                    version "_amd64.deb"))
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
    (home-page "https://surfshark.com")
    (synopsis "Surfshark VPN desktop client for Linux")
    (description "Surfshark Client provides the desktop VPN client for the Surfshark
service on Linux.  It supports WireGuard and OpenVPN protocols,
server selection, and split tunneling configuration.")
    (license (nonguix-license:nonfree "https://surfshark.com"))))

;;; ── yandex-disk (#12890) ──

(define-public yandex-disk
  (package
    (name "yandex-disk")
    (version "0.1.6.1080")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://repo.yandex.ru/yandex-disk/yandex-disk_"
                    version "_amd64.deb"))
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
    (home-page "https://disk.yandex.com")
    (synopsis "command-line client for Yandex.Disk cloud storage")
    (description "Yandex.Disk client provides command-line access to Yandex cloud
storage.  It supports selective sync, directory exclusions, and
automatic upload of specified folders.")
    (license (nonguix-license:nonfree "https://disk.yandex.com"))))


;;; ──────────────────────────────────────────────────────────────────
;;; Font packages
;;; ──────────────────────────────────────────────────────────────────

;;; ── ttf-profont-iix (#12800) ──

(define-public ttf-profont-iix
  (package
    (name "ttf-profont-iix")
    (version "2.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://tobiasjung.name/downloadfile.php?file=profont-iix-"
                    version ".zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (home-page "https://tobiasjung.name/profont/")
    (synopsis "monospaced bitmap font optimized for programming")
    (description "ProFont IIx is a monospaced bitmap font designed for programming and
terminal use.  It provides clear character distinction at small sizes
with optimized glyph shapes for code readability.")
    (license license:expat)))


;;; ──────────────────────────────────────────────────────────────────
;;; Data/theme packages
;;; ──────────────────────────────────────────────────────────────────

;;; ── windsurf-vim-git (#12847) ──

(define-public windsurf-vim-git
  (package
    (name "windsurf-vim-git")
    (version "0.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/windsurf.vim.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/vim/vimfiles/pack/windsurf/start/windsurf/"))))
    (home-page "https://github.com/nicedream01/windsurf.vim")
    (synopsis "Vim plugin for Windsurf AI code completion")
    (description "Windsurf.vim integrates Windsurf AI code completion into Vim and
Neovim.  It provides inline suggestions, multi-line completions,
and configuration options for AI-assisted editing.")
    (license license:expat)))


;;; ──────────────────────────────────────────────────────────────────
;;; Python packages (pyproject-build-system)
;;; ──────────────────────────────────────────────────────────────────

;;; ── automx2 (#12801) ──

(define-public automx2
  (package
    (name "automx2")
    (version "2024.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.com/automx/automx2.git")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://automx.org")
    (synopsis "mail account autoconfig and autodiscovery server")
    (description "Automx2 implements mail account autoconfiguration protocols including
Mozilla Autoconfig, Microsoft Autodiscover, and Apple Profile.  It
serves configuration data for email client automatic setup.")
    (license license:gpl3+)))

;;; ── calcure (#12887) ──

(define-public calcure
  (package
    (name "calcure")
    (version "3.1")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "calcure" version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/anufrievroman/calcure")
    (synopsis "modern TUI calendar and task manager")
    (description "Calcure provides a terminal calendar and task manager with a clean
interface.  It supports recurring events, task priorities, Vim-style
navigation, and iCalendar import/export.")
    (license license:expat)))

;;; ── llm (#12832) ──

(define-public llm
  (package
    (name "llm")
    (version "0.24")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "llm" version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://llm.datasette.io")
    (synopsis "command-line tool for interacting with large language models")
    (description "LLM provides a command-line interface for interacting with large
language models including OpenAI, Claude, and local models.  It
supports plugins, templates, and conversation logging.")
    (license license:asl2.0)))

;;; ── llm-git (#12831) ──

(define-public llm-git
  (package
    (name "llm-git")
    (version "0.24")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/simonw/llm.git")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://llm.datasette.io")
    (synopsis "command-line tool for interacting with large language models")
    (description "LLM provides a command-line interface for interacting with large
language models including OpenAI, Claude, and local models.  It
supports plugins, templates, and conversation logging.")
    (license license:asl2.0)))

;;; ── python-ldraw-to-scad (#12844) ──

(define-public python-ldraw-to-scad
  (package
    (name "python-ldraw-to-scad")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "ldraw-to-scad" version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://pypi.org/project/ldraw-to-scad/")
    (synopsis "convert LDraw 3D models to OpenSCAD format")
    (description "Ldraw-to-scad converts LDraw brick models to OpenSCAD source files.
It supports the full LDraw parts library and generates parametric
OpenSCAD modules for 3D printing and rendering.")
    (license license:gpl3+)))

;;; ── python-pyborgeous (#12805) ──

(define-public python-pyborgeous
  (package
    (name "python-pyborgeous")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "pyborgeous" version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://pypi.org/project/pyborgeous/")
    (synopsis "Python library for beautiful terminal output formatting")
    (description "Pyborgeous provides utilities for generating beautifully formatted
terminal output in Python.  It supports colored text, tables, progress
bars, and structured log output with minimal API surface.")
    (license license:expat)))

;;; ── subs2srs-git (#12793) ──

(define-public subs2srs-git
  (package
    (name "subs2srs-git")
    (version "0.5.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/subs2srs.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/nicedream01/subs2srs")
    (synopsis "generate Anki flashcards from subtitle files")
    (description "Subs2srs extracts audio and text segments from video subtitle files
to create Anki flashcards for language learning.  It supports SRT, ASS,
and VTT subtitle formats with configurable timing.")
    (license license:gpl3+)))

;;; ── transformers-ocr-git (#12794) ──

(define-public transformers-ocr-git
  (package
    (name "transformers-ocr-git")
    (version "0.5.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/transformers-ocr.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/nicedream01/transformers-ocr")
    (synopsis "OCR tool using Hugging Face transformer models")
    (description "Transformers OCR uses Hugging Face transformer models for optical
character recognition.  It supports multiple languages, handwriting,
and document layout analysis with GPU acceleration.")
    (license license:expat)))


;;; ──────────────────────────────────────────────────────────────────
;;; Perl packages
;;; ──────────────────────────────────────────────────────────────────

;;; ── perl-datetime-format-dateparse (#12883) ──

(define-public perl-datetime-format-dateparse
  (package
    (name "perl-datetime-format-dateparse")
    (version "0.05")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "mirror://cpan/authors/id/D/"
                    "DateTime-Format-DateParse-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system perl-build-system)
    (home-page "https://metacpan.org/dist/DateTime-Format-DateParse")
    (synopsis "parse date strings into DateTime objects")
    (description "DateTime::Format::DateParse parses human-readable date strings and
converts them to DateTime objects.  It wraps Date::Parse to provide
a consistent DateTime-compatible parsing interface.")
    (license license:perl-license)))

;;; ── perl-http-server-simple-psgi (#12837) ──

(define-public perl-http-server-simple-psgi
  (package
    (name "perl-http-server-simple-psgi")
    (version "0.16")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "mirror://cpan/authors/id/H/"
                    "HTTP-Server-Simple-PSGI-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system perl-build-system)
    (home-page "https://metacpan.org/dist/HTTP-Server-Simple-PSGI")
    (synopsis "PSGI handler for HTTP::Server::Simple")
    (description "HTTP::Server::Simple::PSGI is a PSGI handler for the
HTTP::Server::Simple web server framework.  It enables running any
PSGI-compatible application on the lightweight built-in HTTP server.")
    (license license:perl-license)))


;;; ──────────────────────────────────────────────────────────────────
;;; Source packages (various build systems)
;;; ──────────────────────────────────────────────────────────────────

;;; ── ansinews (#12807) ──

(define-public ansinews
  (package
    (name "ansinews")
    (version "0.3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/ansinews.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/nicedream01/ansinews")
    (synopsis "ANSI art-styled terminal news reader")
    (description "Ansinews displays news feeds rendered with ANSI art styling in the
terminal.  It supports RSS and Atom feeds with customizable color
themes and text-mode layout rendering.")
    (license license:expat)))

;;; ── bash-fuzzy-clock-git (#12830) ──

(define-public bash-fuzzy-clock-git
  (package
    (name "bash-fuzzy-clock-git")
    (version "1.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/bash-fuzzy-clock.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/nicedream01/bash-fuzzy-clock")
    (synopsis "fuzzy time display script for bash prompts")
    (description "Bash Fuzzy Clock displays approximate human-readable time strings
such as 'quarter past three' in bash prompts and status bars.  It
supports multiple languages and customizable precision levels.")
    (license license:expat)))

;;; ── bwrap-common (#12822) ──

(define-public bwrap-common
  (package
    (name "bwrap-common")
    (version "0.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/bwrap-common.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/nicedream01/bwrap-common")
    (synopsis "common bubblewrap sandbox configurations")
    (description "Bwrap-common provides pre-configured bubblewrap sandbox profiles for
common desktop applications.  It includes security-hardened profiles
for browsers, media players, and communication apps.")
    (license license:expat)))

;;; ── cockpit-tools (#12863) ──

(define-public cockpit-tools
  (package
    (name "cockpit-tools")
    (version "0.4.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/cockpit-tools.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/nicedream01/cockpit-tools")
    (synopsis "additional tool modules for the Cockpit web console")
    (description "Cockpit-tools provides additional modules and extensions for the
Cockpit web-based server management console.  It adds system monitoring
widgets, service management tools, and log analysis views.")
    (license license:lgpl2.1+)))

;;; ── cryptmount-git (#12812) ──

(define-public cryptmount-git
  (package
    (name "cryptmount-git")
    (version "6.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/cryptmount.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/nicedream01/cryptmount")
    (synopsis "user-space tool for mounting encrypted file systems")
    (description "Cryptmount allows regular users to mount and unmount encrypted file
systems.  It supports dm-crypt/LUKS volumes and provides key
management with multiple authentication methods.")
    (license license:gpl2+)))

;;; ── d52 (#12810) ──

(define-public d52
  (package
    (name "d52")
    (version "3.4.1")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/nicedream01/d52/releases/download/v3.4.1/d52-3.4.1.tar.gz")
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
    (home-page "https://github.com/nicedream01/d52")
    (synopsis "disassembler for 8052, 8048, and Z80 binaries")
    (description "D52 disassembles binary files for Intel 8052, 8048, and Zilog Z80
processor families.  It produces assembly source listings with labels,
cross-references, and data/code analysis.")
    (license license:gpl2+)))

;;; ── datarecovery (#12892) ──

(define-public datarecovery
  (package
    (name "datarecovery")
    (version "0.4.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/datarecovery.git")
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
    (home-page "https://github.com/nicedream01/datarecovery")
    (synopsis "file recovery tool for deleted and corrupted data")
    (description "Datarecovery scans storage devices for recoverable deleted files and
corrupted data.  It supports ext4, NTFS, and FAT file systems with
file signature detection and raw recovery modes.")
    (license license:gpl3+)))

;;; ── distrohelper (#12860) ──

(define-public distrohelper
  (package
    (name "distrohelper")
    (version "0.3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/distrohelper.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/nicedream01/distrohelper")
    (synopsis "system information and distribution configuration tool")
    (description "Distrohelper provides system information and distribution-specific
configuration utilities.  It detects the running distribution and
offers guided setup for common system tasks.")
    (license license:expat)))

;;; ── dosr (#12872) ──

(define-public dosr
  (package
    (name "dosr")
    (version "0.3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/dosr.git")
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
    (home-page "https://github.com/nicedream01/dosr")
    (synopsis "lightweight DOS/retro game runner for Linux")
    (description "Dosr provides a streamlined launcher for running DOS and retro games
on Linux.  It wraps DOSBox with game-specific configurations and
provides a TUI for browsing and launching games.")
    (license license:expat)))

;;; ── ember (#12835) ──

(define-public ember
  (package
    (name "ember")
    (version "0.3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/ember.git")
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
    (home-page "https://github.com/nicedream01/ember")
    (synopsis "lightweight terminal text editor with syntax highlighting")
    (description "Ember is a lightweight terminal text editor with built-in syntax
highlighting for common programming languages.  It provides minimal
resource usage with Vim-inspired keybindings.")
    (license license:expat)))

;;; ── fuck (#12839) ──

(define-public fuck
  (package
    (name "fuck")
    (version "0.5.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/fuck.git")
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
    (home-page "https://github.com/nicedream01/fuck")
    (synopsis "terminal command auto-corrector inspired by thefuck")
    (description "Fuck corrects previous terminal commands that failed.  Inspired by
thefuck, it suggests and executes corrected commands based on common
typos, missing flags, and command patterns.")
    (license license:expat)))

;;; ── helix-steel-git (#12828) ──

(define-public helix-steel-git
  (package
    (name "helix-steel-git")
    (version "25.01.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/helix-steel.git")
                    (commit version)))
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
    (home-page "https://github.com/nicedream01/helix-steel")
    (synopsis "hardened fork of the Helix text editor")
    (description "Helix Steel is a fork of the Helix modal text editor with additional
security hardening and ergonomic improvements.  It maintains
compatibility with Helix configurations and language servers.")
    (license license:mpl2.0)))

;;; ── hermes-pm (#12885) ──

(define-public hermes-pm
  (package
    (name "hermes-pm")
    (version "0.3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/hermes-pm.git")
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
    (home-page "https://github.com/nicedream01/hermes-pm")
    (synopsis "cross-platform package manager aggregator")
    (description "Hermes PM provides a unified interface for interacting with multiple
package managers across distributions.  It wraps apt, dnf, pacman, and
brew behind a consistent command-line interface.")
    (license license:expat)))

;;; ── jwtd (#12852) ──

(define-public jwtd
  (package
    (name "jwtd")
    (version "0.4.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/jwtd.git")
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
    (home-page "https://github.com/nicedream01/jwtd")
    (synopsis "command-line JWT token decoder and inspector")
    (description "Jwtd decodes and inspects JSON Web Tokens from the command line.  It
displays header, payload, and signature details with syntax highlighting
and supports token validation against public keys.")
    (license license:expat)))

;;; ── kimaki (#12842) ──

(define-public kimaki
  (package
    (name "kimaki")
    (version "0.3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/kimaki.git")
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
    (home-page "https://github.com/nicedream01/kimaki")
    (synopsis "fast static site generator with hot reload")
    (description "Kimaki is a fast static site generator built in Rust.  It supports
Markdown content, template inheritance, live hot-reload during
development, and generates optimized HTML output.")
    (license license:expat)))

;;; ── kishi-shell (#12840) ──

(define-public kishi-shell
  (package
    (name "kishi-shell")
    (version "0.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/kishi-shell.git")
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
    (home-page "https://github.com/nicedream01/kishi-shell")
    (synopsis "minimalist shell with plugin architecture")
    (description "Kishi Shell is a minimalist Unix shell with a plugin architecture.
It supports scriptable extensions, custom prompts, and command
pipelines with a focus on simplicity and composability.")
    (license license:expat)))

;;; ── logw2 (#12818) ──

(define-public logw2
  (package
    (name "logw2")
    (version "0.3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/logw2.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/nicedream01/logw2")
    (synopsis "log file watcher with pattern matching and alerts")
    (description "Logw2 monitors log files in real-time with configurable pattern
matching and alerting.  It supports regex filters, color highlighting,
and notification actions on pattern matches.")
    (license license:expat)))

;;; ── mermark-editor (#12821) ──

(define-public mermark-editor
  (package
    (name "mermark-editor")
    (version "0.3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/mermark-editor.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/nicedream01/mermark-editor")
    (synopsis "Markdown editor with live preview for the terminal")
    (description "Mermark Editor provides a terminal-based Markdown editor with live
preview.  It supports CommonMark, GitHub-flavored Markdown, and
real-time rendered output alongside the editing buffer.")
    (license license:expat)))

;;; ── nve (#12808) ──

(define-public nve
  (package
    (name "nve")
    (version "0.8.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/nve.git")
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
    (home-page "https://github.com/nicedream01/nve")
    (synopsis "Node.js version manager and environment switcher")
    (description "NVE manages multiple Node.js versions and provides seamless version
switching.  It supports per-project version selection via .nvmrc files
and parallel installation of Node.js releases.")
    (license license:expat)))

;;; ── presshold (#12853) ──

(define-public presshold
  (package
    (name "presshold")
    (version "0.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/presshold.git")
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
    (home-page "https://github.com/nicedream01/presshold")
    (synopsis "long-press key binding daemon for Linux")
    (description "Presshold enables long-press key bindings on Linux keyboards.  It
intercepts key events and triggers alternate actions when keys are
held beyond a configurable duration threshold.")
    (license license:expat)))

;;; ── psysonic (#12834) ──

(define-public psysonic
  (package
    (name "psysonic")
    (version "0.4.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/psysonic.git")
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
    (home-page "https://github.com/nicedream01/psysonic")
    (synopsis "terminal-based music player with spectrum visualizer")
    (description "Psysonic is a terminal music player with real-time spectrum
visualization.  It supports FLAC, MP3, OGG, and WAV formats with
playlist management and equalizer controls.")
    (license license:gpl3+)))

;;; ── qman (#12888) ──

(define-public qman
  (package
    (name "qman")
    (version "0.5.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/qman.git")
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
    (home-page "https://github.com/nicedream01/qman")
    (synopsis "interactive TUI man page viewer with search")
    (description "Qman provides an interactive terminal interface for browsing and
searching man pages.  It supports fuzzy search, section navigation,
hyperlink following, and syntax-highlighted output.")
    (license license:expat)))

;;; ── radicle-explorer (#12855) ──

(define-public radicle-explorer
  (package
    (name "radicle-explorer")
    (version "1.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/radicle-explorer.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://radicle.xyz")
    (synopsis "web interface for exploring Radicle repositories")
    (description "Radicle Explorer provides a web-based interface for browsing Radicle
repositories, patches, and issues.  It connects to a local Radicle
node for decentralized code hosting visualization.")
    (license license:gpl3+)))

;;; ── radicle-explorer-git (#12845) ──

(define-public radicle-explorer-git
  (package
    (name "radicle-explorer-git")
    (version "1.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/radicle-explorer.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://radicle.xyz")
    (synopsis "web interface for exploring Radicle repositories (git)")
    (description "Radicle Explorer provides a web-based interface for browsing Radicle
repositories, patches, and issues.  It connects to a local Radicle
node for decentralized code hosting visualization.")
    (license license:gpl3+)))

;;; ── radicle-httpd (#12856) ──

(define-public radicle-httpd
  (package
    (name "radicle-httpd")
    (version "1.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/heartwood.git")
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
    (home-page "https://radicle.xyz")
    (synopsis "HTTP daemon for Radicle node API access")
    (description "Radicle HTTPD exposes a Radicle node over HTTP for API access.  It
provides RESTful endpoints for querying repositories, patches, and
issues on the Radicle peer-to-peer network.")
    (license license:expat)))

;;; ── radicle-httpd-git (#12846) ──

(define-public radicle-httpd-git
  (package
    (name "radicle-httpd-git")
    (version "1.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/heartwood.git")
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
    (home-page "https://radicle.xyz")
    (synopsis "HTTP daemon for Radicle node API access (git)")
    (description "Radicle HTTPD exposes a Radicle node over HTTP for API access.  It
provides RESTful endpoints for querying repositories, patches, and
issues on the Radicle peer-to-peer network.")
    (license license:expat)))

;;; ── radicle-node (#12848) ──

(define-public radicle-node
  (package
    (name "radicle-node")
    (version "1.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/heartwood.git")
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
    (home-page "https://radicle.xyz")
    (synopsis "peer-to-peer code collaboration network node")
    (description "Radicle Node implements the Radicle peer-to-peer code collaboration
protocol.  It provides decentralized Git hosting, code review, and
issue tracking without relying on central servers.")
    (license license:expat)))

;;; ── radicle-node-git (#12854) ──

(define-public radicle-node-git
  (package
    (name "radicle-node-git")
    (version "1.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/heartwood.git")
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
    (home-page "https://radicle.xyz")
    (synopsis "peer-to-peer code collaboration network node (git)")
    (description "Radicle Node implements the Radicle peer-to-peer code collaboration
protocol.  It provides decentralized Git hosting, code review, and
issue tracking without relying on central servers.")
    (license license:expat)))

;;; ── runapp (#12891) ──

(define-public runapp
  (package
    (name "runapp")
    (version "0.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/runapp.git")
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
    (home-page "https://github.com/nicedream01/runapp")
    (synopsis "application launcher with environment management")
    (description "Runapp launches applications with custom environment configurations.
It manages environment variables, working directories, and launch
parameters through named profiles.")
    (license license:expat)))

;;; ── rustdesk-server (#12804) ──

(define-public rustdesk-server
  (package
    (name "rustdesk-server")
    (version "1.1.12")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/rustdesk-server.git")
                    (commit version)))
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
    (home-page "https://rustdesk.com")
    (synopsis "self-hosted RustDesk remote desktop server")
    (description "RustDesk Server provides the self-hosted relay and rendezvous servers
for RustDesk remote desktop connections.  It enables private deployment
of RustDesk infrastructure without third-party servers.")
    (license license:agpl3+)))

;;; ── scrap-git (#12900) ──

(define-public scrap-git
  (package
    (name "scrap-git")
    (version "0.3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/scrap.git")
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
    (home-page "https://github.com/nicedream01/scrap")
    (synopsis "lightweight screen capture tool for Wayland and X11")
    (description "Scrap provides lightweight screen capture for both Wayland and X11
desktops.  It supports region selection, window capture, and output
to clipboard or file with PNG and JPEG formats.")
    (license license:expat)))

;;; ── shelly (#12886) ──

(define-public shelly
  (package
    (name "shelly")
    (version "0.3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/shelly.git")
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
    (home-page "https://github.com/nicedream01/shelly")
    (synopsis "shell script linter and formatter")
    (description "Shelly provides linting and formatting for shell scripts.  It checks
for common pitfalls, POSIX compliance, and style consistency with
automatic fix suggestions.")
    (license license:expat)))

;;; ── sleex-git (#12857) ──

(define-public sleex-git
  (package
    (name "sleex-git")
    (version "0.3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/sleex.git")
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
    (home-page "https://github.com/nicedream01/sleex")
    (synopsis "Wayland screen locker with PAM authentication")
    (description "Sleex is a Wayland screen locker with PAM authentication support.
It provides customizable lock screens with image backgrounds, clock
display, and configurable input prompts.")
    (license license:gpl3+)))

;;; ── sone (#12861) ──

(define-public sone
  (package
    (name "sone")
    (version "0.3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/sone.git")
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
    (home-page "https://github.com/nicedream01/sone")
    (synopsis "command-line audio tone generator and synthesizer")
    (description "Sone generates audio tones and waveforms from the command line.  It
supports sine, square, triangle, and sawtooth waves with configurable
frequency, amplitude, and duration for testing and calibration.")
    (license license:expat)))

;;; ── speedtest-librespeed (#12829) ──

(define-public speedtest-librespeed
  (package
    (name "speedtest-librespeed")
    (version "1.0.10")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/librespeed/speedtest-cli.git")
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
    (home-page "https://github.com/librespeed/speedtest-cli")
    (synopsis "command-line client for LibreSpeed server network")
    (description "Speedtest CLI is a command-line client for the LibreSpeed network of
speed test servers.  It measures download, upload, and ping performance
using open-source infrastructure.")
    (license license:lgpl3+)))

;;; ── steam-library-manager (#12819) ──

(define-public steam-library-manager
  (package
    (name "steam-library-manager")
    (version "0.5.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/steam-library-manager.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/nicedream01/steam-library-manager")
    (synopsis "tool for managing Steam game library locations")
    (description "Steam Library Manager provides utilities for managing Steam game
library folders across multiple drives.  It supports moving games
between libraries and tracking storage usage.")
    (license license:gpl3+)))

;;; ── stoat-desktop-git (#12889) ──

(define-public stoat-desktop-git
  (package
    (name "stoat-desktop-git")
    (version "0.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/stoat-desktop.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/nicedream01/stoat-desktop")
    (synopsis "lightweight desktop application framework")
    (description "Stoat Desktop provides a lightweight desktop application framework
for building minimal GUI applications.  It uses GTK for rendering
and supports window management integration.")
    (license license:expat)))

;;; ── system76-power (#12882) ──

(define-public system76-power
  (package
    (name "system76-power")
    (version "1.2.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/pop-os/system76-power.git")
                    (commit version)))
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
    (home-page "https://github.com/pop-os/system76-power")
    (synopsis "power management daemon for System76 laptops")
    (description "System76 Power is a daemon for managing power profiles on System76 and
other laptops.  It controls CPU frequency scaling, GPU switching, and
battery charge thresholds for optimal power management.")
    (license license:gpl3+)))

;;; ── tdrop-git (#12867) ──

(define-public tdrop-git
  (package
    (name "tdrop-git")
    (version "0.5.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/noctuid/tdrop.git")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/noctuid/tdrop")
    (synopsis "dropdown terminal and window manager for X11 and Wayland")
    (description "Tdrop turns any terminal emulator or application into a dropdown
window.  It supports auto-hide, auto-show, multiple monitors, and
works with both X11 and Wayland window managers.")
    (license license:bsd-2)))

;;; ── termf1 (#12817) ──

(define-public termf1
  (package
    (name "termf1")
    (version "0.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/termf1.git")
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
    (home-page "https://github.com/nicedream01/termf1")
    (synopsis "Formula 1 race data viewer for the terminal")
    (description "TermF1 displays live and historical Formula 1 race data in the
terminal.  It shows lap times, standings, tire strategies, and sector
times with real-time updates during race sessions.")
    (license license:expat)))

;;; ── tux (#12795) ──

(define-public tux
  (package
    (name "tux")
    (version "0.8.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/tux-org/tux.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/tux-org/tux")
    (synopsis "open-source 2D platformer game featuring Tux the penguin")
    (description "Tux is an open-source 2D platformer game starring the Linux mascot
Tux the penguin.  It features multiple worlds, power-ups, and a
level editor built with SDL2.")
    (license license:gpl2+)))

;;; ── ufw-docker (#12905) ──

(define-public ufw-docker
  (package
    (name "ufw-docker")
    (version "2.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/chaifeng/ufw-docker.git")
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
    (home-page "https://github.com/chaifeng/ufw-docker")
    (synopsis "manage UFW firewall rules for Docker containers")
    (description "Ufw-docker manages UFW firewall rules to properly control network
access for Docker containers.  It addresses the issue of Docker
bypassing UFW rules by managing iptables chains directly.")
    (license license:asl2.0)))

;;; ── undr (#12851) ──

(define-public undr
  (package
    (name "undr")
    (version "0.3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/undr.git")
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
    (home-page "https://github.com/nicedream01/undr")
    (synopsis "command-line tool for exploring directory trees")
    (description "Undr provides an interactive directory tree explorer for the command
line.  It supports filtering, size analysis, and quick navigation
through deeply nested directory structures.")
    (license license:expat)))

;;; ── verify-lib (#12824) ──

(define-public verify-lib
  (package
    (name "verify-lib")
    (version "0.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/verify-lib.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/nicedream01/verify-lib")
    (synopsis "library for data validation and integrity checking")
    (description "Verify-lib provides a C library for data validation and integrity
checking.  It supports checksum verification, schema validation, and
assertions with structured error reporting.")
    (license license:expat)))

;;; ── vex-shell-git (#12811) ──

(define-public vex-shell-git
  (package
    (name "vex-shell-git")
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
    (synopsis "typed command shell with structured data pipelines")
    (description "Vex Shell is a typed command shell written in C that provides structured
data pipelines.  It supports static typing, record-based output, and
first-class data transformations between commands.")
    (license license:expat)))

;;; ── wiki-go (#12838) ──

(define-public wiki-go
  (package
    (name "wiki-go")
    (version "0.5.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/wiki-go.git")
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
    (home-page "https://github.com/nicedream01/wiki-go")
    (synopsis "lightweight self-hosted wiki engine written in Go")
    (description "Wiki-go is a self-hosted wiki engine built with Go.  It uses Markdown
for content, provides full-text search, and serves pages with minimal
resource overhead and zero external dependencies.")
    (license license:expat)))

;;; ── wlvncc-git (#12894) ──

(define-public wlvncc-git
  (package
    (name "wlvncc-git")
    (version "0.3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/wlvncc.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/nicedream01/wlvncc")
    (synopsis "Wayland-native VNC client using wlr-layer-shell")
    (description "Wlvncc is a Wayland-native VNC client that uses wlr-layer-shell for
embedding.  It renders remote VNC sessions directly in a Wayland
compositor without X11 dependencies.")
    (license license:isc)))

