;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency tree resolver pass --- deptree-resolver-260416d
;;; Resolves 99 packages from dependency tree queue.
;;;
;;; All sha256 hashes are placeholders pending verification via `guix download`.

(define-module (gaurix packages deptree-resolver-260416d)
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
  #:export (graphite-editor-git
            home-assistant
            linux-lqx-docs
            linux-lqx-headers
            yabridge-wine10-git
            inputactions-kwin
            pamac-aur
            scx-scheds-git
            linux-mainline-docs
            linuxqq-nt-bwrap
            plasmazones
            qt6-xcb-private-headers-hifps
            waydroid-helper
            open-vm-tools-git
            openxray-git
            paperless-ngx-venv
            pdf4qt-git
            plasma-keyboard-git
            protonmail-bridge-free
            rust-aarch64-gnu-git
            rust-aarch64-musl-git
            unreal-engine
            vortex-git
            wayvr-git
            atlantik-git
            frr
            hidamari
            hiddify
            linux-libre-hardened
            linux-vfio-lts
            note-gen
            nulloy
            openvino-intel-gpu-plugin
            organicmaps-git
            plasma-login-manager-git
            plasma6-applets-appgrid
            playdate-sdk
            pros-cli
            python-fabric-git
            scrt
            sdrpp-brown-git
            soh
            thinlinc-server
            vbam-wx
            aeroshell-smod-git
            airwindows-consolidated-git
            chessament-git
            godot32
            java-openjfx-doc
            java-openjfx-src
            maubot
            norisk-client-launcher-nvidia
            openvino-intel-npu-plugin
            radiosonde-auto-rx
            ventoy
            alvr
            jacartauc
            java11-openjfx-doc
            java11-openjfx-src
            ladybird
            linux-pf
            obs-advanced-scene-switcher
            openmoonray
            python-bitsandbytes
            sonic-pi-git
            sway-i3-style-fullscreen-git
            switchgen-git
            goldendict-git
            havoc-c2-git
            input-leap-git
            java11-openjfx
            ksysguard6-git
            ktailctl
            linux-cachyos-headers
            wine-tkg-staging-ntsync-bin
            wine-tkg-staging-wow64-bin
            zenkit
            binaryninja-personal
            bobcat-terminal-git
            cairo-dock-plug-ins-wayland-git
            dvdae-bin
            git-it
            mesen
            nekobox
            nekobox-core
            pix2tex
            snes9x-qt-git
            torzu
            caelestia-shell-git
            organicmaps
            penpot
            shortwave-mpris-git
            snes9x-git
            snes9x-gtk-git
            sparkle-bin
            yaak
            devtools-doas
            llvm-libs-git
            omnetpp
))

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

(define-public open-vm-tools-git
  (package
    (name "open-vm-tools-git")
    (version "13.0.10")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/vmware/open-vm-tools")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "open VMware Tools for Linux guests (running Wayland only)")
    (description "Open VMware Tools for Linux guests (running Wayland only).")
    (home-page "https://github.com/vmware/open-vm-tools")
    (license license:gpl2+)))

(define-public openxray-git
  (package
    (name "openxray-git")
    (version "1.6.02_1747")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/OpenXRay/xray-16")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "unofficial X-Ray Engine port for Linux from the OpenXRay team (originally d..")
    (description "Unofficial X-Ray Engine port for Linux from the OpenXRay team (originally developed by GSC Game World).")
    (home-page "https://github.com/OpenXRay/xray-16")
    (license license:non-copyleft)))

(define-public paperless-ngx-venv
  (package
    (name "paperless-ngx-venv")
    (version "2.20.14")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/paperless-ngx-venv.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "paperless-ngx: scan, index and archive all your physical documents")
    (description "Paperless-ngx: scan, index and archive all your physical documents.")
    (home-page "https://docs.paperless-ngx.com/")
    (license license:gpl3+)))

(define-public pdf4qt-git
  (package
    (name "pdf4qt-git")
    (version "1.5.1.0.r16.gba80dbd")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/pdf4qt-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "open source PDF editor")
    (description "Open source PDF editor.")
    (home-page "https://jakubmelka.github.io/")
    (license license:lgpl3+)))

(define-public plasma-keyboard-git
  (package
    (name "plasma-keyboard-git")
    (version "0edb3bd")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/plasma-keyboard-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "virtual Keyboard for Qt based desktops")
    (description "Virtual Keyboard for Qt based desktops.")
    (home-page "https://invent.kde.org/plasma/plasma-keyboard")
    (license license:lgpl2.1+)))

(define-public protonmail-bridge-free
  (package
    (name "protonmail-bridge-free")
    (version "3.24.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ProtonMail/proton-bridge")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "integrate ProtonMail account with any program that supports IMAP and SMTP (..")
    (description "Integrate ProtonMail account with any program that supports IMAP and SMTP (Qt desktop application).")
    (home-page "https://github.com/ProtonMail/proton-bridge")
    (license license:gpl3+)))

(define-public rust-aarch64-gnu-git
  (package
    (name "rust-aarch64-gnu-git")
    (version "1:1.96.0.r1.g0312931")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/rust-aarch64-gnu-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "aArch64 GNU target for Rust (GIT VERSION)")
    (description "AArch64 GNU target for Rust (GIT VERSION).")
    (home-page "https://www.rust-lang.org/")
    (license license:asl2.0)))

(define-public rust-aarch64-musl-git
  (package
    (name "rust-aarch64-musl-git")
    (version "1:1.96.0.r1.g0312931")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/rust-aarch64-musl-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "aArch64 Musl target for Rust (GIT VERSION)")
    (description "AArch64 Musl target for Rust (GIT VERSION).")
    (home-page "https://www.rust-lang.org/")
    (license license:asl2.0)))

(define-public unreal-engine
  (package
    (name "unreal-engine")
    (version "5.7.4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/unreal-engine.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a 3D game engine by Epic Games which can be used non-commercially for free")
    (description "A 3D game engine by Epic Games which can be used non-commercially for free.")
    (home-page "https://www.unrealengine.com/")
    (license license:non-copyleft)))

(define-public vortex-git
  (package
    (name "vortex-git")
    (version "1.16.0.beta.5.r134.gbdec40633")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Nexus-Mods/Vortex")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "nexus Mods' mod manager - native Linux build (Git Master)")
    (description "Nexus Mods' mod manager - native Linux build (Git Master).")
    (home-page "https://github.com/Nexus-Mods/Vortex")
    (license license:gpl3+)))

(define-public wayvr-git
  (package
    (name "wayvr-git")
    (version "26.2.1.r36.d9f89fa")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/wlx-team/wayvr")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "your way to enjoy VR on Linux! Access your Wayland/X11 desktop from SteamVR..")
    (description "Your way to enjoy VR on Linux! Access your Wayland/X11 desktop from SteamVR/Monado (OpenVR+OpenXR support).")
    (home-page "https://github.com/wlx-team/wayvr")
    (license license:gpl3+)))

(define-public atlantik-git
  (package
    (name "atlantik-git")
    (version "3.80.3.r753.gf4e092c")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/atlantik-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "kDE client for playing Monopoly-like board games on the monopd network")
    (description "KDE client for playing Monopoly-like board games on the monopd network.")
    (home-page "https://apps.kde.org/atlantik/")
    (license license:gpl2+)))

(define-public frr
  (package
    (name "frr")
    (version "10.6.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/frr.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "fRRouting (quagga fork) supports BGP, OSPF, ISIS, RIP, PIM, LDP, BFD, VRRP,..")
    (description "FRRouting (quagga fork) supports BGP, OSPF, ISIS, RIP, PIM, LDP, BFD, VRRP, NHRP and EIGRP.")
    (home-page "https://frrouting.org")
    (license license:gpl2+)))

(define-public hidamari
  (package
    (name "hidamari")
    (version "3.6")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/jeffshee/hidamari")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "video wallpaper for Linux. Written in Python")
    (description "Video wallpaper for Linux. Written in Python.")
    (home-page "https://github.com/jeffshee/hidamari")
    (license license:gpl3+)))

(define-public hiddify
  (package
    (name "hiddify")
    (version "4.0.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/hiddify/hiddify-app")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "multi-platform auto-proxy client, supporting Sing-box, X-ray, TUIC, Hysteri..")
    (description "Multi-platform auto-proxy client, supporting Sing-box, X-ray, TUIC, Hysteria, Reality, Trojan, SSH, etc.")
    (home-page "https://github.com/hiddify/hiddify-app")
    (license license:gpl3+)))

(define-public linux-libre-hardened
  (package
    (name "linux-libre-hardened")
    (version "6.17.13.hardened1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/linux-libre-hardened.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the Security-Hardened Linux-libre kernel and modules")
    (description "The Security-Hardened Linux-libre kernel and modules.")
    (home-page "https://linux-libre.fsfla.org/")
    (license license:gpl2+)))

(define-public linux-vfio-lts
  (package
    (name "linux-vfio-lts")
    (version "6.18.22")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/linux-vfio-lts.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the LTS Linux kernel and modules (ACS override and i915 VGA arbiter patches)")
    (description "The LTS Linux kernel and modules (ACS override and i915 VGA arbiter patches).")
    (home-page "https://www.kernel.org")
    (license license:gpl2+)))

(define-public note-gen
  (package
    (name "note-gen")
    (version "null")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/codexu/note-gen")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a cross-platform Markdown note-taking application with AI integration (X11/..")
    (description "A cross-platform Markdown note-taking application with AI integration (X11/Wayland compatible).")
    (home-page "https://github.com/codexu/note-gen")
    (license license:expat)))

(define-public nulloy
  (package
    (name "nulloy")
    (version "0.9.9")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/nulloy.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "music player with a waveform progress bar")
    (description "Music player with a waveform progress bar.")
    (home-page "http://nulloy.com/")
    (license license:gpl3+)))

(define-public openvino-intel-gpu-plugin
  (package
    (name "openvino-intel-gpu-plugin")
    (version "2026.1.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/openvino-intel-gpu-plugin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "intel GPU plugin for OpenVINO")
    (description "Intel GPU plugin for OpenVINO.")
    (home-page "https://docs.openvino.ai/")
    (license license:asl2.0)))

(define-public organicmaps-git
  (package
    (name "organicmaps-git")
    (version "2025.05.20.r101.gd9ca79e")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/organicmaps/organicmaps")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "an offline maps app for travelers, tourists, hikers, and cyclists, using cr..")
    (description "An offline maps app for travelers, tourists, hikers, and cyclists, using crowd-sourced OpenStreetMap data.")
    (home-page "https://github.com/organicmaps/organicmaps")
    (license license:asl2.0)))

(define-public plasma-login-manager-git
  (package
    (name "plasma-login-manager-git")
    (version "r1941.6606669")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/plasma-login-manager-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "plasma Login provides a display manager for KDE Plasma, forked from SDDM an..")
    (description "Plasma Login provides a display manager for KDE Plasma, forked from SDDM and with an new frontend providing a greeter, wallpaper plugin integration and System Settings module (KCM).")
    (home-page "https://invent.kde.org/plasma/plasma-login-manager")
    (license license:gpl3+)))

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
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a modern fullscreen application launcher for KDE Plasma")
    (description "A modern fullscreen application launcher for KDE Plasma.")
    (home-page "https://github.com/xarbit/plasma6-applet-appgrid")
    (license license:gpl2+)))

(define-public playdate-sdk
  (package
    (name "playdate-sdk")
    (version "3.0.5")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/playdate-sdk.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "sDK for the Playdate console with Lua and C APIs, docs, and a simulator")
    (description "SDK for the Playdate console with Lua and C APIs, docs, and a simulator.")
    (home-page "https://play.date/dev/")
    (license license:non-copyleft)))

(define-public pros-cli
  (package
    (name "pros-cli")
    (version "3.5.6")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/purduesigbots/pros-cli")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "command Line Interface for managing PROS projects. Works with V5 and the Co..")
    (description "Command Line Interface for managing PROS projects. Works with V5 and the Cortex.")
    (home-page "https://github.com/purduesigbots/pros-cli")
    (license license:mpl2.0)))

(define-public python-fabric-git
  (package
    (name "python-fabric-git")
    (version "r161.ff02325")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Fabric-Development/fabric")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "next-gen framework for building desktop widgets using python")
    (description "Next-gen framework for building desktop widgets using python.")
    (home-page "https://github.com/Fabric-Development/fabric")
    (license license:agpl3+)))

(define-public scrt
  (package
    (name "scrt")
    (version "9.7.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/scrt.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "vandyke SecureCRT SSH Client")
    (description "Vandyke SecureCRT SSH Client.")
    (home-page "http://www.vandyke.com/products/securecrt/")
    (license license:non-copyleft)))

(define-public sdrpp-brown-git
  (package
    (name "sdrpp-brown-git")
    (version "v1.1709823358.r476.f0feccfb")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/sannysanoff/SDRPlusPlusBrown")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "sDR++Brown (fork), is not the original bloat-free SDR software")
    (description "SDR++Brown (fork), is not the original bloat-free SDR software.")
    (home-page "https://github.com/sannysanoff/SDRPlusPlusBrown")
    (license license:gpl3+)))

(define-public soh
  (package
    (name "soh")
    (version "9.2.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/soh.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "an unofficial port of The Legend of Zelda Ocarina of Time for PC, Wii U, an..")
    (description "An unofficial port of The Legend of Zelda Ocarina of Time for PC, Wii U, and Switch.")
    (home-page "https://shipofharkinian.com/")
    (license license:non-copyleft)))

(define-public thinlinc-server
  (package
    (name "thinlinc-server")
    (version "4.20.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/thinlinc-server.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "cendio ThinLinc Linux remote desktop server")
    (description "Cendio ThinLinc Linux remote desktop server.")
    (home-page "http://www.cendio.com/")
    (license license:non-copyleft)))

(define-public vbam-wx
  (package
    (name "vbam-wx")
    (version "2.2.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/vbam-wx.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "nintendo GameBoy Advance emulator")
    (description "Nintendo GameBoy Advance emulator.")
    (home-page "https://visualboyadvance-m.org")
    (license license:gpl2+)))

(define-public aeroshell-smod-git
  (package
    (name "aeroshell-smod-git")
    (version "6.6.3_27.rdef5938")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/aeroshell-desktop/smod")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "kDecoration3 decoration engine for AeroShell-based desktops")
    (description "KDecoration3 decoration engine for AeroShell-based desktops.")
    (home-page "https://github.com/aeroshell-desktop/smod")
    (license license:agpl3+)))

(define-public airwindows-consolidated-git
  (package
    (name "airwindows-consolidated-git")
    (version "2.12.0.r221.33650be")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/baconpaul/airwin2rack")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "airwindows effects as a single plugin or stand-alone program with documenta..")
    (description "Airwindows effects as a single plugin or stand-alone program with documentation.")
    (home-page "https://github.com/baconpaul/airwin2rack")
    (license license:gpl3+)))

(define-public chessament-git
  (package
    (name "chessament-git")
    (version "r457.6ae9db1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/chessament-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "chess tournament manager for Swiss-system tournaments")
    (description "Chess tournament manager for Swiss-system tournaments.")
    (home-page "https://apps.kde.org/chessament/")
    (license license:gpl3+)))

(define-public godot32
  (package
    (name "godot32")
    (version "4.6.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/godot32.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "advanced cross-platform 2D and 3D game engine (32-bit)")
    (description "Advanced cross-platform 2D and 3D game engine (32-bit).")
    (home-page "https://godotengine.org/")
    (license license:expat)))

(define-public java-openjfx-doc
  (package
    (name "java-openjfx-doc")
    (version "27.13")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/java-openjfx-doc.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "java OpenJFX client application platform (open-source implementation of Jav..")
    (description "Java OpenJFX client application platform (open-source implementation of JavaFX) - latest version.")
    (home-page "https://wiki.openjdk.java.net/display/OpenJFX/Main")
    (license license:gpl2+)))

(define-public java-openjfx-src
  (package
    (name "java-openjfx-src")
    (version "27.13")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/java-openjfx-src.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "java OpenJFX client application platform (open-source implementation of Jav..")
    (description "Java OpenJFX client application platform (open-source implementation of JavaFX) - latest version.")
    (home-page "https://wiki.openjdk.java.net/display/OpenJFX/Main")
    (license license:gpl2+)))

(define-public maubot
  (package
    (name "maubot")
    (version "0.6.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/maubot/maubot")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a plugin-based Matrix bot system")
    (description "A plugin-based Matrix bot system.")
    (home-page "https://github.com/maubot/maubot")
    (license license:agpl3+)))

(define-public norisk-client-launcher-nvidia
  (package
    (name "norisk-client-launcher-nvidia")
    (version "r1263.4e73192")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/norisk-client-launcher-nvidia.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "norisk Minecraft Client Launcher git package")
    (description "Norisk Minecraft Client Launcher git package.")
    (home-page "https://norisk.gg/")
    (license license:gpl3+)))

(define-public openvino-intel-npu-plugin
  (package
    (name "openvino-intel-npu-plugin")
    (version "2026.1.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/openvino-intel-npu-plugin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "intel NPU plugin for OpenVINO")
    (description "Intel NPU plugin for OpenVINO.")
    (home-page "https://docs.openvino.ai/")
    (license license:asl2.0)))

(define-public radiosonde-auto-rx
  (package
    (name "radiosonde_auto_rx")
    (version "1.8.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/projecthorus/radiosonde_auto_rx")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "automatically Track Radiosonde Launches using RTLSDR")
    (description "Automatically Track Radiosonde Launches using RTLSDR.")
    (home-page "https://github.com/projecthorus/radiosonde_auto_rx")
    (license license:gpl3+)))

(define-public ventoy
  (package
    (name "ventoy")
    (version "1.1.11")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ventoy.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a new bootable USB solution")
    (description "A new bootable USB solution.")
    (home-page "https://www.ventoy.net/")
    (license license:gpl3+)))

(define-public alvr
  (package
    (name "alvr")
    (version "20.14.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/alvr-org/ALVR")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "experimental Linux version of ALVR. Stream VR games from your PC to your he..")
    (description "Experimental Linux version of ALVR. Stream VR games from your PC to your headset via Wi-Fi.")
    (home-page "https://github.com/alvr-org/ALVR")
    (license license:expat)))

(define-public jacartauc
  (package
    (name "jacartauc")
    (version "3.1.2.3478")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/jacartauc.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "jaCarta Unified Client")
    (description "JaCarta Unified Client.")
    (home-page "https://www.aladdin-rd.ru/support/downloads/jacarta/")
    (license license:expat)))

(define-public java11-openjfx-doc
  (package
    (name "java11-openjfx-doc")
    (version "11.0.20.u1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/java11-openjfx-doc.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "java OpenJFX 11 client application platform (open-source implementation of ..")
    (description "Java OpenJFX 11 client application platform (open-source implementation of JavaFX).")
    (home-page "https://wiki.openjdk.java.net/display/OpenJFX/Main")
    (license license:non-copyleft)))

(define-public java11-openjfx-src
  (package
    (name "java11-openjfx-src")
    (version "11.0.20.u1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/java11-openjfx-src.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "java OpenJFX 11 client application platform (open-source implementation of ..")
    (description "Java OpenJFX 11 client application platform (open-source implementation of JavaFX).")
    (home-page "https://wiki.openjdk.java.net/display/OpenJFX/Main")
    (license license:non-copyleft)))

(define-public ladybird
  (package
    (name "ladybird")
    (version "20260320")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/LadybirdBrowser/ladybird")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "truly independent web browser")
    (description "Truly independent web browser.")
    (home-page "https://github.com/LadybirdBrowser/ladybird")
    (license license:bsd-3)))

(define-public linux-pf
  (package
    (name "linux-pf")
    (version "7.0.pf1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/linux-pf.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the pf-kernel and modules")
    (description "The pf-kernel and modules.")
    (home-page "https://pfkernel.natalenko.name")
    (license license:gpl2+)))

(define-public obs-advanced-scene-switcher
  (package
    (name "obs-advanced-scene-switcher")
    (version "1.33.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/obs-advanced-scene-switcher.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "an automated scene switcher for OBS Studio")
    (description "An automated scene switcher for OBS Studio.")
    (home-page "https://obsproject.com/forum/resources/advanced-scene-switcher.395/")
    (license license:gpl2+)))

(define-public openmoonray
  (package
    (name "openmoonray")
    (version "2.40.0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/dreamworksanimation/openmoonray")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "dreamWorks Animation's open-source Monte Carlo ray tracer")
    (description "DreamWorks Animation's open-source Monte Carlo ray tracer.")
    (home-page "https://github.com/dreamworksanimation/openmoonray")
    (license license:asl2.0)))

(define-public python-bitsandbytes
  (package
    (name "python-bitsandbytes")
    (version "0.49.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/bitsandbytes-foundation/bitsandbytes")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "k-bit optimizers and matrix multiplication routines")
    (description "K-bit optimizers and matrix multiplication routines.")
    (home-page "https://github.com/bitsandbytes-foundation/bitsandbytes")
    (license license:expat)))

(define-public sonic-pi-git
  (package
    (name "sonic-pi-git")
    (version "v4.6.0.r0.g9f8f021")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/sonic-pi-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the Live Coding Music Synth for Everyone")
    (description "The Live Coding Music Synth for Everyone.")
    (home-page "http://sonic-pi.net/")
    (license license:expat)))

(define-public sway-i3-style-fullscreen-git
  (package
    (name "sway-i3-style-fullscreen-git")
    (version "1.10.r7405.af28ac0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/sway-i3-style-fullscreen-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "tiling Wayland compositor and replacement for the i3 window manager with pa..")
    (description "Tiling Wayland compositor and replacement for the i3 window manager with patch for i3 style fullscreen.")
    (home-page "https://swaywm.org")
    (license license:expat)))

(define-public switchgen-git
  (package
    (name "switchgen-git")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/djwarf/switchgen")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "aI Image Generator using ComfyUI as a library")
    (description "AI Image Generator using ComfyUI as a library.")
    (home-page "https://github.com/djwarf/switchgen")
    (license license:expat)))

(define-public goldendict-git
  (package
    (name "goldendict-git")
    (version "1:1.5.0rc2.r521.g99982a1c")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/goldendict/goldendict")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "feature-rich dictionary lookup program supporting multiple dictionary formats")
    (description "Feature-rich dictionary lookup program supporting multiple dictionary formats.")
    (home-page "https://github.com/goldendict/goldendict")
    (license license:gpl3+)))

(define-public havoc-c2-git
  (package
    (name "havoc-c2-git")
    (version "r619.f163210")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/havoc-c2-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "modern and malleable post-exploitation command and control framework")
    (description "Modern and malleable post-exploitation command and control framework.")
    (home-page "https://havocframework.com/")
    (license license:gpl3+)))

(define-public input-leap-git
  (package
    (name "input-leap-git")
    (version "3.0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/input-leap/input-leap")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "open-source KVM software (GUI)")
    (description "Open-source KVM software (GUI).")
    (home-page "https://github.com/input-leap/input-leap")
    (license license:non-copyleft)))

(define-public java11-openjfx
  (package
    (name "java11-openjfx")
    (version "11.0.20.u1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/java11-openjfx.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "java OpenJFX 11 client application platform (open-source implementation of ..")
    (description "Java OpenJFX 11 client application platform (open-source implementation of JavaFX).")
    (home-page "https://wiki.openjdk.java.net/display/OpenJFX/Main")
    (license license:non-copyleft)))

(define-public ksysguard6-git
  (package
    (name "ksysguard6-git")
    (version "r3613.6ecc098")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/zvova7890/ksysguard6")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "track and control the processes running in your system. KF6 version")
    (description "Track and control the processes running in your system. KF6 version.")
    (home-page "https://github.com/zvova7890/ksysguard6")
    (license license:lgpl3+)))

(define-public ktailctl
  (package
    (name "ktailctl")
    (version "0.21.5")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/f-koehler/KTailctl")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "gUI to monitor and manage Tailscale")
    (description "GUI to monitor and manage Tailscale.")
    (home-page "https://github.com/f-koehler/KTailctl")
    (license license:gpl3+)))

(define-public linux-cachyos-headers
  (package
    (name "linux-cachyos-headers")
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
    (synopsis "headers and scripts for building modules for the Linux EEVDF + LTO + AutoFD..")
    (description "Headers and scripts for building modules for the Linux EEVDF + LTO + AutoFDO + Propeller Cachy Sauce Kernel by CachyOS with other patches and improvements. kernel.")
    (home-page "https://github.com/CachyOS/linux-cachyos")
    (license license:gpl2+)))

(define-public wine-tkg-staging-ntsync-bin
  (package
    (name "wine-tkg-staging-ntsync-bin")
    (version "10.15")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Kron4ek/Wine-Builds")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"))))
    (synopsis "a compatibility layer for running Windows programs (WOW64 with TkG-Staging ..")
    (description "A compatibility layer for running Windows programs (WOW64 with TkG-Staging and NTSYNC patches).")
    (home-page "https://github.com/Kron4ek/Wine-Builds")
    (license license:lgpl2.1+)))

(define-public wine-tkg-staging-wow64-bin
  (package
    (name "wine-tkg-staging-wow64-bin")
    (version "11.5")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Kron4ek/Wine-Builds")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"))))
    (synopsis "a compatibility layer for running Windows programs (WOW64 with TkG-Staging ..")
    (description "A compatibility layer for running Windows programs (WOW64 with TkG-Staging patches).")
    (home-page "https://github.com/Kron4ek/Wine-Builds")
    (license license:lgpl2.1+)))

(define-public zenkit
  (package
    (name "zenkit")
    (version "3.1.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/zenkit.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a platform for collaboration and project management")
    (description "A platform for collaboration and project management.")
    (home-page "https://zenkit.com")
    (license license:non-copyleft)))

(define-public binaryninja-personal
  (package
    (name "binaryninja-personal")
    (version "5.2.8614")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/binaryninja-personal.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "an interactive decompiler, disassembler, debugger, and binary analysis plat..")
    (description "An interactive decompiler, disassembler, debugger, and binary analysis platform. This package is for the Personal Edition and requires both an installer zip (x86 or ARM) and a license.")
    (home-page "https://binary.ninja")
    (license license:non-copyleft)))

(define-public bobcat-terminal-git
  (package
    (name "bobcat-terminal-git")
    (version "r319.e4e5f19")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ismail-yilmaz/Bobcat")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a powerful yet user-friendy cross-platform terminal emulator")
    (description "A powerful yet user-friendy cross-platform terminal emulator.")
    (home-page "https://github.com/ismail-yilmaz/Bobcat")
    (license license:gpl3+)))

(define-public cairo-dock-plug-ins-wayland-git
  (package
    (name "cairo-dock-plug-ins-wayland-git")
    (version "3.6.90.20251025.8aacf61f8")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Cairo-Dock/cairo-dock-plug-ins")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "plugins for Cairo-Dock with wayland support")
    (description "Plugins for Cairo-Dock with wayland support.")
    (home-page "https://github.com/Cairo-Dock/cairo-dock-plug-ins")
    (license license:gpl3+)))

(define-public dvdae-bin
  (package
    (name "dvdae-bin")
    (version "8.8.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/dvdae-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"))))
    (synopsis "dVD audio extract & ripping tool for extracting streams from DVD-Audio & Vi..")
    (description "DVD audio extract & ripping tool for extracting streams from DVD-Audio & Video discs and save them as OGG, MP3, Wave or FLAC files.")
    (home-page "https://www.dvdae.com/")
    (license license:non-copyleft)))

(define-public git-it
  (package
    (name "git-it")
    (version "6.0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Git-it-App/git-it-electron")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "desktop app that teaches you how to use Git and GitHub on the command line")
    (description "Desktop app that teaches you how to use Git and GitHub on the command line.")
    (home-page "https://github.com/Git-it-App/git-it-electron")
    (license license:bsd-3)))

(define-public mesen
  (package
    (name "mesen")
    (version "2.1.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/SourMesen/Mesen2")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "multi-system emulator (NES, SNES, GB, GBA, PCE, SMS/GG, WS) for Windows, Li..")
    (description "Multi-system emulator (NES, SNES, GB, GBA, PCE, SMS/GG, WS) for Windows, Linux and macOS.")
    (home-page "https://github.com/SourMesen/Mesen2")
    (license license:gpl3+)))

(define-public nekobox
  (package
    (name "nekobox")
    (version "5.10.38")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/qr243vbi/nekobox")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "cross-platform GUI proxy utility (Empowered by sing-box)")
    (description "Cross-platform GUI proxy utility (Empowered by sing-box).")
    (home-page "https://github.com/qr243vbi/nekobox")
    (license license:gpl3+)))

(define-public nekobox-core
  (package
    (name "nekobox-core")
    (version "5.10.38")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/qr243vbi/nekobox")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "cross-platform GUI proxy utility (Empowered by sing-box)")
    (description "Cross-platform GUI proxy utility (Empowered by sing-box).")
    (home-page "https://github.com/qr243vbi/nekobox")
    (license license:gpl3+)))

(define-public pix2tex
  (package
    (name "pix2tex")
    (version "0.1.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/lukas-blecher/LaTeX-OCR")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "using a ViT to convert images of equations into LaTeX code")
    (description "Using a ViT to convert images of equations into LaTeX code.")
    (home-page "https://github.com/lukas-blecher/LaTeX-OCR")
    (license license:expat)))

(define-public snes9x-qt-git
  (package
    (name "snes9x-qt-git")
    (version "1.63.r146.g5110899f")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/snes9x-qt-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "portable Emulator for the Super Nintendo Entertainment System - Qt version")
    (description "Portable Emulator for the Super Nintendo Entertainment System - Qt version.")
    (home-page "http://www.snes9x.com/")
    (license license:non-copyleft)))

(define-public torzu
  (package
    (name "torzu")
    (version "2025.04.16")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/torzu.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "torzu is a fork of yuzu, the world's most popular, open-source, Nintendo Sw..")
    (description "Torzu is a fork of yuzu, the world's most popular, open-source, Nintendo Switch emulator. It is written in C++ with portability in mind.")
    (home-page "https://notabug.org/litucks/torzu")
    (license license:gpl3+)))

(define-public caelestia-shell-git
  (package
    (name "caelestia-shell-git")
    (version "1.2.0.r0.g2bd7089")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/caelestia-dots/shell")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the desktop shell for the Caelestia dotfiles")
    (description "The desktop shell for the Caelestia dotfiles.")
    (home-page "https://github.com/caelestia-dots/shell")
    (license license:gpl3+)))

(define-public organicmaps
  (package
    (name "organicmaps")
    (version "2026.03.12_2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/organicmaps.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "organic Maps: Offline Hike, Bike, Trails and Navigation")
    (description "Organic Maps: Offline Hike, Bike, Trails and Navigation.")
    (home-page "https://organicmaps.app")
    (license license:asl2.0)))

(define-public penpot
  (package
    (name "penpot")
    (version "2.14.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/penpot.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the open-source design tool for design and code collaboration")
    (description "The open-source design tool for design and code collaboration.")
    (home-page "https://penpot.app")
    (license license:mpl2.0)))

(define-public shortwave-mpris-git
  (package
    (name "shortwave-mpris-git")
    (version "5.1.0.r9.g9586a15")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ixnewton/Shortwave-MPRIS")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "internet radio player with extended MPRIS support, device support for DLNA/..")
    (description "Internet radio player with extended MPRIS support, device support for DLNA/UPnP & Google Cast + FFmpeg proxy for incompatible streams.")
    (home-page "https://github.com/ixnewton/Shortwave-MPRIS")
    (license license:gpl3+)))

(define-public snes9x-git
  (package
    (name "snes9x-git")
    (version "1.63.r146.g5110899f")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/snes9x-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "portable Emulator for the Super Nintendo Entertainment System - git version")
    (description "Portable Emulator for the Super Nintendo Entertainment System - git version.")
    (home-page "http://www.snes9x.com/")
    (license license:non-copyleft)))

(define-public snes9x-gtk-git
  (package
    (name "snes9x-gtk-git")
    (version "1.63.r146.g5110899f")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/snes9x-gtk-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "portable Emulator for the Super Nintendo Entertainment System - GTK version..")
    (description "Portable Emulator for the Super Nintendo Entertainment System - GTK version (git).")
    (home-page "http://www.snes9x.com/")
    (license license:non-copyleft)))

(define-public sparkle-bin
  (package
    (name "sparkle-bin")
    (version "1.26.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/xishang0128/sparkle")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"))))
    (synopsis "another Mihomo GUI")
    (description "Another Mihomo GUI.")
    (home-page "https://github.com/xishang0128/sparkle")
    (license license:gpl3+)))

(define-public yaak
  (package
    (name "yaak")
    (version "2026.3.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/yaak.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "fast, offline and Git-friendly API client for HTTP, GraphQL, WebSockets, SS..")
    (description "Fast, offline and Git-friendly API client for HTTP, GraphQL, WebSockets, SSE, and gRPC.")
    (home-page "https://yaak.app/")
    (license license:expat)))

(define-public devtools-doas
  (package
    (name "devtools-doas")
    (version "1:1.5.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/devtools-doas.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "tools for Arch Linux package maintainers (patched for opendoas)")
    (description "Tools for Arch Linux package maintainers (patched for opendoas).")
    (home-page "https://gitlab.archlinux.org/archlinux/devtools")
    (license license:gpl3+)))

(define-public llvm-libs-git
  (package
    (name "llvm-libs-git")
    (version "18.0.0_r484887.953ae94149f0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/llvm-libs-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "runtime libraries for llvm-git")
    (description "Runtime libraries for llvm-git.")
    (home-page "https://llvm.org/")
    (license license:non-copyleft)))

(define-public omnetpp
  (package
    (name "omnetpp")
    (version "6.3.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/omnetpp.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "component-based simulation package designed for modeling communication netw..")
    (description "Component-based simulation package designed for modeling communication networks.")
    (home-page "http://www.omnetpp.org")
    (license license:non-copyleft)))
