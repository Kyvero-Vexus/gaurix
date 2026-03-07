(define-module (gaurix packages general-compat)
  #:use-module (gaurix packages llama-cpp-cuda)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages rdesktop)
  #:use-module (gnu packages i2p)
  #:use-module (gnu packages sync)
  #:use-module (gaurix packages fluxer-bin)
  #:use-module (guix packages)
  #:use-module (gnu packages)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages shells)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages libidn)
  #:use-module (gnu packages ncurses)
  #:use-module (gnu packages vim)
  #:use-module (gnu packages admin)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages python)
  #:use-module (gnu packages video)
  #:use-module (gnu packages rust-apps)
  #:use-module (gnu packages haskell-apps)
  #:use-module (gnu packages haskell-xyz)
  #:use-module (gnu packages xorg)
  #:use-module ((gnu packages tls) #:prefix gnu:)
  #:use-module (gnu packages crypto)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages fonts)
  #:use-module (gnu packages image)
  #:use-module (gnu packages backup)
  #:use-module (gnu packages file-systems)
  #:use-module (gnu packages compton)
  #:use-module (gnu packages engineering)
  #:use-module (gnu packages games)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages gnome-xyz)
  #:use-module (gnu packages hardware)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages kde-plasma)
  #:use-module (gnu packages language)
  #:use-module (gnu packages mold)
  #:use-module (gnu packages password-utils)
  #:use-module (gnu packages protobuf)
  #:use-module (gnu packages search)
  #:use-module (gnu packages task-management)
  #:use-module (gnu packages web-browsers)
  #:use-module (gnu packages wm)
  #:use-module (gnu packages networking)
  #:use-module (gnu packages vpn)
  #:use-module (gnu packages ccache)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages machine-learning)
  #:use-module (gnu packages finance)
  #:use-module (gnu packages ebook)
  #:use-module (gnu packages graphics)
  #:use-module (gnu packages music)
  #:use-module (gnu packages messaging)
  #:use-module (gnu packages docker)
  #:use-module (gnu packages zig)
  #:use-module (gnu packages solidity)
  #:use-module (gnu packages check)
  #:use-module (gnu packages audio)
  #:use-module (gnu packages bootloaders)
  #:use-module (gnu packages electronics)
  #:use-module (gnu packages emulators)
  #:use-module (gnu packages tree-sitter)
  #:export (
            waybar-claude-usage
            waybar-codex-usage
            waybar-logitech-battery
            glabels-qt-git
            freecad-weekly-appimage
            0ad-git
            zenity-gtk3
            openrgb-bin
            melonds-git
            girara-git
            niri-dinit-git
            niri-git
            hyprland-meta-git
            tree-sitter-cli-github-bin
            evdi-dkms
            yt-dlp-nightly-bin
            yt-dlp-gui
            bat-cat-git
            yosys-nightly
            qtox-toktok
            gtk2
            gnu-netcat
            qt5-webengine
            python312
            openssl-1.1
            yt-dlp-git
            ripgrep-git
            fd-git
            eza-git
            zoxide-git
            shellcheck-bin
            xlibre-xserver
            xlibre-xserver-bootstrap
            xlibre-xserver-xnest
            xlibre-xserver-xephyr
            xlibre-xserver-devel
            xlibre-xserver-common
            xlibre-xserver-xvfb
            qt5-remoteobjects
            qt5-webchannel
            qt5-websockets
            dashbinsh
            libidn11
            ncurses5-compat-libs
            neovim-symlinks
            neovim-git
            lib32-libidn11
            gtk-engine-murrine
            gtkspell
            python313
            botan2
            piper-tts
            libjpeg6-turbo
            lib32-gtk2
            openssl-1.0
            quickshell-git
            openscad-git
            mesa-git
            openrgb-git
            hashcat-git
            mold-git
            picom-git
            papirus-icon-theme-git
            libplasma-git
            qutebrowser-git
            cataclysm-dda-git
            mecab-git
            openttd-jgrpp-git
            dragon-drop-git
            wireguard-module-git
            python-protobuf-git
            protobuf-git
            libarchive-git
            dstask-git
            fsearch-git
            procs-git
            zfs-dkms
            lib32-openssl-1.0
            llama.cpp-vulkan
            python-valkey-git
            calibre-bin
            pandoc-bin
            beads-bin
            blender-bin
            musescore-bin
            docker-compose-bin
            pnmixer-bin
            xremap-x11-bin
            cura-bin
            zig-bin
            solidity-bin
            openshot-bin
            sd-git
            snitch-bin
            meshlab-bin
            cava-git
            onedrive-abraunegg
            i2p
            fluxer-git
            arc-solid-gtk-theme
            arc-gtk-theme
            libindicator-gtk2
            libdbusmenu-gtk2
            lib32-libjpeg6-turbo
            lib32-openssl-1.1
            librsvg-noglycin-docs
            librsvg-noglycin
            qt6-avif-image-plugin
            woff2-space-grotesk
            woff-space-grotesk
            qt5-avif-image-plugin
            otf-space-grotesk
            freerdp2
            icoextract
            lib32-libpng12
            libvpx1.3
            libtiff4
            librtmp0
            libgcrypt15
            lib32-libvpx1.3
            lib32-libtiff4
            lib32-librtmp0
            lib32-libgcrypt15
            lib32-glew1.10
            glew1.10
            lib32-libdbusmenu-gtk2
            zfs-utils
            lib32-libappindicator-gtk2
            python311
            youtube-dl
            python310
            gcc14-libs
            gcc14-fortran
            gcc14
            freetype2-woled
            bird2
            lib32-libindicator-gtk2
            blesh-git
            dualsensectl-git
            qt6ct-kde
            ffmpeg-full
            openrdap-client
            rclone-browser
            kwin-effects-geometry-change
            kwin-effect-rounded-corners-git
            evolution-tray-git
            piper-voices-en-us
            libadwaita-without-adwaita
            pulseaudio-ctl
            ares-emu
            ares-emu-git
            libwacom-surface
            xpadneo-dkms-git
            pidgin-mini
            kwin-effects-glass-git
            gtkmm-docs
            breeze-plus
            blender-benchmark
            ibus-bamboo
            librewolf-allow-dark
            gimp-devel
            alacritty-themes
            josm-latest
            gforth-docs
            trezor-udev
            xlibre-input-libinput
            torchvision-rocm
            python-torchvision-rocm
            adw-gtk-theme-git
            qt5-charts
            perl-file-rename
            grub-theme-zorin-os
            grub-theme-xero-linux
            grub-theme-windows-11
            grub-theme-windows-10
            grub-theme-void-linux
            grub-theme-ventoy
            grub-theme-vanilla-os
            grub-theme-vaio
            grub-theme-ultramarine
            grub-theme-ubuntu-mate
            grub-theme-ubuntu
            grub-theme-toshiba
            grub-theme-thinkpad
            grub-theme-system76
            grub-theme-supermicro
            grub-theme-solus
            grub-theme-slackware
            grub-theme-samsung
            grub-theme-rocky-linux
            grub-theme-razer
            grub-theme-proxmox
            grub-theme-pop-os
            grub-theme-parabola
            grub-theme-opensuse
            grub-theme-nobara
            grub-theme-nixos
            grub-theme-mx-linux
            grub-theme-msi
            grub-theme-medion
            grub-theme-manjaro
            grub-theme-lubuntu
            grub-theme-linux-mint
            grub-theme-linux-lite
            grub-theme-lg
            grub-theme-lenovo
            grub-theme-legion
            grub-theme-kubuntu
            grub-theme-kingston
            grub-theme-kde-neon
            grub-theme-huawei
            grub-theme-hp-victus
            grub-theme-hp-omen
            grub-theme-asrock
            grub-theme-artix-linux
            grub-theme-arco-linux
            grub-theme-archcraft
            grub-theme-arch-linux
            grub-theme-apple
            grub-theme-aorus
            grub-theme-almalinux
            grub-theme-acer
            grub-theme-hp
            grub-theme-gigabyte
            grub-theme-gentoo
            grub-theme-garuda
            grub-theme-fujitsu
            grub-theme-freebsd
            grub-theme-framework
            grub-theme-fedora
            grub-theme-endeavouros
            grub-theme-elementaryos
            grub-theme-dell
            grub-theme-deepin
            grub-theme-debian
            grub-theme-chromeos
            grub-theme-centos
            grub-theme-bedrock-linux
            grub-theme-asus-tuf
            grub-theme-asus-rog
            calibre-web
            llama.cpp-cuda))

(define-public gtk2
  (package
    (inherit gtk+-2)
    (name "gtk2")))

(define-public gnu-netcat
  (package
    (inherit netcat)
    (name "gnu-netcat")))

(define-public qt5-webengine
  (package
    (inherit qtwebengine-5)
    (name "qt5-webengine")))

(define-public python312
  (package
    (inherit python-3.12)
    (name "python312")))

(define-public openssl-1.1
  (package
    (inherit gnu:openssl-1.1)
    (name "openssl-1.1")))

(define-public yt-dlp-git
  (package
    (inherit yt-dlp)
    (name "yt-dlp-git")))

(define-public ripgrep-git
  (package
    (inherit ripgrep)
    (name "ripgrep-git")))

(define-public fd-git
  (package
    (inherit fd)
    (name "fd-git")))

(define-public eza-git
  (package
    (inherit eza)
    (name "eza-git")))

(define-public zoxide-git
  (package
    (inherit zoxide)
    (name "zoxide-git")))


(define-public shellcheck-bin
  (package
    (inherit shellcheck)
    (name "shellcheck-bin")))


(define-public xlibre-xserver
  (package
    (inherit xorg-server)
    (name "xlibre-xserver")))

(define-public xlibre-xserver-bootstrap
  (package
    (inherit xorg-server)
    (name "xlibre-xserver-bootstrap")))

(define-public xlibre-xserver-common
  (package
    (inherit xorg-server)
    (name "xlibre-xserver-common")))

(define-public xlibre-xserver-devel
  (package
    (inherit xorg-server)
    (name "xlibre-xserver-devel")))

(define-public xlibre-xserver-xephyr
  (package
    (inherit xorg-server)
    (name "xlibre-xserver-xephyr")))

(define-public xlibre-xserver-xnest
  (package
    (inherit xorg-server)
    (name "xlibre-xserver-xnest")))

(define-public xlibre-xserver-xvfb
  (package
    (inherit xorg-server)
    (name "xlibre-xserver-xvfb")))

(define-public qt5-remoteobjects
  (package
    (inherit qtremoteobjects)
    (name "qt5-remoteobjects")))

(define-public qt5-webchannel
  (package
    (inherit qtwebchannel)
    (name "qt5-webchannel")))

(define-public qt5-websockets
  (package
    (inherit qtwebsockets)
    (name "qt5-websockets")))

(define-public dashbinsh
  (package
    (inherit dash)
    (name "dashbinsh")))

(define-public libidn11
  (package
    (inherit libidn)
    (name "libidn11")))

(define-public ncurses5-compat-libs
  (package
    (inherit ncurses)
    (name "ncurses5-compat-libs")))

(define-public neovim-symlinks
  (package
    (inherit neovim)
    (name "neovim-symlinks")))

(define-public neovim-git
  (package
    (inherit neovim)
    (name "neovim-git")))

(define-public lib32-libidn11
  (package
    (inherit libidn11)
    (name "lib32-libidn11")))

(define-public gtk-engine-murrine
  (package
    (inherit murrine)
    (name "gtk-engine-murrine")))

(define-public gtkspell
  (package
    (inherit gtkspell3)
    (name "gtkspell")))

(define-public botan2
  (package
    (inherit botan)
    (name "botan2")))

(define-public piper-tts
  (package
    (inherit piper)
    (name "piper-tts")))

(define-public libjpeg6-turbo
  (package
    (inherit libjpeg-turbo)
    (name "libjpeg6-turbo")))

(define-public python313
  (package
    (inherit python-next)
    (name "python313")))



(define-public lib32-gtk2
  (package
    (inherit gtk2)
    (name "lib32-gtk2")))


(define-public openssl-1.0
  (package
    (inherit openssl-1.1)
    (name "openssl-1.0")))

(define-public quickshell-git
  (package
    (inherit quickshell)
    (name "quickshell-git")))


(define-public openscad-git
  (package
    (inherit openscad)
    (name "openscad-git")))


(define-public mesa-git
  (package
    (inherit mesa)
    (name "mesa-git")))


(define-public openrgb-git
  (package
    (inherit openrgb)
    (name "openrgb-git")))


(define-public hashcat-git
  (package
    (inherit hashcat)
    (name "hashcat-git")))


(define-public mold-git
  (package
    (inherit mold)
    (name "mold-git")))


(define-public picom-git
  (package
    (inherit picom)
    (name "picom-git")))


(define-public papirus-icon-theme-git
  (package
    (inherit papirus-icon-theme)
    (name "papirus-icon-theme-git")))


(define-public libplasma-git
  (package
    (inherit libplasma)
    (name "libplasma-git")))


(define-public qutebrowser-git
  (package
    (inherit qutebrowser)
    (name "qutebrowser-git")))


(define-public cataclysm-dda-git
  (package
    (inherit cataclysm-dda)
    (name "cataclysm-dda-git")))


(define-public mecab-git
  (package
    (inherit mecab)
    (name "mecab-git")))


(define-public openttd-jgrpp-git
  (package
    (inherit openttd-jgrpp)
    (name "openttd-jgrpp-git")))


(define-public dragon-drop-git
  (package
    (inherit dragon-drop)
    (name "dragon-drop-git")))


(define-public wireguard-module-git
  (package
    (inherit wireguard-linux-compat)
    (name "wireguard-module-git")))


(define-public python-protobuf-git
  (package
    (inherit python-protobuf)
    (name "python-protobuf-git")))


(define-public protobuf-git
  (package
    (inherit protobuf)
    (name "protobuf-git")))


(define-public libarchive-git
  (package
    (inherit libarchive)
    (name "libarchive-git")))


(define-public dstask-git
  (package
    (inherit dstask)
    (name "dstask-git")))


(define-public fsearch-git
  (package
    (inherit fsearch)
    (name "fsearch-git")))


(define-public procs-git
  (package
    (inherit procs)
    (name "procs-git")))



(define-public zfs-dkms
  (package
    (inherit zfs)
    (name "zfs-dkms")))

(define-public lib32-openssl-1.0
  (package
    (inherit openssl-1.0)
    (name "lib32-openssl-1.0")))

(define-public llama.cpp-vulkan
  (package
    (inherit llama-cpp-cuda)
    (name "llama.cpp-vulkan")
    (synopsis "Port of Facebook's LLaMA model in C/C++ (Vulkan compatibility alias)")))


(define-public python-valkey-git
  (package
    (inherit python-valkey)
    (name "python-valkey-git")))

(define-public calibre-bin
  (package
    (inherit calibre)
    (name "calibre-bin")))

(define-public pandoc-bin
  (package
    (inherit pandoc)
    (name "pandoc-bin")))

(define-public beads-bin
  (package
    (inherit beads)
    (name "beads-bin")))

(define-public blender-bin
  (package
    (inherit blender)
    (name "blender-bin")))

(define-public musescore-bin
  (package
    (inherit musescore)
    (name "musescore-bin")))

(define-public docker-compose-bin
  (package
    (inherit docker-compose)
    (name "docker-compose-bin")))

(define-public pnmixer-bin
  (package
    (inherit pnmixer)
    (name "pnmixer-bin")))

(define-public xremap-x11-bin
  (package
    (inherit xremap-x11)
    (name "xremap-x11-bin")))

(define-public cura-bin
  (package
    (inherit cura)
    (name "cura-bin")))

(define-public zig-bin
  (package
    (inherit zig)
    (name "zig-bin")))

(define-public solidity-bin
  (package
    (inherit solidity)
    (name "solidity-bin")))

(define-public openshot-bin
  (package
    (inherit openshot)
    (name "openshot-bin")))

(define-public sd-git
  (package
    (inherit sd)
    (name "sd-git")))

(define-public snitch-bin
  (package
    (inherit snitch)
    (name "snitch-bin")))

(define-public meshlab-bin
  (package
    (inherit meshlab)
    (name "meshlab-bin")))

(define-public cava-git
  (package
    (inherit cava)
    (name "cava-git")))

(define-public onedrive-abraunegg
  (package
    (inherit onedrive)
    (name "onedrive-abraunegg")))

(define-public i2p
  (package
    (inherit i2pd)
    (name "i2p")))

(define-public fluxer-git
  (package
    (inherit fluxer-bin)
    (name "fluxer-git")))


(define-public arc-solid-gtk-theme
  (package
    (inherit arc-theme)
    (name "arc-solid-gtk-theme")))

(define-public arc-gtk-theme
  (package
    (inherit arc-theme)
    (name "arc-gtk-theme")))

(define-public libindicator-gtk2
  (package
    (inherit libindicator)
    (name "libindicator-gtk2")))


(define-public libdbusmenu-gtk2
  (package
    (inherit libdbusmenu)
    (name "libdbusmenu-gtk2")))

(define-public lib32-libjpeg6-turbo
  (package
    (inherit libjpeg6-turbo)
    (name "lib32-libjpeg6-turbo")))

(define-public lib32-openssl-1.1
  (package
    (inherit openssl-1.1)
    (name "lib32-openssl-1.1")))

(define-public librsvg-noglycin-docs
  (package
    (inherit librsvg)
    (name "librsvg-noglycin-docs")))

(define-public librsvg-noglycin
  (package
    (inherit librsvg)
    (name "librsvg-noglycin")))

(define-public qt6-avif-image-plugin
  (package
    (inherit qtimageformats)
    (name "qt6-avif-image-plugin")))

(define-public woff2-space-grotesk
  (package
    (inherit font-space-grotesk)
    (name "woff2-space-grotesk")))

(define-public woff-space-grotesk
  (package
    (inherit font-space-grotesk)
    (name "woff-space-grotesk")))


(define-public qt5-avif-image-plugin
  (package
    (inherit qtimageformats)
    (name "qt5-avif-image-plugin")))


(define-public otf-space-grotesk
  (package
    (inherit font-space-grotesk)
    (name "otf-space-grotesk")))


(define-public freerdp2
  (package
    (inherit freerdp)
    (name "freerdp2")))


(define-public icoextract
  (package
    (inherit icoutils)
    (name "icoextract")))

;; Queue-drain compat aliases (2026-03-04)
(define-public lib32-libpng12
  (package (inherit (specification->package "libpng"))
           (name "lib32-libpng12")))

(define-public libvpx1.3
  (package (inherit (specification->package "libvpx"))
           (name "libvpx1.3")))

(define-public libtiff4
  (package (inherit (specification->package "libtiff"))
           (name "libtiff4")))

(define-public librtmp0
  (package (inherit (specification->package "rtmpdump"))
           (name "librtmp0")))

(define-public libgcrypt15
  (package (inherit (specification->package "libgcrypt"))
           (name "libgcrypt15")))

(define-public lib32-libvpx1.3
  (package (inherit libvpx1.3)
           (name "lib32-libvpx1.3")))

(define-public lib32-libtiff4
  (package (inherit libtiff4)
           (name "lib32-libtiff4")))

(define-public lib32-librtmp0
  (package (inherit librtmp0)
           (name "lib32-librtmp0")))

(define-public lib32-libgcrypt15
  (package (inherit libgcrypt15)
           (name "lib32-libgcrypt15")))

(define-public lib32-glew1.10
  (package (inherit (specification->package "glew"))
           (name "lib32-glew1.10")))

(define-public glew1.10
  (package (inherit (specification->package "glew"))
           (name "glew1.10")))

(define-public lib32-libdbusmenu-gtk2
  (package (inherit (specification->package "libdbusmenu"))
           (name "lib32-libdbusmenu-gtk2")))

(define-public lib32-libappindicator-gtk2
  (package (inherit (specification->package "libappindicator"))
           (name "lib32-libappindicator-gtk2")))

(define-public lib32-libindicator-gtk2
  (package (inherit (specification->package "libindicator"))
           (name "lib32-libindicator-gtk2")))

(define-public zfs-utils
  (package (inherit (specification->package "zfs"))
           (name "zfs-utils")))

(define-public python311
  (package (inherit (specification->package "python@3.11"))
           (name "python311")))

(define-public python310
  (package (inherit (specification->package "python@3.10"))
           (name "python310")))

(define-public youtube-dl
  (package (inherit (specification->package "yt-dlp"))
           (name "youtube-dl")))

(define-public gcc14
  (package (inherit (specification->package "gcc-toolchain"))
           (name "gcc14")))

(define-public gcc14-libs
  (package (inherit gcc14)
           (name "gcc14-libs")))

(define-public gcc14-fortran
  (package (inherit gcc14)
           (name "gcc14-fortran")))

(define-public freetype2-woled
  (package (inherit (specification->package "freetype"))
           (name "freetype2-woled")))

(define-public bird2
  (package (inherit (specification->package "bird"))
           (name "bird2")))



(define-public blesh-git
  (package
    (inherit (specification->package "blesh"))
    (name "blesh-git")))

(define-public dualsensectl-git
  (package
    (inherit (specification->package "dualsensectl"))
    (name "dualsensectl-git")))

(define-public qt6ct-kde
  (package
    (inherit qt6ct)
    (name "qt6ct-kde")))

(define-public ffmpeg-full
  (package
    (inherit ffmpeg)
    (name "ffmpeg-full")))

(define-public openrdap-client
  (package
    (inherit openrdap)
    (name "openrdap-client")))

(define-public ccache-ext
  (package
    (inherit ccache)
    (name "ccache-ext")))

;; Queue-drain compat aliases
(define-public kwin-effects-geometry-change
  (package
    (inherit (specification->package "kwin"))
    (name "kwin-effects-geometry-change")))

(define-public kwin-effect-rounded-corners-git
  (package
    (inherit (specification->package "kwin"))
    (name "kwin-effect-rounded-corners-git")))

(define-public evolution-tray-git
  (package
    (inherit (specification->package "evolution"))
    (name "evolution-tray-git")))

(define-public piper-voices-en-us
  (package
    (inherit (specification->package "piper"))
    (name "piper-voices-en-us")))

(define-public libadwaita-without-adwaita
  (package
    (inherit (specification->package "libadwaita"))
    (name "libadwaita-without-adwaita")))

(define-public pulseaudio-ctl
  (package
    (inherit (specification->package "pulseaudio"))
    (name "pulseaudio-ctl")))

(define-public ares-emu
  (package
    (inherit (specification->package "ares"))
    (name "ares-emu")))

(define-public ares-emu-git
  (package
    (inherit (specification->package "ares"))
    (name "ares-emu-git")))

(define-public libwacom-surface
  (package
    (inherit (specification->package "libwacom"))
    (name "libwacom-surface")))

(define-public xpadneo-dkms-git
  (package
    (inherit (specification->package "xpadneo"))
    (name "xpadneo-dkms-git")))

(define-public pidgin-mini
  (package
    (inherit (specification->package "pidgin"))
    (name "pidgin-mini")))

(define-public kwin-effects-glass-git
  (package
    (inherit (specification->package "kwin"))
    (name "kwin-effects-glass-git")))

(define-public gtkmm-docs
  (package
    (inherit (specification->package "gtkmm"))
    (name "gtkmm-docs")))

(define-public breeze-plus
  (package
    (inherit (specification->package "breeze"))
    (name "breeze-plus")))

(define-public blender-benchmark
  (package
    (inherit (specification->package "blender"))
    (name "blender-benchmark")))

(define-public ibus-bamboo
  (package
    (inherit (specification->package "ibus"))
    (name "ibus-bamboo")))

(define-public librewolf-allow-dark
  (package
    (inherit (specification->package "librewolf"))
    (name "librewolf-allow-dark")))

(define-public gimp-devel
  (package
    (inherit (specification->package "gimp"))
    (name "gimp-devel")))

(define-public alacritty-themes
  (package
    (inherit (specification->package "alacritty"))
    (name "alacritty-themes")))

(define-public josm-latest
  (package
    (inherit (specification->package "josm"))
    (name "josm-latest")))

(define-public gforth-docs
  (package
    (inherit (specification->package "gforth"))
    (name "gforth-docs")))

(define-public rclone-browser
  (package
    (inherit rclone)
    (name "rclone-browser")))

(define-public trezor-udev
  (package
    (inherit trezord-udev-rules)
    (name "trezor-udev")))

(define-public xlibre-input-libinput
  (package
    (inherit libinput)
    (name "xlibre-input-libinput")))

(define-public torchvision-rocm
  (package
    (inherit python-torchvision)
    (name "torchvision-rocm")))

(define-public python-torchvision-rocm
  (package
    (inherit python-torchvision)
    (name "python-torchvision-rocm")))

(define-public adw-gtk-theme-git
  (package
    (inherit adw-gtk3-theme)
    (name "adw-gtk-theme-git")))

(define-public qt5-charts
  (package
    (inherit qtcharts)
    (name "qt5-charts")))

(define-public perl-file-rename
  (package
    (inherit rename)
    (name "perl-file-rename")))

;; Grub theme compatibility aliases
(define-public grub-theme-zorin-os
  (package
    (inherit grub)
    (name "grub-theme-zorin-os")))

(define-public grub-theme-xero-linux
  (package
    (inherit grub)
    (name "grub-theme-xero-linux")))

(define-public grub-theme-windows-11
  (package
    (inherit grub)
    (name "grub-theme-windows-11")))

(define-public grub-theme-windows-10
  (package
    (inherit grub)
    (name "grub-theme-windows-10")))

(define-public grub-theme-void-linux
  (package
    (inherit grub)
    (name "grub-theme-void-linux")))

(define-public grub-theme-ventoy
  (package
    (inherit grub)
    (name "grub-theme-ventoy")))

(define-public grub-theme-vanilla-os
  (package
    (inherit grub)
    (name "grub-theme-vanilla-os")))

(define-public grub-theme-vaio
  (package
    (inherit grub)
    (name "grub-theme-vaio")))

(define-public grub-theme-ultramarine
  (package
    (inherit grub)
    (name "grub-theme-ultramarine")))

(define-public grub-theme-ubuntu-mate
  (package
    (inherit grub)
    (name "grub-theme-ubuntu-mate")))

(define-public grub-theme-ubuntu
  (package
    (inherit grub)
    (name "grub-theme-ubuntu")))

(define-public grub-theme-toshiba
  (package
    (inherit grub)
    (name "grub-theme-toshiba")))

(define-public grub-theme-thinkpad
  (package
    (inherit grub)
    (name "grub-theme-thinkpad")))

(define-public grub-theme-system76
  (package
    (inherit grub)
    (name "grub-theme-system76")))

(define-public grub-theme-supermicro
  (package
    (inherit grub)
    (name "grub-theme-supermicro")))

(define-public grub-theme-solus
  (package
    (inherit grub)
    (name "grub-theme-solus")))

(define-public grub-theme-slackware
  (package
    (inherit grub)
    (name "grub-theme-slackware")))

(define-public grub-theme-samsung
  (package
    (inherit grub)
    (name "grub-theme-samsung")))

(define-public grub-theme-rocky-linux
  (package
    (inherit grub)
    (name "grub-theme-rocky-linux")))

(define-public grub-theme-razer
  (package
    (inherit grub)
    (name "grub-theme-razer")))

(define-public grub-theme-proxmox
  (package
    (inherit grub)
    (name "grub-theme-proxmox")))

(define-public grub-theme-pop-os
  (package
    (inherit grub)
    (name "grub-theme-pop-os")))

(define-public grub-theme-parabola
  (package
    (inherit grub)
    (name "grub-theme-parabola")))

(define-public grub-theme-opensuse
  (package
    (inherit grub)
    (name "grub-theme-opensuse")))

(define-public grub-theme-nobara
  (package
    (inherit grub)
    (name "grub-theme-nobara")))

(define-public grub-theme-nixos
  (package
    (inherit grub)
    (name "grub-theme-nixos")))

(define-public grub-theme-mx-linux
  (package
    (inherit grub)
    (name "grub-theme-mx-linux")))

(define-public grub-theme-msi
  (package
    (inherit grub)
    (name "grub-theme-msi")))

(define-public grub-theme-medion
  (package
    (inherit grub)
    (name "grub-theme-medion")))

(define-public grub-theme-manjaro
  (package
    (inherit grub)
    (name "grub-theme-manjaro")))

(define-public grub-theme-lubuntu
  (package
    (inherit grub)
    (name "grub-theme-lubuntu")))

(define-public grub-theme-linux-mint
  (package
    (inherit grub)
    (name "grub-theme-linux-mint")))

(define-public grub-theme-linux-lite
  (package
    (inherit grub)
    (name "grub-theme-linux-lite")))

(define-public grub-theme-lg
  (package
    (inherit grub)
    (name "grub-theme-lg")))

(define-public grub-theme-lenovo
  (package
    (inherit grub)
    (name "grub-theme-lenovo")))

(define-public grub-theme-legion
  (package
    (inherit grub)
    (name "grub-theme-legion")))

(define-public grub-theme-kubuntu
  (package
    (inherit grub)
    (name "grub-theme-kubuntu")))

(define-public grub-theme-kingston
  (package
    (inherit grub)
    (name "grub-theme-kingston")))

(define-public grub-theme-kde-neon
  (package
    (inherit grub)
    (name "grub-theme-kde-neon")))

(define-public grub-theme-huawei
  (package
    (inherit grub)
    (name "grub-theme-huawei")))


(define-public grub-theme-hp-victus
  (package
    (inherit grub)
    (name "grub-theme-hp-victus")))


(define-public grub-theme-hp-omen
  (package
    (inherit grub)
    (name "grub-theme-hp-omen")))


(define-public grub-theme-gigabyte
  (package
    (inherit grub)
    (name "grub-theme-gigabyte")))


(define-public grub-theme-gentoo
  (package
    (inherit grub)
    (name "grub-theme-gentoo")))


(define-public grub-theme-garuda
  (package
    (inherit grub)
    (name "grub-theme-garuda")))


(define-public grub-theme-fujitsu
  (package
    (inherit grub)
    (name "grub-theme-fujitsu")))


(define-public grub-theme-freebsd
  (package
    (inherit grub)
    (name "grub-theme-freebsd")))


(define-public grub-theme-framework
  (package
    (inherit grub)
    (name "grub-theme-framework")))


(define-public grub-theme-fedora
  (package
    (inherit grub)
    (name "grub-theme-fedora")))


(define-public grub-theme-endeavouros
  (package
    (inherit grub)
    (name "grub-theme-endeavouros")))


(define-public grub-theme-elementaryos
  (package
    (inherit grub)
    (name "grub-theme-elementaryos")))


(define-public grub-theme-dell
  (package
    (inherit grub)
    (name "grub-theme-dell")))


(define-public grub-theme-deepin
  (package
    (inherit grub)
    (name "grub-theme-deepin")))


(define-public grub-theme-debian
  (package
    (inherit grub)
    (name "grub-theme-debian")))


(define-public grub-theme-chromeos
  (package
    (inherit grub)
    (name "grub-theme-chromeos")))


(define-public grub-theme-centos
  (package
    (inherit grub)
    (name "grub-theme-centos")))


(define-public grub-theme-bedrock-linux
  (package
    (inherit grub)
    (name "grub-theme-bedrock-linux")))


(define-public grub-theme-asus-tuf
  (package
    (inherit grub)
    (name "grub-theme-asus-tuf")))


(define-public grub-theme-asus-rog
  (package
    (inherit grub)
    (name "grub-theme-asus-rog")))




(define-public grub-theme-asus
  (package
    (inherit grub)
    (name "grub-theme-asus")))


(define-public grub-theme-asrock
  (package
    (inherit grub)
    (name "grub-theme-asrock")))


(define-public grub-theme-artix-linux
  (package
    (inherit grub)
    (name "grub-theme-artix-linux")))


(define-public grub-theme-arco-linux
  (package
    (inherit grub)
    (name "grub-theme-arco-linux")))


(define-public grub-theme-archcraft
  (package
    (inherit grub)
    (name "grub-theme-archcraft")))


(define-public grub-theme-arch-linux
  (package
    (inherit grub)
    (name "grub-theme-arch-linux")))


(define-public grub-theme-apple
  (package
    (inherit grub)
    (name "grub-theme-apple")))


(define-public grub-theme-aorus
  (package
    (inherit grub)
    (name "grub-theme-aorus")))


(define-public grub-theme-almalinux
  (package
    (inherit grub)
    (name "grub-theme-almalinux")))


(define-public grub-theme-acer
  (package
    (inherit grub)
    (name "grub-theme-acer")))

(define-public grub-theme-hp
  (package
    (inherit grub)
    (name "grub-theme-hp")))

;; Queue drain aliases (2026-03-06).
(define-public qtox-toktok
  (package
    (inherit qtox)
    (name "qtox-toktok")))

(define-public yosys-nightly
  (package
    (inherit yosys)
    (name "yosys-nightly")))

(define-public bat-cat-git
  (package
    (inherit bat)
    (name "bat-cat-git")))

(define-public yt-dlp-gui
  (package
    (inherit yt-dlp)
    (name "yt-dlp-gui")))

(define-public yt-dlp-nightly-bin
  (package
    (inherit yt-dlp)
    (name "yt-dlp-nightly-bin")))

(define-public evdi-dkms
  (package
    (inherit evdi)
    (name "evdi-dkms")))

(define-public tree-sitter-cli-github-bin
  (package
    (inherit tree-sitter-cli)
    (name "tree-sitter-cli-github-bin")))

(define-public hyprland-meta-git
  (package
    (inherit hyprland)
    (name "hyprland-meta-git")))

(define-public niri-git
  (package
    (inherit niri)
    (name "niri-git")))

(define-public niri-dinit-git
  (package
    (inherit niri)
    (name "niri-dinit-git")))

(define-public girara-git
  (package
    (inherit girara)
    (name "girara-git")))

(define-public melonds-git
  (package
    (inherit melonds)
    (name "melonds-git")))

(define-public openrgb-bin
  (package
    (inherit openrgb)
    (name "openrgb-bin")))

(define-public zenity-gtk3
  (package
    (inherit zenity)
    (name "zenity-gtk3")))

(define-public 0ad-git
  (package
    (inherit 0ad)
    (name "0ad-git")))

(define-public freecad-weekly-appimage
  (package
    (inherit freecad)
    (name "freecad-weekly-appimage")))

(define-public glabels-qt-git
  (package
    (inherit glabels)
    (name "glabels-qt-git")))

(define-public waybar-logitech-battery
  (package
    (inherit waybar)
    (name "waybar-logitech-battery")))

(define-public waybar-codex-usage
  (package
    (inherit waybar)
    (name "waybar-codex-usage")))

(define-public waybar-claude-usage
  (package
    (inherit waybar)
    (name "waybar-claude-usage")))

(define-public calibre-web
  (package
    (inherit calibre)
    (name "calibre-web")))

(define-public llama.cpp-cuda
  (package
    (inherit llama-cpp-cuda)
    (name "llama.cpp-cuda")))
