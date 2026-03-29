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

