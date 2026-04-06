;;; Blocked-notes for queue-20260406-nrd30f pass.
;;; 21 packages re-blocked with specific reasons after research.
;;;
;;; Re-blocked categories:
;;; - PROPRIETARY (4): claude-code-stable, syncovery-bin, rtt-rstudio-technician, crql-locd
;;; - PROPRIETARY_DEP (1): aceplay-bin
;;; - BINARY_ONLY_NO_SOURCE (1): xlibre-video-intel-bin
;;; - DOTNET_NOT_IN_GUIX (1): opentabletdriver-git
;;; - MISSING_DEPS (3): conky-colors-git, android-tv-remote, bitwarden-rofi-git
;;; - ARCH_SPECIFIC (1): yay-sys-tray-git
;;; - JAVA_INSTALLER_COMPLEX (1): biglybt
;;; - MISSING_DEP_FRAMEWORK (2): dropdeck-git, qtarcan-git
;;; - RUST_CARGO_DEPS (2): meteobar, btlescan
;;; - DEP_BLOCKED (1): meteobar-bin
;;; - TAURI_COMPLEX (1): qbit-manage-desktop-bin
;;; - ELECTRON_COMPLEX (1): jan-live-bin
;;; - BINARY_ONLY (1): treekei-bin
;;; - CMAKE_LLVM_COMPLEX (1): llvm-cbe-git

(define-module (gaurix packages queue-20260406-nrd30f-blocked-notes))

;;; 3227. xlibre-video-intel-bin — BLOCKED: BINARY_ONLY_NO_SOURCE.
;;; XLibre video-intel driver binary. Prebuilt Arch .pkg.tar.zst from
;;; x11libre.net with no buildable source tarball. Cannot be reproduced
;;; in Guix.

;;; 3233. opentabletdriver-git — BLOCKED: DOTNET_NOT_IN_GUIX.
;;; OpenTabletDriver tablet input driver. Written in C# requiring
;;; .NET 8.0 SDK and runtime. Guix lacks mature dotnet build system
;;; and runtime packages.

;;; 3244. conky-colors-git — BLOCKED: MISSING_DEPS.
;;; Conky configuration generator. Depends on pystatgrab (Python bindings
;;; for libstatgrab) and hddtemp (deprecated/abandoned). Multiple missing
;;; Python dependencies. Project appears unmaintained.

;;; 3252. claude-code-stable — BLOCKED: PROPRIETARY.
;;; Anthropic Claude Code CLI. Proprietary license (LicenseRef-claude-code).
;;; Prebuilt self-contained Bun/JS binary blob. Not eligible for Guix
;;; free-software policy.

;;; 3256. bitwarden-rofi-git — BLOCKED: MISSING_DEPS.
;;; Bitwarden-rofi shell script wrapper. Depends on bitwarden-cli
;;; (Node.js/Electron-adjacent, complex to package) which is not in Guix.
;;; Also a trivial wrapper around rofi and the Bitwarden CLI.

;;; 3259. biglybt — BLOCKED: JAVA_INSTALLER_COMPLEX.
;;; BiglyBT BitTorrent client. AUR runs a proprietary installer .sh script.
;;; Building from source requires full Gradle/Ant build from GitHub which
;;; is a major effort beyond batch processing scope.

;;; 3260. llvm-cbe-git — BLOCKED: CMAKE_LLVM_COMPLEX.
;;; LLVM C backend. CMake project requiring specific LLVM version matching.
;;; No tagged releases; main branch targets latest LLVM. Complex integration
;;; with LLVM source tree as an external project.

;;; 3261. yay-sys-tray-git — BLOCKED: ARCH_SPECIFIC.
;;; System tray for yay AUR helper. Hard-depends on yay and pacman-contrib
;;; which are Arch Linux-specific package management tools with no relevance
;;; to Guix.

;;; 3262. dropdeck-git — BLOCKED: MISSING_DEP_FRAMEWORK.
;;; QML desktop shell widget. Depends on quickshell, a niche Qt6/QML shell
;;; framework not packaged in Guix. Would require quickshell first.

;;; 3263. android-tv-remote — BLOCKED: MISSING_DEPS.
;;; Python/GTK4 Android TV remote control. Needs python-adb-shell and
;;; scrcpy, neither of which are in Guix. Would require packaging 2+
;;; dependencies first.

;;; 3265. syncovery-bin — BLOCKED: PROPRIETARY.
;;; Syncovery file synchronization software. Proprietary with custom license.
;;; Binary-only .deb from vendor site. Requires paid license.

;;; 3266. rtt-rstudio-technician — BLOCKED: PROPRIETARY.
;;; R-Studio Technician data recovery tool. Proprietary with EULA.
;;; Binary-only .rpm from r-studio.com vendor site.

;;; 3268. crql-locd — BLOCKED: PROPRIETARY.
;;; CRQL Locd audio plugin (VST3/CLAP). Proprietary with no source code.
;;; Binary download from crql.works vendor API.

;;; 3270. treekei-bin — BLOCKED: BINARY_ONLY.
;;; Treekei Go binary tool. AUR provides only prebuilt binary; source repo
;;; exists at GitHub but building from source would be a separate package
;;; (treekei, not treekei-bin). No from-source recipe attempted in this pass.

;;; 3271. qbit-manage-desktop-bin — BLOCKED: TAURI_COMPLEX.
;;; qBit Manage desktop app. Prebuilt Tauri/WebKit .deb. Building from
;;; source requires Rust + Node.js + WebKit Tauri toolchain, which is
;;; beyond batch processing scope.

;;; 3272. aceplay-bin — BLOCKED: PROPRIETARY_DEP.
;;; AcePlay media player. Free software (MIT) but hard-depends on
;;; acestream-engine which is proprietary and not available in Guix.

;;; 3273. qtarcan-git — BLOCKED: MISSING_DEP_FRAMEWORK.
;;; Qt platform plugin for Arcan display server. Depends on arcan which
;;; is not packaged in Guix. Niche display server ecosystem.

;;; 3274. jan-live-bin — BLOCKED: ELECTRON_COMPLEX.
;;; Jan AI assistant desktop app. Prebuilt Electron/Tauri .deb. Depends
;;; on bun (JS runtime) and uv (Python package manager), neither in Guix.

;;; 3277. meteobar — BLOCKED: RUST_CARGO_DEPS.
;;; Weather status bar module in Rust. Needs full cargo-inputs enumeration
;;; for cargo-build-system which is beyond batch processing scope.

;;; 3278. meteobar-bin — BLOCKED: DEP_BLOCKED.
;;; Binary variant of meteobar. Since meteobar (from-source) is blocked
;;; on Rust cargo dependencies, this -bin alias has no target to point to.

;;; 3279. btlescan — BLOCKED: RUST_CARGO_DEPS.
;;; Bluetooth Low Energy scanner in Rust. Needs full cargo-inputs
;;; enumeration for cargo-build-system which is beyond batch processing scope.
