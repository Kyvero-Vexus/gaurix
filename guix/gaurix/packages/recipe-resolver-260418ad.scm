;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260418ad
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages.
;;;
;;; New recipes (14):
;;;       1.  tsync (pyproject-build-system, v0.1.1, expat)
;;;       2.  dupster (pyproject-build-system, v0.0.7, asl2.0)
;;;       3.  gnome-shell-extension-wallpaper-slideshow (copy-build-system, v14.1, gpl2+)
;;;       4.  leaflet-js (copy-build-system, v1.9.4, bsd-2)
;;;       5.  mousse-git (gnu-build-system, v0.0.0-git, expat)
;;;       6.  wpa-supplicant-gui (gnu-build-system, v2.11, bsd-3)
;;;       7.  check-nwc-health (gnu-build-system, v12.11, gpl2)
;;;       8.  rpi-imager (cmake-build-system, v2.0.8, asl2.0)
;;;       9.  fastero (pyproject-build-system, v0.2.5, expat)
;;;      10.  pinit (meson-build-system, v2.2.1, gpl3+)
;;;      11.  openterface-qt (gnu-build-system, v0.3.1, agpl3)
;;;      12.  mangojuice (meson-build-system, v0.8.9, gpl3+)
;;;      13.  paisa-bin (copy-build-system, v0.7.4, agpl3)
;;;      14.  zeek (cmake-build-system, v8.0.6, bsd-3)
;;;
;;; ALREADY_PACKAGED_PRIOR (2):
;;;      15.  gpa-git -> gpa exists in Guix (gnu/packages/gnupg.scm)
;;;      16.  greetd-tuigreet-git -> tuigreet exists in Guix (gnu/packages/admin.scm)
;;;
;;; BLOCKED EXHAUSTED (14):
;;;      17.  dstl -> CARGO_DEPS_NEEDED: Rust CLI needs ~30 crate deps
;;;      18.  kohighlights -> PYSIDE6_COMPLEX: PySide6 GUI not available in Guix
;;;      19.  rsenv -> CARGO_DEPS_NEEDED: Rust CLI needs crate dep chain
;;;      20.  thorium-reader -> ELECTRON_COMPLEX: Electron EPUB reader, 200+ npm deps
;;;      21.  data-peek-bin -> PROPRIETARY_NO_STABLE_URL: commercial product, no public download
;;;      22.  crosvm-git -> CHROMIUM_COMPLEX: Chrome OS VM monitor, massive Chromium dep chain
;;;      23.  roleboi-git -> DOTNET_UNSUPPORTED: C#/.NET Discord bot, dotnet-sdk not in Guix
;;;      24.  mcp-router-bin -> CUSTOM_LICENSE: Sustainable-Use license incompatible with Guix
;;;      25.  music-presence-bin -> CUSTOM_LICENSE: proprietary Discord presence tool
;;;      26.  sneemok -> ZIG_NOT_IN_GUIX: Zig build system not available
;;;      27.  moo -> BUN_NOT_IN_GUIX: Bun JS runtime not available
;;;      28.  pixelpantry-git -> ELECTRON_COMPLEX: Electron pixel art app, npm dep chain
;;;      29.  anytype-bin -> APPIMAGE_COMPLEX: AppImage with FUSE/patching requirements
;;;      30.  arduino-ide-bin -> ELECTRON_COMPLEX: Electron IDE, 200+ npm deps + native addons
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Use `guix download` to obtain real hashes.

(define-module (gaurix packages recipe-resolver-260418ad)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages check)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages databases)
  #:use-module (gnu packages finance)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages gettext)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gnupg)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages image)
  #:use-module (gnu packages libusb)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages networking)
  #:use-module (gnu packages pcre)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages perl-check)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-check)
  #:use-module (gnu packages python-science)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages rsync)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages vala)
  #:use-module (gnu packages wayland)
  #:use-module (gnu packages xml)
  #:export (
            tsync
            dupster
            gnome-shell-extension-wallpaper-slideshow
            leaflet-js
            mousse-git
            wpa-supplicant-gui
            check-nwc-health
            rpi-imager
            fastero
            pinit
            openterface-qt
            mangojuice
            paisa-bin
            zeek))

;;; -------------------------------------------------------------------
;;; 1. tsync --- Directory tree synchronization with rsync
;;; Python CLI for syncing directory trees and subtrees.
;;; -------------------------------------------------------------------
(define-public tsync
  (package
    (name "tsync")
    (version "0.1.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/jayghoshrao/tsync/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))  ;; no test suite in upstream
    (propagated-inputs
     (list python-deepdiff
           python-magic
           python-rich
           rsync))
    (native-inputs
     (list python-setuptools
           python-wheel))
    (home-page "https://github.com/jayghoshrao/tsync")
    (synopsis "directory tree synchronization tool using rsync")
    (description "Tsync synchronizes directory trees and subtrees using
rsync as its backend.  It supports configuration files for defining sync
profiles with inclusion and exclusion patterns, and provides a rich
terminal interface for monitoring progress.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 2. dupster --- Fast duplicate file finder with TUI
;;; Python TUI for finding and managing duplicate files.
;;; -------------------------------------------------------------------
(define-public dupster
  (package
    (name "dupster")
    (version "0.0.7")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/karimz1/dupster/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))  ;; tests require pytest fixtures not included
    (propagated-inputs
     (list python-rich
           python-textual
           python-typer))
    (native-inputs
     (list python-hatchling))
    (home-page "https://github.com/karimz1/dupster")
    (synopsis "fast duplicate file finder with interactive TUI")
    (description "Dupster is a fast duplicate file finder that uses hash
comparison to identify duplicate files.  It provides an interactive
terminal user interface built with Textual for reviewing and managing
duplicates.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 3. gnome-shell-extension-wallpaper-slideshow
;;; Wallpaper slideshow extension for GNOME Shell.
;;; -------------------------------------------------------------------
(define-public gnome-shell-extension-wallpaper-slideshow
  (package
    (name "gnome-shell-extension-wallpaper-slideshow")
    (version "14.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://gitlab.com/AndrewZaech/azwallpaper/-/archive/v"
                    version "/azwallpaper-v" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/gnome-shell/extensions/azwallpaper@shell-extensions.gcampax.github.com/"
                #:exclude ("Makefile" "README.md" ".git")))))
    (home-page "https://gitlab.com/AndrewZaech/azwallpaper")
    (synopsis "wallpaper slideshow extension for GNOME Shell")
    (description "This GNOME Shell extension provides automatic wallpaper
slideshow functionality.  It cycles through wallpapers from a configured
directory at a user-defined interval, supporting multiple monitors and
various transition effects.")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 4. leaflet-js --- JavaScript library for interactive maps
;;; Mobile-friendly interactive map library.
;;; -------------------------------------------------------------------
(define-public leaflet-js
  (package
    (name "leaflet-js")
    (version "1.9.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Leaflet/Leaflet/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("dist/" "share/javascript/leaflet/"))))
    (home-page "https://leafletjs.com")
    (synopsis "JavaScript library for mobile-friendly interactive maps")
    (description "Leaflet is a lightweight, open-source JavaScript library
for mobile-friendly interactive maps.  It provides a simple API for adding
map layers, markers, popups, and tile sources, and works across all major
desktop and mobile browsers.")
    (license license:bsd-2)))

;;; -------------------------------------------------------------------
;;; 5. mousse-git --- Vim-like keybindings for mouse pointer
;;; Wayland tool for controlling mouse with keyboard.
;;; -------------------------------------------------------------------
(define-public mousse-git
  (package
    (name "mousse-git")
    (version "0.0.0-git.20250101")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/rusmisel/mousse")
                    (commit "569ccbfab2f3c94ed2e94e3a4af4d2cd96ce0a66")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "PREFIX=" #$output)
                   (string-append "CC=" (or (getenv "CC") "gcc")))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))  ;; no configure script
    (native-inputs
     (list pkg-config))
    (inputs
     (list wayland
           wayland-protocols))
    (home-page "https://github.com/rusmisel/mousse")
    (synopsis "vim-like keybindings for mouse pointer on Wayland")
    (description "Mousse provides vim-style keyboard control of the mouse
pointer on Wayland compositors.  It uses the virtual pointer protocol to
move the cursor and simulate clicks using configurable key bindings.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 6. wpa-supplicant-gui --- Qt GUI for wpa_supplicant
;;; Qt5-based graphical interface for managing wireless networks.
;;; -------------------------------------------------------------------
(define-public wpa-supplicant-gui
  (package
    (name "wpa-supplicant-gui")
    (version "2.11")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://w1.fi/releases/wpa_supplicant-"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (replace 'configure
                 (lambda* (#:key inputs #:allow-other-keys)
                   (chdir "wpa_supplicant/wpa_gui-qt4")))
               (replace 'build
                 (lambda* (#:key inputs #:allow-other-keys)
                   (invoke "qmake" "wpa_gui.pro")
                   (invoke "make")))
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin")))
                     (install-file "wpa_gui" bin)))))))
    (inputs
     (list qtbase))
    (home-page "https://w1.fi/wpa_supplicant/")
    (synopsis "Qt graphical interface for wpa_supplicant")
    (description "This package provides wpa_gui, a Qt-based graphical user
interface for interacting with wpa_supplicant.  It allows viewing and
managing wireless network connections, scanning for networks, and
configuring WPA/WPA2 authentication.")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; 7. check-nwc-health --- Network equipment health monitoring plugin
;;; Nagios/Icinga plugin for checking network devices.
;;; -------------------------------------------------------------------
(define-public check-nwc-health
  (package
    (name "check-nwc-health")
    (version "12.11")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/lausser/check_nwc_health")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (add-before 'configure 'autoreconf
                 (lambda _
                   (invoke "autoreconf" "-fi"))))))
    (native-inputs
     (list autoconf automake))
    (inputs
     (list perl))
    (propagated-inputs
     (list perl-json
           perl-file-slurp))
    (home-page "https://github.com/lausser/check_nwc_health")
    (synopsis "monitoring plugin for network equipment health checks")
    (description "Check_nwc_health is a Nagios/Icinga monitoring plugin
that checks the health of various network components and devices.  It
supports SNMP-based monitoring of interfaces, CPU, memory, hardware,
and environmental sensors on a wide range of network equipment vendors.")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 8. rpi-imager --- Raspberry Pi Imager
;;; Tool for flashing OS images to SD cards and USB drives.
;;; -------------------------------------------------------------------
(define-public rpi-imager
  (package
    (name "rpi-imager")
    (version "2.0.8")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/raspberrypi/rpi-imager/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list "-DUSE_SYSTEM_LIBARCHIVE=ON"
                   "-DUSE_SYSTEM_CURL=ON")
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'unpack 'chdir-to-src
                 (lambda _
                   (chdir "src"))))))
    (inputs
     (list curl
           libarchive
           qtbase
           qtdeclarative
           qtsvg))
    (native-inputs
     (list qttools-6))
    (home-page "https://www.raspberrypi.com/software/")
    (synopsis "tool for flashing OS images to SD cards and USB drives")
    (description "Raspberry Pi Imager is a graphical utility for writing
operating system images to SD cards and USB drives.  It downloads and
flashes images for Raspberry Pi and other single-board computers, with
built-in image verification and customization options.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 9. fastero --- Python timeit alternative with rich output
;;; CLI benchmarking tool with comparison features.
;;; -------------------------------------------------------------------
(define-public fastero
  (package
    (name "fastero")
    (version "0.2.5")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/wasi-master/fastero/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))  ;; tests require additional fixtures
    (propagated-inputs
     (list python-click
           python-matplotlib
           python-numpy
           python-pillow
           python-pygments
           python-rich))
    (native-inputs
     (list python-setuptools
           python-wheel))
    (home-page "https://github.com/wasi-master/fastero")
    (synopsis "Python timeit alternative with rich terminal output")
    (description "Fastero is a Python benchmarking tool that serves as a
modern alternative to timeit.  It provides rich terminal output with
colored formatting, comparison between code snippets, and optional
graphical output of benchmark results.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 10. pinit --- Pin portable apps to desktop launcher
;;; Vala/GTK4 app for creating .desktop files.
;;; -------------------------------------------------------------------
(define-public pinit
  (package
    (name "pinit")
    (version "2.2.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ryonakano/pinit/archive/refs/tags/"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:glib-or-gtk? #t))
    (native-inputs
     (list blueprint-compiler
           gettext-minimal
           pkg-config
           vala))
    (inputs
     (list gtk
           libadwaita
           libgee))
    (home-page "https://github.com/ryonakano/pinit")
    (synopsis "pin portable applications to your desktop launcher")
    (description "Pinit is a GTK4 application that helps create and edit
@file{.desktop} files for portable applications such as AppImages.  It
provides a graphical interface for setting the application name, icon,
executable path, and other desktop entry fields.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 11. openterface-qt --- Openterface Mini-KVM host application
;;; Qt6 GUI for Openterface Mini-KVM USB devices.
;;; -------------------------------------------------------------------
(define-public openterface-qt
  (package
    (name "openterface-qt")
    (version "0.3.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/TechxArtisanStudio/Openterface_QT")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (replace 'configure
                 (lambda* (#:key outputs #:allow-other-keys)
                   (invoke "qmake6"
                           (string-append "PREFIX="
                                          (assoc-ref outputs "out"))
                           "openterfaceQT.pro")))
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin")))
                     (install-file "openterfaceQT" bin)))))))
    (inputs
     (list libusb
           qtbase
           qtmultimedia
           qtsvg))
    (native-inputs
     (list qttools-6))
    (home-page "https://openterface.com/")
    (synopsis "host application for Openterface Mini-KVM devices")
    (description "Openterface QT is the host-side application for
Openterface Mini-KVM devices.  It provides a graphical interface for
controlling a target computer via USB using video capture and keyboard/mouse
emulation through the Mini-KVM hardware.")
    (license license:agpl3)))

;;; -------------------------------------------------------------------
;;; 12. mangojuice --- GUI for MangoHud configuration
;;; Vala/GTK4 interface for editing MangoHud overlay settings.
;;; -------------------------------------------------------------------
(define-public mangojuice
  (package
    (name "mangojuice")
    (version "0.8.9")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/radiolamp/mangojuice")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:glib-or-gtk? #t))
    (native-inputs
     (list blueprint-compiler
           gettext-minimal
           pkg-config
           vala))
    (inputs
     (list gtk
           libadwaita
           libgee))
    (home-page "https://github.com/radiolamp/mangojuice")
    (synopsis "graphical configuration tool for MangoHud overlay")
    (description "MangoJuice provides a convenient graphical interface for
configuring MangoHud, the Vulkan and OpenGL overlay for monitoring FPS,
temperatures, CPU/GPU load, and other system metrics during gaming.  It
allows editing all MangoHud settings without manually editing config files.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 13. paisa-bin --- Personal finance manager (pre-built binary)
;;; Double-entry bookkeeping tool with ledger integration.
;;; -------------------------------------------------------------------
(define-public paisa-bin
  (package
    (name "paisa-bin")
    (version "0.7.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ananthakumaran/paisa/releases/download/v"
                    version "/paisa-cli-linux-amd64"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("paisa-cli-linux-amd64" "bin/paisa"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (mkdir-p ".")
                   (copy-file source "paisa-cli-linux-amd64")
                   (chmod "paisa-cli-linux-amd64" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/ananthakumaran/paisa")
    (synopsis "personal finance manager with double-entry bookkeeping")
    (description "Paisa is a personal finance manager that works with
ledger-cli journal files.  It provides a web interface for visualizing
income, expenses, investments, and net worth over time using double-entry
bookkeeping principles.")
    (license license:agpl3)))

;;; -------------------------------------------------------------------
;;; 14. zeek --- Network analysis framework
;;; Powerful network security monitoring tool (formerly Bro).
;;; -------------------------------------------------------------------
(define-public zeek
  (package
    (name "zeek")
    (version "8.0.6")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://download.zeek.org/zeek-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f  ;; tests require network access
           #:configure-flags
           #~(list (string-append "-DCMAKE_INSTALL_PREFIX=" #$output)
                   "-DBUILD_SHARED_LIBS=ON"
                   "-DBROKER_DISABLE_TESTS=ON"
                   "-DBROKER_DISABLE_DOC_EXAMPLES=ON"
                   "-DINSTALL_AUX_TOOLS=ON"
                   "-DINSTALL_ZEEK_ARCHIVER=ON"
                   "-DINSTALL_ZKG=ON")))
    (native-inputs
     (list bison
           flex
           pkg-config
           python
           swig))
    (inputs
     (list bash-minimal
           hiredis
           libpcap
           openssl
           python
           zlib
           zeromq))
    (home-page "https://zeek.org")
    (synopsis "powerful network analysis framework for security monitoring")
    (description "Zeek (formerly Bro) is a powerful network analysis
framework that operates as a passive network traffic analyzer.  It
generates detailed logs of network activity including HTTP, DNS, SSL,
and other protocols, enabling security monitoring, forensics, and
network troubleshooting.")
    (license license:bsd-3)))
