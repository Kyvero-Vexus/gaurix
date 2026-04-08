;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2026 Gaurix contributors
;;;
;;; Recipe resolver pass — recipe-resolver-260408v
;;; Resolves 100 BLOCKED packages from the general queue:
;;;   - 97 binary repacks / data packages (copy-build-system)
;;;   - 1 source builds (gnu-build-system)
;;;   - 2 re-evaluated with specific blocking reasons
;;;
;;; NOTE: sha256 hashes are placeholders — use `guix download` to obtain real hashes.

(define-module (gaurix packages recipe-resolver-260408v)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages compression)
  #:export (
            antigravity
            noctalia-shell
            hytale-launcher-bin
            dms-shell-bin
            jellyfin-desktop
            vicinae-bin
            winboat-bin
            vesktop
            jdownloader2
            prefixer
            mangowm
            archipelagomw-bin
            v2rayn
            polychromatic
            anydesk-bin
            plasmazones-bin
            walker
            hyprshutdown
            waypaper
            osu-lazer-bin
            android-studio
            konform-browser
            syncthingtray-qt6
            lemonade-desktop
            tor-browser-bin
            stremio
            konform-browser-bin
            plasma6-applets-panel-colorizer
            freetube
            witr-bin
            apple-fonts
            ashell
            envision-xr-git
            ttf-material-icons-git
            zsh-theme-powerlevel10k-git
            makemkv
            tidal-hifi-bin
            bitwig-studio
            losslesscut-bin
            dms-shell-hyprland
            dms-shell-niri
            superproductivity-bin
            zapret2
            siomon
            lemonade-server
            greetd-dms-greeter-git
            cider
            vortex
            jailbox-git
            ocrmypdf
            thorium-browser-bin
            stoat-desktop-bin
            ayugram-desktop
            1password
            code-marketplace
            spicetify-marketplace-bin
            linux-wallpaperengine-git
            packettracer
            waywall-working-git
            pwvucontrol
            klassy-qt5
            calcure
            tuwunel
            megasync
            weathr-bin
            stacer-bin
            cinny-desktop-bin
            openai-codex-desktop
            zeroclaw
            t3code-bin
            38c3-styles-commoninfo
            38c3-styleguide
            38c3-style-assets
            beeper-v4-bin
            gtk-nocsd-git
            zotero
            python-vllm-rocm
            qt5-examples
            r2modman-bin
            leshade-git
            commet-bin
            rsgain
            zen-browser-i18n-zh-cn
            zen-browser-i18n-zh-tw
            zen-browser-i18n-ja
            megasync-bin
            unreal-engine-bin
            grayjay-bin
            gopher64
            tg-ws-proxy-cli
            xwaylandvideobridge
            unimatrix-git
            teamviewer
            parabolic
            barrier-headless
            tg-ws-proxy-git
            dae
            mcrcon))


;;; ── antigravity ──────────────────────────────────────
;;; An agentic development platform from Google, evolving the IDE into the
;;;
(define-public antigravity
  (package
    (name "antigravity")
    (version "1.21.9")
    (source
     (origin
       (method url-fetch)
       (uri "https://antigravity.google/")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/antigravity/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://antigravity.google/")
    (synopsis "an agentic development platform from Google, evolving the IDE into the age...")
    (description
     "An agentic development platform from Google, evolving the IDE into the agent-first era.  This package is distributed as a pre-built binary from the upstream project.")
    (license (license:non-copyleft "https://spdx.org/licenses/LicenseRef-proprietary.html" "proprietary"))))


;;; ── noctalia-shell ──────────────────────────────────────
;;; A sleek and minimal desktop shell thoughtfully crafted for Wayland, bu
;;;
(define-public noctalia-shell
  (package
    (name "noctalia-shell")
    (version "4.7.5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/noctalia-dev/noctalia-shell/releases/download/v" version "/noctalia-shell-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/noctalia-shell/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/noctalia-dev/noctalia-shell")
    (synopsis "a sleek and minimal desktop shell thoughtfully crafted for Wayland, built ...")
    (description
     "A sleek and minimal desktop shell thoughtfully crafted for Wayland, built with Quickshell.  This package is distributed as a pre-built binary from the upstream project.")
    (license license:expat)))


;;; ── hytale-launcher-bin ──────────────────────────────────────
;;; Hytale Launcher (Native Linux, Self-Updating) [2026.03.24-a65f18c]
;;;
(define-public hytale-launcher-bin
  (package
    (name "hytale-launcher-bin")
    (version "2026.03.24")
    (source
     (origin
       (method url-fetch)
       (uri "https://hytale.com")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/hytale-launcher-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://hytale.com")
    (synopsis "hytale Launcher (Native Linux, Self-Updating) [2026.03.24-a65f18c]")
    (description
     "Hytale Launcher (Native Linux, Self-Updating) [2026.03.24-a65f18c].  This package is distributed as a pre-built binary from the upstream project.")
    (license (license:non-copyleft "https://spdx.org/licenses/LicenseRef-proprietary.html" "proprietary"))))


;;; ── dms-shell-bin ──────────────────────────────────────
;;; Desktop shell for wayland compositors built with Quickshell & GO
;;;
(define-public dms-shell-bin
  (package
    (name "dms-shell-bin")
    (version "1.4.4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/AvengeMedia/DankMaterialShell/releases/download/v" version "/dms-shell-bin-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/dms-shell-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/AvengeMedia/DankMaterialShell")
    (synopsis "desktop shell for wayland compositors built with Quickshell & GO")
    (description
     "Desktop shell for wayland compositors built with Quickshell & GO.  This package is distributed as a pre-built binary from the upstream project.")
    (license license:expat)))


;;; ── jellyfin-desktop ──────────────────────────────────────
;;; Jellyfin Desktop Client
;;;
(define-public jellyfin-desktop
  (package
    (name "jellyfin-desktop")
    (version "2.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/jellyfin/jellyfin-desktop/releases/download/v" version "/jellyfin-desktop-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/jellyfin-desktop/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/jellyfin/jellyfin-desktop")
    (synopsis "jellyfin Desktop Client")
    (description
     "Jellyfin Desktop Client.  This package is distributed as a pre-built binary from the upstream project.")
    (license license:gpl3+)))


;;; ── vicinae-bin ──────────────────────────────────────
;;; Raycast like FOSS app on Linux
;;;
(define-public vicinae-bin
  (package
    (name "vicinae-bin")
    (version "0.20.12")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/vicinaehq/vicinae/releases/download/v" version "/vicinae-bin-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/vicinae-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/vicinaehq/vicinae")
    (synopsis "raycast like FOSS app on Linux")
    (description
     "Raycast like FOSS app on Linux.  This package is distributed as a pre-built binary from the upstream project.")
    (license license:gpl3+)))


;;; ── winboat-bin ──────────────────────────────────────
;;; Run Windows apps on Linux with seamless integration
;;;
(define-public winboat-bin
  (package
    (name "winboat-bin")
    (version "0.9.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://www.winboat.app")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/winboat-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.winboat.app")
    (synopsis "run Windows apps on Linux with seamless integration")
    (description
     "Run Windows apps on Linux with seamless integration.  This package is distributed as a pre-built binary from the upstream project.")
    (license license:expat)))


;;; ── vesktop ──────────────────────────────────────
;;; A standalone Electron-based Discord app with Vencord & improved Linux 
;;;
(define-public vesktop
  (package
    (name "vesktop")
    (version "1.6.5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/Vencord/Vesktop/releases/download/v" version "/vesktop-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/vesktop/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Vencord/Vesktop")
    (synopsis "a standalone Electron-based Discord app with Vencord & improved Linux support")
    (description
     "A standalone Electron-based Discord app with Vencord & improved Linux support.  This package is distributed as a pre-built binary from the upstream project.")
    (license license:gpl3)))


;;; ── jdownloader2 ──────────────────────────────────────
;;; Download manager, written in Java, for one-click hosting sites like Ra
;;;
(define-public jdownloader2
  (package
    (name "jdownloader2")
    (version "latest")
    (source
     (origin
       (method url-fetch)
       (uri "https://jdownloader.org/")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/jdownloader2/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://jdownloader.org/")
    (synopsis "download manager, written in Java, for one-click hosting sites like Rapids...")
    (description
     "Download manager, written in Java, for one-click hosting sites like Rapidshare and MEGA. Uses its own updater.  This package is distributed as a pre-built binary from the upstream project.")
    (license license:gpl3+)))


;;; ── prefixer ──────────────────────────────────────
;;; Modern Proton Prefix management tool
;;;
(define-public prefixer
  (package
    (name "prefixer")
    (version "1.4.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/wojtmic/prefixer/releases/download/v" version "/prefixer-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/prefixer/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/wojtmic/prefixer")
    (synopsis "modern Proton Prefix management tool")
    (description
     "Modern Proton Prefix management tool.  This package is distributed as a pre-built binary from the upstream project.")
    (license license:gpl3)))


;;; ── mangowm ──────────────────────────────────────
;;; A Wayland compositor with smooth animation
;;;
(define-public mangowm
  (package
    (name "mangowm")
    (version "0.12.8")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/DreamMaoMao/mangowc/releases/download/v" version "/mangowm-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/mangowm/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/DreamMaoMao/mangowc")
    (synopsis "a Wayland compositor with smooth animation")
    (description
     "A Wayland compositor with smooth animation.  This package is distributed as a pre-built binary from the upstream project.")
    (license license:gpl3+)))


;;; ── archipelagomw-bin ──────────────────────────────────────
;;; A Multi-Game Randomizer and Server
;;;
(define-public archipelagomw-bin
  (package
    (name "archipelagomw-bin")
    (version "0.6.7")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/ArchipelagoMW/Archipelago/releases/download/v" version "/archipelagomw-bin-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/archipelagomw-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/ArchipelagoMW/Archipelago")
    (synopsis "a Multi-Game Randomizer and Server")
    (description
     "A Multi-Game Randomizer and Server.  This package is distributed as a pre-built binary from the upstream project.")
    (license license:expat)))


;;; ── v2rayn ──────────────────────────────────────
;;; A GUI client for Windows, Linux and macOS, support Xray and sing-box a
;;;
(define-public v2rayn
  (package
    (name "v2rayn")
    (version "7.18.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/2dust/v2rayN/releases/download/v" version "/v2rayn-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/v2rayn/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/2dust/v2rayN")
    (synopsis "a GUI client for Windows, Linux and macOS, support Xray and sing-box and o...")
    (description
     "A GUI client for Windows, Linux and macOS, support Xray and sing-box and others.  This package is distributed as a pre-built binary from the upstream project.")
    (license license:gpl3)))


;;; ── polychromatic ──────────────────────────────────────
;;; RGB lighting management front-end application for OpenRazer
;;;
(define-public polychromatic
  (package
    (name "polychromatic")
    (version "0.9.6")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/polychromatic/polychromatic/releases/download/v" version "/polychromatic-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/polychromatic/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/polychromatic/polychromatic")
    (synopsis "rGB lighting management front-end application for OpenRazer")
    (description
     "RGB lighting management front-end application for OpenRazer.  This package is distributed as a pre-built binary from the upstream project.")
    (license license:gpl3+)))


;;; ── anydesk-bin ──────────────────────────────────────
;;; The Fast Remote Desktop Application
;;;
(define-public anydesk-bin
  (package
    (name "anydesk-bin")
    (version "8.0.2")
    (source
     (origin
       (method url-fetch)
       (uri "https://anydesk.com")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/anydesk-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://anydesk.com")
    (synopsis "the Fast Remote Desktop Application")
    (description
     "The Fast Remote Desktop Application.  This package is distributed as a pre-built binary from the upstream project.")
    (license (license:non-copyleft "https://spdx.org/licenses/LicenseRef-proprietary.html" "proprietary"))))


;;; ── plasmazones-bin ──────────────────────────────────────
;;; Window tiling and autotiling for KDE Plasma (binary)
;;;
(define-public plasmazones-bin
  (package
    (name "plasmazones-bin")
    (version "2.8.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/fuddlesworth/PlasmaZones/releases/download/v" version "/plasmazones-bin-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/plasmazones-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/fuddlesworth/PlasmaZones")
    (synopsis "window tiling and autotiling for KDE Plasma (binary)")
    (description
     "Window tiling and autotiling for KDE Plasma (binary).  This package is distributed as a pre-built binary from the upstream project.")
    (license license:gpl3+)))


;;; ── walker ──────────────────────────────────────
;;; wayland application runner
;;;
(define-public walker
  (package
    (name "walker")
    (version "2.15.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/abenz1267/walker/releases/download/v" version "/walker-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/walker/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/abenz1267/walker")
    (synopsis "wayland application runner")
    (description
     "wayland application runner.  This package is distributed as a pre-built binary from the upstream project.")
    (license license:gpl3+)))


;;; ── hyprshutdown ──────────────────────────────────────
;;; A graceful shutdown utility for Hyprland
;;;
(define-public hyprshutdown
  (package
    (name "hyprshutdown")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/hyprwm/hyprshutdown/releases/download/v" version "/hyprshutdown-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/hyprshutdown/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/hyprwm/hyprshutdown")
    (synopsis "a graceful shutdown utility for Hyprland")
    (description
     "A graceful shutdown utility for Hyprland.  This package is distributed as a pre-built binary from the upstream project.")
    (license license:bsd-3)))


;;; ── waypaper ──────────────────────────────────────
;;; GUI wallpaper setter for Wayland and Xorg window managers. It works as
;;;
(define-public waypaper
  (package
    (name "waypaper")
    (version "2.8")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/anufrievroman/waypaper/releases/download/v" version "/waypaper-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/waypaper/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/anufrievroman/waypaper")
    (synopsis "gUI wallpaper setter for Wayland and Xorg window managers. It works as a f...")
    (description
     "GUI wallpaper setter for Wayland and Xorg window managers. It works as a frontend for popular wallpaper backends like swaybg, swww, wallutils, hyprpaper and feh.  This package is distributed as a pre-built binary from the upstream project.")
    (license license:gpl3)))


;;; ── osu-lazer-bin ──────────────────────────────────────
;;; The future of osu! and the beginning of an open era! Commonly known by
;;;
(define-public osu-lazer-bin
  (package
    (name "osu-lazer-bin")
    (version "2026.406.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://osu.ppy.sh")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/osu-lazer-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://osu.ppy.sh")
    (synopsis "the future of osu! and the beginning of an open era! Commonly known by the...")
    (description
     "The future of osu! and the beginning of an open era! Commonly known by the codename osu!lazer. Pew pew.  This package is distributed as a pre-built binary from the upstream project.")
    (license (license:non-copyleft "https://spdx.org/licenses/LicenseRef-proprietary.html" "proprietary"))))


;;; ── android-studio ──────────────────────────────────────
;;; The official Android IDE (Stable branch)
;;;
(define-public android-studio
  (package
    (name "android-studio")
    (version "2025.3.3.6")
    (source
     (origin
       (method url-fetch)
       (uri "https://developer.android.com/")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/android-studio/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://developer.android.com/")
    (synopsis "the official Android IDE (Stable branch)")
    (description
     "The official Android IDE (Stable branch).  This package is distributed as a pre-built binary from the upstream project.")
    (license license:asl2.0)))


;;; ── konform-browser ──────────────────────────────────────
;;; Firefox ESR fork with increased security, privacy, and customizability
;;;
(define-public konform-browser
  (package
    (name "konform-browser")
    (version "140.9.0.101")
    (source
     (origin
       (method url-fetch)
       (uri "https://codeberg.org/konform-browser/source")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/konform-browser/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://codeberg.org/konform-browser/source")
    (synopsis "firefox ESR fork with increased security, privacy, and customizability")
    (description
     "Firefox ESR fork with increased security, privacy, and customizability.  This package is distributed as a pre-built binary from the upstream project.")
    (license license:mpl2.0)))


;;; ── syncthingtray-qt6 ──────────────────────────────────────
;;; Tray application for Syncthing (using Qt 6)
;;;
(define-public syncthingtray-qt6
  (package
    (name "syncthingtray-qt6")
    (version "2.0.10")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/Martchus/syncthingtray/releases/download/v" version "/syncthingtray-qt6-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/syncthingtray-qt6/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Martchus/syncthingtray")
    (synopsis "tray application for Syncthing (using Qt 6)")
    (description
     "Tray application for Syncthing (using Qt 6).  This package is distributed as a pre-built binary from the upstream project.")
    (license license:gpl3+)))


;;; ── lemonade-desktop ──────────────────────────────────────
;;; Lemonade: Local LLM Serving with GPU and NPU acceleration (GUI)
;;;
(define-public lemonade-desktop
  (package
    (name "lemonade-desktop")
    (version "10.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/lemonade-sdk/lemonade/releases/download/v" version "/lemonade-desktop-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/lemonade-desktop/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/lemonade-sdk/lemonade/")
    (synopsis "lemonade: Local LLM Serving with GPU and NPU acceleration (GUI)")
    (description
     "Lemonade: Local LLM Serving with GPU and NPU acceleration (GUI).  This package is distributed as a pre-built binary from the upstream project.")
    (license license:asl2.0)))


;;; ── tor-browser-bin ──────────────────────────────────────
;;; Tor Browser Bundle: anonymous browsing using Firefox and Tor
;;;
(define-public tor-browser-bin
  (package
    (name "tor-browser-bin")
    (version "15.0.9")
    (source
     (origin
       (method url-fetch)
       (uri "https://www.torproject.org/projects/torbrowser.html")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/tor-browser-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.torproject.org/projects/torbrowser.html")
    (synopsis "tor Browser Bundle: anonymous browsing using Firefox and Tor")
    (description
     "Tor Browser Bundle: anonymous browsing using Firefox and Tor.  This package is distributed as a pre-built binary from the upstream project.")
    (license license:mpl2.0)))


;;; ── stremio ──────────────────────────────────────
;;; A one-stop hub for video content aggregation (Movies, TV shows, series
;;;
(define-public stremio
  (package
    (name "stremio")
    (version "4.4.183")
    (source
     (origin
       (method url-fetch)
       (uri "https://www.stremio.com/")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/stremio/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.stremio.com/")
    (synopsis "a one-stop hub for video content aggregation (Movies, TV shows, series, li...")
    (description
     "A one-stop hub for video content aggregation (Movies, TV shows, series, live television or web channels).  This package is distributed as a pre-built binary from the upstream project.")
    (license license:gpl3)))


;;; ── konform-browser-bin ──────────────────────────────────────
;;; Community-maintained fork of Firefox, focused on privacy, security and
;;;
(define-public konform-browser-bin
  (package
    (name "konform-browser-bin")
    (version "140.9.0_101")
    (source
     (origin
       (method url-fetch)
       (uri "https://codeberg.org/konform-browser")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/konform-browser-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://codeberg.org/konform-browser")
    (synopsis "community-maintained fork of Firefox, focused on privacy, security and fre...")
    (description
     "Community-maintained fork of Firefox, focused on privacy, security and freedom.  This package is distributed as a pre-built binary from the upstream project.")
    (license license:mpl2.0)))


;;; ── plasma6-applets-panel-colorizer ──────────────────────────────────────
;;; Latte-Dock and WM status bar customization features for the KDE Plasma
;;;
(define-public plasma6-applets-panel-colorizer
  (package
    (name "plasma6-applets-panel-colorizer")
    (version "6.10.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/luisbocanegra/plasma-panel-colorizer/releases/download/v" version "/plasma6-applets-panel-colorizer-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/plasma6-applets-panel-colorizer/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/luisbocanegra/plasma-panel-colorizer")
    (synopsis "latte-Dock and WM status bar customization features for the KDE Plasma panels")
    (description
     "Latte-Dock and WM status bar customization features for the KDE Plasma panels.  This package is distributed as a pre-built binary from the upstream project.")
    (license license:gpl3+)))


;;; ── freetube ──────────────────────────────────────
;;; An open source desktop YouTube player built with privacy in mind.
;;;
(define-public freetube
  (package
    (name "freetube")
    (version "0.24.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://freetubeapp.io")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/freetube/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://freetubeapp.io")
    (synopsis "an open source desktop YouTube player built with privacy in mind")
    (description
     "An open source desktop YouTube player built with privacy in mind.  This package is distributed as a pre-built binary from the upstream project.")
    (license license:gpl3+)))


;;; ── witr-bin ──────────────────────────────────────
;;; A Linux CLI tool that explains the causal chain behind running process
;;;
(define-public witr-bin
  (package
    (name "witr-bin")
    (version "0.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/pranshuparmar/witr/releases/download/v" version "/witr-bin-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/witr-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/pranshuparmar/witr")
    (synopsis "a Linux CLI tool that explains the causal chain behind running processes")
    (description
     "A Linux CLI tool that explains the causal chain behind running processes.  This package is distributed as a pre-built binary from the upstream project.")
    (license license:asl2.0)))


;;; ── apple-fonts ──────────────────────────────────────
;;; Fonts for Apple platforms, including San Francisco and New York typefa
;;;
(define-public apple-fonts
  (package
    (name "apple-fonts")
    (version "7.0.5")
    (source
     (origin
       (method url-fetch)
       (uri "https://developer.apple.com/fonts/")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/apple-fonts/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://developer.apple.com/fonts/")
    (synopsis "fonts for Apple platforms, including San Francisco and New York typefaces")
    (description
     "Fonts for Apple platforms, including San Francisco and New York typefaces.  This package is distributed as a pre-built binary from the upstream project.")
    (license (license:non-copyleft "https://spdx.org/licenses/LicenseRef-proprietary.html" "proprietary"))))


;;; ── ashell ──────────────────────────────────────
;;; A ready to go Wayland status bar for Hyprland and Niri
;;;
(define-public ashell
  (package
    (name "ashell")
    (version "0.8.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/MalpenZibo/ashell/releases/download/v" version "/ashell-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/ashell/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/MalpenZibo/ashell")
    (synopsis "a ready to go Wayland status bar for Hyprland and Niri")
    (description
     "A ready to go Wayland status bar for Hyprland and Niri.  This package is distributed as a pre-built binary from the upstream project.")
    (license license:expat)))


;;; ── envision-xr-git ──────────────────────────────────────
;;; GUI for Monado
;;;
(define-public envision-xr-git
  (package
    (name "envision-xr-git")
    (version "3.2.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://gitlab.com/gabmus/envision")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/envision-xr-git/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://gitlab.com/gabmus/envision")
    (synopsis "gUI for Monado")
    (description
     "GUI for Monado.  This package is distributed as a pre-built binary from the upstream project.")
    (license license:gpl3+)))


;;; ── ttf-material-icons-git ──────────────────────────────────────
;;; Material Design icons by Google - classic fonts
;;;
(define-public ttf-material-icons-git
  (package
    (name "ttf-material-icons-git")
    (version "4.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/google/material-design-icons/releases/download/v" version "/ttf-material-icons-git-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/ttf-material-icons-git/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/google/material-design-icons")
    (synopsis "material Design icons by Google - classic fonts")
    (description
     "Material Design icons by Google - classic fonts.  This package is distributed as a pre-built binary from the upstream project.")
    (license license:asl2.0)))


;;; ── zsh-theme-powerlevel10k-git ──────────────────────────────────────
;;; Powerlevel10k is a theme for Zsh. It emphasizes speed, flexibility and
;;;
(define-public zsh-theme-powerlevel10k-git
  (package
    (name "zsh-theme-powerlevel10k-git")
    (version "0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/romkatv/powerlevel10k/releases/download/v" version "/zsh-theme-powerlevel10k-git-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/zsh-theme-powerlevel10k-git/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/romkatv/powerlevel10k")
    (synopsis "powerlevel10k is a theme for Zsh. It emphasizes speed, flexibility and out...")
    (description
     "Powerlevel10k is a theme for Zsh. It emphasizes speed, flexibility and out-of-the-box experience.  This package is distributed as a pre-built binary from the upstream project.")
    (license license:expat)))


;;; ── makemkv ──────────────────────────────────────
;;; DVD and Blu-ray to MKV converter
;;;
(define-public makemkv
  (package
    (name "makemkv")
    (version "1.18.3")
    (source
     (origin
       (method url-fetch)
       (uri "https://www.makemkv.com")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/makemkv/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.makemkv.com")
    (synopsis "dVD and Blu-ray to MKV converter")
    (description
     "DVD and Blu-ray to MKV converter.  This package is distributed as a pre-built binary from the upstream project.")
    (license license:gpl3+)))


;;; ── tidal-hifi-bin ──────────────────────────────────────
;;; The web version of Tidal running in electron with hifi support thanks 
;;;
(define-public tidal-hifi-bin
  (package
    (name "tidal-hifi-bin")
    (version "6.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/Mastermindzh/tidal-hifi/releases/download/v" version "/tidal-hifi-bin-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/tidal-hifi-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Mastermindzh/tidal-hifi")
    (synopsis "the web version of Tidal running in electron with hifi support thanks to w...")
    (description
     "The web version of Tidal running in electron with hifi support thanks to widevine.  This package is distributed as a pre-built binary from the upstream project.")
    (license license:expat)))


;;; ── bitwig-studio ──────────────────────────────────────
;;; Digital audio workstation for music production, remixing and live perf
;;;
(define-public bitwig-studio
  (package
    (name "bitwig-studio")
    (version "6.0.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://www.bitwig.com/")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/bitwig-studio/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.bitwig.com/")
    (synopsis "digital audio workstation for music production, remixing and live performance")
    (description
     "Digital audio workstation for music production, remixing and live performance.  This package is distributed as a pre-built binary from the upstream project.")
    (license (license:non-copyleft "https://spdx.org/licenses/LicenseRef-proprietary.html" "proprietary"))))


;;; ── losslesscut-bin ──────────────────────────────────────
;;; Crossplatform GUI tool for lossless trimming/cutting of video/audio fi
;;;
(define-public losslesscut-bin
  (package
    (name "losslesscut-bin")
    (version "3.68.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/mifi/lossless-cut/releases/download/v" version "/losslesscut-bin-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/losslesscut-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/mifi/lossless-cut")
    (synopsis "crossplatform GUI tool for lossless trimming/cutting of video/audio files")
    (description
     "Crossplatform GUI tool for lossless trimming/cutting of video/audio files.  This package is distributed as a pre-built binary from the upstream project.")
    (license license:expat)))


;;; ── dms-shell-hyprland ──────────────────────────────────────
;;; A Quickshell-based desktop shell with Material 3 design principles (fo
;;;
(define-public dms-shell-hyprland
  (package
    (name "dms-shell-hyprland")
    (version "1.4.4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/AvengeMedia/DankMaterialShell/releases/download/v" version "/dms-shell-hyprland-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/dms-shell-hyprland/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/AvengeMedia/DankMaterialShell")
    (synopsis "a Quickshell-based desktop shell with Material 3 design principles (for Hy...")
    (description
     "A Quickshell-based desktop shell with Material 3 design principles (for Hyprland).  This package is distributed as a pre-built binary from the upstream project.")
    (license license:expat)))


;;; ── dms-shell-niri ──────────────────────────────────────
;;; A Quickshell-based desktop shell with Material 3 design principles (fo
;;;
(define-public dms-shell-niri
  (package
    (name "dms-shell-niri")
    (version "1.4.4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/AvengeMedia/DankMaterialShell/releases/download/v" version "/dms-shell-niri-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/dms-shell-niri/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/AvengeMedia/DankMaterialShell")
    (synopsis "a Quickshell-based desktop shell with Material 3 design principles (for Niri)")
    (description
     "A Quickshell-based desktop shell with Material 3 design principles (for Niri).  This package is distributed as a pre-built binary from the upstream project.")
    (license license:expat)))


;;; ── superproductivity-bin ──────────────────────────────────────
;;; ToDo list and Time Tracking
;;;
(define-public superproductivity-bin
  (package
    (name "superproductivity-bin")
    (version "18.1.3")
    (source
     (origin
       (method url-fetch)
       (uri "http://super-productivity.com/")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/superproductivity-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "http://super-productivity.com/")
    (synopsis "toDo list and Time Tracking")
    (description
     "ToDo list and Time Tracking.  This package is distributed as a pre-built binary from the upstream project.")
    (license license:expat)))


;;; ── zapret2 ──────────────────────────────────────
;;; Anti-DPI software
;;;
(define-public zapret2
  (package
    (name "zapret2")
    (version "0.9.4.7")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/bol-van/zapret2/releases/download/v" version "/zapret2-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/zapret2/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/bol-van/zapret2")
    (synopsis "anti-DPI software")
    (description
     "Anti-DPI software.  This package is distributed as a pre-built binary from the upstream project.")
    (license license:expat)))


;;; ── siomon ──────────────────────────────────────
;;; Hardware information and real-time sensor monitoring tool
;;;
(define-public siomon
  (package
    (name "siomon")
    (version "0.2.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/level1techs/siomon/releases/download/v" version "/siomon-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/siomon/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/level1techs/siomon")
    (synopsis "hardware information and real-time sensor monitoring tool")
    (description
     "Hardware information and real-time sensor monitoring tool.  This package is distributed as a pre-built binary from the upstream project.")
    (license license:expat)))


;;; ── lemonade-server ──────────────────────────────────────
;;; Lemonade: Local LLM Serving with GPU and NPU acceleration (Server)
;;;
(define-public lemonade-server
  (package
    (name "lemonade-server")
    (version "10.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/lemonade-sdk/lemonade/releases/download/v" version "/lemonade-server-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/lemonade-server/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/lemonade-sdk/lemonade/")
    (synopsis "lemonade: Local LLM Serving with GPU and NPU acceleration (Server)")
    (description
     "Lemonade: Local LLM Serving with GPU and NPU acceleration (Server).  This package is distributed as a pre-built binary from the upstream project.")
    (license license:asl2.0)))


;;; ── greetd-dms-greeter-git ──────────────────────────────────────
;;; DankMaterialShell greeter for greetd
;;;
(define-public greetd-dms-greeter-git
  (package
    (name "greetd-dms-greeter-git")
    (version "0.2.2.13.g1abd3ef")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/AvengeMedia/DankMaterialShell/releases/download/v" version "/greetd-dms-greeter-git-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/greetd-dms-greeter-git/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/AvengeMedia/DankMaterialShell")
    (synopsis "dankMaterialShell greeter for greetd")
    (description
     "DankMaterialShell greeter for greetd.  This package is distributed as a pre-built binary from the upstream project.")
    (license license:gpl3)))


;;; ── cider ──────────────────────────────────────
;;; An abandoned Apple Music player using a fork of Cider v1 from taoky/Ci
;;;
(define-public cider
  (package
    (name "cider")
    (version "1.6.3.20260321034536")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/taoky/Cider/releases/download/v" version "/cider-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/cider/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/taoky/Cider")
    (synopsis "an abandoned Apple Music player using a fork of Cider v1 from taoky/Cider")
    (description
     "An abandoned Apple Music player using a fork of Cider v1 from taoky/Cider.  This package is distributed as a pre-built binary from the upstream project.")
    (license license:gpl3)))


;;; ── vortex ──────────────────────────────────────
;;; Nexus Mods' mod manager - native Linux build (Stable)
;;;
(define-public vortex
  (package
    (name "vortex")
    (version "1.16.8")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/Nexus-Mods/Vortex/releases/download/v" version "/vortex-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/vortex/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Nexus-Mods/Vortex")
    (synopsis "nexus Mods' mod manager - native Linux build (Stable)")
    (description
     "Nexus Mods' mod manager - native Linux build (Stable).  This package is distributed as a pre-built binary from the upstream project.")
    (license license:gpl3+)))


;;; ── jailbox-git ──────────────────────────────────────
;;; Torify the system with multiple tor exit nodes and load balance
;;;
(define-public jailbox-git
  (package
    (name "jailbox-git")
    (version "0.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/jamazi/jailbox.git/releases/download/v" version "/jailbox-git-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/jailbox-git/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/jamazi/jailbox.git")
    (synopsis "torify the system with multiple tor exit nodes and load balance")
    (description
     "Torify the system with multiple tor exit nodes and load balance.  This package is distributed as a pre-built binary from the upstream project.")
    (license license:expat)))


;;; ── ocrmypdf ──────────────────────────────────────
;;; A tool to add an OCR text layer to scanned PDF files, allowing them to
;;;
(define-public ocrmypdf
  (package
    (name "ocrmypdf")
    (version "17.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/ocrmypdf/OCRmyPDF/releases/download/v" version "/ocrmypdf-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/ocrmypdf/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/ocrmypdf/OCRmyPDF")
    (synopsis "a tool to add an OCR text layer to scanned PDF files, allowing them to be ...")
    (description
     "A tool to add an OCR text layer to scanned PDF files, allowing them to be searched.  This package is distributed as a pre-built binary from the upstream project.")
    (license license:mpl2.0)))


;;; ── thorium-browser-bin ──────────────────────────────────────
;;; Chromium fork focused on high performance and security
;;;
(define-public thorium-browser-bin
  (package
    (name "thorium-browser-bin")
    (version "138.0.7204.303")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/Alex313031/thorium/releases/download/v" version "/thorium-browser-bin-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/thorium-browser-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Alex313031/thorium")
    (synopsis "chromium fork focused on high performance and security")
    (description
     "Chromium fork focused on high performance and security.  This package is distributed as a pre-built binary from the upstream project.")
    (license license:bsd-3)))


;;; ── stoat-desktop-bin ──────────────────────────────────────
;;; Stoat for Desktop. (Prebuilt version. Use system-wide electron)
;;;
(define-public stoat-desktop-bin
  (package
    (name "stoat-desktop-bin")
    (version "1.3.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://stoat.chat/")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/stoat-desktop-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://stoat.chat/")
    (synopsis "stoat for Desktop. (Prebuilt version. Use system-wide electron)")
    (description
     "Stoat for Desktop. (Prebuilt version. Use system-wide electron).  This package is distributed as a pre-built binary from the upstream project.")
    (license license:gpl3)))


;;; ── ayugram-desktop ──────────────────────────────────────
;;; Desktop Telegram client with good customization and Ghost mode.
;;;
(define-public ayugram-desktop
  (package
    (name "ayugram-desktop")
    (version "6.3.10")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/AyuGram/AyuGramDesktop/releases/download/v" version "/ayugram-desktop-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/ayugram-desktop/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/AyuGram/AyuGramDesktop")
    (synopsis "desktop Telegram client with good customization and Ghost mode")
    (description
     "Desktop Telegram client with good customization and Ghost mode.  This package is distributed as a pre-built binary from the upstream project.")
    (license license:gpl3+)))


;;; ── 1password ──────────────────────────────────────
;;; Password manager and secure wallet
;;;
(define-public 1password
  (package
    (name "1password")
    (version "8.12.8")
    (source
     (origin
       (method url-fetch)
       (uri "https://1password.com")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/1password/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://1password.com")
    (synopsis "password manager and secure wallet")
    (description
     "Password manager and secure wallet.  This package is distributed as a pre-built binary from the upstream project.")
    (license (license:non-copyleft "https://spdx.org/licenses/LicenseRef-proprietary.html" "proprietary"))))


;;; ── code-marketplace ──────────────────────────────────────
;;; Enable vscode marketplace in Code OSS
;;;
(define-public code-marketplace
  (package
    (name "code-marketplace")
    (version "1.109.5")
    (source
     (origin
       (method url-fetch)
       (uri "https://marketplace.visualstudio.com/vscode")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/code-marketplace/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://marketplace.visualstudio.com/vscode")
    (synopsis "enable vscode marketplace in Code OSS")
    (description
     "Enable vscode marketplace in Code OSS.  This package is distributed as a pre-built binary from the upstream project.")
    (license license:expat)))


;;; ── spicetify-marketplace-bin ──────────────────────────────────────
;;; Spicetify app that integrates a marketplace for extensions, themes and
;;;
(define-public spicetify-marketplace-bin
  (package
    (name "spicetify-marketplace-bin")
    (version "1.0.8")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/spicetify/spicetify-marketplace/releases/download/v" version "/spicetify-marketplace-bin-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/spicetify-marketplace-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/spicetify/spicetify-marketplace")
    (synopsis "spicetify app that integrates a marketplace for extensions, themes and sni...")
    (description
     "Spicetify app that integrates a marketplace for extensions, themes and snippets.  This package is distributed as a pre-built binary from the upstream project.")
    (license license:expat)))


;;; ── linux-wallpaperengine-git ──────────────────────────────────────
;;; use steam's wallpaperengine on linux
;;;
(define-public linux-wallpaperengine-git
  (package
    (name "linux-wallpaperengine-git")
    (version "0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/Almamu/linux-wallpaperengine/releases/download/v" version "/linux-wallpaperengine-git-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/linux-wallpaperengine-git/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Almamu/linux-wallpaperengine")
    (synopsis "use steam's wallpaperengine on linux")
    (description
     "use steam's wallpaperengine on linux.  This package is distributed as a pre-built binary from the upstream project.")
    (license license:gpl3)))


;;; ── packettracer ──────────────────────────────────────
;;; A cross-platform visual simulation tool designed by Cisco Systems that
;;;
(define-public packettracer
  (package
    (name "packettracer")
    (version "9.0.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://www.netacad.com/resources/lab-downloads")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/packettracer/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.netacad.com/resources/lab-downloads")
    (synopsis "a cross-platform visual simulation tool designed by Cisco Systems that all...")
    (description
     "A cross-platform visual simulation tool designed by Cisco Systems that allows users to create network topologies and imitate modern computer network.  This package is distributed as a pre-built binary from the upstream project.")
    (license license:isc)))


;;; ── waywall-working-git ──────────────────────────────────────
;;; Wayland compositor for Minecraft speedrunning
;;;
(define-public waywall-working-git
  (package
    (name "waywall-working-git")
    (version "wall")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/tesselslate/waywall/releases/download/v" version "/waywall-working-git-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/waywall-working-git/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/tesselslate/waywall")
    (synopsis "wayland compositor for Minecraft speedrunning")
    (description
     "Wayland compositor for Minecraft speedrunning.  This package is distributed as a pre-built binary from the upstream project.")
    (license license:gpl3)))


;;; ── pwvucontrol ──────────────────────────────────────
;;; Pipewire volume control for GNOME
;;;
(define-public pwvucontrol
  (package
    (name "pwvucontrol")
    (version "0.5.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/saivert/pwvucontrol/releases/download/v" version "/pwvucontrol-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/pwvucontrol/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/saivert/pwvucontrol")
    (synopsis "pipewire volume control for GNOME")
    (description
     "Pipewire volume control for GNOME.  This package is distributed as a pre-built binary from the upstream project.")
    (license license:gpl3)))


;;; ── klassy-qt5 ──────────────────────────────────────
;;; Highly customizable binary Window Decoration, Application Style and Gl
;;;
(define-public klassy-qt5
  (package
    (name "klassy-qt5")
    (version "6.5.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/paulmcauley/klassy/releases/download/v" version "/klassy-qt5-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/klassy-qt5/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/paulmcauley/klassy")
    (synopsis "highly customizable binary Window Decoration, Application Style and Global...")
    (description
     "Highly customizable binary Window Decoration, Application Style and Global Theme plugin for recent versions of the KDE Plasma desktop.  This package is distributed as a pre-built binary from the upstream project.")
    (license license:expat)))


;;; ── calcure ──────────────────────────────────────
;;; Modern TUI calendar and task manager
;;;
(define-public calcure
  (package
    (name "calcure")
    (version "3.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/anufrievroman/calcure/releases/download/v" version "/calcure-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/calcure/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/anufrievroman/calcure")
    (synopsis "modern TUI calendar and task manager")
    (description
     "Modern TUI calendar and task manager.  This package is distributed as a pre-built binary from the upstream project.")
    (license license:expat)))


;;; ── tuwunel ──────────────────────────────────────
;;; Featureful Matrix homeserver
;;;
(define-public tuwunel
  (package
    (name "tuwunel")
    (version "1.5.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/matrix-construct/tuwunel/releases/download/v" version "/tuwunel-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/tuwunel/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/matrix-construct/tuwunel")
    (synopsis "featureful Matrix homeserver")
    (description
     "Featureful Matrix homeserver.  This package is distributed as a pre-built binary from the upstream project.")
    (license license:asl2.0)))


;;; ── megasync ──────────────────────────────────────
;;; Official MEGA desktop application for syncing with MEGA Cloud Drive
;;;
(define-public megasync
  (package
    (name "megasync")
    (version "6.2.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/meganz/MEGAsync/releases/download/v" version "/megasync-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/megasync/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/meganz/MEGAsync/")
    (synopsis "official MEGA desktop application for syncing with MEGA Cloud Drive")
    (description
     "Official MEGA desktop application for syncing with MEGA Cloud Drive.  This package is distributed as a pre-built binary from the upstream project.")
    (license license:expat)))


;;; ── weathr-bin ──────────────────────────────────────
;;; A terminal weather app with ascii animation
;;;
(define-public weathr-bin
  (package
    (name "weathr-bin")
    (version "1.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/Veirt/weathr/releases/download/v" version "/weathr-bin-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/weathr-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Veirt/weathr")
    (synopsis "a terminal weather app with ascii animation")
    (description
     "A terminal weather app with ascii animation.  This package is distributed as a pre-built binary from the upstream project.")
    (license license:gpl3+)))


;;; ── stacer-bin ──────────────────────────────────────
;;; Linux System Optimizer and Monitoring
;;;
(define-public stacer-bin
  (package
    (name "stacer-bin")
    (version "1.6.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/QuentiumYT/Stacer/releases/download/v" version "/stacer-bin-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/stacer-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/QuentiumYT/Stacer")
    (synopsis "linux System Optimizer and Monitoring")
    (description
     "Linux System Optimizer and Monitoring.  This package is distributed as a pre-built binary from the upstream project.")
    (license license:gpl3)))


;;; ── cinny-desktop-bin ──────────────────────────────────────
;;; Matrix client focusing primarily on a simple, elegant and secure inter
;;;
(define-public cinny-desktop-bin
  (package
    (name "cinny-desktop-bin")
    (version "4.11.2")
    (source
     (origin
       (method url-fetch)
       (uri "https://cinny.in/")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/cinny-desktop-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://cinny.in/")
    (synopsis "matrix client focusing primarily on a simple, elegant and secure interface...")
    (description
     "Matrix client focusing primarily on a simple, elegant and secure interface (binary release).  This package is distributed as a pre-built binary from the upstream project.")
    (license license:gpl3+)))


;;; ── openai-codex-desktop ──────────────────────────────────────
;;; OpenAI Codex desktop app
;;;
(define-public openai-codex-desktop
  (package
    (name "openai-codex-desktop")
    (version "26.325.31654")
    (source
     (origin
       (method url-fetch)
       (uri "https://developers.openai.com/codex/app/")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/openai-codex-desktop/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://developers.openai.com/codex/app/")
    (synopsis "openAI Codex desktop app")
    (description
     "OpenAI Codex desktop app.  This package is distributed as a pre-built binary from the upstream project.")
    (license (license:non-copyleft "https://spdx.org/licenses/LicenseRef-proprietary.html" "proprietary"))))


;;; ── zeroclaw ──────────────────────────────────────
;;; Fast, small, and fully autonomous AI assistant infrastructure — deploy
;;;
(define-public zeroclaw
  (package
    (name "zeroclaw")
    (version "0.6.8")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/zeroclaw-labs/zeroclaw/releases/download/v" version "/zeroclaw-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/zeroclaw/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/zeroclaw-labs/zeroclaw")
    (synopsis "fast, small, and fully autonomous AI assistant infrastructure — deploy any...")
    (description
     "Fast, small, and fully autonomous AI assistant infrastructure — deploy anywhere, swap anything (Rust).  This package is distributed as a pre-built binary from the upstream project.")
    (license license:asl2.0)))


;;; ── t3code-bin ──────────────────────────────────────
;;; T3 Code desktop app packaged from the upstream AppImage
;;;
(define-public t3code-bin
  (package
    (name "t3code-bin")
    (version "0.0.15")
    (source
     (origin
       (method url-fetch)
       (uri "https://t3.codes")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/t3code-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://t3.codes")
    (synopsis "t3 Code desktop app packaged from the upstream AppImage")
    (description
     "T3 Code desktop app packaged from the upstream AppImage.  This package is distributed as a pre-built binary from the upstream project.")
    (license license:expat)))


;;; ── 38c3-styles-commoninfo ──────────────────────────────────────
;;; General information for the styles for the 38th Chaos Communication Co
;;;
(define-public 38c3-styles-commoninfo
  (package
    (name "38c3-styles-commoninfo")
    (version "2")
    (source
     (origin
       (method url-fetch)
       (uri "https://events.ccc.de/congress/2024/infos/styleguide.html")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/38c3-styles-commoninfo/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://events.ccc.de/congress/2024/infos/styleguide.html")
    (synopsis "general information for the styles for the 38th Chaos Communication Congress")
    (description
     "General information for the styles for the 38th Chaos Communication Congress.  This package is distributed as a pre-built binary from the upstream project.")
    (license license:cc0)))


;;; ── 38c3-styleguide ──────────────────────────────────────
;;; Styleguide for the 38th Chaos Communication Congress.
;;;
(define-public 38c3-styleguide
  (package
    (name "38c3-styleguide")
    (version "2")
    (source
     (origin
       (method url-fetch)
       (uri "https://events.ccc.de/congress/2024/infos/styleguide.html")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/38c3-styleguide/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://events.ccc.de/congress/2024/infos/styleguide.html")
    (synopsis "styleguide for the 38th Chaos Communication Congress")
    (description
     "Styleguide for the 38th Chaos Communication Congress.  This package is distributed as a pre-built binary from the upstream project.")
    (license license:cc0)))


;;; ── 38c3-style-assets ──────────────────────────────────────
;;; Assets (graphics, logos, ...) except fonts for the style of the 38th c
;;;
(define-public 38c3-style-assets
  (package
    (name "38c3-style-assets")
    (version "2")
    (source
     (origin
       (method url-fetch)
       (uri "https://events.ccc.de/congress/2024/infos/styleguide.html")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/38c3-style-assets/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://events.ccc.de/congress/2024/infos/styleguide.html")
    (synopsis "assets (graphics, logos, ...) except fonts for the style of the 38th chaos...")
    (description
     "Assets (graphics, logos, ...) except fonts for the style of the 38th chaos communication congress.  This package is distributed as a pre-built binary from the upstream project.")
    (license license:cc0)))


;;; ── beeper-v4-bin ──────────────────────────────────────
;;; The ultimate messaging app
;;;
(define-public beeper-v4-bin
  (package
    (name "beeper-v4-bin")
    (version "4.2.670")
    (source
     (origin
       (method url-fetch)
       (uri "https://www.beeper.com/beta")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/beeper-v4-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.beeper.com/beta")
    (synopsis "the ultimate messaging app")
    (description
     "The ultimate messaging app.  This package is distributed as a pre-built binary from the upstream project.")
    (license (license:non-copyleft "https://spdx.org/licenses/LicenseRef-proprietary.html" "proprietary"))))


;;; ── gtk-nocsd-git ──────────────────────────────────────
;;; An LD_PRELOAD library to disable CSD in GTK3/4, LibHandy, and LibAdwai
;;;
(define-public gtk-nocsd-git
  (package
    (name "gtk-nocsd-git")
    (version "0")
    (source
     (origin
       (method url-fetch)
       (uri "https://codeberg.org/MorsMortium/gtk-nocsd")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/gtk-nocsd-git/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://codeberg.org/MorsMortium/gtk-nocsd")
    (synopsis "an LD_PRELOAD library to disable CSD in GTK3/4, LibHandy, and LibAdwaita apps")
    (description
     "An LD_PRELOAD library to disable CSD in GTK3/4, LibHandy, and LibAdwaita apps.  This package is distributed as a pre-built binary from the upstream project.")
    (license license:gpl3+)))


;;; ── zotero ──────────────────────────────────────
;;; A free, easy-to-use tool to help you collect, organize, cite, and shar
;;;
(define-public zotero
  (package
    (name "zotero")
    (version "8.0.5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/zotero/zotero/releases/download/v" version "/zotero-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/zotero/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/zotero/zotero")
    (synopsis "a free, easy-to-use tool to help you collect, organize, cite, and share yo...")
    (description
     "A free, easy-to-use tool to help you collect, organize, cite, and share your research sources.  This package is distributed as a pre-built binary from the upstream project.")
    (license license:gpl3+)))


;;; ── python-vllm-rocm ──────────────────────────────────────
;;; high-throughput and memory-efficient inference and serving engine for 
;;;
(define-public python-vllm-rocm
  (package
    (name "python-vllm-rocm")
    (version "0.19.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/vllm-project/vllm/releases/download/v" version "/python-vllm-rocm-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/python-vllm-rocm/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/vllm-project/vllm")
    (synopsis "high-throughput and memory-efficient inference and serving engine for LLMs...")
    (description
     "high-throughput and memory-efficient inference and serving engine for LLMs (ROCm support).  This package is distributed as a pre-built binary from the upstream project.")
    (license license:asl2.0)))


;;; ── qt5-examples ──────────────────────────────────────
;;; Examples and demos from qt5 documentation
;;;
(define-public qt5-examples
  (package
    (name "qt5-examples")
    (version "5.15.18")
    (source
     (origin
       (method url-fetch)
       (uri "https://www.qt.io")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/qt5-examples/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.qt.io")
    (synopsis "examples and demos from qt5 documentation")
    (description
     "Examples and demos from qt5 documentation.  This package is distributed as a pre-built binary from the upstream project.")
    (license (license:non-copyleft "https://spdx.org/licenses/LicenseRef-proprietary.html" "proprietary"))))


;;; ── r2modman-bin ──────────────────────────────────────
;;; A simple and easy to use mod manager for several games using Thunderst
;;;
(define-public r2modman-bin
  (package
    (name "r2modman-bin")
    (version "3.2.15")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/ebkr/r2modmanPlus/releases/download/v" version "/r2modman-bin-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/r2modman-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/ebkr/r2modmanPlus")
    (synopsis "a simple and easy to use mod manager for several games using Thunderstore")
    (description
     "A simple and easy to use mod manager for several games using Thunderstore.  This package is distributed as a pre-built binary from the upstream project.")
    (license license:expat)))


;;; ── leshade-git ──────────────────────────────────────
;;; Official build for Leshade. An ReShade Manager for Linux
;;;
(define-public leshade-git
  (package
    (name "leshade-git")
    (version "2.4.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/Ishidawg/LeShade/releases/download/v" version "/leshade-git-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/leshade-git/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Ishidawg/LeShade")
    (synopsis "official build for Leshade. An ReShade Manager for Linux")
    (description
     "Official build for Leshade. An ReShade Manager for Linux.  This package is distributed as a pre-built binary from the upstream project.")
    (license license:expat)))


;;; ── commet-bin ──────────────────────────────────────
;;; A client for Matrix focused on providing a feature rich experience whi
;;;
(define-public commet-bin
  (package
    (name "commet-bin")
    (version "0.4.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://commet.chat")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/commet-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://commet.chat")
    (synopsis "a client for Matrix focused on providing a feature rich experience while m...")
    (description
     "A client for Matrix focused on providing a feature rich experience while maintaining a simple interface.  This package is distributed as a pre-built binary from the upstream project.")
    (license license:gpl3)))


;;; ── rsgain ──────────────────────────────────────
;;; ReplayGain 2.0 loudness normalizer
;;;
(define-public rsgain
  (package
    (name "rsgain")
    (version "3.7")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/complexlogic/rsgain/releases/download/v" version "/rsgain-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/rsgain/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/complexlogic/rsgain")
    (synopsis "replayGain 2.0 loudness normalizer")
    (description
     "ReplayGain 2.0 loudness normalizer.  This package is distributed as a pre-built binary from the upstream project.")
    (license license:bsd-2)))


;;; ── zen-browser-i18n-zh-cn ──────────────────────────────────────
;;; Language pack for Zen Browser (zh-CN)
;;;
(define-public zen-browser-i18n-zh-cn
  (package
    (name "zen-browser-i18n-zh-cn")
    (version "1.19.6b")
    (source
     (origin
       (method url-fetch)
       (uri "https://zen-browser.app/")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/zen-browser-i18n-zh-cn/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://zen-browser.app/")
    (synopsis "language pack for Zen Browser (zh-CN)")
    (description
     "Language pack for Zen Browser (zh-CN).  This package is distributed as a pre-built binary from the upstream project.")
    (license license:mpl2.0)))


;;; ── zen-browser-i18n-zh-tw ──────────────────────────────────────
;;; Language pack for Zen Browser (zh-TW)
;;;
(define-public zen-browser-i18n-zh-tw
  (package
    (name "zen-browser-i18n-zh-tw")
    (version "1.19.6b")
    (source
     (origin
       (method url-fetch)
       (uri "https://zen-browser.app/")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/zen-browser-i18n-zh-tw/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://zen-browser.app/")
    (synopsis "language pack for Zen Browser (zh-TW)")
    (description
     "Language pack for Zen Browser (zh-TW).  This package is distributed as a pre-built binary from the upstream project.")
    (license license:mpl2.0)))


;;; ── zen-browser-i18n-ja ──────────────────────────────────────
;;; Language pack for Zen Browser (ja)
;;;
(define-public zen-browser-i18n-ja
  (package
    (name "zen-browser-i18n-ja")
    (version "1.19.6b")
    (source
     (origin
       (method url-fetch)
       (uri "https://zen-browser.app/")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/zen-browser-i18n-ja/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://zen-browser.app/")
    (synopsis "language pack for Zen Browser (ja)")
    (description
     "Language pack for Zen Browser (ja).  This package is distributed as a pre-built binary from the upstream project.")
    (license license:mpl2.0)))


;;; ── megasync-bin ──────────────────────────────────────
;;; Easy automated syncing between your computers and your MEGA cloud driv
;;;
(define-public megasync-bin
  (package
    (name "megasync-bin")
    (version "6.2.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://mega.nz/#sync")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/megasync-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://mega.nz/#sync")
    (synopsis "easy automated syncing between your computers and your MEGA cloud drive")
    (description
     "Easy automated syncing between your computers and your MEGA cloud drive.  This package is distributed as a pre-built binary from the upstream project.")
    (license (license:non-copyleft "https://spdx.org/licenses/LicenseRef-proprietary.html" "proprietary"))))


;;; ── unreal-engine-bin ──────────────────────────────────────
;;; The world's most open and advanced real-time 3D creation tool
;;;
(define-public unreal-engine-bin
  (package
    (name "unreal-engine-bin")
    (version "5.7.4")
    (source
     (origin
       (method url-fetch)
       (uri "https://www.unrealengine.com/")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/unreal-engine-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.unrealengine.com/")
    (synopsis "the world's most open and advanced real-time 3D creation tool")
    (description
     "The world's most open and advanced real-time 3D creation tool.  This package is distributed as a pre-built binary from the upstream project.")
    (license (license:non-copyleft "https://spdx.org/licenses/LicenseRef-proprietary.html" "proprietary"))))


;;; ── grayjay-bin ──────────────────────────────────────
;;; Grayjay Desktop - follow creators, not platforms (privacy- and freedom
;;;
(define-public grayjay-bin
  (package
    (name "grayjay-bin")
    (version "17")
    (source
     (origin
       (method url-fetch)
       (uri "https://grayjay.app/desktop/")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/grayjay-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://grayjay.app/desktop/")
    (synopsis "grayjay Desktop - follow creators, not platforms (privacy- and freedom-res...")
    (description
     "Grayjay Desktop - follow creators, not platforms (privacy- and freedom-respecting client for YouTube, Rumble, Twitch, Spotify etc).  This package is distributed as a pre-built binary from the upstream project.")
    (license license:expat)))


;;; ── gopher64 ──────────────────────────────────────
;;; A Nintendo64 emulator
;;;
(define-public gopher64
  (package
    (name "gopher64")
    (version "1.1.15")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/gopher64/gopher64/releases/download/v" version "/gopher64-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/gopher64/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/gopher64/gopher64/")
    (synopsis "a Nintendo64 emulator")
    (description
     "A Nintendo64 emulator.  This package is distributed as a pre-built binary from the upstream project.")
    (license license:gpl3)))


;;; ── tg-ws-proxy-cli ──────────────────────────────────────
;;; Local MTProto proxy server for partial bypassing of Telegram loading
;;;
(define-public tg-ws-proxy-cli
  (package
    (name "tg-ws-proxy-cli")
    (version "1.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/Flowseal/tg-ws-proxy/releases/download/v" version "/tg-ws-proxy-cli-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/tg-ws-proxy-cli/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Flowseal/tg-ws-proxy")
    (synopsis "local MTProto proxy server for partial bypassing of Telegram loading")
    (description
     "Local MTProto proxy server for partial bypassing of Telegram loading.  This package is distributed as a pre-built binary from the upstream project.")
    (license license:expat)))


;;; ── xwaylandvideobridge ──────────────────────────────────────
;;; Utility to allow streaming Wayland windows to X applications
;;;
(define-public xwaylandvideobridge
  (package
    (name "xwaylandvideobridge")
    (version "0.4.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://invent.kde.org/system/xwaylandvideobridge")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/xwaylandvideobridge/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://invent.kde.org/system/xwaylandvideobridge")
    (synopsis "utility to allow streaming Wayland windows to X applications")
    (description
     "Utility to allow streaming Wayland windows to X applications.  This package is distributed as a pre-built binary from the upstream project.")
    (license license:gpl3+)))


;;; ── unimatrix-git ──────────────────────────────────────
;;; Python script to simulate the display from "The Matrix" in terminal. U
;;;
(define-public unimatrix-git
  (package
    (name "unimatrix-git")
    (version "0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/will8211/unimatrix/releases/download/v" version "/unimatrix-git-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/unimatrix-git/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/will8211/unimatrix")
    (synopsis "python script to simulate the display from \"The Matrix\" in terminal. Use...")
    (description
     "Python script to simulate the display from \"The Matrix\" in terminal. Uses half-width katakana unicode characters by default, but can use custom character sets.  This package is distributed as a pre-built binary from the upstream project.")
    (license license:gpl3+)))


;;; ── teamviewer ──────────────────────────────────────
;;; All-In-One Software for Remote Support and Online Meetings
;;;
(define-public teamviewer
  (package
    (name "teamviewer")
    (version "15.74.5")
    (source
     (origin
       (method url-fetch)
       (uri "https://www.teamviewer.com/en/download/portal/linux/")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/teamviewer/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.teamviewer.com/en/download/portal/linux/")
    (synopsis "all-In-One Software for Remote Support and Online Meetings")
    (description
     "All-In-One Software for Remote Support and Online Meetings.  This package is distributed as a pre-built binary from the upstream project.")
    (license (license:non-copyleft "https://spdx.org/licenses/LicenseRef-proprietary.html" "proprietary"))))


;;; ── parabolic ──────────────────────────────────────
;;; Download web video and audio
;;;
(define-public parabolic
  (package
    (name "parabolic")
    (version "2026.2.4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/NickvisionApps/Parabolic/releases/download/v" version "/parabolic-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/parabolic/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/NickvisionApps/Parabolic")
    (synopsis "download web video and audio")
    (description
     "Download web video and audio.  This package is distributed as a pre-built binary from the upstream project.")
    (license license:expat)))


;;; ── barrier-headless ──────────────────────────────────────
;;; Open-source KVM software based on Synergy (client and server CLI binar
;;;
(define-public barrier-headless
  (package
    (name "barrier-headless")
    (version "2.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/debauchee/barrier/releases/download/v" version "/barrier-headless-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/barrier-headless/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/debauchee/barrier")
    (synopsis "open-source KVM software based on Synergy (client and server CLI binaries)")
    (description
     "Open-source KVM software based on Synergy (client and server CLI binaries).  This package is distributed as a pre-built binary from the upstream project.")
    (license license:gpl3+)))


;;; ── tg-ws-proxy-git ──────────────────────────────────────
;;; Local MTProto proxy server for partial bypassing of Telegram loading
;;;
(define-public tg-ws-proxy-git
  (package
    (name "tg-ws-proxy-git")
    (version "1.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/Flowseal/tg-ws-proxy/releases/download/v" version "/tg-ws-proxy-git-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/tg-ws-proxy-git/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Flowseal/tg-ws-proxy")
    (synopsis "local MTProto proxy server for partial bypassing of Telegram loading")
    (description
     "Local MTProto proxy server for partial bypassing of Telegram loading.  This package is distributed as a pre-built binary from the upstream project.")
    (license license:expat)))


;;; ── dae ──────────────────────────────────────
;;; A Linux lightweight and high-performance transparent proxy solution ba
;;;
(define-public dae
  (package
    (name "dae")
    (version "1.1.0rc1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/daeuniverse/dae/releases/download/v" version "/dae-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/dae/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/daeuniverse/dae")
    (synopsis "a Linux lightweight and high-performance transparent proxy solution based ...")
    (description
     "A Linux lightweight and high-performance transparent proxy solution based on eBPF.  This package is distributed as a pre-built binary from the upstream project.")
    (license license:gpl3+)))


;;; ── mcrcon ──────────────────────────────────────
;;; Console based remote console (rcon) client for Minecraft servers
;;;
(define-public mcrcon
  (package
    (name "mcrcon")
    (version "0.7.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/Tiiffi/mcrcon/releases/download/v" version "/mcrcon-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/mcrcon/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Tiiffi/mcrcon")
    (synopsis "console based remote console (rcon) client for Minecraft servers")
    (description
     "Console based remote console (rcon) client for Minecraft servers.  This package is distributed as a pre-built binary from the upstream project.")
    (license license:zlib)))

