;;; Blocked notes for round 21, worker 01
;;; 13 packages remain BLOCKED:
(define-module (gaurix packages cron-5a2fb251-r21-w01-blocked-notes)
  #:use-module (guix packages))

;; 1. podserv-b-git (3037) — BLOCKED: VERY_LOW_MATURITY
;;    Reason: Rust podcast server (github.com/l5yth/podserv-b, Apache-2.0).
;;    Only 2 GitHub stars, 1 contributor, ~20 commits.  Binary release is
;;    a single 7.9 MB file.  Too early stage to warrant packaging.
;;    Tried: Confirmed release v0.1.2 exists with binary download.

;; 2. pricehist (3083) — BLOCKED: MISSING_DEPENDENCY
;;    Reason: Python CLI for historical price data (gitlab.com/chrisberkhout/pricehist,
;;    MIT, v1.4.14).  Requires python-curlify which is not packaged in Guix.
;;    Curlify has no PyPI sdist download currently accessible.
;;    Tried: Checked Guix for python-curlify (not found), attempted guix import pypi
;;    and direct PyPI download (both failed).

;; 3. logibar (3094) — BLOCKED: SYSTEMD_SPECIFIC
;;    Reason: Waybar Logitech battery widgets (github.com/mryll/logibar, MIT, v0.1.3).
;;    Shell + Python scripts with systemd user services and udev rules.
;;    Guix uses Shepherd, not systemd.  The udev rules could be adapted but
;;    the systemd service files would need Shepherd equivalents.
;;    Tried: Examined source structure, confirmed systemd dependency.

;; 4. dpibreak (3075) — BLOCKED: NEEDS_CARGO_VENDORING
;;    Reason: Rust DPI circumvention tool (github.com/dilluti0n/dpibreak, GPL-3.0+,
;;    v0.6.0).  Requires cargo-build-system with full crate dependency enumeration.
;;    Depends on libnetfilter-queue and nftables at build time.
;;    Tried: Confirmed source and binary releases exist.  Binary repack
;;    possible but needs libnetfilter-queue in rpath.

;; 5. dpibreak-git (3077) — BLOCKED: NEEDS_CARGO_VENDORING
;;    Reason: Same upstream as dpibreak (github.com/dilluti0n/dpibreak).
;;    Git variant of the same package.  Same cargo vendoring requirement.

;; 6. fish-session (3084) — BLOCKED: NO_LICENSE
;;    Reason: Fish shell session manager (github.com/AtefR/fish-session, v0.1.8).
;;    No LICENSE file, no license field in Cargo.toml, no license in README.
;;    AUR lists LicenseRef-UNLICENSED.  Cannot package without a FOSS license.
;;    Tried: Checked repo root, Cargo.toml, README for license info (none found).

;; 7. boomer-git (3095) — BLOCKED: MISSING_BUILD_TOOLS
;;    Reason: Screen zoomer by Tsoding (github.com/tsoding/boomer, MIT).
;;    Written in Nim.  Guix has no Nim compiler or nimble build system.
;;    No tagged releases, no binary downloads.  Last commit Feb 2024.
;;    Tried: Confirmed Nim is not in Guix, no binary releases available.

;; 8. wireview-linux (3074) — BLOCKED: NONFREE_LICENSE
;;    Reason: Unofficial Linux port of Thermal Grizzly WireView Pro II
;;    (github.com/emaspa/wireview-linux, v1.0.4.0).  Contains decompiled
;;    code from the proprietary Windows application.  License states
;;    "provided for personal use and interoperability" — not a FOSS license.
;;    Also requires .NET 8.0 SDK to build.
;;    Tried: Checked license file, confirmed non-free.

;; 9. spinwheel-pipewire (3089) — BLOCKED: NO_UPSTREAM_SOURCE
;;    Reason: Terminal wheel spinner with sound (codeberg.org/the-traveler/spinwheel,
;;    GPL-3.0+, v0.1.0).  Upstream Codeberg repo returns 404 (deleted or private).
;;    Source only exists embedded in the AUR package itself.  No stable
;;    upstream URL to point to for a Guix origin.
;;    Tried: Checked codeberg.org/the-traveler/spinwheel (404).

;; 10. chough-bin (3080) — BLOCKED: BUILD_SYSTEM_TOO_COMPLEX
;;     Reason: ASR CLI using Parakeet via sherpa-onnx (github.com/hyperpuncher/chough,
;;     MIT, v1.0.0).  Binary bundles proprietary ONNX runtime shared libraries
;;     (libonnxruntime.so, libsherpa-onnx-c-api.so).  Source build requires
;;     sherpa-onnx Go bindings which pull platform-specific precompiled native
;;     libraries.  Would require packaging onnxruntime and sherpa-onnx first.
;;     Tried: Examined release tarball contents, confirmed bundled .so files.

;; 11. gnix (3055) — BLOCKED: RUST_NIGHTLY_REQUIRED
;;     Reason: HTTP reverse proxy (codeberg.org/metamuffin/gnix, AGPL-3.0, v2.5.0).
;;     Requires Rust nightly toolchain (cargo +nightly).  Guix only ships
;;     stable Rust.  Nightly features may be deeply embedded in the codebase.
;;     Tried: Confirmed nightly requirement from build instructions.

;; 12. framework-control-bin (3072) — BLOCKED: BUILD_SYSTEM_TOO_COMPLEX
;;     Reason: Framework Laptop control app (github.com/ozturkkl/framework-control,
;;     MIT, v0.5.2).  Hybrid build: Rust backend + Svelte/Node.js frontend.
;;     Requires both npm and cargo builds.  Runtime depends on framework_tool
;;     CLI (not in Guix) and systemd.  Hardware-specific (Framework laptops only).
;;     Binary is statically linked musl but needs framework-system at runtime.
;;     Tried: Confirmed binary exists but has framework-system dependency.

;; 13. weylus-bin (3102) — BLOCKED: BUILD_SYSTEM_TOO_COMPLEX
;;     Reason: Use tablet as graphic tablet (github.com/H-M-H/Weylus, AGPL-3.0,
;;     v0.11.4).  Multi-language build: Rust + TypeScript/npm + C + nasm.
;;     Requires extensive X11/Wayland/GStreamer libraries.  Last release
;;     Oct 2021 — likely abandoned.  Binary repack from linux.zip would need
;;     many shared library deps (libxtst, libva, gstreamer, dbus, etc.).
;;     Tried: Examined release assets and dependency list.
