;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260423e
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages.
;;;
;;; New recipes (24):
;;;        1.  go-mitmproxy-bin (copy-build-system, v1.8.11, MIT)
;;;        2.  bayesian-ssh-bin (copy-build-system, v1.5.0, MIT)
;;;        3.  wtp-bin (copy-build-system, v2.10.3, MIT)
;;;        4.  dissent-bin (copy-build-system, v0.0.37, GPL-3.0)
;;;        5.  mmtui (cargo-build-system, v0.2.0, MIT)
;;;        6.  rg-sens-git (cargo-build-system, v0.8.0, MIT/Apache-2.0)
;;;        7.  speedtest-go (go-build-system, v1.7.10, MIT)
;;;        8.  netpala (go-build-system, v1.3.0, WTFPL)
;;;        9.  fotocx (gnu-build-system, v26.3, GPL-3.0+)
;;;       10.  wattage (meson-build-system, v1.4.0, GPL-3.0+)
;;;       11.  shutsentry (copy-build-system, v2.8, GPL-3.0+)
;;;       12.  menulibre (python-build-system, v2.4.0, GPL-3.0)
;;;       13.  jackett-bin (copy-build-system, v0.24.1616, GPL-2.0+)
;;;       14.  dmscripts-git (copy-build-system, v1.0, GPL-3.0+)
;;;       15.  domake (copy-build-system, v3, LGPL-2.1+)
;;;       16.  dosh (copy-build-system, v8, LGPL-2.1+)
;;;       17.  hanuchi (copy-build-system, v1.1.0, MIT)
;;;       18.  tty-clock (gnu-build-system, v2.3, BSD)
;;;       19.  jrnlc (cmake-build-system, v0.3.0, MIT)
;;;       20.  kubecolor (go-build-system, v0.5.3, MIT)
;;;       21.  unimatrix-git (copy-build-system, v20190901, GPL-3.0+)
;;;       22.  mediamtx (go-build-system, v1.17.1, MIT)
;;;       23.  docker-credential-secretservice (go-build-system, v0.9.5, MIT)
;;;       24.  compendium (cargo-build-system, v0.2.0, MIT)
;;;
;;; BLOCKED EXHAUSTED (6):
;;;        1.  crossmacro -> DOTNET_REQUIRED: .NET 10/C#/Avalonia; not cmake as expected
;;;        2.  cromite-bin -> BROWSER_BINARY_COMPLEX: 262MB binary, commit-hash tag, 20+ runtime deps
;;;        3.  svg-term-cli -> NPM_DEPS_CHAIN: 10+ npm deps not available in Guix
;;;        4.  libasciichat -> VERSION_MISMATCH: v0.6.0 nonexistent; massive vendored deps (libsodium/webrtc/ffmpeg)
;;;        5.  signal-export -> MISSING_PYTHON_DEPS: requires python-sqlcipher3-wheels not in Guix
;;;        6.  lic-cli -> UV_BUILD_BACKEND: uses uv_build (non-standard Python build backend, not in Guix)
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Use `guix download` or `guix hash` to obtain real hashes.

(define-module (gaurix packages recipe-resolver-260423e)
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
  #:use-module (guix build-system meson)
  #:use-module (guix build-system python)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages cmake)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages databases)
  #:use-module (gnu packages elf)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages gettext)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gnupg)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages image)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages ncurses)
  #:use-module (gnu packages networking)
  #:use-module (gnu packages pcre)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages vala)
  #:use-module (gnu packages version-control)
  #:use-module (gnu packages video)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages xorg)
  #:export (
            go-mitmproxy-bin
            bayesian-ssh-bin
            wtp-bin
            dissent-bin
            mmtui
            rg-sens-git
            speedtest-go
            netpala
            fotocx
            wattage
            shutsentry
            menulibre
            jackett-bin
            dmscripts-git
            domake
            dosh
            hanuchi
            tty-clock
            jrnlc
            kubecolor
            unimatrix-git
            mediamtx
            docker-credential-secretservice
            compendium
            ))

;;; -------------------------------------------------------------------
;;; 1. go-mitmproxy-bin --- man-in-the-middle proxy in Go (binary)
;;; -------------------------------------------------------------------
(define-public go-mitmproxy-bin
  (package
    (name "go-mitmproxy-bin")
    (version "1.8.11")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/lqqyt2423/go-mitmproxy/releases/download/v"
                    version "/go-mitmproxy_" version "_Linux_x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("go-mitmproxy" "bin/"))))
    (synopsis "interactive HTTPS man-in-the-middle proxy in Go")
    (description "go-mitmproxy is an interactive HTTPS proxy implemented in
Go.  It can intercept, inspect, modify, and replay HTTP and HTTPS traffic.
It provides a web interface for real-time traffic monitoring and supports
addon-based request manipulation.")
    (home-page "https://github.com/lqqyt2423/go-mitmproxy")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 2. bayesian-ssh-bin --- SSH connection manager (binary)
;;; -------------------------------------------------------------------
(define-public bayesian-ssh-bin
  (package
    (name "bayesian-ssh-bin")
    (version "1.5.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/abdoufermat5/bayesian-ssh/releases/download/v"
                    version "/bayesian-ssh-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("bayesian-ssh-linux-x86_64" "bin/bayesian-ssh"))))
    (synopsis "fast multi-environment SSH connection manager")
    (description "Bayesian SSH is a fast and lightweight SSH session manager
with Kerberos support.  It provides a terminal user interface for organizing,
searching, and connecting to SSH hosts across multiple environments.")
    (home-page "https://github.com/abdoufermat5/bayesian-ssh")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 3. wtp-bin --- Git worktree CLI tool (binary)
;;; -------------------------------------------------------------------
(define-public wtp-bin
  (package
    (name "wtp-bin")
    (version "2.10.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/satococoa/wtp/releases/download/v"
                    version "/wtp_" version "_Linux_x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("wtp" "bin/"))))
    (inputs (list git))
    (synopsis "powerful Git worktree CLI tool")
    (description "wtp is a command-line tool for managing Git worktrees with
automated setup, branch tracking, and smart navigation.  It simplifies
creating, switching between, and cleaning up worktrees.")
    (home-page "https://github.com/satococoa/wtp")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 4. dissent-bin --- Discord client for Linux (binary)
;;; -------------------------------------------------------------------
(define-public dissent-bin
  (package
    (name "dissent-bin")
    (version "0.0.37")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/diamondburned/dissent/releases/download/v"
                    version "/dissent-linux-amd64.tar.zst"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("bin/dissent" "bin/")
                              ("share/" "share/"))))
    (native-inputs (list zstd))
    (synopsis "third-party Discord client for Linux desktops")
    (description "Dissent is a native Discord client built with GTK4 and
libadwaita, designed for Linux desktop environments.  It provides a
lightweight interface for Discord messaging, prioritizing simplicity and
speed.")
    (home-page "https://github.com/diamondburned/dissent")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 5. mmtui --- TUI disk mount manager
;;; -------------------------------------------------------------------
(define-public mmtui
  (package
    (name "mmtui")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://static.crates.io/crates/mmtui/mmtui-"
                    version ".crate"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (inputs (list udisks dbus))
    (synopsis "TUI disk mount manager for terminal file managers")
    (description "mmtui is a terminal user interface for mounting and
unmounting disks, designed for integration with TUI file managers.  It
communicates with udisks2 via D-Bus to manage storage devices and supports
configuration via TOML files.")
    (home-page "https://github.com/SL-RU/mmtui")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 6. rg-sens-git --- system monitoring dashboard
;;; -------------------------------------------------------------------
(define-public rg-sens-git
  (package
    (name "rg-sens-git")
    (version "0.8.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/hilgardt-collab/rg-Sens")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (inputs (list gtk cairo pango glib))
    (synopsis "fast, customizable system monitoring dashboard for Linux")
    (description "rg-Sens is a system monitoring dashboard written in Rust
with a GTK4 interface.  It provides a customizable grid layout with
drag-and-drop panels, rich visualizations including gauges and graphs,
multi-monitor support, and auto-scroll.  It monitors CPU, memory, GPU,
temperatures, fan speeds, and disks.")
    (home-page "https://github.com/hilgardt-collab/rg-Sens")
    (license (list license:expat license:asl2.0))))

;;; -------------------------------------------------------------------
;;; 7. speedtest-go --- internet speed test CLI
;;; -------------------------------------------------------------------
(define-public speedtest-go
  (package
    (name "speedtest-go")
    (version "1.7.10")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/showwin/speedtest-go")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/showwin/speedtest-go"
           #:tests? #f))
    (synopsis "internet speed test CLI and Go API using speedtest.net")
    (description "speedtest-go is a command-line interface and pure Go API
to test internet speed using speedtest.net.  It supports server selection,
JSON output, and can be used both as a CLI tool and as a Go library.")
    (home-page "https://github.com/showwin/speedtest-go")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 8. netpala --- terminal Wi-Fi manager
;;; -------------------------------------------------------------------
(define-public netpala
  (package
    (name "netpala")
    (version "1.3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/joel-sgc/netpala")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "netpala"
           #:tests? #f))
    (inputs (list network-manager dbus))
    (synopsis "terminal-friendly NetworkManager wrapper written in Go")
    (description "Netpala is a lightweight terminal user interface for
managing Wi-Fi connections through NetworkManager.  It provides a TUI built
with Bubble Tea for connecting to, disconnecting from, and managing wireless
networks.  It is compatible with both wpa_supplicant and iwd backends.")
    (home-page "https://github.com/joel-sgc/netpala")
    (license license:wtfpl2)))

;;; -------------------------------------------------------------------
;;; 9. fotocx --- image editor and collection manager
;;; -------------------------------------------------------------------
(define-public fotocx
  (package
    (name "fotocx")
    (version "26.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://www.kornelix.net/downloads/downloads/fotocx-"
                    version "-source.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:make-flags
      #~(list (string-append "PREFIX=" #$output)
              (string-append "CC=" #$(cc-for-target)))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure))))
    (native-inputs (list pkg-config))
    (inputs (list gtk+ libtiff libjpeg-turbo libpng lcms))
    (synopsis "image editing and collection management program")
    (description "Fotocx is a free Linux program for editing photos and
managing image collections.  It features a thumbnail browser, image editing
with area selection tools, RAW file import and batch conversion, HDR and
panorama creation, and mosaic generation.  It supports JPEG, TIFF, PNG,
and JXL formats with 8 or 16 bits per color channel.")
    (home-page "https://www.kornelix.net/fotocx/fotocx.html")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 10. wattage --- battery and power monitor
;;; -------------------------------------------------------------------
(define-public wattage
  (package
    (name "wattage")
    (version "1.4.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/v81d/wattage")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (native-inputs (list pkg-config vala gettext-minimal
                         `(,glib "bin") desktop-file-utils))
    (inputs (list gtk libadwaita libgee cairo upower))
    (synopsis "battery and power device monitor with GTK4 interface")
    (description "Wattage is an application for monitoring the health and
status of power devices.  It displays data regarding battery capacity,
energy metrics, and device information through a GTK4 and libadwaita
interface.  It supports multiple batteries and power sources, shows battery
health, voltage data, and device status.  Written in Vala, it requires
UPower for retrieving power information.")
    (home-page "https://github.com/v81d/wattage")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 11. shutsentry --- virtual dead-man-switch
;;; -------------------------------------------------------------------
(define-public shutsentry
  (package
    (name "shutsentry")
    (version "2.8")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.com/shutsentry/shutsentry")
                    (commit "master")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("Src/Linux/shutsentry.sh" "bin/shutsentry"))))
    (inputs (list bash))
    (synopsis "virtual dead-man-switch for personal computers")
    (description "ShutSentry is a virtual dead-man-switch that protects
computers from unauthorized physical access by presenting an on-screen
challenge prompt at regular time intervals.  If the correct password is
not entered, the system is locked and optionally shut down after a specified
delay.  The Linux version is a Bash script.")
    (home-page "https://gitlab.com/shutsentry/shutsentry")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 12. menulibre --- advanced menu editor
;;; -------------------------------------------------------------------
(define-public menulibre
  (package
    (name "menulibre")
    (version "2.4.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/bluesabre/menulibre/releases/download/"
                    "menulibre-" version "/menulibre-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system python-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list intltool))
    (propagated-inputs (list python-pygobject gtk+ gnome-menus
                             python-psutil))
    (synopsis "advanced FreeDesktop.org compliant menu editor")
    (description "MenuLibre is an advanced menu editor compliant with
FreeDesktop.org specifications.  It provides a GTK+ interface for creating
new launchers or modifying existing ones, with complete control over common
and advanced desktop entry settings.  It supports desktop actions used by
Unity, Xfce, and Pantheon desktop environments.")
    (home-page "https://github.com/bluesabre/menulibre")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 13. jackett-bin --- torrent tracker API proxy (binary)
;;; -------------------------------------------------------------------
(define-public jackett-bin
  (package
    (name "jackett-bin")
    (version "0.24.1616")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Jackett/Jackett/releases/download/v"
                    version "/Jackett.Binaries.LinuxAMDx64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("Jackett/" "lib/jackett/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'create-wrapper
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((out (assoc-ref outputs "out")))
                     (mkdir-p (string-append out "/bin"))
                     (symlink (string-append out "/lib/jackett/jackett")
                              (string-append out "/bin/jackett"))))))))
    (synopsis "API support proxy for torrent trackers")
    (description "Jackett is a proxy server that translates queries from
applications like Sonarr, Radarr, and Lidarr into tracker-site-specific
HTTP requests, supporting over 700 public and private torrent trackers.
It provides a unified Torznab and Potato API interface.")
    (home-page "https://github.com/Jackett/Jackett")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 14. dmscripts-git --- collection of dmenu scripts
;;; -------------------------------------------------------------------
(define-public dmscripts-git
  (package
    (name "dmscripts-git")
    (version "1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.com/dwt1/dmscripts")
                    (commit "1247a274f51a")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("scripts/" "bin/")
               ("config/" "etc/dmscripts/"))))
    (inputs (list bash dmenu))
    (synopsis "collection of dmenu scripts for common desktop tasks")
    (description "Dmscripts is a collection of Bash scripts using dmenu
or rofi as a frontend for common desktop Linux tasks including bookmarks,
clipboard management, screen capture, music playback, Wi-Fi management,
and system controls.")
    (home-page "https://gitlab.com/dwt1/dmscripts")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 15. domake --- run Make targets inside Docker containers
;;; -------------------------------------------------------------------
(define-public domake
  (package
    (name "domake")
    (version "3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/gportay/domake")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("domake" "bin/")
               ("domake.1" "share/man/man1/"))))
    (inputs (list bash))
    (synopsis "run Make targets inside Docker containers")
    (description "Domake is a Docker Make CLI plugin that wraps the make
command to run build targets inside Docker containers, supporting multiple
architectures including amd64, arm, and arm64.")
    (home-page "https://github.com/gportay/domake")
    (license license:lgpl2.1+)))

;;; -------------------------------------------------------------------
;;; 16. dosh --- run interactive shells inside Docker containers
;;; -------------------------------------------------------------------
(define-public dosh
  (package
    (name "dosh")
    (version "8")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/gportay/dosh")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("dosh" "bin/")
               ("dosh.1" "share/man/man1/"))))
    (inputs (list bash))
    (synopsis "run interactive shells inside Docker containers")
    (description "Dosh is a Docker Shell CLI plugin that provides an
interactive shell environment inside Docker containers, supporting multiple
architectures and integration with cqfd for build environments.")
    (home-page "https://github.com/gportay/dosh")
    (license license:lgpl2.1+)))

;;; -------------------------------------------------------------------
;;; 17. hanuchi --- minimalist GTK4 Hamachi frontend
;;; -------------------------------------------------------------------
(define-public hanuchi
  (package
    (name "hanuchi")
    (version "1.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Advnirr/hanuchi")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("hanuchi" "bin/")
               ("hanuchi.desktop" "share/applications/")
               ("icons/hanuchi.svg" "share/icons/hicolor/scalable/apps/"))))
    (inputs (list python python-pygobject gtk libadwaita))
    (synopsis "minimalist GTK4 frontend for LogMeIn Hamachi")
    (description "Hanuchi is a minimalist GTK4 and libadwaita frontend for
managing LogMeIn Hamachi VPN networks, providing a graphical interface for
viewing network status, joining and creating networks, and managing peers.")
    (home-page "https://github.com/Advnirr/hanuchi")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 18. tty-clock --- digital clock in terminal
;;; -------------------------------------------------------------------
(define-public tty-clock
  (package
    (name "tty-clock")
    (version "2.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/xorg62/tty-clock")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:make-flags
      #~(list (string-append "PREFIX=" #$output)
              (string-append "CC=" #$(cc-for-target)))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure))))
    (inputs (list ncurses))
    (synopsis "digital clock displayed in a terminal")
    (description "tty-clock is a small and configurable digital clock
displayed in a terminal.  It features customizable colors, positioning,
time formats, and a screensaver mode.  It uses the ncurses library for
terminal rendering.")
    (home-page "https://github.com/xorg62/tty-clock")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; 19. jrnlc --- terminal journaling tool
;;; -------------------------------------------------------------------
(define-public jrnlc
  (package
    (name "jrnlc")
    (version "0.3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/manjunathamajety/jrnlc")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (inputs (list ncurses))
    (synopsis "fast, minimal terminal-based journaling tool")
    (description "jrnlc is a fast and minimal command-line journaling tool
written in C.  It supports creating, editing, listing, and searching journal
entries stored as local files.  It features a terminal user interface for
composing and reviewing entries with search support.")
    (home-page "https://github.com/manjunathamajety/jrnlc")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 20. kubecolor --- colorize kubectl output
;;; -------------------------------------------------------------------
(define-public kubecolor
  (package
    (name "kubecolor")
    (version "0.5.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/kubecolor/kubecolor")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/kubecolor/kubecolor"
           #:tests? #f))
    (synopsis "colorize kubectl output for improved readability")
    (description "Kubecolor is a command-line tool that colorizes the output
of kubectl commands for improved readability.  It acts as a drop-in
replacement wrapper for kubectl, adding syntax highlighting and color-coded
output to resource listings, descriptions, and logs without altering the
actual data.")
    (home-page "https://github.com/kubecolor/kubecolor")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 21. unimatrix-git --- Matrix terminal effect
;;; -------------------------------------------------------------------
(define-public unimatrix-git
  (package
    (name "unimatrix-git")
    (version "20190901")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/will8211/unimatrix")
                    (commit "5cf67aa0dd7e1943be3e1aa8a83a8b974b42f5e5")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("unimatrix.py" "bin/unimatrix"))))
    (inputs (list python))
    (synopsis "Python script to simulate The Matrix terminal effect")
    (description "Unimatrix is a Python script that simulates the scrolling
code display from The Matrix in the terminal.  It supports customizable
character sets, colors, speeds, and density, using Unicode characters for
a variety of visual effects.")
    (home-page "https://github.com/will8211/unimatrix")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 22. mediamtx --- RTSP/RTMP/WebRTC media server
;;; -------------------------------------------------------------------
(define-public mediamtx
  (package
    (name "mediamtx")
    (version "1.17.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/bluenviron/mediamtx")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/bluenviron/mediamtx"
           #:tests? #f))
    (synopsis "ready-to-use RTSP, RTMP, and WebRTC media server")
    (description "MediaMTX is a ready-to-use and zero-dependency real-time
media server and proxy.  It supports publishing and reading live video and
audio streams via RTSP, RTMP, HLS, WebRTC, SRT, and other protocols.  It
can be used as a standalone server or embedded in Go applications.")
    (home-page "https://github.com/bluenviron/mediamtx")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 23. docker-credential-secretservice --- Docker credential helper
;;; -------------------------------------------------------------------
(define-public docker-credential-secretservice
  (package
    (name "docker-credential-secretservice")
    (version "0.9.5")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/docker/docker-credential-helpers")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/docker/docker-credential-helpers"
           #:tests? #f))
    (inputs (list libsecret))
    (synopsis "Docker credential helper using the D-Bus secret service")
    (description "docker-credential-secretservice is a program that uses
the D-Bus Secret Service API to securely store Docker registry credentials.
It integrates with GNOME Keyring, KWallet, and other Secret Service
providers to keep Docker login credentials encrypted.")
    (home-page "https://github.com/docker/docker-credential-helpers")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 24. compendium --- user-friendly strace for Linux
;;; -------------------------------------------------------------------
(define-public compendium
  (package
    (name "compendium")
    (version "0.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/louisboilard/compendium")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (inputs (list elfutils zlib))
    (synopsis "user-friendly strace for x86 Linux with HTML reports")
    (description "Compendium is a powerful and easy-to-use syscall tracer
for x86 Linux.  It wraps strace-like functionality in a user-friendly
interface and generates HTML reports for system call analysis.  It uses
eBPF via libbpf for efficient tracing and supports perf event monitoring.")
    (home-page "https://github.com/louisboilard/compendium")
    (license license:expat)))
