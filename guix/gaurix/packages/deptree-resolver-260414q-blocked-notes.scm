;;; Blocked notes for deptree-resolver-260414q
;;; 17 packages blocked with reason codes
;;; 83 packages resolved with recipes


;;; ============================================================
;;; ARCH_SPECIFIC
;;; ============================================================

;;; #21311 yay
;;;   BLOCKED: ARCH_SPECIFIC -- Arch Linux package manager (yay)
;;;   A1: depends on pacman/libalpm, not available in Guix
;;;   A2: Arch-specific tooling with no cross-distro equivalent
;;;   A3: would require reimplementing pacman integration

;;; #11312 paru
;;;   BLOCKED: ARCH_SPECIFIC -- Arch Linux package manager (paru)
;;;   A1: depends on pacman/libalpm, not available in Guix
;;;   A2: Arch-specific tooling with no cross-distro equivalent
;;;   A3: would require reimplementing pacman integration

;;; #1834 aurutils
;;;   BLOCKED: ARCH_SPECIFIC -- Arch Linux package manager (aurutils)
;;;   A1: depends on pacman/libalpm, not available in Guix
;;;   A2: Arch-specific tooling with no cross-distro equivalent
;;;   A3: would require reimplementing pacman integration


;;; ============================================================
;;; MISSING_SOURCE
;;; ============================================================

;;; #62 hyprshot
;;;   BLOCKED: MISSING_SOURCE -- not in AUR metadata
;;;   A1: not found in packages-meta-ext-v1.json
;;;   A2: no alternative source location found
;;;   A3: may be removed, renamed, or merged into another package

;;; #52 tailscale
;;;   BLOCKED: MISSING_SOURCE -- not in AUR metadata
;;;   A1: not found in packages-meta-ext-v1.json
;;;   A2: no alternative source location found
;;;   A3: may be removed, renamed, or merged into another package

;;; #57 waydroid
;;;   BLOCKED: MISSING_SOURCE -- not in AUR metadata
;;;   A1: not found in packages-meta-ext-v1.json
;;;   A2: no alternative source location found
;;;   A3: may be removed, renamed, or merged into another package

;;; #58 anbox-git
;;;   BLOCKED: MISSING_SOURCE -- not in AUR metadata
;;;   A1: not found in packages-meta-ext-v1.json
;;;   A2: no alternative source location found
;;;   A3: may be removed, renamed, or merged into another package


;;; ============================================================
;;; PROPRIETARY_DRIVER
;;; ============================================================

;;; #2351 nvidia-utils-beta
;;;   BLOCKED: PROPRIETARY_DRIVER -- NVIDIA proprietary driver
;;;   A1: proprietary binary-only driver
;;;   A2: kernel module build requires matching kernel headers
;;;   A3: redistribution restricted by vendor license


;;; ============================================================
;;; PROPRIETARY_LICENSE
;;; ============================================================

;;; #8076 gurobi
;;;   BLOCKED: PROPRIETARY_LICENSE -- proprietary license: custom:Gurobi EULA
;;;   A1: all licenses are proprietary/custom with no open-source fallback
;;;   A2: redistribution may be restricted
;;;   A3: no source code available for from-source build

;;; #6042 mozc-ut-full-common
;;;   BLOCKED: PROPRIETARY_LICENSE -- proprietary license: custom
;;;   A1: all licenses are proprietary/custom with no open-source fallback
;;;   A2: redistribution may be restricted
;;;   A3: no source code available for from-source build

;;; #11562 aimp
;;;   BLOCKED: PROPRIETARY_LICENSE -- proprietary license: custom
;;;   A1: all licenses are proprietary/custom with no open-source fallback
;;;   A2: redistribution may be restricted
;;;   A3: no source code available for from-source build

;;; #7233 libfmod
;;;   BLOCKED: PROPRIETARY_LICENSE -- proprietary license: custom
;;;   A1: all licenses are proprietary/custom with no open-source fallback
;;;   A2: redistribution may be restricted
;;;   A3: no source code available for from-source build

;;; #178 upd72020x-fw
;;;   BLOCKED: PROPRIETARY_LICENSE -- proprietary license: custom
;;;   A1: all licenses are proprietary/custom with no open-source fallback
;;;   A2: redistribution may be restricted
;;;   A3: no source code available for from-source build

;;; #1900 wd719x-firmware
;;;   BLOCKED: PROPRIETARY_LICENSE -- proprietary license: custom
;;;   A1: all licenses are proprietary/custom with no open-source fallback
;;;   A2: redistribution may be restricted
;;;   A3: no source code available for from-source build

;;; #991 android-sdk-build-tools
;;;   BLOCKED: PROPRIETARY_LICENSE -- proprietary license: custom
;;;   A1: all licenses are proprietary/custom with no open-source fallback
;;;   A2: redistribution may be restricted
;;;   A3: no source code available for from-source build

;;; #5321 chromium-widevine
;;;   BLOCKED: PROPRIETARY_LICENSE -- proprietary license: custom
;;;   A1: all licenses are proprietary/custom with no open-source fallback
;;;   A2: redistribution may be restricted
;;;   A3: no source code available for from-source build


;;; ============================================================
;;; PROPRIETARY_SERVICE
;;; ============================================================

;;; #1958 logmein-hamachi
;;;   BLOCKED: PROPRIETARY_SERVICE -- proprietary VPN service, requires account
;;;   A1: proprietary service requiring account/subscription
;;;   A2: binary-only with no source available
;;;   A3: service dependency makes standalone packaging impractical

