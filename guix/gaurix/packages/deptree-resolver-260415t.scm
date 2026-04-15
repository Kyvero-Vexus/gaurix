;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency tree resolver pass --- deptree-resolver-260415t
;;; Resolves 100 packages from dependency tree queue.
;;;
;;; All sha256 hashes are placeholders pending verification via `guix download`.

(define-module (gaurix packages deptree-resolver-260415t)
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
  #:export (            python-wa-crypt-tools-git
            equicord
            equicord-openasar
            esp-idf
            fastflowlm-git
            firedragon-bin
            firefox-extension-credentialsd
            ghostship
            gr-fosphor-git
            gradle8-doc
            gradle8-src
            gyroflow-bin
            iloader-bin
            karakeep
            karp-git
            koodo-reader-bin
            lectern-git
            lieer-git
            lldb-zig-git
            llvm-bolt
            mintsysadm
            monocoque
            mts-link-meetings
            networkmanager-fortisslvpn
            obexftp
            olive-git
            omniget-git
            opencomposite-git
            optimus-manager-git
            owmods-gui-bin
            pave-git
            portmaster-bin
            python-torchao-rocm
            re3-git
            redisinsight
            rustconn
            satisfactory-mod-manager
            simracing-essentials
            spaz-hib
            stratos-cli
            streamcontroller-git
            ticktick
            tonearm-git
            vaping
            wifiman-desktop
            winboat
            xnviewmp-system-libs
            xpybar
            yacreader
            yacreaderlibraryserver
            zerobrane-studio
            appimage-builder-bin
            atrust-bin
            canon-pixma-ts5055-complete
            casual-pre-loader-git
            chatterino2-7tv-git
            clyp-bin
            cnrdrvcups-lb
            codex-app-bin
            cynthiune-app
            dangerzone-bin
            danxi
            dnsdiag
            dupeguru-git
            en-croissant-bin
            exaile-git
            gns3-gui-2
            gtk-meshtastic-client
            heroic-games-launcher-git
            hyprlauncher-git
            input-remapper-git))

(define-public python-wa-crypt-tools-git
  (package
    (name "python-wa-crypt-tools-git")
    (version "r389.0c92577")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ElDavoo/wa-crypt-tools")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "whatsApp Crypt Tools")
    (description "WhatsApp Crypt Tools.")
    (home-page "https://github.com/ElDavoo/wa-crypt-tools")
    (license license:gpl3+)))

(define-public equicord
  (package
    (name "equicord")
    (version "0.0.132.r7000g078515ed9")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/equicord.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the other cutest Discord client mod")
    (description "The other cutest Discord client mod.")
    (home-page "https://equicord.org/")
    (license license:non-copyleft)))

(define-public equicord-openasar
  (package
    (name "equicord-openasar")
    (version "0.0.132.r7000g078515ed9.r852g2fa6bb6")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/equicord-openasar.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the other cutest Discord client mod (with OpenAsar)")
    (description "The other cutest Discord client mod (with OpenAsar).")
    (home-page "https://equicord.org/")
    (license license:non-copyleft)))

(define-public esp-idf
  (package
    (name "esp-idf")
    (version "6.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/esp-idf.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "espressif IoT Development Framework. Official development framework for ESP32")
    (description "Espressif IoT Development Framework. Official development framework for ESP32.")
    (home-page "https://github.com/espressif/esp-idf")
    (license license:asl2.0)))

(define-public fastflowlm-git
  (package
    (name "fastflowlm-git")
    (version "0.9.34.r36.g6cabefe")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/FastFlowLM/FastFlowLM")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "run LLMs on AMD Ryzen AI NPUs in minutes. (git development version)")
    (description "Run LLMs on AMD Ryzen AI NPUs in minutes. (git development version).")
    (home-page "https://github.com/FastFlowLM/FastFlowLM")
    (license license:expat)))

(define-public firedragon-bin
  (package
    (name "firedragon-bin")
    (version "12.9.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/firedragon-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "floorp fork build using custom branding and settings")
    (description "Floorp fork build using custom branding and settings.")
    (home-page "https://firedragon.garudalinux.org")
    (license license:non-copyleft)))

(define-public firefox-extension-credentialsd
  (package
    (name "firefox-extension-credentialsd")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/firefox-extension-credentialsd.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "firefox helper extension for credentialsd")
    (description "Firefox helper extension for credentialsd.")
    (home-page "https://github.com/linux-credentials/credentialsd")
    (license license:lgpl3+)))

(define-public ghostship
  (package
    (name "ghostship")
    (version "1.0.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ghostship.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a yet another definitive port of Super Mario 64 coming out of Harbour Masters")
    (description "A yet another definitive port of Super Mario 64 coming out of Harbour Masters.")
    (home-page "https://github.com/HarbourMasters/Ghostship")
    (license license:expat)))

(define-public gr-fosphor-git
  (package
    (name "gr-fosphor-git")
    (version "r179.74d54fc")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gr-fosphor-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "gNU Radio block for RTSA-like spectrum visualization using OpenCL and OpenGL ...")
    (description "GNU Radio block for RTSA-like spectrum visualization using OpenCL and OpenGL acceleration.")
    (home-page "https://osmocom.org/projects/sdr/wiki/fosphor")
    (license license:gpl3+)))

(define-public gradle8-doc
  (package
    (name "gradle8-doc")
    (version "8.14.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gradle8-doc.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "powerful build system for the JVM (documentation)")
    (description "Powerful build system for the JVM (documentation).")
    (home-page "https://gradle.org/")
    (license license:asl2.0)))

(define-public gradle8-src
  (package
    (name "gradle8-src")
    (version "8.14.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gradle8-src.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "powerful build system for the JVM (sources)")
    (description "Powerful build system for the JVM (sources).")
    (home-page "https://gradle.org/")
    (license license:asl2.0)))

(define-public gyroflow-bin
  (package
    (name "gyroflow-bin")
    (version "1.6.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gyroflow-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "video stabilization using gyroscope data")
    (description "Video stabilization using gyroscope data.")
    (home-page "https://gyroflow.xyz/")
    (license license:gpl3)))

(define-public iloader-bin
  (package
    (name "iloader-bin")
    (version "2.2.4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/iloader-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "user friendly sideloader")
    (description "User friendly sideloader.")
    (home-page "https://github.com/nab138/iloader")
    (license license:expat)))

(define-public karakeep
  (package
    (name "karakeep")
    (version "0.31.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/karakeep.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a self-hostable bookmark-everything app (links, notes and images) with AI-bas...")
    (description "A self-hostable bookmark-everything app (links, notes and images) with AI-based automatic tagging and full text search.")
    (home-page "https://github.com/karakeep-app/karakeep")
    (license license:agpl3+)))

(define-public karp-git
  (package
    (name "karp-git")
    (version "r551.1415cae")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/karp-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "simple UI for PDF files modification")
    (description "Simple UI for PDF files modification.")
    (home-page "https://apps.kde.org/karp/")
    (license license:gpl2+)))

(define-public koodo-reader-bin
  (package
    (name "koodo-reader-bin")
    (version "2.3.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/koodo-reader-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a modern ebook manager and reader with sync and backup capacities")
    (description "A modern ebook manager and reader with sync and backup capacities.")
    (home-page "https://github.com/koodo-reader/koodo-reader")
    (license license:agpl3)))

(define-public lectern-git
  (package
    (name "lectern-git")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lectern-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a configurable, cross-platform markdown viewer")
    (description "A configurable, cross-platform markdown viewer.")
    (home-page "https://git.papayadev.net/pub/lectern")
    (license license:non-copyleft)))

(define-public lieer-git
  (package
    (name "lieer-git")
    (version "v1.6.20231203.e41c966")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/gauteh/lieer")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "fast fetch and two-way tag synchronization between notmuch and GMail")
    (description "Fast fetch and two-way tag synchronization between notmuch and GMail.")
    (home-page "https://github.com/gauteh/lieer")
    (license license:gpl3)))

(define-public lldb-zig-git
  (package
    (name "lldb-zig-git")
    (version "r525112.d95039d")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lldb-zig-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "next generation, high-performance debugger (jacobly0 Zig patch)")
    (description "Next generation, high-performance debugger (jacobly0 Zig patch).")
    (home-page "https://lldb.llvm.org/")
    (license license:non-copyleft)))

(define-public llvm-bolt
  (package
    (name "llvm-bolt")
    (version "22.1.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/llvm-bolt.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a post-link optimizer developed to speed up large applications")
    (description "A post-link optimizer developed to speed up large applications.")
    (home-page "https://github.com/llvm/llvm-project/tree/main/bolt")
    (license license:non-copyleft)))

(define-public mintsysadm
  (package
    (name "mintsysadm")
    (version "1.0.4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mintsysadm.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "system Administration tool for Linux Mint (boot menu configuration and more)")
    (description "System Administration tool for Linux Mint (boot menu configuration and more).")
    (home-page "https://github.com/linuxmint/mintsysadm")
    (license license:gpl3+)))

(define-public monocoque
  (package
    (name "monocoque")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/monocoque.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "device Manager for Racing Sims")
    (description "Device Manager for Racing Sims.")
    (home-page "https://github.com/spacefreak18/monocoque")
    (license license:gpl3)))

(define-public mts-link-meetings
  (package
    (name "mts-link-meetings")
    (version "1.2.13")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mts-link-meetings.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "mTS Link Meetings desktop application based on Electron and React")
    (description "MTS Link Meetings desktop application based on Electron and React.")
    (home-page "https://mts-link.ru")
    (license license:non-copyleft)))

(define-public networkmanager-fortisslvpn
  (package
    (name "networkmanager-fortisslvpn")
    (version "1.4.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/networkmanager-fortisslvpn.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "networkManager VPN plugin for Fortinet SSLVPN")
    (description "NetworkManager VPN plugin for Fortinet SSLVPN.")
    (home-page "https://gitlab.gnome.org/GNOME/NetworkManager-fortisslvpn")
    (license license:gpl2+)))

(define-public obexftp
  (package
    (name "obexftp")
    (version "0.24.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/obexftp.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a tool for transfer files to/from any OBEX enabled device")
    (description "A tool for transfer files to/from any OBEX enabled device.")
    (home-page "http://dev.zuckschwerdt.org/openobex/wiki/ObexFtp")
    (license license:gpl3+)))

(define-public olive-git
  (package
    (name "olive-git")
    (version "r6626.617ff87")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/olive-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "free non-linear video editor")
    (description "Free non-linear video editor.")
    (home-page "https://www.olivevideoeditor.org/")
    (license license:gpl3+)))

(define-public omniget-git
  (package
    (name "omniget-git")
    (version "0.4.0.r48.6b954a2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/omniget-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (synopsis "free,open source desktop app for downloading videos and media from the internet")
    (description "Free,open source desktop app for downloading videos and media from the internet.")
    (home-page "discord.gg/jgdxyPy7Vn")
    (license license:gpl3+)))

(define-public opencomposite-git
  (package
    (name "opencomposite-git")
    (version "r1232.cff07db")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.com/znixian/OpenOVR")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "reimplementation of OpenVR, translating calls to OpenXR")
    (description "Reimplementation of OpenVR, translating calls to OpenXR.")
    (home-page "https://gitlab.com/znixian/OpenOVR")
    (license license:gpl3+)))

(define-public optimus-manager-git
  (package
    (name "optimus-manager-git")
    (version "0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Askannz/optimus-manager")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "allows using Nvidia Optimus laptop graphics")
    (description "Allows using Nvidia Optimus laptop graphics.")
    (home-page "https://github.com/Askannz/optimus-manager")
    (license license:expat)))

(define-public owmods-gui-bin
  (package
    (name "owmods-gui-bin")
    (version "0.15.4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/owmods-gui-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a GUI To Manage Outer Wilds Mods")
    (description "A GUI To Manage Outer Wilds Mods.")
    (home-page "https://github.com/ow-mods/ow-mod-man/tree/main/owmods_gui")
    (license license:gpl3)))

(define-public pave-git
  (package
    (name "pave-git")
    (version "0.1.0.r0.g0000000")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/TheVisher/Pave")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "smart window tiling manager for KDE/KWin")
    (description "Smart window tiling manager for KDE/KWin.")
    (home-page "https://github.com/TheVisher/Pave")
    (license license:expat)))

(define-public portmaster-bin
  (package
    (name "portmaster-bin")
    (version "2.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/portmaster-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "privacy Suite and Firewall - installs the official prebuilt Portmaster binaries")
    (description "Privacy Suite and Firewall - installs the official prebuilt Portmaster binaries.")
    (home-page "https://safing.io/portmaster")
    (license license:gpl3)))

(define-public python-torchao-rocm
  (package
    (name "python-torchao-rocm")
    (version "0.16.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-torchao-rocm.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "package for applying ao techniques to GPU models (with ROCm/HIP support)")
    (description "Package for applying ao techniques to GPU models (with ROCm/HIP support).")
    (home-page "https://pytorch.org/ao/stable/index.html")
    (license license:bsd-3)))

(define-public re3-git
  (package
    (name "re3-git")
    (version "1.0.r294.g3233ffe")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/GTAmodding/re3")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "grand Theft Auto III reverse engineered")
    (description "Grand Theft Auto III reverse engineered.")
    (home-page "https://github.com/GTAmodding/re3")
    (license license:non-copyleft)))

(define-public redisinsight
  (package
    (name "redisinsight")
    (version "3.2.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/redisinsight.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (synopsis "desktop manager that provides an intuitive and efficient GUI for Redis, allow...")
    (description "Desktop manager that provides an intuitive and efficient GUI for Redis, allowing you to interact with your databases, monitor, and manage your data.")
    (home-page "https://github.com/redis/RedisInsight")
    (license license:non-copyleft)))

(define-public rustconn
  (package
    (name "rustconn")
    (version "0.10.18")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/rustconn.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "modern connection manager for Linux with GTK4/Wayland-native interface")
    (description "Modern connection manager for Linux with GTK4/Wayland-native interface.")
    (home-page "https://github.com/totoshko88/RustConn")
    (license license:gpl3+)))

(define-public satisfactory-mod-manager
  (package
    (name "satisfactory-mod-manager")
    (version "3.0.5")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/satisfactory-mod-manager.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a mod manager for easy installation of mods and modloader for Satisfactory")
    (description "A mod manager for easy installation of mods and modloader for Satisfactory.")
    (home-page "https://github.com/satisfactorymodding/SatisfactoryModManager")
    (license license:gpl3)))

(define-public simracing-essentials
  (package
    (name "simracing-essentials")
    (version "1.6")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/simracing-essentials.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a collection of sim racing-focused utilities and drivers")
    (description "A collection of sim racing-focused utilities and drivers.")
    (home-page "https://github.com/Lawstorant")
    (license license:gpl2)))

(define-public spaz-hib
  (package
    (name "spaz-hib")
    (version "1.605+h20120918")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/spaz-hib.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "space Pirates and Zombies, a top-down space combat/strategy game (Humble Bund...")
    (description "Space Pirates and Zombies, a top-down space combat/strategy game (Humble Bundle version).")
    (home-page "http://spacepiratesandzombies.com/")
    (license license:non-copyleft)))

(define-public stratos-cli
  (package
    (name "stratos-cli")
    (version "0.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/stratos-cli.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "multi-Agent Autonomous Coding System for Terminal")
    (description "Multi-Agent Autonomous Coding System for Terminal.")
    (home-page "https://github.com/SPTApyo/stratos-cli")
    (license license:expat)))

(define-public streamcontroller-git
  (package
    (name "streamcontroller-git")
    (version "r1856.0967bb2a")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/StreamController/StreamController")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "an elegant Linux app for the Elgato Stream Deck with support for plugins")
    (description "An elegant Linux app for the Elgato Stream Deck with support for plugins.")
    (home-page "https://github.com/StreamController/StreamController")
    (license license:non-copyleft)))

(define-public ticktick
  (package
    (name "ticktick")
    (version "8.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ticktick.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "official desktop application for Linux")
    (description "Official desktop application for Linux.")
    (home-page "https://ticktick.com/download")
    (license license:non-copyleft)))

(define-public tonearm-git
  (package
    (name "tonearm-git")
    (version "v1.4.0.r1.gf4d9724")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://codeberg.org/dergs/Tonearm")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments (list #:tests? #f))
    (synopsis "unofficial native GTK4 / Adwaita music streaming client for TIDAL")
    (description "Unofficial native GTK4 / Adwaita music streaming client for TIDAL.")
    (home-page "https://codeberg.org/dergs/Tonearm")
    (license license:gpl3+)))

(define-public vaping
  (package
    (name "vaping")
    (version "1.5.4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/vaping.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a healthy alternative to SmokePing!")
    (description "A healthy alternative to SmokePing!.")
    (home-page "https://github.com/20c/vaping")
    (license license:asl2.0)))

(define-public wifiman-desktop
  (package
    (name "wifiman-desktop")
    (version "1.2.8")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/wifiman-desktop.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "network analysis and WiFi speed testing tool by Ubiquiti")
    (description "Network analysis and WiFi speed testing tool by Ubiquiti.")
    (home-page "https://ui.com")
    (license license:non-copyleft)))

(define-public winboat
  (package
    (name "winboat")
    (version "0.9.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/winboat.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments (list #:tests? #f))
    (synopsis "run Windows apps on Linux with seamless integration")
    (description "Run Windows apps on Linux with seamless integration.")
    (home-page "https://www.winboat.app")
    (license license:expat)))

(define-public xnviewmp-system-libs
  (package
    (name "xnviewmp-system-libs")
    (version "1.10.5")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/xnviewmp-system-libs.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "an efficient multimedia viewer, browser and converter (using system libraries)")
    (description "An efficient multimedia viewer, browser and converter (using system libraries).")
    (home-page "https://www.xnview.com/en/xnviewmp/")
    (license license:non-copyleft)))

(define-public xpybar
  (package
    (name "xpybar")
    (version "1.21.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/xpybar.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a highly extensible minimalistic dock panel configured in Python 3")
    (description "A highly extensible minimalistic dock panel configured in Python 3.")
    (home-page "https://codeberg.org/maandree/xpybar")
    (license license:non-copyleft)))

(define-public yacreader
  (package
    (name "yacreader")
    (version "9.16.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/yacreader.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "comic reader for cross-platform reading and managing your digital comic colle...")
    (description "Comic reader for cross-platform reading and managing your digital comic collection.")
    (home-page "http://www.yacreader.com")
    (license license:gpl3)))

(define-public yacreaderlibraryserver
  (package
    (name "yacreaderlibraryserver")
    (version "9.16.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/yacreaderlibraryserver.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "headless YACReaderLibrary server for use with YACReader for iOS")
    (description "Headless YACReaderLibrary server for use with YACReader for iOS.")
    (home-page "http://www.yacreader.com")
    (license license:gpl3)))

(define-public zerobrane-studio
  (package
    (name "zerobrane-studio")
    (version "2.01")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/zerobrane-studio.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a lightweight Lua-based IDE for Lua")
    (description "A lightweight Lua-based IDE for Lua.")
    (home-page "https://studio.zerobrane.com/")
    (license license:expat)))

(define-public appimage-builder-bin
  (package
    (name "appimage-builder-bin")
    (version "1.1.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/appimage-builder-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "gNU/Linux packaging solution using the AppImage format")
    (description "GNU/Linux packaging solution using the AppImage format.")
    (home-page "https://github.com/AppImageCrafters/appimage-builder")
    (license license:expat)))

(define-public atrust-bin
  (package
    (name "atrust-bin")
    (version "2.5.16.30")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/atrust-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "sangfor ssl sdp client.(Prebuilt version.Use system-wide electron)")
    (description "Sangfor ssl sdp client.(Prebuilt version.Use system-wide electron).")
    (home-page "https://www.sangfor.com/")
    (license license:non-copyleft)))

(define-public canon-pixma-ts5055-complete
  (package
    (name "canon-pixma-ts5055-complete")
    (version "6.40")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/canon-pixma-ts5055-complete.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "cnijfilter2 scangearmp2 Print Scan for Canon MAXIFY PIXMA PIXUS series E200 E...")
    (description "Cnijfilter2 scangearmp2 Print Scan for Canon MAXIFY PIXMA PIXUS series E200 E300 E3100 E3300 E3400 E4200 E4500 E460 E470 E480 G1020 G2020 G2060 G3000 G3010 G3020 G3060 G4000 G4010 G5000 G500 G5080 G6000 G600 G6080 G7000 G7080.")
    (home-page "https://www.canon-europe.com/support/consumer_products/products/fax__multifunctionals/inkjet/pixma_ts_series/pixma-ts3340.html?type=drivers")
    (license license:non-copyleft)))

(define-public casual-pre-loader-git
  (package
    (name "casual-pre-loader-git")
    (version "2.1.0.9.ga5a431f")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/cueki/casual-pre-loader")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "tF2 particle modifications via some wizardry")
    (description "TF2 particle modifications via some wizardry.")
    (home-page "https://github.com/cueki/casual-pre-loader")
    (license license:non-copyleft)))

(define-public chatterino2-7tv-git
  (package
    (name "chatterino2-7tv-git")
    (version "7.5.4.r168.g35ff16d")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/SevenTV/chatterino7")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a fork of Chatterino2 with built-in support for 7tv emotes")
    (description "A fork of Chatterino2 with built-in support for 7tv emotes.")
    (home-page "https://github.com/SevenTV/chatterino7")
    (license license:expat)))

(define-public clyp-bin
  (package
    (name "clyp-bin")
    (version "0.9.6")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/clyp-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "clipboard manager for Linux")
    (description "Clipboard manager for Linux.")
    (home-page "https://github.com/murat-cileli/clyp")
    (license license:gpl3)))

(define-public cnrdrvcups-lb
  (package
    (name "cnrdrvcups-lb")
    (version "6.20.1.20")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/cnrdrvcups-lb.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "cUPS Canon UFR II LIPSLX CARPS2 printer driver for LBP iR MF ImageCLASS Image...")
    (description "CUPS Canon UFR II LIPSLX CARPS2 printer driver for LBP iR MF ImageCLASS ImageRUNNER Laser Shot i-SENSYS ImagePRESS ADVANCE printers and copiers.")
    (home-page "https://www.canon-europe.com/support/consumer/products/printers/i-sensys/mf-series/i-sensys-mf657cdw.html?type=drivers&language=EN&os=Linux%20(64-bit)")
    (license license:gpl2)))

(define-public codex-app-bin
  (package
    (name "codex-app-bin")
    (version "r4.13c0811")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/codex-app-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "helper script to port the codex macos desktop app to arch linux (x86_64)")
    (description "Helper script to port the codex macos desktop app to arch linux (x86_64).")
    (home-page "https://github.com/fvaha/New-Codex-App-Manjaro-Arch-Port")
    (license license:non-copyleft)))

(define-public cynthiune-app
  (package
    (name "cynthiune-app")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/cynthiune.app.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "free software and romantic music player for GNUstep")
    (description "Free software and romantic music player for GNUstep.")
    (home-page "http://gap.nongnu.org/cynthiune/index.html")
    (license license:gpl2+)))

(define-public dangerzone-bin
  (package
    (name "dangerzone-bin")
    (version "0.10.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/dangerzone-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "take potentially dangerous PDFs, office documents, or images and convert them...")
    (description "Take potentially dangerous PDFs, office documents, or images and convert them to a safe PDF.")
    (home-page "https://github.com/freedomofpress/dangerzone")
    (license license:agpl3)))

(define-public danxi
  (package
    (name "danxi")
    (version "1.5.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/danxi.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "maybe the best all-rounded service app for Fudan University students | 可能是复旦学...")
    (description "Maybe the best all-rounded service app for Fudan University students | 可能是复旦学生最好的第三方校园服务 APP.")
    (home-page "https://github.com/DanXi-Dev/DanXi")
    (license license:gpl3+)))

(define-public dnsdiag
  (package
    (name "dnsdiag")
    (version "2.9.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/dnsdiag.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "dNS Measurement, Troubleshooting and Security Auditing Toolset")
    (description "DNS Measurement, Troubleshooting and Security Auditing Toolset.")
    (home-page "https://dnsdiag.org")
    (license license:bsd-2)))

(define-public dupeguru-git
  (package
    (name "dupeguru-git")
    (version "4.3.1.r69.g16aa6c21")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/dupeguru-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "find duplicate files on your system")
    (description "Find duplicate files on your system.")
    (home-page "https://dupeguru.voltaicideas.net/")
    (license license:gpl3)))

(define-public en-croissant-bin
  (package
    (name "en-croissant-bin")
    (version "0.15.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/en-croissant-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the Ultimate Chess Toolkit")
    (description "The Ultimate Chess Toolkit.")
    (home-page "https://github.com/franciscoBSalgueiro/en-croissant")
    (license license:gpl3)))

(define-public exaile-git
  (package
    (name "exaile-git")
    (version "4.1.3beta3+11+g1994772c")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/exaile-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "music player for gnome, similar to KDEs amarok")
    (description "Music player for gnome, similar to KDEs amarok.")
    (home-page "https://www.exaile.org")
    (license license:gpl3+)))

(define-public gns3-gui-2
  (package
    (name "gns3-gui-2")
    (version "2.2.58.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gns3-gui-2.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "gNS3 network simulator. Graphical user interface package")
    (description "GNS3 network simulator. Graphical user interface package.")
    (home-page "https://github.com/GNS3/gns3-gui")
    (license license:gpl3)))

(define-public gtk-meshtastic-client
  (package
    (name "gtk-meshtastic-client")
    (version "1.5")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gtk-meshtastic-client.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "an unofficial client for Meshtastic devices in GTK4/Libadwaita")
    (description "An unofficial client for Meshtastic devices in GTK4/Libadwaita.")
    (home-page "https://gitlab.com/kop316/gtk-meshtastic-client")
    (license license:gpl3)))

(define-public heroic-games-launcher-git
  (package
    (name "heroic-games-launcher-git")
    (version "2.19.1.r11.g27e43eac1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/heroic-games-launcher-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (synopsis "native GOG, Epic Games and Amazon games launcher for Linux")
    (description "Native GOG, Epic Games and Amazon games launcher for Linux.")
    (home-page "https://heroicgameslauncher.com/")
    (license license:gpl3)))

(define-public hyprlauncher-git
  (package
    (name "hyprlauncher-git")
    (version "0.1.0.r0.gd49288f")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/hyprwm/hyprlauncher")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "multipurpose and versatile launcher / picker for Hyprland")
    (description "Multipurpose and versatile launcher / picker for Hyprland.")
    (home-page "https://github.com/hyprwm/hyprlauncher")
    (license license:bsd-3)))

(define-public input-remapper-git
  (package
    (name "input-remapper-git")
    (version "2.2.0.r9.g0e1e0be9")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/sezanzeb/input-remapper/")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a tool to change and program the mapping of your input device buttons")
    (description "A tool to change and program the mapping of your input device buttons.")
    (home-page "https://github.com/sezanzeb/input-remapper/")
    (license license:gpl3+)))
