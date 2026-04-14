;;; Blocked notes for recipe-resolver-260414q
;;; 25 packages blocked with reason codes

;;; #13254 awakened-poe-trade-git
;;;   BLOCKED: DEP_RESOLUTION_FAILED — Electron app with native Node modules + Overwolf overlay API; A1: requires electron-builder + node-gyp chain; next: package Electron build toolchain

;;; #13259 aurman
;;;   BLOCKED: NEEDS_RECIPE_DESIGN — AUR helper requiring pacman/libalpm runtime; A1: libalpm not in Guix; A2: makepkg dependency; next: port libalpm or redesign as standalone

;;; #13269 customizepkg-git
;;;   BLOCKED: NEEDS_RECIPE_DESIGN — Arch-specific PKGBUILD modifier requiring pacman makepkg infrastructure; A1: uses pacman hooks; next: not portable to non-Arch

;;; #13266 wf-shell
;;;   BLOCKED: DEP_RESOLUTION_FAILED — GTK3 panel for Wayfire compositor; A1: requires wf-config and wayfire-dev headers not in Guix; next: package wayfire first

;;; #13288 reboot-arch-btw
;;;   BLOCKED: NEEDS_RECIPE_DESIGN — Arch-specific kernel update checker using pacman database; A1: reads /var/lib/pacman; A2: uname comparison logic is distro-specific; next: not portable

;;; #13291 dms-shell-git
;;;   BLOCKED: DEP_RESOLUTION_FAILED — Desktop shell requiring Quickshell framework (Qt6 QML compositor); A1: quickshell not in Guix; A2: Hyprland IPC dep; next: package quickshell first

;;; #13304 organicmaps
;;;   BLOCKED: NEEDS_RECIPE_DESIGN — Massive C++/Qt mobile mapping app with 100+ native deps; A1: custom build system with submodules; A2: Android/iOS/Desktop targets; next: isolate desktop cmake build

;;; #13305 penpot
;;;   BLOCKED: NEEDS_RECIPE_DESIGN — Clojure multi-service design tool (backend+frontend+exporter); A1: requires Leiningen/shadow-cljs/Docker compose; next: split into buildable components

;;; #13306 penpot-exporter
;;;   BLOCKED: NEEDS_RECIPE_DESIGN — Penpot SVG/PDF exporter service; A1: requires running Penpot backend + Clojure deps; next: needs penpot packaging first

;;; #13307 penpot-frontend
;;;   BLOCKED: NEEDS_RECIPE_DESIGN — Penpot ClojureScript SPA; A1: requires shadow-cljs + npm + 200+ JS deps; A2: complex asset pipeline; next: needs ClojureScript build support

;;; #13313 pane-fm-git
;;;   BLOCKED: DEP_RESOLUTION_FAILED — Tauri/Svelte file manager; A1: requires tauri-cli + webkit2gtk Rust bindings + npm; A2: Tauri build chain not in Guix; next: package Tauri SDK

;;; #13314 collabora-office
;;;   BLOCKED: NEEDS_RECIPE_DESIGN — Massive LibreOffice fork with Collabora Online integration; A1: requires full LibreOffice build tree; A2: Qt6 UI layer; next: rebase on Guix libreoffice package

;;; #13316 rust-aarch64-musl-git
;;;   BLOCKED: NEEDS_RECIPE_DESIGN — Rust cross-compilation target for aarch64-musl; A1: requires custom Rust bootstrap with target triple; A2: musl-cross-make dep; next: extend Guix rust-toolchain

;;; #13317 rust-aarch64-gnu-git
;;;   BLOCKED: NEEDS_RECIPE_DESIGN — Rust cross-compilation target for aarch64-gnu; A1: requires cross-compiler toolchain; A2: glibc-cross dep; next: extend Guix rust cross-compilation support

;;; #13318 lib32-rust-libs-git
;;;   BLOCKED: NEEDS_RECIPE_DESIGN — Rust 32-bit multilib libraries; A1: requires i686 target toolchain; A2: multilib infrastructure not in Guix; next: design multilib approach

;;; #13321 python-pyqt5-chart
;;;   BLOCKED: DEP_RESOLUTION_FAILED — Python bindings for Qt Charts; A1: requires Qt Charts commercial module; A2: PyQt5 SIP build tools; next: package qtcharts and sip-build

;;; #13328 sulis-git
;;;   BLOCKED: NEEDS_RECIPE_DESIGN — Complex Rust tactical RPG with custom 2D engine; A1: 50+ crate deps with C bindings; A2: OpenGL + SDL2 + image assets; next: resolve cargo dependency tree

;;; #13329 optimus-manager-git
;;;   BLOCKED: NEEDS_RECIPE_DESIGN — Nvidia Optimus GPU switching manager; A1: requires bbswitch DKMS kernel module; A2: X.org/Wayland GPU config; next: needs linux-module-build-system

;;; #13332 plasma6-applets-fokus
;;;   BLOCKED: DEP_RESOLUTION_FAILED — KDE Plasma 6 pomodoro applet; A1: requires Plasma 6 framework (plasma-framework6) not fully in Guix; A2: QML runtime; next: complete Plasma 6 packaging

;;; #13341 pacman-cleanup-hook
;;;   BLOCKED: NEEDS_RECIPE_DESIGN — Pacman post-transaction cleanup hook; A1: requires libalpm hook infrastructure; A2: paccache dependency; next: not portable to non-pacman systems

;;; #13343 qbittorrent-enhanced-ua-nox
;;;   BLOCKED: NEEDS_RECIPE_DESIGN — qBittorrent Enhanced fork (headless); A1: requires custom libtorrent-rasterbar fork; A2: Qt6 cmake build with 30+ deps; next: package libtorrent-rasterbar-enhanced

;;; #13344 qbittorrent-enhanced-ua
;;;   BLOCKED: NEEDS_RECIPE_DESIGN — qBittorrent Enhanced fork (GUI); A1: requires custom libtorrent-rasterbar fork; A2: Qt6 widgets + cmake; next: same blocker as nox variant

;;; #13345 invidious
;;;   BLOCKED: DEP_RESOLUTION_FAILED — Alternative YouTube frontend written in Crystal; A1: Crystal compiler not in Guix; A2: shards package manager; next: package Crystal compiler first

;;; #13355 openrefine
;;;   BLOCKED: NEEDS_RECIPE_DESIGN — Complex Java webapp with Maven build; A1: 200+ Maven deps; A2: embedded Jetty server; next: design Maven-to-Guix dep resolution

;;; #13361 qt5-purchasing
;;;   BLOCKED: NEEDS_RECIPE_DESIGN — Qt In-App Purchasing proprietary module; A1: requires Qt5 build infrastructure + qmake; A2: module removed from open-source Qt; next: verify OSS availability

