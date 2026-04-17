;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260416g
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages (BLOCKED items).
;;;
;;; Recipes (30):
;;;   1. git-standup (gnu/script, v2.3.2, MIT)
;;;   2. pwnat (gnu/C, v0.3.0, GPL-3.0)
;;;   3. tera (copy/binary, v3.11.0, MIT)
;;;   4. dotr-bin (copy/binary, v1.0.0, MIT)
;;;   5. mago-bin (copy/binary, v1.20.1, Apache-2.0)
;;;   6. zenity-rs-bin (copy/binary, v0.2.6, MIT)
;;;   7. jellyfin-rpc-bin (copy/binary, v1.3.5, GPL-3.0)
;;;   8. tfupdate-bin (copy/binary, v0.9.3, MIT)
;;;   9. soupault-bin (copy/binary, v5.2.0, MIT)
;;;  10. brisk-bin (copy/binary, v2.3.8, GPL-3.0)
;;;  11. surrealdb-bin (copy/binary, v3.0.5, BSL-1.1/nonfree)
;;;  12. frpc (copy/binary, v0.68.1, Apache-2.0)
;;;  13. frps (copy/binary, v0.68.1, Apache-2.0)
;;;  14. godot-preview-bin (copy/binary, v4.7-dev4, MIT)
;;;  15. perl-crypt-argon2 (perl, v0.030, Apache-2.0)
;;;  16. wireguard-vanity-keygen (copy/binary, v1.0.1, MIT)
;;;  17. kas (pyproject, v5.2, MIT)
;;;  18. gotify-tray-cpp (cmake, v0.1.3, GPL-3.0)
;;;  19. nextpnr-ice40-nightly (cmake, v0.10, ISC)
;;;  20. quran-companion (cmake, v1.5.2, Waqf-2.0)
;;;  21. bisq-bin (copy/.deb, v2.1.10, AGPL-3.0)
;;;  22. mandelbulber2 (gnu/qmake, v2.34, GPL-3.0)
;;;  23. monado-vulkan-layers-git (cmake/git, v0.9.0, BSL-1.0)
;;;  24. yubikey-agent — BLOCKED: Go module deps need packaging
;;;  25. boca (gnu/make, v1.0.7, GPL-2.0)
;;;  26. manim (pyproject, v0.20.1, MIT)
;;;  27. gelly — BLOCKED: Rust cargo crate enumeration needed
;;;  28. keyman — BLOCKED: multi-build-system (cmake+meson+python)
;;;  29. podliner-bin (copy/binary, v1.2.1, MIT)
;;;  30. suil-optgui (meson, v0.10.26, ISC)
;;;
;;; 27 recipes written. 3 BLOCKED (yubikey-agent, gelly, keyman).
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Run `guix download <url>` to obtain real hashes before building.

(define-module (gaurix packages recipe-resolver-260416g)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system perl)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages audio)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages boost)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages engineering)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages image)
  #:use-module (gnu packages maths)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-science)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages serialization)
  #:use-module (gnu packages version-control)
  #:use-module (gnu packages video)
  #:use-module (gnu packages vulkan)
  #:use-module (gnu packages xiph)
  #:export (
            git-standup
            pwnat
            tera
            dotr-bin
            mago-bin
            zenity-rs-bin
            jellyfin-rpc-bin
            tfupdate-bin
            soupault-bin
            brisk-bin
            surrealdb-bin
            frpc
            frps
            godot-preview-bin
            perl-crypt-argon2
            wireguard-vanity-keygen
            kas
            gotify-tray-cpp
            nextpnr-ice40-nightly
            quran-companion
            bisq-bin
            mandelbulber2
            monado-vulkan-layers-git
            boca
            manim
            podliner-bin
            suil-optgui
            ))

;;; Nonfree license placeholder (for non-FOSS binary packages).
(define license:nonfree
  ((@@ (guix licenses) license) "Nonfree"
    "https://en.wikipedia.org/wiki/Proprietary_software"
    "Proprietary nonfree license"))

;;; Waqf General Public License 2.0 (Islamic free software license).
(define license:waqf2.0
  ((@@ (guix licenses) license) "Waqf-2.0"
    "https://ojuba.org/waqf-2.0"
    "Waqf General Public License version 2.0"))

;;; -------------------------------------------------------------------
;;; 1. git-standup — recall recent git activity
;;; -------------------------------------------------------------------
(define-public git-standup
  (package
    (name "git-standup")
    (version "2.3.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/kamranahmedse/git-standup/archive/refs/tags/"
                    version ".tar.gz"))
              (file-name (string-append "git-standup-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "PREFIX=" #$output))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (inputs (list git bash))
    (synopsis "recall what you did on the last working day")
    (description "Git-standup is a shell script that shows git log entries from
the last working day for one or more repositories.  It helps teams run quick
standup-style reviews of recent commits directly from the terminal.")
    (home-page "https://github.com/kamranahmedse/git-standup")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 2. pwnat — NAT-to-NAT tunnel tool
;;; -------------------------------------------------------------------
(define-public pwnat
  (package
    (name "pwnat")
    (version "0.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/samyk/pwnat/archive/refs/tags/v"
                    version ".tar.gz"))
              (file-name (string-append "pwnat-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags #~(list "CC=gcc")
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((bin (string-append (assoc-ref outputs "out") "/bin")))
                     (mkdir-p bin)
                     (install-file "pwnat" bin)))))))
    (synopsis "NAT-to-NAT tunnel without third-party involvement")
    (description "Pwnat is a tool that punches holes through firewalls and NATs,
allowing clients and servers behind separate NATs to communicate without any
third-party relay, port forwarding, DMZ, or UPnP.  It exploits a property of
NAT translation tables using ICMP.")
    (home-page "https://samy.pl/pwnat/")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 3. tera — terminal music radio player
;;; -------------------------------------------------------------------
(define-public tera
  (package
    (name "tera")
    (version "3.11.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/shinokada/tera/releases/download/v"
                    version "/tera_" version "_linux_amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("tera" "bin/tera"))))
    (inputs (list mpv))
    (supported-systems '("x86_64-linux"))
    (synopsis "terminal music radio player with station search")
    (description "Tera is an interactive terminal-based music radio player built
in Go.  It lets you play internet radio stations, manage favorites, and explore
new stations from the command line.  Requires mpv for audio playback.")
    (home-page "https://github.com/shinokada/tera")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 4. dotr-bin — dotfiles manager
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
    (synopsis "dotfiles manager with symlink operations")
    (description "DotR is a dotfiles manager written in Rust that manages
dotfiles via symlinks with clean and deploy operations.  It provides a simple
way to keep configuration files synchronized across machines.")
    (home-page "https://github.com/uroybd/DotR")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 5. mago-bin — PHP toolchain
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
    (synopsis "toolchain for PHP including linter and formatter")
    (description "Mago is a comprehensive PHP toolchain written in Rust that
provides linting, formatting, and static analysis.  It helps developers write
better PHP code with fast, accurate diagnostics and automated fixes.")
    (home-page "https://github.com/carthage-software/mago")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 6. zenity-rs-bin — GUI dialog boxes from CLI
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
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("zenity-rs" "bin/zenity-rs"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "display simple GUI dialogs from the command line")
    (description "Zenity-rs is a Rust rewrite of zenity that displays GTK-style
dialog boxes from shell scripts and the command line.  It supports text info,
lists, file selection, and other dialog types.")
    (home-page "https://github.com/QaidVoid/zenity-rs")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 7. jellyfin-rpc-bin — Discord presence for Jellyfin
;;; -------------------------------------------------------------------
(define-public jellyfin-rpc-bin
  (package
    (name "jellyfin-rpc-bin")
    (version "1.3.5")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Radiicall/jellyfin-rpc/releases/download/"
                    version "/jellyfin-rpc-x86_64-linux"))
              (file-name (string-append "jellyfin-rpc-" version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("jellyfin-rpc" "bin/jellyfin-rpc"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (copy-file source "jellyfin-rpc")
                   (chmod "jellyfin-rpc" #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "display Jellyfin media activity as Discord rich presence")
    (description "Jellyfin-rpc shows what you are currently watching or listening
to on Jellyfin as your Discord rich presence status.  It supports music, movies,
TV shows, and live TV with customizable display options.")
    (home-page "https://github.com/Radiicall/jellyfin-rpc")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 8. tfupdate-bin — Terraform version updater
;;; -------------------------------------------------------------------
(define-public tfupdate-bin
  (package
    (name "tfupdate-bin")
    (version "0.9.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/minamijoyo/tfupdate/releases/download/v"
                    version "/tfupdate_" version "_linux_amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("tfupdate" "bin/tfupdate"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "update version constraints in Terraform configurations")
    (description "tfupdate is a command-line tool for updating version constraints
in Terraform configurations, Terragrunt files, and other HCL files.  It
automates the process of bumping provider and module versions.")
    (home-page "https://github.com/minamijoyo/tfupdate")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 9. soupault-bin — static site generator
;;; -------------------------------------------------------------------
(define-public soupault-bin
  (package
    (name "soupault-bin")
    (version "5.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/PataphysicalSociety/soupault/releases/download/"
                    version "/soupault-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("soupault" "bin/soupault"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "static website generator based on HTML element tree rewriting")
    (description "Soupault is a static website generator that works by
manipulating the HTML element tree rather than using templates.  It can also
function as an HTML processor for post-processing existing pages.")
    (home-page "https://soupault.app")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 10. brisk-bin — fast download manager
;;; -------------------------------------------------------------------
(define-public brisk-bin
  (package
    (name "brisk-bin")
    (version "2.3.8")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/AminBhst/brisk/releases/download/v"
                    version "/Brisk-v" version "-linux-x86_64.tar.xz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "opt/brisk/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'create-wrapper
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((out (assoc-ref outputs "out")))
                     (mkdir-p (string-append out "/bin"))
                     (symlink (string-append out "/opt/brisk/brisk")
                              (string-append out "/bin/brisk"))))))))
    (inputs (list gtk+))
    (supported-systems '("x86_64-linux"))
    (synopsis "ultra-fast modern download manager for desktop")
    (description "Brisk is a fast download manager built with Dart/Flutter that
supports multi-segment downloading, browser integration, and a modern UI.  It
provides features like download queuing, speed limiting, and batch downloads.")
    (home-page "https://github.com/AminBhst/brisk")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 11. surrealdb-bin — multi-model database
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
    (synopsis "scalable distributed multi-model database")
    (description "SurrealDB is a scalable, distributed, document-graph database
for the realtime web.  It supports SQL-like querying across document, graph,
and key-value models with built-in authentication and permissions.")
    (home-page "https://surrealdb.com")
    (license license:nonfree)))

;;; -------------------------------------------------------------------
;;; 12. frpc — fast reverse proxy client
;;; -------------------------------------------------------------------
(define-public frpc
  (package
    (name "frpc")
    (version "0.68.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/fatedier/frp/releases/download/v"
                    version "/frp_" version "_linux_amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("frpc" "bin/frpc"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "fast reverse proxy client for NAT traversal")
    (description "frpc is the client component of frp, a fast reverse proxy that
exposes local servers behind NATs or firewalls to the internet.  It supports
TCP, UDP, HTTP, and HTTPS protocols with encryption and compression.")
    (home-page "https://github.com/fatedier/frp")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 13. frps — fast reverse proxy server
;;; -------------------------------------------------------------------
(define-public frps
  (package
    (name "frps")
    (version "0.68.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/fatedier/frp/releases/download/v"
                    version "/frp_" version "_linux_amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("frps" "bin/frps"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "fast reverse proxy server for NAT traversal")
    (description "frps is the server component of frp, a fast reverse proxy that
helps expose local servers behind NATs or firewalls to the internet.  It listens
for frpc client connections and routes traffic accordingly.")
    (home-page "https://github.com/fatedier/frp")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 14. godot-preview-bin — game engine preview build
;;; -------------------------------------------------------------------
(define-public godot-preview-bin
  (package
    (name "godot-preview-bin")
    (version "4.7-dev4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/godotengine/godot-builds/releases/download/"
                    version "/Godot_v" version "_linux.x86_64.zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "opt/godot-preview/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'create-wrapper
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin"))
                          (godot (car (find-files
                                       (string-append out "/opt/godot-preview")
                                       "^Godot"))))
                     (mkdir-p bin)
                     (symlink godot (string-append bin "/godot-preview"))))))))
    (native-inputs (list unzip))
    (supported-systems '("x86_64-linux"))
    (synopsis "multi-platform 2D and 3D game engine preview build")
    (description "Godot is a multi-platform 2D and 3D game engine with a fully
integrated development environment.  This package provides the latest preview
build for early testing of upcoming features.  Preview builds may be unstable.")
    (home-page "https://godotengine.org")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 15. perl-crypt-argon2 — Argon2 hashing for Perl
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
    (synopsis "perl interface to the Argon2 key derivation functions")
    (description "Crypt::Argon2 provides a Perl XS interface to the Argon2
password hashing algorithm, supporting argon2i, argon2d, and argon2id variants.
It includes functions for hashing and verifying passwords with configurable
memory cost, time cost, and parallelism.")
    (home-page "https://metacpan.org/release/Crypt-Argon2")
    (license license:asl2.0)))

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
                    version "/wireguard-vanity-keygen-linux-amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("wireguard-vanity-keygen" "bin/wireguard-vanity-keygen"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "vanity key pair generator for WireGuard")
    (description "wireguard-vanity-keygen generates WireGuard key pairs where the
public key starts with or contains a specified string pattern.  It uses parallel
goroutines for fast key generation.")
    (home-page "https://github.com/axllent/wireguard-vanity-keygen")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 17. kas — Yocto/bitbake setup tool
;;; -------------------------------------------------------------------
(define-public kas
  (package
    (name "kas")
    (version "5.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/siemens/kas/archive/refs/tags/"
                    version ".tar.gz"))
              (file-name (string-append "kas-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (propagated-inputs
     (list python-jsonschema python-pyyaml))
    (native-inputs
     (list python-setuptools python-wheel))
    (synopsis "setup tool for bitbake-based projects")
    (description "kas is a setup tool for bitbake-based projects like
Yocto/OpenEmbedded.  It configures build environments from YAML configuration
files, handling layer management, machine selection, and build parameters.")
    (home-page "https://github.com/siemens/kas")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 18. gotify-tray-cpp — desktop Gotify notification client
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
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (inputs (list qtbase))
    (native-inputs (list pkg-config))
    (synopsis "desktop notification client for Gotify servers")
    (description "gotify-tray-cpp is a C++ Qt desktop tray application for
receiving push notifications from a Gotify server via WebSockets.  It supports
native system notifications, message history, and reconnection after network
loss.")
    (home-page "https://github.com/seird/gotify-tray-cpp")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 19. nextpnr-ice40-nightly — FPGA place and route for iCE40
;;; -------------------------------------------------------------------
(define-public nextpnr-ice40-nightly
  (package
    (name "nextpnr-ice40-nightly")
    (version "0.10")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/YosysHQ/nextpnr/archive/refs/tags/nextpnr-"
                    version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:configure-flags
           #~(list "-DARCH=ice40")
           #:tests? #f))
    (inputs (list icestorm boost python))
    (native-inputs (list pkg-config))
    (synopsis "portable FPGA place and route tool for iCE40 devices")
    (description "nextpnr is a portable FPGA place and route tool supporting
multiple FPGA families.  This package provides the iCE40 target for Lattice
iCE40 FPGAs, used with Yosys for synthesis and icepack for bitstream
generation.")
    (home-page "https://github.com/YosysHQ/nextpnr")
    (license license:isc)))

;;; -------------------------------------------------------------------
;;; 20. quran-companion — desktop Quran reader
;;; -------------------------------------------------------------------
(define-public quran-companion
  (package
    (name "quran-companion")
    (version "1.5.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/0xzer0x/quran-companion")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (inputs (list qtbase qtmultimedia))
    (native-inputs (list pkg-config qttools))
    (synopsis "free desktop Quran reader and audio player")
    (description "Quran Companion is a Qt6-based desktop application for reading
and listening to the Quran.  It features verse-by-verse audio playback, multiple
reciters, tafsir and translation support, bookmarks, and search functionality.")
    (home-page "https://github.com/0xzer0x/quran-companion")
    (license license:waqf2.0)))

;;; -------------------------------------------------------------------
;;; 21. bisq-bin — decentralized bitcoin exchange
;;; -------------------------------------------------------------------
(define-public bisq-bin
  (package
    (name "bisq-bin")
    (version "2.1.10")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/bisq-network/bisq2/releases/download/v"
                    version "/Bisq-" version ".deb"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("opt" "opt/")
               ("usr" ""))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (invoke "ar" "x" source)
                   (invoke "tar" "xf" "data.tar.xz"))))))
    (native-inputs (list binutils))
    (supported-systems '("x86_64-linux"))
    (synopsis "decentralized peer-to-peer bitcoin exchange client")
    (description "Bisq is a decentralized peer-to-peer bitcoin exchange
application that allows users to trade national currencies for bitcoin without
relying on centralized exchanges.  It includes a bundled Java runtime.")
    (home-page "https://bisq.network")
    (license license:agpl3+)))

;;; -------------------------------------------------------------------
;;; 22. mandelbulber2 — 3D fractal renderer
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
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (replace 'configure
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((out (assoc-ref outputs "out")))
                     (when (file-exists? "mandelbulber2")
                       (chdir "mandelbulber2"))
                     (substitute* "mandelbulber.pro"
                       (("PREFIX = /usr")
                        (string-append "PREFIX = " out)))
                     (invoke "qmake" "mandelbulber.pro")))))))
    (inputs (list qtbase-5 libjpeg-turbo libpng libtiff gsl))
    (native-inputs (list pkg-config qttools-5))
    (synopsis "3D fractal renderer with Mandelbulb and Mandelbox support")
    (description "Mandelbulber is a 3D application designed to render 3D fractals
such as the Mandelbulb, Mandelbox, BulbBox, JuliaBulb, Menger Sponge, and
Iterated Function Systems.  It supports various rendering modes including
ray-marching and distance estimation methods.")
    (home-page "https://github.com/buddhi1980/mandelbulber2")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 23. monado-vulkan-layers-git — Vulkan layers for OpenXR
;;; -------------------------------------------------------------------
(define-public monado-vulkan-layers-git
  (package
    (name "monado-vulkan-layers-git")
    (version "0.9.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.freedesktop.org/monado/utilities/vulkan-layers.git")
                    (commit "ae43cdc")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (inputs (list vulkan-headers vulkan-loader))
    (native-inputs (list pkg-config))
    (synopsis "optional Vulkan layers for the Monado OpenXR runtime")
    (description "This package provides Vulkan layers to support additional APIs
via the Monado OpenXR runtime.  These layers enable extended functionality for
VR/XR applications using the Vulkan graphics API.")
    (home-page "https://gitlab.freedesktop.org/monado/utilities/vulkan-layers")
    (license license:boost1.0)))

;;; -------------------------------------------------------------------
;;; 24. yubikey-agent — BLOCKED
;;; -------------------------------------------------------------------
;;; Reason: Go build from source requires enumerating all Go module
;;; dependencies as individual Guix packages.  No pre-built binary
;;; releases available on GitHub.  The project uses pcsclite and
;;; pinentry at runtime, so a binary distribution is not trivial.
;;; A1: go-build-system — needs Go module dep packaging (unknown count).
;;; A2: no pre-built binaries on GitHub Releases.
;;; A3: could use `go build` with vendored deps, but Guix sandbox
;;; blocks network for `go mod download`.

;;; -------------------------------------------------------------------
;;; 25. boca — audio codec component library
;;; -------------------------------------------------------------------
(define-public boca
  (package
    (name "boca")
    (version "1.0.7")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/enzo1982/BoCA/releases/download/v"
                    version "/boca-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "PREFIX=" #$output))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (inputs (list flac libvorbis lame))
    (native-inputs (list pkg-config))
    (synopsis "audio codec component library for the fre:ac audio converter")
    (description "BoCA (Board of Components and Applications) is a component
library providing audio codec, DSP, and I/O components used by the fre:ac free
audio converter.  It supports various audio formats across multiple platforms.")
    (home-page "https://github.com/enzo1982/BoCA")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 26. manim — mathematical animation engine
;;; -------------------------------------------------------------------
(define-public manim
  (package
    (name "manim")
    (version "0.20.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ManimCommunity/manim/releases/download/v"
                    version "/manim-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (propagated-inputs
     (list python-numpy python-scipy python-pillow python-pycairo
           python-pygments python-click python-tqdm python-networkx
           ffmpeg cairo pango))
    (native-inputs
     (list python-setuptools python-wheel))
    (synopsis "animation engine for explanatory math videos")
    (description "Manim is a community-maintained Python framework for creating
mathematical animations.  It supports rendering to video and image formats, with
features for 2D/3D scenes, LaTeX integration, and programmatic animation
control.")
    (home-page "https://www.manim.community")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 27. gelly — BLOCKED
;;; -------------------------------------------------------------------
;;; Reason: Rust/Cargo project requiring all crate dependencies to be
;;; individually packaged in Guix.  Also requires very recent GTK4
;;; (>=4.20), libadwaita (>=1.8), and GStreamer (>=1.26) which may
;;; not be available in the current Guix revision.
;;; A1: cargo-build-system — needs full crate dependency enumeration.
;;; A2: no pre-built binary releases on GitHub.
;;; A3: recent GTK4/libadwaita version requirements may exceed Guix.

;;; -------------------------------------------------------------------
;;; 28. keyman — BLOCKED
;;; -------------------------------------------------------------------
;;; Reason: multi-component project with three different build systems
;;; (cmake for core C library, meson for system service, pyproject for
;;; keyman-config GUI).  Would need 3 separate packages or a complex
;;; multi-phase build.  Additionally requires many Python runtime deps
;;; (qrcode, sentry_sdk, fonttools, etc.) and IBus integration.
;;; A1: split into 3 packages — keyman-core, keyman-service, keyman-config.
;;; A2: single mega-package with multi-phase build — very complex.
;;; A3: only package keyman-config (Python) — loses core functionality.

;;; -------------------------------------------------------------------
;;; 29. podliner-bin — TUI podcast player
;;; -------------------------------------------------------------------
(define-public podliner-bin
  (package
    (name "podliner-bin")
    (version "1.2.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/timkicker/podliner/releases/download/v"
                    version "/podliner-linux-x64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("podliner" "bin/podliner"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "TUI podcast player for the terminal")
    (description "Podliner is a terminal user interface podcast player.  It
provides a keyboard-driven interface for browsing, subscribing to, and playing
podcast episodes directly from the command line.")
    (home-page "https://github.com/timkicker/podliner")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 30. suil-optgui — LV2 plugin UI library (optional GUI)
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
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:configure-flags
           #~(list "-Dcocoa=disabled"
                   "-Ddocs=disabled"
                   "-Dgtk2=disabled"
                   "-Dqt5=disabled")))
    (inputs (list lv2 gtk+ qtbase))
    (native-inputs (list pkg-config))
    (synopsis "lightweight library for loading and wrapping LV2 plugin UIs")
    (description "Suil is a library for loading and wrapping LV2 plugin UIs,
enabling Gtk and Qt hosts to embed plugin GUIs.  This variant makes GUI toolkit
dependencies optional, avoiding forced installation of unused toolkit packages.")
    (home-page "https://gitlab.com/lv2/suil")
    (license license:isc)))
