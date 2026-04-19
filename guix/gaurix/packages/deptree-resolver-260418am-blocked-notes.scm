;;; Notes for deptree-resolver-260418am
;;; 12 packages moved to FAILED status
;;; 4 packages resolved with recipes
;;;
;;; === FAILED packages (approaches exhausted) ===
;;; bbg (#16759): DEP_RESOLUTION_FAILED: Electron-based static blog generator with no build instructions; Electron not available in Guix; project appears minimally maintained
;;;   Approaches: A1: build from source — requires Electron which is not in Guix; A2: binary package — no releases on GitHub; A3: use alternatives (Hugo, Jekyll, Pelican) — already available in Guix
;;; garnet (#16724): DEP_MISSING: requires dotnet-sdk-9.0 which is not bootstrapped in Guix; .NET runtime packaging is a known gap in Guix ecosystem
;;;   Approaches: A1: package .NET SDK — massive ecosystem bootstrap (CoreCLR, Roslyn compiler, NuGet); A2: pre-built binary — no standalone Linux binary releases for Garnet; A3: use alternative cache stores (Redis, Memcached) — already packaged in Guix
;;; scpdiscord-git (#16818): DEP_MISSING: requires dotnet-sdk-9.0 for building; .NET SDK not available in Guix; SCP:SL game plugin ecosystem
;;;   Approaches: A1: package .NET SDK — not bootstrapped in Guix; A2: pre-built binary — no standalone binaries available; A3: run via container — not native Guix packaging
;;; python-gurobipy (#16815): PROPRIETARY_DEP: requires gurobi>=13.0.1 (commercial optimization solver) as runtime dependency; Gurobi requires paid license and EULA acceptance
;;;   Approaches: A1: package gurobi — proprietary commercial software with EULA; A2: binary wheel — still needs proprietary gurobi shared library at runtime; A3: use open alternatives (scipy.optimize, PuLP with GLPK, OR-Tools) — different tools
;;; tuxedo-keyboard-tools (#16809): KERNEL_MODULE: depends on tuxedo-keyboard-dkms (out-of-tree kernel module) and libxss; kernel module not packageable via standard Guix mechanisms
;;;   Approaches: A1: package tuxedo-keyboard-dkms — DKMS not supported in Guix packaging model; A2: port to operating-system config — requires kernel module integration work; A3: use generic keyboard tools — available in Guix
;;; clipboard-manager-git (#16885): DEP_MISSING: depends on cosmic-applets (COSMIC desktop environment by System76) which is not packaged in Guix; entire COSMIC desktop stack required
;;;   Approaches: A1: package COSMIC desktop — entire Rust-based desktop environment; A2: build standalone — tightly coupled to COSMIC applet infrastructure; A3: use alternatives (clipman, copyq, parcellite) — available in Guix
;;; tuxedo-backlight-control-git (#16767): KERNEL_MODULE: depends on tuxedo-keyboard (out-of-tree DKMS kernel module); Guix handles kernel modules via operating-system config, not DKMS; the userspace tools are unusable without the kernel module
;;;   Approaches: A1: package tuxedo-keyboard — out-of-tree kernel module requires DKMS or operating-system kernel config; A2: package userspace only — tools fail without kernel module; A3: use generic backlight tools (xbacklight, light) — available in Guix
;;; opencomic (#16827): DEP_RESOLUTION_FAILED: depends on electron37 (obsolete Electron version, not available in any distro) and java-runtime with complex nvm-based build
;;;   Approaches: A1: build with current Electron — code depends on electron37-specific APIs; A2: binary package — no releases available; A3: use alternatives (MComix, Calibre) — available in Guix
;;; yesplaymusic-git (#16835): DEP_RESOLUTION_FAILED: depends on electron13 (obsolete, EOL 2022) and requires nvm/yarn build toolchain; Netease Music service may not be accessible outside China
;;;   Approaches: A1: build from source — electron13 obsolete, not in Guix; A2: upgrade to modern Electron — upstream not maintained for 2+ years; A3: use alternatives (QMMP, Clementine) — available in Guix
;;; adbmanager (#16706): DEP_MISSING: requires Lazarus (Free Pascal IDE/RAD) to build; Lazarus compiler not available in Guix and no binary releases exist
;;;   Approaches: A1: package Lazarus/FPC — massive Pascal IDE ecosystem, no Guix build system support; A2: pre-built binary — no releases available on GitHub or AUR; A3: alternative ADB tools — adb itself available in Guix, GUI wrappers are niche
;;; companion (#16720): DEP_RESOLUTION_FAILED: Electron app requiring nvm for Node.js version management, complex native USB addon compilation (libusb bindings), and zip-based asset bundling
;;;   Approaches: A1: build from source with node-build-system — native USB bindings need complex compilation with node-gyp and specific Node.js version; A2: binary package — large Electron app (~200MB), no official Linux binary releases; A3: use alternative Streamdeck tools — very specific Elgato hardware, no open alternatives
;;; comictagger-beta (#16899): DEP_RESOLUTION_FAILED: requires 8+ Python packages not in Guix (python-comicfn2dict, python-niquests, python-settngs, python-pyrate-limiter-2, python-text2digits, python-wordninja, python-zipremove, python-pillow-jpegxl-plugin); deep dependency chain makes single-pass resolution infeasible
;;;   Approaches: A1: package all 8+ missing Python deps — each has its own dep chain, some require C extensions (pillow-jpegxl needs libjxl); A2: use pip in virtual env — not native Guix packaging model; A3: use stable comictagger release — also has same dependency requirements
