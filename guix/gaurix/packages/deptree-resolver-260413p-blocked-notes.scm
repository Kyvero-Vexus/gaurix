;;; deptree-resolver-260413p blocked notes
;;; 90 packages blocked with specific reason codes
;;;
;;; Categories:
;;;   SOURCE_UNAVAILABLE (24): not in AUR metadata cache
;;;   PROPRIETARY_FONT_LICENSE (14): MS Windows fonts, redistribution prohibited
;;;   ARCH_SPECIFIC (13): pacman hooks/tools with no Guix equivalent
;;;   DKMS_KERNEL_MODULE (8): Linux kernel modules requiring DKMS
;;;   LIB32_UNSUPPORTED (8): 32-bit library builds unsupported in Guix
;;;   INFEASIBLE_BUILD (4): patched forks of massive projects (KDE, Qt, Chromium)
;;;   CUSTOM_KERNEL (3): custom Linux kernel variants
;;;   PROPRIETARY_LICENSE (4): proprietary/restricted redistribution licenses
;;;   LINUX_METAPACKAGE (2): metapackages depending on unavailable versioned kernels
;;;   LINUX_KERNEL_BINARY (2): prebuilt kernel binaries
;;;   DOTNET_UNSUPPORTED (2): requires .NET SDK/runtime not in Guix
;;;   ELECTRON_APP (2): depends on specific Electron version not in Guix
;;;   DEP_UNAVAILABLE (3): depends on unpackaged software
;;;   DEPRECATED (1): EOL technology
;;;   FIRMWARE_PACKAGE (1): microcode/firmware requiring special processing

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
;;; pac-pacman-aliases: pacman shell aliases, no Guix equivalent
;;; pacman-log-orphans-hook: pacman hook
;;; pipewire-enable-bluez5: pacman hook for pipewire configuration
;;; ancient-packages: depends on package-query (pacman tool)
;;; localepurge-hook: pacman hook for localepurge
;;; mandb-instant-update: pacman hook for mandb
;;; mkinitcpio-sd-numlock: mkinitcpio hook, Arch-specific initramfs
;;; paccache-hook: pacman hook for package cache cleanup
;;; systemd-boot-pacman-hook: pacman hook for systemd-boot updates
;;; yaycache-hook: yay/pacman hook for cache cleanup
;;; arch-gdm-theme-list: Arch Linux GDM theme, distro-specific
;;; checkupdates-notify: depends on pacman-contrib
;;; etckeeper-packages: depends on pacman hooks

;;; --- DKMS_KERNEL_MODULE ---
;;; new-lg4ff-dkms-git: Logitech force feedback DKMS module
;;; hid-fanatecff-dkms: Fanatec controller DKMS module
;;; binder_linux-dkms: Android binder DKMS module
;;; amneziawg-dkms: AmneziaWG VPN DKMS module
;;; i2c-nct6793-dkms-git: Nuvoton NCT6793 SMBus DKMS driver
;;; imx471-dkms-git: IMX471 sensor DKMS driver
;;; it87-dkms-git: ITE LPC chip DKMS driver
;;; ithc-dkms-git: Intel Touch Host Controller DKMS driver

;;; --- LIB32_UNSUPPORTED ---
;;; lib32-xrizer: 32-bit OpenVR to OpenXR translation layer
;;; lib32-l-smash: 32-bit MP4 muxer
;;; lib32-libudev0-shim: 32-bit libudev compatibility
;;; lib32-libtxc_dxtn: 32-bit S3TC library
;;; lib32-zix: 32-bit C99 data structure library
;;; lib32-a52dec: 32-bit ATSC A/52 decoder
;;; lib32-gperftools: 32-bit performance tools
;;; lib32-opencl-legacy-amdgpu-pro: 32-bit AMD OpenCL (also proprietary EULA)

;;; --- INFEASIBLE_BUILD ---
;;; sonic-win: patched KDE kwin fork, requires full KDE build infrastructure
;;; plasma-workspace-povd: patched KDE workspace, full KDE build infra + custom patches
;;; qt6-base-hifps: patched Qt6 base, requires full Qt build infrastructure
;;; chromium-gost: full Chromium build with GOST crypto patches, massive build

;;; --- CUSTOM_KERNEL ---
;;; linux-cachyos-lts: CachyOS LTS kernel variant with custom patches
;;; linux-cachyos: CachyOS kernel with EEVDF + LTO + AutoFDO
;;; linux-cachyos-rc: CachyOS RC kernel variant

;;; --- PROPRIETARY_LICENSE ---
;;; jdk-doc: Oracle Java documentation, restricted redistribution
;;; jdk21-graalvm-ee-bin: GraalVM Enterprise, GFTC license
;;; konica-minolta-bizhub-c554e-series: commercial printer driver
;;; lib32-opencl-legacy-amdgpu-pro: AMD EULA (counted in LIB32 above too)

;;; --- LINUX_METAPACKAGE ---
;;; linux-zen-versioned-docs-bin: metapackage depending on versioned kernel docs
;;; linux-zen-versioned-headers-bin: metapackage depending on versioned kernel headers

;;; --- LINUX_KERNEL_BINARY ---
;;; linux-xanmod-linux-bin-x64v3: prebuilt Xanmod kernel binary
;;; linux-xanmod-linux-headers-bin-x64v3: prebuilt Xanmod kernel headers

;;; --- DOTNET_UNSUPPORTED ---
;;; csharpier: requires .NET SDK 10.0
;;; discord-chat-exporter-plus-cli: requires .NET runtime 10.0

;;; --- ELECTRON_APP ---
;;; deezer-enhanced: depends on electron37 (specific Electron version)
;;; iptvnator-electron-bin: depends on electron39

;;; --- DEP_UNAVAILABLE ---
;;; youtube-music-desktop: depends on qtws-base, not packaged
;;; ivpn-dinit: depends on dinit init system, not available in Guix
;;; lact-openrc: depends on OpenRC init system, not available in Guix

;;; --- DEPRECATED ---
;;; cython2: Python 2 is End-of-Life

;;; --- FIRMWARE_PACKAGE ---
;;; intel-ucode-git: Intel microcode, custom license, requires iucode-tool processing
