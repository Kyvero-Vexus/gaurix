;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Blocked notes for recipe-resolver-260425c
;;; Timestamp: 2026-04-25T18:00:00+00:00
;;; 58 packages BLOCKED (42 recipes created from 100 attempted)
;;;

(define-module (gaurix packages recipe-resolver-260425c-blocked-notes)
  #:use-module (guix packages)
  #:use-module (guix gexp)
  #:use-module ((guix licenses) #:prefix license:))

;;; --- TOOLING_FAILURE (14 packages) ---
;;; linux-cachyos-hardened-headers: TOOLING_FAILURE: CachyOS hardened kernel headers; Guix manages kernels through its own kernel package infrastructure, DKMS not supported; next: define custom kernel package
;;; linux-tip-git-headers: TOOLING_FAILURE: bleeding-edge linux-next/tip kernel headers; Guix kernel model does not support external kernel header packages; next: define custom kernel package
;;; linux-covolunablu-gaming-headers: TOOLING_FAILURE: custom gaming kernel headers; Guix manages kernels separately from AUR-style header packages; next: define custom kernel package
;;; base-selinux: TOOLING_FAILURE: Arch Linux SELinux meta-package; SELinux MAC framework not used by Guix System, package is a pacman group alias; next: not applicable to Guix
;;; base-devel-selinux: TOOLING_FAILURE: Arch Linux SELinux development meta-package; same as base-selinux, pacman group alias; next: not applicable to Guix
;;; aquacomputer_d5next-hwmon-dkms: TOOLING_FAILURE: DKMS hwmon kernel module for Aquacomputer watercooling devices; Guix kernel model does not support DKMS; next: would need custom kernel module package
;;; nvidia-open-tinygrad-dkms-git: TOOLING_FAILURE: NVIDIA open kernel modules for tinygrad; DKMS incompatible with Guix kernel model; next: use nonguix channel for NVIDIA support
;;; amneziawg-dkms-git: TOOLING_FAILURE: AmneziaWG VPN DKMS kernel module; Guix kernel model does not support DKMS; next: requires kernel customization approach
;;; linux-cachyos-eevdf-headers: TOOLING_FAILURE: CachyOS EEVDF kernel headers; Guix manages kernels separately; next: define custom kernel package
;;; linux-cachyos-server-headers: TOOLING_FAILURE: CachyOS server kernel headers; Guix manages kernels separately; next: define custom kernel package
;;; aosp-devel: TOOLING_FAILURE: Arch Linux AOSP build dependencies meta-package; pacman group alias for Android dev tools; next: individual tools should be packaged separately
;;; lib32-vkbasalt: TOOLING_FAILURE: 32-bit Vulkan post-processing layer; Guix does not support lib32 multilib architecture; next: not applicable to Guix
;;; coreutils-arch: TOOLING_FAILURE: Arch-specific GNU coreutils `arch` command variant; GNU coreutils already provides arch in Guix; next: not needed, use existing coreutils
;;; vscodium-marketplace: TOOLING_FAILURE: patches VSCodium to enable VS Code marketplace; requires modifying VSCodium product.json internals; next: configure at user level, not packageable generically

;;; --- DEP_RESOLUTION_FAILED (33 packages) ---
;;; pantheon-polkit-agent-git: DEP_RESOLUTION_FAILED: Pantheon desktop Polkit agent; requires complete elementary/Pantheon desktop stack (granite, wingpanel, etc.) not in Guix; next: package Pantheon library stack first
;;; paperde: DEP_RESOLUTION_FAILED: Qt/Wayland desktop environment built on Wayfire compositor; requires Wayfire + wf-config + custom Qt layer stack not in Guix; next: package Wayfire ecosystem first
;;; gearhead2: DEP_RESOLUTION_FAILED: roguelike mecha RPG written in Free Pascal (FPC); requires Free Pascal Compiler and custom SDL bindings; next: package FPC for Guix first
;;; panda3ds: DEP_RESOLUTION_FAILED: HLE 3DS emulator; complex C++ with Vulkan/OpenGL rendering, custom shader compiler, 30+ deps; next: extensive dependency chain needed
;;; luxtorpeda-git: DEP_RESOLUTION_FAILED: Steam Play compatibility tool in Rust; 100+ crate dependencies including Steam API bindings; next: requires vendored crate manifest
;;; python-home-assistant-frontend: DEP_RESOLUTION_FAILED: Home Assistant web frontend; massive Node.js/Webpack build with 500+ npm dependencies; next: not feasible as channel package
;;; rdt-client: DEP_RESOLUTION_FAILED: Real-Debrid torrent client; .NET/C# application requiring .NET SDK and runtime; next: package .NET SDK for Guix
;;; gvfs-smb-git: DEP_RESOLUTION_FAILED: GVFS SMB backend; requires full GVFS build infrastructure with Samba/CIFS integration and GIO stack; next: complex GNOME infrastructure build
;;; edgeimpulse-cli: DEP_RESOLUTION_FAILED: Edge Impulse Node.js CLI tools; npm dependency tree with native node modules; next: package npm dependencies individually
;;; swscreenshot-gui: DEP_RESOLUTION_FAILED: Sway screenshot GUI; requires SwayWM-specific IPC libraries and grim/slurp toolchain; next: package sway tooling stack
;;; shig-git: DEP_RESOLUTION_FAILED: SSH file signing CLI in Go; 30+ Go module dependencies including SSH agent bindings; next: requires go module vendoring
;;; scans2any-git: DEP_RESOLUTION_FAILED: scan converter in Rust; requires Typst rendering + 40+ Rust crate deps; next: requires vendored crate manifest
;;; openexr-viewer: DEP_RESOLUTION_FAILED: OpenEXR file viewer; Qt6 + OpenEXR + custom OpenGL rendering; deep dependency chain; next: ensure Qt6 + OpenEXR dev stack available
;;; nyarchassistant: DEP_RESOLUTION_FAILED: AI assistant fork (Newelle); Python + GTK4 + libadwaita + multiple AI backends (Ollama, GPT); next: complex Python/GTK4 app with unstable deps
;;; mailnaggertray-git: DEP_RESOLUTION_FAILED: tray icon for mailnagger; requires mailnagger + GTK3 + libappindicator; next: package mailnagger first
;;; illogical-impulse-pymyc-aur: DEP_RESOLUTION_FAILED: meta-package for PyMYC dependencies for Illogical Impulse desktop; requires custom Python modules not in Guix; next: package PyMYC ecosystem
;;; go2tv: DEP_RESOLUTION_FAILED: Go DLNA/UPnP media streaming tool; 40+ Go module dependencies; next: requires go module vendoring
;;; gdx-liftoff: DEP_RESOLUTION_FAILED: LibGDX project generator; Java/Gradle application with deep Java dependency tree; next: package LibGDX stack
;;; fido2-hid-bridge: DEP_RESOLUTION_FAILED: FIDO2 HID bridge tool; requires custom HID device access libraries and FIDO2 protocol implementation; next: package FIDO2 library stack
;;; beet-summarize-git: DEP_RESOLUTION_FAILED: beets music manager plugin; requires beets + specific Python metadata libraries; next: ensure beets and dependencies available
;;; lincity-ng-git: DEP_RESOLUTION_FAILED: city simulation game; requires SDL2_mixer + SDL2_image + PhysFS + libxml2 + custom GUI; next: complex game dependency chain
;;; frame-eth: DEP_RESOLUTION_FAILED: Web3/Ethereum wallet (Electron); massive npm dependency tree + native crypto modules; next: not feasible as channel package
;;; principia-git: DEP_RESOLUTION_FAILED: physics sandbox game; C++ with Box2D + SDL2 + OpenGL + custom engine; 20+ deps; next: package custom physics engine deps
;;; electrum-personal-server-git: DEP_RESOLUTION_FAILED: Electrum Bitcoin personal server; Python with bitcoin-specific crypto libraries (python-bitcointx, etc.) not in Guix; next: package bitcoin Python stack
;;; glsmac-git: DEP_RESOLUTION_FAILED: Alpha Centauri reimplementation; C++ with SDL2 + OpenGL + custom scripting engine; next: complex game engine dependency chain
;;; gradience: DEP_RESOLUTION_FAILED: Adwaita theme editor; Python + GTK4 + libadwaita + sassc + Blueprint compiler; next: package Blueprint compiler for Guix
;;; fancy-cat: DEP_RESOLUTION_FAILED: terminal PDF reader in Zig; requires Zig compiler + Kitty image protocol support; next: package Zig toolchain for Guix
;;; snowflake-pt-server: DEP_RESOLUTION_FAILED: Tor pluggable transport (Snowflake server) in Go; 50+ Go module deps including pion/WebRTC; next: requires go module vendoring
;;; vgmstream-git: DEP_RESOLUTION_FAILED: video game audio decoding library; C with 20+ codec dependencies (vorbis, ATRAC, ADX, etc.); next: complex codec dependency chain
;;; shijima-qt: DEP_RESOLUTION_FAILED: desktop pet application; Qt6 + custom animation framework + platform-specific integration; next: deep Qt6 dependency chain
;;; arti-git: DEP_RESOLUTION_FAILED: Tor implementation in Rust; 200+ crate dependencies including crypto and networking; next: requires vendored crate manifest
;;; librum: DEP_RESOLUTION_FAILED: modern e-book reader; Qt6 + custom PDF/EPUB rendering + cloud sync; 30+ deps; next: package Qt6 PDF module and cloud API
;;; pcem-git: DEP_RESOLUTION_FAILED: IBM PC emulator; C with SDL2 + OpenAL + custom hardware emulation; 15+ specific deps; next: complex emulator dependency chain

;;; --- TOOLING_FAILURE (additional, 4 packages) ---
;;; archwiki-offline: TOOLING_FAILURE: Arch-specific wiki scraper/viewer; relies on Arch Wiki structure and pacman-based paths; next: not applicable outside Arch Linux
;;; devtools-git: TOOLING_FAILURE: Arch Linux package maintainer tools (makepkg, etc.); relies on pacman and Arch build infrastructure; next: not applicable to Guix
;;; sddm-idle: TOOLING_FAILURE: SDDM display manager variant; display managers require deep system integration with Guix's login service model; next: configure via Guix system services
;;; neovim-lspconfig-opt-git: TOOLING_FAILURE: Neovim LSP config as optional pacman package; neovim plugins should be managed via Neovim's built-in plugin system or home-manager; next: install via Neovim plugin manager

;;; --- SOURCE_UNAVAILABLE (3 packages) ---
;;; plugin-autenticacao-gov-pt: SOURCE_UNAVAILABLE: Portuguese government authentication plugin; official source at autenticacao.gov.pt requires accepting EULA and download is session-gated; next: no stable direct download URL available
;;; madness-interactive-reloaded: SOURCE_UNAVAILABLE: Madness Combat fan game; distributed via itch.io with no direct download URL; requires browser-based purchase/download; next: no stable source URI
;;; ausweiskopie: SOURCE_UNAVAILABLE: German ID document copy tool; no public repository or stable download URL found; next: locate upstream source

;;; --- DEP_RESOLUTION_FAILED (additional, 4 packages) ---
;;; nemo-engrampa: DEP_RESOLUTION_FAILED: Nemo file manager plugin for Engrampa archive manager; requires Nemo extension API + Engrampa integration + Cinnamon desktop stack; next: package Cinnamon/Nemo stack first
;;; tilp-xdg: DEP_RESOLUTION_FAILED: TI calculator link program with XDG support; requires libticalcs2 + libticables2 + libtifiles2 + libticonv; next: package TI calculator library stack
;;; virtualbox-bin-sdk: DEP_RESOLUTION_FAILED: VirtualBox SDK for building extensions; requires matching VirtualBox installation and Oracle SDK headers; next: package VirtualBox binary first
;;; libcurl-gnutls-git: DEP_RESOLUTION_FAILED: libcurl variant linked against GnuTLS without versioned symbols; requires building curl from source with specific GnuTLS flags; next: create curl package variant

;;; --- LICENSE_REVIEW_NEEDED (0 packages) ---
;;; (none)

;;; end of blocked notes
