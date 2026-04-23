;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Blocked notes for recipe-resolver-260423e
;;; 6 packages exhausted after 3+ approaches each.

;;; -------------------------------------------------------------------
;;; 1. crossmacro (#6154) — NEEDS_RECIPE_DESIGN_EXHAUSTED: DOTNET_REQUIRED
;;; -------------------------------------------------------------------
;;; Expected: cmake-build-system (C++ macro tool)
;;; Reality: .NET 10 / C# / Avalonia UI project (CrossMacro.sln, .csproj)
;;; A1: cmake-build-system — no CMakeLists.txt; project is pure C#/.NET
;;; A2: dotnet-build-system — Guix has no dotnet-sdk or dotnet-build-system
;;; A3: binary release — no prebuilt Linux binaries available on GitHub
;;; Conclusion: requires .NET 10 SDK + Avalonia framework; infeasible until
;;; Guix gains .NET ecosystem support.

;;; -------------------------------------------------------------------
;;; 2. cromite-bin (#6111) — NEEDS_RECIPE_DESIGN_EXHAUSTED: BROWSER_BINARY_COMPLEX
;;; -------------------------------------------------------------------
;;; A1: copy-build-system with binary — 262MB archive, tag requires full
;;;     commit hash suffix (v147.0.7727.56-271900671db643de04aa9f909f0dcc3415c8b827),
;;;     20+ runtime library deps (nss, libdrm, mesa, pango, gtk3, etc.)
;;; A2: patchelf wrapper — binary is dynamically linked to glibc 2.x,
;;;     requires patching ~50 RPATH entries; fragile across Guix updates
;;; A3: flatpak/sandbox approach — Cromite ships its own sandbox; conflicts
;;;     with Guix security model
;;; Conclusion: full Chromium binary packaging requires dedicated effort
;;; comparable to ungoogled-chromium; too complex for batch pass.

;;; -------------------------------------------------------------------
;;; 3. svg-term-cli (#5316) — NEEDS_RECIPE_DESIGN_EXHAUSTED: NPM_DEPS_CHAIN
;;; -------------------------------------------------------------------
;;; A1: node-build-system — requires 10+ npm dependencies not in Guix:
;;;     svg-term, meow, svgo, execa, chalk, get-stdin, plist, term-schemes,
;;;     tempy, @marionebl/sander, guess-terminal
;;; A2: bundle with esbuild — Node.js bundling not idiomatic for Guix
;;; A3: prebuilt binary — no prebuilt releases; npm-only distribution
;;; Conclusion: requires packaging full npm dependency tree; Guix Node.js
;;; packaging is immature for this scope.

;;; -------------------------------------------------------------------
;;; 4. libasciichat (#5265) — NEEDS_RECIPE_DESIGN_EXHAUSTED: VERSION_MISMATCH_COMPLEX
;;; -------------------------------------------------------------------
;;; AUR says v0.6.0 but that version does not exist on GitHub.
;;; Actual project: github.com/zfogg/ascii-chat, latest release v0.11.11
;;; A1: cmake-build-system from source — requires cmake 3.28+, vendored
;;;     deps: libsodium, libvterm, libwebsockets, libdatachannel, raylib,
;;;     zlib, libde265, ffmpeg, opus, portaudio (~15 vendored C libs)
;;; A2: copy-build-system with binary — version mismatch (lib 0.11.10 vs
;;;     release 0.11.11); binary linked to specific glibc
;;; A3: package core deps and build — requires packaging libdatachannel
;;;     and multiple WebRTC components not in Guix
;;; Conclusion: massive vendored dependency tree makes source build
;;; infeasible; version numbering inconsistency adds fragility.

;;; -------------------------------------------------------------------
;;; 5. signal-export (#6128) — NEEDS_RECIPE_DESIGN_EXHAUSTED: MISSING_PYTHON_DEPS
;;; -------------------------------------------------------------------
;;; A1: pyproject-build-system — requires python-sqlcipher3-wheels (wraps
;;;     SQLCipher C library for encrypted Signal databases); not in Guix
;;; A2: package python-sqlcipher3-wheels first — depends on sqlcipher
;;;     (OpenSSL-linked SQLite fork); requires custom build with crypto
;;;     extensions; sqlcipher itself needs packaging
;;; A3: use python-pysqlcipher3 (alternative) — deprecated; upstream
;;;     switched to sqlcipher3-wheels
;;; Conclusion: requires packaging sqlcipher + python-sqlcipher3-wheels
;;; chain; feasible but out of scope for batch pass.

;;; -------------------------------------------------------------------
;;; 6. lic-cli (#6177) — NEEDS_RECIPE_DESIGN_EXHAUSTED: UV_BUILD_BACKEND
;;; -------------------------------------------------------------------
;;; A1: pyproject-build-system — pyproject.toml specifies [build-system]
;;;     requires = ["uv_build>=0.9.13"]; uv_build not available in Guix
;;; A2: patch pyproject.toml to use setuptools — package has no setup.py
;;;     or setup.cfg; would need to fabricate build metadata
;;; A3: pip install from PyPI — version mismatch: PyPI latest is 0.1.20,
;;;     GitHub tag v1.1.2 shows version 1.1.2; v0.1.20 tag nonexistent on
;;;     GitHub; confusing provenance
;;; Conclusion: non-standard build backend + version confusion makes this
;;; unsuitable for batch packaging.
