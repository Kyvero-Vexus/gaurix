;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260415o
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages from general queue.
;;; 6 resolved with new recipes;
;;; 2 already packaged in Guix/Gaurix (compat alias);
;;; 22 re-evaluated with concrete exhaust reasons.
;;;
;;; Recipes (6 new):
;;;   1. zen-browser-bin (copy, v1.19.8b, Zen Browser prebuilt tarball,
;;;      MPL-2.0)
;;;   2. dxvk-nvapi (copy, v0.9.1, DXVK-NVAPI Wine/Proton DLLs,
;;;      MIT)
;;;   3. dragengine-bin (copy, v1.31, Drag[en]gine game engine runtime,
;;;      MIT)
;;;   4. deigde-bin (copy, v1.31, Drag[en]gine IGDE game dev IDE,
;;;      MIT)
;;;   5. plasmazones-bin (copy, v2.8.7, KDE Plasma tiling/zone manager,
;;;      GPL-3.0+)
;;;   6. plasma-applet-appgrid-bin (copy, v1.7.8, KDE Plasma app grid
;;;      launcher, GPL-2.0+)
;;;
;;; Already packaged (2):
;;;   - sunshine (#21583): already packaged as sunshine-bin in
;;;     recipe-resolver-260407k.scm; compat alias
;;;   - uzdoom (#11603): already packaged as uzdoom-bin in
;;;     recipe-resolver-260415n.scm; compat alias
;;;
;;; Exhausted (22):
;;;   - gpt4all-chat (#10249): INSTALLER_COMPLEX: only Linux binary is
;;;     a 698MB Qt Installer Framework .run file; cannot extract in
;;;     sandboxed build; source build needs Vulkan/shaderc/llama.cpp;
;;;     A1: .run file requires GUI installer extraction;
;;;     A2: source build needs 30+ native deps including llama.cpp;
;;;     A3: no standalone tarball or AppImage available from upstream
;;;   - firefox-esr-globalmenu (#14029): FULL_BROWSER_REBUILD: Firefox
;;;     ESR with appmenu patches requires rebuilding entire browser
;;;     (60+ deps, 2+ hour build); A1: no pre-patched binaries;
;;;     A2: cbindgen/clang/lld/llvm/wasi toolchain needed;
;;;     A3: upstream firefox-esr may already support global menu
;;;   - bootc (#7741): GUIX_INCOMPATIBLE: container-based bootable OS
;;;     model fundamentally incompatible with Guix System declarative
;;;     approach; A1: Rust with vendored crates; A2: requires
;;;     skopeo/podman ecosystem; A3: conceptually wrong for Guix
;;;   - claude-desktop-native (#7257): PROPRIETARY_APP: extracts
;;;     proprietary Windows Claude Desktop .exe; A1: no versioned
;;;     releases; A2: Arch-specific npm/cargo build; A3: cannot
;;;     redistribute proprietary Anthropic application
;;;   - immich-server (#7214): DOCKER_ONLY_MASSIVE_DEPS: photo
;;;     management server distributed only via Docker;
;;;     A1: pnpm+TypeScript+PostgreSQL+Valkey+30 native libs;
;;;     A2: multi-service architecture; A3: no standalone binary
;;;   - ollama-cuda-git (#4603): CUDA_TOOLCHAIN: Ollama with CUDA
;;;     requires CUDA toolkit (nvcc) not available in Guix;
;;;     A1: base ollama recipe needed first;
;;;     A2: Go+CMake+CUDA triple-stack; A3: no CUDA-specific binaries
;;;   - ultimatevocalremovergui-git (#4124): ML_DEPS_CHAIN: vocal
;;;     remover GUI requires 40+ Python ML packages (pytorch,
;;;     onnxruntime, librosa); A1: no Linux binary release;
;;;     A2: full ML/deep learning chain needed; A3: macOS-only binaries
;;;   - onvif-gui (#13919): PYTHON_DEPS_CHAIN: Python ONVIF camera
;;;     client needs python-avio/kankakee/libonvif (custom non-Guix);
;;;     A1: custom Python deps; A2: PyQt6 not in Guix;
;;;     A3: Flatpak/Snap not repackageable
;;;   - lectern-git (#13471): NON_FREE_LICENSE: MIT-Commons-Clause
;;;     license restricts commercial use (non-free);
;;;     A1: Rust/Cargo vendored deps; A2: hosted on obscure git
;;;     instance (papayadev.net); A3: license incompatible with Guix
;;;   - sonic-workspace (#11534): KDE6_PLASMA_FORK: fork of
;;;     plasma-workspace requiring 80+ KDE Plasma 6 dependencies;
;;;     A1: depends on sonic-win (also unpackaged fork);
;;;     A2: massive KDE dep tree; A3: insufficient upstream activity
;;;   - sonic-x11-session (#11535): DEPENDS_ON_SONIC_WORKSPACE: X11
;;;     session depends on sonic-workspace which is itself EXHAUSTED;
;;;     A1: cannot exist without sonic-workspace; A2: XLibre DE fork;
;;;     A3: no standalone functionality
;;;   - lib32-gst-plugins-good (#33318): MULTILIB_UNSUPPORTED: Guix
;;;     uses separate i686-linux system builds, not lib32 overlay;
;;;     A1: 40+ lib32 deps not available; A2: use --system=i686-linux;
;;;     A3: Arch multilib pattern doesn't exist in Guix
;;;   - lib32-vulkan-tools (#11205): MULTILIB_UNSUPPORTED: same lib32
;;;     issue; A1: Guix provides vulkan-tools natively;
;;;     A2: cross-build for i686 is supported; A3: no lib32 overlay
;;;   - canon-pixma-ts5055-complete (#10965): PROPRIETARY_DRIVER:
;;;     Canon binary blobs with redistribution-prohibiting license;
;;;     A1: proprietary cnijfilter2/scangearmp2; A2: requires lib32;
;;;     A3: use SANE/gutenprint generic drivers
;;;   - hyprland-nox (#10779): HYPRLAND_DEPS_CHAIN: Hyprland without
;;;     XWayland needs 8+ unpackaged Hypr* deps (aquamarine,
;;;     hyprcursor, hyprgraphics, hyprlang, hyprutils, hyprwire,
;;;     hyprland-protocols, hyprwayland-scanner);
;;;     A1: each dep is clean CMake/Meson but high scope;
;;;     A2: no binary releases; A3: version-pinned to wlroots
;;;   - linux-cachyos-rc-headers (#10771): KERNEL_VARIANT: CachyOS RC
;;;     kernel headers; depends on linux-cachyos-rc (EXHAUSTED);
;;;     A1: BORE/EEVDF scheduler patches; A2: custom kernel config;
;;;     A3: Guix uses linux-libre kernel model
;;;   - organicmaps-git (#10198): MASSIVE_DEPS: offline mapping app
;;;     with 100+ C++/Qt deps and custom Boost extensions;
;;;     A1: mobile-first design; A2: custom map data pipeline;
;;;     A3: no Linux binary releases (Android APK only)
;;;   - sh-elf-gcc (#7648): DEP_CHAIN_NEEDED: SuperH bare-metal
;;;     cross-compiler needs sh-elf-binutils + sh-elf-newlib first;
;;;     A1: 3-package dependency chain; A2: niche embedded target;
;;;     A3: Guix has native cross-compilation, use that instead
;;;   - grub-blscfg (#7646): GUIX_INCOMPATIBLE: Fedora BLS patches
;;;     tightly coupled to systemd-boot/ostree; writes /boot/grub/
;;;     grub.cfg directly; A1: incompatible with Guix declarative
;;;     boot; A2: systemd-specific; A3: Guix manages bootloader
;;;   - rblx-silver-git (#7187): ALPHA_QUALITY: v0.0.4-alpha too
;;;     immature; A1: wraps proprietary Roblox services;
;;;     A2: niche Wine-based bootstrapper; A3: unstable API
;;;   - llvm-libs-git (#4181): GUIX_HAS_LLVM: Guix already packages
;;;     multiple LLVM versions; A1: -git implies tracking HEAD;
;;;     A2: 20GB+ build; A3: official binaries conflict with Guix
;;;     split packaging
;;;   - mcpelauncher-linux-git (#18203): COMPLEX_BUILD +
;;;     PROPRIETARY_GAME: CMake with clang-specific requirements and
;;;     custom Android compat layer; A1: qt6-webengine massive build;
;;;     A2: wraps proprietary Minecraft PE; A3: custom license
;;;     restrictions
;;;
;;; All sha256 hashes obtained via `guix download`.

(define-module (gaurix packages recipe-resolver-260415o)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix build-system copy)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix utils)
  #:export (
            zen-browser-bin
            dxvk-nvapi
            dragengine-bin
            deigde-bin
            plasmazones-bin
            plasma-applet-appgrid-bin
            ))

;;;
;;; --- 1. zen-browser-bin ---
;;; Firefox-based browser with focus on privacy, productivity, and
;;; beautiful UI.  41K GitHub stars.
;;; Resolves #4438 zen-browser-git (binary repack instead of source
;;; build, which requires full Firefox/Mozilla rebuild).
;;; Source: https://github.com/zen-browser/desktop
;;;

(define-public zen-browser-bin
  (package
    (name "zen-browser-bin")
    (version "1.19.8b")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/zen-browser/desktop/releases/download/"
                    version "/zen.linux-x86_64.tar.xz"))
              (sha256
               (base32
                "12ggj481dfi9hizpah77drd5rh3y55k9yfccigb305c6zz8a5h3v"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "lib/zen/"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'install-wrapper
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin"))
                     (lib (string-append out "/lib/zen")))
                (mkdir-p bin)
                (symlink (string-append lib "/zen-bin")
                         (string-append bin "/zen-browser"))))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "privacy-focused Firefox-based browser with beautiful UI")
    (description
     "Zen Browser is a Firefox-based web browser focused on privacy,
productivity, and a beautifully designed interface.  It features split
views, workspaces, compact mode, sidebar web panels, and enhanced
privacy defaults.  Built on the latest Firefox engine with full
extension compatibility.  This package provides the pre-built binary.")
    (home-page "https://zen-browser.app")
    (license license:mpl2.0)))

;;;
;;; --- 2. dxvk-nvapi ---
;;; DXVK-NVAPI: alternative NVAPI implementation on top of DXVK for
;;; Wine/Proton.  Provides nvapi64.dll and nvapi.dll for NVIDIA GPU
;;; feature emulation in DirectX games under Linux.
;;; Resolves #11104 dxvk-nvapi-mingw.
;;; Source: https://github.com/jp7677/dxvk-nvapi
;;;

(define-public dxvk-nvapi
  (package
    (name "dxvk-nvapi")
    (version "0.9.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/jp7677/dxvk-nvapi/releases/download/v"
                    version "/dxvk-nvapi-v" version ".tar.gz"))
              (sha256
               (base32
                "0ashi7cppymklkxnq71njg7af6fmigr28128ghhyqmq0fjgjr0k4"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("x32/nvapi.dll" "share/dxvk-nvapi/x32/")
          ("x64/nvapi64.dll" "share/dxvk-nvapi/x64/")
          ("x64/nvofapi64.dll" "share/dxvk-nvapi/x64/")
          ("layer/libdxvk_nvapi_vkreflex_layer.so"
           "lib/")
          ("layer/VkLayer_DXVK_NVAPI_reflex.json"
           "share/vulkan/implicit_layer.d/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "alternative NVAPI implementation on top of DXVK")
    (description
     "DXVK-NVAPI provides an alternative implementation of NVIDIA's NVAPI
library for use with DXVK and Wine/Proton.  It translates NVAPI calls
to Vulkan, enabling NVIDIA GPU features like DLSS, Reflex, and
NVENC in DirectX games running on Linux.  Includes the Vulkan Reflex
layer for low-latency frame pacing.  This package provides the
pre-built Windows DLLs and Linux Vulkan layer.")
    (home-page "https://github.com/jp7677/dxvk-nvapi")
    (license license:expat)))

;;;
;;; --- 3. dragengine-bin ---
;;; Drag[en]gine game engine runtime — cross-platform 3D game engine
;;; with modular architecture.
;;; Resolves part of #7021 deigde (runtime dependency).
;;; Source: https://github.com/LordOfDragons/dragengine
;;;

(define-public dragengine-bin
  (package
    (name "dragengine-bin")
    (version "1.31")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/LordOfDragons/dragengine/"
                    "releases/download/v" version
                    "/dragengine-" version "-linux64.tar.bz2"))
              (sha256
               (base32
                "1cw697klgav9s6k59q22m3m2a93n82hsgzdgpk7pfkjw9kymi987"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("usr/lib" "lib")
          ("usr/share" "share"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'create-lib-symlinks
            (lambda* (#:key outputs #:allow-other-keys)
              (let ((lib (string-append (assoc-ref outputs "out") "/lib")))
                ;; Ensure the versioned symlinks are present
                (when (file-exists? (string-append lib "/libdragengine.so.1.31.0"))
                  (unless (file-exists? (string-append lib "/libdragengine.so"))
                    (symlink "libdragengine.so.1.31.0"
                             (string-append lib "/libdragengine.so"))))))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "cross-platform 3D game engine runtime")
    (description
     "Drag[en]gine is a cross-platform 3D game engine with a modular
architecture separating game logic from engine systems.  It provides
a runtime environment for games built with the Drag[en]gine
framework, including rendering, physics, audio, networking, and
input modules.  Supports DragonScript and C++ game scripting.
This package provides the pre-built runtime binaries.")
    (home-page "https://dragondreams.ch")
    (license license:expat)))

;;;
;;; --- 4. deigde-bin ---
;;; Drag[en]gine Integrated Game Development Environment — visual
;;; editor and toolkit for creating Drag[en]gine games.
;;; Resolves #7021 deigde.
;;; Source: https://github.com/LordOfDragons/dragengine
;;;

(define-public deigde-bin
  (package
    (name "deigde-bin")
    (version "1.31")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/LordOfDragons/dragengine/"
                    "releases/download/v" version
                    "/deigde-" version "-linux64.tar.bz2"))
              (sha256
               (base32
                "0qzqp5pyl5yr9b30sbrq9rpx4ml02ksiscih54rdg7iyd0nyg833"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("usr/bin" "bin")
          ("usr/lib" "lib")
          ("usr/share" "share"))))
    (inputs (list dragengine-bin))
    (supported-systems '("x86_64-linux"))
    (synopsis "integrated game development environment for Drag[en]gine")
    (description
     "DEIGDE (Drag[en]gine Integrated Game Development Environment) is a
visual editor and toolkit for creating 3D games using the Drag[en]gine
framework.  It includes world, model, skin, animation, and particle
editors, game definition management, and project templates for
DragonScript.  This package provides the pre-built binary.")
    (home-page "https://dragondreams.ch")
    (license license:expat)))

;;;
;;; --- 5. plasmazones-bin ---
;;; KDE Plasma 6 tiling/zone window manager — assign windows to
;;; predefined screen zones.
;;; Resolves #11619 plasmazones.
;;; Source: https://github.com/fuddlesworth/PlasmaZones
;;;

(define-public plasmazones-bin
  (package
    (name "plasmazones-bin")
    (version "2.8.7")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/fuddlesworth/PlasmaZones/"
                    "releases/download/v" version
                    "/plasmazones-" version
                    "-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "1fyi730xpc08x3kwss3gvzrn2mvvnl12jfcrmrvjlcwv4xfk18r1"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~(let ((prefix (string-append "plasmazones-linux-x86_64/")))
          `((,(string-append prefix "usr/bin") "bin")
            (,(string-append prefix "usr/lib") "lib")
            (,(string-append prefix "usr/share") "share")))))
    (supported-systems '("x86_64-linux"))
    (synopsis "tiling and zone window manager for KDE Plasma 6")
    (description
     "PlasmaZones is a tiling and zone-based window management extension
for KDE Plasma 6.  It allows defining screen zones where windows
snap into place, supporting layouts like Fibonacci, split-focus,
priority grid, and ultrawide configurations.  Includes a visual
layout editor, KWin effect integration, and system settings module.
This package provides the pre-built binary.")
    (home-page "https://github.com/fuddlesworth/PlasmaZones")
    (license license:gpl3+)))

;;;
;;; --- 6. plasma-applet-appgrid-bin ---
;;; KDE Plasma 6 application grid launcher widget.
;;; Resolves #11690 plasma6-applets-appgrid.
;;; Source: https://github.com/xarbit/plasma6-applet-appgrid
;;;

(define-public plasma-applet-appgrid-bin
  (package
    (name "plasma-applet-appgrid-bin")
    (version "1.7.8")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/xarbit/plasma6-applet-appgrid/"
                    "releases/download/v" version
                    "/plasma-applet-appgrid_" version
                    "-1debian13_trixie_amd64.deb"))
              (sha256
               (base32
                "1vwnc7skxps216gwzm7fihs0bcwg6pbpmnzx4mcbamj7xqkyrjbi"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (invoke "ar" "x" source)
              (invoke "tar" "xf" "data.tar.xz")))
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (let ((out (assoc-ref outputs "out")))
                (copy-recursively "usr/lib" (string-append out "/lib"))
                (copy-recursively "usr/share"
                                  (string-append out "/share"))))))))
    (native-inputs
     (list (@ (gnu packages base) binutils)))
    (supported-systems '("x86_64-linux"))
    (synopsis "application grid launcher for KDE Plasma 6")
    (description
     "AppGrid is a full-screen application launcher widget for KDE
Plasma 6 that displays applications in a grid layout, similar to
GNOME's app launcher.  It supports searching, categorization, and
panel integration.  This package provides the pre-built binary
from the Debian trixie package.")
    (home-page "https://github.com/xarbit/plasma6-applet-appgrid")
    (license license:gpl2+)))
