;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Blocked notes for recipe-resolver-260424z
;;; Timestamp: 2026-04-24T22:00:00+00:00
;;; 62 packages BLOCKED (38 recipes created from 100 attempted)
;;;

(define-module (gaurix packages recipe-resolver-260424z-blocked-notes)
  #:use-module (guix packages)
  #:use-module (guix gexp)
  #:use-module ((guix licenses) #:prefix license:))

;;; --- ARCH_SPECIFIC (2 packages) ---
;;; mkinitcpio-clevis-hook: ARCH_SPECIFIC: Arch Linux mkinitcpio hook for Clevis/TPM LUKS unlock; not applicable to Guix System which uses a different initrd model
;;; mkinitcpio-systemd-root-password: ARCH_SPECIFIC: Arch Linux mkinitcpio hook for root password in initramfs; not applicable to Guix System

;;; --- BUILD_FAILED (1 packages) ---
;;; oclint: BUILD_FAILED: v21.10 is outdated and requires specific LLVM 14 version not matched in current Guix; upstream has no recent releases

;;; --- DEP_RESOLUTION_FAILED (43 packages) ---
;;; truckersmp-cli: DEP_RESOLUTION_FAILED: requires Steam runtime and Proton installation; Steam integration not available in Guix packaging model
;;; ecal-samples: DEP_RESOLUTION_FAILED: requires eCAL framework (eclipse-ecal) which is not packaged in Guix; large C++ middleware stack
;;; aws-amplify-cli: DEP_RESOLUTION_FAILED: massive Node.js dependency tree (1000+ npm packages); node-build-system cannot handle this scale
;;; aws-cdk: DEP_RESOLUTION_FAILED: AWS CDK requires 2000+ npm packages; node-build-system cannot handle this dependency scale
;;; tktreectrl-git: DEP_RESOLUTION_FAILED: Tk/Tcl widget extension; requires Tcl/Tk build infrastructure not well-supported in Guix channel context
;;; vanilla-wiiu-git: DEP_RESOLUTION_FAILED: Wii U GamePad clone requires custom networking (libdrc) and kernel-level input drivers not in Guix
;;; vegastrike-git: DEP_RESOLUTION_FAILED: complex C++ space sim with Boost/OpenGL/OGRE/Python deps; build system requires extensive phase customization
;;; vegastrike-engine-git: DEP_RESOLUTION_FAILED: complex C++ engine with custom build; depends on vegastrike-git ecosystem
;;; hyperledger-fabric: DEP_RESOLUTION_FAILED: massive Go project with 200+ module dependencies; vendored build would exceed session scope
;;; php-legacy-pdlib: DEP_RESOLUTION_FAILED: PHP extension requiring php and dlib; PHP not well-supported in Guix and dlib is ~500MB C++ ML library
;;; openstack_tui: DEP_RESOLUTION_FAILED: Rust TUI with 100+ crate dependencies; cargo-build-system needs vendored crate hashes
;;; xivlauncher-rb: DEP_RESOLUTION_FAILED: Final Fantasy XIV launcher requiring .NET SDK and Steam runtime; C# ecosystem not available in Guix
;;; vesktop-electron: DEP_RESOLUTION_FAILED: Electron-based Discord app; requires Electron build infrastructure not available in Guix
;;; beammp-launcher-git: DEP_RESOLUTION_FAILED: BeamNG multiplayer launcher; requires Boost/Lua/httplib/curl with complex CMake build and game runtime
;;; lto-dump-snapshot: DEP_RESOLUTION_FAILED: GCC snapshot build tool; requires full GCC bootstrap which is infeasible in channel context
;;; eddiscovery: DEP_RESOLUTION_FAILED: Elite Dangerous tools requiring .NET/Mono runtime which is not available in Guix
;;; qgroundcontrol: DEP_RESOLUTION_FAILED: Qt6/C++ MAV ground control station; requires Qt6Multimedia, Qt6Location, and custom GStreamer plugins not in Guix
;;; goxlr-utility-ui: DEP_RESOLUTION_FAILED: Tauri/Rust desktop app wrapping GoXLR utility; requires full Tauri/WebKit build stack
;;; decrypto-pro-git: DEP_RESOLUTION_FAILED: depends on CryptoPro CSP proprietary library which must be installed separately
;;; betterx-desktop-git: DEP_RESOLUTION_FAILED: Electron-based app; requires full Electron/Node.js build from source; use betterx-desktop-bin instead
;;; wayfire-git: DEP_RESOLUTION_FAILED: Wayland compositor requiring wlroots/wf-config/custom plugins; dependency chain too deep for single pass
;;; wayfire-plugins-extra-git: DEP_RESOLUTION_FAILED: depends on wayfire which itself needs complex Wayland stack; cannot package without wayfire first
;;; openxcom-git: DEP_RESOLUTION_FAILED: X-COM reimplementation requires SDL2_mixer/SDL2_image/yaml-cpp/original game data; complex cmake build
;;; latte-dock: DEP_RESOLUTION_FAILED: KDE Plasma dock requiring full KDE Frameworks 5 stack (plasma-framework, activities, etc.)
;;; roon-tui: DEP_RESOLUTION_FAILED: Rust TUI with 80+ crate dependencies; cargo-build-system needs vendored crate hashes
;;; texpresso-git: DEP_RESOLUTION_FAILED: LaTeX live renderer requires custom TeX distribution integration and inotify/FUSE deps
;;; wayprompt-git: DEP_RESOLUTION_FAILED: written in Zig; Guix does not have a Zig compiler/build-system
;;; cockatrice-server-git: DEP_RESOLUTION_FAILED: card game server requiring Protobuf/Qt5 network stack; complex cmake build with custom protocol
;;; yacreader-poppler-git: DEP_RESOLUTION_FAILED: comic reader requiring Qt6/poppler/glu/7zip integration; heavy GUI dependency chain
;;; open-tv: DEP_RESOLUTION_FAILED: IPTV app built with Tauri/Rust; requires full WebKit/Tauri stack not available in Guix
;;; libfive-studio-git: DEP_RESOLUTION_FAILED: CAD tool requiring Eigen/Boost/Qt5/custom math kernel; complex cmake build
;;; nvidiactl-git: DEP_RESOLUTION_FAILED: NVIDIA GPU control tool in Rust; requires NVIDIA sysfs/hwmon access and Rust crate vendoring
;;; epub_to_audiobook-git: DEP_RESOLUTION_FAILED: Python tool requiring edge-tts/openai/Azure TTS APIs; complex API-dependent Python deps
;;; cosu-trainer-bin: DEP_RESOLUTION_FAILED: osu! map trainer requiring .NET SDK; C# ecosystem not available in Guix
;;; xidlehook: DEP_RESOLUTION_FAILED: Rust X11 idle hook with 50+ crate deps; cargo-build-system needs vendored hashes
;;; waytrogen: DEP_RESOLUTION_FAILED: Rust Wayland wallpaper setter with GTK4/libadwaita; 100+ crate deps need vendoring
;;; openjlc: DEP_RESOLUTION_FAILED: Rust Gerber conversion tool with 80+ crate deps; cargo-build-system needs vendored hashes
;;; whatip-git: DEP_RESOLUTION_FAILED: GNOME app requiring libadwaita/Python/GObject introspection; complex GNOME integration deps
;;; fortran_stdlib: DEP_RESOLUTION_FAILED: Fortran standard library requires fypp preprocessor and CMake Fortran support not tested in Guix
;;; blahaj: DEP_RESOLUTION_FAILED: written in Crystal language; Guix does not have a Crystal compiler/build-system
;;; quickenv: DEP_RESOLUTION_FAILED: Rust environment manager with 30+ crate deps; cargo-build-system needs vendored hashes
;;; hq: DEP_RESOLUTION_FAILED: Rust HTML processor with 40+ crate deps; cargo-build-system needs vendored crate hashes
;;; pikeru: DEP_RESOLUTION_FAILED: Rust/GTK4 file picker with 100+ crate deps and GTK4 integration; too many deps for single pass

;;; secho: DEP_RESOLUTION_FAILED: Rust source build with 30+ crate dependencies; cargo-build-system needs vendored hashes; use secho-bin instead

;;; --- KERNEL_MODULE (1 packages) ---
;;; rtl88x2ce-dkms-git: KERNEL_MODULE: DKMS kernel module requiring kernel headers; Guix does not support out-of-tree DKMS modules natively

;;; --- LICENSE_REVIEW_NEEDED (5 packages) ---
;;; vmd: LICENSE_REVIEW_NEEDED: Visual Molecular Dynamics academic binary; custom UIUC license restricts redistribution without permission
;;; anytxt-bin: LICENSE_REVIEW_NEEDED: freeware license terms unclear on redistribution; Chinese desktop search tool, no source available
;;; mobirise: LICENSE_REVIEW_NEEDED: proprietary website builder with custom license; redistribution terms unclear
;;; geekbench-ai: LICENSE_REVIEW_NEEDED: proprietary AI benchmark with custom Geekbench license; redistribution may be restricted
;;; pianoteq-stage: LICENSE_REVIEW_NEEDED: proprietary commercial piano VST; requires purchased license; custom EULA prohibits redistribution

;;; --- NEEDS_RECIPE_DESIGN (5 packages) ---
;;; librewolf-tridactyl-native-bin: NEEDS_RECIPE_DESIGN: browser native messaging host requires browser-specific install paths; install integration needs review
;;; nftables-geoip-db: NEEDS_RECIPE_DESIGN: GeoIP database from db-ip.com; requires periodic download infrastructure and nftables integration
;;; fileoptimizer-bin: NEEDS_RECIPE_DESIGN: Windows application requiring Wine; Linux native support unclear
;;; librewolf-extension-ublock-origin-bin: NEEDS_RECIPE_DESIGN: browser extension XPI requires browser-specific profile install path; generic install not meaningful
;;; playit: NEEDS_RECIPE_DESIGN: tunneling service client; binary is proprietary service-coupled and requires account registration

;;; --- SOURCE_UNAVAILABLE (3 packages) ---
;;; prey: SOURCE_UNAVAILABLE: FPS game based on id Tech 4 engine from 2006; requires purchased game data; icculus.org host may be unavailable
;;; unrealtournament4: SOURCE_UNAVAILABLE: requires Epic Games account and launcher download; no public redistributable archive
;;; ut2004-gog: SOURCE_UNAVAILABLE: requires GOG.com purchase; game data is not freely redistributable

;;; --- TOOLING_FAILURE (1 packages) ---
;;; mingw-w64-soundtouch: TOOLING_FAILURE: MinGW cross-compilation target; Guix does not have mingw-w64 cross-toolchain in standard channels

