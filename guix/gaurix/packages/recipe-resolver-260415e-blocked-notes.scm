;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Blocked notes for recipe-resolver-260415e
;;; 18 packages exhausted after evaluation.
;;;
;;; This file documents why each package cannot be feasibly packaged.

;;; --- pamac-aur (#11788) ---
;;; ARCH_SPECIFIC: Manjaro/Arch package manager frontend.
;;; Uses libalpm (pacman library), libpamac-aur.
;;; A1: Package as-is — depends on pacman/libalpm not in Guix, not useful.
;;; A2: Port to Guix — would require reimplementing pacman integration.
;;; A3: Skip — Arch-specific tool with zero Guix utility.
;;; Verdict: EXHAUSTED — ARCH_SPECIFIC.

;;; --- untmp (#13863) ---
;;; DISTRO_SPECIFIC: Part of tmplinux container suite.
;;; Depends on arch-install-scripts (pacstrap), systemd-nspawn.
;;; A1: Package shell scripts — depends on Arch tools + systemd-nspawn.
;;; A2: Adapt for Guix containers — would require complete rewrite.
;;; A3: Skip — fundamentally tied to systemd-nspawn and Arch tooling.
;;; Verdict: EXHAUSTED — DISTRO_SPECIFIC.

;;; --- tmpsuse (#13864) ---
;;; DISTRO_SPECIFIC: Part of tmplinux suite; creates openSUSE containers.
;;; Depends on zypper (openSUSE pkg manager) + systemd-nspawn.
;;; A1: Package as-is — zypper not in Guix.
;;; A2: Replace zypper with Guix — defeats purpose.
;;; A3: Skip — systemd-nspawn + zypper, non-portable.
;;; Verdict: EXHAUSTED — DISTRO_SPECIFIC.

;;; --- tmpstali (#13865) ---
;;; DISTRO_SPECIFIC: Part of tmplinux suite; creates Stali containers.
;;; Depends on systemd-nspawn for container management.
;;; A1: Package shell scripts — systemd-nspawn required.
;;; A2: Adapt to Guix System containers — complete rewrite.
;;; A3: Skip — systemd-specific container tool.
;;; Verdict: EXHAUSTED — DISTRO_SPECIFIC.

;;; --- tmpgentoo (#13867) ---
;;; DISTRO_SPECIFIC: Part of tmplinux suite; creates Gentoo containers.
;;; Depends on systemd-nspawn for container management.
;;; A1: Package shell scripts — systemd-nspawn required.
;;; A2: Adapt to Guix System containers — complete rewrite.
;;; A3: Skip — systemd-specific container tool.
;;; Verdict: EXHAUSTED — DISTRO_SPECIFIC.

;;; --- deepin-wine10-stable (#13889) ---
;;; PROPRIETARY_BINARY: Deepin's Wine 10 fork.
;;; Distributed as prebuilt binaries with undocumented patches.
;;; A1: Build from source — source not publicly available with patches.
;;; A2: Repackage binary — proprietary license prohibits redistribution.
;;; A3: Use upstream Wine — Guix already has Wine packages.
;;; Verdict: EXHAUSTED — PROPRIETARY_BINARY.

;;; --- linuxqq-nt-bwrap (#11823) ---
;;; PROPRIETARY: Tencent QQ messenger with bwrap sandbox.
;;; Proprietary binary, custom Tencent license.
;;; A1: Repackage binary — proprietary license.
;;; A2: Source build — no source available.
;;; A3: Use open alternatives — no compatible QQ client exists.
;;; Verdict: EXHAUSTED — PROPRIETARY.

;;; --- wechat-universal-bwrap (#11725) ---
;;; PROPRIETARY: Tencent WeChat with bwrap sandbox.
;;; Proprietary binary, custom WeChat license.
;;; A1: Repackage binary — proprietary license.
;;; A2: Source build — no source available.
;;; A3: Use Matrix bridge — different approach entirely.
;;; Verdict: EXHAUSTED — PROPRIETARY.

;;; --- astral-bin (#13896) ---
;;; NON_FREE_LICENSE: P2P VPN client built on EasyTier.
;;; License: CC-BY-NC-ND 4.0 (non-commercial, no derivatives).
;;; A1: Package binary — license prohibits redistribution.
;;; A2: Build from source — source under non-free license.
;;; A3: Use WireGuard — open alternative for VPN.
;;; Verdict: EXHAUSTED — NON_FREE_LICENSE.

;;; --- danxi (#13884) ---
;;; FLUTTER_UNSUPPORTED: Fudan University campus app.
;;; Built with Flutter/Dart; Guix lacks Flutter SDK packaging.
;;; A1: Package Flutter SDK — massive, complex toolchain.
;;; A2: Build Linux desktop from source — requires Flutter.
;;; A3: No binary releases for Linux available.
;;; Verdict: EXHAUSTED — FLUTTER_UNSUPPORTED.

;;; --- deemix-gui (#13851) ---
;;; ELECTRON_APP: Music downloader GUI using Electron.
;;; npm/webpack build with deep node_modules dependency tree.
;;; A1: Electron build — Guix lacks Electron packaging infrastructure.
;;; A2: Binary repack — Electron binary includes Chromium (1GB+).
;;; A3: Use yt-dlp CLI — alternative tool for music downloading.
;;; Verdict: EXHAUSTED — ELECTRON_APP.

;;; --- rancher-desktop (#10658) ---
;;; ELECTRON_COMPLEX: Kubernetes management tool (Electron+Go).
;;; Bundles K3s, containerd, QEMU, docker CLI, helm, kubectl.
;;; A1: Electron build — npm + Go hybrid, massive dep tree.
;;; A2: Binary repack — 500MB+ AppImage with bundled K8s tooling.
;;; A3: Use kubectl/helm/k3s separately — all can be packaged individually.
;;; Verdict: EXHAUSTED — ELECTRON_COMPLEX.

;;; --- firefox-nightly-i18n-pt-br (#13929) ---
;;; NIGHTLY_UNSTABLE: Firefox Nightly Brazilian Portuguese language pack.
;;; Version changes daily; depends on firefox-nightly not in Guix.
;;; A1: Package XPI — version changes daily, not reproducible.
;;; A2: Use Guix IceCat i18n — different browser variant.
;;; A3: Pin a nightly version — defeats purpose of nightly builds.
;;; Verdict: EXHAUSTED — NIGHTLY_UNSTABLE.

;;; --- lib32-libxml2-legacy (#13920) ---
;;; MULTILIB_UNSUPPORTED: 32-bit legacy libxml2.
;;; Guix does not support lib32/multilib packaging convention.
;;; A1: Cross-compile for i686 — not lib32 compatible.
;;; A2: Guix already has libxml2 — only need 32-bit for specific apps.
;;; A3: Orphaned in AUR — no upstream maintainer.
;;; Verdict: EXHAUSTED — MULTILIB_UNSUPPORTED.

;;; --- editcp (#10708) ---
;;; GO_QT_COMPLEX: Ham radio codeplug editor (Go+Qt5).
;;; Uses therecipe/qt Go bindings with complex CGo build.
;;; A1: go-build-system — therecipe/qt requires full Qt5 + CGo linking.
;;; A2: qt5-webengine dependency — massive chromium-based component.
;;; A3: Last updated 2022 — possibly unmaintained.
;;; Verdict: EXHAUSTED — GO_QT_COMPLEX.

;;; --- ags-hyprpanel-git (#8388) ---
;;; HYPRLAND_ECOSYSTEM: Hyprland status bar panel.
;;; Requires AGS (Aylur's GTK Shell), libastal ecosystem.
;;; A1: Package AGS + libastal — 10+ interdependent libraries.
;;; A2: npm build dependencies — TypeScript/GJS, npm ecosystem.
;;; A3: No stable releases — git-only, rapidly changing API.
;;; Verdict: EXHAUSTED — HYPRLAND_ECOSYSTEM.

;;; --- mealie (#7528) ---
;;; NPM_COMPLEX: Self-hosted recipe manager (Python+Node.js).
;;; Dual build stack: Python backend + Nuxt.js/Vue frontend.
;;; A1: Python backend only — frontend required for functionality.
;;; A2: npm build for frontend — deep node_modules dependency tree.
;;; A3: Docker distribution only — no standalone binary.
;;; Verdict: EXHAUSTED — NPM_COMPLEX.

;;; --- sonic-desktop-interface (#11711) ---
;;; KDE_FORK_COMPLEX: Custom desktop environment (KDE Plasma fork).
;;; Fork/reskin of plasma-desktop with custom sonic-win/sonic-workspace.
;;; A1: Package as KDE addon — conflicts with plasma-desktop.
;;; A2: Full KDE fork — 60+ dependencies, unclear differentiation.
;;; A3: Very new project (Dec 2025) — sustainability uncertain.
;;; Verdict: EXHAUSTED — KDE_FORK_COMPLEX.
