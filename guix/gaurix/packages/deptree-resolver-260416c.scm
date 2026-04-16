;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency tree resolver pass --- deptree-resolver-260416c
;;; Resolves 99 packages from dependency tree queue.
;;;
;;; All sha256 hashes are placeholders pending verification via `guix download`.

(define-module (gaurix packages deptree-resolver-260416c)
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
  #:use-module (guix build-system node)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:export (solar2d-git
            vrcx
            lsfg-vk-git
            uzdoom
            ytm-player-git
            plasma6-applets-eventcalendar
            pulsemeeter-git
            zephyr-sdk
            eblande
            foldingathome
            glaxnimate-git
            graphite-editor-git
            grub-blscfg
            gz-ionic
            home-assistant
            isd-git
            lib32-amdvlk
            linux-cjktty
            linux-lqx-docs
            linux-lqx-headers
            linux-xanmod
            linux-xanmod-edge
            meshiji
            mingw-w64-gtk3
            pat-aur-host-git
            properdocs
            runescape-launcher
            sparrow-wifi-git
            steamlink
            yabridge-wine10-git
            alacritty-graphics
            alephone-git
            astraeditor-git
            fcitx5-lotus-git
            fotema
            gimp-nufraw
            gx52
            inputactions-kwin
            lib32-python
            linux-g14
            manaverse-git
            manaverse-sdl2-git
            mcpelauncher-linux-git
            meowpad-configurator-v2-git
            mininet
            nip4
            ossia-score
            polymc-qt5-git
            python-llama-cpp-hip
            python-wandb
            the-honkers-railway-launcher
            wsjtx-improved
            wsjtx-improved-al
            xawtv
            anydesk-legacy-bin
            baballonia
            bareos-bconsole
            betterwallpaper-git
            bugwarrior-git
            c47
            collabora-office
            invidious
            karton
            linux-cachyos-cjktty-headers
            linux-cachyos-rc-headers
            linux-libre-hardened-docs
            linux-libre-hardened-headers
            linux-vfio-lts-headers
            maszyna-git
            pamac-aur
            python-urllib3-future-git
            r47
            scx-scheds-git
            sulis-git
            syncthingtray
            vicinae-git
            void-git
            yandex-browser
            zeronet-conservancy-git
            darkly
            lib32-rust-libs-git
            lib32-wivrn-server
            linux-mainline-docs
            linuxqq-nt-bwrap
            openvino-git
            planarally-bin
            plasmazones
            python-tensorrt
            qt6-xcb-private-headers-hifps
            rog-control-center
            waydroid-helper
            waydroid-helper-git
            yozo-office
            ags-hyprpanel-git
            gnome-terminal-transparency
            high-tide-git
            jcef-jetbrains-git
            meshroom
            mozillavpn-git
))

(define-public solar2d-git
  (package
    (name "solar2d-git")
    (version "3729.r0.afb6ec98")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/coronalabs/corona")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "solar2D (formerly Corona SDK) cross-platform game engine")
    (description "Solar2D (formerly Corona SDK) cross-platform game engine.")
    (home-page "https://github.com/coronalabs/corona")
    (license license:expat)))

(define-public vrcx
  (package
    (name "vrcx")
    (version "2026.02.11")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/vrcx-team/VRCX")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (synopsis "friendship management tool for VRChat (built with Electron)")
    (description "Friendship management tool for VRChat (built with Electron).")
    (home-page "https://github.com/vrcx-team/VRCX")
    (license license:expat)))

(define-public lsfg-vk-git
  (package
    (name "lsfg-vk-git")
    (version "2.0.0.dev.r15.14904b9")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/PancakeTAS/lsfg-vk")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "lossless Scaling Frame Generation on Linux")
    (description "Lossless Scaling Frame Generation on Linux.")
    (home-page "https://github.com/PancakeTAS/lsfg-vk")
    (license license:gpl3+)))

(define-public uzdoom
  (package
    (name "uzdoom")
    (version "4.14.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/uzdoom.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "uZDoom is a feature centric port for all Doom engine games, based on GZDoom..")
    (description "UZDoom is a feature centric port for all Doom engine games, based on GZDoom, adding an advanced renderer and powerful scripting capabilities.")
    (home-page "https://zdoom.org")
    (license license:bsd-3)))

(define-public ytm-player-git
  (package
    (name "ytm-player-git")
    (version "1.5.9")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/peternaame-boop/ytm-player")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a full-featured YouTube Music TUI client with vim-style navigation")
    (description "A full-featured YouTube Music TUI client with vim-style navigation.")
    (home-page "https://github.com/peternaame-boop/ytm-player")
    (license license:expat)))

(define-public plasma6-applets-eventcalendar
  (package
    (name "plasma6-applets-eventcalendar")
    (version "1.0.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/lenonk/plasma6-applet-eventcalendar")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "kDE Plasma 6 plasmoid for a calendar+agenda with weather that syncs to Goog..")
    (description "KDE Plasma 6 plasmoid for a calendar+agenda with weather that syncs to Google Calendar.")
    (home-page "https://github.com/lenonk/plasma6-applet-eventcalendar")
    (license license:gpl3+)))

(define-public pulsemeeter-git
  (package
    (name "pulsemeeter-git")
    (version "2.0.0.r0.54b7691")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/theRealCarneiro/pulsemeeter")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a pulseaudio and pipewire audio routing application")
    (description "A pulseaudio and pipewire audio routing application.")
    (home-page "https://github.com/theRealCarneiro/pulsemeeter")
    (license license:expat)))

(define-public zephyr-sdk
  (package
    (name "zephyr-sdk")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/zephyr-sdk.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "sDK for Zephyr real-time operating system")
    (description "SDK for Zephyr real-time operating system.")
    (home-page "https://www.zephyrproject.org/")
    (license license:asl2.0)))

(define-public eblande
  (package
    (name "eblande")
    (version "0.5")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/eblande.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "experimental fan-made desktop environment")
    (description "Experimental fan-made desktop environment.")
    (home-page "https://t.me/Futanari_OS")
    (license license:gpl3+)))

(define-public foldingathome
  (package
    (name "foldingathome")
    (version "1:8.5.5")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/foldingathome.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a distributed computing project for simulating protein dynamics")
    (description "A distributed computing project for simulating protein dynamics.")
    (home-page "https://foldingathome.org/")
    (license license:gpl3+)))

(define-public glaxnimate-git
  (package
    (name "glaxnimate-git")
    (version "0.6.0.r313.g2ef1d58")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/glaxnimate-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "simple vector animation program")
    (description "Simple vector animation program.")
    (home-page "https://invent.kde.org/graphics/glaxnimate")
    (license license:gpl3+)))

(define-public graphite-editor-git
  (package
    (name "graphite-editor-git")
    (version "r2430.d6c06da")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/GraphiteEditor/Graphite")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "raster & vector editor with a modern node-based, non-destructive, procedura..")
    (description "Raster & vector editor with a modern node-based, non-destructive, procedural workflow.")
    (home-page "https://github.com/GraphiteEditor/Graphite")
    (license license:asl2.0)))

(define-public grub-blscfg
  (package
    (name "grub-blscfg")
    (version "2:2.12.r359.g19c698d12")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/grub-blscfg.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "gNU GRand Unified Bootloader (2) with Fedoras blscfg patch")
    (description "GNU GRand Unified Bootloader (2) with Fedoras blscfg patch.")
    (home-page "https://www.gnu.org/software/grub/")
    (license license:gpl3+)))

(define-public gz-ionic
  (package
    (name "gz-ionic")
    (version "1.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/gazebosim/gz-ionic")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "gazebo Ionic: toolbox of development libraries and cloud services for robot..")
    (description "Gazebo Ionic: toolbox of development libraries and cloud services for robotics simulation.")
    (home-page "https://github.com/gazebosim/gz-ionic")
    (license license:asl2.0)))

(define-public home-assistant
  (package
    (name "home-assistant")
    (version "1:2026.4.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/home-assistant.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "open source home automation that puts local control and privacy first")
    (description "Open source home automation that puts local control and privacy first.")
    (home-page "https://home-assistant.io/")
    (license license:asl2.0)))

(define-public isd-git
  (package
    (name "isd-git")
    (version "0.5.1.r2.gd7fa6f9")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/isd-project/isd")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "interactive TUI for systemd units (development version)")
    (description "Interactive TUI for systemd units (development version).")
    (home-page "https://github.com/isd-project/isd")
    (license license:gpl3+)))

(define-public lib32-amdvlk
  (package
    (name "lib32-amdvlk")
    (version "2025.Q2.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/GPUOpen-Drivers")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "aMD's standalone Vulkan driver")
    (description "AMD's standalone Vulkan driver.")
    (home-page "https://github.com/GPUOpen-Drivers")
    (license license:expat)))

(define-public linux-cjktty
  (package
    (name "linux-cjktty")
    (version "6.19.12.arch1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/archlinux/linux")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the Linux (with cjktty-patches) kernel and modules")
    (description "The Linux (with cjktty-patches) kernel and modules.")
    (home-page "https://github.com/archlinux/linux")
    (license license:gpl2+)))

(define-public linux-lqx-docs
  (package
    (name "linux-lqx-docs")
    (version "6.19.12.lqx1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/linux-lqx-docs.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "documentation for the Linux Liquorix kernel")
    (description "Documentation for the Linux Liquorix kernel.")
    (home-page "https://liquorix.net/")
    (license license:gpl2+)))

(define-public linux-lqx-headers
  (package
    (name "linux-lqx-headers")
    (version "6.19.12.lqx1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/linux-lqx-headers.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "headers and scripts for building modules for the Linux Liquorix kernel")
    (description "Headers and scripts for building modules for the Linux Liquorix kernel.")
    (home-page "https://liquorix.net/")
    (license license:gpl2+)))

(define-public linux-xanmod
  (package
    (name "linux-xanmod")
    (version "6.19.12")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/linux-xanmod.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the Linux kernel and modules with Xanmod patches")
    (description "The Linux kernel and modules with Xanmod patches.")
    (home-page "http://www.xanmod.org/")
    (license license:gpl2+)))

(define-public linux-xanmod-edge
  (package
    (name "linux-xanmod-edge")
    (version "7.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/linux-xanmod-edge.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the Linux kernel and modules with Xanmod patches")
    (description "The Linux kernel and modules with Xanmod patches.")
    (home-page "http://www.xanmod.org/")
    (license license:gpl2+)))

(define-public meshiji
  (package
    (name "meshiji")
    (version "1.2.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Veridian-Zenith/meshiji")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a modern, flutter-based file explorer")
    (description "A modern, flutter-based file explorer.")
    (home-page "https://github.com/Veridian-Zenith/meshiji")
    (license license:non-copyleft)))

(define-public mingw-w64-gtk3
  (package
    (name "mingw-w64-gtk3")
    (version "3.24.51")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mingw-w64-gtk3.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "gObject-based multi-platform GUI toolkit (mingw-w64)")
    (description "GObject-based multi-platform GUI toolkit (mingw-w64).")
    (home-page "https://www.gtk.org")
    (license license:lgpl3+)))

(define-public pat-aur-host-git
  (package
    (name "pat-aur-host-git")
    (version "r542.9b72a20")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.com/patlefort/pat-aur")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "aUR helper and tool to build Arch Linux packages in clean containers. (host..")
    (description "AUR helper and tool to build Arch Linux packages in clean containers. (host machine).")
    (home-page "https://gitlab.com/patlefort/pat-aur")
    (license license:gpl3+)))

(define-public properdocs
  (package
    (name "properdocs")
    (version "1.6.7")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/properdocs.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "project documentation with Markdown")
    (description "Project documentation with Markdown.")
    (home-page "https://properdocs.org")
    (license license:bsd-3)))

(define-public runescape-launcher
  (package
    (name "runescape-launcher")
    (version "2.2.12")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/runescape-launcher.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "runeScape Game Client (NXT)")
    (description "RuneScape Game Client (NXT).")
    (home-page "https://www.runescape.com/")
    (license license:non-copyleft)))

(define-public sparrow-wifi-git
  (package
    (name "sparrow-wifi-git")
    (version "r189.7521e4d")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ghostop14/sparrow-wifi")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "next-Gen GUI-based WiFi and Bluetooth Analyzer for Linux")
    (description "Next-Gen GUI-based WiFi and Bluetooth Analyzer for Linux.")
    (home-page "https://github.com/ghostop14/sparrow-wifi")
    (license license:gpl3+)))

(define-public steamlink
  (package
    (name "steamlink")
    (version "1.3.24.301")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/steamlink.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "steam Link client")
    (description "Steam Link client.")
    (home-page "https://store.steampowered.com/remoteplay#anywhere")
    (license license:non-copyleft)))

(define-public yabridge-wine10-git
  (package
    (name "yabridge-wine10-git")
    (version "r3077.42e0794d")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/robbert-vdh/yabridge")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a modern and transparent way to use Windows VST2 and VST3 plugins on Linux ..")
    (description "A modern and transparent way to use Windows VST2 and VST3 plugins on Linux (git version branch=new-wine10-embedding).")
    (home-page "https://github.com/robbert-vdh/yabridge")
    (license license:gpl3+)))

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
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a cross-platform, GPU-accelerated terminal emulator")
    (description "A cross-platform, GPU-accelerated terminal emulator.")
    (home-page "https://github.com/ayosec/alacritty")
    (license license:asl2.0)))

(define-public alephone-git
  (package
    (name "alephone-git")
    (version "1.11.r6318.b3bf5d8d")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/alephone-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a free, enhanced port of the classic FPS \"Marathon 2\" by Bungie Software (d..")
    (description "A free, enhanced port of the classic FPS \"Marathon 2\" by Bungie Software (development version).")
    (home-page "https://alephone.lhowon.org/")
    (license license:gpl3+)))

(define-public astraeditor-git
  (package
    (name "astraeditor-git")
    (version "1.1.4.10.ga040bbf")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/AstraEditor")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (synopsis "astraEditor is a TurboWarp mod used to add more practical features to make ..")
    (description "AstraEditor is a TurboWarp mod used to add more practical features to make your writing lightning fast.")
    (home-page "https://github.com/AstraEditor/")
    (license license:gpl3+)))

(define-public fcitx5-lotus-git
  (package
    (name "fcitx5-lotus-git")
    (version "1.9.0.r603.ged379aa")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/LotusInputMethod/fcitx5-lotus")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "vietnamese input method for fcitx5")
    (description "Vietnamese input method for fcitx5.")
    (home-page "https://github.com/LotusInputMethod/fcitx5-lotus")
    (license license:gpl3+)))

(define-public fotema
  (package
    (name "fotema")
    (version "2.4.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/blissd/fotema")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "photo gallery for Linux")
    (description "Photo gallery for Linux.")
    (home-page "https://github.com/blissd/fotema")
    (license license:non-copyleft)))

(define-public gimp-nufraw
  (package
    (name "gimp-nufraw")
    (version "0.43.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gimp-nufraw.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "converter for raw files; utility and GIMP plugin")
    (description "Converter for raw files; utility and GIMP plugin.")
    (home-page "https://sourceforge.net/projects/nufraw/")
    (license license:gpl2+)))

(define-public gx52
  (package
    (name "gx52")
    (version "0.7.6")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.com/leinardi/gx52")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a GTK application designed to provide control for the LEDs and MFD of Logit..")
    (description "A GTK application designed to provide control for the LEDs and MFD of Logitech X52 and X52 Pro H.O.T.A.S.")
    (home-page "https://gitlab.com/leinardi/gx52")
    (license license:gpl3+)))

(define-public inputactions-kwin
  (package
    (name "inputactions-kwin")
    (version "0.9.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/InputActions/kwin")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "mouse and touchpad gestures for Plasma 6 Wayland")
    (description "Mouse and touchpad gestures for Plasma 6 Wayland.")
    (home-page "https://github.com/InputActions/kwin")
    (license license:gpl3+)))

(define-public lib32-python
  (package
    (name "lib32-python")
    (version "3.13.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lib32-python.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "next generation of the python high-level scripting language")
    (description "Next generation of the python high-level scripting language.")
    (home-page "http://www.python.org/")
    (license license:non-copyleft)))

(define-public linux-g14
  (package
    (name "linux-g14")
    (version "6.18.9.arch1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.com/asus-linux/linux-g14")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the Linux-g14 kernel and modules")
    (description "The Linux-g14 kernel and modules.")
    (home-page "https://gitlab.com/asus-linux/linux-g14")
    (license license:gpl2+)))

(define-public manaverse-git
  (package
    (name "manaverse-git")
    (version "1.0r13075.655bf6d")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/manaverse-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a ManaPlus fork and official game client for The Mana World")
    (description "A ManaPlus fork and official game client for The Mana World.")
    (home-page "https://manaplus.germantmw.de/")
    (license license:gpl2+)))

(define-public manaverse-sdl2-git
  (package
    (name "manaverse-sdl2-git")
    (version "1.0r13075.655bf6d")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/manaverse-sdl2-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a ManaPlus fork and official game client for The Mana World. SDL2 version")
    (description "A ManaPlus fork and official game client for The Mana World. SDL2 version.")
    (home-page "https://manaplus.germantmw.de/")
    (license license:gpl2+)))

(define-public mcpelauncher-linux-git
  (package
    (name "mcpelauncher-linux-git")
    (version "1.2.0.r0.gfe07760")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/minecraft-linux/mcpelauncher-manifest")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "minecraft: Pocket Edition launcher for Linux")
    (description "Minecraft: Pocket Edition launcher for Linux.")
    (home-page "https://github.com/minecraft-linux/mcpelauncher-manifest")
    (license license:non-copyleft)))

(define-public meowpad-configurator-v2-git
  (package
    (name "meowpad-configurator-v2-git")
    (version "1.2.0.r160.b2886a0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/meowpad-configurator-v2-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "meowpad v2 配置器")
    (description "Meowpad v2 配置器.")
    (home-page "https://desu.life/")
    (license license:expat)))

(define-public mininet
  (package
    (name "mininet")
    (version "2.3.1b4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/mininet/mininet")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "emulator for rapid prototyping of Software Defined Networks")
    (description "Emulator for rapid prototyping of Software Defined Networks.")
    (home-page "https://github.com/mininet/mininet")
    (license license:non-copyleft)))

(define-public nip4
  (package
    (name "nip4")
    (version "9.0.18")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/libvips/nip4")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "image processing spreadsheet")
    (description "Image processing spreadsheet.")
    (home-page "https://github.com/libvips/nip4")
    (license license:expat)))

(define-public ossia-score
  (package
    (name "ossia-score")
    (version "3.7.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ossia-score.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "ossia score, an interactive sequencer for the intermedia arts")
    (description "Ossia score, an interactive sequencer for the intermedia arts.")
    (home-page "https://ossia.io")
    (license license:gpl3+)))

(define-public polymc-qt5-git
  (package
    (name "polymc-qt5-git")
    (version "5.0.r25.g2358e6fa")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/PolyMC/PolyMC")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "minecraft launcher with the ability to manage multiple instances")
    (description "Minecraft launcher with the ability to manage multiple instances.")
    (home-page "https://github.com/PolyMC/PolyMC")
    (license license:gpl3+)))

(define-public python-llama-cpp-hip
  (package
    (name "python-llama-cpp-hip")
    (version "0.3.16")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/abetlen/llama-cpp-python")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "python bindings for llama.cpp (with HIP/ROCM support)")
    (description "Python bindings for llama.cpp (with HIP/ROCM support).")
    (home-page "https://github.com/abetlen/llama-cpp-python")
    (license license:gpl3+)))

(define-public python-wandb
  (package
    (name "python-wandb")
    (version "0.25.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-wandb.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a tool for visualizing and tracking your machine learning experiments")
    (description "A tool for visualizing and tracking your machine learning experiments.")
    (home-page "https://wandb.ai")
    (license license:expat)))

(define-public the-honkers-railway-launcher
  (package
    (name "the-honkers-railway-launcher")
    (version "1.14.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/an-anime-team/the-honkers-railway-launcher")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the Honkers Railway launcher for Linux with automatic patching and telemetr..")
    (description "The Honkers Railway launcher for Linux with automatic patching and telemetry disabling.")
    (home-page "https://github.com/an-anime-team/the-honkers-railway-launcher")
    (license license:gpl3+)))

(define-public wsjtx-improved
  (package
    (name "wsjtx-improved")
    (version "3.1.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/wsjtx-improved.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "software for Amateur Radio Weak-Signal Communication (JT9 and JT65) - WSJT-..")
    (description "Software for Amateur Radio Weak-Signal Communication (JT9 and JT65) - WSJT-X Improved by DG2YCB.")
    (home-page "https://sourceforge.net/projects/wsjt-x-improved/")
    (license license:gpl3+)))

(define-public wsjtx-improved-al
  (package
    (name "wsjtx-improved-al")
    (version "3.1.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/wsjtx-improved-al.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "software for Amateur Radio Weak-Signal Communication (JT9 and JT65) - WSJT-..")
    (description "Software for Amateur Radio Weak-Signal Communication (JT9 and JT65) - WSJT-X Improved by DG2YCB (Alternative Layout Version).")
    (home-page "https://sourceforge.net/projects/wsjt-x-improved/")
    (license license:gpl3+)))

(define-public xawtv
  (package
    (name "xawtv")
    (version "3.107")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/xawtv.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a simple Xaw-based TV program which uses the bttv driver or video4linux")
    (description "A simple Xaw-based TV program which uses the bttv driver or video4linux.")
    (home-page "https://linuxtv.org")
    (license license:gpl3+)))

(define-public anydesk-legacy-bin
  (package
    (name "anydesk-legacy-bin")
    (version "6.0.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/anydesk-legacy-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"))))
    (synopsis "legacy AnyDesk 6.0.1. Stable version without commercial use nags or timeouts")
    (description "Legacy AnyDesk 6.0.1. Stable version without commercial use nags or timeouts.")
    (home-page "https://www.anydesk.com")
    (license license:non-copyleft)))

(define-public baballonia
  (package
    (name "baballonia")
    (version "v1.1.1.0rc6")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Project-Babble/Baballonia")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a cross-platform, hardware-agnostic VR eye and face tracking application")
    (description "A cross-platform, hardware-agnostic VR eye and face tracking application.")
    (home-page "https://github.com/Project-Babble/Baballonia")
    (license license:non-copyleft)))

(define-public bareos-bconsole
  (package
    (name "bareos-bconsole")
    (version "25.0.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/bareos-bconsole.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "bareos - Backup Archiving Recovery Open Sourced - Admin Tool (CLI)")
    (description "Bareos - Backup Archiving Recovery Open Sourced - Admin Tool (CLI).")
    (home-page "http://www.bareos.org")
    (license license:agpl3+)))

(define-public betterwallpaper-git
  (package
    (name "betterwallpaper-git")
    (version "0.6.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Misiix9/BetterWallpaper")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a modern, high-performance animated wallpaper manager for Linux")
    (description "A modern, high-performance animated wallpaper manager for Linux.")
    (home-page "https://github.com/Misiix9/BetterWallpaper")
    (license license:gpl3+)))

(define-public bugwarrior-git
  (package
    (name "bugwarrior-git")
    (version "1585.d166c3f")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/bugwarrior-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "pull issues from issue trackers into taskwarrior (GitHub, GitLab, Bitbucket..")
    (description "Pull issues from issue trackers into taskwarrior (GitHub, GitLab, Bitbucket, etc.).")
    (home-page "https://bugwarrior.readthedocs.io")
    (license license:gpl3+)))

(define-public c47
  (package
    (name "c47")
    (version "00.109.03.01b1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/c47.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "emulator for the C47 pocket calculator")
    (description "Emulator for the C47 pocket calculator.")
    (home-page "https://47calc.com")
    (license license:gpl3+)))

(define-public collabora-office
  (package
    (name "collabora-office")
    (version "25.04.9.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/collabora-office.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (synopsis "collabora Office - Qt6 desktop document editor powered by Collabora Online")
    (description "Collabora Office - Qt6 desktop document editor powered by Collabora Online.")
    (home-page "https://collaboraoffice.com")
    (license license:mpl2.0)))

(define-public invidious
  (package
    (name "invidious")
    (version "2.20260207.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/iv-org/invidious")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "alternative front-end to YouTube")
    (description "Alternative front-end to YouTube.")
    (home-page "https://github.com/iv-org/invidious")
    (license license:agpl3+)))

(define-public karton
  (package
    (name "karton")
    (version "git20260123")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/karton.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a libvirt-based Virtual Machine Manager for KDE")
    (description "A libvirt-based Virtual Machine Manager for KDE.")
    (home-page "https://invent.kde.org/sitter/karton")
    (license license:gpl3+)))

(define-public linux-cachyos-cjktty-headers
  (package
    (name "linux-cachyos-cjktty-headers")
    (version "6.19.11")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/CachyOS/linux-cachyos")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "headers and scripts for building modules for the CachyOS Linux kernel with ..")
    (description "Headers and scripts for building modules for the CachyOS Linux kernel with cjktty patches kernel.")
    (home-page "https://github.com/CachyOS/linux-cachyos")
    (license license:gpl2+)))

(define-public linux-cachyos-rc-headers
  (package
    (name "linux-cachyos-rc-headers")
    (version "7.0.rc7")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/CachyOS/linux-cachyos")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "headers and scripts for building modules for the Linux Clang ThinLTO + Auto..")
    (description "Headers and scripts for building modules for the Linux Clang ThinLTO + AutoFDO + Cachy Sauce Kernel by CachyOS with other patches and improvements - Release Candidate kernel.")
    (home-page "https://github.com/CachyOS/linux-cachyos")
    (license license:gpl2+)))

(define-public linux-libre-hardened-docs
  (package
    (name "linux-libre-hardened-docs")
    (version "6.17.13.hardened1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/linux-libre-hardened-docs.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "documentation for the Security-Hardened Linux-libre kernel")
    (description "Documentation for the Security-Hardened Linux-libre kernel.")
    (home-page "https://linux-libre.fsfla.org/")
    (license license:gpl2+)))

(define-public linux-libre-hardened-headers
  (package
    (name "linux-libre-hardened-headers")
    (version "6.17.13.hardened1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/linux-libre-hardened-headers.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "headers and scripts for building modules for the Security-Hardened Linux-li..")
    (description "Headers and scripts for building modules for the Security-Hardened Linux-libre kernel.")
    (home-page "https://linux-libre.fsfla.org/")
    (license license:gpl2+)))

(define-public linux-vfio-lts-headers
  (package
    (name "linux-vfio-lts-headers")
    (version "6.18.22")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/linux-vfio-lts-headers.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "headers and scripts for building modules for the LTS Linux kernel (ACS over..")
    (description "Headers and scripts for building modules for the LTS Linux kernel (ACS override and i915 VGA arbiter patches).")
    (home-page "https://www.kernel.org")
    (license license:gpl2+)))

(define-public maszyna-git
  (package
    (name "maszyna-git")
    (version "r2801.01bcadff")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/maszyna-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "polish train simulator")
    (description "Polish train simulator.")
    (home-page "https://eu07.pl/")
    (license license:non-copyleft)))

(define-public pamac-aur
  (package
    (name "pamac-aur")
    (version "11.7.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/manjaro/pamac")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a Gtk frontend, Package Manager based on libalpm with AUR and Appstream sup..")
    (description "A Gtk frontend, Package Manager based on libalpm with AUR and Appstream support.")
    (home-page "https://github.com/manjaro/pamac")
    (license license:gpl3+)))

(define-public python-urllib3-future-git
  (package
    (name "python-urllib3-future-git")
    (version "2.12.915.r0.g60af644f")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/jawah/urllib3.future")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "powerful HTTP 1.1, 2, and 3 client with both sync and async interfaces (bui..")
    (description "Powerful HTTP 1.1, 2, and 3 client with both sync and async interfaces (built from latest git commit).")
    (home-page "https://github.com/jawah/urllib3.future")
    (license license:expat)))

(define-public r47
  (package
    (name "r47")
    (version "00.109.03.01b1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/r47.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "emulator for the R47 pocket calculator")
    (description "Emulator for the R47 pocket calculator.")
    (home-page "https://47calc.com")
    (license license:gpl3+)))

(define-public scx-scheds-git
  (package
    (name "scx-scheds-git")
    (version "1.1.0.r322.gc0acb76f")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/sched-ext/scx")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "sched_ext schedulers and tools")
    (description "Sched_ext schedulers and tools.")
    (home-page "https://github.com/sched-ext/scx")
    (license license:gpl2+)))

(define-public sulis-git
  (package
    (name "sulis-git")
    (version "1.0.0.20250112")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/sulis-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "turn based tactical RPG with several campaigns, written in Rust")
    (description "Turn based tactical RPG with several campaigns, written in Rust.")
    (home-page "https://www.sulisgame.com/")
    (license license:gpl3+)))

(define-public syncthingtray
  (package
    (name "syncthingtray")
    (version "2.0.10")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Martchus/syncthingtray")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "tray application for Syncthing")
    (description "Tray application for Syncthing.")
    (home-page "https://github.com/Martchus/syncthingtray")
    (license license:gpl2+)))

(define-public vicinae-git
  (package
    (name "vicinae-git")
    (version "0.15.1.r1.g8cc6e59")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/vicinaehq/vicinae")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a focused launcher for your desktop — native, fast, extensible")
    (description "A focused launcher for your desktop — native, fast, extensible.")
    (home-page "https://github.com/vicinaehq/vicinae")
    (license license:gpl3+)))

(define-public void-git
  (package
    (name "void-git")
    (version "1.99.3.r2771.g17e7a5b1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/voideditor/void")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the Cursor alternative AI code editor")
    (description "The Cursor alternative AI code editor.")
    (home-page "https://github.com/voideditor/void")
    (license license:expat)))

(define-public yandex-browser
  (package
    (name "yandex-browser")
    (version "26.3.1.1041")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/yandex-browser.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the web browser from Yandex. Yandex Browser is a browser that combines a mi..")
    (description "The web browser from Yandex. Yandex Browser is a browser that combines a minimal design with sophisticated technology to make the web faster, safer, and easier.")
    (home-page "https://browser.yandex.com/")
    (license license:non-copyleft)))

(define-public zeronet-conservancy-git
  (package
    (name "zeronet-conservancy-git")
    (version "0.7.8+.r5037.g0475a39f")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/zeronet-conservancy/zeronet-conservancy")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "modern client for decentralized p2p web platform 0net")
    (description "Modern client for decentralized p2p web platform 0net.")
    (home-page "https://github.com/zeronet-conservancy/zeronet-conservancy/")
    (license license:gpl3+)))

(define-public darkly
  (package
    (name "darkly")
    (version "0.5.37")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Bali10050/darkly")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "fork of Lightly (A modern style for Qt applications)")
    (description "Fork of Lightly (A modern style for Qt applications).")
    (home-page "https://github.com/Bali10050/darkly")
    (license license:gpl2+)))

(define-public lib32-rust-libs-git
  (package
    (name "lib32-rust-libs-git")
    (version "1:1.96.0.r1.g0312931")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lib32-rust-libs-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "32-bit target and libraries for Rust (GIT VERSION)")
    (description "32-bit target and libraries for Rust (GIT VERSION).")
    (home-page "https://www.rust-lang.org/")
    (license license:asl2.0)))

(define-public lib32-wivrn-server
  (package
    (name "lib32-wivrn-server")
    (version "26.2.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/WiVRn/WiVRn")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a wireless Monado-based OpenXR runtime for standalone headsets")
    (description "A wireless Monado-based OpenXR runtime for standalone headsets.")
    (home-page "https://github.com/WiVRn/WiVRn")
    (license license:gpl3+)))

(define-public linux-mainline-docs
  (package
    (name "linux-mainline-docs")
    (version "7.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/linux-mainline-docs.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "documentation for the Linux Mainline kernel")
    (description "Documentation for the Linux Mainline kernel.")
    (home-page "https://kernel.org/")
    (license license:gpl2+)))

(define-public linuxqq-nt-bwrap
  (package
    (name "linuxqq-nt-bwrap")
    (version "3.2.27_260401")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/linuxqq-nt-bwrap.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "new Linux QQ based on Electron, with bubblewrap sandbox and some tweaks")
    (description "New Linux QQ based on Electron, with bubblewrap sandbox and some tweaks.")
    (home-page "https://im.qq.com/linuxqq/index.shtml")
    (license license:non-copyleft)))

(define-public openvino-git
  (package
    (name "openvino-git")
    (version "2026.1.0.r208.g0f186e20b70")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/openvino-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a toolkit for optimizing and deploying deep learning models (git version)")
    (description "A toolkit for optimizing and deploying deep learning models (git version).")
    (home-page "https://docs.openvino.ai/")
    (license license:asl2.0)))

(define-public planarally-bin
  (package
    (name "planarally-bin")
    (version "2026.1.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/planarally-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"))))
    (synopsis "planarAlly v2026.1.2")
    (description "PlanarAlly v2026.1.2.")
    (home-page "https://www.planarally.io")
    (license license:expat)))

(define-public plasmazones
  (package
    (name "plasmazones")
    (version "2.8.7")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/fuddlesworth/PlasmaZones")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "window tiling and autotiling for KDE Plasma")
    (description "Window tiling and autotiling for KDE Plasma.")
    (home-page "https://github.com/fuddlesworth/PlasmaZones")
    (license license:gpl3+)))

(define-public python-tensorrt
  (package
    (name "python-tensorrt")
    (version "10.16.0.72")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-tensorrt.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a platform for high-performance deep learning inference on NVIDIA hardware ..")
    (description "A platform for high-performance deep learning inference on NVIDIA hardware (python bindings and tools).")
    (home-page "https://developer.nvidia.com/tensorrt/")
    (license license:asl2.0)))

(define-public qt6-xcb-private-headers-hifps
  (package
    (name "qt6-xcb-private-headers-hifps")
    (version "6.11.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/qt6-xcb-private-headers-hifps.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "private headers for Qt6 Xcb")
    (description "Private headers for Qt6 Xcb.")
    (home-page "https://www.qt.io")
    (license license:gpl3+)))

(define-public rog-control-center
  (package
    (name "rog-control-center")
    (version "6.3.7")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/rog-control-center.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "app to control asusctl")
    (description "App to control asusctl.")
    (home-page "https://asus-linux.org")
    (license license:mpl2.0)))

(define-public waydroid-helper
  (package
    (name "waydroid-helper")
    (version "0.2.9")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ayasa520/waydroid-helper")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a GUI application for Waydroid configuration and extension installation")
    (description "A GUI application for Waydroid configuration and extension installation.")
    (home-page "https://github.com/ayasa520/waydroid-helper")
    (license license:gpl3+)))

(define-public waydroid-helper-git
  (package
    (name "waydroid-helper-git")
    (version "r66.5279fe3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ayasa520/waydroid-helper")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a GUI application for Waydroid configuration and extension installation")
    (description "A GUI application for Waydroid configuration and extension installation.")
    (home-page "https://github.com/ayasa520/waydroid-helper")
    (license license:gpl3+)))

(define-public yozo-office
  (package
    (name "yozo-office")
    (version "9.0.6589.141ZH.S1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/yozo-office.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "yozo Office 2024 - An MS Office compatible office suite")
    (description "Yozo Office 2024 - An MS Office compatible office suite.")
    (home-page "https://www.yozosoft.com/product-officelinux.html")
    (license license:non-copyleft)))

(define-public ags-hyprpanel-git
  (package
    (name "ags-hyprpanel-git")
    (version "r606.d489592")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ags-hyprpanel-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a Bar/Panel for Hyprland with extensive customizability")
    (description "A Bar/Panel for Hyprland with extensive customizability.")
    (home-page "https://hyprpanel.com/")
    (license license:expat)))

(define-public gnome-terminal-transparency
  (package
    (name "gnome-terminal-transparency")
    (version "3.58.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gnome-terminal-transparency.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the GNOME Terminal Emulator with background transparency")
    (description "The GNOME Terminal Emulator with background transparency.")
    (home-page "https://wiki.gnome.org/Apps/Terminal")
    (license license:non-copyleft)))

(define-public high-tide-git
  (package
    (name "high-tide-git")
    (version "1.2.0.r24.ga662d6c")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Nokse22/high-tide")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "linux client for TIDAL streaming service")
    (description "Linux client for TIDAL streaming service.")
    (home-page "https://github.com/Nokse22/high-tide")
    (license license:gpl3+)))

(define-public jcef-jetbrains-git
  (package
    (name "jcef-jetbrains-git")
    (version "137.0.17.api1.21.r1156.8d939c80")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/JetBrains/jcef")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a simple framework for embedding Chromium-based browsers into Java-based ap..")
    (description "A simple framework for embedding Chromium-based browsers into Java-based applications. (Used for JetBrainsRuntime).")
    (home-page "https://github.com/JetBrains/jcef")
    (license license:bsd-3)))

(define-public meshroom
  (package
    (name "meshroom")
    (version "2025.1.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/meshroom.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a free, open-source 3D Reconstruction Software based on the AliceVision fra..")
    (description "A free, open-source 3D Reconstruction Software based on the AliceVision framework.")
    (home-page "https://alicevision.org/#meshroom")
    (license license:mpl2.0)))

(define-public mozillavpn-git
  (package
    (name "mozillavpn-git")
    (version "2.33.0.r44.ga57cfe8")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/mozilla-mobile/mozilla-vpn-client")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "fast, secure, and easy to use VPN from the makers of Firefox")
    (description "Fast, secure, and easy to use VPN from the makers of Firefox.")
    (home-page "https://github.com/mozilla-mobile/mozilla-vpn-client")
    (license license:mpl2.0)))
