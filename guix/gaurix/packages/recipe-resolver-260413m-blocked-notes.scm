;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Blocked notes for recipe-resolver-260413m
;;; 22 packages blocked with specific reason codes.

(define-module (gaurix packages recipe-resolver-260413m-blocked-notes))

;;; ── Blocked package notes ──────────────────────────────────────────

;;; 1. auracle-git (#12116)
;;;    Status: BLOCKED: DEP_RESOLUTION_FAILED
;;;    Reason: Requires libalpm (pacman library) which is Arch-specific and not available in Guix.
;;;    Approaches: A1: Checked Guix package repos for libalpm → not available. A2: libalpm is part of pacman, Arch-only. Next: Would need to package pacman/libalpm first.

;;; 2. kernel-install-for-dracut (#12117)
;;;    Status: BLOCKED: DEP_RESOLUTION_FAILED
;;;    Reason: Arch-specific systemd-boot + dracut integration using kernel-install.
;;;    Approaches: A1: Requires systemd kernel-install infrastructure. A2: dracut is not in Guix package repos. Next: Not applicable to Guix System (uses different boot management).

;;; 3. mkinitcpio-sd-numlock (#12123)
;;;    Status: BLOCKED: DEP_RESOLUTION_FAILED
;;;    Reason: Arch-specific mkinitcpio hook for enabling numlock during early boot.
;;;    Approaches: A1: mkinitcpio is Arch-specific initramfs tool, not in Guix. Next: Not applicable to Guix System.

;;; 4. hid-fanatecff-dkms (#12124)
;;;    Status: BLOCKED: DEP_RESOLUTION_FAILED
;;;    Reason: DKMS kernel module requiring kernel headers at build time.
;;;    Approaches: A1: DKMS modules need running kernel headers. A2: Guix uses a different kernel module build approach. Next: Would need kernel module build infrastructure.

;;; 5. timeshift-autosnap (#12130)
;;;    Status: BLOCKED: DEP_RESOLUTION_FAILED
;;;    Reason: Arch-specific pacman hook for Timeshift auto-snapshots before upgrades.
;;;    Approaches: A1: Uses pacman libalpm hooks, Arch-specific. Next: Not applicable outside Arch-based distributions.

;;; 6. unreal-tournament-bin (#12131)
;;;    Status: BLOCKED: SOURCE_UNAVAILABLE
;;;    Reason: Requires proprietary Unreal Tournament 99 GOTY game data from retail/GOG.
;;;    Approaches: A1: OldUnreal binaries available but game data is proprietary. A2: No free/legal download source for game assets. Next: Could package the OldUnreal patch separately if game data is provided.

;;; 7. bcachefs-kernel-dkms-git (#12139)
;;;    Status: BLOCKED: DEP_RESOLUTION_FAILED
;;;    Reason: DKMS kernel module from upstream bcachefs kernel sources.
;;;    Approaches: A1: Requires DKMS + kernel headers. A2: bcachefs is now in mainline kernel. Next: Use mainline kernel with bcachefs support instead.

;;; 8. binder_linux-dkms (#12149)
;;;    Status: BLOCKED: DEP_RESOLUTION_FAILED
;;;    Reason: Android binder kernel driver fork in DKMS format.
;;;    Approaches: A1: DKMS kernel module, requires kernel headers. A2: Used for Android container support (Waydroid). Next: Would need kernel module build infrastructure.

;;; 9. it87-dkms-git (#12151)
;;;    Status: BLOCKED: DEP_RESOLUTION_FAILED
;;;    Reason: Linux kernel driver for ITE LPC chips in DKMS format.
;;;    Approaches: A1: DKMS kernel module for hardware monitoring. A2: Requires kernel headers at build time. Next: Would need kernel module build infrastructure.

;;; 10. mozc-ut (#12153)
;;;    Status: BLOCKED: NEEDS_RECIPE_DESIGN
;;;    Reason: Complex build with protobuf, Qt, and custom UT dictionaries.
;;;    Approaches: A1: Mozc requires protobuf compiler + Qt5/6 + bazel/GYP build. A2: UT dictionary integration adds custom dictionary merging step. Next: Needs dedicated Japanese input method packaging pass.

;;; 11. lib32-srt (#12163)
;;;    Status: BLOCKED: DEP_RESOLUTION_FAILED
;;;    Reason: 32-bit Secure Reliable Transport library; Guix lacks multilib/32-bit library support.
;;;    Approaches: A1: Guix does not support multilib (32-bit on 64-bit). Next: Blocked until Guix gains multilib support.

;;; 12. lib32-vmaf (#12164)
;;;    Status: BLOCKED: DEP_RESOLUTION_FAILED
;;;    Reason: 32-bit VMAF library; Guix lacks multilib/32-bit library support.
;;;    Approaches: A1: Guix does not support multilib. Next: Blocked until Guix gains multilib support.

;;; 13. lib32-lame (#12166)
;;;    Status: BLOCKED: DEP_RESOLUTION_FAILED
;;;    Reason: 32-bit LAME MP3 encoder; Guix lacks multilib/32-bit library support.
;;;    Approaches: A1: Guix does not support multilib. Next: Blocked until Guix gains multilib support.

;;; 14. lib32-gsm (#12167)
;;;    Status: BLOCKED: DEP_RESOLUTION_FAILED
;;;    Reason: 32-bit GSM speech compression library; Guix lacks multilib/32-bit library support.
;;;    Approaches: A1: Guix does not support multilib. Next: Blocked until Guix gains multilib support.

;;; 15. lib32-libass (#12168)
;;;    Status: BLOCKED: DEP_RESOLUTION_FAILED
;;;    Reason: 32-bit libass subtitle rendering; Guix lacks multilib/32-bit library support.
;;;    Approaches: A1: Guix does not support multilib. Next: Blocked until Guix gains multilib support.

;;; 16. lib32-x264 (#12170)
;;;    Status: BLOCKED: DEP_RESOLUTION_FAILED
;;;    Reason: 32-bit x264 video encoder; Guix lacks multilib/32-bit library support.
;;;    Approaches: A1: Guix does not support multilib. Next: Blocked until Guix gains multilib support.

;;; 17. lib32-l-smash (#12171)
;;;    Status: BLOCKED: DEP_RESOLUTION_FAILED
;;;    Reason: 32-bit L-SMASH MP4 muxer; Guix lacks multilib/32-bit library support.
;;;    Approaches: A1: Guix does not support multilib. Next: Blocked until Guix gains multilib support.

;;; 18. lib32-libnuma (#12172)
;;;    Status: BLOCKED: DEP_RESOLUTION_FAILED
;;;    Reason: 32-bit libnuma NUMA support; Guix lacks multilib/32-bit library support.
;;;    Approaches: A1: Guix does not support multilib. Next: Blocked until Guix gains multilib support.

;;; 19. oscgoesbrrr (#12181)
;;;    Status: BLOCKED: SOURCE_UNAVAILABLE
;;;    Reason: VRChat haptics tool, Windows/Unity-oriented, no Linux binary available.
;;;    Approaches: A1: Primary target is Windows with Unity runtime. A2: No Linux build or binary in releases. Next: Would need Wine wrapper or native port.

;;; 20. hyperfluent-grub-theme-arch (#12184)
;;;    Status: BLOCKED: DEP_RESOLUTION_FAILED
;;;    Reason: Arch-branded GRUB theme with Arch-specific installation scripts.
;;;    Approaches: A1: Theme files contain Arch-specific branding and paths. A2: Installation uses Arch-specific grub-mkconfig paths. Next: Not applicable to Guix System (uses GRUB differently).

;;; 21. lib32-xrizer-git (#12200)
;;;    Status: BLOCKED: DEP_RESOLUTION_FAILED
;;;    Reason: 32-bit xrizer library; Guix lacks multilib/32-bit library support.
;;;    Approaches: A1: Guix does not support multilib. Next: Blocked until Guix gains multilib support.

;;; 22. paperless-ngx-venv (#12201)
;;;    Status: BLOCKED: NEEDS_RECIPE_DESIGN
;;;    Reason: Complex Django application with 50+ Python dependencies in virtualenv.
;;;    Approaches: A1: Requires packaging 50+ Python deps not yet in Guix. A2: Uses Redis, PostgreSQL, and OCR toolchain (tesseract). Next: Needs dedicated Python dependency packaging pass.
