;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; deptree-resolver-260425g — BLOCKED package notes
;;; 96 packages remain BLOCKED after this pass.
;;;
;;; Categories:
;;;   DEP_RESOLUTION_FAILED  — dependencies not available in Guix (34)
;;;   DKMS_KERNEL_MODULE     — Linux DKMS kernel modules (11)
;;;   DISTRO_SPECIFIC        — Arch Linux specific tools (10)
;;;   SOURCE_UNAVAILABLE     — cannot obtain upstream source (9)
;;;   TOOLING_FAILURE        — prior tooling/scripting failures (5)
;;;   MINGW_CROSS_COMPILATION — MinGW Windows cross-compilation (4)
;;;   NEEDS_RECIPE_DESIGN    — need custom recipe design (2)
;;;   SELINUX_SPECIFIC       — requires SELinux infrastructure (2)
;;;   BROWSER_EXTENSION      — browser extension, not a system package (2)
;;;   ANDROID_SDK_PLATFORM   — Android SDK platform files (2)
;;;   LICENSE_REVIEW_NEEDED  — proprietary/unclear license (2)
;;;   KERNEL_SPECIFIC        — kernel-version-specific headers (2)
;;;   PLATFORM_UNSUPPORTED   — platform not supported (1)
;;;   MULTILIB_UNSUPPORTED   — 32-bit multilib not supported (1)
;;;   KERNEL_MODULE          — kernel module requiring DKMS (1)
;;;   PROPRIETARY_BINARY     — non-redistributable proprietary binary (1)
;;;   BUILD_NETWORK_REQUIRED — build requires network access (1)
;;;   ABANDONED_UPSTREAM     — project abandoned by upstream (1)
;;;   LEGACY_PYTHON2         — requires Python 2 (1)
;;;   BUILD_FAILED           — build fails, complex deps (1)
;;;   NON_DISTRIBUTABLE      — commercial, cannot redistribute (1)
;;;   CROSS_COMPILATION      — requires cross-compilation toolchain (1)

;;; === DEP_RESOLUTION_FAILED (34 packages) ===

;; 1. gradience (#18644) — GTK theming app
;;    Not in AUR cache. Upstream: github.com/GradienceTeam/Gradience.
;;    Meson build, depends on python-material-color-utilities (not in Guix).
;;    A1: AUR lookup failed. A2: Would need 3+ Python deps packaged first.
;;    A3: Upstream is a GNOME Circle project but complex dep chain.

;; 4. wayfire-git (#18359) — 3D Wayland compositor
;;    v0.10.1. Meson build. Complex dep chain: wlroots, wf-config,
;;    wf-touch, wf-utils — 4+ packages not in Guix.
;;    A1: Dep chain too deep. A2: Guix already has stable wayfire.
;;    A3: Would need entire Wayland compositor stack first.

;; 5. virtualbox-svn (#18799) — VirtualBox from SVN
;;    Extremely complex build: 50+ deps, kernel modules, Qt6 GUI, SDK.
;;    A1: Build complexity impossible. A2: Binary repack not feasible.
;;    A3: Guix nonguix has virtualbox-bin already.

;; 11. edgeimpulse-cli (#18574) — Edge Impulse CLI
;;    npm package. Complex Node.js dependency tree.
;;    A1: node-build-system can't handle deep npm deps.
;;    A2: Binary not available. A3: No standalone executable.

;; 26. aws-amplify-cli (#18?) — AWS Amplify CLI
;;    npm package with massive dependency tree. Out-of-date in AUR.
;;    A1/A2/A3: npm packaging impossible in Guix for complex trees.

;; 27. aws-cdk (#18?) — AWS CDK CLI
;;    npm package with massive dependency tree.
;;    A1/A2/A3: Same npm packaging limitations as aws-amplify-cli.

;; 29. decrypto-pro-git (#18?) — CryptoPro key converter
;;    Depends on openssl-gost-engine (not in Guix).
;;    A1: Need openssl-gost-engine packaged first.
;;    A2: Small C build otherwise feasible. A3: Blocked on one dep.

;; 30. emmet-language-server (#18?) — Emmet LSP
;;    npm package. Node.js dependency tree.
;;    A1/A2/A3: npm packaging limitations.

;; 43. nodejs-cspell (#18?) — Spell checker for code
;;    npm package. Out-of-date in AUR.
;;    A1/A2/A3: npm packaging limitations.

;; 44. osmtogeojson (#18?) — OSM to GeoJSON converter
;;    npm package.
;;    A1: node-build-system limitations. A2: Relatively small but
;;    still npm. A3: No standalone binary available.

;; 46. python-home-assistant-frontend (#18?) — HA frontend
;;    Massive JavaScript/Node.js project with hundreds of deps.
;;    A1/A2/A3: Build requires npm/yarn, impossible in Guix sandbox.

;; 47. qt5-mqtt (#18?) — Qt5 MQTT module
;;    Requires qmake + Qt5 private headers.
;;    A1: Complex Qt5 module build. A2: Needs Qt5 source tree.
;;    A3: Niche, low priority.

;; 55. beammp-launcher-git (#18?) — BeamMP Launcher
;;    C++ with CMake + vcpkg. vcpkg incompatible with Guix.
;;    A1: vcpkg dep model conflicts with Guix. A2: Missing evpp dep.
;;    A3: Niche game mod launcher.

;; 56. java-language-server (#18?) — Java LSP
;;    Maven build with massive dependency tree.
;;    A1: No maven-build-system in Guix. A2: Binary repack complex.
;;    A3: Eclipse/Java toolchain not feasible.

;; 58. lightdm-webkit-theme-aether (#18?) — LightDM theme
;;    Depends on lightdm-webkit2-greeter (not in Guix).
;;    A1: Blocked on lightdm-webkit2-greeter.
;;    A2: Theme itself is just static files. A3: Single dep blocker.

;; 60. nfuspire-git (#18?) — FUSE filesystem for TI Nspire
;;    Depends on libnspire (not in Guix).
;;    A1: Need libnspire first. A2: Very niche. A3: Only 1 commit.

;; 61. nginx-mainline-mod-njs (#18?) — Nginx NJS module
;;    Requires nginx source tree and custom build integration.
;;    A1: Complex nginx module build. A2/A3: Needs nginx build infra.

;; 62. nodejs-nestjs-cli (#18?) — NestJS CLI
;;    npm package. Complex dependency tree.
;;    A1/A2/A3: npm packaging limitations.

;; 65. phonon-qt4-vlc (#18?) — Phonon VLC backend for Qt4
;;    Qt4 is dead. phonon-qt4 not in Guix.
;;    A1: Qt4 dependency. A2: Obsolete technology.
;;    A3: No demand for Qt4 backends.

;; 66. quartz-utils-git (#18?) — Crystal language utility
;;    Written in Crystal. Crystal not available in Guix.
;;    A1: Crystal bootstrapping is self-referential.
;;    A2/A3: No Crystal ecosystem in Guix at all.

;; 67. rdt-client (#18?) — Real-Debrid torrent client
;;    ASP.NET 10 app. Guix only has dotnet 8.
;;    A1: Runtime version gap. A2: Binary needs newer ASP.NET.
;;    A3: .NET packaging in Guix immature.

;; 68. sbctl-git (#18?) — Secure Boot key manager
;;    Go project without vendored deps. Release tarball (v0.18) also
;;    lacks vendor/ directory.
;;    A1: Go module resolution required. A2: Would need ~30 Go module
;;    packages. A3: `guix import go` could help but not tested.

;; 69. snowflake-pt-server (#18?) — Tor Snowflake pluggable transport
;;    Go project. Source tarball lacks vendored deps.
;;    A1: Go module dependency resolution needed.
;;    A2: Many Go module deps not in Guix.
;;    A3: `guix import go` not tested for this project.

;; 70. sommelier-git (#18?) — Wayland→X11 proxy (ChromeOS)
;;    Complex Wayland compositor component from ChromeOS.
;;    A1: Deep ChromeOS dependency chain. A2/A3: Not feasible standalone.

;; 71. texmacs-pure (#18?) — TeXmacs Pure language plugin
;;    Depends on Pure language (not in Guix) and llvm35 (ancient).
;;    A1: Dead upstream. A2: Ancient LLVM dependency.
;;    A3: Pure language ecosystem defunct.

;; 72. tilp-xdg (#18?) — TI calculator file transfer
;;    Depends on 4 libti* libraries (not in Guix).
;;    A1: Would need to package libticables, libticonv, libtifiles,
;;    libticalcs first. A2: All are autotools, feasible but 4-step chain.
;;    A3: Niche calculator utility.

;; 75. eclipse-pydev (#18?) — Eclipse Python IDE plugin
;;    Eclipse plugin with complex build. Guix Eclipse support limited.
;;    A1: No eclipse plugin packaging infra. A2/A3: Build too complex.

;; 77. gbm (#18?) — Game Backup Monitor
;;    VB.NET/Mono app. Needs mono-basic (not in Guix).
;;    A1: mono-basic not available. A2: Binary-only on Linux.
;;    A3: mono-basic would need packaging first.

;; 78. gearhead2-RESOLVED — Roguelike mecha RPG
;;    (Resolved in this pass — recipe created)

;; 79. gephi-git (#18?) — Graph visualization platform
;;    Java/Maven/Ant with complex build. No maven-build-system in Guix.
;;    A1: Build tool chain missing. A2/A3: Massive Java deps.

;; 80. lobe-chat (#18?) — AI chat application
;;    Next.js/React app. Requires npm/pnpm build. Out-of-date in AUR.
;;    A1: npm build limitations. A2: No prebuilt Linux binary.
;;    A3: Docker image exists but not suitable for Guix.

;; 82. php83-mcrypt-FEASIBLE (#18?) — PHP mcrypt extension
;;    PECL extension. Guix has PHP 8.5 + libmcrypt.
;;    A1: Extension is compatible but Guix PHP extension packaging
;;    patterns not well-established.
;;    A2: phpize+autotools build feasible in principle.
;;    A3: mcrypt is unmaintained upstream; low priority.
;;    Status: BLOCKED — needs PHP extension packaging infrastructure.

;; 85. qtspim-iconfix (#18?) — MIPS simulator
;;    Qt5 app on SourceForge SVN. No tags, no source tarballs.
;;    A1: SVN-only source, no version pinning.
;;    A2: Could use latest revision but reproducibility concerns.
;;    A3: qmake build otherwise feasible.

;; 91. bililive-recorder (#18?) — Bilibili livestream recorder
;;    C# .NET 6 project. Needs dotnet-sdk + npm for frontend.
;;    A1: .NET packaging gap. A2: Binary exists but needs newer runtime.
;;    A3: .NET ecosystem in Guix immature.

;; 93. hq (#18?) — HTML query tool
;;    C++ with meson. Depends on modest HTML parser (not in Guix).
;;    A1: Need to package modest first. A2: modest is unmaintained.
;;    A3: Two-step packaging required.

;; 96. mailnaggertray-git (#18?) — Mail notification tray app
;;    Rust/Cargo build. Depends on mailnagger (not in Guix).
;;    A1: Need mailnagger first. A2: No tags/releases.
;;    A3: Commit-pinning only, Rust build itself is feasible.

;; 97. musique (#18?) — Qt6 music player
;;    Qt6/qmake build. Has 8 git submodules.
;;    A1: Submodule handling complex for Guix.
;;    A2: Would need git-fetch with recursive? #t + exact commit hash.
;;    A3: All deps available but submodule wrangling non-trivial.

;; 98. nemo-engrampa-RESOLVED (#18?) — Nemo archive plugin
;;    (Resolved in this pass — recipe created)

;;; === DKMS_KERNEL_MODULE (11 packages) ===
;;; Guix handles kernel modules differently than DKMS. These need
;;; linux-module-build-system or kernel source integration.

;; 9. aquacomputer_d5next-hwmon-dkms (#18606) — Aquacomputer HWMON DKMS
;; 20. amneziawg-dkms-git (#18642) — AmneziaWG DKMS kernel module
;; 21. amneziawg-linux (#18?) — AmneziaWG compiled kernel module
;; 22. amneziawg-linux-hardened (#18?) — AmneziaWG for linux-hardened
;; 31. faustus-dkms-git (#18?) — ASUS TUF Gaming DKMS driver
;; 33. ideapad-laptop-tb-dkms (#18?) — Lenovo ThinkBook DKMS
;; 34. ideapad-laptop-tb2024g6plus-dkms (#18?) — Lenovo ThinkBook 2024 DKMS
;; 45. pfring-dkms (#18?) — PF_RING DKMS kernel module
;; 48. r8126-dkms (#18?) — Realtek R8126 DKMS driver
;; 63. nvidia-bl-dkms (#18?) — NVIDIA backlight DKMS
;; 86. rtl88x2ce-dkms-git (#18?) — Realtek WiFi DKMS driver

;;; === DISTRO_SPECIFIC (10 packages) ===
;;; Arch Linux-specific tools that use pacman, mkinitcpio, or other
;;; Arch-only infrastructure. Not useful on Guix.

;; 16. mkinitcpio-systemd-root-password (#18371) — Arch initramfs hook
;; 18. repacman (#18707) — Arch pacman utility
;; 25. archwiki-offline (#18?) — Arch Wiki offline copy
;; 32. findbrokenpkgs (#18?) — Find broken Arch packages
;; 50. sbctl-initcpio-post-hook (#18?) — sbctl initcpio hook
;; 51. system-age (#18?) — System install age (Arch pacman)
;; 59. linux-keep-modules (#18?) — Arch kernel module persist
;; 64. pacpak-git (#18?) — Pacman/Flatpak bridge
;; 73. chromium-extension-arch-search (#18?) — Arch search extension
;; 100. pamac-cli (#18?) — Pamac CLI (Arch package manager)

;;; === SOURCE_UNAVAILABLE (9 packages) ===

;; 8. squareline-studio (#17812) — LVGL GUI editor (proprietary, requires
;;    registration to download)
;; 15. luniistore (#18478) — Lunii storyteller store (source unavailable)
;; 19. simplicity-commander (#18419) — Silicon Labs utility (binary-only,
;;    no public download)
;; 49. receitanet (#18?) — Brazilian tax software (proprietary)
;; 54. wyc (#18?) — Source not available
;; 76. euroscope-bin (#18?) — Windows-only flight sim ATC
;; 83. plugin-autenticacao-gov-pt (#18?) — Portuguese auth plugin (proprietary)
;; 87. urbanterror (#18?) — Game (source URL broken)
;; 94. inkdrop (#18?) — Note-taking app (proprietary, registration required)

;;; === TOOLING_FAILURE (5 packages) ===

;; 6. neovim-lspconfig-opt-git (#18703) — Neovim plugin, not in AUR cache.
;;    Neovim plugins are managed via plugin managers, not system packages.
;; 14. locale-mul_zz-RESOLVED — Custom locale definitions
;;    (Resolved in this pass — recipe created as locale-mul-zz)
;; 17. playerctld-systemd-unit-RESOLVED (#18838) — Systemd unit
;;    (Resolved in this pass — recipe created)
;; 53. vscodium-marketplace (#18?) — VSCodium marketplace patch.
;;    Uses Arch pacman hooks. Would need complete reimplementation for Guix.
;;    Concept is useful but implementation is Arch-specific.
;; 57. libarchive-static (#18?) — Static bsdtar with musl.
;;    Requires musl cross-compilation setup. Guix has both but integration
;;    with kernel-headers-musl not straightforward.
;;    A1: Cross-compilation approach needed. A2: Custom build phases.
;;    A3: Feasible but complex for a static binary variant.
;; 99. nvidia-open-tinygrad-dkms-git (#18?) — NVIDIA kernel module variant

;;; === MINGW_CROSS_COMPILATION (4 packages) ===
;;; Windows cross-compilation targets. Not supported in Guix channel.

;; 39. mingw-w64-cblas (#18?) — MinGW CBLAS
;; 40. mingw-w64-lapack (#18?) — MinGW LAPACK
;; 41. mingw-w64-soundtouch (#18?) — MinGW SoundTouch
;; 81. mingw-w64-sqlite (#18?) — MinGW SQLite

;;; === NEEDS_RECIPE_DESIGN (2 packages) ===

;; 35. knossu (#18?) — Old game (2015). Depends on legacy glew1.10
;;    and libpng12 (both obsolete). Custom license.
;; 92. futu-ftnn-wine (#18?) — Proprietary Windows trading app via Wine.
;;    Not an open-source application.

;;; === SELINUX_SPECIFIC (2 packages) ===

;; 2. sudo-selinux (#18513) — sudo with SELinux support.
;;    Needs pam-selinux (not in Guix). Complex SELinux dep chain.
;; 3. base-selinux (#18537) — Meta-package pulling 18+ SELinux variants.
;;    Arch-specific concept. Impossible to replicate.

;;; === BROWSER_EXTENSION (2 packages) ===

;; 12. librewolf-extension-ublock-origin-bin (#18355) — uBlock Origin
;;    Browser extensions should be installed via the browser, not as
;;    system packages.
;; 13. librewolf-tridactyl-native-bin (#18285) — Tridactyl native
;;    messaging host. Browser-specific, not a standalone package.

;;; === ANDROID_SDK_PLATFORM (2 packages) ===

;; 23. android-platform-19 (#18?) — Android SDK API 19 (proprietary)
;; 24. android-platform-21 (#18?) — Android SDK API 21 (proprietary)

;;; === LICENSE_REVIEW_NEEDED (2 packages) ===

;; 28. brother-mfc-l2400dw (#18?) — Brother printer driver (proprietary)
;; 52. ttf-consolas-ligaturized (#18?) — Consolas font (Microsoft license
;;    prohibits redistribution)

;;; === KERNEL_SPECIFIC (2 packages) ===

;; 89. zfs-linux-hardened-headers (#18?) — ZFS headers for linux-hardened
;; 90. zfs-linux-rt-headers (#18?) — ZFS headers for linux-rt

;;; === SINGLE-COUNT CATEGORIES ===

;; 10. bakkesmod-steam (#17468) — PLATFORM_UNSUPPORTED: Windows-only
;;    Rocket League mod. No Linux support.

;; 36. lib32-opencl-nvidia-390xx (#17502) — MULTILIB_UNSUPPORTED: 32-bit
;;    NVIDIA OpenCL (legacy driver).

;; 37. libch343ser-git (#18?) — KERNEL_MODULE: WCH CH343 serial driver.
;;    DKMS kernel module.

;; 38. libfprint-2-tod1-broadcom-cv3plus (#18?) — PROPRIETARY_BINARY:
;;    Broadcom fingerprint driver. Non-redistributable.

;; 42. nftables-geoip-db (#18?) — BUILD_NETWORK_REQUIRED: GeoIP database.
;;    Build downloads database from db-ip.com. Network required during build.
;;    Could use fixed-output derivation but Perl deps missing.

;; 74. clash-for-windows-chinese (#17433) — ABANDONED_UPSTREAM:
;;    Project abandoned, original author deleted repo.

;; 84. python2-wxpython3 (#18?) — LEGACY_PYTHON2: wxPython for Python 2.
;;    Python 2 is EOL. Not feasible.

;; 85. qtspim-iconfix (#18?) — BUILD_FAILED: SVN-only source.
;;    No tags, no reproducible version pinning.

;; 88. ut2004-gog (#18?) — NON_DISTRIBUTABLE: Commercial game.
;;    Cannot redistribute GOG game files.

;; 95. kamilsss655-uv-k5-firmware-custom-git (#18?) — CROSS_COMPILATION:
;;    Firmware for UV-K5 radio. Needs ARM cross-compilation toolchain.
