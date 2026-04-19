;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260419g
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages.
;;;
;;; New recipes (20 resolved, 20 definitions):
;;;        1.  iwmenu-bin (copy-build-system, v0.4.0, GPL-3.0)
;;;        2.  bzmenu-bin (copy-build-system, v0.4.0, GPL-3.0)
;;;        3.  pwmenu-bin (copy-build-system, v0.4.0, GPL-3.0)
;;;        4.  sabiql-bin (copy-build-system, v1.11.0, MIT)
;;;        5.  comp-scan-bin (copy-build-system, v0.1.0, MIT)
;;;        6.  omp-manager-bin (copy-build-system, v0.1.2, MIT)
;;;        7.  feedr-bin (copy-build-system, v0.7.0, MIT)
;;;        8.  wrkflw-bin (copy-build-system, v0.7.3, MIT)
;;;        9.  crier-bin (copy-build-system, v0.2.3, MIT)
;;;       10.  ferrishot-bin (copy-build-system, v0.2.0, MIT/Apache-2.0)
;;;       11.  ferris-scan-bin (copy-build-system, v0.25, MIT)
;;;       12.  claude-code-seccomp (copy-build-system, v0.0.35, Apache-2.0)
;;;       13.  libmodule (cmake-build-system, v5.0.2, MIT)
;;;       14.  wo-bin (copy-build-system, v1.0.0, MIT)
;;;       15.  mezzotone-bin (copy-build-system, v1.1.1, MIT)
;;;       16.  console2svg-bin (copy-build-system, v0.6.5, Apache-2.0)
;;;       17.  funzzy-bin (copy-build-system, v1.5.0, MIT)
;;;       18.  lazytail-bin (copy-build-system, v0.10.0, MIT)
;;;       19.  oken-bin (copy-build-system, v0.3.8, MIT)
;;;       20.  workz-bin (copy-build-system, v0.8.0, MIT)
;;;
;;; BLOCKED EXHAUSTED (10):
;;;        1.  boscaceoil-blue-bin — GODOT_RUNTIME_DEPS
;;;        2.  openhue-cli — GO_VENDORED_DEPS
;;;        3.  framework-control-bin — MISSING_GUIX_DEPS
;;;        4.  tufw-git — RUST_VENDORED_DEPS
;;;        5.  mas — SOURCE_UNAVAILABLE
;;;        6.  pandoc-crossref-bin — MISSING_GUIX_DEPS
;;;        7.  noto-fonts-cjk-fontconfig — ALREADY_PACKAGED_PRIOR
;;;        8.  fish-session — LICENSE_MISSING + RUST_VENDORED_DEPS
;;;        9.  reqable-bin — PROPRIETARY
;;;       10.  tmux-plugin-panel-bin — NO_RELEASE_PATTERN
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Use `guix download` or `guix hash` to obtain real hashes.

(define-module (gaurix packages recipe-resolver-260419g)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages pkg-config)
  #:export (iwmenu-bin
            bzmenu-bin
            pwmenu-bin
            sabiql-bin
            comp-scan-bin
            omp-manager-bin
            feedr-bin
            wrkflw-bin
            crier-bin
            ferrishot-bin
            ferris-scan-bin
            claude-code-seccomp
            libmodule
            wo-bin
            mezzotone-bin
            console2svg-bin
            funzzy-bin
            lazytail-bin
            oken-bin
            workz-bin))

;;; ===================================================================
;;; 1. iwmenu-bin --- Launcher-driven Wi-Fi manager for Linux
;;; ===================================================================
;;;
;;; Source: https://github.com/e-tho/iwmenu
;;; Prebuilt Rust binary for managing Wi-Fi connections via a launcher
;;; interface (dmenu, rofi, fuzzel, etc.).

(define-public iwmenu-bin
  (package
    (name "iwmenu-bin")
    (version "0.4.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/e-tho/iwmenu/releases/download/v"
                    version "/iwmenu-x86_64-linux-gnu"))
              (file-name (string-append name "-" version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("iwmenu" "bin/iwmenu"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (copy-file source "iwmenu")
                   (chmod "iwmenu" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/e-tho/iwmenu")
    (synopsis "launcher-driven Wi-Fi manager for Linux")
    (description "iwmenu is a launcher-driven Wi-Fi manager for Linux.
It provides an interactive interface through launchers like dmenu, rofi,
or fuzzel to scan, connect, and manage Wi-Fi networks via iwd.")
    (license license:gpl3+)))

;;; ===================================================================
;;; 2. bzmenu-bin --- Launcher-driven Bluetooth manager for Linux
;;; ===================================================================
;;;
;;; Source: https://github.com/e-tho/bzmenu
;;; Prebuilt Rust binary for managing Bluetooth devices via a launcher.

(define-public bzmenu-bin
  (package
    (name "bzmenu-bin")
    (version "0.4.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/e-tho/bzmenu/releases/download/v"
                    version "/bzmenu-x86_64-linux-gnu"))
              (file-name (string-append name "-" version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("bzmenu" "bin/bzmenu"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (copy-file source "bzmenu")
                   (chmod "bzmenu" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/e-tho/bzmenu")
    (synopsis "launcher-driven Bluetooth manager for Linux")
    (description "bzmenu is a launcher-driven Bluetooth manager for Linux.
It provides an interactive interface through launchers like dmenu, rofi,
or fuzzel to scan, pair, connect, and manage Bluetooth devices.")
    (license license:gpl3+)))

;;; ===================================================================
;;; 3. pwmenu-bin --- Launcher-driven audio manager for Linux
;;; ===================================================================
;;;
;;; Source: https://github.com/e-tho/pwmenu
;;; Prebuilt Rust binary for managing PipeWire audio via a launcher.

(define-public pwmenu-bin
  (package
    (name "pwmenu-bin")
    (version "0.4.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/e-tho/pwmenu/releases/download/v"
                    version "/pwmenu-x86_64-linux-gnu"))
              (file-name (string-append name "-" version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("pwmenu" "bin/pwmenu"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (copy-file source "pwmenu")
                   (chmod "pwmenu" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/e-tho/pwmenu")
    (synopsis "launcher-driven audio manager for Linux")
    (description "pwmenu is a launcher-driven audio manager for Linux.
It provides an interactive interface through launchers like dmenu, rofi,
or fuzzel to manage PipeWire audio sinks and sources.")
    (license license:gpl3+)))

;;; ===================================================================
;;; 4. sabiql-bin --- TUI for PostgreSQL databases
;;; ===================================================================
;;;
;;; Source: https://github.com/riii111/sabiql
;;; Fast, driver-less TUI to browse, query, and edit PostgreSQL databases.

(define-public sabiql-bin
  (package
    (name "sabiql-bin")
    (version "1.11.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/riii111/sabiql/releases/download/v"
                    version "/sabiql-x86_64-unknown-linux-gnu.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("sabiql" "bin/sabiql"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/riii111/sabiql")
    (synopsis "fast TUI to browse, query, and edit PostgreSQL databases")
    (description "Sabiql is a fast, driver-less terminal user interface for
browsing, querying, and editing PostgreSQL databases.  It connects directly
without requiring external database drivers.")
    (license license:expat)))

;;; ===================================================================
;;; 5. comp-scan-bin --- System scanner with improvement suggestions
;;; ===================================================================
;;;
;;; Source: https://github.com/vvk147/comp-scan
;;; Local AI agent that scans your system and suggests improvements.

(define-public comp-scan-bin
  (package
    (name "comp-scan-bin")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/vvk147/comp-scan/releases/download/v"
                    version "/compscan-x86_64-unknown-linux-gnu.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("compscan" "bin/compscan"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/vvk147/comp-scan")
    (synopsis "local system scanner with improvement suggestions")
    (description "comp-scan is a local AI agent that scans your system,
observes usage patterns, and suggests one-click improvements.  It runs
entirely locally without sending data externally.")
    (license license:expat)))

;;; ===================================================================
;;; 6. omp-manager-bin --- Installation and manager for Oh My Posh
;;; ===================================================================
;;;
;;; Source: https://github.com/marlocarlo/omp-manager
;;; Manages Oh My Posh theme engine installation and configuration.

(define-public omp-manager-bin
  (package
    (name "omp-manager-bin")
    (version "0.1.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/marlocarlo/omp-manager/releases/download/v"
                    version "/omp-manager-x86_64-unknown-linux-gnu.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("omp-manager" "bin/omp-manager"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/marlocarlo/omp-manager")
    (synopsis "installation and manager for Oh My Posh")
    (description "omp-manager is a command-line tool for installing and managing
Oh My Posh, a prompt theme engine for any shell.  It handles installation,
theme selection, and configuration.")
    (license license:expat)))

;;; ===================================================================
;;; 7. feedr-bin --- Terminal RSS/Atom feed reader
;;; ===================================================================
;;;
;;; Source: https://github.com/bahdotsh/feedr
;;; Feature-rich terminal-based RSS/Atom feed reader written in Rust.

(define-public feedr-bin
  (package
    (name "feedr-bin")
    (version "0.7.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/bahdotsh/feedr/releases/download/v"
                    version "/feedr-linux-x86_64"))
              (file-name (string-append name "-" version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("feedr" "bin/feedr"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (copy-file source "feedr")
                   (chmod "feedr" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/bahdotsh/feedr")
    (synopsis "terminal-based RSS/Atom feed reader")
    (description "Feedr is a feature-rich terminal-based RSS and Atom feed
reader written in Rust.  It supports multiple feed formats and provides a
keyboard-driven interface for reading and managing feeds.")
    (license license:expat)))

;;; ===================================================================
;;; 8. wrkflw-bin --- Validate and run GitHub Actions locally
;;; ===================================================================
;;;
;;; Source: https://github.com/bahdotsh/wrkflw
;;; Validates and executes GitHub Actions workflows on local machines.

(define-public wrkflw-bin
  (package
    (name "wrkflw-bin")
    (version "0.7.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/bahdotsh/wrkflw/releases/download/v"
                    version "/wrkflw-v" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("wrkflw" "bin/wrkflw"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/bahdotsh/wrkflw")
    (synopsis "validate and execute GitHub Actions workflows locally")
    (description "wrkflw validates and executes GitHub Actions workflows on
your local machine.  It parses workflow YAML files, checks for errors, and
runs the defined steps locally for testing before pushing.")
    (license license:expat)))

;;; ===================================================================
;;; 9. crier-bin --- Push notification tool for LAN and internet
;;; ===================================================================
;;;
;;; Source: https://github.com/skorotkiewicz/crier
;;; Simple push notification tool supporting LAN (TCP) and internet (MQTT).

(define-public crier-bin
  (package
    (name "crier-bin")
    (version "0.2.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/skorotkiewicz/crier/releases/download/"
                    version "/crier-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("crier" "bin/crier"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/skorotkiewicz/crier")
    (synopsis "simple push notification tool for LAN and internet")
    (description "Crier is a simple push notification tool that works on
LAN via TCP or across the internet via MQTT.  It provides a lightweight
way to send and receive notifications between devices.")
    (license license:expat)))

;;; ===================================================================
;;; 10. ferrishot-bin --- Screenshot tool written in Rust
;;; ===================================================================
;;;
;;; Source: https://github.com/nik-rev/ferrishot
;;; A screenshot tool with annotation capabilities written in Rust.

(define-public ferrishot-bin
  (package
    (name "ferrishot-bin")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nik-rev/ferrishot/releases/download/v"
                    version "/ferrishot-x86_64-unknown-linux-gnu.tar.xz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("ferrishot" "bin/ferrishot"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nik-rev/ferrishot")
    (synopsis "screenshot tool written in Rust")
    (description "Ferrishot is a screenshot tool written in Rust.  It captures
screen regions and provides annotation features for marking up screenshots
before saving or sharing.")
    (license (list license:expat license:asl2.0))))

;;; ===================================================================
;;; 11. ferris-scan-bin --- Lightweight Rust-based file scanner
;;; ===================================================================
;;;
;;; Source: https://github.com/Vnilabean/ferris-scan
;;; Provides both TUI and GUI interfaces for scanning files.

(define-public ferris-scan-bin
  (package
    (name "ferris-scan-bin")
    (version "0.25")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Vnilabean/ferris-scan/releases/download/v"
                    version "/ferris-scan-tui-v" version "-linux"))
              (file-name (string-append name "-" version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("ferris-scan-tui" "bin/ferris-scan-tui"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (copy-file source "ferris-scan-tui")
                   (chmod "ferris-scan-tui" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Vnilabean/ferris-scan")
    (synopsis "lightweight Rust-based file scanner")
    (description "Ferris-scan is a lightweight file scanner written in Rust.
It provides a terminal user interface for scanning and browsing files on
your system.")
    (license license:expat)))

;;; ===================================================================
;;; 12. claude-code-seccomp --- Seccomp filter for Claude Code sandbox
;;; ===================================================================
;;;
;;; Source: https://github.com/anthropic-experimental/sandbox-runtime
;;; Provides seccomp BPF filter and applier binary for Claude Code's
;;; sandbox mode.

(define-public claude-code-seccomp
  (let ((commit "4fad8fa35db3f09958db1df401b30bd00402b611")
        (revision "0"))
    (package
      (name "claude-code-seccomp")
      (version (string-append "0.0.35-" revision "." (string-take commit 7)))
      (source (origin
                (method url-fetch)
                (uri (string-append
                      "https://raw.githubusercontent.com/"
                      "anthropic-experimental/sandbox-runtime/"
                      commit "/vendor/seccomp/x64/apply-seccomp"))
                (file-name (string-append name "-apply-seccomp-" version))
                (sha256
                 (base32
                  "0000000000000000000000000000000000000000000000000000"))))
      (build-system copy-build-system)
      (arguments
       (list #:install-plan
             #~'(("apply-seccomp" "lib/claude-code-seccomp/apply-seccomp"))
             #:phases
             #~(modify-phases %standard-phases
                 (replace 'unpack
                   (lambda* (#:key source #:allow-other-keys)
                     (copy-file source "apply-seccomp")
                     (chmod "apply-seccomp" #o755))))))
      (supported-systems '("x86_64-linux"))
      (home-page "https://github.com/anthropic-experimental/sandbox-runtime")
      (synopsis "seccomp filter dependency for Claude Code sandbox")
      (description "claude-code-seccomp provides the seccomp BPF filter and
applier binary used by Claude Code's @code{/sandbox} command.  It restricts
system calls available to sandboxed processes for security isolation.")
      (license license:asl2.0))))

;;; ===================================================================
;;; 13. libmodule --- Modular C library for event-driven applications
;;; ===================================================================
;;;
;;; Source: https://github.com/FedeDP/libmodule
;;; A C library to build simple and modular event-driven projects on Linux.

(define-public libmodule
  (package
    (name "libmodule")
    (version "5.0.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/FedeDP/libmodule/archive/"
                    version ".tar.gz"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (home-page "https://github.com/FedeDP/libmodule")
    (synopsis "C library to build modular event-driven projects")
    (description "Libmodule is a C library for building simple and modular
event-driven projects on Linux.  It provides a module registration system,
an event loop, and inter-module communication primitives.")
    (license license:expat)))

;;; ===================================================================
;;; 14. wo-bin --- Workspace shell manager
;;; ===================================================================
;;;
;;; Source: https://github.com/antham/wo
;;; A workspace shell manager for organizing shell environments.

(define-public wo-bin
  (package
    (name "wo-bin")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/antham/wo/releases/download/v"
                    version "/wo_" version "_linux_amd64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("wo" "bin/wo"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/antham/wo")
    (synopsis "workspace shell manager")
    (description "Wo is a workspace shell manager that helps organize and
switch between different shell working environments.  It provides a simple
interface for managing project-specific shell configurations.")
    (license license:expat)))

;;; ===================================================================
;;; 15. mezzotone-bin --- Terminal image-to-ASCII converter
;;; ===================================================================
;;;
;;; Source: https://github.com/joaoheitorgarcia/Mezzotone
;;; A TUI application that converts images and GIFs into halftone art.

(define-public mezzotone-bin
  (package
    (name "mezzotone-bin")
    (version "1.1.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/joaoheitorgarcia/Mezzotone/releases/download/v"
                    version "/mezzotone-linux-amd64"))
              (file-name (string-append name "-" version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("mezzotone" "bin/mezzotone"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (copy-file source "mezzotone")
                   (chmod "mezzotone" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/joaoheitorgarcia/Mezzotone")
    (synopsis "terminal application for converting images to halftone art")
    (description "Mezzotone is a terminal user interface application written
in Go that converts images and GIFs into halftone art.  It supports various
dithering algorithms and output formats.")
    (license license:expat)))

;;; ===================================================================
;;; 16. console2svg-bin --- Convert terminal output to SVG images
;;; ===================================================================
;;;
;;; Source: https://github.com/arika0093/console2svg
;;; Converts terminal ANSI output into SVG images for documentation.

(define-public console2svg-bin
  (package
    (name "console2svg-bin")
    (version "0.6.5")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/arika0093/console2svg/releases/download/v"
                    version "/console2svg-x86_64-unknown-linux-gnu.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("console2svg" "bin/console2svg"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/arika0093/console2svg")
    (synopsis "convert terminal output into SVG images")
    (description "console2svg converts terminal output with ANSI escape codes
into SVG images.  It is useful for creating clean visual representations of
terminal sessions for documentation and presentations.")
    (license license:asl2.0)))

;;; ===================================================================
;;; 17. funzzy-bin --- Lightweight file watcher
;;; ===================================================================
;;;
;;; Source: https://github.com/cristianoliveira/funzzy
;;; A lightweight generic purpose file watcher written in Rust.

(define-public funzzy-bin
  (package
    (name "funzzy-bin")
    (version "1.5.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/cristianoliveira/funzzy/releases/download/v"
                    version "/funzzy-x86_64-unknown-linux-gnu.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("funzzy" "bin/funzzy"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/cristianoliveira/funzzy")
    (synopsis "lightweight generic purpose file watcher")
    (description "Funzzy is a lightweight, configurable file watcher written
in Rust.  It watches for filesystem changes and runs user-defined commands
when files matching configured patterns are modified.")
    (license license:expat)))

;;; ===================================================================
;;; 18. lazytail-bin --- Terminal log viewer with live filtering
;;; ===================================================================
;;;
;;; Source: https://github.com/raaymax/lazytail
;;; Fast, universal terminal-based log viewer with follow mode.

(define-public lazytail-bin
  (package
    (name "lazytail-bin")
    (version "0.10.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/raaymax/lazytail/releases/download/v"
                    version "/lazytail-x86_64-unknown-linux-gnu.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("lazytail" "bin/lazytail"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/raaymax/lazytail")
    (synopsis "terminal log viewer with live filtering and follow mode")
    (description "Lazytail is a fast, universal terminal-based log viewer
with live filtering and follow mode.  It supports real-time log tailing
with interactive search and filtering capabilities.")
    (license license:expat)))

;;; ===================================================================
;;; 19. oken-bin --- SSH CLI with host management and fuzzy picker
;;; ===================================================================
;;;
;;; Source: https://github.com/linkwithjoydeep/oken
;;; A smarter SSH CLI with better host management and fuzzy host picker.

(define-public oken-bin
  (package
    (name "oken-bin")
    (version "0.3.8")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/linkwithjoydeep/oken/releases/download/v"
                    version "/oken-x86_64-unknown-linux-gnu.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("oken" "bin/oken"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/linkwithjoydeep/oken")
    (synopsis "SSH CLI with host management and fuzzy picker")
    (description "Oken is a smarter SSH command-line interface with better
host management and a fuzzy host picker.  It works standalone or alongside
your existing SSH configuration to streamline remote connections.")
    (license license:expat)))

;;; ===================================================================
;;; 20. workz-bin --- Git worktree manager with dependency sync
;;; ===================================================================
;;;
;;; Source: https://github.com/rohansx/workz
;;; Git worktrees with zero-config dependency sync and fleet mode.

(define-public workz-bin
  (package
    (name "workz-bin")
    (version "0.8.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/rohansx/workz/releases/download/v"
                    version "/workz-x86_64-unknown-linux-gnu.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("workz" "bin/workz"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/rohansx/workz")
    (synopsis "git worktree manager with dependency sync")
    (description "Workz provides Git worktree management with zero-config
dependency synchronization and fleet mode for parallel development across
multiple worktrees.")
    (license license:expat)))
