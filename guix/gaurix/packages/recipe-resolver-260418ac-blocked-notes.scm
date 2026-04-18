;;; recipe-resolver-260418ac — blocked/exhausted notes
;;;
;;; 10 packages evaluated as NEEDS_RECIPE_DESIGN_EXHAUSTED:
;;;
;;; 21. vibe-audio-visualizer-git
;;;     CARGO_VULKAN_COMPLEX: upstream at github.com/TornaxO7/vibe (Rust/Cargo).
;;;     A1: requires Vulkan/WGPU + Wayland-specific GPU pipeline — complex deps.
;;;     A2: cargo-build-system needs enumeration of all transitive crate deps.
;;;     A3: unclear license status; niche tool with minimal user base.
;;;
;;; 22. autofirma
;;;     JAVA_COMPLEX: Spanish government @firma digital signing tool
;;;     (github.com/ctt-gob-es/clienteafirma, GPL-2.0+/EUPL).
;;;     A1: requires 20+ Java libraries (BouncyCastle, JMulTiCard, etc.).
;;;     A2: Maven build with complex Java dependency chain not in Guix.
;;;     A3: government-specific tool with limited audience outside Spain.
;;;
;;; 23. wazuh-agent
;;;     COMPLEX_BUILD: open-source security monitoring agent
;;;     (github.com/wazuh/wazuh-agent, GPL-2.0, cmake/C++).
;;;     A1: build system needs cmake + 30+ dependencies (OpenSSL, systemd,
;;;         audit, etc.) with custom patching for each platform.
;;;     A2: requires systemd for service management; Guix uses Shepherd.
;;;     A3: agent needs server infrastructure (wazuh-manager) to function.
;;;
;;; 24. btrustbiss
;;;     PROPRIETARY: B-Trust BISS is a proprietary Bulgarian smartcard
;;;     middleware for electronic signatures (b-trust.bg).
;;;     A1: closed-source binary; no source code available.
;;;     A2: proprietary license prohibits redistribution.
;;;     A3: requires specific hardware (B-Trust smartcards).
;;;
;;; 25. ollama-for-amd
;;;     COMPLEX_BUILD: unofficial Ollama fork with AMD GPU ID patches
;;;     (github.com/likelovewant/ollama-for-amd, MIT).
;;;     A1: requires ROCm/HIP compute stack (not in Guix) — massive
;;;         GPU compute framework with 50+ components.
;;;     A2: Go build with CGo/C++ linking to ROCm libraries.
;;;     A3: unofficial fork; should package upstream ollama instead.
;;;
;;; 26. rollup
;;;     NPM_ECOSYSTEM: Rollup.js JavaScript module bundler
;;;     (github.com/rollup/rollup, MIT).
;;;     A1: npm package with 100+ transitive dependencies.
;;;     A2: Guix node-build-system cannot handle deep npm dep trees.
;;;     A3: self-hosted (uses itself to build), bootstrapping problem.
;;;
;;; 27. flow-control-git
;;;     ZIG_NOT_IN_GUIX: text editor at github.com/neurocyte/flow (MIT).
;;;     A1: Zig build system not supported in Guix.
;;;     A2: many vendored Zig dependencies.
;;;     A3: no alternative build system or binary releases.
;;;
;;; 28. osaka-simulator
;;;     WINE_WRAPPER: Windows-only freeware game on archive.org.
;;;     A1: requires Wine + winetricks for Windows binary.
;;;     A2: not a native Linux build; no source code available.
;;;     A3: freeware but not free software; cannot redistribute.
;;;
;;; 29. outfieldr-git
;;;     ZIG_NOT_IN_GUIX: CSV/TSV viewer at gitlab.com/ve-nt/outfieldr (MIT).
;;;     A1: Zig build system not supported in Guix.
;;;     A2: multiple vendored Zig dependencies.
;;;     A3: no alternative build system or binary releases.
;;;
;;; 30. grimaur-git
;;;     ARCH_SPECIFIC: AUR helper tool at github.com/ryk4rd/grimaur.
;;;     A1: Arch Linux-specific tool wrapping pacman/AUR functionality.
;;;     A2: useless outside Arch Linux; depends on pacman infrastructure.
;;;     A3: no portable upstream or meaningful use case in Guix.
