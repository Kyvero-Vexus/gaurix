;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; deptree-resolver-260425f — BLOCKED package notes
;;; 97 packages remain BLOCKED after this pass.
;;;
;;; Categories:
;;;   DEP_RESOLUTION_FAILED  — dependencies not available in Guix (38)
;;;   TOOLING_FAILURE        — prior tooling/scripting failures (12)
;;;   SOURCE_UNAVAILABLE     — cannot obtain upstream source (9)
;;;   DKMS_KERNEL_MODULE     — Linux DKMS kernel modules, need kernel integration (6)
;;;   DISTRO_SPECIFIC        — Arch Linux specific tools (5)
;;;   MINGW_CROSS_COMPILATION — MinGW Windows cross-compilation targets (4)
;;;   NEEDS_RECIPE_DESIGN    — need custom recipe design (3)
;;;   BROWSER_EXTENSION      — browser extension, not a system package (2)
;;;   ANDROID_SDK_PLATFORM   — Android SDK platform files (2)
;;;   LICENSE_REVIEW_NEEDED  — proprietary/unclear license (2)
;;;   KERNEL_SPECIFIC        — kernel-version-specific headers (2)
;;;   PLATFORM_UNSUPPORTED   — Windows-only application (1)
;;;   MULTILIB_UNSUPPORTED   — 32-bit multilib not supported (1)
;;;   KERNEL_MODULE          — kernel module requiring DKMS (1)
;;;   PROPRIETARY_BINARY     — non-redistributable proprietary binary (1)
;;;   BUILD_NETWORK_REQUIRED — build requires network access (1)
;;;   ABANDONED_UPSTREAM     — project abandoned by upstream (1)
;;;   LEGACY_PYTHON2         — requires Python 2 (1)
;;;   BUILD_FAILED           — build fails, complex deps (1)
;;;   NON_DISTRIBUTABLE      — commercial game, cannot redistribute (1)
;;;   CROSS_COMPILATION      — requires cross-compilation toolchain (1)
;;;   SELINUX_SPECIFIC       — requires SELinux infrastructure (2)

;;; === DEP_RESOLUTION_FAILED (38 packages) ===

;; 1. gradience (#18644) — GTK theming app
;;    Not in AUR cache. Source/version unknown.
;;    Tried: AUR lookup failed, no upstream URL available.

;; 4. wayfire-git (#18359) — 3D Wayland compositor
;;    v0.10.1 source available. Meson build.
;;    Tried: Complex dependency chain (wlroots, wf-config, wf-touch, wf-utils).
;;    wlroots and related Wayland compositor libraries not packaged in Gaurix.
;;    Would need 4+ new dependency packages first.

;; 5. virtualbox-svn (#18799) — VirtualBox from SVN
;;    Extremely complex build (kernel modules, Qt GUI, SDK).
;;    50+ dependencies including kernel headers, SDL, XPCOM.
;;    Not feasible without major packaging effort.

;; 11. edgeimpulse-cli (#18574) — Edge Impulse CLI
;;    npm package with deep Node.js dependency tree.
;;    Guix node-build-system cannot resolve complex npm deps.

;; 26. aws-amplify-cli (#18?) — AWS Amplify CLI
;;    npm package with massive dependency tree.
;;    Not feasible via Guix node-build-system.

;; 27. aws-cdk (#18?) — AWS CDK CLI
;;    npm package with massive dependency tree.
;;    Not feasible via Guix node-build-system.

;; 29. decrypto-pro-git (#18?) — CryptoPro key converter
;;    No tags or releases on GitHub. Commit-pinning only.
;;    Tried: git-fetch possible but needs OpenSSL + specific CryptoPro headers.
;;    CryptoPro SDK not available as open source.

;; 31. faustus-dkms-git (#18?) — ASUS TUF Gaming DKMS driver
;;    DKMS kernel module for ASUS hardware.
;;    Requires kernel module build infrastructure.

;; 33. ideapad-laptop-tb-dkms (#18?) — Lenovo ThinkBook DKMS
;;    DKMS kernel module. Requires kernel build integration.

;; 34. ideapad-laptop-tb2024g6plus-dkms (#18?) — Lenovo ThinkBook DKMS
;;    DKMS kernel module. Requires kernel build integration.

;; 43. nodejs-cspell (#18?) — Spell checker for code
;;    npm package. Complex Node.js dependency tree.

;; 44. osmtogeojson (#18?) — OSM to GeoJSON converter
;;    npm package. Node.js dependency tree.

;; 46. python-home-assistant-frontend (#18?) — Home Assistant frontend
;;    Massive JavaScript/Node.js project.
;;    Build requires npm/yarn with hundreds of dependencies.

;; 47. qt5-mqtt (#18?) — Qt5 MQTT module
;;    Requires qmake + Qt5 private headers.
;;    Complex Qt5 module build requiring Qt5 source tree integration.

;; 55. beammp-launcher-git (#18?) — BeamMP Launcher
;;    C++ project. Only Windows prebuilt binaries.
;;    Linux build requires vcpkg + httplib + curl + custom build chain.

;; 56. java-language-server (#18?) — Java LSP
;;    Maven build with extensive Java dependency tree.
;;    Guix doesn't have maven-build-system for complex projects.

;; 58. lightdm-webkit-theme-aether (#18?) — LightDM theme
;;    Requires webpack/Node.js build. dist/ only has JS, not complete theme.
;;    Would need full Node.js build toolchain.

;; 60. nfuspire-git (#18?) — TI calculator FUSE filesystem
;;    No tags or releases. Small C project.
;;    Tried: Depends on libnspire (not in Guix), would need packaging first.

;; 61. nginx-mainline-mod-njs (#18?) — Nginx njs module
;;    Requires building against nginx mainline source tree.
;;    Complex nginx module build infrastructure not available.

;; 62. nodejs-nestjs-cli (#18?) — NestJS CLI
;;    npm package. Complex dependency tree.

;; 65. phonon-qt4-vlc (#18?) — Phonon Qt4 VLC backend
;;    Qt4 is deprecated and removed from Guix.
;;    Cannot build against Qt4.

;; 66. quartz-utils-git (#18?) — CLI utilities (Crystal)
;;    Written in Crystal language. Crystal compiler not in Guix.
;;    Pre-built static binaries available but as separate downloads per utility.

;; 67. rdt-client (#18?) — Real-Debrid Torrent Client
;;    .NET/ASP.NET application. .NET SDK packaging in Guix is experimental.

;; 68. sbctl-git (#18?) — Secure Boot key manager
;;    Go source (v0.18). No vendored dependencies.
;;    Would need 15+ Go module packages as inputs.
;;    Tried: Checked source tarball, go.mod has complex dep tree.

;; 69. snowflake-pt-server (#18?) — Tor pluggable transport
;;    Go source. No vendored dependencies.
;;    Would need Go module dep resolution.

;; 70. sommelier-git (#18?) — Nested Wayland compositor
;;    Part of ChromiumOS platform2. Huge codebase.
;;    Requires ChromiumOS build infrastructure.

;; 71. texmacs-pure (#18?) — Pure plugin for TeXmacs
;;    Depends on Pure language (not in Guix).

;; 72. tilp-xdg (#18?) — TI calculator link program
;;    Depends on libticables, libticalcs, libticonv, libtifiles (not in Guix).
;;    Would need 4+ new dependency packages.

;; 75. eclipse-pydev (#18?) — Python IDE for Eclipse
;;    Eclipse plugin. Requires Eclipse build infrastructure.

;; 77. gearhead2 (#18?) — Mecha RPG game
;;    Requires Free Pascal compiler (fpc).
;;    FPC not well-supported in Guix.

;; 78. gephi-git (#18?) — Network visualization
;;    Java/Maven/Ant project with complex build.
;;    Requires extensive Java packaging infrastructure.

;; 79. lobe-chat (#18?) — LLM chat framework
;;    Electron app. Pre-built .deb/.AppImage available.
;;    Tried: Download URL format differs from expected. Electron repacking complex.

;; 92. bililive-recorder (#18?) — BiliBili stream recorder
;;    .NET application. Requires .NET SDK/runtime packaging.

;; 94. hq (#18?) — HTML processor (Go)
;;    Go project. No prebuilt binaries.
;;    Would need Go module dependency resolution.

;; 97. mailnaggertray-git (#18?) — Mail notification tray
;;    No releases or tags on Codeberg. Python/Qt.
;;    Tried: No versioned source available for packaging.

;; 98. musique (#18?) — Qt music player
;;    Qt6 + taglib + mpv deps exist in Guix.
;;    Tried: Source is git-only from flavio.tordini.org, no tagged releases.
;;    Would need git-fetch with specific commit pinning.

;; 99. nemo-engrampa (#18?) — Nemo archive plugin
;;    Depends on nemo and engrampa (Cinnamon desktop).
;;    Neither nemo nor engrampa packaged in Guix.

;;; === TOOLING_FAILURE (12 packages) ===

;; 9. aquacomputer_d5next-hwmon-dkms (#18606)
;;    DKMS kernel module for Aquacomputer PC water cooling hardware.
;;    Requires kernel module build infrastructure.

;; 14. locale-mul_zz (#18423)
;;    Custom locale data. Requires glibc-locales infrastructure.
;;    Arch-specific locale generation not applicable to Guix.

;; 17. playerctld-systemd-unit (#18838)
;;    Just a systemd user unit file for playerctld.
;;    Guix uses Shepherd, not systemd. Unit file not applicable.

;; 18. repacman (#18707)
;;    Tool for creating pacman packages. Arch Linux specific.

;; 20. amneziawg-dkms-git (#18642)
;;    AmneziaWG kernel module via DKMS.
;;    Requires kernel module build infrastructure.

;; 25. archwiki-offline (#18?) — Arch Wiki offline viewer
;;    No releases or tags. Shell script for Arch Wiki.
;;    Arch Linux specific content.

;; 32. findbrokenpkgs (#18?) — Broken package identifier
;;    Arch Linux specific tool (uses pacman database).

;; 50. sbctl-initcpio-post-hook (#18?)
;;    mkinitcpio hook for sbctl. Arch/mkinitcpio specific.

;; 53. vscodium-marketplace (#18?)
;;    Patches VSCodium to enable VS Code marketplace.
;;    Requires modifying VSCodium internals, not a standalone package.

;; 57. libarchive-static (#18?) — Static libarchive
;;    Static build of libarchive for bsdtar.
;;    Guix already has libarchive; static variant needs justification.
;;    Tried: Would need custom configure flags on existing libarchive.

;; 82. php83-mcrypt (#18?) — PHP mcrypt extension
;;    PHP extension for unmaintained libmcrypt.
;;    Requires PHP extension build infrastructure.
;;    PHP version-specific (8.3).

;; 6. neovim-lspconfig-opt-git (#18703)
;;    Not in AUR cache. Likely a Neovim plugin.
;;    Neovim plugins not packaged as system packages in Guix.

;;; === SOURCE_UNAVAILABLE (9 packages) ===

;; 8. squareline-studio (#17812) — UI design tool
;;    Proprietary, requires login to download. Cannot redistribute.

;; 15. luniistore (#18478) — Lunii storyteller manager
;;    Proprietary, source not publicly available.

;; 19. simplicity-commander (#18419) — Silicon Labs debug tool
;;    Proprietary binary from Silicon Labs, requires account.

;; 49. receitanet (#18?) — Brazilian tax filing tool
;;    Government software, source not publicly available.

;; 54. wyc (#18?) — 网云穿 port mapping tool
;;    Chinese commercial software, source not available.

;; 76. euroscope-bin (#18?) — VATSIM radar scope
;;    Windows-only proprietary application.

;; 83. plugin-autenticacao-gov-pt (#18?) — Portuguese auth plugin
;;    Government software, source not publicly available.

;; 88. urbanterror (#18?) — FPS game
;;    Game data/binaries no longer available from upstream.

;; 95. inkdrop (#18?) — Note-taking app
;;    Proprietary, requires paid license and account to download.

;;; === DKMS_KERNEL_MODULE (6 packages) ===

;; 21. amneziawg-linux (#18?) — AmneziaWG for standard kernel
;;    Kernel module requiring DKMS. Not applicable to Guix kernel model.

;; 22. amneziawg-linux-hardened (#18?) — AmneziaWG for hardened kernel
;;    Kernel module requiring DKMS. Not applicable to Guix kernel model.

;; 45. pfring-dkms (#18?) — PF_RING packet capture
;;    Kernel module. Requires kernel build integration.

;; 48. r8126-dkms (#18?) — Realtek RTL8126 driver
;;    Kernel module. Requires kernel build integration.

;; 63. nvidia-bl-dkms (#18?) — NVIDIA backlight driver
;;    Kernel module. Requires kernel build integration.

;; 86. rtl88x2ce-dkms-git (#18?) — Realtek WiFi driver
;;    Kernel module. Requires kernel build integration.

;;; === DISTRO_SPECIFIC (5 packages) ===

;; 16. mkinitcpio-systemd-root-password (#18371)
;;    mkinitcpio hook. Arch/mkinitcpio specific.

;; 51. system-age (#18?) — Check Arch install date
;;    Reads pacman database for installation time. Arch specific.

;; 59. linux-keep-modules (#18?) — Preserve kernel modules
;;    Arch-specific package for kernel module preservation during upgrade.

;; 64. pacpak-git (#18?) — Flatpak pacman wrapper
;;    Pacman wrapper for flatpak. Arch specific.

;; 73. chromium-extension-arch-search (#18?)
;;    Chromium extension for Arch Linux search. Arch specific.

;;; === MINGW_CROSS_COMPILATION (4 packages) ===

;; 39. mingw-w64-cblas (#18?)
;; 40. mingw-w64-lapack (#18?)
;; 41. mingw-w64-soundtouch (#18?)
;; 80. mingw-w64-sqlite (#18?)
;;    All require MinGW-w64 cross-compilation toolchain.
;;    Not applicable to Guix's cross-compilation model.

;;; === NEEDS_RECIPE_DESIGN (3 packages) ===

;; 7. sipgate-app-clinq (#18449)
;;    Not in AUR cache. No source or version information available.

;; 30. emmet-language-server (#18?)
;;    npm package @olrtg/emmet-language-server.
;;    Node.js dependency tree too complex for Guix node-build-system.

;; 35. knossu (#18?) — Doom-like game
;;    Very old (2015). Custom license. Source availability unclear.

;; 93. futu-ftnn-wine (#18?) — Futu Bull trading app via Wine
;;    Requires Wine + proprietary Windows binary.
;;    Not a packageable open-source application.

;;; === BROWSER_EXTENSION (2 packages) ===

;; 12. librewolf-extension-ublock-origin-bin (#18355)
;;    Browser extension (.xpi). Not a system package.
;;    Should be installed via browser extension manager.

;; 13. librewolf-tridactyl-native-bin (#18285)
;;    Browser native messaging host.
;;    Tied to specific browser configuration, not a standalone package.

;;; === ANDROID_SDK_PLATFORM (2 packages) ===

;; 23. android-platform-19 (#18?)
;; 24. android-platform-21 (#18?)
;;    Android SDK platform files. Proprietary Google binaries.
;;    Guix has android-tools but not SDK platform packages.

;;; === LICENSE_REVIEW_NEEDED (2 packages) ===

;; 28. brother-mfc-l2400dw (#18?)
;;    Brother commercial printer driver license.
;;    Non-free, cannot redistribute.

;; 52. ttf-consolas-ligaturized (#18?)
;;    Based on Microsoft Consolas font (proprietary).
;;    Cannot redistribute modified proprietary font.

;;; === KERNEL_SPECIFIC (2 packages) ===

;; 90. zfs-linux-hardened-headers (#18?)
;; 91. zfs-linux-rt-headers (#18?)
;;    Kernel-version-specific ZFS headers.
;;    Guix handles ZFS at the system configuration level, not as separate packages.

;;; === SELINUX_SPECIFIC (2 packages) ===

;; 2. sudo-selinux (#18513)
;;    SELinux-enabled sudo. Guix does not use SELinux.

;; 3. base-selinux (#18537)
;;    SELinux base package set. Guix does not use SELinux.

;;; === PLATFORM_UNSUPPORTED (1 package) ===

;; 10. bakkesmod-steam (#17468) — Rocket League mod
;;    Windows-only application for a Windows game.

;;; === MULTILIB_UNSUPPORTED (1 package) ===

;; 36. lib32-opencl-nvidia-390xx (#18?)
;;    32-bit NVIDIA OpenCL for legacy 390xx driver.
;;    Guix does not support multilib.

;;; === KERNEL_MODULE (1 package) ===

;; 37. libch343ser-git (#18?) — WCH USB serial driver
;;    Kernel module for WCH USB serial chips.
;;    Requires kernel module build infrastructure.

;;; === PROPRIETARY_BINARY (1 package) ===

;; 38. libfprint-2-tod1-broadcom-cv3plus (#18?)
;;    Proprietary Dell ControlVault3 fingerprint driver.
;;    Non-redistributable binary.

;;; === BUILD_NETWORK_REQUIRED (1 package) ===

;; 42. nftables-geoip-db (#18?) — GeoIP database for nftables
;;    Build process downloads GeoIP database from db-ip.com.
;;    Guix builds cannot access the network.

;;; === ABANDONED_UPSTREAM (1 package) ===

;; 74. clash-for-windows-chinese (#18?) — Clash proxy GUI
;;    Original Clash for Windows project abandoned.
;;    Repository archived, no active maintenance.

;;; === LEGACY_PYTHON2 (1 package) ===

;; 84. python2-wxpython3 (#18?) — wxPython for Python 2
;;    Requires Python 2 which is EOL.
;;    Guix has removed Python 2 support.

;;; === BUILD_FAILED (1 package) ===

;; 85. qtspim-iconfix (#18?) — MIPS simulator
;;    Qt5 MIPS simulator. Build fails.
;;    Tried: Source from SourceForge via SVN, complex build.
;;    Depends on obsolete Qt5 build patterns.

;;; === NON_DISTRIBUTABLE (1 package) ===

;; 89. ut2004-gog (#18?) — Unreal Tournament 2004
;;    Commercial game requiring GOG purchase.
;;    Cannot redistribute game data.

;;; === CROSS_COMPILATION (1 package) ===

;; 96. kamilsss655-uv-k5-firmware-custom-git (#18?)
;;    Custom firmware for UV-K5 handheld radio.
;;    Requires arm-none-eabi cross-compilation toolchain.
