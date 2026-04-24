;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Blocked notes for recipe-resolver-260424n
;;;
;;; 18 packages blocked with concrete reasons and exhausted approaches.

(define-module (gaurix packages recipe-resolver-260424n-blocked-notes))

;;; === 1. atari++ (6758) ===
;;; CUSTOM_LICENSE: custom:TPL (Tom's Personal License)
;;; A1: TPL license text is not DFSG/FOSS compatible (requires author approval
;;;     for modified redistribution)
;;; A2: No alternative FOSS-licensed fork exists
;;; A3: Custom license blocks inclusion in free software distribution channels
;;; Decision: BLOCKED permanently — license incompatible with Guix free software policy

;;; === 2. zswap-cli-git (6981) ===
;;; SYSTEMD_DEPENDENCY: requires sdbus-cpp and systemd for D-Bus integration
;;; A1: systemd is a hard build and runtime dependency for D-Bus communication
;;; A2: No standalone mode — all ZSwap control goes through systemd D-Bus
;;; A3: Building without D-Bus support removes all functionality
;;; Decision: BLOCKED — systemd hard dependency incompatible with Guix (elogind/Shepherd)

;;; === 3. evcxr_jupyter (10227) ===
;;; CARGO_VENDORING: Rust project requiring cargo-build-system
;;; A1: cargo-build-system needs all crate dependencies individually packaged
;;; A2: evcxr has 100+ transitive crate dependencies
;;; A3: guix import crate produces incomplete results for complex dep trees
;;; Decision: BLOCKED — requires dedicated Rust crate packaging effort

;;; === 4. basalt-monado-git (15080) ===
;;; COMPLEX_DEPS: Visual-Inertial SLAM for OpenXR
;;; A1: Requires Pangolin visualization library (not in Guix)
;;; A2: Requires Intel TBB with specific version pinning
;;; A3: Needs custom OpenCV build with specific modules enabled
;;; Decision: BLOCKED — multiple missing scientific/VR dependencies

;;; === 5. ambertools (15094) ===
;;; BUILD_SYSTEM_TOO_COMPLEX: massive Fortran/C++ biomolecular simulation
;;; A1: Requires gcc14-fortran which is not standard in Guix build env
;;; A2: 100+ internal components with interleaved build dependencies
;;; A3: Custom CMake build with specialized numerical library detection
;;; Decision: BLOCKED — heroic effort needed, niche scientific software

;;; === 6. rog-control-center-nosystemd (15107) ===
;;; CARGO_VENDORING + ASUS_SPECIFIC
;;; A1: Rust GUI application requiring full cargo crate vendoring
;;; A2: Depends on asusctl-nosystemd (not in Guix, also Rust/cargo)
;;; A3: ASUS hardware-specific — only useful on ASUS ROG laptops
;;; Decision: BLOCKED — cargo vendoring + missing base dep + hardware-specific

;;; === 7. asusctl-nosystemd-dinit (15109) ===
;;; INIT_SYSTEM_INCOMPATIBLE: dinit service files
;;; A1: Guix uses GNU Shepherd, not dinit init system
;;; A2: dinit itself is not available in Guix
;;; A3: Service files require asusctl-nosystemd which is also not in Guix
;;; Decision: BLOCKED — incompatible init system

;;; === 8. asusctl-nosystemd (15110) ===
;;; CARGO_VENDORING + ASUS_SPECIFIC
;;; A1: Large Rust project requiring full cargo crate dependency enumeration
;;; A2: Complex D-Bus and udev integration for ASUS laptop hardware
;;; A3: Hardware-specific daemon only useful on ASUS ROG laptops
;;; Decision: BLOCKED — cargo vendoring + hardware-specific

;;; === 9. mullvad-vpn-dinit (15201) ===
;;; INIT_SYSTEM_INCOMPATIBLE: dinit service scripts for Mullvad VPN
;;; A1: Guix uses GNU Shepherd, not dinit init system
;;; A2: mullvad-vpn itself is not in Guix
;;; A3: Service scripts are meaningless without both dinit and mullvad-vpn
;;; Decision: BLOCKED — incompatible init system + missing VPN package

;;; === 10. revezone (15223) ===
;;; ELECTRON_UNSUPPORTED: depends on electron25 (EOL)
;;; A1: Electron 25 is end-of-life and not available in Guix/nonguix
;;; A2: Build requires nvm + yarn + npm toolchain (not in Guix)
;;; A3: Complex Electron web application build process
;;; Decision: BLOCKED — Electron not in Guix, EOL version

;;; === 11. aeternum (15224) ===
;;; CARGO_VENDORING + MISSING_DEP
;;; A1: Rust project requiring cargo-build-system with crate vendoring
;;; A2: Depends on upscayl-ncnn (not in Guix) for image upscaling
;;; A3: Beta/WIP software (v0.1.2.beta.1) — unstable for packaging
;;; Decision: BLOCKED — missing dep + cargo vendoring + unstable

;;; === 12. sail (15226) ===
;;; GO_MODULE_VENDORING + ABANDONED
;;; A1: Go project requiring go-build-system with vendored module hashes
;;; A2: GitHub repo (cdr/sail) is archived/abandoned by Coder
;;; A3: Depends on Docker at runtime (not a standard Guix service)
;;; Decision: BLOCKED — abandoned upstream + Go module vendoring

;;; === 13. ollama-dinit (15236) ===
;;; INIT_SYSTEM_INCOMPATIBLE: dinit user service scripts for Ollama
;;; A1: Guix uses GNU Shepherd, not dinit init system
;;; A2: dinit itself is not available in Guix
;;; A3: Ollama service management on Guix would use Shepherd service definition
;;; Decision: BLOCKED — incompatible init system

;;; === 14. auto-cpufreq-dinit (15219) ===
;;; INIT_SYSTEM_INCOMPATIBLE: dinit service files for auto-cpufreq
;;; A1: Guix uses GNU Shepherd, not dinit init system
;;; A2: dinit itself is not available in Guix
;;; A3: auto-cpufreq uses systemd hooks internally — Guix has own power mgmt
;;; Decision: BLOCKED — incompatible init system

;;; === 15. imessage-exporter (17376) ===
;;; CARGO_VENDORING + PLATFORM_SPECIFIC
;;; A1: Rust project requiring cargo-build-system with full crate enumeration
;;; A2: Requires macOS iMessage SQLite database files (chat.db) to function
;;; A3: No practical Linux utility — macOS-specific data format reader
;;; Decision: BLOCKED — cargo vendoring + no Linux utility

;;; === 16. hyde-ipc (17377) ===
;;; CARGO_VENDORING
;;; A1: Rust IPC tool requiring cargo-build-system with crate vendoring
;;; A2: Depends on Hyprland window manager (not in Guix)
;;; A3: Niche window manager integration tool with small user base
;;; Decision: BLOCKED — cargo vendoring + missing WM dependency

;;; === 17. faenza-cupertino-icon-theme (21477) ===
;;; MISSING_DEP: depends on faenza-icon-theme
;;; A1: faenza-icon-theme is not in Guix or Gaurix — would need packaging first
;;; A2: Installing without base theme results in broken icon inheritance
;;; A3: Recommend alternative icon themes already available in Guix (Papirus, Adwaita)
;;; Decision: BLOCKED — missing base icon theme dependency

;;; === 18. faba-mono-icons-git (21538) ===
;;; MISSING_DEP: depends on faba-icon-theme
;;; A1: faba-icon-theme is not in Guix or Gaurix — would need packaging first
;;; A2: Monochrome panel icons supplement — non-functional without base theme
;;; A3: Recommend alternative icon themes already available in Guix
;;; Decision: BLOCKED — missing base icon theme dependency
