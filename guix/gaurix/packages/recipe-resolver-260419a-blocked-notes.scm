;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Blocked notes for recipe-resolver-260419a
;;; 29 packages marked NEEDS_RECIPE_DESIGN_EXHAUSTED with detailed analysis.
;;;
;;; -----------------------------------------------------------------------
;;; 2. libminizinc (#5966)
;;;    MISSING_DEP_CHAIN: MiniZinc constraint modelling compiler/library
;;;    A1: cmake-build-system from source — needs gecode, coin-or-cbc,
;;;        coin-or-osi, coin-or-clp, coin-or-cgl, coin-or-coinutils;
;;;        none of these constraint solver libraries are in Guix.
;;;    A2: Package gecode first — gecode itself is a large C++ project
;;;        with custom autoconf; would need its own dedicated packaging.
;;;    A3: Binary distribution — MiniZinc IDE bundles are Qt-based,
;;;        no standalone CLI binary releases.
;;;    Conclusion: Requires 6+ missing solver libraries; dedicated
;;;    constraint-programming packaging sprint needed.
;;;
;;; 3. roleboi (#5985)
;;;    DOTNET_UNSUPPORTED: C#/.NET Discord bot
;;;    A1: Build from source — requires dotnet-sdk-9.0 not in Guix;
;;;        .NET bootstrapping is infeasible.
;;;    A2: Pre-built binary — no binary releases published.
;;;    A3: Alternative implementation — niche bot with 1 AUR vote;
;;;        no alternative FOSS implementations.
;;;    Conclusion: .NET ecosystem not bootstrappable in Guix.
;;;
;;; 4. alephone-phoenix (#5812)
;;;    MISSING_DEP_CHAIN: Marathon Phoenix total conversion game data
;;;    A1: Package alephone (Aleph One engine) first — complex C++
;;;        SDL/Boost game engine not in Guix.
;;;    A2: Standalone packaging — game data zip without stable URL;
;;;        useless without the engine.
;;;    A3: Use upstream Flatpak — available but not a Guix solution.
;;;    Conclusion: Requires alephone engine packaging first; game data
;;;    alone is non-functional.
;;;
;;; 5. libldap24 (#6020)
;;;    COMPLEX_BUILD: OpenLDAP 2.4.x legacy compatibility library
;;;    A1: Build from source — configure/make; Guix already has modern
;;;        openldap; parallel-installing 2.4.x requires careful flag
;;;        management to avoid file conflicts.
;;;    A2: Extract just client libs — still needs full 2.4 source build;
;;;        chrpath/patchelf for RPATH.
;;;    A3: Symlink compatibility — modern openldap API is mostly
;;;        compatible; true 2.4 dependents are rare.
;;;    Conclusion: Low value; Guix has modern openldap; maintaining a
;;;    legacy parallel version is impractical.
;;;
;;; 6. freetype2-qdoled (#6024)
;;;    COMPLEX_BUILD: FreeType2 with QD-OLED subpixel patches
;;;    A1: Build patched variant — provides/conflicts with freetype2;
;;;        Guix's freetype is a core dependency of hundreds of packages;
;;;        replacing it system-wide is dangerous.
;;;    A2: Parallel install — requires renaming library files;
;;;        applications won't find the variant without LD_LIBRARY_PATH.
;;;    A3: Upstream patches — QD-OLED subpixel patches are not accepted
;;;        upstream; hardware-specific niche.
;;;    Conclusion: Conflicts with system freetype; niche hardware-specific
;;;    patches; impractical in Guix package model.
;;;
;;; 7. quill-editor (#8749)
;;;    MISSING_SOURCE: Simple CLI text editor
;;;    A1: Locate upstream — no URL field in AUR metadata; no PKGBUILD
;;;        cached; cannot identify source repository.
;;;    A2: Search GitHub/GitLab — multiple projects named "quill-editor";
;;;        cannot determine which one AUR references.
;;;    A3: Contact maintainer — 1 AUR vote, 0.04 popularity; likely
;;;        abandoned.
;;;    Conclusion: Source location unknown; cannot package without source.
;;;
;;; 8. indicator-sysmonitor-appindicator-git (#5815)
;;;    MISSING_SOURCE: System monitor panel applet
;;;    A1: Locate AUR package — package name no longer exists in AUR;
;;;        variants are indicator-sysmonitor-budgie-git and
;;;        indicator-sysmonitor-no-budgie-git.
;;;    A2: Package from upstream — github.com/fossfreedom/indicator-sysmonitor
;;;        exists but the specific AUR variant is gone.
;;;    A3: Alternative — Guix has other system monitors.
;;;    Conclusion: AUR package removed; specific variant no longer exists.
;;;
;;; 9. litellm-ollama (#5992)
;;;    MISSING_DEP_CHAIN: LiteLLM + Ollama integration metapackage
;;;    A1: Package litellm — Python project with massive dep chain
;;;        (python-openai, python-tiktoken, python-tokenizers, etc.);
;;;        many missing from Guix.
;;;    A2: Package ollama — Go project with 80+ Go module deps +
;;;        CGo llama.cpp bindings; not in Guix.
;;;    A3: Use pip in profile — not a Guix packaging solution.
;;;    Conclusion: Both primary deps (litellm, ollama) missing with
;;;    deep dependency chains.
;;;
;;; 10. tauon-music-box-git (#5983)
;;;     MISSING_DEP_CHAIN: Python/SDL3 music player
;;;     A1: pyproject-build-system — needs python-pysdl3 (SDL3 bindings);
;;;         SDL3 itself is too new for Guix (only SDL2 available).
;;;     A2: Package SDL3 first — major undertaking; SDL3 API differs
;;;         significantly from SDL2.
;;;     A3: Binary/AppImage — no prebuilt binaries published.
;;;     Conclusion: Blocked on SDL3 not being in Guix; 34 runtime deps
;;;     many missing.
;;;
;;; 11. xtool (#5960)
;;;     MISSING_DEP_CHAIN: iOS/macOS build tool for Linux
;;;     A1: Build from source — requires swift-bin (Swift compiler)
;;;         not available in Guix; Swift is not bootstrappable.
;;;     A2: Pre-built binary — x86_64 binary exists but depends on
;;;         Swift runtime libraries not in Guix.
;;;     A3: Alternative — Xcode on macOS is the canonical tool;
;;;         Linux cross-build is inherently limited.
;;;     Conclusion: Swift toolchain not in Guix; Apple ecosystem tool.
;;;
;;; 12. xlibre-video-voodoo (#6017)
;;;     MISSING_DEP_CHAIN: XLibre fork of 3dfx Voodoo video driver
;;;     A1: Build against xlibre-xserver — XLibre server fork not in
;;;         Guix; would need full XLibre stack packaging.
;;;     A2: Build against xorg-server — API incompatible; XLibre
;;;         diverged from X.Org.
;;;     A3: Skip — targets obsolete 3dfx Voodoo1/Voodoo2 hardware
;;;         (discontinued ~2002).
;;;     Conclusion: Requires XLibre server fork + obsolete hardware.
;;;
;;; 13. xlibre-input-wacom (#5807)
;;;     MISSING_DEP_CHAIN: XLibre fork of Wacom input driver
;;;     A1: Build against xlibre-xserver — XLibre not in Guix.
;;;     A2: Use Guix's existing xf86-input-wacom — identical functionality
;;;         for X.Org server users.
;;;     A3: Wayland alternative — libinput handles Wacom on Wayland.
;;;     Conclusion: Guix already has xf86-input-wacom; XLibre fork
;;;     is redundant.
;;;
;;; 14. xlibre-input-evdev (#5808)
;;;     MISSING_DEP_CHAIN: XLibre fork of evdev input driver
;;;     A1: Build against xlibre-xserver — XLibre not in Guix.
;;;     A2: Use Guix's existing xf86-input-evdev — identical functionality.
;;;     A3: Wayland alternative — libinput handles evdev on Wayland.
;;;     Conclusion: Guix already has xf86-input-evdev; XLibre fork
;;;     is redundant.
;;;
;;; 15. qqc2-desktop-style-git (#5786)
;;;     ALREADY_IN_GUIX: Qt Quick Controls 2 desktop style (KDE Frameworks)
;;;     A1: Package -git variant — needs entire KDE Frameworks -git
;;;         stack (kirigami-git, kiconthemes-git, etc.).
;;;     A2: Use stable version — Guix already has qqc2-desktop-style
;;;         from stable KDE Frameworks releases.
;;;     A3: Backport specific commits — defeats purpose of -git tracking.
;;;     Conclusion: Stable version already in Guix; -git needs full
;;;     KDE -git dependency chain.
;;;
;;; 16. python-unitypy-git (#5928)
;;;     EXCESSIVE_PYTHON_DEPS: Python module for Unity game assets
;;;     A1: pyproject-build-system — needs 7 niche Python packages
;;;         not in Guix (python-texture2ddecoder, python-etcpak-git,
;;;         python-astc-encoder-py-git, python-pyfmodex-git, etc.).
;;;     A2: Package deps first — each dep has sub-dependencies; C++20
;;;         native extensions require modern compiler setup.
;;;     A3: Minimal build — core functionality requires the native
;;;         texture decoders; cannot skip them.
;;;     Conclusion: Deep niche Python dependency chain; each dep has
;;;     C++ components.
;;;
;;; 17. stayfree-desktop (#5965)
;;;     NONFREE_PROPRIETARY: Screen time tracker
;;;     Closed-source proprietary application distributed as prebuilt
;;;     binary (Electron/AppImage).  No source code available.
;;;     Not packagable under Guix FOSS guidelines.
;;;
;;; 18. ftnn-desktop (#5967)
;;;     NONFREE_PROPRIETARY: Futu/Futubull stock trading client
;;;     Closed-source proprietary financial trading application with
;;;     custom license.  Prebuilt binary redistribution from vendor.
;;;
;;; 19. oblivion-desktop-git (#5981)
;;;     NONFREE_LICENSE: Cloudflare WARP VPN client GUI
;;;     Custom restrictive license prohibits redistribution and
;;;     modification of branding.  Depends on electron38 (not in Guix).
;;;
;;; 20. gosplugin (#6010)
;;;     NONFREE_PROPRIETARY: Russian government crypto plugin
;;;     Closed-source Russian government cryptographic browser plugin
;;;     for electronic signatures.  40+ native deps including
;;;     rutoken-connect.  Unknown license.
;;;
;;; 21. fastmail (#6003)
;;;     NONFREE_PROPRIETARY: Fastmail email client
;;;     Proprietary Electron wrapper for commercial email service.
;;;     Custom license.  No source code available.
;;;
;;; 22. cheminot (#5970)
;;;     NONFREE_PROPRIETARY + OBSOLETE: ETS Montreal Java Web Start app
;;;     Proprietary university-specific course registration tool.
;;;     Requires icedtea-web + JRE8 (Java Web Start is deprecated).
;;;     Institution-specific; ETS has migrated to web version.
;;;
;;; 23. vlc-git (#5936)
;;;     ALREADY_IN_GUIX: VLC media player (git version)
;;;     VLC is already packaged in Guix (gnu/packages/video.scm).
;;;     The -git variant tracks master with 50+ makedeps, massive
;;;     build scope; adds no value for a channel package.
;;;
;;; 24. godot-git (#5801)
;;;     ALREADY_IN_GUIX: Godot game engine (git version)
;;;     Godot is packaged in Guix (gnu/packages/game-development.scm).
;;;     Uses SCons build system; -git variant needs bleeding-edge
;;;     deps; adds no channel value.
;;;
;;; 25. geant4 (#5944)
;;;     ALREADY_IN_GUIX: CERN particle physics simulation toolkit
;;;     Available in guix-science-nonfree channel.  Massive C++ project
;;;     with CLHEP, xerces-c, Qt6, OpenMotif, Boost deps.  Custom
;;;     Geant4 Software License (EU Datagrid based, non-standard).
;;;
;;; 26. cnijfilter2-g3010 (#5926)
;;;     NONFREE_PROPRIETARY: Canon InkJet printer driver
;;;     Canon proprietary printer driver under restrictive license
;;;     (non-commercial use only).  Contains binary blobs.
;;;     Model-specific driver for PIXMA G3010.
;;;
;;; 27. proton-cachyos-launcher (#5939)
;;;     DISTRO_SPECIFIC: CachyOS Proton launcher script
;;;     Trivial shell script wrapper depending on proton-cachyos
;;;     (CachyOS-specific Wine/Proton fork).  No standalone value.
;;;     No upstream URL.
;;;
;;; 28. systemd-liberated-libs-git (#7312)
;;;     DISTRO_SPECIFIC: systemd-liberated fork client libraries
;;;     Guix uses Shepherd init system, not systemd.  systemd client
;;;     libraries are not needed.  Massive build with 50+ makedeps
;;;     (LLVM, clang, BPF, TPM2, etc.).
;;;
;;; 29. watt-toolkit-bin (#5792)
;;;     DOTNET_RUNTIME_DEP: Steam multi-tool (Watt Toolkit)
;;;     Prebuilt .NET binary requiring aspnet-runtime-10.0 and
;;;     dotnet-runtime-10.0, neither available in Guix.  Cannot build
;;;     from source without dotnet SDK.  15+ native library deps.
;;;
;;; 30. pm2ml (#8089)
;;;     DISTRO_SPECIFIC: Pacman metalink generator
;;;     Python tool for generating metalinks for Pacman downloads.
;;;     Depends on pyalpm (Pacman bindings), python3-xcgf, python3-xcpf
;;;     (Xyne's custom Python libs).  Zero utility outside Arch ecosystem.
