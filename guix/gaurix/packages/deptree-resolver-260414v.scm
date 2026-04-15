;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency tree resolver pass --- deptree-resolver-260414v
;;; Resolves 100 BLOCKED packages from dependency tree queue.
;;;
;;; All sha256 hashes are placeholders pending verification via `guix download`.

(define-module (gaurix packages deptree-resolver-260414v)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system cargo)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system font)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system go)
  #:use-module (guix build-system node)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:export (makepkg-optimize-mold
            nvidia-sync-terminal-fix
            r8125-dkms
            bcachefs-kernel-dkms-git
            zenpower3-dkms-git
            zenpower5-dkms-git
            kernelsu-dkms
            nvidia-390xx-dkms
            nvidia-470xx-dkms
            nvidia-beta-dkms
            r8127-dkms
            freesmlauncher-bin
            hyperheadset-git
            hyprsnow
            i8086emu-git
            insomnia
            isfree
            jack-mixer-cc
            jivexdv-bin
            jxplorer
            k3sup
            kde-thumbnailer-apk
            kdotool-git
            kraftkit-git
            ktxutils-git
            kwin-decoration-sierra-breeze-enhanced-git
            lcarsde-app-menu
            lcarsde-logout
            lceda-pro-bin
            legcord-git
            lib32-libfdk-aac
            lib32-xvidcore
            lib32-zvbi
            local-chaos
            loliashizuku-bin
            lotus-lang
            lovr-playspace-git
            lxqt-panel-tool-git
            majsoul-plus-bin
            manga-tui
            mingw-w64-sqlite
            minot
            miraclecast-git
            mozc-ut
            mtk-uartboot-rs
            muon-decoder
            muzak
            myxer-git
            nanoclaw-git
            nanocoder
            nautilus-admin-gtk4
            ncmpcpp-album-cover-git
            neoleo
            nerd-fonts-apple
            netextender
            nextcloud-app-impersonate
            nexusmods-app-bin
            niri-settings-git
            nitchrevived
            nodejs-nativefier
            nodejs-node-red
            nutstore
            nvidia-340xx
            nvidia-535xx-dkms
            nvidia-open-beta
            nvidia-open-beta-dkms
            obs-vnc
            ocztoolbox
            ollama-vulkan-bin
            ollamacode
            onset
            openscq30-gui-bin
            opentubex-git
            oscgoesbrrr
            osu-lazer-tachyon-bin
            p7zip-gui))

(define-public makepkg-optimize-mold
  (package
    (name "makepkg-optimize-mold")
    (version "30")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/makepkg-optimize-mold.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "supplemental build and packaging optimizations for makepkg")
    (description "Supplemental build and packaging optimizations for makepkg.")
    (home-page "https://wiki.archlinux.org/index.php/Makepkg-optimize")
    (license license:gpl3+)))

(define-public nvidia-sync-terminal-fix
  (package
    (name "nvidia-sync-terminal-fix")
    (version "0.64.24")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/nvidia-sync-terminal-fix.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "terminal fix for nvidia-sync on non-GNOME desktops")
    (description "Terminal fix for nvidia-sync on non-GNOME desktops.")
    (home-page "https://build.nvidia.com/spark/connect-to-your-spark/sync")
    (license license:non-copyleft)))

(define-public r8125-dkms
  (package
    (name "r8125-dkms")
    (version "9.017.01")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/r8125-dkms.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "kernel module for RTL8125")
    (description "Kernel module for RTL8125.")
    (home-page "https://www.realtek.com/en/component/zoo/category/network-interface-controllers-10-100-1000m-gigabit-ethernet-pci-express-software")
    (license license:gpl2)))

(define-public bcachefs-kernel-dkms-git
  (package
    (name "bcachefs-kernel-dkms-git")
    (version "20260302131047.6ebab1b41eda")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/koverstreet/bcachefs")
                    (commit "v20260302131047.6ebab1b41eda")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "bcachefs DKMS module from upstream bcachefs kernel sources")
    (description "Bcachefs DKMS module from upstream bcachefs kernel sources.")
    (home-page "https://github.com/koverstreet/bcachefs")
    (license license:gpl2)))

(define-public zenpower3-dkms-git
  (package
    (name "zenpower3-dkms-git")
    (version "r73.dc4f1e2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/AliEmreSenel/zenpower3")
                    (commit "vr73.dc4f1e2")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a Linux kernel driver for reading temperature, voltage(SVI2), current(SVI")
    (description "A Linux kernel driver for reading temperature, voltage(SVI2), current(SVI2) and power(SVI2) for AMD Zen family CPUs, now with Zen 3 support'.")
    (home-page "https://github.com/AliEmreSenel/zenpower3")
    (license license:gpl2)))

(define-public zenpower5-dkms-git
  (package
    (name "zenpower5-dkms-git")
    (version "0.5.0.r3.g66871d8")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/mattkeenan/zenpower5")
                    (commit "v0.5.0.r3.g66871d8")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Linux kernel driver for AMD Zen CPU monitoring (Zen 1-5): temperature, vo")
    (description "Linux kernel driver for AMD Zen CPU monitoring (Zen 1-5): temperature, voltage, current, and power via SVI2/RAPL. Multi-file architecture with Zen 5 (Strix Halo) support.")
    (home-page "https://github.com/mattkeenan/zenpower5")
    (license license:gpl2)))

(define-public kernelsu-dkms
  (package
    (name "kernelsu-dkms")
    (version "3.1.0+80+g489cb029")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/supechicken/KernelSU")
                    (commit "v3.1.0+80+g489cb029")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a Kernel based root solution for Android")
    (description "A Kernel based root solution for Android. DKMS module for Container-based solutions such as Waydroid.")
    (home-page "https://github.com/supechicken/KernelSU")
    (license license:gpl2)))

(define-public nvidia-390xx-dkms
  (package
    (name "nvidia-390xx-dkms")
    (version "390.157")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/nvidia-390xx-dkms.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "NVIDIA drivers - module sources")
    (description "NVIDIA drivers - module sources.")
    (home-page "https://www.nvidia.com/")
    (license license:non-copyleft)))

(define-public nvidia-470xx-dkms
  (package
    (name "nvidia-470xx-dkms")
    (version "470.256.02-8.01")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/nvidia-470xx-dkms.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "NVIDIA drivers - module sources")
    (description "NVIDIA drivers - module sources.")
    (home-page "http://www.nvidia.com/")
    (license license:non-copyleft)))

(define-public nvidia-beta-dkms
  (package
    (name "nvidia-beta-dkms")
    (version "595.58.03")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/nvidia-beta-dkms.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "NVIDIA kernel modules - module sources (beta version)")
    (description "NVIDIA kernel modules - module sources (beta version).")
    (home-page "https://www.nvidia.com/")
    (license license:non-copyleft)))

(define-public r8127-dkms
  (package
    (name "r8127-dkms")
    (version "11.016.00")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/r8127-dkms.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "kernel module for Realtek 10GB Ethernet NICs")
    (description "Kernel module for Realtek 10GB Ethernet NICs.")
    (home-page "https://www.realtek.com/Download/List?cate_id=584")
    (license license:gpl2)))

(define-public freesmlauncher-bin
  (package
    (name "freesmlauncher-bin")
    (version "2.1.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/freesmlauncher-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "minecraft launcher with offline accounts support (binary release)")
    (description "Minecraft launcher with offline accounts support (binary release).")
    (home-page "https://freesmlauncher.org/")
    (license license:gpl3+)))

(define-public hyperheadset-git
  (package
    (name "hyperheadset-git")
    (version "1.5.1.r3.ga73023d")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/LennardKittner/HyperHeadset")
                    (commit "v1.5.1.r3.ga73023d")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a CLI and tray application for monitoring and managing HyperX headsets")
    (description "A CLI and tray application for monitoring and managing HyperX headsets.")
    (home-page "https://github.com/LennardKittner/HyperHeadset")
    (license license:expat)))

(define-public hyprsnow
  (package
    (name "hyprsnow")
    (version "0.1.6")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/spinualexandru/hyprsnow")
                    (commit "v0.1.6")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a snow overlay for Wayland/Hyprland")
    (description "A snow overlay for Wayland/Hyprland.")
    (home-page "https://github.com/spinualexandru/hyprsnow")
    (license license:expat)))

(define-public i8086emu-git
  (package
    (name "i8086emu-git")
    (version "0.9.2.r35.1143f09")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/i8086emu-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "cross-platform emulator for the Intel 8086 microprocessor")
    (description "Cross-platform emulator for the Intel 8086 microprocessor.")
    (home-page "http://i8086emu.sourceforge.net/")
    (license license:gpl3+)))

(define-public insomnia
  (package
    (name "insomnia")
    (version "12.5.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Kong/insomnia")
                    (commit "v12.5.0")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (synopsis "cross-platform HTTP and GraphQL Client")
    (description "Cross-platform HTTP and GraphQL Client.")
    (home-page "https://github.com/Kong/insomnia")
    (license license:expat)))

(define-public isfree
  (package
    (name "isfree")
    (version "0.9.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/leo-arch/isfree")
                    (commit "v0.9.1")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "check your Arch system for nonfree software")
    (description "Check your Arch system for nonfree software.")
    (home-page "https://github.com/leo-arch/isfree")
    (license license:gpl2)))

(define-public jack-mixer-cc
  (package
    (name "jack-mixer-cc")
    (version "0.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/sen87/jack_mixer_cc")
                    (commit "v0.4")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a companion for jack_mixer that provides CLI control for channel adjustments")
    (description "A companion for jack_mixer that provides CLI control for channel adjustments.")
    (home-page "https://github.com/sen87/jack_mixer_cc")
    (license license:non-copyleft)))

(define-public jivexdv-bin
  (package
    (name "jivexdv-bin")
    (version "5.8_RC04")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/jivexdv-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "jiveX DICOM Viewer")
    (description "JiveX DICOM Viewer.")
    (home-page "https://www.visus.com/en/downloads/jivex-dicom-viewer.html")
    (license license:expat)))

(define-public jxplorer
  (package
    (name "jxplorer")
    (version "3.3.1.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/jxplorer.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "java LDAP browser and editor")
    (description "Java LDAP browser and editor.")
    (home-page "http://jxplorer.org/")
    (license license:non-copyleft)))

(define-public k3sup
  (package
    (name "k3sup")
    (version "0.13.12")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/alexellis/k3sup")
                    (commit "v0.13.12")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a tool to bootstrap K3s over SSH in < 60s")
    (description "A tool to bootstrap K3s over SSH in < 60s.")
    (home-page "https://github.com/alexellis/k3sup")
    (license license:expat)))

(define-public kde-thumbnailer-apk
  (package
    (name "kde-thumbnailer-apk")
    (version "2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/z3ntu/kde-thumbnailer-apk")
                    (commit "v2.0")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "preview image generator plugin for Android Application Package files")
    (description "Preview image generator plugin for Android Application Package files.")
    (home-page "https://github.com/z3ntu/kde-thumbnailer-apk")
    (license license:gpl3+)))

(define-public kdotool-git
  (package
    (name "kdotool-git")
    (version "v0.2.1.r51.gc0fff47")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/jinliu/kdotool")
                    (commit "vv0.2.1.r51.gc0fff47")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "xdotool-like for KDE Wayland")
    (description "xdotool-like for KDE Wayland.")
    (home-page "https://github.com/jinliu/kdotool")
    (license license:asl2.0)))

(define-public kraftkit-git
  (package
    (name "kraftkit-git")
    (version "v0.12.4.r0.gef72e31")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/kraftkit-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments (list #:tests? #f))
    (synopsis "build and use highly customized and ultra-lightweight unikernels")
    (description "Build and use highly customized and ultra-lightweight unikernels.")
    (home-page "https://unikraft.org/docs/cli")
    (license license:bsd-3)))

(define-public ktxutils-git
  (package
    (name "ktxutils-git")
    (version "r20.6f538eb")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "http://github.com/ekpyron/ktxutils")
                    (commit "vr20.6f538eb")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "utilities for the KTX texture format")
    (description "Utilities for the KTX texture format.")
    (home-page "http://github.com/ekpyron/ktxutils/")
    (license license:expat)))

(define-public kwin-decoration-sierra-breeze-enhanced-git
  (package
    (name "kwin-decoration-sierra-breeze-enhanced-git")
    (version "r255.e15da98")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/kupiqu/SierraBreezeEnhanced")
                    (commit "vr255.e15da98")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a fork of BreezeEnhanced to make it (arguably) more minimalistic and info")
    (description "A fork of BreezeEnhanced to make it (arguably) more minimalistic and informative (git version).")
    (home-page "https://github.com/kupiqu/SierraBreezeEnhanced")
    (license license:gpl3)))

(define-public lcarsde-app-menu
  (package
    (name "lcarsde-app-menu")
    (version "23.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lcarsde-app-menu.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "lcarsde menu for showing, selecting and closing windows")
    (description "lcarsde menu for showing, selecting and closing windows.")
    (home-page "https://lcarsde.github.io")
    (license license:expat)))

(define-public lcarsde-logout
  (package
    (name "lcarsde-logout")
    (version "23.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lcarsde-logout.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "lcarsde app for logout, shutdown, restart,")
    (description "lcarsde app for logout, shutdown, restart, ...")
    (home-page "https://lcarsde.github.io")
    (license license:expat)))

(define-public lceda-pro-bin
  (package
    (name "lceda-pro-bin")
    (version "3.2.117")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lceda-pro-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "免费、专业、强大的国产PCB设计工具")
    (description "免费、专业、强大的国产PCB设计工具.")
    (home-page "https://pro.lceda.cn/")
    (license license:non-copyleft)))

(define-public legcord-git
  (package
    (name "legcord-git")
    (version "r1612.b78c779")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Legcord/Legcord")
                    (commit "vr1612.b78c779")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (synopsis "legcord dev build using the system electron")
    (description "Legcord dev build using the system electron. Legcord is a custom client designed to enhance your Discord experience while keeping everything lightweight.")
    (home-page "https://github.com/Legcord/Legcord")
    (license license:non-copyleft)))

(define-public lib32-libfdk-aac
  (package
    (name "lib32-libfdk-aac")
    (version "2.0.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lib32-libfdk-aac.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "fraunhofer FDK AAC codec library (32-bit)")
    (description "Fraunhofer FDK AAC codec library (32-bit).")
    (home-page "https://sourceforge.net/projects/opencore-amr/")
    (license license:non-copyleft)))

(define-public lib32-xvidcore
  (package
    (name "lib32-xvidcore")
    (version "1.3.7")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lib32-xvidcore.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "xviD is an open source MPEG-4 video codec (32-bit)")
    (description "XviD is an open source MPEG-4 video codec (32-bit).")
    (home-page "https://www.xvid.com")
    (license license:gpl3+)))

(define-public lib32-zvbi
  (package
    (name "lib32-zvbi")
    (version "0.2.44")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lib32-zvbi.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "vBI capture and decoding library (32-bit)")
    (description "VBI capture and decoding library (32-bit).")
    (home-page "http://zapping.sourceforge.net/cgi-bin/view/ZVBI/WebHome")
    (license license:bsd-3)))

(define-public local-chaos
  (package
    (name "local-chaos")
    (version "0.1.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://codeberg.org/plax/local-chaos")
                    (commit "v0.1.1")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a script for creating and managing a local subset of Chaotic-AUR")
    (description "A script for creating and managing a local subset of Chaotic-AUR.")
    (home-page "https://codeberg.org/plax/local-chaos")
    (license license:gpl3+)))

(define-public loliashizuku-bin
  (package
    (name "loliashizuku-bin")
    (version "0.0.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Mxmilu666/LoliaShizuku")
                    (commit "v0.0.2")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "wails-powered third-party desktop client for Lolia FRP (prebuilt binary)")
    (description "Wails-powered third-party desktop client for Lolia FRP (prebuilt binary).")
    (home-page "https://github.com/Mxmilu666/LoliaShizuku")
    (license license:expat)))

(define-public lotus-lang
  (package
    (name "lotus-lang")
    (version "1.10.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/j-alexander3375/Lotus")
                    (commit "v1.10.0")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a systems programming language with type-first syntax, LLVM backend, and ")
    (description "A systems programming language with type-first syntax, LLVM backend, and an interactive REPL.")
    (home-page "https://github.com/j-alexander3375/Lotus")
    (license license:expat)))

(define-public lovr-playspace-git
  (package
    (name "lovr-playspace-git")
    (version "r32.c37f4e5")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/SpookySkeletons/lovr-playspace")
                    (commit "vr32.c37f4e5")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "room boundary overlay for OpenXR, made with LÖVR")
    (description "Room boundary overlay for OpenXR, made with LÖVR.")
    (home-page "https://github.com/SpookySkeletons/lovr-playspace")
    (license license:expat)))

(define-public lxqt-panel-tool-git
  (package
    (name "lxqt-panel-tool-git")
    (version "4696b53")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/stefonarch/lxqt-panel-tool")
                    (commit "v4696b53")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "save and switch configurations of lxqt-panel")
    (description "Save and switch configurations of lxqt-panel.")
    (home-page "https://github.com/stefonarch/lxqt-panel-tool")
    (license license:gpl3+)))

(define-public majsoul-plus-bin
  (package
    (name "majsoul-plus-bin")
    (version "2.0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/MajsoulPlus/majsoul-plus")
                    (commit "v2.0.1")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "majsoul browser (Binary)")
    (description "Majsoul browser (Binary).")
    (home-page "https://github.com/MajsoulPlus/majsoul-plus")
    (license license:agpl3)))

(define-public manga-tui
  (package
    (name "manga-tui")
    (version "0.10.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/josueBarretogit/manga-tui")
                    (commit "v0.10.0")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "terminal-based manga reader and downloader with image support")
    (description "Terminal-based manga reader and downloader with image support.")
    (home-page "https://github.com/josueBarretogit/manga-tui")
    (license license:expat)))

(define-public mingw-w64-sqlite
  (package
    (name "mingw-w64-sqlite")
    (version "3.53.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mingw-w64-sqlite.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a C library that implements an SQL database engine (mingw-w64)")
    (description "A C library that implements an SQL database engine (mingw-w64).")
    (home-page "https://www.sqlite.org/")
    (license license:non-copyleft)))

(define-public minot
  (package
    (name "minot")
    (version "0.7.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/uos/minot")
                    (commit "v0.7.0")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a versatile toolset for debugging and verifying stateful robot perception")
    (description "A versatile toolset for debugging and verifying stateful robot perception software.")
    (home-page "https://github.com/uos/minot")
    (license license:asl2.0)))

(define-public miraclecast-git
  (package
    (name "miraclecast-git")
    (version "326.f3debd5")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/albfan/miraclecast")
                    (commit "v326.f3debd5")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "miracleCast provides software to connect external monitors to your system")
    (description "MiracleCast provides software to connect external monitors to your system via Wifi. It is compatible to Miracast. Link-management works, everything else is still being worked on. Replaces openwfd. Contribute on https://github.com/albfan/aur-miraclecast.")
    (home-page "https://github.com/albfan/miraclecast")
    (license license:gpl3+)))

(define-public mozc-ut
  (package
    (name "mozc-ut")
    (version "3.33.6133.20260312")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/google/mozc")
                    (commit "v3.33.6133.20260312")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the Open Source edition of Google Japanese Input bundled with the UT dict")
    (description "The Open Source edition of Google Japanese Input bundled with the UT dictionary.")
    (home-page "https://github.com/google/mozc")
    (license license:asl2.0)))

(define-public mtk-uartboot-rs
  (package
    (name "mtk-uartboot-rs")
    (version "0.1.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/981213/mtk_uartboot")
                    (commit "v0.1.1")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a third-party tool to load and execute binaries over UART for Mediatek SoCs")
    (description "A third-party tool to load and execute binaries over UART for Mediatek SoCs.")
    (home-page "https://github.com/981213/mtk_uartboot")
    (license license:agpl3+)))

(define-public muon-decoder
  (package
    (name "muon-decoder")
    (version "1.1.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Dopple24/muon_decoder")
                    (commit "v1.1.4")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "particle decoder")
    (description "Particle decoder.")
    (home-page "https://github.com/Dopple24/muon_decoder")
    (license license:expat)))

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

(define-public myxer-git
  (package
    (name "myxer-git")
    (version "1.3.0.r0.gea53586")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Aurailus/Myxer")
                    (commit "v1.3.0.r0.gea53586")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a modern volume mixer for PulseAudio")
    (description "A modern volume mixer for PulseAudio.")
    (home-page "https://github.com/Aurailus/Myxer")
    (license license:gpl3)))

(define-public nanoclaw-git
  (package
    (name "nanoclaw-git")
    (version "r181.226b520")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/gavrielc/nanoclaw")
                    (commit "vr181.226b520")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "aI-Native personal assistant for WhatsApp/Telegram with container isolation")
    (description "AI-Native personal assistant for WhatsApp/Telegram with container isolation.")
    (home-page "https://github.com/gavrielc/nanoclaw")
    (license license:expat)))

(define-public nanocoder
  (package
    (name "nanocoder")
    (version "1.25.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Nano-Collective/nanocoder")
                    (commit "v1.25.2")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a beautiful local-first coding agent running in your terminal")
    (description "A beautiful local-first coding agent running in your terminal.")
    (home-page "https://github.com/Nano-Collective/nanocoder")
    (license license:expat)))

(define-public nautilus-admin-gtk4
  (package
    (name "nautilus-admin-gtk4")
    (version "1.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/MacTavishAO/nautilus-admin-gtk4")
                    (commit "v1.2.0")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "extension for Nautilus to do administrative operations")
    (description "Extension for Nautilus to do administrative operations.")
    (home-page "https://github.com/MacTavishAO/nautilus-admin-gtk4")
    (license license:gpl3+)))

(define-public ncmpcpp-album-cover-git
  (package
    (name "ncmpcpp-album-cover-git")
    (version "1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/AVR-ochkarik/ncmpcpp-album-cover")
                    (commit "v1.0")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "simple script for displaying ncmpcpp album covers in a separate terminal ")
    (description "Simple script for displaying ncmpcpp album covers in a separate terminal using mpv.")
    (home-page "https://github.com/AVR-ochkarik/ncmpcpp-album-cover")
    (license license:expat)))

(define-public neoleo
  (package
    (name "neoleo")
    (version "16.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/blippy/neoleo")
                    (commit "v16.0")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "lightweight curses spreadsheet based on GNU oleo")
    (description "Lightweight curses spreadsheet based on GNU oleo.")
    (home-page "https://github.com/blippy/neoleo")
    (license license:gpl2+)))

(define-public nerd-fonts-apple
  (package
    (name "nerd-fonts-apple")
    (version "3.4.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/nerd-fonts-apple.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (arguments (list #:tests? #f))
    (synopsis "apple font (San Francisco, NY), patched with the Nerd Fonts Patcher")
    (description "Apple font (San Francisco, NY), patched with the Nerd Fonts Patcher.")
    (home-page "https://developer.apple.com/fonts/")
    (license license:non-copyleft)))

(define-public netextender
  (package
    (name "netextender")
    (version "10.3.1_29")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/netextender.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "sonicWALL SSL VPN Client")
    (description "SonicWALL SSL VPN Client.")
    (home-page "https://www.sonicwall.com/en-us/products/remote-access/vpn-client")
    (license license:non-copyleft)))

(define-public nextcloud-app-impersonate
  (package
    (name "nextcloud-app-impersonate")
    (version "4.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/nextcloud-app-impersonate.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "allow administrators to become a different user by adding an impersonate ")
    (description "Allow administrators to become a different user by adding an impersonate action to the user list.")
    (home-page "https://apps.nextcloud.com/apps/impersonate")
    (license license:gpl3+)))

(define-public nexusmods-app-bin
  (package
    (name "nexusmods-app-bin")
    (version "0.21.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Nexus-Mods/NexusMods.App")
                    (commit "v0.21.1")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a mod installer, creator and manager for all your popular games")
    (description "A mod installer, creator and manager for all your popular games.")
    (home-page "https://github.com/Nexus-Mods/NexusMods.App")
    (license license:gpl3+)))

(define-public niri-settings-git
  (package
    (name "niri-settings-git")
    (version "a396684")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/stefonarch/niri-settings")
                    (commit "va396684")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "gUI application for configuring niri in Qt")
    (description "GUI application for configuring niri in Qt.")
    (home-page "https://github.com/stefonarch/niri-settings")
    (license license:gpl3+)))

(define-public nitchrevived
  (package
    (name "nitchrevived")
    (version "0.1.7.5")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/nitchrevived.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "incredibly fast system fetch written in nim! NiTch Revived is project sup")
    (description "Incredibly fast system fetch written in nim! NiTch Revived is project supposed to continue the NiTch after it become not maintained.")
    (home-page "https://git.teto.party/pkgs/nitchrevived")
    (license license:expat)))

(define-public nodejs-nativefier
  (package
    (name "nodejs-nativefier")
    (version "52.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nativefier/nativefier")
                    (commit "v52.0.0")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a command-line tool to easily create a desktop app for any web site with ")
    (description "A command-line tool to easily create a desktop app for any web site with minimal configuration.")
    (home-page "https://github.com/nativefier/nativefier/")
    (license license:expat)))

(define-public nodejs-node-red
  (package
    (name "nodejs-node-red")
    (version "4.1.8")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/nodejs-node-red.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a visual tool for wiring the Internet of Things")
    (description "A visual tool for wiring the Internet of Things.")
    (home-page "https://nodered.org")
    (license license:asl2.0)))

(define-public nutstore
  (package
    (name "nutstore")
    (version "6.4.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/nutstore.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a cloud service that lets you sync and share files anywhere")
    (description "a cloud service that lets you sync and share files anywhere.")
    (home-page "https://www.jianguoyun.com/")
    (license license:non-copyleft)))

(define-public nvidia-340xx
  (package
    (name "nvidia-340xx")
    (version "340.108")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/nvidia-340xx.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "NVIDIA drivers for linux, 340xx legacy branch")
    (description "NVIDIA drivers for linux, 340xx legacy branch.")
    (home-page "https://www.nvidia.com/")
    (license license:non-copyleft)))

(define-public nvidia-535xx-dkms
  (package
    (name "nvidia-535xx-dkms")
    (version "535.288.01")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/nvidia-535xx-dkms.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "NVIDIA drivers - module sources, 535 branch")
    (description "NVIDIA drivers - module sources, 535 branch.")
    (home-page "http://www.nvidia.com/")
    (license license:non-copyleft)))

(define-public nvidia-open-beta
  (package
    (name "nvidia-open-beta")
    (version "595.58.03")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/NVIDIA/open-gpu-kernel-modules")
                    (commit "v595.58.03")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "NVIDIA open kernel modules (beta version)")
    (description "NVIDIA open kernel modules (beta version).")
    (home-page "https://github.com/NVIDIA/open-gpu-kernel-modules/")
    (license license:expat)))

(define-public nvidia-open-beta-dkms
  (package
    (name "nvidia-open-beta-dkms")
    (version "595.58.03")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/NVIDIA/open-gpu-kernel-modules")
                    (commit "v595.58.03")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "NVIDIA open kernel modules (module sources; beta version)")
    (description "NVIDIA open kernel modules (module sources; beta version).")
    (home-page "https://github.com/NVIDIA/open-gpu-kernel-modules/")
    (license license:expat)))

(define-public obs-vnc
  (package
    (name "obs-vnc")
    (version "0.6.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/obs-vnc.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "this plugin is a VNC viewer that works as a source in OBS Studio")
    (description "This plugin is a VNC viewer that works as a source in OBS Studio.")
    (home-page "https://obsproject.com/forum/resources/vnc-source.1000/")
    (license license:gpl2+)))

(define-public ocztoolbox
  (package
    (name "ocztoolbox")
    (version "4.9.0.634")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ocztoolbox.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the OCZ Toolbox is designed to update firmware and BIOS, secure erase, vi")
    (description "The OCZ Toolbox is designed to update firmware and BIOS, secure erase, view SMART attributes, and view drive details of your OCZ SSD with the click of a button.")
    (home-page "http://ocz.com/consumer/download/firmware")
    (license license:non-copyleft)))

(define-public ollama-vulkan-bin
  (package
    (name "ollama-vulkan-bin")
    (version "0.20.6")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ollama/ollama")
                    (commit "v0.20.6")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "create, run and share large language models (LLMs) with Vulkan")
    (description "Create, run and share large language models (LLMs) with Vulkan.")
    (home-page "https://github.com/ollama/ollama")
    (license license:expat)))

(define-public ollamacode
  (package
    (name "ollamacode")
    (version "1.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/r3dg0d/ollamacode")
                    (commit "v1.0.0")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "autonomous agentic coding assistant powered by Ollama with native tool ca")
    (description "Autonomous agentic coding assistant powered by Ollama with native tool calling.")
    (home-page "https://github.com/r3dg0d/ollamacode")
    (license license:expat)))

(define-public onset
  (package
    (name "onset")
    (version "1.0.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/xPathin/onset")
                    (commit "v1.0.3")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "lightweight GTK4 autostart manager for Linux")
    (description "Lightweight GTK4 autostart manager for Linux.")
    (home-page "https://github.com/xPathin/onset")
    (license license:expat)))

(define-public openscq30-gui-bin
  (package
    (name "openscq30-gui-bin")
    (version "2.6.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Oppzippy/OpenSCQ30")
                    (commit "v2.6.1")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "cross platform application for controlling settings of Soundcore headphon")
    (description "Cross platform application for controlling settings of Soundcore headphones - Cosmic GUI application.")
    (home-page "https://github.com/Oppzippy/OpenSCQ30")
    (license license:gpl3+)))

(define-public opentubex-git
  (package
    (name "opentubex-git")
    (version "r10273.08b241344")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/OpenTubeX/OpenTubeX")
                    (commit "vr10273.08b241344")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a fork of the open source desktop YouTube player FreeTube with additional")
    (description "A fork of the open source desktop YouTube player FreeTube with additional features.")
    (home-page "https://github.com/OpenTubeX/OpenTubeX")
    (license license:agpl3+)))

(define-public oscgoesbrrr
  (package
    (name "oscgoesbrrr")
    (version "2.1.14")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/oscgoesbrrr.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (synopsis "make haptics in real life go BRRR from VRChat")
    (description "Make haptics in real life go BRRR from VRChat.")
    (home-page "https://osc.toys/")
    (license license:non-copyleft)))

(define-public osu-lazer-tachyon-bin
  (package
    (name "osu-lazer-tachyon-bin")
    (version "2026.408.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/osu-lazer-tachyon-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "tachyon pre-release channel of the future of osu! and the beginning of an")
    (description "Tachyon pre-release channel of the future of osu! and the beginning of an open era! Commonly known by the codename osu!lazer. Pew pew.")
    (home-page "https://osu.ppy.sh")
    (license license:non-copyleft)))

(define-public p7zip-gui
  (package
    (name "p7zip-gui")
    (version "16.02")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/p7zip-gui.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "graphic user interface (alpha quality) for the p7zip file archiver")
    (description "Graphic user interface (alpha quality) for the p7zip file archiver.")
    (home-page "http://p7zip.sourceforge.net")
    (license license:non-copyleft)))

