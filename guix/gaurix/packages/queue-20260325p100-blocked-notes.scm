;;; Blocked notes for queue-20260325p100 queue drain (2026-03-25 pass).
;;; 9 entries resolved via Guix upstream aliases (DONE).
;;; 1 SOURCE_UNAVAILABLE; 2 LICENSE_REVIEW_NEEDED; 88 NEEDS_RECIPE_DESIGN.
(define-module (gaurix packages queue-20260325p100-blocked-notes)
  #:export (queue-20260325p100-blocked-notes))

(define queue-20260325p100-blocked-notes
  (list

  ;; ── Guix upstream aliases (DONE) ────────────────────────────────────

  '(kunitconversion5 DONE
    "Maps to Guix kunitconversion 6.19.0 (gnu/packages/kde-frameworks.scm)"
    "KF5 split name; Guix ships unified kunitconversion"
    "Exported alias: (package (inherit kunitconversion) (name \"kunitconversion5\"))")

  '(ungoogled-chromium-xdg DONE
    "Maps to Guix ungoogled-chromium 140.0.7339.207-1 (gnu/packages/chromium.scm)"
    "XDG patch applies runtime policy overlay; Guix chromium already XDG-compatible"
    "Exported alias: (package (inherit ungoogled-chromium) (name \"ungoogled-chromium-xdg\"))")

  '(file-roller-linuxmint DONE
    "Maps to Guix file-roller 3.42.0 (gnu/packages/gnome.scm)"
    "Linux Mint patches are minor UI customizations over upstream GNOME File Roller"
    "Exported alias: (package (inherit file-roller) (name \"file-roller-linuxmint\"))")

  '(purpose5 DONE
    "Maps to Guix purpose 6.19.0 (gnu/packages/kde-frameworks.scm)"
    "KF5 split name; Guix ships unified purpose framework"
    "Exported alias: (package (inherit purpose) (name \"purpose5\"))")

  '(stlink-server DONE
    "Maps to Guix stlink 1.8.0 (gnu/packages/embedded.scm)"
    "Guix stlink ships st-util/st-link server binary alongside st-flash"
    "Exported alias: (package (inherit stlink) (name \"stlink-server\"))")

  '(mod_wsgi DONE
    "Maps to Guix mod-wsgi 4.9.4 (gnu/packages/web.scm)"
    "AUR uses underscore; Guix uses hyphen; identical Apache WSGI module"
    "Exported alias: (package (inherit mod-wsgi) (name \"mod_wsgi\"))")

  '(python-tree-sitter-bash DONE
    "Maps to Guix tree-sitter-bash 0.23.3 (gnu/packages/tree-sitter.scm)"
    "Python binding wraps same tree-sitter-bash grammar library"
    "Exported alias: (package (inherit tree-sitter-bash) (name \"python-tree-sitter-bash\"))")

  '(niri-dinit DONE
    "Maps to Guix niri 25.11 (gnu/packages/wm.scm)"
    "Dinit service file is runtime integration; base niri ships the binary"
    "Exported alias: (package (inherit niri) (name \"niri-dinit\"))")

  '(svt-av1-essential-git DONE
    "Maps to Guix svt-av1 3.1.2 (gnu/packages/video.scm)"
    "Essential fork derives from upstream SVT-AV1; Guix ships canonical reference encoder"
    "Exported alias: (package (inherit svt-av1) (name \"svt-av1-essential-git\"))")

  ;; ── SOURCE_UNAVAILABLE ──────────────────────────────────────────────

  '(waydroid-image SOURCE_UNAVAILABLE
    "Waydroid Android container image is downloaded at runtime via waydroid init"
    "No static artifact to package; image changes frequently"
    "Next: investigate whether a pinned image tarball can be packaged separately")

  ;; ── LICENSE_REVIEW_NEEDED ───────────────────────────────────────────

  '(adastra-bin NEEDS_RECIPE_DESIGN
    "LICENSE_REVIEW_NEEDED: proprietary game binary from itch.io"
    "Redistribution terms unclear; confirm before packaging"
    "Next: check itch.io distribution license, fetch Linux release, draft binary wrapper")

  '(phantom-wallet-bin NEEDS_RECIPE_DESIGN
    "LICENSE_REVIEW_NEEDED: proprietary Electron wallet binary"
    "Redistribution terms need verification from phantom.com"
    "Next: check terms of service, fetch Linux release, draft binary wrapper")

  '(stm32cubeide NEEDS_RECIPE_DESIGN
    "LICENSE_REVIEW_NEEDED: proprietary ST binary IDE"
    "ST EULA requires acceptance; redistribution restricted"
    "Next: acquire Linux installer from ST.com, extract Eclipse bundle, draft wrapper with openjdk dep")

  '(stm32cubeclt NEEDS_RECIPE_DESIGN
    "LICENSE_REVIEW_NEEDED: proprietary ST command line tools"
    "ST license requires acceptance; distribution restricted"
    "Next: acquire Linux installer from ST.com, extract, draft binary wrapper")

  '(stm32cubeprog NEEDS_RECIPE_DESIGN
    "LICENSE_REVIEW_NEEDED: proprietary ST flash programmer"
    "ST EULA requires acceptance; distribution restricted"
    "Next: acquire Linux installer from ST.com, extract, draft wrapper with openjdk dep")

  ;; ── NEEDS_RECIPE_DESIGN (remaining 83) ─────────────────────────────

  '(r-quick-share-bin NEEDS_RECIPE_DESIGN
    "Rust binary; cargo-build-system recipe; v0.11.5; 8 votes"
    "Source: https://github.com/Martichou/rquickshare"
    "Next: fetch release asset, compute sha256, draft recipe")

  '(86box NEEDS_RECIPE_DESIGN
    "cmake + Qt5 + SDL2 build; v5.3; 18 votes"
    "Source: https://86box.net/"
    "Next: fetch source tarball, draft cmake-build-system recipe with qt5-base, sdl2 inputs")

  '(gnome-meta NEEDS_RECIPE_DESIGN
    "Meta-package aggregating GNOME components; v49; 3 votes"
    "Source: https://www.gnome.org/"
    "Next: draft trivial-build-system recipe with gnome-shell, gnome-settings-daemon propagated")

  '(folo-appimage NEEDS_RECIPE_DESIGN
    "Electron AppImage binary; v1.3.1; 8 votes"
    "Source: https://github.com/RSSNext/Folo"
    "Next: fetch AppImage release, compute sha256, draft binary wrapper recipe")

  '(python-pkb-client-git NEEDS_RECIPE_DESIGN
    "Python build; python-build-system recipe; r270; 1 vote"
    "Source: https://github.com/infinityofspace/pkb_client"
    "Next: pin git commit, compute sha256, draft recipe with python-requests dep")

  '(raptor-cage-bin NEEDS_RECIPE_DESIGN
    "Binary wrapper recipe; v1.0.6; 2 votes"
    "Source: https://github.com/RX0FA/raptor-cage"
    "Next: fetch release binary, compute sha256, draft wrapper")

  '(qt5-connectivity NEEDS_RECIPE_DESIGN
    "Qt5 Bluetooth/NFC submodule cmake build; v5.15.18+kde; 4 votes"
    "Source: https://www.qt.io"
    "Next: draft cmake-build-system recipe with qt5-base native-input, dbus inputs")

  '(python-insightface NEEDS_RECIPE_DESIGN
    "Python + Cython + onnxruntime; v0.7.3; 2 votes"
    "Source: https://github.com/deepinsight/insightface"
    "Next: pin release tarball, draft python-build-system recipe with python-onnxruntime, python-numpy")

  '(stash-bin NEEDS_RECIPE_DESIGN
    "Go binary wrapper; v0.30.1; 12 votes"
    "Source: https://github.com/stashapp/stash"
    "Next: fetch release binary, compute sha256, draft wrapper with ffmpeg runtime dep")

  '(logseq-desktop NEEDS_RECIPE_DESIGN
    "Electron binary wrapper; v0.10.15; 32 votes"
    "Source: https://github.com/logseq/logseq"
    "Next: fetch AppImage release, compute sha256, draft binary wrapper recipe")

  '(iamb NEEDS_RECIPE_DESIGN
    "Rust Matrix TUI; cargo-build-system; v0.0.11; 8 votes"
    "Source: https://github.com/ulyssa/iamb"
    "Next: pin release tarball, draft recipe with openssl, sqlite3 inputs")

  '(lcevcdec NEEDS_RECIPE_DESIGN
    "cmake C++ library; v4.0.5; 6 votes"
    "Source: https://github.com/v-novaltd/LCEVCdec/"
    "Next: fetch source tarball, compute sha256, draft cmake-build-system recipe with ffmpeg inputs")

  '(qt5-quick3d NEEDS_RECIPE_DESIGN
    "Qt5 Quick3D submodule cmake build; v5.15.18+kde; 3 votes"
    "Source: https://www.qt.io"
    "Next: draft cmake-build-system recipe with qt5-base, qt5-quick inputs")

  '(geteduroam-gui-bin NEEDS_RECIPE_DESIGN
    "Python/GTK binary; v0.12; 2 votes"
    "Source: https://github.com/geteduroam/linux-app"
    "Next: fetch release binary, compute sha256, draft wrapper with gtk3, python3 inputs")

  '(cachyos-ananicy-rules NEEDS_RECIPE_DESIGN
    "Data files only; trivial install; v1.1.30; 7 votes"
    "Source: https://github.com/CachyOS/ananicy-rules"
    "Next: draft trivial-build-system recipe installing rules to /etc/ananicy.d/")

  '(streamrip NEEDS_RECIPE_DESIGN
    "Python CLI; python-build-system; v2.2.0; 10 votes"
    "Source: https://github.com/nathom/streamrip"
    "Next: pin release tarball, draft recipe with python-click, python-aiohttp, python-mutagen")

  '(wayback-x11 NEEDS_RECIPE_DESIGN
    "C/meson Wayland X11 layer; v0.3; 5 votes"
    "Source: https://wayback.freedesktop.org/"
    "Next: fetch source tarball, draft meson-build-system recipe with wayland, xorg inputs")

  '(thonny NEEDS_RECIPE_DESIGN
    "Python Tkinter IDE; no Guix equivalent; v4.1.7; 43 votes"
    "Source: https://thonny.org"
    "Next: pin release tarball, draft python-build-system recipe with python-tk inputs")

  '(fan2go-git NEEDS_RECIPE_DESIGN
    "Go daemon; go-build-system; r68; 7 votes"
    "Source: https://github.com/markusressel/fan2go"
    "Next: pin git commit, compute sha256, draft go recipe with lm-sensors runtime dep")

  '(asciinema-agg NEEDS_RECIPE_DESIGN
    "Rust binary (separate from asciinema player); v1.7.0; 8 votes"
    "Source: https://github.com/asciinema/agg"
    "Next: pin release tarball, compute sha256, draft cargo-build-system recipe")

  '(tacentview-bin NEEDS_RECIPE_DESIGN
    "GPU-accelerated image viewer binary; v1.0.47; 2 votes"
    "Source: https://github.com/bluescan/tacentview"
    "Next: fetch Linux release binary from GitHub, compute sha256, draft wrapper with libGL, SDL2")

  '(iloader-appimage NEEDS_RECIPE_DESIGN
    "Electron AppImage binary; v1.1.6; 2 votes"
    "Source: https://github.com/nab138/iloader"
    "Next: fetch AppImage release, compute sha256, draft binary wrapper recipe")

  '(hardened-malloc NEEDS_RECIPE_DESIGN
    "C/make (clang) library; v13; 21 votes"
    "Source: https://github.com/GrapheneOS/hardened_malloc"
    "Next: fetch release tarball, draft make recipe outputting libhardened_malloc.so; needs clang native-input")

  '(viu-media NEEDS_RECIPE_DESIGN
    "Binary/Electron app; v3.3.7; 3 votes"
    "Source: https://github.com/viu-media/viu"
    "Next: verify release artifacts, compute sha256, draft binary wrapper recipe")

  '(solflare-wallet-bin NEEDS_RECIPE_DESIGN
    "Proprietary Electron binary; v2.18.4; 3 votes"
    "Source: https://www.solflare.com"
    "Next: fetch Linux release tarball, compute sha256, draft binary wrapper recipe")

  '(cros-container-guest-tools-git NEEDS_RECIPE_DESIGN
    "Shell scripts + service units; r403; 21 votes"
    "Source: https://chromium.googlesource.com/chromiumos/containers/cros-container-guest-tools"
    "Next: pin git commit, adapt systemd units to dinit, draft trivial recipe")

  '(welle-io NEEDS_RECIPE_DESIGN
    "cmake + Qt5 + rtlsdr/soapysdr; v2.7; 8 votes"
    "Source: https://www.welle.io"
    "Next: fetch source tarball, draft cmake-build-system recipe with qt5-base, librtlsdr, soapysdr")

  '(stasis NEEDS_RECIPE_DESIGN
    "C static site generator; v1.1.0; 3 votes"
    "Source: https://github.com/saltnpepper97/stasis"
    "Next: fetch release tarball from GitHub, compute sha256, draft gnu-build-system recipe")

  '(plasma6-applets-kurve NEEDS_RECIPE_DESIGN
    "KDE Plasma 6 QML applet; v3.5.0; 5 votes"
    "Source: https://github.com/luisbocanegra/kurve"
    "Next: draft cmake-build-system recipe with plasma-framework, kf6-plasma inputs")

  '(stretchly-bin NEEDS_RECIPE_DESIGN
    "Electron binary; v1.20.0; 12 votes"
    "Source: https://github.com/hovancik/stretchly/"
    "Next: fetch AppImage Linux release, compute sha256, draft binary wrapper recipe")

  '(plasma6-wallpapers-wallpaper-engine-git NEEDS_RECIPE_DESIGN
    "cmake + Qt6 + Vulkan + mpv build; r118; 32 votes"
    "Source: https://github.com/catsout/wallpaper-engine-kde-plugin"
    "Next: pin git commit, draft cmake recipe with qt6-base, vulkan-loader, mpv, kpackage inputs")

  '(gtk2-perl NEEDS_RECIPE_DESIGN
    "Perl MakeMaker build; v1.24993; 4 votes"
    "Source: http://gtk2-perl.sourceforge.net/"
    "Next: fetch tarball, compute sha256, draft perl-build-system recipe with gtk+2, perl-cairo inputs")

  '(dela NEEDS_RECIPE_DESIGN
    "Go task runner binary; v0.0.6; 2 votes"
    "Source: https://github.com/aleyan/dela"
    "Next: pin release tarball, compute sha256, draft go-build-system recipe")

  '(bento-bin NEEDS_RECIPE_DESIGN
    "Go binary wrapper (formerly Benthos); v1.16.1; 1 vote"
    "Source: https://warpstreamlabs.github.io/bento/"
    "Next: fetch release binary from GitHub warpstreamlabs/bento, compute sha256, draft wrapper")

  '(crush-bin NEEDS_RECIPE_DESIGN
    "Go binary wrapper (Charm shell); v0.51.2; 4 votes"
    "Source: https://charm.sh/crush"
    "Next: fetch Charm release binary, compute sha256, draft binary wrapper recipe")

  '(kchmviewer NEEDS_RECIPE_DESIGN
    "cmake + Qt5/KDE CHM viewer; v8.0; 3 votes"
    "Source: http://kchmviewer.sourceforge.net/"
    "Next: fetch release tarball, draft cmake recipe with qt5-base, kio, kwidgetsaddons inputs")

  '(pdf4qt-bin NEEDS_RECIPE_DESIGN
    "Qt5 PDF editor binary; v1.5.3.1; 4 votes"
    "Source: https://jakubmelka.github.io/"
    "Next: fetch release binary from GitHub jakubmelka/PDF4QT, compute sha256, draft wrapper with qt5-base")

  '(pgadmin4 NEEDS_RECIPE_DESIGN
    "Python/Flask + Electron desktop app; v9.13; 4 votes"
    "Source: https://www.pgadmin.org"
    "Next: fetch desktop app release, compute sha256, draft binary wrapper or flask recipe")

  '(icu69-bin NEEDS_RECIPE_DESIGN
    "Legacy ICU 69.1 from source tarball; 16 votes"
    "Source: https://github.com/unicode-org/icu"
    "Next: fetch ICU 69.1 source, compute sha256, draft gnu-build-system recipe as compat package")

  '(mongodb-tools-bin NEEDS_RECIPE_DESIGN
    "Go binary bundle wrapper; v100.13.0; 33 votes"
    "Source: https://github.com/mongodb/mongo-tools"
    "Next: fetch Linux binary bundle from MongoDB, compute sha256, draft binary wrapper")

  '(vscodium-xdg-dir-patch NEEDS_RECIPE_DESIGN
    "Patch wrapper; v1.0.0; 5 votes"
    "Depends on vscodium binary; no standalone release"
    "Next: draft recipe applying XDG patch to vscodium installation directory")

  '(filen-desktop-bin NEEDS_RECIPE_DESIGN
    "Electron AppImage binary; v3.0.47; 14 votes"
    "Source: https://filen.io/"
    "Next: fetch AppImage from GitHub FilenCloudDienste/filen-desktop, compute sha256, draft wrapper")

  '(seamonkey NEEDS_RECIPE_DESIGN
    "Complex Mozilla-family build; v2.53.23; 9 votes"
    "Source: https://www.seamonkey-project.org"
    "Next: fetch source tarball, draft gnu-build-system recipe with mozilla build infrastructure")

  '(kemulatornnmod-bin NEEDS_RECIPE_DESIGN
    "Binary wrapper; v2.21.2; 4 votes"
    "Source: https://nnproject.cc/kem/"
    "Next: fetch Linux release from nnproject.cc, compute sha256, draft binary wrapper")

  '(unciv-bin NEEDS_RECIPE_DESIGN
    "JVM binary wrapper; v4.19.19; 11 votes"
    "Source: https://github.com/yairm210/Unciv"
    "Next: fetch release jar/binary from GitHub, compute sha256, draft wrapper with openjdk dep")

  '(open-tv-bin NEEDS_RECIPE_DESIGN
    "Tauri/Rust binary wrapper; v1.9.1; 13 votes"
    "Source: https://github.com/fredolx/open-tv"
    "Next: fetch Linux release binary, compute sha256, draft wrapper with webkitgtk, gtk3 inputs")

  '(elan-lean NEEDS_RECIPE_DESIGN
    "Rust binary; cargo-build-system; v4.1.2; 12 votes"
    "Source: https://github.com/leanprover/elan"
    "Next: pin release tarball, compute sha256, draft recipe; manages Lean toolchain")

  '(orca-slicer-git NEEDS_RECIPE_DESIGN
    "cmake + wxWidgets + Boost + OpenGL complex build; r28108; 7 votes"
    "Source: https://github.com/SoftFever/OrcaSlicer"
    "Next: pin git commit, draft cmake recipe with wxwidgets, boost, cgal, tbb, opencascade inputs")

  '(passless NEEDS_RECIPE_DESIGN
    "Rust binary; cargo-build-system; v0.10.0; 2 votes"
    "Source: https://github.com/pando85/passless"
    "Next: pin release tarball, compute sha256, draft recipe with minimal deps")

  '(lyrus-git NEEDS_RECIPE_DESIGN
    "Rust TUI media player; git; 2 votes"
    "Source: https://github.com/Ja4e/Lyrus"
    "Next: pin git commit, compute sha256, draft cargo-build-system recipe with rodio/cpal audio inputs")

  '(pacolog NEEDS_RECIPE_DESIGN
    "Bash script trivial install; v2.2.1; 55 votes"
    "Source: https://gitlab.com/protist/pacolog"
    "Next: fetch release tarball from GitLab, compute sha256, draft trivial-build-system recipe")

  '(agave NEEDS_RECIPE_DESIGN
    "Legacy GTK2 app from archived source; v0.4.7; 2 votes"
    "Source: https://github.com/GNOME/agave (mirror)"
    "Next: locate tarball from GitHub mirror or Wayback Machine, compute sha256, draft gnu recipe")

  '(seanime NEEDS_RECIPE_DESIGN
    "Go binary wrapper; v3.5.2; 4 votes"
    "Source: https://github.com/5rahim/seanime"
    "Next: fetch release binary from GitHub, compute sha256, draft binary wrapper recipe")

  '(kdotool NEEDS_RECIPE_DESIGN
    "Rust binary; cargo-build-system; v0.2.2; 3 votes"
    "Source: https://github.com/jinliu/kdotool/"
    "Next: pin release tarball, compute sha256, draft recipe with dbus KDE IPC inputs")

  '(orca-slicer-nightly-bin NEEDS_RECIPE_DESIGN
    "Binary nightly wrapper; v2026.03; 2 votes"
    "Source: https://github.com/SoftFever/OrcaSlicer"
    "Next: pin nightly binary from GitHub releases, compute sha256, draft wrapper with opengl inputs")

  '(spotube-bin NEEDS_RECIPE_DESIGN
    "Flutter AppImage binary; v5.1.1; 35 votes"
    "Source: https://spotube.krtirtho.dev"
    "Next: fetch AppImage release, compute sha256, draft wrapper with mpv, libsecret inputs")

  '(betterbird-es-bin NEEDS_RECIPE_DESIGN
    "Thunderbird fork binary wrapper; v140.8.0esr; 8 votes"
    "Source: https://www.betterbird.eu/index.html"
    "Next: fetch Spanish Linux release tarball, compute sha256, draft binary wrapper recipe")

  '(libpamac-aur NEEDS_RECIPE_DESIGN
    "Vala/meson; Arch-specific pacman AUR backend; v11.7.4; 50 votes"
    "Source: https://github.com/manjaro/libpamac/"
    "Next: assess Guix portability; draft meson recipe with libpacman abstraction or Guix store backend")

  '(parallel-launcher NEEDS_RECIPE_DESIGN
    "Rust + Qt5 cargo-build-system; v9.0.2; 6 votes"
    "Source: https://parallel-launcher.ca"
    "Next: pin release tarball, draft recipe with qt5-base inputs")

  '(zsa-kontroll NEEDS_RECIPE_DESIGN
    "Rust binary; cargo-build-system; v1.0.4; 3 votes"
    "Source: https://github.com/zsa/kontroll"
    "Next: pin release tarball, compute sha256, draft recipe including udev rules install")

  '(sherlock-launcher-bin NEEDS_RECIPE_DESIGN
    "GTK4/Rust binary; v0.1.14; 5 votes"
    "Source: https://github.com/skxxtz/sherlock"
    "Next: fetch release binary, compute sha256, draft wrapper with gtk4, libadwaita inputs")

  '(empty NEEDS_RECIPE_DESIGN
    "C expect-like utility; gnu-build-system; v0.6.23d; 14 votes"
    "Source: https://empty.sourceforge.net/"
    "Next: fetch tarball from SourceForge empty project, compute sha256, draft recipe")

  '(freetube-electron-bin NEEDS_RECIPE_DESIGN
    "Electron AppImage binary; v0.23.15; 2 votes"
    "Source: https://github.com/FreeTubeApp/FreeTube"
    "Next: fetch AppImage from GitHub, compute sha256, draft binary wrapper recipe")

  '(caprine-bin NEEDS_RECIPE_DESIGN
    "Electron AppImage binary; v2.61.0; 3 votes"
    "Source: https://sindresorhus.com/caprine"
    "Next: fetch AppImage from GitHub sindresorhus/caprine, compute sha256, draft wrapper")

  '(audio-share-bin NEEDS_RECIPE_DESIGN
    "Binary wrapper; v0.3.4; 3 votes"
    "Source: https://github.com/mkckr0/audio-share"
    "Next: fetch Linux release binary from GitHub, compute sha256, draft wrapper with pulseaudio/pipewire dep")

  '(python-fvs NEEDS_RECIPE_DESIGN
    "Python library; python-build-system; v0.3.4; 32 votes"
    "Source: https://github.com/mirkobrombin/FVS"
    "Next: fetch release from PyPI/GitHub, compute sha256, draft recipe with python-orjson dep")

  '(plasma6-wallpapers-smart-video-wallpaper-reborn NEEDS_RECIPE_DESIGN
    "KDE Plasma 6 cmake plugin; v2.11.0; 7 votes"
    "Source: https://github.com/luisbocanegra/plasma-smart-video-wallpaper-reborn"
    "Next: draft cmake-build-system recipe with plasma-framework, qt6-multimedia inputs")

  '(ttf-courier-prime NEEDS_RECIPE_DESIGN
    "Font trivial-build-system install; v1.203; 83 votes"
    "Source: https://quoteunquoteapps.com/courierprime/"
    "Next: fetch from GitHub quoteunquoteapps/Courier-Prime, compute sha256, draft trivial recipe")

  '(ov NEEDS_RECIPE_DESIGN
    "Go terminal pager binary; v0.51.1; 8 votes"
    "Source: https://github.com/noborus/ov"
    "Next: pin release tarball, compute sha256, draft go-build-system recipe with minimal deps")

  '(xlibre-video-dummy NEEDS_RECIPE_DESIGN
    "autoconf gnu-build-system X11 video driver; v25.0.0; 4 votes"
    "Source: https://github.com/X11Libre/xf86-video-dummy"
    "Next: fetch release tarball from GitHub X11Libre, compute sha256, draft recipe with xorg-server inputs")

  '(nekoray-bin NEEDS_RECIPE_DESIGN
    "Qt5 binary wrapper; v4.0.1; 21 votes"
    "Source: https://github.com/MatsuriDayo/nekoray"
    "Next: fetch Linux release binary, compute sha256, draft wrapper with qt5-base, libxcb inputs")

  '(koala-clash-bin NEEDS_RECIPE_DESIGN
    "Binary wrapper; v1.1.0; 2 votes"
    "Source: https://github.com/coolcoala/koala-clash"
    "Next: fetch release binary from GitHub, compute sha256, draft wrapper")

  '(protonup-rs NEEDS_RECIPE_DESIGN
    "Rust binary; cargo-build-system; v0.11.0; 5 votes"
    "Source: https://github.com/auyer/Protonup-rs"
    "Next: pin release tarball, compute sha256, draft recipe; Steam at runtime")

  '(dbgate-bin NEEDS_RECIPE_DESIGN
    "Electron AppImage binary; v7.1.4; 11 votes"
    "Source: https://dbgate.org/"
    "Next: fetch AppImage from GitHub dbgate/dbgate, compute sha256, draft binary wrapper")

  '(naviterm-bin NEEDS_RECIPE_DESIGN
    "Binary wrapper; v0.7.2; 2 votes"
    "Source: https://gitlab.com/detoxify92/naviterm"
    "Next: fetch release binary from GitLab, compute sha256, draft wrapper")

  '(asus-5606-fan-state-git NEEDS_RECIPE_DESIGN
    "Shell scripts trivial install; r42; 4 votes"
    "Source: https://github.com/ThatOneCalculator/asus-5606-fan-state"
    "Next: pin git commit, compute sha256, draft trivial-build-system recipe")

  '(featherwallet-bin NEEDS_RECIPE_DESIGN
    "Binary AppImage Qt5; v2.8.1; 10 votes"
    "Source: https://featherwallet.org"
    "Next: fetch Linux AppImage, compute sha256, draft wrapper with qt5-base, openssl inputs")

  '(arkenfox-user-js NEEDS_RECIPE_DESIGN
    "Data file + scripts trivial install; v140.1; 12 votes"
    "Source: https://github.com/arkenfox/user.js"
    "Next: fetch release from GitHub arkenfox/user.js, compute sha256, draft trivial recipe")

  '(phpstorm NEEDS_RECIPE_DESIGN
    "Proprietary JetBrains binary wrapper; v2025.3.4; 234 votes"
    "Source: https://www.jetbrains.com/phpstorm/"
    "Next: fetch Linux tarball from JetBrains, compute sha256, draft wrapper with openjdk runtime dep")

  '(phpstorm-jre NEEDS_RECIPE_DESIGN
    "JetBrains Runtime binary wrapper (openjdk-based); v2025.3.4; 234 votes"
    "Source: https://github.com/JetBrains/JetBrainsRuntime"
    "Next: fetch binary release from JetBrains, compute sha256, draft wrapper")

  '(jdk-temurin NEEDS_RECIPE_DESIGN
    "Binary JDK wrapper; v25.0.2.u10; 40 votes; functionally aliases Guix openjdk"
    "Source: https://adoptium.net/"
    "Next: fetch Linux tarball from adoptium.net, compute sha256, draft binary wrapper recipe")

  '(micromamba NEEDS_RECIPE_DESIGN
    "cmake C++ build; v2.5.0; 10 votes"
    "Source: https://github.com/mamba-org/mamba"
    "Next: fetch release tarball, draft cmake recipe with libarchive, libcurl, nlohmann-json, libsolv inputs")

  '(ttf-comic-mono-git NEEDS_RECIPE_DESIGN
    "Font trivial-build-system install; r21; 21 votes"
    "Source: https://dtinth.github.io/comic-mono-font/"
    "Next: pin git commit, compute sha256, draft trivial recipe from GitHub dtinth/comic-mono-font")

  '(plexamp-appimage NEEDS_RECIPE_DESIGN
    "Proprietary Electron AppImage wrapper; v4.13.0; 30 votes"
    "Source: https://plexamp.com"
    "Next: fetch Linux AppImage from plexamp.com, compute sha256, draft binary wrapper")

  '(dataflare-bin NEEDS_RECIPE_DESIGN
    "Electron binary wrapper; v2.8.7; 2 votes"
    "Source: https://dataflare.app/"
    "Next: fetch AppImage from dataflare.app, compute sha256, draft binary wrapper")

  '(moekoemusic-bin NEEDS_RECIPE_DESIGN
    "Electron binary wrapper; v1.6.0; 4 votes"
    "Source: https://moejue.cn/"
    "Next: fetch Linux release from moejue.cn, compute sha256, draft binary wrapper")

  ))
