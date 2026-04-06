;;; Round-22 worker-03 NEEDS_RECIPE_DESIGN resolution pass #14 — blocked notes.
;;; 16 packages re-blocked with specific reasons.

(define-module (gaurix packages cron-c79f127f-r22-w03-nrd14-blocked-notes))

;; ── Re-blocked packages ──────────────────────────────────────────────

;; 1. python-pysmart (#3007)
;;    Status: BLOCKED: MISSING_GUIX_DEPS
;;    Reason: Python wrapper for smartctl (smartmontools).  Needs
;;    python-humanfriendly which is not in Guix upstream.  Requires
;;    packaging python-humanfriendly first, then python-pysmart can
;;    use python-build-system.  Deferring to future pass.

;; 2. renamemytvseries-gtk-bin (#3008)
;;    Status: BLOCKED: PROPRIETARY_NO_SOURCE
;;    Reason: FreePascal/Lazarus desktop app distributed as binary-only
;;    from tweaking4all.com.  No source repository, custom/proprietary
;;    license.  Cannot be packaged for Guix.

;; 3. feedr-bin (#3009)
;;    Status: BLOCKED: CARGO_VENDOR_DEPS_MISSING
;;    Reason: Rust/cargo project (https://github.com/bahdotsh/feedr).
;;    Source build requires vendored cargo deps not yet packaged in Guix.
;;    GitHub releases only provide bare ELF binary without glibc compat.
;;    Needs cargo-build-system with vendored deps in future pass.

;; 4. openhue-cli (#3010)
;;    Status: BLOCKED: GO_VENDOR_DEPS_MISSING
;;    Reason: Go CLI (https://github.com/openhue/openhue-cli).
;;    Requires go.sum vendored deps.  No prebuilt Linux binary in
;;    releases.  Needs go-build-system with vendor tarball in future pass.

;; 5. boscaceoil-blue-bin (#3011)
;;    Status: BLOCKED: GODOT_ENGINE_REQUIRED
;;    Reason: Music creation app built with Godot Engine
;;    (https://github.com/YuriSizov/boscaceoil-blue).  Building from
;;    source requires Godot 4.x export templates which are not in Guix.
;;    Binary is a Godot export bundle, complex to repackage.

;; 6. crier-bin (#3012)
;;    Status: BLOCKED: CARGO_VENDOR_DEPS_MISSING
;;    Reason: Rust push notification tool (https://github.com/skorotkiewicz/crier).
;;    Source build requires vendored cargo deps.  Binary tarball
;;    available but may need glibc patching.  Defer to future pass
;;    with cargo-build-system.

;; 7. reqable-bin (#3013)
;;    Status: BLOCKED: PROPRIETARY_CLOSED_SOURCE
;;    Reason: Professional HTTP debugger (https://reqable.com).
;;    Closed-source proprietary app, GitHub repo is issue tracker only.
;;    Custom license, no source code available.  Cannot be packaged.

;; 8. bililive-recorder-bin (#3014)
;;    Status: BLOCKED: DOTNET_NOT_SUPPORTED
;;    Reason: Bilibili live stream recorder in C#/.NET
;;    (https://github.com/Bililive/BililiveRecorder).  GPL-3.0 licensed
;;    but Guix has no .NET/C# build system.  Self-contained .NET binary
;;    would need complex patchelf for .NET runtime.  Not feasible.

;; 9. cliamp-bin (#3015)
;;    Status: BLOCKED: DUPLICATE_OF_EXISTING
;;    Reason: Binary version of cliamp which is already packaged as
;;    cliamp in cron-c79f127f-r22-w03-nrd10.  The -bin variant is
;;    redundant.  Use existing cliamp package instead.

;; 10. ferrishot-bin (#3017)
;;     Status: BLOCKED: CARGO_VENDOR_DEPS_MISSING
;;     Reason: Rust screenshot tool (https://github.com/nik-rev/ferrishot).
;;     Source build requires many Wayland/Rust crate deps.  Binary tarball
;;     available but statically links many deps.  Defer to cargo-build-system
;;     pass when Wayland Rust crates are available.

;; 11. sysbox-ce (#3018)
;;     Status: BLOCKED: COMPLEX_BUILD_INFEASIBLE
;;     Reason: Container runtime (https://github.com/nestybox/sysbox).
;;     Requires 8+ git submodules (sysbox-fs, sysbox-mgr, sysbox-runc,
;;     etc.), protobuf codegen, Linux kernel shiftfs/idmapped-mount
;;     support, and systemd service integration.  Far too complex for
;;     batch packaging.

;; 12. clightd (#3023)
;;     Status: BLOCKED: DEFERRED_DEPS_CHAIN
;;     Reason: D-Bus brightness daemon (https://github.com/FedeDP/Clightd).
;;     Depends on libmodule (now packaged in nrd14), but also needs
;;     ddcutil, libdrm, systemd-libs, polkit, and Wayland — several of
;;     which need careful integration.  Defer to focused pass.

;; 13. sabiql-bin (#3036)
;;     Status: BLOCKED: CARGO_VENDOR_DEPS_MISSING
;;     Reason: Rust TUI for PostgreSQL (https://github.com/riii111/sabiql).
;;     Source build requires vendored cargo deps.  No prebuilt Linux
;;     x86_64 binary in GitHub releases (only provides cargo install).
;;     Needs cargo-build-system with vendored deps.

;; 14. podserv-b-git (#3037)
;;     Status: BLOCKED: TOO_NICHE_LOW_PRIORITY
;;     Reason: Minimalist podcast server in Rust
;;     (https://github.com/l5yth/podserv-b).  Single maintainer, 1 AUR
;;     vote, very niche use case.  Source build needs vendored cargo deps.
;;     Deprioritized.

;; 15. netwatch-tui (#3038)
;;     Status: BLOCKED: CARGO_VENDOR_DEPS_MISSING
;;     Reason: Rust TUI network diagnostics (https://github.com/matthart1983/netwatch).
;;     Needs libpcap + nasm at build time, plus vendored cargo deps.
;;     AUR version (0.3.5) is outdated vs upstream (0.9.0).
;;     Defer to cargo-build-system pass.

;; 16. q5k-usb-udev (#3040)
;;     Status: BLOCKED: TOO_NICHE_UNSTABLE_UPSTREAM
;;     Reason: Single udev rules file for Qudelix-5K USB DAC.  Upstream is
;;     a GitHub Gist (not a proper repo), extremely niche hardware-specific
;;     package.  Not worth maintaining in channel.
