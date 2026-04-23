;;; recipe-resolver-260423d --- Blocked/exhausted package notes
;;; All 39 remaining NEEDS_RECIPE_DESIGN packages evaluated and exhausted.
;;;
;;; === Flutter ecosystem (20 packages) ===
;;; flutter: FLUTTER_ECOSYSTEM_COMPLEX --- Meta-package for Flutter SDK; requires Dart SDK bootstrap (self-hosting, depot_tools, gn/ninja); no Dart in Guix; engine derived from Chromium source tree
;;; flutter-target-android: ANDROID_SDK_REQUIRED --- Android compilation target; depends on Flutter SDK + pre-built Android engine binaries + Android SDK/NDK
;;; flutter-intellij-patch: FLUTTER_ECOSYSTEM_COMPLEX --- Symlinks for IntelliJ Flutter plugin; depends on Flutter SDK chain + proprietary IntelliJ IDE
;;; flutter-artifacts-sky-engine-google-bin: FLUTTER_ECOSYSTEM_COMPLEX --- Dart platform interface (dart:ui) extracted from Google CI; only useful within Flutter SDK
;;; flutter-artifacts-material-fonts-google-bin: FLUTTER_ECOSYSTEM_COMPLEX --- Material icon fonts from Google Storage; only useful within Flutter SDK chain
;;; flutter-artifacts-gradle-google-bin: FLUTTER_ECOSYSTEM_COMPLEX --- Gradle wrapper for Flutter; Gradle pulls from Maven Central at build time, conflicts with Guix offline model
;;; flutter-artifacts-engine-web-google-bin: PROPRIETARY_BUILD_PIPELINE --- Pre-compiled JS/WASM Flutter engine from Google CI via Emscripten; source build requires depot_tools + entire Chromium-derived engine tree
;;; flutter-artifacts-engine-linux-google-bin: PROPRIETARY_BUILD_PIPELINE --- Pre-compiled libflutter_linux_gtk.so + gen_snapshot from Google CI; engine is Chromium/Skia-derived C++ requiring Google's custom gn build system
;;; flutter-artifacts-engine-common-google-bin: FLUTTER_ECOSYSTEM_COMPLEX --- Patched Dart SDK .dill files from Google CI; pre-compiled intermediate language files not buildable outside CI
;;; flutter-artifacts-engine-android-google-bin: ANDROID_SDK_REQUIRED --- Pre-compiled Android libflutter.so for arm/arm64/x86/x64; requires Android NDK cross-compilation
;;; flutter-artifacts-dart-google-bin: DART_SDK_BOOTSTRAP_COMPLEX --- Complete Dart SDK binary; Dart uses self-hosting bootstrap + depot_tools + gn/ninja; no distro except Arch packages from source
;;; flutter-engine-common-google-bin: FLUTTER_ECOSYSTEM_COMPLEX --- Duplicate of flutter-artifacts-engine-common-google-bin (alternative provider from flutter-artifacts-google-bin pkgbase)
;;; flutter-engine-linux-google-bin: PROPRIETARY_BUILD_PIPELINE --- Duplicate of flutter-artifacts-engine-linux-google-bin (alternative provider)
;;; flutter-engine-web-google-bin: PROPRIETARY_BUILD_PIPELINE --- Duplicate of flutter-artifacts-engine-web-google-bin (alternative provider)
;;; flutter-engine-android-google-bin: ANDROID_SDK_REQUIRED --- Duplicate of flutter-artifacts-engine-android-google-bin (alternative provider)
;;; flutter-sky-engine-google-bin: FLUTTER_ECOSYSTEM_COMPLEX --- Duplicate of flutter-artifacts-sky-engine-google-bin (alternative provider)
;;; flutter-material-fonts-google-bin: FLUTTER_ECOSYSTEM_COMPLEX --- Duplicate of flutter-artifacts-material-fonts-google-bin (alternative provider)
;;; flutter-gradle-google-bin: FLUTTER_ECOSYSTEM_COMPLEX --- Duplicate of flutter-artifacts-gradle-google-bin (alternative provider)
;;; flutter-dart-google-bin: DART_SDK_BOOTSTRAP_COMPLEX --- Duplicate of flutter-artifacts-dart-google-bin (alternative provider)
;;;
;;; === Proprietary/commercial (6 packages) ===
;;; mathematica: PROPRIETARY --- Wolfram Mathematica; commercial software requiring paid license; source requires login to download; license forbids redistribution
;;; jetbrains-toolbox: PROPRIETARY_SELF_UPDATING --- Proprietary self-updating IDE manager; writes to install dir conflicting with Guix store immutability; no offline mode
;;; nvidia-340xx-settings: PROPRIETARY --- GPL settings GUI but requires proprietary nvidia-340xx driver (EOL); useless without proprietary kernel module
;;; intel-ipu6-camera-bin: PROPRIETARY_BINARY --- Pre-compiled proprietary .so/.a blobs from Intel; no source code available; also requires DKMS kernel module
;;; rutoken-plugin: PROPRIETARY_BINARY --- Closed-source browser plugin for Russian crypto tokens; extracted from RPM; no source available
;;; steamvr-openhmd-git: PROPRIETARY --- BSL-1.0 plugin but exclusively for proprietary SteamVR runtime; zero utility without SteamVR
;;;
;;; === Arch-specific (4 packages) ===
;;; vscodium-all-marketplace: ARCH_SPECIFIC --- Pacman/libalpm hook to patch VSCodium marketplace URL; tied to Arch package management infrastructure
;;; snap-pac-grub: ARCH_SPECIFIC --- Pacman hook for btrfs snapshots + GRUB; depends on snap-pac + libalpm; Arch-only tooling
;;; immuarch-verity-git: ARCH_SPECIFIC --- Immutable Arch Linux verity checking; relies on mkinitcpio, pacman, btrfs subvolumes in Arch-specific layout
;;; immuarch-utils-git: ARCH_SPECIFIC --- ImmuArch utility scripts; initcpio hooks + systemd services for Arch-specific immutable boot; irrelevant to Guix System
;;;
;;; === Unsupported runtimes (4 packages) ===
;;; xivlauncher: DOTNET_UNSUPPORTED --- FFXIV launcher (C#/.NET 10+); Guix has no .NET SDK; NuGet dependency resolution incompatible with reproducible builds
;;; lib32-freearc-bin: MULTILIB_UNSUPPORTED --- Pre-compiled 32-bit i386 binary; requires lib32-ncurses5, lib32-gmp, lib32-gtk2; Guix has no multilib
;;; winecx: MULTILIB_UNSUPPORTED --- CodeWeavers CrossOver Wine fork; requires dual 32/64-bit build + extensive lib32-* deps; Guix has no multilib
;;; tosu-overlay: QT6_WEBENGINE_COMPLEX --- Qt6/WebEngine overlay for osu!; qt6-webengine (embedded Chromium) not in Guix; depends on tosu (Node.js memory reader)
;;;
;;; === Complex builds (5 packages) ===
;;; mcpelauncher-ui: QT6_WEBENGINE_COMPLEX --- Qt6/WebEngine UI for Minecraft PE launcher; depends on qt6-webengine (not in Guix) + reverse-engineered game loader chain
;;; vscodium-insiders-git: ELECTRON_COMPLEX --- VSCode Insiders built from source needs nvm+yarn+gulp+Electron; thousands of npm deps; Guix cannot build Electron apps from source
;;; snd-hda-macbookpro-dkms-git: DKMS_KERNEL_MODULE --- DKMS audio kernel module for MacBook Pro; Guix has no DKMS; requires building against specific kernel headers
;;; wemeet-wayland-screenshare-git: PROPRIETARY_RUNTIME_DEP --- Open-source LD_PRELOAD hook but exclusively for proprietary Tencent Meeting (wemeet-bin); zero utility without it
;;; arduino-ide-bin: ELECTRON_COMPLEX --- Arduino IDE v2 is Electron/Theia app; 200+ bundled node_modules; building from source requires massive Node.js/TypeScript pipeline
