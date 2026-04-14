;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Blocked notes for recipe-resolver-260413ag
;;; 10 packages re-blocked with NEEDS_RECIPE_DESIGN_EXHAUSTED
;;;

;;; ── shelly-bin (#7350) ──
;;; BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — ARCH_SPECIFIC: Arch Linux
;;; package manager GUI (Shelly-ALPM); depends on pacman and libalpm
;;; (Arch-only package management ecosystem).
;;; A1: package as-is — requires pacman/libalpm which are Arch-specific
;;; A2: strip Arch deps — removes all functionality (it IS a pacman frontend)
;;; A3: no portable upstream — tool only works with Arch package management

;;; ── archium (#7301) ──
;;; BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — ARCH_SPECIFIC: Arch Linux
;;; package management helper (keircn/archium); wraps pacman commands.
;;; A1: package as-is — depends on pacman ecosystem
;;; A2: adapt for Guix — would require complete rewrite
;;; A3: no upstream interest in multi-distro support

;;; ── wlr-which-key (#8384) ──
;;; BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — CARGO_DEPS_NEEDED: Rust/Cargo
;;; keymap manager for wlroots compositors (MaxVerevkin/wlr-which-key,
;;; GPL-3.0); needs full cargo dependency enumeration.
;;; A1: cargo-build-system — needs 30+ crates (cairo-rs, pangocairo,
;;;     xkbcommon, calloop, wayland-client + transitive deps)
;;; A2: no pre-built binary releases on GitHub
;;; A3: not on crates.io for guix import crate

;;; ── ytdlp-gui (#8376) ──
;;; BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — CARGO_DEPS_NEEDED: Rust GUI
;;; for yt-dlp (BKSalman/ytdlp-gui, GPL-3.0); Iced GUI framework requires
;;; extensive crate dependency tree.
;;; A1: cargo-build-system — Iced framework alone pulls 100+ crates
;;; A2: no pre-built binary releases on GitHub
;;; A3: guix import crate — generates incomplete results for Iced apps

;;; ── tmplayer (#7353) ──
;;; BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — CARGO_DEPS_NEEDED: Rust
;;; terminal music player (professor-lee/TMPlayer, AGPL-3); dual Rust+CMake
;;; build with heavy audio dependency tree.
;;; A1: cargo-build-system — needs 50+ crates (rodio, symphonia, cpal, etc.)
;;; A2: no pre-built binary releases on GitHub
;;; A3: CMake component needs manual integration with cargo build

;;; ── mytimer (#7309) ──
;;; BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — PYTHON_DEPS_NEEDED: Python
;;; terminal timer (sepandhaghighi/mytimer, MIT); missing 3 Python deps
;;; not in Guix.
;;; A1: pyproject-build-system — needs python-nava (audio beep library),
;;;     python-art (ASCII art library), python-jdatetime (Jalali dates)
;;; A2: package deps first — python-nava has audio backend complexity
;;;     (platform-specific audio playback); python-art is feasible but
;;;     low priority; python-jdatetime depends on khayyam lib
;;; A3: patch out deps — removing audio/art/calendar features guts the tool

;;; ── git-wizard (#7384) ──
;;; BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — PYTHON_DEPS_NEEDED: Python
;;; Git automation CLI (noufalkdlr/git-wizard, GPL-3.0); missing Python
;;; deps not in Guix.
;;; A1: pyproject-build-system — needs python-inquirer (interactive prompts)
;;;     and python-annotated-doc (annotation framework)
;;; A2: package python-inquirer — depends on python-blessed + python-readchar
;;;     chain (3+ transitive deps not in Guix)
;;; A3: use alternatives — similar functionality available via git-init +
;;;     gh CLI which are already in Guix

;;; ── razercommander (#8389) ──
;;; BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — PYTHON_OPENRAZER_NEEDED:
;;; Razer device manager GUI (gabmus/razercommander, GPL-3.0); requires
;;; python-openrazer which is a complex DKMS + D-Bus driver stack.
;;; A1: meson-build-system + python — needs python-openrazer (hardware driver
;;;     with DKMS kernel module component)
;;; A2: package openrazer-daemon only — still needs dkms integration
;;; A3: mock openrazer — breaks all device communication

;;; ── vswaybar-studio (#7360) ──
;;; BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — WEBKIT_COMPLEX: Waybar
;;; visual config editor (victorsosaMx/vsWaybar-Studio, MIT); depends on
;;; webkit2gtk-4.1 which is extremely heavy.
;;; A1: python-build-system — needs webkit2gtk-4.1 (full browser engine,
;;;     100+ deps, hours-long build)
;;; A2: strip WebKit dep — app uses WebKit for live preview rendering,
;;;     removing it destroys core functionality
;;; A3: use alternative — waybar configs can be edited with any text editor

;;; ── blivet-gui (#8385) ──
;;; BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — PYTHON_BLIVET_NEEDED:
;;; GUI storage configuration tool (storaged-project/blivet-gui, GPL-2.0+);
;;; requires python-blivet which is a complex storage management library.
;;; A1: python-build-system — needs python-blivet (Red Hat's storage library
;;;     with LVM, LUKS, Btrfs support + 10 deps not in Guix)
;;; A2: package python-blivet — depends on libblockdev, python-bytesize,
;;;     python-pykickstart (20+ transitive deps)
;;; A3: use alternatives — Guix has LUKS/LVM via guix system config
