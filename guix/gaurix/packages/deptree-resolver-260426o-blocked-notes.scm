;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Blocked notes for deptree-resolver-260426o
;;; 80 packages remain BLOCKED after evaluation.
;;; Categories:
;;;   KERNEL_MODULE (27): r8125-dkms, bcachefs-kernel-dkms-git, ntfsplus-dkms-git,
;;;     r8152-dkms, ryzen_smu-dkms-git, xpad-dkms-git, zenpower3-dkms,
;;;     zenpower3-dkms-git, zenpower5-dkms-git, aic8800-dkms, ajantv2-dkms,
;;;     droidcam-dkms-git, kernelsu-dkms, linux-apfs-rw-dkms-git, msi-psu-dkms,
;;;     nvidia-390xx-dkms, nvidia-470xx-dkms, nvidia-580xx-dkms, nvidia-beta-dkms,
;;;     r8127-dkms, rtw88-dkms-git, rtw89-dkms-git, v4l2loopback-dkms-git,
;;;     xone-dkms, xone-dkms-git, system76-acpi-dkms, system76-io-dkms
;;;   PROPRIETARY/NON-DISTRIBUTABLE (16): apple-fonts, skillshare, jdk17-graalvm-ee-bin,
;;;     ndi-sdk, ampcode, samsung-unified-driver-printer, ttf-ms-win11-fod-auto-paneuropean,
;;;     ttf-ms-win11-fod-auto-sinh, ttf-ms-win11-fod-auto-syrc, ttf-ms-win11-fod-auto-taml,
;;;     ttf-ms-win11-fod-auto-telu, ttf-ms-win11-fod-auto-thai, ttf-vista-fonts,
;;;     unifi, vintagestory-server, vrk-mpollux-digisign-client
;;;   ARCH_SPECIFIC (8): aurutils, mkinitcpio-archlogo, mkinitcpio-btrfs,
;;;     mkinitcpio-colors-git, mkinitcpio-wifi, mkinitcpio-zerotier, yaycache, portage
;;;   MISSING_SOURCE (8): audiobookshelf, bulky, dbeaver, diffnav-bin, fluxdown-bin,
;;;     gram-editor-bin, hypnotix, pardf
;;;   LIB32_UNSUPPORTED (2): lib32-openssl-1.1, lib32-libvpx1.3
;;;   CARGO_VENDORING_NEEDED (5): mdbook-epub, dela, dpibreak, op-cache-git, podserv-b-git
;;;   DOTNET_UNSUPPORTED (1): netpad-vnext-bin
;;;   MONO_UNSUPPORTED (1): nbfc
;;;   MINGW_CROSS (1): mingw-w64-zlib-ng
;;;   EXOTIC_LANG (1): artificial-rage-git (Odin)
;;;   JAVA_COMPLEX (2): autofirma, yaac
;;;   WINE_WRAPPER (1): winscp
;;;   NO_LICENSE (1): fish-session
;;;   NONCOMMERCIAL_LICENSE (1): local-llama-bin
;;;   PLATFORM_SPECIFIC (1): wreckfest2-wine-steam
;;;   PROPRIETARY_LICENSE (2): nifskope-git, vrms-arch
;;;   MKINITCPIO_SPECIFIC (1): mkinitcpio-systemd-extras
;;;   LLVM_VERSION_MISSING (1): llvm-cbe-git (needs LLVM 20, not in Guix)
;;;   ARCH_NixLIKE (1): architect-git (Nix-like config for pacman)
;;;
;;; Approaches tried for remaining NEEDS_RECIPE_DESIGN/FETCH_FAILED:
;;;
;;; mdbook-epub: A1: cargo-build-system needs 30+ vendored crate deps; unfeasible without
;;;   cargo-inputs automation. A2: no prebuilt binary releases. A3: could use Nix-style
;;;   cargo vendoring but Guix lacks this mechanism.
;;;
;;; dela: A1: cargo-build-system requires all crate deps listed. A2: no binary releases
;;;   on GitHub. A3: too many transitive deps for manual packaging.
;;;
;;; dpibreak: A1: cargo-build-system with vendored deps. A2: no prebuilt binaries.
;;;   A3: nftables runtime dep available but build deps chain too deep.
;;;
;;; op-cache-git: A1: no version tags, only git commits. A2: cargo vendoring needed.
;;;   A3: very low maturity (version 0).
;;;
;;; podserv-b-git: A1: cargo-build-system needs vendoring. A2: very low maturity
;;;   (v0.1.2, 0 votes). A3: no binary releases.
;;;
;;; autofirma: A1: Java/Maven build needs all deps packaged. A2: complex multi-module
;;;   Maven project. A3: Spanish government e-signature client, very niche.
;;;
;;; yaac: A1: Java app needs java-runtime. A2: SourceForge distribution, JAR-based.
;;;   A3: could package as JAR wrapper but would need all Java deps.
;;;
;;; winscp: A1: Wine wrapper for Windows SFTP client. A2: native alternatives exist
;;;   (FileZilla, SFTP). A3: Wine packaging pattern exists but complex.
;;;
;;; llvm-cbe-git: A1: needs LLVM 20 which is not yet in Guix. A2: no tagged releases.
;;;   A3: could try building against available LLVM but API incompatibility likely.
;;;
;;; architect-git: A1: "Nix-like configuration manager for pacman" — fundamentally
;;;   Arch-specific even if buildable. A2: depends on pacman. A3: no use case on Guix.

(define-module (gaurix packages deptree-resolver-260426o-blocked-notes))
