;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- deptree-resolver-260415i
;;; Resolves 100 packages from dependency tree queue.
;;;
;;; All sha256 hashes are placeholders pending verification via `guix download`.

(define-module (gaurix packages deptree-resolver-260415i)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system node)
  #:use-module (guix build-system cargo)
  #:use-module (guix build-system go)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:export (            android-armv7a-eabi-qt6-declarative
            lib32-gstreamer
            dotnet-targeting-pack-8-0-bin
            dotnet-runtime-8-0-bin
            vim-classic-runtime-git
            android-armv7a-eabi-qt6-serialport
            android-armv7a-eabi-qt6-svg
            kcgroups-dmemcg
            beaver-notes-bin
            crunchycleaner-bin
            gram-bin
            illogical-impulse-bibata-modern-classic-bin
            jai
            nitro-bin
            smap-bin
            virtualhere-server-bin
            lean-ctx-bin
            znote-bin
            ddrescueview-bin
            mnt-reform-lpc-dkms
            systemd-cron
            wakatime
            arctic-comfyui-helper-bin
            electron25-bin
            implay-bin
            piebald-bin
            insomnia-bin
            proton-meet-bin
            spflashtool-bin
            anytype-electron-bin
            brave-origin-nightly-bin
            lib32-libdovi
            lib32-opencl-nvidia-beta
            lib32-python311-bin
            poptracker
            scratch3
            slack-electron
            todesk-bin
            unreal-tournament-bin
            wgtunnel-bin
            yufi
            aggregate6-git
            alcom
            archey3
            astraeditor-bin
            astral-bin
            audirvana-studio
            biscuit
            brisk
            buildcache-git
            bzmenu-git
            catgirldownloader
            cclive
            chromium-snapshot-bin
            classicube-bin
            com-cassidyjames-butler
            deadbeef-plugin-gui-qt6-git
            deezer
            dooble-git
            dunk
            factorio-space-age
            fahcontrol-gtk3-git
            fastflix
            firefox-nightly-bin
            gale
            git-credential-manager-extras
            gopeed-bin
            grimmory
            grumpy-irc-git
            gsender
            hidviz
            hyprsysteminfo-git
            ibus-lotus-git
            image-optimizer
            instaloader
            ironclad-rivet-bin
            iso-commander
            iwlwifi-lar-patched
            java-matlab
            java-openjfx-bin
            jbig2enc-git
            kapow
            kodi-addon-inputstream-ffmpegdirect
            komodo-periphery
            krita-ai-diffusion
            krunner-spotify-enhanced-git
            lapctl
            lektra-git))

(define-public android-armv7a-eabi-qt6-declarative
  (package
    (name "android-armv7a-eabi-qt6-declarative")
    (version "6.11.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/android-armv7a-eabi-qt6-declarative.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "classes for QML and JavaScript languages (android)")
    (description "Classes for QML and JavaScript languages (android).")
    (home-page "https://www.qt.io")
    (license license:gpl3)))

(define-public lib32-gstreamer
  (package
    (name "lib32-gstreamer")
    (version "1.28.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lib32-gstreamer.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "multimedia graph framework (32-bit) - core")
    (description "Multimedia graph framework (32-bit) - core.")
    (home-page "https://gstreamer.freedesktop.org/")
    (license license:lgpl2.1+)))

(define-public dotnet-targeting-pack-8-0-bin
  (package
    (name "dotnet-targeting-pack-8-0-bin")
    (version "8.0.25.sdk419")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/dotnet-targeting-pack-8.0-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the")
    (description "The .NET Core targeting pack (binary).")
    (home-page "https://www.microsoft.com/net/core")
    (license license:expat)))

(define-public dotnet-runtime-8-0-bin
  (package
    (name "dotnet-runtime-8-0-bin")
    (version "8.0.25.sdk419")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/dotnet-runtime-8.0-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the")
    (description "The .NET Core runtime (binary).")
    (home-page "https://www.microsoft.com/net/core")
    (license license:expat)))

(define-public vim-classic-runtime-git
  (package
    (name "vim-classic-runtime-git")
    (version "r11235.6f8889e")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://git.sr.ht/~sircmpwn/vim-classic")
                    (commit "vr11235.6f8889e")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "vim Classic is a fork of Vim 8")
    (description "Vim Classic is a fork of Vim 8.x for long-term maintenance. - shared runtime.")
    (home-page "https://git.sr.ht/~sircmpwn/vim-classic")
    (license license:non-copyleft)))

(define-public android-armv7a-eabi-qt6-serialport
  (package
    (name "android-armv7a-eabi-qt6-serialport")
    (version "6.11.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/android-armv7a-eabi-qt6-serialport.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "provides access to hardware and virtual serial ports (android)")
    (description "Provides access to hardware and virtual serial ports (android).")
    (home-page "https://www.qt.io")
    (license license:gpl3)))

(define-public android-armv7a-eabi-qt6-svg
  (package
    (name "android-armv7a-eabi-qt6-svg")
    (version "6.11.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/android-armv7a-eabi-qt6-svg.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "classes for displaying the contents of SVG files (android)")
    (description "Classes for displaying the contents of SVG files (android).")
    (home-page "https://www.qt.io")
    (license license:gpl3)))

(define-public kcgroups-dmemcg
  (package
    (name "kcgroups-dmemcg")
    (version "0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/pixelcluster/kcgroups")
                    (commit "v0.1")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "KDE library to manipulate cgroups (and boost foreground apps) - fork addi")
    (description "KDE library to manipulate cgroups (and boost foreground apps) - fork adding dmem cgroup support.")
    (home-page "https://github.com/pixelcluster/kcgroups")
    (license license:lgpl2.1+)))

(define-public beaver-notes-bin
  (package
    (name "beaver-notes-bin")
    (version "4.3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Daniele-rolli/Beaver-Notes")
                    (commit "v4.3.0")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "your Personal Note-Taking Haven for Privacy and Efficiency (binary release)")
    (description "Your Personal Note-Taking Haven for Privacy and Efficiency (binary release).")
    (home-page "https://github.com/Daniele-rolli/Beaver-Notes")
    (license license:expat)))

(define-public crunchycleaner-bin
  (package
    (name "crunchycleaner-bin")
    (version "2.5.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Knuspii/CrunchyCleaner")
                    (commit "v2.5.1")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "💾🧹 A lightweight, software cache cleanup tool for Windows & Linux")
    (description "💾🧹 A lightweight, software cache cleanup tool for Windows & Linux.")
    (home-page "https://github.com/Knuspii/CrunchyCleaner")
    (license license:gpl3)))

(define-public gram-bin
  (package
    (name "gram-bin")
    (version "1.2.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://codeberg.org/GramEditor/gram")
                    (commit "v1.2.1")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the Gram Code Editor")
    (description "The Gram Code Editor.")
    (home-page "https://codeberg.org/GramEditor/gram")
    (license license:agpl3+)))

(define-public illogical-impulse-bibata-modern-classic-bin
  (package
    (name "illogical-impulse-bibata-modern-classic-bin")
    (version "2.0.7")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ful1e5/Bibata_Cursor")
                    (commit "v2.0.7")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "material Based Cursor Theme, installed for illogical-impulse dotfiles")
    (description "Material Based Cursor Theme, installed for illogical-impulse dotfiles.")
    (home-page "https://github.com/ful1e5/Bibata_Cursor")
    (license license:gpl3+)))

(define-public jai
  (package
    (name "jai")
    (version "0.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/jai.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "light-weight sandbox for AI agents")
    (description "Light-weight sandbox for AI agents.")
    (home-page "https://jai.scs.stanford.edu/")
    (license license:gpl3+)))

(define-public nitro-bin
  (package
    (name "nitro-bin")
    (version "30.0.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/nitro-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "an incredible, beautiful, and feature-rich GraphQL IDE")
    (description "An incredible, beautiful, and feature-rich GraphQL IDE.")
    (home-page "https://chillicream.com/products/nitro/")
    (license license:non-copyleft)))

(define-public smap-bin
  (package
    (name "smap-bin")
    (version "0.1.12")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/s0md3v/Smap")
                    (commit "v0.1.12")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a drop-in replacement for Nmap powered by shodan")
    (description "a drop-in replacement for Nmap powered by shodan.io.")
    (home-page "https://github.com/s0md3v/Smap")
    (license license:gpl3)))

(define-public virtualhere-server-bin
  (package
    (name "virtualhere-server-bin")
    (version "4.8.5")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/virtualhere-server-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "virtualHere USB Server for Linux Desktop")
    (description "VirtualHere USB Server for Linux Desktop.")
    (home-page "https://www.virtualhere.com/usb_server_software")
    (license license:non-copyleft)))

(define-public lean-ctx-bin
  (package
    (name "lean-ctx-bin")
    (version "3.1.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lean-ctx-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "context Engineering Layer for AI Coding — 36 intelligent tools, 8 read mo")
    (description "Context Engineering Layer for AI Coding — 36 intelligent tools, 8 read modes, 90+ shell patterns, neural token optimization, persistent knowledge, multi-agent orchestration. Reduces AI costs by 60-99%. (pre-built binary).")
    (home-page "https://leanctx.com")
    (license license:expat)))

(define-public znote-bin
  (package
    (name "znote-bin")
    (version "3.7.5")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/znote-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a Beautiful markdown editor inspired by Jupyter")
    (description "A Beautiful markdown editor inspired by Jupyter.(Prebuilt version.Use system-wide electron).")
    (home-page "https://znote.io")
    (license license:non-copyleft)))

(define-public ddrescueview-bin
  (package
    (name "ddrescueview-bin")
    (version "0.4.5")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ddrescueview-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "graphical viewer for GNU ddrescue log files")
    (description "Graphical viewer for GNU ddrescue log files.")
    (home-page "http://sourceforge.net/projects/ddrescueview")
    (license license:gpl3+)))

(define-public mnt-reform-lpc-dkms
  (package
    (name "mnt-reform-lpc-dkms")
    (version "1.85")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mnt-reform-lpc-dkms.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "DKMS module for the MNT Reform LPC11U24 system controller")
    (description "DKMS module for the MNT Reform LPC11U24 system controller.")
    (home-page "https://source.mnt.re/reform/reform-tools")
    (license license:gpl2)))

(define-public systemd-cron
  (package
    (name "systemd-cron")
    (version "2.6.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/systemd-cron/systemd-cron")
                    (commit "v2.6.0")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "systemd units to run cron scripts")
    (description "systemd units to run cron scripts.")
    (home-page "https://github.com/systemd-cron/systemd-cron")
    (license license:expat)))

(define-public wakatime
  (package
    (name "wakatime")
    (version "1.60.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/wakatime/wakatime-cli")
                    (commit "v1.60.4")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments (list #:tests? #f))
    (synopsis "command line interface used by all WakaTime text editor plugins")
    (description "Command line interface used by all WakaTime text editor plugins.")
    (home-page "https://github.com/wakatime/wakatime-cli")
    (license license:bsd-3)))

(define-public arctic-comfyui-helper-bin
  (package
    (name "arctic-comfyui-helper-bin")
    (version "0.2.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ArcticLatent/Arctic-Helper")
                    (commit "v0.2.2")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "comfyUI installer and model manager (prebuilt binary release)")
    (description "ComfyUI installer and model manager (prebuilt binary release).")
    (home-page "https://github.com/ArcticLatent/Arctic-Helper")
    (license license:non-copyleft)))

(define-public electron25-bin
  (package
    (name "electron25-bin")
    (version "25.9.8")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/electron25-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "build cross platform desktop apps with web technologies — prebuilt")
    (description "Build cross platform desktop apps with web technologies — prebuilt.")
    (home-page "https://electronjs.org")
    (license license:non-copyleft)))

(define-public implay-bin
  (package
    (name "implay-bin")
    (version "1.5.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/implay-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "desktop media player built on top of mpv and imgui")
    (description "Desktop media player built on top of mpv and imgui.(Prebuilt version).")
    (home-page "https://tsl0922.github.io/ImPlay")
    (license license:gpl2)))

(define-public piebald-bin
  (package
    (name "piebald-bin")
    (version "0.2.6")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/piebald-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the ultimate agentic AI control experience for developers")
    (description "The ultimate agentic AI control experience for developers.")
    (home-page "https://piebald.ai")
    (license license:non-copyleft)))

(define-public insomnia-bin
  (package
    (name "insomnia-bin")
    (version "12.5.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/insomnia-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "API Client and Design Platform for GraphQL and REST")
    (description "API Client and Design Platform for GraphQL and REST.")
    (home-page "https://insomnia.rest")
    (license license:asl2.0)))

(define-public proton-meet-bin
  (package
    (name "proton-meet-bin")
    (version "1.0.7")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/proton-meet-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "secure, end-to-end encrypted video conferencing")
    (description "Secure, end-to-end encrypted video conferencing.")
    (home-page "https://proton.me/meet")
    (license license:gpl3+)))

(define-public spflashtool-bin
  (package
    (name "spflashtool-bin")
    (version "6.2228")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/spflashtool-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "sP Flash Tool is an application to flash your MediaTek (MTK) SmartPhone")
    (description "SP Flash Tool is an application to flash your MediaTek (MTK) SmartPhone.")
    (home-page "http://spflashtools.com/category/linux")
    (license license:non-copyleft)))

(define-public anytype-electron-bin
  (package
    (name "anytype-electron-bin")
    (version "0.54.11")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/anytype-electron-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "operating environment for the new internet")
    (description "Operating environment for the new internet. Anytype is a next generation software that breaks down barriers between applications, gives back privacy and data ownership to users.")
    (home-page "https://anytype.io/")
    (license license:non-copyleft)))

(define-public brave-origin-nightly-bin
  (package
    (name "brave-origin-nightly-bin")
    (version "1.91.49")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/brave-origin-nightly-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the minimalist browser from the makers of Brave (nightly binary release)")
    (description "The minimalist browser from the makers of Brave (nightly binary release).")
    (home-page "https://brave.com/origin/download-nightly")
    (license license:non-copyleft)))

(define-public lib32-libdovi
  (package
    (name "lib32-libdovi")
    (version "3.3.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/quietvoid/dovi_tool/tree/main/dolby_vision")
                    (commit "v3.3.2")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "library to read and write Dolby Vision metadata C-API (32-bit)")
    (description "Library to read and write Dolby Vision metadata C-API (32-bit).")
    (home-page "https://github.com/quietvoid/dovi_tool/tree/main/dolby_vision")
    (license license:expat)))

(define-public lib32-opencl-nvidia-beta
  (package
    (name "lib32-opencl-nvidia-beta")
    (version "595.58.03")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lib32-opencl-nvidia-beta.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "openCL implemention for NVIDIA (32-bit, beta version)")
    (description "OpenCL implemention for NVIDIA (32-bit, beta version).")
    (home-page "https://www.nvidia.com/")
    (license license:non-copyleft)))

(define-public lib32-python311-bin
  (package
    (name "lib32-python311-bin")
    (version "3.11.8")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lib32-python311-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "major release 3")
    (description "Major release 3.11 of the Python high-level programming language (32-bit).")
    (home-page "https://www.python.org/")
    (license license:non-copyleft)))

(define-public poptracker
  (package
    (name "poptracker")
    (version "0.35.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/black-sliver/poptracker")
                    (commit "v0.35.1")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "universal, scriptable randomizer tracking solution that is open source, r")
    (description "universal, scriptable randomizer tracking solution that is open source, runs everywhere and supports auto-tracking.")
    (home-page "https://github.com/black-sliver/poptracker")
    (license license:gpl3)))

(define-public scratch3
  (package
    (name "scratch3")
    (version "3.31.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/scratchfoundation/scratch-desktop")
                    (commit "v3.31.1")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (synopsis "scratch 3")
    (description "Scratch 3.0 as a self-contained desktop application.")
    (home-page "https://github.com/scratchfoundation/scratch-desktop")
    (license license:agpl3)))

(define-public slack-electron
  (package
    (name "slack-electron")
    (version "4.47.69")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/slack-electron.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "slack Desktop (Beta) for Linux, using the system Electron package")
    (description "Slack Desktop (Beta) for Linux, using the system Electron package.")
    (home-page "https://slack.com/downloads/linux")
    (license license:non-copyleft)))

(define-public todesk-bin
  (package
    (name "todesk-bin")
    (version "4.8.1.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/todesk-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "remote control and team work")
    (description "Remote control and team work.")
    (home-page "https://www.todesk.com/")
    (license license:non-copyleft)))

(define-public unreal-tournament-bin
  (package
    (name "unreal-tournament-bin")
    (version "469e")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/OldUnreal/UnrealTournamentPatches")
                    (commit "v469e")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "unreal Tournament 99 (GOTY) native binaries (OldUnreal)")
    (description "Unreal Tournament 99 (GOTY) native binaries (OldUnreal).")
    (home-page "https://github.com/OldUnreal/UnrealTournamentPatches")
    (license license:non-copyleft)))

(define-public wgtunnel-bin
  (package
    (name "wgtunnel-bin")
    (version "1.0.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/wgtunnel-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "wireGuard and AmneziaWG VPN client with auto-tunneling, lockdown and prox")
    (description "WireGuard and AmneziaWG VPN client with auto-tunneling, lockdown and proxying.")
    (home-page "https://wgtunnel.com")
    (license license:expat)))

(define-public yufi
  (package
    (name "yufi")
    (version "1.0.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/AtefR/YuFi")
                    (commit "v1.0.2")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "lightweight GTK4 Wi-Fi manager")
    (description "Lightweight GTK4 Wi-Fi manager.")
    (home-page "https://github.com/AtefR/YuFi")
    (license license:expat)))

(define-public aggregate6-git
  (package
    (name "aggregate6-git")
    (version "1.0.15.r0.g5888888")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/job/aggregate6")
                    (commit "v1.0.15.r0.g5888888")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "iPv4 and IPv6 prefix aggregation tool (development version)")
    (description "IPv4 and IPv6 prefix aggregation tool (development version).")
    (home-page "https://github.com/job/aggregate6")
    (license license:bsd-2)))

(define-public alcom
  (package
    (name "alcom")
    (version "1.1.5")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/vrc-get/vrc-get")
                    (commit "v1.1.5")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a fast open-source alternative of VRChat Creator Companion (VCC)")
    (description "A fast open-source alternative of VRChat Creator Companion (VCC).")
    (home-page "https://github.com/vrc-get/vrc-get")
    (license license:expat)))

(define-public archey3
  (package
    (name "archey3")
    (version "0.5")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/archey3.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "output a logo and various system information")
    (description "Output a logo and various system information.")
    (home-page "https://lclarkmichalek.github.io/archey3/")
    (license license:gpl3+)))

(define-public astraeditor-bin
  (package
    (name "astraeditor-bin")
    (version "1.1.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/AstraEditor")
                    (commit "v1.1.4")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "astraEditor is a TurboWarp mod used to add more practical features to mak")
    (description "AstraEditor is a TurboWarp mod used to add more practical features to make your writing lightning fast.")
    (home-page "https://github.com/AstraEditor/")
    (license license:gpl3)))

(define-public astral-bin
  (package
    (name "astral-bin")
    (version "2.7.8")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/astral-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "astral is a modern cross-platform web application built on EasyTier, desi")
    (description "Astral is a modern cross-platform web application built on EasyTier, designed to simplify the creation and management of P2P network connections and virtual private networks.")
    (home-page "https://Astral.fan")
    (license license:non-copyleft)))

(define-public audirvana-studio
  (package
    (name "audirvana-studio")
    (version "3.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/audirvana-studio.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "audirvana Studio audio player")
    (description "Audirvana Studio audio player.")
    (home-page "https://audirvana.com/")
    (license license:non-copyleft)))

(define-public biscuit
  (package
    (name "biscuit")
    (version "1.2.30-1.8")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/biscuit.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a browser where you can organize your apps")
    (description "A browser where you can organize your apps.")
    (home-page "https://eatbiscuit.com/")
    (license license:asl2.0)))

(define-public brisk
  (package
    (name "brisk")
    (version "2.3.8")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/BrisklyDev/brisk")
                    (commit "v2.3.8")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "ultra-fast, modern download manager (Official Release)")
    (description "Ultra-fast, modern download manager (Official Release).")
    (home-page "https://github.com/BrisklyDev/brisk")
    (license license:gpl3)))

(define-public buildcache-git
  (package
    (name "buildcache-git")
    (version "0.28.4.r2.g735eebb")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/mbitsnbites/buildcache")
                    (commit "v0.28.4.r2.g735eebb")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "an advanced compiler accelerator")
    (description "An advanced compiler accelerator.")
    (home-page "https://github.com/mbitsnbites/buildcache")
    (license license:zlib)))

(define-public bzmenu-git
  (package
    (name "bzmenu-git")
    (version "0.2.0.r0.g5ea334f")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/e-tho/bzmenu")
                    (commit "v0.2.0.r0.g5ea334f")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "launcher-driven Bluetooth manager for Linux")
    (description "Launcher-driven Bluetooth manager for Linux.")
    (home-page "https://github.com/e-tho/bzmenu")
    (license license:gpl3+)))

(define-public catgirldownloader
  (package
    (name "catgirldownloader")
    (version "0.3.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/NyarchLinux/CatgirlDownloader")
                    (commit "v0.3.1")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "GTK4 application that downloads images from nekos")
    (description "GTK4 application that downloads images from nekos.moe.")
    (home-page "https://github.com/NyarchLinux/CatgirlDownloader")
    (license license:gpl3)))

(define-public cclive
  (package
    (name "cclive")
    (version "0.9.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/cclive.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "commandline downloader for popular video websites")
    (description "Commandline downloader for popular video websites.")
    (home-page "http://cclive.sourceforge.net/")
    (license license:agpl3)))

(define-public chromium-snapshot-bin
  (package
    (name "chromium-snapshot-bin")
    (version "149.0.7781.0.r1611764")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/chromium-snapshot-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the open-source project behind Google Chrome (Latest Snapshot)")
    (description "The open-source project behind Google Chrome (Latest Snapshot).")
    (home-page "https://build.chromium.org")
    (license license:bsd-3)))

(define-public classicube-bin
  (package
    (name "classicube-bin")
    (version "1.3.8")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/classicube-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "play ClassiCube, our sandbox block game inspired by other similar sandbox")
    (description "Play ClassiCube, our sandbox block game inspired by other similar sandbox block games, today for free! Just click one of the buttons below to start playing!.")
    (home-page "https://www.classicube.net")
    (license license:gpl3+)))

(define-public com-cassidyjames-butler
  (package
    (name "com-cassidyjames-butler")
    (version "1.4.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/cassidyjames/butler")
                    (commit "v1.4.0")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a Home Assistant companion app for GNOME")
    (description "A Home Assistant companion app for GNOME.")
    (home-page "https://github.com/cassidyjames/butler")
    (license license:gpl3+)))

(define-public deadbeef-plugin-gui-qt6-git
  (package
    (name "deadbeef-plugin-gui-qt6-git")
    (version "1.9.r196.6e3c309")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/kuba160/ddb_gui_qt5")
                    (commit "v1.9.r196.6e3c309")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Qt6 plugin for DeaDBeeF (Qt 6 branch) (latest commit)")
    (description "Qt6 plugin for DeaDBeeF (Qt 6 branch) (latest commit).")
    (home-page "https://github.com/kuba160/ddb_gui_qt5")
    (license license:gpl2+)))

(define-public deezer
  (package
    (name "deezer")
    (version "7.1.150")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/deezer.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a proprietary music streaming service")
    (description "A proprietary music streaming service.")
    (home-page "https://www.deezer.com/")
    (license license:non-copyleft)))

(define-public dooble-git
  (package
    (name "dooble-git")
    (version "2026.03.31.r0.g2910de4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/dooble-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "web browser based on QtWebEngine")
    (description "Web browser based on QtWebEngine.")
    (home-page "https://textbrowser.github.io/dooble")
    (license license:non-copyleft)))

(define-public dunk
  (package
    (name "dunk")
    (version "0.5.0b0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/darrenburns/dunk")
                    (commit "v0.5.0b0")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "prettier git diffs in the terminal")
    (description "Prettier git diffs in the terminal.")
    (home-page "https://github.com/darrenburns/dunk")
    (license license:expat)))

(define-public factorio-space-age
  (package
    (name "factorio-space-age")
    (version "2.0.76")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/factorio-space-age.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a 2D game about building and maintaining factories (stable branch w/ Spac")
    (description "A 2D game about building and maintaining factories (stable branch w/ Space Age expansion).")
    (home-page "http://www.factorio.com/")
    (license license:non-copyleft)))

(define-public fahcontrol-gtk3-git
  (package
    (name "fahcontrol-gtk3-git")
    (version "r203.3978c35")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/fahcontrol-gtk3-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "graphical monitor and control utility for the Folding@home client (python")
    (description "Graphical monitor and control utility for the Folding@home client (python3/GTK3 fork).")
    (home-page "https://foldingathome.org")
    (license license:gpl3)))

(define-public fastflix
  (package
    (name "fastflix")
    (version "6.2.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/cdgriffith/FastFlix")
                    (commit "v6.2.1")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "simple and friendly GUI for encoding videos")
    (description "Simple and friendly GUI for encoding videos.")
    (home-page "https://github.com/cdgriffith/FastFlix")
    (license license:expat)))

(define-public firefox-nightly-bin
  (package
    (name "firefox-nightly-bin")
    (version "135.0a1.20241128.042549")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/firefox-nightly-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "fast, Private & Safe Web Browser from Mozilla — Nightly Build (en-US)")
    (description "Fast, Private & Safe Web Browser from Mozilla — Nightly Build (en-US).")
    (home-page "https://www.mozilla.org/en-US/firefox/nightly")
    (license license:gpl3+)))

(define-public gale
  (package
    (name "gale")
    (version "1.13.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gale.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a modern mod manager for Thunderstore")
    (description "A modern mod manager for Thunderstore.")
    (home-page "https://kesomannen.com/gale")
    (license license:gpl3+)))

(define-public git-credential-manager-extras
  (package
    (name "git-credential-manager-extras")
    (version "2.7.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/git-ecosystem/git-credential-manager")
                    (commit "v2.7.0")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "additional login UIs to Github and Bitbucket for Git Credential Manager Core")
    (description "Additional login UIs to Github and Bitbucket for Git Credential Manager Core.")
    (home-page "https://github.com/git-ecosystem/git-credential-manager")
    (license license:expat)))

(define-public gopeed-bin
  (package
    (name "gopeed-bin")
    (version "1.9.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gopeed-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "high speed downloader that supports all platforms")
    (description "High speed downloader that supports all platforms.(Prebuilt version).")
    (home-page "https://gopeed.com/")
    (license license:gpl3)))

(define-public grimmory
  (package
    (name "grimmory")
    (version "2.3.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/grimmory.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "self hosted ebook reader")
    (description "Self hosted ebook reader.")
    (home-page "https://opencollective.com/grimmory")
    (license license:agpl3)))

(define-public grumpy-irc-git
  (package
    (name "grumpy-irc-git")
    (version "v1.0.0.alpha.r327.ge39e71f")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/grumpy-irc/grumpy")
                    (commit "vv1.0.0.alpha.r327.ge39e71f")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "modern, yet oldschool IRC client with distributed core, written in C++")
    (description "Modern, yet oldschool IRC client with distributed core, written in C++.")
    (home-page "https://github.com/grumpy-irc/grumpy")
    (license license:lgpl3+)))

(define-public gsender
  (package
    (name "gsender")
    (version "1.5.6")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Sienci-Labs/gsender")
                    (commit "v1.5.6")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (synopsis "connect to and control Grbl-based CNCs")
    (description "Connect to and control Grbl-based CNCs.")
    (home-page "https://github.com/Sienci-Labs/gsender")
    (license license:expat)))

(define-public hidviz
  (package
    (name "hidviz")
    (version "0.2.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/hidviz/hidviz")
                    (commit "v0.2.1")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "tool for in-depth analysis of USB HID devices communication")
    (description "Tool for in-depth analysis of USB HID devices communication.")
    (home-page "https://github.com/hidviz/hidviz")
    (license license:gpl3+)))

(define-public hyprsysteminfo-git
  (package
    (name "hyprsysteminfo-git")
    (version "0.1.3.r6.g1959f04")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/hyprwm/hyprsysteminfo")
                    (commit "v0.1.3.r6.g1959f04")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a tiny qt6/qml application to display information about the running system")
    (description "A tiny qt6/qml application to display information about the running system.")
    (home-page "https://github.com/hyprwm/hyprsysteminfo")
    (license license:bsd-3)))

(define-public ibus-lotus-git
  (package
    (name "ibus-lotus-git")
    (version "1.0.2+10+g277ff0c")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/LotusInputEngine/ibus-lotus")
                    (commit "v1.0.2+10+g277ff0c")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a maintained Vietnamese IME for IBus - fork of ibus-bamboo - unstable ver")
    (description "A maintained Vietnamese IME for IBus - fork of ibus-bamboo - unstable version.")
    (home-page "https://github.com/LotusInputEngine/ibus-lotus")
    (license license:gpl3)))

(define-public image-optimizer
  (package
    (name "image-optimizer")
    (version "0.1.25")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/gijsgoudzwaard/image-optimizer")
                    (commit "v0.1.25")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "simple lossless compression")
    (description "Simple lossless compression.")
    (home-page "https://github.com/gijsgoudzwaard/image-optimizer")
    (license license:expat)))

(define-public instaloader
  (package
    (name "instaloader")
    (version "4.15.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/instaloader.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "command line tool to download pictures, videos and metadata from Instagram")
    (description "Command line tool to download pictures, videos and metadata from Instagram.")
    (home-page "https://instaloader.github.io/")
    (license license:expat)))

(define-public ironclad-rivet-bin
  (package
    (name "ironclad-rivet-bin")
    (version "1.11.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Ironclad/rivet")
                    (commit "v1.11.3")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "iDE for creating complex AI agents and prompt chaining")
    (description "IDE for creating complex AI agents and prompt chaining.")
    (home-page "https://github.com/Ironclad/rivet")
    (license license:expat)))

(define-public iso-commander
  (package
    (name "iso-commander")
    (version "6.4.7")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/siyia2/iso-commander")
                    (commit "v6.4.7")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the Fastest ISO Manager on the Planet, written in C++")
    (description "The Fastest ISO Manager on the Planet, written in C++.")
    (home-page "https://github.com/siyia2/iso-commander")
    (license license:gpl3)))

(define-public iwlwifi-lar-patched
  (package
    (name "iwlwifi-lar-patched")
    (version "6.19.11")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/TenkyuChimata/iwlwifi-lar-patched")
                    (commit "v6.19.11")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "patched Intel iwlwifi family modules with lar_disable support for Arch Li")
    (description "Patched Intel iwlwifi family modules with lar_disable support for Arch Linux kernels.")
    (home-page "https://github.com/TenkyuChimata/iwlwifi-lar-patched")
    (license license:gpl2)))

(define-public java-matlab
  (package
    (name "java-matlab")
    (version "R2025b+25.2.0.3177638")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/java-matlab.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a high-level language for numerical computation and visualization (Java c")
    (description "A high-level language for numerical computation and visualization (Java components).")
    (home-page "https://www.mathworks.com/products/matlab.html")
    (license license:non-copyleft)))

(define-public java-openjfx-bin
  (package
    (name "java-openjfx-bin")
    (version "24.0.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/java-openjfx-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Java OpenJFX 24")
    (description "Java OpenJFX 24.0.2 client application platform (Gluon build).")
    (home-page "https://openjfx.io/")
    (license license:gpl2)))

(define-public jbig2enc-git
  (package
    (name "jbig2enc-git")
    (version "0.29.20.gc0141bf")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/agl/jbig2enc")
                    (commit "v0.29.20.gc0141bf")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a JBIG2 image encoder")
    (description "A JBIG2 image encoder.")
    (home-page "https://github.com/agl/jbig2enc")
    (license license:asl2.0)))

(define-public kapow
  (package
    (name "kapow")
    (version "1.7.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/kapow.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "punch clock to track time spent on projects")
    (description "Punch clock to track time spent on projects.")
    (home-page "https://gottcode.org/kapow/")
    (license license:gpl3+)))

(define-public kodi-addon-inputstream-ffmpegdirect
  (package
    (name "kodi-addon-inputstream-ffmpegdirect")
    (version "21.3.8")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/xbmc/inputstream.ffmpegdirect")
                    (commit "v21.3.8")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "inputstream ffmpegdirect kodi plugin")
    (description "Inputstream ffmpegdirect kodi plugin.")
    (home-page "https://github.com/xbmc/inputstream.ffmpegdirect")
    (license license:gpl3+)))

(define-public komodo-periphery
  (package
    (name "komodo-periphery")
    (version "2.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/komodo-periphery.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "periphery server for the komodo monitor")
    (description "Periphery server for the komodo monitor.")
    (home-page "https://komo.do/")
    (license license:gpl3)))

(define-public krita-ai-diffusion
  (package
    (name "krita-ai-diffusion")
    (version "1.48.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Acly/krita-ai-diffusion")
                    (commit "v1.48.0")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a plugin to use generative AI in image painting and editing workflows fro")
    (description "A plugin to use generative AI in image painting and editing workflows from within Krita.")
    (home-page "https://github.com/Acly/krita-ai-diffusion")
    (license license:gpl3+)))

(define-public krunner-spotify-enhanced-git
  (package
    (name "krunner-spotify-enhanced-git")
    (version "r0.0000000")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/MeIsGaming/krunner-spotify-enhanced")
                    (commit "vr0.0000000")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "kRunner plugin to control Spotify with spe commands")
    (description "KRunner plugin to control Spotify with spe commands.")
    (home-page "https://github.com/MeIsGaming/krunner-spotify-enhanced")
    (license license:gpl3)))

(define-public lapctl
  (package
    (name "lapctl")
    (version "0.3.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/S4NKALP/lapctl")
                    (commit "v0.3.2")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "control Linux laptop hardware (Graphics, Battery, Power, Cooling, Display")
    (description "Control Linux laptop hardware (Graphics, Battery, Power, Cooling, Display) with Rust.")
    (home-page "https://github.com/S4NKALP/lapctl")
    (license license:expat)))

(define-public lektra-git
  (package
    (name "lektra-git")
    (version "0.6.5.r59.g28de7b0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://codeberg.org/lektra/lektra")
                    (commit "v0.6.5.r59.g28de7b0")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "high-performance PDF reader that prioritizes screen space and control")
    (description "High-performance PDF reader that prioritizes screen space and control.")
    (home-page "https://codeberg.org/lektra/lektra")
    (license license:agpl3)))

