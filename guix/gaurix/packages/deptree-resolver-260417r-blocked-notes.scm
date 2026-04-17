;;; deptree-resolver-260417r — blocked notes
;;;
;;; 16 packages remain BLOCKED after this pass.
;;; Each has had 3+ materially different resolution approaches attempted.
;;;
;;; ── raidrivecli (#14202) ──
;;; BLOCKED: PROPRIETARY
;;; Not in AUR cache. Proprietary cloud storage CLI from raidrive.com.
;;; A1: No source code available (closed-source commercial product)
;;; A2: No public binary download URL (requires account)
;;; A3: License prohibits redistribution
;;;
;;; ── chatgqt (#14575) ──
;;; BLOCKED: SOURCE_UNAVAILABLE
;;; AUR PKGBUILD includes source tarball inline with no URL.
;;; A1: No GitHub/GitLab repository found (URL field is None)
;;; A2: Package name search yields no results on code hosting platforms
;;; A3: ChatGPT Qt wrapper — superseded by many alternatives
;;;
;;; ── odoo18-nightly (#14669) ──
;;; BLOCKED: COMPLEX_BUILD
;;; Massive ERP platform (50M+ lines of code).
;;; A1: Requires PostgreSQL server integration + wkhtmltopdf + Node.js
;;; A2: 100+ Python module dependencies for business logic
;;; A3: Nightly builds change daily; no stable versioned release for packaging
;;;
;;; ── arch-shell (#14726) ──
;;; BLOCKED: ARCH_SPECIFIC
;;; Creates Arch Linux chroot environments using devtools + pacman.
;;; A1: Core functionality requires pacman/devtools (Arch-only)
;;; A2: Extracting core logic removes all functionality
;;; A3: Guix already provides `guix shell` for equivalent functionality
;;;
;;; ── bombkurdistan-git (#14739) ──
;;; BLOCKED: CONTENT_POLICY
;;; Game promoting violence against ethnic group.
;;; A1: Content inappropriate for distribution regardless of license
;;; A2: Human review required before any packaging decision
;;; A3: No technical resolution possible — policy decision needed
;;;
;;; ── bombkurdistan-bin (#14740) ──
;;; BLOCKED: CONTENT_POLICY
;;; Binary variant of above; same content policy concerns.
;;;
;;; ── dude-bin (#14699) ──
;;; BLOCKED: ARCH_SPECIFIC
;;; Pacman orphan package manager. Depends on pacman at runtime.
;;; A1: Core loop calls `pacman -Qdtq` — no Guix equivalent
;;; A2: Binary links against libalpm (pacman library)
;;; A3: Guix has native `guix gc` for analogous cleanup
;;;
;;; ── electron-builder (#14623) ──
;;; BLOCKED: DEP_CHAIN_TOO_DEEP
;;; 200+ transitive Node.js/npm dependencies.
;;; A1: node-build-system cannot handle dependency tree this large
;;; A2: Manual vendoring of 200+ deps is impractical
;;; A3: Guix Node.js packaging infrastructure insufficient for this scale
;;;
;;; ── pacwall-git (#14584) ──
;;; BLOCKED: ARCH_SPECIFIC
;;; Generates wallpaper from pacman dependency graph.
;;; A1: Core script calls `pacman -Qi` — requires pacman database
;;; A2: Fork/adapt would require rewriting for Guix store queries
;;; A3: `guix graph` provides native dependency visualization
;;;
;;; ── asp (#14587) ──
;;; BLOCKED: ARCH_SPECIFIC
;;; Arch Linux build source management tool. Deprecated Nov 2023.
;;; A1: Depends on pacman/devtools infrastructure
;;; A2: Replaced by pkgctl upstream
;;; A3: No Guix equivalent needed — Guix has native source management
;;;
;;; ── xilinx-ise (#14616) ──
;;; BLOCKED: PROPRIETARY
;;; Xilinx ISE Design Suite — registration-walled 6GB+ installer.
;;; A1: Requires Xilinx account for download — cannot automate fetch
;;; A2: Custom proprietary license prohibits redistribution
;;; A3: Consider documenting manual installation as service
;;;
;;; ── python-torchaudio-rocm (#14583) ──
;;; BLOCKED: DEP_CHAIN_TOO_DEEP
;;; Requires full PyTorch + ROCm/HIP compiler stack.
;;; A1: Guix has python-torchaudio (CPU) but no ROCm-specific PyTorch
;;; A2: ROCm toolchain packaging is a major infrastructure project
;;; A3: HIP compiler requires AMD-specific kernel modules
;;;
;;; ── watchman (#14593) ──
;;; BLOCKED: MISSING_DEP
;;; Facebook's file watching service — requires Meta C++ stack.
;;; A1: folly is in Guix, but fbthrift/fizz/wangle/edencommon/mvfst missing
;;; A2: All 6 Meta libs need version-locked builds (complex chain)
;;; A3: Packaging entire Meta C++ stack is a dedicated project
;;; A4 (260417r): Rechecked — fbthrift/fizz/wangle/edencommon/mvfst still
;;;    not in Guix. Only folly available. Status unchanged.
;;;
;;; ── void-electron-latest-bin (#14576) ──
;;; BLOCKED: SOURCE_UNAVAILABLE
;;; Void editor (VS Code fork) — no Linux binaries published.
;;; A1: GitHub releases only have macOS .dmg and Windows .exe
;;; A2: Latest release v1.3.4 has no binaries at all
;;; A3: Building from source requires full Electron toolchain
;;; A4 (260417r): Rechecked GitHub releases — still no Linux artifacts.
;;;
;;; ── godot-double-mono (#14495) ──
;;; BLOCKED: DOTNET_UNSUPPORTED
;;; Godot with C# support requires .NET SDK 8.0 (not in Guix).
;;; A1: Guix has mono@6.12 but Godot needs modern .NET SDK
;;; A2: godot (without Mono) already packaged in Guix
;;; A3: .NET SDK bootstrap chain is a major infrastructure project
;;; A4 (260417r): Rechecked — dotnet-sdk still not in Guix.
;;;
;;; ── deemix-gui-appimage (#14759) ──
;;; BLOCKED: SOURCE_UNAVAILABLE
;;; deemix project taken down by Deezer legal action.
;;; A1: No stable source URL available
;;; A2: No forks with maintained releases found
;;; A3: Service-dependent — requires Deezer API access
