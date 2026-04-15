;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Blocked notes for recipe-resolver-260415f
;;; 29 packages exhausted after evaluation.
;;;
;;; This file documents why each package cannot be feasibly packaged.

;;; --- parallels-client (#4059) ---
;;; PROPRIETARY: Parallels RAS Client for remote desktop.
;;; Proprietary binary from Parallels Inc., closed-source.
;;; A1: Binary repackage — proprietary EULA prohibits redistribution.
;;; A2: Build from source — no source available, closed-source.
;;; A3: Use Remmina/FreeRDP — already in Guix for RDP/VNC.
;;; Verdict: EXHAUSTED — PROPRIETARY.

;;; --- forticlient (#4346) ---
;;; PROPRIETARY: Fortinet VPN client.
;;; Proprietary binary from Fortinet, requires EULA acceptance.
;;; A1: Binary repackage — Fortinet EULA prohibits redistribution.
;;; A2: Build from source — no source available.
;;; A3: Use openfortivpn — already in Guix, open-source Fortinet VPN client.
;;; Verdict: EXHAUSTED — PROPRIETARY.

;;; --- sejda-desktop (#4355) ---
;;; PROPRIETARY: Electron-based PDF editor.
;;; Proprietary application from Sejda BV, closed-source.
;;; A1: Binary repackage — proprietary license.
;;; A2: Build from source — no source available.
;;; A3: Use qpdfview/mupdf/zathura — open-source PDF tools in Guix.
;;; Verdict: EXHAUSTED — PROPRIETARY.

;;; --- wps-office-365-edu (#4612) ---
;;; PROPRIETARY: WPS Office 365 Education edition.
;;; Proprietary office suite from Kingsoft, account-gated download.
;;; A1: Binary repackage — proprietary license, no redistribution.
;;; A2: Build from source — no source available.
;;; A3: Use LibreOffice — already in Guix, covers all office needs.
;;; Verdict: EXHAUSTED — PROPRIETARY.

;;; --- pacboost (#4654) ---
;;; ARCH_SPECIFIC: Arch Linux pacman performance wrapper.
;;; Shell script wrapping pacman with aria2 for parallel downloads.
;;; A1: Port to Guix — depends on pacman (Arch-only package manager).
;;; A2: Adapt script — pacman APIs are Arch-specific.
;;; A3: Use Guix substitute mirrors — Guix has its own download infra.
;;; Verdict: EXHAUSTED — ARCH_SPECIFIC.

;;; --- vaults (#6784) ---
;;; RUST_VENDORED_DEPS: GNOME encrypted vault manager.
;;; GTK4 + Rust (Meson wrapping Cargo) GUI for gocryptfs/CryFS.
;;; A1: Meson+Cargo build — needs full Rust crate vendoring.
;;; A2: Guix cargo-build-system — doesn't support Meson wrapper pattern.
;;; A3: Use gocryptfs CLI directly — already in Guix.
;;; Verdict: EXHAUSTED — RUST_VENDORED_DEPS.

;;; --- veracrypt-inyourlanguage (#6805) ---
;;; NON_FREE_LICENSE: VeraCrypt with all language translations.
;;; VeraCrypt itself uses TrueCrypt License 3.0 (non-free, not OSI-approved).
;;; A1: Build from source — TrueCrypt License prohibits Guix main channel.
;;; A2: Translations only — no standalone translations package, tied to build.
;;; A3: Use LUKS/cryptsetup — already in Guix for disk encryption.
;;; Verdict: EXHAUSTED — NON_FREE_LICENSE.

;;; --- expressvpn-staging (#7051) ---
;;; PROPRIETARY: ExpressVPN client (staging channel).
;;; Proprietary VPN client from ExpressVPN (Kape Technologies).
;;; A1: Binary repackage — proprietary license, no redistribution.
;;; A2: Build from source — no source available.
;;; A3: Use WireGuard/OpenVPN — already in Guix.
;;; Verdict: EXHAUSTED — PROPRIETARY.

;;; --- ue4localizationstool-zenity (#7221) ---
;;; DOTNET_MONO_REQUIRED: C#/.NET UE4 localization editor with zenity.
;;; Builds with Mono (MSBuild + NuGet restore); upstream archived (abandoned).
;;; A1: Mono+NuGet build — NuGet needs network (violates hermetic build).
;;; A2: Pre-package NuGet deps — no tooling, deps not enumerated.
;;; A3: Skip — upstream archived, UE4 localization niche, no active maint.
;;; Verdict: EXHAUSTED — DOTNET_MONO_REQUIRED + UPSTREAM_ARCHIVED.

;;; --- yandex-music-windows (#7260) ---
;;; WINDOWS_ONLY: Yandex Music Windows client (Electron wrapper).
;;; Windows-only application requiring Wine/Electron for Linux.
;;; A1: Run under Wine — non-portable, Wine dependency complex.
;;; A2: Electron port — no Linux-native source available.
;;; A3: Use web interface or alternative — browser-based access works.
;;; Verdict: EXHAUSTED — WINDOWS_ONLY.

;;; --- pacpush (#7279) ---
;;; ARCH_SPECIFIC: Pacman package cache sharing tool.
;;; Shell script for sharing pacman package caches across LAN.
;;; A1: Port to Guix — fundamentally tied to pacman package format.
;;; A2: Adapt for Guix substitutes — different caching model entirely.
;;; A3: Use guix publish — Guix has built-in substitute sharing.
;;; Verdict: EXHAUSTED — ARCH_SPECIFIC.

;;; --- linux-steam-integration (#10954) ---
;;; PROPRIETARY_RUNTIME_DEP: Steam runtime integration helper.
;;; Meson C build that intercepts Steam runtime library loading.
;;; A1: Build from source — requires Steam (proprietary) at runtime.
;;; A2: 32-bit multilib — Guix lacks multilib (lib32) support.
;;; A3: Use Steam via Flatpak/nonguix — out of scope for free channel.
;;; Verdict: EXHAUSTED — PROPRIETARY_RUNTIME_DEP + MULTILIB_UNSUPPORTED.

;;; --- classisland-git (#11220) ---
;;; WINDOWS_ONLY_DOTNET: Windows-only classroom schedule display.
;;; C#/.NET WPF application (Windows Presentation Foundation, no Linux).
;;; A1: Build for Linux — WPF is Windows-only, no Linux runtime.
;;; A2: Port to Avalonia — requires upstream effort, not our scope.
;;; A3: Skip — no Linux build exists, Windows-specific GUI framework.
;;; Verdict: EXHAUSTED — WINDOWS_ONLY_DOTNET.

;;; --- arch-smart-update (#11536) ---
;;; ARCH_SPECIFIC: Arch Linux update decision script.
;;; Bash script checking Arch Linux news/mirrors before updating.
;;; A1: Port to Guix — checks Arch-specific news feeds and mirrors.
;;; A2: Adapt logic — Guix uses channels, not Arch mirrors/repos.
;;; A3: Use guix pull — Guix has built-in update mechanism.
;;; Verdict: EXHAUSTED — ARCH_SPECIFIC.

;;; --- nitrox (#11669) ---
;;; DOTNET_GAME_MOD: .NET Subnautica multiplayer mod.
;;; C# mod requiring .NET runtime + Subnautica game assets (proprietary).
;;; A1: Build from source — .NET SDK not in Guix.
;;; A2: Use Mono — targets .NET 8+, Mono incompatible.
;;; A3: Skip — requires proprietary game + .NET ecosystem.
;;; Verdict: EXHAUSTED — DOTNET_REQUIRED + PROPRIETARY_GAME_DEP.

;;; --- aurutils-git (#11962) ---
;;; ARCH_SPECIFIC: AUR helper utilities for Arch Linux.
;;; Shell scripts wrapping pacman, makepkg, and vifm for AUR builds.
;;; A1: Port to Guix — depends on pacman/makepkg (Arch-only).
;;; A2: Adapt scripts — AUR is Arch-specific, no Guix equivalent.
;;; A3: Skip — fundamentally Arch Linux tooling.
;;; Verdict: EXHAUSTED — ARCH_SPECIFIC.

;;; --- thcrap-steam-proton-wrapper-git (#13396) ---
;;; PROPRIETARY_RUNTIME_DEP: Touhou game patching for Steam/Proton.
;;; Bash script wrapper requiring Steam runtime + Proton + Windows game.
;;; A1: Package script — needs Steam (proprietary) at runtime.
;;; A2: Run without Steam — not functional, game is Steam-exclusive.
;;; A3: Skip — niche gaming mod requiring proprietary stack.
;;; Verdict: EXHAUSTED — PROPRIETARY_RUNTIME_DEP.

;;; --- mesa-dlss-reflex-git (#13460) ---
;;; MASSIVE_REBUILD_PROPRIETARY: Mesa fork with NVIDIA DLSS/Reflex.
;;; Full Mesa graphics stack fork adding proprietary NVIDIA extensions.
;;; A1: Build from source — Mesa is 20GB+, 30min+ build.
;;; A2: Patch Guix Mesa — diverges from upstream, maintenance burden.
;;; A3: Skip — NVIDIA proprietary headers needed, niche GPU feature.
;;; Verdict: EXHAUSTED — MASSIVE_REBUILD + PROPRIETARY_HEADERS.

;;; --- iwlwifi-lar-patched (#13476) ---
;;; KERNEL_MODULE_INFEASIBLE: Patched Intel WiFi kernel modules.
;;; Replaces iwlwifi with LAR-disabled variant; Arch kernel-specific.
;;; A1: Build module — needs exact kernel source match (Guix uses own).
;;; A2: Guix kernel config — would need custom kernel with flag disabled.
;;; A3: Skip — linux-module-build-system for this requires kernel rebuild.
;;; Verdict: EXHAUSTED — KERNEL_MODULE_SPECIFIC.

;;; --- gram (#13482) ---
;;; MASSIVE_CARGO_DEPS: Zed editor fork with AGPL license.
;;; Rust+Vulkan GPU-accelerated code editor; 500+ cargo dependencies.
;;; A1: Cargo-build-system — 500+ crates need individual packaging.
;;; A2: Vendored build — Guix network isolation blocks cargo fetch.
;;; A3: Use Guix editors — emacs, vim, kakoune, helix available.
;;; Verdict: EXHAUSTED — MASSIVE_CARGO_DEPS.

;;; --- conquest-git (#13512) ---
;;; OFFENSIVE_SECURITY_TOOL: C2/post-exploitation framework in Nim.
;;; Command & control framework for offensive security operations.
;;; A1: Package as-is — distributing C2 tools raises ethical/legal concerns.
;;; A2: Security context — no clear authorized pentesting context.
;;; A3: Skip — offensive security tool not appropriate for general channel.
;;; Verdict: EXHAUSTED — OFFENSIVE_SECURITY_TOOL.

;;; --- havoc-c2-git (#13513) ---
;;; OFFENSIVE_SECURITY_TOOL: Modern C2 post-exploitation framework.
;;; Command & control framework with malleable C2 profiles.
;;; A1: Package as-is — distributing C2 tools raises ethical/legal concerns.
;;; A2: Security context — no clear authorized pentesting context.
;;; A3: Skip — offensive security tool not appropriate for general channel.
;;; Verdict: EXHAUSTED — OFFENSIVE_SECURITY_TOOL.

;;; --- cclive (#13603) ---
;;; ABANDONED_DEPS: Video downloader using defunct libquvi.
;;; C++ CLI tool depending on libquvi (archived 2013, scripts dead).
;;; A1: Package with libquvi — libquvi abandoned, scripts broken for modern sites.
;;; A2: Port to yt-dlp backend — would require rewriting the tool.
;;; A3: Use yt-dlp — already in Guix, actively maintained, covers all sites.
;;; Verdict: EXHAUSTED — ABANDONED_DEPS.

;;; --- winboat-electron (#13604) ---
;;; ELECTRON_WINE_COMPLEX: Electron app for running Windows apps on Linux.
;;; Requires Electron framework + Wine runtime integration.
;;; A1: npm source build — Electron + 500 npm deps, not feasible.
;;; A2: Binary repackage — Electron bundles Chromium (300MB+).
;;; A3: Use Wine directly — already in Guix for Windows app compatibility.
;;; Verdict: EXHAUSTED — ELECTRON_COMPLEX + WINE_DEP.

;;; --- pantheon-dock-git (#13611) ---
;;; MISSING_GUIX_DEP_VERSION: elementary OS application dock.
;;; Meson+Vala build; requires granite >= 7.7.0 but Guix ships 7.3.0.
;;; A1: Patch version check — may fail if new granite API used.
;;; A2: Upgrade granite in Guix — requires upstream Guix contribution.
;;; A3: Use older dock release — checked; all 8.x releases need granite 7.7+.
;;; Note: Recipe drafted in recipe-resolver-260415f.scm with version
;;; requirement patched; may or may not build with granite 7.3.0.
;;; Verdict: EXHAUSTED — MISSING_GUIX_DEP_VERSION (granite 7.7.0+ needed).

;;; --- mate-wayland-session (#13854) ---
;;; MISSING_GUIX_DEPS: MATE desktop Wayland session using Wayfire.
;;; Configuration files + scripts for MATE under Wayfire compositor.
;;; A1: Package as-is — requires Wayfire compositor (not in Guix).
;;; A2: Package Wayfire first — complex wlroots-based compositor, big scope.
;;; A3: Use sway — Guix has sway for Wayland compositing.
;;; Verdict: EXHAUSTED — MISSING_GUIX_DEPS (wayfire not in Guix).

;;; --- android_translation_layer-git (#15913) ---
;;; ANDROID_RUNTIME_REQUIRED: Android app translation layer for Linux.
;;; Requires Android bionic libc, binder IPC, and native Android libs.
;;; A1: Build from source — needs bionic libc (Android's C library).
;;; A2: Use container — still needs Android system image.
;;; A3: Skip — Android runtime fundamentally incompatible with Guix.
;;; Verdict: EXHAUSTED — ANDROID_RUNTIME_REQUIRED.

;;; --- octopi-git (#16712) ---
;;; ARCH_SPECIFIC: Qt-based pacman GUI frontend.
;;; Qt5/Qt6 GUI for managing Arch Linux packages via pacman.
;;; A1: Build from source — depends on libalpm (pacman library).
;;; A2: Adapt for Guix — would need complete rewrite for Guix CLI.
;;; A3: Use Guix CLI/Emacs interface — native tools available.
;;; Verdict: EXHAUSTED — ARCH_SPECIFIC.

;;; --- parui-git (#19178) ---
;;; ARCH_SPECIFIC: TUI frontend for paru/yay AUR helpers.
;;; Rust TUI wrapping paru or yay for AUR package management.
;;; A1: Build from source — depends on paru/yay (AUR helpers).
;;; A2: Adapt for Guix — AUR is Arch-specific, no Guix equivalent.
;;; A3: Skip — fundamentally Arch Linux tooling.
;;; Verdict: EXHAUSTED — ARCH_SPECIFIC.

;;; --- pat-aur-client-firmware-git (#13380) ---
;;; ARCH_SPECIFIC: Firmware update support for pat-aur build system.
;;; Depends on pat-aur (Arch AUR build helper, already EXHAUSTED).
;;; A1: Package as-is — depends on pat-aur (not packageable, Arch-specific).
;;; A2: Use fwupd directly — already in Guix for firmware updates.
;;; A3: Skip — blocked on pat-aur which is Arch-specific.
;;; Verdict: EXHAUSTED — ARCH_SPECIFIC (depends on exhausted pat-aur).
