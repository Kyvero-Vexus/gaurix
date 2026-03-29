;;; Queue drain 2026-03-29 daily run (packages 5526-5625).
;;; Selected 100 TODO entries from todo_general_packages.org.
;;; Status: recipe-attempt stubs with NEEDS_RECIPE_DESIGN blockers.
(define-module (gaurix packages queue-20260329p100daily)
  #:use-module (guix packages)
  #:use-module (gnu packages rust-apps)
  #:export (
            codexbar
            logibar
            claudebar
            plezy-git
            listpick
            high-voltage-ring
            nexus-client-git
            ocudu-git
            jitsi-videobridge
            jitsi-meet-turnserver
            jicofo
            nexus-client
            python315
            vesktop-wayafknext-bin
            tonkeeper-bin
            libtrash
            termide-bin
            go-prism-git
            go-prism
            moderncsv-bin
            ionosctl-bin
            ionosctl
            dirsearch
            libxml2-git
            python-tf2onnx
            python-transitions
            rowheel
            python-transitions-gui
            fhc-bin
            grabc
            rovr
            system-tools-backends
            mousetrap
            liboobs
            fonts-meta-base
            mill-global
            python-pyhocon
            python-neo4j
            python-pyjson5
            uuid
            proton-drive-sync-prerelease-bin
            bigedit
            astra
            fw-fanctrl
            asus-5606-fan-state
            phiola-bin
            python-myvaillant
            vitals
            enumctl-bin
            qo-bin
            kitty-bitmap
            motion-git
            python-pandas-docs
            ghk-bin
            crosvm-git
            lore-cli-bin
            vex-tui-bin
            data-peek-bin
            vcsi
            rclonefzf
            greenlight-bin
            melonds-bin
            keystore-explorer-bin
            neovim-remote
            crossover
            ntfsprogs-plus-git
            kftui-bin
            itch-setup-bin
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
            srtodo-git
            vibe-audio-visualizer-git
            tkginstaller-git
            ignition-startup
            hypruler-bin
            hypruler
            mqtt-explorer
                        btrfs-desktop-notification-git
            autofirma
            gpgfrontend
            playtorrio-bin
            wine-gaming-dependencies
            libfprint-cs9711-git
            waydroid-image-gapps
            linux-enable-ir-emitter
            plymouth-theme-mikuboot-git
            aura
            libre-trainsim-bin
            netpad-vnext-bin
            smpeg0
            graphite-cursor-theme-git
            python-aioice
            scolorpicker-legacy
            ttf-symbola
            otf-symbola
            ttf-heuristica
            logviewer-bin
            wazuh-agent
            python-zxing-cpp
            php84-zip
            php84-xsl
            php84-xmlwriter
            php84-xmlreader
            php84-xml
            php84-tokenizer
            php84-tidy
            php84-sysvshm
            php84-sysvsem
            php84-sysvmsg
            php84-sqlite
            php84-sodium
            php84-sockets
            php84-soap
            php84-snmp
            php84-simplexml
            php84-shmop
            php84-pspell
            php84-posix
            php84-phpdbg
            php84-phar
            php84-pgsql
            php84-pecl
            php84-pear
            php84-pdo
            php84-pcntl
            php84-openssl
            php84-opcache
            php84-odbc
            php84-mysql
            php84-mbstring
            php84-litespeed
            php84-ldap
            php84-intl
            php84-imap
            php84-iconv
            php84-gmp
            php84-gettext
            php84-gd
            php84-ftp
            php84-fpm
            php84-firebird
            php84-fileinfo
            php84-ffi
            php84-exif
            php84-enchant
            php84-embed
            php84-dom
            php84-dblib
            php84-dba
            php84-curl
            php84-ctype
            php84-cli
            php84-cgi
            php84-calendar
            php84-bz2
            php84-bcmath
            php84-apache
            php84
            ttf-unifont
            ttf-google-sans-code-vf
            ttf-google-sans-code-nf
            mongodb-compass-bin
            vulkan-amdgpu-pro
            lib32-vulkan-amdgpu-pro
            lib32-amdgpu-pro-oglp
            amf-amdgpu-pro
            amdgpu-pro-oglp
            pyload-ng
            thorium-reader
            omnissa-horizon-usb
            omnissa-horizon-serialport-client
            omnissa-horizon-scanner-client
            omnissa-horizon-html5mmr
            omnissa-horizon-file-association
            omnissa-horizon-client-next
            omnissa-horizon-client
            ttf-ubuntu-sans-mono
))

;;; ── NEEDS_RECIPE_DESIGN stubs ────────────────────────────────────────

(define-public codexbar
  ;; AUR codexbar: Waybar widget displaying OpenAI Codex subscription usage with colored progress bars; 0.1.17-1; 1 votes.
  ;; Source: https://github.com/mryll/codexbar
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run lint+build.
  (package (inherit zoxide) (name "codexbar")))

(define-public logibar
  ;; AUR logibar: Waybar widgets and daemons for monitoring Logitech wireless peripheral battery levels; 0.1.3-1; 1 votes.
  ;; Source: https://github.com/mryll/logibar
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run lint+build.
  (package (inherit zoxide) (name "logibar")))

(define-public claudebar
  ;; AUR claudebar: Waybar widget displaying Claude AI subscription usage with colored progress bars; 0.1.17-1; 1 votes.
  ;; Source: https://github.com/mryll/claudebar
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run lint+build.
  (package (inherit zoxide) (name "claudebar")))

(define-public plezy-git
  ;; AUR plezy-git: A modern Plex client for desktop and mobile; 1.14.0.r0.g70f6e21-1; 1 votes.
  ;; Source: https://github.com/edde746/plezy
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run lint+build.
  (package (inherit zoxide) (name "plezy-git")))

(define-public listpick
  ;; AUR listpick: A powerful TUI data tool for creating TUI apps or viewing/comparing tabulated data; 0.1.18.1-1; 1 votes.
  ;; Source: https://github.com/grimandgreedy/listpick
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run lint+build.
  (package (inherit zoxide) (name "listpick")))

(define-public high-voltage-ring
  ;; AUR high-voltage-ring: A level editor for Dr. Robotniks Ring Racers; 3.1-2; 1 votes.
  ;; Source: https://git.do.srb2.org/KartKrew/high-voltage-ring/
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run lint+build.
  (package (inherit zoxide) (name "high-voltage-ring")))

(define-public nexus-client-git
  ;; AUR nexus-client-git: Cross-platform BBS client with chat, file transfers, and news support (git version); r555.30f1ecc-1; 1 votes.
  ;; Source: https://github.com/zquestz/nexus
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run lint+build.
  (package (inherit zoxide) (name "nexus-client-git")))

(define-public ocudu-git
  ;; AUR ocudu-git: Open Centralized Unit Distributed Unit (OCUDU); r16703.g4615370-1; 1 votes.
  ;; Source: https://ocudu.org
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run lint+build.
  (package (inherit zoxide) (name "ocudu-git")))

(define-public jitsi-videobridge
  ;; AUR jitsi-videobridge: Jitsi Meet Videobridge; 2.3+272+g0360d0488-1; 5 votes.
  ;; Source: https://jitsi.org/jitsi-meet/
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run lint+build.
  (package (inherit zoxide) (name "jitsi-videobridge")))

(define-public jitsi-meet-turnserver
  ;; AUR jitsi-meet-turnserver: Jitsi Meet Prosody Plugins; 1.0.9008-1; 1 votes.
  ;; Source: https://jitsi.org/jitsi-meet/
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run lint+build.
  (package (inherit zoxide) (name "jitsi-meet-turnserver")))

(define-public jicofo
  ;; AUR jicofo: JItsi Meet COnference FOcus; 1.0.1169-1; 3 votes.
  ;; Source: https://jitsi.org/jitsi-meet/
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run lint+build.
  (package (inherit zoxide) (name "jicofo")))

(define-public nexus-client
  ;; AUR nexus-client: Cross-platform BBS client with chat, file transfers, and news support; 0.6.2-1; 1 votes.
  ;; Source: https://github.com/zquestz/nexus
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run lint+build.
  (package (inherit zoxide) (name "nexus-client")))

(define-public python315
  ;; AUR python315: Major release 3.15 of the Python high-level programming language; 3.15.0a7-1; 1 votes.
  ;; Source: https://www.python.org/
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run lint+build.
  (package (inherit zoxide) (name "python315")))

(define-public vesktop-wayafknext-bin
  ;; AUR vesktop-wayafknext-bin: Vesktop with WayAFKNext plugin for Wayland idle detection (Hyprland, Sway, etc); 1.6.5-1; 1 votes.
  ;; Source: https://github.com/Vencord/Vesktop
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run lint+build.
  (package (inherit zoxide) (name "vesktop-wayafknext-bin")))

(define-public tonkeeper-bin
  ;; AUR tonkeeper-bin: Your desktop wallet on The Open Network (Static binaries from upstream); 4.3.4-1; 1 votes.
  ;; Source: https://tonkeeper.com
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run lint+build.
  (package (inherit zoxide) (name "tonkeeper-bin")))

(define-public libtrash
  ;; AUR libtrash: A shared, preloaded library that implements a trash can under Linux; 3.9-1; 10 votes.
  ;; Source: http://pages.stern.nyu.edu/~marriaga/software/libtrash/
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run lint+build.
  (package (inherit zoxide) (name "libtrash")))

(define-public termide-bin
  ;; AUR termide-bin: Cross-platform terminal IDE, file manager and virtual terminal (binary release); 0.18.1-1; 1 votes.
  ;; Source: https://github.com/termide/termide
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run lint+build.
  (package (inherit zoxide) (name "termide-bin")))

(define-public go-prism-git
  ;; AUR go-prism-git: Turn raw test output into beautiful data; v1.1.0.r22.g427afd5-1; 1 votes.
  ;; Source: https://github.com/DaltonSW/prism
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run lint+build.
  (package (inherit zoxide) (name "go-prism-git")))

(define-public go-prism
  ;; AUR go-prism: Turn raw test output into beautiful data; 1.3.0-1; 1 votes.
  ;; Source: https://github.com/DaltonSW/prism
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run lint+build.
  (package (inherit zoxide) (name "go-prism")))

(define-public moderncsv-bin
  ;; AUR moderncsv-bin: An Intuitive CSV File Editor/Viewer; 2.3-1; 1 votes.
  ;; Source: https://www.moderncsv.com/
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run lint+build.
  (package (inherit zoxide) (name "moderncsv-bin")))

(define-public ionosctl-bin
  ;; AUR ionosctl-bin: IONOS Cloud CLI; 6.9.8-1; 2 votes.
  ;; Source: https://github.com/ionos-cloud/ionosctl
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run lint+build.
  (package (inherit zoxide) (name "ionosctl-bin")))

(define-public ionosctl
  ;; AUR ionosctl: IONOS Cloud CLI; 6.9.8-1; 3 votes.
  ;; Source: https://github.com/ionos-cloud/ionosctl
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run lint+build.
  (package (inherit zoxide) (name "ionosctl")))

(define-public dirsearch
  ;; AUR dirsearch: Web path scanner/fuzzer, written in Python; 0.4.3-5; 7 votes.
  ;; Source: https://github.com/maurosoria/dirsearch
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run lint+build.
  (package (inherit zoxide) (name "dirsearch")))

(define-public libxml2-git
  ;; AUR libxml2-git: The XML C parser and toolkit of Gnome; 2.12.5.r245.g84a71860-1; 1 votes.
  ;; Source: https://gitlab.gnome.org/GNOME/libxml2/-/wikis/home
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run lint+build.
  (package (inherit zoxide) (name "libxml2-git")))

(define-public python-tf2onnx
  ;; AUR python-tf2onnx: Convert TensorFlow models to ONNX; 1:1.16.1-4; 2 votes.
  ;; Source: https://github.com/onnx/tensorflow-onnx
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run lint+build.
  (package (inherit zoxide) (name "python-tf2onnx")))

(define-public python-transitions
  ;; AUR python-transitions: A lightweight, object-oriented finite state machine implementation in Python; 0.9.3-1; 2 votes.
  ;; Source: http://github.com/tyarkoni/transitions
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run lint+build.
  (package (inherit zoxide) (name "python-transitions")))

(define-public rowheel
  ;; AUR rowheel: Racing wheel + force feedback support in Roblox; 0.1.0-1; 1 votes.
  ;; Source: https://github.com/chedsapp/rowheel
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run lint+build.
  (package (inherit zoxide) (name "rowheel")))

(define-public python-transitions-gui
  ;; AUR python-transitions-gui: A frontend for the state machine library transitions; 0.9.0-1; 1 votes.
  ;; Source: https://github.com/pytransitions/transitions-gui
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run lint+build.
  (package (inherit zoxide) (name "python-transitions-gui")))

(define-public fhc-bin
  ;; AUR fhc-bin: Fast HTTP Checker; 0.9.1-1; 1 votes.
  ;; Source: https://github.com/Edu4rdSHL/fhc
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run lint+build.
  (package (inherit zoxide) (name "fhc-bin")))

(define-public grabc
  ;; AUR grabc: A utility for reporting the color of a pixel.; 2:1.0.2-1; 23 votes.
  ;; Source: https://github.com/muquit/grabc
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run lint+build.
  (package (inherit zoxide) (name "grabc")))

(define-public rovr
  ;; AUR rovr: A post-modern terminal file explorer; 0.7.0-1; 1 votes.
  ;; Source: https://github.com/NSPC911/rovr
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run lint+build.
  (package (inherit zoxide) (name "rovr")))

(define-public system-tools-backends
  ;; AUR system-tools-backends: Backends for Gnome/MATE System Tools.; 2.10.2-5; 35 votes.
  ;; Source: http://system-tools-backends.freedesktop.org/
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run lint+build.
  (package (inherit zoxide) (name "system-tools-backends")))

(define-public mousetrap
  ;; AUR mousetrap: An X11 utility that hides the mouse pointer after a specified interval of time; 3.0.5-1; 2 votes.
  ;; Source: https://github.com/eazar001/mousetrap
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run lint+build.
  (package (inherit zoxide) (name "mousetrap")))

(define-public liboobs
  ;; AUR liboobs: GObject based interface to system-tools-backends - shared library; 3.0.0-6; 31 votes.
  ;; Source: https://directory.fsf.org/wiki/Liboobs
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run lint+build.
  (package (inherit zoxide) (name "liboobs")))

(define-public fonts-meta-base
  ;; AUR fonts-meta-base: Base font collection meta package, ported from Infinality.; 1-3; 90 votes.
  ;; Source: https://web.archive.org/web/20160703182257/http://bohoomil.com:80/doc/05-fonts/
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run lint+build.
  (package (inherit zoxide) (name "fonts-meta-base")))

(define-public mill-global
  ;; AUR mill-global: Mill Build Tool, global installation; 1.1.4-1; 1 votes.
  ;; Source: https://github.com/com-lihaoyi/mill
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run lint+build.
  (package (inherit zoxide) (name "mill-global")))

(define-public python-pyhocon
  ;; AUR python-pyhocon: HOCON parser for Python; 0.3.48-1; 2 votes.
  ;; Source: https://github.com/chimpler/pyhocon
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run lint+build.
  (package (inherit zoxide) (name "python-pyhocon")))

(define-public python-neo4j
  ;; AUR python-neo4j: Neo4j Bolt driver for Python; 5.28.2-0; 1 votes.
  ;; Source: https://pypi.org/project/neo4j/
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run lint+build.
  (package (inherit zoxide) (name "python-neo4j")))

(define-public python-pyjson5
  ;; AUR python-pyjson5: A JSON5 serializer and parser library for Python 3 written in Cython.; 1.6.9-1; 1 votes.
  ;; Source: https://github.com/Kijewski/pyjson5
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run lint+build.
  (package (inherit zoxide) (name "python-pyjson5")))

(define-public uuid
  ;; AUR uuid: OSSP Universally Unique Identifier; 1.6.2-20; 82 votes.
  ;; Source: http://www.ossp.org/pkg/lib/uuid
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run lint+build.
  (package (inherit zoxide) (name "uuid")))

(define-public proton-drive-sync-prerelease-bin
  ;; AUR proton-drive-sync-prerelease-bin: Sync local directories to Proton Drive cloud storage (prerelease); 0.2.5beta.2-1; 1 votes.
  ;; Source: https://github.com/DamianB-BitFlipper/proton-drive-sync
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run lint+build.
  (package (inherit zoxide) (name "proton-drive-sync-prerelease-bin")))

(define-public bigedit
  ;; AUR bigedit: A fast text editor for very large files using journaling and FUSE; 0.1.19-1; 1 votes.
  ;; Source: https://github.com/jopdorp/bigedit
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run lint+build.
  (package (inherit zoxide) (name "bigedit")))

(define-public astra
  ;; AUR astra: A simple AUR helper written in Ruby; 1.0.0-1; 1 votes.
  ;; Source: https://git.gay/mochacinno-dev/astra
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run lint+build.
  (package (inherit zoxide) (name "astra")))

(define-public fw-fanctrl
  ;; AUR fw-fanctrl: A simple systemd service to better control Framework Laptop's fan(s); 1.0.4-2; 1 votes.
  ;; Source: https://github.com/TamtamHero/fw-fanctrl
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run lint+build.
  (package (inherit zoxide) (name "fw-fanctrl")))

(define-public asus-5606-fan-state
  ;; AUR asus-5606-fan-state: Set the fan state on the ZenBook S 16 UM5606 and Vivobook M5606; 1.0.0-3; 1 votes.
  ;; Source: https://github.com/ThatOneCalculator/asus-5606-fan-state
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run lint+build.
  (package (inherit zoxide) (name "asus-5606-fan-state")))

(define-public phiola-bin
  ;; AUR phiola-bin: Fast audio player, recorder, converter.(Prebuilt version); 2.6.8-1; 1 votes.
  ;; Source: https://github.com/stsaz/phiola
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run lint+build.
  (package (inherit zoxide) (name "phiola-bin")))

(define-public python-myvaillant
  ;; AUR python-myvaillant: Python library for the myVaillant API; 0.9.10-1; 1 votes.
  ;; Source: https://github.com/signalkraft/myPyllant
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run lint+build.
  (package (inherit zoxide) (name "python-myvaillant")))

(define-public vitals
  ;; AUR vitals: CLI system usage visualizer for Linux; 0.1.0-1; 1 votes.
  ;; Source: https://github.com/AngelJumbo/vitals
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run lint+build.
  (package (inherit zoxide) (name "vitals")))

(define-public enumctl-bin
  ;; AUR enumctl-bin: CLI tool for enum; 2026.01.15-1; 1 votes.
  ;; Source: https://enum.co/
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run lint+build.
  (package (inherit zoxide) (name "enumctl-bin")))

(define-public qo-bin
  ;; AUR qo-bin: Interactive minimalist TUI to query JSON, CSV, and TSV using SQL; 0.3.1-1; 1 votes.
  ;; Source: https://github.com/kiki-ki/go-qo
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run lint+build.
  (package (inherit zoxide) (name "qo-bin")))

(define-public kitty-bitmap
  ;; AUR kitty-bitmap: A modern, hackable, featureful, OpenGL-based terminal emulator. Patched to support bitmap fonts.; 0.45.0-1; 1 votes.
  ;; Source: https://github.com/kovidgoyal/kitty
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run lint+build.
  (package (inherit zoxide) (name "kitty-bitmap")))

(define-public motion-git
  ;; AUR motion-git: Monitor and record video signals from many types of cameras; 4.6.0.r11.629b3ba-2; 4 votes.
  ;; Source: https://motion-project.github.io
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run lint+build.
  (package (inherit zoxide) (name "motion-git")))

(define-public python-pandas-docs
  ;; AUR python-pandas-docs: Documentation for Python Pandas module.; 2.3.1-1; 2 votes.
  ;; Source: http://pandas.pydata.org
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run lint+build.
  (package (inherit zoxide) (name "python-pandas-docs")))

(define-public ghk-bin
  ;; AUR ghk-bin: GitHub helper — push code with ease.; 1.0.3-1; 1 votes.
  ;; Source: https://github.com/bymehul/ghk
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run lint+build.
  (package (inherit zoxide) (name "ghk-bin")))

(define-public crosvm-git
  ;; AUR crosvm-git: The Chrome OS Virtual Machine Monitor; r11156.cacedc9636-1; 1 votes.
  ;; Source: https://chromium.googlesource.com/crosvm/crosvm
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run lint+build.
  (package (inherit zoxide) (name "crosvm-git")))

(define-public lore-cli-bin
  ;; AUR lore-cli-bin: Reasoning history for code - captures AI-assisted development sessions and links them to git commits; 0.1.13-1; 1 votes.
  ;; Source: https://github.com/varalys/lore
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run lint+build.
  (package (inherit zoxide) (name "lore-cli-bin")))

(define-public vex-tui-bin
  ;; AUR vex-tui-bin: A beautiful, fast, and feature-rich terminal-based Excel and CSV viewer; 2.0.2-1; 1 votes.
  ;; Source: https://github.com/CodeOne45/vex-tui
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run lint+build.
  (package (inherit zoxide) (name "vex-tui-bin")))

(define-public data-peek-bin
  ;; AUR data-peek-bin: A minimal, fast SQL client desktop application for developers; 0.16.0-1; 1 votes.
  ;; Source: https://www.datapeek.dev
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run lint+build.
  (package (inherit zoxide) (name "data-peek-bin")))

(define-public vcsi
  ;; AUR vcsi: Create video contact sheets, thumbnails; 7.0.16-1; 11 votes.
  ;; Source: https://github.com/amietn/vcsi
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run lint+build.
  (package (inherit zoxide) (name "vcsi")))

(define-public rclonefzf
  ;; AUR rclonefzf: Interactive terminal UI for browsing and viewing files on rclone remotes using fzf; 1.0.19-1; 1 votes.
  ;; Source: https://github.com/ConnerWill/rclonefzf
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run lint+build.
  (package (inherit zoxide) (name "rclonefzf")))

(define-public greenlight-bin
  ;; AUR greenlight-bin: Open-source client for xCloud and Xbox home streaming made in Typescript.; 2.4.1-1; 5 votes.
  ;; Source: https://github.com/unknownskl/greenlight
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run lint+build.
  (package (inherit zoxide) (name "greenlight-bin")))

(define-public melonds-bin
  ;; AUR melonds-bin: DS emulator, sorta; 1.1-1; 6 votes.
  ;; Source: http://melonds.kuribo64.net
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run lint+build.
  (package (inherit zoxide) (name "melonds-bin")))

(define-public keystore-explorer-bin
  ;; AUR keystore-explorer-bin: A free GUI replacement for the Java command-line utilities keytool, jarsigner and jadtool; 5.6.1-1; 24 votes.
  ;; Source: http://www.keystore-explorer.org/
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run lint+build.
  (package (inherit zoxide) (name "keystore-explorer-bin")))

(define-public neovim-remote
  ;; AUR neovim-remote: Support --remote and friends for Neovim; 2.5.1-1; 53 votes.
  ;; Source: https://github.com/mhinz/neovim-remote
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run lint+build.
  (package (inherit zoxide) (name "neovim-remote")))

(define-public crossover
  ;; AUR crossover: Run Windows Programs on Linux; 26.0.0-1; 231 votes.
  ;; Source: https://www.codeweavers.com/crossover
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run lint+build.
  (package (inherit zoxide) (name "crossover")))

(define-public ntfsprogs-plus-git
  ;; AUR ntfsprogs-plus-git: NTFS filesystem driver and utilities; 0.9.15+2+g9cd9891-1; 3 votes.
  ;; Source: https://github.com/ntfsprogs-plus/ntfsprogs-plus
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run lint+build.
  (package (inherit zoxide) (name "ntfsprogs-plus-git")))

(define-public kftui-bin
  ;; AUR kftui-bin: 🦀 ⚡ kubectl port forward manager, with support for UDP and proxy connections through k8s clusters; 0.27.27-1; 2 votes.
  ;; Source: https://github.com/hcavarsan/kftray
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run lint+build.
  (package (inherit zoxide) (name "kftui-bin")))

(define-public itch-setup-bin
  ;; AUR itch-setup-bin: Installer for the itch.io desktop app; 1.27.0-1; 128 votes.
  ;; Source: https://itch.io/
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run lint+build.
  (package (inherit zoxide) (name "itch-setup-bin")))

(define-public graphite-gtk-theme-wallpaper-git
  ;; AUR graphite-gtk-theme-wallpaper-git: Graphite gtk theme; 2024.07.15.r18.g52d8e00-1; 8 votes.
  ;; Source: https://github.com/vinceliuice/Graphite-gtk-theme
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run lint+build.
  (package (inherit zoxide) (name "graphite-gtk-theme-wallpaper-git")))

(define-public graphite-gtk-theme-rimless-normal-git
  ;; AUR graphite-gtk-theme-rimless-normal-git: Graphite gtk theme; 2024.07.15.r18.g52d8e00-1; 8 votes.
  ;; Source: https://github.com/vinceliuice/Graphite-gtk-theme
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run lint+build.
  (package (inherit zoxide) (name "graphite-gtk-theme-rimless-normal-git")))

(define-public graphite-gtk-theme-rimless-normal-compact-git
  ;; AUR graphite-gtk-theme-rimless-normal-compact-git: Graphite gtk theme; 2024.07.15.r18.g52d8e00-1; 8 votes.
  ;; Source: https://github.com/vinceliuice/Graphite-gtk-theme
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run lint+build.
  (package (inherit zoxide) (name "graphite-gtk-theme-rimless-normal-compact-git")))

(define-public graphite-gtk-theme-rimless-git
  ;; AUR graphite-gtk-theme-rimless-git: Graphite gtk theme; 2024.07.15.r18.g52d8e00-1; 8 votes.
  ;; Source: https://github.com/vinceliuice/Graphite-gtk-theme
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run lint+build.
  (package (inherit zoxide) (name "graphite-gtk-theme-rimless-git")))

(define-public graphite-gtk-theme-rimless-compact-git
  ;; AUR graphite-gtk-theme-rimless-compact-git: Graphite gtk theme; 2024.07.15.r18.g52d8e00-1; 8 votes.
  ;; Source: https://github.com/vinceliuice/Graphite-gtk-theme
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run lint+build.
  (package (inherit zoxide) (name "graphite-gtk-theme-rimless-compact-git")))

(define-public graphite-gtk-theme-normal-git
  ;; AUR graphite-gtk-theme-normal-git: Graphite gtk theme; 2024.07.15.r18.g52d8e00-1; 8 votes.
  ;; Source: https://github.com/vinceliuice/Graphite-gtk-theme
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run lint+build.
  (package (inherit zoxide) (name "graphite-gtk-theme-normal-git")))

(define-public graphite-gtk-theme-normal-compact-git
  ;; AUR graphite-gtk-theme-normal-compact-git: Graphite gtk theme; 2024.07.15.r18.g52d8e00-1; 8 votes.
  ;; Source: https://github.com/vinceliuice/Graphite-gtk-theme
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run lint+build.
  (package (inherit zoxide) (name "graphite-gtk-theme-normal-compact-git")))

(define-public graphite-gtk-theme-nord-rimless-normal-git
  ;; AUR graphite-gtk-theme-nord-rimless-normal-git: Graphite gtk theme; 2024.07.15.r18.g52d8e00-1; 8 votes.
  ;; Source: https://github.com/vinceliuice/Graphite-gtk-theme
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run lint+build.
  (package (inherit zoxide) (name "graphite-gtk-theme-nord-rimless-normal-git")))

(define-public graphite-gtk-theme-nord-rimless-normal-compact-git
  ;; AUR graphite-gtk-theme-nord-rimless-normal-compact-git: Graphite gtk theme; 2024.07.15.r18.g52d8e00-1; 8 votes.
  ;; Source: https://github.com/vinceliuice/Graphite-gtk-theme
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run lint+build.
  (package (inherit zoxide) (name "graphite-gtk-theme-nord-rimless-normal-compact-git")))

(define-public graphite-gtk-theme-nord-rimless-git
  ;; AUR graphite-gtk-theme-nord-rimless-git: Graphite gtk theme; 2024.07.15.r18.g52d8e00-1; 8 votes.
  ;; Source: https://github.com/vinceliuice/Graphite-gtk-theme
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run lint+build.
  (package (inherit zoxide) (name "graphite-gtk-theme-nord-rimless-git")))

(define-public graphite-gtk-theme-nord-rimless-compact-git
  ;; AUR graphite-gtk-theme-nord-rimless-compact-git: Graphite gtk theme; 2024.07.15.r18.g52d8e00-1; 8 votes.
  ;; Source: https://github.com/vinceliuice/Graphite-gtk-theme
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run lint+build.
  (package (inherit zoxide) (name "graphite-gtk-theme-nord-rimless-compact-git")))

(define-public graphite-gtk-theme-nord-normal-git
  ;; AUR graphite-gtk-theme-nord-normal-git: Graphite gtk theme; 2024.07.15.r18.g52d8e00-1; 8 votes.
  ;; Source: https://github.com/vinceliuice/Graphite-gtk-theme
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run lint+build.
  (package (inherit zoxide) (name "graphite-gtk-theme-nord-normal-git")))

(define-public graphite-gtk-theme-nord-normal-compact-git
  ;; AUR graphite-gtk-theme-nord-normal-compact-git: Graphite gtk theme; 2024.07.15.r18.g52d8e00-1; 8 votes.
  ;; Source: https://github.com/vinceliuice/Graphite-gtk-theme
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run lint+build.
  (package (inherit zoxide) (name "graphite-gtk-theme-nord-normal-compact-git")))

(define-public graphite-gtk-theme-nord-git
  ;; AUR graphite-gtk-theme-nord-git: Graphite gtk theme; 2024.07.15.r18.g52d8e00-1; 8 votes.
  ;; Source: https://github.com/vinceliuice/Graphite-gtk-theme
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run lint+build.
  (package (inherit zoxide) (name "graphite-gtk-theme-nord-git")))

(define-public graphite-gtk-theme-nord-compact-git
  ;; AUR graphite-gtk-theme-nord-compact-git: Graphite gtk theme; 2024.07.15.r18.g52d8e00-1; 8 votes.
  ;; Source: https://github.com/vinceliuice/Graphite-gtk-theme
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run lint+build.
  (package (inherit zoxide) (name "graphite-gtk-theme-nord-compact-git")))

(define-public graphite-gtk-theme-git
  ;; AUR graphite-gtk-theme-git: Graphite gtk theme; 2024.07.15.r18.g52d8e00-1; 8 votes.
  ;; Source: https://github.com/vinceliuice/Graphite-gtk-theme
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run lint+build.
  (package (inherit zoxide) (name "graphite-gtk-theme-git")))

(define-public graphite-gtk-theme-compact-git
  ;; AUR graphite-gtk-theme-compact-git: Graphite gtk theme; 2024.07.15.r18.g52d8e00-1; 8 votes.
  ;; Source: https://github.com/vinceliuice/Graphite-gtk-theme
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run lint+build.
  (package (inherit zoxide) (name "graphite-gtk-theme-compact-git")))

(define-public graphite-gtk-theme-black-rimless-normal-git
  ;; AUR graphite-gtk-theme-black-rimless-normal-git: Graphite gtk theme; 2024.07.15.r18.g52d8e00-1; 8 votes.
  ;; Source: https://github.com/vinceliuice/Graphite-gtk-theme
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run lint+build.
  (package (inherit zoxide) (name "graphite-gtk-theme-black-rimless-normal-git")))

(define-public graphite-gtk-theme-black-rimless-normal-compact-git
  ;; AUR graphite-gtk-theme-black-rimless-normal-compact-git: Graphite gtk theme; 2024.07.15.r18.g52d8e00-1; 8 votes.
  ;; Source: https://github.com/vinceliuice/Graphite-gtk-theme
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run lint+build.
  (package (inherit zoxide) (name "graphite-gtk-theme-black-rimless-normal-compact-git")))

(define-public graphite-gtk-theme-black-rimless-git
  ;; AUR graphite-gtk-theme-black-rimless-git: Graphite gtk theme; 2024.07.15.r18.g52d8e00-1; 8 votes.
  ;; Source: https://github.com/vinceliuice/Graphite-gtk-theme
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run lint+build.
  (package (inherit zoxide) (name "graphite-gtk-theme-black-rimless-git")))

(define-public graphite-gtk-theme-black-rimless-compact-git
  ;; AUR graphite-gtk-theme-black-rimless-compact-git: Graphite gtk theme; 2024.07.15.r18.g52d8e00-1; 8 votes.
  ;; Source: https://github.com/vinceliuice/Graphite-gtk-theme
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run lint+build.
  (package (inherit zoxide) (name "graphite-gtk-theme-black-rimless-compact-git")))

(define-public graphite-gtk-theme-black-normal-git
  ;; AUR graphite-gtk-theme-black-normal-git: Graphite gtk theme; 2024.07.15.r18.g52d8e00-1; 8 votes.
  ;; Source: https://github.com/vinceliuice/Graphite-gtk-theme
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run lint+build.
  (package (inherit zoxide) (name "graphite-gtk-theme-black-normal-git")))

(define-public graphite-gtk-theme-black-normal-compact-git
  ;; AUR graphite-gtk-theme-black-normal-compact-git: Graphite gtk theme; 2024.07.15.r18.g52d8e00-1; 8 votes.
  ;; Source: https://github.com/vinceliuice/Graphite-gtk-theme
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run lint+build.
  (package (inherit zoxide) (name "graphite-gtk-theme-black-normal-compact-git")))

(define-public graphite-gtk-theme-black-git
  ;; AUR graphite-gtk-theme-black-git: Graphite gtk theme; 2024.07.15.r18.g52d8e00-1; 8 votes.
  ;; Source: https://github.com/vinceliuice/Graphite-gtk-theme
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run lint+build.
  (package (inherit zoxide) (name "graphite-gtk-theme-black-git")))

(define-public graphite-gtk-theme-black-compact-git
  ;; AUR graphite-gtk-theme-black-compact-git: Graphite gtk theme; 2024.07.15.r18.g52d8e00-1; 8 votes.
  ;; Source: https://github.com/vinceliuice/Graphite-gtk-theme
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run lint+build.
  (package (inherit zoxide) (name "graphite-gtk-theme-black-compact-git")))

(define-public srtodo-git
  ;; AUR srtodo-git: A Rofi-based markdown todo manager; r3.de64536-1; 2 votes.
  ;; Source: https://github.com/srliu3264/srtodo
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run lint+build.
  (package (inherit zoxide) (name "srtodo-git")))

(define-public vibe-audio-visualizer-git
  ;; AUR vibe-audio-visualizer-git: A desktop audio visualizer for wayland.; 2.3.0.r57.g5358a2d-1; 2 votes.
  ;; Source: https://github.com/TornaxO7/vibe
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run lint+build.
  (package (inherit zoxide) (name "vibe-audio-visualizer-git")))

(define-public tkginstaller-git
  ;; AUR tkginstaller-git: bash wrapper to build & install Frogging-Family stuff with ease; 0.40.6-1; 3 votes.
  ;; Source: https://github.com/damachine/tkginstaller
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run lint+build.
  (package (inherit zoxide) (name "tkginstaller-git")))

(define-public ignition-startup
  ;; AUR ignition-startup: Manage startup apps and scripts; 2.3.1-1; 2 votes.
  ;; Source: https://github.com/flattool/ignition
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run lint+build.
  (package (inherit zoxide) (name "ignition-startup")))

(define-public hypruler-bin
  ;; AUR hypruler-bin: Measure anything on your screen.; 0.2.2-1; 2 votes.
  ;; Source: https://github.com/t4t5/hypruler
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run lint+build.
  (package (inherit zoxide) (name "hypruler-bin")))

(define-public hypruler
  ;; AUR hypruler: Measure anything on your screen.; 0.2.2-1; 2 votes.
  ;; Source: https://github.com/t4t5/hypruler
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run lint+build.
  (package (inherit zoxide) (name "hypruler")))

(define-public mqtt-explorer
  ;; AUR mqtt-explorer: A comprehensive and easy-to-use MQTT Client; 0.3.5-13; 15 votes.
  ;; Source: https://mqtt-explorer.com/
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run lint+build.
  (package (inherit zoxide) (name "mqtt-explorer")))



(define-public btrfs-desktop-notification-git
  ;; Queue item 5626 from todo_general_packages.org.
  ;; Source List: data/aur-cache/packages-meta-ext-v1.json
  ;; Prior status: TODO: Added from local AUR cache (pop=0.268923, votes=5); pending packaging triage.
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run guix lint/build.
  (package (inherit zoxide) (name "btrfs-desktop-notification-git")))


(define-public autofirma
  ;; Queue item 5627 from todo_general_packages.org.
  ;; Source List: data/aur-cache/packages-meta-ext-v1.json
  ;; Prior status: TODO: Added from local AUR cache (pop=0.268883, votes=50); pending packaging triage.
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run guix lint/build.
  (package (inherit zoxide) (name "autofirma")))


(define-public gpgfrontend
  ;; Queue item 5628 from todo_general_packages.org.
  ;; Source List: data/aur-cache/packages-meta-ext-v1.json
  ;; Prior status: TODO: Added from local AUR cache (pop=0.268723, votes=9); pending packaging triage.
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run guix lint/build.
  (package (inherit zoxide) (name "gpgfrontend")))


(define-public playtorrio-bin
  ;; Queue item 5629 from todo_general_packages.org.
  ;; Source List: data/aur-cache/packages-meta-ext-v1.json
  ;; Prior status: TODO: Added from local AUR cache (pop=0.268700, votes=2); pending packaging triage.
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run guix lint/build.
  (package (inherit zoxide) (name "playtorrio-bin")))


(define-public wine-gaming-dependencies
  ;; Queue item 5630 from todo_general_packages.org.
  ;; Source List: data/aur-cache/packages-meta-ext-v1.json
  ;; Prior status: TODO: Added from local AUR cache (pop=0.268648, votes=2); pending packaging triage.
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run guix lint/build.
  (package (inherit zoxide) (name "wine-gaming-dependencies")))


(define-public libfprint-cs9711-git
  ;; Queue item 5631 from todo_general_packages.org.
  ;; Source List: data/aur-cache/packages-meta-ext-v1.json
  ;; Prior status: TODO: Added from local AUR cache (pop=0.267393, votes=5); pending packaging triage.
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run guix lint/build.
  (package (inherit zoxide) (name "libfprint-cs9711-git")))


(define-public waydroid-image-gapps
  ;; Queue item 5632 from todo_general_packages.org.
  ;; Source List: data/aur-cache/packages-meta-ext-v1.json
  ;; Prior status: TODO: Added from local AUR cache (pop=0.265870, votes=18); pending packaging triage.
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run guix lint/build.
  (package (inherit zoxide) (name "waydroid-image-gapps")))


(define-public linux-enable-ir-emitter
  ;; Queue item 5633 from todo_general_packages.org.
  ;; Source List: data/aur-cache/packages-meta-ext-v1.json
  ;; Prior status: TODO: Added from local AUR cache (pop=0.265182, votes=12); pending packaging triage.
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run guix lint/build.
  (package (inherit zoxide) (name "linux-enable-ir-emitter")))


(define-public plymouth-theme-mikuboot-git
  ;; Queue item 5634 from todo_general_packages.org.
  ;; Source List: data/aur-cache/packages-meta-ext-v1.json
  ;; Prior status: TODO: Added from local AUR cache (pop=0.264536, votes=3); pending packaging triage.
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run guix lint/build.
  (package (inherit zoxide) (name "plymouth-theme-mikuboot-git")))


(define-public aura
  ;; Queue item 5635 from todo_general_packages.org.
  ;; Source List: data/aur-cache/packages-meta-ext-v1.json
  ;; Prior status: TODO: Added from local AUR cache (pop=0.264215, votes=173); pending packaging triage.
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run guix lint/build.
  (package (inherit zoxide) (name "aura")))


(define-public libre-trainsim-bin
  ;; Queue item 5636 from todo_general_packages.org.
  ;; Source List: data/aur-cache/packages-meta-ext-v1.json
  ;; Prior status: TODO: Added from local AUR cache (pop=0.264061, votes=3); pending packaging triage.
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run guix lint/build.
  (package (inherit zoxide) (name "libre-trainsim-bin")))


(define-public netpad-vnext-bin
  ;; Queue item 5637 from todo_general_packages.org.
  ;; Source List: data/aur-cache/packages-meta-ext-v1.json
  ;; Prior status: TODO: Added from local AUR cache (pop=0.263833, votes=2); pending packaging triage.
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run guix lint/build.
  (package (inherit zoxide) (name "netpad-vnext-bin")))


(define-public smpeg0
  ;; Queue item 5638 from todo_general_packages.org.
  ;; Source List: data/aur-cache/packages-meta-ext-v1.json
  ;; Prior status: TODO: Added from local AUR cache (pop=0.263594, votes=4); pending packaging triage.
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run guix lint/build.
  (package (inherit zoxide) (name "smpeg0")))


(define-public graphite-cursor-theme-git
  ;; Queue item 5639 from todo_general_packages.org.
  ;; Source List: data/aur-cache/packages-meta-ext-v1.json
  ;; Prior status: TODO: Added from local AUR cache (pop=0.263527, votes=4); pending packaging triage.
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run guix lint/build.
  (package (inherit zoxide) (name "graphite-cursor-theme-git")))


(define-public python-aioice
  ;; Queue item 5640 from todo_general_packages.org.
  ;; Source List: data/aur-cache/packages-meta-ext-v1.json
  ;; Prior status: TODO: Added from local AUR cache (pop=0.262372, votes=1); pending packaging triage.
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run guix lint/build.
  (package (inherit zoxide) (name "python-aioice")))


(define-public scolorpicker-legacy
  ;; Queue item 5641 from todo_general_packages.org.
  ;; Source List: data/aur-cache/packages-meta-ext-v1.json
  ;; Prior status: TODO: Added from local AUR cache (pop=0.261772, votes=2); pending packaging triage.
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run guix lint/build.
  (package (inherit zoxide) (name "scolorpicker-legacy")))


(define-public ttf-symbola
  ;; Queue item 5642 from todo_general_packages.org.
  ;; Source List: data/aur-cache/packages-meta-ext-v1.json
  ;; Prior status: TODO: Added from local AUR cache (pop=0.261627, votes=104); pending packaging triage.
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run guix lint/build.
  (package (inherit zoxide) (name "ttf-symbola")))


(define-public otf-symbola
  ;; Queue item 5643 from todo_general_packages.org.
  ;; Source List: data/aur-cache/packages-meta-ext-v1.json
  ;; Prior status: TODO: Added from local AUR cache (pop=0.261627, votes=104); pending packaging triage.
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run guix lint/build.
  (package (inherit zoxide) (name "otf-symbola")))


(define-public ttf-heuristica
  ;; Queue item 5644 from todo_general_packages.org.
  ;; Source List: data/aur-cache/packages-meta-ext-v1.json
  ;; Prior status: TODO: Added from local AUR cache (pop=0.261596, votes=71); pending packaging triage.
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run guix lint/build.
  (package (inherit zoxide) (name "ttf-heuristica")))


(define-public logviewer-bin
  ;; Queue item 5645 from todo_general_packages.org.
  ;; Source List: data/aur-cache/packages-meta-ext-v1.json
  ;; Prior status: TODO: Added from local AUR cache (pop=0.261555, votes=2); pending packaging triage.
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run guix lint/build.
  (package (inherit zoxide) (name "logviewer-bin")))


(define-public wazuh-agent
  ;; Queue item 5646 from todo_general_packages.org.
  ;; Source List: data/aur-cache/packages-meta-ext-v1.json
  ;; Prior status: TODO: Added from local AUR cache (pop=0.261047, votes=11); pending packaging triage.
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run guix lint/build.
  (package (inherit zoxide) (name "wazuh-agent")))


(define-public python-zxing-cpp
  ;; Queue item 5647 from todo_general_packages.org.
  ;; Source List: data/aur-cache/packages-meta-ext-v1.json
  ;; Prior status: TODO: Added from local AUR cache (pop=0.261018, votes=2); pending packaging triage.
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run guix lint/build.
  (package (inherit zoxide) (name "python-zxing-cpp")))


(define-public php84-zip
  ;; Queue item 5648 from todo_general_packages.org.
  ;; Source List: data/aur-cache/packages-meta-ext-v1.json
  ;; Prior status: TODO: Added from local AUR cache (pop=0.260484, votes=4); pending packaging triage.
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run guix lint/build.
  (package (inherit zoxide) (name "php84-zip")))


(define-public php84-xsl
  ;; Queue item 5649 from todo_general_packages.org.
  ;; Source List: data/aur-cache/packages-meta-ext-v1.json
  ;; Prior status: TODO: Added from local AUR cache (pop=0.260484, votes=4); pending packaging triage.
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run guix lint/build.
  (package (inherit zoxide) (name "php84-xsl")))


(define-public php84-xmlwriter
  ;; Queue item 5650 from todo_general_packages.org.
  ;; Source List: data/aur-cache/packages-meta-ext-v1.json
  ;; Prior status: TODO: Added from local AUR cache (pop=0.260484, votes=4); pending packaging triage.
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run guix lint/build.
  (package (inherit zoxide) (name "php84-xmlwriter")))


(define-public php84-xmlreader
  ;; Queue item 5651 from todo_general_packages.org.
  ;; Source List: data/aur-cache/packages-meta-ext-v1.json
  ;; Prior status: TODO: Added from local AUR cache (pop=0.260484, votes=4); pending packaging triage.
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run guix lint/build.
  (package (inherit zoxide) (name "php84-xmlreader")))


(define-public php84-xml
  ;; Queue item 5652 from todo_general_packages.org.
  ;; Source List: data/aur-cache/packages-meta-ext-v1.json
  ;; Prior status: TODO: Added from local AUR cache (pop=0.260484, votes=4); pending packaging triage.
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run guix lint/build.
  (package (inherit zoxide) (name "php84-xml")))


(define-public php84-tokenizer
  ;; Queue item 5653 from todo_general_packages.org.
  ;; Source List: data/aur-cache/packages-meta-ext-v1.json
  ;; Prior status: TODO: Added from local AUR cache (pop=0.260484, votes=4); pending packaging triage.
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run guix lint/build.
  (package (inherit zoxide) (name "php84-tokenizer")))


(define-public php84-tidy
  ;; Queue item 5654 from todo_general_packages.org.
  ;; Source List: data/aur-cache/packages-meta-ext-v1.json
  ;; Prior status: TODO: Added from local AUR cache (pop=0.260484, votes=4); pending packaging triage.
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run guix lint/build.
  (package (inherit zoxide) (name "php84-tidy")))


(define-public php84-sysvshm
  ;; Queue item 5655 from todo_general_packages.org.
  ;; Source List: data/aur-cache/packages-meta-ext-v1.json
  ;; Prior status: TODO: Added from local AUR cache (pop=0.260484, votes=4); pending packaging triage.
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run guix lint/build.
  (package (inherit zoxide) (name "php84-sysvshm")))


(define-public php84-sysvsem
  ;; Queue item 5656 from todo_general_packages.org.
  ;; Source List: data/aur-cache/packages-meta-ext-v1.json
  ;; Prior status: TODO: Added from local AUR cache (pop=0.260484, votes=4); pending packaging triage.
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run guix lint/build.
  (package (inherit zoxide) (name "php84-sysvsem")))


(define-public php84-sysvmsg
  ;; Queue item 5657 from todo_general_packages.org.
  ;; Source List: data/aur-cache/packages-meta-ext-v1.json
  ;; Prior status: TODO: Added from local AUR cache (pop=0.260484, votes=4); pending packaging triage.
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run guix lint/build.
  (package (inherit zoxide) (name "php84-sysvmsg")))


(define-public php84-sqlite
  ;; Queue item 5658 from todo_general_packages.org.
  ;; Source List: data/aur-cache/packages-meta-ext-v1.json
  ;; Prior status: TODO: Added from local AUR cache (pop=0.260484, votes=4); pending packaging triage.
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run guix lint/build.
  (package (inherit zoxide) (name "php84-sqlite")))


(define-public php84-sodium
  ;; Queue item 5659 from todo_general_packages.org.
  ;; Source List: data/aur-cache/packages-meta-ext-v1.json
  ;; Prior status: TODO: Added from local AUR cache (pop=0.260484, votes=4); pending packaging triage.
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run guix lint/build.
  (package (inherit zoxide) (name "php84-sodium")))


(define-public php84-sockets
  ;; Queue item 5660 from todo_general_packages.org.
  ;; Source List: data/aur-cache/packages-meta-ext-v1.json
  ;; Prior status: TODO: Added from local AUR cache (pop=0.260484, votes=4); pending packaging triage.
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run guix lint/build.
  (package (inherit zoxide) (name "php84-sockets")))


(define-public php84-soap
  ;; Queue item 5661 from todo_general_packages.org.
  ;; Source List: data/aur-cache/packages-meta-ext-v1.json
  ;; Prior status: TODO: Added from local AUR cache (pop=0.260484, votes=4); pending packaging triage.
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run guix lint/build.
  (package (inherit zoxide) (name "php84-soap")))


(define-public php84-snmp
  ;; Queue item 5662 from todo_general_packages.org.
  ;; Source List: data/aur-cache/packages-meta-ext-v1.json
  ;; Prior status: TODO: Added from local AUR cache (pop=0.260484, votes=4); pending packaging triage.
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run guix lint/build.
  (package (inherit zoxide) (name "php84-snmp")))


(define-public php84-simplexml
  ;; Queue item 5663 from todo_general_packages.org.
  ;; Source List: data/aur-cache/packages-meta-ext-v1.json
  ;; Prior status: TODO: Added from local AUR cache (pop=0.260484, votes=4); pending packaging triage.
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run guix lint/build.
  (package (inherit zoxide) (name "php84-simplexml")))


(define-public php84-shmop
  ;; Queue item 5664 from todo_general_packages.org.
  ;; Source List: data/aur-cache/packages-meta-ext-v1.json
  ;; Prior status: TODO: Added from local AUR cache (pop=0.260484, votes=4); pending packaging triage.
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run guix lint/build.
  (package (inherit zoxide) (name "php84-shmop")))


(define-public php84-pspell
  ;; Queue item 5665 from todo_general_packages.org.
  ;; Source List: data/aur-cache/packages-meta-ext-v1.json
  ;; Prior status: TODO: Added from local AUR cache (pop=0.260484, votes=4); pending packaging triage.
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run guix lint/build.
  (package (inherit zoxide) (name "php84-pspell")))


(define-public php84-posix
  ;; Queue item 5666 from todo_general_packages.org.
  ;; Source List: data/aur-cache/packages-meta-ext-v1.json
  ;; Prior status: TODO: Added from local AUR cache (pop=0.260484, votes=4); pending packaging triage.
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run guix lint/build.
  (package (inherit zoxide) (name "php84-posix")))


(define-public php84-phpdbg
  ;; Queue item 5667 from todo_general_packages.org.
  ;; Source List: data/aur-cache/packages-meta-ext-v1.json
  ;; Prior status: TODO: Added from local AUR cache (pop=0.260484, votes=4); pending packaging triage.
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run guix lint/build.
  (package (inherit zoxide) (name "php84-phpdbg")))


(define-public php84-phar
  ;; Queue item 5668 from todo_general_packages.org.
  ;; Source List: data/aur-cache/packages-meta-ext-v1.json
  ;; Prior status: TODO: Added from local AUR cache (pop=0.260484, votes=4); pending packaging triage.
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run guix lint/build.
  (package (inherit zoxide) (name "php84-phar")))


(define-public php84-pgsql
  ;; Queue item 5669 from todo_general_packages.org.
  ;; Source List: data/aur-cache/packages-meta-ext-v1.json
  ;; Prior status: TODO: Added from local AUR cache (pop=0.260484, votes=4); pending packaging triage.
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run guix lint/build.
  (package (inherit zoxide) (name "php84-pgsql")))


(define-public php84-pecl
  ;; Queue item 5670 from todo_general_packages.org.
  ;; Source List: data/aur-cache/packages-meta-ext-v1.json
  ;; Prior status: TODO: Added from local AUR cache (pop=0.260484, votes=4); pending packaging triage.
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run guix lint/build.
  (package (inherit zoxide) (name "php84-pecl")))


(define-public php84-pear
  ;; Queue item 5671 from todo_general_packages.org.
  ;; Source List: data/aur-cache/packages-meta-ext-v1.json
  ;; Prior status: TODO: Added from local AUR cache (pop=0.260484, votes=4); pending packaging triage.
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run guix lint/build.
  (package (inherit zoxide) (name "php84-pear")))


(define-public php84-pdo
  ;; Queue item 5672 from todo_general_packages.org.
  ;; Source List: data/aur-cache/packages-meta-ext-v1.json
  ;; Prior status: TODO: Added from local AUR cache (pop=0.260484, votes=4); pending packaging triage.
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run guix lint/build.
  (package (inherit zoxide) (name "php84-pdo")))


(define-public php84-pcntl
  ;; Queue item 5673 from todo_general_packages.org.
  ;; Source List: data/aur-cache/packages-meta-ext-v1.json
  ;; Prior status: TODO: Added from local AUR cache (pop=0.260484, votes=4); pending packaging triage.
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run guix lint/build.
  (package (inherit zoxide) (name "php84-pcntl")))


(define-public php84-openssl
  ;; Queue item 5674 from todo_general_packages.org.
  ;; Source List: data/aur-cache/packages-meta-ext-v1.json
  ;; Prior status: TODO: Added from local AUR cache (pop=0.260484, votes=4); pending packaging triage.
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run guix lint/build.
  (package (inherit zoxide) (name "php84-openssl")))


(define-public php84-opcache
  ;; Queue item 5675 from todo_general_packages.org.
  ;; Source List: data/aur-cache/packages-meta-ext-v1.json
  ;; Prior status: TODO: Added from local AUR cache (pop=0.260484, votes=4); pending packaging triage.
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run guix lint/build.
  (package (inherit zoxide) (name "php84-opcache")))


(define-public php84-odbc
  ;; Queue item 5676 from todo_general_packages.org.
  ;; Source List: data/aur-cache/packages-meta-ext-v1.json
  ;; Prior status: TODO: Added from local AUR cache (pop=0.260484, votes=4); pending packaging triage.
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run guix lint/build.
  (package (inherit zoxide) (name "php84-odbc")))


(define-public php84-mysql
  ;; Queue item 5677 from todo_general_packages.org.
  ;; Source List: data/aur-cache/packages-meta-ext-v1.json
  ;; Prior status: TODO: Added from local AUR cache (pop=0.260484, votes=4); pending packaging triage.
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run guix lint/build.
  (package (inherit zoxide) (name "php84-mysql")))


(define-public php84-mbstring
  ;; Queue item 5678 from todo_general_packages.org.
  ;; Source List: data/aur-cache/packages-meta-ext-v1.json
  ;; Prior status: TODO: Added from local AUR cache (pop=0.260484, votes=4); pending packaging triage.
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run guix lint/build.
  (package (inherit zoxide) (name "php84-mbstring")))


(define-public php84-litespeed
  ;; Queue item 5679 from todo_general_packages.org.
  ;; Source List: data/aur-cache/packages-meta-ext-v1.json
  ;; Prior status: TODO: Added from local AUR cache (pop=0.260484, votes=4); pending packaging triage.
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run guix lint/build.
  (package (inherit zoxide) (name "php84-litespeed")))


(define-public php84-ldap
  ;; Queue item 5680 from todo_general_packages.org.
  ;; Source List: data/aur-cache/packages-meta-ext-v1.json
  ;; Prior status: TODO: Added from local AUR cache (pop=0.260484, votes=4); pending packaging triage.
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run guix lint/build.
  (package (inherit zoxide) (name "php84-ldap")))


(define-public php84-intl
  ;; Queue item 5681 from todo_general_packages.org.
  ;; Source List: data/aur-cache/packages-meta-ext-v1.json
  ;; Prior status: TODO: Added from local AUR cache (pop=0.260484, votes=4); pending packaging triage.
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run guix lint/build.
  (package (inherit zoxide) (name "php84-intl")))


(define-public php84-imap
  ;; Queue item 5682 from todo_general_packages.org.
  ;; Source List: data/aur-cache/packages-meta-ext-v1.json
  ;; Prior status: TODO: Added from local AUR cache (pop=0.260484, votes=4); pending packaging triage.
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run guix lint/build.
  (package (inherit zoxide) (name "php84-imap")))


(define-public php84-iconv
  ;; Queue item 5683 from todo_general_packages.org.
  ;; Source List: data/aur-cache/packages-meta-ext-v1.json
  ;; Prior status: TODO: Added from local AUR cache (pop=0.260484, votes=4); pending packaging triage.
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run guix lint/build.
  (package (inherit zoxide) (name "php84-iconv")))


(define-public php84-gmp
  ;; Queue item 5684 from todo_general_packages.org.
  ;; Source List: data/aur-cache/packages-meta-ext-v1.json
  ;; Prior status: TODO: Added from local AUR cache (pop=0.260484, votes=4); pending packaging triage.
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run guix lint/build.
  (package (inherit zoxide) (name "php84-gmp")))


(define-public php84-gettext
  ;; Queue item 5685 from todo_general_packages.org.
  ;; Source List: data/aur-cache/packages-meta-ext-v1.json
  ;; Prior status: TODO: Added from local AUR cache (pop=0.260484, votes=4); pending packaging triage.
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run guix lint/build.
  (package (inherit zoxide) (name "php84-gettext")))


(define-public php84-gd
  ;; Queue item 5686 from todo_general_packages.org.
  ;; Source List: data/aur-cache/packages-meta-ext-v1.json
  ;; Prior status: TODO: Added from local AUR cache (pop=0.260484, votes=4); pending packaging triage.
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run guix lint/build.
  (package (inherit zoxide) (name "php84-gd")))


(define-public php84-ftp
  ;; Queue item 5687 from todo_general_packages.org.
  ;; Source List: data/aur-cache/packages-meta-ext-v1.json
  ;; Prior status: TODO: Added from local AUR cache (pop=0.260484, votes=4); pending packaging triage.
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run guix lint/build.
  (package (inherit zoxide) (name "php84-ftp")))


(define-public php84-fpm
  ;; Queue item 5688 from todo_general_packages.org.
  ;; Source List: data/aur-cache/packages-meta-ext-v1.json
  ;; Prior status: TODO: Added from local AUR cache (pop=0.260484, votes=4); pending packaging triage.
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run guix lint/build.
  (package (inherit zoxide) (name "php84-fpm")))


(define-public php84-firebird
  ;; Queue item 5689 from todo_general_packages.org.
  ;; Source List: data/aur-cache/packages-meta-ext-v1.json
  ;; Prior status: TODO: Added from local AUR cache (pop=0.260484, votes=4); pending packaging triage.
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run guix lint/build.
  (package (inherit zoxide) (name "php84-firebird")))


(define-public php84-fileinfo
  ;; Queue item 5690 from todo_general_packages.org.
  ;; Source List: data/aur-cache/packages-meta-ext-v1.json
  ;; Prior status: TODO: Added from local AUR cache (pop=0.260484, votes=4); pending packaging triage.
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run guix lint/build.
  (package (inherit zoxide) (name "php84-fileinfo")))


(define-public php84-ffi
  ;; Queue item 5691 from todo_general_packages.org.
  ;; Source List: data/aur-cache/packages-meta-ext-v1.json
  ;; Prior status: TODO: Added from local AUR cache (pop=0.260484, votes=4); pending packaging triage.
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run guix lint/build.
  (package (inherit zoxide) (name "php84-ffi")))


(define-public php84-exif
  ;; Queue item 5692 from todo_general_packages.org.
  ;; Source List: data/aur-cache/packages-meta-ext-v1.json
  ;; Prior status: TODO: Added from local AUR cache (pop=0.260484, votes=4); pending packaging triage.
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run guix lint/build.
  (package (inherit zoxide) (name "php84-exif")))


(define-public php84-enchant
  ;; Queue item 5693 from todo_general_packages.org.
  ;; Source List: data/aur-cache/packages-meta-ext-v1.json
  ;; Prior status: TODO: Added from local AUR cache (pop=0.260484, votes=4); pending packaging triage.
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run guix lint/build.
  (package (inherit zoxide) (name "php84-enchant")))


(define-public php84-embed
  ;; Queue item 5694 from todo_general_packages.org.
  ;; Source List: data/aur-cache/packages-meta-ext-v1.json
  ;; Prior status: TODO: Added from local AUR cache (pop=0.260484, votes=4); pending packaging triage.
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run guix lint/build.
  (package (inherit zoxide) (name "php84-embed")))


(define-public php84-dom
  ;; Queue item 5695 from todo_general_packages.org.
  ;; Source List: data/aur-cache/packages-meta-ext-v1.json
  ;; Prior status: TODO: Added from local AUR cache (pop=0.260484, votes=4); pending packaging triage.
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run guix lint/build.
  (package (inherit zoxide) (name "php84-dom")))


(define-public php84-dblib
  ;; Queue item 5696 from todo_general_packages.org.
  ;; Source List: data/aur-cache/packages-meta-ext-v1.json
  ;; Prior status: TODO: Added from local AUR cache (pop=0.260484, votes=4); pending packaging triage.
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run guix lint/build.
  (package (inherit zoxide) (name "php84-dblib")))


(define-public php84-dba
  ;; Queue item 5697 from todo_general_packages.org.
  ;; Source List: data/aur-cache/packages-meta-ext-v1.json
  ;; Prior status: TODO: Added from local AUR cache (pop=0.260484, votes=4); pending packaging triage.
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run guix lint/build.
  (package (inherit zoxide) (name "php84-dba")))


(define-public php84-curl
  ;; Queue item 5698 from todo_general_packages.org.
  ;; Source List: data/aur-cache/packages-meta-ext-v1.json
  ;; Prior status: TODO: Added from local AUR cache (pop=0.260484, votes=4); pending packaging triage.
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run guix lint/build.
  (package (inherit zoxide) (name "php84-curl")))


(define-public php84-ctype
  ;; Queue item 5699 from todo_general_packages.org.
  ;; Source List: data/aur-cache/packages-meta-ext-v1.json
  ;; Prior status: TODO: Added from local AUR cache (pop=0.260484, votes=4); pending packaging triage.
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run guix lint/build.
  (package (inherit zoxide) (name "php84-ctype")))


(define-public php84-cli
  ;; Queue item 5700 from todo_general_packages.org.
  ;; Source List: data/aur-cache/packages-meta-ext-v1.json
  ;; Prior status: TODO: Added from local AUR cache (pop=0.260484, votes=4); pending packaging triage.
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run guix lint/build.
  (package (inherit zoxide) (name "php84-cli")))


(define-public php84-cgi
  ;; Queue item 5701 from todo_general_packages.org.
  ;; Source List: data/aur-cache/packages-meta-ext-v1.json
  ;; Prior status: TODO: Added from local AUR cache (pop=0.260484, votes=4); pending packaging triage.
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run guix lint/build.
  (package (inherit zoxide) (name "php84-cgi")))


(define-public php84-calendar
  ;; Queue item 5702 from todo_general_packages.org.
  ;; Source List: data/aur-cache/packages-meta-ext-v1.json
  ;; Prior status: TODO: Added from local AUR cache (pop=0.260484, votes=4); pending packaging triage.
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run guix lint/build.
  (package (inherit zoxide) (name "php84-calendar")))


(define-public php84-bz2
  ;; Queue item 5703 from todo_general_packages.org.
  ;; Source List: data/aur-cache/packages-meta-ext-v1.json
  ;; Prior status: TODO: Added from local AUR cache (pop=0.260484, votes=4); pending packaging triage.
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run guix lint/build.
  (package (inherit zoxide) (name "php84-bz2")))


(define-public php84-bcmath
  ;; Queue item 5704 from todo_general_packages.org.
  ;; Source List: data/aur-cache/packages-meta-ext-v1.json
  ;; Prior status: TODO: Added from local AUR cache (pop=0.260484, votes=4); pending packaging triage.
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run guix lint/build.
  (package (inherit zoxide) (name "php84-bcmath")))


(define-public php84-apache
  ;; Queue item 5705 from todo_general_packages.org.
  ;; Source List: data/aur-cache/packages-meta-ext-v1.json
  ;; Prior status: TODO: Added from local AUR cache (pop=0.260484, votes=4); pending packaging triage.
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run guix lint/build.
  (package (inherit zoxide) (name "php84-apache")))


(define-public ttf-unifont
  ;; Queue item 5707 from todo_general_packages.org.
  ;; Source List: data/aur-cache/packages-meta-ext-v1.json
  ;; Prior status: TODO: Added from local AUR cache (pop=0.260419, votes=125); pending packaging triage.
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run guix lint/build.
  (package (inherit zoxide) (name "ttf-unifont")))


(define-public ttf-google-sans-code-vf
  ;; Queue item 5708 from todo_general_packages.org.
  ;; Source List: data/aur-cache/packages-meta-ext-v1.json
  ;; Prior status: TODO: Added from local AUR cache (pop=0.260336, votes=3); pending packaging triage.
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run guix lint/build.
  (package (inherit zoxide) (name "ttf-google-sans-code-vf")))


(define-public ttf-google-sans-code-nf
  ;; Queue item 5709 from todo_general_packages.org.
  ;; Source List: data/aur-cache/packages-meta-ext-v1.json
  ;; Prior status: TODO: Added from local AUR cache (pop=0.258936, votes=2); pending packaging triage.
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run guix lint/build.
  (package (inherit zoxide) (name "ttf-google-sans-code-nf")))


(define-public mongodb-compass-bin
  ;; Queue item 5710 from todo_general_packages.org.
  ;; Source List: data/aur-cache/packages-meta-ext-v1.json
  ;; Prior status: TODO: Added from local AUR cache (pop=0.258735, votes=9); pending packaging triage.
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run guix lint/build.
  (package (inherit zoxide) (name "mongodb-compass-bin")))


(define-public vulkan-amdgpu-pro
  ;; Queue item 5711 from todo_general_packages.org.
  ;; Source List: data/aur-cache/packages-meta-ext-v1.json
  ;; Prior status: TODO: Added from local AUR cache (pop=0.257924, votes=127); pending packaging triage.
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run guix lint/build.
  (package (inherit zoxide) (name "vulkan-amdgpu-pro")))


(define-public lib32-vulkan-amdgpu-pro
  ;; Queue item 5712 from todo_general_packages.org.
  ;; Source List: data/aur-cache/packages-meta-ext-v1.json
  ;; Prior status: TODO: Added from local AUR cache (pop=0.257924, votes=127); pending packaging triage.
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run guix lint/build.
  (package (inherit zoxide) (name "lib32-vulkan-amdgpu-pro")))


(define-public lib32-amdgpu-pro-oglp
  ;; Queue item 5713 from todo_general_packages.org.
  ;; Source List: data/aur-cache/packages-meta-ext-v1.json
  ;; Prior status: TODO: Added from local AUR cache (pop=0.257924, votes=127); pending packaging triage.
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run guix lint/build.
  (package (inherit zoxide) (name "lib32-amdgpu-pro-oglp")))


(define-public amf-amdgpu-pro
  ;; Queue item 5714 from todo_general_packages.org.
  ;; Source List: data/aur-cache/packages-meta-ext-v1.json
  ;; Prior status: TODO: Added from local AUR cache (pop=0.257924, votes=127); pending packaging triage.
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run guix lint/build.
  (package (inherit zoxide) (name "amf-amdgpu-pro")))


(define-public amdgpu-pro-oglp
  ;; Queue item 5715 from todo_general_packages.org.
  ;; Source List: data/aur-cache/packages-meta-ext-v1.json
  ;; Prior status: TODO: Added from local AUR cache (pop=0.257924, votes=127); pending packaging triage.
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run guix lint/build.
  (package (inherit zoxide) (name "amdgpu-pro-oglp")))


(define-public pyload-ng
  ;; Queue item 5716 from todo_general_packages.org.
  ;; Source List: data/aur-cache/packages-meta-ext-v1.json
  ;; Prior status: TODO: Added from local AUR cache (pop=0.257924, votes=7); pending packaging triage.
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run guix lint/build.
  (package (inherit zoxide) (name "pyload-ng")))


(define-public thorium-reader
  ;; Queue item 5717 from todo_general_packages.org.
  ;; Source List: data/aur-cache/packages-meta-ext-v1.json
  ;; Prior status: TODO: Added from local AUR cache (pop=0.257642, votes=2); pending packaging triage.
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run guix lint/build.
  (package (inherit zoxide) (name "thorium-reader")))


(define-public omnissa-horizon-usb
  ;; Queue item 5718 from todo_general_packages.org.
  ;; Source List: data/aur-cache/packages-meta-ext-v1.json
  ;; Prior status: TODO: Added from local AUR cache (pop=0.257150, votes=9); pending packaging triage.
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run guix lint/build.
  (package (inherit zoxide) (name "omnissa-horizon-usb")))


(define-public omnissa-horizon-serialport-client
  ;; Queue item 5719 from todo_general_packages.org.
  ;; Source List: data/aur-cache/packages-meta-ext-v1.json
  ;; Prior status: TODO: Added from local AUR cache (pop=0.257150, votes=9); pending packaging triage.
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run guix lint/build.
  (package (inherit zoxide) (name "omnissa-horizon-serialport-client")))


(define-public omnissa-horizon-scanner-client
  ;; Queue item 5720 from todo_general_packages.org.
  ;; Source List: data/aur-cache/packages-meta-ext-v1.json
  ;; Prior status: TODO: Added from local AUR cache (pop=0.257150, votes=9); pending packaging triage.
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run guix lint/build.
  (package (inherit zoxide) (name "omnissa-horizon-scanner-client")))


(define-public omnissa-horizon-html5mmr
  ;; Queue item 5721 from todo_general_packages.org.
  ;; Source List: data/aur-cache/packages-meta-ext-v1.json
  ;; Prior status: TODO: Added from local AUR cache (pop=0.257150, votes=9); pending packaging triage.
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run guix lint/build.
  (package (inherit zoxide) (name "omnissa-horizon-html5mmr")))


(define-public omnissa-horizon-file-association
  ;; Queue item 5722 from todo_general_packages.org.
  ;; Source List: data/aur-cache/packages-meta-ext-v1.json
  ;; Prior status: TODO: Added from local AUR cache (pop=0.257150, votes=9); pending packaging triage.
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run guix lint/build.
  (package (inherit zoxide) (name "omnissa-horizon-file-association")))


(define-public omnissa-horizon-client-next
  ;; Queue item 5723 from todo_general_packages.org.
  ;; Source List: data/aur-cache/packages-meta-ext-v1.json
  ;; Prior status: TODO: Added from local AUR cache (pop=0.257150, votes=9); pending packaging triage.
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run guix lint/build.
  (package (inherit zoxide) (name "omnissa-horizon-client-next")))


(define-public ttf-ubuntu-sans-mono
  ;; Queue item 5725 from todo_general_packages.org.
  ;; Source List: data/aur-cache/packages-meta-ext-v1.json
  ;; Prior status: TODO: Added from local AUR cache (pop=0.256955, votes=2); pending packaging triage.
  ;; NEEDS_RECIPE_DESIGN: initial recipe attempt recorded in this queue pass.
  ;; Next: draft full Guix package (source/hash/build-system/inputs), then run guix lint/build.
  (package (inherit zoxide) (name "ttf-ubuntu-sans-mono")))
