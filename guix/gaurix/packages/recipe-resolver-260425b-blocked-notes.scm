;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Blocked notes for recipe-resolver-260425b
;;; Timestamp: 2026-04-25T12:00:00+00:00
;;; 64 packages BLOCKED (36 recipes created from 100 attempted)
;;;

(define-module (gaurix packages recipe-resolver-260425b-blocked-notes)
  #:use-module (guix packages)
  #:use-module (guix gexp)
  #:use-module ((guix licenses) #:prefix license:))

;;; --- TOOLING_FAILURE (16 packages) ---
;;; amneziawg-linux-hardened: TOOLING_FAILURE: DKMS kernel module for AmneziaWG VPN; Guix uses its own kernel module model incompatible with DKMS; next: requires Guix kernel customization approach
;;; mingw-w64-libopenmpt: TOOLING_FAILURE: MinGW-w64 cross-compilation target library; Guix does not support Windows cross-compilation toolchains; next: not applicable to Guix
;;; pfring-dkms: TOOLING_FAILURE: PF_RING DKMS kernel module for high-speed packet processing; Guix kernel model does not support DKMS; next: would need custom kernel config
;;; locale-mul_zz: TOOLING_FAILURE: custom locale generation (multi-locale UTF-8/ISO 8601); locale generation is system-level in Guix, not packageable as a channel package; next: configure via Guix system locale settings
;;; linux-xanmod-lts-headers: TOOLING_FAILURE: custom kernel headers for Xanmod LTS kernel variant; Guix manages kernels through its own kernel package infrastructure; next: define custom kernel package
;;; amneziawg-linux: TOOLING_FAILURE: DKMS kernel module for AmneziaWG VPN; same as amneziawg-linux-hardened, DKMS incompatible with Guix; next: requires kernel customization
;;; nvidia-390xx-settings: TOOLING_FAILURE: NVIDIA 390xx legacy driver settings tool; requires proprietary NVIDIA kernel module and driver stack not supported in Guix channel model; next: use Guix nonguix channel for NVIDIA support
;;; r8126-dkms: TOOLING_FAILURE: Realtek RTL8126 DKMS kernel module; DKMS incompatible with Guix kernel model; next: would need custom kernel module package
;;; linux-keep-modules: TOOLING_FAILURE: Arch Linux pacman hook to preserve kernel modules during upgrade; Guix uses atomic system generations, not applicable; next: not needed in Guix
;;; linux-sched-ext-git-headers: TOOLING_FAILURE: custom kernel headers for sched_ext branch kernel; Guix manages kernels separately; next: define custom kernel package
;;; linux-cachyos-bmq-headers: TOOLING_FAILURE: custom kernel headers for CachyOS BMQ scheduler kernel; Guix manages kernels separately; next: define custom kernel package
;;; sudo-selinux: TOOLING_FAILURE: SELinux-enabled sudo; Guix does not use SELinux mandatory access control; next: not applicable to Guix
;;; linux-next-git-headers: TOOLING_FAILURE: bleeding-edge linux-next kernel headers; Guix manages kernels separately; next: define custom kernel package
;;; php83-mcrypt: TOOLING_FAILURE: PHP 8.3 mcrypt extension binding; mcrypt is deprecated (libmcrypt unmaintained since 2007), PHP extensions require exact PHP version binding not well-supported in Guix channels; next: use php-sodium instead
;;; system-age: TOOLING_FAILURE: Arch Linux-specific tool that reads pacman install timestamps; relies on /var/log/pacman.log which does not exist on Guix; next: not applicable to Guix System
;;; vivaldi-autoinject-custom-js-ui: TOOLING_FAILURE: Vivaldi browser modification tool; requires specific Vivaldi installation paths and modifies browser internals; next: browser-specific hook not packageable generically

;;; --- DEP_RESOLUTION_FAILED (37 packages) ---
;;; java-language-server: DEP_RESOLUTION_FAILED: Java LSP server requiring Java compiler API (tools.jar) + LSP4J + protocol-impl; complex Maven/Gradle build with 50+ Java dependencies; next: package Java LSP4J ecosystem first
;;; nginx-mainline-mod-njs: DEP_RESOLUTION_FAILED: njs module for nginx mainline; must be compiled against exact nginx source version with matching configure flags; next: package as nginx module variant
;;; musique: DEP_RESOLUTION_FAILED: Qt-based music player requiring Phonon/Qt5 multimedia + taglib + network stack; deep Qt dependency chain; next: ensure Phonon + multimedia backend available
;;; obs-plugin-input-overlay-git: DEP_RESOLUTION_FAILED: OBS Studio plugin requiring OBS SDK headers + libuiohook + Qt5 matching OBS version; next: package libuiohook first
;;; synfigstudio-dev: DEP_RESOLUTION_FAILED: vector animation GUI requiring synfig-core + ETL + MLT + GTKmm + intltool; 30+ direct dependencies in development branch; next: package synfig-core and ETL first
;;; synfig-dev: DEP_RESOLUTION_FAILED: vector animation CLI renderer requiring ETL + Magick++ + pango + cairomm + sigc++ in development branch; next: package ETL (synfig's template library) first
;;; gst-plugins-rs-git: DEP_RESOLUTION_FAILED: GStreamer Rust plugins requiring GStreamer SDK + 200+ Rust crate dependencies; complex C/Rust interop build; next: requires vendored crate manifest
;;; atuin-lily-git: DEP_RESOLUTION_FAILED: lilydjwg fork of atuin shell history; Rust project with 100+ crate dependencies requiring vendored crate hashes; next: generate Cargo.lock vendored manifest
;;; hnefatafl-copenhagen: DEP_RESOLUTION_FAILED: Copenhagen Hnefatafl game client; Rust with custom game engine crate dependencies; next: requires vendored crate manifest
;;; git-who: DEP_RESOLUTION_FAILED: Git blame for file trees; Rust tool with libgit2-sys and 40+ crate dependencies; next: requires vendored crate manifest
;;; ddpolymerase: DEP_RESOLUTION_FAILED: file copy/repair/verify tool; Rust with 30+ crate dependencies; next: requires vendored crate manifest
;;; btop-no-gpu: DEP_RESOLUTION_FAILED: btop++ fork with GPU disabled; cmake C++ build requiring specific compile flags to disable GPU, plus fmt/ranges headers; next: could be a variant of btop package with GPU flags disabled
;;; nheko-scrollfix: DEP_RESOLUTION_FAILED: patched nheko Matrix client; Qt6/C++ application with 50+ dependencies (mtxclient, olm, cmark, lmdb, spdlog, etc.); next: package mtxclient and matrix dependencies first
;;; nfuspire-git: DEP_RESOLUTION_FAILED: Nspire FUSE filesystem; requires libticalcs, libticables, libtfiles (TI calculator libraries) not packaged in Guix; next: package TI calculator library stack
;;; beignet-git: DEP_RESOLUTION_FAILED: Intel IvyBridge/Haswell OpenCL; abandoned upstream, requires LLVM 3.x-14 specific version binding; modern LLVM incompatible; next: not feasible with current LLVM
;;; firetools-git: DEP_RESOLUTION_FAILED: Firejail GUI; Qt5 application requiring firejail headers, custom sandboxing integration, and DBus service configuration; next: package firejail first, then firetools
;;; osmtogeojson: DEP_RESOLUTION_FAILED: OSM to GeoJSON converter; Node.js package with npm dependency tree; node-build-system requires packaging each npm dependency individually; next: package npm dependencies
;;; plank-reloaded-docklet-picky-git: DEP_RESOLUTION_FAILED: color picker docklet for Plank Reloaded dock; requires Plank development libraries + Vala compiler + custom dock API; next: package Plank Reloaded first
;;; sommelier-git: DEP_RESOLUTION_FAILED: nested Wayland compositor with X11 forwarding (from ChromeOS); requires Wayland protocols + X11 forwarding infrastructure + custom protocol extensions; next: complex Wayland/X11 bridge
;;; tablet-switch-git: DEP_RESOLUTION_FAILED: 2-in-1 laptop mode switcher; requires custom DBus integration + systemd user service + specific input device APIs; next: package input device detection library
;;; wl-binclock: DEP_RESOLUTION_FAILED: binary clock for Wayland in Rust; requires wayland-client, wayland-protocols, and 30+ Rust crate dependencies; next: requires vendored crate manifest
;;; vivify: DEP_RESOLUTION_FAILED: Markdown preview tool in Rust; requires 60+ Rust crate dependencies including terminal rendering and markdown parsing; next: requires vendored crate manifest
;;; to-html: DEP_RESOLUTION_FAILED: terminal ANSI to HTML renderer in Rust; requires 20+ Rust crate dependencies; next: requires vendored crate manifest
;;; prs: DEP_RESOLUTION_FAILED: password manager CLI using GPG and git; Rust with 80+ crate dependencies + GPG integration + git2-rs; next: requires vendored crate manifest
;;; lcd4linux-git: DEP_RESOLUTION_FAILED: LCD information display daemon; requires 15+ display driver libraries (usb, dpf, picolcd, etc.) most not in Guix; next: package display driver dependencies
;;; opkssh-git: DEP_RESOLUTION_FAILED: OpenPubkey SSH in Go; 50+ Go module dependencies including OIDC/JWT libraries; next: requires go module vendoring
;;; opkssh: DEP_RESOLUTION_FAILED: same as opkssh-git; Go project with extensive module dependencies; next: requires go module vendoring
;;; hypraway: DEP_RESOLUTION_FAILED: Hyprland auto-lock tool; requires Hyprland IPC headers and runtime, which is not in Guix; next: package Hyprland ecosystem first
;;; llama.cpp-git: DEP_RESOLUTION_FAILED: LLaMA C++ inference; complex cmake build with optional BLAS/CUDA/Metal/Vulkan backends, 50+ source files with specific SIMD requirements; next: start with CPU-only build, disable all GPU backends
;;; gql: DEP_RESOLUTION_FAILED: Git Query Language in Rust; 50+ crate dependencies including gitoxide/git2; next: requires vendored crate manifest
;;; mergiraf-git: DEP_RESOLUTION_FAILED: syntax-aware git merge driver in Rust; 40+ crate dependencies including tree-sitter parsers; next: requires vendored crate manifest
;;; qlipmon: DEP_RESOLUTION_FAILED: clipboard manager with rofi plugin; Rust/C hybrid requiring X11/Wayland clipboard APIs + rofi plugin API + DBus; next: requires vendored crate manifest + rofi-dev
;;; picom-ftlabs-git: DEP_RESOLUTION_FAILED: picom fork with animations by FT-Labs; requires libev + pcre2 + libconfig + xcb-* + pixman + Mesa/EGL; overlapping with but divergent from upstream picom; next: use upstream picom or package all animation deps
;;; lightlyshaders-git: DEP_RESOLUTION_FAILED: KDE KWin effect plugin for rounded corners; requires full KDE Frameworks 5 development stack (kwin-dev, kconfigwidgets, etc.); next: too deep into KDE stack for channel
;;; teb-obs: DEP_RESOLUTION_FAILED: OBS Studio fork with browser source but without ffmpeg-obs; requires OBS source build infrastructure + CEF (Chromium Embedded Framework); next: complex build requiring OBS + CEF
;;; openpace-git: DEP_RESOLUTION_FAILED: OpenPACE EAC crypto library; requires OpenSSL 3.0 development headers with specific EAC extensions; autotools build with custom m4 macros; next: verify OpenSSL 3.0 EAC support
;;; rm-improved: DEP_RESOLUTION_FAILED: safer rm alternative (rip) in Rust; 20+ crate dependencies; next: requires vendored crate manifest

;;; --- SOURCE_UNAVAILABLE (6 packages) ---
;;; xeme-hg: SOURCE_UNAVAILABLE: XMPP parsing library with Mercurial-only source (no git mirror); hg-fetch could work but upstream appears abandoned (last commit 2010s); next: verify if upstream still exists
;;; luniistore: SOURCE_UNAVAILABLE: Lunii storyteller device manager; proprietary application with no stable public download URL; binary distributed via vendor website with authentication; next: requires vendor account and stable URL
;;; unpack-install-jammer: SOURCE_UNAVAILABLE: tool to extract Install Jammer installers; orphaned project with no maintained source repository; original InstallJammer project defunct; next: find archived source
;;; simplicity-commander: SOURCE_UNAVAILABLE: Silicon Labs device debug GUI; proprietary tool requiring Silicon Labs SDK and account for download; no public stable URL; next: requires vendor SDK access
;;; python-jaxlib-bin: SOURCE_UNAVAILABLE: JAX XLA library binary; platform-specific wheel requiring CUDA/TPU runtime matching; Google does not provide stable versioned Linux binary tarballs; next: use pip/wheel installation instead
;;; receitanet: SOURCE_UNAVAILABLE: Brazilian federal tax filing program; proprietary Java app from Receita Federal; download requires CAPTCHA and changes yearly; next: unstable source, yearly version changes

;;; --- NEEDS_RECIPE_DESIGN (5 packages) ---
;;; gnome-shell-extension-status-area-horizontal-spacing-git: NEEDS_RECIPE_DESIGN: (redirected to recipe as gnome-shell-extension-status-area-horizontal-spacing)
;;; sipgate-app-clinq: NEEDS_RECIPE_DESIGN: proprietary VoIP telephony Electron app; requires specific Electron version + node-pty + WebRTC runtime; complex phone system integration; next: evaluate if AppImage/binary available
;;; knossu: NEEDS_RECIPE_DESIGN: Doom-like non-euclidean horror game; custom C++ game engine with SDL2 + OpenGL + specific math libraries for non-euclidean geometry rendering; next: evaluate build system and dependencies
;;; python-gradio-pdf: NEEDS_RECIPE_DESIGN: Gradio PDF display extension; requires gradio framework (massive Python dependency tree with 100+ packages); next: package gradio ecosystem first
;;; python-materialyoucolor-git: NEEDS_RECIPE_DESIGN: Material You color algorithms for Python; git-only source with custom build, requires Pillow + numpy + specific color science deps; next: evaluate PyPI availability
;;; ruby-ruby-vips: NEEDS_RECIPE_DESIGN: Ruby extension for libvips image processing; requires libvips development headers + Ruby native extension build system + FFI bindings; next: verify libvips in Guix, then package Ruby gem
;;; android-sdk-build-tools-34: (redirected to recipe — proprietary binary packaging allowed per policy)
;;; intel-opencl-runtime: (redirected to recipe — proprietary binary packaging allowed per policy)

;;; --- End of blocked notes ---
