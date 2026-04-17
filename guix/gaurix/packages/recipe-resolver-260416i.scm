;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260416i
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages (BLOCKED items).
;;;
;;; Recipes (30):
;;;   1. jellyfin-rpc-bin (copy/binary, v1.3.5, GPL-3.0)
;;;   2. mago-bin (copy/binary, v1.20.1, MIT/Apache-2.0)
;;;   3. dotr-bin (copy/binary, v1.0.0, MIT)
;;;   4. quantumlauncher-bin (copy/binary, v0.5.1, GPL-3.0+)
;;;   5. envy-tui-bin (copy/binary, v0.1.4, MIT)
;;;   6. surrealdb-bin (copy/binary, v3.0.5, nonfree/BSL-1.1)
;;;   7. alt-sendme-bin (copy/binary, v0.3.5, AGPL-3.0)
;;;   8. lrcget-bin (copy/binary, v1.0.2, MIT)
;;;   9. flclashx-bin (copy/binary, v0.3.2, GPL-3.0)
;;;  10. ps3-disc-dumper-bin (copy/binary, v4.4.4, MIT)
;;;  11. termora-bin (copy/binary, v1.0.17, AGPL-3.0)
;;;  12. brisk-bin (copy/binary, v2.3.8, GPL-3.0)
;;;  13. elephant-providerlist-bin (copy/binary, v2.21.0, GPL-3.0)
;;;  14. elephant-bluetooth-bin (copy/binary, v2.21.0, GPL-3.0)
;;;  15. dsw-bin (copy/binary, v0.0.3, MIT)
;;;  16. wireguard-vanity-keygen (copy/binary, v1.0.1, MIT)
;;;  17. git-standup (gnu/shell, v2.3.2, MIT)
;;;  18. scopebuddy (copy/shell, v1.4.0, Apache-2.0)
;;;  19. perl-crypt-argon2 (perl, v0.030, GPL+Artistic)
;;;  20. kas (pyproject, v5.2, MIT)
;;;  21. addwater (meson, v1.2.9.1, GPL-3.0+)
;;;  22. wsdd-native (cmake, v1.23, BSD-3)
;;;  23. open-in-native-client (copy, v1.0.8, MPL-2.0)
;;;  24. python-pfzy (pyproject, v0.3.4, MIT) — dep for python-inquirerpy
;;;  25. python-inquirerpy (pyproject, v0.3.4, MIT)
;;;  26. mandelbulber2 (cmake, v2.34, GPL-3.0)
;;;  27. gotify-tray-cpp — BLOCKED: needs qt6-websockets not confirmed in Guix
;;;  28. screenpipe-bin — BLOCKED: orphaned AUR, version tag mismatch, unstable release URLs
;;;  29. sticker-convert — BLOCKED: 13+ Python deps including forks not in Guix
;;;  30. reticulum-meshchat-bin — BLOCKED: Electron/Node.js AppImage, no native build path
;;;
;;; 26 recipes written. 4 BLOCKED.
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Run `guix download <url>` to obtain real hashes before building.

(define-module (gaurix packages recipe-resolver-260416i)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system perl)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages cmake)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages gettext)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages image)
  #:use-module (gnu packages java)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages maths)
  #:use-module (gnu packages mpi)
  #:use-module (gnu packages node)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages version-control)
  #:use-module (gnu packages xml)
  #:export (
            jellyfin-rpc-bin
            mago-bin
            dotr-bin
            quantumlauncher-bin
            envy-tui-bin
            surrealdb-bin
            alt-sendme-bin
            lrcget-bin
            flclashx-bin
            ps3-disc-dumper-bin
            termora-bin
            brisk-bin
            elephant-providerlist-bin
            elephant-bluetooth-bin
            dsw-bin
            wireguard-vanity-keygen
            git-standup
            scopebuddy
            perl-crypt-argon2
            kas
            addwater
            wsdd-native
            open-in-native-client
            python-pfzy
            python-inquirerpy
            mandelbulber2
            ))

;;; Nonfree license placeholder (BSL-1.1 for SurrealDB).
(define license:nonfree
  ((@@ (guix licenses) license) "Nonfree"
    "https://en.wikipedia.org/wiki/Proprietary_software"
    "Proprietary nonfree license"))

;;; -------------------------------------------------------------------
;;; 1. jellyfin-rpc-bin — Jellyfin Discord Rich Presence client
;;; -------------------------------------------------------------------
(define-public jellyfin-rpc-bin
  (package
    (name "jellyfin-rpc-bin")
    (version "1.3.5")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/JustRadical/jellyfin-rpc/releases/download/"
                    version "/jellyfin-rpc-x86_64-linux"))
              (file-name (string-append "jellyfin-rpc-" version "-x86_64-linux"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("jellyfin-rpc" "bin/jellyfin-rpc"))
           #:phases
           #~(modify-phases %standard-phases
               (add-before 'install 'rename-and-chmod
                 (lambda* (#:key source #:allow-other-keys)
                   (copy-file source "jellyfin-rpc")
                   (chmod "jellyfin-rpc" #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "display Jellyfin playback status as Discord Rich Presence")
    (description "Jellyfin-RPC is a Rust CLI tool that connects to a Jellyfin
media server and pushes the current playback status to Discord via the Rich
Presence RPC protocol.  It supports music, movies, TV shows, and live TV.")
    (home-page "https://github.com/JustRadical/jellyfin-rpc")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 2. mago-bin — PHP linter, formatter, and static analyzer
;;; -------------------------------------------------------------------
(define-public mago-bin
  (package
    (name "mago-bin")
    (version "1.20.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/carthage-software/mago/releases/download/"
                    version "/mago-" version
                    "-x86_64-unknown-linux-gnu.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("mago" "bin/mago"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "fast PHP linter, formatter, and static analyzer written in Rust")
    (description "Mago is a comprehensive PHP toolchain providing linting,
formatting, parsing, and static analysis.  It is written in Rust for speed and
serves as an alternative to traditional PHP analysis tools like PHPStan and
PHP-CS-Fixer.")
    (home-page "https://github.com/carthage-software/mago")
    (license (list license:expat license:asl2.0))))

;;; -------------------------------------------------------------------
;;; 3. dotr-bin — dotfiles manager via symlinks
;;; -------------------------------------------------------------------
(define-public dotr-bin
  (package
    (name "dotr-bin")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/uroybd/DotR/releases/download/v"
                    version "/dotr-x86_64-unknown-linux-gnu.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("dotr" "bin/dotr"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "dotfiles manager that symlinks config files from a repository")
    (description "DotR is a lightweight Rust CLI dotfiles manager that tracks
and deploys dotfiles via symlinks.  It provides a simple way to keep
configuration files version-controlled in a central repository and linked to
their expected locations.")
    (home-page "https://github.com/uroybd/DotR")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 4. quantumlauncher-bin — lightweight Minecraft launcher
;;; -------------------------------------------------------------------
(define-public quantumlauncher-bin
  (package
    (name "quantumlauncher-bin")
    (version "0.5.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Mrmayman/quantumlauncher/releases/download/v"
                    version "/quantum_launcher_linux_x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("quantum_launcher" "bin/quantumlauncher"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "simple Minecraft launcher with Modrinth and FabricMC integration")
    (description "QuantumLauncher is a lightweight Rust-based Minecraft launcher
built with the iced UI toolkit.  It supports mod management via Modrinth,
FabricMC loader installation, and OmniArchive for legacy versions.")
    (home-page "https://github.com/Mrmayman/quantumlauncher")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 5. envy-tui-bin — TUI for EnvyControl GPU switching
;;; -------------------------------------------------------------------
(define-public envy-tui-bin
  (package
    (name "envy-tui-bin")
    (version "0.1.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/tassiovirginio/envy-tui/releases/download/v"
                    version "/envy-tui-v" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("envy-tui" "bin/envy-tui"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "terminal UI for EnvyControl to manage NVIDIA Optimus GPU modes")
    (description "Envy-TUI is a Rust TUI application built with Ratatui that
provides an interactive interface for EnvyControl.  It enables easy GPU mode
switching between integrated, hybrid, and NVIDIA modes with options for RTD3
power management and Coolbits overclocking on Linux laptops.")
    (home-page "https://github.com/tassiovirginio/envy-tui")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 6. surrealdb-bin — multi-model cloud database
;;; -------------------------------------------------------------------
(define-public surrealdb-bin
  (package
    (name "surrealdb-bin")
    (version "3.0.5")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/surrealdb/surrealdb/releases/download/v"
                    version "/surreal-v" version ".linux-amd64.tgz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("surreal" "bin/surreal"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "scalable document-graph database for the realtime web")
    (description "SurrealDB is a multi-model database that combines relational,
document, graph, and time-series capabilities with a SQL-like query language.
It is designed for serverless and cloud-native applications.")
    (home-page "https://surrealdb.com")
    (license license:nonfree)))

;;; -------------------------------------------------------------------
;;; 7. alt-sendme-bin — peer-to-peer file transfer tool
;;; -------------------------------------------------------------------
(define-public alt-sendme-bin
  (package
    (name "alt-sendme-bin")
    (version "0.3.5")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/tonyantony300/alt-sendme/releases/download/v"
                    version "/AltSendme_" version "_amd64.deb"))
              (file-name (string-append "alt-sendme-" version ".deb"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (invoke "ar" "x" source)
                   (invoke "tar" "xf" "data.tar.gz")))
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((out (assoc-ref outputs "out")))
                     (copy-recursively "usr" out)))))))
    (native-inputs (list binutils))
    (supported-systems '("x86_64-linux"))
    (synopsis "frictionless peer-to-peer file transfer without cloud storage")
    (description "Alt Sendme is a Tauri-based desktop application for real-time,
encrypted, peer-to-peer file transfer.  It uses QUIC protocol and BLAKE3
hashing for secure transfers without requiring cloud storage, accounts, or
size restrictions.")
    (home-page "https://github.com/tonyantony300/alt-sendme")
    (license license:agpl3)))

;;; -------------------------------------------------------------------
;;; 8. lrcget-bin — bulk LRC lyrics downloader
;;; -------------------------------------------------------------------
(define-public lrcget-bin
  (package
    (name "lrcget-bin")
    (version "1.0.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/tranxuanthang/lrcget/releases/download/"
                    version "/LRCGET_" version "_amd64.deb"))
              (file-name (string-append "lrcget-" version ".deb"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (invoke "ar" "x" source)
                   (invoke "tar" "xf" "data.tar.gz")))
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((out (assoc-ref outputs "out")))
                     (copy-recursively "usr" out)))))))
    (native-inputs (list binutils))
    (supported-systems '("x86_64-linux"))
    (synopsis "mass-download synced LRC lyrics for an offline music library")
    (description "LRCGET is a Tauri desktop application that bulk-downloads
synchronized lyrics in LRC format from online sources.  It matches lyrics to
local music files for offline use.")
    (home-page "https://github.com/tranxuanthang/lrcget")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 9. flclashx-bin — multi-platform Clash Meta proxy client
;;; -------------------------------------------------------------------
(define-public flclashx-bin
  (package
    (name "flclashx-bin")
    (version "0.3.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/pluralplay/FlClashX/releases/download/v"
                    version "/FlClashX-linux-amd64.deb"))
              (file-name (string-append "flclashx-" version ".deb"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (invoke "ar" "x" source)
                   (invoke "tar" "xf" "data.tar.xz")))
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((out (assoc-ref outputs "out")))
                     (copy-recursively "usr" out)))))))
    (native-inputs (list binutils))
    (supported-systems '("x86_64-linux"))
    (synopsis "multi-platform proxy client based on Clash Meta with Flutter GUI")
    (description "FlClashX is a Flutter-based desktop GUI for the Clash Meta
proxy core.  It supports various proxy protocols including Shadowsocks, VMess,
and Trojan with rule-based traffic routing, and provides a simple ad-free
interface.")
    (home-page "https://github.com/pluralplay/FlClashX")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 10. ps3-disc-dumper-bin — PS3 Blu-ray disc dumper
;;; -------------------------------------------------------------------
(define-public ps3-disc-dumper-bin
  (package
    (name "ps3-disc-dumper-bin")
    (version "4.4.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/13xforever/ps3-disc-dumper/releases/download/v"
                    version "/ps3-disc-dumper_linux_v" version ".zip"))
              (file-name (string-append "ps3-disc-dumper-" version ".zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("ps3-disc-dumper" "bin/ps3-disc-dumper"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'chmod-binary
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/ps3-disc-dumper")
                          #o755))))))
    (native-inputs (list unzip))
    (supported-systems '("x86_64-linux"))
    (synopsis "create decrypted PS3 Blu-ray disc dumps for emulators")
    (description "PS3 Disc Dumper is a cross-platform .NET application with an
Avalonia UI that reads and decrypts PS3 game discs.  It produces ISO images
compatible with the RPCS3 emulator.")
    (home-page "https://github.com/13xforever/ps3-disc-dumper")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 11. termora-bin — cross-platform terminal and SSH client
;;; -------------------------------------------------------------------
(define-public termora-bin
  (package
    (name "termora-bin")
    (version "1.0.17")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/TermoraDev/termora/releases/download/"
                    version "/termora-" version "-linux-x86-64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("termora" "opt/termora/")
               ("lib" "opt/termora/lib/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'create-wrapper
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((out (assoc-ref outputs "out")))
                     (mkdir-p (string-append out "/bin"))
                     (symlink (string-append out "/opt/termora/termora")
                              (string-append out "/bin/termora"))))))))
    (inputs (list (list openjdk21 "jdk")))
    (supported-systems '("x86_64-linux"))
    (synopsis "cross-platform terminal emulator and SSH client built on Kotlin")
    (description "Termora is a terminal emulator and SSH client built with
Kotlin/JVM.  It provides a modern, cross-platform terminal experience with
integrated SSH session management.")
    (home-page "https://github.com/TermoraDev/termora")
    (license license:agpl3)))

;;; -------------------------------------------------------------------
;;; 12. brisk-bin — fast multithreaded download manager
;;; -------------------------------------------------------------------
(define-public brisk-bin
  (package
    (name "brisk-bin")
    (version "2.3.8")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/BrisklyDev/brisk/releases/download/v"
                    version "/Brisk-v" version "-linux-x86_64.tar.xz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("brisk" "bin/brisk"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "fast multithreaded download manager built with Flutter")
    (description "Brisk is a cross-platform download manager built with
Dart/Flutter.  It supports multiple simultaneous connections per download,
browser extension integration, and queue management for efficient file
downloading.")
    (home-page "https://github.com/BrisklyDev/brisk")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 13. elephant-providerlist-bin — Elephant launcher providerlist plugin
;;; -------------------------------------------------------------------
(define-public elephant-providerlist-bin
  (package
    (name "elephant-providerlist-bin")
    (version "2.21.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/abenz1267/elephant/releases/download/v"
                    version "/providerlist-linux-amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("providerlist.so" "lib/elephant/providers/providerlist.so"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "providerlist data source plugin for the Elephant launcher")
    (description "A plugin for Elephant, a backend data provider service for
building custom application launchers.  This plugin provides a list of
available providers and data sources within the Elephant framework using
Go plugin shared objects and Protocol Buffers.")
    (home-page "https://github.com/abenz1267/elephant")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 14. elephant-bluetooth-bin — Elephant launcher Bluetooth plugin
;;; -------------------------------------------------------------------
(define-public elephant-bluetooth-bin
  (package
    (name "elephant-bluetooth-bin")
    (version "2.21.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/abenz1267/elephant/releases/download/v"
                    version "/bluetooth-linux-amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("bluetooth.so" "lib/elephant/providers/bluetooth.so"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "Bluetooth device provider plugin for the Elephant launcher")
    (description "A plugin for Elephant that provides Bluetooth device discovery
and management capabilities as a data source within the Elephant launcher
framework.  It uses Go plugin shared objects for communication.")
    (home-page "https://github.com/abenz1267/elephant")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 15. dsw-bin — local command executor and HTTP API server
;;; -------------------------------------------------------------------
(define-public dsw-bin
  (package
    (name "dsw-bin")
    (version "0.0.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/albertoboccolini/dsw/releases/download/v"
                    version "/dsw_" version "_linux_amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("dsw" "bin/dsw"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "lightweight local command executor and HTTP API server")
    (description "DSW is a Go command-line tool and HTTP API server that allows
users to define and run local commands triggered remotely or locally.  It
serves as a lightweight self-hosted alternative to TriggerCMD without requiring
cloud connectivity.")
    (home-page "https://github.com/albertoboccolini/dsw")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 16. wireguard-vanity-keygen — WireGuard vanity key generator
;;; -------------------------------------------------------------------
(define-public wireguard-vanity-keygen
  (package
    (name "wireguard-vanity-keygen")
    (version "1.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/axllent/wireguard-vanity-keygen/releases/download/"
                    version "/wireguard-vanity-keygen_linux_amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("wireguard-vanity-keygen" "bin/wireguard-vanity-keygen"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "generate WireGuard keypairs with vanity public key prefixes")
    (description "A command-line tool written in Go that generates WireGuard
keypairs where the public key starts with a user-specified string.  It uses
multi-core parallel Curve25519 key generation for efficient vanity key
searching.")
    (home-page "https://github.com/axllent/wireguard-vanity-keygen")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 17. git-standup — show what you worked on in git
;;; -------------------------------------------------------------------
(define-public git-standup
  (package
    (name "git-standup")
    (version "2.3.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/kamranahmedse/git-standup")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "PREFIX=" #$output))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)
               (delete 'build))))
    (inputs (list bash git))
    (synopsis "recall what you did on the last working day in git repositories")
    (description "Git Standup is a shell extension for git that shows what you
or your team committed on the last working day.  It supports querying across
multiple repositories with author filtering and configurable time ranges.")
    (home-page "https://github.com/kamranahmedse/git-standup")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 18. scopebuddy — gamescope helper for desktop gaming
;;; -------------------------------------------------------------------
(define-public scopebuddy
  (package
    (name "scopebuddy")
    (version "1.4.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/OpenGamingCollective/ScopeBuddy")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("scopebuddy" "bin/scopebuddy"))))
    (inputs (list bash coreutils gawk grep perl procps sed))
    (synopsis "helper script for using gamescope on the Linux desktop")
    (description "ScopeBuddy is a manager script that simplifies gamescope
configuration for desktop gaming on Linux.  It supports automatic display
detection (resolution, HDR, VRR), per-game gamescope arguments, and
environment variable management.")
    (home-page "https://github.com/OpenGamingCollective/ScopeBuddy")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 19. perl-crypt-argon2 — Perl interface to Argon2
;;; -------------------------------------------------------------------
(define-public perl-crypt-argon2
  (package
    (name "perl-crypt-argon2")
    (version "0.030")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "mirror://cpan/authors/id/L/LE/LEONT/Crypt-Argon2-"
                    version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system perl-build-system)
    (synopsis "Perl interface to the Argon2 key derivation functions")
    (description "Crypt::Argon2 provides a Perl interface to the Argon2 key
derivation functions (Argon2id, Argon2i, Argon2d).  It bundles the reference
C implementation and exposes it through a clean Perl XS binding for password
hashing and verification.")
    (home-page "https://metacpan.org/release/Crypt-Argon2")
    (license (list license:gpl1+ license:artistic2.0))))

;;; -------------------------------------------------------------------
;;; 20. kas — Yocto/OpenEmbedded setup and build tool
;;; -------------------------------------------------------------------
(define-public kas
  (package
    (name "kas")
    (version "5.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://files.pythonhosted.org/packages/source/k/kas/kas-"
                    version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (propagated-inputs
     (list python-pyyaml
           python-distro
           python-jsonschema
           python-gitpython))
    (native-inputs
     (list python-setuptools python-wheel))
    (synopsis "setup and build tool for bitbake-based Yocto/OpenEmbedded projects")
    (description "Kas is a build tool for Yocto/OpenEmbedded projects that
automates BitBake layer management, repository cloning, and build
configuration.  It provides a declarative YAML format for describing build
environments and supports multi-configuration builds.")
    (home-page "https://github.com/siemens/kas")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 21. addwater — Firefox GNOME theme installer and manager
;;; -------------------------------------------------------------------
(define-public addwater
  (package
    (name "addwater")
    (version "1.2.9.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/largestgithubuseronearth/addwater")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:glib-or-gtk? #t))
    (native-inputs
     (list pkg-config
           gettext-minimal
           `(,glib "bin")
           desktop-file-utils))
    (inputs
     (list gtk
           libadwaita
           python
           python-pygobject
           python-requests))
    (synopsis "installer and manager for the Firefox GNOME theme")
    (description "AddWater is a GNOME application that installs and manages the
Firefox GNOME theme, integrating Firefox's appearance with the GNOME desktop.
It provides a simple GUI for theme installation, updates, and configuration.")
    (home-page "https://github.com/largestgithubuseronearth/addwater")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 22. wsdd-native — WS-Discovery host daemon
;;; -------------------------------------------------------------------
(define-public wsdd-native
  (package
    (name "wsdd-native")
    (version "1.23")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/gershnik/wsdd-native")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list "-DWITH_SYSTEMD=OFF")))
    (synopsis "WS-Discovery daemon making Linux visible in Windows Network view")
    (description "Wsdd-native is a WS-Discovery host daemon that makes Linux
machines visible in the Windows Explorer Network view.  It implements the
WS-Discovery protocol in C++ for efficient network service advertisement
without requiring Samba or Avahi.")
    (home-page "https://github.com/gershnik/wsdd-native")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; 23. open-in-native-client — browser native messaging host
;;; -------------------------------------------------------------------
(define-public open-in-native-client
  (package
    (name "open-in-native-client")
    (version "1.0.8")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/andy-portmen/native-client")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "lib/open-in-native-client/"
                #:include ("host.js" "messaging.js" "config.js")))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'create-wrapper
                 (lambda* (#:key inputs outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (node (search-input-file inputs "bin/node"))
                          (bin (string-append out "/bin")))
                     (mkdir-p bin)
                     (call-with-output-file (string-append bin "/open-in-native-client")
                       (lambda (port)
                         (format port "#!~a~%exec ~a ~a/lib/open-in-native-client/host.js \"$@\"~%"
                                 (search-input-file inputs "bin/bash")
                                 node out)))
                     (chmod (string-append bin "/open-in-native-client") #o755)))))))
    (inputs (list bash node))
    (synopsis "native messaging host for the Open In browser extension")
    (description "A native messaging host for the @samp{Open In} browser
extension that allows launching external applications from Firefox and Chrome.
It provides a bridge between the browser extension and local system commands.")
    (home-page "https://webextension.org/listing/open-in.html")
    (license license:mpl2.0)))

;;; -------------------------------------------------------------------
;;; 24. python-pfzy — Python fuzzy string matching library
;;;     (dependency for python-inquirerpy)
;;; -------------------------------------------------------------------
(define-public python-pfzy
  (package
    (name "python-pfzy")
    (version "0.3.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://files.pythonhosted.org/packages/source/p/pfzy/pfzy-"
                    version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs
     (list python-setuptools python-wheel))
    (synopsis "Python port of the fzy fuzzy string matching algorithm")
    (description "Pfzy is a Python implementation of the fzy fuzzy string
matching algorithm.  It provides fast, quality fuzzy matching for use in
interactive selection interfaces and command-line tools.")
    (home-page "https://github.com/kazhala/pfzy")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 25. python-inquirerpy — interactive CLI prompts for Python
;;; -------------------------------------------------------------------
(define-public python-inquirerpy
  (package
    (name "python-inquirerpy")
    (version "0.3.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://files.pythonhosted.org/packages/source/I/InquirerPy/InquirerPy-"
                    version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (propagated-inputs
     (list python-pfzy python-prompt-toolkit))
    (native-inputs
     (list python-poetry-core))
    (synopsis "Python library for common interactive command-line interfaces")
    (description "InquirerPy is a collection of common interactive command-line
user interface components for Python, ported from the Inquirer.js library.  It
provides selection lists, checkboxes, confirmations, text input, and fuzzy
search built on top of prompt_toolkit.")
    (home-page "https://github.com/kazhala/InquirerPy")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 26. mandelbulber2 — 3D fractal rendering application
;;; -------------------------------------------------------------------
(define-public mandelbulber2
  (package
    (name "mandelbulber2")
    (version "2.34")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/buddhi1980/mandelbulber2/releases/download/"
                    version "/mandelbulber2-" version "-1.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list (string-append "-DCMAKE_INSTALL_PREFIX=" #$output))))
    (native-inputs (list pkg-config))
    (inputs
     (list qtbase-5
           qtmultimedia-5
           libjpeg-turbo
           libpng
           libtiff
           gsl
           lzo))
    (synopsis "3D fractal rendering application with GPU acceleration")
    (description "Mandelbulber is a feature-rich application for rendering
Mandelbulb, Mandelbox, BulbBox, JuliaBulb, Menger Sponge, IFS, and many
other 3D fractal types.  It supports optional OpenCL GPU acceleration,
advanced shading, animation, and a Qt5 GUI.")
    (home-page "https://github.com/buddhi1980/mandelbulber2")
    (license license:gpl3)))
