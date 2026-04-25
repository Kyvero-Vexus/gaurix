;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; deptree-resolver-260425l -- BLOCKED package notes
;;; 99 packages remain BLOCKED after this pass.
;;; 1 new recipe: tilp-xdg
;;;
;;; Categories:
;;;   DEP_RESOLUTION_FAILED  -- dependencies not available in Guix (27)
;;;   DISTRO_SPECIFIC        -- Arch Linux specific tools (13)
;;;   DKMS_KERNEL_MODULE     -- Linux DKMS kernel modules (10)
;;;   SOURCE_UNAVAILABLE     -- cannot obtain upstream source / proprietary (9)
;;;   MINGW_CROSS_COMPILATION -- MinGW Windows cross-compilation (3)
;;;   NON_DISTRIBUTABLE      -- commercial, cannot redistribute (3)
;;;   KERNEL_SPECIFIC        -- kernel-version-specific headers (3)
;;;   SELINUX_SPECIFIC       -- requires SELinux infrastructure (2)
;;;   ANDROID_SDK_PLATFORM   -- Android SDK platform files (2)
;;;   LICENSE_REVIEW_NEEDED  -- proprietary/unclear license (2)
;;;   BROWSER_EXTENSION      -- browser extension, no standard install (2)
;;;   PLATFORM_UNSUPPORTED   -- platform not supported (2)
;;;   MULTILIB_UNSUPPORTED   -- 32-bit multilib not supported (2)
;;;   TOOLING_FAILURE        -- tooling/build system limitations (2)
;;;   PROPRIETARY_BINARY     -- non-redistributable binary (1)
;;;   PROPRIETARY_DEP        -- depends on proprietary library (1)
;;;   ABANDONED_UPSTREAM     -- project abandoned by upstream (1)
;;;   BUILD_FAILED           -- build failures not resolvable (1)
;;;   KERNEL_MODULE          -- kernel module not using DKMS (1)
;;;   CROSS_COMPILATION      -- requires cross-compilation toolchain (1)
;;;   NEEDS_RECIPE_DESIGN    -- requires extensive custom work (1)

;;; === DEP_RESOLUTION_FAILED (27 packages) ===

;; 1. gradience (#18644) -- GTK theming app
;;    Not in AUR cache.  Project archived Jul 2024.
;;    Needs python-svglib + reportlab chain (5+ missing Python deps).
;;    A1: Complex Python dep chain.  A2: Project archived.  A3: No future updates.

;; 4. wayfire-git (#18359) -- 3D Wayland compositor
;;    Needs wlroots0.20 (Guix has 0.17/0.18/0.19).
;;    A1: Package wlroots0.20.  A2: Stable wayfire exists.  A3: Git version niche.

;; 5. virtualbox-svn (#18799) -- VirtualBox from SVN
;;    50+ deps, kernel modules, extreme complexity.
;;    A1/A2/A3: Would require months of packaging work.

;; 11. edgeimpulse-cli (#18574) -- Edge Impulse CLI (npm)
;;    Node.js with deep npm dependency tree.
;;    A1/A2/A3: node-build-system cannot handle complex npm trees.

;; 24. aws-amplify-cli (#18269) -- AWS Amplify CLI (npm)
;;    Massive npm dependency tree.
;;    A1/A2/A3: npm packaging impossible in Guix currently.

;; 25. aws-cdk (#18298) -- AWS CDK (npm)
;;    Massive npm dependency tree.
;;    A1/A2/A3: Same as aws-amplify-cli.

;; 27. decrypto-pro-git (#18291) -- CryptoPro decryptor
;;    Needs openssl-gost-engine (Russian crypto, not in Guix).
;;    A1: Package openssl-gost-engine.  A2/A3: Niche, no demand.

;; 28. emmet-language-server (#18958) -- Emmet LSP (npm)
;;    npm package with node-build-system limitations.
;;    A1/A2/A3: npm tree too deep.

;; 40. nodejs-cspell (#18215) -- CSpell spell checker (npm)
;;    npm monorepo with node-build-system limitations.
;;    A1/A2/A3: npm tree too deep.

;; 41. osmtogeojson (#18417) -- OSM to GeoJSON converter (npm)
;;    npm package.
;;    A1/A2/A3: npm packaging limitations.

;; 43. python-home-assistant-frontend (#18556) -- HA frontend
;;    115MB pre-built JS bundle, cannot build from source.
;;    A1/A2/A3: No source build path.

;; 51. beammp-launcher-git (#18346) -- BeamMP Launcher
;;    Uses vcpkg build model, incompatible with Guix.
;;    A1: vcpkg deps.  A2: Binary not available.  A3: No alt build.

;; 52. java-language-server (#18379) -- Java LSP
;;    Maven downloads deps at build time.
;;    A1/A2/A3: Maven build incompatible with Guix.

;; 54. lightdm-webkit-theme-aether (#19028) -- LightDM theme
;;    Needs lightdm-webkit2-greeter (not in Guix), npm/webpack build.
;;    A1/A2/A3: Missing greeter + complex JS build.

;; 56. nfuspire-git (#18401) -- TI-Nspire interface
;;    Only 1 commit, needs libnspire (not in Guix).
;;    A1/A2/A3: Unmaintained, missing dep.

;; 57. nginx-mainline-mod-njs (#18380) -- nginx njs module
;;    No nginx dynamic module build infra in Guix.
;;    A1/A2/A3: Would need nginx module build framework.

;; 58. nodejs-nestjs-cli (#18753) -- NestJS CLI (npm)
;;    npm package.  A1/A2/A3: npm limitations.

;; 61. phonon-qt4-vlc (#18938) -- Phonon backend for Qt4
;;    Qt4 is dead/EOL since 2015.
;;    A1/A2/A3: No Qt4 in Guix, no path forward.

;; 62. quartz-utils-git (#18430) -- Crystal language utils
;;    Crystal language not in Guix.
;;    A1/A2/A3: Would need Crystal compiler first.

;; 63. rdt-client (#18561) -- Real-Debrid Torrent client
;;    Needs .NET 9/10 (Guix only has dotnet 8).
;;    A1/A2/A3: Dotnet version gap.

;; 64. sommelier-git (#18396) -- ChromeOS component
;;    ChromeOS platform2 monorepo component.
;;    A1/A2/A3: Platform-specific, not portable.

;; 65. texmacs-pure (#17873) -- TeXmacs Pure plugin
;;    Pure language defunct, needs LLVM 3.5.
;;    A1/A2/A3: Dead language, incompatible LLVM.

;; 69. eclipse-pydev (#17948) -- Eclipse PyDev
;;    Eclipse IDE not in Guix.
;;    A1/A2/A3: Would need Eclipse platform first.

;; 71. gbm (#19044) -- VB.NET application
;;    VB.NET/Mono, VB.NET compiler not supported.
;;    A1/A2/A3: No VB.NET compilation in Guix.

;; 72. gephi-git (#18898) -- Graph visualization
;;    Maven build + NetBeans Platform.
;;    A1/A2/A3: Complex Java build system.

;; 73. lobe-chat (#18973) -- AI chat interface
;;    Next.js/pnpm monorepo, massive npm deps.
;;    A1/A2/A3: npm/pnpm too complex.

;; 84. mailnaggertray-git (#18592) -- Tray icon for mailnagger
;;    Depends on mailnagger (not in Guix, needs python-zombie-imp chain).
;;    A1: Package mailnagger chain.  A2: Rust/cargo deps complex.  A3: Niche.

;; 87. pulumi-git (#18748) -- Infrastructure as Code
;;    Large multi-language project (Go+Node+Python).
;;    A1/A2/A3: Massive multi-language build.

;; 96. awk-language-server (#18691) -- AWK LSP
;;    npm/TypeScript with tree-sitter deps.
;;    A1/A2/A3: npm limitations.

;;; === DISTRO_SPECIFIC (13 packages) ===

;; 15. mkinitcpio-systemd-root-password (#18371)
;; 16. repacman (#18707)
;; 23. archwiki-offline (#18568)
;; 30. findbrokenpkgs (#18930)
;; 46. sbctl-initcpio-post-hook (#18720)
;; 47. system-age (#18453)
;; 49. vscodium-marketplace (#18695) -- pacman hook
;; 55. linux-keep-modules (#18490) -- pacman hook
;; 60. pacpak-git (#17862) -- pacman+flatpak wrapper
;; 67. chromium-extension-arch-search (#17897)
;; 86. pamac-cli (#17940) -- ALPM package manager
;; 90. python-pypi2pkgbuild (#17822) -- PKGBUILD converter
;; 94. asp (#14587) -- Arch build source tool

;;; === DKMS_KERNEL_MODULE (10 packages) ===

;; 9. aquacomputer_d5next-hwmon-dkms (#18606)
;; 18. amneziawg-dkms-git (#18642)
;; 19. amneziawg-linux (#18452)
;; 20. amneziawg-linux-hardened (#18382)
;; 29. faustus-dkms-git (#18859)
;; 31. ideapad-laptop-tb-dkms (#18957)
;; 32. ideapad-laptop-tb2024g6plus-dkms (#18895)
;; 42. pfring-dkms (#18399)
;; 44. r8126-dkms (#18487)
;; 59. nvidia-bl-dkms (#17755)

;;; === SOURCE_UNAVAILABLE (9 packages) ===

;; 6. deadbeef-mpris2-plugin (#19282) -- deprecated, integrated upstream
;; 8. squareline-studio (#17812) -- proprietary commercial
;; 14. luniistore (#18478) -- proprietary Java, download 403
;; 17. simplicity-commander (#18419) -- dead URL
;; 45. receitanet (#18413) -- proprietary Brazilian gov software
;; 50. wyc (#18777) -- proprietary Chinese tunneling binary
;; 70. euroscope-bin (#17945) -- Windows-only via Wine
;; 74. plugin-autenticacao-gov-pt (#18557) -- binary .deb, no source
;; 77. urbanterror (#18814) -- proprietary game, broken download
;; 82. inkdrop (#17819) -- proprietary Electron app

;;; === MINGW_CROSS_COMPILATION (3 packages) ===

;; 37. mingw-w64-cblas (#34115)
;; 38. mingw-w64-lapack (#34113)
;; 39. mingw-w64-soundtouch (#18330)

;;; === NON_DISTRIBUTABLE (3 packages) ===

;; 78. ut2004-gog (#18333) -- commercial game
;; 92. unrealtournament4 (#18319) -- proprietary Epic Games
;; 97. factorio-space-age-experimental (#17440) -- commercial game

;;; === KERNEL_SPECIFIC (3 packages) ===

;; 79. zfs-linux-hardened-headers (#17921)
;; 80. zfs-linux-rt-headers (#17920)
;; 93. zfs-linux-git-headers (#17919)

;;; === SELINUX_SPECIFIC (2 packages) ===

;; 2. sudo-selinux (#18513)
;; 3. base-selinux (#18537)

;;; === ANDROID_SDK_PLATFORM (2 packages) ===

;; 21. android-platform-19 (#28671)
;; 22. android-platform-21 (#23109)

;;; === LICENSE_REVIEW_NEEDED (2 packages) ===

;; 26. brother-mfc-l2400dw (#17797) -- proprietary printer driver
;; 48. ttf-consolas-ligaturized (#20499) -- derivative of MS Consolas

;;; === BROWSER_EXTENSION (2 packages) ===

;; 12. librewolf-extension-ublock-origin-bin (#18355)
;; 13. librewolf-tridactyl-native-bin (#18285)

;;; === PLATFORM_UNSUPPORTED (2 packages) ===

;; 10. bakkesmod-steam (#17468) -- Windows-only mod tool
;; 98. fileoptimizer-bin (#18315) -- Wine-based Windows app

;;; === MULTILIB_UNSUPPORTED (2 packages) ===

;; 34. lib32-opencl-nvidia-390xx (#17502)
;; 100. lib32-libglade (#45410)

;;; === TOOLING_FAILURE (2 packages) ===

;; 53. libarchive-static (#18758) -- static musl build, Arch emergency use
;; 85. nvidia-open-tinygrad-dkms-git (#18617) -- empty AUR repo

;;; === PROPRIETARY_BINARY (1 package) ===

;; 36. libfprint-2-tod1-broadcom-cv3plus (#17912) -- non-redistributable

;;; === PROPRIETARY_DEP (1 package) ===

;; 91. soapysdrplay3-luarvique-git (#18141) -- SDRPlay API proprietary

;;; === ABANDONED_UPSTREAM (1 package) ===

;; 68. clash-for-windows-chinese (#17433) -- GitHub repo deleted

;;; === BUILD_FAILED (1 package) ===

;; 75. qtspim-iconfix (#18421) -- SVN-only source, qmake issues,
;;     parser generation problems.  No GitHub mirror found.
;;     A1: SVN checkout.  A2: No release tarball.  A3: No git mirror.

;;; === KERNEL_MODULE (1 package) ===

;; 35. libch343ser-git (#17880) -- AUR repository is empty

;;; === CROSS_COMPILATION (1 package) ===

;; 83. kamilsss655-uv-k5-firmware-custom-git (#17909) -- ARM cross-compilation

;;; === NEEDS_RECIPE_DESIGN (1 package) ===

;; 7. sipgate-app-clinq (#18449) -- proprietary Electron app, not in AUR cache
;;    33. knossu (#18461) -- proprietary binary from 2015, legacy deps (glew1.10)
;;    81. futu-ftnn-wine (#18151) -- proprietary Windows binary via Wine
;;    88. python-gradio-pdf (#18463) -- needs python-gradio (massive dep tree)
;;    95. aurutils (#11354) -- AUR helper tools for Arch Linux

;;; === DKMS_KERNEL_MODULE (continued) ===

;; 76. rtl88x2ce-dkms-git (#18362) -- Realtek WiFi DKMS

;;; === SOURCE_UNAVAILABLE (continued) ===

;; 99. gstreamermm-docs (#18675) -- needs gstreamermm (not in Guix),
;;     source available on GNOME servers but library is from 2017,
;;     likely incompatible with GStreamer 1.24.
;;     A1: Package gstreamermm.  A2: Old API, may not compile.  A3: Docs-only.

;;; === LEGACY_PYTHON2 (0 packages - all resolved in prior passes) ===

;;; === NOTES ===
;;; tilp-xdg (#18666) resolved: all TI calculator deps (libticalcs2,
;;; libticables2, libtifiles2, libticonv) found in upstream Guix.
;;; Recipe uses gnu-build-system with autotools, patches for KDE removal
;;; and XDG basedir support applied via sed and substitute*.
;;; Build verified: guix build -L guix tilp-xdg succeeded.

;;; 99 packages remain BLOCKED. The remaining pool consists primarily of:
;;; - Packages dependent on build systems/languages not in Guix (npm, Maven,
;;;   .NET 9+, Crystal, VB.NET, Qt4)
;;; - Arch-Linux-specific tools (pacman hooks, AUR helpers)
;;; - DKMS kernel modules (incompatible with Guix kernel model)
;;; - Proprietary/non-distributable software
;;; - Platform-specific packages (Windows, SELinux, Android SDK)
;;; - 32-bit multilib / cross-compilation targets
