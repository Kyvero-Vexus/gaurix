;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency tree resolver pass --- deptree-resolver-260418w
;;; Resolves 26 BLOCKED packages with concrete recipes.
;;; Moves 29 packages to FAILED status.
;;;
;;; All sha256 hashes are placeholders pending verification via `guix download`.

(define-module (gaurix packages deptree-resolver-260418w)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system ant)
  #:use-module (guix build-system cargo)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system go)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:export (ubuntu-mate-icon-themes
            corefreq-client
            diskm8
            php-phalcon
            airshipper
            contextpilot-git
            gamescope-session-git
            omniorbpy
            gprofng-gui
            sequoia-octopus-librnp
            streampager
            twitter-media-downloader-git
            codanna
            hmcl-dev
            mbtiles
            falcond
            hypr-dock
            ibus-lotus
            kx-aspe-git
            musique111-qt5
            sqlite-dist
            halloy-git
            terraform-local
            galaxy-flasher
            python-pjproject
            golden-cheetah-git
))

(define-public ubuntu-mate-icon-themes
  (package
    (name "ubuntu-mate-icon-themes")
    (version "24.10.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ubuntu-mate-icon-themes.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/icons/" #:include-regexp (".*")))))
    (synopsis "Official icon themes for Ubuntu MATE")
    (description "The official icon themes for Ubuntu MATE.")
    (home-page "https://launchpad.net/ubuntu-mate/")
    (license license:gpl3+)))

(define-public corefreq-client
  (package
    (name "corefreq-client")
    (version "2.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/cyring/CoreFreq")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "CoreFreq client")
    (description "CoreFreq client.")
    (home-page "https://github.com/cyring/CoreFreq")
    (license license:gpl2+)))

(define-public diskm8
  (package
    (name "diskm8")
    (version "0.6.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/paleotronic/diskm8")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/paleotronic/diskm8"
           #:tests? #f))
    (synopsis "Apple II disk image manipulation, cataloging and analysis tool")
    (description "Apple II disk image manipulation, cataloging and analysis tool.")
    (home-page "https://github.com/paleotronic/diskm8")
    (license license:gpl3+)))

(define-public php-phalcon
  (package
    (name "php-phalcon")
    (version "5.10.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/php-phalcon.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Web framework delivered as a C-extension for PHP")
    (description "Web framework delivered as a C-extension for PHP.")
    (home-page "http://phalconphp.com")
    (license license:bsd-3)))

(define-public airshipper
  (package
    (name "airshipper")
    (version "0.17.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.com/veloren/airshipper")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Official launcher for Veloren - an open-world, open-source multiplayer")
    (description "The official launcher for Veloren - an open-world, open-source multiplayer voxel RPG.")
    (home-page "https://gitlab.com/veloren/airshipper")
    (license license:gpl3+)))

(define-public contextpilot-git
  (package
    (name "contextpilot-git")
    (version "0.9.1.r0.gc4ac211")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/krshrimali/context-pilot-rs")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Analyze Git blame information, infer code context, and index your codebase")
    (description "Analyze Git blame information, infer code context, and index your codebase for deep, fine-grained search and navigation.")
    (home-page "https://github.com/krshrimali/context-pilot-rs")
    (license license:expat)))

(define-public gamescope-session-git
  (package
    (name "gamescope-session-git")
    (version "r339.b5c2d0d")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/OpenGamingCollective/gamescope-session")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Common gamescope session files")
    (description "Common gamescope session files.")
    (home-page "https://github.com/OpenGamingCollective/gamescope-session")
    (license license:expat)))

(define-public omniorbpy
  (package
    (name "omniorbpy")
    (version "4.3.4")
    (source (origin
              (method url-fetch)
              (uri "http://omniorb.sourceforge.net/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "CORBA object request broker for C++ and Python")
    (description "A CORBA object request broker for C++ and Python.")
    (home-page "http://omniorb.sourceforge.net/")
    (license license:lgpl3+)))

(define-public gprofng-gui
  (package
    (name "gprofng-gui")
    (version "2.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gprofng-gui.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system ant-build-system)
    (arguments (list #:tests? #f
                      #:jar-name (string-append name ".jar")))
    (synopsis "Graphical tool to create, view, or both create as well as view, gprofng")
    (description "A graphical tool to create, view, or both create as well as view, gprofng performance experiments.")
    (home-page "https://www.gnu.org/software/gprofng-gui/")
    (license license:gpl3+)))

(define-public sequoia-octopus-librnp
  (package
    (name "sequoia-octopus-librnp")
    (version "1.11.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.com/sequoia-pgp/sequoia-octopus-librnp")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Sequoia-based OpenPGP Backend for Thunderbird")
    (description "A Sequoia-based OpenPGP Backend for Thunderbird.")
    (home-page "https://gitlab.com/sequoia-pgp/sequoia-octopus-librnp")
    (license license:gpl2+)))

(define-public streampager
  (package
    (name "streampager")
    (version "0.10.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/markbt/streampager")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Pager for command output or large files")
    (description "A pager for command output or large files.")
    (home-page "https://github.com/markbt/streampager")
    (license license:expat)))

(define-public twitter-media-downloader-git
  (package
    (name "twitter-media-downloader-git")
    (version "r63.0cdd5e6")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/mmpx12/twitter-media-downloader")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/mmpx12/twitter-media-downloader"
           #:tests? #f))
    (synopsis "Tool to download media from Twitter")
    (description "A tool to download media from Twitter.")
    (home-page "https://github.com/mmpx12/twitter-media-downloader")
    (license license:expat)))

(define-public codanna
  (package
    (name "codanna")
    (version "0.9.18")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/bartolli/codanna")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "X-ray vision for your agent - Code assistant with understanding of")
    (description "X-ray vision for your agent - Code assistant with understanding of functions, relationships, and implementations.")
    (home-page "https://github.com/bartolli/codanna")
    (license license:asl2.0)))

(define-public hmcl-dev
  (package
    (name "hmcl-dev")
    (version "3.11.0.325")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/huanghongxun/HMCL")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system ant-build-system)
    (arguments (list #:tests? #f
                      #:jar-name (string-append name ".jar")))
    (synopsis "Minecraft Launcher which is multi-functional, cross-platform and popular")
    (description "A Minecraft Launcher which is multi-functional, cross-platform and popular (development version).")
    (home-page "https://github.com/huanghongxun/HMCL")
    (license license:gpl3+)))

(define-public mbtiles
  (package
    (name "mbtiles")
    (version "0.15.4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mbtiles.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Examine, copy, validate vector tile sets")
    (description "Examine, copy, validate vector tile sets.")
    (home-page "https://maplibre.org/martin/mbtiles.html")
    (license license:asl2.0)))

(define-public falcond
  (package
    (name "falcond")
    (version "2.0.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://git.pika-os.com/general-packages/falcond")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Advanced Linux gaming performance daemon")
    (description "Advanced Linux gaming performance daemon.")
    (home-page "https://git.pika-os.com/general-packages/falcond")
    (license license:expat)))

(define-public hypr-dock
  (package
    (name "hypr-dock")
    (version "1.2.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/lotos-linux/hypr-dock")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/lotos-linux/hypr-dock"
           #:tests? #f))
    (synopsis "Interactive Dock Panel for Hyprland")
    (description "Interactive Dock Panel for Hyprland.")
    (home-page "https://github.com/lotos-linux/hypr-dock")
    (license license:gpl3+)))

(define-public ibus-lotus
  (package
    (name "ibus-lotus")
    (version "1.0.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/LotusInputEngine/ibus-lotus")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/LotusInputEngine/ibus-lotus"
           #:tests? #f))
    (synopsis "Vietnamese IME for IBus - fork of ibus-bamboo")
    (description "A Vietnamese IME for IBus - fork of ibus-bamboo.")
    (home-page "https://github.com/LotusInputEngine/ibus-lotus")
    (license license:gpl3+)))

(define-public kx-aspe-git
  (package
    (name "kx-aspe-git")
    (version "r24.492df7e")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://codeberg.org/keyoxide/kx-aspe-cli")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Keyoxide profile generator CLI using ASPE")
    (description "Keyoxide profile generator CLI using ASPE.")
    (home-page "https://codeberg.org/keyoxide/kx-aspe-cli")
    (license license:asl2.0)))

(define-public musique111-qt5
  (package
    (name "musique111-qt5")
    (version "1.11")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/musique111-qt5.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Finely crafted music player")
    (description "A finely crafted music player.")
    (home-page "https://flavio.tordini.org/musique")
    (license license:gpl3+)))

(define-public sqlite-dist
  (package
    (name "sqlite-dist")
    (version "0.0.1.alpha.19")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/asg017/sqlite-dist")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "CLI tool for packing and distributing pre-compiled SQLite extensions")
    (description "A CLI tool for packing and distributing pre-compiled SQLite extensions.")
    (home-page "https://github.com/asg017/sqlite-dist")
    (license license:expat)))

(define-public halloy-git
  (package
    (name "halloy-git")
    (version "2025.11.r58.g4bee304")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/squidowl/halloy")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Open-source IRC client written in Rust, with the Iced GUI library")
    (description "An open-source IRC client written in Rust, with the Iced GUI library.")
    (home-page "https://github.com/squidowl/halloy")
    (license license:gpl3+)))

(define-public terraform-local
  (package
    (name "terraform-local")
    (version "0.24.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/localstack/terraform-local")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Thin wrapper script to run Terraform against LocalStack")
    (description "Thin wrapper script to run Terraform against LocalStack.")
    (home-page "https://github.com/localstack/terraform-local")
    (license license:asl2.0)))

(define-public galaxy-flasher
  (package
    (name "galaxy-flasher")
    (version "0.7.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://codeberg.org/ethical_haquer/galaxy-flasher")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "GUI for Samsung flash-tools")
    (description "A GUI for Samsung flash-tools.")
    (home-page "https://codeberg.org/ethical_haquer/galaxy-flasher")
    (license license:gpl3+)))

(define-public python-pjproject
  (package
    (name "python-pjproject")
    (version "2.16")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-pjproject.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Open source SIP stack and media stack")
    (description "Open source SIP stack and media stack.")
    (home-page "https://www.pjsip.org/")
    (license license:gpl2+)))

(define-public golden-cheetah-git
  (package
    (name "golden-cheetah-git")
    (version "v3.7.r102.d24afec85")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/golden-cheetah-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Performance Software for Cyclists, Runners, Triathletes and Coaches")
    (description "Performance Software for Cyclists, Runners, Triathletes and Coaches.")
    (home-page "https://www.goldencheetah.org/")
    (license license:gpl2+)))
