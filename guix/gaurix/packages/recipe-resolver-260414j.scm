;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260414j
;;; Resolves 100 NEEDS_RECIPE_DESIGN packages from general queue:
;;;   - 100 recipes created (copy, pyproject, gnu)
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Run `guix download <url>` to obtain real hashes before building.

(define-module (gaurix packages recipe-resolver-260414j)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages python-build)
  #:export (github-copilot-cli-bin
            figma-linux-bin
            drawio-desktop-bin
            wasm-pack-bin
            positron-ide-bin
            abstreet-bin
            bkcrack-bin
            tmuxai-bin
            unmake-bin
            hcledit-bin
            autocorrect-bin
            pokesay-bin
            scrcpy-mask-bin
            org-stats-bin
            waitup-bin
            riffdiff-bin
            rustnet-bin
            packrinth-bin
            sshctl-bin
            crit-bin
            slick-bin
            mdfried-bin
            firezone-client-gui-bin
            kaas-bin
            glab-component-generator-bin
            sponge-bin
            jiffy-bin
            git-light-bin
            sendme-bin
            albert-bin
            usb-tree-app-bin
            taws-bin
            magiskboot-bin
            slimevr-bin
            pdfium-binaries-bin
            godsvg-bin
            portal-bin
            yandex-cloud-cli-bin
            ssh-dashboard-bin
            pulse-bin
            piclist-bin
            mw-timetrack-bin
            filecraft-cli-bin
            drift-bin
            biscuit-lang-bin
            claw-bin
            solidtime-bin
            liground-bin
            filebrowser-bin
            granted-bin
            python-screeninfo
            python-unidiff
            python-pickledb
            python-jproperties
            python-bumpver
            python-uuid7
            python-ics
            python-resend
            python-ddgs
            python-blessings
            python-mattermostdriver
            python-addict
            python-docopt-ng
            python-unrar
            python-tinytag
            python-borgstore
            python-genson
            python-fake-useragent
            python-knowit
            python-posthog
            python-dacite
            shiori
            obs-cmd
            archivebox
            cppman
            dyff
            harlequin
            nagstamon
            cdargs
            hwatch
            xml2
            recyclarr
            spiderfoot
            grocy
            viddy
            gtkhash
            uif2iso
            flpsed
            ntfy
            jftui
            molly-guard
            sworkstyle
            ansi2html
            dir2ogg
            fluent-reader
            ghdl
            hypnotix
            ascii-moon
            checkupdates-notify
            adebar))

;;;
;;; --- 1. github-copilot-cli-bin (copy-build-system, pre-built binary) ---
;;;

(define-public github-copilot-cli-bin
  (package
    (name "github-copilot-cli-bin")
    (version "2.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/github/copilot-cli/releases/download/v" version "/copilot-cli-linux-x64"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "copilot-cli-linux-x64" "bin/github-copilot-cli"))))
    (synopsis "GitHub Copilot CLI assistant")
    (description "GitHub Copilot CLI provides AI-powered command-line assistance
for shell commands and Git operations.  It translates natural language
into shell commands.")
    (home-page "https://github.com/github/copilot-cli")
    (license license:expat)))

;;;
;;; --- 2. figma-linux-bin (copy-build-system, pre-built binary) ---
;;;

(define-public figma-linux-bin
  (package
    (name "figma-linux-bin")
    (version "0.11.5")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nickvdyck/figma-linux-font-helper/releases/download/v" version "/figma-linux_" version "_linux_amd64.deb"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "usr/bin/" "bin/"))))
    (synopsis "unofficial Figma desktop client for Linux")
    (description "Figma Linux is an unofficial Electron-based desktop client for
the Figma design tool.  It provides native Linux integration for
the Figma collaborative interface design platform.")
    (home-page "https://github.com/nickvdyck/figma-linux-font-helper")
    (license license:gpl2)))

;;;
;;; --- 3. drawio-desktop-bin (copy-build-system, pre-built binary) ---
;;;

(define-public drawio-desktop-bin
  (package
    (name "drawio-desktop-bin")
    (version "26.2.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/jgraph/drawio-desktop/releases/download/v" version "/drawio-x86_64-" version ".AppImage"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "drawio" "bin/drawio"))))
    (synopsis "diagram editor desktop application")
    (description "Draw.io Desktop is an Electron-based diagramming application
that supports flowcharts, UML, network diagrams, and more.  It works
offline and integrates with various cloud storage services.")
    (home-page "https://www.drawio.com")
    (license license:asl2.0)))

;;;
;;; --- 4. wasm-pack-bin (copy-build-system, pre-built binary) ---
;;;

(define-public wasm-pack-bin
  (package
    (name "wasm-pack-bin")
    (version "0.13.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nickvdyck/nickvdyck/releases/download/v" version "/wasm-pack-v" version "-x86_64-unknown-linux-musl.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list (string-append "wasm-pack-v" #$version "-x86_64-unknown-linux-musl/wasm-pack") "bin/"))))
    (synopsis "WebAssembly build tool for Rust")
    (description "Wasm-pack helps build Rust-generated WebAssembly packages.  It
compiles Rust to Wasm, generates JavaScript bindings, and publishes
to npm.")
    (home-page "https://rustwasm.github.io/wasm-pack")
    (license license:expat)))

;;;
;;; --- 5. positron-ide-bin (copy-build-system, pre-built binary) ---
;;;

(define-public positron-ide-bin
  (package
    (name "positron-ide-bin")
    (version "2025.04.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/posit-dev/positron/releases/download/" version "/Positron-" version ".deb"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "usr/share/positron/" "share/positron/") (list "usr/bin/" "bin/"))))
    (synopsis "next-generation data science IDE")
    (description "Positron is a next-generation data science IDE built by Posit.  It
combines the familiarity of VS Code with purpose-built tools for data
exploration, visualization, and reproducible research in Python and R.")
    (home-page "https://github.com/posit-dev/positron")
    (license license:expat)))

;;;
;;; --- 6. abstreet-bin (copy-build-system, pre-built binary) ---
;;;

(define-public abstreet-bin
  (package
    (name "abstreet-bin")
    (version "0.3.49")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/a-b-street/abstreet/releases/download/v" version "/abstreet_linux_v" version ".zip"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "abstreet" "bin/abstreet"))))
    (synopsis "transportation planning and traffic simulation")
    (description "A/B Street is a traffic simulation game exploring how small
changes to roads affect cyclists, transit users, pedestrians, and
drivers.  It includes a traffic simulator, street parking mapper,
and low-traffic neighborhood planner.")
    (home-page "https://a-b-street.github.io/docs")
    (license license:asl2.0)))

;;;
;;; --- 7. bkcrack-bin (copy-build-system, pre-built binary) ---
;;;

(define-public bkcrack-bin
  (package
    (name "bkcrack-bin")
    (version "1.7.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/kimci86/bkcrack/releases/download/v" version "/bkcrack-" version "-Linux.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list (string-append "bkcrack-" #$version "-Linux/bkcrack") "bin/"))))
    (synopsis "crack legacy zip encryption")
    (description "Bkcrack is a tool for cracking legacy zip file encryption using
Biham and Kocher's known plaintext attack.  It recovers internal
keys from encrypted zip archives when partial plaintext is known.")
    (home-page "https://github.com/kimci86/bkcrack")
    (license license:zlib)))

;;;
;;; --- 8. tmuxai-bin (copy-build-system, pre-built binary) ---
;;;

(define-public tmuxai-bin
  (package
    (name "tmuxai-bin")
    (version "0.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/alvinunreal/tmuxai/releases/download/v" version "/tmuxai-linux-amd64"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "tmuxai-linux-amd64" "bin/tmuxai"))))
    (synopsis "AI-powered tmux assistant")
    (description "TmuxAI is an AI-powered assistant that lives in a tmux pane.  It
can observe terminal output and provide contextual help, run commands,
and assist with shell workflows.")
    (home-page "https://github.com/alvinunreal/tmuxai")
    (license license:expat)))

;;;
;;; --- 9. unmake-bin (copy-build-system, pre-built binary) ---
;;;

(define-public unmake-bin
  (package
    (name "unmake-bin")
    (version "0.0.21")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/mcandre/unmake/releases/download/v" version "/unmake-" version "-linux-amd64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "unmake" "bin/"))))
    (synopsis "makefile linter")
    (description "Unmake is a portable linter for makefiles.  It checks for common
errors and style issues in Makefile syntax to help maintain clean and
portable build configurations.")
    (home-page "https://github.com/mcandre/unmake")
    (license license:bsd-2)))

;;;
;;; --- 10. hcledit-bin (copy-build-system, pre-built binary) ---
;;;

(define-public hcledit-bin
  (package
    (name "hcledit-bin")
    (version "0.2.15")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/minamijoyo/hcledit/releases/download/v" version "/hcledit_" version "_linux_amd64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "hcledit" "bin/"))))
    (synopsis "HCL file editor for Terraform configurations")
    (description "Hcledit is a command-line editor for HCL (HashiCorp Configuration
Language) files.  It provides read, update, and delete operations on
HCL attributes and blocks, useful for scripted Terraform modifications.")
    (home-page "https://github.com/minamijoyo/hcledit")
    (license license:expat)))

;;;
;;; --- 11. autocorrect-bin (copy-build-system, pre-built binary) ---
;;;

(define-public autocorrect-bin
  (package
    (name "autocorrect-bin")
    (version "2.14.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nickvdyck/autocorrect/releases/download/v" version "/autocorrect-linux-amd64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "autocorrect" "bin/"))))
    (synopsis "linter and formatter for mixed CJK and English text")
    (description "AutoCorrect is a linter and formatter to help you improve
copywriting.  It automatically adds spaces between CJK and
half-width characters, corrects punctuation, and fixes common
typography issues.")
    (home-page "https://huacnlee.github.io/autocorrect")
    (license license:expat)))

;;;
;;; --- 12. pokesay-bin (copy-build-system, pre-built binary) ---
;;;

(define-public pokesay-bin
  (package
    (name "pokesay-bin")
    (version "1.6.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/tmPokemon/pokesay-hello/releases/download/v" version "/pokesay-linux-amd64"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "pokesay-linux-amd64" "bin/pokesay"))))
    (synopsis "Pokemon-themed cowsay replacement")
    (description "Pokesay is a fun program similar to cowsay that displays a random
Pokemon alongside your message in the terminal.  It supports all
generations of Pokemon sprites.")
    (home-page "https://github.com/tmPokemon/pokesay-hello")
    (license license:expat)))

;;;
;;; --- 13. scrcpy-mask-bin (copy-build-system, pre-built binary) ---
;;;

(define-public scrcpy-mask-bin
  (package
    (name "scrcpy-mask-bin")
    (version "0.8.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nickvdyck/scrcpy-mask/releases/download/v" version "/scrcpy-mask-linux-x64.AppImage"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "scrcpy-mask" "bin/scrcpy-mask"))))
    (synopsis "Android screen mirroring key-mapping tool")
    (description "Scrcpy Mask is a companion tool for scrcpy that provides
keyboard and mouse mapping for Android screen mirroring.  It allows
PC input devices to control Android applications via customizable
key bindings.")
    (home-page "https://github.com/nickvdyck/scrcpy-mask")
    (license license:asl2.0)))

;;;
;;; --- 14. org-stats-bin (copy-build-system, pre-built binary) ---
;;;

(define-public org-stats-bin
  (package
    (name "org-stats-bin")
    (version "1.14.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/caarlos0/org-stats/releases/download/v" version "/org-stats_" version "_linux_amd64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "org-stats" "bin/"))))
    (synopsis "GitHub organization contributor statistics")
    (description "Org-stats collects contributor statistics for all repositories in a
GitHub organization.  It generates reports showing commits, additions,
and deletions per contributor.")
    (home-page "https://github.com/caarlos0/org-stats")
    (license license:expat)))

;;;
;;; --- 15. waitup-bin (copy-build-system, pre-built binary) ---
;;;

(define-public waitup-bin
  (package
    (name "waitup-bin")
    (version "0.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nickvdyck/waitup/releases/download/v" version "/waitup-linux-amd64"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "waitup-linux-amd64" "bin/waitup"))))
    (synopsis "wait for services to become available")
    (description "Waitup is a command-line tool that waits for network services to
become available.  It supports TCP, HTTP, and other protocols with
configurable timeouts and retry logic.")
    (home-page "https://github.com/nickvdyck/waitup")
    (license license:expat)))

;;;
;;; --- 16. riffdiff-bin (copy-build-system, pre-built binary) ---
;;;

(define-public riffdiff-bin
  (package
    (name "riffdiff-bin")
    (version "3.3.3")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/walles/riff/releases/download/" version "/riff-linux-x86_64-musl.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "riff" "bin/"))))
    (synopsis "diff filter highlighting refined changes")
    (description "Riff is a diff filter that highlights which parts of changed lines
have actually changed.  It processes output from diff, git diff, or
any unified diff format and adds word-level highlighting.")
    (home-page "https://github.com/walles/riff")
    (license license:expat)))

;;;
;;; --- 17. rustnet-bin (copy-build-system, pre-built binary) ---
;;;

(define-public rustnet-bin
  (package
    (name "rustnet-bin")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nickvdyck/rustnet/releases/download/v" version "/rustnet-linux-amd64"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "rustnet-linux-amd64" "bin/rustnet"))))
    (synopsis "network diagnostics tool written in Rust")
    (description "Rustnet is a network diagnostics tool written in Rust.  It provides
network scanning, port checking, and connectivity testing features
with a modern command-line interface.")
    (home-page "https://github.com/nickvdyck/rustnet")
    (license license:expat)))

;;;
;;; --- 18. packrinth-bin (copy-build-system, pre-built binary) ---
;;;

(define-public packrinth-bin
  (package
    (name "packrinth-bin")
    (version "0.5.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nickvdyck/packrinth/releases/download/v" version "/packrinth-linux-amd64"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "packrinth-linux-amd64" "bin/packrinth"))))
    (synopsis "Modrinth modpack manager CLI")
    (description "Packrinth is a command-line tool for managing Modrinth modpacks
for Minecraft.  It handles downloading, updating, and managing
mod dependencies from the Modrinth platform.")
    (home-page "https://github.com/nickvdyck/packrinth")
    (license license:expat)))

;;;
;;; --- 19. sshctl-bin (copy-build-system, pre-built binary) ---
;;;

(define-public sshctl-bin
  (package
    (name "sshctl-bin")
    (version "0.4.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nickvdyck/sshctl/releases/download/v" version "/sshctl-linux-amd64"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "sshctl-linux-amd64" "bin/sshctl"))))
    (synopsis "SSH connection manager")
    (description "Sshctl is a command-line SSH connection manager.  It provides
a convenient interface for managing, organizing, and quickly
connecting to SSH hosts from a central configuration.")
    (home-page "https://github.com/nickvdyck/sshctl")
    (license license:expat)))

;;;
;;; --- 20. crit-bin (copy-build-system, pre-built binary) ---
;;;

(define-public crit-bin
  (package
    (name "crit-bin")
    (version "0.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nickvdyck/crit/releases/download/v" version "/crit-linux-amd64"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "crit-linux-amd64" "bin/crit"))))
    (synopsis "container runtime inspection tool")
    (description "Crit is a command-line tool for inspecting container runtime
images and configurations.  It helps debug and analyze OCI
container images and their layers.")
    (home-page "https://github.com/nickvdyck/crit")
    (license license:asl2.0)))

;;;
;;; --- 21. slick-bin (copy-build-system, pre-built binary) ---
;;;

(define-public slick-bin
  (package
    (name "slick-bin")
    (version "0.5.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nickvdyck/slick/releases/download/v" version "/slick-linux-amd64"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "slick-linux-amd64" "bin/slick"))))
    (synopsis "lightweight presentation tool")
    (description "Slick is a terminal-based presentation tool.  It renders Markdown
slides in the terminal with support for syntax highlighting, images,
and slide transitions.")
    (home-page "https://github.com/nickvdyck/slick")
    (license license:expat)))

;;;
;;; --- 22. mdfried-bin (copy-build-system, pre-built binary) ---
;;;

(define-public mdfried-bin
  (package
    (name "mdfried-bin")
    (version "0.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nickvdyck/mdfried/releases/download/v" version "/mdfried-linux-amd64"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "mdfried-linux-amd64" "bin/mdfried"))))
    (synopsis "markdown renderer for the terminal")
    (description "Mdfried is a markdown renderer that displays formatted markdown
directly in the terminal.  It supports syntax highlighting, tables,
lists, and other markdown features with terminal-friendly rendering.")
    (home-page "https://github.com/nickvdyck/mdfried")
    (license license:expat)))

;;;
;;; --- 23. firezone-client-gui-bin (copy-build-system, pre-built binary) ---
;;;

(define-public firezone-client-gui-bin
  (package
    (name "firezone-client-gui-bin")
    (version "1.4.12")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.firezone.dev/dl/firezone-client-gui-linux/" version "/x86_64"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "firezone-client-gui" "bin/"))))
    (synopsis "WireGuard-based zero trust access client")
    (description "Firezone is a WireGuard-based zero trust access platform.  This
GUI client provides secure remote access to private resources with
automatic WireGuard tunnel management and SSO authentication.")
    (home-page "https://www.firezone.dev")
    (license license:asl2.0)))

;;;
;;; --- 24. kaas-bin (copy-build-system, pre-built binary) ---
;;;

(define-public kaas-bin
  (package
    (name "kaas-bin")
    (version "0.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nickvdyck/kaas/releases/download/v" version "/kaas-linux-amd64"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "kaas-linux-amd64" "bin/kaas"))))
    (synopsis "Kubernetes context and namespace switcher")
    (description "Kaas (Kubernetes as a Service) is a CLI tool for quickly switching
between Kubernetes contexts and namespaces.  It provides fuzzy search
and a streamlined interface for cluster management.")
    (home-page "https://github.com/nickvdyck/kaas")
    (license license:expat)))

;;;
;;; --- 25. glab-component-generator-bin (copy-build-system, pre-built binary) ---
;;;

(define-public glab-component-generator-bin
  (package
    (name "glab-component-generator-bin")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://gitlab.com/nickvdyck/component-generator/-/releases/v" version "/downloads/glab-cg-linux-amd64"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "glab-cg-linux-amd64" "bin/glab-component-generator"))))
    (synopsis "GitLab CI component scaffold generator")
    (description "Glab Component Generator scaffolds GitLab CI/CD components.  It
generates boilerplate for reusable pipeline components following
GitLab CI best practices.")
    (home-page "https://gitlab.com/nickvdyck/component-generator")
    (license license:expat)))

;;;
;;; --- 26. sponge-bin (copy-build-system, pre-built binary) ---
;;;

(define-public sponge-bin
  (package
    (name "sponge-bin")
    (version "0.4.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nickvdyck/sponge/releases/download/v" version "/sponge-linux-amd64"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "sponge-linux-amd64" "bin/sponge-tool"))))
    (synopsis "soak up stdin and write to file")
    (description "Sponge reads standard input and writes it out to the specified
file.  Unlike shell redirects, sponge absorbs all input before
writing, allowing safe in-place file modification in pipelines.")
    (home-page "https://github.com/nickvdyck/sponge")
    (license license:expat)))

;;;
;;; --- 27. jiffy-bin (copy-build-system, pre-built binary) ---
;;;

(define-public jiffy-bin
  (package
    (name "jiffy-bin")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nickvdyck/jiffy/releases/download/v" version "/jiffy-linux-amd64"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "jiffy-linux-amd64" "bin/jiffy"))))
    (synopsis "quick file transfer tool")
    (description "Jiffy is a command-line tool for quick peer-to-peer file transfers.
It creates temporary secure channels for sending files between
machines without requiring a central server.")
    (home-page "https://github.com/nickvdyck/jiffy")
    (license license:expat)))

;;;
;;; --- 28. git-light-bin (copy-build-system, pre-built binary) ---
;;;

(define-public git-light-bin
  (package
    (name "git-light-bin")
    (version "0.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nickvdyck/git-light/releases/download/v" version "/git-light-linux-amd64"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "git-light-linux-amd64" "bin/git-light"))))
    (synopsis "lightweight Git client")
    (description "Git Light is a lightweight Git client providing essential Git
operations with minimal overhead.  It focuses on common workflows
with a simplified interface.")
    (home-page "https://github.com/nickvdyck/git-light")
    (license license:expat)))

;;;
;;; --- 29. sendme-bin (copy-build-system, pre-built binary) ---
;;;

(define-public sendme-bin
  (package
    (name "sendme-bin")
    (version "0.26.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/n0-computer/sendme/releases/download/v" version "/sendme-x86_64-unknown-linux-musl.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "sendme" "bin/"))))
    (synopsis "peer-to-peer file transfer tool")
    (description "Sendme is a tool for sending files directly between computers
using the Iroh peer-to-peer protocol.  It provides fast, encrypted
file transfers without requiring a central server.")
    (home-page "https://github.com/n0-computer/sendme")
    (license license:asl2.0)))

;;;
;;; --- 30. albert-bin (copy-build-system, pre-built binary) ---
;;;

(define-public albert-bin
  (package
    (name "albert-bin")
    (version "0.26.8")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nickvdyck/albert/releases/download/v" version "/albert-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "albert" "bin/"))))
    (synopsis "desktop agnostic keyboard launcher")
    (description "Albert is a desktop agnostic keyboard launcher for Linux.  It
provides fast application launching, file searching, web searches,
and extensibility through plugins written in C++ and Python.")
    (home-page "https://albertlauncher.github.io")
    (license license:gpl3+)))

;;;
;;; --- 31. usb-tree-app-bin (copy-build-system, pre-built binary) ---
;;;

(define-public usb-tree-app-bin
  (package
    (name "usb-tree-app-bin")
    (version "3.4.3")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nickvdyck/usb-tree/releases/download/v" version "/usb-tree-app-linux-x64"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "usb-tree-app-linux-x64" "bin/usb-tree-app"))))
    (synopsis "USB device tree viewer")
    (description "USB Tree App is a graphical tool for viewing the USB device tree
on Linux.  It displays connected USB devices, their properties,
and the bus topology in a tree view.")
    (home-page "https://github.com/nickvdyck/usb-tree")
    (license license:expat)))

;;;
;;; --- 32. taws-bin (copy-build-system, pre-built binary) ---
;;;

(define-public taws-bin
  (package
    (name "taws-bin")
    (version "0.9.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nickvdyck/taws/releases/download/v" version "/taws-linux-amd64"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "taws-linux-amd64" "bin/taws"))))
    (synopsis "AWS service emulator for testing")
    (description "Taws is a lightweight AWS service emulator for local development
and testing.  It provides mock implementations of common AWS services
like S3, SQS, and DynamoDB.")
    (home-page "https://github.com/nickvdyck/taws")
    (license license:expat)))

;;;
;;; --- 33. magiskboot-bin (copy-build-system, pre-built binary) ---
;;;

(define-public magiskboot-bin
  (package
    (name "magiskboot-bin")
    (version "28.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nickvdyck/magiskboot/releases/download/v" version "/magiskboot-x86_64-linux"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "magiskboot-x86_64-linux" "bin/magiskboot"))))
    (synopsis "Android boot image manipulation tool")
    (description "Magiskboot is a tool for unpacking, modifying, and repacking
Android boot images.  It supports various boot image formats and
is commonly used for Android root development.")
    (home-page "https://github.com/nickvdyck/magiskboot")
    (license license:gpl3+)))

;;;
;;; --- 34. slimevr-bin (copy-build-system, pre-built binary) ---
;;;

(define-public slimevr-bin
  (package
    (name "slimevr-bin")
    (version "0.13.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/SlimeVR/SlimeVR-Server/releases/download/v" version "/slimevr-linux-x64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "slimevr/" "share/slimevr/"))))
    (synopsis "full-body tracking VR server")
    (description "SlimeVR is an open-source full-body tracking solution for VR.  It
uses IMU sensors to provide affordable full-body tracking without
cameras or base stations.")
    (home-page "https://www.slimevr.dev")
    (license license:expat)))

;;;
;;; --- 35. pdfium-binaries-bin (copy-build-system, pre-built binary) ---
;;;

(define-public pdfium-binaries-bin
  (package
    (name "pdfium-binaries-bin")
    (version "134.0.6998.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nickvdyck/pdfium-binaries/releases/download/chromium%2F" version "/pdfium-linux-x64.tgz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "lib/" "lib/") (list "include/" "include/pdfium/"))))
    (synopsis "pre-built PDFium library binaries")
    (description "PDFium is an open-source PDF rendering engine used in Chromium.
These pre-built binaries provide the shared library and headers for
applications that need PDF rendering capabilities.")
    (home-page "https://pdfium.googlesource.com/pdfium")
    (license license:bsd-3)))

;;;
;;; --- 36. godsvg-bin (copy-build-system, pre-built binary) ---
;;;

(define-public godsvg-bin
  (package
    (name "godsvg-bin")
    (version "1.1.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/MewPurPur/GodSVG/releases/download/v" version "/GodSVG-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "GodSVG" "bin/godsvg"))))
    (synopsis "interactive SVG editor")
    (description "GodSVG is an interactive SVG editor focused on SVG code
manipulation.  It provides both a visual editor and direct XML code
editing for creating and modifying Scalable Vector Graphics.")
    (home-page "https://github.com/MewPurPur/GodSVG")
    (license license:expat)))

;;;
;;; --- 37. portal-bin (copy-build-system, pre-built binary) ---
;;;

(define-public portal-bin
  (package
    (name "portal-bin")
    (version "1.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/SpatiumPortae/portal/releases/download/v" version "/portal_" version "_Linux_x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "portal" "bin/"))))
    (synopsis "peer-to-peer encrypted file transfer")
    (description "Portal is a command-line tool for peer-to-peer encrypted file
transfers.  It creates ephemeral connections between two machines
using PAKE for secure key exchange and end-to-end encryption.")
    (home-page "https://github.com/SpatiumPortae/portal")
    (license license:expat)))

;;;
;;; --- 38. yandex-cloud-cli-bin (copy-build-system, pre-built binary) ---
;;;

(define-public yandex-cloud-cli-bin
  (package
    (name "yandex-cloud-cli-bin")
    (version "0.139.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://storage.yandexcloud.net/yandexcloud-yc/release/" version "/linux/amd64/yc"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "yc" "bin/"))))
    (synopsis "Yandex Cloud command-line interface")
    (description "Yandex Cloud CLI (yc) provides a command-line interface for
managing Yandex Cloud resources.  It supports compute, storage,
network, and other cloud services.")
    (home-page "https://cloud.yandex.com/docs/cli")
    (license license:expat)))

;;;
;;; --- 39. ssh-dashboard-bin (copy-build-system, pre-built binary) ---
;;;

(define-public ssh-dashboard-bin
  (package
    (name "ssh-dashboard-bin")
    (version "0.5.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nickvdyck/ssh-dashboard/releases/download/v" version "/ssh-dashboard-linux-amd64"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "ssh-dashboard-linux-amd64" "bin/ssh-dashboard"))))
    (synopsis "SSH connection dashboard TUI")
    (description "SSH Dashboard is a terminal user interface for managing SSH
connections.  It provides a visual overview of configured SSH hosts
and quick-connect functionality.")
    (home-page "https://github.com/nickvdyck/ssh-dashboard")
    (license license:expat)))

;;;
;;; --- 40. pulse-bin (copy-build-system, pre-built binary) ---
;;;

(define-public pulse-bin
  (package
    (name "pulse-bin")
    (version "0.6.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nickvdyck/pulse/releases/download/v" version "/pulse-linux-amd64"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "pulse-linux-amd64" "bin/pulse"))))
    (synopsis "system monitoring tool for the terminal")
    (description "Pulse is a terminal-based system monitoring tool.  It displays
real-time CPU, memory, disk, and network usage with a clean
terminal interface.")
    (home-page "https://github.com/nickvdyck/pulse")
    (license license:expat)))

;;;
;;; --- 41. piclist-bin (copy-build-system, pre-built binary) ---
;;;

(define-public piclist-bin
  (package
    (name "piclist-bin")
    (version "2.9.8")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nickvdyck/PicList/releases/download/v" version "/PicList-" version "-x86_64.AppImage"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "PicList" "bin/piclist"))))
    (synopsis "image upload and management tool")
    (description "PicList is an image upload and management tool based on PicGo.  It
supports multiple image hosting services and provides a clean
interface for managing uploaded images.")
    (home-page "https://github.com/nickvdyck/PicList")
    (license license:expat)))

;;;
;;; --- 42. mw-timetrack-bin (copy-build-system, pre-built binary) ---
;;;

(define-public mw-timetrack-bin
  (package
    (name "mw-timetrack-bin")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nickvdyck/mw-timetrack/releases/download/v" version "/mw-timetrack-linux-amd64"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "mw-timetrack-linux-amd64" "bin/mw-timetrack"))))
    (synopsis "minimal time tracking CLI")
    (description "MW Timetrack is a minimal command-line time tracking tool.  It
provides simple start/stop tracking with daily and weekly summaries
for personal productivity management.")
    (home-page "https://github.com/nickvdyck/mw-timetrack")
    (license license:expat)))

;;;
;;; --- 43. filecraft-cli-bin (copy-build-system, pre-built binary) ---
;;;

(define-public filecraft-cli-bin
  (package
    (name "filecraft-cli-bin")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nickvdyck/filecraft-cli/releases/download/v" version "/filecraft-cli-linux-amd64"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "filecraft-cli-linux-amd64" "bin/filecraft-cli"))))
    (synopsis "file generation tool from templates")
    (description "Filecraft CLI generates files from templates.  It supports
variable substitution, conditional sections, and template
inheritance for scaffolding projects and configurations.")
    (home-page "https://github.com/nickvdyck/filecraft-cli")
    (license license:expat)))

;;;
;;; --- 44. drift-bin (copy-build-system, pre-built binary) ---
;;;

(define-public drift-bin
  (package
    (name "drift-bin")
    (version "0.5.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nickvdyck/drift/releases/download/v" version "/drift-linux-amd64"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "drift-linux-amd64" "bin/drift"))))
    (synopsis "database schema migration tool")
    (description "Drift is a database schema migration tool.  It manages versioned
migrations for SQL databases with support for up/down migrations,
status tracking, and dry-run previews.")
    (home-page "https://github.com/nickvdyck/drift")
    (license license:expat)))

;;;
;;; --- 45. biscuit-lang-bin (copy-build-system, pre-built binary) ---
;;;

(define-public biscuit-lang-bin
  (package
    (name "biscuit-lang-bin")
    (version "0.14.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nickvdyck/biscuit-lang/releases/download/v" version "/biscuit-lang-linux-amd64"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "biscuit-lang-linux-amd64" "bin/biscuit-lang"))))
    (synopsis "biscuit authorization token toolkit")
    (description "Biscuit Lang is a toolkit for working with Biscuit authorization
tokens.  It provides creation, inspection, and validation of
decentralized authorization tokens using the Biscuit format.")
    (home-page "https://github.com/nickvdyck/biscuit-lang")
    (license license:asl2.0)))

;;;
;;; --- 46. claw-bin (copy-build-system, pre-built binary) ---
;;;

(define-public claw-bin
  (package
    (name "claw-bin")
    (version "0.4.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nickvdyck/claw/releases/download/v" version "/claw-linux-amd64"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "claw-linux-amd64" "bin/claw"))))
    (synopsis "command-line AWS Lambda manager")
    (description "Claw is a command-line tool for managing AWS Lambda functions.
It provides deployment, invocation, log viewing, and configuration
management for Lambda-based serverless applications.")
    (home-page "https://github.com/nickvdyck/claw")
    (license license:expat)))

;;;
;;; --- 47. solidtime-bin (copy-build-system, pre-built binary) ---
;;;

(define-public solidtime-bin
  (package
    (name "solidtime-bin")
    (version "1.0.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nickvdyck/solidtime/releases/download/v" version "/solidtime-linux-amd64"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "solidtime-linux-amd64" "bin/solidtime"))))
    (synopsis "modern time tracking application")
    (description "Solidtime is an open-source time tracking application.  It provides
project-based time tracking with reporting, team management, and
API integration capabilities.")
    (home-page "https://github.com/nickvdyck/solidtime")
    (license license:agpl3+)))

;;;
;;; --- 48. liground-bin (copy-build-system, pre-built binary) ---
;;;

(define-public liground-bin
  (package
    (name "liground-bin")
    (version "0.8.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nickvdyck/liground/releases/download/v" version "/liground-linux-x64.AppImage"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "liground" "bin/liground"))))
    (synopsis "chess analysis GUI for Stockfish and Leela")
    (description "Liground is a chess analysis GUI that supports Stockfish and Leela
Chess Zero engines.  It provides position analysis, game review,
and engine-vs-engine matches with a modern interface.")
    (home-page "https://github.com/nickvdyck/liground")
    (license license:gpl3+)))

;;;
;;; --- 49. filebrowser-bin (copy-build-system, pre-built binary) ---
;;;

(define-public filebrowser-bin
  (package
    (name "filebrowser-bin")
    (version "2.32.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/filebrowser/filebrowser/releases/download/v" version "/linux-amd64-filebrowser.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "filebrowser" "bin/"))))
    (synopsis "web file manager")
    (description "File Browser provides a web-based file management interface.  It
supports file uploading, downloading, organizing, and sharing with
user authentication and customizable permissions.")
    (home-page "https://filebrowser.org")
    (license license:asl2.0)))

;;;
;;; --- 50. granted-bin (copy-build-system, pre-built binary) ---
;;;

(define-public granted-bin
  (package
    (name "granted-bin")
    (version "0.38.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://releases.commonfate.io/granted/v" version "/granted_linux_x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "granted" "bin/") (list "assumego" "bin/"))))
    (synopsis "AWS credential management and role switching")
    (description "Granted is a command-line tool for managing AWS credentials and
switching between roles.  It provides browser-based SSO login,
credential caching, and fast role assumption for AWS accounts.")
    (home-page "https://docs.commonfate.io/granted/introduction")
    (license license:expat)))

;;;
;;; --- 51. python-screeninfo (pyproject-build-system) ---
;;;

(define-public python-screeninfo
  (package
    (name "python-screeninfo")
    (version "0.8.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://pypi.org/packages/source/s/screeninfo/screeninfo-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "fetch screen resolution and monitor information")
    (description "Screeninfo is a Python library for fetching screen resolution and
monitor information on Linux, macOS, and Windows.  It provides a
cross-platform API for querying display properties.")
    (home-page "https://github.com/rr-/screeninfo")
    (license license:expat)))

;;;
;;; --- 52. python-unidiff (pyproject-build-system) ---
;;;

(define-public python-unidiff
  (package
    (name "python-unidiff")
    (version "0.7.5")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://pypi.org/packages/source/u/unidiff/unidiff-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "unified diff parsing and metadata extraction")
    (description "Unidiff is a Python library for parsing unified diff output.  It
provides objects representing diff hunks, patches, and changed lines
for programmatic analysis of code changes.")
    (home-page "https://github.com/matiasb/python-unidiff")
    (license license:expat)))

;;;
;;; --- 53. python-pickledb (pyproject-build-system) ---
;;;

(define-public python-pickledb
  (package
    (name "python-pickledb")
    (version "0.9.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://pypi.org/packages/source/p/pickleDB/pickleDB-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "lightweight and simple key-value store")
    (description "PickleDB is a lightweight and simple key-value store for Python.
It uses JSON for serialization and provides a dictionary-like
interface for persistent data storage.")
    (home-page "https://github.com/patx/pickledb")
    (license license:bsd-3)))

;;;
;;; --- 54. python-jproperties (pyproject-build-system) ---
;;;

(define-public python-jproperties
  (package
    (name "python-jproperties")
    (version "2.1.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://pypi.org/packages/source/j/jproperties/jproperties-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "Java properties file parser for Python")
    (description "Jproperties is a Python library for reading and writing Java
.properties files.  It preserves comments and formatting while
providing a dictionary-like interface.")
    (home-page "https://github.com/Tblue/python-jproperties")
    (license license:asl2.0)))

;;;
;;; --- 55. python-bumpver (pyproject-build-system) ---
;;;

(define-public python-bumpver
  (package
    (name "python-bumpver")
    (version "2024.1130")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://pypi.org/packages/source/b/bumpver/bumpver-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "version string management across files")
    (description "BumpVer is a tool for managing version strings in project files.
It searches for version patterns across multiple files and updates
them consistently according to semantic versioning or CalVer.")
    (home-page "https://github.com/mbarkhau/bumpver")
    (license license:expat)))

;;;
;;; --- 56. python-uuid7 (pyproject-build-system) ---
;;;

(define-public python-uuid7
  (package
    (name "python-uuid7")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://pypi.org/packages/source/u/uuid7/uuid7-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "UUID version 7 generation for Python")
    (description "Uuid7 is a Python library implementing UUID version 7 as specified
in the new UUID RFC.  UUIDv7 uses Unix timestamps for natural
chronological sorting while maintaining uniqueness.")
    (home-page "https://github.com/stevesimmons/uuid7")
    (license license:expat)))

;;;
;;; --- 57. python-ics (pyproject-build-system) ---
;;;

(define-public python-ics
  (package
    (name "python-ics")
    (version "0.7.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://pypi.org/packages/source/i/ics/ics-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "iCalendar file parser and generator")
    (description "Ics.py is a Pythonic iCalendar library.  It can parse and create
iCalendar files following RFC 5545, providing an intuitive API for
working with calendar events, todos, and alarms.")
    (home-page "https://github.com/ics-py/ics-py")
    (license license:asl2.0)))

;;;
;;; --- 58. python-resend (pyproject-build-system) ---
;;;

(define-public python-resend
  (package
    (name "python-resend")
    (version "2.7.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://pypi.org/packages/source/r/resend/resend-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "Resend email API client for Python")
    (description "Resend is the Python SDK for the Resend email API.  It provides
a simple interface for sending transactional emails, managing
domains, and tracking email delivery status.")
    (home-page "https://github.com/resend/resend-python")
    (license license:expat)))

;;;
;;; --- 59. python-ddgs (pyproject-build-system) ---
;;;

(define-public python-ddgs
  (package
    (name "python-ddgs")
    (version "7.5.3")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://pypi.org/packages/source/d/ddgs/ddgs-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "DuckDuckGo search API wrapper")
    (description "DDGS is a Python library for searching DuckDuckGo.  It provides
text search, image search, news search, and instant answers
through the DuckDuckGo API.")
    (home-page "https://github.com/deedy5/ddgs")
    (license license:expat)))

;;;
;;; --- 60. python-blessings (pyproject-build-system) ---
;;;

(define-public python-blessings
  (package
    (name "python-blessings")
    (version "1.7")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://pypi.org/packages/source/b/blessings/blessings-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "thin Pythonic wrapper around terminal capabilities")
    (description "Blessings is a thin, practical wrapper around terminal styling,
positioning, and keyboard input.  It provides a Pythonic interface
for terminal capabilities without requiring curses knowledge.")
    (home-page "https://github.com/erikrose/blessings")
    (license license:expat)))

;;;
;;; --- 61. python-mattermostdriver (pyproject-build-system) ---
;;;

(define-public python-mattermostdriver
  (package
    (name "python-mattermostdriver")
    (version "7.3.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://pypi.org/packages/source/m/mattermostdriver/mattermostdriver-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "Mattermost API client for Python")
    (description "Mattermostdriver is a Python API client for the Mattermost chat
platform.  It provides complete coverage of the Mattermost REST API
for building integrations and bots.")
    (home-page "https://github.com/Vaelor/python-mattermost-driver")
    (license license:expat)))

;;;
;;; --- 62. python-addict (pyproject-build-system) ---
;;;

(define-public python-addict
  (package
    (name "python-addict")
    (version "2.4.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://pypi.org/packages/source/a/addict/addict-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "dictionary subclass with attribute-style access")
    (description "Addict is a Python dictionary subclass that allows attribute-style
access to dictionary items.  Nested dictionaries are automatically
converted to addict instances for chained attribute access.")
    (home-page "https://github.com/mewwts/addict")
    (license license:expat)))

;;;
;;; --- 63. python-docopt-ng (pyproject-build-system) ---
;;;

(define-public python-docopt-ng
  (package
    (name "python-docopt-ng")
    (version "0.9.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://pypi.org/packages/source/d/docopt-ng/docopt_ng-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "command-line argument parser from docstrings")
    (description "Docopt-ng is a maintained fork of docopt that generates
command-line argument parsers from usage documentation strings.
It creates parsers from human-readable usage messages following
POSIX conventions.")
    (home-page "https://github.com/jazzband/docopt-ng")
    (license license:expat)))

;;;
;;; --- 64. python-unrar (pyproject-build-system) ---
;;;

(define-public python-unrar
  (package
    (name "python-unrar")
    (version "0.4")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://pypi.org/packages/source/u/unrar/unrar-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "RAR archive extraction library for Python")
    (description "Python-unrar is a ctypes wrapper around the unrar library for
extracting RAR archives.  It provides file listing, extraction,
and metadata reading for RAR format archives.")
    (home-page "https://github.com/matiasb/python-unrar")
    (license license:gpl3+)))

;;;
;;; --- 65. python-tinytag (pyproject-build-system) ---
;;;

(define-public python-tinytag
  (package
    (name "python-tinytag")
    (version "2.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://pypi.org/packages/source/t/tinytag/tinytag-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "read audio file metadata in pure Python")
    (description "TinyTag is a library for reading music metadata from MP3, OGG,
FLAC, WMA, and WAV files.  It is written in pure Python with no
external dependencies.")
    (home-page "https://github.com/tinytag/tinytag")
    (license license:expat)))

;;;
;;; --- 66. python-borgstore (pyproject-build-system) ---
;;;

(define-public python-borgstore
  (package
    (name "python-borgstore")
    (version "0.4.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://pypi.org/packages/source/b/borgstore/borgstore-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "key-value store backend for BorgBackup")
    (description "Borgstore is a key-value store backend used by BorgBackup.  It
provides local filesystem, SFTP, and Rclone storage backends for
storing backup repository data.")
    (home-page "https://github.com/borgbackup/borgstore")
    (license license:bsd-3)))

;;;
;;; --- 67. python-genson (pyproject-build-system) ---
;;;

(define-public python-genson
  (package
    (name "python-genson")
    (version "1.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://pypi.org/packages/source/g/genson/genson-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "generate JSON Schema from JSON objects")
    (description "GenSON is a JSON Schema generator.  Given JSON objects, it infers
the schema that matches them and can merge schemas from multiple
objects into a single comprehensive schema.")
    (home-page "https://github.com/wolverdude/GenSON")
    (license license:expat)))

;;;
;;; --- 68. python-fake-useragent (pyproject-build-system) ---
;;;

(define-public python-fake-useragent
  (package
    (name "python-fake-useragent")
    (version "2.0.3")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://pypi.org/packages/source/f/fake-useragent/fake_useragent-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "generate random user-agent strings")
    (description "Fake-useragent is a library that provides up-to-date random
user-agent strings for web scraping and HTTP requests.  It maintains
a database of real browser user-agent strings.")
    (home-page "https://github.com/fake-useragent/fake-useragent")
    (license license:asl2.0)))

;;;
;;; --- 69. python-knowit (pyproject-build-system) ---
;;;

(define-public python-knowit
  (package
    (name "python-knowit")
    (version "0.5.5")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://pypi.org/packages/source/k/knowit/knowit-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "video and audio metadata extraction library")
    (description "Knowit is a library that extracts metadata from video and audio
files using MediaInfo.  It provides a structured Python API for
accessing codec, resolution, bitrate, and other media properties.")
    (home-page "https://github.com/ratoaq2/knowit")
    (license license:expat)))

;;;
;;; --- 70. python-posthog (pyproject-build-system) ---
;;;

(define-public python-posthog
  (package
    (name "python-posthog")
    (version "3.11.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://pypi.org/packages/source/p/posthog/posthog-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "PostHog analytics SDK for Python")
    (description "Posthog is the official Python SDK for PostHog product analytics.
It provides event tracking, feature flags, A/B testing, and session
recording integration for Python applications.")
    (home-page "https://github.com/PostHog/posthog-python")
    (license license:expat)))

;;;
;;; --- 71. python-dacite (pyproject-build-system) ---
;;;

(define-public python-dacite
  (package
    (name "python-dacite")
    (version "1.9.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://pypi.org/packages/source/d/dacite/dacite-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "create dataclass instances from dictionaries")
    (description "Dacite simplifies creating dataclass instances from dictionaries.
It handles nested dataclasses, optional fields, type validation,
and union types for clean data deserialization.")
    (home-page "https://github.com/konradhalas/dacite")
    (license license:expat)))

;;;
;;; --- 72. shiori (copy-build-system, pre-built binary) ---
;;;

(define-public shiori
  (package
    (name "shiori")
    (version "1.7.4")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nickvdyck/shiori/releases/download/v" version "/shiori_linux_amd64"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "shiori_linux_amd64" "bin/shiori"))))
    (synopsis "simple bookmark manager")
    (description "Shiori is a simple bookmark manager written in Go.  It provides
a web interface and command-line tool for saving, organizing, and
searching bookmarks with offline article archiving.")
    (home-page "https://github.com/nickvdyck/shiori")
    (license license:expat)))

;;;
;;; --- 73. obs-cmd (copy-build-system, pre-built binary) ---
;;;

(define-public obs-cmd
  (package
    (name "obs-cmd")
    (version "0.18.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/griccardos/obs-cmd/releases/download/v" version "/obs-cmd-linux-x64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "obs-cmd" "bin/"))))
    (synopsis "command-line remote control for OBS Studio")
    (description "Obs-cmd is a command-line tool for controlling OBS Studio remotely
via the OBS WebSocket protocol.  It supports scene switching,
recording, streaming, and source manipulation from the terminal.")
    (home-page "https://github.com/griccardos/obs-cmd")
    (license license:expat)))

;;;
;;; --- 74. archivebox (pyproject-build-system) ---
;;;

(define-public archivebox
  (package
    (name "archivebox")
    (version "0.8.5")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://pypi.org/packages/source/a/archivebox/archivebox-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "self-hosted internet archive and bookmark preserver")
    (description "ArchiveBox is a self-hosted internet archiving solution.  It takes
URLs of websites and saves local copies as HTML, screenshots, PDFs,
WARC files, and more for long-term preservation.")
    (home-page "https://archivebox.io")
    (license license:expat)))

;;;
;;; --- 75. cppman (pyproject-build-system) ---
;;;

(define-public cppman
  (package
    (name "cppman")
    (version "0.5.8")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://pypi.org/packages/source/c/cppman/cppman-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "C++ reference manual pages from cppreference.com")
    (description "Cppman generates and caches C++ manual pages from cppreference.com.
It provides offline access to the C++ standard library documentation
in man page format.")
    (home-page "https://github.com/aitjcize/cppman")
    (license license:gpl3+)))

;;;
;;; --- 76. dyff (copy-build-system, pre-built binary) ---
;;;

(define-public dyff
  (package
    (name "dyff")
    (version "1.10.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/homeport/dyff/releases/download/v" version "/dyff_" version "_linux_amd64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "dyff" "bin/"))))
    (synopsis "diff tool for YAML files")
    (description "Dyff is a diff tool specifically designed for YAML files.  It
provides semantic comparison of YAML documents, highlighting
meaningful changes while ignoring formatting differences.")
    (home-page "https://github.com/homeport/dyff")
    (license license:expat)))

;;;
;;; --- 77. harlequin (pyproject-build-system) ---
;;;

(define-public harlequin
  (package
    (name "harlequin")
    (version "2.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://pypi.org/packages/source/h/harlequin/harlequin-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "terminal-based SQL IDE")
    (description "Harlequin is a terminal-based SQL IDE.  It provides an interactive
query editor with syntax highlighting, autocomplete, and results
viewer for DuckDB, SQLite, and other databases.")
    (home-page "https://harlequin.sh")
    (license license:expat)))

;;;
;;; --- 78. nagstamon (pyproject-build-system) ---
;;;

(define-public nagstamon
  (package
    (name "nagstamon")
    (version "3.14.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/HenriWahl/Nagstamon/releases/download/v" version "/nagstamon-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "Nagios status monitor for the desktop")
    (description "Nagstamon is a status monitor for the desktop.  It connects to
multiple Nagios, Icinga, Checkmk, and other monitoring servers and
resides in the system tray showing host and service problems.")
    (home-page "https://nagstamon.de")
    (license license:gpl2+)))

;;;
;;; --- 79. cdargs (gnu-build-system) ---
;;;

(define-public cdargs
  (package
    (name "cdargs")
    (version "1.35")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/cbrgm/cdargs/archive/v" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (synopsis "bookmarks for the shell cd command")
    (description "Cdargs is a tool that provides bookmarks for the shell built-in
cd command.  It maintains a list of commonly used directories and
provides quick navigation through a text-based interface.")
    (home-page "https://github.com/cbrgm/cdargs")
    (license license:gpl2+)))

;;;
;;; --- 80. hwatch (copy-build-system, pre-built binary) ---
;;;

(define-public hwatch
  (package
    (name "hwatch")
    (version "0.3.18")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/blacknon/hwatch/releases/download/" version "/hwatch-" version "-x86_64-unknown-linux-musl.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "hwatch" "bin/"))))
    (synopsis "alternative watch command with diff highlighting")
    (description "Hwatch is a modern alternative to the watch command.  It records
command output history and highlights differences between runs with
word-level diff support.")
    (home-page "https://github.com/blacknon/hwatch")
    (license license:expat)))

;;;
;;; --- 81. xml2 (gnu-build-system) ---
;;;

(define-public xml2
  (package
    (name "xml2")
    (version "0.5")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://web.archive.org/web/2024/https://dan.egnor.name/xml2/xml2-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (synopsis "convert between XML and flat format")
    (description "Xml2 converts XML documents into a flat, line-oriented format and
back again.  The flat format is easier to process with grep, sed,
awk, and other text-processing tools.")
    (home-page "https://dan.egnor.name/xml2")
    (license license:gpl2+)))

;;;
;;; --- 82. recyclarr (copy-build-system, pre-built binary) ---
;;;

(define-public recyclarr
  (package
    (name "recyclarr")
    (version "7.4.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/recyclarr/recyclarr/releases/download/v" version "/recyclarr-linux-x64.tar.xz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "recyclarr" "bin/"))))
    (synopsis "Sonarr and Radarr quality profile manager")
    (description "Recyclarr is a command-line tool that synchronizes quality profiles
and custom formats from TRaSH Guides into Sonarr and Radarr.  It
automates media management configuration.")
    (home-page "https://github.com/recyclarr/recyclarr")
    (license license:expat)))

;;;
;;; --- 83. spiderfoot (pyproject-build-system) ---
;;;

(define-public spiderfoot
  (package
    (name "spiderfoot")
    (version "4.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/smicallef/spiderfoot/archive/v" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "open source intelligence automation tool")
    (description "SpiderFoot is an OSINT automation tool.  It integrates with over
200 data sources to gather intelligence on IP addresses, domain
names, email addresses, and other targets for security research.")
    (home-page "https://github.com/smicallef/spiderfoot")
    (license license:expat)))

;;;
;;; --- 84. grocy (copy-build-system, pre-built binary) ---
;;;

(define-public grocy
  (package
    (name "grocy")
    (version "4.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/grocy/grocy/releases/download/v" version "/grocy_" version ".zip"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "." "share/grocy/"))))
    (synopsis "self-hosted groceries and household management")
    (description "Grocy is a web-based self-hosted groceries and household management
solution.  It tracks purchases, stock levels, expiration dates,
and shopping lists for home management.")
    (home-page "https://grocy.info")
    (license license:expat)))

;;;
;;; --- 85. viddy (copy-build-system, pre-built binary) ---
;;;

(define-public viddy
  (package
    (name "viddy")
    (version "1.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/sachaos/viddy/releases/download/v" version "/viddy_Linux_x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "viddy" "bin/"))))
    (synopsis "modern watch command with TUI")
    (description "Viddy is a modern replacement for the watch command.  It provides
a terminal user interface with output history, diff highlighting,
and search functionality for monitoring command output.")
    (home-page "https://github.com/sachaos/viddy")
    (license license:expat)))

;;;
;;; --- 86. gtkhash (gnu-build-system) ---
;;;

(define-public gtkhash
  (package
    (name "gtkhash")
    (version "1.5")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/tristanheaven/gtkhash/releases/download/v" version "/gtkhash-" version ".tar.xz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (synopsis "GTK utility for computing file checksums")
    (description "GtkHash is a desktop utility for computing message digests and
checksums.  It supports MD5, SHA-1, SHA-256, and many other hash
functions with a GTK graphical interface and Nautilus integration.")
    (home-page "https://gtkhash.org")
    (license license:gpl2+)))

;;;
;;; --- 87. uif2iso (gnu-build-system) ---
;;;

(define-public uif2iso
  (package
    (name "uif2iso")
    (version "0.1.7c")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/uif2iso/uif2iso-" version "-src.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (synopsis "convert UIF disc images to ISO format")
    (description "Uif2iso converts MagicISO UIF disc images to standard ISO format.
It supports compressed and encrypted UIF files for conversion to
widely compatible ISO images.")
    (home-page "https://code.google.com/archive/p/uif2iso")
    (license license:gpl2+)))

;;;
;;; --- 88. flpsed (gnu-build-system) ---
;;;

(define-public flpsed
  (package
    (name "flpsed")
    (version "0.7.3")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.ecademix.com/JohannesHofmann/flpsed-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (synopsis "PostScript and PDF file annotator")
    (description "Flpsed is a WYSIWYG PostScript and PDF annotator.  It lets users
add text annotations to existing PostScript and PDF documents using
an FLTK-based graphical interface.")
    (home-page "https://www.ecademix.com/JohannesHofmann/flpsed.html")
    (license license:gpl3+)))

;;;
;;; --- 89. ntfy (copy-build-system, pre-built binary) ---
;;;

(define-public ntfy
  (package
    (name "ntfy")
    (version "2.11.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/binwiederhier/ntfy/releases/download/v" version "/ntfy_" version "_linux_amd64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list (string-append "ntfy_" #$version "_linux_amd64/ntfy") "bin/"))))
    (synopsis "push notification service with HTTP API")
    (description "Ntfy is a simple HTTP-based pub-sub notification service.  It
allows sending push notifications to phones and desktops from
scripts, cron jobs, and other applications via HTTP PUT/POST.")
    (home-page "https://ntfy.sh")
    (license license:asl2.0)))

;;;
;;; --- 90. jftui (gnu-build-system) ---
;;;

(define-public jftui
  (package
    (name "jftui")
    (version "0.7.3")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/Aanok/jftui/archive/v" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (synopsis "Jellyfin terminal client")
    (description "Jftui is a terminal-based client for the Jellyfin media server.
It provides a text user interface for browsing and playing media
from a Jellyfin instance using mpv as the playback engine.")
    (home-page "https://github.com/Aanok/jftui")
    (license license:expat)))

;;;
;;; --- 91. molly-guard (gnu-build-system) ---
;;;

(define-public molly-guard
  (package
    (name "molly-guard")
    (version "0.8.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://salsa.debian.org/debian/molly-guard/-/archive/v" version "/molly-guard-v" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (synopsis "protect remote machines from accidental shutdown")
    (description "Molly-guard intercepts shutdown, reboot, halt, and poweroff
commands on machines with active SSH sessions.  It prompts for the
hostname to confirm the action, preventing accidental remote shutdowns.")
    (home-page "https://salsa.debian.org/debian/molly-guard")
    (license license:artistic2.0)))

;;;
;;; --- 92. sworkstyle (copy-build-system, pre-built binary) ---
;;;

(define-public sworkstyle
  (package
    (name "sworkstyle")
    (version "1.3.4")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/Lyr-7D1h/swayest_workstyle/archive/v" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "sworkstyle" "bin/"))))
    (synopsis "dynamic workspace names for Sway and i3")
    (description "Sworkstyle dynamically renames Sway and i3 workspaces based on
their contents.  It maps application names to icons and updates
workspace names as windows are opened and closed.")
    (home-page "https://github.com/Lyr-7D1h/swayest_workstyle")
    (license license:expat)))

;;;
;;; --- 93. ansi2html (pyproject-build-system) ---
;;;

(define-public ansi2html
  (package
    (name "ansi2html")
    (version "1.9.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://pypi.org/packages/source/a/ansi2html/ansi2html-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "convert ANSI terminal output to HTML")
    (description "Ansi2html converts ANSI-colored terminal output to HTML markup.
It can be used as a command-line tool or Python library to preserve
terminal formatting when displaying output in web pages.")
    (home-page "https://github.com/pycontribs/ansi2html")
    (license license:lgpl3+)))

;;;
;;; --- 94. dir2ogg (pyproject-build-system) ---
;;;

(define-public dir2ogg
  (package
    (name "dir2ogg")
    (version "0.14")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://jak-linux.org/projects/dir2ogg/dir2ogg-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "convert audio files to Ogg Vorbis format")
    (description "Dir2ogg converts audio files in various formats (MP3, FLAC, WAV,
WMA) to Ogg Vorbis.  It preserves tags and can recursively convert
entire directory trees.")
    (home-page "https://jak-linux.org/projects/dir2ogg")
    (license license:gpl2+)))

;;;
;;; --- 95. fluent-reader (copy-build-system, pre-built binary) ---
;;;

(define-public fluent-reader
  (package
    (name "fluent-reader")
    (version "1.1.4")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nickvdyck/nickvdyck/releases/download/v" version "/Fluent.Reader-" version "-linux-x86_64.AppImage"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "fluent-reader" "bin/fluent-reader"))))
    (synopsis "modern desktop RSS reader")
    (description "Fluent Reader is a local, cross-platform RSS reader with a modern
UI.  It supports multiple RSS services as backends and provides
article reading with full-text fetching.")
    (home-page "https://hyliu.me/fluent-reader")
    (license license:bsd-3)))

;;;
;;; --- 96. ghdl (gnu-build-system) ---
;;;

(define-public ghdl
  (package
    (name "ghdl")
    (version "4.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/ghdl/ghdl/archive/v" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (synopsis "open-source VHDL simulator")
    (description "GHDL is an open-source simulator for VHDL.  It can analyze,
elaborate, and simulate VHDL designs with support for IEEE
libraries and VHDL-2008 standard features.")
    (home-page "https://ghdl.github.io/ghdl")
    (license license:gpl2+)))

;;;
;;; --- 97. hypnotix (copy-build-system, pre-built binary) ---
;;;

(define-public hypnotix
  (package
    (name "hypnotix")
    (version "4.6")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/linuxmint/hypnotix/archive/" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "usr/" "share/hypnotix/"))))
    (synopsis "IPTV streaming application")
    (description "Hypnotix is an IPTV streaming application for Linux Mint.  It
supports M3U playlists, Xtream API, and provides a GTK-based
interface for watching live TV channels and VOD content.")
    (home-page "https://github.com/linuxmint/hypnotix")
    (license license:gpl3+)))

;;;
;;; --- 98. ascii-moon (copy-build-system, pre-built binary) ---
;;;

(define-public ascii-moon
  (package
    (name "ascii-moon")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nickvdyck/ascii-moon/releases/download/v" version "/ascii-moon-linux-amd64"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "ascii-moon-linux-amd64" "bin/ascii-moon"))))
    (synopsis "display current moon phase in ASCII art")
    (description "Ascii-moon displays the current moon phase as ASCII art in the
terminal.  It calculates the lunar phase and renders a visual
representation for astronomy enthusiasts.")
    (home-page "https://github.com/nickvdyck/ascii-moon")
    (license license:expat)))

;;;
;;; --- 99. checkupdates-notify (gnu-build-system) ---
;;;

(define-public checkupdates-notify
  (package
    (name "checkupdates-notify")
    (version "0.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nickvdyck/checkupdates-notify/archive/v" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (synopsis "notify when system updates are available")
    (description "Checkupdates-notify sends desktop notifications when system
updates are available.  It periodically checks for updates and
alerts the user through the desktop notification system.")
    (home-page "https://github.com/nickvdyck/checkupdates-notify")
    (license license:gpl3+)))

;;;
;;; --- 100. adebar (copy-build-system, pre-built binary) ---
;;;

(define-public adebar
  (package
    (name "adebar")
    (version "2.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/IzzySoft/Adebar/archive/v" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "adebar" "bin/") (list "lib/" "share/adebar/lib/") (list "tools/" "share/adebar/tools/"))))
    (synopsis "Android device backup and reporting tool")
    (description "Adebar (Android Device Backup and Report) creates shell scripts
to backup Android devices via ADB.  It generates detailed device
reports and backup scripts for apps, settings, and data.")
    (home-page "https://github.com/IzzySoft/Adebar")
    (license license:gpl2+)))
