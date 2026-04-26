;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Blocked notes for deptree-resolver-260426m
;;; 100 BLOCKED packages evaluated, 21 recipes written, 70 remain BLOCKED.
;;;
;;; KERNEL_MODULE (21 packages — Guix manages kernels as complete packages,
;;; not via DKMS; out-of-tree modules require kernel config patches):
;;;   r8125-dkms, bcachefs-kernel-dkms-git, ntfsplus-dkms-git, r8152-dkms,
;;;   ryzen_smu-dkms-git, xpad-dkms-git, zenpower3-dkms, zenpower3-dkms-git,
;;;   zenpower5-dkms-git, aic8800-dkms, ajantv2-dkms, droidcam-dkms-git,
;;;   kernelsu-dkms, linux-apfs-rw-dkms-git, msi-psu-dkms, nvidia-390xx-dkms,
;;;   nvidia-470xx-dkms, nvidia-580xx-dkms, nvidia-beta-dkms, rtw88-dkms-git,
;;;   rtw89-dkms-git, r8127-dkms
;;;
;;; DKMS_UNSUPPORTED (3 — same as KERNEL_MODULE):
;;;   system76-acpi-dkms, system76-io-dkms, nvidia-580xx-dkms (dup)
;;;
;;; PROPRIETARY_LICENSE (7 — non-redistributable proprietary fonts/software):
;;;   ttf-ms-win11-fod-auto-paneuropean, ttf-ms-win11-fod-auto-sinh,
;;;   ttf-ms-win11-fod-auto-syrc, ttf-ms-win11-fod-auto-taml,
;;;   ttf-ms-win11-fod-auto-telu, samsung-unified-driver-printer,
;;;   nifskope-git
;;;
;;; PROPRIETARY_CLOSED_SOURCE (1): jdk17-graalvm-ee-bin
;;; PROPRIETARY_SDK (1): ndi-sdk
;;; PROPRIETARY_SERVICE (1): skillshare
;;; NON_DISTRIBUTABLE (1): apple-fonts
;;;
;;; ARCH_SPECIFIC (6 — depends on pacman/mkinitcpio/Arch-specific tools):
;;;   aurutils, mkinitcpio-archlogo, mkinitcpio-btrfs,
;;;   mkinitcpio-colors-git, mkinitcpio-wifi, mkinitcpio-zerotier
;;;
;;; INITRAMFS_TOOL (1): mkinitcpio-systemd-extras (Arch mkinitcpio hook)
;;; FOREIGN_PACKAGE_MANAGER (1): portage (Gentoo's package manager)
;;; LIB32_UNSUPPORTED (2): lib32-openssl-1.1, lib32-libvpx1.3
;;; VERY_LOW_MATURITY (1): podserv-b-git
;;; NO_UPSTREAM_SOURCE (1): spinwheel-pipewire
;;; NO_LICENSE (1): fish-session
;;;
;;; MISSING_SOURCE (6 — not found in AUR metadata cache):
;;;   audiobookshelf, bulky, dbeaver, diffnav-bin, fluxdown-bin,
;;;   gram-editor-bin, hypnotix
;;;
;;; NEEDS_RECIPE_DESIGN_EXHAUSTED (6 — multiple approaches tried previously):
;;;   pamac-aur (ARCH_SPECIFIC ecosystem),
;;;   python-urllib3-future-git (MISSING_PYTHON_DEPS: h11+jh2+qh3),
;;;   pardf (UNCLEAR_UPSTREAM),
;;;   netpad-vnext-bin (DOTNET_UNSUPPORTED),
;;;   mdbook-epub (30+ Rust crate deps needed),
;;;   autofirma (JAVA_COMPLEX: Cliente de firma electronica),
;;;   mingw-w64-zlib-ng (MINGW cross-compilation),
;;;   llvm-cbe-git (complex LLVM fork)
;;;
;;; OTHER BLOCKED:
;;;   nbfc (depends on mono/.NET runtime — no Guix mono package),
;;;   ampcode (custom:proprietary license),
;;;   op-cache-git (cargo vendoring needed, no tags),
;;;   yaac (Java app, requires GUI + APRS support),
;;;   nautilus-typeahead (GNOME nautilus fork, huge dep chain + patches),
;;;   local-llama-bin (cc-by-nc-nd-4.0 non-commercial license),
;;;   architect-git (Nix-like config for pacman — ARCH_SPECIFIC)

(define-module (gaurix packages deptree-resolver-260426m-blocked-notes))
