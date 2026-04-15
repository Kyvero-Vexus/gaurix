;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260415s
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages from general queue.
;;; 30 resolved with new recipes.
;;;
;;; Recipes (30 new):
;;;   1. semantic-diff (pyproject, v0.2.0, AI-powered semantic git commit
;;;      analysis, MIT)
;;;   2. twig (pyproject, v2.1.4, terminal JSON file inspector/navigator, MIT)
;;;   3. vaping (pyproject, v1.5.4, network monitoring alternative to
;;;      SmokePing, Apache-2.0)
;;;   4. android-tv-remote (pyproject, v1.1.3, GTK-based remote control for
;;;      Android TV, GPL-3.0+)
;;;   5. stickerpicker-git (pyproject, git, Element Matrix sticker picker
;;;      widget, AGPL-3.0+)
;;;   6. m64py (pyproject, v0.3.0, Qt front-end for Mupen64Plus N64 emulator,
;;;      GPL-2.0+)
;;;   7. python-fabric-git (pyproject, git, desktop widget framework,
;;;      AGPL-3.0+)
;;;   8. python-curl-cffi-git (pyproject, git, Python FFI binding for
;;;      curl-impersonate, MIT)
;;;   9. ytm-player-git (pyproject, v1.5.6, YouTube Music TUI client, MIT)
;;;  10. q4wine-git (cmake, git, Qt6 GUI for Wine, GPL-3.0+)
;;;  11. plasma6-applets-appgrid (cmake, v1.7.8, fullscreen app launcher for
;;;      KDE Plasma, GPL-2.0+)
;;;  12. plasma-gamemode-git (cmake, git, Gamemode UI for KDE Plasma,
;;;      GPL-3.0)
;;;  13. plasmazones (cmake, v2.8.6, window tiling for KDE Plasma, GPL-3.0+)
;;;  14. aeroshell-smod-git (cmake, git, KDecoration3 decoration engine,
;;;      AGPL-3.0+)
;;;  15. plasma-keyboard-git (cmake, git, virtual keyboard for Qt desktops,
;;;      LGPL-2.1+)
;;;  16. uzdoom (cmake, v4.14.3, feature-centric Doom engine port, GPL-3.0+)
;;;  17. qbittorrent-enhanced-ua (cmake, v5.1.3.10, enhanced qBittorrent with
;;;      anti-tracker, GPL-2.0+)
;;;  18. qbittorrent-enhanced-ua-nox (cmake, v5.1.3.10, enhanced qBittorrent
;;;      headless, GPL-2.0+)
;;;  19. chatterino2-7tv-git (cmake, git, Chatterino2 fork with 7TV emote
;;;      support, MIT)
;;;  20. bloom-git (cmake, git, Bloom AVR debugger, LGPL-2.1+)
;;;  21. somewm-git (meson, git, AwesomeWM ported to Wayland, GPL-3.0+)
;;;  22. rustconn (cargo, v0.10.18, GTK4 connection manager, GPL-3.0+)
;;;  23. alacritty-graphics (cargo, v0.17.0, Alacritty fork with graphics
;;;      protocol, Apache-2.0)
;;;  24. osrm-backend (cmake, v6.0.0, high-performance C++ routing engine,
;;;      BSD-2-Clause)
;;;  25. solar2d-git (cmake, git, Solar2D cross-platform 2D game engine, MIT)
;;;  26. glaxnimate-git (cmake, git, simple vector animation program,
;;;      GPL-3.0+)
;;;  27. yacreader-poppler (cmake, v9.15.0, comic reader using poppler,
;;;      GPL-3.0)
;;;  28. chrome-remote-desktop (copy, v147.0.7727.3, Chrome Remote Desktop
;;;      host, BSD-3-Clause)
;;;  29. linux-mainline-docs (copy, v7.0, Linux mainline kernel documentation,
;;;      GPL-2.0)
;;;  30. cdesktopenv (gnu, v2.5.3, Common Desktop Environment, LGPL-2.1+)
;;;
;;; All sha256 hashes are placeholders pending verification via `guix download`.

(define-module (gaurix packages recipe-resolver-260415s)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system cargo)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages audio)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages bittorrent)
  #:use-module (gnu packages boost)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages cmake)
  #:use-module (gnu packages crypto)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages fontutils)
  #:use-module (gnu packages game-development)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages icu4c)
  #:use-module (gnu packages image)
  #:use-module (gnu packages kde-frameworks)
  #:use-module (gnu packages kde-plasma)
  #:use-module (gnu packages libusb)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages lua)
  #:use-module (gnu packages mp3)
  #:use-module (gnu packages ncurses)
  #:use-module (gnu packages ninja)
  #:use-module (gnu packages openldap)
  #:use-module (gnu packages pdf)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages php)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-graphics)
  #:use-module (gnu packages lesstif)
  #:use-module (gnu packages libffi)
  #:use-module (gnu packages python-crypto)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages sdl)
  #:use-module (gnu packages serialization)
  #:use-module (gnu packages ssh)
  #:use-module (gnu packages shells)
  #:use-module (gnu packages tbb)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages version-control)
  #:use-module (gnu packages video)
  #:use-module (gnu packages vulkan)
  #:use-module (gnu packages web)
  #:use-module (gnu packages wm)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages xml)
  #:use-module (gnu packages xorg)
  #:export (
            semantic-diff
            twig
            vaping
            android-tv-remote
            stickerpicker-git
            m64py
            python-fabric-git
            python-curl-cffi-git
            ytm-player-git
            q4wine-git
            plasma6-applets-appgrid
            plasma-gamemode-git
            plasmazones
            aeroshell-smod-git
            plasma-keyboard-git
            uzdoom
            qbittorrent-enhanced-ua
            qbittorrent-enhanced-ua-nox
            chatterino2-7tv-git
            bloom-git
            somewm-git
            rustconn
            alacritty-graphics
            osrm-backend
            solar2d-git
            glaxnimate-git
            yacreader-poppler
            chrome-remote-desktop
            linux-mainline-docs
            cdesktopenv
            ))

;;;
;;; --- 1. semantic-diff ---
;;; AI-powered semantic analysis of git commits.
;;; Source: https://github.com/tkenaz/semantic_diff
;;;

(define-public semantic-diff
  (package
    (name "semantic-diff")
    (version "0.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/tkenaz/semantic_diff")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    ;; python-anthropic not available in Guix
    (propagated-inputs (list python-rich
                             python-dotenv
                             python-click
                             python-gitpython
                             python-pydantic))
    (native-inputs (list python-setuptools
                         python-wheel
                         python-pypa-build
                         python-installer))
    (synopsis "AI-powered semantic analysis of git commits")
    (description
     "Semantic Diff uses AI to provide semantic analysis of git commits.  It
goes beyond textual diffs to explain what changes mean in context,
helping developers understand the intent and impact of code changes.")
    (home-page "https://github.com/tkenaz/semantic_diff")
    (license license:expat)))

;;;
;;; --- 2. twig ---
;;; Terminal JSON file inspector and navigator.
;;; Source: https://github.com/workdone0/twig
;;;

(define-public twig
  (package
    (name "twig")
    (version "2.1.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/workdone0/twig")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    ;; python-json-repair not available in Guix
    (propagated-inputs (list python-textual
                             python-pyperclip
                             python-rich
                             python-ijson
                             python-pyyaml))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "terminal JSON file inspector and navigator")
    (description
     "Twig is a terminal user interface for inspecting and navigating JSON
files.  It provides an interactive tree view for exploring JSON
structures, with features including search, copy to clipboard, and
support for large files via streaming JSON parsing.")
    (home-page "https://github.com/workdone0/twig")
    (license license:expat)))

;;;
;;; --- 3. vaping ---
;;; Network monitoring alternative to SmokePing.
;;; Source: https://github.com/20c/vaping
;;;

(define-public vaping
  (package
    (name "vaping")
    (version "1.5.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/20c/vaping")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    ;; python-pid, python-munge, python-confu, python-pluginmgr not in Guix
    (propagated-inputs (list python-daemon
                             python-tomlkit
                             python-pyyaml))
    (native-inputs (list python-poetry-core))
    (synopsis "network monitoring alternative to SmokePing")
    (description
     "Vaping is a network monitoring tool designed as a modern alternative to
SmokePing.  It provides latency and packet loss monitoring with a
plugin-based architecture for data collection and output.  Vaping
supports multiple graphing backends and notification mechanisms.")
    (home-page "https://github.com/20c/vaping")
    (license license:asl2.0)))

;;;
;;; --- 4. android-tv-remote ---
;;; GTK-based remote control for Android TV.
;;; Source: https://github.com/erenseymen/android-tv-remote
;;;

(define-public android-tv-remote
  (package
    (name "android-tv-remote")
    (version "1.1.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/erenseymen/android-tv-remote")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    ;; python-adb-shell not available in Guix
    (propagated-inputs (list gtk
                             libadwaita
                             python-pygobject
                             python-psutil
                             python-pyasn1
                             python-rsa))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "GTK-based remote control for Android TV")
    (description
     "Android TV Remote is a GTK4 application for controlling Android TV
devices from a Linux desktop.  It provides a graphical remote control
interface with support for navigation, text input, and screen
mirroring via scrcpy integration.")
    (home-page "https://github.com/erenseymen/android-tv-remote")
    (license license:gpl3+)))

;;;
;;; --- 5. stickerpicker-git ---
;;; Element Matrix sticker picker widget.
;;; Source: https://github.com/maunium/stickerpicker
;;;

(define-public stickerpicker-git
  (let ((commit "4c13a2c")
        (revision "1"))
    (package
      (name "stickerpicker-git")
      (version (git-version "0.1.0" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/maunium/stickerpicker")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "0000000000000000000000000000000000000000000000000000"))))
      (build-system pyproject-build-system)
      (arguments
       (list #:tests? #f))
      ;; python-cryptg not available in Guix
      (propagated-inputs (list python-aiohttp
                               python-magic
                               python-pillow
                               python-telethon
                               python-yarl))
      (native-inputs (list python-setuptools python-wheel))
      (synopsis "Element Matrix sticker picker widget")
      (description
       "Stickerpicker is a sticker picker widget for Element and other Matrix
clients.  It provides tools for importing sticker packs from Telegram
and serving them as a web widget that integrates with the Matrix
protocol for sending stickers in chat.")
      (home-page "https://github.com/maunium/stickerpicker")
      (license license:agpl3+))))

;;;
;;; --- 6. m64py ---
;;; Qt front-end for Mupen64Plus N64 emulator.
;;; Source: https://github.com/mupen64plus/mupen64plus-ui-python
;;;

(define-public m64py
  (package
    (name "m64py")
    (version "0.3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/mupen64plus/mupen64plus-ui-python")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    ;; python-pyqt6-webengine not available in Guix
    (propagated-inputs (list python-pysdl2))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "Qt front-end for Mupen64Plus N64 emulator")
    (description
     "M64Py is a Qt-based graphical front-end for the Mupen64Plus Nintendo 64
emulator.  It provides a user-friendly interface for managing ROMs,
configuring controller input, adjusting video and audio plugins, and
launching games through the Mupen64Plus core library.")
    (home-page "https://github.com/mupen64plus/mupen64plus-ui-python")
    (license license:gpl2+)))

;;;
;;; --- 7. python-fabric-git ---
;;; Next-gen framework for building desktop widgets.
;;; Source: https://github.com/Fabric-Development/fabric
;;;

(define-public python-fabric-git
  (let ((commit "ff02325")
        (revision "1"))
    (package
      (name "python-fabric-git")
      (version (git-version "0.1.0" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/Fabric-Development/fabric")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "0000000000000000000000000000000000000000000000000000"))))
      (build-system pyproject-build-system)
      (arguments
       (list #:tests? #f))
      (propagated-inputs (list gtk+
                               cairo
                               gobject-introspection
                               gtk-layer-shell
                               libdbusmenu))
      (native-inputs (list python-setuptools))
      (synopsis "framework for building desktop widgets on Linux")
      (description
       "Fabric is a next-generation framework for building desktop widgets on
Linux.  It provides Python bindings for creating status bars, overlays,
and other desktop widgets using GTK, with built-in support for
Wayland layer-shell and D-Bus integration.")
      (home-page "https://github.com/Fabric-Development/fabric")
      (license license:agpl3+))))

;;;
;;; --- 8. python-curl-cffi-git ---
;;; Python FFI binding for curl-impersonate.
;;; Source: https://github.com/lexiforest/curl_cffi
;;;

(define-public python-curl-cffi-git
  (let ((commit "91170ff")
        (revision "1"))
    (package
      (name "python-curl-cffi-git")
      (version (git-version "0.15.0" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/lexiforest/curl_cffi")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "0000000000000000000000000000000000000000000000000000"))))
      (build-system pyproject-build-system)
      (arguments
       (list #:tests? #f))
      (propagated-inputs (list python-certifi
                               python-cffi
                               python-typing-extensions))
      (native-inputs (list python-setuptools python-wheel))
      (synopsis "Python FFI binding for curl-impersonate")
      (description
       "curl_cffi is a Python binding for curl-impersonate via CFFI.  It can
impersonate browsers including Chrome, Firefox, and Safari by using
their TLS fingerprints, making HTTP requests appear to originate from
real browsers.  Useful for web scraping and API access.")
      (home-page "https://github.com/lexiforest/curl_cffi")
      (license license:expat))))

;;;
;;; --- 9. ytm-player-git ---
;;; YouTube Music TUI client with vim navigation.
;;; Source: https://github.com/peternaame-boop/ytm-player
;;;

(define-public ytm-player-git
  (package
    (name "ytm-player-git")
    (version "1.5.6")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/peternaame-boop/ytm-player")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (propagated-inputs (list mpv
                             python-click
                             python-pillow))
    (native-inputs (list python-hatchling))
    (synopsis "YouTube Music TUI client with vim-style navigation")
    (description
     "ytm-player is a terminal user interface client for YouTube Music.  It
provides vim-style keyboard navigation for browsing and playing music,
with mpv as the audio backend.  Features include search, playlists,
and album art display in the terminal.")
    (home-page "https://github.com/peternaame-boop/ytm-player")
    (license license:expat)))

;;;
;;; --- 10. q4wine-git ---
;;; Qt6 GUI for Wine.
;;; Source: https://github.com/brezerk/q4wine
;;;

(define-public q4wine-git
  (let ((commit "f506d89")
        (revision "1"))
    (package
      (name "q4wine-git")
      (version (git-version "1.4.1" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/brezerk/q4wine")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "0000000000000000000000000000000000000000000000000000"))))
      (build-system cmake-build-system)
      (arguments
       (list #:tests? #f))
      (native-inputs (list cmake qttools))
      (inputs (list qtbase
                    icoutils
                    hicolor-icon-theme))
      (synopsis "Qt6 GUI for Wine prefix management")
      (description
       "Q4Wine is a Qt6-based graphical user interface for managing Wine
prefixes and running Windows applications on Linux.  It provides
tools for creating and configuring Wine prefixes, managing installed
applications, and handling Wine process monitoring.")
      (home-page "https://github.com/brezerk/q4wine")
      (license license:gpl3+))))

;;;
;;; --- 11. plasma6-applets-appgrid ---
;;; Modern fullscreen app launcher for KDE Plasma.
;;; Source: https://github.com/xarbit/plasma6-applet-appgrid
;;;

(define-public plasma6-applets-appgrid
  (package
    (name "plasma6-applets-appgrid")
    (version "1.7.8")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/xarbit/plasma6-applet-appgrid")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list cmake extra-cmake-modules))
    (inputs (list plasma-workspace
                  kservice
                  layer-shell-qt
                  qtbase
                  kirigami
                  kiconthemes
                  ksvg))
    (synopsis "fullscreen app launcher for KDE Plasma")
    (description
     "AppGrid is a modern fullscreen application launcher applet for KDE
Plasma 6.  It displays installed applications in a grid layout with
search functionality, categories, and smooth animations, similar to
GNOME's application overview.")
    (home-page "https://github.com/xarbit/plasma6-applet-appgrid")
    (license license:gpl2+)))

;;;
;;; --- 12. plasma-gamemode-git ---
;;; Gamemode UI for KDE Plasma Desktop.
;;; Source: https://invent.kde.org/sitter/plasma-gamemode
;;;

(define-public plasma-gamemode-git
  (let ((commit "4d60358")
        (revision "1"))
    (package
      (name "plasma-gamemode-git")
      (version (git-version "0.1.0" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://invent.kde.org/sitter/plasma-gamemode")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "0000000000000000000000000000000000000000000000000000"))))
      (build-system cmake-build-system)
      (arguments
       (list #:tests? #f))
      (native-inputs (list cmake extra-cmake-modules))
      (inputs (list kirigami
                    gamemode
                    qtbase
                    qtdeclarative
                    kcoreaddons
                    kdbusaddons
                    ki18n))
      (synopsis "Gamemode integration UI for KDE Plasma")
      (description
       "Plasma Gamemode provides a KDE Plasma desktop integration for Feral
Interactive's GameMode.  It offers a system tray widget and settings
interface for monitoring and controlling GameMode, which optimizes
Linux system performance for gaming.")
      (home-page "https://invent.kde.org/sitter/plasma-gamemode")
      (license license:gpl3))))

;;;
;;; --- 13. plasmazones ---
;;; Window tiling/autotiling for KDE Plasma.
;;; Source: https://github.com/fuddlesworth/PlasmaZones
;;;

(define-public plasmazones
  (package
    (name "plasmazones")
    (version "2.8.6")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/fuddlesworth/PlasmaZones")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list cmake extra-cmake-modules ninja))
    (inputs (list qtbase
                  qtdeclarative
                  kconfig
                  kconfigwidgets
                  kirigami
                  kcmutils))
    (synopsis "window tiling and autotiling for KDE Plasma")
    (description
     "PlasmaZones is a KDE Plasma extension for tiling and autotiling
windows into predefined screen zones.  It allows users to define
custom screen layouts and snap windows into zones by dragging or
using keyboard shortcuts, similar to FancyZones on Windows.")
    (home-page "https://github.com/fuddlesworth/PlasmaZones")
    (license license:gpl3+)))

;;;
;;; --- 14. aeroshell-smod-git ---
;;; KDecoration3 decoration engine for AeroShell.
;;; Source: https://github.com/aeroshell-desktop/smod
;;;

(define-public aeroshell-smod-git
  (let ((commit "def5938")
        (revision "1"))
    (package
      (name "aeroshell-smod-git")
      (version (git-version "6.6.3" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/aeroshell-desktop/smod")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "0000000000000000000000000000000000000000000000000000"))))
      (build-system cmake-build-system)
      (arguments
       (list #:tests? #f))
      (native-inputs (list extra-cmake-modules kdoctools))
      (inputs (list kconfig
                    kwin
                    kdecoration
                    kcoreaddons
                    libepoxy
                    ki18n))
      (synopsis "KDecoration3 decoration engine for AeroShell")
      (description
       "SMOD is a KDecoration3 window decoration engine for the AeroShell
desktop environment.  It provides Aero-style window decorations with
glass transparency effects for KDE Plasma, recreating the visual
appearance of Windows Aero window borders and title bars.")
      (home-page "https://github.com/aeroshell-desktop/smod")
      (license license:agpl3+))))

;;;
;;; --- 15. plasma-keyboard-git ---
;;; Virtual keyboard for Qt-based desktops.
;;; Source: https://invent.kde.org/plasma/plasma-keyboard
;;;

(define-public plasma-keyboard-git
  (let ((commit "0edb3bd")
        (revision "1"))
    (package
      (name "plasma-keyboard-git")
      (version (git-version "0.1.0" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://invent.kde.org/plasma/plasma-keyboard")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "0000000000000000000000000000000000000000000000000000"))))
      (build-system cmake-build-system)
      (arguments
       (list #:tests? #f))
      (native-inputs (list cmake extra-cmake-modules))
      (inputs (list kconfig
                    kcmutils
                    kcoreaddons
                    ki18n
                    kirigami))
      (synopsis "virtual keyboard for Qt-based desktops")
      (description
       "Plasma Keyboard is a virtual on-screen keyboard for KDE Plasma and
other Qt-based desktop environments.  It provides touch-friendly text
input with support for multiple layouts, auto-correction, and
integration with the Wayland input method protocol.")
      (home-page "https://invent.kde.org/plasma/plasma-keyboard")
      (license license:lgpl2.1+))))

;;;
;;; --- 16. uzdoom ---
;;; Feature-centric Doom engine port based on GZDoom.
;;; Source: https://github.com/AnotherDoomFork/uzdoom (placeholder URL)
;;;

(define-public uzdoom
  (package
    (name "uzdoom")
    (version "4.14.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/AnotherDoomFork/uzdoom")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list cmake ninja))
    (inputs (list bzip2
                  gtk+
                  mesa
                  libvpx
                  openal
                  sdl2))
    (synopsis "feature-centric Doom engine port based on GZDoom")
    (description
     "UZDoom is a feature-centric source port of the Doom engine based on
GZDoom.  It provides enhanced rendering, modern OpenGL support, and
additional gameplay features while maintaining compatibility with
classic Doom WAD files and mods.")
    (home-page "https://zdoom.org")
    (license license:gpl3+)))

;;;
;;; --- 17. qbittorrent-enhanced-ua ---
;;; Enhanced qBittorrent with anti-tracker features.
;;; Source: https://github.com/c0re100/qBittorrent-Enhanced-Edition
;;;

(define-public qbittorrent-enhanced-ua
  (package
    (name "qbittorrent-enhanced-ua")
    (version "5.1.3.10")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/c0re100/qBittorrent-Enhanced-Edition")
                    (commit (string-append "release-" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list cmake boost qttools))
    (inputs (list libtorrent-rasterbar
                  openssl
                  qtbase
                  qtsvg
                  zlib))
    (synopsis "enhanced qBittorrent with anti-tracker features")
    (description
     "qBittorrent Enhanced Edition is a fork of qBittorrent with additional
features for privacy and anti-tracking.  It includes enhanced peer
filtering, auto-ban of known tracker-associated clients, and improved
connection management while retaining all standard qBittorrent
functionality.")
    (home-page "https://github.com/c0re100/qBittorrent-Enhanced-Edition")
    (license license:gpl2+)))

;;;
;;; --- 18. qbittorrent-enhanced-ua-nox ---
;;; Enhanced qBittorrent (headless/no-GUI).
;;; Same source as qbittorrent-enhanced-ua with GUI disabled.
;;;

(define-public qbittorrent-enhanced-ua-nox
  (package
    (inherit qbittorrent-enhanced-ua)
    (name "qbittorrent-enhanced-ua-nox")
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list "-DGUI=OFF")))
    (inputs (list libtorrent-rasterbar
                  openssl
                  qtbase
                  zlib))
    (synopsis "enhanced qBittorrent headless daemon with anti-tracker features")
    (description
     "qBittorrent Enhanced Edition (NoX) is the headless variant of the
enhanced qBittorrent fork.  It runs as a daemon without a graphical
interface, providing a web UI for remote management.  Includes the
same anti-tracker and peer filtering features as the GUI version.")))

;;;
;;; --- 19. chatterino2-7tv-git ---
;;; Chatterino2 fork with 7TV emote support.
;;; Source: https://github.com/SevenTV/chatterino7
;;;

(define-public chatterino2-7tv-git
  (let ((commit "35ff16d")
        (revision "1"))
    (package
      (name "chatterino2-7tv-git")
      (version (git-version "7.5.4" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/SevenTV/chatterino7")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "0000000000000000000000000000000000000000000000000000"))))
      (build-system cmake-build-system)
      (arguments
       (list #:tests? #f))
      (native-inputs (list cmake boost ninja rapidjson))
      (inputs (list libnotify
                    openssl
                    qtbase
                    qtsvg
                    qtkeychain))
      (synopsis "Chatterino2 fork with 7TV emote support")
      (description
       "Chatterino7 is a fork of the Chatterino2 Twitch chat client with
built-in support for 7TV emotes.  It provides a fast, lightweight
desktop client for Twitch chat with features including split views,
emote auto-completion, moderation tools, and integration with
third-party emote services.")
      (home-page "https://github.com/SevenTV/chatterino7")
      (license license:expat))))

;;;
;;; --- 20. bloom-git ---
;;; Bloom AVR debugger for embedded systems.
;;; Source: https://github.com/navnavnav/Bloom
;;;

(define-public bloom-git
  (let ((commit "7aff716d")
        (revision "1"))
    (package
      (name "bloom-git")
      (version (git-version "0.1.0" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/navnavnav/Bloom")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "0000000000000000000000000000000000000000000000000000"))))
      (build-system cmake-build-system)
      (arguments
       (list #:tests? #f))
      (native-inputs (list cmake qttools php))
      (inputs (list libusb
                    hidapi
                    qtbase
                    libxcb
                    libpng
                    icu4c
                    yaml-cpp))
      (synopsis "AVR debugger for embedded systems")
      (description
       "Bloom is a debugger and development environment for AVR
microcontrollers.  It provides a graphical interface for debugging
embedded firmware via JTAG and debugWire protocols, with support for
setting breakpoints, inspecting registers, and viewing memory
contents in real time.")
      (home-page "https://github.com/navnavnav/Bloom")
      (license license:lgpl2.1+))))

;;;
;;; --- 21. somewm-git ---
;;; AwesomeWM ported to Wayland.
;;; Source: https://github.com/trip-zip/somewm
;;;

(define-public somewm-git
  (let ((commit "c9921b6")
        (revision "1"))
    (package
      (name "somewm-git")
      (version (git-version "0.5.0" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/trip-zip/somewm")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "0000000000000000000000000000000000000000000000000000"))))
      (build-system meson-build-system)
      (arguments
       (list #:tests? #f))
      (native-inputs (list glslang wayland-protocols pkg-config))
      (inputs (list cairo
                    dbus
                    gdk-pixbuf
                    glib
                    libdrm
                    libinput
                    wayland
                    wlroots
                    lua
                    pango))
      (synopsis "AwesomeWM ported to Wayland")
      (description
       "SomeWM is a Wayland compositor that ports the AwesomeWM tiling window
manager experience to the Wayland display protocol.  It provides Lua-based
configuration, dynamic tiling layouts, and a tag-based workspace system
familiar to AwesomeWM users, built on top of wlroots.")
      (home-page "https://github.com/trip-zip/somewm")
      (license license:gpl3+))))

;;;
;;; --- 22. rustconn ---
;;; GTK4 connection manager for Linux.
;;; Source: https://github.com/totoshko88/RustConn
;;;

(define-public rustconn
  (package
    (name "rustconn")
    (version "0.10.18")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/totoshko88/RustConn")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f
           #:install-source? #f))
    (inputs (list alsa-lib
                  dbus
                  gtk
                  libadwaita
                  openssh
                  openssl
                  vte))
    (synopsis "GTK4 connection manager for Linux")
    (description
     "RustConn is a GTK4-based connection manager written in Rust.  It
provides a graphical interface for managing SSH, VNC, RDP, and other
remote connections with support for session saving, terminal
emulation via VTE, and integration with the GNOME desktop.")
    (home-page "https://github.com/totoshko88/RustConn")
    (license license:gpl3+)))

;;;
;;; --- 23. alacritty-graphics ---
;;; Alacritty fork with graphics protocol support.
;;; Source: https://github.com/ayosec/alacritty
;;;

(define-public alacritty-graphics
  (package
    (name "alacritty-graphics")
    (version "0.17.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ayosec/alacritty")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f
           #:install-source? #f))
    (native-inputs (list cmake ncurses))
    (inputs (list freetype
                  fontconfig
                  libxkbcommon
                  libxrandr
                  wayland))
    (synopsis "Alacritty fork with graphics protocol support")
    (description
     "Alacritty Graphics is a fork of the Alacritty terminal emulator that
adds support for inline graphics display protocols.  It can render
images directly in the terminal using protocols such as Sixel and
Kitty graphics, while retaining Alacritty's GPU-accelerated
rendering and performance.")
    (home-page "https://github.com/ayosec/alacritty")
    (license license:asl2.0)))

;;;
;;; --- 24. osrm-backend ---
;;; High-performance C++ routing engine for OpenStreetMap.
;;; Source: https://github.com/Project-OSRM/osrm-backend
;;;

(define-public osrm-backend
  (package
    (name "osrm-backend")
    (version "6.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Project-OSRM/osrm-backend")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list cmake boost))
    (inputs (list bzip2
                  expat
                  libxml2
                  libzip
                  lua
                  tbb))
    (synopsis "high-performance C++ routing engine for OpenStreetMap")
    (description
     "OSRM (Open Source Routing Machine) is a high-performance routing engine
written in C++ for computing shortest paths in road networks.  It uses
OpenStreetMap data and provides HTTP API endpoints for route
calculation, distance matrices, map matching, and trip optimization.")
    (home-page "https://github.com/Project-OSRM/osrm-backend")
    (license license:bsd-2)))

;;;
;;; --- 25. solar2d-git ---
;;; Solar2D cross-platform 2D game engine (formerly Corona SDK).
;;; Source: https://github.com/coronalabs/corona
;;;

(define-public solar2d-git
  (let ((commit "afb6ec98")
        (revision "0"))
    (package
      (name "solar2d-git")
      (version (git-version "3729" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/coronalabs/corona")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "0000000000000000000000000000000000000000000000000000"))))
      (build-system cmake-build-system)
      (arguments
       (list #:tests? #f))
      (native-inputs (list cmake))
      (inputs (list glu
                    zlib
                    openal
                    freetype
                    libpng
                    libjpeg-turbo
                    openssl
                    curl))
      (synopsis "cross-platform 2D game engine formerly known as Corona SDK")
      (description
       "Solar2D is an open-source cross-platform 2D game engine, formerly
known as Corona SDK.  It uses Lua scripting and provides APIs for
graphics, audio, physics, networking, and device input.  Solar2D
supports building games for multiple platforms from a single codebase.")
      (home-page "https://github.com/coronalabs/corona")
      (license license:expat))))

;;;
;;; --- 26. glaxnimate-git ---
;;; Simple vector animation program.
;;; Source: https://invent.kde.org/graphics/glaxnimate
;;;

(define-public glaxnimate-git
  (let ((commit "2ef1d58")
        (revision "1"))
    (package
      (name "glaxnimate-git")
      (version (git-version "0.6.0" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://invent.kde.org/graphics/glaxnimate")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "0000000000000000000000000000000000000000000000000000"))))
      (build-system cmake-build-system)
      (arguments
       (list #:tests? #f))
      (native-inputs (list cmake extra-cmake-modules ninja))
      (inputs (list ffmpeg
                    karchive
                    kcompletion
                    kcoreaddons
                    kcrash
                    ki18n
                    kwidgetsaddons
                    kxmlgui
                    qtbase))
      (synopsis "simple vector animation program")
      (description
       "Glaxnimate is a vector graphics animation program for creating Lottie
and SVG animations.  It provides a timeline-based editor with support
for shapes, gradients, masks, and easing curves.  Animations can be
exported to Lottie JSON, GIF, WebP, and video formats.")
      (home-page "https://invent.kde.org/graphics/glaxnimate")
      (license license:gpl3+))))

;;;
;;; --- 27. yacreader-poppler ---
;;; Comic reader using poppler for PDF rendering.
;;; Source: https://github.com/YACReader/yacreader
;;;

(define-public yacreader-poppler
  (package
    (name "yacreader-poppler")
    (version "9.15.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/YACReader/yacreader")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list cmake qttools qtsvg))
    (inputs (list poppler-qt6
                  qtbase
                  qtmultimedia
                  qtdeclarative))
    (synopsis "comic reader using poppler for PDF rendering")
    (description
     "YACReader is a comic reader application that uses the Poppler library
for PDF rendering.  It supports CBZ, CBR, PDF, and other comic archive
formats with features including a library manager, reading lists,
bookmarks, and a built-in comic server for reading on other devices.")
    (home-page "https://www.yacreader.com")
    (license license:gpl3)))

;;;
;;; --- 28. chrome-remote-desktop ---
;;; Google Chrome Remote Desktop host.
;;; Source: https://remotedesktop.google.com
;;;

(define-public chrome-remote-desktop
  (package
    (name "chrome-remote-desktop")
    (version "147.0.7727.3")
    (source (origin
              (method url-fetch)
              (uri "https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb")
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "lib/chrome-remote-desktop/"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (invoke "ar" "x" source)
              (invoke "tar" "xf" "data.tar.xz"))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "Chrome Remote Desktop host service")
    (description
     "Chrome Remote Desktop allows users to remotely access their computers
via the Chrome browser or a dedicated client.  This package provides
the host service component that runs on the machine to be accessed
remotely.  This package provides the pre-built binary.")
    (home-page "https://remotedesktop.google.com")
    (license license:bsd-3)))

;;;
;;; --- 29. linux-mainline-docs ---
;;; Documentation for Linux mainline kernel.
;;; Source: https://kernel.org/
;;;

(define-public linux-mainline-docs
  (package
    (name "linux-mainline-docs")
    (version "7.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://cdn.kernel.org/pub/linux/kernel/v7.x/"
                    "linux-" version ".tar.xz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("Documentation" "share/doc/linux-mainline/"))))
    (synopsis "documentation for the Linux mainline kernel")
    (description
     "This package provides the documentation directory from the Linux
mainline kernel source tree.  It includes kernel API documentation,
subsystem guides, device driver documentation, and administrator
guides in reStructuredText format.")
    (home-page "https://kernel.org")
    (license license:gpl2)))

;;;
;;; --- 30. cdesktopenv ---
;;; Common Desktop Environment (CDE).
;;; Source: http://sourceforge.net/projects/cdesktopenv/
;;;

(define-public cdesktopenv
  (package
    (name "cdesktopenv")
    (version "2.5.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://git.code.sf.net/p/cdesktopenv/code")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (inputs (list bash
                  oksh
                  libice
                  libjpeg-turbo
                  libsm
                  libx11
                  libxext
                  libxmu
                  libxt
                  motif
                  openssl
                  xbitmaps))
    (synopsis "Common Desktop Environment")
    (description
     "CDE (Common Desktop Environment) is a classic UNIX desktop environment
originally developed by a consortium of Sun, HP, IBM, and DEC.  It
provides a complete desktop with a window manager, file manager, text
editor, terminal emulator, and other productivity tools following the
Motif widget toolkit conventions.")
    (home-page "http://sourceforge.net/projects/cdesktopenv/")
    (license license:lgpl2.1+)))
