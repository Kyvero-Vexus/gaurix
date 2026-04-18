;;; recipe-resolver-260418ac — blocked/exhausted notes
;;;
;;; 10 packages evaluated as NEEDS_RECIPE_DESIGN_EXHAUSTED:
;;;
;;; 21. vibe-audio-visualizer-git
;;;     UNKNOWN_UPSTREAM: AUR package with no upstream URL in metadata.
;;;     A1: searched GitHub/GitLab — no matching project found.
;;;     A2: AUR PKGBUILD unavailable for source extraction.
;;;     A3: cannot package without upstream source location.
;;;
;;; 22. autofirma
;;;     JAVA_COMPLEX: Spanish government @firma digital signing tool.
;;;     A1: requires 20+ Java libraries (BouncyCastle, JMulTiCard, etc.).
;;;     A2: Maven build with complex Java dependency chain not in Guix.
;;;     A3: government-specific tool with limited audience outside Spain.
;;;
;;; 23. wazuh-agent
;;;     COMPLEX_BUILD: open-source security monitoring agent (C/C++).
;;;     A1: build system needs cmake + 30+ dependencies (OpenSSL, systemd,
;;;         audit, etc.) with custom patching for each platform.
;;;     A2: requires systemd for service management; Guix uses Shepherd.
;;;     A3: agent needs server infrastructure (wazuh-manager) to function.
;;;
;;; 24. btrustbiss
;;;     PROPRIETARY: B-Trust BISS is a proprietary Bulgarian smartcard
;;;     middleware for electronic signatures.
;;;     A1: closed-source binary; no source code available.
;;;     A2: proprietary license prohibits redistribution.
;;;     A3: requires specific hardware (B-Trust smartcards).
;;;
;;; 25. ollama-for-amd
;;;     COMPLEX_BUILD: Ollama fork with AMD ROCm GPU support.
;;;     A1: requires ROCm/HIP compute stack (not in Guix) — massive
;;;         GPU compute framework with 50+ components.
;;;     A2: Go build with CGo/C++ linking to ROCm libraries.
;;;     A3: standard Ollama (without ROCm) is equally complex due to
;;;         llama.cpp C++ backend and Go module dependencies.
;;;
;;; 26. rollup
;;;     NPM_ECOSYSTEM: Rollup.js JavaScript module bundler.
;;;     A1: npm package with 100+ transitive dependencies.
;;;     A2: Guix node-build-system cannot handle deep npm dep trees.
;;;     A3: self-hosted (uses itself to build), bootstrapping problem.
;;;
;;; 27. flow-control-git
;;;     UNKNOWN_UPSTREAM: cannot determine upstream source repository.
;;;     A1: AUR metadata provides no upstream URL.
;;;     A2: generic name yields no matching GitHub/GitLab project.
;;;     A3: cannot package without identifiable source.
;;;
;;; 28. osaka-simulator
;;;     UNKNOWN_UPSTREAM: cannot determine upstream source.
;;;     A1: AUR metadata has no upstream URL.
;;;     A2: no matching project found on GitHub/GitLab/SourceForge.
;;;     A3: cannot package without identifiable source repository.
;;;
;;; 29. outfieldr-git
;;;     UNKNOWN_UPSTREAM: cannot locate upstream repository.
;;;     A1: AUR metadata provides no upstream URL.
;;;     A2: searched GitHub/GitLab — no matching project found.
;;;     A3: cannot package without upstream source.
;;;
;;; 30. grimaur-git
;;;     UNKNOWN_UPSTREAM: cannot locate upstream repository.
;;;     A1: AUR metadata has no source URL.
;;;     A2: name search on GitHub/GitLab yields no results.
;;;     A3: cannot package without upstream source.
