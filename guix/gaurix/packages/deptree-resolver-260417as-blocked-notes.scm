;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Blocked notes for deptree-resolver-260417as
;;; 51 packages remain BLOCKED after evaluation of all 82 BLOCKED packages.
;;;
;;; 31 packages resolved:
;;;   - 21 new binary recipes in deptree-resolver-260417as.scm
;;;   - 10 marked ALREADY_IN_GUIX (linux-firmware split packages)
;;;
;;; Blocked categories:
;;;   PROPRIETARY_LICENSE (9): fonts-apple, otf-apple-pingfang,
;;;     otf-apple-pingfang-relaxed, otf-apple-pingfang-ui,
;;;     ttf-ms-office365, xilinx-ise, aiot-ide, starsector,
;;;     libfprint-2-tod1-broadcom
;;;   ARCH_SPECIFIC (5): pacwall-git, asp, dude-bin, arch-shell,
;;;     pamac-all
;;;   DKMS_UNSUPPORTED (3): mt76-dkms-git, ntsync-dkms,
;;;     rtl8821ce-dkms-git
;;;   COMPLEX_ECOSYSTEM (3): godot-double-mono, python-torchaudio-rocm,
;;;     odoo18-nightly
;;;   COMPLEX_DEPS (24): code-server-marketplace, devkitty-git,
;;;     gdrcopy, parus, lib32-amdvlk-bin, vim-youcompleteme-git,
;;;     syncthingtray, gksu, datagrip-jre, wasistlos, deezer,
;;;     puddletag, vscodium-bin-marketplace, nautilus-typeahead,
;;;     subliminal, chiaki, winscp, ladybird-git, cdesktopenv,
;;;     spicetify-themes-git, floorp, apparmor.d-git, asf,
;;;     mkchromecast-git, ipfs-desktop, qtutilities-qt6
;;;   PROPRIETARY_LICENSE (1): brother-mfc-j5720dw
;;;   SOURCE_UNAVAILABLE (3): arch-silence-grub-theme-git,
;;;     selectdefaultapplication-git, scribus-svn
;;;   LEGAL_ISSUES (1): deemix-gui-appimage
;;;
;;; Approaches tried for hard-blocked packages:
;;;
;;; fonts-apple/otf-apple-pingfang*: Apple font EULA prohibits
;;;   redistribution; no legal way to package.
;;; ttf-ms-office365: Microsoft Office font license prohibits
;;;   redistribution.
;;; xilinx-ise/aiot-ide: Proprietary tools requiring manual download
;;;   with EULA acceptance; no redistributable download URL.
;;; starsector: Commercial game requiring purchase.
;;; pacwall-git/asp/dude-bin/arch-shell/pamac-all: Tools that
;;;   directly depend on pacman/libalpm/devtools infrastructure.
;;; mt76-dkms-git/ntsync-dkms/rtl8821ce-dkms-git: DKMS kernel
;;;   modules; mt76 and ntsync are upstream in recent kernels.
;;; godot-double-mono: Requires .NET/Mono SDK for Godot build.
;;; python-torchaudio-rocm: ROCm ecosystem (100+ packages) not
;;;   available in Guix.
;;; odoo18-nightly: Massive ERP with 500+ Python dependencies.
;;; floorp: Firefox fork requiring full Mozilla build system.
;;; ladybird-git: Experimental browser with custom engine build.
