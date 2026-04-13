;;; deptree-resolver-260413n blocked notes
;;; 75 packages blocked with specific reason codes
;;;
;;; Categories:
;;;   SOURCE_UNAVAILABLE (24): not in AUR metadata cache
;;;   PROPRIETARY_FONT_LICENSE (14): MS Windows fonts, redistribution prohibited
;;;   ARCH_SPECIFIC (13): pacman hooks/tools with no Guix equivalent
;;;   DKMS_KERNEL_MODULE (8): Linux kernel modules requiring DKMS
;;;   LIB32_UNSUPPORTED (5): 32-bit library builds unsupported in Guix
;;;   INFEASIBLE_BUILD (4): patched forks of massive projects (KDE, Qt, Chromium)
;;;   CUSTOM_KERNEL (3): custom Linux kernel variants
;;;   LINUX_METAPACKAGE (2): metapackages depending on unavailable versioned kernels
;;;   DOTNET_UNSUPPORTED (2): requires .NET SDK/runtime not in Guix
;;;   DEPRECATED (1): Python 2 is EOL
;;;   ELECTRON_APP (1): depends on specific Electron version not in Guix
;;;   DEP_UNAVAILABLE (1): depends on unpackaged software

;;; --- SOURCE_UNAVAILABLE ---
;;; anbox-git: not in AUR metadata, project appears abandoned
;;; gram-editor-git: not in AUR metadata
;;; linux6.19.8.arch1-1-bin: not in AUR metadata, specific kernel version
;;; linux6.19.8.arch1-1-docs-bin: not in AUR metadata
;;; linux6.19.8.arch1-1-headers-bin: not in AUR metadata
;;; linux6.19.9.arch1-1-bin: not in AUR metadata
;;; linux6.19.9.arch1-1-docs-bin: not in AUR metadata
;;; linux6.19.9.arch1-1-headers-bin: not in AUR metadata
;;; linux6.19.9.zen1-1-zen-bin: not in AUR metadata
;;; linux6.19.9.zen1-1-zen-docs-bin: not in AUR metadata
;;; linux6.19.9.zen1-1-zen-headers-bin: not in AUR metadata
;;; llama.cpp-aio: not in AUR metadata
;;; nvidia-vulkan-dkms: not in AUR metadata
;;; openai-codex-autoup-bin: not in AUR metadata
;;; opensc-p11-kit-module: not in AUR metadata
;;; projtlauncher: not in AUR metadata
;;; python-uharfbuzz: not in AUR metadata
;;; shimmy-bin: not in AUR metadata
;;; shorinclip-git: not in AUR metadata
;;; subs2srs-git: not in AUR metadata
;;; vdhcoapp: not in AUR metadata
;;; vivaldi-ffmpeg-codecs: not in AUR metadata
;;; whatsapp-for-linux: not in AUR metadata
;;; zettlr: not in AUR metadata

;;; --- PROPRIETARY_FONT_LICENSE ---
;;; ttf-ms-win10-japanese: requires Windows installation media, redistribution prohibited
;;; ttf-ms-win10-korean: same
;;; ttf-ms-win10-other: same
;;; ttf-ms-win10-sea: same
;;; ttf-ms-win10-thai: same
;;; ttf-ms-win10-zh_cn: same
;;; ttf-ms-win10-zh_tw: same
;;; ttf-ms-win11-japanese: same
;;; ttf-ms-win11-korean: same
;;; ttf-ms-win11-other: same
;;; ttf-ms-win11-sea: same
;;; ttf-ms-win11-thai: same
;;; ttf-ms-win11-zh_cn: same
;;; ttf-ms-win11-zh_tw: same

;;; --- ARCH_SPECIFIC ---
;;; pac-pacman-aliases: shell aliases for pacman, Arch-only
;;; pacman-log-orphans-hook: pacman alpm hook
;;; pipewire-enable-bluez5: pacman alpm hook for pipewire
;;; ancient-packages: depends on package-query (pacman tool)
;;; localepurge-hook: pacman alpm hook
;;; mandb-instant-update: pacman alpm hook for mandb
;;; mkinitcpio-sd-numlock: mkinitcpio hook, Arch-specific
;;; paccache-hook: pacman alpm hook
;;; systemd-boot-pacman-hook: pacman alpm hook for systemd-boot
;;; yaycache-hook: yay/pacman hook
;;; checkupdates-notify: depends on pacman-contrib
;;; etckeeper-packages: depends on pacman
;;; arch-gdm-theme-list: Arch Linux-specific GDM theme

;;; --- DKMS_KERNEL_MODULE ---
;;; new-lg4ff-dkms-git: Logitech FF kernel module, requires DKMS
;;; hid-fanatecff-dkms: Fanatec FF kernel module, requires DKMS
;;; binder_linux-dkms: Android binder kernel module, requires DKMS
;;; amneziawg-dkms: AmneziaWG VPN kernel module, requires DKMS
;;; i2c-nct6793-dkms-git: i2c kernel module, requires DKMS

;;; --- CUSTOM_KERNEL ---
;;; linux-cachyos-lts: CachyOS LTS kernel variant
;;; linux-cachyos: CachyOS kernel variant
;;; linux-cachyos-rc: CachyOS RC kernel variant

;;; --- LIB32_UNSUPPORTED ---
;;; lib32-xrizer: 32-bit OpenVR reimplementation
;;; lib32-l-smash: 32-bit MP4 muxer
;;; lib32-libudev0-shim: 32-bit libudev compat shim
;;; lib32-libtxc_dxtn: 32-bit S3TC library for wine-staging
;;; lib32-zix: 32-bit C99 portability library

;;; --- INFEASIBLE_BUILD ---
;;; sonic-win: patched KDE kwin fork, requires full KDE build infrastructure
;;; plasma-workspace-povd: patched KDE Plasma workspace, requires custom patches + full KDE infra
;;; qt6-base-hifps: patched Qt6 base for high FPS, requires full Qt build
;;; chromium-gost: full Chromium build with GOST cryptography patches

;;; --- LINUX_METAPACKAGE ---
;;; linux-zen-versioned-docs-bin: depends on linux6.19.11.zen1-1-zen-docs-bin (not available)
;;; linux-zen-versioned-headers-bin: depends on linux6.19.11.zen1-1-zen-headers-bin (not available)

;;; --- DOTNET_UNSUPPORTED ---
;;; csharpier: requires .NET SDK 10.0, not available in Guix
;;; discord-chat-exporter-plus-cli: requires .NET runtime 10.0

;;; --- DEPRECATED ---
;;; cython2: Python 2 is EOL since 2020, no longer maintained

;;; --- ELECTRON_APP ---
;;; deezer-enhanced: depends on electron37, not available in Guix

;;; --- DEP_UNAVAILABLE ---
;;; youtube-music-desktop: depends on qtws-base, not packaged anywhere
