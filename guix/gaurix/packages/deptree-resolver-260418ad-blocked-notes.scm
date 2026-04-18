;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Blocked notes for deptree-resolver-260418ad
;;; 48 packages moved to FAILED status.
;;;
;;; === FAILED packages ===
;;;       1.  omnissa-horizon-client -> PROPRIETARY_APP: Omnissa Horizon Client is proprietary VMware virtual desktop client; non-redistributable binary
;;;       2.  flutter-common -> COMPLEX_BUILD_CHAIN: Flutter SDK common component; requires complete Flutter/Dart SDK bootstrap chain not available in Guix
;;;       3.  nvidia-580xx-utils -> PROPRIETARY_DRIVER: NVIDIA 580xx proprietary driver utilities; Guix provides non-free drivers via separate channels
;;;       4.  gpu-screen-recorder -> MISSING_SOURCE: not found in AUR metadata cache; package removed or renamed
;;;       5.  arm-linux-gnueabihf-linux-api-headers -> CROSS_TOOLCHAIN: ARM cross-compilation Linux API headers; Guix has native cross-compilation support via --target
;;;       6.  intel-ipu6-dkms-git -> DKMS_MODULE: out-of-tree Intel IPU6 camera kernel driver; Guix handles kernel modules via operating-system config, not DKMS
;;;       7.  lib32-libindicator-gtk2 -> MULTILIB_UNSUPPORTED: 32-bit library for libindicator-gtk2; Guix does not support multilib/lib32 packages
;;;       8.  flutter-gradle -> COMPLEX_BUILD_CHAIN: Flutter Gradle plugin; requires Flutter SDK bootstrap and Android SDK
;;;       9.  arm-linux-gnueabihf-gcc-stage2 -> CROSS_TOOLCHAIN: ARM cross-compilation GCC stage2; Guix has native cross-compilation support via --target
;;;       10.  flutter-devel -> COMPLEX_BUILD_CHAIN: Flutter development tools; requires complete Flutter SDK bootstrap chain
;;;       11.  vesktop -> ELECTRON_NPM_COMPLEX: Electron-based Discord client; requires full Electron runtime and complex npm dependency resolution
;;;       12.  flutter-target-web -> COMPLEX_BUILD_CHAIN: Flutter web compilation target; requires Flutter SDK bootstrap chain
;;;       13.  libxnvctrl-340xx -> PROPRIETARY_DRIVER: NVIDIA 340xx legacy libXNvCtrl; proprietary driver component, no longer maintained
;;;       14.  flutter-target-linux -> COMPLEX_BUILD_CHAIN: Flutter Linux compilation target; requires Flutter SDK bootstrap chain
;;;       15.  mcpelauncher-linux -> COMPLEX_BUILD_CHAIN: Minecraft Bedrock launcher requires Android runtime translation layer (ANGLE, pulseaudio-compat); extremely complex cross-platform build
;;;       16.  wemeet-bin -> PROPRIETARY_APP: Tencent Meeting (WeMeet) is proprietary; non-redistributable commercial software
;;;       17.  systemd-liberated-libs-git -> DISTRO_SPECIFIC: Extracted systemd shared libraries; Guix uses Shepherd init system, not systemd
;;;       18.  1password-cli -> PROPRIETARY_APP: 1Password CLI is proprietary; non-redistributable binary with custom license
;;;       19.  aic94xx-firmware -> PROPRIETARY_FIRMWARE: Adaptec AIC94xx SAS/SATA controller firmware; proprietary binary blob
;;;       20.  alhp-keyring -> DISTRO_SPECIFIC: Arch Linux keyring for ALHP repository; depends on pacman-key and Arch trust model
;;;       21.  ast-firmware -> PROPRIETARY_FIRMWARE: ASPEED AST graphics firmware; proprietary binary blob
;;;       22.  dms-shell-hyprland -> MISSING_SOURCE: not found in AUR metadata cache; package removed or renamed
;;;       23.  dms-shell-niri -> MISSING_SOURCE: not found in AUR metadata cache; package removed or renamed
;;;       24.  edk2-ovmf-fedora -> DISTRO_SPECIFIC: Pre-built OVMF firmware from Fedora; Guix has its own ovmf package built from source
;;;       25.  freedom -> DISTRO_SPECIFIC: DFSG metapackage that conflicts with non-free Arch packages; Guix is already free-software-only by design
;;;       26.  hbuilderx-bin -> PROPRIETARY_APP: HBuilderX is proprietary DCloud IDE; non-redistributable commercial software
;;;       27.  indicator-sysmonitor-appindicator-git -> MISSING_SOURCE: not found in AUR metadata cache; package removed or renamed
;;;       28.  kraken_desktop -> ELECTRON_NPM_COMPLEX: Electron-based NZXT Kraken cooler controller; requires Electron runtime and hardware access
;;;       29.  lib32-amdgpu-pro-oglp -> MULTILIB_UNSUPPORTED: 32-bit AMD GPU Pro OpenGL library; Guix does not support multilib/lib32 packages
;;;       30.  lib32-mcpelauncher-linux -> MULTILIB_UNSUPPORTED: 32-bit Minecraft PE Launcher helper; Guix does not support multilib/lib32 packages
;;;       31.  mangowc -> MISSING_SOURCE: not found in AUR metadata cache; package removed or renamed
;;;       32.  meocloud-cli -> PROPRIETARY_APP: MEO Cloud CLI is proprietary Portuguese cloud storage client; non-redistributable
;;;       33.  millennium-debug -> MISSING_SOURCE: not found in AUR metadata cache; package removed or renamed
;;;       34.  navicat17-premium-en -> PROPRIETARY_APP: Navicat Premium is proprietary database management tool; non-redistributable commercial software
;;;       35.  nrfutil -> PROPRIETARY_APP: Nordic Semiconductor nRF Util is proprietary firmware tool; non-redistributable binary
;;;       36.  omarchy -> PLACEHOLDER_PACKAGE: version 0.0.0, no source/content, placeholder until DHH's official Hyprland setup release
;;;       37.  overte-appimage -> APPIMAGE_UNSUPPORTED: AppImage distribution format; should be unpacked and repackaged properly but source build preferred
;;;       38.  packettracer -> PROPRIETARY_APP: Cisco Packet Tracer is proprietary network simulation software; non-redistributable
;;;       39.  pacman-log-orphans-hook -> DISTRO_SPECIFIC: pacman hook for orphan packages; depends on pacman infrastructure which is Arch-specific
;;;       40.  pragmatapro-fonts -> PROPRIETARY_APP: PragmataPro is a proprietary commercial font; requires purchased license
;;;       41.  publii -> ELECTRON_NPM_COMPLEX: Electron-based static site CMS; requires full Electron runtime and complex npm build chain
;;;       42.  questpatcher-bin -> DOTNET_SDK_REQUIRED: .NET-based Quest VR patcher; requires .NET runtime not available in Guix
;;;       43.  qwen-code -> MISSING_SOURCE: not found in AUR metadata cache; package removed or renamed
;;;       44.  rutoken-pkcs11 -> PROPRIETARY_LIB: Rutoken PKCS#11 module is proprietary cryptographic token library; non-redistributable
;;;       45.  shiftfs-lts-dkms -> DKMS_MODULE: out-of-tree shiftfs kernel module for LTS kernels; Guix handles kernel modules via operating-system config, not DKMS
;;;       46.  sticky -> MISSING_SOURCE: not found in AUR metadata cache; package removed or renamed
;;;       47.  subtitleedit-avalonia -> DOTNET_SDK_REQUIRED: .NET Avalonia-based subtitle editor; requires .NET SDK not available in Guix
;;;       48.  swaync -> MISSING_SOURCE: not found in AUR metadata cache; package removed or renamed
