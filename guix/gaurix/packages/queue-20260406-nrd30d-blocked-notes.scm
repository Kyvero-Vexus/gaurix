;;; Blocked-notes for queue-20260406-nrd30d pass.
;;; 23 packages re-blocked with specific reasons after research.
;;;
;;; Re-blocked categories:
;;; - PROPRIETARY (3): connectiq-sdk-manager, hubstaff, thedude
;;; - NON_FREE_LICENSE (1): fallout1-ce-game
;;; - RUST_CARGO_DEPS (4): radicle-node-git, opencl-vanity-gpg, konfigkoll, konfigkoll-git
;;; - NPM_ECOSYSTEM (4): radicle-explorer, radicle-explorer-git, sillytavern, nodejs-markdown-toc
;;; - ELECTRON_COMPLEX (1): element-desktop-git
;;; - RUST_PLUS_RADICLE_DEP (1): radicle-httpd-git
;;; - TAURI_COMPLEX (1): oneclient-bin
;;; - DKMS_INCOMPATIBLE (1): kernelsu-dkms
;;; - CROSS_COMPILE_NICHE (1): mingw-w64-zlib-ng
;;; - SYSTEM_CONFIG_NOT_PKG (1): minisforum-v3-pcie-aspm-config
;;; - UNCLEAR_LICENSE (2): fluidplug-git, hunspell-ja-git
;;; - DOTNET_ECOSYSTEM (1): subs2srs-gtk3-git
;;; - PROPRIETARY_COMMERCIAL (1): burpsuite-pro

(define-module (gaurix packages queue-20260406-nrd30d-blocked-notes))

;;; 3348. radicle-node-git — BLOCKED: RUST_CARGO_DEPS.
;;; Rust/Cargo project (github.com/radicle-dev/heartwood). Requires full cargo
;;; dependency vendoring (80+ transitive deps). Apache-2.0/MIT licensed but
;;; build complexity exceeds batch capacity.

;;; 3351. connectiq-sdk-manager — BLOCKED: PROPRIETARY.
;;; Garmin Connect IQ SDK Manager. Proprietary binary from developer.garmin.com.
;;; No source code available. Custom Garmin license.

;;; 3352. fluidplug-git — BLOCKED: UNCLEAR_LICENSE.
;;; FluidPlug (github.com/falkTX/FluidPlug): SoundFont-to-LV2 plugin bridge.
;;; No LICENSE file in repository. PKGBUILD lists "CCPL" but actual license
;;; is unclear. No tagged releases. Cannot package without clear license.

;;; 3353. hunspell-ja-git — BLOCKED: UNCLEAR_LICENSE.
;;; Japanese Hunspell dictionary (github.com/Ajatt-Tools/hunspell-ja).
;;; README used as license placeholder; no actual license file. Data-only
;;; package but unclear redistribution terms.

;;; 3355. gnome-shell-extension-all-in-one-clipboard-bin — DONE (recipe above).

;;; 3356. hubstaff — BLOCKED: PROPRIETARY.
;;; Employee time tracking software (app.hubstaff.com). Proprietary commercial
;;; SaaS product. Binary-only installer, no source. Requires paid license.

;;; 3358. kernelsu-dkms — BLOCKED: DKMS_INCOMPATIBLE.
;;; KernelSU DKMS module (github.com/supechicken/KernelSU fork for Waydroid).
;;; DKMS kernel modules are incompatible with Guix kernel packaging model.
;;; Requires building against specific kernel version at install time.

;;; 3361. libtar-twrp-git — DONE (recipe above).

;;; 3363. mingw-w64-zlib-ng — BLOCKED: CROSS_COMPILE_NICHE.
;;; zlib-ng cross-compiled for Windows via mingw-w64. Niche cross-compilation
;;; target package. Guix supports cross-compilation but this is a Windows-only
;;; library variant with minimal Linux utility.

;;; 3364. minisforum-v3-pcie-aspm-config — BLOCKED: SYSTEM_CONFIG_NOT_PKG.
;;; Hardware-specific kernel cmdline + udev rules for Minisforum V3 tablet.
;;; In Guix, this should be handled via operating-system kernel-arguments and
;;; udev-rules-service, not as a package.

;;; 3365. oneclient-bin — BLOCKED: TAURI_COMPLEX.
;;; OneLauncher Minecraft launcher (github.com/Polyfrost/OneLauncher).
;;; Tauri app (Rust+TypeScript) with complex dual-ecosystem build requirements.
;;; No standalone binary release suitable for direct packaging.

;;; 3366. onscripter-yuri-bin — DONE (recipe above).

;;; 3367. opencl-vanity-gpg — BLOCKED: RUST_CARGO_DEPS.
;;; GPU-accelerated vanity PGP key generator (github.com/TransparentLC/opencl_vanity_gpg).
;;; Rust/Cargo build with OpenCL dependency. Requires full cargo dependency
;;; vendoring. AGPL-3.0 licensed.

;;; 3370. radicle-explorer — BLOCKED: NPM_ECOSYSTEM.
;;; Radicle web frontend (radicle.xyz). TypeScript/pnpm/Vite web app with
;;; large npm dependency tree. Guix lacks efficient npm/pnpm packaging.

;;; 3372. radicle-explorer-git — BLOCKED: NPM_ECOSYSTEM.
;;; Same as radicle-explorer but tracking git HEAD. Same npm ecosystem blocker.

;;; 3373. radicle-httpd-git — BLOCKED: RUST_PLUS_RADICLE_DEP.
;;; Radicle HTTP daemon (Rust/Cargo). Depends on radicle-node at runtime which
;;; is itself blocked (RUST_CARGO_DEPS). Apache-2.0/MIT licensed.

;;; 3374. rockhopper-bin — DONE (recipe above).

;;; 3377. sillytavern — BLOCKED: NPM_ECOSYSTEM.
;;; LLM web UI (github.com/SillyTavern/SillyTavern). Large Node.js/npm
;;; application with extensive dependency tree. AGPL-3.0 licensed.

;;; 3380. element-desktop-git — BLOCKED: ELECTRON_COMPLEX.
;;; Element Matrix client desktop wrapper (github.com/vector-im/element-desktop).
;;; Electron app with TypeScript/yarn/Rust native modules. element-web not in
;;; Guix upstream either. Complex build infrastructure.

;;; 3381. konfigkoll — BLOCKED: RUST_CARGO_DEPS.
;;; Personal system config manager (github.com/VorpalBlade/paketkoll).
;;; Rust/Cargo with 100+ deps. Also Arch-specific features (pacman integration).
;;; MPL-2.0 licensed. Limited utility on non-Arch systems.

;;; 3383. ratarmount-git — BLOCKED: MISSING_GUIX_DEPS.
;;; Python FUSE archive mounter (github.com/mxmlnkn/ratarmount). Requires
;;; python-mfusepy and python-ratarmountcore which are not in Guix. MIT licensed
;;; but dependency chain too deep for batch processing.

;;; 3384. burpsuite-pro — BLOCKED: PROPRIETARY_COMMERCIAL.
;;; PortSwigger Burp Suite Professional (portswigger.net/burp). Proprietary
;;; commercial Java application. Requires paid license. JAR not redistributable.

;;; 3385. nodejs-markdown-toc — BLOCKED: NPM_ECOSYSTEM.
;;; Markdown TOC generator (github.com/jonschlinkert/markdown-toc). Node.js/npm
;;; package. Stale upstream (last release years ago). Complex npm dep tree.

;;; 3387. tinct-bin — DONE (recipe above).

;;; 3392. konfigkoll-git — BLOCKED: RUST_CARGO_DEPS.
;;; Same as konfigkoll (#3381) but tracking git HEAD. Same Rust dep tree blocker.

;;; 3393. fallout1-ce-game — BLOCKED: NON_FREE_LICENSE.
;;; Fallout 1 Community Edition (github.com/alexbatalov/fallout1-ce). Uses
;;; "Sustainable Use License" which is not OSI-approved or FSF-free. Also
;;; requires proprietary game data files (Bethesda/Interplay).

;;; 3394. subs2srs-gtk3-git — BLOCKED: DOTNET_ECOSYSTEM.
;;; GTK3 subtitle-to-Anki tool (gitlab.com/fkzys/subs2srs-gtk3). C#/.NET
;;; application requiring dotnet-sdk and GTK# bindings. Guix has very limited
;;; .NET packaging support. GPL-3.0 licensed.

;;; 3395. automx2 — DONE (recipe above as python-automx2).

;;; 3396. eve-ng-integration — DONE (recipe above).

;;; 3400. thedude — BLOCKED: PROPRIETARY.
;;; MikroTik "The Dude" network monitoring client (mikrotik.com/thedude).
;;; Proprietary freeware. Windows binary run under Wine. No source code.
