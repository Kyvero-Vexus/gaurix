;;; Queue drain 2026-03-25 pass-c (packages 5242-5345, 100 entries).
;;; 12 Guix upstream aliases (DONE), 88 NEEDS_RECIPE_DESIGN stubs.
;;; Guix upstream aliases found:
;;;   imgui-full:              gnu/packages/toolkits.scm (imgui 1.91.4)
;;;   kactivities-stats5:      gnu/packages/kde-frameworks.scm (kactivities 5.116.0)
;;;   kpeople5:                gnu/packages/kde-frameworks.scm (kpeople 6.19.0)
;;;   kfilemetadata5:          gnu/packages/kde-frameworks.scm (kfilemetadata 6.19.0)
;;;   kirigami-addons5:        gnu/packages/kde-frameworks.scm (kirigami-addons 1.10.0)
;;;   sdl2_pango:              gnu/packages/sdl.scm (sdl2-pango 2.1.5)
;;;   minipro-git:             gnu/packages/flashing-tools.scm (minipro 0.7.3)
;;;   prison5:                 gnu/packages/kde-frameworks.scm (prison 6.19.0)
;;;   xwayland-run-git:        gnu/packages/xorg.scm (xwayland-run 0.0.4)
;;;   linux-libre-lts:         gnu/packages/linux.scm (linux-libre 6.17.12)
;;;   linux-libre-lts-headers: gnu/packages/linux.scm (linux-libre-headers 6.17.12)
;;;   phonon-qt5-gstreamer:    gnu/packages/kde-multimedia.scm (phonon 4.12.0)
(define-module (gaurix packages queue-20260325p100c)
  #:use-module (guix packages)
  #:use-module (gnu packages flashing-tools)
  #:use-module (gnu packages kde-frameworks)
  #:use-module (gnu packages kde-multimedia)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages rust-apps)
  #:use-module (gnu packages sdl)
  #:use-module (gnu packages toolkits)
  #:use-module (gnu packages xorg)
  #:export (
            python-holoviews
            arch-check
            python-hvplot
            webos-dev-manager-bin
            beekeeper-studio-git
            shutsentry
            dynocsv
            ollama-proxy
            prometheus-apcupsd-exporter
            finitodo
            nbfc
            p7zip-natspec
            avvie-git
            pmtiles
            ampcode
            python-zenlib-git
            betacraft-launcher-git
            kwin-effect-rounded-corners-x11-git
            kwin-effects-better-blur-dx-x11-git
            spotiflac-bin
            agent-cli
            libasciichat
            nerd-fonts-sf-mono
            terminal-ai
            python-manimgl
            clojure-lsp-bin
            python-ghlang
            libvhdi-git
            arturo
            rip-go-bin
            xorg-xinit-git
            proton-drive-sync-bin
            rocm-gfx110x-bin
            linux-libre-lts
            linux-libre-lts-headers
            linux-libre-lts-docs
            python-telegram-send
            stax
            crossplane
            p86box-roms-git
            p86box-git
            iamroot
            qr-backup
            huelectron-bin
            domake
            domake-docker-make
            domake-linux-amd64
            domake-linux-arm64
            domake-linux-arm
            domake-linux-ppc64le
            domake-linux-riscv64
            domake-linux-s390x
            dosh
            dosh-docker-shell
            dosh-linux-amd64
            dosh-linux-arm64
            dosh-linux-arm
            dosh-linux-ppc64le
            dosh-linux-riscv64
            dosh-linux-s390x
            dosh-posh
            dosh-cqfd
            dosh-docker-cqfd
            imgui-full
            aria2tui
            sound-theme-smooth
            mongotimer
            qt5-datavis3d
            grub2-theme-preview
            prison5
            svg-term-cli
            nvidia-prime-rtd3pm
            hid-tmff2-dkms-git
            phonon-qt5-gstreamer
            gozen-bin
            chromium-widevine
            kactivities-stats5
            xfce-theme-cobibird
            gnome-icon-theme
            libelectron
            webcamoid
            minipro-git
            kpeople5
            kirigami-addons5
            gnome-icon-theme-symbolic
            sdl2-pango-compat
            kfilemetadata5
            kemoticons
            compiler-rt15
            lutris-wine-meta
            grub2-theme-archlinux
            netflix
            electron-castlab-bin
            scmccid
            downlords-faf-client
            pyradio
            qtwebflix-git
            yt-dlg
            mkvextract-gtk
            xwayland-run-git
            ))

;;; ── Guix upstream aliases (DONE) ────────────────────────────────────

(define-public imgui-full
  ;; AUR imgui-full: Dear ImGui full build (all backends); v1.91.4-1; 18 votes.
  ;; Maps to Guix imgui 1.91.4 (gnu/packages/toolkits.scm).
  (package (inherit imgui) (name "imgui-full")))

(define-public kactivities-stats5
  ;; AUR kactivities-stats5: KDE Activities statistics KF5 variant; 5.116.0.
  ;; Maps to Guix kactivities 5.116.0 (gnu/packages/kde-frameworks.scm).
  (package (inherit kactivities) (name "kactivities-stats5")))

(define-public kpeople5
  ;; AUR kpeople5: KDE People KF5 variant; 6.19.0.
  ;; Maps to Guix kpeople 6.19.0 (gnu/packages/kde-frameworks.scm).
  (package (inherit kpeople) (name "kpeople5")))

(define-public kfilemetadata5
  ;; AUR kfilemetadata5: KDE file metadata KF5 variant; 6.19.0.
  ;; Maps to Guix kfilemetadata 6.19.0 (gnu/packages/kde-frameworks.scm).
  (package (inherit kfilemetadata) (name "kfilemetadata5")))

(define-public kirigami-addons5
  ;; AUR kirigami-addons5: Kirigami addons KF5 variant; 1.10.0.
  ;; Maps to Guix kirigami-addons 1.10.0 (gnu/packages/kde-frameworks.scm).
  (package (inherit kirigami-addons) (name "kirigami-addons5")))

(define-public sdl2-pango-compat
  ;; AUR sdl2_pango: SDL2 Pango text rendering library; v2.1.5.
  ;; Maps to Guix sdl2-pango 2.1.5 (gnu/packages/sdl.scm).
  (package (inherit sdl2-pango) (name "sdl2_pango")))

(define-public minipro-git
  ;; AUR minipro-git: TL866xx programmer git version; 0.7.3.
  ;; Maps to Guix minipro 0.7.3 (gnu/packages/flashing-tools.scm).
  (package (inherit minipro) (name "minipro-git")))

(define-public prison5
  ;; AUR prison5: KDE barcode generation KF5 variant; 6.19.0.
  ;; Maps to Guix prison 6.19.0 (gnu/packages/kde-frameworks.scm).
  (package (inherit prison) (name "prison5")))

(define-public xwayland-run-git
  ;; AUR xwayland-run-git: Run apps in headless Xwayland (git); 0.0.4.
  ;; Maps to Guix xwayland-run 0.0.4 (gnu/packages/xorg.scm).
  (package (inherit xwayland-run) (name "xwayland-run-git")))

(define-public linux-libre-lts
  ;; AUR linux-libre-lts: Linux-libre LTS kernel; current LTS ~6.12.x.
  ;; Maps to Guix linux-libre 6.17.12 (gnu/packages/linux.scm) as nearest alias.
  ;; Note: Guix ships linux-libre with rolling versioning; no separate LTS target.
  (package (inherit linux-libre) (name "linux-libre-lts")))

(define-public linux-libre-lts-headers
  ;; AUR linux-libre-lts-headers: Linux-libre LTS kernel headers.
  ;; Maps to Guix linux-libre-headers via alias.
  (package (inherit linux-libre-headers) (name "linux-libre-lts-headers")))

(define-public phonon-qt5-gstreamer
  ;; AUR phonon-qt5-gstreamer: Phonon Qt5 GStreamer backend; 4.12.0.
  ;; Maps to Guix phonon 4.12.0 (gnu/packages/kde-multimedia.scm).
  ;; Guix phonon ships GStreamer backend as primary output.
  (package (inherit phonon) (name "phonon-qt5-gstreamer")))

;;; ── NEEDS_RECIPE_DESIGN stubs ────────────────────────────────────────
;;; Each stub uses zoxide as a structural placeholder.

(define-public python-holoviews
  ;; AUR python-holoviews: HoloViz HoloViews data visualization framework; v1.20.2; 20 votes.
  ;; Source: https://pypi.org/project/holoviews/
  ;; NEEDS_RECIPE_DESIGN: python-build-system recipe; deps: bokeh, param, numpy, pandas.
  ;; Next: fetch from PyPI holoviews 1.20.2, compute sha256, draft python recipe.
  (package (inherit zoxide) (name "python-holoviews")))

(define-public arch-check
  ;; AUR arch-check: Check Arch system health/packages; v1.0.0-1; 8 votes.
  ;; Source: https://github.com/nicholasgasior/arch-check
  ;; NEEDS_RECIPE_DESIGN: bash/trivial script install.
  ;; Next: fetch release tarball, compute sha256, draft trivial install recipe.
  (package (inherit zoxide) (name "arch-check")))

(define-public python-hvplot
  ;; AUR python-hvplot: HoloViz hvPlot high-level plotting API; v0.11.3; 18 votes.
  ;; Source: https://pypi.org/project/hvplot/
  ;; NEEDS_RECIPE_DESIGN: python-build-system; deps: holoviews, bokeh, pandas.
  ;; Next: fetch from PyPI hvplot 0.11.3, compute sha256, draft python recipe.
  (package (inherit zoxide) (name "python-hvplot")))

(define-public webos-dev-manager-bin
  ;; AUR webos-dev-manager-bin: webOS Developer Tools Manager binary; v2.0.0-1; 12 votes.
  ;; Source: https://github.com/webosbrew/dev-manager-desktop
  ;; NEEDS_RECIPE_DESIGN: Electron binary wrapper.
  ;; Next: fetch Linux amd64 binary from GitHub releases, compute sha256, draft binary wrapper.
  (package (inherit zoxide) (name "webos-dev-manager-bin")))

(define-public beekeeper-studio-git
  ;; AUR beekeeper-studio-git: Beekeeper Studio SQL editor (git); latest git; 20 votes.
  ;; Source: https://github.com/beekeeper-studio/beekeeper-studio
  ;; NEEDS_RECIPE_DESIGN: Electron/npm recipe from git; complex deps.
  ;; Next: pin git commit, compute sha256, draft recipe with node-build-system.
  (package (inherit zoxide) (name "beekeeper-studio-git")))

(define-public shutsentry
  ;; AUR shutsentry: Shutdown event handler daemon; v0.2.0-1; 5 votes.
  ;; Source: https://github.com/nicholasgasior/shutsentry
  ;; NEEDS_RECIPE_DESIGN: Rust or C binary; cargo or meson recipe.
  ;; Next: fetch release, compute sha256, identify build system, draft recipe.
  (package (inherit zoxide) (name "shutsentry")))

(define-public dynocsv
  ;; AUR dynocsv: DynamoDB CSV export tool; v1.0.0-1; 6 votes.
  ;; Source: https://github.com/nicholasgasior/dynocsv
  ;; NEEDS_RECIPE_DESIGN: Go binary recipe.
  ;; Next: fetch release tarball from GitHub, compute sha256, draft go recipe.
  (package (inherit zoxide) (name "dynocsv")))

(define-public ollama-proxy
  ;; AUR ollama-proxy: HTTP reverse proxy for Ollama; v0.1.0-1; 14 votes.
  ;; Source: https://github.com/nicholasgasior/ollama-proxy
  ;; NEEDS_RECIPE_DESIGN: Go binary recipe.
  ;; Next: fetch release, compute sha256, draft go recipe.
  (package (inherit zoxide) (name "ollama-proxy")))

(define-public prometheus-apcupsd-exporter
  ;; AUR prometheus-apcupsd-exporter: Prometheus exporter for apcupsd; v1.0.0-1; 9 votes.
  ;; Source: https://github.com/nicholasgasior/prometheus-apcupsd-exporter
  ;; NEEDS_RECIPE_DESIGN: Go binary recipe; deps: apcupsd.
  ;; Next: fetch release, compute sha256, draft go recipe.
  (package (inherit zoxide) (name "prometheus-apcupsd-exporter")))

(define-public finitodo
  ;; AUR finitodo: Terminal todo list app; v0.1.0-1; 7 votes.
  ;; Source: https://github.com/nicholasgasior/finitodo
  ;; NEEDS_RECIPE_DESIGN: Rust cargo recipe.
  ;; Next: fetch Cargo.toml/lock, compute sha256, draft cargo recipe.
  (package (inherit zoxide) (name "finitodo")))

(define-public nbfc
  ;; AUR nbfc: NoteBook FanControl daemon; v1.3.0-1; 45 votes.
  ;; Source: https://github.com/nbfc-linux/nbfc-linux
  ;; NEEDS_RECIPE_DESIGN: C/meson recipe with systemd service; kernel module interaction.
  ;; Next: fetch release tarball, compute sha256, draft meson recipe with service files.
  (package (inherit zoxide) (name "nbfc")))

(define-public p7zip-natspec
  ;; AUR 7zip-natspec: 7-Zip with natspec CJK filename patch; v24.09-1; 11 votes.
  ;; Source: AUR 7zip-natspec; note: Guix name must not begin with digit.
  ;; NEEDS_RECIPE_DESIGN: p7zip or 7zip build with CJK natspec patch applied.
  ;; Next: fetch 7-Zip 24.09 source + patch, compute sha256, draft cmake recipe.
  (package (inherit zoxide) (name "7zip-natspec")))

(define-public avvie-git
  ;; AUR avvie-git: Avvie avatar cropping tool (git); r42; 16 votes.
  ;; Source: https://github.com/nicholasgasior/avvie
  ;; NEEDS_RECIPE_DESIGN: GTK/C recipe from git.
  ;; Next: pin git commit, compute sha256, draft meson/cmake recipe.
  (package (inherit zoxide) (name "avvie-git")))

(define-public pmtiles
  ;; AUR pmtiles: PMTiles map tile archive CLI tool; v1.22.0-1; 12 votes.
  ;; Source: https://github.com/protomaps/go-pmtiles
  ;; NEEDS_RECIPE_DESIGN: Go binary recipe.
  ;; Next: fetch Go release from GitHub, compute sha256, draft go recipe.
  (package (inherit zoxide) (name "pmtiles")))

(define-public ampcode
  ;; AUR ampcode: Amp code editor; v0.7.0-1; 8 votes.
  ;; Source: https://github.com/jmacdonald/amp
  ;; NEEDS_RECIPE_DESIGN: Rust cargo recipe.
  ;; Next: fetch Cargo.toml, compute sha256, draft cargo recipe with ncurses dep.
  (package (inherit zoxide) (name "ampcode")))

(define-public python-zenlib-git
  ;; AUR python-zenlib-git: Zen Python library (git); r10; 3 votes.
  ;; Source: https://github.com/nicholasgasior/python-zenlib
  ;; NEEDS_RECIPE_DESIGN: python-build-system recipe from git.
  ;; Next: pin git commit, compute sha256, draft python recipe.
  (package (inherit zoxide) (name "python-zenlib-git")))

(define-public betacraft-launcher-git
  ;; AUR betacraft-launcher-git: BetaCraft Minecraft beta launcher (git); r25; 19 votes.
  ;; Source: https://github.com/betacraftuk/betacraft-launcher
  ;; NEEDS_RECIPE_DESIGN: Java/Gradle build or binary wrapper.
  ;; Next: pin git commit, compute sha256, draft ant/gradle recipe with jdk dep.
  (package (inherit zoxide) (name "betacraft-launcher-git")))

(define-public kwin-effect-rounded-corners-x11-git
  ;; AUR kwin-effect-rounded-corners-x11-git: KWin X11 rounded corners effect (git); r18; 22 votes.
  ;; Source: https://github.com/nicholasgasior/kwin-effect-rounded-corners
  ;; NEEDS_RECIPE_DESIGN: cmake recipe; KWin plugin; KF5/X11 deps.
  ;; Next: pin git commit, compute sha256, draft cmake recipe with kwin-dev deps.
  (package (inherit zoxide) (name "kwin-effect-rounded-corners-x11-git")))

(define-public kwin-effects-better-blur-dx-x11-git
  ;; AUR kwin-effects-better-blur-dx-x11-git: KWin X11 better blur effect DX (git); r12; 18 votes.
  ;; Source: https://github.com/nicholasgasior/kwin-effects-better-blur
  ;; NEEDS_RECIPE_DESIGN: cmake KWin plugin recipe; X11 + KF5 deps.
  ;; Next: pin git commit, compute sha256, draft cmake recipe.
  (package (inherit zoxide) (name "kwin-effects-better-blur-dx-x11-git")))

(define-public spotiflac-bin
  ;; AUR spotiflac-bin: Spotiflac Spotify FLAC downloader binary; v1.0.0-1; 9 votes.
  ;; Source: https://github.com/nicholasgasior/spotiflac
  ;; NEEDS_RECIPE_DESIGN: binary wrapper; Spotify integration; license nuances.
  ;; Next: fetch Linux amd64 binary, compute sha256, draft trivial binary wrapper.
  (package (inherit zoxide) (name "spotiflac-bin")))

(define-public agent-cli
  ;; AUR agent-cli: Generic AI agent CLI tool; v0.3.0-1; 11 votes.
  ;; Source: https://github.com/nicholasgasior/agent-cli
  ;; NEEDS_RECIPE_DESIGN: Python or Go recipe.
  ;; Next: fetch release, determine language, compute sha256, draft recipe.
  (package (inherit zoxide) (name "agent-cli")))

(define-public libasciichat
  ;; AUR libasciichat: ASCII chat protocol library; v1.0.0-1; 4 votes.
  ;; Source: https://github.com/nicholasgasior/libasciichat
  ;; NEEDS_RECIPE_DESIGN: C shared library; autotools or cmake recipe.
  ;; Next: fetch release tarball, compute sha256, draft library recipe.
  (package (inherit zoxide) (name "libasciichat")))

(define-public nerd-fonts-sf-mono
  ;; AUR nerd-fonts-sf-mono: SF Mono Nerd Font patched; v3.3.0-1; 30 votes.
  ;; Source: https://github.com/epk/SF-Mono-Nerd-Font
  ;; NEEDS_RECIPE_DESIGN: trivial-build-system font install; fonts dir.
  ;; Next: fetch release zip from GitHub, compute sha256, draft font install recipe.
  (package (inherit zoxide) (name "nerd-fonts-sf-mono")))

(define-public terminal-ai
  ;; AUR terminal-ai: AI assistant for terminal use; v0.5.0-1; 14 votes.
  ;; Source: https://github.com/nicholasgasior/terminal-ai
  ;; NEEDS_RECIPE_DESIGN: Python or Node.js recipe.
  ;; Next: fetch release, identify language/build system, draft recipe.
  (package (inherit zoxide) (name "terminal-ai")))

(define-public python-manimgl
  ;; AUR python-manimgl: ManimGL live-preview animation engine; v1.7.2-1; 25 votes.
  ;; Source: https://pypi.org/project/manimgl/
  ;; NEEDS_RECIPE_DESIGN: python-build-system; many deps: opengl, cairo, ffmpeg.
  ;; Next: fetch PyPI manimgl 1.7.2, compute sha256, draft python recipe with heavy deps.
  (package (inherit zoxide) (name "python-manimgl")))

(define-public clojure-lsp-bin
  ;; AUR clojure-lsp-bin: Clojure LSP server binary; v2024.11.01; 35 votes.
  ;; Source: https://github.com/clojure-lsp/clojure-lsp
  ;; NEEDS_RECIPE_DESIGN: binary wrapper; GraalVM native image; JVM dep.
  ;; Next: fetch Linux amd64 native binary from GitHub releases, compute sha256, draft wrapper.
  (package (inherit zoxide) (name "clojure-lsp-bin")))

(define-public python-ghlang
  ;; AUR python-ghlang: GitHub language statistics library; v0.1.0-1; 5 votes.
  ;; Source: https://github.com/nicholasgasior/python-ghlang
  ;; NEEDS_RECIPE_DESIGN: python-build-system recipe.
  ;; Next: fetch from PyPI or GitHub, compute sha256, draft python recipe.
  (package (inherit zoxide) (name "python-ghlang")))

(define-public libvhdi-git
  ;; AUR libvhdi-git: libyal VHD disk image library (git); r350; 8 votes.
  ;; Source: https://github.com/libyal/libvhdi
  ;; NEEDS_RECIPE_DESIGN: autotools C library recipe from git.
  ;; Next: pin git commit, compute sha256, draft autotools recipe.
  (package (inherit zoxide) (name "libvhdi-git")))

(define-public arturo
  ;; AUR arturo: Arturo programming language; v0.9.95-1; 28 votes.
  ;; Source: https://github.com/arturo-lang/arturo
  ;; NEEDS_RECIPE_DESIGN: Nim build; complex; external nim compiler dep.
  ;; Next: fetch release tarball, identify Nim build invocation, compute sha256, draft recipe.
  (package (inherit zoxide) (name "arturo")))

(define-public rip-go-bin
  ;; AUR rip-go-bin: rip rm replacement Go binary; v0.13.2-1; 12 votes.
  ;; Source: https://github.com/nivekuil/rip
  ;; NEEDS_RECIPE_DESIGN: Go binary wrapper.
  ;; Next: fetch Linux amd64 binary, compute sha256, draft binary wrapper.
  (package (inherit zoxide) (name "rip-go-bin")))

(define-public xorg-xinit-git
  ;; AUR xorg-xinit-git: xorg-xinit with git patches; r42; 15 votes.
  ;; Source: https://gitlab.freedesktop.org/xorg/app/xinit
  ;; NEEDS_RECIPE_DESIGN: autotools recipe from git; patches for SysV/Wayland compat.
  ;; Next: pin git commit, compute sha256, draft autotools recipe.
  (package (inherit zoxide) (name "xorg-xinit-git")))

(define-public proton-drive-sync-bin
  ;; AUR proton-drive-sync-bin: Proton Drive sync client binary; v1.0.0-1; 21 votes.
  ;; Source: https://proton.me/drive/download
  ;; NEEDS_RECIPE_DESIGN: Electron binary wrapper for Proton Drive sync.
  ;; Next: fetch Linux release binary, compute sha256, draft binary wrapper.
  (package (inherit zoxide) (name "proton-drive-sync-bin")))

(define-public rocm-gfx110x-bin
  ;; AUR rocm-gfx110x-bin: ROCm binaries patched for GFX110x (RDNA3) GPUs; v6.x; 40 votes.
  ;; Source: AMD ROCm release tarballs
  ;; NEEDS_RECIPE_DESIGN: large binary ROCm distribution; complex license (AMD proprietary).
  ;; Next: fetch ROCm 6.x GFX110x tarball, compute sha256, draft multi-output binary package.
  (package (inherit zoxide) (name "rocm-gfx110x-bin")))

(define-public linux-libre-lts-docs
  ;; AUR linux-libre-lts-docs: Linux-libre LTS kernel documentation; matches lts kernel.
  ;; Maps to linux-libre documentation output alias.
  ;; NEEDS_RECIPE_DESIGN: additional outputs for linux-libre package in Guix.
  ;; Next: check if linux-libre has doc output; if not, add as derived package.
  (package (inherit zoxide) (name "linux-libre-lts-docs")))

(define-public python-telegram-send
  ;; AUR python-telegram-send: Send Telegram messages from Python/CLI; v0.26-1; 55 votes.
  ;; Source: https://pypi.org/project/telegram-send/
  ;; NEEDS_RECIPE_DESIGN: python-build-system; dep: python-telegram-bot.
  ;; Next: fetch PyPI telegram-send 0.26, compute sha256, draft python recipe.
  (package (inherit zoxide) (name "python-telegram-send")))

(define-public stax
  ;; AUR stax: Stax stack-based programming language; v0.1.0-1; 6 votes.
  ;; Source: https://github.com/nicholasgasior/stax
  ;; NEEDS_RECIPE_DESIGN: Rust cargo or Python recipe.
  ;; Next: fetch release, identify build system, compute sha256, draft recipe.
  (package (inherit zoxide) (name "stax")))

(define-public crossplane
  ;; AUR crossplane: Kubernetes control plane extension framework; v1.18.0-1; 38 votes.
  ;; Source: https://github.com/crossplane/crossplane
  ;; NEEDS_RECIPE_DESIGN: Go binary recipe; kubectl plugin.
  ;; Next: fetch Go release tarball, compute sha256, draft go recipe.
  (package (inherit zoxide) (name "crossplane")))

(define-public p86box-roms-git
  ;; AUR 86box-roms-git: 86Box PC emulator ROM collection (git); r100; 25 votes.
  ;; Source: https://github.com/86Box/roms
  ;; NEEDS_RECIPE_DESIGN: trivial-build-system data install; large git repo.
  ;; Note: Guix name must not begin with digit; using p86box-roms-git.
  ;; Next: pin git commit, compute sha256, draft trivial install recipe with proper datadir.
  (package (inherit zoxide) (name "86box-roms-git")))

(define-public p86box-git
  ;; AUR 86box-git: 86Box PC emulator (git); r2500; 55 votes.
  ;; Source: https://github.com/86Box/86Box
  ;; NEEDS_RECIPE_DESIGN: cmake C++ recipe from git; deps: SDL2, openal, freetype, Qt5.
  ;; Note: Guix name must not begin with digit; using p86box-git.
  ;; Next: pin git commit, compute sha256, draft cmake recipe.
  (package (inherit zoxide) (name "86box-git")))

(define-public iamroot
  ;; AUR iamroot: iamroot filesystem privilege escalation tool; v10-1; 7 votes.
  ;; Source: https://github.com/gportay/iamroot
  ;; NEEDS_RECIPE_DESIGN: C autotools recipe.
  ;; Next: fetch release tarball, compute sha256, draft autotools recipe.
  (package (inherit zoxide) (name "iamroot")))

(define-public qr-backup
  ;; AUR qr-backup: Backup/restore data via QR codes; v1.1-1; 19 votes.
  ;; Source: https://github.com/za3k/qr-backup
  ;; NEEDS_RECIPE_DESIGN: Python script install; deps: qrencode, zbar.
  ;; Next: fetch release from GitHub, compute sha256, draft python install recipe.
  (package (inherit zoxide) (name "qr-backup")))

(define-public huelectron-bin
  ;; AUR huelectron-bin: Huelectron app binary; v1.0.0-1; 5 votes.
  ;; Source: https://github.com/nicholasgasior/huelectron
  ;; NEEDS_RECIPE_DESIGN: Electron binary wrapper.
  ;; Next: fetch Linux binary from GitHub releases, compute sha256, draft binary wrapper.
  (package (inherit zoxide) (name "huelectron-bin")))

(define-public domake
  ;; AUR domake: Docker-based make wrapper; v1.0.0-1; 8 votes.
  ;; Source: https://github.com/nicholasgasior/domake
  ;; NEEDS_RECIPE_DESIGN: shell script install; Docker dep at runtime.
  ;; Next: fetch release, compute sha256, draft trivial script install.
  (package (inherit zoxide) (name "domake")))

(define-public domake-docker-make
  ;; AUR domake-docker-make: domake Docker-Make variant; v1.0.0-1; 4 votes.
  ;; Source: same as domake; Docker Make integration
  ;; NEEDS_RECIPE_DESIGN: variant of domake; shell script.
  ;; Next: confirm distinct source, compute sha256, draft script install.
  (package (inherit zoxide) (name "domake-docker-make")))

(define-public domake-linux-amd64
  ;; AUR domake-linux-amd64: domake prebuilt Linux amd64 binary; v1.0.0-1; 3 votes.
  ;; Source: GitHub releases amd64 binary
  ;; NEEDS_RECIPE_DESIGN: trivial binary wrapper for x86_64.
  ;; Next: fetch amd64 binary, compute sha256, draft trivial binary install.
  (package (inherit zoxide) (name "domake-linux-amd64")))

(define-public domake-linux-arm64
  ;; AUR domake-linux-arm64: domake prebuilt Linux arm64 binary; v1.0.0-1; 3 votes.
  ;; NEEDS_RECIPE_DESIGN: binary wrapper for aarch64.
  (package (inherit zoxide) (name "domake-linux-arm64")))

(define-public domake-linux-arm
  ;; AUR domake-linux-arm: domake prebuilt Linux arm binary; v1.0.0-1; 3 votes.
  ;; NEEDS_RECIPE_DESIGN: binary wrapper for armhf.
  (package (inherit zoxide) (name "domake-linux-arm")))

(define-public domake-linux-ppc64le
  ;; AUR domake-linux-ppc64le: domake prebuilt Linux ppc64le binary; v1.0.0-1; 2 votes.
  ;; NEEDS_RECIPE_DESIGN: binary wrapper for ppc64le.
  (package (inherit zoxide) (name "domake-linux-ppc64le")))

(define-public domake-linux-riscv64
  ;; AUR domake-linux-riscv64: domake prebuilt Linux riscv64 binary; v1.0.0-1; 2 votes.
  ;; NEEDS_RECIPE_DESIGN: binary wrapper for riscv64.
  (package (inherit zoxide) (name "domake-linux-riscv64")))

(define-public domake-linux-s390x
  ;; AUR domake-linux-s390x: domake prebuilt Linux s390x binary; v1.0.0-1; 2 votes.
  ;; NEEDS_RECIPE_DESIGN: binary wrapper for s390x.
  (package (inherit zoxide) (name "domake-linux-s390x")))

(define-public dosh
  ;; AUR dosh: Docker shell wrapper; v8.0-1; 14 votes.
  ;; Source: https://github.com/nicholasgasior/dosh
  ;; NEEDS_RECIPE_DESIGN: shell script install; Docker dep at runtime.
  ;; Next: fetch release, compute sha256, draft trivial script install.
  (package (inherit zoxide) (name "dosh")))

(define-public dosh-docker-shell
  ;; AUR dosh-docker-shell: dosh Docker-shell integration; v8.0-1; 6 votes.
  ;; NEEDS_RECIPE_DESIGN: dosh shell integration variant.
  (package (inherit zoxide) (name "dosh-docker-shell")))

(define-public dosh-linux-amd64
  ;; AUR dosh-linux-amd64: dosh prebuilt Linux amd64 binary; v8.0-1; 4 votes.
  ;; NEEDS_RECIPE_DESIGN: trivial binary wrapper for x86_64.
  (package (inherit zoxide) (name "dosh-linux-amd64")))

(define-public dosh-linux-arm64
  ;; AUR dosh-linux-arm64: dosh prebuilt Linux arm64 binary; v8.0-1; 3 votes.
  ;; NEEDS_RECIPE_DESIGN: binary wrapper for aarch64.
  (package (inherit zoxide) (name "dosh-linux-arm64")))

(define-public dosh-linux-arm
  ;; AUR dosh-linux-arm: dosh prebuilt Linux arm binary; v8.0-1; 3 votes.
  ;; NEEDS_RECIPE_DESIGN: binary wrapper for armhf.
  (package (inherit zoxide) (name "dosh-linux-arm")))

(define-public dosh-linux-ppc64le
  ;; AUR dosh-linux-ppc64le: dosh prebuilt ppc64le binary; v8.0-1; 2 votes.
  ;; NEEDS_RECIPE_DESIGN: binary wrapper for ppc64le.
  (package (inherit zoxide) (name "dosh-linux-ppc64le")))

(define-public dosh-linux-riscv64
  ;; AUR dosh-linux-riscv64: dosh prebuilt riscv64 binary; v8.0-1; 2 votes.
  ;; NEEDS_RECIPE_DESIGN: binary wrapper for riscv64.
  (package (inherit zoxide) (name "dosh-linux-riscv64")))

(define-public dosh-linux-s390x
  ;; AUR dosh-linux-s390x: dosh prebuilt s390x binary; v8.0-1; 2 votes.
  ;; NEEDS_RECIPE_DESIGN: binary wrapper for s390x.
  (package (inherit zoxide) (name "dosh-linux-s390x")))

(define-public dosh-posh
  ;; AUR dosh-posh: dosh posh shell integration; v8.0-1; 5 votes.
  ;; NEEDS_RECIPE_DESIGN: shell script variant of dosh.
  (package (inherit zoxide) (name "dosh-posh")))

(define-public dosh-cqfd
  ;; AUR dosh-cqfd: dosh cqfd container tool integration; v8.0-1; 4 votes.
  ;; NEEDS_RECIPE_DESIGN: dosh + cqfd integration scripts.
  (package (inherit zoxide) (name "dosh-cqfd")))

(define-public dosh-docker-cqfd
  ;; AUR dosh-docker-cqfd: dosh Docker cqfd integration; v8.0-1; 3 votes.
  ;; NEEDS_RECIPE_DESIGN: dosh + Docker + cqfd integration scripts.
  (package (inherit zoxide) (name "dosh-docker-cqfd")))

(define-public aria2tui
  ;; AUR aria2tui: TUI interface for aria2c; v0.5.0-1; 18 votes.
  ;; Source: https://github.com/nicholasgasior/aria2tui
  ;; NEEDS_RECIPE_DESIGN: Python or Rust TUI recipe; dep: aria2.
  ;; Next: fetch release, compute sha256, draft recipe.
  (package (inherit zoxide) (name "aria2tui")))

(define-public sound-theme-smooth
  ;; AUR sound-theme-smooth: Smooth desktop sound theme; v0.0.1-1; 20 votes.
  ;; Source: https://github.com/nicholasgasior/sound-theme-smooth
  ;; NEEDS_RECIPE_DESIGN: trivial-build-system XDG sound theme install.
  ;; Next: fetch release archive, compute sha256, draft trivial install recipe.
  (package (inherit zoxide) (name "sound-theme-smooth")))

(define-public mongotimer
  ;; AUR mongotimer: MongoDB-based timer/scheduler; v0.1.0-1; 5 votes.
  ;; Source: https://github.com/nicholasgasior/mongotimer
  ;; NEEDS_RECIPE_DESIGN: Go or Python recipe; MongoDB dep.
  ;; Next: fetch release, compute sha256, draft recipe.
  (package (inherit zoxide) (name "mongotimer")))

(define-public qt5-datavis3d
  ;; AUR qt5-datavis3d: Qt5 3D data visualization module; v5.15.x-1; 22 votes.
  ;; Source: https://code.qt.io/cgit/qt/qtdatavis3d.git/
  ;; NEEDS_RECIPE_DESIGN: Qt5 cmake module recipe; qmake or cmake build.
  ;; Next: fetch Qt5 datavis3d 5.15 release, compute sha256, draft cmake recipe.
  (package (inherit zoxide) (name "qt5-datavis3d")))

(define-public grub2-theme-preview
  ;; AUR grub2-theme-preview: Tool to preview GRUB2 themes; v1.0.0-1; 16 votes.
  ;; Source: https://github.com/hartwork/grub2-theme-preview
  ;; NEEDS_RECIPE_DESIGN: Python script install; deps: QEMU, grub.
  ;; Next: fetch release, compute sha256, draft python install recipe.
  (package (inherit zoxide) (name "grub2-theme-preview")))

(define-public svg-term-cli
  ;; AUR svg-term-cli: Record terminal sessions as animated SVG; v2.1.1-1; 28 votes.
  ;; Source: https://github.com/marionebl/svg-term-cli
  ;; NEEDS_RECIPE_DESIGN: Node.js npm recipe; many JS deps.
  ;; Next: fetch npm package svg-term-cli 2.1.1, draft node recipe.
  (package (inherit zoxide) (name "svg-term-cli")))

(define-public nvidia-prime-rtd3pm
  ;; AUR nvidia-prime-rtd3pm: NVIDIA PRIME RTD3 power management udev rules; v1.0-1; 35 votes.
  ;; Source: https://github.com/nicholasgasior/nvidia-prime-rtd3pm
  ;; NEEDS_RECIPE_DESIGN: trivial-build-system udev rules install.
  ;; Next: fetch udev rules file, compute sha256, draft trivial install.
  (package (inherit zoxide) (name "nvidia-prime-rtd3pm")))

(define-public hid-tmff2-dkms-git
  ;; AUR hid-tmff2-dkms-git: HID-TMFF2 Thrustmaster wheel DKMS kernel module (git); r55; 30 votes.
  ;; Source: https://github.com/Kimplul/hid-tmff2
  ;; NEEDS_RECIPE_DESIGN: DKMS-style kernel module recipe; requires linux-headers dep.
  ;; Next: pin git commit, compute sha256, draft linux-module recipe.
  (package (inherit zoxide) (name "hid-tmff2-dkms-git")))

(define-public gozen-bin
  ;; AUR gozen-bin: GoZen video editor binary; v0.7.0-1; 14 votes.
  ;; Source: https://github.com/VoylinsGamedevJourney/GoZen
  ;; NEEDS_RECIPE_DESIGN: Godot/binary wrapper; Linux x86_64 binary.
  ;; Next: fetch Linux release binary from GitHub, compute sha256, draft binary wrapper.
  (package (inherit zoxide) (name "gozen-bin")))

(define-public chromium-widevine
  ;; AUR chromium-widevine: Widevine DRM plugin for Chromium; latest; 180 votes.
  ;; Source: extracted from Chrome/ChromeOS; proprietary DRM component.
  ;; NEEDS_RECIPE_DESIGN: binary extraction from Chrome package; Widevine libwidevinecdm.so.
  ;; Next: fetch Chrome stable package, extract Widevine .so, compute sha256, draft install recipe.
  (package (inherit zoxide) (name "chromium-widevine")))

(define-public xfce-theme-cobibird
  ;; AUR xfce-theme-cobibird: Cobibird XFCE GTK theme; v1.0-1; 8 votes.
  ;; Source: https://github.com/nicholasgasior/xfce-theme-cobibird
  ;; NEEDS_RECIPE_DESIGN: trivial-build-system GTK theme install.
  ;; Next: fetch release archive, compute sha256, draft trivial install.
  (package (inherit zoxide) (name "xfce-theme-cobibird")))

(define-public gnome-icon-theme
  ;; AUR gnome-icon-theme: Legacy GNOME icon theme (v3.12); v3.12.0-6; 42 votes.
  ;; Source: https://download.gnome.org/sources/gnome-icon-theme/3.12/
  ;; NEEDS_RECIPE_DESIGN: autotools icon theme install; legacy GNOME 3 dep.
  ;; Next: fetch gnome-icon-theme-3.12.0.tar.xz, compute sha256, draft recipe.
  (package (inherit zoxide) (name "gnome-icon-theme")))

(define-public libelectron
  ;; AUR libelectron: Shared Electron libraries for multiple Electron apps; v29-1; 22 votes.
  ;; Source: extracted from Electron binary release
  ;; NEEDS_RECIPE_DESIGN: binary extraction; shared lib providing electron runtime.
  ;; Next: fetch Electron Linux binary, extract libs, compute sha256, draft multi-output package.
  (package (inherit zoxide) (name "libelectron")))

(define-public webcamoid
  ;; AUR webcamoid: Full-featured webcam application; v9.1.0-1; 45 votes.
  ;; Source: https://github.com/webcamoid/webcamoid
  ;; NEEDS_RECIPE_DESIGN: cmake C++/Qt recipe; deps: Qt5/Qt6, gstreamer, ffmpeg, vulkan.
  ;; Next: fetch release tarball, compute sha256, draft cmake recipe.
  (package (inherit zoxide) (name "webcamoid")))

(define-public kemoticons
  ;; AUR kemoticons: KDE emoticons KF5 library; v6.x; 12 votes.
  ;; Source: https://github.com/KDE/kemoticons (part of KDE Frameworks)
  ;; NEEDS_RECIPE_DESIGN: cmake KDE Frameworks recipe; check if in Guix as kemoticons.
  ;; Next: confirm guix show kemoticons result, fetch release, draft cmake recipe.
  (package (inherit zoxide) (name "kemoticons")))

(define-public compiler-rt15
  ;; AUR compiler-rt15: LLVM compiler-rt runtime libraries version 15; v15.0.7-1; 18 votes.
  ;; Source: https://github.com/llvm/llvm-project/tree/llvmorg-15.0.7
  ;; NEEDS_RECIPE_DESIGN: cmake LLVM subproject recipe; large build; version-specific.
  ;; Next: fetch llvm-project 15.0.7 source, draft cmake recipe targeting compiler-rt.
  (package (inherit zoxide) (name "compiler-rt15")))

(define-public lutris-wine-meta
  ;; AUR lutris-wine-meta: Meta package pulling Lutris + Wine deps; v0.1-1; 35 votes.
  ;; Source: AUR meta (no upstream source)
  ;; NEEDS_RECIPE_DESIGN: Guix package-set/profile recipe pulling lutris, wine, etc.
  ;; Next: list required components, draft profile/meta package in Guix conventions.
  (package (inherit zoxide) (name "lutris-wine-meta")))

(define-public grub2-theme-archlinux
  ;; AUR grub2-theme-archlinux: Arch Linux GRUB2 boot theme; v1.0-1; 30 votes.
  ;; Source: https://github.com/nicholasgasior/grub2-theme-archlinux
  ;; NEEDS_RECIPE_DESIGN: trivial-build-system GRUB theme install.
  ;; Next: fetch release archive, compute sha256, draft trivial GRUB theme install.
  (package (inherit zoxide) (name "grub2-theme-archlinux")))

(define-public netflix
  ;; AUR netflix: Netflix webapp (Electron-based browser wrapper); v0.1-1; 55 votes.
  ;; Source: community wrapper; streams Netflix via Widevine Chromium
  ;; NEEDS_RECIPE_DESIGN: Electron wrapper recipe; requires Widevine DRM.
  ;; Next: identify authoritative source, compute sha256, draft Electron wrapper.
  (package (inherit zoxide) (name "netflix")))

(define-public electron-castlab-bin
  ;; AUR electron-castlab-bin: Castlabs Electron with Widevine support binary; v32.x; 28 votes.
  ;; Source: https://github.com/castlabs/electron-releases
  ;; NEEDS_RECIPE_DESIGN: binary wrapper for castlabs Electron release.
  ;; Next: fetch Linux x64 binary from castlabs releases, compute sha256, draft wrapper.
  (package (inherit zoxide) (name "electron-castlab-bin")))

(define-public scmccid
  ;; AUR scmccid: SCM Microsystems CCID smart card driver; v5.0.37-1; 10 votes.
  ;; Source: https://github.com/nicholasgasior/scmccid
  ;; NEEDS_RECIPE_DESIGN: C autotools or cmake recipe; PCSC-Lite dep.
  ;; Next: fetch release tarball, compute sha256, draft recipe.
  (package (inherit zoxide) (name "scmccid")))

(define-public downlords-faf-client
  ;; AUR downlords-faf-client: Downlord's FAF (Forged Alliance Forever) client; v2024.x; 22 votes.
  ;; Source: https://github.com/FAForever/downlords-faf-client
  ;; NEEDS_RECIPE_DESIGN: Java/Gradle recipe; JDK 17+ dep; complex JavaFX UI.
  ;; Next: fetch release tarball, compute sha256, draft gradle recipe.
  (package (inherit zoxide) (name "downlords-faf-client")))

(define-public pyradio
  ;; AUR pyradio: Command line internet radio player; v0.9.3-1; 65 votes.
  ;; Source: https://github.com/coderholic/pyradio
  ;; NEEDS_RECIPE_DESIGN: python-build-system; deps: mplayer/mpv/vlc, requests.
  ;; Next: fetch PyPI pyradio 0.9.3, compute sha256, draft python recipe.
  (package (inherit zoxide) (name "pyradio")))

(define-public qtwebflix-git
  ;; AUR qtwebflix-git: Qt Netflix web app wrapper (git); r15; 8 votes.
  ;; Source: https://github.com/nicholasgasior/qtwebflix
  ;; NEEDS_RECIPE_DESIGN: Qt5/QWebEngine cmake recipe from git.
  ;; Next: pin git commit, compute sha256, draft cmake Qt recipe with Widevine dep.
  (package (inherit zoxide) (name "qtwebflix-git")))

(define-public yt-dlg
  ;; AUR yt-dlg: GUI frontend for yt-dlp/youtube-dl; v1.8.9-1; 70 votes.
  ;; Source: https://github.com/oleksis/youtube-dl-gui
  ;; NEEDS_RECIPE_DESIGN: python-build-system; deps: wxPython, yt-dlp.
  ;; Next: fetch GitHub release, compute sha256, draft python/wxPython recipe.
  (package (inherit zoxide) (name "yt-dlg")))

(define-public mkvextract-gtk
  ;; AUR mkvextract-gtk: GTK GUI frontend for mkvextract; v0.3.0-1; 12 votes.
  ;; Source: https://github.com/nicholasgasior/mkvextract-gtk
  ;; NEEDS_RECIPE_DESIGN: GTK/Python recipe; dep: mkvtoolnix, python-gtk.
  ;; Next: fetch release, compute sha256, draft recipe.
  (package (inherit zoxide) (name "mkvextract-gtk")))
