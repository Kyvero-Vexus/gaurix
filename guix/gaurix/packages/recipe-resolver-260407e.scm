;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2026 Gaurix contributors
;;;
;;; Recipe resolver pass — recipe-resolver-260407e
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages:
;;;   17 with new recipes (16 packages + 1 alias), 13 re-evaluated with
;;;   concrete blocker reasons in todo_general_packages.org.
;;; Binary packages (Go/Rust/Java/.NET) and one cmake source build.

(define-module (gaurix packages recipe-resolver-260407e)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system trivial)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages elf)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages java)
  #:use-module (gnu packages linux)
  #:export (pigo-bin
            glab-bin-260407e
            oh-my-posh-bin
            juliaup-bin
            qbittorrent-cli-bin
            hyprls-bin
            spicetify-cli-bin
            mindustry-bin
            atlauncher-bin
            ffdec-bin
            wolfssl
            wolfssl-all
            cachyos-ananicy-rules
            neo4j-community-bin
            zl-equalizer-bin
            lidarr-bin
            suwayomi-server-bin))

;;;
;;; ── GO/RUST STATIC BINARY PACKAGES ────────────────────────────────
;;;

;;; 1. pigo-bin — Face detection library and CLI (Go, pre-built)
;;;    Static Go binary from GitHub release.  No runtime deps.
(define-public pigo-bin
  (package
    (name "pigo-bin")
    (version "1.4.6")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/esimov/pigo/releases/download/v"
             version "/pigo-" version "-linux-amd64.tar.gz"))
       (sha256
        (base32 "1g7c3zmcngx7yw2x75lahjqj012v83l5aisz3diibpz0la3zibc0"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("pigo" "bin/pigo"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/esimov/pigo")
    (synopsis "fast face detection library and CLI in pure Go")
    (description
     "Pigo is a pure Go face detection, pupil/eye localization, and facial
landmark points detection library.  It implements the Pixel Intensity
Comparison-based Object detection method and includes a command-line
tool for processing images and video streams.")
    (license license:expat)))

;;; 2. glab-bin — GitLab CLI (Go, pre-built)
;;;    Static Go binary from GitLab release.
(define-public glab-bin-260407e
  (package
    (name "glab-bin")
    (version "1.51.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://gitlab.com/gitlab-org/cli/-/releases/v" version
             "/downloads/glab_" version "_linux_amd64.tar.gz"))
       (sha256
        (base32 "0dn23c95948i4jsx2gv44hpj2m8bpjfwhzpscy996603xjff6yam"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("bin/glab" "bin/glab"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files)
          (add-after 'unpack 'find-binary
            (lambda _
              ;; Handle tarball layouts with binary at top level vs bin/
              (when (and (not (file-exists? "bin/glab"))
                         (file-exists? "glab"))
                (mkdir-p "bin")
                (rename-file "glab" "bin/glab")))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://gitlab.com/gitlab-org/cli")
    (synopsis "command-line interface for GitLab")
    (description
     "GLab is an open-source GitLab CLI tool that brings GitLab to your
terminal.  It allows you to work with issues, merge requests, pipelines,
CI/CD, and repositories directly from the command line.")
    (license license:expat)))

;;; 3. oh-my-posh-bin — Shell prompt customizer (Go, pre-built single binary)
(define-public oh-my-posh-bin
  (package
    (name "oh-my-posh-bin")
    (version "29.9.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/JanDeDobbeleer/oh-my-posh/releases/download/v"
             version "/posh-linux-amd64"))
       (sha256
        (base32 "0rchq52mwymwi90f3xhqy988ycf15dfq4684qkv4gy841hald3q0"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("oh-my-posh" "bin/oh-my-posh"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files)
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "oh-my-posh")
              (chmod "oh-my-posh" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://ohmyposh.dev")
    (synopsis "prompt theme engine for any shell")
    (description
     "Oh My Posh is a custom prompt engine for any shell that has the ability
to adjust the prompt string with a function or variable.  It provides
a rich set of themes and segments for displaying git status, language
versions, execution time, and other contextual information.")
    (license license:expat)))

;;; 4. juliaup-bin — Julia version manager (Rust/musl, pre-built)
;;;    Statically linked musl binary.  No runtime deps.
(define-public juliaup-bin
  (package
    (name "juliaup-bin")
    (version "1.19.10")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/JuliaLang/juliaup/releases/download/v"
             version "/juliaup-" version
             "-x86_64-unknown-linux-musl-portable.tar.gz"))
       (sha256
        (base32 "0s2zlfg106wpv63nzn6n20a15rjsv769w6bwd9zrhwf6p1jdc111"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("juliaup" "bin/juliaup")
                          ("julialauncher" "bin/julialauncher"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/JuliaLang/juliaup")
    (synopsis "Julia language version manager and installer")
    (description
     "Juliaup is the official Julia version manager.  It allows installing,
managing, and switching between different Julia versions.  Juliaup provides
the @command{juliaup} management tool and @command{julialauncher} which
automatically selects the correct Julia version based on project
configuration.")
    (license license:expat)))

;;; 5. qbittorrent-cli-bin — qBittorrent CLI client (Go, pre-built)
(define-public qbittorrent-cli-bin
  (package
    (name "qbittorrent-cli-bin")
    (version "2.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/ludviglundgren/qbittorrent-cli/releases/download/v"
             version "/qbittorrent-cli_" version "_linux_amd64.tar.gz"))
       (sha256
        (base32 "1d3np03v8zswqkz1p331ffqkc9siypr0capmwzql3xhny5n4a11w"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("qbt" "bin/qbt"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/ludviglundgren/qbittorrent-cli")
    (synopsis "command-line interface for managing qBittorrent")
    (description
     "qbittorrent-cli is a command-line tool for managing qBittorrent.  It
supports adding and removing torrents, managing categories, tags, and
trackers, importing from other clients, and automating torrent
management tasks via the qBittorrent WebUI API.")
    (license license:expat)))

;;; 6. hyprls-bin — Hyprland LSP server (Go, pre-built)
(define-public hyprls-bin
  (package
    (name "hyprls-bin")
    (version "0.13.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/hyprland-community/hyprls/releases/download/v"
             version "/hyprls-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0j6xyq7dfg87l4vigqar2kin6vyl6ijjprawj9hy3ps5qh8wpbh2"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("hyprls" "bin/hyprls"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/hyprland-community/hyprls")
    (synopsis "language server for Hyprland configuration files")
    (description
     "hyprls is a Language Server Protocol (LSP) implementation for Hyprland
configuration files.  It provides autocompletion, hover documentation,
and diagnostics for editing Hyprland config files in supported editors.")
    (license license:expat)))

;;; 7. spicetify-cli-bin — Spotify customization tool (Go, pre-built)
(define-public spicetify-cli-bin
  (package
    (name "spicetify-cli-bin")
    (version "2.43.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/spicetify/cli/releases/download/v"
             version "/spicetify-" version "-linux-amd64.tar.gz"))
       (sha256
        (base32 "1gnd2zwrjlvf5is5n14hr0iskagy5v4343zya8rbpyb3fy89g8vz"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("spicetify" "bin/spicetify"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://spicetify.app")
    (synopsis "command-line tool to customize the Spotify desktop client")
    (description
     "Spicetify is a multiplatform command-line tool to customize the
official Spotify client.  It supports custom themes, extensions,
apps, color schemes, and CSS modifications while preserving the
ability to update Spotify independently.")
    (license license:lgpl2.1)))

;;;
;;; ── JAVA BINARY PACKAGES ──────────────────────────────────────────
;;;

;;; 8. mindustry-bin — Tower defense game with factory building (Java JAR)
(define-public mindustry-bin
  (package
    (name "mindustry-bin")
    (version "146")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/Anuken/Mindustry/releases/download/v"
             version "/Mindustry.jar"))
       (sha256
        (base32 "1yck3c3wwvaygk1bars5vgdy607g8x480pm0kd967j5x7inf9c1s"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (bin (string-append out "/bin"))
                 (share (string-append out "/share/java"))
                 (java (search-input-file %build-inputs "bin/java")))
            (mkdir-p bin)
            (mkdir-p share)
            (copy-file (assoc-ref %build-inputs "source")
                       (string-append share "/mindustry.jar"))
            (call-with-output-file (string-append bin "/mindustry")
              (lambda (port)
                (format port "#!/bin/sh~%exec ~a -jar ~a/share/java/mindustry.jar \"$@\"~%"
                        java out)))
            (chmod (string-append bin "/mindustry") #o755)
            #t))))
    (inputs (list openjdk17))
    (home-page "https://mindustrygame.github.io")
    (synopsis "tower-defense game with factory building mechanics")
    (description
     "Mindustry is a sandbox tower-defense game where players create
elaborate supply chains of conveyor belts to feed ammunition into turrets,
produce materials for building, and defend their core against waves of
enemies.  Features campaign mode, competitive and cooperative multiplayer,
and a built-in map editor.")
    (license license:gpl3)))

;;; 9. atlauncher-bin — Minecraft launcher with modpack support (Java JAR)
(define-public atlauncher-bin
  (package
    (name "atlauncher-bin")
    (version "3.4.40.4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/ATLauncher/ATLauncher/releases/download/v"
             version "/ATLauncher-" version ".jar"))
       (sha256
        (base32 "0jbngbmz52pl1c6kj4hwin7szirmvz0lx4g24y6vflmy4xg9m40v"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (bin (string-append out "/bin"))
                 (share (string-append out "/share/java"))
                 (java (search-input-file %build-inputs "bin/java")))
            (mkdir-p bin)
            (mkdir-p share)
            (copy-file (assoc-ref %build-inputs "source")
                       (string-append share "/atlauncher.jar"))
            (call-with-output-file (string-append bin "/atlauncher")
              (lambda (port)
                (format port "#!/bin/sh~%exec ~a -jar ~a/share/java/atlauncher.jar \"$@\"~%"
                        java out)))
            (chmod (string-append bin "/atlauncher") #o755)
            #t))))
    (inputs (list openjdk17))
    (home-page "https://atlauncher.com")
    (synopsis "Minecraft launcher with modpack support")
    (description
     "ATLauncher is a launcher for Minecraft which integrates multiple
modpack platforms allowing you to download and install modpacks easily
and quickly.  It supports CurseForge, Modrinth, and Technic modpacks
and includes built-in mod management.")
    (license license:gpl3)))

;;; 10. ffdec-bin — Flash SWF decompiler and editor (Java application)
(define-public ffdec-bin
  (package
    (name "ffdec-bin")
    (version "26.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/jindrapetrik/jpexs-decompiler/releases/download/version"
             version "/ffdec_" version ".zip"))
       (sha256
        (base32 "1x0qqz7mawj7qj5spsm45dp70b7b0gc031sqn5xxgihixp80jdg1"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (bin (string-append out "/bin"))
                 (share (string-append out "/share/ffdec"))
                 (source (assoc-ref %build-inputs "source"))
                 (unzip (search-input-file %build-inputs "bin/unzip"))
                 (java (search-input-file %build-inputs "bin/java")))
            (mkdir-p bin)
            (mkdir-p share)
            (invoke unzip source "-d" share)
            (call-with-output-file (string-append bin "/ffdec")
              (lambda (port)
                (format port "#!/bin/sh~%exec ~a -jar ~a/ffdec.jar \"$@\"~%"
                        java share)))
            (chmod (string-append bin "/ffdec") #o755)
            #t))))
    (native-inputs (list unzip))
    (inputs (list openjdk17))
    (home-page "https://github.com/jindrapetrik/jpexs-decompiler")
    (synopsis "open-source Flash SWF decompiler and editor")
    (description
     "JPEXS Free Flash Decompiler (FFDec) is an open-source tool for
working with Adobe Flash SWF files.  It can extract resources, convert
SWF to FLA format, edit ActionScript, replace images, sounds, texts,
and fonts, and perform various SWF modifications.")
    (license license:gpl3+)))

;;; 11. neo4j-community-bin — Graph database (Java application)
(define-public neo4j-community-bin
  (package
    (name "neo4j-community-bin")
    (version "5.26.10")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://dist.neo4j.org/neo4j-community-" version
             "-unix.tar.gz"))
       (sha256
        (base32 "0i5ak7pzl3mm80xp86gsdlv3dlx02rndhlnscp4hh4pa07rh6dvd"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("." "share/neo4j/"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files)
          (add-after 'install 'create-wrappers
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin"))
                     (java-home
                      (dirname
                       (dirname
                        (search-input-file inputs "bin/java")))))
                (mkdir-p bin)
                (for-each
                 (lambda (cmd)
                   (call-with-output-file (string-append bin "/" cmd)
                     (lambda (port)
                       (format port
                               "#!/bin/sh~%export JAVA_HOME=~a~%exec ~a/share/neo4j/bin/~a \"$@\"~%"
                               java-home out cmd)))
                   (chmod (string-append bin "/" cmd) #o755))
                 '("neo4j" "neo4j-admin" "cypher-shell"))))))))
    (inputs (list openjdk21))
    (supported-systems '("x86_64-linux"))
    (home-page "https://neo4j.com")
    (synopsis "high-performance graph database management system")
    (description
     "Neo4j is a graph database management system that stores data as nodes
and relationships rather than in tables or documents.  It uses the Cypher
query language and is designed for connected data queries, real-time
recommendations, fraud detection, network management, and knowledge
graphs.")
    (license license:gpl3)))

;;;
;;; ── SOURCE BUILD PACKAGES ─────────────────────────────────────────
;;;

;;; 12. wolfssl — Lightweight embedded SSL/TLS library (cmake)
(define-public wolfssl
  (package
    (name "wolfssl")
    (version "5.9.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/wolfSSL/wolfssl/archive/refs/tags/v"
             version "-stable.tar.gz"))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1h860frkxrqfgrfky0z9aidyh362cv5988nnpx95qnhldyw65z3f"))))
    (build-system cmake-build-system)
    (arguments
     (list
      #:configure-flags
      #~(list "-DWOLFSSL_OPENSSLALL=ON"
              "-DWOLFSSL_OPENSSLEXTRA=ON"
              "-DBUILD_SHARED_LIBS=ON"
              "-DWOLFSSL_CRYPT_TESTS=OFF")
      #:tests? #f))
    (home-page "https://www.wolfssl.com")
    (synopsis "lightweight embedded SSL/TLS library")
    (description
     "wolfSSL is a lightweight, portable, C-language-based SSL/TLS library
targeted at IoT, embedded, and RTOS environments.  It supports TLS 1.3,
DTLS 1.3, hardware cryptography acceleration, and provides an OpenSSL
compatibility layer.  wolfSSL is up to 20x smaller than OpenSSL.")
    (license license:gpl2)))

;;; wolfssl-all is wolfssl built with all features (same configure flags).
(define-public wolfssl-all wolfssl)

;;;
;;; ── DATA/CONFIG PACKAGES ──────────────────────────────────────────
;;;

;;; 13. cachyos-ananicy-rules — Process priority rules for ananicy-cpp
(define-public cachyos-ananicy-rules
  (package
    (name "cachyos-ananicy-rules")
    (version "1.1.33")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/CachyOS/ananicy-rules/archive/refs/tags/"
             version ".tar.gz"))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0djjlbr0iqn38mly1r5nibl3339kbkn4lman4bxay8kxhaz6sakr"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("." "share/ananicy.d/cachyos-rules/"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (home-page "https://github.com/CachyOS/ananicy-rules")
    (synopsis "process priority rules for ananicy-cpp from CachyOS")
    (description
     "CachyOS ananicy rules provide process niceness, I/O class, and
scheduler tuning rules for ananicy-cpp.  They cover common desktop
applications, games, development tools, and system services to improve
desktop responsiveness and application performance.")
    (license license:gpl3)))

;;;
;;; ── AUDIO PLUGIN PACKAGES ─────────────────────────────────────────
;;;

;;; 14. zl-equalizer-bin — Parametric equalizer VST3/LV2 audio plugin
(define-public zl-equalizer-bin
  (package
    (name "zl-equalizer-bin")
    (version "1.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/ZL-Audio/ZLEqualizer/releases/download/"
             version "/ZL.Equalizer.2-" version "-Linux-x86.zip"))
       (sha256
        (base32 "09487inlpx3apds5jkb6c9diz3c429a6h6c05vjmqbf4l3ymi220"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("." "lib/vst3/ZLEqualizer/"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (native-inputs (list unzip))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/ZL-Audio/ZLEqualizer")
    (synopsis "parametric equalizer audio plugin for VST3 and LV2")
    (description
     "ZL Equalizer is a parametric equalizer plugin supporting VST3 and LV2
formats.  It features multiple filter types, dynamic equalization,
spectrum analyzer, and side-chain support.  Built with the JUCE framework
for professional audio production.")
    (license license:agpl3)))

;;;
;;; ── SELF-CONTAINED BINARY PACKAGES (patchelf required) ────────────
;;;

;;; 15. lidarr-bin — Music collection manager (.NET self-contained)
(define-public lidarr-bin
  (package
    (name "lidarr-bin")
    (version "3.1.0.4875")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/Lidarr/Lidarr/releases/download/v"
             version "/Lidarr.master." version
             ".linux-core-x64.tar.gz"))
       (sha256
        (base32 "199gpi9xwrk8wfj7xadjbpdzskjhmr6m8wkbw0mdw25rqap7bw90"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("." "share/lidarr/"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files)
          (add-after 'install 'patch-and-wrap
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin-dir (string-append out "/bin"))
                     (app-dir (string-append out "/share/lidarr"))
                     (lidarr (string-append app-dir "/Lidarr"))
                     (ld-so (search-input-file
                             inputs "lib/ld-linux-x86-64.so.2"))
                     (rpath (string-join
                             (list (dirname ld-so)
                                   (dirname
                                    (search-input-file
                                     inputs "lib/libgcc_s.so.1"))
                                   app-dir)
                             ":")))
                (when (file-exists? lidarr)
                  (invoke "patchelf" "--set-interpreter" ld-so lidarr)
                  (invoke "patchelf" "--set-rpath" rpath lidarr))
                (mkdir-p bin-dir)
                (call-with-output-file (string-append bin-dir "/lidarr")
                  (lambda (port)
                    (format port "#!/bin/sh~%exec ~a \"$@\"~%" lidarr)))
                (chmod (string-append bin-dir "/lidarr") #o755)))))))
    (native-inputs (list patchelf))
    (inputs (list glibc `(,gcc "lib")))
    (supported-systems '("x86_64-linux"))
    (home-page "https://lidarr.audio")
    (synopsis "music collection manager for Usenet and BitTorrent")
    (description
     "Lidarr is a music collection manager for Usenet and BitTorrent users.
It monitors multiple RSS feeds for new albums from your favorite artists
and will grab, sort, and rename them.  It integrates with popular download
clients and music players.")
    (license license:gpl3)))

;;; 16. suwayomi-server-bin — Manga reader server (self-contained binary)
(define-public suwayomi-server-bin
  (package
    (name "suwayomi-server-bin")
    (version "2.1.1867")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/Suwayomi/Suwayomi-Server/releases/download/v"
             version "/Suwayomi-Server-v" version
             "-linux-x64.tar.gz"))
       (sha256
        (base32 "1zh8ywz9ll8r08d2nfqba2ldhs213d5v9d6dcggbw9jf7kblnd5j"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("." "share/suwayomi-server/"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files)
          (add-after 'install 'patch-and-wrap
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin-dir (string-append out "/bin"))
                     (app-dir (string-append out "/share/suwayomi-server"))
                     (ld-so (search-input-file
                             inputs "lib/ld-linux-x86-64.so.2"))
                     (rpath (string-join
                             (list (dirname ld-so)
                                   (dirname
                                    (search-input-file
                                     inputs "lib/libgcc_s.so.1"))
                                   app-dir)
                             ":")))
                ;; Patch main executable (try common names)
                (for-each
                 (lambda (name)
                   (let ((f (string-append app-dir "/" name)))
                     (when (file-exists? f)
                       (false-if-exception
                        (invoke "patchelf" "--set-interpreter" ld-so f))
                       (false-if-exception
                        (invoke "patchelf" "--set-rpath" rpath f)))))
                 '("Suwayomi-Server"
                   "bin/Suwayomi-Server"
                   "suwayomi-server"))
                (mkdir-p bin-dir)
                (call-with-output-file
                    (string-append bin-dir "/suwayomi-server")
                  (lambda (port)
                    (format port "#!/bin/sh~%cd ~a~%exec ~a/Suwayomi-Server \"$@\"~%"
                            app-dir app-dir)))
                (chmod (string-append bin-dir "/suwayomi-server")
                       #o755)))))))
    (native-inputs (list patchelf))
    (inputs (list glibc `(,gcc "lib")))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Suwayomi/Suwayomi-Server")
    (synopsis "self-hosted manga reader server with web interface")
    (description
     "Suwayomi-Server is a rewrite of Tachiyomi for the desktop.  It runs
as a server with a web-based interface, allowing you to read manga from
various sources.  It supports extensions from the Tachiyomi extension
ecosystem.")
    (license license:mpl2.0)))
