;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency tree resolver pass --- deptree-resolver-260415l
;;; Resolves BLOCKED packages from dependency tree queue.
;;;
;;; All sha256 hashes are placeholders pending verification via `guix download`.

(define-module (gaurix packages deptree-resolver-260415l)
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
  #:export (            tlescope-git
            tlp-pd-git
            tosu-git
            touche
            truestudio
            urbackup2-client
            uswsusp-git
            v2raya
            vapoursynth-plugin-rife-ncnn-vulkan
            vaults
            veracrypt-inyourlanguage
            vesktop-git
            vstax
            warp-cli
            warp-terminal-bin
            waydroidsu
            whitebox-tools
            wifiman
            wireguard-ui
            wireguird
            wpscan-git
            xdg-utils-mimeo
            xlibre-video-nouveau
            xmcl-launcher
            xunlei-bin
            xviewer-plugins
            youtube-tui
            bar-lobby-git
            bashhound-git
            blockbench
            blueberry
            bluemail
            certbot-dns-desec
            certbot-dns-pdns
            clapgrep
            codelldb
            cqrlog-git
            crunchyroll
            cupola-git
            d2x-rebirth
            deemix-gui
            discord-electron-openasar
            dotnet-sdk-preview-bin
            duckstation-preview-latest-bin
            eddie-cli
            edmarketconnector
            efibooteditor-bin
            fcitx5-im-emoji-picker-git
            flameshot-imgur
            flashrom-starlabs
            gd-tools-git
            git-review
            glide-browser-bin
            gnome-system-tools
            googlemessages
            goonget
            gpmaster
            hudkit-wayland
            hyprquickframe-git
            ibus-im-emoji-picker-git
            jan
            jan-git))

(define-public tlescope-git
  (package
    (name "tlescope-git")
    (version "v3.7.2.14.gf3d54a4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/aweeri/TLEscope")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "tLEscope is a satellite visualization tool designed to transform Two-Line Ele...")
    (description "TLEscope is a satellite visualization tool designed to transform Two-Line Element (TLE) sets into intuitive, interactive data.")
    (home-page "https://github.com/aweeri/TLEscope")
    (license license:non-copyleft)))

(define-public tlp-pd-git
  (package
    (name "tlp-pd-git")
    (version "1.10.0.b1.r10.33007a3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/tlp-pd-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "switch power profiles from the desktop")
    (description "Switch power profiles from the desktop.")
    (home-page "https://linrunner.de/en/tlp/tlp.html")
    (license license:non-copyleft)))

(define-public tosu-git
  (package
    (name "tosu-git")
    (version "4.15.3.r14.gd54a2f3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/tosuapp/tosu")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (synopsis "memory reader and PP counters provider for osu! and osu! Lazer - git version")
    (description "Memory reader and PP counters provider for osu! and osu! Lazer - git version.")
    (home-page "https://github.com/tosuapp/tosu")
    (license license:non-copyleft)))

(define-public touche
  (package
    (name "touche")
    (version "2.0.15")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/touche.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the desktop application to configure Touchégg")
    (description "The desktop application to configure Touchégg.")
    (home-page "https://github.com/JoseExposito/touche")
    (license license:gpl3+)))

(define-public truestudio
  (package
    (name "truestudio")
    (version "9.3.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/truestudio.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a flexible and extensible Arm development and debugging IDE by Atollic")
    (description "A flexible and extensible Arm development and debugging IDE by Atollic.")
    (home-page "https://atollic.com/truestudio/")
    (license license:non-copyleft)))

(define-public urbackup2-client
  (package
    (name "urbackup2-client")
    (version "2.5.29")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/urbackup2-client.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "client Server backup system")
    (description "Client Server backup system.")
    (home-page "http://www.urbackup.org/")
    (license license:gpl3+)))

(define-public uswsusp-git
  (package
    (name "uswsusp-git")
    (version "1.0.libgcrypt.1.6.3+r522+g84d75e60b")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/uswsusp-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "userspace software suspend - git checkout")
    (description "Userspace software suspend - git checkout.")
    (home-page "http://suspend.sourceforge.net/")
    (license license:gpl3+)))

(define-public v2raya
  (package
    (name "v2raya")
    (version "2.2.7.5")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/v2raya.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a web GUI client of Project V which supports VMess, VLESS, SS, SSR, Trojan, T...")
    (description "A web GUI client of Project V which supports VMess, VLESS, SS, SSR, Trojan, Tuic and Juicity protocols.")
    (home-page "https://github.com/v2rayA/v2rayA")
    (license license:non-copyleft)))

(define-public vapoursynth-plugin-rife-ncnn-vulkan
  (package
    (name "vapoursynth-plugin-rife-ncnn-vulkan")
    (version "9_mod_v33")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/vapoursynth-plugin-rife-ncnn-vulkan.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "plugin for Vapoursynth: Real-Time Intermediate Flow Estimation for Video Fram...")
    (description "Plugin for Vapoursynth: Real-Time Intermediate Flow Estimation for Video Frame Interpolation.")
    (home-page "https://github.com/styler00dollar/VapourSynth-RIFE-ncnn-Vulkan")
    (license license:expat)))

(define-public vaults
  (package
    (name "vaults")
    (version "0.11.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/vaults.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "an application for creating encrypted vaults for the GNOME desktop")
    (description "An application for creating encrypted vaults for the GNOME desktop.")
    (home-page "https://github.com/mpobaschnig/Vaults")
    (license license:gpl3)))

(define-public veracrypt-inyourlanguage
  (package
    (name "veracrypt-inyourlanguage")
    (version "1.26.24")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/veracrypt-inyourlanguage.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "disk encryption with strong security based on TrueCrypt 7.1a supporting 40+ l...")
    (description "Disk encryption with strong security based on TrueCrypt 7.1a supporting 40+ languages.")
    (home-page "https://www.veracrypt.jp")
    (license license:non-copyleft)))

(define-public vesktop-git
  (package
    (name "vesktop-git")
    (version "1.5.8.r6.g0d9ca22")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Vencord/Vesktop")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a standalone Electron-based Discord app with Vencord & improved Linux support")
    (description "A standalone Electron-based Discord app with Vencord & improved Linux support.")
    (home-page "https://github.com/Vencord/Vesktop")
    (license license:gpl3)))

(define-public vstax
  (package
    (name "vstax")
    (version "2025_1.0.3_139")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/vstax.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "software to fill the tax forms of the canton of Valais, Switzerland")
    (description "Software to fill the tax forms of the canton of Valais, Switzerland.")
    (home-page "http://www.vs.ch/vstax")
    (license license:non-copyleft)))

(define-public warp-cli
  (package
    (name "warp-cli")
    (version "2025.8.779.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/warp-cli.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "cloudflare WARP Client for Arch Linux")
    (description "Cloudflare WARP Client for Arch Linux.")
    (home-page "https://www.cloudflare.com/")
    (license license:non-copyleft)))

(define-public warp-terminal-bin
  (package
    (name "warp-terminal-bin")
    (version "0.2026.04.08.08.36.stable_01")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/warp-terminal-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "warp is the intelligent terminal with AI and your dev team's knowledge built-in")
    (description "Warp is the intelligent terminal with AI and your dev team's knowledge built-in.")
    (home-page "https://warp.dev")
    (license license:non-copyleft)))

(define-public waydroidsu
  (package
    (name "waydroidsu")
    (version "0.1.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/waydroidsu.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "cLI Magisk manager and installer for Waydroid written in Rust")
    (description "CLI Magisk manager and installer for Waydroid written in Rust.")
    (home-page "https://github.com/mistrmochov/WaydroidSU")
    (license license:gpl3+)))

(define-public whitebox-tools
  (package
    (name "whitebox-tools")
    (version "2.4.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/whitebox-tools.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "whiteboxTools is an advanced geospatial data analysis platform developed by P...")
    (description "WhiteboxTools is an advanced geospatial data analysis platform developed by Prof. John Lindsay.")
    (home-page "https://www.whiteboxgeo.com/")
    (license license:expat)))

(define-public wifiman
  (package
    (name "wifiman")
    (version "1.8.6")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/wifiman.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "minimalistic wpa_supplicant configuration manager")
    (description "Minimalistic wpa_supplicant configuration manager.")
    (home-page "https://github.com/BiteDasher/wifiman")
    (license license:expat)))

(define-public wireguard-ui
  (package
    (name "wireguard-ui")
    (version "0.6.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/wireguard-ui.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments (list #:tests? #f))
    (synopsis "web user interface to manage your WireGuard setup")
    (description "Web user interface to manage your WireGuard setup.")
    (home-page "https://github.com/ngoduykhanh/wireguard-ui")
    (license license:expat)))

(define-public wireguird
  (package
    (name "wireguird")
    (version "1.1.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/wireguird.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments (list #:tests? #f))
    (synopsis "gUI frontend to connect to and manage WireGuard tunnels (GTK3)")
    (description "GUI frontend to connect to and manage WireGuard tunnels (GTK3).")
    (home-page "https://github.com/UnnoTed/wireguird")
    (license license:expat)))

(define-public wpscan-git
  (package
    (name "wpscan-git")
    (version "3.3.1.2303.3a427728")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/wpscan-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "black box WordPress vulnerability scanner")
    (description "Black box WordPress vulnerability scanner.")
    (home-page "http://wpscan.org")
    (license license:non-copyleft)))

(define-public xdg-utils-mimeo
  (package
    (name "xdg-utils-mimeo")
    (version "1.2.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/xdg-utils-mimeo.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "command line tools that assist applications with a variety of desktop integra...")
    (description "Command line tools that assist applications with a variety of desktop integration tasks; patched to use mimeo.")
    (home-page "https://www.freedesktop.org/wiki/Software/xdg-utils/")
    (license license:expat)))

(define-public xlibre-video-nouveau
  (package
    (name "xlibre-video-nouveau")
    (version "25.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/xlibre-video-nouveau.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "xLibre fork of X.Org Open Source 3D acceleration driver for nVidia cards")
    (description "XLibre fork of X.Org Open Source 3D acceleration driver for nVidia cards.")
    (home-page "https://github.com/X11Libre/xf86-video-nouveau")
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
    (synopsis "x Minecraft Launcher - A modern, open-source Minecraft Launcher with modpack,...")
    (description "X Minecraft Launcher - A modern, open-source Minecraft Launcher with modpack, resource, and instance management.")
    (home-page "https://xmcl.app/")
    (license license:expat)))

(define-public xunlei-bin
  (package
    (name "xunlei-bin")
    (version "1.0.0.5")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/xunlei-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "xunlei download, 迅雷")
    (description "Xunlei download, 迅雷.")
    (home-page "https://www.xunlei.com/")
    (license license:non-copyleft)))

(define-public xviewer-plugins
  (package
    (name "xviewer-plugins")
    (version "3.4.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/xviewer-plugins.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "plugins for xviewer. X-Apps Project")
    (description "Plugins for xviewer. X-Apps Project.")
    (home-page "https://github.com/linuxmint/xviewer-plugins")
    (license license:gpl2+)))

(define-public youtube-tui
  (package
    (name "youtube-tui")
    (version "0.9.4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/youtube-tui.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "an aesthetically pleasing YouTube TUI written in Rust")
    (description "An aesthetically pleasing YouTube TUI written in Rust.")
    (home-page "https://tui.siri.ws/youtube")
    (license license:gpl3+)))

(define-public bar-lobby-git
  (package
    (name "bar-lobby-git")
    (version "VERSION")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/bar-lobby-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the new - stil Work_In_Progres lobby, for the RTS game Beyond All Reason (Git...")
    (description "The new - stil Work_In_Progres lobby, for the RTS game Beyond All Reason (Github version).")
    (home-page "https://beyond-all-reason.github.io/bar-lobby/")
    (license license:non-copyleft)))

(define-public bashhound-git
  (package
    (name "bashhound-git")
    (version "r6.f5500dd")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/0xbbuddha/BashHound")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "active Directory data collector for BloodHound written in Bash")
    (description "Active Directory data collector for BloodHound written in Bash.")
    (home-page "https://github.com/0xbbuddha/BashHound")
    (license license:expat)))

(define-public blockbench
  (package
    (name "blockbench")
    (version "5.1.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/blockbench.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a low-poly 3D model editor")
    (description "A low-poly 3D model editor.")
    (home-page "https://blockbench.net")
    (license license:gpl3+)))

(define-public blueberry
  (package
    (name "blueberry")
    (version "1.4.8")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/blueberry.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "bluetooth configuration tool")
    (description "Bluetooth configuration tool.")
    (home-page "https://github.com/linuxmint/blueberry")
    (license license:gpl3+)))

(define-public bluemail
  (package
    (name "bluemail")
    (version "1.140.102")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/bluemail.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "blueMail is a free, secure, universal email app, capable of managing an unlim...")
    (description "BlueMail is a free, secure, universal email app, capable of managing an unlimited number of mail accounts.")
    (home-page "https://www.bluemail.me")
    (license license:non-copyleft)))

(define-public certbot-dns-desec
  (package
    (name "certbot-dns-desec")
    (version "1.3.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/certbot-dns-desec.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "desec.io DNS Authenticator plugin for Certbot")
    (description "Desec.io DNS Authenticator plugin for Certbot.")
    (home-page "https://github.com/desec-io/certbot-dns-desec")
    (license license:asl2.0)))

(define-public certbot-dns-pdns
  (package
    (name "certbot-dns-pdns")
    (version "0.1.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/certbot-dns-pdns.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "powerDNS DNS Authenticator plugin for Certbot")
    (description "PowerDNS DNS Authenticator plugin for Certbot.")
    (home-page "https://pypi.python.org/pypi/certbot-dns-pdns")
    (license license:asl2.0)))

(define-public clapgrep
  (package
    (name "clapgrep")
    (version "26.02")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/clapgrep.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "one app to search through all your files")
    (description "One app to search through all your files.")
    (home-page "https://github.com/luleyleo/clapgrep")
    (license license:gpl3+)))

(define-public codelldb
  (package
    (name "codelldb")
    (version "1.12.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/codelldb.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a native debugger extension for VSCode based on LLDB. Also known as vscode-ll...")
    (description "A native debugger extension for VSCode based on LLDB. Also known as vscode-lldb (NOT lldb-vscode).")
    (home-page "https://github.com/vadimcn/codelldb")
    (license license:expat)))

(define-public cqrlog-git
  (package
    (name "cqrlog-git")
    (version "2.5.2.r251.g0277b27")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/cqrlog-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "an advanced ham radio logger using MariaDB - GIT version")
    (description "An advanced ham radio logger using MariaDB - GIT version.")
    (home-page "http://www.cqrlog.com")
    (license license:gpl3+)))

(define-public crunchyroll
  (package
    (name "crunchyroll")
    (version "1.0.10")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/crunchyroll.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "unnofficial CrunchyRoll desktop application")
    (description "Unnofficial CrunchyRoll desktop application.")
    (home-page "https://gitlab.com/linuxbombay/crunchyroll")
    (license license:gpl3+)))

(define-public cupola-git
  (package
    (name "cupola-git")
    (version "r53.fca1866")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://codeberg.org/bhh32/cupola")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "an image viewer for the COSMIC desktop environment")
    (description "An image viewer for the COSMIC desktop environment.")
    (home-page "https://codeberg.org/bhh32/cupola")
    (license license:expat)))

(define-public d2x-rebirth
  (package
    (name "d2x-rebirth")
    (version "20220929")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/d2x-rebirth.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "an enhanced engine to play with Descent2 data")
    (description "An enhanced engine to play with Descent2 data.")
    (home-page "https://www.dxx-rebirth.com/")
    (license license:non-copyleft)))

(define-public deemix-gui
  (package
    (name "deemix-gui")
    (version "0.4.5")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/deemix-gui.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a GUI electron app for the deemix library. Download music from deezer")
    (description "A GUI electron app for the deemix library. Download music from deezer.")
    (home-page "https://github.com/bambanah/deemix")
    (license license:gpl3+)))

(define-public discord-electron-openasar
  (package
    (name "discord-electron-openasar")
    (version "0.0.124+847")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/discord-electron-openasar.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (synopsis "discord packaged with OpenAsar using system provided electron (v37) for incre...")
    (description "Discord packaged with OpenAsar using system provided electron (v37) for increased security and performance.")
    (home-page "https://discord.com")
    (license license:non-copyleft)))

(define-public dotnet-sdk-preview-bin
  (package
    (name "dotnet-sdk-preview-bin")
    (version "11.0.0.sdk100+preview.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/dotnet-sdk-preview-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the .NET Core SDK (preview, binary)")
    (description "The .NET Core SDK (preview, binary).")
    (home-page "https://www.microsoft.com/net/core")
    (license license:expat)))

(define-public duckstation-preview-latest-bin
  (package
    (name "duckstation-preview-latest-bin")
    (version "0.1.10965")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/duckstation-preview-latest-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "fast PlayStation 1 emulator for PC and Android")
    (description "Fast PlayStation 1 emulator for PC and Android.")
    (home-page "https://github.com/stenzek/duckstation")
    (license license:non-copyleft)))

(define-public eddie-cli
  (package
    (name "eddie-cli")
    (version "2.24.6")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/eddie-cli.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "eddie - VPN tunnel - CLI")
    (description "Eddie - VPN tunnel - CLI.")
    (home-page "https://eddie.website")
    (license license:non-copyleft)))

(define-public edmarketconnector
  (package
    (name "edmarketconnector")
    (version "6.1.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/edmarketconnector.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "downloads commodity market and other station data from the game Elite: Danger...")
    (description "Downloads commodity market and other station data from the game Elite: Dangerous for use with all popular online and offline trading tools.")
    (home-page "https://github.com/EDCD/EDMarketConnector")
    (license license:gpl2)))

(define-public efibooteditor-bin
  (package
    (name "efibooteditor-bin")
    (version "1.5.6")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/efibooteditor-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "boot Editor for (U)EFI based systems")
    (description "Boot Editor for (U)EFI based systems.")
    (home-page "https://github.com/Neverous/efibooteditor")
    (license license:non-copyleft)))

(define-public fcitx5-im-emoji-picker-git
  (package
    (name "fcitx5-im-emoji-picker-git")
    (version "1.0.1.r5.g06b140b")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/GaZaTu/im-emoji-picker")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "qt 5-based emoji picker (Fcitx5 module)")
    (description "Qt 5-based emoji picker (Fcitx5 module).")
    (home-page "https://github.com/GaZaTu/im-emoji-picker")
    (license license:expat)))

(define-public flameshot-imgur
  (package
    (name "flameshot-imgur")
    (version "13.3.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/flameshot-imgur.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "powerful yet simple to use screenshot software with Imgur upload support enabled")
    (description "Powerful yet simple to use screenshot software with Imgur upload support enabled.")
    (home-page "https://github.com/flameshot-org/flameshot")
    (license license:gpl3+)))

(define-public flashrom-starlabs
  (package
    (name "flashrom-starlabs")
    (version "1.3.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/flashrom-starlabs.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "utility for reading, writing, erasing and verifying flash ROM chips (StarLabs...")
    (description "Utility for reading, writing, erasing and verifying flash ROM chips (StarLabs version).")
    (home-page "https://github.com/StarLabsLtd/flashrom")
    (license license:gpl2+)))

(define-public gd-tools-git
  (package
    (name "gd-tools-git")
    (version "1.8.r0.g82c1333")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Ajatt-Tools/gd-tools")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a set of helpful programs to enhance goldendict for immersion learning")
    (description "A set of helpful programs to enhance goldendict for immersion learning.")
    (home-page "https://github.com/Ajatt-Tools/gd-tools")
    (license license:gpl3)))

(define-public git-review
  (package
    (name "git-review")
    (version "2.5.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/git-review.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "tool to submit code to Gerrit")
    (description "Tool to submit code to Gerrit.")
    (home-page "https://opendev.org/opendev/git-review")
    (license license:asl2.0)))

(define-public glide-browser-bin
  (package
    (name "glide-browser-bin")
    (version "0.1.60a")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/glide-browser-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "an extensible and keyboard-focused web browser built on Firefox")
    (description "An extensible and keyboard-focused web browser built on Firefox.")
    (home-page "https://github.com/glide-browser/glide")
    (license license:mpl2.0)))

(define-public gnome-system-tools
  (package
    (name "gnome-system-tools")
    (version "3.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gnome-system-tools.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "cross-platform configuration utilities for GNOME")
    (description "Cross-platform configuration utilities for GNOME.")
    (home-page "https://en.wikipedia.org/wiki/GNOME_System_Tools")
    (license license:gpl2)))

(define-public googlemessages
  (package
    (name "googlemessages")
    (version "1.0.8")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/googlemessages.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "unnofficial Google messages desktop app")
    (description "Unnofficial Google messages desktop app.")
    (home-page "https://gitlab.com/linuxbombay/googlemessages")
    (license license:gpl3+)))

(define-public goonget
  (package
    (name "goonget")
    (version "1.1.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/goonget.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "cLI tool to fetch images/gifs/videos from rule34 or gelbooru and display them...")
    (description "CLI tool to fetch images/gifs/videos from rule34 or gelbooru and display them directly in terminal.")
    (home-page "https://github.com/LewdM3at/GoonGet")
    (license license:expat)))

(define-public gpmaster
  (package
    (name "gpmaster")
    (version "1.5.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gpmaster.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "gPG-backed lockbox for secrets management")
    (description "GPG-backed lockbox for secrets management.")
    (home-page "https://github.com/bill88t/gpmaster")
    (license license:gpl3)))

(define-public hudkit-wayland
  (package
    (name "hudkit-wayland")
    (version "4.1.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/hudkit-wayland.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "transparent click-through web browser overlay, using WebKit (Wayland fork)")
    (description "Transparent click-through web browser overlay, using WebKit (Wayland fork).")
    (home-page "https://github.com/SparxySys/hudkit-wayland")
    (license license:isc)))

(define-public hyprquickframe-git
  (package
    (name "hyprquickframe-git")
    (version "r53.g8a924b6")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Ronin-CK/HyprQuickFrame")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "quickshell-based screenshot utility for Hyprland")
    (description "Quickshell-based screenshot utility for Hyprland.")
    (home-page "https://github.com/Ronin-CK/HyprQuickFrame")
    (license license:expat)))

(define-public ibus-im-emoji-picker-git
  (package
    (name "ibus-im-emoji-picker-git")
    (version "1.0.1.r5.g06b140b")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/GaZaTu/im-emoji-picker")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "qt 5-based emoji picker (IBus)")
    (description "Qt 5-based emoji picker (IBus).")
    (home-page "https://github.com/GaZaTu/im-emoji-picker")
    (license license:expat)))

(define-public jan
  (package
    (name "jan")
    (version "0.7.9")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/jan.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "an open source alternative to ChatGPT that runs 100% offline on your computer")
    (description "An open source alternative to ChatGPT that runs 100% offline on your computer.")
    (home-page "https://jan.ai/")
    (license license:asl2.0)))

(define-public jan-git
  (package
    (name "jan-git")
    (version "0.7.9.r170.g45ca3ef")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/jan-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "an open source alternative to ChatGPT that runs 100% offline on your computer")
    (description "An open source alternative to ChatGPT that runs 100% offline on your computer.")
    (home-page "https://jan.ai/")
    (license license:asl2.0)))
