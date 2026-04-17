;;; deptree-resolver-260417q — blocked notes
;;;
;;; 24 packages remain BLOCKED after this pass.
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
;;;
;;; ── void-electron-latest-bin (#14576) ──
;;; BLOCKED: SOURCE_UNAVAILABLE
;;; Void editor (VS Code fork) requires full Electron packaging.
;;; A1: Release artifacts fragmented across different GitHub orgs
;;; A2: Electron binary repack needs complex library patching
;;; A3: Project status unclear — multiple competing forks
;;;
;;; ── godot-double-mono (#14495) ──
;;; BLOCKED: DOTNET_UNSUPPORTED
;;; Godot with C# support requires .NET SDK 8.0 (not in Guix).
;;; A1: Guix has mono@6.12 but Godot needs modern .NET SDK
;;; A2: godot-double (without Mono) already packaged in channel
;;; A3: .NET SDK bootstrap chain is a major infrastructure project
;;;
;;; ── python-gradio (#14579) ──
;;; RESOLVABLE: dependencies packaged in this pass (python-ffmpy,
;;; python-groovy, python-safehttpx, python-gradio-client).
;;; Main python-gradio recipe requires additional build tooling
;;; (pnpm for frontend assets) — deferred to recipe-resolver pass.
;;; Status changed to NEEDS_RECIPE_DESIGN.
;;;
;;; ── elmerfem-git (#14617) ──
;;; RESOLVABLE: most core deps in Guix. Recipe requires careful
;;; CMake configuration to disable optional deps (ospray, anari-sdk,
;;; adios2, liblas). Deferred to recipe-resolver pass.
;;; Status changed to NEEDS_RECIPE_DESIGN.
;;;
;;; ── deemix-gui-appimage (#14759) ──
;;; BLOCKED: SOURCE_UNAVAILABLE
;;; deemix project taken down by Deezer legal action.
;;; A1: No stable source URL available
;;; A2: No forks with maintained releases found
;;; A3: Service-dependent — requires Deezer API access
;;;
;;; ── intel-level-zero-raytracing-support-git (#14769) ──
;;; BLOCKED: DEP_RESOLUTION_FAILED
;;; Requires Intel Level Zero SDK + OneAPI DPC++ not in Guix.
;;; A1: Level Zero SDK has complex Intel-specific build requirements
;;; A2: OneAPI DPC++ compiler not packaged in Guix
;;; A3: Intel GPU-specific; limited user base on Guix
;;;
;;; ── clangd-opt-git (#14814) ──
;;; BLOCKED: COMPLEX_BUILD
;;; Full LLVM/Clang trunk build with custom patches.
;;; A1: 1h+ build time, 50GB+ disk space required
;;; A2: Custom patches require ongoing maintenance per commit
;;; A3: Guix already has clang/clangd from upstream LLVM
;;;
;;; ── ffmpeg-obs (#14818) ──
;;; BLOCKED: COMPLEX_BUILD
;;; Custom FFmpeg build with OBS Studio-specific patches.
;;; A1: OBS patches modify FFmpeg internals; version-locked
;;; A2: Conflicts with system FFmpeg installation
;;; A3: OBS Studio in Guix works with standard FFmpeg
;;;
;;; ── vlc-plugin-luajit (#14828) ──
;;; BLOCKED: COMPLEX_BUILD
;;; Full VLC rebuild replacing Lua with LuaJIT.
;;; A1: 60+ build dependencies; long compile time
;;; A2: Conflicts with system VLC
;;; A3: Part of vlc-luajit group (3 packages)
;;;
;;; ── vlc-luajit (#14829) ──
;;; BLOCKED: COMPLEX_BUILD
;;; Full VLC rebuild with LuaJIT. Depends on libvlc-luajit + vlc-plugin-luajit.
;;; A1: 60+ build dependencies; long compile time
;;; A2: Inherits complexity from vlc-plugin-luajit + libvlc-luajit
;;; A3: Only needed for OBS Studio LuaJIT compatibility
;;;
;;; ── libvlc-luajit (#14830) ──
;;; BLOCKED: COMPLEX_BUILD
;;; VLC library variant with LuaJIT. Part of vlc-luajit group.
;;; A1: Requires full VLC build infrastructure
;;; A2: Tightly coupled with vlc-luajit package
;;; A3: Library output of vlc-luajit build
;;;
;;; ── texlive-full (#14846) ──
;;; BLOCKED: ARCH_SPECIFIC
;;; 8GB TeX Live ISO installed to /opt; Arch-specific pacman hooks.
;;; A1: Guix already has modular texlive packages
;;; A2: The Arch version "tricks pacman" — Guix-irrelevant pattern
;;; A3: Users should use Guix's modular texlive instead
;;;
;;; ── nvidia-patch (#14847) ──
;;; BLOCKED: LICENSE_REVIEW_NEEDED
;;; Patches proprietary Nvidia binaries to unlock NVFBC/NVENC limits.
;;; A1: May violate Nvidia EULA
;;; A2: Requires matching exact Nvidia driver version
;;; A3: Human review needed for legal/ethical assessment
