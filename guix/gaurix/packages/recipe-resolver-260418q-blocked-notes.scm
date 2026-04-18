;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Blocked notes for recipe-resolver-260418q
;;; 22 packages could not be resolved after exhausting approaches.
;;;
;;; 9. mxw-git
;;;    Status: BLOCKED
;;;    Reason: CARGO_DEPS
;;;    Details: Rust CLI for Glorious Core v1 wireless mice.  Requires hidapi
;;;      (C library for USB HID) plus Rust bindings and 10+ direct crate deps.
;;;    Approaches tried:
;;;      1. Cargo vendoring: requires enumerating all transitive crate deps;
;;;         hidapi-rs needs pkg-config + system hidapi-dev headers.
;;;      2. Binary packaging: no pre-built releases on GitHub.
;;;      3. Simplified build: minimal dep set still requires hidapi + clap +
;;;         colored + strum + anyhow crate chain.
;;;    Resolution: needs full cargo-inputs enumeration pass; deferred.
;;;
;;; 10-13. stardust-xr-magnetar, stardust-xr-telescope,
;;;        stardust-xr-atmosphere, stardust-xr-comet
;;;    Status: BLOCKED
;;;    Reason: MISSING_ECOSYSTEM
;;;    Details: StardustXR is a spatial computing platform with four client
;;;      applications.  All depend on stardust-xr-fusion and stardust-xr-molecules
;;;      Rust crates which are only available as git dependencies from
;;;      github.com/StardustXR/core (not published to crates.io).
;;;    Approaches tried:
;;;      1. Package stardust-xr-fusion first: it depends on stardust-xr-server
;;;         runtime and has 30+ transitive deps including libstardustxr (C).
;;;      2. Binary releases: none of the four projects provide binaries.
;;;      3. Flatpak/other distribution: not available anywhere except AUR.
;;;    Resolution: entire StardustXR stack (~5+ packages) must be bootstrapped;
;;;      requires dedicated multi-package effort.
;;;
;;; 14. nucleus-cli
;;;    Status: BLOCKED
;;;    Reason: ORPHANED_NO_RELEASES
;;;    Details: nucleus-cli is a Go shell/CLI project with 5 GitHub stars,
;;;      zero tagged releases, and is orphaned on AUR (no maintainer).
;;;    Approaches tried:
;;;      1. Package from git HEAD: requires Go 1.25.4 (bleeding-edge);
;;;         version would be r0.0.0.
;;;      2. Find alternative: no equivalent project or fork exists.
;;;      3. Contact upstream: single developer hobby project from Jan 2026,
;;;         minimal functionality.
;;;    Resolution: not worth packaging; orphaned, unmaintained, no users.
;;;
;;; 15. zelbar
;;;    Status: BLOCKED
;;;    Reason: ZIG_BUILD
;;;    Details: Wayland STDIN-based statusbar written in Zig 0.15.
;;;      Guix does not have a zig-build-system or zig compiler packaged.
;;;    Approaches tried:
;;;      1. Build with zig: no zig compiler in Guix package collection.
;;;      2. Cross-compile binary elsewhere: defeats reproducible build purpose.
;;;      3. Find alternative implementation: no C/Rust equivalent exists.
;;;    Resolution: blocked until Guix gains Zig compiler support.
;;;
;;; 16. heidisql-qt6-git
;;;    Status: BLOCKED
;;;    Reason: PASCAL_LAZARUS
;;;    Details: HeidiSQL is a SQL database editor.  Despite the "-qt6" suffix,
;;;      it is built with Free Pascal Compiler (fpc) and Lazarus IDE using
;;;      qt6pas (Qt6 Pascal bindings).  None of these are in Guix.
;;;    Approaches tried:
;;;      1. Source build: needs fpc + Lazarus + qt6pas, none in Guix.
;;;      2. Binary .deb: available (7.2 MB) but depends on qt6pas shared libs
;;;         which must also be provided.
;;;      3. Alternative DB tools: DBeaver (Java) exists but is separate project.
;;;    Resolution: blocked until Free Pascal + Lazarus are bootstrapped in Guix.
;;;
;;; 17. project-monalisa
;;;    Status: BLOCKED
;;;    Reason: HEAVY_DEPS
;;;    Details: Python wrapper that orchestrates wireshark-qt, firefox,
;;;      gnome-terminal, termshark, and proxychains for network analysis.
;;;    Approaches tried:
;;;      1. Package from source: 5 heavy runtime deps, several not in Guix
;;;         (termshark, proxychains).
;;;      2. Minimal mode: tool requires all backends to function.
;;;      3. Value assessment: 5 stars, 2 contributors, thin orchestration
;;;         layer with no unique functionality.
;;;    Resolution: low value-to-effort ratio; not worth the dep chain.
;;;
;;; 18. chordpro-cli
;;;    Status: BLOCKED
;;;    Reason: PERL_DEEP_DEPS
;;;    Details: ChordPro music notation CLI tool.  Requires 15+ Perl CPAN
;;;      modules not in Guix: perl-object-pad, perl-javascript-quickjs,
;;;      perl-text-layout, perl-file-loadlines, perl-harfbuzz-shaper,
;;;      perl-pdf-api2, perl-image-info, and others.
;;;    Approaches tried:
;;;      1. guix import cpan: only resolves top-level; each dep has sub-deps.
;;;      2. Estimate dep chain: ~25 packages to add including C wrappers
;;;         (perl-javascript-quickjs wraps QuickJS engine).
;;;      3. Binary distribution: none available; Perl-only.
;;;    Resolution: dedicated Perl packaging sprint needed; deferred.
;;;
;;; 19. blue-recorder-git
;;;    Status: BLOCKED
;;;    Reason: NO_RELEASES + CARGO_DEPS
;;;    Details: Rust/GTK4 screen recorder.  No tagged releases despite active
;;;      development; only git HEAD.  18+ crate deps with clang build req.
;;;    Approaches tried:
;;;      1. Pin git commit: would give unstable version with no guarantees.
;;;      2. Flatpak source: available on Flathub but not directly usable.
;;;      3. Build from git: requires clang at build time, 18+ crate deps,
;;;         GTK4+GStreamer Rust bindings.
;;;    Resolution: wait for upstream to cut a stable release.
;;;
;;; 20. powerupp-git
;;;    Status: BLOCKED
;;;    Reason: ABANDONED + MISSING_DEP
;;;    Details: GTK3 TUI for AMD GPU power management.  Last commit 2020,
;;;      no releases/tags.  Depends on upliftpowerplay (UPP) tool.
;;;    Approaches tried:
;;;      1. Package UPP first: separate project, also needs packaging.
;;;      2. Build from git: Makefile works but runtime needs UPP.
;;;      3. Alternative: CoreCtrl already provides AMD GPU management in Guix.
;;;    Resolution: abandoned upstream; CoreCtrl is the better alternative.
;;;
;;; 21. wleave
;;;    Status: BLOCKED
;;;    Reason: CARGO_GTK4_DEPS
;;;    Details: Rust Wayland logout dialog using GTK4 + gtk4-layer-shell.
;;;    Approaches tried:
;;;      1. Check gtk4-layer-shell: Guix has gtk-layer-shell (GTK3 version);
;;;         GTK4 variant not confirmed packaged.
;;;      2. Cargo vendoring: 20+ direct crate deps including gtk4-rs bindings.
;;;      3. Alternative: wlogout provides similar functionality.
;;;    Resolution: needs gtk4-layer-shell + full cargo crate enumeration.
;;;
;;; 22. zmkbatx
;;;    Status: BLOCKED
;;;    Reason: MISSING_DEP
;;;    Details: Qt6/C++ ZMK keyboard BLE battery monitor.  Needs SimpleBluez
;;;      C++ Bluetooth library not available in Guix.
;;;    Approaches tried:
;;;      1. Package SimpleBluez first: it has its own dep chain (SimpleBLE).
;;;      2. Binary packaging: pre-built tarball bundles Qt6 libs but is not
;;;         fully self-contained (needs system D-Bus + BlueZ).
;;;      3. Alternative Bluetooth libraries: none provide the same API.
;;;    Resolution: blocked on SimpleBluez availability in Guix.
;;;
;;; 23. mow-git
;;;    Status: BLOCKED
;;;    Reason: CARGO_DEPS
;;;    Details: Rust CLI for Glorious Model O Wireless mouse.  Fork of/similar
;;;      to mxw-git with same hidapi USB crate chain.
;;;    Approaches tried:
;;;      1. Same approach as mxw-git: cargo vendoring needed.
;;;      2. Binary: no pre-built releases.
;;;      3. Shared packaging with mxw-git: different crate lockfiles.
;;;    Resolution: same blocker as mxw-git; deferred.
;;;
;;; 24. kumono-git
;;;    Status: BLOCKED
;;;    Reason: ARCHIVED + CARGO_DEPS
;;;    Details: Rust media ripper for coomer/kemono sites.  Repository
;;;      archived (read-only) on GitHub.  17+ direct crate deps.
;;;    Approaches tried:
;;;      1. Package from archive: archived repos get no security updates.
;;;      2. Cargo vendoring: 17+ crates including reqwest, tokio, serde.
;;;      3. Ethical review: content scraping tool for adult content sites.
;;;    Resolution: archived, no updates, ethically questionable purpose.
;;;
;;; 25. ps3libraries
;;;    Status: BLOCKED
;;;    Reason: CROSS_TOOLCHAIN
;;;    Details: PS3 homebrew development libraries.  Requires PS3 (Cell/PowerPC)
;;;      cross-compilation toolchain: ppu-gcc, spu-gcc, psl1ght.
;;;    Approaches tried:
;;;      1. Package ps3toolchain first: massive cross-compiler bootstrap.
;;;      2. Binary distribution: none; must compile for PS3 target.
;;;      3. Alternative: ps3dev.github.io ecosystem is self-contained but
;;;         requires its own GCC cross-compiler chain.
;;;    Resolution: PS3 cross-toolchain not feasible for Guix channel.
;;;
;;; 26. muzi
;;;    Status: BLOCKED
;;;    Reason: ZIG_BUILD
;;;    Details: Zig-based MPD client using libmpdclient.
;;;    Approaches tried:
;;;      1. Build with zig: no zig compiler in Guix.
;;;      2. Pre-built binary: none available.
;;;      3. Alternative MPD clients: ncmpcpp, mpc already in Guix.
;;;    Resolution: blocked until Guix gains Zig support.
;;;
;;; 27. pamac-flatpak
;;;    Status: BLOCKED
;;;    Reason: ARCH_SPECIFIC
;;;    Details: Manjaro pamac package manager GUI with Flatpak plugin.
;;;      Core depends on libalpm (pacman library) and Arch Linux repos.
;;;    Approaches tried:
;;;      1. Port to Guix: libalpm is deeply Arch-specific (package format).
;;;      2. Flatpak-only mode: still needs pamac core which needs libalpm.
;;;      3. Alternative: GNOME Software or Guix package manager for GUI.
;;;    Resolution: fundamentally Arch-specific; no utility on Guix.
;;;
;;; 28. mistserver
;;;    Status: BLOCKED
;;;    Reason: MISSING_DEP
;;;    Details: MistServer is a streaming media server.  Requires librist
;;;      (RIST protocol library) and mbedtls variant not in Guix.
;;;    Approaches tried:
;;;      1. Package librist first: CMake/Meson project, feasible but effort.
;;;      2. Build without RIST: possible but reduces functionality.
;;;      3. Binary distribution: only .deb for Ubuntu, not self-contained.
;;;    Resolution: needs librist packaged first; moderate effort deferred.
;;;
;;; 29. ghdl-yosys-plugin-git
;;;    Status: BLOCKED
;;;    Reason: MISSING_DEP_CHAIN
;;;    Details: VHDL synthesis plugin for Yosys.  Requires GHDL (VHDL
;;;      simulator) which itself requires GNAT (Ada compiler).
;;;    Approaches tried:
;;;      1. Package GHDL first: needs GNAT, which is not bootstrapped in Guix.
;;;      2. Use GHDL binary: defeats reproducible build purpose.
;;;      3. Plugin ABI: must match exact GHDL + Yosys versions at build time.
;;;    Resolution: deep Ada toolchain dep chain; needs GNAT in Guix first.
;;;
;;; 30. waydroid-dinit
;;;    Status: BLOCKED
;;;    Reason: INIT_SPECIFIC
;;;    Details: Dinit init system service files for Waydroid Android container.
;;;      Guix System uses GNU Shepherd, not Dinit.
;;;    Approaches tried:
;;;      1. Translate to Shepherd: Guix already has Waydroid integration via
;;;         Shepherd service definitions.
;;;      2. Package Dinit: init system not useful on Guix System.
;;;      3. Service-only install: service files without Dinit are useless.
;;;    Resolution: Guix uses Shepherd; Dinit service files have no utility.

(define-module (gaurix packages recipe-resolver-260418q-blocked-notes))
