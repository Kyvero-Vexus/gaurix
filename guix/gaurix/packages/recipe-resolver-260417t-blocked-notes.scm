;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Blocked notes for recipe-resolver-260417t
;;; 13 packages could not be resolved in this pass.
;;;
;;; 1. hdsentinel (14849)
;;;    BLOCKED: PROPRIETARY: closed-source SMART analysis tool; binary-only,
;;;    freeware license, no source code available; cannot be built from source.
;;;
;;; 2. daed (14850)
;;;    BLOCKED: COMPLEX_BUILD: requires eBPF kernel programs + Go backend
;;;    (dae-wing) + React/TypeScript frontend in a monorepo with Turbo.
;;;    Needs clang for eBPF compilation, pnpm for Node.js, and Go vendored
;;;    deps.  A1: eBPF toolchain not in Guix; A2: multi-language monorepo
;;;    build unsupported; A3: runtime needs kernel eBPF/bpf_link support.
;;;
;;; 3. flang (14851)
;;;    BLOCKED: DEP_CHAIN_TOO_DEEP: LLVM Fortran front end requires MLIR
;;;    (Multi-Level IR) which is not packaged in Guix.  MLIR is a large
;;;    LLVM sub-project that would need independent packaging first.
;;;    A1: package MLIR from LLVM monorepo — very large scope;
;;;    A2: binary distribution — no standalone Flang binaries exist;
;;;    A3: use gfortran instead (already in Guix).
;;;
;;; 4. qsync (14861)
;;;    BLOCKED: PROPRIETARY: QNAP closed-source synchronization client.
;;;    No source code available; binary bundles own Qt 5.12 libraries.
;;;    Custom QNAP EULA prohibits redistribution.
;;;
;;; 5. verible (14862)
;;;    BLOCKED: COMPLEX_BUILD: SystemVerilog toolset uses Bazel build system.
;;;    Bazel downloads dependencies at build time, violating Guix
;;;    reproducibility requirements.  Bazel's hermetic toolchain conflicts
;;;    with Guix's approach.  A1: Bazel not packageable in Guix;
;;;    A2: no CMake/Make alternative build; A3: pre-built binaries available
;;;    but depend on specific glibc versions.
;;;
;;; 6. hey-mail-bin (14873)
;;;    BLOCKED: PROPRIETARY: closed-source Electron desktop app from
;;;    37signals (Basecamp).  No source code available.  Proprietary license.
;;;
;;; 7. python-pylibcugraph (14875)
;;;    BLOCKED: DEP_CHAIN_TOO_DEEP: RAPIDS cuGraph Python bindings require
;;;    NVIDIA CUDA toolkit (proprietary) and GPU hardware.  Cython/CUDA
;;;    compilation needs nvcc compiler not in Guix.
;;;
;;; 8. python-cugraph (14876)
;;;    BLOCKED: DEP_CHAIN_TOO_DEEP: RAPIDS cuGraph high-level Python API.
;;;    Same NVIDIA CUDA dependency chain as python-pylibcugraph.
;;;
;;; 9. cugraph (14877)
;;;    BLOCKED: DEP_CHAIN_TOO_DEEP: RAPIDS cuGraph C++/CUDA core library.
;;;    Requires NVIDIA CUDA toolkit, Thrust, RMM, Apache Arrow GPU.
;;;    Entire RAPIDS ecosystem is CUDA-only.
;;;
;;; 10. votes (14878)
;;;     BLOCKED: ARCH_SPECIFIC: Python script that parses AUR website to
;;;     check package vote counts.  Has no use outside Arch Linux ecosystem.
;;;     Guix has no AUR equivalent.
;;;
;;; 11. hpltt (14880)
;;;     BLOCKED: PROPRIETARY: HP/HPE Library & Tape Tools.  Proprietary
;;;     closed-source binary.  HPE download URLs return 404; software is
;;;     behind HPE paywalls and registration walls.
;;;
;;; 12. logalize-bin (14860)
;;;     BLOCKED: SOURCE_UNAVAILABLE: pre-built binary download URLs return 404.
;;;     Go source at github.com/deponian/logalize exists but requires vendored
;;;     module hashes.  A1: binary URLs (v0.8.0, v0.13.0, v0.14.0) all return 404;
;;;     A2: Go source build needs go-build-system with vendored deps;
;;;     A3: no Guix go-build-system recipe feasible without working download.
;;;
;;; 13. unsplash-wallpapers-bin (14881)
;;;     BLOCKED: OBSOLETE_DEPS: requires Electron 8 (2020-era, end of life).
;;;     Electron packaging in Guix is unsupported.  Project appears
;;;     unmaintained (last release ~2022).  Modern Electron would require
;;;     bundled Chromium rebuild.

(define-module (gaurix packages recipe-resolver-260417t-blocked-notes))
