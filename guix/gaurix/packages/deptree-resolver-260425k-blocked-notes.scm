;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; deptree-resolver-260425k -- BLOCKED package notes
;;; 97 packages remain BLOCKED after this pass.
;;; 2 new recipes: perl-compress-raw-lzma, unpack-install-jammer
;;; 1 ALREADY_IN_GUIX: python2-dbus
;;; 1 ALREADY_RESOLVED: bililive-recorder (binary variant in queue-20260325p100e.scm)
;;;
;;; Categories:
;;;   DEP_RESOLUTION_FAILED  -- dependencies not available in Guix (27)
;;;   DKMS_KERNEL_MODULE     -- Linux DKMS kernel modules (10)
;;;   DISTRO_SPECIFIC        -- Arch Linux specific tools (14)
;;;   SOURCE_UNAVAILABLE     -- cannot obtain upstream source / proprietary (9)
;;;   MINGW_CROSS_COMPILATION -- MinGW Windows cross-compilation (3)
;;;   SELINUX_SPECIFIC       -- requires SELinux infrastructure (2)
;;;   ANDROID_SDK_PLATFORM   -- Android SDK platform files (2)
;;;   KERNEL_SPECIFIC        -- kernel-version-specific headers (3)
;;;   PLATFORM_UNSUPPORTED   -- platform not supported (1)
;;;   MULTILIB_UNSUPPORTED   -- 32-bit multilib not supported (1)
;;;   ABANDONED_UPSTREAM     -- project abandoned by upstream (2)
;;;   NON_DISTRIBUTABLE      -- commercial, cannot redistribute (3)
;;;   LEGACY_PYTHON2         -- requires Python 2 (0, resolved: ALREADY_IN_GUIX)
;;;   LICENSE_REVIEW_NEEDED  -- proprietary/unclear license (2)
;;;   CROSS_COMPILATION      -- requires cross-compilation toolchain (1)
;;;   KERNEL_MODULE          -- kernel module not using DKMS (1)
;;;   BUILD_SYSTEM_TOO_COMPLEX -- massive project, too complex (2)
;;;   BROWSER_EXTENSION      -- browser extension, no standard install (2)
;;;   MISSING_SOURCE         -- AUR repo empty/source unreachable (2)
;;;   PROPRIETARY_BINARY     -- non-redistributable binary (2)
;;;   PROPRIETARY_DEP        -- depends on proprietary library (1)
;;;   BUILD_FAILED           -- build failures not resolvable (1)
;;;   COMPLEX_BUILD          -- static musl build with 7+ deps (1)
;;;   DOTNET_UNSUPPORTED     -- .NET version not available in Guix (1)
;;;   LEGACY_QT4             -- requires Qt4 (EOL since 2015) (1)

;;; === DEP_RESOLUTION_FAILED (27 packages) ===

;; 1. gradience (#18644) -- GTK theming app
;;    Not in AUR cache.  Upstream: github.com/GradienceTeam/Gradience.
;;    Archived Jul 2024.  Needs python-svglib + reportlab chain (5+ missing).
;;    A1: Complex Python dep chain.  A2: Project archived.  A3: No future updates.

;; 4. wayfire-git (#18488) -- 3D Wayland compositor
;;    Needs wlroots0.20 (not in Guix; Guix has wlroots 0.17/0.18).
;;    A1: Package wlroots0.20 first.  A2: Stable wayfire already available.
;;    A3: Git version is bleeding-edge, limited value.

;; 5. virtualbox-svn (#18489) -- VirtualBox from SVN
;;    50+ deps, kernel modules, gsoap, DKMS, extreme complexity.
;;    A1/A2/A3: Would require months of packaging work.

;; 11. edgeimpulse-cli (#18574) -- Edge Impulse CLI (npm)
;;    Node.js with deep npm dependency tree.
;;    A1/A2/A3: node-build-system cannot handle complex npm trees.

;; 24. aws-amplify-cli (#18269) -- AWS Amplify CLI (npm)
;;    Massive npm dependency tree.
;;    A1/A2/A3: npm packaging impossible in Guix currently.

;; 25. aws-cdk (#18298) -- AWS CDK CLI (npm)
;;    Massive npm dependency tree.
;;    A1/A2/A3: Same npm packaging limitations.

;; 27. decrypto-pro-git (#18291) -- CryptoPro key converter
;;    Hard dep on openssl-gost-engine (Russian GOST cryptography).
;;    A1: Would need gost-engine.  A2: Very niche (1 AUR vote).
;;    A3: GOST is integral, cannot avoid dependency.

;; 28. emmet-language-server (#18958) -- Emmet LSP (npm)
;;    A1/A2/A3: npm packaging limitations.

;; 40. nodejs-cspell (#18215) -- Spell checker (npm monorepo)
;;    A1/A2/A3: Complex npm monorepo, node-build-system cannot handle.

;; 41. osmtogeojson (#18417) -- OSM to GeoJSON (npm)
;;    A1/A2/A3: npm packaging limitations.

;; 43. python-home-assistant-frontend (#18556) -- HA frontend
;;    115 MB pre-built JS bundle.  Cannot build from source.
;;    A1/A2/A3: Fundamentally incompatible with Guix source-build model.

;; 51. beammp-launcher-git (#18346) -- BeamNG multiplayer
;;    vcpkg build model incompatible with Guix.
;;    A1/A2/A3: Game-specific, very niche.

;; 52. java-language-server (#18379) -- Java LSP
;;    Maven build downloads deps at build time.
;;    A1/A2/A3: No maven-build-system in Guix.

;; 54. lightdm-webkit-theme-aether (#18501) -- LightDM theme
;;    Needs lightdm-webkit2-greeter (not in Guix).  Theme itself is npm/webpack.
;;    A1: Package webkit2-greeter first.  A2: npm build required.
;;    A3: Upstream archived.

;; 56. nfuspire-git (#18419) -- Nspire FUSE filesystem
;;    Only 1 commit, no releases, needs libnspire (not in Guix).
;;    A1: Package libnspire first.  A2: Project too immature.
;;    A3: Consider fuse-nspire instead (more established).

;; 57. nginx-mainline-mod-njs (#18449) -- nginx njs module
;;    No nginx dynamic module build infrastructure in Guix.
;;    A1/A2/A3: Would need custom nginx module framework.

;; 58. nodejs-nestjs-cli (#18424) -- NestJS CLI (npm)
;;    A1/A2/A3: npm packaging limitations.

;; 61. phonon-qt4-vlc (#18478) -- Phonon VLC backend for Qt4
;;    Qt4 is EOL since 2015, removed from most distros.
;;    A1/A2/A3: Qt4 is dead, no Guix support.

;; 62. quartz-utils-git (#18479) -- CLI utilities (Crystal lang)
;;    Crystal language not in Guix.
;;    A1/A2/A3: Would need Crystal compiler packaged first.

;; 63. rdt-client (#18483) -- Real-Debrid client
;;    Needs .NET 9/10, Guix only has dotnet 8.
;;    A1/A2/A3: Blocked on .NET version.

;; 64. sommelier-git (#18490) -- ChromeOS nested Wayland compositor
;;    Component of ChromiumOS platform2 monorepo.  Not designed for standalone.
;;    A1: Extract from monorepo.  A2: Heavy display library deps.
;;    A3: Limited use case outside ChromeOS.

;; 65. texmacs-pure (#18492) -- Pure plugin for TeXmacs
;;    Pure language defunct, needs LLVM 3.5.
;;    A1/A2/A3: Upstream dead, incompatible LLVM requirement.

;; 66. tilp-xdg (#18494) -- TI calculator link program
;;    Needs libticalcs/libticables (not in Guix).
;;    A1/A2: Would need TI calculator library chain.  A3: Very niche.

;; 69. eclipse-pydev (#18529) -- Python IDE for Eclipse
;;    Eclipse IDE not in Guix.
;;    A1/A2/A3: Would need Eclipse platform first.

;; 72. gephi-git (#18551) -- Network visualization
;;    Maven build + NetBeans Platform.
;;    A1/A2/A3: No maven-build-system in Guix.

;; 73. lobe-chat (#18565) -- LLM chat framework
;;    Next.js/pnpm monorepo, massive npm deps.
;;    A1/A2/A3: npm packaging limitations.

;; 85. mailnaggertray-git (#18606) -- Tray icon for mailnagger
;;    Depends on mailnagger (not in Guix).
;;    A1: Package mailnagger first.  A2: Codeberg source, Rust/Cargo.
;;    A3: Niche, only 1 AUR vote.

;; 88. pulumi-git (#18633) -- Infrastructure as Code
;;    Large multi-language project (Go+Node+Python).
;;    A1/A2/A3: Cross-language build too complex.

;; 99. awk-language-server (#18971) -- AWK LSP (npm/TypeScript)
;;    npm/TypeScript project with tree-sitter deps.
;;    A1: Binary not available.  A2: npm dep chain.
;;    A3: node-build-system limitations.

;;; === DKMS_KERNEL_MODULE (10 packages) ===

;; 9. aquacomputer_d5next-hwmon-dkms (#18257)
;; 18. amneziawg-dkms-git (#18270) -- AmneziaWG DKMS
;; 19. amneziawg-linux (#18271) -- AmneziaWG kernel module
;; 20. amneziawg-linux-hardened (#18272) -- AmneziaWG hardened
;; 29. faustus-dkms-git (#18304) -- ASUS fan control DKMS
;; 31. ideapad-laptop-tb-dkms (#18358) -- ThinkBook DKMS
;; 32. ideapad-laptop-tb2024g6plus-dkms (#18359) -- ThinkBook 2024 DKMS
;; 42. pfring-dkms (#18444) -- PF_RING network DKMS
;; 44. r8126-dkms (#18462) -- Realtek r8126 DKMS
;; 76. rtl88x2ce-dkms-git (#18467) -- Realtek WiFi DKMS

;;; === DISTRO_SPECIFIC (14 packages) ===

;; 15. mkinitcpio-systemd-root-password (#18415) -- mkinitcpio hook
;; 16. repacman (#18461) -- pacman report tool
;; 23. archwiki-offline (#18282) -- Arch Wiki offline reader
;; 30. findbrokenpkgs (#18315) -- pacman broken package finder
;; 46. sbctl-initcpio-post-hook (#18468) -- sbctl mkinitcpio hook
;; 47. system-age (#18491) -- reads Arch pacman install date
;; 49. vscodium-marketplace (#18503) -- pacman hook for VSCodium
;; 55. linux-keep-modules (#18396) -- pacman kernel module hook
;; 60. pacpak-git (#18438) -- pacman/flatpak wrapper
;; 67. chromium-extension-arch-search (#18523) -- Arch browser extension
;; 87. pamac-cli (#18627) -- ALPM/pacman frontend
;; 91. python-pypi2pkgbuild (#18640) -- PyPI to PKGBUILD converter
;; 97. asp (#18973) -- Arch build source management
;; 98. aurutils (#18974) -- AUR helper tools

;;; === SOURCE_UNAVAILABLE (9 packages) ===

;; 6. deadbeef-mpris2-plugin (#19282) -- deprecated, integrated into DeaDBeeF 1.10.2+
;; 8. squareline-studio (#18485) -- proprietary commercial binary
;; 14. luniistore (#18402) -- proprietary Java app, download 403
;; 17. simplicity-commander (#18482) -- proprietary, download URL dead
;; 45. receitanet (#18463) -- proprietary Brazilian government software
;; 50. wyc (#18504) -- proprietary Chinese tunneling binary
;; 70. euroscope-bin (#18537) -- Windows-only proprietary via Wine
;; 77. urbanterror (#18499) -- proprietary game data, download broken
;; 83. inkdrop (#18584) -- proprietary commercial Electron app

;;; === SELINUX_SPECIFIC (2 packages) ===

;; 2. sudo-selinux (#18487) -- SELinux sudo
;; 3. base-selinux (#18286) -- SELinux base packages

;;; === MINGW_CROSS_COMPILATION (3 packages) ===

;; 37. mingw-w64-cblas (#18407) -- Windows cross-compilation
;; 38. mingw-w64-lapack (#18409) -- Windows cross-compilation
;; 39. mingw-w64-soundtouch (#18411) -- Windows cross-compilation

;;; === ANDROID_SDK_PLATFORM (2 packages) ===

;; 21. android-platform-19 (#18275) -- proprietary Google Android SDK
;; 22. android-platform-21 (#18276) -- proprietary Google Android SDK

;;; === KERNEL_SPECIFIC (3 packages) ===

;; 79. zfs-linux-hardened-headers (#18506) -- kernel-version-specific
;; 80. zfs-linux-rt-headers (#18507) -- kernel-version-specific
;; 96. zfs-linux-git-headers (#18976) -- kernel-version-specific

;;; === NON_DISTRIBUTABLE (3 packages) ===

;; 78. ut2004-gog (#18500) -- commercial game
;; 95. unrealtournament4 (#18975) -- proprietary Epic Games
;; 100. factorio-space-age-experimental (#18977) -- proprietary commercial game

;;; === LICENSE_REVIEW_NEEDED (2 packages) ===

;; 26. brother-mfc-l2400dw (#18289) -- proprietary printer driver
;; 48. ttf-consolas-ligaturized (#18495) -- derivative of Microsoft Consolas

;;; === ABANDONED_UPSTREAM (2 packages) ===

;; 68. clash-for-windows-chinese (#18524) -- GitHub repo deleted
;; 7. sipgate-app-clinq (#18481) -- not in AUR cache, no source

;;; === BROWSER_EXTENSION (2 packages) ===

;; 12. librewolf-extension-ublock-origin-bin (#18395)
;; 13. librewolf-tridactyl-native-bin (#18396)

;;; === BUILD_SYSTEM_TOO_COMPLEX (2 packages) ===

;; 71. gbm (#18542) -- VB.NET/Mono, VB.NET compiler not supported
;; 89. python-gradio-pdf (#18637) -- needs python-gradio (massive dep tree)

;;; === PROPRIETARY_BINARY (2 packages) ===

;; 36. libfprint-2-tod1-broadcom-cv3plus (#18393) -- non-redistributable
;; 82. futu-ftnn-wine (#18546) -- proprietary Windows binary via Wine

;;; === MISSING_SOURCE (2 packages) ===

;; 33. knossu (#18383) -- proprietary binary from 2015, no source
;; 35. libch343ser-git (#18388) -- AUR repository is empty, no PKGBUILD

;;; === REMAINING INDIVIDUAL BLOCKERS ===

;; 10. bakkesmod-steam (#18283) -- PLATFORM_UNSUPPORTED: Windows-only
;; 34. lib32-opencl-nvidia-390xx (#18387) -- MULTILIB_UNSUPPORTED: 32-bit
;; 53. libarchive-static (#18500) -- COMPLEX_BUILD: static musl with 7+ bundled deps
;; 59. nvidia-bl-dkms (#18431) -- DKMS_KERNEL_MODULE: NVIDIA backlight
;; 74. plugin-autenticacao-gov-pt (#18556) -- SOURCE_UNAVAILABLE: binary .deb only
;; 75. qtspim-iconfix (#18460) -- BUILD_FAILED: SVN-only, build issues
;; 84. kamilsss655-uv-k5-firmware-custom-git (#18591) -- CROSS_COMPILATION: ARM
;; 86. nvidia-open-tinygrad-dkms-git (#18617) -- DKMS_KERNEL_MODULE: NVIDIA
;; 90. python-jaxlib-bin (#18639) -- SOURCE_UNAVAILABLE: binary wheel, needs Bazel
;; 92. python2-dbus (#37854) -- ALREADY_IN_GUIX (resolved in this pass)
;; 93. soapysdrplay3-luarvique-git (#18662) -- PROPRIETARY_DEP: SDRPlay API
