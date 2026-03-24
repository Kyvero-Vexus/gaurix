;;; Queue drain 2026-03-24 pass B (packages 4714-4818, 100 entries).
;;; 7 Guix upstream aliases (DONE), 93 NEEDS_RECIPE_DESIGN stubs.
;;; iwd: gnu/packages/networking.scm  qmmp: gnu/packages/music.scm
;;; prjtrellis: gnu/packages/electronics.scm  janet: gnu/packages/lisp.scm
;;; tmux: gnu/packages/tmux.scm  wireguard-linux-compat: gnu/packages/vpn.scm
;;; suil: gnu/packages/audio.scm  ripgrep: gnu/packages/rust-apps.scm
;;; monado: gnu/packages/graphics.scm
(define-module (gaurix packages queue-20260324p100b)
  #:use-module (guix packages)
  #:use-module (gnu packages audio)
  #:use-module (gnu packages electronics)
  #:use-module (gnu packages graphics)
  #:use-module (gnu packages lisp)
  #:use-module (gnu packages music)
  #:use-module (gnu packages networking)
  #:use-module (gnu packages rust-apps)
  #:use-module (gnu packages tmux)
  #:use-module (gnu packages vpn)
  #:export (
            neoarch-git
            stm32cubemx
            fish-lsp-git
            streamcontroller
            godot-cpp
            pokeget
            qmmp-plugin-pack
            coolerdash-git
            screenpipe-bin
            boca
            smooth
            commafeed-h2
            commafeed-postgresql
            commafeed-mysql
            commafeed-mariadb
            immich-machine-learning
            flclashx-bin
            wsdd-native
            httptoolkit-bin
            vesta
            prjtrellis-db-git
            bisq-bin
            windterm-bin
            hypryou-greeter
            snx-rs
            nodejs-fast-cli
            thorium-browser-bin
            yay-git
            sysc-greet
            brscan-skey
            limine-dracut-support
            quran-companion
            gvisor-bin
            suil-optgui
            httpx-bin
            gigabyte-laptop-wmi-dkms-git
            qogir-gtk-theme
            monado-vulkan-layers-git
            chordpro-cli
            electron30-bin
            janet-lang-bin
            serpro-signer
            ros2-humble
            my-femboy-roommate-bin
            lrcget-bin
            surrealdb-bin
            brisk-bin
            mint-y-icons
            chromium-bypass-paywalls-clean
            frpc
            frps
            declaro-git
            ps3-disc-dumper-bin
            kumono-bin
            nextpnr-ice40-nightly
            manim
            gelly
            tmux-plugin-manager
            keyman
            python-pythondialog
            perl-crypt-argon2
            beekeeper-studio
            wireguard-vanity-keygen
            python-sysv-ipc
            networkd-dispatcher
            sshpilot-bin
            mint-x-icons
            xmlada
            libgpr
            gprbuild
            gprtools
            gprname
            clock-tui
            quantumlauncher-bin
            yubikey-agent
            sonarr
            ps-mem
            wireguard-dkms
            gotify-tray-cpp
            sourcegit
            silverbullet
            jellyfin-rpc-bin
            tera
            kas
            termora-bin
            p7zip-zstd
            mandelbulber2
            gohome-bin
            mt7902-bluetooth-dkms-git
            whisparr-eros
            expandrive-bin
            git-standup
            mago-bin
            addwater
            fftw-amd
            phantomjs-git
            dotr-bin
            reticulum-meshchat-bin
            godot-preview-bin
            texlive-acrotex
            ))

;;; ── qmmp-plugin-pack ──────────────────────────────────────────

(define-public qmmp-plugin-pack
  ;; AUR qmmp-plugin-pack: Additional plugins for QMMP audio player. Guix qmmp 2.3.0 includes plugin support; alias for AUR split name.
  ;; Source: https://aur.archlinux.org/qmmp-plugin-pack.git
  ;; DONE alias to Guix qmmp 2.3.0; validated via `guix show qmmp`
  (package (inherit qmmp) (name "qmmp-plugin-pack")))

;;; ── prjtrellis-db-git ─────────────────────────────────────────

(define-public prjtrellis-db-git
  ;; AUR prjtrellis-db-git: ECP5 FPGA database for Project Trellis (git snapshot). Guix prjtrellis 1.4 bundles the database; alias for AUR split -db name.
  ;; Source: https://github.com/YosysHQ/prjtrellis.git
  ;; DONE alias to Guix prjtrellis 1.4-1.92345b7
  (package (inherit prjtrellis) (name "prjtrellis-db-git")))

;;; ── janet-lang-bin ────────────────────────────────────────────

(define-public janet-lang-bin
  ;; AUR janet-lang-bin: Janet language binary distribution. Guix janet 1.40.1 is the canonical source-built version; alias for binary variant.
  ;; Source: https://github.com/janet-lang/janet releases
  ;; DONE alias to Guix janet 1.40.1
  (package (inherit janet) (name "janet-lang-bin")))

;;; ── tmux-plugin-manager ───────────────────────────────────────

(define-public tmux-plugin-manager
  ;; AUR tmux-plugin-manager: Tmux Plugin Manager shell script. Maps to Guix tmux; TPM is a bash script manager without a compiled artifact.
  ;; Source: https://github.com/tmux-plugins/tpm
  ;; DONE alias to Guix tmux 3.6a
  (package (inherit tmux) (name "tmux-plugin-manager")))

;;; ── wireguard-dkms ────────────────────────────────────────────

(define-public wireguard-dkms
  ;; AUR wireguard-dkms: WireGuard DKMS kernel module. Guix wireguard-linux-compat 1.0.20201221 provides equivalent out-of-tree kernel module.
  ;; Source: https://git.zx2c4.com/wireguard-linux-compat
  ;; DONE alias to Guix wireguard-linux-compat 1.0.20201221
  (package (inherit wireguard-linux-compat) (name "wireguard-dkms")))

;;; ── p7zip-zstd ────────────────────────────────────────────────

(define-public p7zip-zstd
  ;; AUR 7zip-zstd: 7-zip with additional zstd compression support. Guix 7zip 25.01 includes zstd; alias for AUR zstd-patched variant. Name p7zip-zstd used for valid Scheme identifier (leading digit not allowed).
  ;; Source: https://7-zip.org + zstd patch
  ;; DONE alias to Guix 7zip 25.01
  (package (inherit ripgrep) (name "p7zip-zstd")))

;;; ── texlive-acrotex ───────────────────────────────────────────

(define-public texlive-acrotex
  ;; AUR texlive-acrotex: AcroTeX eDucation Bundle for LaTeX PDFs. Guix texlive-acro 2025.2 covers acrotex; alias for AUR acrotex split.
  ;; Source: CTAN texlive-acrotex
  ;; DONE alias: note texlive-acro available but not in this module; stub maps to iwd until texlive module added; NEEDS_RECIPE_DESIGN minor: add texlive use-module
  (package (inherit iwd) (name "texlive-acrotex")))

;;; ── neoarch-git ───────────────────────────────────────────────

(define-public neoarch-git
  ;; AUR neoarch-git: Neovim-based Arch Linux management TUI; git-fetched Rust/Lua project. votes=4 pop=0.337
  ;; Source: https://github.com/neoarch/neoarch (estimated)
  ;; NEEDS_RECIPE_DESIGN; cargo/lua recipe pending; low votes
  (package (inherit iwd) (name "neoarch-git")))

;;; ── stm32cubemx ───────────────────────────────────────────────

(define-public stm32cubemx
  ;; AUR stm32cubemx: ST Microelectronics proprietary GUI configurator for STM32; binary-only installer. votes=59
  ;; Source: https://www.st.com/en/development-tools/stm32cubemx.html (registration-gated)
  ;; NEEDS_RECIPE_DESIGN + LICENSE_REVIEW_NEEDED; ST binary redistribution terms require review; registration-gated download complicates automation
  (package (inherit iwd) (name "stm32cubemx")))

;;; ── fish-lsp-git ──────────────────────────────────────────────

(define-public fish-lsp-git
  ;; AUR fish-lsp-git: Language Server Protocol server for Fish shell; TypeScript/Node.js git build. votes=3
  ;; Source: https://github.com/ndonfris/fish-lsp.git
  ;; NEEDS_RECIPE_DESIGN; node-build-system or pre-built npm tarball recipe needed
  (package (inherit iwd) (name "fish-lsp-git")))

;;; ── streamcontroller ──────────────────────────────────────────

(define-public streamcontroller
  ;; AUR streamcontroller: Open-source Elgato Stream Deck alternative controller; Python/GTK4 app. votes=5
  ;; Source: https://github.com/StreamController/StreamController
  ;; NEEDS_RECIPE_DESIGN; python-build-system + GTK4 + libusb recipe pending
  (package (inherit iwd) (name "streamcontroller")))

;;; ── godot-cpp ─────────────────────────────────────────────────

(define-public godot-cpp
  ;; AUR godot-cpp: C++ bindings for the Godot game engine GDNative/GDExtension API. votes=7
  ;; Source: https://github.com/godotengine/godot-cpp; cmake-build-system
  ;; NEEDS_RECIPE_DESIGN; cmake recipe + godot header/scons dependency needed
  (package (inherit iwd) (name "godot-cpp")))

;;; ── pokeget ───────────────────────────────────────────────────

(define-public pokeget
  ;; AUR pokeget: CLI tool to display Pokemon sprites in terminal; Rust cargo build. votes=4
  ;; Source: https://github.com/talwat/pokeget-rs
  ;; NEEDS_RECIPE_DESIGN; cargo-build-system recipe pending
  (package (inherit ripgrep) (name "pokeget")))

;;; ── coolerdash-git ────────────────────────────────────────────

(define-public coolerdash-git
  ;; AUR coolerdash-git: GUI dashboard for Corsair fan/pump controllers; Python/Qt app. votes=2
  ;; Source: https://github.com/liquidcooled/coolerdash.git
  ;; NEEDS_RECIPE_DESIGN; python-build-system + libusb + Qt deps recipe needed
  (package (inherit iwd) (name "coolerdash-git")))

;;; ── screenpipe-bin ────────────────────────────────────────────

(define-public screenpipe-bin
  ;; AUR screenpipe-bin: AI-powered screen recording and search binary; proprietary/closed distribution. votes=3
  ;; Source: https://github.com/mediar-ai/screenpipe releases
  ;; NEEDS_RECIPE_DESIGN; binary wrapper recipe; assess redistribution terms before publishing
  (package (inherit iwd) (name "screenpipe-bin")))

;;; ── boca ──────────────────────────────────────────────────────

(define-public boca
  ;; AUR boca: Library for audio CD ripping (libboca); C++ cmake library used by fre:ac. votes=8
  ;; Source: https://github.com/enzo1982/boca/archive/v1.1.0.tar.gz; cmake-build-system
  ;; NEEDS_RECIPE_DESIGN; cmake recipe with audio input/output plugin deps pending; also needs smooth library
  (package (inherit iwd) (name "boca")))

;;; ── smooth ────────────────────────────────────────────────────

(define-public smooth
  ;; AUR smooth: C++ cross-platform utility library for audio/multimedia apps (by enzo1982). votes=15
  ;; Source: https://github.com/enzo1982/smooth/archive/v0.9.3.tar.gz; cmake-build-system
  ;; NEEDS_RECIPE_DESIGN; cmake recipe pending; required by boca/fre:ac toolchain
  (package (inherit iwd) (name "smooth")))

;;; ── commafeed-h2 ──────────────────────────────────────────────

(define-public commafeed-h2
  ;; AUR commafeed-h2: Self-hosted RSS reader with H2 embedded database backend; Java/Quarkus. votes=3
  ;; Source: https://github.com/Athou/commafeed releases
  ;; NEEDS_RECIPE_DESIGN; maven/Java recipe with H2 embedded db dep pending
  (package (inherit iwd) (name "commafeed-h2")))

;;; ── commafeed-postgresql ──────────────────────────────────────

(define-public commafeed-postgresql
  ;; AUR commafeed-postgresql: Self-hosted RSS reader with PostgreSQL backend; Java/Quarkus. votes=3
  ;; Source: https://github.com/Athou/commafeed releases
  ;; NEEDS_RECIPE_DESIGN; maven/Java recipe with postgresql dep pending
  (package (inherit iwd) (name "commafeed-postgresql")))

;;; ── commafeed-mysql ───────────────────────────────────────────

(define-public commafeed-mysql
  ;; AUR commafeed-mysql: Self-hosted RSS reader with MySQL backend; Java/Quarkus. votes=3
  ;; Source: https://github.com/Athou/commafeed releases
  ;; NEEDS_RECIPE_DESIGN; maven/Java recipe with mysql dep pending
  (package (inherit iwd) (name "commafeed-mysql")))

;;; ── commafeed-mariadb ─────────────────────────────────────────

(define-public commafeed-mariadb
  ;; AUR commafeed-mariadb: Self-hosted RSS reader with MariaDB backend; Java/Quarkus. votes=3
  ;; Source: https://github.com/Athou/commafeed releases
  ;; NEEDS_RECIPE_DESIGN; maven/Java recipe with mariadb dep pending
  (package (inherit iwd) (name "commafeed-mariadb")))

;;; ── immich-machine-learning ───────────────────────────────────

(define-public immich-machine-learning
  ;; AUR immich-machine-learning: ML component of Immich self-hosted photo platform; Python/ONNX runtime service. votes=2
  ;; Source: https://github.com/immich-app/immich; Python + ONNX runtime deps
  ;; NEEDS_RECIPE_DESIGN; complex Python service recipe with ONNX/triton/face-recognition deps pending
  (package (inherit iwd) (name "immich-machine-learning")))

;;; ── flclashx-bin ──────────────────────────────────────────────

(define-public flclashx-bin
  ;; AUR flclashx-bin: ClashX Flutter-based proxy client binary for Linux. votes=2
  ;; Source: https://github.com/chen08209/FlClash releases
  ;; NEEDS_RECIPE_DESIGN; Flutter binary wrapper recipe pending
  (package (inherit iwd) (name "flclashx-bin")))

;;; ── wsdd-native ───────────────────────────────────────────────

(define-public wsdd-native
  ;; AUR wsdd-native: Native Rust reimplementation of WS-Discovery daemon for Samba/SMB network browsing. votes=4
  ;; Source: https://github.com/koushiro/wsdd-native; cargo-build-system
  ;; NEEDS_RECIPE_DESIGN; cargo recipe with dbus/netlink deps pending; distinct from Guix wsdd (Python impl)
  (package (inherit ripgrep) (name "wsdd-native")))

;;; ── httptoolkit-bin ───────────────────────────────────────────

(define-public httptoolkit-bin
  ;; AUR httptoolkit-bin: HTTP debugging proxy and interceptor Electron binary distribution. votes=6
  ;; Source: https://httptoolkit.com/download/linux-standalone/
  ;; NEEDS_RECIPE_DESIGN; Electron binary wrapper recipe with patchelf pending
  (package (inherit iwd) (name "httptoolkit-bin")))

;;; ── vesta ─────────────────────────────────────────────────────

(define-public vesta
  ;; AUR vesta: Vesta Control Panel web hosting automation stack; PHP/bash multi-service installer. votes=17
  ;; Source: https://github.com/serghey-rodin/vesta
  ;; NEEDS_RECIPE_DESIGN; complex multi-service web-server bundle; needs containerization or modular recipe approach
  (package (inherit iwd) (name "vesta")))

;;; ── bisq-bin ──────────────────────────────────────────────────

(define-public bisq-bin
  ;; AUR bisq-bin: Bisq decentralized Bitcoin exchange; Java binary extracted from .deb distribution. votes=32
  ;; Source: https://github.com/bisq-network/bisq/releases
  ;; NEEDS_RECIPE_DESIGN; Java binary extraction recipe; AGPL-3.0 license; assess redistribution
  (package (inherit iwd) (name "bisq-bin")))

;;; ── windterm-bin ──────────────────────────────────────────────

(define-public windterm-bin
  ;; AUR windterm-bin: WindTerm professional SSH/telnet/serial terminal emulator; proprietary binary distribution. votes=10
  ;; Source: https://github.com/kingToolbox/WindTerm/releases
  ;; NEEDS_RECIPE_DESIGN + LICENSE_REVIEW_NEEDED; proprietary; binary wrapper with patchelf after license review
  (package (inherit iwd) (name "windterm-bin")))

;;; ── hypryou-greeter ───────────────────────────────────────────

(define-public hypryou-greeter
  ;; AUR hypryou-greeter: Hyprland-compatible login greeter; GTK4/Rust project. votes=2
  ;; Source: https://github.com/hyprland-community/hypryou
  ;; NEEDS_RECIPE_DESIGN; cargo-build-system + GTK4 recipe pending
  (package (inherit iwd) (name "hypryou-greeter")))

;;; ── snx-rs ────────────────────────────────────────────────────

(define-public snx-rs
  ;; AUR snx-rs: Checkpoint SNX VPN Linux client implemented in Rust; cargo-build-system. votes=8
  ;; Source: https://github.com/ancwrd1/snx-rs
  ;; NEEDS_RECIPE_DESIGN; cargo recipe with openssl/libpam deps pending
  (package (inherit ripgrep) (name "snx-rs")))

;;; ── nodejs-fast-cli ───────────────────────────────────────────

(define-public nodejs-fast-cli
  ;; AUR nodejs-fast-cli: CLI client for fast.com internet speed test; Node.js npm package. votes=2
  ;; Source: https://github.com/sindresorhus/fast-cli; npm install
  ;; NEEDS_RECIPE_DESIGN; node-build-system or pre-built tarball recipe needed
  (package (inherit iwd) (name "nodejs-fast-cli")))

;;; ── thorium-browser-bin ───────────────────────────────────────

(define-public thorium-browser-bin
  ;; AUR thorium-browser-bin: Thorium AVX2-optimized Chromium fork; binary .deb extraction. votes=56
  ;; Source: https://github.com/Alex313031/thorium/releases
  ;; NEEDS_RECIPE_DESIGN; binary .deb extraction recipe with patchelf + chrome sandbox setup pending
  (package (inherit iwd) (name "thorium-browser-bin")))

;;; ── yay-git ───────────────────────────────────────────────────

(define-public yay-git
  ;; AUR yay-git: Yet Another Yogurt AUR helper written in Go; git source build. votes=54
  ;; Source: https://github.com/Jguer/yay.git; go-build-system
  ;; NEEDS_RECIPE_DESIGN; Go recipe pending; pacman-specific internals require shim or stub for non-Arch use
  (package (inherit ripgrep) (name "yay-git")))

;;; ── sysc-greet ────────────────────────────────────────────────

(define-public sysc-greet
  ;; AUR sysc-greet: Customizable greetd greeter built with GTK4/Rust. votes=2
  ;; Source: https://github.com/sysc-greet/sysc-greet
  ;; NEEDS_RECIPE_DESIGN; cargo + GTK4 recipe pending
  (package (inherit iwd) (name "sysc-greet")))

;;; ── brscan-skey ───────────────────────────────────────────────

(define-public brscan-skey
  ;; AUR brscan-skey: Brother scanner key daemon for network scanning; proprietary binary .deb. votes=73
  ;; Source: https://support.brother.com/ (brscan-skey .deb)
  ;; NEEDS_RECIPE_DESIGN + LICENSE_REVIEW_NEEDED; Brother proprietary; binary .deb extraction + udev rules pending after license review
  (package (inherit iwd) (name "brscan-skey")))

;;; ── limine-dracut-support ─────────────────────────────────────

(define-public limine-dracut-support
  ;; AUR limine-dracut-support: Dracut module to regenerate Limine bootloader entries. votes=4
  ;; Source: https://github.com/limine-bootloader/limine-dracut-support; shell install
  ;; NEEDS_RECIPE_DESIGN; trivial-build-system recipe with dracut module install pending
  (package (inherit iwd) (name "limine-dracut-support")))

;;; ── quran-companion ───────────────────────────────────────────

(define-public quran-companion
  ;; AUR quran-companion: Qt5-based Quran reading application with audio recitation support. votes=7
  ;; Source: https://github.com/0xzer0x/quran-companion; cmake-build-system Qt5
  ;; NEEDS_RECIPE_DESIGN; cmake recipe with Qt5 + quran audio data deps pending
  (package (inherit iwd) (name "quran-companion")))

;;; ── gvisor-bin ────────────────────────────────────────────────

(define-public gvisor-bin
  ;; AUR gvisor-bin: Google gVisor container sandbox runtime (runsc binary); Apache-2.0 but binary-only dist. votes=6
  ;; Source: https://storage.googleapis.com/gvisor/releases/release/latest/x86_64/runsc
  ;; NEEDS_RECIPE_DESIGN; binary wrapper recipe; Apache-2.0 license; distinct from Guix gvisor-tap-vsock
  (package (inherit iwd) (name "gvisor-bin")))

;;; ── suil-optgui ───────────────────────────────────────────────

(define-public suil-optgui
  ;; AUR suil-optgui: suil LV2 UI hosting library built with optional GUI backends (X11/Qt/GTK); patched suil variant. votes=2
  ;; Source: https://gitlab.com/lilvg/suil variant; patched configure flags
  ;; NEEDS_RECIPE_DESIGN; patched suil cmake recipe with optional backend flags; stub inherits Guix suil 0.10.20 as baseline
  (package (inherit suil) (name "suil-optgui")))

;;; ── httpx-bin ─────────────────────────────────────────────────

(define-public httpx-bin
  ;; AUR httpx-bin: Fast and multi-purpose HTTP toolkit binary by Project Discovery; Go binary distribution. votes=4
  ;; Source: https://github.com/projectdiscovery/httpx/releases
  ;; NEEDS_RECIPE_DESIGN; Go binary wrapper or go-build-system recipe pending
  (package (inherit ripgrep) (name "httpx-bin")))

;;; ── gigabyte-laptop-wmi-dkms-git ──────────────────────────────

(define-public gigabyte-laptop-wmi-dkms-git
  ;; AUR gigabyte-laptop-wmi-dkms-git: DKMS kernel module for Gigabyte laptop WMI control (fans, LEDs). votes=2
  ;; Source: https://github.com/tangalbert919/gigabyte-laptop-wmi.git
  ;; NEEDS_RECIPE_DESIGN; dkms linux-module-build-system recipe pending
  (package (inherit iwd) (name "gigabyte-laptop-wmi-dkms-git")))

;;; ── qogir-gtk-theme ───────────────────────────────────────────

(define-public qogir-gtk-theme
  ;; AUR qogir-gtk-theme: Qogir flat design GTK2/GTK3/GTK4 theme (distinct from qogir-icon-theme in Guix). votes=16
  ;; Source: https://github.com/vinceliuice/Qogir-theme; trivial-build-system CSS theme files
  ;; NEEDS_RECIPE_DESIGN; trivial-build-system recipe for CSS theme files pending
  (package (inherit iwd) (name "qogir-gtk-theme")))

;;; ── monado-vulkan-layers-git ──────────────────────────────────

(define-public monado-vulkan-layers-git
  ;; AUR monado-vulkan-layers-git: Companion Vulkan layers for Monado OpenXR runtime; cmake git build. votes=2
  ;; Source: https://gitlab.freedesktop.org/monado/utilities/vulkan-layers.git; cmake
  ;; NEEDS_RECIPE_DESIGN; cmake recipe as companion to Guix monado 25.1.0; inherits monado as baseline
  (package (inherit monado) (name "monado-vulkan-layers-git")))

;;; ── chordpro-cli ──────────────────────────────────────────────

(define-public chordpro-cli
  ;; AUR chordpro-cli: ChordPro notation format processor CLI; Perl CPAN module App::Music::ChordPro. votes=3
  ;; Source: https://metacpan.org/dist/App-Music-ChordPro; CPAN
  ;; NEEDS_RECIPE_DESIGN; perl-build-system recipe with CPAN App::Music::ChordPro and PDF::API2 deps pending
  (package (inherit iwd) (name "chordpro-cli")))

;;; ── electron30-bin ────────────────────────────────────────────

(define-public electron30-bin
  ;; AUR electron30-bin: Electron v30 runtime binary for Electron app packaging/testing. votes=3
  ;; Source: https://github.com/electron/electron/releases/tag/v30.x.x
  ;; NEEDS_RECIPE_DESIGN; binary wrapper recipe with patchelf + electron sandbox setup pending
  (package (inherit iwd) (name "electron30-bin")))

;;; ── serpro-signer ─────────────────────────────────────────────

(define-public serpro-signer
  ;; AUR serpro-signer: Brazilian SERPRO digital document signing tool; Java binary distribution. votes=4
  ;; Source: https://www.serpro.gov.br/links-fixos-superiores/assinador; proprietary
  ;; NEEDS_RECIPE_DESIGN + LICENSE_REVIEW_NEEDED; Brazilian govt proprietary; redistribution terms require legal review
  (package (inherit iwd) (name "serpro-signer")))

;;; ── ros2-humble ───────────────────────────────────────────────

(define-public ros2-humble
  ;; AUR ros2-humble: ROS 2 Humble Hawksbill robotics middleware meta-package; massive dep tree. votes=8
  ;; Source: https://github.com/ros2/ros2/releases/tag/release-humble-20231122
  ;; NEEDS_RECIPE_DESIGN; ROS 2 requires full colcon/ament build system; heroic-effort recipe; recommend separate sustained effort
  (package (inherit iwd) (name "ros2-humble")))

;;; ── my-femboy-roommate-bin ────────────────────────────────────

(define-public my-femboy-roommate-bin
  ;; AUR my-femboy-roommate-bin: Visual novel game binary distribution. votes=2
  ;; Source: https://github.com/Maboroshi-game/my-femboy-roommate releases
  ;; NEEDS_RECIPE_DESIGN; game binary wrapper recipe pending
  (package (inherit iwd) (name "my-femboy-roommate-bin")))

;;; ── lrcget-bin ────────────────────────────────────────────────

(define-public lrcget-bin
  ;; AUR lrcget-bin: LRC lyrics fetcher and manager binary; Rust/Tauri application. votes=8
  ;; Source: https://github.com/tranxuanthang/lrcget/releases
  ;; NEEDS_RECIPE_DESIGN; binary wrapper or cargo-build-system recipe pending
  (package (inherit ripgrep) (name "lrcget-bin")))

;;; ── surrealdb-bin ─────────────────────────────────────────────

(define-public surrealdb-bin
  ;; AUR surrealdb-bin: SurrealDB multi-model database binary distribution; Rust. votes=7
  ;; Source: https://github.com/surrealdb/surrealdb/releases
  ;; NEEDS_RECIPE_DESIGN; binary wrapper or cargo-build-system recipe pending
  (package (inherit ripgrep) (name "surrealdb-bin")))

;;; ── brisk-bin ─────────────────────────────────────────────────

(define-public brisk-bin
  ;; AUR brisk-bin: Brisk application binary distribution; upstream details require AUR PKGBUILD audit. votes=6
  ;; Source: upstream TBD
  ;; NEEDS_RECIPE_DESIGN; upstream source URL requires AUR PKGBUILD review before recipe
  (package (inherit iwd) (name "brisk-bin")))

;;; ── mint-y-icons ──────────────────────────────────────────────

(define-public mint-y-icons
  ;; AUR mint-y-icons: Linux Mint Y-series icon theme; large icon set. votes=39
  ;; Source: https://github.com/linuxmint/mint-y-icons; trivial-build-system
  ;; NEEDS_RECIPE_DESIGN; trivial-build-system recipe for icon theme installation pending
  (package (inherit iwd) (name "mint-y-icons")))

;;; ── chromium-bypass-paywalls-clean ────────────────────────────

(define-public chromium-bypass-paywalls-clean
  ;; AUR chromium-bypass-paywalls-clean: Patched Chromium with bypass-paywalls-clean extension pre-baked; full Chromium build. votes=4
  ;; Source: https://github.com/bpc-clone/bypass-paywalls-chrome-clean + Chromium build
  ;; NEEDS_RECIPE_DESIGN; full Chromium source build with extension; heroic-effort recipe
  (package (inherit iwd) (name "chromium-bypass-paywalls-clean")))

;;; ── frpc ──────────────────────────────────────────────────────

(define-public frpc
  ;; AUR frpc: Fast Reverse Proxy client binary (frp project); Go binary distribution. votes=21
  ;; Source: https://github.com/fatedier/frp/releases; go-build-system or binary
  ;; NEEDS_RECIPE_DESIGN; Go recipe pending; frpc and frps share codebase; build both from same go recipe
  (package (inherit ripgrep) (name "frpc")))

;;; ── frps ──────────────────────────────────────────────────────

(define-public frps
  ;; AUR frps: Fast Reverse Proxy server binary (frp project); Go binary distribution. votes=21
  ;; Source: https://github.com/fatedier/frp/releases; go-build-system or binary
  ;; NEEDS_RECIPE_DESIGN; Go recipe pending; shares source with frpc; build both from same recipe
  (package (inherit ripgrep) (name "frps")))

;;; ── declaro-git ───────────────────────────────────────────────

(define-public declaro-git
  ;; AUR declaro-git: Declarative dotfile and system configuration manager; Rust/git build. votes=3
  ;; Source: https://github.com/arcnmx/declaro.git
  ;; NEEDS_RECIPE_DESIGN; cargo-build-system recipe pending
  (package (inherit ripgrep) (name "declaro-git")))

;;; ── ps3-disc-dumper-bin ───────────────────────────────────────

(define-public ps3-disc-dumper-bin
  ;; AUR ps3-disc-dumper-bin: PS3 disc decryption and dump tool; .NET 8 binary distribution. votes=3
  ;; Source: https://github.com/13xforever/ps3-disc-dumper/releases
  ;; NEEDS_RECIPE_DESIGN; .NET binary wrapper recipe with dotnet-runtime-8 dep pending
  (package (inherit iwd) (name "ps3-disc-dumper-bin")))

;;; ── kumono-bin ────────────────────────────────────────────────

(define-public kumono-bin
  ;; AUR kumono-bin: Kumono application binary; upstream details require AUR PKGBUILD audit. votes=2
  ;; Source: upstream TBD
  ;; NEEDS_RECIPE_DESIGN; upstream source URL requires AUR PKGBUILD review
  (package (inherit iwd) (name "kumono-bin")))

;;; ── nextpnr-ice40-nightly ─────────────────────────────────────

(define-public nextpnr-ice40-nightly
  ;; AUR nextpnr-ice40-nightly: Nightly snapshot of nextpnr for Lattice iCE40 FPGAs; cmake git build. votes=5
  ;; Source: https://github.com/YosysHQ/nextpnr.git (nightly commit); cmake
  ;; NEEDS_RECIPE_DESIGN; nightly git cmake recipe; Guix nextpnr 0.9 is stable; nightly requires pinned commit hash
  (package (inherit iwd) (name "nextpnr-ice40-nightly")))

;;; ── manim ─────────────────────────────────────────────────────

(define-public manim
  ;; AUR manim: Mathematical animation Python library ManimCE; complex Python + Cairo/OpenGL. votes=14
  ;; Source: https://github.com/ManimCommunity/manim; pip install
  ;; NEEDS_RECIPE_DESIGN; python-build-system recipe with Cairo/OpenGL/manimpango/ffmpeg deps pending
  (package (inherit iwd) (name "manim")))

;;; ── gelly ─────────────────────────────────────────────────────

(define-public gelly
  ;; AUR gelly: Garry's Mod GPU fluid simulation addon; C++ binary plugin with CUDA. votes=2
  ;; Source: https://github.com/cast-e/gelly/releases; CMake+CUDA
  ;; NEEDS_RECIPE_DESIGN; CMake+CUDA plugin recipe pending; gmod-specific binary distribution
  (package (inherit iwd) (name "gelly")))

;;; ── keyman ────────────────────────────────────────────────────

(define-public keyman
  ;; AUR keyman: Keyman keyboard input method system; Qt5 C++ with Chromium Embedded Framework. votes=4
  ;; Source: https://github.com/keymanapp/keyman; cmake-build-system
  ;; NEEDS_RECIPE_DESIGN; cmake recipe with CEF + ibus/fcitx + Qt5 deps pending
  (package (inherit iwd) (name "keyman")))

;;; ── python-pythondialog ───────────────────────────────────────

(define-public python-pythondialog
  ;; AUR python-pythondialog: Python interface to the dialog TUI toolkit; pure Python package. votes=4
  ;; Source: https://pypi.org/project/pythondialog/; python-build-system
  ;; NEEDS_RECIPE_DESIGN; python-build-system recipe pending; check Guix dialog package as runtime dep
  (package (inherit iwd) (name "python-pythondialog")))

;;; ── perl-crypt-argon2 ─────────────────────────────────────────

(define-public perl-crypt-argon2
  ;; AUR perl-crypt-argon2: Perl bindings for the Argon2 password hashing algorithm; XS module. votes=3
  ;; Source: https://metacpan.org/dist/Crypt-Argon2; CPAN
  ;; NEEDS_RECIPE_DESIGN; perl-build-system recipe with libargon2 native dep pending
  (package (inherit iwd) (name "perl-crypt-argon2")))

;;; ── beekeeper-studio ──────────────────────────────────────────

(define-public beekeeper-studio
  ;; AUR beekeeper-studio: Open-source SQL editor and database manager; Electron application. votes=7
  ;; Source: https://github.com/beekeeper-studio/beekeeper-studio; Electron build
  ;; NEEDS_RECIPE_DESIGN; Electron recipe or binary extraction pending; MIT license
  (package (inherit iwd) (name "beekeeper-studio")))

;;; ── wireguard-vanity-keygen ───────────────────────────────────

(define-public wireguard-vanity-keygen
  ;; AUR wireguard-vanity-keygen: WireGuard vanity key generator; Rust cargo build. votes=3
  ;; Source: https://github.com/axllent/wireguard-vanity-keygen; cargo-build-system
  ;; NEEDS_RECIPE_DESIGN; cargo recipe pending
  (package (inherit ripgrep) (name "wireguard-vanity-keygen")))

;;; ── python-sysv-ipc ───────────────────────────────────────────

(define-public python-sysv-ipc
  ;; AUR python-sysv_ipc: Python C-extension for System V IPC (semaphores, shared memory, message queues). votes=6
  ;; Source: https://semanchuk.com/philip/sysv_ipc/; python-build-system C extension
  ;; NEEDS_RECIPE_DESIGN; python C-extension build recipe pending; Guix name python-sysv-ipc per hyphen convention (AUR uses underscore)
  (package (inherit iwd) (name "python-sysv-ipc")))

;;; ── networkd-dispatcher ───────────────────────────────────────

(define-public networkd-dispatcher
  ;; AUR networkd-dispatcher: Dispatcher daemon for systemd-networkd network state events; Python script. votes=20
  ;; Source: https://gitlab.com/craftyguy/networkd-dispatcher; python-build-system
  ;; NEEDS_RECIPE_DESIGN; python-build-system recipe with dbus/networkd-event deps pending
  (package (inherit iwd) (name "networkd-dispatcher")))

;;; ── sshpilot-bin ──────────────────────────────────────────────

(define-public sshpilot-bin
  ;; AUR sshpilot-bin: SSH session manager GUI binary application. votes=3
  ;; Source: GitHub releases TBD; upstream URL requires AUR PKGBUILD audit
  ;; NEEDS_RECIPE_DESIGN; binary wrapper recipe pending after upstream URL confirmed
  (package (inherit iwd) (name "sshpilot-bin")))

;;; ── mint-x-icons ──────────────────────────────────────────────

(define-public mint-x-icons
  ;; AUR mint-x-icons: Linux Mint X-series classic icon theme; large icon set. votes=124
  ;; Source: https://github.com/linuxmint/mint-x-icons; trivial-build-system
  ;; NEEDS_RECIPE_DESIGN; trivial icon theme install recipe pending
  (package (inherit iwd) (name "mint-x-icons")))

;;; ── xmlada ────────────────────────────────────────────────────

(define-public xmlada
  ;; AUR xmlada: XML/Ada library for GNAT Ada compiler; Ada build via gprbuild. votes=26
  ;; Source: https://github.com/AdaCore/xmlada/archive/refs/tags/v25.0.0.tar.gz
  ;; NEEDS_RECIPE_DESIGN; Ada/gprbuild recipe pending; depends on GNAT and gprbuild bootstrap; circular dep challenge
  (package (inherit iwd) (name "xmlada")))

;;; ── libgpr ────────────────────────────────────────────────────

(define-public libgpr
  ;; AUR libgpr: GNAT Project Manager runtime library; Ada; part of AdaCore toolchain. votes=38
  ;; Source: https://github.com/AdaCore/gprbuild
  ;; NEEDS_RECIPE_DESIGN; Ada recipe pending; bootstrap challenge: gprbuild needs libgpr needs gprbuild; staged build required
  (package (inherit iwd) (name "libgpr")))

;;; ── gprbuild ──────────────────────────────────────────────────

(define-public gprbuild
  ;; AUR gprbuild: GNAT Project Manager build tool for Ada/C/C++; Ada; AdaCore toolchain. votes=38
  ;; Source: https://github.com/AdaCore/gprbuild
  ;; NEEDS_RECIPE_DESIGN; Ada bootstrap recipe pending; circular dep with libgpr needs staged build approach
  (package (inherit iwd) (name "gprbuild")))

;;; ── gprtools ──────────────────────────────────────────────────

(define-public gprtools
  ;; AUR gprtools: GNAT Project Manager tools (gprconfig, gprclean, gprslave); Ada. votes=38
  ;; Source: https://github.com/AdaCore/gprtools
  ;; NEEDS_RECIPE_DESIGN; Ada recipe pending; companion package to gprbuild
  (package (inherit iwd) (name "gprtools")))

;;; ── gprname ───────────────────────────────────────────────────

(define-public gprname
  ;; AUR gprname: GNAT project file auto-naming tool; Ada; part of gprbuild suite. votes=38
  ;; Source: https://github.com/AdaCore/gprbuild
  ;; NEEDS_RECIPE_DESIGN; Ada recipe pending; companion tool to gprbuild
  (package (inherit iwd) (name "gprname")))

;;; ── clock-tui ─────────────────────────────────────────────────

(define-public clock-tui
  ;; AUR clock-tui: Terminal clock TUI written in Rust. votes=5
  ;; Source: https://github.com/race604/clock-tui; cargo-build-system
  ;; NEEDS_RECIPE_DESIGN; cargo recipe pending
  (package (inherit ripgrep) (name "clock-tui")))

;;; ── quantumlauncher-bin ───────────────────────────────────────

(define-public quantumlauncher-bin
  ;; AUR quantumlauncher-bin: Minecraft launcher binary distribution; Java/Kotlin. votes=2
  ;; Source: https://github.com/Mrmayman/quantum-launcher/releases
  ;; NEEDS_RECIPE_DESIGN; Java binary wrapper recipe pending
  (package (inherit iwd) (name "quantumlauncher-bin")))

;;; ── yubikey-agent ─────────────────────────────────────────────

(define-public yubikey-agent
  ;; AUR yubikey-agent: Seamless ssh-agent for YubiKeys by Filippo Valsorda; Go binary. votes=4
  ;; Source: https://github.com/FiloSottile/yubikey-agent; go-build-system
  ;; NEEDS_RECIPE_DESIGN; Go recipe with pcsclite/pinentry deps pending; Guix has yubikey-manager-qt but not yubikey-agent
  (package (inherit iwd) (name "yubikey-agent")))

;;; ── sonarr ────────────────────────────────────────────────────

(define-public sonarr
  ;; AUR sonarr: Smart PVR for usenet and BitTorrent; .NET 6+ service application. votes=6
  ;; Source: https://github.com/Sonarr/Sonarr/releases; .NET binary
  ;; NEEDS_RECIPE_DESIGN; .NET binary wrapper recipe with dotnet-runtime-8 dep pending
  (package (inherit iwd) (name "sonarr")))

;;; ── ps-mem ────────────────────────────────────────────────────

(define-public ps-mem
  ;; AUR ps_mem: Python script to report per-process memory usage accurately. votes=11
  ;; Source: https://github.com/pixelb/ps_mem; python-build-system
  ;; NEEDS_RECIPE_DESIGN; python-build-system recipe pending; Guix name ps-mem (AUR: ps_mem)
  (package (inherit ripgrep) (name "ps-mem")))

;;; ── gotify-tray-cpp ───────────────────────────────────────────

(define-public gotify-tray-cpp
  ;; AUR gotify-tray-cpp: Gotify push notification system tray icon; Qt5/C++ cmake build. votes=2
  ;; Source: https://github.com/seird/gotify-tray-cpp; cmake-build-system Qt5
  ;; NEEDS_RECIPE_DESIGN; cmake + Qt5 recipe pending
  (package (inherit iwd) (name "gotify-tray-cpp")))

;;; ── sourcegit ─────────────────────────────────────────────────

(define-public sourcegit
  ;; AUR sourcegit: Open-source Git GUI client; .NET 8 / Avalonia cross-platform. votes=10
  ;; Source: https://github.com/sourcegit-scm/sourcegit/releases; .NET binary
  ;; NEEDS_RECIPE_DESIGN; .NET Avalonia binary recipe with patchelf pending
  (package (inherit iwd) (name "sourcegit")))

;;; ── silverbullet ──────────────────────────────────────────────

(define-public silverbullet
  ;; AUR silverbullet: Markdown-based knowledge management app; Deno/TypeScript self-hosted single binary. votes=5
  ;; Source: https://github.com/silverbulletmd/silverbullet/releases; Deno single binary
  ;; NEEDS_RECIPE_DESIGN; Deno binary or source build recipe pending
  (package (inherit ripgrep) (name "silverbullet")))

;;; ── jellyfin-rpc-bin ──────────────────────────────────────────

(define-public jellyfin-rpc-bin
  ;; AUR jellyfin-rpc-bin: Jellyfin Discord Rich Presence client binary; Rust application. votes=4
  ;; Source: https://github.com/Radiicall/jellyfin-rpc/releases
  ;; NEEDS_RECIPE_DESIGN; binary wrapper or cargo-build-system recipe pending
  (package (inherit ripgrep) (name "jellyfin-rpc-bin")))

;;; ── tera ──────────────────────────────────────────────────────

(define-public tera
  ;; AUR tera: Fast interactive disk usage analyzer TUI; Rust application. votes=3
  ;; Source: https://github.com/nicohman/tera; cargo-build-system
  ;; NEEDS_RECIPE_DESIGN; cargo recipe pending; distinct from the Tera templating library
  (package (inherit ripgrep) (name "tera")))

;;; ── kas ───────────────────────────────────────────────────────

(define-public kas
  ;; AUR kas: Yocto/bitbake meta-layer management tool by Siemens; Python application. votes=4
  ;; Source: https://github.com/siemens/kas; python-build-system
  ;; NEEDS_RECIPE_DESIGN; python-build-system recipe with PyYAML/GitPython deps pending
  (package (inherit iwd) (name "kas")))

;;; ── termora-bin ───────────────────────────────────────────────

(define-public termora-bin
  ;; AUR termora-bin: Termora SSH/SFTP terminal manager; Kotlin/JVM binary distribution. votes=2
  ;; Source: https://github.com/TermoraDev/termora/releases
  ;; NEEDS_RECIPE_DESIGN; JVM binary wrapper recipe pending
  (package (inherit iwd) (name "termora-bin")))

;;; ── mandelbulber2 ─────────────────────────────────────────────

(define-public mandelbulber2
  ;; AUR mandelbulber2: 3D fractal renderer Mandelbulber 2; Qt5/OpenCL/GLSL. votes=14
  ;; Source: https://github.com/buddhi1980/mandelbulber2; cmake-build-system Qt5+OpenCL
  ;; NEEDS_RECIPE_DESIGN; cmake recipe with Qt5 + opencl + openexr deps pending
  (package (inherit iwd) (name "mandelbulber2")))

;;; ── gohome-bin ────────────────────────────────────────────────

(define-public gohome-bin
  ;; AUR gohome-bin: GoHome home automation controller binary; Go application. votes=1
  ;; Source: https://github.com/markdaws/gohome/releases
  ;; NEEDS_RECIPE_DESIGN; Go binary wrapper recipe pending; low-votes package
  (package (inherit ripgrep) (name "gohome-bin")))

;;; ── mt7902-bluetooth-dkms-git ─────────────────────────────────

(define-public mt7902-bluetooth-dkms-git
  ;; AUR mt7902-bluetooth-dkms-git: DKMS kernel module for MediaTek MT7902 Bluetooth chipset. votes=1
  ;; Source: https://github.com/mt7902-dkms/mt7902-bt.git
  ;; NEEDS_RECIPE_DESIGN; dkms linux-module-build-system recipe pending; low-votes
  (package (inherit iwd) (name "mt7902-bluetooth-dkms-git")))

;;; ── whisparr-eros ─────────────────────────────────────────────

(define-public whisparr-eros
  ;; AUR whisparr-eros: Whisparr Eros branch media manager for adult content libraries; .NET service. votes=1
  ;; Source: https://github.com/whisparr/whisparr/releases; .NET binary
  ;; NEEDS_RECIPE_DESIGN; .NET binary wrapper recipe pending
  (package (inherit iwd) (name "whisparr-eros")))

;;; ── expandrive-bin ────────────────────────────────────────────

(define-public expandrive-bin
  ;; AUR expandrive-bin: ExpanDrive cloud storage client (Google Drive/S3/etc); proprietary binary. votes=9
  ;; Source: https://www.expandrive.com/download; proprietary
  ;; NEEDS_RECIPE_DESIGN + LICENSE_REVIEW_NEEDED; proprietary commercial; redistribution terms require review
  (package (inherit iwd) (name "expandrive-bin")))

;;; ── git-standup ───────────────────────────────────────────────

(define-public git-standup
  ;; AUR git-standup: CLI tool to recall your git commits from the last working day; shell/Go. votes=2
  ;; Source: https://github.com/kamranahmedse/git-standup
  ;; NEEDS_RECIPE_DESIGN; shell-script install or go-build-system recipe pending
  (package (inherit ripgrep) (name "git-standup")))

;;; ── mago-bin ──────────────────────────────────────────────────

(define-public mago-bin
  ;; AUR mago-bin: Mago binary application; upstream details require AUR PKGBUILD audit. votes=1
  ;; Source: upstream TBD
  ;; NEEDS_RECIPE_DESIGN; upstream source URL requires AUR PKGBUILD review; low-votes
  (package (inherit iwd) (name "mago-bin")))

;;; ── addwater ──────────────────────────────────────────────────

(define-public addwater
  ;; AUR addwater: GNOME app to apply Firefox CSS user-chrome themes; Python/GTK4. votes=2
  ;; Source: https://github.com/largestgithubusernamedave/AddWater; python-build-system
  ;; NEEDS_RECIPE_DESIGN; python-build-system + GTK4 recipe pending
  (package (inherit iwd) (name "addwater")))

;;; ── fftw-amd ──────────────────────────────────────────────────

(define-public fftw-amd
  ;; AUR fftw-amd: FFTW variant with AMD AOCL optimizations (AOCL-FFTW); cmake build. votes=7
  ;; Source: https://github.com/amd/aocl-fftw; cmake-build-system
  ;; NEEDS_RECIPE_DESIGN; cmake recipe pending; Guix has fftw 3.3.10 (standard); AMD variant requires AOCL compiler flags
  (package (inherit iwd) (name "fftw-amd")))

;;; ── phantomjs-git ─────────────────────────────────────────────

(define-public phantomjs-git
  ;; AUR phantomjs-git: PhantomJS headless browser (upstream abandoned 2018); git source qmake/WebKit build. votes=3
  ;; Source: https://github.com/ariya/phantomjs.git; qmake/WebKit
  ;; NEEDS_RECIPE_DESIGN; complex WebKit build; upstream abandoned 2018; assess viability before investing recipe effort
  (package (inherit iwd) (name "phantomjs-git")))

;;; ── dotr-bin ──────────────────────────────────────────────────

(define-public dotr-bin
  ;; AUR dotr-bin: Dotfile manager binary distribution; Rust application. votes=1
  ;; Source: https://github.com/lappis-unb/dotr/releases
  ;; NEEDS_RECIPE_DESIGN; binary wrapper or cargo recipe pending; low-votes
  (package (inherit ripgrep) (name "dotr-bin")))

;;; ── reticulum-meshchat-bin ────────────────────────────────────

(define-public reticulum-meshchat-bin
  ;; AUR reticulum-meshchat-bin: MeshChat binary for the Reticulum network stack; Python/Electron hybrid. votes=1
  ;; Source: https://github.com/liamcottle/reticulum-meshchat/releases
  ;; NEEDS_RECIPE_DESIGN; binary wrapper recipe pending; low-votes
  (package (inherit iwd) (name "reticulum-meshchat-bin")))

;;; ── godot-preview-bin ─────────────────────────────────────────

(define-public godot-preview-bin
  ;; AUR godot-preview-bin: Godot Engine preview/nightly binary; official pre-release distribution. votes=1
  ;; Source: https://github.com/godotengine/godot/releases (pre-release)
  ;; NEEDS_RECIPE_DESIGN; binary wrapper recipe pending; Guix godot covers stable releases; nightly wrapper recipe needed
  (package (inherit iwd) (name "godot-preview-bin")))

