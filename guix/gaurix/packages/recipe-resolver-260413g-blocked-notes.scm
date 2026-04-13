;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Blocked notes for recipe-resolver-260413g
;;; 21 packages evaluated with concrete blocking reasons.
;;; Each entry documents the primary blocker and next action.

(define-module (gaurix packages recipe-resolver-260413g-blocked-notes))

;;; ── new-lg4ff-dkms-git (#11866) ────────────────────────
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN in recipe-resolver-260413g
;;; Detail: DKMS kernel module for Logitech force feedback; requires linux-module-build-system integration with specific kernel headers; A1: package as linux-module — needs kernel version pinning and out-of-tree module build support; A2: use copy-build-system for source only — insufficient, module must be compiled; next: implement linux-module-build-system recipe with configurable kernel dependency

;;; ── vk-hdr-layer-kwin6-git (#11870) ────────────────────
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN in recipe-resolver-260413g
;;; Detail: Vulkan HDR WSI layer (Xaver Hugl's KWin 6 fork); requires Vulkan SDK headers and KWin 6 specific patches; A1: package via meson-build-system — needs vulkan-headers and wayland-protocols from Plasma 6; A2: wait for upstream merge into main VK_hdr_layer — fork-specific, rapidly changing; next: package when Plasma 6 Vulkan deps are resolved in Guix

;;; ── intel-oneapi-basekit-2025 (#11871) ─────────────────
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN in recipe-resolver-260413g
;;; Detail: Intel oneAPI Base Toolkit 2025; 30GB+ binary installer with complex multi-component extraction; A1: package full toolkit via copy-build-system — massive binary, needs patchelf for 200+ ELF binaries; A2: package individual components separately — better but requires mapping internal installer structure; next: implement component-by-component extraction with patchelf fixup phase

;;; ── subtitleedit-avalonia (#11884) ─────────────────────
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN in recipe-resolver-260413g
;;; Detail: .NET Avalonia UI application; requires .NET SDK 8.0+ which is not available in Guix; A1: package via dotnet-build-system — Guix lacks dotnet-sdk package; A2: package as binary AppImage — no official AppImage release available; next: feasible when dotnet-sdk is packaged in Guix or upstream provides a static binary release

;;; ── pgadmin4-desktop (#11885) ──────────────────────────
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN in recipe-resolver-260413g
;;; Detail: Complex Python/JS hybrid with NW.js/Electron desktop wrapper; requires bundled Node.js runtime and 300+ Python/JS dependencies; A1: package Python backend + NW.js runtime — NW.js not in Guix; A2: package as Electron binary — no official Linux binary release; next: investigate packaging web-only mode with python-pgadmin4 and browser launcher

;;; ── obs-studio-liberty (#11893) ────────────────────────
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN in recipe-resolver-260413g
;;; Detail: OBS Studio fork with modified Browser Source; requires CEF (Chromium Embedded Framework) which is a massive build dependency; A1: package via cmake-build-system with CEF binary — CEF binary is 200MB+ and needs patchelf; A2: package without Browser Source — defeats purpose of liberty variant; next: feasible if CEF binary packaging is established first

;;; ── ttf-ms-win10-auto-japanese (#11902) ────────────────
;;; Status: BLOCKED: SOURCE_UNAVAILABLE in recipe-resolver-260413g
;;; Detail: Microsoft Windows 10 Japanese TrueType fonts; requires Windows 10 ISO as source; no standalone download URL available; A1: extract from Windows ISO — requires user-supplied ISO file (EULA restriction); A2: provide recipe requiring local source — possible but non-automatable; next: create recipe-with-local-source pattern if legal review passes

;;; ── ttf-ms-win10-auto-korean (#11903) ──────────────────
;;; Status: BLOCKED: SOURCE_UNAVAILABLE in recipe-resolver-260413g
;;; Detail: Microsoft Windows 10 Korean TrueType fonts; requires Windows 10 ISO as source; no standalone download URL available; A1: extract from Windows ISO — requires user-supplied ISO file (EULA restriction); A2: provide recipe requiring local source — possible but non-automatable; next: create recipe-with-local-source pattern if legal review passes

;;; ── ttf-ms-win10-auto-sea (#11904) ─────────────────────
;;; Status: BLOCKED: SOURCE_UNAVAILABLE in recipe-resolver-260413g
;;; Detail: Microsoft Windows 10 Southeast Asian TrueType fonts; requires Windows 10 ISO as source; no standalone download URL available; A1: extract from Windows ISO — requires user-supplied ISO file (EULA restriction); A2: provide recipe requiring local source — possible but non-automatable; next: create recipe-with-local-source pattern if legal review passes

;;; ── ttf-ms-win10-auto-thai (#11905) ────────────────────
;;; Status: BLOCKED: SOURCE_UNAVAILABLE in recipe-resolver-260413g
;;; Detail: Microsoft Windows 10 Thai TrueType fonts; requires Windows 10 ISO as source; no standalone download URL available; A1: extract from Windows ISO — requires user-supplied ISO file (EULA restriction); A2: provide recipe requiring local source — possible but non-automatable; next: create recipe-with-local-source pattern if legal review passes

;;; ── ttf-ms-win10-auto-zh_cn (#11906) ───────────────────
;;; Status: BLOCKED: SOURCE_UNAVAILABLE in recipe-resolver-260413g
;;; Detail: Microsoft Windows 10 Simplified Chinese TrueType fonts; requires Windows 10 ISO as source; no standalone download URL available; A1: extract from Windows ISO — requires user-supplied ISO file (EULA restriction); A2: provide recipe requiring local source — possible but non-automatable; next: create recipe-with-local-source pattern if legal review passes

;;; ── ttf-ms-win10-auto-zh_tw (#11907) ───────────────────
;;; Status: BLOCKED: SOURCE_UNAVAILABLE in recipe-resolver-260413g
;;; Detail: Microsoft Windows 10 Traditional Chinese TrueType fonts; requires Windows 10 ISO as source; no standalone download URL available; A1: extract from Windows ISO — requires user-supplied ISO file (EULA restriction); A2: provide recipe requiring local source — possible but non-automatable; next: create recipe-with-local-source pattern if legal review passes

;;; ── ttf-ms-win10-auto-other (#11908) ───────────────────
;;; Status: BLOCKED: SOURCE_UNAVAILABLE in recipe-resolver-260413g
;;; Detail: Microsoft Windows 10 Other TrueType fonts; requires Windows 10 ISO as source; no standalone download URL available; A1: extract from Windows ISO — requires user-supplied ISO file (EULA restriction); A2: provide recipe requiring local source — possible but non-automatable; next: create recipe-with-local-source pattern if legal review passes

;;; ── karukan (#11921) ───────────────────────────────────
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN in recipe-resolver-260413g
;;; Detail: Japanese IME with neural kana-kanji conversion engine and fcitx5 integration; requires downloading and integrating neural language models (500MB+); A1: package via cmake-build-system with fcitx5 deps — model download needed at build time; A2: split into karukan-engine and karukan-models — model packaging needs special handling; next: investigate model packaging approach and fcitx5 integration in Guix

;;; ── cisco-secure-client (#11922) ───────────────────────
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN in recipe-resolver-260413g
;;; Detail: Cisco AnyConnect VPN client; no public download URL — requires Cisco account/license for download; A1: package binary .deb — no stable public URL; A2: provide recipe requiring local source file — possible but non-automatable; next: create local-source recipe pattern for enterprise software requiring account-gated downloads

;;; ── davinci-resolve-studio (#11928) ────────────────────
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN in recipe-resolver-260413g
;;; Detail: Blackmagic DaVinci Resolve Studio; requires manual download from Blackmagic website (account + EULA acceptance required); A1: package extracted binary — no stable public download URL; A2: provide recipe requiring local source — possible but needs 2.5GB manual download; next: create local-source recipe with extraction instructions and patchelf fixup

;;; ── yabridge-wine10-git (#11947) ───────────────────────
;;; Status: BLOCKED: DEP_RESOLUTION_FAILED in recipe-resolver-260413g
;;; Detail: Modern VST2/VST3 bridge requiring Wine 10.x; A1: package with wine from Guix — only Wine 9.x available; A2: bundle Wine 10 binary — version-specific Wine embedding branch not compatible with system Wine; A3: wait for Wine 10.x in Guix — upstream tracking needed; next: feasible when wine 10.x is packaged in Guix

;;; ── yabridgectl-wine10-git (#11948) ────────────────────
;;; Status: BLOCKED: DEP_RESOLUTION_FAILED in recipe-resolver-260413g
;;; Detail: Utility for managing yabridge; depends on yabridge-wine10-git which requires Wine 10.x; A1: package standalone — still depends on yabridge core; A2: wait for yabridge-wine10 — blocked by same Wine 10.x dependency; next: feasible when yabridge-wine10 is unblocked

;;; ── nullfsvfs-dkms (#11950) ────────────────────────────
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN in recipe-resolver-260413g
;;; Detail: Virtual black hole filesystem kernel module (DKMS); requires linux-module-build-system with specific kernel headers; A1: package as linux-module — needs kernel version pinning; A2: package source only — insufficient, module must be compiled against running kernel; next: implement linux-module-build-system recipe once kernel module packaging pattern is established

;;; ── sonic-win (#11979) ─────────────────────────────────
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN in recipe-resolver-260413g
;;; Detail: KWin fork with ports from kwin-wayland and bug fixes for XLibre; requires full KDE Plasma build infrastructure with custom patches; A1: package as patched kwin — requires rebuilding all of KDE Frameworks + Plasma with custom KWin; A2: package standalone — deeply integrated with Plasma session; next: feasible only with dedicated KDE Plasma packaging infrastructure

;;; ── chromium-gost (#11985) ─────────────────────────────
;;; Status: BLOCKED: NEEDS_RECIPE_DESIGN in recipe-resolver-260413g
;;; Detail: Chromium fork with Russian GOST cryptography support; requires full Chromium build (6+ hours, 50GB+ disk, 16GB+ RAM); A1: build from source via gnu-build-system — prohibitive build time and resource requirements for batch packaging; A2: package pre-built binary — no official Linux binary releases; next: feasible with dedicated Chromium build infrastructure or if upstream provides binary releases
