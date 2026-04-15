;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency tree resolver pass --- deptree-resolver-260415c
;;; Resolves 100 BLOCKED packages from dependency tree queue.
;;;
;;; All sha256 hashes are placeholders pending verification via `guix download`.

(define-module (gaurix packages deptree-resolver-260415c)
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
  #:export (            haskell-filepath
            firefox-nightly
            e2-studio-bin
            alice-ai-app-bin
            brother-mfc-l8390cdw
            cp210x-overclock-dkms
            gv-usb2-driver-dkms-git
            cargo-xwin
            clara-verse
            etherlab-ethercat-dkms
            mangabox-bin
            mingw-w64-mpg123
            fafarunner-bin
            tmpidlebox
            vitasdk-packages-git
            muzak
            pmt-git
            reboot-arch-btw
            samrewritten-git
            sickrage-git
            vrc-get
            wavetracker
            wayvibes-git
            weathr
            web-ext
            winamax-bin
            wooting-bg-service
            xlibre-input-elographics
            yesplaymusic
            youtube-dl-gui
            youtui-player
            zalo-macos
            zeptofetch-git
            zfs-linux
            zfs-linux-headers
            ab-av1
            ajantv2-tools
            android-studio-for-platform
            archforge
            archstatus-git
            atomic-upgrade
            aur-auto-vote-git
            avaloniailspy
            baidunetdisk-bin
            basedpyright
            basedpyright-git
            binfetch-git
            bombsquad
            booklore
            booster-um
            brave-beta-bin
            bruno
            calculix-ccx
            cat-browser-git
            catnap-git
            certiliamiddleware
            claude-cowork-linux
            clean-chroot-manager
            connectagram
            connman-resolvconf
            crestic
            cursor-cli
            dbus-action
            debtap
            democap
            denaro
            discord-canary
            distroav
            dms-shell-git
            dnspyex-wine-bin
            dput
            dumber-browser-git
            electrs
            eprosima-fast-dds-gen
            equicord-hook
            etherpad-lite))

(define-public haskell-filepath
  (package
    (name "haskell-filepath")
    (version "1.5.5.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/haskell/filepath")
                    (commit "v1.5.5.0")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "library for manipulating FilePaths in a cross platform way")
    (description "Library for manipulating FilePaths in a cross platform way. (backport).")
    (home-page "https://github.com/haskell/filepath")
    (license license:bsd-3)))

(define-public firefox-nightly
  (package
    (name "firefox-nightly")
    (version "150.0a1+20260322.1+hf217b220706f")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/firefox-nightly.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "fast, Private & Safe Web Browser (Nightly version)")
    (description "Fast, Private & Safe Web Browser (Nightly version).")
    (home-page "https://www.mozilla.org/firefox/channel/desktop/#nightly")
    (license license:mpl2.0)))

(define-public e2-studio-bin
  (package
    (name "e2-studio-bin")
    (version "2025.12")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/e2-studio-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "eclipse-based IDE for Renesas MCUs")
    (description "Eclipse-based IDE for Renesas MCUs.")
    (home-page "https://www.renesas.com/en/software-tool/e-studio")
    (license license:non-copyleft)))

(define-public alice-ai-app-bin
  (package
    (name "alice-ai-app-bin")
    (version "1.3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/pmbstyle/Alice")
                    (commit "v1.3.0")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a smart desktop AI assistant application built with Vue")
    (description "A smart desktop AI assistant application built with Vue.js, Vite, and Electron. Advanced memory system, function calling, MCP support and more.(Prebuilt version.Use system-wide electron).")
    (home-page "https://github.com/pmbstyle/Alice")
    (license license:expat)))

(define-public brother-mfc-l8390cdw
  (package
    (name "brother-mfc-l8390cdw")
    (version "3.5.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/brother-mfc-l8390cdw.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "lPR and CUPS driver for the Brother MFC-L8390CDW")
    (description "LPR and CUPS driver for the Brother MFC-L8390CDW.")
    (home-page "http://solutions.brother.com/linux")
    (license license:non-copyleft)))

(define-public cp210x-overclock-dkms
  (package
    (name "cp210x-overclock-dkms")
    (version "0.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/cp210x-overclock-dkms.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "kernel module for silab cp210x, with patch of cp2102 max baudrate up to 1")
    (description "Kernel module for silab cp210x, with patch of cp2102 max baudrate up to 1.5 MHz.")
    (home-page "https://git.kernel.org")
    (license license:gpl2)))

(define-public gv-usb2-driver-dkms-git
  (package
    (name "gv-usb2-driver-dkms-git")
    (version "r33.811fb0f")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Isaac-Lozano/GV-USB2-Driver")
                    (commit "vr33.811fb0f")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a linux driver for the IO-DATA GV-USB2 SD capture device")
    (description "A linux driver for the IO-DATA GV-USB2 SD capture device. (DKMS).")
    (home-page "https://github.com/Isaac-Lozano/GV-USB2-Driver")
    (license license:non-copyleft)))

(define-public cargo-xwin
  (package
    (name "cargo-xwin")
    (version "0.21.5")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/rust-cross/cargo-xwin")
                    (commit "v0.21.5")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "cross compile Cargo project to Windows MSVC target with ease")
    (description "Cross compile Cargo project to Windows MSVC target with ease.")
    (home-page "https://github.com/rust-cross/cargo-xwin")
    (license license:expat)))

(define-public clara-verse
  (package
    (name "clara-verse")
    (version "0.3.1.beta")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/claraverse-space/ClaraVerse-Desktop")
                    (commit "v0.3.1.beta")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a privacy-first, All in one AI workspace featuring LLMs, ComfyUI, n8n, an")
    (description "A privacy-first, All in one AI workspace featuring LLMs, ComfyUI, n8n, and more.")
    (home-page "https://github.com/claraverse-space/ClaraVerse-Desktop")
    (license license:expat)))

(define-public etherlab-ethercat-dkms
  (package
    (name "etherlab-ethercat-dkms")
    (version "1.6.9")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/etherlab-ethercat-dkms.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "kernel modules for IgH EtherCAT(R) Master component")
    (description "Kernel modules for IgH EtherCAT(R) Master component.")
    (home-page "https://etherlab.org")
    (license license:gpl2)))

(define-public mangabox-bin
  (package
    (name "mangabox-bin")
    (version "0.4.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/zpaolo11x/mangabox")
                    (commit "v0.4.1")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "an Electron client for Komga")
    (description "An Electron client for Komga.(Prebuilt version.Use system-wide electron).")
    (home-page "https://github.com/zpaolo11x/mangabox")
    (license license:non-copyleft)))

(define-public mingw-w64-mpg123
  (package
    (name "mingw-w64-mpg123")
    (version "1.32.10")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mingw-w64-mpg123.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a console based real time MPEG Audio Player for Layer 1, 2 and 3 (mingw-w64)")
    (description "A console based real time MPEG Audio Player for Layer 1, 2 and 3 (mingw-w64).")
    (home-page "http://sourceforge.net/projects/mpg123")
    (license license:lgpl3+)))

(define-public fafarunner-bin
  (package
    (name "fafarunner-bin")
    (version "2.8.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/fafarunner/fafarunner")
                    (commit "v2.8.0")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "enjoy smooth gameplay, stunning graphics, and endless fun")
    (description "Enjoy smooth gameplay, stunning graphics, and endless fun.")
    (home-page "https://github.com/fafarunner/fafarunner")
    (license license:expat)))

(define-public tmpidlebox
  (package
    (name "tmpidlebox")
    (version "2.0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/TheOddCell/tmpidlebox")
                    (commit "v2.0.1")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "part of the tmplinux suite")
    (description "Part of the tmplinux suite. Temporary Idlebox.")
    (home-page "https://github.com/TheOddCell/tmpidlebox")
    (license license:expat)))

(define-public vitasdk-packages-git
  (package
    (name "vitasdk-packages-git")
    (version "1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/vitasdk/packages")
                    (commit "v1")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "packages pre-built with VITASDK homebrew toolchain for Sony Playstation Vita")
    (description "Packages pre-built with VITASDK homebrew toolchain for Sony Playstation Vita.")
    (home-page "https://github.com/vitasdk/packages/")
    (license license:gpl3+)))

(define-public muzak
  (package
    (name "muzak")
    (version "2.4.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/The0x539/muzak")
                    (commit "v2.4.0")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "command-line suite for playing and compiling the bells of bezelea")
    (description "Command-line suite for playing and compiling the bells of bezelea.")
    (home-page "https://github.com/The0x539/muzak")
    (license license:non-copyleft)))

(define-public pmt-git
  (package
    (name "pmt-git")
    (version "r12.d93c3d2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/aethstetic/pmt")
                    (commit "vr12.d93c3d2")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "terminal UI package manager for Arch Linux")
    (description "Terminal UI package manager for Arch Linux.")
    (home-page "https://github.com/aethstetic/pmt")
    (license license:expat)))

(define-public reboot-arch-btw
  (package
    (name "reboot-arch-btw")
    (version "1.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/rnestler/reboot-arch-btw")
                    (commit "v1.0.0")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "check if you need to reboot due to an updated kernel")
    (description "Check if you need to reboot due to an updated kernel.")
    (home-page "https://github.com/rnestler/reboot-arch-btw")
    (license license:gpl3)))

(define-public samrewritten-git
  (package
    (name "samrewritten-git")
    (version "1.2.0.r0.g95cda4f")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/PaulCombal/SamRewritten")
                    (commit "v1.2.0.r0.g95cda4f")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "unlock achievements and stats on Steam, and more!")
    (description "Unlock achievements and stats on Steam, and more!.")
    (home-page "https://github.com/PaulCombal/SamRewritten")
    (license license:gpl3)))

(define-public sickrage-git
  (package
    (name "sickrage-git")
    (version "9.4.117.r0.g1db69f779")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/SiCKRAGETV/SickRage")
                    (commit "v9.4.117.r0.g1db69f779")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a PVR application that downloads and manages your TV shows")
    (description "A PVR application that downloads and manages your TV shows. Echel0n fork of sickbeard, with tvrage, torrents and anime support.")
    (home-page "https://github.com/SiCKRAGETV/SickRage")
    (license license:gpl3)))

(define-public vrc-get
  (package
    (name "vrc-get")
    (version "1.9.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/anatawa12/vrc-get")
                    (commit "v1.9.1")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "open Source command line client of VRChat Package Manager")
    (description "Open Source command line client of VRChat Package Manager.")
    (home-page "https://github.com/anatawa12/vrc-get")
    (license license:expat)))

(define-public wavetracker
  (package
    (name "wavetracker")
    (version "1.1.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/squiggythings/WaveTracker")
                    (commit "v1.1.2")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a free and open source music-making software for Windows with experimenta")
    (description "A free and open source music-making software for Windows with experimental patches to run on Linux.")
    (home-page "https://github.com/squiggythings/WaveTracker")
    (license license:gpl2)))

(define-public wayvibes-git
  (package
    (name "wayvibes-git")
    (version "r74.afbde2a")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/sahaj-b/wayvibes")
                    (commit "vr74.afbde2a")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "play mechanical keyboard sounds as you type - wayland alternative for mec")
    (description "Play mechanical keyboard sounds as you type - wayland alternative for mechvibes/rustyvibes.")
    (home-page "https://github.com/sahaj-b/wayvibes")
    (license license:expat)))

(define-public weathr
  (package
    (name "weathr")
    (version "1.4.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Veirt/weathr")
                    (commit "v1.4.0")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a terminal weather app with ascii animation")
    (description "a terminal weather app with ascii animation.")
    (home-page "https://github.com/Veirt/weathr")
    (license license:gpl3+)))

(define-public web-ext
  (package
    (name "web-ext")
    (version "10.1.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/web-ext.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a command line tool to help build, run, and test web extensions")
    (description "A command line tool to help build, run, and test web extensions.")
    (home-page "https://developer.mozilla.org/en-US/Add-ons/WebExtensions")
    (license license:mpl2.0)))

(define-public winamax-bin
  (package
    (name "winamax-bin")
    (version "2.53.2-1.4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/winamax-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "winamax Poker")
    (description "Winamax Poker.")
    (home-page "https://www.winamax.fr")
    (license license:non-copyleft)))

(define-public wooting-bg-service
  (package
    (name "wooting-bg-service")
    (version "0.4.7")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/wooting-bg-service.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "wooting Background Service for Wootility")
    (description "Wooting Background Service for Wootility.")
    (home-page "https://wooting.io/wootility")
    (license license:non-copyleft)))

(define-public xlibre-input-elographics
  (package
    (name "xlibre-input-elographics")
    (version "1.4.4.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/X11Libre/xf86-input-elographics")
                    (commit "v1.4.4.1")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "xLibre Elographics TouchScreen input driver")
    (description "XLibre Elographics TouchScreen input driver.")
    (home-page "https://github.com/X11Libre/xf86-input-elographics")
    (license license:expat)))

(define-public yesplaymusic
  (package
    (name "yesplaymusic")
    (version "0.4.10")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/qier222/YesPlayMusic")
                    (commit "v0.4.10")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a third party music application for Netease Music")
    (description "A third party music application for Netease Music.")
    (home-page "https://github.com/qier222/YesPlayMusic")
    (license license:expat)))

(define-public youtube-dl-gui
  (package
    (name "youtube-dl-gui")
    (version "2.5.6")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/StefanLobbenmeier/youtube-dl-gui")
                    (commit "v2.5.6")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a cross-platform GUI for youtube-dl made in Electron and node")
    (description "A cross-platform GUI for youtube-dl made in Electron and node.js.")
    (home-page "https://github.com/StefanLobbenmeier/youtube-dl-gui")
    (license license:agpl3)))

(define-public youtui-player
  (package
    (name "youtui-player")
    (version "1.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/IvelOt/youtui-player")
                    (commit "v1.2.0")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments (list #:tests? #f))
    (synopsis "youTube TUI player with playlist, thumbnails and Catppuccin themes")
    (description "YouTube TUI player with playlist, thumbnails and Catppuccin themes.")
    (home-page "https://github.com/IvelOt/youtui-player")
    (license license:expat)))

(define-public zalo-macos
  (package
    (name "zalo-macos")
    (version "26.3.20")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/zalo-macos.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "unofficial Zalo client for Linux, ported from MacOS version")
    (description "Unofficial Zalo client for Linux, ported from MacOS version.")
    (home-page "https://zalo.me")
    (license license:non-copyleft)))

(define-public zeptofetch-git
  (package
    (name "zeptofetch-git")
    (version "r160.3e692c3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.archlinux.org/gurov/zeptofetch")
                    (commit "vr160.3e692c3")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "blazingly fast, ultra-minimal system information tool for Linux (git vers")
    (description "Blazingly fast, ultra-minimal system information tool for Linux (git version).")
    (home-page "https://gitlab.archlinux.org/gurov/zeptofetch")
    (license license:gpl3+)))

(define-public zfs-linux
  (package
    (name "zfs-linux")
    (version "2.4.1_6.19.11.arch1.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/zfs-linux.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "kernel modules for the Zettabyte File System")
    (description "Kernel modules for the Zettabyte File System.")
    (home-page "https://openzfs.org/")
    (license license:non-copyleft)))

(define-public zfs-linux-headers
  (package
    (name "zfs-linux-headers")
    (version "2.4.1_6.19.11.arch1.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/zfs-linux-headers.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "kernel headers for the Zettabyte File System")
    (description "Kernel headers for the Zettabyte File System.")
    (home-page "https://openzfs.org/")
    (license license:non-copyleft)))

(define-public ab-av1
  (package
    (name "ab-av1")
    (version "0.11.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/alexheretic/ab-av1")
                    (commit "v0.11.2")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "aV1 encoding tool with fast VMAF sampling")
    (description "AV1 encoding tool with fast VMAF sampling.")
    (home-page "https://github.com/alexheretic/ab-av1")
    (license license:expat)))

(define-public ajantv2-tools
  (package
    (name "ajantv2-tools")
    (version "17.5.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/aja-video/libajantv2")
                    (commit "v17.5.0")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "open-source SDK for discovering, interrogating and controlling NTV2 profe")
    (description "Open-source SDK for discovering, interrogating and controlling NTV2 professional video I/O devices from AJA Video Systems, Inc.")
    (home-page "https://github.com/aja-video/libajantv2")
    (license license:expat)))

(define-public android-studio-for-platform
  (package
    (name "android-studio-for-platform")
    (version "2025.3.2.6")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/android-studio-for-platform.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the official Android IDE for Platform Development")
    (description "The official Android IDE for Platform Development.")
    (home-page "https://developer.android.com/studio/platform")
    (license license:asl2.0)))

(define-public archforge
  (package
    (name "archforge")
    (version "0.2.5")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Scqxd/archforge")
                    (commit "v0.2.5")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "aI-powered TUI for PKGBUILD generation and AUR management")
    (description "AI-powered TUI for PKGBUILD generation and AUR management.")
    (home-page "https://github.com/Scqxd/archforge")
    (license license:expat)))

(define-public archstatus-git
  (package
    (name "archstatus-git")
    (version "r26.0a3b6f2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/pvtoari/archstatus")
                    (commit "vr26.0a3b6f2")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "simple status monitor for Arch Linux")
    (description "Simple status monitor for Arch Linux.")
    (home-page "https://github.com/pvtoari/archstatus")
    (license license:expat)))

(define-public atomic-upgrade
  (package
    (name "atomic-upgrade")
    (version "0.1.7")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.com/fkzys/atomic-upgrade")
                    (commit "v0.1.7")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "atomic system upgrades for Arch Linux (Btrfs + UKI + Secure Boot)")
    (description "Atomic system upgrades for Arch Linux (Btrfs + UKI + Secure Boot).")
    (home-page "https://gitlab.com/fkzys/atomic-upgrade")
    (license license:agpl3+)))

(define-public aur-auto-vote-git
  (package
    (name "aur-auto-vote-git")
    (version "r150.3a626c5")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/cryzed/bin")
                    (commit "vr150.3a626c5")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "automates voting on installed and uninstalled AUR packages")
    (description "Automates voting on installed and uninstalled AUR packages.")
    (home-page "https://github.com/cryzed/bin")
    (license license:expat)))

(define-public avaloniailspy
  (package
    (name "avaloniailspy")
    (version "v7.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/icsharpcode/AvaloniaILSpy")
                    (commit "vv7.2")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "avalonia-based")
    (description "Avalonia-based .NET Decompiler (port of ILSpy).")
    (home-page "https://github.com/icsharpcode/AvaloniaILSpy")
    (license license:lgpl3+)))

(define-public baidunetdisk-bin
  (package
    (name "baidunetdisk-bin")
    (version "4.17.8")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/baidunetdisk-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "baidu Net Disk - a cloud storage client (Linux Version)")
    (description "Baidu Net Disk - a cloud storage client (Linux Version).")
    (home-page "https://pan.baidu.com")
    (license license:non-copyleft)))

(define-public basedpyright
  (package
    (name "basedpyright")
    (version "1.39.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/basedpyright.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "pyright fork with various improvements and pylance features")
    (description "pyright fork with various improvements and pylance features.")
    (home-page "https://docs.basedpyright.com/")
    (license license:expat)))

(define-public basedpyright-git
  (package
    (name "basedpyright-git")
    (version "v1.32.1.r23.gf88523c13")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/DetachHead/basedpyright")
                    (commit "vv1.32.1.r23.gf88523c13")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "fork of pyright, a static type checker for Python, with various improveme")
    (description "Fork of pyright, a static type checker for Python, with various improvements and new features.")
    (home-page "https://github.com/DetachHead/basedpyright")
    (license license:expat)))

(define-public binfetch-git
  (package
    (name "binfetch-git")
    (version "0.1.r23.g0acd7be")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/binfetch-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "neofetch inspired utility for binaries")
    (description "Neofetch inspired utility for binaries.")
    (home-page "https://aur.archlinux.org/packages/binfetch-git")
    (license license:cc0)))

(define-public bombsquad
  (package
    (name "bombsquad")
    (version "1.7.59")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/bombsquad.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "an explosive arcade-style party game")
    (description "An explosive arcade-style party game.")
    (home-page "http://www.froemling.net/apps/bombsquad")
    (license license:non-copyleft)))

(define-public booklore
  (package
    (name "booklore")
    (version "2.2.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/booklore.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "self hosted ebook reader")
    (description "Self hosted ebook reader.")
    (home-page "https://booklore.org/")
    (license license:agpl3)))

(define-public booster-um
  (package
    (name "booster-um")
    (version "1.7.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Zile995/booster-um")
                    (commit "v1.7.1")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "booster UKI Manager - A simple bash script to manage UKI files generated ")
    (description "Booster UKI Manager - A simple bash script to manage UKI files generated by booster and systemd-ukify.")
    (home-page "https://github.com/Zile995/booster-um")
    (license license:gpl3)))

(define-public brave-beta-bin
  (package
    (name "brave-beta-bin")
    (version "1.90.101")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/brave-beta-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "web browser that blocks ads and trackers by default (beta binary release)")
    (description "Web browser that blocks ads and trackers by default (beta binary release).")
    (home-page "https://brave.com/download-beta")
    (license license:mpl2.0)))

(define-public bruno
  (package
    (name "bruno")
    (version "3.2.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/bruno.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "opensource API Client for Exploring and Testing APIs")
    (description "Opensource API Client for Exploring and Testing APIs.")
    (home-page "https://www.usebruno.com/")
    (license license:expat)))

(define-public calculix-ccx
  (package
    (name "calculix-ccx")
    (version "2.23")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/calculix-ccx.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "calculiX: 3D Structural Finite Element Program - Solver")
    (description "CalculiX: 3D Structural Finite Element Program - Solver.")
    (home-page "http://www.calculix.de/")
    (license license:gpl2)))

(define-public cat-browser-git
  (package
    (name "cat-browser-git")
    (version "1.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/anamelessguy1/cat-browser")
                    (commit "v1.0.0")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "cat browser is an internet browser made for people who love cats")
    (description "cat browser is an internet browser made for people who love cats.")
    (home-page "https://github.com/anamelessguy1/cat-browser")
    (license license:gpl3)))

(define-public catnap-git
  (package
    (name "catnap-git")
    (version "r289.c6f9523")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/iinsertNameHere/catnap")
                    (commit "vr289.c6f9523")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a minimalistic and fast system fetch written in Nim")
    (description "A minimalistic and fast system fetch written in Nim.")
    (home-page "https://github.com/iinsertNameHere/catnap")
    (license license:expat)))

(define-public certiliamiddleware
  (package
    (name "certiliamiddleware")
    (version "3.9.8")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/certiliamiddleware.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "certilia Middleware for AKD smart cards (Croatian eID, Certilia)")
    (description "Certilia Middleware for AKD smart cards (Croatian eID, Certilia).")
    (home-page "https://www.certilia.com")
    (license license:non-copyleft)))

(define-public claude-cowork-linux
  (package
    (name "claude-cowork-linux")
    (version "1.1.4010")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/johnzfitch/claude-cowork-linux")
                    (commit "v1.1.4010")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (synopsis "anthropic Claude Desktop with Cowork (local agent) support for Linux")
    (description "Anthropic Claude Desktop with Cowork (local agent) support for Linux.")
    (home-page "https://github.com/johnzfitch/claude-cowork-linux")
    (license license:non-copyleft)))

(define-public clean-chroot-manager
  (package
    (name "clean-chroot-manager")
    (version "3.01")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/graysky2/clean-chroot-manager")
                    (commit "v3.01")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "wrapper for managing clean chroot builds with local repo therein")
    (description "Wrapper for managing clean chroot builds with local repo therein.")
    (home-page "https://github.com/graysky2/clean-chroot-manager")
    (license license:expat)))

(define-public connectagram
  (package
    (name "connectagram")
    (version "1.3.9")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/connectagram.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "word unscrambling game")
    (description "Word unscrambling game.")
    (home-page "https://gottcode.org/connectagram/")
    (license license:gpl3+)))

(define-public connman-resolvconf
  (package
    (name "connman-resolvconf")
    (version "0.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/jirutka/connman-resolvconf")
                    (commit "v0.2.0")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "connMan integration with resolvconf(8)")
    (description "ConnMan integration with resolvconf(8).")
    (home-page "https://github.com/jirutka/connman-resolvconf")
    (license license:expat)))

(define-public crestic
  (package
    (name "crestic")
    (version "1.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nils-werner/crestic")
                    (commit "v1.1.0")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "configurable restic wrapper")
    (description "Configurable restic wrapper.")
    (home-page "https://github.com/nils-werner/crestic")
    (license license:expat)))

(define-public cursor-cli
  (package
    (name "cursor-cli")
    (version "2026.03.30.1.a5d3e17")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/cursor-cli.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "cursor Agent CLI - AI-powered code assistant")
    (description "Cursor Agent CLI - AI-powered code assistant.")
    (home-page "https://cursor.com")
    (license license:non-copyleft)))

(define-public dbus-action
  (package
    (name "dbus-action")
    (version "1.5")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/bulletmark/dbus-action")
                    (commit "v1.5")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "watch D-Bus to action configured commands on specific events")
    (description "Watch D-Bus to action configured commands on specific events.")
    (home-page "https://github.com/bulletmark/dbus-action")
    (license license:gpl3)))

(define-public debtap
  (package
    (name "debtap")
    (version "3.6.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/helixarch/debtap")
                    (commit "v3.6.3")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a script to convert")
    (description "A script to convert .deb packages to Arch Linux packages, focused on accuracy. Do not use it to convert packages that already exist on official repositories or can be built from AUR!.")
    (home-page "https://github.com/helixarch/debtap")
    (license license:gpl2)))

(define-public democap
  (package
    (name "democap")
    (version "1.6")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/democap.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "drag[en]gine motion capture using VR hardware")
    (description "Drag[en]gine motion capture using VR hardware.")
    (home-page "https://dragondreams.ch/index.php/democap")
    (license license:gpl3)))

(define-public denaro
  (package
    (name "denaro")
    (version "2024.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/NickvisionApps/denaro")
                    (commit "v2024.2.0")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a personal finance manager")
    (description "A personal finance manager.")
    (home-page "https://github.com/NickvisionApps/denaro")
    (license license:gpl3)))

(define-public discord-canary
  (package
    (name "discord-canary")
    (version "0.0.958")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/discord-canary.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "all-in-one voice and text chat for gamers - alpha build")
    (description "All-in-one voice and text chat for gamers - alpha build.")
    (home-page "https://discordapp.com")
    (license license:non-copyleft)))

(define-public distroav
  (package
    (name "distroav")
    (version "6.1.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/DistroAV/DistroAV")
                    (commit "v6.1.1")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "nDI integration for OBS Studio")
    (description "NDI integration for OBS Studio.")
    (home-page "https://github.com/DistroAV/DistroAV")
    (license license:gpl2)))

(define-public dms-shell-git
  (package
    (name "dms-shell-git")
    (version "1.4.0.r283.ga0c7ffd")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/AvengeMedia/DankMaterialShell")
                    (commit "v1.4.0.r283.ga0c7ffd")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments (list #:tests? #f))
    (synopsis "desktop shell for wayland compositors built with Quickshell & GO")
    (description "Desktop shell for wayland compositors built with Quickshell & GO.")
    (home-page "https://github.com/AvengeMedia/DankMaterialShell")
    (license license:expat)))

(define-public dnspyex-wine-bin
  (package
    (name "dnspyex-wine-bin")
    (version "6.5.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/dnSpyEx/dnSpy")
                    (commit "v6.5.1")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "unofficial continuation of dnSpy: debugger and")
    (description "Unofficial continuation of dnSpy: debugger and .NET assembly editor.")
    (home-page "https://github.com/dnSpyEx/dnSpy")
    (license license:gpl3+)))

(define-public dput
  (package
    (name "dput")
    (version "1.1.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/dput.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "debian package upload tool")
    (description "Debian package upload tool.")
    (home-page "http://packages.qa.debian.org/dput")
    (license license:gpl3+)))

(define-public dumber-browser-git
  (package
    (name "dumber-browser-git")
    (version "0.28.0.r166.ga1aa08ab")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/bnema/dumber")
                    (commit "v0.28.0.r166.ga1aa08ab")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a minimal keyboard-driven browser for tiling WMs (git version)")
    (description "A minimal keyboard-driven browser for tiling WMs (git version).")
    (home-page "https://github.com/bnema/dumber")
    (license license:expat)))

(define-public electrs
  (package
    (name "electrs")
    (version "0.11.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/romanz/electrs")
                    (commit "v0.11.0")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "an efficient re-implementation of Electrum Server in Rust")
    (description "An efficient re-implementation of Electrum Server in Rust.")
    (home-page "https://github.com/romanz/electrs")
    (license license:expat)))

(define-public eprosima-fast-dds-gen
  (package
    (name "eprosima-fast-dds-gen")
    (version "4.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/eProsima/Fast-DDS-Gen")
                    (commit "v4.2.0")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "fast-DDS IDL code generator tool")
    (description "Fast-DDS IDL code generator tool.")
    (home-page "https://github.com/eProsima/Fast-DDS-Gen")
    (license license:asl2.0)))

(define-public equicord-hook
  (package
    (name "equicord-hook")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/equicord-hook.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "pacman hook to automatically install Equicord on Discord updates")
    (description "Pacman hook to automatically install Equicord on Discord updates.")
    (home-page "https://aur.archlinux.org/packages/equicord-hook")
    (license license:gpl3)))

(define-public etherpad-lite
  (package
    (name "etherpad-lite")
    (version "2.2.7")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/etherpad-lite.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (synopsis "lightweight fork of etherpad based on javascript")
    (description "Lightweight fork of etherpad based on javascript.")
    (home-page "https://etherpad.org")
    (license license:asl2.0)))

