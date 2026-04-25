;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; deptree-resolver-260425j -- BLOCKED package notes
;;; 99 packages remain BLOCKED after this pass.
;;;
;;; Categories:
;;;   DEP_RESOLUTION_FAILED  -- dependencies not available in Guix (27)
;;;   DKMS_KERNEL_MODULE     -- Linux DKMS kernel modules (10)
;;;   DISTRO_SPECIFIC        -- Arch Linux specific tools (14)
;;;   SOURCE_UNAVAILABLE     -- cannot obtain upstream source / proprietary (11)
;;;   MINGW_CROSS_COMPILATION -- MinGW Windows cross-compilation (3)
;;;   SELINUX_SPECIFIC       -- requires SELinux infrastructure (2)
;;;   ANDROID_SDK_PLATFORM   -- Android SDK platform files (2)
;;;   KERNEL_SPECIFIC        -- kernel-version-specific headers (5)
;;;   PLATFORM_UNSUPPORTED   -- platform not supported (2)
;;;   MULTILIB_UNSUPPORTED   -- 32-bit multilib not supported (1)
;;;   ABANDONED_UPSTREAM     -- project abandoned by upstream (3)
;;;   NON_DISTRIBUTABLE      -- commercial, cannot redistribute (4)
;;;   LEGACY_PYTHON2         -- requires Python 2 (1)
;;;   LICENSE_REVIEW_NEEDED  -- proprietary/unclear license (3)
;;;   CROSS_COMPILATION      -- requires cross-compilation toolchain (1)
;;;   KERNEL_MODULE          -- kernel module not using DKMS (1)
;;;   BUILD_SYSTEM_TOO_COMPLEX -- massive project, too complex (2)
;;;   BROWSER_EXTENSION      -- browser extension, no standard install (2)
;;;   MISSING_SOURCE         -- not in AUR cache, source unreachable (3)
;;;   LEGACY_QT4             -- requires Qt4 (EOL since 2015) (1)
;;;   DOTNET_UNSUPPORTED     -- .NET version not available in Guix (1)

;;; === DEP_RESOLUTION_FAILED (27 packages) ===

;; 1. gradience (#18644) -- GTK theming app
;;    Not in AUR cache. Upstream: github.com/GradienceTeam/Gradience.
;;    Meson build, Python app. Archived Jul 2024.
;;    A1: Need python-svglib + reportlab chain packaged first.
;;    A2: Complex Python dep chain (5+ missing).
;;    A3: Project archived, no future updates.

;; 10. edgeimpulse-cli (#18574) -- Edge Impulse CLI (npm)
;;    Node.js with deep npm dependency tree.
;;    A1/A2/A3: node-build-system cannot handle complex npm trees.

;; 22. aws-amplify-cli (#18269) -- AWS Amplify CLI (npm)
;;    Massive npm dependency tree.
;;    A1/A2/A3: npm packaging impossible in Guix.

;; 23. aws-cdk (#18298) -- AWS CDK CLI (npm)
;;    Massive npm dependency tree.
;;    A1/A2/A3: Same npm packaging limitations.

;; 25. decrypto-pro-git (#18291) -- CryptoPro key converter
;;    Depends on openssl-gost-engine (not in Guix, niche Russian crypto).
;;    A1: Would need openssl-gost-engine. A2: Very niche (1 AUR vote).
;;    A3: Blocked on one dep but dep itself is complex.

;; 26. emmet-language-server (#18958) -- Emmet LSP (npm)
;;    A1/A2/A3: npm packaging limitations.

;; 39. nodejs-cspell (#18215) -- Spell checker (npm monorepo)
;;    A1/A2/A3: Complex npm monorepo, node-build-system cannot handle.

;; 40. osmtogeojson (#18417) -- OSM to GeoJSON (npm)
;;    A1/A2/A3: npm packaging limitations.

;; 42. python-home-assistant-frontend (#18556) -- HA frontend
;;    115 MB pre-built JS bundle. Cannot build from source without
;;    enormous Node.js/npm build pipeline.
;;    A1: Repackage wheel (violates Guix philosophy).
;;    A2: Build from source (massive JS toolchain needed).
;;    A3: Fundamentally incompatible with Guix source-build model.

;; 51. beammp-launcher-git (#18346) -- BeamNG multiplayer
;;    vcpkg build model incompatible with Guix.
;;    A1: Patch CMake to bypass vcpkg. A2: Complex dep chain.
;;    A3: Game-specific, very niche.

;; 52. java-language-server (#18379) -- Java LSP
;;    Maven build downloads deps at build time.
;;    A1/A2/A3: No maven-build-system in Guix. Flagged out-of-date.

;; 54. libarchive-static (#18758) -- Static musl build of libarchive
;;    Complex musl static build of 7+ deps.
;;    A1: Use Guix static-package transform. A2: Build against musl.
;;    A3: Theoretically possible but niche use case.

;; 55. nfuspire-git (#18401) -- TI-Nspire FUSE filesystem
;;    Only 1 commit. Depends on libnspire (not in Guix). Too immature.
;;    A1/A2/A3: Incomplete project, blocked on libnspire.

;; 57. nginx-mainline-mod-njs (#18380) -- nginx njs module
;;    No nginx dynamic module build infrastructure in Guix.
;;    A1/A2/A3: Would need nginx module build system.

;; 58. nodejs-nestjs-cli (#18753) -- NestJS CLI (npm)
;;    A1/A2/A3: npm packaging limitations.

;; 61. quartz-utils-git (#18444) -- Crystal lang CLI utilities
;;    Crystal language not available in Guix. No crystal-build-system.
;;    A1/A2/A3: Would need full Crystal compiler toolchain.

;; 62. rdt-client (#18561) -- Real-Debrid client (.NET)
;;    Needs .NET 9/10; Guix only has dotnet 8. .NET packaging immature.
;;    A1/A2/A3: .NET version too new.

;; 64. texmacs-pure (#17873) -- TeXmacs with Pure language
;;    Pure language defunct. Requires ancient LLVM 3.5.
;;    A1/A2/A3: Dead language, obsolete LLVM.

;; 65. tilp-xdg (#18345) -- TI calculator link program
;;    Depends on libticalcs/libticables/libtconv (not in Guix).
;;    A1: Package full TI-link stack (4+ libs). A2: Too niche.
;;    A3: Blocked on entire TI calculator library ecosystem.

;; 68. eclipse-pydev (#17948) -- Eclipse PyDev plugin
;;    Eclipse IDE not in Guix. No plugin packaging infra.
;;    A1/A2/A3: No Eclipse platform.

;; 70. gbm (#19044) -- Game Backup Monitor (VB.NET/Mono)
;;    mono-basic (VB.NET) not in Guix. VB.NET compiler unavailable.
;;    A1/A2/A3: VB.NET not packaged in Guix.

;; 71. gephi-git (#18898) -- Graph visualization (Maven/Java)
;;    Maven build + NetBeans Platform dependency.
;;    A1/A2/A3: Maven build-time downloads, NetBeans unavailable.

;; 72. lobe-chat (#18973) -- AI chat frontend (Next.js/pnpm)
;;    Massive npm/pnpm dependency tree. Flagged out-of-date.
;;    A1/A2/A3: npm packaging limitations.

;; 81. bililive-recorder (#18901) -- Bilibili live recorder (.NET)
;;    .NET 6 + npm dual build. .NET packaging immature.
;;    A1/A2/A3: .NET packaging limitations.

;; 85. mailnaggertray-git (#18592) -- Email notifier tray
;;    Depends on mailnagger (not in Guix, source unclear). 11 commits.
;;    A1/A2/A3: Missing dep, immature project.

;; 90. python-gradio-pdf (#18463) -- Gradio PDF component
;;    Needs python-gradio packaged first (large dependency tree).
;;    A1: Package python-gradio (massive). A2: Wheel install (not idiomatic).
;;    A3: Wait for python-gradio to be packaged independently.

;; 99. awk-language-server (#18776) -- AWK LSP (npm/yarn) [NEW]
;;    Node.js with yarn build and TypeScript.
;;    A1/A2/A3: npm/yarn packaging limitations in Guix.

;;; === DKMS_KERNEL_MODULE (10 packages) ===

;; 8. aquacomputer_d5next-hwmon-dkms (#18606) -- HWMON DKMS module
;; 17. amneziawg-dkms-git (#18642) -- AmneziaWG DKMS module
;; 27. faustus-dkms-git (#18859) -- ASUS fan control DKMS
;; 29. ideapad-laptop-tb-dkms (#18957) -- Ideapad tablet DKMS
;; 30. ideapad-laptop-tb2024g6plus-dkms (#18895) -- Ideapad 2024 DKMS
;; 41. pfring-dkms (#18399) -- PF_RING network DKMS
;; 43. r8126-dkms (#18487) -- Realtek r8126 DKMS
;; 59. nvidia-bl-dkms (#17755) -- NVIDIA backlight DKMS
;; 76. rtl88x2ce-dkms-git (#18362) -- Realtek WiFi DKMS
;; 86. nvidia-open-tinygrad-dkms-git (#18617) -- NVIDIA tinygrad DKMS
;;    All blocked: DKMS kernel modules incompatible with Guix's
;;    immutable system model. Guix requires kernel modules built
;;    as part of the kernel package itself.

;;; === DISTRO_SPECIFIC (14 packages) ===

;; 15. mkinitcpio-systemd-root-password (#18371) -- mkinitcpio hook
;; 16. repacman (#18707) -- pacman report tool
;; 21. archwiki-offline (#18568) -- Arch Wiki offline reader
;; 28. findbrokenpkgs (#18930) -- Find broken packages (pacman)
;; 45. sbctl-initcpio-post-hook (#18720) -- sbctl mkinitcpio hook
;; 46. system-age (#18453) -- System install age (from pacman log)
;; 48. vscodium-marketplace (#18695) -- pacman hook for VSCodium
;; 49. wyc (#18777) -- Commercial Chinese tunneling, Arch only
;; 56. linux-keep-modules (#18490) -- pacman hook, kernel modules
;; 60. pacpak-git (#17862) -- pacman + flatpak wrapper
;; 66. chromium-extension-arch-search (#17897) -- Arch search ext
;; 87. pamac-cli (#17940) -- pacman frontend (ALPM)
;; 92. python-pypi2pkgbuild (#17822) -- PyPI to PKGBUILD converter
;; 98. aurutils (#11354) -- AUR helper tools
;;    All blocked: Tools specific to Arch Linux ecosystem
;;    (pacman, mkinitcpio, ALPM, AUR). Not applicable on Guix System.

;;; === SOURCE_UNAVAILABLE / PROPRIETARY (11 packages) ===

;; 7. sipgate-app-clinq (#18449) -- Proprietary Electron app, not in AUR cache
;; 8b. squareline-studio (#17812) -- Proprietary commercial GUI designer
;; 14. luniistore (#18478) -- Proprietary Java app, download 403
;; 17b. simplicity-commander (#18419) -- Needs proprietary jlink dep
;; 24. brother-mfc-l2400dw (#17797) -- Proprietary binary-only printer driver
;; 44. receitanet (#18413) -- Brazilian gov proprietary software
;; 69. euroscope-bin (#17945) -- Windows-only proprietary via Wine
;; 74. plugin-autenticacao-gov-pt (#18557) -- Binary .deb, no source repo
;; 83. inkdrop (#17819) -- Proprietary commercial Electron app
;; 91. python-jaxlib-bin (#18474) -- Binary wheel; source needs Bazel
;; 94. soapysdrplay3-luarvique-git (#18426) -- Needs proprietary SDRPlay API

;;; === MINGW_CROSS_COMPILATION (3 packages) ===

;; 35. mingw-w64-cblas (#34115)
;; 36. mingw-w64-lapack (#34113)
;; 37. mingw-w64-soundtouch (#18330)
;;    Windows cross-compilation targets. Not applicable on GNU/Linux.

;;; === SELINUX_SPECIFIC (2 packages) ===

;; 2. sudo-selinux (#18513) -- sudo with SELinux support
;; 3. base-selinux (#18537) -- base packages with SELinux
;;    SELinux infrastructure not available in Guix.

;;; === ANDROID_SDK_PLATFORM (2 packages) ===

;; 19. android-platform-19 (#28671) -- API level 19
;; 20. android-platform-21 (#23109) -- API level 21
;;    Android SDK platform files. Proprietary Google binaries.

;;; === KERNEL_SPECIFIC (5 packages) ===

;; 50. amneziawg-linux (#18452) -- AmneziaWG kernel module variant
;; 51b. amneziawg-linux-hardened (#18382) -- AmneziaWG hardened kernel
;; 79. zfs-linux-hardened-headers (#17921)
;; 80. zfs-linux-rt-headers (#17920)
;; 97. zfs-linux-git-headers (#18471)
;;    Kernel-version-specific modules/headers. Guix builds these
;;    as part of the kernel package itself.

;;; === PLATFORM_UNSUPPORTED (2 packages) ===

;; 9. bakkesmod-steam (#17468) -- Windows-only (Rocket League mod)
;; 31. knossu (#18461) -- No source, binary from 2015, needs glew1.10+libpng12

;;; === MULTILIB_UNSUPPORTED (1 package) ===

;; 32. lib32-opencl-nvidia-390xx (#17502) -- 32-bit NVIDIA OpenCL

;;; === ABANDONED_UPSTREAM (3 packages) ===

;; 53. lightdm-webkit-theme-aether (#19028) -- Archived Jan 2026
;;    Depends on lightdm-webkit2-greeter (not in Guix). Dead project.
;; 67. clash-for-windows-chinese (#17433) -- CFW discontinued
;; 75. qtspim-iconfix (#18421) -- MIPS simulator, SVN-only source

;;; === NON_DISTRIBUTABLE (4 packages) ===

;; 77. urbanterror (#18814) -- Proprietary game data, download broken
;; 78. ut2004-gog (#18333) -- UT2004 via GOG (proprietary game data)
;; 96. unrealtournament4 (#18523) -- UT4 by Epic Games (proprietary)
;; 100. factorio-space-age-experimental (#17440) -- Commercial game [NEW]

;;; === LEGACY_PYTHON2 (1 package) ===

;; 93. python2-dbus (#18287) -- Python 2 D-Bus bindings
;;    Python 2 EOL since Jan 2020. No Guix support for Python 2 D-Bus.

;;; === LICENSE_REVIEW_NEEDED (3 packages) ===

;; 47. ttf-consolas-ligaturized (#20499) -- Derivative of proprietary
;;    Microsoft Consolas font. Cannot redistribute.
;; 82. futu-ftnn-wine (#18151) -- Proprietary Windows binary via Wine
;; 34. libfprint-2-tod1-broadcom-cv3plus (#17912) -- Proprietary driver

;;; === CROSS_COMPILATION (1 package) ===

;; 84. kamilsss655-uv-k5-firmware-custom-git (#17909)
;;    Firmware for UV-K5 radio. Requires ARM cross-compilation toolchain.

;;; === KERNEL_MODULE (1 package) ===

;; 33. libch343ser-git (#17880) -- USB serial kernel driver
;;    Not DKMS but still a kernel module. Same Guix incompatibility.

;;; === BUILD_SYSTEM_TOO_COMPLEX (2 packages) ===

;; 4. wayfire-git (#18359) -- 3D Wayland compositor (-git)
;;    Requires wlroots 0.20+ (Guix has 0.19.2). 26+ runtime deps.
;;    Stable wayfire not yet in Guix. -git variant too unstable.
;;    A1: Package wlroots 0.20. A2: Use stable wayfire.
;;    A3: Too many deps for marginal value.

;; 5. virtualbox-svn (#18799) -- VirtualBox from SVN
;;    50+ deps, kernel modules, Qt6 GUI, SDK.
;;    A1/A2/A3: Build complexity impossible. Nonguix has virtualbox-bin.

;;; === BROWSER_EXTENSION (2 packages) ===

;; 11. librewolf-extension-ublock-origin-bin (#18355)
;;    Browser extension XPI. No standard Guix installation path.
;;    A1: Download XPI, install to profile. A2: No standard path.
;;    A3: Better handled by browser's built-in extension manager.

;; 12. librewolf-tridactyl-native-bin (#18285)
;;    Native messaging host binary. Source repo (nicholasgasior/
;;    tridactyl-native) returns 404. Cannot obtain source.
;;    A1: Download pre-built binary (URL broken). A2: Build from source (404).
;;    A3: Source unavailable, cannot package.

;;; === MISSING_SOURCE (3 packages) ===

;; 6. deadbeef-mpris2-plugin (#19282) [NEW]
;;    Not in AUR cache. DeadBeeF media player not in Guix either.
;;    A1: Find upstream source (not found). A2: Check AUR git.
;;    A3: Both the plugin and host app are missing from Guix.

;; 63. sommelier-git (#18392) -- ChromiumOS nested Wayland compositor
;;    Source in chromiumos/platform2 monorepo. No license in AUR.
;;    Upstream is BSD-3-Clause but extracting from monorepo is complex.
;;    A1: Extract from monorepo. A2: Complex ChromiumOS build deps.
;;    A3: Missing license field, monorepo extraction, 1 AUR vote.

;; 89. pulumi-git (#18748) -- Infrastructure as Code (Go)
;;    Large multi-language project (Go+Node+Python). Complex deps.
;;    A1/A2/A3: Too complex, too many languages.

;;; === LEGACY_QT4 (1 package) ===

;; 88. phonon-qt4-vlc (#18938) -- Phonon VLC backend for Qt4
;;    Qt4 reached EOL in December 2015. Not available in modern systems.
;;    A1/A2/A3: Qt4 is dead, no reason to package.

;;; === DOTNET_UNSUPPORTED (1 package) ===

;; 95. unpack-install-jammer (#18498) -- Install Jammer extractor (Perl)
;;    Depends on 5+ niche Perl modules not in Guix (perl-modern-perl,
;;    perl-compress-raw-lzma, perl-term-progressbar, perl-data-dump,
;;    perl-file-homedir). Would need to package all of them.
;;    A1: Package 5 Perl modules. A2: Complex dep chain for niche tool.
;;    A3: Only 1 AUR vote, not worth Perl packaging effort.
