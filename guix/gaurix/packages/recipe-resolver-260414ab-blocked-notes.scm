;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Blocked notes for recipe-resolver-260414ab
;;; 23 packages confirmed NEEDS_RECIPE_DESIGN_EXHAUSTED with reason codes
;;;

(define-module (gaurix packages recipe-resolver-260414ab-blocked-notes))

;;; --- INFEASIBLE_BUILD (3 packages) ---
;;;
;;; #57 waydroid
;;;   Android container for Wayland; requires LXC + Android system images +
;;;   binder kernel module (not available in standard Linux kernels).
;;;   A1: packaging LXC + Android images — images are multi-GB proprietary blobs
;;;   A2: binder kernel module not in upstream kernel, needs custom patches
;;;   A3: Guix sandbox model incompatible with container-in-container approach
;;;   Status: NEEDS_RECIPE_DESIGN_EXHAUSTED — INFEASIBLE_BUILD
;;;
;;; #939 qt6-base-hifps
;;;   Qt6 base library with high-FPS animation patch (single one-line change).
;;;   A1: fork entire qt6-base — requires rebuilding 50+ downstream Qt6 deps
;;;   A2: runtime patch — Qt6 animations compiled into shared lib, not patchable
;;;   A3: upstream PR — patch rejected upstream as niche use case
;;;   Status: NEEDS_RECIPE_DESIGN_EXHAUSTED — FULL_QT6_REBUILD
;;;
;;; #938 qt6-xcb-private-headers-hifps
;;;   Qt6 XCB private headers for high-FPS variant; depends on qt6-base-hifps.
;;;   A1: depends on qt6-base-hifps which is itself infeasible (see above)
;;;   A2: no independent use case without the full hifps Qt6 stack
;;;   A3: N/A — blocked on upstream dependency
;;;   Status: NEEDS_RECIPE_DESIGN_EXHAUSTED — DEPENDS_ON_INFEASIBLE
;;;

;;; --- GUIX_INCOMPATIBLE (1 package) ---
;;;
;;; #98 grub-customizer
;;;   GTK3 GUI for editing GRUB configuration files.
;;;   A1: Guix System uses a declarative boot config (operating-system bootloader);
;;;       grub-customizer writes /boot/grub/grub.cfg directly, which Guix regenerates
;;;   A2: could package for non-Guix-System use — but grub-customizer expects
;;;       /etc/default/grub which doesn't exist on Guix System
;;;   A3: users on foreign distros can use their distro's grub-customizer package
;;;   Status: NEEDS_RECIPE_DESIGN_EXHAUSTED — GUIX_INCOMPATIBLE
;;;

;;; --- DOTNET_UNSUPPORTED (2 packages) ---
;;;
;;; #925 csharpier
;;;   C# code formatter requiring .NET SDK 10.0.
;;;   A1: dotnet publish needs dotnet-sdk — not in Guix, no bootstrapping path
;;;   A2: NuGet tool restore needs dotnet runtime — same blocker
;;;   A3: no standalone prebuilt binaries available for Linux
;;;   Status: NEEDS_RECIPE_DESIGN_EXHAUSTED — DOTNET_SDK_MISSING
;;;
;;; #3859 vintagestory-unstable
;;;   Voxel sandbox game requiring dotnet-runtime-10.0.
;;;   A1: .NET runtime not in Guix — entire .NET ecosystem missing
;;;   A2: no static/standalone binary builds available
;;;   A3: custom license restricts redistribution of bundled assets
;;;   Status: NEEDS_RECIPE_DESIGN_EXHAUSTED — DOTNET_UNSUPPORTED
;;;

;;; --- WINDOWS_ONLY (1 package) ---
;;;
;;; #3830 winbox3
;;;   MikroTik RouterOS management GUI (WinBox version 3).
;;;   A1: source is a Windows .exe — no native Linux build available
;;;   A2: WinBox v3 requires Wine; Guix Wine packaging is incomplete
;;;   A3: WinBox v4 exists for Linux but is a separate AUR package (winbox)
;;;   Status: NEEDS_RECIPE_DESIGN_EXHAUSTED — WINDOWS_ONLY
;;;

;;; --- ARCH_SPECIFIC (2 packages) ---
;;;
;;; #13162 portage-manifest
;;;   Arch Linux unified package browser (official repos + AUR + Flatpak).
;;;   A1: depends on pacman/yay — Arch-specific package managers
;;;   A2: license is CC-BY-NC — non-free, incompatible with Guix FSDG
;;;   A3: Electron/npm build chain adds further complexity
;;;   Status: NEEDS_RECIPE_DESIGN_EXHAUSTED — ARCH_SPECIFIC + NON_FREE_LICENSE
;;;
;;; #13288 reboot-arch-btw
;;;   Arch-specific kernel update checker using pacman database.
;;;   A1: depends on pacman — Arch package manager
;;;   A2: reads Arch kernel naming conventions (/boot/vmlinuz-linux)
;;;   A3: Guix handles kernel updates differently (generations)
;;;   Status: NEEDS_RECIPE_DESIGN_EXHAUSTED — ARCH_SPECIFIC
;;;

;;; --- MASSIVE_DEPS (3 packages) ---
;;;
;;; #13304 organicmaps
;;;   Offline mobile mapping application (fork of MAPS.ME).
;;;   A1: 100+ C++/Qt native dependencies, custom Boost extensions
;;;   A2: mobile-first Qt UI with custom map rendering engine
;;;   A3: map data pipeline requires proprietary OpenStreetMap tooling
;;;   Status: NEEDS_RECIPE_DESIGN_EXHAUSTED — MASSIVE_DEPS
;;;
;;; #13314 collabora-office
;;;   LibreOffice fork with Collabora Online integration (10M+ LOC).
;;;   A1: hours-long build time, mirrors LibreOffice complexity
;;;   A2: WebSocket server component needs separate packaging
;;;   A3: Qt6 wrapper adds another build dependency layer
;;;   Status: NEEDS_RECIPE_DESIGN_EXHAUSTED — LIBREOFFICE_FORK
;;;
;;; #3855 momw-tools-pack
;;;   Morrowind modding metapackage depending on 8+ individual tools.
;;;   A1: requires delta-plugin, tes3cmd, momw-configurator — none in Guix
;;;   A2: each tool has its own dependency chain (Perl, Python, custom)
;;;   A3: niche gaming use case with very small user base
;;;   Status: NEEDS_RECIPE_DESIGN_EXHAUSTED — META_DEPS_MISSING
;;;

;;; --- CLOJURE_MULTISERVICE (2 packages) ---
;;;
;;; #13305 penpot
;;;   Open-source design tool with Clojure backend + ClojureScript frontend.
;;;   A1: leiningen build system not in Guix
;;;   A2: multi-service architecture (backend + frontend + exporter + PostgreSQL + Redis)
;;;   A3: shadow-cljs for frontend build adds npm ecosystem dependency
;;;   Status: NEEDS_RECIPE_DESIGN_EXHAUSTED — CLOJURE_MULTISERVICE
;;;
;;; #13306 penpot-exporter
;;;   Penpot SVG/PDF exporter service component.
;;;   A1: depends on penpot backend service (blocked, see above)
;;;   A2: requires Playwright for rendering — Chromium headless dependency
;;;   A3: not standalone — only functions as part of penpot deployment
;;;   Status: NEEDS_RECIPE_DESIGN_EXHAUSTED — DEPENDS_ON_INFEASIBLE
;;;

;;; --- GUIX_NATIVE_CROSS (2 packages) ---
;;;
;;; #13316 rust-aarch64-musl-git
;;;   Rust cross-compilation target for aarch64-unknown-linux-musl.
;;;   A1: Guix handles cross-compilation natively via --target flag
;;;   A2: Arch package wraps rustup, which Guix replaces with native toolchain
;;;   A3: no standalone use case — Guix users cross-compile with guix build --target
;;;   Status: NEEDS_RECIPE_DESIGN_EXHAUSTED — GUIX_NATIVE_CROSS
;;;
;;; #13317 rust-aarch64-gnu-git
;;;   Rust cross-compilation target for aarch64-unknown-linux-gnu.
;;;   A1: Guix handles cross-compilation natively via --target flag
;;;   A2: Arch package wraps rustup, which Guix replaces with native toolchain
;;;   A3: no standalone use case — Guix users cross-compile with guix build --target
;;;   Status: NEEDS_RECIPE_DESIGN_EXHAUSTED — GUIX_NATIVE_CROSS
;;;

;;; --- MULTILIB_UNSUPPORTED (1 package) ---
;;;
;;; #13318 lib32-rust-libs-git
;;;   32-bit Rust multilib libraries.
;;;   A1: Guix does not support multilib (lib32) builds
;;;   A2: Guix uses separate i686-linux system for 32-bit packages
;;;   A3: Arch-specific multilib pattern has no Guix equivalent
;;;   Status: NEEDS_RECIPE_DESIGN_EXHAUSTED — MULTILIB_UNSUPPORTED
;;;

;;; --- COMPLEX_RUST (1 package) ---
;;;
;;; #13328 sulis-git
;;;   Tactical RPG game with custom 2D OpenGL engine (Rust).
;;;   A1: 100+ cargo crate dependencies not individually packaged in Guix
;;;   A2: custom OpenGL rendering engine with embedded game data assets
;;;   A3: guix import crate produces incomplete results for this scale
;;;   Status: NEEDS_RECIPE_DESIGN_EXHAUSTED — COMPLEX_RUST
;;;

;;; --- NVIDIA_PROPRIETARY (1 package) ---
;;;
;;; #13329 optimus-manager-git
;;;   NVIDIA Optimus GPU switching manager for laptops.
;;;   A1: requires proprietary NVIDIA drivers (not in Guix FSDG)
;;;   A2: 20+ hardcoded filesystem paths (/etc/X11, /usr/share, etc.)
;;;   A3: X11-only — no Wayland support, increasingly niche use case
;;;   Status: NEEDS_RECIPE_DESIGN_EXHAUSTED — NVIDIA_PROPRIETARY
;;;

;;; --- HARDWARE_SPECIFIC (1 package) ---
;;;
;;; #13185 simracing-essentials
;;;   Sim racing tool bundle for USB HID hardware.
;;;   A1: no upstream source repository found
;;;   A2: USB HID hardware-specific with custom drivers
;;;   A3: bundle nature — aggregates multiple unpackaged tools
;;;   Status: NEEDS_RECIPE_DESIGN_EXHAUSTED — HARDWARE_SPECIFIC
;;;

;;; --- KERNEL_BPF (1 package) ---
;;;
;;; #13199 scx-scheds-git
;;;   sched_ext BPF schedulers for Linux kernel 6.12+.
;;;   A1: requires BPF toolchain (bpftool, libbpf) not fully in Guix
;;;   A2: 50+ Rust crate dependencies for scheduler implementations
;;;   A3: needs custom kernel config with CONFIG_SCHED_CLASS_EXT=y
;;;   Status: NEEDS_RECIPE_DESIGN_EXHAUSTED — KERNEL_BPF
;;;

;;; --- ELECTRON_NPM (1 package) ---
;;;
;;; #13223 xmcl-launcher
;;;   Minecraft launcher built with Electron/npm.
;;;   A1: 1000+ npm dependencies in node_modules
;;;   A2: no prebuilt Linux binary releases
;;;   A3: game-specific launcher with frequent upstream churn
;;;   Status: NEEDS_RECIPE_DESIGN_EXHAUSTED — ELECTRON_NPM
;;;

;;; --- CROSS_COMPILATION_SDK (1 package) ---
;;;
;;; #13214 zephyr-sdk
;;;   Zephyr RTOS SDK with multi-architecture cross-compilation toolchains.
;;;   A1: massive 2+ GB bundle containing 12+ cross-compiler toolchains
;;;   A2: Guix handles cross-compilation natively, making this redundant
;;;   A3: musl toolchain included is already available via Guix --target
;;;   Status: NEEDS_RECIPE_DESIGN_EXHAUSTED — GUIX_NATIVE_CROSS
;;;
