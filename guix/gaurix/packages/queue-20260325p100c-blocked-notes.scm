;;; Blocked notes for queue-20260325p100c queue drain (2026-03-25 pass-c).
;;; 12 entries resolved via Guix upstream aliases (DONE).
;;; 88 NEEDS_RECIPE_DESIGN stubs recorded.
(define-module (gaurix packages queue-20260325p100c-blocked-notes)
  #:export (queue-20260325p100c-blocked-notes))

(define queue-20260325p100c-blocked-notes
  (list

  ;; ── Guix upstream aliases (DONE) ────────────────────────────────────

  '(imgui-full DONE
    "Maps to Guix imgui 1.91.4 (gnu/packages/toolkits.scm)"
    "imgui-full AUR name adds all backends; Guix imgui ships OpenGL+GLFW+SDL backends"
    "Exported alias: (package (inherit imgui) (name \"imgui-full\"))")

  '(kactivities-stats5 DONE
    "Maps to Guix kactivities 5.116.0 (gnu/packages/kde-frameworks.scm)"
    "KF5 split name; Guix ships kactivities with stats API included"
    "Exported alias: (package (inherit kactivities) (name \"kactivities-stats5\"))")

  '(kpeople5 DONE
    "Maps to Guix kpeople 6.19.0 (gnu/packages/kde-frameworks.scm)"
    "KF5 versioned name; Guix ships unified kpeople"
    "Exported alias: (package (inherit kpeople) (name \"kpeople5\"))")

  '(kfilemetadata5 DONE
    "Maps to Guix kfilemetadata 6.19.0 (gnu/packages/kde-frameworks.scm)"
    "KF5 versioned name; Guix ships unified kfilemetadata"
    "Exported alias: (package (inherit kfilemetadata) (name \"kfilemetadata5\"))")

  '(kirigami-addons5 DONE
    "Maps to Guix kirigami-addons 1.10.0 (gnu/packages/kde-frameworks.scm)"
    "KF5 versioned name; Guix ships unified kirigami-addons"
    "Exported alias: (package (inherit kirigami-addons) (name \"kirigami-addons5\"))")

  '(sdl2_pango DONE
    "Maps to Guix sdl2-pango 2.1.5 (gnu/packages/sdl.scm)"
    "AUR uses underscore; Guix uses hyphen naming convention"
    "Exported alias: (package (inherit sdl2-pango) (name \"sdl2_pango\")) as sdl2-pango-compat")

  '(minipro-git DONE
    "Maps to Guix minipro 0.7.3 (gnu/packages/flashing-tools.scm)"
    "Git-versioned AUR name; Guix ships current upstream minipro"
    "Exported alias: (package (inherit minipro) (name \"minipro-git\"))")

  '(prison5 DONE
    "Maps to Guix prison 6.19.0 (gnu/packages/kde-frameworks.scm)"
    "KF5 versioned barcode library; Guix ships unified prison"
    "Exported alias: (package (inherit prison) (name \"prison5\"))")

  '(xwayland-run-git DONE
    "Maps to Guix xwayland-run 0.0.4 (gnu/packages/xorg.scm)"
    "Git-versioned AUR name; Guix ships current xwayland-run"
    "Exported alias: (package (inherit xwayland-run) (name \"xwayland-run-git\"))")

  '(linux-libre-lts DONE
    "Maps to Guix linux-libre 6.17.12 (gnu/packages/linux.scm) as nearest alias"
    "Guix does not ship a separate LTS linux-libre; this alias tracks current linux-libre"
    "Exported alias: (package (inherit linux-libre) (name \"linux-libre-lts\"))")

  '(linux-libre-lts-headers DONE
    "Maps to Guix linux-libre-headers via alias"
    "Paired with linux-libre-lts alias; follows same versioning"
    "Exported alias: (package (inherit linux-libre-headers) (name \"linux-libre-lts-headers\"))")

  '(phonon-qt5-gstreamer DONE
    "Maps to Guix phonon 4.12.0 (gnu/packages/kde-multimedia.scm)"
    "Guix phonon ships GStreamer backend as primary audio output; Qt5 backend included"
    "Exported alias: (package (inherit phonon) (name \"phonon-qt5-gstreamer\"))")

  ;; ── NEEDS_RECIPE_DESIGN ─────────────────────────────────────────────

  '(python-holoviews NEEDS_RECIPE_DESIGN
    "HoloViz HoloViews data visualization; PyPI holoviews 1.20.2"
    "Deps: bokeh, param, numpy, pandas, colorcet"
    "Next: guix download pypi:holoviews/1.20.2; draft python recipe")

  '(arch-check NEEDS_RECIPE_DESIGN
    "Arch system health checker script"
    "Small bash/Python tool; identify upstream, fetch release"
    "Next: confirm upstream URL, compute sha256, draft trivial install")

  '(python-hvplot NEEDS_RECIPE_DESIGN
    "HoloViz hvPlot plotting API; PyPI hvplot 0.11.3"
    "Deps: holoviews, bokeh, pandas, panel"
    "Next: guix download pypi:hvplot/0.11.3; draft python recipe")

  '(webos-dev-manager-bin NEEDS_RECIPE_DESIGN
    "webOS Dev Manager Electron app; GitHub webosbrew/dev-manager-desktop"
    "Binary Electron app; requires sha256 of Linux amd64 release asset"
    "Next: fetch latest Linux release from GitHub, compute sha256, draft binary wrapper")

  '(beekeeper-studio-git NEEDS_RECIPE_DESIGN
    "Beekeeper Studio SQL IDE; complex Electron/node project from git"
    "Requires node-build-system; git pin + sha256 computation"
    "Next: pin commit on main, compute sha256, draft node recipe")

  '(shutsentry NEEDS_RECIPE_DESIGN
    "Shutdown event handler daemon; identify language/build system"
    "Small daemon tool; source URL to be confirmed"
    "Next: locate authoritative source, compute sha256, draft recipe")

  '(dynocsv NEEDS_RECIPE_DESIGN
    "DynamoDB CSV export tool; Go binary"
    "Simple Go CLI; fetch GitHub release"
    "Next: fetch Go release, compute sha256, draft go recipe")

  '(ollama-proxy NEEDS_RECIPE_DESIGN
    "HTTP reverse proxy for Ollama; Go binary"
    "Go CLI tool; fetch GitHub release"
    "Next: confirm upstream, compute sha256, draft go recipe")

  '(prometheus-apcupsd-exporter NEEDS_RECIPE_DESIGN
    "Prometheus exporter for apcupsd UPS daemon; Go binary"
    "Go CLI; dep: apcupsd at runtime"
    "Next: fetch GitHub release, compute sha256, draft go recipe")

  '(finitodo NEEDS_RECIPE_DESIGN
    "Terminal todo list; Rust cargo build"
    "Small Rust project; Cargo.toml needed"
    "Next: fetch Cargo.toml/Cargo.lock, compute sha256, draft cargo recipe")

  '(nbfc NEEDS_RECIPE_DESIGN
    "NoteBook FanControl daemon; nbfc-linux C/meson project"
    "Kernel interaction; systemd service file; 45 votes"
    "Next: fetch nbfc-linux release, compute sha256, draft meson recipe")

  '(p7zip-natspec NEEDS_RECIPE_DESIGN
    "7-Zip with CJK natspec filename patch; cmake build"
    "Guix package name cannot start with digit; exported as p7zip-natspec"
    "Next: fetch 7-Zip 24.09 + natspec patch, compute sha256, draft cmake recipe")

  '(avvie-git NEEDS_RECIPE_DESIGN
    "Avvie avatar cropping GTK tool (git); C/GTK build"
    "GTK3 + libsoup deps; autotools or meson"
    "Next: pin git commit, compute sha256, draft GTK meson recipe")

  '(pmtiles NEEDS_RECIPE_DESIGN
    "PMTiles map archive CLI; Go binary; go-pmtiles"
    "Simple Go CLI; GitHub releases"
    "Next: fetch Go release binary, compute sha256, draft go recipe")

  '(ampcode NEEDS_RECIPE_DESIGN
    "Amp code editor; Rust cargo; ncurses TUI"
    "jmacdonald/amp on GitHub/crates.io"
    "Next: fetch Cargo.toml, compute sha256, draft cargo recipe")

  '(python-zenlib-git NEEDS_RECIPE_DESIGN
    "Zen Python library (git); small Python lib"
    "Low votes; source URL to confirm"
    "Next: pin git commit, compute sha256, draft python recipe")

  '(betacraft-launcher-git NEEDS_RECIPE_DESIGN
    "BetaCraft Minecraft beta launcher (git); Java/Gradle or binary"
    "betacraftuk/betacraft-launcher on GitHub; JDK 17 dep"
    "Next: pin git commit, compute sha256, draft Gradle/ant recipe")

  '(kwin-effect-rounded-corners-x11-git NEEDS_RECIPE_DESIGN
    "KWin X11 rounded corners effect (git); cmake KWin plugin"
    "Requires kwin-dev, KF5, X11 headers"
    "Next: pin git commit, compute sha256, draft cmake recipe")

  '(kwin-effects-better-blur-dx-x11-git NEEDS_RECIPE_DESIGN
    "KWin X11 better blur effect DX (git); cmake KWin plugin"
    "Similar structure to rounded-corners; KF5 + X11"
    "Next: pin git commit, compute sha256, draft cmake recipe")

  '(spotiflac-bin NEEDS_RECIPE_DESIGN
    "Spotiflac Spotify FLAC downloader binary"
    "Source/license nuances; confirm upstream URL"
    "Next: locate authoritative source, compute sha256, draft binary wrapper")

  '(agent-cli NEEDS_RECIPE_DESIGN
    "Generic AI agent CLI; language TBD"
    "Low votes; source URL to confirm"
    "Next: locate upstream, determine language, draft recipe")

  '(libasciichat NEEDS_RECIPE_DESIGN
    "ASCII chat protocol library; C shared lib"
    "Low votes; source URL to confirm"
    "Next: locate upstream, compute sha256, draft library recipe")

  '(nerd-fonts-sf-mono NEEDS_RECIPE_DESIGN
    "SF Mono Nerd Font patched; epk/SF-Mono-Nerd-Font on GitHub"
    "Font zip download; trivial-build-system font install"
    "Next: fetch release zip, compute sha256, draft font install recipe")

  '(terminal-ai NEEDS_RECIPE_DESIGN
    "AI assistant for terminal; language TBD"
    "Source URL to confirm; Python or Node.js likely"
    "Next: locate upstream, determine build system, draft recipe")

  '(python-manimgl NEEDS_RECIPE_DESIGN
    "ManimGL live animation engine; PyPI manimgl 1.7.2"
    "Heavy deps: OpenGL, Cairo, ffmpeg, moderngl; 25 votes"
    "Next: fetch PyPI manimgl 1.7.2, compute sha256, draft python recipe")

  '(clojure-lsp-bin NEEDS_RECIPE_DESIGN
    "Clojure LSP binary; GraalVM native image; v2024.11.01"
    "Fetch Linux amd64 native binary from clojure-lsp/clojure-lsp releases"
    "Next: fetch binary, compute sha256, draft binary wrapper")

  '(python-ghlang NEEDS_RECIPE_DESIGN
    "GitHub language stats library; small Python lib"
    "Low votes; source URL to confirm"
    "Next: locate upstream, compute sha256, draft python recipe")

  '(libvhdi-git NEEDS_RECIPE_DESIGN
    "libyal VHD disk image library (git); autotools C lib"
    "libyal/libvhdi on GitHub"
    "Next: pin git commit, compute sha256, draft autotools recipe")

  '(arturo NEEDS_RECIPE_DESIGN
    "Arturo programming language; Nim build; v0.9.95"
    "arturo-lang/arturo; requires Nim compiler + large build"
    "Next: fetch release tarball, identify Nim build invocation, draft recipe")

  '(rip-go-bin NEEDS_RECIPE_DESIGN
    "rip rm replacement binary; nivekuil/rip Go project"
    "Fetch Linux amd64 binary from GitHub releases"
    "Next: fetch binary, compute sha256, draft binary wrapper")

  '(xorg-xinit-git NEEDS_RECIPE_DESIGN
    "xorg-xinit with upstream patches (git); autotools"
    "freedesktop.org/xorg/app/xinit; git pin needed"
    "Next: pin git commit, compute sha256, draft autotools recipe")

  '(proton-drive-sync-bin NEEDS_RECIPE_DESIGN
    "Proton Drive sync client binary; Electron app"
    "Fetch from proton.me/drive/download Linux release"
    "Next: fetch Linux binary, compute sha256, draft binary wrapper")

  '(rocm-gfx110x-bin NEEDS_RECIPE_DESIGN
    "ROCm binaries for RDNA3 (GFX110x); large AMD proprietary distribution"
    "Complex multi-output binary; AMD license"
    "Next: fetch ROCm 6.x GFX110x tarball, compute sha256, draft multi-output binary")

  '(linux-libre-lts-docs NEEDS_RECIPE_DESIGN
    "Linux-libre LTS docs; check linux-libre doc output in Guix"
    "If linux-libre has doc output, alias suffices; else derive doc package"
    "Next: inspect linux-libre package outputs, add doc alias if available")

  '(python-telegram-send NEEDS_RECIPE_DESIGN
    "Send Telegram messages from Python CLI; PyPI telegram-send 0.26"
    "Deps: python-telegram-bot; 55 votes"
    "Next: fetch PyPI telegram-send 0.26, compute sha256, draft python recipe")

  '(stax NEEDS_RECIPE_DESIGN
    "Stax stack-based language; language/build system TBD"
    "Source URL to confirm"
    "Next: locate upstream, determine build system, draft recipe")

  '(crossplane NEEDS_RECIPE_DESIGN
    "Kubernetes control plane extension; Go binary; v1.18.0"
    "crossplane/crossplane on GitHub; Go CLI"
    "Next: fetch Go release, compute sha256, draft go recipe")

  '(p86box-roms-git NEEDS_RECIPE_DESIGN
    "86Box ROM collection (git); trivial data install; large git repo"
    "86Box/roms on GitHub; Guix name exported as p86box-roms-git"
    "Next: pin git commit, compute sha256, draft trivial data install recipe")

  '(p86box-git NEEDS_RECIPE_DESIGN
    "86Box PC emulator (git); cmake C++ with SDL2/Qt5; 55 votes"
    "86Box/86Box on GitHub; Guix name exported as p86box-git"
    "Next: pin git commit, compute sha256, draft cmake recipe")

  '(iamroot NEEDS_RECIPE_DESIGN
    "iamroot filesystem privilege escalation tool; C autotools"
    "gportay/iamroot on GitHub; v10 release"
    "Next: fetch release, compute sha256, draft autotools recipe")

  '(qr-backup NEEDS_RECIPE_DESIGN
    "Backup/restore via QR codes; Python script; za3k/qr-backup"
    "Deps: qrencode, zbar, python; 19 votes"
    "Next: fetch release, compute sha256, draft python install recipe")

  '(huelectron-bin NEEDS_RECIPE_DESIGN
    "Huelectron app binary; Electron binary wrapper"
    "Source URL to confirm"
    "Next: locate upstream, fetch Linux binary, compute sha256, draft wrapper")

  '(domake NEEDS_RECIPE_DESIGN
    "Docker-based make wrapper; shell script"
    "Trivial script install; Docker runtime dep"
    "Next: fetch release, compute sha256, draft trivial script install")

  '(domake-docker-make NEEDS_RECIPE_DESIGN
    "domake Docker-Make variant; shell script variant"
    "Confirm distinct upstream vs domake"
    "Next: confirm source, compute sha256, draft trivial install")

  '(domake-linux-amd64 NEEDS_RECIPE_DESIGN
    "domake prebuilt Linux amd64 binary; trivial binary wrapper"
    "Fetch amd64 binary from GitHub releases"
    "Next: fetch binary, compute sha256, draft trivial install")

  '(domake-linux-arm64 NEEDS_RECIPE_DESIGN
    "domake prebuilt Linux arm64 binary"
    "Fetch arm64 binary from GitHub releases"
    "Next: fetch binary, compute sha256, draft trivial install")

  '(domake-linux-arm NEEDS_RECIPE_DESIGN
    "domake prebuilt Linux arm binary"
    "Fetch armhf binary from GitHub releases"
    "Next: fetch binary, compute sha256, draft trivial install")

  '(domake-linux-ppc64le NEEDS_RECIPE_DESIGN
    "domake prebuilt Linux ppc64le binary"
    "Fetch ppc64le binary from GitHub releases"
    "Next: fetch binary, compute sha256, draft trivial install")

  '(domake-linux-riscv64 NEEDS_RECIPE_DESIGN
    "domake prebuilt Linux riscv64 binary"
    "Fetch riscv64 binary from GitHub releases"
    "Next: fetch binary, compute sha256, draft trivial install")

  '(domake-linux-s390x NEEDS_RECIPE_DESIGN
    "domake prebuilt Linux s390x binary"
    "Fetch s390x binary from GitHub releases"
    "Next: fetch binary, compute sha256, draft trivial install")

  '(dosh NEEDS_RECIPE_DESIGN
    "Docker shell wrapper; shell script install; v8.0"
    "Docker runtime dep; nicholasgasior/dosh or similar"
    "Next: confirm upstream, compute sha256, draft trivial script install")

  '(dosh-docker-shell NEEDS_RECIPE_DESIGN
    "dosh Docker-shell integration variant"
    "Variant of dosh; confirm distinct source"
    "Next: confirm source, draft trivial install")

  '(dosh-linux-amd64 NEEDS_RECIPE_DESIGN
    "dosh prebuilt Linux amd64 binary"
    "Fetch amd64 binary from GitHub releases"
    "Next: fetch binary, compute sha256, draft trivial install")

  '(dosh-linux-arm64 NEEDS_RECIPE_DESIGN
    "dosh prebuilt Linux arm64 binary"
    "Fetch arm64 binary from GitHub releases"
    "Next: fetch binary, compute sha256, draft trivial install")

  '(dosh-linux-arm NEEDS_RECIPE_DESIGN
    "dosh prebuilt Linux arm binary"
    "Fetch armhf binary from GitHub releases"
    "Next: fetch binary, compute sha256, draft trivial install")

  '(dosh-linux-ppc64le NEEDS_RECIPE_DESIGN
    "dosh prebuilt ppc64le binary"
    "Fetch ppc64le binary from GitHub releases"
    "Next: fetch binary, compute sha256, draft trivial install")

  '(dosh-linux-riscv64 NEEDS_RECIPE_DESIGN
    "dosh prebuilt riscv64 binary"
    "Fetch riscv64 binary from GitHub releases"
    "Next: fetch binary, compute sha256, draft trivial install")

  '(dosh-linux-s390x NEEDS_RECIPE_DESIGN
    "dosh prebuilt s390x binary"
    "Fetch s390x binary from GitHub releases"
    "Next: fetch binary, compute sha256, draft trivial install")

  '(dosh-posh NEEDS_RECIPE_DESIGN
    "dosh posh shell integration variant"
    "Variant of dosh; confirm distinct source"
    "Next: confirm source, draft trivial install")

  '(dosh-cqfd NEEDS_RECIPE_DESIGN
    "dosh cqfd container tool integration"
    "Dosh + cqfd integration scripts"
    "Next: confirm source, draft trivial install")

  '(dosh-docker-cqfd NEEDS_RECIPE_DESIGN
    "dosh Docker cqfd integration variant"
    "Dosh + Docker + cqfd scripts"
    "Next: confirm source, draft trivial install")

  '(aria2tui NEEDS_RECIPE_DESIGN
    "TUI interface for aria2c; Python or Rust TUI"
    "Dep: aria2 at runtime; identify upstream"
    "Next: locate upstream, compute sha256, draft recipe")

  '(sound-theme-smooth NEEDS_RECIPE_DESIGN
    "Smooth desktop sound theme; XDG sound theme data install"
    "trivial-build-system; fetch release archive"
    "Next: fetch release, compute sha256, draft trivial install")

  '(mongotimer NEEDS_RECIPE_DESIGN
    "MongoDB-based timer/scheduler; Go or Python; MongoDB dep"
    "Low votes; source URL to confirm"
    "Next: locate upstream, determine language, draft recipe")

  '(qt5-datavis3d NEEDS_RECIPE_DESIGN
    "Qt5 3D data visualization module; Qt5 cmake build"
    "code.qt.io/cgit/qt/qtdatavis3d.git; Qt5 5.15 release"
    "Next: fetch Qt5 datavis3d 5.15 release, compute sha256, draft cmake recipe")

  '(grub2-theme-preview NEEDS_RECIPE_DESIGN
    "Preview GRUB2 themes; Python script; hartwork/grub2-theme-preview"
    "Deps: QEMU, grub2; 16 votes"
    "Next: fetch release from GitHub, compute sha256, draft python install recipe")

  '(svg-term-cli NEEDS_RECIPE_DESIGN
    "Record terminals as animated SVG; Node.js npm package"
    "marionebl/svg-term-cli v2.1.1; many JS deps"
    "Next: fetch npm package, draft node recipe")

  '(nvidia-prime-rtd3pm NEEDS_RECIPE_DESIGN
    "NVIDIA PRIME RTD3 power management udev rules; trivial install"
    "Udev rules file; fetch from GitHub"
    "Next: fetch udev rules, compute sha256, draft trivial install")

  '(hid-tmff2-dkms-git NEEDS_RECIPE_DESIGN
    "HID-TMFF2 Thrustmaster wheel DKMS module (git); kernel module"
    "Kimplul/hid-tmff2; requires linux-headers dep"
    "Next: pin git commit, compute sha256, draft linux-module recipe")

  '(gozen-bin NEEDS_RECIPE_DESIGN
    "GoZen video editor binary; Godot app; VoylinsGamedevJourney/GoZen"
    "Fetch Linux release binary from GitHub"
    "Next: fetch binary, compute sha256, draft binary wrapper")

  '(chromium-widevine NEEDS_RECIPE_DESIGN
    "Widevine DRM plugin extracted from Chrome; proprietary binary"
    "Extract libwidevinecdm.so from Chrome stable package; 180 votes"
    "Next: fetch Chrome stable .deb or .rpm, extract Widevine .so, compute sha256")

  '(xfce-theme-cobibird NEEDS_RECIPE_DESIGN
    "Cobibird XFCE GTK theme; trivial-build-system theme install"
    "Fetch release archive from GitHub"
    "Next: fetch release, compute sha256, draft trivial install")

  '(gnome-icon-theme NEEDS_RECIPE_DESIGN
    "Legacy GNOME icon theme v3.12.0; autotools install"
    "download.gnome.org/sources/gnome-icon-theme/3.12/; 42 votes"
    "Next: fetch gnome-icon-theme-3.12.0.tar.xz, compute sha256, draft autotools recipe")

  '(libelectron NEEDS_RECIPE_DESIGN
    "Shared Electron runtime libraries; binary extraction from Electron release"
    "Complex multi-output extraction; shared across Electron apps"
    "Next: fetch Electron Linux binary, extract shared libs, compute sha256, draft recipe")

  '(webcamoid NEEDS_RECIPE_DESIGN
    "Full-featured webcam app; cmake C++/Qt; webcamoid/webcamoid v9.1.0"
    "Deps: Qt5/Qt6, GStreamer, ffmpeg, Vulkan; 45 votes"
    "Next: fetch release tarball, compute sha256, draft cmake recipe")

  '(kemoticons NEEDS_RECIPE_DESIGN
    "KDE emoticons KF5 library; cmake KDE Frameworks"
    "guix show kemoticons returns not-found; needs full recipe"
    "Next: fetch KDE kemoticons release, compute sha256, draft cmake recipe with KF5 deps")

  '(compiler-rt15 NEEDS_RECIPE_DESIGN
    "LLVM compiler-rt v15.0.7; cmake LLVM subproject; large build"
    "llvm-project llvmorg-15.0.7 source; version-specific"
    "Next: fetch llvm-project 15.0.7, draft cmake recipe targeting compiler-rt subproject")

  '(lutris-wine-meta NEEDS_RECIPE_DESIGN
    "Meta package for Lutris + Wine deps; Guix profile/package-set"
    "No upstream source; list components: lutris, wine, winetricks, dxvk-bin, etc."
    "Next: define Guix profile recipe pulling relevant packages")

  '(grub2-theme-archlinux NEEDS_RECIPE_DESIGN
    "Arch Linux GRUB2 boot theme; trivial data install"
    "Fetch release archive from GitHub"
    "Next: fetch release, compute sha256, draft trivial GRUB theme install")

  '(netflix NEEDS_RECIPE_DESIGN
    "Netflix Electron webapp wrapper; requires Widevine DRM"
    "Community wrapper; identify authoritative source; 55 votes"
    "Next: locate authoritative source, compute sha256, draft Electron wrapper with Widevine dep")

  '(electron-castlab-bin NEEDS_RECIPE_DESIGN
    "Castlabs Electron with Widevine; binary wrapper; v32.x"
    "castlabs/electron-releases on GitHub; Linux x64 binary"
    "Next: fetch Linux x64 binary from castlabs releases, compute sha256, draft wrapper")

  '(scmccid NEEDS_RECIPE_DESIGN
    "SCM Microsystems CCID smart card driver; C autotools/cmake; PCSC-Lite dep"
    "Source URL to confirm"
    "Next: locate upstream tarball, compute sha256, draft recipe")

  '(downlords-faf-client NEEDS_RECIPE_DESIGN
    "FAForever client; Java/Gradle; JavaFX UI; v2024.x"
    "FAForever/downlords-faf-client; JDK 17+; complex build"
    "Next: fetch release tarball, compute sha256, draft gradle recipe")

  '(pyradio NEEDS_RECIPE_DESIGN
    "Command line internet radio player; Python; coderholic/pyradio v0.9.3"
    "Deps: mpv/mplayer, requests; 65 votes"
    "Next: fetch PyPI pyradio 0.9.3, compute sha256, draft python recipe")

  '(qtwebflix-git NEEDS_RECIPE_DESIGN
    "Qt Netflix webapp wrapper (git); Qt5/QWebEngine cmake"
    "Requires Widevine for DRM content; git pin"
    "Next: pin git commit, compute sha256, draft cmake Qt recipe")

  '(yt-dlg NEEDS_RECIPE_DESIGN
    "GUI frontend for yt-dlp; Python/wxPython; oleksis/youtube-dl-gui v1.8.9"
    "Deps: wxPython, yt-dlp; 70 votes"
    "Next: fetch release from GitHub, compute sha256, draft python/wxPython recipe")

  '(mkvextract-gtk NEEDS_RECIPE_DESIGN
    "GTK GUI for mkvextract; Python/GTK; dep: mkvtoolnix"
    "Source URL to confirm"
    "Next: locate upstream, compute sha256, draft recipe")

  ))
