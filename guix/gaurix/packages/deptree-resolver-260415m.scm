;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency tree resolver pass --- deptree-resolver-260415m
;;; Resolves BLOCKED packages from dependency tree queue.
;;;
;;; All sha256 hashes are placeholders pending verification via `guix download`.

(define-module (gaurix packages deptree-resolver-260415m)
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
  #:export (            ttf-ms-win10-auto
            jre22-openjdk
            ungoogled-chromium-widevine-bin
            jre22-openjdk-headless
            plasma-desktop-povd
            nvidia-beta
            v4l2loopback-dc-dkms
            python-dlib-cuda
            linux-cachyos-cjktty
            linux-cachyos
            waybar-cava
            okular-no-purpose
            reboot-arch-btw
            oxidizr-arch
            portage-manifest
            reflector-simple
            tmpsuse
            ttf-ms-win10-auto-japanese
            ttf-ms-win10-auto-korean
            ttf-ms-win10-auto-other
            ttf-ms-win10-auto-sea
            ttf-ms-win10-auto-thai
            ttf-ms-win10-auto-zh-cn
            ttf-ms-win10-auto-zh-tw
            untmp
            xmcl-launcher
            android-armv7a-eabi-qt6-multimedia
            android-armv7a-eabi-qt6-positioning
            ledger-live
            lib32-libbluray
            masterpdfeditor
            momw-tools-pack
            naps2
            nbtopy
            openastro-org
            openmohaa
            openmohaa-git
            pacman-gui
            pdf-tocgen
            pida-hg
            python-pyebsdindex
            reminduck
            rompr
            rtt-rstudio-technician
            slack-desktop-wayland
            sleep-inhibitor
            snack
            tqsl
            uptater
            ut2004-bin
            xampp
            xenia-canary-bin
            arch-smart-update
            aylurs-gtk-shell
            beyondallreason-appimage
            bitwarden-bin
            canon-pixma-mg3000-complete
            clash-verge-rev
            cnmplayer
            eprosima-fast-dds-monitor
            famistudio
            genymotion
            haguichi
            haskell-unix
            helion
            insync
            jupyterlab-myst
            kanidm
            keyleds
            kio-s3
            longbridge-bin
            mopidy-local
            neard
            notesnook
            onlinefix-linux-launcher-bin
            openwork
            pardf
            passwordsafe
            pdfcmd
            photoprism
            picplanner
            plasma-x11-session-povd
            plasma6-applets-wunderground
            psysonic-bin
            python-foobeef
            python-langchain-openai
            pz-mod-manager
            questionary-cli
            rg-sens
            ryujinx
            ryujinx-canary
            sage-numerical-backends-gurobi
            sane-break
            sdrsharp
            skyscraper-simulator
            steam-rom-manager-bin
            texturepacker
            tmplayer
            tuistory
            unrealtournament))

(define-public ttf-ms-win10-auto
  (package
    (name "ttf-ms-win10-auto")
    (version "10.0.19042.789")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ttf-ms-win10-auto.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "/share/fonts/truetype/" #:include-regexp ("\\.ttf$" "\\.otf$")))))
    (synopsis "microsoft Windows 10 TrueType fonts")
    (description "Microsoft Windows 10 TrueType fonts.")
    (home-page "http://www.microsoft.com/typography/fonts/product.aspx?PID=164")
    (license license:non-copyleft)))

(define-public jre22-openjdk
  (package
    (name "jre22-openjdk")
    (version "22.0.2.u9")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/jre22-openjdk.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "openJDK Java 22 full runtime environment")
    (description "OpenJDK Java 22 full runtime environment.")
    (home-page "https://openjdk.java.net/")
    (license license:non-copyleft)))

(define-public ungoogled-chromium-widevine-bin
  (package
    (name "ungoogled-chromium-widevine-bin")
    (version "147.0.7727.55")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/ungoogled-software/ungoogled-chromium/releases/download/v147.0.7727.55/ungoogled-chromium-widevine-bin")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "/opt/" #:exclude-regexp ("\\.(git|md)$")))))
    (synopsis "A lightweight approach to removing Google web service dependency (with Wi")
    (description "A lightweight approach to removing Google web service dependency (with Widevine).")
    (home-page "https://github.com/ungoogled-software/ungoogled-chromium")
    (license license:bsd-3)))

(define-public jre22-openjdk-headless
  (package
    (name "jre22-openjdk-headless")
    (version "22.0.2.u9")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/jre22-openjdk-headless.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "openJDK Java 22 headless runtime environment")
    (description "OpenJDK Java 22 headless runtime environment.")
    (home-page "https://openjdk.java.net/")
    (license license:non-copyleft)))

(define-public plasma-desktop-povd
  (package
    (name "plasma-desktop-povd")
    (version "6.6.4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/plasma-desktop-povd.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "KDE Plasma Desktop (patched for per-output virtual desktops)")
    (description "KDE Plasma Desktop (patched for per-output virtual desktops).")
    (home-page "https://kde.org/plasma-desktop/")
    (license license:non-copyleft)))

(define-public nvidia-beta
  (package
    (name "nvidia-beta")
    (version "595.58.03")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/nvidia-beta.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "NVIDIA kernel module (beta version)")
    (description "NVIDIA kernel module (beta version).")
    (home-page "https://www.nvidia.com/")
    (license license:non-copyleft)))

(define-public v4l2loopback-dc-dkms
  (package
    (name "v4l2loopback-dc-dkms")
    (version "1:2.1.5")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/dev47apps/droidcam-linux-client")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "v4l2-loopback kernel module - DroidCam version")
    (description "V4l2-loopback kernel module - DroidCam version.")
    (home-page "https://github.com/dev47apps/droidcam-linux-client")
    (license license:gpl2+)))

(define-public python-dlib-cuda
  (package
    (name "python-dlib-cuda")
    (version "20.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-dlib-cuda.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "dlib is a general purpose cross-platform C++ library designed using contr")
    (description "Dlib is a general purpose cross-platform C++ library designed using contract programming and modern C++ techniques.")
    (home-page "http://www.dlib.net/")
    (license license:boost1.0)))

(define-public linux-cachyos-cjktty
  (package
    (name "linux-cachyos-cjktty")
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
    (synopsis "The CachyOS Linux kernel with cjktty patches kernel and modules")
    (description "The CachyOS Linux kernel with cjktty patches kernel and modules.")
    (home-page "https://github.com/CachyOS/linux-cachyos")
    (license license:gpl2)))

(define-public linux-cachyos
  (package
    (name "linux-cachyos")
    (version "7.0.0")
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
    (synopsis "The Linux EEVDF + LTO + AutoFDO + Propeller Cachy Sauce Kernel by CachyOS")
    (description "The Linux EEVDF + LTO + AutoFDO + Propeller Cachy Sauce Kernel by CachyOS with other patches and improvements. kernel and modules.")
    (home-page "https://github.com/CachyOS/linux-cachyos")
    (license license:gpl2)))

(define-public waybar-cava
  (package
    (name "waybar-cava")
    (version "0.15.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Alexays/Waybar")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "highly customizable Wayland bar for Sway and Wlroots based compositors, w")
    (description "Highly customizable Wayland bar for Sway and Wlroots based compositors, with module cava (Cross-platform Audio Visualizer).")
    (home-page "https://github.com/Alexays/Waybar/")
    (license license:expat)))

(define-public okular-no-purpose
  (package
    (name "okular-no-purpose")
    (version "25.12.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/okular-no-purpose.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "okular, a document viewer, without the dependency on purpose. This disabl")
    (description "Okular, a document viewer, without the dependency on purpose. This disables the share menu.")
    (home-page "https://apps.kde.org/okular/")
    (license (list license:gpl2+ license:non-copyleft))))

(define-public reboot-arch-btw
  (package
    (name "reboot-arch-btw")
    (version "1.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/rnestler/reboot-arch-btw")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "check if you need to reboot due to an updated kernel")
    (description "Check if you need to reboot due to an updated kernel.")
    (home-page "https://github.com/rnestler/reboot-arch-btw")
    (license license:gpl3)))

(define-public oxidizr-arch
  (package
    (name "oxidizr-arch")
    (version "0.1.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/veighnsche/oxidizr-arch")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "arch CLI to safely switch coreutils/findutils/sudo to Rust replacements v")
    (description "Arch CLI to safely switch coreutils/findutils/sudo to Rust replacements via Switchyard (dry-run by default).")
    (home-page "https://github.com/veighnsche/oxidizr-arch")
    (license (list license:asl2.0 license:expat))))

(define-public portage-manifest
  (package
    (name "portage-manifest")
    (version "1.0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Pol-Jak-295/portage-manifest")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A unified package browser for Arch Linux - search official repos, AUR, an")
    (description "A unified package browser for Arch Linux - search official repos, AUR, and Flatpak with beautiful README rendering.")
    (home-page "https://github.com/Pol-Jak-295/portage-manifest")
    (license license:non-copyleft)))

(define-public reflector-simple
  (package
    (name "reflector-simple")
    (version "3.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/endeavouros-team/PKGBUILDS")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "simple GUI wrapper for 'reflector'")
    (description "Simple GUI wrapper for 'reflector'.")
    (home-page "https://github.com/endeavouros-team/PKGBUILDS/tree/master/reflector-simple")
    (license license:gpl3+)))

(define-public tmpsuse
  (package
    (name "tmpsuse")
    (version "1.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/TheOddCell/tmpsuse")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "part of the tmplinux suite. Temporary OpenSUSE")
    (description "Part of the tmplinux suite. Temporary OpenSUSE.")
    (home-page "https://github.com/TheOddCell/tmpsuse")
    (license license:expat)))

(define-public ttf-ms-win10-auto-japanese
  (package
    (name "ttf-ms-win10-auto-japanese")
    (version "10.0.19042.789")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ttf-ms-win10-auto-japanese.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "/share/fonts/truetype/" #:include-regexp ("\\.ttf$" "\\.otf$")))))
    (synopsis "microsoft Windows 10 Japanese TrueType fonts")
    (description "Microsoft Windows 10 Japanese TrueType fonts.")
    (home-page "http://www.microsoft.com/typography/fonts/product.aspx?PID=164")
    (license license:non-copyleft)))

(define-public ttf-ms-win10-auto-korean
  (package
    (name "ttf-ms-win10-auto-korean")
    (version "10.0.19042.789")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ttf-ms-win10-auto-korean.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "/share/fonts/truetype/" #:include-regexp ("\\.ttf$" "\\.otf$")))))
    (synopsis "microsoft Windows 10 Korean TrueType fonts")
    (description "Microsoft Windows 10 Korean TrueType fonts.")
    (home-page "http://www.microsoft.com/typography/fonts/product.aspx?PID=164")
    (license license:non-copyleft)))

(define-public ttf-ms-win10-auto-other
  (package
    (name "ttf-ms-win10-auto-other")
    (version "10.0.19042.789")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ttf-ms-win10-auto-other.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "/share/fonts/truetype/" #:include-regexp ("\\.ttf$" "\\.otf$")))))
    (synopsis "microsoft Windows 10 Other TrueType fonts")
    (description "Microsoft Windows 10 Other TrueType fonts.")
    (home-page "http://www.microsoft.com/typography/fonts/product.aspx?PID=164")
    (license license:non-copyleft)))

(define-public ttf-ms-win10-auto-sea
  (package
    (name "ttf-ms-win10-auto-sea")
    (version "10.0.19042.789")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ttf-ms-win10-auto-sea.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "/share/fonts/truetype/" #:include-regexp ("\\.ttf$" "\\.otf$")))))
    (synopsis "microsoft Windows 10 Southeast Asian TrueType fonts")
    (description "Microsoft Windows 10 Southeast Asian TrueType fonts.")
    (home-page "http://www.microsoft.com/typography/fonts/product.aspx?PID=164")
    (license license:non-copyleft)))

(define-public ttf-ms-win10-auto-thai
  (package
    (name "ttf-ms-win10-auto-thai")
    (version "10.0.19042.789")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ttf-ms-win10-auto-thai.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "/share/fonts/truetype/" #:include-regexp ("\\.ttf$" "\\.otf$")))))
    (synopsis "microsoft Windows 10 Thai TrueType fonts")
    (description "Microsoft Windows 10 Thai TrueType fonts.")
    (home-page "http://www.microsoft.com/typography/fonts/product.aspx?PID=164")
    (license license:non-copyleft)))

(define-public ttf-ms-win10-auto-zh-cn
  (package
    (name "ttf-ms-win10-auto-zh_cn")
    (version "10.0.19042.789")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ttf-ms-win10-auto-zh_cn.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "/share/fonts/truetype/" #:include-regexp ("\\.ttf$" "\\.otf$")))))
    (synopsis "microsoft Windows 10 Simplified Chinese TrueType fonts")
    (description "Microsoft Windows 10 Simplified Chinese TrueType fonts.")
    (home-page "http://www.microsoft.com/typography/fonts/product.aspx?PID=164")
    (license license:non-copyleft)))

(define-public ttf-ms-win10-auto-zh-tw
  (package
    (name "ttf-ms-win10-auto-zh_tw")
    (version "10.0.19042.789")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ttf-ms-win10-auto-zh_tw.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "/share/fonts/truetype/" #:include-regexp ("\\.ttf$" "\\.otf$")))))
    (synopsis "microsoft Windows 10 Traditional Chinese TrueType fonts")
    (description "Microsoft Windows 10 Traditional Chinese TrueType fonts.")
    (home-page "http://www.microsoft.com/typography/fonts/product.aspx?PID=164")
    (license license:non-copyleft)))

(define-public untmp
  (package
    (name "untmp")
    (version "1.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/TheOddCell/untmp")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "take an tmplinux container and make it no longer temporary")
    (description "Take an tmplinux container and make it no longer temporary.")
    (home-page "https://github.com/TheOddCell/untmp")
    (license license:expat)))

(define-public xmcl-launcher
  (package
    (name "xmcl-launcher")
    (version "0.54.4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/xmcl-launcher.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "X Minecraft Launcher - A modern, open-source Minecraft Launcher with modp")
    (description "X Minecraft Launcher - A modern, open-source Minecraft Launcher with modpack, resource, and instance management.")
    (home-page "https://xmcl.app/")
    (license license:expat)))

(define-public android-armv7a-eabi-qt6-multimedia
  (package
    (name "android-armv7a-eabi-qt6-multimedia")
    (version "6.11.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/android-armv7a-eabi-qt6-multimedia.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "classes for audio, video, radio and camera functionality (android)")
    (description "Classes for audio, video, radio and camera functionality (android).")
    (home-page "https://www.qt.io")
    (license (list license:gpl3 license:non-copyleft))))

(define-public android-armv7a-eabi-qt6-positioning
  (package
    (name "android-armv7a-eabi-qt6-positioning")
    (version "6.11.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/android-armv7a-eabi-qt6-positioning.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "provides access to position, satellite and area monitoring classes (android)")
    (description "Provides access to position, satellite and area monitoring classes (android).")
    (home-page "https://www.qt.io")
    (license (list license:gpl3 license:non-copyleft))))

(define-public ledger-live
  (package
    (name "ledger-live")
    (version "4.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ledger-live.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "maintain your Ledger devices")
    (description "Maintain your Ledger devices.")
    (home-page "https://www.ledger.com/ledger-live")
    (license license:expat)))

(define-public lib32-libbluray
  (package
    (name "lib32-libbluray")
    (version "1.4.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lib32-libbluray.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "library to access Blu-Ray disks for video playback (32-bit)")
    (description "Library to access Blu-Ray disks for video playback (32-bit).")
    (home-page "https://www.videolan.org/developers/libbluray.html")
    (license license:non-copyleft)))

(define-public masterpdfeditor
  (package
    (name "masterpdfeditor")
    (version "5.9.97")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/masterpdfeditor.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A complete solution for viewing, creating and editing PDF files")
    (description "A complete solution for viewing, creating and editing PDF files.")
    (home-page "https://code-industry.net/free-pdf-editor/")
    (license license:non-copyleft)))

(define-public momw-tools-pack
  (package
    (name "momw-tools-pack")
    (version "1.44")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://modding-openmw.gitlab.io/momw-tools-pack")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "metapackage with all the tools needed to automatically install and config")
    (description "Metapackage with all the tools needed to automatically install and configure Modding-OpenMW.com modlists.")
    (home-page "https://modding-openmw.gitlab.io/momw-tools-pack/")
    (license license:gpl3+)))

(define-public naps2
  (package
    (name "naps2")
    (version "8.2.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/naps2.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "NAPS2 - Not Another PDF Scanner. Scan documents to PDF and more, as simpl")
    (description "NAPS2 - Not Another PDF Scanner. Scan documents to PDF and more, as simply as possible.")
    (home-page "https://www.naps2.com")
    (license license:gpl2+)))

(define-public nbtopy
  (package
    (name "nbtopy")
    (version "1.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/bulletmark/nbtopy")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "converts Jupyter notebook files to Python files")
    (description "Converts Jupyter notebook files to Python files.")
    (home-page "https://github.com/bulletmark/nbtopy")
    (license license:gpl3+)))

(define-public openastro-org
  (package
    (name "openastro.org")
    (version "1.1.57")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/openastro.org.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "open source fully-featured astrology software")
    (description "Open source fully-featured astrology software.")
    (home-page "http://www.openastro.org/")
    (license license:gpl3+)))

(define-public openmohaa
  (package
    (name "openmohaa")
    (version "0.82.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/openmoh/openmohaa")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "open re-implementation of Medal of Honor: Allied Assault")
    (description "Open re-implementation of Medal of Honor: Allied Assault.")
    (home-page "https://github.com/openmoh/openmohaa")
    (license license:gpl2)))

(define-public openmohaa-git
  (package
    (name "openmohaa-git")
    (version "0.82.1.r33.555caa1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/openmoh/openmohaa")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "open re-implementation of Medal of Honor: Allied Assault")
    (description "Open re-implementation of Medal of Honor: Allied Assault.")
    (home-page "https://github.com/openmoh/openmohaa")
    (license license:gpl2)))

(define-public pacman-gui
  (package
    (name "pacman-gui")
    (version "1.3.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Coneriys/pacman-gui")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "simple GTK4 GUI for pacman package manager with AUR support")
    (description "Simple GTK4 GUI for pacman package manager with AUR support.")
    (home-page "https://github.com/Coneriys/pacman-gui")
    (license license:gpl3+)))

(define-public pdf-tocgen
  (package
    (name "pdf.tocgen")
    (version "1.3.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Krasjet/pdf.tocgen")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "automatically generate table of contents for PDF documents")
    (description "Automatically generate table of contents for PDF documents.")
    (home-page "https://github.com/Krasjet/pdf.tocgen")
    (license license:gpl3+)))

(define-public pida-hg
  (package
    (name "pida-hg")
    (version "2921.be90809a5d81")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/pida-hg.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "snapshot of the last repository of the Python Integrated Development Appl")
    (description "Snapshot of the last repository of the Python Integrated Development Application.")
    (home-page "http://pidsoff.appspot.com/pida")
    (license license:non-copyleft)))

(define-public python-pyebsdindex
  (package
    (name "python-pyebsdindex")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-pyebsdindex.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Python based tool for Radon based EBSD orientation indexing")
    (description "Python based tool for Radon based EBSD orientation indexing.")
    (home-page "https://pyebsdindex.readthedocs.io")
    (license license:non-copyleft)))

(define-public reminduck
  (package
    (name "reminduck")
    (version "2.3.1.5")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/elly-code/reminduck")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "simple reminder app with notifications, built with GTK4 and Granite")
    (description "Simple reminder app with notifications, built with GTK4 and Granite.")
    (home-page "https://github.com/elly-code/reminduck")
    (license license:gpl3+)))

(define-public rompr
  (package
    (name "rompr")
    (version "2.26")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/fatg3erman/RompR")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A php web frontend to MPD and Mopidy")
    (description "A php web frontend to MPD and Mopidy.")
    (home-page "https://github.com/fatg3erman/RompR/")
    (license license:non-copyleft)))

(define-public rtt-rstudio-technician
  (package
    (name "rtt-rstudio-technician")
    (version "5.5.191739")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/rtt-rstudio-technician.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "r-Studio Technician is a powerful cost-effective undelete and data recove")
    (description "R-Studio Technician is a powerful cost-effective undelete and data recovery software utility (non-free).")
    (home-page "https://www.r-studio.com/Data_Recovery_Technician.shtml")
    (license license:non-copyleft)))

(define-public slack-desktop-wayland
  (package
    (name "slack-desktop-wayland")
    (version "4.47.69")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/slack-desktop-wayland.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Slack Desktop (Beta) for Linux with Wayland Support")
    (description "Slack Desktop (Beta) for Linux with Wayland Support.")
    (home-page "https://slack.com/downloads")
    (license license:non-copyleft)))

(define-public sleep-inhibitor
  (package
    (name "sleep-inhibitor")
    (version "1.25")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/bulletmark/sleep-inhibitor")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "program to run plugins to inhibit system sleep/suspend")
    (description "Program to run plugins to inhibit system sleep/suspend.")
    (home-page "https://github.com/bulletmark/sleep-inhibitor")
    (license license:gpl3+)))

(define-public snack
  (package
    (name "snack")
    (version "2.2.10")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/snack.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a sound toolkit for scripting languages (Tcl, Python, Ruby, ...)")
    (description "A sound toolkit for scripting languages (Tcl, Python, Ruby, ...).")
    (home-page "http://www.speech.kth.se/snack/")
    (license license:gpl2+)))

(define-public tqsl
  (package
    (name "tqsl")
    (version "2.8.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/tqsl.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "ARRL LoTW Trusted QSL (TQSL) software")
    (description "ARRL LoTW Trusted QSL (TQSL) software.")
    (home-page "https://www.arrl.org/tqsl-download")
    (license license:non-copyleft)))

(define-public uptater
  (package
    (name "uptater")
    (version "1.0.1.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/gytdoo/uptater")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "clean, robust GUI for managing Arch Linux packages and AUR updates")
    (description "Clean, robust GUI for managing Arch Linux packages and AUR updates.")
    (home-page "https://github.com/gytdoo/uptater")
    (license license:gpl3+)))

(define-public ut2004-bin
  (package
    (name "ut2004-bin")
    (version "3374")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/OldUnreal/UT2004Patches/releases/download/v3374/ut2004-bin")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "/opt/" #:exclude-regexp ("\\.(git|md)$")))))
    (synopsis "unreal Tournament 2004 ECE native binaries (OldUnreal)")
    (description "Unreal Tournament 2004 ECE native binaries (OldUnreal).")
    (home-page "https://github.com/OldUnreal/UT2004Patches")
    (license license:non-copyleft)))

(define-public xampp
  (package
    (name "xampp")
    (version "8.2.12")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/xampp.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A stand-alone LAMPP distribution")
    (description "A stand-alone LAMPP distribution.")
    (home-page "https://www.apachefriends.org")
    (license license:gpl3+)))

(define-public xenia-canary-bin
  (package
    (name "xenia-canary-bin")
    (version "7650730")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/xenia-canary-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "/opt/" #:exclude-regexp ("\\.(git|md)$")))))
    (synopsis "xenia Canary is an experimental fork of the Xenia emulator")
    (description "Xenia Canary is an experimental fork of the Xenia emulator.")
    (home-page "https://github.com/xenia-canary")
    (license license:bsd-3)))

(define-public arch-smart-update
  (package
    (name "arch-smart-update")
    (version "3.5.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/motorrin/Arch_Smart_Update")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "not sure when to update Arch Linux or its derivative? This script will he")
    (description "Not sure when to update Arch Linux or its derivative? This script will help you decide!.")
    (home-page "https://github.com/motorrin/Arch_Smart_Update")
    (license license:expat)))

(define-public aylurs-gtk-shell
  (package
    (name "aylurs-gtk-shell")
    (version "3.1.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Aylur/ags")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments (list #:tests? #f))
    (synopsis "aylurs's Gtk Shell (AGS), An eww inspired gtk widget system")
    (description "Aylurs's Gtk Shell (AGS), An eww inspired gtk widget system.")
    (home-page "https://github.com/Aylur/ags")
    (license license:gpl3)))

(define-public beyondallreason-appimage
  (package
    (name "beyondallreason-appimage")
    (version "1.2988.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/beyondallreason-appimage.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "/opt/" #:exclude-regexp ("\\.(git|md)$")))))
    (synopsis "The latest release of BYAR-Chobby, the launcher for Beyond All Reason - A")
    (description "The latest release of BYAR-Chobby, the launcher for Beyond All Reason - An open source RTS game built on top of the Spring RTS Engine.")
    (home-page "https://www.beyondallreason.info")
    (license (list license:non-copyleft license:gpl3+))))

(define-public bitwarden-bin
  (package
    (name "bitwarden-bin")
    (version "2026.3.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/bitwarden-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "/opt/" #:exclude-regexp ("\\.(git|md)$")))))
    (synopsis "A secure and free password manager for all of your devices")
    (description "A secure and free password manager for all of your devices.")
    (home-page "https://bitwarden.com")
    (license license:gpl3)))

(define-public canon-pixma-mg3000-complete
  (package
    (name "canon-pixma-mg3000-complete")
    (version "5.40")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/canon-pixma-mg3000-complete.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "complete stand alone driver set (printing and scanning) for Canon Pixma M")
    (description "Complete stand alone driver set (printing and scanning) for Canon Pixma MG3000 series.")
    (home-page "https://www.canon-europe.com/support/consumer_products/products/fax__multifunctionals/inkjet/pixma_mg_series/pixma_mg3000.aspx")
    (license license:non-copyleft)))

(define-public clash-verge-rev
  (package
    (name "clash-verge-rev")
    (version "2.4.7")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/clash-verge-rev/clash-verge-rev")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "continuation of Clash Verge | A Clash Meta GUI based on Tauri")
    (description "Continuation of Clash Verge | A Clash Meta GUI based on Tauri.")
    (home-page "https://github.com/clash-verge-rev/clash-verge-rev")
    (license license:gpl3+)))

(define-public cnmplayer
  (package
    (name "cnmplayer")
    (version "0.3.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/professor-lee/CNMPlayer")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A terminal-based Netease cloud music player with spectrum visualizer, lyr")
    (description "A terminal-based Netease cloud music player with spectrum visualizer, lyrics support.")
    (home-page "https://github.com/professor-lee/CNMPlayer")
    (license license:agpl3+)))

(define-public eprosima-fast-dds-monitor
  (package
    (name "eprosima-fast-dds-monitor")
    (version "4.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/eProsima/Fast-DDS-monitor")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "eProsima Fast DDS Monitor is a graphical desktop application aimed at mon")
    (description "EProsima Fast DDS Monitor is a graphical desktop application aimed at monitoring DDS environments deployed using the eProsima Fast DDS library.")
    (home-page "https://github.com/eProsima/Fast-DDS-monitor")
    (license license:gpl3+)))

(define-public famistudio
  (package
    (name "famistudio")
    (version "4.5.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/famistudio.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A very simple music editor for the Nintendo Entertainment System or Famicom")
    (description "A very simple music editor for the Nintendo Entertainment System or Famicom.")
    (home-page "https://famistudio.org/")
    (license license:expat)))

(define-public genymotion
  (package
    (name "genymotion")
    (version "3.10.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/genymotion.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "complete set of tools that provides a virtual environment for Android")
    (description "Complete set of tools that provides a virtual environment for Android.")
    (home-page "http://www.genymotion.com/")
    (license license:non-copyleft)))

(define-public haguichi
  (package
    (name "haguichi")
    (version "1.5.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/haguichi.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "provides a user friendly GUI to control the Hamachi client on Linux")
    (description "Provides a user friendly GUI to control the Hamachi client on Linux.")
    (home-page "https://haguichi.net")
    (license license:gpl3+)))

(define-public haskell-unix
  (package
    (name "haskell-unix")
    (version "2.8.8.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/haskell/unix")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "POSIX functionality (backport)")
    (description "POSIX functionality (backport).")
    (home-page "https://github.com/haskell/unix")
    (license license:bsd-3)))

(define-public helion
  (package
    (name "helion")
    (version "0.9.9.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Helion-Engine/Helion")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A modern Doom FPS engine, made with C# and GPU usage in mind")
    (description "A modern Doom FPS engine, made with C# and GPU usage in mind.")
    (home-page "https://github.com/Helion-Engine/Helion")
    (license license:gpl3+)))

(define-public insync
  (package
    (name "insync")
    (version "3.9.8.60034")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/insync.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "An unofficial Dropbox, Google Drive, and OneDrive client that runs on Lin")
    (description "An unofficial Dropbox, Google Drive, and OneDrive client that runs on Linux, with support for various desktops.")
    (home-page "https://www.insynchq.com/downloads")
    (license license:non-copyleft)))

(define-public jupyterlab-myst
  (package
    (name "jupyterlab-myst")
    (version "2.4.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/executablebooks/jupyterlab-myst")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "use MyST in JupyterLab")
    (description "Use MyST in JupyterLab.")
    (home-page "https://github.com/executablebooks/jupyterlab-myst")
    (license license:bsd-3)))

(define-public kanidm
  (package
    (name "kanidm")
    (version "1.9.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/kanidm/kanidm")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A identity management service and clients")
    (description "A identity management service and clients.")
    (home-page "https://github.com/kanidm/kanidm")
    (license license:mpl2.0)))

(define-public keyleds
  (package
    (name "keyleds")
    (version "1.1.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/spectras/keyleds")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "advanced RGB LED animation driver for G213, G410, G513, G610, G810, G910 ")
    (description "Advanced RGB LED animation driver for G213, G410, G513, G610, G810, G910 and GPro.")
    (home-page "https://github.com/spectras/keyleds")
    (license license:gpl3+)))

(define-public kio-s3
  (package
    (name "kio-s3")
    (version "1.0.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/kio-s3.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "KIO worker for Amazon S3 and compatible storage")
    (description "KIO worker for Amazon S3 and compatible storage.")
    (home-page "https://invent.kde.org/network/kio-s3")
    (license (list license:bsd-3 license:cc0 license:gpl2+))))

(define-public longbridge-bin
  (package
    (name "longbridge-bin")
    (version "0.12.5")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/longbridge-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "/opt/" #:exclude-regexp ("\\.(git|md)$")))))
    (synopsis "longbridge Desktop trading platform")
    (description "Longbridge Desktop trading platform.")
    (home-page "https://longbridge.com/desktop/")
    (license license:non-copyleft)))

(define-public mopidy-local
  (package
    (name "mopidy-local")
    (version "4.0.0a1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/mopidy/mopidy-local")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "mopidy extension for local media playback")
    (description "Mopidy extension for local media playback.")
    (home-page "https://github.com/mopidy/mopidy-local")
    (license license:asl2.0)))

(define-public neard
  (package
    (name "neard")
    (version "0.19")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/linux-nfc/neard")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "intel's Near Field Communication manager")
    (description "Intel's Near Field Communication manager.")
    (home-page "https://github.com/linux-nfc/neard")
    (license license:gpl2)))

(define-public notesnook
  (package
    (name "notesnook")
    (version "3.3.13")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/notesnook.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A fully open source & end-to-end encrypted note taking alternative to Eve")
    (description "A fully open source & end-to-end encrypted note taking alternative to Evernote.(Use system-wide electron).")
    (home-page "https://notesnook.com/")
    (license license:gpl3+)))

(define-public onlinefix-linux-launcher-bin
  (package
    (name "onlinefix-linux-launcher-bin")
    (version "2.6")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/ZzEdovec/onlinefix-linux/releases/download/v2.6/onlinefix-linux-launcher-bin")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "/opt/" #:exclude-regexp ("\\.(git|md)$")))))
    (synopsis "onlineFix Linux Launcher - play games with community multiplayer fixes on")
    (description "OnlineFix Linux Launcher - play games with community multiplayer fixes on Linux!.")
    (home-page "https://github.com/ZzEdovec/onlinefix-linux")
    (license license:agpl3+)))

(define-public openwork
  (package
    (name "openwork")
    (version "0.11.207")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/different-ai/openwork")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "An Open source alternative to Claude Cowork")
    (description "An Open source alternative to Claude Cowork.")
    (home-page "https://github.com/different-ai/openwork")
    (license license:expat)))

(define-public pardf
  (package
    (name "pardf")
    (version "1.8.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/word-sys/pardf")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "word-Sys's PDF Editor")
    (description "Word-Sys's PDF Editor.")
    (home-page "https://github.com/word-sys/pardf")
    (license license:gpl3+)))

(define-public passwordsafe
  (package
    (name "passwordsafe")
    (version "1.23.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/passwordsafe.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "simple & Secure Password Management")
    (description "Simple & Secure Password Management.")
    (home-page "https://pwsafe.org/")
    (license license:non-copyleft)))

(define-public pdfcmd
  (package
    (name "pdfcmd")
    (version "1.13")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/bulletmark/pdfcmd")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "utility to perform commands on PDF files")
    (description "Utility to perform commands on PDF files.")
    (home-page "https://github.com/bulletmark/pdfcmd")
    (license license:gpl3+)))

(define-public photoprism
  (package
    (name "photoprism")
    (version "260305")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/photoprism/photoprism")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments (list #:tests? #f))
    (synopsis "aI-Powered Photos App for the Decentralized Web")
    (description "AI-Powered Photos App for the Decentralized Web.")
    (home-page "https://github.com/photoprism/photoprism")
    (license license:agpl3+)))

(define-public picplanner
  (package
    (name "picplanner")
    (version "0.5.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.com/Zwarf/picplanner")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "plan your next photo locations")
    (description "Plan your next photo locations.")
    (home-page "https://gitlab.com/Zwarf/picplanner")
    (license license:gpl3+)))

(define-public plasma-x11-session-povd
  (package
    (name "plasma-x11-session-povd")
    (version "6.6.4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/plasma-x11-session-povd.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "plasma X11 session")
    (description "Plasma X11 session.")
    (home-page "https://kde.org/plasma-desktop/")
    (license license:non-copyleft)))

(define-public plasma6-applets-wunderground
  (package
    (name "plasma6-applets-wunderground")
    (version "3.6.5")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/plasma6-applets-wunderground.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "plasmoid for displaying weather information from Wunderground decentraliz")
    (description "Plasmoid for displaying weather information from Wunderground decentralized stations.")
    (home-page "https://aur.archlinux.org/packages/plasma6-applets-wunderground")
    (license license:gpl2+)))

(define-public psysonic-bin
  (package
    (name "psysonic-bin")
    (version "1.34.10")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/Psychotoxical/psysonic/releases/download/v1.34.10/psysonic-bin")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "/opt/" #:exclude-regexp ("\\.(git|md)$")))))
    (synopsis "desktop music player for Subsonic API-compatible servers (pre-built binary)")
    (description "Desktop music player for Subsonic API-compatible servers (pre-built binary).")
    (home-page "https://github.com/Psychotoxical/psysonic")
    (license license:gpl3)))

(define-public python-foobeef
  (package
    (name "python-foobeef")
    (version "0.9.0.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Ada-Kru/pyfoobeef")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "control Beefweb clients such as Foobar2000 and DeaDBeeF")
    (description "Control Beefweb clients such as Foobar2000 and DeaDBeeF.")
    (home-page "https://github.com/Ada-Kru/pyfoobeef")
    (license license:expat)))

(define-public python-langchain-openai
  (package
    (name "python-langchain-openai")
    (version "1.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/langchain-ai/langchain")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "An integration package connecting OpenAI and LangChain")
    (description "An integration package connecting OpenAI and LangChain.")
    (home-page "https://github.com/langchain-ai/langchain/tree/master/libs/partners/openai")
    (license license:expat)))

(define-public pz-mod-manager
  (package
    (name "pz-mod-manager")
    (version "0.3.1.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/skint007/project-zomboid-modid")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "desktop application for managing Project Zomboid server mod lists")
    (description "Desktop application for managing Project Zomboid server mod lists.")
    (home-page "https://github.com/skint007/project-zomboid-modid")
    (license license:expat)))

(define-public questionary-cli
  (package
    (name "questionary-cli")
    (version "0.1.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/makukha/questionary-cli")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "command line tool for questionary")
    (description "Command line tool for questionary.")
    (home-page "https://github.com/makukha/questionary-cli")
    (license license:expat)))

(define-public rg-sens
  (package
    (name "rg-sens")
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
    (synopsis "A fast, customizable system monitoring dashboard for Linux")
    (description "A fast, customizable system monitoring dashboard for Linux.")
    (home-page "https://github.com/hilgardt-collab/rg-Sens")
    (license (list license:asl2.0 license:expat))))

(define-public ryujinx
  (package
    (name "ryujinx")
    (version "1.3.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ryujinx.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "experimental Nintendo Switch Emulator written in C#")
    (description "Experimental Nintendo Switch Emulator written in C#.")
    (home-page "https://git.ryujinx.app/ryubing/ryujinx")
    (license license:expat)))

(define-public ryujinx-canary
  (package
    (name "ryujinx-canary")
    (version "1.3.269")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ryujinx-canary.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "experimental Nintendo Switch Emulator written in C#")
    (description "Experimental Nintendo Switch Emulator written in C#.")
    (home-page "https://git.ryujinx.app/projects/Ryubing")
    (license license:expat)))

(define-public sage-numerical-backends-gurobi
  (package
    (name "sage-numerical-backends-gurobi")
    (version "10.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/mkoeppe/sage-numerical-backends-gurobi")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "gurobi mixed integer linear programming backend for SageMath")
    (description "Gurobi mixed integer linear programming backend for SageMath.")
    (home-page "https://github.com/mkoeppe/sage-numerical-backends-gurobi")
    (license license:gpl2+)))

(define-public sane-break
  (package
    (name "sane-break")
    (version "0.10.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/AllanChain/sane-break")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A gentle break reminder that helps you avoid mindlessly skipping breaks")
    (description "A gentle break reminder that helps you avoid mindlessly skipping breaks.")
    (home-page "https://github.com/AllanChain/sane-break")
    (license license:gpl3+)))

(define-public sdrsharp
  (package
    (name "sdrsharp")
    (version "1.0.0.1457")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/sdrsharp.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "The most popular SDR program")
    (description "The most popular SDR program.")
    (home-page "https://airspy.com")
    (license license:non-copyleft)))

(define-public skyscraper-simulator
  (package
    (name "skyscraper-simulator")
    (version "2.0.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/skyscraper-simulator.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "3D skyscraper and elevator simulator (SourceForge build with OpenEXR 3.1 ")
    (description "3D skyscraper and elevator simulator (SourceForge build with OpenEXR 3.1 compat).")
    (home-page "http://www.skyscrapersim.com/")
    (license license:gpl3+)))

(define-public steam-rom-manager-bin
  (package
    (name "steam-rom-manager-bin")
    (version "2.5.34")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/SteamGridDB/steam-rom-manager/releases/download/v2.5.34/steam-rom-manager-bin")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "/opt/" #:exclude-regexp ("\\.(git|md)$")))))
    (synopsis "An app for managing ROMs in Steam (extracted from Debian package)")
    (description "An app for managing ROMs in Steam (extracted from Debian package).")
    (home-page "https://github.com/SteamGridDB/steam-rom-manager")
    (license license:gpl3+)))

(define-public texturepacker
  (package
    (name "texturepacker")
    (version "7.12.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/texturepacker.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "sprite sheet creator and image optimizer")
    (description "Sprite sheet creator and image optimizer.")
    (home-page "https://www.codeandweb.com/texturepacker")
    (license license:non-copyleft)))

(define-public tmplayer
  (package
    (name "tmplayer")
    (version "0.2.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/professor-lee/TMPlayer.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A terminal-based music player with spectrum visualizer, lyrics support, a")
    (description "A terminal-based music player with spectrum visualizer, lyrics support, and MPRIS integration.")
    (home-page "https://github.com/professor-lee/TMPlayer.git")
    (license license:agpl3+)))

(define-public tuistory
  (package
    (name "tuistory")
    (version "0.0.16")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/remorses/tuistory")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (synopsis "playwright for terminal user interfaces")
    (description "Playwright for terminal user interfaces.")
    (home-page "https://github.com/remorses/tuistory")
    (license license:expat)))

(define-public unrealtournament
  (package
    (name "unrealtournament")
    (version "469e")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/unrealtournament.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "The classic Unreal Tournament from 1999 (GOTY + OldUnreal patches)")
    (description "The classic Unreal Tournament from 1999 (GOTY + OldUnreal patches).")
    (home-page "http://www.unrealtournament.com/")
    (license license:non-copyleft)))
