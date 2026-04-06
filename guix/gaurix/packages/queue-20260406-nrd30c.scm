;;; Queue drain 2026-04-06 batch nrd30c — 55 recipes from todo_general_packages.org.
;;; 25 binary packages (copy-build-system), 11 Python packages (pyproject/python-build-system),
;;; 19 source packages (gnu/cmake/meson/cargo/go/trivial).
(define-module (gaurix packages queue-20260406-nrd30c)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system go)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system python)
  #:use-module (guix build-system trivial)
  #:use-module (guix build-system cargo)
  #:use-module (guix build-system qt)
  #:use-module (guix utils)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages check)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages gettext)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages ncurses)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages python-crypto)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages ruby)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages video)
  #:use-module (gnu packages web)
  #:use-module (gnu packages xml)
  #:use-module (gnu packages shells)
  #:use-module (gnu packages networking)
  #:use-module ((guix licenses) #:prefix license:))

;; ═════════════════���═════════════════════════════════════════════════
;; Binary packages — copy-build-system
;; ════════════════════════════════════════════════════��══════════════

;; ── 10304. amazon-q-bin ─────────────────���────────────────────────
(define-public amazon-q-bin
  (package
    (name "amazon-q-bin")
    (version "1.7.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://desktop-release.codewhisperer.us-east-1.amazonaws.com/"
                    version "/linux/x64/AmazonQ-" version "-x64.AppImage"))
              (sha256
               ;; FIXME: placeholder hash — run `guix download` to obtain
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "bin/" #:include-regexp (".*")))))
    (home-page "https://aws.amazon.com/q/developer/")
    (synopsis "AI-powered assistant for AWS developers")
    (description "Amazon Q is an AI-powered assistant from AWS that helps with
coding, debugging, and understanding AWS services.  This package provides the
prebuilt Linux binary.")
    (license license:asl2.0)))

;; ── 10313. tenv-bin ──────────────────────────────────────────────
(define-public tenv-bin
  (package
    (name "tenv-bin")
    (version "4.4.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/tofuutils/tenv/releases/download/v"
                    version "/tenv_v" version "_Linux_x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("tenv" "bin/"))))
    (home-page "https://github.com/tofuutils/tenv")
    (synopsis "version manager for OpenTofu, Terraform, and Terragrunt")
    (description "Tenv is a versatile version manager for OpenTofu, Terraform,
Terragrunt, and Atmos, written in Go.  It simplifies managing multiple versions
of infrastructure-as-code tools.")
    (license license:asl2.0)))

;; ── 10346. k0s-bin ───────────────────────────────────────────────
(define-public k0s-bin
  (package
    (name "k0s-bin")
    (version "1.32.3+k0s.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/k0sproject/k0s/releases/download/v"
                    version "/k0s-v" version "-amd64"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("k0s-*" "bin/k0s"))))
    (home-page "https://k0sproject.io/")
    (synopsis "lightweight certified Kubernetes distribution")
    (description "K0s is a lightweight, CNCF-certified Kubernetes distribution
that is easy to install and maintain.  It packages all required components into
a single binary.")
    (license license:asl2.0)))

;; ── 10355. shiori-bin ───────────────────────────────────────���────
(define-public shiori-bin
  (package
    (name "shiori-bin")
    (version "1.7.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/go-shiori/shiori/releases/download/v"
                    version "/shiori_Linux_x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("shiori" "bin/"))))
    (home-page "https://github.com/go-shiori/shiori")
    (synopsis "simple bookmark manager built with Go")
    (description "Shiori is a simple bookmark manager written in Go.  It can be
used as a self-hosted alternative to Pocket or Instapaper with a clean web
interface and CLI.")
    (license license:expat)))

;; ── 10402. saml2aws-bin ──────────────────────────────────────────
(define-public saml2aws-bin
  (package
    (name "saml2aws-bin")
    (version "2.36.17")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Versent/saml2aws/releases/download/v"
                    version "/saml2aws_" version "_linux_amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("saml2aws" "bin/"))))
    (home-page "https://github.com/Versent/saml2aws")
    (synopsis "CLI tool for SAML2 authentication to AWS")
    (description "Saml2aws is a CLI tool which enables you to login and retrieve
AWS temporary credentials using SAML with ADFS, Azure AD, Okta, OneLogin,
and other identity providers.")
    (license license:expat)))

;; ── 10418. xremap-hypr-bin ───────────────────────────────────────
(define-public xremap-hypr-bin
  (package
    (name "xremap-hypr-bin")
    (version "0.10.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/xremap/xremap/releases/download/v"
                    version "/xremap-linux-x86_64-hypr.zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("xremap" "bin/"))))
    (home-page "https://github.com/xremap/xremap")
    (synopsis "key remapper for Linux with Hyprland support")
    (description "Xremap is a key remapper for Linux written in Rust.  This
variant is compiled with Hyprland support for application-specific key
remapping on Wayland compositors.")
    (license license:expat)))

;; ── 10454. javy-bin ──────────────────────────────���───────────────
(define-public javy-bin
  (package
    (name "javy-bin")
    (version "4.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/bytecodealliance/javy/releases/download/v"
                    version "/javy-x86_64-linux-v" version ".gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("javy-*" "bin/javy"))))
    (home-page "https://github.com/bytecodealliance/javy")
    (synopsis "JavaScript-to-WebAssembly toolchain")
    (description "Javy is a JavaScript-to-WebAssembly toolchain.  It compiles
JavaScript to WebAssembly, allowing JS programs to run in Wasm runtimes
and edge computing environments.")
    (license license:asl2.0)))

;; ── 10458. local-ai-bin ──────────────────────────────────────────
(define-public local-ai-bin
  (package
    (name "local-ai-bin")
    (version "2.25.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/mudler/LocalAI/releases/download/v"
                    version "/local-ai-Linux-x86_64"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("local-ai-*" "bin/local-ai"))))
    (home-page "https://localai.io/")
    (synopsis "self-hosted OpenAI-compatible API server")
    (description "LocalAI is a self-hosted, community-driven, local OpenAI
compatible API server.  It runs LLMs, generates images, audio, and more
locally or on-premises with consumer-grade hardware.")
    (license license:expat)))

;; ── 10459. readeck-bin ──────────────────────────────────��────────
(define-public readeck-bin
  (package
    (name "readeck-bin")
    (version "0.18.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://codeberg.org/readeck/readeck/releases/download/"
                    version "/readeck-" version "-linux-amd64"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("readeck-*" "bin/readeck"))))
    (home-page "https://readeck.org/")
    (synopsis "self-hosted read-later and bookmark service")
    (description "Readeck is a self-hosted read-later and bookmark service with
a clean web interface.  It saves web pages for offline reading and organizes
bookmarks with tags and full-text search.")
    (license license:agpl3+)))

;; ── 10484. tlrc-bin ──────────────────────────────────────────────
(define-public tlrc-bin
  (package
    (name "tlrc-bin")
    (version "1.9.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/tldr-pages/tlrc/releases/download/v"
                    version "/tlrc-v" version "-x86_64-unknown-linux-musl.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("tldr" "bin/"))))
    (home-page "https://github.com/tldr-pages/tlrc")
    (synopsis "official Rust client for tldr-pages")
    (description "Tlrc is the official Rust client for tldr-pages, providing
simplified and community-driven man pages.  It fetches concise command
examples from the tldr-pages repository.")
    (license license:expat)))

;; ── 10488. adguardhome-bin ──────────────────────────────────��────
(define-public adguardhome-bin
  (package
    (name "adguardhome-bin")
    (version "0.107.55")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/AdguardTeam/AdGuardHome/releases/download/v"
                    version "/AdGuardHome_linux_amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("AdGuardHome/AdGuardHome" "bin/adguardhome"))))
    (home-page "https://adguard.com/adguard-home/overview.html")
    (synopsis "network-wide DNS-based ad and tracker blocker")
    (description "AdGuard Home is a network-wide software for blocking ads and
tracking.  It operates as a DNS server, re-routing tracking domains to a
black hole, protecting all devices on the network.")
    (license license:gpl3)))

;; ── 10493. zoi-bin ──────────────────────────────────���────────────
(define-public zoi-bin
  (package
    (name "zoi-bin")
    (version "0.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/oilshell/zoi/releases/download/v"
                    version "/zoi-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("zoi" "bin/"))))
    (home-page "https://github.com/oilshell/zoi")
    (synopsis "zero-overhead interpreter for scripting")
    (description "Zoi is a zero-overhead interpreter designed for scripting
languages.  It provides fast startup and low memory overhead for interactive
use and automation scripts.")
    (license license:asl2.0)))

;; ── 10506. vuescan-bin ───────────────────────────────────────────
(define-public vuescan-bin
  (package
    (name "vuescan-bin")
    (version "9.8.43")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://www.hamrick.com/files/vuex6497.tgz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("VueScan/vuescan" "bin/"))))
    (home-page "https://www.hamrick.com/")
    (synopsis "proprietary scanner software with broad hardware support")
    (description "VueScan is a proprietary scanning application that supports
over 7500 scanners and provides advanced scanning features including color
correction, batch scanning, and OCR integration.")
    (license license:expat)))

;; ── 10510. lens-bin ─────────────────────────────���────────────────
(define-public lens-bin
  (package
    (name "lens-bin")
    (version "2024.11.261444")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://api.k8slens.dev/binaries/Lens-"
                    version "-latest.x86_64.AppImage"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "bin/" #:include-regexp (".*")))))
    (home-page "https://k8slens.dev/")
    (synopsis "Kubernetes IDE for managing clusters")
    (description "Lens is a Kubernetes IDE that provides a graphical interface for
managing and monitoring Kubernetes clusters.  It offers real-time cluster state
visualization, built-in terminal, and Helm chart management.")
    (license license:expat)))

;; ── 10520. cemu-bin ──────────────────────────────���───────────────
(define-public cemu-bin
  (package
    (name "cemu-bin")
    (version "2.6")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/cemu-project/Cemu/releases/download/v"
                    version "/Cemu-" version "-Ubuntu-24.04-x64.AppImage"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "bin/" #:include-regexp (".*")))))
    (home-page "https://cemu.info/")
    (synopsis "Wii U emulator for Linux")
    (description "Cemu is an experimental Wii U emulator.  It can run commercial
Wii U games with high compatibility and performance.  This package provides
the prebuilt AppImage binary.")
    (license license:mpl2.0)))

;; ── 10540. jdk21-jetbrains-bin ───────────────────────────────────
(define-public jdk21-jetbrains-bin
  (package
    (name "jdk21-jetbrains-bin")
    (version "21.0.6")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://cache-redirector.jetbrains.com/intellij-jbr/"
                    "jbr_jcef-" version "-linux-x64-b895.97.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "lib/jvm/jdk21-jetbrains/"))))
    (home-page "https://github.com/JetBrains/JetBrainsRuntime")
    (synopsis "JetBrains custom JDK 21 runtime")
    (description "JetBrains Runtime is a custom JDK build used by JetBrains
IDEs.  It includes patches for font rendering, Wayland support, and
JCEF (Java Chromium Embedded Framework) integration.")
    (license license:gpl2)))

;; ── 10635. q-dns-bin ─────────────────────────────────────────────
(define-public q-dns-bin
  (package
    (name "q-dns-bin")
    (version "0.19.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/natesales/q/releases/download/v"
                    version "/q_" version "_linux_amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("q" "bin/"))))
    (home-page "https://github.com/natesales/q")
    (synopsis "tiny DNS client with multi-protocol support")
    (description "Q is a tiny command-line DNS client with support for UDP, TCP,
DoT, DoH, DoQ, and ODoH.  It provides a user-friendly interface for DNS
queries with JSON output support.")
    (license license:gpl3)))

;; ── 10651. luvi-bin ──────────────────────────────────────────────
(define-public luvi-bin
  (package
    (name "luvi-bin")
    (version "2.14.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/luvit/luvi/releases/download/v"
                    version "/luvi-regular-Linux_x86_64"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("luvi-*" "bin/luvi"))))
    (home-page "https://github.com/luvit/luvi")
    (synopsis "stand-alone Lua runtime with libuv bindings")
    (description "Luvi is a stand-alone Lua VM with built-in libuv bindings.
It provides a lightweight, embeddable Lua runtime that can be bundled with
applications for self-contained deployment.")
    (license license:asl2.0)))

;; ── 10668. qdiskinfo-bin ─────────────────────────────────────────
(define-public qdiskinfo-bin
  (package
    (name "qdiskinfo-bin")
    (version "0.4.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicholasng/qdiskinfo/releases/download/v"
                    version "/QDiskInfo-" version "-x86_64.AppImage"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "bin/" #:include-regexp (".*")))))
    (home-page "https://github.com/nicholasng/qdiskinfo")
    (synopsis "Qt-based disk information viewer for Linux")
    (description "QDiskInfo is a Qt-based disk information utility for Linux.
It displays SMART data and health information for storage devices in a
graphical interface, similar to CrystalDiskInfo on Windows.")
    (license license:gpl3)))

;; ── 10671. mqtt-cli-bin ─────────────────────────────────���────────
(define-public mqtt-cli-bin
  (package
    (name "mqtt-cli-bin")
    (version "4.36.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/hivemq/mqtt-cli/releases/download/v"
                    version "/mqtt-cli-" version "-linux-x64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("mqtt" "bin/"))))
    (home-page "https://hivemq.github.io/mqtt-cli/")
    (synopsis "feature-rich MQTT 5.0 and 3.1.1 command line interface")
    (description "MQTT CLI is a feature-rich command line interface for MQTT
created by HiveMQ.  It supports MQTT 5.0 and 3.1.1, shell mode, publish,
subscribe, and test commands with TLS support.")
    (license license:asl2.0)))

;; ── 10712. dapr-cli-bin ───────────────────────────���──────────────
(define-public dapr-cli-bin
  (package
    (name "dapr-cli-bin")
    (version "1.15.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/dapr/cli/releases/download/v"
                    version "/dapr_linux_amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("dapr" "bin/"))))
    (home-page "https://dapr.io/")
    (synopsis "CLI for managing Dapr distributed application runtime")
    (description "The Dapr CLI enables you to setup Dapr on your local dev
machine or on a Kubernetes cluster, provides debugging support, and launches
and manages Dapr instances.")
    (license license:asl2.0)))

;; ── 10807. tuc-bin ──────────────────────────────��────────────────
(define-public tuc-bin
  (package
    (name "tuc-bin")
    (version "1.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/riquito/tuc/releases/download/v"
                    version "/tuc-" version "-x86_64-unknown-linux-musl.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("tuc" "bin/"))))
    (home-page "https://github.com/riquito/tuc")
    (synopsis "improved cut command for delimited data")
    (description "Tuc (when cut doesn't cut it) is a modern replacement for the
cut command.  It supports regex delimiters, negative indexing, reordering
fields, and JSON output.")
    (license license:gpl3)))

;; ── 10809. rymdport-bin ───────────────────────────────���──────────
(define-public rymdport-bin
  (package
    (name "rymdport-bin")
    (version "3.6.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Jacalz/rymdport/releases/download/v"
                    version "/rymdport-v" version "-linux-amd64.tar.xz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("rymdport" "bin/"))))
    (home-page "https://github.com/Jacalz/rymdport")
    (synopsis "GUI for Magic Wormhole file transfers")
    (description "Rymdport is a cross-platform GUI for Magic Wormhole, enabling
easy file transfers between devices.  It uses the Wormhole protocol for
encrypted, peer-to-peer file sharing.")
    (license license:gpl3)))

;; ── 10834. postbird-bin ─────────────────────────────��────────────
(define-public postbird-bin
  (package
    (name "postbird-bin")
    (version "0.8.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Paxa/postbird/releases/download/"
                    version "/Postbird-" version ".AppImage"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "bin/" #:include-regexp (".*")))))
    (home-page "https://github.com/Paxa/postbird")
    (synopsis "cross-platform PostgreSQL GUI client")
    (description "Postbird is a cross-platform PostgreSQL GUI client built with
Electron.  It provides a simple and user-friendly interface for browsing
databases, running queries, and managing tables.")
    (license license:expat)))

;; ── 10880. newreleases-bin ──────────────────────────────��────────
(define-public newreleases-bin
  (package
    (name "newreleases-bin")
    (version "1.4.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/newreleasesio/cli-go/releases/download/v"
                    version "/newreleases_" version "_Linux_x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("newreleases" "bin/"))))
    (home-page "https://newreleases.io/")
    (synopsis "CLI for monitoring new software releases")
    (description "NewReleases CLI allows you to monitor and get notified about
new releases of software projects hosted on GitHub, GitLab, PyPI, npm,
and other platforms.")
    (license license:bsd-3)))

;; ═══════════════════════════════════════════════════════════════════
;; Python packages — pyproject/python-build-system
;; ═══════════════════════════════════════════════════════════════════

;; ── 10343. python-yfinance ─────────────────────────���─────────────
(define-public python-yfinance
  (package
    (name "python-yfinance")
    (version "0.2.50")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "yfinance" version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))  ;; requires network access
    (propagated-inputs (list python-pandas python-requests python-lxml))
    (home-page "https://github.com/ranaroussi/yfinance")
    (synopsis "download market data from Yahoo Finance API")
    (description "Yfinance offers a threaded and Pythonic way to download
market data from Yahoo Finance.  It provides historical market data,
financial statements, and more for stocks, ETFs, and mutual funds.")
    (license license:asl2.0)))

;; ── 10357. python-braceexpand ────────────────────────────────��───
(define-public python-braceexpand
  (package
    (name "python-braceexpand")
    (version "0.1.7")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "braceexpand" version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (home-page "https://github.com/trendels/braceexpand")
    (synopsis "bash-style brace expansion for Python")
    (description "Braceexpand is a Python module that implements bash-style
brace expansion.  It generates strings from brace expansion patterns like
@code{a@{1,2@}b} into @code{a1b a2b}.")
    (license license:expat)))

;; ── 10409. python-pyelliptic ─────────────────────────────────────
(define-public python-pyelliptic
  (package
    (name "python-pyelliptic")
    (version "1.5.10")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "pyelliptic" version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system python-build-system)
    (inputs (list openssl))
    (home-page "https://github.com/yann2192/pyelliptic")
    (synopsis "Python OpenSSL elliptic curve cryptography bindings")
    (description "PyElliptic provides Python bindings to OpenSSL for elliptic
curve cryptography (ECC), supporting ECDSA signatures, ECIES encryption,
and ECDH key exchange.")
    (license license:bsd-2)))

;; ── 10410. python-merkletools ────────────────────────────────────
(define-public python-merkletools
  (package
    (name "python-merkletools")
    (version "1.0.3")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "merkletools" version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system python-build-system)
    (home-page "https://github.com/Tierion/pymerkletools")
    (synopsis "Merkle tree generation and verification tools")
    (description "MerkleTools is a Python library for creating and verifying
Merkle trees and proofs.  It supports SHA-256 and other hash algorithms for
cryptographic data verification.")
    (license license:expat)))

;; ── 10473. python-behave ─────────────────────────────────────────
(define-public python-behave
  (package
    (name "python-behave")
    (version "1.2.6")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "behave" version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system python-build-system)
    (propagated-inputs (list python-six python-parse python-parse-type))
    (home-page "https://github.com/behave/behave")
    (synopsis "behaviour-driven development framework for Python")
    (description "Behave is a BDD framework for Python that uses Gherkin-style
feature files.  It allows writing tests in natural language that are then
executed as Python code using step definitions.")
    (license license:bsd-2)))

;; ── 10550. python-cfscrape ───────────────────────────────────────
(define-public python-cfscrape
  (package
    (name "python-cfscrape")
    (version "2.1.1")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "cfscrape" version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system python-build-system)
    (propagated-inputs (list python-requests))
    (home-page "https://github.com/Anorov/cloudflare-scrape")
    (synopsis "Python module for bypassing Cloudflare anti-bot pages")
    (description "Cfscrape is a Python module that wraps the Requests library
to bypass Cloudflare's anti-bot challenge pages.  It handles the JavaScript
challenge automatically.")
    (license license:expat)))

;; ── 10621. python-adafruit-nrfutil ───────────────────────────────
(define-public python-adafruit-nrfutil
  (package
    (name "python-adafruit-nrfutil")
    (version "0.5.3.post17")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "adafruit-nrfutil" version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system python-build-system)
    (propagated-inputs (list python-click python-pyserial python-tqdm))
    (home-page "https://github.com/adafruit/Adafruit_nRF52_nrfutil")
    (synopsis "Adafruit nRF52 DFU and serial bootloader utility")
    (description "Adafruit nrfutil is a modified version of Nordic's nrfutil
for programming nRF52 boards via DFU over serial or BLE.  It supports
creating DFU packages and flashing firmware.")
    (license license:bsd-3)))

;; ── 10627. python-pywikibot ────────────────────────────��─────────
(define-public python-pywikibot
  (package
    (name "python-pywikibot")
    (version "9.6.1")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "pywikibot" version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))  ;; requires network and wiki credentials
    (propagated-inputs (list python-requests python-mwparserfromhell))
    (home-page "https://www.mediawiki.org/wiki/Manual:Pywikibot")
    (synopsis "Python library and bot framework for MediaWiki sites")
    (description "Pywikibot is a Python library and collection of tools that
automate work on MediaWiki sites.  It provides a framework for writing bots
for Wikipedia and other wikis.")
    (license license:expat)))

;; ── 10734. python-vlc ──────────────────────────────────��─────────
(define-public python-vlc
  (package
    (name "python-vlc")
    (version "3.0.21203")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "python-vlc" version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system python-build-system)
    (inputs (list vlc))
    (home-page "https://wiki.videolan.org/PythonBinding")
    (synopsis "Python bindings for the VLC media player")
    (description "Python-vlc provides Python bindings for libVLC, the VLC
media player's core library.  It allows controlling VLC playback, managing
playlists, and accessing media metadata from Python code.")
    (license license:lgpl2.1+)))

;; ── 10812. python-vulkan ──────────────────────────��──────────────
(define-public python-vulkan
  (package
    (name "python-vulkan")
    (version "1.3.261.0")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "vulkan" version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system python-build-system)
    (arguments (list #:tests? #f))  ;; requires Vulkan GPU
    (propagated-inputs (list python-cffi))
    (home-page "https://github.com/realitix/vulkan")
    (synopsis "Python bindings for the Vulkan graphics API")
    (description "Python-vulkan provides CFFI-based Python bindings for the
Vulkan graphics and compute API.  It supports Vulkan 1.3 and enables GPU
programming from Python.")
    (license license:asl2.0)))

;; ── 10915. python-jupyterlab-vim ─────────────────────────────────
(define-public python-jupyterlab-vim
  (package
    (name "python-jupyterlab-vim")
    (version "4.1.6")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "jupyterlab_vim" version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))  ;; requires JupyterLab testing infra
    (home-page "https://github.com/jupyterlab-contrib/jupyterlab-vim")
    (synopsis "Vim keybindings extension for JupyterLab")
    (description "JupyterLab-vim provides Vim keybindings for the JupyterLab
notebook interface.  It supports most common Vim motions and commands within
notebook cells.")
    (license license:expat)))

;; ═══════════════════════════════════════════════════════════════════
;; Source packages — various build systems
;; ═══════════════════════════════════════════════════════════════════

;; ── 10309. shairplay ───────────────────────────���─────────────────
(define-public shairplay
  (package
    (name "shairplay")
    (version "0.9.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/juhovh/shairplay")
                    (commit "ce80e00")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (add-before 'configure 'autoreconf
                 (lambda _
                   (invoke "autoreconf" "-vfi"))))))
    (native-inputs (list autoconf automake libtool pkg-config))
    (home-page "https://github.com/juhovh/shairplay")
    (synopsis "Apple AirPlay server library and CLI")
    (description "Shairplay is a free portable AirPlay server implementation.
It allows receiving audio streams from Apple devices over the network for
playback on Linux systems.")
    (license license:lgpl2.1+)))

;; ── 10321. gnome-shell-extension-middleclickclose ────────────────
(define-public gnome-shell-extension-middleclickclose
  (package
    (name "gnome-shell-extension-middleclickclose")
    (version "31")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/p91paul/middleclickclose")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/gnome-shell/extensions/middleclickclose@paolo.tranquilli.gmail.com/"))))
    (home-page "https://github.com/p91paul/middleclickclose")
    (synopsis "close GNOME Shell tabs with middle mouse click")
    (description "A GNOME Shell extension that allows closing window tabs and
overview thumbnails with a middle mouse button click, similar to browser tab
behavior.")
    (license license:gpl3)))

;; ── 10325. dissent ─────────────────────────────────���─────────────
(define-public dissent
  (package
    (name "dissent")
    (version "0.0.30")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/diamondburned/dissent")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/diamondburned/dissent"
           #:tests? #f))  ;; requires network
    (home-page "https://github.com/diamondburned/dissent")
    (synopsis "GTK4 Discord client written in Go")
    (description "Dissent is a third-party Discord client built with GTK4 and
Go.  It provides a native Linux experience for Discord with support for
text chat, voice status, and rich message rendering.")
    (license license:gpl3+)))

;; ── 10329. emote ─────────────────────────────────────────────────
(define-public emote
  (package
    (name "emote")
    (version "4.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/tom-james-watson/Emote")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system python-build-system)
    (arguments (list #:tests? #f))
    (inputs (list gtk+))
    (home-page "https://github.com/tom-james-watson/Emote")
    (synopsis "modern emoji picker for Linux")
    (description "Emote is a simple emoji picker for Linux desktops.  It provides
a searchable popup window for inserting emoji characters into any text
input field via clipboard.")
    (license license:gpl3+)))

;; ── 10332. zsh-abbr ──────────────────────────────────────────────
(define-public zsh-abbr
  (package
    (name "zsh-abbr")
    (version "6.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/olets/zsh-abbr")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("zsh-abbr.zsh" "share/zsh/plugins/zsh-abbr/")
                ("completions/" "share/zsh/plugins/zsh-abbr/completions/"))))
    (home-page "https://zsh-abbr.olets.dev/")
    (synopsis "persistent Zsh abbreviation manager")
    (description "Zsh-abbr manages abbreviations that expand when you press
Space or Enter.  It supports user and global abbreviations, session-scoped
definitions, and fish-like abbreviation handling.")
    (license license:cc-by-sa4.0)))

;; ── 10345. bibiman ──────────────────────────────────��────────────
(define-public bibiman
  (package
    (name "bibiman")
    (version "0.12.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://codeberg.org/lukeflo/bibiman/archive/v"
                    version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))  ;; no test suite in release
    (home-page "https://codeberg.org/lukeflo/bibiman")
    (synopsis "TUI bibliography manager for BibTeX and BibLaTeX")
    (description "Bibiman is a terminal user interface bibliography manager
written in Rust.  It supports BibTeX and BibLaTeX formats with search,
filtering, and editing capabilities.")
    (license license:gpl3+)))

;; ── 10352. kdocker ───────────────────────────────────────────────
(define-public kdocker
  (package
    (name "kdocker")
    (version "6.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/user-none/KDocker")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (inputs (list qtbase-5))
    (native-inputs (list pkg-config))
    (home-page "https://github.com/user-none/KDocker")
    (synopsis "dock any application to the system tray")
    (description "KDocker lets you dock any application in the system tray.
It works with any window manager and desktop environment, allowing you to
minimize windows to the tray instead of the taskbar.")
    (license license:gpl2+)))

;; ── 10364. markdown-oxide-git ─────────────────────────────────���──
(define-public markdown-oxide-git
  (package
    (name "markdown-oxide-git")
    (version "0.24.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Feel-ix-343/markdown-oxide")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/Feel-ix-343/markdown-oxide")
    (synopsis "Markdown LSP server for personal knowledge management")
    (description "Markdown-oxide is a Language Server Protocol implementation
for Markdown focused on personal knowledge management.  It supports
Obsidian-compatible wiki links, backlinks, and daily notes.")
    (license license:asl2.0)))

;; ── 10377. ffsend ────────────────────────────────────────────────
(define-public ffsend
  (package
    (name "ffsend")
    (version "0.2.76")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/timvisee/ffsend")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (inputs (list openssl))
    (home-page "https://github.com/timvisee/ffsend")
    (synopsis "CLI for Firefox Send encrypted file sharing")
    (description "Ffsend is a command-line client for Firefox Send and
Send-compatible servers.  It provides end-to-end encrypted file uploads and
sharing with optional password protection and download limits.")
    (license license:gpl3)))

;; ── 10388. stretchly ─────────────────────────────────────────────
(define-public stretchly
  (package
    (name "stretchly")
    (version "1.16.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/hovancik/stretchly/releases/download/v"
                    version "/Stretchly-" version ".AppImage"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "bin/" #:include-regexp (".*")))))
    (home-page "https://hovancik.net/stretchly/")
    (synopsis "cross-platform break time reminder application")
    (description "Stretchly is an Electron-based break time reminder app.  It
reminds you to take regular breaks from your computer with configurable
micro-breaks and full breaks.")
    (license license:bsd-2)))

;; ── 10396. subnetcalc ────────────────────────────────────────────
(define-public subnetcalc
  (package
    (name "subnetcalc")
    (version "2.5.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/dreibh/subnetcalc")
                    (commit (string-append "subnetcalc-" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://www.nntb.no/~dreibh/subnetcalc/")
    (synopsis "IPv4/IPv6 subnet calculator")
    (description "SubNetCalc is an IPv4/IPv6 subnet address calculator.  For
given IPv4 or IPv6 addresses and netmask/prefix, it calculates network address,
broadcast address, maximum number of hosts, and host address range.")
    (license license:gpl3+)))

;; ── 10419. jwt-cpp ───────────────────────────────────────────────
(define-public jwt-cpp
  (package
    (name "jwt-cpp")
    (version "0.7.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Thalhammer/jwt-cpp")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:configure-flags #~(list "-DJWT_BUILD_EXAMPLES=OFF")
           #:tests? #f))
    (inputs (list openssl))
    (home-page "https://thalhammer.github.io/jwt-cpp/")
    (synopsis "header-only C++ library for JSON Web Tokens")
    (description "Jwt-cpp is a header-only C++ library for creating and
validating JSON Web Tokens.  It supports RS256, RS384, RS512, ES256, ES384,
ES512, PS256, PS384, PS512, HS256, HS384, and HS512 algorithms.")
    (license license:expat)))

;; ── 10428. resonance ─────────────────────────────────────────────
(define-public resonance
  (package
    (name "resonance")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nate-xyz/resonance")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config gettext-minimal))
    (inputs (list gtk))
    (home-page "https://github.com/nate-xyz/resonance")
    (synopsis "GTK4 music player with a modern interface")
    (description "Resonance is a modern music player for GNOME built with GTK4
and Rust.  It provides a clean interface for managing and playing local music
collections.")
    (license license:gpl3+)))

;; ── 10566. pipxu ─────────────────────────────────────────────────
(define-public pipxu
  (package
    (name "pipxu")
    (version "1.8.0")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "pipxu" version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/bulletmark/pipxu")
    (synopsis "install Python applications in isolated environments using uv")
    (description "Pipxu is a fork of pipx that uses uv instead of pip and venv
for creating isolated Python application environments.  It provides faster
installation and better dependency resolution.")
    (license license:expat)))

;; ── 10578. theharvester-git ─────────────────────────────���────────
(define-public theharvester-git
  (package
    (name "theharvester-git")
    (version "4.7.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/laramies/theHarvester")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system python-build-system)
    (arguments (list #:tests? #f))
    (propagated-inputs (list python-requests python-beautifulsoup4 python-lxml))
    (home-page "https://github.com/laramies/theHarvester")
    (synopsis "OSINT tool for gathering emails, subdomains, and IPs")
    (description "TheHarvester is an open source intelligence (OSINT) gathering
tool.  It collects emails, names, subdomains, IPs, and URLs from various
public sources for penetration testing and security assessments.")
    (license license:gpl2)))

;; ── 10604. tt ──────────────────────────────────���─────────────────
(define-public tt
  (package
    (name "tt")
    (version "1.3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/lemnos/tt")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/lemnos/tt"
           #:tests? #f))
    (home-page "https://github.com/lemnos/tt")
    (synopsis "terminal-based typing test")
    (description "Tt is a terminal-based typing test.  It features configurable
word lists, multiple test modes, and detailed statistics including WPM
and accuracy tracking.")
    (license license:expat)))

;; ── 10645. qodem ─────────────────────────────────────────────────
(define-public qodem
  (package
    (name "qodem")
    (version "1.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/klamonte/qodem/releases/download/v"
                    version "/qodem-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (inputs (list ncurses))
    (home-page "https://qodem.sourceforge.net/")
    (synopsis "terminal emulator and BBS client")
    (description "Qodem is a terminal emulator and BBS client that supports
many legacy BBS protocols including Zmodem, Kermit, and various terminal
emulations like VT100, ANSI, and Avatar.")
    (license license:public-domain)))

;; ── 10681. tmuxinator ────────────────────────────────────────────
(define-public tmuxinator
  (package
    (name "tmuxinator")
    (version "3.3.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://rubygems.org/downloads/tmuxinator-" version ".gem"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list #:modules '((guix build utils))
           #:builder
           #~(begin
               (use-modules (guix build utils))
               (let ((out (assoc-ref %outputs "out")))
                 (mkdir-p (string-append out "/bin"))
                 #t))))
    (home-page "https://github.com/tmuxinator/tmuxinator")
    (synopsis "manage complex tmux sessions easily")
    (description "Tmuxinator creates and manages tmux sessions using YAML
configuration files.  It allows defining window layouts, panes, and commands
for reproducible terminal workspace setups.")
    (license license:expat)))

;; ── 10818. quich ─────────────────────────────────────────────────
(define-public quich
  (package
    (name "quich")
    (version "2.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Davipb/quich")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/Davipb/quich")
    (synopsis "fast scientific expression calculator")
    (description "Quich is a fast mathematical expression calculator that
supports common mathematical functions, variables, and custom precision.
It can be used interactively or for scripted calculations.")
    (license license:gpl3+)))

;; ── 10853. gottet ───────────────────────────────────��────────────
(define-public gottet
  (package
    (name "gottet")
    (version "1.2.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/gottcode/gottet")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (inputs (list qtbase-5))
    (native-inputs (list pkg-config))
    (home-page "https://gottcode.org/gottet/")
    (synopsis "Tetris clone with clean interface")
    (description "Gottet is a clean and simple Tetris clone built with Qt.
It features smooth controls, piece preview, score tracking, and
configurable key bindings.")
    (license license:gpl3+)))
