            ;; recipe-resolver-260407l re-exports
            pipette-desktop-bin
            elyprismlauncher-bin
            lianpkg-gui-bin
            gb-studio-bin
            velo-bin
            webtunnel-client-bin
            hytale-downloader-bin
            sonarr-bin
            ffstudio-bin
            undertalemodtool-bin
            thorium-browser-avx2-bin
            tonelib-gfx-bin
            mateengine-bin
            msdf-atlas-gen
            gnuclad
            bsd-leave
            pidgin-libnotify
            binauralplayer
            python-rofi
            dotctl
            sxhkhm
            myapps
            toad-ai
            font-chocolate-classical-sans
            nordic-darker-standard-buttons-theme
            catppuccin-qt5ct
            fairy-stockfish
            shiru-lv2
            tanin
            swaycons
            ;; recipe-resolver-260407m re-exports
            sff
            streamdeck-ui
            zulucrypt
            rankmirrors
            python-vllm
            grass-desktop-node
            python-flash-attention
            tonelib-zoom-bin
            gittyup
            dropbox-cli
            ripcalc
            perl-authen-simple
            intel-media-driver-legacy-bin
            pacman-hook-list-systemd-units
            vcsi
            atproto-pds
            vmware-vmrc
            libwebcam
            v4l2ucp
            glpi-agent
            perl-xml-treepp
            bcc-tools
            python-bcc
            perl-test-compile
            perl-io-capture
            electron6-bin
            jsignpdf
            simutrans-pak192-comic
            perl-http-server-simple-authen
            mermaid-filter
            python-atlassian-api
            wiki-js
            gkrellm-gkfreq
            thunderbird-beta-bin
            replay-sorcery
            kolossus-launcher
            hunspell-hr
            nyrna-bin
            font-work-sans
            font-work-sans-variable
            sway-git-wlroots
            opennebula
            fancontrol-gui
            heaptrack
            trufflehog
            chs
            heroic-gogdl
            xmind
            profile-sync-daemon-librewolf
            code-saturne
            vertex-themes
            alacarte-xfce
            tonelib-jam-bin
            steamrun
            tunescope
            guitarix-vst
            elementary-xfce-icons
            gkleds
            gkrelltop
            gkrellm-themes
            chowbyod-bin
            patchance
            chowcentaur-bin
            nootka
            tuxedo-drivers-dkms
            macintosh-js-bin
            opera-developer
            sslyze
            trelby
            scidb
            tencent-docs-bin
            slang-verilog
            noi-desktop-bin
            jzintv
            kyocera-universal
            intiface-central
            font-sorts-mill-goudy
            go-musicfox-bin
            adminer-editor
            scream
            qt5-styleplugins
            vkd3d-proton-mingw
            pam-ssh
            lenmus
            selinux-refpolicy-arch
            vencord
            chromium-vencord
            firefox-vencord
            firefox-developer-edition-vencord
            librewolf-vencord
            font-udev-gothic
            wofi-power-menu
            slimevr-beta-bin
            terminal-rain-lightning
            syncclipboard-desktop
            wine-discord-ipc-bridge
            vpinball
            qt6-jpegxl-image-plugin
            zls-master-bin
            optimus-manager-qt
(define-module (gaurix packages general-compat)
  #:use-module (gaurix packages llama-cpp-cuda)
  #:use-module (gaurix packages deptree-resolver-260407c)
  #:use-module (gaurix packages deptree-resolver-260407d)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages rdesktop)
  #:use-module (gnu packages i2p)
  #:use-module (gnu packages sync)
  #:use-module (gaurix packages fluxer-bin)
  #:use-module (gaurix packages recipe-resolver-260407b)
  #:use-module (gaurix packages recipe-resolver-260407d)
  #:use-module (gaurix packages recipe-resolver-260407e)
  #:use-module (gaurix packages recipe-resolver-260407f)
  #:use-module (guix packages)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (gnu packages)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages shells)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages libidn)
  #:use-module (gnu packages ncurses)
  #:use-module (gnu packages vim)
  #:use-module (gnu packages admin)
#:use-module (gnu packages forth)
#:use-module (gnu packages pulseaudio)
#:use-module (gnu packages bittorrent)
#:use-module (gnu packages xdisorg)
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
  #:use-module (gnu packages java)
  #:use-module (gnu packages mold)
  #:use-module (gnu packages password-utils)
  #:use-module (gnu packages protobuf)
  #:use-module (gnu packages search)
  #:use-module (gnu packages task-management)
  #:use-module (gnu packages web-browsers)
  #:use-module (gnu packages wm)
  #:use-module (gnu packages networking)
  #:use-module (gnu packages golang-web)
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
  #:use-module (gnu packages disk)
  #:use-module (gnu packages zig)
  #:use-module (gnu packages solidity)
  #:use-module (gnu packages check)
  #:use-module (gnu packages version-control)
  #:use-module (gnu packages audio)
  #:use-module (gnu packages bootloaders)
#:use-module (gnu packages astronomy)
#:use-module (gnu packages ntp)
#:use-module (gnu packages emacs-xyz)
#:use-module (gnu packages calendar)
#:use-module (gnu packages cmake)
#:use-module (gnu packages firmware)
#:use-module (gnu packages geo)
#:use-module (gnu packages gnunet)
#:use-module (gnu packages gnustep)
#:use-module (gnu packages golang-apps)
#:use-module (gnu packages golang-check)
#:use-module (gnu packages kde-frameworks)
#:use-module (gnu packages lxde)
#:use-module (gnu packages maths)
#:use-module (gnu packages patchutils)
#:use-module (gnu packages rust)
#:use-module (gnu packages scanner)
#:use-module (gnu packages shellutils)
#:use-module (gnu packages suckless)
#:use-module (gnu packages upnp)
#:use-module (gnu packages vulkan)
#:use-module (gnu packages wget)
#:use-module (gnu packages zig-xyz)
  #:use-module (gnu packages electronics)
  #:use-module (gnu packages emulators)
  #:use-module (gnu packages hexedit)
  #:use-module (gnu packages tree-sitter)
  #:use-module (gnu packages tor)
  #:use-module (gnu packages astronomy)
  #:use-module (gnu packages golang-crypto)
  #:use-module (gnu packages upnp)
  #:use-module (gnu packages ntp)
  #:use-module (gnu packages calendar)
  #:use-module (gnu packages cmake)
  #:use-module (gnu packages emacs-xyz)
  #:use-module (gnu packages firmware)
  #:use-module (gnu packages geo)
  #:use-module (gnu packages gnunet)
  #:use-module (gnu packages gnustep)
  #:use-module (gnu packages golang-apps)
  #:use-module (gnu packages golang-check)
  #:use-module (gnu packages kde-frameworks)
  #:use-module (gnu packages lxde)
  #:use-module (gnu packages maths)
  #:use-module (gnu packages commencement)
  #:use-module (gnu packages patchutils)
  #:use-module (gnu packages rust)
  #:use-module (gnu packages scanner)
  #:use-module (gnu packages shellutils)
  #:use-module (gnu packages suckless)
  #:use-module (gnu packages vulkan)
  #:use-module (gnu packages wget)
  #:use-module (gnu packages zig-xyz)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages base)
  #:use-module (gnu packages boost)
  #:use-module (gnu packages cups)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages databases)
  #:use-module (gnu packages erlang)
  #:use-module (gnu packages fcitx5)
  #:use-module (gnu packages game-development)
  #:use-module (gnu packages gstreamer)
  #:use-module (gnu packages guile)
  #:use-module (gnu packages haskell)
  #:use-module (gnu packages kde-graphics)
  #:use-module (gnu packages kde-pim)
  #:use-module (gnu packages libffi)
  #:use-module (gnu packages llvm)
  #:use-module (gnu packages pdf)
  #:use-module (gnu packages photo)
  #:use-module (gnu packages php)
  #:use-module (gnu packages pretty-print)
  #:use-module (gnu packages python-graphics)
  #:use-module (gnu packages security-token)
  #:use-module (gnu packages syndication)
  #:use-module (gnu packages tex)
  #:use-module (gnu packages text-editors)
  #:use-module (gnu packages textutils)
  #:use-module (gnu packages webkit)
  #:use-module (gnu packages speech)
  #:use-module (gaurix packages cron-c79f127f-r22-w03-nrd6)
  #:use-module (gaurix packages cron-c79f127f-r22-w03-nrd12)
  #:use-module (gaurix packages cron-c79f127f-r22-w03-nrd13)
  #:use-module (gaurix packages cron-c79f127f-r22-w03-nrd14)
  #:use-module (gaurix packages cron-c79f127f-r22-w03-nrd16)
  #:use-module (gaurix packages cron-c79f127f-r26-w03-nrd)
  #:use-module (gnu packages opencl)
  #:use-module (gnu packages image-processing)
#:use-module (gnu packages cdrom)
  #:use-module (gnu packages ssh)
  #:use-module (gnu packages dictionaries)
  #:use-module (gnu packages gimp)
  #:use-module (gnu packages syncthing)
  #:use-module (gnu packages sphinx)
  #:use-module (gnu packages w3m)
  #:use-module (gnu packages wordnet)
  #:use-module (gnu packages virtualization)
  #:use-module (gnu packages dotnet)
  #:use-module (gnu packages mp3)
  #:use-module (gnu packages ibus)
  #:use-module (gnu packages wine)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages xfce)
  #:use-module (nongnu packages dyalog)
  #:use-module (gaurix packages queue-20260406-nrd30f)
  #:use-module (gnu packages sycl)
  #:use-module (gnu packages chromium)
  #:use-module (gnu packages matrix)
  #:use-module (gnu packages terminals)
  #:use-module (gnu packages monitoring)
  #:use-module (gnu packages python-science)
  #:use-module (gnu packages selinux)
  #:use-module (nongnu packages mozilla)
  #:use-module (gaurix packages deptree-resolver-260407)
  #:use-module (gaurix packages deptree-resolver-260407b)
  #:use-module (gaurix packages queue-20260407-deptree)
  #:use-module (gaurix packages queue-20260407-opus-p100)
  #:use-module (gaurix packages queue-20260407-opus-p101)
  #:use-module (gaurix packages deptree-resolver-260407e)
  #:use-module (gaurix packages deptree-resolver-260407f)
  #:use-module (gaurix packages recipe-resolver-260407h)
  #:use-module (gaurix packages recipe-resolver-260407i)
  #:use-module (gaurix packages recipe-resolver-260407j)
  #:use-module (gaurix packages recipe-resolver-260407k)
  #:use-module (gaurix packages recipe-resolver-260407l)
  #:use-module (gaurix packages recipe-resolver-260407m)
  #:use-module (gaurix packages recipe-resolver-260407n)
  #:use-module (gaurix packages recipe-resolver-260407o)
  #:use-module (gaurix packages recipe-resolver-260408a)
  #:use-module (gaurix packages deptree-resolver-260407g)
  #:use-module (gaurix packages deptree-resolver-260407h)
  #:use-module (gaurix packages deptree-resolver-260408a)
  #:export (
            ;; deptree-resolver-260407 compat aliases
            qt5-connectivity
            ;; deptree-resolver-260407 recipes
            pipes.sh
            grepcidr
            libjodycode
            notify-send.sh
            python-pid
            python-condense-json
            python-m3u8
            python-plyer
            dyalog-bin
            ;; nrd18 compat aliases
            gcc13
            setools
            ;; nrd30f compat aliases
            zrepl-git
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
            dpibreak-git
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
            gforth
            tofi
            tremc
            autojump
            apulse
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
            llama.cpp-cuda
            f3-qt
            hydra-launcher-bin
            got-vcs
            stoken-git            lib32-opencore-amr
            obs-vkcapture-git
            lib32-obs-vkcapture-git
            mangohud-git
            lib32-soundtouch
            radicle-cli
            radicle-cli-git
            lib32-libplacebo
            python-croniter-git
            matugen-bin
            protoc-gen-go-grpc-bin
            imhex-bin
            dwarfs-bin
            xremap-wlroots-bin
            swift-bin
            neovim-nightly-bin
            dumbpipe-bin
            bibata-cursor-theme-bin
            moonlight-qt-mainline-git
            klassy-bin
            stellarium-qt5-bin
            chrony-git
            emacs-yasnippet-git
            emacs-evil-org-git
            emacs-evil-collection-git
            xsane-git
            carla-git
            obs-shaderfilter-git
            river-git
            binwalk-git
            flightgear-appimage
            zrythm-git
            musikcube-bin
            pcsx2-latest-bin
            speedcrunch-git
            xwayland-satellite-git
            noisetorch-bin
            rkdeveloptool-git
            windowmaker-git
            gnunet-git
            xcompmgr-git
            lib32-miniupnpc
            libei-git
            kanata-bin
            qbittorrent-git
            freecad-git
            nerd-dictation-git
            monado-git
            qgis-git
            surf-git
            bigbagkbdtrixxkb-git
            khal-git
            kbdd-git
            bombadillo-git
            py-spy-bin
            ;; ginkgo-cli  ; FIXME: ginkgo not exported from (gnu packages golang-check)
            rust-git
            prjtrellis-git
            celestia-qt6-git
            vkbasalt-cli
            cmake-git
            pay-respects-bin
            go-chroma-bin
            spacefm-bin
            coccinelle-git
            wget2-git
            kirigami-addons-git
            opendoas-git
            discover-git
            xdg-desktop-portal-kde-git
            kuserfeedback-git
            xlibre-xserver-common-git
            qt5-location
            qt5-scxml
            qt5-wayland-decorations
            ledger-udev
            libxdiff
            wolfssl-all
            jdk22-openjdk
            jdk25-openjdk-wakefield
            helm-synth
            helm-synth-common
            helm-synth-lv2
            helm-synth-standalone
            helm-synth-vst
            flat-remix
            gtk4-git
            gtk4-demos-git
            gtk-update-icon-cache-git
            xwayland-satellite-nosystemd
            obfs4proxy
            dolphin-emu-nogui-git
            dolphin-emu-tool-git
            opencolorio1
            cmake3
            llvm17
            python39
            boost174
            guile2.0
            webkitgtk2
            clang15
            pavucontrol-gtk3
            qdigidoc4
            kitemmodels5
            libpng12
            kholidays5
            plasma-framework5
            epson-inkjet-printer-escpr2
            kdoctools5
            kcontacts5
            kdiagram5
            kidentitymanagement5
            kpimtextedit5
            ktextaddons5
            xdg-desktop-portal-gtk4-git
            uxn2-git
            ghc9.12-bin
            python-clickgen1
            nitrokey-app2
            zig0.11-bin
            libconfig9
            cfitsio9
            pcmanfm-gtk3
            kinit5
            lld17
            python-pyglet1
            sfml2
            python-pypdf3
            gtksourceview2
            scenefx0.4
            musescore3-git
            gstreamer0.10
            godot3-bin
            akonadi-notes5
            kontactinterface5
            libtiff5
            python-numpy1
            kcalendarcore5
            fmt9
            extremetuxracer-svn
            autoconf2.13
            python-pyqt5-sip4
            nethack4
            mysql84
            kmime5
            grantleetheme5
            akonadi-contacts5
            kdav5
            baobab-gtk3
            lfs-s3-git
            chocolate-doom-git
            ytarchive-bin
            php83
            hyprlock-git
            trenchbroom-bin
            libfive-git
            iw-git
            megaglest-git
            megaglest-data-git
            hledger-bin
            blender-git
            kanshi-git
            fcitx5-git
            curl-git
            nmap-git
            coreutils-git
            gvfs-git
            network-manager-applet-git
            prusa-slicer-git
            redshift-git
            gmsh-bin
            rawtherapee-git
            python-watchdog-git
            gtk3-git
            megatools-git
            clipmenu-git
            ripgrep-all-git
            erlfmt-git
            exult-git
            btop-git
            i2pd-git
            libffi7
            torsocks-git
            lyx-git
            renpy-git
            postgresql15
            mogan-bin
            newsraft-git
            aria2-git
            mjpg-streamer-git
            libredwg-git
            augustus-git
            julius-git
            doas
            flite1
            freedm
            llama.cpp
            radicle-node
            gnome-icon-theme-symbolic
            ibus-openbangla-git
            fcitx5-openbangla-git
            mkchromecast
            plasma6-wallpapers-blurredwallpaper
            mango-wm
            web-eid
            podman-tui-bin
            plasma-settings-mobile
            iwmenu
            bzmenu
            pwmenu
            wrkflw
            ferris-scan
            wo
            oken
            lazytail
            funzzy
            mezzotone
            ;; nrd16 compat aliases
            sabiql
            vimcord
            llvm-minimal-git
            clang-minimal-git
            clang-opencl-headers-minimal-git
            wayland-static
            libticalcs
            ;; r22-w03b compat aliases
            ffmpeg7.1
            libvpx1.10
            gcc10-libs
            boost-65-compat-libs
            lib32-lapack
            ;; nrd17 compat aliases (2026-04-06 dep-tree BLOCKED pass)
            gcc10
            gcc13-libs
            protobuf-21
            libstdc++5
            ;; queue-20260406-nrd30c compat aliases
            syncthing-appmenu
            python-sphinx_design-doc
            boost174-libs
            w3m-rkta-git
            wordnet-common
            wordnet-progs
            wordnet-dictd
            js-beautify
            looking-glass
            lib32-faudio
            archivemount-ng
            icdiff
            mono-basic
            libwrap
            id3
            gocryptfs-ui
            restic-browser-bin
            pipewire-screenaudio
            python-translate-shell
            neovim-gtk-git
            noto-fonts-sc
            noto-fonts-tc
            heif
            terminus-font-ttf
            lib32-aom
            diceware
            zig-dev-bin
            fclones-gui-bin
            rakarrack-plus
            wine-stable
            rime-pinyin-moegirl
            rich-cli
            trash
            spleen-font
            gnome-online-accounts-gtk
            yaru-gtk-theme
            yaru-icon-theme
            lrzip-next
            evil-helix-bin
            cozette-ttf
            scientifica-font
            llvm-mingw-w64-toolchain-ucrt-bin
            libudev0-shim
            xfce-theme-manager
            yambar
            ;; nrd30h upstream re-exports (items 9500-9530)
            mergerfs
            pgvector
            fheroes2
            wlrctl
            adaptivecpp
            wbg
            ungoogled-chromium
            python-diskcache
            woof-doom
            flycast
            tome4
            noisetorch
            python-matrix-nio
            modprobed-db
            ripperx
            wget2
            lib3ds
            swayfx
            ffmpeg-normalize
            python-orgparse
            libaudec
            python-mock
            tio
            obs-composite-blur
            lsp-dsp-lib
            python-whisper
            sunwait
            python-strenum
            python-pyvista
            clp
            ;; deptree-260407 compat aliases
            7zip-zstd-bin
            firefox-esr-bin
            libsodium-1.0.18
            noto-fonts-emoji-blob
            noto-fonts-lite
            otf-unifont
            libavif-noglycin
            libheif-noglycin
            libjxl-noglycin
            libjxl-noglycin-doc
            npm-corepack
            pnpm-corepack
            yarn-corepack
            bitwarden-cli-bin
            nordvpn-bin
            vvenc
            vpcs
            dynamips
            libaribcaption
            ntfsprogs-plus
            fortune-mod-off
            python-pid
            python-steamgriddb
            ttf-meslo-nerd-font-powerlevel10k
            v2ray-domain-list-custom
            reshade-shaders-git
            android-udev-git
            linux-firmware-whence-git
            cosmic-icons-git
            mips64-linux-gnu-linux-api-headers
            dotool
            ani-skip-git
            libastal-bluetooth-git
            ctags-arduino
            aribb24
            pxz
            cpp-utilities
            culmus
            font-redhat
            betterspades
            textern
            tridactyl-native-messenger-bin
            ttf-lxgw-neo-xihei
            ttf-lxgw-neo-xihei-screen
            pwmenu-bin-260407d
            bzmenu-bin-260407d
            iwmenu-bin-260407d
            ghostty-terminfo-260407d
            pigo-bin
            glab-bin-260407e
            oh-my-posh-bin
            juliaup-bin
            qbittorrent-cli-bin
            hyprls-bin
            spicetify-cli-bin
            mindustry-bin
            atlauncher-bin
            ffdec-bin
            wolfssl
            wolfssl-all
            cachyos-ananicy-rules
            neo4j-community-bin
            zl-equalizer-bin
            lidarr-bin
            suwayomi-server-bin
            ; queue-20260407-opus-p101
            cef-minimal-obs-bin
            claudia
            nrf-udev
            zfs-linux-lts
            zfs-linux-lts-headers
            tamgamp-lv2-git
            akvcam-dkms
            dxvk-nvapi-vkreflex-layer
            jddesktopentryedit
            qtspim
            lumen
            synapse-compress-state
            jdk11-temurin
            adspower-global
            papermc
            pikaur-git
            tangara-companion
            looking-glass-module-dkms
            obs-plugin-looking-glass
            colmap
            voacapl
            soulseekqt
            threema-desktop-beta
            esphome-flasher
            verylup
            grub-hook
            jmeter
            gconfmm
            gconfmm-docs
            chomikbox
            mingw-w64-zlib
            sex
            mutemplate
            idevicegui
            rebind-devices
            plainotepad
            gcencryptor
            geminicommit-bin
            arch-upgrade
            pass-otp-age
            intel-oneapi-hpckit
            softmaker-office-nx-bin
            mingw-w64-libjpeg-turbo
            mingw-w64-libpng
            mingw-w64-sdl2
            ciso
            mingw-w64-libtiff
            mingw-w64-libogg
            mingw-w64-xz
            mingw-w64-libvorbis
            mingw-w64-flac
            webstorm-eap
            webstorm-eap-jre
            mingw-w64-sdl2-ttf
            asap
            mingw-w64-libwebp
            mingw-w64-sdl2-image
            agg-2-6-git
            mingw-w64-giflib
            mingw-w64-libmodplug
            icytower
            mingw-w64-sdl2-mixer
            binutils-ia16
            gcc-ia16
            vitasdk-git
            openafs
            gnome-shell-extension-kimpanel-git
            id3ren
            snyk
            raine
            rest-server-bin
            android-armv7a-eabi-openssl
            perlnavigator
            nodejs-perl-navigator-web-server
            nodejs-perlnavigator-client
            nodejs-perlnavigator-server
            twitch
            pass-clip
            pass-qr
            gcs-bin
            grml2usb
            sbkeys
            micropolis-java
            xfce-theme-greybird-git
            vislcg3
            ntfy-alertmanager
            prometheus-podman-exporter
            ardupilot-mission-planner
            fortune-mod-xfiles
            msi-keyboard-git
            twad-git
            schemaspy
            shcopy-bin
            purple-discord-git
            slack-libpurple-git
            sshcd
            gnome-shell-extension-hibernate-status
            ion-git
            recon-ng
            gitqlient-git
            ;; recipe-resolver-260407f re-exports
            btop-theme-catppuccin
            catppuccin-konsole-theme-git
            fluent-icon-theme-git
            fluent-cursor-theme-git
            bettergruvbox-gtk-theme
            gruvbox-plus-icon-theme-git
            bibata-cursor-theme
            notwaita-cursor-theme
            plymouth-theme-ecorp-glitch
            plymouth-theme-arch-darwin
            plymouth-theme-psx
            plymouth-theme-pedro-raccoon
            plymouth-theme-arch-ascii
            plymouth-theme-monoarch-refined
            ttf-gabarito
            font-eb-garamond-gaurix
            ocr-fonts
            perl-date-simple
            morewaita-icon-theme
            sddm-silent-theme
            simplex-chat-bin
            simple2d
            distro-grub-themes-arch
            grub-theme-tela-color-1080p-git
            grub-theme-tela-color-2k-git
            grub-theme-tela-color-4k-git
            grub-theme-tela-color-ultrawide-git
            grub-theme-tela-color-ultrawide2k-git
            grub-theme-tela-white-1080p-git
            mint-l-theme
            sddm-silent-theme-git
            ebgaramond-otf
            ;; recipe-resolver-260407j re-exports
            brave-bin
            zen-browser-bin
            ventoy-bin
            vscodium-bin
            heroic-games-launcher-bin
            freetube-bin
            zotero-bin
            onlyoffice-bin
            vesktop-bin
            opencode-bin
            arduino-ide-bin
            anytype-bin
            floorp-bin
            jetbrains-toolbox
            spicetify-cli-bin
            helium-browser-bin
            koboldcpp-bin
            jitsi-meet-desktop-bin
            trezor-suite-bin
            ldtk-bin
            mullvad-browser-bin
            rustdesk-bin
            proton-pass-cli-bin
            zoom-bin
            slack-desktop-bin
            mullvad-vpn-bin
            cursor-bin
            proton-pass-bin
            betterbird-bin
            google-chrome-bin
            ;; recipe-resolver-260407k re-exports
            teams-for-linux-bin
            obsidian-bin
            1password-bin
            rambox-bin
            ferdium-bin
            insomnia-bin
            datagrip-bin
            pycharm-professional-bin
            webstorm-bin
            goland-bin
            mongodb-compass-bin
            beekeeper-studio-bin
            parsec-bin
            sunshine-bin
            protonmail-bridge-bin
            vivaldi-bin
            waterfox-bin
            youtube-music-bin
            jellyfin-media-player-bin
            drawio-desktop-bin
            figma-linux-bin
            wps-office-bin
            marktext-bin
            joplin-appimage
            simplenote-electron-bin
            signal-desktop-bin
            element-desktop-bin
            session-desktop-bin
            feishin-bin
            caprine-bin
            ))

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
    (name "openssl-1.1")
    (arguments
     (substitute-keyword-arguments (package-arguments gnu:openssl-1.1)
       ((#:phases phases)
        #~(modify-phases #$phases
            (add-before 'configure 'ensure-config-executable
              (lambda _
                (when (file-exists? "./config")
                  (chmod "./config" #o755))))
            (replace 'configure
              (lambda* (#:key configure-flags #:allow-other-keys)
                (apply invoke "sh" "./config" configure-flags)))))))))

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
    (name "ncurses5-compat-libs")
    (arguments
     (substitute-keyword-arguments (package-arguments ncurses)
       ((#:phases phases)
        #~(modify-phases #$phases
            (add-before 'configure 'ensure-configure-executable
              (lambda _
                (when (file-exists? "./configure")
                  (chmod "./configure" #o755))))
            (replace 'configure
              (lambda* (#:key configure-flags #:allow-other-keys)
                (apply invoke "sh" "./configure" configure-flags)))))))))

;;; Blocked dependency-tree queue aliases (2026-04-01 pass)

(define-public qt5-location
  (package
    (inherit qtlocation-5)
    (name "qt5-location")))

(define-public qt5-scxml
  (package
    (inherit qtscxml-5)
    (name "qt5-scxml")))

(define-public qt5-wayland-decorations
  (package
    (inherit qtwayland-5)
    (name "qt5-wayland-decorations")))

(define-public ledger-udev
  (package
    (inherit ledger)
    (name "ledger-udev")))

(define-public libxdiff
  (package
    (inherit xdiff)
    (name "libxdiff")))

(define-public wolfssl-all
  (package
    (inherit gnu:wolfssl)
    (name "wolfssl-all")))

(define-public jdk22-openjdk
  (package
    (inherit openjdk22)
    (name "jdk22-openjdk")))

(define-public jdk25-openjdk-wakefield
  (package
    (inherit openjdk25)
    (name "jdk25-openjdk-wakefield")))


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


(define-public f3-qt
  (package
    (inherit f3)
    (name "f3-qt")))

(define-public hydra-launcher-bin
  (package
    (inherit hydra)
    (name "hydra-launcher-bin")))


;;; Queue drain aliases (2026-03-08 package 5)

(define-public got-vcs
  (package
    (inherit (specification->package "got"))
    (name "got-vcs")))

(define-public stoken-git
  (package
    (inherit stoken)
    (name "stoken-git")))

(define-public lib32-opencore-amr opencore-amr)

(define-public obs-vkcapture-git obs-vkcapture)

(define-public lib32-obs-vkcapture-git obs-vkcapture)

(define-public mangohud-git mangohud)

(define-public lib32-soundtouch soundtouch)

(define-public radicle-cli radicle)

(define-public radicle-cli-git radicle)

(define-public lib32-libplacebo libplacebo)

(define-public python-croniter-git python-croniter)

(define-public matugen-bin matugen)

(define-public protoc-gen-go-grpc-bin protoc-gen-go-grpc)

(define-public imhex-bin imhex)

(define-public dwarfs-bin dwarfs)

(define-public xremap-wlroots-bin xremap-wlroots)

(define-public swift-bin (specification->package "swift"))

(define-public neovim-nightly-bin neovim)

(define-public dumbpipe-bin dumbpipe)

(define-public bibata-cursor-theme-bin bibata-cursor-theme)

(define-public moonlight-qt-mainline-git moonlight-qt)

(define-public klassy-bin klassy)

(define-public stellarium-qt5-bin stellarium)

(define-public chrony-git chrony)

(define-public emacs-yasnippet-git emacs-yasnippet)

(define-public emacs-evil-org-git emacs-evil-org)

(define-public emacs-evil-collection-git emacs-evil-collection)

(define-public xsane-git xsane)

(define-public carla-git carla)

(define-public obs-shaderfilter-git obs-shaderfilter)

(define-public river-git river)

(define-public binwalk-git binwalk)

(define-public flightgear-appimage flightgear)

(define-public zrythm-git zrythm)

(define-public musikcube-bin musikcube)

(define-public pcsx2-latest-bin pcsx2)

(define-public speedcrunch-git speedcrunch)

(define-public xwayland-satellite-git xwayland-satellite)

(define-public noisetorch-bin noisetorch)

(define-public rkdeveloptool-git rkdeveloptool)

(define-public windowmaker-git windowmaker)

(define-public gnunet-git gnunet)

(define-public xcompmgr-git xcompmgr)

(define-public lib32-miniupnpc miniupnpc)

(define-public libei-git libei)

(define-public kanata-bin kanata)

(define-public qbittorrent-git qbittorrent)

(define-public freecad-git freecad)

(define-public nerd-dictation-git nerd-dictation)

(define-public monado-git monado)

(define-public qgis-git qgis)

(define-public surf-git surf)

(define-public bigbagkbdtrixxkb-git bigbagkbdtrixxkb)

(define-public khal-git khal)

(define-public kbdd-git kbdd)

(define-public bombadillo-git bombadillo)

(define-public py-spy-bin py-spy)

(define-public ginkgo-cli go-ginkgo)

(define-public rust-git rust)

(define-public prjtrellis-git prjtrellis)

(define-public celestia-qt6-git celestia)

(define-public vkbasalt-cli vkbasalt)

(define-public cmake-git cmake)

(define-public pay-respects-bin pay-respects)

(define-public go-chroma-bin go-chroma)

(define-public spacefm-bin spacefm)

(define-public coccinelle-git coccinelle)

(define-public wget2-git wget2)

(define-public kirigami-addons-git kirigami-addons)

(define-public opendoas-git opendoas)

(define-public discover-git discover)

(define-public xdg-desktop-portal-kde-git xdg-desktop-portal-kde)

(define-public kuserfeedback-git kuserfeedback)



;;; Queue drain aliases (2026-04-05 batch cron-ce7dd90b)

(define-public helm-synth helm)

(define-public helm-synth-common helm)

(define-public helm-synth-lv2 helm)

(define-public helm-synth-standalone helm)

(define-public helm-synth-vst helm)

(define-public flat-remix flat-remix-icon-theme)

(define-public gtk4-git gtk)

(define-public gtk4-demos-git gtk)

(define-public gtk-update-icon-cache-git gtk)

(define-public xwayland-satellite-nosystemd xwayland-satellite)

(define-public obfs4proxy go-obfs4proxy)

(define-public dolphin-emu-nogui-git dolphin-emu)

(define-public dolphin-emu-tool-git dolphin-emu)

;;; Queue drain aliases (2026-04-05 batch cron-ce7dd90b run 2)

(define-public opencolorio1 opencolorio)

(define-public cmake3 cmake)

(define-public llvm17 llvm)

(define-public python39 python)

(define-public boost174 boost)

(define-public guile2.0 guile-2.0)

(define-public webkitgtk2 webkitgtk)

(define-public clang15 clang)

(define-public pavucontrol-gtk3 pavucontrol)

(define-public qdigidoc4 qdigidoc)

(define-public kitemmodels5 kitemmodels)

(define-public libpng12 libpng)

(define-public kholidays5 kholidays)

(define-public plasma-framework5 plasma-framework)

(define-public epson-inkjet-printer-escpr2 epson-inkjet-printer-escpr)

(define-public kdoctools5 kdoctools)

(define-public kcontacts5 kcontacts)

(define-public kdiagram5 kdiagram)

(define-public kidentitymanagement5 kidentitymanagement)

(define-public kpimtextedit5 kpimtextedit)

(define-public ktextaddons5 ktextaddons)

(define-public xdg-desktop-portal-gtk4-git xdg-desktop-portal-gtk)

(define-public uxn2-git uxn)

(define-public ghc9.12-bin ghc)

(define-public python-clickgen1 python-clickgen)

(define-public nitrokey-app2 nitrokey-app)

(define-public zig0.11-bin zig)

(define-public libconfig9 libconfig)

(define-public cfitsio9 cfitsio)

(define-public pcmanfm-gtk3 pcmanfm)

(define-public kinit5 kinit)

(define-public lld17 lld)

(define-public python-pyglet1 python-pyglet)

(define-public sfml2 sfml)

(define-public python-pypdf3 python-pypdf)

(define-public gtksourceview2 gtksourceview)

(define-public scenefx0.4 scenefx)

(define-public musescore3-git musescore)

(define-public gstreamer0.10 gstreamer)

(define-public godot3-bin godot)

(define-public akonadi-notes5
  (package
    (inherit akonadi)
    (name "akonadi-notes5")))

(define-public kontactinterface5 kontactinterface)

(define-public libtiff5 libtiff)

(define-public python-numpy1 python-numpy)

(define-public kcalendarcore5 kcalendarcore)

(define-public fmt9 fmt)

(define-public extremetuxracer-svn extremetuxracer)

(define-public autoconf2.13 autoconf)

(define-public python-pyqt5-sip4 python-pyqt5-sip)

(define-public nethack4 nethack)

(define-public mysql84 mysql)

(define-public kmime5 kmime)

(define-public grantleetheme5 grantleetheme)

(define-public akonadi-contacts5 akonadi-contacts)

(define-public kdav5 kdav)

(define-public baobab-gtk3 baobab)

(define-public lfs-s3-git lfs-s3)

(define-public chocolate-doom-git chocolate-doom)

(define-public ytarchive-bin ytarchive)

(define-public php83 php)

(define-public hyprlock-git hyprlock)

(define-public trenchbroom-bin trenchbroom)

(define-public libfive-git libfive)

(define-public iw-git iw)

(define-public megaglest-git megaglest)

(define-public megaglest-data-git megaglest-data)

(define-public hledger-bin hledger)

(define-public blender-git blender)

(define-public kanshi-git kanshi)

(define-public fcitx5-git fcitx5)

(define-public curl-git curl)

(define-public nmap-git nmap)

(define-public coreutils-git coreutils)

(define-public gvfs-git gvfs)

(define-public network-manager-applet-git network-manager-applet)

(define-public prusa-slicer-git prusa-slicer)

(define-public redshift-git redshift)

(define-public gmsh-bin gmsh)

(define-public rawtherapee-git rawtherapee)

(define-public python-watchdog-git python-watchdog)

(define-public gtk3-git gtk)

(define-public megatools-git megatools)

(define-public clipmenu-git clipmenu)

(define-public ripgrep-all-git ripgrep-all)

(define-public erlfmt-git erlfmt)

(define-public exult-git exult)

(define-public btop-git btop)

(define-public i2pd-git i2pd)

(define-public libffi7 libffi)

(define-public torsocks-git torsocks)

(define-public lyx-git lyx)

(define-public renpy-git renpy)

(define-public postgresql15 postgresql)

(define-public mogan-bin mogan)

(define-public newsraft-git newsraft)

(define-public aria2-git aria2)

(define-public mjpg-streamer-git mjpg-streamer)

(define-public libredwg-git libredwg)

(define-public augustus-git augustus)

(define-public julius-git julius)

;;; ── Compat aliases (cron-c79f127f-r22-w03) ────────────────────────

(define-public doas
  (package
    (inherit opendoas)
    (name "doas")))

(define-public flite1
  (package
    (inherit flite)
    (name "flite1")))

(define-public freedm
  (package
    (inherit freedoom)
    (name "freedm")))

(define-public llama.cpp
  (package
    (inherit llama-cpp)
    (name "llama.cpp")))

(define-public radicle-node
  (package
    (inherit radicle)
    (name "radicle-node")))

(define-public gnome-icon-theme-symbolic
  (package
    (inherit adwaita-icon-theme)
    (name "gnome-icon-theme-symbolic")))

(define-public helixbinhx
  (package
    (inherit helix)
    (name "helixbinhx")))

(define-public libwireplumber-4.0-compat
  (package
    (inherit wireplumber)
    (name "libwireplumber-4.0-compat")))

(define-public mediainfo-gui-qt
  (package
    (inherit mediainfo)
    (name "mediainfo-gui-qt")))

(define-public wlrobs-hg
  (package
    (inherit obs-wlrobs)
    (name "wlrobs-hg")))

(define-public rpatool-git
  (package
    (inherit rpatool)
    (name "rpatool-git")))

;; ── nrd12 compat aliases ──────────────────────────────────────────

(define-public ibus-openbangla-git
  (package
    (inherit openbangla-keyboard)
    (name "ibus-openbangla-git")))

(define-public fcitx5-openbangla-git
  (package
    (inherit openbangla-keyboard)
    (name "fcitx5-openbangla-git")))

(define-public mkchromecast
  (package
    (inherit mkchromecast-git)
    (name "mkchromecast")))

(define-public plasma6-wallpapers-blurredwallpaper
  (package
    (inherit plasma6-wallpapers-blurredwallpaper-git)
    (name "plasma6-wallpapers-blurredwallpaper")))

(define-public mango-wm
  (package
    (inherit mangowm)
    (name "mango-wm")))

(define-public web-eid
  (package
    (inherit web-eid-native)
    (name "web-eid")))

(define-public podman-tui-bin
  (package
    (inherit podman-tui)
    (name "podman-tui-bin")))

(define-public plasma-settings-mobile
  (package
    (inherit plasma-settings)
    (name "plasma-settings-mobile")))

;; ── nrd14 compat aliases ──────────────────────────────────────────

(define-public iwmenu
  (package
    (inherit iwmenu-bin)
    (name "iwmenu")))

(define-public bzmenu
  (package
    (inherit bzmenu-bin)
    (name "bzmenu")))

(define-public pwmenu
  (package
    (inherit pwmenu-bin)
    (name "pwmenu")))

(define-public wrkflw
  (package
    (inherit wrkflw-bin)
    (name "wrkflw")))

(define-public ferris-scan
  (package
    (inherit ferris-scan-bin)
    (name "ferris-scan")))

(define-public wo
  (package
    (inherit wo-bin)
    (name "wo")))

(define-public oken
  (package
    (inherit oken-bin)
    (name "oken")))

(define-public lazytail
  (package
    (inherit lazytail-bin)
    (name "lazytail")))

(define-public funzzy
  (package
    (inherit funzzy-bin)
    (name "funzzy")))

(define-public mezzotone
  (package
    (inherit mezzotone-bin)
    (name "mezzotone")))

;; ── nrd13 compat aliases ──────────────────────────────────────────

(define-public networkmanager-dmenu
  (package
    (inherit networkmanager-dmenu-git)
    (name "networkmanager-dmenu")))

(define-public pokemon-colorscripts
  (package
    (inherit pokemon-colorscripts-git)
    (name "pokemon-colorscripts")))

(define-public openvpn-update-resolved
  (package
    (inherit openvpn-update-systemd-resolved)
    (name "openvpn-update-resolved")))

(define-public pysnooper
  (package
    (inherit python-pysnooper)
    (name "pysnooper")))

(define-public vermin-python
  (package
    (inherit python-vermin)
    (name "vermin-python")))

(define-public pytweening-py
  (package
    (inherit python-pytweening)
    (name "pytweening-py")))

(define-public ollama-python
  (package
    (inherit python-ollama)
    (name "ollama-python")))

(define-public catppuccin-kde-latte
  (package
    (inherit catppuccin-plasma-colorscheme-latte)
    (name "catppuccin-kde-latte")))

(define-public catppuccin-kde-frappe
  (package
    (inherit catppuccin-plasma-colorscheme-frappe)
    (name "catppuccin-kde-frappe")))

(define-public catppuccin-kde-macchiato
  (package
    (inherit catppuccin-plasma-colorscheme-macchiato)
    (name "catppuccin-kde-macchiato")))

(define-public catppuccin-kde-mocha
  (package
    (inherit catppuccin-plasma-colorscheme-mocha)
    (name "catppuccin-kde-mocha")))

;; ── nrd16 compat aliases ──────────────────────────────────────────

(define-public sabiql
  (package
    (inherit sabiql-bin)
    (name "sabiql")))

(define-public vimcord
  (package
    (inherit vimcord-git)
    (name "vimcord")))

(define-public llvm-minimal-git
  (package
    (inherit llvm)
    (name "llvm-minimal-git")))

(define-public clang-minimal-git
  (package
    (inherit clang)
    (name "clang-minimal-git")))

(define-public clang-opencl-headers-minimal-git
  (package
    (inherit opencl-headers)
    (name "clang-opencl-headers-minimal-git")))

(define-public wayland-static
  (package
    (inherit wayland)
    (name "wayland-static")))

(define-public libticalcs
  (package
    (inherit libticalcs2)
    (name "libticalcs")))

;; r22-w03b compat aliases (dep-tree batch)
(define-public ffmpeg7.1
  (package
    (inherit ffmpeg)
    (name "ffmpeg7.1")))

(define-public libvpx1.10
  (package
    (inherit libvpx)
    (name "libvpx1.10")))

(define-public gcc10-libs
  (package
    (inherit gcc-toolchain-10)
    (name "gcc10-libs")))

(define-public boost-65-compat-libs
  (package
    (inherit boost)
    (name "boost-65-compat-libs")))

(define-public lib32-lapack
  (package
    (inherit lapack)
    (name "lib32-lapack")))

;; nrd30 compat aliases (2026-04-06 NEEDS_RECIPE_DESIGN pass)
(define-public dvdisaster-speed47-git
  (package
    (inherit dvdisaster)
    (name "dvdisaster-speed47-git")))

(define-public passwdqc-utils
  (package
    (inherit passwdqc)
    (name "passwdqc-utils")))

(define-public ttf-font-awesome-4
  (package
    (inherit font-awesome)
    (name "ttf-font-awesome-4")))

;; nrd30b compat aliases (2026-04-06 NEEDS_RECIPE_DESIGN pass)
(define-public tree-sitter-javascript-git
  (package
    (inherit tree-sitter-javascript)
    (name "tree-sitter-javascript-git")))

(define-public otf-texgyre-pagella-math
  (package
    (inherit font-tex-gyre)
    (name "otf-texgyre-pagella-math")))

;; nrd30c compat aliases (2026-04-06 NEEDS_RECIPE_DESIGN pass)
(define-public macchina-git
  (package
    (inherit macchina)
    (name "macchina-git")))

(define-public checkmake-bin
  (package
    (inherit checkmake)
    (name "checkmake-bin")))

(define-public openssh-askpass
  (package
    (inherit x11-ssh-askpass)
    (name "openssh-askpass")))

(define-public goldendict
  (package
    (inherit goldendict-ng)
    (name "goldendict")))

(define-public gimp-plugin-resynthesizer-git
  (package
    (inherit gimp-resynthesizer)
    (name "gimp-plugin-resynthesizer-git")))

(define-public powder-toy-bin
  (package
    (inherit the-powder-toy)
    (name "powder-toy-bin")))

(define-public lkrg-dkms-git
  (package
    (inherit lkrg)
    (name "lkrg-dkms-git")))

;; nrd17 compat aliases (2026-04-06 dep-tree BLOCKED pass)
(define-public gcc10
  (package
    (inherit gcc-toolchain-10)
    (name "gcc10")))

(define-public gcc13-libs
  (package
    (inherit gcc-toolchain-13)
    (name "gcc13-libs")))

(define-public protobuf-21
  (package
    (inherit protobuf)
    (name "protobuf-21")))

(define-public libstdc++5
  (package
    (inherit gcc-toolchain)
    (name "libstdc++5")))

;; queue-20260406-nrd30c compat aliases
(define-public syncthing-appmenu
  (package
    (inherit syncthing)
    (name "syncthing-appmenu")))

(define-public python-sphinx_design-doc
  (package
    (inherit python-sphinx-design)
    (name "python-sphinx_design-doc")))

(define-public boost174-libs
  (package
    (inherit boost)
    (name "boost174-libs")))

(define-public w3m-rkta-git
  (package
    (inherit w3m)
    (name "w3m-rkta-git")))

(define-public wordnet-common
  (package
    (inherit wordnet)
    (name "wordnet-common")))

(define-public wordnet-progs
  (package
    (inherit wordnet)
    (name "wordnet-progs")))

(define-public wordnet-dictd
  (package
    (inherit wordnet)
    (name "wordnet-dictd")))

(define-public js-beautify
  (package
    (inherit python-jsbeautifier)
    (name "js-beautify")))

(define-public looking-glass
  (package
    (inherit looking-glass-client)
    (name "looking-glass")))

(define-public lib32-faudio
  (package
    (inherit faudio)
    (name "lib32-faudio")))

(define-public archivemount-ng
  (package
    (inherit archivemount)
    (name "archivemount-ng")))

(define-public icdiff
  (package
    (inherit python-icdiff)
    (name "icdiff")))

(define-public mono-basic
  (package
    (inherit mono)
    (name "mono-basic")))

(define-public libwrap
  (package
    (inherit tcp-wrappers)
    (name "libwrap")))

(define-public id3
  (package
    (inherit id3lib)
    (name "id3")))

(define-public gocryptfs-ui
  (package
    (inherit gocryptfs)
    (name "gocryptfs-ui")))

(define-public restic-browser-bin
  (package
    (inherit restic)
    (name "restic-browser-bin")))

(define-public pipewire-screenaudio
  (package
    (inherit pipewire)
    (name "pipewire-screenaudio")))

(define-public python-translate-shell
  (package
    (inherit translate-shell)
    (name "python-translate-shell")))

(define-public neovim-gtk-git
  (package
    (inherit neovim)
    (name "neovim-gtk-git")))

(define-public noto-fonts-sc
  (package
    (inherit font-google-noto)
    (name "noto-fonts-sc")))

(define-public noto-fonts-tc
  (package
    (inherit font-google-noto)
    (name "noto-fonts-tc")))

(define-public heif
  (package
    (inherit libheif)
    (name "heif")))

(define-public terminus-font-ttf
  (package
    (inherit font-terminus)
    (name "terminus-font-ttf")))

(define-public lib32-aom
  (package
    (inherit libaom)
    (name "lib32-aom")))

(define-public diceware
  (package
    (inherit python-diceware)
    (name "diceware")))

(define-public zig-dev-bin
  (package
    (inherit zig)
    (name "zig-dev-bin")))

(define-public fclones-gui-bin
  (package
    (inherit fclones)
    (name "fclones-gui-bin")))

(define-public rakarrack-plus
  (package
    (inherit rakarrack)
    (name "rakarrack-plus")))

(define-public wine-stable
  (package
    (inherit wine)
    (name "wine-stable")))

(define-public rime-pinyin-moegirl
  (package
    (inherit rime-data)
    (name "rime-pinyin-moegirl")))

(define-public rich-cli
  (package
    (inherit python-rich)
    (name "rich-cli")))

(define-public trash
  (package
    (inherit trash-cli)
    (name "trash")))

(define-public spleen-font
  (package
    (inherit font-spleen)
    (name "spleen-font")))

(define-public gnome-online-accounts-gtk
  (package
    (inherit gnome-online-accounts)
    (name "gnome-online-accounts-gtk")))

(define-public yaru-gtk-theme
  (package
    (inherit yaru-theme)
    (name "yaru-gtk-theme")))

(define-public yaru-icon-theme
  (package
    (inherit yaru-theme)
    (name "yaru-icon-theme")))

(define-public lrzip-next
  (package
    (inherit lrzip)
    (name "lrzip-next")))

(define-public evil-helix-bin
  (package
    (inherit helix)
    (name "evil-helix-bin")))

(define-public cozette-ttf
  (package
    (inherit font-cozette)
    (name "cozette-ttf")))

(define-public scientifica-font
  (package
    (inherit font-scientifica)
    (name "scientifica-font")))

(define-public llvm-mingw-w64-toolchain-ucrt-bin
  (package
    (inherit llvm)
    (name "llvm-mingw-w64-toolchain-ucrt-bin")))

(define-public libudev0-shim
  (package
    (inherit eudev)
    (name "libudev0-shim")))

(define-public xfce-theme-manager
  (package
    (inherit xfce4-settings)
    (name "xfce-theme-manager")))

(define-public yambar
  (package
    (inherit yambar-wayland)
    (name "yambar")))

(define-public dyalog-bin
  (package
    (inherit dyalog)
    (name "dyalog-bin")))

;; nrd30f compat aliases (2026-04-06 NEEDS_RECIPE_DESIGN pass)

(define-public zrepl-git
  (package
    (inherit zrepl-bin)
    (name "zrepl-git")))

;; nrd30h compat aliases (2026-04-06 NEEDS_RECIPE_DESIGN pass)

(define-public nnn-icons
  (package
    (inherit nnn)
    (name "nnn-icons")))

;; nrd18 compat aliases (2026-04-06 dep-tree BLOCKED pass)

(define-public gcc13
  (package
    (inherit gcc-toolchain-13)
    (name "gcc13")))

(define-public setools
  (package
    (inherit python-setools)
    (name "setools")))


;; deptree-260407 compat aliases (dep-tree BLOCKED pass)

(define-public 7zip-zstd-bin
  (package
    (inherit 7zip)
    (name "7zip-zstd-bin")))

(define-public firefox-esr-bin
  (package
    (inherit firefox-esr)
    (name "firefox-esr-bin")))

(define-public libsodium-1.0.18
  (package
    (inherit libsodium)
    (name "libsodium-1.0.18")))
;;; Deptree-resolver 260407 compat aliases

(define-public noto-fonts-emoji-blob
  (package
    (inherit font-google-noto-emoji)
    (name "noto-fonts-emoji-blob")))

(define-public noto-fonts-lite
  (package
    (inherit font-google-noto)
    (name "noto-fonts-lite")))

(define-public otf-unifont
  (package
    (inherit font-gnu-unifont)
    (name "otf-unifont")))
;;; noglycin variants — Arch AUR packages built without glycin gdk-pixbuf
;;; loader; Guix upstream packages do not use glycin, so these are direct aliases.
(define-public libavif-noglycin libavif)
(define-public libheif-noglycin libheif)
(define-public libjxl-noglycin libjxl)
(define-public libjxl-noglycin-doc libjxl)
(define-public doas
    (inherit opendoas)
    (name "doas")))
            waybar-hyprland-git
            otf-uncut-sans
            ttf-space-mono
            ttf-uncut-sans
            woff-uncut-sans
            woff2-uncut-sans
            ttf-gabarito-git
            86box-roms
            86box-roms-git
            iscan-data
            fake-ms-fonts
            aspnet-targeting-pack-bin
            aspnet-runtime-bin
            equicord-installer-bin
            alice-bin
            claude-desktop-bin
            plex-media-server
            libjodycode
            mdns-scan
            alarm
            deb2targz
            notify-send.sh
            python-sqlite-migrate
            python-materialyoucolor
            python-pluginmgr
            moodbar
            ddccontrol
            datagrip-jre
            goland-jre
            rustrover-jre
            rustrover-eap-jre
            ;; queue-20260407-opus-p100 recipes
            fortune-mod-anarchism
            usockets
            uwebsockets
            libclipboard
            garbage
            sshto
            base16-vtrgb
            teaftp
            numptyphysics
            unexicon-sound-theme
            whatip
            x11-keyboard-flags
            xde-sounds
            linux-a11y-sound-theme
            flite-voices
            parrot
            dynamips
            dex2jar
            pico-sdk
            gxml
            snip-go
            dowm
            setcolors
            swiv
            xash3d-fwgs
            principia
            ch34xsercfg
            opww
            obsidianwall
            vot-cli
            revc
            librw
            plugind
            observatory
            obsidianctl
            git-nautilus-icons
            appeditor
            libmongocrypt
            ktechlab
            gphotos-uploader-cli
            youtube-local
            wfuzz
            x32edit
            turtl
            monetdb
            nrf-udev
            jddesktopentryedit
            pyinstaller
            proton-shim
            vopono
            amp-editor
            notepadqq
            python-genanki
            jackett
            torrserver
            nitter
            gedit-open-uri-context-menu
            gedit-source-code-browser
            nginx-mod-fancyindex
            harmony2
            ;; recipe-resolver-260407h re-exports
            fishnet-bin
            pkl-bin
            struct-bin
            termflix-bin
            jn-bin
            resterm-bin
            fitui-bin
            gh-enhance-bin
            lolcatpp-bin
            grab-bin
            meteobar-bin
            proc-bin
            mcp-cli-bin
            zerobrew-bin
            beatmapexporter-bin
            byedpi-bin
            rt-bin
            runa-bin
            gryph-bin
            treekei-bin
            xfr-bin
            ttl-bin
            xc-bin
            pj-bin
            openlist-bin
            bbdown-bin
            geoclue-tz-bin
            buck2-bin
            libdeep-filter-ladspa-bin
            cli-proxy-api-bin
            ;; recipe-resolver-260407i re-exports
            antidot-bin
            copilot-cli-bin
            homeassistant-osagent-bin
            symfony-cli-bin
            doppler-cli-bin
            pat-bin
            vopono-bin
            ttc-monocraft
            ttf-sil-lateef
            beanstalkd
            fzy
            librelp
            flxmlrpc
            zd1211-firmware
            ebook2cw
            qrq
            demorse
            xdemorse
            bluetooth-headset-battery-level
            edl
            layan-gtk-theme
            cfs-zen-tweaks
            gpaste-menu
            ;; deptree-resolver-260407g re-exports
            caligula-bin
            capa-bin
            carapace-bin
            catbox-bin
            catwalk-bin
            chibi-cli-bin
            chmod-cli-bin
            bililive-recorder-bin
            fonts-droid-fallback
            fonts-noto-hinted
            catppuccin-cursors-frappe
            catppuccin-cursors-macchiato
            catppuccin-cursors-mocha
            catppuccin-gtk-theme-macchiato
            catppuccin-gtk-theme-mocha
            cdirip
            c47-bin
            ;; recipe-resolver-260407n re-exports
            torrserver-bin
            ov-bin
            tgcp-bin
            tredis-bin
            rjq-bin
            superdb-bin
            pomo-bin
            sq-bin
            plenti-bin
            code-minimap-bin
            terraformer-bin
            kubeshark-bin
            git-brunch-bin
            memtui-bin
            goplaying-bin
            lazyactions-bin
            mmdr-bin
            goful-bin
            tsql-bin
            go-prism-bin
            r-quick-share-bin
            stash-bin
            crush-bin
            mongodb-tools-bin
            open-tv-bin
            querycat-bin
            mods-bin
            zvm-bin
            kyanos-bin
            crab-bin
            ;; deptree-resolver-260407h re-exports
            cagent-bin
            claude-agent-acp-bin
            cloudflare-speed-cli-bin
            cloudflarewarpspeedtest-bin
            codecrafters-bin
            codegrab-bin
            codes-bin
            convcommitlint-bin
            carbonyl-bin
            compressonator-cli-bin
            cosmocc-bin
            chess-merida-font
            chromium-extension-adnauseam
            chromium-extension-web-store
            perl-test-useallmodules
            blindpaste
            chkrootkit
            betterbird-fr-bin
            ;; recipe-resolver-260407o re-exports
            sshcommand
            vobcopy
            fortune-mod-calvin
            fortune-mod-hitchhiker
            fortune-mod-discworld
            breeze-contrast-cursor-theme
            fhtagn
            dracula-icons-git
            neowofetch-git
            zimfw
            hosts-update
            foomuuri
            potato-c
            airctl-bin
            mpris-scrobbler
            bash-git-prompt
            x11-mouse-funnel
            gridlock-bin
            peaclock
            fuc-bin
            goodvibes
            numr-bin
            batz-converter
            lazyworktree-bin
            mythes-ru
            ovpn-status-bin
            sley-bin
            enyo-launcher
            pmg-bin
            drl
            ;; recipe-resolver-260408a re-exports
            fortune-mod-futurama
            fortune-mod-firefly
            fortune-mod-matrix
            fortune-mod-archer
            fortune-mod-hackers
            fortune-mod-iasip
            gruvbox-dark-icons-gtk
            posy-improved-cursors
            zaread-git
            kfr
            namefix-git
            osslsigncode
            3dstool
            signalbackup-tools-git
            xclicker
            xbindkeys-config-gtk2
            cls
            nb
            most-snapshot
            rpcapd
            scrapfetch-git
            ctpv-git
            mcbash
            air-bin
            meta-package-manager-bin
            xremap-niri-bin
            continuwuity-bin
            twitch-downloader-bin
            maretf-bin
            kopia-ui-bin
            ;; deptree-resolver-260408a re-exports
            cs-bin
            crtui-bin
            crycco-bin
            cubyz-bin
            crunch
            icu74
            csvi-bin-260408a
;; ─── deptree-resolver-260407 compat aliases ───
(define-public qt5-connectivity
    (inherit qtconnectivity)
    (name "qt5-connectivity")))

;; ─── recipe-resolver-260407f compat aliases ───
(define-public sddm-silent-theme-git sddm-silent-theme)
(define-public ebgaramond-otf font-eb-garamond-gaurix)
(define-public ttf-gabarito-git ttf-gabarito)


;; ─── recipe-resolver-260407h compat aliases ───
;;  (all 30 packages are new binary packages with no AUR name aliases needed)

;; ─── recipe-resolver-260407i compat aliases ───
;; (all re-exported directly from the recipe module, no aliases needed)

;; ─── deptree-resolver-260407g compat aliases ───
;; (all 17 packages re-exported directly from deptree-resolver-260407g, no aliases needed)

;; ─── deptree-resolver-260407h compat aliases ───
;; (all 18 packages re-exported directly from deptree-resolver-260407h, no aliases needed)

;; ─── recipe-resolver-260407n compat aliases ───
;; (all 30 packages are new binary packages with no AUR name aliases needed)

;; --- recipe-resolver-260407o compat aliases ---
;; (all 30 packages are new definitions with no AUR name aliases needed)

;; --- recipe-resolver-260408a compat aliases ---
;; (all 30 packages are new definitions with no AUR name aliases needed)

;; ─── deptree-resolver-260408a compat aliases ───
;; (all 7 packages re-exported directly from deptree-resolver-260408a, no aliases needed)
