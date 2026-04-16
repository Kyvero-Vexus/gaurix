;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency tree resolver pass --- deptree-resolver-260416b
;;; Resolves 99 packages from dependency tree queue.
;;;
;;; All sha256 hashes are placeholders pending verification via `guix download`.

(define-module (gaurix packages deptree-resolver-260416b)
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
  #:use-module (guix build-system node)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:export (expressvpn-gui-nhk
            pacman-static
            pamac-classic-fixed
            lib32-vkbasalt-redemp-git
            lib32-xrizer-git
            penpot-frontend
            snowflake-connector-python
            soh-otr-exporter
            solar2d-git
            stickerpicker-git
            switchboard-plug-desktop-git
            throne
            turtle
            tuwunel-git
            vesc-tool
            vita3k-git
            vrcx
            wiiudownloader
            xrizer-multilib-git
            2s2h-otr-exporter
            breezy-desktop-gnome-git
            czkawka-git
            eddie-ui
            faugus-launcher-git
            flix-cli
            gpu-viewer
            grub-improved-luks2-git
            kate-discord-rpc-git
            libfprint-goodixtls-55x4
            libgda-firebird
            libgda-mysql
            libgda-postgres
            linux-g14-headers
            llvm17-libs
            lsfg-vk-git
            maint
            ollama-docs-git
            onvif-gui
            opencloud-desktop
            openhv
            osrm-backend
            pacpush
            path-of-building-community-git
            penpot-mcp
            perl-perl-languageserver
            pix
            plasma-gamemode-git
            python-withoutbg
            python313-freethreaded
            remarshal
            riseup-vpn
            safe-discover
            simgear
            songrec-git
            spaghettikart
            tartube
            trae-cn-desktop-bin
            uzdoom
            vbam-sdl
            visual-studio-code-live-bin
            wayfire-plugins-extra
            winboat-electron
            yacreader-poppler
            ytm-player-git
            albert-git
            arch-wiki-search
            banjorecomp
            bilibili
            chrome-remote-desktop
            clang-libs-minimal-git
            code-translucent
            discover-overlay-git
            emacs-mozc-with-jp-dict
            fluffychat
            git-wd40
            guiman
            libgda-jdbc
            linux-cachyos-lts-headers
            lution
            normcap
            ollama-cuda-git
            ollama-rocm-git
            pamac-aur-git
            pantheon-session-git
            parallels-client
            plasma6-applets-eventcalendar
            processing
            pulsemeeter-git
            python-llama-cpp-vulkan
            python-quimb
            qrookie-vrp
            reform-tools
            vkdoom-git
            xlibre-video-intel-bin
            xoreos
            zephyr-sdk
            caffeine-ng-git
            conquest-git
            deepin-wine10-stable
))

(define-public expressvpn-gui-nhk
  (package
    (name "expressvpn-gui-nhk")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nhktmdzhg/expressvpn-gui")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "unofficial linux GUI for expressvpn CLI (Qt)")
    (description "Unofficial linux GUI for expressvpn CLI (Qt).")
    (home-page "https://github.com/nhktmdzhg/expressvpn-gui")
    (license license:non-copyleft)))

(define-public pacman-static
  (package
    (name "pacman-static")
    (version "7.1.0.r9.g54d9411")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/pacman-static.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "statically-compiled pacman (to fix or install systems without libc)")
    (description "Statically-compiled pacman (to fix or install systems without libc).")
    (home-page "https://www.archlinux.org/pacman/")
    (license license:gpl2+)))

(define-public pamac-classic-fixed
  (package
    (name "pamac-classic-fixed")
    (version "7.3.0.r764.g76e060f")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/boussou/pamac-classic")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a Gtk3 frontend for libalpm - classic version - AUR not working")
    (description "A Gtk3 frontend for libalpm - classic version - AUR not working.")
    (home-page "https://github.com/boussou/pamac-classic")
    (license license:gpl3+)))

(define-public lib32-vkbasalt-redemp-git
  (package
    (name "lib32-vkbasalt-redemp-git")
    (version "r470.d5c38ed")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Redemp/vkBasalt")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a Vulkan post-processing layer. (Redemp fork) (32-bit)")
    (description "A Vulkan post-processing layer. (Redemp fork) (32-bit).")
    (home-page "https://github.com/Redemp/vkBasalt")
    (license license:zlib)))

(define-public lib32-xrizer-git
  (package
    (name "lib32-xrizer-git")
    (version "0.3.r34.gbb7e2e5")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Supreeeme/xrizer")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "reimplementation of OpenVR, translating calls to OpenXR (32-bit)")
    (description "Reimplementation of OpenVR, translating calls to OpenXR (32-bit).")
    (home-page "https://github.com/Supreeeme/xrizer")
    (license license:gpl3+)))

(define-public penpot-frontend
  (package
    (name "penpot-frontend")
    (version "2.14.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/penpot-frontend.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the open-source design tool for design and code collaboration")
    (description "The open-source design tool for design and code collaboration.")
    (home-page "https://penpot.app")
    (license license:mpl2.0)))

(define-public snowflake-connector-python
  (package
    (name "snowflake-connector-python")
    (version "3.17.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/snowflakedb/snowflake-connector-python")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "snowflake Connector for Python (DB-API 2.0)")
    (description "Snowflake Connector for Python (DB-API 2.0).")
    (home-page "https://github.com/snowflakedb/snowflake-connector-python")
    (license license:asl2.0)))

(define-public soh-otr-exporter
  (package
    (name "soh-otr-exporter")
    (version "9.2.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/soh-otr-exporter.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "oTR generation tools for SoH. Includes asset XML files needed for generation")
    (description "OTR generation tools for SoH. Includes asset XML files needed for generation.")
    (home-page "https://shipofharkinian.com/")
    (license license:expat)))

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

(define-public stickerpicker-git
  (package
    (name "stickerpicker-git")
    (version "r100.4c13a2c")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/maunium/stickerpicker")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "element sticker picker widget")
    (description "Element sticker picker widget.")
    (home-page "https://github.com/maunium/stickerpicker")
    (license license:agpl3+)))

(define-public switchboard-plug-desktop-git
  (package
    (name "switchboard-plug-desktop-git")
    (version "8.0.0.r27.gbdc8c167")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/elementary/switchboard-plug-pantheon-shell")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "switchboard Desktop Plug")
    (description "Switchboard Desktop Plug.")
    (home-page "https://github.com/elementary/switchboard-plug-pantheon-shell")
    (license license:gpl3+)))

(define-public throne
  (package
    (name "throne")
    (version "1.0.13")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/throneproj/Throne")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "qt based cross-platform GUI proxy configuration manager (backend: sing-box)")
    (description "Qt based cross-platform GUI proxy configuration manager (backend: sing-box).")
    (home-page "https://github.com/throneproj/Throne")
    (license license:gpl3+)))

(define-public turtle
  (package
    (name "turtle")
    (version "0.14")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/turtle.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "manage your git repositories with easy-to-use dialogs in Nautilus")
    (description "Manage your git repositories with easy-to-use dialogs in Nautilus.")
    (home-page "https://gitlab.gnome.org/philippun1/turtle")
    (license license:gpl3+)))

(define-public tuwunel-git
  (package
    (name "tuwunel-git")
    (version "0.5.0.5108.geb2949d6")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/matrix-construct/tuwunel")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "successor to conduwuit with stable governance")
    (description "Successor to conduwuit with stable governance.")
    (home-page "https://github.com/matrix-construct/tuwunel")
    (license license:asl2.0)))

(define-public vesc-tool
  (package
    (name "vesc-tool")
    (version "6.06")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/vesc-tool.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "vESC ESC graphical configuration tool")
    (description "VESC ESC graphical configuration tool.")
    (home-page "https://vesc-project.com/vesc_tool")
    (license license:gpl3+)))

(define-public vita3k-git
  (package
    (name "vita3k-git")
    (version "r3858.7b21f596a")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Vita3K/Vita3K")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "experimental PlayStation Vita emulator")
    (description "Experimental PlayStation Vita emulator.")
    (home-page "https://github.com/Vita3K/Vita3K")
    (license license:gpl2+)))

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

(define-public wiiudownloader
  (package
    (name "wiiudownloader")
    (version "2.89")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Xpl0itU/WiiUDownloader")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/Xpl0itU/WiiUDownloader"
           #:tests? #f))
    (synopsis "allows to download encrypted wiiu files from nintendo's official servers")
    (description "Allows to download encrypted wiiu files from nintendo's official servers.")
    (home-page "https://github.com/Xpl0itU/WiiUDownloader")
    (license license:gpl3+)))

(define-public xrizer-multilib-git
  (package
    (name "xrizer-multilib-git")
    (version "r302.dd7f121")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Mr-Zero88/xrizer")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "reimplementation of OpenVR, translating calls to OpenXR. (32-bit support)")
    (description "Reimplementation of OpenVR, translating calls to OpenXR. (32-bit support).")
    (home-page "https://github.com/Mr-Zero88/xrizer")
    (license license:gpl3+)))

(define-public 2s2h-otr-exporter
  (package
    (name "2s2h-otr-exporter")
    (version "4.0.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/HarbourMasters/2ship2harkinian")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "oTR generation tools for 2S2H. Includes asset XML files needed for generation")
    (description "OTR generation tools for 2S2H. Includes asset XML files needed for generation.")
    (home-page "https://github.com/HarbourMasters/2ship2harkinian")
    (license license:expat)))

(define-public breezy-desktop-gnome-git
  (package
    (name "breezy-desktop-gnome-git")
    (version "2.9.8")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/wheaney/breezy-desktop")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "breezy GNOME - XR desktop")
    (description "Breezy GNOME - XR desktop.")
    (home-page "https://github.com/wheaney/breezy-desktop")
    (license license:gpl3+)))

(define-public czkawka-git
  (package
    (name "czkawka-git")
    (version "11.0.1.r6.g8aa765fc")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/qarmin/czkawka")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "multi functional app to find duplicates, empty folders, similar images etc")
    (description "Multi functional app to find duplicates, empty folders, similar images etc.")
    (home-page "https://github.com/qarmin/czkawka")
    (license license:gpl3+)))

(define-public eddie-ui
  (package
    (name "eddie-ui")
    (version "2.24.6")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/eddie-ui.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "eddie - VPN tunnel - UI")
    (description "Eddie - VPN tunnel - UI.")
    (home-page "https://eddie.website")
    (license license:gpl3+)))

(define-public faugus-launcher-git
  (package
    (name "faugus-launcher-git")
    (version "r659.764c6b7")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Faugus/faugus-launcher")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a simple and lightweight app for running Windows games using UMU-Launcher")
    (description "A simple and lightweight app for running Windows games using UMU-Launcher.")
    (home-page "https://github.com/Faugus/faugus-launcher")
    (license license:expat)))

(define-public flix-cli
  (package
    (name "flix-cli")
    (version "1.8.1.17")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://codeberg.org/s-warn/flix-cli")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "watch movies and series from your commandline")
    (description "Watch movies and series from your commandline.")
    (home-page "https://codeberg.org/s-warn/flix-cli")
    (license license:gpl3+)))

(define-public gpu-viewer
  (package
    (name "gpu-viewer")
    (version "3.32")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/arunsivaramanneo/GPU-Viewer")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a frontend to glxinfo and vulkaninfo")
    (description "A frontend to glxinfo and vulkaninfo.")
    (home-page "https://github.com/arunsivaramanneo/GPU-Viewer/")
    (license license:gpl3+)))

(define-public grub-improved-luks2-git
  (package
    (name "grub-improved-luks2-git")
    (version "2.12.r248.gff7f55307")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/grub-improved-luks2-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "gNU GRand Unified Bootloader (2) with Argon2 support. Patch made by Patrick..")
    (description "GNU GRand Unified Bootloader (2) with Argon2 support. Patch made by Patrick Steinhardt.")
    (home-page "https://www.gnu.org/software/grub/")
    (license license:cc0)))

(define-public kate-discord-rpc-git
  (package
    (name "kate-discord-rpc-git")
    (version "r5.1d790ff")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/leia-uwu/kate-discord-rpc")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "discord RPC Plugin for Kate")
    (description "Discord RPC Plugin for Kate.")
    (home-page "https://github.com/leia-uwu/kate-discord-rpc")
    (license license:gpl2+)))

(define-public libfprint-goodixtls-55x4
  (package
    (name "libfprint-goodixtls-55x4")
    (version "r1802.6e4fdc0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/libfprint-goodixtls-55x4.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "libfprint fork for goodixtls 55x4 devices. Currently supports 55b4 but 55a4..")
    (description "Libfprint fork for goodixtls 55x4 devices. Currently supports 55b4 but 55a4 will be added later. Note you will need to flash your device with [goodix-fp-dump](https://github.com/mpi3d/goodix-fp-dump) to use this.")
    (home-page "https://aur.archlinux.org/packages/libfprint-goodixtls-55x4")
    (license license:lgpl3+)))

(define-public libgda-firebird
  (package
    (name "libgda-firebird")
    (version "5.2.10")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/libgda-firebird.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "libgda provider for Firebird")
    (description "Libgda provider for Firebird.")
    (home-page "https://www.gnome-db.org/")
    (license license:gpl3+)))

(define-public libgda-mysql
  (package
    (name "libgda-mysql")
    (version "5.2.10")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/libgda-mysql.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "libgda provider for MySQL")
    (description "Libgda provider for MySQL.")
    (home-page "https://www.gnome-db.org/")
    (license license:gpl3+)))

(define-public libgda-postgres
  (package
    (name "libgda-postgres")
    (version "5.2.10")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/libgda-postgres.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "libgda provider for PostgreSQL")
    (description "Libgda provider for PostgreSQL.")
    (home-page "https://www.gnome-db.org/")
    (license license:gpl3+)))

(define-public linux-g14-headers
  (package
    (name "linux-g14-headers")
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
    (synopsis "headers and scripts for building modules for the Linux-g14 kernel")
    (description "Headers and scripts for building modules for the Linux-g14 kernel.")
    (home-page "https://gitlab.com/asus-linux/linux-g14")
    (license license:gpl2+)))

(define-public llvm17-libs
  (package
    (name "llvm17-libs")
    (version "17.0.6")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/llvm17-libs.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "lLVM 17 runtime libraries")
    (description "LLVM 17 runtime libraries.")
    (home-page "https://llvm.org/")
    (license license:non-copyleft)))

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

(define-public maint
  (package
    (name "maint")
    (version "2.9")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.com/mgdobachesky/ArchSystemMaintenance")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a utility to automatically perform Arch Linux system maintenance")
    (description "A utility to automatically perform Arch Linux system maintenance.")
    (home-page "https://gitlab.com/mgdobachesky/ArchSystemMaintenance")
    (license license:gpl3+)))

(define-public ollama-docs-git
  (package
    (name "ollama-docs-git")
    (version "0.15.1.rc0.r0.gf3b476c59280")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ollama/ollama")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "documentation for Ollama")
    (description "Documentation for Ollama.")
    (home-page "https://github.com/ollama/ollama")
    (license license:expat)))

(define-public onvif-gui
  (package
    (name "onvif-gui")
    (version "3.3.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/sr99622/libonvif")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a client side implementation of the ONVIF specification - GUI app")
    (description "A client side implementation of the ONVIF specification - GUI app.")
    (home-page "https://github.com/sr99622/libonvif")
    (license license:asl2.0)))

(define-public opencloud-desktop
  (package
    (name "opencloud-desktop")
    (version "3.0.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/opencloud-eu/desktop")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "opencloud desktop application")
    (description "Opencloud desktop application.")
    (home-page "https://github.com/opencloud-eu/desktop")
    (license license:gpl2+)))

(define-public openhv
  (package
    (name "openhv")
    (version "20250725")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/openhv.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "an open-source pixel-art science-fiction real-time-strategy game")
    (description "An open-source pixel-art science-fiction real-time-strategy game.")
    (home-page "https://www.openhv.net")
    (license license:gpl3+)))

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
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "high performance routing engine written in C++14 designed to run on OpenStr..")
    (description "High performance routing engine written in C++14 designed to run on OpenStreetMap data.")
    (home-page "https://github.com/Project-OSRM/osrm-backend")
    (license license:bsd-3)))

(define-public pacpush
  (package
    (name "pacpush")
    (version "3.5")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/bulletmark/pacpush")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "utility to push an Arch hosts package and AUR caches to other hosts")
    (description "Utility to push an Arch hosts package and AUR caches to other hosts.")
    (home-page "https://github.com/bulletmark/pacpush")
    (license license:gpl3+)))

(define-public path-of-building-community-git
  (package
    (name "path-of-building-community-git")
    (version "2.57.0.r8755.66.517")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/PathOfBuildingCommunity/PathOfBuilding")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "an offline build planner for Path of Exile using PoBFrontend, LocalIdentity..")
    (description "An offline build planner for Path of Exile using PoBFrontend, LocalIdentity's fork.")
    (home-page "https://github.com/PathOfBuildingCommunity/PathOfBuilding")
    (license license:expat)))

(define-public penpot-mcp
  (package
    (name "penpot-mcp")
    (version "2.14.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/penpot-mcp.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the open-source design tool for design and code collaboration")
    (description "The open-source design tool for design and code collaboration.")
    (home-page "https://penpot.app")
    (license license:mpl2.0)))

(define-public perl-perl-languageserver
  (package
    (name "perl-perl-languageserver")
    (version "2.6.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/perl-perl-languageserver.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "language Server and Debug Protocol Adapter for Perl")
    (description "Language Server and Debug Protocol Adapter for Perl.")
    (home-page "https://metacpan.org/release/Perl-LanguageServer")
    (license license:artistic2.0)))

(define-public pix
  (package
    (name "pix")
    (version "3.4.10")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/linuxmint/pix")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "image viewer and browser based on gthumb. X-Apps Project")
    (description "Image viewer and browser based on gthumb. X-Apps Project.")
    (home-page "https://github.com/linuxmint/pix")
    (license license:gpl2+)))

(define-public plasma-gamemode-git
  (package
    (name "plasma-gamemode-git")
    (version "r6.4d60358")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/plasma-gamemode-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "gamemode UI for the Plasma Desktop")
    (description "Gamemode UI for the Plasma Desktop.")
    (home-page "https://invent.kde.org/sitter/plasma-gamemode")
    (license license:bsd-3)))

(define-public python-withoutbg
  (package
    (name "python-withoutbg")
    (version "1.0.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-withoutbg.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "aI-powered background removal with local and cloud options")
    (description "AI-powered background removal with local and cloud options.")
    (home-page "https://withoutbg.com/")
    (license license:asl2.0)))

(define-public python313-freethreaded
  (package
    (name "python313-freethreaded")
    (version "3.13.13")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python313-freethreaded.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "major release 3.13 of the Python high-level programming language (freethrea..")
    (description "Major release 3.13 of the Python high-level programming language (freethreading version without GIL).")
    (home-page "https://www.python.org/")
    (license license:non-copyleft)))

(define-public remarshal
  (package
    (name "remarshal")
    (version "1.3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/dbohdan/remarshal")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "convert between CBOR, JSON, MessagePack, TOML, and YAML")
    (description "Convert between CBOR, JSON, MessagePack, TOML, and YAML.")
    (home-page "https://github.com/dbohdan/remarshal")
    (license license:expat)))

(define-public riseup-vpn
  (package
    (name "riseup-vpn")
    (version "0.24.10")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/riseup-vpn.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "easy, fast, and secure VPN service from riseup.net")
    (description "Easy, fast, and secure VPN service from riseup.net.")
    (home-page "https://0xacab.org/leap/bitmask-vpn")
    (license license:gpl3+)))

(define-public safe-discover
  (package
    (name "safe-discover")
    (version "0.2.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/kinncj/Safe-Discover")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "kirigami-based package management GUI for Arch Linux (pacman, AUR, Flatpak,..")
    (description "Kirigami-based package management GUI for Arch Linux (pacman, AUR, Flatpak, fwupd).")
    (home-page "https://github.com/kinncj/Safe-Discover")
    (license license:gpl3+)))

(define-public simgear
  (package
    (name "simgear")
    (version "2024.1.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.com/flightgear/simgear")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a set of open-source libraries designed to be used as building blocks for q..")
    (description "A set of open-source libraries designed to be used as building blocks for quickly assembling 3d simulations, games, and visualization applications.")
    (home-page "https://gitlab.com/flightgear/simgear")
    (license license:lgpl3+)))

(define-public songrec-git
  (package
    (name "songrec-git")
    (version "r749.7f2af1e")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/songrec-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "an open-source, unofficial Shazam client for Linux, written in Rust")
    (description "An open-source, unofficial Shazam client for Linux, written in Rust.")
    (home-page "https://songrec.fossplant.re/")
    (license license:gpl3+)))

(define-public spaghettikart
  (package
    (name "spaghettikart")
    (version "1.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/HarbourMasters/SpaghettiKart")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "an unofficial native port of Mario Kart 64")
    (description "An unofficial native port of Mario Kart 64.")
    (home-page "https://github.com/HarbourMasters/SpaghettiKart")
    (license license:expat)))

(define-public tartube
  (package
    (name "tartube")
    (version "2.5.197")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/axcore/tartube")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a GUI front-end for youtube-dl, yt-dlp and other compatible video downloaders")
    (description "A GUI front-end for youtube-dl, yt-dlp and other compatible video downloaders.")
    (home-page "https://github.com/axcore/tartube")
    (license license:lgpl2.1+)))

(define-public trae-cn-desktop-bin
  (package
    (name "trae-cn-desktop-bin")
    (version "2.3.19582")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/trae-cn-desktop-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"))))
    (synopsis "字节跳动推出的AI编程IDE（Trae CN）")
    (description "字节跳动推出的AI编程IDE（Trae CN）.")
    (home-page "https://www.trae.cn/")
    (license license:non-copyleft)))

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

(define-public vbam-sdl
  (package
    (name "vbam-sdl")
    (version "2.2.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/vbam-sdl.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "nintendo GameBoy Advance emulator")
    (description "Nintendo GameBoy Advance emulator.")
    (home-page "https://visualboyadvance-m.org")
    (license license:gpl2+)))

(define-public visual-studio-code-live-bin
  (package
    (name "visual-studio-code-live-bin")
    (version "1.116.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/visual-studio-code-live-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"))))
    (synopsis "visual Studio Code (vscode): Editor for building and debugging modern web a..")
    (description "Visual Studio Code (vscode): Editor for building and debugging modern web and cloud applications (live binary version).")
    (home-page "https://code.visualstudio.com/")
    (license license:non-copyleft)))

(define-public wayfire-plugins-extra
  (package
    (name "wayfire-plugins-extra")
    (version "0.10.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/wayfire-plugins-extra.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "additional plugins for Wayfire")
    (description "Additional plugins for Wayfire.")
    (home-page "https://wayfire.org")
    (license license:expat)))

(define-public winboat-electron
  (package
    (name "winboat-electron")
    (version "0.9.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/winboat-electron.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "winboat-electron"
           #:tests? #f))
    (synopsis "run Windows apps on Linux with seamless integration")
    (description "Run Windows apps on Linux with seamless integration.")
    (home-page "https://www.winboat.app")
    (license license:expat)))

(define-public yacreader-poppler
  (package
    (name "yacreader-poppler")
    (version "9.15.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/yacreader-poppler.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "comic reader for cross-platform reading and managing your digital comic col..")
    (description "Comic reader for cross-platform reading and managing your digital comic collection, using poppler for PDF.")
    (home-page "https://www.yacreader.com/")
    (license license:gpl3+)))

(define-public ytm-player-git
  (package
    (name "ytm-player-git")
    (version "1.5.7")
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

(define-public albert-git
  (package
    (name "albert-git")
    (version "33.0.1.r55.g2a309ce")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/albertlauncher")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a sophisticated standalone keyboard launcher")
    (description "A sophisticated standalone keyboard launcher.")
    (home-page "https://github.com/albertlauncher")
    (license license:non-copyleft)))

(define-public arch-wiki-search
  (package
    (name "arch-wiki-search")
    (version "20250829")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "http://github.com/clorteau/arch-wiki-search")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "read and search Archwiki and other wikis, online or offline, on the desktop..")
    (description "Read and search Archwiki and other wikis, online or offline, on the desktop or the terminal.")
    (home-page "http://github.com/clorteau/arch-wiki-search")
    (license license:expat)))

(define-public banjorecomp
  (package
    (name "banjorecomp")
    (version "1.0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/BanjoRecomp/BanjoRecomp")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a static recompiled port of N64 Banjo-Kazooie for PC")
    (description "A static recompiled port of N64 Banjo-Kazooie for PC.")
    (home-page "https://github.com/BanjoRecomp/BanjoRecomp")
    (license license:gpl3+)))

(define-public bilibili
  (package
    (name "bilibili")
    (version "1.17.6_1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/msojocs/bilibili-linux")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (synopsis "linux version based on Beilai official client porting supports roaming.(Use..")
    (description "Linux version based on Beilai official client porting supports roaming.(Use system-wide electron).基于哔哩哔哩官方客户端移植的Linux版本,支持漫游.")
    (home-page "https://github.com/msojocs/bilibili-linux")
    (license license:expat)))

(define-public chrome-remote-desktop
  (package
    (name "chrome-remote-desktop")
    (version "147.0.7727.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/chrome-remote-desktop.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "access other computers or allow another user to access your computer secure..")
    (description "Access other computers or allow another user to access your computer securely over the Internet.")
    (home-page "https://remotedesktop.google.com")
    (license license:bsd-3)))

(define-public clang-libs-minimal-git
  (package
    (name "clang-libs-minimal-git")
    (version "21.0.0_r537041.f2e62cfca5e5")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/clang-libs-minimal-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "clang runtime libraries, trunk version")
    (description "Clang runtime libraries, trunk version.")
    (home-page "https://llvm.org/")
    (license license:asl2.0)))

(define-public code-translucent
  (package
    (name "code-translucent")
    (version "1.108.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/microsoft/vscode")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the Open Source build of Visual Studio Code (vscode) editor with translucen..")
    (description "The Open Source build of Visual Studio Code (vscode) editor with translucent window, official marketplace, unblocked proprietary features and wayland support!.")
    (home-page "https://github.com/microsoft/vscode")
    (license license:expat)))

(define-public discover-overlay-git
  (package
    (name "discover-overlay-git")
    (version "v0.7.1.r8.g6d92d0f")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/trigg/Discover")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "yet another Discord overlay for Linux written in Python using GTK3")
    (description "Yet another Discord overlay for Linux written in Python using GTK3.")
    (home-page "https://github.com/trigg/Discover")
    (license license:gpl3+)))

(define-public emacs-mozc-with-jp-dict
  (package
    (name "emacs-mozc-with-jp-dict")
    (version "3.33.6089.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/fcitx/mozc")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "emacs engine module for Mozc with SudachiDict and MeCab UniDic Neologd and ..")
    (description "Emacs engine module for Mozc with SudachiDict and MeCab UniDic Neologd and MeCab IpaDic Neologd.")
    (home-page "https://github.com/fcitx/mozc")
    (license license:bsd-3)))

(define-public fluffychat
  (package
    (name "fluffychat")
    (version "2.5.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/krille-chan/fluffychat")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the cutest instant messenger in the [matrix]")
    (description "The cutest instant messenger in the [matrix].")
    (home-page "https://github.com/krille-chan/fluffychat")
    (license license:agpl3+)))

(define-public git-wd40
  (package
    (name "git-wd40")
    (version "2.53.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Libre-WD-40/git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "git with WD-40 applied")
    (description "Git with WD-40 applied.")
    (home-page "https://github.com/Libre-WD-40/git")
    (license license:lgpl2.1+)))

(define-public guiman
  (package
    (name "guiman")
    (version "1.6.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Junaid433/guiman")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the Ultimate Arch Linux Package Manager - GUI with 100% pacman & AUR featur..")
    (description "The Ultimate Arch Linux Package Manager - GUI with 100% pacman & AUR feature parity.")
    (home-page "https://github.com/Junaid433/guiman")
    (license license:expat)))

(define-public libgda-jdbc
  (package
    (name "libgda-jdbc")
    (version "5.2.10")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/libgda-jdbc.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "libgda provider for JDBC")
    (description "Libgda provider for JDBC.")
    (home-page "https://www.gnome-db.org/")
    (license license:gpl3+)))

(define-public linux-cachyos-lts-headers
  (package
    (name "linux-cachyos-lts-headers")
    (version "6.18.22")
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
    (synopsis "headers and scripts for building modules for the Linux BORE + Cachy Sauce K..")
    (description "Headers and scripts for building modules for the Linux BORE + Cachy Sauce Kernel by CachyOS with other patches and improvements - Long Term Service kernel.")
    (home-page "https://github.com/CachyOS/linux-cachyos")
    (license license:gpl2+)))

(define-public lution
  (package
    (name "lution")
    (version "0.3.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Wookhq/Lution")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "third-party bootstrapper for Sober runtime - Bloxstrap clone for Linux")
    (description "Third-party bootstrapper for Sober runtime - Bloxstrap clone for Linux.")
    (home-page "https://github.com/Wookhq/Lution")
    (license license:expat)))

(define-public normcap
  (package
    (name "normcap")
    (version "0.6.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/normcap.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "oCR powered screen-capture tool to capture information instead of images")
    (description "OCR powered screen-capture tool to capture information instead of images.")
    (home-page "https://dynobo.github.io/normcap")
    (license license:agpl3+)))

(define-public ollama-cuda-git
  (package
    (name "ollama-cuda-git")
    (version "0.15.1.rc0.r0.gf3b476c59280")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ollama/ollama")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "create, run and share large language models (LLMs) with CUDA")
    (description "Create, run and share large language models (LLMs) with CUDA.")
    (home-page "https://github.com/ollama/ollama")
    (license license:expat)))

(define-public ollama-rocm-git
  (package
    (name "ollama-rocm-git")
    (version "0.15.1.rc0.r0.gf3b476c59280")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ollama/ollama")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "create, run and share large language models (LLMs) with ROCm")
    (description "Create, run and share large language models (LLMs) with ROCm.")
    (home-page "https://github.com/ollama/ollama")
    (license license:expat)))

(define-public pamac-aur-git
  (package
    (name "pamac-aur-git")
    (version "11.7.3.r3.gf756a05")
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
    (synopsis "pamac package manager - library, gui, cli")
    (description "Pamac package manager - library, gui, cli.")
    (home-page "https://github.com/manjaro/pamac")
    (license license:gpl3+)))

(define-public pantheon-session-git
  (package
    (name "pantheon-session-git")
    (version "r148.48b482e")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/elementary/session-settings")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "session settings for Pantheon")
    (description "Session settings for Pantheon.")
    (home-page "https://github.com/elementary/session-settings")
    (license license:gpl3+)))

(define-public parallels-client
  (package
    (name "parallels-client")
    (version "21.1.26688")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/parallels-client.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a remote work tool")
    (description "A remote work tool.")
    (home-page "https://www.parallels.com/products/ras/capabilities/parallels-client/")
    (license license:non-copyleft)))

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

(define-public processing
  (package
    (name "processing")
    (version "4.5.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/processing.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "programming environment for creating images, animations and interactions")
    (description "Programming environment for creating images, animations and interactions.")
    (home-page "https://www.processing.org/")
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

(define-public python-llama-cpp-vulkan
  (package
    (name "python-llama-cpp-vulkan")
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
    (synopsis "python bindings for llama.cpp")
    (description "Python bindings for llama.cpp.")
    (home-page "https://github.com/abetlen/llama-cpp-python")
    (license license:gpl3+)))

(define-public python-quimb
  (package
    (name "python-quimb")
    (version "1.13.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/jcmgray/quimb")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "quantum information and many-body calculations including tensor networks")
    (description "Quantum information and many-body calculations including tensor networks.")
    (home-page "https://github.com/jcmgray/quimb")
    (license license:asl2.0)))

(define-public qrookie-vrp
  (package
    (name "qrookie-vrp")
    (version "0.4.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/glaumar/QRookie")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "download and install Quest games from ROOKIE Public Mirror")
    (description "Download and install Quest games from ROOKIE Public Mirror.")
    (home-page "https://github.com/glaumar/QRookie")
    (license license:gpl3+)))

(define-public reform-tools
  (package
    (name "reform-tools")
    (version "1.85")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/reform-tools.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "mNT Reform system tools & helpers")
    (description "MNT Reform system tools & helpers.")
    (home-page "https://source.mnt.re/reform/reform-tools")
    (license license:gpl3+)))

(define-public vkdoom-git
  (package
    (name "vkdoom-git")
    (version "v25.6.0+581+gca2db6204")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/vkdoom-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "feature centric port for all Doom engine games, with a focus on Vulkan and ..")
    (description "Feature centric port for all Doom engine games, with a focus on Vulkan and modern computers (git version).")
    (home-page "https://vkdoom.org/")
    (license license:bsd-3)))

(define-public xlibre-video-intel-bin
  (package
    (name "xlibre-video-intel-bin")
    (version "3.0.0.6")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/xlibre-video-intel-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"))))
    (synopsis "xLibre Official Easy Install Drop in Replacement fork of X.Org Intel i810/i..")
    (description "XLibre Official Easy Install Drop in Replacement fork of X.Org Intel i810/i830/i915/945G/G965+ video drivers (binary release).")
    (home-page "https://x11libre.net")
    (license license:expat)))

(define-public xoreos
  (package
    (name "xoreos")
    (version "0.0.6")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/xoreos/xoreos")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a reimplementation of BioWare's Aurora engine")
    (description "A reimplementation of BioWare's Aurora engine.")
    (home-page "https://github.com/xoreos/xoreos")
    (license license:gpl3+)))

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

(define-public caffeine-ng-git
  (package
    (name "caffeine-ng-git")
    (version "4.2.0.r45.g8318401")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://codeberg.org/WhyNotHugo/caffeine-ng")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "status bar application able to temporarily inhibit the screensaver and slee..")
    (description "Status bar application able to temporarily inhibit the screensaver and sleep mode.")
    (home-page "https://codeberg.org/WhyNotHugo/caffeine-ng")
    (license license:gpl3+)))

(define-public conquest-git
  (package
    (name "conquest-git")
    (version "0.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/jakobfriedl/conquest")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "conquest is a feature-rich and malleable command & control/post-exploitatio..")
    (description "Conquest is a feature-rich and malleable command & control/post-exploitation framework developed in Nim.")
    (home-page "https://github.com/jakobfriedl/conquest.git")
    (license license:bsd-3)))

(define-public deepin-wine10-stable
  (package
    (name "deepin-wine10-stable")
    (version "10.14deepin7")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/deepin-wine10-stable.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "deepin wine10 stable")
    (description "Deepin wine10 stable.")
    (home-page "http://www.deepin.org")
    (license license:non-copyleft)))
