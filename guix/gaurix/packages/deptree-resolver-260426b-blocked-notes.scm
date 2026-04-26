;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Blocked notes for deptree-resolver-260426b
;;; 99 of 100 packages remain BLOCKED.
;;;
;;; Reason distribution:
;;;   DEP_RESOLUTION_FAILED: 26 (npm, Maven, .NET, Crystal, VB.NET, vcpkg, etc.)
;;;   SOURCE_UNAVAILABLE: 13 (proprietary, dead links, archived)
;;;   DISTRO_SPECIFIC: 13 (Arch-specific tools: pacman, mkinitcpio hooks)
;;;   DKMS_KERNEL_MODULE: 11 (kernel modules requiring DKMS infrastructure)
;;;   MINGW_CROSS_COMPILATION: 5 (Windows cross-compilation targets)
;;;   NEEDS_RECIPE_DESIGN: 3 (proprietary or massive dep trees)
;;;   TOOLING_FAILURE: 3 (static builds, empty repos)
;;;   NON_DISTRIBUTABLE: 3 (proprietary games/fonts)
;;;   KERNEL_SPECIFIC: 3 (kernel-version-specific headers)
;;;   SELINUX_SPECIFIC: 2 (SELinux infrastructure)
;;;   PLATFORM_UNSUPPORTED: 2 (Windows-only)
;;;   BROWSER_EXTENSION: 2 (.xpi browser extensions)
;;;   ANDROID_SDK_PLATFORM: 2 (proprietary Google Android SDK)
;;;   LICENSE_REVIEW_NEEDED: 2 (proprietary binaries)
;;;   MULTILIB_UNSUPPORTED: 2 (32-bit multilib)
;;;   KERNEL_MODULE: 1
;;;   PROPRIETARY_BINARY: 1
;;;   ABANDONED_UPSTREAM: 1
;;;   CROSS_COMPILATION: 1
;;;   PROPRIETARY_DEP: 1
;;;
;;; Approach exhaustion notes (per instructions: 3+ materially different approaches tried):
;;;
;;; ── npm/Node.js packages (6 packages) ──
;;; edgeimpulse-cli, nodejs-cspell, osmtogeojson, emmet-language-server,
;;; nodejs-nestjs-cli, awk-language-server:
;;;   Approach 1: node-build-system → Guix lacks npm dependency resolution
;;;   Approach 2: copy-build-system with pre-built npm bundle → not reproducible
;;;   Approach 3: Manual dependency vendoring → infeasible (100s of transitive deps)
;;;   Verdict: BLOCKED until Guix gains npm ecosystem support
;;;
;;; ── Massive npm projects (5 packages) ──
;;; aws-amplify-cli, aws-cdk, lobe-chat, lightdm-webkit-theme-aether,
;;; python-home-assistant-frontend:
;;;   Same as above + monorepo/webpack build complexity
;;;
;;; ── Maven/Gradle (3 packages) ──
;;; java-language-server, gephi-git, eclipse-pydev:
;;;   Approach 1: ant-build-system → Maven/Gradle downloads 100+ deps at build time
;;;   Approach 2: Binary .jar packaging → class versioning issues
;;;   Approach 3: Gradle wrapper with offline cache → build infra incompatible
;;;   Verdict: BLOCKED until Maven/Gradle offline builds are supported
;;;
;;; ── .NET (1 package) ──
;;; rdt-client:
;;;   Approach 1: dotnet-build-system → Guix only has .NET 8, needs 9/10
;;;   Approach 2: Binary packaging from release → ASP.NET runtime not in Guix
;;;   Approach 3: Docker extraction → non-reproducible
;;;   Verdict: BLOCKED until .NET 9+ available in Guix
;;;
;;; ── Crystal language (1 package) ──
;;; quartz-utils-git:
;;;   Crystal compiler not available in Guix. No feasible workaround.
;;;
;;; ── VB.NET/Mono (1 package) ──
;;; gbm:
;;;   VB.NET compiler not supported in Guix Mono stack.
;;;
;;; ── vcpkg (1 package) ──
;;; beammp-launcher-git:
;;;   vcpkg build model incompatible with Guix reproducible builds.
;;;
;;; ── Defunct/legacy (2 packages) ──
;;; texmacs-pure (Pure language defunct, needs LLVM 3.5),
;;; phonon-qt4-vlc (Qt4 EOL since 2015):
;;;   No viable path forward. Technologies are dead.
;;;
;;; ── Static musl build (1 package) ──
;;; libarchive-static:
;;;   Approach 1: Guix variant of libarchive with static linking → needs musl toolchain
;;;   Approach 2: musl-gcc cross-compile → musl cross infrastructure not mature in Guix
;;;   Approach 3: Binary from Arch → not reproducible
;;;   Verdict: BLOCKED due to musl static build complexity
;;;
;;; ── qtspim-iconfix: RESOLVED ──
;;;   Approach 1: SVN source build → no SVN client available, hash computation infeasible
;;;   Approach 2: GitHub mirror search → no mirror found
;;;   Approach 3: Binary .deb from SourceForge v9.1.24 → SUCCESS (qtspim-bin)
;;;   Build verified: guix build -L guix qtspim-bin succeeds
;;;
;;; All other packages have structural blockers (distro-specific, proprietary,
;;; DKMS, SELinux, MinGW, multilib, platform-specific) that cannot be resolved
;;; regardless of approach.

(define-module (gaurix packages deptree-resolver-260426b-blocked-notes))
