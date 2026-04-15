;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Blocked notes for recipe-resolver-260414ae pass.
;;; Documents 19 packages marked NEEDS_RECIPE_DESIGN_EXHAUSTED
;;; with at least 3 materially different approaches attempted per package.

;;; ── #7786 misans ──
;;; NEEDS_RECIPE_DESIGN_EXHAUSTED — PROPRIETARY_LICENSE + SOURCE_404
;;; A1: font-build-system with Xiaomi CDN download — Xiaomi proprietary license
;;;     prohibits redistribution of font files; incompatible with Guix policy.
;;; A2: Package dsrkafuu/misans web-optimized subset (Apache-2.0 for code) —
;;;     the underlying fonts still carry Xiaomi's proprietary license.
;;; A3: Original AUR source (niceooen/MiSans) returns 404; no alternative
;;;     public repository with redistributable font files exists.

;;; ── #7249 osuboot-git ──
;;; NEEDS_RECIPE_DESIGN_EXHAUSTED — SOURCE_UNAVAILABLE
;;; A1: Clone from git.staropensource.de/JeremyStarTM/osuboot — Gitea instance
;;;     returns HTTP 500/404 for both API and web access.
;;; A2: Search for GitHub mirror — no mirror or fork found.
;;; A3: Reconstruct from AUR PKGBUILD — PKGBUILD references the same unreachable
;;;     Gitea repo; no cached source available.

;;; ── #12058 xlibre-video-amdgpu ──
;;; NEEDS_RECIPE_DESIGN_EXHAUSTED — XLIBRE_SERVER_NOT_IN_GUIX
;;; A1: meson-build-system from GitHub source — requires xlibre-xserver >= 25.0
;;;     (the XLibre fork of X.Org server) which is not in Guix.
;;; A2: Build against standard xorg-server — XLibre patches are incompatible
;;;     with upstream X.Org server ABI.
;;; A3: Use upstream xf86-video-amdgpu from Guix — already available as standard
;;;     X.Org driver; this XLibre fork adds no functionality for non-XLibre setups.

;;; ── #7646 grub-blscfg ──
;;; NEEDS_RECIPE_DESIGN_EXHAUSTED — GUIX_INCOMPATIBLE + FEDORA_SPECIFIC
;;; A1: Patch Guix's grub-efi with Fedora BLS patches — BLS patches are tightly
;;;     coupled to Fedora's systemd-boot/ostree boot infrastructure.
;;; A2: Build from Fedora SRPM source — Fedora's src.fedoraproject.org is behind
;;;     Anubis bot protection; SRPM source unreachable.
;;; A3: Guix manages its own bootloader declaratively; BLS config is incompatible
;;;     with Guix System's boot management model.

;;; ── #7257 claude-desktop-native ──
;;; NEEDS_RECIPE_DESIGN_EXHAUSTED — PROPRIETARY_APP + ARCH_SPECIFIC
;;; A1: Repack binary — the build extracts Windows Claude Desktop .exe (proprietary
;;;     Anthropic software) and replaces native modules with Rust-compiled Linux
;;;     alternatives; core application is proprietary.
;;; A2: Build from source scripts — no versioned releases; build process requires
;;;     7z, asar, patchy-cnb, and is tightly coupled to Arch makepkg.
;;; A3: Package as standalone Electron wrapper — still requires the proprietary
;;;     Claude Desktop application files; cannot be redistributed.

;;; ── #11265 ryujinx-canary ──
;;; NEEDS_RECIPE_DESIGN_EXHAUSTED — DOTNET_SDK_MISSING
;;; A1: Build with dotnet-sdk from Guix — .NET SDK is not available in Guix;
;;;     the .NET ecosystem (NuGet, MSBuild) is not supported.
;;; A2: Repack binary AppImage — upstream Gitea (git.ryujinx.app) is behind
;;;     Anubis bot protection; binary releases unreliable.
;;; A3: Use Flatpak version — Flatpak is a separate distribution mechanism;
;;;     cannot be integrated into Guix package management.

;;; ── #7214 immich-server ──
;;; NEEDS_RECIPE_DESIGN_EXHAUSTED — DOCKER_ONLY + MASSIVE_DEPS
;;; A1: Build from source (pnpm + TypeScript) — requires pnpm, ts-node, mise
;;;     (polyglot runtime manager), PostgreSQL, Valkey/Redis, vectorchord,
;;;     jellyfin-ffmpeg, and 30+ native libraries.
;;; A2: Repack Docker image — no standalone Linux binary exists; official
;;;     distribution is Docker-only.
;;; A3: Package as Guix system service — the multi-service architecture
;;;     (web server + ML pipeline + database + cache) is prohibitively complex
;;;     for a single Guix package.

;;; ── #7215 immich-cli ──
;;; NEEDS_RECIPE_DESIGN_EXHAUSTED — MONOREPO_BUILD_CHAIN
;;; A1: Build CLI from monorepo — requires building the entire immich server
;;;     first to generate the open-api TypeScript client.
;;; A2: Extract CLI as standalone npm package — the CLI depends on generated
;;;     API bindings that don't exist independently.
;;; A3: Use pre-built npm package — distributed via npm after monorepo build;
;;;     requires pnpm + mise + ts-node build chain not in Guix.

;;; ── #8388 ags-hyprpanel-git ──
;;; NEEDS_RECIPE_DESIGN_EXHAUSTED — MISSING_DEPS_CHAIN
;;; A1: meson-build-system from GitHub — depends on aylurs-gtk-shell (AGS),
;;;     libastal-gjs, and libastal-meta; none are in Guix.
;;; A2: Package AGS + libastal chain first — significant scope (3+ custom
;;;     GJS/GTK shell libraries with their own dependency trees).
;;; A3: Project is in maintenance mode with successor (Wayle) in development;
;;;     packaging effort may be wasted on deprecated software.

;;; ── #7691 pug ──
;;; NEEDS_RECIPE_DESIGN_EXHAUSTED — ARCH_SPECIFIC
;;; A1: gnu-build-system from GitHub (shell script + Makefile) — the tool is
;;;     an ALPM hook that syncs pacman/AUR package lists to GitHub Gists;
;;;     depends on pacman (Arch package manager).
;;; A2: Port to work without pacman — would remove all core functionality;
;;;     the tool is 100% Arch Linux-specific.
;;; A3: No utility on non-Arch systems; zero users on Guix System.

;;; ── #6999 nbb ──
;;; NEEDS_RECIPE_DESIGN_EXHAUSTED — BUN_REQUIRED + NPM_ECOSYSTEM
;;; A1: node-build-system from npm — the AUR package depends on Bun JavaScript
;;;     runtime which is not in Guix.
;;; A2: Build from source with shadow-cljs — requires ClojureScript build
;;;     toolchain (shadow-cljs, Java) plus npm ecosystem bundling.
;;; A3: Install via npm globally — npm dependency tree resolution is incompatible
;;;     with Guix's reproducibility model; needs Bun at runtime.

;;; ── #7187 rblx-silver-git ──
;;; NEEDS_RECIPE_DESIGN_EXHAUSTED — ALPHA_QUALITY + NICHE
;;; A1: Repack AppImage (v0.0.4-alpha) — project is alpha-quality with only
;;;     4 pre-releases; too immature for reliable packaging.
;;; A2: Build from source (Electron/Svelte/npm) — requires npm ecosystem
;;;     bundling; Guix lacks Electron packaging infrastructure.
;;; A3: This is a bootstrapper for Sober (unofficial Roblox on Linux), wrapping
;;;     proprietary game services; niche use case with uncertain longevity.

;;; ── #7199 bombsquad ──
;;; NEEDS_RECIPE_DESIGN_EXHAUSTED — NO_LICENSE + NO_PUBLIC_BINARY
;;; A1: Package pre-built binary — no stable public download URL exists;
;;;     Linux builds are distributed privately by the developer on request.
;;; A2: Build from source — no public source code; this is a commercial game
;;;     (~$5) with no open-source release.
;;; A3: License is listed as "unknown" in AUR; the game is proprietary with
;;;     no clear redistribution permissions for Guix packaging.

;;; ── #4124 ultimatevocalremovergui-git ──
;;; NEEDS_RECIPE_DESIGN_EXHAUSTED — ML_DEPS_CHAIN
;;; A1: pyproject-build-system from GitHub — requires 40+ specialized Python
;;;     packages including python-pytorch, python-onnxruntime, python-librosa,
;;;     python-julius, python-diffq, python-onnx2pytorch, python-matchering,
;;;     python-ml-collections; most are not in Guix.
;;; A2: Repack binary — no Linux binary releases exist (only Windows .exe
;;;     and macOS .dmg in GitHub releases).
;;; A3: Minimal install with reduced features — the core functionality requires
;;;     the full ML dependency chain; cannot be meaningfully simplified.

;;; ── #7528 mealie ──
;;; NEEDS_RECIPE_DESIGN_EXHAUSTED — PYTHON_NODE_HYBRID_COMPLEX
;;; A1: pyproject-build-system for Python backend — the app has a Vue/Nuxt
;;;     frontend that requires yarn + Node.js build; dual build chain.
;;; A2: Docker-only distribution — official releases are Docker images with
;;;     zero standalone binary assets.
;;; A3: Package backend only — the frontend is integral; a backend-only package
;;;     would be non-functional without the compiled Vue.js assets.

;;; ── #7021 deigde ──
;;; NEEDS_RECIPE_DESIGN_EXHAUSTED — DRAGENGINE_NOT_IN_GUIX
;;; A1: Build from source (SCons + cmake) — depends on dragengine base engine
;;;     which is not in Guix; dragengine itself has a complex SCons build with
;;;     30+ optional dependencies.
;;; A2: Repack binary installer — the Linux installer is a shell script that
;;;     requires interactive installation; not suitable for Guix.
;;; A3: Package dragengine first — significant scope; the engine uses SCons
;;;     with custom build logic, glslang, nasm, patchelf, and many optional
;;;     multimedia libraries.

;;; ── #10787 crqt-ng ──
;;; NEEDS_RECIPE_DESIGN_EXHAUSTED — CRENGINE_NG_NOT_IN_GUIX
;;; A1: cmake-build-system from GitLab — depends on crengine-ng (CoolReader
;;;     engine), fribidi, libunibreak, Qt6; crengine-ng is not in Guix.
;;; A2: Package crengine-ng first — the engine is a separate GitLab project
;;;     with its own cmake build and dependencies (freetype, harfbuzz, libjpeg,
;;;     libpng, zlib, etc.); medium scope.
;;; A3: No binary releases exist; no alternative e-book rendering engine
;;;     can substitute for crengine-ng.

;;; ── #7752 libloot ──
;;; NEEDS_RECIPE_DESIGN_EXHAUSTED — CARGO_DEPS_NEEDED
;;; A1: cargo-build-system from GitHub — Rust project with 50+ crate
;;;     dependencies that would need individual Guix packaging.
;;; A2: No Linux binary releases — only Windows .7z binaries published.
;;; A3: guix import crate produces incomplete results; many transitive crates
;;;     are missing from Guix repositories.

;;; ── #7741 bootc ──
;;; NEEDS_RECIPE_DESIGN_EXHAUSTED — CARGO_DEPS_NEEDED + GUIX_INCOMPATIBLE
;;; A1: cargo-build-system with vendored deps tarball — Rust project with
;;;     vendored deps available but still needs ostree/OCI container runtime
;;;     infrastructure not well-supported in Guix.
;;; A2: The tool is designed for OCI container-based OS updates (bootable
;;;     container images); conceptually incompatible with Guix System's
;;;     declarative system management model.
;;; A3: Build from vendored source — even with vendored crates, runtime
;;;     requires skopeo, podman, and ostree ecosystem integration.
