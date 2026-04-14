;;; Blocked notes for deptree-resolver-260414b
;;; 96 packages blocked with reason codes

;;; #11979 sonic-win
;;;   BLOCKED: INFEASIBLE_BUILD — KDE kwin-x11 fork with 61 deps including full KDE Frameworks + Plasma stack; A1: requires full KDE build infrastructure; A2: patched Qt/KDE combo not portable; A3: scope exceeds feasibility

;;; #256 lib32-xrizer
;;;   BLOCKED: LIB32_UNSUPPORTED — 32-bit OpenVR reimplementation; A1: needs lib32-rust-libs; A2: Guix lacks 32-bit cross-compilation support; A3: no 32-bit multilib in Guix

;;; #2890 plasma-workspace-povd
;;;   BLOCKED: INFEASIBLE_BUILD — patched KDE Plasma Workspace with 113 deps; A1: full Plasma stack required; A2: per-output virtual desktop patch not isolable; A3: scope exceeds feasibility

;;; #12171 lib32-l-smash
;;;   BLOCKED: LIB32_UNSUPPORTED — 32-bit MP4 muxer library; A1: Guix lacks 32-bit multilib; A2: no lib32 cross-compile; A3: use 64-bit l-smash instead

;;; #11866 new-lg4ff-dkms-git
;;;   BLOCKED: DKMS_KERNEL_MODULE — Logitech force feedback DKMS kernel module; A1: DKMS not supported in Guix; A2: needs linux-module-build-system; A3: requires kernel headers matching running kernel

;;; #11976 lib32-libudev0-shim
;;;   BLOCKED: LIB32_UNSUPPORTED — 32-bit libudev.so.0 compat shim; A1: Guix lacks 32-bit multilib; A2: depends on lib32-systemd; A3: Steam native runtime workaround

;;; #12124 hid-fanatecff-dkms
;;;   BLOCKED: DKMS_KERNEL_MODULE — Fanatec force feedback DKMS kernel module; A1: DKMS not supported; A2: needs kernel headers; A3: out-of-tree module build unsupported

;;; #1755 linux-cachyos-lts
;;;   BLOCKED: CUSTOM_KERNEL — CachyOS LTS kernel with BORE scheduler + patches; A1: custom kernel config; A2: requires CachyOS patch set; A3: Guix uses own kernel build system

;;; #1070 linux-cachyos
;;;   BLOCKED: CUSTOM_KERNEL — CachyOS kernel with EEVDF + LTO + AutoFDO patches; A1: custom kernel; A2: CachyOS-specific config; A3: incompatible with Guix kernel build

;;; #10770 linux-cachyos-rc
;;;   BLOCKED: CUSTOM_KERNEL — CachyOS RC kernel with Clang ThinLTO; A1: release candidate kernel; A2: CachyOS patches; A3: incompatible with Guix kernel build

;;; #12026 qt6-base-hifps
;;;   BLOCKED: INFEASIBLE_BUILD — patched Qt6 base for high FPS; A1: Qt6 fork with 66 deps; A2: custom patch not isolable from full Qt build; A3: scope exceeds feasibility

;;; #58 anbox-git
;;;   BLOCKED: SOURCE_UNAVAILABLE — not in AUR metadata; A1: project deprecated since Feb 2023; A2: superseded by Waydroid; A3: no source to package

;;; #2986 gram-editor-git
;;;   BLOCKED: SOURCE_UNAVAILABLE — not in AUR metadata; A1: package removed from AUR; A2: no upstream source found; A3: no actionable packaging path

;;; #7510 linux6.19.8.arch1-1-bin
;;;   BLOCKED: SOURCE_UNAVAILABLE — not in AUR metadata; A1: version-pinned Arch kernel binary; A2: ephemeral AUR package; A3: superseded by newer kernel versions

;;; #7512 linux6.19.8.arch1-1-docs-bin
;;;   BLOCKED: SOURCE_UNAVAILABLE — not in AUR metadata; A1: version-pinned kernel docs binary; A2: ephemeral; A3: superseded

;;; #7511 linux6.19.8.arch1-1-headers-bin
;;;   BLOCKED: SOURCE_UNAVAILABLE — not in AUR metadata; A1: version-pinned kernel headers binary; A2: ephemeral; A3: superseded

;;; #9670 linux6.19.9.arch1-1-bin
;;;   BLOCKED: SOURCE_UNAVAILABLE — not in AUR metadata; A1: version-pinned Arch kernel binary; A2: ephemeral; A3: superseded

;;; #9672 linux6.19.9.arch1-1-docs-bin
;;;   BLOCKED: SOURCE_UNAVAILABLE — not in AUR metadata; A1: version-pinned kernel docs binary; A2: ephemeral; A3: superseded

;;; #9671 linux6.19.9.arch1-1-headers-bin
;;;   BLOCKED: SOURCE_UNAVAILABLE — not in AUR metadata; A1: version-pinned kernel headers binary; A2: ephemeral; A3: superseded

;;; #9956 linux6.19.9.zen1-1-zen-bin
;;;   BLOCKED: SOURCE_UNAVAILABLE — not in AUR metadata; A1: version-pinned Zen kernel binary; A2: ephemeral; A3: superseded

;;; #9958 linux6.19.9.zen1-1-zen-docs-bin
;;;   BLOCKED: SOURCE_UNAVAILABLE — not in AUR metadata; A1: version-pinned Zen kernel docs; A2: ephemeral; A3: superseded

;;; #9957 linux6.19.9.zen1-1-zen-headers-bin
;;;   BLOCKED: SOURCE_UNAVAILABLE — not in AUR metadata; A1: version-pinned Zen kernel headers; A2: ephemeral; A3: superseded

;;; #2097 llama.cpp-aio
;;;   BLOCKED: SOURCE_UNAVAILABLE — not in AUR metadata; A1: package removed from AUR; A2: llama.cpp already packaged as separate components; A3: no source

;;; #548 nvidia-vulkan-dkms
;;;   BLOCKED: SOURCE_UNAVAILABLE — not in AUR metadata; A1: proprietary NVIDIA Vulkan beta DKMS driver; A2: removed from AUR; A3: DKMS + proprietary

;;; #1578 openai-codex-autoup-bin
;;;   BLOCKED: SOURCE_UNAVAILABLE — not in AUR metadata; A1: OpenAI Codex binary removed from AUR; A2: product discontinued; A3: no source

;;; #7333 opensc-p11-kit-module
;;;   BLOCKED: SOURCE_UNAVAILABLE — not in AUR metadata; A1: OpenSC PKCS#11 module removed from AUR; A2: likely merged into upstream opensc; A3: no source

;;; #9004 pac-pacman-aliases
;;;   BLOCKED: ARCH_SPECIFIC — pacman command aliases; A1: provides apt-like aliases for pacman; A2: no equivalent for non-pacman systems; A3: Guix uses guix CLI not pacman

;;; #11596 pacman-log-orphans-hook
;;;   BLOCKED: ARCH_SPECIFIC — pacman hook for orphan detection; A1: libalpm hook mechanism; A2: pacman-specific trigger; A3: not portable to non-pacman systems

;;; #3243 pipewire-enable-bluez5
;;;   BLOCKED: ARCH_SPECIFIC — pacman hook for PipeWire Bluez5; A1: libalpm hook mechanism; A2: Guix configures PipeWire via system services; A3: not portable

;;; #6759 projtlauncher
;;;   BLOCKED: SOURCE_UNAVAILABLE — not in AUR metadata; A1: package removed from AUR; A2: no upstream found; A3: no actionable path

;;; #12043 python-uharfbuzz
;;;   BLOCKED: SOURCE_UNAVAILABLE — not in AUR metadata; A1: package removed from AUR; A2: harfbuzz Python bindings may exist upstream; A3: no AUR source to reference

;;; #7482 shimmy-bin
;;;   BLOCKED: SOURCE_UNAVAILABLE — not in AUR metadata; A1: package removed from AUR; A2: no upstream found; A3: no actionable path

;;; #1149 shorinclip-git
;;;   BLOCKED: SOURCE_UNAVAILABLE — not in AUR metadata; A1: package removed from AUR; A2: no upstream found; A3: no actionable path

;;; #2878 subs2srs-git
;;;   BLOCKED: SOURCE_UNAVAILABLE — not in AUR metadata; A1: package removed from AUR; A2: original subs2srs was Windows-only; A3: no actionable path

;;; #12925 ttf-ms-win10-japanese
;;;   BLOCKED: PROPRIETARY_FONT_LICENSE — Microsoft Windows 10 Japanese fonts; A1: proprietary license prohibits redistribution; A2: requires Windows license; A3: cannot distribute in Guix

;;; #12926 ttf-ms-win10-korean
;;;   BLOCKED: PROPRIETARY_FONT_LICENSE — Microsoft Windows 10 Korean fonts; A1: proprietary license; A2: requires Windows license; A3: cannot distribute

;;; #12931 ttf-ms-win10-other
;;;   BLOCKED: PROPRIETARY_FONT_LICENSE — Microsoft Windows 10 other fonts; A1: proprietary license; A2: requires Windows license; A3: cannot distribute

;;; #12927 ttf-ms-win10-sea
;;;   BLOCKED: PROPRIETARY_FONT_LICENSE — Microsoft Windows 10 Southeast Asian fonts; A1: proprietary license; A2: requires Windows license; A3: cannot distribute

;;; #12928 ttf-ms-win10-thai
;;;   BLOCKED: PROPRIETARY_FONT_LICENSE — Microsoft Windows 10 Thai fonts; A1: proprietary license; A2: requires Windows license; A3: cannot distribute

;;; #12929 ttf-ms-win10-zh_cn
;;;   BLOCKED: PROPRIETARY_FONT_LICENSE — Microsoft Windows 10 Simplified Chinese fonts; A1: proprietary license; A2: requires Windows license; A3: cannot distribute

;;; #12930 ttf-ms-win10-zh_tw
;;;   BLOCKED: PROPRIETARY_FONT_LICENSE — Microsoft Windows 10 Traditional Chinese fonts; A1: proprietary license; A2: requires Windows license; A3: cannot distribute

;;; #22454 ttf-ms-win11-japanese
;;;   BLOCKED: PROPRIETARY_FONT_LICENSE — Microsoft Windows 11 Japanese fonts; A1: proprietary license; A2: requires Windows license; A3: cannot distribute

;;; #22455 ttf-ms-win11-korean
;;;   BLOCKED: PROPRIETARY_FONT_LICENSE — Microsoft Windows 11 Korean fonts; A1: proprietary license; A2: requires Windows license; A3: cannot distribute

;;; #22460 ttf-ms-win11-other
;;;   BLOCKED: PROPRIETARY_FONT_LICENSE — Microsoft Windows 11 other fonts; A1: proprietary license; A2: requires Windows license; A3: cannot distribute

;;; #22456 ttf-ms-win11-sea
;;;   BLOCKED: PROPRIETARY_FONT_LICENSE — Microsoft Windows 11 Southeast Asian fonts; A1: proprietary license; A2: requires Windows license; A3: cannot distribute

;;; #22457 ttf-ms-win11-thai
;;;   BLOCKED: PROPRIETARY_FONT_LICENSE — Microsoft Windows 11 Thai fonts; A1: proprietary license; A2: requires Windows license; A3: cannot distribute

;;; #22458 ttf-ms-win11-zh_cn
;;;   BLOCKED: PROPRIETARY_FONT_LICENSE — Microsoft Windows 11 Simplified Chinese fonts; A1: proprietary license; A2: requires Windows license; A3: cannot distribute

;;; #22459 ttf-ms-win11-zh_tw
;;;   BLOCKED: PROPRIETARY_FONT_LICENSE — Microsoft Windows 11 Traditional Chinese fonts; A1: proprietary license; A2: requires Windows license; A3: cannot distribute

;;; #7274 vdhcoapp
;;;   BLOCKED: SOURCE_UNAVAILABLE — not in AUR metadata; A1: Video DownloadHelper companion app removed from AUR; A2: no upstream; A3: no actionable path

;;; #24 vivaldi-ffmpeg-codecs
;;;   BLOCKED: SOURCE_UNAVAILABLE — not in AUR metadata; A1: Vivaldi ffmpeg codecs removed from AUR; A2: typically bundled with Vivaldi; A3: no source

;;; #46 whatsapp-for-linux
;;;   BLOCKED: SOURCE_UNAVAILABLE — not in AUR metadata; A1: package removed from AUR; A2: was unofficial WhatsApp wrapper; A3: no source

;;; #38 zettlr
;;;   BLOCKED: SOURCE_UNAVAILABLE — not in AUR metadata; A1: Markdown editor removed from AUR; A2: Electron app, complex build; A3: no source

;;; #3325 ancient-packages
;;;   BLOCKED: ARCH_SPECIFIC — lists packages no longer in repos; A1: depends on package-query (pacman/libalpm); A2: concept only applies to pacman; A3: not portable

;;; #12149 binder_linux-dkms
;;;   BLOCKED: DKMS_KERNEL_MODULE — Android binder kernel module via DKMS; A1: DKMS not supported in Guix; A2: out-of-tree kernel module; A3: Anbox deprecated in favor of Waydroid

;;; #10703 lib32-libtxc_dxtn
;;;   BLOCKED: LIB32_UNSUPPORTED — 32-bit S3TC texture compression library; A1: Guix lacks 32-bit multilib; A2: S3TC now built into Mesa; A3: obsolete

;;; #2584 lib32-zix
;;;   BLOCKED: LIB32_UNSUPPORTED — 32-bit C99 portability library; A1: Guix lacks 32-bit multilib; A2: meson build but no 32-bit cross target; A3: use 64-bit zix

;;; #9955 linux-zen-versioned-docs-bin
;;;   BLOCKED: LINUX_METAPACKAGE — kernel metapackage pointing to version-pinned zen docs; A1: metapackage for ephemeral kernel version; A2: dep linux6.19.11.zen1 not available; A3: Guix manages kernels differently

;;; #9954 linux-zen-versioned-headers-bin
;;;   BLOCKED: LINUX_METAPACKAGE — kernel metapackage pointing to version-pinned zen headers; A1: metapackage for ephemeral kernel version; A2: dep not available; A3: Guix manages kernels differently

;;; #1130 localepurge-hook
;;;   BLOCKED: ARCH_SPECIFIC — pacman hook for localepurge; A1: libalpm hook mechanism; A2: depends on localepurge; A3: Guix handles locales via system configuration

;;; #10058 mandb-instant-update
;;;   BLOCKED: ARCH_SPECIFIC — pacman hook for mandb updates; A1: libalpm hook mechanism; A2: Guix profiles auto-update man-db; A3: not portable

;;; #12123 mkinitcpio-sd-numlock
;;;   BLOCKED: ARCH_SPECIFIC — mkinitcpio hook for numlock via systemd; A1: mkinitcpio is Arch-specific initramfs tool; A2: Guix uses own initrd generation; A3: not portable

;;; #11783 paccache-hook
;;;   BLOCKED: ARCH_SPECIFIC — pacman hook for cache cleanup; A1: libalpm hook; A2: depends on pacman-contrib; A3: Guix garbage collection handles this

;;; #12874 systemd-boot-pacman-hook
;;;   BLOCKED: ARCH_SPECIFIC — pacman hook for systemd-boot; A1: libalpm hook mechanism; A2: Guix manages bootloader via system config; A3: not portable

;;; #15341 yaycache-hook
;;;   BLOCKED: ARCH_SPECIFIC — yay cache cleanup hook; A1: depends on yaycache (AUR helper specific); A2: pacman hook; A3: not portable

;;; #3192 youtube-music-desktop
;;;   BLOCKED: DEP_UNAVAILABLE — YouTube Music web app; A1: depends on qtws-base (Qt Web Shell) not in Guix; A2: qtws-base itself not packaged; A3: would need full qtws stack

;;; #11762 amneziawg-dkms
;;;   BLOCKED: DKMS_KERNEL_MODULE — AmneziaWG VPN kernel module via DKMS; A1: DKMS not supported; A2: out-of-tree kernel module; A3: needs kernel headers

;;; #9822 arch-gdm-theme-list
;;;   BLOCKED: ARCH_SPECIFIC — Arch Linux GDM theme; A1: Arch branding for GDM login screen; A2: depends on Arch-specific assets; A3: not useful outside Arch

;;; #12711 caddy-cloudflare-l4
;;;   BLOCKED: NEEDS_RECIPE_DESIGN — Caddy with Cloudflare DNS + L4 plugins; A1: needs xcaddy build tool + network for Go module download; A2: Guix sandboxed builds prohibit network; A3: would need vendored Go dependencies

;;; #2850 checkupdates-notify
;;;   BLOCKED: ARCH_SPECIFIC — update notification using pacman-contrib; A1: depends on pacman-contrib checkupdates; A2: pacman-specific; A3: Guix has own update mechanism

;;; #925 csharpier
;;;   BLOCKED: DOTNET_UNSUPPORTED — .NET C# code formatter; A1: requires aspnet-runtime-10.0; A2: .NET SDK not available in Guix; A3: .NET ecosystem not supported

;;; #10740 cython2
;;;   BLOCKED: DEPRECATED — Cython for Python 2; A1: depends on python2 which is EOL; A2: python2-setuptools required; A3: Python 2 ecosystem deprecated

;;; #360 deezer-enhanced
;;;   BLOCKED: ELECTRON_APP — unofficial Deezer client; A1: depends on electron37; A2: Electron apps extremely complex to build in Guix; A3: npm build system overhead

;;; #3117 discord-chat-exporter-plus-cli
;;;   BLOCKED: DOTNET_UNSUPPORTED — .NET Discord chat exporter; A1: requires dotnet-runtime-10.0; A2: .NET SDK not in Guix; A3: .NET ecosystem not supported

;;; #2485 etckeeper-packages
;;;   BLOCKED: ARCH_SPECIFIC — etckeeper integration for pacman; A1: depends on pacman; A2: tracks installed Arch packages in etckeeper; A3: Guix has own package tracking

;;; #7625 i2c-nct6793-dkms-git
;;;   BLOCKED: DKMS_KERNEL_MODULE — Nuvoton NCT6793 I2C DKMS kernel module; A1: DKMS not supported; A2: out-of-tree kernel module; A3: needs kernel headers

;;; #901 imx471-dkms-git
;;;   BLOCKED: DKMS_KERNEL_MODULE — IMX471 camera sensor DKMS kernel module; A1: DKMS not supported; A2: out-of-tree kernel module; A3: needs kernel headers

;;; #1128 intel-ucode-git
;;;   BLOCKED: FIRMWARE_PACKAGE — Intel CPU microcode from git; A1: firmware binary blob; A2: requires iucode-tool for extraction; A3: Guix has own microcode handling via nonfree firmware

;;; #10378 iptvnator-electron-bin
;;;   BLOCKED: ELECTRON_APP — IPTVnator Electron-based IPTV player; A1: depends on electron39 runtime; A2: Electron apps complex in Guix; A3: proprietary DRM components

;;; #12151 it87-dkms-git
;;;   BLOCKED: DKMS_KERNEL_MODULE — ITE IT87 hardware monitor DKMS kernel module; A1: DKMS not supported; A2: out-of-tree kernel module; A3: needs kernel headers

;;; #6767 ithc-dkms-git
;;;   BLOCKED: DKMS_KERNEL_MODULE — Intel Touch Host Controller DKMS module; A1: DKMS not supported; A2: out-of-tree kernel module; A3: needs kernel headers

;;; #7639 ivpn-dinit
;;;   BLOCKED: DEP_UNAVAILABLE — dinit service for IVPN; A1: depends on dinit init system not in Guix; A2: Guix uses Shepherd not dinit; A3: init script not portable

;;; #2831 jdk-doc
;;;   BLOCKED: PROPRIETARY_LICENSE — Oracle Java documentation; A1: Oracle proprietary license; A2: redistribution restricted; A3: use OpenJDK docs instead

;;; #3851 jdk21-graalvm-ee-bin
;;;   BLOCKED: PROPRIETARY_LICENSE — GraalVM Enterprise Edition binary; A1: Oracle GFTC proprietary license; A2: redistribution restricted; A3: use GraalVM CE instead

;;; #11285 konica-minolta-bizhub-c554e-series
;;;   BLOCKED: PROPRIETARY_LICENSE — Konica Minolta printer driver; A1: proprietary commercial license; A2: closed-source binary; A3: cannot redistribute

;;; #12378 lact-openrc
;;;   BLOCKED: DEP_UNAVAILABLE — OpenRC init script for LACT GPU manager; A1: depends on OpenRC init system; A2: Guix uses Shepherd; A3: init script not portable

;;; #2433 lib32-a52dec
;;;   BLOCKED: LIB32_UNSUPPORTED — 32-bit ATSC A/52 decoder library; A1: Guix lacks 32-bit multilib; A2: no lib32 cross-compile; A3: use 64-bit a52dec

;;; #10745 lib32-gperftools
;;;   BLOCKED: LIB32_UNSUPPORTED — 32-bit Google performance tools; A1: Guix lacks 32-bit multilib; A2: depends on lib32-libunwind; A3: use 64-bit gperftools

;;; #11300 lib32-opencl-legacy-amdgpu-pro
;;;   BLOCKED: PROPRIETARY_DRIVER — 32-bit proprietary AMD OpenCL driver; A1: proprietary AMDGPU-PRO EULA; A2: 32-bit multilib unsupported; A3: closed-source binary

;;; #3631 linux-xanmod-linux-bin-x64v3
;;;   BLOCKED: CUSTOM_KERNEL — prebuilt Xanmod kernel binary; A1: Arch-packaged kernel binary; A2: not buildable, binary-only; A3: Guix manages kernels differently

;;; #3632 linux-xanmod-linux-headers-bin-x64v3
;;;   BLOCKED: CUSTOM_KERNEL — prebuilt Xanmod kernel headers; A1: headers for Xanmod kernel binary; A2: binary-only; A3: coupled to custom kernel

;;; #3624 linux-xanmod-lts-linux-bin-x64v3
;;;   BLOCKED: CUSTOM_KERNEL — prebuilt Xanmod LTS kernel binary; A1: Arch-packaged kernel binary; A2: binary-only; A3: Guix manages kernels differently

;;; #3625 linux-xanmod-lts-linux-headers-bin-x64v3
;;;   BLOCKED: CUSTOM_KERNEL — prebuilt Xanmod LTS kernel headers; A1: headers for LTS kernel binary; A2: binary-only; A3: coupled to custom kernel

;;; #9953 linux-zen-versioned-bin
;;;   BLOCKED: LINUX_METAPACKAGE — metapackage for version-pinned zen kernel; A1: points to ephemeral kernel version; A2: dep not available; A3: Guix manages kernels differently

;;; #11199 llvm-mos-git
;;;   BLOCKED: INFEASIBLE_BUILD — LLVM fork targeting MOS 6502; A1: full LLVM fork with custom backend; A2: massive build (~2h+); A3: niche target, high maintenance burden

;;; #4632 lunar-client
;;;   BLOCKED: PROPRIETARY_LICENSE — Minecraft PvP modpack; A1: proprietary/unknown license; A2: likely AppImage with no redistribution rights; A3: gaming client with unclear terms

;;; #7196 luajit-clang-git
;;;   BLOCKED: NEEDS_RECIPE_DESIGN — LuaJIT patched for clang compilation; A1: standard LuaJIT already in (gnu packages lua); A2: clang-specific patches need integration; A3: variant of existing package needs careful recipe design

