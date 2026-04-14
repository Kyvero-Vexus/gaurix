;;; recipe-resolver-260414t — blocked package notes
;;; 88 entries with specific reason codes
;;;
;;; #13370 kde-thumbnailer-apk: DEP_RESOLUTION_FAILED — KDE/KIO plugin for APK thumbnail previews; requires KDE Frameworks (KIO, KFileMetaData) build integration; A1: needs kio-dev + cmake KDE macros; next: package KIO plugin build system
;;; #13371 openvpn-update-resolv-conf-git: NEEDS_RECIPE_DESIGN — shell script updating resolv.conf for OpenVPN; requires openresolv/resolvconf runtime; A1: script needs patching for Guix paths; A2: resolvconf integration varies; next: adapt script paths
;;; #13372 crocotile3d: SOURCE_UNAVAILABLE — proprietary tile-based 3D modeling app; no public source or stable binary download URL; A1: upstream distributes via itch.io with auth; next: needs manual download packaging
;;; #13373 iso-commander: NEEDS_RECIPE_DESIGN — C++ ISO manager; no standard release artifacts on GitHub; A1: build system not identified; A2: source repo structure unclear; next: investigate upstream build system
;;; #13374 bulk-rename-plus: NEEDS_RECIPE_DESIGN — C++ bulk renamer; no standard release artifacts; A1: build system needs investigation; A2: no binary releases; next: check for CMakeLists.txt or Makefile
;;; #13377 pat-aur-host-git: NEEDS_RECIPE_DESIGN — Arch Linux AUR build helper (host); depends on pacman/makepkg/arch-install-scripts; A1: Arch-specific tooling; A2: not portable; next: not feasible outside Arch
;;; #13378 pat-aur-client-git: NEEDS_RECIPE_DESIGN — Arch Linux AUR build helper (client); depends on pacman ecosystem; A1: Arch-specific; next: not portable to Guix
;;; #13379 pat-aur-client-flatpak-git: NEEDS_RECIPE_DESIGN — Flatpak support addon for pat-aur; depends on pat-aur + flatpak integration; A1: requires pat-aur first; next: blocked on pat-aur
;;; #13380 pat-aur-client-firmware-git: NEEDS_RECIPE_DESIGN — firmware update support for pat-aur; depends on pat-aur + fwupd; A1: requires pat-aur first; next: blocked on pat-aur
;;; #13382 seafile: DEP_RESOLUTION_FAILED — file sync tool; complex C/Python hybrid with libsearpc/ccnet custom libraries; A1: needs libsearpc + ccnet (custom Seafile libraries); A2: Qt5 GUI; next: package libsearpc/ccnet first
;;; #13383 frame: NEEDS_RECIPE_DESIGN — touch input handling library (discontinued by Canonical); A1: grail+frame replaced by libinput; A2: no maintained upstream; next: check if obsolete
;;; #13384 hardcode-fixer-git: NEEDS_RECIPE_DESIGN — Python script fixing hardcoded desktop icons; A1: requires python3 + desktop-file-utils; A2: needs icon theme path detection; next: adapt for Guix icon paths
;;; #13387 hexo-cli: DEP_RESOLUTION_FAILED — Node.js static blog framework CLI; requires npm ecosystem (hexo + plugins); A1: node-build-system cannot resolve hexo dep tree; next: needs npm lockfile packaging
;;; #13391 greetd-regreet-git: DEP_RESOLUTION_FAILED — GTK4 greeter for greetd; requires greetd + GTK4 + Rust; A1: cargo-build-system needs 50+ crate deps; A2: needs greetd packaged; next: package greetd first
;;; #13392 rankmirrors-systemd: NEEDS_RECIPE_DESIGN — Arch Linux pacman mirror ranking via systemd timer; A1: pacman-specific (rankmirrors from pacman-contrib); A2: not portable; next: Arch-only, not feasible
;;; #13394 ffbtools-git: NEEDS_RECIPE_DESIGN — force feedback testing tools; C/udev project; A1: requires libusb + udev integration; A2: kernel HID dependencies; next: investigate build system
;;; #13395 aacskeys: NEEDS_RECIPE_DESIGN — AACS decryption key retrieval; C project with libaacs dep; A1: requires libaacs (in Guix); A2: legal sensitivity around DRM; next: check libaacs availability
;;; #13396 thcrap-steam-proton-wrapper-git: NEEDS_RECIPE_DESIGN — Touhou game patching wrapper for Steam/Proton; A1: requires Steam runtime + Proton; A2: Windows game patching; next: not feasible without Steam
;;; #13398 protonfixes: NEEDS_RECIPE_DESIGN — Python module for Steam Proton game fixes; A1: requires Steam Proton runtime; A2: hooks into Steam's compat layer; next: not feasible without Steam packaging
;;; #13410 wl-vapi-gen: NEEDS_RECIPE_DESIGN — Vala binding generator for Wayland protocols; A1: requires vala compiler + wayland-scanner; A2: custom code generation; next: needs vala + wayland-protocols packaging
;;; #13411 waybar-minimal-nosystemd-git: NEEDS_RECIPE_DESIGN — Waybar fork without systemd; A1: same as waybar but patched build; A2: Guix already has waybar without hard systemd dep; next: may be redundant with existing waybar
;;; #13416 void-git: SOURCE_UNAVAILABLE — Cursor alternative AI code editor; A1: closed-source Electron app; A2: no stable public binary release URL found; next: monitor for public release
;;; #13425 speech-dispatcher-mimo: DEP_RESOLUTION_FAILED — speech-dispatcher module for Xiaomi MiMo TTS; A1: requires speech-dispatcher + MiMo API client; A2: proprietary API integration; next: needs API client packaging
;;; #13426 spacecal-for-monado: DEP_RESOLUTION_FAILED — VR space calibrator for Monado/WiVRn; A1: requires OpenXR + Monado runtime; A2: complex VR stack deps; next: needs OpenXR/Monado packaged
;;; #13428 s-console: NEEDS_RECIPE_DESIGN — GTK3/VTE terminal emulator; A1: requires GTK3 + VTE + custom build; A2: described as 'for Arch Linux'; next: check portability
;;; #13429 rustycat-android: NEEDS_RECIPE_DESIGN — Android logcat viewer; A1: requires Android SDK/platform-tools; A2: adb dependency; next: needs android-tools packaging
;;; #13432 python-pyqt5-purchasing: DEP_RESOLUTION_FAILED — Python bindings for Qt5 Purchasing module; A1: QtPurchasing removed in Qt6; A2: requires SIP + PyQt5 build chain; next: Qt5 Purchasing not in Guix
;;; #13433 python-pyqt5-networkauth: DEP_RESOLUTION_FAILED — Python bindings for Qt5 NetworkAuth; A1: requires qtnetworkauth module; A2: SIP + PyQt5 build chain; next: package qtnetworkauth first
;;; #13434 python-pyqt5-datavisualization: DEP_RESOLUTION_FAILED — Python bindings for Qt5 DataVisualization; A1: requires qtdatavis3d; A2: commercial Qt module; next: qtdatavis3d not in Guix
;;; #13435 python-pyqt5-3d: DEP_RESOLUTION_FAILED — Python bindings for Qt5 3D; A1: requires qt3d module; A2: SIP + PyQt5 build chain; next: qt3d partially in Guix, needs verification
;;; #13436 python-pycxx: NEEDS_RECIPE_DESIGN — C++ extension framework for Python; A1: header-only library + build integration; A2: distutils-based; next: test pyproject or python-build-system
;;; #13437 pvpn-go: DEP_RESOLUTION_FAILED — Proton VPN CLI in Go with WireGuard; A1: requires 30+ Go modules; A2: WireGuard kernel module integration; next: Go dep tree resolution needed
;;; #13440 profile-sync-daemon-zotero: NEEDS_RECIPE_DESIGN — Zotero profile sync addon for PSD; A1: requires profile-sync-daemon base; A2: Zotero-specific paths; next: package profile-sync-daemon first
;;; #13443 pidcat-python3-git: NEEDS_RECIPE_DESIGN — Python Android logcat viewer; A1: requires adb (Android platform-tools); A2: Python script; next: needs android-tools
;;; #13444 picplanner: NEEDS_RECIPE_DESIGN — photo location planner; A1: unclear upstream/build system; A2: may need geolocation libs; next: investigate source
;;; #13449 owlry-plugin-converter: NEEDS_RECIPE_DESIGN — transitional package — converter built into owlry-core; A1: empty/meta package; next: skip, functionality merged into owlry-core
;;; #13450 owlry-core: NEEDS_RECIPE_DESIGN — application launcher daemon; A1: unclear source/build system; A2: plugin architecture; next: investigate upstream
;;; #13451 nono-ai: NEEDS_RECIPE_DESIGN — kernel-enforced AI sandbox using Landlock; A1: requires Landlock LSM (kernel 5.13+); A2: Rust project with system deps; next: investigate cargo deps
;;; #13452 nodejs-ripencli: DEP_RESOLUTION_FAILED — npm dependency update tool; A1: Node.js/npm package; A2: node-build-system dep resolution; next: needs npm lockfile packaging
;;; #13453 ninjabrain-bot: DEP_RESOLUTION_FAILED — Minecraft stronghold calculator; A1: Java/Gradle application; A2: complex Java dep tree; next: needs Gradle build packaging
;;; #13457 mpv-manager-git: NEEDS_RECIPE_DESIGN — mpv installer/manager with Web UI, TUI, CLI; A1: Go + web frontend; A2: multiple build targets; next: investigate Go build
;;; #13459 mpv-manager: NEEDS_RECIPE_DESIGN — mpv media player manager; A1: Go project; A2: same as mpv-manager-git but stable; next: investigate Go deps
;;; #13460 mesa-dlss-reflex-git: NEEDS_RECIPE_DESIGN — Mesa fork with NVIDIA DLSS/Reflex; A1: massive Mesa build + NVIDIA proprietary headers; A2: kernel driver integration; next: not feasible, custom Mesa build
;;; #13465 localwp: SOURCE_UNAVAILABLE — Local WordPress development environment; A1: proprietary Electron app by Flywheel; A2: no public download URL without auth; next: requires account/auth to download
;;; #13466 local-chaos: NEEDS_RECIPE_DESIGN — unclear upstream; A1: no clear source repository found; A2: minimal documentation; next: investigate upstream
;;; #13467 llama.cpp-clblast: NEEDS_RECIPE_DESIGN — llama.cpp with CLBlast GPU backend; A1: requires CLBlast + OpenCL; A2: cmake build with GPU flags; next: check CLBlast availability in Guix
;;; #13470 libastal-wl-git: DEP_RESOLUTION_FAILED — Wayland library for Astal widget framework; A1: requires GTK4 + Layer Shell; A2: Vala/GObject build; next: needs gtk4-layer-shell
;;; #13471 lectern-git: NEEDS_RECIPE_DESIGN — unclear upstream; A1: no clear source found; next: investigate
;;; #13473 kittehlist-git: NEEDS_RECIPE_DESIGN — unclear upstream; A1: no clear source found; next: investigate
;;; #13474 kdenlive-appimage-pure: NEEDS_RECIPE_DESIGN — Kdenlive as AppImage; A1: Guix already has kdenlive from source; A2: redundant with existing package; next: create compat alias instead
;;; #13476 iwlwifi-lar-patched: NEEDS_RECIPE_DESIGN — patched Intel WiFi kernel modules; A1: requires linux kernel source + module build; A2: Arch kernel version specific; next: needs linux-module-build-system
;;;
;;; #13400 majsoul-plus-bin: NEEDS_RECIPE_DESIGN — Majsoul Plus Electron browser for mahjong; A1: Electron app packaging; A2: game-specific wrapper; next: investigate AppImage/binary availability
;;; #13419 trae-cn-desktop-bin: NEEDS_RECIPE_DESIGN — ByteDance AI programming IDE (Chinese market); A1: Electron-based IDE; A2: Chinese-only documentation; next: investigate binary release URL
;;; #13415 voiden-beta-appimage: NEEDS_RECIPE_DESIGN — Voiden Beta API Client AppImage; A1: beta software, unstable URLs; A2: AppImage needs FUSE; next: wait for stable release
;;; #13262 jrnlc: NEEDS_RECIPE_DESIGN — C++ terminal journaling tool; A1: requires cmake/make build investigation; A2: no release artifacts found; next: check build system
;;; #13263 whyis-git: NEEDS_RECIPE_DESIGN — Linux troubleshooting utility; A1: unclear build system; A2: -git version may need git-fetch; next: investigate source
;;; #13264 whyis: NEEDS_RECIPE_DESIGN — Linux troubleshooting utility (stable); A1: unclear build system; A2: may overlap with whyis-git; next: investigate source
;;; #13376 mdbook-epub: NEEDS_RECIPE_DESIGN — mdbook EPUB backend in Rust; A1: cargo-build-system with 30+ crate deps; A2: needs mdbook as dep; next: resolve cargo dep tree
;;; #13397 realitlscanner: NEEDS_RECIPE_DESIGN — TLS scanner for Reality protocol; A1: Go project; A2: unclear dep tree; next: investigate Go module deps
;;; #13406 yamlresume: NEEDS_RECIPE_DESIGN — resume-as-code tool with YAML; A1: unclear language/build system; next: investigate upstream
;;; #13409 ww-manager: NEEDS_RECIPE_DESIGN — Wuthering Waves CLI game manager; A1: game-specific tooling; A2: unclear build system; next: investigate
;;; #13417 tuimer: NEEDS_RECIPE_DESIGN — minimal terminal timer in Go; A1: go-build-system; A2: moderate Go dep tree; next: resolve Go modules
;;; #13420 tokount: NEEDS_RECIPE_DESIGN — fast line counter for codebases; A1: Rust project; A2: cargo-build-system needed; next: investigate cargo deps
;;; #13421 tg-config: NEEDS_RECIPE_DESIGN — declarative Telegram config via TOML; A1: Go or Rust project; A2: Telegram path integration; next: investigate build system
;;; #13423 swagsh: NEEDS_RECIPE_DESIGN — small POSIX-compatible shell; A1: C project; A2: may use custom Makefile; next: investigate build
;;; #13427 sitra: NEEDS_RECIPE_DESIGN — font installer utility; A1: unclear language; A2: system font path integration; next: investigate upstream
;;; #13439 properdocs: NEEDS_RECIPE_DESIGN — project documentation with Markdown; A1: unclear language/build; A2: may be Node.js/npm; next: investigate
;;; #13442 pinapp: NEEDS_RECIPE_DESIGN — application shortcut creator; A1: unclear build system; A2: desktop integration; next: investigate
;;; #13448 pardf: NEEDS_RECIPE_DESIGN — PDF editor; A1: unclear upstream (Word-Sys); A2: may be proprietary; next: investigate source availability
;;; #13456 muzak: NEEDS_RECIPE_DESIGN — command-line music compilation suite; A1: unclear language/build; next: investigate upstream
;;; #13475 jit-cli: NEEDS_RECIPE_DESIGN — JIRA issue CLI; A1: likely Go or Node.js; A2: JIRA API integration; next: investigate build system
;;; #13477 incplot: NEEDS_RECIPE_DESIGN — CLI plotting tool; A1: Go project; A2: moderate dep tree; next: investigate Go deps
;;; #13478 hopm: NEEDS_RECIPE_DESIGN — open proxy monitor for IRC; A1: C project with autotools; A2: needs libcurl; next: test gnu-build-system
;;; #13482 gram: NEEDS_RECIPE_DESIGN — code editor; A1: unclear upstream; A2: may need complex GUI deps; next: investigate
;;; #13497 chessament-git: NEEDS_RECIPE_DESIGN — chess tournament manager; A1: unclear language; A2: Swiss-system algorithm; next: investigate build
;;; #13498 bluraybackup: NEEDS_RECIPE_DESIGN — Blu-ray backup tool; A1: C program; A2: requires libbluray + libaacs; next: test with gnu-build-system
;;; #13499 bluray_info-git: NEEDS_RECIPE_DESIGN — Blu-ray utilities suite; A1: C project; A2: requires libbluray; next: test with gnu-build-system
;;; #13502 biscuit-lang: NEEDS_RECIPE_DESIGN — simple programming language; A1: Rust/cargo project; A2: compiler toolchain; next: investigate cargo deps
;;; #13504 audium: NEEDS_RECIPE_DESIGN — terminal music app in Rust; A1: cargo-build-system with audio deps; A2: needs alsa/pulseaudio; next: resolve cargo + audio deps
;;; #13505 atlantik-git: NEEDS_RECIPE_DESIGN — KDE Monopoly client; A1: requires KDE Frameworks (KDE4 era); A2: monopd server; next: check KDE5 porting status
;;; #13491 cvs-feature-bin: NEEDS_RECIPE_DESIGN — CVS version control from Debian; A1: old version control system; A2: .deb extraction needed; next: test binary extraction
;;; #13386 conspy: NEEDS_RECIPE_DESIGN — virtual console remote control; A1: C program with custom Makefile; A2: needs /dev/vcsa access; next: test gnu-build-system
;;; #13385 freecell: NEEDS_RECIPE_DESIGN — ncurses FreeCell solitaire; A1: C/ncurses project; A2: custom build system; next: investigate Makefile
;;; #13381 powerline-fonts-git: NEEDS_RECIPE_DESIGN — patched Powerline fonts collection; A1: font-build-system or copy-build-system; A2: multiple font families; next: create font package from upstream release
;;; #13390 temp-throttle: NEEDS_RECIPE_DESIGN — shell script for CPU thermal throttling; A1: simple bash script; A2: needs sensor access; next: package as trivial-build-system
;;; #13388 maint: NEEDS_RECIPE_DESIGN — system maintenance utility; A1: unclear upstream; A2: may conflict with common name; next: investigate
;;; #13480 gvst-vst-bin: NEEDS_RECIPE_DESIGN — GVST audio plugin suite; A1: proprietary VST plugins; A2: binary-only distribution; next: investigate distribution terms
;;; #13481 grx-bin: NEEDS_RECIPE_DESIGN — Electron-based Gerber renderer; A1: requires system Electron; A2: complex web app; next: investigate binary packaging

(define-module (gaurix packages recipe-resolver-260414t-blocked-notes))
