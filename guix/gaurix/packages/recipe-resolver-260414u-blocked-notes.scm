;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Blocked notes for recipe-resolver-260414u
;;; 20 packages marked NEEDS_RECIPE_DESIGN_EXHAUSTED
;;;
;;; Packages with detailed blocking reasons:

;;; 1. portage-manifest (#13162, line 97145)
;;;    ARCH_SPECIFIC + NON_FREE_LICENSE: Arch Linux package browser
;;;    (github.com/Pol-Jak-295/portage-manifest, CC-BY-NC);
;;;    depends on pacman, yay, flatpak — all Arch-specific;
;;;    CC-BY-NC (non-commercial) is a non-free license.
;;;    A1: Arch-specific deps (pacman/yay) — zero utility on Guix;
;;;    A2: CC-BY-NC license is non-free — ineligible for Guix;
;;;    A3: Electron/npm build adds further complexity.

;;; 2. vrms-arch-git (#3856, line 30278)
;;;    ARCH_SPECIFIC: virtual Richard M. Stallman for Arch
;;;    (github.com/gardenappl/vrms-arch, BSD-3);
;;;    requires pyalpm (Python bindings for libalpm/pacman);
;;;    fundamentally Arch Linux-specific.
;;;    A1: pyalpm requires libalpm (pacman) — not in Guix;
;;;    A2: queries Arch package database — irrelevant on Guix;
;;;    A3: Guix has built-in freedom-checking via `guix lint --check=license`.

;;; 3. s-console (#13428, line 99155)
;;;    NO_RELEASES + NO_LICENSE: tiny GTK3/VTE terminal emulator
;;;    (github.com/yusufprompt/s-console);
;;;    no tags, no releases, no LICENSE file, 0 stars, single C file;
;;;    hobby project created 2026-03-29.
;;;    A1: no license file — cannot distribute;
;;;    A2: no releases or version tags;
;;;    A3: project too immature (0 stars, 1 commit-equivalent).

;;; 4. ids-ips-tool (#4079, line 32074)
;;;    LOW_QUALITY + MASSIVE_DEPS: hobby IDS/IPS project
;;;    (github.com/Bangkah/athaguard, MIT);
;;;    requires scikit-learn, pandas, numpy, scapy, fastapi, uvicorn,
;;;    iptables, nftables, ufw; 0 GitHub stars; description in Indonesian.
;;;    A1: depends on iptables/nftables/ufw — system-level firewall tools;
;;;    A2: massive Python ML stack for basic network monitoring;
;;;    A3: project too immature for packaging.

;;; 5. basedpyright (#4185, line 32953)
;;;    NPM_ECOSYSTEM: TypeScript/Node.js Python type checker
;;;    (github.com/DetachHead/basedpyright, MIT);
;;;    deep npm dependency tree; Guix node packaging is immature;
;;;    Python wrapper just shells out to the Node.js program.
;;;    A1: node-build-system requires full npm dep resolution;
;;;    A2: PyPI wheel wraps node binary — not a source build;
;;;    A3: pyright upstream already available via npm.

;;; 6. translatelocally-git (#3218, line 25099)
;;;    NO_STABLE_RELEASE + SUBMODULE_DEPS: offline ML translator
;;;    (github.com/XapaJIaMnu/translateLocally, MIT);
;;;    no tagged stable release (only pre-release "latest" tag);
;;;    requires bergamot-translator as git submodule (Marian NMT engine);
;;;    bergamot-translator itself has deep C++ deps.
;;;    A1: no stable version to pin;
;;;    A2: bergamot-translator submodule is complex ML engine;
;;;    A3: Intel MKL optional dep not in Guix.

;;; 7. chessament-git (#13497, line 99665)
;;;    NO_STABLE_RELEASE + KDE6_DEPS: chess tournament manager
;;;    (invent.kde.org/games/chessament, GPL-3.0);
;;;    no tagged release yet (pre-release only);
;;;    requires KDE Frameworks 6 (kirigami-addons, qcoro, etc.);
;;;    many KF6 components not verified in Guix.
;;;    A1: no stable version;
;;;    A2: heavy KDE6/Qt6 dep tree;
;;;    A3: kirigami-addons and qcoro may not be in Guix.

;;; 8. airwindows-consolidated-git (#4149, line 32662)
;;;    NETWORK_BUILD: consolidated Airwindows audio plugins
;;;    (github.com/baconpaul/airwin2rack, MIT+GPL-3.0);
;;;    CMake build downloads JUCE framework and CLAP extensions at
;;;    configure time — incompatible with Guix's network-isolated builds.
;;;    A1: JUCE fetched during cmake configure — breaks sandbox;
;;;    A2: JUCE itself is massive to pre-package;
;;;    A3: airwindows git submodule adds complexity.

;;; 9. fcitx5-sitelen-pona (#11217, line 81824)
;;;    DEPS_UNAVAILABLE: Toki Pona input method for fcitx5
;;;    (github.com/Toastberries/fcitx5-sitelen-pona, MIT);
;;;    requires fcitx5-chinese-addons for table engine (libime);
;;;    fcitx5-chinese-addons is not in Guix;
;;;    no standard build system (custom install.sh).
;;;    A1: fcitx5-chinese-addons not packaged in Guix;
;;;    A2: custom install script needs manual phase adaptation;
;;;    A3: niche input method (Toki Pona conlang) with minimal demand.

;;; 10. xdg-desktop-portal-luminous (#12003, line 88122)
;;;     CARGO_MESON_HYBRID: wlroots xdg-desktop-portal backend
;;;     (github.com/waycrate/xdg-desktop-portal-luminous, GPL-3.0);
;;;     Rust project with Meson+Cargo hybrid build;
;;;     requires vendored cargo crates + Meson integration;
;;;     no standard cargo-build-system or meson-build-system alone.
;;;     A1: hybrid Meson+Cargo build not well-supported in Guix;
;;;     A2: unvendored crates need enumeration;
;;;     A3: pipewire + wayland native deps add complexity.

;;; 11. samrewritten-git (#11699, line 85735)
;;;     STEAM_RUNTIME_REQUIRED: Steam achievement manager
;;;     (github.com/PaulCombal/SamRewritten, GPL-3.0);
;;;     requires Steam client and Steamworks SDK at runtime;
;;;     interacts with Steam process via shared memory;
;;;     Rust rewrite still depends on Steam installation.
;;;     A1: Steam runtime not in Guix;
;;;     A2: Steamworks SDK required for achievement API;
;;;     A3: Rust cargo-build-system needs crate vendoring.

;;; 12. llama.cpp-clblast (#13467, line 99443)
;;;     VARIANT_BUILD: llama.cpp with CLBlast GPU backend
;;;     (github.com/ggml-org/llama.cpp, MIT);
;;;     AUR package applies custom patches to add CLBlast support;
;;;     CLBlast backend not officially supported by upstream;
;;;     Guix already has llama-cpp — variant would need custom patches.
;;;     A1: CLBlast patches are AUR-specific, not upstream;
;;;     A2: Guix llama-cpp exists — variant diverges from upstream;
;;;     A3: CLBlast/OpenCL stack adds native dep complexity.

;;; 13. bsky-electron-git (#3694, line 28954)
;;;     ELECTRON_UNSUPPORTED: Bluesky social client in Electron
;;;     (Electron wrapper around bsky.app web interface);
;;;     Electron apps cannot be built from source in Guix due to
;;;     Chromium bundling constraints and massive npm deps.
;;;     A1: Electron source build infeasible;
;;;     A2: AppImage repack fragile and non-reproducible;
;;;     A3: bsky.app web interface works directly in browsers.

;;; 14. godot-mono-git (#3843, line 30167)
;;;     DOTNET_UNSUPPORTED: Godot engine with .NET/C# support
;;;     (github.com/godotengine/godot);
;;;     requires .NET SDK for C# scripting support;
;;;     .NET ecosystem not bootstrapped in Guix.
;;;     A1: .NET SDK not in Guix;
;;;     A2: Godot base already extremely complex (upstream);
;;;     A3: use godot without Mono/C# — already in Guix.

;;; 15. deezer (#3841, line 30152)
;;;     PROPRIETARY + ELECTRON: Deezer music streaming service
;;;     (deezer.com);
;;;     proprietary service with Electron desktop client;
;;;     requires DRM, account subscription.
;;;     A1: proprietary — not distributable;
;;;     A2: Electron source build infeasible;
;;;     A3: DRM content requires proprietary service.

;;; 16. zalo-macos (#3840, line 30144)
;;;     PLATFORM_INCOMPATIBLE: Zalo messaging app for macOS
;;;     (zalo.me);
;;;     macOS-only application; no Linux version;
;;;     Vietnamese messaging platform.
;;;     A1: macOS-only — no Linux support;
;;;     A2: proprietary software;
;;;     A3: no source code available.

;;; 17. discord-electron-openasar (#3866, line 30360)
;;;     ELECTRON_UNSUPPORTED: Discord with OpenAsar client mod
;;;     (depends on electron37 not in Guix);
;;;     Electron apps cannot be built from source in Guix;
;;;     OpenAsar modifies Electron internals.
;;;     A1: electron37 not in Guix;
;;;     A2: Electron source build infeasible;
;;;     A3: discord already available as binary repack.

;;; 18. opentoonz-git (#3656, line 28630)
;;;     COMPLEX_BUILD: 2D animation software
;;;     (github.com/opentoonz/opentoonz, BSD-3);
;;;     requires git-lfs for large asset files;
;;;     15+ dependencies (Qt5, boost, opencv, lz4, sdl2, etc.);
;;;     most deps are in Guix but git-lfs build integration is complex.
;;;     A1: git-lfs required for asset checkout;
;;;     A2: large dep tree needs verification (opencv, superlu);
;;;     A3: submodule deps (libtiff fork, lzo integration).

;;; 19. dupeguru-git (#11955, line 87714)
;;;     DEPS_UNAVAILABLE + CUSTOM_BUILD: duplicate file finder
;;;     (github.com/arsenetar/dupeguru, GPL-3.0);
;;;     requires PyQt5 (only PyQt6 in Guix) for GUI;
;;;     custom build system (Makefile + setup.py mix, not standard pyproject);
;;;     migration to PyQt6 not completed upstream.
;;;     A1: PyQt5 not in Guix (only PyQt6);
;;;     A2: non-standard build system (Makefile-driven);
;;;     A3: upstream PyQt6 migration incomplete.

;;; 20. input-remapper-git (#11682, line 85589)
;;;     DEPS_UNAVAILABLE + SYSTEMD_REQUIRED: input device remapper
;;;     (github.com/sezanzeb/input-remapper, GPL-3.0);
;;;     requires python-dasbus (D-Bus client library) not in Guix;
;;;     installs systemd service units and udev rules;
;;;     needs running daemon for background remapping.
;;;     A1: python-dasbus not in Guix;
;;;     A2: systemd service units needed (Guix uses Shepherd);
;;;     A3: udev rules require system integration.
