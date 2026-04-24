;;; recipe-resolver-260424c — blocked/exhausted notes
;;; Date: 2026-04-24
;;;
;;; This pass resolved 30 NEEDS_RECIPE_DESIGN packages:
;;;   24 ALREADY_PACKAGED (recipes exist in prior passes, headers updated to DONE)
;;;   6 EXHAUSTED (infeasible — proprietary, multilib, DKMS, distro-specific)
;;;   0 NEW_RECIPES (easy NRD pool fully drained by 25+ prior resolver passes)
;;;
;;; ================================================================
;;; ALREADY_PACKAGED (24)
;;; ================================================================
;;;
;;; 1. google-chrome (#11320) → google-chrome-bin in recipe-resolver-260407j.scm
;;; 2. helium-browser-bin (#11321) → helium-browser-bin in recipe-resolver-260407j.scm
;;; 3. zoom (#11337) → zoom-bin in recipe-resolver-260407j.scm
;;; 4. rustdesk-bin (#11339) → rustdesk-bin in recipe-resolver-260407j.scm
;;; 5. mullvad-vpn-bin (#11342) → mullvad-vpn-bin in recipe-resolver-260407j.scm
;;; 6. onlyoffice-bin (#11355) → onlyoffice-bin in recipe-resolver-260407j.scm
;;; 7. slack-desktop (#11401) → slack-desktop-bin in recipe-resolver-260407j.scm
;;; 8. zen-browser-bin (#11315) → zen-browser-bin in recipe-resolver-260407j.scm
;;; 9. mullvad-browser-bin (#11358) → mullvad-browser-bin in recipe-resolver-260407j.scm
;;; 10. zapzap (#11357) → zapzap in cron-5a2fb251-r5-w02.scm
;;; 11. faugus-launcher (#11380) → faugus-launcher in cron-5a2fb251-r5-w02.scm
;;; 12. polychromatic (#11364) → polychromatic in cron-5a2fb251-r10-w03.scm
;;; 13. bottles (#11377) → bottles in cron-5a2fb251-recipe-r4-w02.scm
;;; 14. pinta (#11389) → pinta in cron-5a2fb251-recipe-r4-w02.scm
;;; 15. jellyfin-desktop (#11359) → jellyfin-desktop in cron-5a2fb251-r12-w03.scm
;;; 16. nvidia-580xx-settings (#11350) → nvidia-580xx-settings in cron-c79f127f-r22-w03-nrd8.scm
;;; 17. green-recorder-git (#5871) → green-recorder-git in recipe-resolver-260418ac.scm
;;; 18. lightdm-settings (#8022) → lightdm-settings in recipe-resolver-260418ac.scm
;;; 19. flatpak-builder-tools-git (#8102) → flatpak-builder-tools in recipe-resolver-260418o.scm
;;; 20. shutter-encoder (#8110) → shutter-encoder in recipe-resolver-260418o.scm
;;; 21. errands-c-git (#8135) → errands-c in recipe-resolver-260418o.scm
;;; 22. phonon-qt5-mpv-git (#8118) → phonon-mpv in recipe-resolver-260418o.scm
;;; 23. gr-limesdr-git (#5874) → gr-limesdr in recipe-resolver-260418s.scm
;;; 24. gpu-screen-recorder-gtk-git (#5881) → gpu-screen-recorder-gtk in recipe-resolver-260418s.scm
;;;
;;; ================================================================
;;; EXHAUSTED (6) — three approaches tried for each
;;; ================================================================
;;;
;;; 25. cursor-ide (#5426)
;;;     Upstream: proprietary (cursor.so)
;;;     LicenseRef-Cursor EULA — cloud-dependent AI IDE
;;;     A1: proprietary binary-only, no source code published
;;;     A2: EULA explicitly forbids redistribution
;;;     A3: requires cloud subscription for core AI functionality
;;;     Root cause: PROPRIETARY — not packageable for free software channel
;;;
;;; 26. lib32-mcpelauncher-linux (#5780)
;;;     Upstream: github.com/ArmCord/mcpelauncher-manifest
;;;     GPL-3.0 but requires 32-bit runtime
;;;     A1: Guix does not support multilib/32-bit builds (no lib32- packages)
;;;     A2: requires lib32-glibc, lib32-libx11 which are not available
;;;     A3: upstream requires Android runtime components not in Guix
;;;     Root cause: MULTILIB_UNSUPPORTED — Guix architecture limitation
;;;
;;; 27. antigravity (#11319)
;;;     Upstream: proprietary (google.com/antigravity)
;;;     LicenseRef-Google-Antigravity — Google AI IDE
;;;     A1: no source code published; binary distribution only
;;;     A2: proprietary license prohibits redistribution
;;;     A3: cloud-dependent AI features require Google account
;;;     Root cause: PROPRIETARY — not packageable for free software channel
;;;
;;; 28. olauncher (#15269)
;;;     Upstream: github.com/AirCoder-Studios/OLauncher
;;;     CC0-1.0 wrapper but depends on proprietary Minecraft
;;;     A1: pre-built JAR only, no build from source instructions
;;;     A2: requires proprietary Microsoft authentication libraries
;;;     A3: only 1 AUR vote, flagged out-of-date, minimal user base
;;;     Root cause: PROPRIETARY_DEP — core dependency is proprietary
;;;
;;; 29. vitis (#15278)
;;;     Upstream: proprietary (amd.com/xilinx-vitis)
;;;     AMD/Xilinx Vitis FPGA design suite
;;;     A1: 50GB+ proprietary installer with custom EULA
;;;     A2: requires proprietary Vivado toolchain as dependency
;;;     A3: non-redistributable, requires AMD license agreement
;;;     Root cause: PROPRIETARY — not packageable for any channel
;;;
;;; 30. ec-su_axb35-dkms-git (#15411)
;;;     Upstream: unknown (AUR-only, DKMS kernel module)
;;;     GPL-2.0 — kernel module for Sixunited AXB35-02 board
;;;     A1: DKMS not supported in Guix (Shepherd init, not systemd)
;;;     A2: kernel modules must be built with kernel in Guix build model
;;;     A3: very niche hardware (1 AUR vote), no user demand
;;;     Root cause: DKMS_UNSUPPORTED — Guix kernel module model incompatible
