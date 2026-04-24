;;; deptree-resolver-260424x --- Blocked Package Notes
;;;
;;; 104 BLOCKED packages evaluated, 100 selected for resolution.
;;; Results: 5 new recipes, 1 ALREADY_IN_GUIX, 2 AUR_REPO_DELETED,
;;;          92 remain BLOCKED.
;;;
;;; === NEW RECIPES (5) ===
;;; 1. modrinth-app-appimage v0.13.4 — Minecraft mod launcher AppImage
;;; 2. wpa-cute v0.8.6 — Qt6 GUI for wpa_supplicant
;;; 3. chomp v1.2 — Computational Homology Project (CHomP)
;;; 4. folio v25.02 — GNOME notes application
;;; 5. kwin-effects-sliding-notifications — KWin sliding notification effect
;;;
;;; === ALREADY IN GUIX (1) ===
;;; - toxcore-c → Available as 'c-toxcore' v0.2.19 in (gnu packages messaging)
;;;
;;; === AUR REPO DELETED (2) ===
;;; - systemd-ukify-git — AUR git repository is empty/deleted
;;; - smuxi-server — AUR git repository is empty/deleted
;;;
;;; === REMAINING BLOCKED — BY CATEGORY ===
;;;
;;; MINGW_CROSS_COMPILATION (9):
;;;   mingw-w64-cblas, mingw-w64-lapack, mingw-w64-sqlite, mingw-w64-boost,
;;;   mingw-w64-cppwinrt, mingw-w64-pcre2, mingw-w64-spirv-tools,
;;;   mingw-w64-postgresql, mingw-w64-lame
;;;   Reason: Windows cross-compilation toolchain not available in Guix.
;;;
;;; MULTILIB_UNSUPPORTED (7):
;;;   lib32-opencl-nvidia-390xx, lib32-libglade, lib32-libxpm, lib32-sdl_sound,
;;;   capt-src, firestorm-next-bin, etlegacy32-mod
;;;   Reason: 32-bit multilib packages; Guix uses per-system builds, not multilib.
;;;
;;; LEGACY_PYTHON2 (4):
;;;   python2-wxpython3, python2-dbus, python2-gimp, boost-python2
;;;   Reason: Python 2 is EOL; these require Python 2.7 bindings.
;;;
;;; DISTRO_SPECIFIC (7):
;;;   pacpak-git, chromium-extension-arch-search, pamac-cli,
;;;   python-pypi2pkgbuild, aurutils, auracle-git, asp
;;;   Reason: Arch Linux-specific tools (pacman helpers, AUR utilities).
;;;
;;; KERNEL_MODULE (3):
;;;   libch343ser-git, nvidia-bl-dkms, linux-gpib
;;;   Reason: DKMS kernel modules require kernel source tree integration.
;;;
;;; KERNEL_SPECIFIC (3):
;;;   zfs-linux-hardened-headers, zfs-linux-rt-headers, zfs-linux-git-headers
;;;   Reason: Kernel-specific ZFS headers tied to specific kernel variants.
;;;
;;; SOURCE_UNAVAILABLE (6):
;;;   elp, huawei-me936-udev, squareline-studio, euroscope-bin, inkdrop,
;;;   codeblocks-svn
;;;   Reason: Source URLs dead, proprietary download gates, or SVN repo deleted.
;;;
;;; AUR_REPO_DELETED (3 prior + 2 new = 5 total):
;;;   dotnet-runtime-5.0-bin, dotnet-runtime-6.0-bin, llvm40-libs (prior),
;;;   systemd-ukify-git, smuxi-server (new)
;;;
;;; PLATFORM_UNSUPPORTED (1):
;;;   bakkesmod-steam — Windows-only Rocket League game mod.
;;;
;;; NON_DISTRIBUTABLE (1):
;;;   factorio-space-age-experimental — Commercial game DLC.
;;;
;;; ABANDONED_UPSTREAM (1):
;;;   clash-for-windows-chinese — Project discontinued by upstream.
;;;
;;; PROPRIETARY_BINARY (3):
;;;   libfprint-2-tod1-broadcom-cv3plus, deepin-wine8-stable, vmware-workstation
;;;   Reason: Proprietary binaries with restrictive licenses.
;;;
;;; PROPRIETARY_PLATFORM (1):
;;;   quartus-free-quartus — Intel FPGA IDE, proprietary platform.
;;;
;;; PROPRIETARY_DEP (2):
;;;   soapysdrplay3-luarvique-git (needs proprietary libsdrplay),
;;;   python-pylink-square (needs proprietary SEGGER J-Link SDK)
;;;
;;; ANDROID_SDK_PLATFORM (2):
;;;   android-platform-19, android-platform-21
;;;   Reason: Android SDK platform components.
;;;
;;; LICENSE_REVIEW_NEEDED (2):
;;;   brother-mfc-l2400dw (proprietary printer driver),
;;;   ttf-consolas-ligaturized (custom ligatures on proprietary font)
;;;
;;; COMPLEX_BUILD (5):
;;;   anyrun-git (Rust+gtk4-layer-shell), rpfm-git (Rust+Qt5+KDE),
;;;   deadbeef-git (autotools+clang+git-submodules),
;;;   audacious-plugins-git (meson, many codec deps),
;;;   python-jax-rocm (ROCm GPU stack)
;;;   Attempted: Builds require toolchain combinations not easily replicated.
;;;
;;; DEP_RESOLUTION_FAILED (20):
;;;   celeste64 (.NET SDK), neoforge-server (Java installer),
;;;   nodejs-cspell (npm ecosystem), openfortivpn-webview-electron (Electron),
;;;   clspv-git (fetches deps at build time), shadps4-git (12+ submodules),
;;;   openconnect-sso-git (poetry+PyQt6+WebEngine),
;;;   feather-music-git (cargo), kwin-effects-sliding-notifications-git [RESOLVED],
;;;   realesrgan-ncnn-vulkan (needs ncnn not in Guix),
;;;   smoothpaper (Go deps), wldash (Rust+patches),
;;;   envoyproxy (Bazel build), smtube (needs qtwebkit, deprecated),
;;;   kodi-addon-pvr-hts (needs kodi-dev), folio [RESOLVED],
;;;   lightdm-webkit-theme-aether (needs lightdm-webkit2-greeter),
;;;   chomp [RESOLVED], wpa-cute [RESOLVED], illogical-impulse-ags (npm at build)
;;;
;;; MISSING_DEP (4):
;;;   texmacs-pure (needs Pure language + LLVM 3.5),
;;;   eclipse-pydev (Eclipse plugin infrastructure),
;;;   emerald (needs compiz-core), futu-ftnn-wine (wine variant)
;;;
;;; GCC_SNAPSHOT_RUNTIME (4):
;;;   libga68-snapshot, libgfortran-snapshot, libgnat-snapshot, libgo-snapshot
;;;   Reason: GCC pre-release runtime libraries; Guix provides stable GCC
;;;   runtime via gcc-toolchain.
;;;
;;; COMPLEX_DEPS (4):
;;;   glibc-eac (EAC-patched glibc), freetube-electron-git (Electron),
;;;   darling-cli-devenv-gui-common-git (macOS emulation layer),
;;;   darling-iosurface-git (macOS emulation layer)
;;;
;;; OTHER:
;;;   pixelflasher (complex Python+protobuf+wxPython build),
;;;   qtspim-iconfix (SVN source + outdated qmake build),
;;;   udiskie-systemd-git (systemd-only service, not a package)
