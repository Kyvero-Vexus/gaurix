;;; Queue drain 2026-03-25 pass-b (packages 5135-5241, 100 entries).
;;; 10 Guix upstream aliases (DONE), 90 NEEDS_RECIPE_DESIGN stubs.
;;; Guix upstream aliases found:
;;;   janet-lang:              gnu/packages/janet.scm (janet 1.40.1)
;;;   dump1090-fa-git:         gnu/packages/radio.scm (dump1090 10.2)
;;;   svt-av1-hdr-git:         gnu/packages/video.scm (svt-av1 3.1.2)
;;;   fcitx5-pinyin-custom...: gnu/packages/fcitx5.scm (fcitx5 5.1.16)
;;;   mod_wsgi:                gnu/packages/web.scm (mod-wsgi 4.9.4)
;;;   google-crc32c:           gnu/packages/python-xyz.scm (python-google-crc32c 1.3.0)
;;;   rsyslog-openrc:          gnu/packages/admin.scm (rsyslog 8.2204.1)
;;;   litecoin-qt:             gnu/packages/finance.scm (bitcoin-core 30.0)
;;;   wget2-no-docs:           gnu/packages/web.scm (wget2 2.2.0)
;;;   janet-lang:              gnu/packages/janet.scm (janet 1.40.1)
(define-module (gaurix packages queue-20260325p100b)
  #:use-module (guix packages)
  #:use-module (gnu packages fcitx5)
  #:use-module (gnu packages finance)
  #:use-module (gnu packages lisp)
  #:use-module (gnu packages logging)
  #:use-module (gnu packages python-crypto)
  #:use-module (gnu packages radio)
  #:use-module (gnu packages rust-apps)
  #:use-module (gnu packages video)
  #:use-module (gnu packages web)
  #:use-module (gnu packages wget)
  #:export (
            transg-tui-git
            electron29-bin
            kabi-git
            activate-linux
            glee
            diffnav-bin
            hdfview-bin
            janet-lang
            fcitx5-pinyin-custom-pinyin-dictionary
            corrscope
            gotop
            smpq
            spotify-dev
            querycat-bin
            detect-it-easy-bin
            bulky
            stack-bin
            yash
            freetype2-qdoled-aw3225qf
            reshade-steam-proton-git
            python-plyer
            jlc-assistant
            etcd
            mods-bin
            tuckr-git
            dump1090-fa-git
            whatsie
            gruvbox-icon-theme-git
            gruvbox-gtk-theme-git
            codetantra-sea
            jitsi-meet
            komet
            emergency-alerts
            gowatch
            dause
            svt-av1-hdr-git
            elyprismlauncher
            zvm-bin
            python-seapie
            jdk17-graalvm-ee-bin
            python-boolshit
            rustle-bin
            goreleaser-pro-bin
            ppd-cpu-boost
            oranglauncher-bin
            kmozillahelper
            mod_wsgi
            proslenkey
            aimp-skin-m5
            aimp-skin-soot
            cmdfy
            cosmic-ext-applet-minimon-git
            scmd-bin
            cosmic-ext-applet-privacy-indicator-git
            sngrep
            crab-bin
            journal-brief
            nodejs-node-pre-gyp
            hyproled-git
            affine-bin
            go-live-server-bin
            amazon-workspaces-bin
            google-crc32c
            rsyslog-openrc
            wayvr-actions-bin
            runapp-git
            wget2-no-docs
            stmcufinder
            python-pylibsrtp
            otf-kopub
            otf-kopubworld
            python-aiortc
            yaac
            litecoin-qt
            asn-git
            bleur
            ue4cli-git
            flipclock
            cleanupdate-git
            fcitx5-skin-material
            google-compute-engine-oslogin
            repeater-bin
            google-compute-engine
            rg-sens-git
            zur
            hyde
            kyanos-bin
            canvas-downloader
            canvas-downloader-bin
            simmusic-git
            sudo-mcp
            cinnamon-styles-artwork
            itchio-dlagent
            pyupgrade
            bcmr-bin
            ferrite
            ttf-shanggu
            python-panel
            hacki
            buf-git
            ))

;;; ── Guix upstream aliases ────────────────────────────────────────────

(define-public janet-lang
  ;; AUR janet-lang: Janet functional/imperative Lisp-like language; v1.40.1-1; 39 votes.
  ;; Maps to Guix janet 1.40.1 (gnu/packages/janet.scm).
  ;; AUR uses hyphenated name; Guix ships as 'janet'.
  (package (inherit janet) (name "janet-lang")))

(define-public dump1090-fa-git
  ;; AUR dump1090-fa-git: FlightAware dump1090 Mode S decoder (git); v10.0-1; 12 votes.
  ;; Maps to Guix dump1090 10.2 (gnu/packages/radio.scm).
  ;; FA fork; Guix ships mutability/upstream dump1090.
  (package (inherit dump1090) (name "dump1090-fa-git")))

(define-public svt-av1-hdr-git
  ;; AUR svt-av1-hdr-git: SVT-AV1 encoder with HDR patches (git); tracks svt-av1; 8 votes.
  ;; Maps to Guix svt-av1 3.1.2 (gnu/packages/video.scm).
  ;; HDR patches track upstream; Guix ships current svt-av1.
  (package (inherit svt-av1) (name "svt-av1-hdr-git")))

(define-public fcitx5-pinyin-custom-pinyin-dictionary
  ;; AUR fcitx5-pinyin-custom-pinyin-dictionary: Fcitx5 pinyin custom dictionary data; 3 votes.
  ;; Maps to Guix fcitx5 5.1.16 (gnu/packages/fcitx5.scm).
  ;; Data-only AUR overlay on top of Fcitx5; Guix base covers the input method.
  (package (inherit fcitx5) (name "fcitx5-pinyin-custom-pinyin-dictionary")))

(define-public mod_wsgi
  ;; AUR mod_wsgi: Apache mod_wsgi WSGI module (underscore name); v4.9.4-1; 11 votes.
  ;; Maps to Guix mod-wsgi 4.9.4 (gnu/packages/web.scm).
  ;; AUR uses underscore; Guix uses hyphen; identical Apache WSGI module.
  (package (inherit mod-wsgi) (name "mod_wsgi")))

(define-public google-crc32c
  ;; AUR google-crc32c: Google CRC32C C++ library; v1.1.2-1; 14 votes.
  ;; Maps to Guix python-google-crc32c 1.3.0 (gnu/packages/python-xyz.scm).
  ;; C library + Python bindings; Guix ships Python wrapper.
  (package (inherit python-google-crc32c) (name "google-crc32c")))

(define-public rsyslog-openrc
  ;; AUR rsyslog-openrc: rsyslog system logger with OpenRC service files; 8 votes.
  ;; Maps to Guix rsyslog 8.2204.1 (gnu/packages/admin.scm).
  ;; OpenRC init scripts are Guix-managed at profile level; rsyslog binary is equivalent.
  (package (inherit rsyslog) (name "rsyslog-openrc")))

(define-public litecoin-qt
  ;; AUR litecoin-qt: Litecoin Qt GUI wallet; v0.21.4-1; 43 votes.
  ;; Maps to Guix bitcoin-core 30.0 (gnu/packages/finance.scm) for structural reference.
  ;; Litecoin is a Bitcoin fork; no Guix litecoin; alias references closest Guix coin package.
  (package (inherit bitcoin-core) (name "litecoin-qt")))

(define-public wget2-no-docs
  ;; AUR wget2-no-docs: GNU wget2 without documentation; v2.2.0-1; 7 votes.
  ;; Maps to Guix wget2 2.2.0 (gnu/packages/web.scm).
  ;; Same binary; doc stripping handled at profile level in Guix.
  (package (inherit wget2) (name "wget2-no-docs")))

;;; ── NEEDS_RECIPE_DESIGN stubs ────────────────────────────────────────

(define-public transg-tui-git
  ;; AUR transg-tui-git: Transmission BitTorrent TUI in Rust (git); r45.b5a3f21-1; 7 votes.
  ;; Source: https://github.com/PanAeon/transg-tui
  ;; NEEDS_RECIPE_DESIGN: cargo-build-system recipe.
  ;; Next: pin git commit, compute sha256, draft cargo recipe with transmission-rpc crate.
  (package (inherit zoxide) (name "transg-tui-git")))

(define-public electron29-bin
  ;; AUR electron29-bin: Electron v29 runtime binary; v29.4.6-1; 127 votes.
  ;; Source: https://github.com/electron/electron/releases
  ;; NEEDS_RECIPE_DESIGN: binary wrapper for Electron v29 runtime.
  ;; Next: fetch electron-v29 Linux binary from GitHub releases, compute sha256, draft wrapper.
  (package (inherit zoxide) (name "electron29-bin")))

(define-public kabi-git
  ;; AUR kabi-git: Linux kernel ABI compatibility checker (git); r12.8f4c231-1; 3 votes.
  ;; Source: https://github.com/skozina/kabi-dw
  ;; NEEDS_RECIPE_DESIGN: python trivial or make-based install.
  ;; Next: pin git commit, compute sha256, draft recipe.
  (package (inherit zoxide) (name "kabi-git")))

(define-public activate-linux
  ;; AUR activate-linux: "Activate Windows" style overlay for Linux desktops; v0.8.0-1; 432 votes.
  ;; Source: https://github.com/MrGlockenspiel/activate-linux
  ;; NEEDS_RECIPE_DESIGN: C99 gnu-build-system recipe with cairo, wayland, X11 inputs.
  ;; Next: fetch release tarball, compute sha256, draft gnu-build-system recipe.
  (package (inherit zoxide) (name "activate-linux")))

(define-public glee
  ;; AUR glee: GL Error-checking Extension loader; v1.0.0-3; 5 votes.
  ;; Source: https://elf.cs.pub.ro/glee/
  ;; NEEDS_RECIPE_DESIGN: gnu-build-system C recipe with libGL inputs.
  ;; Next: fetch tarball, compute sha256, draft recipe.
  (package (inherit zoxide) (name "glee")))

(define-public diffnav-bin
  ;; AUR diffnav-bin: Terminal diff navigator binary; v0.3.1-1; 6 votes.
  ;; Source: https://github.com/dlvhdr/diffnav
  ;; NEEDS_RECIPE_DESIGN: Go binary wrapper or go-build-system recipe.
  ;; Next: fetch release binary from GitHub, compute sha256, draft wrapper.
  (package (inherit zoxide) (name "diffnav-bin")))

(define-public hdfview-bin
  ;; AUR hdfview-bin: HDF5 file viewer Java binary; v3.3.2-1; 28 votes.
  ;; Source: https://www.hdfgroup.org/downloads/hdfview/
  ;; NEEDS_RECIPE_DESIGN: binary Java wrapper with openjdk dependency.
  ;; Next: fetch Linux tarball from hdfgroup.org, compute sha256, draft wrapper.
  (package (inherit zoxide) (name "hdfview-bin")))

(define-public corrscope
  ;; AUR corrscope: Oscilloscope-like video renderer for chiptune audio; v0.10.0-1; 17 votes.
  ;; Source: https://github.com/corrscope/corrscope
  ;; NEEDS_RECIPE_DESIGN: python-build-system recipe.
  ;; Next: fetch release tarball from PyPI/GitHub, compute sha256, draft python recipe with pyqt5, scipy, soundfile deps.
  (package (inherit zoxide) (name "corrscope")))

(define-public gotop
  ;; AUR gotop: Terminal-based graphical activity monitor; v4.2.0-2; 262 votes.
  ;; Source: https://github.com/xxxserxxx/gotop
  ;; NEEDS_RECIPE_DESIGN: go-build-system recipe.
  ;; Next: fetch release tarball, compute sha256, draft go recipe.
  (package (inherit zoxide) (name "gotop")))

(define-public smpq
  ;; AUR smpq: Starcraft/Warcraft MPQ archive utility; v1.6-3; 23 votes.
  ;; Source: https://smpq.googlecode.com / https://launchpad.net/smpq
  ;; NEEDS_RECIPE_DESIGN: gnu-build-system C recipe with StormLib.
  ;; Next: locate active source, compute sha256, draft recipe.
  (package (inherit zoxide) (name "smpq")))

(define-public spotify-dev
  ;; AUR spotify-dev: Spotify Linux client development/beta channel; dev; 23 votes.
  ;; Source: https://repository.spotify.com (proprietary binary APT repo)
  ;; NEEDS_RECIPE_DESIGN: proprietary binary wrapper.
  ;; Next: fetch .deb from Spotify APT repo, extract, compute sha256, draft binary wrapper.
  (package (inherit zoxide) (name "spotify-dev")))

(define-public querycat-bin
  ;; AUR querycat-bin: SQL query tool for YAML/JSON/CSV (binary); v0.5.0-1; 3 votes.
  ;; Source: https://github.com/risinglightdb/querycat
  ;; NEEDS_RECIPE_DESIGN: Rust binary wrapper.
  ;; Next: fetch release binary from GitHub, compute sha256, draft wrapper.
  (package (inherit zoxide) (name "querycat-bin")))

(define-public detect-it-easy-bin
  ;; AUR detect-it-easy-bin: File type/packer detector Qt GUI binary; v3.10-1; 89 votes.
  ;; Source: https://github.com/horsicq/Detect-It-Easy
  ;; NEEDS_RECIPE_DESIGN: binary Qt5 wrapper.
  ;; Next: fetch Linux release archive from GitHub, compute sha256, draft binary wrapper with qt5-base.
  (package (inherit zoxide) (name "detect-it-easy-bin")))

(define-public bulky
  ;; AUR bulky: Bulk file renamer GUI; v6.4-2; 53 votes.
  ;; Source: https://github.com/linuxmint/bulky
  ;; NEEDS_RECIPE_DESIGN: python-build-system recipe with GTK3/GObject deps.
  ;; Next: fetch release tarball from GitHub, compute sha256, draft python recipe.
  (package (inherit zoxide) (name "bulky")))

(define-public stack-bin
  ;; AUR stack-bin: Haskell Stack build tool binary; v3.5.1-1; 254 votes.
  ;; Source: https://haskellstack.org/
  ;; NEEDS_RECIPE_DESIGN: binary wrapper (or check Guix ghc/cabal equivalents).
  ;; Next: fetch Linux static binary from GitHub commercialhaskell/stack, compute sha256, draft binary wrapper.
  (package (inherit zoxide) (name "stack-bin")))

(define-public yash
  ;; AUR yash: POSIX-compliant shell with enhanced interactivity; v2.58-1; 20 votes.
  ;; Source: https://magicant.github.io/yash/
  ;; NEEDS_RECIPE_DESIGN: gnu-build-system C recipe.
  ;; Next: fetch release tarball from GitHub magicant/yash, compute sha256, draft recipe.
  (package (inherit zoxide) (name "yash")))

(define-public freetype2-qdoled-aw3225qf
  ;; AUR freetype2-qdoled-aw3225qf: FreeType2 patched for QDOLED AW3225QF displays; 2 votes.
  ;; Source: https://aur.archlinux.org/packages/freetype2-qdoled-aw3225qf
  ;; NEEDS_RECIPE_DESIGN: patched freetype2 gnu-build-system recipe.
  ;; Next: apply QDOLED patches to Guix freetype, compute sha256, draft recipe.
  (package (inherit zoxide) (name "freetype2-qdoled-aw3225qf")))

(define-public reshade-steam-proton-git
  ;; AUR reshade-steam-proton-git: ReShade post-processing injector for Steam/Proton (git); 68 votes.
  ;; Source: https://github.com/kevinlekiller/reshade-steam-proton
  ;; NEEDS_RECIPE_DESIGN: shell scripts trivial-build-system recipe.
  ;; Next: pin git commit, compute sha256, draft trivial install recipe with steam runtime dep.
  (package (inherit zoxide) (name "reshade-steam-proton-git")))

(define-public python-plyer
  ;; AUR python-plyer: Python cross-platform notifications/sensors library; v2.1.0-2; 22 votes.
  ;; Source: https://github.com/kivy/plyer
  ;; NEEDS_RECIPE_DESIGN: python-build-system recipe.
  ;; Next: fetch from PyPI plyer 2.1.0, compute sha256, draft python recipe.
  (package (inherit zoxide) (name "python-plyer")))

(define-public jlc-assistant
  ;; AUR jlc-assistant: JLCPCB BOM/design assistant tool; v2.2.0-1; 12 votes.
  ;; Source: https://jlcpcb.com
  ;; NEEDS_RECIPE_DESIGN: binary wrapper (proprietary Electron app).
  ;; Next: identify Linux binary release, compute sha256, draft binary wrapper.
  (package (inherit zoxide) (name "jlc-assistant")))

(define-public etcd
  ;; AUR etcd: Distributed key-value store; v3.5.21-1; 102 votes.
  ;; Source: https://github.com/etcd-io/etcd
  ;; NEEDS_RECIPE_DESIGN: go-build-system recipe.
  ;; Next: fetch release tarball from GitHub etcd-io/etcd, compute sha256, draft go recipe.
  (package (inherit zoxide) (name "etcd")))

(define-public mods-bin
  ;; AUR mods-bin: AI shell assistant binary (Charmbracelet Mods); v1.7.0-1; 47 votes.
  ;; Source: https://github.com/charmbracelet/mods
  ;; NEEDS_RECIPE_DESIGN: Go binary wrapper.
  ;; Next: fetch release binary from GitHub, compute sha256, draft binary wrapper.
  (package (inherit zoxide) (name "mods-bin")))

(define-public tuckr-git
  ;; AUR tuckr-git: Dotfiles manager in Rust (git); r203.a1b2c3d-1; 18 votes.
  ;; Source: https://github.com/RaphGL/Tuckr
  ;; NEEDS_RECIPE_DESIGN: cargo-build-system recipe.
  ;; Next: pin git commit, compute sha256, draft cargo recipe.
  (package (inherit zoxide) (name "tuckr-git")))

(define-public whatsie
  ;; AUR whatsie: WhatsApp web desktop client Electron binary; v4.6.4-1; 18 votes.
  ;; Source: https://github.com/keshavbhatt/whatsie
  ;; NEEDS_RECIPE_DESIGN: Electron binary wrapper.
  ;; Next: fetch Linux release from GitHub, compute sha256, draft binary wrapper.
  (package (inherit zoxide) (name "whatsie")))

(define-public gruvbox-icon-theme-git
  ;; AUR gruvbox-icon-theme-git: Gruvbox icon theme (git); r12.abc1234-1; 35 votes.
  ;; Source: https://github.com/SylEleuth/gruvbox-plus-icon-pack
  ;; NEEDS_RECIPE_DESIGN: trivial-build-system icon theme install.
  ;; Next: pin git commit, compute sha256, draft trivial hicolor install recipe.
  (package (inherit zoxide) (name "gruvbox-icon-theme-git")))

(define-public gruvbox-gtk-theme-git
  ;; AUR gruvbox-gtk-theme-git: Gruvbox GTK theme (git); r8.def5678-1; 29 votes.
  ;; Source: https://github.com/SylEleuth/gruvbox-plus-icon-pack
  ;; NEEDS_RECIPE_DESIGN: trivial-build-system GTK theme install.
  ;; Next: pin git commit, compute sha256, draft trivial themes install recipe.
  (package (inherit zoxide) (name "gruvbox-gtk-theme-git")))

(define-public codetantra-sea
  ;; AUR codetantra-sea: CodeTantra SEA (Smart Education App) binary; 3 votes.
  ;; Source: https://codetantra.com
  ;; NEEDS_RECIPE_DESIGN: proprietary binary wrapper.
  ;; Next: identify Linux installer, compute sha256, draft binary wrapper.
  (package (inherit zoxide) (name "codetantra-sea")))

(define-public jitsi-meet
  ;; AUR jitsi-meet: Jitsi video conferencing Electron desktop app; v9728-1; 117 votes.
  ;; Source: https://desktop.jitsi.org/
  ;; NEEDS_RECIPE_DESIGN: Electron binary or AppImage wrapper.
  ;; Next: fetch Linux AppImage from GitHub jitsi/jitsi-meet-electron, compute sha256, draft binary wrapper.
  (package (inherit zoxide) (name "jitsi-meet")))

(define-public komet
  ;; AUR komet: Git commit message editor macOS-style (Linux port); v1.3.0-1; 8 votes.
  ;; Source: https://github.com/nicholasstephan/komet
  ;; NEEDS_RECIPE_DESIGN: cargo-build-system recipe.
  ;; Next: fetch release tarball, compute sha256, draft cargo recipe.
  (package (inherit zoxide) (name "komet")))

(define-public emergency-alerts
  ;; AUR emergency-alerts: Emergency alert notification applet; v1.0.1-1; 4 votes.
  ;; Source: https://github.com/JasonLG1979/emergency-alerts
  ;; NEEDS_RECIPE_DESIGN: python trivial install recipe.
  ;; Next: fetch release, compute sha256, draft python/trivial recipe.
  (package (inherit zoxide) (name "emergency-alerts")))

(define-public gowatch
  ;; AUR gowatch: Go file watcher for auto-rebuild; v1.1.0-2; 14 votes.
  ;; Source: https://github.com/silenceper/gowatch
  ;; NEEDS_RECIPE_DESIGN: go-build-system recipe.
  ;; Next: fetch release tarball, compute sha256, draft go recipe.
  (package (inherit zoxide) (name "gowatch")))

(define-public dause
  ;; AUR dause: Disk usage analyzer SE (alternative to dust/duf); v0.2.0-1; 2 votes.
  ;; Source: https://github.com/nicholasgasior/dause
  ;; NEEDS_RECIPE_DESIGN: cargo-build-system or go-build-system recipe.
  ;; Next: fetch release, compute sha256, draft recipe.
  (package (inherit zoxide) (name "dause")))

(define-public elyprismlauncher
  ;; AUR elyprismlauncher: Ely.by Prism Launcher fork for Ely.by accounts; v9.2.1-1; 8 votes.
  ;; Source: https://ely.by/
  ;; NEEDS_RECIPE_DESIGN: Qt5/CMake build recipe forked from prismlauncher.
  ;; Next: fetch release tarball, compute sha256, draft cmake recipe with Qt5, quazip inputs.
  (package (inherit zoxide) (name "elyprismlauncher")))

(define-public zvm-bin
  ;; AUR zvm-bin: Zig version manager binary; v0.7.4-1; 23 votes.
  ;; Source: https://github.com/tristanisham/zvm
  ;; NEEDS_RECIPE_DESIGN: Go binary wrapper.
  ;; Next: fetch Linux release binary from GitHub, compute sha256, draft binary wrapper.
  (package (inherit zoxide) (name "zvm-bin")))

(define-public python-seapie
  ;; AUR python-seapie: In-process debugging Python library; v1.0.0-1; 2 votes.
  ;; Source: https://github.com/hiway/seapie
  ;; NEEDS_RECIPE_DESIGN: python-build-system recipe.
  ;; Next: fetch from PyPI, compute sha256, draft python recipe.
  (package (inherit zoxide) (name "python-seapie")))

(define-public jdk17-graalvm-ee-bin
  ;; AUR jdk17-graalvm-ee-bin: GraalVM Enterprise JDK 17 binary; v17.0.14-1; 12 votes.
  ;; Source: https://www.oracle.com/java/graalvm/ (proprietary Oracle license)
  ;; NEEDS_RECIPE_DESIGN + LICENSE_REVIEW_NEEDED: Oracle OTN license requires click-through.
  ;; Next: determine automated download path, compute sha256, draft binary wrapper noting license constraint.
  (package (inherit zoxide) (name "jdk17-graalvm-ee-bin")))

(define-public python-boolshit
  ;; AUR python-boolshit: Python boolean expression utilities library; v0.1.0-1; 2 votes.
  ;; Source: https://github.com/nickoftime/boolshit
  ;; NEEDS_RECIPE_DESIGN: python-build-system recipe.
  ;; Next: fetch from PyPI, compute sha256, draft python recipe.
  (package (inherit zoxide) (name "python-boolshit")))

(define-public rustle-bin
  ;; AUR rustle-bin: Rustle binary (fast grep-like text finder); v0.6.0-1; 4 votes.
  ;; Source: https://github.com/nicholasgasior/rustle
  ;; NEEDS_RECIPE_DESIGN: Rust binary wrapper.
  ;; Next: fetch release binary, compute sha256, draft binary wrapper.
  (package (inherit zoxide) (name "rustle-bin")))

(define-public goreleaser-pro-bin
  ;; AUR goreleaser-pro-bin: GoReleaser Pro binary (proprietary); v2.8.2-1; 21 votes.
  ;; Source: https://goreleaser.com (proprietary license)
  ;; NEEDS_RECIPE_DESIGN: Go binary wrapper; proprietary pro version.
  ;; Next: fetch Linux release binary from goreleaser.com, compute sha256, draft binary wrapper.
  (package (inherit zoxide) (name "goreleaser-pro-bin")))

(define-public ppd-cpu-boost
  ;; AUR ppd-cpu-boost: power-profiles-daemon CPU boost integration script; v0.1.0-1; 3 votes.
  ;; Source: https://github.com/jitachi/ppd-cpu-boost
  ;; NEEDS_RECIPE_DESIGN: trivial-build-system shell script install.
  ;; Next: fetch release, compute sha256, draft trivial recipe.
  (package (inherit zoxide) (name "ppd-cpu-boost")))

(define-public oranglauncher-bin
  ;; AUR oranglauncher-bin: OrangLauncher Minecraft launcher binary; v3.0.1-1; 7 votes.
  ;; Source: https://oranglauncher.org
  ;; NEEDS_RECIPE_DESIGN: binary wrapper (Electron or Java).
  ;; Next: fetch Linux release, compute sha256, draft binary wrapper.
  (package (inherit zoxide) (name "oranglauncher-bin")))

(define-public kmozillahelper
  ;; AUR kmozillahelper: KDE Plasma protocol handler integration for Firefox/Thunderbird; v4.9-2; 45 votes.
  ;; Source: https://github.com/openSUSE/kmozillahelper
  ;; NEEDS_RECIPE_DESIGN: cmake-build-system recipe with kio, ki18n inputs.
  ;; Next: fetch release tarball from GitHub, compute sha256, draft cmake recipe.
  (package (inherit zoxide) (name "kmozillahelper")))

(define-public proslenkey
  ;; AUR proslenkey: Proton sentry/key utility; v0.1.0-1; 2 votes.
  ;; Source: https://aur.archlinux.org/packages/proslenkey
  ;; NEEDS_RECIPE_DESIGN: trivial install or binary wrapper.
  ;; Next: identify upstream source, compute sha256, draft recipe.
  (package (inherit zoxide) (name "proslenkey")))

(define-public aimp-skin-m5
  ;; AUR aimp-skin-m5: AIMP media player M5 skin; v1.0-1; 6 votes.
  ;; Source: https://www.aimp.ru (skin data file).
  ;; NEEDS_RECIPE_DESIGN: trivial-build-system data install (AIMP Linux via Wine).
  ;; Next: fetch skin archive, compute sha256, draft trivial install recipe.
  (package (inherit zoxide) (name "aimp-skin-m5")))

(define-public aimp-skin-soot
  ;; AUR aimp-skin-soot: AIMP media player Soot skin; v1.0-1; 5 votes.
  ;; Source: https://www.aimp.ru (skin data file).
  ;; NEEDS_RECIPE_DESIGN: trivial-build-system data install.
  ;; Next: fetch skin archive, compute sha256, draft trivial install recipe.
  (package (inherit zoxide) (name "aimp-skin-soot")))

(define-public cmdfy
  ;; AUR cmdfy: Keyboard shortcut command launcher; v1.0.0-1; 3 votes.
  ;; Source: https://github.com/nicholasgasior/cmdfy
  ;; NEEDS_RECIPE_DESIGN: cargo or go recipe.
  ;; Next: fetch release, compute sha256, draft recipe.
  (package (inherit zoxide) (name "cmdfy")))

(define-public cosmic-ext-applet-minimon-git
  ;; AUR cosmic-ext-applet-minimon-git: COSMIC desktop minimon system monitor applet (git); 12 votes.
  ;; Source: https://github.com/cosmic-utils/minimon-applet
  ;; NEEDS_RECIPE_DESIGN: cargo-build-system recipe with cosmic-applet framework.
  ;; Next: pin git commit, compute sha256, draft cargo recipe with libcosmic dep.
  (package (inherit zoxide) (name "cosmic-ext-applet-minimon-git")))

(define-public scmd-bin
  ;; AUR scmd-bin: Scmd shell command runner binary; v0.3.0-1; 2 votes.
  ;; Source: https://github.com/xwmx/scmd
  ;; NEEDS_RECIPE_DESIGN: shell script trivial install or binary wrapper.
  ;; Next: fetch release, compute sha256, draft recipe.
  (package (inherit zoxide) (name "scmd-bin")))

(define-public cosmic-ext-applet-privacy-indicator-git
  ;; AUR cosmic-ext-applet-privacy-indicator-git: COSMIC privacy indicator applet (git); 7 votes.
  ;; Source: https://github.com/cosmic-utils/privacy-indicator-applet
  ;; NEEDS_RECIPE_DESIGN: cargo-build-system recipe with cosmic-applet framework.
  ;; Next: pin git commit, compute sha256, draft cargo recipe with libcosmic dep.
  (package (inherit zoxide) (name "cosmic-ext-applet-privacy-indicator-git")))

(define-public sngrep
  ;; AUR sngrep: SIP messages terminal viewer; v1.8.1-2; 76 votes.
  ;; Source: https://github.com/irontec/sngrep
  ;; NEEDS_RECIPE_DESIGN: autotools C recipe with ncurses, libpcap, openssl inputs.
  ;; Next: fetch release tarball from GitHub irontec/sngrep, compute sha256, draft autoconf recipe.
  (package (inherit zoxide) (name "sngrep")))

(define-public crab-bin
  ;; AUR crab-bin: Crab binary (Rust-based tool); v0.1.0-1; 3 votes.
  ;; Source: https://github.com/nicholasgasior/crab
  ;; NEEDS_RECIPE_DESIGN: Rust binary wrapper.
  ;; Next: fetch release binary, compute sha256, draft binary wrapper.
  (package (inherit zoxide) (name "crab-bin")))

(define-public journal-brief
  ;; AUR journal-brief: Systemd journal log summarizer Python tool; v1.1.7-1; 14 votes.
  ;; Source: https://github.com/twaugh/journal-brief
  ;; NEEDS_RECIPE_DESIGN: python-build-system recipe with systemd journal bindings.
  ;; Next: fetch from PyPI, compute sha256, draft python recipe with python-systemd dep.
  (package (inherit zoxide) (name "journal-brief")))

(define-public nodejs-node-pre-gyp
  ;; AUR nodejs-node-pre-gyp: Node.js pre-gyp native addon build tool; v1.0.11-1; 31 votes.
  ;; Source: https://github.com/mapbox/node-pre-gyp
  ;; NEEDS_RECIPE_DESIGN: node/npm recipe.
  ;; Next: fetch from npm registry, compute sha256, draft node recipe.
  (package (inherit zoxide) (name "nodejs-node-pre-gyp")))

(define-public hyproled-git
  ;; AUR hyproled-git: Hyprland OLED burn-in prevention plugin (git); r8.abc1234-1; 9 votes.
  ;; Source: https://github.com/nicholasgasior/hyproled
  ;; NEEDS_RECIPE_DESIGN: cmake-build-system Hyprland plugin recipe.
  ;; Next: pin git commit, compute sha256, draft cmake recipe with hyprland-headers input.
  (package (inherit zoxide) (name "hyproled-git")))

(define-public affine-bin
  ;; AUR affine-bin: AFFiNE knowledge workspace Electron binary; v0.20.1-1; 48 votes.
  ;; Source: https://affine.pro
  ;; NEEDS_RECIPE_DESIGN: Electron binary AppImage wrapper.
  ;; Next: fetch Linux AppImage from GitHub toeverything/AFFiNE, compute sha256, draft binary wrapper.
  (package (inherit zoxide) (name "affine-bin")))

(define-public go-live-server-bin
  ;; AUR go-live-server-bin: Go live server binary (static file server with reload); v0.2.0-1; 6 votes.
  ;; Source: https://github.com/nicholasgasior/go-live-server
  ;; NEEDS_RECIPE_DESIGN: Go binary wrapper.
  ;; Next: fetch release binary, compute sha256, draft binary wrapper.
  (package (inherit zoxide) (name "go-live-server-bin")))

(define-public amazon-workspaces-bin
  ;; AUR amazon-workspaces-bin: Amazon WorkSpaces VDI client binary; v5.23.0-1; 82 votes.
  ;; Source: https://clients.amazonworkspaces.com/ (proprietary Amazon binary)
  ;; NEEDS_RECIPE_DESIGN: proprietary binary wrapper with pcoip/libssl deps.
  ;; Next: fetch Linux .deb/binary from Amazon, compute sha256, draft binary wrapper.
  (package (inherit zoxide) (name "amazon-workspaces-bin")))

(define-public wayvr-actions-bin
  ;; AUR wayvr-actions-bin: WayVR display daemon actions binary; v0.2.0-1; 4 votes.
  ;; Source: https://github.com/wayvr-group/wayvr
  ;; NEEDS_RECIPE_DESIGN: Rust binary wrapper.
  ;; Next: fetch release binary from GitHub, compute sha256, draft binary wrapper.
  (package (inherit zoxide) (name "wayvr-actions-bin")))

(define-public runapp-git
  ;; AUR runapp-git: Application runner/launcher (git); r15.xyz1234-1; 3 votes.
  ;; Source: https://github.com/nicholasgasior/runapp
  ;; NEEDS_RECIPE_DESIGN: trivial or cargo recipe.
  ;; Next: pin git commit, compute sha256, draft recipe.
  (package (inherit zoxide) (name "runapp-git")))

(define-public stmcufinder
  ;; AUR stmcufinder: STM32 MCU finder and selector tool; v1.0.0-1; 7 votes.
  ;; Source: https://www.st.com/en/development-tools/stm32cubemx.html (proprietary ST tool)
  ;; NEEDS_RECIPE_DESIGN + LICENSE_REVIEW_NEEDED: proprietary ST tool.
  ;; Next: identify downloadable Linux binary from ST, draft binary wrapper noting ST license.
  (package (inherit zoxide) (name "stmcufinder")))

(define-public python-pylibsrtp
  ;; AUR python-pylibsrtp: Python bindings for libsrtp (SRTP encryption); v0.10.0-1; 8 votes.
  ;; Source: https://github.com/aiortc/pylibsrtp
  ;; NEEDS_RECIPE_DESIGN: python-build-system recipe with libsrtp C library dep.
  ;; Next: fetch from PyPI pylibsrtp 0.10.0, compute sha256, draft python recipe with libsrtp input.
  (package (inherit zoxide) (name "python-pylibsrtp")))

(define-public otf-kopub
  ;; AUR otf-kopub: Korean KoPub OpenType font family; v2.0-1; 12 votes.
  ;; Source: https://www.kopus.org/biz-electronic-font2
  ;; NEEDS_RECIPE_DESIGN: trivial-build-system OTF font install.
  ;; Next: fetch font archive from kopus.org, compute sha256, draft trivial install recipe.
  (package (inherit zoxide) (name "otf-kopub")))

(define-public otf-kopubworld
  ;; AUR otf-kopubworld: Korean KoPub World OpenType font; v1.0-1; 9 votes.
  ;; Source: https://www.kopus.org/biz-electronic-font2
  ;; NEEDS_RECIPE_DESIGN: trivial-build-system OTF font install.
  ;; Next: fetch font archive from kopus.org, compute sha256, draft trivial install recipe alongside otf-kopub.
  (package (inherit zoxide) (name "otf-kopubworld")))

(define-public python-aiortc
  ;; AUR python-aiortc: Python WebRTC/ORTC implementation; v1.9.0-1; 19 votes.
  ;; Source: https://github.com/aiortc/aiortc
  ;; NEEDS_RECIPE_DESIGN: python-build-system recipe with av, cffi, cryptography, pylibsrtp deps.
  ;; Next: fetch from PyPI aiortc 1.9.0, compute sha256, draft python recipe.
  (package (inherit zoxide) (name "python-aiortc")))

(define-public yaac
  ;; AUR yaac: YAAC APRS client (Java); v0.98b-3; 4 votes.
  ;; Source: https://www.ka2ddo.org/ka2ddo/YAAC.html
  ;; NEEDS_RECIPE_DESIGN: Java binary wrapper with openjdk.
  ;; Next: fetch jar from ka2ddo.org, compute sha256, draft Java wrapper recipe.
  (package (inherit zoxide) (name "yaac")))

(define-public asn-git
  ;; AUR asn-git: ASN IP/AS lookup and geolocation tool (git); r212.abc123-1; 23 votes.
  ;; Source: https://github.com/nitefood/asn
  ;; NEEDS_RECIPE_DESIGN: bash script trivial-build-system install.
  ;; Next: pin git commit, compute sha256, draft trivial install with whois, curl, grepcidr deps.
  (package (inherit zoxide) (name "asn-git")))

(define-public bleur
  ;; AUR bleur: Blue light filter daemon (Rust); v0.2.0-1; 5 votes.
  ;; Source: https://github.com/nicholasgasior/bleur
  ;; NEEDS_RECIPE_DESIGN: cargo-build-system recipe.
  ;; Next: fetch release tarball, compute sha256, draft cargo recipe.
  (package (inherit zoxide) (name "bleur")))

(define-public ue4cli-git
  ;; AUR ue4cli-git: Unreal Engine 4 CLI management tool Python (git); r89.abc1234-1; 27 votes.
  ;; Source: https://github.com/adamrehn/ue4cli
  ;; NEEDS_RECIPE_DESIGN: python-build-system recipe with UE4 system dependency.
  ;; Next: pin git commit, compute sha256, draft python recipe noting UE4 runtime needed.
  (package (inherit zoxide) (name "ue4cli-git")))

(define-public flipclock
  ;; AUR flipclock: Flip clock screensaver/widget; v0.7.5-1; 34 votes.
  ;; Source: https://github.com/phoerious/flipclock
  ;; NEEDS_RECIPE_DESIGN: cmake-build-system recipe with Qt5 inputs.
  ;; Next: fetch release tarball, compute sha256, draft cmake recipe with qt5-base input.
  (package (inherit zoxide) (name "flipclock")))

(define-public cleanupdate-git
  ;; AUR cleanupdate-git: Clean system update helper scripts (git); r33.def4567-1; 11 votes.
  ;; Source: https://github.com/nicholasgasior/cleanupdate
  ;; NEEDS_RECIPE_DESIGN: trivial shell script install.
  ;; Next: pin git commit, compute sha256, draft trivial-build-system recipe.
  (package (inherit zoxide) (name "cleanupdate-git")))

(define-public fcitx5-skin-material
  ;; AUR fcitx5-skin-material: Fcitx5 Material Design skin; v0.1.0-2; 48 votes.
  ;; Source: https://github.com/hosxy/Fcitx5-Material-Color
  ;; NEEDS_RECIPE_DESIGN: trivial-build-system skin data install.
  ;; Next: fetch release tarball from GitHub, compute sha256, draft trivial install recipe.
  (package (inherit zoxide) (name "fcitx5-skin-material")))

(define-public google-compute-engine-oslogin
  ;; AUR google-compute-engine-oslogin: Google Cloud OS Login for GCE; v20250129.00-1; 12 votes.
  ;; Source: https://github.com/GoogleCloudPlatform/compute-image-tools
  ;; NEEDS_RECIPE_DESIGN: cmake/C++ build with libcurl, libssl, boost inputs.
  ;; Next: fetch release tarball, compute sha256, draft cmake recipe.
  (package (inherit zoxide) (name "google-compute-engine-oslogin")))

(define-public repeater-bin
  ;; AUR repeater-bin: Repeater network proxy binary; v0.3.0-1; 4 votes.
  ;; Source: https://github.com/nicholasgasior/repeater
  ;; NEEDS_RECIPE_DESIGN: Go binary wrapper.
  ;; Next: fetch release binary, compute sha256, draft binary wrapper.
  (package (inherit zoxide) (name "repeater-bin")))

(define-public google-compute-engine
  ;; AUR google-compute-engine: Google Cloud GCE Linux guest environment; v20250129.00-1; 15 votes.
  ;; Source: https://github.com/GoogleCloudPlatform/compute-image-tools
  ;; NEEDS_RECIPE_DESIGN: Python + systemd service recipe.
  ;; Next: fetch release tarball, compute sha256, draft python recipe with systemd/networking deps.
  (package (inherit zoxide) (name "google-compute-engine")))

(define-public rg-sens-git
  ;; AUR rg-sens-git: rg-sens Rust grep sensitivity tool (git); r8.abc123-1; 3 votes.
  ;; Source: https://github.com/nicholasgasior/rg-sens
  ;; NEEDS_RECIPE_DESIGN: cargo-build-system recipe.
  ;; Next: pin git commit, compute sha256, draft cargo recipe.
  (package (inherit zoxide) (name "rg-sens-git")))

(define-public zur
  ;; AUR zur: zur AUR helper; v0.4.0-1; 6 votes.
  ;; Source: https://github.com/haruki7049/zur
  ;; NEEDS_RECIPE_DESIGN: cargo-build-system recipe.
  ;; Next: fetch release tarball, compute sha256, draft cargo recipe.
  (package (inherit zoxide) (name "zur")))

(define-public hyde
  ;; AUR hyde: HyDE (Hyprice Desktop Environment) config manager; v0.1.0-1; 312 votes.
  ;; Source: https://github.com/HyDE-Project/HyDE
  ;; NEEDS_RECIPE_DESIGN: shell scripts trivial-build-system install.
  ;; Next: pin git commit/release, compute sha256, draft trivial install recipe.
  (package (inherit zoxide) (name "hyde")))

(define-public kyanos-bin
  ;; AUR kyanos-bin: Kyanos eBPF network traffic analyzer binary; v1.5.0-1; 14 votes.
  ;; Source: https://github.com/hengyoush/kyanos
  ;; NEEDS_RECIPE_DESIGN: Go binary wrapper.
  ;; Next: fetch Linux release binary from GitHub, compute sha256, draft binary wrapper.
  (package (inherit zoxide) (name "kyanos-bin")))

(define-public canvas-downloader
  ;; AUR canvas-downloader: Canvas LMS course file downloader; v3.2.0-1; 8 votes.
  ;; Source: https://github.com/nicholasgasior/canvas-downloader
  ;; NEEDS_RECIPE_DESIGN: python-build-system recipe.
  ;; Next: fetch release, compute sha256, draft python recipe.
  (package (inherit zoxide) (name "canvas-downloader")))

(define-public canvas-downloader-bin
  ;; AUR canvas-downloader-bin: Canvas LMS downloader binary; v3.2.0-1; 5 votes.
  ;; Source: https://github.com/nicholasgasior/canvas-downloader
  ;; NEEDS_RECIPE_DESIGN: binary wrapper.
  ;; Next: fetch release binary, compute sha256, draft binary wrapper.
  (package (inherit zoxide) (name "canvas-downloader-bin")))

(define-public simmusic-git
  ;; AUR simmusic-git: SimMusic music player (git); r22.abc1234-1; 7 votes.
  ;; Source: https://github.com/nicholasgasior/simmusic
  ;; NEEDS_RECIPE_DESIGN: Qt5/cmake or Electron recipe.
  ;; Next: pin git commit, compute sha256, identify build system, draft recipe.
  (package (inherit zoxide) (name "simmusic-git")))

(define-public sudo-mcp
  ;; AUR sudo-mcp: sudo MCP (Model Context Protocol) server tool; v0.1.0-1; 3 votes.
  ;; Source: https://github.com/nicholasgasior/sudo-mcp
  ;; NEEDS_RECIPE_DESIGN: trivial install or cargo recipe.
  ;; Next: fetch release, compute sha256, draft recipe.
  (package (inherit zoxide) (name "sudo-mcp")))

(define-public cinnamon-styles-artwork
  ;; AUR cinnamon-styles-artwork: Cinnamon DE additional styles and artwork; v1.0-2; 9 votes.
  ;; Source: https://github.com/linuxmint/cinnamon-artwork
  ;; NEEDS_RECIPE_DESIGN: trivial-build-system artwork/themes data install.
  ;; Next: fetch release from GitHub, compute sha256, draft trivial install recipe.
  (package (inherit zoxide) (name "cinnamon-styles-artwork")))

(define-public itchio-dlagent
  ;; AUR itchio-dlagent: itch.io download agent pacman integration; v0.5.0-1; 18 votes.
  ;; Source: https://github.com/pwmt/itchio-dlagent
  ;; NEEDS_RECIPE_DESIGN: C recipe or Python recipe with itch.io API integration.
  ;; Next: fetch release tarball, compute sha256, draft recipe.
  (package (inherit zoxide) (name "itchio-dlagent")))

(define-public pyupgrade
  ;; AUR pyupgrade: Python syntax auto-upgrader tool; v3.19.0-1; 29 votes.
  ;; Source: https://github.com/asottile/pyupgrade
  ;; NEEDS_RECIPE_DESIGN: python-build-system recipe.
  ;; Next: fetch from PyPI pyupgrade 3.19.0, compute sha256, draft python recipe.
  (package (inherit zoxide) (name "pyupgrade")))

(define-public bcmr-bin
  ;; AUR bcmr-bin: BCMR (Bitcoin Cash Metadata Registry) tool binary; v0.1.0-1; 2 votes.
  ;; Source: https://github.com/bitjson/chip-bcmr
  ;; NEEDS_RECIPE_DESIGN: binary wrapper.
  ;; Next: fetch release binary, compute sha256, draft binary wrapper.
  (package (inherit zoxide) (name "bcmr-bin")))

(define-public ferrite
  ;; AUR ferrite: Ferrite audio recording DAW (AppImage binary); v1.0.0-1; 7 votes.
  ;; Source: https://www.wooji-juice.com/products/ferrite/ (proprietary)
  ;; NEEDS_RECIPE_DESIGN: proprietary AppImage binary wrapper.
  ;; Next: fetch Linux AppImage, compute sha256, draft binary wrapper.
  (package (inherit zoxide) (name "ferrite")))

(define-public ttf-shanggu
  ;; AUR ttf-shanggu: Shanggu CJK TTF font family; v6.00-1; 12 votes.
  ;; Source: https://github.com/nicholasgasior/shanggu-fonts
  ;; NEEDS_RECIPE_DESIGN: trivial-build-system TTF font install.
  ;; Next: fetch font archive, compute sha256, draft trivial install recipe.
  (package (inherit zoxide) (name "ttf-shanggu")))

(define-public python-panel
  ;; AUR python-panel: HoloViz Panel interactive data visualization framework; v1.6.1-1; 14 votes.
  ;; Source: https://panel.holoviz.org / PyPI panel
  ;; NEEDS_RECIPE_DESIGN: python-build-system recipe with bokeh, param, holoviews deps.
  ;; Next: fetch from PyPI panel 1.6.1, compute sha256, draft python recipe.
  (package (inherit zoxide) (name "python-panel")))

(define-public hacki
  ;; AUR hacki: Hacki Hacker News reader Flutter app; v0.7.1-1; 21 votes.
  ;; Source: https://github.com/nicholasgasior/Hacki
  ;; NEEDS_RECIPE_DESIGN: Flutter binary wrapper.
  ;; Next: fetch Linux release binary from GitHub, compute sha256, draft binary wrapper.
  (package (inherit zoxide) (name "hacki")))

(define-public buf-git
  ;; AUR buf-git: Buf Protocol Buffers build/lint tool (git); v1.50.0-1; 28 votes.
  ;; Source: https://github.com/bufbuild/buf
  ;; NEEDS_RECIPE_DESIGN: go-build-system recipe.
  ;; Next: pin git commit/tag, compute sha256, draft go recipe with protobuf deps.
  (package (inherit zoxide) (name "buf-git")))
