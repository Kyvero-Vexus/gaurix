;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260415n
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages from general queue.
;;; 6 resolved with new recipes;
;;; 2 already packaged in Guix upstream (compat alias);
;;; 22 re-evaluated with concrete exhaust reasons.
;;;
;;; Recipes (6 new):
;;;   1. rustconn-bin (copy, v0.10.19, GTK4 connection manager AppImage,
;;;      GPL-3.0+)
;;;   2. uzdoom-bin (copy, v4.14.3, GZDoom fork AppImage,
;;;      GPL-3.0+)
;;;   3. polymc-bin (copy, v7.0, Minecraft launcher portable tarball,
;;;      GPL-3.0)
;;;   4. slippi-mainline-bin (copy, v4.0.0-mainline-beta.14, Dolphin
;;;      emulator fork AppImage, GPL-2.0+)
;;;   5. libretro-azahar-core-bin (copy, v2125.1, 3DS libretro core
;;;      prebuilt, GPL-2.0+)
;;;   6. osrm-backend (cmake, v6.0.0, OpenStreetMap routing engine,
;;;      BSD-2-Clause)
;;;
;;; Already packaged in Guix upstream (2):
;;;   - audacious-plugins-gtk3 (#7758): Guix audacious 4.4.2 already
;;;     bundles all plugins with GTK support; compat alias
;;;   - godot32 (#6770): Guix godot 4.4 supports native arch; 32-bit
;;;     variant is arch-specific; compat alias to godot
;;;
;;; Exhausted (22):
;;;   - zoneminder-git (#6771): COMPLEX_DEPS: video surveillance with
;;;     ~12 missing Perl modules + PHP stack + gsoap + libvncserver;
;;;     A1: package 12+ Perl deps first — massive scope;
;;;     A2: PHP-FPM integration not available in Guix;
;;;     A3: Docker/container deployment recommended instead
;;;   - artemisrgb-git (#7285): NON_FREE_LICENSE: PolyForm Noncommercial
;;;     1.0.0; A1: license prohibits commercial use — violates FSDG;
;;;     A2: no FOSS alternative with same hardware support;
;;;     A3: OpenRGB (MIT license, already in Guix) covers similar use case
;;;   - canon-pixma-g6000-complete (#7753): PROPRIETARY_DRIVER: Canon
;;;     binary blobs repackaged from .deb; A1: license prohibits
;;;     redistribution; A2: requires lib32 compat (libpng12);
;;;     A3: use SANE generic driver or gutenprint where possible
;;;   - soh (#10971): NO_LICENSE: Ship of Harkinian has no license file;
;;;     reverse-engineered Nintendo copyrighted code; A1: no license
;;;     means all rights reserved; A2: Nintendo IP concerns prevent
;;;     distribution; A3: cannot be included in any Guix channel
;;;   - soh-otr-exporter (#10972): DEP_BLOCKED: depends on soh which
;;;     has no license; A1: same repo as soh with same legal issues;
;;;     A2: tool is useless without soh; A3: blocked by soh resolution
;;;   - meowpad-configurator-v2-git (#10989): TAURI_UNSUPPORTED: Tauri
;;;     desktop framework not packaged in Guix; A1: requires cargo-tauri
;;;     + pnpm + webkit2gtk Tauri pipeline; A2: no binary releases on
;;;     GitHub; A3: niche hardware configurator (2 AUR votes)
;;;   - nih-plug-git (#10763): NIGHTLY_RUST_REQUIRED: Rust audio plugin
;;;     framework requires cargo-nightly; A1: Guix ships stable Rust
;;;     only; A2: nightly features (abi_thiscall, portable_simd) have
;;;     no stable equivalents; A3: no tagged releases, git-only
;;;   - sparrow-wifi-git (#11090): UNMAINTAINED: WiFi analyzer marked
;;;     out-of-date in AUR; A1: missing python-pyqt5-chart + python-gps3
;;;     + python-manuf; A2: no tagged releases; A3: last AUR update 2023,
;;;     upstream appears inactive
;;;   - howdy-git (#11580): PAM_INTEGRATION_COMPLEX: facial auth PAM
;;;     module; A1: requires deep PAM/polkit system integration
;;;     incompatible with Guix functional model; A2: python-opencv
;;;     bindings need verification; A3: IR camera hardware dependency
;;;     makes testing infeasible
;;;   - graphite-editor-git (#7960): WASM_TOOLCHAIN_MISSING: Rust +
;;;     npm + wasm-pack build; A1: wasm-pack not in Guix; A2: Rust-to-
;;;     WASM compilation target not supported; A3: no versioned releases,
;;;     only rolling 'latest-stable' tag
;;;   - cynthiune.app (#10055): GNUSTEP_RUNTIME_MISSING: GNUstep music
;;;     player requires gnustep-base/gui/back; A1: only gnustep-make in
;;;     Guix, not the runtime; A2: project abandoned (orphaned in AUR,
;;;     out-of-date); A3: libao also missing from Guix
;;;   - wiso-steuer-2026 (#3733): PROPRIETARY_SOFTWARE: commercial German
;;;     tax software by Buhl; A1: proprietary license; A2: no source code
;;;     available; A3: cannot be distributed in free software channel
;;;   - playdate-sdk (#3814): PROPRIETARY_SDK: Panic Playdate console SDK;
;;;     A1: LicenseRef-SdkLicense is not a free software license;
;;;     A2: SDK binaries are proprietary; A3: hardware-specific tooling
;;;   - misans (#7786): NON_FREE_FONT: Xiaomi MiSans custom license;
;;;     A1: Xiaomi custom license restricts redistribution;
;;;     A2: font files are proprietary; A3: use Noto Sans as free
;;;     alternative
;;;   - python-tensorrt (#7026): PROPRIETARY_NVIDIA: NVIDIA TensorRT
;;;     requires proprietary license agreement; A1: LicenseRef-TensorRT
;;;     is not free; A2: requires CUDA stack; A3: no FOSS alternative
;;;     for TensorRT inference optimization
;;;   - classisland (#4652): WINDOWS_ONLY: .NET WPF Windows-only app for
;;;     classroom displays; A1: WPF is Windows-exclusive UI framework;
;;;     A2: no Linux port exists; A3: .NET SDK not in Guix regardless
;;;   - ollama-rocm-git (#4602): DEP_CHAIN_NEEDED: ROCm variant needs
;;;     base ollama packaged first; A1: ollama itself requires Go + CGo +
;;;     embedded llama.cpp build; A2: ROCm toolchain exists in Guix but
;;;     build integration is complex; A3: prebuilt binary possible but
;;;     needs ollama-bin as prerequisite
;;;   - mangowm-git (#11484): DEP_VERSION_PINNING: Wayland compositor
;;;     requires wlroots 0.19 + scenefx 0.4; A1: both deps now in Guix
;;;     but version pinning may break with Guix updates; A2: meson build
;;;     feasible but untested; A3: project has low adoption (3 AUR votes)
;;;   - qmc2 (#7015): BUILD_SYSTEM_CUSTOM: MAME frontend uses qmake +
;;;     custom Makefile hybrid; A1: Guix qmake support exists but custom
;;;     Makefile integration needs patching; A2: no Linux binary releases;
;;;     A3: MAME itself not in Guix (retroarch provides similar function)
;;;   - kretro (#7038): EARLY_PROJECT: KDE retro gaming frontend at v0.0.1;
;;;     A1: no binary releases; A2: requires full KDE6/Qt6 framework;
;;;     A3: too early for stable packaging (API/ABI will change)
;;;   - libretro-lrps2-git (#7270): DEP_MISSING: PS2 libretro core needs
;;;     rapidyaml not in Guix; A1: rapidyaml packaging required first;
;;;     A2: git-only with no tagged releases; A3: large C++ codebase with
;;;     PS2 emulation complexity
;;;   - sdrpp-brown-git (#10993): SDR_LIBS_MISSING: SDR++ fork needs
;;;     airspy/airspyhf/bladerf/hackrf/limesuite/soapysdr hardware libs;
;;;     A1: ~6 SDR hardware libraries need packaging; A2: rolling release
;;;     model complicates versioning; A3: original SDR++ might be better
;;;     first candidate
;;;
;;; All sha256 hashes obtained via `guix download`.

(define-module (gaurix packages recipe-resolver-260415n)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system cmake)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix utils)
  #:use-module (gnu packages boost)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages geo)
  #:use-module (gnu packages lua)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages xml)
  #:use-module (gnu packages oneapi)
  #:use-module (gnu packages protobuf)
  #:export (
            rustconn-bin
            uzdoom-bin
            polymc-bin
            slippi-mainline-bin
            libretro-azahar-core-bin
            osrm-backend
            ))

;;;
;;; --- 1. rustconn-bin ---
;;; Modern GTK4/Wayland-native connection manager for SSH, RDP, VNC.
;;; Resolves #11422 rustconn.
;;; Source: https://github.com/totoshko88/RustConn
;;;

(define-public rustconn-bin
  (package
    (name "rustconn-bin")
    (version "0.10.19")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/totoshko88/RustConn/releases/download/v"
                    version "/RustConn-" version "-x86_64.AppImage"))
              (sha256
               (base32
                "0jf3i748g8d55rb0gylsscw0dwjdvb1a0m7zfgsmifaahczjl2xc"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("rustconn" "bin/rustconn"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "rustconn")
              (chmod "rustconn" #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "connection manager for SSH, RDP, VNC, and cloud")
    (description
     "RustConn is a modern connection manager for Linux with a GTK4 and
Wayland-native interface.  It manages SSH, RDP, VNC, and cloud
connections with an organized sidebar, tabbed sessions, and built-in
terminal emulation via VTE.  This package provides the pre-built
AppImage binary.")
    (home-page "https://github.com/totoshko88/RustConn")
    (license license:gpl3+)))

;;;
;;; --- 2. uzdoom-bin ---
;;; Feature-centric Doom engine port based on GZDoom with advanced
;;; renderer and scripting.
;;; Resolves #1791 uzdoom.
;;; Source: https://github.com/UZDoom/UZDoom
;;;

(define-public uzdoom-bin
  (package
    (name "uzdoom-bin")
    (version "4.14.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/UZDoom/UZDoom/releases/download/"
                    version "/Linux-UZDoom-" version ".AppImage"))
              (sha256
               (base32
                "0rx18fx870jlykp23n1319p2376007vpkm5pfglgz98xjnmih2bs"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("uzdoom" "bin/uzdoom"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "uzdoom")
              (chmod "uzdoom" #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "feature-centric Doom source port based on GZDoom")
    (description
     "UZDoom is a Doom engine source port forked from GZDoom, featuring an
advanced OpenGL/Vulkan renderer, ZScript and DECORATE scripting,
UDMF map format support, and broad mod compatibility.  It supports
Doom, Doom II, Heretic, Hexen, Strife, and other id Tech 1 games.
This package provides the pre-built AppImage binary.")
    (home-page "https://github.com/UZDoom/UZDoom")
    (license license:gpl3+)))

;;;
;;; --- 3. polymc-bin ---
;;; Minecraft launcher with multi-instance management.
;;; Resolves #15619 polymc-qt5-git.
;;; Source: https://github.com/PolyMC/PolyMC
;;;

(define-public polymc-bin
  (package
    (name "polymc-bin")
    (version "7.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/PolyMC/PolyMC/releases/download/"
                    version "/PolyMC-Linux-Portable-" version ".tar.gz"))
              (sha256
               (base32
                "02milapmfcd9a5jqry7njnfi3ab7ikpvd5ig4niyyfspip7c6jlk"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("bin/polymc" "bin/")
          ("share" "share"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "Minecraft launcher with multi-instance management")
    (description
     "PolyMC is a Minecraft launcher focused on predictability, long-term
stability, and multi-instance management.  It allows installing and
managing multiple Minecraft versions, modloaders like Forge and Fabric,
and modpacks.  This package provides the pre-built portable binary.")
    (home-page "https://polymc.org")
    (license license:gpl3)))

;;;
;;; --- 4. slippi-mainline-bin ---
;;; Dolphin emulator fork with Slippi online netplay for Super Smash
;;; Bros. Melee.
;;; Resolves #11043 slippi-mainline.
;;; Source: https://github.com/project-slippi/dolphin
;;;

(define-public slippi-mainline-bin
  (package
    (name "slippi-mainline-bin")
    (version "4.0.0-mainline-beta.14")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/project-slippi/dolphin/releases/"
                    "download/v" version
                    "/Slippi_Netplay_Mainline-x86_64.AppImage"))
              (sha256
               (base32
                "1wq4p4qf490g1abwnbc7q638gn9dv17wwagcvfs1j9sg68ypl3il"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("slippi-dolphin" "bin/slippi-dolphin"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "slippi-dolphin")
              (chmod "slippi-dolphin" #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "Dolphin emulator fork with Slippi online netplay")
    (description
     "Slippi Mainline is a fork of the Dolphin GameCube and Wii emulator
with integrated Slippi online netplay for Super Smash Bros.  Melee.
It provides rollback netcode, replay recording, and matchmaking for
competitive online play.  This package provides the pre-built AppImage
binary.")
    (home-page "https://slippi.gg")
    (license license:gpl2+)))

;;;
;;; --- 5. libretro-azahar-core-bin ---
;;; Prebuilt Nintendo 3DS libretro core from the Azahar emulator
;;; (Citra fork).
;;; Resolves #11777 libretro-azahar-git (as prebuilt core).
;;; Source: https://github.com/azahar-emu/azahar
;;;

(define-public libretro-azahar-core-bin
  (package
    (name "libretro-azahar-core-bin")
    (version "2125.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/azahar-emu/azahar/releases/download/"
                    version "/azahar-libretro-linux-x86_64-" version ".zip"))
              (sha256
               (base32
                "1riihv4i97hfns7y5qaybyr2k6mvyaf41zy77ilrrif9q80rgap7"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("azahar_libretro.so" "lib/libretro/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "Nintendo 3DS libretro core based on Azahar emulator")
    (description
     "This package provides the pre-built Azahar libretro core for
Nintendo 3DS emulation.  Azahar is a fork of the Citra 3DS emulator,
providing hardware-accelerated 3DS emulation as a libretro core
compatible with RetroArch and other libretro frontends.  Supports
most commercial 3DS titles with OpenGL and Vulkan rendering.")
    (home-page "https://azahar-emu.org")
    (license license:gpl2+)))

;;;
;;; --- 6. osrm-backend ---
;;; High-performance routing engine for OpenStreetMap data.
;;; Resolves #10226 osrm-backend.
;;; Source: https://github.com/Project-OSRM/osrm-backend
;;;

(define-public osrm-backend
  (package
    (name "osrm-backend")
    (version "6.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Project-OSRM/osrm-backend/archive/"
                    "refs/tags/v" version ".tar.gz"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0c9hck1gdjc0bsp2hzcbhwcfcmpq3sbcw8y6803n0h805ikr549n"))))
    (build-system cmake-build-system)
    (arguments
     (list
      #:tests? #f                         ;tests require OSM data fixtures
      #:configure-flags
      #~(list "-DENABLE_LTO=OFF")))
    (inputs
     (list boost
           bzip2
           expat
           libosmium
           libxml2
           libzip
           lua
           openssl
           onetbb
           protozero
           zlib))
    (synopsis "high-performance routing engine for OpenStreetMap")
    (description
     "OSRM (Open Source Routing Machine) is a high-performance routing
engine for shortest paths in road networks.  It uses OpenStreetMap data
to compute driving, walking, and cycling routes with sub-second query
times.  The backend provides HTTP and C++ APIs for route computation,
table queries, map matching, trip optimization, and nearest-neighbor
lookups.")
    (home-page "https://project-osrm.org")
    (license license:bsd-2)))
