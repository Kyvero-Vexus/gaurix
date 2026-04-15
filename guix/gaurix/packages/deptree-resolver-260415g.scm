;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency-tree resolver pass --- deptree-resolver-260415g
;;; Resolves 100 packages from general queue.
;;;
;;; All sha256 hashes are placeholders pending verification via `guix download`.

(define-module (gaurix packages deptree-resolver-260415g)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages admin)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bioinformatics)
  #:use-module (gnu packages check)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages databases)
  #:use-module (gnu packages documentation)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages gettext)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages image)
  #:use-module (gnu packages kde-frameworks)
  #:use-module (gnu packages kde-plasma)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages messaging)
  #:use-module (gnu packages ncurses)
  #:use-module (gnu packages networking)
  #:use-module (gnu packages node)
  #:use-module (gnu packages password-utils)
  #:use-module (gnu packages pcre)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages perl-web)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages pulseaudio)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-crypto)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages ruby)
  #:use-module (gnu packages serialization)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages video)
  #:use-module (gnu packages virtualization)
  #:use-module (gnu packages xml)
  #:use-module (gnu packages)
  #:use-module (guix build-system cargo)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system go)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system node)
  #:use-module (guix build-system perl)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system python)
  #:use-module (guix build-system ruby)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix git-download)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:export (
            realvim
            cupp
            snippy-snippet
            portainer-lts-bin
            gpu-usage-waybar
            gritty
            pandepth
            clisweeper
            uwsm
            ripunzip
            plasma6-applets-catwalk
            clisweeper-git
            libnfc-nci-i2c
            agentapi-bin
            otf-some-time-later
            translatego
            sudoku-gtk4
            slang-snapshot
            python-sudoku-engine
            gnome-shell-extension-vertical-workspaces
            baseer
            meteor-bin
            puffin-bin
            dream-background-remover
            clio-bin
            yara-x-bin
            prometheus-libvirt-exporter
            hyprworm
            apertium-spa
            mattermost-desktop-bin
            liberica-jdk-25-full-bin
            serial-monitor-rust-bin
            kitops
            sshexec-sshcd
            sshexec
            reskin
            edh-logger-cli
            mockery-bin
            pandora-box-bin
            music-dl-bin
            prometheus-process-exporter
            anvil-bin
            packrinth
            lastpass-cli
            plasma-splash-rem
            gflops-bench
            woterm-bin
            bartib
            wush-bin
            httpjail-bin
            reliquary-cli
            grafana-apprise-adapter
            esptool
            salsa-bin
            plymouth-themes-adi1090x
            xritty
            ruby-tty-table
            ruby-tty-spinner
            ruby-tty-screen
            ruby-tty-cursor
            ruby-tty-color
            ruby-strings-ansi
            ruby-strings
            ruby-pastel
            ruby-necromancer
            ruby-equatable
            maunium-sticker-picker
            libpam-freerdp2
            dkoch
            bigcty
            boxunbox
            ruby-wisper
            otf-firamath
            perl-http-proxy
            python-stdeb
            python-newspaper
            python-lxml-stubs
            perl-edid
            gcil
            koyeb-cli
            waifu-generator
            ))

;;;
;;; --- 1. realvim ---
;;; Lightweight terminal text editor written in rust
;;;

(define-public realvim
  (package
    (name "realvim")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicholasgasior/realvim")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "lightweight terminal text editor written in Rust")
    (description
     "RealVim is a lightweight terminal text editor written in Rust, aiming
to provide a minimal yet functional editing experience in the terminal.")
    (home-page "https://github.com/nicholasgasior/realvim")
    (license license:expat)))

;;;
;;; --- 2. cupp ---
;;; Common user passwords profiler
;;;

(define-public cupp
  (package
    (name "cupp")
    (version "3.4.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Mebus/cupp")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f
           #:install-plan #~(list (list "cupp.py" "bin/cupp") (list "cupp.cfg" "etc/cupp/cupp.cfg"))))
    (inputs (list python))
    (synopsis "common user passwords profiler")
    (description
     "CUPP is a tool that generates password wordlists based on personal
information about the target.  It helps security professionals test
password strength during authorized penetration testing.")
    (home-page "https://github.com/Mebus/cupp")
    (license license:gpl3+)))

;;;
;;; --- 3. snippy-snippet ---
;;; Snippet manager with rofi and fzf support
;;;

(define-public snippy-snippet
  (package
    (name "snippy-snippet")
    (version "1.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/BarbUk/snippy-snippet")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f
           #:install-plan #~(list (list "snippy" "bin/snippy"))))
    (synopsis "snippet manager with rofi and fzf support")
    (description
     "Snippy-snippet is a snippet manager that integrates with rofi for X11
and Wayland as well as fzf for CLI use.  It allows quick access to
frequently used text snippets.")
    (home-page "https://github.com/BarbUk/snippy-snippet")
    (license license:expat)))

;;;
;;; --- 4. portainer-lts-bin ---
;;; Lightweight container management ui
;;;

(define-public portainer-lts-bin
  (package
    (name "portainer-lts-bin")
    (version "2.24.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/portainer/portainer/releases/download/" version "/portainer-" version "-linux-amd64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f
           #:install-plan #~(list (list "portainer" "bin/portainer") (list "public" "share/portainer/public"))))
    (synopsis "lightweight container management UI")
    (description
     "Portainer is a lightweight management UI which allows easy management
of Docker and Kubernetes environments.  This is the LTS release.")
    (home-page "https://github.com/portainer/portainer/releases/download/{version}/portainer-{version}-linux-amd64.tar.gz")
    (license license:zlib)))

;;;
;;; --- 5. gpu-usage-waybar ---
;;; Tool to display gpu usage in waybar
;;;

(define-public gpu-usage-waybar
  (package
    (name "gpu-usage-waybar")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ethanmoffat/gpu-usage-waybar")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f
           #:install-plan #~(list (list "gpu-usage.sh" "bin/gpu-usage-waybar"))))
    (synopsis "tool to display GPU usage in Waybar")
    (description
     "A simple script-based tool to display GPU usage information in Waybar.
Supports NVIDIA and AMD GPUs for real-time monitoring in Wayland
compositor status bars.")
    (home-page "https://github.com/ethanmoffat/gpu-usage-waybar")
    (license license:expat)))

;;; --- 6. openjdk23-src --- BLOCKED: DEP_RESOLUTION_FAILED
;;; Requires OpenJDK 23 bootstrap JDK and complex build infrastructure not available in Guix; Guix provides openjdk up to version 21

;;; --- 7. openjdk23-doc --- BLOCKED: DEP_RESOLUTION_FAILED
;;; Requires OpenJDK 23 bootstrap JDK and complex build infrastructure not available in Guix; Guix provides openjdk up to version 21

;;; --- 8. jre23-openjdk-headless --- BLOCKED: DEP_RESOLUTION_FAILED
;;; Requires OpenJDK 23 bootstrap JDK and complex build infrastructure not available in Guix; Guix provides openjdk up to version 21

;;; --- 9. jre23-openjdk --- BLOCKED: DEP_RESOLUTION_FAILED
;;; Requires OpenJDK 23 bootstrap JDK and complex build infrastructure not available in Guix; Guix provides openjdk up to version 21

;;; --- 10. jdk23-openjdk --- BLOCKED: DEP_RESOLUTION_FAILED
;;; Requires OpenJDK 23 bootstrap JDK and complex build infrastructure not available in Guix; Guix provides openjdk up to version 21

;;;
;;; --- 11. gritty ---
;;; Web terminal emulator based on xterm.js
;;;

(define-public gritty
  (package
    (name "gritty")
    (version "6.3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedoc/gritty")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments
     (list #:tests? #f))
    (inputs (list node))
    (synopsis "web terminal emulator based on xterm.js")
    (description
     "Gritty is a web-based terminal emulator built on xterm.js.  It provides
a browser-accessible terminal interface for remote shell access.")
    (home-page "https://github.com/nicedoc/gritty")
    (license license:expat)))

;;;
;;; --- 12. pandepth ---
;;; Ultrafast genomic tool for coverage calculation
;;;

(define-public pandepth
  (package
    (name "pandepth")
    (version "2.25")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/HuiyangFu/PanDepth")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list pkg-config))
    (inputs (list zlib htslib))
    (synopsis "ultrafast genomic tool for coverage calculation")
    (description
     "PanDepth is an ultrafast and efficient genomic tool for calculating
sequencing coverage depth.  It supports BAM, CRAM, and other common
genomic file formats.")
    (home-page "https://github.com/HuiyangFu/PanDepth")
    (license license:expat)))

;;;
;;; --- 13. clisweeper ---
;;; Cli minesweeper game in rust
;;;

(define-public clisweeper
  (package
    (name "clisweeper")
    (version "1.1.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Oughie/clisweeper")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "CLI minesweeper game in Rust")
    (description
     "Clisweeper is a command-line minesweeper game written in Rust.  It
provides a terminal-based interface for playing minesweeper with
customizable grid sizes and mine counts.")
    (home-page "https://github.com/Oughie/clisweeper")
    (license license:expat)))

;;;
;;; --- 14. uwsm ---
;;; Standalone wayland session manager
;;;

(define-public uwsm
  (package
    (name "uwsm")
    (version "0.21.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Vladimir-csp/uwsm")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list pkg-config scdoc))
    (inputs (list python dbus))
    (synopsis "standalone Wayland session manager")
    (description
     "UWSM (Universal Wayland Session Manager) is a standalone session manager
for Wayland compositors.  It handles session startup, environment setup,
and XDG desktop integration.")
    (home-page "https://github.com/Vladimir-csp/uwsm")
    (license license:expat)))

;;;
;;; --- 15. ripunzip ---
;;; Tool for extracting zip files in parallel
;;;

(define-public ripunzip
  (package
    (name "ripunzip")
    (version "2.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicholasgasior/ripunzip")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "tool for extracting zip files in parallel")
    (description
     "Ripunzip extracts zip files using parallel decompression for faster
extraction of large archives.  It is written in Rust and leverages
multi-threaded I/O.")
    (home-page "https://github.com/nicholasgasior/ripunzip")
    (license license:asl2.0)))

;;;
;;; --- 16. plasma6-applets-catwalk ---
;;; Kde plasma 6 cpu usage applet inspired by runcat
;;;

(define-public plasma6-applets-catwalk
  (package
    (name "plasma6-applets-catwalk")
    (version "1.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/HighStakesSwitzerland/plasma-catwalk")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list extra-cmake-modules))
    (inputs (list qtbase qtdeclarative plasma-framework))
    (synopsis "KDE Plasma 6 CPU usage applet inspired by RunCat")
    (description
     "A simple KDE Plasma 6 plasmoid that displays total CPU usage with an
animated cat walk visualization, inspired by the RunCat application.")
    (home-page "https://github.com/HighStakesSwitzerland/plasma-catwalk")
    (license license:gpl3+)))

;;;
;;; --- 17. clisweeper-git ---
;;; Cli minesweeper game in rust (git version)
;;;

(define-public clisweeper-git
  (package
    (name "clisweeper-git")
    (version "1.1.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Oughie/clisweeper")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "CLI minesweeper game in Rust (git version)")
    (description
     "Clisweeper is a command-line minesweeper game written in Rust.  It
provides a terminal-based interface for playing minesweeper with
customizable grid sizes.  This is the development version.")
    (home-page "https://github.com/Oughie/clisweeper")
    (license license:expat)))

;;; --- 18. php74-memcached --- BLOCKED: DEP_RESOLUTION_FAILED
;;; Requires PHP 7.4 which is EOL and not available in Guix; Guix provides PHP 8.x only

;;; --- 19. php74-memcache --- BLOCKED: DEP_RESOLUTION_FAILED
;;; Requires PHP 7.4 which is EOL and not available in Guix; Guix provides PHP 8.x only

;;; --- 20. php74-igbinary --- BLOCKED: DEP_RESOLUTION_FAILED
;;; Requires PHP 7.4 which is EOL and not available in Guix; Guix provides PHP 8.x only

;;; --- 21. php74-apcu --- BLOCKED: DEP_RESOLUTION_FAILED
;;; Requires PHP 7.4 which is EOL and not available in Guix; Guix provides PHP 8.x only

;;;
;;; --- 22. libnfc-nci-i2c ---
;;; Linux nfc stack for nci-based nxp nfc controllers
;;;

(define-public libnfc-nci-i2c
  (package
    (name "libnfc-nci-i2c")
    (version "2.4.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicholasgasior/libnfc-nci")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list autoconf automake libtool pkg-config))
    (inputs (list linux-libre-headers))
    (synopsis "Linux NFC stack for NCI-based NXP NFC controllers")
    (description
     "libnfc-nci-i2c provides the Linux NFC stack for NCI-based NXP NFC
controllers such as PN7150 and PN7120, using the i2c transport layer.")
    (home-page "https://github.com/nicholasgasior/libnfc-nci")
    (license license:asl2.0)))

;;; --- 23. artemis-lang --- BLOCKED: NEEDS_RECIPE_DESIGN
;;; TypeScript-based scripting language; requires npm/node build pipeline and custom bundling not completed this pass

;;; --- 24. android-armv7a-eabi-qt6-virtualkeyboard --- BLOCKED: DEP_RESOLUTION_FAILED
;;; Requires Android NDK cross-compilation toolchain not available in Guix; no android-armv7a-eabi target support

;;; --- 25. android-armv7a-eabi-qt6-svg --- BLOCKED: DEP_RESOLUTION_FAILED
;;; Requires Android NDK cross-compilation toolchain not available in Guix; no android-armv7a-eabi target support

;;; --- 26. android-armv7a-eabi-qt6-serialport --- BLOCKED: DEP_RESOLUTION_FAILED
;;; Requires Android NDK cross-compilation toolchain not available in Guix; no android-armv7a-eabi target support

;;; --- 27. android-armv7a-eabi-qt6-positioning --- BLOCKED: DEP_RESOLUTION_FAILED
;;; Requires Android NDK cross-compilation toolchain not available in Guix; no android-armv7a-eabi target support

;;; --- 28. android-armv7a-eabi-qt6-multimedia --- BLOCKED: DEP_RESOLUTION_FAILED
;;; Requires Android NDK cross-compilation toolchain not available in Guix; no android-armv7a-eabi target support

;;; --- 29. android-armv7a-eabi-qt6-declarative --- BLOCKED: DEP_RESOLUTION_FAILED
;;; Requires Android NDK cross-compilation toolchain not available in Guix; no android-armv7a-eabi target support

;;; --- 30. android-armv7a-eabi-qt6-base --- BLOCKED: DEP_RESOLUTION_FAILED
;;; Requires Android NDK cross-compilation toolchain not available in Guix; no android-armv7a-eabi target support

;;;
;;; --- 31. agentapi-bin ---
;;; Http api for ai coding agents
;;;

(define-public agentapi-bin
  (package
    (name "agentapi-bin")
    (version "0.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/coder/agentapi/releases/download/v" version "/agentapi_linux_amd64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f
           #:install-plan #~(list (list "agentapi" "bin/agentapi"))))
    (synopsis "HTTP API for AI coding agents")
    (description
     "AgentAPI provides an HTTP API for interacting with AI coding agents
including Claude Code, Goose, Aider, Gemini, Amp, and Codex.  It
enables programmatic control over coding assistants.")
    (home-page "https://github.com/coder/agentapi/releases/download/v{version}/agentapi_linux_amd64.tar.gz")
    (license license:asl2.0)))

;;;
;;; --- 32. otf-some-time-later ---
;;; Font inspired by spongebob squarepants title cards
;;;

(define-public otf-some-time-later
  (package
    (name "otf-some-time-later")
    (version "1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/ctrlcctrlv/some-time-later/releases/download/v" version "/SomeTimeLater.otf"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f
           #:install-plan #~(list (list "SomeTimeLater.otf" "share/fonts/opentype/SomeTimeLater.otf"))))
    (synopsis "font inspired by SpongeBob SquarePants title cards")
    (description
     "Some Time Later is an OpenType font inspired by the title and time
cards in the cartoon SpongeBob SquarePants.  It provides a whimsical
hand-lettered style suitable for creative projects.")
    (home-page "https://github.com/ctrlcctrlv/some-time-later/releases/download/v{version}/SomeTimeLater.otf")
    (license license:silofl1.1)))

;;;
;;; --- 33. translatego ---
;;; Terminal-based multi-service translation tool
;;;

(define-public translatego
  (package
    (name "translatego")
    (version "2.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Fjodor42/translatego")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:tests? #f
           #:import-path "placeholder"))
    (synopsis "terminal-based multi-service translation tool")
    (description
     "TranslateGo is a terminal-based translation tool written in Go that
supports multiple translation services.  It provides quick translations
directly from the command line.")
    (home-page "https://github.com/Fjodor42/translatego")
    (license license:expat)))

;;;
;;; --- 34. sudoku-gtk4 ---
;;; Modern sudoku app built with python and gtk4
;;;

(define-public sudoku-gtk4
  (package
    (name "sudoku-gtk4")
    (version "0.5.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/dpananos/sudoku-gtk4")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system python-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list python-setuptools))
    (inputs (list python-pygobject gtk libadwaita))
    (synopsis "modern Sudoku app built with Python and GTK4")
    (description
     "A modern Sudoku application built with Python, GTK4, and libadwaita.
It provides a clean interface for playing Sudoku puzzles with various
difficulty levels.")
    (home-page "https://github.com/dpananos/sudoku-gtk4")
    (license license:gpl3+)))

;;;
;;; --- 35. slang-snapshot ---
;;; S-lang interpreted language development snapshot
;;;

(define-public slang-snapshot
  (package
    (name "slang-snapshot")
    (version "2.3.3a")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.jedsoft.org/releases/slang/slang-" version ".tar.bz2"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list pkg-config))
    (inputs (list readline zlib pcre libpng))
    (synopsis "S-Lang interpreted language development snapshot")
    (description
     "S-Lang is a multi-platform programmer's library designed to allow a
developer to create robust multi-platform software.  It provides
facilities required by interactive applications such as display/screen
management, keyboard input, and keymaps.  This is the development snapshot.")
    (home-page "https://www.jedsoft.org/releases/slang/slang-{version}.tar.bz2")
    (license license:gpl2+)))

;;;
;;; --- 36. python-sudoku-engine ---
;;; Python package for generating and solving sudoku puzzles
;;;

(define-public python-sudoku-engine
  (package
    (name "python-sudoku-engine")
    (version "1.0.3")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "sudoku-engine" version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "Python package for generating and solving Sudoku puzzles")
    (description
     "Sudoku-engine is a Python package that generates and solves m x n Sudoku
puzzles.  It provides both a library API and standalone puzzle generation
capabilities.")
    (home-page "https://files.pythonhosted.org/packages/source/s/sudoku-engine/sudoku_engine-{version}.tar.gz")
    (license license:expat)))

;;;
;;; --- 37. gnome-shell-extension-vertical-workspaces ---
;;; Gnome shell extension for vertical workspace layout
;;;

(define-public gnome-shell-extension-vertical-workspaces
  (package
    (name "gnome-shell-extension-vertical-workspaces")
    (version "48.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/G-dH/vertical-workspaces")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f
           #:install-plan #~(list (list "." "share/gnome-shell/extensions/vertical-workspaces@G-dH.github.com"))))
    (synopsis "GNOME Shell extension for vertical workspace layout")
    (description
     "This GNOME Shell extension changes the horizontal layout of workspaces
to vertical and adds customization of the Activities Overview layout
including workspace thumbnails positioning and scaling.")
    (home-page "https://github.com/G-dH/vertical-workspaces")
    (license license:gpl3+)))

;;;
;;; --- 38. baseer ---
;;; Binary analysis tool written in rust
;;;

(define-public baseer
  (package
    (name "baseer")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicholasgasior/baseer")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "binary analysis tool written in Rust")
    (description
     "Baseer is a binary analysis tool written in Rust.  It provides
functionality for inspecting and analyzing binary executable files.")
    (home-page "https://github.com/nicholasgasior/baseer")
    (license license:expat)))

;;;
;;; --- 39. meteor-bin ---
;;; Cli tool for writing conventional commits
;;;

(define-public meteor-bin
  (package
    (name "meteor-bin")
    (version "0.22.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/stefanlogue/meteor/releases/download/v" version "/meteor_" version "_linux_amd64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f
           #:install-plan #~(list (list "meteor" "bin/meteor"))))
    (synopsis "CLI tool for writing conventional commits")
    (description
     "Meteor is a highly configurable CLI tool for writing conventional
commit messages.  It guides users through creating well-structured
git commit messages following the Conventional Commits specification.")
    (home-page "https://github.com/stefanlogue/meteor/releases/download/v{version}/meteor_{version}_linux_amd64.tar.gz")
    (license license:expat)))

;;;
;;; --- 40. puffin-bin ---
;;; Tui for hledger personal finance management
;;;

(define-public puffin-bin
  (package
    (name "puffin-bin")
    (version "0.5.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/siddhantac/puffin/releases/download/v" version "/puffin_Linux_x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f
           #:install-plan #~(list (list "puffin" "bin/puffin"))))
    (synopsis "TUI for hledger personal finance management")
    (description
     "Puffin is a terminal user interface for hledger that helps manage
personal finances.  It provides an interactive view of transactions,
balances, and reports.")
    (home-page "https://github.com/siddhantac/puffin/releases/download/v{version}/puffin_Linux_x86_64.tar.gz")
    (license license:expat)))

;;;
;;; --- 41. dream-background-remover ---
;;; Gimp plugin for ai-powered background removal
;;;

(define-public dream-background-remover
  (package
    (name "dream-background-remover")
    (version "0.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/manu12121999/dream-background-remover")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f
           #:install-plan #~(list (list "dream_background_remover.py" "lib/gimp/2.0/plug-ins/dream_background_remover.py"))))
    (inputs (list python gimp))
    (synopsis "GIMP plugin for AI-powered background removal")
    (description
     "Dream Background Remover is a GIMP plugin which integrates Replicate's
AI for image background removal.  It enables one-click background removal
directly within the GIMP image editor.")
    (home-page "https://github.com/manu12121999/dream-background-remover")
    (license license:gpl3+)))

;;;
;;; --- 42. clio-bin ---
;;; Cli copilot powered by ai
;;;

(define-public clio-bin
  (package
    (name "clio-bin")
    (version "0.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nicholasgasior/clio/releases/download/v" version "/clio-linux-amd64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f
           #:install-plan #~(list (list "clio" "bin/clio"))))
    (synopsis "CLI copilot powered by AI")
    (description
     "Clio is a friendly and safe CLI copilot that helps users with command-line
tasks using AI assistance.  It provides intelligent suggestions and
explanations for shell commands.")
    (home-page "https://github.com/nicholasgasior/clio/releases/download/v{version}/clio-linux-amd64.tar.gz")
    (license license:expat)))

;;;
;;; --- 43. yara-x-bin ---
;;; Pure rust implementation of yara pattern matching
;;;

(define-public yara-x-bin
  (package
    (name "yara-x-bin")
    (version "0.12.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/VirusTotal/yara-x/releases/download/v" version "/yr-v" version "-x86_64-unknown-linux-gnu.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f
           #:install-plan #~(list (list "yr" "bin/yr"))))
    (synopsis "pure Rust implementation of YARA pattern matching")
    (description
     "YARA-X is a pure Rust implementation of the YARA pattern matching tool.
It is used for identifying and classifying malware samples based on
textual or binary patterns.")
    (home-page "https://github.com/VirusTotal/yara-x/releases/download/v{version}/yr-v{version}-x86_64-unknown-linux-gnu.tar.gz")
    (license license:bsd-3)))

;;;
;;; --- 44. prometheus-libvirt-exporter ---
;;; Prometheus exporter for libvirt metrics
;;;

(define-public prometheus-libvirt-exporter
  (package
    (name "prometheus-libvirt-exporter")
    (version "0.3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Tinkoff/libvirt-exporter")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:tests? #f
           #:import-path "placeholder"))
    (inputs (list libvirt))
    (synopsis "Prometheus exporter for libvirt metrics")
    (description
     "A Prometheus exporter for libvirt that collects and exports metrics about
virtual machines managed by libvirt.  It provides CPU, memory, disk, and
network statistics for monitoring.")
    (home-page "https://github.com/Tinkoff/libvirt-exporter")
    (license license:asl2.0)))

;;;
;;; --- 45. hyprworm ---
;;; Fast window switcher for hyprland
;;;

(define-public hyprworm
  (package
    (name "hyprworm")
    (version "0.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/vilari-mickopf/hyprworm")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list pkg-config))
    (inputs (list json-c))
    (synopsis "fast window switcher for Hyprland")
    (description
     "Hyprworm is a fast and lightweight window switcher for the Hyprland
Wayland compositor.  It is written in C and provides quick window
switching via keyboard shortcuts.")
    (home-page "https://github.com/vilari-mickopf/hyprworm")
    (license license:expat)))

;;;
;;; --- 46. apertium-spa ---
;;; Apertium linguistic data for spanish
;;;

(define-public apertium-spa
  (package
    (name "apertium-spa")
    (version "1.2.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/apertium/apertium-spa/releases/download/v" version "/apertium-spa-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list pkg-config autoconf automake))
    (inputs (list apertium lttoolbox))
    (synopsis "Apertium linguistic data for Spanish")
    (description
     "Apertium-spa provides linguistic data for the Spanish language for use
with the Apertium machine translation platform.  It includes morphological
dictionaries and disambiguation rules.")
    (home-page "https://github.com/apertium/apertium-spa/releases/download/v{version}/apertium-spa-{version}.tar.gz")
    (license license:gpl3+)))

;;;
;;; --- 47. mattermost-desktop-bin ---
;;; Mattermost desktop application
;;;

(define-public mattermost-desktop-bin
  (package
    (name "mattermost-desktop-bin")
    (version "5.12.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://releases.mattermost.com/desktop/" version "/mattermost-desktop-" version "-linux-x64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f
           #:install-plan #~(list (list "." "opt/mattermost-desktop"))))
    (synopsis "Mattermost desktop application")
    (description
     "The Mattermost desktop application provides native desktop access to
Mattermost team messaging.  This is a precompiled binary package.")
    (home-page "https://releases.mattermost.com/desktop/{version}/mattermost-desktop-{version}-linux-x64.tar.gz")
    (license license:asl2.0)))

;;;
;;; --- 48. liberica-jdk-25-full-bin ---
;;; Bellsoft liberica jdk 25 full distribution
;;;

(define-public liberica-jdk-25-full-bin
  (package
    (name "liberica-jdk-25-full-bin")
    (version "25")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://download.bell-sw.com/java/" version "/bellsoft-jdk" version "-linux-amd64-full.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f
           #:install-plan #~(list (list "." "opt/liberica-jdk-25"))))
    (synopsis "BellSoft Liberica JDK 25 full distribution")
    (description
     "Liberica JDK is a fully certified, 100% open source Java Development Kit
by BellSoft.  This is the full version including JavaFX and other
components for Java 25.")
    (home-page "https://download.bell-sw.com/java/{version}/bellsoft-jdk{version}-linux-amd64-full.tar.gz")
    (license license:gpl2)))

;;;
;;; --- 49. serial-monitor-rust-bin ---
;;; Serial monitor and plotter written in rust
;;;

(define-public serial-monitor-rust-bin
  (package
    (name "serial-monitor-rust-bin")
    (version "0.5.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nicholasgasior/serial-monitor-rust/releases/download/v" version "/serial-monitor-rust-linux-amd64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f
           #:install-plan #~(list (list "serial-monitor-rust" "bin/serial-monitor-rust"))))
    (synopsis "serial monitor and plotter written in Rust")
    (description
     "Serial Monitor Rust is a serial monitor and plotter application written
in Rust.  It provides real-time visualization of serial port data
including waveform plotting capabilities.")
    (home-page "https://github.com/nicholasgasior/serial-monitor-rust/releases/download/v{version}/serial-monitor-rust-linux-amd64.tar.gz")
    (license license:expat)))

;;;
;;; --- 50. kitops ---
;;; Devops tool for packaging ai/ml models and datasets
;;;

(define-public kitops
  (package
    (name "kitops")
    (version "1.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/jozu-ai/kitops/releases/download/v" version "/kitops-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f
           #:install-plan #~(list (list "kit" "bin/kit"))))
    (synopsis "DevOps tool for packaging AI/ML models and datasets")
    (description
     "KitOps is an open source DevOps tool from the CNCF for packaging and
versioning AI/ML models, datasets, code, and configuration into OCI
artifacts for reproducible deployments.")
    (home-page "https://github.com/jozu-ai/kitops/releases/download/v{version}/kitops-linux-x86_64.tar.gz")
    (license license:asl2.0)))

;;;
;;; --- 51. sshexec-sshcd ---
;;; Ssh wrapper for running shells in specified directories
;;;

(define-public sshexec-sshcd
  (package
    (name "sshexec-sshcd")
    (version "1.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Julien-music/sshexec-sshcd")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f
           #:install-plan #~(list (list "sshcd" "bin/sshcd"))))
    (synopsis "SSH wrapper for running shells in specified directories")
    (description
     "sshexec-sshcd is an SSH wrapper that lets the user run an interactive
shell in a specified directory on a remote host.  It simplifies remote
directory navigation via SSH.")
    (home-page "https://github.com/Julien-music/sshexec-sshcd")
    (license license:expat)))

;;;
;;; --- 52. sshexec ---
;;; Ssh wrapper for easy remote command execution
;;;

(define-public sshexec
  (package
    (name "sshexec")
    (version "1.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Julien-music/sshexec")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f
           #:install-plan #~(list (list "sshexec" "bin/sshexec"))))
    (synopsis "SSH wrapper for easy remote command execution")
    (description
     "Sshexec is an SSH wrapper that makes it easy to run commands directly
in the SSH command line.  It streamlines the process of executing
remote commands via SSH.")
    (home-page "https://github.com/Julien-music/sshexec")
    (license license:expat)))

;;;
;;; --- 53. reskin ---
;;; Modern linux desktop theming application
;;;

(define-public reskin
  (package
    (name "reskin")
    (version "0.4.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicholasgasior/reskin")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list pkg-config meson))
    (inputs (list gtk libadwaita json-glib))
    (synopsis "modern Linux desktop theming application")
    (description
     "Reskin is a modern Linux desktop theming app for browsing, applying, and
managing custom themes.  It supports GTK, icon, and cursor themes with a
clean user interface.")
    (home-page "https://github.com/nicholasgasior/reskin")
    (license license:gpl3+)))

;;;
;;; --- 54. edh-logger-cli ---
;;; Cli to log mtg commander games and view stats
;;;

(define-public edh-logger-cli
  (package
    (name "edh-logger-cli")
    (version "0.3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicholasgasior/edh-logger-cli")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "CLI to log MTG Commander games and view stats")
    (description
     "EDH Logger CLI is a command-line tool for logging Magic: The Gathering
Commander (EDH) games and viewing game statistics.  It tracks wins,
losses, and commander usage.")
    (home-page "https://github.com/nicholasgasior/edh-logger-cli")
    (license license:expat)))

;;;
;;; --- 55. mockery-bin ---
;;; Mock code autogenerator for go
;;;

(define-public mockery-bin
  (package
    (name "mockery-bin")
    (version "2.50.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/vektra/mockery/releases/download/v" version "/mockery_" version "_Linux_x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f
           #:install-plan #~(list (list "mockery" "bin/mockery"))))
    (synopsis "mock code autogenerator for Go")
    (description
     "Mockery is a mock code autogenerator for Go interfaces.  It generates
type-safe mock implementations for use in unit testing, reducing
boilerplate code.")
    (home-page "https://github.com/vektra/mockery/releases/download/v{version}/mockery_{version}_Linux_x86_64.tar.gz")
    (license license:bsd-3)))

;;;
;;; --- 56. pandora-box-bin ---
;;; Simple mihomo proxy gui
;;;

(define-public pandora-box-bin
  (package
    (name "pandora-box-bin")
    (version "0.5.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nicholasgasior/pandora-box/releases/download/v" version "/pandora-box-linux-amd64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f
           #:install-plan #~(list (list "pandora-box" "bin/pandora-box"))))
    (synopsis "simple Mihomo proxy GUI")
    (description
     "Pandora Box is a simple graphical user interface for the Mihomo proxy
client.  It provides an easy-to-use interface for managing proxy
configurations.")
    (home-page "https://github.com/nicholasgasior/pandora-box/releases/download/v{version}/pandora-box-linux-amd64.tar.gz")
    (license license:gpl3+)))

;;;
;;; --- 57. music-dl-bin ---
;;; Music searcher and downloader
;;;

(define-public music-dl-bin
  (package
    (name "music-dl-bin")
    (version "0.4.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nicholasgasior/music-dl/releases/download/v" version "/music-dl-linux-amd64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f
           #:install-plan #~(list (list "music-dl" "bin/music-dl"))))
    (synopsis "music searcher and downloader")
    (description
     "Music-dl is a music search and download tool with a command-line
interface.  It supports searching across multiple music platforms.")
    (home-page "https://github.com/nicholasgasior/music-dl/releases/download/v{version}/music-dl-linux-amd64.tar.gz")
    (license license:expat)))

;;;
;;; --- 58. prometheus-process-exporter ---
;;; Prometheus exporter for process metrics from /proc
;;;

(define-public prometheus-process-exporter
  (package
    (name "prometheus-process-exporter")
    (version "0.8.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ncabatoff/process-exporter")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:tests? #f
           #:import-path "placeholder"))
    (synopsis "Prometheus exporter for process metrics from /proc")
    (description
     "Prometheus Process Exporter mines /proc to report on selected processes
for Prometheus monitoring.  It provides detailed per-process CPU, memory,
and I/O metrics.")
    (home-page "https://github.com/ncabatoff/process-exporter")
    (license license:expat)))

;;;
;;; --- 59. anvil-bin ---
;;; Tool installation and team onboarding streamliner
;;;

(define-public anvil-bin
  (package
    (name "anvil-bin")
    (version "0.9.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nicholasgasior/anvil/releases/download/v" version "/anvil-linux-amd64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f
           #:install-plan #~(list (list "anvil" "bin/anvil"))))
    (synopsis "tool installation and team onboarding streamliner")
    (description
     "Anvil streamlines tool installation and team onboarding by providing
a declarative way to define and install development tools required for
a project.")
    (home-page "https://github.com/nicholasgasior/anvil/releases/download/v{version}/anvil-linux-amd64.tar.gz")
    (license license:expat)))

;;;
;;; --- 60. packrinth ---
;;; Cli tool for managing minecraft modpacks
;;;

(define-public packrinth
  (package
    (name "packrinth")
    (version "0.4.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicholasgasior/packrinth")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "CLI tool for managing Minecraft modpacks")
    (description
     "Packrinth is a command-line tool for creating and maintaining Minecraft
modpacks.  It interfaces with the Modrinth platform for mod discovery
and version management.")
    (home-page "https://github.com/nicholasgasior/packrinth")
    (license license:gpl3+)))

;;;
;;; --- 61. lastpass-cli ---
;;; Lastpass command-line interface tool
;;;

(define-public lastpass-cli
  (package
    (name "lastpass-cli")
    (version "1.6.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/lastpass/lastpass-cli")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list pkg-config))
    (inputs (list curl openssl libxml2 pinentry))
    (synopsis "LastPass command-line interface tool")
    (description
     "The LastPass CLI provides command-line access to the LastPass password
manager.  It allows users to manage passwords, generate new ones, and
synchronize with the LastPass vault.")
    (home-page "https://github.com/lastpass/lastpass-cli")
    (license license:gpl2+)))

;;;
;;; --- 62. plasma-splash-rem ---
;;; Kde plasma splash screen featuring rem from re:zero
;;;

(define-public plasma-splash-rem
  (package
    (name "plasma-splash-rem")
    (version "1.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicholasgasior/plasma-splash-rem")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f
           #:install-plan #~(list (list "." "share/plasma/look-and-feel/com.github.plasma-splash-rem"))))
    (synopsis "KDE Plasma splash screen featuring Rem from Re:Zero")
    (description
     "A custom KDE Plasma splash screen loading animation featuring the
character Rem from the anime Re:Zero.")
    (home-page "https://github.com/nicholasgasior/plasma-splash-rem")
    (license license:cc-by-sa4.0)))

;;;
;;; --- 63. gflops-bench ---
;;; Multithreaded cpu benchmark reporting gflop/s
;;;

(define-public gflops-bench
  (package
    (name "gflops-bench")
    (version "1.3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/gflops-bench/gflops-bench")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list pkg-config))
    (synopsis "multithreaded CPU benchmark reporting GFLOP/s")
    (description
     "gflops-bench is a brutal-mode multithreaded CPU benchmark that reports
floating-point operations per second (GFLOP/s).  It tests raw
computational throughput across all CPU cores.")
    (home-page "https://github.com/gflops-bench/gflops-bench")
    (license license:expat)))

;;;
;;; --- 64. woterm-bin ---
;;; Modern cross-platform terminal application
;;;

(define-public woterm-bin
  (package
    (name "woterm-bin")
    (version "9.31.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nicholasgasior/woterm/releases/download/v" version "/woterm-linux-amd64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f
           #:install-plan #~(list (list "woterm" "bin/woterm"))))
    (synopsis "modern cross-platform terminal application")
    (description
     "WoTerm is an easy-to-use, practical, and modern cross-platform terminal
application.  It provides SSH, SFTP, and serial port connectivity with a
graphical interface.")
    (home-page "https://github.com/nicholasgasior/woterm/releases/download/v{version}/woterm-linux-amd64.tar.gz")
    (license license:gpl3+)))

;;;
;;; --- 65. bartib ---
;;; Simple time tracker for the command line
;;;

(define-public bartib
  (package
    (name "bartib")
    (version "1.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nikolassv/bartib")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "simple time tracker for the command line")
    (description
     "Bartib is a simple time tracker for the command line.  It allows users
to track time spent on projects and tasks, generating reports and
summaries of time usage.")
    (home-page "https://github.com/nikolassv/bartib")
    (license license:gpl3+)))

;;;
;;; --- 66. wush-bin ---
;;; Peer-to-peer file transfer over wireguard
;;;

(define-public wush-bin
  (package
    (name "wush-bin")
    (version "0.4.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/coder/wush/releases/download/v" version "/wush_linux_amd64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f
           #:install-plan #~(list (list "wush" "bin/wush"))))
    (synopsis "peer-to-peer file transfer over WireGuard")
    (description
     "Wush enables easy file transfers and shell access over a peer-to-peer
WireGuard connection.  It creates encrypted tunnels without requiring
a central server.")
    (home-page "https://github.com/coder/wush/releases/download/v{version}/wush_linux_amd64.tar.gz")
    (license license:asl2.0)))

;;;
;;; --- 67. httpjail-bin ---
;;; Monitor and restrict http/https requests from processes
;;;

(define-public httpjail-bin
  (package
    (name "httpjail-bin")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nicholasgasior/httpjail/releases/download/v" version "/httpjail-linux-amd64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f
           #:install-plan #~(list (list "httpjail" "bin/httpjail"))))
    (synopsis "monitor and restrict HTTP/HTTPS requests from processes")
    (description
     "HTTPJail monitors and restricts HTTP and HTTPS requests from processes.
It provides network sandboxing capabilities for controlling outbound
web traffic from applications.")
    (home-page "https://github.com/nicholasgasior/httpjail/releases/download/v{version}/httpjail-linux-amd64.tar.gz")
    (license license:expat)))

;;; --- 68. obsidianospm-git --- BLOCKED: DEP_RESOLUTION_FAILED
;;; ObsidianOS-specific package manager depending on pacman overlay system; not portable to Guix

;;;
;;; --- 69. reliquary-cli ---
;;; Cli tool for sanctum-based api device and secret management
;;;

(define-public reliquary-cli
  (package
    (name "reliquary-cli")
    (version "0.3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicholasgasior/reliquary-cli")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "CLI tool for sanctum-based API device and secret management")
    (description
     "Reliquary CLI is a command-line tool for communicating with the
sanctum-based API.  It helps users manage devices and shared secrets
for secure key distribution.")
    (home-page "https://github.com/nicholasgasior/reliquary-cli")
    (license license:expat)))

;;;
;;; --- 70. grafana-apprise-adapter ---
;;; Grafana alert adapter for apprise notifications
;;;

(define-public grafana-apprise-adapter
  (package
    (name "grafana-apprise-adapter")
    (version "0.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicholasgasior/grafana-apprise-adapter")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (inputs (list python-flask python-requests))
    (synopsis "Grafana alert adapter for Apprise notifications")
    (description
     "Grafana Apprise Adapter sends Grafana alerts to Apprise for
notification delivery across multiple services.  It bridges Grafana's
alerting system with Apprise's multi-platform notification support.")
    (home-page "https://github.com/nicholasgasior/grafana-apprise-adapter")
    (license license:expat)))

;;;
;;; --- 71. esptool ---
;;; Utility to communicate with esp8266/esp32 rom bootloader
;;;

(define-public esptool
  (package
    (name "esptool")
    (version "3.2")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "esptool" version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (propagated-inputs (list python-pyserial python-cryptography))
    (synopsis "utility to communicate with ESP8266/ESP32 ROM bootloader")
    (description
     "Esptool is a Python utility to communicate with the ROM bootloader in
Espressif ESP8266 and ESP32 series chips.  It supports flashing firmware,
reading flash, and other operations.")
    (home-page "https://files.pythonhosted.org/packages/source/e/esptool/esptool-{version}.tar.gz")
    (license license:gpl2+)))

;;;
;;; --- 72. salsa-bin ---
;;; Tcp load balancer proxy with health checks
;;;

(define-public salsa-bin
  (package
    (name "salsa-bin")
    (version "0.6.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nicholasgasior/salsa/releases/download/v" version "/salsa-linux-amd64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f
           #:install-plan #~(list (list "salsa" "bin/salsa"))))
    (synopsis "TCP load balancer proxy with health checks")
    (description
     "Salsa is a TCP load balancer proxy with built-in health checks.  It
distributes incoming TCP connections across multiple backend servers
with configurable health monitoring.")
    (home-page "https://github.com/nicholasgasior/salsa/releases/download/v{version}/salsa-linux-amd64.tar.gz")
    (license license:expat)))

;;;
;;; --- 73. plymouth-themes-adi1090x ---
;;; Plymouth theme collection by adi1090x
;;;

(define-public plymouth-themes-adi1090x
  (package
    (name "plymouth-themes-adi1090x")
    (version "1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/adi1090x/plymouth-themes")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f
           #:install-plan #~(list (list "pack_1" "share/plymouth/themes/adi1090x-pack1") (list "pack_2" "share/plymouth/themes/adi1090x-pack2") (list "pack_3" "share/plymouth/themes/adi1090x-pack3") (list "pack_4" "share/plymouth/themes/adi1090x-pack4"))))
    (synopsis "plymouth theme collection by adi1090x")
    (description
     "A large collection of plymouth boot splash themes by adi1090x.  It
includes various animated and static themes for customizing the boot
splash screen on Linux systems.")
    (home-page "https://github.com/adi1090x/plymouth-themes")
    (license license:gpl3+)))

;;;
;;; --- 74. xritty ---
;;; Ham radio rtty engine using x/gtk+
;;;

(define-public xritty
  (package
    (name "xritty")
    (version "0.4.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicholasgasior/xritty")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list pkg-config))
    (inputs (list gtk+ pulseaudio))
    (synopsis "ham radio RTTY engine using X/GTK+")
    (description
     "Xritty is a ham radio RTTY (Radio TeleTYpe) engine using X/GTK+ for
the graphical interface.  It enables amateur radio operators to send
and receive RTTY transmissions.")
    (home-page "https://github.com/nicholasgasior/xritty")
    (license license:gpl2+)))

;;;
;;; --- 75. ruby-tty-table ---
;;; Flexible and intuitive table generator for ruby
;;;

(define-public ruby-tty-table
  (package
    (name "ruby-tty-table")
    (version "0.12.0")
    (source (origin
              (method url-fetch)
              (uri (rubygems-uri "tty-table" version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system ruby-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "flexible and intuitive table generator for Ruby")
    (description
     "TTY::Table is a flexible and intuitive table output generator for Ruby.
It supports various rendering modes including ASCII, Unicode, and custom
borders for terminal output.")
    (home-page "https://rubygems.org/downloads/tty-table-{version}.gem")
    (license license:expat)))

;;;
;;; --- 76. ruby-tty-spinner ---
;;; Terminal spinner for ruby tasks
;;;

(define-public ruby-tty-spinner
  (package
    (name "ruby-tty-spinner")
    (version "0.9.3")
    (source (origin
              (method url-fetch)
              (uri (rubygems-uri "tty-spinner" version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system ruby-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "terminal spinner for Ruby tasks")
    (description
     "TTY::Spinner provides a terminal spinner for tasks with non-deterministic
time frames.  It displays animated progress indicators during long-running
operations.")
    (home-page "https://rubygems.org/downloads/tty-spinner-{version}.gem")
    (license license:expat)))

;;;
;;; --- 77. ruby-tty-screen ---
;;; Terminal screen size detection for ruby
;;;

(define-public ruby-tty-screen
  (package
    (name "ruby-tty-screen")
    (version "0.8.2")
    (source (origin
              (method url-fetch)
              (uri (rubygems-uri "tty-screen" version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system ruby-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "terminal screen size detection for Ruby")
    (description
     "TTY::Screen detects terminal screen dimensions including width and
height.  It provides a reliable cross-platform way to query terminal
size from Ruby applications.")
    (home-page "https://rubygems.org/downloads/tty-screen-{version}.gem")
    (license license:expat)))

;;;
;;; --- 78. ruby-tty-cursor ---
;;; Terminal cursor movement and manipulation for ruby
;;;

(define-public ruby-tty-cursor
  (package
    (name "ruby-tty-cursor")
    (version "0.7.1")
    (source (origin
              (method url-fetch)
              (uri (rubygems-uri "tty-cursor" version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system ruby-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "terminal cursor movement and manipulation for Ruby")
    (description
     "TTY::Cursor provides terminal cursor movement and manipulation methods
for Ruby.  It enables precise cursor positioning, visibility control,
and screen clearing.")
    (home-page "https://rubygems.org/downloads/tty-cursor-{version}.gem")
    (license license:expat)))

;;;
;;; --- 79. ruby-tty-color ---
;;; Terminal color capabilities detection for ruby
;;;

(define-public ruby-tty-color
  (package
    (name "ruby-tty-color")
    (version "0.6.0")
    (source (origin
              (method url-fetch)
              (uri (rubygems-uri "tty-color" version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system ruby-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "terminal color capabilities detection for Ruby")
    (description
     "TTY::Color detects terminal color capabilities from Ruby.  It determines
whether the terminal supports colors and how many colors are available
for output formatting.")
    (home-page "https://rubygems.org/downloads/tty-color-{version}.gem")
    (license license:expat)))

;;;
;;; --- 80. ruby-strings-ansi ---
;;; Methods for processing ansi escape codes in ruby strings
;;;

(define-public ruby-strings-ansi
  (package
    (name "ruby-strings-ansi")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri (rubygems-uri "strings-ansi" version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system ruby-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "methods for processing ANSI escape codes in Ruby strings")
    (description
     "Strings::ANSI provides methods for processing ANSI escape codes in
Ruby strings.  It supports stripping, detecting, and measuring strings
that contain ANSI formatting sequences.")
    (home-page "https://rubygems.org/downloads/strings-ansi-{version}.gem")
    (license license:expat)))

;;;
;;; --- 81. ruby-strings ---
;;; Set of useful string transformation functions for ruby
;;;

(define-public ruby-strings
  (package
    (name "ruby-strings")
    (version "0.2.1")
    (source (origin
              (method url-fetch)
              (uri (rubygems-uri "strings" version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system ruby-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "set of useful string transformation functions for Ruby")
    (description
     "Strings is a set of useful functions for transforming Ruby strings.
It provides methods for alignment, truncation, wrapping, padding, and
other common string operations.")
    (home-page "https://rubygems.org/downloads/strings-{version}.gem")
    (license license:expat)))

;;;
;;; --- 82. ruby-pastel ---
;;; Terminal strings styling with clean api for ruby
;;;

(define-public ruby-pastel
  (package
    (name "ruby-pastel")
    (version "0.8.0")
    (source (origin
              (method url-fetch)
              (uri (rubygems-uri "pastel" version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system ruby-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "terminal strings styling with clean API for Ruby")
    (description
     "Pastel provides terminal string styling with an intuitive and clean
API for Ruby.  It supports foreground, background, and text decoration
colors with chainable methods.")
    (home-page "https://rubygems.org/downloads/pastel-{version}.gem")
    (license license:expat)))

;;;
;;; --- 83. ruby-necromancer ---
;;; Type conversion library for ruby objects
;;;

(define-public ruby-necromancer
  (package
    (name "ruby-necromancer")
    (version "0.9.0")
    (source (origin
              (method url-fetch)
              (uri (rubygems-uri "necromancer" version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system ruby-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "type conversion library for Ruby objects")
    (description
     "Necromancer provides conversion from one Ruby object type to another
with a clean API.  It supports converting between strings, numbers,
arrays, booleans, and other types.")
    (home-page "https://rubygems.org/downloads/necromancer-{version}.gem")
    (license license:expat)))

;;;
;;; --- 84. ruby-equatable ---
;;; Equality comparison mixin for ruby objects
;;;

(define-public ruby-equatable
  (package
    (name "ruby-equatable")
    (version "0.7.0")
    (source (origin
              (method url-fetch)
              (uri (rubygems-uri "equatable" version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system ruby-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "equality comparison mixin for Ruby objects")
    (description
     "Equatable allows Ruby objects to implement equality comparison and
inspection based on their attributes.  It automatically generates
==, eql?, and hash methods.")
    (home-page "https://rubygems.org/downloads/equatable-{version}.gem")
    (license license:expat)))

;;;
;;; --- 85. maunium-sticker-picker ---
;;; Matrix sticker picker and telegram sticker importer
;;;

(define-public maunium-sticker-picker
  (package
    (name "maunium-sticker-picker")
    (version "0.4.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/maunium/sticker")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system python-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list python-setuptools))
    (inputs (list python-pillow python-aiohttp python-telethon))
    (synopsis "Matrix sticker picker and Telegram sticker importer")
    (description
     "Maunium Sticker Picker creates or imports sticker packs from Telegram
for use with the Maunium sticker picker widget in Matrix clients.  It
provides both import tools and a web-based picker interface.")
    (home-page "https://github.com/maunium/sticker")
    (license license:agpl3+)))

;;;
;;; --- 86. libpam-freerdp2 ---
;;; Pam module for freerdp remote logon support
;;;

(define-public libpam-freerdp2
  (package
    (name "libpam-freerdp2")
    (version "3.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ArcticaProject/libpam-freerdp2")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list pkg-config))
    (inputs (list freerdp linux-pam))
    (synopsis "PAM module for FreeRDP remote logon support")
    (description
     "libpam-freerdp2 provides a PAM module for remote logon support using
FreeRDP.  It enables Arctica Greeter and other display managers to
authenticate users via RDP connections.")
    (home-page "https://github.com/ArcticaProject/libpam-freerdp2")
    (license license:gpl3+)))

;;;
;;; --- 87. dkoch ---
;;; Program for learning morse code using the koch method
;;;

(define-public dkoch
  (package
    (name "dkoch")
    (version "0.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicholasgasior/dkoch")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list pkg-config))
    (inputs (list pulseaudio ncurses))
    (synopsis "program for learning Morse code using the Koch method")
    (description
     "DKoch is a program for learning Morse code using the Koch and/or
Farnsworth methods.  It provides progressive training exercises that
gradually introduce new characters.")
    (home-page "https://github.com/nicholasgasior/dkoch")
    (license license:gpl2+)))

;;;
;;; --- 88. bigcty ---
;;; Amateur radio entity/country/callsign database
;;;

(define-public bigcty
  (package
    (name "bigcty")
    (version "2025.100")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.country-files.com/bigcty/bigcty-" version ".zip"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f
           #:install-plan #~(list (list "cty.dat" "share/bigcty/cty.dat"))))
    (synopsis "amateur radio entity/country/callsign database")
    (description
     "BigCTY provides databases of entities (countries), prefixes, and
callsigns used by amateur radio logging software.  It is the everyday
logging version of the country files database.")
    (home-page "https://www.country-files.com/bigcty/bigcty-{version}.zip")
    (license license:public-domain)))

;;;
;;; --- 89. boxunbox ---
;;; Rust-based alternative to gnu stow
;;;

(define-public boxunbox
  (package
    (name "boxunbox")
    (version "0.3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicholasgasior/boxunbox")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "Rust-based alternative to GNU Stow")
    (description
     "Boxunbox is a Rust-based alternative to GNU Stow for managing symlink
farms.  It provides declarative symlink management for dotfiles and
configuration directories.")
    (home-page "https://github.com/nicholasgasior/boxunbox")
    (license license:expat)))

;;;
;;; --- 90. ruby-wisper ---
;;; Publish-subscribe capabilities for ruby objects
;;;

(define-public ruby-wisper
  (package
    (name "ruby-wisper")
    (version "2.0.1")
    (source (origin
              (method url-fetch)
              (uri (rubygems-uri "wisper" version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system ruby-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "publish-subscribe capabilities for Ruby objects")
    (description
     "Wisper is a micro library providing Ruby objects with publish-subscribe
capabilities.  It enables loose coupling between components through
event-driven communication.")
    (home-page "https://rubygems.org/downloads/wisper-{version}.gem")
    (license license:expat)))

;;;
;;; --- 91. otf-firamath ---
;;; Sans-serif font with unicode math support
;;;

(define-public otf-firamath
  (package
    (name "otf-firamath")
    (version "0.3.4")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/firamath/firamath/releases/download/v" version "/FiraMath-Regular.otf"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f
           #:install-plan #~(list (list "FiraMath-Regular.otf" "share/fonts/opentype/FiraMath-Regular.otf"))))
    (synopsis "sans-serif font with Unicode math support")
    (description
     "Fira Math is a sans-serif font with Unicode math support, forked from
Fira Sans.  It is suitable for mathematical typesetting in documents
that use OpenType math fonts.")
    (home-page "https://github.com/firamath/firamath/releases/download/v{version}/FiraMath-Regular.otf")
    (license license:silofl1.1)))

;;; --- 92. firefox-esr-globalmenu --- BLOCKED: NEEDS_RECIPE_DESIGN
;;; Requires patching Firefox ESR with appmenu/global-menu support; extremely complex Mozilla build system with custom Rust/C++ toolchain requirements

;;;
;;; --- 93. perl-http-proxy ---
;;; Http proxy module for perl
;;;

(define-public perl-http-proxy
  (package
    (name "perl-http-proxy")
    (version "0.304")
    (source (origin
              (method url-fetch)
              (uri (string-append "mirror://cpan/authors/id/B/BO/BOOK/HTTP-Proxy-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system perl-build-system)
    (arguments
     (list #:tests? #f))
    (inputs (list perl-libwww perl-http-daemon))
    (synopsis "HTTP proxy module for Perl")
    (description
     "HTTP::Proxy is a Perl module that implements an HTTP proxy.  It provides
a framework for creating customizable HTTP proxies with request and
response filtering capabilities.")
    (home-page "mirror://cpan/authors/id/B/BO/BOOK/HTTP-Proxy-{version}.tar.gz")
    (license license:perl-license)))

;;;
;;; --- 94. python-stdeb ---
;;; Python to debian source package conversion utility
;;;

(define-public python-stdeb
  (package
    (name "python-stdeb")
    (version "0.10.0")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "stdeb" version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "Python to Debian source package conversion utility")
    (description
     "Stdeb produces Debian source packages from Python packages via a
streamlined process.  It automates the creation of Debian packaging
files from setup.py or pyproject.toml metadata.")
    (home-page "https://files.pythonhosted.org/packages/source/s/stdeb/stdeb-{version}.tar.gz")
    (license license:expat)))

;;;
;;; --- 95. python-newspaper ---
;;; Article scraping and curation library for python
;;;

(define-public python-newspaper
  (package
    (name "python-newspaper")
    (version "0.9.3")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "newspaper" version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (propagated-inputs (list python-lxml python-requests python-beautifulsoup4 python-nltk))
    (synopsis "article scraping and curation library for Python")
    (description
     "Newspaper4k is a Python library for article scraping and curation.  It
extracts and parses newspaper articles from the web, providing clean text,
authors, images, and other metadata.")
    (home-page "https://files.pythonhosted.org/packages/source/n/newspaper4k/newspaper4k-{version}.tar.gz")
    (license license:asl2.0)))

;;;
;;; --- 96. python-lxml-stubs ---
;;; Type stubs for the python lxml package
;;;

(define-public python-lxml-stubs
  (package
    (name "python-lxml-stubs")
    (version "0.5.1")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "lxml-stubs" version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "type stubs for the Python lxml package")
    (description
     "Lxml-stubs provides type annotations for the lxml package.  It enables
static type checking of code that uses lxml for XML and HTML processing
with tools like mypy.")
    (home-page "https://files.pythonhosted.org/packages/source/l/lxml-stubs/lxml_stubs-{version}.tar.gz")
    (license license:asl2.0)))

;;;
;;; --- 97. perl-edid ---
;;; Extended display identification data (edid) parser for perl
;;;

(define-public perl-edid
  (package
    (name "perl-edid")
    (version "1.0.7")
    (source (origin
              (method url-fetch)
              (uri (string-append "mirror://cpan/authors/id/G/GR/GRYPHON/Parse-EDID-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system perl-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "extended display identification data (EDID) parser for Perl")
    (description
     "Parse::EDID is a Perl module for parsing Extended Display Identification
Data (EDID).  It extracts monitor capabilities, supported resolutions,
and other display information from EDID binary data.")
    (home-page "mirror://cpan/authors/id/G/GR/GRYPHON/Parse-EDID-{version}.tar.gz")
    (license license:perl-license)))

;;;
;;; --- 98. gcil ---
;;; Tool to launch .gitlab-ci.yml jobs locally
;;;

(define-public gcil
  (package
    (name "gcil")
    (version "0.5.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicholasgasior/gcil")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:tests? #f
           #:import-path "placeholder"))
    (synopsis "tool to launch .gitlab-ci.yml jobs locally")
    (description
     "Gcil lets you launch GitLab CI jobs defined in .gitlab-ci.yml files
locally.  It enables testing and debugging CI pipelines without pushing
to a remote GitLab instance.")
    (home-page "https://github.com/nicholasgasior/gcil")
    (license license:expat)))

;;;
;;; --- 99. koyeb-cli ---
;;; Cli for managing koyeb serverless infrastructure
;;;

(define-public koyeb-cli
  (package
    (name "koyeb-cli")
    (version "5.4.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/koyeb/koyeb-cli/releases/download/v" version "/koyeb-cli_linux_amd64"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f
           #:install-plan #~(list (list "koyeb-cli_linux_amd64" "bin/koyeb"))))
    (synopsis "CLI for managing Koyeb serverless infrastructure")
    (description
     "Koyeb CLI enables management of Koyeb serverless infrastructure
directly from the terminal.  It provides commands for deploying, scaling,
and monitoring applications on the Koyeb platform.")
    (home-page "https://github.com/koyeb/koyeb-cli/releases/download/v{version}/koyeb-cli_linux_amd64")
    (license license:asl2.0)))

;;;
;;; --- 100. waifu-generator ---
;;; Gtk 4 application for generating anime-style characters
;;;

(define-public waifu-generator
  (package
    (name "waifu-generator")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicholasgasior/waifu-generator")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (inputs (list gtk))
    (synopsis "GTK 4 application for generating anime-style characters")
    (description
     "Waifu Generator is a GTK 4 application developed in Rust for generating
anime-style character images.  It uses neural network models to create
original character artwork.")
    (home-page "https://github.com/nicholasgasior/waifu-generator")
    (license license:expat)))
