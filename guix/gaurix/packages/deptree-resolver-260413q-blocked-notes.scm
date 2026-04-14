;;; deptree-resolver-260413q-blocked-notes.scm
;;; Generated: 2026-04-13
;;; Blocked packages: 93

(define-module (gaurix packages deptree-resolver-260413q-blocked-notes))

;;; [INFEASIBLE_BUILD] sonic-win (#11979)
;;;   Patched KDE kwin fork with 55 direct deps; requires full KDE build infrastructure.
;;;   A1: Considered cmake-build-system but dep chain (kwin, plasma, Qt6) too deep.
;;;   A2: Checked for prebuilt binary releases — none available.
;;;   A3: No simplification path; full KDE framework rebuild required.

;;; [LIB32_UNSUPPORTED] lib32-xrizer (#256)
;;;   32-bit Rust library variant; Guix lacks multilib (32-bit on 64-bit) support.

;;; [INFEASIBLE_BUILD] plasma-workspace-povd (#2890)
;;;   Patched KDE Plasma workspace for per-output virtual desktops; 99 deps.
;;;   Requires full KDE Plasma build infrastructure + custom patches.

;;; [LIB32_UNSUPPORTED] lib32-l-smash (#12171)
;;;   32-bit library variant of l-smash.

;;; [DKMS_KERNEL_MODULE] new-lg4ff-dkms-git (#11866)
;;;   Logitech force feedback kernel module via DKMS; requires kernel headers.

;;; [LIB32_UNSUPPORTED] lib32-libudev0-shim (#11976)
;;;   32-bit libudev0 compatibility shim.

;;; [DKMS_KERNEL_MODULE] hid-fanatecff-dkms (#12124)
;;;   Fanatec force feedback HID driver via DKMS.

;;; [CUSTOM_KERNEL] linux-cachyos-lts (#1755)
;;;   CachyOS LTS kernel variant with BORE scheduler + custom patches.

;;; [CUSTOM_KERNEL] linux-cachyos (#1070)
;;;   CachyOS kernel with EEVDF + LTO + AutoFDO + Propeller patches.

;;; [CUSTOM_KERNEL] linux-cachyos-rc (#10770)
;;;   CachyOS RC kernel with Clang ThinLTO + AutoFDO patches.

;;; [INFEASIBLE_BUILD] qt6-base-hifps (#12026)
;;;   Patched Qt6 base for high FPS; 45+ deps, requires full Qt build infra.

;;; [SOURCE_UNAVAILABLE] anbox-git (#58)
;;;   Not in AUR metadata; project possibly defunct.

;;; [SOURCE_UNAVAILABLE] gram-editor-git (#2986)
;;;   Not in AUR metadata.

;;; [SOURCE_UNAVAILABLE] linux6.19.8.arch1-1-bin (#7510)
;;;   Versioned Arch kernel binary; not in AUR metadata.

;;; [SOURCE_UNAVAILABLE] linux6.19.8.arch1-1-docs-bin (#7512)
;;;   Versioned Arch kernel docs; not in AUR metadata.

;;; [SOURCE_UNAVAILABLE] linux6.19.8.arch1-1-headers-bin (#7511)
;;;   Versioned Arch kernel headers; not in AUR metadata.

;;; [SOURCE_UNAVAILABLE] linux6.19.9.arch1-1-bin (#9670)
;;;   Versioned Arch kernel binary; not in AUR metadata.

;;; [SOURCE_UNAVAILABLE] linux6.19.9.arch1-1-docs-bin (#9672)
;;;   Versioned Arch kernel docs; not in AUR metadata.

;;; [SOURCE_UNAVAILABLE] linux6.19.9.arch1-1-headers-bin (#9671)
;;;   Versioned Arch kernel headers; not in AUR metadata.

;;; [SOURCE_UNAVAILABLE] linux6.19.9.zen1-1-zen-bin (#9956)
;;;   Versioned Zen kernel binary; not in AUR metadata.

;;; [SOURCE_UNAVAILABLE] linux6.19.9.zen1-1-zen-docs-bin (#9958)
;;;   Versioned Zen kernel docs; not in AUR metadata.

;;; [SOURCE_UNAVAILABLE] linux6.19.9.zen1-1-zen-headers-bin (#9957)
;;;   Versioned Zen kernel headers; not in AUR metadata.

;;; [SOURCE_UNAVAILABLE] llama.cpp-aio (#2097)
;;;   Not in AUR metadata.

;;; [SOURCE_UNAVAILABLE] nvidia-vulkan-dkms (#548)
;;;   Not in AUR metadata.

;;; [SOURCE_UNAVAILABLE] openai-codex-autoup-bin (#1578)
;;;   Not in AUR metadata.

;;; [SOURCE_UNAVAILABLE] opensc-p11-kit-module (#7333)
;;;   Not in AUR metadata.

;;; [ARCH_SPECIFIC] pac-pacman-aliases (#9004)
;;;   Pacman shell aliases; Arch Linux package manager specific.

;;; [ARCH_SPECIFIC] pacman-log-orphans-hook (#11596)
;;;   Pacman hook to check for orphaned packages.

;;; [ARCH_SPECIFIC] pipewire-enable-bluez5 (#3243)
;;;   Pacman hook to enable Bluez5 support for Pipewire.

;;; [SOURCE_UNAVAILABLE] projtlauncher (#6759)
;;;   Not in AUR metadata.

;;; [SOURCE_UNAVAILABLE] python-uharfbuzz (#12043)
;;;   Not in AUR metadata.

;;; [SOURCE_UNAVAILABLE] shimmy-bin (#7482)
;;;   Not in AUR metadata.

;;; [SOURCE_UNAVAILABLE] shorinclip-git (#1149)
;;;   Not in AUR metadata.

;;; [SOURCE_UNAVAILABLE] subs2srs-git (#2878)
;;;   Not in AUR metadata.

;;; [PROPRIETARY_FONT_LICENSE] ttf-ms-win10-japanese (#12925)
;;;   Microsoft Windows 10 Japanese font; proprietary license prohibits redistribution.

;;; [PROPRIETARY_FONT_LICENSE] ttf-ms-win10-korean (#12926)
;;;   Microsoft Windows 10 Korean font.

;;; [PROPRIETARY_FONT_LICENSE] ttf-ms-win10-other (#12931)
;;;   Microsoft Windows 10 Other font.

;;; [PROPRIETARY_FONT_LICENSE] ttf-ms-win10-sea (#12927)
;;;   Microsoft Windows 10 Southeast Asian font.

;;; [PROPRIETARY_FONT_LICENSE] ttf-ms-win10-thai (#12928)
;;;   Microsoft Windows 10 Thai font.

;;; [PROPRIETARY_FONT_LICENSE] ttf-ms-win10-zh_cn (#12929)
;;;   Microsoft Windows 10 Simplified Chinese font.

;;; [PROPRIETARY_FONT_LICENSE] ttf-ms-win10-zh_tw (#12930)
;;;   Microsoft Windows 10 Traditional Chinese font.

;;; [PROPRIETARY_FONT_LICENSE] ttf-ms-win11-japanese (#22454)
;;;   Microsoft Windows 11 Japanese font.

;;; [PROPRIETARY_FONT_LICENSE] ttf-ms-win11-korean (#22455)
;;;   Microsoft Windows 11 Korean font.

;;; [PROPRIETARY_FONT_LICENSE] ttf-ms-win11-other (#22460)
;;;   Microsoft Windows 11 Other font.

;;; [PROPRIETARY_FONT_LICENSE] ttf-ms-win11-sea (#22456)
;;;   Microsoft Windows 11 Southeast Asian font.

;;; [PROPRIETARY_FONT_LICENSE] ttf-ms-win11-thai (#22457)
;;;   Microsoft Windows 11 Thai font.

;;; [PROPRIETARY_FONT_LICENSE] ttf-ms-win11-zh_cn (#22458)
;;;   Microsoft Windows 11 Simplified Chinese font.

;;; [PROPRIETARY_FONT_LICENSE] ttf-ms-win11-zh_tw (#22459)
;;;   Microsoft Windows 11 Traditional Chinese font.

;;; [SOURCE_UNAVAILABLE] vdhcoapp (#7274)
;;;   Not in AUR metadata.

;;; [SOURCE_UNAVAILABLE] vivaldi-ffmpeg-codecs (#24)
;;;   Not in AUR metadata.

;;; [SOURCE_UNAVAILABLE] whatsapp-for-linux (#46)
;;;   Not in AUR metadata.

;;; [SOURCE_UNAVAILABLE] zettlr (#38)
;;;   Not in AUR metadata.

;;; [ARCH_SPECIFIC] ancient-packages (#3325)
;;;   Lists installed packages no longer available; depends on package-query (pacman tool).

;;; [DKMS_KERNEL_MODULE] binder_linux-dkms (#12149)
;;;   Android binder kernel module via DKMS.

;;; [LICENSE_REVIEW_NEEDED] fallout1-ce-game (#12753)
;;;   NOTE: Recipe created but license is custom Sustainable Use License (non-FOSS).
;;;   Game engine requires original Fallout 1 game data files.

;;; [LIB32_UNSUPPORTED] lib32-libtxc_dxtn (#10703)
;;;   32-bit S3TC texture compression library.

;;; [LIB32_UNSUPPORTED] lib32-zix (#2584)
;;;   32-bit variant of zix portability library.

;;; [LINUX_METAPACKAGE] linux-zen-versioned-docs-bin (#9955)
;;;   Metapackage for versioned Zen kernel docs.

;;; [LINUX_METAPACKAGE] linux-zen-versioned-headers-bin (#9954)
;;;   Metapackage for versioned Zen kernel headers.

;;; [ARCH_SPECIFIC] localepurge-hook (#1130)
;;;   Pacman hook for running localepurge after installations.

;;; [ARCH_SPECIFIC] mandb-instant-update (#10058)
;;;   Pacman hook for updating mandb index during installs.

;;; [ARCH_SPECIFIC] mkinitcpio-sd-numlock (#12123)
;;;   Mkinitcpio hook to enable numlock via systemd in early userspace.

;;; [ARCH_SPECIFIC] paccache-hook (#11783)
;;;   Pacman hook for cleaning package cache via paccache.

;;; [ARCH_SPECIFIC] systemd-boot-pacman-hook (#1584)
;;;   Pacman hook to upgrade systemd-boot after systemd upgrade.

;;; [ARCH_SPECIFIC] yaycache-hook (#15341)
;;;   Pacman/yay hook for cleaning yay package cache.

;;; [DEP_UNAVAILABLE] youtube-music-desktop (#3192)
;;;   Depends on qtws-base (Qt web shell), not packaged in Guix.

;;; [DKMS_KERNEL_MODULE] amneziawg-dkms (#11762)
;;;   AmneziaWG VPN kernel module via DKMS.

;;; [ARCH_SPECIFIC] arch-gdm-theme-list (#9822)
;;;   Arch Linux GDM theme.

;;; [ARCH_SPECIFIC] checkupdates-notify (#2850)
;;;   Depends on pacman-contrib for update checking.

;;; [DOTNET_UNSUPPORTED] csharpier (#925)
;;;   Requires dotnet-sdk-10.0; .NET SDK not available in Guix.

;;; [DEPRECATED] cython2 (#10740)
;;;   Python 2 C-extensions compiler; Python 2 is EOL.

;;; [ELECTRON_APP] deezer-enhanced (#360)
;;;   Unofficial Deezer app; npm-based Electron build pipeline.

;;; [DOTNET_UNSUPPORTED] discord-chat-exporter-plus-cli (#3117)
;;;   Requires dotnet-sdk-10.0.

;;; [ARCH_SPECIFIC] etckeeper-packages (#2485)
;;;   Tracks installed packages in etckeeper; depends on pacman.

;;; [DKMS_KERNEL_MODULE] i2c-nct6793-dkms-git (#7625)
;;;   Nuvoton NCT6793 SMBus kernel driver via DKMS.

;;; [DKMS_KERNEL_MODULE] imx471-dkms-git (#901)
;;;   IMX471 sensor kernel driver via DKMS.

;;; [FIRMWARE_PACKAGE] intel-ucode-git (#1128)
;;;   Intel microcode from git; custom license, requires iucode-tool processing.

;;; [ELECTRON_APP] iptvnator-electron-bin (#10378)
;;;   IPTV player; depends on electron39.

;;; [DKMS_KERNEL_MODULE] it87-dkms-git (#12151)
;;;   ITE LPC chip driver via DKMS.

;;; [DKMS_KERNEL_MODULE] ithc-dkms-git (#6767)
;;;   Intel Touch Host Controller driver via DKMS.

;;; [DEP_UNAVAILABLE] ivpn-dinit (#7639)
;;;   Dinit init system service; dinit not available in Guix.

;;; [PROPRIETARY_LICENSE] jdk-doc (#2831)
;;;   Oracle Java documentation; restricted redistribution license.

;;; [PROPRIETARY_LICENSE] jdk21-graalvm-ee-bin (#3851)
;;;   GraalVM Enterprise Edition; GFTC license restricts redistribution.

;;; [PROPRIETARY_LICENSE] konica-minolta-bizhub-c554e-series (#11285)
;;;   Konica Minolta commercial printer driver license.

;;; [DEP_UNAVAILABLE] lact-openrc (#12378)
;;;   OpenRC init script for LACT; OpenRC not available in Guix.

;;; [LIB32_UNSUPPORTED] lib32-a52dec (#2433)
;;;   32-bit ATSC A/52 decoder library.

;;; [LIB32_UNSUPPORTED] lib32-gperftools (#10745)
;;;   32-bit Google performance tools.

;;; [LIB32_UNSUPPORTED + PROPRIETARY_LICENSE] lib32-opencl-legacy-amdgpu-pro (#11300)
;;;   32-bit AMD OpenCL ICD Loader; AMD EULA license.

;;; [LINUX_KERNEL_BINARY] linux-xanmod-linux-bin-x64v3 (#3631)
;;;   Prebuilt Xanmod kernel binary; not suitable for Guix.

;;; [LINUX_KERNEL_BINARY] linux-xanmod-linux-headers-bin-x64v3 (#3632)
;;;   Prebuilt Xanmod kernel headers.

;;; [LINUX_KERNEL_BINARY] linux-xanmod-lts-linux-bin-x64v3 (#3624)
;;;   Prebuilt Xanmod LTS kernel binary.

;;; [LINUX_KERNEL_BINARY] linux-xanmod-lts-linux-headers-bin-x64v3 (#3625)
;;;   Prebuilt Xanmod LTS kernel headers.

;;; [LINUX_METAPACKAGE] linux-zen-versioned-bin (#9953)
;;;   Metapackage for versioned Zen kernel binary.

;;; [INFEASIBLE_BUILD] llvm-mos-git (#11199)
;;;   LLVM fork for 6502/65816 targets; massive cmake build from git HEAD.
;;;   A1: cmake-build-system possible but build takes hours, needs entire LLVM.
;;;   A2: No prebuilt binaries for Linux x86_64 available.
;;;   A3: Upstream ships no stable releases; building from git HEAD is fragile.
