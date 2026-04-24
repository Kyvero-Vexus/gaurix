;;; Blocked notes for recipe-resolver-260424t
;;; 28 packages blocked
;;;
;;; neoforge-server (#18119)
;;;   Blocker: DEP_RESOLUTION_FAILED
;;;   Detail: Java Minecraft modding server; requires JDK + NeoForge build infrastructure + Minecraft server JAR + complex Gradle dependency resolution; next: investigate packaging NeoForge installer JAR as copy-build-system
;;;
;;; wpa-cute (#18130)
;;;   Blocker: DEP_RESOLUTION_FAILED
;;;   Detail: Qt5 wpa_supplicant GUI frontend; requires Qt5 + wpa_supplicant development headers + D-Bus integration + specific wpa_ctrl.h header; next: check if Guix upstream wpa-supplicant provides dev outputs
;;;
;;; smtube (#18131)
;;;   Blocker: DEP_RESOLUTION_FAILED
;;;   Detail: Qt5 YouTube browser application; requires qtwebengine (massive 3GB+ build) + smplayer integration + Qt5 multimedia stack; next: evaluate packaging with prebuilt Qt or headless approach
;;;
;;; chomp (#18136)
;;;   Blocker: DEP_RESOLUTION_FAILED
;;;   Detail: Computation Homology Project software; requires PARI/GP math library + specialized CHomP computational topology libraries + custom build system; next: investigate CHomP library availability
;;;
;;; soapysdrplay3-luarvique-git (#18141)
;;;   Blocker: DEP_RESOLUTION_FAILED
;;;   Detail: SoapySDR module for SDRPlay APIv3; requires proprietary SDRPlay API v3 library (libsdrplay_api) not packaged in Guix + SoapySDR framework; next: package SoapySDR first, then evaluate SDRPlay API availability
;;;
;;; kwin-effects-sliding-notifications-git (#18149)
;;;   Blocker: DEP_RESOLUTION_FAILED
;;;   Detail: KDE Plasma KWin C++ plugin; requires KDE Frameworks 5/6 development headers + KWin effect API + Qt5/Qt6 dev stack + ECM (extra-cmake-modules); next: evaluate KDE packaging prerequisites in Guix
;;;
;;; futu-ftnn-wine (#18151)
;;;   Blocker: NEEDS_RECIPE_DESIGN
;;;   Detail: Wine wrapper for proprietary Chinese trading platform Futu Bull (FTNN); requires Wine prefix setup + platform-specific binary download + Chinese locale configuration; next: investigate direct binary download URL and Wine packaging pattern
;;;
;;; clspv-git (#18156)
;;;   Blocker: DEP_RESOLUTION_FAILED
;;;   Detail: OpenCL C to Vulkan SPIR-V compiler; requires LLVM/Clang source tree build + SPIRV-Tools + SPIRV-Headers + Vulkan headers + complex cmake superbuild; next: evaluate if Guix LLVM packages provide needed development components
;;;
;;; thunderbird-globalmenu (#18157)
;;;   Blocker: BUILD_FAILED
;;;   Detail: full Thunderbird build from source with globalmenu patches; requires Rust toolchain + cbindgen + Node.js + 100+ build deps + Mozilla build system (mach); build takes 2+ hours; next: evaluate using upstream Guix thunderbird as base
;;;
;;; codeblocks-svn (#18158)
;;;   Blocker: SOURCE_UNAVAILABLE
;;;   Detail: SVN source repository at svn://svn.code.sf.net/p/codeblocks/code/trunk; Guix lacks native SVN fetch support; no stable tarball snapshot available; next: create a git mirror or snapshot tarball from SVN
;;;
;;; udiskie-systemd-git (#18159)
;;;   Blocker: NEEDS_RECIPE_DESIGN
;;;   Detail: user systemd service file for udiskie auto mounting; Guix System uses GNU Shepherd, not systemd; packaging a systemd unit file has no utility on Guix System; next: evaluate if useful for foreign-distro Guix users
;;;
;;; toxcore-c (#18164)
;;;   Blocker: DEP_RESOLUTION_FAILED
;;;   Detail: C backend implementation of Tox protocol; requires libsodium + opus + libvpx + cmake + specific API version alignment; Guix has c-toxcore but this variant may conflict; next: check if upstream Guix c-toxcore satisfies this
;;;
;;; openfortivpn-webview-electron (#18167)
;;;   Blocker: DEP_RESOLUTION_FAILED
;;;   Detail: Electron webview for SAML SSO with openfortivpn; requires Node.js + npm dependency resolution + Electron build chain + openfortivpn integration; next: evaluate if prebuilt AppImage/binary is available
;;;
;;; openconnect-sso-git (#18168)
;;;   Blocker: DEP_RESOLUTION_FAILED
;;;   Detail: Python wrapper for OpenConnect with Azure AD SAMLv2 auth; requires PyQt5/PyQtWebEngine (massive build) + openconnect + specific Python deps; next: check if pyproject-build-system with Qt deps is feasible
;;;
;;; ffmpeg-full-git (#18189)
;;;   Blocker: DEP_RESOLUTION_FAILED
;;;   Detail: ffmpeg git build with all features including libfdk-aac; requires 50+ optional library dependencies (x264, x265, dav1d, svtav1, opus, vorbis, etc.) + nonfree codec libs; next: extend upstream Guix ffmpeg with additional features
;;;
;;; celeste64 (#18190)
;;;   Blocker: DEP_RESOLUTION_FAILED
;;;   Detail: .NET 8 / C# game (FNA framework); requires dotnet-sdk-8.0 not available in Guix package collection; next: investigate packaging dotnet SDK or using prebuilt game binary
;;;
;;; shadps4-git (#18192)
;;;   Blocker: DEP_RESOLUTION_FAILED
;;;   Detail: PS4 emulator in C++; requires Qt6 + Vulkan SDK + custom shader recompiler + boost + 30+ deps; massive cmake build; next: evaluate Qt6 availability in Guix and Vulkan SDK packaging
;;;
;;; feather-music-git (#18195)
;;;   Blocker: DEP_RESOLUTION_FAILED
;;;   Detail: Rust YouTube Music TUI; 80+ cargo dependencies + YouTube API + mpv/gstreamer integration; requires cargo-build-system with extensive crate resolution; next: attempt cargo import with --recursive
;;;
;;; wine-osu-spectator-wow64 (#18197)
;;;   Blocker: BUILD_FAILED
;;;   Detail: custom Wine build with osu! specific patches + WoW64 cross-compilation; requires full Wine source + mingw-w64 cross toolchain + custom patch series; build takes 3+ hours; next: evaluate if prebuilt Wine binary is distributable
;;;
;;; systemd-ukify-git (#18200)
;;;   Blocker: NEEDS_RECIPE_DESIGN
;;;   Detail: systemd ukify tool for creating Unified Kernel Images; deeply tied to systemd internals and EFI stub; Guix System uses GNU Shepherd and has its own boot infrastructure; next: evaluate utility for foreign-distro Guix users
;;;
;;; folio (#18213)
;;;   Blocker: DEP_RESOLUTION_FAILED
;;;   Detail: GNOME markdown note-taking app (Vala/Meson); requires GTK4 + libadwaita + gtksourceview-5 + libshumate + GNOME SDK 45+; next: evaluate GTK4/libadwaita availability in Guix
;;;
;;; nodejs-cspell (#18215)
;;;   Blocker: DEP_RESOLUTION_FAILED
;;;   Detail: Node.js spelling checker; requires 200+ npm dependencies (typescript, jest, etc.) + complex monorepo build; Guix node-build-system cannot handle this dependency volume; next: evaluate prebuilt npm global install approach
;;;
;;; pixelflasher (#18221)
;;;   Blocker: NEEDS_RECIPE_DESIGN
;;;   Detail: Python GUI for Pixel phone flashing; requires wxPython + Android platform-tools (adb/fastboot) + device-specific bootloader interaction; next: evaluate wxPython availability in Guix and adb packaging
;;;
;;; modrinth-app-appimage (#18228)
;;;   Blocker: NEEDS_RECIPE_DESIGN
;;;   Detail: Modrinth Minecraft launcher packaged as AppImage; requires AppImage extraction + patchelf for dynamic linker + Electron/Tauri runtime dependencies; next: investigate AppImage packaging pattern with copy-build-system + patchelf
;;;
;;; kodi-addon-pvr-hts (#18229)
;;;   Blocker: DEP_RESOLUTION_FAILED
;;;   Detail: Tvheadend HTSP PVR client addon for Kodi; requires kodi-dev headers matching specific Kodi API version (21.x Omega) + p8-platform + kodi-platform cmake modules; next: check Guix Kodi version and dev output availability
;;;
;;; realesrgan-ncnn-vulkan (#18232)
;;;   Blocker: DEP_RESOLUTION_FAILED
;;;   Detail: NCNN implementation of Real-ESRGAN; requires ncnn neural network framework + Vulkan SDK + glslang + cmake; ncnn not packaged in Guix; next: package ncnn first then revisit
;;;
;;; wldash (#18237)
;;;   Blocker: DEP_RESOLUTION_FAILED
;;;   Detail: Rust Wayland launcher and dashboard; 50+ cargo dependencies + wayland-client + wayland-protocols + cairo + pango + fontconfig; requires cargo-build-system with extensive crate resolution; next: attempt cargo import
;;;
;;; smoothpaper (#18241)
;;;   Blocker: DEP_RESOLUTION_FAILED
;;;   Detail: C++ OpenGL wallpaper daemon; requires Wayland protocols + EGL + GLEW + wlr-layer-shell-unstable + meson build + specific graphics stack integration; next: evaluate wayland-protocols and EGL availability in Guix
;;;