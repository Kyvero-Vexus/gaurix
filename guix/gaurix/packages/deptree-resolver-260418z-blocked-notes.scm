;;; Notes for deptree-resolver-260418z
;;; 7 packages moved to FAILED status
;;; 0 packages remain BLOCKED
;;;
;;; === FAILED packages ===
;;; freedom (#16194): DISTRO_SPECIFIC: DFSG metapackage that conflicts with non-free Arch packages; Guix is already free-software-only by design
;;; omarchy (#16143): PLACEHOLDER_PACKAGE: version 0.0.0, no source/content, placeholder until DHH's official Hyprland setup release
;;; 8188eu-dkms-git (#16289): DKMS_MODULE: out-of-tree RTL8188EU WiFi kernel driver; Guix handles kernel modules via operating-system config, not DKMS
;;; pacdep (#16251): DISTRO_SPECIFIC: pacman dependency lister; depends on pacman/libalpm which are Arch-specific
;;; update-mirrors (#16135): DISTRO_SPECIFIC: Arch Linux mirror updater tool; depends on Arch mirrorlist infrastructure
;;; arch-app-center (#16151): DISTRO_SPECIFIC: graphical frontend for pacman/yay; depends on Arch package management ecosystem
;;; cachy-chroot (#16127): DISTRO_SPECIFIC: CachyOS chroot helper; depends on arch-install-scripts and Arch pacstrap workflow
