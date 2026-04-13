;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260413n
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages:
;;;   - 20 recipes created (copy-build-system binary packages)
;;;   - 10 re-blocked with specific reason codes
;;;
;;; Recipes (20):
;;;   - thorium-browser-avx-bin (copy, v138.0.7204.303)
;;;   - devpod-community-bin (copy, v0.6.15)
;;;   - phiola-bin (copy, v2.7.9)
;;;   - ionosctl-bin (copy, v6.9.8)
;;;   - melonds-bin (copy, v1.1)
;;;   - keystore-explorer-bin (copy, v5.6.1)
;;;   - greenlight-bin (copy, v2.4.1)
;;;   - lore-cli-bin (copy, v0.1.13)
;;;   - tonkeeper-bin (copy, v4.4.0)
;;;   - termide-bin (copy, v0.18.2)
;;;   - kftui-bin (copy, v0.27.28)
;;;   - fhc-bin (copy, v0.9.1)
;;;   - qo-bin (copy, v0.4.0)
;;;   - vex-tui-bin (copy, v2.0.2)
;;;   - ghk-bin (copy, v1.0.3)
;;;   - antares-sql-bin (copy, v0.7.35)
;;;   - rclone-ui-bin (copy, v3.5.3)
;;;   - godot-beta-bin (copy, v4.6-beta3)
;;;   - karing-bin (copy, v1.2.16)
;;;   - data-peek-bin (copy, v0.19.1)
;;;
;;; Blocked (10):
;;;   - moderncsv-bin (PROPRIETARY_LICENSE)
;;;   - codex-app-bin (SOURCE_UNAVAILABLE)
;;;   - enumctl-bin (PROPRIETARY_LICENSE)
;;;   - itch-setup-bin (BOOTSTRAPPER_ONLY)
;;;   - mongodb-compass-bin (SSPL_LICENSE)
;;;   - ripdrag (CARGO_DEPS_NEEDED)
;;;   - boxbuddy (CARGO_DEPS_NEEDED)
;;;   - flameget (NO_RELEASES)
;;;   - dirsearch (PYTHON_DEPS_NEEDED)
;;;   - neovim-remote (PYTHON_DEPS_NEEDED)
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Run `guix download <url>` to obtain real hashes before building.

(define-module (gaurix packages recipe-resolver-260413n)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:export (
            thorium-browser-avx-bin
            devpod-community-bin
            phiola-bin
            ionosctl-bin
            melonds-bin
            keystore-explorer-bin
            greenlight-bin
            lore-cli-bin
            tonkeeper-bin
            termide-bin
            kftui-bin
            fhc-bin
            qo-bin
            vex-tui-bin
            ghk-bin
            antares-sql-bin
            rclone-ui-bin
            godot-beta-bin
            karing-bin
            data-peek-bin
            ))

;;; ── thorium-browser-avx-bin (#3705) ──

(define-public thorium-browser-avx-bin
  (package
    (name "thorium-browser-avx-bin")
    (version "138.0.7204.303")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/Alex313031/thorium/releases/download/M" version "/thorium-browser_" version "_AVX.deb"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("opt/chromium.org/thorium/" "share/thorium/"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key inputs #:allow-other-keys)
                   (invoke "ar" "x" (assoc-ref inputs "source"))
                   (invoke "tar" "xf" "data.tar.xz"))))))
    (native-inputs (list (@ (gnu packages base) tar)
                         (@ (gnu packages compression) zstd)))
    (supported-systems '("x86_64-linux"))
    (synopsis "Chromium fork focused on compiler optimizations and user experience")
    (description "Thorium is a Chromium fork that uses AVX optimizations and
additional patches for improved speed and user experience.  This package
provides prebuilt binaries with AVX instruction set support.")
    (home-page "https://thorium.rocks")
    (license license:bsd-3)))

;;; ── devpod-community-bin (#4067) ──

(define-public devpod-community-bin
  (package
    (name "devpod-community-bin")
    (version "0.6.15")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/loft-sh/devpod/releases/download/v" version "/devpod-linux-amd64"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("devpod-linux-amd64" "bin/devpod"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key inputs #:allow-other-keys)
                   (copy-file (assoc-ref inputs "source") "devpod-linux-amd64")
                   (chmod "devpod-linux-amd64" #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "open source client-only tool for creating reproducible dev environments")
    (description "DevPod is an open source, client-only tool to create
reproducible developer environments based on devcontainer.json on any
backend.  Each developer environment runs in a container and works with
any IDE.")
    (home-page "https://devpod.sh")
    (license license:mpl2.0)))

;;; ── phiola-bin (#5571) ──

(define-public phiola-bin
  (package
    (name "phiola-bin")
    (version "2.7.9")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/stsaz/phiola/releases/download/v" version "/phiola-" version "-linux-amd64.tar.zst"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("phiola-2" "share/phiola/"))))
    (native-inputs (list (@ (gnu packages compression) zstd)))
    (supported-systems '("x86_64-linux"))
    (synopsis "fast audio player, recorder, and converter")
    (description "Phiola is a fast audio player, recorder, and converter for
Windows, Linux, and Android.  It supports many audio formats including
FLAC, OGG, MP3, AAC, and more.")
    (home-page "https://github.com/stsaz/phiola")
    (license license:bsd-2)))

;;; ── ionosctl-bin (#5546) ──

(define-public ionosctl-bin
  (package
    (name "ionosctl-bin")
    (version "6.9.8")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/ionos-cloud/ionosctl/releases/download/v" version "/ionosctl-" version "-linux-amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("ionosctl" "bin/ionosctl"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "command-line interface for the IONOS Cloud API")
    (description "ionosctl is a command-line tool to manage IONOS Cloud
infrastructure.  It provides a CLI interface for creating and managing
virtual machines, networks, storage, and other cloud resources.")
    (home-page "https://github.com/ionos-cloud/ionosctl")
    (license license:asl2.0)))

;;; ── melonds-bin (#5587) ──

(define-public melonds-bin
  (package
    (name "melonds-bin")
    (version "1.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/melonDS-emu/melonDS/releases/download/" version "/melonDS-" version "-ubuntu-x86_64.zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("melonDS" "bin/melonDS"))))
    (native-inputs (list (@ (gnu packages compression) unzip)))
    (supported-systems '("x86_64-linux"))
    (synopsis "Nintendo DS and DSi emulator")
    (description "melonDS is an open source Nintendo DS and DSi emulator.
It aims for accuracy and good performance, supporting local
multiplayer, microphone input, and Wi-Fi emulation.")
    (home-page "https://melonds.kuribo64.net")
    (license license:gpl3+)))

;;; ── keystore-explorer-bin (#5588) ──

(define-public keystore-explorer-bin
  (package
    (name "keystore-explorer-bin")
    (version "5.6.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/kaikramer/keystore-explorer/releases/download/v" version "/kse-" (string-join (string-split version #\.) "") ".zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("kse.jar" "share/keystore-explorer/kse.jar")
                              ("lib/" "share/keystore-explorer/lib/"))))
    (native-inputs (list (@ (gnu packages compression) unzip)))
    (supported-systems '("x86_64-linux"))
    (synopsis "GUI replacement for the Java command-line keytool utility")
    (description "KeyStore Explorer is an open source GUI replacement for
the Java command-line utilities keytool and jarsigner.  It lets you
manage Java keystores, keys, and certificates through a graphical
interface.")
    (home-page "https://keystore-explorer.org")
    (license license:gpl3+)))

;;; ── greenlight-bin (#5586) ──

(define-public greenlight-bin
  (package
    (name "greenlight-bin")
    (version "2.4.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/unknownskl/greenlight/releases/download/v" version "/Greenlight-" version ".AppImage"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("greenlight.AppImage" "bin/greenlight"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key inputs #:allow-other-keys)
                   (copy-file (assoc-ref inputs "source") "greenlight.AppImage")
                   (chmod "greenlight.AppImage" #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "open source client for xCloud and Xbox home streaming")
    (description "Greenlight is an open source client for xCloud and Xbox
home streaming.  It allows you to stream games from your Xbox console
or Microsoft's xCloud service to your Linux desktop.")
    (home-page "https://github.com/unknownskl/greenlight")
    (license license:expat)))

;;; ── lore-cli-bin (#5581) ──

(define-public lore-cli-bin
  (package
    (name "lore-cli-bin")
    (version "0.1.13")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/varalys/lore/releases/download/v" version "/lore-x86_64-unknown-linux-gnu.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("lore" "bin/lore"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "capture AI coding sessions and link them to git commits")
    (description "Lore is a CLI tool to capture AI coding sessions and link
them to git commits.  It helps teams track and understand AI-assisted
development workflows.")
    (home-page "https://github.com/varalys/lore")
    (license license:asl2.0)))

;;; ── tonkeeper-bin (#5540) ──

(define-public tonkeeper-bin
  (package
    (name "tonkeeper-bin")
    (version "4.4.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/tonkeeper/tonkeeper-web/releases/download/v" version "/Tonkeeper-" version ".AppImage"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("tonkeeper.AppImage" "bin/tonkeeper"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key inputs #:allow-other-keys)
                   (copy-file (assoc-ref inputs "source") "tonkeeper.AppImage")
                   (chmod "tonkeeper.AppImage" #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "non-custodial TON crypto wallet")
    (description "Tonkeeper is a multi-platform open source non-custodial
TON wallet and decentralized application gateway.  It provides a desktop
interface for managing TON blockchain assets.")
    (home-page "https://tonkeeper.com")
    (license license:asl2.0)))

;;; ── termide-bin (#5542) ──

(define-public termide-bin
  (package
    (name "termide-bin")
    (version "0.18.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/termide/termide/releases/download/" version "/termide-" version "-x86_64-unknown-linux-gnu.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("termide" "bin/termide"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "cross-platform terminal-based IDE written in Rust")
    (description "Termide is a cross-platform terminal-based IDE that
combines a file manager and virtual terminal.  Written in Rust, it
provides an integrated development environment within the terminal.")
    (home-page "https://github.com/termide/termide")
    (license license:expat)))

;;; ── kftui-bin (#5592) ──

(define-public kftui-bin
  (package
    (name "kftui-bin")
    (version "0.27.28")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/hcavarsan/kftray/releases/download/v" version "/kftui_linux_amd64"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("kftui_linux_amd64" "bin/kftui"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key inputs #:allow-other-keys)
                   (copy-file (assoc-ref inputs "source") "kftui_linux_amd64")
                   (chmod "kftui_linux_amd64" #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "kubectl port-forward manager TUI with proxy support")
    (description "kftui is a terminal user interface for managing kubectl
port-forward connections.  It supports UDP forwarding and proxy
configurations for Kubernetes services.")
    (home-page "https://github.com/hcavarsan/kftray")
    (license license:gpl3)))

;;; ── fhc-bin (#5554) ──

(define-public fhc-bin
  (package
    (name "fhc-bin")
    (version "0.9.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/Edu4rdSHL/fhc/releases/download/" version "/fhc-linux-x64.zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("fhc" "bin/fhc"))))
    (native-inputs (list (@ (gnu packages compression) unzip)))
    (supported-systems '("x86_64-linux"))
    (synopsis "fast HTTP checker written in Rust")
    (description "FHC is a fast HTTP checker that verifies the status of
URLs efficiently.  Written in Rust, it can process large lists of URLs
concurrently for security testing and reconnaissance.")
    (home-page "https://github.com/Edu4rdSHL/fhc")
    (license license:gpl3+)))

;;; ── qo-bin (#5575) ──

(define-public qo-bin
  (package
    (name "qo-bin")
    (version "0.4.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/kiki-ki/go-qo/releases/download/v" version "/qo_" version "_linux_amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("qo" "bin/qo"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "interactive TUI to query JSON, CSV, and TSV using SQL")
    (description "Qo is an interactive minimalist TUI that lets you query
JSON, CSV, and TSV files using SQL syntax.  Written in Go, it provides
a convenient way to explore and filter structured data.")
    (home-page "https://github.com/kiki-ki/go-qo")
    (license license:expat)))

;;; ── vex-tui-bin (#5582) ──

(define-public vex-tui-bin
  (package
    (name "vex-tui-bin")
    (version "2.0.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/CodeOne45/vex-tui/releases/download/v" version "/vex-tui_" version "_linux_amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("vex-tui" "bin/vex-tui"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "terminal-based Excel and CSV viewer and editor")
    (description "Vex TUI is a fast terminal-based Excel and CSV viewer and
editor built with Go.  It provides spreadsheet viewing and editing
capabilities directly in the terminal.")
    (home-page "https://github.com/CodeOne45/vex-tui")
    (license license:expat)))

;;; ── ghk-bin (#5579) ──

(define-public ghk-bin
  (package
    (name "ghk-bin")
    (version "1.0.3")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/bymehul/ghk/releases/download/v" version "/ghk-linux-x86_64"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("ghk-linux-x86_64" "bin/ghk"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key inputs #:allow-other-keys)
                   (copy-file (assoc-ref inputs "source") "ghk-linux-x86_64")
                   (chmod "ghk-linux-x86_64" #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "GitHub helper for pushing code with ease")
    (description "GHK is a GitHub helper tool that simplifies common git
workflows like pushing code.  It provides a streamlined interface for
interacting with GitHub repositories.")
    (home-page "https://github.com/bymehul/ghk")
    (license license:expat)))

;;; ── antares-sql-bin (#5728) ──

(define-public antares-sql-bin
  (package
    (name "antares-sql-bin")
    (version "0.7.35")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/antares-sql/antares/releases/download/v" version "/Antares-" version "-linux_x86_64.AppImage"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("antares-sql.AppImage" "bin/antares-sql"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key inputs #:allow-other-keys)
                   (copy-file (assoc-ref inputs "source") "antares-sql.AppImage")
                   (chmod "antares-sql.AppImage" #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "modern SQL client with a focus on user experience")
    (description "Antares SQL is a modern, fast, and productivity-driven SQL
client with a focus on user experience.  It supports MySQL, MariaDB,
PostgreSQL, and SQLite databases.")
    (home-page "https://antares-sql.app")
    (license license:expat)))

;;; ── rclone-ui-bin (#4349) ──

(define-public rclone-ui-bin
  (package
    (name "rclone-ui-bin")
    (version "3.5.3")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/rclone-ui/rclone-ui/releases/download/v" version "/Rclone.UI_amd64.AppImage"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("rclone-ui.AppImage" "bin/rclone-ui"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key inputs #:allow-other-keys)
                   (copy-file (assoc-ref inputs "source") "rclone-ui.AppImage")
                   (chmod "rclone-ui.AppImage" #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "cross-platform GUI for rclone cloud storage management")
    (description "Rclone UI is a cross-platform graphical user interface for
rclone, providing an easy way to manage cloud storage and S3-compatible
services.  Built with Tauri for a native desktop experience.")
    (home-page "https://github.com/rclone-ui/rclone-ui")
    (license license:asl2.0)))

;;; ── godot-beta-bin (#5734) ──

(define-public godot-beta-bin
  (package
    (name "godot-beta-bin")
    (version "4.6-beta3")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/godotengine/godot-builds/releases/download/" version "/Godot_v" version "_linux.x86_64.zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~`((,(string-append "Godot_v" "4.6-beta3" "_linux.x86_64") "bin/godot-beta"))))
    (native-inputs (list (@ (gnu packages compression) unzip)))
    (supported-systems '("x86_64-linux"))
    (synopsis "multi-platform 2D and 3D game engine (beta release)")
    (description "Godot Engine is a feature-packed, cross-platform game engine
to create 2D and 3D games from a unified interface.  This package provides
the beta release for testing upcoming features.")
    (home-page "https://godotengine.org")
    (license license:expat)))

;;; ── karing-bin (#4693) ──

(define-public karing-bin
  (package
    (name "karing-bin")
    (version "1.2.16.1912")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/KaringX/karing/releases/download/v" version "/karing_" version "_linux_amd64.deb"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("usr/" "share/karing/"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key inputs #:allow-other-keys)
                   (invoke "ar" "x" (assoc-ref inputs "source"))
                   (invoke "tar" "xf" "data.tar.xz"))))))
    (native-inputs (list (@ (gnu packages base) tar)))
    (supported-systems '("x86_64-linux"))
    (synopsis "proxy utility supporting clash and sing-box routing rules")
    (description "Karing is a simple and powerful proxy utility that supports
routing rules for clash and sing-box configurations.  It provides a
graphical interface for managing proxy connections.")
    (home-page "https://github.com/KaringX/karing")
    (license license:gpl3+)))

;;; ── data-peek-bin (#5583) ──

(define-public data-peek-bin
  (package
    (name "data-peek-bin")
    (version "0.19.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/Rohithgilla12/data-peek/releases/download/v" version "/data-peek-" version "-x86_64.AppImage"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("data-peek.AppImage" "bin/data-peek"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key inputs #:allow-other-keys)
                   (copy-file (assoc-ref inputs "source") "data-peek.AppImage")
                   (chmod "data-peek.AppImage" #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "minimal database client for quick data inspection")
    (description "Data Peek is a minimal and fast database client desktop
application for quick data inspection.  Built with Tauri, it supports
multiple database types for browsing and querying data.")
    (home-page "https://github.com/Rohithgilla12/data-peek")
    (license license:expat)))
