;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260413aa
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages from general queue:
;;;   - 0 recipes created
;;;   - 30 re-blocked with concrete terminal reasons
;;;
;;; Re-blocked (30):
;;;   lib32-xrizer (#256) — MULTILIB_UNSUPPORTED
;;;   chromium-gost (#757) — INFEASIBLE_BUILD
;;;   qt6-base-hifps (#939) — FULL_QT6_REBUILD
;;;   plasma-workspace-povd (#2890) — FULL_KDE_REBUILD
;;;   csharpier (#925) — DOTNET_ECOSYSTEM
;;;   discord-chat-exporter-plus-cli (#3117) — DOTNET_ECOSYSTEM
;;;   opentabletdriver-git (#3233) — DOTNET_ECOSYSTEM
;;;   obs-scrab (#3244) — OBS_NOT_IN_GUIX
;;;   obs-vnc (#3245) — OBS_NOT_IN_GUIX
;;;   yay-sys-tray-git (#3259) — ARCH_SPECIFIC
;;;   scap-security-guide (#3239) — DISTRO_SPECIFIC
;;;   mingw-w64-zlib-ng (#3363) — CROSS_COMPILATION_TARGET
;;;   archforge (#3419) — ARCH_SPECIFIC
;;;   mx-samba-config (#3429) — DISTRO_SPECIFIC
;;;   river-bedload-git (#3209) — ZIG_NOT_IN_GUIX
;;;   rockbox-zig-bin (#3413) — ZIG_NOT_IN_GUIX
;;;   xlibre-video-intel-bin (#3227) — NO_BUILDABLE_SOURCE
;;;   wiznoteplus-bin (#3213) — STALE_DEPRECATED_DEPS
;;;   fluidplug-git (#3352) — LICENSE_UNCLEAR
;;;   python-anchor-kr-git (#3246) — ABANDONED_UNCLEAR_LICENSE
;;;   conky-colors-git (#3249) — DEPRECATED_DEPS
;;;   oopz (#3480) — ELECTRON_PROPRIETARY
;;;   dropdeck-git (#3260) — QUICKSHELL_NOT_IN_GUIX
;;;   qtarcan-git (#3269) — ARCAN_NOT_IN_GUIX
;;;   radicle-explorer (#3370) — NPM_ECOSYSTEM
;;;   radicle-explorer-git (#3372) — NPM_ECOSYSTEM
;;;   rofi-polkit-agent-git (#3237) — MISSING_DEP_CHAIN
;;;   kimaki (#3359) — NPM_ECOSYSTEM_STALE
;;;   nodejs-markdown-toc (#3385) — NPM_ECOSYSTEM_STALE
;;;   llvm-cbe-git (#3258) — LLVM_VERSION_MISMATCH
;;;
;;; See recipe-resolver-260413aa-blocked-notes.scm for detailed analysis.

(define-module (gaurix packages recipe-resolver-260413aa))

;;; No recipes in this pass — all 30 packages re-blocked with terminal reasons.
;;; See blocked-notes for per-package analysis with 3+ approaches attempted.
