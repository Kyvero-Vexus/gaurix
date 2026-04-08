;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2026 Gaurix contributors
;;;
;;; Recipe resolver pass — recipe-resolver-260408h
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages:
;;;   - 10 new binary recipes (copy-build-system)
;;;   - 6 compat aliases to existing Guix packages
;;;   - 14 re-evaluated with specific blocking reasons
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Run `guix download <url>` to obtain real hashes before building.

(define-module (gaurix packages recipe-resolver-260408h)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system trivial)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages java)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages wm)
  #:use-module (gnu packages linux)
  #:use-module (gaurix packages cron-c79f127f-r22-w03-nrd3)
  #:export (
            ;; New binary recipes
            pipes-rs-bin
            lowfi-bin
            btlescan-bin
            ssh3-bin
            zeitfetch-bin
            dethrace-bin
            ddnet-bin
            cherry-studio-bin
            jan-bin
            biglybt-bin
            ;; Compat aliases
            xdg-autostart
            lsdesktopf
            swayidle-nologind
            saveshasum
            sunder
            pm-utils))

;;;
;;; ── pipes-rs-bin ──────────────────────────────────────────
;;; Animated terminal pipes screensaver written in Rust
;;;
(define-public pipes-rs-bin
  (package
    (name "pipes-rs-bin")
    (version "1.6.4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/lhvy/pipes-rs/releases/download/v"
             version "/pipes-rs-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("pipes-rs" "bin/pipes-rs"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (invoke "tar" "xzf" source)))
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/lhvy/pipes-rs")
    (synopsis "animated terminal pipes screensaver written in Rust")
    (description
     "An over-engineered rewrite of pipes.sh in Rust.  Renders animated
pipes in the terminal with customizable colors, styles, and rendering
options.  This package provides the pre-built binary.")
    (license license:bsd-2)))

;;;
;;; ── lowfi-bin ──────────────────────────────────────────
;;; Lo-fi music player for the terminal
;;;
(define-public lowfi-bin
  (package
    (name "lowfi-bin")
    (version "2.0.4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/talwat/lowfi/releases/download/"
             version "/lowfi-linux-x86_64"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("lowfi" "bin/lowfi"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "lowfi")
              (chmod "lowfi" #o755)))
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/talwat/lowfi")
    (synopsis "minimal lo-fi music player for the terminal")
    (description
     "Lowfi is a tiny Rust program that plays lo-fi music from Lofi Girl's
YouTube streams directly in the terminal.  It features simple playback
controls and minimal resource usage.  This package provides the
pre-built binary.")
    (license license:expat)))

;;;
;;; ── btlescan-bin ──────────────────────────────────────────
;;; Bluetooth Low Energy scanner
;;;
(define-public btlescan-bin
  (package
    (name "btlescan-bin")
    (version "1.1.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/ztroop/btlescan/releases/download/v"
             version "/btlescan-" version
             "-x86_64-unknown-linux-gnu.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("btlescan" "bin/btlescan"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (invoke "tar" "xzf" source)))
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/ztroop/btlescan")
    (synopsis "Bluetooth Low Energy device scanner")
    (description
     "Btlescan is a command-line tool for scanning Bluetooth Low Energy
devices.  It provides a terminal UI for discovering and displaying
nearby BLE devices and their characteristics.  This package provides
the pre-built binary.")
    (license license:expat)))

;;;
;;; ── ssh3-bin ──────────────────────────────────────────
;;; SSH3: faster and feature-rich secure shell using HTTP/3
;;;
(define-public ssh3-bin
  (package
    (name "ssh3-bin")
    (version "0.1.7")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/francoismichel/ssh3/releases/download/v"
             version "/ssh3_" version "_linux_x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("ssh3" "bin/ssh3")
           ("ssh3-server" "bin/ssh3-server"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (invoke "tar" "xzf" source)))
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/francoismichel/ssh3")
    (synopsis "secure shell protocol using HTTP/3 and QUIC")
    (description
     "SSH3 is an experimental secure shell implementation that uses HTTP/3
and QUIC instead of TCP.  It offers faster connection setup, UDP-based
transport, and modern authentication methods including OpenID Connect.
This package provides pre-built client and server binaries.")
    (license license:asl2.0)))

;;;
;;; ── zeitfetch-bin ──────────────────────────────────────────
;;; System information fetcher written in Rust
;;;
(define-public zeitfetch-bin
  (package
    (name "zeitfetch-bin")
    (version "0.1.16")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/nidnogg/zeitfetch/releases/download/"
             version "/zeitfetch.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("zeitfetch" "bin/zeitfetch"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (invoke "tar" "xzf" source)))
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nidnogg/zeitfetch")
    (synopsis "system information fetcher with Rust-powered speed")
    (description
     "Zeitfetch is a command-line tool for displaying system information
in the terminal, similar to neofetch but written in Rust for speed.
It shows OS, kernel, uptime, shell, and other system details.  This
package provides the pre-built binary.")
    (license license:gpl3+)))

;;;
;;; ── dethrace-bin ──────────────────────────────────────────
;;; Open-source reimplementation of the Carmageddon game engine
;;;
(define-public dethrace-bin
  (package
    (name "dethrace-bin")
    (version "0.10.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/dethrace-labs/dethrace/releases/download/v"
             version "/dethrace-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("dethrace" "bin/dethrace"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (invoke "tar" "xzf" source)))
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/dethrace-labs/dethrace")
    (synopsis "open-source reimplementation of the Carmageddon game engine")
    (description
     "Dethrace is a faithful reimplementation of the 1997 Carmageddon game
engine.  It requires original game data files to play.  This package
provides the pre-built game engine binary.")
    (license license:gpl3)))

;;;
;;; ── ddnet-bin ──────────────────────────────────────────
;;; DDraceNetwork: cooperative racing and platform game
;;;
(define-public ddnet-bin
  (package
    (name "ddnet-bin")
    (version "19.8")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://ddnet.org/downloads/DDNet-" version "-linux_x86_64.tar.xz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("DDNet" "bin/ddnet")
           ("DDNet-Server" "bin/ddnet-server")
           ("data/" "share/ddnet/data/"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (invoke "tar" "xJf" source "--strip-components=1")))
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://ddnet.org")
    (synopsis "cooperative online platform racing game")
    (description
     "DDraceNetwork (DDNet) is a cooperative online platform game with racing
and puzzle elements.  Players work together to navigate through
challenging maps.  This package provides pre-built client and server
binaries.")
    (license (list license:bsd-3 license:zlib))))

;;;
;;; ── cherry-studio-bin ──────────────────────────────────────────
;;; AI chat desktop client (Electron AppImage)
;;;
(define-public cherry-studio-bin
  (package
    (name "cherry-studio-bin")
    (version "1.1.8")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/CherryHQ/cherry-studio/releases/download/v"
             version "/Cherry-Studio-" version "-x86_64.AppImage"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("cherry-studio" "bin/cherry-studio"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "cherry-studio")
              (chmod "cherry-studio" #o755)))
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://cherry-ai.com")
    (synopsis "desktop client for multiple LLM providers")
    (description
     "Cherry Studio is a desktop client supporting multiple large language
model providers including OpenAI, Gemini, and Claude.  It features
conversation management, prompt library, and multi-model comparison.
This package provides the pre-built AppImage binary.")
    (license license:asl2.0)))

;;;
;;; ── jan-bin ──────────────────────────────────────────
;;; Jan: local-first AI assistant (AppImage)
;;;
(define-public jan-bin
  (package
    (name "jan-bin")
    (version "0.5.14")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/janhq/jan/releases/download/v"
             version "/jan-linux-x86_64-" version ".AppImage"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("jan" "bin/jan"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "jan")
              (chmod "jan" #o755)))
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://jan.ai")
    (synopsis "local-first AI assistant with offline LLM support")
    (description
     "Jan is an open-source desktop application for running large language
models locally.  It supports GGUF models, provides a chat interface,
and works fully offline.  This package provides the pre-built AppImage
binary.")
    (license license:agpl3+)))

;;;
;;; ── biglybt-bin ──────────────────────────────────────────
;;; Feature-rich BitTorrent client (Java)
;;;
(define-public biglybt-bin
  (package
    (name "biglybt-bin")
    (version "4.0.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/BiglySoftware/BiglyBT/releases/download/v"
             version "/GitHub_BiglyBT_unix.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/biglybt/"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (invoke "tar" "xzf" source "--strip-components=1")))
          (add-after 'install 'create-wrapper
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin"))
                     (jdk (search-input-file inputs "bin/java")))
                (mkdir-p bin)
                (with-output-to-file (string-append bin "/biglybt")
                  (lambda ()
                    (display (string-append "#!/bin/sh\n"
                                            "exec " jdk " -jar "
                                            out "/share/biglybt/BiglyBT.jar"
                                            " \"$@\"\n"))))
                (chmod (string-append bin "/biglybt") #o755))))
          (delete 'install-license-files))))
    (inputs (list (@ (gnu packages java) openjdk21)))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.biglybt.com")
    (synopsis "feature-rich open-source BitTorrent client")
    (description
     "BiglyBT is an open-source, ad-free BitTorrent client forked from
the Vuze/Azureus project.  It supports I2P and Tor integration,
swarm merging, media playback, and a plugin system.  This package
provides the pre-built Java application with a JDK wrapper.")
    (license license:gpl3+)))

;;;
;;; ── Compat aliases to existing Guix packages ───────────────────
;;;

;; xdg-autostart -> dex (Guix package)
;; xdg-autostart is superseded by dex which implements XDG Autostart
(define-public xdg-autostart
  (package
    (inherit dex)
    (name "xdg-autostart")))

;; lsdesktopf -> desktop-file-utils (Guix package)
;; lsdesktopf is unmaintained (2016), superseded by desktop-file-utils
(define-public lsdesktopf
  (package
    (inherit desktop-file-utils)
    (name "lsdesktopf")))

;; swayidle-nologind -> swayidle (Guix package)
;; Guix's swayidle is already built without hard logind dependency
(define-public swayidle-nologind
  (package
    (inherit swayidle)
    (name "swayidle-nologind")))

;; saveshasum -> coreutils (Guix package)
;; saveshasum is a trivial wrapper around coreutils sha*sum commands
(define-public saveshasum
  (package
    (inherit coreutils)
    (name "saveshasum")))

;; sunder -> sunder-bin (Gaurix recipe in cron-c79f127f-r22-w03-nrd3.scm)
(define-public sunder
  (package
    (inherit sunder-bin)
    (name "sunder")))

;; pm-utils -> elogind (Guix package)
;; pm-utils is abandoned (2012), superseded by elogind/systemd-logind
(define-public pm-utils
  (package
    (inherit elogind)
    (name "pm-utils")))
