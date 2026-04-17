;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260417ag
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages.
;;;
;;; Recipes (27):
;;;    1. tlrc-bin (copy/tarball, v1.13.0, MIT)
;;;    2. oxker-bin (copy/tarball, v0.13.1, MIT)
;;;    3. gh-skyline-bin (copy/binary, v0.1.8, MIT)
;;;    4. gitopolis-bin (copy/tarball, v1.17.0, AGPL-3.0)
;;;    5. tsui-bin (copy/binary, v0.2.0, MIT)
;;;    6. runst-bin (copy/tarball, v0.1.4, MIT)
;;;    7. opencode-bin (copy/tarball, v1.4.8, MIT)
;;;    8. agesafetch-bin (copy/binary, v2.0.2, MIT)
;;;    9. play-timer-bin (copy/binary, v2.2.2, MIT)
;;;   10. pterodactyl-wings-bin (copy/binary, v1.12.1, MIT)
;;;   11. pass-secret-service-bin (copy/binary, v0.7.0, GPL-3.0+)
;;;   12. todoist-bin (copy/tarball, v0.23.0, MIT)
;;;   13. icloudpd-bin (copy/binary, v1.32.2, MIT)
;;;   14. spicetify-cli-bin (copy/tarball, v2.43.1, LGPL-2.1)
;;;   15. cleanuparr-bin (copy/zip, v2.9.8, GPL-3.0+)
;;;   16. terraform-bin (copy/zip, v1.12.1, BSL-1.1)
;;;   17. skyterm-bin (copy/zip, v0.2.1, MIT)
;;;   18. weatherfetch-bin (copy/binary, v0.0.4, MIT)
;;;   19. discord-chat-exporter-cli-bin (copy/zip, v2.47.1, MIT)
;;;   20. ventoy-bin (copy/tarball, v1.1.11, GPL-3.0+)
;;;   21. localsend-bin (copy/deb, v1.17.0, Apache-2.0)
;;;   22. dietpdf-bin (copy/deb, v1.2.0, BSD-3)
;;;   23. freetube-bin (copy/deb, v0.24.0-beta, AGPL-3.0+)
;;;   24. hoppscotch-bin (copy/deb, v26.3.1-0, MIT)
;;;   25. proton-pass-bin (copy/deb, v1.36.1, GPL-3.0+)
;;;   26. zotero-bin (copy/tarball, v9.0, AGPL-3.0+)
;;;   27. defguard-client-bin (copy/tarball, v1.6.7, Apache-2.0)
;;;
;;; Blocked (3):
;;;   28. anytype-bin — BLOCKED: APPIMAGE_COMPLEX (AppImage requires FUSE mount and runtime extraction; not trivially packageable)
;;;   29. jetbrains-toolbox — BLOCKED: PROPRIETARY_SELF_UPDATING (proprietary binary with online-only activation and self-updating model; conflicts with Guix immutable store)
;;;   30. arduino-ide-bin — BLOCKED: ELECTRON_COMPLEX (Electron app with 200+ bundled node_modules; requires extensive wrapping for sandbox/display integration)
;;;
;;; 27 recipes + 3 BLOCKED = 30 total.
;;;
;;; NOTE: All sha256 hashes obtained via `guix download`.

(define-module (gaurix packages recipe-resolver-260417ag)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages compression)
  #:export (
            tlrc-bin
            oxker-bin
            gh-skyline-bin
            gitopolis-bin
            tsui-bin
            runst-bin
            opencode-bin
            agesafetch-bin
            play-timer-bin
            pterodactyl-wings-bin
            pass-secret-service-bin
            todoist-bin
            icloudpd-bin
            spicetify-cli-bin
            cleanuparr-bin
            terraform-bin
            skyterm-bin
            weatherfetch-bin
            discord-chat-exporter-cli-bin
            ventoy-bin
            localsend-bin
            dietpdf-bin
            freetube-bin
            hoppscotch-bin
            proton-pass-bin
            zotero-bin
            defguard-client-bin
            ))

;;; Nonfree license placeholder (BSL-1.1 for Terraform).
(define license:bsl1.1
  ((@@ (guix licenses) license) "BSL-1.1"
    "https://mariadb.com/bsl11/"
    "Business Source License 1.1 (nonfree)"))

;;; ===================================================================
;;; TARBALL BINARY PACKAGES
;;; ===================================================================

;;; -------------------------------------------------------------------
;;; 1. tlrc-bin — official tldr client written in Rust
;;; -------------------------------------------------------------------
(define-public tlrc-bin
  (package
    (name "tlrc-bin")
    (version "1.13.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/tldr-pages/tlrc/releases/download/v"
                    version "/tlrc-v" version
                    "-x86_64-unknown-linux-gnu.tar.gz"))
              (sha256
               (base32
                "05hsx9d033pvhgr7dk6159r7qr4rnwibi6rn089fgagid2irq8qr"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("tlrc" "bin/tlrc"))))
    (synopsis "official tldr-pages client written in Rust")
    (description "Tlrc is a fast and featureful client for tldr-pages, the
community-maintained collection of concise command-line help pages.  It
provides offline caching, custom page directories, and configurable output
styling.")
    (home-page "https://github.com/tldr-pages/tlrc")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 2. oxker-bin — TUI to view and control Docker containers
;;; -------------------------------------------------------------------
(define-public oxker-bin
  (package
    (name "oxker-bin")
    (version "0.13.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/mrjackwills/oxker/releases/download/v"
                    version "/oxker_linux_x86_64.tar.gz"))
              (sha256
               (base32
                "122xcf2n1zxk39js2qz9vwlwpng83kr33d6qaf6apv7z01zs805l"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("oxker" "bin/oxker"))))
    (synopsis "simple TUI to view and control Docker containers")
    (description "Oxker is a terminal user interface for viewing and managing
Docker containers.  It displays container status, resource usage, logs, and
provides controls for starting, stopping, pausing, and restarting containers.")
    (home-page "https://github.com/mrjackwills/oxker")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 4. gitopolis-bin — manage multiple git repositories
;;; -------------------------------------------------------------------
(define-public gitopolis-bin
  (package
    (name "gitopolis-bin")
    (version "1.17.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/timabell/gitopolis/releases/download/v"
                    version "/gitopolis-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "02vzb595ka59crv05g89h63k5kdg69wfiw7dj2z3hy9jdrhnyb7b"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("gitopolis" "bin/gitopolis"))))
    (synopsis "manage multiple git repositories with tags and commands")
    (description "Gitopolis is a CLI tool for organizing and managing multiple
git repositories.  It supports tagging repos, running commands across
repositories, cloning from lists, and tracking repository status across
projects.")
    (home-page "https://github.com/timabell/gitopolis")
    (license license:agpl3)))

;;; -------------------------------------------------------------------
;;; 6. runst-bin — dead simple notification daemon
;;; -------------------------------------------------------------------
(define-public runst-bin
  (package
    (name "runst-bin")
    (version "0.1.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/orhun/runst/releases/download/v"
                    version "/runst-" version
                    "-x86_64-unknown-linux-gnu.tar.gz"))
              (sha256
               (base32
                "0gnqdkdgmifjdvdlc7vcai2fmynj8nwv94psi7bfm5g4jl7j60kr"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("runst" "bin/runst"))))
    (synopsis "dead simple notification daemon for X11 and Wayland")
    (description "Runst is a minimal notification daemon that displays desktop
notifications as text in a small window.  It supports both X11 and Wayland
via layer-shell protocol and is configured through a simple TOML file.")
    (home-page "https://github.com/orhun/runst")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 7. opencode-bin — AI coding agent for the terminal
;;; -------------------------------------------------------------------
(define-public opencode-bin
  (package
    (name "opencode-bin")
    (version "1.4.8")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/anomalyco/opencode/releases/download/v"
                    version "/opencode-linux-x64.tar.gz"))
              (sha256
               (base32
                "0fvnb5z8d5i3j58xgnl3d7mk85h2nx3npzhjjy7f32s5lfiwnw02"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("opencode" "bin/opencode"))))
    (synopsis "AI coding agent built for the terminal")
    (description "OpenCode is a terminal-based AI coding assistant that
integrates with language models to help write, edit, and debug code.  It
provides an interactive TUI with file context awareness and multi-model
support.")
    (home-page "https://github.com/anomalyco/opencode")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 12. todoist-bin — Todoist CLI client written in Go
;;; -------------------------------------------------------------------
(define-public todoist-bin
  (package
    (name "todoist-bin")
    (version "0.23.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/sachaos/todoist/releases/download/v"
                    version "/todoist_Linux_x86_64.tar.gz"))
              (sha256
               (base32
                "1hjm0l9s3jssfbbx6wb8gky5axrhfrkgl55mbl0jbvh685n32zjs"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("todoist" "bin/todoist"))))
    (synopsis "Todoist CLI client for managing tasks from the terminal")
    (description "Todoist is a command-line client for the Todoist task
management service.  It provides commands for listing, adding, completing,
and organizing tasks and projects directly from the terminal.")
    (home-page "https://github.com/sachaos/todoist")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 14. spicetify-cli-bin — customize the Spotify client
;;; -------------------------------------------------------------------
(define-public spicetify-cli-bin
  (package
    (name "spicetify-cli-bin")
    (version "2.43.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/spicetify/cli/releases/download/v"
                    version "/spicetify-" version
                    "-linux-amd64.tar.gz"))
              (sha256
               (base32
                "1gnd2zwrjlvf5is5n14hr0iskagy5v4343zya8rbpyb3fy89g8vz"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("spicetify" "bin/spicetify"))))
    (synopsis "command-line tool to customize the Spotify desktop client")
    (description "Spicetify is a CLI tool that allows customizing the Spotify
desktop client.  It supports applying themes, installing extensions, and
modifying the client interface through a plugin system.")
    (home-page "https://github.com/spicetify/cli")
    (license license:lgpl2.1)))

;;; -------------------------------------------------------------------
;;; 27. defguard-client-bin — enterprise WireGuard VPN client
;;; -------------------------------------------------------------------
(define-public defguard-client-bin
  (package
    (name "defguard-client-bin")
    (version "1.6.7")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/DefGuard/client/releases/download/v"
                    version "/defguard-client-linux-x86_64-v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0df8wdydriz9w2sk63zb93gdyjggaz6chs3h387rsgbcfkc4pm2h"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("defguard-client" "bin/defguard-client"))))
    (synopsis "enterprise WireGuard VPN client with MFA support")
    (description "Defguard Client is a desktop WireGuard VPN client designed
for use with the Defguard identity and access management system.  It supports
multi-factor authentication, automatic connection management, and enterprise
deployment.")
    (home-page "https://github.com/DefGuard/client")
    (license license:asl2.0)))

;;; ===================================================================
;;; STANDALONE BINARY PACKAGES (bare executables)
;;; ===================================================================

;;; -------------------------------------------------------------------
;;; 3. gh-skyline-bin — GitHub contribution 3D skyline generator
;;; -------------------------------------------------------------------
(define-public gh-skyline-bin
  (package
    (name "gh-skyline-bin")
    (version "0.1.8")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/github/gh-skyline/releases/download/v"
                    version "/linux-amd64"))
              (sha256
               (base32
                "0l6kpqzkfvi3sv472xqzjd05pw81lrrlrjd5cbimgha3fc21pph6"))))
    (build-system copy-build-system)
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (mkdir-p "src")
                   (copy-file source "src/gh-skyline")
                   (chmod "src/gh-skyline" #o755)
                   (chdir "src"))))
           #:install-plan #~'(("gh-skyline" "bin/gh-skyline"))))
    (synopsis "GitHub CLI extension to generate 3D contribution skylines")
    (description "Gh-skyline is a GitHub CLI extension that generates a 3D
model of your GitHub contribution history as an STL file.  It creates
printable skyline visualizations from contribution data.")
    (home-page "https://github.com/github/gh-skyline")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 5. tsui-bin — elegant TUI for configuring Tailscale
;;; -------------------------------------------------------------------
(define-public tsui-bin
  (package
    (name "tsui-bin")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/neuralink/tsui/releases/download/v"
                    version "/tsui-linux-x86_64"))
              (sha256
               (base32
                "0ryn3xjcqd0ibh0i5bqgi540m5nrd6cswwhjriqyd5fni90c3z6c"))))
    (build-system copy-build-system)
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (mkdir-p "src")
                   (copy-file source "src/tsui")
                   (chmod "src/tsui" #o755)
                   (chdir "src"))))
           #:install-plan #~'(("tsui" "bin/tsui"))))
    (synopsis "elegant TUI for configuring Tailscale VPN")
    (description "Tsui is a terminal user interface for managing and
configuring Tailscale.  It provides an interactive display of connected
devices, exit nodes, and network settings without using the web console.")
    (home-page "https://github.com/neuralink/tsui")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 8. agesafetch-bin — AGESA firmware version fetcher
;;; -------------------------------------------------------------------
(define-public agesafetch-bin
  (package
    (name "agesafetch-bin")
    (version "2.0.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://gitlab.com/api/v4/projects/65209080"
                    "/packages/generic/agesafetch/" version "/agesafetch"))
              (sha256
               (base32
                "1p0x3nwir4xlmk278d7mzrf0mf7w98rwvz26x454f5sz8y3rgz2z"))))
    (build-system copy-build-system)
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (mkdir-p "src")
                   (copy-file source "src/agesafetch")
                   (chmod "src/agesafetch" #o755)
                   (chdir "src"))))
           #:install-plan #~'(("agesafetch" "bin/agesafetch"))))
    (synopsis "obtain embedded AGESA firmware version on AMD systems")
    (description "Agesafetch is a tool for obtaining the embedded AGESA version
from your system firmware on AMD-based Linux machines.  It reads the BIOS
image to identify the exact AGESA PI version used in the motherboard UEFI.")
    (home-page "https://gitlab.com/BVollmerhaus/agesafetch")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 9. play-timer-bin — MPRIS-aware timer app
;;; -------------------------------------------------------------------
(define-public play-timer-bin
  (package
    (name "play-timer-bin")
    (version "2.2.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/efogdev/mpris-timer"
                    "/releases/download/" version "/play-timer-x86_64"))
              (sha256
               (base32
                "0yj660ngw64lkibcr3qfx2n2kgl5114nbjzvjqq0hgwyrv83cyfg"))))
    (build-system copy-build-system)
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (mkdir-p "src")
                   (copy-file source "src/play-timer")
                   (chmod "src/play-timer" #o755)
                   (chdir "src"))))
           #:install-plan #~'(("play-timer" "bin/play-timer"))))
    (synopsis "CLI timer app with native desktop integration via MPRIS")
    (description "Play Timer is a command-line timer application that
integrates with the MPRIS D-Bus interface for native desktop media controls.
It allows setting timers that can be paused, resumed, and controlled through
standard media player widgets.")
    (home-page "https://github.com/efogdev/mpris-timer")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 10. pterodactyl-wings-bin — Pterodactyl server control plane
;;; -------------------------------------------------------------------
(define-public pterodactyl-wings-bin
  (package
    (name "pterodactyl-wings-bin")
    (version "1.12.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/pterodactyl/wings"
                    "/releases/download/v" version "/wings_linux_amd64"))
              (sha256
               (base32
                "1jcx36f26kdjplp25kx8vlxrivaa0dbnv7a3rad78mlvsi6jsmqw"))))
    (build-system copy-build-system)
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (mkdir-p "src")
                   (copy-file source "src/wings")
                   (chmod "src/wings" #o755)
                   (chdir "src"))))
           #:install-plan #~'(("wings" "bin/wings"))))
    (synopsis "server control plane for Pterodactyl game server panel")
    (description "Wings is the server control plane for the Pterodactyl Panel
game server management system.  It handles server creation, file management,
Docker container orchestration, and real-time console access for game servers.")
    (home-page "https://github.com/pterodactyl/wings")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 11. pass-secret-service-bin — D-Bus secret service backed by pass
;;; -------------------------------------------------------------------
(define-public pass-secret-service-bin
  (package
    (name "pass-secret-service-bin")
    (version "0.7.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/grimsteel/pass-secret-service"
                    "/releases/download/v" version
                    "/pass-secret-service-x86_64"))
              (sha256
               (base32
                "193w8jm81m5rf76cgsx7spnmyv5qx40lm7cm4hs33ix4lq7gci8f"))))
    (build-system copy-build-system)
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (mkdir-p "src")
                   (copy-file source "src/pass-secret-service")
                   (chmod "src/pass-secret-service" #o755)
                   (chdir "src"))))
           #:install-plan #~'(("pass-secret-service"
                               "bin/pass-secret-service"))))
    (synopsis "freedesktop.org secret service D-Bus provider backed by pass")
    (description "Pass-secret-service implements the
@code{org.freedesktop.secrets} D-Bus API backed by the standard Unix password
store (pass).  It allows applications that use libsecret to store and retrieve
credentials through pass and GPG encryption.")
    (home-page "https://github.com/grimsteel/pass-secret-service")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 13. icloudpd-bin — iCloud photos downloader
;;; -------------------------------------------------------------------
(define-public icloudpd-bin
  (package
    (name "icloudpd-bin")
    (version "1.32.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/icloud-photos-downloader"
                    "/icloud_photos_downloader/releases/download/v"
                    version "/icloudpd-" version "-linux-amd64"))
              (sha256
               (base32
                "0xmsng8jqb8z26n2an7m1rq4iy7mna279c9cchffh0fv9nd66bi9"))))
    (build-system copy-build-system)
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (mkdir-p "src")
                   (copy-file source "src/icloudpd")
                   (chmod "src/icloudpd" #o755)
                   (chdir "src"))))
           #:install-plan #~'(("icloudpd" "bin/icloudpd"))))
    (synopsis "command-line tool to download photos from iCloud")
    (description "Icloudpd is a command-line tool for downloading photos and
videos from iCloud Photo Library.  It supports incremental downloads, date
range filtering, live photo handling, and automatic organization by date.")
    (home-page "https://github.com/icloud-photos-downloader/icloud_photos_downloader")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 18. weatherfetch-bin — weather-themed system fetch
;;; -------------------------------------------------------------------
(define-public weatherfetch-bin
  (package
    (name "weatherfetch-bin")
    (version "0.0.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Namilsk/WeatherFetch"
                    "/releases/download/v" version
                    "/wfetch_linux_amd64.run"))
              (sha256
               (base32
                "17spix5l0ppv7x9r78y6mykxzvv5a665cb6p2dsyhjb3ql9qyhlj"))))
    (build-system copy-build-system)
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (mkdir-p "src")
                   (copy-file source "src/wfetch")
                   (chmod "src/wfetch" #o755)
                   (chdir "src"))))
           #:install-plan #~'(("wfetch" "bin/wfetch"))))
    (synopsis "system fetch tool with weather information display")
    (description "WeatherFetch is a system information fetch tool similar to
neofetch or fastfetch that also displays current weather conditions.  It shows
system details alongside local weather data in a themed terminal output.")
    (home-page "https://github.com/Namilsk/WeatherFetch")
    (license license:expat)))

;;; ===================================================================
;;; ZIP-BASED BINARY PACKAGES
;;; ===================================================================

;;; -------------------------------------------------------------------
;;; 15. cleanuparr-bin — cleanup tool for Sonarr and Radarr
;;; -------------------------------------------------------------------
(define-public cleanuparr-bin
  (package
    (name "cleanuparr-bin")
    (version "2.9.8")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Cleanuparr/Cleanuparr"
                    "/releases/download/v" version
                    "/Cleanuparr-" version "-linux-amd64.zip"))
              (sha256
               (base32
                "0vmy50zdhshd0ksy1g848x7rabr6qmr4n7ycajwkcdf82r51r7jz"))))
    (build-system copy-build-system)
    (native-inputs (list unzip))
    (arguments
     (list #:install-plan #~'(("Cleanuparr" "bin/cleanuparr"))))
    (synopsis "cleanup tool for unwanted files in Sonarr and Radarr")
    (description "Cleanuparr automates cleanup of unwanted or blocked files
in Sonarr, Radarr, and download clients.  It monitors media libraries and
removes failed downloads, sample files, and other unwanted content.")
    (home-page "https://github.com/Cleanuparr/Cleanuparr")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 16. terraform-bin — infrastructure as code tool
;;; -------------------------------------------------------------------
(define-public terraform-bin
  (package
    (name "terraform-bin")
    (version "1.12.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://releases.hashicorp.com/terraform/"
                    version "/terraform_" version "_linux_amd64.zip"))
              (sha256
               (base32
                "0z7gjx1zwzqzjvrjwl9p8va1lv5nafx49v39cwd462k606l8pbyw"))))
    (build-system copy-build-system)
    (native-inputs (list unzip))
    (arguments
     (list #:install-plan #~'(("terraform" "bin/terraform"))))
    (synopsis "tool for building and managing infrastructure as code")
    (description "Terraform is an infrastructure as code tool that lets you
define cloud and on-premises resources in human-readable configuration files.
It manages resource lifecycles with a declarative workflow across multiple
cloud providers.")
    (home-page "https://www.terraform.io")
    (license license:bsl1.1)))

;;; -------------------------------------------------------------------
;;; 17. skyterm-bin — terminal-based astronomy application
;;; -------------------------------------------------------------------
(define-public skyterm-bin
  (package
    (name "skyterm-bin")
    (version "0.2.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/craigderington/skyterm"
                    "/releases/download/v" version
                    "/skyterm_" version "_linux_amd64.zip"))
              (sha256
               (base32
                "0p4cnmbskabn0944cv0barrmygldp8a2djhb01p4k45b59v90b7n"))))
    (build-system copy-build-system)
    (native-inputs (list unzip))
    (arguments
     (list #:install-plan #~'(("skyterm" "bin/skyterm"))))
    (synopsis "terminal-based astronomy application for stargazing")
    (description "SkyTerm is a terminal-based astronomy application that
displays celestial objects, constellations, and astronomical data.  It
provides star charts and sky information viewable directly in the terminal.")
    (home-page "https://github.com/craigderington/skyterm")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 19. discord-chat-exporter-cli-bin — Discord chat log exporter
;;; -------------------------------------------------------------------
(define-public discord-chat-exporter-cli-bin
  (package
    (name "discord-chat-exporter-cli-bin")
    (version "2.47.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Tyrrrz/DiscordChatExporter"
                    "/releases/download/" version
                    "/DiscordChatExporter.Cli.linux-x64.zip"))
              (sha256
               (base32
                "0sfffrz19s86qv1i6z5hwfsskizmgjsmf23qsgn3d65f4fxqzm1f"))))
    (build-system copy-build-system)
    (native-inputs (list unzip))
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (add-after 'unpack 'fix-permissions
                 (lambda _
                   (chmod "DiscordChatExporter.Cli" #o755))))
           #:install-plan #~'(("DiscordChatExporter.Cli"
                               "bin/discord-chat-exporter"))))
    (synopsis "command-line tool to export Discord chat logs to files")
    (description "DiscordChatExporter CLI exports Discord channel chat
history to HTML, JSON, CSV, or plain text files.  It supports exporting
from direct messages, group chats, and server channels with media
attachments.")
    (home-page "https://github.com/Tyrrrz/DiscordChatExporter")
    (license license:expat)))

;;; ===================================================================
;;; TARBALL WITH DIRECTORY STRUCTURE
;;; ===================================================================

;;; -------------------------------------------------------------------
;;; 20. ventoy-bin — bootable USB solution
;;; -------------------------------------------------------------------
(define-public ventoy-bin
  (package
    (name "ventoy-bin")
    (version "1.1.11")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ventoy/Ventoy/releases/download/v"
                    version "/ventoy-" version "-linux.tar.gz"))
              (sha256
               (base32
                "1alzg03r2dgalg0q8cb464hqn2yycp6dgwa3vz2x098j6krwpjyx"))))
    (build-system copy-build-system)
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (add-after 'unpack 'enter-directory
                 (lambda _
                   (use-modules (ice-9 ftw))
                   (let ((dir (car (scandir "."
                                    (lambda (f)
                                      (string-prefix? "ventoy-" f))))))
                     (chdir dir))))
               (add-after 'enter-directory 'fix-permissions
                 (lambda _
                   (for-each (lambda (f) (chmod f #o755))
                             (find-files "." "Ventoy2Disk\\.sh|VentoyWeb\\.sh")))))
           #:install-plan #~'(("Ventoy2Disk.sh" "bin/ventoy2disk")
                              ("VentoyWeb.sh" "bin/ventoyweb"))))
    (synopsis "multiboot USB solution supporting ISO and other images")
    (description "Ventoy is a tool to create bootable USB drives.  Instead
of formatting the drive, it installs a bootloader that allows booting
directly from ISO, WIM, IMG, VHD, and EFI files by simply copying them
to the USB drive.")
    (home-page "https://www.ventoy.net")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 26. zotero-bin — reference management tool
;;; -------------------------------------------------------------------
(define-public zotero-bin
  (package
    (name "zotero-bin")
    (version "9.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://download.zotero.org/client/release/"
                    version "/Zotero-" version
                    "_linux-x86_64.tar.xz"))
              (sha256
               (base32
                "1jx1vfyfa9f0r7r9s3rb1xlww0cagnz4hfsvdg8ci1kab1gylzl9"))))
    (build-system copy-build-system)
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (add-after 'unpack 'enter-directory
                 (lambda _
                   (chdir "Zotero_linux-x86_64")))
               (add-after 'enter-directory 'fix-permissions
                 (lambda _
                   (chmod "zotero" #o755)
                   (when (file-exists? "zotero-bin")
                     (chmod "zotero-bin" #o755)))))
           #:install-plan
           #~'(("." "lib/zotero/"))))
    (synopsis "free tool to collect, organize, cite, and share research")
    (description "Zotero is a free, open-source reference management tool
that helps collect, organize, annotate, cite, and share research.  It
integrates with web browsers for capturing references and with word
processors for inserting citations and bibliographies.")
    (home-page "https://www.zotero.org")
    (license license:agpl3+)))

;;; ===================================================================
;;; DEB-BASED BINARY PACKAGES
;;; ===================================================================

;;; -------------------------------------------------------------------
;;; 21. localsend-bin — cross-platform file sharing
;;; -------------------------------------------------------------------
(define-public localsend-bin
  (package
    (name "localsend-bin")
    (version "1.17.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/localsend/localsend"
                    "/releases/download/v" version
                    "/LocalSend-" version "-linux-x86-64.deb"))
              (sha256
               (base32
                "0k505wi0qqvblcnpimhhrrxb6sh3sqs2armjc4fsicmc7qn4n95h"))))
    (build-system copy-build-system)
    (native-inputs (list tar gzip))
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (invoke "ar" "x" source)
                   (invoke "tar" "xf" "data.tar.gz")
                   #t)))
           #:install-plan
           #~'(("usr/bin/" "bin/")
               ("usr/share/" "share/"))))
    (synopsis "open source cross-platform alternative to AirDrop")
    (description "LocalSend is an open-source file sharing application that
allows securely sending files and messages to nearby devices over the local
network.  It works cross-platform without requiring an internet connection
or external server.")
    (home-page "https://localsend.org")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 22. dietpdf-bin — reduce PDF file size
;;; -------------------------------------------------------------------
(define-public dietpdf-bin
  (package
    (name "dietpdf-bin")
    (version "1.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Zigazou/dietpdf-haskell"
                    "/releases/download/v" version
                    "/dietpdf_" version "_amd64.deb"))
              (sha256
               (base32
                "0h30pr6y8shplcvqwkrrrjpm0f1022lrb2r2cn0mbb5mvq08yi0b"))))
    (build-system copy-build-system)
    (native-inputs (list tar gzip))
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (invoke "ar" "x" source)
                   (if (file-exists? "data.tar.xz")
                       (invoke "tar" "xf" "data.tar.xz")
                       (invoke "tar" "xf" "data.tar.gz"))
                   #t)))
           #:install-plan
           #~'(("usr/bin/" "bin/"))))
    (synopsis "tool to reduce PDF file size by optimizing content")
    (description "DietPDF analyzes and optimizes PDF files to reduce their
size.  It recompresses streams, removes unused objects, and applies
various optimizations while preserving document content and structure.")
    (home-page "https://github.com/Zigazou/dietpdf-haskell")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; 23. freetube-bin — privacy-focused YouTube player
;;; -------------------------------------------------------------------
(define-public freetube-bin
  (package
    (name "freetube-bin")
    (version "0.24.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/FreeTubeApp/FreeTube"
                    "/releases/download/v" version
                    "-beta/freetube_" version "_beta_amd64.deb"))
              (sha256
               (base32
                "0lilc823sg0yfbfx9jzcy0c9n74qiaapi07sb4azyyrcpl6r6xna"))))
    (build-system copy-build-system)
    (native-inputs (list tar gzip))
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (invoke "ar" "x" source)
                   (if (file-exists? "data.tar.xz")
                       (invoke "tar" "xf" "data.tar.xz")
                       (invoke "tar" "xf" "data.tar.gz"))
                   #t)))
           #:install-plan
           #~'(("usr/bin/" "bin/")
               ("usr/share/" "share/"))))
    (synopsis "privacy-focused desktop YouTube player")
    (description "FreeTube is an open-source desktop YouTube player built
with privacy in mind.  It uses local subscriptions and watch history,
blocks ads and trackers, and can optionally use the Invidious API to
avoid direct YouTube connections.")
    (home-page "https://freetubeapp.io")
    (license license:agpl3+)))

;;; -------------------------------------------------------------------
;;; 24. hoppscotch-bin — open source API development ecosystem
;;; -------------------------------------------------------------------
(define-public hoppscotch-bin
  (package
    (name "hoppscotch-bin")
    (version "26.3.1-0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/hoppscotch/releases"
                    "/releases/download/v" version
                    "/Hoppscotch_linux_x64.deb"))
              (sha256
               (base32
                "1x56fnxrsj1js6fya59zw0hpysk8vicp9q81350pd9s02kdc8h1c"))))
    (build-system copy-build-system)
    (native-inputs (list tar gzip))
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (invoke "ar" "x" source)
                   (if (file-exists? "data.tar.xz")
                       (invoke "tar" "xf" "data.tar.xz")
                       (invoke "tar" "xf" "data.tar.gz"))
                   #t)))
           #:install-plan
           #~'(("usr/bin/" "bin/")
               ("usr/share/" "share/"))))
    (synopsis "open source API development ecosystem")
    (description "Hoppscotch is an open-source API development platform that
provides HTTP request testing, WebSocket connections, GraphQL queries, and
real-time collaboration.  It serves as a lightweight alternative to Postman
for API development workflows.")
    (home-page "https://hoppscotch.io")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 25. proton-pass-bin — end-to-end encrypted password manager
;;; -------------------------------------------------------------------
(define-public proton-pass-bin
  (package
    (name "proton-pass-bin")
    (version "1.36.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://proton.me/download/PassDesktop/linux/x64"
                    "/proton-pass_" version "_amd64.deb"))
              (sha256
               (base32
                "1q2r7yk1hdjv9hpwj6f956ai9yi6q6n0m59iy4p1amq3c18vban3"))))
    (build-system copy-build-system)
    (native-inputs (list tar gzip))
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (invoke "ar" "x" source)
                   (if (file-exists? "data.tar.xz")
                       (invoke "tar" "xf" "data.tar.xz")
                       (invoke "tar" "xf" "data.tar.gz"))
                   #t)))
           #:install-plan
           #~'(("usr/bin/" "bin/")
               ("usr/share/" "share/"))))
    (synopsis "Proton end-to-end encrypted password manager")
    (description "Proton Pass is an end-to-end encrypted password manager by
Proton.  It stores passwords, credit cards, and secure notes with zero-access
encryption, integrates with Proton services, and supports passkeys and
two-factor authentication.")
    (home-page "https://proton.me/pass")
    (license license:gpl3+)))
