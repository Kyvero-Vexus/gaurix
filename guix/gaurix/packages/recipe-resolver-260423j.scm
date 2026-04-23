;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260423j
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages.
;;;
;;; New recipes (30):
;;;        1.  feluda-bin (copy-build-system, v1.12.0, MIT)
;;;        2.  wasmrun-bin (copy-build-system, v0.15.2, MIT)
;;;        3.  teleport-client-bin (copy-build-system, v18.7.1, Apache-2.0)
;;;        4.  tuios-web-bin (copy-build-system, v0.7.0, MIT)
;;;        5.  scorecard-bin (copy-build-system, v5.4.0, Apache-2.0)
;;;        6.  natscli-bin (copy-build-system, v0.3.2, Apache-2.0)
;;;        7.  daylight-bin (copy-build-system, v1.3.0, GPL-3.0)
;;;        8.  lact-headless-bin (copy-build-system, v0.8.2, MIT)
;;;        9.  clipvault-bin (copy-build-system, v1.1.1, AGPL-3.0)
;;;       10.  tug-bin (copy-build-system, v0.0.19, BSD-2)
;;;       11.  garden-bin (copy-build-system, v0.23.0, MIT)
;;;       12.  buttery-bin (copy-build-system, v0.0.26, BSD-2)
;;;       13.  chandler-bin (copy-build-system, v0.0.10, BSD-2)
;;;       14.  cargo-visualize-bin (copy-build-system, v2.2.0, GPL-3.0+)
;;;       15.  jarl-bin (copy-build-system, v0.5.0, MIT)
;;;       16.  proton-drive-sync-bin (copy-build-system, v0.2.4, GPL-3.0)
;;;       17.  lean-ctx-bin (copy-build-system, v3.3.4, Apache-2.0)
;;;       18.  firebase-tools-bin (copy-build-system, v15.14.0, MIT)
;;;       19.  qbittorrent-cli-bin (copy-build-system, v1.8.24285.1, MIT)
;;;       20.  capacities-appimage (copy-build-system, v1.62.2, nonfree)
;;;       21.  dataflare-bin (copy-build-system, v2.10.2, nonfree)
;;;       22.  edex-ui-bin (copy-build-system, v2.2.8, GPL-3.0)
;;;       23.  sourcegit-bin (copy-build-system, v2026.09, MIT)
;;;       24.  clash-verge-rev-autobuild-bin (copy-build-system, v2.4.8, GPL-3.0)
;;;       25.  piliplus-bin (copy-build-system, v2.0.4, GPL-3.0+)
;;;       26.  koofr-desktop-bin (copy-build-system, v41a82e7, nonfree)
;;;       27.  gmodpatchtool-bin (copy-build-system, v20251102, GPL-3.0)
;;;       28.  bibata-modern-classic-cursor-theme (copy-build-system, v2.0.7, GPL-3.0+)
;;;       29.  systemd-cron (gnu-build-system, v2.7.0, MIT)
;;;       30.  android-messages-desktop-bin (copy-build-system, v6.0.1, MIT)
;;;
;;; NOTE: All sha256 hashes are from AUR PKGBUILDs (verified against upstream).

(define-module (gaurix packages recipe-resolver-260423j)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:export (
            feluda-bin
            wasmrun-bin
            teleport-client-bin
            tuios-web-bin
            scorecard-bin
            natscli-bin
            daylight-bin
            lact-headless-bin
            clipvault-bin
            tug-bin
            garden-bin
            buttery-bin
            chandler-bin
            cargo-visualize-bin
            jarl-bin
            proton-drive-sync-bin
            lean-ctx-bin
            firebase-tools-bin
            qbittorrent-cli-bin
            capacities-appimage
            dataflare-bin
            edex-ui-bin
            sourcegit-bin
            clash-verge-rev-autobuild-bin
            piliplus-bin
            koofr-desktop-bin
            gmodpatchtool-bin
            bibata-modern-classic-cursor-theme
            systemd-cron
            android-messages-desktop-bin
            ))

;;; -------------------------------------------------------------------
;;; 1. feluda-bin --- license usage restriction detector (binary)
;;; -------------------------------------------------------------------
(define-public feluda-bin
  (package
    (name "feluda-bin")
    (version "1.12.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/anistark/feluda/releases/download/v"
                    version "/feluda-v" version "-x86_64.deb"))
              (sha256
               (base32 "1fy5mnswsi23iyd114j5q4l3fprc1yy4wmflnva09aws41jk138l"))))
    (build-system copy-build-system)
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (invoke "ar" "x" source)
                   (invoke "tar" "xf" "data.tar.xz"))))
           #:install-plan #~'(("usr/bin/feluda" "bin/"))))
    (native-inputs (list binutils))
    (synopsis "detect license usage restrictions in your project")
    (description "Feluda is a command-line tool that scans project dependencies
and detects license usage restrictions.  It identifies potentially problematic
licenses in the dependency tree to help ensure legal compliance.")
    (home-page "https://github.com/anistark/feluda")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 2. wasmrun-bin --- WebAssembly runner for browsers (binary)
;;; -------------------------------------------------------------------
(define-public wasmrun-bin
  (package
    (name "wasmrun-bin")
    (version "0.15.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/anistark/wasmrun/releases/download/v"
                    version "/wasmrun-v" version "-x86_64.deb"))
              (sha256
               (base32 "08wkw2pw50ax4p7wa803rf6ghgnzyra7gfdbzdbr71cml1v2wmm2"))))
    (build-system copy-build-system)
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (invoke "ar" "x" source)
                   (invoke "tar" "xf" "data.tar.xz"))))
           #:install-plan #~'(("usr/bin/wasmrun" "bin/"))))
    (native-inputs (list binutils))
    (synopsis "run WebAssembly instantly in your browser")
    (description "Wasmrun serves WebAssembly files through a local web server,
enabling instant browser-based testing with a single command.  It provides a
development workflow for previewing WASM applications locally.")
    (home-page "https://github.com/anistark/wasmrun")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 3. teleport-client-bin --- Teleport VPN access tools (binary)
;;; -------------------------------------------------------------------
(define-public teleport-client-bin
  (package
    (name "teleport-client-bin")
    (version "18.7.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://cdn.teleport.dev/teleport-v" version
                    "-linux-amd64-bin.tar.gz"))
              (sha256
               (base32 "0f5ax0j21gfiv5dl0mq8pxx7l7j9pzczcyr4s6y0hv3kz1367dj5"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("teleport/tsh" "bin/")
                              ("teleport/tctl" "bin/"))))
    (synopsis "client tools for Teleport secure infrastructure access")
    (description "Teleport client provides @command{tsh} and @command{tctl}
for secure access to SSH servers, Kubernetes clusters, databases, and web
applications through the Teleport identity-aware access proxy.")
    (home-page "https://github.com/gravitational/teleport")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 4. tuios-web-bin --- web terminal server (binary)
;;; -------------------------------------------------------------------
(define-public tuios-web-bin
  (package
    (name "tuios-web-bin")
    (version "0.7.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Gaurav-Gosain/tuios/releases/download/v"
                    version "/tuios-web_" version "_Linux_x86_64.tar.gz"))
              (sha256
               (base32 "03qa370sd0v4vbnkvh7ldcr0s8i83didnr86cy8v8h0f2srkpw9c"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("tuios-web" "bin/"))))
    (synopsis "web terminal server for TUIOS")
    (description "Tuios-web serves TUIOS terminal applications through the
browser, providing a web-based interface for accessing terminal programs
remotely.")
    (home-page "https://github.com/Gaurav-Gosain/tuios")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 5. scorecard-bin --- OpenSSF security scorecard (binary)
;;; -------------------------------------------------------------------
(define-public scorecard-bin
  (package
    (name "scorecard-bin")
    (version "5.4.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ossf/scorecard/releases/download/v"
                    version "/scorecard_" version "_linux_amd64.tar.gz"))
              (sha256
               (base32 "00kmwvxqvs1a89ayc96akbpy12q3w6rxx9hqffxqym5alpm3l675"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("scorecard" "bin/"))))
    (synopsis "security health metrics for open source projects")
    (description "Scorecard is a tool from the OpenSSF that assesses open
source projects for security risks.  It runs automated checks against
repositories to evaluate practices like branch protection, dependency
pinning, and vulnerability management.")
    (home-page "https://scorecard.dev")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 6. natscli-bin --- NATS command line interface (binary)
;;; -------------------------------------------------------------------
(define-public natscli-bin
  (package
    (name "natscli-bin")
    (version "0.3.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nats-io/natscli/releases/download/v"
                    version "/nats-" version "-linux-amd64.zip"))
              (sha256
               (base32 "19wb51vrrlcdpbxkkr1kav7hcqvyqbk5c5kbhfq75m8m71f2p55y"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list (string-append "nats-" #$version "-linux-amd64/nats")
                         "bin/"))))
    (native-inputs (list unzip))
    (synopsis "command line interface for NATS messaging")
    (description "The NATS CLI provides a unified interface for interacting
with NATS messaging servers.  It supports publishing and subscribing to
subjects, managing streams and consumers for JetStream, and administering
NATS server configurations.")
    (home-page "https://github.com/nats-io/natscli")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 7. daylight-bin --- sunrise and sunset tracker (binary)
;;; -------------------------------------------------------------------
(define-public daylight-bin
  (package
    (name "daylight-bin")
    (version "1.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/jbreckmckye/daylight/releases/download/v"
                    version "/daylight_Linux_x86_64.tar.gz"))
              (sha256
               (base32 "1g4anb77d57ip0zlx8fm4sm2cmnn66z3a6lj25ihp41dln929bzg"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("daylight" "bin/"))))
    (synopsis "track sunrise and sunset times from the command line")
    (description "Daylight is a command-line program for tracking sunrise and
sunset times.  It displays current daylight information for any location and
can be used to automate light-dependent tasks.")
    (home-page "https://github.com/jbreckmckye/daylight")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 8. lact-headless-bin --- Linux GPU configuration tool (binary)
;;; -------------------------------------------------------------------
(define-public lact-headless-bin
  (package
    (name "lact-headless-bin")
    (version "0.8.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ilya-zlobintsev/LACT/releases/download/v"
                    version "/lact-headless-" version
                    "-0.amd64.ubuntu-2404.deb"))
              (sha256
               (base32 "14r2c3j7azzkgyialzv7gkc4zwzr5qfk5xcs0p5zp2xpw7spfzi2"))))
    (build-system copy-build-system)
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (invoke "ar" "x" source)
                   (invoke "tar" "xf"
                           (if (file-exists? "data.tar.zst")
                               "data.tar.zst"
                               "data.tar.xz")))))
           #:install-plan #~'(("usr/bin/" "bin/")
                              ("usr/lib/" "lib/"))))
    (native-inputs (list binutils zstd))
    (synopsis "headless Linux AMDGPU configuration tool")
    (description "LACT is a Linux AMDGPU controller that provides fan curve
management, overclocking, power limit adjustment, and monitoring.  The
headless variant runs as a daemon without a GUI, suitable for servers and
remote management.")
    (home-page "https://github.com/ilya-zlobintsev/LACT")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 9. clipvault-bin --- clipboard history manager (binary)
;;; -------------------------------------------------------------------
(define-public clipvault-bin
  (package
    (name "clipvault-bin")
    (version "1.1.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Rolv-Apneseth/clipvault/releases/download/v"
                    version "/clipvault-x86_64-unknown-linux-gnu.tar.gz"))
              (sha256
               (base32 "0i56yj7xgxsmk2rz8y5xs312i8xalqq5psjblzgp8ixd56lf5f6y"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("clipvault" "bin/"))))
    (synopsis "clipboard history manager for Wayland")
    (description "ClipVault is a clipboard history manager for Wayland
compositors, inspired by cliphist.  It stores clipboard entries in a database
and provides a searchable interface for retrieving previous clipboard
contents.")
    (home-page "https://github.com/Rolv-Apneseth/clipvault")
    (license license:agpl3)))

;;; -------------------------------------------------------------------
;;; 10. tug-bin --- Docker rescue tool (binary)
;;; -------------------------------------------------------------------
(define-public tug-bin
  (package
    (name "tug-bin")
    (version "0.0.19")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/mcandre/tug/releases/download/v"
                    version "/tug-" version ".tgz"))
              (sha256
               (base32 "0274ml2f1sf59w76y6xqkrrq8sp5g4ij4qvs5w52shw4wpbzkzan"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list (string-append "tug-" #$version "/linux/amd64/tug")
                         "bin/"))))
    (synopsis "multi-platform Docker rescue tool")
    (description "Tug is a command-line tool for rescuing and managing Docker
containers across multiple platforms.  It provides utilities for inspecting,
repairing, and migrating container environments.")
    (home-page "https://github.com/mcandre/tug")
    (license license:bsd-2)))

;;; -------------------------------------------------------------------
;;; 11. garden-bin --- interactive programming language (binary)
;;; -------------------------------------------------------------------
(define-public garden-bin
  (package
    (name "garden-bin")
    (version "0.23.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Wilfred/garden/releases/download/"
                    version "/garden-x86_64-unknown-linux-gnu.tar.gz"))
              (sha256
               (base32 "1r2f5a78whsxyy4s5cnlj3f3zlxr0irjrhnsrm9z6jzk6aqfjmq0"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("garden" "bin/"))))
    (synopsis "interactive programming language for exploring code")
    (description "Garden is a programming language designed for interactive
exploration and experimentation.  It provides a REPL-driven workflow with
type checking and pattern matching for rapid prototyping.")
    (home-page "https://github.com/Wilfred/garden")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 12. buttery-bin --- video editor with motion smoothing (binary)
;;; -------------------------------------------------------------------
(define-public buttery-bin
  (package
    (name "buttery-bin")
    (version "0.0.26")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/mcandre/buttery/releases/download/v"
                    version "/buttery-linux-amd64.tgz"))
              (sha256
               (base32 "15wqyzn2c3y9b3sh7j89by1w6zwc51sh511ij98zw9y7nv70qnja"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("buttery" "bin/"))))
    (synopsis "video editor with manual motion smoothing")
    (description "Buttery is a video editor focused on manual motion
smoothing.  It provides tools for stabilizing and smoothing video footage
through user-guided interpolation.")
    (home-page "https://github.com/mcandre/buttery")
    (license license:bsd-2)))

;;; -------------------------------------------------------------------
;;; 13. chandler-bin --- TAR normalizer (binary)
;;; -------------------------------------------------------------------
(define-public chandler-bin
  (package
    (name "chandler-bin")
    (version "0.0.10")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/mcandre/chandler/releases/download/v"
                    version "/chandler-x86_64-unknown-linux-musl.tgz"))
              (sha256
               (base32 "1g6dqg92qi1j8q2b3l5k9k5ciwvr5y2m22h580a2gn2rkfqrq276"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("chandler" "bin/"))))
    (synopsis "TAR archive normalizer for reproducible builds")
    (description "Chandler normalizes TAR archives by stripping timestamps,
user IDs, and other non-deterministic metadata.  This produces identical
archives from identical file trees, supporting reproducible build
workflows.")
    (home-page "https://github.com/mcandre/chandler")
    (license license:bsd-2)))

;;; -------------------------------------------------------------------
;;; 14. cargo-visualize-bin --- Cargo dependency graph visualizer (binary)
;;; -------------------------------------------------------------------
(define-public cargo-visualize-bin
  (package
    (name "cargo-visualize-bin")
    (version "2.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/kxxt/cargo-visualize/releases/download/v"
                    version "/cargo-visualize-x86_64-unknown-linux-gnu.tar.xz"))
              (sha256
               (base32 "0naqmrcc8xv8wvlwrxnn6vzq1mbrjxrd9vs2lmrj5ampmzmzfqlm"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("cargo-visualize-x86_64-unknown-linux-gnu/cargo-visualize"
                "bin/"))))
    (synopsis "interactive cargo dependency graph visualization")
    (description "Cargo-visualize generates interactive visualizations of Rust
crate dependency graphs.  It analyzes @file{Cargo.lock} files and produces
browsable dependency trees to help understand complex dependency chains.")
    (home-page "https://github.com/kxxt/cargo-visualize")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 15. jarl-bin --- fast linter for R (binary)
;;; -------------------------------------------------------------------
(define-public jarl-bin
  (package
    (name "jarl-bin")
    (version "0.5.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/etiennebacher/jarl/releases/download/"
                    version "/jarl-x86_64-unknown-linux-gnu.tar.gz"))
              (sha256
               (base32 "1ak0f2ql0458cqf9pw4pgl3jzxpl92lyz50d3gdpnckbpdylxhki"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list (string-append "jarl-x86_64-unknown-linux-gnu/jarl")
                         "bin/"))))
    (synopsis "fast linter for the R programming language")
    (description "Jarl is a fast linter for R code, implemented in Rust.  It
checks R source files for common style issues, syntax problems, and potential
errors without requiring an R installation.")
    (home-page "https://github.com/etiennebacher/jarl")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 16. proton-drive-sync-bin --- Proton Drive sync client (binary)
;;; -------------------------------------------------------------------
(define-public proton-drive-sync-bin
  (package
    (name "proton-drive-sync-bin")
    (version "0.2.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/DamianB-BitFlipper/proton-drive-sync/"
                    "releases/download/v" version
                    "/proton-drive-sync-linux-x64.tar.gz"))
              (sha256
               (base32 "150r60l14dpcgg1la4k0mnvxfa4nvzhpg51vx06p3zyn90vf8fn7"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("proton-drive-sync" "bin/"))))
    (synopsis "sync local directories to Proton Drive cloud storage")
    (description "Proton Drive Sync synchronizes local directories with Proton
Drive cloud storage.  It provides bidirectional file synchronization with
end-to-end encryption through the Proton ecosystem.")
    (home-page "https://github.com/DamianB-BitFlipper/proton-drive-sync")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 17. lean-ctx-bin --- context engineering for AI coding (binary)
;;; -------------------------------------------------------------------
(define-public lean-ctx-bin
  (package
    (name "lean-ctx-bin")
    (version "3.3.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/yvgude/lean-ctx/releases/download/v"
                    version "/lean-ctx-x86_64-unknown-linux-gnu.tar.gz"))
              (sha256
               (base32 "1khsapnxqqbbmw1kwniav11dnlwrqi93m8bh5avwig25qdxhj1wy"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("lean-ctx" "bin/"))))
    (synopsis "context engineering layer for AI coding assistants")
    (description "Lean-ctx provides intelligent context tools for AI coding
assistants.  It analyzes codebases and generates focused context windows to
improve the accuracy and relevance of AI-generated code suggestions.")
    (home-page "https://github.com/yvgude/lean-ctx")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 18. firebase-tools-bin --- Firebase CLI (binary)
;;; -------------------------------------------------------------------
(define-public firebase-tools-bin
  (package
    (name "firebase-tools-bin")
    (version "15.14.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/firebase/firebase-tools/releases/"
                    "download/v" version "/firebase-tools-linux"))
              (sha256
               (base32 "0py4ziwwvkcpy38642zf98kcx04c83rhqwppiwb6k9m5za1gbzr9"))))
    (build-system copy-build-system)
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (copy-file source "firebase")
                   (chmod "firebase" #o755))))
           #:install-plan #~'(("firebase" "bin/"))))
    (synopsis "command line tools for Firebase")
    (description "Firebase Tools provides the official command-line interface
for Google Firebase services.  It supports deploying web apps, managing
Cloud Functions, configuring Firestore and Realtime Database rules, and
running local emulators for development.")
    (home-page "https://github.com/firebase/firebase-tools")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 19. qbittorrent-cli-bin --- qBittorrent CLI client (binary)
;;; -------------------------------------------------------------------
(define-public qbittorrent-cli-bin
  (package
    (name "qbittorrent-cli-bin")
    (version "1.8.24285.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/fedarovich/qbittorrent-cli/releases/"
                    "download/v" version "/qbt-linux-x64-net6-"
                    version ".tar.gz"))
              (sha256
               (base32 "14hwxqrlm90ahih7v4g5hfj1xmplc5kx09sl9kjndi8zpdsyhqf2"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "lib/qbittorrent-cli/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'create-wrapper
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin"))
                          (lib (string-append out "/lib/qbittorrent-cli")))
                     (mkdir-p bin)
                     (symlink (string-append lib "/qbt")
                              (string-append bin "/qbt"))))))))
    (synopsis "command-line interface for remote qBittorrent instances")
    (description "qBittorrent CLI provides a command-line interface for
managing remote qBittorrent instances.  It supports adding, removing, and
monitoring torrents, managing categories and tags, and configuring client
settings remotely.")
    (home-page "https://github.com/fedarovich/qbittorrent-cli")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 20. capacities-appimage --- personal knowledge management
;;; -------------------------------------------------------------------
(define-public capacities-appimage
  (package
    (name "capacities-appimage")
    (version "1.62.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://2vks4.upcloudobjects.com/capacities-desktop-app/"
                    "Capacities-" version ".AppImage"))
              (sha256
               (base32 "081wfp3waziv6d2dwajbbjkk3jbkfxnfm3lm318jvx6rrvgaflyd"))))
    (build-system copy-build-system)
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (copy-file source "capacities.AppImage")
                   (chmod "capacities.AppImage" #o755))))
           #:install-plan #~'(("capacities.AppImage" "bin/capacities"))))
    (synopsis "personal knowledge management application")
    (description "Capacities is a personal knowledge management application
that provides a studio-like environment for organizing thoughts, notes, and
ideas.  It supports networked note-taking with rich media and structured
data objects.")
    (home-page "https://capacities.io/")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 21. dataflare-bin --- database management GUI
;;; -------------------------------------------------------------------
(define-public dataflare-bin
  (package
    (name "dataflare-bin")
    (version "2.10.2")
    (source (origin
              (method url-fetch)
              (uri "https://assets.dataflare.app/release/linux/x86_64/Dataflare.AppImage")
              (sha256
               (base32 "0sc2grjcizlbgj3vi3515cacpxrw58gsrvj3yg5yyb2xjrifgx5l"))))
    (build-system copy-build-system)
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (copy-file source "dataflare.AppImage")
                   (chmod "dataflare.AppImage" #o755))))
           #:install-plan #~'(("dataflare.AppImage" "bin/dataflare"))))
    (synopsis "database management and SQL query tool")
    (description "Dataflare is a database management application for viewing
table data, writing SQL queries, and managing database schemas.  It supports
multiple database engines including PostgreSQL, MySQL, SQLite, and others.")
    (home-page "https://dataflare.app/")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 22. edex-ui-bin --- sci-fi terminal emulator (binary)
;;; -------------------------------------------------------------------
(define-public edex-ui-bin
  (package
    (name "edex-ui-bin")
    (version "2.2.8")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/GitSquared/edex-ui/releases/download/v"
                    version "/eDEX-UI-Linux-x86_64.AppImage"))
              (sha256
               (base32 "10fn0as77ikrpfpjxhs3lr0w8kg6ldn7a2wnq6h2q0ya47bqrwn8"))))
    (build-system copy-build-system)
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (copy-file source "edex-ui.AppImage")
                   (chmod "edex-ui.AppImage" #o755))))
           #:install-plan #~'(("edex-ui.AppImage" "bin/edex-ui"))))
    (synopsis "cross-platform sci-fi terminal emulator and system monitor")
    (description "eDEX-UI is a fullscreen, cross-platform terminal emulator and
system monitor with a science fiction inspired interface.  It displays system
information, network statistics, and file system data alongside a functional
terminal.")
    (home-page "https://github.com/GitSquared/edex-ui")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 23. sourcegit-bin --- Git GUI client (binary)
;;; -------------------------------------------------------------------
(define-public sourcegit-bin
  (package
    (name "sourcegit-bin")
    (version "2026.09")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/sourcegit-scm/sourcegit/releases/"
                    "download/v" version "/sourcegit_" version
                    "-1_amd64.deb"))
              (sha256
               (base32 "0gma19b35xqkrdp604wj77qgffpb3kmqvrw2l3pbp23akm3kjk2w"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("opt/sourcegit/" "lib/sourcegit/"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (invoke "ar" "x" source)
                   (invoke "tar" "xf"
                           (if (file-exists? "data.tar.zst")
                               "data.tar.zst"
                               "data.tar.xz"))))
               (add-after 'install 'create-wrapper
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin")))
                     (mkdir-p bin)
                     (symlink (string-append out "/lib/sourcegit/sourcegit")
                              (string-append bin "/sourcegit"))))))))
    (native-inputs (list binutils zstd))
    (synopsis "GUI client for Git users")
    (description "SourceGit is a graphical Git client that provides visual
diff viewing, commit history browsing, branch management, and merge conflict
resolution.  It supports interactive rebase, cherry-pick, and other advanced
Git operations through a streamlined interface.")
    (home-page "https://github.com/sourcegit-scm/sourcegit")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 24. clash-verge-rev-autobuild-bin --- Clash Meta GUI proxy (binary)
;;; -------------------------------------------------------------------
(define-public clash-verge-rev-autobuild-bin
  (package
    (name "clash-verge-rev-autobuild-bin")
    (version "2.4.8")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/clash-verge-rev/clash-verge-rev/"
                    "releases/download/autobuild/"
                    "Clash.Verge_" version
                    "%2Bautobuild.0403.fa45573_amd64.deb"))
              (sha256
               (base32 "1l37qsjkswzrgcgnx2w8m4h3ryggd85y2vfgzmbxyvfar1anvj9f"))))
    (build-system copy-build-system)
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (invoke "ar" "x" source)
                   (invoke "tar" "xf" "data.tar.gz"))))
           #:install-plan #~'(("usr/bin/" "bin/")
                              ("usr/share/" "share/"))))
    (native-inputs (list binutils))
    (synopsis "Clash Meta GUI proxy client based on Tauri")
    (description "Clash Verge Rev is a graphical proxy client based on
Clash Meta and the Tauri framework.  It provides rule-based traffic routing,
multiple proxy protocol support, and a modern user interface for managing
network proxy configurations.")
    (home-page "https://github.com/clash-verge-rev/clash-verge-rev")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 25. piliplus-bin --- Bilibili third-party client (binary)
;;; -------------------------------------------------------------------
(define-public piliplus-bin
  (package
    (name "piliplus-bin")
    (version "2.0.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/bggRGjQaUbCoE/PiliPlus/releases/"
                    "download/" version "/PiliPlus_linux_" version
                    "%2B4848_amd64.tar.gz"))
              (sha256
               (base32 "1sdb48m1al4hz2nrm014a5xsh2qnm6masq4bnhvgdfpnqxp6w4vc"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("piliplus" "bin/")
                              ("lib/" "lib/piliplus/")
                              ("data/" "share/piliplus/data/"))))
    (synopsis "third-party Bilibili client built with Flutter")
    (description "PiliPlus is an open-source third-party client for Bilibili,
the Chinese video sharing platform.  Built with Flutter, it provides video
playback, search, and browsing features in a lightweight desktop
application.")
    (home-page "https://github.com/bggRGjQaUbCoE/PiliPlus")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 26. koofr-desktop-bin --- cloud storage client (binary)
;;; -------------------------------------------------------------------
(define-public koofr-desktop-bin
  (package
    (name "koofr-desktop-bin")
    (version "41a82e7")
    (source (origin
              (method url-fetch)
              (uri "https://app.koofr.net/dl/apps/linux64")
              (file-name (string-append "koofr-" version
                                        "-linux-x86_64.tar.gz"))
              (sha256
               (base32 "06mv2si40924yassic2fcf9n5g4j1pflgr80yd2x3dpk657afd7s"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("koofr/" "lib/koofr/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'create-wrapper
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin")))
                     (mkdir-p bin)
                     (symlink (string-append out "/lib/koofr/storagegui")
                              (string-append bin "/koofr"))))))))
    (synopsis "Koofr cloud storage desktop client")
    (description "Koofr Desktop provides a native desktop client for Koofr
cloud storage service.  It enables file synchronization between local
directories and Koofr cloud storage with automatic conflict resolution.")
    (home-page "https://koofr.eu/")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 27. gmodpatchtool-bin --- Garry's Mod patch tool (binary)
;;; -------------------------------------------------------------------
(define-public gmodpatchtool-bin
  (package
    (name "gmodpatchtool-bin")
    (version "20251102")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/solsticegamestudios/gmodpatchtool/"
                    "releases/download/" version
                    "/gmodpatchtool-Linux.zip"))
              (sha256
               (base32 "0jpknqdawgkmpivxywhl3bi23vdhg45nnm4h2ww14qiz6mv0gw0z"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "lib/gmodpatchtool/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'create-wrapper
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin")))
                     (mkdir-p bin)
                     (call-with-output-file (string-append bin "/gmodpatchtool")
                       (lambda (port)
                         (format port "#!~a~%exec ~a/lib/gmodpatchtool/gmodpatchtool \"$@\"~%"
                                 (which "bash")
                                 out)))
                     (chmod (string-append bin "/gmodpatchtool") #o755)))))))
    (native-inputs (list unzip))
    (synopsis "patches and updates for Garry's Mod")
    (description "GModPatchTool applies patches and updates to Garry's Mod,
including CEF browser updates and bug fixes.  It automates the process of
keeping the game client up to date with community-maintained patches.")
    (home-page "https://github.com/solsticegamestudios/gmodpatchtool")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 28. bibata-modern-classic-cursor-theme --- cursor theme
;;; -------------------------------------------------------------------
(define-public bibata-modern-classic-cursor-theme
  (package
    (name "bibata-modern-classic-cursor-theme")
    (version "2.0.7")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ful1e5/Bibata_Cursor/releases/"
                    "download/v" version "/Bibata-Modern-Classic.tar.xz"))
              (sha256
               (base32 "1n2nnniijv9hys7ag58lqxikp405545pdpkpbqpz1gjv9s39ad3x"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("Bibata-Modern-Classic" "share/icons/Bibata-Modern-Classic"))))
    (synopsis "material-based cursor theme")
    (description "Bibata Modern Classic is a cursor theme with a modern
material design aesthetic.  It provides cursors in a classic black color
scheme with smooth animations and clear pointer shapes for desktop Linux
environments.")
    (home-page "https://github.com/ful1e5/Bibata_Cursor")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 29. systemd-cron --- systemd units for cron scripts
;;; -------------------------------------------------------------------
(define-public systemd-cron
  (package
    (name "systemd-cron")
    (version "2.7.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/systemd-cron/systemd-cron/archive/"
                    "refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "06dd1n7jmm2l13v4n4iqrggbx2biy83s2fslqjjmi8h2088ig7jl"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags #~(list (string-append "DESTDIR=" #$output)
                                "prefix=")
           #:phases
           #~(modify-phases %standard-phases
               (replace 'configure
                 (lambda _
                   (invoke "./configure"
                           "--prefix="
                           "--enable-boot"
                           "--enable-minutely"))))))
    (synopsis "systemd units to provide cron daemon functionality")
    (description "Systemd-cron generates systemd timer and service units from
traditional crontab files.  It translates @file{/etc/cron.d},
@file{/etc/cron.daily}, and user crontabs into native systemd timers,
replacing the need for a separate cron daemon.")
    (home-page "https://github.com/systemd-cron/systemd-cron")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 30. android-messages-desktop-bin --- Android Messages client (binary)
;;; -------------------------------------------------------------------
(define-public android-messages-desktop-bin
  (package
    (name "android-messages-desktop-bin")
    (version "6.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/OrangeDrangon/android-messages-desktop/"
                    "releases/download/v" version
                    "/Android-Messages-v" version "-linux-x64.pacman"))
              (sha256
               (base32 "13k9v4rj6sh457m6mfajsr09m43l8075gl9ib4qqn0wr0r8vgsbx"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("opt/Android Messages/" "lib/android-messages/"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (invoke "tar" "xf" source)))
               (add-after 'install 'create-wrapper
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin")))
                     (mkdir-p bin)
                     (symlink (string-append out "/lib/android-messages/"
                                             "android-messages-desktop")
                              (string-append bin "/android-messages"))))))))
    (native-inputs (list zstd))
    (synopsis "Android Messages desktop client")
    (description "Android Messages Desktop wraps Google's Android Messages
for Web in a standalone desktop application.  It provides native desktop
notifications, system tray integration, and keyboard shortcuts for managing
SMS and RCS messages from a computer.")
    (home-page "https://github.com/OrangeDrangon/android-messages-desktop")
    (license license:expat)))
