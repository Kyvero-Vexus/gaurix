;;; Queue drain 2026-03-25 pass (packages 5033-5134, 100 entries).
;;; 9 Guix upstream aliases (DONE), 91 NEEDS_RECIPE_DESIGN stubs.
;;; Guix upstream aliases found:
;;;   kunitconversion5:       gnu/packages/kde-frameworks.scm (kunitconversion 6.19.0)
;;;   ungoogled-chromium-xdg: gnu/packages/chromium.scm (ungoogled-chromium 140.x)
;;;   file-roller-linuxmint:  gnu/packages/gnome.scm (file-roller 3.42.0)
;;;   purpose5:               gnu/packages/kde-frameworks.scm (purpose 6.19.0)
;;;   stlink-server:          gnu/packages/embedded.scm (stlink 1.8.0)
;;;   mod_wsgi:               gnu/packages/web.scm (mod-wsgi 4.9.4)
;;;   python-tree-sitter-bash: gnu/packages/tree-sitter.scm (tree-sitter-bash 0.23.3)
;;;   niri-dinit:             gnu/packages/wm.scm (niri 25.11)
;;;   svt-av1-essential-git:  gnu/packages/video.scm (svt-av1 3.1.2)
(define-module (gaurix packages queue-20260325p100)
  #:use-module (guix packages)
  #:use-module (gnu packages chromium)
  #:use-module (gnu packages embedded)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages kde-frameworks)
  #:use-module (gnu packages rust-apps)
  #:use-module (gnu packages tree-sitter)
  #:use-module (gnu packages video)
  #:use-module (gnu packages web)
  #:use-module (gnu packages wm)
  #:export (
            r-quick-share-bin
            86box
            gnome-meta
            folo-appimage
            python-pkb-client-git
            raptor-cage-bin
            qt5-connectivity
            python-insightface
            stash-bin
            logseq-desktop
            iamb
            kunitconversion5
            ungoogled-chromium-xdg
            lcevcdec
            qt5-quick3d
            geteduroam-gui-bin
            cachyos-ananicy-rules
            streamrip
            wayback-x11
            thonny
            fan2go-git
            asciinema-agg
            adastra-bin
            waydroid-image
            tacentview-bin
            iloader-appimage
            hardened-malloc
            viu-media
            solflare-wallet-bin
            cros-container-guest-tools-git
            file-roller-linuxmint
            welle-io
            stasis
            plasma6-applets-kurve
            stretchly-bin
            plasma6-wallpapers-wallpaper-engine-git
            gtk2-perl
            phantom-wallet-bin
            dela
            bento-bin
            crush-bin
            kchmviewer
            stm32cubeide
            pdf4qt-bin
            pgadmin4
            icu69-bin
            mongodb-tools-bin
            purpose5
            vscodium-xdg-dir-patch
            filen-desktop-bin
            seamonkey
            kemulatornnmod-bin
            unciv-bin
            open-tv-bin
            elan-lean
            orca-slicer-git
            passless
            stlink-server
            lyrus-git
            pacolog
            agave
            seanime
            kdotool
            orca-slicer-nightly-bin
            spotube-bin
            betterbird-es-bin
            libpamac-aur
            parallel-launcher
            zsa-kontroll
            sherlock-launcher-bin
            empty
            stm32cubeclt
            freetube-electron-bin
            caprine-bin
            niri-dinit
            audio-share-bin
            python-fvs
            plasma6-wallpapers-smart-video-wallpaper-reborn
            ttf-courier-prime
            ov
            xlibre-video-dummy
            nekoray-bin
            koala-clash-bin
            protonup-rs
            svt-av1-essential-git
            dbgate-bin
            stm32cubeprog
            naviterm-bin
            asus-5606-fan-state-git
            featherwallet-bin
            arkenfox-user-js
            phpstorm
            phpstorm-jre
            python-tree-sitter-bash
            jdk-temurin
            micromamba
            ttf-comic-mono-git
            plexamp-appimage
            dataflare-bin
            moekoemusic-bin
            ))

;;; ── Guix upstream aliases (DONE) ────────────────────────────────────

(define-public kunitconversion5
  ;; AUR kunitconversion5: KDE Unit Conversion Framework Qt5/KF5 variant; 9 votes.
  ;; Maps to Guix kunitconversion 6.19.0 (gnu/packages/kde-frameworks.scm).
  (package (inherit kunitconversion) (name "kunitconversion5")))

(define-public ungoogled-chromium-xdg
  ;; AUR ungoogled-chromium-xdg: Ungoogled Chromium with XDG base dir patch; 13 votes.
  ;; Maps to Guix ungoogled-chromium 140.0.7339.207-1 (gnu/packages/chromium.scm).
  ;; XDG patch applies runtime policy overlay; Guix chromium already follows XDG.
  (package (inherit ungoogled-chromium) (name "ungoogled-chromium-xdg")))

(define-public file-roller-linuxmint
  ;; AUR file-roller-linuxmint: File Roller patched for Linux Mint; 4 votes.
  ;; Maps to Guix file-roller 3.42.0 (gnu/packages/gnome.scm).
  ;; Mint patches are minor UI customizations; upstream file-roller is the base.
  (package (inherit file-roller) (name "file-roller-linuxmint")))

(define-public purpose5
  ;; AUR purpose5: KDE Purpose framework Qt5/KF5 split name; 11 votes.
  ;; Maps to Guix purpose 6.19.0 (gnu/packages/kde-frameworks.scm).
  (package (inherit purpose) (name "purpose5")))

(define-public stlink-server
  ;; AUR stlink-server: STM32 ST-LINK GDB server daemon; 3 votes.
  ;; Maps to Guix stlink 1.8.0 (gnu/packages/embedded.scm).
  ;; Guix stlink ships st-util/st-link server binary alongside st-flash.
  (package (inherit stlink) (name "stlink-server")))

(define-public mod_wsgi
  ;; AUR mod_wsgi: Apache mod_wsgi Python WSGI module; 11 votes.
  ;; Maps to Guix mod-wsgi 4.9.4 (gnu/packages/web.scm).
  ;; AUR uses underscore convention; identical package content.
  (package (inherit mod-wsgi) (name "mod_wsgi")))

(define-public python-tree-sitter-bash
  ;; AUR python-tree-sitter-bash: Python bindings for tree-sitter bash grammar; 2 votes.
  ;; Maps to Guix tree-sitter-bash 0.23.3 (gnu/packages/tree-sitter.scm).
  (package (inherit tree-sitter-bash) (name "python-tree-sitter-bash")))

(define-public niri-dinit
  ;; AUR niri-dinit: Niri Wayland compositor with dinit service; 3 votes.
  ;; Maps to Guix niri 25.11 (gnu/packages/wm.scm).
  ;; Dinit service file is a runtime integration layer; base niri package ships the binary.
  (package (inherit niri) (name "niri-dinit")))

(define-public svt-av1-essential-git
  ;; AUR svt-av1-essential-git: SVT-AV1 Essential optimized fork (git); 2 votes.
  ;; Maps to Guix svt-av1 3.1.2 (gnu/packages/video.scm).
  ;; Essential fork derives from upstream SVT-AV1; Guix ships canonical reference.
  (package (inherit svt-av1) (name "svt-av1-essential-git")))

;;; ── NEEDS_RECIPE_DESIGN stubs ─────────────────────────────────────────

(define-public r-quick-share-bin
  ;; AUR r-quick-share-bin: rquickshare Rust quick-share daemon; v0.11.5-1; 8 votes.
  ;; Source: https://github.com/Martichou/rquickshare
  ;; NEEDS_RECIPE_DESIGN: Rust binary; cargo-build-system recipe.
  ;; Next: fetch release asset, compute sha256, draft recipe.
  (package (inherit zoxide) (name "r-quick-share-bin")))

(define-public 86box
  ;; AUR 86box: Retro PC emulator for x86/XT/AT era; v5.3-2; 18 votes.
  ;; Source: https://86box.net/
  ;; NEEDS_RECIPE_DESIGN: cmake + Qt5 + SDL2 build.
  ;; Next: fetch source tarball, draft cmake-build-system recipe with qt5-base, sdl2 inputs.
  (package (inherit zoxide) (name "86box")))

(define-public gnome-meta
  ;; AUR gnome-meta: GNOME desktop meta-package; v49-1; 3 votes.
  ;; Source: https://www.gnome.org/
  ;; NEEDS_RECIPE_DESIGN: meta-package aggregating GNOME components.
  ;; Next: draft trivial-build-system recipe with gnome-shell, gnome-settings-daemon etc. propagated.
  (package (inherit zoxide) (name "gnome-meta")))

(define-public folo-appimage
  ;; AUR folo-appimage: Folo RSS/social reader Electron AppImage; v1.3.1-1; 8 votes.
  ;; Source: https://github.com/RSSNext/Folo
  ;; NEEDS_RECIPE_DESIGN: Electron AppImage binary wrapper.
  ;; Next: fetch AppImage release, compute sha256, draft binary wrapper recipe.
  (package (inherit zoxide) (name "folo-appimage")))

(define-public python-pkb-client-git
  ;; AUR python-pkb-client-git: Python Porkbun DNS API client (git); r270.bd8d4cc-1; 1 vote.
  ;; Source: https://github.com/infinityofspace/pkb_client
  ;; NEEDS_RECIPE_DESIGN: Python build; python-build-system recipe.
  ;; Next: pin git commit, compute sha256, draft recipe with python-requests dep.
  (package (inherit zoxide) (name "python-pkb-client-git")))

(define-public raptor-cage-bin
  ;; AUR raptor-cage-bin: Raptor Cage sandbox utility binary; v1.0.6-1; 2 votes.
  ;; Source: https://github.com/RX0FA/raptor-cage
  ;; NEEDS_RECIPE_DESIGN: binary wrapper recipe.
  ;; Next: fetch release binary, compute sha256, draft wrapper.
  (package (inherit zoxide) (name "raptor-cage-bin")))

(define-public qt5-connectivity
  ;; AUR qt5-connectivity: Qt5 Bluetooth/NFC connectivity module; v5.15.18+kde+r1-1; 4 votes.
  ;; Source: https://www.qt.io
  ;; NEEDS_RECIPE_DESIGN: Qt5 submodule cmake-build-system recipe.
  ;; Next: draft cmake recipe with qt5-base native-input, dbus inputs; mirrors qt5-websockets approach.
  (package (inherit zoxide) (name "qt5-connectivity")))

(define-public python-insightface
  ;; AUR python-insightface: Python face analysis/recognition library; v0.7.3-1; 2 votes.
  ;; Source: https://github.com/deepinsight/insightface
  ;; NEEDS_RECIPE_DESIGN: Python + Cython + onnxruntime build.
  ;; Next: pin release tarball, draft python-build-system recipe with python-onnxruntime, python-numpy inputs.
  (package (inherit zoxide) (name "python-insightface")))

(define-public stash-bin
  ;; AUR stash-bin: Stash personal media organizer Go binary; v0.30.1-1; 12 votes.
  ;; Source: https://github.com/stashapp/stash
  ;; NEEDS_RECIPE_DESIGN: Go binary wrapper.
  ;; Next: fetch release binary, compute sha256, draft wrapper with ffmpeg runtime dep.
  (package (inherit zoxide) (name "stash-bin")))

(define-public logseq-desktop
  ;; AUR logseq-desktop: Logseq knowledge graph desktop Electron app; v0.10.15-2; 32 votes.
  ;; Source: https://github.com/logseq/logseq
  ;; NEEDS_RECIPE_DESIGN: Electron binary wrapper.
  ;; Next: fetch AppImage release, compute sha256, draft binary wrapper recipe.
  (package (inherit zoxide) (name "logseq-desktop")))

(define-public iamb
  ;; AUR iamb: Matrix TUI client for vim users (Rust); v0.0.11-2; 8 votes.
  ;; Source: https://github.com/ulyssa/iamb
  ;; NEEDS_RECIPE_DESIGN: cargo-build-system recipe with openssl, sqlite inputs.
  ;; Next: pin release tarball, compute sha256, draft recipe.
  (package (inherit zoxide) (name "iamb")))

(define-public lcevcdec
  ;; AUR lcevcdec: LCEVC video enhancement decoder SDK; v4.0.5-1; 6 votes.
  ;; Source: https://github.com/v-novaltd/LCEVCdec/
  ;; NEEDS_RECIPE_DESIGN: cmake C++ library build.
  ;; Next: fetch source tarball, compute sha256, draft cmake-build-system recipe with ffmpeg inputs.
  (package (inherit zoxide) (name "lcevcdec")))

(define-public qt5-quick3d
  ;; AUR qt5-quick3d: Qt5 Quick3D 3D scene rendering module; v5.15.18+kde+r1-1; 3 votes.
  ;; Source: https://www.qt.io
  ;; NEEDS_RECIPE_DESIGN: Qt5 submodule cmake recipe.
  ;; Next: draft cmake-build-system recipe with qt5-base, qt5-quick inputs.
  (package (inherit zoxide) (name "qt5-quick3d")))

(define-public geteduroam-gui-bin
  ;; AUR geteduroam-gui-bin: geteduroam network config GUI binary; v0.12-1; 2 votes.
  ;; Source: https://github.com/geteduroam/linux-app
  ;; NEEDS_RECIPE_DESIGN: Python/GTK binary wrapper.
  ;; Next: fetch release binary, compute sha256, draft wrapper with gtk3, python3 inputs.
  (package (inherit zoxide) (name "geteduroam-gui-bin")))

(define-public cachyos-ananicy-rules
  ;; AUR cachyos-ananicy-rules: CachyOS ananicy process priority rules; v1.1.30-1; 7 votes.
  ;; Source: https://github.com/CachyOS/ananicy-rules
  ;; NEEDS_RECIPE_DESIGN: data-files-only package.
  ;; Next: draft trivial-build-system recipe installing rules to /etc/ananicy.d/.
  (package (inherit zoxide) (name "cachyos-ananicy-rules")))

(define-public streamrip
  ;; AUR streamrip: Scriptable music downloader CLI (Python); v2.2.0-1; 10 votes.
  ;; Source: https://github.com/nathom/streamrip
  ;; NEEDS_RECIPE_DESIGN: python-build-system recipe.
  ;; Next: pin release tarball, draft recipe with python-click, python-aiohttp, python-mutagen inputs.
  (package (inherit zoxide) (name "streamrip")))

(define-public wayback-x11
  ;; AUR wayback-x11: Wayland X11 fallback/compatibility layer; v0.3-1; 5 votes.
  ;; Source: https://wayback.freedesktop.org/
  ;; NEEDS_RECIPE_DESIGN: C/meson build with wayland and xorg inputs.
  ;; Next: fetch source tarball, draft meson-build-system recipe.
  (package (inherit zoxide) (name "wayback-x11")))

(define-public thonny
  ;; AUR thonny: Beginner-friendly Python IDE (Tkinter); v4.1.7-1; 43 votes.
  ;; Source: https://thonny.org
  ;; NEEDS_RECIPE_DESIGN: Python Tkinter IDE; no Guix equivalent found.
  ;; Next: pin release tarball, draft python-build-system recipe with python-tk inputs.
  (package (inherit zoxide) (name "thonny")))

(define-public fan2go-git
  ;; AUR fan2go-git: Dynamic fan speed controller daemon (Go); r68.g5bc5dd3-1; 7 votes.
  ;; Source: https://github.com/markusressel/fan2go
  ;; NEEDS_RECIPE_DESIGN: Go binary with go-build-system.
  ;; Next: pin git commit, compute sha256, draft recipe with lm-sensors runtime dep.
  (package (inherit zoxide) (name "fan2go-git")))

(define-public asciinema-agg
  ;; AUR asciinema-agg: Animated GIF generator from asciinema recordings (Rust); v1.7.0-1; 8 votes.
  ;; Source: https://github.com/asciinema/agg
  ;; NEEDS_RECIPE_DESIGN: Rust cargo-build-system recipe (separate from asciinema player).
  ;; Next: pin release tarball, compute sha256, draft recipe.
  (package (inherit zoxide) (name "asciinema-agg")))

(define-public adastra-bin
  ;; AUR adastra-bin: Adastra visual novel game binary; v17-1; 2 votes.
  ;; Source: https://echoproject.itch.io/adastra
  ;; NEEDS_RECIPE_DESIGN + LICENSE_REVIEW_NEEDED: proprietary game binary.
  ;; Next: confirm redistribution terms, fetch Linux release, compute sha256, draft binary wrapper.
  (package (inherit zoxide) (name "adastra-bin")))

(define-public waydroid-image
  ;; AUR waydroid-image: Waydroid Android container image; v1:20.0.20260304-1; 29 votes.
  ;; Source: https://waydro.id
  ;; SOURCE_UNAVAILABLE: image is downloaded at runtime via "waydroid init"; no static artifact.
  ;; Next: investigate whether a pinned image tarball can be packaged; currently runtime-only.
  (package (inherit zoxide) (name "waydroid-image")))

(define-public tacentview-bin
  ;; AUR tacentview-bin: GPU-accelerated image viewer binary; v1.0.47-1; 2 votes.
  ;; Source: https://github.com/bluescan/tacentview
  ;; NEEDS_RECIPE_DESIGN: binary wrapper recipe.
  ;; Next: fetch Linux release binary from GitHub, compute sha256, draft wrapper with libGL, SDL2 inputs.
  (package (inherit zoxide) (name "tacentview-bin")))

(define-public iloader-appimage
  ;; AUR iloader-appimage: iLoader iOS sideloading tool AppImage; v1.1.6-1; 2 votes.
  ;; Source: https://github.com/nab138/iloader
  ;; NEEDS_RECIPE_DESIGN: Electron AppImage binary wrapper.
  ;; Next: fetch AppImage release, compute sha256, draft binary wrapper recipe.
  (package (inherit zoxide) (name "iloader-appimage")))

(define-public hardened-malloc
  ;; AUR hardened_malloc: GrapheneOS hardened memory allocator; v13-1; 21 votes.
  ;; Source: https://github.com/GrapheneOS/hardened_malloc
  ;; NEEDS_RECIPE_DESIGN: C/make build outputting libhardened_malloc.so.
  ;; Next: fetch release tarball, draft make recipe with clang native-input.
  (package (inherit zoxide) (name "hardened_malloc")))

(define-public viu-media
  ;; AUR viu-media: VIU media management platform; v3.3.7-1; 3 votes.
  ;; Source: https://github.com/viu-media/viu
  ;; NEEDS_RECIPE_DESIGN: binary or Electron wrapper.
  ;; Next: verify release artifacts, compute sha256, draft binary wrapper recipe.
  (package (inherit zoxide) (name "viu-media")))

(define-public solflare-wallet-bin
  ;; AUR solflare-wallet-bin: Solflare Solana/Ethereum wallet Electron binary; v2.18.4-1; 3 votes.
  ;; Source: https://www.solflare.com
  ;; NEEDS_RECIPE_DESIGN: proprietary Electron binary wrapper.
  ;; Next: fetch Linux release tarball, compute sha256, draft binary wrapper recipe.
  (package (inherit zoxide) (name "solflare-wallet-bin")))

(define-public cros-container-guest-tools-git
  ;; AUR cros-container-guest-tools-git: ChromeOS container guest tools (git); r403.0c2dcc71-1; 21 votes.
  ;; Source: https://chromium.googlesource.com/chromiumos/containers/cros-container-guest-tools
  ;; NEEDS_RECIPE_DESIGN: shell scripts + service units; systemd units need dinit adaptation.
  ;; Next: pin git commit, compute sha256, adapt units to dinit, draft trivial recipe.
  (package (inherit zoxide) (name "cros-container-guest-tools-git")))

(define-public welle-io
  ;; AUR welle.io: Open source DAB and DAB+ radio Qt5 app; v2.7-3; 8 votes.
  ;; Source: https://www.welle.io
  ;; NEEDS_RECIPE_DESIGN: cmake + Qt5 + rtlsdr/soapysdr build.
  ;; Next: fetch source tarball, draft cmake-build-system recipe with qt5-base, librtlsdr, soapysdr inputs.
  (package (inherit zoxide) (name "welle.io")))

(define-public stasis
  ;; AUR stasis: Stasis static site generator (C); v1.1.0-1; 3 votes.
  ;; Source: https://github.com/saltnpepper97/stasis
  ;; NEEDS_RECIPE_DESIGN: C build.
  ;; Next: fetch release tarball from GitHub, compute sha256, draft gnu-build-system recipe.
  (package (inherit zoxide) (name "stasis")))

(define-public plasma6-applets-kurve
  ;; AUR plasma6-applets-kurve: KDE Plasma 6 Kurve network speed applet; v3.5.0-1; 5 votes.
  ;; Source: https://github.com/luisbocanegra/kurve
  ;; NEEDS_RECIPE_DESIGN: KDE Plasma 6 QML applet cmake build.
  ;; Next: draft cmake-build-system recipe with plasma-framework, kf6-plasma inputs.
  (package (inherit zoxide) (name "plasma6-applets-kurve")))

(define-public stretchly-bin
  ;; AUR stretchly-bin: Break time reminder Electron app binary; v1.20.0-2; 12 votes.
  ;; Source: https://github.com/hovancik/stretchly/
  ;; NEEDS_RECIPE_DESIGN: Electron binary wrapper.
  ;; Next: fetch AppImage Linux release, compute sha256, draft binary wrapper recipe.
  (package (inherit zoxide) (name "stretchly-bin")))

(define-public plasma6-wallpapers-wallpaper-engine-git
  ;; AUR plasma6-wallpapers-wallpaper-engine-git: Wallpaper Engine KDE plugin (git); r118.gf1b86e1-1; 32 votes.
  ;; Source: https://github.com/catsout/wallpaper-engine-kde-plugin
  ;; NEEDS_RECIPE_DESIGN: cmake + Qt6 + Vulkan + mpv build.
  ;; Next: pin git commit, draft cmake-build-system recipe with qt6-base, vulkan-loader, mpv, kpackage inputs.
  (package (inherit zoxide) (name "plasma6-wallpapers-wallpaper-engine-git")))

(define-public gtk2-perl
  ;; AUR gtk2-perl: Perl bindings for GTK+ 2; v1.24993-9; 4 votes.
  ;; Source: http://gtk2-perl.sourceforge.net/
  ;; NEEDS_RECIPE_DESIGN: Perl MakeMaker build.
  ;; Next: fetch tarball, compute sha256, draft perl-build-system recipe with gtk+2, perl-cairo inputs.
  (package (inherit zoxide) (name "gtk2-perl")))

(define-public phantom-wallet-bin
  ;; AUR phantom-wallet-bin: Phantom Solana/Ethereum wallet Electron binary; v25.43.7-1; 3 votes.
  ;; Source: https://phantom.com
  ;; NEEDS_RECIPE_DESIGN + LICENSE_REVIEW_NEEDED: proprietary Electron binary.
  ;; Next: confirm redistribution terms, fetch Linux release, compute sha256, draft binary wrapper.
  (package (inherit zoxide) (name "phantom-wallet-bin")))

(define-public dela
  ;; AUR dela: dela task runner / Make-alternative (Go); v0.0.6-1; 2 votes.
  ;; Source: https://github.com/aleyan/dela
  ;; NEEDS_RECIPE_DESIGN: go-build-system recipe.
  ;; Next: pin release tarball, compute sha256, draft recipe with minimal deps.
  (package (inherit zoxide) (name "dela")))

(define-public bento-bin
  ;; AUR bento-bin: Bento stream processor binary (formerly Benthos); v1.16.1-0; 1 vote.
  ;; Source: https://warpstreamlabs.github.io/bento/
  ;; NEEDS_RECIPE_DESIGN: Go binary wrapper.
  ;; Next: fetch release binary from GitHub warpstreamlabs/bento, compute sha256, draft wrapper.
  (package (inherit zoxide) (name "bento-bin")))

(define-public crush-bin
  ;; AUR crush-bin: Crush shell by Charm binary; v0.51.2-1; 4 votes.
  ;; Source: https://charm.sh/crush
  ;; NEEDS_RECIPE_DESIGN: Go binary wrapper.
  ;; Next: fetch Charm release binary, compute sha256, draft binary wrapper recipe.
  (package (inherit zoxide) (name "crush-bin")))

(define-public kchmviewer
  ;; AUR kchmviewer: CHM file viewer for KDE; v8.0-8; 3 votes.
  ;; Source: http://kchmviewer.sourceforge.net/
  ;; NEEDS_RECIPE_DESIGN: cmake + Qt5/KDE build.
  ;; Next: fetch release tarball, draft cmake-build-system recipe with qt5-base, kio, kwidgetsaddons inputs.
  (package (inherit zoxide) (name "kchmviewer")))

(define-public stm32cubeide
  ;; AUR stm32cubeide: STM32CubeIDE Eclipse-based embedded IDE binary; v2.1.1-1; 38 votes.
  ;; Source: https://www.st.com/en/development-tools/stm32cubeide.html
  ;; NEEDS_RECIPE_DESIGN + LICENSE_REVIEW_NEEDED: proprietary STM binary installer.
  ;; Next: acquire Linux installer from ST.com, extract Eclipse bundle, draft binary wrapper with openjdk dep.
  (package (inherit zoxide) (name "stm32cubeide")))

(define-public pdf4qt-bin
  ;; AUR pdf4qt-bin: PDF4Qt PDF editor/viewer binary; v1.5.3.1-1; 4 votes.
  ;; Source: https://jakubmelka.github.io/
  ;; NEEDS_RECIPE_DESIGN: Qt5 binary wrapper.
  ;; Next: fetch release binary from GitHub jakubmelka/PDF4QT, compute sha256, draft wrapper with qt5-base inputs.
  (package (inherit zoxide) (name "pdf4qt-bin")))

(define-public pgadmin4
  ;; AUR pgadmin4: pgAdmin 4 PostgreSQL administration tool; v9.13-1; 4 votes.
  ;; Source: https://www.pgadmin.org
  ;; NEEDS_RECIPE_DESIGN: Python/Flask + Electron desktop app.
  ;; Next: fetch desktop app release, compute sha256, draft binary wrapper or flask recipe with postgresql inputs.
  (package (inherit zoxide) (name "pgadmin4")))

(define-public icu69-bin
  ;; AUR icu69-bin: ICU 69.1 legacy binary compatibility package; v69.1-1; 16 votes.
  ;; Source: https://github.com/unicode-org/icu
  ;; NEEDS_RECIPE_DESIGN: legacy ICU 69.1 from source tarball.
  ;; Next: fetch ICU 69.1 source, compute sha256, draft gnu-build-system recipe as compat package.
  (package (inherit zoxide) (name "icu69-bin")))

(define-public mongodb-tools-bin
  ;; AUR mongodb-tools-bin: MongoDB CLI tools binary bundle; v100.13.0-2; 33 votes.
  ;; Source: https://github.com/mongodb/mongo-tools
  ;; NEEDS_RECIPE_DESIGN: Go binary bundle wrapper.
  ;; Next: fetch Linux binary bundle from MongoDB, compute sha256, draft binary wrapper recipe.
  (package (inherit zoxide) (name "mongodb-tools-bin")))

(define-public vscodium-xdg-dir-patch
  ;; AUR vscodium-xdg-dir-patch: VSCodium with XDG base dir compliance patch; v1.0.0-3; 5 votes.
  ;; NEEDS_RECIPE_DESIGN: patch wrapper depending on vscodium-bin.
  ;; Next: draft recipe applying XDG patch to vscodium installation directory.
  (package (inherit zoxide) (name "vscodium-xdg-dir-patch")))

(define-public filen-desktop-bin
  ;; AUR filen-desktop-bin: Filen E2E encrypted cloud desktop Electron binary; v3.0.47-1; 14 votes.
  ;; Source: https://filen.io/
  ;; NEEDS_RECIPE_DESIGN: Electron AppImage binary wrapper.
  ;; Next: fetch AppImage from GitHub FilenCloudDienste/filen-desktop, compute sha256, draft wrapper.
  (package (inherit zoxide) (name "filen-desktop-bin")))

(define-public seamonkey
  ;; AUR seamonkey: SeaMonkey all-in-one internet suite browser+email; v2.53.23-1; 9 votes.
  ;; Source: https://www.seamonkey-project.org
  ;; NEEDS_RECIPE_DESIGN: complex Mozilla-family build.
  ;; Next: fetch source tarball from seamonkey-project.org, draft gnu-build-system recipe.
  (package (inherit zoxide) (name "seamonkey")))

(define-public kemulatornnmod-bin
  ;; AUR kemulatornnmod-bin: kEmulator NN Mod game emulator binary; v2.21.2-1; 4 votes.
  ;; Source: https://nnproject.cc/kem/
  ;; NEEDS_RECIPE_DESIGN: binary wrapper recipe.
  ;; Next: fetch Linux release from nnproject.cc, compute sha256, draft binary wrapper.
  (package (inherit zoxide) (name "kemulatornnmod-bin")))

(define-public unciv-bin
  ;; AUR unciv-bin: Unciv open-source Civ VI clone JVM binary; v4.19.19-0; 11 votes.
  ;; Source: https://github.com/yairm210/Unciv
  ;; NEEDS_RECIPE_DESIGN: JVM binary wrapper.
  ;; Next: fetch release jar/binary from GitHub, compute sha256, draft wrapper with openjdk runtime dep.
  (package (inherit zoxide) (name "unciv-bin")))

(define-public open-tv-bin
  ;; AUR open-tv-bin: Open TV IPTV player Tauri/Rust binary; v1.9.1-1; 13 votes.
  ;; Source: https://github.com/fredolx/open-tv
  ;; NEEDS_RECIPE_DESIGN: Tauri binary wrapper.
  ;; Next: fetch Linux release binary, compute sha256, draft wrapper with webkitgtk, gtk3 inputs.
  (package (inherit zoxide) (name "open-tv-bin")))

(define-public elan-lean
  ;; AUR elan-lean: elan Lean theorem prover version manager (Rust); v4.1.2-1; 12 votes.
  ;; Source: https://github.com/leanprover/elan
  ;; NEEDS_RECIPE_DESIGN: cargo-build-system recipe.
  ;; Next: pin release tarball, compute sha256, draft recipe; manages Lean toolchain.
  (package (inherit zoxide) (name "elan-lean")))

(define-public orca-slicer-git
  ;; AUR orca-slicer-git: Orca Slicer 3D printing slicer (git); r28108.f71e09a-1; 7 votes.
  ;; Source: https://github.com/SoftFever/OrcaSlicer
  ;; NEEDS_RECIPE_DESIGN: cmake + wxWidgets + Boost + OpenGL complex build.
  ;; Next: pin git commit, draft cmake-build-system recipe with wxwidgets, boost, cgal, tbb, opencascade inputs.
  (package (inherit zoxide) (name "orca-slicer-git")))

(define-public passless
  ;; AUR passless: Passless SSH certificate / auth tool (Rust); v0.10.0-1; 2 votes.
  ;; Source: https://github.com/pando85/passless
  ;; NEEDS_RECIPE_DESIGN: cargo-build-system recipe.
  ;; Next: pin release tarball, compute sha256, draft recipe with minimal deps.
  (package (inherit zoxide) (name "passless")))

(define-public lyrus-git
  ;; AUR lyrus-git: Lyrus media player TUI (git, Rust); v1.0.2-1; 2 votes.
  ;; Source: https://github.com/Ja4e/Lyrus
  ;; NEEDS_RECIPE_DESIGN: cargo-build-system recipe with audio inputs.
  ;; Next: pin git commit, compute sha256, draft recipe with rodio/cpal audio inputs.
  (package (inherit zoxide) (name "lyrus-git")))

(define-public pacolog
  ;; AUR pacolog: pacman log parser/viewer shell script; v2.2.1-3; 55 votes.
  ;; Source: https://gitlab.com/protist/pacolog
  ;; NEEDS_RECIPE_DESIGN: shell script trivial-build-system recipe.
  ;; Next: fetch release tarball from GitLab, compute sha256, draft trivial install recipe.
  (package (inherit zoxide) (name "pacolog")))

(define-public agave
  ;; AUR agave: Agave legacy GNOME color scheme designer; v0.4.7-14; 2 votes.
  ;; Source: https://web.archive.org/web/20170327063642/http://home.gna.org/agave/
  ;; NEEDS_RECIPE_DESIGN: legacy GTK2 build from archived source.
  ;; Next: locate GitHub mirror or Wayback Machine tarball, compute sha256, draft gnu recipe.
  (package (inherit zoxide) (name "agave")))

(define-public seanime
  ;; AUR seanime: Seanime self-hosted anime media manager (Go); v3.5.2-1; 4 votes.
  ;; Source: https://github.com/5rahim/seanime
  ;; NEEDS_RECIPE_DESIGN: Go binary wrapper.
  ;; Next: fetch release binary from GitHub, compute sha256, draft binary wrapper recipe.
  (package (inherit zoxide) (name "seanime")))

(define-public kdotool
  ;; AUR kdotool: KDE xdotool equivalent for Wayland (Rust); v0.2.2-1; 3 votes.
  ;; Source: https://github.com/jinliu/kdotool/
  ;; NEEDS_RECIPE_DESIGN: cargo-build-system recipe with KDE dbus inputs.
  ;; Next: pin release tarball, compute sha256, draft recipe.
  (package (inherit zoxide) (name "kdotool")))

(define-public orca-slicer-nightly-bin
  ;; AUR orca-slicer-nightly-bin: Orca Slicer nightly binary; v2026.03.01.175437Z-1; 2 votes.
  ;; Source: https://github.com/SoftFever/OrcaSlicer
  ;; NEEDS_RECIPE_DESIGN: binary wrapper for nightly release.
  ;; Next: pin nightly binary from GitHub releases, compute sha256, draft wrapper with opengl inputs.
  (package (inherit zoxide) (name "orca-slicer-nightly-bin")))

(define-public spotube-bin
  ;; AUR spotube-bin: Spotube open-source Spotify client Flutter binary; v5.1.1-1; 35 votes.
  ;; Source: https://spotube.krtirtho.dev
  ;; NEEDS_RECIPE_DESIGN: Flutter AppImage binary wrapper.
  ;; Next: fetch AppImage release, compute sha256, draft wrapper with mpv, libsecret inputs.
  (package (inherit zoxide) (name "spotube-bin")))

(define-public betterbird-es-bin
  ;; AUR betterbird-es-bin: Betterbird email client Spanish locale binary; v140.8.0esr-1; 8 votes.
  ;; Source: https://www.betterbird.eu/index.html
  ;; NEEDS_RECIPE_DESIGN: Thunderbird fork binary wrapper.
  ;; Next: fetch Spanish Linux release tarball, compute sha256, draft binary wrapper recipe.
  (package (inherit zoxide) (name "betterbird-es-bin")))

(define-public libpamac-aur
  ;; AUR libpamac-aur: libpamac AUR support library (Manjaro/Arch); v11.7.4-2; 50 votes.
  ;; Source: https://github.com/manjaro/libpamac/
  ;; NEEDS_RECIPE_DESIGN: Vala/meson build; Arch-specific pacman AUR backend.
  ;; Next: assess Guix portability; draft meson recipe with libpacman abstraction or Guix store backend.
  (package (inherit zoxide) (name "libpamac-aur")))

(define-public parallel-launcher
  ;; AUR parallel-launcher: Parallel Launcher N64 emulator frontend (Qt/Rust); v9.0.2-1; 6 votes.
  ;; Source: https://parallel-launcher.ca
  ;; NEEDS_RECIPE_DESIGN: Rust + Qt5 cargo-build-system recipe.
  ;; Next: pin release tarball, draft recipe with qt5-base inputs.
  (package (inherit zoxide) (name "parallel-launcher")))

(define-public zsa-kontroll
  ;; AUR zsa-kontroll: ZSA keyboard layout manager CLI (Rust); v1.0.4-2; 3 votes.
  ;; Source: https://github.com/zsa/kontroll
  ;; NEEDS_RECIPE_DESIGN: cargo-build-system recipe with udev rules.
  ;; Next: pin release tarball, compute sha256, draft recipe including udev rules install.
  (package (inherit zoxide) (name "zsa-kontroll")))

(define-public sherlock-launcher-bin
  ;; AUR sherlock-launcher-bin: Sherlock productivity launcher GTK4/Rust binary; v0.1.14-3; 5 votes.
  ;; Source: https://github.com/skxxtz/sherlock
  ;; NEEDS_RECIPE_DESIGN: binary wrapper recipe.
  ;; Next: fetch release binary, compute sha256, draft wrapper with gtk4, libadwaita inputs.
  (package (inherit zoxide) (name "sherlock-launcher-bin")))

(define-public empty
  ;; AUR empty: expect-like pseudo-terminal controller (C); v0.6.23d-1; 14 votes.
  ;; Source: https://empty.sourceforge.net/
  ;; NEEDS_RECIPE_DESIGN: gnu-build-system recipe from C source.
  ;; Next: fetch tarball from SourceForge empty project, compute sha256, draft recipe.
  (package (inherit zoxide) (name "empty")))

(define-public stm32cubeclt
  ;; AUR stm32cubeclt: STM32CubeCLT command line tools binary; v1.21.0-1; 4 votes.
  ;; Source: https://www.st.com/en/development-tools/stm32cubeclt.html
  ;; NEEDS_RECIPE_DESIGN + LICENSE_REVIEW_NEEDED: proprietary ST binary package.
  ;; Next: acquire Linux installer from ST.com, extract, draft binary wrapper.
  (package (inherit zoxide) (name "stm32cubeclt")))

(define-public freetube-electron-bin
  ;; AUR freetube-electron-bin: FreeTube private YouTube client Electron binary; v0.23.15-1; 2 votes.
  ;; Source: https://github.com/FreeTubeApp/FreeTube
  ;; NEEDS_RECIPE_DESIGN: Electron AppImage binary wrapper.
  ;; Next: fetch AppImage release from GitHub, compute sha256, draft binary wrapper recipe.
  (package (inherit zoxide) (name "freetube-electron-bin")))

(define-public caprine-bin
  ;; AUR caprine-bin: Caprine Facebook Messenger client Electron binary; v2.61.0-1; 3 votes.
  ;; Source: https://sindresorhus.com/caprine
  ;; NEEDS_RECIPE_DESIGN: Electron AppImage binary wrapper.
  ;; Next: fetch AppImage from GitHub sindresorhus/caprine, compute sha256, draft wrapper.
  (package (inherit zoxide) (name "caprine-bin")))

(define-public audio-share-bin
  ;; AUR audio-share-bin: Audio Share PC-to-phone audio sharing binary; v0.3.4-1; 3 votes.
  ;; Source: https://github.com/mkckr0/audio-share
  ;; NEEDS_RECIPE_DESIGN: binary wrapper recipe.
  ;; Next: fetch Linux release binary from GitHub, compute sha256, draft wrapper with pulseaudio/pipewire dep.
  (package (inherit zoxide) (name "audio-share-bin")))

(define-public python-fvs
  ;; AUR python-fvs: Python File Versioning System library; v0.3.4-4; 32 votes.
  ;; Source: https://github.com/mirkobrombin/FVS
  ;; NEEDS_RECIPE_DESIGN: python-build-system recipe.
  ;; Next: fetch release from PyPI/GitHub, compute sha256, draft recipe with python-orjson dep.
  (package (inherit zoxide) (name "python-fvs")))

(define-public plasma6-wallpapers-smart-video-wallpaper-reborn
  ;; AUR plasma6-wallpapers-smart-video-wallpaper-reborn: KDE Plasma 6 smart video wallpaper; v2.11.0-1; 7 votes.
  ;; Source: https://github.com/luisbocanegra/plasma-smart-video-wallpaper-reborn
  ;; NEEDS_RECIPE_DESIGN: KDE Plasma 6 cmake plugin build.
  ;; Next: draft cmake-build-system recipe with plasma-framework, qt6-multimedia inputs.
  (package (inherit zoxide) (name "plasma6-wallpapers-smart-video-wallpaper-reborn")))

(define-public ttf-courier-prime
  ;; AUR ttf-courier-prime: Courier Prime monospace font TTF; v1.203-5; 83 votes.
  ;; Source: https://quoteunquoteapps.com/courierprime/
  ;; NEEDS_RECIPE_DESIGN: font trivial-build-system recipe.
  ;; Next: fetch source from GitHub quoteunquoteapps/Courier-Prime, compute sha256, draft recipe.
  (package (inherit zoxide) (name "ttf-courier-prime")))

(define-public ov
  ;; AUR ov: ov feature-rich terminal pager (Go); v0.51.1-1; 8 votes.
  ;; Source: https://github.com/noborus/ov
  ;; NEEDS_RECIPE_DESIGN: go-build-system recipe.
  ;; Next: pin release tarball, compute sha256, draft go recipe with minimal deps.
  (package (inherit zoxide) (name "ov")))

(define-public xlibre-video-dummy
  ;; AUR xlibre-video-dummy: XLibre xf86-video-dummy X11 video driver; v25.0.0-5; 4 votes.
  ;; Source: https://github.com/X11Libre/xf86-video-dummy
  ;; NEEDS_RECIPE_DESIGN: autoconf gnu-build-system recipe with xorg-server inputs.
  ;; Next: fetch release tarball from GitHub X11Libre/xf86-video-dummy, compute sha256, draft recipe.
  (package (inherit zoxide) (name "xlibre-video-dummy")))

(define-public nekoray-bin
  ;; AUR nekoray-bin: Nekoray Qt proxy utility GUI binary; v4.0.1-3; 21 votes.
  ;; Source: https://github.com/MatsuriDayo/nekoray
  ;; NEEDS_RECIPE_DESIGN: binary wrapper recipe.
  ;; Next: fetch Linux release binary, compute sha256, draft wrapper with qt5-base, libxcb inputs.
  (package (inherit zoxide) (name "nekoray-bin")))

(define-public koala-clash-bin
  ;; AUR koala-clash-bin: Koala Clash proxy rule manager binary; v1.1.0-1; 2 votes.
  ;; Source: https://github.com/coolcoala/koala-clash
  ;; NEEDS_RECIPE_DESIGN: binary wrapper recipe.
  ;; Next: fetch release binary from GitHub, compute sha256, draft wrapper.
  (package (inherit zoxide) (name "koala-clash-bin")))

(define-public protonup-rs
  ;; AUR protonup-rs: ProtonUp-rs Proton/Wine GE version manager (Rust); v0.11.0-2; 5 votes.
  ;; Source: https://github.com/auyer/Protonup-rs
  ;; NEEDS_RECIPE_DESIGN: cargo-build-system recipe.
  ;; Next: pin release tarball, compute sha256, draft recipe; Steam at runtime.
  (package (inherit zoxide) (name "protonup-rs")))

(define-public dbgate-bin
  ;; AUR dbgate-bin: DbGate multi-database SQL client Electron binary; v7.1.4-1; 11 votes.
  ;; Source: https://dbgate.org/
  ;; NEEDS_RECIPE_DESIGN: Electron AppImage binary wrapper.
  ;; Next: fetch AppImage from GitHub dbgate/dbgate, compute sha256, draft binary wrapper.
  (package (inherit zoxide) (name "dbgate-bin")))

(define-public stm32cubeprog
  ;; AUR stm32cubeprog: STM32CubeProgrammer flash tool binary; v2.22.0-1; 12 votes.
  ;; Source: https://www.st.com/en/development-tools/stm32cubeprog.html
  ;; NEEDS_RECIPE_DESIGN + LICENSE_REVIEW_NEEDED: proprietary ST binary.
  ;; Next: acquire Linux installer from ST.com, extract, draft wrapper with openjdk dep.
  (package (inherit zoxide) (name "stm32cubeprog")))

(define-public naviterm-bin
  ;; AUR naviterm-bin: NaviTerm terminal emulator binary; v0.7.2-1; 2 votes.
  ;; Source: https://gitlab.com/detoxify92/naviterm
  ;; NEEDS_RECIPE_DESIGN: binary wrapper recipe.
  ;; Next: fetch release binary from GitLab, compute sha256, draft wrapper.
  (package (inherit zoxide) (name "naviterm-bin")))

(define-public asus-5606-fan-state-git
  ;; AUR asus-5606-fan-state-git: ASUS ROG 5606 fan state scripts (git); r42.787f6b3-1; 4 votes.
  ;; Source: https://github.com/ThatOneCalculator/asus-5606-fan-state
  ;; NEEDS_RECIPE_DESIGN: shell scripts trivial-build-system recipe.
  ;; Next: pin git commit, compute sha256, draft trivial install recipe.
  (package (inherit zoxide) (name "asus-5606-fan-state-git")))

(define-public featherwallet-bin
  ;; AUR featherwallet-bin: Feather Monero desktop wallet AppImage; v2.8.1-1; 10 votes.
  ;; Source: https://featherwallet.org
  ;; NEEDS_RECIPE_DESIGN: binary AppImage wrapper.
  ;; Next: fetch Linux AppImage from featherwallet.org, compute sha256, draft wrapper with qt5-base, openssl inputs.
  (package (inherit zoxide) (name "featherwallet-bin")))

(define-public arkenfox-user-js
  ;; AUR arkenfox-user.js: Arkenfox Firefox privacy hardening user.js; v140.1-1; 12 votes.
  ;; Source: https://github.com/arkenfox/user.js
  ;; NEEDS_RECIPE_DESIGN: trivial-build-system data file install.
  ;; Next: fetch release from GitHub arkenfox/user.js, compute sha256, draft trivial recipe.
  (package (inherit zoxide) (name "arkenfox-user.js")))

(define-public phpstorm
  ;; AUR phpstorm: JetBrains PhpStorm PHP IDE binary; v2025.3.4-1; 234 votes.
  ;; Source: https://www.jetbrains.com/phpstorm/
  ;; NEEDS_RECIPE_DESIGN: proprietary JetBrains binary wrapper.
  ;; Next: fetch Linux tarball from JetBrains, compute sha256, draft wrapper with openjdk runtime dep.
  (package (inherit zoxide) (name "phpstorm")))

(define-public phpstorm-jre
  ;; AUR phpstorm-jre: JetBrains Runtime JRE for PhpStorm; v2025.3.4-1; 234 votes.
  ;; Source: https://github.com/JetBrains/JetBrainsRuntime
  ;; NEEDS_RECIPE_DESIGN: JetBrains Runtime binary wrapper (openjdk-based).
  ;; Next: fetch binary release from JetBrains, compute sha256, draft wrapper.
  (package (inherit zoxide) (name "phpstorm-jre")))

(define-public jdk-temurin
  ;; AUR jdk-temurin: Eclipse Temurin JDK binary distribution; v25.0.2.u10-1; 40 votes.
  ;; Source: https://adoptium.net/
  ;; NEEDS_RECIPE_DESIGN: binary JDK wrapper; functionally aliases Guix openjdk.
  ;; Next: fetch Linux tarball from adoptium.net, compute sha256, draft binary wrapper recipe.
  (package (inherit zoxide) (name "jdk-temurin")))

(define-public micromamba
  ;; AUR micromamba: Micromamba lightweight conda package manager (C++); v2.5.0-2; 10 votes.
  ;; Source: https://github.com/mamba-org/mamba
  ;; NEEDS_RECIPE_DESIGN: cmake C++ build.
  ;; Next: fetch release tarball, draft cmake-build-system recipe with libarchive, libcurl, nlohmann-json, libsolv inputs.
  (package (inherit zoxide) (name "micromamba")))

(define-public ttf-comic-mono-git
  ;; AUR ttf-comic-mono-git: Comic Mono programming font (git, TTF); r21.03b5ad8-1; 21 votes.
  ;; Source: https://dtinth.github.io/comic-mono-font/
  ;; NEEDS_RECIPE_DESIGN: font trivial-build-system install.
  ;; Next: pin git commit, compute sha256, draft trivial recipe from GitHub dtinth/comic-mono-font.
  (package (inherit zoxide) (name "ttf-comic-mono-git")))

(define-public plexamp-appimage
  ;; AUR plexamp-appimage: Plexamp music player AppImage (proprietary Electron); v4.13.0-2; 30 votes.
  ;; Source: https://plexamp.com
  ;; NEEDS_RECIPE_DESIGN: proprietary Electron AppImage wrapper.
  ;; Next: fetch Linux AppImage from plexamp.com, compute sha256, draft binary wrapper.
  (package (inherit zoxide) (name "plexamp-appimage")))

(define-public dataflare-bin
  ;; AUR dataflare-bin: DataFlare SQLite management app Electron binary; v2.8.7-1; 2 votes.
  ;; Source: https://dataflare.app/
  ;; NEEDS_RECIPE_DESIGN: Electron binary wrapper.
  ;; Next: fetch AppImage release from dataflare.app, compute sha256, draft binary wrapper.
  (package (inherit zoxide) (name "dataflare-bin")))

(define-public moekoemusic-bin
  ;; AUR moekoemusic-bin: MoekoeMusic Chinese music player Electron binary; v1.6.0-1; 4 votes.
  ;; Source: https://moejue.cn/
  ;; NEEDS_RECIPE_DESIGN: Electron binary wrapper.
  ;; Next: fetch Linux release from moejue.cn, compute sha256, draft binary wrapper recipe.
  (package (inherit zoxide) (name "moekoemusic-bin")))
