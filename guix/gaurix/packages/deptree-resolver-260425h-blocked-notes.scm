;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; deptree-resolver-260425h -- BLOCKED package notes
;;; 92 packages remain BLOCKED after this pass.
;;;
;;; Categories:
;;;   DEP_RESOLUTION_FAILED  -- dependencies not available in Guix (30)
;;;   DKMS_KERNEL_MODULE     -- Linux DKMS kernel modules (11)
;;;   DISTRO_SPECIFIC        -- Arch Linux specific tools (11)
;;;   SOURCE_UNAVAILABLE     -- cannot obtain upstream source / proprietary (10)
;;;   TOOLING_FAILURE        -- prior tooling/scripting failures (3)
;;;   MINGW_CROSS_COMPILATION -- MinGW Windows cross-compilation (4)
;;;   SELINUX_SPECIFIC       -- requires SELinux infrastructure (2)
;;;   BROWSER_EXTENSION      -- browser extension, not a system package (2)
;;;   ANDROID_SDK_PLATFORM   -- Android SDK platform files (2)
;;;   LICENSE_REVIEW_NEEDED  -- proprietary/unclear license (2)
;;;   KERNEL_SPECIFIC        -- kernel-version-specific headers (2)
;;;   NEEDS_RECIPE_DESIGN    -- proprietary or complex, no feasible recipe (3)
;;;   PLATFORM_UNSUPPORTED   -- platform not supported (1)
;;;   MULTILIB_UNSUPPORTED   -- 32-bit multilib not supported (1)
;;;   KERNEL_MODULE          -- kernel module requiring DKMS (1)
;;;   PROPRIETARY_BINARY     -- non-redistributable proprietary binary (1)
;;;   BUILD_NETWORK_REQUIRED -- build requires network access (1)
;;;   ABANDONED_UPSTREAM     -- project abandoned by upstream (1)
;;;   NON_DISTRIBUTABLE      -- commercial, cannot redistribute (1)
;;;   CROSS_COMPILATION      -- requires cross-compilation toolchain (1)
;;;   LEGACY_PYTHON2         -- requires Python 2 (1)
;;;   BUILD_FAILED           -- build fails, complex deps (1)

;;; === ALREADY_RESOLVED (2 packages) ===

;; 78. mingw-w64-sqlite (#25121) -- Duplicate BLOCKED entry
;;    Already resolved in deptree-resolver-260414v.scm.
;;    Org file has both BLOCKED and DONE entries; need bookkeeping cleanup.

;; 81. python2-wxpython3 (#25153) -- Duplicate BLOCKED entry
;;    Already resolved in deptree-resolver-260415b.scm.
;;    Org file has both BLOCKED and DONE entries; need bookkeeping cleanup.

;;; === DEP_RESOLUTION_FAILED (30 packages) ===

;; 1. gradience (#18644) -- GTK theming app
;;    Not in AUR cache. Upstream: github.com/GradienceTeam/Gradience.
;;    Meson build, Python app. Archived Jul 2024.
;;    A1: Need python-svglib + reportlab chain packaged first.
;;    A2: Complex Python dep chain (5+ missing).
;;    A3: Project archived, no future updates. Could be done with effort
;;    but dep chain is deep.

;; 4. wayfire-git (#18359) -- 3D Wayland compositor (-git)
;;    Requires wlroots 0.20 (not in Guix, only 0.17-0.19 available).
;;    A1: Guix already has stable wayfire. A2: wlroots 0.20 not packaged.
;;    A3: No value in packaging -git variant when stable works.

;; 5. virtualbox-svn (#18799) -- VirtualBox from SVN
;;    50+ deps, kernel modules, Qt6 GUI, SDK.
;;    A1/A2/A3: Build complexity impossible. Nonguix has virtualbox-bin.

;; 11. edgeimpulse-cli (#18574) -- Edge Impulse CLI (npm)
;;    Node.js with deep npm dependency tree.
;;    A1/A2/A3: node-build-system cannot handle complex npm trees.

;; 24. aws-amplify-cli (#18269) -- AWS Amplify CLI (npm)
;;    Massive npm dependency tree.
;;    A1/A2/A3: npm packaging impossible in Guix.

;; 25. aws-cdk (#18298) -- AWS CDK CLI (npm)
;;    Massive npm dependency tree.
;;    A1/A2/A3: Same npm packaging limitations.

;; 27. decrypto-pro-git (#18291) -- CryptoPro key converter
;;    Depends on openssl-gost-engine (not in Guix, niche Russian crypto).
;;    A1: Would need openssl-gost-engine. A2: Very niche (1 AUR vote).
;;    A3: Blocked on one dep but dep itself is complex.

;; 28. emmet-language-server (#18958) -- Emmet LSP (npm)
;;    A1/A2/A3: npm packaging limitations.

;; 41. nodejs-cspell (#18215) -- Spell checker (npm monorepo)
;;    A1/A2/A3: Complex npm monorepo, node-build-system cannot handle.

;; 42. osmtogeojson (#18417) -- OSM to GeoJSON (npm)
;;    A1/A2/A3: npm packaging limitations.

;; 44. python-home-assistant-frontend (#18556) -- HA frontend
;;    115 MB pre-built JS bundle. Cannot build from source without
;;    enormous Node.js/npm build pipeline.
;;    A1: Repackage wheel (violates Guix philosophy).
;;    A2: Build from source (massive JS toolchain needed).
;;    A3: Fundamentally incompatible with Guix source-build model.

;; 53. beammp-launcher-git (#18346) -- BeamNG multiplayer
;;    vcpkg build model incompatible with Guix.
;;    A1: Patch CMake to bypass vcpkg. A2: Complex dep chain.
;;    A3: Game-specific, very niche.

;; 54. java-language-server (#18379) -- Java LSP
;;    Maven build downloads deps at build time.
;;    A1/A2/A3: No maven-build-system in Guix. Flagged out-of-date.

;; 56. lightdm-webkit-theme-aether (#19028) -- LightDM theme
;;    Archived upstream (Jan 2026). Depends on lightdm-webkit2-greeter.
;;    A1/A2/A3: Dead project, missing greeter dep.

;; 58. nfuspire-git (#18401) -- TI-Nspire emulator
;;    Only 1 commit. Depends on libnspire (not in Guix). Too immature.
;;    A1/A2/A3: Incomplete project, blocked on libnspire.

;; 59. nginx-mainline-mod-njs (#18380) -- nginx njs module
;;    No nginx dynamic module build infrastructure in Guix.
;;    A1/A2/A3: Would need nginx module build system.

;; 60. nodejs-nestjs-cli (#18753) -- NestJS CLI (npm)
;;    A1/A2/A3: npm packaging limitations.

;; 63. phonon-qt4-vlc (#18938) -- Phonon VLC for Qt4
;;    Qt4 is dead/EOL since 2015. Completely obsolete.
;;    A1/A2/A3: Qt4 is unsupported.

;; 64. quartz-utils-git (#18430) -- Quartz utilities
;;    Crystal language not in Guix (self-hosting bootstrap problem).
;;    A1/A2/A3: Crystal language unavailable.

;; 65. rdt-client (#18561) -- Real-Debrid client (.NET)
;;    Needs .NET 10; Guix only has dotnet 8. .NET packaging immature.
;;    A1/A2/A3: .NET version too new.

;; 68. sommelier-git (#18396) -- ChromeOS Wayland compositor
;;    ChromeOS platform2 monorepo component. Deep ChromeOS deps.
;;    A1/A2/A3: Platform-specific, unfeasible.

;; 69. texmacs-pure (#17873) -- TeXmacs with Pure language
;;    Pure language defunct. Requires ancient LLVM 3.5.
;;    A1/A2/A3: Dead language, obsolete LLVM.

;; 73. eclipse-pydev (#17948) -- Eclipse PyDev plugin
;;    Eclipse IDE not in Guix. No plugin packaging infra.
;;    A1/A2/A3: No Eclipse platform.

;; 75. gbm (#19044) -- Game Boy emulator (VB.NET/Mono)
;;    VB.NET compiler support unclear in Guix Mono.
;;    A1/A2/A3: VB.NET not well-supported.

;; 76. gephi-git (#18898) -- Graph visualization (Maven/Java)
;;    Maven build + NetBeans Platform dependency.
;;    A1/A2/A3: Maven build-time downloads, NetBeans unavailable.

;; 77. lobe-chat (#18973) -- AI chat frontend (Next.js/pnpm)
;;    Massive npm/pnpm dependency tree. Flagged out-of-date.
;;    A1/A2/A3: npm packaging limitations.

;; 88. bililive-recorder (#18901) -- Bilibili live recorder (.NET)
;;    .NET 6 + npm dual build. .NET packaging immature.
;;    A1/A2/A3: .NET packaging limitations.

;; 93. mailnaggertray-git (#18592) -- Email notifier
;;    Depends on mailnagger (not in Guix, source unclear). 11 commits.
;;    A1/A2/A3: Missing dep, immature project.

;; 97. pulumi-git (#18748) -- Infrastructure as Code (Go)
;;    Large multi-language project (Go+Node+Python). Complex deps.
;;    A1/A2/A3: Too complex, too many languages.

;;; === DKMS_KERNEL_MODULE (11 packages) ===

;; 9. aquacomputer_d5next-hwmon-dkms (#18606) -- HWMON DKMS module
;; 18. amneziawg-dkms-git (#18642) -- AmneziaWG DKMS module
;; 19. amneziawg-linux (#18452) -- AmneziaWG kernel module
;; 20. amneziawg-linux-hardened (#18382) -- AmneziaWG for hardened kernel
;; 29. faustus-dkms-git (#18859) -- ASUS fan control DKMS
;; 31. ideapad-laptop-tb-dkms (#18957) -- Ideapad tablet DKMS
;; 32. ideapad-laptop-tb2024g6plus-dkms (#18895) -- Ideapad 2024 DKMS
;; 43. pfring-dkms (#18399) -- PF_RING network DKMS
;; 46. r8126-dkms (#18487) -- Realtek r8126 DKMS
;; 61. nvidia-bl-dkms (#17755) -- NVIDIA backlight DKMS
;; 83. rtl88x2ce-dkms-git (#18362) -- Realtek WiFi DKMS
;;    All blocked: DKMS kernel modules incompatible with Guix's
;;    immutable system model. Guix requires kernel modules built
;;    as part of the kernel package itself.

;;; === DISTRO_SPECIFIC (11 packages) ===

;; 15. mkinitcpio-systemd-root-password (#18371) -- mkinitcpio hook
;; 16. repacman (#18707) -- pacman report tool
;; 23. archwiki-offline (#18568) -- Arch Wiki offline reader
;; 30. findbrokenpkgs (#18930) -- Find broken packages (pacman)
;; 48. sbctl-initcpio-post-hook (#18720) -- sbctl mkinitcpio hook
;; 49. system-age (#18453) -- System install age (from pacman log)
;; 57. linux-keep-modules (#18490) -- Keep kernel modules (pacman hook)
;; 62. pacpak-git (#17862) -- pacman + flatpak wrapper
;; 71. chromium-extension-arch-search (#17897) -- Arch search extension
;; 96. pamac-cli (#17940) -- Package Manager for ALPM (pacman)
;; 100. python-pypi2pkgbuild (#17822) -- PyPI to PKGBUILD converter
;;    All blocked: Tools specific to Arch Linux ecosystem
;;    (pacman, mkinitcpio, ALPM). Not applicable on Guix System.

;;; === SOURCE_UNAVAILABLE / PROPRIETARY (10 packages) ===

;; 8. squareline-studio (#17812) -- Proprietary commercial GUI designer
;; 14. luniistore (#18478) -- Proprietary Java app, download 403
;; 17. simplicity-commander (#18419) -- Proprietary binary, URL dead
;; 47. receitanet (#18413) -- Brazilian gov proprietary software
;; 52. wyc (#18777) -- Proprietary Chinese tunneling binary
;; 74. euroscope-bin (#17945) -- Windows-only proprietary via Wine
;; 80. plugin-autenticacao-gov-pt (#18557) -- Binary .deb, no source repo
;; 84. urbanterror (#18814) -- Proprietary game data, download broken
;; 91. inkdrop (#17819) -- Proprietary commercial Electron app
;; 99. python-jaxlib-bin (#18474) -- Binary wheel; source needs Bazel

;;; === TOOLING_FAILURE (3 packages) ===

;; 51. vscodium-marketplace (#18695) -- Arch pacman hook, no VSCodium in Guix
;; 95. nvidia-open-tinygrad-dkms-git (#18617) -- Empty AUR repo, NVIDIA firmware
;;    Reclassified: vscodium-marketplace is actually DISTRO_SPECIFIC.
;;    nvidia-open-tinygrad is actually DKMS_KERNEL_MODULE with empty AUR.

;; 55. libarchive-static (#18758) -- Static musl build of libarchive
;;    Complex musl static build of 7+ deps. Guix can do static builds
;;    via (static-package) but reproducing the full musl chain is hard.
;;    A1: Use Guix static-package transform.
;;    A2: Build against musl with static flags. A3: Complex but
;;    theoretically possible. Keeping BLOCKED for now -- niche use case.

;;; === MINGW_CROSS_COMPILATION (4 packages) ===

;; 37. mingw-w64-cblas (#34115)
;; 38. mingw-w64-lapack (#34113)
;; 39. mingw-w64-soundtouch (#18330)
;; 78. mingw-w64-sqlite (#25121) -- ALREADY_RESOLVED (dup)
;;    Windows cross-compilation targets. Not applicable on GNU/Linux.
;;    (#78 is a duplicate BLOCKED entry; already resolved in prior pass.)

;;; === NEEDS_RECIPE_DESIGN / PROPRIETARY (3 packages) ===

;; 7. sipgate-app-clinq (#18449) -- Proprietary Electron app
;; 33. knossu (#18461) -- No source, no license, binary from 2015
;; 89. futu-ftnn-wine (#18151) -- Proprietary Windows binary via Wine

;;; === SELINUX_SPECIFIC (2 packages) ===

;; 2. sudo-selinux (#18513) -- sudo with SELinux support
;; 3. base-selinux (#18537) -- base packages with SELinux
;;    SELinux infrastructure not available in Guix.

;;; === BROWSER_EXTENSION (2 packages) ===

;; 12. librewolf-extension-ublock-origin-bin (#18355)
;; 13. librewolf-tridactyl-native-bin (#18285)
;;    Browser extensions, not system packages.

;;; === ANDROID_SDK_PLATFORM (2 packages) ===

;; 21. android-platform-19 (#28671) -- API level 19
;; 22. android-platform-21 (#23109) -- API level 21
;;    Android SDK platform files. Proprietary Google binaries.

;;; === LICENSE_REVIEW_NEEDED (2 packages) ===

;; 26. brother-mfc-l2400dw (#17797) -- Proprietary binary-only driver
;; 50. ttf-consolas-ligaturized (#20499) -- Derivative of proprietary Microsoft font
;;    Both confirmed proprietary/non-redistributable.

;;; === KERNEL_SPECIFIC (2 packages) ===

;; 86. zfs-linux-hardened-headers (#17921)
;; 87. zfs-linux-rt-headers (#17920)
;;    Kernel-version-specific ZFS headers. Guix ZFS is built with its own kernel.

;;; === OTHER (8 packages, 1 each) ===

;; 10. bakkesmod-steam (#17468) -- PLATFORM_UNSUPPORTED: Windows-only
;; 34. lib32-opencl-nvidia-390xx (#17502) -- MULTILIB_UNSUPPORTED: 32-bit
;; 35. libch343ser-git (#17880) -- KERNEL_MODULE: serial driver
;; 36. libfprint-2-tod1-broadcom-cv3plus (#17912) -- PROPRIETARY_BINARY
;; 40. nftables-geoip-db (#18264) -- BUILD_NETWORK_REQUIRED: monthly data
;; 72. clash-for-windows-chinese (#17433) -- ABANDONED_UPSTREAM
;; 85. ut2004-gog (#18333) -- NON_DISTRIBUTABLE: commercial game
;; 92. kamilsss655-uv-k5-firmware-custom-git (#17909) -- CROSS_COMPILATION

;;; === PYTHON_GRADIO_PDF (#18463) ===

;; 98. python-gradio-pdf (#18463) -- Gradio PDF component
;;    Open source MIT/Apache, but needs python-gradio packaged first
;;    (large dependency tree). Keeping BLOCKED pending python-gradio.
;;    A1: Package python-gradio (massive). A2: Wheel install (not idiomatic).
;;    A3: Wait for python-gradio to be packaged independently.

;;; === BUILD_FAILED (1 package) ===

;; 82. qtspim-iconfix (#18421) -- MIPS simulator
;;    BSD licensed, Qt5/qmake build. Source on SourceForge SVN.
;;    Actually RESOLVABLE but SVN-only source + outdated.
;;    Keeping BLOCKED due to SVN-only source (no git/tarball release).
;;    A1: Use SVN snapshot. A2: Use .deb release from SF. A3: Port patches.
;;    UPDATE: Could be resolved with effort but low priority.

;;; === LEGACY (1 package) ===

;; 94. musique (#18381) -- Qt6 music player
;;    Open source GPL-3.0, all deps in Guix.
;;    Blocked due to 8 git submodules from flaviotordini.
;;    A1: git-fetch with recursive submodules. A2: Fetch each separately.
;;    A3: Complex but theoretically feasible. Low priority.
