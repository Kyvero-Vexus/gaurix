;;; recipe-resolver-260418u --- blocked notes
;;;
;;; 27 packages NEEDS_RECIPE_DESIGN_EXHAUSTED:
;;;
;;;  1. sway-desktop-env-hook (15493)
;;;     ARCH_SPECIFIC_HOOK: pacman install hook for sway-desktop; Arch-specific.
;;;     A1: no equivalent concept in Guix (Shepherd services, not hooks).
;;;     A2: hook logic is inline in PKGBUILD, no standalone source.
;;;     A3: functionality handled by Guix system configuration.
;;;
;;;  2. sway-desktop-unsupportedgpu-hook (15494)
;;;     ARCH_SPECIFIC_HOOK: pacman hook for GPU detection in sway.
;;;     A1: no Guix hook equivalent.
;;;     A2: no standalone source.
;;;     A3: GPU detection handled by mesa/drm at OS level.
;;;
;;;  3. vesktop-spoof-pacman-hook (15505)
;;;     ARCH_SPECIFIC_HOOK: pacman hook for Vesktop.
;;;     A1: no Guix hook equivalent.
;;;     A2: inline PKGBUILD only.
;;;     A3: Vesktop packaged separately without hooks.
;;;
;;;  4. lib32-vulkan-icd-loader-git (15581)
;;;     MULTILIB_UNSUPPORTED: 32-bit Vulkan ICD loader.
;;;     A1: cross-compilation infra needed.
;;;     A2: no multilib model in Guix.
;;;     A3: use native-arch Vulkan package.
;;;
;;;  5. looking-glass-module-dkms-git (15631)
;;;     DKMS_UNSUPPORTED: KVMFR kernel module for Looking Glass.
;;;     A1: DKMS not supported in Guix.
;;;     A2: requires kernel-loadable-modules in OS config.
;;;     A3: Looking Glass client available separately.
;;;
;;;  6. lib32-glibc-git (15649)
;;;     MULTILIB_UNSUPPORTED: 32-bit glibc.
;;;     A1: fundamental architecture mismatch with Guix.
;;;     A2: would require parallel glibc.
;;;     A3: use containerized 32-bit environment.
;;;
;;;  7. ddcci-driver-linux-dkms-git (15757)
;;;     DKMS_UNSUPPORTED: DDC/CI monitor control kernel module.
;;;     A1: DKMS not supported.
;;;     A2: requires kernel build infra.
;;;     A3: may be merged into mainline kernel.
;;;
;;;  8. com.qq.weixin.work.deepin (15919)
;;;     PROPRIETARY_ECOSYSTEM: WeChat Work via Deepin Wine.
;;;     A1: Deepin Wine not in Guix.
;;;     A2: proprietary WeChat binary.
;;;     A3: license prohibits redistribution.
;;;
;;;  9. homeassistant-supervised (15946)
;;;     INCOMPATIBLE_INIT: requires systemd + Docker.
;;;     A1: Guix uses Shepherd not systemd.
;;;     A2: Docker integration complex.
;;;     A3: use Home Assistant Core via Python instead.
;;;
;;; 10. linux-zencjk (16064)
;;;     CUSTOM_KERNEL_INFEASIBLE: custom kernel with CJK patches.
;;;     A1: requires make-linux-libre infrastructure.
;;;     A2: interactive config selection.
;;;     A3: 30+ min build, 10GB+ disk; batch infeasible.
;;;
;;; 11. linux-zencjk-headers (16065)
;;;     DEP_BLOCKED: depends on linux-zencjk.
;;;     A1: parent kernel cannot be packaged.
;;;     A2: headers coupled to kernel build.
;;;     A3: no independent packaging path.
;;;
;;; 12. corefreq-dkms (16106)
;;;     DKMS_UNSUPPORTED: CPU monitoring kernel module.
;;;     A1: DKMS not supported.
;;;     A2: requires kernel headers.
;;;     A3: use kernel-loadable-modules in OS config.
;;;
;;; 13. gpd-fan-driver-dkms-git (16130)
;;;     DKMS_UNSUPPORTED: GPD fan control kernel module.
;;;     A1: DKMS not supported.
;;;     A2: out-of-tree module.
;;;     A3: niche hardware; submit upstream to kernel.org.
;;;
;;; 14. hid-asus-mouse-dkms-git (16133)
;;;     DKMS_UNSUPPORTED: ASUS mouse HID kernel module.
;;;     A1: DKMS not supported.
;;;     A2: requires kernel build infra.
;;;     A3: submit upstream to linux-input subsystem.
;;;
;;; 15. lib32-wayland-git (16154)
;;;     MULTILIB_UNSUPPORTED: 32-bit Wayland.
;;;     A1: no multilib model.
;;;     A2: cross-compilation needed.
;;;     A3: use native architecture Wayland.
;;;
;;; 16. gentoo-sources (16163)
;;;     DISTRO_SPECIFIC: Gentoo kernel sources.
;;;     A1: Guix has own kernel packaging (linux-libre).
;;;     A2: Gentoo USE flags not applicable.
;;;     A3: no cross-distro value.
;;;
;;; 17. snd-pcsp-dkms (16165)
;;;     DKMS_UNSUPPORTED: PC speaker sound kernel module.
;;;     A1: DKMS not supported.
;;;     A2: snd-pcsp already in mainline kernel.
;;;     A3: enable via kernel config, not external module.
;;;
;;; 18. python-google-cloud-texttospeech (16293)
;;;     DEEP_DEPENDENCY_TREE: 20+ transitive Google deps.
;;;     A1: massive googleapis/grpc chain not in Guix.
;;;     A2: proto-plus, google-auth, grpc need packaging.
;;;     A3: use REST API directly.
;;;
;;; 19. php-phalcon (16297)
;;;     MISSING_ECOSYSTEM: PHP C-extension; PHP + Zephir needed.
;;;     A1: PHP not well-supported in Guix.
;;;     A2: Zephir bootstrap circular dependency.
;;;     A3: entire PHP ecosystem needed first.
;;;
;;; 20. linux-bcachefs-git (16303)
;;;     OBSOLETE_UPSTREAM: bcachefs merged mainline in Linux 6.7.
;;;     A1: custom kernel infeasible in batch.
;;;     A2: bcachefs now in mainline.
;;;     A3: use standard linux-libre >= 6.7.
;;;
;;; 21. linux-bcachefs-git-headers (16304)
;;;     DEP_BLOCKED: depends on linux-bcachefs-git.
;;;     A1: parent not packageable.
;;;     A2: bcachefs in mainline.
;;;     A3: use standard kernel headers.
;;;
;;; 22. lib32-libxpm (16491)
;;;     MULTILIB_UNSUPPORTED: 32-bit libXpm.
;;;     A1: no multilib model.
;;;     A2: cross-compilation needed.
;;;     A3: use native-arch libxpm.
;;;
;;; 23. xtables-addons-dkms (16501)
;;;     DKMS_UNSUPPORTED: netfilter extension modules.
;;;     A1: DKMS not supported.
;;;     A2: requires kernel build infra.
;;;     A3: some addons merged upstream.
;;;
;;; 24. linux-xanmod-bore (16514)
;;;     CUSTOM_KERNEL_INFEASIBLE: XanMod with BORE scheduler.
;;;     A1: requires make-linux-libre infra.
;;;     A2: interactive config.
;;;     A3: 30+ min build; define as Guix kernel variant if needed.
;;;
;;; 25. linux-xanmod-bore-headers (16515)
;;;     DEP_BLOCKED: depends on linux-xanmod-bore.
;;;     A1: parent not packageable in batch.
;;;     A2: coupled to kernel build.
;;;     A3: no independent path.
;;;
;;; 26. ubuntu-mate-icon-themes (16097)
;;;     COMPLEX_DEPS: requires yaru-theme-icon not in Guix.
;;;     A1: Debian packaging only, no Makefile/Meson.
;;;     A2: depends on yaru ecosystem not in Guix.
;;;     A3: use hicolor-icon-theme or papirus as alternative.
;;;
;;; 27. corefreq-client (16105)
;;;     RUNTIME_DEP_BLOCKED: requires corefreq kernel module.
;;;     A1: kernel module (DKMS) cannot be packaged.
;;;     A2: client useless without kernel module loaded.
;;;     A3: entire corefreq needs kernel-loadable-modules OS config.
