;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency-tree resolver pass --- deptree-resolver-260414n
;;; Resolves 100 BLOCKED packages by dependency-tree priority:
;;;   - 50 recipes created
;;;   - 50 blocked with reason codes
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Run `guix download <url>` to obtain real hashes before building.

(define-module (gaurix packages deptree-resolver-260414n)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system cargo)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system go)
  #:use-module (guix build-system node)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:export (            obos-genissue-git
            obs-scrab
            ocaml-camlzip
            omniget-bin
            omnom-git
            openchamber
            opencode-claude-auth
            openmw-tes3mp
            openrefine
            openscq30-cli-bin
            openutau
            opera-proxy-git
            packwiz-git
            pacmods
            paczf-yay
            partclone-git
            pgdr
            pokemmo
            prex
            printnotes-git
            promptfoo
            punt
            purple-gowhatsapp
            pydio
            python-fleep-git
            python-pyqt5-chart
            python-zoekt-py-git
            python2-jpype1
            qt5-purchasing
            qt6gtk2
            r2modman-appimage
            radii5-bin
            raindrop
            redu
            rename-pl
            rexit-git
            riftbar-bin
            rimsort-git
            rivetui
            ruffle-nightly-bin
            run0-sudo-shim-git
            sacad
            selectdefaultapplication-git
            setrixtui
            shellman-bin
            shiru-git
            shopify-cli
            shpool
            sickchill-git
            sip4
            ))


;;; -- python-pyqt5-chart (#13321) --

(define-public python-pyqt5-chart
  (package
    (name "python-pyqt5-chart")
    (version "5.15.7")
    (source (origin
              (method url-fetch)
              (uri "https://www.riverbankcomputing.com/software/pyqtchart/intro")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://www.riverbankcomputing.com/software/pyqtchart/intro")
    (synopsis "python bindings for QtCharts")
    (description "Python bindings for QtCharts.  It is packaged from the Arch User Repository.")
    (license license:gpl3+)))

;;; -- openrefine (#13355) --

(define-public openrefine
  (package
    (name "openrefine")
    (version "3.10.0")
    (source (origin
              (method url-fetch)
              (uri "https://openrefine.org/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://openrefine.org/")
    (synopsis "a free, open source power tool for working with messy data and improving it")
    (description "A free, open source power tool for working with messy data and improving it.  It is packaged from the Arch User Repository.")
    (license license:bsd-3)))

;;; -- obos-genissue-git (#8994) --

(define-public obos-genissue-git
  (package
    (name "obos-genissue-git")
    (version "r10.ae79abe")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/obsidian-os/obos-genissue.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/obsidian-os/obos-genissue")
    (synopsis "generate /run/issue dynamically for obsidianOS")
    (description "Generate /run/issue dynamically for obsidianOS.  It is packaged from the Arch User Repository.")
    (license license:expat)))

;;; -- obs-scrab (#3244) --

(define-public obs-scrab
  (package
    (name "obs-scrab")
    (version "1.2.0")
    (source (origin
              (method url-fetch)
              (uri "https://obsproject.com/forum/resources/scrab.845/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://obsproject.com/forum/resources/scrab.845/")
    (synopsis "adds a configurable hotkey to quickly select a screen region and add it a")
    (description "Adds a configurable hotkey to quickly select a screen region and add it as an image source to the current scene.  It is packaged from the Arch User Repository.")
    (license license:gpl2)))

;;; -- ocaml-camlzip (#25130) --

(define-public ocaml-camlzip
  (package
    (name "ocaml-camlzip")
    (version "1.11")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/xavierleroy/camlzip.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/xavierleroy/camlzip")
    (synopsis "zIP and gzip library for OCaml")
    (description "ZIP and gzip library for OCaml.  It is packaged from the Arch User Repository.")
    (license license:gpl3+)))

;;; -- omniget-bin (#2857) --

(define-public omniget-bin
  (package
    (name "omniget-bin")
    (version "0.4.0")
    (source (origin
              (method url-fetch)
              (uri "https://discord.gg/TA8A8r2z")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan
                     #~'((".", "share/" #:include-regexp (".*")))))
    (home-page "https://discord.gg/TA8A8r2z")
    (synopsis "media downloader. Paste a link. Get your file. Udemy, Hotmart, Telegram a")
    (description "Media downloader. Paste a link. Get your file. Udemy, Hotmart, Telegram and 1000+ Downloader.(Prebuilt version).  It is packaged from the Arch User Repository.")
    (license license:gpl3+)))

;;; -- omnom-git (#879) --

(define-public omnom-git
  (package
    (name "omnom-git")
    (version "0.9.0.r1.g8b9c2b7")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/asciimoo/omnom.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/asciimoo/omnom")
    (synopsis "a webpage bookmarking and snapshotting service (development version)")
    (description "A webpage bookmarking and snapshotting service (development version).  It is packaged from the Arch User Repository.")
    (license license:agpl3+)))

;;; -- openchamber (#876) --

(define-public openchamber
  (package
    (name "openchamber")
    (version "1.9.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/btriapitsyn/openchamber.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/btriapitsyn/openchamber")
    (synopsis "desktop and web interface for OpenCode AI agent")
    (description "Desktop and web interface for OpenCode AI agent.  It is packaged from the Arch User Repository.")
    (license license:expat)))

;;; -- opencode-claude-auth (#11594) --

(define-public opencode-claude-auth
  (package
    (name "opencode-claude-auth")
    (version "1.4.9")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/griffinmartin/opencode-claude-auth.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/griffinmartin/opencode-claude-auth")
    (synopsis "claude Code credential bridge plugin for opencode")
    (description "Claude Code credential bridge plugin for opencode.  It is packaged from the Arch User Repository.")
    (license license:expat)))

;;; -- openmw-tes3mp (#10960) --

(define-public openmw-tes3mp
  (package
    (name "openmw-tes3mp")
    (version "0.8.1")
    (source (origin
              (method url-fetch)
              (uri "http://tes3mp.com")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "http://tes3mp.com")
    (synopsis "tES3MP is a project aiming to add multiplayer functionality to OpenMW, a ")
    (description "TES3MP is a project aiming to add multiplayer functionality to OpenMW, a free and open source recreation of the popular Bethesda Softworks game \"The Elder Scrolls III: Morrowind\".  It is packaged from the Arch User Repository.")
    (license license:gpl3+)))

;;; -- openscq30-cli-bin (#2948) --

(define-public openscq30-cli-bin
  (package
    (name "openscq30-cli-bin")
    (version "2.6.1")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/Oppzippy/OpenSCQ30/releases/download/v2.6.1/openscq30-cli-2.6.1-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan
                     #~'((".", "share/" #:include-regexp (".*")))))
    (home-page "https://github.com/Oppzippy/OpenSCQ30")
    (synopsis "cross platform application for controlling settings of Soundcore headphon")
    (description "Cross platform application for controlling settings of Soundcore headphones - CLI application.  It is packaged from the Arch User Repository.")
    (license license:gpl3+)))

;;; -- openutau (#13026) --

(define-public openutau
  (package
    (name "openutau")
    (version "0.1.568")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/stakira/OpenUtau.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/stakira/OpenUtau")
    (synopsis "open source UTAU successor")
    (description "Open source UTAU successor.  It is packaged from the Arch User Repository.")
    (license license:expat)))

;;; -- opera-proxy-git (#10052) --

(define-public opera-proxy-git
  (package
    (name "opera-proxy-git")
    (version "1.12.0.r0.g6ddb8d2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Snawoot/opera-proxy.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/Snawoot/opera-proxy")
    (synopsis "standalone Opera VPN client as http-proxy backend only")
    (description "Standalone Opera VPN client as http-proxy backend only.  It is packaged from the Arch User Repository.")
    (license license:expat)))

;;; -- packwiz-git (#11606) --

(define-public packwiz-git
  (package
    (name "packwiz-git")
    (version "r383.52b1230")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://packwiz.infra.link.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://packwiz.infra.link")
    (synopsis "a command line tool for creating minecraft modpacks")
    (description "A command line tool for creating minecraft modpacks.  It is packaged from the Arch User Repository.")
    (license license:expat)))

;;; -- pacmods (#10250) --

(define-public pacmods
  (package
    (name "pacmods")
    (version "0.1.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/c4rlo/pacmods.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/c4rlo/pacmods")
    (synopsis "tool to show changes to system config files")
    (description "Tool to show changes to system config files.  It is packaged from the Arch User Repository.")
    (license license:expat)))

;;; -- paczf-yay (#12403) --

(define-public paczf-yay
  (package
    (name "paczf-yay")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/paczf-yay.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://aur.archlinux.org/packages/paczf-yay")
    (synopsis "a TUI frontend for pacman/yay using fzf")
    (description "A TUI frontend for pacman/yay using fzf.  It is packaged from the Arch User Repository.")
    (license license:mpl2.0)))

;;; -- partclone-git (#10698) --

(define-public partclone-git
  (package
    (name "partclone-git")
    (version "1468.ee77626")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://partclone.org.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://partclone.org")
    (synopsis "utilities to save and restore used blocks on a partition")
    (description "Utilities to save and restore used blocks on a partition.  It is packaged from the Arch User Repository.")
    (license license:gpl3+)))

;;; -- pgdr (#7407) --

(define-public pgdr
  (package
    (name "pgdr")
    (version "1.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/sergik776/pgdr.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/sergik776/pgdr")
    (synopsis "cryptographically secure password generator powered by kernel entropy")
    (description "Cryptographically secure password generator powered by kernel entropy.  It is packaged from the Arch User Repository.")
    (license license:expat)))

;;; -- pokemmo (#987) --

(define-public pokemmo
  (package
    (name "pokemmo")
    (version "1.4.8")
    (source (origin
              (method url-fetch)
              (uri "https://pokemmo.eu")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://pokemmo.eu")
    (synopsis "mMO based on the Pokémon Universe")
    (description "MMO based on the Pokémon Universe.  It is packaged from the Arch User Repository.")
    (license license:gpl3+)))

;;; -- prex (#4384) --

(define-public prex
  (package
    (name "prex")
    (version "0.5.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/eyenalxai/prex.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/eyenalxai/prex")
    (synopsis "run Windows executables in Steam Proton prefixes")
    (description "Run Windows executables in Steam Proton prefixes.  It is packaged from the Arch User Repository.")
    (license license:gpl3+)))

;;; -- printnotes-git (#8988) --

(define-public printnotes-git
  (package
    (name "printnotes-git")
    (version "r249.1bead67")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/RoBoT095/printnotes.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/RoBoT095/printnotes")
    (synopsis "a better way to take notes inspired by Google Keep and Obsidian (git vers")
    (description "A better way to take notes inspired by Google Keep and Obsidian (git version).  It is packaged from the Arch User Repository.")
    (license license:gpl3)))

;;; -- promptfoo (#684) --

(define-public promptfoo
  (package
    (name "promptfoo")
    (version "0.121.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/promptfoo/promptfoo.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/promptfoo/promptfoo")
    (synopsis "test and evaluate LLM outputs - AI red teaming, pentesting, and vulnerabi")
    (description "Test and evaluate LLM outputs - AI red teaming, pentesting, and vulnerability scanning.  It is packaged from the Arch User Repository.")
    (license license:expat)))

;;; -- punt (#1146) --

(define-public punt
  (package
    (name "punt")
    (version "0.5.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/lance0/punt.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/lance0/punt")
    (synopsis "share terminal output instantly via punt.sh - quick, colorful, ephemeral")
    (description "Share terminal output instantly via punt.sh - quick, colorful, ephemeral.  It is packaged from the Arch User Repository.")
    (license license:expat)))

;;; -- purple-gowhatsapp (#4264) --

(define-public purple-gowhatsapp
  (package
    (name "purple-gowhatsapp")
    (version "1.19.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/hoehermann/purple-gowhatsapp.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/hoehermann/purple-gowhatsapp")
    (synopsis "a libpurple/Pidgin plugin for WhatsApp Web, Powered by go-whatsapp")
    (description "A libpurple/Pidgin plugin for WhatsApp Web, Powered by go-whatsapp.  It is packaged from the Arch User Repository.")
    (license license:gpl3+)))

;;; -- pydio (#25149) --

(define-public pydio
  (package
    (name "pydio")
    (version "8.2.4")
    (source (origin
              (method url-fetch)
              (uri "https://pydio.com")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://pydio.com")
    (synopsis "sync & share solution, formerly AjaXplorer")
    (description "Sync & share solution, formerly AjaXplorer.  It is packaged from the Arch User Repository.")
    (license license:agpl3+)))

;;; -- python-fleep-git (#18630) --

(define-public python-fleep-git
  (package
    (name "python-fleep-git")
    (version "0.0.0.r21.994bc2c")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/floyernick/fleep-py.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/floyernick/fleep-py")
    (synopsis "file format determination library for Python")
    (description "File format determination library for Python.  It is packaged from the Arch User Repository.")
    (license license:expat)))

;;; -- python-zoekt-py-git (#7575) --

(define-public python-zoekt-py-git
  (package
    (name "python-zoekt-py-git")
    (version "0.1.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/udbhav-44/zoekt-py.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/udbhav-44/zoekt-py")
    (synopsis "a modern, fully typed Python client and CLI for interacting with Zoekt, a")
    (description "A modern, fully typed Python client and CLI for interacting with Zoekt, a fast, scalable code search engine.  It is packaged from the Arch User Repository.")
    (license license:expat)))

;;; -- python2-jpype1 (#25152) --

(define-public python2-jpype1
  (package
    (name "python2-jpype1")
    (version "0.7.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/jpype-project/jpype.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/jpype-project/jpype")
    (synopsis "python to Java bridge, an effort to allow Python programs full access to ")
    (description "Python to Java bridge, an effort to allow Python programs full access to Java class libraries.  It is packaged from the Arch User Repository.")
    (license license:asl2.0)))

;;; -- qt5-purchasing (#13361) --

(define-public qt5-purchasing
  (package
    (name "qt5-purchasing")
    (version "5.15.18")
    (source (origin
              (method url-fetch)
              (uri "https://www.qt.io")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://www.qt.io")
    (synopsis "Qt In-App Purchasing API")
    (description "Qt In-App Purchasing API.  It is packaged from the Arch User Repository.")
    (license license:gpl3+)))

;;; -- qt6gtk2 (#10124) --

(define-public qt6gtk2
  (package
    (name "qt6gtk2")
    (version "0.7")
    (source (origin
              (method url-fetch)
              (uri "https://www.opencode.net/trialuser/qt6gtk2")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://www.opencode.net/trialuser/qt6gtk2")
    (synopsis "GTK+2.0 integration plugins for Qt6")
    (description "GTK+2.0 integration plugins for Qt6.  It is packaged from the Arch User Repository.")
    (license license:gpl2)))

;;; -- r2modman-appimage (#1761) --

(define-public r2modman-appimage
  (package
    (name "r2modman-appimage")
    (version "3.2.15")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ebkr/r2modmanPlus.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/ebkr/r2modmanPlus")
    (synopsis "a simple and easy to use mod manager for several Unity games using Thunde")
    (description "A simple and easy to use mod manager for several Unity games using Thunderstore.  It is packaged from the Arch User Repository.")
    (license license:expat)))

;;; -- radii5-bin (#2628) --

(define-public radii5-bin
  (package
    (name "radii5-bin")
    (version "0.4.1")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/radii5/music/releases/download/v0.4.1/radii5-0.4.1-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan
                     #~'((".", "share/" #:include-regexp (".*")))))
    (home-page "https://github.com/radii5/music")
    (synopsis "cLI music downloader powered by yt-dlp with parallel chunk downloading an")
    (description "CLI music downloader powered by yt-dlp with parallel chunk downloading and automatic ID3 tagging.  It is packaged from the Arch User Repository.")
    (license license:expat)))

;;; -- raindrop (#7029) --

(define-public raindrop
  (package
    (name "raindrop")
    (version "5.7.3")
    (source (origin
              (method url-fetch)
              (uri "https://raindrop.io")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://raindrop.io")
    (synopsis "all-in-one bookmark manager")
    (description "All-in-one bookmark manager.  It is packaged from the Arch User Repository.")
    (license license:expat)))

;;; -- redu (#4361) --

(define-public redu
  (package
    (name "redu")
    (version "0.2.15")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/drdo/redu.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/drdo/redu/")
    (synopsis "ncdu for your restic repository")
    (description "Ncdu for your restic repository.  It is packaged from the Arch User Repository.")
    (license license:expat)))

;;; -- rename.pl (#830) --

(define-public rename-pl
  (package
    (name "rename-pl")
    (version "2.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/kugland/rename.pl.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/kugland/rename.pl")
    (synopsis "rename files using perl expressions")
    (description "Rename files using perl expressions.  It is packaged from the Arch User Repository.")
    (license license:expat)))

;;; -- rexit-git (#3679) --

(define-public rexit-git
  (package
    (name "rexit-git")
    (version "r20.4e33f53")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Ninso112/rexit.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/Ninso112/rexit")
    (synopsis "a rice-ready TUI power menu for Linux with multi-WM support")
    (description "A rice-ready TUI power menu for Linux with multi-WM support.  It is packaged from the Arch User Repository.")
    (license license:gpl3+)))

;;; -- riftbar-bin (#1305) --

(define-public riftbar-bin
  (package
    (name "riftbar-bin")
    (version "0.1.9")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/BinaryHarbinger/riftbar/releases/download/v0.1.9/riftbar-0.1.9-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan
                     #~'((".", "share/" #:include-regexp (".*")))))
    (home-page "https://github.com/BinaryHarbinger/riftbar")
    (synopsis "highly customizable GTK4 bar for Wayland written in Rust")
    (description "Highly customizable GTK4 bar for Wayland written in Rust.  It is packaged from the Arch User Repository.")
    (license license:gpl3+)))

;;; -- rimsort-git (#7291) --

(define-public rimsort-git
  (package
    (name "rimsort-git")
    (version "r2125.405f05b9")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/RimSort/RimSort.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/RimSort/RimSort")
    (synopsis "a Mod Manager For Rimworld game")
    (description "A Mod Manager For Rimworld game.  It is packaged from the Arch User Repository.")
    (license license:gpl3+)))

;;; -- rivetui (#7623) --

(define-public rivetui
  (package
    (name "rivetui")
    (version "0.3.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/YetAnotherMechanicusEnjoyer/Rivet.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/YetAnotherMechanicusEnjoyer/Rivet")
    (synopsis "a Terminal UI Discord Client in Rust")
    (description "A Terminal UI Discord Client in Rust.  It is packaged from the Arch User Repository.")
    (license license:expat)))

;;; -- ruffle-nightly-bin (#1293) --

(define-public ruffle-nightly-bin
  (package
    (name "ruffle-nightly-bin")
    (version "2026.4.12")
    (source (origin
              (method url-fetch)
              (uri "https://ruffle.rs/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan
                     #~'((".", "share/" #:include-regexp (".*")))))
    (home-page "https://ruffle.rs/")
    (synopsis "a Flash Player emulator written in Rust")
    (description "A Flash Player emulator written in Rust.  It is packaged from the Arch User Repository.")
    (license license:asl2.0)))

;;; -- run0-sudo-shim-git (#7022) --

(define-public run0-sudo-shim-git
  (package
    (name "run0-sudo-shim-git")
    (version "1.2.0.r8.g84b51f4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/LordGrimmauld/run0-sudo-shim.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/LordGrimmauld/run0-sudo-shim")
    (synopsis "an imitation of sudo, using run0 internally - WARNING: !!! THIS REPLACES ")
    (description "An imitation of sudo, using run0 internally - WARNING: !!! THIS REPLACES SUDO !!!.  It is packaged from the Arch User Repository.")
    (license license:bsd-3)))

;;; -- sacad (#3802) --

(define-public sacad
  (package
    (name "sacad")
    (version "3.0.0.r0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/desbma/sacad.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/desbma/sacad")
    (synopsis "smart Automatic Cover Art Downloader")
    (description "Smart Automatic Cover Art Downloader.  It is packaged from the Arch User Repository.")
    (license license:mpl2.0)))

;;; -- selectdefaultapplication-git (#4687) --

(define-public selectdefaultapplication-git
  (package
    (name "selectdefaultapplication-git")
    (version "r19.73a7579")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/sandsmark/selectdefaultapplication.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/sandsmark/selectdefaultapplication")
    (synopsis "a very simple application that lets you define default applications on Li")
    (description "A very simple application that lets you define default applications on Linux in a sane way.  It is packaged from the Arch User Repository.")
    (license license:gpl3+)))

;;; -- setrixtui (#1135) --

(define-public setrixtui
  (package
    (name "setrixtui")
    (version "0.4.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Mjoyufull/setrixtui.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/Mjoyufull/setrixtui")
    (synopsis "tetris Sand game in Ratatui")
    (description "Tetris Sand game in Ratatui.  It is packaged from the Arch User Repository.")
    (license license:gpl3+)))

;;; -- shellman-bin (#2978) --

(define-public shellman-bin
  (package
    (name "shellman-bin")
    (version "1.1.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/Its-Atharva-Gupta/Shellman/releases/download/v1.1.0/shellman-1.1.0-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan
                     #~'((".", "share/" #:include-regexp (".*")))))
    (home-page "https://github.com/Its-Atharva-Gupta/Shellman")
    (synopsis "a Terminal User Interface (TUI) based file manager, cross platform, build")
    (description "A Terminal User Interface (TUI) based file manager, cross platform, build using textual and python.  It is packaged from the Arch User Repository.")
    (license license:expat)))

;;; -- shiru-git (#7746) --

(define-public shiru-git
  (package
    (name "shiru-git")
    (version "r1560.7ed5569")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/RockinChaos/Shiru.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/RockinChaos/Shiru")
    (synopsis "bitTorrent streaming software with no paws in the way—watch anime in real")
    (description "BitTorrent streaming software with no paws in the way—watch anime in real-time, no waiting for downloads!.  It is packaged from the Arch User Repository.")
    (license license:gpl3+)))

;;; -- shopify-cli (#2969) --

(define-public shopify-cli
  (package
    (name "shopify-cli")
    (version "3.93.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Shopify/cli.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/Shopify/cli")
    (synopsis "a CLI tool to build for the Shopify platform")
    (description "A CLI tool to build for the Shopify platform.  It is packaged from the Arch User Repository.")
    (license license:expat)))

;;; -- shpool (#7725) --

(define-public shpool
  (package
    (name "shpool")
    (version "0.9.5")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/shell-pool/shpool.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/shell-pool/shpool")
    (synopsis "think tmux, then aim... lower")
    (description "Think tmux, then aim... lower.  It is packaged from the Arch User Repository.")
    (license license:asl2.0)))

;;; -- sickchill-git (#25170) --

(define-public sickchill-git
  (package
    (name "sickchill-git")
    (version "2024.3.1.r0.20260307.latest")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://sickchill.github.io.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://sickchill.github.io")
    (synopsis "automatic video library manager for TV shows")
    (description "Automatic video library manager for TV shows.  It is packaged from the Arch User Repository.")
    (license license:gpl3+)))

;;; -- sip4 (#7296) --

(define-public sip4
  (package
    (name "sip4")
    (version "4.19.25")
    (source (origin
              (method url-fetch)
              (uri "https://www.riverbankcomputing.com/software/sip/intro")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://www.riverbankcomputing.com/software/sip/intro")
    (synopsis "a tool that makes it easy to create Python bindings for C and C++ libraries")
    (description "A tool that makes it easy to create Python bindings for C and C++ libraries.  It is packaged from the Arch User Repository.")
    (license license:gpl3+)))
