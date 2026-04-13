;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Blocked notes for recipe-resolver-260413p
;;; 3 packages blocked with specific reason codes.

(define-module (gaurix packages recipe-resolver-260413p-blocked-notes))

;;; ── Blocked package notes ──────────────────────────────────────────

;;; 1. python-rtfunicode (#7577)
;;;    Status: BLOCKED: MISSING_GUIX_DEPS
;;;    Reason: Requires python-uv-build as build backend, which is not packaged in Guix.
;;;    Approaches: A1: pyproject-build-system with python-uv-build — python-uv-build not available in Guix.
;;;    A2: Attempt with setuptools fallback — package uses uv-build exclusively, no setup.py.
;;;    A3: Package python-uv-build first — requires packaging the full uv toolchain (Rust-based).
;;;    Next: Needs python-uv-build packaged in Guix first, which requires Cargo dep enumeration.

;;; 2. neural-amp-modeler-lv2 (#11070)
;;;    Status: BLOCKED: COMPLEX_SUBMODULES
;;;    Reason: CMake project with 5 vendored git submodule dependencies (NeuralAudio, NeuralAmpModelerCore,
;;;    RTNeural, math_approx, xsimd) at pinned commits.  Each requires separate origin and manual
;;;    symlinking in prepare phase.
;;;    Approaches: A1: cmake-build-system with 6 separate origins — feasible but complex multi-source
;;;    recipe exceeding batch scope.  A2: Bundle all deps in single git checkout — recursive git-fetch
;;;    possible but hash management complex.  A3: Wait for upstream to vendor deps in release tarball.
;;;    Next: Needs dedicated multi-source recipe pass with proper submodule handling.

;;; 3. neovide-bin (#7545)
;;;    Status: BLOCKED: PATCHELF_COMPLEX
;;;    Reason: Pre-built Neovim GUI with 9+ shared library dependencies requiring patchelf/wrap:
;;;    neovim, fontconfig, freetype2, expat, zlib, bzip2, libpng, brotli, gcc-libs.
;;;    Binary also needs RPATH patching for mesa/X11/Wayland libs at runtime.
;;;    Approaches: A1: copy-build-system with extensive patchelf — requires testing RPATH for
;;;    OpenGL/Vulkan paths which vary by system.  A2: Wrapper script with LD_LIBRARY_PATH — fragile.
;;;    A3: Build from source with cargo-build-system — 200+ crate deps.
;;;    Next: Needs dedicated binary repackaging pass with runtime library testing.
