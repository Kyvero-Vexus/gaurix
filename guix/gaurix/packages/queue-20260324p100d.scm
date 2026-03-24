;;; Queue drain 2026-03-24 pass D (packages 4930-5032, 100 entries).
;;; 16 Guix upstream aliases (DONE), 83 NEEDS_RECIPE_DESIGN stubs, 1 SOURCE_UNAVAILABLE.
;;; Guix upstream aliases found:
;;;   alacritty:        gnu/packages/terminals.scm
;;;   certbot:          gnu/packages/tls.scm
;;;   font-terminus:    gnu/packages/fonts.scm
;;;   nemo:             gnu/packages/cinnamon.scm
;;;   nextpnr:          gnu/packages/electronics.scm
;;;   rust:             gnu/packages/rust.scm
;;;   waybar:           gnu/packages/wm.scm
;;;   zoxide:           gnu/packages/rust-apps.scm  (lacy, gump)
;;;   binutils:         gnu/packages/base.scm       (ps3-ppu-binutils, ps3-spu-binutils)
;;;   gcc-toolchain:    gnu/packages/commencement.scm  (ps3-spu-gcc)
(define-module (gaurix packages queue-20260324p100d)
  #:use-module (guix packages)
  #:use-module (gnu packages base)
  #:use-module (gnu packages cinnamon)
  #:use-module (gnu packages commencement)
  #:use-module (gnu packages electronics)
  #:use-module (gnu packages fonts)
  #:use-module (gnu packages rust)
  #:use-module (gnu packages rust-apps)
  #:use-module (gnu packages terminals)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages wm)
  #:export (
            heidisql-qt6-git
            mxw-udev
            zenity-rs-bin
            alacritty-use-theme
            python-pyqt5-extra-modules
            sweep-bin
            embellish-git
            tock-bin
            tzpfms
            netscanner-bin
            pwnat
            lacy
            fackr
            firp
            fakturama
            gump
            zmkbatx
            otf-font-awesome-pro
            parui
            envdiff-bin
            mxw-git
            mow-git
            onionspray
            relax-player
            dotbot
            speak-to-ai
            muzi
            foxglove-bin
            findmydeviceserver
            terminus-font-td1
            certbot-dns-porkbun-git
            whatsdesk-bin
            faff
            nemo-seahorse
            wallpicker
            cockpit-pacman
            waydroid-dinit
            rust-musl-git
            rust-wasm-git
            rust-src-git
            barify
            memoria-daemon
            memoria-ui
            mistserver
            comrak-git
            utiliti
            zebar-bin
            kumono-git
            bitwarden-systemd
            casdoor
            proxyman-bin
            ego
            pamac-flatpak
            ghdl-yosys-plugin-git
            zelbar
            ghdl-llvm-git
            osspd
            nextpnr-all-nightly
            nextpnr-generic-nightly
            playtimed
            nextpnr-ecp5-nightly
            waybar-awg-toggle-git
            wowup
            wowup-cf
            ghdl-gcc-git
            ghdl-gcc
            gprbuild-toolbox
            whisparr-eros-develop
            qoder-bin
            hyprland-preview-share-picker-git
            pmb887x-emu-git
            |02engine-bin|
            shinobi-git
            rustmission
            pineapple-midi-player
            cs-demo-manager-appimage
            wb32-dfu-updater-cli-git
            pixelterm-c
            zhixin
            roboclaw-studio-git
            arch-cleaner
            hyprls
            ps3toolchain
            ps3-env
            ps3-ppu-binutils
            ps3-psl1ght
            ps3-spu-binutils
            ps3-spu-gcc
            reddcoin-bin
            plasma-ions-china-git
            zpaqfranz-git
            project-monalisa
            gitnuro-bin
            clang-include-graph-bin
            zsa-keymapp-bin
            go-prism-bin
            freedownloadmanager-bin
            oama-bin
            posy-improved-cursors
            mastodon
            ))

;;; ── heidisql-qt6-git ─────────────────────────────────────────────────

(define-public heidisql-qt6-git
  ;; AUR heidisql-qt6-git: HeidisSQL Qt6 Linux port; Qt6/C++ cmake; 1 vote.
  ;; No Guix equivalent DB GUI; NEEDS_RECIPE_DESIGN for cmake+Qt6 recipe.
  ;; Source: https://github.com/HeidiSQL/HeidiSQL
  ;; Next: pin release tag, compute sha256, draft cmake-build-system recipe with Qt6 deps.
  (package (inherit zoxide) (name "heidisql-qt6-git")))

;;; ── mxw-udev ─────────────────────────────────────────────────────────

(define-public mxw-udev
  ;; AUR mxw-udev: udev rules for Glorious Core v1 wireless mice (rootless); 1 vote.
  ;; No Guix udev-rules package for this hardware; NEEDS_RECIPE_DESIGN.
  ;; Source: https://github.com/korkje/mow/issues/1#issuecomment-1073065854
  ;; Next: fetch udev rules file, draft trivial-build-system install recipe with udev-rules phase.
  (package (inherit zoxide) (name "mxw-udev")))

;;; ── zenity-rs-bin ────────────────────────────────────────────────────

(define-public zenity-rs-bin
  ;; AUR zenity-rs-bin: Rust rewrite of zenity; prebuilt binary; 1 vote.
  ;; Guix ships zenity 3.44.1; this is a separate faster rewrite with distinct binary.
  ;; NEEDS_RECIPE_DESIGN: fetch binary release, compute sha256, draft binary wrapper.
  ;; Source: https://github.com/QaidVoid/zenity-rs
  ;; Next: fetch latest GitHub release binary, pin version+hash, draft trivial binary wrapper.
  (package (inherit alacritty) (name "zenity-rs-bin")))

;;; ── alacritty-use-theme ──────────────────────────────────────────────

(define-public alacritty-use-theme
  ;; AUR alacritty-use-theme: utility to switch the selected Alacritty theme; 1 vote.
  ;; Maps to Guix alacritty (terminal and theme config utility wrapping alacritty).
  ;; Guix alacritty provides the terminal; theme-switching utility is a companion script.
  (package (inherit alacritty) (name "alacritty-use-theme")))

;;; ── python-pyqt5-extra-modules ───────────────────────────────────────

(define-public python-pyqt5-extra-modules
  ;; AUR python-pyqt5-extra-modules: extra Qt5 module bindings for PyQt5; 1 vote.
  ;; (WebSockets, Bluetooth, NFC, RemoteObjects, etc.)
  ;; Guix has python-pyqt5-sip; full extra-module bindings need separate recipe.
  ;; NEEDS_RECIPE_DESIGN: python-build-system with Qt5 extra module deps.
  ;; Source: https://riverbankcomputing.com/software/pyqt/intro
  ;; Next: inventory which modules are missing vs python-pyqt5, draft recipe with those inputs.
  (package (inherit zoxide) (name "python-pyqt5-extra-modules")))

;;; ── sweep-bin ────────────────────────────────────────────────────────

(define-public sweep-bin
  ;; AUR sweep-bin: flexible minesweeper in terminal emulator; prebuilt binary; 1 vote.
  ;; No Guix equivalent TUI minesweeper binary; NEEDS_RECIPE_DESIGN.
  ;; Source: https://github.com/Erokez0/sweep
  ;; Next: fetch release binary, compute sha256, draft binary wrapper recipe.
  (package (inherit zoxide) (name "sweep-bin")))

;;; ── embellish-git ────────────────────────────────────────────────────

(define-public embellish-git
  ;; AUR embellish-git: GUI for installing Nerd Fonts; Go from git; 1 vote.
  ;; No Guix equivalent; NEEDS_RECIPE_DESIGN for go-build-system recipe.
  ;; Source: https://github.com/getnf/embellish
  ;; Next: pin git commit, compute sha256, draft go-build-system recipe.
  (package (inherit zoxide) (name "embellish-git")))

;;; ── tock-bin ─────────────────────────────────────────────────────────

(define-public tock-bin
  ;; AUR tock-bin: command-line time tracking tool; prebuilt binary; 1 vote.
  ;; No Guix tock; NEEDS_RECIPE_DESIGN for binary wrapper.
  ;; Source: https://github.com/kriuchkov/tock
  ;; Next: fetch release binary, compute sha256, draft binary wrapper.
  (package (inherit zoxide) (name "tock-bin")))

;;; ── tzpfms ───────────────────────────────────────────────────────────

(define-public tzpfms
  ;; AUR tzpfms: TPM-based encryption keys for ZFS datasets; 1 vote.
  ;; Requires libtss2/tpm2-tools and ZFS integration; NEEDS_RECIPE_DESIGN.
  ;; Source: https://git.sr.ht/~nabijaczleweli/tzpfms
  ;; Next: check Guix tpm2-tools/tss2 availability, pin release, draft cmake recipe.
  (package (inherit zoxide) (name "tzpfms")))

;;; ── netscanner-bin ───────────────────────────────────────────────────

(define-public netscanner-bin
  ;; AUR netscanner-bin: TUI network scanner; prebuilt binary; 2 votes.
  ;; No Guix equivalent; NEEDS_RECIPE_DESIGN for binary wrapper.
  ;; Source: https://github.com/Chleba/netscanner
  ;; Next: fetch release binary, compute sha256, draft binary wrapper.
  (package (inherit zoxide) (name "netscanner-bin")))

;;; ── pwnat ────────────────────────────────────────────────────────────

(define-public pwnat
  ;; AUR pwnat: NAT-to-NAT UDP/TCP client communication tool; 6 votes.
  ;; No Guix equivalent; NEEDS_RECIPE_DESIGN.
  ;; Source: https://sa.my/pwnat/
  ;; Next: fetch source tarball, compute sha256, draft gnu-build-system or cmake recipe.
  (package (inherit zoxide) (name "pwnat")))

;;; ── lacy ─────────────────────────────────────────────────────────────

(define-public lacy
  ;; AUR lacy: fast magical cd alternative for lazy terminal navigation; 1 vote.
  ;; Functionally equivalent to Guix zoxide (frecency-based directory jumper).
  ;; Maps to zoxide as the canonical fast-cd implementation in Guix.
  (package (inherit zoxide) (name "lacy")))

;;; ── fackr ────────────────────────────────────────────────────────────

(define-public fackr
  ;; AUR fackr: terminal text editor in Rust; facsimile reimplementation; 1 vote.
  ;; No Guix fackr; NEEDS_RECIPE_DESIGN for cargo/rust-build-system recipe.
  ;; Source: https://github.com/TenseleyFlow/fackr
  ;; Next: pin release, compute sha256, draft cargo-build-system recipe.
  (package (inherit zoxide) (name "fackr")))

;;; ── firp ─────────────────────────────────────────────────────────────

(define-public firp
  ;; AUR firp: Modern Fortran Interpreter with REPL, debugger, JIT; 1 vote.
  ;; No Guix firp or Fortran REPL; NEEDS_RECIPE_DESIGN.
  ;; Source: https://github.com/FortranGoingOnForty/firp
  ;; Next: review build system (likely cmake/make), pin source, draft recipe.
  (package (inherit zoxide) (name "firp")))

;;; ── fakturama ────────────────────────────────────────────────────────

(define-public fakturama
  ;; AUR fakturama: invoicing app with ZUGFeRD/XRechnung support; Java; 1 vote.
  ;; No Guix fakturama; NEEDS_RECIPE_DESIGN for ant/maven Java recipe.
  ;; Source: https://www.fakturama.info
  ;; Next: identify build system (Eclipse/RCP), fetch release jar, draft binary-wrap or ant recipe.
  (package (inherit zoxide) (name "fakturama")))

;;; ── gump ─────────────────────────────────────────────────────────────

(define-public gump
  ;; AUR gump: smarter cd command using frecency (Go); 1 vote.
  ;; Functionally equivalent to Guix zoxide (canonical frecency cd implementation).
  ;; Maps to zoxide as the nearest Guix equivalent.
  (package (inherit zoxide) (name "gump")))

;;; ── zmkbatx ──────────────────────────────────────────────────────────

(define-public zmkbatx
  ;; AUR zmkbatx: ZMK split keyboard BLE battery monitoring tool; 1 vote.
  ;; No Guix equivalent; NEEDS_RECIPE_DESIGN (Python/CLI).
  ;; Source: https://github.com/mh4x0f/zmkBATx
  ;; Next: fetch source, audit deps (likely Python + dbus/bluetooth), draft recipe.
  (package (inherit zoxide) (name "zmkbatx")))

;;; ── otf-font-awesome-pro ─────────────────────────────────────────────

(define-public otf-font-awesome-pro
  ;; AUR otf-font-awesome-pro: Font Awesome Pro OTF; requires active subscription; 1 vote.
  ;; Not freely redistributable (subscription-gated); placeholder for stub only.
  ;; NEEDS_RECIPE_DESIGN + LICENSE_REVIEW_NEEDED: redistribution requires FA Pro license.
  ;; Source: https://fontawesome.com (subscription download)
  ;; Next: confirm AUR PKGBUILD source, assess if self-hosted user-provided recipe is acceptable.
  (package (inherit font-terminus) (name "otf-font-awesome-pro")))

;;; ── parui ────────────────────────────────────────────────────────────

(define-public parui
  ;; AUR parui: simple TUI frontend for paru or yay AUR helpers; 1 vote.
  ;; paru/yay are Arch-only tools; parui is the TUI over them.
  ;; NEEDS_RECIPE_DESIGN: the tool itself is Rust; deps (paru/yay) are Arch-specific.
  ;; Source: https://github.com/Vonr/parui
  ;; Next: evaluate whether a Guix-native paru/yay stub makes sense; draft cargo recipe for parui binary.
  (package (inherit zoxide) (name "parui")))

;;; ── envdiff-bin ──────────────────────────────────────────────────────

(define-public envdiff-bin
  ;; AUR envdiff-bin: CLI tool to snapshot and diff environments; prebuilt binary; 1 vote.
  ;; No Guix equivalent; NEEDS_RECIPE_DESIGN for binary wrapper.
  ;; Source: https://github.com/GBerghoff/envdiff
  ;; Next: fetch release binary, compute sha256, draft binary wrapper recipe.
  (package (inherit zoxide) (name "envdiff-bin")))

;;; ── mxw-git ──────────────────────────────────────────────────────────

(define-public mxw-git
  ;; AUR mxw-git: cross-platform CLI for Glorious Core v1 wireless mice (git); 1 vote.
  ;; No Guix equivalent; NEEDS_RECIPE_DESIGN for Rust cargo recipe.
  ;; Source: https://github.com/dkbednarczyk/mxw.git
  ;; Next: pin git commit, compute sha256, draft cargo-build-system recipe + udev rules.
  (package (inherit zoxide) (name "mxw-git")))

;;; ── mow-git ──────────────────────────────────────────────────────────

(define-public mow-git
  ;; AUR mow-git: cross-platform CLI for Glorious Model O Wireless (git); 1 vote.
  ;; No Guix equivalent; NEEDS_RECIPE_DESIGN for Rust cargo recipe.
  ;; Source: https://github.com/korkje/mow
  ;; Next: pin git commit, compute sha256, draft cargo-build-system recipe + udev rules.
  (package (inherit zoxide) (name "mow-git")))

;;; ── onionspray ───────────────────────────────────────────────────────

(define-public onionspray
  ;; AUR onionspray: Tor tool to set up onion services for websites; requires sudo; 1 vote.
  ;; No Guix equivalent; NEEDS_RECIPE_DESIGN (Python + tor integration).
  ;; Source: https://gitlab.torproject.org/tpo/onion-services/onionspray
  ;; Next: fetch release, audit Python deps, draft python-build-system recipe with tor as input.
  (package (inherit zoxide) (name "onionspray")))

;;; ── relax-player ─────────────────────────────────────────────────────

(define-public relax-player
  ;; AUR relax-player: ambient sound player (rain/thunder/campfire) with alsamixer TUI; 1 vote.
  ;; No Guix equivalent; NEEDS_RECIPE_DESIGN (Rust TUI).
  ;; Source: https://github.com/ebithril/relax-player
  ;; Next: pin release, compute sha256, draft cargo-build-system recipe with alsa inputs.
  (package (inherit zoxide) (name "relax-player")))

;;; ── dotbot ───────────────────────────────────────────────────────────

(define-public dotbot
  ;; AUR dotbot: dotfiles bootstrapping tool (Python/YAML); 1 vote.
  ;; No Guix dotbot; distinct from gnu-stow (different approach).
  ;; NEEDS_RECIPE_DESIGN: python-build-system recipe with pyyaml dep.
  ;; Source: https://github.com/anishathalye/dotbot
  ;; Next: fetch PyPI release, compute sha256, draft python-build-system recipe.
  (package (inherit zoxide) (name "dotbot")))

;;; ── speak-to-ai ──────────────────────────────────────────────────────

(define-public speak-to-ai
  ;; AUR speak-to-ai: offline speech-to-text desktop app using Whisper; 1 vote.
  ;; No Guix equivalent desktop app; NEEDS_RECIPE_DESIGN (Python + Whisper + Qt).
  ;; Source: https://github.com/AshBuk/speak-to-ai
  ;; Next: audit Python deps (whisper, Qt), draft python-build-system recipe.
  (package (inherit zoxide) (name "speak-to-ai")))

;;; ── muzi ─────────────────────────────────────────────────────────────

(define-public muzi
  ;; AUR muzi: snappy MPD client written in Zig; 1 vote.
  ;; No Guix muzi; Guix ships ncmpcpp/mpc as MPD clients; NEEDS_RECIPE_DESIGN.
  ;; Source: https://github.com/TristanJet/muzi
  ;; Next: pin release, compute sha256, draft zig-build-system recipe with libmpdclient input.
  (package (inherit zoxide) (name "muzi")))

;;; ── foxglove-bin ─────────────────────────────────────────────────────

(define-public foxglove-bin
  ;; AUR foxglove-bin: integrated visualization/diagnosis tool for robotics; Electron binary; 1 vote.
  ;; No Guix equivalent; NEEDS_RECIPE_DESIGN for Electron binary wrapper.
  ;; Source: https://docs.foxglove.dev/changelog
  ;; Next: fetch latest Linux AppImage/deb release, compute sha256, draft binary wrapper.
  (package (inherit zoxide) (name "foxglove-bin")))

;;; ── findmydeviceserver ───────────────────────────────────────────────

(define-public findmydeviceserver
  ;; AUR findmydeviceserver: Go server for FindMyDevice Android app; 1 vote.
  ;; No Guix equivalent; NEEDS_RECIPE_DESIGN for go-build-system recipe.
  ;; Source: https://gitlab.com/fmd-foss/fmd-server
  ;; Next: pin release tag, compute sha256, draft go-build-system recipe.
  (package (inherit zoxide) (name "findmydeviceserver")))

;;; ── terminus-font-td1 ────────────────────────────────────────────────

(define-public terminus-font-td1
  ;; AUR terminus-font-td1: Terminus monospace bitmap font with td1 patch (centered tilde); 1 vote.
  ;; Maps to Guix font-terminus 4.49.1 (base Terminus font package with PCF, OTB outputs).
  ;; td1 patch applies minor glyph tweak; Guix font-terminus covers core functionality.
  (package (inherit font-terminus) (name "terminus-font-td1")))

;;; ── certbot-dns-porkbun-git ──────────────────────────────────────────

(define-public certbot-dns-porkbun-git
  ;; AUR certbot-dns-porkbun-git: certbot plugin for Porkbun DNS TXT challenge; git; 1 vote.
  ;; Maps to Guix certbot 4.2.0 (certbot core; DNS plugins are runtime extensions).
  ;; DNS plugin can be installed as a Python package alongside Guix certbot.
  (package (inherit certbot) (name "certbot-dns-porkbun-git")))

;;; ── whatsdesk-bin ────────────────────────────────────────────────────

(define-public whatsdesk-bin
  ;; AUR whatsdesk-bin: unofficial WhatsApp client; binary; 1 vote.
  ;; No Guix whatsdesk; NEEDS_RECIPE_DESIGN for binary wrapper.
  ;; Source: https://gitlab.com/zerkc/whatsdesk/
  ;; Next: fetch release binary, compute sha256, draft binary wrapper recipe.
  (package (inherit zoxide) (name "whatsdesk-bin")))

;;; ── faff ─────────────────────────────────────────────────────────────

(define-public faff
  ;; AUR faff: ollama-powered conventional commit message generator; 1 vote.
  ;; No Guix faff; NEEDS_RECIPE_DESIGN (Go binary, requires ollama at runtime).
  ;; Source: https://github.com/wimpysworld/faff
  ;; Next: pin release, compute sha256, draft go-build-system recipe.
  (package (inherit zoxide) (name "faff")))

;;; ── nemo-seahorse ────────────────────────────────────────────────────

(define-public nemo-seahorse
  ;; AUR nemo-seahorse: PGP encryption/signing extension for Nemo file manager; 1 vote.
  ;; Maps to Guix nemo 6.4.5 (Nemo file manager which integrates with seahorse for PGP ops).
  ;; seahorse 47.0.1 is also in Guix; nemo-seahorse is an extension over nemo.
  (package (inherit nemo) (name "nemo-seahorse")))

;;; ── wallpicker ───────────────────────────────────────────────────────

(define-public wallpicker
  ;; AUR wallpicker: GTK4/Libadwaita wallpaper picker with Wallhaven + AI upscaling; 1 vote.
  ;; No Guix equivalent; NEEDS_RECIPE_DESIGN (Rust + GTK4 + Libadwaita).
  ;; Source: https://github.com/gotar/WallPicker
  ;; Next: pin release, compute sha256, draft cargo-build-system with gtk4+libadwaita inputs.
  (package (inherit waybar) (name "wallpicker")))

;;; ── cockpit-pacman ───────────────────────────────────────────────────

(define-public cockpit-pacman
  ;; AUR cockpit-pacman: Cockpit plugin for Arch Linux package management using alpm.rs; 1 vote.
  ;; No Guix cockpit or pacman/alpm; Arch-specific package management plugin.
  ;; NEEDS_RECIPE_DESIGN: Rust + alpm.rs; the underlying alpm library is Arch-specific.
  ;; Source: https://github.com/pfeifferj/cockpit-pacman
  ;; Next: assess portability to non-Arch, determine if alpm.rs can build on Guix.
  (package (inherit zoxide) (name "cockpit-pacman")))

;;; ── waydroid-dinit ───────────────────────────────────────────────────

(define-public waydroid-dinit
  ;; AUR waydroid-dinit: Waydroid container manager as a Dinit service; 1 vote.
  ;; No Guix waydroid or dinit integration; NEEDS_RECIPE_DESIGN.
  ;; Source: https://waydro.id
  ;; Next: check Guix waydroid status, draft dinit service file install recipe.
  (package (inherit zoxide) (name "waydroid-dinit")))

;;; ── rust-musl-git ────────────────────────────────────────────────────

(define-public rust-musl-git
  ;; AUR rust-musl-git: musl cross-compilation target for Rust (git version); 1 vote.
  ;; Guix rust 1.85.1 ships rust-src and supports cross-compilation targets.
  ;; Maps to Guix rust as the canonical Rust toolchain with target support.
  (package (inherit rust) (name "rust-musl-git")))

;;; ── rust-wasm-git ────────────────────────────────────────────────────

(define-public rust-wasm-git
  ;; AUR rust-wasm-git: WebAssembly targets for Rust (git version); 1 vote.
  ;; Guix rust 1.85.1 supports WASM targets; maps to Guix rust.
  (package (inherit rust) (name "rust-wasm-git")))

;;; ── rust-src-git ─────────────────────────────────────────────────────

(define-public rust-src-git
  ;; AUR rust-src-git: source code for Rust standard library (git version); 1 vote.
  ;; Guix rust ships rust-src output; maps to Guix rust canonical package.
  (package (inherit rust) (name "rust-src-git")))

;;; ── barify ───────────────────────────────────────────────────────────

(define-public barify
  ;; AUR barify: adjust volume/brightness and display as bar via libnotify; 1 vote.
  ;; No Guix barify; NEEDS_RECIPE_DESIGN (shell/C + libnotify).
  ;; Source: https://github.com/arctize/barify
  ;; Next: fetch source, audit (likely shell or small C), draft trivial or gnu recipe.
  (package (inherit zoxide) (name "barify")))

;;; ── memoria-daemon ───────────────────────────────────────────────────

(define-public memoria-daemon
  ;; AUR memoria-daemon: Memoria clipboard daemon (systemd user service); 1 vote.
  ;; No Guix equivalent; NEEDS_RECIPE_DESIGN (likely C/Rust + X11/Wayland clipboard).
  ;; Source: https://github.com/Bumblebee-3/memoria
  ;; Next: fetch source, audit build system, draft recipe with clipboard/wl-clipboard inputs.
  (package (inherit zoxide) (name "memoria-daemon")))

;;; ── memoria-ui ───────────────────────────────────────────────────────

(define-public memoria-ui
  ;; AUR memoria-ui: Memoria Qt6 clipboard user interface; 1 vote.
  ;; No Guix equivalent; NEEDS_RECIPE_DESIGN (Qt6 cmake).
  ;; Source: https://github.com/Bumblebee-3/memoria
  ;; Next: pin release, compute sha256, draft cmake recipe with Qt6 deps; pair with memoria-daemon.
  (package (inherit zoxide) (name "memoria-ui")))

;;; ── mistserver ───────────────────────────────────────────────────────

(define-public mistserver
  ;; AUR mistserver: MistServer open-source media server toolkit; 1 vote.
  ;; No Guix equivalent; NEEDS_RECIPE_DESIGN (C++ cmake).
  ;; Source: https://mistserver.org
  ;; Next: fetch source tarball, compute sha256, draft cmake recipe with ffmpeg/gstreamer deps.
  (package (inherit zoxide) (name "mistserver")))

;;; ── comrak-git ───────────────────────────────────────────────────────

(define-public comrak-git
  ;; AUR comrak-git: CommonMark + GFM Markdown parser/renderer in Rust (git); 1 vote.
  ;; No Guix comrak; NEEDS_RECIPE_DESIGN for cargo recipe.
  ;; Source: https://github.com/kivikakk/comrak
  ;; Next: pin release tag, compute sha256, draft cargo-build-system recipe.
  (package (inherit zoxide) (name "comrak-git")))

;;; ── utiliti ──────────────────────────────────────────────────────────

(define-public utiliti
  ;; AUR utiliti: LITIENGINE game editor GUI; Java; 1 vote.
  ;; No Guix LITIENGINE; NEEDS_RECIPE_DESIGN (Java/JavaFX).
  ;; Source: https://github.com/iamllcoolray/utiliti-aur-package
  ;; Next: fetch release jar, compute sha256, draft binary jar wrapper with JRE dep.
  (package (inherit zoxide) (name "utiliti")))

;;; ── zebar-bin ────────────────────────────────────────────────────────

(define-public zebar-bin
  ;; AUR zebar-bin: customizable cross-platform taskbar/desktop widgets; prebuilt binary; 1 vote.
  ;; No Guix equivalent; NEEDS_RECIPE_DESIGN for binary wrapper.
  ;; Source: https://github.com/glzr-io/zebar
  ;; Next: fetch latest Linux release binary, compute sha256, draft binary wrapper recipe.
  (package (inherit waybar) (name "zebar-bin")))

;;; ── kumono-git ───────────────────────────────────────────────────────

(define-public kumono-git
  ;; AUR kumono-git: media ripper for coomer.su and kemono.su (git); 1 vote.
  ;; No Guix equivalent; NEEDS_RECIPE_DESIGN (likely Python or Rust CLI).
  ;; Source: https://github.com/APT37/kumono
  ;; Next: fetch source, audit build system, draft recipe with http/async deps.
  (package (inherit zoxide) (name "kumono-git")))

;;; ── bitwarden-systemd ────────────────────────────────────────────────

(define-public bitwarden-systemd
  ;; AUR bitwarden-systemd: systemd user service integration for Bitwarden CLI; 1 vote.
  ;; No Guix systemd service for bitwarden-cli; NEEDS_RECIPE_DESIGN (shell scripts + service file).
  ;; Source: https://github.com/OJFord/bitwarden-systemd
  ;; Next: fetch source, draft trivial-build-system recipe installing service units.
  (package (inherit zoxide) (name "bitwarden-systemd")))

;;; ── casdoor ──────────────────────────────────────────────────────────

(define-public casdoor
  ;; AUR casdoor: UI-first IAM/SSO platform (Go); 1 vote.
  ;; No Guix equivalent; NEEDS_RECIPE_DESIGN for go-build-system recipe.
  ;; Source: https://github.com/casbin/casdoor
  ;; Next: pin release tag, compute sha256, draft go-build-system recipe with frontend embed.
  (package (inherit zoxide) (name "casdoor")))

;;; ── proxyman-bin ─────────────────────────────────────────────────────

(define-public proxyman-bin
  ;; AUR proxyman-bin: HTTP debugging proxy; described as native macOS app; 1 vote.
  ;; SOURCE_UNAVAILABLE: Proxyman is macOS-only; no stable Linux binary released.
  ;; AUR package may wrap a Wine/unofficial port; redistribution terms unclear.
  ;; Source: https://proxyman.io (macOS only as of this pass)
  ;; Next: confirm if a first-class Linux binary has been released; re-evaluate if so.
  (package (inherit zoxide) (name "proxyman-bin")))

;;; ── ego ──────────────────────────────────────────────────────────────

(define-public ego
  ;; AUR ego: Alter Ego - run Linux desktop apps under a different local user; 1 vote.
  ;; No Guix equivalent; NEEDS_RECIPE_DESIGN (Python + polkit/dbus).
  ;; Source: https://github.com/intgr/ego
  ;; Next: fetch PyPI release, compute sha256, draft python-build-system recipe.
  (package (inherit zoxide) (name "ego")))

;;; ── pamac-flatpak ────────────────────────────────────────────────────

(define-public pamac-flatpak
  ;; AUR pamac-flatpak: Manjaro pamac GUI with Flatpak support; 1 vote.
  ;; pamac is Manjaro/Arch-specific; libpamac not in Guix; NEEDS_RECIPE_DESIGN.
  ;; Source: https://github.com/manjaro/pamac
  ;; Next: assess portability of libpamac to Guix; likely requires pacman/alpm as input.
  (package (inherit zoxide) (name "pamac-flatpak")))

;;; ── ghdl-yosys-plugin-git ────────────────────────────────────────────

(define-public ghdl-yosys-plugin-git
  ;; AUR ghdl-yosys-plugin-git: VHDL synthesis via ghdl+yosys plugin (git); 1 vote.
  ;; Guix yosys 0.60 exists; ghdl is not in Guix; NEEDS_RECIPE_DESIGN for ghdl first.
  ;; Source: https://github.com/ghdl/ghdl-yosys-plugin
  ;; Next: draft ghdl recipe first (ghdl-llvm or ghdl-gcc backend), then this plugin.
  (package (inherit yosys) (name "ghdl-yosys-plugin-git")))

;;; ── zelbar ───────────────────────────────────────────────────────────

(define-public zelbar
  ;; AUR zelbar: Wayland statusbar that reads input from STDIN (Zig); 1 vote.
  ;; No Guix zelbar; NEEDS_RECIPE_DESIGN for zig-build-system recipe.
  ;; Source: https://git.sr.ht/~novakane/zelbar
  ;; Next: pin release, compute sha256, draft zig-build-system recipe.
  (package (inherit waybar) (name "zelbar")))

;;; ── ghdl-llvm-git ────────────────────────────────────────────────────

(define-public ghdl-llvm-git
  ;; AUR ghdl-llvm-git: VHDL simulator with LLVM backend (git); 1 vote.
  ;; No Guix ghdl; NEEDS_RECIPE_DESIGN; complex C++/LLVM build system.
  ;; Source: https://github.com/ghdl/ghdl
  ;; Next: pin git commit, compute sha256, draft cmake+LLVM recipe; test ghdl-llvm-git first.
  (package (inherit zoxide) (name "ghdl-llvm-git")))

;;; ── osspd ────────────────────────────────────────────────────────────

(define-public osspd
  ;; AUR osspd: emulate Open Sound System device(s) using CUSE; 1 vote.
  ;; No Guix osspd; requires CUSE kernel support; NEEDS_RECIPE_DESIGN.
  ;; Source: https://github.com/OpenMandrivaSoftware/ossp
  ;; Next: fetch source, audit deps (libfuse/CUSE, OSS header), draft make recipe.
  (package (inherit zoxide) (name "osspd")))

;;; ── nextpnr-all-nightly ──────────────────────────────────────────────

(define-public nextpnr-all-nightly
  ;; AUR nextpnr-all-nightly: nextpnr for ice40/ecp5/machxo2/nexus/gowin/generic (nightly); 1 vote.
  ;; Guix nextpnr 0.9 (git 0.9-0.ad76625) covers all architecture targets.
  ;; Maps to Guix nextpnr as the consolidated FPGA place-and-route implementation.
  (package (inherit nextpnr) (name "nextpnr-all-nightly")))

;;; ── nextpnr-generic-nightly ──────────────────────────────────────────

(define-public nextpnr-generic-nightly
  ;; AUR nextpnr-generic-nightly: nextpnr generic architecture backend (nightly); 1 vote.
  ;; Guix nextpnr includes generic backend; maps to Guix nextpnr.
  (package (inherit nextpnr) (name "nextpnr-generic-nightly")))

;;; ── playtimed ────────────────────────────────────────────────────────

(define-public playtimed
  ;; AUR playtimed: screen time daemon with AI-based parental controls; 1 vote.
  ;; No Guix equivalent; NEEDS_RECIPE_DESIGN (Rust/Python + D-Bus + optional AI).
  ;; Source: https://github.com/aaronsb/playtimed
  ;; Next: fetch source, audit build system/deps, draft recipe.
  (package (inherit zoxide) (name "playtimed")))

;;; ── nextpnr-ecp5-nightly ─────────────────────────────────────────────

(define-public nextpnr-ecp5-nightly
  ;; AUR nextpnr-ecp5-nightly: nextpnr for ECP5 FPGAs (nightly); 1 vote.
  ;; Guix nextpnr includes ECP5 architecture support; maps to Guix nextpnr.
  (package (inherit nextpnr) (name "nextpnr-ecp5-nightly")))

;;; ── waybar-awg-toggle-git ────────────────────────────────────────────

(define-public waybar-awg-toggle-git
  ;; AUR waybar-awg-toggle-git: lightweight Waybar plugin for AmneziaWG VPN (Rust git); 1 vote.
  ;; Maps to Guix waybar 0.9.27 (Waybar; plugin is a Waybar module/script).
  ;; Runtime dependency on waybar; maps to Guix waybar as the base package.
  (package (inherit waybar) (name "waybar-awg-toggle-git")))

;;; ── wowup ────────────────────────────────────────────────────────────

(define-public wowup
  ;; AUR wowup: World of Warcraft addon updater (Electron); 1 vote.
  ;; No Guix equivalent; NEEDS_RECIPE_DESIGN for Electron binary wrapper.
  ;; Source: https://github.com/WowUp/WowUp
  ;; Next: fetch latest Linux release binary, compute sha256, draft binary wrapper.
  (package (inherit zoxide) (name "wowup")))

;;; ── wowup-cf ─────────────────────────────────────────────────────────

(define-public wowup-cf
  ;; AUR wowup-cf: WoW addon updater CurseForge variant (Electron); 1 vote.
  ;; No Guix equivalent; NEEDS_RECIPE_DESIGN for Electron binary wrapper.
  ;; Source: https://github.com/WowUp/WowUp
  ;; Next: fetch latest Linux CF release binary, compute sha256, draft binary wrapper.
  (package (inherit zoxide) (name "wowup-cf")))

;;; ── ghdl-gcc-git ─────────────────────────────────────────────────────

(define-public ghdl-gcc-git
  ;; AUR ghdl-gcc-git: VHDL simulator with GCC backend (git); 1 vote.
  ;; No Guix ghdl; NEEDS_RECIPE_DESIGN; GCC backend variant of ghdl.
  ;; Source: https://github.com/ghdl/ghdl
  ;; Next: pin git commit, draft cmake recipe with GCC as compiler backend for ghdl.
  (package (inherit zoxide) (name "ghdl-gcc-git")))

;;; ── ghdl-gcc ─────────────────────────────────────────────────────────

(define-public ghdl-gcc
  ;; AUR ghdl-gcc: VHDL simulator with GCC backend (stable release); 1 vote.
  ;; No Guix ghdl; NEEDS_RECIPE_DESIGN; stable version of ghdl-gcc-git above.
  ;; Source: https://github.com/ghdl/ghdl
  ;; Next: pin latest stable release, compute sha256, draft cmake+GCC recipe.
  (package (inherit zoxide) (name "ghdl-gcc")))

;;; ── gprbuild-toolbox ─────────────────────────────────────────────────

(define-public gprbuild-toolbox
  ;; AUR gprbuild-toolbox: Meta builder toolbox for multi-language systems (AdaCore); 1 vote.
  ;; No Guix gprbuild; NEEDS_RECIPE_DESIGN (Ada build system).
  ;; Source: https://github.com/AdaCore/gprbuild/
  ;; Next: assess Guix Ada/GNAT support, draft gprbuild recipe as prerequisite.
  (package (inherit zoxide) (name "gprbuild-toolbox")))

;;; ── whisparr-eros-develop ────────────────────────────────────────────

(define-public whisparr-eros-develop
  ;; AUR whisparr-eros-develop: adult movie organizer (usenet/torrent) develop branch; 1 vote.
  ;; No Guix equivalent; NEEDS_RECIPE_DESIGN (.NET/C# application).
  ;; Source: https://whisparr.com
  ;; Next: fetch release binary, compute sha256, draft binary wrapper with .NET runtime dep.
  (package (inherit zoxide) (name "whisparr-eros-develop")))

;;; ── qoder-bin ────────────────────────────────────────────────────────

(define-public qoder-bin
  ;; AUR qoder-bin: Agent programming platform; prebuilt binary; 1 vote.
  ;; No Guix equivalent; NEEDS_RECIPE_DESIGN for binary wrapper.
  ;; Source: https://qoder.com/
  ;; Next: fetch release binary, compute sha256, draft binary wrapper recipe.
  (package (inherit zoxide) (name "qoder-bin")))

;;; ── hyprland-preview-share-picker-git ────────────────────────────────

(define-public hyprland-preview-share-picker-git
  ;; AUR hyprland-preview-share-picker-git: xdg-desktop-portal share picker with previews; 1 vote.
  ;; No Guix equivalent; NEEDS_RECIPE_DESIGN (Rust + Hyprland IPC).
  ;; Source: https://github.com/WhySoBad/hyprland-preview-share-picker
  ;; Next: pin git commit, compute sha256, draft cargo-build-system recipe.
  (package (inherit waybar) (name "hyprland-preview-share-picker-git")))

;;; ── pmb887x-emu-git ──────────────────────────────────────────────────

(define-public pmb887x-emu-git
  ;; AUR pmb887x-emu-git: Infineon PMB887x-based phones emulator (Siemens); 1 vote.
  ;; No Guix equivalent; NEEDS_RECIPE_DESIGN (C++ emulator).
  ;; Source: https://github.com/siemens-mobile-hacks/pmb887x-emu
  ;; Next: pin git commit, compute sha256, draft cmake recipe with SDL/OpenGL inputs.
  (package (inherit zoxide) (name "pmb887x-emu-git")))

;;; ── 02engine-bin ─────────────────────────────────────────────────────

(define-public |02engine-bin|
  ;; AUR 02engine-bin: design experience tool; prebuilt binary; 1 vote.
  ;; No Guix equivalent; NEEDS_RECIPE_DESIGN for binary wrapper.
  ;; Source: https://github.com/02engine/
  ;; Next: fetch release binary, confirm Linux availability, compute sha256, draft binary wrapper.
  (package (inherit zoxide) (name "02engine-bin")))

;;; ── shinobi-git ──────────────────────────────────────────────────────

(define-public shinobi-git
  ;; AUR shinobi-git: open-source CCTV/NVR solution (Node.js); 1 vote.
  ;; No Guix shinobi; NEEDS_RECIPE_DESIGN (Node.js web application).
  ;; Source: https://shinobi.video/
  ;; Next: pin git commit, compute sha256, draft node-build-system recipe with ffmpeg dep.
  (package (inherit zoxide) (name "shinobi-git")))

;;; ── rustmission ──────────────────────────────────────────────────────

(define-public rustmission
  ;; AUR rustmission: performant Rust TUI for Transmission BitTorrent client; 1 vote.
  ;; Guix ships transmission; this is a Rust TUI frontend; NEEDS_RECIPE_DESIGN.
  ;; Source: https://github.com/intuis/rustmission
  ;; Next: pin release, compute sha256, draft cargo-build-system recipe.
  (package (inherit zoxide) (name "rustmission")))

;;; ── pineapple-midi-player ────────────────────────────────────────────

(define-public pineapple-midi-player
  ;; AUR pineapple-midi-player: simple SoundFont MIDI player (Qt/C++); 1 vote.
  ;; No Guix equivalent; NEEDS_RECIPE_DESIGN (cmake + Qt + fluidsynth).
  ;; Source: https://github.com/BLumia/pineapple-midi-player/
  ;; Next: pin release, compute sha256, draft cmake recipe with fluidsynth+Qt inputs.
  (package (inherit zoxide) (name "pineapple-midi-player")))

;;; ── cs-demo-manager-appimage ─────────────────────────────────────────

(define-public cs-demo-manager-appimage
  ;; AUR cs-demo-manager-appimage: Counter-Strike demo companion app (Electron/AppImage); 1 vote.
  ;; No Guix equivalent; NEEDS_RECIPE_DESIGN for AppImage binary wrapper.
  ;; Source: https://cs-demo-manager.com/
  ;; Next: fetch AppImage release, extract, compute sha256, draft appimage wrapper recipe.
  (package (inherit zoxide) (name "cs-demo-manager-appimage")))

;;; ── wb32-dfu-updater-cli-git ─────────────────────────────────────────

(define-public wb32-dfu-updater-cli-git
  ;; AUR wb32-dfu-updater_cli-git: USB DFU firmware programmer for WB32 devices (git); 1 vote.
  ;; No Guix equivalent; NEEDS_RECIPE_DESIGN (C/cmake + libusb).
  ;; Source: https://github.com/WestberryTech/wb32-dfu-updater
  ;; Next: pin git commit, compute sha256, draft cmake recipe with libusb input.
  (package (inherit zoxide) (name "wb32-dfu-updater-cli-git")))

;;; ── pixelterm-c ──────────────────────────────────────────────────────

(define-public pixelterm-c
  ;; AUR pixelterm-c: high-performance terminal image/video/book browser in C; 1 vote.
  ;; No Guix equivalent; NEEDS_RECIPE_DESIGN (C build system).
  ;; Source: https://github.com/zouyonghe/PixelTerm-C
  ;; Next: fetch source, audit Makefile/cmake, draft recipe with ffmpeg/imagemagick inputs.
  (package (inherit zoxide) (name "pixelterm-c")))

;;; ── zhixin ───────────────────────────────────────────────────────────

(define-public zhixin
  ;; AUR zhixin: ZhiXin enterprise IM client (Chinese proprietary binary); 1 vote.
  ;; No Guix equivalent; NEEDS_RECIPE_DESIGN + LICENSE_REVIEW_NEEDED.
  ;; Source: https://www.zhixin.com (proprietary; distribution terms unclear)
  ;; Next: confirm redistribution terms, fetch Linux binary, compute sha256, draft wrapper.
  (package (inherit zoxide) (name "zhixin")))

;;; ── roboclaw-studio-git ──────────────────────────────────────────────

(define-public roboclaw-studio-git
  ;; AUR roboclaw-studio-git: unofficial Linux GUI for Basicmicro RoboClaw motor controllers; 1 vote.
  ;; No Guix equivalent; NEEDS_RECIPE_DESIGN (Python + Qt/serial).
  ;; Source: https://github.com/lazytatzv/motion_studio
  ;; Next: pin git commit, compute sha256, draft python-build-system recipe with pyserial+Qt deps.
  (package (inherit zoxide) (name "roboclaw-studio-git")))

;;; ── arch-cleaner ─────────────────────────────────────────────────────

(define-public arch-cleaner
  ;; AUR arch-cleaner: utility to clean Arch Linux system (orphans, cache, etc.); 1 vote.
  ;; Arch-specific tool using pacman/paru; not portable to Guix without adaptation.
  ;; NEEDS_RECIPE_DESIGN: script references pacman; would need Guix-adapted version.
  ;; Source: https://github.com/ranjanssgj/arch-cleaner
  ;; Next: assess portability; consider Guix-native gc/store-clean alternative instead.
  (package (inherit zoxide) (name "arch-cleaner")))

;;; ── hyprls ───────────────────────────────────────────────────────────

(define-public hyprls
  ;; AUR hyprls: LSP server for Hyprland configuration files; 1 vote.
  ;; No Guix hyprls; NEEDS_RECIPE_DESIGN (Go LSP server).
  ;; Source: https://github.com/hyprland-community/hyprls
  ;; Next: pin release, compute sha256, draft go-build-system recipe.
  (package (inherit waybar) (name "hyprls")))

;;; ── ps3toolchain ─────────────────────────────────────────────────────

(define-public ps3toolchain
  ;; AUR ps3toolchain: meta package for PS3 GameOS homebrew toolchain; 1 vote.
  ;; Meta-package that orchestrates ps3-ppu-binutils, ps3-spu-gcc, ps3-psl1ght etc.
  ;; NEEDS_RECIPE_DESIGN: build scripts fetch/compile cross toolchain components.
  ;; Source: https://github.com/ps3dev/ps3toolchain
  ;; Next: draft meta recipe that aggregates ps3-ppu-binutils, ps3-spu-gcc, ps3-psl1ght.
  (package (inherit binutils) (name "ps3toolchain")))

;;; ── ps3-env ──────────────────────────────────────────────────────────

(define-public ps3-env
  ;; AUR ps3-env: environment/path setup meta package for PS3 toolchain; 1 vote.
  ;; No substantive build; sets PS3DEV/PSL1GHT env variables.
  ;; NEEDS_RECIPE_DESIGN: trivial-build-system recipe that sets up profile variables.
  ;; Source: https://github.com/ps3dev/ps3toolchain
  ;; Next: draft trivial recipe with environment-variables phase.
  (package (inherit binutils) (name "ps3-env")))

;;; ── ps3-ppu-binutils ─────────────────────────────────────────────────

(define-public ps3-ppu-binutils
  ;; AUR ps3-ppu-binutils: GNU Binutils cross-compiled for PS3 PPU (PowerPC GameOS); 1 vote.
  ;; Maps to Guix binutils 2.44 (canonical GNU Binutils; PS3 cross-variant built on same sources).
  (package (inherit binutils) (name "ps3-ppu-binutils")))

;;; ── ps3-psl1ght ──────────────────────────────────────────────────────

(define-public ps3-psl1ght
  ;; AUR ps3-psl1ght: PSL1GHT lightweight PS3 GameOS SDK; 1 vote.
  ;; No Guix PS3 SDK; NEEDS_RECIPE_DESIGN (requires ps3-ppu-binutils cross toolchain).
  ;; Source: https://github.com/ps3dev
  ;; Next: pin PSL1GHT release, compute sha256, draft recipe depending on ps3-ppu-binutils.
  (package (inherit binutils) (name "ps3-psl1ght")))

;;; ── ps3-spu-binutils ─────────────────────────────────────────────────

(define-public ps3-spu-binutils
  ;; AUR ps3-spu-binutils: GNU Binutils cross-compiled for PS3 SPU (SIMD Processing Unit); 1 vote.
  ;; Maps to Guix binutils 2.44 (same upstream GNU Binutils; SPU cross-target variant).
  (package (inherit binutils) (name "ps3-spu-binutils")))

;;; ── ps3-spu-gcc ──────────────────────────────────────────────────────

(define-public ps3-spu-gcc
  ;; AUR ps3-spu-gcc: GCC cross-compiler for PS3 SPU target; 1 vote.
  ;; Maps to Guix gcc-toolchain (canonical GCC toolchain; PS3 SPU cross-target built from same GCC).
  (package (inherit gcc-toolchain) (name "ps3-spu-gcc")))

;;; ── reddcoin-bin ─────────────────────────────────────────────────────

(define-public reddcoin-bin
  ;; AUR reddcoin-bin: Reddcoin social cryptocurrency wallet binary; 1 vote.
  ;; No Guix equivalent; NEEDS_RECIPE_DESIGN for binary wrapper.
  ;; Source: https://www.reddcoin.com/
  ;; Next: fetch Linux binary release, compute sha256, draft binary wrapper with Qt/openssl deps.
  (package (inherit zoxide) (name "reddcoin-bin")))

;;; ── plasma-ions-china-git ────────────────────────────────────────────

(define-public plasma-ions-china-git
  ;; AUR plasma-ions-china-git: KDE Plasma weather ions for Chinese weather services (Python); 1 vote.
  ;; No Guix KDE Plasma weather ions; NEEDS_RECIPE_DESIGN (Python + Plasma API).
  ;; Source: https://github.com/arenekosreal/plasma-ions-china
  ;; Next: pin git commit, compute sha256, draft python recipe with plasma-framework dep.
  (package (inherit zoxide) (name "plasma-ions-china-git")))

;;; ── zpaqfranz-git ────────────────────────────────────────────────────

(define-public zpaqfranz-git
  ;; AUR zpaqfranz-git: ZPAQ-based backup/disaster-recovery Swiss Army knife (git); 1 vote.
  ;; No Guix equivalent; NEEDS_RECIPE_DESIGN (C++ make).
  ;; Source: https://github.com/fcorbelli/zpaqfranz
  ;; Next: pin git commit, compute sha256, draft gnu or cmake recipe.
  (package (inherit zoxide) (name "zpaqfranz-git")))

;;; ── project-monalisa ─────────────────────────────────────────────────

(define-public project-monalisa
  ;; AUR project-monalisa: networking protocol explorer (send custom packets); 1 vote.
  ;; No Guix equivalent; NEEDS_RECIPE_DESIGN.
  ;; Source: https://github.com/Akash420-oss/project-monalisa
  ;; Next: audit build system, draft recipe with libpcap/libnet inputs.
  (package (inherit zoxide) (name "project-monalisa")))

;;; ── gitnuro-bin ──────────────────────────────────────────────────────

(define-public gitnuro-bin
  ;; AUR gitnuro-bin: FOSS cross-platform Git GUI (JVM/Kotlin); prebuilt binary; 1 vote.
  ;; No Guix gitnuro; NEEDS_RECIPE_DESIGN for binary wrapper.
  ;; Source: https://github.com/JetpackDuba/Gitnuro
  ;; Next: fetch latest Linux release binary, compute sha256, draft binary wrapper with JRE dep.
  (package (inherit zoxide) (name "gitnuro-bin")))

;;; ── clang-include-graph-bin ──────────────────────────────────────────

(define-public clang-include-graph-bin
  ;; AUR clang-include-graph-bin: C/C++ include dependency graph generator (prebuilt); 1 vote.
  ;; No Guix equivalent; NEEDS_RECIPE_DESIGN for binary wrapper.
  ;; Source: https://github.com/bkryza/clang-include-graph
  ;; Next: fetch release binary, compute sha256, draft binary wrapper recipe.
  (package (inherit zoxide) (name "clang-include-graph-bin")))

;;; ── zsa-keymapp-bin ──────────────────────────────────────────────────

(define-public zsa-keymapp-bin
  ;; AUR zsa-keymapp-bin: live visual keyboard layout reference for ZSA keyboards; binary; 1 vote.
  ;; No Guix equivalent; NEEDS_RECIPE_DESIGN for binary wrapper.
  ;; Source: https://zsa.io/flash
  ;; Next: fetch Linux binary release, compute sha256, draft binary wrapper with udev rules.
  (package (inherit zoxide) (name "zsa-keymapp-bin")))

;;; ── go-prism-bin ─────────────────────────────────────────────────────

(define-public go-prism-bin
  ;; AUR go-prism-bin: turn raw test output into visual data (Go binary); 1 vote.
  ;; No Guix equivalent; NEEDS_RECIPE_DESIGN for binary wrapper.
  ;; Source: https://github.com/DaltonSW/prism
  ;; Next: fetch release binary, compute sha256, draft binary wrapper recipe.
  (package (inherit zoxide) (name "go-prism-bin")))

;;; ── freedownloadmanager-bin ──────────────────────────────────────────

(define-public freedownloadmanager-bin
  ;; AUR freedownloadmanager-bin: Free Download Manager desktop app (binary); 1 vote.
  ;; No Guix equivalent; NEEDS_RECIPE_DESIGN for binary wrapper.
  ;; Source: https://www.freedownloadmanager.org/
  ;; Next: fetch Linux release binary, compute sha256, draft binary wrapper recipe.
  (package (inherit zoxide) (name "freedownloadmanager-bin")))

;;; ── oama-bin ─────────────────────────────────────────────────────────

(define-public oama-bin
  ;; AUR oama-bin: OAuth2 renewal and authorization capabilities (Haskell binary); 1 vote.
  ;; No Guix equivalent; NEEDS_RECIPE_DESIGN for binary wrapper.
  ;; Source: https://github.com/pdobsan/oama
  ;; Next: fetch release binary, compute sha256, draft binary wrapper recipe.
  (package (inherit zoxide) (name "oama-bin")))

;;; ── posy-improved-cursors ────────────────────────────────────────────

(define-public posy-improved-cursors
  ;; AUR posy-improved-cursors: Posy's improved cursor themes by Michiel de Boer (Linux port); 1 vote.
  ;; No Guix cursor theme equivalent; NEEDS_RECIPE_DESIGN (trivial install of xcursor theme).
  ;; Source: https://github.com/simtrami/posy-improved-cursor-linux
  ;; Next: fetch release tarball, compute sha256, draft trivial-build-system install recipe.
  (package (inherit font-terminus) (name "posy-improved-cursors")))

;;; ── mastodon ─────────────────────────────────────────────────────────

(define-public mastodon
  ;; AUR mastodon: self-hosted federated microblogging community server (Ruby/Rails); 1 vote.
  ;; Note: Guix has emacs-mastodon, guile-mastodon, python-mastodon-py (clients/libs).
  ;; This is the full Mastodon server (Rails + Node.js + Sidekiq + PostgreSQL/Redis).
  ;; NEEDS_RECIPE_DESIGN: complex multi-component web app.
  ;; Source: https://github.com/mastodon/mastodon
  ;; Next: draft rails-based recipe or Docker-equivalent Guix service; needs PostgreSQL+Redis inputs.
  (package (inherit zoxide) (name "mastodon")))
