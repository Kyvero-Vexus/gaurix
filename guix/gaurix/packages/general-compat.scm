(define-module (gaurix packages general-compat)
  #:use-module (gaurix packages llama-cpp-cuda)
  #:use-module (gaurix packages deptree-resolver-260407c)
  #:use-module (gaurix packages deptree-resolver-260407d)
  #:use-module (gaurix packages deptree-resolver-260408b)
  #:use-module (gaurix packages deptree-resolver-260408c)
  #:use-module (gaurix packages deptree-resolver-260408d)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages rdesktop)
  #:use-module (gnu packages i2p)
  #:use-module (gnu packages sync)
  #:use-module (gaurix packages fluxer-bin)
  ;; NOTE: recipe-resolver-260407b has syntax errors; skipped
  ;; #:use-module (gaurix packages recipe-resolver-260407b)
  #:use-module (gaurix packages recipe-resolver-260407d)
  #:use-module (gaurix packages recipe-resolver-260407e)
  #:use-module (gaurix packages recipe-resolver-260407f)
  #:use-module (gaurix packages recipe-resolver-260412a)
  #:use-module (gaurix packages recipe-resolver-260413c)
  #:use-module (gaurix packages recipe-resolver-260413h)
  #:use-module (gaurix packages recipe-resolver-260413i)
  #:use-module (gaurix packages recipe-resolver-260413j)
  #:use-module (gaurix packages recipe-resolver-260413m)
  #:use-module (gaurix packages recipe-resolver-260413s)
  #:use-module (gaurix packages recipe-resolver-260413u)
  #:use-module (gaurix packages recipe-resolver-260413v)
  #:use-module (gaurix packages recipe-resolver-260413w)
  #:use-module (gaurix packages recipe-resolver-260413ad)
  #:use-module (gaurix packages recipe-resolver-260413af)
  #:use-module (gaurix packages recipe-resolver-260413ag)
  #:use-module (gaurix packages recipe-resolver-260413ah)
  #:use-module (gaurix packages recipe-resolver-260413aj)
  #:use-module (gaurix packages recipe-resolver-260413ak)
  #:use-module (gaurix packages recipe-resolver-260413al)
  #:use-module (gaurix packages recipe-resolver-260414c)
  #:use-module (gaurix packages recipe-resolver-260414e)
  #:use-module (gaurix packages recipe-resolver-260414f)
  #:use-module (gaurix packages recipe-resolver-260414j)
  #:use-module (gaurix packages recipe-resolver-260414i)
  #:use-module (gaurix packages recipe-resolver-260414l)
  #:use-module (gaurix packages recipe-resolver-260414o)
  #:use-module (gaurix packages recipe-resolver-260414p)
  #:use-module (gaurix packages recipe-resolver-260414v)
  #:use-module (gaurix packages recipe-resolver-260414z)
  #:use-module (gaurix packages recipe-resolver-260414aa)
  #:use-module (gaurix packages recipe-resolver-260414ab)
  #:use-module (gaurix packages deptree-resolver-260413n)
  #:use-module (gaurix packages deptree-resolver-260413p)
  #:use-module (gaurix packages deptree-resolver-260413q)
  #:use-module (gaurix packages deptree-resolver-260414p)
  #:use-module (gaurix packages deptree-resolver-260414r)
  #:use-module (gaurix packages deptree-resolver-260415l)
  #:use-module (gaurix packages deptree-resolver-260415m)
  #:use-module (gaurix packages deptree-resolver-260415n)
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
  #:use-module (nongnu packages video)
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
  #:use-module (gaurix packages recipe-resolver-260408b)
  #:use-module (gaurix packages recipe-resolver-260408c)
  #:use-module (gaurix packages recipe-resolver-260408d)
  #:use-module (gaurix packages recipe-resolver-260408e)
  #:use-module (gaurix packages recipe-resolver-260408b)
  #:use-module (gaurix packages recipe-resolver-260408c)
  #:use-module (gaurix packages recipe-resolver-260408d)
  #:use-module (gaurix packages recipe-resolver-260408e)
  #:use-module (gaurix packages recipe-resolver-260408f)
  #:use-module (gaurix packages recipe-resolver-260408g)
  #:use-module (gaurix packages recipe-resolver-260408h)
  #:use-module (gaurix packages recipe-resolver-260408i)
  #:use-module (gaurix packages recipe-resolver-260408j)
  #:use-module (gaurix packages recipe-resolver-260408k)
  #:use-module (gaurix packages recipe-resolver-260408l)
  #:use-module (gaurix packages recipe-resolver-260408l)
  #:use-module (gaurix packages deptree-resolver-260408e)
  #:use-module (gaurix packages deptree-resolver-260408f)
  #:use-module (gaurix packages deptree-resolver-260408g)
  #:use-module (gaurix packages recipe-resolver-260408m)
  #:use-module (gaurix packages recipe-resolver-260408o)
  #:use-module (gaurix packages recipe-resolver-260408p)
  #:use-module (gaurix packages recipe-resolver-260408q)
  #:use-module (gaurix packages recipe-resolver-260408r)
  #:use-module (gaurix packages recipe-resolver-260408s)
  #:use-module (gaurix packages recipe-resolver-260408t)
  #:use-module (gaurix packages recipe-resolver-260408u)
  #:use-module (gaurix packages recipe-resolver-260408v)
  #:use-module (gaurix packages recipe-resolver-260408w)
  #:use-module (gaurix packages recipe-resolver-260408x)
  #:use-module (gaurix packages deptree-resolver-260408h)
  #:use-module (gaurix packages deptree-resolver-260408i)
  #:use-module (gaurix packages deptree-resolver-260408j)
  #:use-module (gaurix packages deptree-resolver-260408k)
  #:use-module (gaurix packages recipe-resolver-260408y)
  #:use-module (gaurix packages deptree-resolver-260412a)
  #:use-module (gaurix packages recipe-resolver-260412b)
  #:use-module (gaurix packages recipe-resolver-260412c)
  #:use-module (gaurix packages recipe-resolver-260413a)
  #:use-module (gaurix packages recipe-resolver-260413b)
  #:use-module (gaurix packages deptree-resolver-260413b)
  #:use-module (gaurix packages recipe-resolver-260413d)
  #:use-module (gaurix packages recipe-resolver-260413f)
  #:use-module (gaurix packages recipe-resolver-260413g)
  #:use-module (gaurix packages deptree-resolver-260413c)
  #:use-module (gaurix packages deptree-resolver-260413d)
  #:use-module (gaurix packages deptree-resolver-260413e)
  #:use-module (gaurix packages deptree-resolver-260413f)
  #:use-module (gaurix packages recipe-resolver-260413k)
  #:use-module (gaurix packages recipe-resolver-260413l)
  #:use-module (gaurix packages deptree-resolver-260413g)
  #:use-module (gaurix packages recipe-resolver-260413n)
  #:use-module (gaurix packages deptree-resolver-260413h)
  #:use-module (gaurix packages recipe-resolver-260413p)
  #:use-module (gaurix packages recipe-resolver-260413r)
  #:use-module (gaurix packages recipe-resolver-260413q)
  #:use-module (gaurix packages deptree-resolver-260413i)
  #:use-module (gaurix packages deptree-resolver-260413j)
  #:use-module (gnu packages telephony)
  #:use-module (gnu packages rdf)
  #:use-module (gnu packages datastructures)
  #:use-module (gnu packages hunspell)
  #:use-module (gaurix packages recipe-resolver-260413t)
  #:use-module (gaurix packages deptree-resolver-260413k)
  #:use-module (gaurix packages recipe-resolver-260413x)
  #:use-module (gaurix packages recipe-resolver-260413y)
  #:use-module (gaurix packages recipe-resolver-260413z)
  #:use-module (gaurix packages deptree-resolver-260413l)
  #:use-module (gaurix packages deptree-resolver-260413m)
  #:use-module (gaurix packages deptree-resolver-260413o)
  #:use-module (gaurix packages recipe-resolver-260413ab)
  #:use-module (gaurix packages recipe-resolver-260413ac)
  #:use-module (gaurix packages recipe-resolver-260413ai)
  #:use-module (gaurix packages recipe-resolver-260414a)
  #:use-module (gaurix packages deptree-resolver-260414b)
  #:use-module (gaurix packages recipe-resolver-260414b)
  #:use-module (gaurix packages recipe-resolver-260414k)
  #:use-module (gaurix packages deptree-resolver-260414c)
  #:use-module (gaurix packages deptree-resolver-260414d)
  #:use-module (gaurix packages deptree-resolver-260414e)
  #:use-module (gaurix packages deptree-resolver-260414i)

  #:use-module (gaurix packages deptree-resolver-260414j)

  #:use-module (gaurix packages deptree-resolver-260414k)
  #:use-module (gaurix packages recipe-resolver-260414m)
  #:use-module (gaurix packages recipe-resolver-260414n)

  #:use-module (gaurix packages deptree-resolver-260414l)

  #:use-module (gaurix packages deptree-resolver-260414m)
  #:use-module (gaurix packages recipe-resolver-260414q)
  #:use-module (gaurix packages recipe-resolver-260414r)
  #:use-module (gaurix packages recipe-resolver-260414u)

  #:use-module (gaurix packages deptree-resolver-260414n)

  #:use-module (gaurix packages deptree-resolver-260414o)
  #:use-module (gaurix packages deptree-resolver-260414q)
  #:use-module (gaurix packages deptree-resolver-260414t)
  #:use-module (gaurix packages recipe-resolver-260414w)
  #:use-module (gaurix packages recipe-resolver-260414x)
  #:use-module (gaurix packages recipe-resolver-260414y)
  #:use-module (gaurix packages recipe-resolver-260414ac)
  #:use-module (gaurix packages recipe-resolver-260414ae)
  #:use-module (gaurix packages deptree-resolver-260414u)
  #:use-module (gaurix packages recipe-resolver-260414af)
  #:use-module (gaurix packages recipe-resolver-260414ag)
  #:use-module (gaurix packages recipe-resolver-260415a)
  #:use-module (gaurix packages recipe-resolver-260415b)
  #:use-module (gaurix packages deptree-resolver-260414v)
  #:use-module (gaurix packages deptree-resolver-260415b)
  #:use-module (gaurix packages recipe-resolver-260415c)
  #:use-module (gaurix packages recipe-resolver-260415d)
  #:use-module (gaurix packages recipe-resolver-260415e)
  #:use-module (gaurix packages deptree-resolver-260415c)

  #:use-module (gaurix packages deptree-resolver-260415g)
  #:use-module (gaurix packages deptree-resolver-260415f)
  #:use-module (gaurix packages recipe-resolver-260415g)
  #:use-module (gaurix packages recipe-resolver-260415h)
  #:use-module (gaurix packages recipe-resolver-260415i)
  #:use-module (gaurix packages recipe-resolver-260415j)
  #:use-module (gaurix packages deptree-resolver-260415h)
  #:use-module (gaurix packages deptree-resolver-260415i)
  #:use-module (gaurix packages deptree-resolver-260415j)
  #:use-module (gaurix packages recipe-resolver-260415k)
  #:use-module (gaurix packages recipe-resolver-260415l)
  #:use-module (gaurix packages recipe-resolver-260415m)
  #:use-module (gaurix packages deptree-resolver-260415k)
  #:use-module (gaurix packages recipe-resolver-260415n)
  #:export (
            ;; recipe-resolver-260413l recipes
            font-heuristica
            font-gelasio
            font-lxgw-wenkai-screen
            font-lxgw-fasmart-gothic
            font-ubuntu-sans-mono
            font-blobmoji
            graphite-cursor-theme
            rose-pine-hyprcursor
            googledot-cursor-theme
            phiola-bin
            ionosctl-bin
            fhc-bin
            hypruler-bin
            logviewer-bin
            termide-bin
            gnome-shell-extension-tiling-assistant
            gnome-shell-extension-pop-shell
            gnome-shell-extension-logo-menu
            gnome-shell-extension-just-perfection
            gnome-shell-extension-blur-my-shell
            gnome-shell-extension-run-or-raise
            gnome-shell-extension-panel-date-format
            gnome-shell-extension-media-controls
            ;; recipe-resolver-260413l compat aliases
            ttf-gelasio-variable
            noto-fonts-emoji-blob
            graphite-cursor-theme-git
            gnome-shell-extension-pop-shell-git
            gnome-shell-extension-just-perfection-desktop
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
            ;; re-integrated orphaned exports
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
            ;; recipe-resolver-260408b re-exports
            otf-atkinson-hyperlegible-next
            ttf-atkinson-hyperlegible-next
            ttf-atkinson-hyperlegible-next-variable
            otf-atkinson-hyperlegible-next-mono
            ttf-atkinson-hyperlegible-next-mono
            ttf-atkinson-hyperlegible-next-mono-variable
            blobmoji
            candy-icons-git
            sweet-folders-icons-git
            gruvbox-icon-theme-git
            breeze-hacked-cursor-theme-git
            grub-theme-tela-white-2k-git
            grub-theme-tela-white-4k-git
            grub2-theme-archxion
            grub2-theme-archlinux
            sound-theme-smooth
            gruvbox-gtk-theme-git
            xfce-theme-cobibird
            fagram-bin
            pixieditor-bin
            android-apktool-bin
            amdgpu-clocks
            python-funk
            nvimpager
            jome
            croaring
            logiops-git
            duckduckgo-chat-cli
            plymouth-theme-hexagon-alt-gruvbox
            puddletag
            ;; recipe-resolver-260408c re-exports
            palemoon-bin
            simplex-desktop-appimage
            alcom-bin
            torrra-bin
            katana-bin
            ytui-bin
            clang-format-static-bin
            easytier-bin
            reshell-bin
            quickserv-bin
            f2-bin
            nfpm-bin
            breaktimer-bin
            activitywatch-bin
            zaproxy-bin
            codename-goose-bin
            flaca-bin
            mcontrolcenter-bin
            soundy-bin
            nimo-bin
            webplotdigitizer-bin
            tunein-cli-bin
            littlenavmap-bin
            tuxedo-webfai-creator-bin
            nethermind-ethereum-bin
            emudeck-bin
            fontbase
            epochcli
            spoofdpi
            smartamp
            qtscrcpy-bin
            implay
            chiaki-ng
            fluent-reader-bin
            ;; recipe-resolver-260408d re-exports
            ttf-wps-fonts
            ttf-rounded-mplus
            behdad-fonts
            shahab-fonts
            iranian-fonts
            tanha-fonts
            ttf-signika
            ttf-merriweather-sans
            ttf-merriweather
            ttf-quintessential
            ttf-readex-pro
            maplemono-ttf-autohint
            ttf-rubik-vf
            ttf-material-icons-git
            phinger-cursors
            catppuccin-gtk-theme-git
            numix-square-icon-theme
            python-pip-search
            python-lsp-ruff
            python-chex
            python-hf-transfer
            python-pynvml
            python-ipware
            python-fugashi
            python-msoffcrypto-tool
            python-gps3
            python-manuf
            nvitop
            angrysearch
            python-vondb
            kcc
            beeref
            ;; recipe-resolver-260408e re-exports
            btrfs-list
            chkboot
            envchain
            lpac
            libeuicc
            minify
            cheat
            quickserve
            dcfldd
            i8kutils
            cmoc
            lwtools
            procmon
            snort
            crowdsec
            tetrs
            bkmr
            stor
            jellyfin-tui
            oblivion-desktop-bin
            siyuan-note-bin
            codex-bin
            gowall
            ;; 260408c-batch compat aliases
            vulkan-icd-loader-git
            bdf-unifont
            fastfetch-gif-git
            libmpv-git
            yaru-sound-theme
            yaru-gtksourceview-theme
            yaru-gnome-shell-theme
            yaru-xfwm4-theme
            yaru-unity-theme
            yaru-metacity-theme
            yaru-session
            ;; recipe-resolver-260408b re-exports
            otf-atkinson-hyperlegible-next
            ttf-atkinson-hyperlegible-next
            ttf-atkinson-hyperlegible-next-variable
            otf-atkinson-hyperlegible-next-mono
            ttf-atkinson-hyperlegible-next-mono
            ttf-atkinson-hyperlegible-next-mono-variable
            blobmoji
            candy-icons-git
            sweet-folders-icons-git
            gruvbox-icon-theme-git
            breeze-hacked-cursor-theme-git
            grub-theme-tela-white-2k-git
            grub-theme-tela-white-4k-git
            grub2-theme-archxion
            grub2-theme-archlinux
            sound-theme-smooth
            gruvbox-gtk-theme-git
            xfce-theme-cobibird
            fagram-bin
            pixieditor-bin
            android-apktool-bin
            amdgpu-clocks
            python-funk
            nvimpager
            jome
            croaring
            logiops-git
            duckduckgo-chat-cli
            plymouth-theme-hexagon-alt-gruvbox
            puddletag
            ;; recipe-resolver-260408c re-exports
            palemoon-bin
            simplex-desktop-appimage
            alcom-bin
            torrra-bin
            katana-bin
            ytui-bin
            clang-format-static-bin
            easytier-bin
            reshell-bin
            quickserv-bin
            f2-bin
            nfpm-bin
            breaktimer-bin
            activitywatch-bin
            zaproxy-bin
            codename-goose-bin
            flaca-bin
            mcontrolcenter-bin
            soundy-bin
            nimo-bin
            webplotdigitizer-bin
            tunein-cli-bin
            littlenavmap-bin
            tuxedo-webfai-creator-bin
            nethermind-ethereum-bin
            emudeck-bin
            fontbase
            epochcli
            spoofdpi
            smartamp
            qtscrcpy-bin
            implay
            chiaki-ng
            fluent-reader-bin
            ;; recipe-resolver-260408d re-exports
            ttf-wps-fonts
            ttf-rounded-mplus
            behdad-fonts
            shahab-fonts
            iranian-fonts
            tanha-fonts
            ttf-signika
            ttf-merriweather-sans
            ttf-merriweather
            ttf-quintessential
            ttf-readex-pro
            maplemono-ttf-autohint
            ttf-rubik-vf
            ttf-material-icons-git
            phinger-cursors
            catppuccin-gtk-theme-git
            numix-square-icon-theme
            python-pip-search
            python-lsp-ruff
            python-chex
            python-hf-transfer
            python-pynvml
            python-ipware
            python-fugashi
            python-msoffcrypto-tool
            python-gps3
            python-manuf
            nvitop
            angrysearch
            python-vondb
            kcc
            beeref
            ;; recipe-resolver-260408e re-exports
            ;; recipe-resolver-260408f re-exports
            xlibre-input-wacom
            xlibre-video-fbdev
            ffmpeg-amd-full
            slack-desktop
            oh-my-posh
            spicetify-cli
            rustdesk
            qbittorrent-cli
            hyprls
            ffdec
            logseq-desktop-bin
            rider-bin
            xnviewmp-bin
            tutanota-desktop-bin
            shutter-encoder-bin
            freefilesync-bin
            appimagelauncher-bin
            logseq-desktop
            rider
            xnviewmp
            tutanota-desktop
            shutter-encoder
            freefilesync
            appimagelauncher
            btrfs-list
            chkboot
            envchain
            lpac
            libeuicc
            minify
            cheat
            quickserve
            dcfldd
            i8kutils
            cmoc
            lwtools
            procmon
            snort
            crowdsec
            tetrs
            bkmr
            stor
            jellyfin-tui
            oblivion-desktop-bin
            siyuan-note-bin
            codex-bin
            gowall
            ;; recipe-resolver-260408g re-exports
            android-studio-bin
            netbeans-bin
            localsend-git
            logseq-desktop-git
            xlibre-input-wacom-bin
            xlibre-video-fbdev-bin
            appimagelauncher-git
            ffmpeg-amd-full-git
            android-studio
            netbeans
            ;; 260408c-batch compat aliases
            vulkan-icd-loader-git
            bdf-unifont
            fastfetch-gif-git
            libmpv-git
            yaru-sound-theme
            yaru-gtksourceview-theme
            yaru-gnome-shell-theme
            yaru-xfwm4-theme
            yaru-unity-theme
            yaru-metacity-theme
            yaru-session
            ;; recipe-resolver-260408i compat aliases
            recaf
            pixelorama-git
            tnoodle-wca
            flclash
            openmarch
            chataigne-stable
            ;; recipe-resolver-260408j compat aliases
            wootility
            muse-sounds-manager
            java-openjdk-ea
            swiftly
            ;; recipe-resolver-260408k compat aliases
            ttf-b612
            crabdrop
            matcha-client
            github-account-switch
            xc
            ;; recipe-resolver-260408l compat aliases
            alacritty-gnome-darkmode
            ;; recipe-resolver-260408p compat aliases
            otf-geist
            ttf-geist
            ttf-geist-variable
            otf-geist-mono
            ttf-geist-mono
            ttf-geist-mono-variable
            sddm-theme-elegant-archlinux-git
            brokefetch-git
            vhd2vl-git
            sc-git
                        localsend
            juliaup
            mindustry
            lidarr
            zl-equalizer
            wallchemy
            atlauncher
            kopia
            kopia-ui
            playit
            arduino-ctags
            notesnook-bin
            jellyfin-desktop-bin
            libsmb2
            playit-agent-bin
            ;; --- recipe-resolver-260408u exports ---
            font-courier-prime
            font-comic-mono
            font-juliamono
            font-monocraft
            font-gentium-basic
            font-lxgw-fasmart-gothic
            btop-theme-catppuccin
            qogir-gtk-theme
            morewaita-icon-theme
            vimix-gtk-themes
            spicetify-themes
            pdfsam-bin
            process-compose-bin
            rp-bin
            bifrost-bin
            bitwarden-rofi
            lenovo-wwan-unlock
            zsh-you-should-use
            bash-complete-alias
            python-blockdiag
            python-nwdiag
            python-actdiag
            waybar-crypto
            lief
            mstflint
            graphite-gtk-theme-wallpaper-git
            graphite-gtk-theme-rimless-normal-git
            graphite-gtk-theme-rimless-normal-compact-git
            graphite-gtk-theme-rimless-git
            graphite-gtk-theme-rimless-compact-git
            graphite-gtk-theme-normal-git
            graphite-gtk-theme-normal-compact-git
            graphite-gtk-theme-nord-rimless-normal-git
            graphite-gtk-theme-nord-rimless-normal-compact-git
            graphite-gtk-theme-nord-rimless-git
            graphite-gtk-theme-nord-rimless-compact-git
            graphite-gtk-theme-nord-normal-git
            graphite-gtk-theme-nord-normal-compact-git
            graphite-gtk-theme-nord-git
            graphite-gtk-theme-nord-compact-git
            graphite-gtk-theme-git
            graphite-gtk-theme-compact-git
            graphite-gtk-theme-black-rimless-normal-git
            graphite-gtk-theme-black-rimless-normal-compact-git
            graphite-gtk-theme-black-rimless-git
            graphite-gtk-theme-black-rimless-compact-git
            graphite-gtk-theme-black-normal-git
            graphite-gtk-theme-black-normal-compact-git
            graphite-gtk-theme-black-git
            graphite-gtk-theme-black-compact-git
            fontpreview-git
            ;; recipe-resolver-260408y
            unciv-bin
            pseint-bin
            sparta-plugins-bin
            pdf4qt-bin
            spotube-bin
            audio-share-bin
            nekoray-bin
            tacentview-bin
            exifcleaner-bin
            sherlock-launcher-bin
            koala-clash-bin
            termframe-bin
            voxtype-bin
            odinls-bin
            raptor-cage-bin
            geteduroam-gui-bin
            dawn-writer-bin
            portablemc-bin
            cake-wallet-bin
            betterbird-es-bin
            ab-download-manager-bin
            bizhawk-bin
            bs-manager-bin

            windsurf
            offpunk-git
            brscan5
            megasync
            jdtls
            irpf2025
            woff2-material-symbols-variable
            microsoft-identity-broker
            hyprshutdown-compat
            bitwig-studio
            notion-app-electron
            nettui
            opentubex
            ani2xcursor
            crtui
            mdterm
            btdu
            openide
            tsenta-desktop
            bookokrat
            terraria-server
            intune-portal
            reiserfsprogs
            waterfox-bin-pkg
            windsurf-bin
            offpunk
            brscan5-bin
            megasync-bin
            google-cloud-cli-bq
            google-cloud-cli-gsutil
            google-cloud-cli-python3
            gke-gcloud-auth-plugin
            ironwail
            jdtls-bin
            irpf2025-bin
            xdg-su
            font-material-symbols-variable
            microsoft-identity-broker-bin
            wps-office-mui-zh-cn
            hyprshutdown
            bitwig-studio-bin
            vmware-keymaps
            reiserfsprogs-pkg
            notion-app-bin
            nettui-bin
            opentubex-bin
            ani2xcursor-bin
            crtui-bin
            mdterm-bin
            btdu-bin
            openide-bin
            tsenta-desktop-bin
            bookokrat-bin
            terraria-server-bin
            intune-portal-bin
            ;; recipe-resolver-260413b exports
            arduino-ctags
            nnn-nerd
            trayer
            potato-c
            fey
            rp-plus-plus
            croaring
            libsmb2
            jome
            qtilitools
            wasistlos
            openclaw
            netrc
            pigo
            mpris-scrobbler
            notejot
            butler
            puddletag
            tex-fmt
            bash-git-prompt
            font-atkinson-hyperlegible-next
            auto-throttle
            wingedit
            fortune-mod-futurama
            ;; recipe-resolver-260413f compat aliases
            sizeof
            nextdns
            intermodal
            ov
            torrserver
            rjq
            tmpo
            dol
            sq
            mynav
            solv
            superdb
            whosthere
            python-face_recognition_models

            ;; recipe-resolver-260413q recipes
            firefox-beta-bin
            anydesk-bin
            dxvk-bin
            mailspring-bin
            keybase-bin
            robo3t-bin
            jd-gui-bin
            microsoft-edge-dev-bin
            streamlink-twitch-gui-bin
            powershell-bin
            gotop-bin
            duplicati-canary-bin
            github-desktop-bin
            thorium-browser-bin
            ledger-live-bin
            dotnet-host-bin
            aspnet-runtime-bin
            dotnet-sdk-bin
            aspnet-targeting-pack-bin
            svp-bin
            keeweb-desktop-bin
            i2p-bin
            browsh-bin
            rocketchat-client-bin
            ocenaudio-bin
            rpcs3-bin
            dingtalk-bin
            webtorrent-desktop-bin
            an-anime-game-launcher-bin
            nuclear-player-bin
            tuxedo-control-center-bin
            multimc-bin
            pandora-launcher-bin
            feishu-bin
            electronmail-bin
            franz-bin
            pdfstudio-bin
            protonup-qt-bin
            glance-bin
            waterfox-classic-bin
            cutechess-bin
            virtualbox-bin
            firestorm-bin
            zoiper-bin
            microchip-mplabx-bin
            android-sdk
            paru
            jdk-doc
            google-chrome-dev
            nautilus-dropbox
            ttf-google-fonts-git
            sublime-text-dev
            wps-office-mime
            jdownloader2
            numix-icon-theme-git
            hplip-plugin
            numix-circle-icon-theme-git
            foxitreader
            usb-creator
            trizen
            eclipse-java-bin
            ssacli-bin
            amdfand-bin
            mihomo-bin
            snazy-bin
            codelldb-bin
            shadered-bin
            armbian-imager-bin
            docker-tui-bin
            lazyjira-bin
            mkbrr-bin
            subfinder-bin
            bambustudio-bin
            cryptomator-bin
            sidequest-bin
            iptvnator-bin
            headlamp-bin
            git-credential-manager-bin
            jamesdsp-pipewire-bin
            zen-twilight-bin
            hyprism-bin
            surge-bin
            gale-bin
            keylightd-bin
            vvv-bin
            ltex-ls-plus-bin
            pomodorolm-bin
            youtube-music-cli-bin
            ;; recipe-resolver-260413r recipes
            keychron-link-udev
            keychron-q3-max-udev
            cutieascii-bin
            energygraph
            d1x-rebirth
            mindustry-server-bin
            ;; recipe-resolver-260413v recipes
            obsidian-appimage
            electrum-ltc-appimage
            orca-slicer-unstable-bin
            vicinae-appimage-bin
            chitubox-free-bin
            tabularis-bin
            onlyoffice-bin
            02engine-bin
            kubelogin
            google-cloud-cli-gke-gcloud-auth-plugin
            netlogo
            browsh-bin
            fabric-server
            python-morfeus-ml
            python-landlock
            termux-language-server
            otpgui
            tidal-dl-ng
            usergrant
            linux-enable-ir-emitter
            beekeeper-qt
            ;; recipe-resolver-260413x recipes
            fastx-desktop-client
            tetrio-plus-bin
            libstdcplusplus5-bin
            cockpit-tools-bin
            oh-my-pi-bin
            oneclient-bin
            onscripter-yuri-bin
            opera-gx
            pencil-dev-bin
            srcom-bin
            srwm-bin
            stalker-gamma-cli-bin
            tinywiibackupmanager-bin
            wayvr-bin
            finar-bin
            rootchat-bin
            hubstaff
            irfanview
            comfyui-desktop-2-beta
            cyx
            lazyjira-git
            megit
            maniadrive
            cdebootstrap-static
            amethyst-mod-manager
            anime-games-launcher-git
            connectiq-sdk-manager
            gnome-shell-extension-all-in-one-clipboard-bin
            claude-agent-acp
            sillytavern
            specify-cli
            touchhle
            ts-query-ls
            vikunja
            railwayapp-cli
            web-eid-firefox
            web-eid-chrome
            oxicord
            dealve
            kontainer
            nettui
            terraform-ls
            bcompare
            vencord-installer
            minisforum-v3-pcie-aspm-config
            python-yappi
            python-kiutils
            vidcutter
            pvetui
            python-qh3-bin
            torbrowser-launcher-git
            pisek
            ttf-patrick-hand-full
            ttf-sipa-sarabun
            ttf-sipa-sarabun-new
            ezstream
            squeezelite
            qpxtool
            libkcapi
            ddcci-hotplugd
            blocker
            kernel-alive
            xboxdrv-blitz
            dmrgateway-git
            drawterm-9front-wl-git
            ojcsh
            oniri
            wayland-push-to-talk-fix-git
            kanzi-git
            fluidplug-git
            emacs-pgtk-igc-git
            cnijfilter2
            hobbits
            blinkenlib
            vkdevicechooser
            blas-clblast
            bareos-common
            lazylpsolverlibs-git
            klog
            gnome-menu-editor-qt
            ksteamtrayicon
            kwin-effects-better-blur-dx
            kwm
            adwaita-qt5
            adwaita-qt6
            adwaita-qt6-git
            perl-test-refcount
            ckan
            ccd-nav
            ;; recipe-resolver-260413y recipes
            materialgram-bin
            marktext-tkaixiang-bin
            anytype-alpha-bin
            sideloader-bin
            youtube-tui-full-bin
            bluebubbles-bin
            deepchat-bin
            ripes-bin
            freeshow-bin
            kanri-bin
            loopi-bin
            alt-sendme-bin
            vcard-studio-bin
            firedragon-alpha-bin
            paket-bin
            fchat-horizon-bin
            classisland-bin
            stremio-service-bin
            electron12-bin
            firestorm-bin
            microsoft-edge-dev-bin
            dbeaver-ce-jre-bin
            alchitry-labs-bin
            anycubicslicernext-bin
            local-by-flywheel-bin
            ;; recipe-resolver-260413ab
            bareos-contrib-director-python-plugins
            bareos-contrib-filedaemon-python-plugins
            bareos-contrib-tools
            bareos-database-common
            bareos-database-postgresql
            bareos-database-tools
            bareos-devel
            bareos-director
            bareos-director-python-plugins-common
            bareos-director-python3-plugin
            bareos-filedaemon
            bareos-filedaemon-glusterfs-plugin
            bareos-filedaemon-ldap-python-plugin
            bareos-filedaemon-libcloud-python-plugin
            bareos-filedaemon-mariabackup-python-plugin
            bareos-filedaemon-percona-xtrabackup-python-plugin
            bareos-filedaemon-postgresql-python-plugin
            bareos-filedaemon-python-plugins-common
            bareos-filedaemon-python3-plugin
            bareos-storage
            bareos-storage-droplet
            bareos-storage-fifo
            bareos-storage-glusterfs
            bareos-storage-python-plugins-common
            bareos-storage-python3-plugin
            bareos-storage-tape
            bareos-tools
            bareos-traymonitor
            bareos-vmware-plugin
            bareos-webui
            bareos-webui-apache
            bareos-webui-nginx
            python-bareos
            oh-my-pi-git
            piperig-bin
            python-fastfeedparser-git
            vite-plus-bin
            vkbasalt-redemp-git
            volt-desktop
            voxtype-cuda
            wifi-audio-streaming
            windsurf-next-marketplace
            ymir-emu-git
            xboxdrv-git
            wallpaper-engine-kde-plugin-git
            ut2004-data-archiveorg
            fw16-kbd-uleds-git
            cryptopro-csp-k1
            bcompare-kde6
            bcompare-kde5
            bcompare-kde4
            bcompare-nautilus
            bcompare-thunar
            bcompare-cinnamon
            bcompare-mate
            alma-desktop-bin
            kvantum-theme-catppuccin-git
            airwindows-consolidated-bin
            yabsnap
            mozc
            lft
            pkglog-elixir-bin
            ratarmount
            prismlauncher-git
            vrrtest-git
            arduino-avr-core
            kora-icon-theme
            cemu
            amneziawg-tools
            valent-git
            xdgctl
            vicinae-bin
            meshtastic-python
            limine-snapper-sync
            usbtop
            prek-bin
            yp-tools
            opentrack
            aacs-keydb-daily
            libunity
            plasma6-runners-jetbrains-runner-git
            zsh-fast-syntax-highlighting
            pdf4qt
            rpmlint
            next-music
            ;; recipe-resolver-260414b recipes
            mpc-qt
            trickle
            reframe
            slowrx
            yarr-bin
            ab-download-manager-bin
            retroforth
            jbofihe
            neovide-bin
            abuse
            nmgui
            ;; recipe-resolver-260414e recipes
            uemacs
            vvdec
            opencollada
            spacecadetpinball
            intel-ipsec-mb
            ebsl
            finalmouse-cli
            headsetstatus
            qt-heif-image-plugin
            kplotting5
            fortty
            calf-no-gui
            kpeoplevcard
            hyprsysteminfo
            wl-shimeji
            libretro-handy
            scangearmp2-sane
            tomoyo-tools
            python-pyrogram
            qcomix
            gearlever
            icon-lang
            java21-openjfx-bin
            polymc-qt5-bin
            runelite-bin
            hmcl-bin
            emacs-slime-git
            minisystool
            gcdemu
            openal-hrtf
            ;; recipe-resolver-260414e compat aliases
            uemacs-git
            spacecadetpinball-git
            wl_shimeji-git
            libretro-handy-git
            scangearmp2-sane-git
            icon-git
            runelite
            hmcl
            slime-git
            polymc-qt5
            ;; recipe-resolver-260414i
            jump-bin
            orla-bin
            feluda-bin
            wasmrun-bin
            seqtui-bin
            clipvault-bin
            lact-headless-bin
            teleport-client-bin
            jiq-ai-bin
            checkstyle-bin
            vitals
            ect
            rtrlib
            quakewatch
            mousetrap
            font-annotation-mono
            python-pympress
            gonic-bin
            skyterm-bin
            rtimelog-bin
            rtimelogger-bin
            needle-cli-bin
            ;; recipe-resolver-260414i compat aliases
            jump
            orla
            feluda
            wasmrun
            seqtui
            clipvault
            lact-headless
            teleport-client
            jiq-ai
            checkstyle
            gonic
            skyterm
            rtimelog
            rtimelogger
            needle-cli
            otf-annotation-mono
            ttf-annotation-mono
            ttf-annotation-mono-variable
            ;; --- deptree-resolver-260414j recipes ---
            arch-os-manager
            brother-dcpt535dw
            brother-hl-1110
            cherry-studio-electron-bin
            circuit-macros
            cisco-secure-client
            dcli-arch-git
            docker-model-plugin
            dolibarr
            dracut-ukify
            fcitx5-hazkey-bin
            find-the-command
            gitextensions
            hpuld
            kando-bin
            lib32-opencl-nvidia-vulkan
            matlab
            mommy-git
            ollama-cuda12-bin
            ollama-cuda13-bin
            opencl-vanity-gpg
            oxmgr-bin
            pdf-over
            pkgstate-bin
            quickshell-overview-git
            qwen-code-bin
            reef-tools
            rvgl-io-loadlevel
            rvgl-io-music
            rvgl-io-skins-bonus
            rvgl-io-tracks
            sac-gui
            sheet-git
            tiddlydesktop
            tparted-bin
            ttf-nonicons-bin-git
            vscodium-bin-marketplace
            vscodium-translucent-marketplace
            vtsls
            wechat
            whyis-git
            wine-installer
            wireplumber-openrc
            woff-nonicons-bin-git
            wormhole-rs-bin
            wpa-actiond
            wscat
            xd-torrent
            xdg-ninja-git
            xdg-unused-data-git
            xdman-beta-bin
            xpad-noone-git
            ;; deptree-resolver-260414k recipes
            adwaita-dark-darose
            agisoft-metashape
            airwindows-lv2
            alacritty-use-theme-with-redshift-git
            alarm-notify
            algodoo-wine
            altair-ai-studio
            anythingllm-desktop-bin
            apachedirectorystudio
            archie
            aseprite-bin
            asf-ui-git
            avalonia86
            avda-bin
            bin-cpuflags-x86
            bitwig-studio-earlyaccess
            bluevein
            brother-dcpt720dw
            brother-mfc-l3750cdw
            brother-mfc-l8690cdw
            btrfs-desktop-notification
            burpsuite-pro
            caddy-custom
            casa6-bin
            cfspeedtest
            chayang
            chibi-cli-git
            clash-nyanpasu-nightly-bin
            clonehero-ptb
            code-features
            cuda-12-9
            curd
            customizepkg-git
            dbeaver-jvm-hook
            ddrescueview
            deadbeef-plugin-discord-git
            dingusppc-git
            dmarc-cat
            dolphin-anty-bin
            doomrunner
            dput-ng
            xytz-bin
            yabridge-tui
            yubico-authenticator-bin
            zish
            zzz
            ;; recipe-resolver-260414n recipes
            blockbench-bin
            djv
            green-tunnel-bin
            pokeget-bin
            prospect-mail-bin
            xdelta3-cross-gui-bin
            ;; deptree-resolver-260414l recipes
            ds360go-git
            duo-desktop
            eac3to
            eclipse-dsl-bin
            elephant-bookmarks
            elephant-clipboard
            epson-inkjet-printer-201207w
            fbpdf-git
            feishin
            file-clipper
            firefly-iii
            flightgear-data
            fsel
            ftb-app-bin
            gem2arch
            gemini-cli-git
            ginkgocadx-bin
            gitignore-downloader
            gitversion-bin
            gnatdoc
            go-grip
            go-grip-git
            gopac-git
            graphite-cli
            hibiscus
            whisper-cpp-model-large-v3-turbo
            ;; deptree-resolver-260414m recipes
            html2ps
            hyprlight
            ibus-avro-git
            icann-rdap
            intellij-idea-ultimate-edition
            invoiceninja
            ipfs-desktop
            jdk8-graalvm-ee-bin
            jdupes
            jdwp-mcp-git
            joycon-git
            kazumi-bin
            kiro-cli
            kluctl
            koboldcpp-cuda
            kopa
            kwin-scripts-krohnkite-git
            lanxchange
            lattice-diamond
            lazynmap
            lcarsde-application-starter
            lesstif
            lib32-faac
            lib32-gsm
            lib32-lame
            lib32-libnuma
            lib32-libomxil-bellagio
            libdeep-filter-ladspa-git
            libdf-git
            libilbm-git
            libretro-swanstation-git
            llama-cpp-sycl-f16-git
            logiops-rs
            logisim-evolution
            logseq-desktop-electron-bin
            lolia-cli
            lsu-git
            lvsk-calendar
            magicpodscore-git
            mal
            mendeley-reference-manager
            meteobar
            mingw-w64-crt-msvcrt
            mingw-w64-json-glib
            misuzu-music-bin
            motoc-git
            neo-matrix
            neothesia
            nikode-bin
            niri-sidebar-git
            nirinit-git
            nodejs-ramadan-cli
            nordvpn-gui-bin
            objdiff
            ;; deptree-resolver-260414n recipes
            obos-genissue-git
            obs-scrab
            ocaml-camlzip
            omniget-bin
            omnom-git
            openchamber
            opencode-claude-auth
            openmw-tes3mp
            openrefine
            openscq30-cli-bin
            openutau
            opera-proxy-git
            packwiz-git
            pacmods
            paczf-yay
            partclone-git
            pgdr
            pokemmo
            prex
            printnotes-git
            promptfoo
            punt
            purple-gowhatsapp
            pydio
            python-fleep-git
            python-pyqt5-chart
            python-zoekt-py-git
            python2-jpype1
            qt5-purchasing
            qt6gtk2
            r2modman-appimage
            radii5-bin
            raindrop
            redu
            rename-pl
            rexit-git
            riftbar-bin
            rimsort-git
            rivetui
            ruffle-nightly-bin
            run0-sudo-shim-git
            sacad
            selectdefaultapplication-git
            setrixtui
            shellman-bin
            shiru-git
            shopify-cli
            shpool
            sickchill-git
            sip4
            ;; recipe-resolver-260414r
            magika-bin
            sddm-eucalyptus-drop
            gamepadla-polling
            rivetui-bin
            ins-bin
            git-wizard
            ytconverter
            cai
            ;; recipe-resolver-260414u
            hopm
            bluray-info
            python-pycxx
            python-ratarmount
            yazi-bin
            openlinkhub-bin
            biscuit-lang-bin
            qownnotes-bin
            waybar-minimal-nosystemd-git
            fprintd-clients-git

            ;; recipe-resolver-260414y
            kdiff3
            xdg-desktop-portal-minimal-git
            swaystatus-git
            ;; patchy already exported from deptree-resolver-260413d

            ;; recipe-resolver-260414z
            ww-manager
            tg-config
            neovim-qt
            neovim-qt-git
            cvs-feature-bin
            psdoom-ng
            cvs-feature
            ;; recipe-resolver-260414ab recipes
            openobex
            obexftp
            spooles
            calculix-ccx
            qbittorrent-enhanced-ua-nox
            qbittorrent-enhanced-ua
            tailscale-bin
            mdcat-bin
            fooyin-git
            ;; recipe-resolver-260415d recipes
            libtrash
            scolorpicker-legacy
            srtodo-git
            gpgfrontend
            linux-enable-ir-emitter
            ntfsprogs-plus-git
            python-aioice
            fonts-meta-base
            btrfs-desktop-notification-git
            smpeg0
            plymouth-theme-mikuboot-git
            python-zxing-cpp
            go-prism
            hypruler
            ;; recipe-resolver-260415d compat aliases
            scolorpicker
            srtodo
            ntfsprogs-plus
            btrfs-desktop-notification
            plymouth-theme-mikuboot
            ;; recipe-resolver-260415e recipes
            hardinfo2
            ssh-studio
            hyprqt6engine
            haskell-unix-compat
            crengine-ng
            crqt-ng
            git-series
            wlr-which-key-bin
            manaverse-sdl2
            karp
            ;; deptree-resolver-260415f recipes
            gnu-apl
            opentyrian
            releng-tool
            luaunbound
            lxappearance-obconf-gtk3
            pass-audit
            python-requirements-language-server
            ajantv2-tools
            pins
            onset
            oniri
            proxybridge
            onthespot-bin
            libreoffice-extension-writingtool-bin
            linux-firmware-bnx2x
            linux-firmware-marvell
            linux-firmware-mellanox
            linux-firmware-nfp
            linux-firmware-qcom
            ;; recipe-resolver-260415i compat aliases
            grayjay-bin
            webkit2gtk
            webkit2gtk-docs
            qt5-sensors
            ;; recipe-resolver-260415l recipes
            python-pkb-client
            certbot-dns-porkbun
            protonplus
            osdlyrics
            aaaaxy-bin
            linnote
))

;;; --- recipe-resolver-260413f compat aliases ---

(define-public sizeof
  (package
    (inherit sizeof-tool)
    (name "sizeof")))

(define-public nextdns
  (package
    (inherit nextdns-bin)
    (name "nextdns")))

(define-public intermodal
  (package
    (inherit intermodal-bin)
    (name "intermodal")))

(define-public ov
  (package
    (inherit ov-bin)
    (name "ov")))

(define-public torrserver
  (package
    (inherit torrserver-bin)
    (name "torrserver")))

(define-public rjq
  (package
    (inherit rjq-bin)
    (name "rjq")))

(define-public tmpo
  (package
    (inherit tmpo-bin)
    (name "tmpo")))

(define-public dol
  (package
    (inherit dol-bin)
    (name "dol")))

(define-public sq
  (package
    (inherit sq-bin)
    (name "sq")))

(define-public mynav
  (package
    (inherit mynav-bin)
    (name "mynav")))

(define-public solv
  (package
    (inherit solv-bin)
    (name "solv")))

(define-public superdb
  (package
    (inherit superdb-bin)
    (name "superdb")))

(define-public whosthere
  (package
    (inherit whosthere-bin)
    (name "whosthere")))

(define-public python-face_recognition_models
  (package
    (inherit python-face-recognition-models)
    (name "python-face_recognition_models")))


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
;; BROKEN:     (inherit wo-bin)
    (name "wo")))

(define-public oken
  (package
;; BROKEN:     (inherit oken-bin)
    (name "oken")))

(define-public lazytail
  (package
;; BROKEN:     (inherit lazytail-bin)
    (name "lazytail")))

(define-public funzzy
  (package
;; BROKEN:     (inherit funzzy-bin)
    (name "funzzy")))

(define-public mezzotone
  (package
;; BROKEN:     (inherit mezzotone-bin)
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
  (package
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
            ;; REMOVED:             bililive-recorder-bin
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
            ;; recipe-resolver-260413f compat aliases
            sizeof
            nextdns
            intermodal
            ov
            torrserver
            rjq
            tmpo
            dol
            sq
            mynav
            solv
            superdb
            whosthere
            python-face_recognition_models
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
  (package
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


;; --- recipe-resolver-260408b compat aliases ---
;; (all 30 packages are new definitions with no AUR name aliases needed)

;; --- recipe-resolver-260408c compat aliases ---
;; (all 34 packages are new definitions with no AUR name aliases needed)

;; --- recipe-resolver-260408d compat aliases ---
;; (all 32 packages are new definitions with no AUR name aliases needed)

;; --- recipe-resolver-260408e compat aliases ---
;; (all 23 packages are new definitions with no AUR name aliases needed)

;; --- 260408c-batch compat aliases (AUR names -> Guix packages) ---

(define-public vulkan-icd-loader-git
  (package
    (inherit vulkan-loader)
    (name "vulkan-icd-loader-git")))

(define-public bdf-unifont
  (package
    (inherit font-gnu-unifont)
    (name "bdf-unifont")))

(define-public fastfetch-gif-git
  (package
    (inherit fastfetch)
    (name "fastfetch-gif-git")))

(define-public libmpv-git
  (package
    (inherit mpv)
    (name "libmpv-git")))

(define-public yaru-sound-theme
  (package
    (inherit yaru-theme)
    (name "yaru-sound-theme")))

(define-public yaru-gtksourceview-theme
  (package
    (inherit yaru-theme)
    (name "yaru-gtksourceview-theme")))

(define-public yaru-gnome-shell-theme
  (package
    (inherit yaru-theme)
    (name "yaru-gnome-shell-theme")))

(define-public yaru-xfwm4-theme
  (package
    (inherit yaru-theme)
    (name "yaru-xfwm4-theme")))

(define-public yaru-unity-theme
  (package
    (inherit yaru-theme)
    (name "yaru-unity-theme")))

(define-public yaru-metacity-theme
  (package
    (inherit yaru-theme)
    (name "yaru-metacity-theme")))

(define-public yaru-session
  (package
    (inherit yaru-theme)
    (name "yaru-session")))


;; --- recipe-resolver-260408b compat aliases ---
;; (all 30 packages are new definitions with no AUR name aliases needed)

;; --- recipe-resolver-260408c compat aliases ---
;; (all 34 packages are new definitions with no AUR name aliases needed)

;; --- recipe-resolver-260408d compat aliases ---
;; (all 32 packages are new definitions with no AUR name aliases needed)

;; --- recipe-resolver-260408e compat aliases ---
;; (all 23 packages are new definitions with no AUR name aliases needed)

;; --- 260408c-batch compat aliases (AUR names -> Guix packages) ---

  (package
    (inherit vulkan-loader)
    (name "vulkan-icd-loader-git")))

  (package
    (inherit font-gnu-unifont)
    (name "bdf-unifont")))

  (package
    (inherit fastfetch)
    (name "fastfetch-gif-git")))

  (package
    (inherit mpv)
    (name "libmpv-git")))

  (package
    (inherit yaru-theme)
    (name "yaru-sound-theme")))

  (package
    (inherit yaru-theme)
    (name "yaru-gtksourceview-theme")))

  (package
    (inherit yaru-theme)
    (name "yaru-gnome-shell-theme")))

  (package
    (inherit yaru-theme)
    (name "yaru-xfwm4-theme")))

  (package
    (inherit yaru-theme)
    (name "yaru-unity-theme")))

  (package
    (inherit yaru-theme)
    (name "yaru-metacity-theme")))

  (package
    (inherit yaru-theme)
    (name "yaru-session")))

;; --- recipe-resolver-260408f compat aliases ---

;; AUR xlibre-input-wacom -> Guix xf86-input-wacom
(define-public xlibre-input-wacom
  (package
    (inherit xf86-input-wacom)
    (name "xlibre-input-wacom")))

;; AUR xlibre-video-fbdev -> Guix xf86-video-fbdev
(define-public xlibre-video-fbdev
  (package
    (inherit xf86-video-fbdev)
    (name "xlibre-video-fbdev")))

;; AUR ffmpeg-amd-full -> Guix ffmpeg
(define-public ffmpeg-amd-full
  (package
    (inherit ffmpeg)
    (name "ffmpeg-amd-full")))

;; AUR slack-desktop -> gaurix slack-desktop-bin
(define-public slack-desktop
  (package
    (inherit slack-desktop-bin)
    (name "slack-desktop")))

;; AUR oh-my-posh -> gaurix oh-my-posh-bin
(define-public oh-my-posh
  (package
    (inherit oh-my-posh-bin)
    (name "oh-my-posh")))

;; AUR spicetify-cli -> gaurix spicetify-cli-bin
(define-public spicetify-cli
  (package
    (inherit spicetify-cli-bin)
    (name "spicetify-cli")))

;; AUR rustdesk -> gaurix rustdesk-bin
(define-public rustdesk
  (package
    (inherit rustdesk-bin)
    (name "rustdesk")))

;; AUR qbittorrent-cli -> gaurix qbittorrent-cli-bin
(define-public qbittorrent-cli
  (package
    (inherit qbittorrent-cli-bin)
    (name "qbittorrent-cli")))

;; AUR hyprls -> gaurix hyprls-bin
(define-public hyprls
  (package
    (inherit hyprls-bin)
    (name "hyprls")))

;; AUR ffdec -> gaurix ffdec-bin
(define-public ffdec
  (package
    (inherit ffdec-bin)
    (name "ffdec")))

;; AUR logseq-desktop -> gaurix logseq-desktop-bin
(define-public logseq-desktop
  (package
    (inherit logseq-desktop-bin)
    (name "logseq-desktop")))

;; AUR rider -> gaurix rider-bin
(define-public rider
  (package
    (inherit rider-bin)
    (name "rider")))

;; AUR xnviewmp -> gaurix xnviewmp-bin
(define-public xnviewmp
  (package
    (inherit xnviewmp-bin)
    (name "xnviewmp")))

;; AUR tutanota-desktop -> gaurix tutanota-desktop-bin
(define-public tutanota-desktop
  (package
    (inherit tutanota-desktop-bin)
    (name "tutanota-desktop")))

;; AUR shutter-encoder -> gaurix shutter-encoder-bin
(define-public shutter-encoder
  (package
    (inherit shutter-encoder-bin)
    (name "shutter-encoder")))

;; AUR freefilesync -> gaurix freefilesync-bin
(define-public freefilesync
  (package
    (inherit freefilesync-bin)
    (name "freefilesync")))

;; AUR appimagelauncher -> gaurix appimagelauncher-bin
(define-public appimagelauncher
  (package
    (inherit appimagelauncher-bin)
    (name "appimagelauncher")))

;; --- recipe-resolver-260408g compat aliases ---

;; AUR android-studio -> gaurix android-studio-bin
(define-public android-studio
  (package
    (inherit android-studio-bin)
    (name "android-studio")))

;; AUR netbeans -> gaurix netbeans-bin
(define-public netbeans
  (package
    (inherit netbeans-bin)
    (name "netbeans")))

;; --- recipe-resolver-260408i compat aliases ---

;; AUR recaf -> gaurix recaf-bin
(define-public recaf
  (package
    (inherit recaf-bin)
    (name "recaf")))

;; AUR pixelorama-git -> gaurix pixelorama-bin
(define-public pixelorama-git
  (package
    (inherit pixelorama-bin)
    (name "pixelorama-git")))

;; AUR tnoodle-wca -> gaurix tnoodle-wca-bin
(define-public tnoodle-wca
  (package
    (inherit tnoodle-wca-bin)
    (name "tnoodle-wca")))

;; AUR flclash -> gaurix flclash-bin
(define-public flclash
  (package
    (inherit flclash-bin)
    (name "flclash")))

;; AUR openmarch -> gaurix openmarch-bin
(define-public openmarch
  (package
    (inherit openmarch-bin)
    (name "openmarch")))

;; AUR chataigne-stable -> gaurix chataigne-stable-bin
(define-public chataigne-stable
  (package
    (inherit chataigne-stable-bin)
    (name "chataigne-stable")))

;; --- recipe-resolver-260408j compat aliases ---

;; AUR wootility -> gaurix wootility-appimage
(define-public wootility
  (package
    (inherit wootility-appimage)
    (name "wootility")))

;; AUR muse-sounds-manager -> gaurix muse-sounds-manager-bin
(define-public muse-sounds-manager
  (package
    (inherit muse-sounds-manager-bin)
    (name "muse-sounds-manager")))

;; AUR java-openjdk-ea -> gaurix java-openjdk-ea-bin
(define-public java-openjdk-ea
  (package
    (inherit java-openjdk-ea-bin)
    (name "java-openjdk-ea")))

;; AUR swiftly -> gaurix swiftly-bin
(define-public swiftly
  (package
    (inherit swiftly-bin)
    (name "swiftly")))

;; --- recipe-resolver-260408j new compat aliases ---
(define-public imgbrd-grabber (package (inherit imgbrd-grabber-bin) (name "imgbrd-grabber")))
(define-public netcoredbg (package (inherit netcoredbg-bin) (name "netcoredbg")))
(define-public natscli (package (inherit natscli-bin) (name "natscli")))
(define-public kaf-cli (package (inherit kaf-cli-bin) (name "kaf-cli")))
(define-public kaf-wifi (package (inherit kaf-wifi-bin) (name "kaf-wifi")))
(define-public f2 (package (inherit f2-bin) (name "f2")))
(define-public vet (package (inherit vet-bin) (name "vet")))
(define-public rune-editor (package (inherit rune-editor-bin) (name "rune-editor")))
(define-public logisim (package (inherit logisim-bin) (name "logisim")))
(define-public nwjs (package (inherit nwjs-bin) (name "nwjs")))
(define-public nwjs-sdk (package (inherit nwjs-sdk-bin) (name "nwjs-sdk")))
(define-public turbowarp-desktop (package (inherit turbowarp-desktop-bin) (name "turbowarp-desktop")))
(define-public hakuneko-desktop-nightly (package (inherit hakuneko-desktop-bin) (name "hakuneko-desktop-nightly")))
(define-public teleport-connect (package (inherit teleport-connect-bin) (name "teleport-connect")))
(define-public crazydiskinfo (package (inherit crazydiskinfo-bin) (name "crazydiskinfo")))
(define-public betterdiscord-installer (package (inherit betterdiscord-installer-bin) (name "betterdiscord-installer")))
(define-public icaclient (package (inherit icaclient-bin) (name "icaclient")))
(define-public jriver-media-center (package (inherit jriver-media-center-bin) (name "jriver-media-center")))
(define-public tracktion-waveform (package (inherit tracktion-waveform-bin) (name "tracktion-waveform")))
(define-public intel-compute-runtime-legacy (package (inherit intel-compute-runtime-legacy-bin) (name "intel-compute-runtime-legacy")))
(define-public intel-graphics-compiler-legacy (package (inherit intel-graphics-compiler-legacy-bin) (name "intel-graphics-compiler-legacy")))
(define-public protondb-tags (package (inherit protondb-tags-bin) (name "protondb-tags")))
(define-public absolutely-proprietary (package (inherit absolutely-proprietary-bin) (name "absolutely-proprietary")))
(define-public webtorrent-cli (package (inherit webtorrent-cli-bin) (name "webtorrent-cli")))
(define-public dl-librescore (package (inherit dl-librescore-bin) (name "dl-librescore")))
(define-public fish-lsp (package (inherit fish-lsp-bin) (name "fish-lsp")))
(define-public vdu-controls (package (inherit vdu-controls-bin) (name "vdu-controls")))
(define-public better-adb-sync (package (inherit better-adb-sync-bin) (name "better-adb-sync")))
(define-public mpv-sponsorblock-minimal (package (inherit mpv-sponsorblock-minimal-bin) (name "mpv-sponsorblock-minimal")))
(define-public wayclip (package (inherit wayclip-bin) (name "wayclip")))
(define-public gitflow-cjs (package (inherit gitflow-cjs-bin) (name "gitflow-cjs")))
(define-public gpu-passthrough-manager (package (inherit gpu-passthrough-manager-bin) (name "gpu-passthrough-manager")))
(define-public xe-guest-utilities-xcp-ng (package (inherit xe-guest-utilities-xcp-ng-bin) (name "xe-guest-utilities-xcp-ng")))
(define-public xenstore-xcp-ng (package (inherit xenstore-xcp-ng-bin) (name "xenstore-xcp-ng")))
(define-public prisma-language-server (package (inherit prisma-language-server-bin) (name "prisma-language-server")))
(define-public firebase-tools (package (inherit firebase-tools-bin) (name "firebase-tools")))
(define-public asbru-cm (package (inherit asbru-cm-bin) (name "asbru-cm")))
(define-public debmirror (package (inherit debmirror-bin) (name "debmirror")))
(define-public subliminal (package (inherit subliminal-bin) (name "subliminal")))
(define-public magic-tape (package (inherit magic-tape-bin) (name "magic-tape")))
(define-public izumi (package (inherit izumi-bin) (name "izumi")))
(define-public minecraft-plymouth-theme (package (inherit minecraft-plymouth-theme-bin) (name "minecraft-plymouth-theme")))
(define-public python-vllm (package (inherit python-vllm-bin) (name "python-vllm")))
(define-public brother-hll2340dw (package (inherit brother-hll2340dw-bin) (name "brother-hll2340dw")))
(define-public 64gram-desktop (package (inherit pkg-64gram-desktop-bin) (name "64gram-desktop")))
(define-public libremines (package (inherit libremines-bin) (name "libremines")))
(define-public umu-launcher (package (inherit umu-launcher-bin) (name "umu-launcher")))
(define-public open-webui (package (inherit open-webui-bin) (name "open-webui")))
(define-public xv (package (inherit xv-bin) (name "xv")))
(define-public roo-code-gemini-cli (package (inherit roo-code-gemini-cli-bin) (name "roo-code-gemini-cli")))
(define-public gdm-settings (package (inherit gdm-settings-bin) (name "gdm-settings")))
(define-public gimp-plugin-gimp3-tools (package (inherit gimp-plugin-gimp3-tools-bin) (name "gimp-plugin-gimp3-tools")))
(define-public zclock (package (inherit zclock-bin) (name "zclock")))

;; --- recipe-resolver-260408k compat aliases ---

;; AUR ttf-b612 -> gaurix font-b612
(define-public ttf-b612 (package (inherit font-b612) (name "ttf-b612")))

;; AUR crabdrop -> gaurix crabdrop-bin
(define-public crabdrop (package (inherit crabdrop-bin) (name "crabdrop")))

;; AUR matcha-client -> gaurix matcha-client-bin
(define-public matcha-client (package (inherit matcha-client-bin) (name "matcha-client")))

;; AUR github-account-switch -> gaurix github-account-switch-bin
(define-public github-account-switch (package (inherit github-account-switch-bin) (name "github-account-switch")))

;; AUR xc -> gaurix xc-bin
(define-public xc (package (inherit xc-bin) (name "xc")))

;; --- recipe-resolver-260408l compat aliases ---

;; AUR alacritty-use-theme-with-gnome-darkmode -> gaurix alacritty-use-theme-with-gnome-darkmode
(define-public alacritty-gnome-darkmode (package (inherit alacritty-use-theme-with-gnome-darkmode) (name "alacritty-gnome-darkmode")))

;; --- deptree-resolver-260408e compat aliases ---

;; AUR llama.cpp-hip -> gaurix llama-cpp-hip
(define-public llama-dot-cpp-hip (package (inherit llama-cpp-hip) (name "llama.cpp-hip")))

;; --- recipe-resolver-260408l compat aliases ---

;; AUR alacritty-use-theme-with-gnome-darkmode -> gaurix alacritty-use-theme-with-gnome-darkmode

;; --- recipe-resolver-260408m compat aliases ---

;; AUR maplemono-cn-unhinted -> gaurix font-maplemono-cn-unhinted
(define-public maplemono-cn-unhinted (package (inherit font-maplemono-cn-unhinted) (name "maplemono-cn-unhinted")))

;; AUR maplemono-cn -> gaurix font-maplemono-cn
(define-public maplemono-cn (package (inherit font-maplemono-cn) (name "maplemono-cn")))

;; AUR maplemono-nf-cn-unhinted -> gaurix font-maplemono-nf-cn-unhinted
(define-public maplemono-nf-cn-unhinted (package (inherit font-maplemono-nf-cn-unhinted) (name "maplemono-nf-cn-unhinted")))

;; AUR maplemono-nf-cn -> gaurix font-maplemono-nf-cn
(define-public maplemono-nf-cn (package (inherit font-maplemono-nf-cn) (name "maplemono-nf-cn")))

;; AUR maplemono-nf-unhinted -> gaurix font-maplemono-nf-unhinted
(define-public maplemono-nf-unhinted (package (inherit font-maplemono-nf-unhinted) (name "maplemono-nf-unhinted")))

;; AUR maplemono-nf -> gaurix font-maplemono-nf
(define-public maplemono-nf (package (inherit font-maplemono-nf) (name "maplemono-nf")))

;; AUR maplemono-otf -> gaurix font-maplemono-otf
(define-public maplemono-otf (package (inherit font-maplemono-otf) (name "maplemono-otf")))

;; AUR maplemono-ttf -> gaurix font-maplemono-ttf
(define-public maplemono-ttf (package (inherit font-maplemono-ttf) (name "maplemono-ttf")))

;; AUR maplemono-variable -> gaurix font-maplemono-variable
(define-public maplemono-variable (package (inherit font-maplemono-variable) (name "maplemono-variable")))

;; AUR maplemono-woff2 -> gaurix font-maplemono-woff2
(define-public maplemono-woff2 (package (inherit font-maplemono-woff2) (name "maplemono-woff2")))

;; AUR aliyunpan-go -> gaurix aliyunpan
(define-public aliyunpan-go (package (inherit aliyunpan) (name "aliyunpan-go")))

;; AUR opensuperclone-git -> gaurix opensuperclone
(define-public opensuperclone-git (package (inherit opensuperclone) (name "opensuperclone-git")))

;; AUR grub-theme-minegrub-git -> gaurix grub-theme-minegrub
(define-public grub-theme-minegrub-git (package (inherit grub-theme-minegrub) (name "grub-theme-minegrub-git")))

;; AUR spacer -> gaurix spacer-cli
(define-public spacer (package (inherit spacer-cli) (name "spacer")))

; --- recipe-resolver-260408p compat aliases ---

;; AUR otf-geist -> gaurix font-geist
(define-public otf-geist (package (inherit font-geist) (name "otf-geist")))

;; AUR ttf-geist -> gaurix font-geist
(define-public ttf-geist (package (inherit font-geist) (name "ttf-geist")))

;; AUR ttf-geist-variable -> gaurix font-geist
(define-public ttf-geist-variable (package (inherit font-geist) (name "ttf-geist-variable")))

;; AUR otf-geist-mono -> gaurix font-geist-mono
(define-public otf-geist-mono (package (inherit font-geist-mono) (name "otf-geist-mono")))

;; AUR ttf-geist-mono -> gaurix font-geist-mono
(define-public ttf-geist-mono (package (inherit font-geist-mono) (name "ttf-geist-mono")))

;; AUR ttf-geist-mono-variable -> gaurix font-geist-mono
(define-public ttf-geist-mono-variable (package (inherit font-geist-mono) (name "ttf-geist-mono-variable")))

;; AUR sddm-theme-elegant-archlinux-git -> gaurix sddm-theme-elegant-archlinux
(define-public sddm-theme-elegant-archlinux-git (package (inherit sddm-theme-elegant-archlinux) (name "sddm-theme-elegant-archlinux-git")))

;; AUR brokefetch-git -> gaurix brokefetch
(define-public brokefetch-git (package (inherit brokefetch) (name "brokefetch-git")))

;; AUR vhd2vl-git -> gaurix vhd2vl
(define-public vhd2vl-git (package (inherit vhd2vl) (name "vhd2vl-git")))

;; AUR sc-git -> gaurix sc
(define-public sc-git (package (inherit sc) (name "sc-git")))

; --- recipe-resolver-260408q compat aliases ---

;; AUR cliamp -> gaurix cliamp-bin
(define-public cliamp (package (inherit cliamp-bin) (name "cliamp")))

;; AUR air -> gaurix air-bin
(define-public air (package (inherit air-bin) (name "air")))

;; AUR mpm -> gaurix meta-package-manager-bin
(define-public mpm (package (inherit meta-package-manager-bin) (name "mpm")))

;; AUR zigmir -> gaurix zigmir-bin
(define-public zigmir (package (inherit zigmir-bin) (name "zigmir")))

;; AUR gopac -> gaurix gopac-bin
(define-public gopac (package (inherit gopac-bin) (name "gopac")))

;; AUR lian -> gaurix lian-bin
(define-public lian (package (inherit lian-bin) (name "lian")))

;; AUR spout2pw -> gaurix spout2pw-bin
(define-public spout2pw (package (inherit spout2pw-bin) (name "spout2pw")))

;; AUR geforce-infinity -> gaurix geforce-infinity-bin
(define-public geforce-infinity (package (inherit geforce-infinity-bin) (name "geforce-infinity")))

;; AUR flclash -> gaurix flclash-bin

;; AUR reqable -> gaurix reqable-bin
(define-public reqable (package (inherit reqable-bin) (name "reqable")))

;; AUR boscaceoil-blue -> gaurix boscaceoil-blue-bin
(define-public boscaceoil-blue (package (inherit boscaceoil-blue-bin) (name "boscaceoil-blue")))

;; AUR ferrishot -> gaurix ferrishot-bin
(define-public ferrishot (package (inherit ferrishot-bin) (name "ferrishot")))

;; AUR ferris-scan -> gaurix ferris-scan-bin

;; AUR bililive-recorder -> gaurix bililive-recorder-bin
(define-public bililive-recorder (package (inherit bililive-recorder-bin) (name "bililive-recorder")))

; --- deptree-resolver-260408h compat aliases ---
(define-public ttf-babelstone-runic (package (inherit font-babelstone-runic) (name "ttf-babelstone-runic")))
(define-public ttf-bitter (package (inherit font-bitter) (name "ttf-bitter")))
(define-public ttf-font-awesome-5 (package (inherit font-font-awesome-5) (name "ttf-font-awesome-5")))
(define-public ttf-garamontio (package (inherit font-garamontio) (name "ttf-garamontio")))
(define-public ttf-garamontio-capo (package (inherit font-garamontio-capo) (name "ttf-garamontio-capo")))
(define-public ttf-garamontio-variable (package (inherit font-garamontio-variable) (name "ttf-garamontio-variable")))
(define-public ttf-hackgen (package (inherit font-hackgen) (name "ttf-hackgen")))
(define-public ttf-hellvetica (package (inherit font-hellvetica) (name "ttf-hellvetica")))
(define-public ttf-iosevka-fixed (package (inherit font-iosevka-fixed) (name "ttf-iosevka-fixed")))
(define-public ttf-iosevka-fixed-ss06 (package (inherit font-iosevka-fixed-ss06) (name "ttf-iosevka-fixed-ss06")))
(define-public ttf-ioskeley-mono-unhinted (package (inherit font-ioskeley-mono-unhinted) (name "ttf-ioskeley-mono-unhinted")))
(define-public ttf-lxgw-wenkai-mono-nerd (package (inherit font-lxgw-wenkai-mono-nerd) (name "ttf-lxgw-wenkai-mono-nerd")))
(define-public ttf-oxanium (package (inherit font-oxanium) (name "ttf-oxanium")))
(define-public ttf-qurancomplex-fonts (package (inherit font-qurancomplex-fonts) (name "ttf-qurancomplex-fonts")))
(define-public ttf-roboto-flex (package (inherit font-roboto-flex) (name "ttf-roboto-flex")))
(define-public ttf-segoe-ui-variable (package (inherit font-segoe-ui-variable) (name "ttf-segoe-ui-variable")))
(define-public ttf-selawik (package (inherit font-selawik) (name "ttf-selawik")))
(define-public ttf-sipa-sarabun (package (inherit font-sipa-sarabun) (name "ttf-sipa-sarabun")))
(define-public ttf-sipa-sarabun-new (package (inherit font-sipa-sarabun-new) (name "ttf-sipa-sarabun-new")))

; --- recipe-resolver-260408r compat aliases ---

;; AUR simplex-chat -> gaurix simplex-chat-bin
(define-public simplex-chat (package (inherit simplex-chat-bin) (name "simplex-chat")))

;; AUR sourcegit -> gaurix sourcegit-bin
(define-public sourcegit (package (inherit sourcegit-bin) (name "sourcegit")))

;; AUR github-desktop-plus -> gaurix github-desktop-plus-bin
(define-public github-desktop-plus (package (inherit github-desktop-plus-bin) (name "github-desktop-plus")))

;; AUR seamonkey -> gaurix seamonkey-bin
(define-public seamonkey (package (inherit seamonkey-bin) (name "seamonkey")))

;; AUR openbuilds-control -> gaurix openbuilds-control-bin
(define-public openbuilds-control (package (inherit openbuilds-control-bin) (name "openbuilds-control")))

;; AUR bfg -> gaurix bfg-repo-cleaner
(define-public bfg (package (inherit bfg-repo-cleaner) (name "bfg")))

;; AUR nzbhydra2 -> gaurix nzbhydra2-bin
(define-public nzbhydra2 (package (inherit nzbhydra2-bin) (name "nzbhydra2")))

;; AUR deadd-notification-center -> gaurix deadd-notification-center-bin
(define-public deadd-notification-center (package (inherit deadd-notification-center-bin) (name "deadd-notification-center")))

;; AUR candy-icons -> gaurix candy-icons-git
(define-public candy-icons (package (inherit candy-icons-git) (name "candy-icons")))

;; AUR sweet-folders-icons -> gaurix sweet-folders-icons-git
(define-public sweet-folders-icons (package (inherit sweet-folders-icons-git) (name "sweet-folders-icons")))

; --- recipe-resolver-260408s compat aliases ---

;; AUR ferdium -> gaurix ferdium-source
(define-public ferdium (package (inherit ferdium-source) (name "ferdium")))
;; AUR pycharm -> gaurix pycharm-community-bin
(define-public pycharm (package (inherit pycharm-community-bin) (name "pycharm")))
;; AUR gtk-nocsd-git -> gaurix gtk-nocsd
(define-public gtk-nocsd-git (package (inherit gtk-nocsd) (name "gtk-nocsd-git")))
;; AUR deadbeef -> gaurix deadbeef-bin
(define-public deadbeef (package (inherit deadbeef-bin) (name "deadbeef")))
;; AUR coolercontrol -> gaurix coolercontrol-bin
(define-public coolercontrol (package (inherit coolercontrol-bin) (name "coolercontrol")))
;; AUR coolercontrold -> gaurix coolercontrold-bin
(define-public coolercontrold (package (inherit coolercontrold-bin) (name "coolercontrold")))
;; AUR dropbox -> gaurix dropbox-bin
(define-public dropbox (package (inherit dropbox-bin) (name "dropbox")))
;; AUR joplin-desktop -> gaurix joplin-desktop-bin
(define-public joplin-desktop (package (inherit joplin-desktop-bin) (name "joplin-desktop")))
;; AUR azahar -> gaurix azahar-bin
(define-public azahar (package (inherit azahar-bin) (name "azahar")))
;; AUR openlinkhub -> gaurix openlinkhub-bin
(define-public openlinkhub (package (inherit openlinkhub-bin) (name "openlinkhub")))
;; AUR teamspeak -> gaurix teamspeak-client-bin
(define-public teamspeak (package (inherit teamspeak-client-bin) (name "teamspeak")))
;; AUR windsurf -> gaurix windsurf-bin
(define-public windsurf (package (inherit windsurf-bin) (name "windsurf")))
;; AUR winbox -> gaurix winbox-bin
(define-public winbox (package (inherit winbox-bin) (name "winbox")))
;; AUR gogcli -> gaurix gogcli-bin
(define-public gogcli (package (inherit gogcli-bin) (name "gogcli")))
;; AUR wps-office-cn -> gaurix wps-office-cn-bin
(define-public wps-office-cn (package (inherit wps-office-cn-bin) (name "wps-office-cn")))
;; AUR zsh-theme-powerlevel10k-git -> gaurix zsh-theme-powerlevel10k
(define-public zsh-theme-powerlevel10k-git (package (inherit zsh-theme-powerlevel10k) (name "zsh-theme-powerlevel10k-git")))
;; AUR google-cloud-cli -> gaurix google-cloud-cli-bin
(define-public google-cloud-cli (package (inherit google-cloud-cli-bin) (name "google-cloud-cli")))
;; AUR ivpn-ui -> gaurix ivpn-ui-bin
(define-public ivpn-ui (package (inherit ivpn-ui-bin) (name "ivpn-ui")))
;; AUR ivpn -> gaurix ivpn-bin
(define-public ivpn (package (inherit ivpn-bin) (name "ivpn")))
;; AUR mihomo -> gaurix mihomo-bin
(define-public mihomo (package (inherit mihomo-bin) (name "mihomo")))
;; AUR barrier -> gaurix barrier-bin
(define-public barrier (package (inherit barrier-bin) (name "barrier")))
;; AUR netbird-ui -> gaurix netbird-ui-bin
(define-public netbird-ui (package (inherit netbird-ui-bin) (name "netbird-ui")))
;; AUR netbird-server -> gaurix netbird-server-bin
(define-public netbird-server (package (inherit netbird-server-bin) (name "netbird-server")))
;; AUR imgbrd-grabber-git -> gaurix imgbrd-grabber-bin
(define-public imgbrd-grabber-git (package (inherit imgbrd-grabber-bin) (name "imgbrd-grabber-git")))
;; AUR ocs-url -> gaurix ocs-url-bin
(define-public ocs-url (package (inherit ocs-url-bin) (name "ocs-url")))
;; AUR appmanager -> gaurix appmanager-bin
(define-public appmanager (package (inherit appmanager-bin) (name "appmanager")))
;; AUR euphonica -> gaurix euphonica-bin
(define-public euphonica (package (inherit euphonica-bin) (name "euphonica")))
;; AUR drawy -> gaurix drawy-bin
(define-public drawy (package (inherit drawy-bin) (name "drawy")))
;; AUR helium-browser -> gaurix helium-browser-bin
(define-public helium-browser (package (inherit helium-browser-bin) (name "helium-browser")))
;; AUR m8mouse-git -> gaurix m8mouse
(define-public m8mouse-git (package (inherit m8mouse) (name "m8mouse-git")))
;; AUR rapidraw -> gaurix rapidraw-bin
(define-public rapidraw (package (inherit rapidraw-bin) (name "rapidraw")))
;; AUR android-sdk-cmdline-tools-latest -> gaurix android-sdk-cmdline-tools-bin
(define-public android-sdk-cmdline-tools-latest (package (inherit android-sdk-cmdline-tools-bin) (name "android-sdk-cmdline-tools-latest")))
;; AUR hunspell-ja-git -> gaurix hunspell-ja
(define-public hunspell-ja-git (package (inherit hunspell-ja) (name "hunspell-ja-git")))
;; AUR recaf-git -> gaurix recaf-bin
(define-public recaf-git (package (inherit recaf-bin) (name "recaf-git")))
;; AUR emsdk -> gaurix emsdk-bin
(define-public emsdk (package (inherit emsdk-bin) (name "emsdk")))

;;;
;;; ── recipe-resolver-260408t compat aliases ─────────────────────
;;;
(define-public localsend
  (package
    (inherit localsend-bin)
    (name "localsend")))

(define-public juliaup
  (package
    (inherit juliaup-bin)
    (name "juliaup")))

(define-public mindustry
  (package
    (inherit mindustry-bin)
    (name "mindustry")))

(define-public lidarr
  (package
    (inherit lidarr-bin)
    (name "lidarr")))

(define-public zl-equalizer
  (package
    (inherit zl-equalizer-bin)
    (name "zl-equalizer")))

(define-public wallchemy
  (package
    (inherit wallchemy-bin)
    (name "wallchemy")))

(define-public atlauncher
  (package
    (inherit atlauncher-bin)
    (name "atlauncher")))

(define-public kopia
  (package
    (inherit kopia-bin)
    (name "kopia")))

(define-public kopia-ui
  (package
    (inherit kopia-ui-bin)
    (name "kopia-ui")))

(define-public playit
  (package
    (inherit playit-bin)
    (name "playit")))

;; arduino-ctags: defined in recipe-resolver-260408t
;; notesnook-bin: defined in recipe-resolver-260408t
;; jellyfin-desktop-bin: defined in recipe-resolver-260408t
;; libsmb2: defined in recipe-resolver-260408t
;; playit-agent-bin: defined in recipe-resolver-260408t

;; --- recipe-resolver-260408u compat aliases ---
;; (No compat aliases needed - all packages have unique names)

;; --- recipe-resolver-260408v compat aliases ---
;; (No compat aliases needed - all packages have unique names)


;;;
;;; -- recipe-resolver-260408w compat aliases --------------------------
;;;

(define-public graphite-gtk-theme-wallpaper-git
  (package
    (inherit graphite-gtk-theme)
    (name "graphite-gtk-theme-wallpaper-git")))

(define-public graphite-gtk-theme-rimless-normal-git
  (package
    (inherit graphite-gtk-theme)
    (name "graphite-gtk-theme-rimless-normal-git")))

(define-public graphite-gtk-theme-rimless-normal-compact-git
  (package
    (inherit graphite-gtk-theme)
    (name "graphite-gtk-theme-rimless-normal-compact-git")))

(define-public graphite-gtk-theme-rimless-git
  (package
    (inherit graphite-gtk-theme)
    (name "graphite-gtk-theme-rimless-git")))

(define-public graphite-gtk-theme-rimless-compact-git
  (package
    (inherit graphite-gtk-theme)
    (name "graphite-gtk-theme-rimless-compact-git")))

(define-public graphite-gtk-theme-normal-git
  (package
    (inherit graphite-gtk-theme)
    (name "graphite-gtk-theme-normal-git")))

(define-public graphite-gtk-theme-normal-compact-git
  (package
    (inherit graphite-gtk-theme)
    (name "graphite-gtk-theme-normal-compact-git")))

(define-public graphite-gtk-theme-nord-rimless-normal-git
  (package
    (inherit graphite-gtk-theme)
    (name "graphite-gtk-theme-nord-rimless-normal-git")))

(define-public graphite-gtk-theme-nord-rimless-normal-compact-git
  (package
    (inherit graphite-gtk-theme)
    (name "graphite-gtk-theme-nord-rimless-normal-compact-git")))

(define-public graphite-gtk-theme-nord-rimless-git
  (package
    (inherit graphite-gtk-theme)
    (name "graphite-gtk-theme-nord-rimless-git")))

(define-public graphite-gtk-theme-nord-rimless-compact-git
  (package
    (inherit graphite-gtk-theme)
    (name "graphite-gtk-theme-nord-rimless-compact-git")))

(define-public graphite-gtk-theme-nord-normal-git
  (package
    (inherit graphite-gtk-theme)
    (name "graphite-gtk-theme-nord-normal-git")))

(define-public graphite-gtk-theme-nord-normal-compact-git
  (package
    (inherit graphite-gtk-theme)
    (name "graphite-gtk-theme-nord-normal-compact-git")))

(define-public graphite-gtk-theme-nord-git
  (package
    (inherit graphite-gtk-theme)
    (name "graphite-gtk-theme-nord-git")))

(define-public graphite-gtk-theme-nord-compact-git
  (package
    (inherit graphite-gtk-theme)
    (name "graphite-gtk-theme-nord-compact-git")))

(define-public graphite-gtk-theme-git
  (package
    (inherit graphite-gtk-theme)
    (name "graphite-gtk-theme-git")))

(define-public graphite-gtk-theme-compact-git
  (package
    (inherit graphite-gtk-theme)
    (name "graphite-gtk-theme-compact-git")))

(define-public graphite-gtk-theme-black-rimless-normal-git
  (package
    (inherit graphite-gtk-theme)
    (name "graphite-gtk-theme-black-rimless-normal-git")))

(define-public graphite-gtk-theme-black-rimless-normal-compact-git
  (package
    (inherit graphite-gtk-theme)
    (name "graphite-gtk-theme-black-rimless-normal-compact-git")))

(define-public graphite-gtk-theme-black-rimless-git
  (package
    (inherit graphite-gtk-theme)
    (name "graphite-gtk-theme-black-rimless-git")))

(define-public graphite-gtk-theme-black-rimless-compact-git
  (package
    (inherit graphite-gtk-theme)
    (name "graphite-gtk-theme-black-rimless-compact-git")))

(define-public graphite-gtk-theme-black-normal-git
  (package
    (inherit graphite-gtk-theme)
    (name "graphite-gtk-theme-black-normal-git")))

(define-public graphite-gtk-theme-black-normal-compact-git
  (package
    (inherit graphite-gtk-theme)
    (name "graphite-gtk-theme-black-normal-compact-git")))

(define-public graphite-gtk-theme-black-git
  (package
    (inherit graphite-gtk-theme)
    (name "graphite-gtk-theme-black-git")))

(define-public graphite-gtk-theme-black-compact-git
  (package
    (inherit graphite-gtk-theme)
    (name "graphite-gtk-theme-black-compact-git")))

(define-public fontpreview-git
  (package
    (inherit fontpreview)
    (name "fontpreview-git")))

; --- recipe-resolver-260408x compat aliases ---

(define-public clipsync-git
  (package
    (inherit clipsync)
    (name "clipsync-git")))

(define-public dmenustatus-git
  (package
    (inherit dmenustatus)
    (name "dmenustatus-git")))

(define-public bridge-core-bin-compat
  (package
    (inherit bridge-core-bin)
    (name "bridge-core-bin")))

(define-public tmodloader-bin-compat
  (package
    (inherit tmodloader-bin)
    (name "tmodloader-bin")))

(define-public music-assistant-desktop-bin-compat
  (package
    (inherit music-assistant-desktop-bin)
    (name "music-assistant-desktop-bin")))

(define-public snapmaker-orca-appimage-compat
  (package
    (inherit snapmaker-orca-appimage)
    (name "snapmaker-orca-appimage")))

(define-public adb-gui-kit-bin-compat
  (package
    (inherit adb-gui-kit-bin)
    (name "adb-gui-kit-bin")))

(define-public xapp-appimage-thumbnailer-compat
  (package
    (inherit xapp-appimage-thumbnailer)
    (name "xapp-appimage-thumbnailer")))

(define-public mev-boost-compat
  (package
    (inherit mev-boost-bin)
    (name "mev-boost")))

(define-public surge-compat
  (package
    (inherit surge-bin)
    (name "surge")))

(define-public konfyt-compat
  (package
    (inherit konfyt)
    (name "konfyt")))

(define-public alix-git
  (package
    (inherit alix)
    (name "alix-git")))

(define-public task-manager-compat
  (package
    (inherit task-manager)
    (name "task-manager")))

; --- deptree-resolver-260412a compat aliases ---
(define-public otf-arundina (package (inherit font-arundina) (name "otf-arundina")))

; --- recipe-resolver-260412b/c compat aliases ---
(define-public waterfox-bin (package (inherit waterfox-bin-pkg) (name "waterfox-bin")))
(define-public offpunk-git (package (inherit offpunk) (name "offpunk-git")))
(define-public brscan5 (package (inherit brscan5-bin) (name "brscan5")))
(define-public megasync (package (inherit megasync-bin) (name "megasync")))
(define-public jdtls (package (inherit jdtls-bin) (name "jdtls")))
(define-public irpf2025 (package (inherit irpf2025-bin) (name "irpf2025")))
(define-public woff2-material-symbols-variable (package (inherit font-material-symbols-variable) (name "woff2-material-symbols-variable")))
(define-public microsoft-identity-broker (package (inherit microsoft-identity-broker-bin) (name "microsoft-identity-broker")))
(define-public hyprshutdown-compat (package (inherit hyprshutdown) (name "hyprshutdown-compat")))
(define-public bitwig-studio (package (inherit bitwig-studio-bin) (name "bitwig-studio")))
(define-public notion-app-electron (package (inherit notion-app-bin) (name "notion-app-electron")))
(define-public nettui (package (inherit nettui-bin) (name "nettui")))
(define-public opentubex (package (inherit opentubex-bin) (name "opentubex")))
(define-public ani2xcursor (package (inherit ani2xcursor-bin) (name "ani2xcursor")))
(define-public crtui (package (inherit crtui-bin) (name "crtui")))
(define-public mdterm (package (inherit mdterm-bin) (name "mdterm")))
(define-public btdu (package (inherit btdu-bin) (name "btdu")))
(define-public openide (package (inherit openide-bin) (name "openide")))
(define-public tsenta-desktop (package (inherit tsenta-desktop-bin) (name "tsenta-desktop")))
(define-public bookokrat (package (inherit bookokrat-bin) (name "bookokrat")))
(define-public terraria-server (package (inherit terraria-server-bin) (name "terraria-server")))
(define-public intune-portal (package (inherit intune-portal-bin) (name "intune-portal")))
(define-public reiserfsprogs (package (inherit reiserfsprogs-pkg) (name "reiserfsprogs")))


; --- recipe-resolver-260413a compat aliases ---

(define-public sshm-bin-compat
  (package
    (inherit sshm)
    (name "sshm-bin")))

(define-public librepods-git
  (package
    (inherit librepods)
    (name "librepods-git")))

(define-public shaka-packager-git
  (package
    (inherit shaka-packager)
    (name "shaka-packager-git")))

(define-public ffmpeg-libfdk_aac
  (package
    (inherit ffmpeg-libfdk-aac)
    (name "ffmpeg-libfdk_aac")))

(define-public astro_modloader
  (package
    (inherit astro-modloader)
    (name "astro_modloader")))

; --- recipe-resolver-260413c compat aliases ---

(define-public tome4-zomnibus_addon
  (package
    (inherit tome4-zomnibus-addon)
    (name "tome4-zomnibus_addon")))

(define-public opentaiko
  (package
    (inherit opentaiko-bin)
    (name "opentaiko")))

(define-public whisper.cpp-vulkan
  (package
    (inherit whisper-cpp-vulkan)
    (name "whisper.cpp-vulkan")))

(define-public rbdoom3-bfg-git
  (package
    (inherit rbdoom3-bfg)
    (name "rbdoom3-bfg-git")))


;;; --- recipe-resolver-260413d compat aliases ---

;;; --- deptree-resolver-260413e compat aliases ---

(define-public plymouth-i_use_arch_btw-git
  (package
    (inherit plymouth-i-use-arch-btw-git)
    (name "plymouth-i_use_arch_btw-git")))

(define-public powerofforreboot.efi
  (package
    (inherit powerofforreboot-efi)
    (name "powerofforreboot.efi")))

(define-public ps_mem
  (package
    (inherit ps-mem)
    (name "ps_mem")))

(define-public ruby-unicode_utils
  (package
    (inherit ruby-unicode-utils)
    (name "ruby-unicode_utils")))

(define-public serve_md
  (package
    (inherit serve-md)
    (name "serve_md")))

(define-public tome4-ashes_of_urhrok
  (package
    (inherit tome4-ashes-of-urhrok)
    (name "tome4-ashes_of_urhrok")))

(define-public tome4-embers_of_rage
  (package
    (inherit tome4-embers-of-rage)
    (name "tome4-embers_of_rage")))

(define-public tome4-forbidden_cults
  (package
    (inherit tome4-forbidden-cults)
    (name "tome4-forbidden_cults")))

; --- deptree-resolver-260413f compat aliases ---
(define-public ttf-arundina (package (inherit font-arundina) (name "ttf-arundina")))
(define-public ttf-inconsolata-hellenic (package (inherit font-inconsolata-hellenic) (name "ttf-inconsolata-hellenic")))


; --- recipe-resolver-260413k compat aliases ---
(define-public pisek-git (package (inherit pisek) (name "pisek-git")))
(define-public wlr-dpms-git (package (inherit wlr-dpms) (name "wlr-dpms-git")))
(define-public wl-gears-git (package (inherit wl-gears) (name "wl-gears-git")))
(define-public xdgctl-git (package (inherit xdgctl) (name "xdgctl-git")))

; --- recipe-resolver-260413l compat aliases ---
(define-public ttf-gelasio-variable (package (inherit font-gelasio) (name "ttf-gelasio-variable")))
(define-public graphite-cursor-theme-git (package (inherit graphite-cursor-theme) (name "graphite-cursor-theme-git")))
(define-public gnome-shell-extension-pop-shell-git (package (inherit gnome-shell-extension-pop-shell) (name "gnome-shell-extension-pop-shell-git")))
(define-public gnome-shell-extension-just-perfection-desktop (package (inherit gnome-shell-extension-just-perfection) (name "gnome-shell-extension-just-perfection-desktop")))


; --- deptree-resolver-260413g compat aliases ---
(define-public bash-fuzzy-clock-git (package (inherit bash-fuzzy-clock) (name "bash-fuzzy-clock-git")))
(define-public arkenfox-user.js-git (package (inherit arkenfox-user.js) (name "arkenfox-user.js-git")))
(define-public unreal-tournament-data-archiveorg (package (inherit unreal-tournament-data) (name "unreal-tournament-data-archiveorg")))
(define-public typing_test (package (inherit typing-test) (name "typing_test")))
(define-public aspire-cli (package (inherit aspire-cli-bin) (name "aspire-cli")))
(define-public plecs-standalone (package (inherit plecs-standalone-bin) (name "plecs-standalone")))
(define-public davinci-resolve-studio (package (inherit davinci-resolve-studio-bin) (name "davinci-resolve-studio")))


; --- recipe-resolver-260413m compat aliases ---
(define-public tetro-tui (package (inherit tetro-tui-bin) (name "tetro-tui")))
(define-public sing-box (package (inherit sing-box-bin) (name "sing-box")))
(define-public qui (package (inherit qui-bin) (name "qui")))
(define-public dwproton (package (inherit dwproton-bin) (name "dwproton")))
(define-public czkawka-gui (package (inherit czkawka-gui-bin) (name "czkawka-gui")))
(define-public min-browser (package (inherit min-browser-bin) (name "min-browser")))
(define-public cinny-desktop (package (inherit cinny-desktop-bin) (name "cinny-desktop")))
(define-public modrinth-app (package (inherit modrinth-app-bin) (name "modrinth-app")))
(define-public modiva-launcher (package (inherit modiva-launcher-bin) (name "modiva-launcher")))
(define-public futhark (package (inherit futhark-bin) (name "futhark")))
(define-public crystal-dock (package (inherit crystal-dock-bin) (name "crystal-dock")))
(define-public universal-android-debloater (package (inherit universal-android-debloater-bin) (name "universal-android-debloater")))
(define-public shgit (package (inherit shgit-bin) (name "shgit")))
(define-public goose-desktop (package (inherit goose-desktop-bin) (name "goose-desktop")))
(define-public pear-desktop (package (inherit pear-desktop-bin) (name "pear-desktop")))
(define-public vdhcoapp (package (inherit vdhcoapp-bin) (name "vdhcoapp")))
(define-public quarto-cli (package (inherit quarto-cli-bin) (name "quarto-cli")))
(define-public pacseek (package (inherit pacseek-bin) (name "pacseek")))
(define-public ckan (package (inherit ckan-bin) (name "ckan")))
(define-public rstudio-desktop (package (inherit rstudio-desktop-bin) (name "rstudio-desktop")))
(define-public xenia-edge (package (inherit xenia-edge-bin) (name "xenia-edge")))
(define-public powerline-go (package (inherit powerline-go-bin) (name "powerline-go")))
(define-public teams-for-linux (package (inherit teams-for-linux-bin) (name "teams-for-linux")))
(define-public forkgram (package (inherit forkgram-bin) (name "forkgram")))
(define-public breitbandmessung (package (inherit breitbandmessung-bin) (name "breitbandmessung")))
(define-public sniptext-bin (package (inherit sniptext) (name "sniptext-bin")))
(define-public marp (package (inherit marp-cli) (name "marp")))
(define-public xfce-winxp-tc (package (inherit xfce-winxp-tc-git) (name "xfce-winxp-tc")))
(define-public libwintc (package (inherit libwintc-git) (name "libwintc")))
(define-public zenmonitor3 (package (inherit zenmonitor3-git) (name "zenmonitor3")))
(define-public twintaillauncher (package (inherit twintaillauncher-git) (name "twintaillauncher")))
(define-public chatterino2 (package (inherit chatterino2-git) (name "chatterino2")))
(define-public ironbar (package (inherit ironbar-git) (name "ironbar")))
(define-public httpdirfs (package (inherit httpdirfs-git) (name "httpdirfs")))
(define-public adwaita-qt5 (package (inherit adwaita-qt5-git) (name "adwaita-qt5")))


; --- recipe-resolver-260413n compat aliases ---
(define-public thorium-browser-avx (package (inherit thorium-browser-avx-bin) (name "thorium-browser-avx")))
(define-public thorium-browser (package (inherit thorium-browser-avx-bin) (name "thorium-browser")))
(define-public devpod-community (package (inherit devpod-community-bin) (name "devpod-community")))
(define-public devpod (package (inherit devpod-community-bin) (name "devpod")))
(define-public phiola (package (inherit phiola-bin) (name "phiola")))
(define-public ionosctl (package (inherit ionosctl-bin) (name "ionosctl")))
(define-public melonds (package (inherit melonds-bin) (name "melonds")))
(define-public keystore-explorer (package (inherit keystore-explorer-bin) (name "keystore-explorer")))
(define-public greenlight (package (inherit greenlight-bin) (name "greenlight")))
(define-public lore-cli (package (inherit lore-cli-bin) (name "lore-cli")))
(define-public tonkeeper (package (inherit tonkeeper-bin) (name "tonkeeper")))
(define-public termide (package (inherit termide-bin) (name "termide")))
(define-public kftui (package (inherit kftui-bin) (name "kftui")))
(define-public fhc (package (inherit fhc-bin) (name "fhc")))
(define-public qo (package (inherit qo-bin) (name "qo")))
(define-public vex-tui (package (inherit vex-tui-bin) (name "vex-tui")))
(define-public ghk (package (inherit ghk-bin) (name "ghk")))
(define-public antares-sql (package (inherit antares-sql-bin) (name "antares-sql")))
(define-public rclone-ui (package (inherit rclone-ui-bin) (name "rclone-ui")))
(define-public godot-beta (package (inherit godot-beta-bin) (name "godot-beta")))
(define-public karing (package (inherit karing-bin) (name "karing")))
(define-public data-peek (package (inherit data-peek-bin) (name "data-peek")))

; --- deptree-resolver-260413h compat aliases ---
(define-public btrfsmaintenance (package (inherit btrfsmaintenance-git) (name "btrfsmaintenance")))
(define-public catppuccin-konsole-colorscheme-frappe (package (inherit catppuccin-konsole-colorscheme-frappe-git) (name "catppuccin-konsole-colorscheme-frappe")))
(define-public catppuccin-konsole-colorscheme-latte (package (inherit catppuccin-konsole-colorscheme-latte-git) (name "catppuccin-konsole-colorscheme-latte")))
(define-public catppuccin-konsole-colorscheme-macchiato (package (inherit catppuccin-konsole-colorscheme-macchiato-git) (name "catppuccin-konsole-colorscheme-macchiato")))
(define-public catppuccin-konsole-colorscheme-mocha (package (inherit catppuccin-konsole-colorscheme-mocha-git) (name "catppuccin-konsole-colorscheme-mocha")))
(define-public cecil (package (inherit cecil-bin) (name "cecil")))
(define-public certradar-cli (package (inherit certradar-cli-bin) (name "certradar-cli")))
(define-public climp (package (inherit climp-bin) (name "climp")))
(define-public cmake-modules-webos (package (inherit cmake-modules-webos-git) (name "cmake-modules-webos")))

; --- recipe-resolver-260413p compat aliases ---
(define-public randompass (package (inherit randompass-bin) (name "randompass")))
(define-public musage (package (inherit musage-bin) (name "musage")))
(define-public dusage (package (inherit dusage-bin) (name "dusage")))
(define-public pipeview (package (inherit pipeview-bin) (name "pipeview")))
(define-public aim (package (inherit aim-bin) (name "aim")))
(define-public kdownload (package (inherit kdownload-bin) (name "kdownload")))
(define-public marmite (package (inherit marmite-bin) (name "marmite")))
(define-public darya (package (inherit darya-bin) (name "darya")))
(define-public wttrbar (package (inherit wttrbar-bin) (name "wttrbar")))
(define-public kaizen (package (inherit kaizen-bin) (name "kaizen")))
(define-public stakpak (package (inherit stakpak-bin) (name "stakpak")))
(define-public primer (package (inherit primer-bin) (name "primer")))
(define-public overskride (package (inherit overskride-bin) (name "overskride")))
(define-public jd-gui (package (inherit jd-gui-bin) (name "jd-gui")))
(define-public mindustry-server (package (inherit mindustry-server-bin) (name "mindustry-server")))
(define-public bashhound (package (inherit bashhound-git) (name "bashhound")))

; --- recipe-resolver-260413r compat aliases ---
(define-public cutieascii (package (inherit cutieascii-bin) (name "cutieascii")))

; --- deptree-resolver-260413i compat aliases ---
(define-public czkawka-cli (package (inherit czkawka-cli-bin) (name "czkawka-cli")))
(define-public deadbranch (package (inherit deadbranch-bin) (name "deadbranch")))
(define-public devbox (package (inherit devbox-bin) (name "devbox")))
(define-public dosbox-pure-unleashed (package (inherit dosbox-pure-unleashed-bin) (name "dosbox-pure-unleashed")))
(define-public dotnet-host (package (inherit dotnet-host-bin) (name "dotnet-host")))
(define-public eden (package (inherit eden-bin) (name "eden")))
(define-public eden-preview (package (inherit eden-preview-bin) (name "eden-preview")))

; --- recipe-resolver-260413s compat aliases ---
(define-public dasel (package (inherit dasel-bin) (name "dasel")))
(define-public jjui (package (inherit jjui-bin) (name "jjui")))
(define-public dust (package (inherit dust-bin) (name "dust")))
(define-public tre-command (package (inherit tre-command-bin) (name "tre-command")))
(define-public dupe-krill (package (inherit dupe-krill-bin) (name "dupe-krill")))

; --- recipe-resolver-260413t lib32 compat aliases ---
(define-public lib32-openjpeg2 (package (inherit openjpeg) (name "lib32-openjpeg2")))
(define-public lib32-zimg (package (inherit zimg) (name "lib32-zimg")))
(define-public lib32-rtmpdump (package (inherit rtmpdump) (name "lib32-rtmpdump")))
(define-public lib32-faad2 (package (inherit faad2) (name "lib32-faad2")))
(define-public lib32-a52dec (package (inherit liba52) (name "lib32-a52dec")))
(define-public lib32-libdvdnav (package (inherit libdvdnav) (name "lib32-libdvdnav")))
(define-public lib32-libdvdread (package (inherit libdvdread) (name "lib32-libdvdread")))
(define-public lib32-libdc1394 (package (inherit libdc1394) (name "lib32-libdc1394")))
(define-public lib32-libdca (package (inherit libdca) (name "lib32-libdca")))
(define-public lib32-x265 (package (inherit x265) (name "lib32-x265")))
(define-public lib32-libsrtp (package (inherit libsrtp) (name "lib32-libsrtp")))
(define-public lib32-neon (package (inherit neon) (name "lib32-neon")))
(define-public lib32-sbc (package (inherit sbc) (name "lib32-sbc")))
(define-public lib32-libde265 (package (inherit libde265) (name "lib32-libde265")))
(define-public lib32-serd (package (inherit serd) (name "lib32-serd")))
(define-public lib32-sord (package (inherit sord) (name "lib32-sord")))
(define-public lib32-libdvdcss (package (inherit libdvdcss) (name "lib32-libdvdcss")))
(define-public lib32-dav1d (package (inherit dav1d) (name "lib32-dav1d")))
(define-public lib32-shaderc (package (inherit shaderc) (name "lib32-shaderc")))
(define-public lib32-libcdio (package (inherit libcdio) (name "lib32-libcdio")))
(define-public lib32-glslang (package (inherit glslang) (name "lib32-glslang")))
(define-public lib32-zix (package (inherit zix) (name "lib32-zix")))
(define-public lib32-bluez-plugins (package (inherit bluez) (name "lib32-bluez-plugins")))
(define-public lib32-libmpcdec (package (inherit libmpcdec) (name "lib32-libmpcdec")))

; --- recipe-resolver-260413t Plymouth theme compat aliases ---
(define-public plymouth-theme-abstract-ring-git (package (inherit plymouth) (name "plymouth-theme-abstract-ring-git")))
(define-public plymouth-theme-abstract-ring-alt-git (package (inherit plymouth) (name "plymouth-theme-abstract-ring-alt-git")))
(define-public plymouth-theme-alienware-git (package (inherit plymouth) (name "plymouth-theme-alienware-git")))
(define-public plymouth-theme-angular-git (package (inherit plymouth) (name "plymouth-theme-angular-git")))
(define-public plymouth-theme-angular-alt-git (package (inherit plymouth) (name "plymouth-theme-angular-alt-git")))
(define-public plymouth-theme-black-hud-git (package (inherit plymouth) (name "plymouth-theme-black-hud-git")))
(define-public plymouth-theme-blockchain-git (package (inherit plymouth) (name "plymouth-theme-blockchain-git")))
(define-public plymouth-theme-circle-git (package (inherit plymouth) (name "plymouth-theme-circle-git")))
(define-public plymouth-theme-circle-alt-git (package (inherit plymouth) (name "plymouth-theme-circle-alt-git")))
(define-public plymouth-theme-circle-flow-git (package (inherit plymouth) (name "plymouth-theme-circle-flow-git")))
(define-public plymouth-theme-circle-hud-git (package (inherit plymouth) (name "plymouth-theme-circle-hud-git")))
(define-public plymouth-theme-circuit-git (package (inherit plymouth) (name "plymouth-theme-circuit-git")))
(define-public plymouth-theme-colorful-git (package (inherit plymouth) (name "plymouth-theme-colorful-git")))
(define-public plymouth-theme-colorful-loop-git (package (inherit plymouth) (name "plymouth-theme-colorful-loop-git")))
(define-public plymouth-theme-colorful-sliced-git (package (inherit plymouth) (name "plymouth-theme-colorful-sliced-git")))
(define-public plymouth-theme-connect-git (package (inherit plymouth) (name "plymouth-theme-connect-git")))
(define-public plymouth-theme-cross-hud-git (package (inherit plymouth) (name "plymouth-theme-cross-hud-git")))
(define-public plymouth-theme-cubes-git (package (inherit plymouth) (name "plymouth-theme-cubes-git")))
(define-public plymouth-theme-cuts-git (package (inherit plymouth) (name "plymouth-theme-cuts-git")))
(define-public plymouth-theme-cuts-alt-git (package (inherit plymouth) (name "plymouth-theme-cuts-alt-git")))

; --- recipe-resolver-260413t additional compat aliases ---
(define-public glew-2.1 (package (inherit glew) (name "glew-2.1")))
(define-public qt5-3d (package (inherit qt3d) (name "qt5-3d")))

; --- deptree-resolver-260413j compat aliases ---
(define-public ente-desktop (package (inherit ente-desktop-bin) (name "ente-desktop")))
(define-public envtrace (package (inherit envtrace-bin) (name "envtrace")))
(define-public eso-addons-manager (package (inherit eso-addons-manager-bin) (name "eso-addons-manager")))
(define-public ethtui (package (inherit ethtui-bin) (name "ethtui")))
(define-public etr (package (inherit etr-bin) (name "etr")))
(define-public exiled-exchange-2 (package (inherit exiled-exchange-2-bin) (name "exiled-exchange-2")))
(define-public fackr (package (inherit fackr-bin) (name "fackr")))
(define-public hunspell-ar (package (inherit hunspell) (name "hunspell-ar")))

; --- deptree-resolver-260413k compat aliases ---
(define-public fastfind (package (inherit fastfind-bin) (name "fastfind")))
(define-public fist (package (inherit fist-bin) (name "fist")))

; --- recipe-resolver-260413z compat aliases ---
(define-public tg-ws-proxy (package (inherit tg-ws-proxy-bin) (name "tg-ws-proxy")))
(define-public tmmpr (package (inherit tmmpr-bin) (name "tmmpr")))
(define-public vtf-thumbnailer (package (inherit vtf-thumbnailer-bin) (name "vtf-thumbnailer")))
(define-public sfxr-qt (package (inherit sfxr-qt-bin) (name "sfxr-qt")))
(define-public savestate (package (inherit savestate-bin) (name "savestate")))
(define-public camunda-modeler (package (inherit camunda-modeler-bin) (name "camunda-modeler")))
(define-public hardbore (package (inherit hardbore-bin) (name "hardbore")))
(define-public uiua (package (inherit uiua-bin) (name "uiua")))
(define-public way-edges (package (inherit way-edges-bin) (name "way-edges")))
(define-public python-textual-fspicker-git (package (inherit python-textual-fspicker) (name "python-textual-fspicker-git")))
(define-public xdg-desktop-portal-termfilechooser-hunkyburrito-git (package (inherit xdg-desktop-portal-termfilechooser-hunkyburrito) (name "xdg-desktop-portal-termfilechooser-hunkyburrito-git")))

; --- recipe-resolver-260413ac compat aliases ---
(define-public labwc-tweaks (package (inherit labwc-tweaks-git) (name "labwc-tweaks")))
(define-public obs-wayland-hotkeys (package (inherit obs-wayland-hotkeys-git) (name "obs-wayland-hotkeys")))
(define-public gcn64tools (package (inherit gcn64tools-git) (name "gcn64tools")))
(define-public whatsit-git (package (inherit whatsit) (name "whatsit-git")))
(define-public ttime-bin (package (inherit ttime) (name "ttime-bin")))
(define-public papis-git (package (inherit papis) (name "papis-git")))

;; --- recipe-resolver-260413ad compat aliases ---
(define-public sublime-text-4 (package (inherit sublime-text-4-bin) (name "sublime-text-4")))
(define-public mullvad-browser (package (inherit mullvad-browser-bin) (name "mullvad-browser")))
(define-public rojo (package (inherit rojo-bin) (name "rojo")))
(define-public perch (package (inherit perch-bin) (name "perch")))
(define-public sherut (package (inherit sherut-bin) (name "sherut")))
(define-public tickit-sync (package (inherit tickit-sync-bin) (name "tickit-sync")))
(define-public mediamtx (package (inherit mediamtx-bin) (name "mediamtx")))
(define-public librespeed-cli (package (inherit librespeed-cli-bin) (name "librespeed-cli")))
(define-public kubecolor (package (inherit kubecolor-bin) (name "kubecolor")))
(define-public petbottle (package (inherit petbottle-bin) (name "petbottle")))
(define-public pyrite64 (package (inherit pyrite64-bin) (name "pyrite64")))
(define-public postman-live (package (inherit postman-live-bin) (name "postman-live")))
(define-public wezterm-nightly (package (inherit wezterm-nightly-bin) (name "wezterm-nightly")))
(define-public tchap-desktop (package (inherit tchap-desktop-bin) (name "tchap-desktop")))
(define-public docker-credential-secretservice (package (inherit docker-credential-secretservice-bin) (name "docker-credential-secretservice")))
(define-public nvi-multibyte-git (package (inherit nvi-multibyte) (name "nvi-multibyte-git")))
(define-public stacer-git (package (inherit stacer) (name "stacer-git")))
(define-public ttf-monocraft-git (package (inherit ttf-monocraft) (name "ttf-monocraft-git")))
;; --- deptree-resolver-260413p compat aliases ---
(define-public lazyjira (package (inherit lazyjira-git) (name "lazyjira")))
(define-public libiff (package (inherit libiff-git) (name "libiff")))
;; --- deptree-resolver-260413q compat aliases ---
(define-public dvdisaster-speed47 (package (inherit dvdisaster-speed47-git) (name "dvdisaster-speed47")))
(define-public locale-en_ru (package (inherit locale-en-ru) (name "locale-en_ru")))
(define-public xr-passthrough-layer (package (inherit xr-passthrough-layer-git) (name "xr-passthrough-layer")))
;; --- recipe-resolver-260413al compat aliases ---
(define-public lianli-linux-git (package (inherit lianli-linux) (name "lianli-linux-git")))
;; --- recipe-resolver-260414b compat aliases ---
(define-public mpc-qt-git (package (inherit mpc-qt) (name "mpc-qt-git")))
(define-public trickle-git (package (inherit trickle) (name "trickle-git")))
(define-public yarr (package (inherit yarr-bin) (name "yarr")))
(define-public ab-download-manager (package (inherit ab-download-manager-bin) (name "ab-download-manager")))
(define-public neovide (package (inherit neovide-bin) (name "neovide")))
(define-public abuse-git (package (inherit abuse) (name "abuse-git")))
(define-public slowrx-git (package (inherit slowrx) (name "slowrx-git")))
(define-public jbofihe-git (package (inherit jbofihe) (name "jbofihe-git")))
(define-public retroforth-git (package (inherit retroforth) (name "retroforth-git")))
;; --- recipe-resolver-260414e compat aliases ---
(define-public uemacs-git (package (inherit uemacs) (name "uemacs-git")))
(define-public spacecadetpinball-git (package (inherit spacecadetpinball) (name "spacecadetpinball-git")))
(define-public wl_shimeji-git (package (inherit wl-shimeji) (name "wl_shimeji-git")))
(define-public libretro-handy-git (package (inherit libretro-handy) (name "libretro-handy-git")))
(define-public scangearmp2-sane-git (package (inherit scangearmp2-sane) (name "scangearmp2-sane-git")))
(define-public icon-git (package (inherit icon-lang) (name "icon-git")))
(define-public runelite (package (inherit runelite-bin) (name "runelite")))
(define-public hmcl (package (inherit hmcl-bin) (name "hmcl")))
(define-public slime-git (package (inherit emacs-slime-git) (name "slime-git")))
(define-public polymc-qt5 (package (inherit polymc-qt5-bin) (name "polymc-qt5")))
;; --- deptree-resolver-260414e compat aliases ---
(define-public hashcc (package (inherit hashcc-git) (name "hashcc")))
(define-public iamb (package (inherit iamb-git) (name "iamb")))
(define-public konfigkoll-dev (package (inherit konfigkoll-git) (name "konfigkoll-dev")))
(define-public oxid (package (inherit oxid-git) (name "oxid")))
(define-public rustfetch (package (inherit rustfetch-git) (name "rustfetch")))
(define-public steamguard-cli (package (inherit steamguard-cli-git) (name "steamguard-cli")))
(define-public gosuki (package (inherit gosuki-git) (name "gosuki")))
(define-public sing-box-ref1nd (package (inherit sing-box-ref1nd-git) (name "sing-box-ref1nd")))
(define-public helix-steel (package (inherit helix-steel-git) (name "helix-steel")))
(define-public llama-cpp-vulkan (package (inherit llama.cpp-vulkan-git) (name "llama-cpp-vulkan")))
(define-public tapi (package (inherit tapi-git) (name "tapi")))
(define-public plasma6-applets-kara (package (inherit plasma6-applets-kara-git) (name "plasma6-applets-kara")))

;; --- recipe-resolver-260414i compat aliases ---
(define-public jump (package (inherit jump-bin) (name "jump")))
(define-public orla (package (inherit orla-bin) (name "orla")))
(define-public feluda (package (inherit feluda-bin) (name "feluda")))
(define-public wasmrun (package (inherit wasmrun-bin) (name "wasmrun")))
(define-public seqtui (package (inherit seqtui-bin) (name "seqtui")))
(define-public clipvault (package (inherit clipvault-bin) (name "clipvault")))
(define-public lact-headless (package (inherit lact-headless-bin) (name "lact-headless")))
(define-public teleport-client (package (inherit teleport-client-bin) (name "teleport-client")))
(define-public jiq-ai (package (inherit jiq-ai-bin) (name "jiq-ai")))
(define-public checkstyle (package (inherit checkstyle-bin) (name "checkstyle")))
(define-public gonic (package (inherit gonic-bin) (name "gonic")))
(define-public skyterm (package (inherit skyterm-bin) (name "skyterm")))
(define-public rtimelog (package (inherit rtimelog-bin) (name "rtimelog")))
(define-public rtimelogger (package (inherit rtimelogger-bin) (name "rtimelogger")))
(define-public needle-cli (package (inherit needle-cli-bin) (name "needle-cli")))
(define-public otf-annotation-mono (package (inherit font-annotation-mono) (name "otf-annotation-mono")))
(define-public ttf-annotation-mono (package (inherit font-annotation-mono) (name "ttf-annotation-mono")))
(define-public ttf-annotation-mono-variable (package (inherit font-annotation-mono) (name "ttf-annotation-mono-variable")))

;; --- deptree-resolver-260414j compat aliases ---
(define-public cherry-studio-electron (package (inherit cherry-studio-electron-bin) (name "cherry-studio-electron")))
(define-public dcli-arch (package (inherit dcli-arch-git) (name "dcli-arch")))
(define-public fcitx5-hazkey (package (inherit fcitx5-hazkey-bin) (name "fcitx5-hazkey")))
(define-public kando (package (inherit kando-bin) (name "kando")))
(define-public mommy (package (inherit mommy-git) (name "mommy")))
(define-public ollama-cuda12 (package (inherit ollama-cuda12-bin) (name "ollama-cuda12")))
(define-public ollama-cuda13 (package (inherit ollama-cuda13-bin) (name "ollama-cuda13")))
(define-public oxmgr (package (inherit oxmgr-bin) (name "oxmgr")))
(define-public pkgstate (package (inherit pkgstate-bin) (name "pkgstate")))
(define-public quickshell-overview (package (inherit quickshell-overview-git) (name "quickshell-overview")))
(define-public sheet (package (inherit sheet-git) (name "sheet")))
(define-public tparted (package (inherit tparted-bin) (name "tparted")))
(define-public ttf-nonicons-bin (package (inherit ttf-nonicons-bin-git) (name "ttf-nonicons-bin")))
(define-public whyis (package (inherit whyis-git) (name "whyis")))
(define-public woff-nonicons-bin (package (inherit woff-nonicons-bin-git) (name "woff-nonicons-bin")))
(define-public xdg-unused-data (package (inherit xdg-unused-data-git) (name "xdg-unused-data")))
(define-public xdman-beta (package (inherit xdman-beta-bin) (name "xdman-beta")))
(define-public xpad-noone (package (inherit xpad-noone-git) (name "xpad-noone")))

;; --- deptree-resolver-260414k compat aliases ---
(define-public xytz (package (inherit xytz-bin) (name "xytz")))
(define-public yubico-authenticator (package (inherit yubico-authenticator-bin) (name "yubico-authenticator")))
(define-public anythingllm-desktop (package (inherit anythingllm-desktop-bin) (name "anythingllm-desktop")))
(define-public asf-ui (package (inherit asf-ui-git) (name "asf-ui")))
(define-public avda (package (inherit avda-bin) (name "avda")))
(define-public casa6 (package (inherit casa6-bin) (name "casa6")))
(define-public chibi-cli (package (inherit chibi-cli-git) (name "chibi-cli")))
(define-public clash-nyanpasu-nightly (package (inherit clash-nyanpasu-nightly-bin) (name "clash-nyanpasu-nightly")))
(define-public customizepkg (package (inherit customizepkg-git) (name "customizepkg")))
(define-public deadbeef-plugin-discord (package (inherit deadbeef-plugin-discord-git) (name "deadbeef-plugin-discord")))
(define-public dingusppc (package (inherit dingusppc-git) (name "dingusppc")))
(define-public dolphin-anty (package (inherit dolphin-anty-bin) (name "dolphin-anty")))

;; --- deptree-resolver-260414l compat aliases ---
(define-public ds360go (package (inherit ds360go-git) (name "ds360go")))
(define-public eclipse-dsl (package (inherit eclipse-dsl-bin) (name "eclipse-dsl")))
(define-public fbpdf (package (inherit fbpdf-git) (name "fbpdf")))
(define-public ftb-app (package (inherit ftb-app-bin) (name "ftb-app")))
(define-public gemini-cli (package (inherit gemini-cli-git) (name "gemini-cli")))
(define-public ginkgocadx (package (inherit ginkgocadx-bin) (name "ginkgocadx")))
(define-public gitversion (package (inherit gitversion-bin) (name "gitversion")))
(define-public go-grip (package (inherit go-grip-git) (name "go-grip")))

;; --- deptree-resolver-260414m compat aliases ---
(define-public jdk8-graalvm-ee (package (inherit jdk8-graalvm-ee-bin) (name "jdk8-graalvm-ee")))
(define-public jdwp-mcp (package (inherit jdwp-mcp-git) (name "jdwp-mcp")))
(define-public joycon (package (inherit joycon-git) (name "joycon")))
(define-public kazumi (package (inherit kazumi-bin) (name "kazumi")))
(define-public libdeep-filter-ladspa (package (inherit libdeep-filter-ladspa-git) (name "libdeep-filter-ladspa")))
(define-public libdf (package (inherit libdf-git) (name "libdf")))
(define-public libilbm (package (inherit libilbm-git) (name "libilbm")))
(define-public libretro-swanstation (package (inherit libretro-swanstation-git) (name "libretro-swanstation")))
(define-public llama-cpp-sycl-f16 (package (inherit llama-cpp-sycl-f16-git) (name "llama-cpp-sycl-f16")))
(define-public logseq-desktop-electron (package (inherit logseq-desktop-electron-bin) (name "logseq-desktop-electron")))
(define-public lsu (package (inherit lsu-git) (name "lsu")))
(define-public misuzu-music (package (inherit misuzu-music-bin) (name "misuzu-music")))
(define-public motoc (package (inherit motoc-git) (name "motoc")))
(define-public nikode (package (inherit nikode-bin) (name "nikode")))
(define-public niri-sidebar (package (inherit niri-sidebar-git) (name "niri-sidebar")))
(define-public nirinit (package (inherit nirinit-git) (name "nirinit")))

;; --- deptree-resolver-260414n compat aliases ---
(define-public obos-genissue (package (inherit obos-genissue-git) (name "obos-genissue")))
(define-public omnom (package (inherit omnom-git) (name "omnom")))
(define-public opera-proxy (package (inherit opera-proxy-git) (name "opera-proxy")))
(define-public packwiz (package (inherit packwiz-git) (name "packwiz")))
(define-public partclone (package (inherit partclone-git) (name "partclone")))
(define-public printnotes (package (inherit printnotes-git) (name "printnotes")))
(define-public python-zoekt-py (package (inherit python-zoekt-py-git) (name "python-zoekt-py")))
(define-public radii5 (package (inherit radii5-bin) (name "radii5")))
(define-public rexit (package (inherit rexit-git) (name "rexit")))
(define-public riftbar (package (inherit riftbar-bin) (name "riftbar")))
(define-public rimsort (package (inherit rimsort-git) (name "rimsort")))
(define-public ruffle-nightly (package (inherit ruffle-nightly-bin) (name "ruffle-nightly")))
(define-public run0-sudo-shim (package (inherit run0-sudo-shim-git) (name "run0-sudo-shim")))
(define-public selectdefaultapplication (package (inherit selectdefaultapplication-git) (name "selectdefaultapplication")))
(define-public shellman (package (inherit shellman-bin) (name "shellman")))
(define-public shiru (package (inherit shiru-git) (name "shiru")))
(define-public sickchill (package (inherit sickchill-git) (name "sickchill")))

;; --- deptree-resolver-260414o compat aliases ---
(define-public pat-aur-client (package (inherit pat-aur-client-git) (name "pat-aur-client")))
(define-public grx (package (inherit grx-bin) (name "grx")))
(define-public hardcode-fixer (package (inherit hardcode-fixer-git) (name "hardcode-fixer")))
(define-public ffbtools (package (inherit ffbtools-git) (name "ffbtools")))
(define-public gvst-vst (package (inherit gvst-vst-bin) (name "gvst-vst")))
(define-public mpv-manager (package (inherit mpv-manager-git) (name "mpv-manager")))
(define-public pidcat-python3 (package (inherit pidcat-python3-git) (name "pidcat-python3")))
(define-public openvpn-update-resolv-conf (package (inherit openvpn-update-resolv-conf-git) (name "openvpn-update-resolv-conf")))
(define-public powerline-fonts (package (inherit powerline-fonts-git) (name "powerline-fonts")))
(define-public sklauncher (package (inherit sklauncher-bin) (name "sklauncher")))
(define-public sle-suite-pro (package (inherit sle-suite-pro-git) (name "sle-suite-pro")))
(define-public smartdeblur (package (inherit smartdeblur-git) (name "smartdeblur")))
(define-public smtk-obs (package (inherit smtk-obs-git) (name "smtk-obs")))
(define-public spacebar-client (package (inherit spacebar-client-git) (name "spacebar-client")))
(define-public stable-diffusion-webui (package (inherit stable-diffusion-webui-git) (name "stable-diffusion-webui")))
(define-public steamdepotdownloadergui (package (inherit steamdepotdownloadergui-bin) (name "steamdepotdownloadergui")))

;; --- recipe-resolver-260414v compat aliases ---
(define-public ngrrram (package (inherit ngrrram-bin) (name "ngrrram")))
(define-public cmdcreate (package (inherit cmdcreate-bin) (name "cmdcreate")))
(define-public udever (package (inherit udever-bin) (name "udever")))
(define-public virt-install (package (inherit virt-install-git) (name "virt-install")))
;; --- recipe-resolver-260414x compat aliases ---
(define-public qbittorrent-enhanced-ua-alias (package (inherit qbittorrent-enhanced-ua) (name "qbittorrent-enhanced-ua-alias")))
(define-public qbittorrent-enhanced-ua-nox-alias (package (inherit qbittorrent-enhanced-ua-nox) (name "qbittorrent-enhanced-ua-nox-alias")))

;; --- deptree-resolver-260414q compat aliases ---
(define-public elephant (package (inherit elephant-bin) (name "elephant")))
(define-public electron-castlab (package (inherit electron-castlab-bin) (name "electron-castlab")))
(define-public ttf-material-symbols-variable (package (inherit ttf-material-symbols-variable-git) (name "ttf-material-symbols-variable")))
(define-public dotnet-targeting-pack-9.0 (package (inherit dotnet-targeting-pack-9.0-bin) (name "dotnet-targeting-pack-9.0")))
(define-public python-pyfakewebcam (package (inherit python-pyfakewebcam-git) (name "python-pyfakewebcam")))
(define-public libastal-gjs (package (inherit libastal-gjs-git) (name "libastal-gjs")))
(define-public python-mediapipe (package (inherit python-mediapipe-bin) (name "python-mediapipe")))
(define-public amdonly-gaming-opencl-rusticl-mesa (package (inherit amdonly-gaming-opencl-rusticl-mesa-git) (name "amdonly-gaming-opencl-rusticl-mesa")))
(define-public amdonly-gaming-mesa (package (inherit amdonly-gaming-mesa-git) (name "amdonly-gaming-mesa")))
(define-public amdonly-gaming-vulkan-radeon (package (inherit amdonly-gaming-vulkan-radeon-git) (name "amdonly-gaming-vulkan-radeon")))
(define-public amdonly-gaming-vulkan-mesa-layers (package (inherit amdonly-gaming-vulkan-mesa-layers-git) (name "amdonly-gaming-vulkan-mesa-layers")))
(define-public qemu-headless (package (inherit qemu-headless-git) (name "qemu-headless")))
(define-public auth0 (package (inherit auth0-bin) (name "auth0")))
(define-public binjr (package (inherit binjr-bin) (name "binjr")))
(define-public binvec (package (inherit binvec-bin) (name "binvec")))

;; --- recipe-resolver-260414y compat aliases ---
(define-public xdg-desktop-portal-minimal (package (inherit xdg-desktop-portal-minimal-git) (name "xdg-desktop-portal-minimal")))
(define-public kdiff3-git-alias (package (inherit kdiff3) (name "kdiff3-git")))

;; --- recipe-resolver-260414z compat aliases ---
(define-public cvs-feature (package (inherit cvs-feature-bin) (name "cvs-feature")))

;; --- deptree-resolver-260414s compat aliases ---
(define-public casa6-pipeline (package (inherit casa6-pipeline-bin) (name "casa6-pipeline")))
(define-public fsp (package (inherit fsp-bin) (name "fsp")))
(define-public mkinitcpio-colors (package (inherit mkinitcpio-colors-git) (name "mkinitcpio-colors")))
(define-public urnetwork-provider (package (inherit urnetwork-provider-git) (name "urnetwork-provider")))
(define-public vapoursynth-plugin-vship-amd (package (inherit vapoursynth-plugin-vship-amd-git) (name "vapoursynth-plugin-vship-amd")))
(define-public vapoursynth-tools-genstubs (package (inherit vapoursynth-tools-genstubs-git) (name "vapoursynth-tools-genstubs")))
(define-public ynote-desktop (package (inherit ynote-desktop-bin) (name "ynote-desktop")))

;; --- deptree-resolver-260414u compat aliases ---
(define-public bcachefs-kernel-dkms (package (inherit bcachefs-kernel-dkms-git) (name "bcachefs-kernel-dkms")))
(define-public ntfsplus-dkms (package (inherit ntfsplus-dkms-git) (name "ntfsplus-dkms")))
(define-public ryzen-smu-dkms (package (inherit ryzen-smu-dkms-git) (name "ryzen-smu-dkms")))
(define-public xpad-dkms (package (inherit xpad-dkms-git) (name "xpad-dkms")))
;; zenpower3-dkms is a real package, not an alias of zenpower3-dkms-git
(define-public zenpower5-dkms (package (inherit zenpower5-dkms-git) (name "zenpower5-dkms")))
(define-public droidcam-dkms (package (inherit droidcam-dkms-git) (name "droidcam-dkms")))
(define-public linux-apfs-rw-dkms (package (inherit linux-apfs-rw-dkms-git) (name "linux-apfs-rw-dkms")))
(define-public nifskope (package (inherit nifskope-git) (name "nifskope")))
(define-public rtw88-dkms (package (inherit rtw88-dkms-git) (name "rtw88-dkms")))
(define-public rtw89-dkms (package (inherit rtw89-dkms-git) (name "rtw89-dkms")))
(define-public v4l2loopback-dkms (package (inherit v4l2loopback-dkms-git) (name "v4l2loopback-dkms")))
;; xone-dkms is a real package, not an alias of xone-dkms-git
(define-public zfs-dkms-staging-compat (package (inherit zfs-dkms-staging-compat-git) (name "zfs-dkms-staging-compat")))
(define-public apifox (package (inherit apifox-appimage) (name "apifox")))
(define-public arch-upgrader (package (inherit arch-upgrader-git) (name "arch-upgrader")))
(define-public archforge (package (inherit archforge-git) (name "archforge")))
(define-public aurvote-utils (package (inherit aurvote-utils-git) (name "aurvote-utils")))
(define-public deepfilternet-demos (package (inherit deepfilternet-demos-git) (name "deepfilternet-demos")))
(define-public dela (package (inherit dela-git) (name "dela")))
(define-public discord-rpc-wine (package (inherit discord-rpc-wine-git) (name "discord-rpc-wine")))
(define-public drawio-live (package (inherit drawio-live-bin) (name "drawio-live")))
(define-public easy-switcher (package (inherit easy-switcher-git) (name "easy-switcher")))
(define-public foobard (package (inherit foobard-git) (name "foobard")))
(define-public freesmlauncher (package (inherit freesmlauncher-bin) (name "freesmlauncher")))
(define-public gj (package (inherit gj-git) (name "gj")))
(define-public gnome-shell-extension-quick-settings-tweaks (package (inherit gnome-shell-extension-quick-settings-tweaks-git) (name "gnome-shell-extension-quick-settings-tweaks")))

;; --- recipe-resolver-260414ae compat aliases ---
;; waterfox already exists as waterfox-bin (line 6316, from recipe-resolver-260412b)
(define-public ksnip-git (package (inherit ksnip-bin) (name "ksnip-git")))
(define-public ksnip (package (inherit ksnip-bin) (name "ksnip")))
(define-public veracrypt-git (package (inherit veracrypt-bin) (name "veracrypt-git")))
(define-public veracrypt (package (inherit veracrypt-bin) (name "veracrypt")))
(define-public hyprshell (package (inherit hyprshell-bin) (name "hyprshell")))
(define-public youtube-dl-gui (package (inherit youtube-dl-gui-bin) (name "youtube-dl-gui")))
(define-public norisk-client-launcher-nvidia (package (inherit norisk-client-launcher-nvidia-bin) (name "norisk-client-launcher-nvidia")))
(define-public ultimate-tic-tac-toe-git (package (inherit ultimate-tic-tac-toe) (name "ultimate-tic-tac-toe-git")))
(define-public plasma-gamemode-git (package (inherit plasma-gamemode) (name "plasma-gamemode-git")))
(define-public deezer-enhanced-git (package (inherit deezer-enhanced-bin) (name "deezer-enhanced-git")))

;; --- deptree-resolver-260414v compat aliases ---
(define-public zenpower3-dkms (package (inherit zenpower3-dkms-git) (name "zenpower3-dkms")))
(define-public hyperheadset (package (inherit hyperheadset-git) (name "hyperheadset")))
(define-public i8086emu (package (inherit i8086emu-git) (name "i8086emu")))
(define-public jivexdv (package (inherit jivexdv-bin) (name "jivexdv")))
(define-public kdotool (package (inherit kdotool-git) (name "kdotool")))
(define-public kraftkit (package (inherit kraftkit-git) (name "kraftkit")))
(define-public ktxutils (package (inherit ktxutils-git) (name "ktxutils")))
(define-public kwin-decoration-sierra-breeze-enhanced (package (inherit kwin-decoration-sierra-breeze-enhanced-git) (name "kwin-decoration-sierra-breeze-enhanced")))
(define-public lceda-pro (package (inherit lceda-pro-bin) (name "lceda-pro")))
(define-public legcord (package (inherit legcord-git) (name "legcord")))
(define-public loliashizuku (package (inherit loliashizuku-bin) (name "loliashizuku")))
(define-public lovr-playspace (package (inherit lovr-playspace-git) (name "lovr-playspace")))
(define-public lxqt-panel-tool (package (inherit lxqt-panel-tool-git) (name "lxqt-panel-tool")))
(define-public majsoul-plus (package (inherit majsoul-plus-bin) (name "majsoul-plus")))
(define-public miraclecast (package (inherit miraclecast-git) (name "miraclecast")))
(define-public myxer (package (inherit myxer-git) (name "myxer")))
(define-public nanoclaw (package (inherit nanoclaw-git) (name "nanoclaw")))
(define-public ncmpcpp-album-cover (package (inherit ncmpcpp-album-cover-git) (name "ncmpcpp-album-cover")))
(define-public nexusmods-app (package (inherit nexusmods-app-bin) (name "nexusmods-app")))
(define-public niri-settings (package (inherit niri-settings-git) (name "niri-settings")))
(define-public ollama-vulkan (package (inherit ollama-vulkan-bin) (name "ollama-vulkan")))
(define-public openscq30-gui (package (inherit openscq30-gui-bin) (name "openscq30-gui")))
(define-public osu-lazer-tachyon (package (inherit osu-lazer-tachyon-bin) (name "osu-lazer-tachyon")))

;; --- recipe-resolver-260415a compat aliases ---
(define-public xmousepasteblock (package (inherit xmousepasteblock-git) (name "xmousepasteblock")))
(define-public wallchemy (package (inherit wallchemy-bin) (name "wallchemy")))
(define-public jdk25-graalvm (package (inherit jdk25-graalvm-bin) (name "jdk25-graalvm")))

;; --- deptree-resolver-260415b compat aliases ---
(define-public opentubex (package (inherit opentubex-git) (name "opentubex")))
(define-public pmt (package (inherit pmt-git) (name "pmt")))
(define-public procreate-thumbnailer (package (inherit procreate-thumbnailer-git) (name "procreate-thumbnailer")))
(define-public qqmusic (package (inherit qqmusic-bin) (name "qqmusic")))
(define-public radarr (package (inherit radarr-bin) (name "radarr")))
(define-public rdrview (package (inherit rdrview-git) (name "rdrview")))
(define-public requestly (package (inherit requestly-bin) (name "requestly")))
(define-public river-bedload (package (inherit river-bedload-git) (name "river-bedload")))
(define-public rotki (package (inherit rotki-bin) (name "rotki")))
(define-public rtl8821ce-dkms (package (inherit rtl8821ce-dkms-git) (name "rtl8821ce-dkms")))
(define-public rustwhy (package (inherit rustwhy-git) (name "rustwhy")))
(define-public samrewritten (package (inherit samrewritten-git) (name "samrewritten")))
(define-public sickrage (package (inherit sickrage-git) (name "sickrage")))
(define-public spflashtool5 (package (inherit spflashtool5-bin) (name "spflashtool5")))
(define-public steamvr-linux-fixes-layer (package (inherit steamvr-linux-fixes-layer-git) (name "steamvr-linux-fixes-layer")))
(define-public syncovery (package (inherit syncovery-bin) (name "syncovery")))
(define-public systemd-cron-next (package (inherit systemd-cron-next-git) (name "systemd-cron-next")))
(define-public tlp-rdw (package (inherit tlp-rdw-git) (name "tlp-rdw")))
(define-public tribler (package (inherit tribler-bin) (name "tribler")))
(define-public upscayl (package (inherit upscayl-appimage) (name "upscayl")))
(define-public uptater (package (inherit uptater-bin) (name "uptater")))
(define-public waveloggate (package (inherit waveloggate-git) (name "waveloggate")))

;; --- recipe-resolver-260415b compat aliases ---
(define-public rofi-gpaste (package (inherit rofi-gpaste-git) (name "rofi-gpaste")))
(define-public pwmenu (package (inherit pwmenu-git) (name "pwmenu")))
(define-public oxicord (package (inherit oxicord-git) (name "oxicord")))
(define-public aeroshell-smod (package (inherit aeroshell-smod-git) (name "aeroshell-smod")))
(define-public aeroshell-smodglow-x11 (package (inherit aeroshell-smodglow-x11-git) (name "aeroshell-smodglow-x11")))
(define-public plasma6-wallpapers-smart-video-wallpaper-reborn (package (inherit plasma6-wallpapers-smart-video-wallpaper-reborn-git) (name "plasma6-wallpapers-smart-video-wallpaper-reborn")))
(define-public linux-firmware-qlogic (package (inherit linux-firmware-qlogic-git) (name "linux-firmware-qlogic")))
(define-public linux-firmware-bnx2x (package (inherit linux-firmware-bnx2x-git) (name "linux-firmware-bnx2x")))
(define-public aeolus-next-vst3 (package (inherit aeolus-next-vst3-bin) (name "aeolus-next-vst3")))

;; --- recipe-resolver-260415c compat aliases ---
(define-public gnome-shell-extension-big-avatar (package (inherit gnome-shell-extension-big-avatar-git) (name "gnome-shell-extension-big-avatar")))
(define-public gnome-shell-extension-asdbctl-slider (package (inherit gnome-shell-extension-asdbctl-slider-git) (name "gnome-shell-extension-asdbctl-slider")))
(define-public freetok-cpp (package (inherit freetok-cpp-git) (name "freetok-cpp")))
(define-public exif-cleaner-gui (package (inherit exif-cleaner-gui-bin) (name "exif-cleaner-gui")))
(define-public desktop-creator (package (inherit desktop-creator-git) (name "desktop-creator")))
(define-public deepin-sound-theme (package (inherit deepin-sound-theme-git) (name "deepin-sound-theme")))
(define-public libsai (package (inherit libsai-git) (name "libsai")))
(define-public textmerger (package (inherit textmerger-bin) (name "textmerger")))
(define-public php-box (package (inherit php-box-bin) (name "php-box")))
(define-public kubetail (package (inherit kubetail-bin) (name "kubetail")))
(define-public shai (package (inherit shai-bin) (name "shai")))
(define-public rssnix (package (inherit rssnix-bin) (name "rssnix")))
(define-public libplib (package (inherit libplib-bin) (name "libplib")))
(define-public speed-dreams-data (package (inherit speed-dreams-data-bin) (name "speed-dreams-data")))
(define-public gtk-engine-bluecurve (package (inherit gtk-engine-bluecurve-git) (name "gtk-engine-bluecurve")))
(define-public bluecurve-wallpapers (package (inherit bluecurve-wallpapers-git) (name "bluecurve-wallpapers")))
(define-public bluecurve-icon-theme (package (inherit bluecurve-icon-theme-git) (name "bluecurve-icon-theme")))
(define-public bluecurve-gtk-theme (package (inherit bluecurve-gtk-theme-git) (name "bluecurve-gtk-theme")))
(define-public psutilsql (package (inherit psutilsql-bin) (name "psutilsql")))
(define-public mdtsql (package (inherit mdtsql-bin) (name "mdtsql")))
(define-public picguard-pro (package (inherit picguard-pro-bin) (name "picguard-pro")))
(define-public liberica-nik-25-full (package (inherit liberica-nik-25-full-bin) (name "liberica-nik-25-full")))
(define-public picguard (package (inherit picguard-bin) (name "picguard")))
(define-public kyverno-chainsaw (package (inherit kyverno-chainsaw-bin) (name "kyverno-chainsaw")))
(define-public ovcs (package (inherit ovcs-bin) (name "ovcs")))
(define-public btrfs-data-recovery (package (inherit btrfs-data-recovery-git) (name "btrfs-data-recovery")))
(define-public kubepug (package (inherit kubepug-bin) (name "kubepug")))
(define-public kubent (package (inherit kubent-bin) (name "kubent")))
(define-public dyff (package (inherit dyff-bin) (name "dyff")))
(define-public gman (package (inherit gman-bin) (name "gman")))
(define-public scramblery (package (inherit scramblery-bin) (name "scramblery")))
(define-public uni-sync (package (inherit uni-sync-bin) (name "uni-sync")))
(define-public hmcl-pr (package (inherit hmcl-pr-bin) (name "hmcl-pr")))
(define-public hdiffpatch (package (inherit hdiffpatch-bin) (name "hdiffpatch")))
(define-public moon (package (inherit moon-bin) (name "moon")))
(define-public rtl-sdr-librtlsdr (package (inherit rtl-sdr-librtlsdr-git) (name "rtl-sdr-librtlsdr")))

;; --- recipe-resolver-260415d compat aliases ---
(define-public scolorpicker (package (inherit scolorpicker-legacy) (name "scolorpicker")))
(define-public srtodo (package (inherit srtodo-git) (name "srtodo")))
(define-public ntfsprogs-plus (package (inherit ntfsprogs-plus-git) (name "ntfsprogs-plus")))
(define-public btrfs-desktop-notification (package (inherit btrfs-desktop-notification-git) (name "btrfs-desktop-notification")))
(define-public plymouth-theme-mikuboot (package (inherit plymouth-theme-mikuboot-git) (name "plymouth-theme-mikuboot")))

;; --- deptree-resolver-260415c compat aliases ---
(define-public e2-studio (package (inherit e2-studio-bin) (name "e2-studio")))
(define-public alice-ai-app (package (inherit alice-ai-app-bin) (name "alice-ai-app")))
(define-public gv-usb2-driver-dkms (package (inherit gv-usb2-driver-dkms-git) (name "gv-usb2-driver-dkms")))
(define-public mangabox (package (inherit mangabox-bin) (name "mangabox")))
(define-public fafarunner (package (inherit fafarunner-bin) (name "fafarunner")))
(define-public vitasdk-packages (package (inherit vitasdk-packages-git) (name "vitasdk-packages")))
(define-public pmt (package (inherit pmt-git) (name "pmt")))
(define-public samrewritten (package (inherit samrewritten-git) (name "samrewritten")))
(define-public sickrage (package (inherit sickrage-git) (name "sickrage")))
(define-public wayvibes (package (inherit wayvibes-git) (name "wayvibes")))
(define-public winamax (package (inherit winamax-bin) (name "winamax")))
(define-public zeptofetch (package (inherit zeptofetch-git) (name "zeptofetch")))
(define-public archstatus (package (inherit archstatus-git) (name "archstatus")))
(define-public aur-auto-vote (package (inherit aur-auto-vote-git) (name "aur-auto-vote")))
(define-public baidunetdisk (package (inherit baidunetdisk-bin) (name "baidunetdisk")))
(define-public basedpyright (package (inherit basedpyright-git) (name "basedpyright")))
(define-public binfetch (package (inherit binfetch-git) (name "binfetch")))
(define-public brave-beta (package (inherit brave-beta-bin) (name "brave-beta")))
(define-public cat-browser (package (inherit cat-browser-git) (name "cat-browser")))
(define-public catnap (package (inherit catnap-git) (name "catnap")))
(define-public dms-shell (package (inherit dms-shell-git) (name "dms-shell")))
(define-public dnspyex-wine (package (inherit dnspyex-wine-bin) (name "dnspyex-wine")))
(define-public dumber-browser (package (inherit dumber-browser-git) (name "dumber-browser")))

;; --- recipe-resolver-260415f compat aliases ---
(define-public pantheon-dock-git (package (inherit pantheon-dock) (name "pantheon-dock-git")))

;; --- recipe-resolver-260415g compat aliases ---
(define-public krokiet (package (inherit krokiet-bin) (name "krokiet")))
(define-public orca-slicer (package (inherit orca-slicer-bin) (name "orca-slicer")))
(define-public dxvk-mingw (package (inherit dxvk-bin) (name "dxvk-mingw")))
(define-public vicinae (package (inherit vicinae-bin) (name "vicinae")))
(define-public spacefm (package (inherit spacefm-thermitegod) (name "spacefm")))

;; --- deptree-resolver-260415h compat aliases ---
(define-public sickrage (package (inherit sickrage-git) (name "sickrage")))
(define-public dms-shell (package (inherit dms-shell-git) (name "dms-shell")))
(define-public dnspyex-wine (package (inherit dnspyex-wine-bin) (name "dnspyex-wine")))
(define-public gnome-shell-extension-pano (package (inherit gnome-shell-extension-pano-git) (name "gnome-shell-extension-pano")))
(define-public lib32-python311 (package (inherit lib32-python311-bin) (name "lib32-python311")))
(define-public obsidianospm (package (inherit obsidianospm-git) (name "obsidianospm")))
(define-public onedrivegui (package (inherit onedrivegui-git) (name "onedrivegui")))
(define-public openrgb-plugin-effects (package (inherit openrgb-plugin-effects-git) (name "openrgb-plugin-effects")))
(define-public osuboot (package (inherit osuboot-git) (name "osuboot")))
(define-public pear-desktop (package (inherit pear-desktop-git) (name "pear-desktop")))
(define-public rime-frost (package (inherit rime-frost-git) (name "rime-frost")))
(define-public rmpc-auto-theme (package (inherit rmpc-auto-theme-git) (name "rmpc-auto-theme")))
(define-public rofi-polkit-agent (package (inherit rofi-polkit-agent-git) (name "rofi-polkit-agent")))
(define-public rtl8852au-dkms (package (inherit rtl8852au-dkms-git) (name "rtl8852au-dkms")))
(define-public scrollmpris (package (inherit scrollmpris-git) (name "scrollmpris")))
(define-public sonusmix (package (inherit sonusmix-git) (name "sonusmix")))
(define-public soteria (package (inherit soteria-git) (name "soteria")))
(define-public spacebar (package (inherit spacebar-git) (name "spacebar")))
(define-public spotatui (package (inherit spotatui-git) (name "spotatui")))
(define-public thcrap-steam-proton-wrapper (package (inherit thcrap-steam-proton-wrapper-git) (name "thcrap-steam-proton-wrapper")))
(define-public udev-browse (package (inherit udev-browse-git) (name "udev-browse")))
(define-public unreal-tournament (package (inherit unreal-tournament-bin) (name "unreal-tournament")))
(define-public waydroid-launcher (package (inherit waydroid-launcher-git) (name "waydroid-launcher")))
(define-public wiznoteplus (package (inherit wiznoteplus-bin) (name "wiznoteplus")))
(define-public xavs2 (package (inherit xavs2-git) (name "xavs2")))
(define-public youtube-chat-rs (package (inherit youtube-chat-rs-git) (name "youtube-chat-rs")))

;; --- recipe-resolver-260415h compat aliases ---
(define-public proto (package (inherit proto-bin) (name "proto")))
(define-public qbittorrent-enhanced-nox (package (inherit qbittorrent-enhanced-nox-bin) (name "qbittorrent-enhanced-nox")))
(define-public yacreader-poppler (package (inherit yacreader) (name "yacreader-poppler")))
(define-public glaxnimate-git (package (inherit glaxnimate) (name "glaxnimate-git")))

;; --- recipe-resolver-260415i compat aliases ---

(define-public grayjay-bin
  (package
    (inherit grayjay)
    (name "grayjay-bin")))






(define-public webkit2gtk
  (package
    (inherit webkitgtk)
    (name "webkit2gtk")))

(define-public webkit2gtk-docs
  (package
    (inherit webkitgtk)
    (name "webkit2gtk-docs")))

(define-public qt5-sensors
  (package
    (inherit qtsensors)
    (name "qt5-sensors")))

;; --- deptree-resolver-260415i compat aliases ---
(define-public dotnet-targeting-pack-8-0 (package (inherit dotnet-targeting-pack-8-0-bin) (name "dotnet-targeting-pack-8-0")))
(define-public dotnet-runtime-8-0 (package (inherit dotnet-runtime-8-0-bin) (name "dotnet-runtime-8-0")))
(define-public vim-classic-runtime (package (inherit vim-classic-runtime-git) (name "vim-classic-runtime")))
(define-public beaver-notes (package (inherit beaver-notes-bin) (name "beaver-notes")))
(define-public crunchycleaner (package (inherit crunchycleaner-bin) (name "crunchycleaner")))
(define-public gram (package (inherit gram-bin) (name "gram")))
(define-public illogical-impulse-bibata-modern-classic (package (inherit illogical-impulse-bibata-modern-classic-bin) (name "illogical-impulse-bibata-modern-classic")))
(define-public nitro (package (inherit nitro-bin) (name "nitro")))
(define-public smap (package (inherit smap-bin) (name "smap")))
(define-public virtualhere-server (package (inherit virtualhere-server-bin) (name "virtualhere-server")))
(define-public lean-ctx (package (inherit lean-ctx-bin) (name "lean-ctx")))
(define-public znote (package (inherit znote-bin) (name "znote")))
(define-public ddrescueview (package (inherit ddrescueview-bin) (name "ddrescueview")))
(define-public arctic-comfyui-helper (package (inherit arctic-comfyui-helper-bin) (name "arctic-comfyui-helper")))
(define-public electron25 (package (inherit electron25-bin) (name "electron25")))
(define-public implay (package (inherit implay-bin) (name "implay")))
(define-public piebald (package (inherit piebald-bin) (name "piebald")))
(define-public insomnia (package (inherit insomnia-bin) (name "insomnia")))
(define-public proton-meet (package (inherit proton-meet-bin) (name "proton-meet")))
(define-public spflashtool (package (inherit spflashtool-bin) (name "spflashtool")))
(define-public anytype-electron (package (inherit anytype-electron-bin) (name "anytype-electron")))
(define-public brave-origin-nightly (package (inherit brave-origin-nightly-bin) (name "brave-origin-nightly")))
(define-public lib32-python311 (package (inherit lib32-python311-bin) (name "lib32-python311")))
(define-public todesk (package (inherit todesk-bin) (name "todesk")))
(define-public unreal-tournament (package (inherit unreal-tournament-bin) (name "unreal-tournament")))
(define-public wgtunnel (package (inherit wgtunnel-bin) (name "wgtunnel")))
(define-public aggregate6 (package (inherit aggregate6-git) (name "aggregate6")))
(define-public astraeditor (package (inherit astraeditor-bin) (name "astraeditor")))
(define-public astral (package (inherit astral-bin) (name "astral")))
(define-public buildcache (package (inherit buildcache-git) (name "buildcache")))
(define-public bzmenu (package (inherit bzmenu-git) (name "bzmenu")))
(define-public chromium-snapshot (package (inherit chromium-snapshot-bin) (name "chromium-snapshot")))
(define-public classicube (package (inherit classicube-bin) (name "classicube")))
(define-public deadbeef-plugin-gui-qt6 (package (inherit deadbeef-plugin-gui-qt6-git) (name "deadbeef-plugin-gui-qt6")))
(define-public dooble (package (inherit dooble-git) (name "dooble")))
(define-public fahcontrol-gtk3 (package (inherit fahcontrol-gtk3-git) (name "fahcontrol-gtk3")))
(define-public firefox-nightly (package (inherit firefox-nightly-bin) (name "firefox-nightly")))
(define-public gopeed (package (inherit gopeed-bin) (name "gopeed")))
(define-public grumpy-irc (package (inherit grumpy-irc-git) (name "grumpy-irc")))
(define-public hyprsysteminfo (package (inherit hyprsysteminfo-git) (name "hyprsysteminfo")))
(define-public ibus-lotus (package (inherit ibus-lotus-git) (name "ibus-lotus")))
(define-public ironclad-rivet (package (inherit ironclad-rivet-bin) (name "ironclad-rivet")))
(define-public java-openjfx (package (inherit java-openjfx-bin) (name "java-openjfx")))
(define-public jbig2enc (package (inherit jbig2enc-git) (name "jbig2enc")))
(define-public krunner-spotify-enhanced (package (inherit krunner-spotify-enhanced-git) (name "krunner-spotify-enhanced")))
(define-public lektra (package (inherit lektra-git) (name "lektra")))

;; --- deptree-resolver-260415j compat aliases ---
(define-public aspnet-runtime-8-0 (package (inherit aspnet-runtime-8-0-bin) (name "aspnet-runtime-8-0")))
(define-public aspnet-targeting-pack-8-0 (package (inherit aspnet-targeting-pack-8-0-bin) (name "aspnet-targeting-pack-8-0")))
(define-public dotnet-sdk-8-0 (package (inherit dotnet-sdk-8-0-bin) (name "dotnet-sdk-8-0")))
(define-public ncgopher (package (inherit ncgopher-git) (name "ncgopher")))
(define-public neovim-qt (package (inherit neovim-qt-git) (name "neovim-qt")))
(define-public odin (package (inherit odin-git) (name "odin")))
(define-public opentabletdriver (package (inherit opentabletdriver-git) (name "opentabletdriver")))
(define-public oxicord (package (inherit oxicord-git) (name "oxicord")))
(define-public pam-python (package (inherit pam-python-git) (name "pam-python")))
(define-public pane-fm (package (inherit pane-fm-git) (name "pane-fm")))
(define-public phonon-qt6-mpv (package (inherit phonon-qt6-mpv-git) (name "phonon-qt6-mpv")))
(define-public pixelterm-c (package (inherit pixelterm-c-bin) (name "pixelterm-c")))
(define-public plasma6-wallpapers-smart-video-wallpaper-reborn (package (inherit plasma6-wallpapers-smart-video-wallpaper-reborn-git) (name "plasma6-wallpapers-smart-video-wallpaper-reborn")))
(define-public projectm-presets-classic (package (inherit projectm-presets-classic-git) (name "projectm-presets-classic")))
(define-public pulsecontrol (package (inherit pulsecontrol-git) (name "pulsecontrol")))
(define-public purple-gowhatsapp (package (inherit purple-gowhatsapp-git) (name "purple-gowhatsapp")))
(define-public pwmenu (package (inherit pwmenu-git) (name "pwmenu")))
(define-public python-wassima (package (inherit python-wassima-git) (name "python-wassima")))
(define-public quirc (package (inherit quirc-git) (name "quirc")))
(define-public ryujinx (package (inherit ryujinx-git) (name "ryujinx")))
(define-public scuisei (package (inherit scuisei-git) (name "scuisei")))
(define-public sdrpp-tetra-demodulator (package (inherit sdrpp-tetra-demodulator-git) (name "sdrpp-tetra-demodulator")))
(define-public speedynote (package (inherit speedynote-bin) (name "speedynote")))
(define-public steamfetch (package (inherit steamfetch-git) (name "steamfetch")))
(define-public supermario64-sm64ex (package (inherit supermario64-sm64ex-git) (name "supermario64-sm64ex")))
(define-public swaystatus (package (inherit swaystatus-git) (name "swaystatus")))
(define-public sysd-manager (package (inherit sysd-manager-git) (name "sysd-manager")))
(define-public terabox (package (inherit terabox-bin) (name "terabox")))
(define-public thorium-reader (package (inherit thorium-reader-bin) (name "thorium-reader")))
(define-public tidal-hifi (package (inherit tidal-hifi-git) (name "tidal-hifi")))


;; deptree-resolver-260415k compat aliases
(define-public airvpn-suite (package (inherit airvpn-suite-bin) (name "airvpn-suite")))
(define-public altserver-linux (package (inherit altserver-linux-bin) (name "altserver-linux")))
(define-public attempt (package (inherit attempt-git) (name "attempt")))
(define-public backhand (package (inherit backhand-bin) (name "backhand")))
(define-public bitcoin-cli (package (inherit bitcoin-cli-bin) (name "bitcoin-cli")))
(define-public bitcoin-daemon (package (inherit bitcoin-daemon-bin) (name "bitcoin-daemon")))
(define-public bitcoin-qt (package (inherit bitcoin-qt-bin) (name "bitcoin-qt")))
(define-public bitcoin-tx (package (inherit bitcoin-tx-bin) (name "bitcoin-tx")))
(define-public bitcoin-util (package (inherit bitcoin-util-bin) (name "bitcoin-util")))
(define-public bitcoin-wallet (package (inherit bitcoin-wallet-bin) (name "bitcoin-wallet")))
(define-public ccline (package (inherit ccline-bin) (name "ccline")))
(define-public chadtop (package (inherit chadtop-bin) (name "chadtop")))
(define-public chamber (package (inherit chamber-bin) (name "chamber")))
(define-public cruise (package (inherit cruise-bin) (name "cruise")))
(define-public datacmd (package (inherit datacmd-bin) (name "datacmd")))
(define-public dave-gnukem (package (inherit dave-gnukem-git) (name "dave-gnukem")))
(define-public dtop (package (inherit dtop-bin) (name "dtop")))
(define-public elevate (package (inherit elevate-git) (name "elevate")))
(define-public envx (package (inherit envx-bin) (name "envx")))
(define-public fauxdacious (package (inherit fauxdacious-git) (name "fauxdacious")))
(define-public fjira (package (inherit fjira-bin) (name "fjira")))
(define-public foot-terminfo (package (inherit foot-terminfo-git) (name "foot-terminfo")))
(define-public fzfs (package (inherit fzfs-git) (name "fzfs")))
(define-public ghost-dl (package (inherit ghost-dl-bin) (name "ghost-dl")))
(define-public ghost-dl (package (inherit ghost-dl-git) (name "ghost-dl")))
(define-public go-dsp-guitar (package (inherit go-dsp-guitar-bin) (name "go-dsp-guitar")))
(define-public gospider (package (inherit gospider-bin) (name "gospider")))
(define-public gtl (package (inherit gtl-bin) (name "gtl")))
(define-public hell (package (inherit hell-bin) (name "hell")))
(define-public hostapd-mana (package (inherit hostapd-mana-git) (name "hostapd-mana")))
(define-public jugglinglab (package (inherit jugglinglab-git) (name "jugglinglab")))
(define-public justdd (package (inherit justdd-bin) (name "justdd")))
(define-public krunner-steam (package (inherit krunner-steam-git) (name "krunner-steam")))
(define-public libobsidianos-overlays (package (inherit libobsidianos-overlays-git) (name "libobsidianos-overlays")))
(define-public logu (package (inherit logu-bin) (name "logu")))
(define-public nowaymouse (package (inherit nowaymouse-git) (name "nowaymouse")))
(define-public pycmd (package (inherit pycmd-bin) (name "pycmd")))
(define-public python-tree-sitter-languages (package (inherit python-tree-sitter-languages-bin) (name "python-tree-sitter-languages")))
(define-public refind-theme-refind2k (package (inherit refind-theme-refind2k-git) (name "refind-theme-refind2k")))
(define-public rofi-blocks (package (inherit rofi-blocks-git) (name "rofi-blocks")))
(define-public tageditor (package (inherit tageditor-bin) (name "tageditor")))
(define-public tape (package (inherit tape-bin) (name "tape")))
(define-public tash (package (inherit tash-bin) (name "tash")))
(define-public theattyr (package (inherit theattyr-bin) (name "theattyr")))
(define-public traefiktop (package (inherit traefiktop-bin) (name "traefiktop")))
(define-public victorialogs (package (inherit victorialogs-bin) (name "victorialogs")))
(define-public visualvault (package (inherit visualvault-bin) (name "visualvault")))
(define-public wolvenkit-cli (package (inherit wolvenkit-cli-bin) (name "wolvenkit-cli")))
(define-public zerus (package (inherit zerus-bin) (name "zerus")))

;; deptree-resolver-260415l compat aliases
(define-public bar-lobby (package (inherit bar-lobby-git) (name "bar-lobby")))
(define-public cqrlog (package (inherit cqrlog-git) (name "cqrlog")))
(define-public cupola (package (inherit cupola-git) (name "cupola")))
(define-public dotnet-sdk-preview (package (inherit dotnet-sdk-preview-bin) (name "dotnet-sdk-preview")))
(define-public duckstation-preview-latest (package (inherit duckstation-preview-latest-bin) (name "duckstation-preview-latest")))
(define-public efibooteditor (package (inherit efibooteditor-bin) (name "efibooteditor")))
(define-public fcitx5-im-emoji-picker (package (inherit fcitx5-im-emoji-picker-git) (name "fcitx5-im-emoji-picker")))
(define-public gd-tools (package (inherit gd-tools-git) (name "gd-tools")))
(define-public glide-browser (package (inherit glide-browser-bin) (name "glide-browser")))
(define-public hyprquickframe (package (inherit hyprquickframe-git) (name "hyprquickframe")))
(define-public ibus-im-emoji-picker (package (inherit ibus-im-emoji-picker-git) (name "ibus-im-emoji-picker")))
(define-public tlescope (package (inherit tlescope-git) (name "tlescope")))
(define-public tlp-pd (package (inherit tlp-pd-git) (name "tlp-pd")))
(define-public tosu (package (inherit tosu-git) (name "tosu")))
(define-public uswsusp (package (inherit uswsusp-git) (name "uswsusp")))
(define-public vesktop (package (inherit vesktop-git) (name "vesktop")))
(define-public warp-terminal (package (inherit warp-terminal-bin) (name "warp-terminal")))
(define-public wpscan (package (inherit wpscan-git) (name "wpscan")))
(define-public xunlei (package (inherit xunlei-bin) (name "xunlei")))

;; --- recipe-resolver-260415l compat aliases ---
(define-public aaaaxy (package (inherit aaaaxy-bin) (name "aaaaxy")))

;; --- recipe-resolver-260415m compat aliases ---
(define-public vim-classic-git (package (inherit vim-classic) (name "vim-classic-git")))
(define-public gvim-classic-git (package (inherit gvim-classic) (name "gvim-classic-git")))
(define-public viu-media-git (package (inherit viu-media) (name "viu-media-git")))

;; --- recipe-resolver-260415n compat aliases ---
(define-public rustconn (package (inherit rustconn-bin) (name "rustconn")))
(define-public uzdoom (package (inherit uzdoom-bin) (name "uzdoom")))
(define-public polymc-qt5-git (package (inherit polymc-bin) (name "polymc-qt5-git")))
(define-public polymc (package (inherit polymc-bin) (name "polymc")))
(define-public slippi-mainline (package (inherit slippi-mainline-bin) (name "slippi-mainline")))
(define-public libretro-azahar-git (package (inherit libretro-azahar-core-bin) (name "libretro-azahar-git")))
(define-public libretro-azahar (package (inherit libretro-azahar-core-bin) (name "libretro-azahar")))
