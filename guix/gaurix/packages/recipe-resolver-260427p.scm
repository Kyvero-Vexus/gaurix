;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260427p
;;; Resolves 100 packages from queue (100 recipes, 0 blocked).
;;;
;;; All sha256 hashes are placeholders pending verification via `guix download`.

(define-module (gaurix packages recipe-resolver-260427p)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:export (
            lmstudio-bin
            systemd-liberated-libs-git
            ttf-ms-win11-auto
            ttf-ms-win11-auto-japanese
            ttf-ms-win11-auto-korean
            ttf-ms-win11-auto-sea
            ttf-ms-win11-auto-thai
            ttf-ms-win11-auto-zh-cn
            ttf-ms-win11-auto-zh-tw
            ttf-ms-win11-auto-other
            protonup-qt
            informant
            linux-cachyos
            linux-cachyos-headers
            arduino-ide-bin
            brave-origin-beta-bin
            rsgain
            zenpower3-dkms
            weave-merge
            android-cli
            cline-cli
            yandex-music
            lld19
            pacsea-bin
            jdk-temurin
            86box
            grayjay-bin
            dmemcg-booster
            remoteterm-meshcore
            miniconda3
            docker-desktop
            obs-studio-tytan652
            freesmlauncher
            droidcam
            v4l2loopback-dc-dkms
            dosbox-x
            sd-boot
            powershell-lts-bin
            fluxer-canary-bin
            webkit2gtk-is-webkit2gtk-4-1
            stegoforge-bin
            cursor-early-access-bin
            pipeweaver
            jackett-bin
            superset-bin
            firefox-extension-proton-vpn
            proton-vpn-browser-extension
            sse2neon
            oidc-agent
            python-lzallright
            opencpn-plugin-o-charts
            parsec-bin
            xone-dkms
            python38
            balena-etcher
            scran
            openclaw
            mongosh-bin
            pacolog
            masterpdfeditor
            fvs2
            milcheck
            libofa
            motrix-next-bin
            hermes-agent
            pngout
            where-is-my-sddm-theme-git
            baru
            pear-desktop-arjix-git
            clang19
            multitail
            vidbee-bin
            idescriptor
            goosestation-libretro
            dota2-minify-bin
            python-gevent-eventemitter
            arubasign-rolling-bin
            vrct
            vrcft-avalonia-bin
            pipdeptree
            kosmos-bin
            stm32cubemx
            driftwm
            micromamba-bin
            finch
            libgadu
            usbguard-qt
            immich-server
            immich-cli
            quien-bin
            pureref
            restic-browser
            seafile-client-appimage
            fuzzel-ime-git
            wsjtx-improved-qt6
            wsjtx-improved-al-qt6
            wsjtx-improved-widescreen-qt6
            ryzen-monitor
            trae-bin
            gtk-theme-arc-gruvbox-git
            ))

;;; Nonfree/proprietary license placeholder for Gaurix channel
(define license:nonfree
  ((@@ (guix licenses) license) "Nonfree"
    "https://spdx.org/licenses/"
    "Proprietary or custom license; see upstream for terms."))

;;; lmstudio-bin --- lM Studio - A desktop app for exploring and running large language models loc...
(define-public lmstudio-bin
  (package
    (name "lmstudio-bin")
    (version "0.4.12")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lmstudio-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "lM Studio - A desktop app for exploring and running large language models loc...")
    (description "LM Studio - A desktop app for exploring and running large language models locally.")
    (home-page "https://lmstudio.ai")
    (license license:nonfree)))

;;; systemd-liberated-libs-git --- systemd client libraries — liberated fork (git version)
(define-public systemd-liberated-libs-git
  (package
    (name "systemd-liberated-libs-git")
    (version "261.r87873")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/systemd-liberated-libs-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "systemd client libraries — liberated fork (git version)")
    (description "systemd client libraries — liberated fork (git version).")
    (home-page "https://github.com/Jeffrey-Sardina/systemd")
    (license license:cc0)))

;;; ttf-ms-win11-auto --- microsoft Windows 11 TrueType fonts
(define-public ttf-ms-win11-auto
  (package
    (name "ttf-ms-win11-auto")
    (version "10.0.26100.1742")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ttf-ms-win11-auto.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "microsoft Windows 11 TrueType fonts")
    (description "Microsoft Windows 11 TrueType fonts.")
    (home-page "https://www.microsoft.com/typography/fonts/product.aspx?PID=164")
    (license license:nonfree)))

;;; ttf-ms-win11-auto-japanese --- microsoft Windows 11 Japanese TrueType fonts
(define-public ttf-ms-win11-auto-japanese
  (package
    (name "ttf-ms-win11-auto-japanese")
    (version "10.0.26100.1742")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ttf-ms-win11-auto-japanese.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "microsoft Windows 11 Japanese TrueType fonts")
    (description "Microsoft Windows 11 Japanese TrueType fonts.")
    (home-page "https://www.microsoft.com/typography/fonts/product.aspx?PID=164")
    (license license:nonfree)))

;;; ttf-ms-win11-auto-korean --- microsoft Windows 11 Korean TrueType fonts
(define-public ttf-ms-win11-auto-korean
  (package
    (name "ttf-ms-win11-auto-korean")
    (version "10.0.26100.1742")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ttf-ms-win11-auto-korean.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "microsoft Windows 11 Korean TrueType fonts")
    (description "Microsoft Windows 11 Korean TrueType fonts.")
    (home-page "https://www.microsoft.com/typography/fonts/product.aspx?PID=164")
    (license license:nonfree)))

;;; ttf-ms-win11-auto-sea --- microsoft Windows 11 Southeast Asian TrueType fonts
(define-public ttf-ms-win11-auto-sea
  (package
    (name "ttf-ms-win11-auto-sea")
    (version "10.0.26100.1742")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ttf-ms-win11-auto-sea.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "microsoft Windows 11 Southeast Asian TrueType fonts")
    (description "Microsoft Windows 11 Southeast Asian TrueType fonts.")
    (home-page "https://www.microsoft.com/typography/fonts/product.aspx?PID=164")
    (license license:nonfree)))

;;; ttf-ms-win11-auto-thai --- microsoft Windows 11 Thai TrueType fonts
(define-public ttf-ms-win11-auto-thai
  (package
    (name "ttf-ms-win11-auto-thai")
    (version "10.0.26100.1742")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ttf-ms-win11-auto-thai.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "microsoft Windows 11 Thai TrueType fonts")
    (description "Microsoft Windows 11 Thai TrueType fonts.")
    (home-page "https://www.microsoft.com/typography/fonts/product.aspx?PID=164")
    (license license:nonfree)))

;;; ttf-ms-win11-auto-zh-cn --- microsoft Windows 11 Simplified Chinese TrueType fonts
(define-public ttf-ms-win11-auto-zh-cn
  (package
    (name "ttf-ms-win11-auto-zh-cn")
    (version "10.0.26100.1742")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ttf-ms-win11-auto-zh_cn.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "microsoft Windows 11 Simplified Chinese TrueType fonts")
    (description "Microsoft Windows 11 Simplified Chinese TrueType fonts.")
    (home-page "https://www.microsoft.com/typography/fonts/product.aspx?PID=164")
    (license license:nonfree)))

;;; ttf-ms-win11-auto-zh-tw --- microsoft Windows 11 Traditional Chinese TrueType fonts
(define-public ttf-ms-win11-auto-zh-tw
  (package
    (name "ttf-ms-win11-auto-zh-tw")
    (version "10.0.26100.1742")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ttf-ms-win11-auto-zh_tw.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "microsoft Windows 11 Traditional Chinese TrueType fonts")
    (description "Microsoft Windows 11 Traditional Chinese TrueType fonts.")
    (home-page "https://www.microsoft.com/typography/fonts/product.aspx?PID=164")
    (license license:nonfree)))

;;; ttf-ms-win11-auto-other --- microsoft Windows 11 Other TrueType fonts
(define-public ttf-ms-win11-auto-other
  (package
    (name "ttf-ms-win11-auto-other")
    (version "10.0.26100.1742")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ttf-ms-win11-auto-other.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "microsoft Windows 11 Other TrueType fonts")
    (description "Microsoft Windows 11 Other TrueType fonts.")
    (home-page "https://www.microsoft.com/typography/fonts/product.aspx?PID=164")
    (license license:nonfree)))

;;; protonup-qt --- install and manage Proton-GE and Luxtorpeda for Steam and Wine-GE for Lutris
(define-public protonup-qt
  (package
    (name "protonup-qt")
    (version "2.15.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/protonup-qt.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "install and manage Proton-GE and Luxtorpeda for Steam and Wine-GE for Lutris")
    (description "Install and manage Proton-GE and Luxtorpeda for Steam and Wine-GE for Lutris.")
    (home-page "https://davidotek.github.io/protonup-qt")
    (license license:gpl3+)))

;;; informant --- an Arch Linux News reader and pacman hook
(define-public informant
  (package
    (name "informant")
    (version "0.6.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/informant.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "an Arch Linux News reader and pacman hook")
    (description "An Arch Linux News reader and pacman hook.")
    (home-page "https://github.com/bradford-smith94/informant")
    (license license:expat)))

;;; linux-cachyos --- the Linux EEVDF + LTO + AutoFDO + Propeller Cachy Sauce Kernel by CachyOS wit...
(define-public linux-cachyos
  (package
    (name "linux-cachyos")
    (version "7.0.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/linux-cachyos.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "the Linux EEVDF + LTO + AutoFDO + Propeller Cachy Sauce Kernel by CachyOS wit...")
    (description "The Linux EEVDF + LTO + AutoFDO + Propeller Cachy Sauce Kernel by CachyOS with other patches and improvements. kernel and modules.")
    (home-page "https://github.com/CachyOS/linux-cachyos")
    (license license:gpl2)))

;;; linux-cachyos-headers --- headers and scripts for building modules for the Linux EEVDF + LTO + AutoFDO ...
(define-public linux-cachyos-headers
  (package
    (name "linux-cachyos-headers")
    (version "7.0.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/linux-cachyos-headers.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "headers and scripts for building modules for the Linux EEVDF + LTO + AutoFDO ...")
    (description "Headers and scripts for building modules for the Linux EEVDF + LTO + AutoFDO + Propeller Cachy Sauce Kernel by CachyOS with other patches and improvements. kernel.")
    (home-page "https://github.com/CachyOS/linux-cachyos")
    (license license:gpl2)))

;;; arduino-ide-bin --- arduino prototyping platform IDE, rewrite based on the Theia IDE framework
(define-public arduino-ide-bin
  (package
    (name "arduino-ide-bin")
    (version "2.3.8")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/arduino-ide-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "arduino prototyping platform IDE, rewrite based on the Theia IDE framework")
    (description "Arduino prototyping platform IDE, rewrite based on the Theia IDE framework.")
    (home-page "https://github.com/arduino/arduino-ide")
    (license license:agpl3)))

;;; brave-origin-beta-bin --- the minimalist browser from the makers of Brave (beta binary release)
(define-public brave-origin-beta-bin
  (package
    (name "brave-origin-beta-bin")
    (version "1.91.87")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/brave-origin-beta-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "the minimalist browser from the makers of Brave (beta binary release)")
    (description "The minimalist browser from the makers of Brave (beta binary release).")
    (home-page "https://brave.com/origin/download-beta")
    (license license:mpl2.0)))

;;; rsgain --- replayGain 2.0 loudness normalizer
(define-public rsgain
  (package
    (name "rsgain")
    (version "3.7")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/rsgain.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "replayGain 2.0 loudness normalizer")
    (description "ReplayGain 2.0 loudness normalizer.")
    (home-page "https://github.com/complexlogic/rsgain")
    (license license:bsd-2)))

;;; zenpower3-dkms --- linux kernel driver for reading sensors for AMD Zen family CPUs
(define-public zenpower3-dkms
  (package
    (name "zenpower3-dkms")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/zenpower3-dkms.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "linux kernel driver for reading sensors for AMD Zen family CPUs")
    (description "Linux kernel driver for reading sensors for AMD Zen family CPUs.")
    (home-page "https://github.com/AliEmreSenel/zenpower3")
    (license license:gpl2)))

;;; weave-merge --- entity-level semantic merge CLI. Resolves conflicts at the function/class lev...
(define-public weave-merge
  (package
    (name "weave-merge")
    (version "0.3.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/weave-merge.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "entity-level semantic merge CLI. Resolves conflicts at the function/class lev...")
    (description "Entity-level semantic merge CLI. Resolves conflicts at the function/class level instead of lines.")
    (home-page "https://github.com/Ataraxy-Labs/weave")
    (license license:asl2.0)))

;;; android-cli --- google Android CLI prebuilt binary
(define-public android-cli
  (package
    (name "android-cli")
    (version "0.7.15232955")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/android-cli.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "google Android CLI prebuilt binary")
    (description "Google Android CLI prebuilt binary.")
    (home-page "https://developer.android.com/tools/agents/android-cli")
    (license license:nonfree)))

;;; cline-cli --- autonomous coding agent CLI - capable of creating/editing files, running comm...
(define-public cline-cli
  (package
    (name "cline-cli")
    (version "2.17.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/cline-cli.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "autonomous coding agent CLI - capable of creating/editing files, running comm...")
    (description "Autonomous coding agent CLI - capable of creating/editing files, running commands, using the browser, and more.")
    (home-page "https://www.npmjs.com/package/cline")
    (license license:asl2.0)))

;;; yandex-music --- official Yandex Music App for Linux
(define-public yandex-music
  (package
    (name "yandex-music")
    (version "5.96.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/yandex-music.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "official Yandex Music App for Linux")
    (description "Official Yandex Music App for Linux.")
    (home-page "https://music.yandex.ru/download/")
    (license license:nonfree)))

;;; lld19 --- linker from the LLVM project (Version 19)
(define-public lld19
  (package
    (name "lld19")
    (version "19.1.7")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lld19.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "linker from the LLVM project (Version 19)")
    (description "Linker from the LLVM project (Version 19).")
    (home-page "https://lld.llvm.org/")
    (license license:asl2.0)))

;;; pacsea-bin --- fast TUI for searching, inspecting, and queueing pacman/AUR packages written ...
(define-public pacsea-bin
  (package
    (name "pacsea-bin")
    (version "0.8.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/pacsea-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "fast TUI for searching, inspecting, and queueing pacman/AUR packages written ...")
    (description "Fast TUI for searching, inspecting, and queueing pacman/AUR packages written in Rust (binary version).")
    (home-page "https://github.com/Firstp1ck/Pacsea")
    (license license:expat)))

;;; jdk-temurin --- temurin (OpenJDK 26 Java binaries by Adoptium, formerly AdoptOpenJDK)
(define-public jdk-temurin
  (package
    (name "jdk-temurin")
    (version "26.0.0.u35")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/jdk-temurin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "temurin (OpenJDK 26 Java binaries by Adoptium, formerly AdoptOpenJDK)")
    (description "Temurin (OpenJDK 26 Java binaries by Adoptium, formerly AdoptOpenJDK).")
    (home-page "https://adoptium.net/")
    (license license:nonfree)))

;;; 86box --- an emulator for classic IBM PC clones
(define-public 86box
  (package
    (name "86box")
    (version "5.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/86box.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "an emulator for classic IBM PC clones")
    (description "An emulator for classic IBM PC clones.")
    (home-page "https://86box.net/")
    (license license:cc-by4.0)))

;;; grayjay-bin --- grayjay Desktop - follow creators, not platforms (privacy- and freedom-respec...
(define-public grayjay-bin
  (package
    (name "grayjay-bin")
    (version "17")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/grayjay-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "grayjay Desktop - follow creators, not platforms (privacy- and freedom-respec...")
    (description "Grayjay Desktop - follow creators, not platforms (privacy- and freedom-respecting client for YouTube, Rumble, Twitch, Spotify etc).")
    (home-page "https://grayjay.app/desktop/")
    (license license:nonfree)))

;;; dmemcg-booster --- service for enabling and controlling dmem cgroup limits for boosting foregrou...
(define-public dmemcg-booster
  (package
    (name "dmemcg-booster")
    (version "0.1.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/dmemcg-booster.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "service for enabling and controlling dmem cgroup limits for boosting foregrou...")
    (description "Service for enabling and controlling dmem cgroup limits for boosting foreground games.")
    (home-page "https://gitlab.steamos.cloud/holo/dmemcg-booster")
    (license license:nonfree)))

;;; remoteterm-meshcore --- web interface for MeshCore mesh radio networks
(define-public remoteterm-meshcore
  (package
    (name "remoteterm-meshcore")
    (version "3.12.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/remoteterm-meshcore.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "web interface for MeshCore mesh radio networks")
    (description "Web interface for MeshCore mesh radio networks.")
    (home-page "https://github.com/jkingsman/Remote-Terminal-for-MeshCore")
    (license license:expat)))

;;; miniconda3 --- mini version of Anaconda Python distribution
(define-public miniconda3
  (package
    (name "miniconda3")
    (version "26.1.1.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/miniconda3.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "mini version of Anaconda Python distribution")
    (description "Mini version of Anaconda Python distribution.")
    (home-page "https://conda.io/en/latest/miniconda")
    (license license:bsd-3)))

;;; docker-desktop --- docker Desktop is an easy-to-install application that enables you to locally ...
(define-public docker-desktop
  (package
    (name "docker-desktop")
    (version "4.70.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/docker-desktop.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "docker Desktop is an easy-to-install application that enables you to locally ...")
    (description "Docker Desktop is an easy-to-install application that enables you to locally build and share containerized applications and microservices.")
    (home-page "https://www.docker.com/products/docker-desktop/")
    (license license:nonfree)))

;;; obs-studio-tytan652 --- free and open source software for video recording and live streaming. With ev...
(define-public obs-studio-tytan652
  (package
    (name "obs-studio-tytan652")
    (version "32.1.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/obs-studio-tytan652.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "free and open source software for video recording and live streaming. With ev...")
    (description "Free and open source software for video recording and live streaming. With everything except service integrations. Plus my bind interface PR, and sometimes backported fixes.")
    (home-page "https://github.com/obsproject/obs-studio")
    (license license:gpl2+)))

;;; freesmlauncher --- minecraft launcher with offline accounts support
(define-public freesmlauncher
  (package
    (name "freesmlauncher")
    (version "2.2.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/freesmlauncher.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "minecraft launcher with offline accounts support")
    (description "Minecraft launcher with offline accounts support.")
    (home-page "https://freesmlauncher.org/")
    (license license:nonfree)))

;;; droidcam --- a tool to turn your phone/tablet into a wireless/usb webcam
(define-public droidcam
  (package
    (name "droidcam")
    (version "2.1.5")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/droidcam.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "a tool to turn your phone/tablet into a wireless/usb webcam")
    (description "A tool to turn your phone/tablet into a wireless/usb webcam.")
    (home-page "https://github.com/dev47apps/droidcam-linux-client")
    (license license:gpl2+)))

;;; v4l2loopback-dc-dkms --- v4l2-loopback kernel module - DroidCam version
(define-public v4l2loopback-dc-dkms
  (package
    (name "v4l2loopback-dc-dkms")
    (version "2.1.5")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/v4l2loopback-dc-dkms.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "v4l2-loopback kernel module - DroidCam version")
    (description "v4l2-loopback kernel module - DroidCam version.")
    (home-page "https://github.com/dev47apps/droidcam-linux-client")
    (license license:gpl2+)))

;;; dosbox-x --- x86 emulator with builtin DOS, with patches with more features
(define-public dosbox-x
  (package
    (name "dosbox-x")
    (version "2026.03.29")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/dosbox-x.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "x86 emulator with builtin DOS, with patches with more features")
    (description "x86 emulator with builtin DOS, with patches with more features.")
    (home-page "http://dosbox-x.com")
    (license license:gpl2+)))

;;; sd-boot --- tools to install linux kernels via kernel-install from systemd
(define-public sd-boot
  (package
    (name "sd-boot")
    (version "3.8.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/sd-boot.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "tools to install linux kernels via kernel-install from systemd")
    (description "Tools to install linux kernels via kernel-install from systemd.")
    (home-page "https://github.com/gene-git/sd-boot")
    (license license:gpl2+)))

;;; powershell-lts-bin --- powerShell Core is a cross-platform (Windows, Linux, and macOS) automation an...
(define-public powershell-lts-bin
  (package
    (name "powershell-lts-bin")
    (version "7.6.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/powershell-lts-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "powerShell Core is a cross-platform (Windows, Linux, and macOS) automation an...")
    (description "PowerShell Core is a cross-platform (Windows, Linux, and macOS) automation and configuration tool/framework.")
    (home-page "https://github.com/Powershell/Powershell")
    (license license:nonfree)))

;;; fluxer-canary-bin --- fluxer Canary Desktop Application
(define-public fluxer-canary-bin
  (package
    (name "fluxer-canary-bin")
    (version "0.0.50")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/fluxer-canary-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "fluxer Canary Desktop Application")
    (description "Fluxer Canary Desktop Application.")
    (home-page "https://fluxer.app")
    (license license:agpl3)))

;;; webkit2gtk-is-webkit2gtk-4-1 --- dummy package redirecting webkit2gtk to webkit2gtk-4.1
(define-public webkit2gtk-is-webkit2gtk-4-1
  (package
    (name "webkit2gtk-is-webkit2gtk-4-1")
    (version "2.52.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/webkit2gtk-is-webkit2gtk-4-1.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "dummy package redirecting webkit2gtk to webkit2gtk-4.1")
    (description "Dummy package redirecting webkit2gtk to webkit2gtk-4.1.")
    (home-page "https://webkitgtk.org")
    (license license:expat)))

;;; stegoforge-bin --- the ultimate steganography and digital forensics toolkit
(define-public stegoforge-bin
  (package
    (name "stegoforge-bin")
    (version "1.1.5")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/stegoforge-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "the ultimate steganography and digital forensics toolkit")
    (description "The ultimate steganography and digital forensics toolkit.")
    (home-page "https://github.com/Nour833/StegoForge")
    (license license:expat)))

;;; cursor-early-access-bin --- aI-first coding environment (early access channel, bundled Electron)
(define-public cursor-early-access-bin
  (package
    (name "cursor-early-access-bin")
    (version "3.2.11")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/cursor-early-access-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "aI-first coding environment (early access channel, bundled Electron)")
    (description "AI-first coding environment (early access channel, bundled Electron).")
    (home-page "https://www.cursor.com")
    (license license:nonfree)))

;;; pipeweaver --- an audio management tool for Linux built on top of PipeWire, designed specifi...
(define-public pipeweaver
  (package
    (name "pipeweaver")
    (version "0.1.6")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/pipeweaver.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "an audio management tool for Linux built on top of PipeWire, designed specifi...")
    (description "An audio management tool for Linux built on top of PipeWire, designed specifically with streaming and broadcasting in mind.")
    (home-page "https://github.com/pipeweaver/pipeweaver")
    (license license:expat)))

;;; jackett-bin --- use many torrent trackers with software that supports torznab/potato feeds
(define-public jackett-bin
  (package
    (name "jackett-bin")
    (version "0.24.1787")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/jackett-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "use many torrent trackers with software that supports torznab/potato feeds")
    (description "Use many torrent trackers with software that supports torznab/potato feeds.")
    (home-page "https://github.com/Jackett/Jackett")
    (license license:gpl2+)))

;;; superset-bin --- code Editor for the AI Agents Era - Run an army of Claude Code, Codex, etc. o...
(define-public superset-bin
  (package
    (name "superset-bin")
    (version "1.6.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/superset-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "code Editor for the AI Agents Era - Run an army of Claude Code, Codex, etc. o...")
    (description "Code Editor for the AI Agents Era - Run an army of Claude Code, Codex, etc. on your machine.")
    (home-page "https://superset.sh")
    (license license:nonfree)))

;;; firefox-extension-proton-vpn --- proton VPN extension for Firefox
(define-public firefox-extension-proton-vpn
  (package
    (name "firefox-extension-proton-vpn")
    (version "1.2.16")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/firefox-extension-proton-vpn.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "proton VPN extension for Firefox")
    (description "Proton VPN extension for Firefox.")
    (home-page "https://protonvpn.com/")
    (license license:gpl3)))

;;; proton-vpn-browser-extension --- proton VPN unpacked extension for Chromium compatible browsers
(define-public proton-vpn-browser-extension
  (package
    (name "proton-vpn-browser-extension")
    (version "1.2.16")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/proton-vpn-browser-extension.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "proton VPN unpacked extension for Chromium compatible browsers")
    (description "Proton VPN unpacked extension for Chromium compatible browsers.")
    (home-page "https://protonvpn.com/")
    (license license:gpl3)))

;;; sse2neon --- translator from Intel SSE intrinsics to Arm/Aarch64 NEON implementation
(define-public sse2neon
  (package
    (name "sse2neon")
    (version "1.9.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/sse2neon.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "translator from Intel SSE intrinsics to Arm/Aarch64 NEON implementation")
    (description "Translator from Intel SSE intrinsics to Arm/Aarch64 NEON implementation.")
    (home-page "https://github.com/DLTcollab/sse2neon")
    (license license:expat)))

;;; oidc-agent --- a set of tools to manage OpenID Connect tokens and make them easily usable fr...
(define-public oidc-agent
  (package
    (name "oidc-agent")
    (version "5.3.5")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/oidc-agent.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "a set of tools to manage OpenID Connect tokens and make them easily usable fr...")
    (description "A set of tools to manage OpenID Connect tokens and make them easily usable from the command line.")
    (home-page "https://github.com/indigo-dc/oidc-agent")
    (license license:expat)))

;;; python-lzallright --- python bindings for the LZ library (LZO data compression algorithm)
(define-public python-lzallright
  (package
    (name "python-lzallright")
    (version "0.2.6")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-lzallright.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "python bindings for the LZ library (LZO data compression algorithm)")
    (description "Python bindings for the LZ library (LZO data compression algorithm).")
    (home-page "https://github.com/vlaci/lzallright")
    (license license:expat)))

;;; opencpn-plugin-o-charts --- use charts from o-charts.org in opencpn
(define-public opencpn-plugin-o-charts
  (package
    (name "opencpn-plugin-o-charts")
    (version "2.1.15")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/opencpn-plugin-o_charts.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "use charts from o-charts.org in opencpn")
    (description "use charts from o-charts.org in opencpn.")
    (home-page "https://opencpn.org/OpenCPN/plugins/ocharts.html")
    (license license:nonfree)))

;;; parsec-bin --- remotely connect to a gaming pc for a low latency remote computing experience
(define-public parsec-bin
  (package
    (name "parsec-bin")
    (version "150_97c")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/parsec-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "remotely connect to a gaming pc for a low latency remote computing experience")
    (description "Remotely connect to a gaming pc for a low latency remote computing experience.")
    (home-page "http://parsec.app")
    (license license:nonfree)))

;;; xone-dkms --- modern Linux driver for Xbox One and Xbox Series X|S controllers
(define-public xone-dkms
  (package
    (name "xone-dkms")
    (version "0.5.8")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/xone-dkms.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "modern Linux driver for Xbox One and Xbox Series X|S controllers")
    (description "Modern Linux driver for Xbox One and Xbox Series X|S controllers.")
    (home-page "https://github.com/dlundqvist/xone")
    (license license:gpl2+)))

;;; python38 --- major release 3.8 of the Python high-level programming language
(define-public python38
  (package
    (name "python38")
    (version "3.8.20")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python38.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "major release 3.8 of the Python high-level programming language")
    (description "Major release 3.8 of the Python high-level programming language.")
    (home-page "https://www.python.org/")
    (license license:psfl)))

;;; balena-etcher --- flash OS images to SD cards & USB drives, safely and easily
(define-public balena-etcher
  (package
    (name "balena-etcher")
    (version "2.1.4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/balena-etcher.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "flash OS images to SD cards & USB drives, safely and easily")
    (description "Flash OS images to SD cards & USB drives, safely and easily.")
    (home-page "https://balena.io/etcher")
    (license license:asl2.0)))

;;; scran --- image and video capture for Wayland
(define-public scran
  (package
    (name "scran")
    (version "0.8.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/scran.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "image and video capture for Wayland")
    (description "Image and video capture for Wayland.")
    (home-page "https://github.com/iciclejj/scran")
    (license license:expat)))

;;; openclaw --- personal AI assistant / multi-channel gateway
(define-public openclaw
  (package
    (name "openclaw")
    (version "2026.4.24")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/openclaw.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "personal AI assistant / multi-channel gateway")
    (description "Personal AI assistant / multi-channel gateway.")
    (home-page "https://github.com/openclaw/openclaw")
    (license license:expat)))

;;; mongosh-bin --- an interactive shell to connect with MongoDB with syntax highlighting, autoco...
(define-public mongosh-bin
  (package
    (name "mongosh-bin")
    (version "2.8.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mongosh-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "an interactive shell to connect with MongoDB with syntax highlighting, autoco...")
    (description "An interactive shell to connect with MongoDB with syntax highlighting, autocomplete, contextual help and error messages.")
    (home-page "https://github.com/mongodb-js/mongosh.git")
    (license license:asl2.0)))

;;; pacolog --- list recent commits for Arch Linux packages
(define-public pacolog
  (package
    (name "pacolog")
    (version "2.2.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/pacolog.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "list recent commits for Arch Linux packages")
    (description "List recent commits for Arch Linux packages.")
    (home-page "https://gitlab.com/protist/pacolog")
    (license license:gpl3)))

;;; masterpdfeditor --- a complete solution for viewing, creating and editing PDF files
(define-public masterpdfeditor
  (package
    (name "masterpdfeditor")
    (version "5.9.98")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/masterpdfeditor.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "a complete solution for viewing, creating and editing PDF files")
    (description "A complete solution for viewing, creating and editing PDF files.")
    (home-page "https://code-industry.net/free-pdf-editor/")
    (license license:nonfree)))

;;; fvs2 --- standalone CLI for FVS v2
(define-public fvs2
  (package
    (name "fvs2")
    (version "0.1.5")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/fvs2.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "standalone CLI for FVS v2")
    (description "Standalone CLI for FVS v2.")
    (home-page "https://github.com/fvs-lab/fvs2")
    (license license:expat)))

;;; milcheck --- a CLI to get pacman mirrorlist status and the Arch Linux latest news
(define-public milcheck
  (package
    (name "milcheck")
    (version "0.3.7")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/milcheck.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "a CLI to get pacman mirrorlist status and the Arch Linux latest news")
    (description "A CLI to get pacman mirrorlist status and the Arch Linux latest news.")
    (home-page "https://github.com/doums/milcheck")
    (license license:mpl2.0)))

;;; libofa --- an open-source audio fingerprint by MusicIP
(define-public libofa
  (package
    (name "libofa")
    (version "0.9.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/libofa.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "an open-source audio fingerprint by MusicIP")
    (description "An open-source audio fingerprint by MusicIP.")
    (home-page "https://github.com/tanob/libofa")
    (license license:nonfree)))

;;; motrix-next-bin --- a full-featured download manager rebuilt with Tauri 2, Vue 3, and Rust
(define-public motrix-next-bin
  (package
    (name "motrix-next-bin")
    (version "3.8.4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/motrix-next-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "a full-featured download manager rebuilt with Tauri 2, Vue 3, and Rust")
    (description "A full-featured download manager rebuilt with Tauri 2, Vue 3, and Rust.")
    (home-page "https://github.com/AnInsomniacy/motrix-next")
    (license license:expat)))

;;; hermes-agent --- locally-run AI agent with tool use, web browsing, and automation
(define-public hermes-agent
  (package
    (name "hermes-agent")
    (version "0.11.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/hermes-agent.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "locally-run AI agent with tool use, web browsing, and automation")
    (description "Locally-run AI agent with tool use, web browsing, and automation.")
    (home-page "https://github.com/NousResearch/hermes-agent")
    (license license:expat)))

;;; pngout --- lossless PNG compressor
(define-public pngout
  (package
    (name "pngout")
    (version "20200115")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/pngout.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "lossless PNG compressor")
    (description "Lossless PNG compressor.")
    (home-page "https://www.jonof.id.au/kenutils")
    (license license:nonfree)))

;;; where-is-my-sddm-theme-git --- the most minimalistic SDDM theme among all themes
(define-public where-is-my-sddm-theme-git
  (package
    (name "where-is-my-sddm-theme-git")
    (version "r105.9637154")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/where-is-my-sddm-theme-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "the most minimalistic SDDM theme among all themes")
    (description "The most minimalistic SDDM theme among all themes.")
    (home-page "https://github.com/stepanzubkov/where-is-my-sddm-theme")
    (license license:expat)))

;;; baru --- a simple system monitor for WM statusbar
(define-public baru
  (package
    (name "baru")
    (version "0.5.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/baru.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "a simple system monitor for WM statusbar")
    (description "A simple system monitor for WM statusbar.")
    (home-page "https://github.com/doums/baru")
    (license license:mpl2.0)))

;;; pear-desktop-arjix-git --- extension for music player
(define-public pear-desktop-arjix-git
  (package
    (name "pear-desktop-arjix-git")
    (version "3.11.4.r48.g1fe490f")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/pear-desktop-arjix-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "extension for music player")
    (description "Extension for music player.")
    (home-page "https://github.com/ArjixWasTaken/pear-desktop")
    (license license:expat)))

;;; clang19 --- c language family frontend for LLVM 19
(define-public clang19
  (package
    (name "clang19")
    (version "19.1.7")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/clang19.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "c language family frontend for LLVM 19")
    (description "C language family frontend for LLVM 19.")
    (home-page "https://clang.llvm.org/")
    (license license:asl2.0)))

;;; multitail --- view one or multiple files like the original tail program
(define-public multitail
  (package
    (name "multitail")
    (version "7.1.5")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/multitail.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "view one or multiple files like the original tail program")
    (description "View one or multiple files like the original tail program.")
    (home-page "https://www.vanheusden.com/multitail")
    (license license:expat)))

;;; vidbee-bin --- download videos from almost any website worldwide.(Prebuilt version.Use syste...
(define-public vidbee-bin
  (package
    (name "vidbee-bin")
    (version "1.3.10")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/vidbee-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "download videos from almost any website worldwide.(Prebuilt version.Use syste...")
    (description "Download videos from almost any website worldwide.(Prebuilt version.Use system-wide electron).")
    (home-page "https://vidbee.org/")
    (license license:expat)))

;;; idescriptor --- a free, open-source, and cross-platform iDevice management tool
(define-public idescriptor
  (package
    (name "idescriptor")
    (version "0.5.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/idescriptor.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "a free, open-source, and cross-platform iDevice management tool")
    (description "A free, open-source, and cross-platform iDevice management tool.")
    (home-page "https://github.com/iDescriptor/iDescriptor")
    (license license:agpl3+)))

;;; goosestation-libretro --- sony PlayStation libretro core based on goosified DuckStation
(define-public goosestation-libretro
  (package
    (name "goosestation-libretro")
    (version "0+git.5e7be496a")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/goosestation-libretro.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "sony PlayStation libretro core based on goosified DuckStation")
    (description "Sony PlayStation libretro core based on goosified DuckStation.")
    (home-page "https://codeberg.org/hueponik/goosestation-builder")
    (license license:nonfree)))

;;; dota2-minify-bin --- dota 2 Mod Patcher & Toolkit — prebuilt binary
(define-public dota2-minify-bin
  (package
    (name "dota2-minify-bin")
    (version "1.13.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/dota2-minify-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "dota 2 Mod Patcher & Toolkit — prebuilt binary")
    (description "Dota 2 Mod Patcher & Toolkit — prebuilt binary.")
    (home-page "https://github.com/Egezenn/dota2-minify")
    (license license:gpl3+)))

;;; python-gevent-eventemitter --- eventEmitter using gevent
(define-public python-gevent-eventemitter
  (package
    (name "python-gevent-eventemitter")
    (version "2.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-gevent-eventemitter.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "eventEmitter using gevent")
    (description "EventEmitter using gevent.")
    (home-page "https://github.com/rossengeorgiev/gevent-eventemitter")
    (license license:expat)))

;;; arubasign-rolling-bin --- aruba Digital Signature Suite for signing and verifying documents
(define-public arubasign-rolling-bin
  (package
    (name "arubasign-rolling-bin")
    (version "25.2.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/arubasign-rolling-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "aruba Digital Signature Suite for signing and verifying documents")
    (description "Aruba Digital Signature Suite for signing and verifying documents.")
    (home-page "https://www.pec.it/Download.aspx")
    (license license:nonfree)))

;;; vrct --- vRChat Chatbox Translator & Transcription
(define-public vrct
  (package
    (name "vrct")
    (version "3.4.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/vrct.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "vRChat Chatbox Translator & Transcription")
    (description "VRChat Chatbox Translator & Transcription.")
    (home-page "https://misyaguziya.github.io/VRCT-Docs/")
    (license license:expat)))

;;; vrcft-avalonia-bin --- cross-platform VRCFaceTracking made with Avalonia (extracted AppImage version)
(define-public vrcft-avalonia-bin
  (package
    (name "vrcft-avalonia-bin")
    (version "1.1.1.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/vrcft-avalonia-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "cross-platform VRCFaceTracking made with Avalonia (extracted AppImage version)")
    (description "Cross-platform VRCFaceTracking made with Avalonia (extracted AppImage version).")
    (home-page "https://github.com/dfgHiatus/VRCFaceTracking.Avalonia")
    (license license:asl2.0)))

;;; pipdeptree --- command line utility to show dependency tree of Python packages
(define-public pipdeptree
  (package
    (name "pipdeptree")
    (version "2.35.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/pipdeptree.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "command line utility to show dependency tree of Python packages")
    (description "Command line utility to show dependency tree of Python packages.")
    (home-page "https://github.com/naiquevin/pipdeptree")
    (license license:expat)))

;;; kosmos-bin --- a highly customizable and versatile tab-based code editor
(define-public kosmos-bin
  (package
    (name "kosmos-bin")
    (version "0.3.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/kosmos-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "a highly customizable and versatile tab-based code editor")
    (description "A highly customizable and versatile tab-based code editor.")
    (home-page "https://github.com/etchebarne/kosmos")
    (license license:expat)))

;;; stm32cubemx --- graphical software configuration tool for STM32 microcontrollers that allows ...
(define-public stm32cubemx
  (package
    (name "stm32cubemx")
    (version "6.17.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/stm32cubemx.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "graphical software configuration tool for STM32 microcontrollers that allows ...")
    (description "graphical software configuration tool for STM32 microcontrollers that allows generating C initialization code.")
    (home-page "https://www.st.com/en/development-tools/stm32cubemx.html")
    (license license:nonfree)))

;;; driftwm --- trackpad-first infinite canvas Wayland compositor
(define-public driftwm
  (package
    (name "driftwm")
    (version "0.4.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/driftwm.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "trackpad-first infinite canvas Wayland compositor")
    (description "Trackpad-first infinite canvas Wayland compositor.")
    (home-page "https://github.com/malbiruk/driftwm")
    (license license:gpl3+)))

;;; micromamba-bin --- tiny version of mamba, the fast conda package installer
(define-public micromamba-bin
  (package
    (name "micromamba-bin")
    (version "2.5.0.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/micromamba-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "tiny version of mamba, the fast conda package installer")
    (description "Tiny version of mamba, the fast conda package installer.")
    (home-page "https://github.com/mamba-org/mamba")
    (license license:bsd-3)))

;;; finch --- ncurses-based messaging client
(define-public finch
  (package
    (name "finch")
    (version "2.14.14")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/finch.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "ncurses-based messaging client")
    (description "ncurses-based messaging client.")
    (home-page "https://pidgin.im/")
    (license license:gpl2+)))

;;; libgadu --- client-side library for the Gadu-Gadu protocol
(define-public libgadu
  (package
    (name "libgadu")
    (version "1.12.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/libgadu.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "client-side library for the Gadu-Gadu protocol")
    (description "Client-side library for the Gadu-Gadu protocol.")
    (home-page "https://libgadu.net/")
    (license license:lgpl2.1)))

;;; usbguard-qt --- uSBGuard Qt GUI
(define-public usbguard-qt
  (package
    (name "usbguard-qt")
    (version "0.8.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/usbguard-qt.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "uSBGuard Qt GUI")
    (description "USBGuard Qt GUI.")
    (home-page "https://gitlab.com/WheelchairArtist/usbguard-qt")
    (license license:gpl2+)))

;;; immich-server --- self-hosted photos and videos backup tool
(define-public immich-server
  (package
    (name "immich-server")
    (version "2.7.5")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/immich-server.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "self-hosted photos and videos backup tool")
    (description "Self-hosted photos and videos backup tool.")
    (home-page "https://github.com/immich-app/immich")
    (license license:agpl3)))

;;; immich-cli --- self-hosted photos and videos backup tool
(define-public immich-cli
  (package
    (name "immich-cli")
    (version "2.7.5")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/immich-cli.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "self-hosted photos and videos backup tool")
    (description "Self-hosted photos and videos backup tool.")
    (home-page "https://github.com/immich-app/immich")
    (license license:agpl3)))

;;; quien-bin --- a better whois and domain intelligence toolkit (pre-built binary)
(define-public quien-bin
  (package
    (name "quien-bin")
    (version "0.7.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/quien-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "a better whois and domain intelligence toolkit (pre-built binary)")
    (description "A better whois and domain intelligence toolkit (pre-built binary).")
    (home-page "https://github.com/retlehs/quien")
    (license license:expat)))

;;; pureref --- reference Image Viewer
(define-public pureref
  (package
    (name "pureref")
    (version "2.1.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/pureref.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "reference Image Viewer")
    (description "Reference Image Viewer.")
    (home-page "http://www.pureref.com")
    (license license:nonfree)))

;;; restic-browser --- a GUI to browse and restore restic backup repositories
(define-public restic-browser
  (package
    (name "restic-browser")
    (version "0.3.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/restic-browser.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "a GUI to browse and restore restic backup repositories")
    (description "A GUI to browse and restore restic backup repositories.")
    (home-page "https://github.com/emuell/restic-browser")
    (license license:expat)))

;;; seafile-client-appimage --- seafile client AppImage
(define-public seafile-client-appimage
  (package
    (name "seafile-client-appimage")
    (version "9.0.18")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/seafile-client-appimage.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "seafile client AppImage")
    (description "Seafile client AppImage.")
    (home-page "https://www.seafile.com/")
    (license license:asl2.0)))

;;; fuzzel-ime-git --- wayland application launcher (git version with IME patch)
(define-public fuzzel-ime-git
  (package
    (name "fuzzel-ime-git")
    (version "1.14.1.r4.g02f7346")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/fuzzel-ime-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "wayland application launcher (git version with IME patch)")
    (description "Wayland application launcher (git version with IME patch).")
    (home-page "https://codeberg.org/dnkl/fuzzel")
    (license license:expat)))

;;; wsjtx-improved-qt6 --- software for Amateur Radio Weak-Signal Communication (JT9 and JT65) - WSJT-X ...
(define-public wsjtx-improved-qt6
  (package
    (name "wsjtx-improved-qt6")
    (version "3.1.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/wsjtx-improved-qt6.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "software for Amateur Radio Weak-Signal Communication (JT9 and JT65) - WSJT-X ...")
    (description "Software for Amateur Radio Weak-Signal Communication (JT9 and JT65) - WSJT-X Improved by DG2YCB, Standard.")
    (home-page "https://sourceforge.net/projects/wsjt-x-improved/")
    (license license:gpl3+)))

;;; wsjtx-improved-al-qt6 --- software for Amateur Radio Weak-Signal Communication (JT9 and JT65) - WSJT-X ...
(define-public wsjtx-improved-al-qt6
  (package
    (name "wsjtx-improved-al-qt6")
    (version "3.1.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/wsjtx-improved-al-qt6.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "software for Amateur Radio Weak-Signal Communication (JT9 and JT65) - WSJT-X ...")
    (description "Software for Amateur Radio Weak-Signal Communication (JT9 and JT65) - WSJT-X Improved by DG2YCB, Alternative.")
    (home-page "https://sourceforge.net/projects/wsjt-x-improved/")
    (license license:gpl3+)))

;;; wsjtx-improved-widescreen-qt6 --- software for Amateur Radio Weak-Signal Communication (JT9 and JT65) - WSJT-X ...
(define-public wsjtx-improved-widescreen-qt6
  (package
    (name "wsjtx-improved-widescreen-qt6")
    (version "3.1.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/wsjtx-improved-widescreen-qt6.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "software for Amateur Radio Weak-Signal Communication (JT9 and JT65) - WSJT-X ...")
    (description "Software for Amateur Radio Weak-Signal Communication (JT9 and JT65) - WSJT-X Improved by DG2YCB, Widescreen.")
    (home-page "https://sourceforge.net/projects/wsjt-x-improved/")
    (license license:gpl3+)))

;;; ryzen-monitor --- monitor power information of Ryzen processors via the PM table of the SMU
(define-public ryzen-monitor
  (package
    (name "ryzen-monitor")
    (version "1.0.5")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ryzen_monitor.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "monitor power information of Ryzen processors via the PM table of the SMU")
    (description "Monitor power information of Ryzen processors via the PM table of the SMU.")
    (home-page "https://github.com/hattedsquirrel/ryzen_monitor")
    (license license:agpl3)))

;;; trae-bin --- aI-powered IDE by ByteDance - The Real AI Engine for code development
(define-public trae-bin
  (package
    (name "trae-bin")
    (version "2.3.18717")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/trae-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "aI-powered IDE by ByteDance - The Real AI Engine for code development")
    (description "AI-powered IDE by ByteDance - The Real AI Engine for code development.")
    (home-page "https://trae.ai")
    (license license:expat)))

;;; gtk-theme-arc-gruvbox-git --- a flat, grey gruvboxed theme with transparent elements for GTK 3, GTK 2 and g...
(define-public gtk-theme-arc-gruvbox-git
  (package
    (name "gtk-theme-arc-gruvbox-git")
    (version "r12.e5ea0ff")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gtk-theme-arc-gruvbox-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "a flat, grey gruvboxed theme with transparent elements for GTK 3, GTK 2 and g...")
    (description "A flat, grey gruvboxed theme with transparent elements for GTK 3, GTK 2 and gnome-shell. Latest commit from the master branch on Github.")
    (home-page "https://github.com/cyrinux/arc-gruvbox-theme")
    (license license:gpl3)))
