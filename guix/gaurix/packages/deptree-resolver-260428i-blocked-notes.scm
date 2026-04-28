;;; Blocked notes for deptree-resolver-260428i
;;; 165 BLOCKED packages evaluated (full queue), 0 new recipes,
;;; 0 resolved to DONE,
;;; 8 newly categorized (previously UNCATEGORIZED → proper category),
;;; 165 remain BLOCKED across intractable categories.
;;;
;;; Generated: 2026-04-28
;;;
;;; Verification checks performed:
;;; - All 100 selected checked against upstream Guix (guix show / guix search)
;;; - Key dependency availability verified: rust 1.85.1, electron 36.8.1,
;;;   dotnet 8.0.401, node 22.14.0, mono 6.12.0, borg 1.4.3
;;; - Crystal language still not in Guix
;;; - .NET 9.0 still not in Guix (only 8.0)
;;; - Rust 1.89+ still not in Guix (only 1.85.1)
;;;
;;; The BLOCKED queue remains at 165 packages.

;;; =========================================================================
;;; NEWLY CATEGORIZED (8 packages — previously UNCATEGORIZED)
;;; =========================================================================

;;; python2-gimp — LEGACY_PYTHON2
;;;   Python 2 plugins for GIMP.  Python 2 reached EOL January 2020.
;;;   Guix has GIMP 2.10.38 and 3.0.4 but no Python 2 bindings.
;;;   A1: package with Python 2 → Python 2 is EOL, Guix dropped python-2 support.
;;;   A2: port to Python 3 → that's GIMP 3.x (already in Guix as gimp 3.0.4).
;;;   A3: provide Python 2 GIMP as legacy → no demand, Python 2 security risk.

;;; pikaur-static — DISTRO_SPECIFIC
;;;   AUR helper compiled to static binary via Nuitka.  Wraps pacman.
;;;   A1: package as-is → depends on pacman (Arch package manager), useless on Guix.
;;;   A2: strip pacman dependency → pikaur IS a pacman wrapper, removing pacman
;;;       removes all functionality.
;;;   A3: alternative AUR interaction → Guix has its own package management.

;;; pikaur-static-git — DISTRO_SPECIFIC
;;;   Git version of pikaur-static.  Same analysis as pikaur-static.
;;;   A1: same as pikaur-static → pacman-dependent, useless on Guix.
;;;   A2: same as pikaur-static → core functionality requires pacman.
;;;   A3: same as pikaur-static → Guix has its own package management.

;;; boost-python2 — LEGACY_PYTHON2
;;;   Boost C++ libraries with Python 2 bindings.
;;;   Guix has boost 1.89.0 with Python 3 support.
;;;   A1: build boost with Python 2 → Python 2 is EOL, not supported in Guix.
;;;   A2: use upstream boost → already in Guix with Python 3 bindings.
;;;   A3: backport Python 2 support → no demand, security risk.

;;; prey — NON_DISTRIBUTABLE
;;;   FPS game based on id Tech 4 engine.  Requires retail game files.
;;;   32-bit binary from 2009.
;;;   A1: package the engine → requires proprietary retail data files.
;;;   A2: provide wrapper for existing install → still needs purchased game.
;;;   A3: open-source alternative → no open-source Prey engine exists.

;;; python-pylink-square — PROPRIETARY_BINARY
;;;   Python interface for SEGGER J-Link debugger.  Apache-2.0 license itself,
;;;   but hard dependency on `jlink-software-and-documentation` which is
;;;   proprietary non-redistributable SEGGER software.
;;;   A1: package without J-Link → useless without the proprietary backend.
;;;   A2: package J-Link → proprietary, non-redistributable EULA.
;;;   A3: use alternative debugger → OpenOCD exists but is different software.

;;; auracle-git — DISTRO_SPECIFIC
;;;   Flexible AUR client.  Depends on pacman, abseil-cpp, libsystemd.
;;;   A1: package as-is → depends on pacman (Arch package manager).
;;;   A2: strip pacman dependency → AUR client without pacman is non-functional.
;;;   A3: Guix alternative → Guix has its own package management model.

;;; borgwarehouse — COMPLEX_DEPS
;;;   Next.js web UI for BorgBackup server management.  AGPL-3.0.
;;;   Guix has borg 1.4.3 and node 22.14.0, but npm build pulls in
;;;   hundreds of transitive JavaScript dependencies.
;;;   A1: package via node-build-system → requires individually packaging
;;;       all npm deps (Next.js alone has 100+ transitive deps).
;;;   A2: use pre-built release bundle → borgwarehouse does not distribute
;;;       pre-built bundles; it requires `npm run build` at install time.
;;;   A3: containerized deployment → out of scope for Guix packaging.

;;; =========================================================================
;;; SELECTED 100 EVALUATION — 3 approaches per package
;;; =========================================================================

;;; === SELINUX_SPECIFIC (2 selected) ===

;;; 1. sudo-selinux (#18513) — SELinux-patched sudo
;;;   A1: package with SELinux → Guix has no SELinux infrastructure.
;;;   A2: use upstream sudo → already in Guix (sudo 1.9.16p2).
;;;   A3: patch Guix sudo for SELinux → requires libselinux stack (20+ packages).

;;; 2. base-selinux (#18537) — SELinux-patched base packages
;;;   A1: meta-package for SELinux base → no SELinux in Guix.
;;;   A2: use standard Guix base → already provided.
;;;   A3: build SELinux stack → 20+ packages, no demand on Guix.

;;; === COMPLEX_DEPS (13 selected) ===

;;; 3. virtualbox-svn (#18799) — VirtualBox from SVN, 53 deps
;;;   A1: full build from SVN → needs Qt6, SDL, XPCOM, kernel modules, DKMS.
;;;   A2: use upstream virtualbox → not in Guix, same complexity.
;;;   A3: binary repackage → Oracle PUEL license restricts redistribution.

;;; 34. python-home-assistant-frontend (#18556) — 500+ npm transitive deps
;;;   A1: package via pyproject → actually an npm/JS build, not Python.
;;;   A2: use pre-built wheel → wheels exist on PyPI but bundle JS assets.
;;;   A3: package npm deps individually → 500+ packages, infeasible.

;;; 44. quartz-utils-git (#18430) — Crystal language not in Guix
;;;   A1: package Crystal first → Crystal bootstrap is complex (self-hosting).
;;;   A2: pre-built binary → no releases with pre-built binaries.
;;;   A3: alternative tool → no equivalent utility exists.

;;; 45. rdt-client (#18561) — .NET 9.0 not in Guix
;;;   A1: build with dotnet 9.0 → only dotnet 8.0 in Guix.
;;;   A2: downgrade to dotnet 8.0 → code uses .NET 9.0 APIs, won't compile.
;;;   A3: binary repackage → possible but needs aspnet-runtime-9.0.

;;; 49. gbm (#19044) — Needs mono-basic (VB.NET)
;;;   A1: package mono-basic first → mono-basic not in Guix, VB.NET compiler.
;;;   A2: rewrite in C# → different software entirely.
;;;   A3: binary repackage → Mono VB.NET runtime needed, not in Guix.

;;; 57. mailnaggertray-git (#18592) — Source 404, zbus 5.x
;;;   A1: build from codeberg source → URL returns 404 per previous evaluation.
;;;   A2: find fork → no known forks exist.
;;;   A3: alternative tray notification → different software.

;;; 60. python-gradio-pdf (#18463) — Depends on gradio (200+ JS deps)
;;;   A1: package gradio first → massive JS/npm dependency tree.
;;;   A2: use pre-built wheel → still needs gradio runtime.
;;;   A3: alternative PDF viewer → different software.

;;; 85. webcord-vencord-git (#18852) — Electron + npm/pnpm build
;;;   A1: build with Guix electron → npm/pnpm/typescript build needs 100+ npm deps.
;;;   A2: pre-built AppImage → proprietary build, non-reproducible.
;;;   A3: alternative Discord client → different software.

;;; 87. frame-eth (#18612) — Electron + npm + nvm build
;;;   A1: build with Guix electron → nvm/npm build needs 200+ npm deps.
;;;   A2: pre-built binary → not officially distributed.
;;;   A3: alternative Web3 tool → different software.

;;; 88. freetube-electron-git (#17925) — Electron + pnpm, 100+ npm deps
;;;   A1: build with Guix electron → pnpm build needs 100+ npm deps.
;;;   A2: use FreeTube AppImage → non-reproducible, different approach.
;;;   A3: package from release tarball → still needs pnpm/npm ecosystem.

;;; 90. madness-interactive-reloaded (#18618) — .NET 9.0 not in Guix
;;;   A1: build with dotnet 9.0 → only dotnet 8.0 in Guix.
;;;   A2: binary repackage → needs dotnet-runtime-9.0.
;;;   A3: downgrade SDK → uses .NET 9.0 specific APIs.

;;; 91. mobirise (#18357) — Proprietary + Electron, no source
;;;   A1: package source → proprietary, no source code available.
;;;   A2: repackage binary → proprietary license, custom restrictions.
;;;   A3: alternative → different software.

;;; 97. hnefatafl-copenhagen (#18404) — Needs Rust >= 1.89, Guix has 1.85.1
;;;   A1: build with Guix Rust 1.85.1 → code requires 1.89+ features.
;;;   A2: bundle newer Rust → Guix Rust bootstrap is version-locked.
;;;   A3: use older release → no older release compatible with Rust 1.85.1.

;;; === DKMS_KERNEL_MODULE (12 selected) ===
;;; All require host kernel headers and DKMS, incompatible with Guix's
;;; functional build model where kernel modules must be built against
;;; a specific kernel configuration.
;;;
;;; 11. aquacomputer_d5next-hwmon-dkms (#18606)
;;; 16. amneziawg-dkms-git (#18642)
;;; 17. amneziawg-linux (#18452)
;;; 18. amneziawg-linux-hardened (#18382)
;;; 24. ideapad-laptop-tb-dkms (#18957)
;;; 25. ideapad-laptop-tb2024g6plus-dkms (#18895)
;;; 28. libch343ser-git (#17880)
;;; 33. pfring-dkms (#18399)
;;; 35. r8126-dkms (#18487)
;;; 41. nvidia-bl-dkms (#17755)
;;; 50. rtl88x2ce-dkms-git (#18362)
;;; 58. nvidia-open-tinygrad-dkms-git (#18617)
;;;
;;; For all DKMS packages:
;;;   A1: build as DKMS module → Guix doesn't support DKMS model.
;;;   A2: build as fixed kernel module → requires specific kernel config,
;;;       out of scope for general packaging.
;;;   A3: upstream kernel support → some drivers are being upstreamed,
;;;       but not yet available as standalone Guix packages.

;;; === PROPRIETARY_BINARY (15 selected) ===
;;; All have proprietary/non-redistributable licensing.
;;;
;;; 6. matlab-jre-bundled (#19363) — MATLAB proprietary JRE
;;; 7. sipgate-app-clinq (#18449) — Not in AUR metadata
;;; 8. squareline-studio (#17812) — Proprietary UI design tool
;;; 9. upd72020x-fw-ng (#29404) — Proprietary Renesas USB firmware
;;; 10. xairedit (#20522) — Proprietary audio editor
;;; 15. simplicity-commander (#18419) — Proprietary Silicon Labs tool
;;; 22. brother-mfc-l2400dw (#17797) — Proprietary printer driver
;;; 26. knossu (#18461) — Binary-only game, downloads 404
;;; 29. libfprint-2-tod1-broadcom-cv3plus (#17912) — Proprietary fingerprint driver
;;; 38. wyc (#18777) — Proprietary application
;;; 55. inkdrop (#17819) — Proprietary Markdown editor
;;; 62. soapysdrplay3-luarvique-git (#18141) — Depends on proprietary SDRPlay API
;;; 78. anytxt-bin (#18295) — Proprietary Windows search tool
;;; 81. pianoteq-stage (#18367) — Proprietary piano VST
;;; 84. vmd (#18253) — Proprietary academic license
;;;
;;; For all proprietary packages:
;;;   A1: redistribute binary → license prohibits redistribution.
;;;   A2: find open-source alternative → different software.
;;;   A3: provide wrapper script → still needs proprietary binary.

;;; === MINGW_CROSS_COMPILATION (10 selected) ===
;;; All are Windows cross-compilation packages using MinGW-w64 toolchain.
;;;
;;; 30. mingw-w64-cblas (#34115)
;;; 31. mingw-w64-lapack (#34113)
;;; 32. mingw-w64-soundtouch (#18330)
;;; 67. mingw-w64-boost (#23783)
;;; 68. mingw-w64-cppwinrt (#43750)
;;; 69. mingw-w64-pcre2 (#26805)
;;; 70. mingw-w64-spirv-tools (#42666)
;;; 71. dxvk-async-git (#18820) — Vulkan→DirectX for Wine/Proton
;;; 75. mingw-w64-postgresql (#24572)
;;; 80. mingw-w64-lame (#34112)
;;;
;;; For all MinGW packages:
;;;   A1: cross-compile with Guix MinGW → Guix cross-compilation exists but
;;;       targets differ from Arch's mingw-w64 packages.
;;;   A2: use native Linux equivalents → libraries already in Guix natively.
;;;   A3: build via Wine → different approach, not cross-compilation.
;;; Note: dxvk-async-git specifically needs mingw-w64 + Wine patching.

;;; === DISTRO_SPECIFIC (7 selected) ===
;;; All are Arch Linux specific tools depending on pacman/mkinitcpio.
;;;
;;; 14. repacman (#18707)
;;; 21. archwiki-offline (#18568)
;;; 23. findbrokenpkgs (#18930)
;;; 36. sbctl-initcpio-post-hook (#18720)
;;; 42. pacpak-git (#17862)
;;; 47. chromium-extension-arch-search (#17897)
;;; 59. pamac-cli (#17940)
;;;
;;; For all distro-specific packages:
;;;   A1: package as-is → depends on pacman/libalpm infrastructure.
;;;   A2: port to Guix → would require complete rewrite.
;;;   A3: use Guix equivalent → Guix has its own tools for each purpose.

;;; === ABANDONED_UPSTREAM (6 selected) ===
;;;
;;; 4. deadbeef-mpris2-plugin (#19282) — Dead upstream, no source repo
;;; 39. lightdm-webkit-theme-aether (#19028) — Archived GitHub repo
;;; 43. phonon-qt4-vlc (#18938) — Phonon backend for Qt4 (EOL)
;;; 46. texmacs-pure (#17873) — TeXmacs plugin for Pure language (dead since 2018)
;;; 48. clash-for-windows-chinese (#17433) — Removed due to legal issues
;;; 95. beignet-git (#18416) — Intel OpenCL for old GPUs, superseded by NEO
;;;
;;; For all abandoned packages:
;;;   A1: build from last known source → code is stale, dependencies have moved on.
;;;   A2: find fork/successor → no active forks found.
;;;   A3: alternative software → upstream functionality covered by other packages.

;;; === PLATFORM_UNSUPPORTED (5 selected) ===
;;;
;;; 12. bakkesmod-steam (#17468) — Windows-only Rocket League mod
;;; 19. android-platform-19 (#28671) — Android SDK platform 19
;;; 20. android-platform-21 (#23109) — Android SDK platform 21
;;; 54. futu-ftnn-wine (#18151) — Windows app via Wine, proprietary
;;; 72. eddiscovery (#18320) — Windows .NET app (Elite Dangerous)
;;;
;;; For all platform-unsupported packages:
;;;   A1: native Linux build → no Linux source/port exists.
;;;   A2: Wine/emulation wrapper → unstable, not reproducible.
;;;   A3: Android SDK integration → Guix lacks Android SDK infrastructure.

;;; === ARCH_SPECIFIC (5 selected) ===
;;;
;;; 13. mkinitcpio-systemd-root-password (#18371) — mkinitcpio hook
;;; 40. linux-keep-modules (#18490) — pacman hook
;;; 61. python-pypi2pkgbuild (#17822) — PKGBUILD generator
;;; 73. glibc-eac (#24719) — Patched glibc for Easy Anti-Cheat
;;; 76. mkinitcpio-clevis-hook (#18342) — mkinitcpio + Clevis/LUKS
;;;
;;; For all Arch-specific packages:
;;;   A1: package as-is → depends on mkinitcpio/pacman infrastructure.
;;;   A2: port functionality → would require complete rewrite for Guix.
;;;   A3: Guix equivalent → Guix initrd system handles these use cases differently.

;;; === MULTILIB_UNSUPPORTED (5 selected) ===
;;;
;;; 27. lib32-opencl-nvidia-390xx (#17502) — 32-bit NVIDIA OpenCL + proprietary
;;; 66. lib32-libglade (#45410) — 32-bit deprecated libglade
;;; 74. lib32-libxpm (#16491) — 32-bit X11 pixmap library
;;; 79. lib32-sdl_sound (#22729) — 32-bit SDL_sound
;;; 89. lib32-vkbasalt (#18688) — 32-bit VkBasalt post-processing
;;;
;;; For all multilib packages:
;;;   A1: build 32-bit version → Guix doesn't support lib32 multilib model.
;;;   A2: use native 64-bit version → already in Guix (libxpm, sdl, etc.).
;;;   A3: cross-compile for i686 → possible but different approach than lib32.

;;; === KERNEL_HEADERS (4 selected) ===
;;;
;;; 5. linux6.18.22-1-lts-bin (#37932) — Specific kernel binary
;;; 52. zfs-linux-hardened-headers (#17921) — ZFS + hardened kernel
;;; 53. zfs-linux-rt-headers (#17920) — ZFS + RT kernel
;;; 64. zfs-linux-git-headers (#17919) — ZFS + git kernel
;;;
;;; For all kernel header packages:
;;;   A1: build specific kernel headers → Guix kernel is managed separately.
;;;   A2: use Guix linux-libre headers → different kernel configuration.
;;;   A3: ZFS module → ZFS licensing (CDDL) incompatible with GPL kernel.

;;; === NON_DISTRIBUTABLE (4 selected) ===
;;;
;;; 37. ttf-consolas-ligaturized (#20499) — Microsoft font derivative
;;; 51. ut2004-gog (#18333) — Commercial game, requires purchase
;;; 63. unrealtournament4 (#18319) — Commercial game, Epic exclusive
;;; 65. factorio-space-age-experimental (#17440) — Commercial game DLC
;;;
;;; For all non-distributable packages:
;;;   A1: redistribute → license prohibits.
;;;   A2: provide installer script → requires user's own copy.
;;;   A3: open-source alternative → different software.

;;; === GCC_SNAPSHOT (3 selected) ===
;;;
;;; 98. libga68-snapshot (#19629) — GCC snapshot Ada runtime
;;; 99. libgfortran-snapshot (#19625) — GCC snapshot Fortran runtime
;;; 100. libgnat-snapshot (#19623) — GCC snapshot GNAT runtime
;;;
;;; For all GCC snapshot packages:
;;;   A1: build from gcc-git → unstable, no release tag.
;;;   A2: use Guix GCC → already provides stable libgfortran/libgnat.
;;;   A3: snapshot tracking → Guix model prefers stable releases.

;;; === HARDWARE_SPECIFIC (1 selected) ===
;;;
;;; 56. kamilsss655-uv-k5-firmware-custom-git (#17909) — ARM cross-compilation
;;;   A1: cross-compile with arm-none-eabi → needs arm-none-eabi-gcc not in Guix.
;;;   A2: use Guix cross-compilation → arm-none-eabi target not standard.
;;;   A3: pre-built firmware → firmware binaries exist but hardware-specific.

;;; === LEGACY_PYTHON2 (from newly categorized) ===
;;; 77. python2-gimp (#23210) — Python 2 GIMP bindings
;;; 86. boost-python2 (#37225) — Boost with Python 2

;;; === COMPLEX_DEPS (from newly categorized) ===
;;; 96. borgwarehouse (#18840) — Next.js webapp, npm build

;;; === PROPRIETARY_BINARY (from newly categorized) ===
;;; 93. python-pylink-square (#21233) — proprietary J-Link dependency

;;; === NON_DISTRIBUTABLE (from newly categorized) ===
;;; 92. prey (#18251) — commercial game requiring retail files

;;; === DISTRO_SPECIFIC (from newly categorized) ===
;;; 82. pikaur-static (#18750) — AUR helper
;;; 83. pikaur-static-git (#18749) — AUR helper git version
;;; 94. auracle-git (#2160) — AUR client
