;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Blocked notes for recipe-resolver-260418s
;;;
;;; This file documents the 12 packages that could not be resolved
;;; after exhausting all viable approaches.

;;; 19. anime-games-launcher-bin
;;; NEEDS_RECIPE_DESIGN_EXHAUSTED: PROPRIETARY_ECOSYSTEM
;;; GPL-3.0 launcher but exists solely to manage proprietary anime games
;;; (Genshin Impact, Honkai Star Rail, etc.)
;;; A1: depends on proprietary game clients at runtime — no standalone value
;;; A2: binary distribution from GitHub — not buildable from source in Guix
;;; A3: game servers require anti-cheat — incompatible with libre OS

;;; 20. armorpaint-git
;;; NEEDS_RECIPE_DESIGN_EXHAUSTED: EXTREME_BUILD_COMPLEXITY
;;; 3D PBR texture painting tool; still in 1.0 alpha
;;; A1: custom build requires Clang 19+ with C23 #embed support (not in Guix)
;;; A2: nodejs + Vulkan + custom asset pipeline
;;; A3: no stable release exists

;;; 21. chess-native
;;; NEEDS_RECIPE_DESIGN_EXHAUSTED: PROPRIETARY_SERVICE_WRAPPER
;;; Tauri wrapper around Chess.com (proprietary service)
;;; A1: no license file in repo — distribution rights unclear
;;; A2: requires cargo + npm Tauri build chain
;;; A3: non-functional without Chess.com account/service

;;; 22. lunarvim-git
;;; NEEDS_RECIPE_DESIGN_EXHAUSTED: RUNTIME_DOWNLOAD
;;; Neovim IDE layer that downloads plugins/LSP servers/treesitter at runtime
;;; A1: fundamentally incompatible with Guix offline/deterministic builds
;;; A2: 30+ runtime-fetched components cannot be pre-packaged
;;; A3: use Guix home + Neovim config instead

;;; 23. iceweasel
;;; NEEDS_RECIPE_DESIGN_EXHAUSTED: EXTREME_BUILD_COMPLEXITY
;;; Parabola's debranded Firefox; full browser build (~30 deps, 6+ hour build)
;;; A1: Guix already has IceCat which serves same debranding purpose
;;; A2: requires Rust + WASM + LLVM + full Chromium-scale build chain
;;; A3: existing IceCat alternative makes this redundant

;;; 24. moomoo
;;; NEEDS_RECIPE_DESIGN_EXHAUSTED: PROPRIETARY_BINARY
;;; Proprietary stock trading platform (Futu/Moomoo)
;;; A1: no source code available
;;; A2: repackaged .deb from futustatic.com
;;; A3: redistribution prohibited by Terms of Service

;;; 25. roxybrowser-bin
;;; NEEDS_RECIPE_DESIGN_EXHAUSTED: PROPRIETARY_BINARY
;;; Proprietary antidetect browser; closed-source commercial software
;;; A1: no source code available
;;; A2: "MIT" license claim in AUR metadata is false
;;; A3: anti-detection purpose raises ethical concerns

;;; 26. electronwmd-bin
;;; NEEDS_RECIPE_DESIGN_EXHAUSTED: ELECTRON_BINARY
;;; MiniDisc NetMD manager distributed as Electron AppImage
;;; A1: source build requires full Electron/npm ecosystem not in Guix
;;; A2: AppImage extraction has FUSE and dynamic linker conflicts
;;; A3: linux-minidisc CLI provides equivalent functionality

;;; 27. biu-tauri-bin
;;; NEEDS_RECIPE_DESIGN_EXHAUSTED: NON_FREE_LICENSE
;;; Bilibili API wrapper distributed as prebuilt Tauri binary
;;; A1: PolyForm Noncommercial license — not free software by FSDG
;;; A2: prebuilt binary only, no source build path
;;; A3: no open-source alternative with same functionality

;;; 28. dare-devil
;;; NEEDS_RECIPE_DESIGN_EXHAUSTED: LOW_QUALITY_SECURITY_RISK
;;; CTF memory game that modifies iptables rules
;;; A1: iptables modification is a security risk in packaging
;;; A2: requires VMware/VirtualBox at runtime
;;; A3: single developer, 1 AUR vote, no stable release

;;; 29. nhaccuatui
;;; NEEDS_RECIPE_DESIGN_EXHAUSTED: PROPRIETARY_BINARY
;;; Vietnamese music streaming app distributed as proprietary AppImage
;;; A1: no source code available
;;; A2: custom "LicenseRef-Nhaccuatui" proprietary license
;;; A3: redistribution prohibited

;;; 30. scx-openrc
;;; NEEDS_RECIPE_DESIGN_EXHAUSTED: WRONG_INIT_SYSTEM
;;; OpenRC init script for sched_ext schedulers
;;; A1: Guix uses Shepherd, not OpenRC — incompatible init system
;;; A2: script is inline in PKGBUILD, no external upstream
;;; A3: write a Guix Shepherd service definition instead if scx-scheds needed
