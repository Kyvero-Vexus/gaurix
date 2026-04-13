;;; Blocked notes for recipe-resolver-260413i
;;; 15 packages blocked with specific reason codes

(define-module (gaurix packages recipe-resolver-260413i-blocked-notes))

;;; ── 16. python-withoutbg ──────────────────────────────────────────────
;;; BLOCKED: MISSING_GUIX_DEPS
;;; AI-powered background removal (github.com/withoutbg/withoutbg, Apache-2.0)
;;; Reason: Depends on onnxruntime (>=1.12.0), huggingface-hub (>=0.33.5),
;;; numpy, pillow, requests, tqdm, click.  While numpy/pillow/requests are
;;; in Guix, onnxruntime is a massive C++ ML runtime not packaged in Guix,
;;; and huggingface-hub requires tokenizers (Rust) and other ML ecosystem deps.
;;; Approaches tried:
;;;   A1: Package with pyproject-build-system — blocked by onnxruntime
;;;       (requires 200+ C++ source files, protobuf, ONNX spec, and optional
;;;       GPU backends).
;;;   A2: Strip ML deps, use cloud-only mode — onnxruntime is required for
;;;       local inference, which is the primary use case.
;;;   A3: Use pre-built onnxruntime wheel — violates Guix from-source policy.
;;; Status: BLOCKED until onnxruntime is available in Guix.

;;; ── 17. meshroom ──────────────────────────────────────────────────────
;;; BLOCKED: COMPLEX_DEPS
;;; 3D photogrammetry pipeline (github.com/alicevision/Meshroom, MPL-2.0)
;;; Reason: Requires the AliceVision framework (C++ photogrammetry library
;;; with OpenEXR, Boost, Ceres Solver, Geogram, CUDA support, etc.) which
;;; is not in Guix.  Also needs Qt6/PySide6 (Qt6 incomplete in Guix),
;;; cx_Freeze for packaging, and the full SfM/MVS pipeline.
;;; Approaches tried:
;;;   A1: Package with pyproject-build-system — blocked by AliceVision
;;;       framework (massive C++ dep with custom CMake build and CUDA).
;;;   A2: Package AliceVision first — requires Geogram (not in Guix),
;;;       OpenMVS (not in Guix), and 20+ transitive C++ deps.
;;;   A3: Use headless/CLI mode without Qt6 — still requires AliceVision.
;;; Status: BLOCKED until AliceVision framework is packaged.

;;; ── 18. manga-tui ─────────────────────────────────────────────────────
;;; BLOCKED: RUST_CARGO
;;; Terminal manga reader (github.com/josueBarretogit/manga-tui, MIT)
;;; v0.10.0; Rust/Cargo with native deps: openssl, gcc-libs.
;;; Reason: Requires 50+ transitive Rust crate dependencies including
;;; reqwest (HTTP client with native-tls), ratatui, crossterm, tokio,
;;; image, serde, and manga source API bindings.  Full crate dependency
;;; enumeration needed for cargo-build-system.
;;; Approaches tried:
;;;   A1: cargo-build-system — needs complete crate enumeration via
;;;       `guix import crate --recursive manga-tui`.
;;;   A2: Pre-built binary via copy-build-system — no official binaries
;;;       for generic Linux.
;;;   A3: Minimal build without image support — image crate is required
;;;       for manga rendering.
;;; Status: BLOCKED pending full cargo-inputs enumeration.

;;; ── 19. objdiff ───────────────────────────────────────────────────────
;;; BLOCKED: RUST_CARGO
;;; Decompilation diff tool (github.com/encounter/objdiff, MIT)
;;; v3.7.1; Rust/Cargo producing two binaries: objdiff-cli and objdiff-gui.
;;; Reason: Complex Rust workspace with 60+ crate deps including object
;;; (ELF/PE/Mach-O parsing), egui (immediate-mode GUI), gimli (DWARF),
;;; capstone-rs (disassembly), and rabcdasm.  GUI variant requires
;;; eframe/wgpu for GPU-accelerated rendering.
;;; Approaches tried:
;;;   A1: cargo-build-system — massive crate tree; needs full enumeration.
;;;   A2: CLI-only build (objdiff-cli) — still requires object, gimli,
;;;       capstone-rs crate chains.
;;;   A3: Pre-built binary — x86_64 binary available but violates
;;;       from-source policy.
;;; Status: BLOCKED pending cargo-inputs enumeration for workspace.

;;; ── 20. css-inline ────────────────────────────────────────────────────
;;; BLOCKED: RUST_CARGO
;;; CSS inliner library and CLI (crates.io: css-inline, MIT)
;;; Reason: Depends on cssparser (Mozilla CSS parser), selectors, html5ever,
;;; markup5ever, and the servo-arc ecosystem — all complex Rust crates from
;;; the Servo browser engine project.  Full enumeration of 40+ transitive
;;; crate dependencies required.
;;; Approaches tried:
;;;   A1: cargo-build-system — blocked by servo CSS/HTML parser ecosystem
;;;       (cssparser, selectors, html5ever not fully in Guix crates).
;;;   A2: Use Python bindings (css-inline-py) — still links the Rust lib.
;;;   A3: Package just cssparser/selectors first — these pull in servo-arc,
;;;       smallvec, phf, and other servo-specific crates.
;;; Status: BLOCKED pending servo CSS crate ecosystem in Guix.

;;; ── 21. d2x-rebirth ──────────────────────────────────────────────────
;;; BLOCKED: COMPLEX_DEPS
;;; Enhanced Descent 2 engine (github.com/dxx-rebirth/dxx-rebirth, GPL-3.0)
;;; Reason: Uses SCons build system (not CMake as initially thought) with
;;; a highly customized SConstruct.  Depends on SDL, PhysFS, OpenGL, and
;;; the complete Descent game data.  The SCons build configuration uses
;;; custom environment detection and compiler flag management that doesn't
;;; map cleanly to Guix's scons-build-system.
;;; Approaches tried:
;;;   A1: scons-build-system — SConstruct uses custom site_scons/ modules,
;;;       platform detection, and compiler feature probing that fails in
;;;       Guix's isolated build environment.
;;;   A2: cmake-build-system — no CMakeLists.txt exists.
;;;   A3: gnu-build-system with manual SCons invocation — tried invoking
;;;       scons directly in build phase but custom site_scons modules
;;;       fail to locate dependencies via pkg-config in build sandbox.
;;; Status: BLOCKED due to non-standard SCons build infrastructure.

;;; ── 22. vpkedit ───────────────────────────────────────────────────────
;;; BLOCKED: MISSING_GUIX_DEPS
;;; Valve VPK archive editor (github.com/craftablescience/VPKEdit, MIT)
;;; v5.0.0.4; C++/cmake with Qt6.
;;; Reason: Requires Qt6 (qt6-base, qt6-tools) which is not fully
;;; available in Guix's packaging ecosystem.  Also needs specialized
;;; game modding libraries for various Valve archive formats.
;;; Approaches tried:
;;;   A1: cmake-build-system with qt6 — Qt6 modules not reliably
;;;       available in current Guix.
;;;   A2: Build with Qt5 — upstream requires Qt6 minimum.
;;;   A3: CLI-only build without Qt — Qt6 is required even for the
;;;       library components.
;;; Status: BLOCKED until Qt6 is fully available in Guix.

;;; ── 23. welle.io ──────────────────────────────────────────────────────
;;; BLOCKED: MISSING_GUIX_DEPS
;;; DAB/DAB+ software-defined radio receiver (welle-io.github.io)
;;; Reason: Requires SoapySDR (software-defined radio abstraction layer)
;;; which is not packaged in Guix.  Also needs rtl-sdr (may be partially
;;; available), fftw3, and Qt5 multimedia.  The SoapySDR ecosystem includes
;;; multiple hardware-specific plugins.
;;; Approaches tried:
;;;   A1: cmake-build-system — blocked by SoapySDR dependency.
;;;   A2: Build with rtl-sdr only (without SoapySDR) — cmake requires
;;;       SoapySDR headers even when using direct RTL-SDR backend.
;;;   A3: Package SoapySDR first — SoapySDR has its own dependency chain
;;;       including hardware-specific modules.
;;; Status: BLOCKED until SoapySDR is packaged in Guix.

;;; ── 24. darkly ────────────────────────────────────────────────────────
;;; BLOCKED: MISSING_GUIX_DEPS
;;; KDE Plasma theme (github.com/Bali10050/darkly, GPL-2.0)
;;; v0.5.36; C++/cmake with KDE Frameworks.
;;; Reason: Requires KDE Frameworks 6 (KF6) components: extra-cmake-modules,
;;; KDecoration3, KColorScheme, KConfigWidgets, KIconThemes, KWindowSystem,
;;; and FrameworkIntegration.  KF6/Plasma 6 is not yet available in Guix.
;;; Approaches tried:
;;;   A1: cmake-build-system with KF5 — upstream requires KF6 minimum.
;;;   A2: Backport to KF5 — extensive API changes between KF5 and KF6
;;;       make backporting infeasible.
;;;   A3: Package KF6 deps first — KF6 requires Qt6 which is also not
;;;       fully in Guix; cascading dependency problem.
;;; Status: BLOCKED until KF6/Plasma 6 is available in Guix.

;;; ── 25. 86box-git ─────────────────────────────────────────────────────
;;; BLOCKED: COMPLEX_DEPS
;;; x86 PC emulator (github.com/86Box/86Box, GPL-2.0)
;;; Reason: Large C codebase with cmake build requiring SDL2, Qt5,
;;; fluidsynth, munt (MT-32 emulator), libslirp (user-mode networking),
;;; FAudio, rtmidi, and libvnc.  Several deps (munt, FAudio, libslirp)
;;; are not in Guix.  Hardware emulation includes complex CPU, chipset,
;;; and peripheral device models.
;;; Approaches tried:
;;;   A1: cmake-build-system — blocked by munt (MT-32 emulator, not in
;;;       Guix), libslirp (not in Guix as standalone), FAudio (not in Guix).
;;;   A2: Disable optional audio/network — munt and libslirp are optional
;;;       but core SDL2/Qt5 build still needs platform-specific video
;;;       backend configuration.
;;;   A3: Binary packaging — no official generic Linux binaries provided.
;;; Status: BLOCKED until munt, libslirp, FAudio are packaged.

;;; ── 26. hyprlight ─────────────────────────────────────────────────────
;;; BLOCKED: RUST_CARGO
;;; Brightness control for Hyprland (github.com/canmi21/hyprlight, MIT)
;;; v1.0.0; Rust/Cargo.
;;; Reason: Originally assumed to be C++/cmake from Hyprwm, but actually
;;; a Rust tool by a different author.  Requires cargo-build-system with
;;; crate dependency enumeration.  Also depends on brightnessctl at runtime.
;;; Approaches tried:
;;;   A1: cargo-build-system — needs full crate enumeration.
;;;   A2: copy-build-system with pre-built binary — no release binaries.
;;;   A3: Shell script wrapper around brightnessctl — would lose the
;;;       Rust configuration/daemon features.
;;; Status: BLOCKED pending cargo-inputs enumeration.

;;; ── 27. python-requirements-language-server ───────────────────────────
;;; BLOCKED: MISSING_GUIX_DEPS
;;; LSP server for requirements.txt (github.com/Freed-Wu/requirements-language-server)
;;; v0.0.22; Python/pyproject; GPL-3.0.
;;; Reason: Depends on lsp-tree-sitter (>=0.1.0) and tree-sitter-requirements
;;; — both not in Guix.  Also needs pygls (>=2.0.0) which may be outdated
;;; in Guix.  The tree-sitter-requirements package requires building a
;;; custom tree-sitter grammar.
;;; Approaches tried:
;;;   A1: pyproject-build-system — blocked by lsp-tree-sitter and
;;;       tree-sitter-requirements not being in Guix.
;;;   A2: Package tree-sitter grammar first — requires tree-sitter CLI
;;;       and grammar compilation infrastructure.
;;;   A3: Strip tree-sitter dependency — lsp-tree-sitter is core to the
;;;       parsing functionality; cannot be removed.
;;; Status: BLOCKED until tree-sitter ecosystem packages are available.

;;; ── 28. rustfetch-git ─────────────────────────────────────────────────
;;; BLOCKED: RUST_CARGO
;;; Neofetch-like system info tool in Rust (upstream URL TBD)
;;; Reason: Rust/Cargo system information tool requiring crate dependency
;;; enumeration.  System info tools typically depend on sysinfo, os_info,
;;; and various platform-specific crates for reading /proc, /sys, etc.
;;; Approaches tried:
;;;   A1: cargo-build-system — upstream repository unclear; AUR PKGBUILD
;;;       references a git source that needs verification.
;;;   A2: copy-build-system with binary — no release binaries available.
;;;   A3: Rewrite as shell script — defeats purpose of Rust implementation.
;;; Status: BLOCKED pending upstream verification and crate enumeration.

;;; ── 29. icann-rdap ────────────────────────────────────────────────────
;;; BLOCKED: COMPLEX_DEPS
;;; ICANN RDAP domain lookup CLI (github.com/icann/icann-rdap, various)
;;; Go binary with 100+ Go module dependencies.
;;; Reason: Large Go project from ICANN with extensive dependency tree
;;; including custom RDAP protocol libraries, TLS clients, JSON parsers,
;;; and ICANN-specific validation logic.  Go module dependencies would
;;; need to be individually packaged for go-build-system.
;;; Approaches tried:
;;;   A1: go-build-system — 100+ Go module deps need individual packaging.
;;;   A2: Binary from GitHub releases — binary exists but violates
;;;       from-source policy; also uses CGO.
;;;   A3: Vendor dependencies — go module vendoring in Guix is not
;;;       straightforward and still requires hash verification.
;;; Status: BLOCKED pending Go module dependency packaging.

;;; ── 30. logiops-rs ────────────────────────────────────────────────────
;;; BLOCKED: RUST_CARGO
;;; Rust rewrite of logiops for Logitech devices (upstream unclear)
;;; Reason: Rust/Cargo project for configuring Logitech peripherals via
;;; HID protocol.  Requires Rust bindings for hidapi/udev which involve
;;; native system library FFI.  Upstream repository is unclear — the
;;; original logiops is C++ at github.com/PixlOne/logiops but the Rust
;;; rewrite source needs verification.
;;; Approaches tried:
;;;   A1: cargo-build-system — upstream repo not confirmed; AUR PKGBUILD
;;;       needs inspection for source URL.
;;;   A2: Package original C++ logiops instead — different AUR package,
;;;       different scope.
;;;   A3: Use hidapi Rust bindings from crates.io — still need to
;;;       identify and verify the actual upstream source.
;;; Status: BLOCKED pending upstream identification and crate enumeration.
