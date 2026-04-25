;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; deptree-resolver-260425i -- BLOCKED package notes
;;; 98 packages remain BLOCKED after this pass.
;;;
;;; Categories:
;;;   DEP_RESOLUTION_FAILED  -- dependencies not available in Guix (27)
;;;   DKMS_KERNEL_MODULE     -- Linux DKMS kernel modules (10)
;;;   DISTRO_SPECIFIC        -- Arch Linux specific tools (13)
;;;   SOURCE_UNAVAILABLE     -- cannot obtain upstream source / proprietary (11)
;;;   MINGW_CROSS_COMPILATION -- MinGW Windows cross-compilation (3)
;;;   SELINUX_SPECIFIC       -- requires SELinux infrastructure (2)
;;;   ANDROID_SDK_PLATFORM   -- Android SDK platform files (2)
;;;   KERNEL_SPECIFIC        -- kernel-version-specific headers (3)
;;;   PLATFORM_UNSUPPORTED   -- platform not supported (2)
;;;   MULTILIB_UNSUPPORTED   -- 32-bit multilib not supported (1)
;;;   ABANDONED_UPSTREAM     -- project abandoned by upstream (3)
;;;   NON_DISTRIBUTABLE      -- commercial, cannot redistribute (2)
;;;   LEGACY_PYTHON2         -- requires Python 2 (1)
;;;   LICENSE_REVIEW_NEEDED  -- proprietary/unclear license (3)
;;;   CROSS_COMPILATION      -- requires cross-compilation toolchain (1)
;;;   BUILD_NETWORK_REQUIRED -- build requires network access (1)
;;;   KERNEL_MODULE          -- kernel module not using DKMS (1)
;;;   PROPRIETARY_BINARY     -- non-redistributable proprietary binary (1)
;;;   BUILD_SYSTEM_TOO_COMPLEX -- massive project, too complex (2)

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

;; 23. aws-amplify-cli (#18269) -- AWS Amplify CLI (npm)
;;    Massive npm dependency tree.
;;    A1/A2/A3: npm packaging impossible in Guix.

;; 24. aws-cdk (#18298) -- AWS CDK CLI (npm)
;;    Massive npm dependency tree.
;;    A1/A2/A3: Same npm packaging limitations.

;; 26. decrypto-pro-git (#18291) -- CryptoPro key converter
;;    Depends on openssl-gost-engine (not in Guix, niche Russian crypto).
;;    A1: Would need openssl-gost-engine. A2: Very niche (1 AUR vote).
;;    A3: Blocked on one dep but dep itself is complex.

;; 27. emmet-language-server (#18958) -- Emmet LSP (npm)
;;    A1/A2/A3: npm packaging limitations.

;; 40. nodejs-cspell (#18215) -- Spell checker (npm monorepo)
;;    A1/A2/A3: Complex npm monorepo, node-build-system cannot handle.

;; 41. osmtogeojson (#18417) -- OSM to GeoJSON (npm)
;;    A1/A2/A3: npm packaging limitations.

;; 43. python-home-assistant-frontend (#18556) -- HA frontend
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

;; 55. libarchive-static (#18758) -- Static musl build of libarchive
;;    Complex musl static build of 7+ deps.
;;    A1: Use Guix static-package transform. A2: Build against musl.
;;    A3: Theoretically possible but niche use case.

;; 56. nfuspire-git (#18401) -- TI-Nspire emulator
;;    Only 1 commit. Depends on libnspire (not in Guix). Too immature.
;;    A1/A2/A3: Incomplete project, blocked on libnspire.

;; 57. nginx-mainline-mod-njs (#18380) -- nginx njs module
;;    No nginx dynamic module build infrastructure in Guix.
;;    A1/A2/A3: Would need nginx module build system.

;; 58. nodejs-nestjs-cli (#18753) -- NestJS CLI (npm)
;;    A1/A2/A3: npm packaging limitations.

;; 63. rdt-client (#18561) -- Real-Debrid client (.NET)
;;    Needs .NET 9/10; Guix only has dotnet 8. .NET packaging immature.
;;    A1/A2/A3: .NET version too new.

;; 65. texmacs-pure (#17873) -- TeXmacs with Pure language
;;    Pure language defunct. Requires ancient LLVM 3.5.
;;    A1/A2/A3: Dead language, obsolete LLVM.

;; 66. tilp-xdg (#18345) -- TI calculator link program
;;    Depends on libticalcs/libticables/libtconv (not in Guix).
;;    A1: Package full TI-link stack (4+ libs). A2: Too niche.
;;    A3: Blocked on entire TI calculator library ecosystem.

;; 69. eclipse-pydev (#17948) -- Eclipse PyDev plugin
;;    Eclipse IDE not in Guix. No plugin packaging infra.
;;    A1/A2/A3: No Eclipse platform.

;; 71. gbm (#19044) -- Game Backup Monitor (VB.NET/Mono)
;;    VB.NET compiler support unclear in Guix Mono.
;;    A1/A2/A3: VB.NET not well-supported.

;; 72. gephi-git (#18898) -- Graph visualization (Maven/Java)
;;    Maven build + NetBeans Platform dependency.
;;    A1/A2/A3: Maven build-time downloads, NetBeans unavailable.

;; 73. lobe-chat (#18973) -- AI chat frontend (Next.js/pnpm)
;;    Massive npm/pnpm dependency tree. Flagged out-of-date.
;;    A1/A2/A3: npm packaging limitations.

;; 81. bililive-recorder (#18901) -- Bilibili live recorder (.NET)
;;    .NET 6 + npm dual build. .NET packaging immature.
;;    A1/A2/A3: .NET packaging limitations.

;; 85. mailnaggertray-git (#18592) -- Email notifier
;;    Depends on mailnagger (not in Guix, source unclear). 11 commits.
;;    A1/A2/A3: Missing dep, immature project.

;; 89. pulumi-git (#18748) -- Infrastructure as Code (Go)
;;    Large multi-language project (Go+Node+Python). Complex deps.
;;    A1/A2/A3: Too complex, too many languages.

;; 90. python-gradio-pdf (#18463) -- Gradio PDF component
;;    Open source MIT, but needs python-gradio packaged first
;;    (large dependency tree). Keeping BLOCKED pending python-gradio.
;;    A1: Package python-gradio (massive). A2: Wheel install (not idiomatic).
;;    A3: Wait for python-gradio to be packaged independently.

;; 94. soapysdrplay3-luarvique-git (#18426) -- SDR module
;;    Depends on SDRPlay API (proprietary, not in Guix).
;;    A1/A2/A3: Proprietary SDRPlay API not available.

;; 95. unpack-install-jammer (#18498) -- Install Jammer extractor
;;    Depends on install-jammer format libs (not in Guix).
;;    A1: Reverse-engineer format. A2: Too niche.
;;    A3: Blocked on install-jammer dependencies.

;;; === DKMS_KERNEL_MODULE (10 packages) ===

;; 8. aquacomputer_d5next-hwmon-dkms (#18606) -- HWMON DKMS module
;; 17. amneziawg-dkms-git (#18642) -- AmneziaWG DKMS module
;; 28. faustus-dkms-git (#18859) -- ASUS fan control DKMS
;; 30. ideapad-laptop-tb-dkms (#18957) -- Ideapad tablet DKMS
;; 31. ideapad-laptop-tb2024g6plus-dkms (#18895) -- Ideapad 2024 DKMS
;; 42. pfring-dkms (#18399) -- PF_RING network DKMS
;; 44. r8126-dkms (#18487) -- Realtek r8126 DKMS
;; 59. nvidia-bl-dkms (#17755) -- NVIDIA backlight DKMS
;; 76. rtl88x2ce-dkms-git (#18362) -- Realtek WiFi DKMS
;; 87. nvidia-open-tinygrad-dkms-git (#18617) -- NVIDIA tinygrad DKMS
;;    All blocked: DKMS kernel modules incompatible with Guix's
;;    immutable system model. Guix requires kernel modules built
;;    as part of the kernel package itself.

;;; === DISTRO_SPECIFIC (13 packages) ===

;; 14. mkinitcpio-systemd-root-password (#18371) -- mkinitcpio hook
;; 15. repacman (#18707) -- pacman report tool
;; 22. archwiki-offline (#18568) -- Arch Wiki offline reader
;; 29. findbrokenpkgs (#18930) -- Find broken packages (pacman)
;; 46. sbctl-initcpio-post-hook (#18720) -- sbctl mkinitcpio hook
;; 47. system-age (#18453) -- System install age (from pacman log)
;; 49. vscodium-marketplace (#18695) -- pacman hook for VSCodium
;; 50. wyc (#18777) -- Proprietary Chinese tunneling, Arch only
;; 60. pacpak-git (#17862) -- pacman + flatpak wrapper
;; 67. chromium-extension-arch-search (#17897) -- Arch search ext
;; 88. pamac-cli (#17940) -- pacman frontend (ALPM)
;; 92. python-pypi2pkgbuild (#17822) -- PyPI to PKGBUILD converter
;; 99. asp (#18290) -- Arch build source tool
;; 100. aurutils (#11354) -- AUR helper tools
;;    All blocked: Tools specific to Arch Linux ecosystem
;;    (pacman, mkinitcpio, ALPM, AUR). Not applicable on Guix System.

;;; === SOURCE_UNAVAILABLE / PROPRIETARY (11 packages) ===

;; 6. sipgate-app-clinq (#18449) -- Proprietary Electron app, not in AUR cache
;; 7. squareline-studio (#17812) -- Proprietary commercial GUI designer
;; 13. luniistore (#18478) -- Proprietary Java app, download 403
;; 16. simplicity-commander (#18419) -- Proprietary binary, URL dead
;; 25. brother-mfc-l2400dw (#17797) -- Proprietary binary-only printer driver
;; 45. receitanet (#18413) -- Brazilian gov proprietary software
;; 70. euroscope-bin (#17945) -- Windows-only proprietary via Wine
;; 74. plugin-autenticacao-gov-pt (#18557) -- Binary .deb, no source repo
;; 77. urbanterror (#18814) -- Proprietary game data, download broken
;; 83. inkdrop (#17819) -- Proprietary commercial Electron app
;; 91. python-jaxlib-bin (#18474) -- Binary wheel; source needs Bazel

;;; === MINGW_CROSS_COMPILATION (3 packages) ===

;; 36. mingw-w64-cblas (#34115)
;; 37. mingw-w64-lapack (#34113)
;; 38. mingw-w64-soundtouch (#18330)
;;    Windows cross-compilation targets. Not applicable on GNU/Linux.

;;; === SELINUX_SPECIFIC (2 packages) ===

;; 2. sudo-selinux (#18513) -- sudo with SELinux support
;; 3. base-selinux (#18537) -- base packages with SELinux
;;    SELinux infrastructure not available in Guix.

;;; === ANDROID_SDK_PLATFORM (2 packages) ===

;; 20. android-platform-19 (#28671) -- API level 19
;; 21. android-platform-21 (#23109) -- API level 21
;;    Android SDK platform files. Proprietary Google binaries.

;;; === KERNEL_SPECIFIC (3 packages) ===

;; 18. amneziawg-linux (#18452) -- AmneziaWG kernel module variant
;; 19. amneziawg-linux-hardened (#18382) -- AmneziaWG hardened kernel
;; 79. zfs-linux-hardened-headers (#17921)
;; 80. zfs-linux-rt-headers (#17920)
;; 98. zfs-linux-git-headers (#18471)
;;    Kernel-version-specific modules/headers. Guix builds these
;;    as part of the kernel package itself.

;;; === PLATFORM_UNSUPPORTED (2 packages) ===

;; 9. bakkesmod-steam (#17468) -- Windows-only (Rocket League mod)
;; 32. knossu (#18461) -- No source, binary from 2015, no license

;;; === MULTILIB_UNSUPPORTED (1 package) ===

;; 33. lib32-opencl-nvidia-390xx (#17502) -- 32-bit NVIDIA OpenCL

;;; === ABANDONED_UPSTREAM (3 packages) ===

;; 54. lightdm-webkit-theme-aether (#19028) -- Archived Jan 2026
;;    Depends on lightdm-webkit2-greeter (not in Guix). Dead project.
;;    A1: Package greeter dep. A2: Project archived. A3: Not worth effort.
;; 68. clash-for-windows-chinese (#17433) -- CFW discontinued
;; 61. phonon-qt4-vlc (#18938) -- Qt4 is EOL since 2015

;;; === NON_DISTRIBUTABLE (2 packages) ===

;; 78. ut2004-gog (#18333) -- UT2004 via GOG (proprietary game data)
;; 96. unrealtournament4 (#18523) -- UT4 by Epic Games (proprietary)

;;; === LEGACY_PYTHON2 (1 package) ===

;; 93. python2-dbus (#18287) -- Python 2 D-Bus bindings
;;    Python 2 EOL since Jan 2020. No Guix support for Python 2 D-Bus.
;;    A1/A2/A3: Python 2 is dead, no reason to package.

;;; === LICENSE_REVIEW_NEEDED (3 packages) ===

;; 48. ttf-consolas-ligaturized (#20499) -- Derivative of proprietary
;;    Microsoft Consolas font. Cannot redistribute.
;; 82. futu-ftnn-wine (#18151) -- Proprietary Windows binary via Wine
;; 35. libfprint-2-tod1-broadcom-cv3plus (#17912) -- Proprietary driver

;;; === CROSS_COMPILATION (1 package) ===

;; 84. kamilsss655-uv-k5-firmware-custom-git (#17909)
;;    Firmware for UV-K5 radio. Requires ARM cross-compilation toolchain.
;;    A1: Set up ARM cross-build. A2: Complex embedded firmware build.
;;    A3: Niche hardware, cross-compilation effort not justified.

;;; === BUILD_NETWORK_REQUIRED (1 package) ===

;; 39. nftables-geoip-db (#18264) -- GeoIP database (monthly updates)
;;    Database downloaded at build time. Guix builds are sandboxed.
;;    A1: Snapshot specific version. A2: Data changes monthly.
;;    A3: Would need periodic source hash updates.

;;; === KERNEL_MODULE (1 package) ===

;; 34. libch343ser-git (#17880) -- USB serial kernel driver
;;    Not DKMS but still a kernel module. Same Guix incompatibility.

;;; === PROPRIETARY_BINARY (1 package) ===

;; 75. qtspim-iconfix (#18421) -- MIPS simulator
;;    BSD licensed, Qt5/qmake build. Source on SourceForge SVN only.
;;    A1: Use SVN snapshot. A2: Use .deb from SF (404).
;;    A3: Potentially resolvable but SVN-only, low priority.
;;    Reclassified from BUILD_FAILED to DEP_RESOLUTION_FAILED.

;;; === BUILD_SYSTEM_TOO_COMPLEX (2 packages) ===

;; 4. wayfire-git (#18359) -- 3D Wayland compositor (-git)
;;    Requires wlroots 0.20+ (not in Guix, only 0.17). 26+ runtime deps.
;;    Guix already has stable wayfire. No value in -git variant.
;;    A1: Package wlroots 0.20. A2: Use stable wayfire.
;;    A3: Too many deps for marginal value over stable.

;; 5. virtualbox-svn (#18799) -- VirtualBox from SVN
;;    50+ deps, kernel modules, Qt6 GUI, SDK.
;;    A1/A2/A3: Build complexity impossible. Nonguix has virtualbox-bin.

;;; === BROWSER_EXTENSION (2 packages) ===

;; 11. librewolf-extension-ublock-origin-bin (#18355)
;;    Browser extension XPI. Guix can package extensions but
;;    librewolf-specific extension packaging not standardized.
;;    A1: Download XPI, install to browser profile.
;;    A2: No standard Guix browser extension installation path.
;;    A3: Better handled by browser's built-in extension manager.

;; 12. librewolf-tridactyl-native-bin (#18285)
;;    Native messaging host binary. Depends on LibreWolf being installed.
;;    A1: Package native messaging host. A2: No standard install path.
;;    A3: Better handled by browser's native messaging setup.

;;; === LINUX_KEEP_MODULES (1 package) ===

;; 55. linux-keep-modules (#18490) -- pacman hook to preserve kernel modules
;;    Arch-specific pacman alpm-hook. Not applicable on Guix System.

;;; === QUARTZ_UTILS (1 package) ===

;; 62. quartz-utils-git (#18430) -- CLI utilities (Crystal lang)
;;    Crystal language not in Guix (self-hosting bootstrap problem).
;;    A1/A2/A3: Crystal language unavailable.

;;; === SOMMELIER (1 package) ===

;; 64. sommelier-git (#18396) -- ChromeOS Wayland compositor
;;    ChromeOS platform2 monorepo component. Deep ChromeOS deps.
;;    A1/A2/A3: Platform-specific, unfeasible.
