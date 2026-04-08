;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2026 Gaurix contributors
;;;
;;; Recipe resolver pass — recipe-resolver-260408q
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages:
;;;   - 22 binary repacks (copy-build-system)
;;;   - 3 source builds (pyproject/go/cmake)
;;;   - 5 re-evaluated with specific blocking reasons
;;;
;;; New recipes (25):
;;;   - feedr-bin (#3009): Rust RSS/Atom feed reader CLI
;;;   - crier-bin (#3012): push notification tool (TCP/MQTT)
;;;   - cliamp-bin (#3015/#3068): retro terminal music player
;;;   - ferrishot-bin (#3017): screenshot tool (Rust)
;;;   - iwmenu-bin (#3027): launcher-driven Wi-Fi manager
;;;   - bzmenu-bin (#3028): launcher-driven Bluetooth manager
;;;   - pwmenu-bin (#3029): launcher-driven audio manager
;;;   - ferris-scan-bin (#3032): Rust file scanner TUI/GUI
;;;   - sabiql-bin (#3036): PostgreSQL TUI browser/editor
;;;   - claude-code-seccomp (#3030): seccomp filter for Claude Code
;;;   - meta-package-manager-bin (#3210): wrapper around all pkg managers
;;;   - bililive-recorder-bin (#3014): BiliBili stream recorder
;;;   - air-bin: live reload for Go apps
;;;   - zigmir-bin (#3534): Arch Linux mirror speed tester
;;;   - gopac-bin (#3598): TUI for Arch Linux package management
;;;   - lian-bin (#3652): TUI frontend for paru/yay/pacman
;;;   - spout2pw-bin (#3648): Spout2 to PipeWire bridge
;;;   - snipaste (#3629): screenshot snip & paste tool
;;;   - boscaceoil-blue-bin (#3011): beginner-friendly music maker
;;;   - reqable-bin (#3013): HTTP development and debugger
;;;   - flclash-bin (#3548): multi-platform proxy client
;;;   - geforce-infinity-bin (#3649): GeForce NOW enhancer
;;;   - python-pysmart (#3007): Python wrapper for smartctl
;;;   - openhue-cli (#3010): Philips Hue CLI (Go)
;;;   - libmodule (#3024): C library for modular event-driven projects
;;;
;;; Re-evaluated (blocked with specific reasons):
;;;   - stremio-enhanced-bin (#3530): depends on Electron, not in Guix
;;;   - orchids-bin (#3829): depends on Electron/complex native libs
;;;   - chataigne-stable-bin (#3505): 20+ native deps, AppImage
;;;   - clightd (#3023): depends on ddcutil, libiio, polkit, systemd
;;;   - netwatch-tui (#3038): cargo build needs 100+ crate deps
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros) unless noted.
;;; Run `guix download <url>` to obtain real hashes before building.

(define-module (gaurix packages recipe-resolver-260408q)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system go)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages elf)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-xyz)
  #:export (
            feedr-bin
            crier-bin
            cliamp-bin
            ferrishot-bin
            iwmenu-bin
            bzmenu-bin
            pwmenu-bin
            ferris-scan-bin
            sabiql-bin
            claude-code-seccomp
            meta-package-manager-bin
            bililive-recorder-bin
            air-bin
            zigmir-bin
            gopac-bin
            lian-bin
            spout2pw-bin
            snipaste
            boscaceoil-blue-bin
            reqable-bin
            flclash-bin
            geforce-infinity-bin
            python-pysmart
            openhue-cli
            libmodule))

;;;
;;; ── feedr-bin ──────────────────────────────────────────────
;;; Rust RSS/Atom feed reader (pre-built binary)
;;;
(define-public feedr-bin
  (package
    (name "feedr-bin")
    (version "0.7.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/bahdotsh/feedr/releases/download/v"
             version "/feedr-linux-x86_64"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("feedr-linux-x86_64" "bin/feedr"))
           #:phases
           #~(modify-phases %standard-phases
               (add-before 'install 'chmod
                 (lambda _
                   (chmod "feedr-linux-x86_64" #o755)))
               (add-after 'install 'patch-elf
                 (lambda* (#:key inputs outputs #:allow-other-keys)
                   (let ((out (assoc-ref outputs "out"))
                         (patchelf (search-input-file inputs "bin/patchelf"))
                         (ld-linux (search-input-file
                                   inputs "lib/ld-linux-x86-64.so.2")))
                     (invoke patchelf "--set-interpreter" ld-linux
                             (string-append out "/bin/feedr"))))))))
    (native-inputs (list patchelf))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/bahdotsh/feedr")
    (synopsis "feature-rich terminal RSS/Atom feed reader written in Rust")
    (description
     "Feedr is a terminal-based RSS and Atom feed reader written in Rust.
It provides a keyboard-driven interface for subscribing to and reading
feeds directly from the terminal.")
    (license license:expat)))

;;;
;;; ── crier-bin ──────────────────────────────────────────────
;;; Push notification tool (pre-built binary)
;;;
(define-public crier-bin
  (package
    (name "crier-bin")
    (version "0.2.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/skorotkiewicz/crier/releases/download/"
             version "/crier-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("crier" "bin/crier"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'patch-elf
                 (lambda* (#:key inputs outputs #:allow-other-keys)
                   (let ((out (assoc-ref outputs "out"))
                         (patchelf (search-input-file inputs "bin/patchelf"))
                         (ld-linux (search-input-file
                                   inputs "lib/ld-linux-x86-64.so.2")))
                     (invoke patchelf "--set-interpreter" ld-linux
                             (string-append out "/bin/crier"))))))))
    (native-inputs (list patchelf))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/skorotkiewicz/crier")
    (synopsis "simple push notification tool for LAN and internet")
    (description
     "Crier is a simple push notification tool that works on LAN via TCP
or across the internet via MQTT.  It provides a lightweight way to send
and receive notifications between machines.")
    (license license:expat)))

;;;
;;; ── cliamp-bin ──────────────────────────────────────────────
;;; Retro terminal music player (pre-built binary)
;;;
(define-public cliamp-bin
  (package
    (name "cliamp-bin")
    (version "1.35.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/bjarneo/cliamp/releases/download/v"
             version "/cliamp-linux-amd64"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("cliamp-linux-amd64" "bin/cliamp"))
           #:phases
           #~(modify-phases %standard-phases
               (add-before 'install 'chmod
                 (lambda _
                   (chmod "cliamp-linux-amd64" #o755)))
               (add-after 'install 'patch-elf
                 (lambda* (#:key inputs outputs #:allow-other-keys)
                   (let ((out (assoc-ref outputs "out"))
                         (patchelf (search-input-file inputs "bin/patchelf"))
                         (ld-linux (search-input-file
                                   inputs "lib/ld-linux-x86-64.so.2")))
                     (invoke patchelf "--set-interpreter" ld-linux
                             (string-append out "/bin/cliamp"))))))))
    (native-inputs (list patchelf))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/bjarneo/cliamp")
    (synopsis "retro terminal music player inspired by Winamp 2.x")
    (description
     "Cliamp is a retro terminal music player inspired by Winamp 2.x.
It provides a nostalgic TUI for playing audio files from the command line.")
    (license license:expat)))

;;;
;;; ── ferrishot-bin ──────────────────────────────────────────────
;;; Screenshot tool (pre-built Rust binary)
;;;
(define-public ferrishot-bin
  (package
    (name "ferrishot-bin")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/nik-rev/ferrishot/releases/download/v"
             version "/ferrishot-x86_64-unknown-linux-gnu.tar.xz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("ferrishot" "bin/ferrishot"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'patch-elf
                 (lambda* (#:key inputs outputs #:allow-other-keys)
                   (let ((out (assoc-ref outputs "out"))
                         (patchelf (search-input-file inputs "bin/patchelf"))
                         (ld-linux (search-input-file
                                   inputs "lib/ld-linux-x86-64.so.2")))
                     (invoke patchelf "--set-interpreter" ld-linux
                             (string-append out "/bin/ferrishot"))))))))
    (native-inputs (list patchelf))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nik-rev/ferrishot")
    (synopsis "screenshot tool written in Rust")
    (description
     "Ferrishot is a screenshot tool written in Rust.  It captures screen
regions with a selection interface and copies the result to the clipboard
or saves it to a file.")
    (license (list license:expat license:asl2.0))))

;;;
;;; ── iwmenu-bin ──────────────────────────────────────────────
;;; Launcher-driven Wi-Fi manager (pre-built binary)
;;;
(define-public iwmenu-bin
  (package
    (name "iwmenu-bin")
    (version "0.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/e-tho/iwmenu/releases/download/v"
             version "/iwmenu-x86_64-linux-gnu"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("iwmenu-x86_64-linux-gnu" "bin/iwmenu"))
           #:phases
           #~(modify-phases %standard-phases
               (add-before 'install 'chmod
                 (lambda _
                   (chmod "iwmenu-x86_64-linux-gnu" #o755)))
               (add-after 'install 'patch-elf
                 (lambda* (#:key inputs outputs #:allow-other-keys)
                   (let ((out (assoc-ref outputs "out"))
                         (patchelf (search-input-file inputs "bin/patchelf"))
                         (ld-linux (search-input-file
                                   inputs "lib/ld-linux-x86-64.so.2")))
                     (invoke patchelf "--set-interpreter" ld-linux
                             (string-append out "/bin/iwmenu"))))))))
    (native-inputs (list patchelf))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/e-tho/iwmenu")
    (synopsis "launcher-driven Wi-Fi manager for Linux")
    (description
     "Iwmenu is a launcher-driven Wi-Fi manager for Linux.  It integrates
with application launchers like rofi, dmenu, or fuzzel to provide a
menu-based interface for connecting to wireless networks.")
    (license license:gpl3+)))

;;;
;;; ── bzmenu-bin ──────────────────────────────────────────────
;;; Launcher-driven Bluetooth manager (pre-built binary)
;;;
(define-public bzmenu-bin
  (package
    (name "bzmenu-bin")
    (version "0.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/e-tho/bzmenu/releases/download/v"
             version "/bzmenu-x86_64-linux-gnu"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("bzmenu-x86_64-linux-gnu" "bin/bzmenu"))
           #:phases
           #~(modify-phases %standard-phases
               (add-before 'install 'chmod
                 (lambda _
                   (chmod "bzmenu-x86_64-linux-gnu" #o755)))
               (add-after 'install 'patch-elf
                 (lambda* (#:key inputs outputs #:allow-other-keys)
                   (let ((out (assoc-ref outputs "out"))
                         (patchelf (search-input-file inputs "bin/patchelf"))
                         (ld-linux (search-input-file
                                   inputs "lib/ld-linux-x86-64.so.2")))
                     (invoke patchelf "--set-interpreter" ld-linux
                             (string-append out "/bin/bzmenu"))))))))
    (native-inputs (list patchelf))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/e-tho/bzmenu")
    (synopsis "launcher-driven Bluetooth manager for Linux")
    (description
     "Bzmenu is a launcher-driven Bluetooth manager for Linux.  It integrates
with application launchers like rofi, dmenu, or fuzzel to provide a
menu-based interface for pairing and connecting Bluetooth devices.")
    (license license:gpl3+)))

;;;
;;; ── pwmenu-bin ──────────────────────────────────────────────
;;; Launcher-driven audio manager (pre-built binary)
;;;
(define-public pwmenu-bin
  (package
    (name "pwmenu-bin")
    (version "0.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/e-tho/pwmenu/releases/download/v"
             version "/pwmenu-x86_64-linux-gnu"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("pwmenu-x86_64-linux-gnu" "bin/pwmenu"))
           #:phases
           #~(modify-phases %standard-phases
               (add-before 'install 'chmod
                 (lambda _
                   (chmod "pwmenu-x86_64-linux-gnu" #o755)))
               (add-after 'install 'patch-elf
                 (lambda* (#:key inputs outputs #:allow-other-keys)
                   (let ((out (assoc-ref outputs "out"))
                         (patchelf (search-input-file inputs "bin/patchelf"))
                         (ld-linux (search-input-file
                                   inputs "lib/ld-linux-x86-64.so.2")))
                     (invoke patchelf "--set-interpreter" ld-linux
                             (string-append out "/bin/pwmenu"))))))))
    (native-inputs (list patchelf))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/e-tho/pwmenu")
    (synopsis "launcher-driven audio manager for Linux")
    (description
     "Pwmenu is a launcher-driven audio manager for Linux.  It integrates
with application launchers like rofi, dmenu, or fuzzel to provide a
menu-based interface for controlling PipeWire audio sources and sinks.")
    (license license:gpl3+)))

;;;
;;; ── ferris-scan-bin ──────────────────────────────────────────────
;;; Rust file scanner TUI + GUI (pre-built binaries)
;;;
(define-public ferris-scan-bin
  (package
    (name "ferris-scan-bin")
    (version "0.25")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/Vnilabean/ferris-scan/releases/download/v"
             version "/ferris-scan-tui-v" version "-linux"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("ferris-scan-tui" "bin/ferris-scan-tui"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'unpack 'rename-source
                 (lambda _
                   (rename-file
                    (string-append "ferris-scan-tui-v"
                                   #$(package-version this-package)
                                   "-linux")
                    "ferris-scan-tui")
                   (chmod "ferris-scan-tui" #o755)))
               (add-after 'install 'patch-elf
                 (lambda* (#:key inputs outputs #:allow-other-keys)
                   (let ((out (assoc-ref outputs "out"))
                         (patchelf (search-input-file inputs "bin/patchelf"))
                         (ld-linux (search-input-file
                                   inputs "lib/ld-linux-x86-64.so.2")))
                     (invoke patchelf "--set-interpreter" ld-linux
                             (string-append out "/bin/ferris-scan-tui"))))))))
    (native-inputs (list patchelf))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Vnilabean/ferris-scan")
    (synopsis "lightweight Rust-based file scanner")
    (description
     "Ferris-scan is a lightweight file scanner written in Rust.  It provides
both a TUI and GUI interface for scanning files and directories.")
    (license license:expat)))

;;;
;;; ── sabiql-bin ──────────────────────────────────────────────
;;; PostgreSQL TUI browser/editor (pre-built binary)
;;;
(define-public sabiql-bin
  (package
    (name "sabiql-bin")
    (version "1.9.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/riii111/sabiql/releases/download/v"
             version "/sabiql-x86_64-unknown-linux-gnu.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("sabiql" "bin/sabiql"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'patch-elf
                 (lambda* (#:key inputs outputs #:allow-other-keys)
                   (let ((out (assoc-ref outputs "out"))
                         (patchelf (search-input-file inputs "bin/patchelf"))
                         (ld-linux (search-input-file
                                   inputs "lib/ld-linux-x86-64.so.2")))
                     (invoke patchelf "--set-interpreter" ld-linux
                             (string-append out "/bin/sabiql"))))))))
    (native-inputs (list patchelf))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/riii111/sabiql")
    (synopsis "fast driver-less TUI for PostgreSQL databases")
    (description
     "Sabiql is a fast, driver-less TUI to browse, query, and edit PostgreSQL
databases.  It provides an interactive interface for database exploration
without requiring database-specific drivers.")
    (license license:expat)))

;;;
;;; ── claude-code-seccomp ──────────────────────────────────────────────
;;; Seccomp filter dependency for Claude Code sandbox
;;;
(define-public claude-code-seccomp
  (package
    (name "claude-code-seccomp")
    (version "0.0.35")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://raw.githubusercontent.com/anthropic-experimental/"
             "sandbox-runtime/4fad8fa35db3f09958db1df401b30bd00402b611/"
             "vendor/seccomp/x64/apply-seccomp"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("apply-seccomp"
                "lib/claude-code-seccomp/apply-seccomp"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'make-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((out (assoc-ref outputs "out")))
                     (chmod (string-append
                             out "/lib/claude-code-seccomp/apply-seccomp")
                            #o755)))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/anthropic-experimental/sandbox-runtime")
    (synopsis "seccomp filter dependency for Claude Code sandbox")
    (description
     "Claude-code-seccomp provides the seccomp BPF filter and the apply-seccomp
binary used by Claude Code's @code{/sandbox} command to create restricted
execution environments.")
    (license license:asl2.0)))

;;;
;;; ── meta-package-manager-bin ──────────────────────────────────────────────
;;; Wrapper around all package managers (pre-built binary)
;;;
(define-public meta-package-manager-bin
  (package
    (name "meta-package-manager-bin")
    (version "6.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/kdeldycke/meta-package-manager/releases/"
             "download/v" version
             "/meta-package-manager-" version "-linux-x64.bin"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("mpm" "bin/mpm"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'unpack 'rename-source
                 (lambda _
                   (rename-file
                    (string-append "meta-package-manager-"
                                   #$(package-version this-package)
                                   "-linux-x64.bin")
                    "mpm")
                   (chmod "mpm" #o755)))
               (add-after 'install 'patch-elf
                 (lambda* (#:key inputs outputs #:allow-other-keys)
                   (let ((out (assoc-ref outputs "out"))
                         (patchelf (search-input-file inputs "bin/patchelf"))
                         (ld-linux (search-input-file
                                   inputs "lib/ld-linux-x86-64.so.2")))
                     (invoke patchelf "--set-interpreter" ld-linux
                             (string-append out "/bin/mpm"))))))))
    (native-inputs (list patchelf))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/kdeldycke/meta-package-manager")
    (synopsis "wrapper around all package managers")
    (description
     "Meta Package Manager (mpm) is a CLI that wraps all package managers.
It provides a unified interface to search, install, upgrade, and remove
packages across multiple package manager backends.")
    (license license:gpl2+)))

;;;
;;; ── bililive-recorder-bin ──────────────────────────────────────────────
;;; BiliBili stream recorder (pre-built .NET binary)
;;;
(define-public bililive-recorder-bin
  (package
    (name "bililive-recorder-bin")
    (version "2.17.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/Bililive/BililiveRecorder/releases/"
             "download/v" version
             "/BililiveRecorder-CLI-linux-x64.zip"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("BililiveRecorder.Cli"
                "bin/bililive-recorder"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'patch-elf
                 (lambda* (#:key inputs outputs #:allow-other-keys)
                   (let ((out (assoc-ref outputs "out"))
                         (patchelf (search-input-file inputs "bin/patchelf"))
                         (ld-linux (search-input-file
                                   inputs "lib/ld-linux-x86-64.so.2")))
                     (invoke patchelf "--set-interpreter" ld-linux
                             (string-append out
                                            "/bin/bililive-recorder"))))))))
    (native-inputs (list patchelf unzip))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Bililive/BililiveRecorder")
    (synopsis "BiliBili live stream recorder")
    (description
     "BililiveRecorder is a stream recording tool for BiliBili live streams.
It provides a CLI for recording live broadcasts from the BiliBili
streaming platform.")
    (license license:gpl3)))

;;;
;;; ── air-bin ──────────────────────────────────────────────
;;; Live reload for Go apps (pre-built binary)
;;;
(define-public air-bin
  (package
    (name "air-bin")
    (version "1.65.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/air-verse/air/releases/download/v"
             version "/air_" version "_linux_amd64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("air" "bin/air"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'patch-elf
                 (lambda* (#:key inputs outputs #:allow-other-keys)
                   (let ((out (assoc-ref outputs "out"))
                         (patchelf (search-input-file inputs "bin/patchelf"))
                         (ld-linux (search-input-file
                                   inputs "lib/ld-linux-x86-64.so.2")))
                     (invoke patchelf "--set-interpreter" ld-linux
                             (string-append out "/bin/air"))))))))
    (native-inputs (list patchelf))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/air-verse/air")
    (synopsis "live reload for Go applications")
    (description
     "Air is a live-reloading command-line tool for Go applications.
It watches source files for changes and automatically rebuilds and
restarts the application during development.")
    (license license:gpl3+)))

;;;
;;; ── zigmir-bin ──────────────────────────────────────────────
;;; Arch Linux mirror speed tester (pre-built binary)
;;;
(define-public zigmir-bin
  (package
    (name "zigmir-bin")
    (version "0.0.6")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/rownix101/zigmir/releases/download/v"
             version "/zigmir-linux-amd64"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("zigmir-linux-amd64" "bin/zigmir"))
           #:phases
           #~(modify-phases %standard-phases
               (add-before 'install 'chmod
                 (lambda _
                   (chmod "zigmir-linux-amd64" #o755)))
               (add-after 'install 'patch-elf
                 (lambda* (#:key inputs outputs #:allow-other-keys)
                   (let ((out (assoc-ref outputs "out"))
                         (patchelf (search-input-file inputs "bin/patchelf"))
                         (ld-linux (search-input-file
                                   inputs "lib/ld-linux-x86-64.so.2")))
                     (invoke patchelf "--set-interpreter" ld-linux
                             (string-append out "/bin/zigmir"))))))))
    (native-inputs (list patchelf))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/rownix101/zigmir")
    (synopsis "fast Arch Linux mirror speed tester written in Zig")
    (description
     "Zigmir is a fast Arch Linux mirror speed tester written in Zig.
It tests download speeds from multiple mirrors to help find the fastest
package source.")
    (license license:expat)))

;;;
;;; ── gopac-bin ──────────────────────────────────────────────
;;; TUI for Arch Linux package management (pre-built binary)
;;;
(define-public gopac-bin
  (package
    (name "gopac-bin")
    (version "1.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/the-daonm/gopac/releases/download/v"
             version "/gopac"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("gopac" "bin/gopac"))
           #:phases
           #~(modify-phases %standard-phases
               (add-before 'install 'chmod
                 (lambda _
                   (chmod "gopac" #o755)))
               (add-after 'install 'patch-elf
                 (lambda* (#:key inputs outputs #:allow-other-keys)
                   (let ((out (assoc-ref outputs "out"))
                         (patchelf (search-input-file inputs "bin/patchelf"))
                         (ld-linux (search-input-file
                                   inputs "lib/ld-linux-x86-64.so.2")))
                     (invoke patchelf "--set-interpreter" ld-linux
                             (string-append out "/bin/gopac"))))))))
    (native-inputs (list patchelf))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/the-daonm/gopac")
    (synopsis "TUI for Arch Linux package management")
    (description
     "Gopac is a warm, beautiful TUI for Arch Linux package management.
It provides a terminal interface for browsing, searching, and managing
packages through pacman, yay, or paru.")
    (license license:expat)))

;;;
;;; ── lian-bin ──────────────────────────────────────────────
;;; TUI frontend for paru/yay/pacman (pre-built binary)
;;;
(define-public lian-bin
  (package
    (name "lian-bin")
    (version "2.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/Yueosa/lian/releases/download/v"
             version "/lian_" version "_linux_x86_64"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("lian" "bin/lian"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'unpack 'rename-source
                 (lambda _
                   (rename-file
                    (string-append "lian_"
                                   #$(package-version this-package)
                                   "_linux_x86_64")
                    "lian")
                   (chmod "lian" #o755)))
               (add-after 'install 'patch-elf
                 (lambda* (#:key inputs outputs #:allow-other-keys)
                   (let ((out (assoc-ref outputs "out"))
                         (patchelf (search-input-file inputs "bin/patchelf"))
                         (ld-linux (search-input-file
                                   inputs "lib/ld-linux-x86-64.so.2")))
                     (invoke patchelf "--set-interpreter" ld-linux
                             (string-append out "/bin/lian"))))))))
    (native-inputs (list patchelf))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Yueosa/lian")
    (synopsis "TUI frontend for paru/yay/pacman with AI-powered analysis")
    (description
     "Lian is a TUI frontend for paru, yay, and pacman with AI-powered
operation analysis.  It provides an interactive interface for package
management with intelligent suggestions.")
    (license license:expat)))

;;;
;;; ── spout2pw-bin ──────────────────────────────────────────────
;;; Spout2 to PipeWire bridge (pre-built binary)
;;;
(define-public spout2pw-bin
  (package
    (name "spout2pw-bin")
    (version "0.2.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/hoshinolina/spout2pw/releases/download/"
             version "/spout2pw-" version "-bin.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("spout2pw" "bin/spout2pw"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'patch-elf
                 (lambda* (#:key inputs outputs #:allow-other-keys)
                   (let ((out (assoc-ref outputs "out"))
                         (patchelf (search-input-file inputs "bin/patchelf"))
                         (ld-linux (search-input-file
                                   inputs "lib/ld-linux-x86-64.so.2")))
                     (invoke patchelf "--set-interpreter" ld-linux
                             (string-append out "/bin/spout2pw"))))))))
    (native-inputs (list patchelf))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/hoshinolina/spout2pw")
    (synopsis "Spout2 to PipeWire bridge")
    (description
     "Spout2pw bridges Spout2 video sharing to PipeWire.  It allows
applications using the Spout2 protocol to share video frames through
PipeWire's media-sharing infrastructure.")
    (license license:lgpl2.1)))

;;;
;;; ── snipaste ──────────────────────────────────────────────
;;; Screenshot snip & paste tool (AppImage)
;;;
(define-public snipaste
  (package
    (name "snipaste")
    (version "2.11.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://download.snipaste.com/archives/Snipaste-"
             version "-x86_64.AppImage"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("snipaste" "bin/snipaste"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'unpack 'rename-source
                 (lambda _
                   (rename-file
                    (string-append "Snipaste-"
                                   #$(package-version this-package)
                                   "-x86_64.AppImage")
                    "snipaste")
                   (chmod "snipaste" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.snipaste.com")
    (synopsis "screenshot tool with snip and paste functionality")
    (description
     "Snipaste is a screenshot tool that allows you to snip any area of
your screen, pin the screenshot as a floating window, and paste images
or text from the clipboard back onto the screen.")
    ;; Proprietary; custom Snipaste license.
    (license #f)))

;;;
;;; ── boscaceoil-blue-bin ──────────────────────────────────────────────
;;; Beginner-friendly music maker (Godot, pre-built binary)
;;;
(define-public boscaceoil-blue-bin
  (package
    (name "boscaceoil-blue-bin")
    (version "3.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/YuriSizov/boscaceoil-blue/releases/"
             "download/" version "-stable/"
             "boscaceoil-blue-linux-x86_64.zip"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("boscaceoil-blue.x86_64" "bin/boscaceoil-blue")
               ("boscaceoil-blue.pck" "share/boscaceoil-blue/boscaceoil-blue.pck")
               ("libgdsion.linux.template_release.x86_64.so"
                "lib/boscaceoil-blue/libgdsion.linux.template_release.x86_64.so"))))
    (native-inputs (list unzip))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/YuriSizov/boscaceoil-blue")
    (synopsis "simple and beginner-friendly app for making music")
    (description
     "Bosca Ceoil Blue is a simple and beginner-friendly music creation
application.  Built with Godot, it provides an accessible interface for
composing chiptune and electronic music.")
    (license license:expat)))

;;;
;;; ── reqable-bin ──────────────────────────────────────────────
;;; HTTP development and debugger (pre-built binary from .deb)
;;;
(define-public reqable-bin
  (package
    (name "reqable-bin")
    (version "3.0.40")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/reqable/reqable-app/releases/download/"
             version "/reqable-app-linux-x86_64.deb"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("opt/reqable/." "lib/reqable/"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (invoke "ar" "x" source)
                   (invoke "tar" "xf" "data.tar.xz"))))))
    (native-inputs (list patchelf))
    (supported-systems '("x86_64-linux"))
    (home-page "https://reqable.com")
    (synopsis "cross-platform HTTP development and debugging tool")
    (description
     "Reqable is a cross-platform professional HTTP development and debugging
tool that supports HTTP/1, HTTP/2, and HTTP/3 (QUIC) protocols.  It provides
traffic analysis, API testing, and request modification capabilities.")
    ;; Proprietary; custom Reqable license.
    (license #f)))

;;;
;;; ── flclash-bin ──────────────────────────────────────────────
;;; Multi-platform proxy client (pre-built binary from .deb)
;;;
(define-public flclash-bin
  (package
    (name "flclash-bin")
    (version "0.8.92")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/chen08209/FlClash/releases/download/v"
             version "/FlClash-" version "-linux-amd64.deb"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("usr/share/FlClash/." "lib/flclash/"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (invoke "ar" "x" source)
                   (invoke "tar" "xf" "data.tar.xz"))))))
    (native-inputs (list patchelf))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/chen08209/FlClash")
    (synopsis "multi-platform proxy client based on ClashMeta")
    (description
     "FlClash is a multi-platform proxy client based on ClashMeta.  It provides
a simple, easy-to-use interface for configuring and managing proxy rules
and connections.")
    (license license:gpl3)))

;;;
;;; ── geforce-infinity-bin ──────────────────────────────────────────────
;;; GeForce NOW enhancer (pre-built binary from .deb)
;;;
(define-public geforce-infinity-bin
  (package
    (name "geforce-infinity-bin")
    (version "1.2.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/AstralVixen/GeForce-Infinity/releases/"
             "download/" version
             "/GeForceInfinity-linux-" version "-amd64.deb"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("usr/lib/geforce-infinity/."
                "lib/geforce-infinity/"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (invoke "ar" "x" source)
                   (invoke "tar" "xf" "data.tar.xz"))))))
    (native-inputs (list patchelf))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/AstralVixen/GeForce-Infinity")
    (synopsis "application to enhance the GeForce NOW experience")
    (description
     "GeForce Infinity is an application designed to enhance the GeForce NOW
cloud gaming experience.  It provides additional features and quality-of-life
improvements for NVIDIA's cloud gaming service.")
    (license license:expat)))

;;;
;;; ── python-pysmart ──────────────────────────────────────────────
;;; Python wrapper for smartctl (smartmontools)
;;;
(define-public python-pysmart
  (package
    (name "python-pysmart")
    (version "1.4.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/freenas/py-SMART")
             (commit "d1db1071d9732d088fa64f3cff2f6223e1cdc830")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs
     (list python-setuptools python-setuptools-scm python-wheel))
    (propagated-inputs
     (list python-chardet python-humanfriendly))
    (home-page "https://github.com/freenas/py-SMART")
    (synopsis "wrapper for smartctl from smartmontools")
    (description
     "PySMART is a Python wrapper for the @code{smartctl} utility from
smartmontools.  It provides a programmatic interface for querying
S.M.A.R.T.@: data from storage devices, allowing Python applications
to monitor disk health.")
    (license license:lgpl2.1+)))

;;;
;;; ── openhue-cli ──────────────────────────────────────────────
;;; CLI for Philips Hue smart lighting (Go source build)
;;;
(define-public openhue-cli
  (package
    (name "openhue-cli")
    (version "0.23")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/openhue/openhue-cli/archive/refs/tags/"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/openhue/openhue-cli"
           #:install-source? #f
           #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (replace 'build
                 (lambda* (#:key import-path #:allow-other-keys)
                   (with-directory-excursion
                       (string-append "src/" import-path)
                     (invoke "go" "build" "-o" "build/openhue" "./..."))))
               (replace 'install
                 (lambda* (#:key import-path outputs #:allow-other-keys)
                   (let ((bin (string-append (assoc-ref outputs "out")
                                             "/bin")))
                     (with-directory-excursion
                         (string-append "src/" import-path)
                       (install-file "build/openhue" bin))))))))
    (home-page "https://www.openhue.io/cli/openhue-cli")
    (synopsis "CLI for interacting with Philips Hue smart lighting")
    (description
     "OpenHue CLI is a command-line interface for interacting with Philips
Hue smart lighting systems.  It provides commands for controlling lights,
rooms, scenes, and other Hue bridge resources.")
    (license license:asl2.0)))

;;;
;;; ── libmodule ──────────────────────────────────────────────
;;; C library for modular event-driven projects
;;;
(define-public libmodule
  (package
    (name "libmodule")
    (version "5.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/FedeDP/libmodule/archive/"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/FedeDP/libmodule")
    (synopsis "C library to build modular event-driven projects")
    (description
     "Libmodule is a C library for building simple and modular event-driven
projects on Linux.  It provides an event loop, module lifecycle management,
and inter-module communication facilities.")
    (license license:expat)))
