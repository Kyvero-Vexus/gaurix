;;; Queue drain 2026-04-05 daily run batch 2 (queue-20260405-daily2).
;;; Blocked-notes: 45 packages re-blocked with specific reasons.
(define-module (gaurix packages queue-20260405-daily2-blocked-notes))

;; ── Re-blocked packages ─────────────────────────────────────────────
;;
;; 1. alephone-git (#9843)
;;    Reason: NEEDS_RECIPE_DESIGN — Aleph One is the open-source continuation
;;    of the Marathon game engine.  Requires SDL2, Boost, and a complex
;;    autotools build with game-data dependencies.  Recipe drafting not
;;    completed this pass.
;;    Next: Write gnu-build-system recipe with SDL2+Boost inputs, test build.
;;
;; 2. pantheon-session-git (#9846)
;;    Reason: DEP_RESOLUTION_FAILED — Pantheon session requires elementary OS
;;    desktop components (wingpanel, gala, switchboard) which are not packaged
;;    in upstream Guix.  Deep dependency chain of 10+ unpackaged components.
;;    Next: Package core elementary components first (gala, wingpanel).
;;
;; 3. smokinguns-git (#9929)
;;    Reason: NEEDS_RECIPE_DESIGN — Smoking Guns is a Quake3-engine standalone
;;    game.  Requires ioquake3 engine build infrastructure and game assets.
;;    Recipe drafting not completed this pass.
;;    Next: Investigate ioquake3 base in Guix, write cmake recipe.
;;
;; 4. texlive-alteswab (#9933)
;;    Reason: NEEDS_RECIPE_DESIGN — TeX Live package requiring the texlive
;;    build system infrastructure.  Needs investigation of texlive-build-system
;;    patterns in Guix for individual CTAN packages.
;;    Next: Study (guix build-system texlive) patterns, write recipe.
;;
;; 5. sonusmix-git (#9935)
;;    Reason: NEEDS_RECIPE_DESIGN — Sonusmix is a PipeWire mixer GUI written
;;    in Rust with Tauri framework.  Requires cargo-build-system with complex
;;    web-frontend bundling (Tauri/WebView).
;;    Next: Investigate Tauri packaging for Guix, write cargo recipe.
;;
;; 6. texturepacker (#9939)
;;    Reason: SOURCE_UNAVAILABLE — TexturePacker is a proprietary commercial
;;    tool with no publicly downloadable Linux binary or source.  Requires
;;    license purchase and authenticated download.
;;    Next: Cannot proceed without vendor-provided download URL and license terms.
;;
;; 7. sway-i3-style-fullscreen-git (#9940)
;;    Reason: NEEDS_RECIPE_DESIGN — Small Python script for Sway window
;;    manager.  Requires investigation of i3ipc-python bindings and sway
;;    integration.  Recipe drafting not completed this pass.
;;    Next: Write trivial-build-system recipe with python-i3ipc dependency.
;;
;; 8. famitracker (#9941)
;;    Reason: NEEDS_RECIPE_DESIGN — FamiTracker is a Windows-native NES music
;;    tracker.  Linux version requires Wine or a custom SDL2 port.  Build
;;    system investigation needed.
;;    Next: Check for native Linux port, otherwise package via wine wrapper.
;;
;; 9. famistudio (#9942)
;;    Reason: DEP_RESOLUTION_FAILED — FamiStudio is a .NET/C# application
;;    requiring dotnet-sdk runtime.  GNU Guix does not currently package the
;;    .NET SDK for building C# applications.
;;    Next: Wait for dotnet-sdk in Guix or package as binary with bundled runtime.
;;
;; 10. motivewave (#9946)
;;    Reason: SOURCE_UNAVAILABLE — MotiveWave is a proprietary trading
;;    platform with no publicly accessible Linux download URL.  Requires
;;    vendor account and authenticated download.
;;    Next: Cannot proceed without vendor download access.
;;
;; 11. perl-perl-languageserver (#9951)
;;    Reason: NEEDS_RECIPE_DESIGN — Perl Language Server requires CPAN
;;    build infrastructure and multiple Perl module dependencies (AnyEvent,
;;    Coro, etc.) not all available in upstream Guix.
;;    Next: Audit CPAN deps, package missing modules, write perl-build-system recipe.
;;
;; 12. linux-zen-versioned-bin (#9953)
;;    Reason: NEEDS_RECIPE_DESIGN — Packaging a prebuilt Linux kernel requires
;;    careful handling of kernel modules, headers, and initrd integration.
;;    Not feasible as a simple copy-build-system package.
;;    Next: Study Guix kernel packaging patterns for binary kernel packaging.
;;
;; 13. linux-zen-versioned-headers-bin (#9954)
;;    Reason: NEEDS_RECIPE_DESIGN — Kernel headers package requires matching
;;    the exact kernel version and ABI.  Depends on linux-zen-versioned-bin
;;    packaging being resolved first.
;;    Next: Resolve linux-zen-versioned-bin first.
;;
;; 14. linux-zen-versioned-docs-bin (#9955)
;;    Reason: NEEDS_RECIPE_DESIGN — Kernel documentation package.  Depends on
;;    linux-zen-versioned-bin packaging being resolved first.
;;    Next: Resolve linux-zen-versioned-bin first.
;;
;; 15. python-cs50 (#9962)
;;    Reason: DEP_RESOLUTION_FAILED — CS50 Python library requires cs50-specific
;;    C libraries (libcs50) and sqlalchemy extensions not in upstream Guix.
;;    Next: Package libcs50, then write pyproject recipe for python-cs50.
;;
;; 16. 1c_enterprise_meta (#9964)
;;    Reason: SOURCE_UNAVAILABLE — 1C:Enterprise is a proprietary Russian
;;    business application platform.  No publicly available Linux packages
;;    without a vendor license and authenticated download.
;;    Next: Cannot proceed without vendor access.
;;
;; 17. gnome-shell-extension-pano-git (#9965)
;;    Reason: NEEDS_RECIPE_DESIGN — GNOME Shell clipboard manager extension
;;    written in TypeScript/GJS.  Requires GNOME Shell extension build
;;    infrastructure and meson/gjs build system integration.
;;    Next: Study GNOME extension packaging patterns in Guix, write recipe.
;;
;; 18. asf-ui-git (#9968)
;;    Reason: DEP_RESOLUTION_FAILED — ASF (ArchiSteamFarm) UI is a web
;;    frontend requiring Node.js build toolchain (npm/yarn).  Complex npm
;;    dependency tree not suitable for Guix packaging without full audit.
;;    Next: Investigate node-build-system feasibility for this project.
;;
;; 19. nextcloud-app-impersonate (#9971)
;;    Reason: NEEDS_RECIPE_DESIGN — Nextcloud app requiring PHP and Nextcloud
;;    server integration.  Not a standalone package; needs Nextcloud app
;;    deployment infrastructure in Guix.
;;    Next: Design Nextcloud app packaging pattern for Guix channel.
;;
;; 20. hyprsysteminfo-git (#9973)
;;    Reason: DEP_RESOLUTION_FAILED — Hyprland system info tool requiring
;;    hyprland-specific libraries (hyprutils, hyprwayland-scanner) not in
;;    upstream Guix.
;;    Next: Package hyprutils and hyprwayland-scanner first.
;;
;; 21. matlab (#9975)
;;    Reason: SOURCE_UNAVAILABLE — MATLAB is a proprietary commercial product
;;    from MathWorks.  Requires license purchase, MathWorks account, and
;;    authenticated installer download.
;;    Next: Cannot proceed without MathWorks license and installer access.
;;
;; 22. java-matlab (#9976)
;;    Reason: SOURCE_UNAVAILABLE — MATLAB Java integration depends on
;;    proprietary MATLAB installation.  Same blocker as matlab (#9975).
;;    Next: Requires matlab (#9975) to be resolved first.
;;
;; 23. matlab-gcc (#9977)
;;    Reason: SOURCE_UNAVAILABLE — MATLAB GCC compatibility package depends
;;    on proprietary MATLAB installation.  Same blocker as matlab (#9975).
;;    Next: Requires matlab (#9975) to be resolved first.
;;
;; 24. matlab-gcc-fortran (#9978)
;;    Reason: SOURCE_UNAVAILABLE — MATLAB Fortran compiler integration depends
;;    on proprietary MATLAB installation.  Same blocker as matlab (#9975).
;;    Next: Requires matlab (#9975) to be resolved first.
;;
;; 25. winegui (#9983)
;;    Reason: DEP_RESOLUTION_FAILED — WineGUI is a C++ GTK3 application
;;    requiring Wine as a runtime dependency and custom CMake build with
;;    Wine library detection.  Wine packaging in Guix is incomplete.
;;    Next: Verify Wine availability in Guix, write cmake recipe with wine input.
;;
;; 26. lib32-unixodbc (#9985)
;;    Reason: NEEDS_RECIPE_DESIGN — 32-bit ODBC library requires multilib
;;    cross-compilation setup.  Guix multilib support requires careful
;;    handling of 32-bit library paths and dependencies.
;;    Next: Study Guix multilib packaging patterns, write cross-compilation recipe.
;;
;; 27. wine-tkg-staging-ntsync-bin (#9996)
;;    Reason: NEEDS_RECIPE_DESIGN — Custom Wine build with TKG patches and
;;    ntsync kernel support.  Requires complex Wine build infrastructure and
;;    kernel module interaction not feasible in a single pass.
;;    Next: Study Wine packaging in Guix, investigate ntsync kernel requirements.
;;
;; 28. requestly-bin (#9997)
;;    Reason: SOURCE_UNAVAILABLE — Requestly desktop app requires
;;    authenticated download from requestly.com.  No stable public download
;;    URL for the Linux binary found.
;;    Next: Investigate public download endpoint or GitHub releases.
;;
;; 29. grub-silent (#9998)
;;    Reason: NEEDS_RECIPE_DESIGN — GRUB with silent boot patches requires
;;    rebuilding GRUB from source with custom patches.  Interacts with
;;    Guix's bootloader system in complex ways.
;;    Next: Study Guix GRUB packaging and bootloader integration.
;;
;; 30. gopher64-git (#10000)
;;    Reason: NEEDS_RECIPE_DESIGN — Gopher64 is an N64 emulator written in
;;    Rust.  Requires cargo-build-system with complex native dependencies
;;    (SDL2, Vulkan).  Recipe drafting not completed this pass.
;;    Next: Write cargo-build-system recipe with SDL2+Vulkan inputs.
;;
;; 31. v4l2loopback-dkms-git (#10005)
;;    Reason: NEEDS_RECIPE_DESIGN — DKMS kernel module requiring kernel
;;    headers and dynamic module compilation.  Guix kernel module packaging
;;    requires special handling outside standard build systems.
;;    Next: Study Guix linux-module-build-system, write recipe.
;;
;; 32. grub-improved-luks2-git (#10006)
;;    Reason: NEEDS_RECIPE_DESIGN — Modified GRUB with LUKS2+Argon2 support.
;;    Same complexity as grub-silent: requires GRUB rebuild with patches and
;;    bootloader integration.
;;    Next: Study Guix GRUB packaging and bootloader integration.
;;
;; 33. python313-freethreaded (#10007)
;;    Reason: NEEDS_RECIPE_DESIGN — Python 3.13 with free-threading
;;    (no-GIL) requires rebuilding CPython with --disable-gil configure
;;    flag.  Complex interaction with Guix's Python packaging ecosystem.
;;    Next: Study Guix Python package definition, add configure flag variant.
;;
;; 34. mips64el-linux-gnu-gcc-bootstrap (#10016)
;;    Reason: NEEDS_RECIPE_DESIGN — Cross-compilation GCC toolchain for
;;    MIPS64EL.  Requires complex cross-toolchain build infrastructure.
;;    Not feasible in a single queue-drain pass.
;;    Next: Study Guix cross-compilation toolchain packaging patterns.
;;
;; 35. blockbench (#10025)
;;    Reason: DEP_RESOLUTION_FAILED — Blockbench is an Electron-based 3D
;;    model editor.  Requires Electron bundling infrastructure not available
;;    in Guix's standard build systems.
;;    Next: Investigate Electron app packaging for Guix, or package as binary.
;;
;; 36. qvickbuild (#10026)
;;    Reason: SOURCE_UNAVAILABLE — No public source repository or release
;;    artifacts found for qvickbuild.  AUR package may be orphaned or
;;    removed.
;;    Next: Verify AUR package status; if unavailable, mark as abandoned.
;;
;; 37. ratatouille-docs (#10033)
;;    Reason: NEEDS_RECIPE_DESIGN — Documentation subpackage of Ratatouille.
;;    Requires understanding the documentation build process (likely Sphinx
;;    or mdBook) and separating doc output from the main build.
;;    Next: Investigate Ratatouille doc build system, write recipe.
;;
;; 38. vkdoom-git (#10040)
;;    Reason: NEEDS_RECIPE_DESIGN — VkDoom is a Vulkan-rendered Doom source
;;    port.  Requires Vulkan SDK, ZMusic, and complex cmake build with many
;;    dependencies.  Recipe drafting not completed this pass.
;;    Next: Audit cmake dependencies, write cmake recipe with Vulkan inputs.
;;
;; 39. libreoffice-extension-writingtool-bin (#10045)
;;    Reason: NEEDS_RECIPE_DESIGN — LibreOffice extension packaging requires
;;    understanding of OXT format and LibreOffice extension deployment paths.
;;    Not a standard package layout.
;;    Next: Study LibreOffice extension installation paths in Guix.
;;
;; 40. wayfarer (#10047)
;;    Reason: SOURCE_UNAVAILABLE — No public repository or download found
;;    for a package called "wayfarer" matching AUR metadata.  Name may be
;;    ambiguous or package may be removed.
;;    Next: Verify AUR package existence and source URL.
;;
;; 41. gui-for-singbox (#10048)
;;    Reason: DEP_RESOLUTION_FAILED — GUI for sing-box proxy requires Qt6
;;    and sing-box runtime.  Sing-box is not packaged in upstream Guix,
;;    and the GUI has complex build requirements.
;;    Next: Package sing-box first, then write Qt6 GUI recipe.
;;
;; 42. luminance (#10049)
;;    Reason: NEEDS_RECIPE_DESIGN — Luminance HDR tonemapping tool requires
;;    Qt5, Exiv2, FFTW3, and LibRaw.  Complex cmake build with many
;;    dependencies.  Recipe drafting not completed this pass.
;;    Next: Write cmake recipe with qt5+exiv2+fftw+libraw inputs.
;;
;; 43. opera-proxy-git (#10052)
;;    Reason: NEEDS_RECIPE_DESIGN — Opera proxy extractor is a Go application.
;;    Requires go-build-system with Go module dependency resolution.
;;    Recipe drafting not completed this pass.
;;    Next: Write go-build-system recipe with module dependencies.
;;
;; 44. zelda64recomp-bin (#10053)
;;    Reason: NEEDS_RECIPE_DESIGN — Zelda 64 Recompiled is a complex N64
;;    recompilation project.  Binary packaging requires extensive library
;;    patching (SDL2, Vulkan, OpenGL).  Recipe drafting not completed.
;;    Next: Write copy-build-system recipe with patchelf for all shared libs.
;;
;; 45. vicinae-git (#9994)
;;    Reason: SOURCE_UNAVAILABLE — No public repository found for "vicinae"
;;    at the expected locations.  The project may be private or removed.
;;    Next: Verify AUR package and source URL availability.
