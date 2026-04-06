(define-module (gaurix packages queue-20260406-nrd30g-blocked-notes))

;;; Blocked notes for queue-20260406-nrd30g batch.
;;; 64 packages attempted; all re-blocked with NEEDS_RECIPE_DESIGN.
;;;
;;; grafana-bin: NEEDS_RECIPE_DESIGN — binary monitoring platform, needs
;;;   download URL templating for versioned Linux amd64 tarball + systemd
;;;   service integration; next: draft copy-build-system recipe with
;;;   grafana.com release URL.
;;;
;;; bluetuith-bin: NEEDS_RECIPE_DESIGN — Go-based Bluetooth TUI binary,
;;;   GitHub releases available; next: draft copy-build-system from GitHub
;;;   release tarball.
;;;
;;; fortitude-bin: NEEDS_RECIPE_DESIGN — Python linter for Fortran, binary
;;;   release from GitHub; next: draft copy-build-system recipe.
;;;
;;; tget-bin: NEEDS_RECIPE_DESIGN — torrent file getter binary; next: locate
;;;   stable upstream release URL and draft recipe.
;;;
;;; cloudflarewarpspeedtest-bin: NEEDS_RECIPE_DESIGN — Cloudflare WARP speed
;;;   test binary; next: locate upstream binary release and draft recipe.
;;;
;;; autosubsync-bin: NEEDS_RECIPE_DESIGN — subtitle auto-sync binary tool;
;;;   next: locate upstream release and draft copy-build-system recipe.
;;;
;;; jubler-bin: NEEDS_RECIPE_DESIGN — Java-based subtitle editor; needs JRE
;;;   runtime wrapper; next: draft recipe with java-build-system or
;;;   copy-build-system + JRE wrapper.
;;;
;;; xdman-beta-bin: NEEDS_RECIPE_DESIGN — Xtreme Download Manager (Java/
;;;   Electron); next: draft binary recipe from GitHub releases.
;;;
;;; steam-rom-manager-bin: NEEDS_RECIPE_DESIGN — Electron-based ROM manager
;;;   AppImage; next: draft copy-build-system from GitHub AppImage release.
;;;
;;; yuki-iptv-bin: NEEDS_RECIPE_DESIGN — IPTV player binary; next: locate
;;;   upstream release and draft recipe.
;;;
;;; cecil-bin: NEEDS_RECIPE_DESIGN — .NET assembly inspection tool; needs
;;;   .NET runtime; next: draft binary recipe.
;;;
;;; iptvnator-electron-bin: NEEDS_RECIPE_DESIGN — Electron IPTV app; next:
;;;   draft from GitHub AppImage/deb release.
;;;
;;; nvm-desktop-bin: NEEDS_RECIPE_DESIGN — Node Version Manager desktop GUI;
;;;   next: locate stable release and draft recipe.
;;;
;;; chromium-snapshot-bin: NEEDS_RECIPE_DESIGN — Chromium snapshot binary;
;;;   SOURCE_UNAVAILABLE concern (snapshot URLs are ephemeral); next: evaluate
;;;   whether a stable snapshot URL exists.
;;;
;;; onthespot-appimage: NEEDS_RECIPE_DESIGN — Spotify downloader AppImage;
;;;   next: draft copy-build-system from GitHub AppImage release.
;;;
;;; xenia-canary-bin: NEEDS_RECIPE_DESIGN — Xbox 360 emulator binary (Windows
;;;   only upstream); next: verify Linux binary availability.
;;;
;;; mihomo-party-electron-bin: NEEDS_RECIPE_DESIGN — Electron proxy client;
;;;   next: draft from GitHub release deb/AppImage.
;;;
;;; exiled-exchange-2-bin: NEEDS_RECIPE_DESIGN — Path of Exile trade tool;
;;;   next: locate upstream release and draft recipe.
;;;
;;; inkscape-open-symbols-git: NEEDS_RECIPE_DESIGN — Inkscape symbol library
;;;   extension; needs inkscape as dep; next: draft copy-build-system to
;;;   install SVG files to inkscape share dir.
;;;
;;; flameshot-imgur: NEEDS_RECIPE_DESIGN — Flameshot plugin for Imgur upload;
;;;   next: investigate if this is a separate package or flameshot config.
;;;
;;; firefox-nightly: NEEDS_RECIPE_DESIGN — Firefox nightly binary build;
;;;   SOURCE_UNAVAILABLE concern (nightly URLs rotate daily); next: evaluate
;;;   stable nightly archive URL pattern.
;;;
;;; firefox-gnome-theme: NEEDS_RECIPE_DESIGN — Firefox GNOME theme (CSS
;;;   userChrome); next: draft copy-build-system from GitHub source.
;;;
;;; gedit-dark-variant: NEEDS_RECIPE_DESIGN — gedit color scheme plugin;
;;;   next: draft copy-build-system to install to gedit styles dir.
;;;
;;; gedit-duplicate-line: NEEDS_RECIPE_DESIGN — gedit plugin for duplicating
;;;   lines; next: draft copy-build-system or meson recipe.
;;;
;;; gedit-panel-toggler: NEEDS_RECIPE_DESIGN — gedit panel toggle plugin;
;;;   next: draft copy-build-system recipe.
;;;
;;; gedit-cut-line: NEEDS_RECIPE_DESIGN — gedit cut-line plugin; next: draft
;;;   copy-build-system recipe.
;;;
;;; gedit-scroll-past: NEEDS_RECIPE_DESIGN — gedit scroll-past-end plugin;
;;;   next: draft copy-build-system recipe.
;;;
;;; gedit-smart-home: NEEDS_RECIPE_DESIGN — gedit smart-home plugin; next:
;;;   draft copy-build-system recipe.
;;;
;;; aria2p: NEEDS_RECIPE_DESIGN — Python CLI/library for aria2 RPC; next:
;;;   draft pyproject-build-system recipe from PyPI.
;;;
;;; bash-pipes: NEEDS_RECIPE_DESIGN — animated terminal pipes script; next:
;;;   draft copy-build-system from GitHub source.
;;;
;;; ludusavi: NEEDS_RECIPE_DESIGN — Rust game save backup tool; next: draft
;;;   cargo-build-system recipe from crates.io/GitHub.
;;;
;;; superhtml: NEEDS_RECIPE_DESIGN — HTML template engine in Zig; next: draft
;;;   recipe (Zig build system not well-supported in Guix yet).
;;;
;;; touche: NEEDS_RECIPE_DESIGN — touchscreen gesture manager (Python/GTK);
;;;   next: draft meson-build-system recipe from GitHub.
;;;
;;; wavetracker: NEEDS_RECIPE_DESIGN — chiptune music tracker; next: locate
;;;   upstream source and draft recipe.
;;;
;;; redeclipse: NEEDS_RECIPE_DESIGN — FPS game with parkour; next: draft
;;;   cmake-build-system recipe from GitHub source.
;;;
;;; vbam-sdl: NEEDS_RECIPE_DESIGN — VisualBoyAdvance-M SDL frontend; next:
;;;   draft cmake-build-system recipe from GitHub.
;;;
;;; vbam-wx: NEEDS_RECIPE_DESIGN — VisualBoyAdvance-M wxWidgets frontend;
;;;   next: draft cmake-build-system recipe from GitHub.
;;;
;;; keepass-diff: NEEDS_RECIPE_DESIGN — Rust tool for diffing KeePass files;
;;;   next: draft cargo-build-system recipe.
;;;
;;; xcaddy: NEEDS_RECIPE_DESIGN — Go tool for building Caddy with plugins;
;;;   next: draft go-build-system recipe from GitHub.
;;;
;;; ttop: NEEDS_RECIPE_DESIGN — Nim-based system monitor; Nim build system
;;;   not in Guix; next: evaluate nimble/copy-build-system approach.
;;;
;;; dunk: NEEDS_RECIPE_DESIGN — Go-based prettier git diff viewer; next:
;;;   draft go-build-system recipe from GitHub.
;;;
;;; sendme: NEEDS_RECIPE_DESIGN — Rust file transfer tool; next: draft
;;;   cargo-build-system recipe.
;;;
;;; sttr: NEEDS_RECIPE_DESIGN — Go string transformation CLI; next: draft
;;;   go-build-system recipe from GitHub.
;;;
;;; tanglet: NEEDS_RECIPE_DESIGN — word-finding game (Qt/C++); next: draft
;;;   cmake-build-system recipe.
;;;
;;; connectagram: NEEDS_RECIPE_DESIGN — word unscrambling game (Qt/C++);
;;;   next: draft cmake-build-system recipe.
;;;
;;; way-displays: NEEDS_RECIPE_DESIGN — auto display config for Wayland
;;;   (C/meson); next: draft meson-build-system recipe from GitHub.
;;;
;;; argc: NEEDS_RECIPE_DESIGN — Rust CLI argument parser/runner; next: draft
;;;   cargo-build-system recipe.
;;;
;;; fotema: NEEDS_RECIPE_DESIGN — Rust/GTK photo manager; next: draft
;;;   meson-build-system recipe (complex deps).
;;;
;;; qmplay2: NEEDS_RECIPE_DESIGN — Qt media player (C++/CMake); next: draft
;;;   cmake-build-system recipe with Qt/FFmpeg deps.
;;;
;;; sleep-inhibitor: NEEDS_RECIPE_DESIGN — D-Bus sleep inhibitor; next:
;;;   locate upstream and draft recipe.
;;;
;;; dmarc-cat: NEEDS_RECIPE_DESIGN — Go DMARC report parser; next: draft
;;;   go-build-system recipe.
;;;
;;; pass-audit: NEEDS_RECIPE_DESIGN — password-store audit extension; needs
;;;   pass as dep; next: draft gnu-build-system recipe from GitHub.
;;;
;;; pass-file: NEEDS_RECIPE_DESIGN — password-store file attachment
;;;   extension; next: draft gnu-build-system recipe from GitHub.
;;;
;;; materia-transparent-gtk-theme-git: NEEDS_RECIPE_DESIGN — transparent
;;;   variant of Materia GTK theme; next: draft meson-build-system recipe.
;;;
;;; nordic-wallpapers: NEEDS_RECIPE_DESIGN — Nord-themed wallpaper pack;
;;;   next: draft copy-build-system from GitHub.
;;;
;;; seclists: NEEDS_RECIPE_DESIGN — security testing wordlists collection;
;;;   next: draft copy-build-system from GitHub release.
;;;
;;; quantum-espresso: NEEDS_RECIPE_DESIGN — quantum chemistry/physics
;;;   simulation suite (Fortran/C/MPI); complex build; next: draft
;;;   cmake-build-system recipe with MPI/BLAS deps.
;;;
;;; steamguard-cli: NEEDS_RECIPE_DESIGN — Rust Steam 2FA CLI; next: draft
;;;   cargo-build-system recipe.
;;;
;;; gnome-shell-extension-tophat: NEEDS_RECIPE_DESIGN — GNOME system monitor
;;;   extension; next: draft copy-build-system to install to gnome-shell
;;;   extensions dir.
;;;
;;; gnome-shell-extension-ddterm-git: NEEDS_RECIPE_DESIGN — GNOME drop-down
;;;   terminal extension; next: draft meson-build-system or copy recipe.
;;;
;;; gnome-shell-extension-tray-icons-reloaded: NEEDS_RECIPE_DESIGN — GNOME
;;;   tray icons extension; next: draft copy-build-system recipe.
;;;
;;; gnome-shell-extension-windowisready_remover-git: NEEDS_RECIPE_DESIGN —
;;;   GNOME extension to remove "window is ready" notification; next: draft
;;;   copy-build-system recipe.
;;;
;;; adg-gtk-theme: NEEDS_RECIPE_DESIGN — Adwaita-derived GTK theme; next:
;;;   draft meson-build-system recipe from GitHub.
;;;
;;; openxray-git: NEEDS_RECIPE_DESIGN — Open-source X-Ray Engine (S.T.A.L.K.E.R.)
;;;   reimplementation (C++/CMake); complex build with many game-engine deps;
;;;   next: draft cmake-build-system recipe from GitHub.
