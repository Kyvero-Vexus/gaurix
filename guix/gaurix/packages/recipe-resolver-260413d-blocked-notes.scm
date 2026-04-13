;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Blocked notes for recipe-resolver-260413d
;;; 33 packages evaluated with concrete blocking reasons.
;;; Each entry documents the primary blocker and next action.

(define-module (gaurix packages recipe-resolver-260413d-blocked-notes))

;;; ── fresh-editor (#11709) ────────────────────────────
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260413d
;;; Upstream: https://sinelaw.github.io/fresh/
;;; Description: A lightweight, fast terminal-based text editor with LSP support and TypeScript plugins
;;; License: GPL-2.0-only
;;; Blocker: Electron app (TypeScript/Node), requires npm/pnpm build chain not available in Guix; next: investigate node-build-system feasibility
;;; Approaches considered:
;;;   A1: npm/node-build-system — npm dep resolution too complex
;;;   A2: Prebuilt binary (AppImage/deb) — may work with copy-build-system
;;;   A3: Upstream binary release — evaluate if stable release exists
;;; Next: investigate node-build-system feasibility

;;; ── sonic-desktop-interface (#11711) ─────────────────
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260413d
;;; Upstream: https://github.com/Sonic-DE/sonic-desktop-interface
;;; Description: Sonic Desktop Interface
;;; License: LGPL-2.0-or-later
;;; Blocker: custom desktop environment with Budgie/GTK integration, heavy dep tree (mate-polkit, budgie-desktop); next: enumerate Guix-available deps
;;; Approaches considered:
;;;   A1: Package missing deps first — significant work required
;;;   A2: Vendor deps — increases maintenance burden
;;;   A3: Binary release — evaluate if prebuilt binary exists
;;; Next: enumerate Guix-available deps

;;; ── feishin (#11722) ─────────────────────────────────
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260413d
;;; Upstream: https://github.com/jeffvli/feishin
;;; Description: A modern self-hosted music player.
;;; License: GPL-3.0-only
;;; Blocker: Electron app (React/pnpm), complex npm build chain; next: evaluate AppImage or prebuilt .deb approach
;;; Approaches considered:
;;;   A1: npm/node-build-system — npm dep resolution too complex
;;;   A2: Prebuilt binary (AppImage/deb) — may work with copy-build-system
;;;   A3: Upstream binary release — evaluate if stable release exists
;;; Next: evaluate AppImage or prebuilt .deb approach

;;; ── slack-electron (#11724) ──────────────────────────
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260413d
;;; Upstream: https://slack.com/downloads/linux
;;; Description: Slack Desktop (Beta) for Linux, using the system Electron package
;;; License: LicenseRef-SlackProprietary
;;; Blocker: requires patching Slack proprietary .deb to use system Electron, complex desktop integration; next: try copy-build-system with .deb extraction
;;; Approaches considered:
;;;   A1: npm/node-build-system — npm dep resolution too complex
;;;   A2: Prebuilt binary (AppImage/deb) — may work with copy-build-system
;;;   A3: Upstream binary release — evaluate if stable release exists
;;; Next: try copy-build-system with .deb extraction

;;; ── wechat-universal-bwrap (#11725) ──────────────────
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260413d
;;; Upstream: https://linux.weixin.qq.com/
;;; Description: WeChat (Universal) with bwrap sandbox
;;; License: LicenseRef-wechat-license
;;; Blocker: WeChat proprietary binary with bwrap sandboxing, needs custom wrapper scripts and Xwayland setup; next: study bwrap packaging patterns
;;; Approaches considered:
;;;   A1: Standard build — blocked by complexity described above
;;;   A2: Simplified build — may lose functionality
;;;   A3: Prebuilt/binary — evaluate upstream releases
;;; Next: study bwrap packaging patterns

;;; ── krokiet (#11728) ─────────────────────────────────
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260413d
;;; Upstream: https://github.com/qarmin/czkawka
;;; Description: Multi functional app to find duplicates, empty folders, similar images etc. (Desktop App, Slint frontend)
;;; License: LicenseRef-MIT AND GPL-3.0-only AND CC-BY-4.0
;;; Blocker: Rust + Slint UI framework, Slint crate not packaged in Guix; next: package slint crate first
;;; Approaches considered:
;;;   A1: Package missing deps first — significant work required
;;;   A2: Vendor deps — increases maintenance burden
;;;   A3: Binary release — evaluate if prebuilt binary exists
;;; Next: package slint crate first

;;; ── seerr (#11731) ───────────────────────────────────
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260413d
;;; Upstream: https://github.com/seerr-team/seerr
;;; Description: Request management and media discovery tool for the Plex ecosystem
;;; License: MIT
;;; Blocker: Node.js/TypeScript web app (Next.js), massive npm dep tree; next: evaluate Docker-based or prebuilt approach
;;; Approaches considered:
;;;   A1: npm/node-build-system — npm dep resolution too complex
;;;   A2: Prebuilt binary (AppImage/deb) — may work with copy-build-system
;;;   A3: Upstream binary release — evaluate if stable release exists
;;; Next: evaluate Docker-based or prebuilt approach

;;; ── modrinth-app (#11733) ────────────────────────────
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260413d
;;; Upstream: https://modrinth.com/app
;;; Description: An unique, open source launcher that allows you to play your favorite mods, and keep them up to date, all in one neat little package.
;;; License: GPL-3.0-only
;;; Blocker: Tauri app (Rust+JS), pnpm frontend build + Cargo backend, complex dual build chain; next: evaluate prebuilt .deb approach
;;; Approaches considered:
;;;   A1: npm/node-build-system — npm dep resolution too complex
;;;   A2: Prebuilt binary (AppImage/deb) — may work with copy-build-system
;;;   A3: Upstream binary release — evaluate if stable release exists
;;; Next: evaluate prebuilt .deb approach

;;; ── whisper.cpp-hip (#11739) ─────────────────────────
;;; Status: BLOCKED: DEP_RESOLUTION_FAILED re-evaluated in recipe-resolver-260413d
;;; Upstream: https://github.com/ggerganov/whisper.cpp
;;; Description: Port of OpenAI's Whisper model in C/C++ (using system llama.cpp-hip)
;;; License: MIT
;;; Blocker: requires ROCm/HIP stack (hip-runtime, hipblas, rocblas) not available in Guix; next: wait for ROCm packaging
;;; Approaches considered:
;;;   A1: Source build — ROCm stack not in Guix
;;;   A2: Binary redistribution — AMD licensing unclear
;;;   A3: Wait for ROCm packaging — tracked upstream
;;; Next: wait for ROCm packaging

;;; ── snapd (#11742) ───────────────────────────────────
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260413d
;;; Upstream: https://github.com/snapcore/snapd
;;; Description: Service and tools for management of snap packages.
;;; License: GPL3
;;; Blocker: complex Go project with systemd integration, AppArmor, seccomp, and squashfs dependencies; deep OS integration conflicts with Guix model; next: evaluate feasibility of standalone client
;;; Approaches considered:
;;;   A1: Package missing deps first — significant work required
;;;   A2: Vendor deps — increases maintenance burden
;;;   A3: Binary release — evaluate if prebuilt binary exists
;;; Next: evaluate feasibility of standalone client

;;; ── plasma6-applets-thermal-monitor-git (#11744) ─────
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260413d
;;; Upstream: https://invent.kde.org/olib/thermalmonitor
;;; Description: A KDE Plasmoid for displaying system temperatures. Latest commit.
;;; License: MIT
;;; Blocker: KDE Plasma 6 applet requiring full KDE6/Qt6 framework stack; next: verify KDE6 availability in Guix
;;; Approaches considered:
;;;   A1: Standard build — blocked by complexity described above
;;;   A2: Simplified build — may lose functionality
;;;   A3: Prebuilt/binary — evaluate upstream releases
;;; Next: verify KDE6 availability in Guix

;;; ── nvidia-vulkan-open-dkms (#11757) ─────────────────
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260413d
;;; Upstream: https://developer.nvidia.com/vulkan-driver
;;; Description: NVIDIA open kernel modules - module sources (vulkan developer branch)
;;; License: MIT AND GPL-2.0-only
;;; Blocker: DKMS kernel module requiring kernel headers integration, NVIDIA proprietary build system; next: study nonguix nvidia-module patterns
;;; Approaches considered:
;;;   A1: DKMS module — Guix doesn't use DKMS, needs custom kernel integration
;;;   A2: Source build against Guix kernel — requires kernel-module packaging pattern
;;;   A3: Nonguix approach — check nonguix for existing patterns
;;; Next: study nonguix nvidia-module patterns

;;; ── opencl-nvidia-vulkan (#11759) ────────────────────
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260413d
;;; Upstream: https://developer.nvidia.com/vulkan-driver
;;; Description: OpenCL implemention for NVIDIA (vulkan developer branch)
;;; License: custom
;;; Blocker: NVIDIA proprietary driver component, requires matching kernel module version; next: package alongside nvidia-vulkan-open-dkms
;;; Approaches considered:
;;;   A1: DKMS module — Guix doesn't use DKMS, needs custom kernel integration
;;;   A2: Source build against Guix kernel — requires kernel-module packaging pattern
;;;   A3: Nonguix approach — check nonguix for existing patterns
;;; Next: package alongside nvidia-vulkan-open-dkms

;;; ── lib32-nvidia-vulkan-utils (#11760) ───────────────
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260413d
;;; Upstream: https://developer.nvidia.com/vulkan-driver
;;; Description: NVIDIA drivers utilities (32-bit) (vulkan developer branch)
;;; License: custom
;;; Blocker: 32-bit NVIDIA proprietary library, Guix has no lib32 convention; next: evaluate multilib approach
;;; Approaches considered:
;;;   A1: Direct packaging — proprietary blob distribution complex
;;;   A2: Nonguix nvidia patterns — check existing nvidia packaging
;;;   A3: Upstream installer extraction — complex multi-component structure
;;; Next: evaluate multilib approach

;;; ── lib32-opencl-nvidia-vulkan (#11761) ──────────────
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260413d
;;; Upstream: https://developer.nvidia.com/vulkan-driver
;;; Description: OpenCL implemention for NVIDIA (32-bit) (vulkan developer branch)
;;; License: custom
;;; Blocker: 32-bit NVIDIA proprietary library, same lib32 blocker as lib32-nvidia-vulkan-utils; next: blocked on lib32 solution
;;; Approaches considered:
;;;   A1: Direct packaging — proprietary blob distribution complex
;;;   A2: Nonguix nvidia patterns — check existing nvidia packaging
;;;   A3: Upstream installer extraction — complex multi-component structure
;;; Next: blocked on lib32 solution

;;; ── amneziawg-dkms (#11762) ──────────────────────────
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260413d
;;; Upstream: https://github.com/amnezia-vpn/amneziawg-linux-kernel-module
;;; Description: AmneziaWG is a contemporary version of the popular VPN protocol, WireGuard.
;;; License: GPLv2
;;; Blocker: DKMS kernel module requiring kernel headers, similar blocker to nvidia-vulkan-open-dkms; next: study Guix kernel module packaging patterns
;;; Approaches considered:
;;;   A1: DKMS module — Guix doesn't use DKMS, needs custom kernel integration
;;;   A2: Source build against Guix kernel — requires kernel-module packaging pattern
;;;   A3: Nonguix approach — check nonguix for existing patterns
;;; Next: study Guix kernel module packaging patterns

;;; ── virtualbox-ext-oracle (#11767) ───────────────────
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260413d
;;; Upstream: https://www.virtualbox.org/
;;; Description: Oracle VM VirtualBox Extension Pack
;;; License: custom:PUEL
;;; Blocker: Oracle VirtualBox Extension Pack requires matching VirtualBox version and custom installer integration; next: check Guix virtualbox packaging status
;;; Approaches considered:
;;;   A1: Standard build — blocked by complexity described above
;;;   A2: Simplified build — may lose functionality
;;;   A3: Prebuilt/binary — evaluate upstream releases
;;; Next: check Guix virtualbox packaging status

;;; ── cuda-12.9 (#11769) ───────────────────────────────
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260413d
;;; Upstream: https://developer.nvidia.com/cuda-zone
;;; Description: NVIDIA's GPU programming toolkit version 12.9 (Maxwell/Pascal/Volta support)
;;; License: custom:NVIDIA
;;; Blocker: massive NVIDIA CUDA toolkit (multi-GB), proprietary installer with complex component structure; next: study nonguix cuda packaging if available
;;; Approaches considered:
;;;   A1: Direct packaging — proprietary blob distribution complex
;;;   A2: Nonguix nvidia patterns — check existing nvidia packaging
;;;   A3: Upstream installer extraction — complex multi-component structure
;;; Next: study nonguix cuda packaging if available

;;; ── azahar-git (#11776) ──────────────────────────────
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260413d
;;; Upstream: https://azahar-emu.org/
;;; Description: Nintendo 3DS emulator based on Citra
;;; License: GPL-2.0-or-later
;;; Blocker: complex C++/CMake project with Vulkan, Qt6, SPIRV-Tools, Boost deps; heavy build requiring submodule management; next: enumerate available deps
;;; Approaches considered:
;;;   A1: Package missing deps first — significant work required
;;;   A2: Vendor deps — increases maintenance burden
;;;   A3: Binary release — evaluate if prebuilt binary exists
;;; Next: enumerate available deps

;;; ── libretro-azahar-git (#11777) ─────────────────────
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260413d
;;; Upstream: https://azahar-emu.org/
;;; Description: Nintendo 3DS core based on Citra
;;; License: GPL-2.0-or-later
;;; Blocker: depends on azahar-git being packaged first; next: blocked on azahar-git
;;; Approaches considered:
;;;   A1: Package missing deps first — significant work required
;;;   A2: Vendor deps — increases maintenance burden
;;;   A3: Binary release — evaluate if prebuilt binary exists
;;; Next: blocked on azahar-git

;;; ── paccache-hook (#11783) ───────────────────────────
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260413d
;;; Upstream: None
;;; Description: A configurable hook to cleanup the pacman package cache using paccache
;;; License: BSD
;;; Blocker: Arch Linux pacman hook, not applicable to Guix package manager; next: skip, Arch-specific tooling
;;; Approaches considered:
;;;   A1: Direct port — not applicable, Arch-specific tooling
;;;   A2: Functional equivalent — no Guix equivalent exists
;;;   A3: Skip — correct decision for distro-specific packages
;;; Next: skip, Arch-specific tooling

;;; ── pamac-aur (#11788) ───────────────────────────────
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260413d
;;; Upstream: https://github.com/manjaro/pamac
;;; Description: A Gtk frontend, Package Manager based on libalpm with AUR and Appstream support
;;; License: GPL-3.0-or-later
;;; Blocker: Arch Linux package manager frontend (uses libalpm, pacman), not applicable to Guix; next: skip, Arch-specific
;;; Approaches considered:
;;;   A1: Direct port — not applicable, Arch-specific tooling
;;;   A2: Functional equivalent — no Guix equivalent exists
;;;   A3: Skip — correct decision for distro-specific packages
;;; Next: skip, Arch-specific

;;; ── linux-mainline-docs (#11796) ─────────────────────
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260413d
;;; Upstream: https://kernel.org/
;;; Description: Documentation for the Linux Mainline kernel
;;; License: GPL-2.0-only
;;; Blocker: Linux kernel documentation build requiring Sphinx + kernel build system; massive source archive; next: evaluate standalone doc build feasibility
;;; Approaches considered:
;;;   A1: DKMS module — Guix doesn't use DKMS, needs custom kernel integration
;;;   A2: Source build against Guix kernel — requires kernel-module packaging pattern
;;;   A3: Nonguix approach — check nonguix for existing patterns
;;; Next: evaluate standalone doc build feasibility

;;; ── mkinitcpio-numlock (#11797) ──────────────────────
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260413d
;;; Upstream: https://bbs.archlinux.org/viewtopic.php?pid=869618
;;; Description: Enable numlock in early userspace
;;; License: GPL
;;; Blocker: Arch Linux mkinitcpio hook, not applicable to Guix initramfs; next: skip, Arch-specific tooling
;;; Approaches considered:
;;;   A1: Direct port — not applicable, Arch-specific tooling
;;;   A2: Functional equivalent — no Guix equivalent exists
;;;   A3: Skip — correct decision for distro-specific packages
;;; Next: skip, Arch-specific tooling

;;; ── discord_arch_electron (#11812) ───────────────────
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260413d
;;; Upstream: https://discord.com
;;; Description: Discord using system provided electron for increased security and performance
;;; License: custom
;;; Blocker: requires extracting Discord .deb and patching to use system Electron, complex asar manipulation; next: evaluate prebuilt .deb copy approach
;;; Approaches considered:
;;;   A1: npm/node-build-system — npm dep resolution too complex
;;;   A2: Prebuilt binary (AppImage/deb) — may work with copy-build-system
;;;   A3: Upstream binary release — evaluate if stable release exists
;;; Next: evaluate prebuilt .deb copy approach

;;; ── cider (#11817) ───────────────────────────────────
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260413d
;;; Upstream: https://github.com/taoky/Cider
;;; Description: An abandoned Apple Music player using a fork of Cider v1 from taoky/Cider
;;; License: AGPL-3.0-only
;;; Blocker: Electron app (Vue.js), abandoned upstream, complex npm/pnpm build; next: evaluate if prebuilt release exists
;;; Approaches considered:
;;;   A1: npm/node-build-system — npm dep resolution too complex
;;;   A2: Prebuilt binary (AppImage/deb) — may work with copy-build-system
;;;   A3: Upstream binary release — evaluate if stable release exists
;;; Next: evaluate if prebuilt release exists

;;; ── linuxqq-nt-bwrap (#11823) ────────────────────────
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260413d
;;; Upstream: https://im.qq.com/linuxqq/index.shtml
;;; Description: New Linux QQ based on Electron, with bubblewrap sandbox and some tweaks
;;; License: custom
;;; Blocker: similar to linuxqq but with bwrap sandboxing layer, needs custom wrapper; next: extend linuxqq recipe with bwrap wrapper
;;; Approaches considered:
;;;   A1: Standard build — blocked by complexity described above
;;;   A2: Simplified build — may lose functionality
;;;   A3: Prebuilt/binary — evaluate upstream releases
;;; Next: extend linuxqq recipe with bwrap wrapper

;;; ── hyprqt6engine (#11830) ───────────────────────────
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260413d
;;; Upstream: https://github.com/hyprwm/hyprqt6engine
;;; Description: QT6 Theme Provider for Hyprland
;;; License: BSD-3-Clause
;;; Blocker: Qt6 theme engine requiring Hyprland headers and full Qt6 build stack; next: verify hyprland and qt6 availability in Guix
;;; Approaches considered:
;;;   A1: Standard build — blocked by complexity described above
;;;   A2: Simplified build — may lose functionality
;;;   A3: Prebuilt/binary — evaluate upstream releases
;;; Next: verify hyprland and qt6 availability in Guix

;;; ── orca-slicer (#11833) ─────────────────────────────
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260413d
;;; Upstream: https://github.com/SoftFever/OrcaSlicer
;;; Description: G-code generator for 3D printers (Bambu, Prusa, Voron, VzBot, RatRig, Creality, etc.)
;;; License: AGPL-3.0-only
;;; Blocker: large C++/CMake project with wxWidgets, OpenGL, CGAL, Boost deps; complex build with embedded resources; next: enumerate dep availability
;;; Approaches considered:
;;;   A1: Package missing deps first — significant work required
;;;   A2: Vendor deps — increases maintenance burden
;;;   A3: Binary release — evaluate if prebuilt binary exists
;;; Next: enumerate dep availability

;;; ── kanidm (#11836) ──────────────────────────────────
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260413d
;;; Upstream: https://github.com/kanidm/kanidm
;;; Description: A identity management service and clients.
;;; License: MPL-2.0
;;; Blocker: large Rust project with many crate deps (300+), plus wasm-pack frontend build; next: evaluate cargo-build-system feasibility with dep vendoring
;;; Approaches considered:
;;;   A1: Package missing deps first — significant work required
;;;   A2: Vendor deps — increases maintenance burden
;;;   A3: Binary release — evaluate if prebuilt binary exists
;;; Next: evaluate cargo-build-system feasibility with dep vendoring

;;; ── ladybird (#11842) ────────────────────────────────
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260413d
;;; Upstream: https://github.com/LadybirdBrowser/ladybird
;;; Description: Truly independent web browser
;;; License: BSD-2-Clause
;;; Blocker: large C++ web browser engine, massive dep tree (LibWeb, LibJS, Skia, ICU), rapidly evolving build system; next: track upstream build stabilization
;;; Approaches considered:
;;;   A1: Package missing deps first — significant work required
;;;   A2: Vendor deps — increases maintenance burden
;;;   A3: Binary release — evaluate if prebuilt binary exists
;;; Next: track upstream build stabilization

;;; ── pacdiff-pacman-hook-git (#11852) ─────────────────
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260413d
;;; Upstream: https://github.com/desbma/pacman-hooks
;;; Description: Pacman hook to review .pacnew files automatically
;;; License: GPL
;;; Blocker: Arch Linux pacman hook, not applicable to Guix; next: skip, Arch-specific
;;; Approaches considered:
;;;   A1: Direct port — not applicable, Arch-specific tooling
;;;   A2: Functional equivalent — no Guix equivalent exists
;;;   A3: Skip — correct decision for distro-specific packages
;;; Next: skip, Arch-specific

;;; ── r8125-dkms (#11854) ──────────────────────────────
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260413d
;;; Upstream: https://www.realtek.com/en/component/zoo/category/network-interface-controllers-10-100-1000m-gigabit-ethernet-pci-express-software
;;; Description: Kernel module for RTL8125
;;; License: GPL2
;;; Blocker: DKMS kernel module for RTL8125, requires kernel headers integration; next: study Guix kernel module packaging
;;; Approaches considered:
;;;   A1: DKMS module — Guix doesn't use DKMS, needs custom kernel integration
;;;   A2: Source build against Guix kernel — requires kernel-module packaging pattern
;;;   A3: Nonguix approach — check nonguix for existing patterns
;;; Next: study Guix kernel module packaging

