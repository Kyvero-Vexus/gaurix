;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency-tree resolver pass -- deptree-resolver-260408f -- blocked notes
;;; Documents why 65 of 100 selected packages remain BLOCKED.
;;; Generated: 2026-04-08

(define-module (gaurix packages deptree-resolver-260408f-blocked-notes))

;;; ====================================================================
;;; BLOCKED PACKAGE NOTES (65 packages)
;;; ====================================================================
;;;
;;; anbox-git
;;;    DISCONTINUED -- Android-in-a-box; project archived/discontinued, no maintained upstream.
;;;
;;; apple-fonts
;;;    NON_DISTRIBUTABLE -- Apple proprietary fonts; license forbids redistribution outside Apple platforms.
;;;
;;; audiobookshelf
;;;    MISSING_SOURCE -- Not found in AUR metadata cache; known as Node.js self-hosted audiobook server (github.com/advplyr/audiobookshelf), but no AUR metadata available.
;;;
;;; bigpemu-bin
;;;    PROPRIETARY_CLOSED_SOURCE -- BigPEmu Atari Jaguar emulator; closed-source binary, redistribution likely not permitted.
;;;
;;; bulky
;;;    MISSING_SOURCE -- Not found in AUR metadata cache; known as Linux Mint bulk renamer (github.com/linuxmint/bulky), but no AUR metadata available.
;;;
;;; chkufsd-bin
;;;    PROPRIETARY_CLOSED_SOURCE -- Paragon UFSD filesystem checker; proprietary binary, not redistributable.
;;;
;;; chromium-gost
;;;    BUILD_SYSTEM_TOO_COMPLEX -- Chromium fork with GOST cryptography; full Chromium build requires extreme resources/time.
;;;
;;; codex-desktop-bin
;;;    MISSING_SOURCE -- Not found in AUR metadata cache; likely new/niche OpenAI Codex desktop application.
;;;
;;; cursor-ide
;;;    PROPRIETARY_CLOSED_SOURCE -- Cursor AI IDE; proprietary binary application, redistribution not permitted.
;;;
;;; dbeaver
;;;    MISSING_SOURCE -- No URL or version in AUR metadata; package may have been removed or is a meta-package.
;;;
;;; dotnet-sdk-preview-bin
;;;    NEEDS_RECIPE_DESIGN -- .NET SDK preview; depends on dotnet-runtime-preview-bin, aspnet-runtime-preview-bin and other dotnet components not yet packaged.
;;;
;;; fahviewer
;;;    MISSING_SOURCE -- No URL or version in AUR metadata; package may have been removed or is a meta-package.
;;;
;;; fluxdown-bin
;;;    MISSING_SOURCE -- Not found in AUR metadata cache; no upstream source identified.
;;;
;;; glazepkg-bin
;;;    MISSING_SOURCE -- Not found in AUR metadata cache; no upstream source identified.
;;;
;;; gram-editor-bin
;;;    MISSING_SOURCE -- Not found in AUR metadata cache; no upstream source identified.
;;;
;;; gst-thumbnailers
;;;    MISSING_SOURCE -- No URL or version in AUR metadata; package may have been removed or is a meta-package.
;;;
;;; hylauncher-bin
;;;    MISSING_SOURCE -- Not found in AUR metadata cache; no upstream source identified.
;;;
;;; hypnotix
;;;    MISSING_SOURCE -- Not found in AUR metadata cache; known as Linux Mint IPTV player (github.com/linuxmint/hypnotix), but no AUR metadata available.
;;;
;;; intel-compute-runtime-legacy
;;;    NEEDS_RECIPE_DESIGN -- Intel compute runtime for legacy GPUs; requires intel-gmmlib-legacy and intel-graphics-compiler-legacy dependencies not yet packaged.
;;;
;;; jdk17-graalvm-ee-bin
;;;    PROPRIETARY_CLOSED_SOURCE -- Oracle GraalVM Enterprise Edition; OTN license, redistribution not permitted.
;;;
;;; jdk21-graalvm-ee-bin
;;;    PROPRIETARY_CLOSED_SOURCE -- Oracle GraalVM Enterprise Edition; OTN license, redistribution not permitted.
;;;
;;; jdk8-graalvm-ee-bin
;;;    PROPRIETARY_CLOSED_SOURCE -- Oracle GraalVM Enterprise Edition; OTN license, redistribution not permitted.
;;;
;;; komodo-periphery-git
;;;    MISSING_SOURCE -- Not found in AUR metadata cache; likely Komodo build manager periphery agent (github.com/moghtech/komodo).
;;;
;;; konform-multi-account-containers-lite
;;;    MISSING_SOURCE -- Not found in AUR metadata cache; Firefox Multi-Account Containers extension variant.
;;;
;;; lib32-bluez-libs
;;;    LIB32_UNSUPPORTED -- lib32 multilib package; Guix does not use a multilib approach.
;;;
;;; lib32-libbluray
;;;    LIB32_UNSUPPORTED -- lib32 multilib package; Guix does not use a multilib approach.
;;;
;;; lib32-libdovi
;;;    LIB32_UNSUPPORTED -- lib32 multilib package; Guix does not use a multilib approach.
;;;
;;; lib32-libvmaf
;;;    LIB32_UNSUPPORTED -- lib32 multilib package; Guix does not use a multilib approach.
;;;
;;; lib32-nvidia-utils-beta
;;;    LIB32_UNSUPPORTED -- lib32 multilib package; Guix does not use a multilib approach.
;;;
;;; lib32-xvidcore
;;;    LIB32_UNSUPPORTED -- lib32 multilib package; Guix does not use a multilib approach.
;;;
;;; libsdrplay
;;;    PROPRIETARY_SDK -- SDRplay API library; requires EULA acceptance, not freely redistributable.
;;;
;;; matlab
;;;    PROPRIETARY_CLOSED_SOURCE -- MATLAB is proprietary software requiring a commercial license; not redistributable.
;;;
;;; mechrevo-drivers-dkms
;;;    DKMS_UNSUPPORTED -- DKMS kernel module; Guix manages kernel modules differently.
;;;
;;; mingw-w64-crt-msvcrt
;;;    CROSS_TOOLCHAIN_COMPLEX -- MinGW-w64 CRT with MSVCRT; requires full MinGW cross-compilation toolchain.
;;;
;;; mingw-w64-environment
;;;    CROSS_TOOLCHAIN_COMPLEX -- MinGW-w64 environment setup; depends on complete MinGW cross-toolchain.
;;;
;;; mips64-linux-gnu-gcc-bootstrap
;;;    CROSS_TOOLCHAIN_COMPLEX -- GCC bootstrap for MIPS64 cross-toolchain; requires full cross-compilation infrastructure.
;;;
;;; mips64el-linux-gnu-binutils
;;;    CROSS_TOOLCHAIN_COMPLEX -- Binutils for MIPS64EL cross-toolchain; requires cross-compilation infrastructure.
;;;
;;; ndi-sdk
;;;    PROPRIETARY_SDK -- NewTek NDI SDK; proprietary binary requiring developer registration/license.
;;;
;;; nvidia-390xx-dkms
;;;    DKMS_UNSUPPORTED -- DKMS kernel module; Guix manages kernel modules differently.
;;;
;;; nvidia-470xx-dkms
;;;    DKMS_UNSUPPORTED -- DKMS kernel module; Guix manages kernel modules differently.
;;;
;;; nvidia-580xx-dkms
;;;    DKMS_UNSUPPORTED -- DKMS kernel module; Guix manages kernel modules differently.
;;;
;;; nvidia-beta
;;;    KERNEL_MODULE -- NVIDIA proprietary kernel modules (beta); requires kernel build infrastructure.
;;;
;;; nvidia-beta-dkms
;;;    DKMS_UNSUPPORTED -- DKMS kernel module; Guix manages kernel modules differently.
;;;
;;; nvidia-open-beta
;;;    KERNEL_MODULE -- NVIDIA open kernel modules (beta); requires kernel build infrastructure and linux-headers.
;;;
;;; nvidia-open-beta-dkms
;;;    DKMS_UNSUPPORTED -- DKMS kernel module; Guix manages kernel modules differently.
;;;
;;; ps3toolchain
;;;    CROSS_TOOLCHAIN_COMPLEX -- PlayStation 3 development cross-toolchain; requires specialized cross-compilation setup.
;;;
;;; spotify-1.1
;;;    PROPRIETARY_CLOSED_SOURCE -- Spotify client v1.1; proprietary binary, redistribution not permitted.
;;;
;;; spotify-dev
;;;    PROPRIETARY_CLOSED_SOURCE -- Spotify client development version; proprietary binary, not redistributable.
;;;
;;; ttf-ms-win10-auto
;;;    NON_DISTRIBUTABLE -- Microsoft Windows proprietary fonts; redistribution requires Windows license, not permitted.
;;;
;;; ttf-ms-win10-japanese
;;;    NON_DISTRIBUTABLE -- Microsoft Windows proprietary fonts; redistribution requires Windows license, not permitted.
;;;
;;; ttf-ms-win10-korean
;;;    NON_DISTRIBUTABLE -- Microsoft Windows proprietary fonts; redistribution requires Windows license, not permitted.
;;;
;;; ttf-ms-win10-other
;;;    NON_DISTRIBUTABLE -- Microsoft Windows proprietary fonts; redistribution requires Windows license, not permitted.
;;;
;;; ttf-ms-win10-sea
;;;    NON_DISTRIBUTABLE -- Microsoft Windows proprietary fonts; redistribution requires Windows license, not permitted.
;;;
;;; ttf-ms-win10-thai
;;;    NON_DISTRIBUTABLE -- Microsoft Windows proprietary fonts; redistribution requires Windows license, not permitted.
;;;
;;; ttf-ms-win10-zh_cn
;;;    NON_DISTRIBUTABLE -- Microsoft Windows proprietary fonts; redistribution requires Windows license, not permitted.
;;;
;;; ttf-ms-win10-zh_tw
;;;    NON_DISTRIBUTABLE -- Microsoft Windows proprietary fonts; redistribution requires Windows license, not permitted.
;;;
;;; ttf-ms-win11-japanese
;;;    NON_DISTRIBUTABLE -- Microsoft Windows proprietary fonts; redistribution requires Windows license, not permitted.
;;;
;;; ttf-ms-win11-korean
;;;    NON_DISTRIBUTABLE -- Microsoft Windows proprietary fonts; redistribution requires Windows license, not permitted.
;;;
;;; ttf-ms-win11-other
;;;    NON_DISTRIBUTABLE -- Microsoft Windows proprietary fonts; redistribution requires Windows license, not permitted.
;;;
;;; ttf-ms-win11-sea
;;;    NON_DISTRIBUTABLE -- Microsoft Windows proprietary fonts; redistribution requires Windows license, not permitted.
;;;
;;; ttf-ms-win11-thai
;;;    NON_DISTRIBUTABLE -- Microsoft Windows proprietary fonts; redistribution requires Windows license, not permitted.
;;;
;;; ttf-ms-win11-zh_cn
;;;    NON_DISTRIBUTABLE -- Microsoft Windows proprietary fonts; redistribution requires Windows license, not permitted.
;;;
;;; ttf-ms-win11-zh_tw
;;;    NON_DISTRIBUTABLE -- Microsoft Windows proprietary fonts; redistribution requires Windows license, not permitted.
;;;
;;; unreal-tournament-data-archiveorg
;;;    NON_DISTRIBUTABLE -- Unreal Tournament game data from Archive.org; copyright status unclear, not freely distributable.
;;;
;;; unreal-tournament-data-gog
;;;    NON_DISTRIBUTABLE -- Unreal Tournament game data from GOG; requires purchase, not redistributable.
