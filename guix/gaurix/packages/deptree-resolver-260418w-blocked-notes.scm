;;; Notes for deptree-resolver-260418w
;;; 29 packages moved to FAILED status
;;; 0 packages remain BLOCKED
;;;
;;; === FAILED packages ===
;;; corefreq-dkms (#16106): DKMS_MODULE: kernel module; Guix handles kernel modules via operating-system config
;;; snd-pcsp-dkms (#16165): DKMS_MODULE: PC speaker kernel module; in-tree driver, no separate packaging needed
;;; sway-desktop-env-hook (#15493): ARCH_SPECIFIC: pacman hook; Guix uses service declarations, not post-install hooks
;;; sway-desktop-unsupportedgpu-hook (#15494): ARCH_SPECIFIC: pacman hook; GPU detection handled by Guix services
;;; vesktop-spoof-pacman-hook (#15505): ARCH_SPECIFIC: pacman hook; no equivalent concept in Guix
;;; xtables-addons-dkms (#16501): DKMS_MODULE: netfilter extension modules; requires kernel build infrastructure
;;; com.qq.weixin.work.deepin (#15919): PROPRIETARY_ECOSYSTEM: requires Deepin Wine compatibility layer; proprietary binary
;;; ddcci-driver-linux-dkms-git (#15757): DKMS_MODULE: DDC/CI kernel module; requires kernel headers/DKMS
;;; gpd-fan-driver-dkms-git (#16130): DKMS_MODULE: GPD fan control kernel module; out-of-tree module
;;; hid-asus-mouse-dkms-git (#16133): DKMS_MODULE: ASUS HID kernel module; Guix handles drivers via OS config
;;; nvm-fish (#8722): ECOSYSTEM_MISMATCH: nvm conflicts with Guix profile model; Fish shell wrapper
;;; ananicy-cpp-openrc (#15951): INIT_SYSTEM_MISMATCH: OpenRC init script; Guix uses Shepherd
;;; gentoo-sources (#16163): DISTRO_SPECIFIC: Gentoo kernel source packaging; not applicable to Guix
;;; lib32-glibc-git (#15649): MULTILIB_UNSUPPORTED: 32-bit glibc; fundamental architecture mismatch with Guix
;;; remmina-plugin-teamviewer (#8083): PROPRIETARY_DEP: requires proprietary TeamViewer at runtime
;;; paczf (#15822): SOURCE_UNAVAILABLE: no upstream URL in AUR metadata; pacman/paru TUI frontend
;;; lib32-libxpm (#16491): MULTILIB_UNSUPPORTED: 32-bit libXpm; Guix does not support multilib
;;; lib32-wayland-git (#16154): MULTILIB_UNSUPPORTED: 32-bit Wayland; Guix does not support multilib
;;; linux-zencjk-headers (#16065): CUSTOM_KERNEL_DEP: headers coupled to linux-zencjk build
;;; lib32-vulkan-icd-loader-git (#15581): MULTILIB_UNSUPPORTED: Guix does not support 32-bit compatibility libraries
;;; homeassistant-supervised (#15946): INIT_SYSTEM_MISMATCH: requires systemd+Docker; Guix System uses Shepherd
;;; python-google-cloud-texttospeech (#16293): DEEP_DEPENDENCY_TREE: 20+ transitive Google Cloud deps not in Guix
;;; linux-xanmod-bore-headers (#16515): CUSTOM_KERNEL_DEP: headers coupled to linux-xanmod-bore build
;;; linux-zencjk (#16064): CUSTOM_KERNEL: ZEN kernel with CJK patches; full kernel build infrastructure out of scope
;;; git-gl (#8081): IMPRACTICAL_FORK: GitLab Git fork; Guix already provides git
;;; linux-xanmod-bore (#16514): CUSTOM_KERNEL: XanMod+BORE kernel; full kernel build infrastructure out of scope
;;; looking-glass-module-dkms-git (#15631): DKMS_MODULE: IVSHMEM kernel module; requires kernel build infrastructure
;;; linux-bcachefs-git-headers (#16304): CUSTOM_KERNEL_DEP: headers coupled to linux-bcachefs-git build
;;; linux-bcachefs-git (#16303): CUSTOM_KERNEL: bcachefs kernel fork; full kernel build infrastructure out of scope
