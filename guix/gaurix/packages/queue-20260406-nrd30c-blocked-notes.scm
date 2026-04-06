;;; Queue drain 2026-04-06 NRD30c — blocked notes for 14 re-blocked packages.
(define-module (gaurix packages queue-20260406-nrd30c-blocked-notes))

;;; ttf-ms-win11-auto (+ 7 locale variants): NONFREE_LICENSE
;;;   Microsoft Windows 11 TrueType fonts.  Licensed under Microsoft EULA
;;;   which prohibits redistribution.  Source requires FUSE-mounting a
;;;   Windows 11 evaluation ISO to extract font files.  Guix is a free
;;;   software distribution and cannot distribute non-free fonts.
;;;   A1: checked upstream — fonts only available via Windows ISO.
;;;   A2: no freely licensed alternative with same coverage.
;;;   A3: Guix has font-microsoft-core-fonts (older free-to-redistribute set).
;;;
;;; arch-update: ARCH_SPECIFIC
;;;   Arch Linux update notifier.  Depends on pacman, pacman-contrib,
;;;   archlinux-contrib, and optionally paru/yay (AUR helpers).
;;;   All dependencies are Arch-specific and meaningless on Guix.
;;;   A1: core functionality requires pacman checkupdates.
;;;   A2: no generic Linux equivalent.
;;;   A3: Guix has its own `guix pull` + `guix system reconfigure` workflow.
;;;
;;; paru-bin: ARCH_SPECIFIC
;;;   AUR helper for Arch Linux.  Depends on libalpm.so (pacman library),
;;;   makepkg, and AUR infrastructure.  Only meaningful on Arch Linux.
;;;   A1: requires pacman/libalpm (Arch-only).
;;;   A2: no generic Linux AUR equivalent.
;;;   A3: Guix has its own channel/package management.
;;;
;;; dms-shell-bin: MISSING_GUIX_DEPS
;;;   DankMaterialShell binary.  Depends on quickshell (Wayland shell
;;;   framework not in Guix) and dgop (DankMaterialShell GO Process,
;;;   custom Go daemon not in Guix).  No standalone operation possible.
;;;   A1: quickshell not in Guix, complex Qt6/Wayland build.
;;;   A2: dgop is a custom companion daemon with no Guix recipe.
;;;   A3: no alternative shell framework available.
;;;
;;; winboat-bin: PROPRIETARY_NO_SOURCE
;;;   Winboat is a commercial closed-source application (winboat.app).
;;;   No source code is available for packaging.  Binary redistribution
;;;   terms unclear.
;;;   A1: checked upstream — proprietary, no source.
;;;   A2: no FOSS alternative with same functionality.
;;;   A3: cannot redistribute without license grant.
;;;
;;; mangowm: MISSING_GUIX_DEPS
;;;   Wayland compositor.  Depends on wlroots 0.19+ and scenefx 0.4+,
;;;   neither of which are packaged in Guix (Guix has wlroots 0.17.x).
;;;   A1: wlroots 0.19 not in Guix (API-incompatible with 0.17).
;;;   A2: scenefx not packaged anywhere in Guix.
;;;   A3: no compatible wlroots version available.
;;;
;;; mediatek-mt7927-dkms: DKMS_NOT_SUPPORTED
;;;   DKMS kernel module for MediaTek MT7927 WiFi.  DKMS requires
;;;   kernel headers and out-of-tree module compilation infrastructure
;;;   that is incompatible with Guix's kernel model.
;;;   A1: DKMS not supported on Guix.
;;;   A2: driver may be in mainline Linux — check kernel version.
;;;   A3: Guix handles kernel modules through its own build system.
