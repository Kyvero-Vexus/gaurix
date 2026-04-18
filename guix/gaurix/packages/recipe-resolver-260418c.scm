;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260418c
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages.
;;;
;;; New recipes (30):
;;;    1.  dmenu-emoji (copy-build-system, v1.0, MIT)
;;;    2.  xattrvi (copy-build-system, v1.0, GPL-3.0)
;;;    3.  zgen (copy-build-system, v0.1, BSD-2)
;;;    4.  zaread (gnu-build-system, v1.5.0, GPL-3.0)
;;;    5.  wireguard-vanity-keygen (go-build-system, v1.0.1, MIT)
;;;    6.  yubikey-agent (go-build-system, v0.1.6, BSD-3)
;;;    7.  frpc (go-build-system, v0.68.1, Apache-2.0)
;;;    8.  frps (go-build-system, v0.68.1, Apache-2.0)
;;;    9.  goplaying (go-build-system, v0.3.6, MIT)
;;;   10.  lazybeads (go-build-system, v0.1.0, MIT)
;;;   11.  unregistry (go-build-system, v0.4.2, Apache-2.0)
;;;   12.  fan2go (go-build-system, v0.9.2, AGPL-3.0)
;;;   13.  bwlog (cargo-build-system, v0.4.2, MIT)
;;;   14.  mago (cargo-build-system, v1.21.1, MIT/Apache-2.0)
;;;   15.  dotr (cargo-build-system, v1.0.0, MIT)
;;;   16.  portablemc (cargo-build-system, v5.0.3, Apache-2.0)
;;;   17.  vane (cargo-build-system, v0.9.2, MIT)
;;;   18.  rustmission (cargo-build-system, v0.5.1, GPL-3.0+)
;;;   19.  iamb (cargo-build-system, v0.0.11, Apache-2.0)
;;;   20.  vr-lighthouse (cargo-build-system, v1.3.1, MIT)
;;;   21.  ego (cargo-build-system, v1.2.0, MIT)
;;;   22.  mandelbulber2 (cmake-build-system, v2.34, GPL-3.0)
;;;   23.  pineapple-midi-player (cmake-build-system, v2.0.0, MIT)
;;;   24.  suil-optgui (meson-build-system, v0.10.26, ISC)
;;;   25.  addwater (meson-build-system, v1.2.9, GPL-3.0+)
;;;   26.  embellish (meson-build-system, v1.0.0, GPL-3.0+)
;;;   27.  recorder (meson-build-system, v1.0.19, GPL-3.0+)
;;;   28.  virtnbdbackup (python-build-system, v2.46, GPL-3.0)
;;;   29.  brightness-slider (copy-build-system, v1.0, GPL-2.0)
;;;   30.  libreoffice-extension-grammalecte-fr (copy-build-system, v2.3.0, GPL-3.0)
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros) unless noted.
;;; Use `guix download` to obtain real hashes.

(define-module (gaurix packages recipe-resolver-260418c)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system go)
  #:use-module (guix build-system cargo)
  #:use-module (guix build-system python)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system copy)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages xorg)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages audio)
  #:use-module (gnu packages pulseaudio)
  #:use-module (gnu packages image)
  #:use-module (gnu packages maths)
  #:use-module (gnu packages xml)
  #:use-module (gnu packages virtualization)
  #:use-module (gnu packages shells)
  #:use-module (gnu packages security-token)
  #:use-module (gnu packages gnupg)
  #:use-module (gnu packages gstreamer)
  #:use-module (gnu packages gettext)
  #:use-module (gnu packages vala)
  #:use-module (gnu packages music)
  #:use-module (gnu packages libreoffice)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages texinfo)
  #:use-module (gnu packages version-control)
  #:export (
            dmenu-emoji
            xattrvi
            zgen
            zaread
            wireguard-vanity-keygen
            yubikey-agent
            frpc
            frps
            goplaying
            lazybeads
            unregistry
            fan2go
            bwlog
            mago
            dotr
            portablemc
            vane
            rustmission
            iamb
            vr-lighthouse
            ego
            mandelbulber2
            pineapple-midi-player
            suil-optgui
            addwater
            embellish
            recorder
            virtnbdbackup
            brightness-slider
            libreoffice-extension-grammalecte-fr
            ))


;;; ===================================================================
;;; COPY-BUILD-SYSTEM PACKAGES (scripts, themes, prebuilt)
;;; ===================================================================

;;; -------------------------------------------------------------------
;;; 1. dmenu-emoji --- emoji picker via dmenu/rofi
;;; -------------------------------------------------------------------
(define-public dmenu-emoji
  (package
    (name "dmenu-emoji")
    (version "1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/shasherazi/dmenuEmoji")
                    (commit "b4e2787ee7e8f01bd7a0b3e1e3d85bc6b73be635")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("dmenu-emoji" "bin/dmenu-emoji"))))
    (inputs (list python))
    (home-page "https://github.com/shasherazi/dmenuEmoji")
    (synopsis "emoji picker using dmenu, rofi, or bemenu")
    (description "Dmenu-emoji is a small Python script that displays a
searchable list of emojis using dmenu, rofi, or bemenu.  Selecting an
emoji copies it to the clipboard via xclip or wl-copy.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 2. xattrvi --- extended attribute editor
;;; -------------------------------------------------------------------
(define-public xattrvi
  (package
    (name "xattrvi")
    (version "1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/cherti/xattrvi")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("xattrvi" "bin/xattrvi"))))
    (inputs (list python))
    (home-page "https://github.com/cherti/xattrvi")
    (synopsis "editor for filesystem extended attributes")
    (description "Xattrvi is a Python script that opens a temporary file
pre-filled with the extended attributes of a given file, lets you edit
them with @env{EDITOR}, and writes back the changes.  It operates on
user-namespace extended attributes.")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 3. zgen --- lightweight Zsh plugin manager
;;; -------------------------------------------------------------------
(define-public zgen
  (package
    (name "zgen")
    (version "0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/tarjoilija/zgen")
                    (commit "0b669d29022ae2a58aeba0e6d7bef5b55b81e07e")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("zgen.zsh" "share/zsh/plugins/zgen/zgen.zsh")
               ("_zgen" "share/zsh/site-functions/_zgen"))))
    (inputs (list zsh))
    (home-page "https://github.com/tarjoilija/zgen")
    (synopsis "lightweight plugin manager for Zsh")
    (description "Zgen is a lightweight plugin manager for Zsh, inspired
by Antigen.  It loads oh-my-zsh compatible plugins and themes, generates
a static init script for fast shell startup, and supports lazy loading.
Plugins are sourced from Git repositories.")
    (license license:bsd-2)))

;;; -------------------------------------------------------------------
;;; 29. brightness-slider --- tray brightness control for external monitors
;;; -------------------------------------------------------------------
(define-public brightness-slider
  (package
    (name "brightness-slider")
    (version "1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/stefonarch/brightness-slider")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("brightness-slider.py" "bin/brightness-slider"))))
    (inputs (list python))
    (home-page "https://github.com/stefonarch/brightness-slider")
    (synopsis "brightness slider tray app for external monitors")
    (description "Brightness-slider is a simple Python/PyQt6 tray
application for controlling external monitor brightness via DDC/CI
using ddcutil.  It provides a slider widget in the system tray.")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 30. libreoffice-extension-grammalecte-fr --- French grammar checker
;;; -------------------------------------------------------------------
(define-public libreoffice-extension-grammalecte-fr
  (package
    (name "libreoffice-extension-grammalecte-fr")
    (version "2.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://grammalecte.net/oxt/Grammalecte-fr-v"
                    version ".oxt"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "lib/libreoffice/share/extensions/grammalecte-fr"))))
    (home-page "https://grammalecte.net/")
    (synopsis "French grammar and typography checker for LibreOffice")
    (description "Grammalecte is a grammar and typography checker for the
French language, distributed as a LibreOffice extension.  It detects
grammatical errors, typographic issues, and style problems in French
text within LibreOffice Writer.")
    (license license:gpl3)))


;;; ===================================================================
;;; GNU-BUILD-SYSTEM PACKAGES (configure/make)
;;; ===================================================================

;;; -------------------------------------------------------------------
;;; 4. zaread --- lightweight ebook and Office reader
;;; -------------------------------------------------------------------
(define-public zaread
  (package
    (name "zaread")
    (version "1.5.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/paoloap/zaread")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "PREFIX=" #$output))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (inputs (list bash))
    (home-page "https://github.com/paoloap/zaread")
    (synopsis "lightweight ebook and Office document reader")
    (description "Zaread is a shell script that converts ebooks and
Office documents to PDF on the fly and displays them using Zathura
or another PDF viewer.  It supports EPUB, MOBI, DOCX, XLSX, PPTX,
ODT, ODS, ODP, Markdown, and Typst formats.")
    (license license:gpl3)))


;;; ===================================================================
;;; GO-BUILD-SYSTEM PACKAGES
;;; ===================================================================

;;; -------------------------------------------------------------------
;;; 5. wireguard-vanity-keygen --- WireGuard vanity key generator
;;; -------------------------------------------------------------------
(define-public wireguard-vanity-keygen
  (package
    (name "wireguard-vanity-keygen")
    (version "1.0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/axllent/wireguard-vanity-keygen")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/axllent/wireguard-vanity-keygen"
           #:tests? #f))
    (home-page "https://github.com/axllent/wireguard-vanity-keygen")
    (synopsis "generate WireGuard keypairs with custom prefixes")
    (description "Wireguard-vanity-keygen generates WireGuard keypairs
where the public key starts with a user-specified prefix or matches a
regular expression.  It supports multi-core parallel generation for
fast key discovery.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 6. yubikey-agent --- SSH agent for YubiKeys
;;; -------------------------------------------------------------------
(define-public yubikey-agent
  (package
    (name "yubikey-agent")
    (version "0.1.6")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/FiloSottile/yubikey-agent")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "filippo.io/yubikey-agent"
           #:tests? #f))
    (inputs (list pcsc-lite pinentry))
    (home-page "https://filippo.io/yubikey-agent")
    (synopsis "seamless SSH agent for YubiKeys")
    (description "Yubikey-agent is an SSH agent that uses a YubiKey as
the private key store.  Keys are generated on the YubiKey itself, the
PIN is requested once per session via pinentry, and each SSH operation
requires a physical touch on the YubiKey.")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; 7. frpc --- fast reverse proxy client
;;; -------------------------------------------------------------------
(define-public frpc
  (package
    (name "frpc")
    (version "0.68.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/fatedier/frp")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/fatedier/frp/cmd/frpc"
           #:unpack-path "github.com/fatedier/frp"
           #:tests? #f))
    (home-page "https://github.com/fatedier/frp")
    (synopsis "fast reverse proxy client for NAT traversal")
    (description "Frpc is the client component of frp, a fast reverse
proxy that helps expose local servers behind a NAT or firewall to the
Internet.  It supports TCP, UDP, HTTP, and HTTPS tunneling with
features like encryption, compression, and load balancing.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 8. frps --- fast reverse proxy server
;;; -------------------------------------------------------------------
(define-public frps
  (package
    (name "frps")
    (version "0.68.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/fatedier/frp")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/fatedier/frp/cmd/frps"
           #:unpack-path "github.com/fatedier/frp"
           #:tests? #f))
    (home-page "https://github.com/fatedier/frp")
    (synopsis "fast reverse proxy server for NAT traversal")
    (description "Frps is the server component of frp, a fast reverse
proxy that helps expose local servers behind a NAT or firewall to the
Internet.  It supports TCP, UDP, HTTP, and HTTPS tunneling with
features like encryption, compression, and load balancing.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 9. goplaying --- Now Playing TUI
;;; -------------------------------------------------------------------
(define-public goplaying
  (package
    (name "goplaying")
    (version "0.3.6")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/justinmdickey/goplaying")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/justinmdickey/goplaying"
           #:tests? #f))
    (home-page "https://github.com/justinmdickey/goplaying")
    (synopsis "now-playing TUI with album artwork in the terminal")
    (description "Goplaying is a terminal user interface that displays
the currently playing song with album artwork rendered directly in the
terminal using auto-extracted colors.  It integrates with MPRIS-compatible
media players via playerctl.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 10. lazybeads --- TUI for beads issue tracking
;;; -------------------------------------------------------------------
(define-public lazybeads
  (package
    (name "lazybeads")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/codegangsta/lazybeads")
                    (commit "c8d1bfe7fa61e8d75b56ce0476c3c3a5b4f3f283")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/codegangsta/lazybeads"
           #:tests? #f))
    (home-page "https://github.com/codegangsta/lazybeads")
    (synopsis "terminal UI for managing beads issues")
    (description "Lazybeads is a terminal user interface for managing
beads issues, inspired by LazyGit.  It provides a keyboard-driven
interface for browsing, creating, and updating issues in beads-based
project management.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 11. unregistry --- push Docker images without a registry
;;; -------------------------------------------------------------------
(define-public unregistry
  (package
    (name "unregistry")
    (version "0.4.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/psviderski/unregistry")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/psviderski/unregistry"
           #:tests? #f))
    (home-page "https://github.com/psviderski/unregistry")
    (synopsis "push Docker images directly to remote servers")
    (description "Unregistry pushes Docker images directly to remote
servers without needing an external container registry.  It streams
image layers over SSH, avoiding the overhead of setting up and
maintaining a private registry.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 12. fan2go --- dynamic fan speed control daemon
;;; -------------------------------------------------------------------
(define-public fan2go
  (package
    (name "fan2go")
    (version "0.9.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/markusressel/fan2go")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/markusressel/fan2go"
           #:tests? #f))
    (inputs (list lm-sensors))
    (home-page "https://github.com/markusressel/fan2go")
    (synopsis "dynamic fan speed control daemon based on temperature sensors")
    (description "Fan2go is a daemon for dynamic fan speed control on
Linux.  It reads temperature sensors via lm_sensors and adjusts fan
speeds according to configurable curves.  It supports multiple fans
and sensors with independent control profiles.")
    (license license:agpl3)))


;;; ===================================================================
;;; CARGO-BUILD-SYSTEM PACKAGES (Rust)
;;; ===================================================================

;;; -------------------------------------------------------------------
;;; 13. bwlog --- network bandwidth logger
;;; -------------------------------------------------------------------
(define-public bwlog
  (package
    (name "bwlog")
    (version "0.4.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.kit.edu/kit/tm/telematics/congestion-control/logging/bwlog")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f
           #:install-source? #f))
    (home-page "https://gitlab.kit.edu/kit/tm/telematics/congestion-control/logging/bwlog")
    (synopsis "lightweight network bandwidth and CPU usage logger")
    (description "Bwlog is a minimal logger for network throughput, CPU
utilization, and interrupt rates.  It outputs data in Parquet format
for efficient analysis and integrates with network research workflows.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 14. mago --- PHP linter and formatter
;;; -------------------------------------------------------------------
(define-public mago
  (package
    (name "mago")
    (version "1.21.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/carthage-software/mago")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f
           #:install-source? #f))
    (home-page "https://github.com/carthage-software/mago")
    (synopsis "fast PHP linter, formatter, and static analyzer")
    (description "Mago is a comprehensive PHP tooling suite written in
Rust.  It provides a fast linter, formatter, and static analyzer with
a unified CLI.  Mago is designed for speed and correctness, inspired
by Rust's approach to developer tooling.")
    (license (list license:expat license:asl2.0))))

;;; -------------------------------------------------------------------
;;; 15. dotr --- dotfiles manager
;;; -------------------------------------------------------------------
(define-public dotr
  (package
    (name "dotr")
    (version "1.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/uroybd/DotR")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f
           #:install-source? #f))
    (home-page "https://github.com/uroybd/DotR")
    (synopsis "simple dotfiles manager written in Rust")
    (description "DotR is a dotfiles manager that creates symlinks from
a centralized dotfiles directory to their expected locations.  It
supports profiles, templating, and dry-run mode for previewing changes
before applying them.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 16. portablemc --- cross-platform Minecraft launcher
;;; -------------------------------------------------------------------
(define-public portablemc
  (package
    (name "portablemc")
    (version "5.0.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/theorzr/portablemc")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f
           #:install-source? #f))
    (inputs (list openssl))
    (home-page "https://github.com/theorzr/portablemc")
    (synopsis "cross-platform CLI Minecraft launcher")
    (description "PortableMC is a cross-platform command-line utility
for launching Minecraft quickly and reliably.  It supports Mojang
versions and popular mod loaders including Fabric, Forge, and NeoForge,
without requiring the official launcher.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 17. vane --- multi-layer routing reverse proxy
;;; -------------------------------------------------------------------
(define-public vane
  (package
    (name "vane")
    (version "0.9.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/canmi21/vane")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f
           #:install-source? #f))
    (home-page "https://github.com/canmi21/vane")
    (synopsis "flow-based reverse proxy with multi-layer routing")
    (description "Vane is a reverse proxy engine with multi-layer routing
and programmable pipelines.  It supports TCP forwarding, TLS termination,
HTTP routing, and configurable middleware chains for flexible traffic
management.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 18. rustmission --- TUI for Transmission torrent client
;;; -------------------------------------------------------------------
(define-public rustmission
  (package
    (name "rustmission")
    (version "0.5.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/intuis/rustmission")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f
           #:install-source? #f))
    (home-page "https://github.com/intuis/rustmission")
    (synopsis "performant TUI client for Transmission")
    (description "Rustmission is a terminal user interface for the
Transmission BitTorrent client.  It provides a fast, keyboard-driven
interface capable of managing hundreds of torrents with real-time
status updates, sorting, and filtering.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 19. iamb --- Matrix client for Vim users
;;; -------------------------------------------------------------------
(define-public iamb
  (package
    (name "iamb")
    (version "0.0.11")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ulyssa/iamb")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f
           #:install-source? #f))
    (inputs (list openssl))
    (home-page "https://github.com/ulyssa/iamb")
    (synopsis "Matrix chat client with Vim-style keybindings")
    (description "Iamb is a Matrix chat client for the terminal with
Vim-style keybindings and modal editing.  It supports end-to-end
encryption, multiple rooms, threads, reactions, file uploads, and
read receipts through a keyboard-driven interface.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 20. vr-lighthouse --- VR Lighthouse power management
;;; -------------------------------------------------------------------
(define-public vr-lighthouse
  (package
    (name "vr-lighthouse")
    (version "1.3.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ShayBox/lighthouse")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f
           #:install-source? #f))
    (home-page "https://github.com/ShayBox/lighthouse")
    (synopsis "VR Lighthouse base station power state management")
    (description "Lighthouse is a command-line tool for managing the
power state of SteamVR Lighthouse base stations via Bluetooth.  It can
turn base stations on, off, or into standby mode, supporting both V1
and V2 Lighthouse hardware.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 21. ego --- run desktop apps as different local user
;;; -------------------------------------------------------------------
(define-public ego
  (package
    (name "ego")
    (version "1.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/intgr/ego")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f
           #:install-source? #f))
    (inputs (list acl libxcb))
    (home-page "https://github.com/intgr/ego")
    (synopsis "run Linux desktop applications under a different local user")
    (description "Ego (Alter Ego) runs Linux desktop applications under
a different local user account for isolation.  It handles X11/Wayland
display access, PulseAudio/PipeWire forwarding, and D-Bus proxying
so that graphical applications work seamlessly under the alternate user.")
    (license license:expat)))


;;; ===================================================================
;;; CMAKE-BUILD-SYSTEM PACKAGES
;;; ===================================================================

;;; -------------------------------------------------------------------
;;; 22. mandelbulber2 --- 3D fractal renderer
;;; -------------------------------------------------------------------
(define-public mandelbulber2
  (package
    (name "mandelbulber2")
    (version "2.34")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/buddhi1980/mandelbulber2")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list (string-append "-DCMAKE_INSTALL_PREFIX=" #$output))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'unpack 'enter-source-dir
                 (lambda _
                   (chdir "mandelbulber2"))))))
    (inputs (list qtbase-5
                  qtmultimedia-5
                  libpng
                  libjpeg-turbo
                  gsl
                  lzo))
    (native-inputs (list pkg-config))
    (home-page "https://github.com/buddhi1980/mandelbulber2")
    (synopsis "3D fractal renderer for Mandelbulb and other fractals")
    (description "Mandelbulber2 is a 3D fractal rendering application
that generates images of the Mandelbulb, Mandelbox, and many other 3D
fractals.  It supports ray marching, multiple lighting models, ambient
occlusion, volumetric rendering, animation, and OpenCL acceleration.")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 23. pineapple-midi-player --- SoundFont MIDI player
;;; -------------------------------------------------------------------
(define-public pineapple-midi-player
  (package
    (name "pineapple-midi-player")
    (version "2.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/BLumia/pineapple-midi-player")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (inputs (list qtbase
                  qtsvg
                  portaudio))
    (native-inputs (list pkg-config))
    (home-page "https://github.com/BLumia/pineapple-midi-player")
    (synopsis "simple SoundFont MIDI file player")
    (description "Pineapple MIDI Player is a simple MIDI file player
that uses SoundFont files for audio synthesis.  It provides a clean
Qt-based interface for loading MIDI files and SoundFont banks, with
playback controls and real-time visualization.")
    (license license:expat)))


;;; ===================================================================
;;; MESON-BUILD-SYSTEM PACKAGES
;;; ===================================================================

;;; -------------------------------------------------------------------
;;; 24. suil-optgui --- LV2 plugin UI loading library
;;; -------------------------------------------------------------------
(define-public suil-optgui
  (package
    (name "suil-optgui")
    (version "0.10.26")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.com/lv2/suil")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))
    (inputs (list lv2
                  gtk+
                  qtbase))
    (native-inputs (list pkg-config))
    (home-page "https://gitlab.com/lv2/suil")
    (synopsis "lightweight LV2 plugin UI loading and wrapping library")
    (description "Suil is a lightweight C library for loading and wrapping
LV2 plugin UIs.  It supports embedding plugin UIs written with different
toolkits (GTK, Qt, X11) into host applications, handling the necessary
toolkit interoperability and event loop integration.")
    (license license:isc)))

;;; -------------------------------------------------------------------
;;; 25. addwater --- Firefox GNOME theme installer
;;; -------------------------------------------------------------------
(define-public addwater
  (package
    (name "addwater")
    (version "1.2.9")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/largestgithubuseronearth/addwater")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:glib-or-gtk? #t
           #:tests? #f))
    (inputs (list gtk
                  libadwaita
                  python
                  python-pygobject))
    (native-inputs (list pkg-config
                         gettext-minimal
                         glib
                         desktop-file-utils))
    (home-page "https://github.com/largestgithubuseronearth/addwater")
    (synopsis "installer for the Firefox GNOME theme")
    (description "Addwater is a GTK4/libadwaita application that installs
the firefox-gnome-theme into Firefox profiles.  It provides a graphical
interface for selecting theme options and applying them to one or more
Firefox profiles for a native GNOME look and feel.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 26. embellish --- Nerd Font installer
;;; -------------------------------------------------------------------
(define-public embellish
  (package
    (name "embellish")
    (version "1.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/getnf/embellish")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:glib-or-gtk? #t
           #:tests? #f))
    (inputs (list gtk
                  libadwaita
                  json-glib
                  libsoup
                  vala))
    (native-inputs (list pkg-config
                         gettext-minimal
                         glib
                         vala
                         desktop-file-utils))
    (home-page "https://github.com/getnf/embellish")
    (synopsis "graphical Nerd Font installer for Linux")
    (description "Embellish is a GTK4/libadwaita application for browsing,
previewing, and installing Nerd Fonts on Linux.  It downloads patched
fonts from the Nerd Fonts project and installs them to the user's font
directory.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 27. recorder --- simple audio recorder
;;; -------------------------------------------------------------------
(define-public recorder
  (package
    (name "recorder")
    (version "1.0.19")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/alexkdeveloper/recorder")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:glib-or-gtk? #t
           #:tests? #f))
    (inputs (list gtk
                  libadwaita
                  gstreamer
                  gst-plugins-base
                  pulseaudio))
    (native-inputs (list pkg-config
                         gettext-minimal
                         glib
                         vala
                         desktop-file-utils))
    (home-page "https://github.com/alexkdeveloper/recorder")
    (synopsis "simple audio recorder for GNOME")
    (description "Recorder is a simple audio recording application built
with GTK4 and libadwaita.  It records audio from the microphone or
system output using GStreamer and PulseAudio, saving to common audio
formats.")
    (license license:gpl3+)))


;;; ===================================================================
;;; PYTHON-BUILD-SYSTEM PACKAGES
;;; ===================================================================

;;; -------------------------------------------------------------------
;;; 28. virtnbdbackup --- libvirt/qemu backup utility
;;; -------------------------------------------------------------------
(define-public virtnbdbackup
  (package
    (name "virtnbdbackup")
    (version "2.46")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/abbbi/virtnbdbackup")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system python-build-system)
    (arguments
     (list #:tests? #f))
    (inputs (list python-lxml
                  python-tqdm
                  python-lz4
                  python-paramiko
                  libvirt))
    (native-inputs (list python-setuptools
                         python-wheel))
    (home-page "https://github.com/abbbi/virtnbdbackup")
    (synopsis "backup utility for libvirt, QEMU, and KVM virtual machines")
    (description "Virtnbdbackup is a backup tool for libvirt/QEMU/KVM
virtual machines using the NBD (Network Block Device) protocol.  It
supports full and incremental backups, differential snapshots, and
instant VM recovery via a virtual NBD device.")
    (license license:gpl3)))
